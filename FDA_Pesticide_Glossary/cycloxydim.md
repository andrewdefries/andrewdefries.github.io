---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-3.407734, -0.4476934, -0.5923649, 1, 0, 0, 1,
-3.097365, 0.393425, -0.4244983, 1, 0.007843138, 0, 1,
-2.680893, -0.6437591, -1.587243, 1, 0.01176471, 0, 1,
-2.61924, -0.7714092, -1.519049, 1, 0.01960784, 0, 1,
-2.617767, 2.256711, -1.223501, 1, 0.02352941, 0, 1,
-2.604049, 1.892204, -0.341075, 1, 0.03137255, 0, 1,
-2.590543, 0.8224792, -2.401602, 1, 0.03529412, 0, 1,
-2.549904, -0.122308, -1.8309, 1, 0.04313726, 0, 1,
-2.502296, 1.670558, -1.528269, 1, 0.04705882, 0, 1,
-2.493798, 0.230768, -0.781876, 1, 0.05490196, 0, 1,
-2.401033, 1.190655, -1.551383, 1, 0.05882353, 0, 1,
-2.289268, -1.413518, -2.888222, 1, 0.06666667, 0, 1,
-2.267238, -1.753167, -3.122787, 1, 0.07058824, 0, 1,
-2.250268, -0.6768262, -2.958927, 1, 0.07843138, 0, 1,
-2.216278, -0.4974231, -3.138271, 1, 0.08235294, 0, 1,
-2.208262, -0.5419639, -2.737715, 1, 0.09019608, 0, 1,
-2.189581, -0.2960593, -0.5990683, 1, 0.09411765, 0, 1,
-2.179691, -0.2496899, -3.718658, 1, 0.1019608, 0, 1,
-2.165987, 0.1824794, -0.7539351, 1, 0.1098039, 0, 1,
-2.145838, -0.5738648, -1.267136, 1, 0.1137255, 0, 1,
-2.130387, 0.4112114, -2.563063, 1, 0.1215686, 0, 1,
-2.09128, -0.3851551, -0.3251761, 1, 0.1254902, 0, 1,
-1.972964, -0.7914395, -1.044314, 1, 0.1333333, 0, 1,
-1.945176, 2.317363, -0.926901, 1, 0.1372549, 0, 1,
-1.933403, 0.8005509, -2.312767, 1, 0.145098, 0, 1,
-1.92745, -0.4903974, -1.667927, 1, 0.1490196, 0, 1,
-1.868021, -1.449515, -0.5376377, 1, 0.1568628, 0, 1,
-1.858218, -0.6155039, -1.74628, 1, 0.1607843, 0, 1,
-1.857466, -0.6283911, -1.0863, 1, 0.1686275, 0, 1,
-1.855356, 0.3060233, 0.1305071, 1, 0.172549, 0, 1,
-1.853893, 0.0912469, -0.3540662, 1, 0.1803922, 0, 1,
-1.84673, 0.06510875, -0.7430357, 1, 0.1843137, 0, 1,
-1.828305, 1.468677, -1.067401, 1, 0.1921569, 0, 1,
-1.826083, 1.110777, -1.503435, 1, 0.1960784, 0, 1,
-1.824814, -1.797778, -2.621511, 1, 0.2039216, 0, 1,
-1.812825, 1.542313, -0.6776182, 1, 0.2117647, 0, 1,
-1.807888, 2.260271, -0.1286813, 1, 0.2156863, 0, 1,
-1.806734, 1.614986, -3.116338, 1, 0.2235294, 0, 1,
-1.799746, -0.9179616, -1.360214, 1, 0.227451, 0, 1,
-1.781476, 0.5904593, -2.603348, 1, 0.2352941, 0, 1,
-1.776936, 1.092207, -0.6598549, 1, 0.2392157, 0, 1,
-1.758101, 0.6553121, -1.245193, 1, 0.2470588, 0, 1,
-1.742708, -1.222712, -1.194218, 1, 0.2509804, 0, 1,
-1.722242, 0.9887831, -2.85874, 1, 0.2588235, 0, 1,
-1.715064, 2.018055, -0.01770917, 1, 0.2627451, 0, 1,
-1.701194, 0.218284, -1.855897, 1, 0.2705882, 0, 1,
-1.696315, 1.097205, -1.410691, 1, 0.2745098, 0, 1,
-1.692048, 0.1033421, -1.985865, 1, 0.282353, 0, 1,
-1.688814, 1.568675, -1.384531, 1, 0.2862745, 0, 1,
-1.68176, -0.2245062, -3.085489, 1, 0.2941177, 0, 1,
-1.667034, -3.627259, -2.69617, 1, 0.3019608, 0, 1,
-1.663156, -0.3199574, -2.188458, 1, 0.3058824, 0, 1,
-1.653245, 0.03058904, -2.315626, 1, 0.3137255, 0, 1,
-1.64387, 1.703737, -1.197604, 1, 0.3176471, 0, 1,
-1.642063, 0.2583734, -1.315006, 1, 0.3254902, 0, 1,
-1.631409, -1.25892, -3.001663, 1, 0.3294118, 0, 1,
-1.6258, 0.8862358, -2.310804, 1, 0.3372549, 0, 1,
-1.622953, 1.095688, 0.08162637, 1, 0.3411765, 0, 1,
-1.59818, -0.3063655, -2.521505, 1, 0.3490196, 0, 1,
-1.590276, -1.446492, -2.374226, 1, 0.3529412, 0, 1,
-1.589454, 0.9250011, -1.71944, 1, 0.3607843, 0, 1,
-1.571904, -0.5380844, -2.852646, 1, 0.3647059, 0, 1,
-1.557857, -0.6688263, -1.853977, 1, 0.372549, 0, 1,
-1.554723, -0.1077666, -1.52134, 1, 0.3764706, 0, 1,
-1.549701, -0.1281995, -1.980015, 1, 0.3843137, 0, 1,
-1.548802, 1.220058, -3.128377, 1, 0.3882353, 0, 1,
-1.548196, 1.799008, -0.3885154, 1, 0.3960784, 0, 1,
-1.544273, 0.758794, -1.985264, 1, 0.4039216, 0, 1,
-1.51377, -0.7631364, -2.205408, 1, 0.4078431, 0, 1,
-1.503939, -0.5606766, -1.517292, 1, 0.4156863, 0, 1,
-1.502213, -0.5645092, -0.1926955, 1, 0.4196078, 0, 1,
-1.494358, -0.436164, -1.84599, 1, 0.427451, 0, 1,
-1.485316, -1.847644, -2.252243, 1, 0.4313726, 0, 1,
-1.484149, 0.5258427, -0.1167428, 1, 0.4392157, 0, 1,
-1.473636, -0.8770123, -0.9802768, 1, 0.4431373, 0, 1,
-1.469155, -0.7299513, -1.407131, 1, 0.4509804, 0, 1,
-1.458216, -0.2076254, -2.54869, 1, 0.454902, 0, 1,
-1.45561, 1.24123, -1.90451, 1, 0.4627451, 0, 1,
-1.448007, -0.5291016, -2.50248, 1, 0.4666667, 0, 1,
-1.443876, 2.567044, -0.3336443, 1, 0.4745098, 0, 1,
-1.441547, 0.3663467, -2.735872, 1, 0.4784314, 0, 1,
-1.431004, 1.142062, -2.002219, 1, 0.4862745, 0, 1,
-1.390949, 1.821114, -0.386679, 1, 0.4901961, 0, 1,
-1.386317, 0.3780858, -2.282608, 1, 0.4980392, 0, 1,
-1.382681, -1.251166, -1.959852, 1, 0.5058824, 0, 1,
-1.36627, 1.135442, 0.6727418, 1, 0.509804, 0, 1,
-1.360798, -1.916743, -1.15483, 1, 0.5176471, 0, 1,
-1.360082, 0.7182103, -1.351401, 1, 0.5215687, 0, 1,
-1.359019, 1.475421, 0.5904503, 1, 0.5294118, 0, 1,
-1.353367, 2.108273, 0.9656052, 1, 0.5333334, 0, 1,
-1.352978, -0.7484714, -0.6909846, 1, 0.5411765, 0, 1,
-1.339743, 1.436174, 0.192185, 1, 0.5450981, 0, 1,
-1.332769, 0.2094153, -0.668914, 1, 0.5529412, 0, 1,
-1.325874, -1.753191, -3.200397, 1, 0.5568628, 0, 1,
-1.315594, 0.8209568, -2.961777, 1, 0.5647059, 0, 1,
-1.295714, 0.3349252, -2.639621, 1, 0.5686275, 0, 1,
-1.292455, -1.03047, -4.128241, 1, 0.5764706, 0, 1,
-1.289044, -2.249484, -3.320906, 1, 0.5803922, 0, 1,
-1.288751, -0.09590077, -1.541488, 1, 0.5882353, 0, 1,
-1.274857, 0.627874, -1.816477, 1, 0.5921569, 0, 1,
-1.272605, -0.0009955384, -1.423592, 1, 0.6, 0, 1,
-1.271368, 0.31732, -3.342411, 1, 0.6078432, 0, 1,
-1.26188, 0.3773624, -1.502885, 1, 0.6117647, 0, 1,
-1.258972, -1.046985, -0.7485548, 1, 0.6196079, 0, 1,
-1.239277, 0.6327893, -0.7519739, 1, 0.6235294, 0, 1,
-1.237206, 0.481939, -0.899419, 1, 0.6313726, 0, 1,
-1.228144, -1.038853, -3.634355, 1, 0.6352941, 0, 1,
-1.214328, -0.259979, -2.343835, 1, 0.6431373, 0, 1,
-1.207587, -0.1488538, -2.117002, 1, 0.6470588, 0, 1,
-1.200152, -0.3426637, -0.439934, 1, 0.654902, 0, 1,
-1.194779, 0.4092614, -2.062, 1, 0.6588235, 0, 1,
-1.185574, 0.3002688, -3.638747, 1, 0.6666667, 0, 1,
-1.17663, -0.8153346, -1.961127, 1, 0.6705883, 0, 1,
-1.176113, 1.224526, -0.8715427, 1, 0.6784314, 0, 1,
-1.170865, 0.5296882, -0.4789234, 1, 0.682353, 0, 1,
-1.168834, 1.135596, -1.828466, 1, 0.6901961, 0, 1,
-1.166121, 0.6033254, -1.598071, 1, 0.6941177, 0, 1,
-1.153478, -1.460606, -4.369052, 1, 0.7019608, 0, 1,
-1.150962, 0.3678505, -1.002324, 1, 0.7098039, 0, 1,
-1.148796, -0.6628747, -0.5547972, 1, 0.7137255, 0, 1,
-1.145479, 0.4815699, -1.577499, 1, 0.7215686, 0, 1,
-1.142361, -0.5742041, -1.520661, 1, 0.7254902, 0, 1,
-1.142144, -0.3459739, -2.593837, 1, 0.7333333, 0, 1,
-1.13687, 0.02258982, -1.220959, 1, 0.7372549, 0, 1,
-1.136479, 0.5729409, -0.4136564, 1, 0.7450981, 0, 1,
-1.135889, -0.3020023, -1.232575, 1, 0.7490196, 0, 1,
-1.135016, 0.818298, -1.230559, 1, 0.7568628, 0, 1,
-1.131095, 0.5548759, -2.028804, 1, 0.7607843, 0, 1,
-1.122864, -1.562821, -2.650764, 1, 0.7686275, 0, 1,
-1.109012, 0.3467118, -2.740031, 1, 0.772549, 0, 1,
-1.108429, 0.3777096, 0.496429, 1, 0.7803922, 0, 1,
-1.101246, 0.7134241, -1.522511, 1, 0.7843137, 0, 1,
-1.098003, -1.676312, -2.019691, 1, 0.7921569, 0, 1,
-1.095804, -1.538131, -4.068478, 1, 0.7960784, 0, 1,
-1.091847, 0.03946459, -0.92206, 1, 0.8039216, 0, 1,
-1.087752, 0.6890109, -0.3532131, 1, 0.8117647, 0, 1,
-1.078686, 1.180482, -0.39763, 1, 0.8156863, 0, 1,
-1.07116, -1.158285, -1.98898, 1, 0.8235294, 0, 1,
-1.064878, 1.428817, -0.05606212, 1, 0.827451, 0, 1,
-1.06377, -0.2289089, -0.555643, 1, 0.8352941, 0, 1,
-1.062736, 0.4490736, -1.773183, 1, 0.8392157, 0, 1,
-1.058831, 0.02808838, -1.356766, 1, 0.8470588, 0, 1,
-1.047149, -0.1683585, -1.947798, 1, 0.8509804, 0, 1,
-1.046286, -1.591365, -4.368007, 1, 0.8588235, 0, 1,
-1.045781, -1.179104, -4.664116, 1, 0.8627451, 0, 1,
-1.045659, 0.00434862, -1.663397, 1, 0.8705882, 0, 1,
-1.04557, 0.3481843, -0.8930178, 1, 0.8745098, 0, 1,
-1.040838, -0.3791713, -0.626851, 1, 0.8823529, 0, 1,
-1.04061, 0.9093869, -1.906944, 1, 0.8862745, 0, 1,
-1.039181, -0.8470361, 1.584749, 1, 0.8941177, 0, 1,
-1.036045, -1.326845, -1.253378, 1, 0.8980392, 0, 1,
-1.0348, 0.1841682, 0.1747232, 1, 0.9058824, 0, 1,
-1.032014, 0.4821915, -1.605906, 1, 0.9137255, 0, 1,
-1.030837, 0.7262141, -1.819878, 1, 0.9176471, 0, 1,
-1.02846, -1.216285, -1.226512, 1, 0.9254902, 0, 1,
-1.02588, -0.6912621, -0.7472652, 1, 0.9294118, 0, 1,
-1.025304, -0.7685559, -2.933098, 1, 0.9372549, 0, 1,
-1.024952, -0.8731157, -3.876338, 1, 0.9411765, 0, 1,
-1.024269, 0.8593948, -1.499006, 1, 0.9490196, 0, 1,
-1.020863, 1.050195, -1.185347, 1, 0.9529412, 0, 1,
-1.011453, 0.1505521, 0.6699645, 1, 0.9607843, 0, 1,
-1.009481, 0.3125763, -0.5135671, 1, 0.9647059, 0, 1,
-1.009144, 1.516314, -0.8750353, 1, 0.972549, 0, 1,
-1.005177, 0.8506781, -2.849163, 1, 0.9764706, 0, 1,
-1.001631, -0.366311, -2.711344, 1, 0.9843137, 0, 1,
-1.000849, 1.893467, -0.8109045, 1, 0.9882353, 0, 1,
-0.998876, -0.8335284, -1.313928, 1, 0.9960784, 0, 1,
-0.998106, 0.06620771, -1.611741, 0.9960784, 1, 0, 1,
-0.9942031, 0.4507114, -1.506236, 0.9921569, 1, 0, 1,
-0.9920129, -0.4798258, -2.019602, 0.9843137, 1, 0, 1,
-0.9844263, 0.7667295, -0.07511634, 0.9803922, 1, 0, 1,
-0.9828201, -0.263427, 0.961524, 0.972549, 1, 0, 1,
-0.9764455, 0.2810934, -0.3193561, 0.9686275, 1, 0, 1,
-0.9666323, 0.796082, -0.4874324, 0.9607843, 1, 0, 1,
-0.9505503, 1.876548, -1.793725, 0.9568627, 1, 0, 1,
-0.9461048, 0.3213235, -0.6691638, 0.9490196, 1, 0, 1,
-0.9460672, -1.88638, -4.128964, 0.945098, 1, 0, 1,
-0.9451141, -0.4409393, -1.520472, 0.9372549, 1, 0, 1,
-0.9374581, -1.85734, -2.384953, 0.9333333, 1, 0, 1,
-0.9368581, 0.3943485, -1.141125, 0.9254902, 1, 0, 1,
-0.9338003, 0.07286117, -1.654975, 0.9215686, 1, 0, 1,
-0.9286461, 0.4846688, -2.119029, 0.9137255, 1, 0, 1,
-0.9248254, 2.144152, -2.732685, 0.9098039, 1, 0, 1,
-0.9183215, 0.1788764, -1.686002, 0.9019608, 1, 0, 1,
-0.9133969, -0.383796, -2.91581, 0.8941177, 1, 0, 1,
-0.9126306, -2.117476, -1.618636, 0.8901961, 1, 0, 1,
-0.9104884, 0.6594228, -2.191425, 0.8823529, 1, 0, 1,
-0.9036134, -1.500187, -3.578872, 0.8784314, 1, 0, 1,
-0.8973865, -1.61636, -5.102302, 0.8705882, 1, 0, 1,
-0.8971281, -1.626643, -3.843803, 0.8666667, 1, 0, 1,
-0.8890339, 1.538721, -1.326125, 0.8588235, 1, 0, 1,
-0.8848661, -0.4414559, -3.026703, 0.854902, 1, 0, 1,
-0.8811362, 0.3731985, -1.071304, 0.8470588, 1, 0, 1,
-0.8722467, -1.26115, -1.604284, 0.8431373, 1, 0, 1,
-0.8717615, 0.6370141, 0.6971206, 0.8352941, 1, 0, 1,
-0.8713529, 0.4136156, -1.077306, 0.8313726, 1, 0, 1,
-0.870821, -1.597417, -4.357851, 0.8235294, 1, 0, 1,
-0.8639376, 0.372268, -1.795738, 0.8196079, 1, 0, 1,
-0.8590721, 1.201819, 0.4985343, 0.8117647, 1, 0, 1,
-0.8589057, 0.6534601, 0.06530232, 0.8078431, 1, 0, 1,
-0.8582304, -0.6134534, -3.257789, 0.8, 1, 0, 1,
-0.8522726, -0.6574828, -2.274462, 0.7921569, 1, 0, 1,
-0.8475685, 0.8049937, -0.01811294, 0.7882353, 1, 0, 1,
-0.8430193, -1.214631, -2.944831, 0.7803922, 1, 0, 1,
-0.8338676, -0.5410551, -3.145658, 0.7764706, 1, 0, 1,
-0.8335204, 0.6594359, -0.8509452, 0.7686275, 1, 0, 1,
-0.8328726, 0.6929486, -0.407147, 0.7647059, 1, 0, 1,
-0.8325791, -0.4312996, -3.223093, 0.7568628, 1, 0, 1,
-0.8318041, -1.16216, -2.654326, 0.7529412, 1, 0, 1,
-0.8285972, -0.08098659, -2.831702, 0.7450981, 1, 0, 1,
-0.8284771, -0.2001317, -1.572773, 0.7411765, 1, 0, 1,
-0.8249061, 1.132004, -1.366226, 0.7333333, 1, 0, 1,
-0.8234552, -0.5547258, -2.791374, 0.7294118, 1, 0, 1,
-0.8209835, 0.8516814, -0.8451645, 0.7215686, 1, 0, 1,
-0.8204487, 1.012645, -1.922572, 0.7176471, 1, 0, 1,
-0.8142232, 0.2701575, -1.589606, 0.7098039, 1, 0, 1,
-0.8125659, -0.9394871, -2.646636, 0.7058824, 1, 0, 1,
-0.8093836, -0.1594514, -2.447648, 0.6980392, 1, 0, 1,
-0.8066948, -0.5799139, -2.500294, 0.6901961, 1, 0, 1,
-0.7970495, 0.1125675, -0.9899089, 0.6862745, 1, 0, 1,
-0.7951558, -0.5416927, -2.390508, 0.6784314, 1, 0, 1,
-0.7852696, 1.091276, 0.2648199, 0.6745098, 1, 0, 1,
-0.779041, -0.6739717, -1.094878, 0.6666667, 1, 0, 1,
-0.7778962, 0.436125, -0.3799252, 0.6627451, 1, 0, 1,
-0.7772961, -1.016054, -4.090464, 0.654902, 1, 0, 1,
-0.7759542, 1.137305, -1.52273, 0.6509804, 1, 0, 1,
-0.7749624, -0.6326352, -3.124744, 0.6431373, 1, 0, 1,
-0.7748626, -0.7623067, -2.880456, 0.6392157, 1, 0, 1,
-0.7677444, -0.5468696, -2.560112, 0.6313726, 1, 0, 1,
-0.7629782, -2.793134, -3.194105, 0.627451, 1, 0, 1,
-0.7569916, -0.983925, -1.720458, 0.6196079, 1, 0, 1,
-0.7565875, 0.5688011, -0.3827435, 0.6156863, 1, 0, 1,
-0.7558952, 1.32539, -0.1220853, 0.6078432, 1, 0, 1,
-0.7550583, 0.3732556, -0.3936746, 0.6039216, 1, 0, 1,
-0.7457751, -2.240252, -3.717194, 0.5960785, 1, 0, 1,
-0.7428815, -0.8022916, -3.790466, 0.5882353, 1, 0, 1,
-0.7425521, 0.1719531, -2.822113, 0.5843138, 1, 0, 1,
-0.7416737, 2.042366, 0.02500145, 0.5764706, 1, 0, 1,
-0.7409964, -1.378039, -4.940717, 0.572549, 1, 0, 1,
-0.7398761, -2.022763, -0.7598196, 0.5647059, 1, 0, 1,
-0.7396947, -2.691113, -0.5392721, 0.5607843, 1, 0, 1,
-0.7373892, -0.611807, -2.282867, 0.5529412, 1, 0, 1,
-0.7333092, -0.3528658, -1.692049, 0.5490196, 1, 0, 1,
-0.7285715, -0.5075046, -2.07295, 0.5411765, 1, 0, 1,
-0.7277054, 0.6752805, -2.076047, 0.5372549, 1, 0, 1,
-0.7275907, -1.432573, -1.744074, 0.5294118, 1, 0, 1,
-0.7126166, 1.066785, -1.388906, 0.5254902, 1, 0, 1,
-0.7103339, 0.1329375, -0.772608, 0.5176471, 1, 0, 1,
-0.709197, 0.8251289, 0.6555815, 0.5137255, 1, 0, 1,
-0.7064196, 1.57157, -0.4924281, 0.5058824, 1, 0, 1,
-0.7060658, 0.5115923, -2.226053, 0.5019608, 1, 0, 1,
-0.7046486, 0.166113, -2.796439, 0.4941176, 1, 0, 1,
-0.6981352, -0.6712412, -2.519276, 0.4862745, 1, 0, 1,
-0.6960873, -1.268212, -1.760811, 0.4823529, 1, 0, 1,
-0.695778, -0.7780601, -1.7243, 0.4745098, 1, 0, 1,
-0.6955078, -1.647545, -1.610601, 0.4705882, 1, 0, 1,
-0.6940383, 0.5101204, -0.5748691, 0.4627451, 1, 0, 1,
-0.6925365, -0.8866352, -2.436972, 0.4588235, 1, 0, 1,
-0.6914656, -1.302038, -3.348333, 0.4509804, 1, 0, 1,
-0.690931, 0.6989428, -1.679053, 0.4470588, 1, 0, 1,
-0.6868817, -0.6155754, -1.483233, 0.4392157, 1, 0, 1,
-0.6849862, 0.685385, -0.1731102, 0.4352941, 1, 0, 1,
-0.679153, 0.2892645, -1.115152, 0.427451, 1, 0, 1,
-0.675505, -0.1421621, -2.400707, 0.4235294, 1, 0, 1,
-0.6734063, 1.678503, -0.9296668, 0.4156863, 1, 0, 1,
-0.6720621, -1.367682, -4.28597, 0.4117647, 1, 0, 1,
-0.6669031, 1.571527, -0.6175563, 0.4039216, 1, 0, 1,
-0.6579971, -1.226354, -2.309311, 0.3960784, 1, 0, 1,
-0.6570253, -0.2621074, -1.189765, 0.3921569, 1, 0, 1,
-0.6521241, -1.270188, -2.695325, 0.3843137, 1, 0, 1,
-0.6459059, 0.1666172, -2.569942, 0.3803922, 1, 0, 1,
-0.6455498, -1.585813, -3.645352, 0.372549, 1, 0, 1,
-0.6440948, 1.515322, -0.1474034, 0.3686275, 1, 0, 1,
-0.6413704, -1.29837, -1.024194, 0.3607843, 1, 0, 1,
-0.6369363, -0.1960643, -1.763563, 0.3568628, 1, 0, 1,
-0.6355931, 1.339685, 0.04438262, 0.3490196, 1, 0, 1,
-0.6317387, 2.195791, 2.464713, 0.345098, 1, 0, 1,
-0.6297762, -1.809536, -4.235954, 0.3372549, 1, 0, 1,
-0.6252806, -0.9577156, -3.01255, 0.3333333, 1, 0, 1,
-0.6234307, 1.681088, 1.36136, 0.3254902, 1, 0, 1,
-0.6230548, -0.3414007, -2.323501, 0.3215686, 1, 0, 1,
-0.6214467, -0.817382, -2.262963, 0.3137255, 1, 0, 1,
-0.6200279, -2.172174, -4.201285, 0.3098039, 1, 0, 1,
-0.6197704, -1.984174, -4.048072, 0.3019608, 1, 0, 1,
-0.6191874, 0.6576436, -1.73657, 0.2941177, 1, 0, 1,
-0.618128, -1.470251, -2.382752, 0.2901961, 1, 0, 1,
-0.6163545, -0.4756303, -1.622729, 0.282353, 1, 0, 1,
-0.6124349, 1.573542, -0.273764, 0.2784314, 1, 0, 1,
-0.6112039, -0.9184068, -2.511232, 0.2705882, 1, 0, 1,
-0.6029862, 0.1504963, -2.917452, 0.2666667, 1, 0, 1,
-0.6025873, -0.04861551, -1.783942, 0.2588235, 1, 0, 1,
-0.6025525, 0.9519857, -1.860731, 0.254902, 1, 0, 1,
-0.60232, 1.467878, 0.2855973, 0.2470588, 1, 0, 1,
-0.601203, -0.5044711, -3.54775, 0.2431373, 1, 0, 1,
-0.5984883, -2.225115, -4.124382, 0.2352941, 1, 0, 1,
-0.5950452, 1.251595, -0.2368618, 0.2313726, 1, 0, 1,
-0.5902872, -0.6668533, -1.337486, 0.2235294, 1, 0, 1,
-0.5880683, 1.597837, -0.04299948, 0.2196078, 1, 0, 1,
-0.5833279, -0.07923947, -2.682855, 0.2117647, 1, 0, 1,
-0.5677446, -0.1466132, 0.08731652, 0.2078431, 1, 0, 1,
-0.5673505, -0.1325949, -1.887734, 0.2, 1, 0, 1,
-0.5671794, 0.246384, -0.8511505, 0.1921569, 1, 0, 1,
-0.5665139, -0.7866962, -4.233073, 0.1882353, 1, 0, 1,
-0.5602375, -0.2709698, -1.189956, 0.1803922, 1, 0, 1,
-0.5548576, -1.728096, -2.942929, 0.1764706, 1, 0, 1,
-0.5532846, -1.649549, -1.816416, 0.1686275, 1, 0, 1,
-0.5500106, 1.44281, -0.05828537, 0.1647059, 1, 0, 1,
-0.5484155, 2.87308, 0.4401426, 0.1568628, 1, 0, 1,
-0.5481986, -0.7457031, -0.6468141, 0.1529412, 1, 0, 1,
-0.5420589, -0.2734, -2.748918, 0.145098, 1, 0, 1,
-0.5402086, 0.438285, -1.734052, 0.1411765, 1, 0, 1,
-0.5349115, -0.5329739, -2.764048, 0.1333333, 1, 0, 1,
-0.5323491, -1.882501, -2.477364, 0.1294118, 1, 0, 1,
-0.5319344, 1.527313, 0.492011, 0.1215686, 1, 0, 1,
-0.5255393, 0.1120004, -2.279449, 0.1176471, 1, 0, 1,
-0.5227882, -0.661225, -1.89386, 0.1098039, 1, 0, 1,
-0.5216858, 0.809153, 0.814131, 0.1058824, 1, 0, 1,
-0.5195751, -1.261083, -3.586526, 0.09803922, 1, 0, 1,
-0.5191572, -0.1797439, -0.3726863, 0.09019608, 1, 0, 1,
-0.5166767, -0.8345312, -2.510022, 0.08627451, 1, 0, 1,
-0.5162771, 0.5763534, -0.8529264, 0.07843138, 1, 0, 1,
-0.515098, 0.6557913, 1.117042, 0.07450981, 1, 0, 1,
-0.5138137, -0.2026219, -2.801465, 0.06666667, 1, 0, 1,
-0.5121999, -0.9012448, -2.804024, 0.0627451, 1, 0, 1,
-0.5106869, 1.97256, 1.361172, 0.05490196, 1, 0, 1,
-0.49834, 0.6545594, -0.9129726, 0.05098039, 1, 0, 1,
-0.4933153, 2.960244, -1.66509, 0.04313726, 1, 0, 1,
-0.4894782, -0.9463257, -4.970251, 0.03921569, 1, 0, 1,
-0.4890938, 0.8337633, 0.5448134, 0.03137255, 1, 0, 1,
-0.4805158, 0.5515378, -1.809315, 0.02745098, 1, 0, 1,
-0.4802779, -0.6274731, -5.126081, 0.01960784, 1, 0, 1,
-0.477144, 1.506542, 2.293684, 0.01568628, 1, 0, 1,
-0.4765365, 0.7415929, -1.402834, 0.007843138, 1, 0, 1,
-0.4724974, -0.5688992, -1.42397, 0.003921569, 1, 0, 1,
-0.471095, -0.3312098, -0.9752721, 0, 1, 0.003921569, 1,
-0.4699898, -0.1097053, -2.96866, 0, 1, 0.01176471, 1,
-0.4685356, 0.5090689, -1.502092, 0, 1, 0.01568628, 1,
-0.4683282, -1.279688, -1.816583, 0, 1, 0.02352941, 1,
-0.4673245, -0.1448847, -2.800783, 0, 1, 0.02745098, 1,
-0.4662363, 0.4676486, -1.518781, 0, 1, 0.03529412, 1,
-0.4647631, -0.4498869, -2.799942, 0, 1, 0.03921569, 1,
-0.4642073, -0.9909875, -2.705318, 0, 1, 0.04705882, 1,
-0.462746, -0.4098985, -1.878237, 0, 1, 0.05098039, 1,
-0.4619683, -0.301965, -2.927753, 0, 1, 0.05882353, 1,
-0.460127, -0.3267479, -1.569568, 0, 1, 0.0627451, 1,
-0.454953, 1.332316, -0.3973685, 0, 1, 0.07058824, 1,
-0.4541681, 0.6351393, 0.3518827, 0, 1, 0.07450981, 1,
-0.4540917, -0.2161366, -4.395519, 0, 1, 0.08235294, 1,
-0.4487036, 1.136737, -1.401778, 0, 1, 0.08627451, 1,
-0.4399997, 1.504072, 1.841227, 0, 1, 0.09411765, 1,
-0.438122, -1.51992, -1.517513, 0, 1, 0.1019608, 1,
-0.4308926, -1.76548, -2.379395, 0, 1, 0.1058824, 1,
-0.4305527, 0.3976303, -0.3420686, 0, 1, 0.1137255, 1,
-0.4236959, 0.4912273, 0.1295911, 0, 1, 0.1176471, 1,
-0.4234377, 0.1128825, 0.5191937, 0, 1, 0.1254902, 1,
-0.419793, -1.214938, -2.591442, 0, 1, 0.1294118, 1,
-0.4169728, -1.538546, -3.789754, 0, 1, 0.1372549, 1,
-0.4144578, -0.8131036, -2.60392, 0, 1, 0.1411765, 1,
-0.4139215, -0.7591866, -3.978868, 0, 1, 0.1490196, 1,
-0.4107726, 1.006086, -0.1840281, 0, 1, 0.1529412, 1,
-0.4062898, 0.01161225, -0.9295757, 0, 1, 0.1607843, 1,
-0.4057323, -0.2902863, -3.578987, 0, 1, 0.1647059, 1,
-0.4024593, -0.4900117, -1.063854, 0, 1, 0.172549, 1,
-0.4016296, -1.79458, -4.609379, 0, 1, 0.1764706, 1,
-0.40145, -0.6340442, -3.025036, 0, 1, 0.1843137, 1,
-0.3927588, -1.953941, -1.586539, 0, 1, 0.1882353, 1,
-0.3904642, 0.2442571, -0.4617303, 0, 1, 0.1960784, 1,
-0.3844502, 0.8704087, -0.7519512, 0, 1, 0.2039216, 1,
-0.3841678, -0.9271829, -3.774362, 0, 1, 0.2078431, 1,
-0.382691, -0.3798641, -3.121135, 0, 1, 0.2156863, 1,
-0.3803836, -0.4594432, -1.002563, 0, 1, 0.2196078, 1,
-0.3757419, -0.3139906, -3.402747, 0, 1, 0.227451, 1,
-0.3667567, 0.9622985, -1.588106, 0, 1, 0.2313726, 1,
-0.3662788, -1.420999, -3.51366, 0, 1, 0.2392157, 1,
-0.3597918, -1.826548, -2.959407, 0, 1, 0.2431373, 1,
-0.3597403, 0.3375698, -0.0750411, 0, 1, 0.2509804, 1,
-0.3595792, 0.6242118, -0.1067695, 0, 1, 0.254902, 1,
-0.3593733, -0.07696394, -1.366734, 0, 1, 0.2627451, 1,
-0.3569064, -0.06667285, -2.261281, 0, 1, 0.2666667, 1,
-0.3479538, 0.588258, -1.208281, 0, 1, 0.2745098, 1,
-0.3470726, 0.4933308, 0.6317891, 0, 1, 0.2784314, 1,
-0.3465987, -1.317116, -3.013785, 0, 1, 0.2862745, 1,
-0.3373489, -0.760309, -3.080367, 0, 1, 0.2901961, 1,
-0.335211, -0.9159315, -1.78199, 0, 1, 0.2980392, 1,
-0.3276282, 1.041675, 0.3446263, 0, 1, 0.3058824, 1,
-0.3253943, -0.03812503, -0.8804235, 0, 1, 0.3098039, 1,
-0.3242599, -0.5563624, -2.630583, 0, 1, 0.3176471, 1,
-0.3242491, 0.96424, 0.5848337, 0, 1, 0.3215686, 1,
-0.3231942, -0.3625551, -2.306361, 0, 1, 0.3294118, 1,
-0.3219532, 0.4094191, -1.78816, 0, 1, 0.3333333, 1,
-0.319685, -1.953424, -3.520664, 0, 1, 0.3411765, 1,
-0.3177557, -0.9807274, -3.22284, 0, 1, 0.345098, 1,
-0.3165486, -0.3278207, -2.335618, 0, 1, 0.3529412, 1,
-0.313686, 0.6765338, -0.0172059, 0, 1, 0.3568628, 1,
-0.3122663, 0.1275388, -2.887275, 0, 1, 0.3647059, 1,
-0.311475, 0.6086296, -0.2806195, 0, 1, 0.3686275, 1,
-0.3095669, 0.651353, -1.919469, 0, 1, 0.3764706, 1,
-0.3059829, -0.7271423, -3.692486, 0, 1, 0.3803922, 1,
-0.3024735, 0.292581, -0.6102213, 0, 1, 0.3882353, 1,
-0.3000066, -0.5758709, -3.803197, 0, 1, 0.3921569, 1,
-0.2974148, -1.582175, -1.349748, 0, 1, 0.4, 1,
-0.2956229, -2.895832, -3.152101, 0, 1, 0.4078431, 1,
-0.2954007, 0.6831177, 2.420889, 0, 1, 0.4117647, 1,
-0.2945516, -0.234378, -2.819293, 0, 1, 0.4196078, 1,
-0.2941535, 0.112736, -1.752592, 0, 1, 0.4235294, 1,
-0.2859235, -1.257013, -3.61784, 0, 1, 0.4313726, 1,
-0.2824568, 1.447841, 1.145967, 0, 1, 0.4352941, 1,
-0.2641147, -0.7187713, -1.008298, 0, 1, 0.4431373, 1,
-0.2587498, 0.1502686, -1.477923, 0, 1, 0.4470588, 1,
-0.2577074, -0.8372223, -1.951488, 0, 1, 0.454902, 1,
-0.2560231, -2.847895, -2.340321, 0, 1, 0.4588235, 1,
-0.2550478, 0.8128284, 0.6175328, 0, 1, 0.4666667, 1,
-0.253597, -1.739163, -3.304039, 0, 1, 0.4705882, 1,
-0.2534339, 0.9980963, 0.5984682, 0, 1, 0.4784314, 1,
-0.2467736, -0.001880406, -1.381836, 0, 1, 0.4823529, 1,
-0.2465296, 0.7531569, -0.8616158, 0, 1, 0.4901961, 1,
-0.2461881, 0.92804, -1.780159, 0, 1, 0.4941176, 1,
-0.2461156, 0.4796865, -0.6842488, 0, 1, 0.5019608, 1,
-0.2417332, -0.9795317, -2.728858, 0, 1, 0.509804, 1,
-0.2383111, -0.495081, -1.965703, 0, 1, 0.5137255, 1,
-0.2376121, 0.3374816, -1.069497, 0, 1, 0.5215687, 1,
-0.2352931, -0.1128159, -2.401404, 0, 1, 0.5254902, 1,
-0.2331419, -0.8527716, -3.814215, 0, 1, 0.5333334, 1,
-0.2324436, 0.08931408, 0.005588788, 0, 1, 0.5372549, 1,
-0.2311373, -0.7140473, -2.055255, 0, 1, 0.5450981, 1,
-0.2311238, -2.156159, -4.417562, 0, 1, 0.5490196, 1,
-0.2286052, -0.1009337, -0.3919935, 0, 1, 0.5568628, 1,
-0.2264997, -0.2673081, -1.333409, 0, 1, 0.5607843, 1,
-0.222366, -0.1950338, -2.608636, 0, 1, 0.5686275, 1,
-0.2220485, -1.0878, -1.871098, 0, 1, 0.572549, 1,
-0.2166109, -0.2827723, -3.363968, 0, 1, 0.5803922, 1,
-0.2134075, -0.5275565, -3.354017, 0, 1, 0.5843138, 1,
-0.2126438, 0.3680994, -0.001169505, 0, 1, 0.5921569, 1,
-0.2111103, -0.2083077, -2.818722, 0, 1, 0.5960785, 1,
-0.2097584, -0.008345118, -2.167375, 0, 1, 0.6039216, 1,
-0.2090856, -0.1869906, -1.799976, 0, 1, 0.6117647, 1,
-0.2060232, 0.9368225, -0.9818655, 0, 1, 0.6156863, 1,
-0.2059735, -0.9266393, -3.489025, 0, 1, 0.6235294, 1,
-0.204096, 0.393209, 0.307263, 0, 1, 0.627451, 1,
-0.1998653, -0.352758, -2.541743, 0, 1, 0.6352941, 1,
-0.199326, 2.93271, -1.122368, 0, 1, 0.6392157, 1,
-0.1958686, 1.94791, -0.6749436, 0, 1, 0.6470588, 1,
-0.1952109, 0.3759588, -0.7361005, 0, 1, 0.6509804, 1,
-0.1858908, -0.4940409, -3.587514, 0, 1, 0.6588235, 1,
-0.1850844, 0.06310698, -1.766756, 0, 1, 0.6627451, 1,
-0.1830232, -2.215057, -1.637201, 0, 1, 0.6705883, 1,
-0.1777726, -1.003124, -3.09212, 0, 1, 0.6745098, 1,
-0.1725009, -0.05258912, -2.645804, 0, 1, 0.682353, 1,
-0.1670986, -1.392121, -3.981228, 0, 1, 0.6862745, 1,
-0.1619748, 0.2752059, -1.885927, 0, 1, 0.6941177, 1,
-0.1612367, 1.693105, -0.8831406, 0, 1, 0.7019608, 1,
-0.160385, 0.5214952, -1.534302, 0, 1, 0.7058824, 1,
-0.1504028, -0.1015082, -2.617551, 0, 1, 0.7137255, 1,
-0.1496846, 1.382444, -1.108697, 0, 1, 0.7176471, 1,
-0.148116, 0.9926208, -0.340907, 0, 1, 0.7254902, 1,
-0.1434951, 0.961728, 0.2189689, 0, 1, 0.7294118, 1,
-0.1412172, -0.5979574, -3.918441, 0, 1, 0.7372549, 1,
-0.140685, -0.3186156, -3.071239, 0, 1, 0.7411765, 1,
-0.1404594, -0.3676596, -2.323833, 0, 1, 0.7490196, 1,
-0.139227, -0.5455795, -3.579737, 0, 1, 0.7529412, 1,
-0.1371814, -0.3947081, -4.279996, 0, 1, 0.7607843, 1,
-0.1361739, -0.06441069, -2.857243, 0, 1, 0.7647059, 1,
-0.1293091, 0.6216371, -0.344207, 0, 1, 0.772549, 1,
-0.1287807, 1.960311, 0.8979836, 0, 1, 0.7764706, 1,
-0.1280899, 0.5584125, -1.824651, 0, 1, 0.7843137, 1,
-0.1257452, -0.6717761, -3.0862, 0, 1, 0.7882353, 1,
-0.1086417, 0.09472121, -2.393001, 0, 1, 0.7960784, 1,
-0.09767275, 0.4696605, 0.7972464, 0, 1, 0.8039216, 1,
-0.09671038, -0.4856215, -3.05035, 0, 1, 0.8078431, 1,
-0.09360092, -0.6394165, -2.620755, 0, 1, 0.8156863, 1,
-0.09319595, -0.9746159, -2.488871, 0, 1, 0.8196079, 1,
-0.09237215, 0.0512379, 0.6331926, 0, 1, 0.827451, 1,
-0.09017777, 0.03125297, -0.7386684, 0, 1, 0.8313726, 1,
-0.08848468, 0.08369265, -0.7438982, 0, 1, 0.8392157, 1,
-0.08715847, 0.4596694, -0.4213908, 0, 1, 0.8431373, 1,
-0.08496454, -0.4759331, -3.395728, 0, 1, 0.8509804, 1,
-0.08477052, -0.3489518, -2.386543, 0, 1, 0.854902, 1,
-0.08089232, 0.2946057, -0.7127123, 0, 1, 0.8627451, 1,
-0.07754257, 0.1287526, -0.968143, 0, 1, 0.8666667, 1,
-0.07523076, 0.3086575, -0.1494606, 0, 1, 0.8745098, 1,
-0.07246437, 1.277296, 1.353208, 0, 1, 0.8784314, 1,
-0.07095106, -0.3199314, -2.3853, 0, 1, 0.8862745, 1,
-0.0693875, -0.8095145, -3.008458, 0, 1, 0.8901961, 1,
-0.06775318, -0.2350784, -3.309184, 0, 1, 0.8980392, 1,
-0.06643388, -0.324007, -2.539068, 0, 1, 0.9058824, 1,
-0.06554424, -0.5681529, -1.841725, 0, 1, 0.9098039, 1,
-0.05943209, -0.4373058, -1.446372, 0, 1, 0.9176471, 1,
-0.05933671, 0.8355888, 1.217142, 0, 1, 0.9215686, 1,
-0.05554644, 0.281262, 0.2688465, 0, 1, 0.9294118, 1,
-0.04879374, 1.84323, -0.2448885, 0, 1, 0.9333333, 1,
-0.04780842, -1.373133, -2.863106, 0, 1, 0.9411765, 1,
-0.04746033, -0.3971823, -4.532954, 0, 1, 0.945098, 1,
-0.04549138, -1.046415, -4.188935, 0, 1, 0.9529412, 1,
-0.04191121, 0.03128335, -2.005463, 0, 1, 0.9568627, 1,
-0.03392062, 0.3452545, -0.4541442, 0, 1, 0.9647059, 1,
-0.03389848, -1.135432, -3.118618, 0, 1, 0.9686275, 1,
-0.03260845, -1.317483, -2.840749, 0, 1, 0.9764706, 1,
-0.02884685, 0.9571762, 0.5249053, 0, 1, 0.9803922, 1,
-0.02757497, 0.160392, -0.7704946, 0, 1, 0.9882353, 1,
-0.02469132, -0.2987933, -3.409755, 0, 1, 0.9921569, 1,
-0.02272625, -0.74573, -2.715964, 0, 1, 1, 1,
-0.01703785, -0.5818203, -3.318696, 0, 0.9921569, 1, 1,
-0.0134887, 0.9050109, 0.3758653, 0, 0.9882353, 1, 1,
-0.008644724, -0.7485617, -3.979988, 0, 0.9803922, 1, 1,
-0.006819821, -2.374798, -4.325667, 0, 0.9764706, 1, 1,
-0.002723049, -0.5489224, -3.43428, 0, 0.9686275, 1, 1,
0.002395861, 1.014108, -0.3800446, 0, 0.9647059, 1, 1,
0.01166588, 0.6359301, -0.0999511, 0, 0.9568627, 1, 1,
0.01205341, -0.2531101, 2.855564, 0, 0.9529412, 1, 1,
0.01574155, -0.9518813, 6.408814, 0, 0.945098, 1, 1,
0.01918257, 0.4594535, 1.422954, 0, 0.9411765, 1, 1,
0.02648452, -0.4924001, 1.656122, 0, 0.9333333, 1, 1,
0.02741287, -0.1933183, 3.000494, 0, 0.9294118, 1, 1,
0.03381154, -1.313465, 4.5768, 0, 0.9215686, 1, 1,
0.03928119, 0.2790219, 1.050165, 0, 0.9176471, 1, 1,
0.04265571, 1.687293, 0.4144327, 0, 0.9098039, 1, 1,
0.042875, -1.42564, 2.22057, 0, 0.9058824, 1, 1,
0.04451476, -0.1947554, 3.243795, 0, 0.8980392, 1, 1,
0.04517936, -0.09523802, 3.413157, 0, 0.8901961, 1, 1,
0.04608102, 1.314696, 0.3312167, 0, 0.8862745, 1, 1,
0.05429596, 0.9156752, -0.263671, 0, 0.8784314, 1, 1,
0.05454499, -0.4303146, 1.754489, 0, 0.8745098, 1, 1,
0.05464218, -0.7385139, 1.221254, 0, 0.8666667, 1, 1,
0.05480518, -0.0882064, 1.043713, 0, 0.8627451, 1, 1,
0.0555865, 0.006140729, 1.984536, 0, 0.854902, 1, 1,
0.05722943, 0.5136118, -1.25789, 0, 0.8509804, 1, 1,
0.05825196, -0.1879981, 3.427608, 0, 0.8431373, 1, 1,
0.05845528, 0.2662756, 0.2177605, 0, 0.8392157, 1, 1,
0.05864007, -1.472154, 1.657247, 0, 0.8313726, 1, 1,
0.06128757, 0.5935434, 0.005376721, 0, 0.827451, 1, 1,
0.06289832, -0.5871428, 3.932897, 0, 0.8196079, 1, 1,
0.06384034, -1.109398, 3.408361, 0, 0.8156863, 1, 1,
0.06844845, -1.211959, 3.772869, 0, 0.8078431, 1, 1,
0.07743137, -1.141639, 3.728964, 0, 0.8039216, 1, 1,
0.07851265, 0.4285801, -1.309848, 0, 0.7960784, 1, 1,
0.08181826, -1.087078, 2.619627, 0, 0.7882353, 1, 1,
0.08184349, 0.1326174, -0.7501584, 0, 0.7843137, 1, 1,
0.08390117, 1.664732, 1.547181, 0, 0.7764706, 1, 1,
0.08512144, 1.176117, -1.772072, 0, 0.772549, 1, 1,
0.08704121, -1.203692, 4.404583, 0, 0.7647059, 1, 1,
0.08735783, -0.5629089, 3.65906, 0, 0.7607843, 1, 1,
0.09195894, -0.2173385, 2.447943, 0, 0.7529412, 1, 1,
0.09545459, 0.706062, -0.4158206, 0, 0.7490196, 1, 1,
0.09606604, 0.9753008, -1.141157, 0, 0.7411765, 1, 1,
0.1001868, 0.5521255, 1.624201, 0, 0.7372549, 1, 1,
0.1017779, 1.22401, -1.005979, 0, 0.7294118, 1, 1,
0.1044184, -0.9881875, 2.525453, 0, 0.7254902, 1, 1,
0.1108733, -0.8919742, 3.104659, 0, 0.7176471, 1, 1,
0.1145752, 0.02317138, 2.202065, 0, 0.7137255, 1, 1,
0.1154226, -0.09957216, 2.5311, 0, 0.7058824, 1, 1,
0.1210506, -0.4271886, 3.282059, 0, 0.6980392, 1, 1,
0.122234, -0.1597829, 2.153967, 0, 0.6941177, 1, 1,
0.1235189, 0.1577924, 1.373763, 0, 0.6862745, 1, 1,
0.1248309, -0.7662203, 2.764376, 0, 0.682353, 1, 1,
0.1265794, -0.1128179, 1.655629, 0, 0.6745098, 1, 1,
0.1271407, -0.168998, 1.578832, 0, 0.6705883, 1, 1,
0.1304963, -0.9978368, 2.045955, 0, 0.6627451, 1, 1,
0.1309798, -0.3648922, 3.130001, 0, 0.6588235, 1, 1,
0.1357035, -1.091423, 3.738196, 0, 0.6509804, 1, 1,
0.1405492, 0.04482731, 0.8117793, 0, 0.6470588, 1, 1,
0.1409894, 1.272448, -0.8014197, 0, 0.6392157, 1, 1,
0.1482508, 0.1477194, 0.7593894, 0, 0.6352941, 1, 1,
0.150893, -1.586977, 0.9591731, 0, 0.627451, 1, 1,
0.1574955, 1.336479, -0.04333437, 0, 0.6235294, 1, 1,
0.1591396, 1.994522, -0.6769327, 0, 0.6156863, 1, 1,
0.161994, -1.783106, 3.068929, 0, 0.6117647, 1, 1,
0.1647992, -1.116586, 4.179556, 0, 0.6039216, 1, 1,
0.1665646, 0.5821595, -1.508931, 0, 0.5960785, 1, 1,
0.1799684, -1.066599, 2.317951, 0, 0.5921569, 1, 1,
0.1829223, 1.215513, 0.283307, 0, 0.5843138, 1, 1,
0.1892863, 0.3320511, -0.223347, 0, 0.5803922, 1, 1,
0.1907604, 0.3416781, 1.939023, 0, 0.572549, 1, 1,
0.1945995, 1.399137, 0.7514227, 0, 0.5686275, 1, 1,
0.1976736, -1.316288, 3.011855, 0, 0.5607843, 1, 1,
0.1985075, -0.1220692, 2.919054, 0, 0.5568628, 1, 1,
0.199371, 0.8031888, -0.795275, 0, 0.5490196, 1, 1,
0.2008565, 0.9974698, 1.3036, 0, 0.5450981, 1, 1,
0.2011998, -0.007019483, -0.5635313, 0, 0.5372549, 1, 1,
0.2026432, -2.156389, 2.666769, 0, 0.5333334, 1, 1,
0.2029071, 2.352016, 0.268273, 0, 0.5254902, 1, 1,
0.2053959, -1.67067, 4.22617, 0, 0.5215687, 1, 1,
0.2058293, -0.38458, 3.990099, 0, 0.5137255, 1, 1,
0.2094709, -0.5635445, 1.129277, 0, 0.509804, 1, 1,
0.2099272, 1.449307, -0.6903566, 0, 0.5019608, 1, 1,
0.2107769, -2.431768, 2.688167, 0, 0.4941176, 1, 1,
0.2110452, 0.4667161, 0.9938793, 0, 0.4901961, 1, 1,
0.2127623, 0.8260839, 0.08576026, 0, 0.4823529, 1, 1,
0.2143982, -0.4075783, 0.9793845, 0, 0.4784314, 1, 1,
0.2160059, 0.4050024, 0.9497609, 0, 0.4705882, 1, 1,
0.2171181, 1.149275, -0.83075, 0, 0.4666667, 1, 1,
0.2201777, -0.4374882, 2.174032, 0, 0.4588235, 1, 1,
0.2259344, -0.6950235, 2.581244, 0, 0.454902, 1, 1,
0.2263326, 0.1686712, -1.061531, 0, 0.4470588, 1, 1,
0.2292381, 2.70313, 1.049164, 0, 0.4431373, 1, 1,
0.2421863, 1.056506, 0.2981724, 0, 0.4352941, 1, 1,
0.242306, 1.753856, -1.657752, 0, 0.4313726, 1, 1,
0.2432893, 0.7975574, 1.613338, 0, 0.4235294, 1, 1,
0.2433233, 1.055667, 0.2023044, 0, 0.4196078, 1, 1,
0.2435376, -0.2753209, 2.006594, 0, 0.4117647, 1, 1,
0.2466845, -0.857081, 1.744929, 0, 0.4078431, 1, 1,
0.2469487, 0.2701943, 0.3074755, 0, 0.4, 1, 1,
0.2484847, -0.2045961, 3.954049, 0, 0.3921569, 1, 1,
0.2542033, -0.4141706, 2.241068, 0, 0.3882353, 1, 1,
0.2565266, 0.04912169, 1.638427, 0, 0.3803922, 1, 1,
0.258627, 1.902786, -1.42541, 0, 0.3764706, 1, 1,
0.2647166, 1.921686, -0.3908933, 0, 0.3686275, 1, 1,
0.2655333, -0.227927, 0.9728243, 0, 0.3647059, 1, 1,
0.2691592, 1.135322, -1.257955, 0, 0.3568628, 1, 1,
0.2748831, -1.558923, 3.087455, 0, 0.3529412, 1, 1,
0.2824556, 1.695812, 0.2318918, 0, 0.345098, 1, 1,
0.2826803, 1.264409, -0.8548758, 0, 0.3411765, 1, 1,
0.2852286, 0.05559649, 1.755938, 0, 0.3333333, 1, 1,
0.2866921, 0.138513, 1.626798, 0, 0.3294118, 1, 1,
0.2867466, -0.6782041, 3.452029, 0, 0.3215686, 1, 1,
0.2885453, -0.610755, 4.583802, 0, 0.3176471, 1, 1,
0.2886487, 0.493257, 1.926387, 0, 0.3098039, 1, 1,
0.2896813, 1.697815, 2.70847, 0, 0.3058824, 1, 1,
0.2928927, 0.4128477, 1.791098, 0, 0.2980392, 1, 1,
0.2968416, 1.383771, -0.6496521, 0, 0.2901961, 1, 1,
0.2970959, -0.0428142, 2.526474, 0, 0.2862745, 1, 1,
0.3000673, 0.3084459, 1.557257, 0, 0.2784314, 1, 1,
0.3055185, 0.8576495, 0.759027, 0, 0.2745098, 1, 1,
0.3080062, -0.1408262, 2.599588, 0, 0.2666667, 1, 1,
0.3143032, -0.7509385, 1.951044, 0, 0.2627451, 1, 1,
0.3153189, -0.09419695, 0.5407704, 0, 0.254902, 1, 1,
0.3168331, 0.1099066, 1.162481, 0, 0.2509804, 1, 1,
0.3195757, -1.172387, 2.167576, 0, 0.2431373, 1, 1,
0.3231143, 0.9880881, -0.5039259, 0, 0.2392157, 1, 1,
0.3245451, -0.4033854, 2.692141, 0, 0.2313726, 1, 1,
0.3304861, 0.06601718, 0.885461, 0, 0.227451, 1, 1,
0.3319917, 1.584018, 0.9007558, 0, 0.2196078, 1, 1,
0.3336535, -1.020403, 2.735158, 0, 0.2156863, 1, 1,
0.3379765, 2.114433, -1.128341, 0, 0.2078431, 1, 1,
0.3399945, -0.5683974, 1.767541, 0, 0.2039216, 1, 1,
0.3411572, -0.2347082, 2.081115, 0, 0.1960784, 1, 1,
0.3419285, 0.249902, 0.665906, 0, 0.1882353, 1, 1,
0.3463412, -0.4236888, 2.695199, 0, 0.1843137, 1, 1,
0.3479922, 0.1291348, -1.055205, 0, 0.1764706, 1, 1,
0.3524321, 0.2522534, 0.833461, 0, 0.172549, 1, 1,
0.359087, 1.695303, 0.6079822, 0, 0.1647059, 1, 1,
0.3592991, -0.9710498, 2.809614, 0, 0.1607843, 1, 1,
0.3628191, 0.850056, 0.657597, 0, 0.1529412, 1, 1,
0.3737687, 1.009928, 1.34181, 0, 0.1490196, 1, 1,
0.3747336, -1.392471, 1.779325, 0, 0.1411765, 1, 1,
0.3768041, -0.8066672, 1.57426, 0, 0.1372549, 1, 1,
0.377536, -2.740097, 2.760957, 0, 0.1294118, 1, 1,
0.3785847, 0.3394486, 1.859148, 0, 0.1254902, 1, 1,
0.3793972, 2.821268, 0.8399621, 0, 0.1176471, 1, 1,
0.3820362, 0.2598358, 1.041747, 0, 0.1137255, 1, 1,
0.3834386, -0.4485693, 2.29797, 0, 0.1058824, 1, 1,
0.3836968, 0.7488376, 0.1170672, 0, 0.09803922, 1, 1,
0.3852639, -0.2198718, 0.7514345, 0, 0.09411765, 1, 1,
0.3926848, -1.274503, 4.792043, 0, 0.08627451, 1, 1,
0.3962211, 0.6425712, -0.9084792, 0, 0.08235294, 1, 1,
0.4005287, -0.5604694, 4.185716, 0, 0.07450981, 1, 1,
0.4060602, 0.1146494, 0.8970657, 0, 0.07058824, 1, 1,
0.408035, -0.900295, 3.384503, 0, 0.0627451, 1, 1,
0.4121908, 0.651505, 1.857956, 0, 0.05882353, 1, 1,
0.413059, -0.7668989, 4.026719, 0, 0.05098039, 1, 1,
0.4131689, 1.146678, 0.1978906, 0, 0.04705882, 1, 1,
0.4160603, -0.4514825, 3.544504, 0, 0.03921569, 1, 1,
0.416629, -1.49751, 4.077446, 0, 0.03529412, 1, 1,
0.4208456, -1.457703, 2.561613, 0, 0.02745098, 1, 1,
0.4212307, -2.303662, 2.730402, 0, 0.02352941, 1, 1,
0.4228371, 0.1840214, 0.4188026, 0, 0.01568628, 1, 1,
0.4256825, -0.07493522, 0.4876636, 0, 0.01176471, 1, 1,
0.4292254, -0.2150578, 0.4515484, 0, 0.003921569, 1, 1,
0.4329144, -0.7854629, 3.105002, 0.003921569, 0, 1, 1,
0.4348384, 1.764782, 0.4182592, 0.007843138, 0, 1, 1,
0.4353109, -1.038417, 3.135337, 0.01568628, 0, 1, 1,
0.4374032, 1.511494, -0.1321791, 0.01960784, 0, 1, 1,
0.4427648, -1.322633, 2.709358, 0.02745098, 0, 1, 1,
0.4430415, 0.6461643, -1.004239, 0.03137255, 0, 1, 1,
0.4460461, 1.242818, 0.805672, 0.03921569, 0, 1, 1,
0.4508435, -0.3966206, 2.461355, 0.04313726, 0, 1, 1,
0.4571759, -0.2422576, 3.872494, 0.05098039, 0, 1, 1,
0.4582302, -0.330602, 2.767407, 0.05490196, 0, 1, 1,
0.460419, -0.424379, 3.307252, 0.0627451, 0, 1, 1,
0.4631245, 0.2613145, -0.9765806, 0.06666667, 0, 1, 1,
0.4636505, -0.4300192, 2.064012, 0.07450981, 0, 1, 1,
0.4715011, 0.8382402, 1.862348, 0.07843138, 0, 1, 1,
0.4736318, -1.64169, 0.5519068, 0.08627451, 0, 1, 1,
0.4750639, 0.5687374, 0.5216366, 0.09019608, 0, 1, 1,
0.4784892, 0.3462646, 1.35463, 0.09803922, 0, 1, 1,
0.480108, -0.4528236, 3.476872, 0.1058824, 0, 1, 1,
0.4802839, -1.228944, 5.315438, 0.1098039, 0, 1, 1,
0.4818308, 0.3620171, -0.3793701, 0.1176471, 0, 1, 1,
0.4865882, 1.30905, 2.687564, 0.1215686, 0, 1, 1,
0.489236, -0.3026609, 3.542629, 0.1294118, 0, 1, 1,
0.4893726, 0.05477943, 2.423624, 0.1333333, 0, 1, 1,
0.489502, -0.4258195, 3.509511, 0.1411765, 0, 1, 1,
0.490199, -0.1259345, 0.5949256, 0.145098, 0, 1, 1,
0.4934573, -0.2574807, 1.5428, 0.1529412, 0, 1, 1,
0.4936287, 1.77231, 0.8176814, 0.1568628, 0, 1, 1,
0.4939266, -0.2144462, 0.9647215, 0.1647059, 0, 1, 1,
0.4939545, 0.1139796, 1.330428, 0.1686275, 0, 1, 1,
0.4942348, -1.216065, 3.222936, 0.1764706, 0, 1, 1,
0.5027856, -1.600081, 3.267625, 0.1803922, 0, 1, 1,
0.5071484, -1.368142, 1.981163, 0.1882353, 0, 1, 1,
0.5077161, -1.572418, 1.008091, 0.1921569, 0, 1, 1,
0.5083009, 0.9748473, -0.4200941, 0.2, 0, 1, 1,
0.5089284, -0.4786538, 1.646051, 0.2078431, 0, 1, 1,
0.5100529, -1.001612, 2.178308, 0.2117647, 0, 1, 1,
0.512159, -1.369402, 3.631478, 0.2196078, 0, 1, 1,
0.5137804, 1.091373, 1.072331, 0.2235294, 0, 1, 1,
0.5195844, -0.9869264, 2.300753, 0.2313726, 0, 1, 1,
0.5198456, 0.7555042, 1.309922, 0.2352941, 0, 1, 1,
0.5239913, -0.4430355, 2.511164, 0.2431373, 0, 1, 1,
0.5308924, 0.1947723, 0.714074, 0.2470588, 0, 1, 1,
0.5311317, -1.047321, 1.138236, 0.254902, 0, 1, 1,
0.5315489, -0.4790759, 3.06642, 0.2588235, 0, 1, 1,
0.5324873, 0.6130655, 1.76406, 0.2666667, 0, 1, 1,
0.5343413, 1.577691, -0.2527435, 0.2705882, 0, 1, 1,
0.5385609, 0.7031199, -0.299942, 0.2784314, 0, 1, 1,
0.5414366, 0.1202921, 1.883877, 0.282353, 0, 1, 1,
0.5447798, 1.390265, 1.583655, 0.2901961, 0, 1, 1,
0.546548, -0.8128472, 1.995502, 0.2941177, 0, 1, 1,
0.5466774, -2.168069, 2.70277, 0.3019608, 0, 1, 1,
0.5480003, 0.3818071, 1.37482, 0.3098039, 0, 1, 1,
0.5510861, 0.1781268, 0.7077667, 0.3137255, 0, 1, 1,
0.5568194, 1.766035, -0.2821451, 0.3215686, 0, 1, 1,
0.5600147, 1.257163, -2.307365, 0.3254902, 0, 1, 1,
0.5603685, -0.360828, 1.802027, 0.3333333, 0, 1, 1,
0.5678729, 0.002652667, 0.4332649, 0.3372549, 0, 1, 1,
0.5685782, -0.7202566, 3.048316, 0.345098, 0, 1, 1,
0.5718905, -0.9673846, 4.028428, 0.3490196, 0, 1, 1,
0.5791065, -0.06193875, 1.197085, 0.3568628, 0, 1, 1,
0.5791632, 0.6148561, 1.156653, 0.3607843, 0, 1, 1,
0.5818253, 0.8359475, -0.02489782, 0.3686275, 0, 1, 1,
0.5881709, 0.3738468, 0.6854127, 0.372549, 0, 1, 1,
0.595422, -0.3525872, 4.767855, 0.3803922, 0, 1, 1,
0.5962635, -0.2212113, 2.626976, 0.3843137, 0, 1, 1,
0.6077902, -1.463306, 3.232927, 0.3921569, 0, 1, 1,
0.6081743, 1.199345, -0.4400073, 0.3960784, 0, 1, 1,
0.6120305, -0.9572333, 0.6578298, 0.4039216, 0, 1, 1,
0.6122125, 1.355219, 2.212383, 0.4117647, 0, 1, 1,
0.613877, 0.8743728, -1.234771, 0.4156863, 0, 1, 1,
0.6151608, -0.2478447, 1.163456, 0.4235294, 0, 1, 1,
0.6175796, 0.7966199, -0.6541513, 0.427451, 0, 1, 1,
0.6178156, -1.340238, 2.508759, 0.4352941, 0, 1, 1,
0.6205462, -0.7557548, 2.352576, 0.4392157, 0, 1, 1,
0.6210177, 0.2022302, 2.227284, 0.4470588, 0, 1, 1,
0.6217242, -0.5376606, 2.912117, 0.4509804, 0, 1, 1,
0.6265693, -0.5833041, 2.661185, 0.4588235, 0, 1, 1,
0.6279044, 0.2876209, 0.6220753, 0.4627451, 0, 1, 1,
0.6330189, 0.2976871, 1.002493, 0.4705882, 0, 1, 1,
0.6332128, 0.1463509, 0.5457725, 0.4745098, 0, 1, 1,
0.6387179, -1.073117, 2.957519, 0.4823529, 0, 1, 1,
0.639711, 0.9547539, 1.505823, 0.4862745, 0, 1, 1,
0.6458625, -0.1244739, 2.126701, 0.4941176, 0, 1, 1,
0.6473644, 0.1795025, 1.575236, 0.5019608, 0, 1, 1,
0.6482872, -0.6287404, 4.262256, 0.5058824, 0, 1, 1,
0.6502344, 0.5185404, -0.0009567141, 0.5137255, 0, 1, 1,
0.6546097, -0.2505564, 1.030152, 0.5176471, 0, 1, 1,
0.6561794, 1.071055, -0.2493275, 0.5254902, 0, 1, 1,
0.6563217, 2.186951, 0.009829988, 0.5294118, 0, 1, 1,
0.6574087, -1.579828, 3.17881, 0.5372549, 0, 1, 1,
0.6633002, -0.3760357, 3.454499, 0.5411765, 0, 1, 1,
0.6641605, 0.5316726, -0.7901825, 0.5490196, 0, 1, 1,
0.6653724, -1.504813, 3.483658, 0.5529412, 0, 1, 1,
0.6678845, 0.6372544, 1.914241, 0.5607843, 0, 1, 1,
0.6704805, 0.4519323, 0.7685509, 0.5647059, 0, 1, 1,
0.6720192, 0.2084093, 0.1524803, 0.572549, 0, 1, 1,
0.6721875, -0.3145871, 0.9814546, 0.5764706, 0, 1, 1,
0.6754387, 0.09496919, 2.504693, 0.5843138, 0, 1, 1,
0.6762955, -0.08036064, 2.126636, 0.5882353, 0, 1, 1,
0.6798933, 0.2355518, 1.423443, 0.5960785, 0, 1, 1,
0.6823956, -1.268857, 4.299483, 0.6039216, 0, 1, 1,
0.6824611, 1.739384, 1.916733, 0.6078432, 0, 1, 1,
0.6840307, 0.6278717, 2.121522, 0.6156863, 0, 1, 1,
0.6851166, -0.6521761, -0.8526348, 0.6196079, 0, 1, 1,
0.6862555, -1.240695, 2.385043, 0.627451, 0, 1, 1,
0.6963366, -0.6761336, 1.968207, 0.6313726, 0, 1, 1,
0.6994479, 0.1470119, 2.858599, 0.6392157, 0, 1, 1,
0.7058439, 0.7126618, 1.123365, 0.6431373, 0, 1, 1,
0.7061731, 1.596676, -0.446366, 0.6509804, 0, 1, 1,
0.7219101, -1.209083, 3.771681, 0.654902, 0, 1, 1,
0.7245291, -0.398911, 2.399054, 0.6627451, 0, 1, 1,
0.72616, -0.7376673, 1.784474, 0.6666667, 0, 1, 1,
0.7303109, 0.3047309, -0.6630951, 0.6745098, 0, 1, 1,
0.7314298, 2.04841, -0.1285136, 0.6784314, 0, 1, 1,
0.7351266, -0.614104, 1.014275, 0.6862745, 0, 1, 1,
0.7429212, -0.06004101, 1.219301, 0.6901961, 0, 1, 1,
0.7433543, -0.1103534, 1.416646, 0.6980392, 0, 1, 1,
0.7467124, 0.662725, 1.114618, 0.7058824, 0, 1, 1,
0.7565252, 1.11441, 1.468191, 0.7098039, 0, 1, 1,
0.7620806, 0.3713487, 2.650448, 0.7176471, 0, 1, 1,
0.7671394, -0.6322609, 1.338215, 0.7215686, 0, 1, 1,
0.7690651, 0.6648943, 1.625483, 0.7294118, 0, 1, 1,
0.7737901, 0.2775037, 0.3746575, 0.7333333, 0, 1, 1,
0.7820337, -0.04021665, 1.245745, 0.7411765, 0, 1, 1,
0.8003805, -1.162234, 2.769282, 0.7450981, 0, 1, 1,
0.8037074, -0.2435906, 2.40074, 0.7529412, 0, 1, 1,
0.8103517, -0.01057958, 2.453952, 0.7568628, 0, 1, 1,
0.8254207, 0.505825, 1.641772, 0.7647059, 0, 1, 1,
0.8270479, -0.6051565, 0.08061629, 0.7686275, 0, 1, 1,
0.8293112, -0.7541993, 1.830044, 0.7764706, 0, 1, 1,
0.8370886, -0.7147597, 2.358602, 0.7803922, 0, 1, 1,
0.8374432, 0.2634605, 0.8177794, 0.7882353, 0, 1, 1,
0.8374454, -1.422708, 2.185752, 0.7921569, 0, 1, 1,
0.842793, -0.07266517, -0.5603559, 0.8, 0, 1, 1,
0.8600115, -1.366296, 2.577585, 0.8078431, 0, 1, 1,
0.8719184, 0.3191732, 0.3252245, 0.8117647, 0, 1, 1,
0.8757461, -0.442886, 2.245405, 0.8196079, 0, 1, 1,
0.8799989, 0.4638511, 1.577894, 0.8235294, 0, 1, 1,
0.8803158, 1.707465, -0.1056016, 0.8313726, 0, 1, 1,
0.8985274, 0.6509439, 1.247172, 0.8352941, 0, 1, 1,
0.9020081, 1.136916, 1.541963, 0.8431373, 0, 1, 1,
0.9065469, -0.5796509, 1.558589, 0.8470588, 0, 1, 1,
0.9081385, -0.3521117, 2.384207, 0.854902, 0, 1, 1,
0.9140154, -0.9384593, 4.313662, 0.8588235, 0, 1, 1,
0.9153307, 1.270884, 0.7889823, 0.8666667, 0, 1, 1,
0.919677, -0.7407147, 2.822624, 0.8705882, 0, 1, 1,
0.9253597, -1.781643, 1.854014, 0.8784314, 0, 1, 1,
0.9271107, 0.120421, 1.633286, 0.8823529, 0, 1, 1,
0.934612, 1.106085, 0.8892258, 0.8901961, 0, 1, 1,
0.9383689, 0.3199661, 1.38057, 0.8941177, 0, 1, 1,
0.9389894, -1.798441, 2.956402, 0.9019608, 0, 1, 1,
0.9396886, 0.4427618, 1.039569, 0.9098039, 0, 1, 1,
0.9408312, -0.8301801, 0.9000311, 0.9137255, 0, 1, 1,
0.9437325, -0.05480102, 1.913635, 0.9215686, 0, 1, 1,
0.9468276, -0.1912443, 1.646309, 0.9254902, 0, 1, 1,
0.9484244, -0.3423325, 2.501132, 0.9333333, 0, 1, 1,
0.9520329, -2.128924, 2.038486, 0.9372549, 0, 1, 1,
0.955037, 0.4746563, 0.9484022, 0.945098, 0, 1, 1,
0.9586061, -0.6759721, 3.701448, 0.9490196, 0, 1, 1,
0.9626055, -0.5091342, 1.893007, 0.9568627, 0, 1, 1,
0.9694897, -1.388955, 3.28255, 0.9607843, 0, 1, 1,
0.9700434, -0.5052183, 0.2363504, 0.9686275, 0, 1, 1,
0.9773189, -0.09395821, 0.2572885, 0.972549, 0, 1, 1,
0.9801141, -0.8064772, 2.224515, 0.9803922, 0, 1, 1,
0.9810417, 1.155264, 0.7497, 0.9843137, 0, 1, 1,
0.9847637, -0.8898598, 1.395765, 0.9921569, 0, 1, 1,
0.9925811, -2.462162, 3.15198, 0.9960784, 0, 1, 1,
0.9928367, 0.3515679, 1.459635, 1, 0, 0.9960784, 1,
0.9953842, 0.1110021, 0.8196551, 1, 0, 0.9882353, 1,
1.003852, 0.3336084, 1.285606, 1, 0, 0.9843137, 1,
1.007507, -0.8411943, 3.326646, 1, 0, 0.9764706, 1,
1.01502, 0.5709091, 1.5301, 1, 0, 0.972549, 1,
1.019524, 0.2541589, 2.298409, 1, 0, 0.9647059, 1,
1.021783, -1.398483, 1.460121, 1, 0, 0.9607843, 1,
1.038009, -0.1220885, 0.7887129, 1, 0, 0.9529412, 1,
1.043367, -0.3527215, 2.442698, 1, 0, 0.9490196, 1,
1.045276, -0.6603142, 1.704905, 1, 0, 0.9411765, 1,
1.053294, -1.480356, 2.549607, 1, 0, 0.9372549, 1,
1.06799, -0.06147674, 1.029356, 1, 0, 0.9294118, 1,
1.077868, 0.8386526, -0.08076889, 1, 0, 0.9254902, 1,
1.080022, -0.9591309, 2.569531, 1, 0, 0.9176471, 1,
1.083576, -0.1939034, 0.206607, 1, 0, 0.9137255, 1,
1.085852, -0.1962373, 1.078705, 1, 0, 0.9058824, 1,
1.101999, 0.3061042, -1.95763, 1, 0, 0.9019608, 1,
1.106228, 1.961124, 1.778915, 1, 0, 0.8941177, 1,
1.106844, 1.349751, 1.882495, 1, 0, 0.8862745, 1,
1.108547, 0.1442516, 3.670017, 1, 0, 0.8823529, 1,
1.109392, -0.4685622, 1.515369, 1, 0, 0.8745098, 1,
1.109976, 1.508001, 0.2256245, 1, 0, 0.8705882, 1,
1.118185, -0.01629953, 0.7202412, 1, 0, 0.8627451, 1,
1.122175, 1.686168, 1.270133, 1, 0, 0.8588235, 1,
1.124031, -1.046586, 2.352418, 1, 0, 0.8509804, 1,
1.124285, -1.1076, 2.553653, 1, 0, 0.8470588, 1,
1.133714, -0.4010184, 3.819586, 1, 0, 0.8392157, 1,
1.136351, -0.3855231, 2.281582, 1, 0, 0.8352941, 1,
1.141811, 0.1669898, 1.139858, 1, 0, 0.827451, 1,
1.142009, -0.2628005, 0.5561286, 1, 0, 0.8235294, 1,
1.14286, -1.063105, 0.3619558, 1, 0, 0.8156863, 1,
1.143822, 1.368629, -0.0778233, 1, 0, 0.8117647, 1,
1.145523, 0.2857637, 0.9025623, 1, 0, 0.8039216, 1,
1.148111, 1.554108, -0.1532748, 1, 0, 0.7960784, 1,
1.154427, 0.1858241, 1.483182, 1, 0, 0.7921569, 1,
1.157168, 1.504151, 1.100724, 1, 0, 0.7843137, 1,
1.162546, -0.163386, 2.094962, 1, 0, 0.7803922, 1,
1.165749, 0.3674867, 1.704515, 1, 0, 0.772549, 1,
1.168981, -0.1240754, 1.648296, 1, 0, 0.7686275, 1,
1.170193, -0.9258356, 1.925532, 1, 0, 0.7607843, 1,
1.170644, -0.6172765, 1.712515, 1, 0, 0.7568628, 1,
1.178952, -1.652813, 2.875875, 1, 0, 0.7490196, 1,
1.184336, -0.03679268, 1.177874, 1, 0, 0.7450981, 1,
1.192421, 1.15269, 0.6592333, 1, 0, 0.7372549, 1,
1.192918, -0.8062624, 2.151542, 1, 0, 0.7333333, 1,
1.196179, 0.1518631, 1.722223, 1, 0, 0.7254902, 1,
1.208562, 1.63955, -0.5023143, 1, 0, 0.7215686, 1,
1.211931, 0.6105968, 0.490381, 1, 0, 0.7137255, 1,
1.219463, -0.8434539, 2.419435, 1, 0, 0.7098039, 1,
1.219875, -1.803908, 2.477294, 1, 0, 0.7019608, 1,
1.224466, -0.6454195, 2.129851, 1, 0, 0.6941177, 1,
1.22604, 0.286331, 0.04920118, 1, 0, 0.6901961, 1,
1.227912, -0.3475934, 1.362781, 1, 0, 0.682353, 1,
1.230391, -0.948146, 3.079761, 1, 0, 0.6784314, 1,
1.232309, 0.7045411, 0.4017193, 1, 0, 0.6705883, 1,
1.233686, 0.4592935, 3.154407, 1, 0, 0.6666667, 1,
1.234802, -0.5021249, 2.334299, 1, 0, 0.6588235, 1,
1.237124, -1.252149, 1.697852, 1, 0, 0.654902, 1,
1.243014, -2.604564, 1.996084, 1, 0, 0.6470588, 1,
1.243155, 0.4945227, 1.08094, 1, 0, 0.6431373, 1,
1.249486, 0.6127598, 1.77066, 1, 0, 0.6352941, 1,
1.264384, -1.200304, 3.284309, 1, 0, 0.6313726, 1,
1.265144, -0.1348358, 3.066517, 1, 0, 0.6235294, 1,
1.272555, 0.7125629, 2.092586, 1, 0, 0.6196079, 1,
1.276265, -1.244931, 2.08528, 1, 0, 0.6117647, 1,
1.282488, 0.286125, 1.212996, 1, 0, 0.6078432, 1,
1.284797, -0.2961417, 2.411146, 1, 0, 0.6, 1,
1.291227, -0.7062117, 3.142241, 1, 0, 0.5921569, 1,
1.292177, -0.7123774, 1.340452, 1, 0, 0.5882353, 1,
1.294653, 0.6742206, 1.946673, 1, 0, 0.5803922, 1,
1.296837, -0.237141, 3.976898, 1, 0, 0.5764706, 1,
1.298534, -1.125176, 2.868834, 1, 0, 0.5686275, 1,
1.29873, -0.7045922, 2.582324, 1, 0, 0.5647059, 1,
1.308893, 0.1297851, 2.038968, 1, 0, 0.5568628, 1,
1.334528, -0.1671299, 0.1991854, 1, 0, 0.5529412, 1,
1.334798, 0.01712902, 2.898955, 1, 0, 0.5450981, 1,
1.337193, 0.9164673, 1.971773, 1, 0, 0.5411765, 1,
1.33932, 1.104176, 0.06676192, 1, 0, 0.5333334, 1,
1.355784, -0.4375477, 3.094924, 1, 0, 0.5294118, 1,
1.356462, -0.9621869, 1.707486, 1, 0, 0.5215687, 1,
1.370228, 0.2879405, 1.428828, 1, 0, 0.5176471, 1,
1.386297, -0.527406, 1.863813, 1, 0, 0.509804, 1,
1.386597, 1.664518, 0.1367966, 1, 0, 0.5058824, 1,
1.414524, -0.6050111, 1.877451, 1, 0, 0.4980392, 1,
1.42325, -0.256727, 0.2724562, 1, 0, 0.4901961, 1,
1.424995, -0.658297, 0.822812, 1, 0, 0.4862745, 1,
1.425384, 0.4905032, 1.537836, 1, 0, 0.4784314, 1,
1.426327, -0.1473602, 2.822874, 1, 0, 0.4745098, 1,
1.428279, 0.223328, 2.449059, 1, 0, 0.4666667, 1,
1.445287, 1.798215, 0.1616158, 1, 0, 0.4627451, 1,
1.446122, -0.3717553, 3.099322, 1, 0, 0.454902, 1,
1.454029, 0.2440034, 1.633716, 1, 0, 0.4509804, 1,
1.454608, 0.6193747, -0.186841, 1, 0, 0.4431373, 1,
1.455541, 1.540046, 1.305839, 1, 0, 0.4392157, 1,
1.455806, -2.294325, 2.063358, 1, 0, 0.4313726, 1,
1.462823, 2.152961, -0.4703969, 1, 0, 0.427451, 1,
1.467054, -1.295506, 0.8513182, 1, 0, 0.4196078, 1,
1.470449, -0.4818127, 3.769867, 1, 0, 0.4156863, 1,
1.479112, -0.1494358, 1.045247, 1, 0, 0.4078431, 1,
1.482332, -0.7674254, 3.567845, 1, 0, 0.4039216, 1,
1.485623, 0.5956078, 2.835145, 1, 0, 0.3960784, 1,
1.486541, -0.6902637, 2.448833, 1, 0, 0.3882353, 1,
1.491289, 0.9978341, 0.5267147, 1, 0, 0.3843137, 1,
1.513131, -0.9449096, -0.5966747, 1, 0, 0.3764706, 1,
1.537399, -1.229722, 2.100482, 1, 0, 0.372549, 1,
1.551444, -1.20359, 1.43657, 1, 0, 0.3647059, 1,
1.570129, -1.353564, 2.047377, 1, 0, 0.3607843, 1,
1.572988, 0.3864915, 2.411653, 1, 0, 0.3529412, 1,
1.573223, -0.4537796, 2.699015, 1, 0, 0.3490196, 1,
1.575691, -1.52363, 3.662959, 1, 0, 0.3411765, 1,
1.589453, 1.096955, -1.045383, 1, 0, 0.3372549, 1,
1.595805, 0.3425261, 2.141554, 1, 0, 0.3294118, 1,
1.597337, 0.2020955, 1.187605, 1, 0, 0.3254902, 1,
1.598025, 0.3592555, 1.904192, 1, 0, 0.3176471, 1,
1.599315, -0.1957824, 1.388382, 1, 0, 0.3137255, 1,
1.633267, -1.365626, 3.57997, 1, 0, 0.3058824, 1,
1.647625, 1.528118, 0.1639962, 1, 0, 0.2980392, 1,
1.686197, 0.2392555, 2.314885, 1, 0, 0.2941177, 1,
1.690179, -0.4882248, 0.4935893, 1, 0, 0.2862745, 1,
1.700016, -1.065198, 3.358874, 1, 0, 0.282353, 1,
1.718556, -1.107683, 3.753114, 1, 0, 0.2745098, 1,
1.722159, 0.3153867, 2.905916, 1, 0, 0.2705882, 1,
1.723731, -0.5552438, 0.3761404, 1, 0, 0.2627451, 1,
1.729673, -0.2468787, 2.17375, 1, 0, 0.2588235, 1,
1.730412, -0.1728593, 0.9308203, 1, 0, 0.2509804, 1,
1.735241, -0.6225203, 0.0852779, 1, 0, 0.2470588, 1,
1.742257, -2.294756, 3.002167, 1, 0, 0.2392157, 1,
1.771821, -1.24033, 2.403848, 1, 0, 0.2352941, 1,
1.778969, 2.141259, -0.3526156, 1, 0, 0.227451, 1,
1.78094, -0.4704478, 2.668338, 1, 0, 0.2235294, 1,
1.783183, -1.493893, 2.019744, 1, 0, 0.2156863, 1,
1.788315, -0.3361003, 2.278696, 1, 0, 0.2117647, 1,
1.800726, 0.8033586, 2.69186, 1, 0, 0.2039216, 1,
1.832844, 0.2597525, 1.836833, 1, 0, 0.1960784, 1,
1.842089, -1.650777, 2.267022, 1, 0, 0.1921569, 1,
1.843075, -0.4160946, 1.462819, 1, 0, 0.1843137, 1,
1.871771, 0.3691217, 1.31596, 1, 0, 0.1803922, 1,
1.883588, -0.4460702, 2.996079, 1, 0, 0.172549, 1,
1.884846, 0.6340296, 1.309804, 1, 0, 0.1686275, 1,
1.903898, 0.555892, 1.362191, 1, 0, 0.1607843, 1,
1.911052, -1.119796, 4.09782, 1, 0, 0.1568628, 1,
1.919209, -0.8219284, 1.885565, 1, 0, 0.1490196, 1,
1.93846, -1.444942, 3.499114, 1, 0, 0.145098, 1,
1.951564, 1.878366, 0.6053577, 1, 0, 0.1372549, 1,
1.966785, -0.1053112, 2.613703, 1, 0, 0.1333333, 1,
1.968808, -0.4462337, -0.3773415, 1, 0, 0.1254902, 1,
1.978025, 2.630167, 1.035615, 1, 0, 0.1215686, 1,
1.993762, 2.408443, 3.621192, 1, 0, 0.1137255, 1,
2.032362, 0.2497763, 2.996753, 1, 0, 0.1098039, 1,
2.053105, 0.8507485, 0.5229703, 1, 0, 0.1019608, 1,
2.05548, -0.8992391, 2.83389, 1, 0, 0.09411765, 1,
2.092411, 0.489801, 3.293551, 1, 0, 0.09019608, 1,
2.107645, 0.3429652, 1.511925, 1, 0, 0.08235294, 1,
2.148699, 1.08914, 0.4848071, 1, 0, 0.07843138, 1,
2.15036, 0.03757493, 3.76761, 1, 0, 0.07058824, 1,
2.153641, -0.8650491, 2.189532, 1, 0, 0.06666667, 1,
2.157222, -0.2965074, -1.183286, 1, 0, 0.05882353, 1,
2.239984, 0.9246048, 2.209819, 1, 0, 0.05490196, 1,
2.313973, -0.7220089, 1.617579, 1, 0, 0.04705882, 1,
2.411441, -1.566342, 1.60529, 1, 0, 0.04313726, 1,
2.419702, 0.01989419, 2.334412, 1, 0, 0.03529412, 1,
2.467039, 1.225757, 0.9446578, 1, 0, 0.03137255, 1,
2.468412, -0.5414241, 1.632367, 1, 0, 0.02352941, 1,
2.522252, -0.1391819, 1.975054, 1, 0, 0.01960784, 1,
2.760904, 0.5025676, 3.081547, 1, 0, 0.01176471, 1,
2.897439, -0.1658907, 1.594975, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-0.2551477, -4.743841, -7.081245, 0, -0.5, 0.5, 0.5,
-0.2551477, -4.743841, -7.081245, 1, -0.5, 0.5, 0.5,
-0.2551477, -4.743841, -7.081245, 1, 1.5, 0.5, 0.5,
-0.2551477, -4.743841, -7.081245, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.47646, -0.3335073, -7.081245, 0, -0.5, 0.5, 0.5,
-4.47646, -0.3335073, -7.081245, 1, -0.5, 0.5, 0.5,
-4.47646, -0.3335073, -7.081245, 1, 1.5, 0.5, 0.5,
-4.47646, -0.3335073, -7.081245, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.47646, -4.743841, 0.641367, 0, -0.5, 0.5, 0.5,
-4.47646, -4.743841, 0.641367, 1, -0.5, 0.5, 0.5,
-4.47646, -4.743841, 0.641367, 1, 1.5, 0.5, 0.5,
-4.47646, -4.743841, 0.641367, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-3, -3.726071, -5.299104,
2, -3.726071, -5.299104,
-3, -3.726071, -5.299104,
-3, -3.8957, -5.596128,
-2, -3.726071, -5.299104,
-2, -3.8957, -5.596128,
-1, -3.726071, -5.299104,
-1, -3.8957, -5.596128,
0, -3.726071, -5.299104,
0, -3.8957, -5.596128,
1, -3.726071, -5.299104,
1, -3.8957, -5.596128,
2, -3.726071, -5.299104,
2, -3.8957, -5.596128
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3, -4.234956, -6.190175, 0, -0.5, 0.5, 0.5,
-3, -4.234956, -6.190175, 1, -0.5, 0.5, 0.5,
-3, -4.234956, -6.190175, 1, 1.5, 0.5, 0.5,
-3, -4.234956, -6.190175, 0, 1.5, 0.5, 0.5,
-2, -4.234956, -6.190175, 0, -0.5, 0.5, 0.5,
-2, -4.234956, -6.190175, 1, -0.5, 0.5, 0.5,
-2, -4.234956, -6.190175, 1, 1.5, 0.5, 0.5,
-2, -4.234956, -6.190175, 0, 1.5, 0.5, 0.5,
-1, -4.234956, -6.190175, 0, -0.5, 0.5, 0.5,
-1, -4.234956, -6.190175, 1, -0.5, 0.5, 0.5,
-1, -4.234956, -6.190175, 1, 1.5, 0.5, 0.5,
-1, -4.234956, -6.190175, 0, 1.5, 0.5, 0.5,
0, -4.234956, -6.190175, 0, -0.5, 0.5, 0.5,
0, -4.234956, -6.190175, 1, -0.5, 0.5, 0.5,
0, -4.234956, -6.190175, 1, 1.5, 0.5, 0.5,
0, -4.234956, -6.190175, 0, 1.5, 0.5, 0.5,
1, -4.234956, -6.190175, 0, -0.5, 0.5, 0.5,
1, -4.234956, -6.190175, 1, -0.5, 0.5, 0.5,
1, -4.234956, -6.190175, 1, 1.5, 0.5, 0.5,
1, -4.234956, -6.190175, 0, 1.5, 0.5, 0.5,
2, -4.234956, -6.190175, 0, -0.5, 0.5, 0.5,
2, -4.234956, -6.190175, 1, -0.5, 0.5, 0.5,
2, -4.234956, -6.190175, 1, 1.5, 0.5, 0.5,
2, -4.234956, -6.190175, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-3.502311, -3, -5.299104,
-3.502311, 2, -5.299104,
-3.502311, -3, -5.299104,
-3.66467, -3, -5.596128,
-3.502311, -2, -5.299104,
-3.66467, -2, -5.596128,
-3.502311, -1, -5.299104,
-3.66467, -1, -5.596128,
-3.502311, 0, -5.299104,
-3.66467, 0, -5.596128,
-3.502311, 1, -5.299104,
-3.66467, 1, -5.596128,
-3.502311, 2, -5.299104,
-3.66467, 2, -5.596128
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.989386, -3, -6.190175, 0, -0.5, 0.5, 0.5,
-3.989386, -3, -6.190175, 1, -0.5, 0.5, 0.5,
-3.989386, -3, -6.190175, 1, 1.5, 0.5, 0.5,
-3.989386, -3, -6.190175, 0, 1.5, 0.5, 0.5,
-3.989386, -2, -6.190175, 0, -0.5, 0.5, 0.5,
-3.989386, -2, -6.190175, 1, -0.5, 0.5, 0.5,
-3.989386, -2, -6.190175, 1, 1.5, 0.5, 0.5,
-3.989386, -2, -6.190175, 0, 1.5, 0.5, 0.5,
-3.989386, -1, -6.190175, 0, -0.5, 0.5, 0.5,
-3.989386, -1, -6.190175, 1, -0.5, 0.5, 0.5,
-3.989386, -1, -6.190175, 1, 1.5, 0.5, 0.5,
-3.989386, -1, -6.190175, 0, 1.5, 0.5, 0.5,
-3.989386, 0, -6.190175, 0, -0.5, 0.5, 0.5,
-3.989386, 0, -6.190175, 1, -0.5, 0.5, 0.5,
-3.989386, 0, -6.190175, 1, 1.5, 0.5, 0.5,
-3.989386, 0, -6.190175, 0, 1.5, 0.5, 0.5,
-3.989386, 1, -6.190175, 0, -0.5, 0.5, 0.5,
-3.989386, 1, -6.190175, 1, -0.5, 0.5, 0.5,
-3.989386, 1, -6.190175, 1, 1.5, 0.5, 0.5,
-3.989386, 1, -6.190175, 0, 1.5, 0.5, 0.5,
-3.989386, 2, -6.190175, 0, -0.5, 0.5, 0.5,
-3.989386, 2, -6.190175, 1, -0.5, 0.5, 0.5,
-3.989386, 2, -6.190175, 1, 1.5, 0.5, 0.5,
-3.989386, 2, -6.190175, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-3.502311, -3.726071, -4,
-3.502311, -3.726071, 6,
-3.502311, -3.726071, -4,
-3.66467, -3.8957, -4,
-3.502311, -3.726071, -2,
-3.66467, -3.8957, -2,
-3.502311, -3.726071, 0,
-3.66467, -3.8957, 0,
-3.502311, -3.726071, 2,
-3.66467, -3.8957, 2,
-3.502311, -3.726071, 4,
-3.66467, -3.8957, 4,
-3.502311, -3.726071, 6,
-3.66467, -3.8957, 6
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4",
"6"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.989386, -4.234956, -4, 0, -0.5, 0.5, 0.5,
-3.989386, -4.234956, -4, 1, -0.5, 0.5, 0.5,
-3.989386, -4.234956, -4, 1, 1.5, 0.5, 0.5,
-3.989386, -4.234956, -4, 0, 1.5, 0.5, 0.5,
-3.989386, -4.234956, -2, 0, -0.5, 0.5, 0.5,
-3.989386, -4.234956, -2, 1, -0.5, 0.5, 0.5,
-3.989386, -4.234956, -2, 1, 1.5, 0.5, 0.5,
-3.989386, -4.234956, -2, 0, 1.5, 0.5, 0.5,
-3.989386, -4.234956, 0, 0, -0.5, 0.5, 0.5,
-3.989386, -4.234956, 0, 1, -0.5, 0.5, 0.5,
-3.989386, -4.234956, 0, 1, 1.5, 0.5, 0.5,
-3.989386, -4.234956, 0, 0, 1.5, 0.5, 0.5,
-3.989386, -4.234956, 2, 0, -0.5, 0.5, 0.5,
-3.989386, -4.234956, 2, 1, -0.5, 0.5, 0.5,
-3.989386, -4.234956, 2, 1, 1.5, 0.5, 0.5,
-3.989386, -4.234956, 2, 0, 1.5, 0.5, 0.5,
-3.989386, -4.234956, 4, 0, -0.5, 0.5, 0.5,
-3.989386, -4.234956, 4, 1, -0.5, 0.5, 0.5,
-3.989386, -4.234956, 4, 1, 1.5, 0.5, 0.5,
-3.989386, -4.234956, 4, 0, 1.5, 0.5, 0.5,
-3.989386, -4.234956, 6, 0, -0.5, 0.5, 0.5,
-3.989386, -4.234956, 6, 1, -0.5, 0.5, 0.5,
-3.989386, -4.234956, 6, 1, 1.5, 0.5, 0.5,
-3.989386, -4.234956, 6, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-3.502311, -3.726071, -5.299104,
-3.502311, 3.059057, -5.299104,
-3.502311, -3.726071, 6.581838,
-3.502311, 3.059057, 6.581838,
-3.502311, -3.726071, -5.299104,
-3.502311, -3.726071, 6.581838,
-3.502311, 3.059057, -5.299104,
-3.502311, 3.059057, 6.581838,
-3.502311, -3.726071, -5.299104,
2.992016, -3.726071, -5.299104,
-3.502311, -3.726071, 6.581838,
2.992016, -3.726071, 6.581838,
-3.502311, 3.059057, -5.299104,
2.992016, 3.059057, -5.299104,
-3.502311, 3.059057, 6.581838,
2.992016, 3.059057, 6.581838,
2.992016, -3.726071, -5.299104,
2.992016, 3.059057, -5.299104,
2.992016, -3.726071, 6.581838,
2.992016, 3.059057, 6.581838,
2.992016, -3.726071, -5.299104,
2.992016, -3.726071, 6.581838,
2.992016, 3.059057, -5.299104,
2.992016, 3.059057, 6.581838
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 8.087136;
var distance = 35.98058;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.2551477, 0.3335073, -0.641367 );
mvMatrix.scale( 1.346401, 1.288696, 0.7359661 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.98058);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 14);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 14);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 14);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
cycloxydim<-read.table("cycloxydim.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-cycloxydim$V2
```

```
## Error in eval(expr, envir, enclos): object 'cycloxydim' not found
```

```r
y<-cycloxydim$V3
```

```
## Error in eval(expr, envir, enclos): object 'cycloxydim' not found
```

```r
z<-cycloxydim$V4
```

```
## Error in eval(expr, envir, enclos): object 'cycloxydim' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-3.407734, -0.4476934, -0.5923649, 0, 0, 1, 1, 1,
-3.097365, 0.393425, -0.4244983, 1, 0, 0, 1, 1,
-2.680893, -0.6437591, -1.587243, 1, 0, 0, 1, 1,
-2.61924, -0.7714092, -1.519049, 1, 0, 0, 1, 1,
-2.617767, 2.256711, -1.223501, 1, 0, 0, 1, 1,
-2.604049, 1.892204, -0.341075, 1, 0, 0, 1, 1,
-2.590543, 0.8224792, -2.401602, 0, 0, 0, 1, 1,
-2.549904, -0.122308, -1.8309, 0, 0, 0, 1, 1,
-2.502296, 1.670558, -1.528269, 0, 0, 0, 1, 1,
-2.493798, 0.230768, -0.781876, 0, 0, 0, 1, 1,
-2.401033, 1.190655, -1.551383, 0, 0, 0, 1, 1,
-2.289268, -1.413518, -2.888222, 0, 0, 0, 1, 1,
-2.267238, -1.753167, -3.122787, 0, 0, 0, 1, 1,
-2.250268, -0.6768262, -2.958927, 1, 1, 1, 1, 1,
-2.216278, -0.4974231, -3.138271, 1, 1, 1, 1, 1,
-2.208262, -0.5419639, -2.737715, 1, 1, 1, 1, 1,
-2.189581, -0.2960593, -0.5990683, 1, 1, 1, 1, 1,
-2.179691, -0.2496899, -3.718658, 1, 1, 1, 1, 1,
-2.165987, 0.1824794, -0.7539351, 1, 1, 1, 1, 1,
-2.145838, -0.5738648, -1.267136, 1, 1, 1, 1, 1,
-2.130387, 0.4112114, -2.563063, 1, 1, 1, 1, 1,
-2.09128, -0.3851551, -0.3251761, 1, 1, 1, 1, 1,
-1.972964, -0.7914395, -1.044314, 1, 1, 1, 1, 1,
-1.945176, 2.317363, -0.926901, 1, 1, 1, 1, 1,
-1.933403, 0.8005509, -2.312767, 1, 1, 1, 1, 1,
-1.92745, -0.4903974, -1.667927, 1, 1, 1, 1, 1,
-1.868021, -1.449515, -0.5376377, 1, 1, 1, 1, 1,
-1.858218, -0.6155039, -1.74628, 1, 1, 1, 1, 1,
-1.857466, -0.6283911, -1.0863, 0, 0, 1, 1, 1,
-1.855356, 0.3060233, 0.1305071, 1, 0, 0, 1, 1,
-1.853893, 0.0912469, -0.3540662, 1, 0, 0, 1, 1,
-1.84673, 0.06510875, -0.7430357, 1, 0, 0, 1, 1,
-1.828305, 1.468677, -1.067401, 1, 0, 0, 1, 1,
-1.826083, 1.110777, -1.503435, 1, 0, 0, 1, 1,
-1.824814, -1.797778, -2.621511, 0, 0, 0, 1, 1,
-1.812825, 1.542313, -0.6776182, 0, 0, 0, 1, 1,
-1.807888, 2.260271, -0.1286813, 0, 0, 0, 1, 1,
-1.806734, 1.614986, -3.116338, 0, 0, 0, 1, 1,
-1.799746, -0.9179616, -1.360214, 0, 0, 0, 1, 1,
-1.781476, 0.5904593, -2.603348, 0, 0, 0, 1, 1,
-1.776936, 1.092207, -0.6598549, 0, 0, 0, 1, 1,
-1.758101, 0.6553121, -1.245193, 1, 1, 1, 1, 1,
-1.742708, -1.222712, -1.194218, 1, 1, 1, 1, 1,
-1.722242, 0.9887831, -2.85874, 1, 1, 1, 1, 1,
-1.715064, 2.018055, -0.01770917, 1, 1, 1, 1, 1,
-1.701194, 0.218284, -1.855897, 1, 1, 1, 1, 1,
-1.696315, 1.097205, -1.410691, 1, 1, 1, 1, 1,
-1.692048, 0.1033421, -1.985865, 1, 1, 1, 1, 1,
-1.688814, 1.568675, -1.384531, 1, 1, 1, 1, 1,
-1.68176, -0.2245062, -3.085489, 1, 1, 1, 1, 1,
-1.667034, -3.627259, -2.69617, 1, 1, 1, 1, 1,
-1.663156, -0.3199574, -2.188458, 1, 1, 1, 1, 1,
-1.653245, 0.03058904, -2.315626, 1, 1, 1, 1, 1,
-1.64387, 1.703737, -1.197604, 1, 1, 1, 1, 1,
-1.642063, 0.2583734, -1.315006, 1, 1, 1, 1, 1,
-1.631409, -1.25892, -3.001663, 1, 1, 1, 1, 1,
-1.6258, 0.8862358, -2.310804, 0, 0, 1, 1, 1,
-1.622953, 1.095688, 0.08162637, 1, 0, 0, 1, 1,
-1.59818, -0.3063655, -2.521505, 1, 0, 0, 1, 1,
-1.590276, -1.446492, -2.374226, 1, 0, 0, 1, 1,
-1.589454, 0.9250011, -1.71944, 1, 0, 0, 1, 1,
-1.571904, -0.5380844, -2.852646, 1, 0, 0, 1, 1,
-1.557857, -0.6688263, -1.853977, 0, 0, 0, 1, 1,
-1.554723, -0.1077666, -1.52134, 0, 0, 0, 1, 1,
-1.549701, -0.1281995, -1.980015, 0, 0, 0, 1, 1,
-1.548802, 1.220058, -3.128377, 0, 0, 0, 1, 1,
-1.548196, 1.799008, -0.3885154, 0, 0, 0, 1, 1,
-1.544273, 0.758794, -1.985264, 0, 0, 0, 1, 1,
-1.51377, -0.7631364, -2.205408, 0, 0, 0, 1, 1,
-1.503939, -0.5606766, -1.517292, 1, 1, 1, 1, 1,
-1.502213, -0.5645092, -0.1926955, 1, 1, 1, 1, 1,
-1.494358, -0.436164, -1.84599, 1, 1, 1, 1, 1,
-1.485316, -1.847644, -2.252243, 1, 1, 1, 1, 1,
-1.484149, 0.5258427, -0.1167428, 1, 1, 1, 1, 1,
-1.473636, -0.8770123, -0.9802768, 1, 1, 1, 1, 1,
-1.469155, -0.7299513, -1.407131, 1, 1, 1, 1, 1,
-1.458216, -0.2076254, -2.54869, 1, 1, 1, 1, 1,
-1.45561, 1.24123, -1.90451, 1, 1, 1, 1, 1,
-1.448007, -0.5291016, -2.50248, 1, 1, 1, 1, 1,
-1.443876, 2.567044, -0.3336443, 1, 1, 1, 1, 1,
-1.441547, 0.3663467, -2.735872, 1, 1, 1, 1, 1,
-1.431004, 1.142062, -2.002219, 1, 1, 1, 1, 1,
-1.390949, 1.821114, -0.386679, 1, 1, 1, 1, 1,
-1.386317, 0.3780858, -2.282608, 1, 1, 1, 1, 1,
-1.382681, -1.251166, -1.959852, 0, 0, 1, 1, 1,
-1.36627, 1.135442, 0.6727418, 1, 0, 0, 1, 1,
-1.360798, -1.916743, -1.15483, 1, 0, 0, 1, 1,
-1.360082, 0.7182103, -1.351401, 1, 0, 0, 1, 1,
-1.359019, 1.475421, 0.5904503, 1, 0, 0, 1, 1,
-1.353367, 2.108273, 0.9656052, 1, 0, 0, 1, 1,
-1.352978, -0.7484714, -0.6909846, 0, 0, 0, 1, 1,
-1.339743, 1.436174, 0.192185, 0, 0, 0, 1, 1,
-1.332769, 0.2094153, -0.668914, 0, 0, 0, 1, 1,
-1.325874, -1.753191, -3.200397, 0, 0, 0, 1, 1,
-1.315594, 0.8209568, -2.961777, 0, 0, 0, 1, 1,
-1.295714, 0.3349252, -2.639621, 0, 0, 0, 1, 1,
-1.292455, -1.03047, -4.128241, 0, 0, 0, 1, 1,
-1.289044, -2.249484, -3.320906, 1, 1, 1, 1, 1,
-1.288751, -0.09590077, -1.541488, 1, 1, 1, 1, 1,
-1.274857, 0.627874, -1.816477, 1, 1, 1, 1, 1,
-1.272605, -0.0009955384, -1.423592, 1, 1, 1, 1, 1,
-1.271368, 0.31732, -3.342411, 1, 1, 1, 1, 1,
-1.26188, 0.3773624, -1.502885, 1, 1, 1, 1, 1,
-1.258972, -1.046985, -0.7485548, 1, 1, 1, 1, 1,
-1.239277, 0.6327893, -0.7519739, 1, 1, 1, 1, 1,
-1.237206, 0.481939, -0.899419, 1, 1, 1, 1, 1,
-1.228144, -1.038853, -3.634355, 1, 1, 1, 1, 1,
-1.214328, -0.259979, -2.343835, 1, 1, 1, 1, 1,
-1.207587, -0.1488538, -2.117002, 1, 1, 1, 1, 1,
-1.200152, -0.3426637, -0.439934, 1, 1, 1, 1, 1,
-1.194779, 0.4092614, -2.062, 1, 1, 1, 1, 1,
-1.185574, 0.3002688, -3.638747, 1, 1, 1, 1, 1,
-1.17663, -0.8153346, -1.961127, 0, 0, 1, 1, 1,
-1.176113, 1.224526, -0.8715427, 1, 0, 0, 1, 1,
-1.170865, 0.5296882, -0.4789234, 1, 0, 0, 1, 1,
-1.168834, 1.135596, -1.828466, 1, 0, 0, 1, 1,
-1.166121, 0.6033254, -1.598071, 1, 0, 0, 1, 1,
-1.153478, -1.460606, -4.369052, 1, 0, 0, 1, 1,
-1.150962, 0.3678505, -1.002324, 0, 0, 0, 1, 1,
-1.148796, -0.6628747, -0.5547972, 0, 0, 0, 1, 1,
-1.145479, 0.4815699, -1.577499, 0, 0, 0, 1, 1,
-1.142361, -0.5742041, -1.520661, 0, 0, 0, 1, 1,
-1.142144, -0.3459739, -2.593837, 0, 0, 0, 1, 1,
-1.13687, 0.02258982, -1.220959, 0, 0, 0, 1, 1,
-1.136479, 0.5729409, -0.4136564, 0, 0, 0, 1, 1,
-1.135889, -0.3020023, -1.232575, 1, 1, 1, 1, 1,
-1.135016, 0.818298, -1.230559, 1, 1, 1, 1, 1,
-1.131095, 0.5548759, -2.028804, 1, 1, 1, 1, 1,
-1.122864, -1.562821, -2.650764, 1, 1, 1, 1, 1,
-1.109012, 0.3467118, -2.740031, 1, 1, 1, 1, 1,
-1.108429, 0.3777096, 0.496429, 1, 1, 1, 1, 1,
-1.101246, 0.7134241, -1.522511, 1, 1, 1, 1, 1,
-1.098003, -1.676312, -2.019691, 1, 1, 1, 1, 1,
-1.095804, -1.538131, -4.068478, 1, 1, 1, 1, 1,
-1.091847, 0.03946459, -0.92206, 1, 1, 1, 1, 1,
-1.087752, 0.6890109, -0.3532131, 1, 1, 1, 1, 1,
-1.078686, 1.180482, -0.39763, 1, 1, 1, 1, 1,
-1.07116, -1.158285, -1.98898, 1, 1, 1, 1, 1,
-1.064878, 1.428817, -0.05606212, 1, 1, 1, 1, 1,
-1.06377, -0.2289089, -0.555643, 1, 1, 1, 1, 1,
-1.062736, 0.4490736, -1.773183, 0, 0, 1, 1, 1,
-1.058831, 0.02808838, -1.356766, 1, 0, 0, 1, 1,
-1.047149, -0.1683585, -1.947798, 1, 0, 0, 1, 1,
-1.046286, -1.591365, -4.368007, 1, 0, 0, 1, 1,
-1.045781, -1.179104, -4.664116, 1, 0, 0, 1, 1,
-1.045659, 0.00434862, -1.663397, 1, 0, 0, 1, 1,
-1.04557, 0.3481843, -0.8930178, 0, 0, 0, 1, 1,
-1.040838, -0.3791713, -0.626851, 0, 0, 0, 1, 1,
-1.04061, 0.9093869, -1.906944, 0, 0, 0, 1, 1,
-1.039181, -0.8470361, 1.584749, 0, 0, 0, 1, 1,
-1.036045, -1.326845, -1.253378, 0, 0, 0, 1, 1,
-1.0348, 0.1841682, 0.1747232, 0, 0, 0, 1, 1,
-1.032014, 0.4821915, -1.605906, 0, 0, 0, 1, 1,
-1.030837, 0.7262141, -1.819878, 1, 1, 1, 1, 1,
-1.02846, -1.216285, -1.226512, 1, 1, 1, 1, 1,
-1.02588, -0.6912621, -0.7472652, 1, 1, 1, 1, 1,
-1.025304, -0.7685559, -2.933098, 1, 1, 1, 1, 1,
-1.024952, -0.8731157, -3.876338, 1, 1, 1, 1, 1,
-1.024269, 0.8593948, -1.499006, 1, 1, 1, 1, 1,
-1.020863, 1.050195, -1.185347, 1, 1, 1, 1, 1,
-1.011453, 0.1505521, 0.6699645, 1, 1, 1, 1, 1,
-1.009481, 0.3125763, -0.5135671, 1, 1, 1, 1, 1,
-1.009144, 1.516314, -0.8750353, 1, 1, 1, 1, 1,
-1.005177, 0.8506781, -2.849163, 1, 1, 1, 1, 1,
-1.001631, -0.366311, -2.711344, 1, 1, 1, 1, 1,
-1.000849, 1.893467, -0.8109045, 1, 1, 1, 1, 1,
-0.998876, -0.8335284, -1.313928, 1, 1, 1, 1, 1,
-0.998106, 0.06620771, -1.611741, 1, 1, 1, 1, 1,
-0.9942031, 0.4507114, -1.506236, 0, 0, 1, 1, 1,
-0.9920129, -0.4798258, -2.019602, 1, 0, 0, 1, 1,
-0.9844263, 0.7667295, -0.07511634, 1, 0, 0, 1, 1,
-0.9828201, -0.263427, 0.961524, 1, 0, 0, 1, 1,
-0.9764455, 0.2810934, -0.3193561, 1, 0, 0, 1, 1,
-0.9666323, 0.796082, -0.4874324, 1, 0, 0, 1, 1,
-0.9505503, 1.876548, -1.793725, 0, 0, 0, 1, 1,
-0.9461048, 0.3213235, -0.6691638, 0, 0, 0, 1, 1,
-0.9460672, -1.88638, -4.128964, 0, 0, 0, 1, 1,
-0.9451141, -0.4409393, -1.520472, 0, 0, 0, 1, 1,
-0.9374581, -1.85734, -2.384953, 0, 0, 0, 1, 1,
-0.9368581, 0.3943485, -1.141125, 0, 0, 0, 1, 1,
-0.9338003, 0.07286117, -1.654975, 0, 0, 0, 1, 1,
-0.9286461, 0.4846688, -2.119029, 1, 1, 1, 1, 1,
-0.9248254, 2.144152, -2.732685, 1, 1, 1, 1, 1,
-0.9183215, 0.1788764, -1.686002, 1, 1, 1, 1, 1,
-0.9133969, -0.383796, -2.91581, 1, 1, 1, 1, 1,
-0.9126306, -2.117476, -1.618636, 1, 1, 1, 1, 1,
-0.9104884, 0.6594228, -2.191425, 1, 1, 1, 1, 1,
-0.9036134, -1.500187, -3.578872, 1, 1, 1, 1, 1,
-0.8973865, -1.61636, -5.102302, 1, 1, 1, 1, 1,
-0.8971281, -1.626643, -3.843803, 1, 1, 1, 1, 1,
-0.8890339, 1.538721, -1.326125, 1, 1, 1, 1, 1,
-0.8848661, -0.4414559, -3.026703, 1, 1, 1, 1, 1,
-0.8811362, 0.3731985, -1.071304, 1, 1, 1, 1, 1,
-0.8722467, -1.26115, -1.604284, 1, 1, 1, 1, 1,
-0.8717615, 0.6370141, 0.6971206, 1, 1, 1, 1, 1,
-0.8713529, 0.4136156, -1.077306, 1, 1, 1, 1, 1,
-0.870821, -1.597417, -4.357851, 0, 0, 1, 1, 1,
-0.8639376, 0.372268, -1.795738, 1, 0, 0, 1, 1,
-0.8590721, 1.201819, 0.4985343, 1, 0, 0, 1, 1,
-0.8589057, 0.6534601, 0.06530232, 1, 0, 0, 1, 1,
-0.8582304, -0.6134534, -3.257789, 1, 0, 0, 1, 1,
-0.8522726, -0.6574828, -2.274462, 1, 0, 0, 1, 1,
-0.8475685, 0.8049937, -0.01811294, 0, 0, 0, 1, 1,
-0.8430193, -1.214631, -2.944831, 0, 0, 0, 1, 1,
-0.8338676, -0.5410551, -3.145658, 0, 0, 0, 1, 1,
-0.8335204, 0.6594359, -0.8509452, 0, 0, 0, 1, 1,
-0.8328726, 0.6929486, -0.407147, 0, 0, 0, 1, 1,
-0.8325791, -0.4312996, -3.223093, 0, 0, 0, 1, 1,
-0.8318041, -1.16216, -2.654326, 0, 0, 0, 1, 1,
-0.8285972, -0.08098659, -2.831702, 1, 1, 1, 1, 1,
-0.8284771, -0.2001317, -1.572773, 1, 1, 1, 1, 1,
-0.8249061, 1.132004, -1.366226, 1, 1, 1, 1, 1,
-0.8234552, -0.5547258, -2.791374, 1, 1, 1, 1, 1,
-0.8209835, 0.8516814, -0.8451645, 1, 1, 1, 1, 1,
-0.8204487, 1.012645, -1.922572, 1, 1, 1, 1, 1,
-0.8142232, 0.2701575, -1.589606, 1, 1, 1, 1, 1,
-0.8125659, -0.9394871, -2.646636, 1, 1, 1, 1, 1,
-0.8093836, -0.1594514, -2.447648, 1, 1, 1, 1, 1,
-0.8066948, -0.5799139, -2.500294, 1, 1, 1, 1, 1,
-0.7970495, 0.1125675, -0.9899089, 1, 1, 1, 1, 1,
-0.7951558, -0.5416927, -2.390508, 1, 1, 1, 1, 1,
-0.7852696, 1.091276, 0.2648199, 1, 1, 1, 1, 1,
-0.779041, -0.6739717, -1.094878, 1, 1, 1, 1, 1,
-0.7778962, 0.436125, -0.3799252, 1, 1, 1, 1, 1,
-0.7772961, -1.016054, -4.090464, 0, 0, 1, 1, 1,
-0.7759542, 1.137305, -1.52273, 1, 0, 0, 1, 1,
-0.7749624, -0.6326352, -3.124744, 1, 0, 0, 1, 1,
-0.7748626, -0.7623067, -2.880456, 1, 0, 0, 1, 1,
-0.7677444, -0.5468696, -2.560112, 1, 0, 0, 1, 1,
-0.7629782, -2.793134, -3.194105, 1, 0, 0, 1, 1,
-0.7569916, -0.983925, -1.720458, 0, 0, 0, 1, 1,
-0.7565875, 0.5688011, -0.3827435, 0, 0, 0, 1, 1,
-0.7558952, 1.32539, -0.1220853, 0, 0, 0, 1, 1,
-0.7550583, 0.3732556, -0.3936746, 0, 0, 0, 1, 1,
-0.7457751, -2.240252, -3.717194, 0, 0, 0, 1, 1,
-0.7428815, -0.8022916, -3.790466, 0, 0, 0, 1, 1,
-0.7425521, 0.1719531, -2.822113, 0, 0, 0, 1, 1,
-0.7416737, 2.042366, 0.02500145, 1, 1, 1, 1, 1,
-0.7409964, -1.378039, -4.940717, 1, 1, 1, 1, 1,
-0.7398761, -2.022763, -0.7598196, 1, 1, 1, 1, 1,
-0.7396947, -2.691113, -0.5392721, 1, 1, 1, 1, 1,
-0.7373892, -0.611807, -2.282867, 1, 1, 1, 1, 1,
-0.7333092, -0.3528658, -1.692049, 1, 1, 1, 1, 1,
-0.7285715, -0.5075046, -2.07295, 1, 1, 1, 1, 1,
-0.7277054, 0.6752805, -2.076047, 1, 1, 1, 1, 1,
-0.7275907, -1.432573, -1.744074, 1, 1, 1, 1, 1,
-0.7126166, 1.066785, -1.388906, 1, 1, 1, 1, 1,
-0.7103339, 0.1329375, -0.772608, 1, 1, 1, 1, 1,
-0.709197, 0.8251289, 0.6555815, 1, 1, 1, 1, 1,
-0.7064196, 1.57157, -0.4924281, 1, 1, 1, 1, 1,
-0.7060658, 0.5115923, -2.226053, 1, 1, 1, 1, 1,
-0.7046486, 0.166113, -2.796439, 1, 1, 1, 1, 1,
-0.6981352, -0.6712412, -2.519276, 0, 0, 1, 1, 1,
-0.6960873, -1.268212, -1.760811, 1, 0, 0, 1, 1,
-0.695778, -0.7780601, -1.7243, 1, 0, 0, 1, 1,
-0.6955078, -1.647545, -1.610601, 1, 0, 0, 1, 1,
-0.6940383, 0.5101204, -0.5748691, 1, 0, 0, 1, 1,
-0.6925365, -0.8866352, -2.436972, 1, 0, 0, 1, 1,
-0.6914656, -1.302038, -3.348333, 0, 0, 0, 1, 1,
-0.690931, 0.6989428, -1.679053, 0, 0, 0, 1, 1,
-0.6868817, -0.6155754, -1.483233, 0, 0, 0, 1, 1,
-0.6849862, 0.685385, -0.1731102, 0, 0, 0, 1, 1,
-0.679153, 0.2892645, -1.115152, 0, 0, 0, 1, 1,
-0.675505, -0.1421621, -2.400707, 0, 0, 0, 1, 1,
-0.6734063, 1.678503, -0.9296668, 0, 0, 0, 1, 1,
-0.6720621, -1.367682, -4.28597, 1, 1, 1, 1, 1,
-0.6669031, 1.571527, -0.6175563, 1, 1, 1, 1, 1,
-0.6579971, -1.226354, -2.309311, 1, 1, 1, 1, 1,
-0.6570253, -0.2621074, -1.189765, 1, 1, 1, 1, 1,
-0.6521241, -1.270188, -2.695325, 1, 1, 1, 1, 1,
-0.6459059, 0.1666172, -2.569942, 1, 1, 1, 1, 1,
-0.6455498, -1.585813, -3.645352, 1, 1, 1, 1, 1,
-0.6440948, 1.515322, -0.1474034, 1, 1, 1, 1, 1,
-0.6413704, -1.29837, -1.024194, 1, 1, 1, 1, 1,
-0.6369363, -0.1960643, -1.763563, 1, 1, 1, 1, 1,
-0.6355931, 1.339685, 0.04438262, 1, 1, 1, 1, 1,
-0.6317387, 2.195791, 2.464713, 1, 1, 1, 1, 1,
-0.6297762, -1.809536, -4.235954, 1, 1, 1, 1, 1,
-0.6252806, -0.9577156, -3.01255, 1, 1, 1, 1, 1,
-0.6234307, 1.681088, 1.36136, 1, 1, 1, 1, 1,
-0.6230548, -0.3414007, -2.323501, 0, 0, 1, 1, 1,
-0.6214467, -0.817382, -2.262963, 1, 0, 0, 1, 1,
-0.6200279, -2.172174, -4.201285, 1, 0, 0, 1, 1,
-0.6197704, -1.984174, -4.048072, 1, 0, 0, 1, 1,
-0.6191874, 0.6576436, -1.73657, 1, 0, 0, 1, 1,
-0.618128, -1.470251, -2.382752, 1, 0, 0, 1, 1,
-0.6163545, -0.4756303, -1.622729, 0, 0, 0, 1, 1,
-0.6124349, 1.573542, -0.273764, 0, 0, 0, 1, 1,
-0.6112039, -0.9184068, -2.511232, 0, 0, 0, 1, 1,
-0.6029862, 0.1504963, -2.917452, 0, 0, 0, 1, 1,
-0.6025873, -0.04861551, -1.783942, 0, 0, 0, 1, 1,
-0.6025525, 0.9519857, -1.860731, 0, 0, 0, 1, 1,
-0.60232, 1.467878, 0.2855973, 0, 0, 0, 1, 1,
-0.601203, -0.5044711, -3.54775, 1, 1, 1, 1, 1,
-0.5984883, -2.225115, -4.124382, 1, 1, 1, 1, 1,
-0.5950452, 1.251595, -0.2368618, 1, 1, 1, 1, 1,
-0.5902872, -0.6668533, -1.337486, 1, 1, 1, 1, 1,
-0.5880683, 1.597837, -0.04299948, 1, 1, 1, 1, 1,
-0.5833279, -0.07923947, -2.682855, 1, 1, 1, 1, 1,
-0.5677446, -0.1466132, 0.08731652, 1, 1, 1, 1, 1,
-0.5673505, -0.1325949, -1.887734, 1, 1, 1, 1, 1,
-0.5671794, 0.246384, -0.8511505, 1, 1, 1, 1, 1,
-0.5665139, -0.7866962, -4.233073, 1, 1, 1, 1, 1,
-0.5602375, -0.2709698, -1.189956, 1, 1, 1, 1, 1,
-0.5548576, -1.728096, -2.942929, 1, 1, 1, 1, 1,
-0.5532846, -1.649549, -1.816416, 1, 1, 1, 1, 1,
-0.5500106, 1.44281, -0.05828537, 1, 1, 1, 1, 1,
-0.5484155, 2.87308, 0.4401426, 1, 1, 1, 1, 1,
-0.5481986, -0.7457031, -0.6468141, 0, 0, 1, 1, 1,
-0.5420589, -0.2734, -2.748918, 1, 0, 0, 1, 1,
-0.5402086, 0.438285, -1.734052, 1, 0, 0, 1, 1,
-0.5349115, -0.5329739, -2.764048, 1, 0, 0, 1, 1,
-0.5323491, -1.882501, -2.477364, 1, 0, 0, 1, 1,
-0.5319344, 1.527313, 0.492011, 1, 0, 0, 1, 1,
-0.5255393, 0.1120004, -2.279449, 0, 0, 0, 1, 1,
-0.5227882, -0.661225, -1.89386, 0, 0, 0, 1, 1,
-0.5216858, 0.809153, 0.814131, 0, 0, 0, 1, 1,
-0.5195751, -1.261083, -3.586526, 0, 0, 0, 1, 1,
-0.5191572, -0.1797439, -0.3726863, 0, 0, 0, 1, 1,
-0.5166767, -0.8345312, -2.510022, 0, 0, 0, 1, 1,
-0.5162771, 0.5763534, -0.8529264, 0, 0, 0, 1, 1,
-0.515098, 0.6557913, 1.117042, 1, 1, 1, 1, 1,
-0.5138137, -0.2026219, -2.801465, 1, 1, 1, 1, 1,
-0.5121999, -0.9012448, -2.804024, 1, 1, 1, 1, 1,
-0.5106869, 1.97256, 1.361172, 1, 1, 1, 1, 1,
-0.49834, 0.6545594, -0.9129726, 1, 1, 1, 1, 1,
-0.4933153, 2.960244, -1.66509, 1, 1, 1, 1, 1,
-0.4894782, -0.9463257, -4.970251, 1, 1, 1, 1, 1,
-0.4890938, 0.8337633, 0.5448134, 1, 1, 1, 1, 1,
-0.4805158, 0.5515378, -1.809315, 1, 1, 1, 1, 1,
-0.4802779, -0.6274731, -5.126081, 1, 1, 1, 1, 1,
-0.477144, 1.506542, 2.293684, 1, 1, 1, 1, 1,
-0.4765365, 0.7415929, -1.402834, 1, 1, 1, 1, 1,
-0.4724974, -0.5688992, -1.42397, 1, 1, 1, 1, 1,
-0.471095, -0.3312098, -0.9752721, 1, 1, 1, 1, 1,
-0.4699898, -0.1097053, -2.96866, 1, 1, 1, 1, 1,
-0.4685356, 0.5090689, -1.502092, 0, 0, 1, 1, 1,
-0.4683282, -1.279688, -1.816583, 1, 0, 0, 1, 1,
-0.4673245, -0.1448847, -2.800783, 1, 0, 0, 1, 1,
-0.4662363, 0.4676486, -1.518781, 1, 0, 0, 1, 1,
-0.4647631, -0.4498869, -2.799942, 1, 0, 0, 1, 1,
-0.4642073, -0.9909875, -2.705318, 1, 0, 0, 1, 1,
-0.462746, -0.4098985, -1.878237, 0, 0, 0, 1, 1,
-0.4619683, -0.301965, -2.927753, 0, 0, 0, 1, 1,
-0.460127, -0.3267479, -1.569568, 0, 0, 0, 1, 1,
-0.454953, 1.332316, -0.3973685, 0, 0, 0, 1, 1,
-0.4541681, 0.6351393, 0.3518827, 0, 0, 0, 1, 1,
-0.4540917, -0.2161366, -4.395519, 0, 0, 0, 1, 1,
-0.4487036, 1.136737, -1.401778, 0, 0, 0, 1, 1,
-0.4399997, 1.504072, 1.841227, 1, 1, 1, 1, 1,
-0.438122, -1.51992, -1.517513, 1, 1, 1, 1, 1,
-0.4308926, -1.76548, -2.379395, 1, 1, 1, 1, 1,
-0.4305527, 0.3976303, -0.3420686, 1, 1, 1, 1, 1,
-0.4236959, 0.4912273, 0.1295911, 1, 1, 1, 1, 1,
-0.4234377, 0.1128825, 0.5191937, 1, 1, 1, 1, 1,
-0.419793, -1.214938, -2.591442, 1, 1, 1, 1, 1,
-0.4169728, -1.538546, -3.789754, 1, 1, 1, 1, 1,
-0.4144578, -0.8131036, -2.60392, 1, 1, 1, 1, 1,
-0.4139215, -0.7591866, -3.978868, 1, 1, 1, 1, 1,
-0.4107726, 1.006086, -0.1840281, 1, 1, 1, 1, 1,
-0.4062898, 0.01161225, -0.9295757, 1, 1, 1, 1, 1,
-0.4057323, -0.2902863, -3.578987, 1, 1, 1, 1, 1,
-0.4024593, -0.4900117, -1.063854, 1, 1, 1, 1, 1,
-0.4016296, -1.79458, -4.609379, 1, 1, 1, 1, 1,
-0.40145, -0.6340442, -3.025036, 0, 0, 1, 1, 1,
-0.3927588, -1.953941, -1.586539, 1, 0, 0, 1, 1,
-0.3904642, 0.2442571, -0.4617303, 1, 0, 0, 1, 1,
-0.3844502, 0.8704087, -0.7519512, 1, 0, 0, 1, 1,
-0.3841678, -0.9271829, -3.774362, 1, 0, 0, 1, 1,
-0.382691, -0.3798641, -3.121135, 1, 0, 0, 1, 1,
-0.3803836, -0.4594432, -1.002563, 0, 0, 0, 1, 1,
-0.3757419, -0.3139906, -3.402747, 0, 0, 0, 1, 1,
-0.3667567, 0.9622985, -1.588106, 0, 0, 0, 1, 1,
-0.3662788, -1.420999, -3.51366, 0, 0, 0, 1, 1,
-0.3597918, -1.826548, -2.959407, 0, 0, 0, 1, 1,
-0.3597403, 0.3375698, -0.0750411, 0, 0, 0, 1, 1,
-0.3595792, 0.6242118, -0.1067695, 0, 0, 0, 1, 1,
-0.3593733, -0.07696394, -1.366734, 1, 1, 1, 1, 1,
-0.3569064, -0.06667285, -2.261281, 1, 1, 1, 1, 1,
-0.3479538, 0.588258, -1.208281, 1, 1, 1, 1, 1,
-0.3470726, 0.4933308, 0.6317891, 1, 1, 1, 1, 1,
-0.3465987, -1.317116, -3.013785, 1, 1, 1, 1, 1,
-0.3373489, -0.760309, -3.080367, 1, 1, 1, 1, 1,
-0.335211, -0.9159315, -1.78199, 1, 1, 1, 1, 1,
-0.3276282, 1.041675, 0.3446263, 1, 1, 1, 1, 1,
-0.3253943, -0.03812503, -0.8804235, 1, 1, 1, 1, 1,
-0.3242599, -0.5563624, -2.630583, 1, 1, 1, 1, 1,
-0.3242491, 0.96424, 0.5848337, 1, 1, 1, 1, 1,
-0.3231942, -0.3625551, -2.306361, 1, 1, 1, 1, 1,
-0.3219532, 0.4094191, -1.78816, 1, 1, 1, 1, 1,
-0.319685, -1.953424, -3.520664, 1, 1, 1, 1, 1,
-0.3177557, -0.9807274, -3.22284, 1, 1, 1, 1, 1,
-0.3165486, -0.3278207, -2.335618, 0, 0, 1, 1, 1,
-0.313686, 0.6765338, -0.0172059, 1, 0, 0, 1, 1,
-0.3122663, 0.1275388, -2.887275, 1, 0, 0, 1, 1,
-0.311475, 0.6086296, -0.2806195, 1, 0, 0, 1, 1,
-0.3095669, 0.651353, -1.919469, 1, 0, 0, 1, 1,
-0.3059829, -0.7271423, -3.692486, 1, 0, 0, 1, 1,
-0.3024735, 0.292581, -0.6102213, 0, 0, 0, 1, 1,
-0.3000066, -0.5758709, -3.803197, 0, 0, 0, 1, 1,
-0.2974148, -1.582175, -1.349748, 0, 0, 0, 1, 1,
-0.2956229, -2.895832, -3.152101, 0, 0, 0, 1, 1,
-0.2954007, 0.6831177, 2.420889, 0, 0, 0, 1, 1,
-0.2945516, -0.234378, -2.819293, 0, 0, 0, 1, 1,
-0.2941535, 0.112736, -1.752592, 0, 0, 0, 1, 1,
-0.2859235, -1.257013, -3.61784, 1, 1, 1, 1, 1,
-0.2824568, 1.447841, 1.145967, 1, 1, 1, 1, 1,
-0.2641147, -0.7187713, -1.008298, 1, 1, 1, 1, 1,
-0.2587498, 0.1502686, -1.477923, 1, 1, 1, 1, 1,
-0.2577074, -0.8372223, -1.951488, 1, 1, 1, 1, 1,
-0.2560231, -2.847895, -2.340321, 1, 1, 1, 1, 1,
-0.2550478, 0.8128284, 0.6175328, 1, 1, 1, 1, 1,
-0.253597, -1.739163, -3.304039, 1, 1, 1, 1, 1,
-0.2534339, 0.9980963, 0.5984682, 1, 1, 1, 1, 1,
-0.2467736, -0.001880406, -1.381836, 1, 1, 1, 1, 1,
-0.2465296, 0.7531569, -0.8616158, 1, 1, 1, 1, 1,
-0.2461881, 0.92804, -1.780159, 1, 1, 1, 1, 1,
-0.2461156, 0.4796865, -0.6842488, 1, 1, 1, 1, 1,
-0.2417332, -0.9795317, -2.728858, 1, 1, 1, 1, 1,
-0.2383111, -0.495081, -1.965703, 1, 1, 1, 1, 1,
-0.2376121, 0.3374816, -1.069497, 0, 0, 1, 1, 1,
-0.2352931, -0.1128159, -2.401404, 1, 0, 0, 1, 1,
-0.2331419, -0.8527716, -3.814215, 1, 0, 0, 1, 1,
-0.2324436, 0.08931408, 0.005588788, 1, 0, 0, 1, 1,
-0.2311373, -0.7140473, -2.055255, 1, 0, 0, 1, 1,
-0.2311238, -2.156159, -4.417562, 1, 0, 0, 1, 1,
-0.2286052, -0.1009337, -0.3919935, 0, 0, 0, 1, 1,
-0.2264997, -0.2673081, -1.333409, 0, 0, 0, 1, 1,
-0.222366, -0.1950338, -2.608636, 0, 0, 0, 1, 1,
-0.2220485, -1.0878, -1.871098, 0, 0, 0, 1, 1,
-0.2166109, -0.2827723, -3.363968, 0, 0, 0, 1, 1,
-0.2134075, -0.5275565, -3.354017, 0, 0, 0, 1, 1,
-0.2126438, 0.3680994, -0.001169505, 0, 0, 0, 1, 1,
-0.2111103, -0.2083077, -2.818722, 1, 1, 1, 1, 1,
-0.2097584, -0.008345118, -2.167375, 1, 1, 1, 1, 1,
-0.2090856, -0.1869906, -1.799976, 1, 1, 1, 1, 1,
-0.2060232, 0.9368225, -0.9818655, 1, 1, 1, 1, 1,
-0.2059735, -0.9266393, -3.489025, 1, 1, 1, 1, 1,
-0.204096, 0.393209, 0.307263, 1, 1, 1, 1, 1,
-0.1998653, -0.352758, -2.541743, 1, 1, 1, 1, 1,
-0.199326, 2.93271, -1.122368, 1, 1, 1, 1, 1,
-0.1958686, 1.94791, -0.6749436, 1, 1, 1, 1, 1,
-0.1952109, 0.3759588, -0.7361005, 1, 1, 1, 1, 1,
-0.1858908, -0.4940409, -3.587514, 1, 1, 1, 1, 1,
-0.1850844, 0.06310698, -1.766756, 1, 1, 1, 1, 1,
-0.1830232, -2.215057, -1.637201, 1, 1, 1, 1, 1,
-0.1777726, -1.003124, -3.09212, 1, 1, 1, 1, 1,
-0.1725009, -0.05258912, -2.645804, 1, 1, 1, 1, 1,
-0.1670986, -1.392121, -3.981228, 0, 0, 1, 1, 1,
-0.1619748, 0.2752059, -1.885927, 1, 0, 0, 1, 1,
-0.1612367, 1.693105, -0.8831406, 1, 0, 0, 1, 1,
-0.160385, 0.5214952, -1.534302, 1, 0, 0, 1, 1,
-0.1504028, -0.1015082, -2.617551, 1, 0, 0, 1, 1,
-0.1496846, 1.382444, -1.108697, 1, 0, 0, 1, 1,
-0.148116, 0.9926208, -0.340907, 0, 0, 0, 1, 1,
-0.1434951, 0.961728, 0.2189689, 0, 0, 0, 1, 1,
-0.1412172, -0.5979574, -3.918441, 0, 0, 0, 1, 1,
-0.140685, -0.3186156, -3.071239, 0, 0, 0, 1, 1,
-0.1404594, -0.3676596, -2.323833, 0, 0, 0, 1, 1,
-0.139227, -0.5455795, -3.579737, 0, 0, 0, 1, 1,
-0.1371814, -0.3947081, -4.279996, 0, 0, 0, 1, 1,
-0.1361739, -0.06441069, -2.857243, 1, 1, 1, 1, 1,
-0.1293091, 0.6216371, -0.344207, 1, 1, 1, 1, 1,
-0.1287807, 1.960311, 0.8979836, 1, 1, 1, 1, 1,
-0.1280899, 0.5584125, -1.824651, 1, 1, 1, 1, 1,
-0.1257452, -0.6717761, -3.0862, 1, 1, 1, 1, 1,
-0.1086417, 0.09472121, -2.393001, 1, 1, 1, 1, 1,
-0.09767275, 0.4696605, 0.7972464, 1, 1, 1, 1, 1,
-0.09671038, -0.4856215, -3.05035, 1, 1, 1, 1, 1,
-0.09360092, -0.6394165, -2.620755, 1, 1, 1, 1, 1,
-0.09319595, -0.9746159, -2.488871, 1, 1, 1, 1, 1,
-0.09237215, 0.0512379, 0.6331926, 1, 1, 1, 1, 1,
-0.09017777, 0.03125297, -0.7386684, 1, 1, 1, 1, 1,
-0.08848468, 0.08369265, -0.7438982, 1, 1, 1, 1, 1,
-0.08715847, 0.4596694, -0.4213908, 1, 1, 1, 1, 1,
-0.08496454, -0.4759331, -3.395728, 1, 1, 1, 1, 1,
-0.08477052, -0.3489518, -2.386543, 0, 0, 1, 1, 1,
-0.08089232, 0.2946057, -0.7127123, 1, 0, 0, 1, 1,
-0.07754257, 0.1287526, -0.968143, 1, 0, 0, 1, 1,
-0.07523076, 0.3086575, -0.1494606, 1, 0, 0, 1, 1,
-0.07246437, 1.277296, 1.353208, 1, 0, 0, 1, 1,
-0.07095106, -0.3199314, -2.3853, 1, 0, 0, 1, 1,
-0.0693875, -0.8095145, -3.008458, 0, 0, 0, 1, 1,
-0.06775318, -0.2350784, -3.309184, 0, 0, 0, 1, 1,
-0.06643388, -0.324007, -2.539068, 0, 0, 0, 1, 1,
-0.06554424, -0.5681529, -1.841725, 0, 0, 0, 1, 1,
-0.05943209, -0.4373058, -1.446372, 0, 0, 0, 1, 1,
-0.05933671, 0.8355888, 1.217142, 0, 0, 0, 1, 1,
-0.05554644, 0.281262, 0.2688465, 0, 0, 0, 1, 1,
-0.04879374, 1.84323, -0.2448885, 1, 1, 1, 1, 1,
-0.04780842, -1.373133, -2.863106, 1, 1, 1, 1, 1,
-0.04746033, -0.3971823, -4.532954, 1, 1, 1, 1, 1,
-0.04549138, -1.046415, -4.188935, 1, 1, 1, 1, 1,
-0.04191121, 0.03128335, -2.005463, 1, 1, 1, 1, 1,
-0.03392062, 0.3452545, -0.4541442, 1, 1, 1, 1, 1,
-0.03389848, -1.135432, -3.118618, 1, 1, 1, 1, 1,
-0.03260845, -1.317483, -2.840749, 1, 1, 1, 1, 1,
-0.02884685, 0.9571762, 0.5249053, 1, 1, 1, 1, 1,
-0.02757497, 0.160392, -0.7704946, 1, 1, 1, 1, 1,
-0.02469132, -0.2987933, -3.409755, 1, 1, 1, 1, 1,
-0.02272625, -0.74573, -2.715964, 1, 1, 1, 1, 1,
-0.01703785, -0.5818203, -3.318696, 1, 1, 1, 1, 1,
-0.0134887, 0.9050109, 0.3758653, 1, 1, 1, 1, 1,
-0.008644724, -0.7485617, -3.979988, 1, 1, 1, 1, 1,
-0.006819821, -2.374798, -4.325667, 0, 0, 1, 1, 1,
-0.002723049, -0.5489224, -3.43428, 1, 0, 0, 1, 1,
0.002395861, 1.014108, -0.3800446, 1, 0, 0, 1, 1,
0.01166588, 0.6359301, -0.0999511, 1, 0, 0, 1, 1,
0.01205341, -0.2531101, 2.855564, 1, 0, 0, 1, 1,
0.01574155, -0.9518813, 6.408814, 1, 0, 0, 1, 1,
0.01918257, 0.4594535, 1.422954, 0, 0, 0, 1, 1,
0.02648452, -0.4924001, 1.656122, 0, 0, 0, 1, 1,
0.02741287, -0.1933183, 3.000494, 0, 0, 0, 1, 1,
0.03381154, -1.313465, 4.5768, 0, 0, 0, 1, 1,
0.03928119, 0.2790219, 1.050165, 0, 0, 0, 1, 1,
0.04265571, 1.687293, 0.4144327, 0, 0, 0, 1, 1,
0.042875, -1.42564, 2.22057, 0, 0, 0, 1, 1,
0.04451476, -0.1947554, 3.243795, 1, 1, 1, 1, 1,
0.04517936, -0.09523802, 3.413157, 1, 1, 1, 1, 1,
0.04608102, 1.314696, 0.3312167, 1, 1, 1, 1, 1,
0.05429596, 0.9156752, -0.263671, 1, 1, 1, 1, 1,
0.05454499, -0.4303146, 1.754489, 1, 1, 1, 1, 1,
0.05464218, -0.7385139, 1.221254, 1, 1, 1, 1, 1,
0.05480518, -0.0882064, 1.043713, 1, 1, 1, 1, 1,
0.0555865, 0.006140729, 1.984536, 1, 1, 1, 1, 1,
0.05722943, 0.5136118, -1.25789, 1, 1, 1, 1, 1,
0.05825196, -0.1879981, 3.427608, 1, 1, 1, 1, 1,
0.05845528, 0.2662756, 0.2177605, 1, 1, 1, 1, 1,
0.05864007, -1.472154, 1.657247, 1, 1, 1, 1, 1,
0.06128757, 0.5935434, 0.005376721, 1, 1, 1, 1, 1,
0.06289832, -0.5871428, 3.932897, 1, 1, 1, 1, 1,
0.06384034, -1.109398, 3.408361, 1, 1, 1, 1, 1,
0.06844845, -1.211959, 3.772869, 0, 0, 1, 1, 1,
0.07743137, -1.141639, 3.728964, 1, 0, 0, 1, 1,
0.07851265, 0.4285801, -1.309848, 1, 0, 0, 1, 1,
0.08181826, -1.087078, 2.619627, 1, 0, 0, 1, 1,
0.08184349, 0.1326174, -0.7501584, 1, 0, 0, 1, 1,
0.08390117, 1.664732, 1.547181, 1, 0, 0, 1, 1,
0.08512144, 1.176117, -1.772072, 0, 0, 0, 1, 1,
0.08704121, -1.203692, 4.404583, 0, 0, 0, 1, 1,
0.08735783, -0.5629089, 3.65906, 0, 0, 0, 1, 1,
0.09195894, -0.2173385, 2.447943, 0, 0, 0, 1, 1,
0.09545459, 0.706062, -0.4158206, 0, 0, 0, 1, 1,
0.09606604, 0.9753008, -1.141157, 0, 0, 0, 1, 1,
0.1001868, 0.5521255, 1.624201, 0, 0, 0, 1, 1,
0.1017779, 1.22401, -1.005979, 1, 1, 1, 1, 1,
0.1044184, -0.9881875, 2.525453, 1, 1, 1, 1, 1,
0.1108733, -0.8919742, 3.104659, 1, 1, 1, 1, 1,
0.1145752, 0.02317138, 2.202065, 1, 1, 1, 1, 1,
0.1154226, -0.09957216, 2.5311, 1, 1, 1, 1, 1,
0.1210506, -0.4271886, 3.282059, 1, 1, 1, 1, 1,
0.122234, -0.1597829, 2.153967, 1, 1, 1, 1, 1,
0.1235189, 0.1577924, 1.373763, 1, 1, 1, 1, 1,
0.1248309, -0.7662203, 2.764376, 1, 1, 1, 1, 1,
0.1265794, -0.1128179, 1.655629, 1, 1, 1, 1, 1,
0.1271407, -0.168998, 1.578832, 1, 1, 1, 1, 1,
0.1304963, -0.9978368, 2.045955, 1, 1, 1, 1, 1,
0.1309798, -0.3648922, 3.130001, 1, 1, 1, 1, 1,
0.1357035, -1.091423, 3.738196, 1, 1, 1, 1, 1,
0.1405492, 0.04482731, 0.8117793, 1, 1, 1, 1, 1,
0.1409894, 1.272448, -0.8014197, 0, 0, 1, 1, 1,
0.1482508, 0.1477194, 0.7593894, 1, 0, 0, 1, 1,
0.150893, -1.586977, 0.9591731, 1, 0, 0, 1, 1,
0.1574955, 1.336479, -0.04333437, 1, 0, 0, 1, 1,
0.1591396, 1.994522, -0.6769327, 1, 0, 0, 1, 1,
0.161994, -1.783106, 3.068929, 1, 0, 0, 1, 1,
0.1647992, -1.116586, 4.179556, 0, 0, 0, 1, 1,
0.1665646, 0.5821595, -1.508931, 0, 0, 0, 1, 1,
0.1799684, -1.066599, 2.317951, 0, 0, 0, 1, 1,
0.1829223, 1.215513, 0.283307, 0, 0, 0, 1, 1,
0.1892863, 0.3320511, -0.223347, 0, 0, 0, 1, 1,
0.1907604, 0.3416781, 1.939023, 0, 0, 0, 1, 1,
0.1945995, 1.399137, 0.7514227, 0, 0, 0, 1, 1,
0.1976736, -1.316288, 3.011855, 1, 1, 1, 1, 1,
0.1985075, -0.1220692, 2.919054, 1, 1, 1, 1, 1,
0.199371, 0.8031888, -0.795275, 1, 1, 1, 1, 1,
0.2008565, 0.9974698, 1.3036, 1, 1, 1, 1, 1,
0.2011998, -0.007019483, -0.5635313, 1, 1, 1, 1, 1,
0.2026432, -2.156389, 2.666769, 1, 1, 1, 1, 1,
0.2029071, 2.352016, 0.268273, 1, 1, 1, 1, 1,
0.2053959, -1.67067, 4.22617, 1, 1, 1, 1, 1,
0.2058293, -0.38458, 3.990099, 1, 1, 1, 1, 1,
0.2094709, -0.5635445, 1.129277, 1, 1, 1, 1, 1,
0.2099272, 1.449307, -0.6903566, 1, 1, 1, 1, 1,
0.2107769, -2.431768, 2.688167, 1, 1, 1, 1, 1,
0.2110452, 0.4667161, 0.9938793, 1, 1, 1, 1, 1,
0.2127623, 0.8260839, 0.08576026, 1, 1, 1, 1, 1,
0.2143982, -0.4075783, 0.9793845, 1, 1, 1, 1, 1,
0.2160059, 0.4050024, 0.9497609, 0, 0, 1, 1, 1,
0.2171181, 1.149275, -0.83075, 1, 0, 0, 1, 1,
0.2201777, -0.4374882, 2.174032, 1, 0, 0, 1, 1,
0.2259344, -0.6950235, 2.581244, 1, 0, 0, 1, 1,
0.2263326, 0.1686712, -1.061531, 1, 0, 0, 1, 1,
0.2292381, 2.70313, 1.049164, 1, 0, 0, 1, 1,
0.2421863, 1.056506, 0.2981724, 0, 0, 0, 1, 1,
0.242306, 1.753856, -1.657752, 0, 0, 0, 1, 1,
0.2432893, 0.7975574, 1.613338, 0, 0, 0, 1, 1,
0.2433233, 1.055667, 0.2023044, 0, 0, 0, 1, 1,
0.2435376, -0.2753209, 2.006594, 0, 0, 0, 1, 1,
0.2466845, -0.857081, 1.744929, 0, 0, 0, 1, 1,
0.2469487, 0.2701943, 0.3074755, 0, 0, 0, 1, 1,
0.2484847, -0.2045961, 3.954049, 1, 1, 1, 1, 1,
0.2542033, -0.4141706, 2.241068, 1, 1, 1, 1, 1,
0.2565266, 0.04912169, 1.638427, 1, 1, 1, 1, 1,
0.258627, 1.902786, -1.42541, 1, 1, 1, 1, 1,
0.2647166, 1.921686, -0.3908933, 1, 1, 1, 1, 1,
0.2655333, -0.227927, 0.9728243, 1, 1, 1, 1, 1,
0.2691592, 1.135322, -1.257955, 1, 1, 1, 1, 1,
0.2748831, -1.558923, 3.087455, 1, 1, 1, 1, 1,
0.2824556, 1.695812, 0.2318918, 1, 1, 1, 1, 1,
0.2826803, 1.264409, -0.8548758, 1, 1, 1, 1, 1,
0.2852286, 0.05559649, 1.755938, 1, 1, 1, 1, 1,
0.2866921, 0.138513, 1.626798, 1, 1, 1, 1, 1,
0.2867466, -0.6782041, 3.452029, 1, 1, 1, 1, 1,
0.2885453, -0.610755, 4.583802, 1, 1, 1, 1, 1,
0.2886487, 0.493257, 1.926387, 1, 1, 1, 1, 1,
0.2896813, 1.697815, 2.70847, 0, 0, 1, 1, 1,
0.2928927, 0.4128477, 1.791098, 1, 0, 0, 1, 1,
0.2968416, 1.383771, -0.6496521, 1, 0, 0, 1, 1,
0.2970959, -0.0428142, 2.526474, 1, 0, 0, 1, 1,
0.3000673, 0.3084459, 1.557257, 1, 0, 0, 1, 1,
0.3055185, 0.8576495, 0.759027, 1, 0, 0, 1, 1,
0.3080062, -0.1408262, 2.599588, 0, 0, 0, 1, 1,
0.3143032, -0.7509385, 1.951044, 0, 0, 0, 1, 1,
0.3153189, -0.09419695, 0.5407704, 0, 0, 0, 1, 1,
0.3168331, 0.1099066, 1.162481, 0, 0, 0, 1, 1,
0.3195757, -1.172387, 2.167576, 0, 0, 0, 1, 1,
0.3231143, 0.9880881, -0.5039259, 0, 0, 0, 1, 1,
0.3245451, -0.4033854, 2.692141, 0, 0, 0, 1, 1,
0.3304861, 0.06601718, 0.885461, 1, 1, 1, 1, 1,
0.3319917, 1.584018, 0.9007558, 1, 1, 1, 1, 1,
0.3336535, -1.020403, 2.735158, 1, 1, 1, 1, 1,
0.3379765, 2.114433, -1.128341, 1, 1, 1, 1, 1,
0.3399945, -0.5683974, 1.767541, 1, 1, 1, 1, 1,
0.3411572, -0.2347082, 2.081115, 1, 1, 1, 1, 1,
0.3419285, 0.249902, 0.665906, 1, 1, 1, 1, 1,
0.3463412, -0.4236888, 2.695199, 1, 1, 1, 1, 1,
0.3479922, 0.1291348, -1.055205, 1, 1, 1, 1, 1,
0.3524321, 0.2522534, 0.833461, 1, 1, 1, 1, 1,
0.359087, 1.695303, 0.6079822, 1, 1, 1, 1, 1,
0.3592991, -0.9710498, 2.809614, 1, 1, 1, 1, 1,
0.3628191, 0.850056, 0.657597, 1, 1, 1, 1, 1,
0.3737687, 1.009928, 1.34181, 1, 1, 1, 1, 1,
0.3747336, -1.392471, 1.779325, 1, 1, 1, 1, 1,
0.3768041, -0.8066672, 1.57426, 0, 0, 1, 1, 1,
0.377536, -2.740097, 2.760957, 1, 0, 0, 1, 1,
0.3785847, 0.3394486, 1.859148, 1, 0, 0, 1, 1,
0.3793972, 2.821268, 0.8399621, 1, 0, 0, 1, 1,
0.3820362, 0.2598358, 1.041747, 1, 0, 0, 1, 1,
0.3834386, -0.4485693, 2.29797, 1, 0, 0, 1, 1,
0.3836968, 0.7488376, 0.1170672, 0, 0, 0, 1, 1,
0.3852639, -0.2198718, 0.7514345, 0, 0, 0, 1, 1,
0.3926848, -1.274503, 4.792043, 0, 0, 0, 1, 1,
0.3962211, 0.6425712, -0.9084792, 0, 0, 0, 1, 1,
0.4005287, -0.5604694, 4.185716, 0, 0, 0, 1, 1,
0.4060602, 0.1146494, 0.8970657, 0, 0, 0, 1, 1,
0.408035, -0.900295, 3.384503, 0, 0, 0, 1, 1,
0.4121908, 0.651505, 1.857956, 1, 1, 1, 1, 1,
0.413059, -0.7668989, 4.026719, 1, 1, 1, 1, 1,
0.4131689, 1.146678, 0.1978906, 1, 1, 1, 1, 1,
0.4160603, -0.4514825, 3.544504, 1, 1, 1, 1, 1,
0.416629, -1.49751, 4.077446, 1, 1, 1, 1, 1,
0.4208456, -1.457703, 2.561613, 1, 1, 1, 1, 1,
0.4212307, -2.303662, 2.730402, 1, 1, 1, 1, 1,
0.4228371, 0.1840214, 0.4188026, 1, 1, 1, 1, 1,
0.4256825, -0.07493522, 0.4876636, 1, 1, 1, 1, 1,
0.4292254, -0.2150578, 0.4515484, 1, 1, 1, 1, 1,
0.4329144, -0.7854629, 3.105002, 1, 1, 1, 1, 1,
0.4348384, 1.764782, 0.4182592, 1, 1, 1, 1, 1,
0.4353109, -1.038417, 3.135337, 1, 1, 1, 1, 1,
0.4374032, 1.511494, -0.1321791, 1, 1, 1, 1, 1,
0.4427648, -1.322633, 2.709358, 1, 1, 1, 1, 1,
0.4430415, 0.6461643, -1.004239, 0, 0, 1, 1, 1,
0.4460461, 1.242818, 0.805672, 1, 0, 0, 1, 1,
0.4508435, -0.3966206, 2.461355, 1, 0, 0, 1, 1,
0.4571759, -0.2422576, 3.872494, 1, 0, 0, 1, 1,
0.4582302, -0.330602, 2.767407, 1, 0, 0, 1, 1,
0.460419, -0.424379, 3.307252, 1, 0, 0, 1, 1,
0.4631245, 0.2613145, -0.9765806, 0, 0, 0, 1, 1,
0.4636505, -0.4300192, 2.064012, 0, 0, 0, 1, 1,
0.4715011, 0.8382402, 1.862348, 0, 0, 0, 1, 1,
0.4736318, -1.64169, 0.5519068, 0, 0, 0, 1, 1,
0.4750639, 0.5687374, 0.5216366, 0, 0, 0, 1, 1,
0.4784892, 0.3462646, 1.35463, 0, 0, 0, 1, 1,
0.480108, -0.4528236, 3.476872, 0, 0, 0, 1, 1,
0.4802839, -1.228944, 5.315438, 1, 1, 1, 1, 1,
0.4818308, 0.3620171, -0.3793701, 1, 1, 1, 1, 1,
0.4865882, 1.30905, 2.687564, 1, 1, 1, 1, 1,
0.489236, -0.3026609, 3.542629, 1, 1, 1, 1, 1,
0.4893726, 0.05477943, 2.423624, 1, 1, 1, 1, 1,
0.489502, -0.4258195, 3.509511, 1, 1, 1, 1, 1,
0.490199, -0.1259345, 0.5949256, 1, 1, 1, 1, 1,
0.4934573, -0.2574807, 1.5428, 1, 1, 1, 1, 1,
0.4936287, 1.77231, 0.8176814, 1, 1, 1, 1, 1,
0.4939266, -0.2144462, 0.9647215, 1, 1, 1, 1, 1,
0.4939545, 0.1139796, 1.330428, 1, 1, 1, 1, 1,
0.4942348, -1.216065, 3.222936, 1, 1, 1, 1, 1,
0.5027856, -1.600081, 3.267625, 1, 1, 1, 1, 1,
0.5071484, -1.368142, 1.981163, 1, 1, 1, 1, 1,
0.5077161, -1.572418, 1.008091, 1, 1, 1, 1, 1,
0.5083009, 0.9748473, -0.4200941, 0, 0, 1, 1, 1,
0.5089284, -0.4786538, 1.646051, 1, 0, 0, 1, 1,
0.5100529, -1.001612, 2.178308, 1, 0, 0, 1, 1,
0.512159, -1.369402, 3.631478, 1, 0, 0, 1, 1,
0.5137804, 1.091373, 1.072331, 1, 0, 0, 1, 1,
0.5195844, -0.9869264, 2.300753, 1, 0, 0, 1, 1,
0.5198456, 0.7555042, 1.309922, 0, 0, 0, 1, 1,
0.5239913, -0.4430355, 2.511164, 0, 0, 0, 1, 1,
0.5308924, 0.1947723, 0.714074, 0, 0, 0, 1, 1,
0.5311317, -1.047321, 1.138236, 0, 0, 0, 1, 1,
0.5315489, -0.4790759, 3.06642, 0, 0, 0, 1, 1,
0.5324873, 0.6130655, 1.76406, 0, 0, 0, 1, 1,
0.5343413, 1.577691, -0.2527435, 0, 0, 0, 1, 1,
0.5385609, 0.7031199, -0.299942, 1, 1, 1, 1, 1,
0.5414366, 0.1202921, 1.883877, 1, 1, 1, 1, 1,
0.5447798, 1.390265, 1.583655, 1, 1, 1, 1, 1,
0.546548, -0.8128472, 1.995502, 1, 1, 1, 1, 1,
0.5466774, -2.168069, 2.70277, 1, 1, 1, 1, 1,
0.5480003, 0.3818071, 1.37482, 1, 1, 1, 1, 1,
0.5510861, 0.1781268, 0.7077667, 1, 1, 1, 1, 1,
0.5568194, 1.766035, -0.2821451, 1, 1, 1, 1, 1,
0.5600147, 1.257163, -2.307365, 1, 1, 1, 1, 1,
0.5603685, -0.360828, 1.802027, 1, 1, 1, 1, 1,
0.5678729, 0.002652667, 0.4332649, 1, 1, 1, 1, 1,
0.5685782, -0.7202566, 3.048316, 1, 1, 1, 1, 1,
0.5718905, -0.9673846, 4.028428, 1, 1, 1, 1, 1,
0.5791065, -0.06193875, 1.197085, 1, 1, 1, 1, 1,
0.5791632, 0.6148561, 1.156653, 1, 1, 1, 1, 1,
0.5818253, 0.8359475, -0.02489782, 0, 0, 1, 1, 1,
0.5881709, 0.3738468, 0.6854127, 1, 0, 0, 1, 1,
0.595422, -0.3525872, 4.767855, 1, 0, 0, 1, 1,
0.5962635, -0.2212113, 2.626976, 1, 0, 0, 1, 1,
0.6077902, -1.463306, 3.232927, 1, 0, 0, 1, 1,
0.6081743, 1.199345, -0.4400073, 1, 0, 0, 1, 1,
0.6120305, -0.9572333, 0.6578298, 0, 0, 0, 1, 1,
0.6122125, 1.355219, 2.212383, 0, 0, 0, 1, 1,
0.613877, 0.8743728, -1.234771, 0, 0, 0, 1, 1,
0.6151608, -0.2478447, 1.163456, 0, 0, 0, 1, 1,
0.6175796, 0.7966199, -0.6541513, 0, 0, 0, 1, 1,
0.6178156, -1.340238, 2.508759, 0, 0, 0, 1, 1,
0.6205462, -0.7557548, 2.352576, 0, 0, 0, 1, 1,
0.6210177, 0.2022302, 2.227284, 1, 1, 1, 1, 1,
0.6217242, -0.5376606, 2.912117, 1, 1, 1, 1, 1,
0.6265693, -0.5833041, 2.661185, 1, 1, 1, 1, 1,
0.6279044, 0.2876209, 0.6220753, 1, 1, 1, 1, 1,
0.6330189, 0.2976871, 1.002493, 1, 1, 1, 1, 1,
0.6332128, 0.1463509, 0.5457725, 1, 1, 1, 1, 1,
0.6387179, -1.073117, 2.957519, 1, 1, 1, 1, 1,
0.639711, 0.9547539, 1.505823, 1, 1, 1, 1, 1,
0.6458625, -0.1244739, 2.126701, 1, 1, 1, 1, 1,
0.6473644, 0.1795025, 1.575236, 1, 1, 1, 1, 1,
0.6482872, -0.6287404, 4.262256, 1, 1, 1, 1, 1,
0.6502344, 0.5185404, -0.0009567141, 1, 1, 1, 1, 1,
0.6546097, -0.2505564, 1.030152, 1, 1, 1, 1, 1,
0.6561794, 1.071055, -0.2493275, 1, 1, 1, 1, 1,
0.6563217, 2.186951, 0.009829988, 1, 1, 1, 1, 1,
0.6574087, -1.579828, 3.17881, 0, 0, 1, 1, 1,
0.6633002, -0.3760357, 3.454499, 1, 0, 0, 1, 1,
0.6641605, 0.5316726, -0.7901825, 1, 0, 0, 1, 1,
0.6653724, -1.504813, 3.483658, 1, 0, 0, 1, 1,
0.6678845, 0.6372544, 1.914241, 1, 0, 0, 1, 1,
0.6704805, 0.4519323, 0.7685509, 1, 0, 0, 1, 1,
0.6720192, 0.2084093, 0.1524803, 0, 0, 0, 1, 1,
0.6721875, -0.3145871, 0.9814546, 0, 0, 0, 1, 1,
0.6754387, 0.09496919, 2.504693, 0, 0, 0, 1, 1,
0.6762955, -0.08036064, 2.126636, 0, 0, 0, 1, 1,
0.6798933, 0.2355518, 1.423443, 0, 0, 0, 1, 1,
0.6823956, -1.268857, 4.299483, 0, 0, 0, 1, 1,
0.6824611, 1.739384, 1.916733, 0, 0, 0, 1, 1,
0.6840307, 0.6278717, 2.121522, 1, 1, 1, 1, 1,
0.6851166, -0.6521761, -0.8526348, 1, 1, 1, 1, 1,
0.6862555, -1.240695, 2.385043, 1, 1, 1, 1, 1,
0.6963366, -0.6761336, 1.968207, 1, 1, 1, 1, 1,
0.6994479, 0.1470119, 2.858599, 1, 1, 1, 1, 1,
0.7058439, 0.7126618, 1.123365, 1, 1, 1, 1, 1,
0.7061731, 1.596676, -0.446366, 1, 1, 1, 1, 1,
0.7219101, -1.209083, 3.771681, 1, 1, 1, 1, 1,
0.7245291, -0.398911, 2.399054, 1, 1, 1, 1, 1,
0.72616, -0.7376673, 1.784474, 1, 1, 1, 1, 1,
0.7303109, 0.3047309, -0.6630951, 1, 1, 1, 1, 1,
0.7314298, 2.04841, -0.1285136, 1, 1, 1, 1, 1,
0.7351266, -0.614104, 1.014275, 1, 1, 1, 1, 1,
0.7429212, -0.06004101, 1.219301, 1, 1, 1, 1, 1,
0.7433543, -0.1103534, 1.416646, 1, 1, 1, 1, 1,
0.7467124, 0.662725, 1.114618, 0, 0, 1, 1, 1,
0.7565252, 1.11441, 1.468191, 1, 0, 0, 1, 1,
0.7620806, 0.3713487, 2.650448, 1, 0, 0, 1, 1,
0.7671394, -0.6322609, 1.338215, 1, 0, 0, 1, 1,
0.7690651, 0.6648943, 1.625483, 1, 0, 0, 1, 1,
0.7737901, 0.2775037, 0.3746575, 1, 0, 0, 1, 1,
0.7820337, -0.04021665, 1.245745, 0, 0, 0, 1, 1,
0.8003805, -1.162234, 2.769282, 0, 0, 0, 1, 1,
0.8037074, -0.2435906, 2.40074, 0, 0, 0, 1, 1,
0.8103517, -0.01057958, 2.453952, 0, 0, 0, 1, 1,
0.8254207, 0.505825, 1.641772, 0, 0, 0, 1, 1,
0.8270479, -0.6051565, 0.08061629, 0, 0, 0, 1, 1,
0.8293112, -0.7541993, 1.830044, 0, 0, 0, 1, 1,
0.8370886, -0.7147597, 2.358602, 1, 1, 1, 1, 1,
0.8374432, 0.2634605, 0.8177794, 1, 1, 1, 1, 1,
0.8374454, -1.422708, 2.185752, 1, 1, 1, 1, 1,
0.842793, -0.07266517, -0.5603559, 1, 1, 1, 1, 1,
0.8600115, -1.366296, 2.577585, 1, 1, 1, 1, 1,
0.8719184, 0.3191732, 0.3252245, 1, 1, 1, 1, 1,
0.8757461, -0.442886, 2.245405, 1, 1, 1, 1, 1,
0.8799989, 0.4638511, 1.577894, 1, 1, 1, 1, 1,
0.8803158, 1.707465, -0.1056016, 1, 1, 1, 1, 1,
0.8985274, 0.6509439, 1.247172, 1, 1, 1, 1, 1,
0.9020081, 1.136916, 1.541963, 1, 1, 1, 1, 1,
0.9065469, -0.5796509, 1.558589, 1, 1, 1, 1, 1,
0.9081385, -0.3521117, 2.384207, 1, 1, 1, 1, 1,
0.9140154, -0.9384593, 4.313662, 1, 1, 1, 1, 1,
0.9153307, 1.270884, 0.7889823, 1, 1, 1, 1, 1,
0.919677, -0.7407147, 2.822624, 0, 0, 1, 1, 1,
0.9253597, -1.781643, 1.854014, 1, 0, 0, 1, 1,
0.9271107, 0.120421, 1.633286, 1, 0, 0, 1, 1,
0.934612, 1.106085, 0.8892258, 1, 0, 0, 1, 1,
0.9383689, 0.3199661, 1.38057, 1, 0, 0, 1, 1,
0.9389894, -1.798441, 2.956402, 1, 0, 0, 1, 1,
0.9396886, 0.4427618, 1.039569, 0, 0, 0, 1, 1,
0.9408312, -0.8301801, 0.9000311, 0, 0, 0, 1, 1,
0.9437325, -0.05480102, 1.913635, 0, 0, 0, 1, 1,
0.9468276, -0.1912443, 1.646309, 0, 0, 0, 1, 1,
0.9484244, -0.3423325, 2.501132, 0, 0, 0, 1, 1,
0.9520329, -2.128924, 2.038486, 0, 0, 0, 1, 1,
0.955037, 0.4746563, 0.9484022, 0, 0, 0, 1, 1,
0.9586061, -0.6759721, 3.701448, 1, 1, 1, 1, 1,
0.9626055, -0.5091342, 1.893007, 1, 1, 1, 1, 1,
0.9694897, -1.388955, 3.28255, 1, 1, 1, 1, 1,
0.9700434, -0.5052183, 0.2363504, 1, 1, 1, 1, 1,
0.9773189, -0.09395821, 0.2572885, 1, 1, 1, 1, 1,
0.9801141, -0.8064772, 2.224515, 1, 1, 1, 1, 1,
0.9810417, 1.155264, 0.7497, 1, 1, 1, 1, 1,
0.9847637, -0.8898598, 1.395765, 1, 1, 1, 1, 1,
0.9925811, -2.462162, 3.15198, 1, 1, 1, 1, 1,
0.9928367, 0.3515679, 1.459635, 1, 1, 1, 1, 1,
0.9953842, 0.1110021, 0.8196551, 1, 1, 1, 1, 1,
1.003852, 0.3336084, 1.285606, 1, 1, 1, 1, 1,
1.007507, -0.8411943, 3.326646, 1, 1, 1, 1, 1,
1.01502, 0.5709091, 1.5301, 1, 1, 1, 1, 1,
1.019524, 0.2541589, 2.298409, 1, 1, 1, 1, 1,
1.021783, -1.398483, 1.460121, 0, 0, 1, 1, 1,
1.038009, -0.1220885, 0.7887129, 1, 0, 0, 1, 1,
1.043367, -0.3527215, 2.442698, 1, 0, 0, 1, 1,
1.045276, -0.6603142, 1.704905, 1, 0, 0, 1, 1,
1.053294, -1.480356, 2.549607, 1, 0, 0, 1, 1,
1.06799, -0.06147674, 1.029356, 1, 0, 0, 1, 1,
1.077868, 0.8386526, -0.08076889, 0, 0, 0, 1, 1,
1.080022, -0.9591309, 2.569531, 0, 0, 0, 1, 1,
1.083576, -0.1939034, 0.206607, 0, 0, 0, 1, 1,
1.085852, -0.1962373, 1.078705, 0, 0, 0, 1, 1,
1.101999, 0.3061042, -1.95763, 0, 0, 0, 1, 1,
1.106228, 1.961124, 1.778915, 0, 0, 0, 1, 1,
1.106844, 1.349751, 1.882495, 0, 0, 0, 1, 1,
1.108547, 0.1442516, 3.670017, 1, 1, 1, 1, 1,
1.109392, -0.4685622, 1.515369, 1, 1, 1, 1, 1,
1.109976, 1.508001, 0.2256245, 1, 1, 1, 1, 1,
1.118185, -0.01629953, 0.7202412, 1, 1, 1, 1, 1,
1.122175, 1.686168, 1.270133, 1, 1, 1, 1, 1,
1.124031, -1.046586, 2.352418, 1, 1, 1, 1, 1,
1.124285, -1.1076, 2.553653, 1, 1, 1, 1, 1,
1.133714, -0.4010184, 3.819586, 1, 1, 1, 1, 1,
1.136351, -0.3855231, 2.281582, 1, 1, 1, 1, 1,
1.141811, 0.1669898, 1.139858, 1, 1, 1, 1, 1,
1.142009, -0.2628005, 0.5561286, 1, 1, 1, 1, 1,
1.14286, -1.063105, 0.3619558, 1, 1, 1, 1, 1,
1.143822, 1.368629, -0.0778233, 1, 1, 1, 1, 1,
1.145523, 0.2857637, 0.9025623, 1, 1, 1, 1, 1,
1.148111, 1.554108, -0.1532748, 1, 1, 1, 1, 1,
1.154427, 0.1858241, 1.483182, 0, 0, 1, 1, 1,
1.157168, 1.504151, 1.100724, 1, 0, 0, 1, 1,
1.162546, -0.163386, 2.094962, 1, 0, 0, 1, 1,
1.165749, 0.3674867, 1.704515, 1, 0, 0, 1, 1,
1.168981, -0.1240754, 1.648296, 1, 0, 0, 1, 1,
1.170193, -0.9258356, 1.925532, 1, 0, 0, 1, 1,
1.170644, -0.6172765, 1.712515, 0, 0, 0, 1, 1,
1.178952, -1.652813, 2.875875, 0, 0, 0, 1, 1,
1.184336, -0.03679268, 1.177874, 0, 0, 0, 1, 1,
1.192421, 1.15269, 0.6592333, 0, 0, 0, 1, 1,
1.192918, -0.8062624, 2.151542, 0, 0, 0, 1, 1,
1.196179, 0.1518631, 1.722223, 0, 0, 0, 1, 1,
1.208562, 1.63955, -0.5023143, 0, 0, 0, 1, 1,
1.211931, 0.6105968, 0.490381, 1, 1, 1, 1, 1,
1.219463, -0.8434539, 2.419435, 1, 1, 1, 1, 1,
1.219875, -1.803908, 2.477294, 1, 1, 1, 1, 1,
1.224466, -0.6454195, 2.129851, 1, 1, 1, 1, 1,
1.22604, 0.286331, 0.04920118, 1, 1, 1, 1, 1,
1.227912, -0.3475934, 1.362781, 1, 1, 1, 1, 1,
1.230391, -0.948146, 3.079761, 1, 1, 1, 1, 1,
1.232309, 0.7045411, 0.4017193, 1, 1, 1, 1, 1,
1.233686, 0.4592935, 3.154407, 1, 1, 1, 1, 1,
1.234802, -0.5021249, 2.334299, 1, 1, 1, 1, 1,
1.237124, -1.252149, 1.697852, 1, 1, 1, 1, 1,
1.243014, -2.604564, 1.996084, 1, 1, 1, 1, 1,
1.243155, 0.4945227, 1.08094, 1, 1, 1, 1, 1,
1.249486, 0.6127598, 1.77066, 1, 1, 1, 1, 1,
1.264384, -1.200304, 3.284309, 1, 1, 1, 1, 1,
1.265144, -0.1348358, 3.066517, 0, 0, 1, 1, 1,
1.272555, 0.7125629, 2.092586, 1, 0, 0, 1, 1,
1.276265, -1.244931, 2.08528, 1, 0, 0, 1, 1,
1.282488, 0.286125, 1.212996, 1, 0, 0, 1, 1,
1.284797, -0.2961417, 2.411146, 1, 0, 0, 1, 1,
1.291227, -0.7062117, 3.142241, 1, 0, 0, 1, 1,
1.292177, -0.7123774, 1.340452, 0, 0, 0, 1, 1,
1.294653, 0.6742206, 1.946673, 0, 0, 0, 1, 1,
1.296837, -0.237141, 3.976898, 0, 0, 0, 1, 1,
1.298534, -1.125176, 2.868834, 0, 0, 0, 1, 1,
1.29873, -0.7045922, 2.582324, 0, 0, 0, 1, 1,
1.308893, 0.1297851, 2.038968, 0, 0, 0, 1, 1,
1.334528, -0.1671299, 0.1991854, 0, 0, 0, 1, 1,
1.334798, 0.01712902, 2.898955, 1, 1, 1, 1, 1,
1.337193, 0.9164673, 1.971773, 1, 1, 1, 1, 1,
1.33932, 1.104176, 0.06676192, 1, 1, 1, 1, 1,
1.355784, -0.4375477, 3.094924, 1, 1, 1, 1, 1,
1.356462, -0.9621869, 1.707486, 1, 1, 1, 1, 1,
1.370228, 0.2879405, 1.428828, 1, 1, 1, 1, 1,
1.386297, -0.527406, 1.863813, 1, 1, 1, 1, 1,
1.386597, 1.664518, 0.1367966, 1, 1, 1, 1, 1,
1.414524, -0.6050111, 1.877451, 1, 1, 1, 1, 1,
1.42325, -0.256727, 0.2724562, 1, 1, 1, 1, 1,
1.424995, -0.658297, 0.822812, 1, 1, 1, 1, 1,
1.425384, 0.4905032, 1.537836, 1, 1, 1, 1, 1,
1.426327, -0.1473602, 2.822874, 1, 1, 1, 1, 1,
1.428279, 0.223328, 2.449059, 1, 1, 1, 1, 1,
1.445287, 1.798215, 0.1616158, 1, 1, 1, 1, 1,
1.446122, -0.3717553, 3.099322, 0, 0, 1, 1, 1,
1.454029, 0.2440034, 1.633716, 1, 0, 0, 1, 1,
1.454608, 0.6193747, -0.186841, 1, 0, 0, 1, 1,
1.455541, 1.540046, 1.305839, 1, 0, 0, 1, 1,
1.455806, -2.294325, 2.063358, 1, 0, 0, 1, 1,
1.462823, 2.152961, -0.4703969, 1, 0, 0, 1, 1,
1.467054, -1.295506, 0.8513182, 0, 0, 0, 1, 1,
1.470449, -0.4818127, 3.769867, 0, 0, 0, 1, 1,
1.479112, -0.1494358, 1.045247, 0, 0, 0, 1, 1,
1.482332, -0.7674254, 3.567845, 0, 0, 0, 1, 1,
1.485623, 0.5956078, 2.835145, 0, 0, 0, 1, 1,
1.486541, -0.6902637, 2.448833, 0, 0, 0, 1, 1,
1.491289, 0.9978341, 0.5267147, 0, 0, 0, 1, 1,
1.513131, -0.9449096, -0.5966747, 1, 1, 1, 1, 1,
1.537399, -1.229722, 2.100482, 1, 1, 1, 1, 1,
1.551444, -1.20359, 1.43657, 1, 1, 1, 1, 1,
1.570129, -1.353564, 2.047377, 1, 1, 1, 1, 1,
1.572988, 0.3864915, 2.411653, 1, 1, 1, 1, 1,
1.573223, -0.4537796, 2.699015, 1, 1, 1, 1, 1,
1.575691, -1.52363, 3.662959, 1, 1, 1, 1, 1,
1.589453, 1.096955, -1.045383, 1, 1, 1, 1, 1,
1.595805, 0.3425261, 2.141554, 1, 1, 1, 1, 1,
1.597337, 0.2020955, 1.187605, 1, 1, 1, 1, 1,
1.598025, 0.3592555, 1.904192, 1, 1, 1, 1, 1,
1.599315, -0.1957824, 1.388382, 1, 1, 1, 1, 1,
1.633267, -1.365626, 3.57997, 1, 1, 1, 1, 1,
1.647625, 1.528118, 0.1639962, 1, 1, 1, 1, 1,
1.686197, 0.2392555, 2.314885, 1, 1, 1, 1, 1,
1.690179, -0.4882248, 0.4935893, 0, 0, 1, 1, 1,
1.700016, -1.065198, 3.358874, 1, 0, 0, 1, 1,
1.718556, -1.107683, 3.753114, 1, 0, 0, 1, 1,
1.722159, 0.3153867, 2.905916, 1, 0, 0, 1, 1,
1.723731, -0.5552438, 0.3761404, 1, 0, 0, 1, 1,
1.729673, -0.2468787, 2.17375, 1, 0, 0, 1, 1,
1.730412, -0.1728593, 0.9308203, 0, 0, 0, 1, 1,
1.735241, -0.6225203, 0.0852779, 0, 0, 0, 1, 1,
1.742257, -2.294756, 3.002167, 0, 0, 0, 1, 1,
1.771821, -1.24033, 2.403848, 0, 0, 0, 1, 1,
1.778969, 2.141259, -0.3526156, 0, 0, 0, 1, 1,
1.78094, -0.4704478, 2.668338, 0, 0, 0, 1, 1,
1.783183, -1.493893, 2.019744, 0, 0, 0, 1, 1,
1.788315, -0.3361003, 2.278696, 1, 1, 1, 1, 1,
1.800726, 0.8033586, 2.69186, 1, 1, 1, 1, 1,
1.832844, 0.2597525, 1.836833, 1, 1, 1, 1, 1,
1.842089, -1.650777, 2.267022, 1, 1, 1, 1, 1,
1.843075, -0.4160946, 1.462819, 1, 1, 1, 1, 1,
1.871771, 0.3691217, 1.31596, 1, 1, 1, 1, 1,
1.883588, -0.4460702, 2.996079, 1, 1, 1, 1, 1,
1.884846, 0.6340296, 1.309804, 1, 1, 1, 1, 1,
1.903898, 0.555892, 1.362191, 1, 1, 1, 1, 1,
1.911052, -1.119796, 4.09782, 1, 1, 1, 1, 1,
1.919209, -0.8219284, 1.885565, 1, 1, 1, 1, 1,
1.93846, -1.444942, 3.499114, 1, 1, 1, 1, 1,
1.951564, 1.878366, 0.6053577, 1, 1, 1, 1, 1,
1.966785, -0.1053112, 2.613703, 1, 1, 1, 1, 1,
1.968808, -0.4462337, -0.3773415, 1, 1, 1, 1, 1,
1.978025, 2.630167, 1.035615, 0, 0, 1, 1, 1,
1.993762, 2.408443, 3.621192, 1, 0, 0, 1, 1,
2.032362, 0.2497763, 2.996753, 1, 0, 0, 1, 1,
2.053105, 0.8507485, 0.5229703, 1, 0, 0, 1, 1,
2.05548, -0.8992391, 2.83389, 1, 0, 0, 1, 1,
2.092411, 0.489801, 3.293551, 1, 0, 0, 1, 1,
2.107645, 0.3429652, 1.511925, 0, 0, 0, 1, 1,
2.148699, 1.08914, 0.4848071, 0, 0, 0, 1, 1,
2.15036, 0.03757493, 3.76761, 0, 0, 0, 1, 1,
2.153641, -0.8650491, 2.189532, 0, 0, 0, 1, 1,
2.157222, -0.2965074, -1.183286, 0, 0, 0, 1, 1,
2.239984, 0.9246048, 2.209819, 0, 0, 0, 1, 1,
2.313973, -0.7220089, 1.617579, 0, 0, 0, 1, 1,
2.411441, -1.566342, 1.60529, 1, 1, 1, 1, 1,
2.419702, 0.01989419, 2.334412, 1, 1, 1, 1, 1,
2.467039, 1.225757, 0.9446578, 1, 1, 1, 1, 1,
2.468412, -0.5414241, 1.632367, 1, 1, 1, 1, 1,
2.522252, -0.1391819, 1.975054, 1, 1, 1, 1, 1,
2.760904, 0.5025676, 3.081547, 1, 1, 1, 1, 1,
2.897439, -0.1658907, 1.594975, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.929206;
var distance = 34.87592;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.2551477, 0.3335073, -0.641367 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.87592);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>
