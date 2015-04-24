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
-3.277917, -2.038258, -1.294419, 1, 0, 0, 1,
-3.060771, 0.7913673, -3.02967, 1, 0.007843138, 0, 1,
-2.946743, -0.2857637, -0.6613139, 1, 0.01176471, 0, 1,
-2.59442, -0.9340253, -0.6191464, 1, 0.01960784, 0, 1,
-2.572264, 0.3197081, -2.377188, 1, 0.02352941, 0, 1,
-2.499201, -0.9235377, -2.517585, 1, 0.03137255, 0, 1,
-2.447425, 1.331463, -1.957681, 1, 0.03529412, 0, 1,
-2.307501, 0.05673699, -0.3320159, 1, 0.04313726, 0, 1,
-2.283259, -0.8279903, -0.9248372, 1, 0.04705882, 0, 1,
-2.244706, 0.723743, 0.4761775, 1, 0.05490196, 0, 1,
-2.204678, -0.5264178, -0.4579523, 1, 0.05882353, 0, 1,
-2.183259, 0.296952, -1.208531, 1, 0.06666667, 0, 1,
-2.156851, -0.9744052, -3.375416, 1, 0.07058824, 0, 1,
-2.148727, 0.175333, -1.479277, 1, 0.07843138, 0, 1,
-2.133667, -1.685739, -2.855797, 1, 0.08235294, 0, 1,
-2.089955, 0.3500967, -3.053605, 1, 0.09019608, 0, 1,
-2.021729, -0.5364035, -0.5931887, 1, 0.09411765, 0, 1,
-2.00736, 0.5441181, -1.279172, 1, 0.1019608, 0, 1,
-2.003569, 0.238145, -1.099036, 1, 0.1098039, 0, 1,
-1.994952, -0.3927916, -3.73973, 1, 0.1137255, 0, 1,
-1.973547, 2.331703, -0.513496, 1, 0.1215686, 0, 1,
-1.947191, 1.076314, -2.544035, 1, 0.1254902, 0, 1,
-1.939267, 0.5938382, -0.9883854, 1, 0.1333333, 0, 1,
-1.890777, -0.1259335, 0.1690322, 1, 0.1372549, 0, 1,
-1.886731, -0.7624289, -0.8064176, 1, 0.145098, 0, 1,
-1.885465, -0.270043, -2.919329, 1, 0.1490196, 0, 1,
-1.87312, -1.803218, -2.505669, 1, 0.1568628, 0, 1,
-1.846172, -0.2483689, -2.22856, 1, 0.1607843, 0, 1,
-1.815637, 0.4247261, -1.649398, 1, 0.1686275, 0, 1,
-1.803324, 0.4832903, -0.5330814, 1, 0.172549, 0, 1,
-1.755413, -0.5707779, -2.066293, 1, 0.1803922, 0, 1,
-1.748176, -1.039218, -3.583264, 1, 0.1843137, 0, 1,
-1.738747, 0.7392239, -1.155409, 1, 0.1921569, 0, 1,
-1.731817, 0.2345984, -2.090108, 1, 0.1960784, 0, 1,
-1.725758, -1.779751, -3.151877, 1, 0.2039216, 0, 1,
-1.719357, 0.2742016, -2.21454, 1, 0.2117647, 0, 1,
-1.703357, 1.689574, -0.3039149, 1, 0.2156863, 0, 1,
-1.698177, -0.4829472, -0.8081235, 1, 0.2235294, 0, 1,
-1.696883, 1.014535, -0.5871242, 1, 0.227451, 0, 1,
-1.693747, -1.877037, -3.07443, 1, 0.2352941, 0, 1,
-1.68954, -1.231969, -1.253227, 1, 0.2392157, 0, 1,
-1.682393, 0.3074628, -1.299216, 1, 0.2470588, 0, 1,
-1.674708, -0.5150277, -0.7619192, 1, 0.2509804, 0, 1,
-1.654786, -0.8932396, -1.965947, 1, 0.2588235, 0, 1,
-1.642483, 0.3635837, -1.568357, 1, 0.2627451, 0, 1,
-1.64131, 0.01719755, -1.908365, 1, 0.2705882, 0, 1,
-1.641131, 0.2686222, -1.711145, 1, 0.2745098, 0, 1,
-1.637893, -1.387771, -1.842548, 1, 0.282353, 0, 1,
-1.636433, -0.7377977, -0.225034, 1, 0.2862745, 0, 1,
-1.628895, -0.1954666, -3.171636, 1, 0.2941177, 0, 1,
-1.620604, -1.4917, -2.706076, 1, 0.3019608, 0, 1,
-1.615568, -0.4864679, -1.820017, 1, 0.3058824, 0, 1,
-1.605264, 1.338314, -0.144857, 1, 0.3137255, 0, 1,
-1.5994, 0.3389201, -1.988372, 1, 0.3176471, 0, 1,
-1.581208, 0.4153305, -3.249877, 1, 0.3254902, 0, 1,
-1.576897, -0.2697159, -0.7343588, 1, 0.3294118, 0, 1,
-1.551524, 1.29962, -1.825575, 1, 0.3372549, 0, 1,
-1.550389, 0.7992048, -1.334036, 1, 0.3411765, 0, 1,
-1.548037, 0.486405, -1.326263, 1, 0.3490196, 0, 1,
-1.513458, -0.4428747, -2.641368, 1, 0.3529412, 0, 1,
-1.510213, -0.4548709, -1.897387, 1, 0.3607843, 0, 1,
-1.500629, 0.4034281, -2.226701, 1, 0.3647059, 0, 1,
-1.495561, 1.372729, -1.554468, 1, 0.372549, 0, 1,
-1.488162, -0.2371397, -0.9854541, 1, 0.3764706, 0, 1,
-1.481866, 1.566119, 0.05150921, 1, 0.3843137, 0, 1,
-1.464146, -0.3712764, -2.909703, 1, 0.3882353, 0, 1,
-1.446183, -0.8096573, -1.136965, 1, 0.3960784, 0, 1,
-1.443776, -0.9655966, -3.284731, 1, 0.4039216, 0, 1,
-1.42062, 0.2300741, -3.100363, 1, 0.4078431, 0, 1,
-1.404312, -0.362417, -1.916083, 1, 0.4156863, 0, 1,
-1.401197, 0.4137957, -0.5642054, 1, 0.4196078, 0, 1,
-1.398193, -2.507679, -1.166681, 1, 0.427451, 0, 1,
-1.393677, -0.6705216, -2.160515, 1, 0.4313726, 0, 1,
-1.383066, 0.8325377, 0.3034609, 1, 0.4392157, 0, 1,
-1.379839, -0.942769, -1.787777, 1, 0.4431373, 0, 1,
-1.378887, 0.1026045, -0.4650831, 1, 0.4509804, 0, 1,
-1.370101, 0.3070363, -1.082747, 1, 0.454902, 0, 1,
-1.363175, -0.1846017, -3.02008, 1, 0.4627451, 0, 1,
-1.361988, -0.166289, -1.666172, 1, 0.4666667, 0, 1,
-1.347011, -0.6185802, -1.273216, 1, 0.4745098, 0, 1,
-1.343057, 0.3935128, -1.989613, 1, 0.4784314, 0, 1,
-1.342354, 1.493226, 2.295868, 1, 0.4862745, 0, 1,
-1.341046, 0.1465687, -2.271247, 1, 0.4901961, 0, 1,
-1.303969, 0.694362, -3.0222, 1, 0.4980392, 0, 1,
-1.293157, -1.771374, -3.871473, 1, 0.5058824, 0, 1,
-1.287716, -0.4476257, -0.5789903, 1, 0.509804, 0, 1,
-1.279863, 0.04008192, -1.278159, 1, 0.5176471, 0, 1,
-1.27765, -0.7701184, -1.795504, 1, 0.5215687, 0, 1,
-1.276776, -0.6872638, -1.138251, 1, 0.5294118, 0, 1,
-1.274942, 1.197654, -0.8244339, 1, 0.5333334, 0, 1,
-1.270101, -0.2907757, -0.9424719, 1, 0.5411765, 0, 1,
-1.269923, -0.5481923, -1.211278, 1, 0.5450981, 0, 1,
-1.268799, -0.5159791, -1.451367, 1, 0.5529412, 0, 1,
-1.259593, 0.009189378, -1.247666, 1, 0.5568628, 0, 1,
-1.257137, 1.502324, -1.780592, 1, 0.5647059, 0, 1,
-1.255585, -0.8232307, -2.698494, 1, 0.5686275, 0, 1,
-1.249687, 0.1364799, -2.161541, 1, 0.5764706, 0, 1,
-1.243008, 1.628149, -1.461941, 1, 0.5803922, 0, 1,
-1.228993, 1.319047, 0.2490288, 1, 0.5882353, 0, 1,
-1.225759, -0.4867775, -1.87953, 1, 0.5921569, 0, 1,
-1.221566, 0.318434, -2.976522, 1, 0.6, 0, 1,
-1.219358, -0.8439233, -2.880147, 1, 0.6078432, 0, 1,
-1.216501, 2.156113, -1.965862, 1, 0.6117647, 0, 1,
-1.202319, 0.2860027, 0.3403651, 1, 0.6196079, 0, 1,
-1.199495, 0.5681731, -2.05459, 1, 0.6235294, 0, 1,
-1.199467, 1.173018, -0.4375548, 1, 0.6313726, 0, 1,
-1.194178, 0.6945274, -3.711964, 1, 0.6352941, 0, 1,
-1.191171, 0.5196623, -1.311007, 1, 0.6431373, 0, 1,
-1.187151, 0.4680615, -2.18958, 1, 0.6470588, 0, 1,
-1.181284, 0.4986705, -0.1058911, 1, 0.654902, 0, 1,
-1.17635, -0.3103256, -0.7093751, 1, 0.6588235, 0, 1,
-1.172006, 0.5755926, -0.9331502, 1, 0.6666667, 0, 1,
-1.171195, 0.7791371, -1.982556, 1, 0.6705883, 0, 1,
-1.166739, -0.6596274, -0.1936631, 1, 0.6784314, 0, 1,
-1.152898, -0.5936249, -2.975296, 1, 0.682353, 0, 1,
-1.149239, 0.2596096, -3.912061, 1, 0.6901961, 0, 1,
-1.146722, -0.01813761, -1.231136, 1, 0.6941177, 0, 1,
-1.146275, 0.2755933, -1.030761, 1, 0.7019608, 0, 1,
-1.123239, -0.9738026, -2.725022, 1, 0.7098039, 0, 1,
-1.111425, -0.6396336, -2.868569, 1, 0.7137255, 0, 1,
-1.109699, 0.1330521, 0.5691756, 1, 0.7215686, 0, 1,
-1.091848, -1.230732, -1.918587, 1, 0.7254902, 0, 1,
-1.083611, -0.2309076, -1.467893, 1, 0.7333333, 0, 1,
-1.081453, 2.128303, -0.4075136, 1, 0.7372549, 0, 1,
-1.07783, 1.134167, -0.3054966, 1, 0.7450981, 0, 1,
-1.073444, 0.1261306, -0.621155, 1, 0.7490196, 0, 1,
-1.070757, 0.6608588, -0.7917249, 1, 0.7568628, 0, 1,
-1.065173, -0.9851657, -2.685117, 1, 0.7607843, 0, 1,
-1.065061, -0.891578, -0.9154772, 1, 0.7686275, 0, 1,
-1.062868, -0.4686615, -2.612585, 1, 0.772549, 0, 1,
-1.061823, -0.01046472, -2.189481, 1, 0.7803922, 0, 1,
-1.053742, 1.280566, -0.4571015, 1, 0.7843137, 0, 1,
-1.053575, -0.07476027, -2.42162, 1, 0.7921569, 0, 1,
-1.051347, -0.7089065, -1.376021, 1, 0.7960784, 0, 1,
-1.0494, -0.1295066, -2.755362, 1, 0.8039216, 0, 1,
-1.048282, -0.9874647, -2.026797, 1, 0.8117647, 0, 1,
-1.045218, 0.0002857677, -2.057455, 1, 0.8156863, 0, 1,
-1.044125, -0.4496791, -3.094187, 1, 0.8235294, 0, 1,
-1.042949, 0.5905029, -1.592981, 1, 0.827451, 0, 1,
-1.040824, 0.3964967, -1.162497, 1, 0.8352941, 0, 1,
-1.03524, -0.579719, -2.715109, 1, 0.8392157, 0, 1,
-1.034855, 0.7863734, -1.849121, 1, 0.8470588, 0, 1,
-1.031728, 2.901518, -0.6191972, 1, 0.8509804, 0, 1,
-1.025733, 0.08308087, 0.2179266, 1, 0.8588235, 0, 1,
-1.023033, -0.3492585, -3.559711, 1, 0.8627451, 0, 1,
-1.02283, 0.7130536, -0.2427347, 1, 0.8705882, 0, 1,
-1.018487, -0.7344589, -0.2332888, 1, 0.8745098, 0, 1,
-1.01766, -0.7076456, -1.56951, 1, 0.8823529, 0, 1,
-1.017514, 0.8348004, 0.9168892, 1, 0.8862745, 0, 1,
-1.017199, -0.8933534, -2.494402, 1, 0.8941177, 0, 1,
-1.014162, -1.630706, -3.099012, 1, 0.8980392, 0, 1,
-1.01388, 0.9171377, -1.546195, 1, 0.9058824, 0, 1,
-1.012145, -0.6206347, -5.130908, 1, 0.9137255, 0, 1,
-1.009293, 2.499406, 1.415869, 1, 0.9176471, 0, 1,
-1.006348, -0.6909345, -0.5961363, 1, 0.9254902, 0, 1,
-1.003295, 0.4268653, -2.362779, 1, 0.9294118, 0, 1,
-1.002746, 0.5119984, -1.224796, 1, 0.9372549, 0, 1,
-0.9989188, 0.1462985, -2.521858, 1, 0.9411765, 0, 1,
-0.9948291, 0.6061761, -0.4674063, 1, 0.9490196, 0, 1,
-0.9942939, -0.01224611, -1.306373, 1, 0.9529412, 0, 1,
-0.9940374, -1.383925, -1.837939, 1, 0.9607843, 0, 1,
-0.9886561, 1.177129, -0.9413243, 1, 0.9647059, 0, 1,
-0.9814842, 0.8088421, 0.4545094, 1, 0.972549, 0, 1,
-0.9800456, -0.657859, -2.469165, 1, 0.9764706, 0, 1,
-0.979789, -0.2100933, -1.108151, 1, 0.9843137, 0, 1,
-0.9785952, 0.4037237, -1.340188, 1, 0.9882353, 0, 1,
-0.9770492, 0.9479627, -3.424423, 1, 0.9960784, 0, 1,
-0.9753955, -2.021184, -2.494229, 0.9960784, 1, 0, 1,
-0.9704005, 0.3065206, -0.6246963, 0.9921569, 1, 0, 1,
-0.9679103, -0.3182512, -1.412883, 0.9843137, 1, 0, 1,
-0.9654779, 1.636731, 2.085932, 0.9803922, 1, 0, 1,
-0.9562201, -0.4392264, -0.5634997, 0.972549, 1, 0, 1,
-0.9517779, 0.1830356, -1.21069, 0.9686275, 1, 0, 1,
-0.9472101, 0.1630818, -0.95596, 0.9607843, 1, 0, 1,
-0.9467176, 0.7726848, -1.636198, 0.9568627, 1, 0, 1,
-0.9430055, 0.5704443, -0.8525636, 0.9490196, 1, 0, 1,
-0.9395234, -0.8882034, -2.965501, 0.945098, 1, 0, 1,
-0.9288218, -1.409178, -4.914327, 0.9372549, 1, 0, 1,
-0.9254541, 0.6234244, 0.4075697, 0.9333333, 1, 0, 1,
-0.9248735, 0.6775628, -1.573272, 0.9254902, 1, 0, 1,
-0.9218779, -0.8125029, -1.293927, 0.9215686, 1, 0, 1,
-0.9216766, 1.436799, -0.4248134, 0.9137255, 1, 0, 1,
-0.9184382, 0.1069152, -1.665321, 0.9098039, 1, 0, 1,
-0.9178137, -0.3736963, -2.326128, 0.9019608, 1, 0, 1,
-0.9178094, -0.06508244, -1.889129, 0.8941177, 1, 0, 1,
-0.9140834, -0.3642815, -2.416649, 0.8901961, 1, 0, 1,
-0.9069766, 0.8008426, -0.04620562, 0.8823529, 1, 0, 1,
-0.9067087, -1.417943, -2.810651, 0.8784314, 1, 0, 1,
-0.9056176, -1.196618, -1.337498, 0.8705882, 1, 0, 1,
-0.8965766, -0.5599056, -1.540842, 0.8666667, 1, 0, 1,
-0.8964806, 0.02930123, -0.4784975, 0.8588235, 1, 0, 1,
-0.8964016, 0.8692744, -1.492965, 0.854902, 1, 0, 1,
-0.894085, 1.742995, 0.9671746, 0.8470588, 1, 0, 1,
-0.8923566, 0.9754182, 0.1794752, 0.8431373, 1, 0, 1,
-0.8904549, 0.008052922, -2.822016, 0.8352941, 1, 0, 1,
-0.8868982, -0.6216513, -1.400349, 0.8313726, 1, 0, 1,
-0.8849469, -0.2421888, -0.4671651, 0.8235294, 1, 0, 1,
-0.8840063, -0.8395544, -2.40632, 0.8196079, 1, 0, 1,
-0.8833486, 0.01813766, -3.441468, 0.8117647, 1, 0, 1,
-0.8814001, 0.4055246, -0.1610079, 0.8078431, 1, 0, 1,
-0.8782403, -0.9588901, -2.902283, 0.8, 1, 0, 1,
-0.8764666, -1.142267, -3.146236, 0.7921569, 1, 0, 1,
-0.8651096, 0.5752041, -1.592723, 0.7882353, 1, 0, 1,
-0.8631573, -0.7910489, -3.069653, 0.7803922, 1, 0, 1,
-0.8619525, -0.924054, -3.306034, 0.7764706, 1, 0, 1,
-0.8603988, 1.207382, -0.3761818, 0.7686275, 1, 0, 1,
-0.8508607, 1.299811, -0.2079001, 0.7647059, 1, 0, 1,
-0.8440731, 1.426992, -1.34317, 0.7568628, 1, 0, 1,
-0.838071, 1.498476, -0.5231056, 0.7529412, 1, 0, 1,
-0.8351076, -0.5746451, -4.010767, 0.7450981, 1, 0, 1,
-0.8344823, -0.3978163, -0.6684031, 0.7411765, 1, 0, 1,
-0.8341796, -0.4081959, -3.254526, 0.7333333, 1, 0, 1,
-0.8338444, -0.2726195, -2.544522, 0.7294118, 1, 0, 1,
-0.8320061, -0.7377101, -1.244417, 0.7215686, 1, 0, 1,
-0.8233609, -0.9310738, -2.30132, 0.7176471, 1, 0, 1,
-0.8205093, 0.3716133, -0.6885728, 0.7098039, 1, 0, 1,
-0.8168364, 0.5000912, -1.109574, 0.7058824, 1, 0, 1,
-0.8112034, -1.002904, -3.517678, 0.6980392, 1, 0, 1,
-0.8101332, -1.612685, -2.31005, 0.6901961, 1, 0, 1,
-0.8089038, 0.7078481, -1.252948, 0.6862745, 1, 0, 1,
-0.7989227, 0.1379345, -0.2324703, 0.6784314, 1, 0, 1,
-0.7960745, 0.289718, 0.7851989, 0.6745098, 1, 0, 1,
-0.79401, -1.215287, -1.217125, 0.6666667, 1, 0, 1,
-0.7894264, 1.92559, -0.6131142, 0.6627451, 1, 0, 1,
-0.7891592, -0.1925178, -1.086456, 0.654902, 1, 0, 1,
-0.7862125, -0.09376047, -2.447373, 0.6509804, 1, 0, 1,
-0.7856762, 1.093363, -3.212597, 0.6431373, 1, 0, 1,
-0.7764233, 0.3321163, -1.650128, 0.6392157, 1, 0, 1,
-0.7746731, -1.113325, -2.025869, 0.6313726, 1, 0, 1,
-0.7665715, -0.9540365, -2.511973, 0.627451, 1, 0, 1,
-0.7623436, -0.5457495, -3.135261, 0.6196079, 1, 0, 1,
-0.7550981, -0.1699548, 0.1451391, 0.6156863, 1, 0, 1,
-0.7477847, -1.264335, -2.444288, 0.6078432, 1, 0, 1,
-0.7477113, -0.9141462, -1.894177, 0.6039216, 1, 0, 1,
-0.7434483, -0.8713064, -2.769031, 0.5960785, 1, 0, 1,
-0.7415667, 1.303427, 0.5580498, 0.5882353, 1, 0, 1,
-0.7406456, -1.256742, -3.210217, 0.5843138, 1, 0, 1,
-0.7392769, 1.482319, 0.4889163, 0.5764706, 1, 0, 1,
-0.7329732, -1.794341, -4.342983, 0.572549, 1, 0, 1,
-0.7325723, 0.318881, -1.554306, 0.5647059, 1, 0, 1,
-0.7275738, 1.265514, -1.265332, 0.5607843, 1, 0, 1,
-0.7235591, -0.2359267, -2.478902, 0.5529412, 1, 0, 1,
-0.722462, -0.4544722, -4.077226, 0.5490196, 1, 0, 1,
-0.7220852, -0.3498611, -3.311303, 0.5411765, 1, 0, 1,
-0.7203255, 0.7920778, -0.6512751, 0.5372549, 1, 0, 1,
-0.7184681, 0.8105605, -0.3276827, 0.5294118, 1, 0, 1,
-0.7171966, 1.658316, -0.9999485, 0.5254902, 1, 0, 1,
-0.7165207, -0.9164481, -1.759243, 0.5176471, 1, 0, 1,
-0.7146913, -0.910824, -3.762069, 0.5137255, 1, 0, 1,
-0.7114144, -0.4300783, -3.022106, 0.5058824, 1, 0, 1,
-0.7103893, 1.381401, -0.1385739, 0.5019608, 1, 0, 1,
-0.7082991, -0.3564015, -1.642848, 0.4941176, 1, 0, 1,
-0.7072216, 2.199235, 1.120756, 0.4862745, 1, 0, 1,
-0.7071634, -0.997932, -3.326635, 0.4823529, 1, 0, 1,
-0.7017899, 0.1821246, 0.169152, 0.4745098, 1, 0, 1,
-0.7010756, 1.215309, -0.5040868, 0.4705882, 1, 0, 1,
-0.6990765, -0.9795826, -2.262545, 0.4627451, 1, 0, 1,
-0.6925397, -1.739045, -3.681959, 0.4588235, 1, 0, 1,
-0.6914172, -0.8848646, -2.589051, 0.4509804, 1, 0, 1,
-0.6894476, -1.02173, -2.675053, 0.4470588, 1, 0, 1,
-0.6861693, -0.3481377, -2.624833, 0.4392157, 1, 0, 1,
-0.6801511, -0.0419455, 0.2044751, 0.4352941, 1, 0, 1,
-0.6794426, -0.3947757, -2.416653, 0.427451, 1, 0, 1,
-0.6780915, -0.4366554, -0.6263577, 0.4235294, 1, 0, 1,
-0.6755974, 0.1406577, -0.888949, 0.4156863, 1, 0, 1,
-0.6741441, 0.1959111, -1.642493, 0.4117647, 1, 0, 1,
-0.6717713, -2.6505, -3.883813, 0.4039216, 1, 0, 1,
-0.6682974, 0.0491477, -2.394982, 0.3960784, 1, 0, 1,
-0.6680468, -1.109497, -3.631921, 0.3921569, 1, 0, 1,
-0.6678946, 0.7661657, 0.6259483, 0.3843137, 1, 0, 1,
-0.6626482, 1.334298, -1.277008, 0.3803922, 1, 0, 1,
-0.6574382, -0.7174127, -1.862248, 0.372549, 1, 0, 1,
-0.6549566, -0.4003389, -0.774445, 0.3686275, 1, 0, 1,
-0.6544828, -0.4033243, -2.977245, 0.3607843, 1, 0, 1,
-0.6490521, 0.1417484, -4.123609, 0.3568628, 1, 0, 1,
-0.6488925, 0.1362537, -2.108527, 0.3490196, 1, 0, 1,
-0.6487449, 0.9492242, -0.5166439, 0.345098, 1, 0, 1,
-0.6477135, -0.01894866, -2.01077, 0.3372549, 1, 0, 1,
-0.6463344, 0.3570299, -0.5591712, 0.3333333, 1, 0, 1,
-0.6427069, 2.029588, -1.00567, 0.3254902, 1, 0, 1,
-0.6405417, -0.2477424, -2.710479, 0.3215686, 1, 0, 1,
-0.6393198, -0.0287422, -1.372975, 0.3137255, 1, 0, 1,
-0.6296072, 0.8281695, -1.098037, 0.3098039, 1, 0, 1,
-0.6257853, 1.438244, 1.261534, 0.3019608, 1, 0, 1,
-0.6257484, 0.5502872, -0.1099415, 0.2941177, 1, 0, 1,
-0.6252313, -0.01910228, -2.575053, 0.2901961, 1, 0, 1,
-0.6211538, -1.75048, -2.719071, 0.282353, 1, 0, 1,
-0.6179002, 0.4877845, -2.762998, 0.2784314, 1, 0, 1,
-0.6168758, -0.7476359, -2.367826, 0.2705882, 1, 0, 1,
-0.6137032, -0.2545197, -2.033695, 0.2666667, 1, 0, 1,
-0.6125727, -1.374845, -4.084099, 0.2588235, 1, 0, 1,
-0.6093414, -1.690102, -0.6753491, 0.254902, 1, 0, 1,
-0.6048448, -0.2687876, -2.063098, 0.2470588, 1, 0, 1,
-0.6046112, -0.9898703, -0.324299, 0.2431373, 1, 0, 1,
-0.6023108, 0.3495294, -2.170269, 0.2352941, 1, 0, 1,
-0.5992528, -0.833158, -2.00287, 0.2313726, 1, 0, 1,
-0.5862734, 1.468453, -0.4709642, 0.2235294, 1, 0, 1,
-0.5789965, 1.730099, -1.297087, 0.2196078, 1, 0, 1,
-0.5767515, -0.6009648, -1.276067, 0.2117647, 1, 0, 1,
-0.5747042, -0.5052211, -2.249781, 0.2078431, 1, 0, 1,
-0.5710961, 1.800832, -1.16554, 0.2, 1, 0, 1,
-0.5709011, -0.09112801, -2.42543, 0.1921569, 1, 0, 1,
-0.5701554, -0.5792049, -1.538005, 0.1882353, 1, 0, 1,
-0.5697957, -0.5769375, -2.730306, 0.1803922, 1, 0, 1,
-0.5659008, -0.8153145, -4.246591, 0.1764706, 1, 0, 1,
-0.5657219, -1.022166, -2.530435, 0.1686275, 1, 0, 1,
-0.5628134, 1.347826, -0.1921224, 0.1647059, 1, 0, 1,
-0.5596465, 1.287317, -1.803762, 0.1568628, 1, 0, 1,
-0.5584009, 0.2681611, -1.265904, 0.1529412, 1, 0, 1,
-0.5583827, 0.7031162, 0.8598466, 0.145098, 1, 0, 1,
-0.5518386, 0.8613426, 1.516574, 0.1411765, 1, 0, 1,
-0.5500771, 2.511283, -1.229123, 0.1333333, 1, 0, 1,
-0.5482044, -0.3210746, -3.710677, 0.1294118, 1, 0, 1,
-0.5404589, 0.9401546, 0.2105001, 0.1215686, 1, 0, 1,
-0.5392157, -0.5299462, -1.984568, 0.1176471, 1, 0, 1,
-0.5266358, -0.8388074, -2.448173, 0.1098039, 1, 0, 1,
-0.5264352, -0.001837891, -2.012102, 0.1058824, 1, 0, 1,
-0.5256011, 0.02501042, -2.851975, 0.09803922, 1, 0, 1,
-0.5247939, -1.515264, -3.386902, 0.09019608, 1, 0, 1,
-0.5238114, 1.724672, 0.7306904, 0.08627451, 1, 0, 1,
-0.5213957, -0.2757466, -1.670211, 0.07843138, 1, 0, 1,
-0.5210636, -1.78395, -2.703372, 0.07450981, 1, 0, 1,
-0.5196748, 0.4142117, -0.3579153, 0.06666667, 1, 0, 1,
-0.5188582, 0.233319, -1.727113, 0.0627451, 1, 0, 1,
-0.5171022, 1.169713, -1.328919, 0.05490196, 1, 0, 1,
-0.5167703, -1.75647, -2.226971, 0.05098039, 1, 0, 1,
-0.5146767, -0.1347528, -1.617159, 0.04313726, 1, 0, 1,
-0.5102823, -1.22973, -3.703846, 0.03921569, 1, 0, 1,
-0.5097583, 1.050116, 0.5330602, 0.03137255, 1, 0, 1,
-0.5073423, -1.21914, -3.828916, 0.02745098, 1, 0, 1,
-0.5063665, -1.20839, -4.230113, 0.01960784, 1, 0, 1,
-0.5046828, 1.331355, -0.9155237, 0.01568628, 1, 0, 1,
-0.5038303, -0.705102, -1.460557, 0.007843138, 1, 0, 1,
-0.5033045, 0.8113583, -1.013815, 0.003921569, 1, 0, 1,
-0.4997639, 0.586963, -1.200429, 0, 1, 0.003921569, 1,
-0.4988974, -0.7377957, -1.438306, 0, 1, 0.01176471, 1,
-0.4972437, -1.170223, -3.305045, 0, 1, 0.01568628, 1,
-0.4933389, -1.038211, -3.731512, 0, 1, 0.02352941, 1,
-0.4904575, -0.6537972, -0.3579277, 0, 1, 0.02745098, 1,
-0.4899542, -0.4825335, -0.8270345, 0, 1, 0.03529412, 1,
-0.4892144, 1.380556, -1.101718, 0, 1, 0.03921569, 1,
-0.4838898, 0.5753285, 0.2900495, 0, 1, 0.04705882, 1,
-0.4798185, 0.4664981, 0.337402, 0, 1, 0.05098039, 1,
-0.4783275, -0.5730121, -4.054801, 0, 1, 0.05882353, 1,
-0.4754949, 1.007643, -0.7345612, 0, 1, 0.0627451, 1,
-0.4751699, -1.01546, -3.416511, 0, 1, 0.07058824, 1,
-0.4626254, -0.03260043, -4.074509, 0, 1, 0.07450981, 1,
-0.4622963, 1.135665, -1.166115, 0, 1, 0.08235294, 1,
-0.4605829, 0.2867507, -0.9838321, 0, 1, 0.08627451, 1,
-0.4576005, 0.002707308, -1.251773, 0, 1, 0.09411765, 1,
-0.4572912, -1.457718, -1.367974, 0, 1, 0.1019608, 1,
-0.4471148, -0.1703806, -0.08466969, 0, 1, 0.1058824, 1,
-0.4445809, 0.0132993, -0.03244494, 0, 1, 0.1137255, 1,
-0.4440904, -0.8501572, -3.647529, 0, 1, 0.1176471, 1,
-0.4421261, -0.735004, -4.575337, 0, 1, 0.1254902, 1,
-0.4370706, -0.1325321, -1.668487, 0, 1, 0.1294118, 1,
-0.4367395, -0.8092394, -3.713511, 0, 1, 0.1372549, 1,
-0.4321164, -1.610033, -3.397419, 0, 1, 0.1411765, 1,
-0.429864, 1.305627, -0.1019741, 0, 1, 0.1490196, 1,
-0.4210157, 1.446096, 0.5394978, 0, 1, 0.1529412, 1,
-0.4197865, 0.776375, -0.08146083, 0, 1, 0.1607843, 1,
-0.4108775, -0.1917624, -3.133049, 0, 1, 0.1647059, 1,
-0.4103487, -0.1565411, -3.87817, 0, 1, 0.172549, 1,
-0.4101921, -0.5135813, -1.329498, 0, 1, 0.1764706, 1,
-0.4088698, 0.8735724, -1.816335, 0, 1, 0.1843137, 1,
-0.4075628, -2.234158, -2.936221, 0, 1, 0.1882353, 1,
-0.4063214, -0.7744139, -2.439686, 0, 1, 0.1960784, 1,
-0.4048904, 0.172438, -2.28533, 0, 1, 0.2039216, 1,
-0.4026883, -1.887547, -3.502808, 0, 1, 0.2078431, 1,
-0.3957831, 0.2701677, -2.098196, 0, 1, 0.2156863, 1,
-0.393751, 0.4981452, 0.004135835, 0, 1, 0.2196078, 1,
-0.3923146, -0.169371, -2.086605, 0, 1, 0.227451, 1,
-0.388591, 0.6641933, -0.07362456, 0, 1, 0.2313726, 1,
-0.3842596, 1.86273, -1.23453, 0, 1, 0.2392157, 1,
-0.3841791, 0.03773852, -0.5288656, 0, 1, 0.2431373, 1,
-0.3824431, 0.1829422, -0.8764732, 0, 1, 0.2509804, 1,
-0.3788666, -1.024294, -2.140406, 0, 1, 0.254902, 1,
-0.3763727, -0.5981365, -2.919498, 0, 1, 0.2627451, 1,
-0.375946, 2.826716, -1.391182, 0, 1, 0.2666667, 1,
-0.3731973, -1.203387, -2.115938, 0, 1, 0.2745098, 1,
-0.3712584, 1.917507, 0.002376842, 0, 1, 0.2784314, 1,
-0.3689888, 1.750008, 0.228399, 0, 1, 0.2862745, 1,
-0.3655396, -0.01466171, -0.3131903, 0, 1, 0.2901961, 1,
-0.3637157, 0.5982955, -0.1544197, 0, 1, 0.2980392, 1,
-0.3589703, -0.244568, -2.631656, 0, 1, 0.3058824, 1,
-0.355874, 1.193641, -0.8662816, 0, 1, 0.3098039, 1,
-0.3544826, 0.6396306, 0.2145723, 0, 1, 0.3176471, 1,
-0.350771, -0.3770444, -2.750283, 0, 1, 0.3215686, 1,
-0.3480123, -0.7554646, -2.83795, 0, 1, 0.3294118, 1,
-0.3472118, 0.2364547, -1.013805, 0, 1, 0.3333333, 1,
-0.3450455, 0.8643619, -0.1700316, 0, 1, 0.3411765, 1,
-0.3440123, 1.233501, -0.1723512, 0, 1, 0.345098, 1,
-0.3427567, 0.7086592, -1.348283, 0, 1, 0.3529412, 1,
-0.3426935, -3.432697, -3.565986, 0, 1, 0.3568628, 1,
-0.3358186, -0.1346211, -2.243162, 0, 1, 0.3647059, 1,
-0.3332943, -1.054225, -2.979624, 0, 1, 0.3686275, 1,
-0.3325126, -0.02627741, -2.010031, 0, 1, 0.3764706, 1,
-0.3318698, -0.9405515, -3.383175, 0, 1, 0.3803922, 1,
-0.3267877, -0.6121675, -3.650724, 0, 1, 0.3882353, 1,
-0.3211139, 0.2418387, -1.586381, 0, 1, 0.3921569, 1,
-0.3181078, 0.8477934, -1.297012, 0, 1, 0.4, 1,
-0.3179106, -0.776194, -2.983126, 0, 1, 0.4078431, 1,
-0.3177559, -0.1065195, -2.571384, 0, 1, 0.4117647, 1,
-0.3166226, 1.096152, -0.4531859, 0, 1, 0.4196078, 1,
-0.3140884, -0.8813875, -5.033647, 0, 1, 0.4235294, 1,
-0.3091932, -2.213228, -2.391407, 0, 1, 0.4313726, 1,
-0.3067055, 0.3195603, -1.248924, 0, 1, 0.4352941, 1,
-0.3030328, 0.9197108, 0.5406942, 0, 1, 0.4431373, 1,
-0.2987958, 0.1113279, -0.8670909, 0, 1, 0.4470588, 1,
-0.2963994, -0.3115824, -2.494404, 0, 1, 0.454902, 1,
-0.2958447, 0.1020597, -1.444373, 0, 1, 0.4588235, 1,
-0.2954312, -0.2244052, -2.018624, 0, 1, 0.4666667, 1,
-0.294551, 0.4155842, 1.054787, 0, 1, 0.4705882, 1,
-0.2929445, -0.8069641, -2.622715, 0, 1, 0.4784314, 1,
-0.2923148, -0.08889928, -2.682757, 0, 1, 0.4823529, 1,
-0.2826718, -0.5338171, -2.737149, 0, 1, 0.4901961, 1,
-0.2810374, -0.1704748, -3.538782, 0, 1, 0.4941176, 1,
-0.2804236, 1.079443, -1.013983, 0, 1, 0.5019608, 1,
-0.2786272, 0.6731972, 0.9411608, 0, 1, 0.509804, 1,
-0.2744198, 0.05936613, -1.195108, 0, 1, 0.5137255, 1,
-0.2698437, 0.2411037, -1.333099, 0, 1, 0.5215687, 1,
-0.2690693, 1.926284, -0.02017838, 0, 1, 0.5254902, 1,
-0.2631677, 0.217561, -1.100946, 0, 1, 0.5333334, 1,
-0.262417, 1.690332, 0.04459643, 0, 1, 0.5372549, 1,
-0.2562157, 0.750828, 0.08919949, 0, 1, 0.5450981, 1,
-0.2552072, 0.8826019, 0.5754369, 0, 1, 0.5490196, 1,
-0.2540958, -0.5130317, -3.103464, 0, 1, 0.5568628, 1,
-0.252301, 0.7580977, 1.44842, 0, 1, 0.5607843, 1,
-0.2508415, 0.4930753, -1.431222, 0, 1, 0.5686275, 1,
-0.2473211, 0.6237569, -1.943045, 0, 1, 0.572549, 1,
-0.2426018, 0.8247232, 0.4313974, 0, 1, 0.5803922, 1,
-0.2245138, 0.882129, 0.9136907, 0, 1, 0.5843138, 1,
-0.2237077, -0.1727464, -1.646709, 0, 1, 0.5921569, 1,
-0.2214929, 0.6596351, -1.365193, 0, 1, 0.5960785, 1,
-0.2210126, -0.07614102, -2.247391, 0, 1, 0.6039216, 1,
-0.2183317, -0.07641622, -3.822587, 0, 1, 0.6117647, 1,
-0.2181375, -0.3017386, -4.346884, 0, 1, 0.6156863, 1,
-0.217301, 0.440738, -1.49376, 0, 1, 0.6235294, 1,
-0.2082662, 1.8837, 0.09167466, 0, 1, 0.627451, 1,
-0.205175, -0.09406164, -1.243323, 0, 1, 0.6352941, 1,
-0.1976403, 0.170259, 0.5626087, 0, 1, 0.6392157, 1,
-0.195815, -0.2685192, -2.347312, 0, 1, 0.6470588, 1,
-0.1933781, 0.2212064, 0.1305132, 0, 1, 0.6509804, 1,
-0.1932582, -0.3946387, -2.329895, 0, 1, 0.6588235, 1,
-0.1918659, 0.9338059, 0.7705255, 0, 1, 0.6627451, 1,
-0.1894958, -0.9210594, -2.62825, 0, 1, 0.6705883, 1,
-0.1886004, 1.66226, -1.416787, 0, 1, 0.6745098, 1,
-0.185316, -1.143312, -2.514058, 0, 1, 0.682353, 1,
-0.1846436, 0.6241659, -0.4607888, 0, 1, 0.6862745, 1,
-0.1828016, 1.1766, -0.3793494, 0, 1, 0.6941177, 1,
-0.1779472, -1.330491, -2.345691, 0, 1, 0.7019608, 1,
-0.1770412, 1.172435, -0.459566, 0, 1, 0.7058824, 1,
-0.1719459, 0.454353, -0.4398938, 0, 1, 0.7137255, 1,
-0.171443, -0.6590115, -1.715393, 0, 1, 0.7176471, 1,
-0.1574531, 0.1782908, -1.202623, 0, 1, 0.7254902, 1,
-0.1554788, -1.249785, -4.535601, 0, 1, 0.7294118, 1,
-0.1537361, 0.09647127, -1.093881, 0, 1, 0.7372549, 1,
-0.1530502, -0.5600486, -1.4888, 0, 1, 0.7411765, 1,
-0.1521843, -0.2537035, -3.828382, 0, 1, 0.7490196, 1,
-0.150744, -1.502239, -4.220089, 0, 1, 0.7529412, 1,
-0.146769, -0.1407408, -2.699673, 0, 1, 0.7607843, 1,
-0.1449, -0.2368244, -3.646723, 0, 1, 0.7647059, 1,
-0.1404952, 1.10245, 0.8039064, 0, 1, 0.772549, 1,
-0.1402626, -0.473801, -4.353418, 0, 1, 0.7764706, 1,
-0.1381534, -0.8384164, -1.821615, 0, 1, 0.7843137, 1,
-0.1358505, 1.404197, 0.2222199, 0, 1, 0.7882353, 1,
-0.1331619, 0.8391309, -1.794498, 0, 1, 0.7960784, 1,
-0.1283626, -0.3599226, -2.722709, 0, 1, 0.8039216, 1,
-0.1260947, 0.6952614, 1.268341, 0, 1, 0.8078431, 1,
-0.120911, 0.09204377, -2.510375, 0, 1, 0.8156863, 1,
-0.1203713, -1.103231, -5.14415, 0, 1, 0.8196079, 1,
-0.1191573, 0.09459117, 0.4174425, 0, 1, 0.827451, 1,
-0.1153, -0.9867001, -4.757145, 0, 1, 0.8313726, 1,
-0.1139683, -0.768598, -2.758864, 0, 1, 0.8392157, 1,
-0.1108659, -0.05713449, -1.696883, 0, 1, 0.8431373, 1,
-0.1099377, -0.4734757, -2.281761, 0, 1, 0.8509804, 1,
-0.1084525, -0.8070362, -3.982983, 0, 1, 0.854902, 1,
-0.1038974, 0.4443831, 0.2422765, 0, 1, 0.8627451, 1,
-0.1030266, -1.011029, -3.352288, 0, 1, 0.8666667, 1,
-0.1019581, 1.300972, -1.323852, 0, 1, 0.8745098, 1,
-0.09741372, 1.588762, -2.195115, 0, 1, 0.8784314, 1,
-0.09350459, 1.030825, 0.9334221, 0, 1, 0.8862745, 1,
-0.09243773, 0.01589964, 0.3294635, 0, 1, 0.8901961, 1,
-0.08452532, -1.774059, -2.150789, 0, 1, 0.8980392, 1,
-0.08403429, 0.607774, -0.2928401, 0, 1, 0.9058824, 1,
-0.0828802, 0.3692905, -1.970301, 0, 1, 0.9098039, 1,
-0.07793806, 0.2909864, -1.32493, 0, 1, 0.9176471, 1,
-0.07712675, 1.572245, 1.059601, 0, 1, 0.9215686, 1,
-0.07402452, 1.280155, -1.391362, 0, 1, 0.9294118, 1,
-0.07291947, 0.3865213, -0.2167148, 0, 1, 0.9333333, 1,
-0.07241759, -1.468326, -2.41133, 0, 1, 0.9411765, 1,
-0.0703542, 0.1327058, -0.6674538, 0, 1, 0.945098, 1,
-0.07018699, -0.1021441, -1.807377, 0, 1, 0.9529412, 1,
-0.06801338, 0.01478461, -1.855082, 0, 1, 0.9568627, 1,
-0.06741016, -1.826762, -3.550722, 0, 1, 0.9647059, 1,
-0.06304117, -0.3271105, -1.856802, 0, 1, 0.9686275, 1,
-0.06259634, -1.51515, -2.597476, 0, 1, 0.9764706, 1,
-0.05636541, -0.397085, -0.9025291, 0, 1, 0.9803922, 1,
-0.05254357, -1.161547, -2.919487, 0, 1, 0.9882353, 1,
-0.04966173, 0.8250737, -0.8283173, 0, 1, 0.9921569, 1,
-0.040386, 0.0751195, 0.3437671, 0, 1, 1, 1,
-0.03318771, -0.465772, -5.302396, 0, 0.9921569, 1, 1,
-0.03020968, -1.434515, -3.456091, 0, 0.9882353, 1, 1,
-0.02844705, -0.1489446, -3.597599, 0, 0.9803922, 1, 1,
-0.02299662, 0.7557915, 0.3132376, 0, 0.9764706, 1, 1,
-0.02253897, -0.1152723, -3.800087, 0, 0.9686275, 1, 1,
-0.02125159, 2.320153, 1.387968, 0, 0.9647059, 1, 1,
-0.01913859, -0.3515557, -2.90128, 0, 0.9568627, 1, 1,
-0.01686492, -0.9984214, -2.21154, 0, 0.9529412, 1, 1,
-0.01403905, -1.784578, -2.391922, 0, 0.945098, 1, 1,
-0.01344956, -0.5381864, -3.131852, 0, 0.9411765, 1, 1,
-0.01035751, 1.94443, 0.3389426, 0, 0.9333333, 1, 1,
-0.005864423, -0.6329629, -3.374331, 0, 0.9294118, 1, 1,
-0.005646663, -1.013785, -4.157919, 0, 0.9215686, 1, 1,
-0.004220278, -0.2977033, -4.329687, 0, 0.9176471, 1, 1,
0.002156553, 0.7095367, -0.06856347, 0, 0.9098039, 1, 1,
0.005454131, 0.6159587, 0.9508591, 0, 0.9058824, 1, 1,
0.00559869, -0.6508089, 1.83569, 0, 0.8980392, 1, 1,
0.005949714, 1.181934, -0.2279261, 0, 0.8901961, 1, 1,
0.006734592, 0.9369591, 1.375869, 0, 0.8862745, 1, 1,
0.007272943, 1.502727, -0.09929497, 0, 0.8784314, 1, 1,
0.009387561, -1.150931, 3.050092, 0, 0.8745098, 1, 1,
0.01042068, -2.147303, 4.38261, 0, 0.8666667, 1, 1,
0.01548557, -1.997255, 2.32538, 0, 0.8627451, 1, 1,
0.02104497, -0.1827378, 2.548585, 0, 0.854902, 1, 1,
0.02161056, -0.6121935, 2.600971, 0, 0.8509804, 1, 1,
0.02340003, 1.491982, -0.1203691, 0, 0.8431373, 1, 1,
0.02361129, 0.181622, -0.5045828, 0, 0.8392157, 1, 1,
0.0258909, 0.7553766, -0.4006148, 0, 0.8313726, 1, 1,
0.02963445, 0.1096042, 0.7840192, 0, 0.827451, 1, 1,
0.03916288, -1.297082, 4.025833, 0, 0.8196079, 1, 1,
0.0397396, -0.6501873, 2.69908, 0, 0.8156863, 1, 1,
0.04933583, -1.108528, 2.490857, 0, 0.8078431, 1, 1,
0.05530807, -0.6916829, 3.069081, 0, 0.8039216, 1, 1,
0.05558231, 0.4130626, -0.197527, 0, 0.7960784, 1, 1,
0.05705696, -0.4666441, 2.917164, 0, 0.7882353, 1, 1,
0.05753564, 1.628941, 1.108885, 0, 0.7843137, 1, 1,
0.0623928, 1.056799, 0.3191449, 0, 0.7764706, 1, 1,
0.06641841, -0.4442007, 3.071763, 0, 0.772549, 1, 1,
0.07387871, 0.2692651, -1.577664, 0, 0.7647059, 1, 1,
0.07406871, -2.111783, 2.789588, 0, 0.7607843, 1, 1,
0.07742354, 1.64703, -0.5339282, 0, 0.7529412, 1, 1,
0.08092339, -1.015845, 4.75885, 0, 0.7490196, 1, 1,
0.08272047, 0.5303628, 0.990501, 0, 0.7411765, 1, 1,
0.08610439, -0.7491135, 3.738195, 0, 0.7372549, 1, 1,
0.08706681, 1.188143, 1.725456, 0, 0.7294118, 1, 1,
0.0880731, 2.669756, 0.9954137, 0, 0.7254902, 1, 1,
0.09072292, -0.8685164, 1.778708, 0, 0.7176471, 1, 1,
0.09139563, 0.4383205, -0.1180033, 0, 0.7137255, 1, 1,
0.09477813, 2.998594, 0.2949167, 0, 0.7058824, 1, 1,
0.09621015, -1.57578, 3.982984, 0, 0.6980392, 1, 1,
0.09647091, 1.45986, -0.3246898, 0, 0.6941177, 1, 1,
0.09828971, 1.265794, 0.5877221, 0, 0.6862745, 1, 1,
0.09983665, 0.1283334, 1.098648, 0, 0.682353, 1, 1,
0.1011905, 0.1635532, 1.035517, 0, 0.6745098, 1, 1,
0.110315, 0.2235511, 1.555404, 0, 0.6705883, 1, 1,
0.1125525, -2.745499, 4.014904, 0, 0.6627451, 1, 1,
0.1148669, -0.1154571, 3.743461, 0, 0.6588235, 1, 1,
0.1153425, 1.695229, 0.5798736, 0, 0.6509804, 1, 1,
0.1175335, -0.3931687, 2.461052, 0, 0.6470588, 1, 1,
0.1207082, 0.5108844, -0.1910457, 0, 0.6392157, 1, 1,
0.1210055, -0.482098, 1.885901, 0, 0.6352941, 1, 1,
0.1216353, 0.1401446, 1.653965, 0, 0.627451, 1, 1,
0.1236273, -0.7946217, 2.233611, 0, 0.6235294, 1, 1,
0.1281078, 0.4893424, 0.518952, 0, 0.6156863, 1, 1,
0.1310496, 1.70229, 0.3310642, 0, 0.6117647, 1, 1,
0.1358446, 2.202567, -0.1642615, 0, 0.6039216, 1, 1,
0.1418005, -1.772499, -0.3975682, 0, 0.5960785, 1, 1,
0.1421808, 0.3459713, -0.1867226, 0, 0.5921569, 1, 1,
0.147253, -0.3091899, 5.308021, 0, 0.5843138, 1, 1,
0.1477173, 0.3541555, 0.1617478, 0, 0.5803922, 1, 1,
0.1529057, 0.04507324, 2.037932, 0, 0.572549, 1, 1,
0.1658185, -0.1437186, 2.051116, 0, 0.5686275, 1, 1,
0.1659278, -1.11838, 1.970713, 0, 0.5607843, 1, 1,
0.1772876, 0.09172072, 2.517191, 0, 0.5568628, 1, 1,
0.1800585, -0.7940354, 2.99776, 0, 0.5490196, 1, 1,
0.1860327, 1.370877, 0.2718247, 0, 0.5450981, 1, 1,
0.1893521, 1.491954, 3.279902, 0, 0.5372549, 1, 1,
0.1920392, 1.23884, 0.7067026, 0, 0.5333334, 1, 1,
0.1959012, -0.01506515, 1.622759, 0, 0.5254902, 1, 1,
0.1966506, -0.7145066, 2.721318, 0, 0.5215687, 1, 1,
0.2002013, -0.3052792, 4.148915, 0, 0.5137255, 1, 1,
0.2021774, 0.9199969, 2.799375, 0, 0.509804, 1, 1,
0.2100938, 0.05073827, -0.3257305, 0, 0.5019608, 1, 1,
0.2103772, 0.5114197, 0.7806388, 0, 0.4941176, 1, 1,
0.2103894, -1.172348, 2.639231, 0, 0.4901961, 1, 1,
0.2130766, 0.9847375, -1.489598, 0, 0.4823529, 1, 1,
0.2174221, 0.2444883, 2.426951, 0, 0.4784314, 1, 1,
0.2183585, 0.2225294, 1.576985, 0, 0.4705882, 1, 1,
0.2189244, 0.845234, -0.03606128, 0, 0.4666667, 1, 1,
0.2204151, -1.145589, 3.551127, 0, 0.4588235, 1, 1,
0.2256973, 0.2845879, 0.4331578, 0, 0.454902, 1, 1,
0.2320538, -0.628668, 3.354634, 0, 0.4470588, 1, 1,
0.2336951, -1.247811, 1.548587, 0, 0.4431373, 1, 1,
0.236508, 0.4151758, 1.614134, 0, 0.4352941, 1, 1,
0.2384136, 0.747416, -1.105962, 0, 0.4313726, 1, 1,
0.2416419, -2.264453, 2.295227, 0, 0.4235294, 1, 1,
0.2460982, -1.465788, 3.373488, 0, 0.4196078, 1, 1,
0.2461225, -0.1641158, 3.014894, 0, 0.4117647, 1, 1,
0.251463, 0.2430022, 3.005644, 0, 0.4078431, 1, 1,
0.2575195, -1.082468, 2.905294, 0, 0.4, 1, 1,
0.2674892, 0.1405748, 0.7075626, 0, 0.3921569, 1, 1,
0.2815048, 0.656862, -0.2601979, 0, 0.3882353, 1, 1,
0.2909394, -1.764264, 3.923526, 0, 0.3803922, 1, 1,
0.2914546, 1.066925, 0.05845081, 0, 0.3764706, 1, 1,
0.2928184, -2.424957, 3.156805, 0, 0.3686275, 1, 1,
0.2955576, 2.219126, 0.1171104, 0, 0.3647059, 1, 1,
0.3000225, -0.03294352, -0.6895248, 0, 0.3568628, 1, 1,
0.3088006, 0.4843411, -1.473203, 0, 0.3529412, 1, 1,
0.309623, 0.8401771, -0.9219142, 0, 0.345098, 1, 1,
0.3139445, -0.9706982, 3.130192, 0, 0.3411765, 1, 1,
0.3168136, 1.041879, -0.661401, 0, 0.3333333, 1, 1,
0.3185037, 1.057422, 1.31261, 0, 0.3294118, 1, 1,
0.3207726, 0.5386515, -0.4319848, 0, 0.3215686, 1, 1,
0.3269109, 0.1312539, -0.06926468, 0, 0.3176471, 1, 1,
0.3273776, 1.331205, 1.752724, 0, 0.3098039, 1, 1,
0.3274714, 1.047225, 0.4250883, 0, 0.3058824, 1, 1,
0.3292929, -0.3157525, 1.851789, 0, 0.2980392, 1, 1,
0.3336672, 0.003810495, 2.384785, 0, 0.2901961, 1, 1,
0.3408752, 1.107455, -0.2800985, 0, 0.2862745, 1, 1,
0.3412732, -0.520722, 1.075209, 0, 0.2784314, 1, 1,
0.3432022, 2.015023, -0.6280357, 0, 0.2745098, 1, 1,
0.3488467, 1.507323, -0.06652676, 0, 0.2666667, 1, 1,
0.3532552, 0.1601783, -0.05458511, 0, 0.2627451, 1, 1,
0.3566247, 0.2031231, -0.3530805, 0, 0.254902, 1, 1,
0.3571901, 1.023076, -0.8682573, 0, 0.2509804, 1, 1,
0.3622206, 1.091606, 1.855566, 0, 0.2431373, 1, 1,
0.3643937, -0.8535573, 2.882048, 0, 0.2392157, 1, 1,
0.3684365, 0.3027057, 1.509949, 0, 0.2313726, 1, 1,
0.368813, 0.7915821, 0.2522061, 0, 0.227451, 1, 1,
0.3704823, 0.4642465, 0.9203129, 0, 0.2196078, 1, 1,
0.3717249, 1.221415, -0.6270786, 0, 0.2156863, 1, 1,
0.3738923, 0.7161335, -1.798901, 0, 0.2078431, 1, 1,
0.3741154, -1.93114, 4.030211, 0, 0.2039216, 1, 1,
0.3748285, -0.4654949, 0.9704447, 0, 0.1960784, 1, 1,
0.3754027, -0.9694681, 4.367762, 0, 0.1882353, 1, 1,
0.3770346, 0.3759096, 2.482987, 0, 0.1843137, 1, 1,
0.3798864, -0.3478341, 1.536318, 0, 0.1764706, 1, 1,
0.3864345, -0.04800289, 1.2202, 0, 0.172549, 1, 1,
0.3875455, -1.478922, 3.859105, 0, 0.1647059, 1, 1,
0.3896725, -0.5099169, 3.229316, 0, 0.1607843, 1, 1,
0.3900841, 0.1360949, 1.14386, 0, 0.1529412, 1, 1,
0.3930306, 0.6183977, -0.3336204, 0, 0.1490196, 1, 1,
0.3960405, -0.1974784, 2.580321, 0, 0.1411765, 1, 1,
0.39791, 1.495092, -0.4769188, 0, 0.1372549, 1, 1,
0.3988611, 2.103804, 1.254354, 0, 0.1294118, 1, 1,
0.401172, 0.154956, 1.875433, 0, 0.1254902, 1, 1,
0.4032529, -0.01008547, 1.441594, 0, 0.1176471, 1, 1,
0.4033367, -0.3753225, 1.857526, 0, 0.1137255, 1, 1,
0.4089895, -2.138021, 1.859075, 0, 0.1058824, 1, 1,
0.4107375, -0.3851476, 1.65299, 0, 0.09803922, 1, 1,
0.4122943, 0.4187611, -1.178349, 0, 0.09411765, 1, 1,
0.4131558, 0.3628092, -0.01079208, 0, 0.08627451, 1, 1,
0.4142173, -0.07496866, 0.6786121, 0, 0.08235294, 1, 1,
0.4197978, -1.416829, 3.698835, 0, 0.07450981, 1, 1,
0.4232754, 1.098785, -0.04905812, 0, 0.07058824, 1, 1,
0.4236314, 1.492303, -0.7070622, 0, 0.0627451, 1, 1,
0.42531, 0.3279085, 1.311549, 0, 0.05882353, 1, 1,
0.4256592, 0.3806155, 0.4091924, 0, 0.05098039, 1, 1,
0.4291951, 0.817084, 2.267712, 0, 0.04705882, 1, 1,
0.4313844, -0.7437, 2.722847, 0, 0.03921569, 1, 1,
0.4364804, 0.8076096, 1.107464, 0, 0.03529412, 1, 1,
0.4400572, -1.194808, 5.144605, 0, 0.02745098, 1, 1,
0.4405809, -2.245379, 1.563735, 0, 0.02352941, 1, 1,
0.4408817, 0.8826783, 2.608165, 0, 0.01568628, 1, 1,
0.4423507, 1.718967, 1.543231, 0, 0.01176471, 1, 1,
0.4531927, -0.2767866, 3.420195, 0, 0.003921569, 1, 1,
0.4567222, -0.9047867, 3.468138, 0.003921569, 0, 1, 1,
0.4575071, 0.5083026, 0.3679963, 0.007843138, 0, 1, 1,
0.4587262, -0.1925911, 3.534208, 0.01568628, 0, 1, 1,
0.4595245, -0.6648431, 3.766322, 0.01960784, 0, 1, 1,
0.4611799, -0.860777, 1.324202, 0.02745098, 0, 1, 1,
0.4616623, -0.1207487, 1.456986, 0.03137255, 0, 1, 1,
0.4632553, -0.9664355, 3.048799, 0.03921569, 0, 1, 1,
0.4647883, 1.847316, 0.5286016, 0.04313726, 0, 1, 1,
0.4676157, -0.4820581, 2.184558, 0.05098039, 0, 1, 1,
0.4696875, -0.9337092, 2.750695, 0.05490196, 0, 1, 1,
0.4709101, -0.3579443, 1.064133, 0.0627451, 0, 1, 1,
0.4719894, -0.8005354, 4.834199, 0.06666667, 0, 1, 1,
0.4776407, 0.2957651, 1.984808, 0.07450981, 0, 1, 1,
0.4784771, -0.4827739, 2.129436, 0.07843138, 0, 1, 1,
0.4836816, -1.28705, 2.966775, 0.08627451, 0, 1, 1,
0.4841683, -0.06980173, 2.309121, 0.09019608, 0, 1, 1,
0.4847609, -1.464923, 3.929924, 0.09803922, 0, 1, 1,
0.4856082, -0.6839368, 3.825577, 0.1058824, 0, 1, 1,
0.4880575, 0.2964025, 1.409271, 0.1098039, 0, 1, 1,
0.4946205, -0.07433746, 2.226753, 0.1176471, 0, 1, 1,
0.4962863, -1.541412, 2.322709, 0.1215686, 0, 1, 1,
0.4988991, -0.7725616, 1.732645, 0.1294118, 0, 1, 1,
0.5058598, -1.32661, 3.895185, 0.1333333, 0, 1, 1,
0.5063835, 0.1624132, 3.226763, 0.1411765, 0, 1, 1,
0.512278, 0.4976032, 0.6954969, 0.145098, 0, 1, 1,
0.5164237, 0.5102014, -0.03258697, 0.1529412, 0, 1, 1,
0.517396, -1.32771, 1.883894, 0.1568628, 0, 1, 1,
0.5230291, -0.180334, 1.479023, 0.1647059, 0, 1, 1,
0.5334623, 1.758772, -0.5193389, 0.1686275, 0, 1, 1,
0.5384294, -0.5743073, 3.986882, 0.1764706, 0, 1, 1,
0.5391055, 1.305064, 0.9967602, 0.1803922, 0, 1, 1,
0.5403577, -1.001023, 2.38505, 0.1882353, 0, 1, 1,
0.5445469, 0.8718908, -0.3113766, 0.1921569, 0, 1, 1,
0.5477971, -1.032727, 1.664706, 0.2, 0, 1, 1,
0.5491947, -0.2176214, 3.96194, 0.2078431, 0, 1, 1,
0.5500746, -0.874271, 2.343657, 0.2117647, 0, 1, 1,
0.550328, -0.2657717, 1.18726, 0.2196078, 0, 1, 1,
0.5531216, 0.7749175, 0.4457144, 0.2235294, 0, 1, 1,
0.562129, -0.6376389, 3.568797, 0.2313726, 0, 1, 1,
0.5693822, -0.07754743, 0.2560441, 0.2352941, 0, 1, 1,
0.5700839, 1.355391, 1.465475, 0.2431373, 0, 1, 1,
0.5727224, -0.1892939, 3.11631, 0.2470588, 0, 1, 1,
0.5758461, -0.07454792, 1.117746, 0.254902, 0, 1, 1,
0.5783084, -1.118515, 0.8136712, 0.2588235, 0, 1, 1,
0.5798929, -0.6701254, 3.031156, 0.2666667, 0, 1, 1,
0.5800996, -0.6819602, 2.567782, 0.2705882, 0, 1, 1,
0.5829917, 0.3669443, 1.838569, 0.2784314, 0, 1, 1,
0.5846881, -0.867167, 1.937689, 0.282353, 0, 1, 1,
0.5859665, -1.332881, 2.122468, 0.2901961, 0, 1, 1,
0.5869834, 0.1135762, 2.161885, 0.2941177, 0, 1, 1,
0.5878255, 0.2586843, 0.5009217, 0.3019608, 0, 1, 1,
0.5882266, 0.6951953, -1.557077, 0.3098039, 0, 1, 1,
0.5895692, -0.5501267, 1.510787, 0.3137255, 0, 1, 1,
0.5945635, -0.140145, 2.460792, 0.3215686, 0, 1, 1,
0.5946442, 0.2472715, 0.4246052, 0.3254902, 0, 1, 1,
0.5951675, -0.166978, 2.142365, 0.3333333, 0, 1, 1,
0.5969285, -0.4937698, 1.410636, 0.3372549, 0, 1, 1,
0.5983301, -0.4439598, 1.950751, 0.345098, 0, 1, 1,
0.5990829, 1.222213, 0.4351108, 0.3490196, 0, 1, 1,
0.6010373, -0.5780641, 3.33216, 0.3568628, 0, 1, 1,
0.6089076, 0.6817707, 0.8103349, 0.3607843, 0, 1, 1,
0.6147651, 0.03726205, 1.113723, 0.3686275, 0, 1, 1,
0.6242124, 0.3027746, 2.016203, 0.372549, 0, 1, 1,
0.6297377, -1.112805, 3.997923, 0.3803922, 0, 1, 1,
0.6318817, 0.4226649, 1.683167, 0.3843137, 0, 1, 1,
0.6406868, -0.4103957, 3.03614, 0.3921569, 0, 1, 1,
0.6417301, 0.8320808, 3.14643, 0.3960784, 0, 1, 1,
0.6425973, -0.1405419, 1.908232, 0.4039216, 0, 1, 1,
0.6429298, -1.410918, 2.554274, 0.4117647, 0, 1, 1,
0.6448707, 0.569988, -0.6736321, 0.4156863, 0, 1, 1,
0.646907, 0.1519444, 1.596684, 0.4235294, 0, 1, 1,
0.6494862, 1.262872, -2.654898, 0.427451, 0, 1, 1,
0.649766, -1.113569, 2.63651, 0.4352941, 0, 1, 1,
0.6606427, -1.498638, 3.094847, 0.4392157, 0, 1, 1,
0.6621698, 0.1954874, 1.524494, 0.4470588, 0, 1, 1,
0.6646152, 0.5809298, 0.9432678, 0.4509804, 0, 1, 1,
0.6656834, 0.7563092, 1.868919, 0.4588235, 0, 1, 1,
0.6705233, 0.513657, 0.1516609, 0.4627451, 0, 1, 1,
0.6707266, -0.7870476, 3.144218, 0.4705882, 0, 1, 1,
0.6740637, 0.05673277, 0.8232041, 0.4745098, 0, 1, 1,
0.6779633, -0.7391201, 2.897523, 0.4823529, 0, 1, 1,
0.6806262, -0.4855569, 2.15659, 0.4862745, 0, 1, 1,
0.6822071, -0.1888989, 3.351274, 0.4941176, 0, 1, 1,
0.6826118, -1.15775, 3.393588, 0.5019608, 0, 1, 1,
0.6842722, 0.7762464, 0.01656466, 0.5058824, 0, 1, 1,
0.686425, -1.116714, 3.484482, 0.5137255, 0, 1, 1,
0.7031528, -0.3095319, 1.531348, 0.5176471, 0, 1, 1,
0.7036152, 0.2912165, 0.7057242, 0.5254902, 0, 1, 1,
0.7069619, -0.05843791, 1.619844, 0.5294118, 0, 1, 1,
0.7084741, 0.4074934, 1.398673, 0.5372549, 0, 1, 1,
0.7124091, -0.3697831, 0.9436671, 0.5411765, 0, 1, 1,
0.715311, -0.3094249, 2.41141, 0.5490196, 0, 1, 1,
0.7188603, -0.8232668, 1.55485, 0.5529412, 0, 1, 1,
0.7200496, 0.1173413, 0.3239287, 0.5607843, 0, 1, 1,
0.7258595, -0.06024938, 1.988511, 0.5647059, 0, 1, 1,
0.7299434, -0.4899887, 1.545477, 0.572549, 0, 1, 1,
0.7319865, 0.8653746, 0.6438292, 0.5764706, 0, 1, 1,
0.7320603, 0.8003857, 1.344487, 0.5843138, 0, 1, 1,
0.739885, -0.3393262, 1.956714, 0.5882353, 0, 1, 1,
0.7405769, -0.8624005, 3.9523, 0.5960785, 0, 1, 1,
0.7422311, -0.03151751, 1.75053, 0.6039216, 0, 1, 1,
0.7524223, -0.7924484, -0.1747186, 0.6078432, 0, 1, 1,
0.7532668, 1.077661, -0.5291726, 0.6156863, 0, 1, 1,
0.7533211, -0.251817, 0.8252736, 0.6196079, 0, 1, 1,
0.7553369, -1.00218, 2.644676, 0.627451, 0, 1, 1,
0.7644315, -1.891157, 2.714795, 0.6313726, 0, 1, 1,
0.7666398, 0.4508756, 0.4470145, 0.6392157, 0, 1, 1,
0.7695577, 1.525037, -0.4685439, 0.6431373, 0, 1, 1,
0.7698776, -0.04451625, 1.092353, 0.6509804, 0, 1, 1,
0.7716619, -0.8878134, 3.499319, 0.654902, 0, 1, 1,
0.776085, 1.664746, 0.7558953, 0.6627451, 0, 1, 1,
0.7837523, -0.2361602, 2.068163, 0.6666667, 0, 1, 1,
0.7853722, -0.4237831, 0.9338165, 0.6745098, 0, 1, 1,
0.7860757, 0.4336703, -0.9570919, 0.6784314, 0, 1, 1,
0.7933959, 1.306188, 1.231931, 0.6862745, 0, 1, 1,
0.7937182, 0.2921132, 0.02393947, 0.6901961, 0, 1, 1,
0.7954988, -1.279042, 2.896604, 0.6980392, 0, 1, 1,
0.8003622, -2.105179, 1.475351, 0.7058824, 0, 1, 1,
0.8025618, -0.3598084, 1.172692, 0.7098039, 0, 1, 1,
0.8054571, -1.921256, 2.548201, 0.7176471, 0, 1, 1,
0.8096164, -1.192342, 2.412025, 0.7215686, 0, 1, 1,
0.8143421, 0.1359872, 0.343405, 0.7294118, 0, 1, 1,
0.816857, 0.7608768, 1.985665, 0.7333333, 0, 1, 1,
0.824891, -0.1663096, 1.583598, 0.7411765, 0, 1, 1,
0.8265494, 0.2495008, 1.626465, 0.7450981, 0, 1, 1,
0.8288833, -0.3063008, 2.827346, 0.7529412, 0, 1, 1,
0.8312764, 0.0619233, 0.8378146, 0.7568628, 0, 1, 1,
0.8350336, 0.397682, 0.8868022, 0.7647059, 0, 1, 1,
0.8387275, -0.2825037, 1.835342, 0.7686275, 0, 1, 1,
0.8401046, -0.636472, 3.05391, 0.7764706, 0, 1, 1,
0.8444369, -0.07904992, 0.4066589, 0.7803922, 0, 1, 1,
0.8510973, 0.2123839, 1.285652, 0.7882353, 0, 1, 1,
0.8528945, 0.3591058, 0.1424221, 0.7921569, 0, 1, 1,
0.8541428, 0.4479461, 1.696951, 0.8, 0, 1, 1,
0.8618043, -0.1550927, 1.076948, 0.8078431, 0, 1, 1,
0.8620839, -0.7044764, 1.043014, 0.8117647, 0, 1, 1,
0.8657417, 0.2247801, 3.629276, 0.8196079, 0, 1, 1,
0.8726214, -0.1028775, 1.518471, 0.8235294, 0, 1, 1,
0.8789367, 0.1963943, 2.489107, 0.8313726, 0, 1, 1,
0.881728, -1.404222, 3.728166, 0.8352941, 0, 1, 1,
0.8848025, 0.4140037, 1.346988, 0.8431373, 0, 1, 1,
0.8874248, 0.746145, -0.4226816, 0.8470588, 0, 1, 1,
0.8896195, -1.49259, 2.322866, 0.854902, 0, 1, 1,
0.8898388, 0.04907647, 1.758833, 0.8588235, 0, 1, 1,
0.8968171, -0.2126148, 2.350661, 0.8666667, 0, 1, 1,
0.8976315, 0.725237, 2.4119, 0.8705882, 0, 1, 1,
0.8998564, 0.003025907, 2.128086, 0.8784314, 0, 1, 1,
0.9049094, -0.3107861, 2.629869, 0.8823529, 0, 1, 1,
0.9084168, -0.4054771, 2.520924, 0.8901961, 0, 1, 1,
0.9159625, 0.3926991, 1.942579, 0.8941177, 0, 1, 1,
0.9161648, 0.2378778, 2.364379, 0.9019608, 0, 1, 1,
0.9164952, -0.1529607, 2.215708, 0.9098039, 0, 1, 1,
0.9200804, -0.4534949, 2.961985, 0.9137255, 0, 1, 1,
0.9295777, -1.158289, 1.152553, 0.9215686, 0, 1, 1,
0.9328986, -2.29685, 2.480729, 0.9254902, 0, 1, 1,
0.934445, -0.3059137, 0.6172801, 0.9333333, 0, 1, 1,
0.9386693, -1.646531, 2.963794, 0.9372549, 0, 1, 1,
0.9395431, -1.014675, 1.805269, 0.945098, 0, 1, 1,
0.9453676, 1.088978, 1.373685, 0.9490196, 0, 1, 1,
0.9602319, 0.3848603, 1.635046, 0.9568627, 0, 1, 1,
0.9633471, 0.3031796, 2.84914, 0.9607843, 0, 1, 1,
0.963768, -0.7699415, 2.981819, 0.9686275, 0, 1, 1,
0.964516, -1.169583, 2.793761, 0.972549, 0, 1, 1,
0.9726623, 0.1009664, 1.366799, 0.9803922, 0, 1, 1,
0.9728577, -1.764211, 2.88431, 0.9843137, 0, 1, 1,
0.9731295, -0.1301239, 0.2227665, 0.9921569, 0, 1, 1,
0.9775168, -1.252103, 2.976801, 0.9960784, 0, 1, 1,
0.9794168, -0.9051494, 1.610841, 1, 0, 0.9960784, 1,
0.9802049, -0.6443197, 2.327503, 1, 0, 0.9882353, 1,
0.9820753, -0.5358796, 2.976755, 1, 0, 0.9843137, 1,
0.9831231, 1.363362, 0.3344157, 1, 0, 0.9764706, 1,
0.9837523, 0.1688295, 1.642275, 1, 0, 0.972549, 1,
0.9878541, -0.6847634, 0.202579, 1, 0, 0.9647059, 1,
0.98879, -0.415484, 2.545278, 1, 0, 0.9607843, 1,
0.994747, 0.5510564, 2.056741, 1, 0, 0.9529412, 1,
0.9954341, -1.540421, 2.728483, 1, 0, 0.9490196, 1,
0.9959301, -1.36481, 2.081387, 1, 0, 0.9411765, 1,
1.008117, 1.427676, 0.4202082, 1, 0, 0.9372549, 1,
1.012816, 1.624307, 0.6946149, 1, 0, 0.9294118, 1,
1.022774, -0.2403971, 0.8157058, 1, 0, 0.9254902, 1,
1.029952, -0.4580663, 1.719149, 1, 0, 0.9176471, 1,
1.032642, 0.4256469, 1.340109, 1, 0, 0.9137255, 1,
1.033481, -0.6970249, 0.7706453, 1, 0, 0.9058824, 1,
1.0386, -0.1955701, 1.348362, 1, 0, 0.9019608, 1,
1.039389, 0.8264, 0.2388193, 1, 0, 0.8941177, 1,
1.067909, 1.238736, 2.529095, 1, 0, 0.8862745, 1,
1.082993, -0.1044462, 0.8665065, 1, 0, 0.8823529, 1,
1.08318, -0.07233346, 1.622392, 1, 0, 0.8745098, 1,
1.101303, -1.194857, 3.658709, 1, 0, 0.8705882, 1,
1.10502, -2.2048, 4.333176, 1, 0, 0.8627451, 1,
1.116072, -0.3962684, 0.2080174, 1, 0, 0.8588235, 1,
1.128463, -0.7358496, 2.136003, 1, 0, 0.8509804, 1,
1.128867, 0.4253426, 1.357648, 1, 0, 0.8470588, 1,
1.129291, 1.232729, -1.465039, 1, 0, 0.8392157, 1,
1.13501, -0.2354623, 2.695584, 1, 0, 0.8352941, 1,
1.136728, 0.1246871, 1.029832, 1, 0, 0.827451, 1,
1.145853, -0.8090941, 2.621248, 1, 0, 0.8235294, 1,
1.148143, -1.791378, 2.534254, 1, 0, 0.8156863, 1,
1.157331, -0.2026219, 1.123899, 1, 0, 0.8117647, 1,
1.157397, 0.2486523, 2.247869, 1, 0, 0.8039216, 1,
1.158021, -2.541756, 3.383164, 1, 0, 0.7960784, 1,
1.160117, -0.984244, 1.127366, 1, 0, 0.7921569, 1,
1.16355, 0.823837, 1.10113, 1, 0, 0.7843137, 1,
1.171621, -0.1154236, 2.354057, 1, 0, 0.7803922, 1,
1.172371, -0.7728511, 2.414935, 1, 0, 0.772549, 1,
1.173347, 0.8999949, -1.175394, 1, 0, 0.7686275, 1,
1.185473, -1.122235, 2.763799, 1, 0, 0.7607843, 1,
1.187925, -0.2813569, 0.05103379, 1, 0, 0.7568628, 1,
1.188506, -1.764365, 4.28625, 1, 0, 0.7490196, 1,
1.200594, -0.8426729, 3.009789, 1, 0, 0.7450981, 1,
1.201062, -2.32854, 2.526086, 1, 0, 0.7372549, 1,
1.2019, 1.251765, 2.476864, 1, 0, 0.7333333, 1,
1.203237, 0.6491891, 0.6927961, 1, 0, 0.7254902, 1,
1.204704, -0.9762363, 2.57219, 1, 0, 0.7215686, 1,
1.211634, -0.9596993, 2.525133, 1, 0, 0.7137255, 1,
1.214844, 1.161767, 0.5030953, 1, 0, 0.7098039, 1,
1.215505, -0.1313995, 1.168031, 1, 0, 0.7019608, 1,
1.216213, 0.04227293, 2.435926, 1, 0, 0.6941177, 1,
1.217227, -0.9657827, 0.8714185, 1, 0, 0.6901961, 1,
1.218583, 0.2525126, 2.116865, 1, 0, 0.682353, 1,
1.219475, -1.193622, 2.339248, 1, 0, 0.6784314, 1,
1.226717, 0.5845637, 2.785214, 1, 0, 0.6705883, 1,
1.23953, -0.2724498, 2.303752, 1, 0, 0.6666667, 1,
1.241416, 0.1286353, 0.5364298, 1, 0, 0.6588235, 1,
1.247135, -0.3059027, 2.504748, 1, 0, 0.654902, 1,
1.26704, 1.744824, -0.4127549, 1, 0, 0.6470588, 1,
1.269732, 0.723502, 1.268514, 1, 0, 0.6431373, 1,
1.27102, -0.004127783, 2.733509, 1, 0, 0.6352941, 1,
1.273517, -0.3878817, 1.452584, 1, 0, 0.6313726, 1,
1.281433, -0.756899, 2.198575, 1, 0, 0.6235294, 1,
1.282228, -0.06026908, 1.677692, 1, 0, 0.6196079, 1,
1.283185, 0.9348279, 1.653915, 1, 0, 0.6117647, 1,
1.28965, -1.585991, 1.013917, 1, 0, 0.6078432, 1,
1.302162, 0.7546862, 0.1675966, 1, 0, 0.6, 1,
1.303622, -1.145057, 2.250938, 1, 0, 0.5921569, 1,
1.305786, -1.781452, 2.460072, 1, 0, 0.5882353, 1,
1.307095, -1.339229, 1.273033, 1, 0, 0.5803922, 1,
1.316719, 0.5632637, 0.9266195, 1, 0, 0.5764706, 1,
1.319827, 1.33383, -1.946629, 1, 0, 0.5686275, 1,
1.324514, -0.9455383, 3.200446, 1, 0, 0.5647059, 1,
1.325449, -0.4156531, 1.10632, 1, 0, 0.5568628, 1,
1.328351, 0.5174755, 2.524095, 1, 0, 0.5529412, 1,
1.328499, -1.109435, 0.2215629, 1, 0, 0.5450981, 1,
1.335105, -1.01077, 2.929848, 1, 0, 0.5411765, 1,
1.343071, 0.3991306, 1.177849, 1, 0, 0.5333334, 1,
1.356505, -0.9477587, 2.475411, 1, 0, 0.5294118, 1,
1.359877, -1.504106, 1.682279, 1, 0, 0.5215687, 1,
1.361515, 0.8751427, 2.636095, 1, 0, 0.5176471, 1,
1.368391, 0.6152001, 2.309531, 1, 0, 0.509804, 1,
1.371219, 0.01083453, 1.853039, 1, 0, 0.5058824, 1,
1.372213, -1.073803, 1.238993, 1, 0, 0.4980392, 1,
1.380371, 0.6699271, -1.313298, 1, 0, 0.4901961, 1,
1.38646, 0.5105961, -0.3978344, 1, 0, 0.4862745, 1,
1.390264, -0.8547103, 2.791306, 1, 0, 0.4784314, 1,
1.394034, 0.1107919, 2.02464, 1, 0, 0.4745098, 1,
1.400231, -0.8809264, 1.589325, 1, 0, 0.4666667, 1,
1.402607, -0.4379414, 0.5679635, 1, 0, 0.4627451, 1,
1.423073, -0.3358279, 1.010811, 1, 0, 0.454902, 1,
1.428772, 0.272997, 1.856317, 1, 0, 0.4509804, 1,
1.432315, -1.116998, 2.364978, 1, 0, 0.4431373, 1,
1.458028, 0.4354512, 0.5631372, 1, 0, 0.4392157, 1,
1.459126, 1.357597, 1.859691, 1, 0, 0.4313726, 1,
1.464327, -1.641124, 1.35133, 1, 0, 0.427451, 1,
1.466971, -0.06936975, 2.450105, 1, 0, 0.4196078, 1,
1.477222, -0.2147795, 1.501245, 1, 0, 0.4156863, 1,
1.480142, 0.364196, -0.9718694, 1, 0, 0.4078431, 1,
1.504157, 0.4692599, 1.657647, 1, 0, 0.4039216, 1,
1.508122, 0.3583141, 1.832337, 1, 0, 0.3960784, 1,
1.524123, -0.5188177, 3.07015, 1, 0, 0.3882353, 1,
1.556117, 0.2119787, 1.399343, 1, 0, 0.3843137, 1,
1.56626, -2.497442, 2.912544, 1, 0, 0.3764706, 1,
1.574098, 0.2284334, 1.09568, 1, 0, 0.372549, 1,
1.578812, -1.088265, 2.554169, 1, 0, 0.3647059, 1,
1.580064, -0.6061906, -0.1865616, 1, 0, 0.3607843, 1,
1.588871, 0.2236972, 2.994081, 1, 0, 0.3529412, 1,
1.595358, 0.5902617, 0.3456842, 1, 0, 0.3490196, 1,
1.596001, 0.5221292, -0.5770081, 1, 0, 0.3411765, 1,
1.617972, 0.6990788, 1.486495, 1, 0, 0.3372549, 1,
1.619408, -0.2755891, 2.681984, 1, 0, 0.3294118, 1,
1.625548, 0.4276027, 1.534786, 1, 0, 0.3254902, 1,
1.651207, -0.3854569, 3.270498, 1, 0, 0.3176471, 1,
1.651714, -0.3230832, 2.873584, 1, 0, 0.3137255, 1,
1.656176, 0.8779635, -0.6965259, 1, 0, 0.3058824, 1,
1.659309, -1.399006, 2.559231, 1, 0, 0.2980392, 1,
1.664404, 0.1327292, 2.557595, 1, 0, 0.2941177, 1,
1.671417, -1.13366, 1.322549, 1, 0, 0.2862745, 1,
1.703874, 0.8211967, 1.378012, 1, 0, 0.282353, 1,
1.711543, 0.3497678, 0.4016212, 1, 0, 0.2745098, 1,
1.721245, 0.533228, 1.351685, 1, 0, 0.2705882, 1,
1.722018, 1.539818, 1.067295, 1, 0, 0.2627451, 1,
1.73039, -0.4534387, 2.742478, 1, 0, 0.2588235, 1,
1.767501, 0.6258155, 2.70839, 1, 0, 0.2509804, 1,
1.768553, 0.5430862, 1.392397, 1, 0, 0.2470588, 1,
1.770982, -0.3275983, 3.023196, 1, 0, 0.2392157, 1,
1.775651, -0.6731488, 2.691071, 1, 0, 0.2352941, 1,
1.78278, -1.004357, 3.275574, 1, 0, 0.227451, 1,
1.785549, -0.4088145, 1.470823, 1, 0, 0.2235294, 1,
1.790277, -0.6801524, 3.134776, 1, 0, 0.2156863, 1,
1.805148, -0.8961251, 1.027985, 1, 0, 0.2117647, 1,
1.827686, -0.9479347, 2.314817, 1, 0, 0.2039216, 1,
1.837145, 1.825394, 1.080594, 1, 0, 0.1960784, 1,
1.844358, -0.007922289, 0.1295978, 1, 0, 0.1921569, 1,
1.882659, 0.7185001, 0.3326998, 1, 0, 0.1843137, 1,
1.884328, 1.221908, 0.2070718, 1, 0, 0.1803922, 1,
1.885132, -1.749931, 1.975314, 1, 0, 0.172549, 1,
1.887545, -0.4924781, 2.889138, 1, 0, 0.1686275, 1,
1.892562, 1.263094, 0.5897053, 1, 0, 0.1607843, 1,
1.911838, 0.708672, 0.7939823, 1, 0, 0.1568628, 1,
1.923719, -0.3018971, 2.273086, 1, 0, 0.1490196, 1,
1.94263, -1.231695, 1.87786, 1, 0, 0.145098, 1,
1.953375, -0.1202867, 0.2963559, 1, 0, 0.1372549, 1,
1.956852, 0.7569739, -0.6670482, 1, 0, 0.1333333, 1,
2.049364, 0.839233, 1.438164, 1, 0, 0.1254902, 1,
2.0637, -0.4623149, 3.627104, 1, 0, 0.1215686, 1,
2.065456, -1.100159, 2.39522, 1, 0, 0.1137255, 1,
2.065591, 0.1921248, 0.4053895, 1, 0, 0.1098039, 1,
2.0742, 0.0877007, 1.107166, 1, 0, 0.1019608, 1,
2.076842, 0.7665048, 1.119981, 1, 0, 0.09411765, 1,
2.160091, 0.456459, 1.823262, 1, 0, 0.09019608, 1,
2.163358, -1.21218, 3.067364, 1, 0, 0.08235294, 1,
2.191569, -2.138956, 5.042349, 1, 0, 0.07843138, 1,
2.20056, 1.616597, -1.111126, 1, 0, 0.07058824, 1,
2.280893, -1.235865, 2.422901, 1, 0, 0.06666667, 1,
2.322075, -1.6971, 3.757699, 1, 0, 0.05882353, 1,
2.370297, -0.1918457, 2.558884, 1, 0, 0.05490196, 1,
2.552016, -1.270908, 2.726922, 1, 0, 0.04705882, 1,
2.570292, 1.616439, 0.3493307, 1, 0, 0.04313726, 1,
2.579752, 2.490741, 1.680061, 1, 0, 0.03529412, 1,
2.581656, 0.2997995, 0.2951226, 1, 0, 0.03137255, 1,
2.770702, -0.5391366, 0.6816047, 1, 0, 0.02352941, 1,
2.782968, 2.072372, 1.023447, 1, 0, 0.01960784, 1,
2.845606, 1.465271, 0.4721027, 1, 0, 0.01176471, 1,
3.239425, -1.009415, 1.44433, 1, 0, 0.007843138, 1
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
-0.01924586, -4.522801, -7.100862, 0, -0.5, 0.5, 0.5,
-0.01924586, -4.522801, -7.100862, 1, -0.5, 0.5, 0.5,
-0.01924586, -4.522801, -7.100862, 1, 1.5, 0.5, 0.5,
-0.01924586, -4.522801, -7.100862, 0, 1.5, 0.5, 0.5
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
-4.382607, -0.2170514, -7.100862, 0, -0.5, 0.5, 0.5,
-4.382607, -0.2170514, -7.100862, 1, -0.5, 0.5, 0.5,
-4.382607, -0.2170514, -7.100862, 1, 1.5, 0.5, 0.5,
-4.382607, -0.2170514, -7.100862, 0, 1.5, 0.5, 0.5
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
-4.382607, -4.522801, 0.002812386, 0, -0.5, 0.5, 0.5,
-4.382607, -4.522801, 0.002812386, 1, -0.5, 0.5, 0.5,
-4.382607, -4.522801, 0.002812386, 1, 1.5, 0.5, 0.5,
-4.382607, -4.522801, 0.002812386, 0, 1.5, 0.5, 0.5
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
-3, -3.529166, -5.461553,
3, -3.529166, -5.461553,
-3, -3.529166, -5.461553,
-3, -3.694772, -5.734771,
-2, -3.529166, -5.461553,
-2, -3.694772, -5.734771,
-1, -3.529166, -5.461553,
-1, -3.694772, -5.734771,
0, -3.529166, -5.461553,
0, -3.694772, -5.734771,
1, -3.529166, -5.461553,
1, -3.694772, -5.734771,
2, -3.529166, -5.461553,
2, -3.694772, -5.734771,
3, -3.529166, -5.461553,
3, -3.694772, -5.734771
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
"2",
"3"
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
-3, -4.025984, -6.281207, 0, -0.5, 0.5, 0.5,
-3, -4.025984, -6.281207, 1, -0.5, 0.5, 0.5,
-3, -4.025984, -6.281207, 1, 1.5, 0.5, 0.5,
-3, -4.025984, -6.281207, 0, 1.5, 0.5, 0.5,
-2, -4.025984, -6.281207, 0, -0.5, 0.5, 0.5,
-2, -4.025984, -6.281207, 1, -0.5, 0.5, 0.5,
-2, -4.025984, -6.281207, 1, 1.5, 0.5, 0.5,
-2, -4.025984, -6.281207, 0, 1.5, 0.5, 0.5,
-1, -4.025984, -6.281207, 0, -0.5, 0.5, 0.5,
-1, -4.025984, -6.281207, 1, -0.5, 0.5, 0.5,
-1, -4.025984, -6.281207, 1, 1.5, 0.5, 0.5,
-1, -4.025984, -6.281207, 0, 1.5, 0.5, 0.5,
0, -4.025984, -6.281207, 0, -0.5, 0.5, 0.5,
0, -4.025984, -6.281207, 1, -0.5, 0.5, 0.5,
0, -4.025984, -6.281207, 1, 1.5, 0.5, 0.5,
0, -4.025984, -6.281207, 0, 1.5, 0.5, 0.5,
1, -4.025984, -6.281207, 0, -0.5, 0.5, 0.5,
1, -4.025984, -6.281207, 1, -0.5, 0.5, 0.5,
1, -4.025984, -6.281207, 1, 1.5, 0.5, 0.5,
1, -4.025984, -6.281207, 0, 1.5, 0.5, 0.5,
2, -4.025984, -6.281207, 0, -0.5, 0.5, 0.5,
2, -4.025984, -6.281207, 1, -0.5, 0.5, 0.5,
2, -4.025984, -6.281207, 1, 1.5, 0.5, 0.5,
2, -4.025984, -6.281207, 0, 1.5, 0.5, 0.5,
3, -4.025984, -6.281207, 0, -0.5, 0.5, 0.5,
3, -4.025984, -6.281207, 1, -0.5, 0.5, 0.5,
3, -4.025984, -6.281207, 1, 1.5, 0.5, 0.5,
3, -4.025984, -6.281207, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
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
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
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
-3.375677, -3, -5.461553,
-3.375677, 2, -5.461553,
-3.375677, -3, -5.461553,
-3.543499, -3, -5.734771,
-3.375677, -2, -5.461553,
-3.543499, -2, -5.734771,
-3.375677, -1, -5.461553,
-3.543499, -1, -5.734771,
-3.375677, 0, -5.461553,
-3.543499, 0, -5.734771,
-3.375677, 1, -5.461553,
-3.543499, 1, -5.734771,
-3.375677, 2, -5.461553,
-3.543499, 2, -5.734771
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
-3.879142, -3, -6.281207, 0, -0.5, 0.5, 0.5,
-3.879142, -3, -6.281207, 1, -0.5, 0.5, 0.5,
-3.879142, -3, -6.281207, 1, 1.5, 0.5, 0.5,
-3.879142, -3, -6.281207, 0, 1.5, 0.5, 0.5,
-3.879142, -2, -6.281207, 0, -0.5, 0.5, 0.5,
-3.879142, -2, -6.281207, 1, -0.5, 0.5, 0.5,
-3.879142, -2, -6.281207, 1, 1.5, 0.5, 0.5,
-3.879142, -2, -6.281207, 0, 1.5, 0.5, 0.5,
-3.879142, -1, -6.281207, 0, -0.5, 0.5, 0.5,
-3.879142, -1, -6.281207, 1, -0.5, 0.5, 0.5,
-3.879142, -1, -6.281207, 1, 1.5, 0.5, 0.5,
-3.879142, -1, -6.281207, 0, 1.5, 0.5, 0.5,
-3.879142, 0, -6.281207, 0, -0.5, 0.5, 0.5,
-3.879142, 0, -6.281207, 1, -0.5, 0.5, 0.5,
-3.879142, 0, -6.281207, 1, 1.5, 0.5, 0.5,
-3.879142, 0, -6.281207, 0, 1.5, 0.5, 0.5,
-3.879142, 1, -6.281207, 0, -0.5, 0.5, 0.5,
-3.879142, 1, -6.281207, 1, -0.5, 0.5, 0.5,
-3.879142, 1, -6.281207, 1, 1.5, 0.5, 0.5,
-3.879142, 1, -6.281207, 0, 1.5, 0.5, 0.5,
-3.879142, 2, -6.281207, 0, -0.5, 0.5, 0.5,
-3.879142, 2, -6.281207, 1, -0.5, 0.5, 0.5,
-3.879142, 2, -6.281207, 1, 1.5, 0.5, 0.5,
-3.879142, 2, -6.281207, 0, 1.5, 0.5, 0.5
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
-3.375677, -3.529166, -4,
-3.375677, -3.529166, 4,
-3.375677, -3.529166, -4,
-3.543499, -3.694772, -4,
-3.375677, -3.529166, -2,
-3.543499, -3.694772, -2,
-3.375677, -3.529166, 0,
-3.543499, -3.694772, 0,
-3.375677, -3.529166, 2,
-3.543499, -3.694772, 2,
-3.375677, -3.529166, 4,
-3.543499, -3.694772, 4
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
"4"
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
-3.879142, -4.025984, -4, 0, -0.5, 0.5, 0.5,
-3.879142, -4.025984, -4, 1, -0.5, 0.5, 0.5,
-3.879142, -4.025984, -4, 1, 1.5, 0.5, 0.5,
-3.879142, -4.025984, -4, 0, 1.5, 0.5, 0.5,
-3.879142, -4.025984, -2, 0, -0.5, 0.5, 0.5,
-3.879142, -4.025984, -2, 1, -0.5, 0.5, 0.5,
-3.879142, -4.025984, -2, 1, 1.5, 0.5, 0.5,
-3.879142, -4.025984, -2, 0, 1.5, 0.5, 0.5,
-3.879142, -4.025984, 0, 0, -0.5, 0.5, 0.5,
-3.879142, -4.025984, 0, 1, -0.5, 0.5, 0.5,
-3.879142, -4.025984, 0, 1, 1.5, 0.5, 0.5,
-3.879142, -4.025984, 0, 0, 1.5, 0.5, 0.5,
-3.879142, -4.025984, 2, 0, -0.5, 0.5, 0.5,
-3.879142, -4.025984, 2, 1, -0.5, 0.5, 0.5,
-3.879142, -4.025984, 2, 1, 1.5, 0.5, 0.5,
-3.879142, -4.025984, 2, 0, 1.5, 0.5, 0.5,
-3.879142, -4.025984, 4, 0, -0.5, 0.5, 0.5,
-3.879142, -4.025984, 4, 1, -0.5, 0.5, 0.5,
-3.879142, -4.025984, 4, 1, 1.5, 0.5, 0.5,
-3.879142, -4.025984, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
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
16, 17, 18, 16, 18, 19
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
-3.375677, -3.529166, -5.461553,
-3.375677, 3.095064, -5.461553,
-3.375677, -3.529166, 5.467177,
-3.375677, 3.095064, 5.467177,
-3.375677, -3.529166, -5.461553,
-3.375677, -3.529166, 5.467177,
-3.375677, 3.095064, -5.461553,
-3.375677, 3.095064, 5.467177,
-3.375677, -3.529166, -5.461553,
3.337186, -3.529166, -5.461553,
-3.375677, -3.529166, 5.467177,
3.337186, -3.529166, 5.467177,
-3.375677, 3.095064, -5.461553,
3.337186, 3.095064, -5.461553,
-3.375677, 3.095064, 5.467177,
3.337186, 3.095064, 5.467177,
3.337186, -3.529166, -5.461553,
3.337186, 3.095064, -5.461553,
3.337186, -3.529166, 5.467177,
3.337186, 3.095064, 5.467177,
3.337186, -3.529166, -5.461553,
3.337186, -3.529166, 5.467177,
3.337186, 3.095064, -5.461553,
3.337186, 3.095064, 5.467177
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
var radius = 7.708211;
var distance = 34.2947;
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
mvMatrix.translate( 0.01924586, 0.2170514, -0.002812386 );
mvMatrix.scale( 1.241537, 1.258149, 0.7626017 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.2947);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Niacin<-read.table("Niacin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Niacin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Niacin' not found
```

```r
y<-Niacin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Niacin' not found
```

```r
z<-Niacin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Niacin' not found
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
-3.277917, -2.038258, -1.294419, 0, 0, 1, 1, 1,
-3.060771, 0.7913673, -3.02967, 1, 0, 0, 1, 1,
-2.946743, -0.2857637, -0.6613139, 1, 0, 0, 1, 1,
-2.59442, -0.9340253, -0.6191464, 1, 0, 0, 1, 1,
-2.572264, 0.3197081, -2.377188, 1, 0, 0, 1, 1,
-2.499201, -0.9235377, -2.517585, 1, 0, 0, 1, 1,
-2.447425, 1.331463, -1.957681, 0, 0, 0, 1, 1,
-2.307501, 0.05673699, -0.3320159, 0, 0, 0, 1, 1,
-2.283259, -0.8279903, -0.9248372, 0, 0, 0, 1, 1,
-2.244706, 0.723743, 0.4761775, 0, 0, 0, 1, 1,
-2.204678, -0.5264178, -0.4579523, 0, 0, 0, 1, 1,
-2.183259, 0.296952, -1.208531, 0, 0, 0, 1, 1,
-2.156851, -0.9744052, -3.375416, 0, 0, 0, 1, 1,
-2.148727, 0.175333, -1.479277, 1, 1, 1, 1, 1,
-2.133667, -1.685739, -2.855797, 1, 1, 1, 1, 1,
-2.089955, 0.3500967, -3.053605, 1, 1, 1, 1, 1,
-2.021729, -0.5364035, -0.5931887, 1, 1, 1, 1, 1,
-2.00736, 0.5441181, -1.279172, 1, 1, 1, 1, 1,
-2.003569, 0.238145, -1.099036, 1, 1, 1, 1, 1,
-1.994952, -0.3927916, -3.73973, 1, 1, 1, 1, 1,
-1.973547, 2.331703, -0.513496, 1, 1, 1, 1, 1,
-1.947191, 1.076314, -2.544035, 1, 1, 1, 1, 1,
-1.939267, 0.5938382, -0.9883854, 1, 1, 1, 1, 1,
-1.890777, -0.1259335, 0.1690322, 1, 1, 1, 1, 1,
-1.886731, -0.7624289, -0.8064176, 1, 1, 1, 1, 1,
-1.885465, -0.270043, -2.919329, 1, 1, 1, 1, 1,
-1.87312, -1.803218, -2.505669, 1, 1, 1, 1, 1,
-1.846172, -0.2483689, -2.22856, 1, 1, 1, 1, 1,
-1.815637, 0.4247261, -1.649398, 0, 0, 1, 1, 1,
-1.803324, 0.4832903, -0.5330814, 1, 0, 0, 1, 1,
-1.755413, -0.5707779, -2.066293, 1, 0, 0, 1, 1,
-1.748176, -1.039218, -3.583264, 1, 0, 0, 1, 1,
-1.738747, 0.7392239, -1.155409, 1, 0, 0, 1, 1,
-1.731817, 0.2345984, -2.090108, 1, 0, 0, 1, 1,
-1.725758, -1.779751, -3.151877, 0, 0, 0, 1, 1,
-1.719357, 0.2742016, -2.21454, 0, 0, 0, 1, 1,
-1.703357, 1.689574, -0.3039149, 0, 0, 0, 1, 1,
-1.698177, -0.4829472, -0.8081235, 0, 0, 0, 1, 1,
-1.696883, 1.014535, -0.5871242, 0, 0, 0, 1, 1,
-1.693747, -1.877037, -3.07443, 0, 0, 0, 1, 1,
-1.68954, -1.231969, -1.253227, 0, 0, 0, 1, 1,
-1.682393, 0.3074628, -1.299216, 1, 1, 1, 1, 1,
-1.674708, -0.5150277, -0.7619192, 1, 1, 1, 1, 1,
-1.654786, -0.8932396, -1.965947, 1, 1, 1, 1, 1,
-1.642483, 0.3635837, -1.568357, 1, 1, 1, 1, 1,
-1.64131, 0.01719755, -1.908365, 1, 1, 1, 1, 1,
-1.641131, 0.2686222, -1.711145, 1, 1, 1, 1, 1,
-1.637893, -1.387771, -1.842548, 1, 1, 1, 1, 1,
-1.636433, -0.7377977, -0.225034, 1, 1, 1, 1, 1,
-1.628895, -0.1954666, -3.171636, 1, 1, 1, 1, 1,
-1.620604, -1.4917, -2.706076, 1, 1, 1, 1, 1,
-1.615568, -0.4864679, -1.820017, 1, 1, 1, 1, 1,
-1.605264, 1.338314, -0.144857, 1, 1, 1, 1, 1,
-1.5994, 0.3389201, -1.988372, 1, 1, 1, 1, 1,
-1.581208, 0.4153305, -3.249877, 1, 1, 1, 1, 1,
-1.576897, -0.2697159, -0.7343588, 1, 1, 1, 1, 1,
-1.551524, 1.29962, -1.825575, 0, 0, 1, 1, 1,
-1.550389, 0.7992048, -1.334036, 1, 0, 0, 1, 1,
-1.548037, 0.486405, -1.326263, 1, 0, 0, 1, 1,
-1.513458, -0.4428747, -2.641368, 1, 0, 0, 1, 1,
-1.510213, -0.4548709, -1.897387, 1, 0, 0, 1, 1,
-1.500629, 0.4034281, -2.226701, 1, 0, 0, 1, 1,
-1.495561, 1.372729, -1.554468, 0, 0, 0, 1, 1,
-1.488162, -0.2371397, -0.9854541, 0, 0, 0, 1, 1,
-1.481866, 1.566119, 0.05150921, 0, 0, 0, 1, 1,
-1.464146, -0.3712764, -2.909703, 0, 0, 0, 1, 1,
-1.446183, -0.8096573, -1.136965, 0, 0, 0, 1, 1,
-1.443776, -0.9655966, -3.284731, 0, 0, 0, 1, 1,
-1.42062, 0.2300741, -3.100363, 0, 0, 0, 1, 1,
-1.404312, -0.362417, -1.916083, 1, 1, 1, 1, 1,
-1.401197, 0.4137957, -0.5642054, 1, 1, 1, 1, 1,
-1.398193, -2.507679, -1.166681, 1, 1, 1, 1, 1,
-1.393677, -0.6705216, -2.160515, 1, 1, 1, 1, 1,
-1.383066, 0.8325377, 0.3034609, 1, 1, 1, 1, 1,
-1.379839, -0.942769, -1.787777, 1, 1, 1, 1, 1,
-1.378887, 0.1026045, -0.4650831, 1, 1, 1, 1, 1,
-1.370101, 0.3070363, -1.082747, 1, 1, 1, 1, 1,
-1.363175, -0.1846017, -3.02008, 1, 1, 1, 1, 1,
-1.361988, -0.166289, -1.666172, 1, 1, 1, 1, 1,
-1.347011, -0.6185802, -1.273216, 1, 1, 1, 1, 1,
-1.343057, 0.3935128, -1.989613, 1, 1, 1, 1, 1,
-1.342354, 1.493226, 2.295868, 1, 1, 1, 1, 1,
-1.341046, 0.1465687, -2.271247, 1, 1, 1, 1, 1,
-1.303969, 0.694362, -3.0222, 1, 1, 1, 1, 1,
-1.293157, -1.771374, -3.871473, 0, 0, 1, 1, 1,
-1.287716, -0.4476257, -0.5789903, 1, 0, 0, 1, 1,
-1.279863, 0.04008192, -1.278159, 1, 0, 0, 1, 1,
-1.27765, -0.7701184, -1.795504, 1, 0, 0, 1, 1,
-1.276776, -0.6872638, -1.138251, 1, 0, 0, 1, 1,
-1.274942, 1.197654, -0.8244339, 1, 0, 0, 1, 1,
-1.270101, -0.2907757, -0.9424719, 0, 0, 0, 1, 1,
-1.269923, -0.5481923, -1.211278, 0, 0, 0, 1, 1,
-1.268799, -0.5159791, -1.451367, 0, 0, 0, 1, 1,
-1.259593, 0.009189378, -1.247666, 0, 0, 0, 1, 1,
-1.257137, 1.502324, -1.780592, 0, 0, 0, 1, 1,
-1.255585, -0.8232307, -2.698494, 0, 0, 0, 1, 1,
-1.249687, 0.1364799, -2.161541, 0, 0, 0, 1, 1,
-1.243008, 1.628149, -1.461941, 1, 1, 1, 1, 1,
-1.228993, 1.319047, 0.2490288, 1, 1, 1, 1, 1,
-1.225759, -0.4867775, -1.87953, 1, 1, 1, 1, 1,
-1.221566, 0.318434, -2.976522, 1, 1, 1, 1, 1,
-1.219358, -0.8439233, -2.880147, 1, 1, 1, 1, 1,
-1.216501, 2.156113, -1.965862, 1, 1, 1, 1, 1,
-1.202319, 0.2860027, 0.3403651, 1, 1, 1, 1, 1,
-1.199495, 0.5681731, -2.05459, 1, 1, 1, 1, 1,
-1.199467, 1.173018, -0.4375548, 1, 1, 1, 1, 1,
-1.194178, 0.6945274, -3.711964, 1, 1, 1, 1, 1,
-1.191171, 0.5196623, -1.311007, 1, 1, 1, 1, 1,
-1.187151, 0.4680615, -2.18958, 1, 1, 1, 1, 1,
-1.181284, 0.4986705, -0.1058911, 1, 1, 1, 1, 1,
-1.17635, -0.3103256, -0.7093751, 1, 1, 1, 1, 1,
-1.172006, 0.5755926, -0.9331502, 1, 1, 1, 1, 1,
-1.171195, 0.7791371, -1.982556, 0, 0, 1, 1, 1,
-1.166739, -0.6596274, -0.1936631, 1, 0, 0, 1, 1,
-1.152898, -0.5936249, -2.975296, 1, 0, 0, 1, 1,
-1.149239, 0.2596096, -3.912061, 1, 0, 0, 1, 1,
-1.146722, -0.01813761, -1.231136, 1, 0, 0, 1, 1,
-1.146275, 0.2755933, -1.030761, 1, 0, 0, 1, 1,
-1.123239, -0.9738026, -2.725022, 0, 0, 0, 1, 1,
-1.111425, -0.6396336, -2.868569, 0, 0, 0, 1, 1,
-1.109699, 0.1330521, 0.5691756, 0, 0, 0, 1, 1,
-1.091848, -1.230732, -1.918587, 0, 0, 0, 1, 1,
-1.083611, -0.2309076, -1.467893, 0, 0, 0, 1, 1,
-1.081453, 2.128303, -0.4075136, 0, 0, 0, 1, 1,
-1.07783, 1.134167, -0.3054966, 0, 0, 0, 1, 1,
-1.073444, 0.1261306, -0.621155, 1, 1, 1, 1, 1,
-1.070757, 0.6608588, -0.7917249, 1, 1, 1, 1, 1,
-1.065173, -0.9851657, -2.685117, 1, 1, 1, 1, 1,
-1.065061, -0.891578, -0.9154772, 1, 1, 1, 1, 1,
-1.062868, -0.4686615, -2.612585, 1, 1, 1, 1, 1,
-1.061823, -0.01046472, -2.189481, 1, 1, 1, 1, 1,
-1.053742, 1.280566, -0.4571015, 1, 1, 1, 1, 1,
-1.053575, -0.07476027, -2.42162, 1, 1, 1, 1, 1,
-1.051347, -0.7089065, -1.376021, 1, 1, 1, 1, 1,
-1.0494, -0.1295066, -2.755362, 1, 1, 1, 1, 1,
-1.048282, -0.9874647, -2.026797, 1, 1, 1, 1, 1,
-1.045218, 0.0002857677, -2.057455, 1, 1, 1, 1, 1,
-1.044125, -0.4496791, -3.094187, 1, 1, 1, 1, 1,
-1.042949, 0.5905029, -1.592981, 1, 1, 1, 1, 1,
-1.040824, 0.3964967, -1.162497, 1, 1, 1, 1, 1,
-1.03524, -0.579719, -2.715109, 0, 0, 1, 1, 1,
-1.034855, 0.7863734, -1.849121, 1, 0, 0, 1, 1,
-1.031728, 2.901518, -0.6191972, 1, 0, 0, 1, 1,
-1.025733, 0.08308087, 0.2179266, 1, 0, 0, 1, 1,
-1.023033, -0.3492585, -3.559711, 1, 0, 0, 1, 1,
-1.02283, 0.7130536, -0.2427347, 1, 0, 0, 1, 1,
-1.018487, -0.7344589, -0.2332888, 0, 0, 0, 1, 1,
-1.01766, -0.7076456, -1.56951, 0, 0, 0, 1, 1,
-1.017514, 0.8348004, 0.9168892, 0, 0, 0, 1, 1,
-1.017199, -0.8933534, -2.494402, 0, 0, 0, 1, 1,
-1.014162, -1.630706, -3.099012, 0, 0, 0, 1, 1,
-1.01388, 0.9171377, -1.546195, 0, 0, 0, 1, 1,
-1.012145, -0.6206347, -5.130908, 0, 0, 0, 1, 1,
-1.009293, 2.499406, 1.415869, 1, 1, 1, 1, 1,
-1.006348, -0.6909345, -0.5961363, 1, 1, 1, 1, 1,
-1.003295, 0.4268653, -2.362779, 1, 1, 1, 1, 1,
-1.002746, 0.5119984, -1.224796, 1, 1, 1, 1, 1,
-0.9989188, 0.1462985, -2.521858, 1, 1, 1, 1, 1,
-0.9948291, 0.6061761, -0.4674063, 1, 1, 1, 1, 1,
-0.9942939, -0.01224611, -1.306373, 1, 1, 1, 1, 1,
-0.9940374, -1.383925, -1.837939, 1, 1, 1, 1, 1,
-0.9886561, 1.177129, -0.9413243, 1, 1, 1, 1, 1,
-0.9814842, 0.8088421, 0.4545094, 1, 1, 1, 1, 1,
-0.9800456, -0.657859, -2.469165, 1, 1, 1, 1, 1,
-0.979789, -0.2100933, -1.108151, 1, 1, 1, 1, 1,
-0.9785952, 0.4037237, -1.340188, 1, 1, 1, 1, 1,
-0.9770492, 0.9479627, -3.424423, 1, 1, 1, 1, 1,
-0.9753955, -2.021184, -2.494229, 1, 1, 1, 1, 1,
-0.9704005, 0.3065206, -0.6246963, 0, 0, 1, 1, 1,
-0.9679103, -0.3182512, -1.412883, 1, 0, 0, 1, 1,
-0.9654779, 1.636731, 2.085932, 1, 0, 0, 1, 1,
-0.9562201, -0.4392264, -0.5634997, 1, 0, 0, 1, 1,
-0.9517779, 0.1830356, -1.21069, 1, 0, 0, 1, 1,
-0.9472101, 0.1630818, -0.95596, 1, 0, 0, 1, 1,
-0.9467176, 0.7726848, -1.636198, 0, 0, 0, 1, 1,
-0.9430055, 0.5704443, -0.8525636, 0, 0, 0, 1, 1,
-0.9395234, -0.8882034, -2.965501, 0, 0, 0, 1, 1,
-0.9288218, -1.409178, -4.914327, 0, 0, 0, 1, 1,
-0.9254541, 0.6234244, 0.4075697, 0, 0, 0, 1, 1,
-0.9248735, 0.6775628, -1.573272, 0, 0, 0, 1, 1,
-0.9218779, -0.8125029, -1.293927, 0, 0, 0, 1, 1,
-0.9216766, 1.436799, -0.4248134, 1, 1, 1, 1, 1,
-0.9184382, 0.1069152, -1.665321, 1, 1, 1, 1, 1,
-0.9178137, -0.3736963, -2.326128, 1, 1, 1, 1, 1,
-0.9178094, -0.06508244, -1.889129, 1, 1, 1, 1, 1,
-0.9140834, -0.3642815, -2.416649, 1, 1, 1, 1, 1,
-0.9069766, 0.8008426, -0.04620562, 1, 1, 1, 1, 1,
-0.9067087, -1.417943, -2.810651, 1, 1, 1, 1, 1,
-0.9056176, -1.196618, -1.337498, 1, 1, 1, 1, 1,
-0.8965766, -0.5599056, -1.540842, 1, 1, 1, 1, 1,
-0.8964806, 0.02930123, -0.4784975, 1, 1, 1, 1, 1,
-0.8964016, 0.8692744, -1.492965, 1, 1, 1, 1, 1,
-0.894085, 1.742995, 0.9671746, 1, 1, 1, 1, 1,
-0.8923566, 0.9754182, 0.1794752, 1, 1, 1, 1, 1,
-0.8904549, 0.008052922, -2.822016, 1, 1, 1, 1, 1,
-0.8868982, -0.6216513, -1.400349, 1, 1, 1, 1, 1,
-0.8849469, -0.2421888, -0.4671651, 0, 0, 1, 1, 1,
-0.8840063, -0.8395544, -2.40632, 1, 0, 0, 1, 1,
-0.8833486, 0.01813766, -3.441468, 1, 0, 0, 1, 1,
-0.8814001, 0.4055246, -0.1610079, 1, 0, 0, 1, 1,
-0.8782403, -0.9588901, -2.902283, 1, 0, 0, 1, 1,
-0.8764666, -1.142267, -3.146236, 1, 0, 0, 1, 1,
-0.8651096, 0.5752041, -1.592723, 0, 0, 0, 1, 1,
-0.8631573, -0.7910489, -3.069653, 0, 0, 0, 1, 1,
-0.8619525, -0.924054, -3.306034, 0, 0, 0, 1, 1,
-0.8603988, 1.207382, -0.3761818, 0, 0, 0, 1, 1,
-0.8508607, 1.299811, -0.2079001, 0, 0, 0, 1, 1,
-0.8440731, 1.426992, -1.34317, 0, 0, 0, 1, 1,
-0.838071, 1.498476, -0.5231056, 0, 0, 0, 1, 1,
-0.8351076, -0.5746451, -4.010767, 1, 1, 1, 1, 1,
-0.8344823, -0.3978163, -0.6684031, 1, 1, 1, 1, 1,
-0.8341796, -0.4081959, -3.254526, 1, 1, 1, 1, 1,
-0.8338444, -0.2726195, -2.544522, 1, 1, 1, 1, 1,
-0.8320061, -0.7377101, -1.244417, 1, 1, 1, 1, 1,
-0.8233609, -0.9310738, -2.30132, 1, 1, 1, 1, 1,
-0.8205093, 0.3716133, -0.6885728, 1, 1, 1, 1, 1,
-0.8168364, 0.5000912, -1.109574, 1, 1, 1, 1, 1,
-0.8112034, -1.002904, -3.517678, 1, 1, 1, 1, 1,
-0.8101332, -1.612685, -2.31005, 1, 1, 1, 1, 1,
-0.8089038, 0.7078481, -1.252948, 1, 1, 1, 1, 1,
-0.7989227, 0.1379345, -0.2324703, 1, 1, 1, 1, 1,
-0.7960745, 0.289718, 0.7851989, 1, 1, 1, 1, 1,
-0.79401, -1.215287, -1.217125, 1, 1, 1, 1, 1,
-0.7894264, 1.92559, -0.6131142, 1, 1, 1, 1, 1,
-0.7891592, -0.1925178, -1.086456, 0, 0, 1, 1, 1,
-0.7862125, -0.09376047, -2.447373, 1, 0, 0, 1, 1,
-0.7856762, 1.093363, -3.212597, 1, 0, 0, 1, 1,
-0.7764233, 0.3321163, -1.650128, 1, 0, 0, 1, 1,
-0.7746731, -1.113325, -2.025869, 1, 0, 0, 1, 1,
-0.7665715, -0.9540365, -2.511973, 1, 0, 0, 1, 1,
-0.7623436, -0.5457495, -3.135261, 0, 0, 0, 1, 1,
-0.7550981, -0.1699548, 0.1451391, 0, 0, 0, 1, 1,
-0.7477847, -1.264335, -2.444288, 0, 0, 0, 1, 1,
-0.7477113, -0.9141462, -1.894177, 0, 0, 0, 1, 1,
-0.7434483, -0.8713064, -2.769031, 0, 0, 0, 1, 1,
-0.7415667, 1.303427, 0.5580498, 0, 0, 0, 1, 1,
-0.7406456, -1.256742, -3.210217, 0, 0, 0, 1, 1,
-0.7392769, 1.482319, 0.4889163, 1, 1, 1, 1, 1,
-0.7329732, -1.794341, -4.342983, 1, 1, 1, 1, 1,
-0.7325723, 0.318881, -1.554306, 1, 1, 1, 1, 1,
-0.7275738, 1.265514, -1.265332, 1, 1, 1, 1, 1,
-0.7235591, -0.2359267, -2.478902, 1, 1, 1, 1, 1,
-0.722462, -0.4544722, -4.077226, 1, 1, 1, 1, 1,
-0.7220852, -0.3498611, -3.311303, 1, 1, 1, 1, 1,
-0.7203255, 0.7920778, -0.6512751, 1, 1, 1, 1, 1,
-0.7184681, 0.8105605, -0.3276827, 1, 1, 1, 1, 1,
-0.7171966, 1.658316, -0.9999485, 1, 1, 1, 1, 1,
-0.7165207, -0.9164481, -1.759243, 1, 1, 1, 1, 1,
-0.7146913, -0.910824, -3.762069, 1, 1, 1, 1, 1,
-0.7114144, -0.4300783, -3.022106, 1, 1, 1, 1, 1,
-0.7103893, 1.381401, -0.1385739, 1, 1, 1, 1, 1,
-0.7082991, -0.3564015, -1.642848, 1, 1, 1, 1, 1,
-0.7072216, 2.199235, 1.120756, 0, 0, 1, 1, 1,
-0.7071634, -0.997932, -3.326635, 1, 0, 0, 1, 1,
-0.7017899, 0.1821246, 0.169152, 1, 0, 0, 1, 1,
-0.7010756, 1.215309, -0.5040868, 1, 0, 0, 1, 1,
-0.6990765, -0.9795826, -2.262545, 1, 0, 0, 1, 1,
-0.6925397, -1.739045, -3.681959, 1, 0, 0, 1, 1,
-0.6914172, -0.8848646, -2.589051, 0, 0, 0, 1, 1,
-0.6894476, -1.02173, -2.675053, 0, 0, 0, 1, 1,
-0.6861693, -0.3481377, -2.624833, 0, 0, 0, 1, 1,
-0.6801511, -0.0419455, 0.2044751, 0, 0, 0, 1, 1,
-0.6794426, -0.3947757, -2.416653, 0, 0, 0, 1, 1,
-0.6780915, -0.4366554, -0.6263577, 0, 0, 0, 1, 1,
-0.6755974, 0.1406577, -0.888949, 0, 0, 0, 1, 1,
-0.6741441, 0.1959111, -1.642493, 1, 1, 1, 1, 1,
-0.6717713, -2.6505, -3.883813, 1, 1, 1, 1, 1,
-0.6682974, 0.0491477, -2.394982, 1, 1, 1, 1, 1,
-0.6680468, -1.109497, -3.631921, 1, 1, 1, 1, 1,
-0.6678946, 0.7661657, 0.6259483, 1, 1, 1, 1, 1,
-0.6626482, 1.334298, -1.277008, 1, 1, 1, 1, 1,
-0.6574382, -0.7174127, -1.862248, 1, 1, 1, 1, 1,
-0.6549566, -0.4003389, -0.774445, 1, 1, 1, 1, 1,
-0.6544828, -0.4033243, -2.977245, 1, 1, 1, 1, 1,
-0.6490521, 0.1417484, -4.123609, 1, 1, 1, 1, 1,
-0.6488925, 0.1362537, -2.108527, 1, 1, 1, 1, 1,
-0.6487449, 0.9492242, -0.5166439, 1, 1, 1, 1, 1,
-0.6477135, -0.01894866, -2.01077, 1, 1, 1, 1, 1,
-0.6463344, 0.3570299, -0.5591712, 1, 1, 1, 1, 1,
-0.6427069, 2.029588, -1.00567, 1, 1, 1, 1, 1,
-0.6405417, -0.2477424, -2.710479, 0, 0, 1, 1, 1,
-0.6393198, -0.0287422, -1.372975, 1, 0, 0, 1, 1,
-0.6296072, 0.8281695, -1.098037, 1, 0, 0, 1, 1,
-0.6257853, 1.438244, 1.261534, 1, 0, 0, 1, 1,
-0.6257484, 0.5502872, -0.1099415, 1, 0, 0, 1, 1,
-0.6252313, -0.01910228, -2.575053, 1, 0, 0, 1, 1,
-0.6211538, -1.75048, -2.719071, 0, 0, 0, 1, 1,
-0.6179002, 0.4877845, -2.762998, 0, 0, 0, 1, 1,
-0.6168758, -0.7476359, -2.367826, 0, 0, 0, 1, 1,
-0.6137032, -0.2545197, -2.033695, 0, 0, 0, 1, 1,
-0.6125727, -1.374845, -4.084099, 0, 0, 0, 1, 1,
-0.6093414, -1.690102, -0.6753491, 0, 0, 0, 1, 1,
-0.6048448, -0.2687876, -2.063098, 0, 0, 0, 1, 1,
-0.6046112, -0.9898703, -0.324299, 1, 1, 1, 1, 1,
-0.6023108, 0.3495294, -2.170269, 1, 1, 1, 1, 1,
-0.5992528, -0.833158, -2.00287, 1, 1, 1, 1, 1,
-0.5862734, 1.468453, -0.4709642, 1, 1, 1, 1, 1,
-0.5789965, 1.730099, -1.297087, 1, 1, 1, 1, 1,
-0.5767515, -0.6009648, -1.276067, 1, 1, 1, 1, 1,
-0.5747042, -0.5052211, -2.249781, 1, 1, 1, 1, 1,
-0.5710961, 1.800832, -1.16554, 1, 1, 1, 1, 1,
-0.5709011, -0.09112801, -2.42543, 1, 1, 1, 1, 1,
-0.5701554, -0.5792049, -1.538005, 1, 1, 1, 1, 1,
-0.5697957, -0.5769375, -2.730306, 1, 1, 1, 1, 1,
-0.5659008, -0.8153145, -4.246591, 1, 1, 1, 1, 1,
-0.5657219, -1.022166, -2.530435, 1, 1, 1, 1, 1,
-0.5628134, 1.347826, -0.1921224, 1, 1, 1, 1, 1,
-0.5596465, 1.287317, -1.803762, 1, 1, 1, 1, 1,
-0.5584009, 0.2681611, -1.265904, 0, 0, 1, 1, 1,
-0.5583827, 0.7031162, 0.8598466, 1, 0, 0, 1, 1,
-0.5518386, 0.8613426, 1.516574, 1, 0, 0, 1, 1,
-0.5500771, 2.511283, -1.229123, 1, 0, 0, 1, 1,
-0.5482044, -0.3210746, -3.710677, 1, 0, 0, 1, 1,
-0.5404589, 0.9401546, 0.2105001, 1, 0, 0, 1, 1,
-0.5392157, -0.5299462, -1.984568, 0, 0, 0, 1, 1,
-0.5266358, -0.8388074, -2.448173, 0, 0, 0, 1, 1,
-0.5264352, -0.001837891, -2.012102, 0, 0, 0, 1, 1,
-0.5256011, 0.02501042, -2.851975, 0, 0, 0, 1, 1,
-0.5247939, -1.515264, -3.386902, 0, 0, 0, 1, 1,
-0.5238114, 1.724672, 0.7306904, 0, 0, 0, 1, 1,
-0.5213957, -0.2757466, -1.670211, 0, 0, 0, 1, 1,
-0.5210636, -1.78395, -2.703372, 1, 1, 1, 1, 1,
-0.5196748, 0.4142117, -0.3579153, 1, 1, 1, 1, 1,
-0.5188582, 0.233319, -1.727113, 1, 1, 1, 1, 1,
-0.5171022, 1.169713, -1.328919, 1, 1, 1, 1, 1,
-0.5167703, -1.75647, -2.226971, 1, 1, 1, 1, 1,
-0.5146767, -0.1347528, -1.617159, 1, 1, 1, 1, 1,
-0.5102823, -1.22973, -3.703846, 1, 1, 1, 1, 1,
-0.5097583, 1.050116, 0.5330602, 1, 1, 1, 1, 1,
-0.5073423, -1.21914, -3.828916, 1, 1, 1, 1, 1,
-0.5063665, -1.20839, -4.230113, 1, 1, 1, 1, 1,
-0.5046828, 1.331355, -0.9155237, 1, 1, 1, 1, 1,
-0.5038303, -0.705102, -1.460557, 1, 1, 1, 1, 1,
-0.5033045, 0.8113583, -1.013815, 1, 1, 1, 1, 1,
-0.4997639, 0.586963, -1.200429, 1, 1, 1, 1, 1,
-0.4988974, -0.7377957, -1.438306, 1, 1, 1, 1, 1,
-0.4972437, -1.170223, -3.305045, 0, 0, 1, 1, 1,
-0.4933389, -1.038211, -3.731512, 1, 0, 0, 1, 1,
-0.4904575, -0.6537972, -0.3579277, 1, 0, 0, 1, 1,
-0.4899542, -0.4825335, -0.8270345, 1, 0, 0, 1, 1,
-0.4892144, 1.380556, -1.101718, 1, 0, 0, 1, 1,
-0.4838898, 0.5753285, 0.2900495, 1, 0, 0, 1, 1,
-0.4798185, 0.4664981, 0.337402, 0, 0, 0, 1, 1,
-0.4783275, -0.5730121, -4.054801, 0, 0, 0, 1, 1,
-0.4754949, 1.007643, -0.7345612, 0, 0, 0, 1, 1,
-0.4751699, -1.01546, -3.416511, 0, 0, 0, 1, 1,
-0.4626254, -0.03260043, -4.074509, 0, 0, 0, 1, 1,
-0.4622963, 1.135665, -1.166115, 0, 0, 0, 1, 1,
-0.4605829, 0.2867507, -0.9838321, 0, 0, 0, 1, 1,
-0.4576005, 0.002707308, -1.251773, 1, 1, 1, 1, 1,
-0.4572912, -1.457718, -1.367974, 1, 1, 1, 1, 1,
-0.4471148, -0.1703806, -0.08466969, 1, 1, 1, 1, 1,
-0.4445809, 0.0132993, -0.03244494, 1, 1, 1, 1, 1,
-0.4440904, -0.8501572, -3.647529, 1, 1, 1, 1, 1,
-0.4421261, -0.735004, -4.575337, 1, 1, 1, 1, 1,
-0.4370706, -0.1325321, -1.668487, 1, 1, 1, 1, 1,
-0.4367395, -0.8092394, -3.713511, 1, 1, 1, 1, 1,
-0.4321164, -1.610033, -3.397419, 1, 1, 1, 1, 1,
-0.429864, 1.305627, -0.1019741, 1, 1, 1, 1, 1,
-0.4210157, 1.446096, 0.5394978, 1, 1, 1, 1, 1,
-0.4197865, 0.776375, -0.08146083, 1, 1, 1, 1, 1,
-0.4108775, -0.1917624, -3.133049, 1, 1, 1, 1, 1,
-0.4103487, -0.1565411, -3.87817, 1, 1, 1, 1, 1,
-0.4101921, -0.5135813, -1.329498, 1, 1, 1, 1, 1,
-0.4088698, 0.8735724, -1.816335, 0, 0, 1, 1, 1,
-0.4075628, -2.234158, -2.936221, 1, 0, 0, 1, 1,
-0.4063214, -0.7744139, -2.439686, 1, 0, 0, 1, 1,
-0.4048904, 0.172438, -2.28533, 1, 0, 0, 1, 1,
-0.4026883, -1.887547, -3.502808, 1, 0, 0, 1, 1,
-0.3957831, 0.2701677, -2.098196, 1, 0, 0, 1, 1,
-0.393751, 0.4981452, 0.004135835, 0, 0, 0, 1, 1,
-0.3923146, -0.169371, -2.086605, 0, 0, 0, 1, 1,
-0.388591, 0.6641933, -0.07362456, 0, 0, 0, 1, 1,
-0.3842596, 1.86273, -1.23453, 0, 0, 0, 1, 1,
-0.3841791, 0.03773852, -0.5288656, 0, 0, 0, 1, 1,
-0.3824431, 0.1829422, -0.8764732, 0, 0, 0, 1, 1,
-0.3788666, -1.024294, -2.140406, 0, 0, 0, 1, 1,
-0.3763727, -0.5981365, -2.919498, 1, 1, 1, 1, 1,
-0.375946, 2.826716, -1.391182, 1, 1, 1, 1, 1,
-0.3731973, -1.203387, -2.115938, 1, 1, 1, 1, 1,
-0.3712584, 1.917507, 0.002376842, 1, 1, 1, 1, 1,
-0.3689888, 1.750008, 0.228399, 1, 1, 1, 1, 1,
-0.3655396, -0.01466171, -0.3131903, 1, 1, 1, 1, 1,
-0.3637157, 0.5982955, -0.1544197, 1, 1, 1, 1, 1,
-0.3589703, -0.244568, -2.631656, 1, 1, 1, 1, 1,
-0.355874, 1.193641, -0.8662816, 1, 1, 1, 1, 1,
-0.3544826, 0.6396306, 0.2145723, 1, 1, 1, 1, 1,
-0.350771, -0.3770444, -2.750283, 1, 1, 1, 1, 1,
-0.3480123, -0.7554646, -2.83795, 1, 1, 1, 1, 1,
-0.3472118, 0.2364547, -1.013805, 1, 1, 1, 1, 1,
-0.3450455, 0.8643619, -0.1700316, 1, 1, 1, 1, 1,
-0.3440123, 1.233501, -0.1723512, 1, 1, 1, 1, 1,
-0.3427567, 0.7086592, -1.348283, 0, 0, 1, 1, 1,
-0.3426935, -3.432697, -3.565986, 1, 0, 0, 1, 1,
-0.3358186, -0.1346211, -2.243162, 1, 0, 0, 1, 1,
-0.3332943, -1.054225, -2.979624, 1, 0, 0, 1, 1,
-0.3325126, -0.02627741, -2.010031, 1, 0, 0, 1, 1,
-0.3318698, -0.9405515, -3.383175, 1, 0, 0, 1, 1,
-0.3267877, -0.6121675, -3.650724, 0, 0, 0, 1, 1,
-0.3211139, 0.2418387, -1.586381, 0, 0, 0, 1, 1,
-0.3181078, 0.8477934, -1.297012, 0, 0, 0, 1, 1,
-0.3179106, -0.776194, -2.983126, 0, 0, 0, 1, 1,
-0.3177559, -0.1065195, -2.571384, 0, 0, 0, 1, 1,
-0.3166226, 1.096152, -0.4531859, 0, 0, 0, 1, 1,
-0.3140884, -0.8813875, -5.033647, 0, 0, 0, 1, 1,
-0.3091932, -2.213228, -2.391407, 1, 1, 1, 1, 1,
-0.3067055, 0.3195603, -1.248924, 1, 1, 1, 1, 1,
-0.3030328, 0.9197108, 0.5406942, 1, 1, 1, 1, 1,
-0.2987958, 0.1113279, -0.8670909, 1, 1, 1, 1, 1,
-0.2963994, -0.3115824, -2.494404, 1, 1, 1, 1, 1,
-0.2958447, 0.1020597, -1.444373, 1, 1, 1, 1, 1,
-0.2954312, -0.2244052, -2.018624, 1, 1, 1, 1, 1,
-0.294551, 0.4155842, 1.054787, 1, 1, 1, 1, 1,
-0.2929445, -0.8069641, -2.622715, 1, 1, 1, 1, 1,
-0.2923148, -0.08889928, -2.682757, 1, 1, 1, 1, 1,
-0.2826718, -0.5338171, -2.737149, 1, 1, 1, 1, 1,
-0.2810374, -0.1704748, -3.538782, 1, 1, 1, 1, 1,
-0.2804236, 1.079443, -1.013983, 1, 1, 1, 1, 1,
-0.2786272, 0.6731972, 0.9411608, 1, 1, 1, 1, 1,
-0.2744198, 0.05936613, -1.195108, 1, 1, 1, 1, 1,
-0.2698437, 0.2411037, -1.333099, 0, 0, 1, 1, 1,
-0.2690693, 1.926284, -0.02017838, 1, 0, 0, 1, 1,
-0.2631677, 0.217561, -1.100946, 1, 0, 0, 1, 1,
-0.262417, 1.690332, 0.04459643, 1, 0, 0, 1, 1,
-0.2562157, 0.750828, 0.08919949, 1, 0, 0, 1, 1,
-0.2552072, 0.8826019, 0.5754369, 1, 0, 0, 1, 1,
-0.2540958, -0.5130317, -3.103464, 0, 0, 0, 1, 1,
-0.252301, 0.7580977, 1.44842, 0, 0, 0, 1, 1,
-0.2508415, 0.4930753, -1.431222, 0, 0, 0, 1, 1,
-0.2473211, 0.6237569, -1.943045, 0, 0, 0, 1, 1,
-0.2426018, 0.8247232, 0.4313974, 0, 0, 0, 1, 1,
-0.2245138, 0.882129, 0.9136907, 0, 0, 0, 1, 1,
-0.2237077, -0.1727464, -1.646709, 0, 0, 0, 1, 1,
-0.2214929, 0.6596351, -1.365193, 1, 1, 1, 1, 1,
-0.2210126, -0.07614102, -2.247391, 1, 1, 1, 1, 1,
-0.2183317, -0.07641622, -3.822587, 1, 1, 1, 1, 1,
-0.2181375, -0.3017386, -4.346884, 1, 1, 1, 1, 1,
-0.217301, 0.440738, -1.49376, 1, 1, 1, 1, 1,
-0.2082662, 1.8837, 0.09167466, 1, 1, 1, 1, 1,
-0.205175, -0.09406164, -1.243323, 1, 1, 1, 1, 1,
-0.1976403, 0.170259, 0.5626087, 1, 1, 1, 1, 1,
-0.195815, -0.2685192, -2.347312, 1, 1, 1, 1, 1,
-0.1933781, 0.2212064, 0.1305132, 1, 1, 1, 1, 1,
-0.1932582, -0.3946387, -2.329895, 1, 1, 1, 1, 1,
-0.1918659, 0.9338059, 0.7705255, 1, 1, 1, 1, 1,
-0.1894958, -0.9210594, -2.62825, 1, 1, 1, 1, 1,
-0.1886004, 1.66226, -1.416787, 1, 1, 1, 1, 1,
-0.185316, -1.143312, -2.514058, 1, 1, 1, 1, 1,
-0.1846436, 0.6241659, -0.4607888, 0, 0, 1, 1, 1,
-0.1828016, 1.1766, -0.3793494, 1, 0, 0, 1, 1,
-0.1779472, -1.330491, -2.345691, 1, 0, 0, 1, 1,
-0.1770412, 1.172435, -0.459566, 1, 0, 0, 1, 1,
-0.1719459, 0.454353, -0.4398938, 1, 0, 0, 1, 1,
-0.171443, -0.6590115, -1.715393, 1, 0, 0, 1, 1,
-0.1574531, 0.1782908, -1.202623, 0, 0, 0, 1, 1,
-0.1554788, -1.249785, -4.535601, 0, 0, 0, 1, 1,
-0.1537361, 0.09647127, -1.093881, 0, 0, 0, 1, 1,
-0.1530502, -0.5600486, -1.4888, 0, 0, 0, 1, 1,
-0.1521843, -0.2537035, -3.828382, 0, 0, 0, 1, 1,
-0.150744, -1.502239, -4.220089, 0, 0, 0, 1, 1,
-0.146769, -0.1407408, -2.699673, 0, 0, 0, 1, 1,
-0.1449, -0.2368244, -3.646723, 1, 1, 1, 1, 1,
-0.1404952, 1.10245, 0.8039064, 1, 1, 1, 1, 1,
-0.1402626, -0.473801, -4.353418, 1, 1, 1, 1, 1,
-0.1381534, -0.8384164, -1.821615, 1, 1, 1, 1, 1,
-0.1358505, 1.404197, 0.2222199, 1, 1, 1, 1, 1,
-0.1331619, 0.8391309, -1.794498, 1, 1, 1, 1, 1,
-0.1283626, -0.3599226, -2.722709, 1, 1, 1, 1, 1,
-0.1260947, 0.6952614, 1.268341, 1, 1, 1, 1, 1,
-0.120911, 0.09204377, -2.510375, 1, 1, 1, 1, 1,
-0.1203713, -1.103231, -5.14415, 1, 1, 1, 1, 1,
-0.1191573, 0.09459117, 0.4174425, 1, 1, 1, 1, 1,
-0.1153, -0.9867001, -4.757145, 1, 1, 1, 1, 1,
-0.1139683, -0.768598, -2.758864, 1, 1, 1, 1, 1,
-0.1108659, -0.05713449, -1.696883, 1, 1, 1, 1, 1,
-0.1099377, -0.4734757, -2.281761, 1, 1, 1, 1, 1,
-0.1084525, -0.8070362, -3.982983, 0, 0, 1, 1, 1,
-0.1038974, 0.4443831, 0.2422765, 1, 0, 0, 1, 1,
-0.1030266, -1.011029, -3.352288, 1, 0, 0, 1, 1,
-0.1019581, 1.300972, -1.323852, 1, 0, 0, 1, 1,
-0.09741372, 1.588762, -2.195115, 1, 0, 0, 1, 1,
-0.09350459, 1.030825, 0.9334221, 1, 0, 0, 1, 1,
-0.09243773, 0.01589964, 0.3294635, 0, 0, 0, 1, 1,
-0.08452532, -1.774059, -2.150789, 0, 0, 0, 1, 1,
-0.08403429, 0.607774, -0.2928401, 0, 0, 0, 1, 1,
-0.0828802, 0.3692905, -1.970301, 0, 0, 0, 1, 1,
-0.07793806, 0.2909864, -1.32493, 0, 0, 0, 1, 1,
-0.07712675, 1.572245, 1.059601, 0, 0, 0, 1, 1,
-0.07402452, 1.280155, -1.391362, 0, 0, 0, 1, 1,
-0.07291947, 0.3865213, -0.2167148, 1, 1, 1, 1, 1,
-0.07241759, -1.468326, -2.41133, 1, 1, 1, 1, 1,
-0.0703542, 0.1327058, -0.6674538, 1, 1, 1, 1, 1,
-0.07018699, -0.1021441, -1.807377, 1, 1, 1, 1, 1,
-0.06801338, 0.01478461, -1.855082, 1, 1, 1, 1, 1,
-0.06741016, -1.826762, -3.550722, 1, 1, 1, 1, 1,
-0.06304117, -0.3271105, -1.856802, 1, 1, 1, 1, 1,
-0.06259634, -1.51515, -2.597476, 1, 1, 1, 1, 1,
-0.05636541, -0.397085, -0.9025291, 1, 1, 1, 1, 1,
-0.05254357, -1.161547, -2.919487, 1, 1, 1, 1, 1,
-0.04966173, 0.8250737, -0.8283173, 1, 1, 1, 1, 1,
-0.040386, 0.0751195, 0.3437671, 1, 1, 1, 1, 1,
-0.03318771, -0.465772, -5.302396, 1, 1, 1, 1, 1,
-0.03020968, -1.434515, -3.456091, 1, 1, 1, 1, 1,
-0.02844705, -0.1489446, -3.597599, 1, 1, 1, 1, 1,
-0.02299662, 0.7557915, 0.3132376, 0, 0, 1, 1, 1,
-0.02253897, -0.1152723, -3.800087, 1, 0, 0, 1, 1,
-0.02125159, 2.320153, 1.387968, 1, 0, 0, 1, 1,
-0.01913859, -0.3515557, -2.90128, 1, 0, 0, 1, 1,
-0.01686492, -0.9984214, -2.21154, 1, 0, 0, 1, 1,
-0.01403905, -1.784578, -2.391922, 1, 0, 0, 1, 1,
-0.01344956, -0.5381864, -3.131852, 0, 0, 0, 1, 1,
-0.01035751, 1.94443, 0.3389426, 0, 0, 0, 1, 1,
-0.005864423, -0.6329629, -3.374331, 0, 0, 0, 1, 1,
-0.005646663, -1.013785, -4.157919, 0, 0, 0, 1, 1,
-0.004220278, -0.2977033, -4.329687, 0, 0, 0, 1, 1,
0.002156553, 0.7095367, -0.06856347, 0, 0, 0, 1, 1,
0.005454131, 0.6159587, 0.9508591, 0, 0, 0, 1, 1,
0.00559869, -0.6508089, 1.83569, 1, 1, 1, 1, 1,
0.005949714, 1.181934, -0.2279261, 1, 1, 1, 1, 1,
0.006734592, 0.9369591, 1.375869, 1, 1, 1, 1, 1,
0.007272943, 1.502727, -0.09929497, 1, 1, 1, 1, 1,
0.009387561, -1.150931, 3.050092, 1, 1, 1, 1, 1,
0.01042068, -2.147303, 4.38261, 1, 1, 1, 1, 1,
0.01548557, -1.997255, 2.32538, 1, 1, 1, 1, 1,
0.02104497, -0.1827378, 2.548585, 1, 1, 1, 1, 1,
0.02161056, -0.6121935, 2.600971, 1, 1, 1, 1, 1,
0.02340003, 1.491982, -0.1203691, 1, 1, 1, 1, 1,
0.02361129, 0.181622, -0.5045828, 1, 1, 1, 1, 1,
0.0258909, 0.7553766, -0.4006148, 1, 1, 1, 1, 1,
0.02963445, 0.1096042, 0.7840192, 1, 1, 1, 1, 1,
0.03916288, -1.297082, 4.025833, 1, 1, 1, 1, 1,
0.0397396, -0.6501873, 2.69908, 1, 1, 1, 1, 1,
0.04933583, -1.108528, 2.490857, 0, 0, 1, 1, 1,
0.05530807, -0.6916829, 3.069081, 1, 0, 0, 1, 1,
0.05558231, 0.4130626, -0.197527, 1, 0, 0, 1, 1,
0.05705696, -0.4666441, 2.917164, 1, 0, 0, 1, 1,
0.05753564, 1.628941, 1.108885, 1, 0, 0, 1, 1,
0.0623928, 1.056799, 0.3191449, 1, 0, 0, 1, 1,
0.06641841, -0.4442007, 3.071763, 0, 0, 0, 1, 1,
0.07387871, 0.2692651, -1.577664, 0, 0, 0, 1, 1,
0.07406871, -2.111783, 2.789588, 0, 0, 0, 1, 1,
0.07742354, 1.64703, -0.5339282, 0, 0, 0, 1, 1,
0.08092339, -1.015845, 4.75885, 0, 0, 0, 1, 1,
0.08272047, 0.5303628, 0.990501, 0, 0, 0, 1, 1,
0.08610439, -0.7491135, 3.738195, 0, 0, 0, 1, 1,
0.08706681, 1.188143, 1.725456, 1, 1, 1, 1, 1,
0.0880731, 2.669756, 0.9954137, 1, 1, 1, 1, 1,
0.09072292, -0.8685164, 1.778708, 1, 1, 1, 1, 1,
0.09139563, 0.4383205, -0.1180033, 1, 1, 1, 1, 1,
0.09477813, 2.998594, 0.2949167, 1, 1, 1, 1, 1,
0.09621015, -1.57578, 3.982984, 1, 1, 1, 1, 1,
0.09647091, 1.45986, -0.3246898, 1, 1, 1, 1, 1,
0.09828971, 1.265794, 0.5877221, 1, 1, 1, 1, 1,
0.09983665, 0.1283334, 1.098648, 1, 1, 1, 1, 1,
0.1011905, 0.1635532, 1.035517, 1, 1, 1, 1, 1,
0.110315, 0.2235511, 1.555404, 1, 1, 1, 1, 1,
0.1125525, -2.745499, 4.014904, 1, 1, 1, 1, 1,
0.1148669, -0.1154571, 3.743461, 1, 1, 1, 1, 1,
0.1153425, 1.695229, 0.5798736, 1, 1, 1, 1, 1,
0.1175335, -0.3931687, 2.461052, 1, 1, 1, 1, 1,
0.1207082, 0.5108844, -0.1910457, 0, 0, 1, 1, 1,
0.1210055, -0.482098, 1.885901, 1, 0, 0, 1, 1,
0.1216353, 0.1401446, 1.653965, 1, 0, 0, 1, 1,
0.1236273, -0.7946217, 2.233611, 1, 0, 0, 1, 1,
0.1281078, 0.4893424, 0.518952, 1, 0, 0, 1, 1,
0.1310496, 1.70229, 0.3310642, 1, 0, 0, 1, 1,
0.1358446, 2.202567, -0.1642615, 0, 0, 0, 1, 1,
0.1418005, -1.772499, -0.3975682, 0, 0, 0, 1, 1,
0.1421808, 0.3459713, -0.1867226, 0, 0, 0, 1, 1,
0.147253, -0.3091899, 5.308021, 0, 0, 0, 1, 1,
0.1477173, 0.3541555, 0.1617478, 0, 0, 0, 1, 1,
0.1529057, 0.04507324, 2.037932, 0, 0, 0, 1, 1,
0.1658185, -0.1437186, 2.051116, 0, 0, 0, 1, 1,
0.1659278, -1.11838, 1.970713, 1, 1, 1, 1, 1,
0.1772876, 0.09172072, 2.517191, 1, 1, 1, 1, 1,
0.1800585, -0.7940354, 2.99776, 1, 1, 1, 1, 1,
0.1860327, 1.370877, 0.2718247, 1, 1, 1, 1, 1,
0.1893521, 1.491954, 3.279902, 1, 1, 1, 1, 1,
0.1920392, 1.23884, 0.7067026, 1, 1, 1, 1, 1,
0.1959012, -0.01506515, 1.622759, 1, 1, 1, 1, 1,
0.1966506, -0.7145066, 2.721318, 1, 1, 1, 1, 1,
0.2002013, -0.3052792, 4.148915, 1, 1, 1, 1, 1,
0.2021774, 0.9199969, 2.799375, 1, 1, 1, 1, 1,
0.2100938, 0.05073827, -0.3257305, 1, 1, 1, 1, 1,
0.2103772, 0.5114197, 0.7806388, 1, 1, 1, 1, 1,
0.2103894, -1.172348, 2.639231, 1, 1, 1, 1, 1,
0.2130766, 0.9847375, -1.489598, 1, 1, 1, 1, 1,
0.2174221, 0.2444883, 2.426951, 1, 1, 1, 1, 1,
0.2183585, 0.2225294, 1.576985, 0, 0, 1, 1, 1,
0.2189244, 0.845234, -0.03606128, 1, 0, 0, 1, 1,
0.2204151, -1.145589, 3.551127, 1, 0, 0, 1, 1,
0.2256973, 0.2845879, 0.4331578, 1, 0, 0, 1, 1,
0.2320538, -0.628668, 3.354634, 1, 0, 0, 1, 1,
0.2336951, -1.247811, 1.548587, 1, 0, 0, 1, 1,
0.236508, 0.4151758, 1.614134, 0, 0, 0, 1, 1,
0.2384136, 0.747416, -1.105962, 0, 0, 0, 1, 1,
0.2416419, -2.264453, 2.295227, 0, 0, 0, 1, 1,
0.2460982, -1.465788, 3.373488, 0, 0, 0, 1, 1,
0.2461225, -0.1641158, 3.014894, 0, 0, 0, 1, 1,
0.251463, 0.2430022, 3.005644, 0, 0, 0, 1, 1,
0.2575195, -1.082468, 2.905294, 0, 0, 0, 1, 1,
0.2674892, 0.1405748, 0.7075626, 1, 1, 1, 1, 1,
0.2815048, 0.656862, -0.2601979, 1, 1, 1, 1, 1,
0.2909394, -1.764264, 3.923526, 1, 1, 1, 1, 1,
0.2914546, 1.066925, 0.05845081, 1, 1, 1, 1, 1,
0.2928184, -2.424957, 3.156805, 1, 1, 1, 1, 1,
0.2955576, 2.219126, 0.1171104, 1, 1, 1, 1, 1,
0.3000225, -0.03294352, -0.6895248, 1, 1, 1, 1, 1,
0.3088006, 0.4843411, -1.473203, 1, 1, 1, 1, 1,
0.309623, 0.8401771, -0.9219142, 1, 1, 1, 1, 1,
0.3139445, -0.9706982, 3.130192, 1, 1, 1, 1, 1,
0.3168136, 1.041879, -0.661401, 1, 1, 1, 1, 1,
0.3185037, 1.057422, 1.31261, 1, 1, 1, 1, 1,
0.3207726, 0.5386515, -0.4319848, 1, 1, 1, 1, 1,
0.3269109, 0.1312539, -0.06926468, 1, 1, 1, 1, 1,
0.3273776, 1.331205, 1.752724, 1, 1, 1, 1, 1,
0.3274714, 1.047225, 0.4250883, 0, 0, 1, 1, 1,
0.3292929, -0.3157525, 1.851789, 1, 0, 0, 1, 1,
0.3336672, 0.003810495, 2.384785, 1, 0, 0, 1, 1,
0.3408752, 1.107455, -0.2800985, 1, 0, 0, 1, 1,
0.3412732, -0.520722, 1.075209, 1, 0, 0, 1, 1,
0.3432022, 2.015023, -0.6280357, 1, 0, 0, 1, 1,
0.3488467, 1.507323, -0.06652676, 0, 0, 0, 1, 1,
0.3532552, 0.1601783, -0.05458511, 0, 0, 0, 1, 1,
0.3566247, 0.2031231, -0.3530805, 0, 0, 0, 1, 1,
0.3571901, 1.023076, -0.8682573, 0, 0, 0, 1, 1,
0.3622206, 1.091606, 1.855566, 0, 0, 0, 1, 1,
0.3643937, -0.8535573, 2.882048, 0, 0, 0, 1, 1,
0.3684365, 0.3027057, 1.509949, 0, 0, 0, 1, 1,
0.368813, 0.7915821, 0.2522061, 1, 1, 1, 1, 1,
0.3704823, 0.4642465, 0.9203129, 1, 1, 1, 1, 1,
0.3717249, 1.221415, -0.6270786, 1, 1, 1, 1, 1,
0.3738923, 0.7161335, -1.798901, 1, 1, 1, 1, 1,
0.3741154, -1.93114, 4.030211, 1, 1, 1, 1, 1,
0.3748285, -0.4654949, 0.9704447, 1, 1, 1, 1, 1,
0.3754027, -0.9694681, 4.367762, 1, 1, 1, 1, 1,
0.3770346, 0.3759096, 2.482987, 1, 1, 1, 1, 1,
0.3798864, -0.3478341, 1.536318, 1, 1, 1, 1, 1,
0.3864345, -0.04800289, 1.2202, 1, 1, 1, 1, 1,
0.3875455, -1.478922, 3.859105, 1, 1, 1, 1, 1,
0.3896725, -0.5099169, 3.229316, 1, 1, 1, 1, 1,
0.3900841, 0.1360949, 1.14386, 1, 1, 1, 1, 1,
0.3930306, 0.6183977, -0.3336204, 1, 1, 1, 1, 1,
0.3960405, -0.1974784, 2.580321, 1, 1, 1, 1, 1,
0.39791, 1.495092, -0.4769188, 0, 0, 1, 1, 1,
0.3988611, 2.103804, 1.254354, 1, 0, 0, 1, 1,
0.401172, 0.154956, 1.875433, 1, 0, 0, 1, 1,
0.4032529, -0.01008547, 1.441594, 1, 0, 0, 1, 1,
0.4033367, -0.3753225, 1.857526, 1, 0, 0, 1, 1,
0.4089895, -2.138021, 1.859075, 1, 0, 0, 1, 1,
0.4107375, -0.3851476, 1.65299, 0, 0, 0, 1, 1,
0.4122943, 0.4187611, -1.178349, 0, 0, 0, 1, 1,
0.4131558, 0.3628092, -0.01079208, 0, 0, 0, 1, 1,
0.4142173, -0.07496866, 0.6786121, 0, 0, 0, 1, 1,
0.4197978, -1.416829, 3.698835, 0, 0, 0, 1, 1,
0.4232754, 1.098785, -0.04905812, 0, 0, 0, 1, 1,
0.4236314, 1.492303, -0.7070622, 0, 0, 0, 1, 1,
0.42531, 0.3279085, 1.311549, 1, 1, 1, 1, 1,
0.4256592, 0.3806155, 0.4091924, 1, 1, 1, 1, 1,
0.4291951, 0.817084, 2.267712, 1, 1, 1, 1, 1,
0.4313844, -0.7437, 2.722847, 1, 1, 1, 1, 1,
0.4364804, 0.8076096, 1.107464, 1, 1, 1, 1, 1,
0.4400572, -1.194808, 5.144605, 1, 1, 1, 1, 1,
0.4405809, -2.245379, 1.563735, 1, 1, 1, 1, 1,
0.4408817, 0.8826783, 2.608165, 1, 1, 1, 1, 1,
0.4423507, 1.718967, 1.543231, 1, 1, 1, 1, 1,
0.4531927, -0.2767866, 3.420195, 1, 1, 1, 1, 1,
0.4567222, -0.9047867, 3.468138, 1, 1, 1, 1, 1,
0.4575071, 0.5083026, 0.3679963, 1, 1, 1, 1, 1,
0.4587262, -0.1925911, 3.534208, 1, 1, 1, 1, 1,
0.4595245, -0.6648431, 3.766322, 1, 1, 1, 1, 1,
0.4611799, -0.860777, 1.324202, 1, 1, 1, 1, 1,
0.4616623, -0.1207487, 1.456986, 0, 0, 1, 1, 1,
0.4632553, -0.9664355, 3.048799, 1, 0, 0, 1, 1,
0.4647883, 1.847316, 0.5286016, 1, 0, 0, 1, 1,
0.4676157, -0.4820581, 2.184558, 1, 0, 0, 1, 1,
0.4696875, -0.9337092, 2.750695, 1, 0, 0, 1, 1,
0.4709101, -0.3579443, 1.064133, 1, 0, 0, 1, 1,
0.4719894, -0.8005354, 4.834199, 0, 0, 0, 1, 1,
0.4776407, 0.2957651, 1.984808, 0, 0, 0, 1, 1,
0.4784771, -0.4827739, 2.129436, 0, 0, 0, 1, 1,
0.4836816, -1.28705, 2.966775, 0, 0, 0, 1, 1,
0.4841683, -0.06980173, 2.309121, 0, 0, 0, 1, 1,
0.4847609, -1.464923, 3.929924, 0, 0, 0, 1, 1,
0.4856082, -0.6839368, 3.825577, 0, 0, 0, 1, 1,
0.4880575, 0.2964025, 1.409271, 1, 1, 1, 1, 1,
0.4946205, -0.07433746, 2.226753, 1, 1, 1, 1, 1,
0.4962863, -1.541412, 2.322709, 1, 1, 1, 1, 1,
0.4988991, -0.7725616, 1.732645, 1, 1, 1, 1, 1,
0.5058598, -1.32661, 3.895185, 1, 1, 1, 1, 1,
0.5063835, 0.1624132, 3.226763, 1, 1, 1, 1, 1,
0.512278, 0.4976032, 0.6954969, 1, 1, 1, 1, 1,
0.5164237, 0.5102014, -0.03258697, 1, 1, 1, 1, 1,
0.517396, -1.32771, 1.883894, 1, 1, 1, 1, 1,
0.5230291, -0.180334, 1.479023, 1, 1, 1, 1, 1,
0.5334623, 1.758772, -0.5193389, 1, 1, 1, 1, 1,
0.5384294, -0.5743073, 3.986882, 1, 1, 1, 1, 1,
0.5391055, 1.305064, 0.9967602, 1, 1, 1, 1, 1,
0.5403577, -1.001023, 2.38505, 1, 1, 1, 1, 1,
0.5445469, 0.8718908, -0.3113766, 1, 1, 1, 1, 1,
0.5477971, -1.032727, 1.664706, 0, 0, 1, 1, 1,
0.5491947, -0.2176214, 3.96194, 1, 0, 0, 1, 1,
0.5500746, -0.874271, 2.343657, 1, 0, 0, 1, 1,
0.550328, -0.2657717, 1.18726, 1, 0, 0, 1, 1,
0.5531216, 0.7749175, 0.4457144, 1, 0, 0, 1, 1,
0.562129, -0.6376389, 3.568797, 1, 0, 0, 1, 1,
0.5693822, -0.07754743, 0.2560441, 0, 0, 0, 1, 1,
0.5700839, 1.355391, 1.465475, 0, 0, 0, 1, 1,
0.5727224, -0.1892939, 3.11631, 0, 0, 0, 1, 1,
0.5758461, -0.07454792, 1.117746, 0, 0, 0, 1, 1,
0.5783084, -1.118515, 0.8136712, 0, 0, 0, 1, 1,
0.5798929, -0.6701254, 3.031156, 0, 0, 0, 1, 1,
0.5800996, -0.6819602, 2.567782, 0, 0, 0, 1, 1,
0.5829917, 0.3669443, 1.838569, 1, 1, 1, 1, 1,
0.5846881, -0.867167, 1.937689, 1, 1, 1, 1, 1,
0.5859665, -1.332881, 2.122468, 1, 1, 1, 1, 1,
0.5869834, 0.1135762, 2.161885, 1, 1, 1, 1, 1,
0.5878255, 0.2586843, 0.5009217, 1, 1, 1, 1, 1,
0.5882266, 0.6951953, -1.557077, 1, 1, 1, 1, 1,
0.5895692, -0.5501267, 1.510787, 1, 1, 1, 1, 1,
0.5945635, -0.140145, 2.460792, 1, 1, 1, 1, 1,
0.5946442, 0.2472715, 0.4246052, 1, 1, 1, 1, 1,
0.5951675, -0.166978, 2.142365, 1, 1, 1, 1, 1,
0.5969285, -0.4937698, 1.410636, 1, 1, 1, 1, 1,
0.5983301, -0.4439598, 1.950751, 1, 1, 1, 1, 1,
0.5990829, 1.222213, 0.4351108, 1, 1, 1, 1, 1,
0.6010373, -0.5780641, 3.33216, 1, 1, 1, 1, 1,
0.6089076, 0.6817707, 0.8103349, 1, 1, 1, 1, 1,
0.6147651, 0.03726205, 1.113723, 0, 0, 1, 1, 1,
0.6242124, 0.3027746, 2.016203, 1, 0, 0, 1, 1,
0.6297377, -1.112805, 3.997923, 1, 0, 0, 1, 1,
0.6318817, 0.4226649, 1.683167, 1, 0, 0, 1, 1,
0.6406868, -0.4103957, 3.03614, 1, 0, 0, 1, 1,
0.6417301, 0.8320808, 3.14643, 1, 0, 0, 1, 1,
0.6425973, -0.1405419, 1.908232, 0, 0, 0, 1, 1,
0.6429298, -1.410918, 2.554274, 0, 0, 0, 1, 1,
0.6448707, 0.569988, -0.6736321, 0, 0, 0, 1, 1,
0.646907, 0.1519444, 1.596684, 0, 0, 0, 1, 1,
0.6494862, 1.262872, -2.654898, 0, 0, 0, 1, 1,
0.649766, -1.113569, 2.63651, 0, 0, 0, 1, 1,
0.6606427, -1.498638, 3.094847, 0, 0, 0, 1, 1,
0.6621698, 0.1954874, 1.524494, 1, 1, 1, 1, 1,
0.6646152, 0.5809298, 0.9432678, 1, 1, 1, 1, 1,
0.6656834, 0.7563092, 1.868919, 1, 1, 1, 1, 1,
0.6705233, 0.513657, 0.1516609, 1, 1, 1, 1, 1,
0.6707266, -0.7870476, 3.144218, 1, 1, 1, 1, 1,
0.6740637, 0.05673277, 0.8232041, 1, 1, 1, 1, 1,
0.6779633, -0.7391201, 2.897523, 1, 1, 1, 1, 1,
0.6806262, -0.4855569, 2.15659, 1, 1, 1, 1, 1,
0.6822071, -0.1888989, 3.351274, 1, 1, 1, 1, 1,
0.6826118, -1.15775, 3.393588, 1, 1, 1, 1, 1,
0.6842722, 0.7762464, 0.01656466, 1, 1, 1, 1, 1,
0.686425, -1.116714, 3.484482, 1, 1, 1, 1, 1,
0.7031528, -0.3095319, 1.531348, 1, 1, 1, 1, 1,
0.7036152, 0.2912165, 0.7057242, 1, 1, 1, 1, 1,
0.7069619, -0.05843791, 1.619844, 1, 1, 1, 1, 1,
0.7084741, 0.4074934, 1.398673, 0, 0, 1, 1, 1,
0.7124091, -0.3697831, 0.9436671, 1, 0, 0, 1, 1,
0.715311, -0.3094249, 2.41141, 1, 0, 0, 1, 1,
0.7188603, -0.8232668, 1.55485, 1, 0, 0, 1, 1,
0.7200496, 0.1173413, 0.3239287, 1, 0, 0, 1, 1,
0.7258595, -0.06024938, 1.988511, 1, 0, 0, 1, 1,
0.7299434, -0.4899887, 1.545477, 0, 0, 0, 1, 1,
0.7319865, 0.8653746, 0.6438292, 0, 0, 0, 1, 1,
0.7320603, 0.8003857, 1.344487, 0, 0, 0, 1, 1,
0.739885, -0.3393262, 1.956714, 0, 0, 0, 1, 1,
0.7405769, -0.8624005, 3.9523, 0, 0, 0, 1, 1,
0.7422311, -0.03151751, 1.75053, 0, 0, 0, 1, 1,
0.7524223, -0.7924484, -0.1747186, 0, 0, 0, 1, 1,
0.7532668, 1.077661, -0.5291726, 1, 1, 1, 1, 1,
0.7533211, -0.251817, 0.8252736, 1, 1, 1, 1, 1,
0.7553369, -1.00218, 2.644676, 1, 1, 1, 1, 1,
0.7644315, -1.891157, 2.714795, 1, 1, 1, 1, 1,
0.7666398, 0.4508756, 0.4470145, 1, 1, 1, 1, 1,
0.7695577, 1.525037, -0.4685439, 1, 1, 1, 1, 1,
0.7698776, -0.04451625, 1.092353, 1, 1, 1, 1, 1,
0.7716619, -0.8878134, 3.499319, 1, 1, 1, 1, 1,
0.776085, 1.664746, 0.7558953, 1, 1, 1, 1, 1,
0.7837523, -0.2361602, 2.068163, 1, 1, 1, 1, 1,
0.7853722, -0.4237831, 0.9338165, 1, 1, 1, 1, 1,
0.7860757, 0.4336703, -0.9570919, 1, 1, 1, 1, 1,
0.7933959, 1.306188, 1.231931, 1, 1, 1, 1, 1,
0.7937182, 0.2921132, 0.02393947, 1, 1, 1, 1, 1,
0.7954988, -1.279042, 2.896604, 1, 1, 1, 1, 1,
0.8003622, -2.105179, 1.475351, 0, 0, 1, 1, 1,
0.8025618, -0.3598084, 1.172692, 1, 0, 0, 1, 1,
0.8054571, -1.921256, 2.548201, 1, 0, 0, 1, 1,
0.8096164, -1.192342, 2.412025, 1, 0, 0, 1, 1,
0.8143421, 0.1359872, 0.343405, 1, 0, 0, 1, 1,
0.816857, 0.7608768, 1.985665, 1, 0, 0, 1, 1,
0.824891, -0.1663096, 1.583598, 0, 0, 0, 1, 1,
0.8265494, 0.2495008, 1.626465, 0, 0, 0, 1, 1,
0.8288833, -0.3063008, 2.827346, 0, 0, 0, 1, 1,
0.8312764, 0.0619233, 0.8378146, 0, 0, 0, 1, 1,
0.8350336, 0.397682, 0.8868022, 0, 0, 0, 1, 1,
0.8387275, -0.2825037, 1.835342, 0, 0, 0, 1, 1,
0.8401046, -0.636472, 3.05391, 0, 0, 0, 1, 1,
0.8444369, -0.07904992, 0.4066589, 1, 1, 1, 1, 1,
0.8510973, 0.2123839, 1.285652, 1, 1, 1, 1, 1,
0.8528945, 0.3591058, 0.1424221, 1, 1, 1, 1, 1,
0.8541428, 0.4479461, 1.696951, 1, 1, 1, 1, 1,
0.8618043, -0.1550927, 1.076948, 1, 1, 1, 1, 1,
0.8620839, -0.7044764, 1.043014, 1, 1, 1, 1, 1,
0.8657417, 0.2247801, 3.629276, 1, 1, 1, 1, 1,
0.8726214, -0.1028775, 1.518471, 1, 1, 1, 1, 1,
0.8789367, 0.1963943, 2.489107, 1, 1, 1, 1, 1,
0.881728, -1.404222, 3.728166, 1, 1, 1, 1, 1,
0.8848025, 0.4140037, 1.346988, 1, 1, 1, 1, 1,
0.8874248, 0.746145, -0.4226816, 1, 1, 1, 1, 1,
0.8896195, -1.49259, 2.322866, 1, 1, 1, 1, 1,
0.8898388, 0.04907647, 1.758833, 1, 1, 1, 1, 1,
0.8968171, -0.2126148, 2.350661, 1, 1, 1, 1, 1,
0.8976315, 0.725237, 2.4119, 0, 0, 1, 1, 1,
0.8998564, 0.003025907, 2.128086, 1, 0, 0, 1, 1,
0.9049094, -0.3107861, 2.629869, 1, 0, 0, 1, 1,
0.9084168, -0.4054771, 2.520924, 1, 0, 0, 1, 1,
0.9159625, 0.3926991, 1.942579, 1, 0, 0, 1, 1,
0.9161648, 0.2378778, 2.364379, 1, 0, 0, 1, 1,
0.9164952, -0.1529607, 2.215708, 0, 0, 0, 1, 1,
0.9200804, -0.4534949, 2.961985, 0, 0, 0, 1, 1,
0.9295777, -1.158289, 1.152553, 0, 0, 0, 1, 1,
0.9328986, -2.29685, 2.480729, 0, 0, 0, 1, 1,
0.934445, -0.3059137, 0.6172801, 0, 0, 0, 1, 1,
0.9386693, -1.646531, 2.963794, 0, 0, 0, 1, 1,
0.9395431, -1.014675, 1.805269, 0, 0, 0, 1, 1,
0.9453676, 1.088978, 1.373685, 1, 1, 1, 1, 1,
0.9602319, 0.3848603, 1.635046, 1, 1, 1, 1, 1,
0.9633471, 0.3031796, 2.84914, 1, 1, 1, 1, 1,
0.963768, -0.7699415, 2.981819, 1, 1, 1, 1, 1,
0.964516, -1.169583, 2.793761, 1, 1, 1, 1, 1,
0.9726623, 0.1009664, 1.366799, 1, 1, 1, 1, 1,
0.9728577, -1.764211, 2.88431, 1, 1, 1, 1, 1,
0.9731295, -0.1301239, 0.2227665, 1, 1, 1, 1, 1,
0.9775168, -1.252103, 2.976801, 1, 1, 1, 1, 1,
0.9794168, -0.9051494, 1.610841, 1, 1, 1, 1, 1,
0.9802049, -0.6443197, 2.327503, 1, 1, 1, 1, 1,
0.9820753, -0.5358796, 2.976755, 1, 1, 1, 1, 1,
0.9831231, 1.363362, 0.3344157, 1, 1, 1, 1, 1,
0.9837523, 0.1688295, 1.642275, 1, 1, 1, 1, 1,
0.9878541, -0.6847634, 0.202579, 1, 1, 1, 1, 1,
0.98879, -0.415484, 2.545278, 0, 0, 1, 1, 1,
0.994747, 0.5510564, 2.056741, 1, 0, 0, 1, 1,
0.9954341, -1.540421, 2.728483, 1, 0, 0, 1, 1,
0.9959301, -1.36481, 2.081387, 1, 0, 0, 1, 1,
1.008117, 1.427676, 0.4202082, 1, 0, 0, 1, 1,
1.012816, 1.624307, 0.6946149, 1, 0, 0, 1, 1,
1.022774, -0.2403971, 0.8157058, 0, 0, 0, 1, 1,
1.029952, -0.4580663, 1.719149, 0, 0, 0, 1, 1,
1.032642, 0.4256469, 1.340109, 0, 0, 0, 1, 1,
1.033481, -0.6970249, 0.7706453, 0, 0, 0, 1, 1,
1.0386, -0.1955701, 1.348362, 0, 0, 0, 1, 1,
1.039389, 0.8264, 0.2388193, 0, 0, 0, 1, 1,
1.067909, 1.238736, 2.529095, 0, 0, 0, 1, 1,
1.082993, -0.1044462, 0.8665065, 1, 1, 1, 1, 1,
1.08318, -0.07233346, 1.622392, 1, 1, 1, 1, 1,
1.101303, -1.194857, 3.658709, 1, 1, 1, 1, 1,
1.10502, -2.2048, 4.333176, 1, 1, 1, 1, 1,
1.116072, -0.3962684, 0.2080174, 1, 1, 1, 1, 1,
1.128463, -0.7358496, 2.136003, 1, 1, 1, 1, 1,
1.128867, 0.4253426, 1.357648, 1, 1, 1, 1, 1,
1.129291, 1.232729, -1.465039, 1, 1, 1, 1, 1,
1.13501, -0.2354623, 2.695584, 1, 1, 1, 1, 1,
1.136728, 0.1246871, 1.029832, 1, 1, 1, 1, 1,
1.145853, -0.8090941, 2.621248, 1, 1, 1, 1, 1,
1.148143, -1.791378, 2.534254, 1, 1, 1, 1, 1,
1.157331, -0.2026219, 1.123899, 1, 1, 1, 1, 1,
1.157397, 0.2486523, 2.247869, 1, 1, 1, 1, 1,
1.158021, -2.541756, 3.383164, 1, 1, 1, 1, 1,
1.160117, -0.984244, 1.127366, 0, 0, 1, 1, 1,
1.16355, 0.823837, 1.10113, 1, 0, 0, 1, 1,
1.171621, -0.1154236, 2.354057, 1, 0, 0, 1, 1,
1.172371, -0.7728511, 2.414935, 1, 0, 0, 1, 1,
1.173347, 0.8999949, -1.175394, 1, 0, 0, 1, 1,
1.185473, -1.122235, 2.763799, 1, 0, 0, 1, 1,
1.187925, -0.2813569, 0.05103379, 0, 0, 0, 1, 1,
1.188506, -1.764365, 4.28625, 0, 0, 0, 1, 1,
1.200594, -0.8426729, 3.009789, 0, 0, 0, 1, 1,
1.201062, -2.32854, 2.526086, 0, 0, 0, 1, 1,
1.2019, 1.251765, 2.476864, 0, 0, 0, 1, 1,
1.203237, 0.6491891, 0.6927961, 0, 0, 0, 1, 1,
1.204704, -0.9762363, 2.57219, 0, 0, 0, 1, 1,
1.211634, -0.9596993, 2.525133, 1, 1, 1, 1, 1,
1.214844, 1.161767, 0.5030953, 1, 1, 1, 1, 1,
1.215505, -0.1313995, 1.168031, 1, 1, 1, 1, 1,
1.216213, 0.04227293, 2.435926, 1, 1, 1, 1, 1,
1.217227, -0.9657827, 0.8714185, 1, 1, 1, 1, 1,
1.218583, 0.2525126, 2.116865, 1, 1, 1, 1, 1,
1.219475, -1.193622, 2.339248, 1, 1, 1, 1, 1,
1.226717, 0.5845637, 2.785214, 1, 1, 1, 1, 1,
1.23953, -0.2724498, 2.303752, 1, 1, 1, 1, 1,
1.241416, 0.1286353, 0.5364298, 1, 1, 1, 1, 1,
1.247135, -0.3059027, 2.504748, 1, 1, 1, 1, 1,
1.26704, 1.744824, -0.4127549, 1, 1, 1, 1, 1,
1.269732, 0.723502, 1.268514, 1, 1, 1, 1, 1,
1.27102, -0.004127783, 2.733509, 1, 1, 1, 1, 1,
1.273517, -0.3878817, 1.452584, 1, 1, 1, 1, 1,
1.281433, -0.756899, 2.198575, 0, 0, 1, 1, 1,
1.282228, -0.06026908, 1.677692, 1, 0, 0, 1, 1,
1.283185, 0.9348279, 1.653915, 1, 0, 0, 1, 1,
1.28965, -1.585991, 1.013917, 1, 0, 0, 1, 1,
1.302162, 0.7546862, 0.1675966, 1, 0, 0, 1, 1,
1.303622, -1.145057, 2.250938, 1, 0, 0, 1, 1,
1.305786, -1.781452, 2.460072, 0, 0, 0, 1, 1,
1.307095, -1.339229, 1.273033, 0, 0, 0, 1, 1,
1.316719, 0.5632637, 0.9266195, 0, 0, 0, 1, 1,
1.319827, 1.33383, -1.946629, 0, 0, 0, 1, 1,
1.324514, -0.9455383, 3.200446, 0, 0, 0, 1, 1,
1.325449, -0.4156531, 1.10632, 0, 0, 0, 1, 1,
1.328351, 0.5174755, 2.524095, 0, 0, 0, 1, 1,
1.328499, -1.109435, 0.2215629, 1, 1, 1, 1, 1,
1.335105, -1.01077, 2.929848, 1, 1, 1, 1, 1,
1.343071, 0.3991306, 1.177849, 1, 1, 1, 1, 1,
1.356505, -0.9477587, 2.475411, 1, 1, 1, 1, 1,
1.359877, -1.504106, 1.682279, 1, 1, 1, 1, 1,
1.361515, 0.8751427, 2.636095, 1, 1, 1, 1, 1,
1.368391, 0.6152001, 2.309531, 1, 1, 1, 1, 1,
1.371219, 0.01083453, 1.853039, 1, 1, 1, 1, 1,
1.372213, -1.073803, 1.238993, 1, 1, 1, 1, 1,
1.380371, 0.6699271, -1.313298, 1, 1, 1, 1, 1,
1.38646, 0.5105961, -0.3978344, 1, 1, 1, 1, 1,
1.390264, -0.8547103, 2.791306, 1, 1, 1, 1, 1,
1.394034, 0.1107919, 2.02464, 1, 1, 1, 1, 1,
1.400231, -0.8809264, 1.589325, 1, 1, 1, 1, 1,
1.402607, -0.4379414, 0.5679635, 1, 1, 1, 1, 1,
1.423073, -0.3358279, 1.010811, 0, 0, 1, 1, 1,
1.428772, 0.272997, 1.856317, 1, 0, 0, 1, 1,
1.432315, -1.116998, 2.364978, 1, 0, 0, 1, 1,
1.458028, 0.4354512, 0.5631372, 1, 0, 0, 1, 1,
1.459126, 1.357597, 1.859691, 1, 0, 0, 1, 1,
1.464327, -1.641124, 1.35133, 1, 0, 0, 1, 1,
1.466971, -0.06936975, 2.450105, 0, 0, 0, 1, 1,
1.477222, -0.2147795, 1.501245, 0, 0, 0, 1, 1,
1.480142, 0.364196, -0.9718694, 0, 0, 0, 1, 1,
1.504157, 0.4692599, 1.657647, 0, 0, 0, 1, 1,
1.508122, 0.3583141, 1.832337, 0, 0, 0, 1, 1,
1.524123, -0.5188177, 3.07015, 0, 0, 0, 1, 1,
1.556117, 0.2119787, 1.399343, 0, 0, 0, 1, 1,
1.56626, -2.497442, 2.912544, 1, 1, 1, 1, 1,
1.574098, 0.2284334, 1.09568, 1, 1, 1, 1, 1,
1.578812, -1.088265, 2.554169, 1, 1, 1, 1, 1,
1.580064, -0.6061906, -0.1865616, 1, 1, 1, 1, 1,
1.588871, 0.2236972, 2.994081, 1, 1, 1, 1, 1,
1.595358, 0.5902617, 0.3456842, 1, 1, 1, 1, 1,
1.596001, 0.5221292, -0.5770081, 1, 1, 1, 1, 1,
1.617972, 0.6990788, 1.486495, 1, 1, 1, 1, 1,
1.619408, -0.2755891, 2.681984, 1, 1, 1, 1, 1,
1.625548, 0.4276027, 1.534786, 1, 1, 1, 1, 1,
1.651207, -0.3854569, 3.270498, 1, 1, 1, 1, 1,
1.651714, -0.3230832, 2.873584, 1, 1, 1, 1, 1,
1.656176, 0.8779635, -0.6965259, 1, 1, 1, 1, 1,
1.659309, -1.399006, 2.559231, 1, 1, 1, 1, 1,
1.664404, 0.1327292, 2.557595, 1, 1, 1, 1, 1,
1.671417, -1.13366, 1.322549, 0, 0, 1, 1, 1,
1.703874, 0.8211967, 1.378012, 1, 0, 0, 1, 1,
1.711543, 0.3497678, 0.4016212, 1, 0, 0, 1, 1,
1.721245, 0.533228, 1.351685, 1, 0, 0, 1, 1,
1.722018, 1.539818, 1.067295, 1, 0, 0, 1, 1,
1.73039, -0.4534387, 2.742478, 1, 0, 0, 1, 1,
1.767501, 0.6258155, 2.70839, 0, 0, 0, 1, 1,
1.768553, 0.5430862, 1.392397, 0, 0, 0, 1, 1,
1.770982, -0.3275983, 3.023196, 0, 0, 0, 1, 1,
1.775651, -0.6731488, 2.691071, 0, 0, 0, 1, 1,
1.78278, -1.004357, 3.275574, 0, 0, 0, 1, 1,
1.785549, -0.4088145, 1.470823, 0, 0, 0, 1, 1,
1.790277, -0.6801524, 3.134776, 0, 0, 0, 1, 1,
1.805148, -0.8961251, 1.027985, 1, 1, 1, 1, 1,
1.827686, -0.9479347, 2.314817, 1, 1, 1, 1, 1,
1.837145, 1.825394, 1.080594, 1, 1, 1, 1, 1,
1.844358, -0.007922289, 0.1295978, 1, 1, 1, 1, 1,
1.882659, 0.7185001, 0.3326998, 1, 1, 1, 1, 1,
1.884328, 1.221908, 0.2070718, 1, 1, 1, 1, 1,
1.885132, -1.749931, 1.975314, 1, 1, 1, 1, 1,
1.887545, -0.4924781, 2.889138, 1, 1, 1, 1, 1,
1.892562, 1.263094, 0.5897053, 1, 1, 1, 1, 1,
1.911838, 0.708672, 0.7939823, 1, 1, 1, 1, 1,
1.923719, -0.3018971, 2.273086, 1, 1, 1, 1, 1,
1.94263, -1.231695, 1.87786, 1, 1, 1, 1, 1,
1.953375, -0.1202867, 0.2963559, 1, 1, 1, 1, 1,
1.956852, 0.7569739, -0.6670482, 1, 1, 1, 1, 1,
2.049364, 0.839233, 1.438164, 1, 1, 1, 1, 1,
2.0637, -0.4623149, 3.627104, 0, 0, 1, 1, 1,
2.065456, -1.100159, 2.39522, 1, 0, 0, 1, 1,
2.065591, 0.1921248, 0.4053895, 1, 0, 0, 1, 1,
2.0742, 0.0877007, 1.107166, 1, 0, 0, 1, 1,
2.076842, 0.7665048, 1.119981, 1, 0, 0, 1, 1,
2.160091, 0.456459, 1.823262, 1, 0, 0, 1, 1,
2.163358, -1.21218, 3.067364, 0, 0, 0, 1, 1,
2.191569, -2.138956, 5.042349, 0, 0, 0, 1, 1,
2.20056, 1.616597, -1.111126, 0, 0, 0, 1, 1,
2.280893, -1.235865, 2.422901, 0, 0, 0, 1, 1,
2.322075, -1.6971, 3.757699, 0, 0, 0, 1, 1,
2.370297, -0.1918457, 2.558884, 0, 0, 0, 1, 1,
2.552016, -1.270908, 2.726922, 0, 0, 0, 1, 1,
2.570292, 1.616439, 0.3493307, 1, 1, 1, 1, 1,
2.579752, 2.490741, 1.680061, 1, 1, 1, 1, 1,
2.581656, 0.2997995, 0.2951226, 1, 1, 1, 1, 1,
2.770702, -0.5391366, 0.6816047, 1, 1, 1, 1, 1,
2.782968, 2.072372, 1.023447, 1, 1, 1, 1, 1,
2.845606, 1.465271, 0.4721027, 1, 1, 1, 1, 1,
3.239425, -1.009415, 1.44433, 1, 1, 1, 1, 1
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
var radius = 9.568331;
var distance = 33.60836;
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
mvMatrix.translate( 0.01924562, 0.2170515, -0.002812386 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.60836);
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