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
-3.044547, -1.394238, -0.9218938, 1, 0, 0, 1,
-3.000845, -1.56464, -2.619779, 1, 0.007843138, 0, 1,
-2.942999, 1.085152, -1.487166, 1, 0.01176471, 0, 1,
-2.774491, -0.1216069, -1.337597, 1, 0.01960784, 0, 1,
-2.735, 0.9827329, 0.1570818, 1, 0.02352941, 0, 1,
-2.592852, 0.1696914, -0.9897588, 1, 0.03137255, 0, 1,
-2.578913, 0.7267509, -2.248861, 1, 0.03529412, 0, 1,
-2.515325, 0.2479937, -2.29331, 1, 0.04313726, 0, 1,
-2.504614, -0.5221519, -2.356316, 1, 0.04705882, 0, 1,
-2.482366, 0.2545828, -0.8823493, 1, 0.05490196, 0, 1,
-2.417412, 1.83463, -0.06636167, 1, 0.05882353, 0, 1,
-2.40061, -0.5253821, -0.5240132, 1, 0.06666667, 0, 1,
-2.341687, -1.439036, -1.404388, 1, 0.07058824, 0, 1,
-2.319861, -0.7191029, -2.220729, 1, 0.07843138, 0, 1,
-2.224965, -2.172858, -2.032504, 1, 0.08235294, 0, 1,
-2.192163, 1.818416, -0.2931321, 1, 0.09019608, 0, 1,
-2.18001, -0.5151815, -1.168265, 1, 0.09411765, 0, 1,
-2.156262, 1.410877, -0.7055637, 1, 0.1019608, 0, 1,
-2.130175, 0.8467125, -1.462164, 1, 0.1098039, 0, 1,
-2.082292, 1.283843, -2.035953, 1, 0.1137255, 0, 1,
-2.071015, 0.3870741, -1.856569, 1, 0.1215686, 0, 1,
-2.062095, 0.6785478, -2.525467, 1, 0.1254902, 0, 1,
-2.046072, -0.9350904, -3.937073, 1, 0.1333333, 0, 1,
-2.011947, 0.4493924, -0.851013, 1, 0.1372549, 0, 1,
-2.008609, 0.1058853, -1.087685, 1, 0.145098, 0, 1,
-2.002024, -0.6835292, 0.4876486, 1, 0.1490196, 0, 1,
-1.985757, -1.580529, -0.78919, 1, 0.1568628, 0, 1,
-1.937373, 0.198863, -1.488973, 1, 0.1607843, 0, 1,
-1.924124, -0.5510851, -0.6940545, 1, 0.1686275, 0, 1,
-1.917238, 0.06475812, -2.40579, 1, 0.172549, 0, 1,
-1.916884, 0.3825036, -1.243126, 1, 0.1803922, 0, 1,
-1.912715, 0.5756177, -1.510547, 1, 0.1843137, 0, 1,
-1.892973, 2.099617, -0.8706052, 1, 0.1921569, 0, 1,
-1.884079, -0.8180559, -0.0401432, 1, 0.1960784, 0, 1,
-1.878885, 2.307502, -0.7516425, 1, 0.2039216, 0, 1,
-1.863608, -0.298038, -0.8929083, 1, 0.2117647, 0, 1,
-1.857306, -0.1387824, -1.06602, 1, 0.2156863, 0, 1,
-1.824344, -0.527616, -1.830944, 1, 0.2235294, 0, 1,
-1.807453, 1.775249, -0.718739, 1, 0.227451, 0, 1,
-1.761874, 0.2630586, -1.975977, 1, 0.2352941, 0, 1,
-1.754535, 0.6199993, 0.3143316, 1, 0.2392157, 0, 1,
-1.75177, 1.020866, -1.141629, 1, 0.2470588, 0, 1,
-1.743351, 1.986094, -1.078538, 1, 0.2509804, 0, 1,
-1.730644, -1.097856, -3.121422, 1, 0.2588235, 0, 1,
-1.719604, 1.161161, -0.3515587, 1, 0.2627451, 0, 1,
-1.7181, -1.414506, -1.197796, 1, 0.2705882, 0, 1,
-1.713457, 0.9040651, -1.639781, 1, 0.2745098, 0, 1,
-1.708064, 0.1569136, -2.165564, 1, 0.282353, 0, 1,
-1.68552, -1.655707, -1.030725, 1, 0.2862745, 0, 1,
-1.669978, 0.5402817, -1.065203, 1, 0.2941177, 0, 1,
-1.654638, -1.270576, -3.50709, 1, 0.3019608, 0, 1,
-1.65295, -0.5401521, -0.4156806, 1, 0.3058824, 0, 1,
-1.640845, -0.346152, -1.236455, 1, 0.3137255, 0, 1,
-1.606106, -1.809058, -3.515984, 1, 0.3176471, 0, 1,
-1.603234, 1.263485, -1.751735, 1, 0.3254902, 0, 1,
-1.585487, -0.1152581, -3.459944, 1, 0.3294118, 0, 1,
-1.580636, -1.523484, -1.390145, 1, 0.3372549, 0, 1,
-1.564172, 1.081642, -0.762958, 1, 0.3411765, 0, 1,
-1.561884, 0.884211, -0.926832, 1, 0.3490196, 0, 1,
-1.56156, -1.022461, -1.543398, 1, 0.3529412, 0, 1,
-1.561448, 0.2224643, -1.713944, 1, 0.3607843, 0, 1,
-1.54312, -0.5420669, -1.177071, 1, 0.3647059, 0, 1,
-1.540362, 0.5249969, -2.017762, 1, 0.372549, 0, 1,
-1.534522, -0.1706157, -1.935495, 1, 0.3764706, 0, 1,
-1.53195, -1.041793, -2.35059, 1, 0.3843137, 0, 1,
-1.524976, -0.9283708, -2.396177, 1, 0.3882353, 0, 1,
-1.515107, -1.773142, -6.364003, 1, 0.3960784, 0, 1,
-1.511858, -0.4072049, -2.692711, 1, 0.4039216, 0, 1,
-1.509367, -1.343202, -1.243399, 1, 0.4078431, 0, 1,
-1.509255, 0.4005051, -2.19147, 1, 0.4156863, 0, 1,
-1.494637, 0.339116, -3.282717, 1, 0.4196078, 0, 1,
-1.49247, 1.101986, -0.1947347, 1, 0.427451, 0, 1,
-1.482785, 0.4413571, -2.495327, 1, 0.4313726, 0, 1,
-1.482142, 0.6451959, -1.343357, 1, 0.4392157, 0, 1,
-1.481812, 1.712314, -0.3887781, 1, 0.4431373, 0, 1,
-1.478013, 0.1136668, -0.5790227, 1, 0.4509804, 0, 1,
-1.477241, -1.221213, -2.723946, 1, 0.454902, 0, 1,
-1.469056, -0.714669, -1.562226, 1, 0.4627451, 0, 1,
-1.465055, -0.1120239, -3.424823, 1, 0.4666667, 0, 1,
-1.44525, -1.641006, -3.199872, 1, 0.4745098, 0, 1,
-1.438565, -0.8823066, -1.692584, 1, 0.4784314, 0, 1,
-1.434745, -1.218514, -2.153015, 1, 0.4862745, 0, 1,
-1.431896, 0.1765982, -1.573647, 1, 0.4901961, 0, 1,
-1.423287, 0.9612097, -3.105363, 1, 0.4980392, 0, 1,
-1.418318, -0.5863547, -1.908801, 1, 0.5058824, 0, 1,
-1.410753, 0.7371797, -0.2107123, 1, 0.509804, 0, 1,
-1.409631, 0.2937322, -1.610453, 1, 0.5176471, 0, 1,
-1.403242, -2.106912, -1.826279, 1, 0.5215687, 0, 1,
-1.384102, 0.527961, 0.5225732, 1, 0.5294118, 0, 1,
-1.38182, 0.008306421, -0.2248425, 1, 0.5333334, 0, 1,
-1.369663, -0.269402, -1.51578, 1, 0.5411765, 0, 1,
-1.367058, 0.03346351, -1.875682, 1, 0.5450981, 0, 1,
-1.354016, -0.3556113, -1.704412, 1, 0.5529412, 0, 1,
-1.345783, -0.4967702, -1.331863, 1, 0.5568628, 0, 1,
-1.336814, -1.868811, -2.954199, 1, 0.5647059, 0, 1,
-1.330508, -0.4357927, -1.851394, 1, 0.5686275, 0, 1,
-1.319081, 0.2389117, -2.513998, 1, 0.5764706, 0, 1,
-1.310114, -0.4985816, -1.976719, 1, 0.5803922, 0, 1,
-1.307702, -0.08691756, -3.208639, 1, 0.5882353, 0, 1,
-1.306084, 1.279604, -0.4595535, 1, 0.5921569, 0, 1,
-1.292713, -0.7485963, -0.1356255, 1, 0.6, 0, 1,
-1.284259, -0.1179138, -2.590842, 1, 0.6078432, 0, 1,
-1.283336, 0.4952872, -0.006761846, 1, 0.6117647, 0, 1,
-1.276987, 0.3292001, -0.2922691, 1, 0.6196079, 0, 1,
-1.271872, -0.4977904, -2.907347, 1, 0.6235294, 0, 1,
-1.267796, -1.490724, -2.316656, 1, 0.6313726, 0, 1,
-1.26735, -0.1323774, -2.199124, 1, 0.6352941, 0, 1,
-1.261946, -1.877825, -2.543033, 1, 0.6431373, 0, 1,
-1.261551, -0.2425302, -2.28105, 1, 0.6470588, 0, 1,
-1.254847, 0.1727028, -1.144265, 1, 0.654902, 0, 1,
-1.249237, -0.4435019, -1.896541, 1, 0.6588235, 0, 1,
-1.246469, 0.1830297, -2.282821, 1, 0.6666667, 0, 1,
-1.238071, 2.356061, 0.1644045, 1, 0.6705883, 0, 1,
-1.226781, -0.02996978, -1.81979, 1, 0.6784314, 0, 1,
-1.221795, -0.4423899, -1.634084, 1, 0.682353, 0, 1,
-1.219105, 0.973045, -2.006623, 1, 0.6901961, 0, 1,
-1.215917, 0.01307324, -1.520236, 1, 0.6941177, 0, 1,
-1.214922, -0.6404179, -2.241025, 1, 0.7019608, 0, 1,
-1.212617, 0.2204644, -0.7118763, 1, 0.7098039, 0, 1,
-1.207703, 0.1969468, -1.858926, 1, 0.7137255, 0, 1,
-1.206243, 0.5092133, -1.099287, 1, 0.7215686, 0, 1,
-1.200752, -0.7784767, -2.634288, 1, 0.7254902, 0, 1,
-1.197245, -1.055744, -4.293157, 1, 0.7333333, 0, 1,
-1.194634, -1.343148, -1.590892, 1, 0.7372549, 0, 1,
-1.191599, -1.353636, -1.693352, 1, 0.7450981, 0, 1,
-1.191337, 0.720013, -1.709665, 1, 0.7490196, 0, 1,
-1.189215, 0.5573052, -0.3431305, 1, 0.7568628, 0, 1,
-1.184322, -1.747776, -1.942178, 1, 0.7607843, 0, 1,
-1.180221, 0.05666132, 0.5781909, 1, 0.7686275, 0, 1,
-1.156223, 0.2834857, -0.8058513, 1, 0.772549, 0, 1,
-1.154615, -0.4790871, -3.4247, 1, 0.7803922, 0, 1,
-1.149161, -1.735548, -1.308635, 1, 0.7843137, 0, 1,
-1.149133, -1.956142, -2.785223, 1, 0.7921569, 0, 1,
-1.145928, -1.728739, -1.777382, 1, 0.7960784, 0, 1,
-1.142615, -0.6617795, -2.282105, 1, 0.8039216, 0, 1,
-1.1417, -0.02742172, -1.784065, 1, 0.8117647, 0, 1,
-1.133993, -0.4250127, -1.470965, 1, 0.8156863, 0, 1,
-1.132349, -1.428016, -0.7717733, 1, 0.8235294, 0, 1,
-1.120742, 0.9527432, -0.9540489, 1, 0.827451, 0, 1,
-1.12021, 1.299928, -0.3433585, 1, 0.8352941, 0, 1,
-1.107683, -0.1561829, -3.831708, 1, 0.8392157, 0, 1,
-1.103773, -0.8408673, -1.748369, 1, 0.8470588, 0, 1,
-1.101985, 1.140442, 0.7534544, 1, 0.8509804, 0, 1,
-1.093155, -1.388383, -2.814557, 1, 0.8588235, 0, 1,
-1.08896, -1.270607, -2.281441, 1, 0.8627451, 0, 1,
-1.083038, 0.2090177, -0.3130433, 1, 0.8705882, 0, 1,
-1.082738, -0.5424903, -2.09808, 1, 0.8745098, 0, 1,
-1.077923, -0.05624003, -1.419535, 1, 0.8823529, 0, 1,
-1.074546, 0.9791756, -1.612024, 1, 0.8862745, 0, 1,
-1.067522, 1.333058, -1.419743, 1, 0.8941177, 0, 1,
-1.067492, 1.308681, -0.2116692, 1, 0.8980392, 0, 1,
-1.063783, -1.434469, -3.320274, 1, 0.9058824, 0, 1,
-1.063514, 0.9181385, -1.495197, 1, 0.9137255, 0, 1,
-1.058578, -0.4970787, -1.817701, 1, 0.9176471, 0, 1,
-1.057167, 0.184313, -0.7401664, 1, 0.9254902, 0, 1,
-1.050805, -1.043939, -2.479203, 1, 0.9294118, 0, 1,
-1.037501, 1.290216, 0.1758186, 1, 0.9372549, 0, 1,
-1.028699, -0.5689389, -2.355053, 1, 0.9411765, 0, 1,
-1.021976, -0.3805894, -2.159864, 1, 0.9490196, 0, 1,
-1.015126, -1.577307, -4.442356, 1, 0.9529412, 0, 1,
-1.009862, -0.3774549, -3.356391, 1, 0.9607843, 0, 1,
-1.005184, -0.6944932, -3.978904, 1, 0.9647059, 0, 1,
-1.002775, 0.7122195, -0.3909789, 1, 0.972549, 0, 1,
-0.9959562, -0.8449968, -1.941213, 1, 0.9764706, 0, 1,
-0.9906934, -2.102532, -2.330298, 1, 0.9843137, 0, 1,
-0.9847394, -0.1511658, -1.41243, 1, 0.9882353, 0, 1,
-0.9814948, -1.208332, -0.1118098, 1, 0.9960784, 0, 1,
-0.9749756, -0.3013129, -2.680003, 0.9960784, 1, 0, 1,
-0.9736899, 2.035037, -1.853851, 0.9921569, 1, 0, 1,
-0.9723699, -0.4015051, -3.43561, 0.9843137, 1, 0, 1,
-0.9625334, 1.824722, -2.104486, 0.9803922, 1, 0, 1,
-0.9621019, -0.3525597, -3.031518, 0.972549, 1, 0, 1,
-0.946653, -1.363457, -1.801236, 0.9686275, 1, 0, 1,
-0.9434307, -0.8407292, -1.864139, 0.9607843, 1, 0, 1,
-0.9369667, -0.5627978, -2.001276, 0.9568627, 1, 0, 1,
-0.9334849, 1.180114, -2.082361, 0.9490196, 1, 0, 1,
-0.9327138, -0.4817685, -1.542384, 0.945098, 1, 0, 1,
-0.9311084, -0.5044639, -1.482219, 0.9372549, 1, 0, 1,
-0.923969, 0.1488492, -0.3428877, 0.9333333, 1, 0, 1,
-0.9229181, -0.66, -2.506264, 0.9254902, 1, 0, 1,
-0.9192514, -0.7176318, -3.382562, 0.9215686, 1, 0, 1,
-0.9191927, 0.117509, -1.369576, 0.9137255, 1, 0, 1,
-0.9173667, -1.153737, -1.803598, 0.9098039, 1, 0, 1,
-0.9171922, 0.4395119, -0.7441428, 0.9019608, 1, 0, 1,
-0.9143813, -0.4345672, -3.388799, 0.8941177, 1, 0, 1,
-0.909719, 1.728352, -1.728456, 0.8901961, 1, 0, 1,
-0.9079964, 1.911207, 1.249972, 0.8823529, 1, 0, 1,
-0.9002164, -1.761202, -4.715061, 0.8784314, 1, 0, 1,
-0.8953163, -0.8448871, -3.126778, 0.8705882, 1, 0, 1,
-0.8938673, -0.557502, -1.303133, 0.8666667, 1, 0, 1,
-0.8910042, 0.2586398, -2.259358, 0.8588235, 1, 0, 1,
-0.8903475, -0.1738649, -0.8104086, 0.854902, 1, 0, 1,
-0.881727, 0.3172126, -1.886268, 0.8470588, 1, 0, 1,
-0.8797749, -1.338658, -2.590131, 0.8431373, 1, 0, 1,
-0.8780121, -0.007331098, -0.3177089, 0.8352941, 1, 0, 1,
-0.8678195, -0.5575312, -0.8446078, 0.8313726, 1, 0, 1,
-0.8662393, 1.457926, -1.859607, 0.8235294, 1, 0, 1,
-0.8613129, 0.1975519, -2.871632, 0.8196079, 1, 0, 1,
-0.8597385, 0.4201208, 0.4605327, 0.8117647, 1, 0, 1,
-0.8570533, 1.181229, 0.08687967, 0.8078431, 1, 0, 1,
-0.8500157, -1.08744, -1.227522, 0.8, 1, 0, 1,
-0.8439404, 0.7991433, -1.569613, 0.7921569, 1, 0, 1,
-0.8310801, -1.271546, -4.05761, 0.7882353, 1, 0, 1,
-0.8255702, 0.3991211, -1.991732, 0.7803922, 1, 0, 1,
-0.8216409, -0.1811741, -2.49121, 0.7764706, 1, 0, 1,
-0.8198364, 0.9608775, -0.3321812, 0.7686275, 1, 0, 1,
-0.8183787, -0.06059155, -2.388791, 0.7647059, 1, 0, 1,
-0.8162749, -0.1051817, -0.4251529, 0.7568628, 1, 0, 1,
-0.8120406, 0.08915351, -0.5868044, 0.7529412, 1, 0, 1,
-0.8109516, 0.455476, -1.486828, 0.7450981, 1, 0, 1,
-0.8102413, -0.1344146, -3.287625, 0.7411765, 1, 0, 1,
-0.8047608, 0.1337219, 0.692153, 0.7333333, 1, 0, 1,
-0.8028187, -0.2022737, -1.148492, 0.7294118, 1, 0, 1,
-0.8027216, -0.1895767, -3.20914, 0.7215686, 1, 0, 1,
-0.8014053, -0.3617859, -2.303257, 0.7176471, 1, 0, 1,
-0.7972768, -0.5919075, -0.9628925, 0.7098039, 1, 0, 1,
-0.7972454, 0.8190404, -1.493103, 0.7058824, 1, 0, 1,
-0.7964914, -1.268225, -3.118441, 0.6980392, 1, 0, 1,
-0.7942208, 0.3096707, -1.874983, 0.6901961, 1, 0, 1,
-0.7902269, 0.09078939, -2.816494, 0.6862745, 1, 0, 1,
-0.7861733, -0.7665637, -1.101289, 0.6784314, 1, 0, 1,
-0.7840216, 0.7871968, -0.5972584, 0.6745098, 1, 0, 1,
-0.7829714, -0.2396592, -1.679703, 0.6666667, 1, 0, 1,
-0.7819512, 0.1905757, -1.671511, 0.6627451, 1, 0, 1,
-0.7807485, -0.06681421, 0.1060568, 0.654902, 1, 0, 1,
-0.7728204, 0.3493784, -1.719331, 0.6509804, 1, 0, 1,
-0.7716714, -0.7930965, -2.344014, 0.6431373, 1, 0, 1,
-0.7708783, 0.2816882, -1.053983, 0.6392157, 1, 0, 1,
-0.7704852, 0.2177034, -2.125245, 0.6313726, 1, 0, 1,
-0.7703323, 0.2665626, -1.515424, 0.627451, 1, 0, 1,
-0.7697575, 0.2505296, -0.8526475, 0.6196079, 1, 0, 1,
-0.7619352, -1.427312, -4.953264, 0.6156863, 1, 0, 1,
-0.7593774, 1.769557, -0.6988146, 0.6078432, 1, 0, 1,
-0.754059, -0.9527728, -2.859895, 0.6039216, 1, 0, 1,
-0.7533153, 0.9375077, -1.862189, 0.5960785, 1, 0, 1,
-0.7529612, 0.07516853, -1.008167, 0.5882353, 1, 0, 1,
-0.746878, 0.3645993, -1.833945, 0.5843138, 1, 0, 1,
-0.7363421, 1.496938, -0.4235233, 0.5764706, 1, 0, 1,
-0.7329447, 0.870948, -0.7549787, 0.572549, 1, 0, 1,
-0.7258336, 0.9567289, -0.9606526, 0.5647059, 1, 0, 1,
-0.7219104, 1.02048, 0.42595, 0.5607843, 1, 0, 1,
-0.7160733, -0.8437669, -2.458311, 0.5529412, 1, 0, 1,
-0.711315, -1.025304, -3.105559, 0.5490196, 1, 0, 1,
-0.7070711, -0.01275899, -1.585283, 0.5411765, 1, 0, 1,
-0.6983468, -1.416137, -1.461824, 0.5372549, 1, 0, 1,
-0.6920466, 0.08527972, -0.7557682, 0.5294118, 1, 0, 1,
-0.6826774, -0.5498608, -0.4345916, 0.5254902, 1, 0, 1,
-0.6817786, 0.9455988, -1.509971, 0.5176471, 1, 0, 1,
-0.6725204, 0.8406719, 0.3323193, 0.5137255, 1, 0, 1,
-0.6716078, -1.569172, -2.239138, 0.5058824, 1, 0, 1,
-0.6703388, -1.85881, -4.579909, 0.5019608, 1, 0, 1,
-0.6646662, 0.4268773, -1.223409, 0.4941176, 1, 0, 1,
-0.659695, 0.04738092, -3.671724, 0.4862745, 1, 0, 1,
-0.6561753, 2.57627, -0.640728, 0.4823529, 1, 0, 1,
-0.6549178, -0.08810232, -2.683535, 0.4745098, 1, 0, 1,
-0.6537405, -1.728793, -3.212936, 0.4705882, 1, 0, 1,
-0.6530196, 0.1348568, -2.132746, 0.4627451, 1, 0, 1,
-0.6495127, 0.2571106, -0.388278, 0.4588235, 1, 0, 1,
-0.6434805, 0.6250188, -1.825813, 0.4509804, 1, 0, 1,
-0.6396782, 0.7917861, -0.3745004, 0.4470588, 1, 0, 1,
-0.6390919, 2.218793, -0.6533508, 0.4392157, 1, 0, 1,
-0.6383005, 0.5175652, -1.790557, 0.4352941, 1, 0, 1,
-0.6363726, -0.7389085, -2.056159, 0.427451, 1, 0, 1,
-0.6353397, 0.6163167, -3.119903, 0.4235294, 1, 0, 1,
-0.6343242, -1.320737, -3.923461, 0.4156863, 1, 0, 1,
-0.6309337, -1.230972, -0.4142524, 0.4117647, 1, 0, 1,
-0.6240352, -0.8495166, -3.77831, 0.4039216, 1, 0, 1,
-0.6173826, -0.8309585, -2.112198, 0.3960784, 1, 0, 1,
-0.6158286, 0.2309201, -2.244363, 0.3921569, 1, 0, 1,
-0.6157033, -0.4157037, -4.107251, 0.3843137, 1, 0, 1,
-0.6092367, -0.312054, -1.062498, 0.3803922, 1, 0, 1,
-0.6061881, -0.9597329, -3.032441, 0.372549, 1, 0, 1,
-0.5959269, -1.576205, -3.366302, 0.3686275, 1, 0, 1,
-0.5929863, 1.150272, 0.7047215, 0.3607843, 1, 0, 1,
-0.5904778, -0.2327296, -2.892045, 0.3568628, 1, 0, 1,
-0.5853146, 1.32328, -1.118469, 0.3490196, 1, 0, 1,
-0.5834081, 0.9631252, -0.5366395, 0.345098, 1, 0, 1,
-0.5798805, -1.152267, -2.918162, 0.3372549, 1, 0, 1,
-0.5794266, 0.7381973, -1.203521, 0.3333333, 1, 0, 1,
-0.5793876, -0.1723023, -2.433303, 0.3254902, 1, 0, 1,
-0.5744272, 0.4286007, 1.656035, 0.3215686, 1, 0, 1,
-0.5713196, 1.98437, 0.5500188, 0.3137255, 1, 0, 1,
-0.5599138, 0.3614231, -0.374989, 0.3098039, 1, 0, 1,
-0.5579066, 0.6218234, -2.402037, 0.3019608, 1, 0, 1,
-0.551998, 0.3067624, -0.9911518, 0.2941177, 1, 0, 1,
-0.5518966, 0.3784693, -3.584483, 0.2901961, 1, 0, 1,
-0.5504811, -1.039547, -2.164243, 0.282353, 1, 0, 1,
-0.5494888, 0.2424335, -2.649748, 0.2784314, 1, 0, 1,
-0.5488264, -2.681841, -3.7067, 0.2705882, 1, 0, 1,
-0.5451177, -2.110197, -3.016182, 0.2666667, 1, 0, 1,
-0.5428935, 3.148086, 0.955084, 0.2588235, 1, 0, 1,
-0.5407825, -1.15292, -2.986861, 0.254902, 1, 0, 1,
-0.5352132, -0.8524721, -1.867539, 0.2470588, 1, 0, 1,
-0.534288, 0.8907771, -0.9051962, 0.2431373, 1, 0, 1,
-0.5275143, -0.4227581, -0.3466831, 0.2352941, 1, 0, 1,
-0.525525, 0.3061136, -1.686445, 0.2313726, 1, 0, 1,
-0.5209827, 0.7544673, -1.501648, 0.2235294, 1, 0, 1,
-0.5204927, 0.7248517, -1.017748, 0.2196078, 1, 0, 1,
-0.5188075, -1.204719, -3.183465, 0.2117647, 1, 0, 1,
-0.5166524, 0.1015821, 0.1916652, 0.2078431, 1, 0, 1,
-0.5161284, -1.373846, -2.188172, 0.2, 1, 0, 1,
-0.5120149, -0.3093999, -1.334648, 0.1921569, 1, 0, 1,
-0.4979221, 0.8219095, 0.2610204, 0.1882353, 1, 0, 1,
-0.492438, 0.08883383, -2.267644, 0.1803922, 1, 0, 1,
-0.4876193, 0.5813553, -1.178391, 0.1764706, 1, 0, 1,
-0.4779539, 1.182055, 0.1012342, 0.1686275, 1, 0, 1,
-0.4755823, -0.9660245, -2.199003, 0.1647059, 1, 0, 1,
-0.4753555, 0.3043925, -2.523403, 0.1568628, 1, 0, 1,
-0.4751784, 0.7542223, -1.002267, 0.1529412, 1, 0, 1,
-0.4744093, -0.1244437, -3.503698, 0.145098, 1, 0, 1,
-0.4735401, 0.9558033, -1.216575, 0.1411765, 1, 0, 1,
-0.4731077, 0.6405292, -3.231472, 0.1333333, 1, 0, 1,
-0.4725099, -0.6187865, -1.828964, 0.1294118, 1, 0, 1,
-0.4699448, -1.18373, -3.188092, 0.1215686, 1, 0, 1,
-0.4679939, -0.1651479, -4.426185, 0.1176471, 1, 0, 1,
-0.4638096, 0.265269, -2.571461, 0.1098039, 1, 0, 1,
-0.4627641, -0.5688136, -3.56616, 0.1058824, 1, 0, 1,
-0.4590661, -0.0286393, -3.533521, 0.09803922, 1, 0, 1,
-0.4575876, 0.02729773, -1.66688, 0.09019608, 1, 0, 1,
-0.4523439, 0.2702838, -0.1575842, 0.08627451, 1, 0, 1,
-0.4504466, 1.311126, -0.2517754, 0.07843138, 1, 0, 1,
-0.4470384, 1.291609, -1.544484, 0.07450981, 1, 0, 1,
-0.4424874, -0.4276216, -2.594962, 0.06666667, 1, 0, 1,
-0.4396661, 0.393393, 0.6451353, 0.0627451, 1, 0, 1,
-0.4288037, 0.4921541, 0.2961827, 0.05490196, 1, 0, 1,
-0.4236049, 1.26792, -0.4696011, 0.05098039, 1, 0, 1,
-0.4235994, -1.930053, -2.079705, 0.04313726, 1, 0, 1,
-0.4111731, -1.251348, -2.790139, 0.03921569, 1, 0, 1,
-0.4102818, -0.2991825, -3.661473, 0.03137255, 1, 0, 1,
-0.4015584, 0.22608, 0.6106123, 0.02745098, 1, 0, 1,
-0.3969957, -1.669392, -1.719725, 0.01960784, 1, 0, 1,
-0.3952757, -0.2322309, -2.132673, 0.01568628, 1, 0, 1,
-0.3897078, -0.7898349, -3.617298, 0.007843138, 1, 0, 1,
-0.3857852, -0.468866, -2.343926, 0.003921569, 1, 0, 1,
-0.3846358, -0.9250136, -3.764673, 0, 1, 0.003921569, 1,
-0.3831443, -0.0001643199, -0.972261, 0, 1, 0.01176471, 1,
-0.3814646, -0.7691252, -2.531508, 0, 1, 0.01568628, 1,
-0.3751216, 1.268472, -0.8921304, 0, 1, 0.02352941, 1,
-0.373621, -0.7434387, -2.14848, 0, 1, 0.02745098, 1,
-0.3727787, -2.792682, -4.508979, 0, 1, 0.03529412, 1,
-0.3708483, -0.3719895, -3.498955, 0, 1, 0.03921569, 1,
-0.3668154, -1.083245, -2.43652, 0, 1, 0.04705882, 1,
-0.3654821, -0.07306119, -0.7505971, 0, 1, 0.05098039, 1,
-0.3653833, -0.6262, -3.070244, 0, 1, 0.05882353, 1,
-0.3653816, -0.3562083, -3.620505, 0, 1, 0.0627451, 1,
-0.3650438, 0.4110975, -2.044771, 0, 1, 0.07058824, 1,
-0.3629545, -1.561193, -2.754979, 0, 1, 0.07450981, 1,
-0.3623663, 0.520776, -0.4364137, 0, 1, 0.08235294, 1,
-0.3619996, -0.1020363, -2.957017, 0, 1, 0.08627451, 1,
-0.361883, 0.3666375, 0.7213771, 0, 1, 0.09411765, 1,
-0.3590253, -0.8985966, -1.483406, 0, 1, 0.1019608, 1,
-0.3584989, -0.6375344, -2.214393, 0, 1, 0.1058824, 1,
-0.3504859, -0.8160081, -2.232515, 0, 1, 0.1137255, 1,
-0.3486682, 0.1259882, -1.131018, 0, 1, 0.1176471, 1,
-0.3448355, 0.05030333, -0.7464717, 0, 1, 0.1254902, 1,
-0.3441485, -1.35205, -3.507945, 0, 1, 0.1294118, 1,
-0.3427967, -0.4378733, -4.324803, 0, 1, 0.1372549, 1,
-0.3425704, -0.4666845, -2.178171, 0, 1, 0.1411765, 1,
-0.3421347, -0.05893124, -0.9925022, 0, 1, 0.1490196, 1,
-0.3394628, 0.6302901, -0.4941777, 0, 1, 0.1529412, 1,
-0.3393799, 1.188115, -0.8852169, 0, 1, 0.1607843, 1,
-0.3359196, 1.513799, -0.8240154, 0, 1, 0.1647059, 1,
-0.3351871, -1.848927, -3.985369, 0, 1, 0.172549, 1,
-0.3331692, 1.926814, 0.3771715, 0, 1, 0.1764706, 1,
-0.3288051, -0.1291408, -0.7517765, 0, 1, 0.1843137, 1,
-0.3268064, -0.1342346, -1.420166, 0, 1, 0.1882353, 1,
-0.3250873, -0.3194739, -3.319301, 0, 1, 0.1960784, 1,
-0.3247505, -0.2708445, -1.808251, 0, 1, 0.2039216, 1,
-0.3247356, 0.8742632, -2.207275, 0, 1, 0.2078431, 1,
-0.3195218, 0.467134, -1.038791, 0, 1, 0.2156863, 1,
-0.3172165, 0.4439966, -0.6817979, 0, 1, 0.2196078, 1,
-0.3154442, 0.5185884, -0.4511973, 0, 1, 0.227451, 1,
-0.3124706, 0.4760828, 0.7170392, 0, 1, 0.2313726, 1,
-0.3121571, -1.677993, -3.108242, 0, 1, 0.2392157, 1,
-0.3113954, 0.166336, -1.522602, 0, 1, 0.2431373, 1,
-0.3088475, -0.4511959, -2.489188, 0, 1, 0.2509804, 1,
-0.3056763, -0.2510577, -3.101247, 0, 1, 0.254902, 1,
-0.3044348, -2.172657, -3.668455, 0, 1, 0.2627451, 1,
-0.2997884, 0.8574212, -0.03584543, 0, 1, 0.2666667, 1,
-0.2985978, -0.662686, -1.884717, 0, 1, 0.2745098, 1,
-0.2979209, 0.4481619, 0.4819392, 0, 1, 0.2784314, 1,
-0.2871879, -0.5975859, -1.783634, 0, 1, 0.2862745, 1,
-0.2845964, -0.3302305, -0.5373216, 0, 1, 0.2901961, 1,
-0.2845351, -0.9095179, -2.966602, 0, 1, 0.2980392, 1,
-0.2845134, -1.25274, -2.875315, 0, 1, 0.3058824, 1,
-0.2835704, 0.2304215, 0.679024, 0, 1, 0.3098039, 1,
-0.283187, 0.5353025, 0.6324201, 0, 1, 0.3176471, 1,
-0.2806949, 1.936843, -1.092883, 0, 1, 0.3215686, 1,
-0.2787854, -0.3079959, -3.682502, 0, 1, 0.3294118, 1,
-0.2785295, -0.4444566, -3.410264, 0, 1, 0.3333333, 1,
-0.2772111, -1.194501, -2.633924, 0, 1, 0.3411765, 1,
-0.2741333, 0.3365703, -0.2218962, 0, 1, 0.345098, 1,
-0.2686237, -0.3855881, -2.95044, 0, 1, 0.3529412, 1,
-0.2595487, 0.998502, -0.2682042, 0, 1, 0.3568628, 1,
-0.2571731, -0.9983115, -3.508645, 0, 1, 0.3647059, 1,
-0.2546776, 1.534244, -0.8444054, 0, 1, 0.3686275, 1,
-0.2509254, 0.4735791, -0.7146391, 0, 1, 0.3764706, 1,
-0.2466356, 2.016908, -0.08023655, 0, 1, 0.3803922, 1,
-0.2440575, -0.1593787, -3.107471, 0, 1, 0.3882353, 1,
-0.2381369, -1.184666, -2.706587, 0, 1, 0.3921569, 1,
-0.236619, -0.2848318, -2.767632, 0, 1, 0.4, 1,
-0.2353083, 0.684676, 0.1028611, 0, 1, 0.4078431, 1,
-0.2286778, 1.643392, 1.647499, 0, 1, 0.4117647, 1,
-0.227032, -0.4557071, -0.7349557, 0, 1, 0.4196078, 1,
-0.2269989, -1.546598, -1.510936, 0, 1, 0.4235294, 1,
-0.2249993, 0.5788742, -0.4264801, 0, 1, 0.4313726, 1,
-0.2239115, 0.8752852, 0.3279038, 0, 1, 0.4352941, 1,
-0.2204378, -1.686252, -1.330328, 0, 1, 0.4431373, 1,
-0.2136011, 1.180963, -0.9301782, 0, 1, 0.4470588, 1,
-0.2103487, 1.026872, 0.07289022, 0, 1, 0.454902, 1,
-0.2098997, -0.3787646, -1.464014, 0, 1, 0.4588235, 1,
-0.2078767, -0.5270066, -3.002293, 0, 1, 0.4666667, 1,
-0.205552, -1.077846, -2.758809, 0, 1, 0.4705882, 1,
-0.2045611, 1.331427, 0.4476627, 0, 1, 0.4784314, 1,
-0.1959102, -1.060248, -3.306217, 0, 1, 0.4823529, 1,
-0.1958545, -0.754706, -2.516286, 0, 1, 0.4901961, 1,
-0.1947897, 0.4568337, -1.111497, 0, 1, 0.4941176, 1,
-0.1925183, -0.8594696, -3.946681, 0, 1, 0.5019608, 1,
-0.1920014, 0.8883268, 0.1275857, 0, 1, 0.509804, 1,
-0.1899531, 2.38983, -1.08902, 0, 1, 0.5137255, 1,
-0.1886225, 2.086261, -2.904685, 0, 1, 0.5215687, 1,
-0.1881183, -0.9448398, -1.597747, 0, 1, 0.5254902, 1,
-0.1877553, -0.002881066, -0.1402294, 0, 1, 0.5333334, 1,
-0.187125, -0.01201816, -2.316356, 0, 1, 0.5372549, 1,
-0.1863113, -0.8180005, -3.0096, 0, 1, 0.5450981, 1,
-0.1807017, 1.796829, 1.564149, 0, 1, 0.5490196, 1,
-0.1749638, 0.9919117, 1.424359, 0, 1, 0.5568628, 1,
-0.1702639, -0.2899775, -2.864701, 0, 1, 0.5607843, 1,
-0.1700256, 0.2679653, 0.08341251, 0, 1, 0.5686275, 1,
-0.1632639, -0.004788794, -2.311366, 0, 1, 0.572549, 1,
-0.1534677, 0.7339662, -0.4224881, 0, 1, 0.5803922, 1,
-0.1503838, -0.5270828, -3.892727, 0, 1, 0.5843138, 1,
-0.1486409, 0.3285294, 0.5012251, 0, 1, 0.5921569, 1,
-0.1472566, -1.123441, -5.065368, 0, 1, 0.5960785, 1,
-0.1471067, -0.09877678, -1.859977, 0, 1, 0.6039216, 1,
-0.1460198, -0.4114659, -3.209982, 0, 1, 0.6117647, 1,
-0.1428408, 1.498102, 0.3221271, 0, 1, 0.6156863, 1,
-0.1392475, -0.4508774, -4.417903, 0, 1, 0.6235294, 1,
-0.1387582, -1.776719, -3.054625, 0, 1, 0.627451, 1,
-0.1375892, 0.4071637, -0.4746191, 0, 1, 0.6352941, 1,
-0.1375111, 0.4900437, -0.09691176, 0, 1, 0.6392157, 1,
-0.1359589, 1.721228, 0.02264922, 0, 1, 0.6470588, 1,
-0.1354642, -0.04533842, -1.714449, 0, 1, 0.6509804, 1,
-0.1336891, -0.9937447, -3.871539, 0, 1, 0.6588235, 1,
-0.1336666, -1.804758, -3.326273, 0, 1, 0.6627451, 1,
-0.1332593, -1.767058, -3.597045, 0, 1, 0.6705883, 1,
-0.1330383, 0.5162312, 1.390986, 0, 1, 0.6745098, 1,
-0.131161, -0.2223086, -1.924496, 0, 1, 0.682353, 1,
-0.1268412, 0.01049475, -1.681976, 0, 1, 0.6862745, 1,
-0.1267041, -0.3693197, -3.556755, 0, 1, 0.6941177, 1,
-0.1261372, -1.346584, -4.008162, 0, 1, 0.7019608, 1,
-0.1200894, 0.2263823, -1.526823, 0, 1, 0.7058824, 1,
-0.1158111, 0.1112579, 0.5667145, 0, 1, 0.7137255, 1,
-0.1139756, 0.3048165, -1.469902, 0, 1, 0.7176471, 1,
-0.1129422, 1.056673, 1.055137, 0, 1, 0.7254902, 1,
-0.1121712, -0.5517594, -5.450822, 0, 1, 0.7294118, 1,
-0.1120441, -1.251825, -2.904059, 0, 1, 0.7372549, 1,
-0.1105596, -0.02300294, -3.277127, 0, 1, 0.7411765, 1,
-0.1090215, 1.968504, -0.7717654, 0, 1, 0.7490196, 1,
-0.1086836, -0.8081961, -4.328417, 0, 1, 0.7529412, 1,
-0.1081418, 1.227087, 0.2668318, 0, 1, 0.7607843, 1,
-0.1065725, -0.4930524, -3.21384, 0, 1, 0.7647059, 1,
-0.1044295, -0.004464764, -1.098297, 0, 1, 0.772549, 1,
-0.1007764, -0.1186157, -2.900509, 0, 1, 0.7764706, 1,
-0.09122553, 2.098544, 0.4343944, 0, 1, 0.7843137, 1,
-0.08674359, 0.9301646, -2.312727, 0, 1, 0.7882353, 1,
-0.08633295, 0.6971326, -2.416015, 0, 1, 0.7960784, 1,
-0.08589672, 0.1635037, 0.08586347, 0, 1, 0.8039216, 1,
-0.08557848, -0.07064962, -1.614434, 0, 1, 0.8078431, 1,
-0.08351812, 1.98305, 0.5043408, 0, 1, 0.8156863, 1,
-0.08345233, -1.037517, -4.514703, 0, 1, 0.8196079, 1,
-0.07822624, 1.07422, 0.461108, 0, 1, 0.827451, 1,
-0.07650547, -0.756959, -2.013015, 0, 1, 0.8313726, 1,
-0.07575335, -0.7896886, -2.678607, 0, 1, 0.8392157, 1,
-0.07491986, -1.733917, -3.274164, 0, 1, 0.8431373, 1,
-0.07216862, 0.1863625, -0.7995625, 0, 1, 0.8509804, 1,
-0.07096367, -1.039121, -4.790251, 0, 1, 0.854902, 1,
-0.0702728, -0.3164501, -2.625226, 0, 1, 0.8627451, 1,
-0.07013968, 0.2346435, -0.01543773, 0, 1, 0.8666667, 1,
-0.06778464, -0.7508063, -2.663578, 0, 1, 0.8745098, 1,
-0.066231, -1.072887, -2.517559, 0, 1, 0.8784314, 1,
-0.0661725, 1.842016, -0.3082441, 0, 1, 0.8862745, 1,
-0.0643203, -1.531837, -2.989599, 0, 1, 0.8901961, 1,
-0.06263744, 0.3958929, -3.162142, 0, 1, 0.8980392, 1,
-0.06182628, -1.288339, -1.770955, 0, 1, 0.9058824, 1,
-0.06094625, 0.4910811, 0.05811183, 0, 1, 0.9098039, 1,
-0.05383585, -0.194416, -5.013701, 0, 1, 0.9176471, 1,
-0.05320318, -1.206058, -3.071383, 0, 1, 0.9215686, 1,
-0.0440539, -0.8442952, -3.440964, 0, 1, 0.9294118, 1,
-0.04369751, 1.661902, -0.7941197, 0, 1, 0.9333333, 1,
-0.04277685, 0.1345567, -0.2895502, 0, 1, 0.9411765, 1,
-0.0417371, -0.3305092, -3.644076, 0, 1, 0.945098, 1,
-0.03666459, 0.1737078, 0.7236587, 0, 1, 0.9529412, 1,
-0.0316325, -1.427061, -1.663993, 0, 1, 0.9568627, 1,
-0.02636934, 0.8658046, 0.6038938, 0, 1, 0.9647059, 1,
-0.02207038, -1.405945, -2.742074, 0, 1, 0.9686275, 1,
-0.02200885, -0.9562095, -4.027235, 0, 1, 0.9764706, 1,
-0.01782745, -0.01849699, -1.086018, 0, 1, 0.9803922, 1,
-0.01244574, -0.1395202, -2.694629, 0, 1, 0.9882353, 1,
-0.01239187, 0.2665358, 1.616531, 0, 1, 0.9921569, 1,
-0.01168233, -0.02431368, -3.187489, 0, 1, 1, 1,
-0.007947695, -0.6416004, -2.380815, 0, 0.9921569, 1, 1,
-0.007144732, 1.308133, -0.3015279, 0, 0.9882353, 1, 1,
-0.004392162, 0.1328435, -0.8503375, 0, 0.9803922, 1, 1,
0.002128396, 1.222298, -2.686856, 0, 0.9764706, 1, 1,
0.005050028, 1.069897, -0.7634507, 0, 0.9686275, 1, 1,
0.01194773, -0.1198973, 2.315198, 0, 0.9647059, 1, 1,
0.02112187, 0.8277225, 1.155214, 0, 0.9568627, 1, 1,
0.0221433, 1.22695, 0.4483789, 0, 0.9529412, 1, 1,
0.02597732, -0.4002534, 1.975216, 0, 0.945098, 1, 1,
0.02767023, -1.284141, 2.532308, 0, 0.9411765, 1, 1,
0.03255599, 1.24347, 2.856783, 0, 0.9333333, 1, 1,
0.04273181, 1.676496, -1.952271, 0, 0.9294118, 1, 1,
0.04330796, 0.5343302, 0.3867881, 0, 0.9215686, 1, 1,
0.05960474, 0.5364863, -0.3480151, 0, 0.9176471, 1, 1,
0.06275231, -0.176571, 2.525051, 0, 0.9098039, 1, 1,
0.06371072, 0.2517922, -0.6945392, 0, 0.9058824, 1, 1,
0.06467547, 1.512002, 1.326502, 0, 0.8980392, 1, 1,
0.0693616, -0.539694, 4.529963, 0, 0.8901961, 1, 1,
0.07865202, 0.7836061, -0.8982498, 0, 0.8862745, 1, 1,
0.07968982, 1.350034, -0.276696, 0, 0.8784314, 1, 1,
0.08289269, 0.5953514, 0.3277748, 0, 0.8745098, 1, 1,
0.08464582, 0.2409943, 0.6209652, 0, 0.8666667, 1, 1,
0.08475009, -0.9998986, 3.052781, 0, 0.8627451, 1, 1,
0.08498976, 1.041948, 0.08635974, 0, 0.854902, 1, 1,
0.08633976, 0.07323497, 2.142316, 0, 0.8509804, 1, 1,
0.08692562, -0.479923, 2.662271, 0, 0.8431373, 1, 1,
0.0871079, 1.111656, -2.830672, 0, 0.8392157, 1, 1,
0.08842459, 0.6978965, -0.9613181, 0, 0.8313726, 1, 1,
0.09717134, -0.5403963, 0.5952705, 0, 0.827451, 1, 1,
0.1036622, -0.09199219, 2.44877, 0, 0.8196079, 1, 1,
0.1064429, 0.4888537, 1.37652, 0, 0.8156863, 1, 1,
0.1083828, 1.029054, -0.8925485, 0, 0.8078431, 1, 1,
0.1092621, -0.7452971, 2.495089, 0, 0.8039216, 1, 1,
0.1131339, -1.010449, 2.940316, 0, 0.7960784, 1, 1,
0.1142918, 0.655392, 1.899522, 0, 0.7882353, 1, 1,
0.1144006, 1.355538, -0.9079736, 0, 0.7843137, 1, 1,
0.1144377, 0.6457549, 0.4037547, 0, 0.7764706, 1, 1,
0.1163118, 0.1633577, -0.4293969, 0, 0.772549, 1, 1,
0.1170637, 1.38807, -1.252691, 0, 0.7647059, 1, 1,
0.1180905, 2.552513, 0.8117678, 0, 0.7607843, 1, 1,
0.123616, 0.6530502, 0.05056478, 0, 0.7529412, 1, 1,
0.1252022, -1.855817, 2.980169, 0, 0.7490196, 1, 1,
0.1296849, 1.771553, -0.8353502, 0, 0.7411765, 1, 1,
0.1306893, -1.002394, 2.041132, 0, 0.7372549, 1, 1,
0.1313609, 1.349011, -1.462431, 0, 0.7294118, 1, 1,
0.1317806, 1.145014, -0.6556885, 0, 0.7254902, 1, 1,
0.1319769, -1.118404, 4.581712, 0, 0.7176471, 1, 1,
0.1330132, 0.1040048, 1.611132, 0, 0.7137255, 1, 1,
0.1330993, 0.5337583, 1.926193, 0, 0.7058824, 1, 1,
0.1333429, 0.7350523, -1.050585, 0, 0.6980392, 1, 1,
0.1365975, -0.5770628, 2.827575, 0, 0.6941177, 1, 1,
0.1378333, -0.3016602, 3.93972, 0, 0.6862745, 1, 1,
0.1389623, 2.018628, 1.114587, 0, 0.682353, 1, 1,
0.1405959, -0.9568387, 2.303504, 0, 0.6745098, 1, 1,
0.1480045, 1.051932, 0.278612, 0, 0.6705883, 1, 1,
0.150941, -0.7379911, 3.086699, 0, 0.6627451, 1, 1,
0.1524803, 0.5705028, -1.970878, 0, 0.6588235, 1, 1,
0.1586793, 0.9422414, 0.6450464, 0, 0.6509804, 1, 1,
0.161848, -0.5694605, 0.560753, 0, 0.6470588, 1, 1,
0.1660276, -2.096968, 2.095083, 0, 0.6392157, 1, 1,
0.16683, -2.17664, 1.311695, 0, 0.6352941, 1, 1,
0.1740023, 0.6761159, -0.9413813, 0, 0.627451, 1, 1,
0.1750522, 1.21408, -0.5334078, 0, 0.6235294, 1, 1,
0.1751229, -1.331886, 2.075104, 0, 0.6156863, 1, 1,
0.18053, 1.124947, -0.1957471, 0, 0.6117647, 1, 1,
0.1810109, 0.06798054, -0.1129083, 0, 0.6039216, 1, 1,
0.1816966, -0.3411447, 2.515637, 0, 0.5960785, 1, 1,
0.1826445, -0.05591991, -0.06562567, 0, 0.5921569, 1, 1,
0.1844071, -0.4408792, 4.1951, 0, 0.5843138, 1, 1,
0.1860435, 0.3045911, -0.6893192, 0, 0.5803922, 1, 1,
0.1872587, -0.662064, 3.928134, 0, 0.572549, 1, 1,
0.1947059, -2.114847, 3.147244, 0, 0.5686275, 1, 1,
0.1960688, 0.565598, 1.570774, 0, 0.5607843, 1, 1,
0.1987801, -0.2168899, 0.2875813, 0, 0.5568628, 1, 1,
0.1993462, 1.741635, 0.5204452, 0, 0.5490196, 1, 1,
0.2046897, -0.1510002, 3.16334, 0, 0.5450981, 1, 1,
0.2095879, 0.3459804, -0.09268987, 0, 0.5372549, 1, 1,
0.2132433, -1.26302, 3.183569, 0, 0.5333334, 1, 1,
0.2143036, -2.070273, 4.523503, 0, 0.5254902, 1, 1,
0.2168348, -0.2600506, 2.17389, 0, 0.5215687, 1, 1,
0.2186126, -0.3063482, 2.681277, 0, 0.5137255, 1, 1,
0.2191422, -1.31461, 1.417762, 0, 0.509804, 1, 1,
0.2231915, -0.2004618, 3.368286, 0, 0.5019608, 1, 1,
0.2264898, -1.62129, 1.032642, 0, 0.4941176, 1, 1,
0.2272882, -0.1766735, 2.63845, 0, 0.4901961, 1, 1,
0.2277791, 1.083577, -1.074527, 0, 0.4823529, 1, 1,
0.2280503, 0.526866, 1.247108, 0, 0.4784314, 1, 1,
0.2289419, 1.991323, -0.2477794, 0, 0.4705882, 1, 1,
0.2289432, 1.381868, 1.638682, 0, 0.4666667, 1, 1,
0.2313989, -0.5048729, 2.806164, 0, 0.4588235, 1, 1,
0.2331096, 1.29369, 0.4337755, 0, 0.454902, 1, 1,
0.2342529, 0.8765649, -0.2456444, 0, 0.4470588, 1, 1,
0.2392822, 0.3777569, 0.1701952, 0, 0.4431373, 1, 1,
0.2451037, 1.567256, 0.03221133, 0, 0.4352941, 1, 1,
0.249596, 0.3284427, -0.1877435, 0, 0.4313726, 1, 1,
0.2524569, 1.51055, 0.5412548, 0, 0.4235294, 1, 1,
0.2561215, -0.3625478, 2.808323, 0, 0.4196078, 1, 1,
0.2641061, 1.075482, -0.5220892, 0, 0.4117647, 1, 1,
0.2740091, -0.4073382, 4.582477, 0, 0.4078431, 1, 1,
0.2752659, 1.278762, -1.080218, 0, 0.4, 1, 1,
0.2761778, -1.841103, 1.96072, 0, 0.3921569, 1, 1,
0.2778709, 0.3410558, -0.5810683, 0, 0.3882353, 1, 1,
0.2779891, -1.139032, 3.003611, 0, 0.3803922, 1, 1,
0.2783391, 0.5552826, -0.1960839, 0, 0.3764706, 1, 1,
0.2802017, 0.3861527, 1.579075, 0, 0.3686275, 1, 1,
0.2802879, -0.8400953, 1.809145, 0, 0.3647059, 1, 1,
0.2808868, 1.309664, -0.6635502, 0, 0.3568628, 1, 1,
0.2840204, 0.1901238, -0.2131255, 0, 0.3529412, 1, 1,
0.285606, 0.5776768, 2.060382, 0, 0.345098, 1, 1,
0.2870882, 0.1425048, 1.826313, 0, 0.3411765, 1, 1,
0.2898136, 2.523091, -0.1060129, 0, 0.3333333, 1, 1,
0.2946907, -0.990882, 4.689919, 0, 0.3294118, 1, 1,
0.2951816, 1.071338, 0.7150794, 0, 0.3215686, 1, 1,
0.2972933, -0.8996496, 2.274449, 0, 0.3176471, 1, 1,
0.2984205, 0.8878876, 0.4533859, 0, 0.3098039, 1, 1,
0.3036983, 0.6109272, 1.687201, 0, 0.3058824, 1, 1,
0.3057708, -1.213189, 3.361109, 0, 0.2980392, 1, 1,
0.3062814, 0.6666376, -1.433051, 0, 0.2901961, 1, 1,
0.3092572, 1.327422, -0.4002691, 0, 0.2862745, 1, 1,
0.3102189, 1.290601, 0.7364346, 0, 0.2784314, 1, 1,
0.3136161, -0.4600329, 2.675126, 0, 0.2745098, 1, 1,
0.316042, 1.450219, -0.3690331, 0, 0.2666667, 1, 1,
0.3197383, 1.278554, 0.3525195, 0, 0.2627451, 1, 1,
0.3202787, 0.1503008, -0.2567348, 0, 0.254902, 1, 1,
0.3284172, 0.2790513, 1.756218, 0, 0.2509804, 1, 1,
0.3288221, 0.05369219, 1.060598, 0, 0.2431373, 1, 1,
0.3308437, -0.2750942, 3.167572, 0, 0.2392157, 1, 1,
0.3312041, -0.1908292, 1.081172, 0, 0.2313726, 1, 1,
0.3332546, 1.499293, -1.672987, 0, 0.227451, 1, 1,
0.3335496, -0.1560252, 1.956008, 0, 0.2196078, 1, 1,
0.3354933, -1.31349, 2.989794, 0, 0.2156863, 1, 1,
0.3526796, 0.9163347, 1.919004, 0, 0.2078431, 1, 1,
0.3533065, 0.263586, 1.10376, 0, 0.2039216, 1, 1,
0.3556809, 0.008847135, 0.2034427, 0, 0.1960784, 1, 1,
0.3562805, 1.574795, -0.5533861, 0, 0.1882353, 1, 1,
0.3581731, -0.8566062, 1.922062, 0, 0.1843137, 1, 1,
0.3618767, -2.163213, 1.72317, 0, 0.1764706, 1, 1,
0.3630745, -0.40648, 3.399546, 0, 0.172549, 1, 1,
0.3630889, -1.379539, 2.404105, 0, 0.1647059, 1, 1,
0.3710827, 0.697661, -2.042436, 0, 0.1607843, 1, 1,
0.3816808, -0.2328098, 1.371902, 0, 0.1529412, 1, 1,
0.3822169, -0.3706797, 1.699823, 0, 0.1490196, 1, 1,
0.3862678, 1.148018, -0.9616286, 0, 0.1411765, 1, 1,
0.3870919, 1.455449, 0.3325307, 0, 0.1372549, 1, 1,
0.3915036, 1.606342, -0.6903579, 0, 0.1294118, 1, 1,
0.396175, -0.4076896, 2.072755, 0, 0.1254902, 1, 1,
0.3962985, -0.6520356, 3.574728, 0, 0.1176471, 1, 1,
0.3990122, 0.55664, 0.05353821, 0, 0.1137255, 1, 1,
0.4018446, 0.07619907, 0.5615661, 0, 0.1058824, 1, 1,
0.4075635, -0.3480439, 2.042803, 0, 0.09803922, 1, 1,
0.4088741, -1.083639, 1.02833, 0, 0.09411765, 1, 1,
0.4112971, 0.4591278, 0.4724754, 0, 0.08627451, 1, 1,
0.413305, 1.803378, 1.24781, 0, 0.08235294, 1, 1,
0.4158251, -0.9408264, 1.063144, 0, 0.07450981, 1, 1,
0.4178844, 1.22497, 1.182832, 0, 0.07058824, 1, 1,
0.419803, -1.794048, 4.035928, 0, 0.0627451, 1, 1,
0.4210263, -0.4460087, 1.864835, 0, 0.05882353, 1, 1,
0.4246733, -0.786203, 1.966288, 0, 0.05098039, 1, 1,
0.4314475, -1.60751, 2.695205, 0, 0.04705882, 1, 1,
0.4351113, -1.050184, 2.317872, 0, 0.03921569, 1, 1,
0.4420761, 1.641559, 0.2377044, 0, 0.03529412, 1, 1,
0.4433752, 0.6761754, 1.113246, 0, 0.02745098, 1, 1,
0.4501103, -0.2588266, 1.84826, 0, 0.02352941, 1, 1,
0.4531372, -0.7069987, 3.710258, 0, 0.01568628, 1, 1,
0.4607606, -1.315691, 2.468979, 0, 0.01176471, 1, 1,
0.4628322, -1.808509, 2.839365, 0, 0.003921569, 1, 1,
0.4643799, 0.5917005, -0.4923162, 0.003921569, 0, 1, 1,
0.4706883, 0.8498359, 1.481953, 0.007843138, 0, 1, 1,
0.4742435, 1.361592, 0.01733833, 0.01568628, 0, 1, 1,
0.4743059, 0.5203023, 1.708413, 0.01960784, 0, 1, 1,
0.475148, -0.5582509, 2.992543, 0.02745098, 0, 1, 1,
0.4778445, -0.4599831, 1.72785, 0.03137255, 0, 1, 1,
0.4804592, 1.062887, 0.8427587, 0.03921569, 0, 1, 1,
0.4819905, -0.1926403, 0.8790692, 0.04313726, 0, 1, 1,
0.4878196, 0.4586613, 2.074081, 0.05098039, 0, 1, 1,
0.4900478, -0.06790579, 1.279427, 0.05490196, 0, 1, 1,
0.4912744, 0.1818874, 1.578981, 0.0627451, 0, 1, 1,
0.4938532, 1.376347, -0.6929974, 0.06666667, 0, 1, 1,
0.4955202, 0.4475611, 0.3586463, 0.07450981, 0, 1, 1,
0.5071123, 0.466057, 0.4724076, 0.07843138, 0, 1, 1,
0.5091772, -1.159196, 4.454491, 0.08627451, 0, 1, 1,
0.509815, -0.8705497, 3.213152, 0.09019608, 0, 1, 1,
0.51362, -2.259326, 4.55981, 0.09803922, 0, 1, 1,
0.51869, 1.114299, -0.2271629, 0.1058824, 0, 1, 1,
0.5213882, -0.6339919, 1.742424, 0.1098039, 0, 1, 1,
0.5236932, -0.2056386, 2.682109, 0.1176471, 0, 1, 1,
0.5240684, 0.4842784, 1.202492, 0.1215686, 0, 1, 1,
0.5380785, 1.23401, -1.17157, 0.1294118, 0, 1, 1,
0.5407384, -0.1364291, -0.4636588, 0.1333333, 0, 1, 1,
0.5422564, -1.133817, 3.636541, 0.1411765, 0, 1, 1,
0.5424234, 0.9065366, -0.2028651, 0.145098, 0, 1, 1,
0.5428835, -1.07608, 2.93714, 0.1529412, 0, 1, 1,
0.5513352, -1.793457, 3.171161, 0.1568628, 0, 1, 1,
0.551748, 1.223456, -1.889903, 0.1647059, 0, 1, 1,
0.5526377, 1.131422, 0.4096999, 0.1686275, 0, 1, 1,
0.5533631, 0.05828394, 2.281191, 0.1764706, 0, 1, 1,
0.5615717, 1.199889, 3.304934, 0.1803922, 0, 1, 1,
0.5628259, 0.9103711, 0.09660951, 0.1882353, 0, 1, 1,
0.5636207, -0.3304333, 0.9602735, 0.1921569, 0, 1, 1,
0.568481, -0.4552402, 3.087969, 0.2, 0, 1, 1,
0.5696008, -1.665897, 0.9590152, 0.2078431, 0, 1, 1,
0.5710431, -2.333379, 3.451344, 0.2117647, 0, 1, 1,
0.5737702, 1.204618, -1.284823, 0.2196078, 0, 1, 1,
0.5776554, 1.395275, 1.445688, 0.2235294, 0, 1, 1,
0.5812258, -0.1704189, 1.814412, 0.2313726, 0, 1, 1,
0.5839517, 1.072555, -0.5463778, 0.2352941, 0, 1, 1,
0.5869763, 0.5280156, 1.297615, 0.2431373, 0, 1, 1,
0.5893865, 2.307034, 1.898642, 0.2470588, 0, 1, 1,
0.6002811, 0.2639377, 2.156166, 0.254902, 0, 1, 1,
0.6032844, -0.2876915, 2.679776, 0.2588235, 0, 1, 1,
0.6057039, 0.6903445, 0.9467337, 0.2666667, 0, 1, 1,
0.6129217, 0.620407, -0.1732293, 0.2705882, 0, 1, 1,
0.6132208, 1.307451, 0.7903849, 0.2784314, 0, 1, 1,
0.6164249, 0.2269739, 0.9796513, 0.282353, 0, 1, 1,
0.6263865, -0.2046366, 3.13566, 0.2901961, 0, 1, 1,
0.6272532, -0.2914364, 2.716138, 0.2941177, 0, 1, 1,
0.6288852, -0.4232695, 2.393745, 0.3019608, 0, 1, 1,
0.6362801, -0.8441033, 3.379474, 0.3098039, 0, 1, 1,
0.6410291, -0.3079884, 1.35741, 0.3137255, 0, 1, 1,
0.6441579, 0.3421397, 0.725104, 0.3215686, 0, 1, 1,
0.6445699, -0.2062299, 2.310624, 0.3254902, 0, 1, 1,
0.6484572, -1.331763, 2.569098, 0.3333333, 0, 1, 1,
0.6531247, 0.7604473, 1.109603, 0.3372549, 0, 1, 1,
0.6535556, -1.062721, 3.46574, 0.345098, 0, 1, 1,
0.6537052, 0.3910819, -0.2051031, 0.3490196, 0, 1, 1,
0.6548914, 0.7810112, -1.190712, 0.3568628, 0, 1, 1,
0.6603691, 0.1006506, 0.7743156, 0.3607843, 0, 1, 1,
0.6643624, -0.3195146, 2.103858, 0.3686275, 0, 1, 1,
0.6675963, -0.9474343, 4.109849, 0.372549, 0, 1, 1,
0.6677423, -0.6400623, 2.709177, 0.3803922, 0, 1, 1,
0.6685663, -0.3648462, 1.86652, 0.3843137, 0, 1, 1,
0.6686088, 0.7123171, -0.04454833, 0.3921569, 0, 1, 1,
0.6710245, -2.750253, 3.032587, 0.3960784, 0, 1, 1,
0.6713728, -0.635139, 0.8667266, 0.4039216, 0, 1, 1,
0.6792109, -0.03432919, 1.056283, 0.4117647, 0, 1, 1,
0.6839994, -1.865547, 3.113393, 0.4156863, 0, 1, 1,
0.6880798, 0.7422267, 0.4779453, 0.4235294, 0, 1, 1,
0.6890916, 1.378748, -0.516971, 0.427451, 0, 1, 1,
0.6895678, -0.6017563, 2.354484, 0.4352941, 0, 1, 1,
0.7044883, 1.360502, 2.120128, 0.4392157, 0, 1, 1,
0.7240399, 0.227579, 0.3628871, 0.4470588, 0, 1, 1,
0.7270018, -0.2156801, 1.139347, 0.4509804, 0, 1, 1,
0.7310034, 0.1143571, 1.43741, 0.4588235, 0, 1, 1,
0.7324104, -1.562911, 2.445616, 0.4627451, 0, 1, 1,
0.7344398, 0.835897, 2.04776, 0.4705882, 0, 1, 1,
0.73514, -0.1392211, 3.702661, 0.4745098, 0, 1, 1,
0.7353656, 0.6812863, 0.8149775, 0.4823529, 0, 1, 1,
0.7354721, -0.8068957, 2.424888, 0.4862745, 0, 1, 1,
0.7358534, -1.601701, 0.8641379, 0.4941176, 0, 1, 1,
0.7383822, 0.8366508, 1.286085, 0.5019608, 0, 1, 1,
0.7388474, -0.1154782, 1.875772, 0.5058824, 0, 1, 1,
0.7444713, -0.6306744, 0.4882179, 0.5137255, 0, 1, 1,
0.74653, 1.182781, 1.466917, 0.5176471, 0, 1, 1,
0.7486669, 0.5569014, 1.71761, 0.5254902, 0, 1, 1,
0.7515886, -0.8350456, 2.588739, 0.5294118, 0, 1, 1,
0.7520303, 1.42218, -0.6538004, 0.5372549, 0, 1, 1,
0.7528801, -0.03658887, 1.662082, 0.5411765, 0, 1, 1,
0.7538689, -0.05372716, 2.623943, 0.5490196, 0, 1, 1,
0.7550946, -0.1291343, 1.68746, 0.5529412, 0, 1, 1,
0.765109, -0.3101377, 2.363467, 0.5607843, 0, 1, 1,
0.7706543, 0.5728974, 0.5176663, 0.5647059, 0, 1, 1,
0.7723767, -0.6283535, -0.3142076, 0.572549, 0, 1, 1,
0.7739536, 1.834025, -0.2144981, 0.5764706, 0, 1, 1,
0.7930964, -0.8333094, 3.021548, 0.5843138, 0, 1, 1,
0.8048086, 1.305081, -1.220878, 0.5882353, 0, 1, 1,
0.8086295, -1.155643, 3.551615, 0.5960785, 0, 1, 1,
0.8102089, -0.5865565, 0.6076394, 0.6039216, 0, 1, 1,
0.8106465, 2.459487, 0.5451562, 0.6078432, 0, 1, 1,
0.8156628, 0.3675909, 1.570973, 0.6156863, 0, 1, 1,
0.8181596, 0.877272, 1.839465, 0.6196079, 0, 1, 1,
0.8201901, 0.5369158, 0.9053493, 0.627451, 0, 1, 1,
0.8209819, -0.01243795, -1.045183, 0.6313726, 0, 1, 1,
0.8312258, 0.01053125, 1.949252, 0.6392157, 0, 1, 1,
0.8397886, 0.6431649, -0.5965693, 0.6431373, 0, 1, 1,
0.8414686, -1.1581, 3.229579, 0.6509804, 0, 1, 1,
0.8434812, 0.6964805, 0.6895039, 0.654902, 0, 1, 1,
0.8435951, 0.4647325, 0.9580643, 0.6627451, 0, 1, 1,
0.844625, 1.331806, 1.583642, 0.6666667, 0, 1, 1,
0.8457827, -3.330644, 1.603625, 0.6745098, 0, 1, 1,
0.8502582, -0.2233136, 4.240815, 0.6784314, 0, 1, 1,
0.8516176, 0.3116168, 1.375149, 0.6862745, 0, 1, 1,
0.8532531, 0.3392839, 2.0126, 0.6901961, 0, 1, 1,
0.8538086, -0.6344852, 3.338768, 0.6980392, 0, 1, 1,
0.8687741, -0.08130627, 2.728324, 0.7058824, 0, 1, 1,
0.8698446, -0.04652436, 3.24832, 0.7098039, 0, 1, 1,
0.8762135, 1.12112, -0.2536885, 0.7176471, 0, 1, 1,
0.8839132, 2.005932, 0.3826976, 0.7215686, 0, 1, 1,
0.8852215, -1.923286, 2.089465, 0.7294118, 0, 1, 1,
0.8887406, -0.0136033, 2.537422, 0.7333333, 0, 1, 1,
0.8903509, -0.2823466, 2.577111, 0.7411765, 0, 1, 1,
0.8937607, -0.01805014, 0.8450854, 0.7450981, 0, 1, 1,
0.8984568, -1.021033, 1.903592, 0.7529412, 0, 1, 1,
0.9036118, -0.1844081, 3.03296, 0.7568628, 0, 1, 1,
0.9054202, 2.640886, 0.1878657, 0.7647059, 0, 1, 1,
0.9061038, -0.9654995, 2.347157, 0.7686275, 0, 1, 1,
0.9084437, -1.18645, 2.199302, 0.7764706, 0, 1, 1,
0.9160448, -2.632747, 2.095315, 0.7803922, 0, 1, 1,
0.9256412, 0.6595507, 1.406143, 0.7882353, 0, 1, 1,
0.9324503, -0.5547161, 3.404166, 0.7921569, 0, 1, 1,
0.9341673, -0.8538561, 2.718688, 0.8, 0, 1, 1,
0.9364752, -1.57914, 3.005486, 0.8078431, 0, 1, 1,
0.9382007, 1.810692, -0.3903168, 0.8117647, 0, 1, 1,
0.9431275, 0.906553, 1.496617, 0.8196079, 0, 1, 1,
0.9437205, 0.1383495, 1.883474, 0.8235294, 0, 1, 1,
0.9509244, 1.214572, -0.3636614, 0.8313726, 0, 1, 1,
0.9620504, -0.02393208, 0.9213939, 0.8352941, 0, 1, 1,
0.9621054, -0.06472634, 1.55976, 0.8431373, 0, 1, 1,
0.9642385, -0.6484325, 3.522846, 0.8470588, 0, 1, 1,
0.9659069, -0.08908049, 1.558418, 0.854902, 0, 1, 1,
0.9721313, -0.8522017, 0.8665307, 0.8588235, 0, 1, 1,
0.976499, 1.454212, 2.310753, 0.8666667, 0, 1, 1,
0.9771655, 0.7401792, 0.3528142, 0.8705882, 0, 1, 1,
0.9795943, -0.5768297, 3.054734, 0.8784314, 0, 1, 1,
0.9800518, -1.144091, 1.482591, 0.8823529, 0, 1, 1,
0.9906338, -0.03752671, 2.8694, 0.8901961, 0, 1, 1,
0.9915943, -0.6921316, 1.179729, 0.8941177, 0, 1, 1,
0.9958289, 2.020961, -0.6790208, 0.9019608, 0, 1, 1,
0.9969605, -0.1902822, 1.215165, 0.9098039, 0, 1, 1,
1.001634, -0.9248336, 1.073913, 0.9137255, 0, 1, 1,
1.003271, -0.3120633, 1.553407, 0.9215686, 0, 1, 1,
1.004714, 0.4784505, 0.07752047, 0.9254902, 0, 1, 1,
1.006908, 1.844024, 1.325267, 0.9333333, 0, 1, 1,
1.008997, -0.7581784, 2.936951, 0.9372549, 0, 1, 1,
1.01707, -0.2449307, 2.273569, 0.945098, 0, 1, 1,
1.018473, -1.855709, 2.589736, 0.9490196, 0, 1, 1,
1.019047, 1.463009, -0.07654229, 0.9568627, 0, 1, 1,
1.024931, 0.6055117, 1.540919, 0.9607843, 0, 1, 1,
1.027731, -0.9949053, 1.686762, 0.9686275, 0, 1, 1,
1.029378, -1.00725, 2.431591, 0.972549, 0, 1, 1,
1.036686, 0.07600671, 1.09375, 0.9803922, 0, 1, 1,
1.041495, 0.5478285, 2.609896, 0.9843137, 0, 1, 1,
1.042352, -0.6254985, 3.64636, 0.9921569, 0, 1, 1,
1.045135, -0.2142208, 2.572896, 0.9960784, 0, 1, 1,
1.053561, 1.702141, -0.0346589, 1, 0, 0.9960784, 1,
1.059197, 0.3136676, 2.44601, 1, 0, 0.9882353, 1,
1.073181, 1.251684, -1.657838, 1, 0, 0.9843137, 1,
1.073435, -1.08432, 2.003653, 1, 0, 0.9764706, 1,
1.076505, -0.4992974, 0.8647286, 1, 0, 0.972549, 1,
1.076833, 1.206633, 1.154143, 1, 0, 0.9647059, 1,
1.087551, -0.7803975, 2.444022, 1, 0, 0.9607843, 1,
1.08885, -1.099808, 1.003643, 1, 0, 0.9529412, 1,
1.0899, -0.3282356, 2.332039, 1, 0, 0.9490196, 1,
1.09143, 0.2738933, 1.519215, 1, 0, 0.9411765, 1,
1.0958, 2.466563, -0.3762532, 1, 0, 0.9372549, 1,
1.097393, -0.02064338, 0.1043728, 1, 0, 0.9294118, 1,
1.104312, -0.4766574, 2.37066, 1, 0, 0.9254902, 1,
1.109686, 1.114279, -0.1047182, 1, 0, 0.9176471, 1,
1.110345, 0.4245443, -0.6353317, 1, 0, 0.9137255, 1,
1.111258, -0.1925618, 2.560856, 1, 0, 0.9058824, 1,
1.117013, -0.3564248, 2.403574, 1, 0, 0.9019608, 1,
1.117969, 0.623712, 1.037136, 1, 0, 0.8941177, 1,
1.131732, 0.3521549, 1.150882, 1, 0, 0.8862745, 1,
1.132949, -2.384307, 4.341711, 1, 0, 0.8823529, 1,
1.13495, 1.897913, -0.06515623, 1, 0, 0.8745098, 1,
1.136069, -0.6484488, 3.238899, 1, 0, 0.8705882, 1,
1.146769, -1.144381, 1.527576, 1, 0, 0.8627451, 1,
1.149139, 1.312705, 1.460532, 1, 0, 0.8588235, 1,
1.156413, 1.584865, 1.050655, 1, 0, 0.8509804, 1,
1.157426, 0.1041998, 2.262471, 1, 0, 0.8470588, 1,
1.165762, -0.2330337, 2.481986, 1, 0, 0.8392157, 1,
1.167334, 1.798218, 0.3517876, 1, 0, 0.8352941, 1,
1.173046, -1.132426, 3.506052, 1, 0, 0.827451, 1,
1.177295, -0.4069794, 1.667179, 1, 0, 0.8235294, 1,
1.177798, 1.318982, 3.342843, 1, 0, 0.8156863, 1,
1.183765, 1.476239, 0.5064784, 1, 0, 0.8117647, 1,
1.195539, -1.473078, 0.7980462, 1, 0, 0.8039216, 1,
1.198532, -1.211366, 1.151021, 1, 0, 0.7960784, 1,
1.198638, 0.986882, -0.3931386, 1, 0, 0.7921569, 1,
1.200988, -1.103593, 3.247033, 1, 0, 0.7843137, 1,
1.202865, -0.6428573, -0.3256996, 1, 0, 0.7803922, 1,
1.20665, 0.7539749, 1.852523, 1, 0, 0.772549, 1,
1.208031, 0.3094023, -0.2240369, 1, 0, 0.7686275, 1,
1.21303, -0.8978164, 3.79591, 1, 0, 0.7607843, 1,
1.217491, -0.3856614, 2.514945, 1, 0, 0.7568628, 1,
1.24309, -1.534899, 0.3053346, 1, 0, 0.7490196, 1,
1.247293, -0.5009987, 2.262082, 1, 0, 0.7450981, 1,
1.252864, 1.076703, 1.791715, 1, 0, 0.7372549, 1,
1.25913, -0.7377968, 1.249434, 1, 0, 0.7333333, 1,
1.261819, 1.084424, -1.360135, 1, 0, 0.7254902, 1,
1.271781, -0.6000677, 1.487002, 1, 0, 0.7215686, 1,
1.273272, -0.1004349, 1.988236, 1, 0, 0.7137255, 1,
1.278025, -0.7809539, 3.397693, 1, 0, 0.7098039, 1,
1.291142, 0.535933, 1.052564, 1, 0, 0.7019608, 1,
1.295886, 0.1667006, 1.210368, 1, 0, 0.6941177, 1,
1.30009, -0.7512507, 3.823309, 1, 0, 0.6901961, 1,
1.300403, 1.069039, 0.5266856, 1, 0, 0.682353, 1,
1.304467, 1.581971, 0.7491776, 1, 0, 0.6784314, 1,
1.305009, 0.6638803, 0.9313552, 1, 0, 0.6705883, 1,
1.310855, 0.6985375, 0.01378818, 1, 0, 0.6666667, 1,
1.314837, -0.9587108, 1.264135, 1, 0, 0.6588235, 1,
1.317066, 0.4955994, 0.9699144, 1, 0, 0.654902, 1,
1.319166, -1.290025, 2.853793, 1, 0, 0.6470588, 1,
1.321388, 2.368731, -0.4750885, 1, 0, 0.6431373, 1,
1.321793, 1.193526, -1.124256, 1, 0, 0.6352941, 1,
1.327331, -0.7097989, 4.226664, 1, 0, 0.6313726, 1,
1.339301, -0.6812688, 2.855843, 1, 0, 0.6235294, 1,
1.34856, 1.804521, 2.140341, 1, 0, 0.6196079, 1,
1.349154, 0.7691996, 0.7574589, 1, 0, 0.6117647, 1,
1.360512, 0.8160134, 1.516316, 1, 0, 0.6078432, 1,
1.369668, 0.5599157, 1.003686, 1, 0, 0.6, 1,
1.371053, 0.4233448, -0.07987546, 1, 0, 0.5921569, 1,
1.37201, -0.07019427, 1.490472, 1, 0, 0.5882353, 1,
1.372223, 0.05589966, -0.7988133, 1, 0, 0.5803922, 1,
1.37383, 0.1922358, 2.160089, 1, 0, 0.5764706, 1,
1.385712, 0.6170484, 0.8162345, 1, 0, 0.5686275, 1,
1.388854, -0.734045, 1.731482, 1, 0, 0.5647059, 1,
1.393128, 0.6310731, 2.017628, 1, 0, 0.5568628, 1,
1.39603, -0.9080818, 2.706257, 1, 0, 0.5529412, 1,
1.39944, 0.4277411, 2.403233, 1, 0, 0.5450981, 1,
1.401054, 1.027516, 0.2237452, 1, 0, 0.5411765, 1,
1.401121, -0.8090863, 2.384678, 1, 0, 0.5333334, 1,
1.408275, -2.337491, 1.428113, 1, 0, 0.5294118, 1,
1.413059, 0.8420189, 1.110107, 1, 0, 0.5215687, 1,
1.413876, 0.7846617, -1.31792, 1, 0, 0.5176471, 1,
1.41466, -1.842902, 1.994647, 1, 0, 0.509804, 1,
1.421118, -0.8638915, 2.815036, 1, 0, 0.5058824, 1,
1.430524, -0.3384703, 2.314092, 1, 0, 0.4980392, 1,
1.435648, -0.1716287, 1.949955, 1, 0, 0.4901961, 1,
1.444623, 1.56162, 1.088471, 1, 0, 0.4862745, 1,
1.446343, 0.8760089, 0.6668559, 1, 0, 0.4784314, 1,
1.464081, -0.725933, 0.07266848, 1, 0, 0.4745098, 1,
1.479556, 0.03478554, 1.316899, 1, 0, 0.4666667, 1,
1.485103, -1.148613, 1.239184, 1, 0, 0.4627451, 1,
1.517492, -0.9752999, 1.560141, 1, 0, 0.454902, 1,
1.52201, -1.438178, 3.477321, 1, 0, 0.4509804, 1,
1.527382, 0.8439223, 1.260032, 1, 0, 0.4431373, 1,
1.53129, -0.2351254, 3.409266, 1, 0, 0.4392157, 1,
1.532758, -0.2483346, 2.941703, 1, 0, 0.4313726, 1,
1.539356, -0.2779979, 1.794948, 1, 0, 0.427451, 1,
1.541719, -0.1557874, 3.26527, 1, 0, 0.4196078, 1,
1.559655, -1.141258, 3.019183, 1, 0, 0.4156863, 1,
1.563579, 0.9491256, 2.125716, 1, 0, 0.4078431, 1,
1.565722, -1.002389, 1.746483, 1, 0, 0.4039216, 1,
1.573598, -1.136804, 2.707922, 1, 0, 0.3960784, 1,
1.595503, 0.5631395, 2.463786, 1, 0, 0.3882353, 1,
1.597494, 1.73177, -0.5911661, 1, 0, 0.3843137, 1,
1.598335, -0.4143206, 1.896247, 1, 0, 0.3764706, 1,
1.599252, -0.6154814, 2.494068, 1, 0, 0.372549, 1,
1.615136, -0.9201736, 3.440258, 1, 0, 0.3647059, 1,
1.64463, 0.2679168, 2.359027, 1, 0, 0.3607843, 1,
1.644814, -0.692684, 0.5051478, 1, 0, 0.3529412, 1,
1.649363, -2.058706, 2.39386, 1, 0, 0.3490196, 1,
1.660265, -1.272456, 1.97777, 1, 0, 0.3411765, 1,
1.668749, 1.037275, 0.3884627, 1, 0, 0.3372549, 1,
1.669047, -0.4949718, 2.770768, 1, 0, 0.3294118, 1,
1.676311, -0.03533207, 3.008052, 1, 0, 0.3254902, 1,
1.681498, 0.6055139, 2.637705, 1, 0, 0.3176471, 1,
1.684844, -0.7006716, 1.824459, 1, 0, 0.3137255, 1,
1.689616, -0.2993589, 2.592853, 1, 0, 0.3058824, 1,
1.705185, -1.506005, 2.755356, 1, 0, 0.2980392, 1,
1.710636, -0.1110997, 3.749053, 1, 0, 0.2941177, 1,
1.726307, -1.311762, 3.525066, 1, 0, 0.2862745, 1,
1.729666, -0.1249853, 1.758738, 1, 0, 0.282353, 1,
1.741494, 0.4486392, 4.144121, 1, 0, 0.2745098, 1,
1.753557, -0.1262671, 0.4349293, 1, 0, 0.2705882, 1,
1.761468, -2.406465, 4.248341, 1, 0, 0.2627451, 1,
1.774168, 1.219563, 0.02533665, 1, 0, 0.2588235, 1,
1.774261, 0.5666411, 2.460151, 1, 0, 0.2509804, 1,
1.775948, -0.4161231, -0.1479146, 1, 0, 0.2470588, 1,
1.77595, -0.01833824, 4.033074, 1, 0, 0.2392157, 1,
1.788625, 0.07600066, 1.302879, 1, 0, 0.2352941, 1,
1.805938, 0.8968261, 0.9034401, 1, 0, 0.227451, 1,
1.806136, 1.093367, -0.1391462, 1, 0, 0.2235294, 1,
1.820534, -0.1742653, 2.101206, 1, 0, 0.2156863, 1,
1.84479, 0.8486044, 0.3792313, 1, 0, 0.2117647, 1,
1.869031, -0.507059, 0.6698771, 1, 0, 0.2039216, 1,
1.888354, 0.554472, 3.220525, 1, 0, 0.1960784, 1,
1.89561, 0.3823967, 0.4310757, 1, 0, 0.1921569, 1,
1.896974, 0.05212715, -0.0117774, 1, 0, 0.1843137, 1,
1.916218, -0.2900923, 2.379169, 1, 0, 0.1803922, 1,
1.948019, -0.3405098, 1.235517, 1, 0, 0.172549, 1,
1.95698, 0.4100825, 1.75636, 1, 0, 0.1686275, 1,
1.958979, -0.3409696, 1.412923, 1, 0, 0.1607843, 1,
1.969157, 1.224984, 1.923165, 1, 0, 0.1568628, 1,
1.973449, -0.196085, 4.205163, 1, 0, 0.1490196, 1,
1.983524, -0.8081763, 1.786951, 1, 0, 0.145098, 1,
1.988958, -1.293131, 1.559108, 1, 0, 0.1372549, 1,
1.992778, 1.234134, -0.7802212, 1, 0, 0.1333333, 1,
1.995907, -0.2997184, 0.6272317, 1, 0, 0.1254902, 1,
2.008076, 2.165881, 0.3980331, 1, 0, 0.1215686, 1,
2.028453, -0.03365634, 0.8289777, 1, 0, 0.1137255, 1,
2.032169, 0.1916793, 3.440003, 1, 0, 0.1098039, 1,
2.162448, 1.182349, 2.100245, 1, 0, 0.1019608, 1,
2.176202, 0.4706575, 1.651206, 1, 0, 0.09411765, 1,
2.201616, 0.4080855, 1.743686, 1, 0, 0.09019608, 1,
2.242902, -0.3052581, 0.5602757, 1, 0, 0.08235294, 1,
2.293424, -1.606909, 3.470035, 1, 0, 0.07843138, 1,
2.308234, 0.6727746, 0.9103103, 1, 0, 0.07058824, 1,
2.360575, 1.048823, 1.773428, 1, 0, 0.06666667, 1,
2.441481, 0.2382362, 2.984566, 1, 0, 0.05882353, 1,
2.507823, -2.001625, 3.543457, 1, 0, 0.05490196, 1,
2.536005, 1.851869, 1.506389, 1, 0, 0.04705882, 1,
2.583822, -0.3496124, 1.675719, 1, 0, 0.04313726, 1,
3.031005, 0.2621586, 2.775003, 1, 0, 0.03529412, 1,
3.285766, 0.9257612, 2.181403, 1, 0, 0.03137255, 1,
3.328799, -1.223644, 3.601113, 1, 0, 0.02352941, 1,
3.354566, 0.3684244, 2.353949, 1, 0, 0.01960784, 1,
3.371711, 0.03476591, 2.224584, 1, 0, 0.01176471, 1,
3.767565, -0.5373598, 1.198655, 1, 0, 0.007843138, 1
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
0.3615092, -4.428789, -8.237642, 0, -0.5, 0.5, 0.5,
0.3615092, -4.428789, -8.237642, 1, -0.5, 0.5, 0.5,
0.3615092, -4.428789, -8.237642, 1, 1.5, 0.5, 0.5,
0.3615092, -4.428789, -8.237642, 0, 1.5, 0.5, 0.5
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
-4.1992, -0.09127903, -8.237642, 0, -0.5, 0.5, 0.5,
-4.1992, -0.09127903, -8.237642, 1, -0.5, 0.5, 0.5,
-4.1992, -0.09127903, -8.237642, 1, 1.5, 0.5, 0.5,
-4.1992, -0.09127903, -8.237642, 0, 1.5, 0.5, 0.5
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
-4.1992, -4.428789, -0.8370419, 0, -0.5, 0.5, 0.5,
-4.1992, -4.428789, -0.8370419, 1, -0.5, 0.5, 0.5,
-4.1992, -4.428789, -0.8370419, 1, 1.5, 0.5, 0.5,
-4.1992, -4.428789, -0.8370419, 0, 1.5, 0.5, 0.5
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
-3, -3.427825, -6.529811,
3, -3.427825, -6.529811,
-3, -3.427825, -6.529811,
-3, -3.594653, -6.81445,
-2, -3.427825, -6.529811,
-2, -3.594653, -6.81445,
-1, -3.427825, -6.529811,
-1, -3.594653, -6.81445,
0, -3.427825, -6.529811,
0, -3.594653, -6.81445,
1, -3.427825, -6.529811,
1, -3.594653, -6.81445,
2, -3.427825, -6.529811,
2, -3.594653, -6.81445,
3, -3.427825, -6.529811,
3, -3.594653, -6.81445
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
-3, -3.928307, -7.383727, 0, -0.5, 0.5, 0.5,
-3, -3.928307, -7.383727, 1, -0.5, 0.5, 0.5,
-3, -3.928307, -7.383727, 1, 1.5, 0.5, 0.5,
-3, -3.928307, -7.383727, 0, 1.5, 0.5, 0.5,
-2, -3.928307, -7.383727, 0, -0.5, 0.5, 0.5,
-2, -3.928307, -7.383727, 1, -0.5, 0.5, 0.5,
-2, -3.928307, -7.383727, 1, 1.5, 0.5, 0.5,
-2, -3.928307, -7.383727, 0, 1.5, 0.5, 0.5,
-1, -3.928307, -7.383727, 0, -0.5, 0.5, 0.5,
-1, -3.928307, -7.383727, 1, -0.5, 0.5, 0.5,
-1, -3.928307, -7.383727, 1, 1.5, 0.5, 0.5,
-1, -3.928307, -7.383727, 0, 1.5, 0.5, 0.5,
0, -3.928307, -7.383727, 0, -0.5, 0.5, 0.5,
0, -3.928307, -7.383727, 1, -0.5, 0.5, 0.5,
0, -3.928307, -7.383727, 1, 1.5, 0.5, 0.5,
0, -3.928307, -7.383727, 0, 1.5, 0.5, 0.5,
1, -3.928307, -7.383727, 0, -0.5, 0.5, 0.5,
1, -3.928307, -7.383727, 1, -0.5, 0.5, 0.5,
1, -3.928307, -7.383727, 1, 1.5, 0.5, 0.5,
1, -3.928307, -7.383727, 0, 1.5, 0.5, 0.5,
2, -3.928307, -7.383727, 0, -0.5, 0.5, 0.5,
2, -3.928307, -7.383727, 1, -0.5, 0.5, 0.5,
2, -3.928307, -7.383727, 1, 1.5, 0.5, 0.5,
2, -3.928307, -7.383727, 0, 1.5, 0.5, 0.5,
3, -3.928307, -7.383727, 0, -0.5, 0.5, 0.5,
3, -3.928307, -7.383727, 1, -0.5, 0.5, 0.5,
3, -3.928307, -7.383727, 1, 1.5, 0.5, 0.5,
3, -3.928307, -7.383727, 0, 1.5, 0.5, 0.5
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
-3.146729, -3, -6.529811,
-3.146729, 3, -6.529811,
-3.146729, -3, -6.529811,
-3.322141, -3, -6.81445,
-3.146729, -2, -6.529811,
-3.322141, -2, -6.81445,
-3.146729, -1, -6.529811,
-3.322141, -1, -6.81445,
-3.146729, 0, -6.529811,
-3.322141, 0, -6.81445,
-3.146729, 1, -6.529811,
-3.322141, 1, -6.81445,
-3.146729, 2, -6.529811,
-3.322141, 2, -6.81445,
-3.146729, 3, -6.529811,
-3.322141, 3, -6.81445
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
-3.672965, -3, -7.383727, 0, -0.5, 0.5, 0.5,
-3.672965, -3, -7.383727, 1, -0.5, 0.5, 0.5,
-3.672965, -3, -7.383727, 1, 1.5, 0.5, 0.5,
-3.672965, -3, -7.383727, 0, 1.5, 0.5, 0.5,
-3.672965, -2, -7.383727, 0, -0.5, 0.5, 0.5,
-3.672965, -2, -7.383727, 1, -0.5, 0.5, 0.5,
-3.672965, -2, -7.383727, 1, 1.5, 0.5, 0.5,
-3.672965, -2, -7.383727, 0, 1.5, 0.5, 0.5,
-3.672965, -1, -7.383727, 0, -0.5, 0.5, 0.5,
-3.672965, -1, -7.383727, 1, -0.5, 0.5, 0.5,
-3.672965, -1, -7.383727, 1, 1.5, 0.5, 0.5,
-3.672965, -1, -7.383727, 0, 1.5, 0.5, 0.5,
-3.672965, 0, -7.383727, 0, -0.5, 0.5, 0.5,
-3.672965, 0, -7.383727, 1, -0.5, 0.5, 0.5,
-3.672965, 0, -7.383727, 1, 1.5, 0.5, 0.5,
-3.672965, 0, -7.383727, 0, 1.5, 0.5, 0.5,
-3.672965, 1, -7.383727, 0, -0.5, 0.5, 0.5,
-3.672965, 1, -7.383727, 1, -0.5, 0.5, 0.5,
-3.672965, 1, -7.383727, 1, 1.5, 0.5, 0.5,
-3.672965, 1, -7.383727, 0, 1.5, 0.5, 0.5,
-3.672965, 2, -7.383727, 0, -0.5, 0.5, 0.5,
-3.672965, 2, -7.383727, 1, -0.5, 0.5, 0.5,
-3.672965, 2, -7.383727, 1, 1.5, 0.5, 0.5,
-3.672965, 2, -7.383727, 0, 1.5, 0.5, 0.5,
-3.672965, 3, -7.383727, 0, -0.5, 0.5, 0.5,
-3.672965, 3, -7.383727, 1, -0.5, 0.5, 0.5,
-3.672965, 3, -7.383727, 1, 1.5, 0.5, 0.5,
-3.672965, 3, -7.383727, 0, 1.5, 0.5, 0.5
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
-3.146729, -3.427825, -6,
-3.146729, -3.427825, 4,
-3.146729, -3.427825, -6,
-3.322141, -3.594653, -6,
-3.146729, -3.427825, -4,
-3.322141, -3.594653, -4,
-3.146729, -3.427825, -2,
-3.322141, -3.594653, -2,
-3.146729, -3.427825, 0,
-3.322141, -3.594653, 0,
-3.146729, -3.427825, 2,
-3.322141, -3.594653, 2,
-3.146729, -3.427825, 4,
-3.322141, -3.594653, 4
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
"-6",
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
-3.672965, -3.928307, -6, 0, -0.5, 0.5, 0.5,
-3.672965, -3.928307, -6, 1, -0.5, 0.5, 0.5,
-3.672965, -3.928307, -6, 1, 1.5, 0.5, 0.5,
-3.672965, -3.928307, -6, 0, 1.5, 0.5, 0.5,
-3.672965, -3.928307, -4, 0, -0.5, 0.5, 0.5,
-3.672965, -3.928307, -4, 1, -0.5, 0.5, 0.5,
-3.672965, -3.928307, -4, 1, 1.5, 0.5, 0.5,
-3.672965, -3.928307, -4, 0, 1.5, 0.5, 0.5,
-3.672965, -3.928307, -2, 0, -0.5, 0.5, 0.5,
-3.672965, -3.928307, -2, 1, -0.5, 0.5, 0.5,
-3.672965, -3.928307, -2, 1, 1.5, 0.5, 0.5,
-3.672965, -3.928307, -2, 0, 1.5, 0.5, 0.5,
-3.672965, -3.928307, 0, 0, -0.5, 0.5, 0.5,
-3.672965, -3.928307, 0, 1, -0.5, 0.5, 0.5,
-3.672965, -3.928307, 0, 1, 1.5, 0.5, 0.5,
-3.672965, -3.928307, 0, 0, 1.5, 0.5, 0.5,
-3.672965, -3.928307, 2, 0, -0.5, 0.5, 0.5,
-3.672965, -3.928307, 2, 1, -0.5, 0.5, 0.5,
-3.672965, -3.928307, 2, 1, 1.5, 0.5, 0.5,
-3.672965, -3.928307, 2, 0, 1.5, 0.5, 0.5,
-3.672965, -3.928307, 4, 0, -0.5, 0.5, 0.5,
-3.672965, -3.928307, 4, 1, -0.5, 0.5, 0.5,
-3.672965, -3.928307, 4, 1, 1.5, 0.5, 0.5,
-3.672965, -3.928307, 4, 0, 1.5, 0.5, 0.5
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
-3.146729, -3.427825, -6.529811,
-3.146729, 3.245267, -6.529811,
-3.146729, -3.427825, 4.855728,
-3.146729, 3.245267, 4.855728,
-3.146729, -3.427825, -6.529811,
-3.146729, -3.427825, 4.855728,
-3.146729, 3.245267, -6.529811,
-3.146729, 3.245267, 4.855728,
-3.146729, -3.427825, -6.529811,
3.869747, -3.427825, -6.529811,
-3.146729, -3.427825, 4.855728,
3.869747, -3.427825, 4.855728,
-3.146729, 3.245267, -6.529811,
3.869747, 3.245267, -6.529811,
-3.146729, 3.245267, 4.855728,
3.869747, 3.245267, 4.855728,
3.869747, -3.427825, -6.529811,
3.869747, 3.245267, -6.529811,
3.869747, -3.427825, 4.855728,
3.869747, 3.245267, 4.855728,
3.869747, -3.427825, -6.529811,
3.869747, -3.427825, 4.855728,
3.869747, 3.245267, -6.529811,
3.869747, 3.245267, 4.855728
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
var radius = 7.981029;
var distance = 35.5085;
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
mvMatrix.translate( -0.3615092, 0.09127903, 0.8370419 );
mvMatrix.scale( 1.229855, 1.29314, 0.7579127 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.5085);
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
Phenylacetate<-read.table("Phenylacetate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Phenylacetate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Phenylacetate' not found
```

```r
y<-Phenylacetate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Phenylacetate' not found
```

```r
z<-Phenylacetate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Phenylacetate' not found
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
-3.044547, -1.394238, -0.9218938, 0, 0, 1, 1, 1,
-3.000845, -1.56464, -2.619779, 1, 0, 0, 1, 1,
-2.942999, 1.085152, -1.487166, 1, 0, 0, 1, 1,
-2.774491, -0.1216069, -1.337597, 1, 0, 0, 1, 1,
-2.735, 0.9827329, 0.1570818, 1, 0, 0, 1, 1,
-2.592852, 0.1696914, -0.9897588, 1, 0, 0, 1, 1,
-2.578913, 0.7267509, -2.248861, 0, 0, 0, 1, 1,
-2.515325, 0.2479937, -2.29331, 0, 0, 0, 1, 1,
-2.504614, -0.5221519, -2.356316, 0, 0, 0, 1, 1,
-2.482366, 0.2545828, -0.8823493, 0, 0, 0, 1, 1,
-2.417412, 1.83463, -0.06636167, 0, 0, 0, 1, 1,
-2.40061, -0.5253821, -0.5240132, 0, 0, 0, 1, 1,
-2.341687, -1.439036, -1.404388, 0, 0, 0, 1, 1,
-2.319861, -0.7191029, -2.220729, 1, 1, 1, 1, 1,
-2.224965, -2.172858, -2.032504, 1, 1, 1, 1, 1,
-2.192163, 1.818416, -0.2931321, 1, 1, 1, 1, 1,
-2.18001, -0.5151815, -1.168265, 1, 1, 1, 1, 1,
-2.156262, 1.410877, -0.7055637, 1, 1, 1, 1, 1,
-2.130175, 0.8467125, -1.462164, 1, 1, 1, 1, 1,
-2.082292, 1.283843, -2.035953, 1, 1, 1, 1, 1,
-2.071015, 0.3870741, -1.856569, 1, 1, 1, 1, 1,
-2.062095, 0.6785478, -2.525467, 1, 1, 1, 1, 1,
-2.046072, -0.9350904, -3.937073, 1, 1, 1, 1, 1,
-2.011947, 0.4493924, -0.851013, 1, 1, 1, 1, 1,
-2.008609, 0.1058853, -1.087685, 1, 1, 1, 1, 1,
-2.002024, -0.6835292, 0.4876486, 1, 1, 1, 1, 1,
-1.985757, -1.580529, -0.78919, 1, 1, 1, 1, 1,
-1.937373, 0.198863, -1.488973, 1, 1, 1, 1, 1,
-1.924124, -0.5510851, -0.6940545, 0, 0, 1, 1, 1,
-1.917238, 0.06475812, -2.40579, 1, 0, 0, 1, 1,
-1.916884, 0.3825036, -1.243126, 1, 0, 0, 1, 1,
-1.912715, 0.5756177, -1.510547, 1, 0, 0, 1, 1,
-1.892973, 2.099617, -0.8706052, 1, 0, 0, 1, 1,
-1.884079, -0.8180559, -0.0401432, 1, 0, 0, 1, 1,
-1.878885, 2.307502, -0.7516425, 0, 0, 0, 1, 1,
-1.863608, -0.298038, -0.8929083, 0, 0, 0, 1, 1,
-1.857306, -0.1387824, -1.06602, 0, 0, 0, 1, 1,
-1.824344, -0.527616, -1.830944, 0, 0, 0, 1, 1,
-1.807453, 1.775249, -0.718739, 0, 0, 0, 1, 1,
-1.761874, 0.2630586, -1.975977, 0, 0, 0, 1, 1,
-1.754535, 0.6199993, 0.3143316, 0, 0, 0, 1, 1,
-1.75177, 1.020866, -1.141629, 1, 1, 1, 1, 1,
-1.743351, 1.986094, -1.078538, 1, 1, 1, 1, 1,
-1.730644, -1.097856, -3.121422, 1, 1, 1, 1, 1,
-1.719604, 1.161161, -0.3515587, 1, 1, 1, 1, 1,
-1.7181, -1.414506, -1.197796, 1, 1, 1, 1, 1,
-1.713457, 0.9040651, -1.639781, 1, 1, 1, 1, 1,
-1.708064, 0.1569136, -2.165564, 1, 1, 1, 1, 1,
-1.68552, -1.655707, -1.030725, 1, 1, 1, 1, 1,
-1.669978, 0.5402817, -1.065203, 1, 1, 1, 1, 1,
-1.654638, -1.270576, -3.50709, 1, 1, 1, 1, 1,
-1.65295, -0.5401521, -0.4156806, 1, 1, 1, 1, 1,
-1.640845, -0.346152, -1.236455, 1, 1, 1, 1, 1,
-1.606106, -1.809058, -3.515984, 1, 1, 1, 1, 1,
-1.603234, 1.263485, -1.751735, 1, 1, 1, 1, 1,
-1.585487, -0.1152581, -3.459944, 1, 1, 1, 1, 1,
-1.580636, -1.523484, -1.390145, 0, 0, 1, 1, 1,
-1.564172, 1.081642, -0.762958, 1, 0, 0, 1, 1,
-1.561884, 0.884211, -0.926832, 1, 0, 0, 1, 1,
-1.56156, -1.022461, -1.543398, 1, 0, 0, 1, 1,
-1.561448, 0.2224643, -1.713944, 1, 0, 0, 1, 1,
-1.54312, -0.5420669, -1.177071, 1, 0, 0, 1, 1,
-1.540362, 0.5249969, -2.017762, 0, 0, 0, 1, 1,
-1.534522, -0.1706157, -1.935495, 0, 0, 0, 1, 1,
-1.53195, -1.041793, -2.35059, 0, 0, 0, 1, 1,
-1.524976, -0.9283708, -2.396177, 0, 0, 0, 1, 1,
-1.515107, -1.773142, -6.364003, 0, 0, 0, 1, 1,
-1.511858, -0.4072049, -2.692711, 0, 0, 0, 1, 1,
-1.509367, -1.343202, -1.243399, 0, 0, 0, 1, 1,
-1.509255, 0.4005051, -2.19147, 1, 1, 1, 1, 1,
-1.494637, 0.339116, -3.282717, 1, 1, 1, 1, 1,
-1.49247, 1.101986, -0.1947347, 1, 1, 1, 1, 1,
-1.482785, 0.4413571, -2.495327, 1, 1, 1, 1, 1,
-1.482142, 0.6451959, -1.343357, 1, 1, 1, 1, 1,
-1.481812, 1.712314, -0.3887781, 1, 1, 1, 1, 1,
-1.478013, 0.1136668, -0.5790227, 1, 1, 1, 1, 1,
-1.477241, -1.221213, -2.723946, 1, 1, 1, 1, 1,
-1.469056, -0.714669, -1.562226, 1, 1, 1, 1, 1,
-1.465055, -0.1120239, -3.424823, 1, 1, 1, 1, 1,
-1.44525, -1.641006, -3.199872, 1, 1, 1, 1, 1,
-1.438565, -0.8823066, -1.692584, 1, 1, 1, 1, 1,
-1.434745, -1.218514, -2.153015, 1, 1, 1, 1, 1,
-1.431896, 0.1765982, -1.573647, 1, 1, 1, 1, 1,
-1.423287, 0.9612097, -3.105363, 1, 1, 1, 1, 1,
-1.418318, -0.5863547, -1.908801, 0, 0, 1, 1, 1,
-1.410753, 0.7371797, -0.2107123, 1, 0, 0, 1, 1,
-1.409631, 0.2937322, -1.610453, 1, 0, 0, 1, 1,
-1.403242, -2.106912, -1.826279, 1, 0, 0, 1, 1,
-1.384102, 0.527961, 0.5225732, 1, 0, 0, 1, 1,
-1.38182, 0.008306421, -0.2248425, 1, 0, 0, 1, 1,
-1.369663, -0.269402, -1.51578, 0, 0, 0, 1, 1,
-1.367058, 0.03346351, -1.875682, 0, 0, 0, 1, 1,
-1.354016, -0.3556113, -1.704412, 0, 0, 0, 1, 1,
-1.345783, -0.4967702, -1.331863, 0, 0, 0, 1, 1,
-1.336814, -1.868811, -2.954199, 0, 0, 0, 1, 1,
-1.330508, -0.4357927, -1.851394, 0, 0, 0, 1, 1,
-1.319081, 0.2389117, -2.513998, 0, 0, 0, 1, 1,
-1.310114, -0.4985816, -1.976719, 1, 1, 1, 1, 1,
-1.307702, -0.08691756, -3.208639, 1, 1, 1, 1, 1,
-1.306084, 1.279604, -0.4595535, 1, 1, 1, 1, 1,
-1.292713, -0.7485963, -0.1356255, 1, 1, 1, 1, 1,
-1.284259, -0.1179138, -2.590842, 1, 1, 1, 1, 1,
-1.283336, 0.4952872, -0.006761846, 1, 1, 1, 1, 1,
-1.276987, 0.3292001, -0.2922691, 1, 1, 1, 1, 1,
-1.271872, -0.4977904, -2.907347, 1, 1, 1, 1, 1,
-1.267796, -1.490724, -2.316656, 1, 1, 1, 1, 1,
-1.26735, -0.1323774, -2.199124, 1, 1, 1, 1, 1,
-1.261946, -1.877825, -2.543033, 1, 1, 1, 1, 1,
-1.261551, -0.2425302, -2.28105, 1, 1, 1, 1, 1,
-1.254847, 0.1727028, -1.144265, 1, 1, 1, 1, 1,
-1.249237, -0.4435019, -1.896541, 1, 1, 1, 1, 1,
-1.246469, 0.1830297, -2.282821, 1, 1, 1, 1, 1,
-1.238071, 2.356061, 0.1644045, 0, 0, 1, 1, 1,
-1.226781, -0.02996978, -1.81979, 1, 0, 0, 1, 1,
-1.221795, -0.4423899, -1.634084, 1, 0, 0, 1, 1,
-1.219105, 0.973045, -2.006623, 1, 0, 0, 1, 1,
-1.215917, 0.01307324, -1.520236, 1, 0, 0, 1, 1,
-1.214922, -0.6404179, -2.241025, 1, 0, 0, 1, 1,
-1.212617, 0.2204644, -0.7118763, 0, 0, 0, 1, 1,
-1.207703, 0.1969468, -1.858926, 0, 0, 0, 1, 1,
-1.206243, 0.5092133, -1.099287, 0, 0, 0, 1, 1,
-1.200752, -0.7784767, -2.634288, 0, 0, 0, 1, 1,
-1.197245, -1.055744, -4.293157, 0, 0, 0, 1, 1,
-1.194634, -1.343148, -1.590892, 0, 0, 0, 1, 1,
-1.191599, -1.353636, -1.693352, 0, 0, 0, 1, 1,
-1.191337, 0.720013, -1.709665, 1, 1, 1, 1, 1,
-1.189215, 0.5573052, -0.3431305, 1, 1, 1, 1, 1,
-1.184322, -1.747776, -1.942178, 1, 1, 1, 1, 1,
-1.180221, 0.05666132, 0.5781909, 1, 1, 1, 1, 1,
-1.156223, 0.2834857, -0.8058513, 1, 1, 1, 1, 1,
-1.154615, -0.4790871, -3.4247, 1, 1, 1, 1, 1,
-1.149161, -1.735548, -1.308635, 1, 1, 1, 1, 1,
-1.149133, -1.956142, -2.785223, 1, 1, 1, 1, 1,
-1.145928, -1.728739, -1.777382, 1, 1, 1, 1, 1,
-1.142615, -0.6617795, -2.282105, 1, 1, 1, 1, 1,
-1.1417, -0.02742172, -1.784065, 1, 1, 1, 1, 1,
-1.133993, -0.4250127, -1.470965, 1, 1, 1, 1, 1,
-1.132349, -1.428016, -0.7717733, 1, 1, 1, 1, 1,
-1.120742, 0.9527432, -0.9540489, 1, 1, 1, 1, 1,
-1.12021, 1.299928, -0.3433585, 1, 1, 1, 1, 1,
-1.107683, -0.1561829, -3.831708, 0, 0, 1, 1, 1,
-1.103773, -0.8408673, -1.748369, 1, 0, 0, 1, 1,
-1.101985, 1.140442, 0.7534544, 1, 0, 0, 1, 1,
-1.093155, -1.388383, -2.814557, 1, 0, 0, 1, 1,
-1.08896, -1.270607, -2.281441, 1, 0, 0, 1, 1,
-1.083038, 0.2090177, -0.3130433, 1, 0, 0, 1, 1,
-1.082738, -0.5424903, -2.09808, 0, 0, 0, 1, 1,
-1.077923, -0.05624003, -1.419535, 0, 0, 0, 1, 1,
-1.074546, 0.9791756, -1.612024, 0, 0, 0, 1, 1,
-1.067522, 1.333058, -1.419743, 0, 0, 0, 1, 1,
-1.067492, 1.308681, -0.2116692, 0, 0, 0, 1, 1,
-1.063783, -1.434469, -3.320274, 0, 0, 0, 1, 1,
-1.063514, 0.9181385, -1.495197, 0, 0, 0, 1, 1,
-1.058578, -0.4970787, -1.817701, 1, 1, 1, 1, 1,
-1.057167, 0.184313, -0.7401664, 1, 1, 1, 1, 1,
-1.050805, -1.043939, -2.479203, 1, 1, 1, 1, 1,
-1.037501, 1.290216, 0.1758186, 1, 1, 1, 1, 1,
-1.028699, -0.5689389, -2.355053, 1, 1, 1, 1, 1,
-1.021976, -0.3805894, -2.159864, 1, 1, 1, 1, 1,
-1.015126, -1.577307, -4.442356, 1, 1, 1, 1, 1,
-1.009862, -0.3774549, -3.356391, 1, 1, 1, 1, 1,
-1.005184, -0.6944932, -3.978904, 1, 1, 1, 1, 1,
-1.002775, 0.7122195, -0.3909789, 1, 1, 1, 1, 1,
-0.9959562, -0.8449968, -1.941213, 1, 1, 1, 1, 1,
-0.9906934, -2.102532, -2.330298, 1, 1, 1, 1, 1,
-0.9847394, -0.1511658, -1.41243, 1, 1, 1, 1, 1,
-0.9814948, -1.208332, -0.1118098, 1, 1, 1, 1, 1,
-0.9749756, -0.3013129, -2.680003, 1, 1, 1, 1, 1,
-0.9736899, 2.035037, -1.853851, 0, 0, 1, 1, 1,
-0.9723699, -0.4015051, -3.43561, 1, 0, 0, 1, 1,
-0.9625334, 1.824722, -2.104486, 1, 0, 0, 1, 1,
-0.9621019, -0.3525597, -3.031518, 1, 0, 0, 1, 1,
-0.946653, -1.363457, -1.801236, 1, 0, 0, 1, 1,
-0.9434307, -0.8407292, -1.864139, 1, 0, 0, 1, 1,
-0.9369667, -0.5627978, -2.001276, 0, 0, 0, 1, 1,
-0.9334849, 1.180114, -2.082361, 0, 0, 0, 1, 1,
-0.9327138, -0.4817685, -1.542384, 0, 0, 0, 1, 1,
-0.9311084, -0.5044639, -1.482219, 0, 0, 0, 1, 1,
-0.923969, 0.1488492, -0.3428877, 0, 0, 0, 1, 1,
-0.9229181, -0.66, -2.506264, 0, 0, 0, 1, 1,
-0.9192514, -0.7176318, -3.382562, 0, 0, 0, 1, 1,
-0.9191927, 0.117509, -1.369576, 1, 1, 1, 1, 1,
-0.9173667, -1.153737, -1.803598, 1, 1, 1, 1, 1,
-0.9171922, 0.4395119, -0.7441428, 1, 1, 1, 1, 1,
-0.9143813, -0.4345672, -3.388799, 1, 1, 1, 1, 1,
-0.909719, 1.728352, -1.728456, 1, 1, 1, 1, 1,
-0.9079964, 1.911207, 1.249972, 1, 1, 1, 1, 1,
-0.9002164, -1.761202, -4.715061, 1, 1, 1, 1, 1,
-0.8953163, -0.8448871, -3.126778, 1, 1, 1, 1, 1,
-0.8938673, -0.557502, -1.303133, 1, 1, 1, 1, 1,
-0.8910042, 0.2586398, -2.259358, 1, 1, 1, 1, 1,
-0.8903475, -0.1738649, -0.8104086, 1, 1, 1, 1, 1,
-0.881727, 0.3172126, -1.886268, 1, 1, 1, 1, 1,
-0.8797749, -1.338658, -2.590131, 1, 1, 1, 1, 1,
-0.8780121, -0.007331098, -0.3177089, 1, 1, 1, 1, 1,
-0.8678195, -0.5575312, -0.8446078, 1, 1, 1, 1, 1,
-0.8662393, 1.457926, -1.859607, 0, 0, 1, 1, 1,
-0.8613129, 0.1975519, -2.871632, 1, 0, 0, 1, 1,
-0.8597385, 0.4201208, 0.4605327, 1, 0, 0, 1, 1,
-0.8570533, 1.181229, 0.08687967, 1, 0, 0, 1, 1,
-0.8500157, -1.08744, -1.227522, 1, 0, 0, 1, 1,
-0.8439404, 0.7991433, -1.569613, 1, 0, 0, 1, 1,
-0.8310801, -1.271546, -4.05761, 0, 0, 0, 1, 1,
-0.8255702, 0.3991211, -1.991732, 0, 0, 0, 1, 1,
-0.8216409, -0.1811741, -2.49121, 0, 0, 0, 1, 1,
-0.8198364, 0.9608775, -0.3321812, 0, 0, 0, 1, 1,
-0.8183787, -0.06059155, -2.388791, 0, 0, 0, 1, 1,
-0.8162749, -0.1051817, -0.4251529, 0, 0, 0, 1, 1,
-0.8120406, 0.08915351, -0.5868044, 0, 0, 0, 1, 1,
-0.8109516, 0.455476, -1.486828, 1, 1, 1, 1, 1,
-0.8102413, -0.1344146, -3.287625, 1, 1, 1, 1, 1,
-0.8047608, 0.1337219, 0.692153, 1, 1, 1, 1, 1,
-0.8028187, -0.2022737, -1.148492, 1, 1, 1, 1, 1,
-0.8027216, -0.1895767, -3.20914, 1, 1, 1, 1, 1,
-0.8014053, -0.3617859, -2.303257, 1, 1, 1, 1, 1,
-0.7972768, -0.5919075, -0.9628925, 1, 1, 1, 1, 1,
-0.7972454, 0.8190404, -1.493103, 1, 1, 1, 1, 1,
-0.7964914, -1.268225, -3.118441, 1, 1, 1, 1, 1,
-0.7942208, 0.3096707, -1.874983, 1, 1, 1, 1, 1,
-0.7902269, 0.09078939, -2.816494, 1, 1, 1, 1, 1,
-0.7861733, -0.7665637, -1.101289, 1, 1, 1, 1, 1,
-0.7840216, 0.7871968, -0.5972584, 1, 1, 1, 1, 1,
-0.7829714, -0.2396592, -1.679703, 1, 1, 1, 1, 1,
-0.7819512, 0.1905757, -1.671511, 1, 1, 1, 1, 1,
-0.7807485, -0.06681421, 0.1060568, 0, 0, 1, 1, 1,
-0.7728204, 0.3493784, -1.719331, 1, 0, 0, 1, 1,
-0.7716714, -0.7930965, -2.344014, 1, 0, 0, 1, 1,
-0.7708783, 0.2816882, -1.053983, 1, 0, 0, 1, 1,
-0.7704852, 0.2177034, -2.125245, 1, 0, 0, 1, 1,
-0.7703323, 0.2665626, -1.515424, 1, 0, 0, 1, 1,
-0.7697575, 0.2505296, -0.8526475, 0, 0, 0, 1, 1,
-0.7619352, -1.427312, -4.953264, 0, 0, 0, 1, 1,
-0.7593774, 1.769557, -0.6988146, 0, 0, 0, 1, 1,
-0.754059, -0.9527728, -2.859895, 0, 0, 0, 1, 1,
-0.7533153, 0.9375077, -1.862189, 0, 0, 0, 1, 1,
-0.7529612, 0.07516853, -1.008167, 0, 0, 0, 1, 1,
-0.746878, 0.3645993, -1.833945, 0, 0, 0, 1, 1,
-0.7363421, 1.496938, -0.4235233, 1, 1, 1, 1, 1,
-0.7329447, 0.870948, -0.7549787, 1, 1, 1, 1, 1,
-0.7258336, 0.9567289, -0.9606526, 1, 1, 1, 1, 1,
-0.7219104, 1.02048, 0.42595, 1, 1, 1, 1, 1,
-0.7160733, -0.8437669, -2.458311, 1, 1, 1, 1, 1,
-0.711315, -1.025304, -3.105559, 1, 1, 1, 1, 1,
-0.7070711, -0.01275899, -1.585283, 1, 1, 1, 1, 1,
-0.6983468, -1.416137, -1.461824, 1, 1, 1, 1, 1,
-0.6920466, 0.08527972, -0.7557682, 1, 1, 1, 1, 1,
-0.6826774, -0.5498608, -0.4345916, 1, 1, 1, 1, 1,
-0.6817786, 0.9455988, -1.509971, 1, 1, 1, 1, 1,
-0.6725204, 0.8406719, 0.3323193, 1, 1, 1, 1, 1,
-0.6716078, -1.569172, -2.239138, 1, 1, 1, 1, 1,
-0.6703388, -1.85881, -4.579909, 1, 1, 1, 1, 1,
-0.6646662, 0.4268773, -1.223409, 1, 1, 1, 1, 1,
-0.659695, 0.04738092, -3.671724, 0, 0, 1, 1, 1,
-0.6561753, 2.57627, -0.640728, 1, 0, 0, 1, 1,
-0.6549178, -0.08810232, -2.683535, 1, 0, 0, 1, 1,
-0.6537405, -1.728793, -3.212936, 1, 0, 0, 1, 1,
-0.6530196, 0.1348568, -2.132746, 1, 0, 0, 1, 1,
-0.6495127, 0.2571106, -0.388278, 1, 0, 0, 1, 1,
-0.6434805, 0.6250188, -1.825813, 0, 0, 0, 1, 1,
-0.6396782, 0.7917861, -0.3745004, 0, 0, 0, 1, 1,
-0.6390919, 2.218793, -0.6533508, 0, 0, 0, 1, 1,
-0.6383005, 0.5175652, -1.790557, 0, 0, 0, 1, 1,
-0.6363726, -0.7389085, -2.056159, 0, 0, 0, 1, 1,
-0.6353397, 0.6163167, -3.119903, 0, 0, 0, 1, 1,
-0.6343242, -1.320737, -3.923461, 0, 0, 0, 1, 1,
-0.6309337, -1.230972, -0.4142524, 1, 1, 1, 1, 1,
-0.6240352, -0.8495166, -3.77831, 1, 1, 1, 1, 1,
-0.6173826, -0.8309585, -2.112198, 1, 1, 1, 1, 1,
-0.6158286, 0.2309201, -2.244363, 1, 1, 1, 1, 1,
-0.6157033, -0.4157037, -4.107251, 1, 1, 1, 1, 1,
-0.6092367, -0.312054, -1.062498, 1, 1, 1, 1, 1,
-0.6061881, -0.9597329, -3.032441, 1, 1, 1, 1, 1,
-0.5959269, -1.576205, -3.366302, 1, 1, 1, 1, 1,
-0.5929863, 1.150272, 0.7047215, 1, 1, 1, 1, 1,
-0.5904778, -0.2327296, -2.892045, 1, 1, 1, 1, 1,
-0.5853146, 1.32328, -1.118469, 1, 1, 1, 1, 1,
-0.5834081, 0.9631252, -0.5366395, 1, 1, 1, 1, 1,
-0.5798805, -1.152267, -2.918162, 1, 1, 1, 1, 1,
-0.5794266, 0.7381973, -1.203521, 1, 1, 1, 1, 1,
-0.5793876, -0.1723023, -2.433303, 1, 1, 1, 1, 1,
-0.5744272, 0.4286007, 1.656035, 0, 0, 1, 1, 1,
-0.5713196, 1.98437, 0.5500188, 1, 0, 0, 1, 1,
-0.5599138, 0.3614231, -0.374989, 1, 0, 0, 1, 1,
-0.5579066, 0.6218234, -2.402037, 1, 0, 0, 1, 1,
-0.551998, 0.3067624, -0.9911518, 1, 0, 0, 1, 1,
-0.5518966, 0.3784693, -3.584483, 1, 0, 0, 1, 1,
-0.5504811, -1.039547, -2.164243, 0, 0, 0, 1, 1,
-0.5494888, 0.2424335, -2.649748, 0, 0, 0, 1, 1,
-0.5488264, -2.681841, -3.7067, 0, 0, 0, 1, 1,
-0.5451177, -2.110197, -3.016182, 0, 0, 0, 1, 1,
-0.5428935, 3.148086, 0.955084, 0, 0, 0, 1, 1,
-0.5407825, -1.15292, -2.986861, 0, 0, 0, 1, 1,
-0.5352132, -0.8524721, -1.867539, 0, 0, 0, 1, 1,
-0.534288, 0.8907771, -0.9051962, 1, 1, 1, 1, 1,
-0.5275143, -0.4227581, -0.3466831, 1, 1, 1, 1, 1,
-0.525525, 0.3061136, -1.686445, 1, 1, 1, 1, 1,
-0.5209827, 0.7544673, -1.501648, 1, 1, 1, 1, 1,
-0.5204927, 0.7248517, -1.017748, 1, 1, 1, 1, 1,
-0.5188075, -1.204719, -3.183465, 1, 1, 1, 1, 1,
-0.5166524, 0.1015821, 0.1916652, 1, 1, 1, 1, 1,
-0.5161284, -1.373846, -2.188172, 1, 1, 1, 1, 1,
-0.5120149, -0.3093999, -1.334648, 1, 1, 1, 1, 1,
-0.4979221, 0.8219095, 0.2610204, 1, 1, 1, 1, 1,
-0.492438, 0.08883383, -2.267644, 1, 1, 1, 1, 1,
-0.4876193, 0.5813553, -1.178391, 1, 1, 1, 1, 1,
-0.4779539, 1.182055, 0.1012342, 1, 1, 1, 1, 1,
-0.4755823, -0.9660245, -2.199003, 1, 1, 1, 1, 1,
-0.4753555, 0.3043925, -2.523403, 1, 1, 1, 1, 1,
-0.4751784, 0.7542223, -1.002267, 0, 0, 1, 1, 1,
-0.4744093, -0.1244437, -3.503698, 1, 0, 0, 1, 1,
-0.4735401, 0.9558033, -1.216575, 1, 0, 0, 1, 1,
-0.4731077, 0.6405292, -3.231472, 1, 0, 0, 1, 1,
-0.4725099, -0.6187865, -1.828964, 1, 0, 0, 1, 1,
-0.4699448, -1.18373, -3.188092, 1, 0, 0, 1, 1,
-0.4679939, -0.1651479, -4.426185, 0, 0, 0, 1, 1,
-0.4638096, 0.265269, -2.571461, 0, 0, 0, 1, 1,
-0.4627641, -0.5688136, -3.56616, 0, 0, 0, 1, 1,
-0.4590661, -0.0286393, -3.533521, 0, 0, 0, 1, 1,
-0.4575876, 0.02729773, -1.66688, 0, 0, 0, 1, 1,
-0.4523439, 0.2702838, -0.1575842, 0, 0, 0, 1, 1,
-0.4504466, 1.311126, -0.2517754, 0, 0, 0, 1, 1,
-0.4470384, 1.291609, -1.544484, 1, 1, 1, 1, 1,
-0.4424874, -0.4276216, -2.594962, 1, 1, 1, 1, 1,
-0.4396661, 0.393393, 0.6451353, 1, 1, 1, 1, 1,
-0.4288037, 0.4921541, 0.2961827, 1, 1, 1, 1, 1,
-0.4236049, 1.26792, -0.4696011, 1, 1, 1, 1, 1,
-0.4235994, -1.930053, -2.079705, 1, 1, 1, 1, 1,
-0.4111731, -1.251348, -2.790139, 1, 1, 1, 1, 1,
-0.4102818, -0.2991825, -3.661473, 1, 1, 1, 1, 1,
-0.4015584, 0.22608, 0.6106123, 1, 1, 1, 1, 1,
-0.3969957, -1.669392, -1.719725, 1, 1, 1, 1, 1,
-0.3952757, -0.2322309, -2.132673, 1, 1, 1, 1, 1,
-0.3897078, -0.7898349, -3.617298, 1, 1, 1, 1, 1,
-0.3857852, -0.468866, -2.343926, 1, 1, 1, 1, 1,
-0.3846358, -0.9250136, -3.764673, 1, 1, 1, 1, 1,
-0.3831443, -0.0001643199, -0.972261, 1, 1, 1, 1, 1,
-0.3814646, -0.7691252, -2.531508, 0, 0, 1, 1, 1,
-0.3751216, 1.268472, -0.8921304, 1, 0, 0, 1, 1,
-0.373621, -0.7434387, -2.14848, 1, 0, 0, 1, 1,
-0.3727787, -2.792682, -4.508979, 1, 0, 0, 1, 1,
-0.3708483, -0.3719895, -3.498955, 1, 0, 0, 1, 1,
-0.3668154, -1.083245, -2.43652, 1, 0, 0, 1, 1,
-0.3654821, -0.07306119, -0.7505971, 0, 0, 0, 1, 1,
-0.3653833, -0.6262, -3.070244, 0, 0, 0, 1, 1,
-0.3653816, -0.3562083, -3.620505, 0, 0, 0, 1, 1,
-0.3650438, 0.4110975, -2.044771, 0, 0, 0, 1, 1,
-0.3629545, -1.561193, -2.754979, 0, 0, 0, 1, 1,
-0.3623663, 0.520776, -0.4364137, 0, 0, 0, 1, 1,
-0.3619996, -0.1020363, -2.957017, 0, 0, 0, 1, 1,
-0.361883, 0.3666375, 0.7213771, 1, 1, 1, 1, 1,
-0.3590253, -0.8985966, -1.483406, 1, 1, 1, 1, 1,
-0.3584989, -0.6375344, -2.214393, 1, 1, 1, 1, 1,
-0.3504859, -0.8160081, -2.232515, 1, 1, 1, 1, 1,
-0.3486682, 0.1259882, -1.131018, 1, 1, 1, 1, 1,
-0.3448355, 0.05030333, -0.7464717, 1, 1, 1, 1, 1,
-0.3441485, -1.35205, -3.507945, 1, 1, 1, 1, 1,
-0.3427967, -0.4378733, -4.324803, 1, 1, 1, 1, 1,
-0.3425704, -0.4666845, -2.178171, 1, 1, 1, 1, 1,
-0.3421347, -0.05893124, -0.9925022, 1, 1, 1, 1, 1,
-0.3394628, 0.6302901, -0.4941777, 1, 1, 1, 1, 1,
-0.3393799, 1.188115, -0.8852169, 1, 1, 1, 1, 1,
-0.3359196, 1.513799, -0.8240154, 1, 1, 1, 1, 1,
-0.3351871, -1.848927, -3.985369, 1, 1, 1, 1, 1,
-0.3331692, 1.926814, 0.3771715, 1, 1, 1, 1, 1,
-0.3288051, -0.1291408, -0.7517765, 0, 0, 1, 1, 1,
-0.3268064, -0.1342346, -1.420166, 1, 0, 0, 1, 1,
-0.3250873, -0.3194739, -3.319301, 1, 0, 0, 1, 1,
-0.3247505, -0.2708445, -1.808251, 1, 0, 0, 1, 1,
-0.3247356, 0.8742632, -2.207275, 1, 0, 0, 1, 1,
-0.3195218, 0.467134, -1.038791, 1, 0, 0, 1, 1,
-0.3172165, 0.4439966, -0.6817979, 0, 0, 0, 1, 1,
-0.3154442, 0.5185884, -0.4511973, 0, 0, 0, 1, 1,
-0.3124706, 0.4760828, 0.7170392, 0, 0, 0, 1, 1,
-0.3121571, -1.677993, -3.108242, 0, 0, 0, 1, 1,
-0.3113954, 0.166336, -1.522602, 0, 0, 0, 1, 1,
-0.3088475, -0.4511959, -2.489188, 0, 0, 0, 1, 1,
-0.3056763, -0.2510577, -3.101247, 0, 0, 0, 1, 1,
-0.3044348, -2.172657, -3.668455, 1, 1, 1, 1, 1,
-0.2997884, 0.8574212, -0.03584543, 1, 1, 1, 1, 1,
-0.2985978, -0.662686, -1.884717, 1, 1, 1, 1, 1,
-0.2979209, 0.4481619, 0.4819392, 1, 1, 1, 1, 1,
-0.2871879, -0.5975859, -1.783634, 1, 1, 1, 1, 1,
-0.2845964, -0.3302305, -0.5373216, 1, 1, 1, 1, 1,
-0.2845351, -0.9095179, -2.966602, 1, 1, 1, 1, 1,
-0.2845134, -1.25274, -2.875315, 1, 1, 1, 1, 1,
-0.2835704, 0.2304215, 0.679024, 1, 1, 1, 1, 1,
-0.283187, 0.5353025, 0.6324201, 1, 1, 1, 1, 1,
-0.2806949, 1.936843, -1.092883, 1, 1, 1, 1, 1,
-0.2787854, -0.3079959, -3.682502, 1, 1, 1, 1, 1,
-0.2785295, -0.4444566, -3.410264, 1, 1, 1, 1, 1,
-0.2772111, -1.194501, -2.633924, 1, 1, 1, 1, 1,
-0.2741333, 0.3365703, -0.2218962, 1, 1, 1, 1, 1,
-0.2686237, -0.3855881, -2.95044, 0, 0, 1, 1, 1,
-0.2595487, 0.998502, -0.2682042, 1, 0, 0, 1, 1,
-0.2571731, -0.9983115, -3.508645, 1, 0, 0, 1, 1,
-0.2546776, 1.534244, -0.8444054, 1, 0, 0, 1, 1,
-0.2509254, 0.4735791, -0.7146391, 1, 0, 0, 1, 1,
-0.2466356, 2.016908, -0.08023655, 1, 0, 0, 1, 1,
-0.2440575, -0.1593787, -3.107471, 0, 0, 0, 1, 1,
-0.2381369, -1.184666, -2.706587, 0, 0, 0, 1, 1,
-0.236619, -0.2848318, -2.767632, 0, 0, 0, 1, 1,
-0.2353083, 0.684676, 0.1028611, 0, 0, 0, 1, 1,
-0.2286778, 1.643392, 1.647499, 0, 0, 0, 1, 1,
-0.227032, -0.4557071, -0.7349557, 0, 0, 0, 1, 1,
-0.2269989, -1.546598, -1.510936, 0, 0, 0, 1, 1,
-0.2249993, 0.5788742, -0.4264801, 1, 1, 1, 1, 1,
-0.2239115, 0.8752852, 0.3279038, 1, 1, 1, 1, 1,
-0.2204378, -1.686252, -1.330328, 1, 1, 1, 1, 1,
-0.2136011, 1.180963, -0.9301782, 1, 1, 1, 1, 1,
-0.2103487, 1.026872, 0.07289022, 1, 1, 1, 1, 1,
-0.2098997, -0.3787646, -1.464014, 1, 1, 1, 1, 1,
-0.2078767, -0.5270066, -3.002293, 1, 1, 1, 1, 1,
-0.205552, -1.077846, -2.758809, 1, 1, 1, 1, 1,
-0.2045611, 1.331427, 0.4476627, 1, 1, 1, 1, 1,
-0.1959102, -1.060248, -3.306217, 1, 1, 1, 1, 1,
-0.1958545, -0.754706, -2.516286, 1, 1, 1, 1, 1,
-0.1947897, 0.4568337, -1.111497, 1, 1, 1, 1, 1,
-0.1925183, -0.8594696, -3.946681, 1, 1, 1, 1, 1,
-0.1920014, 0.8883268, 0.1275857, 1, 1, 1, 1, 1,
-0.1899531, 2.38983, -1.08902, 1, 1, 1, 1, 1,
-0.1886225, 2.086261, -2.904685, 0, 0, 1, 1, 1,
-0.1881183, -0.9448398, -1.597747, 1, 0, 0, 1, 1,
-0.1877553, -0.002881066, -0.1402294, 1, 0, 0, 1, 1,
-0.187125, -0.01201816, -2.316356, 1, 0, 0, 1, 1,
-0.1863113, -0.8180005, -3.0096, 1, 0, 0, 1, 1,
-0.1807017, 1.796829, 1.564149, 1, 0, 0, 1, 1,
-0.1749638, 0.9919117, 1.424359, 0, 0, 0, 1, 1,
-0.1702639, -0.2899775, -2.864701, 0, 0, 0, 1, 1,
-0.1700256, 0.2679653, 0.08341251, 0, 0, 0, 1, 1,
-0.1632639, -0.004788794, -2.311366, 0, 0, 0, 1, 1,
-0.1534677, 0.7339662, -0.4224881, 0, 0, 0, 1, 1,
-0.1503838, -0.5270828, -3.892727, 0, 0, 0, 1, 1,
-0.1486409, 0.3285294, 0.5012251, 0, 0, 0, 1, 1,
-0.1472566, -1.123441, -5.065368, 1, 1, 1, 1, 1,
-0.1471067, -0.09877678, -1.859977, 1, 1, 1, 1, 1,
-0.1460198, -0.4114659, -3.209982, 1, 1, 1, 1, 1,
-0.1428408, 1.498102, 0.3221271, 1, 1, 1, 1, 1,
-0.1392475, -0.4508774, -4.417903, 1, 1, 1, 1, 1,
-0.1387582, -1.776719, -3.054625, 1, 1, 1, 1, 1,
-0.1375892, 0.4071637, -0.4746191, 1, 1, 1, 1, 1,
-0.1375111, 0.4900437, -0.09691176, 1, 1, 1, 1, 1,
-0.1359589, 1.721228, 0.02264922, 1, 1, 1, 1, 1,
-0.1354642, -0.04533842, -1.714449, 1, 1, 1, 1, 1,
-0.1336891, -0.9937447, -3.871539, 1, 1, 1, 1, 1,
-0.1336666, -1.804758, -3.326273, 1, 1, 1, 1, 1,
-0.1332593, -1.767058, -3.597045, 1, 1, 1, 1, 1,
-0.1330383, 0.5162312, 1.390986, 1, 1, 1, 1, 1,
-0.131161, -0.2223086, -1.924496, 1, 1, 1, 1, 1,
-0.1268412, 0.01049475, -1.681976, 0, 0, 1, 1, 1,
-0.1267041, -0.3693197, -3.556755, 1, 0, 0, 1, 1,
-0.1261372, -1.346584, -4.008162, 1, 0, 0, 1, 1,
-0.1200894, 0.2263823, -1.526823, 1, 0, 0, 1, 1,
-0.1158111, 0.1112579, 0.5667145, 1, 0, 0, 1, 1,
-0.1139756, 0.3048165, -1.469902, 1, 0, 0, 1, 1,
-0.1129422, 1.056673, 1.055137, 0, 0, 0, 1, 1,
-0.1121712, -0.5517594, -5.450822, 0, 0, 0, 1, 1,
-0.1120441, -1.251825, -2.904059, 0, 0, 0, 1, 1,
-0.1105596, -0.02300294, -3.277127, 0, 0, 0, 1, 1,
-0.1090215, 1.968504, -0.7717654, 0, 0, 0, 1, 1,
-0.1086836, -0.8081961, -4.328417, 0, 0, 0, 1, 1,
-0.1081418, 1.227087, 0.2668318, 0, 0, 0, 1, 1,
-0.1065725, -0.4930524, -3.21384, 1, 1, 1, 1, 1,
-0.1044295, -0.004464764, -1.098297, 1, 1, 1, 1, 1,
-0.1007764, -0.1186157, -2.900509, 1, 1, 1, 1, 1,
-0.09122553, 2.098544, 0.4343944, 1, 1, 1, 1, 1,
-0.08674359, 0.9301646, -2.312727, 1, 1, 1, 1, 1,
-0.08633295, 0.6971326, -2.416015, 1, 1, 1, 1, 1,
-0.08589672, 0.1635037, 0.08586347, 1, 1, 1, 1, 1,
-0.08557848, -0.07064962, -1.614434, 1, 1, 1, 1, 1,
-0.08351812, 1.98305, 0.5043408, 1, 1, 1, 1, 1,
-0.08345233, -1.037517, -4.514703, 1, 1, 1, 1, 1,
-0.07822624, 1.07422, 0.461108, 1, 1, 1, 1, 1,
-0.07650547, -0.756959, -2.013015, 1, 1, 1, 1, 1,
-0.07575335, -0.7896886, -2.678607, 1, 1, 1, 1, 1,
-0.07491986, -1.733917, -3.274164, 1, 1, 1, 1, 1,
-0.07216862, 0.1863625, -0.7995625, 1, 1, 1, 1, 1,
-0.07096367, -1.039121, -4.790251, 0, 0, 1, 1, 1,
-0.0702728, -0.3164501, -2.625226, 1, 0, 0, 1, 1,
-0.07013968, 0.2346435, -0.01543773, 1, 0, 0, 1, 1,
-0.06778464, -0.7508063, -2.663578, 1, 0, 0, 1, 1,
-0.066231, -1.072887, -2.517559, 1, 0, 0, 1, 1,
-0.0661725, 1.842016, -0.3082441, 1, 0, 0, 1, 1,
-0.0643203, -1.531837, -2.989599, 0, 0, 0, 1, 1,
-0.06263744, 0.3958929, -3.162142, 0, 0, 0, 1, 1,
-0.06182628, -1.288339, -1.770955, 0, 0, 0, 1, 1,
-0.06094625, 0.4910811, 0.05811183, 0, 0, 0, 1, 1,
-0.05383585, -0.194416, -5.013701, 0, 0, 0, 1, 1,
-0.05320318, -1.206058, -3.071383, 0, 0, 0, 1, 1,
-0.0440539, -0.8442952, -3.440964, 0, 0, 0, 1, 1,
-0.04369751, 1.661902, -0.7941197, 1, 1, 1, 1, 1,
-0.04277685, 0.1345567, -0.2895502, 1, 1, 1, 1, 1,
-0.0417371, -0.3305092, -3.644076, 1, 1, 1, 1, 1,
-0.03666459, 0.1737078, 0.7236587, 1, 1, 1, 1, 1,
-0.0316325, -1.427061, -1.663993, 1, 1, 1, 1, 1,
-0.02636934, 0.8658046, 0.6038938, 1, 1, 1, 1, 1,
-0.02207038, -1.405945, -2.742074, 1, 1, 1, 1, 1,
-0.02200885, -0.9562095, -4.027235, 1, 1, 1, 1, 1,
-0.01782745, -0.01849699, -1.086018, 1, 1, 1, 1, 1,
-0.01244574, -0.1395202, -2.694629, 1, 1, 1, 1, 1,
-0.01239187, 0.2665358, 1.616531, 1, 1, 1, 1, 1,
-0.01168233, -0.02431368, -3.187489, 1, 1, 1, 1, 1,
-0.007947695, -0.6416004, -2.380815, 1, 1, 1, 1, 1,
-0.007144732, 1.308133, -0.3015279, 1, 1, 1, 1, 1,
-0.004392162, 0.1328435, -0.8503375, 1, 1, 1, 1, 1,
0.002128396, 1.222298, -2.686856, 0, 0, 1, 1, 1,
0.005050028, 1.069897, -0.7634507, 1, 0, 0, 1, 1,
0.01194773, -0.1198973, 2.315198, 1, 0, 0, 1, 1,
0.02112187, 0.8277225, 1.155214, 1, 0, 0, 1, 1,
0.0221433, 1.22695, 0.4483789, 1, 0, 0, 1, 1,
0.02597732, -0.4002534, 1.975216, 1, 0, 0, 1, 1,
0.02767023, -1.284141, 2.532308, 0, 0, 0, 1, 1,
0.03255599, 1.24347, 2.856783, 0, 0, 0, 1, 1,
0.04273181, 1.676496, -1.952271, 0, 0, 0, 1, 1,
0.04330796, 0.5343302, 0.3867881, 0, 0, 0, 1, 1,
0.05960474, 0.5364863, -0.3480151, 0, 0, 0, 1, 1,
0.06275231, -0.176571, 2.525051, 0, 0, 0, 1, 1,
0.06371072, 0.2517922, -0.6945392, 0, 0, 0, 1, 1,
0.06467547, 1.512002, 1.326502, 1, 1, 1, 1, 1,
0.0693616, -0.539694, 4.529963, 1, 1, 1, 1, 1,
0.07865202, 0.7836061, -0.8982498, 1, 1, 1, 1, 1,
0.07968982, 1.350034, -0.276696, 1, 1, 1, 1, 1,
0.08289269, 0.5953514, 0.3277748, 1, 1, 1, 1, 1,
0.08464582, 0.2409943, 0.6209652, 1, 1, 1, 1, 1,
0.08475009, -0.9998986, 3.052781, 1, 1, 1, 1, 1,
0.08498976, 1.041948, 0.08635974, 1, 1, 1, 1, 1,
0.08633976, 0.07323497, 2.142316, 1, 1, 1, 1, 1,
0.08692562, -0.479923, 2.662271, 1, 1, 1, 1, 1,
0.0871079, 1.111656, -2.830672, 1, 1, 1, 1, 1,
0.08842459, 0.6978965, -0.9613181, 1, 1, 1, 1, 1,
0.09717134, -0.5403963, 0.5952705, 1, 1, 1, 1, 1,
0.1036622, -0.09199219, 2.44877, 1, 1, 1, 1, 1,
0.1064429, 0.4888537, 1.37652, 1, 1, 1, 1, 1,
0.1083828, 1.029054, -0.8925485, 0, 0, 1, 1, 1,
0.1092621, -0.7452971, 2.495089, 1, 0, 0, 1, 1,
0.1131339, -1.010449, 2.940316, 1, 0, 0, 1, 1,
0.1142918, 0.655392, 1.899522, 1, 0, 0, 1, 1,
0.1144006, 1.355538, -0.9079736, 1, 0, 0, 1, 1,
0.1144377, 0.6457549, 0.4037547, 1, 0, 0, 1, 1,
0.1163118, 0.1633577, -0.4293969, 0, 0, 0, 1, 1,
0.1170637, 1.38807, -1.252691, 0, 0, 0, 1, 1,
0.1180905, 2.552513, 0.8117678, 0, 0, 0, 1, 1,
0.123616, 0.6530502, 0.05056478, 0, 0, 0, 1, 1,
0.1252022, -1.855817, 2.980169, 0, 0, 0, 1, 1,
0.1296849, 1.771553, -0.8353502, 0, 0, 0, 1, 1,
0.1306893, -1.002394, 2.041132, 0, 0, 0, 1, 1,
0.1313609, 1.349011, -1.462431, 1, 1, 1, 1, 1,
0.1317806, 1.145014, -0.6556885, 1, 1, 1, 1, 1,
0.1319769, -1.118404, 4.581712, 1, 1, 1, 1, 1,
0.1330132, 0.1040048, 1.611132, 1, 1, 1, 1, 1,
0.1330993, 0.5337583, 1.926193, 1, 1, 1, 1, 1,
0.1333429, 0.7350523, -1.050585, 1, 1, 1, 1, 1,
0.1365975, -0.5770628, 2.827575, 1, 1, 1, 1, 1,
0.1378333, -0.3016602, 3.93972, 1, 1, 1, 1, 1,
0.1389623, 2.018628, 1.114587, 1, 1, 1, 1, 1,
0.1405959, -0.9568387, 2.303504, 1, 1, 1, 1, 1,
0.1480045, 1.051932, 0.278612, 1, 1, 1, 1, 1,
0.150941, -0.7379911, 3.086699, 1, 1, 1, 1, 1,
0.1524803, 0.5705028, -1.970878, 1, 1, 1, 1, 1,
0.1586793, 0.9422414, 0.6450464, 1, 1, 1, 1, 1,
0.161848, -0.5694605, 0.560753, 1, 1, 1, 1, 1,
0.1660276, -2.096968, 2.095083, 0, 0, 1, 1, 1,
0.16683, -2.17664, 1.311695, 1, 0, 0, 1, 1,
0.1740023, 0.6761159, -0.9413813, 1, 0, 0, 1, 1,
0.1750522, 1.21408, -0.5334078, 1, 0, 0, 1, 1,
0.1751229, -1.331886, 2.075104, 1, 0, 0, 1, 1,
0.18053, 1.124947, -0.1957471, 1, 0, 0, 1, 1,
0.1810109, 0.06798054, -0.1129083, 0, 0, 0, 1, 1,
0.1816966, -0.3411447, 2.515637, 0, 0, 0, 1, 1,
0.1826445, -0.05591991, -0.06562567, 0, 0, 0, 1, 1,
0.1844071, -0.4408792, 4.1951, 0, 0, 0, 1, 1,
0.1860435, 0.3045911, -0.6893192, 0, 0, 0, 1, 1,
0.1872587, -0.662064, 3.928134, 0, 0, 0, 1, 1,
0.1947059, -2.114847, 3.147244, 0, 0, 0, 1, 1,
0.1960688, 0.565598, 1.570774, 1, 1, 1, 1, 1,
0.1987801, -0.2168899, 0.2875813, 1, 1, 1, 1, 1,
0.1993462, 1.741635, 0.5204452, 1, 1, 1, 1, 1,
0.2046897, -0.1510002, 3.16334, 1, 1, 1, 1, 1,
0.2095879, 0.3459804, -0.09268987, 1, 1, 1, 1, 1,
0.2132433, -1.26302, 3.183569, 1, 1, 1, 1, 1,
0.2143036, -2.070273, 4.523503, 1, 1, 1, 1, 1,
0.2168348, -0.2600506, 2.17389, 1, 1, 1, 1, 1,
0.2186126, -0.3063482, 2.681277, 1, 1, 1, 1, 1,
0.2191422, -1.31461, 1.417762, 1, 1, 1, 1, 1,
0.2231915, -0.2004618, 3.368286, 1, 1, 1, 1, 1,
0.2264898, -1.62129, 1.032642, 1, 1, 1, 1, 1,
0.2272882, -0.1766735, 2.63845, 1, 1, 1, 1, 1,
0.2277791, 1.083577, -1.074527, 1, 1, 1, 1, 1,
0.2280503, 0.526866, 1.247108, 1, 1, 1, 1, 1,
0.2289419, 1.991323, -0.2477794, 0, 0, 1, 1, 1,
0.2289432, 1.381868, 1.638682, 1, 0, 0, 1, 1,
0.2313989, -0.5048729, 2.806164, 1, 0, 0, 1, 1,
0.2331096, 1.29369, 0.4337755, 1, 0, 0, 1, 1,
0.2342529, 0.8765649, -0.2456444, 1, 0, 0, 1, 1,
0.2392822, 0.3777569, 0.1701952, 1, 0, 0, 1, 1,
0.2451037, 1.567256, 0.03221133, 0, 0, 0, 1, 1,
0.249596, 0.3284427, -0.1877435, 0, 0, 0, 1, 1,
0.2524569, 1.51055, 0.5412548, 0, 0, 0, 1, 1,
0.2561215, -0.3625478, 2.808323, 0, 0, 0, 1, 1,
0.2641061, 1.075482, -0.5220892, 0, 0, 0, 1, 1,
0.2740091, -0.4073382, 4.582477, 0, 0, 0, 1, 1,
0.2752659, 1.278762, -1.080218, 0, 0, 0, 1, 1,
0.2761778, -1.841103, 1.96072, 1, 1, 1, 1, 1,
0.2778709, 0.3410558, -0.5810683, 1, 1, 1, 1, 1,
0.2779891, -1.139032, 3.003611, 1, 1, 1, 1, 1,
0.2783391, 0.5552826, -0.1960839, 1, 1, 1, 1, 1,
0.2802017, 0.3861527, 1.579075, 1, 1, 1, 1, 1,
0.2802879, -0.8400953, 1.809145, 1, 1, 1, 1, 1,
0.2808868, 1.309664, -0.6635502, 1, 1, 1, 1, 1,
0.2840204, 0.1901238, -0.2131255, 1, 1, 1, 1, 1,
0.285606, 0.5776768, 2.060382, 1, 1, 1, 1, 1,
0.2870882, 0.1425048, 1.826313, 1, 1, 1, 1, 1,
0.2898136, 2.523091, -0.1060129, 1, 1, 1, 1, 1,
0.2946907, -0.990882, 4.689919, 1, 1, 1, 1, 1,
0.2951816, 1.071338, 0.7150794, 1, 1, 1, 1, 1,
0.2972933, -0.8996496, 2.274449, 1, 1, 1, 1, 1,
0.2984205, 0.8878876, 0.4533859, 1, 1, 1, 1, 1,
0.3036983, 0.6109272, 1.687201, 0, 0, 1, 1, 1,
0.3057708, -1.213189, 3.361109, 1, 0, 0, 1, 1,
0.3062814, 0.6666376, -1.433051, 1, 0, 0, 1, 1,
0.3092572, 1.327422, -0.4002691, 1, 0, 0, 1, 1,
0.3102189, 1.290601, 0.7364346, 1, 0, 0, 1, 1,
0.3136161, -0.4600329, 2.675126, 1, 0, 0, 1, 1,
0.316042, 1.450219, -0.3690331, 0, 0, 0, 1, 1,
0.3197383, 1.278554, 0.3525195, 0, 0, 0, 1, 1,
0.3202787, 0.1503008, -0.2567348, 0, 0, 0, 1, 1,
0.3284172, 0.2790513, 1.756218, 0, 0, 0, 1, 1,
0.3288221, 0.05369219, 1.060598, 0, 0, 0, 1, 1,
0.3308437, -0.2750942, 3.167572, 0, 0, 0, 1, 1,
0.3312041, -0.1908292, 1.081172, 0, 0, 0, 1, 1,
0.3332546, 1.499293, -1.672987, 1, 1, 1, 1, 1,
0.3335496, -0.1560252, 1.956008, 1, 1, 1, 1, 1,
0.3354933, -1.31349, 2.989794, 1, 1, 1, 1, 1,
0.3526796, 0.9163347, 1.919004, 1, 1, 1, 1, 1,
0.3533065, 0.263586, 1.10376, 1, 1, 1, 1, 1,
0.3556809, 0.008847135, 0.2034427, 1, 1, 1, 1, 1,
0.3562805, 1.574795, -0.5533861, 1, 1, 1, 1, 1,
0.3581731, -0.8566062, 1.922062, 1, 1, 1, 1, 1,
0.3618767, -2.163213, 1.72317, 1, 1, 1, 1, 1,
0.3630745, -0.40648, 3.399546, 1, 1, 1, 1, 1,
0.3630889, -1.379539, 2.404105, 1, 1, 1, 1, 1,
0.3710827, 0.697661, -2.042436, 1, 1, 1, 1, 1,
0.3816808, -0.2328098, 1.371902, 1, 1, 1, 1, 1,
0.3822169, -0.3706797, 1.699823, 1, 1, 1, 1, 1,
0.3862678, 1.148018, -0.9616286, 1, 1, 1, 1, 1,
0.3870919, 1.455449, 0.3325307, 0, 0, 1, 1, 1,
0.3915036, 1.606342, -0.6903579, 1, 0, 0, 1, 1,
0.396175, -0.4076896, 2.072755, 1, 0, 0, 1, 1,
0.3962985, -0.6520356, 3.574728, 1, 0, 0, 1, 1,
0.3990122, 0.55664, 0.05353821, 1, 0, 0, 1, 1,
0.4018446, 0.07619907, 0.5615661, 1, 0, 0, 1, 1,
0.4075635, -0.3480439, 2.042803, 0, 0, 0, 1, 1,
0.4088741, -1.083639, 1.02833, 0, 0, 0, 1, 1,
0.4112971, 0.4591278, 0.4724754, 0, 0, 0, 1, 1,
0.413305, 1.803378, 1.24781, 0, 0, 0, 1, 1,
0.4158251, -0.9408264, 1.063144, 0, 0, 0, 1, 1,
0.4178844, 1.22497, 1.182832, 0, 0, 0, 1, 1,
0.419803, -1.794048, 4.035928, 0, 0, 0, 1, 1,
0.4210263, -0.4460087, 1.864835, 1, 1, 1, 1, 1,
0.4246733, -0.786203, 1.966288, 1, 1, 1, 1, 1,
0.4314475, -1.60751, 2.695205, 1, 1, 1, 1, 1,
0.4351113, -1.050184, 2.317872, 1, 1, 1, 1, 1,
0.4420761, 1.641559, 0.2377044, 1, 1, 1, 1, 1,
0.4433752, 0.6761754, 1.113246, 1, 1, 1, 1, 1,
0.4501103, -0.2588266, 1.84826, 1, 1, 1, 1, 1,
0.4531372, -0.7069987, 3.710258, 1, 1, 1, 1, 1,
0.4607606, -1.315691, 2.468979, 1, 1, 1, 1, 1,
0.4628322, -1.808509, 2.839365, 1, 1, 1, 1, 1,
0.4643799, 0.5917005, -0.4923162, 1, 1, 1, 1, 1,
0.4706883, 0.8498359, 1.481953, 1, 1, 1, 1, 1,
0.4742435, 1.361592, 0.01733833, 1, 1, 1, 1, 1,
0.4743059, 0.5203023, 1.708413, 1, 1, 1, 1, 1,
0.475148, -0.5582509, 2.992543, 1, 1, 1, 1, 1,
0.4778445, -0.4599831, 1.72785, 0, 0, 1, 1, 1,
0.4804592, 1.062887, 0.8427587, 1, 0, 0, 1, 1,
0.4819905, -0.1926403, 0.8790692, 1, 0, 0, 1, 1,
0.4878196, 0.4586613, 2.074081, 1, 0, 0, 1, 1,
0.4900478, -0.06790579, 1.279427, 1, 0, 0, 1, 1,
0.4912744, 0.1818874, 1.578981, 1, 0, 0, 1, 1,
0.4938532, 1.376347, -0.6929974, 0, 0, 0, 1, 1,
0.4955202, 0.4475611, 0.3586463, 0, 0, 0, 1, 1,
0.5071123, 0.466057, 0.4724076, 0, 0, 0, 1, 1,
0.5091772, -1.159196, 4.454491, 0, 0, 0, 1, 1,
0.509815, -0.8705497, 3.213152, 0, 0, 0, 1, 1,
0.51362, -2.259326, 4.55981, 0, 0, 0, 1, 1,
0.51869, 1.114299, -0.2271629, 0, 0, 0, 1, 1,
0.5213882, -0.6339919, 1.742424, 1, 1, 1, 1, 1,
0.5236932, -0.2056386, 2.682109, 1, 1, 1, 1, 1,
0.5240684, 0.4842784, 1.202492, 1, 1, 1, 1, 1,
0.5380785, 1.23401, -1.17157, 1, 1, 1, 1, 1,
0.5407384, -0.1364291, -0.4636588, 1, 1, 1, 1, 1,
0.5422564, -1.133817, 3.636541, 1, 1, 1, 1, 1,
0.5424234, 0.9065366, -0.2028651, 1, 1, 1, 1, 1,
0.5428835, -1.07608, 2.93714, 1, 1, 1, 1, 1,
0.5513352, -1.793457, 3.171161, 1, 1, 1, 1, 1,
0.551748, 1.223456, -1.889903, 1, 1, 1, 1, 1,
0.5526377, 1.131422, 0.4096999, 1, 1, 1, 1, 1,
0.5533631, 0.05828394, 2.281191, 1, 1, 1, 1, 1,
0.5615717, 1.199889, 3.304934, 1, 1, 1, 1, 1,
0.5628259, 0.9103711, 0.09660951, 1, 1, 1, 1, 1,
0.5636207, -0.3304333, 0.9602735, 1, 1, 1, 1, 1,
0.568481, -0.4552402, 3.087969, 0, 0, 1, 1, 1,
0.5696008, -1.665897, 0.9590152, 1, 0, 0, 1, 1,
0.5710431, -2.333379, 3.451344, 1, 0, 0, 1, 1,
0.5737702, 1.204618, -1.284823, 1, 0, 0, 1, 1,
0.5776554, 1.395275, 1.445688, 1, 0, 0, 1, 1,
0.5812258, -0.1704189, 1.814412, 1, 0, 0, 1, 1,
0.5839517, 1.072555, -0.5463778, 0, 0, 0, 1, 1,
0.5869763, 0.5280156, 1.297615, 0, 0, 0, 1, 1,
0.5893865, 2.307034, 1.898642, 0, 0, 0, 1, 1,
0.6002811, 0.2639377, 2.156166, 0, 0, 0, 1, 1,
0.6032844, -0.2876915, 2.679776, 0, 0, 0, 1, 1,
0.6057039, 0.6903445, 0.9467337, 0, 0, 0, 1, 1,
0.6129217, 0.620407, -0.1732293, 0, 0, 0, 1, 1,
0.6132208, 1.307451, 0.7903849, 1, 1, 1, 1, 1,
0.6164249, 0.2269739, 0.9796513, 1, 1, 1, 1, 1,
0.6263865, -0.2046366, 3.13566, 1, 1, 1, 1, 1,
0.6272532, -0.2914364, 2.716138, 1, 1, 1, 1, 1,
0.6288852, -0.4232695, 2.393745, 1, 1, 1, 1, 1,
0.6362801, -0.8441033, 3.379474, 1, 1, 1, 1, 1,
0.6410291, -0.3079884, 1.35741, 1, 1, 1, 1, 1,
0.6441579, 0.3421397, 0.725104, 1, 1, 1, 1, 1,
0.6445699, -0.2062299, 2.310624, 1, 1, 1, 1, 1,
0.6484572, -1.331763, 2.569098, 1, 1, 1, 1, 1,
0.6531247, 0.7604473, 1.109603, 1, 1, 1, 1, 1,
0.6535556, -1.062721, 3.46574, 1, 1, 1, 1, 1,
0.6537052, 0.3910819, -0.2051031, 1, 1, 1, 1, 1,
0.6548914, 0.7810112, -1.190712, 1, 1, 1, 1, 1,
0.6603691, 0.1006506, 0.7743156, 1, 1, 1, 1, 1,
0.6643624, -0.3195146, 2.103858, 0, 0, 1, 1, 1,
0.6675963, -0.9474343, 4.109849, 1, 0, 0, 1, 1,
0.6677423, -0.6400623, 2.709177, 1, 0, 0, 1, 1,
0.6685663, -0.3648462, 1.86652, 1, 0, 0, 1, 1,
0.6686088, 0.7123171, -0.04454833, 1, 0, 0, 1, 1,
0.6710245, -2.750253, 3.032587, 1, 0, 0, 1, 1,
0.6713728, -0.635139, 0.8667266, 0, 0, 0, 1, 1,
0.6792109, -0.03432919, 1.056283, 0, 0, 0, 1, 1,
0.6839994, -1.865547, 3.113393, 0, 0, 0, 1, 1,
0.6880798, 0.7422267, 0.4779453, 0, 0, 0, 1, 1,
0.6890916, 1.378748, -0.516971, 0, 0, 0, 1, 1,
0.6895678, -0.6017563, 2.354484, 0, 0, 0, 1, 1,
0.7044883, 1.360502, 2.120128, 0, 0, 0, 1, 1,
0.7240399, 0.227579, 0.3628871, 1, 1, 1, 1, 1,
0.7270018, -0.2156801, 1.139347, 1, 1, 1, 1, 1,
0.7310034, 0.1143571, 1.43741, 1, 1, 1, 1, 1,
0.7324104, -1.562911, 2.445616, 1, 1, 1, 1, 1,
0.7344398, 0.835897, 2.04776, 1, 1, 1, 1, 1,
0.73514, -0.1392211, 3.702661, 1, 1, 1, 1, 1,
0.7353656, 0.6812863, 0.8149775, 1, 1, 1, 1, 1,
0.7354721, -0.8068957, 2.424888, 1, 1, 1, 1, 1,
0.7358534, -1.601701, 0.8641379, 1, 1, 1, 1, 1,
0.7383822, 0.8366508, 1.286085, 1, 1, 1, 1, 1,
0.7388474, -0.1154782, 1.875772, 1, 1, 1, 1, 1,
0.7444713, -0.6306744, 0.4882179, 1, 1, 1, 1, 1,
0.74653, 1.182781, 1.466917, 1, 1, 1, 1, 1,
0.7486669, 0.5569014, 1.71761, 1, 1, 1, 1, 1,
0.7515886, -0.8350456, 2.588739, 1, 1, 1, 1, 1,
0.7520303, 1.42218, -0.6538004, 0, 0, 1, 1, 1,
0.7528801, -0.03658887, 1.662082, 1, 0, 0, 1, 1,
0.7538689, -0.05372716, 2.623943, 1, 0, 0, 1, 1,
0.7550946, -0.1291343, 1.68746, 1, 0, 0, 1, 1,
0.765109, -0.3101377, 2.363467, 1, 0, 0, 1, 1,
0.7706543, 0.5728974, 0.5176663, 1, 0, 0, 1, 1,
0.7723767, -0.6283535, -0.3142076, 0, 0, 0, 1, 1,
0.7739536, 1.834025, -0.2144981, 0, 0, 0, 1, 1,
0.7930964, -0.8333094, 3.021548, 0, 0, 0, 1, 1,
0.8048086, 1.305081, -1.220878, 0, 0, 0, 1, 1,
0.8086295, -1.155643, 3.551615, 0, 0, 0, 1, 1,
0.8102089, -0.5865565, 0.6076394, 0, 0, 0, 1, 1,
0.8106465, 2.459487, 0.5451562, 0, 0, 0, 1, 1,
0.8156628, 0.3675909, 1.570973, 1, 1, 1, 1, 1,
0.8181596, 0.877272, 1.839465, 1, 1, 1, 1, 1,
0.8201901, 0.5369158, 0.9053493, 1, 1, 1, 1, 1,
0.8209819, -0.01243795, -1.045183, 1, 1, 1, 1, 1,
0.8312258, 0.01053125, 1.949252, 1, 1, 1, 1, 1,
0.8397886, 0.6431649, -0.5965693, 1, 1, 1, 1, 1,
0.8414686, -1.1581, 3.229579, 1, 1, 1, 1, 1,
0.8434812, 0.6964805, 0.6895039, 1, 1, 1, 1, 1,
0.8435951, 0.4647325, 0.9580643, 1, 1, 1, 1, 1,
0.844625, 1.331806, 1.583642, 1, 1, 1, 1, 1,
0.8457827, -3.330644, 1.603625, 1, 1, 1, 1, 1,
0.8502582, -0.2233136, 4.240815, 1, 1, 1, 1, 1,
0.8516176, 0.3116168, 1.375149, 1, 1, 1, 1, 1,
0.8532531, 0.3392839, 2.0126, 1, 1, 1, 1, 1,
0.8538086, -0.6344852, 3.338768, 1, 1, 1, 1, 1,
0.8687741, -0.08130627, 2.728324, 0, 0, 1, 1, 1,
0.8698446, -0.04652436, 3.24832, 1, 0, 0, 1, 1,
0.8762135, 1.12112, -0.2536885, 1, 0, 0, 1, 1,
0.8839132, 2.005932, 0.3826976, 1, 0, 0, 1, 1,
0.8852215, -1.923286, 2.089465, 1, 0, 0, 1, 1,
0.8887406, -0.0136033, 2.537422, 1, 0, 0, 1, 1,
0.8903509, -0.2823466, 2.577111, 0, 0, 0, 1, 1,
0.8937607, -0.01805014, 0.8450854, 0, 0, 0, 1, 1,
0.8984568, -1.021033, 1.903592, 0, 0, 0, 1, 1,
0.9036118, -0.1844081, 3.03296, 0, 0, 0, 1, 1,
0.9054202, 2.640886, 0.1878657, 0, 0, 0, 1, 1,
0.9061038, -0.9654995, 2.347157, 0, 0, 0, 1, 1,
0.9084437, -1.18645, 2.199302, 0, 0, 0, 1, 1,
0.9160448, -2.632747, 2.095315, 1, 1, 1, 1, 1,
0.9256412, 0.6595507, 1.406143, 1, 1, 1, 1, 1,
0.9324503, -0.5547161, 3.404166, 1, 1, 1, 1, 1,
0.9341673, -0.8538561, 2.718688, 1, 1, 1, 1, 1,
0.9364752, -1.57914, 3.005486, 1, 1, 1, 1, 1,
0.9382007, 1.810692, -0.3903168, 1, 1, 1, 1, 1,
0.9431275, 0.906553, 1.496617, 1, 1, 1, 1, 1,
0.9437205, 0.1383495, 1.883474, 1, 1, 1, 1, 1,
0.9509244, 1.214572, -0.3636614, 1, 1, 1, 1, 1,
0.9620504, -0.02393208, 0.9213939, 1, 1, 1, 1, 1,
0.9621054, -0.06472634, 1.55976, 1, 1, 1, 1, 1,
0.9642385, -0.6484325, 3.522846, 1, 1, 1, 1, 1,
0.9659069, -0.08908049, 1.558418, 1, 1, 1, 1, 1,
0.9721313, -0.8522017, 0.8665307, 1, 1, 1, 1, 1,
0.976499, 1.454212, 2.310753, 1, 1, 1, 1, 1,
0.9771655, 0.7401792, 0.3528142, 0, 0, 1, 1, 1,
0.9795943, -0.5768297, 3.054734, 1, 0, 0, 1, 1,
0.9800518, -1.144091, 1.482591, 1, 0, 0, 1, 1,
0.9906338, -0.03752671, 2.8694, 1, 0, 0, 1, 1,
0.9915943, -0.6921316, 1.179729, 1, 0, 0, 1, 1,
0.9958289, 2.020961, -0.6790208, 1, 0, 0, 1, 1,
0.9969605, -0.1902822, 1.215165, 0, 0, 0, 1, 1,
1.001634, -0.9248336, 1.073913, 0, 0, 0, 1, 1,
1.003271, -0.3120633, 1.553407, 0, 0, 0, 1, 1,
1.004714, 0.4784505, 0.07752047, 0, 0, 0, 1, 1,
1.006908, 1.844024, 1.325267, 0, 0, 0, 1, 1,
1.008997, -0.7581784, 2.936951, 0, 0, 0, 1, 1,
1.01707, -0.2449307, 2.273569, 0, 0, 0, 1, 1,
1.018473, -1.855709, 2.589736, 1, 1, 1, 1, 1,
1.019047, 1.463009, -0.07654229, 1, 1, 1, 1, 1,
1.024931, 0.6055117, 1.540919, 1, 1, 1, 1, 1,
1.027731, -0.9949053, 1.686762, 1, 1, 1, 1, 1,
1.029378, -1.00725, 2.431591, 1, 1, 1, 1, 1,
1.036686, 0.07600671, 1.09375, 1, 1, 1, 1, 1,
1.041495, 0.5478285, 2.609896, 1, 1, 1, 1, 1,
1.042352, -0.6254985, 3.64636, 1, 1, 1, 1, 1,
1.045135, -0.2142208, 2.572896, 1, 1, 1, 1, 1,
1.053561, 1.702141, -0.0346589, 1, 1, 1, 1, 1,
1.059197, 0.3136676, 2.44601, 1, 1, 1, 1, 1,
1.073181, 1.251684, -1.657838, 1, 1, 1, 1, 1,
1.073435, -1.08432, 2.003653, 1, 1, 1, 1, 1,
1.076505, -0.4992974, 0.8647286, 1, 1, 1, 1, 1,
1.076833, 1.206633, 1.154143, 1, 1, 1, 1, 1,
1.087551, -0.7803975, 2.444022, 0, 0, 1, 1, 1,
1.08885, -1.099808, 1.003643, 1, 0, 0, 1, 1,
1.0899, -0.3282356, 2.332039, 1, 0, 0, 1, 1,
1.09143, 0.2738933, 1.519215, 1, 0, 0, 1, 1,
1.0958, 2.466563, -0.3762532, 1, 0, 0, 1, 1,
1.097393, -0.02064338, 0.1043728, 1, 0, 0, 1, 1,
1.104312, -0.4766574, 2.37066, 0, 0, 0, 1, 1,
1.109686, 1.114279, -0.1047182, 0, 0, 0, 1, 1,
1.110345, 0.4245443, -0.6353317, 0, 0, 0, 1, 1,
1.111258, -0.1925618, 2.560856, 0, 0, 0, 1, 1,
1.117013, -0.3564248, 2.403574, 0, 0, 0, 1, 1,
1.117969, 0.623712, 1.037136, 0, 0, 0, 1, 1,
1.131732, 0.3521549, 1.150882, 0, 0, 0, 1, 1,
1.132949, -2.384307, 4.341711, 1, 1, 1, 1, 1,
1.13495, 1.897913, -0.06515623, 1, 1, 1, 1, 1,
1.136069, -0.6484488, 3.238899, 1, 1, 1, 1, 1,
1.146769, -1.144381, 1.527576, 1, 1, 1, 1, 1,
1.149139, 1.312705, 1.460532, 1, 1, 1, 1, 1,
1.156413, 1.584865, 1.050655, 1, 1, 1, 1, 1,
1.157426, 0.1041998, 2.262471, 1, 1, 1, 1, 1,
1.165762, -0.2330337, 2.481986, 1, 1, 1, 1, 1,
1.167334, 1.798218, 0.3517876, 1, 1, 1, 1, 1,
1.173046, -1.132426, 3.506052, 1, 1, 1, 1, 1,
1.177295, -0.4069794, 1.667179, 1, 1, 1, 1, 1,
1.177798, 1.318982, 3.342843, 1, 1, 1, 1, 1,
1.183765, 1.476239, 0.5064784, 1, 1, 1, 1, 1,
1.195539, -1.473078, 0.7980462, 1, 1, 1, 1, 1,
1.198532, -1.211366, 1.151021, 1, 1, 1, 1, 1,
1.198638, 0.986882, -0.3931386, 0, 0, 1, 1, 1,
1.200988, -1.103593, 3.247033, 1, 0, 0, 1, 1,
1.202865, -0.6428573, -0.3256996, 1, 0, 0, 1, 1,
1.20665, 0.7539749, 1.852523, 1, 0, 0, 1, 1,
1.208031, 0.3094023, -0.2240369, 1, 0, 0, 1, 1,
1.21303, -0.8978164, 3.79591, 1, 0, 0, 1, 1,
1.217491, -0.3856614, 2.514945, 0, 0, 0, 1, 1,
1.24309, -1.534899, 0.3053346, 0, 0, 0, 1, 1,
1.247293, -0.5009987, 2.262082, 0, 0, 0, 1, 1,
1.252864, 1.076703, 1.791715, 0, 0, 0, 1, 1,
1.25913, -0.7377968, 1.249434, 0, 0, 0, 1, 1,
1.261819, 1.084424, -1.360135, 0, 0, 0, 1, 1,
1.271781, -0.6000677, 1.487002, 0, 0, 0, 1, 1,
1.273272, -0.1004349, 1.988236, 1, 1, 1, 1, 1,
1.278025, -0.7809539, 3.397693, 1, 1, 1, 1, 1,
1.291142, 0.535933, 1.052564, 1, 1, 1, 1, 1,
1.295886, 0.1667006, 1.210368, 1, 1, 1, 1, 1,
1.30009, -0.7512507, 3.823309, 1, 1, 1, 1, 1,
1.300403, 1.069039, 0.5266856, 1, 1, 1, 1, 1,
1.304467, 1.581971, 0.7491776, 1, 1, 1, 1, 1,
1.305009, 0.6638803, 0.9313552, 1, 1, 1, 1, 1,
1.310855, 0.6985375, 0.01378818, 1, 1, 1, 1, 1,
1.314837, -0.9587108, 1.264135, 1, 1, 1, 1, 1,
1.317066, 0.4955994, 0.9699144, 1, 1, 1, 1, 1,
1.319166, -1.290025, 2.853793, 1, 1, 1, 1, 1,
1.321388, 2.368731, -0.4750885, 1, 1, 1, 1, 1,
1.321793, 1.193526, -1.124256, 1, 1, 1, 1, 1,
1.327331, -0.7097989, 4.226664, 1, 1, 1, 1, 1,
1.339301, -0.6812688, 2.855843, 0, 0, 1, 1, 1,
1.34856, 1.804521, 2.140341, 1, 0, 0, 1, 1,
1.349154, 0.7691996, 0.7574589, 1, 0, 0, 1, 1,
1.360512, 0.8160134, 1.516316, 1, 0, 0, 1, 1,
1.369668, 0.5599157, 1.003686, 1, 0, 0, 1, 1,
1.371053, 0.4233448, -0.07987546, 1, 0, 0, 1, 1,
1.37201, -0.07019427, 1.490472, 0, 0, 0, 1, 1,
1.372223, 0.05589966, -0.7988133, 0, 0, 0, 1, 1,
1.37383, 0.1922358, 2.160089, 0, 0, 0, 1, 1,
1.385712, 0.6170484, 0.8162345, 0, 0, 0, 1, 1,
1.388854, -0.734045, 1.731482, 0, 0, 0, 1, 1,
1.393128, 0.6310731, 2.017628, 0, 0, 0, 1, 1,
1.39603, -0.9080818, 2.706257, 0, 0, 0, 1, 1,
1.39944, 0.4277411, 2.403233, 1, 1, 1, 1, 1,
1.401054, 1.027516, 0.2237452, 1, 1, 1, 1, 1,
1.401121, -0.8090863, 2.384678, 1, 1, 1, 1, 1,
1.408275, -2.337491, 1.428113, 1, 1, 1, 1, 1,
1.413059, 0.8420189, 1.110107, 1, 1, 1, 1, 1,
1.413876, 0.7846617, -1.31792, 1, 1, 1, 1, 1,
1.41466, -1.842902, 1.994647, 1, 1, 1, 1, 1,
1.421118, -0.8638915, 2.815036, 1, 1, 1, 1, 1,
1.430524, -0.3384703, 2.314092, 1, 1, 1, 1, 1,
1.435648, -0.1716287, 1.949955, 1, 1, 1, 1, 1,
1.444623, 1.56162, 1.088471, 1, 1, 1, 1, 1,
1.446343, 0.8760089, 0.6668559, 1, 1, 1, 1, 1,
1.464081, -0.725933, 0.07266848, 1, 1, 1, 1, 1,
1.479556, 0.03478554, 1.316899, 1, 1, 1, 1, 1,
1.485103, -1.148613, 1.239184, 1, 1, 1, 1, 1,
1.517492, -0.9752999, 1.560141, 0, 0, 1, 1, 1,
1.52201, -1.438178, 3.477321, 1, 0, 0, 1, 1,
1.527382, 0.8439223, 1.260032, 1, 0, 0, 1, 1,
1.53129, -0.2351254, 3.409266, 1, 0, 0, 1, 1,
1.532758, -0.2483346, 2.941703, 1, 0, 0, 1, 1,
1.539356, -0.2779979, 1.794948, 1, 0, 0, 1, 1,
1.541719, -0.1557874, 3.26527, 0, 0, 0, 1, 1,
1.559655, -1.141258, 3.019183, 0, 0, 0, 1, 1,
1.563579, 0.9491256, 2.125716, 0, 0, 0, 1, 1,
1.565722, -1.002389, 1.746483, 0, 0, 0, 1, 1,
1.573598, -1.136804, 2.707922, 0, 0, 0, 1, 1,
1.595503, 0.5631395, 2.463786, 0, 0, 0, 1, 1,
1.597494, 1.73177, -0.5911661, 0, 0, 0, 1, 1,
1.598335, -0.4143206, 1.896247, 1, 1, 1, 1, 1,
1.599252, -0.6154814, 2.494068, 1, 1, 1, 1, 1,
1.615136, -0.9201736, 3.440258, 1, 1, 1, 1, 1,
1.64463, 0.2679168, 2.359027, 1, 1, 1, 1, 1,
1.644814, -0.692684, 0.5051478, 1, 1, 1, 1, 1,
1.649363, -2.058706, 2.39386, 1, 1, 1, 1, 1,
1.660265, -1.272456, 1.97777, 1, 1, 1, 1, 1,
1.668749, 1.037275, 0.3884627, 1, 1, 1, 1, 1,
1.669047, -0.4949718, 2.770768, 1, 1, 1, 1, 1,
1.676311, -0.03533207, 3.008052, 1, 1, 1, 1, 1,
1.681498, 0.6055139, 2.637705, 1, 1, 1, 1, 1,
1.684844, -0.7006716, 1.824459, 1, 1, 1, 1, 1,
1.689616, -0.2993589, 2.592853, 1, 1, 1, 1, 1,
1.705185, -1.506005, 2.755356, 1, 1, 1, 1, 1,
1.710636, -0.1110997, 3.749053, 1, 1, 1, 1, 1,
1.726307, -1.311762, 3.525066, 0, 0, 1, 1, 1,
1.729666, -0.1249853, 1.758738, 1, 0, 0, 1, 1,
1.741494, 0.4486392, 4.144121, 1, 0, 0, 1, 1,
1.753557, -0.1262671, 0.4349293, 1, 0, 0, 1, 1,
1.761468, -2.406465, 4.248341, 1, 0, 0, 1, 1,
1.774168, 1.219563, 0.02533665, 1, 0, 0, 1, 1,
1.774261, 0.5666411, 2.460151, 0, 0, 0, 1, 1,
1.775948, -0.4161231, -0.1479146, 0, 0, 0, 1, 1,
1.77595, -0.01833824, 4.033074, 0, 0, 0, 1, 1,
1.788625, 0.07600066, 1.302879, 0, 0, 0, 1, 1,
1.805938, 0.8968261, 0.9034401, 0, 0, 0, 1, 1,
1.806136, 1.093367, -0.1391462, 0, 0, 0, 1, 1,
1.820534, -0.1742653, 2.101206, 0, 0, 0, 1, 1,
1.84479, 0.8486044, 0.3792313, 1, 1, 1, 1, 1,
1.869031, -0.507059, 0.6698771, 1, 1, 1, 1, 1,
1.888354, 0.554472, 3.220525, 1, 1, 1, 1, 1,
1.89561, 0.3823967, 0.4310757, 1, 1, 1, 1, 1,
1.896974, 0.05212715, -0.0117774, 1, 1, 1, 1, 1,
1.916218, -0.2900923, 2.379169, 1, 1, 1, 1, 1,
1.948019, -0.3405098, 1.235517, 1, 1, 1, 1, 1,
1.95698, 0.4100825, 1.75636, 1, 1, 1, 1, 1,
1.958979, -0.3409696, 1.412923, 1, 1, 1, 1, 1,
1.969157, 1.224984, 1.923165, 1, 1, 1, 1, 1,
1.973449, -0.196085, 4.205163, 1, 1, 1, 1, 1,
1.983524, -0.8081763, 1.786951, 1, 1, 1, 1, 1,
1.988958, -1.293131, 1.559108, 1, 1, 1, 1, 1,
1.992778, 1.234134, -0.7802212, 1, 1, 1, 1, 1,
1.995907, -0.2997184, 0.6272317, 1, 1, 1, 1, 1,
2.008076, 2.165881, 0.3980331, 0, 0, 1, 1, 1,
2.028453, -0.03365634, 0.8289777, 1, 0, 0, 1, 1,
2.032169, 0.1916793, 3.440003, 1, 0, 0, 1, 1,
2.162448, 1.182349, 2.100245, 1, 0, 0, 1, 1,
2.176202, 0.4706575, 1.651206, 1, 0, 0, 1, 1,
2.201616, 0.4080855, 1.743686, 1, 0, 0, 1, 1,
2.242902, -0.3052581, 0.5602757, 0, 0, 0, 1, 1,
2.293424, -1.606909, 3.470035, 0, 0, 0, 1, 1,
2.308234, 0.6727746, 0.9103103, 0, 0, 0, 1, 1,
2.360575, 1.048823, 1.773428, 0, 0, 0, 1, 1,
2.441481, 0.2382362, 2.984566, 0, 0, 0, 1, 1,
2.507823, -2.001625, 3.543457, 0, 0, 0, 1, 1,
2.536005, 1.851869, 1.506389, 0, 0, 0, 1, 1,
2.583822, -0.3496124, 1.675719, 1, 1, 1, 1, 1,
3.031005, 0.2621586, 2.775003, 1, 1, 1, 1, 1,
3.285766, 0.9257612, 2.181403, 1, 1, 1, 1, 1,
3.328799, -1.223644, 3.601113, 1, 1, 1, 1, 1,
3.354566, 0.3684244, 2.353949, 1, 1, 1, 1, 1,
3.371711, 0.03476591, 2.224584, 1, 1, 1, 1, 1,
3.767565, -0.5373598, 1.198655, 1, 1, 1, 1, 1
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
var radius = 9.837886;
var distance = 34.55515;
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
mvMatrix.translate( -0.3615093, 0.09127903, 0.8370419 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.55515);
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
