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
-3.428264, -1.295345, -2.227368, 1, 0, 0, 1,
-3.264157, -0.9223784, -1.797866, 1, 0.007843138, 0, 1,
-2.949815, 1.779942, -1.308794, 1, 0.01176471, 0, 1,
-2.791352, -0.07984609, -1.848844, 1, 0.01960784, 0, 1,
-2.738198, -0.8194867, -1.786958, 1, 0.02352941, 0, 1,
-2.684076, -0.2694449, -0.7879887, 1, 0.03137255, 0, 1,
-2.373167, 1.339668, -1.210677, 1, 0.03529412, 0, 1,
-2.279979, 0.3748536, -3.253713, 1, 0.04313726, 0, 1,
-2.273007, -1.538136, -2.165924, 1, 0.04705882, 0, 1,
-2.26136, 0.008140329, -0.6758119, 1, 0.05490196, 0, 1,
-2.246644, 0.6973637, -0.4243678, 1, 0.05882353, 0, 1,
-2.223582, 0.0992422, -2.073757, 1, 0.06666667, 0, 1,
-2.197721, 0.2220013, -1.694539, 1, 0.07058824, 0, 1,
-2.16258, 0.1110232, -1.710705, 1, 0.07843138, 0, 1,
-2.157604, -1.811489, -1.908406, 1, 0.08235294, 0, 1,
-2.152001, -1.106768, -1.573694, 1, 0.09019608, 0, 1,
-2.143806, 0.4817145, -0.6022674, 1, 0.09411765, 0, 1,
-2.111558, 0.1585568, -3.342976, 1, 0.1019608, 0, 1,
-2.093576, -1.29519, -1.670643, 1, 0.1098039, 0, 1,
-2.088045, 0.38535, -0.2604245, 1, 0.1137255, 0, 1,
-2.046944, 1.672906, 0.3693466, 1, 0.1215686, 0, 1,
-2.022211, -1.108083, -2.616163, 1, 0.1254902, 0, 1,
-1.928913, -0.1492666, -0.6927072, 1, 0.1333333, 0, 1,
-1.92719, 0.06057113, -0.2367589, 1, 0.1372549, 0, 1,
-1.896087, 1.26175, 0.1280377, 1, 0.145098, 0, 1,
-1.883951, -0.09038901, -2.457808, 1, 0.1490196, 0, 1,
-1.876609, 0.2459363, 0.09206273, 1, 0.1568628, 0, 1,
-1.854286, -0.1024771, -0.9298214, 1, 0.1607843, 0, 1,
-1.850361, 1.343862, -1.783901, 1, 0.1686275, 0, 1,
-1.839722, 0.5735084, -0.2253836, 1, 0.172549, 0, 1,
-1.839692, 1.284662, -2.123827, 1, 0.1803922, 0, 1,
-1.832919, -0.5437502, -2.474738, 1, 0.1843137, 0, 1,
-1.824402, 1.085257, -1.064196, 1, 0.1921569, 0, 1,
-1.820281, 0.7799044, -1.192959, 1, 0.1960784, 0, 1,
-1.808784, -0.766692, -1.569296, 1, 0.2039216, 0, 1,
-1.806314, 0.344511, -0.7035373, 1, 0.2117647, 0, 1,
-1.804568, -2.04126, -2.996785, 1, 0.2156863, 0, 1,
-1.798635, -1.278781, -2.279964, 1, 0.2235294, 0, 1,
-1.773983, 1.539351, -1.564543, 1, 0.227451, 0, 1,
-1.772189, -0.2559154, -2.523017, 1, 0.2352941, 0, 1,
-1.727924, -0.003012978, -1.279277, 1, 0.2392157, 0, 1,
-1.721651, 2.269169, -0.5497062, 1, 0.2470588, 0, 1,
-1.687418, -0.3990282, -2.102272, 1, 0.2509804, 0, 1,
-1.68225, 1.143821, -2.773241, 1, 0.2588235, 0, 1,
-1.671998, 0.6440179, -0.4549616, 1, 0.2627451, 0, 1,
-1.668887, 0.9581313, -2.328985, 1, 0.2705882, 0, 1,
-1.6538, -0.002838243, -0.03729912, 1, 0.2745098, 0, 1,
-1.645106, 0.7304029, -3.396332, 1, 0.282353, 0, 1,
-1.619439, 0.8901477, -1.361571, 1, 0.2862745, 0, 1,
-1.619065, -0.5307521, -1.16717, 1, 0.2941177, 0, 1,
-1.618831, -0.7234057, -1.045966, 1, 0.3019608, 0, 1,
-1.614443, 0.1429301, -0.9372793, 1, 0.3058824, 0, 1,
-1.606264, -0.2939469, 0.7040741, 1, 0.3137255, 0, 1,
-1.605793, 0.7507415, -1.272543, 1, 0.3176471, 0, 1,
-1.597406, -1.322353, -0.1974851, 1, 0.3254902, 0, 1,
-1.59238, -8.778102e-05, -0.6009687, 1, 0.3294118, 0, 1,
-1.581846, 0.2026385, -1.212451, 1, 0.3372549, 0, 1,
-1.57495, -0.7019169, -3.758842, 1, 0.3411765, 0, 1,
-1.573906, 0.9910632, -1.036085, 1, 0.3490196, 0, 1,
-1.572188, 0.2084556, -3.829995, 1, 0.3529412, 0, 1,
-1.569739, 0.7050605, -2.60114, 1, 0.3607843, 0, 1,
-1.560411, 0.0008505061, -0.7225627, 1, 0.3647059, 0, 1,
-1.559071, -0.8493837, -3.340225, 1, 0.372549, 0, 1,
-1.554005, -1.22268, -3.111493, 1, 0.3764706, 0, 1,
-1.530931, 0.4839694, -1.644608, 1, 0.3843137, 0, 1,
-1.530289, -1.68663, -2.586751, 1, 0.3882353, 0, 1,
-1.519222, 0.7269402, -0.5175321, 1, 0.3960784, 0, 1,
-1.50423, -0.856055, -2.329074, 1, 0.4039216, 0, 1,
-1.503012, 0.284761, -1.670113, 1, 0.4078431, 0, 1,
-1.499153, 1.61923, -0.7234941, 1, 0.4156863, 0, 1,
-1.490983, 0.2965299, -0.8196414, 1, 0.4196078, 0, 1,
-1.485006, 0.1611082, 0.258647, 1, 0.427451, 0, 1,
-1.470684, -1.378517, -2.404795, 1, 0.4313726, 0, 1,
-1.470093, -0.1339425, -1.898349, 1, 0.4392157, 0, 1,
-1.461673, -1.459305, -1.564062, 1, 0.4431373, 0, 1,
-1.447882, 1.287838, -0.9317754, 1, 0.4509804, 0, 1,
-1.444897, -0.4466597, 0.39858, 1, 0.454902, 0, 1,
-1.443117, 0.6762812, 0.9090576, 1, 0.4627451, 0, 1,
-1.435301, 0.5370367, -2.088358, 1, 0.4666667, 0, 1,
-1.434302, -0.6017633, -2.740434, 1, 0.4745098, 0, 1,
-1.428544, -0.758732, -2.088526, 1, 0.4784314, 0, 1,
-1.422243, -0.1312575, 0.1000251, 1, 0.4862745, 0, 1,
-1.421289, 1.086743, -2.279195, 1, 0.4901961, 0, 1,
-1.416005, -1.848267, -2.242411, 1, 0.4980392, 0, 1,
-1.397338, 1.078184, -1.569258, 1, 0.5058824, 0, 1,
-1.384348, -1.431022, -1.832289, 1, 0.509804, 0, 1,
-1.38415, -0.4081622, -2.475139, 1, 0.5176471, 0, 1,
-1.382206, 0.5045486, 0.1571262, 1, 0.5215687, 0, 1,
-1.376715, 0.5105675, -0.3951029, 1, 0.5294118, 0, 1,
-1.373989, -0.7125725, -1.424239, 1, 0.5333334, 0, 1,
-1.371674, 1.072565, -1.85086, 1, 0.5411765, 0, 1,
-1.364712, 1.089553, -0.8439292, 1, 0.5450981, 0, 1,
-1.349895, 0.5541406, -1.833292, 1, 0.5529412, 0, 1,
-1.345566, -0.3014543, -0.01371895, 1, 0.5568628, 0, 1,
-1.341625, 0.5394113, -1.137672, 1, 0.5647059, 0, 1,
-1.329279, -2.041856, -0.5762457, 1, 0.5686275, 0, 1,
-1.328051, -0.09277121, -3.33101, 1, 0.5764706, 0, 1,
-1.32023, -0.08541191, -1.733255, 1, 0.5803922, 0, 1,
-1.319607, -0.9534755, -1.936509, 1, 0.5882353, 0, 1,
-1.319559, -1.397561, -1.535431, 1, 0.5921569, 0, 1,
-1.316356, 0.1885547, -1.231216, 1, 0.6, 0, 1,
-1.302815, 0.7635778, -1.114512, 1, 0.6078432, 0, 1,
-1.302329, -0.7751857, -2.168383, 1, 0.6117647, 0, 1,
-1.296885, 0.1593336, -0.3748409, 1, 0.6196079, 0, 1,
-1.288609, -1.248798, -2.464146, 1, 0.6235294, 0, 1,
-1.285728, 1.848544, 0.5952018, 1, 0.6313726, 0, 1,
-1.281404, 0.2422524, -0.463464, 1, 0.6352941, 0, 1,
-1.278532, 0.3390983, -1.055751, 1, 0.6431373, 0, 1,
-1.278017, 0.984281, -1.607464, 1, 0.6470588, 0, 1,
-1.259316, -0.252554, -1.743406, 1, 0.654902, 0, 1,
-1.253742, 1.732492, -0.7640343, 1, 0.6588235, 0, 1,
-1.249009, 0.897033, -1.455055, 1, 0.6666667, 0, 1,
-1.239199, -0.6097049, -2.738976, 1, 0.6705883, 0, 1,
-1.238021, -0.6806517, -1.49429, 1, 0.6784314, 0, 1,
-1.236129, 0.6231228, -1.334586, 1, 0.682353, 0, 1,
-1.230768, -0.126555, -1.211168, 1, 0.6901961, 0, 1,
-1.223589, 1.418119, -2.232265, 1, 0.6941177, 0, 1,
-1.218518, -1.175635, -2.524619, 1, 0.7019608, 0, 1,
-1.218103, -1.737325, -2.951878, 1, 0.7098039, 0, 1,
-1.211787, 0.06961435, -1.777822, 1, 0.7137255, 0, 1,
-1.210915, 0.03551112, -2.40845, 1, 0.7215686, 0, 1,
-1.205169, 0.7726429, -1.51524, 1, 0.7254902, 0, 1,
-1.199253, 0.7027751, 0.2225215, 1, 0.7333333, 0, 1,
-1.197763, 0.7305077, 0.004624962, 1, 0.7372549, 0, 1,
-1.19464, 0.7789693, -0.6157688, 1, 0.7450981, 0, 1,
-1.19403, -0.2974167, -2.481234, 1, 0.7490196, 0, 1,
-1.193092, -0.9725326, -3.631371, 1, 0.7568628, 0, 1,
-1.192171, -0.07497085, -3.283103, 1, 0.7607843, 0, 1,
-1.191213, 1.293202, 0.1495718, 1, 0.7686275, 0, 1,
-1.182741, 0.8115475, -1.525526, 1, 0.772549, 0, 1,
-1.17866, 0.3670199, -0.7627012, 1, 0.7803922, 0, 1,
-1.173766, -0.1978102, -1.92323, 1, 0.7843137, 0, 1,
-1.170852, -0.4412021, -2.128591, 1, 0.7921569, 0, 1,
-1.169028, -2.185958, -2.529978, 1, 0.7960784, 0, 1,
-1.161854, 1.097175, -1.377943, 1, 0.8039216, 0, 1,
-1.161491, 0.508391, -1.653956, 1, 0.8117647, 0, 1,
-1.153931, -1.016154, -1.761152, 1, 0.8156863, 0, 1,
-1.148505, -0.4585228, -0.2873917, 1, 0.8235294, 0, 1,
-1.137866, -1.040608, -2.165893, 1, 0.827451, 0, 1,
-1.135977, -1.809826, -1.800285, 1, 0.8352941, 0, 1,
-1.134561, 0.6337212, -2.260645, 1, 0.8392157, 0, 1,
-1.131527, 0.9475322, -0.0242508, 1, 0.8470588, 0, 1,
-1.124321, -0.7256142, -2.583751, 1, 0.8509804, 0, 1,
-1.113724, 0.2166155, -2.409294, 1, 0.8588235, 0, 1,
-1.094127, -0.4265341, -1.507307, 1, 0.8627451, 0, 1,
-1.091892, -0.5839047, -0.3358935, 1, 0.8705882, 0, 1,
-1.085631, -0.2959122, -1.039797, 1, 0.8745098, 0, 1,
-1.0827, 2.149103, -2.248463, 1, 0.8823529, 0, 1,
-1.081197, -0.03967329, -2.543266, 1, 0.8862745, 0, 1,
-1.073985, 0.08418656, -1.635752, 1, 0.8941177, 0, 1,
-1.071637, 0.6500582, -0.835851, 1, 0.8980392, 0, 1,
-1.069973, -0.2534067, -2.663677, 1, 0.9058824, 0, 1,
-1.062344, -0.01342137, -1.87172, 1, 0.9137255, 0, 1,
-1.061741, 0.3312045, 0.6633803, 1, 0.9176471, 0, 1,
-1.054317, 0.7637848, -2.787865, 1, 0.9254902, 0, 1,
-1.049644, -0.4610028, -1.50173, 1, 0.9294118, 0, 1,
-1.045824, -1.053572, -2.440863, 1, 0.9372549, 0, 1,
-1.042934, 0.0004007059, -0.7261068, 1, 0.9411765, 0, 1,
-1.034103, 0.5957275, -0.07451343, 1, 0.9490196, 0, 1,
-1.032694, -0.1657714, -1.135126, 1, 0.9529412, 0, 1,
-1.032372, -0.2629429, -1.133464, 1, 0.9607843, 0, 1,
-1.026267, -0.5741561, -1.285796, 1, 0.9647059, 0, 1,
-1.025272, 0.7325066, -0.3713156, 1, 0.972549, 0, 1,
-1.02449, 0.9227245, -0.5697751, 1, 0.9764706, 0, 1,
-1.015462, -0.3257849, -2.601629, 1, 0.9843137, 0, 1,
-1.01505, 0.1933798, -1.948059, 1, 0.9882353, 0, 1,
-1.012983, -0.666999, -2.748524, 1, 0.9960784, 0, 1,
-1.006849, 0.3808013, -3.924195, 0.9960784, 1, 0, 1,
-1.001482, -0.5914186, -4.1261, 0.9921569, 1, 0, 1,
-1.000011, 0.9725376, -2.755164, 0.9843137, 1, 0, 1,
-0.9996096, -0.7679461, -2.207672, 0.9803922, 1, 0, 1,
-0.9959384, -0.1830966, -1.776373, 0.972549, 1, 0, 1,
-0.9949906, 0.1634147, -1.597966, 0.9686275, 1, 0, 1,
-0.9938307, -0.7945458, -2.321766, 0.9607843, 1, 0, 1,
-0.9933362, -0.05355557, -0.1229924, 0.9568627, 1, 0, 1,
-0.9904005, -0.4902219, -4.244477, 0.9490196, 1, 0, 1,
-0.9852279, 1.565097, -2.147393, 0.945098, 1, 0, 1,
-0.9810572, -0.3648969, -1.856892, 0.9372549, 1, 0, 1,
-0.9795555, 0.1493535, -1.068168, 0.9333333, 1, 0, 1,
-0.9759919, -0.7700312, -2.347387, 0.9254902, 1, 0, 1,
-0.97552, -0.1222218, -1.839787, 0.9215686, 1, 0, 1,
-0.9730741, -0.108769, -1.561557, 0.9137255, 1, 0, 1,
-0.9724904, 0.7701538, -1.209984, 0.9098039, 1, 0, 1,
-0.9703782, -0.2814917, 0.4788801, 0.9019608, 1, 0, 1,
-0.9682772, 0.007963025, -3.243633, 0.8941177, 1, 0, 1,
-0.9664073, -0.05618105, -3.236221, 0.8901961, 1, 0, 1,
-0.9532901, -1.064676, -3.489348, 0.8823529, 1, 0, 1,
-0.9443341, -0.1201225, -2.280166, 0.8784314, 1, 0, 1,
-0.9282357, -2.064612, -1.638288, 0.8705882, 1, 0, 1,
-0.9272305, -0.1328275, -2.594277, 0.8666667, 1, 0, 1,
-0.9182112, 0.6037478, -2.018119, 0.8588235, 1, 0, 1,
-0.9164752, -0.9126035, -5.003682, 0.854902, 1, 0, 1,
-0.9095708, 1.109808, -0.7914747, 0.8470588, 1, 0, 1,
-0.9077847, -0.7187217, -3.088971, 0.8431373, 1, 0, 1,
-0.9053361, 0.3016852, -0.5237768, 0.8352941, 1, 0, 1,
-0.9041371, 0.440814, 0.5696186, 0.8313726, 1, 0, 1,
-0.8975836, -0.4992841, -1.807606, 0.8235294, 1, 0, 1,
-0.896666, 0.761309, -1.478332, 0.8196079, 1, 0, 1,
-0.8894181, 2.017532, -0.1125898, 0.8117647, 1, 0, 1,
-0.888908, -0.8352969, -2.774325, 0.8078431, 1, 0, 1,
-0.8871288, -0.08433194, -0.4106228, 0.8, 1, 0, 1,
-0.8838873, -0.06089272, -2.106187, 0.7921569, 1, 0, 1,
-0.8800124, 0.4958425, -1.611888, 0.7882353, 1, 0, 1,
-0.8783684, 0.6154863, 0.8357294, 0.7803922, 1, 0, 1,
-0.8757459, 0.626772, -1.303675, 0.7764706, 1, 0, 1,
-0.8756887, -0.5478715, -2.513588, 0.7686275, 1, 0, 1,
-0.8735684, 0.09584148, -1.95032, 0.7647059, 1, 0, 1,
-0.8727446, 1.501301, -1.680299, 0.7568628, 1, 0, 1,
-0.8649236, -0.7816669, -3.422531, 0.7529412, 1, 0, 1,
-0.8641994, 1.713208, 0.4375908, 0.7450981, 1, 0, 1,
-0.8560606, 0.1914846, -2.657817, 0.7411765, 1, 0, 1,
-0.8479896, 1.100312, -1.744552, 0.7333333, 1, 0, 1,
-0.8452708, 0.7376949, -0.5013916, 0.7294118, 1, 0, 1,
-0.8451004, 0.1649982, -0.5646259, 0.7215686, 1, 0, 1,
-0.8375663, 0.9619336, 0.01968495, 0.7176471, 1, 0, 1,
-0.8240511, -0.09250595, -1.579711, 0.7098039, 1, 0, 1,
-0.8204697, 0.4859922, -2.890868, 0.7058824, 1, 0, 1,
-0.8180373, -1.44202, -2.46593, 0.6980392, 1, 0, 1,
-0.8176869, 1.552596, 1.226257, 0.6901961, 1, 0, 1,
-0.8127398, 2.156947, -1.182244, 0.6862745, 1, 0, 1,
-0.8079615, 0.1512682, -1.761111, 0.6784314, 1, 0, 1,
-0.8000416, -0.3359837, -3.624015, 0.6745098, 1, 0, 1,
-0.7923092, -0.989395, -2.938473, 0.6666667, 1, 0, 1,
-0.7910395, -1.078255, -4.263249, 0.6627451, 1, 0, 1,
-0.7878208, -0.7154802, -1.670347, 0.654902, 1, 0, 1,
-0.7868097, -0.6995234, -1.191284, 0.6509804, 1, 0, 1,
-0.7857797, 1.272883, 0.2492623, 0.6431373, 1, 0, 1,
-0.7848334, -0.2017829, -4.013982, 0.6392157, 1, 0, 1,
-0.7760211, 0.8448439, -0.1559305, 0.6313726, 1, 0, 1,
-0.7676237, 1.09197, 0.09055876, 0.627451, 1, 0, 1,
-0.7609635, -0.1412551, -1.188284, 0.6196079, 1, 0, 1,
-0.7606345, 0.1465861, -1.574272, 0.6156863, 1, 0, 1,
-0.7605837, -0.2918272, -2.444547, 0.6078432, 1, 0, 1,
-0.7604303, -0.2354121, -2.067904, 0.6039216, 1, 0, 1,
-0.756721, -0.9072799, -3.807947, 0.5960785, 1, 0, 1,
-0.7557419, 0.6775814, -3.968333, 0.5882353, 1, 0, 1,
-0.753889, 0.2104554, -2.912829, 0.5843138, 1, 0, 1,
-0.7524938, -2.059755, -2.8095, 0.5764706, 1, 0, 1,
-0.7514082, -1.359629, -2.862375, 0.572549, 1, 0, 1,
-0.7511508, 0.8577915, -1.083663, 0.5647059, 1, 0, 1,
-0.7499248, 1.82918, 0.09173562, 0.5607843, 1, 0, 1,
-0.7490334, 0.1929726, -2.319807, 0.5529412, 1, 0, 1,
-0.7371259, 0.4416669, -0.8545051, 0.5490196, 1, 0, 1,
-0.7358596, -0.3605894, -1.070439, 0.5411765, 1, 0, 1,
-0.7347134, -1.781542, -3.938364, 0.5372549, 1, 0, 1,
-0.7322177, 0.7852687, -1.488036, 0.5294118, 1, 0, 1,
-0.7285532, -1.026113, -0.6273257, 0.5254902, 1, 0, 1,
-0.7182338, 1.540487, -2.056864, 0.5176471, 1, 0, 1,
-0.7103417, 0.1861736, -3.804504, 0.5137255, 1, 0, 1,
-0.7084258, 0.2229304, -2.884573, 0.5058824, 1, 0, 1,
-0.7058074, 0.990966, -0.7719387, 0.5019608, 1, 0, 1,
-0.700258, -0.4853089, -2.182944, 0.4941176, 1, 0, 1,
-0.6955564, -0.9137986, -2.860354, 0.4862745, 1, 0, 1,
-0.6945192, -0.5812678, -1.671536, 0.4823529, 1, 0, 1,
-0.6891371, 1.952301, -0.4828363, 0.4745098, 1, 0, 1,
-0.6889381, 1.158155, -1.458486, 0.4705882, 1, 0, 1,
-0.6827299, -0.2842902, -1.206896, 0.4627451, 1, 0, 1,
-0.6797115, 1.245667, -1.472505, 0.4588235, 1, 0, 1,
-0.6792634, -0.1778362, -2.683605, 0.4509804, 1, 0, 1,
-0.6781542, 1.256858, -0.7983532, 0.4470588, 1, 0, 1,
-0.6774881, 0.6202952, -1.073285, 0.4392157, 1, 0, 1,
-0.6665661, -1.294318, -2.274261, 0.4352941, 1, 0, 1,
-0.6619508, 1.560247, 0.1955781, 0.427451, 1, 0, 1,
-0.6513098, 0.5812737, -2.154823, 0.4235294, 1, 0, 1,
-0.6438084, 1.704559, -0.9405341, 0.4156863, 1, 0, 1,
-0.6411069, 1.024966, 0.5708786, 0.4117647, 1, 0, 1,
-0.6387517, -0.4232136, -2.458259, 0.4039216, 1, 0, 1,
-0.6384923, 0.9611707, 0.8244048, 0.3960784, 1, 0, 1,
-0.6383277, 0.06193687, -2.570131, 0.3921569, 1, 0, 1,
-0.637216, -0.911357, -2.630365, 0.3843137, 1, 0, 1,
-0.631562, -0.4877124, -3.467671, 0.3803922, 1, 0, 1,
-0.6258066, -0.824988, -3.104574, 0.372549, 1, 0, 1,
-0.6257187, -2.850978, -3.771577, 0.3686275, 1, 0, 1,
-0.6239645, -1.230093, -3.244653, 0.3607843, 1, 0, 1,
-0.6227324, -0.6828181, -2.234322, 0.3568628, 1, 0, 1,
-0.6222962, -0.5533726, -2.913916, 0.3490196, 1, 0, 1,
-0.6191332, -0.2921151, -4.663793, 0.345098, 1, 0, 1,
-0.6173835, -1.635984, -4.033877, 0.3372549, 1, 0, 1,
-0.611674, 0.6127766, -1.22972, 0.3333333, 1, 0, 1,
-0.6114801, -0.365896, -1.086463, 0.3254902, 1, 0, 1,
-0.6065797, 0.4624622, -0.717053, 0.3215686, 1, 0, 1,
-0.604099, 2.908278, -0.8399848, 0.3137255, 1, 0, 1,
-0.6036798, 1.244023, -1.363109, 0.3098039, 1, 0, 1,
-0.6028966, -0.3261728, 0.3441651, 0.3019608, 1, 0, 1,
-0.6011279, -0.5636544, -2.951422, 0.2941177, 1, 0, 1,
-0.5962704, 1.380323, -0.06047195, 0.2901961, 1, 0, 1,
-0.5922805, -1.026391, -1.71389, 0.282353, 1, 0, 1,
-0.5891986, 0.1012855, 1.285672, 0.2784314, 1, 0, 1,
-0.588773, -0.0344728, -2.446811, 0.2705882, 1, 0, 1,
-0.588144, -1.926371, -2.517877, 0.2666667, 1, 0, 1,
-0.5877652, 0.7892708, -0.2880064, 0.2588235, 1, 0, 1,
-0.5857054, 0.5961468, -1.384015, 0.254902, 1, 0, 1,
-0.5851285, -0.8561257, -2.113232, 0.2470588, 1, 0, 1,
-0.5732526, 0.4384896, 0.4337787, 0.2431373, 1, 0, 1,
-0.5693536, -0.05264984, -1.301427, 0.2352941, 1, 0, 1,
-0.5672438, -0.8721325, -2.578733, 0.2313726, 1, 0, 1,
-0.5603688, -0.4992204, -1.047355, 0.2235294, 1, 0, 1,
-0.5541729, -0.2601598, -2.881079, 0.2196078, 1, 0, 1,
-0.5494609, 1.271155, 0.3463841, 0.2117647, 1, 0, 1,
-0.5469842, 0.4252152, -1.12732, 0.2078431, 1, 0, 1,
-0.5459623, -0.3124273, -2.698052, 0.2, 1, 0, 1,
-0.5436093, 1.062596, -0.6246634, 0.1921569, 1, 0, 1,
-0.5383079, -1.738306, -2.909798, 0.1882353, 1, 0, 1,
-0.5382423, 0.7905919, -0.3451847, 0.1803922, 1, 0, 1,
-0.5336449, 0.7875747, 0.5201398, 0.1764706, 1, 0, 1,
-0.5326562, -1.632213, -1.258249, 0.1686275, 1, 0, 1,
-0.5304481, -0.1143154, -1.896747, 0.1647059, 1, 0, 1,
-0.5217783, 0.9390702, -1.522454, 0.1568628, 1, 0, 1,
-0.5212883, -0.7602496, -1.6826, 0.1529412, 1, 0, 1,
-0.5124924, -1.082521, -1.470036, 0.145098, 1, 0, 1,
-0.5062667, 0.2106441, -0.9076861, 0.1411765, 1, 0, 1,
-0.5060818, 1.065712, -0.9864246, 0.1333333, 1, 0, 1,
-0.5028653, 0.8574672, -0.2268946, 0.1294118, 1, 0, 1,
-0.5020099, 0.8937196, -0.8736057, 0.1215686, 1, 0, 1,
-0.5011204, 1.782657, 0.4555718, 0.1176471, 1, 0, 1,
-0.4975033, -0.3526884, -1.188926, 0.1098039, 1, 0, 1,
-0.4967731, 1.00919, -0.2089081, 0.1058824, 1, 0, 1,
-0.4946158, -1.215774, -2.6928, 0.09803922, 1, 0, 1,
-0.4900847, -0.3851344, -4.124726, 0.09019608, 1, 0, 1,
-0.4855089, -0.2344396, -1.211908, 0.08627451, 1, 0, 1,
-0.4819122, -1.489806, -4.048748, 0.07843138, 1, 0, 1,
-0.4816112, -1.367111, -1.402338, 0.07450981, 1, 0, 1,
-0.4796913, -1.909771, -4.157307, 0.06666667, 1, 0, 1,
-0.4794532, -0.6981302, -3.721041, 0.0627451, 1, 0, 1,
-0.4785178, 0.2661753, -0.2448729, 0.05490196, 1, 0, 1,
-0.4768302, -0.06904076, -0.3515601, 0.05098039, 1, 0, 1,
-0.4676387, -0.6337321, -1.746119, 0.04313726, 1, 0, 1,
-0.4636294, -0.3153028, -3.092374, 0.03921569, 1, 0, 1,
-0.4636086, 1.00006, -0.2420042, 0.03137255, 1, 0, 1,
-0.451654, -0.7446387, -3.678322, 0.02745098, 1, 0, 1,
-0.4443989, -1.751559, -3.227883, 0.01960784, 1, 0, 1,
-0.4426897, -0.3516096, -0.172105, 0.01568628, 1, 0, 1,
-0.4409037, -1.00963, -3.624638, 0.007843138, 1, 0, 1,
-0.4402704, 0.1638542, 1.148394, 0.003921569, 1, 0, 1,
-0.4373568, -0.02131112, 0.2862028, 0, 1, 0.003921569, 1,
-0.4328957, -0.567162, -2.687301, 0, 1, 0.01176471, 1,
-0.4287615, 1.445434, -0.5678301, 0, 1, 0.01568628, 1,
-0.4254939, 0.599508, 0.2660765, 0, 1, 0.02352941, 1,
-0.4225253, 0.4656744, 0.4888399, 0, 1, 0.02745098, 1,
-0.4215822, -1.503888, -2.433469, 0, 1, 0.03529412, 1,
-0.4194001, -2.019628, -4.132593, 0, 1, 0.03921569, 1,
-0.4191275, 0.3542056, -1.560305, 0, 1, 0.04705882, 1,
-0.4039868, 2.429399, -1.672341, 0, 1, 0.05098039, 1,
-0.4011527, 0.2191334, 0.01564147, 0, 1, 0.05882353, 1,
-0.3993641, 0.7274135, 0.2677041, 0, 1, 0.0627451, 1,
-0.3922653, -1.305731, -3.079723, 0, 1, 0.07058824, 1,
-0.388381, -0.8623268, -3.120531, 0, 1, 0.07450981, 1,
-0.3839845, 0.6285969, -0.8079942, 0, 1, 0.08235294, 1,
-0.3829291, 0.8351589, 0.6086907, 0, 1, 0.08627451, 1,
-0.3822518, -1.528426, -3.662812, 0, 1, 0.09411765, 1,
-0.3822155, -0.6611946, -2.733894, 0, 1, 0.1019608, 1,
-0.3813035, -0.9372354, -1.984318, 0, 1, 0.1058824, 1,
-0.3811786, 0.0631272, -2.004906, 0, 1, 0.1137255, 1,
-0.3773382, 0.8285152, -0.6638364, 0, 1, 0.1176471, 1,
-0.3727791, -0.5187733, -1.619425, 0, 1, 0.1254902, 1,
-0.3726979, -0.4979311, -3.404963, 0, 1, 0.1294118, 1,
-0.3724828, -0.4589495, -1.103494, 0, 1, 0.1372549, 1,
-0.3701341, -0.2737142, -1.876275, 0, 1, 0.1411765, 1,
-0.3616698, 0.8480842, -0.09686046, 0, 1, 0.1490196, 1,
-0.3610481, 0.6729705, -0.7940804, 0, 1, 0.1529412, 1,
-0.3572238, 0.3422197, 0.3932995, 0, 1, 0.1607843, 1,
-0.3539154, -0.2974423, -3.593273, 0, 1, 0.1647059, 1,
-0.3482599, 1.703447, 1.602125, 0, 1, 0.172549, 1,
-0.3482575, -0.745671, -3.200373, 0, 1, 0.1764706, 1,
-0.3439135, 0.24105, -1.683428, 0, 1, 0.1843137, 1,
-0.3350236, -1.431251, -0.7888403, 0, 1, 0.1882353, 1,
-0.3334834, 1.002576, 0.6382495, 0, 1, 0.1960784, 1,
-0.3324169, 0.2216887, -0.9779125, 0, 1, 0.2039216, 1,
-0.3268952, -1.22667, -3.22436, 0, 1, 0.2078431, 1,
-0.3247723, 0.2262243, -1.018849, 0, 1, 0.2156863, 1,
-0.3232606, -0.2893935, -1.371591, 0, 1, 0.2196078, 1,
-0.3219207, -0.5477637, -2.902751, 0, 1, 0.227451, 1,
-0.3214543, 0.6301926, -0.2191005, 0, 1, 0.2313726, 1,
-0.3112653, 1.063193, 0.558056, 0, 1, 0.2392157, 1,
-0.3108231, 0.8287032, -0.8266023, 0, 1, 0.2431373, 1,
-0.3106481, 0.8763129, 0.6768401, 0, 1, 0.2509804, 1,
-0.3090721, -0.5259207, -0.7212977, 0, 1, 0.254902, 1,
-0.3089401, -1.533165, -2.434888, 0, 1, 0.2627451, 1,
-0.3067726, -1.073295, -3.197456, 0, 1, 0.2666667, 1,
-0.3022578, 0.1054848, -1.180302, 0, 1, 0.2745098, 1,
-0.3011935, 1.761807, 1.652506, 0, 1, 0.2784314, 1,
-0.3003648, 0.9394513, -0.07760173, 0, 1, 0.2862745, 1,
-0.2973983, -0.4553896, -3.521676, 0, 1, 0.2901961, 1,
-0.2973134, -0.3994246, -2.141705, 0, 1, 0.2980392, 1,
-0.2954857, 1.178819, 0.5900668, 0, 1, 0.3058824, 1,
-0.2886189, -0.6968544, -2.40327, 0, 1, 0.3098039, 1,
-0.2882024, -1.789548, -3.21162, 0, 1, 0.3176471, 1,
-0.285494, -0.968486, -1.622161, 0, 1, 0.3215686, 1,
-0.2844071, 0.3204214, 0.06547373, 0, 1, 0.3294118, 1,
-0.2830761, 2.910611, -0.04296139, 0, 1, 0.3333333, 1,
-0.2818508, -1.569746, -2.87944, 0, 1, 0.3411765, 1,
-0.2788505, 2.317456, -0.373893, 0, 1, 0.345098, 1,
-0.2764937, -0.6880468, -1.630819, 0, 1, 0.3529412, 1,
-0.27163, 0.7094488, -1.240363, 0, 1, 0.3568628, 1,
-0.2690533, -1.298016, -2.97756, 0, 1, 0.3647059, 1,
-0.2570712, -1.034034, -2.536609, 0, 1, 0.3686275, 1,
-0.2570211, 1.040076, -1.227314, 0, 1, 0.3764706, 1,
-0.2552965, -0.693125, -2.599809, 0, 1, 0.3803922, 1,
-0.2495648, -1.518349, -2.010711, 0, 1, 0.3882353, 1,
-0.2494253, -0.7798608, -2.412481, 0, 1, 0.3921569, 1,
-0.2477891, -1.155839, -2.216202, 0, 1, 0.4, 1,
-0.2476996, -0.8003176, -2.304599, 0, 1, 0.4078431, 1,
-0.2466106, -0.1263069, -1.350768, 0, 1, 0.4117647, 1,
-0.2461223, -0.2611562, -2.070287, 0, 1, 0.4196078, 1,
-0.2391048, 2.057925, 1.270961, 0, 1, 0.4235294, 1,
-0.2353655, 0.9105195, -2.449829, 0, 1, 0.4313726, 1,
-0.2337298, 0.6571934, -0.0723047, 0, 1, 0.4352941, 1,
-0.2328654, 0.5222726, 1.850534, 0, 1, 0.4431373, 1,
-0.2293276, 0.5462949, -0.715211, 0, 1, 0.4470588, 1,
-0.2285208, -0.1414602, -2.167225, 0, 1, 0.454902, 1,
-0.2224855, 1.22507, -0.0521808, 0, 1, 0.4588235, 1,
-0.2187738, 0.6132889, 0.7728378, 0, 1, 0.4666667, 1,
-0.2184025, 0.3630937, 1.072686, 0, 1, 0.4705882, 1,
-0.2168861, 0.6326545, -0.9838725, 0, 1, 0.4784314, 1,
-0.2154322, 0.565692, -0.6590127, 0, 1, 0.4823529, 1,
-0.2140178, -0.8505054, -4.689602, 0, 1, 0.4901961, 1,
-0.2131413, 0.1714556, -1.16457, 0, 1, 0.4941176, 1,
-0.2063476, -1.137497, -4.340596, 0, 1, 0.5019608, 1,
-0.1944004, -1.212293, -3.203738, 0, 1, 0.509804, 1,
-0.1942477, -0.955815, -3.043839, 0, 1, 0.5137255, 1,
-0.19229, 0.3499118, 0.1838441, 0, 1, 0.5215687, 1,
-0.1897029, 0.6725956, -0.8619901, 0, 1, 0.5254902, 1,
-0.1878622, -1.531669, -3.784271, 0, 1, 0.5333334, 1,
-0.1839622, 0.415007, -0.2200713, 0, 1, 0.5372549, 1,
-0.1815101, -0.6344997, -2.486271, 0, 1, 0.5450981, 1,
-0.1783603, -0.1407364, -2.437696, 0, 1, 0.5490196, 1,
-0.1781281, 0.4974074, -1.753584, 0, 1, 0.5568628, 1,
-0.176016, 0.03956035, -0.9566294, 0, 1, 0.5607843, 1,
-0.174226, -1.191063, -3.435207, 0, 1, 0.5686275, 1,
-0.172367, 1.518438, 0.3498044, 0, 1, 0.572549, 1,
-0.1698643, 0.7939932, 0.3064391, 0, 1, 0.5803922, 1,
-0.1664541, 1.251692, 2.964063, 0, 1, 0.5843138, 1,
-0.1615787, 0.2034363, 0.08735686, 0, 1, 0.5921569, 1,
-0.1615696, 0.7407902, 0.3846447, 0, 1, 0.5960785, 1,
-0.16093, 0.9369935, 1.34218, 0, 1, 0.6039216, 1,
-0.1508293, 1.37421, 1.619523, 0, 1, 0.6117647, 1,
-0.1494897, 0.5890139, -0.8254577, 0, 1, 0.6156863, 1,
-0.1469469, 0.07583258, -0.5826492, 0, 1, 0.6235294, 1,
-0.1465503, 0.8767413, -1.106838, 0, 1, 0.627451, 1,
-0.144077, -0.2978509, -2.716134, 0, 1, 0.6352941, 1,
-0.1386989, 0.436578, -0.5172161, 0, 1, 0.6392157, 1,
-0.1377522, -0.1236224, -4.072944, 0, 1, 0.6470588, 1,
-0.1318431, 1.159564, 0.0006118194, 0, 1, 0.6509804, 1,
-0.125488, -0.7283061, -3.300026, 0, 1, 0.6588235, 1,
-0.1231434, -0.4670255, -3.482946, 0, 1, 0.6627451, 1,
-0.1203798, -0.9930021, -2.731081, 0, 1, 0.6705883, 1,
-0.1201998, -1.053027, -3.467408, 0, 1, 0.6745098, 1,
-0.1200394, 1.559533, -0.615679, 0, 1, 0.682353, 1,
-0.11761, 0.6739659, 1.370659, 0, 1, 0.6862745, 1,
-0.111783, -0.3935966, -2.294483, 0, 1, 0.6941177, 1,
-0.1111565, -0.1949486, -3.97663, 0, 1, 0.7019608, 1,
-0.1097787, 0.0958992, -1.2642, 0, 1, 0.7058824, 1,
-0.1024773, 2.210722, -1.179244, 0, 1, 0.7137255, 1,
-0.1016883, 0.8984885, -0.1370662, 0, 1, 0.7176471, 1,
-0.1000316, -0.6835419, -3.433668, 0, 1, 0.7254902, 1,
-0.09963438, -1.10918, -2.234439, 0, 1, 0.7294118, 1,
-0.09721101, -0.4191193, -1.825082, 0, 1, 0.7372549, 1,
-0.09491695, 0.3311854, -2.32844, 0, 1, 0.7411765, 1,
-0.09412665, 1.276564, 1.640615, 0, 1, 0.7490196, 1,
-0.09348423, -0.6452577, -1.431921, 0, 1, 0.7529412, 1,
-0.08921582, -0.3975595, -3.108355, 0, 1, 0.7607843, 1,
-0.0886528, 0.7794653, 0.3727171, 0, 1, 0.7647059, 1,
-0.08424723, -0.779058, -3.202485, 0, 1, 0.772549, 1,
-0.08282629, 1.139875, 1.475207, 0, 1, 0.7764706, 1,
-0.0770724, 0.02615885, 0.5248321, 0, 1, 0.7843137, 1,
-0.07612459, 0.6742442, -0.1388, 0, 1, 0.7882353, 1,
-0.07603993, 2.095924, -0.4698786, 0, 1, 0.7960784, 1,
-0.07227515, -1.349944, -3.600049, 0, 1, 0.8039216, 1,
-0.07049198, -1.392392, -4.070424, 0, 1, 0.8078431, 1,
-0.06794705, -1.861279, -3.557003, 0, 1, 0.8156863, 1,
-0.06721298, 0.1997947, 0.3877473, 0, 1, 0.8196079, 1,
-0.0665225, -1.401304, -2.046873, 0, 1, 0.827451, 1,
-0.06387576, 0.7125931, -0.7881609, 0, 1, 0.8313726, 1,
-0.06145163, 0.9040871, -1.056584, 0, 1, 0.8392157, 1,
-0.06041606, 0.08405644, -0.6423782, 0, 1, 0.8431373, 1,
-0.05663868, 0.2840712, -1.542527, 0, 1, 0.8509804, 1,
-0.05264653, 2.086556, 1.099549, 0, 1, 0.854902, 1,
-0.05213251, 1.224438, -0.6379918, 0, 1, 0.8627451, 1,
-0.04804773, 0.5330091, -0.3498905, 0, 1, 0.8666667, 1,
-0.04640737, -0.09369861, -1.621865, 0, 1, 0.8745098, 1,
-0.0460809, -0.5942515, -3.249711, 0, 1, 0.8784314, 1,
-0.04363632, 0.9168634, -0.3473794, 0, 1, 0.8862745, 1,
-0.04034537, -0.4598138, -2.571675, 0, 1, 0.8901961, 1,
-0.04003209, -1.795944, -2.849875, 0, 1, 0.8980392, 1,
-0.03975004, 0.0187671, -1.907899, 0, 1, 0.9058824, 1,
-0.03758548, 0.08261698, -0.6660852, 0, 1, 0.9098039, 1,
-0.03527272, -0.1458742, -3.355668, 0, 1, 0.9176471, 1,
-0.0327004, -0.09774986, -2.667344, 0, 1, 0.9215686, 1,
-0.02548484, -0.7690293, -2.774332, 0, 1, 0.9294118, 1,
-0.01692179, 0.3044511, 0.1311052, 0, 1, 0.9333333, 1,
-0.01398452, -1.632539, -2.848788, 0, 1, 0.9411765, 1,
-0.01008569, 0.1207892, -0.1380679, 0, 1, 0.945098, 1,
-0.0001592251, 0.09381987, 0.4643482, 0, 1, 0.9529412, 1,
0.003382256, -0.1953105, 3.573915, 0, 1, 0.9568627, 1,
0.006474757, 0.5221173, 0.1224164, 0, 1, 0.9647059, 1,
0.006513256, 0.9953989, 0.4745256, 0, 1, 0.9686275, 1,
0.008551262, -2.281814, 2.582244, 0, 1, 0.9764706, 1,
0.01513397, -0.490584, 3.936803, 0, 1, 0.9803922, 1,
0.01594779, -0.2252497, 4.173214, 0, 1, 0.9882353, 1,
0.02121036, 0.6501545, -0.2003077, 0, 1, 0.9921569, 1,
0.027634, 0.05261463, 0.1507446, 0, 1, 1, 1,
0.03313236, 0.4158555, 0.474392, 0, 0.9921569, 1, 1,
0.03407602, 0.634111, -0.10873, 0, 0.9882353, 1, 1,
0.03550362, 0.4530863, -0.6269112, 0, 0.9803922, 1, 1,
0.04141289, -1.49387, 1.883967, 0, 0.9764706, 1, 1,
0.04590346, -0.3351921, 3.52721, 0, 0.9686275, 1, 1,
0.04622199, -0.4002098, 4.712383, 0, 0.9647059, 1, 1,
0.04679978, -0.3554336, 4.234746, 0, 0.9568627, 1, 1,
0.05135965, -0.6292232, 3.687995, 0, 0.9529412, 1, 1,
0.06609897, 2.207434, 1.061406, 0, 0.945098, 1, 1,
0.06699836, -1.423186, 4.25981, 0, 0.9411765, 1, 1,
0.06798711, 0.4657766, -0.7078947, 0, 0.9333333, 1, 1,
0.06858273, -1.697112, 4.199233, 0, 0.9294118, 1, 1,
0.0698958, 1.23148, 0.8684124, 0, 0.9215686, 1, 1,
0.07086446, -0.4263984, 1.677568, 0, 0.9176471, 1, 1,
0.07193134, 0.002686282, 0.4393967, 0, 0.9098039, 1, 1,
0.07278424, 0.5572638, -1.070088, 0, 0.9058824, 1, 1,
0.07319248, -1.560246, 5.220356, 0, 0.8980392, 1, 1,
0.07633331, -2.080103, 2.6237, 0, 0.8901961, 1, 1,
0.07645364, 0.7905418, -2.008907, 0, 0.8862745, 1, 1,
0.08777317, -1.528, 2.955796, 0, 0.8784314, 1, 1,
0.08884202, 0.8283855, -1.036301, 0, 0.8745098, 1, 1,
0.09014881, 0.03389403, 1.640675, 0, 0.8666667, 1, 1,
0.09180607, -0.4379824, 3.052906, 0, 0.8627451, 1, 1,
0.0918888, -1.56167, 2.904026, 0, 0.854902, 1, 1,
0.09395751, -0.1844417, 3.957855, 0, 0.8509804, 1, 1,
0.09709108, -0.6140531, 3.909619, 0, 0.8431373, 1, 1,
0.09850628, -1.045485, 2.498683, 0, 0.8392157, 1, 1,
0.09921464, -0.03310415, 2.113067, 0, 0.8313726, 1, 1,
0.1052359, -0.04467221, 2.00034, 0, 0.827451, 1, 1,
0.1058005, -0.774611, 3.042286, 0, 0.8196079, 1, 1,
0.1078153, -0.3978321, 3.133745, 0, 0.8156863, 1, 1,
0.1106651, 2.19205, 0.2994014, 0, 0.8078431, 1, 1,
0.114131, -0.295051, 1.992768, 0, 0.8039216, 1, 1,
0.1155872, -1.67167, 1.518694, 0, 0.7960784, 1, 1,
0.1256972, 1.063967, -0.5687238, 0, 0.7882353, 1, 1,
0.1275495, 0.8388762, 1.586819, 0, 0.7843137, 1, 1,
0.1284157, 0.7588922, 1.627777, 0, 0.7764706, 1, 1,
0.1285989, 0.8835286, 2.033155, 0, 0.772549, 1, 1,
0.1358372, -0.2214497, 4.224396, 0, 0.7647059, 1, 1,
0.1403871, -1.088426, 1.650322, 0, 0.7607843, 1, 1,
0.1405511, 1.9152, 0.0325173, 0, 0.7529412, 1, 1,
0.1448779, -0.3885682, 2.996136, 0, 0.7490196, 1, 1,
0.1536727, -1.130667, 1.658775, 0, 0.7411765, 1, 1,
0.1560141, 0.3852035, 0.5978335, 0, 0.7372549, 1, 1,
0.1589974, -0.5258814, 2.472577, 0, 0.7294118, 1, 1,
0.1601967, 0.2044004, 1.145924, 0, 0.7254902, 1, 1,
0.1618193, -1.334283, 2.915704, 0, 0.7176471, 1, 1,
0.1656593, 1.137281, 0.07384477, 0, 0.7137255, 1, 1,
0.1662893, 2.004224, -0.2283348, 0, 0.7058824, 1, 1,
0.1678355, -0.5327247, 3.005409, 0, 0.6980392, 1, 1,
0.169806, -2.249194, 2.356397, 0, 0.6941177, 1, 1,
0.1699412, -0.9453995, 4.310056, 0, 0.6862745, 1, 1,
0.1701084, 0.5509335, 0.6461901, 0, 0.682353, 1, 1,
0.1723075, -0.2658893, 3.636738, 0, 0.6745098, 1, 1,
0.1748142, -0.447819, 1.643877, 0, 0.6705883, 1, 1,
0.1754202, 0.8871018, -0.5701627, 0, 0.6627451, 1, 1,
0.1756575, -0.2887358, 0.6863759, 0, 0.6588235, 1, 1,
0.1800034, -1.730088, 3.94778, 0, 0.6509804, 1, 1,
0.1849636, 0.2151169, 1.180549, 0, 0.6470588, 1, 1,
0.1877272, 1.953155, 1.071948, 0, 0.6392157, 1, 1,
0.1911657, -0.4492112, 1.912109, 0, 0.6352941, 1, 1,
0.1925313, 0.2491811, 3.077888, 0, 0.627451, 1, 1,
0.2004987, 1.140018, -0.3730878, 0, 0.6235294, 1, 1,
0.2023787, 0.753346, -0.6089863, 0, 0.6156863, 1, 1,
0.2070693, -1.375717, 1.281604, 0, 0.6117647, 1, 1,
0.2072176, 0.4216261, 1.858469, 0, 0.6039216, 1, 1,
0.2104941, -0.03190903, 0.9736682, 0, 0.5960785, 1, 1,
0.2118013, -1.314655, 4.314433, 0, 0.5921569, 1, 1,
0.2128975, -0.8196252, 2.515836, 0, 0.5843138, 1, 1,
0.2150781, 0.8413508, 1.865564, 0, 0.5803922, 1, 1,
0.2160085, -1.302665, 5.1599, 0, 0.572549, 1, 1,
0.2214849, 1.516869, 1.226744, 0, 0.5686275, 1, 1,
0.227355, -0.2680601, 2.610255, 0, 0.5607843, 1, 1,
0.2296333, -0.1117612, 1.53286, 0, 0.5568628, 1, 1,
0.2365538, -2.036097, 4.813558, 0, 0.5490196, 1, 1,
0.2384237, -0.1209254, 2.577127, 0, 0.5450981, 1, 1,
0.2385902, -0.8513451, 2.329363, 0, 0.5372549, 1, 1,
0.2400241, 0.009909961, -0.01893665, 0, 0.5333334, 1, 1,
0.2411381, 0.2047468, 3.008561, 0, 0.5254902, 1, 1,
0.2441, 0.537873, 0.2545428, 0, 0.5215687, 1, 1,
0.2445438, -0.1831802, 2.142056, 0, 0.5137255, 1, 1,
0.2480935, 1.196367, 1.45913, 0, 0.509804, 1, 1,
0.2502045, 2.0583, 0.746909, 0, 0.5019608, 1, 1,
0.2516085, 0.8612993, 0.1149606, 0, 0.4941176, 1, 1,
0.2521014, 1.025593, 0.3733609, 0, 0.4901961, 1, 1,
0.2547975, -0.5048991, 2.090838, 0, 0.4823529, 1, 1,
0.2550487, 0.4888304, -1.347366, 0, 0.4784314, 1, 1,
0.2570734, 0.822359, -0.4221486, 0, 0.4705882, 1, 1,
0.2576745, -0.5014007, 1.939548, 0, 0.4666667, 1, 1,
0.2590678, -0.8700997, 3.098918, 0, 0.4588235, 1, 1,
0.2616773, 0.1045398, 0.9139768, 0, 0.454902, 1, 1,
0.2665096, -1.060256, 3.25274, 0, 0.4470588, 1, 1,
0.2678197, -0.08201882, 1.344001, 0, 0.4431373, 1, 1,
0.2685565, -0.4104219, 0.4795204, 0, 0.4352941, 1, 1,
0.2702518, 0.3594437, 0.7738863, 0, 0.4313726, 1, 1,
0.2710876, -1.711275, 2.625392, 0, 0.4235294, 1, 1,
0.2735694, 0.230431, -0.1703156, 0, 0.4196078, 1, 1,
0.2740889, -0.7506991, 4.026204, 0, 0.4117647, 1, 1,
0.2757575, -1.487614, 1.831765, 0, 0.4078431, 1, 1,
0.2772127, 0.4414116, 1.118405, 0, 0.4, 1, 1,
0.2830995, 0.3210987, 1.304097, 0, 0.3921569, 1, 1,
0.2838768, 0.5395992, 0.9728789, 0, 0.3882353, 1, 1,
0.2846038, -0.4147496, 3.317012, 0, 0.3803922, 1, 1,
0.2885411, -1.298824, 3.630659, 0, 0.3764706, 1, 1,
0.2942891, 1.740433, 1.532542, 0, 0.3686275, 1, 1,
0.299185, 0.5811895, 0.4947252, 0, 0.3647059, 1, 1,
0.2993827, 1.184631, -0.09604991, 0, 0.3568628, 1, 1,
0.3036982, 0.4811516, 1.816543, 0, 0.3529412, 1, 1,
0.3039579, -0.336304, 0.9926448, 0, 0.345098, 1, 1,
0.3073481, -1.807835, 3.165184, 0, 0.3411765, 1, 1,
0.3076118, -0.4538415, 1.840645, 0, 0.3333333, 1, 1,
0.309621, -0.9158615, 3.784084, 0, 0.3294118, 1, 1,
0.3107839, -0.2263767, 2.930384, 0, 0.3215686, 1, 1,
0.3115174, -0.1307327, 1.400853, 0, 0.3176471, 1, 1,
0.3121783, -0.47303, 3.269178, 0, 0.3098039, 1, 1,
0.3139414, 1.249663, 1.667063, 0, 0.3058824, 1, 1,
0.3163308, -0.1470916, 1.641539, 0, 0.2980392, 1, 1,
0.3222189, -1.614855, 3.199899, 0, 0.2901961, 1, 1,
0.3227358, 0.8381901, -0.6061801, 0, 0.2862745, 1, 1,
0.3238056, -1.066717, 4.158711, 0, 0.2784314, 1, 1,
0.3343714, -0.5112834, 1.129934, 0, 0.2745098, 1, 1,
0.338542, 0.8471339, -1.773786, 0, 0.2666667, 1, 1,
0.3417038, 1.96793, -0.3121387, 0, 0.2627451, 1, 1,
0.3425792, 0.02274589, 1.08916, 0, 0.254902, 1, 1,
0.3437099, 1.218423, 0.4585215, 0, 0.2509804, 1, 1,
0.3473788, -0.6992962, 4.044554, 0, 0.2431373, 1, 1,
0.3482033, 0.4094996, 0.7019808, 0, 0.2392157, 1, 1,
0.3509164, 0.06183814, 1.360337, 0, 0.2313726, 1, 1,
0.3512931, -0.6030921, 2.968426, 0, 0.227451, 1, 1,
0.3522627, -0.3283273, 3.850691, 0, 0.2196078, 1, 1,
0.3545468, 0.2440332, 2.4085, 0, 0.2156863, 1, 1,
0.358731, 1.07977, -0.5675381, 0, 0.2078431, 1, 1,
0.3591977, 2.754823, 1.052758, 0, 0.2039216, 1, 1,
0.3609865, -0.1492701, 1.880383, 0, 0.1960784, 1, 1,
0.3659721, 0.4489143, 1.213147, 0, 0.1882353, 1, 1,
0.3675615, -0.6427998, 0.94721, 0, 0.1843137, 1, 1,
0.3683645, 2.516345, 0.3157497, 0, 0.1764706, 1, 1,
0.3686725, 1.361836, 1.302525, 0, 0.172549, 1, 1,
0.3692636, 0.2970789, 0.2649834, 0, 0.1647059, 1, 1,
0.3712586, -1.007906, 2.710147, 0, 0.1607843, 1, 1,
0.3716622, 0.9198332, 0.6899613, 0, 0.1529412, 1, 1,
0.3775964, 0.857982, 1.014195, 0, 0.1490196, 1, 1,
0.3788964, -0.6534151, 2.574694, 0, 0.1411765, 1, 1,
0.3813381, 0.3783315, 1.632989, 0, 0.1372549, 1, 1,
0.3817579, 0.2601396, -0.6434445, 0, 0.1294118, 1, 1,
0.3880807, 0.1967004, 1.166089, 0, 0.1254902, 1, 1,
0.3904462, -0.08840428, 2.001621, 0, 0.1176471, 1, 1,
0.3908866, -0.4577653, 1.873811, 0, 0.1137255, 1, 1,
0.3912044, -2.303552, 3.327365, 0, 0.1058824, 1, 1,
0.3938044, -1.312051, 5.21501, 0, 0.09803922, 1, 1,
0.3952686, -0.2499475, 2.501984, 0, 0.09411765, 1, 1,
0.3963167, -1.255497, 2.244166, 0, 0.08627451, 1, 1,
0.3965589, -1.590728, 3.212799, 0, 0.08235294, 1, 1,
0.3967627, 0.6241235, -0.5349542, 0, 0.07450981, 1, 1,
0.3969338, 1.206109, 0.5789759, 0, 0.07058824, 1, 1,
0.3995012, -0.3555775, 2.063188, 0, 0.0627451, 1, 1,
0.4043653, 0.6308397, -0.01232539, 0, 0.05882353, 1, 1,
0.4064187, 0.2859235, -0.4907599, 0, 0.05098039, 1, 1,
0.4117455, 0.3679774, 1.326978, 0, 0.04705882, 1, 1,
0.4163361, -2.051043, 2.640044, 0, 0.03921569, 1, 1,
0.4193462, 0.2468183, 0.5955316, 0, 0.03529412, 1, 1,
0.4238921, -1.274662, 3.448236, 0, 0.02745098, 1, 1,
0.4329953, -0.5528257, 3.388569, 0, 0.02352941, 1, 1,
0.4343549, -0.2311462, 2.144917, 0, 0.01568628, 1, 1,
0.437225, -0.1742455, 1.300852, 0, 0.01176471, 1, 1,
0.4372558, 0.5292805, 1.222531, 0, 0.003921569, 1, 1,
0.4395612, 1.208612, 0.7816674, 0.003921569, 0, 1, 1,
0.4396722, 1.241394, 0.8709173, 0.007843138, 0, 1, 1,
0.449921, -0.1431057, 1.457287, 0.01568628, 0, 1, 1,
0.4507349, -0.5155973, 0.9091009, 0.01960784, 0, 1, 1,
0.4545427, 0.1877722, 0.5450832, 0.02745098, 0, 1, 1,
0.4600521, 0.9372362, 0.01707543, 0.03137255, 0, 1, 1,
0.4601607, -1.906526, 2.064574, 0.03921569, 0, 1, 1,
0.4625103, -0.2605598, 2.712768, 0.04313726, 0, 1, 1,
0.4682735, -1.178852, 1.683053, 0.05098039, 0, 1, 1,
0.4705555, 2.151144, -0.2201746, 0.05490196, 0, 1, 1,
0.4721164, 0.8456387, -1.263763, 0.0627451, 0, 1, 1,
0.4725658, -1.182119, 2.9688, 0.06666667, 0, 1, 1,
0.4755543, -0.6845285, 1.140824, 0.07450981, 0, 1, 1,
0.4757171, 0.282806, 2.29545, 0.07843138, 0, 1, 1,
0.4821459, -0.05113035, 3.642364, 0.08627451, 0, 1, 1,
0.4830576, -0.6548853, 2.84388, 0.09019608, 0, 1, 1,
0.4873056, 0.6425468, 1.485273, 0.09803922, 0, 1, 1,
0.490469, -1.367143, 2.913496, 0.1058824, 0, 1, 1,
0.4968172, -0.6628237, 3.606004, 0.1098039, 0, 1, 1,
0.4976897, -0.663097, 2.035633, 0.1176471, 0, 1, 1,
0.4990992, -0.195715, 1.05352, 0.1215686, 0, 1, 1,
0.5036382, -1.144544, 1.848407, 0.1294118, 0, 1, 1,
0.5037373, 0.4405406, 0.8962745, 0.1333333, 0, 1, 1,
0.5039825, 1.36937, 0.7113539, 0.1411765, 0, 1, 1,
0.5050426, 1.055609, 1.634558, 0.145098, 0, 1, 1,
0.5080214, -0.7500455, 2.764362, 0.1529412, 0, 1, 1,
0.5088198, 0.6147912, 1.959664, 0.1568628, 0, 1, 1,
0.5115837, -0.1510085, 1.120277, 0.1647059, 0, 1, 1,
0.5116796, -0.3744809, 1.789925, 0.1686275, 0, 1, 1,
0.5140153, 0.1961812, 2.416124, 0.1764706, 0, 1, 1,
0.5150924, 0.3672014, 0.2360091, 0.1803922, 0, 1, 1,
0.5191531, -1.068286, 2.142287, 0.1882353, 0, 1, 1,
0.51918, 0.6047135, -0.07790966, 0.1921569, 0, 1, 1,
0.5195017, 0.1560556, 0.6983569, 0.2, 0, 1, 1,
0.521198, 1.148093, -0.1103571, 0.2078431, 0, 1, 1,
0.5311715, 1.764868, 0.6189507, 0.2117647, 0, 1, 1,
0.5350296, 1.259398, 0.3893993, 0.2196078, 0, 1, 1,
0.5389426, 0.1575029, 2.537602, 0.2235294, 0, 1, 1,
0.539851, -0.1830486, 0.9554155, 0.2313726, 0, 1, 1,
0.5430178, 0.1541307, -0.09670287, 0.2352941, 0, 1, 1,
0.5477791, 1.41503, -0.8448582, 0.2431373, 0, 1, 1,
0.5497764, 0.1558866, 1.176803, 0.2470588, 0, 1, 1,
0.5514796, 0.7685444, 0.7193593, 0.254902, 0, 1, 1,
0.558731, -0.3002568, 3.313041, 0.2588235, 0, 1, 1,
0.5594777, -1.214048, 4.442786, 0.2666667, 0, 1, 1,
0.5613815, -0.06161245, 3.01658, 0.2705882, 0, 1, 1,
0.566789, 0.007534433, 3.098602, 0.2784314, 0, 1, 1,
0.5691757, -0.1258419, 1.192667, 0.282353, 0, 1, 1,
0.5708897, -0.3308126, 1.744397, 0.2901961, 0, 1, 1,
0.5723938, -0.02179448, 2.094287, 0.2941177, 0, 1, 1,
0.5741672, -1.313575, 2.550249, 0.3019608, 0, 1, 1,
0.5750246, -1.99861, 1.81642, 0.3098039, 0, 1, 1,
0.576789, -0.009605604, 3.342943, 0.3137255, 0, 1, 1,
0.5796879, -0.9746497, 0.085184, 0.3215686, 0, 1, 1,
0.5884399, -0.9392546, 2.19793, 0.3254902, 0, 1, 1,
0.5909943, -2.621918, 3.818538, 0.3333333, 0, 1, 1,
0.5914495, 0.5138376, 2.708416, 0.3372549, 0, 1, 1,
0.5935505, 1.110295, -0.2359207, 0.345098, 0, 1, 1,
0.5955777, -0.3166492, 3.737741, 0.3490196, 0, 1, 1,
0.5962369, 0.2356316, 0.2989476, 0.3568628, 0, 1, 1,
0.5967537, 0.9896999, -0.356874, 0.3607843, 0, 1, 1,
0.5998057, -0.9959347, 3.298146, 0.3686275, 0, 1, 1,
0.6055164, 0.5896958, -1.038123, 0.372549, 0, 1, 1,
0.6057233, 1.488635, -0.2448365, 0.3803922, 0, 1, 1,
0.6117618, 0.8742191, -0.9337384, 0.3843137, 0, 1, 1,
0.6126975, 1.447514, -0.6454973, 0.3921569, 0, 1, 1,
0.613264, 0.483389, 2.437767, 0.3960784, 0, 1, 1,
0.6181408, 0.006492562, 1.231776, 0.4039216, 0, 1, 1,
0.6204079, 0.1119766, 1.05637, 0.4117647, 0, 1, 1,
0.6289299, 0.9038872, 0.3767063, 0.4156863, 0, 1, 1,
0.6292012, 1.540258, 1.38494, 0.4235294, 0, 1, 1,
0.6340945, 0.1036232, 2.057515, 0.427451, 0, 1, 1,
0.6350013, 0.05376711, 0.5662315, 0.4352941, 0, 1, 1,
0.6384962, 0.499431, 1.983711, 0.4392157, 0, 1, 1,
0.6409861, -0.2618181, 0.08815768, 0.4470588, 0, 1, 1,
0.6410922, 0.3437257, 0.6316788, 0.4509804, 0, 1, 1,
0.6419612, 2.555646, 1.769437, 0.4588235, 0, 1, 1,
0.6420062, 0.646392, 2.499543, 0.4627451, 0, 1, 1,
0.6468665, 1.126187, 1.524665, 0.4705882, 0, 1, 1,
0.6482649, -0.8170358, 4.586886, 0.4745098, 0, 1, 1,
0.6506104, 0.90138, -0.3559865, 0.4823529, 0, 1, 1,
0.6506848, 0.1389645, 1.301169, 0.4862745, 0, 1, 1,
0.6511577, 0.3116317, 2.066825, 0.4941176, 0, 1, 1,
0.6528491, 0.04392866, 0.9153312, 0.5019608, 0, 1, 1,
0.6597154, -0.4313361, 2.957856, 0.5058824, 0, 1, 1,
0.6605093, 0.2923441, 2.011937, 0.5137255, 0, 1, 1,
0.6619337, -2.211001, 4.329386, 0.5176471, 0, 1, 1,
0.6640186, -0.71534, 2.739219, 0.5254902, 0, 1, 1,
0.6660309, -0.9207298, 4.375958, 0.5294118, 0, 1, 1,
0.6672118, -0.6213632, 2.277889, 0.5372549, 0, 1, 1,
0.6696116, -1.195652, 2.686104, 0.5411765, 0, 1, 1,
0.6705565, -0.2619122, 0.8462647, 0.5490196, 0, 1, 1,
0.6735256, -0.4429463, 2.084788, 0.5529412, 0, 1, 1,
0.6791905, 0.03313811, 1.493197, 0.5607843, 0, 1, 1,
0.6801492, 0.2663298, 0.4445639, 0.5647059, 0, 1, 1,
0.6820464, -1.315378, 4.026592, 0.572549, 0, 1, 1,
0.6841378, -0.6715223, 2.175972, 0.5764706, 0, 1, 1,
0.6852559, -0.9588899, 1.736377, 0.5843138, 0, 1, 1,
0.6881299, 2.052781, 0.5511181, 0.5882353, 0, 1, 1,
0.6995273, 1.44419, 0.03930856, 0.5960785, 0, 1, 1,
0.7042593, 1.427685, 0.8296456, 0.6039216, 0, 1, 1,
0.7091531, 0.3912669, 1.531256, 0.6078432, 0, 1, 1,
0.7129501, -0.8890901, 2.616214, 0.6156863, 0, 1, 1,
0.7145216, -0.6701782, 4.655343, 0.6196079, 0, 1, 1,
0.7162842, -1.933054, 1.825783, 0.627451, 0, 1, 1,
0.7169853, -1.148644, 1.268168, 0.6313726, 0, 1, 1,
0.7203931, -0.3710079, 2.402368, 0.6392157, 0, 1, 1,
0.7204626, 0.4160119, -0.6895086, 0.6431373, 0, 1, 1,
0.7208062, 0.4301994, 2.125013, 0.6509804, 0, 1, 1,
0.7299317, 0.898044, -1.547779, 0.654902, 0, 1, 1,
0.7342717, -0.5066961, 2.047719, 0.6627451, 0, 1, 1,
0.7359876, 1.10571, 0.7836803, 0.6666667, 0, 1, 1,
0.7370872, 0.1354043, 1.752896, 0.6745098, 0, 1, 1,
0.7422367, -0.5224119, 1.767971, 0.6784314, 0, 1, 1,
0.7427132, 1.908589, -0.6207368, 0.6862745, 0, 1, 1,
0.7444243, -0.2429403, 1.143989, 0.6901961, 0, 1, 1,
0.7478499, 0.4455197, 0.2924307, 0.6980392, 0, 1, 1,
0.756122, 0.3217768, 3.836722, 0.7058824, 0, 1, 1,
0.7635907, 0.8058468, 1.387676, 0.7098039, 0, 1, 1,
0.766077, -0.06165827, -0.8891261, 0.7176471, 0, 1, 1,
0.7664467, -0.5610953, 0.9465059, 0.7215686, 0, 1, 1,
0.7743674, 0.5172581, 1.906888, 0.7294118, 0, 1, 1,
0.7770865, 1.692847, -0.196448, 0.7333333, 0, 1, 1,
0.7889354, -1.158984, 2.877529, 0.7411765, 0, 1, 1,
0.7897703, 0.2371189, 2.440797, 0.7450981, 0, 1, 1,
0.7970046, -1.421945, 3.302741, 0.7529412, 0, 1, 1,
0.8040696, 0.8347076, 2.115938, 0.7568628, 0, 1, 1,
0.8071907, -0.8533219, 0.8390664, 0.7647059, 0, 1, 1,
0.8072243, 0.9555245, 0.5972257, 0.7686275, 0, 1, 1,
0.8087895, 0.3025432, 1.460054, 0.7764706, 0, 1, 1,
0.8101687, -0.490589, 4.710573, 0.7803922, 0, 1, 1,
0.8113695, -0.3531354, 1.818284, 0.7882353, 0, 1, 1,
0.8238307, -0.2115481, 0.604801, 0.7921569, 0, 1, 1,
0.8282125, -0.6148422, 0.4781893, 0.8, 0, 1, 1,
0.8456236, -0.5614198, 0.6808473, 0.8078431, 0, 1, 1,
0.8469002, 0.721932, 1.659897, 0.8117647, 0, 1, 1,
0.8480806, 0.4661304, 2.477811, 0.8196079, 0, 1, 1,
0.8482586, -0.402315, 0.9592444, 0.8235294, 0, 1, 1,
0.8511408, 1.430916, 0.4326253, 0.8313726, 0, 1, 1,
0.8512045, 0.6790696, 1.923657, 0.8352941, 0, 1, 1,
0.8546069, -0.7425016, 3.104469, 0.8431373, 0, 1, 1,
0.855583, -0.3447915, 1.876487, 0.8470588, 0, 1, 1,
0.8563785, -0.7091068, 2.376599, 0.854902, 0, 1, 1,
0.8630533, 0.7014118, 1.792199, 0.8588235, 0, 1, 1,
0.8699953, 1.601444, 1.644401, 0.8666667, 0, 1, 1,
0.8736923, -2.034543, 2.757623, 0.8705882, 0, 1, 1,
0.8802288, 1.298948, 1.087814, 0.8784314, 0, 1, 1,
0.8802486, 1.847565, 1.488526, 0.8823529, 0, 1, 1,
0.8826908, 0.04526369, 1.781201, 0.8901961, 0, 1, 1,
0.8876737, -0.7870824, 1.994889, 0.8941177, 0, 1, 1,
0.8981318, 1.787755, 1.215962, 0.9019608, 0, 1, 1,
0.9010122, -0.1038183, 1.8931, 0.9098039, 0, 1, 1,
0.901868, -0.3810313, 2.178819, 0.9137255, 0, 1, 1,
0.9039732, 0.599247, 1.247784, 0.9215686, 0, 1, 1,
0.9044417, -0.2406345, 1.384815, 0.9254902, 0, 1, 1,
0.9062858, 0.5206448, -0.671531, 0.9333333, 0, 1, 1,
0.9151427, 0.04077633, 1.983714, 0.9372549, 0, 1, 1,
0.9184531, 0.01749357, 0.6464196, 0.945098, 0, 1, 1,
0.919119, -0.8887054, 2.59323, 0.9490196, 0, 1, 1,
0.9268364, 0.6536445, 0.2064623, 0.9568627, 0, 1, 1,
0.9270049, 0.5619485, 0.1011482, 0.9607843, 0, 1, 1,
0.9303606, 1.058993, 1.276049, 0.9686275, 0, 1, 1,
0.9344999, 0.7508653, 1.618528, 0.972549, 0, 1, 1,
0.9400227, 0.7650341, 1.303892, 0.9803922, 0, 1, 1,
0.9431918, -0.1043727, 3.242434, 0.9843137, 0, 1, 1,
0.9461973, 0.06354688, 2.502034, 0.9921569, 0, 1, 1,
0.9498973, -1.467924, 2.0327, 0.9960784, 0, 1, 1,
0.9513176, 0.6097676, 0.2464015, 1, 0, 0.9960784, 1,
0.9546212, 0.8588569, 0.9323092, 1, 0, 0.9882353, 1,
0.956581, -0.6945374, 2.233273, 1, 0, 0.9843137, 1,
0.9593775, 1.495659, 1.657574, 1, 0, 0.9764706, 1,
0.9655681, -0.279941, 0.7750646, 1, 0, 0.972549, 1,
0.9752344, -0.08029311, 1.804743, 1, 0, 0.9647059, 1,
0.9763839, -1.095015, 1.560841, 1, 0, 0.9607843, 1,
0.9804028, -1.131939, 6.610177, 1, 0, 0.9529412, 1,
0.9946312, -0.623412, 3.402848, 1, 0, 0.9490196, 1,
1.002572, 0.4600316, 2.101854, 1, 0, 0.9411765, 1,
1.004474, 0.1112784, 1.144816, 1, 0, 0.9372549, 1,
1.004686, -0.5969721, 2.585022, 1, 0, 0.9294118, 1,
1.005958, -0.1064948, 2.292562, 1, 0, 0.9254902, 1,
1.006081, -0.1897458, 2.567104, 1, 0, 0.9176471, 1,
1.009417, -0.1566658, 2.652371, 1, 0, 0.9137255, 1,
1.01141, -0.8413997, 3.654485, 1, 0, 0.9058824, 1,
1.017459, -0.5426279, 2.489499, 1, 0, 0.9019608, 1,
1.021051, 1.901298, -1.322737, 1, 0, 0.8941177, 1,
1.025089, 1.520013, 1.610484, 1, 0, 0.8862745, 1,
1.025877, 0.8397307, 0.7175042, 1, 0, 0.8823529, 1,
1.026415, -0.08004806, 1.91538, 1, 0, 0.8745098, 1,
1.027589, 0.8226654, 1.151608, 1, 0, 0.8705882, 1,
1.029557, -1.251866, 2.389532, 1, 0, 0.8627451, 1,
1.034978, -0.2468897, 1.834712, 1, 0, 0.8588235, 1,
1.035538, -0.07714758, 1.467543, 1, 0, 0.8509804, 1,
1.035837, -1.189081, 2.564109, 1, 0, 0.8470588, 1,
1.039564, -0.1457207, 3.713846, 1, 0, 0.8392157, 1,
1.044809, 0.06162157, 2.327881, 1, 0, 0.8352941, 1,
1.046685, -0.2492872, 3.141906, 1, 0, 0.827451, 1,
1.047302, -0.245505, 2.030798, 1, 0, 0.8235294, 1,
1.050317, -0.5128465, 3.226743, 1, 0, 0.8156863, 1,
1.055279, 0.2143021, 0.9916645, 1, 0, 0.8117647, 1,
1.055956, 0.2131667, 0.01105678, 1, 0, 0.8039216, 1,
1.061682, 1.21426, 1.727475, 1, 0, 0.7960784, 1,
1.063096, -0.5936708, 1.391374, 1, 0, 0.7921569, 1,
1.087204, -0.6159201, 3.128906, 1, 0, 0.7843137, 1,
1.102734, 0.7360298, 0.1143512, 1, 0, 0.7803922, 1,
1.108907, -1.348207, 1.273043, 1, 0, 0.772549, 1,
1.112448, 0.5360811, 1.174712, 1, 0, 0.7686275, 1,
1.116686, -1.129303, 1.529637, 1, 0, 0.7607843, 1,
1.117562, 0.1632456, 1.391126, 1, 0, 0.7568628, 1,
1.120311, 0.07360743, 0.6871616, 1, 0, 0.7490196, 1,
1.128125, -1.122767, 2.174671, 1, 0, 0.7450981, 1,
1.135091, -1.289585, 1.055385, 1, 0, 0.7372549, 1,
1.135627, 2.200741, -0.182971, 1, 0, 0.7333333, 1,
1.143932, -0.9377171, 1.187008, 1, 0, 0.7254902, 1,
1.147736, -0.729711, 3.199613, 1, 0, 0.7215686, 1,
1.148243, 0.524584, 2.773421, 1, 0, 0.7137255, 1,
1.155277, 1.057213, 1.163573, 1, 0, 0.7098039, 1,
1.155558, 0.3959685, -0.3674915, 1, 0, 0.7019608, 1,
1.157333, -0.1364062, 1.898094, 1, 0, 0.6941177, 1,
1.163215, -1.400643, 3.063293, 1, 0, 0.6901961, 1,
1.167989, -1.120299, 1.794558, 1, 0, 0.682353, 1,
1.174542, 1.020923, 0.758033, 1, 0, 0.6784314, 1,
1.177357, -0.378731, 3.013193, 1, 0, 0.6705883, 1,
1.178449, -1.115805, 1.58284, 1, 0, 0.6666667, 1,
1.178524, 3.119617, -1.322924, 1, 0, 0.6588235, 1,
1.183666, 0.5363759, 0.3900359, 1, 0, 0.654902, 1,
1.195261, 1.904901, 0.4492098, 1, 0, 0.6470588, 1,
1.195441, -0.2237054, 1.211935, 1, 0, 0.6431373, 1,
1.195676, 0.4803665, 0.1981662, 1, 0, 0.6352941, 1,
1.198068, -0.2421984, 0.3725542, 1, 0, 0.6313726, 1,
1.198756, 0.7438976, 0.5115992, 1, 0, 0.6235294, 1,
1.213376, -0.7615466, 1.062873, 1, 0, 0.6196079, 1,
1.213632, 0.6758553, 2.062461, 1, 0, 0.6117647, 1,
1.225442, -0.002580037, 2.274296, 1, 0, 0.6078432, 1,
1.228538, -0.2807499, 0.4135792, 1, 0, 0.6, 1,
1.232731, -0.29223, 1.161061, 1, 0, 0.5921569, 1,
1.235807, 0.5090958, 2.005746, 1, 0, 0.5882353, 1,
1.239736, -1.193776, 2.527154, 1, 0, 0.5803922, 1,
1.241849, 0.938496, 1.351308, 1, 0, 0.5764706, 1,
1.244998, -1.373816, 0.8195488, 1, 0, 0.5686275, 1,
1.252704, 0.2193603, 2.189411, 1, 0, 0.5647059, 1,
1.259917, -2.679218, 2.369279, 1, 0, 0.5568628, 1,
1.272641, -0.7890606, 2.919439, 1, 0, 0.5529412, 1,
1.274984, -0.1085781, 1.769164, 1, 0, 0.5450981, 1,
1.280576, -2.933251, 1.477988, 1, 0, 0.5411765, 1,
1.286266, -0.2722098, 1.615867, 1, 0, 0.5333334, 1,
1.287062, -0.05703237, -0.3499888, 1, 0, 0.5294118, 1,
1.289613, 1.044633, -0.9522939, 1, 0, 0.5215687, 1,
1.293169, -0.4817224, 2.191031, 1, 0, 0.5176471, 1,
1.294511, -1.031257, 1.702492, 1, 0, 0.509804, 1,
1.30343, 0.4090971, 2.01745, 1, 0, 0.5058824, 1,
1.304604, -1.409734, 1.854157, 1, 0, 0.4980392, 1,
1.306103, -0.5982854, 1.761102, 1, 0, 0.4901961, 1,
1.309235, -0.6306949, 2.244779, 1, 0, 0.4862745, 1,
1.316205, 0.1812358, 0.5049494, 1, 0, 0.4784314, 1,
1.345312, -1.31188, 1.154386, 1, 0, 0.4745098, 1,
1.351235, 0.3484503, 1.102665, 1, 0, 0.4666667, 1,
1.35677, -0.6531315, 1.897282, 1, 0, 0.4627451, 1,
1.361554, 0.2992988, 1.33903, 1, 0, 0.454902, 1,
1.363905, -0.6921248, 2.863961, 1, 0, 0.4509804, 1,
1.366478, -0.779372, 1.120614, 1, 0, 0.4431373, 1,
1.369149, 1.92668, 1.019444, 1, 0, 0.4392157, 1,
1.401015, 1.60798, -0.138376, 1, 0, 0.4313726, 1,
1.40429, 0.01982619, 1.398718, 1, 0, 0.427451, 1,
1.423152, 0.0925702, 1.929591, 1, 0, 0.4196078, 1,
1.45545, 0.2127624, 1.85829, 1, 0, 0.4156863, 1,
1.460307, 0.8577534, 0.8124664, 1, 0, 0.4078431, 1,
1.481203, 0.4875049, 2.23674, 1, 0, 0.4039216, 1,
1.499187, -0.3140046, 1.507987, 1, 0, 0.3960784, 1,
1.508304, 0.7234234, 1.791418, 1, 0, 0.3882353, 1,
1.510471, 0.7187105, -0.04522648, 1, 0, 0.3843137, 1,
1.514516, 0.5459361, 2.09739, 1, 0, 0.3764706, 1,
1.516186, -0.2692513, 1.351314, 1, 0, 0.372549, 1,
1.518514, -0.05671633, 2.128368, 1, 0, 0.3647059, 1,
1.522494, -0.3878991, 1.5936, 1, 0, 0.3607843, 1,
1.538681, 0.5505974, 1.031447, 1, 0, 0.3529412, 1,
1.546857, 0.3456857, 1.995971, 1, 0, 0.3490196, 1,
1.560185, -1.530419, 2.136628, 1, 0, 0.3411765, 1,
1.560873, 0.5958638, 1.207615, 1, 0, 0.3372549, 1,
1.567073, 1.408127, 1.032595, 1, 0, 0.3294118, 1,
1.574609, 0.6767172, 3.127315, 1, 0, 0.3254902, 1,
1.57896, 1.433263, 2.189711, 1, 0, 0.3176471, 1,
1.594427, 0.07413013, 1.882971, 1, 0, 0.3137255, 1,
1.596297, -2.534389, 3.025745, 1, 0, 0.3058824, 1,
1.606334, -1.329923, 2.749516, 1, 0, 0.2980392, 1,
1.616086, 0.4299842, 1.552484, 1, 0, 0.2941177, 1,
1.627458, -0.3488515, 2.204394, 1, 0, 0.2862745, 1,
1.632208, -1.342936, 2.145924, 1, 0, 0.282353, 1,
1.659516, 1.801087, -0.7889059, 1, 0, 0.2745098, 1,
1.670402, -0.6340624, 2.54007, 1, 0, 0.2705882, 1,
1.672388, -0.5571702, 2.730021, 1, 0, 0.2627451, 1,
1.688042, 0.1002192, 1.285076, 1, 0, 0.2588235, 1,
1.697946, 0.5676638, 2.340253, 1, 0, 0.2509804, 1,
1.711618, -1.183361, 1.855168, 1, 0, 0.2470588, 1,
1.712757, 0.6797998, 2.11355, 1, 0, 0.2392157, 1,
1.732618, 0.9872866, 1.617607, 1, 0, 0.2352941, 1,
1.736186, -0.2004156, 2.015777, 1, 0, 0.227451, 1,
1.739182, -0.3576889, 1.392217, 1, 0, 0.2235294, 1,
1.74017, 1.423027, 0.2448753, 1, 0, 0.2156863, 1,
1.771879, -0.4134784, 1.762645, 1, 0, 0.2117647, 1,
1.797884, -0.2536258, 1.224589, 1, 0, 0.2039216, 1,
1.801702, 0.2398106, 0.2712524, 1, 0, 0.1960784, 1,
1.818178, -1.360484, 2.33307, 1, 0, 0.1921569, 1,
1.845458, 0.05107031, -0.09359473, 1, 0, 0.1843137, 1,
1.861002, -0.8541119, 1.505184, 1, 0, 0.1803922, 1,
1.869507, 1.468945, 0.808545, 1, 0, 0.172549, 1,
1.877541, -0.2447291, 1.274814, 1, 0, 0.1686275, 1,
1.88993, 0.7549512, 0.5134522, 1, 0, 0.1607843, 1,
1.919395, -0.4886363, 1.477374, 1, 0, 0.1568628, 1,
1.929897, 1.748568, 0.4235269, 1, 0, 0.1490196, 1,
1.939482, -0.7975835, 0.6788565, 1, 0, 0.145098, 1,
1.969827, -0.7615355, 2.385276, 1, 0, 0.1372549, 1,
1.97798, 0.104905, 0.1380365, 1, 0, 0.1333333, 1,
1.999623, -0.4107624, 2.823132, 1, 0, 0.1254902, 1,
2.011985, 1.334487, 2.366049, 1, 0, 0.1215686, 1,
2.01407, -0.01161346, 2.285875, 1, 0, 0.1137255, 1,
2.052519, 0.7528955, 1.329231, 1, 0, 0.1098039, 1,
2.071099, 0.2881005, 1.19471, 1, 0, 0.1019608, 1,
2.085589, 1.832219, 0.7367616, 1, 0, 0.09411765, 1,
2.116592, -1.354052, 1.595759, 1, 0, 0.09019608, 1,
2.124355, 0.1850872, 2.207501, 1, 0, 0.08235294, 1,
2.12553, -1.678176, 1.30161, 1, 0, 0.07843138, 1,
2.126374, 2.005489, -0.2911702, 1, 0, 0.07058824, 1,
2.137956, 1.6733, -0.3376477, 1, 0, 0.06666667, 1,
2.147208, -1.621467, 1.839453, 1, 0, 0.05882353, 1,
2.166257, -1.103689, 1.174342, 1, 0, 0.05490196, 1,
2.178114, -1.498364, 1.865888, 1, 0, 0.04705882, 1,
2.210442, -0.3467593, 2.865658, 1, 0, 0.04313726, 1,
2.230965, 0.8404931, -0.8848479, 1, 0, 0.03529412, 1,
2.256329, -0.5737866, 2.169081, 1, 0, 0.03137255, 1,
2.449798, -0.9055908, 0.7825745, 1, 0, 0.02352941, 1,
2.451983, -1.206171, 2.857616, 1, 0, 0.01960784, 1,
2.497265, -1.507467, 3.847894, 1, 0, 0.01176471, 1,
2.792121, -0.3258571, 0.2679998, 1, 0, 0.007843138, 1
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
-0.3180714, -3.959212, -6.972231, 0, -0.5, 0.5, 0.5,
-0.3180714, -3.959212, -6.972231, 1, -0.5, 0.5, 0.5,
-0.3180714, -3.959212, -6.972231, 1, 1.5, 0.5, 0.5,
-0.3180714, -3.959212, -6.972231, 0, 1.5, 0.5, 0.5
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
-4.482619, 0.09318304, -6.972231, 0, -0.5, 0.5, 0.5,
-4.482619, 0.09318304, -6.972231, 1, -0.5, 0.5, 0.5,
-4.482619, 0.09318304, -6.972231, 1, 1.5, 0.5, 0.5,
-4.482619, 0.09318304, -6.972231, 0, 1.5, 0.5, 0.5
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
-4.482619, -3.959212, 0.8032477, 0, -0.5, 0.5, 0.5,
-4.482619, -3.959212, 0.8032477, 1, -0.5, 0.5, 0.5,
-4.482619, -3.959212, 0.8032477, 1, 1.5, 0.5, 0.5,
-4.482619, -3.959212, 0.8032477, 0, 1.5, 0.5, 0.5
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
-3, -3.024044, -5.177889,
2, -3.024044, -5.177889,
-3, -3.024044, -5.177889,
-3, -3.179905, -5.476946,
-2, -3.024044, -5.177889,
-2, -3.179905, -5.476946,
-1, -3.024044, -5.177889,
-1, -3.179905, -5.476946,
0, -3.024044, -5.177889,
0, -3.179905, -5.476946,
1, -3.024044, -5.177889,
1, -3.179905, -5.476946,
2, -3.024044, -5.177889,
2, -3.179905, -5.476946
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
-3, -3.491628, -6.07506, 0, -0.5, 0.5, 0.5,
-3, -3.491628, -6.07506, 1, -0.5, 0.5, 0.5,
-3, -3.491628, -6.07506, 1, 1.5, 0.5, 0.5,
-3, -3.491628, -6.07506, 0, 1.5, 0.5, 0.5,
-2, -3.491628, -6.07506, 0, -0.5, 0.5, 0.5,
-2, -3.491628, -6.07506, 1, -0.5, 0.5, 0.5,
-2, -3.491628, -6.07506, 1, 1.5, 0.5, 0.5,
-2, -3.491628, -6.07506, 0, 1.5, 0.5, 0.5,
-1, -3.491628, -6.07506, 0, -0.5, 0.5, 0.5,
-1, -3.491628, -6.07506, 1, -0.5, 0.5, 0.5,
-1, -3.491628, -6.07506, 1, 1.5, 0.5, 0.5,
-1, -3.491628, -6.07506, 0, 1.5, 0.5, 0.5,
0, -3.491628, -6.07506, 0, -0.5, 0.5, 0.5,
0, -3.491628, -6.07506, 1, -0.5, 0.5, 0.5,
0, -3.491628, -6.07506, 1, 1.5, 0.5, 0.5,
0, -3.491628, -6.07506, 0, 1.5, 0.5, 0.5,
1, -3.491628, -6.07506, 0, -0.5, 0.5, 0.5,
1, -3.491628, -6.07506, 1, -0.5, 0.5, 0.5,
1, -3.491628, -6.07506, 1, 1.5, 0.5, 0.5,
1, -3.491628, -6.07506, 0, 1.5, 0.5, 0.5,
2, -3.491628, -6.07506, 0, -0.5, 0.5, 0.5,
2, -3.491628, -6.07506, 1, -0.5, 0.5, 0.5,
2, -3.491628, -6.07506, 1, 1.5, 0.5, 0.5,
2, -3.491628, -6.07506, 0, 1.5, 0.5, 0.5
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
-3.52157, -2, -5.177889,
-3.52157, 3, -5.177889,
-3.52157, -2, -5.177889,
-3.681745, -2, -5.476946,
-3.52157, -1, -5.177889,
-3.681745, -1, -5.476946,
-3.52157, 0, -5.177889,
-3.681745, 0, -5.476946,
-3.52157, 1, -5.177889,
-3.681745, 1, -5.476946,
-3.52157, 2, -5.177889,
-3.681745, 2, -5.476946,
-3.52157, 3, -5.177889,
-3.681745, 3, -5.476946
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
"-2",
"-1",
"0",
"1",
"2",
"3"
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
-4.002095, -2, -6.07506, 0, -0.5, 0.5, 0.5,
-4.002095, -2, -6.07506, 1, -0.5, 0.5, 0.5,
-4.002095, -2, -6.07506, 1, 1.5, 0.5, 0.5,
-4.002095, -2, -6.07506, 0, 1.5, 0.5, 0.5,
-4.002095, -1, -6.07506, 0, -0.5, 0.5, 0.5,
-4.002095, -1, -6.07506, 1, -0.5, 0.5, 0.5,
-4.002095, -1, -6.07506, 1, 1.5, 0.5, 0.5,
-4.002095, -1, -6.07506, 0, 1.5, 0.5, 0.5,
-4.002095, 0, -6.07506, 0, -0.5, 0.5, 0.5,
-4.002095, 0, -6.07506, 1, -0.5, 0.5, 0.5,
-4.002095, 0, -6.07506, 1, 1.5, 0.5, 0.5,
-4.002095, 0, -6.07506, 0, 1.5, 0.5, 0.5,
-4.002095, 1, -6.07506, 0, -0.5, 0.5, 0.5,
-4.002095, 1, -6.07506, 1, -0.5, 0.5, 0.5,
-4.002095, 1, -6.07506, 1, 1.5, 0.5, 0.5,
-4.002095, 1, -6.07506, 0, 1.5, 0.5, 0.5,
-4.002095, 2, -6.07506, 0, -0.5, 0.5, 0.5,
-4.002095, 2, -6.07506, 1, -0.5, 0.5, 0.5,
-4.002095, 2, -6.07506, 1, 1.5, 0.5, 0.5,
-4.002095, 2, -6.07506, 0, 1.5, 0.5, 0.5,
-4.002095, 3, -6.07506, 0, -0.5, 0.5, 0.5,
-4.002095, 3, -6.07506, 1, -0.5, 0.5, 0.5,
-4.002095, 3, -6.07506, 1, 1.5, 0.5, 0.5,
-4.002095, 3, -6.07506, 0, 1.5, 0.5, 0.5
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
-3.52157, -3.024044, -4,
-3.52157, -3.024044, 6,
-3.52157, -3.024044, -4,
-3.681745, -3.179905, -4,
-3.52157, -3.024044, -2,
-3.681745, -3.179905, -2,
-3.52157, -3.024044, 0,
-3.681745, -3.179905, 0,
-3.52157, -3.024044, 2,
-3.681745, -3.179905, 2,
-3.52157, -3.024044, 4,
-3.681745, -3.179905, 4,
-3.52157, -3.024044, 6,
-3.681745, -3.179905, 6
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
-4.002095, -3.491628, -4, 0, -0.5, 0.5, 0.5,
-4.002095, -3.491628, -4, 1, -0.5, 0.5, 0.5,
-4.002095, -3.491628, -4, 1, 1.5, 0.5, 0.5,
-4.002095, -3.491628, -4, 0, 1.5, 0.5, 0.5,
-4.002095, -3.491628, -2, 0, -0.5, 0.5, 0.5,
-4.002095, -3.491628, -2, 1, -0.5, 0.5, 0.5,
-4.002095, -3.491628, -2, 1, 1.5, 0.5, 0.5,
-4.002095, -3.491628, -2, 0, 1.5, 0.5, 0.5,
-4.002095, -3.491628, 0, 0, -0.5, 0.5, 0.5,
-4.002095, -3.491628, 0, 1, -0.5, 0.5, 0.5,
-4.002095, -3.491628, 0, 1, 1.5, 0.5, 0.5,
-4.002095, -3.491628, 0, 0, 1.5, 0.5, 0.5,
-4.002095, -3.491628, 2, 0, -0.5, 0.5, 0.5,
-4.002095, -3.491628, 2, 1, -0.5, 0.5, 0.5,
-4.002095, -3.491628, 2, 1, 1.5, 0.5, 0.5,
-4.002095, -3.491628, 2, 0, 1.5, 0.5, 0.5,
-4.002095, -3.491628, 4, 0, -0.5, 0.5, 0.5,
-4.002095, -3.491628, 4, 1, -0.5, 0.5, 0.5,
-4.002095, -3.491628, 4, 1, 1.5, 0.5, 0.5,
-4.002095, -3.491628, 4, 0, 1.5, 0.5, 0.5,
-4.002095, -3.491628, 6, 0, -0.5, 0.5, 0.5,
-4.002095, -3.491628, 6, 1, -0.5, 0.5, 0.5,
-4.002095, -3.491628, 6, 1, 1.5, 0.5, 0.5,
-4.002095, -3.491628, 6, 0, 1.5, 0.5, 0.5
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
-3.52157, -3.024044, -5.177889,
-3.52157, 3.21041, -5.177889,
-3.52157, -3.024044, 6.784385,
-3.52157, 3.21041, 6.784385,
-3.52157, -3.024044, -5.177889,
-3.52157, -3.024044, 6.784385,
-3.52157, 3.21041, -5.177889,
-3.52157, 3.21041, 6.784385,
-3.52157, -3.024044, -5.177889,
2.885427, -3.024044, -5.177889,
-3.52157, -3.024044, 6.784385,
2.885427, -3.024044, 6.784385,
-3.52157, 3.21041, -5.177889,
2.885427, 3.21041, -5.177889,
-3.52157, 3.21041, 6.784385,
2.885427, 3.21041, 6.784385,
2.885427, -3.024044, -5.177889,
2.885427, 3.21041, -5.177889,
2.885427, -3.024044, 6.784385,
2.885427, 3.21041, 6.784385,
2.885427, -3.024044, -5.177889,
2.885427, -3.024044, 6.784385,
2.885427, 3.21041, -5.177889,
2.885427, 3.21041, 6.784385
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
var radius = 7.974282;
var distance = 35.47848;
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
mvMatrix.translate( 0.3180714, -0.09318304, -0.8032477 );
mvMatrix.scale( 1.345708, 1.382952, 0.7207617 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.47848);
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
Neburon<-read.table("Neburon.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Neburon$V2
```

```
## Error in eval(expr, envir, enclos): object 'Neburon' not found
```

```r
y<-Neburon$V3
```

```
## Error in eval(expr, envir, enclos): object 'Neburon' not found
```

```r
z<-Neburon$V4
```

```
## Error in eval(expr, envir, enclos): object 'Neburon' not found
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
-3.428264, -1.295345, -2.227368, 0, 0, 1, 1, 1,
-3.264157, -0.9223784, -1.797866, 1, 0, 0, 1, 1,
-2.949815, 1.779942, -1.308794, 1, 0, 0, 1, 1,
-2.791352, -0.07984609, -1.848844, 1, 0, 0, 1, 1,
-2.738198, -0.8194867, -1.786958, 1, 0, 0, 1, 1,
-2.684076, -0.2694449, -0.7879887, 1, 0, 0, 1, 1,
-2.373167, 1.339668, -1.210677, 0, 0, 0, 1, 1,
-2.279979, 0.3748536, -3.253713, 0, 0, 0, 1, 1,
-2.273007, -1.538136, -2.165924, 0, 0, 0, 1, 1,
-2.26136, 0.008140329, -0.6758119, 0, 0, 0, 1, 1,
-2.246644, 0.6973637, -0.4243678, 0, 0, 0, 1, 1,
-2.223582, 0.0992422, -2.073757, 0, 0, 0, 1, 1,
-2.197721, 0.2220013, -1.694539, 0, 0, 0, 1, 1,
-2.16258, 0.1110232, -1.710705, 1, 1, 1, 1, 1,
-2.157604, -1.811489, -1.908406, 1, 1, 1, 1, 1,
-2.152001, -1.106768, -1.573694, 1, 1, 1, 1, 1,
-2.143806, 0.4817145, -0.6022674, 1, 1, 1, 1, 1,
-2.111558, 0.1585568, -3.342976, 1, 1, 1, 1, 1,
-2.093576, -1.29519, -1.670643, 1, 1, 1, 1, 1,
-2.088045, 0.38535, -0.2604245, 1, 1, 1, 1, 1,
-2.046944, 1.672906, 0.3693466, 1, 1, 1, 1, 1,
-2.022211, -1.108083, -2.616163, 1, 1, 1, 1, 1,
-1.928913, -0.1492666, -0.6927072, 1, 1, 1, 1, 1,
-1.92719, 0.06057113, -0.2367589, 1, 1, 1, 1, 1,
-1.896087, 1.26175, 0.1280377, 1, 1, 1, 1, 1,
-1.883951, -0.09038901, -2.457808, 1, 1, 1, 1, 1,
-1.876609, 0.2459363, 0.09206273, 1, 1, 1, 1, 1,
-1.854286, -0.1024771, -0.9298214, 1, 1, 1, 1, 1,
-1.850361, 1.343862, -1.783901, 0, 0, 1, 1, 1,
-1.839722, 0.5735084, -0.2253836, 1, 0, 0, 1, 1,
-1.839692, 1.284662, -2.123827, 1, 0, 0, 1, 1,
-1.832919, -0.5437502, -2.474738, 1, 0, 0, 1, 1,
-1.824402, 1.085257, -1.064196, 1, 0, 0, 1, 1,
-1.820281, 0.7799044, -1.192959, 1, 0, 0, 1, 1,
-1.808784, -0.766692, -1.569296, 0, 0, 0, 1, 1,
-1.806314, 0.344511, -0.7035373, 0, 0, 0, 1, 1,
-1.804568, -2.04126, -2.996785, 0, 0, 0, 1, 1,
-1.798635, -1.278781, -2.279964, 0, 0, 0, 1, 1,
-1.773983, 1.539351, -1.564543, 0, 0, 0, 1, 1,
-1.772189, -0.2559154, -2.523017, 0, 0, 0, 1, 1,
-1.727924, -0.003012978, -1.279277, 0, 0, 0, 1, 1,
-1.721651, 2.269169, -0.5497062, 1, 1, 1, 1, 1,
-1.687418, -0.3990282, -2.102272, 1, 1, 1, 1, 1,
-1.68225, 1.143821, -2.773241, 1, 1, 1, 1, 1,
-1.671998, 0.6440179, -0.4549616, 1, 1, 1, 1, 1,
-1.668887, 0.9581313, -2.328985, 1, 1, 1, 1, 1,
-1.6538, -0.002838243, -0.03729912, 1, 1, 1, 1, 1,
-1.645106, 0.7304029, -3.396332, 1, 1, 1, 1, 1,
-1.619439, 0.8901477, -1.361571, 1, 1, 1, 1, 1,
-1.619065, -0.5307521, -1.16717, 1, 1, 1, 1, 1,
-1.618831, -0.7234057, -1.045966, 1, 1, 1, 1, 1,
-1.614443, 0.1429301, -0.9372793, 1, 1, 1, 1, 1,
-1.606264, -0.2939469, 0.7040741, 1, 1, 1, 1, 1,
-1.605793, 0.7507415, -1.272543, 1, 1, 1, 1, 1,
-1.597406, -1.322353, -0.1974851, 1, 1, 1, 1, 1,
-1.59238, -8.778102e-05, -0.6009687, 1, 1, 1, 1, 1,
-1.581846, 0.2026385, -1.212451, 0, 0, 1, 1, 1,
-1.57495, -0.7019169, -3.758842, 1, 0, 0, 1, 1,
-1.573906, 0.9910632, -1.036085, 1, 0, 0, 1, 1,
-1.572188, 0.2084556, -3.829995, 1, 0, 0, 1, 1,
-1.569739, 0.7050605, -2.60114, 1, 0, 0, 1, 1,
-1.560411, 0.0008505061, -0.7225627, 1, 0, 0, 1, 1,
-1.559071, -0.8493837, -3.340225, 0, 0, 0, 1, 1,
-1.554005, -1.22268, -3.111493, 0, 0, 0, 1, 1,
-1.530931, 0.4839694, -1.644608, 0, 0, 0, 1, 1,
-1.530289, -1.68663, -2.586751, 0, 0, 0, 1, 1,
-1.519222, 0.7269402, -0.5175321, 0, 0, 0, 1, 1,
-1.50423, -0.856055, -2.329074, 0, 0, 0, 1, 1,
-1.503012, 0.284761, -1.670113, 0, 0, 0, 1, 1,
-1.499153, 1.61923, -0.7234941, 1, 1, 1, 1, 1,
-1.490983, 0.2965299, -0.8196414, 1, 1, 1, 1, 1,
-1.485006, 0.1611082, 0.258647, 1, 1, 1, 1, 1,
-1.470684, -1.378517, -2.404795, 1, 1, 1, 1, 1,
-1.470093, -0.1339425, -1.898349, 1, 1, 1, 1, 1,
-1.461673, -1.459305, -1.564062, 1, 1, 1, 1, 1,
-1.447882, 1.287838, -0.9317754, 1, 1, 1, 1, 1,
-1.444897, -0.4466597, 0.39858, 1, 1, 1, 1, 1,
-1.443117, 0.6762812, 0.9090576, 1, 1, 1, 1, 1,
-1.435301, 0.5370367, -2.088358, 1, 1, 1, 1, 1,
-1.434302, -0.6017633, -2.740434, 1, 1, 1, 1, 1,
-1.428544, -0.758732, -2.088526, 1, 1, 1, 1, 1,
-1.422243, -0.1312575, 0.1000251, 1, 1, 1, 1, 1,
-1.421289, 1.086743, -2.279195, 1, 1, 1, 1, 1,
-1.416005, -1.848267, -2.242411, 1, 1, 1, 1, 1,
-1.397338, 1.078184, -1.569258, 0, 0, 1, 1, 1,
-1.384348, -1.431022, -1.832289, 1, 0, 0, 1, 1,
-1.38415, -0.4081622, -2.475139, 1, 0, 0, 1, 1,
-1.382206, 0.5045486, 0.1571262, 1, 0, 0, 1, 1,
-1.376715, 0.5105675, -0.3951029, 1, 0, 0, 1, 1,
-1.373989, -0.7125725, -1.424239, 1, 0, 0, 1, 1,
-1.371674, 1.072565, -1.85086, 0, 0, 0, 1, 1,
-1.364712, 1.089553, -0.8439292, 0, 0, 0, 1, 1,
-1.349895, 0.5541406, -1.833292, 0, 0, 0, 1, 1,
-1.345566, -0.3014543, -0.01371895, 0, 0, 0, 1, 1,
-1.341625, 0.5394113, -1.137672, 0, 0, 0, 1, 1,
-1.329279, -2.041856, -0.5762457, 0, 0, 0, 1, 1,
-1.328051, -0.09277121, -3.33101, 0, 0, 0, 1, 1,
-1.32023, -0.08541191, -1.733255, 1, 1, 1, 1, 1,
-1.319607, -0.9534755, -1.936509, 1, 1, 1, 1, 1,
-1.319559, -1.397561, -1.535431, 1, 1, 1, 1, 1,
-1.316356, 0.1885547, -1.231216, 1, 1, 1, 1, 1,
-1.302815, 0.7635778, -1.114512, 1, 1, 1, 1, 1,
-1.302329, -0.7751857, -2.168383, 1, 1, 1, 1, 1,
-1.296885, 0.1593336, -0.3748409, 1, 1, 1, 1, 1,
-1.288609, -1.248798, -2.464146, 1, 1, 1, 1, 1,
-1.285728, 1.848544, 0.5952018, 1, 1, 1, 1, 1,
-1.281404, 0.2422524, -0.463464, 1, 1, 1, 1, 1,
-1.278532, 0.3390983, -1.055751, 1, 1, 1, 1, 1,
-1.278017, 0.984281, -1.607464, 1, 1, 1, 1, 1,
-1.259316, -0.252554, -1.743406, 1, 1, 1, 1, 1,
-1.253742, 1.732492, -0.7640343, 1, 1, 1, 1, 1,
-1.249009, 0.897033, -1.455055, 1, 1, 1, 1, 1,
-1.239199, -0.6097049, -2.738976, 0, 0, 1, 1, 1,
-1.238021, -0.6806517, -1.49429, 1, 0, 0, 1, 1,
-1.236129, 0.6231228, -1.334586, 1, 0, 0, 1, 1,
-1.230768, -0.126555, -1.211168, 1, 0, 0, 1, 1,
-1.223589, 1.418119, -2.232265, 1, 0, 0, 1, 1,
-1.218518, -1.175635, -2.524619, 1, 0, 0, 1, 1,
-1.218103, -1.737325, -2.951878, 0, 0, 0, 1, 1,
-1.211787, 0.06961435, -1.777822, 0, 0, 0, 1, 1,
-1.210915, 0.03551112, -2.40845, 0, 0, 0, 1, 1,
-1.205169, 0.7726429, -1.51524, 0, 0, 0, 1, 1,
-1.199253, 0.7027751, 0.2225215, 0, 0, 0, 1, 1,
-1.197763, 0.7305077, 0.004624962, 0, 0, 0, 1, 1,
-1.19464, 0.7789693, -0.6157688, 0, 0, 0, 1, 1,
-1.19403, -0.2974167, -2.481234, 1, 1, 1, 1, 1,
-1.193092, -0.9725326, -3.631371, 1, 1, 1, 1, 1,
-1.192171, -0.07497085, -3.283103, 1, 1, 1, 1, 1,
-1.191213, 1.293202, 0.1495718, 1, 1, 1, 1, 1,
-1.182741, 0.8115475, -1.525526, 1, 1, 1, 1, 1,
-1.17866, 0.3670199, -0.7627012, 1, 1, 1, 1, 1,
-1.173766, -0.1978102, -1.92323, 1, 1, 1, 1, 1,
-1.170852, -0.4412021, -2.128591, 1, 1, 1, 1, 1,
-1.169028, -2.185958, -2.529978, 1, 1, 1, 1, 1,
-1.161854, 1.097175, -1.377943, 1, 1, 1, 1, 1,
-1.161491, 0.508391, -1.653956, 1, 1, 1, 1, 1,
-1.153931, -1.016154, -1.761152, 1, 1, 1, 1, 1,
-1.148505, -0.4585228, -0.2873917, 1, 1, 1, 1, 1,
-1.137866, -1.040608, -2.165893, 1, 1, 1, 1, 1,
-1.135977, -1.809826, -1.800285, 1, 1, 1, 1, 1,
-1.134561, 0.6337212, -2.260645, 0, 0, 1, 1, 1,
-1.131527, 0.9475322, -0.0242508, 1, 0, 0, 1, 1,
-1.124321, -0.7256142, -2.583751, 1, 0, 0, 1, 1,
-1.113724, 0.2166155, -2.409294, 1, 0, 0, 1, 1,
-1.094127, -0.4265341, -1.507307, 1, 0, 0, 1, 1,
-1.091892, -0.5839047, -0.3358935, 1, 0, 0, 1, 1,
-1.085631, -0.2959122, -1.039797, 0, 0, 0, 1, 1,
-1.0827, 2.149103, -2.248463, 0, 0, 0, 1, 1,
-1.081197, -0.03967329, -2.543266, 0, 0, 0, 1, 1,
-1.073985, 0.08418656, -1.635752, 0, 0, 0, 1, 1,
-1.071637, 0.6500582, -0.835851, 0, 0, 0, 1, 1,
-1.069973, -0.2534067, -2.663677, 0, 0, 0, 1, 1,
-1.062344, -0.01342137, -1.87172, 0, 0, 0, 1, 1,
-1.061741, 0.3312045, 0.6633803, 1, 1, 1, 1, 1,
-1.054317, 0.7637848, -2.787865, 1, 1, 1, 1, 1,
-1.049644, -0.4610028, -1.50173, 1, 1, 1, 1, 1,
-1.045824, -1.053572, -2.440863, 1, 1, 1, 1, 1,
-1.042934, 0.0004007059, -0.7261068, 1, 1, 1, 1, 1,
-1.034103, 0.5957275, -0.07451343, 1, 1, 1, 1, 1,
-1.032694, -0.1657714, -1.135126, 1, 1, 1, 1, 1,
-1.032372, -0.2629429, -1.133464, 1, 1, 1, 1, 1,
-1.026267, -0.5741561, -1.285796, 1, 1, 1, 1, 1,
-1.025272, 0.7325066, -0.3713156, 1, 1, 1, 1, 1,
-1.02449, 0.9227245, -0.5697751, 1, 1, 1, 1, 1,
-1.015462, -0.3257849, -2.601629, 1, 1, 1, 1, 1,
-1.01505, 0.1933798, -1.948059, 1, 1, 1, 1, 1,
-1.012983, -0.666999, -2.748524, 1, 1, 1, 1, 1,
-1.006849, 0.3808013, -3.924195, 1, 1, 1, 1, 1,
-1.001482, -0.5914186, -4.1261, 0, 0, 1, 1, 1,
-1.000011, 0.9725376, -2.755164, 1, 0, 0, 1, 1,
-0.9996096, -0.7679461, -2.207672, 1, 0, 0, 1, 1,
-0.9959384, -0.1830966, -1.776373, 1, 0, 0, 1, 1,
-0.9949906, 0.1634147, -1.597966, 1, 0, 0, 1, 1,
-0.9938307, -0.7945458, -2.321766, 1, 0, 0, 1, 1,
-0.9933362, -0.05355557, -0.1229924, 0, 0, 0, 1, 1,
-0.9904005, -0.4902219, -4.244477, 0, 0, 0, 1, 1,
-0.9852279, 1.565097, -2.147393, 0, 0, 0, 1, 1,
-0.9810572, -0.3648969, -1.856892, 0, 0, 0, 1, 1,
-0.9795555, 0.1493535, -1.068168, 0, 0, 0, 1, 1,
-0.9759919, -0.7700312, -2.347387, 0, 0, 0, 1, 1,
-0.97552, -0.1222218, -1.839787, 0, 0, 0, 1, 1,
-0.9730741, -0.108769, -1.561557, 1, 1, 1, 1, 1,
-0.9724904, 0.7701538, -1.209984, 1, 1, 1, 1, 1,
-0.9703782, -0.2814917, 0.4788801, 1, 1, 1, 1, 1,
-0.9682772, 0.007963025, -3.243633, 1, 1, 1, 1, 1,
-0.9664073, -0.05618105, -3.236221, 1, 1, 1, 1, 1,
-0.9532901, -1.064676, -3.489348, 1, 1, 1, 1, 1,
-0.9443341, -0.1201225, -2.280166, 1, 1, 1, 1, 1,
-0.9282357, -2.064612, -1.638288, 1, 1, 1, 1, 1,
-0.9272305, -0.1328275, -2.594277, 1, 1, 1, 1, 1,
-0.9182112, 0.6037478, -2.018119, 1, 1, 1, 1, 1,
-0.9164752, -0.9126035, -5.003682, 1, 1, 1, 1, 1,
-0.9095708, 1.109808, -0.7914747, 1, 1, 1, 1, 1,
-0.9077847, -0.7187217, -3.088971, 1, 1, 1, 1, 1,
-0.9053361, 0.3016852, -0.5237768, 1, 1, 1, 1, 1,
-0.9041371, 0.440814, 0.5696186, 1, 1, 1, 1, 1,
-0.8975836, -0.4992841, -1.807606, 0, 0, 1, 1, 1,
-0.896666, 0.761309, -1.478332, 1, 0, 0, 1, 1,
-0.8894181, 2.017532, -0.1125898, 1, 0, 0, 1, 1,
-0.888908, -0.8352969, -2.774325, 1, 0, 0, 1, 1,
-0.8871288, -0.08433194, -0.4106228, 1, 0, 0, 1, 1,
-0.8838873, -0.06089272, -2.106187, 1, 0, 0, 1, 1,
-0.8800124, 0.4958425, -1.611888, 0, 0, 0, 1, 1,
-0.8783684, 0.6154863, 0.8357294, 0, 0, 0, 1, 1,
-0.8757459, 0.626772, -1.303675, 0, 0, 0, 1, 1,
-0.8756887, -0.5478715, -2.513588, 0, 0, 0, 1, 1,
-0.8735684, 0.09584148, -1.95032, 0, 0, 0, 1, 1,
-0.8727446, 1.501301, -1.680299, 0, 0, 0, 1, 1,
-0.8649236, -0.7816669, -3.422531, 0, 0, 0, 1, 1,
-0.8641994, 1.713208, 0.4375908, 1, 1, 1, 1, 1,
-0.8560606, 0.1914846, -2.657817, 1, 1, 1, 1, 1,
-0.8479896, 1.100312, -1.744552, 1, 1, 1, 1, 1,
-0.8452708, 0.7376949, -0.5013916, 1, 1, 1, 1, 1,
-0.8451004, 0.1649982, -0.5646259, 1, 1, 1, 1, 1,
-0.8375663, 0.9619336, 0.01968495, 1, 1, 1, 1, 1,
-0.8240511, -0.09250595, -1.579711, 1, 1, 1, 1, 1,
-0.8204697, 0.4859922, -2.890868, 1, 1, 1, 1, 1,
-0.8180373, -1.44202, -2.46593, 1, 1, 1, 1, 1,
-0.8176869, 1.552596, 1.226257, 1, 1, 1, 1, 1,
-0.8127398, 2.156947, -1.182244, 1, 1, 1, 1, 1,
-0.8079615, 0.1512682, -1.761111, 1, 1, 1, 1, 1,
-0.8000416, -0.3359837, -3.624015, 1, 1, 1, 1, 1,
-0.7923092, -0.989395, -2.938473, 1, 1, 1, 1, 1,
-0.7910395, -1.078255, -4.263249, 1, 1, 1, 1, 1,
-0.7878208, -0.7154802, -1.670347, 0, 0, 1, 1, 1,
-0.7868097, -0.6995234, -1.191284, 1, 0, 0, 1, 1,
-0.7857797, 1.272883, 0.2492623, 1, 0, 0, 1, 1,
-0.7848334, -0.2017829, -4.013982, 1, 0, 0, 1, 1,
-0.7760211, 0.8448439, -0.1559305, 1, 0, 0, 1, 1,
-0.7676237, 1.09197, 0.09055876, 1, 0, 0, 1, 1,
-0.7609635, -0.1412551, -1.188284, 0, 0, 0, 1, 1,
-0.7606345, 0.1465861, -1.574272, 0, 0, 0, 1, 1,
-0.7605837, -0.2918272, -2.444547, 0, 0, 0, 1, 1,
-0.7604303, -0.2354121, -2.067904, 0, 0, 0, 1, 1,
-0.756721, -0.9072799, -3.807947, 0, 0, 0, 1, 1,
-0.7557419, 0.6775814, -3.968333, 0, 0, 0, 1, 1,
-0.753889, 0.2104554, -2.912829, 0, 0, 0, 1, 1,
-0.7524938, -2.059755, -2.8095, 1, 1, 1, 1, 1,
-0.7514082, -1.359629, -2.862375, 1, 1, 1, 1, 1,
-0.7511508, 0.8577915, -1.083663, 1, 1, 1, 1, 1,
-0.7499248, 1.82918, 0.09173562, 1, 1, 1, 1, 1,
-0.7490334, 0.1929726, -2.319807, 1, 1, 1, 1, 1,
-0.7371259, 0.4416669, -0.8545051, 1, 1, 1, 1, 1,
-0.7358596, -0.3605894, -1.070439, 1, 1, 1, 1, 1,
-0.7347134, -1.781542, -3.938364, 1, 1, 1, 1, 1,
-0.7322177, 0.7852687, -1.488036, 1, 1, 1, 1, 1,
-0.7285532, -1.026113, -0.6273257, 1, 1, 1, 1, 1,
-0.7182338, 1.540487, -2.056864, 1, 1, 1, 1, 1,
-0.7103417, 0.1861736, -3.804504, 1, 1, 1, 1, 1,
-0.7084258, 0.2229304, -2.884573, 1, 1, 1, 1, 1,
-0.7058074, 0.990966, -0.7719387, 1, 1, 1, 1, 1,
-0.700258, -0.4853089, -2.182944, 1, 1, 1, 1, 1,
-0.6955564, -0.9137986, -2.860354, 0, 0, 1, 1, 1,
-0.6945192, -0.5812678, -1.671536, 1, 0, 0, 1, 1,
-0.6891371, 1.952301, -0.4828363, 1, 0, 0, 1, 1,
-0.6889381, 1.158155, -1.458486, 1, 0, 0, 1, 1,
-0.6827299, -0.2842902, -1.206896, 1, 0, 0, 1, 1,
-0.6797115, 1.245667, -1.472505, 1, 0, 0, 1, 1,
-0.6792634, -0.1778362, -2.683605, 0, 0, 0, 1, 1,
-0.6781542, 1.256858, -0.7983532, 0, 0, 0, 1, 1,
-0.6774881, 0.6202952, -1.073285, 0, 0, 0, 1, 1,
-0.6665661, -1.294318, -2.274261, 0, 0, 0, 1, 1,
-0.6619508, 1.560247, 0.1955781, 0, 0, 0, 1, 1,
-0.6513098, 0.5812737, -2.154823, 0, 0, 0, 1, 1,
-0.6438084, 1.704559, -0.9405341, 0, 0, 0, 1, 1,
-0.6411069, 1.024966, 0.5708786, 1, 1, 1, 1, 1,
-0.6387517, -0.4232136, -2.458259, 1, 1, 1, 1, 1,
-0.6384923, 0.9611707, 0.8244048, 1, 1, 1, 1, 1,
-0.6383277, 0.06193687, -2.570131, 1, 1, 1, 1, 1,
-0.637216, -0.911357, -2.630365, 1, 1, 1, 1, 1,
-0.631562, -0.4877124, -3.467671, 1, 1, 1, 1, 1,
-0.6258066, -0.824988, -3.104574, 1, 1, 1, 1, 1,
-0.6257187, -2.850978, -3.771577, 1, 1, 1, 1, 1,
-0.6239645, -1.230093, -3.244653, 1, 1, 1, 1, 1,
-0.6227324, -0.6828181, -2.234322, 1, 1, 1, 1, 1,
-0.6222962, -0.5533726, -2.913916, 1, 1, 1, 1, 1,
-0.6191332, -0.2921151, -4.663793, 1, 1, 1, 1, 1,
-0.6173835, -1.635984, -4.033877, 1, 1, 1, 1, 1,
-0.611674, 0.6127766, -1.22972, 1, 1, 1, 1, 1,
-0.6114801, -0.365896, -1.086463, 1, 1, 1, 1, 1,
-0.6065797, 0.4624622, -0.717053, 0, 0, 1, 1, 1,
-0.604099, 2.908278, -0.8399848, 1, 0, 0, 1, 1,
-0.6036798, 1.244023, -1.363109, 1, 0, 0, 1, 1,
-0.6028966, -0.3261728, 0.3441651, 1, 0, 0, 1, 1,
-0.6011279, -0.5636544, -2.951422, 1, 0, 0, 1, 1,
-0.5962704, 1.380323, -0.06047195, 1, 0, 0, 1, 1,
-0.5922805, -1.026391, -1.71389, 0, 0, 0, 1, 1,
-0.5891986, 0.1012855, 1.285672, 0, 0, 0, 1, 1,
-0.588773, -0.0344728, -2.446811, 0, 0, 0, 1, 1,
-0.588144, -1.926371, -2.517877, 0, 0, 0, 1, 1,
-0.5877652, 0.7892708, -0.2880064, 0, 0, 0, 1, 1,
-0.5857054, 0.5961468, -1.384015, 0, 0, 0, 1, 1,
-0.5851285, -0.8561257, -2.113232, 0, 0, 0, 1, 1,
-0.5732526, 0.4384896, 0.4337787, 1, 1, 1, 1, 1,
-0.5693536, -0.05264984, -1.301427, 1, 1, 1, 1, 1,
-0.5672438, -0.8721325, -2.578733, 1, 1, 1, 1, 1,
-0.5603688, -0.4992204, -1.047355, 1, 1, 1, 1, 1,
-0.5541729, -0.2601598, -2.881079, 1, 1, 1, 1, 1,
-0.5494609, 1.271155, 0.3463841, 1, 1, 1, 1, 1,
-0.5469842, 0.4252152, -1.12732, 1, 1, 1, 1, 1,
-0.5459623, -0.3124273, -2.698052, 1, 1, 1, 1, 1,
-0.5436093, 1.062596, -0.6246634, 1, 1, 1, 1, 1,
-0.5383079, -1.738306, -2.909798, 1, 1, 1, 1, 1,
-0.5382423, 0.7905919, -0.3451847, 1, 1, 1, 1, 1,
-0.5336449, 0.7875747, 0.5201398, 1, 1, 1, 1, 1,
-0.5326562, -1.632213, -1.258249, 1, 1, 1, 1, 1,
-0.5304481, -0.1143154, -1.896747, 1, 1, 1, 1, 1,
-0.5217783, 0.9390702, -1.522454, 1, 1, 1, 1, 1,
-0.5212883, -0.7602496, -1.6826, 0, 0, 1, 1, 1,
-0.5124924, -1.082521, -1.470036, 1, 0, 0, 1, 1,
-0.5062667, 0.2106441, -0.9076861, 1, 0, 0, 1, 1,
-0.5060818, 1.065712, -0.9864246, 1, 0, 0, 1, 1,
-0.5028653, 0.8574672, -0.2268946, 1, 0, 0, 1, 1,
-0.5020099, 0.8937196, -0.8736057, 1, 0, 0, 1, 1,
-0.5011204, 1.782657, 0.4555718, 0, 0, 0, 1, 1,
-0.4975033, -0.3526884, -1.188926, 0, 0, 0, 1, 1,
-0.4967731, 1.00919, -0.2089081, 0, 0, 0, 1, 1,
-0.4946158, -1.215774, -2.6928, 0, 0, 0, 1, 1,
-0.4900847, -0.3851344, -4.124726, 0, 0, 0, 1, 1,
-0.4855089, -0.2344396, -1.211908, 0, 0, 0, 1, 1,
-0.4819122, -1.489806, -4.048748, 0, 0, 0, 1, 1,
-0.4816112, -1.367111, -1.402338, 1, 1, 1, 1, 1,
-0.4796913, -1.909771, -4.157307, 1, 1, 1, 1, 1,
-0.4794532, -0.6981302, -3.721041, 1, 1, 1, 1, 1,
-0.4785178, 0.2661753, -0.2448729, 1, 1, 1, 1, 1,
-0.4768302, -0.06904076, -0.3515601, 1, 1, 1, 1, 1,
-0.4676387, -0.6337321, -1.746119, 1, 1, 1, 1, 1,
-0.4636294, -0.3153028, -3.092374, 1, 1, 1, 1, 1,
-0.4636086, 1.00006, -0.2420042, 1, 1, 1, 1, 1,
-0.451654, -0.7446387, -3.678322, 1, 1, 1, 1, 1,
-0.4443989, -1.751559, -3.227883, 1, 1, 1, 1, 1,
-0.4426897, -0.3516096, -0.172105, 1, 1, 1, 1, 1,
-0.4409037, -1.00963, -3.624638, 1, 1, 1, 1, 1,
-0.4402704, 0.1638542, 1.148394, 1, 1, 1, 1, 1,
-0.4373568, -0.02131112, 0.2862028, 1, 1, 1, 1, 1,
-0.4328957, -0.567162, -2.687301, 1, 1, 1, 1, 1,
-0.4287615, 1.445434, -0.5678301, 0, 0, 1, 1, 1,
-0.4254939, 0.599508, 0.2660765, 1, 0, 0, 1, 1,
-0.4225253, 0.4656744, 0.4888399, 1, 0, 0, 1, 1,
-0.4215822, -1.503888, -2.433469, 1, 0, 0, 1, 1,
-0.4194001, -2.019628, -4.132593, 1, 0, 0, 1, 1,
-0.4191275, 0.3542056, -1.560305, 1, 0, 0, 1, 1,
-0.4039868, 2.429399, -1.672341, 0, 0, 0, 1, 1,
-0.4011527, 0.2191334, 0.01564147, 0, 0, 0, 1, 1,
-0.3993641, 0.7274135, 0.2677041, 0, 0, 0, 1, 1,
-0.3922653, -1.305731, -3.079723, 0, 0, 0, 1, 1,
-0.388381, -0.8623268, -3.120531, 0, 0, 0, 1, 1,
-0.3839845, 0.6285969, -0.8079942, 0, 0, 0, 1, 1,
-0.3829291, 0.8351589, 0.6086907, 0, 0, 0, 1, 1,
-0.3822518, -1.528426, -3.662812, 1, 1, 1, 1, 1,
-0.3822155, -0.6611946, -2.733894, 1, 1, 1, 1, 1,
-0.3813035, -0.9372354, -1.984318, 1, 1, 1, 1, 1,
-0.3811786, 0.0631272, -2.004906, 1, 1, 1, 1, 1,
-0.3773382, 0.8285152, -0.6638364, 1, 1, 1, 1, 1,
-0.3727791, -0.5187733, -1.619425, 1, 1, 1, 1, 1,
-0.3726979, -0.4979311, -3.404963, 1, 1, 1, 1, 1,
-0.3724828, -0.4589495, -1.103494, 1, 1, 1, 1, 1,
-0.3701341, -0.2737142, -1.876275, 1, 1, 1, 1, 1,
-0.3616698, 0.8480842, -0.09686046, 1, 1, 1, 1, 1,
-0.3610481, 0.6729705, -0.7940804, 1, 1, 1, 1, 1,
-0.3572238, 0.3422197, 0.3932995, 1, 1, 1, 1, 1,
-0.3539154, -0.2974423, -3.593273, 1, 1, 1, 1, 1,
-0.3482599, 1.703447, 1.602125, 1, 1, 1, 1, 1,
-0.3482575, -0.745671, -3.200373, 1, 1, 1, 1, 1,
-0.3439135, 0.24105, -1.683428, 0, 0, 1, 1, 1,
-0.3350236, -1.431251, -0.7888403, 1, 0, 0, 1, 1,
-0.3334834, 1.002576, 0.6382495, 1, 0, 0, 1, 1,
-0.3324169, 0.2216887, -0.9779125, 1, 0, 0, 1, 1,
-0.3268952, -1.22667, -3.22436, 1, 0, 0, 1, 1,
-0.3247723, 0.2262243, -1.018849, 1, 0, 0, 1, 1,
-0.3232606, -0.2893935, -1.371591, 0, 0, 0, 1, 1,
-0.3219207, -0.5477637, -2.902751, 0, 0, 0, 1, 1,
-0.3214543, 0.6301926, -0.2191005, 0, 0, 0, 1, 1,
-0.3112653, 1.063193, 0.558056, 0, 0, 0, 1, 1,
-0.3108231, 0.8287032, -0.8266023, 0, 0, 0, 1, 1,
-0.3106481, 0.8763129, 0.6768401, 0, 0, 0, 1, 1,
-0.3090721, -0.5259207, -0.7212977, 0, 0, 0, 1, 1,
-0.3089401, -1.533165, -2.434888, 1, 1, 1, 1, 1,
-0.3067726, -1.073295, -3.197456, 1, 1, 1, 1, 1,
-0.3022578, 0.1054848, -1.180302, 1, 1, 1, 1, 1,
-0.3011935, 1.761807, 1.652506, 1, 1, 1, 1, 1,
-0.3003648, 0.9394513, -0.07760173, 1, 1, 1, 1, 1,
-0.2973983, -0.4553896, -3.521676, 1, 1, 1, 1, 1,
-0.2973134, -0.3994246, -2.141705, 1, 1, 1, 1, 1,
-0.2954857, 1.178819, 0.5900668, 1, 1, 1, 1, 1,
-0.2886189, -0.6968544, -2.40327, 1, 1, 1, 1, 1,
-0.2882024, -1.789548, -3.21162, 1, 1, 1, 1, 1,
-0.285494, -0.968486, -1.622161, 1, 1, 1, 1, 1,
-0.2844071, 0.3204214, 0.06547373, 1, 1, 1, 1, 1,
-0.2830761, 2.910611, -0.04296139, 1, 1, 1, 1, 1,
-0.2818508, -1.569746, -2.87944, 1, 1, 1, 1, 1,
-0.2788505, 2.317456, -0.373893, 1, 1, 1, 1, 1,
-0.2764937, -0.6880468, -1.630819, 0, 0, 1, 1, 1,
-0.27163, 0.7094488, -1.240363, 1, 0, 0, 1, 1,
-0.2690533, -1.298016, -2.97756, 1, 0, 0, 1, 1,
-0.2570712, -1.034034, -2.536609, 1, 0, 0, 1, 1,
-0.2570211, 1.040076, -1.227314, 1, 0, 0, 1, 1,
-0.2552965, -0.693125, -2.599809, 1, 0, 0, 1, 1,
-0.2495648, -1.518349, -2.010711, 0, 0, 0, 1, 1,
-0.2494253, -0.7798608, -2.412481, 0, 0, 0, 1, 1,
-0.2477891, -1.155839, -2.216202, 0, 0, 0, 1, 1,
-0.2476996, -0.8003176, -2.304599, 0, 0, 0, 1, 1,
-0.2466106, -0.1263069, -1.350768, 0, 0, 0, 1, 1,
-0.2461223, -0.2611562, -2.070287, 0, 0, 0, 1, 1,
-0.2391048, 2.057925, 1.270961, 0, 0, 0, 1, 1,
-0.2353655, 0.9105195, -2.449829, 1, 1, 1, 1, 1,
-0.2337298, 0.6571934, -0.0723047, 1, 1, 1, 1, 1,
-0.2328654, 0.5222726, 1.850534, 1, 1, 1, 1, 1,
-0.2293276, 0.5462949, -0.715211, 1, 1, 1, 1, 1,
-0.2285208, -0.1414602, -2.167225, 1, 1, 1, 1, 1,
-0.2224855, 1.22507, -0.0521808, 1, 1, 1, 1, 1,
-0.2187738, 0.6132889, 0.7728378, 1, 1, 1, 1, 1,
-0.2184025, 0.3630937, 1.072686, 1, 1, 1, 1, 1,
-0.2168861, 0.6326545, -0.9838725, 1, 1, 1, 1, 1,
-0.2154322, 0.565692, -0.6590127, 1, 1, 1, 1, 1,
-0.2140178, -0.8505054, -4.689602, 1, 1, 1, 1, 1,
-0.2131413, 0.1714556, -1.16457, 1, 1, 1, 1, 1,
-0.2063476, -1.137497, -4.340596, 1, 1, 1, 1, 1,
-0.1944004, -1.212293, -3.203738, 1, 1, 1, 1, 1,
-0.1942477, -0.955815, -3.043839, 1, 1, 1, 1, 1,
-0.19229, 0.3499118, 0.1838441, 0, 0, 1, 1, 1,
-0.1897029, 0.6725956, -0.8619901, 1, 0, 0, 1, 1,
-0.1878622, -1.531669, -3.784271, 1, 0, 0, 1, 1,
-0.1839622, 0.415007, -0.2200713, 1, 0, 0, 1, 1,
-0.1815101, -0.6344997, -2.486271, 1, 0, 0, 1, 1,
-0.1783603, -0.1407364, -2.437696, 1, 0, 0, 1, 1,
-0.1781281, 0.4974074, -1.753584, 0, 0, 0, 1, 1,
-0.176016, 0.03956035, -0.9566294, 0, 0, 0, 1, 1,
-0.174226, -1.191063, -3.435207, 0, 0, 0, 1, 1,
-0.172367, 1.518438, 0.3498044, 0, 0, 0, 1, 1,
-0.1698643, 0.7939932, 0.3064391, 0, 0, 0, 1, 1,
-0.1664541, 1.251692, 2.964063, 0, 0, 0, 1, 1,
-0.1615787, 0.2034363, 0.08735686, 0, 0, 0, 1, 1,
-0.1615696, 0.7407902, 0.3846447, 1, 1, 1, 1, 1,
-0.16093, 0.9369935, 1.34218, 1, 1, 1, 1, 1,
-0.1508293, 1.37421, 1.619523, 1, 1, 1, 1, 1,
-0.1494897, 0.5890139, -0.8254577, 1, 1, 1, 1, 1,
-0.1469469, 0.07583258, -0.5826492, 1, 1, 1, 1, 1,
-0.1465503, 0.8767413, -1.106838, 1, 1, 1, 1, 1,
-0.144077, -0.2978509, -2.716134, 1, 1, 1, 1, 1,
-0.1386989, 0.436578, -0.5172161, 1, 1, 1, 1, 1,
-0.1377522, -0.1236224, -4.072944, 1, 1, 1, 1, 1,
-0.1318431, 1.159564, 0.0006118194, 1, 1, 1, 1, 1,
-0.125488, -0.7283061, -3.300026, 1, 1, 1, 1, 1,
-0.1231434, -0.4670255, -3.482946, 1, 1, 1, 1, 1,
-0.1203798, -0.9930021, -2.731081, 1, 1, 1, 1, 1,
-0.1201998, -1.053027, -3.467408, 1, 1, 1, 1, 1,
-0.1200394, 1.559533, -0.615679, 1, 1, 1, 1, 1,
-0.11761, 0.6739659, 1.370659, 0, 0, 1, 1, 1,
-0.111783, -0.3935966, -2.294483, 1, 0, 0, 1, 1,
-0.1111565, -0.1949486, -3.97663, 1, 0, 0, 1, 1,
-0.1097787, 0.0958992, -1.2642, 1, 0, 0, 1, 1,
-0.1024773, 2.210722, -1.179244, 1, 0, 0, 1, 1,
-0.1016883, 0.8984885, -0.1370662, 1, 0, 0, 1, 1,
-0.1000316, -0.6835419, -3.433668, 0, 0, 0, 1, 1,
-0.09963438, -1.10918, -2.234439, 0, 0, 0, 1, 1,
-0.09721101, -0.4191193, -1.825082, 0, 0, 0, 1, 1,
-0.09491695, 0.3311854, -2.32844, 0, 0, 0, 1, 1,
-0.09412665, 1.276564, 1.640615, 0, 0, 0, 1, 1,
-0.09348423, -0.6452577, -1.431921, 0, 0, 0, 1, 1,
-0.08921582, -0.3975595, -3.108355, 0, 0, 0, 1, 1,
-0.0886528, 0.7794653, 0.3727171, 1, 1, 1, 1, 1,
-0.08424723, -0.779058, -3.202485, 1, 1, 1, 1, 1,
-0.08282629, 1.139875, 1.475207, 1, 1, 1, 1, 1,
-0.0770724, 0.02615885, 0.5248321, 1, 1, 1, 1, 1,
-0.07612459, 0.6742442, -0.1388, 1, 1, 1, 1, 1,
-0.07603993, 2.095924, -0.4698786, 1, 1, 1, 1, 1,
-0.07227515, -1.349944, -3.600049, 1, 1, 1, 1, 1,
-0.07049198, -1.392392, -4.070424, 1, 1, 1, 1, 1,
-0.06794705, -1.861279, -3.557003, 1, 1, 1, 1, 1,
-0.06721298, 0.1997947, 0.3877473, 1, 1, 1, 1, 1,
-0.0665225, -1.401304, -2.046873, 1, 1, 1, 1, 1,
-0.06387576, 0.7125931, -0.7881609, 1, 1, 1, 1, 1,
-0.06145163, 0.9040871, -1.056584, 1, 1, 1, 1, 1,
-0.06041606, 0.08405644, -0.6423782, 1, 1, 1, 1, 1,
-0.05663868, 0.2840712, -1.542527, 1, 1, 1, 1, 1,
-0.05264653, 2.086556, 1.099549, 0, 0, 1, 1, 1,
-0.05213251, 1.224438, -0.6379918, 1, 0, 0, 1, 1,
-0.04804773, 0.5330091, -0.3498905, 1, 0, 0, 1, 1,
-0.04640737, -0.09369861, -1.621865, 1, 0, 0, 1, 1,
-0.0460809, -0.5942515, -3.249711, 1, 0, 0, 1, 1,
-0.04363632, 0.9168634, -0.3473794, 1, 0, 0, 1, 1,
-0.04034537, -0.4598138, -2.571675, 0, 0, 0, 1, 1,
-0.04003209, -1.795944, -2.849875, 0, 0, 0, 1, 1,
-0.03975004, 0.0187671, -1.907899, 0, 0, 0, 1, 1,
-0.03758548, 0.08261698, -0.6660852, 0, 0, 0, 1, 1,
-0.03527272, -0.1458742, -3.355668, 0, 0, 0, 1, 1,
-0.0327004, -0.09774986, -2.667344, 0, 0, 0, 1, 1,
-0.02548484, -0.7690293, -2.774332, 0, 0, 0, 1, 1,
-0.01692179, 0.3044511, 0.1311052, 1, 1, 1, 1, 1,
-0.01398452, -1.632539, -2.848788, 1, 1, 1, 1, 1,
-0.01008569, 0.1207892, -0.1380679, 1, 1, 1, 1, 1,
-0.0001592251, 0.09381987, 0.4643482, 1, 1, 1, 1, 1,
0.003382256, -0.1953105, 3.573915, 1, 1, 1, 1, 1,
0.006474757, 0.5221173, 0.1224164, 1, 1, 1, 1, 1,
0.006513256, 0.9953989, 0.4745256, 1, 1, 1, 1, 1,
0.008551262, -2.281814, 2.582244, 1, 1, 1, 1, 1,
0.01513397, -0.490584, 3.936803, 1, 1, 1, 1, 1,
0.01594779, -0.2252497, 4.173214, 1, 1, 1, 1, 1,
0.02121036, 0.6501545, -0.2003077, 1, 1, 1, 1, 1,
0.027634, 0.05261463, 0.1507446, 1, 1, 1, 1, 1,
0.03313236, 0.4158555, 0.474392, 1, 1, 1, 1, 1,
0.03407602, 0.634111, -0.10873, 1, 1, 1, 1, 1,
0.03550362, 0.4530863, -0.6269112, 1, 1, 1, 1, 1,
0.04141289, -1.49387, 1.883967, 0, 0, 1, 1, 1,
0.04590346, -0.3351921, 3.52721, 1, 0, 0, 1, 1,
0.04622199, -0.4002098, 4.712383, 1, 0, 0, 1, 1,
0.04679978, -0.3554336, 4.234746, 1, 0, 0, 1, 1,
0.05135965, -0.6292232, 3.687995, 1, 0, 0, 1, 1,
0.06609897, 2.207434, 1.061406, 1, 0, 0, 1, 1,
0.06699836, -1.423186, 4.25981, 0, 0, 0, 1, 1,
0.06798711, 0.4657766, -0.7078947, 0, 0, 0, 1, 1,
0.06858273, -1.697112, 4.199233, 0, 0, 0, 1, 1,
0.0698958, 1.23148, 0.8684124, 0, 0, 0, 1, 1,
0.07086446, -0.4263984, 1.677568, 0, 0, 0, 1, 1,
0.07193134, 0.002686282, 0.4393967, 0, 0, 0, 1, 1,
0.07278424, 0.5572638, -1.070088, 0, 0, 0, 1, 1,
0.07319248, -1.560246, 5.220356, 1, 1, 1, 1, 1,
0.07633331, -2.080103, 2.6237, 1, 1, 1, 1, 1,
0.07645364, 0.7905418, -2.008907, 1, 1, 1, 1, 1,
0.08777317, -1.528, 2.955796, 1, 1, 1, 1, 1,
0.08884202, 0.8283855, -1.036301, 1, 1, 1, 1, 1,
0.09014881, 0.03389403, 1.640675, 1, 1, 1, 1, 1,
0.09180607, -0.4379824, 3.052906, 1, 1, 1, 1, 1,
0.0918888, -1.56167, 2.904026, 1, 1, 1, 1, 1,
0.09395751, -0.1844417, 3.957855, 1, 1, 1, 1, 1,
0.09709108, -0.6140531, 3.909619, 1, 1, 1, 1, 1,
0.09850628, -1.045485, 2.498683, 1, 1, 1, 1, 1,
0.09921464, -0.03310415, 2.113067, 1, 1, 1, 1, 1,
0.1052359, -0.04467221, 2.00034, 1, 1, 1, 1, 1,
0.1058005, -0.774611, 3.042286, 1, 1, 1, 1, 1,
0.1078153, -0.3978321, 3.133745, 1, 1, 1, 1, 1,
0.1106651, 2.19205, 0.2994014, 0, 0, 1, 1, 1,
0.114131, -0.295051, 1.992768, 1, 0, 0, 1, 1,
0.1155872, -1.67167, 1.518694, 1, 0, 0, 1, 1,
0.1256972, 1.063967, -0.5687238, 1, 0, 0, 1, 1,
0.1275495, 0.8388762, 1.586819, 1, 0, 0, 1, 1,
0.1284157, 0.7588922, 1.627777, 1, 0, 0, 1, 1,
0.1285989, 0.8835286, 2.033155, 0, 0, 0, 1, 1,
0.1358372, -0.2214497, 4.224396, 0, 0, 0, 1, 1,
0.1403871, -1.088426, 1.650322, 0, 0, 0, 1, 1,
0.1405511, 1.9152, 0.0325173, 0, 0, 0, 1, 1,
0.1448779, -0.3885682, 2.996136, 0, 0, 0, 1, 1,
0.1536727, -1.130667, 1.658775, 0, 0, 0, 1, 1,
0.1560141, 0.3852035, 0.5978335, 0, 0, 0, 1, 1,
0.1589974, -0.5258814, 2.472577, 1, 1, 1, 1, 1,
0.1601967, 0.2044004, 1.145924, 1, 1, 1, 1, 1,
0.1618193, -1.334283, 2.915704, 1, 1, 1, 1, 1,
0.1656593, 1.137281, 0.07384477, 1, 1, 1, 1, 1,
0.1662893, 2.004224, -0.2283348, 1, 1, 1, 1, 1,
0.1678355, -0.5327247, 3.005409, 1, 1, 1, 1, 1,
0.169806, -2.249194, 2.356397, 1, 1, 1, 1, 1,
0.1699412, -0.9453995, 4.310056, 1, 1, 1, 1, 1,
0.1701084, 0.5509335, 0.6461901, 1, 1, 1, 1, 1,
0.1723075, -0.2658893, 3.636738, 1, 1, 1, 1, 1,
0.1748142, -0.447819, 1.643877, 1, 1, 1, 1, 1,
0.1754202, 0.8871018, -0.5701627, 1, 1, 1, 1, 1,
0.1756575, -0.2887358, 0.6863759, 1, 1, 1, 1, 1,
0.1800034, -1.730088, 3.94778, 1, 1, 1, 1, 1,
0.1849636, 0.2151169, 1.180549, 1, 1, 1, 1, 1,
0.1877272, 1.953155, 1.071948, 0, 0, 1, 1, 1,
0.1911657, -0.4492112, 1.912109, 1, 0, 0, 1, 1,
0.1925313, 0.2491811, 3.077888, 1, 0, 0, 1, 1,
0.2004987, 1.140018, -0.3730878, 1, 0, 0, 1, 1,
0.2023787, 0.753346, -0.6089863, 1, 0, 0, 1, 1,
0.2070693, -1.375717, 1.281604, 1, 0, 0, 1, 1,
0.2072176, 0.4216261, 1.858469, 0, 0, 0, 1, 1,
0.2104941, -0.03190903, 0.9736682, 0, 0, 0, 1, 1,
0.2118013, -1.314655, 4.314433, 0, 0, 0, 1, 1,
0.2128975, -0.8196252, 2.515836, 0, 0, 0, 1, 1,
0.2150781, 0.8413508, 1.865564, 0, 0, 0, 1, 1,
0.2160085, -1.302665, 5.1599, 0, 0, 0, 1, 1,
0.2214849, 1.516869, 1.226744, 0, 0, 0, 1, 1,
0.227355, -0.2680601, 2.610255, 1, 1, 1, 1, 1,
0.2296333, -0.1117612, 1.53286, 1, 1, 1, 1, 1,
0.2365538, -2.036097, 4.813558, 1, 1, 1, 1, 1,
0.2384237, -0.1209254, 2.577127, 1, 1, 1, 1, 1,
0.2385902, -0.8513451, 2.329363, 1, 1, 1, 1, 1,
0.2400241, 0.009909961, -0.01893665, 1, 1, 1, 1, 1,
0.2411381, 0.2047468, 3.008561, 1, 1, 1, 1, 1,
0.2441, 0.537873, 0.2545428, 1, 1, 1, 1, 1,
0.2445438, -0.1831802, 2.142056, 1, 1, 1, 1, 1,
0.2480935, 1.196367, 1.45913, 1, 1, 1, 1, 1,
0.2502045, 2.0583, 0.746909, 1, 1, 1, 1, 1,
0.2516085, 0.8612993, 0.1149606, 1, 1, 1, 1, 1,
0.2521014, 1.025593, 0.3733609, 1, 1, 1, 1, 1,
0.2547975, -0.5048991, 2.090838, 1, 1, 1, 1, 1,
0.2550487, 0.4888304, -1.347366, 1, 1, 1, 1, 1,
0.2570734, 0.822359, -0.4221486, 0, 0, 1, 1, 1,
0.2576745, -0.5014007, 1.939548, 1, 0, 0, 1, 1,
0.2590678, -0.8700997, 3.098918, 1, 0, 0, 1, 1,
0.2616773, 0.1045398, 0.9139768, 1, 0, 0, 1, 1,
0.2665096, -1.060256, 3.25274, 1, 0, 0, 1, 1,
0.2678197, -0.08201882, 1.344001, 1, 0, 0, 1, 1,
0.2685565, -0.4104219, 0.4795204, 0, 0, 0, 1, 1,
0.2702518, 0.3594437, 0.7738863, 0, 0, 0, 1, 1,
0.2710876, -1.711275, 2.625392, 0, 0, 0, 1, 1,
0.2735694, 0.230431, -0.1703156, 0, 0, 0, 1, 1,
0.2740889, -0.7506991, 4.026204, 0, 0, 0, 1, 1,
0.2757575, -1.487614, 1.831765, 0, 0, 0, 1, 1,
0.2772127, 0.4414116, 1.118405, 0, 0, 0, 1, 1,
0.2830995, 0.3210987, 1.304097, 1, 1, 1, 1, 1,
0.2838768, 0.5395992, 0.9728789, 1, 1, 1, 1, 1,
0.2846038, -0.4147496, 3.317012, 1, 1, 1, 1, 1,
0.2885411, -1.298824, 3.630659, 1, 1, 1, 1, 1,
0.2942891, 1.740433, 1.532542, 1, 1, 1, 1, 1,
0.299185, 0.5811895, 0.4947252, 1, 1, 1, 1, 1,
0.2993827, 1.184631, -0.09604991, 1, 1, 1, 1, 1,
0.3036982, 0.4811516, 1.816543, 1, 1, 1, 1, 1,
0.3039579, -0.336304, 0.9926448, 1, 1, 1, 1, 1,
0.3073481, -1.807835, 3.165184, 1, 1, 1, 1, 1,
0.3076118, -0.4538415, 1.840645, 1, 1, 1, 1, 1,
0.309621, -0.9158615, 3.784084, 1, 1, 1, 1, 1,
0.3107839, -0.2263767, 2.930384, 1, 1, 1, 1, 1,
0.3115174, -0.1307327, 1.400853, 1, 1, 1, 1, 1,
0.3121783, -0.47303, 3.269178, 1, 1, 1, 1, 1,
0.3139414, 1.249663, 1.667063, 0, 0, 1, 1, 1,
0.3163308, -0.1470916, 1.641539, 1, 0, 0, 1, 1,
0.3222189, -1.614855, 3.199899, 1, 0, 0, 1, 1,
0.3227358, 0.8381901, -0.6061801, 1, 0, 0, 1, 1,
0.3238056, -1.066717, 4.158711, 1, 0, 0, 1, 1,
0.3343714, -0.5112834, 1.129934, 1, 0, 0, 1, 1,
0.338542, 0.8471339, -1.773786, 0, 0, 0, 1, 1,
0.3417038, 1.96793, -0.3121387, 0, 0, 0, 1, 1,
0.3425792, 0.02274589, 1.08916, 0, 0, 0, 1, 1,
0.3437099, 1.218423, 0.4585215, 0, 0, 0, 1, 1,
0.3473788, -0.6992962, 4.044554, 0, 0, 0, 1, 1,
0.3482033, 0.4094996, 0.7019808, 0, 0, 0, 1, 1,
0.3509164, 0.06183814, 1.360337, 0, 0, 0, 1, 1,
0.3512931, -0.6030921, 2.968426, 1, 1, 1, 1, 1,
0.3522627, -0.3283273, 3.850691, 1, 1, 1, 1, 1,
0.3545468, 0.2440332, 2.4085, 1, 1, 1, 1, 1,
0.358731, 1.07977, -0.5675381, 1, 1, 1, 1, 1,
0.3591977, 2.754823, 1.052758, 1, 1, 1, 1, 1,
0.3609865, -0.1492701, 1.880383, 1, 1, 1, 1, 1,
0.3659721, 0.4489143, 1.213147, 1, 1, 1, 1, 1,
0.3675615, -0.6427998, 0.94721, 1, 1, 1, 1, 1,
0.3683645, 2.516345, 0.3157497, 1, 1, 1, 1, 1,
0.3686725, 1.361836, 1.302525, 1, 1, 1, 1, 1,
0.3692636, 0.2970789, 0.2649834, 1, 1, 1, 1, 1,
0.3712586, -1.007906, 2.710147, 1, 1, 1, 1, 1,
0.3716622, 0.9198332, 0.6899613, 1, 1, 1, 1, 1,
0.3775964, 0.857982, 1.014195, 1, 1, 1, 1, 1,
0.3788964, -0.6534151, 2.574694, 1, 1, 1, 1, 1,
0.3813381, 0.3783315, 1.632989, 0, 0, 1, 1, 1,
0.3817579, 0.2601396, -0.6434445, 1, 0, 0, 1, 1,
0.3880807, 0.1967004, 1.166089, 1, 0, 0, 1, 1,
0.3904462, -0.08840428, 2.001621, 1, 0, 0, 1, 1,
0.3908866, -0.4577653, 1.873811, 1, 0, 0, 1, 1,
0.3912044, -2.303552, 3.327365, 1, 0, 0, 1, 1,
0.3938044, -1.312051, 5.21501, 0, 0, 0, 1, 1,
0.3952686, -0.2499475, 2.501984, 0, 0, 0, 1, 1,
0.3963167, -1.255497, 2.244166, 0, 0, 0, 1, 1,
0.3965589, -1.590728, 3.212799, 0, 0, 0, 1, 1,
0.3967627, 0.6241235, -0.5349542, 0, 0, 0, 1, 1,
0.3969338, 1.206109, 0.5789759, 0, 0, 0, 1, 1,
0.3995012, -0.3555775, 2.063188, 0, 0, 0, 1, 1,
0.4043653, 0.6308397, -0.01232539, 1, 1, 1, 1, 1,
0.4064187, 0.2859235, -0.4907599, 1, 1, 1, 1, 1,
0.4117455, 0.3679774, 1.326978, 1, 1, 1, 1, 1,
0.4163361, -2.051043, 2.640044, 1, 1, 1, 1, 1,
0.4193462, 0.2468183, 0.5955316, 1, 1, 1, 1, 1,
0.4238921, -1.274662, 3.448236, 1, 1, 1, 1, 1,
0.4329953, -0.5528257, 3.388569, 1, 1, 1, 1, 1,
0.4343549, -0.2311462, 2.144917, 1, 1, 1, 1, 1,
0.437225, -0.1742455, 1.300852, 1, 1, 1, 1, 1,
0.4372558, 0.5292805, 1.222531, 1, 1, 1, 1, 1,
0.4395612, 1.208612, 0.7816674, 1, 1, 1, 1, 1,
0.4396722, 1.241394, 0.8709173, 1, 1, 1, 1, 1,
0.449921, -0.1431057, 1.457287, 1, 1, 1, 1, 1,
0.4507349, -0.5155973, 0.9091009, 1, 1, 1, 1, 1,
0.4545427, 0.1877722, 0.5450832, 1, 1, 1, 1, 1,
0.4600521, 0.9372362, 0.01707543, 0, 0, 1, 1, 1,
0.4601607, -1.906526, 2.064574, 1, 0, 0, 1, 1,
0.4625103, -0.2605598, 2.712768, 1, 0, 0, 1, 1,
0.4682735, -1.178852, 1.683053, 1, 0, 0, 1, 1,
0.4705555, 2.151144, -0.2201746, 1, 0, 0, 1, 1,
0.4721164, 0.8456387, -1.263763, 1, 0, 0, 1, 1,
0.4725658, -1.182119, 2.9688, 0, 0, 0, 1, 1,
0.4755543, -0.6845285, 1.140824, 0, 0, 0, 1, 1,
0.4757171, 0.282806, 2.29545, 0, 0, 0, 1, 1,
0.4821459, -0.05113035, 3.642364, 0, 0, 0, 1, 1,
0.4830576, -0.6548853, 2.84388, 0, 0, 0, 1, 1,
0.4873056, 0.6425468, 1.485273, 0, 0, 0, 1, 1,
0.490469, -1.367143, 2.913496, 0, 0, 0, 1, 1,
0.4968172, -0.6628237, 3.606004, 1, 1, 1, 1, 1,
0.4976897, -0.663097, 2.035633, 1, 1, 1, 1, 1,
0.4990992, -0.195715, 1.05352, 1, 1, 1, 1, 1,
0.5036382, -1.144544, 1.848407, 1, 1, 1, 1, 1,
0.5037373, 0.4405406, 0.8962745, 1, 1, 1, 1, 1,
0.5039825, 1.36937, 0.7113539, 1, 1, 1, 1, 1,
0.5050426, 1.055609, 1.634558, 1, 1, 1, 1, 1,
0.5080214, -0.7500455, 2.764362, 1, 1, 1, 1, 1,
0.5088198, 0.6147912, 1.959664, 1, 1, 1, 1, 1,
0.5115837, -0.1510085, 1.120277, 1, 1, 1, 1, 1,
0.5116796, -0.3744809, 1.789925, 1, 1, 1, 1, 1,
0.5140153, 0.1961812, 2.416124, 1, 1, 1, 1, 1,
0.5150924, 0.3672014, 0.2360091, 1, 1, 1, 1, 1,
0.5191531, -1.068286, 2.142287, 1, 1, 1, 1, 1,
0.51918, 0.6047135, -0.07790966, 1, 1, 1, 1, 1,
0.5195017, 0.1560556, 0.6983569, 0, 0, 1, 1, 1,
0.521198, 1.148093, -0.1103571, 1, 0, 0, 1, 1,
0.5311715, 1.764868, 0.6189507, 1, 0, 0, 1, 1,
0.5350296, 1.259398, 0.3893993, 1, 0, 0, 1, 1,
0.5389426, 0.1575029, 2.537602, 1, 0, 0, 1, 1,
0.539851, -0.1830486, 0.9554155, 1, 0, 0, 1, 1,
0.5430178, 0.1541307, -0.09670287, 0, 0, 0, 1, 1,
0.5477791, 1.41503, -0.8448582, 0, 0, 0, 1, 1,
0.5497764, 0.1558866, 1.176803, 0, 0, 0, 1, 1,
0.5514796, 0.7685444, 0.7193593, 0, 0, 0, 1, 1,
0.558731, -0.3002568, 3.313041, 0, 0, 0, 1, 1,
0.5594777, -1.214048, 4.442786, 0, 0, 0, 1, 1,
0.5613815, -0.06161245, 3.01658, 0, 0, 0, 1, 1,
0.566789, 0.007534433, 3.098602, 1, 1, 1, 1, 1,
0.5691757, -0.1258419, 1.192667, 1, 1, 1, 1, 1,
0.5708897, -0.3308126, 1.744397, 1, 1, 1, 1, 1,
0.5723938, -0.02179448, 2.094287, 1, 1, 1, 1, 1,
0.5741672, -1.313575, 2.550249, 1, 1, 1, 1, 1,
0.5750246, -1.99861, 1.81642, 1, 1, 1, 1, 1,
0.576789, -0.009605604, 3.342943, 1, 1, 1, 1, 1,
0.5796879, -0.9746497, 0.085184, 1, 1, 1, 1, 1,
0.5884399, -0.9392546, 2.19793, 1, 1, 1, 1, 1,
0.5909943, -2.621918, 3.818538, 1, 1, 1, 1, 1,
0.5914495, 0.5138376, 2.708416, 1, 1, 1, 1, 1,
0.5935505, 1.110295, -0.2359207, 1, 1, 1, 1, 1,
0.5955777, -0.3166492, 3.737741, 1, 1, 1, 1, 1,
0.5962369, 0.2356316, 0.2989476, 1, 1, 1, 1, 1,
0.5967537, 0.9896999, -0.356874, 1, 1, 1, 1, 1,
0.5998057, -0.9959347, 3.298146, 0, 0, 1, 1, 1,
0.6055164, 0.5896958, -1.038123, 1, 0, 0, 1, 1,
0.6057233, 1.488635, -0.2448365, 1, 0, 0, 1, 1,
0.6117618, 0.8742191, -0.9337384, 1, 0, 0, 1, 1,
0.6126975, 1.447514, -0.6454973, 1, 0, 0, 1, 1,
0.613264, 0.483389, 2.437767, 1, 0, 0, 1, 1,
0.6181408, 0.006492562, 1.231776, 0, 0, 0, 1, 1,
0.6204079, 0.1119766, 1.05637, 0, 0, 0, 1, 1,
0.6289299, 0.9038872, 0.3767063, 0, 0, 0, 1, 1,
0.6292012, 1.540258, 1.38494, 0, 0, 0, 1, 1,
0.6340945, 0.1036232, 2.057515, 0, 0, 0, 1, 1,
0.6350013, 0.05376711, 0.5662315, 0, 0, 0, 1, 1,
0.6384962, 0.499431, 1.983711, 0, 0, 0, 1, 1,
0.6409861, -0.2618181, 0.08815768, 1, 1, 1, 1, 1,
0.6410922, 0.3437257, 0.6316788, 1, 1, 1, 1, 1,
0.6419612, 2.555646, 1.769437, 1, 1, 1, 1, 1,
0.6420062, 0.646392, 2.499543, 1, 1, 1, 1, 1,
0.6468665, 1.126187, 1.524665, 1, 1, 1, 1, 1,
0.6482649, -0.8170358, 4.586886, 1, 1, 1, 1, 1,
0.6506104, 0.90138, -0.3559865, 1, 1, 1, 1, 1,
0.6506848, 0.1389645, 1.301169, 1, 1, 1, 1, 1,
0.6511577, 0.3116317, 2.066825, 1, 1, 1, 1, 1,
0.6528491, 0.04392866, 0.9153312, 1, 1, 1, 1, 1,
0.6597154, -0.4313361, 2.957856, 1, 1, 1, 1, 1,
0.6605093, 0.2923441, 2.011937, 1, 1, 1, 1, 1,
0.6619337, -2.211001, 4.329386, 1, 1, 1, 1, 1,
0.6640186, -0.71534, 2.739219, 1, 1, 1, 1, 1,
0.6660309, -0.9207298, 4.375958, 1, 1, 1, 1, 1,
0.6672118, -0.6213632, 2.277889, 0, 0, 1, 1, 1,
0.6696116, -1.195652, 2.686104, 1, 0, 0, 1, 1,
0.6705565, -0.2619122, 0.8462647, 1, 0, 0, 1, 1,
0.6735256, -0.4429463, 2.084788, 1, 0, 0, 1, 1,
0.6791905, 0.03313811, 1.493197, 1, 0, 0, 1, 1,
0.6801492, 0.2663298, 0.4445639, 1, 0, 0, 1, 1,
0.6820464, -1.315378, 4.026592, 0, 0, 0, 1, 1,
0.6841378, -0.6715223, 2.175972, 0, 0, 0, 1, 1,
0.6852559, -0.9588899, 1.736377, 0, 0, 0, 1, 1,
0.6881299, 2.052781, 0.5511181, 0, 0, 0, 1, 1,
0.6995273, 1.44419, 0.03930856, 0, 0, 0, 1, 1,
0.7042593, 1.427685, 0.8296456, 0, 0, 0, 1, 1,
0.7091531, 0.3912669, 1.531256, 0, 0, 0, 1, 1,
0.7129501, -0.8890901, 2.616214, 1, 1, 1, 1, 1,
0.7145216, -0.6701782, 4.655343, 1, 1, 1, 1, 1,
0.7162842, -1.933054, 1.825783, 1, 1, 1, 1, 1,
0.7169853, -1.148644, 1.268168, 1, 1, 1, 1, 1,
0.7203931, -0.3710079, 2.402368, 1, 1, 1, 1, 1,
0.7204626, 0.4160119, -0.6895086, 1, 1, 1, 1, 1,
0.7208062, 0.4301994, 2.125013, 1, 1, 1, 1, 1,
0.7299317, 0.898044, -1.547779, 1, 1, 1, 1, 1,
0.7342717, -0.5066961, 2.047719, 1, 1, 1, 1, 1,
0.7359876, 1.10571, 0.7836803, 1, 1, 1, 1, 1,
0.7370872, 0.1354043, 1.752896, 1, 1, 1, 1, 1,
0.7422367, -0.5224119, 1.767971, 1, 1, 1, 1, 1,
0.7427132, 1.908589, -0.6207368, 1, 1, 1, 1, 1,
0.7444243, -0.2429403, 1.143989, 1, 1, 1, 1, 1,
0.7478499, 0.4455197, 0.2924307, 1, 1, 1, 1, 1,
0.756122, 0.3217768, 3.836722, 0, 0, 1, 1, 1,
0.7635907, 0.8058468, 1.387676, 1, 0, 0, 1, 1,
0.766077, -0.06165827, -0.8891261, 1, 0, 0, 1, 1,
0.7664467, -0.5610953, 0.9465059, 1, 0, 0, 1, 1,
0.7743674, 0.5172581, 1.906888, 1, 0, 0, 1, 1,
0.7770865, 1.692847, -0.196448, 1, 0, 0, 1, 1,
0.7889354, -1.158984, 2.877529, 0, 0, 0, 1, 1,
0.7897703, 0.2371189, 2.440797, 0, 0, 0, 1, 1,
0.7970046, -1.421945, 3.302741, 0, 0, 0, 1, 1,
0.8040696, 0.8347076, 2.115938, 0, 0, 0, 1, 1,
0.8071907, -0.8533219, 0.8390664, 0, 0, 0, 1, 1,
0.8072243, 0.9555245, 0.5972257, 0, 0, 0, 1, 1,
0.8087895, 0.3025432, 1.460054, 0, 0, 0, 1, 1,
0.8101687, -0.490589, 4.710573, 1, 1, 1, 1, 1,
0.8113695, -0.3531354, 1.818284, 1, 1, 1, 1, 1,
0.8238307, -0.2115481, 0.604801, 1, 1, 1, 1, 1,
0.8282125, -0.6148422, 0.4781893, 1, 1, 1, 1, 1,
0.8456236, -0.5614198, 0.6808473, 1, 1, 1, 1, 1,
0.8469002, 0.721932, 1.659897, 1, 1, 1, 1, 1,
0.8480806, 0.4661304, 2.477811, 1, 1, 1, 1, 1,
0.8482586, -0.402315, 0.9592444, 1, 1, 1, 1, 1,
0.8511408, 1.430916, 0.4326253, 1, 1, 1, 1, 1,
0.8512045, 0.6790696, 1.923657, 1, 1, 1, 1, 1,
0.8546069, -0.7425016, 3.104469, 1, 1, 1, 1, 1,
0.855583, -0.3447915, 1.876487, 1, 1, 1, 1, 1,
0.8563785, -0.7091068, 2.376599, 1, 1, 1, 1, 1,
0.8630533, 0.7014118, 1.792199, 1, 1, 1, 1, 1,
0.8699953, 1.601444, 1.644401, 1, 1, 1, 1, 1,
0.8736923, -2.034543, 2.757623, 0, 0, 1, 1, 1,
0.8802288, 1.298948, 1.087814, 1, 0, 0, 1, 1,
0.8802486, 1.847565, 1.488526, 1, 0, 0, 1, 1,
0.8826908, 0.04526369, 1.781201, 1, 0, 0, 1, 1,
0.8876737, -0.7870824, 1.994889, 1, 0, 0, 1, 1,
0.8981318, 1.787755, 1.215962, 1, 0, 0, 1, 1,
0.9010122, -0.1038183, 1.8931, 0, 0, 0, 1, 1,
0.901868, -0.3810313, 2.178819, 0, 0, 0, 1, 1,
0.9039732, 0.599247, 1.247784, 0, 0, 0, 1, 1,
0.9044417, -0.2406345, 1.384815, 0, 0, 0, 1, 1,
0.9062858, 0.5206448, -0.671531, 0, 0, 0, 1, 1,
0.9151427, 0.04077633, 1.983714, 0, 0, 0, 1, 1,
0.9184531, 0.01749357, 0.6464196, 0, 0, 0, 1, 1,
0.919119, -0.8887054, 2.59323, 1, 1, 1, 1, 1,
0.9268364, 0.6536445, 0.2064623, 1, 1, 1, 1, 1,
0.9270049, 0.5619485, 0.1011482, 1, 1, 1, 1, 1,
0.9303606, 1.058993, 1.276049, 1, 1, 1, 1, 1,
0.9344999, 0.7508653, 1.618528, 1, 1, 1, 1, 1,
0.9400227, 0.7650341, 1.303892, 1, 1, 1, 1, 1,
0.9431918, -0.1043727, 3.242434, 1, 1, 1, 1, 1,
0.9461973, 0.06354688, 2.502034, 1, 1, 1, 1, 1,
0.9498973, -1.467924, 2.0327, 1, 1, 1, 1, 1,
0.9513176, 0.6097676, 0.2464015, 1, 1, 1, 1, 1,
0.9546212, 0.8588569, 0.9323092, 1, 1, 1, 1, 1,
0.956581, -0.6945374, 2.233273, 1, 1, 1, 1, 1,
0.9593775, 1.495659, 1.657574, 1, 1, 1, 1, 1,
0.9655681, -0.279941, 0.7750646, 1, 1, 1, 1, 1,
0.9752344, -0.08029311, 1.804743, 1, 1, 1, 1, 1,
0.9763839, -1.095015, 1.560841, 0, 0, 1, 1, 1,
0.9804028, -1.131939, 6.610177, 1, 0, 0, 1, 1,
0.9946312, -0.623412, 3.402848, 1, 0, 0, 1, 1,
1.002572, 0.4600316, 2.101854, 1, 0, 0, 1, 1,
1.004474, 0.1112784, 1.144816, 1, 0, 0, 1, 1,
1.004686, -0.5969721, 2.585022, 1, 0, 0, 1, 1,
1.005958, -0.1064948, 2.292562, 0, 0, 0, 1, 1,
1.006081, -0.1897458, 2.567104, 0, 0, 0, 1, 1,
1.009417, -0.1566658, 2.652371, 0, 0, 0, 1, 1,
1.01141, -0.8413997, 3.654485, 0, 0, 0, 1, 1,
1.017459, -0.5426279, 2.489499, 0, 0, 0, 1, 1,
1.021051, 1.901298, -1.322737, 0, 0, 0, 1, 1,
1.025089, 1.520013, 1.610484, 0, 0, 0, 1, 1,
1.025877, 0.8397307, 0.7175042, 1, 1, 1, 1, 1,
1.026415, -0.08004806, 1.91538, 1, 1, 1, 1, 1,
1.027589, 0.8226654, 1.151608, 1, 1, 1, 1, 1,
1.029557, -1.251866, 2.389532, 1, 1, 1, 1, 1,
1.034978, -0.2468897, 1.834712, 1, 1, 1, 1, 1,
1.035538, -0.07714758, 1.467543, 1, 1, 1, 1, 1,
1.035837, -1.189081, 2.564109, 1, 1, 1, 1, 1,
1.039564, -0.1457207, 3.713846, 1, 1, 1, 1, 1,
1.044809, 0.06162157, 2.327881, 1, 1, 1, 1, 1,
1.046685, -0.2492872, 3.141906, 1, 1, 1, 1, 1,
1.047302, -0.245505, 2.030798, 1, 1, 1, 1, 1,
1.050317, -0.5128465, 3.226743, 1, 1, 1, 1, 1,
1.055279, 0.2143021, 0.9916645, 1, 1, 1, 1, 1,
1.055956, 0.2131667, 0.01105678, 1, 1, 1, 1, 1,
1.061682, 1.21426, 1.727475, 1, 1, 1, 1, 1,
1.063096, -0.5936708, 1.391374, 0, 0, 1, 1, 1,
1.087204, -0.6159201, 3.128906, 1, 0, 0, 1, 1,
1.102734, 0.7360298, 0.1143512, 1, 0, 0, 1, 1,
1.108907, -1.348207, 1.273043, 1, 0, 0, 1, 1,
1.112448, 0.5360811, 1.174712, 1, 0, 0, 1, 1,
1.116686, -1.129303, 1.529637, 1, 0, 0, 1, 1,
1.117562, 0.1632456, 1.391126, 0, 0, 0, 1, 1,
1.120311, 0.07360743, 0.6871616, 0, 0, 0, 1, 1,
1.128125, -1.122767, 2.174671, 0, 0, 0, 1, 1,
1.135091, -1.289585, 1.055385, 0, 0, 0, 1, 1,
1.135627, 2.200741, -0.182971, 0, 0, 0, 1, 1,
1.143932, -0.9377171, 1.187008, 0, 0, 0, 1, 1,
1.147736, -0.729711, 3.199613, 0, 0, 0, 1, 1,
1.148243, 0.524584, 2.773421, 1, 1, 1, 1, 1,
1.155277, 1.057213, 1.163573, 1, 1, 1, 1, 1,
1.155558, 0.3959685, -0.3674915, 1, 1, 1, 1, 1,
1.157333, -0.1364062, 1.898094, 1, 1, 1, 1, 1,
1.163215, -1.400643, 3.063293, 1, 1, 1, 1, 1,
1.167989, -1.120299, 1.794558, 1, 1, 1, 1, 1,
1.174542, 1.020923, 0.758033, 1, 1, 1, 1, 1,
1.177357, -0.378731, 3.013193, 1, 1, 1, 1, 1,
1.178449, -1.115805, 1.58284, 1, 1, 1, 1, 1,
1.178524, 3.119617, -1.322924, 1, 1, 1, 1, 1,
1.183666, 0.5363759, 0.3900359, 1, 1, 1, 1, 1,
1.195261, 1.904901, 0.4492098, 1, 1, 1, 1, 1,
1.195441, -0.2237054, 1.211935, 1, 1, 1, 1, 1,
1.195676, 0.4803665, 0.1981662, 1, 1, 1, 1, 1,
1.198068, -0.2421984, 0.3725542, 1, 1, 1, 1, 1,
1.198756, 0.7438976, 0.5115992, 0, 0, 1, 1, 1,
1.213376, -0.7615466, 1.062873, 1, 0, 0, 1, 1,
1.213632, 0.6758553, 2.062461, 1, 0, 0, 1, 1,
1.225442, -0.002580037, 2.274296, 1, 0, 0, 1, 1,
1.228538, -0.2807499, 0.4135792, 1, 0, 0, 1, 1,
1.232731, -0.29223, 1.161061, 1, 0, 0, 1, 1,
1.235807, 0.5090958, 2.005746, 0, 0, 0, 1, 1,
1.239736, -1.193776, 2.527154, 0, 0, 0, 1, 1,
1.241849, 0.938496, 1.351308, 0, 0, 0, 1, 1,
1.244998, -1.373816, 0.8195488, 0, 0, 0, 1, 1,
1.252704, 0.2193603, 2.189411, 0, 0, 0, 1, 1,
1.259917, -2.679218, 2.369279, 0, 0, 0, 1, 1,
1.272641, -0.7890606, 2.919439, 0, 0, 0, 1, 1,
1.274984, -0.1085781, 1.769164, 1, 1, 1, 1, 1,
1.280576, -2.933251, 1.477988, 1, 1, 1, 1, 1,
1.286266, -0.2722098, 1.615867, 1, 1, 1, 1, 1,
1.287062, -0.05703237, -0.3499888, 1, 1, 1, 1, 1,
1.289613, 1.044633, -0.9522939, 1, 1, 1, 1, 1,
1.293169, -0.4817224, 2.191031, 1, 1, 1, 1, 1,
1.294511, -1.031257, 1.702492, 1, 1, 1, 1, 1,
1.30343, 0.4090971, 2.01745, 1, 1, 1, 1, 1,
1.304604, -1.409734, 1.854157, 1, 1, 1, 1, 1,
1.306103, -0.5982854, 1.761102, 1, 1, 1, 1, 1,
1.309235, -0.6306949, 2.244779, 1, 1, 1, 1, 1,
1.316205, 0.1812358, 0.5049494, 1, 1, 1, 1, 1,
1.345312, -1.31188, 1.154386, 1, 1, 1, 1, 1,
1.351235, 0.3484503, 1.102665, 1, 1, 1, 1, 1,
1.35677, -0.6531315, 1.897282, 1, 1, 1, 1, 1,
1.361554, 0.2992988, 1.33903, 0, 0, 1, 1, 1,
1.363905, -0.6921248, 2.863961, 1, 0, 0, 1, 1,
1.366478, -0.779372, 1.120614, 1, 0, 0, 1, 1,
1.369149, 1.92668, 1.019444, 1, 0, 0, 1, 1,
1.401015, 1.60798, -0.138376, 1, 0, 0, 1, 1,
1.40429, 0.01982619, 1.398718, 1, 0, 0, 1, 1,
1.423152, 0.0925702, 1.929591, 0, 0, 0, 1, 1,
1.45545, 0.2127624, 1.85829, 0, 0, 0, 1, 1,
1.460307, 0.8577534, 0.8124664, 0, 0, 0, 1, 1,
1.481203, 0.4875049, 2.23674, 0, 0, 0, 1, 1,
1.499187, -0.3140046, 1.507987, 0, 0, 0, 1, 1,
1.508304, 0.7234234, 1.791418, 0, 0, 0, 1, 1,
1.510471, 0.7187105, -0.04522648, 0, 0, 0, 1, 1,
1.514516, 0.5459361, 2.09739, 1, 1, 1, 1, 1,
1.516186, -0.2692513, 1.351314, 1, 1, 1, 1, 1,
1.518514, -0.05671633, 2.128368, 1, 1, 1, 1, 1,
1.522494, -0.3878991, 1.5936, 1, 1, 1, 1, 1,
1.538681, 0.5505974, 1.031447, 1, 1, 1, 1, 1,
1.546857, 0.3456857, 1.995971, 1, 1, 1, 1, 1,
1.560185, -1.530419, 2.136628, 1, 1, 1, 1, 1,
1.560873, 0.5958638, 1.207615, 1, 1, 1, 1, 1,
1.567073, 1.408127, 1.032595, 1, 1, 1, 1, 1,
1.574609, 0.6767172, 3.127315, 1, 1, 1, 1, 1,
1.57896, 1.433263, 2.189711, 1, 1, 1, 1, 1,
1.594427, 0.07413013, 1.882971, 1, 1, 1, 1, 1,
1.596297, -2.534389, 3.025745, 1, 1, 1, 1, 1,
1.606334, -1.329923, 2.749516, 1, 1, 1, 1, 1,
1.616086, 0.4299842, 1.552484, 1, 1, 1, 1, 1,
1.627458, -0.3488515, 2.204394, 0, 0, 1, 1, 1,
1.632208, -1.342936, 2.145924, 1, 0, 0, 1, 1,
1.659516, 1.801087, -0.7889059, 1, 0, 0, 1, 1,
1.670402, -0.6340624, 2.54007, 1, 0, 0, 1, 1,
1.672388, -0.5571702, 2.730021, 1, 0, 0, 1, 1,
1.688042, 0.1002192, 1.285076, 1, 0, 0, 1, 1,
1.697946, 0.5676638, 2.340253, 0, 0, 0, 1, 1,
1.711618, -1.183361, 1.855168, 0, 0, 0, 1, 1,
1.712757, 0.6797998, 2.11355, 0, 0, 0, 1, 1,
1.732618, 0.9872866, 1.617607, 0, 0, 0, 1, 1,
1.736186, -0.2004156, 2.015777, 0, 0, 0, 1, 1,
1.739182, -0.3576889, 1.392217, 0, 0, 0, 1, 1,
1.74017, 1.423027, 0.2448753, 0, 0, 0, 1, 1,
1.771879, -0.4134784, 1.762645, 1, 1, 1, 1, 1,
1.797884, -0.2536258, 1.224589, 1, 1, 1, 1, 1,
1.801702, 0.2398106, 0.2712524, 1, 1, 1, 1, 1,
1.818178, -1.360484, 2.33307, 1, 1, 1, 1, 1,
1.845458, 0.05107031, -0.09359473, 1, 1, 1, 1, 1,
1.861002, -0.8541119, 1.505184, 1, 1, 1, 1, 1,
1.869507, 1.468945, 0.808545, 1, 1, 1, 1, 1,
1.877541, -0.2447291, 1.274814, 1, 1, 1, 1, 1,
1.88993, 0.7549512, 0.5134522, 1, 1, 1, 1, 1,
1.919395, -0.4886363, 1.477374, 1, 1, 1, 1, 1,
1.929897, 1.748568, 0.4235269, 1, 1, 1, 1, 1,
1.939482, -0.7975835, 0.6788565, 1, 1, 1, 1, 1,
1.969827, -0.7615355, 2.385276, 1, 1, 1, 1, 1,
1.97798, 0.104905, 0.1380365, 1, 1, 1, 1, 1,
1.999623, -0.4107624, 2.823132, 1, 1, 1, 1, 1,
2.011985, 1.334487, 2.366049, 0, 0, 1, 1, 1,
2.01407, -0.01161346, 2.285875, 1, 0, 0, 1, 1,
2.052519, 0.7528955, 1.329231, 1, 0, 0, 1, 1,
2.071099, 0.2881005, 1.19471, 1, 0, 0, 1, 1,
2.085589, 1.832219, 0.7367616, 1, 0, 0, 1, 1,
2.116592, -1.354052, 1.595759, 1, 0, 0, 1, 1,
2.124355, 0.1850872, 2.207501, 0, 0, 0, 1, 1,
2.12553, -1.678176, 1.30161, 0, 0, 0, 1, 1,
2.126374, 2.005489, -0.2911702, 0, 0, 0, 1, 1,
2.137956, 1.6733, -0.3376477, 0, 0, 0, 1, 1,
2.147208, -1.621467, 1.839453, 0, 0, 0, 1, 1,
2.166257, -1.103689, 1.174342, 0, 0, 0, 1, 1,
2.178114, -1.498364, 1.865888, 0, 0, 0, 1, 1,
2.210442, -0.3467593, 2.865658, 1, 1, 1, 1, 1,
2.230965, 0.8404931, -0.8848479, 1, 1, 1, 1, 1,
2.256329, -0.5737866, 2.169081, 1, 1, 1, 1, 1,
2.449798, -0.9055908, 0.7825745, 1, 1, 1, 1, 1,
2.451983, -1.206171, 2.857616, 1, 1, 1, 1, 1,
2.497265, -1.507467, 3.847894, 1, 1, 1, 1, 1,
2.792121, -0.3258571, 0.2679998, 1, 1, 1, 1, 1
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
var radius = 9.804212;
var distance = 34.43688;
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
mvMatrix.translate( 0.3180714, -0.09318292, -0.8032477 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.43688);
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
