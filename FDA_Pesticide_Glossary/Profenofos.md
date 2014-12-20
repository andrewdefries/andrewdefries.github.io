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
-2.484107, -0.5324455, -1.944728, 1, 0, 0, 1,
-2.366364, -0.08464443, -2.189137, 1, 0.007843138, 0, 1,
-2.353448, -0.9952594, -2.639526, 1, 0.01176471, 0, 1,
-2.236321, 0.787793, -0.2201573, 1, 0.01960784, 0, 1,
-2.229302, -0.01439851, -2.095178, 1, 0.02352941, 0, 1,
-2.227422, 1.379285, -2.52987, 1, 0.03137255, 0, 1,
-2.147691, 0.6467758, -1.289062, 1, 0.03529412, 0, 1,
-2.141725, -0.1058744, -2.065632, 1, 0.04313726, 0, 1,
-2.138417, -1.375228, -0.8454622, 1, 0.04705882, 0, 1,
-2.129806, -0.3415662, -2.40068, 1, 0.05490196, 0, 1,
-2.091988, -0.2336915, -0.7969609, 1, 0.05882353, 0, 1,
-2.081917, 1.205451, -0.7532626, 1, 0.06666667, 0, 1,
-2.079345, 0.2876234, -0.555782, 1, 0.07058824, 0, 1,
-2.065831, 2.62332, 0.07727781, 1, 0.07843138, 0, 1,
-2.005829, -2.059858, -1.738573, 1, 0.08235294, 0, 1,
-1.961863, 0.08921272, -1.283761, 1, 0.09019608, 0, 1,
-1.958282, -1.828085, -3.623906, 1, 0.09411765, 0, 1,
-1.955349, 0.7645423, -2.742268, 1, 0.1019608, 0, 1,
-1.946012, 0.7856041, -0.3719393, 1, 0.1098039, 0, 1,
-1.929481, -0.09178896, -0.2851346, 1, 0.1137255, 0, 1,
-1.918308, 1.062582, 0.5695366, 1, 0.1215686, 0, 1,
-1.90664, 0.3414607, -2.101872, 1, 0.1254902, 0, 1,
-1.89233, 2.170327, 0.1677645, 1, 0.1333333, 0, 1,
-1.869089, -0.6819922, -1.437037, 1, 0.1372549, 0, 1,
-1.859905, -0.5351741, -0.5144712, 1, 0.145098, 0, 1,
-1.8439, 1.725467, 1.434801, 1, 0.1490196, 0, 1,
-1.83966, -0.4083257, -1.94393, 1, 0.1568628, 0, 1,
-1.826865, 2.47475, -2.138612, 1, 0.1607843, 0, 1,
-1.825659, -0.2769909, -2.224812, 1, 0.1686275, 0, 1,
-1.824302, 0.4067383, -1.950475, 1, 0.172549, 0, 1,
-1.79428, 0.8387585, -0.8998042, 1, 0.1803922, 0, 1,
-1.789036, 0.7423947, 0.6397861, 1, 0.1843137, 0, 1,
-1.781684, -0.08323443, -1.888671, 1, 0.1921569, 0, 1,
-1.775902, 0.6553285, -1.964917, 1, 0.1960784, 0, 1,
-1.772227, 0.1957379, -0.23296, 1, 0.2039216, 0, 1,
-1.766377, -3.091123, -2.324399, 1, 0.2117647, 0, 1,
-1.756235, -0.09777793, -0.959161, 1, 0.2156863, 0, 1,
-1.736786, 0.4463009, -2.096118, 1, 0.2235294, 0, 1,
-1.729446, -1.493184, -3.942101, 1, 0.227451, 0, 1,
-1.723932, -0.1715993, -2.173737, 1, 0.2352941, 0, 1,
-1.692293, -1.584171, -3.140791, 1, 0.2392157, 0, 1,
-1.656381, 0.05441703, -0.413213, 1, 0.2470588, 0, 1,
-1.647092, -0.6747237, -1.744408, 1, 0.2509804, 0, 1,
-1.635705, 0.9053459, -0.8385477, 1, 0.2588235, 0, 1,
-1.623224, -0.5505251, -1.975623, 1, 0.2627451, 0, 1,
-1.603567, 0.9325854, -0.5786597, 1, 0.2705882, 0, 1,
-1.582272, 2.475306, -2.643964, 1, 0.2745098, 0, 1,
-1.562991, -0.1201933, 0.3695264, 1, 0.282353, 0, 1,
-1.559884, -0.2087441, -2.708958, 1, 0.2862745, 0, 1,
-1.549337, -0.733274, -0.8225366, 1, 0.2941177, 0, 1,
-1.546774, 0.3189615, 0.5552493, 1, 0.3019608, 0, 1,
-1.541274, 0.1932174, -1.458887, 1, 0.3058824, 0, 1,
-1.537364, -0.3077703, -0.8604248, 1, 0.3137255, 0, 1,
-1.53686, 1.093874, -3.058781, 1, 0.3176471, 0, 1,
-1.53209, -1.288001, -3.566843, 1, 0.3254902, 0, 1,
-1.514988, 1.873019, 0.03795996, 1, 0.3294118, 0, 1,
-1.493319, 0.9914892, 0.6365727, 1, 0.3372549, 0, 1,
-1.481394, 2.125343, 0.4258473, 1, 0.3411765, 0, 1,
-1.461359, 0.6132138, -0.3439173, 1, 0.3490196, 0, 1,
-1.450808, 0.3465341, -2.052951, 1, 0.3529412, 0, 1,
-1.449739, -0.875673, -0.2516693, 1, 0.3607843, 0, 1,
-1.440708, -2.940746, -1.362525, 1, 0.3647059, 0, 1,
-1.428628, 0.08373944, -2.400206, 1, 0.372549, 0, 1,
-1.426737, 1.869916, -1.262988, 1, 0.3764706, 0, 1,
-1.426217, -0.03289334, -0.8567941, 1, 0.3843137, 0, 1,
-1.421103, 1.735552, 0.6619272, 1, 0.3882353, 0, 1,
-1.419592, 1.558725, 0.03669487, 1, 0.3960784, 0, 1,
-1.413444, 1.185291, -0.4342867, 1, 0.4039216, 0, 1,
-1.406902, -0.1179822, -3.259254, 1, 0.4078431, 0, 1,
-1.405661, -0.7800793, -2.254, 1, 0.4156863, 0, 1,
-1.401446, 0.2945529, 0.4575087, 1, 0.4196078, 0, 1,
-1.388975, -0.8570215, -1.90462, 1, 0.427451, 0, 1,
-1.377066, 0.3801741, -1.859011, 1, 0.4313726, 0, 1,
-1.369827, 0.01386249, -0.9714713, 1, 0.4392157, 0, 1,
-1.364631, -1.197144, -1.626151, 1, 0.4431373, 0, 1,
-1.361577, 1.869974, -1.270072, 1, 0.4509804, 0, 1,
-1.358148, -0.1167155, -1.127012, 1, 0.454902, 0, 1,
-1.353714, -1.058408, -2.709472, 1, 0.4627451, 0, 1,
-1.337055, 1.004013, -1.327111, 1, 0.4666667, 0, 1,
-1.325874, 1.672728, -0.1219842, 1, 0.4745098, 0, 1,
-1.320137, -0.7664078, -2.303508, 1, 0.4784314, 0, 1,
-1.316885, 1.731992, 0.185981, 1, 0.4862745, 0, 1,
-1.314603, 0.3762069, 0.2149686, 1, 0.4901961, 0, 1,
-1.311837, -2.052529, -3.092168, 1, 0.4980392, 0, 1,
-1.307709, -0.1702044, -2.627267, 1, 0.5058824, 0, 1,
-1.300709, 0.5813614, -1.478573, 1, 0.509804, 0, 1,
-1.30056, 0.5370317, -2.111554, 1, 0.5176471, 0, 1,
-1.288388, -0.1298838, -2.796741, 1, 0.5215687, 0, 1,
-1.284864, 0.7910064, -1.521271, 1, 0.5294118, 0, 1,
-1.280321, 1.231504, 0.1272745, 1, 0.5333334, 0, 1,
-1.271176, -1.534828, -1.708368, 1, 0.5411765, 0, 1,
-1.262755, 2.406649, 0.9800941, 1, 0.5450981, 0, 1,
-1.25955, 0.4243287, -1.087112, 1, 0.5529412, 0, 1,
-1.252717, 0.1245673, -0.3959272, 1, 0.5568628, 0, 1,
-1.250469, -0.4608825, -3.475328, 1, 0.5647059, 0, 1,
-1.233645, 0.5794286, -1.28992, 1, 0.5686275, 0, 1,
-1.231194, -0.05192674, -2.308487, 1, 0.5764706, 0, 1,
-1.230442, -1.855369, -2.702023, 1, 0.5803922, 0, 1,
-1.227677, 1.125879, -3.979649, 1, 0.5882353, 0, 1,
-1.227162, -0.5534092, -1.675571, 1, 0.5921569, 0, 1,
-1.219942, 0.5066102, -1.008654, 1, 0.6, 0, 1,
-1.215826, 0.4434446, -0.5144349, 1, 0.6078432, 0, 1,
-1.208353, -1.310911, -1.523848, 1, 0.6117647, 0, 1,
-1.207698, -1.105786, -2.83349, 1, 0.6196079, 0, 1,
-1.181186, 0.4156547, -0.07669821, 1, 0.6235294, 0, 1,
-1.179266, -0.5664043, -3.508346, 1, 0.6313726, 0, 1,
-1.172417, -0.4311699, -1.545501, 1, 0.6352941, 0, 1,
-1.168121, 1.202572, -1.615847, 1, 0.6431373, 0, 1,
-1.1664, -0.3423796, -1.292635, 1, 0.6470588, 0, 1,
-1.165591, -1.264904, -2.226498, 1, 0.654902, 0, 1,
-1.153936, 0.4641165, -0.8709033, 1, 0.6588235, 0, 1,
-1.150258, -0.4524156, -1.680006, 1, 0.6666667, 0, 1,
-1.149836, 0.888599, 0.5724, 1, 0.6705883, 0, 1,
-1.141523, -0.6427091, -2.296009, 1, 0.6784314, 0, 1,
-1.140861, 1.406093, -0.6848691, 1, 0.682353, 0, 1,
-1.13854, -0.5014714, -2.44748, 1, 0.6901961, 0, 1,
-1.12294, 0.1311539, -1.209322, 1, 0.6941177, 0, 1,
-1.122809, 2.204801, -1.125161, 1, 0.7019608, 0, 1,
-1.121001, 0.5816314, -2.222101, 1, 0.7098039, 0, 1,
-1.120156, 1.116824, -1.596264, 1, 0.7137255, 0, 1,
-1.104643, 0.5632088, -0.4590078, 1, 0.7215686, 0, 1,
-1.10456, -0.3631924, -0.7041193, 1, 0.7254902, 0, 1,
-1.09372, 0.3809135, -2.84876, 1, 0.7333333, 0, 1,
-1.092832, -0.9081629, -2.555713, 1, 0.7372549, 0, 1,
-1.08846, -0.3778682, -0.7934687, 1, 0.7450981, 0, 1,
-1.085371, 1.30787, -0.05314438, 1, 0.7490196, 0, 1,
-1.079618, 0.8464101, 1.015924, 1, 0.7568628, 0, 1,
-1.073459, 0.829053, 0.7215362, 1, 0.7607843, 0, 1,
-1.070772, 0.232637, -0.6031451, 1, 0.7686275, 0, 1,
-1.066447, 0.9834369, -2.9709, 1, 0.772549, 0, 1,
-1.062539, -0.7096592, -2.481262, 1, 0.7803922, 0, 1,
-1.061419, 1.774327, -1.335618, 1, 0.7843137, 0, 1,
-1.059489, 0.7152184, -0.07104207, 1, 0.7921569, 0, 1,
-1.058926, -1.439742, -0.45386, 1, 0.7960784, 0, 1,
-1.056969, 1.891109, -0.8574584, 1, 0.8039216, 0, 1,
-1.047624, 0.1492546, -3.075493, 1, 0.8117647, 0, 1,
-1.042226, 1.040175, 0.8665401, 1, 0.8156863, 0, 1,
-1.039685, 0.5594637, -1.311127, 1, 0.8235294, 0, 1,
-1.038972, 2.073004, 0.8964043, 1, 0.827451, 0, 1,
-1.037131, 1.403152, -0.8894302, 1, 0.8352941, 0, 1,
-1.032485, 1.149219, -0.8465887, 1, 0.8392157, 0, 1,
-1.027426, 0.8928139, -3.817551, 1, 0.8470588, 0, 1,
-1.026965, 0.2564462, -0.5996846, 1, 0.8509804, 0, 1,
-1.024142, -0.1286026, -3.965741, 1, 0.8588235, 0, 1,
-1.02145, -0.9457076, -1.501427, 1, 0.8627451, 0, 1,
-1.016338, 0.8509214, -1.397289, 1, 0.8705882, 0, 1,
-1.013232, 0.1917706, 0.1243124, 1, 0.8745098, 0, 1,
-1.008666, -0.4001128, -2.681562, 1, 0.8823529, 0, 1,
-1.006208, -1.421121, -1.562706, 1, 0.8862745, 0, 1,
-0.9961936, -0.2330477, -2.191697, 1, 0.8941177, 0, 1,
-0.9923918, 0.6246354, -0.5297062, 1, 0.8980392, 0, 1,
-0.989702, -1.978717, -2.869229, 1, 0.9058824, 0, 1,
-0.9617799, -0.2760581, -1.424, 1, 0.9137255, 0, 1,
-0.9590421, -0.8998075, -2.545296, 1, 0.9176471, 0, 1,
-0.956647, 0.5313993, -1.049888, 1, 0.9254902, 0, 1,
-0.9487525, -0.9774082, -3.510742, 1, 0.9294118, 0, 1,
-0.9484115, -1.062411, -2.962358, 1, 0.9372549, 0, 1,
-0.9471484, -0.1666098, -1.909027, 1, 0.9411765, 0, 1,
-0.9451056, 0.09420923, -1.618123, 1, 0.9490196, 0, 1,
-0.9396742, -1.471479, -1.77903, 1, 0.9529412, 0, 1,
-0.929446, 0.09883001, 0.6606604, 1, 0.9607843, 0, 1,
-0.9280453, 1.798218, -0.4947894, 1, 0.9647059, 0, 1,
-0.9275835, -1.433748, -1.379439, 1, 0.972549, 0, 1,
-0.9274984, 0.05150425, -1.642149, 1, 0.9764706, 0, 1,
-0.9262035, -0.4339353, -3.122932, 1, 0.9843137, 0, 1,
-0.9129535, -0.545485, -2.142941, 1, 0.9882353, 0, 1,
-0.9127551, -1.360403, -2.8679, 1, 0.9960784, 0, 1,
-0.9094906, -0.3132467, -2.068673, 0.9960784, 1, 0, 1,
-0.9009994, -1.639918, -4.815556, 0.9921569, 1, 0, 1,
-0.8873792, -0.4583577, -1.139105, 0.9843137, 1, 0, 1,
-0.8833255, -0.9877904, -2.471647, 0.9803922, 1, 0, 1,
-0.8826064, 0.7523828, -2.284099, 0.972549, 1, 0, 1,
-0.8762106, 0.8023777, -1.730589, 0.9686275, 1, 0, 1,
-0.869168, -1.586428, -3.13331, 0.9607843, 1, 0, 1,
-0.8681594, 0.5203535, -3.060491, 0.9568627, 1, 0, 1,
-0.8664948, 1.854978, 0.451322, 0.9490196, 1, 0, 1,
-0.863068, 0.3314803, -2.833695, 0.945098, 1, 0, 1,
-0.8608374, 0.7643057, -1.3015, 0.9372549, 1, 0, 1,
-0.8558686, 1.104545, -0.626829, 0.9333333, 1, 0, 1,
-0.8557098, -0.5136436, -3.711678, 0.9254902, 1, 0, 1,
-0.8552517, 1.631653, -0.7832016, 0.9215686, 1, 0, 1,
-0.8531121, -0.9676483, -2.327305, 0.9137255, 1, 0, 1,
-0.8467558, 0.3985167, -0.4833683, 0.9098039, 1, 0, 1,
-0.8344026, 0.1199415, -1.037064, 0.9019608, 1, 0, 1,
-0.8332968, 0.06437902, -1.733534, 0.8941177, 1, 0, 1,
-0.8320894, 1.16937, -0.9677848, 0.8901961, 1, 0, 1,
-0.829694, 0.1049353, -1.498531, 0.8823529, 1, 0, 1,
-0.8215225, 1.204418, -0.6495318, 0.8784314, 1, 0, 1,
-0.818177, -1.718617, -2.685695, 0.8705882, 1, 0, 1,
-0.8142892, 0.1138463, -0.9842419, 0.8666667, 1, 0, 1,
-0.8138276, 0.6248586, -1.783736, 0.8588235, 1, 0, 1,
-0.8007696, -1.621405, -4.2116, 0.854902, 1, 0, 1,
-0.7917885, 2.223233, -0.1231668, 0.8470588, 1, 0, 1,
-0.7902877, -1.365958, -3.183582, 0.8431373, 1, 0, 1,
-0.783996, 2.247878, -0.2994212, 0.8352941, 1, 0, 1,
-0.782342, -1.327091, -1.828893, 0.8313726, 1, 0, 1,
-0.7808581, -0.7730722, -3.57439, 0.8235294, 1, 0, 1,
-0.7804167, -0.7341468, -2.187203, 0.8196079, 1, 0, 1,
-0.7756181, -0.6684479, -2.522598, 0.8117647, 1, 0, 1,
-0.7740799, 0.1251076, -0.6252692, 0.8078431, 1, 0, 1,
-0.7694393, -0.1035987, -1.268577, 0.8, 1, 0, 1,
-0.7633708, -0.03904279, -1.78022, 0.7921569, 1, 0, 1,
-0.762472, -0.3901904, -2.851406, 0.7882353, 1, 0, 1,
-0.7611797, -0.6493509, -1.826515, 0.7803922, 1, 0, 1,
-0.754887, -1.027663, -1.228974, 0.7764706, 1, 0, 1,
-0.7542451, -2.57394, -3.699368, 0.7686275, 1, 0, 1,
-0.75177, -1.203435, -2.491976, 0.7647059, 1, 0, 1,
-0.7476086, -1.542833, -3.279184, 0.7568628, 1, 0, 1,
-0.7474974, -0.4340845, -3.204608, 0.7529412, 1, 0, 1,
-0.7463601, -0.02041833, -2.730594, 0.7450981, 1, 0, 1,
-0.7454945, 1.323202, -0.736136, 0.7411765, 1, 0, 1,
-0.7425141, 1.002027, 0.7600504, 0.7333333, 1, 0, 1,
-0.7399378, -1.340514, -4.648461, 0.7294118, 1, 0, 1,
-0.7381265, -1.09373, -2.451142, 0.7215686, 1, 0, 1,
-0.731883, -0.6615011, -2.728406, 0.7176471, 1, 0, 1,
-0.7318207, -0.5546955, -4.772187, 0.7098039, 1, 0, 1,
-0.7298003, -1.52467, -4.256601, 0.7058824, 1, 0, 1,
-0.7267907, -0.6918882, -1.071823, 0.6980392, 1, 0, 1,
-0.7236025, 0.7633526, -0.9627936, 0.6901961, 1, 0, 1,
-0.7222211, -0.5896351, -0.6974559, 0.6862745, 1, 0, 1,
-0.7205284, -0.2497771, -3.055694, 0.6784314, 1, 0, 1,
-0.7179108, 0.1571997, -0.809723, 0.6745098, 1, 0, 1,
-0.7175831, -1.385808, -4.28335, 0.6666667, 1, 0, 1,
-0.7166734, 0.5107741, -0.8648854, 0.6627451, 1, 0, 1,
-0.7164583, -0.2460794, -1.600078, 0.654902, 1, 0, 1,
-0.7128084, -1.31203, -2.000122, 0.6509804, 1, 0, 1,
-0.7084581, -1.102436, -2.41531, 0.6431373, 1, 0, 1,
-0.7068395, -0.8303994, -2.853365, 0.6392157, 1, 0, 1,
-0.7023729, -0.5198364, -3.092145, 0.6313726, 1, 0, 1,
-0.6982158, -0.04508052, -3.038923, 0.627451, 1, 0, 1,
-0.6938172, -0.7794083, -2.072848, 0.6196079, 1, 0, 1,
-0.6928194, -0.3261469, -4.33219, 0.6156863, 1, 0, 1,
-0.6926997, 0.2448703, -2.008524, 0.6078432, 1, 0, 1,
-0.690814, -1.167953, -3.236353, 0.6039216, 1, 0, 1,
-0.6904287, -1.036074, -3.494187, 0.5960785, 1, 0, 1,
-0.6873962, -0.0504724, -1.970773, 0.5882353, 1, 0, 1,
-0.6787065, 0.2639299, -0.4886033, 0.5843138, 1, 0, 1,
-0.6786539, 0.5131063, -0.05987361, 0.5764706, 1, 0, 1,
-0.6716346, -0.1791711, -0.6201533, 0.572549, 1, 0, 1,
-0.6651784, 0.8916904, -2.536767, 0.5647059, 1, 0, 1,
-0.6644158, -0.1377369, -2.68464, 0.5607843, 1, 0, 1,
-0.6630407, 0.1141601, -2.308675, 0.5529412, 1, 0, 1,
-0.662047, -1.15553, -2.6224, 0.5490196, 1, 0, 1,
-0.6612316, -0.1839285, -4.142753, 0.5411765, 1, 0, 1,
-0.6607177, 1.356711, -0.07325611, 0.5372549, 1, 0, 1,
-0.6598532, 0.1715542, -2.598554, 0.5294118, 1, 0, 1,
-0.6545073, -1.852023, -3.885179, 0.5254902, 1, 0, 1,
-0.6528503, -1.063533, -3.256941, 0.5176471, 1, 0, 1,
-0.6480266, 0.1348598, -2.100757, 0.5137255, 1, 0, 1,
-0.6347336, 1.094384, -0.2219137, 0.5058824, 1, 0, 1,
-0.6332678, 1.713691, -0.706202, 0.5019608, 1, 0, 1,
-0.633176, 0.1389942, -0.6623708, 0.4941176, 1, 0, 1,
-0.632862, 3.186136, -0.8749663, 0.4862745, 1, 0, 1,
-0.6316683, -1.654033, -2.720088, 0.4823529, 1, 0, 1,
-0.6316394, -0.5514206, -1.948547, 0.4745098, 1, 0, 1,
-0.6298791, -0.3227826, -1.077148, 0.4705882, 1, 0, 1,
-0.6248564, 1.15931, 0.2247711, 0.4627451, 1, 0, 1,
-0.623257, -0.9634475, -2.82621, 0.4588235, 1, 0, 1,
-0.6169991, -0.1092051, -1.242926, 0.4509804, 1, 0, 1,
-0.6113019, 0.7110143, -1.739023, 0.4470588, 1, 0, 1,
-0.6089342, -0.4195562, -3.834434, 0.4392157, 1, 0, 1,
-0.6087275, -0.3238634, -2.779721, 0.4352941, 1, 0, 1,
-0.6070985, -0.356405, -1.745547, 0.427451, 1, 0, 1,
-0.5938621, 0.09875331, -2.564604, 0.4235294, 1, 0, 1,
-0.5935996, 0.4876639, 1.33417, 0.4156863, 1, 0, 1,
-0.5823817, 1.343419, 0.03282899, 0.4117647, 1, 0, 1,
-0.5820551, 1.206605, 0.2257145, 0.4039216, 1, 0, 1,
-0.5781496, 1.587187, -0.3396656, 0.3960784, 1, 0, 1,
-0.5760683, -0.2894572, -1.060542, 0.3921569, 1, 0, 1,
-0.575952, -0.5752552, -2.612152, 0.3843137, 1, 0, 1,
-0.5743654, 0.8184351, -0.3784, 0.3803922, 1, 0, 1,
-0.5732161, -0.5166809, -4.860001, 0.372549, 1, 0, 1,
-0.5691125, -1.523705, -3.567875, 0.3686275, 1, 0, 1,
-0.5621743, 0.2062822, -0.3618566, 0.3607843, 1, 0, 1,
-0.5565559, 1.803893, 1.045498, 0.3568628, 1, 0, 1,
-0.5522854, 1.032207, -0.1646699, 0.3490196, 1, 0, 1,
-0.5450616, -0.8419883, -3.341796, 0.345098, 1, 0, 1,
-0.5434467, 0.6163372, -0.008181863, 0.3372549, 1, 0, 1,
-0.5420154, 0.1730825, -0.2825601, 0.3333333, 1, 0, 1,
-0.5395195, 0.5608839, 0.06282777, 0.3254902, 1, 0, 1,
-0.5357587, -0.1235529, -1.210825, 0.3215686, 1, 0, 1,
-0.5275565, -0.9042711, -2.861429, 0.3137255, 1, 0, 1,
-0.5257121, -1.271286, -0.6982204, 0.3098039, 1, 0, 1,
-0.5165492, 0.5058265, -0.3049192, 0.3019608, 1, 0, 1,
-0.516001, 0.5727111, -1.107714, 0.2941177, 1, 0, 1,
-0.5157537, -0.22601, -2.482215, 0.2901961, 1, 0, 1,
-0.5117588, -0.0005884258, -2.236377, 0.282353, 1, 0, 1,
-0.5077583, 1.199778, 1.24813, 0.2784314, 1, 0, 1,
-0.5072321, 1.156793, -0.5613849, 0.2705882, 1, 0, 1,
-0.4988618, 1.412331, 0.2966097, 0.2666667, 1, 0, 1,
-0.4957682, 0.3130112, 0.4665691, 0.2588235, 1, 0, 1,
-0.4942856, 0.6290528, -1.76498, 0.254902, 1, 0, 1,
-0.492494, 1.09147, -0.4554746, 0.2470588, 1, 0, 1,
-0.4911871, -0.7553086, -2.509654, 0.2431373, 1, 0, 1,
-0.4907552, -0.7102445, -2.101697, 0.2352941, 1, 0, 1,
-0.4898334, -0.7477408, -2.088587, 0.2313726, 1, 0, 1,
-0.4898216, 0.4612159, 0.1462787, 0.2235294, 1, 0, 1,
-0.4860126, 0.4313535, -0.6591302, 0.2196078, 1, 0, 1,
-0.4820156, 1.325625, 1.027563, 0.2117647, 1, 0, 1,
-0.4817531, 0.4475826, -0.1324572, 0.2078431, 1, 0, 1,
-0.479797, 0.6388707, -1.173133, 0.2, 1, 0, 1,
-0.4757017, 0.1345696, -3.380753, 0.1921569, 1, 0, 1,
-0.4685982, -0.7209932, -3.495849, 0.1882353, 1, 0, 1,
-0.4670836, 1.210222, -0.1249544, 0.1803922, 1, 0, 1,
-0.4614455, -0.5590771, -1.409822, 0.1764706, 1, 0, 1,
-0.4606807, -0.1654848, -1.391078, 0.1686275, 1, 0, 1,
-0.4545045, -0.9536772, -1.445529, 0.1647059, 1, 0, 1,
-0.4529378, -1.008946, -3.24434, 0.1568628, 1, 0, 1,
-0.4505286, 1.107034, -1.661004, 0.1529412, 1, 0, 1,
-0.4487607, -0.7924564, -2.787295, 0.145098, 1, 0, 1,
-0.4440596, -2.172857, -4.288561, 0.1411765, 1, 0, 1,
-0.4396037, -1.09437, -1.443485, 0.1333333, 1, 0, 1,
-0.4386426, 0.879189, -0.5136459, 0.1294118, 1, 0, 1,
-0.4361551, -0.8061267, -2.358847, 0.1215686, 1, 0, 1,
-0.433721, 0.02466846, -1.230273, 0.1176471, 1, 0, 1,
-0.4328486, -1.450989, -2.394203, 0.1098039, 1, 0, 1,
-0.428447, 1.165629, -0.3860255, 0.1058824, 1, 0, 1,
-0.4262432, -0.6698024, -3.334326, 0.09803922, 1, 0, 1,
-0.4244037, -0.7300761, -2.25781, 0.09019608, 1, 0, 1,
-0.42394, 0.5827478, 1.601751, 0.08627451, 1, 0, 1,
-0.4236693, -1.515967, -1.625294, 0.07843138, 1, 0, 1,
-0.4220383, -0.563404, -2.951555, 0.07450981, 1, 0, 1,
-0.4210103, 0.03972984, -3.286909, 0.06666667, 1, 0, 1,
-0.4177602, 0.2344554, -2.118739, 0.0627451, 1, 0, 1,
-0.4176967, -0.4941279, -1.665551, 0.05490196, 1, 0, 1,
-0.4166098, -0.8896431, -2.013424, 0.05098039, 1, 0, 1,
-0.4155799, -0.09085521, -2.28124, 0.04313726, 1, 0, 1,
-0.4155482, -0.0004341101, -1.726068, 0.03921569, 1, 0, 1,
-0.4133384, -1.228337, -1.866361, 0.03137255, 1, 0, 1,
-0.4043415, 0.419776, -0.9856489, 0.02745098, 1, 0, 1,
-0.3807432, -0.3187691, -2.988439, 0.01960784, 1, 0, 1,
-0.3805248, 1.113389, 0.02425566, 0.01568628, 1, 0, 1,
-0.3773412, 0.2987128, -2.182303, 0.007843138, 1, 0, 1,
-0.3772393, -0.2723633, -2.184908, 0.003921569, 1, 0, 1,
-0.3763643, 1.204248, 1.514442, 0, 1, 0.003921569, 1,
-0.3694521, -0.2866648, -1.339718, 0, 1, 0.01176471, 1,
-0.3680428, 0.242974, -1.389783, 0, 1, 0.01568628, 1,
-0.3656449, 0.7306955, -0.498284, 0, 1, 0.02352941, 1,
-0.3572232, -1.118181, -5.123385, 0, 1, 0.02745098, 1,
-0.3568324, 0.8417202, -0.6459932, 0, 1, 0.03529412, 1,
-0.3533442, 0.4849282, -2.293411, 0, 1, 0.03921569, 1,
-0.3521862, -0.7497087, -3.474171, 0, 1, 0.04705882, 1,
-0.3517888, 1.519471, 0.6936204, 0, 1, 0.05098039, 1,
-0.3454838, 1.546737, 0.01069384, 0, 1, 0.05882353, 1,
-0.3451234, -1.994143, -2.919097, 0, 1, 0.0627451, 1,
-0.3441656, -0.595571, -4.333625, 0, 1, 0.07058824, 1,
-0.3415015, 0.1633856, -2.421792, 0, 1, 0.07450981, 1,
-0.3360983, 0.4464352, 0.3255305, 0, 1, 0.08235294, 1,
-0.3278229, 1.658825, -0.5975811, 0, 1, 0.08627451, 1,
-0.3243302, 1.160851, 1.172208, 0, 1, 0.09411765, 1,
-0.3171426, 0.1691163, -1.428518, 0, 1, 0.1019608, 1,
-0.3109622, -1.787673, -3.469664, 0, 1, 0.1058824, 1,
-0.3042663, -0.1302772, -1.785906, 0, 1, 0.1137255, 1,
-0.3018224, 0.422731, -0.1030266, 0, 1, 0.1176471, 1,
-0.3017489, -0.6719956, -2.258609, 0, 1, 0.1254902, 1,
-0.2984926, 1.62487, -0.190605, 0, 1, 0.1294118, 1,
-0.2975661, -0.272205, -3.22968, 0, 1, 0.1372549, 1,
-0.2946394, 0.133244, -2.653075, 0, 1, 0.1411765, 1,
-0.289912, -0.1567807, -2.107155, 0, 1, 0.1490196, 1,
-0.2880594, 0.7685035, 0.5828994, 0, 1, 0.1529412, 1,
-0.2785883, 0.2334927, -2.082871, 0, 1, 0.1607843, 1,
-0.2715008, 0.8037905, -2.092996, 0, 1, 0.1647059, 1,
-0.2708724, 0.5606283, -0.3826493, 0, 1, 0.172549, 1,
-0.2680987, -1.206723, -3.613606, 0, 1, 0.1764706, 1,
-0.2678615, 0.04308797, -1.894962, 0, 1, 0.1843137, 1,
-0.2599678, 0.3918551, -1.220639, 0, 1, 0.1882353, 1,
-0.2594724, 0.432528, 0.9862932, 0, 1, 0.1960784, 1,
-0.2586567, -0.468458, -3.954554, 0, 1, 0.2039216, 1,
-0.2561737, -2.013695, -2.200489, 0, 1, 0.2078431, 1,
-0.25043, -0.6356248, -3.654404, 0, 1, 0.2156863, 1,
-0.2484544, -1.706473, -4.833377, 0, 1, 0.2196078, 1,
-0.243066, 0.5375556, -1.195403, 0, 1, 0.227451, 1,
-0.2360772, -0.01538438, -1.406514, 0, 1, 0.2313726, 1,
-0.2349858, 0.3744448, -0.3604808, 0, 1, 0.2392157, 1,
-0.2293074, -1.177759, -4.02221, 0, 1, 0.2431373, 1,
-0.2287741, 0.1252906, -1.376087, 0, 1, 0.2509804, 1,
-0.2152649, -0.9324901, -3.324456, 0, 1, 0.254902, 1,
-0.2141331, 1.006968, -2.089643, 0, 1, 0.2627451, 1,
-0.2108534, 0.3706059, -0.2429112, 0, 1, 0.2666667, 1,
-0.2106648, 0.1355799, -1.126323, 0, 1, 0.2745098, 1,
-0.2084248, 0.3578109, -0.6999555, 0, 1, 0.2784314, 1,
-0.2079676, -0.4560176, -2.872512, 0, 1, 0.2862745, 1,
-0.2077896, -0.441687, -1.428354, 0, 1, 0.2901961, 1,
-0.2076507, 1.018281, -0.700574, 0, 1, 0.2980392, 1,
-0.2051953, -0.8353791, -2.748672, 0, 1, 0.3058824, 1,
-0.2031095, -1.912117, -2.564299, 0, 1, 0.3098039, 1,
-0.1992421, -0.3534006, -2.600911, 0, 1, 0.3176471, 1,
-0.1991729, 0.228701, -2.613074, 0, 1, 0.3215686, 1,
-0.1956281, 0.7658893, -0.5393882, 0, 1, 0.3294118, 1,
-0.1954936, 0.6948205, -0.1588669, 0, 1, 0.3333333, 1,
-0.1950965, 0.6084507, -0.4772961, 0, 1, 0.3411765, 1,
-0.1930314, -0.2179113, -3.592961, 0, 1, 0.345098, 1,
-0.1914112, 0.08534683, -1.421803, 0, 1, 0.3529412, 1,
-0.1881066, -2.508712, -3.994854, 0, 1, 0.3568628, 1,
-0.1869281, -1.350089, -2.63105, 0, 1, 0.3647059, 1,
-0.1859003, 0.9967461, 0.9326659, 0, 1, 0.3686275, 1,
-0.1852156, 0.1337242, -2.277391, 0, 1, 0.3764706, 1,
-0.1831933, 0.1834791, -0.518936, 0, 1, 0.3803922, 1,
-0.1791956, 0.2467069, -1.681149, 0, 1, 0.3882353, 1,
-0.1778649, 0.4838909, 0.1198695, 0, 1, 0.3921569, 1,
-0.176082, 0.8277712, -0.08858564, 0, 1, 0.4, 1,
-0.1754028, 0.762728, 0.4049754, 0, 1, 0.4078431, 1,
-0.1747427, 0.3628184, -1.47774, 0, 1, 0.4117647, 1,
-0.1735015, -0.05223559, -1.401602, 0, 1, 0.4196078, 1,
-0.1703023, 0.6766876, 0.294621, 0, 1, 0.4235294, 1,
-0.1691594, 0.01610067, -1.573522, 0, 1, 0.4313726, 1,
-0.1684303, 0.451778, -0.6591438, 0, 1, 0.4352941, 1,
-0.1675357, 0.226265, -1.514106, 0, 1, 0.4431373, 1,
-0.1584357, -1.500349, -2.019239, 0, 1, 0.4470588, 1,
-0.158332, -0.7094916, -3.986233, 0, 1, 0.454902, 1,
-0.1528259, 0.574948, -0.646798, 0, 1, 0.4588235, 1,
-0.1484545, 1.648699, -1.076408, 0, 1, 0.4666667, 1,
-0.1475856, 0.9624149, -0.03689278, 0, 1, 0.4705882, 1,
-0.1464249, 0.4553871, -0.3440242, 0, 1, 0.4784314, 1,
-0.1430929, -1.136664, -2.358843, 0, 1, 0.4823529, 1,
-0.141104, -0.8945248, -2.682374, 0, 1, 0.4901961, 1,
-0.1388322, -0.6481748, -2.998076, 0, 1, 0.4941176, 1,
-0.1388167, -1.67131, -4.22638, 0, 1, 0.5019608, 1,
-0.13742, 1.811309, -0.3469191, 0, 1, 0.509804, 1,
-0.1350773, 0.1524246, 0.5287068, 0, 1, 0.5137255, 1,
-0.1343223, 0.08792143, -1.200391, 0, 1, 0.5215687, 1,
-0.1319311, 0.5635065, -1.43187, 0, 1, 0.5254902, 1,
-0.1294563, 0.08786347, -0.2819586, 0, 1, 0.5333334, 1,
-0.1293619, 1.68315, -1.667844, 0, 1, 0.5372549, 1,
-0.1286053, -0.5366588, -1.322199, 0, 1, 0.5450981, 1,
-0.1284605, -0.5546972, -2.247047, 0, 1, 0.5490196, 1,
-0.1268461, 0.489819, 1.294421, 0, 1, 0.5568628, 1,
-0.1209624, 0.4111432, -0.2712182, 0, 1, 0.5607843, 1,
-0.1208992, -0.1048475, -1.966006, 0, 1, 0.5686275, 1,
-0.1207505, -0.6149295, -3.036902, 0, 1, 0.572549, 1,
-0.1190504, 0.9466062, 1.39965, 0, 1, 0.5803922, 1,
-0.1154273, 0.0404427, 0.6989068, 0, 1, 0.5843138, 1,
-0.1129384, -0.04370033, -2.707339, 0, 1, 0.5921569, 1,
-0.1116983, 0.9495282, 1.010947, 0, 1, 0.5960785, 1,
-0.1104833, 0.8926564, 0.7137889, 0, 1, 0.6039216, 1,
-0.1084153, -0.366995, -3.636515, 0, 1, 0.6117647, 1,
-0.1068743, 0.7968794, -0.3259761, 0, 1, 0.6156863, 1,
-0.1034523, 0.3065472, 1.232279, 0, 1, 0.6235294, 1,
-0.1030332, -0.8440428, -0.8462427, 0, 1, 0.627451, 1,
-0.1021052, 1.602607, -0.2918341, 0, 1, 0.6352941, 1,
-0.0991259, 0.03012009, -0.8131912, 0, 1, 0.6392157, 1,
-0.09674469, 1.513369, -0.8326368, 0, 1, 0.6470588, 1,
-0.09334607, 0.2930759, 1.471881, 0, 1, 0.6509804, 1,
-0.09275987, -0.1366813, -2.803991, 0, 1, 0.6588235, 1,
-0.09268988, 0.7402247, -0.2535852, 0, 1, 0.6627451, 1,
-0.08734076, 0.8009421, -0.6641567, 0, 1, 0.6705883, 1,
-0.08295897, -0.8434045, -1.639559, 0, 1, 0.6745098, 1,
-0.07897574, 1.208004, -0.7409568, 0, 1, 0.682353, 1,
-0.07136451, 0.5183507, -0.1023566, 0, 1, 0.6862745, 1,
-0.07056639, 1.186371, -0.4180647, 0, 1, 0.6941177, 1,
-0.06795043, 1.455763, 0.5252798, 0, 1, 0.7019608, 1,
-0.06650732, 0.9485225, -0.5249504, 0, 1, 0.7058824, 1,
-0.0661561, -0.3651597, -6.248876, 0, 1, 0.7137255, 1,
-0.06462859, 0.3031104, -1.795292, 0, 1, 0.7176471, 1,
-0.06419694, 1.006929, -0.1016588, 0, 1, 0.7254902, 1,
-0.06269722, -0.5025014, -1.725206, 0, 1, 0.7294118, 1,
-0.05779816, -0.3214955, -2.321754, 0, 1, 0.7372549, 1,
-0.05771747, -0.192936, -3.29862, 0, 1, 0.7411765, 1,
-0.0562011, 1.622884, -0.6277544, 0, 1, 0.7490196, 1,
-0.05571603, 1.780328, 0.2819348, 0, 1, 0.7529412, 1,
-0.05248665, 1.146237, -1.342401, 0, 1, 0.7607843, 1,
-0.05175035, 1.131052, 1.062938, 0, 1, 0.7647059, 1,
-0.05056934, -0.1211934, -1.442735, 0, 1, 0.772549, 1,
-0.04541076, 0.9528614, -0.9593451, 0, 1, 0.7764706, 1,
-0.04150178, -0.6751322, -2.039236, 0, 1, 0.7843137, 1,
-0.03907081, 2.194525, 0.4901356, 0, 1, 0.7882353, 1,
-0.03477101, -0.1526987, -3.544165, 0, 1, 0.7960784, 1,
-0.03374576, 0.1498814, 0.00473503, 0, 1, 0.8039216, 1,
-0.02889537, 1.64272, 1.594361, 0, 1, 0.8078431, 1,
-0.02884497, 0.7317985, 1.255712, 0, 1, 0.8156863, 1,
-0.02865443, 1.085275, -0.1512873, 0, 1, 0.8196079, 1,
-0.02474481, -0.01890466, -2.435316, 0, 1, 0.827451, 1,
-0.01955817, -1.186544, -4.028583, 0, 1, 0.8313726, 1,
-0.01848057, -0.4921004, -2.27462, 0, 1, 0.8392157, 1,
-0.01828191, -0.1940782, -1.325543, 0, 1, 0.8431373, 1,
-0.01612739, 0.7545005, 0.7382403, 0, 1, 0.8509804, 1,
-0.01570128, 1.305879, 1.176395, 0, 1, 0.854902, 1,
-0.01532609, 0.5879783, -0.08194955, 0, 1, 0.8627451, 1,
-0.01198376, -0.7394801, -2.903146, 0, 1, 0.8666667, 1,
-0.01136227, 0.4984367, -0.173608, 0, 1, 0.8745098, 1,
-0.01135241, -1.703876, -3.519135, 0, 1, 0.8784314, 1,
-0.01009884, 0.4937417, 0.2641886, 0, 1, 0.8862745, 1,
-0.009277443, -1.502182, -2.831465, 0, 1, 0.8901961, 1,
-0.007982772, -0.1513659, -2.97429, 0, 1, 0.8980392, 1,
-0.007193799, 0.4852948, -0.5712668, 0, 1, 0.9058824, 1,
-0.002320825, 1.540151, 1.125554, 0, 1, 0.9098039, 1,
0.001953481, -0.6310638, 4.914912, 0, 1, 0.9176471, 1,
0.007933817, 1.98978, 0.7253633, 0, 1, 0.9215686, 1,
0.01065964, -0.336664, 3.633121, 0, 1, 0.9294118, 1,
0.01520488, -0.1532123, 2.511793, 0, 1, 0.9333333, 1,
0.01711215, 0.7394578, 0.384921, 0, 1, 0.9411765, 1,
0.02069155, 1.420799, -0.4170693, 0, 1, 0.945098, 1,
0.02202628, 0.7744567, 0.4591331, 0, 1, 0.9529412, 1,
0.02248755, -0.82815, 2.73248, 0, 1, 0.9568627, 1,
0.02348776, -0.4535288, 3.11812, 0, 1, 0.9647059, 1,
0.024131, 0.07680664, -0.0697023, 0, 1, 0.9686275, 1,
0.02783282, 0.3476652, 0.220304, 0, 1, 0.9764706, 1,
0.02829937, 1.230689, -0.3710664, 0, 1, 0.9803922, 1,
0.03205005, 1.569787, -0.28919, 0, 1, 0.9882353, 1,
0.03649021, -0.06510292, 3.3031, 0, 1, 0.9921569, 1,
0.0400917, -0.5548406, 2.661985, 0, 1, 1, 1,
0.04166863, -0.6149102, 3.634562, 0, 0.9921569, 1, 1,
0.04702365, -0.3914389, 1.948232, 0, 0.9882353, 1, 1,
0.04778738, -0.3018231, 4.432469, 0, 0.9803922, 1, 1,
0.05712784, 0.4687848, 1.977176, 0, 0.9764706, 1, 1,
0.05922832, -0.06140755, 3.523939, 0, 0.9686275, 1, 1,
0.06274156, -1.109066, 3.970847, 0, 0.9647059, 1, 1,
0.06280282, -2.8406, 2.474867, 0, 0.9568627, 1, 1,
0.07279696, 0.6401802, -0.04281272, 0, 0.9529412, 1, 1,
0.07284315, -0.5228035, 3.12946, 0, 0.945098, 1, 1,
0.07315972, -0.2369073, 2.836628, 0, 0.9411765, 1, 1,
0.07604194, 1.165526, -1.010298, 0, 0.9333333, 1, 1,
0.07792442, 1.724387, 0.3443873, 0, 0.9294118, 1, 1,
0.07874077, -0.1052108, 1.185273, 0, 0.9215686, 1, 1,
0.08070005, 0.06281545, 1.000025, 0, 0.9176471, 1, 1,
0.08252177, 1.686674, -0.8604195, 0, 0.9098039, 1, 1,
0.08291149, -0.8746656, 1.71028, 0, 0.9058824, 1, 1,
0.08854411, -0.5346279, 4.472705, 0, 0.8980392, 1, 1,
0.09292763, -1.034032, 1.914647, 0, 0.8901961, 1, 1,
0.0933082, -1.046082, 2.184562, 0, 0.8862745, 1, 1,
0.09345946, 0.5741333, 1.054835, 0, 0.8784314, 1, 1,
0.09483281, 0.9797462, -0.4485126, 0, 0.8745098, 1, 1,
0.09559613, 0.3675095, 2.897896, 0, 0.8666667, 1, 1,
0.09613551, 0.07683582, 0.05255349, 0, 0.8627451, 1, 1,
0.09686831, 0.850776, 0.5296927, 0, 0.854902, 1, 1,
0.0981032, -0.6855176, 3.050331, 0, 0.8509804, 1, 1,
0.09879722, 1.192043, -0.3342824, 0, 0.8431373, 1, 1,
0.09914671, 1.480178, 1.446968, 0, 0.8392157, 1, 1,
0.09969644, 0.702767, 0.7087849, 0, 0.8313726, 1, 1,
0.1008253, -0.0740994, 0.9717106, 0, 0.827451, 1, 1,
0.1026753, -1.075972, 3.799926, 0, 0.8196079, 1, 1,
0.1134493, -0.1353678, 2.153049, 0, 0.8156863, 1, 1,
0.1155844, 1.435141, 0.2733649, 0, 0.8078431, 1, 1,
0.116251, 0.4505839, -1.48398, 0, 0.8039216, 1, 1,
0.1199357, 0.5067881, 1.434677, 0, 0.7960784, 1, 1,
0.1226508, -0.8382624, 2.661985, 0, 0.7882353, 1, 1,
0.1253528, 0.1581061, 2.749178, 0, 0.7843137, 1, 1,
0.1269378, 0.5445499, -1.391766, 0, 0.7764706, 1, 1,
0.1282865, 0.6165521, -1.127903, 0, 0.772549, 1, 1,
0.1319441, 0.1969785, -0.9407412, 0, 0.7647059, 1, 1,
0.1321966, -0.1736979, 3.315374, 0, 0.7607843, 1, 1,
0.1338807, 0.4670382, -0.317637, 0, 0.7529412, 1, 1,
0.1343614, -0.168369, 1.617361, 0, 0.7490196, 1, 1,
0.1351651, 0.4788412, -0.05907122, 0, 0.7411765, 1, 1,
0.1390163, -0.09871361, 1.323118, 0, 0.7372549, 1, 1,
0.1410598, 2.299294, 0.8794677, 0, 0.7294118, 1, 1,
0.1426281, -0.4616803, 4.168931, 0, 0.7254902, 1, 1,
0.1443935, -0.260785, 3.871239, 0, 0.7176471, 1, 1,
0.1459479, -0.8215125, 1.703158, 0, 0.7137255, 1, 1,
0.1465004, 0.1310669, -0.1566719, 0, 0.7058824, 1, 1,
0.1518426, 1.04048, -0.318831, 0, 0.6980392, 1, 1,
0.1527525, 0.8661003, -0.7373287, 0, 0.6941177, 1, 1,
0.1532138, -0.7655768, 4.500629, 0, 0.6862745, 1, 1,
0.1544106, -1.449896, 1.142405, 0, 0.682353, 1, 1,
0.1576979, 0.09222317, 1.182111, 0, 0.6745098, 1, 1,
0.1587414, 0.3448585, 1.076621, 0, 0.6705883, 1, 1,
0.1587932, -1.057892, 3.589468, 0, 0.6627451, 1, 1,
0.1594821, 1.499597, -0.3906521, 0, 0.6588235, 1, 1,
0.162914, 0.6301941, 0.8733351, 0, 0.6509804, 1, 1,
0.1656658, -0.6440842, 2.949649, 0, 0.6470588, 1, 1,
0.1665319, 1.006389, -2.244376, 0, 0.6392157, 1, 1,
0.1700571, -0.9796069, 2.536035, 0, 0.6352941, 1, 1,
0.1718085, 0.3778104, -1.217809, 0, 0.627451, 1, 1,
0.1720321, 1.312921, 0.2399828, 0, 0.6235294, 1, 1,
0.1751729, -0.1389962, 2.288947, 0, 0.6156863, 1, 1,
0.1820224, -0.4497975, 1.873179, 0, 0.6117647, 1, 1,
0.1852553, -0.1441117, 3.233567, 0, 0.6039216, 1, 1,
0.1856455, 0.711642, 1.175893, 0, 0.5960785, 1, 1,
0.187052, 0.5300779, -0.1795666, 0, 0.5921569, 1, 1,
0.1877589, 1.749018, 0.5345755, 0, 0.5843138, 1, 1,
0.1887493, 1.290307, 0.5014389, 0, 0.5803922, 1, 1,
0.1888976, 0.1464101, -1.029534, 0, 0.572549, 1, 1,
0.1965044, -1.632982, 3.647208, 0, 0.5686275, 1, 1,
0.200403, -0.5255188, 3.342783, 0, 0.5607843, 1, 1,
0.2041397, 1.777737, -0.001978604, 0, 0.5568628, 1, 1,
0.2093528, -0.6383703, 3.915621, 0, 0.5490196, 1, 1,
0.2103243, -0.6817359, 4.884706, 0, 0.5450981, 1, 1,
0.2111746, -0.2960434, 3.513989, 0, 0.5372549, 1, 1,
0.2128987, -0.4433509, 2.206599, 0, 0.5333334, 1, 1,
0.2200367, -1.068824, 1.794318, 0, 0.5254902, 1, 1,
0.2201972, 1.796999, 0.4535314, 0, 0.5215687, 1, 1,
0.2234373, 1.318244, -1.638532, 0, 0.5137255, 1, 1,
0.2287182, -2.484627, 3.486837, 0, 0.509804, 1, 1,
0.229344, -1.72785, 2.497051, 0, 0.5019608, 1, 1,
0.233781, 1.811957, -0.4335594, 0, 0.4941176, 1, 1,
0.2343386, 0.2435994, 0.3494781, 0, 0.4901961, 1, 1,
0.2351293, -0.7634152, 3.189233, 0, 0.4823529, 1, 1,
0.2353461, -0.1623036, 0.1972152, 0, 0.4784314, 1, 1,
0.2369543, -2.009799, 3.099614, 0, 0.4705882, 1, 1,
0.2378997, -1.456935, 3.731101, 0, 0.4666667, 1, 1,
0.2524644, -0.7662531, 3.502858, 0, 0.4588235, 1, 1,
0.2550408, -0.2299864, 2.82922, 0, 0.454902, 1, 1,
0.2551633, 1.693956, 0.5576271, 0, 0.4470588, 1, 1,
0.2656822, 0.8194838, 0.2170714, 0, 0.4431373, 1, 1,
0.2659266, 0.6116238, -1.055804, 0, 0.4352941, 1, 1,
0.2676623, 0.2427089, 1.822273, 0, 0.4313726, 1, 1,
0.2704205, 1.622222, 1.755215, 0, 0.4235294, 1, 1,
0.2705348, 1.108645, -1.360067, 0, 0.4196078, 1, 1,
0.2750404, -0.1985949, 2.00798, 0, 0.4117647, 1, 1,
0.2754777, -2.325666, 3.384576, 0, 0.4078431, 1, 1,
0.275537, -0.3539304, 2.907469, 0, 0.4, 1, 1,
0.2783142, -1.823697, 3.650034, 0, 0.3921569, 1, 1,
0.2802507, -1.421964, 3.533439, 0, 0.3882353, 1, 1,
0.2821666, -0.1362076, 2.283296, 0, 0.3803922, 1, 1,
0.2905842, 0.5233405, 0.1462443, 0, 0.3764706, 1, 1,
0.2950416, 0.9503273, -0.1834973, 0, 0.3686275, 1, 1,
0.2956191, -0.2221491, 1.990336, 0, 0.3647059, 1, 1,
0.2985986, -0.8140213, 2.50856, 0, 0.3568628, 1, 1,
0.2997572, -2.111618, 1.228523, 0, 0.3529412, 1, 1,
0.3013563, -0.4464692, 3.677584, 0, 0.345098, 1, 1,
0.3017085, -0.1885949, 2.000047, 0, 0.3411765, 1, 1,
0.3030932, 0.04262671, 3.446658, 0, 0.3333333, 1, 1,
0.3045589, -1.148453, 2.806091, 0, 0.3294118, 1, 1,
0.3090397, -1.008302, 3.459141, 0, 0.3215686, 1, 1,
0.3108758, -0.5997546, 2.663239, 0, 0.3176471, 1, 1,
0.3185572, -1.026135, 3.819586, 0, 0.3098039, 1, 1,
0.3224913, 0.243843, 0.2956534, 0, 0.3058824, 1, 1,
0.3240888, 0.7793696, 1.792859, 0, 0.2980392, 1, 1,
0.3253745, -0.4144398, 1.796057, 0, 0.2901961, 1, 1,
0.3294276, -0.4355941, 2.865473, 0, 0.2862745, 1, 1,
0.3408492, -0.07468324, 2.74578, 0, 0.2784314, 1, 1,
0.3425567, -0.2876401, 3.031097, 0, 0.2745098, 1, 1,
0.3448634, 0.6459732, 0.9261885, 0, 0.2666667, 1, 1,
0.3471857, 1.454718, -0.4118131, 0, 0.2627451, 1, 1,
0.3481347, 0.3313673, 2.614543, 0, 0.254902, 1, 1,
0.3483316, 1.10451, -0.5232098, 0, 0.2509804, 1, 1,
0.3565359, 1.664658, 0.1567977, 0, 0.2431373, 1, 1,
0.356903, -1.787263, 2.332239, 0, 0.2392157, 1, 1,
0.3622951, 0.04812296, 2.271009, 0, 0.2313726, 1, 1,
0.3643335, -1.863402, 2.878597, 0, 0.227451, 1, 1,
0.3651907, 0.2177148, -0.03153273, 0, 0.2196078, 1, 1,
0.3665709, -0.4881553, 4.389136, 0, 0.2156863, 1, 1,
0.3690273, -0.4846312, 3.366821, 0, 0.2078431, 1, 1,
0.3722927, -0.9634023, 0.9255846, 0, 0.2039216, 1, 1,
0.3725042, -1.093622, 3.775252, 0, 0.1960784, 1, 1,
0.3735736, 0.3164, 1.301195, 0, 0.1882353, 1, 1,
0.374119, 1.671155, -0.5287325, 0, 0.1843137, 1, 1,
0.3751569, -0.8150424, 1.260233, 0, 0.1764706, 1, 1,
0.3815023, -1.769994, 2.752039, 0, 0.172549, 1, 1,
0.38185, 1.155789, -0.2742779, 0, 0.1647059, 1, 1,
0.3837809, 1.427092, 1.709439, 0, 0.1607843, 1, 1,
0.3861544, 0.6371463, 1.88237, 0, 0.1529412, 1, 1,
0.3900084, 0.3726195, 1.856192, 0, 0.1490196, 1, 1,
0.3904005, 0.5989841, 1.112129, 0, 0.1411765, 1, 1,
0.3955428, -0.3991617, 2.169159, 0, 0.1372549, 1, 1,
0.3967061, -0.4318972, 1.337304, 0, 0.1294118, 1, 1,
0.398734, -0.9585865, 2.429472, 0, 0.1254902, 1, 1,
0.405055, 0.6422373, 1.290913, 0, 0.1176471, 1, 1,
0.4087404, -0.5806029, 0.654958, 0, 0.1137255, 1, 1,
0.4120824, -0.09270379, 0.700071, 0, 0.1058824, 1, 1,
0.4146006, 0.8589834, 0.5166135, 0, 0.09803922, 1, 1,
0.4167846, 0.8505349, 0.860528, 0, 0.09411765, 1, 1,
0.4192623, -0.993966, 3.029625, 0, 0.08627451, 1, 1,
0.420378, 1.255218, 1.152974, 0, 0.08235294, 1, 1,
0.4234973, -1.606976, 4.437371, 0, 0.07450981, 1, 1,
0.4300715, -0.8330613, 2.594279, 0, 0.07058824, 1, 1,
0.4365293, 1.451715, 0.9414058, 0, 0.0627451, 1, 1,
0.4393129, 0.1529702, 1.369659, 0, 0.05882353, 1, 1,
0.4407822, 1.172822, 2.835649, 0, 0.05098039, 1, 1,
0.4415586, -0.1321525, 1.044273, 0, 0.04705882, 1, 1,
0.4423944, 0.9612817, -0.2571093, 0, 0.03921569, 1, 1,
0.4452286, -0.03479236, 1.115135, 0, 0.03529412, 1, 1,
0.4506585, -0.5865449, 3.798447, 0, 0.02745098, 1, 1,
0.4512057, -0.09006046, 0.8457975, 0, 0.02352941, 1, 1,
0.4518353, -0.1126845, 1.913852, 0, 0.01568628, 1, 1,
0.4536372, 0.7985184, 1.628707, 0, 0.01176471, 1, 1,
0.4547199, -1.4621, 2.655515, 0, 0.003921569, 1, 1,
0.4559887, 1.171813, 0.3615469, 0.003921569, 0, 1, 1,
0.4568183, -0.03836397, 0.6019269, 0.007843138, 0, 1, 1,
0.4583438, -1.818788, 3.383618, 0.01568628, 0, 1, 1,
0.4587505, -0.6226901, 2.864078, 0.01960784, 0, 1, 1,
0.4591038, -0.1586635, 1.488021, 0.02745098, 0, 1, 1,
0.45964, 0.6132477, 1.188398, 0.03137255, 0, 1, 1,
0.4633886, 0.8793195, 2.093242, 0.03921569, 0, 1, 1,
0.4666947, -0.564066, 2.137061, 0.04313726, 0, 1, 1,
0.4668064, 1.026453, -0.7964416, 0.05098039, 0, 1, 1,
0.4668585, 0.3598706, 0.5438361, 0.05490196, 0, 1, 1,
0.4682601, 0.400437, 0.02438377, 0.0627451, 0, 1, 1,
0.4700626, -0.02007187, 0.3917543, 0.06666667, 0, 1, 1,
0.4716766, -1.847733, 2.148171, 0.07450981, 0, 1, 1,
0.4718086, -1.327726, 2.359124, 0.07843138, 0, 1, 1,
0.4729244, 0.8223379, 0.2027261, 0.08627451, 0, 1, 1,
0.4753477, 0.8619658, 0.6493155, 0.09019608, 0, 1, 1,
0.4769149, 0.3178343, 2.385838, 0.09803922, 0, 1, 1,
0.4774699, 0.2766637, 1.066242, 0.1058824, 0, 1, 1,
0.4776722, -1.342497, 0.9534469, 0.1098039, 0, 1, 1,
0.478543, 0.1646834, 3.158571, 0.1176471, 0, 1, 1,
0.4801094, -0.6423573, 1.081002, 0.1215686, 0, 1, 1,
0.4811282, 0.4837697, 0.6529358, 0.1294118, 0, 1, 1,
0.4815881, -0.7054725, 2.497666, 0.1333333, 0, 1, 1,
0.4879766, -1.08502, 1.525326, 0.1411765, 0, 1, 1,
0.4888492, -0.1696462, 0.4805636, 0.145098, 0, 1, 1,
0.4917034, -1.307217, 2.584471, 0.1529412, 0, 1, 1,
0.4989729, 1.948985, 0.3794407, 0.1568628, 0, 1, 1,
0.5005724, -1.688474, 3.777576, 0.1647059, 0, 1, 1,
0.504917, -1.507716, 2.172976, 0.1686275, 0, 1, 1,
0.508916, 0.749864, 2.04235, 0.1764706, 0, 1, 1,
0.5154395, -1.074373, 1.576198, 0.1803922, 0, 1, 1,
0.5156549, 0.2753434, 0.5282981, 0.1882353, 0, 1, 1,
0.5173733, -0.1455948, 0.8167892, 0.1921569, 0, 1, 1,
0.5178257, 1.245595, 0.2576995, 0.2, 0, 1, 1,
0.5198452, 0.3677915, 1.513909, 0.2078431, 0, 1, 1,
0.5318317, 1.284956, -1.348169, 0.2117647, 0, 1, 1,
0.5337461, 0.3265691, 0.7656758, 0.2196078, 0, 1, 1,
0.534403, -2.059156, 2.963506, 0.2235294, 0, 1, 1,
0.5349855, -1.073337, 2.466307, 0.2313726, 0, 1, 1,
0.5374937, -0.2930734, 1.548621, 0.2352941, 0, 1, 1,
0.5472048, 1.848867, -0.4441029, 0.2431373, 0, 1, 1,
0.5482354, 1.572538, -1.076998, 0.2470588, 0, 1, 1,
0.5491768, -0.848653, 3.922597, 0.254902, 0, 1, 1,
0.5499557, 0.1025156, 1.238065, 0.2588235, 0, 1, 1,
0.5508512, 0.6100198, 1.190383, 0.2666667, 0, 1, 1,
0.5514475, -0.4890869, 3.414687, 0.2705882, 0, 1, 1,
0.5548863, -0.4629804, 2.998237, 0.2784314, 0, 1, 1,
0.5596806, -0.02109946, 0.07134163, 0.282353, 0, 1, 1,
0.5600963, 1.570932, 0.3340121, 0.2901961, 0, 1, 1,
0.5701588, -0.606244, 3.332156, 0.2941177, 0, 1, 1,
0.5725205, -0.01485455, 1.534972, 0.3019608, 0, 1, 1,
0.5725667, -1.102532, 2.408013, 0.3098039, 0, 1, 1,
0.5754097, -0.2444604, 2.521874, 0.3137255, 0, 1, 1,
0.5774743, 0.1370004, 0.5147378, 0.3215686, 0, 1, 1,
0.5834468, 2.525829, -1.87859, 0.3254902, 0, 1, 1,
0.5834854, -1.766943, 2.991451, 0.3333333, 0, 1, 1,
0.5882643, 1.808084, 0.6510186, 0.3372549, 0, 1, 1,
0.6020949, -1.001067, 3.177641, 0.345098, 0, 1, 1,
0.6025217, -0.8210425, 1.825614, 0.3490196, 0, 1, 1,
0.6063295, 1.902234, -0.009981209, 0.3568628, 0, 1, 1,
0.6064262, -0.3966455, 1.687119, 0.3607843, 0, 1, 1,
0.6101621, 2.121906, 2.24743, 0.3686275, 0, 1, 1,
0.6108263, -0.9158438, 3.470201, 0.372549, 0, 1, 1,
0.6242683, 0.6322594, 0.3364407, 0.3803922, 0, 1, 1,
0.6276766, -2.715119, 3.285758, 0.3843137, 0, 1, 1,
0.6348992, -0.5847791, 1.474788, 0.3921569, 0, 1, 1,
0.6356229, -0.3250863, 2.084752, 0.3960784, 0, 1, 1,
0.6368435, -0.1045987, 0.5869078, 0.4039216, 0, 1, 1,
0.6373438, 1.664088, -2.309259, 0.4117647, 0, 1, 1,
0.6410507, -0.5353916, -0.182883, 0.4156863, 0, 1, 1,
0.6429223, 1.538898, -1.161891, 0.4235294, 0, 1, 1,
0.6447836, -0.3733101, 3.491495, 0.427451, 0, 1, 1,
0.649413, 1.31238, 0.2809199, 0.4352941, 0, 1, 1,
0.6507997, -0.4321719, 1.226025, 0.4392157, 0, 1, 1,
0.6528106, -0.3112403, 1.071524, 0.4470588, 0, 1, 1,
0.6535563, 0.4087575, -1.012835, 0.4509804, 0, 1, 1,
0.6548419, -0.4887263, 1.989282, 0.4588235, 0, 1, 1,
0.6570824, -0.4345934, 2.291801, 0.4627451, 0, 1, 1,
0.6578471, 0.2082579, 0.499449, 0.4705882, 0, 1, 1,
0.6609143, -0.9964194, 3.226971, 0.4745098, 0, 1, 1,
0.6641424, -0.105596, 1.879069, 0.4823529, 0, 1, 1,
0.6721121, 0.490813, 2.009572, 0.4862745, 0, 1, 1,
0.6724905, 0.2017524, 1.257753, 0.4941176, 0, 1, 1,
0.6805692, -0.0312465, 2.601555, 0.5019608, 0, 1, 1,
0.6844347, -0.4001225, 2.307486, 0.5058824, 0, 1, 1,
0.6868338, -0.1357566, 2.632401, 0.5137255, 0, 1, 1,
0.6952302, 0.3771122, 1.483154, 0.5176471, 0, 1, 1,
0.6969301, -2.769259, 1.949777, 0.5254902, 0, 1, 1,
0.7005681, -1.066247, 1.482802, 0.5294118, 0, 1, 1,
0.7024446, 0.4972903, 1.483243, 0.5372549, 0, 1, 1,
0.7040967, -0.3214436, 1.964361, 0.5411765, 0, 1, 1,
0.718824, 0.1819643, 2.010642, 0.5490196, 0, 1, 1,
0.7191988, -0.959331, 3.918133, 0.5529412, 0, 1, 1,
0.7326348, -0.7119719, 3.077718, 0.5607843, 0, 1, 1,
0.7381412, 0.09958394, 1.400067, 0.5647059, 0, 1, 1,
0.7394537, -1.832095, 2.42924, 0.572549, 0, 1, 1,
0.7423421, -1.395218, 3.352056, 0.5764706, 0, 1, 1,
0.7425459, 0.6817594, -0.3716601, 0.5843138, 0, 1, 1,
0.7439112, 0.171557, 0.642239, 0.5882353, 0, 1, 1,
0.7517623, -1.002049, 3.83107, 0.5960785, 0, 1, 1,
0.7518038, 0.9583105, 0.5383704, 0.6039216, 0, 1, 1,
0.7525471, -0.4642146, 2.567602, 0.6078432, 0, 1, 1,
0.7527555, -0.1672168, 3.416619, 0.6156863, 0, 1, 1,
0.7600148, -2.60457, 3.246066, 0.6196079, 0, 1, 1,
0.7605578, 0.627552, 3.29408, 0.627451, 0, 1, 1,
0.7684981, -2.17007, 3.68067, 0.6313726, 0, 1, 1,
0.771722, 1.169734, -0.9230303, 0.6392157, 0, 1, 1,
0.776744, -0.2963646, 2.015211, 0.6431373, 0, 1, 1,
0.7786645, -0.88073, 2.404477, 0.6509804, 0, 1, 1,
0.7804409, 0.5245914, 1.244834, 0.654902, 0, 1, 1,
0.782648, 0.2591466, 2.884988, 0.6627451, 0, 1, 1,
0.7906498, -0.2310949, 2.862473, 0.6666667, 0, 1, 1,
0.7910184, -0.6549428, 3.429128, 0.6745098, 0, 1, 1,
0.7914408, 1.240724, 0.2007092, 0.6784314, 0, 1, 1,
0.7961335, 0.06211155, 1.331659, 0.6862745, 0, 1, 1,
0.7977314, 0.6946961, 1.69505, 0.6901961, 0, 1, 1,
0.8029053, 0.2721781, 1.572131, 0.6980392, 0, 1, 1,
0.8052792, 0.336836, 2.032481, 0.7058824, 0, 1, 1,
0.8072643, 0.4405155, 1.045486, 0.7098039, 0, 1, 1,
0.8073958, 1.291089, 1.383379, 0.7176471, 0, 1, 1,
0.8194757, 0.6856318, 0.7832108, 0.7215686, 0, 1, 1,
0.8203036, 0.6133614, 1.523011, 0.7294118, 0, 1, 1,
0.8207344, 2.128376, -0.1324055, 0.7333333, 0, 1, 1,
0.8224413, 0.1128884, 3.059808, 0.7411765, 0, 1, 1,
0.8237402, -0.8973677, 1.28307, 0.7450981, 0, 1, 1,
0.8239495, -0.5373845, 2.895427, 0.7529412, 0, 1, 1,
0.8307806, -1.625296, 4.171103, 0.7568628, 0, 1, 1,
0.8343972, -0.07433822, -0.5194027, 0.7647059, 0, 1, 1,
0.8399988, 1.145945, 0.8112283, 0.7686275, 0, 1, 1,
0.8429765, -1.317662, 1.975278, 0.7764706, 0, 1, 1,
0.8463537, 0.6551435, 0.3930462, 0.7803922, 0, 1, 1,
0.8471546, 0.3409594, 0.6353611, 0.7882353, 0, 1, 1,
0.8594393, 0.1728574, 1.700433, 0.7921569, 0, 1, 1,
0.8628387, -0.7683588, 1.412769, 0.8, 0, 1, 1,
0.8637158, 0.728956, 0.6996919, 0.8078431, 0, 1, 1,
0.868564, -0.2422728, 2.32072, 0.8117647, 0, 1, 1,
0.8726007, 1.197729, 2.788151, 0.8196079, 0, 1, 1,
0.8775495, 1.265662, 0.4528624, 0.8235294, 0, 1, 1,
0.8862814, -0.2355606, 2.030933, 0.8313726, 0, 1, 1,
0.8894958, 0.7051145, 1.51593, 0.8352941, 0, 1, 1,
0.8903571, -0.7707453, 2.819874, 0.8431373, 0, 1, 1,
0.8923352, -0.6747605, 2.312103, 0.8470588, 0, 1, 1,
0.9114817, -0.1456841, 0.7392297, 0.854902, 0, 1, 1,
0.9153798, 0.09515408, 0.1455467, 0.8588235, 0, 1, 1,
0.9272581, -0.3699216, 1.454277, 0.8666667, 0, 1, 1,
0.9354663, 0.6143783, 1.289482, 0.8705882, 0, 1, 1,
0.9360203, -0.8621882, 2.802726, 0.8784314, 0, 1, 1,
0.9402435, -1.692922, -0.2492546, 0.8823529, 0, 1, 1,
0.9458166, -0.3933152, 2.16156, 0.8901961, 0, 1, 1,
0.9559625, 1.367165, -1.017079, 0.8941177, 0, 1, 1,
0.9576377, 1.117349, 0.4973492, 0.9019608, 0, 1, 1,
0.9585294, 0.6300616, 1.376334, 0.9098039, 0, 1, 1,
0.9603429, -1.013135, 2.430104, 0.9137255, 0, 1, 1,
0.9646891, 0.5007475, 2.105175, 0.9215686, 0, 1, 1,
0.9668099, 1.366359, -0.06907191, 0.9254902, 0, 1, 1,
0.9698595, 0.3008625, 0.3599465, 0.9333333, 0, 1, 1,
0.9742435, 1.845477, 1.618115, 0.9372549, 0, 1, 1,
0.9784017, -1.093582, 2.474773, 0.945098, 0, 1, 1,
0.9800947, 0.4288371, 1.059056, 0.9490196, 0, 1, 1,
0.9805503, -0.09006545, 0.7355442, 0.9568627, 0, 1, 1,
0.9832786, -0.3374953, 1.21193, 0.9607843, 0, 1, 1,
0.9854554, 0.6499044, 2.165421, 0.9686275, 0, 1, 1,
0.986669, -1.815703, 2.070969, 0.972549, 0, 1, 1,
0.9878606, 1.484167, 0.9274862, 0.9803922, 0, 1, 1,
0.9951935, -0.3010157, 0.928199, 0.9843137, 0, 1, 1,
0.9971722, 0.4745824, 0.6499682, 0.9921569, 0, 1, 1,
1.006844, -0.4329773, 0.5812005, 0.9960784, 0, 1, 1,
1.011687, 0.5835416, -0.6161739, 1, 0, 0.9960784, 1,
1.017245, 1.36031, 0.6206476, 1, 0, 0.9882353, 1,
1.01752, 0.8578232, 0.5860792, 1, 0, 0.9843137, 1,
1.021964, 1.806047, 1.621899, 1, 0, 0.9764706, 1,
1.023466, 1.024743, 1.500768, 1, 0, 0.972549, 1,
1.024038, 1.583497, 1.485833, 1, 0, 0.9647059, 1,
1.025259, -0.8995661, 3.082276, 1, 0, 0.9607843, 1,
1.025544, 1.062668, 1.614507, 1, 0, 0.9529412, 1,
1.037282, 0.9376631, 0.6654618, 1, 0, 0.9490196, 1,
1.048036, 1.307693, 0.9090416, 1, 0, 0.9411765, 1,
1.048163, -1.72805, 4.277436, 1, 0, 0.9372549, 1,
1.049577, 0.5360005, 0.4014233, 1, 0, 0.9294118, 1,
1.052483, 0.4145969, 1.151533, 1, 0, 0.9254902, 1,
1.056843, 1.281944, 0.9195841, 1, 0, 0.9176471, 1,
1.057865, 0.2264482, 0.7380656, 1, 0, 0.9137255, 1,
1.058402, 1.290586, 0.6466733, 1, 0, 0.9058824, 1,
1.061264, -0.7560658, 4.00334, 1, 0, 0.9019608, 1,
1.066189, -0.6461775, 0.8494278, 1, 0, 0.8941177, 1,
1.066827, -1.555633, 3.326727, 1, 0, 0.8862745, 1,
1.068009, 0.8866295, 1.261244, 1, 0, 0.8823529, 1,
1.069423, -0.5830151, 2.749605, 1, 0, 0.8745098, 1,
1.071275, -0.2482826, 2.173152, 1, 0, 0.8705882, 1,
1.08163, 0.3492602, -1.360596, 1, 0, 0.8627451, 1,
1.08272, 0.9877347, 1.926238, 1, 0, 0.8588235, 1,
1.083176, 0.5202008, 2.327065, 1, 0, 0.8509804, 1,
1.084942, -0.6792575, 3.755532, 1, 0, 0.8470588, 1,
1.086024, 1.119291, 1.054481, 1, 0, 0.8392157, 1,
1.088314, -1.124612, 3.288072, 1, 0, 0.8352941, 1,
1.094647, -0.06717306, 1.855325, 1, 0, 0.827451, 1,
1.099877, -0.4590504, 0.2490647, 1, 0, 0.8235294, 1,
1.099951, 0.596041, 1.633606, 1, 0, 0.8156863, 1,
1.100875, -0.7150782, 3.179903, 1, 0, 0.8117647, 1,
1.10665, 0.4092052, 1.691126, 1, 0, 0.8039216, 1,
1.11124, -0.3468246, 2.466557, 1, 0, 0.7960784, 1,
1.112105, 1.884864, -0.2743993, 1, 0, 0.7921569, 1,
1.118989, -1.138984, 2.117129, 1, 0, 0.7843137, 1,
1.11957, 1.335865, 1.937527, 1, 0, 0.7803922, 1,
1.120663, -0.9989774, 2.506504, 1, 0, 0.772549, 1,
1.124703, 0.267835, 2.071724, 1, 0, 0.7686275, 1,
1.127415, -0.5474385, 2.335052, 1, 0, 0.7607843, 1,
1.137446, 0.5085922, 0.7743239, 1, 0, 0.7568628, 1,
1.145543, 0.3563529, 1.84032, 1, 0, 0.7490196, 1,
1.1532, 1.686042, -0.9599181, 1, 0, 0.7450981, 1,
1.153405, -0.7982149, 3.225604, 1, 0, 0.7372549, 1,
1.157597, -0.7658136, 2.744093, 1, 0, 0.7333333, 1,
1.1577, -0.2765039, 1.800528, 1, 0, 0.7254902, 1,
1.15891, 0.374668, 1.910096, 1, 0, 0.7215686, 1,
1.167784, 0.4876384, -1.139074, 1, 0, 0.7137255, 1,
1.172258, -0.1583648, 3.215734, 1, 0, 0.7098039, 1,
1.178454, -0.5324094, 1.739941, 1, 0, 0.7019608, 1,
1.178814, 0.8498548, 0.7796183, 1, 0, 0.6941177, 1,
1.181537, 0.1587565, 2.176872, 1, 0, 0.6901961, 1,
1.190035, -2.101641, 3.20504, 1, 0, 0.682353, 1,
1.19513, -0.7475306, 2.215629, 1, 0, 0.6784314, 1,
1.195924, -0.6487761, 1.924962, 1, 0, 0.6705883, 1,
1.210709, -0.8510813, 1.573365, 1, 0, 0.6666667, 1,
1.22005, -0.3971876, 1.167625, 1, 0, 0.6588235, 1,
1.222818, 0.905144, 1.012021, 1, 0, 0.654902, 1,
1.229873, 0.1618069, 0.5736521, 1, 0, 0.6470588, 1,
1.23258, -0.9080673, 2.414954, 1, 0, 0.6431373, 1,
1.236201, -0.1228911, 3.735448, 1, 0, 0.6352941, 1,
1.241095, 0.4430979, 1.729247, 1, 0, 0.6313726, 1,
1.255601, -2.022267, 2.225373, 1, 0, 0.6235294, 1,
1.25694, -0.3810493, 0.04196189, 1, 0, 0.6196079, 1,
1.258465, 0.05425575, 1.735882, 1, 0, 0.6117647, 1,
1.264387, -1.483361, 2.47068, 1, 0, 0.6078432, 1,
1.267401, 0.5923964, 0.8630816, 1, 0, 0.6, 1,
1.277842, 1.627291, 0.8932282, 1, 0, 0.5921569, 1,
1.282318, 0.1723941, 1.24001, 1, 0, 0.5882353, 1,
1.288893, -1.566797, 2.543646, 1, 0, 0.5803922, 1,
1.298152, 0.1616408, 1.892511, 1, 0, 0.5764706, 1,
1.300701, -0.9454929, 0.8766694, 1, 0, 0.5686275, 1,
1.31371, -1.244138, 3.050689, 1, 0, 0.5647059, 1,
1.334079, -1.380791, 3.111225, 1, 0, 0.5568628, 1,
1.341998, 0.7790929, 1.130186, 1, 0, 0.5529412, 1,
1.345237, -2.111856, 1.375838, 1, 0, 0.5450981, 1,
1.353514, -1.021267, 0.2587005, 1, 0, 0.5411765, 1,
1.354767, -0.03830999, 0.2795094, 1, 0, 0.5333334, 1,
1.361287, -0.2430314, 2.610996, 1, 0, 0.5294118, 1,
1.366609, 1.001228, 0.5564812, 1, 0, 0.5215687, 1,
1.397032, 0.3300372, 0.3445556, 1, 0, 0.5176471, 1,
1.400771, -1.036936, 3.813131, 1, 0, 0.509804, 1,
1.406708, -1.179658, 2.309711, 1, 0, 0.5058824, 1,
1.428831, 1.000626, 0.6491468, 1, 0, 0.4980392, 1,
1.429411, -0.03317787, 1.740181, 1, 0, 0.4901961, 1,
1.431601, -0.2306707, 3.114457, 1, 0, 0.4862745, 1,
1.457618, -0.6979594, 2.222333, 1, 0, 0.4784314, 1,
1.458517, 0.5515123, 1.054432, 1, 0, 0.4745098, 1,
1.479887, -0.7475157, 1.860999, 1, 0, 0.4666667, 1,
1.490397, 1.267625, 0.2065327, 1, 0, 0.4627451, 1,
1.503362, 0.1412147, 2.602469, 1, 0, 0.454902, 1,
1.505535, -2.364801, 2.929358, 1, 0, 0.4509804, 1,
1.505633, 0.6192037, 2.179433, 1, 0, 0.4431373, 1,
1.513525, 0.746922, 0.08327887, 1, 0, 0.4392157, 1,
1.535483, 0.5606018, 0.948355, 1, 0, 0.4313726, 1,
1.535835, -0.7437288, 2.808882, 1, 0, 0.427451, 1,
1.54081, -0.5090936, 1.908522, 1, 0, 0.4196078, 1,
1.565783, 0.5170032, -0.6955605, 1, 0, 0.4156863, 1,
1.568892, 1.117656, 0.5364838, 1, 0, 0.4078431, 1,
1.570772, 0.4037803, -1.22931, 1, 0, 0.4039216, 1,
1.571459, -0.3268303, 0.6543289, 1, 0, 0.3960784, 1,
1.58341, -1.199652, 2.035552, 1, 0, 0.3882353, 1,
1.586874, -0.203352, 2.847206, 1, 0, 0.3843137, 1,
1.59838, 0.9685162, 2.316441, 1, 0, 0.3764706, 1,
1.601889, 0.0957092, 1.878931, 1, 0, 0.372549, 1,
1.605218, -0.1241743, 0.5081526, 1, 0, 0.3647059, 1,
1.615152, 0.9576836, 1.881135, 1, 0, 0.3607843, 1,
1.623195, 0.4253976, 0.1640541, 1, 0, 0.3529412, 1,
1.641607, 0.5940932, 0.6542754, 1, 0, 0.3490196, 1,
1.655314, -0.5378649, 3.141287, 1, 0, 0.3411765, 1,
1.661097, -0.1814365, 0.4820611, 1, 0, 0.3372549, 1,
1.669819, -0.2834007, 2.936706, 1, 0, 0.3294118, 1,
1.685455, -0.8594005, 1.795677, 1, 0, 0.3254902, 1,
1.688235, -0.4539071, 1.268155, 1, 0, 0.3176471, 1,
1.694342, -1.26466, 2.166201, 1, 0, 0.3137255, 1,
1.702171, 1.214435, 0.7301039, 1, 0, 0.3058824, 1,
1.710436, -0.6585125, 2.53018, 1, 0, 0.2980392, 1,
1.712851, 0.7035744, -1.735305, 1, 0, 0.2941177, 1,
1.716308, -0.3192314, 1.892362, 1, 0, 0.2862745, 1,
1.721859, -1.594906, 2.938741, 1, 0, 0.282353, 1,
1.754264, 0.2107024, 2.400551, 1, 0, 0.2745098, 1,
1.754749, 0.9106861, -0.1519048, 1, 0, 0.2705882, 1,
1.76452, -1.576127, 4.068709, 1, 0, 0.2627451, 1,
1.775143, -0.3200805, 3.383698, 1, 0, 0.2588235, 1,
1.789216, -1.905607, 2.451007, 1, 0, 0.2509804, 1,
1.800628, -0.7542262, 1.750991, 1, 0, 0.2470588, 1,
1.812386, -0.9338149, 2.296131, 1, 0, 0.2392157, 1,
1.820006, -0.9982191, 2.34406, 1, 0, 0.2352941, 1,
1.868706, 0.9795567, 0.4413387, 1, 0, 0.227451, 1,
1.885343, -0.6656712, 1.934306, 1, 0, 0.2235294, 1,
1.894696, 0.01442618, 2.47981, 1, 0, 0.2156863, 1,
1.906165, -0.4643225, 3.065216, 1, 0, 0.2117647, 1,
1.91583, 1.235025, 1.437828, 1, 0, 0.2039216, 1,
1.972752, 0.2044142, 1.22523, 1, 0, 0.1960784, 1,
1.975958, -0.4250262, 1.485648, 1, 0, 0.1921569, 1,
1.986384, -1.092281, 1.735706, 1, 0, 0.1843137, 1,
2.001174, -0.8273263, 2.416886, 1, 0, 0.1803922, 1,
2.002651, -0.7535291, 2.353111, 1, 0, 0.172549, 1,
2.023912, -1.658241, 2.039621, 1, 0, 0.1686275, 1,
2.037556, 1.328436, 2.402683, 1, 0, 0.1607843, 1,
2.073225, 1.670154, 0.8966017, 1, 0, 0.1568628, 1,
2.132361, 0.1619206, 1.47111, 1, 0, 0.1490196, 1,
2.17145, 0.1887308, 1.471743, 1, 0, 0.145098, 1,
2.179412, -2.467364, 1.114188, 1, 0, 0.1372549, 1,
2.189939, -0.9613768, 2.808235, 1, 0, 0.1333333, 1,
2.19366, 0.7690582, 1.181773, 1, 0, 0.1254902, 1,
2.237308, 0.4295592, 1.149281, 1, 0, 0.1215686, 1,
2.245296, 0.4297582, 0.7435542, 1, 0, 0.1137255, 1,
2.344171, 0.5553079, -0.8153393, 1, 0, 0.1098039, 1,
2.348119, -0.6226313, 1.54403, 1, 0, 0.1019608, 1,
2.355856, -1.89764, 1.999324, 1, 0, 0.09411765, 1,
2.357839, -0.124589, 0.6344838, 1, 0, 0.09019608, 1,
2.371799, -0.03500087, 1.225905, 1, 0, 0.08235294, 1,
2.411405, 0.1886624, 1.589453, 1, 0, 0.07843138, 1,
2.417909, 1.195252, 1.375659, 1, 0, 0.07058824, 1,
2.471753, -0.981125, 2.936871, 1, 0, 0.06666667, 1,
2.490804, -0.7510827, 2.899544, 1, 0, 0.05882353, 1,
2.495341, 0.8694617, 1.182512, 1, 0, 0.05490196, 1,
2.518887, -0.4886597, 2.879976, 1, 0, 0.04705882, 1,
2.65248, 0.1498176, 2.501299, 1, 0, 0.04313726, 1,
2.695769, 0.1335314, 4.06025, 1, 0, 0.03529412, 1,
2.831781, -1.444872, 1.887446, 1, 0, 0.03137255, 1,
2.93927, 0.02981596, 0.5512189, 1, 0, 0.02352941, 1,
2.961942, -0.5652344, 1.752753, 1, 0, 0.01960784, 1,
2.998641, 0.6194569, 0.7846441, 1, 0, 0.01176471, 1,
3.030091, 2.395203, 0.3754219, 1, 0, 0.007843138, 1
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
0.2729919, -4.155118, -8.141138, 0, -0.5, 0.5, 0.5,
0.2729919, -4.155118, -8.141138, 1, -0.5, 0.5, 0.5,
0.2729919, -4.155118, -8.141138, 1, 1.5, 0.5, 0.5,
0.2729919, -4.155118, -8.141138, 0, 1.5, 0.5, 0.5
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
-3.418763, 0.04750633, -8.141138, 0, -0.5, 0.5, 0.5,
-3.418763, 0.04750633, -8.141138, 1, -0.5, 0.5, 0.5,
-3.418763, 0.04750633, -8.141138, 1, 1.5, 0.5, 0.5,
-3.418763, 0.04750633, -8.141138, 0, 1.5, 0.5, 0.5
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
-3.418763, -4.155118, -0.6669819, 0, -0.5, 0.5, 0.5,
-3.418763, -4.155118, -0.6669819, 1, -0.5, 0.5, 0.5,
-3.418763, -4.155118, -0.6669819, 1, 1.5, 0.5, 0.5,
-3.418763, -4.155118, -0.6669819, 0, 1.5, 0.5, 0.5
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
-2, -3.185282, -6.416333,
3, -3.185282, -6.416333,
-2, -3.185282, -6.416333,
-2, -3.346921, -6.703801,
-1, -3.185282, -6.416333,
-1, -3.346921, -6.703801,
0, -3.185282, -6.416333,
0, -3.346921, -6.703801,
1, -3.185282, -6.416333,
1, -3.346921, -6.703801,
2, -3.185282, -6.416333,
2, -3.346921, -6.703801,
3, -3.185282, -6.416333,
3, -3.346921, -6.703801
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
-2, -3.6702, -7.278736, 0, -0.5, 0.5, 0.5,
-2, -3.6702, -7.278736, 1, -0.5, 0.5, 0.5,
-2, -3.6702, -7.278736, 1, 1.5, 0.5, 0.5,
-2, -3.6702, -7.278736, 0, 1.5, 0.5, 0.5,
-1, -3.6702, -7.278736, 0, -0.5, 0.5, 0.5,
-1, -3.6702, -7.278736, 1, -0.5, 0.5, 0.5,
-1, -3.6702, -7.278736, 1, 1.5, 0.5, 0.5,
-1, -3.6702, -7.278736, 0, 1.5, 0.5, 0.5,
0, -3.6702, -7.278736, 0, -0.5, 0.5, 0.5,
0, -3.6702, -7.278736, 1, -0.5, 0.5, 0.5,
0, -3.6702, -7.278736, 1, 1.5, 0.5, 0.5,
0, -3.6702, -7.278736, 0, 1.5, 0.5, 0.5,
1, -3.6702, -7.278736, 0, -0.5, 0.5, 0.5,
1, -3.6702, -7.278736, 1, -0.5, 0.5, 0.5,
1, -3.6702, -7.278736, 1, 1.5, 0.5, 0.5,
1, -3.6702, -7.278736, 0, 1.5, 0.5, 0.5,
2, -3.6702, -7.278736, 0, -0.5, 0.5, 0.5,
2, -3.6702, -7.278736, 1, -0.5, 0.5, 0.5,
2, -3.6702, -7.278736, 1, 1.5, 0.5, 0.5,
2, -3.6702, -7.278736, 0, 1.5, 0.5, 0.5,
3, -3.6702, -7.278736, 0, -0.5, 0.5, 0.5,
3, -3.6702, -7.278736, 1, -0.5, 0.5, 0.5,
3, -3.6702, -7.278736, 1, 1.5, 0.5, 0.5,
3, -3.6702, -7.278736, 0, 1.5, 0.5, 0.5
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
-2.56682, -3, -6.416333,
-2.56682, 3, -6.416333,
-2.56682, -3, -6.416333,
-2.70881, -3, -6.703801,
-2.56682, -2, -6.416333,
-2.70881, -2, -6.703801,
-2.56682, -1, -6.416333,
-2.70881, -1, -6.703801,
-2.56682, 0, -6.416333,
-2.70881, 0, -6.703801,
-2.56682, 1, -6.416333,
-2.70881, 1, -6.703801,
-2.56682, 2, -6.416333,
-2.70881, 2, -6.703801,
-2.56682, 3, -6.416333,
-2.70881, 3, -6.703801
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
-2.992791, -3, -7.278736, 0, -0.5, 0.5, 0.5,
-2.992791, -3, -7.278736, 1, -0.5, 0.5, 0.5,
-2.992791, -3, -7.278736, 1, 1.5, 0.5, 0.5,
-2.992791, -3, -7.278736, 0, 1.5, 0.5, 0.5,
-2.992791, -2, -7.278736, 0, -0.5, 0.5, 0.5,
-2.992791, -2, -7.278736, 1, -0.5, 0.5, 0.5,
-2.992791, -2, -7.278736, 1, 1.5, 0.5, 0.5,
-2.992791, -2, -7.278736, 0, 1.5, 0.5, 0.5,
-2.992791, -1, -7.278736, 0, -0.5, 0.5, 0.5,
-2.992791, -1, -7.278736, 1, -0.5, 0.5, 0.5,
-2.992791, -1, -7.278736, 1, 1.5, 0.5, 0.5,
-2.992791, -1, -7.278736, 0, 1.5, 0.5, 0.5,
-2.992791, 0, -7.278736, 0, -0.5, 0.5, 0.5,
-2.992791, 0, -7.278736, 1, -0.5, 0.5, 0.5,
-2.992791, 0, -7.278736, 1, 1.5, 0.5, 0.5,
-2.992791, 0, -7.278736, 0, 1.5, 0.5, 0.5,
-2.992791, 1, -7.278736, 0, -0.5, 0.5, 0.5,
-2.992791, 1, -7.278736, 1, -0.5, 0.5, 0.5,
-2.992791, 1, -7.278736, 1, 1.5, 0.5, 0.5,
-2.992791, 1, -7.278736, 0, 1.5, 0.5, 0.5,
-2.992791, 2, -7.278736, 0, -0.5, 0.5, 0.5,
-2.992791, 2, -7.278736, 1, -0.5, 0.5, 0.5,
-2.992791, 2, -7.278736, 1, 1.5, 0.5, 0.5,
-2.992791, 2, -7.278736, 0, 1.5, 0.5, 0.5,
-2.992791, 3, -7.278736, 0, -0.5, 0.5, 0.5,
-2.992791, 3, -7.278736, 1, -0.5, 0.5, 0.5,
-2.992791, 3, -7.278736, 1, 1.5, 0.5, 0.5,
-2.992791, 3, -7.278736, 0, 1.5, 0.5, 0.5
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
-2.56682, -3.185282, -6,
-2.56682, -3.185282, 4,
-2.56682, -3.185282, -6,
-2.70881, -3.346921, -6,
-2.56682, -3.185282, -4,
-2.70881, -3.346921, -4,
-2.56682, -3.185282, -2,
-2.70881, -3.346921, -2,
-2.56682, -3.185282, 0,
-2.70881, -3.346921, 0,
-2.56682, -3.185282, 2,
-2.70881, -3.346921, 2,
-2.56682, -3.185282, 4,
-2.70881, -3.346921, 4
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
-2.992791, -3.6702, -6, 0, -0.5, 0.5, 0.5,
-2.992791, -3.6702, -6, 1, -0.5, 0.5, 0.5,
-2.992791, -3.6702, -6, 1, 1.5, 0.5, 0.5,
-2.992791, -3.6702, -6, 0, 1.5, 0.5, 0.5,
-2.992791, -3.6702, -4, 0, -0.5, 0.5, 0.5,
-2.992791, -3.6702, -4, 1, -0.5, 0.5, 0.5,
-2.992791, -3.6702, -4, 1, 1.5, 0.5, 0.5,
-2.992791, -3.6702, -4, 0, 1.5, 0.5, 0.5,
-2.992791, -3.6702, -2, 0, -0.5, 0.5, 0.5,
-2.992791, -3.6702, -2, 1, -0.5, 0.5, 0.5,
-2.992791, -3.6702, -2, 1, 1.5, 0.5, 0.5,
-2.992791, -3.6702, -2, 0, 1.5, 0.5, 0.5,
-2.992791, -3.6702, 0, 0, -0.5, 0.5, 0.5,
-2.992791, -3.6702, 0, 1, -0.5, 0.5, 0.5,
-2.992791, -3.6702, 0, 1, 1.5, 0.5, 0.5,
-2.992791, -3.6702, 0, 0, 1.5, 0.5, 0.5,
-2.992791, -3.6702, 2, 0, -0.5, 0.5, 0.5,
-2.992791, -3.6702, 2, 1, -0.5, 0.5, 0.5,
-2.992791, -3.6702, 2, 1, 1.5, 0.5, 0.5,
-2.992791, -3.6702, 2, 0, 1.5, 0.5, 0.5,
-2.992791, -3.6702, 4, 0, -0.5, 0.5, 0.5,
-2.992791, -3.6702, 4, 1, -0.5, 0.5, 0.5,
-2.992791, -3.6702, 4, 1, 1.5, 0.5, 0.5,
-2.992791, -3.6702, 4, 0, 1.5, 0.5, 0.5
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
-2.56682, -3.185282, -6.416333,
-2.56682, 3.280294, -6.416333,
-2.56682, -3.185282, 5.082369,
-2.56682, 3.280294, 5.082369,
-2.56682, -3.185282, -6.416333,
-2.56682, -3.185282, 5.082369,
-2.56682, 3.280294, -6.416333,
-2.56682, 3.280294, 5.082369,
-2.56682, -3.185282, -6.416333,
3.112803, -3.185282, -6.416333,
-2.56682, -3.185282, 5.082369,
3.112803, -3.185282, 5.082369,
-2.56682, 3.280294, -6.416333,
3.112803, 3.280294, -6.416333,
-2.56682, 3.280294, 5.082369,
3.112803, 3.280294, 5.082369,
3.112803, -3.185282, -6.416333,
3.112803, 3.280294, -6.416333,
3.112803, -3.185282, 5.082369,
3.112803, 3.280294, 5.082369,
3.112803, -3.185282, -6.416333,
3.112803, -3.185282, 5.082369,
3.112803, 3.280294, -6.416333,
3.112803, 3.280294, 5.082369
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
var radius = 7.669306;
var distance = 34.12161;
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
mvMatrix.translate( -0.2729919, -0.04750633, 0.6669819 );
mvMatrix.scale( 1.459992, 1.282516, 0.7211426 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.12161);
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
Profenofos<-read.table("Profenofos.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Profenofos$V2
```

```
## Error in eval(expr, envir, enclos): object 'Profenofos' not found
```

```r
y<-Profenofos$V3
```

```
## Error in eval(expr, envir, enclos): object 'Profenofos' not found
```

```r
z<-Profenofos$V4
```

```
## Error in eval(expr, envir, enclos): object 'Profenofos' not found
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
-2.484107, -0.5324455, -1.944728, 0, 0, 1, 1, 1,
-2.366364, -0.08464443, -2.189137, 1, 0, 0, 1, 1,
-2.353448, -0.9952594, -2.639526, 1, 0, 0, 1, 1,
-2.236321, 0.787793, -0.2201573, 1, 0, 0, 1, 1,
-2.229302, -0.01439851, -2.095178, 1, 0, 0, 1, 1,
-2.227422, 1.379285, -2.52987, 1, 0, 0, 1, 1,
-2.147691, 0.6467758, -1.289062, 0, 0, 0, 1, 1,
-2.141725, -0.1058744, -2.065632, 0, 0, 0, 1, 1,
-2.138417, -1.375228, -0.8454622, 0, 0, 0, 1, 1,
-2.129806, -0.3415662, -2.40068, 0, 0, 0, 1, 1,
-2.091988, -0.2336915, -0.7969609, 0, 0, 0, 1, 1,
-2.081917, 1.205451, -0.7532626, 0, 0, 0, 1, 1,
-2.079345, 0.2876234, -0.555782, 0, 0, 0, 1, 1,
-2.065831, 2.62332, 0.07727781, 1, 1, 1, 1, 1,
-2.005829, -2.059858, -1.738573, 1, 1, 1, 1, 1,
-1.961863, 0.08921272, -1.283761, 1, 1, 1, 1, 1,
-1.958282, -1.828085, -3.623906, 1, 1, 1, 1, 1,
-1.955349, 0.7645423, -2.742268, 1, 1, 1, 1, 1,
-1.946012, 0.7856041, -0.3719393, 1, 1, 1, 1, 1,
-1.929481, -0.09178896, -0.2851346, 1, 1, 1, 1, 1,
-1.918308, 1.062582, 0.5695366, 1, 1, 1, 1, 1,
-1.90664, 0.3414607, -2.101872, 1, 1, 1, 1, 1,
-1.89233, 2.170327, 0.1677645, 1, 1, 1, 1, 1,
-1.869089, -0.6819922, -1.437037, 1, 1, 1, 1, 1,
-1.859905, -0.5351741, -0.5144712, 1, 1, 1, 1, 1,
-1.8439, 1.725467, 1.434801, 1, 1, 1, 1, 1,
-1.83966, -0.4083257, -1.94393, 1, 1, 1, 1, 1,
-1.826865, 2.47475, -2.138612, 1, 1, 1, 1, 1,
-1.825659, -0.2769909, -2.224812, 0, 0, 1, 1, 1,
-1.824302, 0.4067383, -1.950475, 1, 0, 0, 1, 1,
-1.79428, 0.8387585, -0.8998042, 1, 0, 0, 1, 1,
-1.789036, 0.7423947, 0.6397861, 1, 0, 0, 1, 1,
-1.781684, -0.08323443, -1.888671, 1, 0, 0, 1, 1,
-1.775902, 0.6553285, -1.964917, 1, 0, 0, 1, 1,
-1.772227, 0.1957379, -0.23296, 0, 0, 0, 1, 1,
-1.766377, -3.091123, -2.324399, 0, 0, 0, 1, 1,
-1.756235, -0.09777793, -0.959161, 0, 0, 0, 1, 1,
-1.736786, 0.4463009, -2.096118, 0, 0, 0, 1, 1,
-1.729446, -1.493184, -3.942101, 0, 0, 0, 1, 1,
-1.723932, -0.1715993, -2.173737, 0, 0, 0, 1, 1,
-1.692293, -1.584171, -3.140791, 0, 0, 0, 1, 1,
-1.656381, 0.05441703, -0.413213, 1, 1, 1, 1, 1,
-1.647092, -0.6747237, -1.744408, 1, 1, 1, 1, 1,
-1.635705, 0.9053459, -0.8385477, 1, 1, 1, 1, 1,
-1.623224, -0.5505251, -1.975623, 1, 1, 1, 1, 1,
-1.603567, 0.9325854, -0.5786597, 1, 1, 1, 1, 1,
-1.582272, 2.475306, -2.643964, 1, 1, 1, 1, 1,
-1.562991, -0.1201933, 0.3695264, 1, 1, 1, 1, 1,
-1.559884, -0.2087441, -2.708958, 1, 1, 1, 1, 1,
-1.549337, -0.733274, -0.8225366, 1, 1, 1, 1, 1,
-1.546774, 0.3189615, 0.5552493, 1, 1, 1, 1, 1,
-1.541274, 0.1932174, -1.458887, 1, 1, 1, 1, 1,
-1.537364, -0.3077703, -0.8604248, 1, 1, 1, 1, 1,
-1.53686, 1.093874, -3.058781, 1, 1, 1, 1, 1,
-1.53209, -1.288001, -3.566843, 1, 1, 1, 1, 1,
-1.514988, 1.873019, 0.03795996, 1, 1, 1, 1, 1,
-1.493319, 0.9914892, 0.6365727, 0, 0, 1, 1, 1,
-1.481394, 2.125343, 0.4258473, 1, 0, 0, 1, 1,
-1.461359, 0.6132138, -0.3439173, 1, 0, 0, 1, 1,
-1.450808, 0.3465341, -2.052951, 1, 0, 0, 1, 1,
-1.449739, -0.875673, -0.2516693, 1, 0, 0, 1, 1,
-1.440708, -2.940746, -1.362525, 1, 0, 0, 1, 1,
-1.428628, 0.08373944, -2.400206, 0, 0, 0, 1, 1,
-1.426737, 1.869916, -1.262988, 0, 0, 0, 1, 1,
-1.426217, -0.03289334, -0.8567941, 0, 0, 0, 1, 1,
-1.421103, 1.735552, 0.6619272, 0, 0, 0, 1, 1,
-1.419592, 1.558725, 0.03669487, 0, 0, 0, 1, 1,
-1.413444, 1.185291, -0.4342867, 0, 0, 0, 1, 1,
-1.406902, -0.1179822, -3.259254, 0, 0, 0, 1, 1,
-1.405661, -0.7800793, -2.254, 1, 1, 1, 1, 1,
-1.401446, 0.2945529, 0.4575087, 1, 1, 1, 1, 1,
-1.388975, -0.8570215, -1.90462, 1, 1, 1, 1, 1,
-1.377066, 0.3801741, -1.859011, 1, 1, 1, 1, 1,
-1.369827, 0.01386249, -0.9714713, 1, 1, 1, 1, 1,
-1.364631, -1.197144, -1.626151, 1, 1, 1, 1, 1,
-1.361577, 1.869974, -1.270072, 1, 1, 1, 1, 1,
-1.358148, -0.1167155, -1.127012, 1, 1, 1, 1, 1,
-1.353714, -1.058408, -2.709472, 1, 1, 1, 1, 1,
-1.337055, 1.004013, -1.327111, 1, 1, 1, 1, 1,
-1.325874, 1.672728, -0.1219842, 1, 1, 1, 1, 1,
-1.320137, -0.7664078, -2.303508, 1, 1, 1, 1, 1,
-1.316885, 1.731992, 0.185981, 1, 1, 1, 1, 1,
-1.314603, 0.3762069, 0.2149686, 1, 1, 1, 1, 1,
-1.311837, -2.052529, -3.092168, 1, 1, 1, 1, 1,
-1.307709, -0.1702044, -2.627267, 0, 0, 1, 1, 1,
-1.300709, 0.5813614, -1.478573, 1, 0, 0, 1, 1,
-1.30056, 0.5370317, -2.111554, 1, 0, 0, 1, 1,
-1.288388, -0.1298838, -2.796741, 1, 0, 0, 1, 1,
-1.284864, 0.7910064, -1.521271, 1, 0, 0, 1, 1,
-1.280321, 1.231504, 0.1272745, 1, 0, 0, 1, 1,
-1.271176, -1.534828, -1.708368, 0, 0, 0, 1, 1,
-1.262755, 2.406649, 0.9800941, 0, 0, 0, 1, 1,
-1.25955, 0.4243287, -1.087112, 0, 0, 0, 1, 1,
-1.252717, 0.1245673, -0.3959272, 0, 0, 0, 1, 1,
-1.250469, -0.4608825, -3.475328, 0, 0, 0, 1, 1,
-1.233645, 0.5794286, -1.28992, 0, 0, 0, 1, 1,
-1.231194, -0.05192674, -2.308487, 0, 0, 0, 1, 1,
-1.230442, -1.855369, -2.702023, 1, 1, 1, 1, 1,
-1.227677, 1.125879, -3.979649, 1, 1, 1, 1, 1,
-1.227162, -0.5534092, -1.675571, 1, 1, 1, 1, 1,
-1.219942, 0.5066102, -1.008654, 1, 1, 1, 1, 1,
-1.215826, 0.4434446, -0.5144349, 1, 1, 1, 1, 1,
-1.208353, -1.310911, -1.523848, 1, 1, 1, 1, 1,
-1.207698, -1.105786, -2.83349, 1, 1, 1, 1, 1,
-1.181186, 0.4156547, -0.07669821, 1, 1, 1, 1, 1,
-1.179266, -0.5664043, -3.508346, 1, 1, 1, 1, 1,
-1.172417, -0.4311699, -1.545501, 1, 1, 1, 1, 1,
-1.168121, 1.202572, -1.615847, 1, 1, 1, 1, 1,
-1.1664, -0.3423796, -1.292635, 1, 1, 1, 1, 1,
-1.165591, -1.264904, -2.226498, 1, 1, 1, 1, 1,
-1.153936, 0.4641165, -0.8709033, 1, 1, 1, 1, 1,
-1.150258, -0.4524156, -1.680006, 1, 1, 1, 1, 1,
-1.149836, 0.888599, 0.5724, 0, 0, 1, 1, 1,
-1.141523, -0.6427091, -2.296009, 1, 0, 0, 1, 1,
-1.140861, 1.406093, -0.6848691, 1, 0, 0, 1, 1,
-1.13854, -0.5014714, -2.44748, 1, 0, 0, 1, 1,
-1.12294, 0.1311539, -1.209322, 1, 0, 0, 1, 1,
-1.122809, 2.204801, -1.125161, 1, 0, 0, 1, 1,
-1.121001, 0.5816314, -2.222101, 0, 0, 0, 1, 1,
-1.120156, 1.116824, -1.596264, 0, 0, 0, 1, 1,
-1.104643, 0.5632088, -0.4590078, 0, 0, 0, 1, 1,
-1.10456, -0.3631924, -0.7041193, 0, 0, 0, 1, 1,
-1.09372, 0.3809135, -2.84876, 0, 0, 0, 1, 1,
-1.092832, -0.9081629, -2.555713, 0, 0, 0, 1, 1,
-1.08846, -0.3778682, -0.7934687, 0, 0, 0, 1, 1,
-1.085371, 1.30787, -0.05314438, 1, 1, 1, 1, 1,
-1.079618, 0.8464101, 1.015924, 1, 1, 1, 1, 1,
-1.073459, 0.829053, 0.7215362, 1, 1, 1, 1, 1,
-1.070772, 0.232637, -0.6031451, 1, 1, 1, 1, 1,
-1.066447, 0.9834369, -2.9709, 1, 1, 1, 1, 1,
-1.062539, -0.7096592, -2.481262, 1, 1, 1, 1, 1,
-1.061419, 1.774327, -1.335618, 1, 1, 1, 1, 1,
-1.059489, 0.7152184, -0.07104207, 1, 1, 1, 1, 1,
-1.058926, -1.439742, -0.45386, 1, 1, 1, 1, 1,
-1.056969, 1.891109, -0.8574584, 1, 1, 1, 1, 1,
-1.047624, 0.1492546, -3.075493, 1, 1, 1, 1, 1,
-1.042226, 1.040175, 0.8665401, 1, 1, 1, 1, 1,
-1.039685, 0.5594637, -1.311127, 1, 1, 1, 1, 1,
-1.038972, 2.073004, 0.8964043, 1, 1, 1, 1, 1,
-1.037131, 1.403152, -0.8894302, 1, 1, 1, 1, 1,
-1.032485, 1.149219, -0.8465887, 0, 0, 1, 1, 1,
-1.027426, 0.8928139, -3.817551, 1, 0, 0, 1, 1,
-1.026965, 0.2564462, -0.5996846, 1, 0, 0, 1, 1,
-1.024142, -0.1286026, -3.965741, 1, 0, 0, 1, 1,
-1.02145, -0.9457076, -1.501427, 1, 0, 0, 1, 1,
-1.016338, 0.8509214, -1.397289, 1, 0, 0, 1, 1,
-1.013232, 0.1917706, 0.1243124, 0, 0, 0, 1, 1,
-1.008666, -0.4001128, -2.681562, 0, 0, 0, 1, 1,
-1.006208, -1.421121, -1.562706, 0, 0, 0, 1, 1,
-0.9961936, -0.2330477, -2.191697, 0, 0, 0, 1, 1,
-0.9923918, 0.6246354, -0.5297062, 0, 0, 0, 1, 1,
-0.989702, -1.978717, -2.869229, 0, 0, 0, 1, 1,
-0.9617799, -0.2760581, -1.424, 0, 0, 0, 1, 1,
-0.9590421, -0.8998075, -2.545296, 1, 1, 1, 1, 1,
-0.956647, 0.5313993, -1.049888, 1, 1, 1, 1, 1,
-0.9487525, -0.9774082, -3.510742, 1, 1, 1, 1, 1,
-0.9484115, -1.062411, -2.962358, 1, 1, 1, 1, 1,
-0.9471484, -0.1666098, -1.909027, 1, 1, 1, 1, 1,
-0.9451056, 0.09420923, -1.618123, 1, 1, 1, 1, 1,
-0.9396742, -1.471479, -1.77903, 1, 1, 1, 1, 1,
-0.929446, 0.09883001, 0.6606604, 1, 1, 1, 1, 1,
-0.9280453, 1.798218, -0.4947894, 1, 1, 1, 1, 1,
-0.9275835, -1.433748, -1.379439, 1, 1, 1, 1, 1,
-0.9274984, 0.05150425, -1.642149, 1, 1, 1, 1, 1,
-0.9262035, -0.4339353, -3.122932, 1, 1, 1, 1, 1,
-0.9129535, -0.545485, -2.142941, 1, 1, 1, 1, 1,
-0.9127551, -1.360403, -2.8679, 1, 1, 1, 1, 1,
-0.9094906, -0.3132467, -2.068673, 1, 1, 1, 1, 1,
-0.9009994, -1.639918, -4.815556, 0, 0, 1, 1, 1,
-0.8873792, -0.4583577, -1.139105, 1, 0, 0, 1, 1,
-0.8833255, -0.9877904, -2.471647, 1, 0, 0, 1, 1,
-0.8826064, 0.7523828, -2.284099, 1, 0, 0, 1, 1,
-0.8762106, 0.8023777, -1.730589, 1, 0, 0, 1, 1,
-0.869168, -1.586428, -3.13331, 1, 0, 0, 1, 1,
-0.8681594, 0.5203535, -3.060491, 0, 0, 0, 1, 1,
-0.8664948, 1.854978, 0.451322, 0, 0, 0, 1, 1,
-0.863068, 0.3314803, -2.833695, 0, 0, 0, 1, 1,
-0.8608374, 0.7643057, -1.3015, 0, 0, 0, 1, 1,
-0.8558686, 1.104545, -0.626829, 0, 0, 0, 1, 1,
-0.8557098, -0.5136436, -3.711678, 0, 0, 0, 1, 1,
-0.8552517, 1.631653, -0.7832016, 0, 0, 0, 1, 1,
-0.8531121, -0.9676483, -2.327305, 1, 1, 1, 1, 1,
-0.8467558, 0.3985167, -0.4833683, 1, 1, 1, 1, 1,
-0.8344026, 0.1199415, -1.037064, 1, 1, 1, 1, 1,
-0.8332968, 0.06437902, -1.733534, 1, 1, 1, 1, 1,
-0.8320894, 1.16937, -0.9677848, 1, 1, 1, 1, 1,
-0.829694, 0.1049353, -1.498531, 1, 1, 1, 1, 1,
-0.8215225, 1.204418, -0.6495318, 1, 1, 1, 1, 1,
-0.818177, -1.718617, -2.685695, 1, 1, 1, 1, 1,
-0.8142892, 0.1138463, -0.9842419, 1, 1, 1, 1, 1,
-0.8138276, 0.6248586, -1.783736, 1, 1, 1, 1, 1,
-0.8007696, -1.621405, -4.2116, 1, 1, 1, 1, 1,
-0.7917885, 2.223233, -0.1231668, 1, 1, 1, 1, 1,
-0.7902877, -1.365958, -3.183582, 1, 1, 1, 1, 1,
-0.783996, 2.247878, -0.2994212, 1, 1, 1, 1, 1,
-0.782342, -1.327091, -1.828893, 1, 1, 1, 1, 1,
-0.7808581, -0.7730722, -3.57439, 0, 0, 1, 1, 1,
-0.7804167, -0.7341468, -2.187203, 1, 0, 0, 1, 1,
-0.7756181, -0.6684479, -2.522598, 1, 0, 0, 1, 1,
-0.7740799, 0.1251076, -0.6252692, 1, 0, 0, 1, 1,
-0.7694393, -0.1035987, -1.268577, 1, 0, 0, 1, 1,
-0.7633708, -0.03904279, -1.78022, 1, 0, 0, 1, 1,
-0.762472, -0.3901904, -2.851406, 0, 0, 0, 1, 1,
-0.7611797, -0.6493509, -1.826515, 0, 0, 0, 1, 1,
-0.754887, -1.027663, -1.228974, 0, 0, 0, 1, 1,
-0.7542451, -2.57394, -3.699368, 0, 0, 0, 1, 1,
-0.75177, -1.203435, -2.491976, 0, 0, 0, 1, 1,
-0.7476086, -1.542833, -3.279184, 0, 0, 0, 1, 1,
-0.7474974, -0.4340845, -3.204608, 0, 0, 0, 1, 1,
-0.7463601, -0.02041833, -2.730594, 1, 1, 1, 1, 1,
-0.7454945, 1.323202, -0.736136, 1, 1, 1, 1, 1,
-0.7425141, 1.002027, 0.7600504, 1, 1, 1, 1, 1,
-0.7399378, -1.340514, -4.648461, 1, 1, 1, 1, 1,
-0.7381265, -1.09373, -2.451142, 1, 1, 1, 1, 1,
-0.731883, -0.6615011, -2.728406, 1, 1, 1, 1, 1,
-0.7318207, -0.5546955, -4.772187, 1, 1, 1, 1, 1,
-0.7298003, -1.52467, -4.256601, 1, 1, 1, 1, 1,
-0.7267907, -0.6918882, -1.071823, 1, 1, 1, 1, 1,
-0.7236025, 0.7633526, -0.9627936, 1, 1, 1, 1, 1,
-0.7222211, -0.5896351, -0.6974559, 1, 1, 1, 1, 1,
-0.7205284, -0.2497771, -3.055694, 1, 1, 1, 1, 1,
-0.7179108, 0.1571997, -0.809723, 1, 1, 1, 1, 1,
-0.7175831, -1.385808, -4.28335, 1, 1, 1, 1, 1,
-0.7166734, 0.5107741, -0.8648854, 1, 1, 1, 1, 1,
-0.7164583, -0.2460794, -1.600078, 0, 0, 1, 1, 1,
-0.7128084, -1.31203, -2.000122, 1, 0, 0, 1, 1,
-0.7084581, -1.102436, -2.41531, 1, 0, 0, 1, 1,
-0.7068395, -0.8303994, -2.853365, 1, 0, 0, 1, 1,
-0.7023729, -0.5198364, -3.092145, 1, 0, 0, 1, 1,
-0.6982158, -0.04508052, -3.038923, 1, 0, 0, 1, 1,
-0.6938172, -0.7794083, -2.072848, 0, 0, 0, 1, 1,
-0.6928194, -0.3261469, -4.33219, 0, 0, 0, 1, 1,
-0.6926997, 0.2448703, -2.008524, 0, 0, 0, 1, 1,
-0.690814, -1.167953, -3.236353, 0, 0, 0, 1, 1,
-0.6904287, -1.036074, -3.494187, 0, 0, 0, 1, 1,
-0.6873962, -0.0504724, -1.970773, 0, 0, 0, 1, 1,
-0.6787065, 0.2639299, -0.4886033, 0, 0, 0, 1, 1,
-0.6786539, 0.5131063, -0.05987361, 1, 1, 1, 1, 1,
-0.6716346, -0.1791711, -0.6201533, 1, 1, 1, 1, 1,
-0.6651784, 0.8916904, -2.536767, 1, 1, 1, 1, 1,
-0.6644158, -0.1377369, -2.68464, 1, 1, 1, 1, 1,
-0.6630407, 0.1141601, -2.308675, 1, 1, 1, 1, 1,
-0.662047, -1.15553, -2.6224, 1, 1, 1, 1, 1,
-0.6612316, -0.1839285, -4.142753, 1, 1, 1, 1, 1,
-0.6607177, 1.356711, -0.07325611, 1, 1, 1, 1, 1,
-0.6598532, 0.1715542, -2.598554, 1, 1, 1, 1, 1,
-0.6545073, -1.852023, -3.885179, 1, 1, 1, 1, 1,
-0.6528503, -1.063533, -3.256941, 1, 1, 1, 1, 1,
-0.6480266, 0.1348598, -2.100757, 1, 1, 1, 1, 1,
-0.6347336, 1.094384, -0.2219137, 1, 1, 1, 1, 1,
-0.6332678, 1.713691, -0.706202, 1, 1, 1, 1, 1,
-0.633176, 0.1389942, -0.6623708, 1, 1, 1, 1, 1,
-0.632862, 3.186136, -0.8749663, 0, 0, 1, 1, 1,
-0.6316683, -1.654033, -2.720088, 1, 0, 0, 1, 1,
-0.6316394, -0.5514206, -1.948547, 1, 0, 0, 1, 1,
-0.6298791, -0.3227826, -1.077148, 1, 0, 0, 1, 1,
-0.6248564, 1.15931, 0.2247711, 1, 0, 0, 1, 1,
-0.623257, -0.9634475, -2.82621, 1, 0, 0, 1, 1,
-0.6169991, -0.1092051, -1.242926, 0, 0, 0, 1, 1,
-0.6113019, 0.7110143, -1.739023, 0, 0, 0, 1, 1,
-0.6089342, -0.4195562, -3.834434, 0, 0, 0, 1, 1,
-0.6087275, -0.3238634, -2.779721, 0, 0, 0, 1, 1,
-0.6070985, -0.356405, -1.745547, 0, 0, 0, 1, 1,
-0.5938621, 0.09875331, -2.564604, 0, 0, 0, 1, 1,
-0.5935996, 0.4876639, 1.33417, 0, 0, 0, 1, 1,
-0.5823817, 1.343419, 0.03282899, 1, 1, 1, 1, 1,
-0.5820551, 1.206605, 0.2257145, 1, 1, 1, 1, 1,
-0.5781496, 1.587187, -0.3396656, 1, 1, 1, 1, 1,
-0.5760683, -0.2894572, -1.060542, 1, 1, 1, 1, 1,
-0.575952, -0.5752552, -2.612152, 1, 1, 1, 1, 1,
-0.5743654, 0.8184351, -0.3784, 1, 1, 1, 1, 1,
-0.5732161, -0.5166809, -4.860001, 1, 1, 1, 1, 1,
-0.5691125, -1.523705, -3.567875, 1, 1, 1, 1, 1,
-0.5621743, 0.2062822, -0.3618566, 1, 1, 1, 1, 1,
-0.5565559, 1.803893, 1.045498, 1, 1, 1, 1, 1,
-0.5522854, 1.032207, -0.1646699, 1, 1, 1, 1, 1,
-0.5450616, -0.8419883, -3.341796, 1, 1, 1, 1, 1,
-0.5434467, 0.6163372, -0.008181863, 1, 1, 1, 1, 1,
-0.5420154, 0.1730825, -0.2825601, 1, 1, 1, 1, 1,
-0.5395195, 0.5608839, 0.06282777, 1, 1, 1, 1, 1,
-0.5357587, -0.1235529, -1.210825, 0, 0, 1, 1, 1,
-0.5275565, -0.9042711, -2.861429, 1, 0, 0, 1, 1,
-0.5257121, -1.271286, -0.6982204, 1, 0, 0, 1, 1,
-0.5165492, 0.5058265, -0.3049192, 1, 0, 0, 1, 1,
-0.516001, 0.5727111, -1.107714, 1, 0, 0, 1, 1,
-0.5157537, -0.22601, -2.482215, 1, 0, 0, 1, 1,
-0.5117588, -0.0005884258, -2.236377, 0, 0, 0, 1, 1,
-0.5077583, 1.199778, 1.24813, 0, 0, 0, 1, 1,
-0.5072321, 1.156793, -0.5613849, 0, 0, 0, 1, 1,
-0.4988618, 1.412331, 0.2966097, 0, 0, 0, 1, 1,
-0.4957682, 0.3130112, 0.4665691, 0, 0, 0, 1, 1,
-0.4942856, 0.6290528, -1.76498, 0, 0, 0, 1, 1,
-0.492494, 1.09147, -0.4554746, 0, 0, 0, 1, 1,
-0.4911871, -0.7553086, -2.509654, 1, 1, 1, 1, 1,
-0.4907552, -0.7102445, -2.101697, 1, 1, 1, 1, 1,
-0.4898334, -0.7477408, -2.088587, 1, 1, 1, 1, 1,
-0.4898216, 0.4612159, 0.1462787, 1, 1, 1, 1, 1,
-0.4860126, 0.4313535, -0.6591302, 1, 1, 1, 1, 1,
-0.4820156, 1.325625, 1.027563, 1, 1, 1, 1, 1,
-0.4817531, 0.4475826, -0.1324572, 1, 1, 1, 1, 1,
-0.479797, 0.6388707, -1.173133, 1, 1, 1, 1, 1,
-0.4757017, 0.1345696, -3.380753, 1, 1, 1, 1, 1,
-0.4685982, -0.7209932, -3.495849, 1, 1, 1, 1, 1,
-0.4670836, 1.210222, -0.1249544, 1, 1, 1, 1, 1,
-0.4614455, -0.5590771, -1.409822, 1, 1, 1, 1, 1,
-0.4606807, -0.1654848, -1.391078, 1, 1, 1, 1, 1,
-0.4545045, -0.9536772, -1.445529, 1, 1, 1, 1, 1,
-0.4529378, -1.008946, -3.24434, 1, 1, 1, 1, 1,
-0.4505286, 1.107034, -1.661004, 0, 0, 1, 1, 1,
-0.4487607, -0.7924564, -2.787295, 1, 0, 0, 1, 1,
-0.4440596, -2.172857, -4.288561, 1, 0, 0, 1, 1,
-0.4396037, -1.09437, -1.443485, 1, 0, 0, 1, 1,
-0.4386426, 0.879189, -0.5136459, 1, 0, 0, 1, 1,
-0.4361551, -0.8061267, -2.358847, 1, 0, 0, 1, 1,
-0.433721, 0.02466846, -1.230273, 0, 0, 0, 1, 1,
-0.4328486, -1.450989, -2.394203, 0, 0, 0, 1, 1,
-0.428447, 1.165629, -0.3860255, 0, 0, 0, 1, 1,
-0.4262432, -0.6698024, -3.334326, 0, 0, 0, 1, 1,
-0.4244037, -0.7300761, -2.25781, 0, 0, 0, 1, 1,
-0.42394, 0.5827478, 1.601751, 0, 0, 0, 1, 1,
-0.4236693, -1.515967, -1.625294, 0, 0, 0, 1, 1,
-0.4220383, -0.563404, -2.951555, 1, 1, 1, 1, 1,
-0.4210103, 0.03972984, -3.286909, 1, 1, 1, 1, 1,
-0.4177602, 0.2344554, -2.118739, 1, 1, 1, 1, 1,
-0.4176967, -0.4941279, -1.665551, 1, 1, 1, 1, 1,
-0.4166098, -0.8896431, -2.013424, 1, 1, 1, 1, 1,
-0.4155799, -0.09085521, -2.28124, 1, 1, 1, 1, 1,
-0.4155482, -0.0004341101, -1.726068, 1, 1, 1, 1, 1,
-0.4133384, -1.228337, -1.866361, 1, 1, 1, 1, 1,
-0.4043415, 0.419776, -0.9856489, 1, 1, 1, 1, 1,
-0.3807432, -0.3187691, -2.988439, 1, 1, 1, 1, 1,
-0.3805248, 1.113389, 0.02425566, 1, 1, 1, 1, 1,
-0.3773412, 0.2987128, -2.182303, 1, 1, 1, 1, 1,
-0.3772393, -0.2723633, -2.184908, 1, 1, 1, 1, 1,
-0.3763643, 1.204248, 1.514442, 1, 1, 1, 1, 1,
-0.3694521, -0.2866648, -1.339718, 1, 1, 1, 1, 1,
-0.3680428, 0.242974, -1.389783, 0, 0, 1, 1, 1,
-0.3656449, 0.7306955, -0.498284, 1, 0, 0, 1, 1,
-0.3572232, -1.118181, -5.123385, 1, 0, 0, 1, 1,
-0.3568324, 0.8417202, -0.6459932, 1, 0, 0, 1, 1,
-0.3533442, 0.4849282, -2.293411, 1, 0, 0, 1, 1,
-0.3521862, -0.7497087, -3.474171, 1, 0, 0, 1, 1,
-0.3517888, 1.519471, 0.6936204, 0, 0, 0, 1, 1,
-0.3454838, 1.546737, 0.01069384, 0, 0, 0, 1, 1,
-0.3451234, -1.994143, -2.919097, 0, 0, 0, 1, 1,
-0.3441656, -0.595571, -4.333625, 0, 0, 0, 1, 1,
-0.3415015, 0.1633856, -2.421792, 0, 0, 0, 1, 1,
-0.3360983, 0.4464352, 0.3255305, 0, 0, 0, 1, 1,
-0.3278229, 1.658825, -0.5975811, 0, 0, 0, 1, 1,
-0.3243302, 1.160851, 1.172208, 1, 1, 1, 1, 1,
-0.3171426, 0.1691163, -1.428518, 1, 1, 1, 1, 1,
-0.3109622, -1.787673, -3.469664, 1, 1, 1, 1, 1,
-0.3042663, -0.1302772, -1.785906, 1, 1, 1, 1, 1,
-0.3018224, 0.422731, -0.1030266, 1, 1, 1, 1, 1,
-0.3017489, -0.6719956, -2.258609, 1, 1, 1, 1, 1,
-0.2984926, 1.62487, -0.190605, 1, 1, 1, 1, 1,
-0.2975661, -0.272205, -3.22968, 1, 1, 1, 1, 1,
-0.2946394, 0.133244, -2.653075, 1, 1, 1, 1, 1,
-0.289912, -0.1567807, -2.107155, 1, 1, 1, 1, 1,
-0.2880594, 0.7685035, 0.5828994, 1, 1, 1, 1, 1,
-0.2785883, 0.2334927, -2.082871, 1, 1, 1, 1, 1,
-0.2715008, 0.8037905, -2.092996, 1, 1, 1, 1, 1,
-0.2708724, 0.5606283, -0.3826493, 1, 1, 1, 1, 1,
-0.2680987, -1.206723, -3.613606, 1, 1, 1, 1, 1,
-0.2678615, 0.04308797, -1.894962, 0, 0, 1, 1, 1,
-0.2599678, 0.3918551, -1.220639, 1, 0, 0, 1, 1,
-0.2594724, 0.432528, 0.9862932, 1, 0, 0, 1, 1,
-0.2586567, -0.468458, -3.954554, 1, 0, 0, 1, 1,
-0.2561737, -2.013695, -2.200489, 1, 0, 0, 1, 1,
-0.25043, -0.6356248, -3.654404, 1, 0, 0, 1, 1,
-0.2484544, -1.706473, -4.833377, 0, 0, 0, 1, 1,
-0.243066, 0.5375556, -1.195403, 0, 0, 0, 1, 1,
-0.2360772, -0.01538438, -1.406514, 0, 0, 0, 1, 1,
-0.2349858, 0.3744448, -0.3604808, 0, 0, 0, 1, 1,
-0.2293074, -1.177759, -4.02221, 0, 0, 0, 1, 1,
-0.2287741, 0.1252906, -1.376087, 0, 0, 0, 1, 1,
-0.2152649, -0.9324901, -3.324456, 0, 0, 0, 1, 1,
-0.2141331, 1.006968, -2.089643, 1, 1, 1, 1, 1,
-0.2108534, 0.3706059, -0.2429112, 1, 1, 1, 1, 1,
-0.2106648, 0.1355799, -1.126323, 1, 1, 1, 1, 1,
-0.2084248, 0.3578109, -0.6999555, 1, 1, 1, 1, 1,
-0.2079676, -0.4560176, -2.872512, 1, 1, 1, 1, 1,
-0.2077896, -0.441687, -1.428354, 1, 1, 1, 1, 1,
-0.2076507, 1.018281, -0.700574, 1, 1, 1, 1, 1,
-0.2051953, -0.8353791, -2.748672, 1, 1, 1, 1, 1,
-0.2031095, -1.912117, -2.564299, 1, 1, 1, 1, 1,
-0.1992421, -0.3534006, -2.600911, 1, 1, 1, 1, 1,
-0.1991729, 0.228701, -2.613074, 1, 1, 1, 1, 1,
-0.1956281, 0.7658893, -0.5393882, 1, 1, 1, 1, 1,
-0.1954936, 0.6948205, -0.1588669, 1, 1, 1, 1, 1,
-0.1950965, 0.6084507, -0.4772961, 1, 1, 1, 1, 1,
-0.1930314, -0.2179113, -3.592961, 1, 1, 1, 1, 1,
-0.1914112, 0.08534683, -1.421803, 0, 0, 1, 1, 1,
-0.1881066, -2.508712, -3.994854, 1, 0, 0, 1, 1,
-0.1869281, -1.350089, -2.63105, 1, 0, 0, 1, 1,
-0.1859003, 0.9967461, 0.9326659, 1, 0, 0, 1, 1,
-0.1852156, 0.1337242, -2.277391, 1, 0, 0, 1, 1,
-0.1831933, 0.1834791, -0.518936, 1, 0, 0, 1, 1,
-0.1791956, 0.2467069, -1.681149, 0, 0, 0, 1, 1,
-0.1778649, 0.4838909, 0.1198695, 0, 0, 0, 1, 1,
-0.176082, 0.8277712, -0.08858564, 0, 0, 0, 1, 1,
-0.1754028, 0.762728, 0.4049754, 0, 0, 0, 1, 1,
-0.1747427, 0.3628184, -1.47774, 0, 0, 0, 1, 1,
-0.1735015, -0.05223559, -1.401602, 0, 0, 0, 1, 1,
-0.1703023, 0.6766876, 0.294621, 0, 0, 0, 1, 1,
-0.1691594, 0.01610067, -1.573522, 1, 1, 1, 1, 1,
-0.1684303, 0.451778, -0.6591438, 1, 1, 1, 1, 1,
-0.1675357, 0.226265, -1.514106, 1, 1, 1, 1, 1,
-0.1584357, -1.500349, -2.019239, 1, 1, 1, 1, 1,
-0.158332, -0.7094916, -3.986233, 1, 1, 1, 1, 1,
-0.1528259, 0.574948, -0.646798, 1, 1, 1, 1, 1,
-0.1484545, 1.648699, -1.076408, 1, 1, 1, 1, 1,
-0.1475856, 0.9624149, -0.03689278, 1, 1, 1, 1, 1,
-0.1464249, 0.4553871, -0.3440242, 1, 1, 1, 1, 1,
-0.1430929, -1.136664, -2.358843, 1, 1, 1, 1, 1,
-0.141104, -0.8945248, -2.682374, 1, 1, 1, 1, 1,
-0.1388322, -0.6481748, -2.998076, 1, 1, 1, 1, 1,
-0.1388167, -1.67131, -4.22638, 1, 1, 1, 1, 1,
-0.13742, 1.811309, -0.3469191, 1, 1, 1, 1, 1,
-0.1350773, 0.1524246, 0.5287068, 1, 1, 1, 1, 1,
-0.1343223, 0.08792143, -1.200391, 0, 0, 1, 1, 1,
-0.1319311, 0.5635065, -1.43187, 1, 0, 0, 1, 1,
-0.1294563, 0.08786347, -0.2819586, 1, 0, 0, 1, 1,
-0.1293619, 1.68315, -1.667844, 1, 0, 0, 1, 1,
-0.1286053, -0.5366588, -1.322199, 1, 0, 0, 1, 1,
-0.1284605, -0.5546972, -2.247047, 1, 0, 0, 1, 1,
-0.1268461, 0.489819, 1.294421, 0, 0, 0, 1, 1,
-0.1209624, 0.4111432, -0.2712182, 0, 0, 0, 1, 1,
-0.1208992, -0.1048475, -1.966006, 0, 0, 0, 1, 1,
-0.1207505, -0.6149295, -3.036902, 0, 0, 0, 1, 1,
-0.1190504, 0.9466062, 1.39965, 0, 0, 0, 1, 1,
-0.1154273, 0.0404427, 0.6989068, 0, 0, 0, 1, 1,
-0.1129384, -0.04370033, -2.707339, 0, 0, 0, 1, 1,
-0.1116983, 0.9495282, 1.010947, 1, 1, 1, 1, 1,
-0.1104833, 0.8926564, 0.7137889, 1, 1, 1, 1, 1,
-0.1084153, -0.366995, -3.636515, 1, 1, 1, 1, 1,
-0.1068743, 0.7968794, -0.3259761, 1, 1, 1, 1, 1,
-0.1034523, 0.3065472, 1.232279, 1, 1, 1, 1, 1,
-0.1030332, -0.8440428, -0.8462427, 1, 1, 1, 1, 1,
-0.1021052, 1.602607, -0.2918341, 1, 1, 1, 1, 1,
-0.0991259, 0.03012009, -0.8131912, 1, 1, 1, 1, 1,
-0.09674469, 1.513369, -0.8326368, 1, 1, 1, 1, 1,
-0.09334607, 0.2930759, 1.471881, 1, 1, 1, 1, 1,
-0.09275987, -0.1366813, -2.803991, 1, 1, 1, 1, 1,
-0.09268988, 0.7402247, -0.2535852, 1, 1, 1, 1, 1,
-0.08734076, 0.8009421, -0.6641567, 1, 1, 1, 1, 1,
-0.08295897, -0.8434045, -1.639559, 1, 1, 1, 1, 1,
-0.07897574, 1.208004, -0.7409568, 1, 1, 1, 1, 1,
-0.07136451, 0.5183507, -0.1023566, 0, 0, 1, 1, 1,
-0.07056639, 1.186371, -0.4180647, 1, 0, 0, 1, 1,
-0.06795043, 1.455763, 0.5252798, 1, 0, 0, 1, 1,
-0.06650732, 0.9485225, -0.5249504, 1, 0, 0, 1, 1,
-0.0661561, -0.3651597, -6.248876, 1, 0, 0, 1, 1,
-0.06462859, 0.3031104, -1.795292, 1, 0, 0, 1, 1,
-0.06419694, 1.006929, -0.1016588, 0, 0, 0, 1, 1,
-0.06269722, -0.5025014, -1.725206, 0, 0, 0, 1, 1,
-0.05779816, -0.3214955, -2.321754, 0, 0, 0, 1, 1,
-0.05771747, -0.192936, -3.29862, 0, 0, 0, 1, 1,
-0.0562011, 1.622884, -0.6277544, 0, 0, 0, 1, 1,
-0.05571603, 1.780328, 0.2819348, 0, 0, 0, 1, 1,
-0.05248665, 1.146237, -1.342401, 0, 0, 0, 1, 1,
-0.05175035, 1.131052, 1.062938, 1, 1, 1, 1, 1,
-0.05056934, -0.1211934, -1.442735, 1, 1, 1, 1, 1,
-0.04541076, 0.9528614, -0.9593451, 1, 1, 1, 1, 1,
-0.04150178, -0.6751322, -2.039236, 1, 1, 1, 1, 1,
-0.03907081, 2.194525, 0.4901356, 1, 1, 1, 1, 1,
-0.03477101, -0.1526987, -3.544165, 1, 1, 1, 1, 1,
-0.03374576, 0.1498814, 0.00473503, 1, 1, 1, 1, 1,
-0.02889537, 1.64272, 1.594361, 1, 1, 1, 1, 1,
-0.02884497, 0.7317985, 1.255712, 1, 1, 1, 1, 1,
-0.02865443, 1.085275, -0.1512873, 1, 1, 1, 1, 1,
-0.02474481, -0.01890466, -2.435316, 1, 1, 1, 1, 1,
-0.01955817, -1.186544, -4.028583, 1, 1, 1, 1, 1,
-0.01848057, -0.4921004, -2.27462, 1, 1, 1, 1, 1,
-0.01828191, -0.1940782, -1.325543, 1, 1, 1, 1, 1,
-0.01612739, 0.7545005, 0.7382403, 1, 1, 1, 1, 1,
-0.01570128, 1.305879, 1.176395, 0, 0, 1, 1, 1,
-0.01532609, 0.5879783, -0.08194955, 1, 0, 0, 1, 1,
-0.01198376, -0.7394801, -2.903146, 1, 0, 0, 1, 1,
-0.01136227, 0.4984367, -0.173608, 1, 0, 0, 1, 1,
-0.01135241, -1.703876, -3.519135, 1, 0, 0, 1, 1,
-0.01009884, 0.4937417, 0.2641886, 1, 0, 0, 1, 1,
-0.009277443, -1.502182, -2.831465, 0, 0, 0, 1, 1,
-0.007982772, -0.1513659, -2.97429, 0, 0, 0, 1, 1,
-0.007193799, 0.4852948, -0.5712668, 0, 0, 0, 1, 1,
-0.002320825, 1.540151, 1.125554, 0, 0, 0, 1, 1,
0.001953481, -0.6310638, 4.914912, 0, 0, 0, 1, 1,
0.007933817, 1.98978, 0.7253633, 0, 0, 0, 1, 1,
0.01065964, -0.336664, 3.633121, 0, 0, 0, 1, 1,
0.01520488, -0.1532123, 2.511793, 1, 1, 1, 1, 1,
0.01711215, 0.7394578, 0.384921, 1, 1, 1, 1, 1,
0.02069155, 1.420799, -0.4170693, 1, 1, 1, 1, 1,
0.02202628, 0.7744567, 0.4591331, 1, 1, 1, 1, 1,
0.02248755, -0.82815, 2.73248, 1, 1, 1, 1, 1,
0.02348776, -0.4535288, 3.11812, 1, 1, 1, 1, 1,
0.024131, 0.07680664, -0.0697023, 1, 1, 1, 1, 1,
0.02783282, 0.3476652, 0.220304, 1, 1, 1, 1, 1,
0.02829937, 1.230689, -0.3710664, 1, 1, 1, 1, 1,
0.03205005, 1.569787, -0.28919, 1, 1, 1, 1, 1,
0.03649021, -0.06510292, 3.3031, 1, 1, 1, 1, 1,
0.0400917, -0.5548406, 2.661985, 1, 1, 1, 1, 1,
0.04166863, -0.6149102, 3.634562, 1, 1, 1, 1, 1,
0.04702365, -0.3914389, 1.948232, 1, 1, 1, 1, 1,
0.04778738, -0.3018231, 4.432469, 1, 1, 1, 1, 1,
0.05712784, 0.4687848, 1.977176, 0, 0, 1, 1, 1,
0.05922832, -0.06140755, 3.523939, 1, 0, 0, 1, 1,
0.06274156, -1.109066, 3.970847, 1, 0, 0, 1, 1,
0.06280282, -2.8406, 2.474867, 1, 0, 0, 1, 1,
0.07279696, 0.6401802, -0.04281272, 1, 0, 0, 1, 1,
0.07284315, -0.5228035, 3.12946, 1, 0, 0, 1, 1,
0.07315972, -0.2369073, 2.836628, 0, 0, 0, 1, 1,
0.07604194, 1.165526, -1.010298, 0, 0, 0, 1, 1,
0.07792442, 1.724387, 0.3443873, 0, 0, 0, 1, 1,
0.07874077, -0.1052108, 1.185273, 0, 0, 0, 1, 1,
0.08070005, 0.06281545, 1.000025, 0, 0, 0, 1, 1,
0.08252177, 1.686674, -0.8604195, 0, 0, 0, 1, 1,
0.08291149, -0.8746656, 1.71028, 0, 0, 0, 1, 1,
0.08854411, -0.5346279, 4.472705, 1, 1, 1, 1, 1,
0.09292763, -1.034032, 1.914647, 1, 1, 1, 1, 1,
0.0933082, -1.046082, 2.184562, 1, 1, 1, 1, 1,
0.09345946, 0.5741333, 1.054835, 1, 1, 1, 1, 1,
0.09483281, 0.9797462, -0.4485126, 1, 1, 1, 1, 1,
0.09559613, 0.3675095, 2.897896, 1, 1, 1, 1, 1,
0.09613551, 0.07683582, 0.05255349, 1, 1, 1, 1, 1,
0.09686831, 0.850776, 0.5296927, 1, 1, 1, 1, 1,
0.0981032, -0.6855176, 3.050331, 1, 1, 1, 1, 1,
0.09879722, 1.192043, -0.3342824, 1, 1, 1, 1, 1,
0.09914671, 1.480178, 1.446968, 1, 1, 1, 1, 1,
0.09969644, 0.702767, 0.7087849, 1, 1, 1, 1, 1,
0.1008253, -0.0740994, 0.9717106, 1, 1, 1, 1, 1,
0.1026753, -1.075972, 3.799926, 1, 1, 1, 1, 1,
0.1134493, -0.1353678, 2.153049, 1, 1, 1, 1, 1,
0.1155844, 1.435141, 0.2733649, 0, 0, 1, 1, 1,
0.116251, 0.4505839, -1.48398, 1, 0, 0, 1, 1,
0.1199357, 0.5067881, 1.434677, 1, 0, 0, 1, 1,
0.1226508, -0.8382624, 2.661985, 1, 0, 0, 1, 1,
0.1253528, 0.1581061, 2.749178, 1, 0, 0, 1, 1,
0.1269378, 0.5445499, -1.391766, 1, 0, 0, 1, 1,
0.1282865, 0.6165521, -1.127903, 0, 0, 0, 1, 1,
0.1319441, 0.1969785, -0.9407412, 0, 0, 0, 1, 1,
0.1321966, -0.1736979, 3.315374, 0, 0, 0, 1, 1,
0.1338807, 0.4670382, -0.317637, 0, 0, 0, 1, 1,
0.1343614, -0.168369, 1.617361, 0, 0, 0, 1, 1,
0.1351651, 0.4788412, -0.05907122, 0, 0, 0, 1, 1,
0.1390163, -0.09871361, 1.323118, 0, 0, 0, 1, 1,
0.1410598, 2.299294, 0.8794677, 1, 1, 1, 1, 1,
0.1426281, -0.4616803, 4.168931, 1, 1, 1, 1, 1,
0.1443935, -0.260785, 3.871239, 1, 1, 1, 1, 1,
0.1459479, -0.8215125, 1.703158, 1, 1, 1, 1, 1,
0.1465004, 0.1310669, -0.1566719, 1, 1, 1, 1, 1,
0.1518426, 1.04048, -0.318831, 1, 1, 1, 1, 1,
0.1527525, 0.8661003, -0.7373287, 1, 1, 1, 1, 1,
0.1532138, -0.7655768, 4.500629, 1, 1, 1, 1, 1,
0.1544106, -1.449896, 1.142405, 1, 1, 1, 1, 1,
0.1576979, 0.09222317, 1.182111, 1, 1, 1, 1, 1,
0.1587414, 0.3448585, 1.076621, 1, 1, 1, 1, 1,
0.1587932, -1.057892, 3.589468, 1, 1, 1, 1, 1,
0.1594821, 1.499597, -0.3906521, 1, 1, 1, 1, 1,
0.162914, 0.6301941, 0.8733351, 1, 1, 1, 1, 1,
0.1656658, -0.6440842, 2.949649, 1, 1, 1, 1, 1,
0.1665319, 1.006389, -2.244376, 0, 0, 1, 1, 1,
0.1700571, -0.9796069, 2.536035, 1, 0, 0, 1, 1,
0.1718085, 0.3778104, -1.217809, 1, 0, 0, 1, 1,
0.1720321, 1.312921, 0.2399828, 1, 0, 0, 1, 1,
0.1751729, -0.1389962, 2.288947, 1, 0, 0, 1, 1,
0.1820224, -0.4497975, 1.873179, 1, 0, 0, 1, 1,
0.1852553, -0.1441117, 3.233567, 0, 0, 0, 1, 1,
0.1856455, 0.711642, 1.175893, 0, 0, 0, 1, 1,
0.187052, 0.5300779, -0.1795666, 0, 0, 0, 1, 1,
0.1877589, 1.749018, 0.5345755, 0, 0, 0, 1, 1,
0.1887493, 1.290307, 0.5014389, 0, 0, 0, 1, 1,
0.1888976, 0.1464101, -1.029534, 0, 0, 0, 1, 1,
0.1965044, -1.632982, 3.647208, 0, 0, 0, 1, 1,
0.200403, -0.5255188, 3.342783, 1, 1, 1, 1, 1,
0.2041397, 1.777737, -0.001978604, 1, 1, 1, 1, 1,
0.2093528, -0.6383703, 3.915621, 1, 1, 1, 1, 1,
0.2103243, -0.6817359, 4.884706, 1, 1, 1, 1, 1,
0.2111746, -0.2960434, 3.513989, 1, 1, 1, 1, 1,
0.2128987, -0.4433509, 2.206599, 1, 1, 1, 1, 1,
0.2200367, -1.068824, 1.794318, 1, 1, 1, 1, 1,
0.2201972, 1.796999, 0.4535314, 1, 1, 1, 1, 1,
0.2234373, 1.318244, -1.638532, 1, 1, 1, 1, 1,
0.2287182, -2.484627, 3.486837, 1, 1, 1, 1, 1,
0.229344, -1.72785, 2.497051, 1, 1, 1, 1, 1,
0.233781, 1.811957, -0.4335594, 1, 1, 1, 1, 1,
0.2343386, 0.2435994, 0.3494781, 1, 1, 1, 1, 1,
0.2351293, -0.7634152, 3.189233, 1, 1, 1, 1, 1,
0.2353461, -0.1623036, 0.1972152, 1, 1, 1, 1, 1,
0.2369543, -2.009799, 3.099614, 0, 0, 1, 1, 1,
0.2378997, -1.456935, 3.731101, 1, 0, 0, 1, 1,
0.2524644, -0.7662531, 3.502858, 1, 0, 0, 1, 1,
0.2550408, -0.2299864, 2.82922, 1, 0, 0, 1, 1,
0.2551633, 1.693956, 0.5576271, 1, 0, 0, 1, 1,
0.2656822, 0.8194838, 0.2170714, 1, 0, 0, 1, 1,
0.2659266, 0.6116238, -1.055804, 0, 0, 0, 1, 1,
0.2676623, 0.2427089, 1.822273, 0, 0, 0, 1, 1,
0.2704205, 1.622222, 1.755215, 0, 0, 0, 1, 1,
0.2705348, 1.108645, -1.360067, 0, 0, 0, 1, 1,
0.2750404, -0.1985949, 2.00798, 0, 0, 0, 1, 1,
0.2754777, -2.325666, 3.384576, 0, 0, 0, 1, 1,
0.275537, -0.3539304, 2.907469, 0, 0, 0, 1, 1,
0.2783142, -1.823697, 3.650034, 1, 1, 1, 1, 1,
0.2802507, -1.421964, 3.533439, 1, 1, 1, 1, 1,
0.2821666, -0.1362076, 2.283296, 1, 1, 1, 1, 1,
0.2905842, 0.5233405, 0.1462443, 1, 1, 1, 1, 1,
0.2950416, 0.9503273, -0.1834973, 1, 1, 1, 1, 1,
0.2956191, -0.2221491, 1.990336, 1, 1, 1, 1, 1,
0.2985986, -0.8140213, 2.50856, 1, 1, 1, 1, 1,
0.2997572, -2.111618, 1.228523, 1, 1, 1, 1, 1,
0.3013563, -0.4464692, 3.677584, 1, 1, 1, 1, 1,
0.3017085, -0.1885949, 2.000047, 1, 1, 1, 1, 1,
0.3030932, 0.04262671, 3.446658, 1, 1, 1, 1, 1,
0.3045589, -1.148453, 2.806091, 1, 1, 1, 1, 1,
0.3090397, -1.008302, 3.459141, 1, 1, 1, 1, 1,
0.3108758, -0.5997546, 2.663239, 1, 1, 1, 1, 1,
0.3185572, -1.026135, 3.819586, 1, 1, 1, 1, 1,
0.3224913, 0.243843, 0.2956534, 0, 0, 1, 1, 1,
0.3240888, 0.7793696, 1.792859, 1, 0, 0, 1, 1,
0.3253745, -0.4144398, 1.796057, 1, 0, 0, 1, 1,
0.3294276, -0.4355941, 2.865473, 1, 0, 0, 1, 1,
0.3408492, -0.07468324, 2.74578, 1, 0, 0, 1, 1,
0.3425567, -0.2876401, 3.031097, 1, 0, 0, 1, 1,
0.3448634, 0.6459732, 0.9261885, 0, 0, 0, 1, 1,
0.3471857, 1.454718, -0.4118131, 0, 0, 0, 1, 1,
0.3481347, 0.3313673, 2.614543, 0, 0, 0, 1, 1,
0.3483316, 1.10451, -0.5232098, 0, 0, 0, 1, 1,
0.3565359, 1.664658, 0.1567977, 0, 0, 0, 1, 1,
0.356903, -1.787263, 2.332239, 0, 0, 0, 1, 1,
0.3622951, 0.04812296, 2.271009, 0, 0, 0, 1, 1,
0.3643335, -1.863402, 2.878597, 1, 1, 1, 1, 1,
0.3651907, 0.2177148, -0.03153273, 1, 1, 1, 1, 1,
0.3665709, -0.4881553, 4.389136, 1, 1, 1, 1, 1,
0.3690273, -0.4846312, 3.366821, 1, 1, 1, 1, 1,
0.3722927, -0.9634023, 0.9255846, 1, 1, 1, 1, 1,
0.3725042, -1.093622, 3.775252, 1, 1, 1, 1, 1,
0.3735736, 0.3164, 1.301195, 1, 1, 1, 1, 1,
0.374119, 1.671155, -0.5287325, 1, 1, 1, 1, 1,
0.3751569, -0.8150424, 1.260233, 1, 1, 1, 1, 1,
0.3815023, -1.769994, 2.752039, 1, 1, 1, 1, 1,
0.38185, 1.155789, -0.2742779, 1, 1, 1, 1, 1,
0.3837809, 1.427092, 1.709439, 1, 1, 1, 1, 1,
0.3861544, 0.6371463, 1.88237, 1, 1, 1, 1, 1,
0.3900084, 0.3726195, 1.856192, 1, 1, 1, 1, 1,
0.3904005, 0.5989841, 1.112129, 1, 1, 1, 1, 1,
0.3955428, -0.3991617, 2.169159, 0, 0, 1, 1, 1,
0.3967061, -0.4318972, 1.337304, 1, 0, 0, 1, 1,
0.398734, -0.9585865, 2.429472, 1, 0, 0, 1, 1,
0.405055, 0.6422373, 1.290913, 1, 0, 0, 1, 1,
0.4087404, -0.5806029, 0.654958, 1, 0, 0, 1, 1,
0.4120824, -0.09270379, 0.700071, 1, 0, 0, 1, 1,
0.4146006, 0.8589834, 0.5166135, 0, 0, 0, 1, 1,
0.4167846, 0.8505349, 0.860528, 0, 0, 0, 1, 1,
0.4192623, -0.993966, 3.029625, 0, 0, 0, 1, 1,
0.420378, 1.255218, 1.152974, 0, 0, 0, 1, 1,
0.4234973, -1.606976, 4.437371, 0, 0, 0, 1, 1,
0.4300715, -0.8330613, 2.594279, 0, 0, 0, 1, 1,
0.4365293, 1.451715, 0.9414058, 0, 0, 0, 1, 1,
0.4393129, 0.1529702, 1.369659, 1, 1, 1, 1, 1,
0.4407822, 1.172822, 2.835649, 1, 1, 1, 1, 1,
0.4415586, -0.1321525, 1.044273, 1, 1, 1, 1, 1,
0.4423944, 0.9612817, -0.2571093, 1, 1, 1, 1, 1,
0.4452286, -0.03479236, 1.115135, 1, 1, 1, 1, 1,
0.4506585, -0.5865449, 3.798447, 1, 1, 1, 1, 1,
0.4512057, -0.09006046, 0.8457975, 1, 1, 1, 1, 1,
0.4518353, -0.1126845, 1.913852, 1, 1, 1, 1, 1,
0.4536372, 0.7985184, 1.628707, 1, 1, 1, 1, 1,
0.4547199, -1.4621, 2.655515, 1, 1, 1, 1, 1,
0.4559887, 1.171813, 0.3615469, 1, 1, 1, 1, 1,
0.4568183, -0.03836397, 0.6019269, 1, 1, 1, 1, 1,
0.4583438, -1.818788, 3.383618, 1, 1, 1, 1, 1,
0.4587505, -0.6226901, 2.864078, 1, 1, 1, 1, 1,
0.4591038, -0.1586635, 1.488021, 1, 1, 1, 1, 1,
0.45964, 0.6132477, 1.188398, 0, 0, 1, 1, 1,
0.4633886, 0.8793195, 2.093242, 1, 0, 0, 1, 1,
0.4666947, -0.564066, 2.137061, 1, 0, 0, 1, 1,
0.4668064, 1.026453, -0.7964416, 1, 0, 0, 1, 1,
0.4668585, 0.3598706, 0.5438361, 1, 0, 0, 1, 1,
0.4682601, 0.400437, 0.02438377, 1, 0, 0, 1, 1,
0.4700626, -0.02007187, 0.3917543, 0, 0, 0, 1, 1,
0.4716766, -1.847733, 2.148171, 0, 0, 0, 1, 1,
0.4718086, -1.327726, 2.359124, 0, 0, 0, 1, 1,
0.4729244, 0.8223379, 0.2027261, 0, 0, 0, 1, 1,
0.4753477, 0.8619658, 0.6493155, 0, 0, 0, 1, 1,
0.4769149, 0.3178343, 2.385838, 0, 0, 0, 1, 1,
0.4774699, 0.2766637, 1.066242, 0, 0, 0, 1, 1,
0.4776722, -1.342497, 0.9534469, 1, 1, 1, 1, 1,
0.478543, 0.1646834, 3.158571, 1, 1, 1, 1, 1,
0.4801094, -0.6423573, 1.081002, 1, 1, 1, 1, 1,
0.4811282, 0.4837697, 0.6529358, 1, 1, 1, 1, 1,
0.4815881, -0.7054725, 2.497666, 1, 1, 1, 1, 1,
0.4879766, -1.08502, 1.525326, 1, 1, 1, 1, 1,
0.4888492, -0.1696462, 0.4805636, 1, 1, 1, 1, 1,
0.4917034, -1.307217, 2.584471, 1, 1, 1, 1, 1,
0.4989729, 1.948985, 0.3794407, 1, 1, 1, 1, 1,
0.5005724, -1.688474, 3.777576, 1, 1, 1, 1, 1,
0.504917, -1.507716, 2.172976, 1, 1, 1, 1, 1,
0.508916, 0.749864, 2.04235, 1, 1, 1, 1, 1,
0.5154395, -1.074373, 1.576198, 1, 1, 1, 1, 1,
0.5156549, 0.2753434, 0.5282981, 1, 1, 1, 1, 1,
0.5173733, -0.1455948, 0.8167892, 1, 1, 1, 1, 1,
0.5178257, 1.245595, 0.2576995, 0, 0, 1, 1, 1,
0.5198452, 0.3677915, 1.513909, 1, 0, 0, 1, 1,
0.5318317, 1.284956, -1.348169, 1, 0, 0, 1, 1,
0.5337461, 0.3265691, 0.7656758, 1, 0, 0, 1, 1,
0.534403, -2.059156, 2.963506, 1, 0, 0, 1, 1,
0.5349855, -1.073337, 2.466307, 1, 0, 0, 1, 1,
0.5374937, -0.2930734, 1.548621, 0, 0, 0, 1, 1,
0.5472048, 1.848867, -0.4441029, 0, 0, 0, 1, 1,
0.5482354, 1.572538, -1.076998, 0, 0, 0, 1, 1,
0.5491768, -0.848653, 3.922597, 0, 0, 0, 1, 1,
0.5499557, 0.1025156, 1.238065, 0, 0, 0, 1, 1,
0.5508512, 0.6100198, 1.190383, 0, 0, 0, 1, 1,
0.5514475, -0.4890869, 3.414687, 0, 0, 0, 1, 1,
0.5548863, -0.4629804, 2.998237, 1, 1, 1, 1, 1,
0.5596806, -0.02109946, 0.07134163, 1, 1, 1, 1, 1,
0.5600963, 1.570932, 0.3340121, 1, 1, 1, 1, 1,
0.5701588, -0.606244, 3.332156, 1, 1, 1, 1, 1,
0.5725205, -0.01485455, 1.534972, 1, 1, 1, 1, 1,
0.5725667, -1.102532, 2.408013, 1, 1, 1, 1, 1,
0.5754097, -0.2444604, 2.521874, 1, 1, 1, 1, 1,
0.5774743, 0.1370004, 0.5147378, 1, 1, 1, 1, 1,
0.5834468, 2.525829, -1.87859, 1, 1, 1, 1, 1,
0.5834854, -1.766943, 2.991451, 1, 1, 1, 1, 1,
0.5882643, 1.808084, 0.6510186, 1, 1, 1, 1, 1,
0.6020949, -1.001067, 3.177641, 1, 1, 1, 1, 1,
0.6025217, -0.8210425, 1.825614, 1, 1, 1, 1, 1,
0.6063295, 1.902234, -0.009981209, 1, 1, 1, 1, 1,
0.6064262, -0.3966455, 1.687119, 1, 1, 1, 1, 1,
0.6101621, 2.121906, 2.24743, 0, 0, 1, 1, 1,
0.6108263, -0.9158438, 3.470201, 1, 0, 0, 1, 1,
0.6242683, 0.6322594, 0.3364407, 1, 0, 0, 1, 1,
0.6276766, -2.715119, 3.285758, 1, 0, 0, 1, 1,
0.6348992, -0.5847791, 1.474788, 1, 0, 0, 1, 1,
0.6356229, -0.3250863, 2.084752, 1, 0, 0, 1, 1,
0.6368435, -0.1045987, 0.5869078, 0, 0, 0, 1, 1,
0.6373438, 1.664088, -2.309259, 0, 0, 0, 1, 1,
0.6410507, -0.5353916, -0.182883, 0, 0, 0, 1, 1,
0.6429223, 1.538898, -1.161891, 0, 0, 0, 1, 1,
0.6447836, -0.3733101, 3.491495, 0, 0, 0, 1, 1,
0.649413, 1.31238, 0.2809199, 0, 0, 0, 1, 1,
0.6507997, -0.4321719, 1.226025, 0, 0, 0, 1, 1,
0.6528106, -0.3112403, 1.071524, 1, 1, 1, 1, 1,
0.6535563, 0.4087575, -1.012835, 1, 1, 1, 1, 1,
0.6548419, -0.4887263, 1.989282, 1, 1, 1, 1, 1,
0.6570824, -0.4345934, 2.291801, 1, 1, 1, 1, 1,
0.6578471, 0.2082579, 0.499449, 1, 1, 1, 1, 1,
0.6609143, -0.9964194, 3.226971, 1, 1, 1, 1, 1,
0.6641424, -0.105596, 1.879069, 1, 1, 1, 1, 1,
0.6721121, 0.490813, 2.009572, 1, 1, 1, 1, 1,
0.6724905, 0.2017524, 1.257753, 1, 1, 1, 1, 1,
0.6805692, -0.0312465, 2.601555, 1, 1, 1, 1, 1,
0.6844347, -0.4001225, 2.307486, 1, 1, 1, 1, 1,
0.6868338, -0.1357566, 2.632401, 1, 1, 1, 1, 1,
0.6952302, 0.3771122, 1.483154, 1, 1, 1, 1, 1,
0.6969301, -2.769259, 1.949777, 1, 1, 1, 1, 1,
0.7005681, -1.066247, 1.482802, 1, 1, 1, 1, 1,
0.7024446, 0.4972903, 1.483243, 0, 0, 1, 1, 1,
0.7040967, -0.3214436, 1.964361, 1, 0, 0, 1, 1,
0.718824, 0.1819643, 2.010642, 1, 0, 0, 1, 1,
0.7191988, -0.959331, 3.918133, 1, 0, 0, 1, 1,
0.7326348, -0.7119719, 3.077718, 1, 0, 0, 1, 1,
0.7381412, 0.09958394, 1.400067, 1, 0, 0, 1, 1,
0.7394537, -1.832095, 2.42924, 0, 0, 0, 1, 1,
0.7423421, -1.395218, 3.352056, 0, 0, 0, 1, 1,
0.7425459, 0.6817594, -0.3716601, 0, 0, 0, 1, 1,
0.7439112, 0.171557, 0.642239, 0, 0, 0, 1, 1,
0.7517623, -1.002049, 3.83107, 0, 0, 0, 1, 1,
0.7518038, 0.9583105, 0.5383704, 0, 0, 0, 1, 1,
0.7525471, -0.4642146, 2.567602, 0, 0, 0, 1, 1,
0.7527555, -0.1672168, 3.416619, 1, 1, 1, 1, 1,
0.7600148, -2.60457, 3.246066, 1, 1, 1, 1, 1,
0.7605578, 0.627552, 3.29408, 1, 1, 1, 1, 1,
0.7684981, -2.17007, 3.68067, 1, 1, 1, 1, 1,
0.771722, 1.169734, -0.9230303, 1, 1, 1, 1, 1,
0.776744, -0.2963646, 2.015211, 1, 1, 1, 1, 1,
0.7786645, -0.88073, 2.404477, 1, 1, 1, 1, 1,
0.7804409, 0.5245914, 1.244834, 1, 1, 1, 1, 1,
0.782648, 0.2591466, 2.884988, 1, 1, 1, 1, 1,
0.7906498, -0.2310949, 2.862473, 1, 1, 1, 1, 1,
0.7910184, -0.6549428, 3.429128, 1, 1, 1, 1, 1,
0.7914408, 1.240724, 0.2007092, 1, 1, 1, 1, 1,
0.7961335, 0.06211155, 1.331659, 1, 1, 1, 1, 1,
0.7977314, 0.6946961, 1.69505, 1, 1, 1, 1, 1,
0.8029053, 0.2721781, 1.572131, 1, 1, 1, 1, 1,
0.8052792, 0.336836, 2.032481, 0, 0, 1, 1, 1,
0.8072643, 0.4405155, 1.045486, 1, 0, 0, 1, 1,
0.8073958, 1.291089, 1.383379, 1, 0, 0, 1, 1,
0.8194757, 0.6856318, 0.7832108, 1, 0, 0, 1, 1,
0.8203036, 0.6133614, 1.523011, 1, 0, 0, 1, 1,
0.8207344, 2.128376, -0.1324055, 1, 0, 0, 1, 1,
0.8224413, 0.1128884, 3.059808, 0, 0, 0, 1, 1,
0.8237402, -0.8973677, 1.28307, 0, 0, 0, 1, 1,
0.8239495, -0.5373845, 2.895427, 0, 0, 0, 1, 1,
0.8307806, -1.625296, 4.171103, 0, 0, 0, 1, 1,
0.8343972, -0.07433822, -0.5194027, 0, 0, 0, 1, 1,
0.8399988, 1.145945, 0.8112283, 0, 0, 0, 1, 1,
0.8429765, -1.317662, 1.975278, 0, 0, 0, 1, 1,
0.8463537, 0.6551435, 0.3930462, 1, 1, 1, 1, 1,
0.8471546, 0.3409594, 0.6353611, 1, 1, 1, 1, 1,
0.8594393, 0.1728574, 1.700433, 1, 1, 1, 1, 1,
0.8628387, -0.7683588, 1.412769, 1, 1, 1, 1, 1,
0.8637158, 0.728956, 0.6996919, 1, 1, 1, 1, 1,
0.868564, -0.2422728, 2.32072, 1, 1, 1, 1, 1,
0.8726007, 1.197729, 2.788151, 1, 1, 1, 1, 1,
0.8775495, 1.265662, 0.4528624, 1, 1, 1, 1, 1,
0.8862814, -0.2355606, 2.030933, 1, 1, 1, 1, 1,
0.8894958, 0.7051145, 1.51593, 1, 1, 1, 1, 1,
0.8903571, -0.7707453, 2.819874, 1, 1, 1, 1, 1,
0.8923352, -0.6747605, 2.312103, 1, 1, 1, 1, 1,
0.9114817, -0.1456841, 0.7392297, 1, 1, 1, 1, 1,
0.9153798, 0.09515408, 0.1455467, 1, 1, 1, 1, 1,
0.9272581, -0.3699216, 1.454277, 1, 1, 1, 1, 1,
0.9354663, 0.6143783, 1.289482, 0, 0, 1, 1, 1,
0.9360203, -0.8621882, 2.802726, 1, 0, 0, 1, 1,
0.9402435, -1.692922, -0.2492546, 1, 0, 0, 1, 1,
0.9458166, -0.3933152, 2.16156, 1, 0, 0, 1, 1,
0.9559625, 1.367165, -1.017079, 1, 0, 0, 1, 1,
0.9576377, 1.117349, 0.4973492, 1, 0, 0, 1, 1,
0.9585294, 0.6300616, 1.376334, 0, 0, 0, 1, 1,
0.9603429, -1.013135, 2.430104, 0, 0, 0, 1, 1,
0.9646891, 0.5007475, 2.105175, 0, 0, 0, 1, 1,
0.9668099, 1.366359, -0.06907191, 0, 0, 0, 1, 1,
0.9698595, 0.3008625, 0.3599465, 0, 0, 0, 1, 1,
0.9742435, 1.845477, 1.618115, 0, 0, 0, 1, 1,
0.9784017, -1.093582, 2.474773, 0, 0, 0, 1, 1,
0.9800947, 0.4288371, 1.059056, 1, 1, 1, 1, 1,
0.9805503, -0.09006545, 0.7355442, 1, 1, 1, 1, 1,
0.9832786, -0.3374953, 1.21193, 1, 1, 1, 1, 1,
0.9854554, 0.6499044, 2.165421, 1, 1, 1, 1, 1,
0.986669, -1.815703, 2.070969, 1, 1, 1, 1, 1,
0.9878606, 1.484167, 0.9274862, 1, 1, 1, 1, 1,
0.9951935, -0.3010157, 0.928199, 1, 1, 1, 1, 1,
0.9971722, 0.4745824, 0.6499682, 1, 1, 1, 1, 1,
1.006844, -0.4329773, 0.5812005, 1, 1, 1, 1, 1,
1.011687, 0.5835416, -0.6161739, 1, 1, 1, 1, 1,
1.017245, 1.36031, 0.6206476, 1, 1, 1, 1, 1,
1.01752, 0.8578232, 0.5860792, 1, 1, 1, 1, 1,
1.021964, 1.806047, 1.621899, 1, 1, 1, 1, 1,
1.023466, 1.024743, 1.500768, 1, 1, 1, 1, 1,
1.024038, 1.583497, 1.485833, 1, 1, 1, 1, 1,
1.025259, -0.8995661, 3.082276, 0, 0, 1, 1, 1,
1.025544, 1.062668, 1.614507, 1, 0, 0, 1, 1,
1.037282, 0.9376631, 0.6654618, 1, 0, 0, 1, 1,
1.048036, 1.307693, 0.9090416, 1, 0, 0, 1, 1,
1.048163, -1.72805, 4.277436, 1, 0, 0, 1, 1,
1.049577, 0.5360005, 0.4014233, 1, 0, 0, 1, 1,
1.052483, 0.4145969, 1.151533, 0, 0, 0, 1, 1,
1.056843, 1.281944, 0.9195841, 0, 0, 0, 1, 1,
1.057865, 0.2264482, 0.7380656, 0, 0, 0, 1, 1,
1.058402, 1.290586, 0.6466733, 0, 0, 0, 1, 1,
1.061264, -0.7560658, 4.00334, 0, 0, 0, 1, 1,
1.066189, -0.6461775, 0.8494278, 0, 0, 0, 1, 1,
1.066827, -1.555633, 3.326727, 0, 0, 0, 1, 1,
1.068009, 0.8866295, 1.261244, 1, 1, 1, 1, 1,
1.069423, -0.5830151, 2.749605, 1, 1, 1, 1, 1,
1.071275, -0.2482826, 2.173152, 1, 1, 1, 1, 1,
1.08163, 0.3492602, -1.360596, 1, 1, 1, 1, 1,
1.08272, 0.9877347, 1.926238, 1, 1, 1, 1, 1,
1.083176, 0.5202008, 2.327065, 1, 1, 1, 1, 1,
1.084942, -0.6792575, 3.755532, 1, 1, 1, 1, 1,
1.086024, 1.119291, 1.054481, 1, 1, 1, 1, 1,
1.088314, -1.124612, 3.288072, 1, 1, 1, 1, 1,
1.094647, -0.06717306, 1.855325, 1, 1, 1, 1, 1,
1.099877, -0.4590504, 0.2490647, 1, 1, 1, 1, 1,
1.099951, 0.596041, 1.633606, 1, 1, 1, 1, 1,
1.100875, -0.7150782, 3.179903, 1, 1, 1, 1, 1,
1.10665, 0.4092052, 1.691126, 1, 1, 1, 1, 1,
1.11124, -0.3468246, 2.466557, 1, 1, 1, 1, 1,
1.112105, 1.884864, -0.2743993, 0, 0, 1, 1, 1,
1.118989, -1.138984, 2.117129, 1, 0, 0, 1, 1,
1.11957, 1.335865, 1.937527, 1, 0, 0, 1, 1,
1.120663, -0.9989774, 2.506504, 1, 0, 0, 1, 1,
1.124703, 0.267835, 2.071724, 1, 0, 0, 1, 1,
1.127415, -0.5474385, 2.335052, 1, 0, 0, 1, 1,
1.137446, 0.5085922, 0.7743239, 0, 0, 0, 1, 1,
1.145543, 0.3563529, 1.84032, 0, 0, 0, 1, 1,
1.1532, 1.686042, -0.9599181, 0, 0, 0, 1, 1,
1.153405, -0.7982149, 3.225604, 0, 0, 0, 1, 1,
1.157597, -0.7658136, 2.744093, 0, 0, 0, 1, 1,
1.1577, -0.2765039, 1.800528, 0, 0, 0, 1, 1,
1.15891, 0.374668, 1.910096, 0, 0, 0, 1, 1,
1.167784, 0.4876384, -1.139074, 1, 1, 1, 1, 1,
1.172258, -0.1583648, 3.215734, 1, 1, 1, 1, 1,
1.178454, -0.5324094, 1.739941, 1, 1, 1, 1, 1,
1.178814, 0.8498548, 0.7796183, 1, 1, 1, 1, 1,
1.181537, 0.1587565, 2.176872, 1, 1, 1, 1, 1,
1.190035, -2.101641, 3.20504, 1, 1, 1, 1, 1,
1.19513, -0.7475306, 2.215629, 1, 1, 1, 1, 1,
1.195924, -0.6487761, 1.924962, 1, 1, 1, 1, 1,
1.210709, -0.8510813, 1.573365, 1, 1, 1, 1, 1,
1.22005, -0.3971876, 1.167625, 1, 1, 1, 1, 1,
1.222818, 0.905144, 1.012021, 1, 1, 1, 1, 1,
1.229873, 0.1618069, 0.5736521, 1, 1, 1, 1, 1,
1.23258, -0.9080673, 2.414954, 1, 1, 1, 1, 1,
1.236201, -0.1228911, 3.735448, 1, 1, 1, 1, 1,
1.241095, 0.4430979, 1.729247, 1, 1, 1, 1, 1,
1.255601, -2.022267, 2.225373, 0, 0, 1, 1, 1,
1.25694, -0.3810493, 0.04196189, 1, 0, 0, 1, 1,
1.258465, 0.05425575, 1.735882, 1, 0, 0, 1, 1,
1.264387, -1.483361, 2.47068, 1, 0, 0, 1, 1,
1.267401, 0.5923964, 0.8630816, 1, 0, 0, 1, 1,
1.277842, 1.627291, 0.8932282, 1, 0, 0, 1, 1,
1.282318, 0.1723941, 1.24001, 0, 0, 0, 1, 1,
1.288893, -1.566797, 2.543646, 0, 0, 0, 1, 1,
1.298152, 0.1616408, 1.892511, 0, 0, 0, 1, 1,
1.300701, -0.9454929, 0.8766694, 0, 0, 0, 1, 1,
1.31371, -1.244138, 3.050689, 0, 0, 0, 1, 1,
1.334079, -1.380791, 3.111225, 0, 0, 0, 1, 1,
1.341998, 0.7790929, 1.130186, 0, 0, 0, 1, 1,
1.345237, -2.111856, 1.375838, 1, 1, 1, 1, 1,
1.353514, -1.021267, 0.2587005, 1, 1, 1, 1, 1,
1.354767, -0.03830999, 0.2795094, 1, 1, 1, 1, 1,
1.361287, -0.2430314, 2.610996, 1, 1, 1, 1, 1,
1.366609, 1.001228, 0.5564812, 1, 1, 1, 1, 1,
1.397032, 0.3300372, 0.3445556, 1, 1, 1, 1, 1,
1.400771, -1.036936, 3.813131, 1, 1, 1, 1, 1,
1.406708, -1.179658, 2.309711, 1, 1, 1, 1, 1,
1.428831, 1.000626, 0.6491468, 1, 1, 1, 1, 1,
1.429411, -0.03317787, 1.740181, 1, 1, 1, 1, 1,
1.431601, -0.2306707, 3.114457, 1, 1, 1, 1, 1,
1.457618, -0.6979594, 2.222333, 1, 1, 1, 1, 1,
1.458517, 0.5515123, 1.054432, 1, 1, 1, 1, 1,
1.479887, -0.7475157, 1.860999, 1, 1, 1, 1, 1,
1.490397, 1.267625, 0.2065327, 1, 1, 1, 1, 1,
1.503362, 0.1412147, 2.602469, 0, 0, 1, 1, 1,
1.505535, -2.364801, 2.929358, 1, 0, 0, 1, 1,
1.505633, 0.6192037, 2.179433, 1, 0, 0, 1, 1,
1.513525, 0.746922, 0.08327887, 1, 0, 0, 1, 1,
1.535483, 0.5606018, 0.948355, 1, 0, 0, 1, 1,
1.535835, -0.7437288, 2.808882, 1, 0, 0, 1, 1,
1.54081, -0.5090936, 1.908522, 0, 0, 0, 1, 1,
1.565783, 0.5170032, -0.6955605, 0, 0, 0, 1, 1,
1.568892, 1.117656, 0.5364838, 0, 0, 0, 1, 1,
1.570772, 0.4037803, -1.22931, 0, 0, 0, 1, 1,
1.571459, -0.3268303, 0.6543289, 0, 0, 0, 1, 1,
1.58341, -1.199652, 2.035552, 0, 0, 0, 1, 1,
1.586874, -0.203352, 2.847206, 0, 0, 0, 1, 1,
1.59838, 0.9685162, 2.316441, 1, 1, 1, 1, 1,
1.601889, 0.0957092, 1.878931, 1, 1, 1, 1, 1,
1.605218, -0.1241743, 0.5081526, 1, 1, 1, 1, 1,
1.615152, 0.9576836, 1.881135, 1, 1, 1, 1, 1,
1.623195, 0.4253976, 0.1640541, 1, 1, 1, 1, 1,
1.641607, 0.5940932, 0.6542754, 1, 1, 1, 1, 1,
1.655314, -0.5378649, 3.141287, 1, 1, 1, 1, 1,
1.661097, -0.1814365, 0.4820611, 1, 1, 1, 1, 1,
1.669819, -0.2834007, 2.936706, 1, 1, 1, 1, 1,
1.685455, -0.8594005, 1.795677, 1, 1, 1, 1, 1,
1.688235, -0.4539071, 1.268155, 1, 1, 1, 1, 1,
1.694342, -1.26466, 2.166201, 1, 1, 1, 1, 1,
1.702171, 1.214435, 0.7301039, 1, 1, 1, 1, 1,
1.710436, -0.6585125, 2.53018, 1, 1, 1, 1, 1,
1.712851, 0.7035744, -1.735305, 1, 1, 1, 1, 1,
1.716308, -0.3192314, 1.892362, 0, 0, 1, 1, 1,
1.721859, -1.594906, 2.938741, 1, 0, 0, 1, 1,
1.754264, 0.2107024, 2.400551, 1, 0, 0, 1, 1,
1.754749, 0.9106861, -0.1519048, 1, 0, 0, 1, 1,
1.76452, -1.576127, 4.068709, 1, 0, 0, 1, 1,
1.775143, -0.3200805, 3.383698, 1, 0, 0, 1, 1,
1.789216, -1.905607, 2.451007, 0, 0, 0, 1, 1,
1.800628, -0.7542262, 1.750991, 0, 0, 0, 1, 1,
1.812386, -0.9338149, 2.296131, 0, 0, 0, 1, 1,
1.820006, -0.9982191, 2.34406, 0, 0, 0, 1, 1,
1.868706, 0.9795567, 0.4413387, 0, 0, 0, 1, 1,
1.885343, -0.6656712, 1.934306, 0, 0, 0, 1, 1,
1.894696, 0.01442618, 2.47981, 0, 0, 0, 1, 1,
1.906165, -0.4643225, 3.065216, 1, 1, 1, 1, 1,
1.91583, 1.235025, 1.437828, 1, 1, 1, 1, 1,
1.972752, 0.2044142, 1.22523, 1, 1, 1, 1, 1,
1.975958, -0.4250262, 1.485648, 1, 1, 1, 1, 1,
1.986384, -1.092281, 1.735706, 1, 1, 1, 1, 1,
2.001174, -0.8273263, 2.416886, 1, 1, 1, 1, 1,
2.002651, -0.7535291, 2.353111, 1, 1, 1, 1, 1,
2.023912, -1.658241, 2.039621, 1, 1, 1, 1, 1,
2.037556, 1.328436, 2.402683, 1, 1, 1, 1, 1,
2.073225, 1.670154, 0.8966017, 1, 1, 1, 1, 1,
2.132361, 0.1619206, 1.47111, 1, 1, 1, 1, 1,
2.17145, 0.1887308, 1.471743, 1, 1, 1, 1, 1,
2.179412, -2.467364, 1.114188, 1, 1, 1, 1, 1,
2.189939, -0.9613768, 2.808235, 1, 1, 1, 1, 1,
2.19366, 0.7690582, 1.181773, 1, 1, 1, 1, 1,
2.237308, 0.4295592, 1.149281, 0, 0, 1, 1, 1,
2.245296, 0.4297582, 0.7435542, 1, 0, 0, 1, 1,
2.344171, 0.5553079, -0.8153393, 1, 0, 0, 1, 1,
2.348119, -0.6226313, 1.54403, 1, 0, 0, 1, 1,
2.355856, -1.89764, 1.999324, 1, 0, 0, 1, 1,
2.357839, -0.124589, 0.6344838, 1, 0, 0, 1, 1,
2.371799, -0.03500087, 1.225905, 0, 0, 0, 1, 1,
2.411405, 0.1886624, 1.589453, 0, 0, 0, 1, 1,
2.417909, 1.195252, 1.375659, 0, 0, 0, 1, 1,
2.471753, -0.981125, 2.936871, 0, 0, 0, 1, 1,
2.490804, -0.7510827, 2.899544, 0, 0, 0, 1, 1,
2.495341, 0.8694617, 1.182512, 0, 0, 0, 1, 1,
2.518887, -0.4886597, 2.879976, 0, 0, 0, 1, 1,
2.65248, 0.1498176, 2.501299, 1, 1, 1, 1, 1,
2.695769, 0.1335314, 4.06025, 1, 1, 1, 1, 1,
2.831781, -1.444872, 1.887446, 1, 1, 1, 1, 1,
2.93927, 0.02981596, 0.5512189, 1, 1, 1, 1, 1,
2.961942, -0.5652344, 1.752753, 1, 1, 1, 1, 1,
2.998641, 0.6194569, 0.7846441, 1, 1, 1, 1, 1,
3.030091, 2.395203, 0.3754219, 1, 1, 1, 1, 1
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
var radius = 9.498637;
var distance = 33.36356;
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
mvMatrix.translate( -0.2729918, -0.04750633, 0.6669819 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.36356);
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
