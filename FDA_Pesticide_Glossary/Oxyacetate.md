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
-3.130465, -0.4350101, -0.7920438, 1, 0, 0, 1,
-2.908907, 0.4729397, -0.2906457, 1, 0.007843138, 0, 1,
-2.693297, -0.1779777, -1.679853, 1, 0.01176471, 0, 1,
-2.640163, -0.4468151, -2.079171, 1, 0.01960784, 0, 1,
-2.61887, -1.687597, -0.9168221, 1, 0.02352941, 0, 1,
-2.566482, 1.029111, -0.8814111, 1, 0.03137255, 0, 1,
-2.428394, 1.035742, -1.460303, 1, 0.03529412, 0, 1,
-2.326725, 0.7653051, -0.2234795, 1, 0.04313726, 0, 1,
-2.316325, -0.001928675, 0.1515115, 1, 0.04705882, 0, 1,
-2.291469, -1.512806, -1.000095, 1, 0.05490196, 0, 1,
-2.262382, -1.511029, -1.484708, 1, 0.05882353, 0, 1,
-2.240084, 0.5406413, -0.9288983, 1, 0.06666667, 0, 1,
-2.224754, -0.8952529, -2.507485, 1, 0.07058824, 0, 1,
-2.177457, 0.3835396, -0.7366477, 1, 0.07843138, 0, 1,
-2.172474, 2.562989, -0.4684623, 1, 0.08235294, 0, 1,
-2.165447, -0.1328824, -0.09748389, 1, 0.09019608, 0, 1,
-2.156065, -0.1336823, -0.7962739, 1, 0.09411765, 0, 1,
-2.133428, 0.1681695, -2.430485, 1, 0.1019608, 0, 1,
-2.128575, 1.373996, -2.335332, 1, 0.1098039, 0, 1,
-2.067143, 0.02012691, 0.7130811, 1, 0.1137255, 0, 1,
-2.048872, -0.9852974, -2.775032, 1, 0.1215686, 0, 1,
-1.971839, -0.7358211, -1.340197, 1, 0.1254902, 0, 1,
-1.955097, 0.6107675, 0.638537, 1, 0.1333333, 0, 1,
-1.912868, 1.667785, 0.8303651, 1, 0.1372549, 0, 1,
-1.886998, 0.3934796, -2.631004, 1, 0.145098, 0, 1,
-1.884027, 1.69377, -0.2525174, 1, 0.1490196, 0, 1,
-1.882579, 0.1106651, 0.6579279, 1, 0.1568628, 0, 1,
-1.87797, 0.3674003, -1.238524, 1, 0.1607843, 0, 1,
-1.841308, -0.6876567, -1.351412, 1, 0.1686275, 0, 1,
-1.813281, 0.8321062, 0.1241906, 1, 0.172549, 0, 1,
-1.812925, -3.386611, -3.085442, 1, 0.1803922, 0, 1,
-1.811866, 0.5368354, -0.8550093, 1, 0.1843137, 0, 1,
-1.807044, 0.5442981, -0.9015189, 1, 0.1921569, 0, 1,
-1.800638, -0.04084386, -1.122277, 1, 0.1960784, 0, 1,
-1.787073, 0.2662348, -3.779499, 1, 0.2039216, 0, 1,
-1.77729, 0.05900817, -1.607954, 1, 0.2117647, 0, 1,
-1.765902, -0.6572046, -1.753406, 1, 0.2156863, 0, 1,
-1.753868, -1.219413, -1.534966, 1, 0.2235294, 0, 1,
-1.74591, -2.602173, -3.487976, 1, 0.227451, 0, 1,
-1.744094, -0.5501668, -0.1139988, 1, 0.2352941, 0, 1,
-1.742776, 0.4610611, -0.8975732, 1, 0.2392157, 0, 1,
-1.729373, -0.2699946, -2.700405, 1, 0.2470588, 0, 1,
-1.728928, -0.3354594, -0.6174864, 1, 0.2509804, 0, 1,
-1.728293, 0.7100673, -1.845573, 1, 0.2588235, 0, 1,
-1.719596, 0.7310739, -0.8474545, 1, 0.2627451, 0, 1,
-1.712328, -0.1038133, -1.768281, 1, 0.2705882, 0, 1,
-1.683756, 1.591926, -0.8090271, 1, 0.2745098, 0, 1,
-1.676353, 0.8227693, -2.54588, 1, 0.282353, 0, 1,
-1.670217, -0.3732469, -3.034766, 1, 0.2862745, 0, 1,
-1.668466, -0.216636, -1.949435, 1, 0.2941177, 0, 1,
-1.652933, 1.219828, -0.9624415, 1, 0.3019608, 0, 1,
-1.651081, -0.2789396, -1.301224, 1, 0.3058824, 0, 1,
-1.626734, 0.08308662, -0.5790081, 1, 0.3137255, 0, 1,
-1.620766, -0.419473, -2.535533, 1, 0.3176471, 0, 1,
-1.605902, 0.7478512, -0.6870678, 1, 0.3254902, 0, 1,
-1.603415, 0.7274137, 0.9874907, 1, 0.3294118, 0, 1,
-1.591547, 0.5419833, 2.111625, 1, 0.3372549, 0, 1,
-1.576087, 0.7480989, -0.4236535, 1, 0.3411765, 0, 1,
-1.568504, -0.5100421, -3.257978, 1, 0.3490196, 0, 1,
-1.563109, 1.549519, 0.5701376, 1, 0.3529412, 0, 1,
-1.554697, 0.4786594, -2.990429, 1, 0.3607843, 0, 1,
-1.551593, 0.9988856, -1.39732, 1, 0.3647059, 0, 1,
-1.551416, 1.099348, 0.8996701, 1, 0.372549, 0, 1,
-1.548673, 0.5839677, 0.004944057, 1, 0.3764706, 0, 1,
-1.548497, -1.512334, -2.529828, 1, 0.3843137, 0, 1,
-1.548116, -0.9295771, -2.336859, 1, 0.3882353, 0, 1,
-1.546016, -0.5247488, -3.025266, 1, 0.3960784, 0, 1,
-1.540894, 0.8324471, -0.8707485, 1, 0.4039216, 0, 1,
-1.537743, -0.2377319, -3.459105, 1, 0.4078431, 0, 1,
-1.534222, -0.3803283, -3.036797, 1, 0.4156863, 0, 1,
-1.531736, -0.01446589, -2.541329, 1, 0.4196078, 0, 1,
-1.519178, 0.950099, -0.7341511, 1, 0.427451, 0, 1,
-1.517479, -0.1885452, -1.043359, 1, 0.4313726, 0, 1,
-1.515857, -0.5596232, -2.134115, 1, 0.4392157, 0, 1,
-1.49056, 0.1528749, -1.887055, 1, 0.4431373, 0, 1,
-1.489706, 0.007841283, -0.604575, 1, 0.4509804, 0, 1,
-1.479591, 0.3582381, -1.01809, 1, 0.454902, 0, 1,
-1.476765, -1.65869, -1.526634, 1, 0.4627451, 0, 1,
-1.467868, -0.7981569, -0.7214203, 1, 0.4666667, 0, 1,
-1.465315, -0.03438396, 0.5732918, 1, 0.4745098, 0, 1,
-1.463529, -2.226035, -4.257724, 1, 0.4784314, 0, 1,
-1.451266, 0.2911634, -1.077898, 1, 0.4862745, 0, 1,
-1.408156, -0.6221119, -2.51623, 1, 0.4901961, 0, 1,
-1.391883, -0.8009284, -3.117848, 1, 0.4980392, 0, 1,
-1.39115, 0.7318454, -0.862579, 1, 0.5058824, 0, 1,
-1.383834, -0.6261557, -0.8731328, 1, 0.509804, 0, 1,
-1.377393, -0.1961064, -1.409133, 1, 0.5176471, 0, 1,
-1.373805, -0.001882987, -0.8869068, 1, 0.5215687, 0, 1,
-1.366693, 0.4077999, -1.475527, 1, 0.5294118, 0, 1,
-1.361379, -0.02892613, -1.143292, 1, 0.5333334, 0, 1,
-1.359044, -0.1837009, -2.241861, 1, 0.5411765, 0, 1,
-1.352488, -0.7486533, -2.397413, 1, 0.5450981, 0, 1,
-1.351531, -0.2292227, -1.689725, 1, 0.5529412, 0, 1,
-1.339771, 1.316938, -1.739305, 1, 0.5568628, 0, 1,
-1.338472, 0.8557905, -0.4084529, 1, 0.5647059, 0, 1,
-1.317813, -1.450236, -1.359849, 1, 0.5686275, 0, 1,
-1.283375, 0.02371972, -2.137512, 1, 0.5764706, 0, 1,
-1.28202, -0.467426, -0.4100486, 1, 0.5803922, 0, 1,
-1.281748, -0.5539349, -2.406096, 1, 0.5882353, 0, 1,
-1.26846, 1.090091, -1.678772, 1, 0.5921569, 0, 1,
-1.254596, -0.6130536, -1.805196, 1, 0.6, 0, 1,
-1.253883, 1.0443, -0.9741887, 1, 0.6078432, 0, 1,
-1.252566, 0.09858695, -1.392072, 1, 0.6117647, 0, 1,
-1.243276, 0.1636941, -0.5324425, 1, 0.6196079, 0, 1,
-1.230368, -0.9481151, -3.131964, 1, 0.6235294, 0, 1,
-1.229915, 0.06964009, -2.238997, 1, 0.6313726, 0, 1,
-1.225497, -0.02465025, -1.186187, 1, 0.6352941, 0, 1,
-1.224334, 0.7480567, -0.7339161, 1, 0.6431373, 0, 1,
-1.210087, -1.311059, -4.185572, 1, 0.6470588, 0, 1,
-1.207649, 0.9390675, -1.597699, 1, 0.654902, 0, 1,
-1.20623, -0.2445528, -1.556879, 1, 0.6588235, 0, 1,
-1.199725, -1.302817, -4.625867, 1, 0.6666667, 0, 1,
-1.19674, 0.08008938, -3.706439, 1, 0.6705883, 0, 1,
-1.195899, 0.2185962, -0.1957618, 1, 0.6784314, 0, 1,
-1.192541, -0.6959631, -0.3200538, 1, 0.682353, 0, 1,
-1.192226, -1.179716, -4.427525, 1, 0.6901961, 0, 1,
-1.179694, 0.7567102, -0.2271668, 1, 0.6941177, 0, 1,
-1.172469, -0.3235144, -1.958893, 1, 0.7019608, 0, 1,
-1.167805, -1.587096, -0.8379935, 1, 0.7098039, 0, 1,
-1.165087, -0.60747, -2.427796, 1, 0.7137255, 0, 1,
-1.162169, -1.524206, -4.179255, 1, 0.7215686, 0, 1,
-1.150244, 0.5439183, -0.255647, 1, 0.7254902, 0, 1,
-1.150115, -0.6751961, -3.605111, 1, 0.7333333, 0, 1,
-1.126614, -0.6760597, -1.55026, 1, 0.7372549, 0, 1,
-1.126054, -0.38587, -1.778302, 1, 0.7450981, 0, 1,
-1.119006, -0.4063031, -2.734051, 1, 0.7490196, 0, 1,
-1.114192, 0.4110054, -3.182681, 1, 0.7568628, 0, 1,
-1.106726, 0.01568273, -1.903063, 1, 0.7607843, 0, 1,
-1.099304, 0.035505, -3.049437, 1, 0.7686275, 0, 1,
-1.097297, 1.985995, -1.727067, 1, 0.772549, 0, 1,
-1.093491, 0.795949, -2.114277, 1, 0.7803922, 0, 1,
-1.091107, -1.94291, -2.8696, 1, 0.7843137, 0, 1,
-1.085249, -1.214536, -1.968652, 1, 0.7921569, 0, 1,
-1.08294, -0.2553776, -1.078904, 1, 0.7960784, 0, 1,
-1.077975, -1.53955, -2.396653, 1, 0.8039216, 0, 1,
-1.075133, -0.235309, -2.918669, 1, 0.8117647, 0, 1,
-1.072948, 0.318803, -1.626186, 1, 0.8156863, 0, 1,
-1.06439, 0.1193055, -0.5726542, 1, 0.8235294, 0, 1,
-1.063684, -0.9561017, -3.17381, 1, 0.827451, 0, 1,
-1.0623, -1.360764, -1.638887, 1, 0.8352941, 0, 1,
-1.054433, 0.5091373, -2.521135, 1, 0.8392157, 0, 1,
-1.050177, 0.3128354, -1.005743, 1, 0.8470588, 0, 1,
-1.048207, 2.344003, 0.7439052, 1, 0.8509804, 0, 1,
-1.045822, -1.225623, -2.054085, 1, 0.8588235, 0, 1,
-1.044617, 1.17417, -2.339919, 1, 0.8627451, 0, 1,
-1.044312, -0.9952118, -0.5236676, 1, 0.8705882, 0, 1,
-1.035439, -2.016552, -2.241693, 1, 0.8745098, 0, 1,
-1.02305, 0.7041058, 1.046497, 1, 0.8823529, 0, 1,
-1.013033, -0.3986565, -2.052517, 1, 0.8862745, 0, 1,
-1.007315, -0.1958547, -3.681484, 1, 0.8941177, 0, 1,
-1.000512, -0.2778621, -3.393724, 1, 0.8980392, 0, 1,
-0.9971851, 0.2190244, -1.11341, 1, 0.9058824, 0, 1,
-0.9918281, -0.3071254, -0.3331528, 1, 0.9137255, 0, 1,
-0.9914302, 1.249532, -0.8114972, 1, 0.9176471, 0, 1,
-0.9878913, -0.8008434, -3.055033, 1, 0.9254902, 0, 1,
-0.9805043, -0.79157, -2.776518, 1, 0.9294118, 0, 1,
-0.9758755, 0.6927055, -0.4895974, 1, 0.9372549, 0, 1,
-0.9756277, 0.2036998, -1.13765, 1, 0.9411765, 0, 1,
-0.9726658, 1.267367, 0.3505236, 1, 0.9490196, 0, 1,
-0.9706839, -1.641958, -3.411755, 1, 0.9529412, 0, 1,
-0.9652693, 1.148728, -1.045536, 1, 0.9607843, 0, 1,
-0.9648453, -0.4824559, -3.352734, 1, 0.9647059, 0, 1,
-0.9633158, 0.5350844, -1.500796, 1, 0.972549, 0, 1,
-0.9624987, 0.1220649, -1.642442, 1, 0.9764706, 0, 1,
-0.9605311, -0.2174567, -3.189974, 1, 0.9843137, 0, 1,
-0.9604134, -0.1464023, -2.562827, 1, 0.9882353, 0, 1,
-0.9569351, 1.596331, 1.304224, 1, 0.9960784, 0, 1,
-0.9521531, -1.776467, -2.526986, 0.9960784, 1, 0, 1,
-0.9511865, 2.68005, -1.195974, 0.9921569, 1, 0, 1,
-0.9486575, -1.013399, -2.731826, 0.9843137, 1, 0, 1,
-0.9419762, -0.6611674, -3.598554, 0.9803922, 1, 0, 1,
-0.941969, 1.753636, 0.3512907, 0.972549, 1, 0, 1,
-0.9408166, -0.8556856, -1.277457, 0.9686275, 1, 0, 1,
-0.939974, -1.682716, -2.560341, 0.9607843, 1, 0, 1,
-0.9340007, -0.1596989, -2.198532, 0.9568627, 1, 0, 1,
-0.9298269, -1.465364, -2.660788, 0.9490196, 1, 0, 1,
-0.9230137, -1.366487, -2.248906, 0.945098, 1, 0, 1,
-0.9088391, 2.063761, -0.1521075, 0.9372549, 1, 0, 1,
-0.9063954, -1.027116, -2.890438, 0.9333333, 1, 0, 1,
-0.9000207, -1.779543, -3.289621, 0.9254902, 1, 0, 1,
-0.8935858, -1.094709, -2.786848, 0.9215686, 1, 0, 1,
-0.8923787, 0.2201351, -1.445625, 0.9137255, 1, 0, 1,
-0.887235, 0.9997871, -0.5454897, 0.9098039, 1, 0, 1,
-0.8867649, 0.9087059, 0.04991, 0.9019608, 1, 0, 1,
-0.8809879, 0.9810423, -0.7669343, 0.8941177, 1, 0, 1,
-0.8799534, -0.1540556, -2.717683, 0.8901961, 1, 0, 1,
-0.8796967, 1.554708, -1.30766, 0.8823529, 1, 0, 1,
-0.8792478, -1.447366, -3.339274, 0.8784314, 1, 0, 1,
-0.8771198, 1.367633, -1.559534, 0.8705882, 1, 0, 1,
-0.8769624, 0.03852744, -1.460684, 0.8666667, 1, 0, 1,
-0.8760304, 1.210842, 0.2366215, 0.8588235, 1, 0, 1,
-0.8715493, -0.4335322, -1.265107, 0.854902, 1, 0, 1,
-0.8690603, 0.2349015, -2.578838, 0.8470588, 1, 0, 1,
-0.8639151, 0.5837615, -0.1236773, 0.8431373, 1, 0, 1,
-0.8571004, 1.638703, 0.2117539, 0.8352941, 1, 0, 1,
-0.8491101, -0.06945606, -2.12345, 0.8313726, 1, 0, 1,
-0.8403724, 0.8096444, -1.060499, 0.8235294, 1, 0, 1,
-0.8318834, 0.1808943, -1.39266, 0.8196079, 1, 0, 1,
-0.8302711, 0.5720518, -2.071507, 0.8117647, 1, 0, 1,
-0.8232223, -0.7693378, -3.002338, 0.8078431, 1, 0, 1,
-0.82197, -0.2430869, -1.418117, 0.8, 1, 0, 1,
-0.8215139, -0.5259692, -1.670304, 0.7921569, 1, 0, 1,
-0.8163605, -0.2058576, -4.637955, 0.7882353, 1, 0, 1,
-0.816182, 2.023961, -1.710791, 0.7803922, 1, 0, 1,
-0.8129941, -0.7270827, -1.303072, 0.7764706, 1, 0, 1,
-0.8066618, 0.97914, 0.3362609, 0.7686275, 1, 0, 1,
-0.8060214, 0.05569939, -0.857698, 0.7647059, 1, 0, 1,
-0.8018061, -2.133047, -1.947616, 0.7568628, 1, 0, 1,
-0.7867839, -0.3616778, -1.290745, 0.7529412, 1, 0, 1,
-0.7812282, -0.4646343, -2.172695, 0.7450981, 1, 0, 1,
-0.7789121, 0.3138945, 0.5808311, 0.7411765, 1, 0, 1,
-0.7775761, -0.6230524, -3.751201, 0.7333333, 1, 0, 1,
-0.7717039, 1.075151, 0.3474222, 0.7294118, 1, 0, 1,
-0.7699358, 0.8300568, -1.958202, 0.7215686, 1, 0, 1,
-0.7608116, 0.05666187, -0.6092793, 0.7176471, 1, 0, 1,
-0.7521013, -0.06603096, -3.319581, 0.7098039, 1, 0, 1,
-0.7480812, -1.826161, -4.003064, 0.7058824, 1, 0, 1,
-0.7477347, -0.1735637, -0.04752562, 0.6980392, 1, 0, 1,
-0.7427419, -1.277887, -3.684812, 0.6901961, 1, 0, 1,
-0.7420726, -0.6380422, -0.04567238, 0.6862745, 1, 0, 1,
-0.7414118, 0.3526695, -2.740445, 0.6784314, 1, 0, 1,
-0.7379649, 0.801433, -1.059319, 0.6745098, 1, 0, 1,
-0.7352996, 0.4498882, -1.579387, 0.6666667, 1, 0, 1,
-0.7178783, 0.04249334, -0.1482154, 0.6627451, 1, 0, 1,
-0.7141358, 0.3334328, -0.5857692, 0.654902, 1, 0, 1,
-0.7089213, -0.4194607, -1.468124, 0.6509804, 1, 0, 1,
-0.7075711, 0.5525286, 0.2099596, 0.6431373, 1, 0, 1,
-0.6939109, 0.01755859, -2.303204, 0.6392157, 1, 0, 1,
-0.6924268, -0.5813341, -0.9884501, 0.6313726, 1, 0, 1,
-0.6915228, 0.9779687, -0.6988894, 0.627451, 1, 0, 1,
-0.6912643, 1.233576, -1.102695, 0.6196079, 1, 0, 1,
-0.6895522, -0.6795449, -2.584404, 0.6156863, 1, 0, 1,
-0.6880482, -0.2141993, -1.109187, 0.6078432, 1, 0, 1,
-0.6873255, 0.7288796, -1.197194, 0.6039216, 1, 0, 1,
-0.676267, 0.2495503, -1.702514, 0.5960785, 1, 0, 1,
-0.6705188, -0.5739691, -2.095232, 0.5882353, 1, 0, 1,
-0.667839, -0.6943246, -2.407894, 0.5843138, 1, 0, 1,
-0.6665484, 1.040385, 0.478353, 0.5764706, 1, 0, 1,
-0.6661932, -0.3927859, -1.761557, 0.572549, 1, 0, 1,
-0.6640908, -0.6853009, -1.076237, 0.5647059, 1, 0, 1,
-0.6625293, 0.1489367, -1.869246, 0.5607843, 1, 0, 1,
-0.6620513, 0.05988166, -0.5291234, 0.5529412, 1, 0, 1,
-0.6581558, -0.5633998, -2.398777, 0.5490196, 1, 0, 1,
-0.6514521, -0.0605877, 0.7671674, 0.5411765, 1, 0, 1,
-0.6494117, 1.014656, -0.9478968, 0.5372549, 1, 0, 1,
-0.648921, -0.04856651, -0.9343292, 0.5294118, 1, 0, 1,
-0.6479962, 0.08857935, -0.5061353, 0.5254902, 1, 0, 1,
-0.6442688, 1.335594, -1.160291, 0.5176471, 1, 0, 1,
-0.6440454, 0.7905943, -0.1305005, 0.5137255, 1, 0, 1,
-0.6382961, 0.7374469, 1.451096, 0.5058824, 1, 0, 1,
-0.6342688, -1.942206, -2.803734, 0.5019608, 1, 0, 1,
-0.6262699, 2.664624, -1.575126, 0.4941176, 1, 0, 1,
-0.6254127, 0.7851946, -0.70754, 0.4862745, 1, 0, 1,
-0.6221077, -0.8417556, -2.779005, 0.4823529, 1, 0, 1,
-0.6186836, 0.07187384, -0.8373265, 0.4745098, 1, 0, 1,
-0.6175516, 0.7415609, -0.8591632, 0.4705882, 1, 0, 1,
-0.6141691, -0.746542, -1.580547, 0.4627451, 1, 0, 1,
-0.6100761, 0.4978307, -0.5061192, 0.4588235, 1, 0, 1,
-0.6017438, -0.7226844, -2.092616, 0.4509804, 1, 0, 1,
-0.5983703, -0.5351228, -2.433848, 0.4470588, 1, 0, 1,
-0.5938244, 0.6561686, -0.5800492, 0.4392157, 1, 0, 1,
-0.5902983, -0.7522251, -3.99258, 0.4352941, 1, 0, 1,
-0.5823213, 0.7041438, 0.8419932, 0.427451, 1, 0, 1,
-0.5797977, -0.2127781, -2.773001, 0.4235294, 1, 0, 1,
-0.5794765, 0.1568867, -1.706917, 0.4156863, 1, 0, 1,
-0.5774661, -1.222254, -2.679617, 0.4117647, 1, 0, 1,
-0.5772246, 0.1055945, -0.2009965, 0.4039216, 1, 0, 1,
-0.5737485, 1.346973, 0.5565382, 0.3960784, 1, 0, 1,
-0.5720817, -0.2755288, -4.293767, 0.3921569, 1, 0, 1,
-0.5697671, -0.1086083, -2.141299, 0.3843137, 1, 0, 1,
-0.5676388, 0.5246193, -0.8961632, 0.3803922, 1, 0, 1,
-0.5672545, 2.005383, -1.644955, 0.372549, 1, 0, 1,
-0.5619079, -0.3418156, -3.515109, 0.3686275, 1, 0, 1,
-0.5580809, 1.074473, 0.3600016, 0.3607843, 1, 0, 1,
-0.5478756, 2.019534, -0.9492621, 0.3568628, 1, 0, 1,
-0.5475318, -1.0034, -1.424127, 0.3490196, 1, 0, 1,
-0.5458499, 1.657322, -2.700301, 0.345098, 1, 0, 1,
-0.5347891, 2.040725, -0.3964967, 0.3372549, 1, 0, 1,
-0.5318392, -0.6620003, -3.498495, 0.3333333, 1, 0, 1,
-0.5290268, 1.261808, 0.0773026, 0.3254902, 1, 0, 1,
-0.525893, 0.4602888, -0.1724066, 0.3215686, 1, 0, 1,
-0.5248101, -0.6473813, -2.260582, 0.3137255, 1, 0, 1,
-0.5246809, 0.7254866, -1.409838, 0.3098039, 1, 0, 1,
-0.5133931, 0.2272445, -0.9232062, 0.3019608, 1, 0, 1,
-0.5118163, 0.4084089, -0.06377314, 0.2941177, 1, 0, 1,
-0.5104471, 2.083874, -1.090412, 0.2901961, 1, 0, 1,
-0.5090527, 0.3628013, 0.1610485, 0.282353, 1, 0, 1,
-0.5046368, 0.7431245, -1.056848, 0.2784314, 1, 0, 1,
-0.503828, -1.361948, -2.778606, 0.2705882, 1, 0, 1,
-0.5029709, -0.128748, -3.439876, 0.2666667, 1, 0, 1,
-0.5022717, -0.9974875, -2.772041, 0.2588235, 1, 0, 1,
-0.5018492, 0.2907906, 0.7727241, 0.254902, 1, 0, 1,
-0.5014656, -0.1451575, -1.022628, 0.2470588, 1, 0, 1,
-0.5004724, -2.36793, -4.525544, 0.2431373, 1, 0, 1,
-0.499889, 0.4334016, -0.0297455, 0.2352941, 1, 0, 1,
-0.4987327, 0.08156152, -2.190084, 0.2313726, 1, 0, 1,
-0.4925203, -1.394365, -2.355147, 0.2235294, 1, 0, 1,
-0.4881834, 0.7745361, -1.398957, 0.2196078, 1, 0, 1,
-0.4860341, 0.09088427, -0.2531602, 0.2117647, 1, 0, 1,
-0.4853282, -0.1342543, -2.928561, 0.2078431, 1, 0, 1,
-0.4809283, 0.1363647, -0.3006793, 0.2, 1, 0, 1,
-0.4788775, 1.014687, -0.6950836, 0.1921569, 1, 0, 1,
-0.4772899, 1.343255, -0.7723279, 0.1882353, 1, 0, 1,
-0.4761517, -1.026249, -4.878127, 0.1803922, 1, 0, 1,
-0.4666478, -1.212024, -2.002352, 0.1764706, 1, 0, 1,
-0.4632659, 1.40458, -0.1755011, 0.1686275, 1, 0, 1,
-0.4630882, 0.130295, -0.3165766, 0.1647059, 1, 0, 1,
-0.4627881, -0.4206179, -2.343078, 0.1568628, 1, 0, 1,
-0.4613898, 0.3828533, -1.759413, 0.1529412, 1, 0, 1,
-0.4611076, -1.372827, -1.597787, 0.145098, 1, 0, 1,
-0.4586175, -0.937675, -2.298526, 0.1411765, 1, 0, 1,
-0.4558854, -0.5863463, -0.8312328, 0.1333333, 1, 0, 1,
-0.4542205, -0.2821953, -1.904815, 0.1294118, 1, 0, 1,
-0.4526753, -0.5946871, -3.410167, 0.1215686, 1, 0, 1,
-0.4524002, 0.347271, -1.175574, 0.1176471, 1, 0, 1,
-0.4522485, 1.744027, 0.4547193, 0.1098039, 1, 0, 1,
-0.4516855, 0.1870243, -1.269574, 0.1058824, 1, 0, 1,
-0.4515906, -0.1449062, -1.912786, 0.09803922, 1, 0, 1,
-0.4503116, -1.81453, -1.69116, 0.09019608, 1, 0, 1,
-0.4497758, 0.9608942, -2.410414, 0.08627451, 1, 0, 1,
-0.4491549, 1.002773, -0.1000337, 0.07843138, 1, 0, 1,
-0.4466259, 1.426685, -2.008061, 0.07450981, 1, 0, 1,
-0.4446379, 1.408144, -0.43468, 0.06666667, 1, 0, 1,
-0.4443344, 0.6565576, -1.09617, 0.0627451, 1, 0, 1,
-0.4342977, -1.000385, -2.745514, 0.05490196, 1, 0, 1,
-0.4332529, -0.05657867, -1.070522, 0.05098039, 1, 0, 1,
-0.4310323, 1.072173, 1.857493, 0.04313726, 1, 0, 1,
-0.4262277, -2.643085, -1.964341, 0.03921569, 1, 0, 1,
-0.4259798, 0.9869721, -0.3156365, 0.03137255, 1, 0, 1,
-0.4246614, -0.4106534, -2.276489, 0.02745098, 1, 0, 1,
-0.4224298, 0.7766967, 0.7003124, 0.01960784, 1, 0, 1,
-0.4213262, 0.6323698, -0.9246485, 0.01568628, 1, 0, 1,
-0.4191824, 1.210929, -0.05805565, 0.007843138, 1, 0, 1,
-0.4180539, -1.124308, -1.852933, 0.003921569, 1, 0, 1,
-0.4170601, -0.1727934, -2.4211, 0, 1, 0.003921569, 1,
-0.4170558, -0.05940608, -1.665848, 0, 1, 0.01176471, 1,
-0.4148889, 0.5136711, -1.673298, 0, 1, 0.01568628, 1,
-0.4143366, 1.786958, -0.6792734, 0, 1, 0.02352941, 1,
-0.4123063, 0.89038, -0.09035396, 0, 1, 0.02745098, 1,
-0.4088707, -1.219245, -2.211384, 0, 1, 0.03529412, 1,
-0.4085911, -0.6114939, -2.756455, 0, 1, 0.03921569, 1,
-0.4065486, -0.2698256, -2.490931, 0, 1, 0.04705882, 1,
-0.4062029, -2.154314, -1.499962, 0, 1, 0.05098039, 1,
-0.4059612, -0.8206091, -2.87668, 0, 1, 0.05882353, 1,
-0.403183, -0.2390153, -2.079123, 0, 1, 0.0627451, 1,
-0.3989598, -0.4182813, -4.615432, 0, 1, 0.07058824, 1,
-0.3890117, -0.1713042, -0.8027918, 0, 1, 0.07450981, 1,
-0.3856778, 0.22257, -0.2889465, 0, 1, 0.08235294, 1,
-0.3773541, 1.293697, -0.4294195, 0, 1, 0.08627451, 1,
-0.3756439, 0.8122527, -0.7336934, 0, 1, 0.09411765, 1,
-0.3746889, -0.3655435, -2.549731, 0, 1, 0.1019608, 1,
-0.3745193, 0.6965289, -0.06161587, 0, 1, 0.1058824, 1,
-0.3714682, 0.1065982, -1.408587, 0, 1, 0.1137255, 1,
-0.370964, -0.4030887, -3.112556, 0, 1, 0.1176471, 1,
-0.3670684, 0.02550136, 0.2128364, 0, 1, 0.1254902, 1,
-0.3660756, 0.6639609, -0.5336449, 0, 1, 0.1294118, 1,
-0.3635786, -0.9190478, -2.184023, 0, 1, 0.1372549, 1,
-0.3628981, -0.4550698, -2.315377, 0, 1, 0.1411765, 1,
-0.3601117, -0.2975325, -2.871344, 0, 1, 0.1490196, 1,
-0.3599076, -0.1814106, -0.5967982, 0, 1, 0.1529412, 1,
-0.3597275, -0.06329117, -0.202027, 0, 1, 0.1607843, 1,
-0.3577215, 1.214579, -2.089865, 0, 1, 0.1647059, 1,
-0.3553119, -0.6928171, -4.674664, 0, 1, 0.172549, 1,
-0.3542714, -0.08963994, -2.871828, 0, 1, 0.1764706, 1,
-0.3540845, 0.5841663, 0.01066378, 0, 1, 0.1843137, 1,
-0.3515155, -0.173032, -5.077391, 0, 1, 0.1882353, 1,
-0.350186, -1.616797, -3.90988, 0, 1, 0.1960784, 1,
-0.3444473, -0.04595313, -1.797336, 0, 1, 0.2039216, 1,
-0.3443294, 0.2174502, -1.857284, 0, 1, 0.2078431, 1,
-0.3381535, 0.5346015, 0.08604263, 0, 1, 0.2156863, 1,
-0.3346212, -1.254045, -3.574032, 0, 1, 0.2196078, 1,
-0.3339425, -0.1248747, -1.154269, 0, 1, 0.227451, 1,
-0.3336122, 0.002977333, -1.145698, 0, 1, 0.2313726, 1,
-0.3331442, -0.5314855, -2.008163, 0, 1, 0.2392157, 1,
-0.3281561, 0.2554613, -2.17283, 0, 1, 0.2431373, 1,
-0.3260845, -2.008673, -3.405325, 0, 1, 0.2509804, 1,
-0.3260003, -0.2244568, -3.127241, 0, 1, 0.254902, 1,
-0.3238031, 0.8740689, 1.235126, 0, 1, 0.2627451, 1,
-0.322628, 0.6482111, 0.3359352, 0, 1, 0.2666667, 1,
-0.3222722, -0.7585489, -2.17343, 0, 1, 0.2745098, 1,
-0.3197577, 0.2223273, 0.02521343, 0, 1, 0.2784314, 1,
-0.3170655, -0.1362378, -2.28023, 0, 1, 0.2862745, 1,
-0.3148284, 1.427796, -0.5925951, 0, 1, 0.2901961, 1,
-0.3085985, 0.6013622, -1.130741, 0, 1, 0.2980392, 1,
-0.3081894, -1.820526, -2.651505, 0, 1, 0.3058824, 1,
-0.3056574, 0.2835199, -0.4090602, 0, 1, 0.3098039, 1,
-0.2999077, 0.8097582, 0.7591941, 0, 1, 0.3176471, 1,
-0.298083, -0.7543055, -1.939919, 0, 1, 0.3215686, 1,
-0.2971021, 0.8847623, 0.4845814, 0, 1, 0.3294118, 1,
-0.2970388, 0.6908748, -2.045891, 0, 1, 0.3333333, 1,
-0.2950594, 0.1330751, 0.4419731, 0, 1, 0.3411765, 1,
-0.2928249, -1.039052, -1.634388, 0, 1, 0.345098, 1,
-0.2924167, 0.3107661, -0.7805582, 0, 1, 0.3529412, 1,
-0.2924085, 0.2813489, -0.0575458, 0, 1, 0.3568628, 1,
-0.285891, -0.8427828, -1.559253, 0, 1, 0.3647059, 1,
-0.2852881, -0.2423629, -3.36909, 0, 1, 0.3686275, 1,
-0.28452, -0.1804383, -2.246025, 0, 1, 0.3764706, 1,
-0.2815876, 0.618822, 0.5908232, 0, 1, 0.3803922, 1,
-0.2796163, -0.9287896, -2.240767, 0, 1, 0.3882353, 1,
-0.2790633, 0.4946955, 0.4251529, 0, 1, 0.3921569, 1,
-0.278721, -0.5716284, -0.4132792, 0, 1, 0.4, 1,
-0.2787015, 0.08500733, -1.728813, 0, 1, 0.4078431, 1,
-0.2746095, -0.3344598, -2.095902, 0, 1, 0.4117647, 1,
-0.2727476, -0.3262536, -2.631602, 0, 1, 0.4196078, 1,
-0.2650818, -2.858242, -2.109269, 0, 1, 0.4235294, 1,
-0.2620074, -0.1895351, -2.21342, 0, 1, 0.4313726, 1,
-0.2587636, 0.189336, 0.6884897, 0, 1, 0.4352941, 1,
-0.2546693, 0.6323941, -1.596077, 0, 1, 0.4431373, 1,
-0.2476387, -0.2729947, -2.374878, 0, 1, 0.4470588, 1,
-0.2474468, 0.400008, 0.2991292, 0, 1, 0.454902, 1,
-0.2474139, 0.4848354, -1.617461, 0, 1, 0.4588235, 1,
-0.2429205, -1.048022, -2.161781, 0, 1, 0.4666667, 1,
-0.2417776, -0.04123357, 0.3794554, 0, 1, 0.4705882, 1,
-0.2415965, 0.5904601, -0.1567608, 0, 1, 0.4784314, 1,
-0.2407622, -0.08197673, -0.7699426, 0, 1, 0.4823529, 1,
-0.2407597, -1.852673, -2.623861, 0, 1, 0.4901961, 1,
-0.2382612, 0.2203688, 0.3002962, 0, 1, 0.4941176, 1,
-0.236885, 0.07180965, -1.50478, 0, 1, 0.5019608, 1,
-0.2361566, -0.6723989, -2.81314, 0, 1, 0.509804, 1,
-0.2351595, -0.9574111, -1.904382, 0, 1, 0.5137255, 1,
-0.2348081, -1.077888, -1.965042, 0, 1, 0.5215687, 1,
-0.2342277, -1.650476, -4.589499, 0, 1, 0.5254902, 1,
-0.2327458, 0.5685179, -1.785478, 0, 1, 0.5333334, 1,
-0.2301, -0.2620676, -1.901228, 0, 1, 0.5372549, 1,
-0.2283361, 0.6946261, -0.02113569, 0, 1, 0.5450981, 1,
-0.2276593, 1.010235, 1.557081, 0, 1, 0.5490196, 1,
-0.2271018, 1.091529, 0.7942937, 0, 1, 0.5568628, 1,
-0.2261841, -0.5185404, -3.321083, 0, 1, 0.5607843, 1,
-0.2259005, 1.856985, 0.3838929, 0, 1, 0.5686275, 1,
-0.2238962, -0.1894638, -2.741936, 0, 1, 0.572549, 1,
-0.2008599, -0.5220225, -3.258784, 0, 1, 0.5803922, 1,
-0.1993137, 0.08573285, -0.8490676, 0, 1, 0.5843138, 1,
-0.1949557, 1.411993, 1.49828, 0, 1, 0.5921569, 1,
-0.1924745, 1.036436, -0.01047487, 0, 1, 0.5960785, 1,
-0.1886847, 0.8935195, -0.5275216, 0, 1, 0.6039216, 1,
-0.1882568, 0.904326, 0.9036236, 0, 1, 0.6117647, 1,
-0.1848743, 0.4928795, -0.02690352, 0, 1, 0.6156863, 1,
-0.1836333, 1.736536, -0.09006994, 0, 1, 0.6235294, 1,
-0.1690246, 0.09454937, -0.9622951, 0, 1, 0.627451, 1,
-0.1640667, -0.5877866, -3.766442, 0, 1, 0.6352941, 1,
-0.1536061, 0.4667906, 0.4804772, 0, 1, 0.6392157, 1,
-0.1533786, 1.237796, -0.05801848, 0, 1, 0.6470588, 1,
-0.1501392, 0.9468684, 0.6316372, 0, 1, 0.6509804, 1,
-0.1409145, -0.08923148, -0.7556684, 0, 1, 0.6588235, 1,
-0.140764, 3.117186, -0.1456567, 0, 1, 0.6627451, 1,
-0.1393813, -2.202888, -3.586285, 0, 1, 0.6705883, 1,
-0.1322153, 0.260444, -1.135376, 0, 1, 0.6745098, 1,
-0.1232614, 1.363477, -0.3228533, 0, 1, 0.682353, 1,
-0.1214347, 3.034906, -1.89376, 0, 1, 0.6862745, 1,
-0.1202071, 0.2746451, -1.328254, 0, 1, 0.6941177, 1,
-0.1134653, -0.6259139, -4.224719, 0, 1, 0.7019608, 1,
-0.1107652, 1.32056, -0.1332701, 0, 1, 0.7058824, 1,
-0.1081233, 0.6144722, 0.6403516, 0, 1, 0.7137255, 1,
-0.1056638, 0.8172678, -0.3812611, 0, 1, 0.7176471, 1,
-0.1003746, 0.5308603, -1.51174, 0, 1, 0.7254902, 1,
-0.0996315, 1.023665, -0.9196901, 0, 1, 0.7294118, 1,
-0.09263115, 1.166244, 0.3695011, 0, 1, 0.7372549, 1,
-0.09002902, 0.6738874, -0.2133002, 0, 1, 0.7411765, 1,
-0.08954445, -0.8190362, -3.46648, 0, 1, 0.7490196, 1,
-0.08653705, 1.093675, 2.081622, 0, 1, 0.7529412, 1,
-0.08598033, 2.003926, -0.6693688, 0, 1, 0.7607843, 1,
-0.07826874, -0.2345051, -2.694099, 0, 1, 0.7647059, 1,
-0.07470532, -0.349646, -3.724595, 0, 1, 0.772549, 1,
-0.07423564, -0.6235052, -3.147964, 0, 1, 0.7764706, 1,
-0.07314203, -0.3325831, 0.9011092, 0, 1, 0.7843137, 1,
-0.0656902, -1.239006, -2.845036, 0, 1, 0.7882353, 1,
-0.06189117, -0.8118253, -2.89629, 0, 1, 0.7960784, 1,
-0.06085276, -0.8800657, -2.711025, 0, 1, 0.8039216, 1,
-0.0570394, 0.613591, -0.5399626, 0, 1, 0.8078431, 1,
-0.05626335, 0.8621768, 0.7907265, 0, 1, 0.8156863, 1,
-0.05272215, -1.147053, -2.258677, 0, 1, 0.8196079, 1,
-0.04939095, 0.2934476, -0.8905905, 0, 1, 0.827451, 1,
-0.04387092, 0.63088, 1.163406, 0, 1, 0.8313726, 1,
-0.04342407, -1.487651, -1.312326, 0, 1, 0.8392157, 1,
-0.03965067, 1.715479, 0.7374021, 0, 1, 0.8431373, 1,
-0.03952838, 0.02029824, -0.3179337, 0, 1, 0.8509804, 1,
-0.03742388, -0.8758834, -2.04059, 0, 1, 0.854902, 1,
-0.03241821, 0.7234245, 1.708503, 0, 1, 0.8627451, 1,
-0.02487477, -0.2258009, -3.987918, 0, 1, 0.8666667, 1,
-0.0227561, -2.261451, -2.235919, 0, 1, 0.8745098, 1,
-0.02075671, -1.524565, -3.889825, 0, 1, 0.8784314, 1,
-0.01879669, -0.6354948, -2.043923, 0, 1, 0.8862745, 1,
-0.01647349, 1.685639, -1.045249, 0, 1, 0.8901961, 1,
-0.01633549, -1.409276, -1.889504, 0, 1, 0.8980392, 1,
-0.01452348, -1.049455, -4.281611, 0, 1, 0.9058824, 1,
-0.01314679, -0.08741673, -3.696527, 0, 1, 0.9098039, 1,
-0.01314246, -1.631692, -2.225701, 0, 1, 0.9176471, 1,
-0.01185691, 0.3939876, -0.6036796, 0, 1, 0.9215686, 1,
-0.006304042, -1.215114, -3.961797, 0, 1, 0.9294118, 1,
-0.005571151, -1.228204, -3.008127, 0, 1, 0.9333333, 1,
-0.005288373, 0.6923221, 1.292981, 0, 1, 0.9411765, 1,
-0.003108084, -0.1180921, -3.054485, 0, 1, 0.945098, 1,
-0.001167774, -0.4318175, -1.984604, 0, 1, 0.9529412, 1,
0.001491743, 0.9180109, -0.7175965, 0, 1, 0.9568627, 1,
0.003161435, -0.8095684, 2.209467, 0, 1, 0.9647059, 1,
0.004117914, -0.6663845, 1.464597, 0, 1, 0.9686275, 1,
0.008650555, 0.9582723, 0.1216268, 0, 1, 0.9764706, 1,
0.008861098, 0.698683, 0.87442, 0, 1, 0.9803922, 1,
0.00963503, -0.6300406, 4.13637, 0, 1, 0.9882353, 1,
0.01552108, -0.6469148, 3.266722, 0, 1, 0.9921569, 1,
0.01563078, -0.8907887, 2.269657, 0, 1, 1, 1,
0.02110345, -0.7395816, 1.46892, 0, 0.9921569, 1, 1,
0.02170551, 0.2865156, 0.1894766, 0, 0.9882353, 1, 1,
0.02283497, 0.3591368, 1.748035, 0, 0.9803922, 1, 1,
0.02678914, 0.5329095, -0.8374975, 0, 0.9764706, 1, 1,
0.03053432, 0.5514694, -1.290589, 0, 0.9686275, 1, 1,
0.04168698, 1.685486, -1.413466, 0, 0.9647059, 1, 1,
0.04298371, 0.364602, -0.2969389, 0, 0.9568627, 1, 1,
0.0446702, 1.046152, 0.07840671, 0, 0.9529412, 1, 1,
0.05130831, 0.2049042, 0.7697631, 0, 0.945098, 1, 1,
0.05559305, 0.2788953, -0.8992657, 0, 0.9411765, 1, 1,
0.05780741, -0.9773837, 2.722302, 0, 0.9333333, 1, 1,
0.05800368, -0.5471451, 4.006302, 0, 0.9294118, 1, 1,
0.05809205, 1.415345, -1.45664, 0, 0.9215686, 1, 1,
0.05916074, -1.462871, 2.447781, 0, 0.9176471, 1, 1,
0.06321037, 0.1675024, 0.9370642, 0, 0.9098039, 1, 1,
0.06876273, -0.1938978, 1.978047, 0, 0.9058824, 1, 1,
0.06941812, 0.4718809, 0.9652299, 0, 0.8980392, 1, 1,
0.07176804, 1.151508, 0.5134027, 0, 0.8901961, 1, 1,
0.07759465, -1.588424, 4.666037, 0, 0.8862745, 1, 1,
0.07831571, -2.273275, 0.09499716, 0, 0.8784314, 1, 1,
0.08064431, 1.775267, -1.362667, 0, 0.8745098, 1, 1,
0.08082269, -0.7323595, 2.717958, 0, 0.8666667, 1, 1,
0.08121865, 0.6610367, -1.271069, 0, 0.8627451, 1, 1,
0.08300306, -0.6599123, 1.684355, 0, 0.854902, 1, 1,
0.08458276, -1.753644, 2.524297, 0, 0.8509804, 1, 1,
0.08507481, -1.521921, 2.304604, 0, 0.8431373, 1, 1,
0.08899767, 1.685646, -0.401547, 0, 0.8392157, 1, 1,
0.09334078, -0.1752468, 1.55084, 0, 0.8313726, 1, 1,
0.1005631, 0.4445744, 1.67263, 0, 0.827451, 1, 1,
0.1008457, 0.4736182, -1.064546, 0, 0.8196079, 1, 1,
0.1009582, -1.21245, 2.725027, 0, 0.8156863, 1, 1,
0.1011196, -0.2416954, 3.057992, 0, 0.8078431, 1, 1,
0.1026293, -2.64661, 2.401283, 0, 0.8039216, 1, 1,
0.1053159, -0.6542672, 2.425146, 0, 0.7960784, 1, 1,
0.1060686, -0.4523017, 3.914235, 0, 0.7882353, 1, 1,
0.1087947, -0.2451801, 3.319788, 0, 0.7843137, 1, 1,
0.1094825, 1.221643, -0.6171077, 0, 0.7764706, 1, 1,
0.1105454, 2.010097, 0.7608333, 0, 0.772549, 1, 1,
0.1112308, -0.1823215, 4.936108, 0, 0.7647059, 1, 1,
0.1144576, 0.3789504, 1.749055, 0, 0.7607843, 1, 1,
0.1162977, 0.5678558, -1.426331, 0, 0.7529412, 1, 1,
0.1185613, -0.4026536, 3.766675, 0, 0.7490196, 1, 1,
0.1229886, -0.4657689, 2.730474, 0, 0.7411765, 1, 1,
0.1336443, -0.1867518, 4.259089, 0, 0.7372549, 1, 1,
0.1358232, -1.435927, 2.637895, 0, 0.7294118, 1, 1,
0.1372461, 0.2435696, 1.136593, 0, 0.7254902, 1, 1,
0.1372706, 0.1549106, 1.129357, 0, 0.7176471, 1, 1,
0.1387749, -2.093898, 3.606877, 0, 0.7137255, 1, 1,
0.1387815, -0.2107608, 3.775114, 0, 0.7058824, 1, 1,
0.138922, 0.6519306, 0.1475065, 0, 0.6980392, 1, 1,
0.1394611, 1.055603, 0.9769302, 0, 0.6941177, 1, 1,
0.1396483, -1.782912, 2.548066, 0, 0.6862745, 1, 1,
0.1457202, -0.2486617, 2.364272, 0, 0.682353, 1, 1,
0.1483256, -0.5217803, 2.734614, 0, 0.6745098, 1, 1,
0.1486651, -0.2565732, 2.76756, 0, 0.6705883, 1, 1,
0.1570807, -0.7036274, 1.145585, 0, 0.6627451, 1, 1,
0.1572838, 0.5275956, -0.03324845, 0, 0.6588235, 1, 1,
0.1573894, 0.4012113, 1.096425, 0, 0.6509804, 1, 1,
0.157663, -1.269924, 2.724523, 0, 0.6470588, 1, 1,
0.1608643, -1.19643, 3.041729, 0, 0.6392157, 1, 1,
0.1613117, -0.5661503, 3.609221, 0, 0.6352941, 1, 1,
0.1622874, -0.2137778, 3.578716, 0, 0.627451, 1, 1,
0.162505, 0.1074162, 0.8923795, 0, 0.6235294, 1, 1,
0.1661672, -0.5197945, 2.455762, 0, 0.6156863, 1, 1,
0.1695234, -0.01560205, 3.350353, 0, 0.6117647, 1, 1,
0.1801021, -0.07238493, 2.861979, 0, 0.6039216, 1, 1,
0.1805177, -1.265327, 2.002073, 0, 0.5960785, 1, 1,
0.1814859, 0.7563413, 1.364357, 0, 0.5921569, 1, 1,
0.1814962, 0.9594741, -0.4201832, 0, 0.5843138, 1, 1,
0.1836443, -0.4592906, 2.31112, 0, 0.5803922, 1, 1,
0.1884572, 0.9341733, 0.2959412, 0, 0.572549, 1, 1,
0.1892193, 0.8219293, -1.133078, 0, 0.5686275, 1, 1,
0.1893947, -1.653495, 3.161873, 0, 0.5607843, 1, 1,
0.1908707, 0.06913324, 2.630108, 0, 0.5568628, 1, 1,
0.1935373, -0.3477275, 2.919611, 0, 0.5490196, 1, 1,
0.1958559, -1.409767, 2.382844, 0, 0.5450981, 1, 1,
0.1965791, 0.7718483, 1.358703, 0, 0.5372549, 1, 1,
0.1977332, -0.3214811, 2.528934, 0, 0.5333334, 1, 1,
0.197845, -0.2736121, 2.286, 0, 0.5254902, 1, 1,
0.2014632, -0.8796359, 3.565848, 0, 0.5215687, 1, 1,
0.2019736, -0.3680784, 2.289582, 0, 0.5137255, 1, 1,
0.2045019, -0.02329989, 2.244273, 0, 0.509804, 1, 1,
0.209562, 1.048191, 1.217225, 0, 0.5019608, 1, 1,
0.2145985, -0.05752096, 0.910005, 0, 0.4941176, 1, 1,
0.2213653, 0.206107, 1.193285, 0, 0.4901961, 1, 1,
0.2216182, 0.619916, 0.7087942, 0, 0.4823529, 1, 1,
0.2238686, 0.3015699, 0.7267884, 0, 0.4784314, 1, 1,
0.2242061, -0.4847885, 3.415775, 0, 0.4705882, 1, 1,
0.2290471, -0.2773393, 3.36152, 0, 0.4666667, 1, 1,
0.2305837, 0.7404653, -0.7419929, 0, 0.4588235, 1, 1,
0.2316935, -0.2631378, 2.884162, 0, 0.454902, 1, 1,
0.2340946, -0.5900934, 2.810015, 0, 0.4470588, 1, 1,
0.2367611, -1.152428, 1.396616, 0, 0.4431373, 1, 1,
0.2379626, 0.3717314, 0.8079753, 0, 0.4352941, 1, 1,
0.2385851, -1.536944, 3.209226, 0, 0.4313726, 1, 1,
0.2430091, 0.8452163, 0.2937171, 0, 0.4235294, 1, 1,
0.2443378, 0.3491302, -0.2363671, 0, 0.4196078, 1, 1,
0.2470039, 1.853608, -0.6253516, 0, 0.4117647, 1, 1,
0.2497596, -1.038411, 1.6288, 0, 0.4078431, 1, 1,
0.2523007, 1.028094, -0.597085, 0, 0.4, 1, 1,
0.2549525, 0.4827473, -0.263887, 0, 0.3921569, 1, 1,
0.2560768, -1.267077, 3.024158, 0, 0.3882353, 1, 1,
0.2581718, -1.645241, 3.029217, 0, 0.3803922, 1, 1,
0.2621768, -1.016177, 1.13956, 0, 0.3764706, 1, 1,
0.2651624, -0.001125224, 2.982288, 0, 0.3686275, 1, 1,
0.2686788, 0.6457929, -0.09417183, 0, 0.3647059, 1, 1,
0.2733177, -1.235663, 2.77107, 0, 0.3568628, 1, 1,
0.2736179, -0.5473428, 1.263798, 0, 0.3529412, 1, 1,
0.2738751, 0.9326932, 0.02216776, 0, 0.345098, 1, 1,
0.2744398, 1.440328, -0.9868707, 0, 0.3411765, 1, 1,
0.2749261, -0.5461531, 5.160858, 0, 0.3333333, 1, 1,
0.275971, -0.4234113, 2.743223, 0, 0.3294118, 1, 1,
0.2785396, -0.09761956, 1.393636, 0, 0.3215686, 1, 1,
0.2788459, -0.879882, 3.359868, 0, 0.3176471, 1, 1,
0.2833706, -0.8814227, 4.702485, 0, 0.3098039, 1, 1,
0.2936556, -0.939653, 2.784797, 0, 0.3058824, 1, 1,
0.3030081, -0.08568083, 1.150928, 0, 0.2980392, 1, 1,
0.3045272, 1.357698, 0.5636832, 0, 0.2901961, 1, 1,
0.3135806, -0.6329035, 0.6933593, 0, 0.2862745, 1, 1,
0.3149298, -0.0587814, 0.5787588, 0, 0.2784314, 1, 1,
0.3156478, -0.8086976, 2.013618, 0, 0.2745098, 1, 1,
0.3166054, 0.4431757, 0.08187339, 0, 0.2666667, 1, 1,
0.3190654, 1.052368, -0.1531842, 0, 0.2627451, 1, 1,
0.3263644, -0.3121389, 2.67465, 0, 0.254902, 1, 1,
0.3293564, -0.8829143, 3.861917, 0, 0.2509804, 1, 1,
0.3310364, 1.32614, 1.351168, 0, 0.2431373, 1, 1,
0.3311899, 0.4102397, 1.984591, 0, 0.2392157, 1, 1,
0.3312914, 1.099746, -0.6921775, 0, 0.2313726, 1, 1,
0.3313315, 0.4593388, 1.110885, 0, 0.227451, 1, 1,
0.3368725, 0.4563041, 1.614055, 0, 0.2196078, 1, 1,
0.3387472, 0.01685282, 1.701981, 0, 0.2156863, 1, 1,
0.3398508, -1.341816, 3.280871, 0, 0.2078431, 1, 1,
0.3458669, -0.3224561, 3.278988, 0, 0.2039216, 1, 1,
0.3480149, -0.3381444, 2.605047, 0, 0.1960784, 1, 1,
0.3529492, 0.02129258, 0.4868277, 0, 0.1882353, 1, 1,
0.3552963, 0.5616916, -0.2295589, 0, 0.1843137, 1, 1,
0.3559713, -1.044943, 2.580717, 0, 0.1764706, 1, 1,
0.359324, 0.181123, -0.362568, 0, 0.172549, 1, 1,
0.362331, -1.455194, 1.68099, 0, 0.1647059, 1, 1,
0.3643184, 0.5350561, 1.724591, 0, 0.1607843, 1, 1,
0.3656054, -0.02301238, 1.629666, 0, 0.1529412, 1, 1,
0.3666238, 0.4413176, -0.01730119, 0, 0.1490196, 1, 1,
0.3735423, 1.184434, -1.230438, 0, 0.1411765, 1, 1,
0.3815443, 0.603272, 2.327641, 0, 0.1372549, 1, 1,
0.381977, 1.275047, 1.595775, 0, 0.1294118, 1, 1,
0.3843726, -0.1183927, 1.683784, 0, 0.1254902, 1, 1,
0.3884916, 0.03085773, 1.048752, 0, 0.1176471, 1, 1,
0.388616, -1.186937, 2.22671, 0, 0.1137255, 1, 1,
0.3908604, -0.4333696, 3.456078, 0, 0.1058824, 1, 1,
0.393139, 0.4483334, 0.9287275, 0, 0.09803922, 1, 1,
0.4000134, 0.5484836, 0.5935625, 0, 0.09411765, 1, 1,
0.4029696, -1.716844, 0.03497862, 0, 0.08627451, 1, 1,
0.4052086, -0.7744451, 2.514075, 0, 0.08235294, 1, 1,
0.4185265, -0.1895905, 1.378984, 0, 0.07450981, 1, 1,
0.4197267, -0.7608536, 4.204366, 0, 0.07058824, 1, 1,
0.4220228, 0.01027258, 1.41195, 0, 0.0627451, 1, 1,
0.4233493, 0.5869974, -0.6112739, 0, 0.05882353, 1, 1,
0.4250954, -0.0977071, 2.2206, 0, 0.05098039, 1, 1,
0.4286805, -0.61616, 2.716675, 0, 0.04705882, 1, 1,
0.4330131, 0.7231834, 0.710546, 0, 0.03921569, 1, 1,
0.4454491, -0.04255914, 2.302422, 0, 0.03529412, 1, 1,
0.4515633, -0.3607355, 2.92618, 0, 0.02745098, 1, 1,
0.4535847, -0.6634451, 3.766146, 0, 0.02352941, 1, 1,
0.4541481, -0.09501737, 1.659191, 0, 0.01568628, 1, 1,
0.4565604, -0.6383193, 0.9208452, 0, 0.01176471, 1, 1,
0.4685635, 1.070264, 0.03766727, 0, 0.003921569, 1, 1,
0.4691746, 0.4166036, 0.4216686, 0.003921569, 0, 1, 1,
0.4755443, 1.299286, -0.05454205, 0.007843138, 0, 1, 1,
0.479457, -0.2974342, 1.562088, 0.01568628, 0, 1, 1,
0.4806594, 0.1134578, 2.410282, 0.01960784, 0, 1, 1,
0.4876163, 0.6973253, 1.209434, 0.02745098, 0, 1, 1,
0.4925446, -0.5939463, 3.562405, 0.03137255, 0, 1, 1,
0.495463, 0.3683494, 1.526412, 0.03921569, 0, 1, 1,
0.4964786, 1.27004, -2.524683, 0.04313726, 0, 1, 1,
0.5019344, -0.0793834, 1.549761, 0.05098039, 0, 1, 1,
0.5026687, 0.7393408, 0.9344082, 0.05490196, 0, 1, 1,
0.5036588, -1.729825, 3.409808, 0.0627451, 0, 1, 1,
0.5043254, -0.4096317, 2.594535, 0.06666667, 0, 1, 1,
0.506623, 1.220627, -0.1424515, 0.07450981, 0, 1, 1,
0.5073735, 0.1682789, 1.2079, 0.07843138, 0, 1, 1,
0.5123388, -1.555422, 2.138854, 0.08627451, 0, 1, 1,
0.5136552, -1.229599, 2.413717, 0.09019608, 0, 1, 1,
0.5148291, -0.7217102, 2.589489, 0.09803922, 0, 1, 1,
0.5173382, -0.5391409, 1.345093, 0.1058824, 0, 1, 1,
0.5184716, -0.1607136, 2.025454, 0.1098039, 0, 1, 1,
0.5219684, -1.717719, 3.599249, 0.1176471, 0, 1, 1,
0.5229403, -0.1530822, 0.3090641, 0.1215686, 0, 1, 1,
0.523385, 0.6151815, 0.1058955, 0.1294118, 0, 1, 1,
0.5256005, -1.317675, 2.143844, 0.1333333, 0, 1, 1,
0.5256499, 0.1617862, 2.469451, 0.1411765, 0, 1, 1,
0.5322821, -0.7508619, 0.8635089, 0.145098, 0, 1, 1,
0.5324193, 1.390693, -0.3032269, 0.1529412, 0, 1, 1,
0.5333732, 0.06381948, 2.868458, 0.1568628, 0, 1, 1,
0.535548, 1.43879, -0.3513614, 0.1647059, 0, 1, 1,
0.5374591, -0.06333448, 1.899968, 0.1686275, 0, 1, 1,
0.539944, -0.2425879, 2.663291, 0.1764706, 0, 1, 1,
0.5411608, 1.602554, 1.240767, 0.1803922, 0, 1, 1,
0.5437743, -0.04160134, 3.124731, 0.1882353, 0, 1, 1,
0.5467703, -0.258111, 1.650302, 0.1921569, 0, 1, 1,
0.5501736, 0.006584032, 2.039274, 0.2, 0, 1, 1,
0.5502834, -1.403524, 3.206537, 0.2078431, 0, 1, 1,
0.5560843, 0.09917285, 0.6515315, 0.2117647, 0, 1, 1,
0.55787, 0.591995, -0.9823031, 0.2196078, 0, 1, 1,
0.5752332, 0.148188, 0.991583, 0.2235294, 0, 1, 1,
0.5760889, -1.399275, 2.590138, 0.2313726, 0, 1, 1,
0.5761758, 0.2279637, 1.16653, 0.2352941, 0, 1, 1,
0.5789968, -0.7619811, 2.006005, 0.2431373, 0, 1, 1,
0.5819129, -0.1023749, 0.6044087, 0.2470588, 0, 1, 1,
0.5824377, 1.555802, 0.2300464, 0.254902, 0, 1, 1,
0.5869055, 1.647904, 0.5471159, 0.2588235, 0, 1, 1,
0.5885317, 0.700676, 0.8425728, 0.2666667, 0, 1, 1,
0.591541, -0.5739709, 2.124475, 0.2705882, 0, 1, 1,
0.5927426, 1.3414, 1.542693, 0.2784314, 0, 1, 1,
0.5937015, -0.6009147, 0.8236317, 0.282353, 0, 1, 1,
0.5985079, 0.3096684, 0.7796459, 0.2901961, 0, 1, 1,
0.6018024, -1.224113, 2.042296, 0.2941177, 0, 1, 1,
0.6099346, -1.208737, 2.277179, 0.3019608, 0, 1, 1,
0.611148, -0.701943, 1.840222, 0.3098039, 0, 1, 1,
0.6121505, -0.07701768, 0.9841537, 0.3137255, 0, 1, 1,
0.6144003, -0.9595753, 3.09038, 0.3215686, 0, 1, 1,
0.6175797, -0.8210756, 1.566932, 0.3254902, 0, 1, 1,
0.618247, -1.606869, 1.866135, 0.3333333, 0, 1, 1,
0.6210248, 0.8568382, 1.931262, 0.3372549, 0, 1, 1,
0.6273968, 1.277153, 0.399556, 0.345098, 0, 1, 1,
0.6293848, -0.268563, 0.3152082, 0.3490196, 0, 1, 1,
0.6303267, -0.6749732, 2.140213, 0.3568628, 0, 1, 1,
0.6343396, -0.4769399, 1.177899, 0.3607843, 0, 1, 1,
0.6359915, -0.2700208, 2.062264, 0.3686275, 0, 1, 1,
0.6400819, -0.3888724, 3.509675, 0.372549, 0, 1, 1,
0.6420312, 0.2121652, 2.073688, 0.3803922, 0, 1, 1,
0.6456262, -1.690625, 3.76903, 0.3843137, 0, 1, 1,
0.6463534, -0.94787, 4.095273, 0.3921569, 0, 1, 1,
0.6522707, -0.301808, 2.280612, 0.3960784, 0, 1, 1,
0.6560201, 0.9605619, -0.3822699, 0.4039216, 0, 1, 1,
0.6594945, 0.6385944, -1.159571, 0.4117647, 0, 1, 1,
0.6619303, 0.09909578, 1.906408, 0.4156863, 0, 1, 1,
0.663062, -0.5412359, 1.990974, 0.4235294, 0, 1, 1,
0.6671358, -0.4563651, 2.650836, 0.427451, 0, 1, 1,
0.6685823, -0.6715099, 3.263905, 0.4352941, 0, 1, 1,
0.6689028, 2.181741, 1.424497, 0.4392157, 0, 1, 1,
0.6754068, 0.634262, 0.9382191, 0.4470588, 0, 1, 1,
0.6777758, -0.5695941, 1.396499, 0.4509804, 0, 1, 1,
0.6910813, -0.5027046, 1.639471, 0.4588235, 0, 1, 1,
0.6931882, 0.9259028, 0.9603313, 0.4627451, 0, 1, 1,
0.6940023, 1.02918, 0.914405, 0.4705882, 0, 1, 1,
0.6965844, -0.2041303, 2.1958, 0.4745098, 0, 1, 1,
0.6977924, -0.8820851, 0.7575924, 0.4823529, 0, 1, 1,
0.698893, 1.036749, 0.2276621, 0.4862745, 0, 1, 1,
0.7009575, 0.1961523, 2.215895, 0.4941176, 0, 1, 1,
0.7089164, -0.08147648, 0.5638226, 0.5019608, 0, 1, 1,
0.7109871, 1.305621, 1.942372, 0.5058824, 0, 1, 1,
0.7136081, -0.1456767, 1.90573, 0.5137255, 0, 1, 1,
0.7194473, -1.615468, 1.944962, 0.5176471, 0, 1, 1,
0.7211923, -2.036598, 4.485804, 0.5254902, 0, 1, 1,
0.7328465, -0.09414649, 1.28003, 0.5294118, 0, 1, 1,
0.737869, -1.115767, 3.87498, 0.5372549, 0, 1, 1,
0.7442322, -1.647027, 2.383584, 0.5411765, 0, 1, 1,
0.7479854, -0.02063044, 0.4512019, 0.5490196, 0, 1, 1,
0.7556096, 1.171088, 3.395164, 0.5529412, 0, 1, 1,
0.7663455, -0.6966434, 3.233287, 0.5607843, 0, 1, 1,
0.7866029, -0.6756366, 2.794715, 0.5647059, 0, 1, 1,
0.7883, -0.714803, 0.3929975, 0.572549, 0, 1, 1,
0.7893925, 0.4789419, 0.7284667, 0.5764706, 0, 1, 1,
0.7898306, -0.3070947, 1.589352, 0.5843138, 0, 1, 1,
0.7909468, 0.9932088, 1.76826, 0.5882353, 0, 1, 1,
0.7984879, 0.157371, 1.308266, 0.5960785, 0, 1, 1,
0.802883, -0.8205053, 2.268949, 0.6039216, 0, 1, 1,
0.8069529, 0.875366, -0.4692204, 0.6078432, 0, 1, 1,
0.809415, -0.7628416, 3.146783, 0.6156863, 0, 1, 1,
0.8123217, 0.8657406, 0.2212345, 0.6196079, 0, 1, 1,
0.8152285, 0.5375735, 0.2630188, 0.627451, 0, 1, 1,
0.8157421, -0.4179639, 0.2949011, 0.6313726, 0, 1, 1,
0.8164093, 1.494875, -0.1233624, 0.6392157, 0, 1, 1,
0.8189498, 1.183747, 0.8560669, 0.6431373, 0, 1, 1,
0.8263568, -0.07675035, 1.320938, 0.6509804, 0, 1, 1,
0.8318019, -2.116034, 1.661695, 0.654902, 0, 1, 1,
0.8330503, 0.5680383, 0.5170633, 0.6627451, 0, 1, 1,
0.8385127, -1.39945, 3.852976, 0.6666667, 0, 1, 1,
0.8422784, -1.731079, 2.511793, 0.6745098, 0, 1, 1,
0.8432536, -0.8572384, 2.732597, 0.6784314, 0, 1, 1,
0.8469543, 1.38675, 2.385333, 0.6862745, 0, 1, 1,
0.8472928, 0.2140889, 2.413536, 0.6901961, 0, 1, 1,
0.8477668, 0.8532454, 0.5116302, 0.6980392, 0, 1, 1,
0.849532, -1.855312, 2.204827, 0.7058824, 0, 1, 1,
0.8517966, -0.1596858, 0.5169392, 0.7098039, 0, 1, 1,
0.8545054, 1.705219, 2.516489, 0.7176471, 0, 1, 1,
0.8551564, -1.160681, 3.128788, 0.7215686, 0, 1, 1,
0.8607045, 0.3192073, -0.6810597, 0.7294118, 0, 1, 1,
0.861639, -1.17081, 2.21593, 0.7333333, 0, 1, 1,
0.8650405, 0.6091985, -0.04339661, 0.7411765, 0, 1, 1,
0.866321, 0.3389129, 0.5980788, 0.7450981, 0, 1, 1,
0.8710555, -0.3318087, 0.9840136, 0.7529412, 0, 1, 1,
0.8744606, -0.08397356, 0.04778855, 0.7568628, 0, 1, 1,
0.8804942, -0.1743669, 2.646218, 0.7647059, 0, 1, 1,
0.8826901, -0.7220647, 4.268785, 0.7686275, 0, 1, 1,
0.8911312, -0.204294, 1.458187, 0.7764706, 0, 1, 1,
0.8938175, 2.095089, -0.05082889, 0.7803922, 0, 1, 1,
0.896944, 0.8720996, -0.5474396, 0.7882353, 0, 1, 1,
0.8987021, 1.670144, 1.901475, 0.7921569, 0, 1, 1,
0.9010293, 0.6642615, -0.5681235, 0.8, 0, 1, 1,
0.9029357, 0.807356, 0.7397026, 0.8078431, 0, 1, 1,
0.9034101, -1.031783, 2.245884, 0.8117647, 0, 1, 1,
0.9044564, -1.26326, 3.95595, 0.8196079, 0, 1, 1,
0.9064873, 0.8984368, -0.7005033, 0.8235294, 0, 1, 1,
0.9184269, 0.7960717, 0.2947933, 0.8313726, 0, 1, 1,
0.9187751, -1.666614, 5.617076, 0.8352941, 0, 1, 1,
0.9280013, 1.304675, 0.346342, 0.8431373, 0, 1, 1,
0.9288424, 0.4592097, 1.119819, 0.8470588, 0, 1, 1,
0.9410794, 0.1080724, 0.8259706, 0.854902, 0, 1, 1,
0.9459741, -1.832912, 0.6584402, 0.8588235, 0, 1, 1,
0.946637, 0.1446015, 0.4897207, 0.8666667, 0, 1, 1,
0.9534844, 0.5994078, 0.9156269, 0.8705882, 0, 1, 1,
0.9542376, 0.7447367, 1.944625, 0.8784314, 0, 1, 1,
0.9575117, -2.259683, 2.144878, 0.8823529, 0, 1, 1,
0.9580951, -0.4024209, 2.446008, 0.8901961, 0, 1, 1,
0.9650419, -0.05868506, 1.32429, 0.8941177, 0, 1, 1,
0.9686219, -1.092847, 2.877928, 0.9019608, 0, 1, 1,
0.9698746, 0.09006565, 1.112117, 0.9098039, 0, 1, 1,
0.972874, -2.246483, 3.518587, 0.9137255, 0, 1, 1,
0.9768378, 0.131444, 0.8340882, 0.9215686, 0, 1, 1,
0.9777738, 0.06394473, 2.501416, 0.9254902, 0, 1, 1,
0.9834061, -0.5622368, 2.433448, 0.9333333, 0, 1, 1,
0.9924271, -0.7873777, 2.05574, 0.9372549, 0, 1, 1,
0.9970479, -0.9891549, 3.052173, 0.945098, 0, 1, 1,
0.9983742, -1.751156, 2.928082, 0.9490196, 0, 1, 1,
1.000373, 1.561323, -0.297117, 0.9568627, 0, 1, 1,
1.007053, 0.471035, 1.042213, 0.9607843, 0, 1, 1,
1.012911, 1.146957, -0.2558253, 0.9686275, 0, 1, 1,
1.016085, -0.3007666, 0.7980462, 0.972549, 0, 1, 1,
1.016382, -1.382049, 2.320089, 0.9803922, 0, 1, 1,
1.016577, 0.9524025, -0.09231861, 0.9843137, 0, 1, 1,
1.020551, -1.815467, 1.850688, 0.9921569, 0, 1, 1,
1.02666, -0.946318, 2.448106, 0.9960784, 0, 1, 1,
1.026848, 0.03482611, 0.278881, 1, 0, 0.9960784, 1,
1.029128, -0.02186215, 1.210719, 1, 0, 0.9882353, 1,
1.035796, 0.2182625, 0.4479159, 1, 0, 0.9843137, 1,
1.057593, 0.0005759575, 0.1960805, 1, 0, 0.9764706, 1,
1.060192, -0.5330326, -0.848387, 1, 0, 0.972549, 1,
1.060975, -0.1496091, 1.689194, 1, 0, 0.9647059, 1,
1.069619, -1.609052, 1.476321, 1, 0, 0.9607843, 1,
1.072809, -0.08181018, 0.7530832, 1, 0, 0.9529412, 1,
1.07554, -0.02209369, 4.139146, 1, 0, 0.9490196, 1,
1.079367, 1.164128, 2.242643, 1, 0, 0.9411765, 1,
1.081904, 0.79268, 2.044745, 1, 0, 0.9372549, 1,
1.083891, -0.6631104, 2.907943, 1, 0, 0.9294118, 1,
1.091518, -1.444807, 0.8284923, 1, 0, 0.9254902, 1,
1.091605, -1.283876, 2.712814, 1, 0, 0.9176471, 1,
1.105061, 0.3676901, 0.6850963, 1, 0, 0.9137255, 1,
1.108081, 1.651326, 1.442932, 1, 0, 0.9058824, 1,
1.109149, -0.2537898, 1.859114, 1, 0, 0.9019608, 1,
1.112386, -0.4234967, 2.374676, 1, 0, 0.8941177, 1,
1.113945, 0.08411027, 0.8294457, 1, 0, 0.8862745, 1,
1.114511, 0.5884656, 1.937257, 1, 0, 0.8823529, 1,
1.11479, 1.475384, 1.121739, 1, 0, 0.8745098, 1,
1.115655, -0.2747533, 0.1358864, 1, 0, 0.8705882, 1,
1.12012, 0.7233259, 1.785193, 1, 0, 0.8627451, 1,
1.125701, 0.9525438, 1.263421, 1, 0, 0.8588235, 1,
1.12777, 0.5232651, 1.451535, 1, 0, 0.8509804, 1,
1.129944, -1.006426, 2.910684, 1, 0, 0.8470588, 1,
1.138186, 0.2782646, 1.788649, 1, 0, 0.8392157, 1,
1.142438, 0.2630913, 0.971375, 1, 0, 0.8352941, 1,
1.144391, 1.302361, 0.5564109, 1, 0, 0.827451, 1,
1.144777, -1.531224, 2.240778, 1, 0, 0.8235294, 1,
1.15164, 0.2967099, -0.1110201, 1, 0, 0.8156863, 1,
1.155196, -0.6743905, 1.469188, 1, 0, 0.8117647, 1,
1.156048, 1.271334, -0.9743061, 1, 0, 0.8039216, 1,
1.157769, 0.9822009, 0.4963635, 1, 0, 0.7960784, 1,
1.161758, 0.1396341, 3.319749, 1, 0, 0.7921569, 1,
1.165493, 0.6816423, 0.08306708, 1, 0, 0.7843137, 1,
1.175208, 0.6852226, 0.9399024, 1, 0, 0.7803922, 1,
1.181691, -1.347201, 3.965727, 1, 0, 0.772549, 1,
1.194517, 1.065052, 1.970572, 1, 0, 0.7686275, 1,
1.204098, -0.7361761, 3.990295, 1, 0, 0.7607843, 1,
1.210381, 0.8941256, 0.2119638, 1, 0, 0.7568628, 1,
1.221567, 0.3803714, -0.1754991, 1, 0, 0.7490196, 1,
1.22162, -0.6902824, 2.817804, 1, 0, 0.7450981, 1,
1.224683, -1.358268, 3.694165, 1, 0, 0.7372549, 1,
1.224915, -2.915957, 3.693208, 1, 0, 0.7333333, 1,
1.229596, 0.6888738, 1.615133, 1, 0, 0.7254902, 1,
1.230019, -1.358947, 3.132437, 1, 0, 0.7215686, 1,
1.24003, 0.4202691, 1.812379, 1, 0, 0.7137255, 1,
1.244049, -0.4319388, 3.226742, 1, 0, 0.7098039, 1,
1.247758, -0.3674262, 1.649615, 1, 0, 0.7019608, 1,
1.250991, -0.1972729, 2.23884, 1, 0, 0.6941177, 1,
1.258777, -0.3958349, 1.412732, 1, 0, 0.6901961, 1,
1.260047, 0.9528951, 1.709652, 1, 0, 0.682353, 1,
1.26265, 0.8279727, 1.6788, 1, 0, 0.6784314, 1,
1.266751, -0.5397937, 1.25194, 1, 0, 0.6705883, 1,
1.267956, 2.153359, -0.5374576, 1, 0, 0.6666667, 1,
1.269977, 0.06117275, 1.436764, 1, 0, 0.6588235, 1,
1.272323, 0.9220352, 0.8108213, 1, 0, 0.654902, 1,
1.279971, -0.2764077, -0.8924447, 1, 0, 0.6470588, 1,
1.279979, -2.673397, 2.328686, 1, 0, 0.6431373, 1,
1.28099, 0.8270946, 0.5593234, 1, 0, 0.6352941, 1,
1.282709, -0.8090658, 1.864137, 1, 0, 0.6313726, 1,
1.286549, 2.068414, 1.602798, 1, 0, 0.6235294, 1,
1.28912, -1.865173, 3.380713, 1, 0, 0.6196079, 1,
1.290515, -0.2559952, 2.151498, 1, 0, 0.6117647, 1,
1.300164, 1.993079, 1.933926, 1, 0, 0.6078432, 1,
1.306134, 1.930539, 2.226329, 1, 0, 0.6, 1,
1.321677, 1.538517, -0.4211756, 1, 0, 0.5921569, 1,
1.327699, -1.173984, 3.101313, 1, 0, 0.5882353, 1,
1.330654, -1.194044, 2.771303, 1, 0, 0.5803922, 1,
1.332489, 0.7750344, 0.09191696, 1, 0, 0.5764706, 1,
1.334702, 0.5492219, 2.101356, 1, 0, 0.5686275, 1,
1.340553, -0.5567608, 0.2493515, 1, 0, 0.5647059, 1,
1.346642, -1.273615, 2.257711, 1, 0, 0.5568628, 1,
1.347208, -0.8886419, 2.286035, 1, 0, 0.5529412, 1,
1.349695, 0.3815938, 0.2288749, 1, 0, 0.5450981, 1,
1.355884, 1.066401, 2.161657, 1, 0, 0.5411765, 1,
1.356116, 0.5182424, 1.555689, 1, 0, 0.5333334, 1,
1.366802, -0.02231104, 0.9322672, 1, 0, 0.5294118, 1,
1.388507, 1.404661, -0.39989, 1, 0, 0.5215687, 1,
1.398472, -0.1494157, 2.788424, 1, 0, 0.5176471, 1,
1.399518, 0.4727441, 1.703249, 1, 0, 0.509804, 1,
1.401451, 0.1166077, 2.319531, 1, 0, 0.5058824, 1,
1.406604, -0.0458868, 1.328796, 1, 0, 0.4980392, 1,
1.417797, 0.8300579, 0.01989961, 1, 0, 0.4901961, 1,
1.436395, -0.8044404, 2.81718, 1, 0, 0.4862745, 1,
1.444004, -0.2594446, 1.347877, 1, 0, 0.4784314, 1,
1.447783, 0.6907381, 1.676327, 1, 0, 0.4745098, 1,
1.458863, 1.662847, -0.1725392, 1, 0, 0.4666667, 1,
1.464195, 0.1580205, -0.05927755, 1, 0, 0.4627451, 1,
1.465285, -0.302845, 2.403996, 1, 0, 0.454902, 1,
1.469243, -0.3577547, 2.52745, 1, 0, 0.4509804, 1,
1.482044, 0.4346925, 1.670756, 1, 0, 0.4431373, 1,
1.511646, 0.7773208, 0.2362748, 1, 0, 0.4392157, 1,
1.523259, 0.9540137, 3.431805, 1, 0, 0.4313726, 1,
1.543051, 0.96056, 1.352455, 1, 0, 0.427451, 1,
1.54396, -0.1531757, 1.956234, 1, 0, 0.4196078, 1,
1.572489, 1.018729, 1.752915, 1, 0, 0.4156863, 1,
1.574353, 0.6101003, 2.12337, 1, 0, 0.4078431, 1,
1.586126, -0.2987472, 1.883885, 1, 0, 0.4039216, 1,
1.587742, 1.873908, 0.7711322, 1, 0, 0.3960784, 1,
1.61079, -0.1331927, 1.643351, 1, 0, 0.3882353, 1,
1.64988, -0.5576882, 0.7195535, 1, 0, 0.3843137, 1,
1.665505, 0.03007808, 1.618498, 1, 0, 0.3764706, 1,
1.673717, -1.672008, 0.9944181, 1, 0, 0.372549, 1,
1.679507, 0.8579807, 1.29095, 1, 0, 0.3647059, 1,
1.69909, -1.599032, 3.453497, 1, 0, 0.3607843, 1,
1.704674, 0.0211814, 1.854427, 1, 0, 0.3529412, 1,
1.711751, -0.4482825, 2.358816, 1, 0, 0.3490196, 1,
1.734615, -0.8450925, 2.631251, 1, 0, 0.3411765, 1,
1.742777, -0.7538873, 1.345751, 1, 0, 0.3372549, 1,
1.748364, -0.6605707, 3.750602, 1, 0, 0.3294118, 1,
1.751072, 1.606147, -0.9805123, 1, 0, 0.3254902, 1,
1.752002, -0.189846, 2.926251, 1, 0, 0.3176471, 1,
1.763652, 0.7658144, 0.5638208, 1, 0, 0.3137255, 1,
1.770209, -0.046755, 1.40394, 1, 0, 0.3058824, 1,
1.803838, -0.1890882, 1.926095, 1, 0, 0.2980392, 1,
1.807073, 0.2795047, 1.042858, 1, 0, 0.2941177, 1,
1.832707, 0.4609009, 1.253702, 1, 0, 0.2862745, 1,
1.846062, -0.7088288, 1.830105, 1, 0, 0.282353, 1,
1.84998, -5.583506e-05, 2.705835, 1, 0, 0.2745098, 1,
1.851151, 0.8207758, 0.8845943, 1, 0, 0.2705882, 1,
1.856346, -0.1041517, 2.679063, 1, 0, 0.2627451, 1,
1.871638, -0.3046981, 0.7385578, 1, 0, 0.2588235, 1,
1.880173, 0.701076, 1.579625, 1, 0, 0.2509804, 1,
1.885362, 1.621158, 1.207161, 1, 0, 0.2470588, 1,
1.889364, 0.6101235, 2.079339, 1, 0, 0.2392157, 1,
1.890412, 0.6902804, 1.038059, 1, 0, 0.2352941, 1,
1.892115, 1.3737, 2.439451, 1, 0, 0.227451, 1,
1.899266, 0.9397215, 0.9122899, 1, 0, 0.2235294, 1,
1.906402, 0.3180683, 2.80982, 1, 0, 0.2156863, 1,
1.934602, -0.6862789, -0.6140566, 1, 0, 0.2117647, 1,
1.940202, 1.068462, 0.2098887, 1, 0, 0.2039216, 1,
1.956642, -1.106392, 2.838733, 1, 0, 0.1960784, 1,
1.976981, 0.1537687, 0.9383288, 1, 0, 0.1921569, 1,
1.978285, 0.3795966, -0.3203526, 1, 0, 0.1843137, 1,
2.021731, -0.01012036, 3.150653, 1, 0, 0.1803922, 1,
2.045544, 1.326652, 1.522369, 1, 0, 0.172549, 1,
2.052573, 0.08853963, 1.105649, 1, 0, 0.1686275, 1,
2.079008, 0.05085859, 2.372292, 1, 0, 0.1607843, 1,
2.092313, 0.3938726, 1.184975, 1, 0, 0.1568628, 1,
2.097949, 0.05020695, 2.574337, 1, 0, 0.1490196, 1,
2.127337, -0.09399197, 1.089398, 1, 0, 0.145098, 1,
2.223822, -1.060948, 0.607577, 1, 0, 0.1372549, 1,
2.229096, -0.346202, 2.77107, 1, 0, 0.1333333, 1,
2.243274, -1.627627, 1.205232, 1, 0, 0.1254902, 1,
2.288995, -0.4775985, 1.342854, 1, 0, 0.1215686, 1,
2.298314, 0.3191213, -0.5404187, 1, 0, 0.1137255, 1,
2.299359, 0.6760129, 0.8389841, 1, 0, 0.1098039, 1,
2.302796, 0.1861708, 1.81693, 1, 0, 0.1019608, 1,
2.305274, 0.475244, 1.809038, 1, 0, 0.09411765, 1,
2.315135, -0.03556788, 0.8627281, 1, 0, 0.09019608, 1,
2.315265, 0.5964621, 2.361544, 1, 0, 0.08235294, 1,
2.348823, 1.415021, 1.245582, 1, 0, 0.07843138, 1,
2.361875, -0.9591798, 3.046373, 1, 0, 0.07058824, 1,
2.387516, -0.7596448, 3.891596, 1, 0, 0.06666667, 1,
2.447512, -0.2079294, 0.7975767, 1, 0, 0.05882353, 1,
2.498165, 0.8033271, 0.9733952, 1, 0, 0.05490196, 1,
2.516996, 1.147965, 3.363172, 1, 0, 0.04705882, 1,
2.51809, -0.02014684, 2.795502, 1, 0, 0.04313726, 1,
2.549171, 1.335403, 1.587489, 1, 0, 0.03529412, 1,
2.769825, -0.8733398, 0.7042289, 1, 0, 0.03137255, 1,
2.904705, 0.7083976, 1.610181, 1, 0, 0.02352941, 1,
2.97392, 1.470145, 2.730889, 1, 0, 0.01960784, 1,
2.974116, -0.6788146, 3.461676, 1, 0, 0.01176471, 1,
3.099829, 1.415573, 2.569736, 1, 0, 0.007843138, 1
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
-0.01531792, -4.489005, -6.890103, 0, -0.5, 0.5, 0.5,
-0.01531792, -4.489005, -6.890103, 1, -0.5, 0.5, 0.5,
-0.01531792, -4.489005, -6.890103, 1, 1.5, 0.5, 0.5,
-0.01531792, -4.489005, -6.890103, 0, 1.5, 0.5, 0.5
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
-4.1865, -0.1347126, -6.890103, 0, -0.5, 0.5, 0.5,
-4.1865, -0.1347126, -6.890103, 1, -0.5, 0.5, 0.5,
-4.1865, -0.1347126, -6.890103, 1, 1.5, 0.5, 0.5,
-4.1865, -0.1347126, -6.890103, 0, 1.5, 0.5, 0.5
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
-4.1865, -4.489005, 0.2698424, 0, -0.5, 0.5, 0.5,
-4.1865, -4.489005, 0.2698424, 1, -0.5, 0.5, 0.5,
-4.1865, -4.489005, 0.2698424, 1, 1.5, 0.5, 0.5,
-4.1865, -4.489005, 0.2698424, 0, 1.5, 0.5, 0.5
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
-3, -3.484168, -5.237808,
3, -3.484168, -5.237808,
-3, -3.484168, -5.237808,
-3, -3.651641, -5.513191,
-2, -3.484168, -5.237808,
-2, -3.651641, -5.513191,
-1, -3.484168, -5.237808,
-1, -3.651641, -5.513191,
0, -3.484168, -5.237808,
0, -3.651641, -5.513191,
1, -3.484168, -5.237808,
1, -3.651641, -5.513191,
2, -3.484168, -5.237808,
2, -3.651641, -5.513191,
3, -3.484168, -5.237808,
3, -3.651641, -5.513191
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
-3, -3.986586, -6.063956, 0, -0.5, 0.5, 0.5,
-3, -3.986586, -6.063956, 1, -0.5, 0.5, 0.5,
-3, -3.986586, -6.063956, 1, 1.5, 0.5, 0.5,
-3, -3.986586, -6.063956, 0, 1.5, 0.5, 0.5,
-2, -3.986586, -6.063956, 0, -0.5, 0.5, 0.5,
-2, -3.986586, -6.063956, 1, -0.5, 0.5, 0.5,
-2, -3.986586, -6.063956, 1, 1.5, 0.5, 0.5,
-2, -3.986586, -6.063956, 0, 1.5, 0.5, 0.5,
-1, -3.986586, -6.063956, 0, -0.5, 0.5, 0.5,
-1, -3.986586, -6.063956, 1, -0.5, 0.5, 0.5,
-1, -3.986586, -6.063956, 1, 1.5, 0.5, 0.5,
-1, -3.986586, -6.063956, 0, 1.5, 0.5, 0.5,
0, -3.986586, -6.063956, 0, -0.5, 0.5, 0.5,
0, -3.986586, -6.063956, 1, -0.5, 0.5, 0.5,
0, -3.986586, -6.063956, 1, 1.5, 0.5, 0.5,
0, -3.986586, -6.063956, 0, 1.5, 0.5, 0.5,
1, -3.986586, -6.063956, 0, -0.5, 0.5, 0.5,
1, -3.986586, -6.063956, 1, -0.5, 0.5, 0.5,
1, -3.986586, -6.063956, 1, 1.5, 0.5, 0.5,
1, -3.986586, -6.063956, 0, 1.5, 0.5, 0.5,
2, -3.986586, -6.063956, 0, -0.5, 0.5, 0.5,
2, -3.986586, -6.063956, 1, -0.5, 0.5, 0.5,
2, -3.986586, -6.063956, 1, 1.5, 0.5, 0.5,
2, -3.986586, -6.063956, 0, 1.5, 0.5, 0.5,
3, -3.986586, -6.063956, 0, -0.5, 0.5, 0.5,
3, -3.986586, -6.063956, 1, -0.5, 0.5, 0.5,
3, -3.986586, -6.063956, 1, 1.5, 0.5, 0.5,
3, -3.986586, -6.063956, 0, 1.5, 0.5, 0.5
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
-3.223919, -3, -5.237808,
-3.223919, 3, -5.237808,
-3.223919, -3, -5.237808,
-3.384349, -3, -5.513191,
-3.223919, -2, -5.237808,
-3.384349, -2, -5.513191,
-3.223919, -1, -5.237808,
-3.384349, -1, -5.513191,
-3.223919, 0, -5.237808,
-3.384349, 0, -5.513191,
-3.223919, 1, -5.237808,
-3.384349, 1, -5.513191,
-3.223919, 2, -5.237808,
-3.384349, 2, -5.513191,
-3.223919, 3, -5.237808,
-3.384349, 3, -5.513191
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
-3.705209, -3, -6.063956, 0, -0.5, 0.5, 0.5,
-3.705209, -3, -6.063956, 1, -0.5, 0.5, 0.5,
-3.705209, -3, -6.063956, 1, 1.5, 0.5, 0.5,
-3.705209, -3, -6.063956, 0, 1.5, 0.5, 0.5,
-3.705209, -2, -6.063956, 0, -0.5, 0.5, 0.5,
-3.705209, -2, -6.063956, 1, -0.5, 0.5, 0.5,
-3.705209, -2, -6.063956, 1, 1.5, 0.5, 0.5,
-3.705209, -2, -6.063956, 0, 1.5, 0.5, 0.5,
-3.705209, -1, -6.063956, 0, -0.5, 0.5, 0.5,
-3.705209, -1, -6.063956, 1, -0.5, 0.5, 0.5,
-3.705209, -1, -6.063956, 1, 1.5, 0.5, 0.5,
-3.705209, -1, -6.063956, 0, 1.5, 0.5, 0.5,
-3.705209, 0, -6.063956, 0, -0.5, 0.5, 0.5,
-3.705209, 0, -6.063956, 1, -0.5, 0.5, 0.5,
-3.705209, 0, -6.063956, 1, 1.5, 0.5, 0.5,
-3.705209, 0, -6.063956, 0, 1.5, 0.5, 0.5,
-3.705209, 1, -6.063956, 0, -0.5, 0.5, 0.5,
-3.705209, 1, -6.063956, 1, -0.5, 0.5, 0.5,
-3.705209, 1, -6.063956, 1, 1.5, 0.5, 0.5,
-3.705209, 1, -6.063956, 0, 1.5, 0.5, 0.5,
-3.705209, 2, -6.063956, 0, -0.5, 0.5, 0.5,
-3.705209, 2, -6.063956, 1, -0.5, 0.5, 0.5,
-3.705209, 2, -6.063956, 1, 1.5, 0.5, 0.5,
-3.705209, 2, -6.063956, 0, 1.5, 0.5, 0.5,
-3.705209, 3, -6.063956, 0, -0.5, 0.5, 0.5,
-3.705209, 3, -6.063956, 1, -0.5, 0.5, 0.5,
-3.705209, 3, -6.063956, 1, 1.5, 0.5, 0.5,
-3.705209, 3, -6.063956, 0, 1.5, 0.5, 0.5
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
-3.223919, -3.484168, -4,
-3.223919, -3.484168, 4,
-3.223919, -3.484168, -4,
-3.384349, -3.651641, -4,
-3.223919, -3.484168, -2,
-3.384349, -3.651641, -2,
-3.223919, -3.484168, 0,
-3.384349, -3.651641, 0,
-3.223919, -3.484168, 2,
-3.384349, -3.651641, 2,
-3.223919, -3.484168, 4,
-3.384349, -3.651641, 4
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
-3.705209, -3.986586, -4, 0, -0.5, 0.5, 0.5,
-3.705209, -3.986586, -4, 1, -0.5, 0.5, 0.5,
-3.705209, -3.986586, -4, 1, 1.5, 0.5, 0.5,
-3.705209, -3.986586, -4, 0, 1.5, 0.5, 0.5,
-3.705209, -3.986586, -2, 0, -0.5, 0.5, 0.5,
-3.705209, -3.986586, -2, 1, -0.5, 0.5, 0.5,
-3.705209, -3.986586, -2, 1, 1.5, 0.5, 0.5,
-3.705209, -3.986586, -2, 0, 1.5, 0.5, 0.5,
-3.705209, -3.986586, 0, 0, -0.5, 0.5, 0.5,
-3.705209, -3.986586, 0, 1, -0.5, 0.5, 0.5,
-3.705209, -3.986586, 0, 1, 1.5, 0.5, 0.5,
-3.705209, -3.986586, 0, 0, 1.5, 0.5, 0.5,
-3.705209, -3.986586, 2, 0, -0.5, 0.5, 0.5,
-3.705209, -3.986586, 2, 1, -0.5, 0.5, 0.5,
-3.705209, -3.986586, 2, 1, 1.5, 0.5, 0.5,
-3.705209, -3.986586, 2, 0, 1.5, 0.5, 0.5,
-3.705209, -3.986586, 4, 0, -0.5, 0.5, 0.5,
-3.705209, -3.986586, 4, 1, -0.5, 0.5, 0.5,
-3.705209, -3.986586, 4, 1, 1.5, 0.5, 0.5,
-3.705209, -3.986586, 4, 0, 1.5, 0.5, 0.5
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
-3.223919, -3.484168, -5.237808,
-3.223919, 3.214743, -5.237808,
-3.223919, -3.484168, 5.777493,
-3.223919, 3.214743, 5.777493,
-3.223919, -3.484168, -5.237808,
-3.223919, -3.484168, 5.777493,
-3.223919, 3.214743, -5.237808,
-3.223919, 3.214743, 5.777493,
-3.223919, -3.484168, -5.237808,
3.193283, -3.484168, -5.237808,
-3.223919, -3.484168, 5.777493,
3.193283, -3.484168, 5.777493,
-3.223919, 3.214743, -5.237808,
3.193283, 3.214743, -5.237808,
-3.223919, 3.214743, 5.777493,
3.193283, 3.214743, 5.777493,
3.193283, -3.484168, -5.237808,
3.193283, 3.214743, -5.237808,
3.193283, -3.484168, 5.777493,
3.193283, 3.214743, 5.777493,
3.193283, -3.484168, -5.237808,
3.193283, -3.484168, 5.777493,
3.193283, 3.214743, -5.237808,
3.193283, 3.214743, 5.777493
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
var radius = 7.689928;
var distance = 34.21336;
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
mvMatrix.translate( 0.01531792, 0.1347126, -0.2698424 );
mvMatrix.scale( 1.295658, 1.241172, 0.7548137 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.21336);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
Oxyacetate<-read.table("Oxyacetate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Oxyacetate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Oxyacetate' not found
```

```r
y<-Oxyacetate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Oxyacetate' not found
```

```r
z<-Oxyacetate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Oxyacetate' not found
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
-3.130465, -0.4350101, -0.7920438, 0, 0, 1, 1, 1,
-2.908907, 0.4729397, -0.2906457, 1, 0, 0, 1, 1,
-2.693297, -0.1779777, -1.679853, 1, 0, 0, 1, 1,
-2.640163, -0.4468151, -2.079171, 1, 0, 0, 1, 1,
-2.61887, -1.687597, -0.9168221, 1, 0, 0, 1, 1,
-2.566482, 1.029111, -0.8814111, 1, 0, 0, 1, 1,
-2.428394, 1.035742, -1.460303, 0, 0, 0, 1, 1,
-2.326725, 0.7653051, -0.2234795, 0, 0, 0, 1, 1,
-2.316325, -0.001928675, 0.1515115, 0, 0, 0, 1, 1,
-2.291469, -1.512806, -1.000095, 0, 0, 0, 1, 1,
-2.262382, -1.511029, -1.484708, 0, 0, 0, 1, 1,
-2.240084, 0.5406413, -0.9288983, 0, 0, 0, 1, 1,
-2.224754, -0.8952529, -2.507485, 0, 0, 0, 1, 1,
-2.177457, 0.3835396, -0.7366477, 1, 1, 1, 1, 1,
-2.172474, 2.562989, -0.4684623, 1, 1, 1, 1, 1,
-2.165447, -0.1328824, -0.09748389, 1, 1, 1, 1, 1,
-2.156065, -0.1336823, -0.7962739, 1, 1, 1, 1, 1,
-2.133428, 0.1681695, -2.430485, 1, 1, 1, 1, 1,
-2.128575, 1.373996, -2.335332, 1, 1, 1, 1, 1,
-2.067143, 0.02012691, 0.7130811, 1, 1, 1, 1, 1,
-2.048872, -0.9852974, -2.775032, 1, 1, 1, 1, 1,
-1.971839, -0.7358211, -1.340197, 1, 1, 1, 1, 1,
-1.955097, 0.6107675, 0.638537, 1, 1, 1, 1, 1,
-1.912868, 1.667785, 0.8303651, 1, 1, 1, 1, 1,
-1.886998, 0.3934796, -2.631004, 1, 1, 1, 1, 1,
-1.884027, 1.69377, -0.2525174, 1, 1, 1, 1, 1,
-1.882579, 0.1106651, 0.6579279, 1, 1, 1, 1, 1,
-1.87797, 0.3674003, -1.238524, 1, 1, 1, 1, 1,
-1.841308, -0.6876567, -1.351412, 0, 0, 1, 1, 1,
-1.813281, 0.8321062, 0.1241906, 1, 0, 0, 1, 1,
-1.812925, -3.386611, -3.085442, 1, 0, 0, 1, 1,
-1.811866, 0.5368354, -0.8550093, 1, 0, 0, 1, 1,
-1.807044, 0.5442981, -0.9015189, 1, 0, 0, 1, 1,
-1.800638, -0.04084386, -1.122277, 1, 0, 0, 1, 1,
-1.787073, 0.2662348, -3.779499, 0, 0, 0, 1, 1,
-1.77729, 0.05900817, -1.607954, 0, 0, 0, 1, 1,
-1.765902, -0.6572046, -1.753406, 0, 0, 0, 1, 1,
-1.753868, -1.219413, -1.534966, 0, 0, 0, 1, 1,
-1.74591, -2.602173, -3.487976, 0, 0, 0, 1, 1,
-1.744094, -0.5501668, -0.1139988, 0, 0, 0, 1, 1,
-1.742776, 0.4610611, -0.8975732, 0, 0, 0, 1, 1,
-1.729373, -0.2699946, -2.700405, 1, 1, 1, 1, 1,
-1.728928, -0.3354594, -0.6174864, 1, 1, 1, 1, 1,
-1.728293, 0.7100673, -1.845573, 1, 1, 1, 1, 1,
-1.719596, 0.7310739, -0.8474545, 1, 1, 1, 1, 1,
-1.712328, -0.1038133, -1.768281, 1, 1, 1, 1, 1,
-1.683756, 1.591926, -0.8090271, 1, 1, 1, 1, 1,
-1.676353, 0.8227693, -2.54588, 1, 1, 1, 1, 1,
-1.670217, -0.3732469, -3.034766, 1, 1, 1, 1, 1,
-1.668466, -0.216636, -1.949435, 1, 1, 1, 1, 1,
-1.652933, 1.219828, -0.9624415, 1, 1, 1, 1, 1,
-1.651081, -0.2789396, -1.301224, 1, 1, 1, 1, 1,
-1.626734, 0.08308662, -0.5790081, 1, 1, 1, 1, 1,
-1.620766, -0.419473, -2.535533, 1, 1, 1, 1, 1,
-1.605902, 0.7478512, -0.6870678, 1, 1, 1, 1, 1,
-1.603415, 0.7274137, 0.9874907, 1, 1, 1, 1, 1,
-1.591547, 0.5419833, 2.111625, 0, 0, 1, 1, 1,
-1.576087, 0.7480989, -0.4236535, 1, 0, 0, 1, 1,
-1.568504, -0.5100421, -3.257978, 1, 0, 0, 1, 1,
-1.563109, 1.549519, 0.5701376, 1, 0, 0, 1, 1,
-1.554697, 0.4786594, -2.990429, 1, 0, 0, 1, 1,
-1.551593, 0.9988856, -1.39732, 1, 0, 0, 1, 1,
-1.551416, 1.099348, 0.8996701, 0, 0, 0, 1, 1,
-1.548673, 0.5839677, 0.004944057, 0, 0, 0, 1, 1,
-1.548497, -1.512334, -2.529828, 0, 0, 0, 1, 1,
-1.548116, -0.9295771, -2.336859, 0, 0, 0, 1, 1,
-1.546016, -0.5247488, -3.025266, 0, 0, 0, 1, 1,
-1.540894, 0.8324471, -0.8707485, 0, 0, 0, 1, 1,
-1.537743, -0.2377319, -3.459105, 0, 0, 0, 1, 1,
-1.534222, -0.3803283, -3.036797, 1, 1, 1, 1, 1,
-1.531736, -0.01446589, -2.541329, 1, 1, 1, 1, 1,
-1.519178, 0.950099, -0.7341511, 1, 1, 1, 1, 1,
-1.517479, -0.1885452, -1.043359, 1, 1, 1, 1, 1,
-1.515857, -0.5596232, -2.134115, 1, 1, 1, 1, 1,
-1.49056, 0.1528749, -1.887055, 1, 1, 1, 1, 1,
-1.489706, 0.007841283, -0.604575, 1, 1, 1, 1, 1,
-1.479591, 0.3582381, -1.01809, 1, 1, 1, 1, 1,
-1.476765, -1.65869, -1.526634, 1, 1, 1, 1, 1,
-1.467868, -0.7981569, -0.7214203, 1, 1, 1, 1, 1,
-1.465315, -0.03438396, 0.5732918, 1, 1, 1, 1, 1,
-1.463529, -2.226035, -4.257724, 1, 1, 1, 1, 1,
-1.451266, 0.2911634, -1.077898, 1, 1, 1, 1, 1,
-1.408156, -0.6221119, -2.51623, 1, 1, 1, 1, 1,
-1.391883, -0.8009284, -3.117848, 1, 1, 1, 1, 1,
-1.39115, 0.7318454, -0.862579, 0, 0, 1, 1, 1,
-1.383834, -0.6261557, -0.8731328, 1, 0, 0, 1, 1,
-1.377393, -0.1961064, -1.409133, 1, 0, 0, 1, 1,
-1.373805, -0.001882987, -0.8869068, 1, 0, 0, 1, 1,
-1.366693, 0.4077999, -1.475527, 1, 0, 0, 1, 1,
-1.361379, -0.02892613, -1.143292, 1, 0, 0, 1, 1,
-1.359044, -0.1837009, -2.241861, 0, 0, 0, 1, 1,
-1.352488, -0.7486533, -2.397413, 0, 0, 0, 1, 1,
-1.351531, -0.2292227, -1.689725, 0, 0, 0, 1, 1,
-1.339771, 1.316938, -1.739305, 0, 0, 0, 1, 1,
-1.338472, 0.8557905, -0.4084529, 0, 0, 0, 1, 1,
-1.317813, -1.450236, -1.359849, 0, 0, 0, 1, 1,
-1.283375, 0.02371972, -2.137512, 0, 0, 0, 1, 1,
-1.28202, -0.467426, -0.4100486, 1, 1, 1, 1, 1,
-1.281748, -0.5539349, -2.406096, 1, 1, 1, 1, 1,
-1.26846, 1.090091, -1.678772, 1, 1, 1, 1, 1,
-1.254596, -0.6130536, -1.805196, 1, 1, 1, 1, 1,
-1.253883, 1.0443, -0.9741887, 1, 1, 1, 1, 1,
-1.252566, 0.09858695, -1.392072, 1, 1, 1, 1, 1,
-1.243276, 0.1636941, -0.5324425, 1, 1, 1, 1, 1,
-1.230368, -0.9481151, -3.131964, 1, 1, 1, 1, 1,
-1.229915, 0.06964009, -2.238997, 1, 1, 1, 1, 1,
-1.225497, -0.02465025, -1.186187, 1, 1, 1, 1, 1,
-1.224334, 0.7480567, -0.7339161, 1, 1, 1, 1, 1,
-1.210087, -1.311059, -4.185572, 1, 1, 1, 1, 1,
-1.207649, 0.9390675, -1.597699, 1, 1, 1, 1, 1,
-1.20623, -0.2445528, -1.556879, 1, 1, 1, 1, 1,
-1.199725, -1.302817, -4.625867, 1, 1, 1, 1, 1,
-1.19674, 0.08008938, -3.706439, 0, 0, 1, 1, 1,
-1.195899, 0.2185962, -0.1957618, 1, 0, 0, 1, 1,
-1.192541, -0.6959631, -0.3200538, 1, 0, 0, 1, 1,
-1.192226, -1.179716, -4.427525, 1, 0, 0, 1, 1,
-1.179694, 0.7567102, -0.2271668, 1, 0, 0, 1, 1,
-1.172469, -0.3235144, -1.958893, 1, 0, 0, 1, 1,
-1.167805, -1.587096, -0.8379935, 0, 0, 0, 1, 1,
-1.165087, -0.60747, -2.427796, 0, 0, 0, 1, 1,
-1.162169, -1.524206, -4.179255, 0, 0, 0, 1, 1,
-1.150244, 0.5439183, -0.255647, 0, 0, 0, 1, 1,
-1.150115, -0.6751961, -3.605111, 0, 0, 0, 1, 1,
-1.126614, -0.6760597, -1.55026, 0, 0, 0, 1, 1,
-1.126054, -0.38587, -1.778302, 0, 0, 0, 1, 1,
-1.119006, -0.4063031, -2.734051, 1, 1, 1, 1, 1,
-1.114192, 0.4110054, -3.182681, 1, 1, 1, 1, 1,
-1.106726, 0.01568273, -1.903063, 1, 1, 1, 1, 1,
-1.099304, 0.035505, -3.049437, 1, 1, 1, 1, 1,
-1.097297, 1.985995, -1.727067, 1, 1, 1, 1, 1,
-1.093491, 0.795949, -2.114277, 1, 1, 1, 1, 1,
-1.091107, -1.94291, -2.8696, 1, 1, 1, 1, 1,
-1.085249, -1.214536, -1.968652, 1, 1, 1, 1, 1,
-1.08294, -0.2553776, -1.078904, 1, 1, 1, 1, 1,
-1.077975, -1.53955, -2.396653, 1, 1, 1, 1, 1,
-1.075133, -0.235309, -2.918669, 1, 1, 1, 1, 1,
-1.072948, 0.318803, -1.626186, 1, 1, 1, 1, 1,
-1.06439, 0.1193055, -0.5726542, 1, 1, 1, 1, 1,
-1.063684, -0.9561017, -3.17381, 1, 1, 1, 1, 1,
-1.0623, -1.360764, -1.638887, 1, 1, 1, 1, 1,
-1.054433, 0.5091373, -2.521135, 0, 0, 1, 1, 1,
-1.050177, 0.3128354, -1.005743, 1, 0, 0, 1, 1,
-1.048207, 2.344003, 0.7439052, 1, 0, 0, 1, 1,
-1.045822, -1.225623, -2.054085, 1, 0, 0, 1, 1,
-1.044617, 1.17417, -2.339919, 1, 0, 0, 1, 1,
-1.044312, -0.9952118, -0.5236676, 1, 0, 0, 1, 1,
-1.035439, -2.016552, -2.241693, 0, 0, 0, 1, 1,
-1.02305, 0.7041058, 1.046497, 0, 0, 0, 1, 1,
-1.013033, -0.3986565, -2.052517, 0, 0, 0, 1, 1,
-1.007315, -0.1958547, -3.681484, 0, 0, 0, 1, 1,
-1.000512, -0.2778621, -3.393724, 0, 0, 0, 1, 1,
-0.9971851, 0.2190244, -1.11341, 0, 0, 0, 1, 1,
-0.9918281, -0.3071254, -0.3331528, 0, 0, 0, 1, 1,
-0.9914302, 1.249532, -0.8114972, 1, 1, 1, 1, 1,
-0.9878913, -0.8008434, -3.055033, 1, 1, 1, 1, 1,
-0.9805043, -0.79157, -2.776518, 1, 1, 1, 1, 1,
-0.9758755, 0.6927055, -0.4895974, 1, 1, 1, 1, 1,
-0.9756277, 0.2036998, -1.13765, 1, 1, 1, 1, 1,
-0.9726658, 1.267367, 0.3505236, 1, 1, 1, 1, 1,
-0.9706839, -1.641958, -3.411755, 1, 1, 1, 1, 1,
-0.9652693, 1.148728, -1.045536, 1, 1, 1, 1, 1,
-0.9648453, -0.4824559, -3.352734, 1, 1, 1, 1, 1,
-0.9633158, 0.5350844, -1.500796, 1, 1, 1, 1, 1,
-0.9624987, 0.1220649, -1.642442, 1, 1, 1, 1, 1,
-0.9605311, -0.2174567, -3.189974, 1, 1, 1, 1, 1,
-0.9604134, -0.1464023, -2.562827, 1, 1, 1, 1, 1,
-0.9569351, 1.596331, 1.304224, 1, 1, 1, 1, 1,
-0.9521531, -1.776467, -2.526986, 1, 1, 1, 1, 1,
-0.9511865, 2.68005, -1.195974, 0, 0, 1, 1, 1,
-0.9486575, -1.013399, -2.731826, 1, 0, 0, 1, 1,
-0.9419762, -0.6611674, -3.598554, 1, 0, 0, 1, 1,
-0.941969, 1.753636, 0.3512907, 1, 0, 0, 1, 1,
-0.9408166, -0.8556856, -1.277457, 1, 0, 0, 1, 1,
-0.939974, -1.682716, -2.560341, 1, 0, 0, 1, 1,
-0.9340007, -0.1596989, -2.198532, 0, 0, 0, 1, 1,
-0.9298269, -1.465364, -2.660788, 0, 0, 0, 1, 1,
-0.9230137, -1.366487, -2.248906, 0, 0, 0, 1, 1,
-0.9088391, 2.063761, -0.1521075, 0, 0, 0, 1, 1,
-0.9063954, -1.027116, -2.890438, 0, 0, 0, 1, 1,
-0.9000207, -1.779543, -3.289621, 0, 0, 0, 1, 1,
-0.8935858, -1.094709, -2.786848, 0, 0, 0, 1, 1,
-0.8923787, 0.2201351, -1.445625, 1, 1, 1, 1, 1,
-0.887235, 0.9997871, -0.5454897, 1, 1, 1, 1, 1,
-0.8867649, 0.9087059, 0.04991, 1, 1, 1, 1, 1,
-0.8809879, 0.9810423, -0.7669343, 1, 1, 1, 1, 1,
-0.8799534, -0.1540556, -2.717683, 1, 1, 1, 1, 1,
-0.8796967, 1.554708, -1.30766, 1, 1, 1, 1, 1,
-0.8792478, -1.447366, -3.339274, 1, 1, 1, 1, 1,
-0.8771198, 1.367633, -1.559534, 1, 1, 1, 1, 1,
-0.8769624, 0.03852744, -1.460684, 1, 1, 1, 1, 1,
-0.8760304, 1.210842, 0.2366215, 1, 1, 1, 1, 1,
-0.8715493, -0.4335322, -1.265107, 1, 1, 1, 1, 1,
-0.8690603, 0.2349015, -2.578838, 1, 1, 1, 1, 1,
-0.8639151, 0.5837615, -0.1236773, 1, 1, 1, 1, 1,
-0.8571004, 1.638703, 0.2117539, 1, 1, 1, 1, 1,
-0.8491101, -0.06945606, -2.12345, 1, 1, 1, 1, 1,
-0.8403724, 0.8096444, -1.060499, 0, 0, 1, 1, 1,
-0.8318834, 0.1808943, -1.39266, 1, 0, 0, 1, 1,
-0.8302711, 0.5720518, -2.071507, 1, 0, 0, 1, 1,
-0.8232223, -0.7693378, -3.002338, 1, 0, 0, 1, 1,
-0.82197, -0.2430869, -1.418117, 1, 0, 0, 1, 1,
-0.8215139, -0.5259692, -1.670304, 1, 0, 0, 1, 1,
-0.8163605, -0.2058576, -4.637955, 0, 0, 0, 1, 1,
-0.816182, 2.023961, -1.710791, 0, 0, 0, 1, 1,
-0.8129941, -0.7270827, -1.303072, 0, 0, 0, 1, 1,
-0.8066618, 0.97914, 0.3362609, 0, 0, 0, 1, 1,
-0.8060214, 0.05569939, -0.857698, 0, 0, 0, 1, 1,
-0.8018061, -2.133047, -1.947616, 0, 0, 0, 1, 1,
-0.7867839, -0.3616778, -1.290745, 0, 0, 0, 1, 1,
-0.7812282, -0.4646343, -2.172695, 1, 1, 1, 1, 1,
-0.7789121, 0.3138945, 0.5808311, 1, 1, 1, 1, 1,
-0.7775761, -0.6230524, -3.751201, 1, 1, 1, 1, 1,
-0.7717039, 1.075151, 0.3474222, 1, 1, 1, 1, 1,
-0.7699358, 0.8300568, -1.958202, 1, 1, 1, 1, 1,
-0.7608116, 0.05666187, -0.6092793, 1, 1, 1, 1, 1,
-0.7521013, -0.06603096, -3.319581, 1, 1, 1, 1, 1,
-0.7480812, -1.826161, -4.003064, 1, 1, 1, 1, 1,
-0.7477347, -0.1735637, -0.04752562, 1, 1, 1, 1, 1,
-0.7427419, -1.277887, -3.684812, 1, 1, 1, 1, 1,
-0.7420726, -0.6380422, -0.04567238, 1, 1, 1, 1, 1,
-0.7414118, 0.3526695, -2.740445, 1, 1, 1, 1, 1,
-0.7379649, 0.801433, -1.059319, 1, 1, 1, 1, 1,
-0.7352996, 0.4498882, -1.579387, 1, 1, 1, 1, 1,
-0.7178783, 0.04249334, -0.1482154, 1, 1, 1, 1, 1,
-0.7141358, 0.3334328, -0.5857692, 0, 0, 1, 1, 1,
-0.7089213, -0.4194607, -1.468124, 1, 0, 0, 1, 1,
-0.7075711, 0.5525286, 0.2099596, 1, 0, 0, 1, 1,
-0.6939109, 0.01755859, -2.303204, 1, 0, 0, 1, 1,
-0.6924268, -0.5813341, -0.9884501, 1, 0, 0, 1, 1,
-0.6915228, 0.9779687, -0.6988894, 1, 0, 0, 1, 1,
-0.6912643, 1.233576, -1.102695, 0, 0, 0, 1, 1,
-0.6895522, -0.6795449, -2.584404, 0, 0, 0, 1, 1,
-0.6880482, -0.2141993, -1.109187, 0, 0, 0, 1, 1,
-0.6873255, 0.7288796, -1.197194, 0, 0, 0, 1, 1,
-0.676267, 0.2495503, -1.702514, 0, 0, 0, 1, 1,
-0.6705188, -0.5739691, -2.095232, 0, 0, 0, 1, 1,
-0.667839, -0.6943246, -2.407894, 0, 0, 0, 1, 1,
-0.6665484, 1.040385, 0.478353, 1, 1, 1, 1, 1,
-0.6661932, -0.3927859, -1.761557, 1, 1, 1, 1, 1,
-0.6640908, -0.6853009, -1.076237, 1, 1, 1, 1, 1,
-0.6625293, 0.1489367, -1.869246, 1, 1, 1, 1, 1,
-0.6620513, 0.05988166, -0.5291234, 1, 1, 1, 1, 1,
-0.6581558, -0.5633998, -2.398777, 1, 1, 1, 1, 1,
-0.6514521, -0.0605877, 0.7671674, 1, 1, 1, 1, 1,
-0.6494117, 1.014656, -0.9478968, 1, 1, 1, 1, 1,
-0.648921, -0.04856651, -0.9343292, 1, 1, 1, 1, 1,
-0.6479962, 0.08857935, -0.5061353, 1, 1, 1, 1, 1,
-0.6442688, 1.335594, -1.160291, 1, 1, 1, 1, 1,
-0.6440454, 0.7905943, -0.1305005, 1, 1, 1, 1, 1,
-0.6382961, 0.7374469, 1.451096, 1, 1, 1, 1, 1,
-0.6342688, -1.942206, -2.803734, 1, 1, 1, 1, 1,
-0.6262699, 2.664624, -1.575126, 1, 1, 1, 1, 1,
-0.6254127, 0.7851946, -0.70754, 0, 0, 1, 1, 1,
-0.6221077, -0.8417556, -2.779005, 1, 0, 0, 1, 1,
-0.6186836, 0.07187384, -0.8373265, 1, 0, 0, 1, 1,
-0.6175516, 0.7415609, -0.8591632, 1, 0, 0, 1, 1,
-0.6141691, -0.746542, -1.580547, 1, 0, 0, 1, 1,
-0.6100761, 0.4978307, -0.5061192, 1, 0, 0, 1, 1,
-0.6017438, -0.7226844, -2.092616, 0, 0, 0, 1, 1,
-0.5983703, -0.5351228, -2.433848, 0, 0, 0, 1, 1,
-0.5938244, 0.6561686, -0.5800492, 0, 0, 0, 1, 1,
-0.5902983, -0.7522251, -3.99258, 0, 0, 0, 1, 1,
-0.5823213, 0.7041438, 0.8419932, 0, 0, 0, 1, 1,
-0.5797977, -0.2127781, -2.773001, 0, 0, 0, 1, 1,
-0.5794765, 0.1568867, -1.706917, 0, 0, 0, 1, 1,
-0.5774661, -1.222254, -2.679617, 1, 1, 1, 1, 1,
-0.5772246, 0.1055945, -0.2009965, 1, 1, 1, 1, 1,
-0.5737485, 1.346973, 0.5565382, 1, 1, 1, 1, 1,
-0.5720817, -0.2755288, -4.293767, 1, 1, 1, 1, 1,
-0.5697671, -0.1086083, -2.141299, 1, 1, 1, 1, 1,
-0.5676388, 0.5246193, -0.8961632, 1, 1, 1, 1, 1,
-0.5672545, 2.005383, -1.644955, 1, 1, 1, 1, 1,
-0.5619079, -0.3418156, -3.515109, 1, 1, 1, 1, 1,
-0.5580809, 1.074473, 0.3600016, 1, 1, 1, 1, 1,
-0.5478756, 2.019534, -0.9492621, 1, 1, 1, 1, 1,
-0.5475318, -1.0034, -1.424127, 1, 1, 1, 1, 1,
-0.5458499, 1.657322, -2.700301, 1, 1, 1, 1, 1,
-0.5347891, 2.040725, -0.3964967, 1, 1, 1, 1, 1,
-0.5318392, -0.6620003, -3.498495, 1, 1, 1, 1, 1,
-0.5290268, 1.261808, 0.0773026, 1, 1, 1, 1, 1,
-0.525893, 0.4602888, -0.1724066, 0, 0, 1, 1, 1,
-0.5248101, -0.6473813, -2.260582, 1, 0, 0, 1, 1,
-0.5246809, 0.7254866, -1.409838, 1, 0, 0, 1, 1,
-0.5133931, 0.2272445, -0.9232062, 1, 0, 0, 1, 1,
-0.5118163, 0.4084089, -0.06377314, 1, 0, 0, 1, 1,
-0.5104471, 2.083874, -1.090412, 1, 0, 0, 1, 1,
-0.5090527, 0.3628013, 0.1610485, 0, 0, 0, 1, 1,
-0.5046368, 0.7431245, -1.056848, 0, 0, 0, 1, 1,
-0.503828, -1.361948, -2.778606, 0, 0, 0, 1, 1,
-0.5029709, -0.128748, -3.439876, 0, 0, 0, 1, 1,
-0.5022717, -0.9974875, -2.772041, 0, 0, 0, 1, 1,
-0.5018492, 0.2907906, 0.7727241, 0, 0, 0, 1, 1,
-0.5014656, -0.1451575, -1.022628, 0, 0, 0, 1, 1,
-0.5004724, -2.36793, -4.525544, 1, 1, 1, 1, 1,
-0.499889, 0.4334016, -0.0297455, 1, 1, 1, 1, 1,
-0.4987327, 0.08156152, -2.190084, 1, 1, 1, 1, 1,
-0.4925203, -1.394365, -2.355147, 1, 1, 1, 1, 1,
-0.4881834, 0.7745361, -1.398957, 1, 1, 1, 1, 1,
-0.4860341, 0.09088427, -0.2531602, 1, 1, 1, 1, 1,
-0.4853282, -0.1342543, -2.928561, 1, 1, 1, 1, 1,
-0.4809283, 0.1363647, -0.3006793, 1, 1, 1, 1, 1,
-0.4788775, 1.014687, -0.6950836, 1, 1, 1, 1, 1,
-0.4772899, 1.343255, -0.7723279, 1, 1, 1, 1, 1,
-0.4761517, -1.026249, -4.878127, 1, 1, 1, 1, 1,
-0.4666478, -1.212024, -2.002352, 1, 1, 1, 1, 1,
-0.4632659, 1.40458, -0.1755011, 1, 1, 1, 1, 1,
-0.4630882, 0.130295, -0.3165766, 1, 1, 1, 1, 1,
-0.4627881, -0.4206179, -2.343078, 1, 1, 1, 1, 1,
-0.4613898, 0.3828533, -1.759413, 0, 0, 1, 1, 1,
-0.4611076, -1.372827, -1.597787, 1, 0, 0, 1, 1,
-0.4586175, -0.937675, -2.298526, 1, 0, 0, 1, 1,
-0.4558854, -0.5863463, -0.8312328, 1, 0, 0, 1, 1,
-0.4542205, -0.2821953, -1.904815, 1, 0, 0, 1, 1,
-0.4526753, -0.5946871, -3.410167, 1, 0, 0, 1, 1,
-0.4524002, 0.347271, -1.175574, 0, 0, 0, 1, 1,
-0.4522485, 1.744027, 0.4547193, 0, 0, 0, 1, 1,
-0.4516855, 0.1870243, -1.269574, 0, 0, 0, 1, 1,
-0.4515906, -0.1449062, -1.912786, 0, 0, 0, 1, 1,
-0.4503116, -1.81453, -1.69116, 0, 0, 0, 1, 1,
-0.4497758, 0.9608942, -2.410414, 0, 0, 0, 1, 1,
-0.4491549, 1.002773, -0.1000337, 0, 0, 0, 1, 1,
-0.4466259, 1.426685, -2.008061, 1, 1, 1, 1, 1,
-0.4446379, 1.408144, -0.43468, 1, 1, 1, 1, 1,
-0.4443344, 0.6565576, -1.09617, 1, 1, 1, 1, 1,
-0.4342977, -1.000385, -2.745514, 1, 1, 1, 1, 1,
-0.4332529, -0.05657867, -1.070522, 1, 1, 1, 1, 1,
-0.4310323, 1.072173, 1.857493, 1, 1, 1, 1, 1,
-0.4262277, -2.643085, -1.964341, 1, 1, 1, 1, 1,
-0.4259798, 0.9869721, -0.3156365, 1, 1, 1, 1, 1,
-0.4246614, -0.4106534, -2.276489, 1, 1, 1, 1, 1,
-0.4224298, 0.7766967, 0.7003124, 1, 1, 1, 1, 1,
-0.4213262, 0.6323698, -0.9246485, 1, 1, 1, 1, 1,
-0.4191824, 1.210929, -0.05805565, 1, 1, 1, 1, 1,
-0.4180539, -1.124308, -1.852933, 1, 1, 1, 1, 1,
-0.4170601, -0.1727934, -2.4211, 1, 1, 1, 1, 1,
-0.4170558, -0.05940608, -1.665848, 1, 1, 1, 1, 1,
-0.4148889, 0.5136711, -1.673298, 0, 0, 1, 1, 1,
-0.4143366, 1.786958, -0.6792734, 1, 0, 0, 1, 1,
-0.4123063, 0.89038, -0.09035396, 1, 0, 0, 1, 1,
-0.4088707, -1.219245, -2.211384, 1, 0, 0, 1, 1,
-0.4085911, -0.6114939, -2.756455, 1, 0, 0, 1, 1,
-0.4065486, -0.2698256, -2.490931, 1, 0, 0, 1, 1,
-0.4062029, -2.154314, -1.499962, 0, 0, 0, 1, 1,
-0.4059612, -0.8206091, -2.87668, 0, 0, 0, 1, 1,
-0.403183, -0.2390153, -2.079123, 0, 0, 0, 1, 1,
-0.3989598, -0.4182813, -4.615432, 0, 0, 0, 1, 1,
-0.3890117, -0.1713042, -0.8027918, 0, 0, 0, 1, 1,
-0.3856778, 0.22257, -0.2889465, 0, 0, 0, 1, 1,
-0.3773541, 1.293697, -0.4294195, 0, 0, 0, 1, 1,
-0.3756439, 0.8122527, -0.7336934, 1, 1, 1, 1, 1,
-0.3746889, -0.3655435, -2.549731, 1, 1, 1, 1, 1,
-0.3745193, 0.6965289, -0.06161587, 1, 1, 1, 1, 1,
-0.3714682, 0.1065982, -1.408587, 1, 1, 1, 1, 1,
-0.370964, -0.4030887, -3.112556, 1, 1, 1, 1, 1,
-0.3670684, 0.02550136, 0.2128364, 1, 1, 1, 1, 1,
-0.3660756, 0.6639609, -0.5336449, 1, 1, 1, 1, 1,
-0.3635786, -0.9190478, -2.184023, 1, 1, 1, 1, 1,
-0.3628981, -0.4550698, -2.315377, 1, 1, 1, 1, 1,
-0.3601117, -0.2975325, -2.871344, 1, 1, 1, 1, 1,
-0.3599076, -0.1814106, -0.5967982, 1, 1, 1, 1, 1,
-0.3597275, -0.06329117, -0.202027, 1, 1, 1, 1, 1,
-0.3577215, 1.214579, -2.089865, 1, 1, 1, 1, 1,
-0.3553119, -0.6928171, -4.674664, 1, 1, 1, 1, 1,
-0.3542714, -0.08963994, -2.871828, 1, 1, 1, 1, 1,
-0.3540845, 0.5841663, 0.01066378, 0, 0, 1, 1, 1,
-0.3515155, -0.173032, -5.077391, 1, 0, 0, 1, 1,
-0.350186, -1.616797, -3.90988, 1, 0, 0, 1, 1,
-0.3444473, -0.04595313, -1.797336, 1, 0, 0, 1, 1,
-0.3443294, 0.2174502, -1.857284, 1, 0, 0, 1, 1,
-0.3381535, 0.5346015, 0.08604263, 1, 0, 0, 1, 1,
-0.3346212, -1.254045, -3.574032, 0, 0, 0, 1, 1,
-0.3339425, -0.1248747, -1.154269, 0, 0, 0, 1, 1,
-0.3336122, 0.002977333, -1.145698, 0, 0, 0, 1, 1,
-0.3331442, -0.5314855, -2.008163, 0, 0, 0, 1, 1,
-0.3281561, 0.2554613, -2.17283, 0, 0, 0, 1, 1,
-0.3260845, -2.008673, -3.405325, 0, 0, 0, 1, 1,
-0.3260003, -0.2244568, -3.127241, 0, 0, 0, 1, 1,
-0.3238031, 0.8740689, 1.235126, 1, 1, 1, 1, 1,
-0.322628, 0.6482111, 0.3359352, 1, 1, 1, 1, 1,
-0.3222722, -0.7585489, -2.17343, 1, 1, 1, 1, 1,
-0.3197577, 0.2223273, 0.02521343, 1, 1, 1, 1, 1,
-0.3170655, -0.1362378, -2.28023, 1, 1, 1, 1, 1,
-0.3148284, 1.427796, -0.5925951, 1, 1, 1, 1, 1,
-0.3085985, 0.6013622, -1.130741, 1, 1, 1, 1, 1,
-0.3081894, -1.820526, -2.651505, 1, 1, 1, 1, 1,
-0.3056574, 0.2835199, -0.4090602, 1, 1, 1, 1, 1,
-0.2999077, 0.8097582, 0.7591941, 1, 1, 1, 1, 1,
-0.298083, -0.7543055, -1.939919, 1, 1, 1, 1, 1,
-0.2971021, 0.8847623, 0.4845814, 1, 1, 1, 1, 1,
-0.2970388, 0.6908748, -2.045891, 1, 1, 1, 1, 1,
-0.2950594, 0.1330751, 0.4419731, 1, 1, 1, 1, 1,
-0.2928249, -1.039052, -1.634388, 1, 1, 1, 1, 1,
-0.2924167, 0.3107661, -0.7805582, 0, 0, 1, 1, 1,
-0.2924085, 0.2813489, -0.0575458, 1, 0, 0, 1, 1,
-0.285891, -0.8427828, -1.559253, 1, 0, 0, 1, 1,
-0.2852881, -0.2423629, -3.36909, 1, 0, 0, 1, 1,
-0.28452, -0.1804383, -2.246025, 1, 0, 0, 1, 1,
-0.2815876, 0.618822, 0.5908232, 1, 0, 0, 1, 1,
-0.2796163, -0.9287896, -2.240767, 0, 0, 0, 1, 1,
-0.2790633, 0.4946955, 0.4251529, 0, 0, 0, 1, 1,
-0.278721, -0.5716284, -0.4132792, 0, 0, 0, 1, 1,
-0.2787015, 0.08500733, -1.728813, 0, 0, 0, 1, 1,
-0.2746095, -0.3344598, -2.095902, 0, 0, 0, 1, 1,
-0.2727476, -0.3262536, -2.631602, 0, 0, 0, 1, 1,
-0.2650818, -2.858242, -2.109269, 0, 0, 0, 1, 1,
-0.2620074, -0.1895351, -2.21342, 1, 1, 1, 1, 1,
-0.2587636, 0.189336, 0.6884897, 1, 1, 1, 1, 1,
-0.2546693, 0.6323941, -1.596077, 1, 1, 1, 1, 1,
-0.2476387, -0.2729947, -2.374878, 1, 1, 1, 1, 1,
-0.2474468, 0.400008, 0.2991292, 1, 1, 1, 1, 1,
-0.2474139, 0.4848354, -1.617461, 1, 1, 1, 1, 1,
-0.2429205, -1.048022, -2.161781, 1, 1, 1, 1, 1,
-0.2417776, -0.04123357, 0.3794554, 1, 1, 1, 1, 1,
-0.2415965, 0.5904601, -0.1567608, 1, 1, 1, 1, 1,
-0.2407622, -0.08197673, -0.7699426, 1, 1, 1, 1, 1,
-0.2407597, -1.852673, -2.623861, 1, 1, 1, 1, 1,
-0.2382612, 0.2203688, 0.3002962, 1, 1, 1, 1, 1,
-0.236885, 0.07180965, -1.50478, 1, 1, 1, 1, 1,
-0.2361566, -0.6723989, -2.81314, 1, 1, 1, 1, 1,
-0.2351595, -0.9574111, -1.904382, 1, 1, 1, 1, 1,
-0.2348081, -1.077888, -1.965042, 0, 0, 1, 1, 1,
-0.2342277, -1.650476, -4.589499, 1, 0, 0, 1, 1,
-0.2327458, 0.5685179, -1.785478, 1, 0, 0, 1, 1,
-0.2301, -0.2620676, -1.901228, 1, 0, 0, 1, 1,
-0.2283361, 0.6946261, -0.02113569, 1, 0, 0, 1, 1,
-0.2276593, 1.010235, 1.557081, 1, 0, 0, 1, 1,
-0.2271018, 1.091529, 0.7942937, 0, 0, 0, 1, 1,
-0.2261841, -0.5185404, -3.321083, 0, 0, 0, 1, 1,
-0.2259005, 1.856985, 0.3838929, 0, 0, 0, 1, 1,
-0.2238962, -0.1894638, -2.741936, 0, 0, 0, 1, 1,
-0.2008599, -0.5220225, -3.258784, 0, 0, 0, 1, 1,
-0.1993137, 0.08573285, -0.8490676, 0, 0, 0, 1, 1,
-0.1949557, 1.411993, 1.49828, 0, 0, 0, 1, 1,
-0.1924745, 1.036436, -0.01047487, 1, 1, 1, 1, 1,
-0.1886847, 0.8935195, -0.5275216, 1, 1, 1, 1, 1,
-0.1882568, 0.904326, 0.9036236, 1, 1, 1, 1, 1,
-0.1848743, 0.4928795, -0.02690352, 1, 1, 1, 1, 1,
-0.1836333, 1.736536, -0.09006994, 1, 1, 1, 1, 1,
-0.1690246, 0.09454937, -0.9622951, 1, 1, 1, 1, 1,
-0.1640667, -0.5877866, -3.766442, 1, 1, 1, 1, 1,
-0.1536061, 0.4667906, 0.4804772, 1, 1, 1, 1, 1,
-0.1533786, 1.237796, -0.05801848, 1, 1, 1, 1, 1,
-0.1501392, 0.9468684, 0.6316372, 1, 1, 1, 1, 1,
-0.1409145, -0.08923148, -0.7556684, 1, 1, 1, 1, 1,
-0.140764, 3.117186, -0.1456567, 1, 1, 1, 1, 1,
-0.1393813, -2.202888, -3.586285, 1, 1, 1, 1, 1,
-0.1322153, 0.260444, -1.135376, 1, 1, 1, 1, 1,
-0.1232614, 1.363477, -0.3228533, 1, 1, 1, 1, 1,
-0.1214347, 3.034906, -1.89376, 0, 0, 1, 1, 1,
-0.1202071, 0.2746451, -1.328254, 1, 0, 0, 1, 1,
-0.1134653, -0.6259139, -4.224719, 1, 0, 0, 1, 1,
-0.1107652, 1.32056, -0.1332701, 1, 0, 0, 1, 1,
-0.1081233, 0.6144722, 0.6403516, 1, 0, 0, 1, 1,
-0.1056638, 0.8172678, -0.3812611, 1, 0, 0, 1, 1,
-0.1003746, 0.5308603, -1.51174, 0, 0, 0, 1, 1,
-0.0996315, 1.023665, -0.9196901, 0, 0, 0, 1, 1,
-0.09263115, 1.166244, 0.3695011, 0, 0, 0, 1, 1,
-0.09002902, 0.6738874, -0.2133002, 0, 0, 0, 1, 1,
-0.08954445, -0.8190362, -3.46648, 0, 0, 0, 1, 1,
-0.08653705, 1.093675, 2.081622, 0, 0, 0, 1, 1,
-0.08598033, 2.003926, -0.6693688, 0, 0, 0, 1, 1,
-0.07826874, -0.2345051, -2.694099, 1, 1, 1, 1, 1,
-0.07470532, -0.349646, -3.724595, 1, 1, 1, 1, 1,
-0.07423564, -0.6235052, -3.147964, 1, 1, 1, 1, 1,
-0.07314203, -0.3325831, 0.9011092, 1, 1, 1, 1, 1,
-0.0656902, -1.239006, -2.845036, 1, 1, 1, 1, 1,
-0.06189117, -0.8118253, -2.89629, 1, 1, 1, 1, 1,
-0.06085276, -0.8800657, -2.711025, 1, 1, 1, 1, 1,
-0.0570394, 0.613591, -0.5399626, 1, 1, 1, 1, 1,
-0.05626335, 0.8621768, 0.7907265, 1, 1, 1, 1, 1,
-0.05272215, -1.147053, -2.258677, 1, 1, 1, 1, 1,
-0.04939095, 0.2934476, -0.8905905, 1, 1, 1, 1, 1,
-0.04387092, 0.63088, 1.163406, 1, 1, 1, 1, 1,
-0.04342407, -1.487651, -1.312326, 1, 1, 1, 1, 1,
-0.03965067, 1.715479, 0.7374021, 1, 1, 1, 1, 1,
-0.03952838, 0.02029824, -0.3179337, 1, 1, 1, 1, 1,
-0.03742388, -0.8758834, -2.04059, 0, 0, 1, 1, 1,
-0.03241821, 0.7234245, 1.708503, 1, 0, 0, 1, 1,
-0.02487477, -0.2258009, -3.987918, 1, 0, 0, 1, 1,
-0.0227561, -2.261451, -2.235919, 1, 0, 0, 1, 1,
-0.02075671, -1.524565, -3.889825, 1, 0, 0, 1, 1,
-0.01879669, -0.6354948, -2.043923, 1, 0, 0, 1, 1,
-0.01647349, 1.685639, -1.045249, 0, 0, 0, 1, 1,
-0.01633549, -1.409276, -1.889504, 0, 0, 0, 1, 1,
-0.01452348, -1.049455, -4.281611, 0, 0, 0, 1, 1,
-0.01314679, -0.08741673, -3.696527, 0, 0, 0, 1, 1,
-0.01314246, -1.631692, -2.225701, 0, 0, 0, 1, 1,
-0.01185691, 0.3939876, -0.6036796, 0, 0, 0, 1, 1,
-0.006304042, -1.215114, -3.961797, 0, 0, 0, 1, 1,
-0.005571151, -1.228204, -3.008127, 1, 1, 1, 1, 1,
-0.005288373, 0.6923221, 1.292981, 1, 1, 1, 1, 1,
-0.003108084, -0.1180921, -3.054485, 1, 1, 1, 1, 1,
-0.001167774, -0.4318175, -1.984604, 1, 1, 1, 1, 1,
0.001491743, 0.9180109, -0.7175965, 1, 1, 1, 1, 1,
0.003161435, -0.8095684, 2.209467, 1, 1, 1, 1, 1,
0.004117914, -0.6663845, 1.464597, 1, 1, 1, 1, 1,
0.008650555, 0.9582723, 0.1216268, 1, 1, 1, 1, 1,
0.008861098, 0.698683, 0.87442, 1, 1, 1, 1, 1,
0.00963503, -0.6300406, 4.13637, 1, 1, 1, 1, 1,
0.01552108, -0.6469148, 3.266722, 1, 1, 1, 1, 1,
0.01563078, -0.8907887, 2.269657, 1, 1, 1, 1, 1,
0.02110345, -0.7395816, 1.46892, 1, 1, 1, 1, 1,
0.02170551, 0.2865156, 0.1894766, 1, 1, 1, 1, 1,
0.02283497, 0.3591368, 1.748035, 1, 1, 1, 1, 1,
0.02678914, 0.5329095, -0.8374975, 0, 0, 1, 1, 1,
0.03053432, 0.5514694, -1.290589, 1, 0, 0, 1, 1,
0.04168698, 1.685486, -1.413466, 1, 0, 0, 1, 1,
0.04298371, 0.364602, -0.2969389, 1, 0, 0, 1, 1,
0.0446702, 1.046152, 0.07840671, 1, 0, 0, 1, 1,
0.05130831, 0.2049042, 0.7697631, 1, 0, 0, 1, 1,
0.05559305, 0.2788953, -0.8992657, 0, 0, 0, 1, 1,
0.05780741, -0.9773837, 2.722302, 0, 0, 0, 1, 1,
0.05800368, -0.5471451, 4.006302, 0, 0, 0, 1, 1,
0.05809205, 1.415345, -1.45664, 0, 0, 0, 1, 1,
0.05916074, -1.462871, 2.447781, 0, 0, 0, 1, 1,
0.06321037, 0.1675024, 0.9370642, 0, 0, 0, 1, 1,
0.06876273, -0.1938978, 1.978047, 0, 0, 0, 1, 1,
0.06941812, 0.4718809, 0.9652299, 1, 1, 1, 1, 1,
0.07176804, 1.151508, 0.5134027, 1, 1, 1, 1, 1,
0.07759465, -1.588424, 4.666037, 1, 1, 1, 1, 1,
0.07831571, -2.273275, 0.09499716, 1, 1, 1, 1, 1,
0.08064431, 1.775267, -1.362667, 1, 1, 1, 1, 1,
0.08082269, -0.7323595, 2.717958, 1, 1, 1, 1, 1,
0.08121865, 0.6610367, -1.271069, 1, 1, 1, 1, 1,
0.08300306, -0.6599123, 1.684355, 1, 1, 1, 1, 1,
0.08458276, -1.753644, 2.524297, 1, 1, 1, 1, 1,
0.08507481, -1.521921, 2.304604, 1, 1, 1, 1, 1,
0.08899767, 1.685646, -0.401547, 1, 1, 1, 1, 1,
0.09334078, -0.1752468, 1.55084, 1, 1, 1, 1, 1,
0.1005631, 0.4445744, 1.67263, 1, 1, 1, 1, 1,
0.1008457, 0.4736182, -1.064546, 1, 1, 1, 1, 1,
0.1009582, -1.21245, 2.725027, 1, 1, 1, 1, 1,
0.1011196, -0.2416954, 3.057992, 0, 0, 1, 1, 1,
0.1026293, -2.64661, 2.401283, 1, 0, 0, 1, 1,
0.1053159, -0.6542672, 2.425146, 1, 0, 0, 1, 1,
0.1060686, -0.4523017, 3.914235, 1, 0, 0, 1, 1,
0.1087947, -0.2451801, 3.319788, 1, 0, 0, 1, 1,
0.1094825, 1.221643, -0.6171077, 1, 0, 0, 1, 1,
0.1105454, 2.010097, 0.7608333, 0, 0, 0, 1, 1,
0.1112308, -0.1823215, 4.936108, 0, 0, 0, 1, 1,
0.1144576, 0.3789504, 1.749055, 0, 0, 0, 1, 1,
0.1162977, 0.5678558, -1.426331, 0, 0, 0, 1, 1,
0.1185613, -0.4026536, 3.766675, 0, 0, 0, 1, 1,
0.1229886, -0.4657689, 2.730474, 0, 0, 0, 1, 1,
0.1336443, -0.1867518, 4.259089, 0, 0, 0, 1, 1,
0.1358232, -1.435927, 2.637895, 1, 1, 1, 1, 1,
0.1372461, 0.2435696, 1.136593, 1, 1, 1, 1, 1,
0.1372706, 0.1549106, 1.129357, 1, 1, 1, 1, 1,
0.1387749, -2.093898, 3.606877, 1, 1, 1, 1, 1,
0.1387815, -0.2107608, 3.775114, 1, 1, 1, 1, 1,
0.138922, 0.6519306, 0.1475065, 1, 1, 1, 1, 1,
0.1394611, 1.055603, 0.9769302, 1, 1, 1, 1, 1,
0.1396483, -1.782912, 2.548066, 1, 1, 1, 1, 1,
0.1457202, -0.2486617, 2.364272, 1, 1, 1, 1, 1,
0.1483256, -0.5217803, 2.734614, 1, 1, 1, 1, 1,
0.1486651, -0.2565732, 2.76756, 1, 1, 1, 1, 1,
0.1570807, -0.7036274, 1.145585, 1, 1, 1, 1, 1,
0.1572838, 0.5275956, -0.03324845, 1, 1, 1, 1, 1,
0.1573894, 0.4012113, 1.096425, 1, 1, 1, 1, 1,
0.157663, -1.269924, 2.724523, 1, 1, 1, 1, 1,
0.1608643, -1.19643, 3.041729, 0, 0, 1, 1, 1,
0.1613117, -0.5661503, 3.609221, 1, 0, 0, 1, 1,
0.1622874, -0.2137778, 3.578716, 1, 0, 0, 1, 1,
0.162505, 0.1074162, 0.8923795, 1, 0, 0, 1, 1,
0.1661672, -0.5197945, 2.455762, 1, 0, 0, 1, 1,
0.1695234, -0.01560205, 3.350353, 1, 0, 0, 1, 1,
0.1801021, -0.07238493, 2.861979, 0, 0, 0, 1, 1,
0.1805177, -1.265327, 2.002073, 0, 0, 0, 1, 1,
0.1814859, 0.7563413, 1.364357, 0, 0, 0, 1, 1,
0.1814962, 0.9594741, -0.4201832, 0, 0, 0, 1, 1,
0.1836443, -0.4592906, 2.31112, 0, 0, 0, 1, 1,
0.1884572, 0.9341733, 0.2959412, 0, 0, 0, 1, 1,
0.1892193, 0.8219293, -1.133078, 0, 0, 0, 1, 1,
0.1893947, -1.653495, 3.161873, 1, 1, 1, 1, 1,
0.1908707, 0.06913324, 2.630108, 1, 1, 1, 1, 1,
0.1935373, -0.3477275, 2.919611, 1, 1, 1, 1, 1,
0.1958559, -1.409767, 2.382844, 1, 1, 1, 1, 1,
0.1965791, 0.7718483, 1.358703, 1, 1, 1, 1, 1,
0.1977332, -0.3214811, 2.528934, 1, 1, 1, 1, 1,
0.197845, -0.2736121, 2.286, 1, 1, 1, 1, 1,
0.2014632, -0.8796359, 3.565848, 1, 1, 1, 1, 1,
0.2019736, -0.3680784, 2.289582, 1, 1, 1, 1, 1,
0.2045019, -0.02329989, 2.244273, 1, 1, 1, 1, 1,
0.209562, 1.048191, 1.217225, 1, 1, 1, 1, 1,
0.2145985, -0.05752096, 0.910005, 1, 1, 1, 1, 1,
0.2213653, 0.206107, 1.193285, 1, 1, 1, 1, 1,
0.2216182, 0.619916, 0.7087942, 1, 1, 1, 1, 1,
0.2238686, 0.3015699, 0.7267884, 1, 1, 1, 1, 1,
0.2242061, -0.4847885, 3.415775, 0, 0, 1, 1, 1,
0.2290471, -0.2773393, 3.36152, 1, 0, 0, 1, 1,
0.2305837, 0.7404653, -0.7419929, 1, 0, 0, 1, 1,
0.2316935, -0.2631378, 2.884162, 1, 0, 0, 1, 1,
0.2340946, -0.5900934, 2.810015, 1, 0, 0, 1, 1,
0.2367611, -1.152428, 1.396616, 1, 0, 0, 1, 1,
0.2379626, 0.3717314, 0.8079753, 0, 0, 0, 1, 1,
0.2385851, -1.536944, 3.209226, 0, 0, 0, 1, 1,
0.2430091, 0.8452163, 0.2937171, 0, 0, 0, 1, 1,
0.2443378, 0.3491302, -0.2363671, 0, 0, 0, 1, 1,
0.2470039, 1.853608, -0.6253516, 0, 0, 0, 1, 1,
0.2497596, -1.038411, 1.6288, 0, 0, 0, 1, 1,
0.2523007, 1.028094, -0.597085, 0, 0, 0, 1, 1,
0.2549525, 0.4827473, -0.263887, 1, 1, 1, 1, 1,
0.2560768, -1.267077, 3.024158, 1, 1, 1, 1, 1,
0.2581718, -1.645241, 3.029217, 1, 1, 1, 1, 1,
0.2621768, -1.016177, 1.13956, 1, 1, 1, 1, 1,
0.2651624, -0.001125224, 2.982288, 1, 1, 1, 1, 1,
0.2686788, 0.6457929, -0.09417183, 1, 1, 1, 1, 1,
0.2733177, -1.235663, 2.77107, 1, 1, 1, 1, 1,
0.2736179, -0.5473428, 1.263798, 1, 1, 1, 1, 1,
0.2738751, 0.9326932, 0.02216776, 1, 1, 1, 1, 1,
0.2744398, 1.440328, -0.9868707, 1, 1, 1, 1, 1,
0.2749261, -0.5461531, 5.160858, 1, 1, 1, 1, 1,
0.275971, -0.4234113, 2.743223, 1, 1, 1, 1, 1,
0.2785396, -0.09761956, 1.393636, 1, 1, 1, 1, 1,
0.2788459, -0.879882, 3.359868, 1, 1, 1, 1, 1,
0.2833706, -0.8814227, 4.702485, 1, 1, 1, 1, 1,
0.2936556, -0.939653, 2.784797, 0, 0, 1, 1, 1,
0.3030081, -0.08568083, 1.150928, 1, 0, 0, 1, 1,
0.3045272, 1.357698, 0.5636832, 1, 0, 0, 1, 1,
0.3135806, -0.6329035, 0.6933593, 1, 0, 0, 1, 1,
0.3149298, -0.0587814, 0.5787588, 1, 0, 0, 1, 1,
0.3156478, -0.8086976, 2.013618, 1, 0, 0, 1, 1,
0.3166054, 0.4431757, 0.08187339, 0, 0, 0, 1, 1,
0.3190654, 1.052368, -0.1531842, 0, 0, 0, 1, 1,
0.3263644, -0.3121389, 2.67465, 0, 0, 0, 1, 1,
0.3293564, -0.8829143, 3.861917, 0, 0, 0, 1, 1,
0.3310364, 1.32614, 1.351168, 0, 0, 0, 1, 1,
0.3311899, 0.4102397, 1.984591, 0, 0, 0, 1, 1,
0.3312914, 1.099746, -0.6921775, 0, 0, 0, 1, 1,
0.3313315, 0.4593388, 1.110885, 1, 1, 1, 1, 1,
0.3368725, 0.4563041, 1.614055, 1, 1, 1, 1, 1,
0.3387472, 0.01685282, 1.701981, 1, 1, 1, 1, 1,
0.3398508, -1.341816, 3.280871, 1, 1, 1, 1, 1,
0.3458669, -0.3224561, 3.278988, 1, 1, 1, 1, 1,
0.3480149, -0.3381444, 2.605047, 1, 1, 1, 1, 1,
0.3529492, 0.02129258, 0.4868277, 1, 1, 1, 1, 1,
0.3552963, 0.5616916, -0.2295589, 1, 1, 1, 1, 1,
0.3559713, -1.044943, 2.580717, 1, 1, 1, 1, 1,
0.359324, 0.181123, -0.362568, 1, 1, 1, 1, 1,
0.362331, -1.455194, 1.68099, 1, 1, 1, 1, 1,
0.3643184, 0.5350561, 1.724591, 1, 1, 1, 1, 1,
0.3656054, -0.02301238, 1.629666, 1, 1, 1, 1, 1,
0.3666238, 0.4413176, -0.01730119, 1, 1, 1, 1, 1,
0.3735423, 1.184434, -1.230438, 1, 1, 1, 1, 1,
0.3815443, 0.603272, 2.327641, 0, 0, 1, 1, 1,
0.381977, 1.275047, 1.595775, 1, 0, 0, 1, 1,
0.3843726, -0.1183927, 1.683784, 1, 0, 0, 1, 1,
0.3884916, 0.03085773, 1.048752, 1, 0, 0, 1, 1,
0.388616, -1.186937, 2.22671, 1, 0, 0, 1, 1,
0.3908604, -0.4333696, 3.456078, 1, 0, 0, 1, 1,
0.393139, 0.4483334, 0.9287275, 0, 0, 0, 1, 1,
0.4000134, 0.5484836, 0.5935625, 0, 0, 0, 1, 1,
0.4029696, -1.716844, 0.03497862, 0, 0, 0, 1, 1,
0.4052086, -0.7744451, 2.514075, 0, 0, 0, 1, 1,
0.4185265, -0.1895905, 1.378984, 0, 0, 0, 1, 1,
0.4197267, -0.7608536, 4.204366, 0, 0, 0, 1, 1,
0.4220228, 0.01027258, 1.41195, 0, 0, 0, 1, 1,
0.4233493, 0.5869974, -0.6112739, 1, 1, 1, 1, 1,
0.4250954, -0.0977071, 2.2206, 1, 1, 1, 1, 1,
0.4286805, -0.61616, 2.716675, 1, 1, 1, 1, 1,
0.4330131, 0.7231834, 0.710546, 1, 1, 1, 1, 1,
0.4454491, -0.04255914, 2.302422, 1, 1, 1, 1, 1,
0.4515633, -0.3607355, 2.92618, 1, 1, 1, 1, 1,
0.4535847, -0.6634451, 3.766146, 1, 1, 1, 1, 1,
0.4541481, -0.09501737, 1.659191, 1, 1, 1, 1, 1,
0.4565604, -0.6383193, 0.9208452, 1, 1, 1, 1, 1,
0.4685635, 1.070264, 0.03766727, 1, 1, 1, 1, 1,
0.4691746, 0.4166036, 0.4216686, 1, 1, 1, 1, 1,
0.4755443, 1.299286, -0.05454205, 1, 1, 1, 1, 1,
0.479457, -0.2974342, 1.562088, 1, 1, 1, 1, 1,
0.4806594, 0.1134578, 2.410282, 1, 1, 1, 1, 1,
0.4876163, 0.6973253, 1.209434, 1, 1, 1, 1, 1,
0.4925446, -0.5939463, 3.562405, 0, 0, 1, 1, 1,
0.495463, 0.3683494, 1.526412, 1, 0, 0, 1, 1,
0.4964786, 1.27004, -2.524683, 1, 0, 0, 1, 1,
0.5019344, -0.0793834, 1.549761, 1, 0, 0, 1, 1,
0.5026687, 0.7393408, 0.9344082, 1, 0, 0, 1, 1,
0.5036588, -1.729825, 3.409808, 1, 0, 0, 1, 1,
0.5043254, -0.4096317, 2.594535, 0, 0, 0, 1, 1,
0.506623, 1.220627, -0.1424515, 0, 0, 0, 1, 1,
0.5073735, 0.1682789, 1.2079, 0, 0, 0, 1, 1,
0.5123388, -1.555422, 2.138854, 0, 0, 0, 1, 1,
0.5136552, -1.229599, 2.413717, 0, 0, 0, 1, 1,
0.5148291, -0.7217102, 2.589489, 0, 0, 0, 1, 1,
0.5173382, -0.5391409, 1.345093, 0, 0, 0, 1, 1,
0.5184716, -0.1607136, 2.025454, 1, 1, 1, 1, 1,
0.5219684, -1.717719, 3.599249, 1, 1, 1, 1, 1,
0.5229403, -0.1530822, 0.3090641, 1, 1, 1, 1, 1,
0.523385, 0.6151815, 0.1058955, 1, 1, 1, 1, 1,
0.5256005, -1.317675, 2.143844, 1, 1, 1, 1, 1,
0.5256499, 0.1617862, 2.469451, 1, 1, 1, 1, 1,
0.5322821, -0.7508619, 0.8635089, 1, 1, 1, 1, 1,
0.5324193, 1.390693, -0.3032269, 1, 1, 1, 1, 1,
0.5333732, 0.06381948, 2.868458, 1, 1, 1, 1, 1,
0.535548, 1.43879, -0.3513614, 1, 1, 1, 1, 1,
0.5374591, -0.06333448, 1.899968, 1, 1, 1, 1, 1,
0.539944, -0.2425879, 2.663291, 1, 1, 1, 1, 1,
0.5411608, 1.602554, 1.240767, 1, 1, 1, 1, 1,
0.5437743, -0.04160134, 3.124731, 1, 1, 1, 1, 1,
0.5467703, -0.258111, 1.650302, 1, 1, 1, 1, 1,
0.5501736, 0.006584032, 2.039274, 0, 0, 1, 1, 1,
0.5502834, -1.403524, 3.206537, 1, 0, 0, 1, 1,
0.5560843, 0.09917285, 0.6515315, 1, 0, 0, 1, 1,
0.55787, 0.591995, -0.9823031, 1, 0, 0, 1, 1,
0.5752332, 0.148188, 0.991583, 1, 0, 0, 1, 1,
0.5760889, -1.399275, 2.590138, 1, 0, 0, 1, 1,
0.5761758, 0.2279637, 1.16653, 0, 0, 0, 1, 1,
0.5789968, -0.7619811, 2.006005, 0, 0, 0, 1, 1,
0.5819129, -0.1023749, 0.6044087, 0, 0, 0, 1, 1,
0.5824377, 1.555802, 0.2300464, 0, 0, 0, 1, 1,
0.5869055, 1.647904, 0.5471159, 0, 0, 0, 1, 1,
0.5885317, 0.700676, 0.8425728, 0, 0, 0, 1, 1,
0.591541, -0.5739709, 2.124475, 0, 0, 0, 1, 1,
0.5927426, 1.3414, 1.542693, 1, 1, 1, 1, 1,
0.5937015, -0.6009147, 0.8236317, 1, 1, 1, 1, 1,
0.5985079, 0.3096684, 0.7796459, 1, 1, 1, 1, 1,
0.6018024, -1.224113, 2.042296, 1, 1, 1, 1, 1,
0.6099346, -1.208737, 2.277179, 1, 1, 1, 1, 1,
0.611148, -0.701943, 1.840222, 1, 1, 1, 1, 1,
0.6121505, -0.07701768, 0.9841537, 1, 1, 1, 1, 1,
0.6144003, -0.9595753, 3.09038, 1, 1, 1, 1, 1,
0.6175797, -0.8210756, 1.566932, 1, 1, 1, 1, 1,
0.618247, -1.606869, 1.866135, 1, 1, 1, 1, 1,
0.6210248, 0.8568382, 1.931262, 1, 1, 1, 1, 1,
0.6273968, 1.277153, 0.399556, 1, 1, 1, 1, 1,
0.6293848, -0.268563, 0.3152082, 1, 1, 1, 1, 1,
0.6303267, -0.6749732, 2.140213, 1, 1, 1, 1, 1,
0.6343396, -0.4769399, 1.177899, 1, 1, 1, 1, 1,
0.6359915, -0.2700208, 2.062264, 0, 0, 1, 1, 1,
0.6400819, -0.3888724, 3.509675, 1, 0, 0, 1, 1,
0.6420312, 0.2121652, 2.073688, 1, 0, 0, 1, 1,
0.6456262, -1.690625, 3.76903, 1, 0, 0, 1, 1,
0.6463534, -0.94787, 4.095273, 1, 0, 0, 1, 1,
0.6522707, -0.301808, 2.280612, 1, 0, 0, 1, 1,
0.6560201, 0.9605619, -0.3822699, 0, 0, 0, 1, 1,
0.6594945, 0.6385944, -1.159571, 0, 0, 0, 1, 1,
0.6619303, 0.09909578, 1.906408, 0, 0, 0, 1, 1,
0.663062, -0.5412359, 1.990974, 0, 0, 0, 1, 1,
0.6671358, -0.4563651, 2.650836, 0, 0, 0, 1, 1,
0.6685823, -0.6715099, 3.263905, 0, 0, 0, 1, 1,
0.6689028, 2.181741, 1.424497, 0, 0, 0, 1, 1,
0.6754068, 0.634262, 0.9382191, 1, 1, 1, 1, 1,
0.6777758, -0.5695941, 1.396499, 1, 1, 1, 1, 1,
0.6910813, -0.5027046, 1.639471, 1, 1, 1, 1, 1,
0.6931882, 0.9259028, 0.9603313, 1, 1, 1, 1, 1,
0.6940023, 1.02918, 0.914405, 1, 1, 1, 1, 1,
0.6965844, -0.2041303, 2.1958, 1, 1, 1, 1, 1,
0.6977924, -0.8820851, 0.7575924, 1, 1, 1, 1, 1,
0.698893, 1.036749, 0.2276621, 1, 1, 1, 1, 1,
0.7009575, 0.1961523, 2.215895, 1, 1, 1, 1, 1,
0.7089164, -0.08147648, 0.5638226, 1, 1, 1, 1, 1,
0.7109871, 1.305621, 1.942372, 1, 1, 1, 1, 1,
0.7136081, -0.1456767, 1.90573, 1, 1, 1, 1, 1,
0.7194473, -1.615468, 1.944962, 1, 1, 1, 1, 1,
0.7211923, -2.036598, 4.485804, 1, 1, 1, 1, 1,
0.7328465, -0.09414649, 1.28003, 1, 1, 1, 1, 1,
0.737869, -1.115767, 3.87498, 0, 0, 1, 1, 1,
0.7442322, -1.647027, 2.383584, 1, 0, 0, 1, 1,
0.7479854, -0.02063044, 0.4512019, 1, 0, 0, 1, 1,
0.7556096, 1.171088, 3.395164, 1, 0, 0, 1, 1,
0.7663455, -0.6966434, 3.233287, 1, 0, 0, 1, 1,
0.7866029, -0.6756366, 2.794715, 1, 0, 0, 1, 1,
0.7883, -0.714803, 0.3929975, 0, 0, 0, 1, 1,
0.7893925, 0.4789419, 0.7284667, 0, 0, 0, 1, 1,
0.7898306, -0.3070947, 1.589352, 0, 0, 0, 1, 1,
0.7909468, 0.9932088, 1.76826, 0, 0, 0, 1, 1,
0.7984879, 0.157371, 1.308266, 0, 0, 0, 1, 1,
0.802883, -0.8205053, 2.268949, 0, 0, 0, 1, 1,
0.8069529, 0.875366, -0.4692204, 0, 0, 0, 1, 1,
0.809415, -0.7628416, 3.146783, 1, 1, 1, 1, 1,
0.8123217, 0.8657406, 0.2212345, 1, 1, 1, 1, 1,
0.8152285, 0.5375735, 0.2630188, 1, 1, 1, 1, 1,
0.8157421, -0.4179639, 0.2949011, 1, 1, 1, 1, 1,
0.8164093, 1.494875, -0.1233624, 1, 1, 1, 1, 1,
0.8189498, 1.183747, 0.8560669, 1, 1, 1, 1, 1,
0.8263568, -0.07675035, 1.320938, 1, 1, 1, 1, 1,
0.8318019, -2.116034, 1.661695, 1, 1, 1, 1, 1,
0.8330503, 0.5680383, 0.5170633, 1, 1, 1, 1, 1,
0.8385127, -1.39945, 3.852976, 1, 1, 1, 1, 1,
0.8422784, -1.731079, 2.511793, 1, 1, 1, 1, 1,
0.8432536, -0.8572384, 2.732597, 1, 1, 1, 1, 1,
0.8469543, 1.38675, 2.385333, 1, 1, 1, 1, 1,
0.8472928, 0.2140889, 2.413536, 1, 1, 1, 1, 1,
0.8477668, 0.8532454, 0.5116302, 1, 1, 1, 1, 1,
0.849532, -1.855312, 2.204827, 0, 0, 1, 1, 1,
0.8517966, -0.1596858, 0.5169392, 1, 0, 0, 1, 1,
0.8545054, 1.705219, 2.516489, 1, 0, 0, 1, 1,
0.8551564, -1.160681, 3.128788, 1, 0, 0, 1, 1,
0.8607045, 0.3192073, -0.6810597, 1, 0, 0, 1, 1,
0.861639, -1.17081, 2.21593, 1, 0, 0, 1, 1,
0.8650405, 0.6091985, -0.04339661, 0, 0, 0, 1, 1,
0.866321, 0.3389129, 0.5980788, 0, 0, 0, 1, 1,
0.8710555, -0.3318087, 0.9840136, 0, 0, 0, 1, 1,
0.8744606, -0.08397356, 0.04778855, 0, 0, 0, 1, 1,
0.8804942, -0.1743669, 2.646218, 0, 0, 0, 1, 1,
0.8826901, -0.7220647, 4.268785, 0, 0, 0, 1, 1,
0.8911312, -0.204294, 1.458187, 0, 0, 0, 1, 1,
0.8938175, 2.095089, -0.05082889, 1, 1, 1, 1, 1,
0.896944, 0.8720996, -0.5474396, 1, 1, 1, 1, 1,
0.8987021, 1.670144, 1.901475, 1, 1, 1, 1, 1,
0.9010293, 0.6642615, -0.5681235, 1, 1, 1, 1, 1,
0.9029357, 0.807356, 0.7397026, 1, 1, 1, 1, 1,
0.9034101, -1.031783, 2.245884, 1, 1, 1, 1, 1,
0.9044564, -1.26326, 3.95595, 1, 1, 1, 1, 1,
0.9064873, 0.8984368, -0.7005033, 1, 1, 1, 1, 1,
0.9184269, 0.7960717, 0.2947933, 1, 1, 1, 1, 1,
0.9187751, -1.666614, 5.617076, 1, 1, 1, 1, 1,
0.9280013, 1.304675, 0.346342, 1, 1, 1, 1, 1,
0.9288424, 0.4592097, 1.119819, 1, 1, 1, 1, 1,
0.9410794, 0.1080724, 0.8259706, 1, 1, 1, 1, 1,
0.9459741, -1.832912, 0.6584402, 1, 1, 1, 1, 1,
0.946637, 0.1446015, 0.4897207, 1, 1, 1, 1, 1,
0.9534844, 0.5994078, 0.9156269, 0, 0, 1, 1, 1,
0.9542376, 0.7447367, 1.944625, 1, 0, 0, 1, 1,
0.9575117, -2.259683, 2.144878, 1, 0, 0, 1, 1,
0.9580951, -0.4024209, 2.446008, 1, 0, 0, 1, 1,
0.9650419, -0.05868506, 1.32429, 1, 0, 0, 1, 1,
0.9686219, -1.092847, 2.877928, 1, 0, 0, 1, 1,
0.9698746, 0.09006565, 1.112117, 0, 0, 0, 1, 1,
0.972874, -2.246483, 3.518587, 0, 0, 0, 1, 1,
0.9768378, 0.131444, 0.8340882, 0, 0, 0, 1, 1,
0.9777738, 0.06394473, 2.501416, 0, 0, 0, 1, 1,
0.9834061, -0.5622368, 2.433448, 0, 0, 0, 1, 1,
0.9924271, -0.7873777, 2.05574, 0, 0, 0, 1, 1,
0.9970479, -0.9891549, 3.052173, 0, 0, 0, 1, 1,
0.9983742, -1.751156, 2.928082, 1, 1, 1, 1, 1,
1.000373, 1.561323, -0.297117, 1, 1, 1, 1, 1,
1.007053, 0.471035, 1.042213, 1, 1, 1, 1, 1,
1.012911, 1.146957, -0.2558253, 1, 1, 1, 1, 1,
1.016085, -0.3007666, 0.7980462, 1, 1, 1, 1, 1,
1.016382, -1.382049, 2.320089, 1, 1, 1, 1, 1,
1.016577, 0.9524025, -0.09231861, 1, 1, 1, 1, 1,
1.020551, -1.815467, 1.850688, 1, 1, 1, 1, 1,
1.02666, -0.946318, 2.448106, 1, 1, 1, 1, 1,
1.026848, 0.03482611, 0.278881, 1, 1, 1, 1, 1,
1.029128, -0.02186215, 1.210719, 1, 1, 1, 1, 1,
1.035796, 0.2182625, 0.4479159, 1, 1, 1, 1, 1,
1.057593, 0.0005759575, 0.1960805, 1, 1, 1, 1, 1,
1.060192, -0.5330326, -0.848387, 1, 1, 1, 1, 1,
1.060975, -0.1496091, 1.689194, 1, 1, 1, 1, 1,
1.069619, -1.609052, 1.476321, 0, 0, 1, 1, 1,
1.072809, -0.08181018, 0.7530832, 1, 0, 0, 1, 1,
1.07554, -0.02209369, 4.139146, 1, 0, 0, 1, 1,
1.079367, 1.164128, 2.242643, 1, 0, 0, 1, 1,
1.081904, 0.79268, 2.044745, 1, 0, 0, 1, 1,
1.083891, -0.6631104, 2.907943, 1, 0, 0, 1, 1,
1.091518, -1.444807, 0.8284923, 0, 0, 0, 1, 1,
1.091605, -1.283876, 2.712814, 0, 0, 0, 1, 1,
1.105061, 0.3676901, 0.6850963, 0, 0, 0, 1, 1,
1.108081, 1.651326, 1.442932, 0, 0, 0, 1, 1,
1.109149, -0.2537898, 1.859114, 0, 0, 0, 1, 1,
1.112386, -0.4234967, 2.374676, 0, 0, 0, 1, 1,
1.113945, 0.08411027, 0.8294457, 0, 0, 0, 1, 1,
1.114511, 0.5884656, 1.937257, 1, 1, 1, 1, 1,
1.11479, 1.475384, 1.121739, 1, 1, 1, 1, 1,
1.115655, -0.2747533, 0.1358864, 1, 1, 1, 1, 1,
1.12012, 0.7233259, 1.785193, 1, 1, 1, 1, 1,
1.125701, 0.9525438, 1.263421, 1, 1, 1, 1, 1,
1.12777, 0.5232651, 1.451535, 1, 1, 1, 1, 1,
1.129944, -1.006426, 2.910684, 1, 1, 1, 1, 1,
1.138186, 0.2782646, 1.788649, 1, 1, 1, 1, 1,
1.142438, 0.2630913, 0.971375, 1, 1, 1, 1, 1,
1.144391, 1.302361, 0.5564109, 1, 1, 1, 1, 1,
1.144777, -1.531224, 2.240778, 1, 1, 1, 1, 1,
1.15164, 0.2967099, -0.1110201, 1, 1, 1, 1, 1,
1.155196, -0.6743905, 1.469188, 1, 1, 1, 1, 1,
1.156048, 1.271334, -0.9743061, 1, 1, 1, 1, 1,
1.157769, 0.9822009, 0.4963635, 1, 1, 1, 1, 1,
1.161758, 0.1396341, 3.319749, 0, 0, 1, 1, 1,
1.165493, 0.6816423, 0.08306708, 1, 0, 0, 1, 1,
1.175208, 0.6852226, 0.9399024, 1, 0, 0, 1, 1,
1.181691, -1.347201, 3.965727, 1, 0, 0, 1, 1,
1.194517, 1.065052, 1.970572, 1, 0, 0, 1, 1,
1.204098, -0.7361761, 3.990295, 1, 0, 0, 1, 1,
1.210381, 0.8941256, 0.2119638, 0, 0, 0, 1, 1,
1.221567, 0.3803714, -0.1754991, 0, 0, 0, 1, 1,
1.22162, -0.6902824, 2.817804, 0, 0, 0, 1, 1,
1.224683, -1.358268, 3.694165, 0, 0, 0, 1, 1,
1.224915, -2.915957, 3.693208, 0, 0, 0, 1, 1,
1.229596, 0.6888738, 1.615133, 0, 0, 0, 1, 1,
1.230019, -1.358947, 3.132437, 0, 0, 0, 1, 1,
1.24003, 0.4202691, 1.812379, 1, 1, 1, 1, 1,
1.244049, -0.4319388, 3.226742, 1, 1, 1, 1, 1,
1.247758, -0.3674262, 1.649615, 1, 1, 1, 1, 1,
1.250991, -0.1972729, 2.23884, 1, 1, 1, 1, 1,
1.258777, -0.3958349, 1.412732, 1, 1, 1, 1, 1,
1.260047, 0.9528951, 1.709652, 1, 1, 1, 1, 1,
1.26265, 0.8279727, 1.6788, 1, 1, 1, 1, 1,
1.266751, -0.5397937, 1.25194, 1, 1, 1, 1, 1,
1.267956, 2.153359, -0.5374576, 1, 1, 1, 1, 1,
1.269977, 0.06117275, 1.436764, 1, 1, 1, 1, 1,
1.272323, 0.9220352, 0.8108213, 1, 1, 1, 1, 1,
1.279971, -0.2764077, -0.8924447, 1, 1, 1, 1, 1,
1.279979, -2.673397, 2.328686, 1, 1, 1, 1, 1,
1.28099, 0.8270946, 0.5593234, 1, 1, 1, 1, 1,
1.282709, -0.8090658, 1.864137, 1, 1, 1, 1, 1,
1.286549, 2.068414, 1.602798, 0, 0, 1, 1, 1,
1.28912, -1.865173, 3.380713, 1, 0, 0, 1, 1,
1.290515, -0.2559952, 2.151498, 1, 0, 0, 1, 1,
1.300164, 1.993079, 1.933926, 1, 0, 0, 1, 1,
1.306134, 1.930539, 2.226329, 1, 0, 0, 1, 1,
1.321677, 1.538517, -0.4211756, 1, 0, 0, 1, 1,
1.327699, -1.173984, 3.101313, 0, 0, 0, 1, 1,
1.330654, -1.194044, 2.771303, 0, 0, 0, 1, 1,
1.332489, 0.7750344, 0.09191696, 0, 0, 0, 1, 1,
1.334702, 0.5492219, 2.101356, 0, 0, 0, 1, 1,
1.340553, -0.5567608, 0.2493515, 0, 0, 0, 1, 1,
1.346642, -1.273615, 2.257711, 0, 0, 0, 1, 1,
1.347208, -0.8886419, 2.286035, 0, 0, 0, 1, 1,
1.349695, 0.3815938, 0.2288749, 1, 1, 1, 1, 1,
1.355884, 1.066401, 2.161657, 1, 1, 1, 1, 1,
1.356116, 0.5182424, 1.555689, 1, 1, 1, 1, 1,
1.366802, -0.02231104, 0.9322672, 1, 1, 1, 1, 1,
1.388507, 1.404661, -0.39989, 1, 1, 1, 1, 1,
1.398472, -0.1494157, 2.788424, 1, 1, 1, 1, 1,
1.399518, 0.4727441, 1.703249, 1, 1, 1, 1, 1,
1.401451, 0.1166077, 2.319531, 1, 1, 1, 1, 1,
1.406604, -0.0458868, 1.328796, 1, 1, 1, 1, 1,
1.417797, 0.8300579, 0.01989961, 1, 1, 1, 1, 1,
1.436395, -0.8044404, 2.81718, 1, 1, 1, 1, 1,
1.444004, -0.2594446, 1.347877, 1, 1, 1, 1, 1,
1.447783, 0.6907381, 1.676327, 1, 1, 1, 1, 1,
1.458863, 1.662847, -0.1725392, 1, 1, 1, 1, 1,
1.464195, 0.1580205, -0.05927755, 1, 1, 1, 1, 1,
1.465285, -0.302845, 2.403996, 0, 0, 1, 1, 1,
1.469243, -0.3577547, 2.52745, 1, 0, 0, 1, 1,
1.482044, 0.4346925, 1.670756, 1, 0, 0, 1, 1,
1.511646, 0.7773208, 0.2362748, 1, 0, 0, 1, 1,
1.523259, 0.9540137, 3.431805, 1, 0, 0, 1, 1,
1.543051, 0.96056, 1.352455, 1, 0, 0, 1, 1,
1.54396, -0.1531757, 1.956234, 0, 0, 0, 1, 1,
1.572489, 1.018729, 1.752915, 0, 0, 0, 1, 1,
1.574353, 0.6101003, 2.12337, 0, 0, 0, 1, 1,
1.586126, -0.2987472, 1.883885, 0, 0, 0, 1, 1,
1.587742, 1.873908, 0.7711322, 0, 0, 0, 1, 1,
1.61079, -0.1331927, 1.643351, 0, 0, 0, 1, 1,
1.64988, -0.5576882, 0.7195535, 0, 0, 0, 1, 1,
1.665505, 0.03007808, 1.618498, 1, 1, 1, 1, 1,
1.673717, -1.672008, 0.9944181, 1, 1, 1, 1, 1,
1.679507, 0.8579807, 1.29095, 1, 1, 1, 1, 1,
1.69909, -1.599032, 3.453497, 1, 1, 1, 1, 1,
1.704674, 0.0211814, 1.854427, 1, 1, 1, 1, 1,
1.711751, -0.4482825, 2.358816, 1, 1, 1, 1, 1,
1.734615, -0.8450925, 2.631251, 1, 1, 1, 1, 1,
1.742777, -0.7538873, 1.345751, 1, 1, 1, 1, 1,
1.748364, -0.6605707, 3.750602, 1, 1, 1, 1, 1,
1.751072, 1.606147, -0.9805123, 1, 1, 1, 1, 1,
1.752002, -0.189846, 2.926251, 1, 1, 1, 1, 1,
1.763652, 0.7658144, 0.5638208, 1, 1, 1, 1, 1,
1.770209, -0.046755, 1.40394, 1, 1, 1, 1, 1,
1.803838, -0.1890882, 1.926095, 1, 1, 1, 1, 1,
1.807073, 0.2795047, 1.042858, 1, 1, 1, 1, 1,
1.832707, 0.4609009, 1.253702, 0, 0, 1, 1, 1,
1.846062, -0.7088288, 1.830105, 1, 0, 0, 1, 1,
1.84998, -5.583506e-05, 2.705835, 1, 0, 0, 1, 1,
1.851151, 0.8207758, 0.8845943, 1, 0, 0, 1, 1,
1.856346, -0.1041517, 2.679063, 1, 0, 0, 1, 1,
1.871638, -0.3046981, 0.7385578, 1, 0, 0, 1, 1,
1.880173, 0.701076, 1.579625, 0, 0, 0, 1, 1,
1.885362, 1.621158, 1.207161, 0, 0, 0, 1, 1,
1.889364, 0.6101235, 2.079339, 0, 0, 0, 1, 1,
1.890412, 0.6902804, 1.038059, 0, 0, 0, 1, 1,
1.892115, 1.3737, 2.439451, 0, 0, 0, 1, 1,
1.899266, 0.9397215, 0.9122899, 0, 0, 0, 1, 1,
1.906402, 0.3180683, 2.80982, 0, 0, 0, 1, 1,
1.934602, -0.6862789, -0.6140566, 1, 1, 1, 1, 1,
1.940202, 1.068462, 0.2098887, 1, 1, 1, 1, 1,
1.956642, -1.106392, 2.838733, 1, 1, 1, 1, 1,
1.976981, 0.1537687, 0.9383288, 1, 1, 1, 1, 1,
1.978285, 0.3795966, -0.3203526, 1, 1, 1, 1, 1,
2.021731, -0.01012036, 3.150653, 1, 1, 1, 1, 1,
2.045544, 1.326652, 1.522369, 1, 1, 1, 1, 1,
2.052573, 0.08853963, 1.105649, 1, 1, 1, 1, 1,
2.079008, 0.05085859, 2.372292, 1, 1, 1, 1, 1,
2.092313, 0.3938726, 1.184975, 1, 1, 1, 1, 1,
2.097949, 0.05020695, 2.574337, 1, 1, 1, 1, 1,
2.127337, -0.09399197, 1.089398, 1, 1, 1, 1, 1,
2.223822, -1.060948, 0.607577, 1, 1, 1, 1, 1,
2.229096, -0.346202, 2.77107, 1, 1, 1, 1, 1,
2.243274, -1.627627, 1.205232, 1, 1, 1, 1, 1,
2.288995, -0.4775985, 1.342854, 0, 0, 1, 1, 1,
2.298314, 0.3191213, -0.5404187, 1, 0, 0, 1, 1,
2.299359, 0.6760129, 0.8389841, 1, 0, 0, 1, 1,
2.302796, 0.1861708, 1.81693, 1, 0, 0, 1, 1,
2.305274, 0.475244, 1.809038, 1, 0, 0, 1, 1,
2.315135, -0.03556788, 0.8627281, 1, 0, 0, 1, 1,
2.315265, 0.5964621, 2.361544, 0, 0, 0, 1, 1,
2.348823, 1.415021, 1.245582, 0, 0, 0, 1, 1,
2.361875, -0.9591798, 3.046373, 0, 0, 0, 1, 1,
2.387516, -0.7596448, 3.891596, 0, 0, 0, 1, 1,
2.447512, -0.2079294, 0.7975767, 0, 0, 0, 1, 1,
2.498165, 0.8033271, 0.9733952, 0, 0, 0, 1, 1,
2.516996, 1.147965, 3.363172, 0, 0, 0, 1, 1,
2.51809, -0.02014684, 2.795502, 1, 1, 1, 1, 1,
2.549171, 1.335403, 1.587489, 1, 1, 1, 1, 1,
2.769825, -0.8733398, 0.7042289, 1, 1, 1, 1, 1,
2.904705, 0.7083976, 1.610181, 1, 1, 1, 1, 1,
2.97392, 1.470145, 2.730889, 1, 1, 1, 1, 1,
2.974116, -0.6788146, 3.461676, 1, 1, 1, 1, 1,
3.099829, 1.415573, 2.569736, 1, 1, 1, 1, 1
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
var radius = 9.545341;
var distance = 33.52761;
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
mvMatrix.translate( 0.01531792, 0.1347127, -0.2698424 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.52761);
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
