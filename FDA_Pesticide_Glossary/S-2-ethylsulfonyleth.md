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
-3.400661, 0.9460335, -1.651372, 1, 0, 0, 1,
-2.962517, -1.431929, -3.484834, 1, 0.007843138, 0, 1,
-2.922444, -0.9717053, -3.271067, 1, 0.01176471, 0, 1,
-2.869733, -0.5411383, 0.2264213, 1, 0.01960784, 0, 1,
-2.696207, 0.3721261, -2.16127, 1, 0.02352941, 0, 1,
-2.664461, 0.2449257, -4.118295, 1, 0.03137255, 0, 1,
-2.465274, 1.75444, -2.021758, 1, 0.03529412, 0, 1,
-2.425457, 0.3606579, -1.979012, 1, 0.04313726, 0, 1,
-2.348956, -0.6358908, -1.800656, 1, 0.04705882, 0, 1,
-2.346038, 0.07216752, -2.20546, 1, 0.05490196, 0, 1,
-2.280814, 0.85032, 0.2388445, 1, 0.05882353, 0, 1,
-2.266085, -0.3881421, -0.5436274, 1, 0.06666667, 0, 1,
-2.212723, 0.04576126, -0.5658659, 1, 0.07058824, 0, 1,
-2.199221, 0.1624144, -2.541492, 1, 0.07843138, 0, 1,
-2.161173, 0.5166116, -2.732099, 1, 0.08235294, 0, 1,
-2.133034, 0.3545156, -0.2541286, 1, 0.09019608, 0, 1,
-2.117388, -0.2636466, -2.932754, 1, 0.09411765, 0, 1,
-2.089463, 2.36091, -0.03185755, 1, 0.1019608, 0, 1,
-2.065681, 0.5173481, -0.7463234, 1, 0.1098039, 0, 1,
-2.048495, 0.7061383, -0.6585852, 1, 0.1137255, 0, 1,
-2.047417, 1.661075, 0.3517268, 1, 0.1215686, 0, 1,
-2.016064, -0.1451955, -2.941288, 1, 0.1254902, 0, 1,
-2.000356, 0.8626457, -1.530206, 1, 0.1333333, 0, 1,
-1.999256, -0.8173668, -1.793425, 1, 0.1372549, 0, 1,
-1.957156, -0.142844, -5.299563, 1, 0.145098, 0, 1,
-1.949642, -0.3871433, 0.1125192, 1, 0.1490196, 0, 1,
-1.947821, -0.2378408, -1.627787, 1, 0.1568628, 0, 1,
-1.93069, -0.9981174, -2.64322, 1, 0.1607843, 0, 1,
-1.899097, -0.4447034, -2.074638, 1, 0.1686275, 0, 1,
-1.897468, 0.04357322, -3.152628, 1, 0.172549, 0, 1,
-1.891545, -0.3023734, -1.722905, 1, 0.1803922, 0, 1,
-1.843876, -0.6656948, -2.058311, 1, 0.1843137, 0, 1,
-1.827676, 0.3849507, -1.5566, 1, 0.1921569, 0, 1,
-1.826021, -0.4030797, -1.608652, 1, 0.1960784, 0, 1,
-1.816, 0.6484103, -2.498707, 1, 0.2039216, 0, 1,
-1.80033, -0.497204, -2.469378, 1, 0.2117647, 0, 1,
-1.781119, -0.5891346, -0.3682836, 1, 0.2156863, 0, 1,
-1.774647, -1.763755, -2.100746, 1, 0.2235294, 0, 1,
-1.7544, 0.1105351, -0.9858473, 1, 0.227451, 0, 1,
-1.737399, -0.2254297, -0.6068085, 1, 0.2352941, 0, 1,
-1.732891, -1.615962, -2.352673, 1, 0.2392157, 0, 1,
-1.724367, -0.4544498, -2.892759, 1, 0.2470588, 0, 1,
-1.717016, -0.7183331, -1.361262, 1, 0.2509804, 0, 1,
-1.716255, -0.4622429, -2.027408, 1, 0.2588235, 0, 1,
-1.714296, 0.002293438, -1.771842, 1, 0.2627451, 0, 1,
-1.691833, -0.9880284, -1.353902, 1, 0.2705882, 0, 1,
-1.685994, 2.165134, -2.793102, 1, 0.2745098, 0, 1,
-1.682422, 1.801193, -0.5896873, 1, 0.282353, 0, 1,
-1.64594, -0.9537312, -1.905977, 1, 0.2862745, 0, 1,
-1.626465, 1.075613, -1.115909, 1, 0.2941177, 0, 1,
-1.600515, -1.588949, -1.653258, 1, 0.3019608, 0, 1,
-1.573865, 1.119701, -0.8987867, 1, 0.3058824, 0, 1,
-1.565364, 0.4865828, -1.175372, 1, 0.3137255, 0, 1,
-1.564996, -1.077637, -1.825194, 1, 0.3176471, 0, 1,
-1.562625, 1.480923, -0.2295558, 1, 0.3254902, 0, 1,
-1.551662, 0.1511403, -0.5837568, 1, 0.3294118, 0, 1,
-1.540854, -0.2974572, -2.125647, 1, 0.3372549, 0, 1,
-1.540161, -0.5224641, -4.158489, 1, 0.3411765, 0, 1,
-1.532682, -2.394627, -1.253161, 1, 0.3490196, 0, 1,
-1.529366, -1.508566, 0.2399056, 1, 0.3529412, 0, 1,
-1.519605, 0.6036108, -2.784467, 1, 0.3607843, 0, 1,
-1.510741, 0.003078927, -1.312792, 1, 0.3647059, 0, 1,
-1.508896, 1.223832, -0.4496146, 1, 0.372549, 0, 1,
-1.493901, -0.5786842, -1.696233, 1, 0.3764706, 0, 1,
-1.489465, -0.2862365, -1.196029, 1, 0.3843137, 0, 1,
-1.488889, -0.6310169, -1.693336, 1, 0.3882353, 0, 1,
-1.484248, 0.4415624, -1.344581, 1, 0.3960784, 0, 1,
-1.483435, -2.076483, -3.505746, 1, 0.4039216, 0, 1,
-1.469314, 1.443823, -0.725839, 1, 0.4078431, 0, 1,
-1.467856, 0.7368271, -0.8196984, 1, 0.4156863, 0, 1,
-1.46446, -1.679191, -2.534181, 1, 0.4196078, 0, 1,
-1.450585, -0.7036061, -2.963084, 1, 0.427451, 0, 1,
-1.447037, -0.22879, -1.176544, 1, 0.4313726, 0, 1,
-1.445349, -0.6216754, -3.204755, 1, 0.4392157, 0, 1,
-1.42854, 1.130847, -2.198697, 1, 0.4431373, 0, 1,
-1.427771, 0.7802181, -0.4874472, 1, 0.4509804, 0, 1,
-1.405668, -1.15449, -0.5001913, 1, 0.454902, 0, 1,
-1.404118, -1.24827, -1.114801, 1, 0.4627451, 0, 1,
-1.395514, 1.416351, -2.691124, 1, 0.4666667, 0, 1,
-1.395445, 0.6518797, -4.15148, 1, 0.4745098, 0, 1,
-1.391322, -0.6113344, -1.753381, 1, 0.4784314, 0, 1,
-1.389989, 2.067456, -1.304466, 1, 0.4862745, 0, 1,
-1.367891, 0.6143319, -2.717834, 1, 0.4901961, 0, 1,
-1.352358, -0.86221, -2.044968, 1, 0.4980392, 0, 1,
-1.339343, -0.02304859, -0.2579299, 1, 0.5058824, 0, 1,
-1.333747, -1.067565, -1.706775, 1, 0.509804, 0, 1,
-1.32576, -0.3231138, -1.936436, 1, 0.5176471, 0, 1,
-1.321839, 0.7100915, -0.8104345, 1, 0.5215687, 0, 1,
-1.31978, 0.6856579, -1.195508, 1, 0.5294118, 0, 1,
-1.309891, -0.1327271, -1.89649, 1, 0.5333334, 0, 1,
-1.30809, -0.7952216, -2.964518, 1, 0.5411765, 0, 1,
-1.283198, 0.1563715, -1.931404, 1, 0.5450981, 0, 1,
-1.27853, -0.2220374, -2.419845, 1, 0.5529412, 0, 1,
-1.276896, 0.01552895, -1.191523, 1, 0.5568628, 0, 1,
-1.275987, -0.3198821, -1.719896, 1, 0.5647059, 0, 1,
-1.274986, -1.507473, -1.998688, 1, 0.5686275, 0, 1,
-1.274511, -0.5263425, -1.266134, 1, 0.5764706, 0, 1,
-1.26766, -0.5289584, -1.740845, 1, 0.5803922, 0, 1,
-1.263002, 0.3841113, -1.609755, 1, 0.5882353, 0, 1,
-1.258494, 0.743251, -1.654426, 1, 0.5921569, 0, 1,
-1.258027, 1.192524, 0.4641678, 1, 0.6, 0, 1,
-1.249974, -0.7941242, -3.536823, 1, 0.6078432, 0, 1,
-1.247139, 0.3935769, -2.79201, 1, 0.6117647, 0, 1,
-1.246165, -0.9229425, -2.820994, 1, 0.6196079, 0, 1,
-1.244289, -1.311543, -0.8187295, 1, 0.6235294, 0, 1,
-1.2433, -1.411141, -2.793432, 1, 0.6313726, 0, 1,
-1.237273, 0.1991406, -1.342701, 1, 0.6352941, 0, 1,
-1.233591, 0.3670119, -1.341521, 1, 0.6431373, 0, 1,
-1.221238, -0.4297406, -2.962537, 1, 0.6470588, 0, 1,
-1.214422, 0.2105146, -0.9810078, 1, 0.654902, 0, 1,
-1.212903, 0.2158824, 0.7138853, 1, 0.6588235, 0, 1,
-1.206683, 0.1934665, -0.7022382, 1, 0.6666667, 0, 1,
-1.19962, -0.03009314, -2.10001, 1, 0.6705883, 0, 1,
-1.19636, -0.7765949, -1.188452, 1, 0.6784314, 0, 1,
-1.187335, -0.8810381, -3.335169, 1, 0.682353, 0, 1,
-1.176091, -1.547135, -3.457439, 1, 0.6901961, 0, 1,
-1.16763, -1.177783, -2.944158, 1, 0.6941177, 0, 1,
-1.167234, -0.9377573, -0.006166335, 1, 0.7019608, 0, 1,
-1.162205, 1.447621, -1.758609, 1, 0.7098039, 0, 1,
-1.160983, -0.9667117, -1.067569, 1, 0.7137255, 0, 1,
-1.154393, -1.19471, -3.643399, 1, 0.7215686, 0, 1,
-1.149389, -0.6638638, -0.5524662, 1, 0.7254902, 0, 1,
-1.144092, 0.8397003, -0.878861, 1, 0.7333333, 0, 1,
-1.139989, 0.2190716, -2.854227, 1, 0.7372549, 0, 1,
-1.12866, -0.9899468, -2.656659, 1, 0.7450981, 0, 1,
-1.122965, -1.651943, -3.486211, 1, 0.7490196, 0, 1,
-1.12035, -2.081352, -1.026366, 1, 0.7568628, 0, 1,
-1.113519, 0.2855883, -2.581126, 1, 0.7607843, 0, 1,
-1.110987, 1.530868, 0.3753169, 1, 0.7686275, 0, 1,
-1.109051, 0.3389562, -1.550618, 1, 0.772549, 0, 1,
-1.106121, 0.71171, -2.294245, 1, 0.7803922, 0, 1,
-1.103823, -0.55116, -1.578043, 1, 0.7843137, 0, 1,
-1.096571, 1.45258, -0.1321574, 1, 0.7921569, 0, 1,
-1.09432, 0.1898587, -1.156548, 1, 0.7960784, 0, 1,
-1.09022, 1.133575, -0.2600327, 1, 0.8039216, 0, 1,
-1.080144, -0.08118302, -2.812917, 1, 0.8117647, 0, 1,
-1.078681, -0.04317911, -2.530928, 1, 0.8156863, 0, 1,
-1.077018, -1.14566, -4.899845, 1, 0.8235294, 0, 1,
-1.069211, -1.119915, -2.511455, 1, 0.827451, 0, 1,
-1.068843, 0.4626004, -2.297246, 1, 0.8352941, 0, 1,
-1.062455, -0.5501268, -2.662401, 1, 0.8392157, 0, 1,
-1.061453, -0.1736414, -2.835138, 1, 0.8470588, 0, 1,
-1.060772, -0.1706615, -0.8476272, 1, 0.8509804, 0, 1,
-1.049142, 1.056151, -1.855158, 1, 0.8588235, 0, 1,
-1.043592, 1.026644, 0.6195693, 1, 0.8627451, 0, 1,
-1.031906, -0.5762286, -2.228645, 1, 0.8705882, 0, 1,
-1.031018, -1.074659, -2.417827, 1, 0.8745098, 0, 1,
-1.022098, -1.050041, -1.213082, 1, 0.8823529, 0, 1,
-1.015782, 0.2707961, -1.372445, 1, 0.8862745, 0, 1,
-1.013235, 0.393001, -1.063076, 1, 0.8941177, 0, 1,
-0.9920028, 1.339992, -0.5170314, 1, 0.8980392, 0, 1,
-0.9900209, 1.239048, -1.431501, 1, 0.9058824, 0, 1,
-0.9841981, 0.635222, -1.354359, 1, 0.9137255, 0, 1,
-0.9746876, 0.3492494, -2.032526, 1, 0.9176471, 0, 1,
-0.9742039, -0.9909743, -3.137028, 1, 0.9254902, 0, 1,
-0.9679127, 0.3934091, -2.427294, 1, 0.9294118, 0, 1,
-0.966621, 2.219807, 0.317079, 1, 0.9372549, 0, 1,
-0.9623591, -0.6423784, -2.982265, 1, 0.9411765, 0, 1,
-0.9599423, -1.597784, -1.532625, 1, 0.9490196, 0, 1,
-0.9576516, -0.4469307, -2.933487, 1, 0.9529412, 0, 1,
-0.9576337, -0.4848685, -3.028421, 1, 0.9607843, 0, 1,
-0.9497414, -1.793246, -2.366119, 1, 0.9647059, 0, 1,
-0.9493172, 0.2681098, -0.4520358, 1, 0.972549, 0, 1,
-0.9393075, -1.163461, -3.392721, 1, 0.9764706, 0, 1,
-0.9385583, -2.061134, -2.282443, 1, 0.9843137, 0, 1,
-0.9306231, 0.8030583, -0.5030269, 1, 0.9882353, 0, 1,
-0.9304699, -0.8725252, -0.3990347, 1, 0.9960784, 0, 1,
-0.9296758, -0.08033752, -0.7133641, 0.9960784, 1, 0, 1,
-0.9214861, -1.734296, -3.419915, 0.9921569, 1, 0, 1,
-0.9178337, 0.597289, -2.951797, 0.9843137, 1, 0, 1,
-0.9163395, -0.6700062, -2.933656, 0.9803922, 1, 0, 1,
-0.9130069, 0.02452962, -1.803146, 0.972549, 1, 0, 1,
-0.9120738, -0.227598, -1.848327, 0.9686275, 1, 0, 1,
-0.9101776, 0.7487643, -1.785408, 0.9607843, 1, 0, 1,
-0.8935723, -0.498821, -0.05834306, 0.9568627, 1, 0, 1,
-0.8892875, 1.050306, -0.2173823, 0.9490196, 1, 0, 1,
-0.8802374, 0.1272553, -2.751739, 0.945098, 1, 0, 1,
-0.8801857, -0.6499513, -2.819243, 0.9372549, 1, 0, 1,
-0.8739976, -0.2404502, -2.002187, 0.9333333, 1, 0, 1,
-0.8736469, -2.053272, -4.664852, 0.9254902, 1, 0, 1,
-0.8734704, -1.245761, -2.09624, 0.9215686, 1, 0, 1,
-0.8669116, 1.019559, -1.626168, 0.9137255, 1, 0, 1,
-0.8633595, 0.7314138, -1.675722, 0.9098039, 1, 0, 1,
-0.8537421, 0.6545327, -0.4755594, 0.9019608, 1, 0, 1,
-0.8469875, 0.3254342, -1.194846, 0.8941177, 1, 0, 1,
-0.8455349, -1.398457, -3.030982, 0.8901961, 1, 0, 1,
-0.8350077, 0.9525101, -0.9196202, 0.8823529, 1, 0, 1,
-0.8322614, -1.509076, -2.820971, 0.8784314, 1, 0, 1,
-0.8268296, 1.63428, -1.985783, 0.8705882, 1, 0, 1,
-0.817323, 0.9560189, 0.9777246, 0.8666667, 1, 0, 1,
-0.8171214, -0.6884238, -3.300124, 0.8588235, 1, 0, 1,
-0.8148892, -0.4260632, -0.6770718, 0.854902, 1, 0, 1,
-0.804349, 0.09013242, -2.346403, 0.8470588, 1, 0, 1,
-0.8021877, 1.322264, -1.527075, 0.8431373, 1, 0, 1,
-0.8003435, 0.9628541, -0.1505688, 0.8352941, 1, 0, 1,
-0.7834301, -0.6181076, -1.716315, 0.8313726, 1, 0, 1,
-0.779913, 0.5697554, -1.18242, 0.8235294, 1, 0, 1,
-0.7796544, -1.927899, -2.140597, 0.8196079, 1, 0, 1,
-0.7755035, 0.7099068, -0.01109803, 0.8117647, 1, 0, 1,
-0.7709598, 1.033557, 0.3912028, 0.8078431, 1, 0, 1,
-0.7576477, -0.2033459, -1.573112, 0.8, 1, 0, 1,
-0.7530677, 1.60918, -1.430406, 0.7921569, 1, 0, 1,
-0.7440396, 0.3738675, -0.8713938, 0.7882353, 1, 0, 1,
-0.7408359, 0.5346004, 0.3968381, 0.7803922, 1, 0, 1,
-0.7406249, 1.066109, -0.1363605, 0.7764706, 1, 0, 1,
-0.7392478, 0.7250062, 0.4421184, 0.7686275, 1, 0, 1,
-0.7366542, 0.266179, -1.738235, 0.7647059, 1, 0, 1,
-0.727752, -1.866569, -1.29177, 0.7568628, 1, 0, 1,
-0.7267697, -0.8430077, -1.55922, 0.7529412, 1, 0, 1,
-0.7224777, 1.638893, -1.149195, 0.7450981, 1, 0, 1,
-0.7202592, 0.2781776, -1.476729, 0.7411765, 1, 0, 1,
-0.7108586, 0.9293665, 0.508171, 0.7333333, 1, 0, 1,
-0.7097369, -0.8413339, -2.275056, 0.7294118, 1, 0, 1,
-0.7095878, 0.01060587, -1.310912, 0.7215686, 1, 0, 1,
-0.7095753, 1.113305, -1.710532, 0.7176471, 1, 0, 1,
-0.7045918, 0.8995383, -0.8514418, 0.7098039, 1, 0, 1,
-0.7022616, 0.2530689, 0.3715096, 0.7058824, 1, 0, 1,
-0.702151, 0.06541608, -0.6999832, 0.6980392, 1, 0, 1,
-0.6998604, 0.08121901, -1.561781, 0.6901961, 1, 0, 1,
-0.6995282, -0.4516783, -1.773497, 0.6862745, 1, 0, 1,
-0.6976512, -0.6051905, -3.08795, 0.6784314, 1, 0, 1,
-0.6931766, -0.183287, -1.36909, 0.6745098, 1, 0, 1,
-0.6907731, 0.3830389, -0.986882, 0.6666667, 1, 0, 1,
-0.6844406, 0.6103817, 1.410416, 0.6627451, 1, 0, 1,
-0.6821343, -0.8349398, -1.979556, 0.654902, 1, 0, 1,
-0.6772127, 0.8452917, -1.303639, 0.6509804, 1, 0, 1,
-0.6741164, 1.643182, -0.3589289, 0.6431373, 1, 0, 1,
-0.6728555, 1.026209, 0.8996309, 0.6392157, 1, 0, 1,
-0.6695646, -0.6674347, -2.859647, 0.6313726, 1, 0, 1,
-0.6694111, -0.5795336, -2.293509, 0.627451, 1, 0, 1,
-0.6683381, -1.604627, -1.972712, 0.6196079, 1, 0, 1,
-0.6672496, 0.1171693, 1.132829, 0.6156863, 1, 0, 1,
-0.6661623, -1.134095, -2.308868, 0.6078432, 1, 0, 1,
-0.6618978, 1.279395, -0.1212106, 0.6039216, 1, 0, 1,
-0.6615003, -3.134802, -2.015745, 0.5960785, 1, 0, 1,
-0.6584438, -0.3829505, -3.166559, 0.5882353, 1, 0, 1,
-0.6555091, 1.639151, 2.254172, 0.5843138, 1, 0, 1,
-0.6552977, -0.9152492, -2.132105, 0.5764706, 1, 0, 1,
-0.6546832, -1.104201, -2.936507, 0.572549, 1, 0, 1,
-0.6506872, -1.812746, -1.516706, 0.5647059, 1, 0, 1,
-0.6416465, -0.08693459, -2.251996, 0.5607843, 1, 0, 1,
-0.6390709, 0.9052612, -1.231649, 0.5529412, 1, 0, 1,
-0.6385153, -0.2421605, -2.274223, 0.5490196, 1, 0, 1,
-0.6370037, -1.490172, -2.204425, 0.5411765, 1, 0, 1,
-0.6356128, -0.5036246, -3.292673, 0.5372549, 1, 0, 1,
-0.6301895, -1.593013, -2.907684, 0.5294118, 1, 0, 1,
-0.6298072, -2.059133, -4.448008, 0.5254902, 1, 0, 1,
-0.6247447, -0.715533, -2.103343, 0.5176471, 1, 0, 1,
-0.6234642, 0.9912878, -0.4984325, 0.5137255, 1, 0, 1,
-0.6223366, -0.4678515, -1.927984, 0.5058824, 1, 0, 1,
-0.6183498, 0.9417666, 0.1926834, 0.5019608, 1, 0, 1,
-0.614655, 0.07163114, -0.402684, 0.4941176, 1, 0, 1,
-0.6145844, 0.2982577, -0.1517202, 0.4862745, 1, 0, 1,
-0.610242, -0.2670509, -1.547676, 0.4823529, 1, 0, 1,
-0.6057289, -1.416315, -3.41671, 0.4745098, 1, 0, 1,
-0.6028291, -1.791188, -1.841212, 0.4705882, 1, 0, 1,
-0.6021973, -0.7319491, -2.419948, 0.4627451, 1, 0, 1,
-0.5987282, -0.5921118, -2.230676, 0.4588235, 1, 0, 1,
-0.5907478, -1.731021, -1.89602, 0.4509804, 1, 0, 1,
-0.5903489, 1.132687, -0.1040732, 0.4470588, 1, 0, 1,
-0.5871683, 0.6547205, -2.939021, 0.4392157, 1, 0, 1,
-0.5798258, -0.2855174, -1.701271, 0.4352941, 1, 0, 1,
-0.5781929, -1.778607, -1.285289, 0.427451, 1, 0, 1,
-0.5627685, -1.805161, -2.271929, 0.4235294, 1, 0, 1,
-0.5602844, 0.2150445, -1.213398, 0.4156863, 1, 0, 1,
-0.5555019, 0.1996416, -0.08505162, 0.4117647, 1, 0, 1,
-0.5540729, 0.2222482, -1.089557, 0.4039216, 1, 0, 1,
-0.5534332, -0.002076912, -2.200871, 0.3960784, 1, 0, 1,
-0.552261, -0.5302779, -2.451301, 0.3921569, 1, 0, 1,
-0.5488452, 0.5510443, -2.088522, 0.3843137, 1, 0, 1,
-0.5287624, -1.497808, -1.419722, 0.3803922, 1, 0, 1,
-0.5281224, 0.6309323, -1.336883, 0.372549, 1, 0, 1,
-0.5280825, -1.133628, -3.54335, 0.3686275, 1, 0, 1,
-0.5278054, -2.193047, -1.461423, 0.3607843, 1, 0, 1,
-0.5239607, 0.5037813, -1.34609, 0.3568628, 1, 0, 1,
-0.5179903, 1.453523, 1.427802, 0.3490196, 1, 0, 1,
-0.5147614, -1.474572, -1.398969, 0.345098, 1, 0, 1,
-0.5139275, -1.282719, -2.986048, 0.3372549, 1, 0, 1,
-0.5136479, -1.811223, -4.335608, 0.3333333, 1, 0, 1,
-0.5128194, -0.5077466, -1.977472, 0.3254902, 1, 0, 1,
-0.5085206, -0.4355291, -1.079564, 0.3215686, 1, 0, 1,
-0.5056944, -0.04035271, -1.40837, 0.3137255, 1, 0, 1,
-0.5056109, 0.4116058, -1.306012, 0.3098039, 1, 0, 1,
-0.5011997, 0.2863871, -1.32278, 0.3019608, 1, 0, 1,
-0.5005019, 0.6609904, -1.143368, 0.2941177, 1, 0, 1,
-0.4938143, 1.157699, -0.8482715, 0.2901961, 1, 0, 1,
-0.4916929, 0.3987429, -1.110314, 0.282353, 1, 0, 1,
-0.4912371, -0.1695445, -2.950417, 0.2784314, 1, 0, 1,
-0.4878378, 0.3281312, 0.1341458, 0.2705882, 1, 0, 1,
-0.4848922, 0.5616296, -0.7992628, 0.2666667, 1, 0, 1,
-0.4826957, -1.723758, -2.609512, 0.2588235, 1, 0, 1,
-0.4781918, -0.306182, -1.273489, 0.254902, 1, 0, 1,
-0.4756445, 1.202496, -0.7754856, 0.2470588, 1, 0, 1,
-0.47383, -1.14771, -0.8820458, 0.2431373, 1, 0, 1,
-0.4731185, 0.8070578, -1.071224, 0.2352941, 1, 0, 1,
-0.4692429, -0.9344163, -4.184244, 0.2313726, 1, 0, 1,
-0.4690274, 0.5224006, -0.8517537, 0.2235294, 1, 0, 1,
-0.468887, -1.365161, -3.602614, 0.2196078, 1, 0, 1,
-0.4688304, 0.189039, -0.5233008, 0.2117647, 1, 0, 1,
-0.4672954, -0.2665846, -1.432585, 0.2078431, 1, 0, 1,
-0.4655044, -1.393199, -2.621985, 0.2, 1, 0, 1,
-0.4637118, -0.4303722, -1.559741, 0.1921569, 1, 0, 1,
-0.4634215, -1.778194, -2.614952, 0.1882353, 1, 0, 1,
-0.4626937, 0.7432045, -1.091977, 0.1803922, 1, 0, 1,
-0.4595701, -0.8510246, -3.306058, 0.1764706, 1, 0, 1,
-0.4538496, -1.451923, -2.085917, 0.1686275, 1, 0, 1,
-0.447607, 0.7519278, 0.7244574, 0.1647059, 1, 0, 1,
-0.445875, -0.8517908, -3.717181, 0.1568628, 1, 0, 1,
-0.4412079, -0.5589113, -3.511047, 0.1529412, 1, 0, 1,
-0.4381101, -0.2946625, -3.834094, 0.145098, 1, 0, 1,
-0.43544, -1.755629, -1.745588, 0.1411765, 1, 0, 1,
-0.4333229, -0.4954258, -2.422521, 0.1333333, 1, 0, 1,
-0.4298039, 1.297965, -0.1201092, 0.1294118, 1, 0, 1,
-0.4296769, -0.2071954, -2.463174, 0.1215686, 1, 0, 1,
-0.4263884, -0.1388204, -2.494017, 0.1176471, 1, 0, 1,
-0.4256372, 0.4150011, -1.434412, 0.1098039, 1, 0, 1,
-0.4253107, -0.4280765, -2.207261, 0.1058824, 1, 0, 1,
-0.4238771, 0.5352743, -0.4971251, 0.09803922, 1, 0, 1,
-0.4203127, -1.67201, -1.52944, 0.09019608, 1, 0, 1,
-0.4166509, 0.4443594, 0.6226031, 0.08627451, 1, 0, 1,
-0.4113721, -0.8019274, -2.699044, 0.07843138, 1, 0, 1,
-0.4027627, -0.8334202, -1.749167, 0.07450981, 1, 0, 1,
-0.3993488, 1.990471, -0.3268348, 0.06666667, 1, 0, 1,
-0.3923753, -2.503478, -3.333703, 0.0627451, 1, 0, 1,
-0.3846108, -2.148508, -3.971292, 0.05490196, 1, 0, 1,
-0.3821889, -0.5071816, -2.997461, 0.05098039, 1, 0, 1,
-0.3790556, 0.378815, -0.2535638, 0.04313726, 1, 0, 1,
-0.3788566, 1.137859, -0.3029788, 0.03921569, 1, 0, 1,
-0.3760615, -0.6830937, -1.815919, 0.03137255, 1, 0, 1,
-0.3737543, 1.03123, -2.203521, 0.02745098, 1, 0, 1,
-0.3680961, 0.5046289, -0.9928687, 0.01960784, 1, 0, 1,
-0.3650066, 0.897127, 1.45064, 0.01568628, 1, 0, 1,
-0.3625138, 0.1190733, -1.547973, 0.007843138, 1, 0, 1,
-0.3598752, -0.01049401, -2.641973, 0.003921569, 1, 0, 1,
-0.3555875, 0.5545518, -2.233453, 0, 1, 0.003921569, 1,
-0.3535801, 0.9073448, -1.329714, 0, 1, 0.01176471, 1,
-0.352693, 0.4143517, -0.7765335, 0, 1, 0.01568628, 1,
-0.3514728, 0.9348212, -0.4160403, 0, 1, 0.02352941, 1,
-0.3467237, -0.02397019, -2.480049, 0, 1, 0.02745098, 1,
-0.3459569, 1.430308, 1.579605, 0, 1, 0.03529412, 1,
-0.3401022, 1.880432, -0.09675808, 0, 1, 0.03921569, 1,
-0.338355, -0.2622015, -2.54363, 0, 1, 0.04705882, 1,
-0.3343405, -1.379599, -2.570395, 0, 1, 0.05098039, 1,
-0.3308475, -0.7645073, -1.532459, 0, 1, 0.05882353, 1,
-0.3284746, -1.629372, -2.663337, 0, 1, 0.0627451, 1,
-0.328383, 1.319116, 0.1489799, 0, 1, 0.07058824, 1,
-0.3261328, -0.6791604, -3.97509, 0, 1, 0.07450981, 1,
-0.3256679, 0.9384446, -1.088045, 0, 1, 0.08235294, 1,
-0.3231209, 0.2308178, -3.299933, 0, 1, 0.08627451, 1,
-0.3230857, 0.1126889, -1.198505, 0, 1, 0.09411765, 1,
-0.3227786, -0.7295076, -1.878587, 0, 1, 0.1019608, 1,
-0.3181248, 1.813868, 0.2765689, 0, 1, 0.1058824, 1,
-0.3156684, -0.02604989, 0.3696716, 0, 1, 0.1137255, 1,
-0.3137974, -0.04125486, 0.02239833, 0, 1, 0.1176471, 1,
-0.3131765, 0.9290754, -0.6958408, 0, 1, 0.1254902, 1,
-0.3123346, -0.03830337, -3.2477, 0, 1, 0.1294118, 1,
-0.307418, 2.186552, -0.6257477, 0, 1, 0.1372549, 1,
-0.3073002, 0.46532, -0.1479159, 0, 1, 0.1411765, 1,
-0.3018859, -0.0831387, -0.6743593, 0, 1, 0.1490196, 1,
-0.2991818, -0.01815339, -1.677345, 0, 1, 0.1529412, 1,
-0.2904379, 1.254086, 0.1615152, 0, 1, 0.1607843, 1,
-0.289634, 0.254074, -0.2696796, 0, 1, 0.1647059, 1,
-0.2896179, 0.17939, -0.9343414, 0, 1, 0.172549, 1,
-0.2891491, -0.273992, -1.647787, 0, 1, 0.1764706, 1,
-0.2871222, -0.1169256, -1.324849, 0, 1, 0.1843137, 1,
-0.2810421, 0.1420128, -0.603047, 0, 1, 0.1882353, 1,
-0.2727025, -1.495875, -3.956988, 0, 1, 0.1960784, 1,
-0.2707942, -0.4831081, -3.447781, 0, 1, 0.2039216, 1,
-0.2679743, 0.1462859, -0.5979256, 0, 1, 0.2078431, 1,
-0.2618617, 1.041502, 0.626344, 0, 1, 0.2156863, 1,
-0.2585948, 0.7643866, -1.116493, 0, 1, 0.2196078, 1,
-0.2540646, -0.3252547, -1.982348, 0, 1, 0.227451, 1,
-0.2515852, -0.8560392, -1.318631, 0, 1, 0.2313726, 1,
-0.2508604, -0.9118952, -1.714639, 0, 1, 0.2392157, 1,
-0.2501363, -0.5996553, -3.028732, 0, 1, 0.2431373, 1,
-0.2436508, -0.1729011, -0.05173879, 0, 1, 0.2509804, 1,
-0.2430453, 0.2564553, 0.313879, 0, 1, 0.254902, 1,
-0.2416823, 1.060223, -1.12296, 0, 1, 0.2627451, 1,
-0.2413017, -0.1157225, -4.077738, 0, 1, 0.2666667, 1,
-0.2400809, -0.8032856, -2.212997, 0, 1, 0.2745098, 1,
-0.2391584, 0.02371493, -0.5260023, 0, 1, 0.2784314, 1,
-0.2364244, -2.512845, -4.005389, 0, 1, 0.2862745, 1,
-0.2358525, 1.585336, -1.06201, 0, 1, 0.2901961, 1,
-0.2329149, -0.03910547, -2.868397, 0, 1, 0.2980392, 1,
-0.2328307, 0.666721, 0.3756509, 0, 1, 0.3058824, 1,
-0.2288262, -0.7357752, -3.108374, 0, 1, 0.3098039, 1,
-0.2258283, 0.5774583, -1.506413, 0, 1, 0.3176471, 1,
-0.2245094, 2.249374, -0.4303119, 0, 1, 0.3215686, 1,
-0.2236303, -0.8958533, -2.500126, 0, 1, 0.3294118, 1,
-0.2223808, 1.015316, -0.8478454, 0, 1, 0.3333333, 1,
-0.2092182, -3.13331, -4.282938, 0, 1, 0.3411765, 1,
-0.2063185, 0.05011564, -1.298097, 0, 1, 0.345098, 1,
-0.2035605, 0.4224021, -0.2847109, 0, 1, 0.3529412, 1,
-0.2021589, -0.5160537, -2.133295, 0, 1, 0.3568628, 1,
-0.2003774, -0.4816565, -2.810391, 0, 1, 0.3647059, 1,
-0.1981715, 0.5196684, 0.4667314, 0, 1, 0.3686275, 1,
-0.190546, 1.362046, 1.310902, 0, 1, 0.3764706, 1,
-0.1877646, -1.415388, -3.658544, 0, 1, 0.3803922, 1,
-0.1872185, -1.36046, -2.243778, 0, 1, 0.3882353, 1,
-0.1869833, 0.9293743, -1.686014, 0, 1, 0.3921569, 1,
-0.1859027, -0.4907216, -1.92305, 0, 1, 0.4, 1,
-0.1838458, 1.461834, -0.009068672, 0, 1, 0.4078431, 1,
-0.183465, 2.253506, -1.345942, 0, 1, 0.4117647, 1,
-0.1834476, 0.7821409, 0.1258187, 0, 1, 0.4196078, 1,
-0.1785885, 0.2544334, 0.1446241, 0, 1, 0.4235294, 1,
-0.175842, 0.7305838, -0.4249152, 0, 1, 0.4313726, 1,
-0.1752059, 2.866501, -1.60905, 0, 1, 0.4352941, 1,
-0.1734149, -2.121087, -3.903929, 0, 1, 0.4431373, 1,
-0.1719369, -1.093546, -2.447647, 0, 1, 0.4470588, 1,
-0.1717083, 0.5217744, -0.1153872, 0, 1, 0.454902, 1,
-0.1667597, -0.6883416, -2.659169, 0, 1, 0.4588235, 1,
-0.1657087, 1.405481, -1.628074, 0, 1, 0.4666667, 1,
-0.1521008, -0.582838, -3.947064, 0, 1, 0.4705882, 1,
-0.1490059, 0.5058066, -0.01527771, 0, 1, 0.4784314, 1,
-0.1416084, -0.04989502, -0.6607699, 0, 1, 0.4823529, 1,
-0.1391147, -0.3562884, -1.93163, 0, 1, 0.4901961, 1,
-0.1385725, 0.3550711, 0.8539392, 0, 1, 0.4941176, 1,
-0.1363493, 1.843424, 1.832803, 0, 1, 0.5019608, 1,
-0.1361279, -1.275023, -3.526155, 0, 1, 0.509804, 1,
-0.1348101, 0.9394303, -1.229791, 0, 1, 0.5137255, 1,
-0.1328141, -0.6057498, -1.608907, 0, 1, 0.5215687, 1,
-0.130767, 1.758531, -0.0486083, 0, 1, 0.5254902, 1,
-0.13037, 1.252471, 0.8103111, 0, 1, 0.5333334, 1,
-0.1295962, 2.421953, -0.5665997, 0, 1, 0.5372549, 1,
-0.1211723, -0.8593558, -2.640414, 0, 1, 0.5450981, 1,
-0.1198424, 0.2630123, -3.134665, 0, 1, 0.5490196, 1,
-0.1194102, -0.09724703, -3.457474, 0, 1, 0.5568628, 1,
-0.1140645, -1.789623, -4.079259, 0, 1, 0.5607843, 1,
-0.1109748, 1.779506, -0.571574, 0, 1, 0.5686275, 1,
-0.1055955, -1.801223, -2.979624, 0, 1, 0.572549, 1,
-0.1052705, 1.781096, -0.2020918, 0, 1, 0.5803922, 1,
-0.09603217, 0.2177368, -0.9935953, 0, 1, 0.5843138, 1,
-0.08914506, -0.473524, -4.408634, 0, 1, 0.5921569, 1,
-0.08730473, 1.143054, 0.5218453, 0, 1, 0.5960785, 1,
-0.08574932, -1.652657, -2.342276, 0, 1, 0.6039216, 1,
-0.08258955, 1.130499, -0.1300852, 0, 1, 0.6117647, 1,
-0.07935866, 0.7439687, 1.492435, 0, 1, 0.6156863, 1,
-0.07754042, -0.3036549, -2.797055, 0, 1, 0.6235294, 1,
-0.07529429, -0.9151264, -5.057461, 0, 1, 0.627451, 1,
-0.07399657, 0.6095505, -0.348545, 0, 1, 0.6352941, 1,
-0.07050897, -0.2117628, -1.664316, 0, 1, 0.6392157, 1,
-0.06918314, -0.5569173, -2.822886, 0, 1, 0.6470588, 1,
-0.0688518, -1.517707, -3.34954, 0, 1, 0.6509804, 1,
-0.06462438, -0.3447736, -1.129547, 0, 1, 0.6588235, 1,
-0.05833509, 0.2799966, 1.269565, 0, 1, 0.6627451, 1,
-0.0559522, 2.709969, -0.3445953, 0, 1, 0.6705883, 1,
-0.05489434, 0.8122611, 1.358508, 0, 1, 0.6745098, 1,
-0.05408031, -0.01339366, -1.043113, 0, 1, 0.682353, 1,
-0.05001205, 1.316007, -1.80704, 0, 1, 0.6862745, 1,
-0.04783173, 0.7481572, 1.988899, 0, 1, 0.6941177, 1,
-0.04662899, 1.863765, -2.656298, 0, 1, 0.7019608, 1,
-0.04595983, 1.049652, 0.6969776, 0, 1, 0.7058824, 1,
-0.03966099, 0.9962202, 0.2988245, 0, 1, 0.7137255, 1,
-0.03896785, -2.214083, -3.480816, 0, 1, 0.7176471, 1,
-0.0361545, 0.9536704, -0.09873447, 0, 1, 0.7254902, 1,
-0.0284897, 0.5579836, -0.317674, 0, 1, 0.7294118, 1,
-0.02246384, -1.119524, -3.436204, 0, 1, 0.7372549, 1,
-0.01856431, 2.391819, 0.3793392, 0, 1, 0.7411765, 1,
-0.01800064, 1.290124, -0.5557528, 0, 1, 0.7490196, 1,
-0.0138171, 0.8163712, -0.7109186, 0, 1, 0.7529412, 1,
-0.01333221, -0.5160835, -1.686816, 0, 1, 0.7607843, 1,
-0.01047174, 0.519817, 0.4665889, 0, 1, 0.7647059, 1,
-0.008231991, 0.371222, -0.05484226, 0, 1, 0.772549, 1,
-0.003654581, 0.4558307, -0.7490329, 0, 1, 0.7764706, 1,
-0.002454027, -0.1997793, -2.319056, 0, 1, 0.7843137, 1,
0.001359627, 1.043893, 0.7313371, 0, 1, 0.7882353, 1,
0.004001579, 0.3335992, -1.220515, 0, 1, 0.7960784, 1,
0.004183815, -1.626148, 3.585504, 0, 1, 0.8039216, 1,
0.004921889, -0.4157425, 3.572879, 0, 1, 0.8078431, 1,
0.006501691, 0.302428, -0.4148342, 0, 1, 0.8156863, 1,
0.006719254, -1.063795, 1.140212, 0, 1, 0.8196079, 1,
0.009203653, 1.209598, -0.17502, 0, 1, 0.827451, 1,
0.009251121, 1.149605, 0.3312962, 0, 1, 0.8313726, 1,
0.009325552, 0.6971881, 1.355529, 0, 1, 0.8392157, 1,
0.01313971, -0.4935902, 4.076782, 0, 1, 0.8431373, 1,
0.01396903, 0.5170895, 0.9097615, 0, 1, 0.8509804, 1,
0.01422231, 0.6300094, 1.191222, 0, 1, 0.854902, 1,
0.01426447, -0.8412871, 3.697495, 0, 1, 0.8627451, 1,
0.01597804, -2.711104, 2.240571, 0, 1, 0.8666667, 1,
0.01602609, -0.8389769, 1.786797, 0, 1, 0.8745098, 1,
0.01665918, 2.362018, -0.5204673, 0, 1, 0.8784314, 1,
0.01741639, -2.663657, 4.731103, 0, 1, 0.8862745, 1,
0.01756868, 1.052191, 0.08953619, 0, 1, 0.8901961, 1,
0.01778681, 0.5414081, 0.009172128, 0, 1, 0.8980392, 1,
0.0197976, 0.4142206, -0.2306284, 0, 1, 0.9058824, 1,
0.02436109, 1.183132, -1.36901, 0, 1, 0.9098039, 1,
0.0257964, -0.945424, 1.993922, 0, 1, 0.9176471, 1,
0.02789647, -1.051719, 3.799437, 0, 1, 0.9215686, 1,
0.02881348, -1.082626, 3.408053, 0, 1, 0.9294118, 1,
0.03766742, -0.1834749, 3.676057, 0, 1, 0.9333333, 1,
0.03836423, 0.357863, 0.2321399, 0, 1, 0.9411765, 1,
0.04124457, -2.365794, 3.538397, 0, 1, 0.945098, 1,
0.0452707, -0.1025454, 2.554017, 0, 1, 0.9529412, 1,
0.04667248, -1.386264, 2.545382, 0, 1, 0.9568627, 1,
0.04861115, 1.147249, 0.06001485, 0, 1, 0.9647059, 1,
0.04993032, -1.654972, 3.209619, 0, 1, 0.9686275, 1,
0.05272257, -0.4741145, 1.668539, 0, 1, 0.9764706, 1,
0.05294593, 0.3032246, -1.247233, 0, 1, 0.9803922, 1,
0.05813653, -1.005847, 2.528007, 0, 1, 0.9882353, 1,
0.06883752, 0.5072308, 0.817202, 0, 1, 0.9921569, 1,
0.07046901, 0.4437151, -0.2137604, 0, 1, 1, 1,
0.07486042, -1.46192, 1.091787, 0, 0.9921569, 1, 1,
0.07907758, 0.2411694, 0.06652694, 0, 0.9882353, 1, 1,
0.0795631, 0.1208912, -1.19944, 0, 0.9803922, 1, 1,
0.08088848, -2.867229, 2.746247, 0, 0.9764706, 1, 1,
0.08197875, -1.804915, 4.507528, 0, 0.9686275, 1, 1,
0.0822487, -1.167341, 4.769459, 0, 0.9647059, 1, 1,
0.0840495, 0.213186, -0.3588751, 0, 0.9568627, 1, 1,
0.08470168, 0.4700088, -0.3490324, 0, 0.9529412, 1, 1,
0.08762135, 0.3718362, -0.7226559, 0, 0.945098, 1, 1,
0.08959512, -1.33531, 3.537483, 0, 0.9411765, 1, 1,
0.09995533, -0.7587252, 4.436585, 0, 0.9333333, 1, 1,
0.1001433, -0.03882988, 1.728416, 0, 0.9294118, 1, 1,
0.10661, -0.36509, 3.556334, 0, 0.9215686, 1, 1,
0.1073321, -1.557586, 2.308933, 0, 0.9176471, 1, 1,
0.1074885, -0.8606155, 3.862161, 0, 0.9098039, 1, 1,
0.1137209, -0.04370243, 1.839437, 0, 0.9058824, 1, 1,
0.1144456, 0.7184868, -1.19643, 0, 0.8980392, 1, 1,
0.1147863, -0.5511002, 4.260095, 0, 0.8901961, 1, 1,
0.1181463, 1.440841, -1.235778, 0, 0.8862745, 1, 1,
0.1185434, 0.9513121, -0.7981396, 0, 0.8784314, 1, 1,
0.1193735, -1.521158, 2.549675, 0, 0.8745098, 1, 1,
0.1213762, 0.2320025, 2.297204, 0, 0.8666667, 1, 1,
0.1237015, -0.6391172, 3.748684, 0, 0.8627451, 1, 1,
0.1247113, 0.7093962, -0.4757963, 0, 0.854902, 1, 1,
0.1261817, 0.3689557, 2.153439, 0, 0.8509804, 1, 1,
0.1262226, 0.7232366, -1.853589, 0, 0.8431373, 1, 1,
0.1282032, -0.6166892, 2.175936, 0, 0.8392157, 1, 1,
0.1291747, -1.417539, 3.679074, 0, 0.8313726, 1, 1,
0.1301196, -0.6440446, 1.737084, 0, 0.827451, 1, 1,
0.1334217, 0.02241663, 1.052813, 0, 0.8196079, 1, 1,
0.1409192, 0.3221493, 0.4165098, 0, 0.8156863, 1, 1,
0.146899, -2.105015, 4.366582, 0, 0.8078431, 1, 1,
0.1482838, 1.378951, -0.08738883, 0, 0.8039216, 1, 1,
0.1511228, 1.487333, 1.554371, 0, 0.7960784, 1, 1,
0.154035, 0.1395271, 1.188219, 0, 0.7882353, 1, 1,
0.1546488, -1.081381, 2.696094, 0, 0.7843137, 1, 1,
0.1583284, -2.453653, 3.408854, 0, 0.7764706, 1, 1,
0.1591363, 1.33529, 2.474149, 0, 0.772549, 1, 1,
0.164525, 0.1524325, -0.3998384, 0, 0.7647059, 1, 1,
0.1651672, -1.243541, 2.557594, 0, 0.7607843, 1, 1,
0.1660746, -0.7662597, 2.641268, 0, 0.7529412, 1, 1,
0.1689419, 0.2400625, -0.6408855, 0, 0.7490196, 1, 1,
0.1691929, -0.08109542, 2.785852, 0, 0.7411765, 1, 1,
0.1697434, 0.9553394, -0.1412371, 0, 0.7372549, 1, 1,
0.1700406, -0.1045917, 1.035319, 0, 0.7294118, 1, 1,
0.1760166, -0.6859007, 1.883614, 0, 0.7254902, 1, 1,
0.176509, 1.257817, -0.8964142, 0, 0.7176471, 1, 1,
0.1786391, -0.5884616, 2.705147, 0, 0.7137255, 1, 1,
0.1823427, -1.327669, 1.797446, 0, 0.7058824, 1, 1,
0.1827864, 1.248563, 0.163828, 0, 0.6980392, 1, 1,
0.1855419, 1.205876, -1.220999, 0, 0.6941177, 1, 1,
0.1890405, 0.7177695, -1.662354, 0, 0.6862745, 1, 1,
0.1929928, -0.6899672, 2.954118, 0, 0.682353, 1, 1,
0.1930755, -0.4796367, 2.078915, 0, 0.6745098, 1, 1,
0.1975574, -0.4488871, 3.152407, 0, 0.6705883, 1, 1,
0.1980617, -0.4328829, 2.354796, 0, 0.6627451, 1, 1,
0.198531, 0.2277863, 0.3750884, 0, 0.6588235, 1, 1,
0.1992645, -1.011334, 3.618354, 0, 0.6509804, 1, 1,
0.2048209, 1.126653, -1.125537, 0, 0.6470588, 1, 1,
0.2096606, 0.3929344, 0.9837772, 0, 0.6392157, 1, 1,
0.2129643, -1.66193, 1.765935, 0, 0.6352941, 1, 1,
0.2140312, 0.4039421, 2.628891, 0, 0.627451, 1, 1,
0.2151713, 1.942352, 0.9795979, 0, 0.6235294, 1, 1,
0.2158653, -0.9225211, 3.145692, 0, 0.6156863, 1, 1,
0.222546, -0.3383532, 1.963179, 0, 0.6117647, 1, 1,
0.2250441, 0.8115065, 2.032585, 0, 0.6039216, 1, 1,
0.2284902, -0.3306274, 3.567333, 0, 0.5960785, 1, 1,
0.2292664, -0.4640012, 2.786693, 0, 0.5921569, 1, 1,
0.2310266, 0.925129, 0.3911117, 0, 0.5843138, 1, 1,
0.2347355, -1.148471, 1.777565, 0, 0.5803922, 1, 1,
0.2359595, -1.036225, 4.36098, 0, 0.572549, 1, 1,
0.241798, -0.1116509, 1.590762, 0, 0.5686275, 1, 1,
0.2456103, 0.9713988, -0.5635188, 0, 0.5607843, 1, 1,
0.2457253, -0.08132678, 1.278234, 0, 0.5568628, 1, 1,
0.2461359, -1.722695, 3.409597, 0, 0.5490196, 1, 1,
0.2503192, 0.682499, -0.3278857, 0, 0.5450981, 1, 1,
0.2519485, -0.308424, 2.109142, 0, 0.5372549, 1, 1,
0.2554589, 0.8038428, -0.7448351, 0, 0.5333334, 1, 1,
0.2618616, -0.1291656, 3.504839, 0, 0.5254902, 1, 1,
0.262265, 1.20781, 0.6200443, 0, 0.5215687, 1, 1,
0.2656567, 0.9428391, -0.3724416, 0, 0.5137255, 1, 1,
0.2661919, -0.8004895, 2.520414, 0, 0.509804, 1, 1,
0.2700367, 1.768515, -0.1218563, 0, 0.5019608, 1, 1,
0.2755657, 0.7979729, 2.291514, 0, 0.4941176, 1, 1,
0.2768534, 0.5801338, -0.0009573537, 0, 0.4901961, 1, 1,
0.2768553, -0.2330539, 1.752392, 0, 0.4823529, 1, 1,
0.2786664, -0.4908336, 3.057252, 0, 0.4784314, 1, 1,
0.2803924, -0.8050304, 2.830211, 0, 0.4705882, 1, 1,
0.2815636, -0.1794611, 1.887049, 0, 0.4666667, 1, 1,
0.2838463, -1.067054, 3.626709, 0, 0.4588235, 1, 1,
0.2843785, 0.6371641, 0.4599277, 0, 0.454902, 1, 1,
0.2883257, -0.5640168, 2.661569, 0, 0.4470588, 1, 1,
0.2909763, 0.2703029, 2.084844, 0, 0.4431373, 1, 1,
0.2943819, 0.9666201, 1.108194, 0, 0.4352941, 1, 1,
0.295171, -1.142963, 3.542354, 0, 0.4313726, 1, 1,
0.2983648, 0.4507972, 0.006765208, 0, 0.4235294, 1, 1,
0.2984321, 1.5405, 0.07358837, 0, 0.4196078, 1, 1,
0.2989728, -0.1165912, 0.88694, 0, 0.4117647, 1, 1,
0.3005394, -2.410563, 2.911141, 0, 0.4078431, 1, 1,
0.3017203, -0.4317629, 3.745509, 0, 0.4, 1, 1,
0.3017735, -0.9026762, 1.57035, 0, 0.3921569, 1, 1,
0.302305, -2.411088, 3.120776, 0, 0.3882353, 1, 1,
0.3027758, -0.7794709, 4.089766, 0, 0.3803922, 1, 1,
0.3067305, 0.622526, -0.4091953, 0, 0.3764706, 1, 1,
0.3089231, -0.3711077, 0.7675825, 0, 0.3686275, 1, 1,
0.3099614, 0.411304, 1.095572, 0, 0.3647059, 1, 1,
0.3100875, 2.468774, 2.390724, 0, 0.3568628, 1, 1,
0.3118342, -1.906418, 2.560275, 0, 0.3529412, 1, 1,
0.3140433, -0.7472936, 2.405001, 0, 0.345098, 1, 1,
0.3147055, 1.412678, 0.7033865, 0, 0.3411765, 1, 1,
0.3167078, 0.04182372, 0.08212438, 0, 0.3333333, 1, 1,
0.3207023, -1.069971, 4.908411, 0, 0.3294118, 1, 1,
0.331003, 0.683951, -0.1433506, 0, 0.3215686, 1, 1,
0.331874, -0.00545611, 1.817466, 0, 0.3176471, 1, 1,
0.3319135, 0.328858, 0.09097145, 0, 0.3098039, 1, 1,
0.338107, 0.5457855, 0.5101057, 0, 0.3058824, 1, 1,
0.3419805, 1.001648, 0.5960929, 0, 0.2980392, 1, 1,
0.3472969, 2.8376, -2.336, 0, 0.2901961, 1, 1,
0.3475096, -0.9728801, 1.576644, 0, 0.2862745, 1, 1,
0.3498774, -0.9431838, 4.392191, 0, 0.2784314, 1, 1,
0.3526962, 0.678115, 0.6253897, 0, 0.2745098, 1, 1,
0.3583687, -0.4079771, 0.8226234, 0, 0.2666667, 1, 1,
0.3592244, -0.1200117, -1.125295, 0, 0.2627451, 1, 1,
0.359839, 0.270443, 2.734783, 0, 0.254902, 1, 1,
0.3602014, 1.033962, 0.4581304, 0, 0.2509804, 1, 1,
0.3608942, -0.002245327, 2.023567, 0, 0.2431373, 1, 1,
0.3626149, -0.7399605, 2.446939, 0, 0.2392157, 1, 1,
0.363153, 1.267998, 0.8017239, 0, 0.2313726, 1, 1,
0.3648174, -2.454657, 1.585302, 0, 0.227451, 1, 1,
0.3716723, 0.3497616, 0.4783598, 0, 0.2196078, 1, 1,
0.3809412, 0.5282615, 2.534254, 0, 0.2156863, 1, 1,
0.382663, -0.8502797, 0.9332426, 0, 0.2078431, 1, 1,
0.3867348, 0.4436392, 0.4680723, 0, 0.2039216, 1, 1,
0.3891805, -1.218923, 2.851676, 0, 0.1960784, 1, 1,
0.3908184, -2.422442, 4.230103, 0, 0.1882353, 1, 1,
0.3954833, -0.5039694, 2.381519, 0, 0.1843137, 1, 1,
0.3962541, -1.657156, 2.402275, 0, 0.1764706, 1, 1,
0.3974736, 0.6194413, 1.315716, 0, 0.172549, 1, 1,
0.3986695, -0.5049686, -0.1228109, 0, 0.1647059, 1, 1,
0.4014894, 0.4645554, 0.5126858, 0, 0.1607843, 1, 1,
0.4022533, 0.5693535, 0.7221217, 0, 0.1529412, 1, 1,
0.4109874, 0.3785263, 1.883692, 0, 0.1490196, 1, 1,
0.414465, -1.526554, 4.296045, 0, 0.1411765, 1, 1,
0.4171326, -1.325323, 3.188743, 0, 0.1372549, 1, 1,
0.4195273, 0.5571991, 1.24393, 0, 0.1294118, 1, 1,
0.4215086, 0.890718, -0.9067828, 0, 0.1254902, 1, 1,
0.4222242, 1.713482, -0.1197809, 0, 0.1176471, 1, 1,
0.4227141, 0.5208542, 1.892151, 0, 0.1137255, 1, 1,
0.4243965, -0.2312602, 3.105003, 0, 0.1058824, 1, 1,
0.4257674, 1.889646, -0.3470639, 0, 0.09803922, 1, 1,
0.4287696, -0.3664734, 1.428363, 0, 0.09411765, 1, 1,
0.434782, 1.12077, 1.439493, 0, 0.08627451, 1, 1,
0.4365903, -1.001919, 0.5324315, 0, 0.08235294, 1, 1,
0.4404219, -0.7365354, 2.957604, 0, 0.07450981, 1, 1,
0.4413219, -0.329647, 1.611371, 0, 0.07058824, 1, 1,
0.4450481, -0.4768023, 1.55062, 0, 0.0627451, 1, 1,
0.4500816, -0.4969217, 0.9500093, 0, 0.05882353, 1, 1,
0.4560022, -0.04648398, 2.914018, 0, 0.05098039, 1, 1,
0.4560755, 1.070411, 1.890793, 0, 0.04705882, 1, 1,
0.4574687, 0.1099411, 0.06026675, 0, 0.03921569, 1, 1,
0.4575488, 0.6706787, -0.7775156, 0, 0.03529412, 1, 1,
0.4673741, -0.1893062, 3.937848, 0, 0.02745098, 1, 1,
0.4678514, 0.3759901, 2.664929, 0, 0.02352941, 1, 1,
0.4704646, -0.8293543, 1.462533, 0, 0.01568628, 1, 1,
0.4733129, -0.6502155, 3.517257, 0, 0.01176471, 1, 1,
0.4743125, 0.6809486, 0.4728079, 0, 0.003921569, 1, 1,
0.4765847, -0.3969197, 3.026273, 0.003921569, 0, 1, 1,
0.4782329, 2.328737, 0.7717259, 0.007843138, 0, 1, 1,
0.4804861, -1.715883, 2.22946, 0.01568628, 0, 1, 1,
0.4814393, -0.3275514, 0.9442719, 0.01960784, 0, 1, 1,
0.4828005, -0.5531431, 2.680507, 0.02745098, 0, 1, 1,
0.4829995, -1.163537, 1.865749, 0.03137255, 0, 1, 1,
0.4841384, -1.138803, 1.754547, 0.03921569, 0, 1, 1,
0.4884053, 2.025774, -0.4162176, 0.04313726, 0, 1, 1,
0.4926917, -1.78879, 0.6942047, 0.05098039, 0, 1, 1,
0.493594, -1.017893, 3.751049, 0.05490196, 0, 1, 1,
0.4960525, -0.5604987, 1.41917, 0.0627451, 0, 1, 1,
0.4984154, -1.591508, 2.471244, 0.06666667, 0, 1, 1,
0.5016437, -0.8751976, 3.46359, 0.07450981, 0, 1, 1,
0.5023816, -1.393848, 3.337905, 0.07843138, 0, 1, 1,
0.5065125, -0.04019593, 1.446378, 0.08627451, 0, 1, 1,
0.5078218, -0.2889985, 2.681319, 0.09019608, 0, 1, 1,
0.5092967, 0.8399022, 1.237319, 0.09803922, 0, 1, 1,
0.5101439, -0.4959209, 1.360902, 0.1058824, 0, 1, 1,
0.5168005, -0.1363302, 1.14784, 0.1098039, 0, 1, 1,
0.5197102, -0.072646, 2.024715, 0.1176471, 0, 1, 1,
0.5234717, 2.812835, -1.455359, 0.1215686, 0, 1, 1,
0.5309978, -0.2862034, 1.861727, 0.1294118, 0, 1, 1,
0.5315464, 0.3405261, 1.969813, 0.1333333, 0, 1, 1,
0.538428, -1.38693, 3.206086, 0.1411765, 0, 1, 1,
0.5388581, 0.3675975, 1.002634, 0.145098, 0, 1, 1,
0.5396225, -1.582737, 3.419211, 0.1529412, 0, 1, 1,
0.5399739, 0.1227816, 0.6250235, 0.1568628, 0, 1, 1,
0.5413439, 1.055391, -0.01499983, 0.1647059, 0, 1, 1,
0.5442343, 1.078841, -2.453664, 0.1686275, 0, 1, 1,
0.5442538, 0.9269719, 2.279815, 0.1764706, 0, 1, 1,
0.5461667, -1.067822, 2.926925, 0.1803922, 0, 1, 1,
0.5476486, -0.008688514, 2.950524, 0.1882353, 0, 1, 1,
0.5479624, 0.9322234, -1.352392, 0.1921569, 0, 1, 1,
0.548277, -1.425668, 2.604568, 0.2, 0, 1, 1,
0.5499539, -0.4897052, 2.343573, 0.2078431, 0, 1, 1,
0.5524083, -0.327432, 1.899932, 0.2117647, 0, 1, 1,
0.5529212, 0.1601965, 0.5032929, 0.2196078, 0, 1, 1,
0.556407, 0.2584693, 1.400329, 0.2235294, 0, 1, 1,
0.5608751, 2.071257, 0.07559695, 0.2313726, 0, 1, 1,
0.5627148, 0.05334401, 0.3967457, 0.2352941, 0, 1, 1,
0.5627851, -0.02457224, 3.371603, 0.2431373, 0, 1, 1,
0.5631079, 0.8373681, 1.87678, 0.2470588, 0, 1, 1,
0.5640883, 1.143394, -1.412592, 0.254902, 0, 1, 1,
0.5643693, -0.3466074, 0.9236867, 0.2588235, 0, 1, 1,
0.5706638, 1.225781, -0.1817217, 0.2666667, 0, 1, 1,
0.5750128, 0.4475179, 0.2478098, 0.2705882, 0, 1, 1,
0.5754374, -0.4158193, 1.847703, 0.2784314, 0, 1, 1,
0.5808254, 0.664057, 1.550781, 0.282353, 0, 1, 1,
0.5816323, -0.8703409, 0.6932734, 0.2901961, 0, 1, 1,
0.5833573, -2.004549, 2.214607, 0.2941177, 0, 1, 1,
0.5842909, 0.2669904, 2.657912, 0.3019608, 0, 1, 1,
0.5846824, 1.539526, 0.05749831, 0.3098039, 0, 1, 1,
0.5862805, 1.842723, -0.6156998, 0.3137255, 0, 1, 1,
0.5876676, 0.849873, -0.5375381, 0.3215686, 0, 1, 1,
0.5884901, -0.5359152, 2.281971, 0.3254902, 0, 1, 1,
0.5893568, -0.3836511, 1.958765, 0.3333333, 0, 1, 1,
0.58958, -0.4165073, 2.457636, 0.3372549, 0, 1, 1,
0.5896737, 0.8636211, 1.237123, 0.345098, 0, 1, 1,
0.592722, -0.08577629, 1.513695, 0.3490196, 0, 1, 1,
0.5929174, -0.08623256, 1.850003, 0.3568628, 0, 1, 1,
0.5934283, 0.5138773, -0.1897936, 0.3607843, 0, 1, 1,
0.5943418, -0.5605294, 3.062325, 0.3686275, 0, 1, 1,
0.5986232, -1.22891, 0.9172885, 0.372549, 0, 1, 1,
0.6002179, 1.166363, 0.7493464, 0.3803922, 0, 1, 1,
0.6061116, -0.7357725, 3.417893, 0.3843137, 0, 1, 1,
0.6063256, -0.7263017, 3.140832, 0.3921569, 0, 1, 1,
0.6130907, -0.617017, 1.454374, 0.3960784, 0, 1, 1,
0.6136349, -0.7693914, 2.73067, 0.4039216, 0, 1, 1,
0.6185719, -0.4365872, 3.493423, 0.4117647, 0, 1, 1,
0.6187901, -0.4514742, 1.845446, 0.4156863, 0, 1, 1,
0.6225882, -0.3076656, 1.944267, 0.4235294, 0, 1, 1,
0.6270461, -1.042943, 3.336179, 0.427451, 0, 1, 1,
0.6276093, -0.07082231, 2.115478, 0.4352941, 0, 1, 1,
0.6290586, -0.5170404, 2.202393, 0.4392157, 0, 1, 1,
0.6328433, 0.5829099, -0.02360606, 0.4470588, 0, 1, 1,
0.6329014, -1.576494, 2.813985, 0.4509804, 0, 1, 1,
0.635608, 0.1645508, 2.420071, 0.4588235, 0, 1, 1,
0.6362285, 0.491714, 1.445387, 0.4627451, 0, 1, 1,
0.6511708, -0.7374406, 2.229264, 0.4705882, 0, 1, 1,
0.6556051, -1.260073, 3.945494, 0.4745098, 0, 1, 1,
0.6568279, -0.2654616, 1.822987, 0.4823529, 0, 1, 1,
0.6606925, -0.6021948, 2.601492, 0.4862745, 0, 1, 1,
0.66144, -0.8709421, 1.699297, 0.4941176, 0, 1, 1,
0.6629926, 0.1064799, 1.832965, 0.5019608, 0, 1, 1,
0.6664825, -0.03615721, 0.8933786, 0.5058824, 0, 1, 1,
0.6680071, -0.182541, 2.158227, 0.5137255, 0, 1, 1,
0.668529, 1.554348, 0.6459907, 0.5176471, 0, 1, 1,
0.672516, 0.3512139, 1.419738, 0.5254902, 0, 1, 1,
0.6726988, 1.096255, 0.3401301, 0.5294118, 0, 1, 1,
0.6734625, 1.246353, -0.8733433, 0.5372549, 0, 1, 1,
0.6745833, 1.836594, 1.497636, 0.5411765, 0, 1, 1,
0.6770281, 0.1985621, 2.086669, 0.5490196, 0, 1, 1,
0.6799755, 0.2855799, 1.518018, 0.5529412, 0, 1, 1,
0.6858615, 0.7394632, -1.876802, 0.5607843, 0, 1, 1,
0.699513, -0.10562, 1.178444, 0.5647059, 0, 1, 1,
0.7030142, 0.7020121, 0.635471, 0.572549, 0, 1, 1,
0.7054466, 0.120091, 2.295909, 0.5764706, 0, 1, 1,
0.7084917, -0.04774219, 1.027556, 0.5843138, 0, 1, 1,
0.7187664, 0.3140163, 2.120985, 0.5882353, 0, 1, 1,
0.7196145, -1.432478, 1.66076, 0.5960785, 0, 1, 1,
0.7226346, -0.7151384, 1.585559, 0.6039216, 0, 1, 1,
0.7290953, 1.764919, -1.110587, 0.6078432, 0, 1, 1,
0.7294374, 0.1612042, 2.830612, 0.6156863, 0, 1, 1,
0.7295125, 0.5820237, 1.767738, 0.6196079, 0, 1, 1,
0.7298144, 0.8161008, 0.4245015, 0.627451, 0, 1, 1,
0.7299349, 1.568027, 0.942231, 0.6313726, 0, 1, 1,
0.7314283, -0.1633884, 1.824164, 0.6392157, 0, 1, 1,
0.7410998, -0.2393571, 2.451673, 0.6431373, 0, 1, 1,
0.7425472, 0.696678, 2.666025, 0.6509804, 0, 1, 1,
0.7436076, 1.437146, 2.254817, 0.654902, 0, 1, 1,
0.7489003, -0.2639681, 2.040243, 0.6627451, 0, 1, 1,
0.751784, 0.2323805, 2.466836, 0.6666667, 0, 1, 1,
0.7520264, 1.238285, 1.805702, 0.6745098, 0, 1, 1,
0.7529418, 0.7246527, 3.246446, 0.6784314, 0, 1, 1,
0.7614049, 2.478277, 0.4443614, 0.6862745, 0, 1, 1,
0.7680055, 1.21191, -1.483923, 0.6901961, 0, 1, 1,
0.7759712, -0.4883724, 1.991254, 0.6980392, 0, 1, 1,
0.7850007, 0.02900052, 1.116457, 0.7058824, 0, 1, 1,
0.78653, 0.6543965, -0.3582906, 0.7098039, 0, 1, 1,
0.7874094, -0.3397162, 3.49928, 0.7176471, 0, 1, 1,
0.7875531, -0.007205868, 2.495044, 0.7215686, 0, 1, 1,
0.7930162, 0.8405403, 1.899461, 0.7294118, 0, 1, 1,
0.8035174, -0.5682727, 2.571967, 0.7333333, 0, 1, 1,
0.8045677, -0.6517985, 1.427969, 0.7411765, 0, 1, 1,
0.8092442, 2.127463, -1.062653, 0.7450981, 0, 1, 1,
0.8125398, -0.03547401, 0.9214672, 0.7529412, 0, 1, 1,
0.8137339, -1.275921, 3.870909, 0.7568628, 0, 1, 1,
0.8151541, -0.6569998, 3.345399, 0.7647059, 0, 1, 1,
0.8228099, 2.634892, 0.6324431, 0.7686275, 0, 1, 1,
0.8273086, -0.9482325, 1.995682, 0.7764706, 0, 1, 1,
0.8289511, -1.548371, 0.3301166, 0.7803922, 0, 1, 1,
0.8297397, 1.074612, 1.885461, 0.7882353, 0, 1, 1,
0.830154, 1.878587, 0.4108689, 0.7921569, 0, 1, 1,
0.8330849, -1.414963, 3.811655, 0.8, 0, 1, 1,
0.8376223, -0.8562334, 2.941515, 0.8078431, 0, 1, 1,
0.8395041, 2.645391, 0.07961791, 0.8117647, 0, 1, 1,
0.8495575, 1.476895, -0.8228309, 0.8196079, 0, 1, 1,
0.850199, -0.7256664, 1.580286, 0.8235294, 0, 1, 1,
0.850233, 2.381916, 0.1956901, 0.8313726, 0, 1, 1,
0.851604, -1.000703, 1.93149, 0.8352941, 0, 1, 1,
0.8519719, -0.5458022, 2.684003, 0.8431373, 0, 1, 1,
0.8616946, -0.6040655, 2.670048, 0.8470588, 0, 1, 1,
0.8689152, -0.5838719, 2.71243, 0.854902, 0, 1, 1,
0.8745582, -0.9306057, 4.019501, 0.8588235, 0, 1, 1,
0.8777249, -1.064873, 2.833639, 0.8666667, 0, 1, 1,
0.8871349, 0.3551981, 0.7873686, 0.8705882, 0, 1, 1,
0.8922907, -0.08292534, 0.6975969, 0.8784314, 0, 1, 1,
0.8923774, -0.6740627, 2.009029, 0.8823529, 0, 1, 1,
0.8927284, -0.6567687, 3.238626, 0.8901961, 0, 1, 1,
0.9128391, 0.4543157, 2.26942, 0.8941177, 0, 1, 1,
0.915747, 0.5094676, 0.826566, 0.9019608, 0, 1, 1,
0.9159727, 0.06570801, 0.8417535, 0.9098039, 0, 1, 1,
0.918896, 0.5976084, 0.8636448, 0.9137255, 0, 1, 1,
0.9304059, -1.627848, 1.434063, 0.9215686, 0, 1, 1,
0.9378664, -0.2531464, 2.814975, 0.9254902, 0, 1, 1,
0.9419729, 0.8612024, 0.005731777, 0.9333333, 0, 1, 1,
0.9429218, 1.372032, -0.1210484, 0.9372549, 0, 1, 1,
0.9441963, -0.4474766, 1.112382, 0.945098, 0, 1, 1,
0.9546052, 0.6224633, 0.7255008, 0.9490196, 0, 1, 1,
0.9598061, 1.063355, -0.4293459, 0.9568627, 0, 1, 1,
0.9623789, -1.841068, 1.575958, 0.9607843, 0, 1, 1,
0.9722047, 0.3570093, 1.633561, 0.9686275, 0, 1, 1,
0.9725713, -0.0938544, 1.678585, 0.972549, 0, 1, 1,
0.9745305, 2.186592, 0.9826375, 0.9803922, 0, 1, 1,
0.9938257, -0.7306397, 1.552209, 0.9843137, 0, 1, 1,
1.003855, -2.035131, 2.363345, 0.9921569, 0, 1, 1,
1.007913, 0.1064816, 1.998211, 0.9960784, 0, 1, 1,
1.008536, 0.01325429, 0.4666862, 1, 0, 0.9960784, 1,
1.02569, 0.9373307, 0.9749261, 1, 0, 0.9882353, 1,
1.028438, 0.5591311, 0.1168977, 1, 0, 0.9843137, 1,
1.03682, -0.1280198, 2.37571, 1, 0, 0.9764706, 1,
1.037026, 1.396768, -0.2990003, 1, 0, 0.972549, 1,
1.040291, 1.04496, 2.551573, 1, 0, 0.9647059, 1,
1.04638, 0.6080389, 0.3426487, 1, 0, 0.9607843, 1,
1.053798, 0.6254819, -0.404034, 1, 0, 0.9529412, 1,
1.056201, 2.225082, -0.248591, 1, 0, 0.9490196, 1,
1.056599, 0.6472584, 0.9387905, 1, 0, 0.9411765, 1,
1.060261, -0.001590823, 2.710985, 1, 0, 0.9372549, 1,
1.060573, 1.13999, 1.114907, 1, 0, 0.9294118, 1,
1.065728, 0.4573476, -0.7787377, 1, 0, 0.9254902, 1,
1.074939, -0.7370434, 3.558126, 1, 0, 0.9176471, 1,
1.076572, -1.044374, 2.453513, 1, 0, 0.9137255, 1,
1.076613, -0.6153321, 2.226981, 1, 0, 0.9058824, 1,
1.085806, -1.238112, 1.938886, 1, 0, 0.9019608, 1,
1.093533, 1.527809, 0.185256, 1, 0, 0.8941177, 1,
1.094656, -0.4840552, 3.39064, 1, 0, 0.8862745, 1,
1.094832, 1.450237, -0.8203071, 1, 0, 0.8823529, 1,
1.106135, -0.8709921, 2.0921, 1, 0, 0.8745098, 1,
1.109688, -0.1592852, 1.8651, 1, 0, 0.8705882, 1,
1.114375, 0.5291427, 1.201057, 1, 0, 0.8627451, 1,
1.115537, -1.110739, 0.96732, 1, 0, 0.8588235, 1,
1.117326, 0.343614, 1.104876, 1, 0, 0.8509804, 1,
1.118515, 1.816829, 1.053845, 1, 0, 0.8470588, 1,
1.120925, 0.2205618, 1.900687, 1, 0, 0.8392157, 1,
1.122808, 0.07609868, 2.917945, 1, 0, 0.8352941, 1,
1.126828, 0.3232758, 2.451021, 1, 0, 0.827451, 1,
1.131288, 0.4113225, -0.2735222, 1, 0, 0.8235294, 1,
1.133598, 0.3512126, 1.59836, 1, 0, 0.8156863, 1,
1.151955, 0.7663158, 0.2417647, 1, 0, 0.8117647, 1,
1.153523, 0.1697145, 3.37755, 1, 0, 0.8039216, 1,
1.158276, 0.9063721, 2.080489, 1, 0, 0.7960784, 1,
1.160952, -1.063608, 1.730851, 1, 0, 0.7921569, 1,
1.169205, -0.817645, 2.214409, 1, 0, 0.7843137, 1,
1.173894, -0.9683937, 1.898306, 1, 0, 0.7803922, 1,
1.176188, -0.2069052, 1.093123, 1, 0, 0.772549, 1,
1.176533, -1.15242, 0.8752621, 1, 0, 0.7686275, 1,
1.180454, 1.363355, 2.637485, 1, 0, 0.7607843, 1,
1.185766, 0.6319866, 1.281745, 1, 0, 0.7568628, 1,
1.186586, -0.357984, 4.068659, 1, 0, 0.7490196, 1,
1.191377, -0.8482245, 3.226324, 1, 0, 0.7450981, 1,
1.192832, -1.037989, 2.305527, 1, 0, 0.7372549, 1,
1.200825, -0.91088, 3.830454, 1, 0, 0.7333333, 1,
1.201493, 0.459443, 1.333629, 1, 0, 0.7254902, 1,
1.203053, -0.362971, 0.6242997, 1, 0, 0.7215686, 1,
1.20456, -0.9482791, 3.267391, 1, 0, 0.7137255, 1,
1.215366, -1.346062, 3.328479, 1, 0, 0.7098039, 1,
1.221922, 0.9513184, 1.358605, 1, 0, 0.7019608, 1,
1.228455, 0.1887524, 1.166522, 1, 0, 0.6941177, 1,
1.233233, -1.030937, 1.677203, 1, 0, 0.6901961, 1,
1.238218, -1.633166, 1.094055, 1, 0, 0.682353, 1,
1.23869, 0.6588913, 0.6384529, 1, 0, 0.6784314, 1,
1.241046, -1.312518, 2.396274, 1, 0, 0.6705883, 1,
1.245398, 0.08974637, 0.8350426, 1, 0, 0.6666667, 1,
1.256306, -0.7128725, 0.6943787, 1, 0, 0.6588235, 1,
1.263058, 0.7782124, 1.904399, 1, 0, 0.654902, 1,
1.284379, 1.498599, 1.353431, 1, 0, 0.6470588, 1,
1.291604, 0.168852, 0.5478604, 1, 0, 0.6431373, 1,
1.294127, 0.06305456, 1.343715, 1, 0, 0.6352941, 1,
1.300661, -2.223902, 2.781497, 1, 0, 0.6313726, 1,
1.305364, 1.234489, 1.058187, 1, 0, 0.6235294, 1,
1.312224, -0.2197152, 0.240388, 1, 0, 0.6196079, 1,
1.31674, -0.7476294, 0.9814555, 1, 0, 0.6117647, 1,
1.321746, -3.145167, 2.83191, 1, 0, 0.6078432, 1,
1.324558, 0.6282378, 0.8050107, 1, 0, 0.6, 1,
1.326654, -0.7677585, 1.658783, 1, 0, 0.5921569, 1,
1.34236, 1.545323, 1.180699, 1, 0, 0.5882353, 1,
1.344201, -0.6023949, 4.002205, 1, 0, 0.5803922, 1,
1.349534, 0.9678018, 0.5028229, 1, 0, 0.5764706, 1,
1.354193, 0.5779007, 1.678898, 1, 0, 0.5686275, 1,
1.357619, -0.1891654, 2.356761, 1, 0, 0.5647059, 1,
1.358755, 0.6800503, 2.471565, 1, 0, 0.5568628, 1,
1.368569, 0.6109912, 2.306296, 1, 0, 0.5529412, 1,
1.378099, -1.333378, 2.028321, 1, 0, 0.5450981, 1,
1.381799, 0.9323446, 0.7976828, 1, 0, 0.5411765, 1,
1.384534, -1.052337, -0.9255669, 1, 0, 0.5333334, 1,
1.385109, -0.3641132, 1.18664, 1, 0, 0.5294118, 1,
1.387115, 1.177963, 2.381455, 1, 0, 0.5215687, 1,
1.388649, 0.8243493, 1.946274, 1, 0, 0.5176471, 1,
1.397152, -0.1867017, 1.648488, 1, 0, 0.509804, 1,
1.397305, -0.88162, 2.26873, 1, 0, 0.5058824, 1,
1.412017, 0.05393173, 0.6091592, 1, 0, 0.4980392, 1,
1.419971, -1.27124, 3.880164, 1, 0, 0.4901961, 1,
1.436751, 0.9878377, 0.3133766, 1, 0, 0.4862745, 1,
1.438345, -0.2807603, 0.8447735, 1, 0, 0.4784314, 1,
1.444237, -0.3514894, 1.895601, 1, 0, 0.4745098, 1,
1.459043, 2.324023, 0.4004292, 1, 0, 0.4666667, 1,
1.459082, -0.9047692, 3.237091, 1, 0, 0.4627451, 1,
1.459792, 1.278723, 0.4499658, 1, 0, 0.454902, 1,
1.474106, 0.04914035, -1.179528, 1, 0, 0.4509804, 1,
1.487859, -2.456089, 1.678126, 1, 0, 0.4431373, 1,
1.497036, -1.510122, 1.981489, 1, 0, 0.4392157, 1,
1.497405, -0.00953568, 2.203851, 1, 0, 0.4313726, 1,
1.502137, 0.1618271, 0.7165575, 1, 0, 0.427451, 1,
1.503924, -0.6417892, 3.453691, 1, 0, 0.4196078, 1,
1.512016, 0.5664626, 1.951162, 1, 0, 0.4156863, 1,
1.513127, -0.458843, 3.548229, 1, 0, 0.4078431, 1,
1.513963, -0.2102654, 2.248924, 1, 0, 0.4039216, 1,
1.518621, -1.719703, 3.99776, 1, 0, 0.3960784, 1,
1.523497, 0.744651, 1.728874, 1, 0, 0.3882353, 1,
1.539717, -2.003706, 2.32098, 1, 0, 0.3843137, 1,
1.554753, 1.087677, -0.09071667, 1, 0, 0.3764706, 1,
1.555574, 0.6690202, 2.503789, 1, 0, 0.372549, 1,
1.55691, 1.047117, -0.1961546, 1, 0, 0.3647059, 1,
1.561453, -0.8491937, 0.3442189, 1, 0, 0.3607843, 1,
1.562428, -1.385885, 2.85235, 1, 0, 0.3529412, 1,
1.5627, -0.2344469, -0.8371618, 1, 0, 0.3490196, 1,
1.56396, 0.7786306, -1.422419, 1, 0, 0.3411765, 1,
1.583244, -0.2562424, 1.839288, 1, 0, 0.3372549, 1,
1.598749, 0.3219995, 0.8194451, 1, 0, 0.3294118, 1,
1.617969, -0.02224363, 1.665921, 1, 0, 0.3254902, 1,
1.623317, -0.865806, 1.988716, 1, 0, 0.3176471, 1,
1.627838, -2.270101, 1.209342, 1, 0, 0.3137255, 1,
1.631025, -1.007986, 2.253091, 1, 0, 0.3058824, 1,
1.666121, 0.3056184, 2.447824, 1, 0, 0.2980392, 1,
1.669188, -0.4766679, 1.621539, 1, 0, 0.2941177, 1,
1.674254, 0.9112727, 3.787778, 1, 0, 0.2862745, 1,
1.683701, 1.245889, 1.239122, 1, 0, 0.282353, 1,
1.689317, -0.8230448, 4.729921, 1, 0, 0.2745098, 1,
1.691634, -0.2509412, 1.644098, 1, 0, 0.2705882, 1,
1.701138, -0.3394094, 2.526798, 1, 0, 0.2627451, 1,
1.722455, -0.5350928, 2.199078, 1, 0, 0.2588235, 1,
1.736832, 0.5154582, 1.298589, 1, 0, 0.2509804, 1,
1.743904, -0.4494999, 0.7747608, 1, 0, 0.2470588, 1,
1.749602, 0.3346259, 3.301905, 1, 0, 0.2392157, 1,
1.761049, 1.253878, 0.6013363, 1, 0, 0.2352941, 1,
1.770915, -0.5925692, 2.322072, 1, 0, 0.227451, 1,
1.770918, -0.9695004, 1.585297, 1, 0, 0.2235294, 1,
1.780871, -0.7890247, 1.370156, 1, 0, 0.2156863, 1,
1.809341, 1.160928, -0.636833, 1, 0, 0.2117647, 1,
1.813107, -0.8286489, 3.188105, 1, 0, 0.2039216, 1,
1.814175, 0.006178959, 1.879301, 1, 0, 0.1960784, 1,
1.817887, 0.808909, 0.9945381, 1, 0, 0.1921569, 1,
1.821662, -1.247502, 1.26919, 1, 0, 0.1843137, 1,
1.825218, 1.749276, 1.519265, 1, 0, 0.1803922, 1,
1.84792, -0.07487198, 1.174292, 1, 0, 0.172549, 1,
1.878949, -0.163903, 0.4759575, 1, 0, 0.1686275, 1,
1.953285, -0.4213199, 2.117011, 1, 0, 0.1607843, 1,
2.033071, -0.07373592, 0.6504185, 1, 0, 0.1568628, 1,
2.041929, -0.6444651, 1.845017, 1, 0, 0.1490196, 1,
2.062409, -0.1834159, 0.7203799, 1, 0, 0.145098, 1,
2.094773, 0.6713975, 2.367439, 1, 0, 0.1372549, 1,
2.098317, -0.5255708, -0.07982416, 1, 0, 0.1333333, 1,
2.104288, -2.344655, 2.230578, 1, 0, 0.1254902, 1,
2.11655, -0.9420137, 1.571334, 1, 0, 0.1215686, 1,
2.122248, -1.608231, 1.510535, 1, 0, 0.1137255, 1,
2.131746, -0.107509, 2.257231, 1, 0, 0.1098039, 1,
2.150248, 0.8393465, -0.07115957, 1, 0, 0.1019608, 1,
2.162271, 1.358846, 1.339127, 1, 0, 0.09411765, 1,
2.193742, 1.919368, 0.3787549, 1, 0, 0.09019608, 1,
2.270775, -1.290329, 1.213226, 1, 0, 0.08235294, 1,
2.276168, 0.3127427, 1.550282, 1, 0, 0.07843138, 1,
2.334332, 1.113783, -0.6593068, 1, 0, 0.07058824, 1,
2.346006, 0.340238, 0.4920252, 1, 0, 0.06666667, 1,
2.395579, -0.690529, 2.180542, 1, 0, 0.05882353, 1,
2.424402, 0.08839843, 0.665715, 1, 0, 0.05490196, 1,
2.462687, -0.5163416, 1.508314, 1, 0, 0.04705882, 1,
2.488767, 0.659278, 3.687611, 1, 0, 0.04313726, 1,
2.562618, -1.032128, 1.52293, 1, 0, 0.03529412, 1,
2.571045, -0.481758, 1.511076, 1, 0, 0.03137255, 1,
2.580615, -1.991594, 2.167867, 1, 0, 0.02352941, 1,
2.61607, -0.5766776, 1.767142, 1, 0, 0.01960784, 1,
2.844751, 0.07548594, 1.485352, 1, 0, 0.01176471, 1,
3.013829, -0.1114823, 1.431166, 1, 0, 0.007843138, 1
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
-0.1934165, -4.164145, -7.029815, 0, -0.5, 0.5, 0.5,
-0.1934165, -4.164145, -7.029815, 1, -0.5, 0.5, 0.5,
-0.1934165, -4.164145, -7.029815, 1, 1.5, 0.5, 0.5,
-0.1934165, -4.164145, -7.029815, 0, 1.5, 0.5, 0.5
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
-4.487917, -0.1393332, -7.029815, 0, -0.5, 0.5, 0.5,
-4.487917, -0.1393332, -7.029815, 1, -0.5, 0.5, 0.5,
-4.487917, -0.1393332, -7.029815, 1, 1.5, 0.5, 0.5,
-4.487917, -0.1393332, -7.029815, 0, 1.5, 0.5, 0.5
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
-4.487917, -4.164145, -0.1955764, 0, -0.5, 0.5, 0.5,
-4.487917, -4.164145, -0.1955764, 1, -0.5, 0.5, 0.5,
-4.487917, -4.164145, -0.1955764, 1, 1.5, 0.5, 0.5,
-4.487917, -4.164145, -0.1955764, 0, 1.5, 0.5, 0.5
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
-3, -3.235342, -5.452683,
3, -3.235342, -5.452683,
-3, -3.235342, -5.452683,
-3, -3.390143, -5.715539,
-2, -3.235342, -5.452683,
-2, -3.390143, -5.715539,
-1, -3.235342, -5.452683,
-1, -3.390143, -5.715539,
0, -3.235342, -5.452683,
0, -3.390143, -5.715539,
1, -3.235342, -5.452683,
1, -3.390143, -5.715539,
2, -3.235342, -5.452683,
2, -3.390143, -5.715539,
3, -3.235342, -5.452683,
3, -3.390143, -5.715539
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
-3, -3.699744, -6.241249, 0, -0.5, 0.5, 0.5,
-3, -3.699744, -6.241249, 1, -0.5, 0.5, 0.5,
-3, -3.699744, -6.241249, 1, 1.5, 0.5, 0.5,
-3, -3.699744, -6.241249, 0, 1.5, 0.5, 0.5,
-2, -3.699744, -6.241249, 0, -0.5, 0.5, 0.5,
-2, -3.699744, -6.241249, 1, -0.5, 0.5, 0.5,
-2, -3.699744, -6.241249, 1, 1.5, 0.5, 0.5,
-2, -3.699744, -6.241249, 0, 1.5, 0.5, 0.5,
-1, -3.699744, -6.241249, 0, -0.5, 0.5, 0.5,
-1, -3.699744, -6.241249, 1, -0.5, 0.5, 0.5,
-1, -3.699744, -6.241249, 1, 1.5, 0.5, 0.5,
-1, -3.699744, -6.241249, 0, 1.5, 0.5, 0.5,
0, -3.699744, -6.241249, 0, -0.5, 0.5, 0.5,
0, -3.699744, -6.241249, 1, -0.5, 0.5, 0.5,
0, -3.699744, -6.241249, 1, 1.5, 0.5, 0.5,
0, -3.699744, -6.241249, 0, 1.5, 0.5, 0.5,
1, -3.699744, -6.241249, 0, -0.5, 0.5, 0.5,
1, -3.699744, -6.241249, 1, -0.5, 0.5, 0.5,
1, -3.699744, -6.241249, 1, 1.5, 0.5, 0.5,
1, -3.699744, -6.241249, 0, 1.5, 0.5, 0.5,
2, -3.699744, -6.241249, 0, -0.5, 0.5, 0.5,
2, -3.699744, -6.241249, 1, -0.5, 0.5, 0.5,
2, -3.699744, -6.241249, 1, 1.5, 0.5, 0.5,
2, -3.699744, -6.241249, 0, 1.5, 0.5, 0.5,
3, -3.699744, -6.241249, 0, -0.5, 0.5, 0.5,
3, -3.699744, -6.241249, 1, -0.5, 0.5, 0.5,
3, -3.699744, -6.241249, 1, 1.5, 0.5, 0.5,
3, -3.699744, -6.241249, 0, 1.5, 0.5, 0.5
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
-3.496879, -3, -5.452683,
-3.496879, 2, -5.452683,
-3.496879, -3, -5.452683,
-3.662052, -3, -5.715539,
-3.496879, -2, -5.452683,
-3.662052, -2, -5.715539,
-3.496879, -1, -5.452683,
-3.662052, -1, -5.715539,
-3.496879, 0, -5.452683,
-3.662052, 0, -5.715539,
-3.496879, 1, -5.452683,
-3.662052, 1, -5.715539,
-3.496879, 2, -5.452683,
-3.662052, 2, -5.715539
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
-3.992398, -3, -6.241249, 0, -0.5, 0.5, 0.5,
-3.992398, -3, -6.241249, 1, -0.5, 0.5, 0.5,
-3.992398, -3, -6.241249, 1, 1.5, 0.5, 0.5,
-3.992398, -3, -6.241249, 0, 1.5, 0.5, 0.5,
-3.992398, -2, -6.241249, 0, -0.5, 0.5, 0.5,
-3.992398, -2, -6.241249, 1, -0.5, 0.5, 0.5,
-3.992398, -2, -6.241249, 1, 1.5, 0.5, 0.5,
-3.992398, -2, -6.241249, 0, 1.5, 0.5, 0.5,
-3.992398, -1, -6.241249, 0, -0.5, 0.5, 0.5,
-3.992398, -1, -6.241249, 1, -0.5, 0.5, 0.5,
-3.992398, -1, -6.241249, 1, 1.5, 0.5, 0.5,
-3.992398, -1, -6.241249, 0, 1.5, 0.5, 0.5,
-3.992398, 0, -6.241249, 0, -0.5, 0.5, 0.5,
-3.992398, 0, -6.241249, 1, -0.5, 0.5, 0.5,
-3.992398, 0, -6.241249, 1, 1.5, 0.5, 0.5,
-3.992398, 0, -6.241249, 0, 1.5, 0.5, 0.5,
-3.992398, 1, -6.241249, 0, -0.5, 0.5, 0.5,
-3.992398, 1, -6.241249, 1, -0.5, 0.5, 0.5,
-3.992398, 1, -6.241249, 1, 1.5, 0.5, 0.5,
-3.992398, 1, -6.241249, 0, 1.5, 0.5, 0.5,
-3.992398, 2, -6.241249, 0, -0.5, 0.5, 0.5,
-3.992398, 2, -6.241249, 1, -0.5, 0.5, 0.5,
-3.992398, 2, -6.241249, 1, 1.5, 0.5, 0.5,
-3.992398, 2, -6.241249, 0, 1.5, 0.5, 0.5
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
-3.496879, -3.235342, -4,
-3.496879, -3.235342, 4,
-3.496879, -3.235342, -4,
-3.662052, -3.390143, -4,
-3.496879, -3.235342, -2,
-3.662052, -3.390143, -2,
-3.496879, -3.235342, 0,
-3.662052, -3.390143, 0,
-3.496879, -3.235342, 2,
-3.662052, -3.390143, 2,
-3.496879, -3.235342, 4,
-3.662052, -3.390143, 4
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
-3.992398, -3.699744, -4, 0, -0.5, 0.5, 0.5,
-3.992398, -3.699744, -4, 1, -0.5, 0.5, 0.5,
-3.992398, -3.699744, -4, 1, 1.5, 0.5, 0.5,
-3.992398, -3.699744, -4, 0, 1.5, 0.5, 0.5,
-3.992398, -3.699744, -2, 0, -0.5, 0.5, 0.5,
-3.992398, -3.699744, -2, 1, -0.5, 0.5, 0.5,
-3.992398, -3.699744, -2, 1, 1.5, 0.5, 0.5,
-3.992398, -3.699744, -2, 0, 1.5, 0.5, 0.5,
-3.992398, -3.699744, 0, 0, -0.5, 0.5, 0.5,
-3.992398, -3.699744, 0, 1, -0.5, 0.5, 0.5,
-3.992398, -3.699744, 0, 1, 1.5, 0.5, 0.5,
-3.992398, -3.699744, 0, 0, 1.5, 0.5, 0.5,
-3.992398, -3.699744, 2, 0, -0.5, 0.5, 0.5,
-3.992398, -3.699744, 2, 1, -0.5, 0.5, 0.5,
-3.992398, -3.699744, 2, 1, 1.5, 0.5, 0.5,
-3.992398, -3.699744, 2, 0, 1.5, 0.5, 0.5,
-3.992398, -3.699744, 4, 0, -0.5, 0.5, 0.5,
-3.992398, -3.699744, 4, 1, -0.5, 0.5, 0.5,
-3.992398, -3.699744, 4, 1, 1.5, 0.5, 0.5,
-3.992398, -3.699744, 4, 0, 1.5, 0.5, 0.5
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
-3.496879, -3.235342, -5.452683,
-3.496879, 2.956676, -5.452683,
-3.496879, -3.235342, 5.06153,
-3.496879, 2.956676, 5.06153,
-3.496879, -3.235342, -5.452683,
-3.496879, -3.235342, 5.06153,
-3.496879, 2.956676, -5.452683,
-3.496879, 2.956676, 5.06153,
-3.496879, -3.235342, -5.452683,
3.110046, -3.235342, -5.452683,
-3.496879, -3.235342, 5.06153,
3.110046, -3.235342, 5.06153,
-3.496879, 2.956676, -5.452683,
3.110046, 2.956676, -5.452683,
-3.496879, 2.956676, 5.06153,
3.110046, 2.956676, 5.06153,
3.110046, -3.235342, -5.452683,
3.110046, 2.956676, -5.452683,
3.110046, -3.235342, 5.06153,
3.110046, 2.956676, 5.06153,
3.110046, -3.235342, -5.452683,
3.110046, -3.235342, 5.06153,
3.110046, 2.956676, -5.452683,
3.110046, 2.956676, 5.06153
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
var radius = 7.409473;
var distance = 32.96558;
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
mvMatrix.translate( 0.1934165, 0.1393332, 0.1955764 );
mvMatrix.scale( 1.212556, 1.293806, 0.7619464 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.96558);
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
S-2-ethylsulfonyleth<-read.table("S-2-ethylsulfonyleth.xyz", skip=1)
```

```
## Error in read.table("S-2-ethylsulfonyleth.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-S-2-ethylsulfonyleth$V2
```

```
## Error in eval(expr, envir, enclos): object 'S' not found
```

```r
y<-S-2-ethylsulfonyleth$V3
```

```
## Error in eval(expr, envir, enclos): object 'S' not found
```

```r
z<-S-2-ethylsulfonyleth$V4
```

```
## Error in eval(expr, envir, enclos): object 'S' not found
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
-3.400661, 0.9460335, -1.651372, 0, 0, 1, 1, 1,
-2.962517, -1.431929, -3.484834, 1, 0, 0, 1, 1,
-2.922444, -0.9717053, -3.271067, 1, 0, 0, 1, 1,
-2.869733, -0.5411383, 0.2264213, 1, 0, 0, 1, 1,
-2.696207, 0.3721261, -2.16127, 1, 0, 0, 1, 1,
-2.664461, 0.2449257, -4.118295, 1, 0, 0, 1, 1,
-2.465274, 1.75444, -2.021758, 0, 0, 0, 1, 1,
-2.425457, 0.3606579, -1.979012, 0, 0, 0, 1, 1,
-2.348956, -0.6358908, -1.800656, 0, 0, 0, 1, 1,
-2.346038, 0.07216752, -2.20546, 0, 0, 0, 1, 1,
-2.280814, 0.85032, 0.2388445, 0, 0, 0, 1, 1,
-2.266085, -0.3881421, -0.5436274, 0, 0, 0, 1, 1,
-2.212723, 0.04576126, -0.5658659, 0, 0, 0, 1, 1,
-2.199221, 0.1624144, -2.541492, 1, 1, 1, 1, 1,
-2.161173, 0.5166116, -2.732099, 1, 1, 1, 1, 1,
-2.133034, 0.3545156, -0.2541286, 1, 1, 1, 1, 1,
-2.117388, -0.2636466, -2.932754, 1, 1, 1, 1, 1,
-2.089463, 2.36091, -0.03185755, 1, 1, 1, 1, 1,
-2.065681, 0.5173481, -0.7463234, 1, 1, 1, 1, 1,
-2.048495, 0.7061383, -0.6585852, 1, 1, 1, 1, 1,
-2.047417, 1.661075, 0.3517268, 1, 1, 1, 1, 1,
-2.016064, -0.1451955, -2.941288, 1, 1, 1, 1, 1,
-2.000356, 0.8626457, -1.530206, 1, 1, 1, 1, 1,
-1.999256, -0.8173668, -1.793425, 1, 1, 1, 1, 1,
-1.957156, -0.142844, -5.299563, 1, 1, 1, 1, 1,
-1.949642, -0.3871433, 0.1125192, 1, 1, 1, 1, 1,
-1.947821, -0.2378408, -1.627787, 1, 1, 1, 1, 1,
-1.93069, -0.9981174, -2.64322, 1, 1, 1, 1, 1,
-1.899097, -0.4447034, -2.074638, 0, 0, 1, 1, 1,
-1.897468, 0.04357322, -3.152628, 1, 0, 0, 1, 1,
-1.891545, -0.3023734, -1.722905, 1, 0, 0, 1, 1,
-1.843876, -0.6656948, -2.058311, 1, 0, 0, 1, 1,
-1.827676, 0.3849507, -1.5566, 1, 0, 0, 1, 1,
-1.826021, -0.4030797, -1.608652, 1, 0, 0, 1, 1,
-1.816, 0.6484103, -2.498707, 0, 0, 0, 1, 1,
-1.80033, -0.497204, -2.469378, 0, 0, 0, 1, 1,
-1.781119, -0.5891346, -0.3682836, 0, 0, 0, 1, 1,
-1.774647, -1.763755, -2.100746, 0, 0, 0, 1, 1,
-1.7544, 0.1105351, -0.9858473, 0, 0, 0, 1, 1,
-1.737399, -0.2254297, -0.6068085, 0, 0, 0, 1, 1,
-1.732891, -1.615962, -2.352673, 0, 0, 0, 1, 1,
-1.724367, -0.4544498, -2.892759, 1, 1, 1, 1, 1,
-1.717016, -0.7183331, -1.361262, 1, 1, 1, 1, 1,
-1.716255, -0.4622429, -2.027408, 1, 1, 1, 1, 1,
-1.714296, 0.002293438, -1.771842, 1, 1, 1, 1, 1,
-1.691833, -0.9880284, -1.353902, 1, 1, 1, 1, 1,
-1.685994, 2.165134, -2.793102, 1, 1, 1, 1, 1,
-1.682422, 1.801193, -0.5896873, 1, 1, 1, 1, 1,
-1.64594, -0.9537312, -1.905977, 1, 1, 1, 1, 1,
-1.626465, 1.075613, -1.115909, 1, 1, 1, 1, 1,
-1.600515, -1.588949, -1.653258, 1, 1, 1, 1, 1,
-1.573865, 1.119701, -0.8987867, 1, 1, 1, 1, 1,
-1.565364, 0.4865828, -1.175372, 1, 1, 1, 1, 1,
-1.564996, -1.077637, -1.825194, 1, 1, 1, 1, 1,
-1.562625, 1.480923, -0.2295558, 1, 1, 1, 1, 1,
-1.551662, 0.1511403, -0.5837568, 1, 1, 1, 1, 1,
-1.540854, -0.2974572, -2.125647, 0, 0, 1, 1, 1,
-1.540161, -0.5224641, -4.158489, 1, 0, 0, 1, 1,
-1.532682, -2.394627, -1.253161, 1, 0, 0, 1, 1,
-1.529366, -1.508566, 0.2399056, 1, 0, 0, 1, 1,
-1.519605, 0.6036108, -2.784467, 1, 0, 0, 1, 1,
-1.510741, 0.003078927, -1.312792, 1, 0, 0, 1, 1,
-1.508896, 1.223832, -0.4496146, 0, 0, 0, 1, 1,
-1.493901, -0.5786842, -1.696233, 0, 0, 0, 1, 1,
-1.489465, -0.2862365, -1.196029, 0, 0, 0, 1, 1,
-1.488889, -0.6310169, -1.693336, 0, 0, 0, 1, 1,
-1.484248, 0.4415624, -1.344581, 0, 0, 0, 1, 1,
-1.483435, -2.076483, -3.505746, 0, 0, 0, 1, 1,
-1.469314, 1.443823, -0.725839, 0, 0, 0, 1, 1,
-1.467856, 0.7368271, -0.8196984, 1, 1, 1, 1, 1,
-1.46446, -1.679191, -2.534181, 1, 1, 1, 1, 1,
-1.450585, -0.7036061, -2.963084, 1, 1, 1, 1, 1,
-1.447037, -0.22879, -1.176544, 1, 1, 1, 1, 1,
-1.445349, -0.6216754, -3.204755, 1, 1, 1, 1, 1,
-1.42854, 1.130847, -2.198697, 1, 1, 1, 1, 1,
-1.427771, 0.7802181, -0.4874472, 1, 1, 1, 1, 1,
-1.405668, -1.15449, -0.5001913, 1, 1, 1, 1, 1,
-1.404118, -1.24827, -1.114801, 1, 1, 1, 1, 1,
-1.395514, 1.416351, -2.691124, 1, 1, 1, 1, 1,
-1.395445, 0.6518797, -4.15148, 1, 1, 1, 1, 1,
-1.391322, -0.6113344, -1.753381, 1, 1, 1, 1, 1,
-1.389989, 2.067456, -1.304466, 1, 1, 1, 1, 1,
-1.367891, 0.6143319, -2.717834, 1, 1, 1, 1, 1,
-1.352358, -0.86221, -2.044968, 1, 1, 1, 1, 1,
-1.339343, -0.02304859, -0.2579299, 0, 0, 1, 1, 1,
-1.333747, -1.067565, -1.706775, 1, 0, 0, 1, 1,
-1.32576, -0.3231138, -1.936436, 1, 0, 0, 1, 1,
-1.321839, 0.7100915, -0.8104345, 1, 0, 0, 1, 1,
-1.31978, 0.6856579, -1.195508, 1, 0, 0, 1, 1,
-1.309891, -0.1327271, -1.89649, 1, 0, 0, 1, 1,
-1.30809, -0.7952216, -2.964518, 0, 0, 0, 1, 1,
-1.283198, 0.1563715, -1.931404, 0, 0, 0, 1, 1,
-1.27853, -0.2220374, -2.419845, 0, 0, 0, 1, 1,
-1.276896, 0.01552895, -1.191523, 0, 0, 0, 1, 1,
-1.275987, -0.3198821, -1.719896, 0, 0, 0, 1, 1,
-1.274986, -1.507473, -1.998688, 0, 0, 0, 1, 1,
-1.274511, -0.5263425, -1.266134, 0, 0, 0, 1, 1,
-1.26766, -0.5289584, -1.740845, 1, 1, 1, 1, 1,
-1.263002, 0.3841113, -1.609755, 1, 1, 1, 1, 1,
-1.258494, 0.743251, -1.654426, 1, 1, 1, 1, 1,
-1.258027, 1.192524, 0.4641678, 1, 1, 1, 1, 1,
-1.249974, -0.7941242, -3.536823, 1, 1, 1, 1, 1,
-1.247139, 0.3935769, -2.79201, 1, 1, 1, 1, 1,
-1.246165, -0.9229425, -2.820994, 1, 1, 1, 1, 1,
-1.244289, -1.311543, -0.8187295, 1, 1, 1, 1, 1,
-1.2433, -1.411141, -2.793432, 1, 1, 1, 1, 1,
-1.237273, 0.1991406, -1.342701, 1, 1, 1, 1, 1,
-1.233591, 0.3670119, -1.341521, 1, 1, 1, 1, 1,
-1.221238, -0.4297406, -2.962537, 1, 1, 1, 1, 1,
-1.214422, 0.2105146, -0.9810078, 1, 1, 1, 1, 1,
-1.212903, 0.2158824, 0.7138853, 1, 1, 1, 1, 1,
-1.206683, 0.1934665, -0.7022382, 1, 1, 1, 1, 1,
-1.19962, -0.03009314, -2.10001, 0, 0, 1, 1, 1,
-1.19636, -0.7765949, -1.188452, 1, 0, 0, 1, 1,
-1.187335, -0.8810381, -3.335169, 1, 0, 0, 1, 1,
-1.176091, -1.547135, -3.457439, 1, 0, 0, 1, 1,
-1.16763, -1.177783, -2.944158, 1, 0, 0, 1, 1,
-1.167234, -0.9377573, -0.006166335, 1, 0, 0, 1, 1,
-1.162205, 1.447621, -1.758609, 0, 0, 0, 1, 1,
-1.160983, -0.9667117, -1.067569, 0, 0, 0, 1, 1,
-1.154393, -1.19471, -3.643399, 0, 0, 0, 1, 1,
-1.149389, -0.6638638, -0.5524662, 0, 0, 0, 1, 1,
-1.144092, 0.8397003, -0.878861, 0, 0, 0, 1, 1,
-1.139989, 0.2190716, -2.854227, 0, 0, 0, 1, 1,
-1.12866, -0.9899468, -2.656659, 0, 0, 0, 1, 1,
-1.122965, -1.651943, -3.486211, 1, 1, 1, 1, 1,
-1.12035, -2.081352, -1.026366, 1, 1, 1, 1, 1,
-1.113519, 0.2855883, -2.581126, 1, 1, 1, 1, 1,
-1.110987, 1.530868, 0.3753169, 1, 1, 1, 1, 1,
-1.109051, 0.3389562, -1.550618, 1, 1, 1, 1, 1,
-1.106121, 0.71171, -2.294245, 1, 1, 1, 1, 1,
-1.103823, -0.55116, -1.578043, 1, 1, 1, 1, 1,
-1.096571, 1.45258, -0.1321574, 1, 1, 1, 1, 1,
-1.09432, 0.1898587, -1.156548, 1, 1, 1, 1, 1,
-1.09022, 1.133575, -0.2600327, 1, 1, 1, 1, 1,
-1.080144, -0.08118302, -2.812917, 1, 1, 1, 1, 1,
-1.078681, -0.04317911, -2.530928, 1, 1, 1, 1, 1,
-1.077018, -1.14566, -4.899845, 1, 1, 1, 1, 1,
-1.069211, -1.119915, -2.511455, 1, 1, 1, 1, 1,
-1.068843, 0.4626004, -2.297246, 1, 1, 1, 1, 1,
-1.062455, -0.5501268, -2.662401, 0, 0, 1, 1, 1,
-1.061453, -0.1736414, -2.835138, 1, 0, 0, 1, 1,
-1.060772, -0.1706615, -0.8476272, 1, 0, 0, 1, 1,
-1.049142, 1.056151, -1.855158, 1, 0, 0, 1, 1,
-1.043592, 1.026644, 0.6195693, 1, 0, 0, 1, 1,
-1.031906, -0.5762286, -2.228645, 1, 0, 0, 1, 1,
-1.031018, -1.074659, -2.417827, 0, 0, 0, 1, 1,
-1.022098, -1.050041, -1.213082, 0, 0, 0, 1, 1,
-1.015782, 0.2707961, -1.372445, 0, 0, 0, 1, 1,
-1.013235, 0.393001, -1.063076, 0, 0, 0, 1, 1,
-0.9920028, 1.339992, -0.5170314, 0, 0, 0, 1, 1,
-0.9900209, 1.239048, -1.431501, 0, 0, 0, 1, 1,
-0.9841981, 0.635222, -1.354359, 0, 0, 0, 1, 1,
-0.9746876, 0.3492494, -2.032526, 1, 1, 1, 1, 1,
-0.9742039, -0.9909743, -3.137028, 1, 1, 1, 1, 1,
-0.9679127, 0.3934091, -2.427294, 1, 1, 1, 1, 1,
-0.966621, 2.219807, 0.317079, 1, 1, 1, 1, 1,
-0.9623591, -0.6423784, -2.982265, 1, 1, 1, 1, 1,
-0.9599423, -1.597784, -1.532625, 1, 1, 1, 1, 1,
-0.9576516, -0.4469307, -2.933487, 1, 1, 1, 1, 1,
-0.9576337, -0.4848685, -3.028421, 1, 1, 1, 1, 1,
-0.9497414, -1.793246, -2.366119, 1, 1, 1, 1, 1,
-0.9493172, 0.2681098, -0.4520358, 1, 1, 1, 1, 1,
-0.9393075, -1.163461, -3.392721, 1, 1, 1, 1, 1,
-0.9385583, -2.061134, -2.282443, 1, 1, 1, 1, 1,
-0.9306231, 0.8030583, -0.5030269, 1, 1, 1, 1, 1,
-0.9304699, -0.8725252, -0.3990347, 1, 1, 1, 1, 1,
-0.9296758, -0.08033752, -0.7133641, 1, 1, 1, 1, 1,
-0.9214861, -1.734296, -3.419915, 0, 0, 1, 1, 1,
-0.9178337, 0.597289, -2.951797, 1, 0, 0, 1, 1,
-0.9163395, -0.6700062, -2.933656, 1, 0, 0, 1, 1,
-0.9130069, 0.02452962, -1.803146, 1, 0, 0, 1, 1,
-0.9120738, -0.227598, -1.848327, 1, 0, 0, 1, 1,
-0.9101776, 0.7487643, -1.785408, 1, 0, 0, 1, 1,
-0.8935723, -0.498821, -0.05834306, 0, 0, 0, 1, 1,
-0.8892875, 1.050306, -0.2173823, 0, 0, 0, 1, 1,
-0.8802374, 0.1272553, -2.751739, 0, 0, 0, 1, 1,
-0.8801857, -0.6499513, -2.819243, 0, 0, 0, 1, 1,
-0.8739976, -0.2404502, -2.002187, 0, 0, 0, 1, 1,
-0.8736469, -2.053272, -4.664852, 0, 0, 0, 1, 1,
-0.8734704, -1.245761, -2.09624, 0, 0, 0, 1, 1,
-0.8669116, 1.019559, -1.626168, 1, 1, 1, 1, 1,
-0.8633595, 0.7314138, -1.675722, 1, 1, 1, 1, 1,
-0.8537421, 0.6545327, -0.4755594, 1, 1, 1, 1, 1,
-0.8469875, 0.3254342, -1.194846, 1, 1, 1, 1, 1,
-0.8455349, -1.398457, -3.030982, 1, 1, 1, 1, 1,
-0.8350077, 0.9525101, -0.9196202, 1, 1, 1, 1, 1,
-0.8322614, -1.509076, -2.820971, 1, 1, 1, 1, 1,
-0.8268296, 1.63428, -1.985783, 1, 1, 1, 1, 1,
-0.817323, 0.9560189, 0.9777246, 1, 1, 1, 1, 1,
-0.8171214, -0.6884238, -3.300124, 1, 1, 1, 1, 1,
-0.8148892, -0.4260632, -0.6770718, 1, 1, 1, 1, 1,
-0.804349, 0.09013242, -2.346403, 1, 1, 1, 1, 1,
-0.8021877, 1.322264, -1.527075, 1, 1, 1, 1, 1,
-0.8003435, 0.9628541, -0.1505688, 1, 1, 1, 1, 1,
-0.7834301, -0.6181076, -1.716315, 1, 1, 1, 1, 1,
-0.779913, 0.5697554, -1.18242, 0, 0, 1, 1, 1,
-0.7796544, -1.927899, -2.140597, 1, 0, 0, 1, 1,
-0.7755035, 0.7099068, -0.01109803, 1, 0, 0, 1, 1,
-0.7709598, 1.033557, 0.3912028, 1, 0, 0, 1, 1,
-0.7576477, -0.2033459, -1.573112, 1, 0, 0, 1, 1,
-0.7530677, 1.60918, -1.430406, 1, 0, 0, 1, 1,
-0.7440396, 0.3738675, -0.8713938, 0, 0, 0, 1, 1,
-0.7408359, 0.5346004, 0.3968381, 0, 0, 0, 1, 1,
-0.7406249, 1.066109, -0.1363605, 0, 0, 0, 1, 1,
-0.7392478, 0.7250062, 0.4421184, 0, 0, 0, 1, 1,
-0.7366542, 0.266179, -1.738235, 0, 0, 0, 1, 1,
-0.727752, -1.866569, -1.29177, 0, 0, 0, 1, 1,
-0.7267697, -0.8430077, -1.55922, 0, 0, 0, 1, 1,
-0.7224777, 1.638893, -1.149195, 1, 1, 1, 1, 1,
-0.7202592, 0.2781776, -1.476729, 1, 1, 1, 1, 1,
-0.7108586, 0.9293665, 0.508171, 1, 1, 1, 1, 1,
-0.7097369, -0.8413339, -2.275056, 1, 1, 1, 1, 1,
-0.7095878, 0.01060587, -1.310912, 1, 1, 1, 1, 1,
-0.7095753, 1.113305, -1.710532, 1, 1, 1, 1, 1,
-0.7045918, 0.8995383, -0.8514418, 1, 1, 1, 1, 1,
-0.7022616, 0.2530689, 0.3715096, 1, 1, 1, 1, 1,
-0.702151, 0.06541608, -0.6999832, 1, 1, 1, 1, 1,
-0.6998604, 0.08121901, -1.561781, 1, 1, 1, 1, 1,
-0.6995282, -0.4516783, -1.773497, 1, 1, 1, 1, 1,
-0.6976512, -0.6051905, -3.08795, 1, 1, 1, 1, 1,
-0.6931766, -0.183287, -1.36909, 1, 1, 1, 1, 1,
-0.6907731, 0.3830389, -0.986882, 1, 1, 1, 1, 1,
-0.6844406, 0.6103817, 1.410416, 1, 1, 1, 1, 1,
-0.6821343, -0.8349398, -1.979556, 0, 0, 1, 1, 1,
-0.6772127, 0.8452917, -1.303639, 1, 0, 0, 1, 1,
-0.6741164, 1.643182, -0.3589289, 1, 0, 0, 1, 1,
-0.6728555, 1.026209, 0.8996309, 1, 0, 0, 1, 1,
-0.6695646, -0.6674347, -2.859647, 1, 0, 0, 1, 1,
-0.6694111, -0.5795336, -2.293509, 1, 0, 0, 1, 1,
-0.6683381, -1.604627, -1.972712, 0, 0, 0, 1, 1,
-0.6672496, 0.1171693, 1.132829, 0, 0, 0, 1, 1,
-0.6661623, -1.134095, -2.308868, 0, 0, 0, 1, 1,
-0.6618978, 1.279395, -0.1212106, 0, 0, 0, 1, 1,
-0.6615003, -3.134802, -2.015745, 0, 0, 0, 1, 1,
-0.6584438, -0.3829505, -3.166559, 0, 0, 0, 1, 1,
-0.6555091, 1.639151, 2.254172, 0, 0, 0, 1, 1,
-0.6552977, -0.9152492, -2.132105, 1, 1, 1, 1, 1,
-0.6546832, -1.104201, -2.936507, 1, 1, 1, 1, 1,
-0.6506872, -1.812746, -1.516706, 1, 1, 1, 1, 1,
-0.6416465, -0.08693459, -2.251996, 1, 1, 1, 1, 1,
-0.6390709, 0.9052612, -1.231649, 1, 1, 1, 1, 1,
-0.6385153, -0.2421605, -2.274223, 1, 1, 1, 1, 1,
-0.6370037, -1.490172, -2.204425, 1, 1, 1, 1, 1,
-0.6356128, -0.5036246, -3.292673, 1, 1, 1, 1, 1,
-0.6301895, -1.593013, -2.907684, 1, 1, 1, 1, 1,
-0.6298072, -2.059133, -4.448008, 1, 1, 1, 1, 1,
-0.6247447, -0.715533, -2.103343, 1, 1, 1, 1, 1,
-0.6234642, 0.9912878, -0.4984325, 1, 1, 1, 1, 1,
-0.6223366, -0.4678515, -1.927984, 1, 1, 1, 1, 1,
-0.6183498, 0.9417666, 0.1926834, 1, 1, 1, 1, 1,
-0.614655, 0.07163114, -0.402684, 1, 1, 1, 1, 1,
-0.6145844, 0.2982577, -0.1517202, 0, 0, 1, 1, 1,
-0.610242, -0.2670509, -1.547676, 1, 0, 0, 1, 1,
-0.6057289, -1.416315, -3.41671, 1, 0, 0, 1, 1,
-0.6028291, -1.791188, -1.841212, 1, 0, 0, 1, 1,
-0.6021973, -0.7319491, -2.419948, 1, 0, 0, 1, 1,
-0.5987282, -0.5921118, -2.230676, 1, 0, 0, 1, 1,
-0.5907478, -1.731021, -1.89602, 0, 0, 0, 1, 1,
-0.5903489, 1.132687, -0.1040732, 0, 0, 0, 1, 1,
-0.5871683, 0.6547205, -2.939021, 0, 0, 0, 1, 1,
-0.5798258, -0.2855174, -1.701271, 0, 0, 0, 1, 1,
-0.5781929, -1.778607, -1.285289, 0, 0, 0, 1, 1,
-0.5627685, -1.805161, -2.271929, 0, 0, 0, 1, 1,
-0.5602844, 0.2150445, -1.213398, 0, 0, 0, 1, 1,
-0.5555019, 0.1996416, -0.08505162, 1, 1, 1, 1, 1,
-0.5540729, 0.2222482, -1.089557, 1, 1, 1, 1, 1,
-0.5534332, -0.002076912, -2.200871, 1, 1, 1, 1, 1,
-0.552261, -0.5302779, -2.451301, 1, 1, 1, 1, 1,
-0.5488452, 0.5510443, -2.088522, 1, 1, 1, 1, 1,
-0.5287624, -1.497808, -1.419722, 1, 1, 1, 1, 1,
-0.5281224, 0.6309323, -1.336883, 1, 1, 1, 1, 1,
-0.5280825, -1.133628, -3.54335, 1, 1, 1, 1, 1,
-0.5278054, -2.193047, -1.461423, 1, 1, 1, 1, 1,
-0.5239607, 0.5037813, -1.34609, 1, 1, 1, 1, 1,
-0.5179903, 1.453523, 1.427802, 1, 1, 1, 1, 1,
-0.5147614, -1.474572, -1.398969, 1, 1, 1, 1, 1,
-0.5139275, -1.282719, -2.986048, 1, 1, 1, 1, 1,
-0.5136479, -1.811223, -4.335608, 1, 1, 1, 1, 1,
-0.5128194, -0.5077466, -1.977472, 1, 1, 1, 1, 1,
-0.5085206, -0.4355291, -1.079564, 0, 0, 1, 1, 1,
-0.5056944, -0.04035271, -1.40837, 1, 0, 0, 1, 1,
-0.5056109, 0.4116058, -1.306012, 1, 0, 0, 1, 1,
-0.5011997, 0.2863871, -1.32278, 1, 0, 0, 1, 1,
-0.5005019, 0.6609904, -1.143368, 1, 0, 0, 1, 1,
-0.4938143, 1.157699, -0.8482715, 1, 0, 0, 1, 1,
-0.4916929, 0.3987429, -1.110314, 0, 0, 0, 1, 1,
-0.4912371, -0.1695445, -2.950417, 0, 0, 0, 1, 1,
-0.4878378, 0.3281312, 0.1341458, 0, 0, 0, 1, 1,
-0.4848922, 0.5616296, -0.7992628, 0, 0, 0, 1, 1,
-0.4826957, -1.723758, -2.609512, 0, 0, 0, 1, 1,
-0.4781918, -0.306182, -1.273489, 0, 0, 0, 1, 1,
-0.4756445, 1.202496, -0.7754856, 0, 0, 0, 1, 1,
-0.47383, -1.14771, -0.8820458, 1, 1, 1, 1, 1,
-0.4731185, 0.8070578, -1.071224, 1, 1, 1, 1, 1,
-0.4692429, -0.9344163, -4.184244, 1, 1, 1, 1, 1,
-0.4690274, 0.5224006, -0.8517537, 1, 1, 1, 1, 1,
-0.468887, -1.365161, -3.602614, 1, 1, 1, 1, 1,
-0.4688304, 0.189039, -0.5233008, 1, 1, 1, 1, 1,
-0.4672954, -0.2665846, -1.432585, 1, 1, 1, 1, 1,
-0.4655044, -1.393199, -2.621985, 1, 1, 1, 1, 1,
-0.4637118, -0.4303722, -1.559741, 1, 1, 1, 1, 1,
-0.4634215, -1.778194, -2.614952, 1, 1, 1, 1, 1,
-0.4626937, 0.7432045, -1.091977, 1, 1, 1, 1, 1,
-0.4595701, -0.8510246, -3.306058, 1, 1, 1, 1, 1,
-0.4538496, -1.451923, -2.085917, 1, 1, 1, 1, 1,
-0.447607, 0.7519278, 0.7244574, 1, 1, 1, 1, 1,
-0.445875, -0.8517908, -3.717181, 1, 1, 1, 1, 1,
-0.4412079, -0.5589113, -3.511047, 0, 0, 1, 1, 1,
-0.4381101, -0.2946625, -3.834094, 1, 0, 0, 1, 1,
-0.43544, -1.755629, -1.745588, 1, 0, 0, 1, 1,
-0.4333229, -0.4954258, -2.422521, 1, 0, 0, 1, 1,
-0.4298039, 1.297965, -0.1201092, 1, 0, 0, 1, 1,
-0.4296769, -0.2071954, -2.463174, 1, 0, 0, 1, 1,
-0.4263884, -0.1388204, -2.494017, 0, 0, 0, 1, 1,
-0.4256372, 0.4150011, -1.434412, 0, 0, 0, 1, 1,
-0.4253107, -0.4280765, -2.207261, 0, 0, 0, 1, 1,
-0.4238771, 0.5352743, -0.4971251, 0, 0, 0, 1, 1,
-0.4203127, -1.67201, -1.52944, 0, 0, 0, 1, 1,
-0.4166509, 0.4443594, 0.6226031, 0, 0, 0, 1, 1,
-0.4113721, -0.8019274, -2.699044, 0, 0, 0, 1, 1,
-0.4027627, -0.8334202, -1.749167, 1, 1, 1, 1, 1,
-0.3993488, 1.990471, -0.3268348, 1, 1, 1, 1, 1,
-0.3923753, -2.503478, -3.333703, 1, 1, 1, 1, 1,
-0.3846108, -2.148508, -3.971292, 1, 1, 1, 1, 1,
-0.3821889, -0.5071816, -2.997461, 1, 1, 1, 1, 1,
-0.3790556, 0.378815, -0.2535638, 1, 1, 1, 1, 1,
-0.3788566, 1.137859, -0.3029788, 1, 1, 1, 1, 1,
-0.3760615, -0.6830937, -1.815919, 1, 1, 1, 1, 1,
-0.3737543, 1.03123, -2.203521, 1, 1, 1, 1, 1,
-0.3680961, 0.5046289, -0.9928687, 1, 1, 1, 1, 1,
-0.3650066, 0.897127, 1.45064, 1, 1, 1, 1, 1,
-0.3625138, 0.1190733, -1.547973, 1, 1, 1, 1, 1,
-0.3598752, -0.01049401, -2.641973, 1, 1, 1, 1, 1,
-0.3555875, 0.5545518, -2.233453, 1, 1, 1, 1, 1,
-0.3535801, 0.9073448, -1.329714, 1, 1, 1, 1, 1,
-0.352693, 0.4143517, -0.7765335, 0, 0, 1, 1, 1,
-0.3514728, 0.9348212, -0.4160403, 1, 0, 0, 1, 1,
-0.3467237, -0.02397019, -2.480049, 1, 0, 0, 1, 1,
-0.3459569, 1.430308, 1.579605, 1, 0, 0, 1, 1,
-0.3401022, 1.880432, -0.09675808, 1, 0, 0, 1, 1,
-0.338355, -0.2622015, -2.54363, 1, 0, 0, 1, 1,
-0.3343405, -1.379599, -2.570395, 0, 0, 0, 1, 1,
-0.3308475, -0.7645073, -1.532459, 0, 0, 0, 1, 1,
-0.3284746, -1.629372, -2.663337, 0, 0, 0, 1, 1,
-0.328383, 1.319116, 0.1489799, 0, 0, 0, 1, 1,
-0.3261328, -0.6791604, -3.97509, 0, 0, 0, 1, 1,
-0.3256679, 0.9384446, -1.088045, 0, 0, 0, 1, 1,
-0.3231209, 0.2308178, -3.299933, 0, 0, 0, 1, 1,
-0.3230857, 0.1126889, -1.198505, 1, 1, 1, 1, 1,
-0.3227786, -0.7295076, -1.878587, 1, 1, 1, 1, 1,
-0.3181248, 1.813868, 0.2765689, 1, 1, 1, 1, 1,
-0.3156684, -0.02604989, 0.3696716, 1, 1, 1, 1, 1,
-0.3137974, -0.04125486, 0.02239833, 1, 1, 1, 1, 1,
-0.3131765, 0.9290754, -0.6958408, 1, 1, 1, 1, 1,
-0.3123346, -0.03830337, -3.2477, 1, 1, 1, 1, 1,
-0.307418, 2.186552, -0.6257477, 1, 1, 1, 1, 1,
-0.3073002, 0.46532, -0.1479159, 1, 1, 1, 1, 1,
-0.3018859, -0.0831387, -0.6743593, 1, 1, 1, 1, 1,
-0.2991818, -0.01815339, -1.677345, 1, 1, 1, 1, 1,
-0.2904379, 1.254086, 0.1615152, 1, 1, 1, 1, 1,
-0.289634, 0.254074, -0.2696796, 1, 1, 1, 1, 1,
-0.2896179, 0.17939, -0.9343414, 1, 1, 1, 1, 1,
-0.2891491, -0.273992, -1.647787, 1, 1, 1, 1, 1,
-0.2871222, -0.1169256, -1.324849, 0, 0, 1, 1, 1,
-0.2810421, 0.1420128, -0.603047, 1, 0, 0, 1, 1,
-0.2727025, -1.495875, -3.956988, 1, 0, 0, 1, 1,
-0.2707942, -0.4831081, -3.447781, 1, 0, 0, 1, 1,
-0.2679743, 0.1462859, -0.5979256, 1, 0, 0, 1, 1,
-0.2618617, 1.041502, 0.626344, 1, 0, 0, 1, 1,
-0.2585948, 0.7643866, -1.116493, 0, 0, 0, 1, 1,
-0.2540646, -0.3252547, -1.982348, 0, 0, 0, 1, 1,
-0.2515852, -0.8560392, -1.318631, 0, 0, 0, 1, 1,
-0.2508604, -0.9118952, -1.714639, 0, 0, 0, 1, 1,
-0.2501363, -0.5996553, -3.028732, 0, 0, 0, 1, 1,
-0.2436508, -0.1729011, -0.05173879, 0, 0, 0, 1, 1,
-0.2430453, 0.2564553, 0.313879, 0, 0, 0, 1, 1,
-0.2416823, 1.060223, -1.12296, 1, 1, 1, 1, 1,
-0.2413017, -0.1157225, -4.077738, 1, 1, 1, 1, 1,
-0.2400809, -0.8032856, -2.212997, 1, 1, 1, 1, 1,
-0.2391584, 0.02371493, -0.5260023, 1, 1, 1, 1, 1,
-0.2364244, -2.512845, -4.005389, 1, 1, 1, 1, 1,
-0.2358525, 1.585336, -1.06201, 1, 1, 1, 1, 1,
-0.2329149, -0.03910547, -2.868397, 1, 1, 1, 1, 1,
-0.2328307, 0.666721, 0.3756509, 1, 1, 1, 1, 1,
-0.2288262, -0.7357752, -3.108374, 1, 1, 1, 1, 1,
-0.2258283, 0.5774583, -1.506413, 1, 1, 1, 1, 1,
-0.2245094, 2.249374, -0.4303119, 1, 1, 1, 1, 1,
-0.2236303, -0.8958533, -2.500126, 1, 1, 1, 1, 1,
-0.2223808, 1.015316, -0.8478454, 1, 1, 1, 1, 1,
-0.2092182, -3.13331, -4.282938, 1, 1, 1, 1, 1,
-0.2063185, 0.05011564, -1.298097, 1, 1, 1, 1, 1,
-0.2035605, 0.4224021, -0.2847109, 0, 0, 1, 1, 1,
-0.2021589, -0.5160537, -2.133295, 1, 0, 0, 1, 1,
-0.2003774, -0.4816565, -2.810391, 1, 0, 0, 1, 1,
-0.1981715, 0.5196684, 0.4667314, 1, 0, 0, 1, 1,
-0.190546, 1.362046, 1.310902, 1, 0, 0, 1, 1,
-0.1877646, -1.415388, -3.658544, 1, 0, 0, 1, 1,
-0.1872185, -1.36046, -2.243778, 0, 0, 0, 1, 1,
-0.1869833, 0.9293743, -1.686014, 0, 0, 0, 1, 1,
-0.1859027, -0.4907216, -1.92305, 0, 0, 0, 1, 1,
-0.1838458, 1.461834, -0.009068672, 0, 0, 0, 1, 1,
-0.183465, 2.253506, -1.345942, 0, 0, 0, 1, 1,
-0.1834476, 0.7821409, 0.1258187, 0, 0, 0, 1, 1,
-0.1785885, 0.2544334, 0.1446241, 0, 0, 0, 1, 1,
-0.175842, 0.7305838, -0.4249152, 1, 1, 1, 1, 1,
-0.1752059, 2.866501, -1.60905, 1, 1, 1, 1, 1,
-0.1734149, -2.121087, -3.903929, 1, 1, 1, 1, 1,
-0.1719369, -1.093546, -2.447647, 1, 1, 1, 1, 1,
-0.1717083, 0.5217744, -0.1153872, 1, 1, 1, 1, 1,
-0.1667597, -0.6883416, -2.659169, 1, 1, 1, 1, 1,
-0.1657087, 1.405481, -1.628074, 1, 1, 1, 1, 1,
-0.1521008, -0.582838, -3.947064, 1, 1, 1, 1, 1,
-0.1490059, 0.5058066, -0.01527771, 1, 1, 1, 1, 1,
-0.1416084, -0.04989502, -0.6607699, 1, 1, 1, 1, 1,
-0.1391147, -0.3562884, -1.93163, 1, 1, 1, 1, 1,
-0.1385725, 0.3550711, 0.8539392, 1, 1, 1, 1, 1,
-0.1363493, 1.843424, 1.832803, 1, 1, 1, 1, 1,
-0.1361279, -1.275023, -3.526155, 1, 1, 1, 1, 1,
-0.1348101, 0.9394303, -1.229791, 1, 1, 1, 1, 1,
-0.1328141, -0.6057498, -1.608907, 0, 0, 1, 1, 1,
-0.130767, 1.758531, -0.0486083, 1, 0, 0, 1, 1,
-0.13037, 1.252471, 0.8103111, 1, 0, 0, 1, 1,
-0.1295962, 2.421953, -0.5665997, 1, 0, 0, 1, 1,
-0.1211723, -0.8593558, -2.640414, 1, 0, 0, 1, 1,
-0.1198424, 0.2630123, -3.134665, 1, 0, 0, 1, 1,
-0.1194102, -0.09724703, -3.457474, 0, 0, 0, 1, 1,
-0.1140645, -1.789623, -4.079259, 0, 0, 0, 1, 1,
-0.1109748, 1.779506, -0.571574, 0, 0, 0, 1, 1,
-0.1055955, -1.801223, -2.979624, 0, 0, 0, 1, 1,
-0.1052705, 1.781096, -0.2020918, 0, 0, 0, 1, 1,
-0.09603217, 0.2177368, -0.9935953, 0, 0, 0, 1, 1,
-0.08914506, -0.473524, -4.408634, 0, 0, 0, 1, 1,
-0.08730473, 1.143054, 0.5218453, 1, 1, 1, 1, 1,
-0.08574932, -1.652657, -2.342276, 1, 1, 1, 1, 1,
-0.08258955, 1.130499, -0.1300852, 1, 1, 1, 1, 1,
-0.07935866, 0.7439687, 1.492435, 1, 1, 1, 1, 1,
-0.07754042, -0.3036549, -2.797055, 1, 1, 1, 1, 1,
-0.07529429, -0.9151264, -5.057461, 1, 1, 1, 1, 1,
-0.07399657, 0.6095505, -0.348545, 1, 1, 1, 1, 1,
-0.07050897, -0.2117628, -1.664316, 1, 1, 1, 1, 1,
-0.06918314, -0.5569173, -2.822886, 1, 1, 1, 1, 1,
-0.0688518, -1.517707, -3.34954, 1, 1, 1, 1, 1,
-0.06462438, -0.3447736, -1.129547, 1, 1, 1, 1, 1,
-0.05833509, 0.2799966, 1.269565, 1, 1, 1, 1, 1,
-0.0559522, 2.709969, -0.3445953, 1, 1, 1, 1, 1,
-0.05489434, 0.8122611, 1.358508, 1, 1, 1, 1, 1,
-0.05408031, -0.01339366, -1.043113, 1, 1, 1, 1, 1,
-0.05001205, 1.316007, -1.80704, 0, 0, 1, 1, 1,
-0.04783173, 0.7481572, 1.988899, 1, 0, 0, 1, 1,
-0.04662899, 1.863765, -2.656298, 1, 0, 0, 1, 1,
-0.04595983, 1.049652, 0.6969776, 1, 0, 0, 1, 1,
-0.03966099, 0.9962202, 0.2988245, 1, 0, 0, 1, 1,
-0.03896785, -2.214083, -3.480816, 1, 0, 0, 1, 1,
-0.0361545, 0.9536704, -0.09873447, 0, 0, 0, 1, 1,
-0.0284897, 0.5579836, -0.317674, 0, 0, 0, 1, 1,
-0.02246384, -1.119524, -3.436204, 0, 0, 0, 1, 1,
-0.01856431, 2.391819, 0.3793392, 0, 0, 0, 1, 1,
-0.01800064, 1.290124, -0.5557528, 0, 0, 0, 1, 1,
-0.0138171, 0.8163712, -0.7109186, 0, 0, 0, 1, 1,
-0.01333221, -0.5160835, -1.686816, 0, 0, 0, 1, 1,
-0.01047174, 0.519817, 0.4665889, 1, 1, 1, 1, 1,
-0.008231991, 0.371222, -0.05484226, 1, 1, 1, 1, 1,
-0.003654581, 0.4558307, -0.7490329, 1, 1, 1, 1, 1,
-0.002454027, -0.1997793, -2.319056, 1, 1, 1, 1, 1,
0.001359627, 1.043893, 0.7313371, 1, 1, 1, 1, 1,
0.004001579, 0.3335992, -1.220515, 1, 1, 1, 1, 1,
0.004183815, -1.626148, 3.585504, 1, 1, 1, 1, 1,
0.004921889, -0.4157425, 3.572879, 1, 1, 1, 1, 1,
0.006501691, 0.302428, -0.4148342, 1, 1, 1, 1, 1,
0.006719254, -1.063795, 1.140212, 1, 1, 1, 1, 1,
0.009203653, 1.209598, -0.17502, 1, 1, 1, 1, 1,
0.009251121, 1.149605, 0.3312962, 1, 1, 1, 1, 1,
0.009325552, 0.6971881, 1.355529, 1, 1, 1, 1, 1,
0.01313971, -0.4935902, 4.076782, 1, 1, 1, 1, 1,
0.01396903, 0.5170895, 0.9097615, 1, 1, 1, 1, 1,
0.01422231, 0.6300094, 1.191222, 0, 0, 1, 1, 1,
0.01426447, -0.8412871, 3.697495, 1, 0, 0, 1, 1,
0.01597804, -2.711104, 2.240571, 1, 0, 0, 1, 1,
0.01602609, -0.8389769, 1.786797, 1, 0, 0, 1, 1,
0.01665918, 2.362018, -0.5204673, 1, 0, 0, 1, 1,
0.01741639, -2.663657, 4.731103, 1, 0, 0, 1, 1,
0.01756868, 1.052191, 0.08953619, 0, 0, 0, 1, 1,
0.01778681, 0.5414081, 0.009172128, 0, 0, 0, 1, 1,
0.0197976, 0.4142206, -0.2306284, 0, 0, 0, 1, 1,
0.02436109, 1.183132, -1.36901, 0, 0, 0, 1, 1,
0.0257964, -0.945424, 1.993922, 0, 0, 0, 1, 1,
0.02789647, -1.051719, 3.799437, 0, 0, 0, 1, 1,
0.02881348, -1.082626, 3.408053, 0, 0, 0, 1, 1,
0.03766742, -0.1834749, 3.676057, 1, 1, 1, 1, 1,
0.03836423, 0.357863, 0.2321399, 1, 1, 1, 1, 1,
0.04124457, -2.365794, 3.538397, 1, 1, 1, 1, 1,
0.0452707, -0.1025454, 2.554017, 1, 1, 1, 1, 1,
0.04667248, -1.386264, 2.545382, 1, 1, 1, 1, 1,
0.04861115, 1.147249, 0.06001485, 1, 1, 1, 1, 1,
0.04993032, -1.654972, 3.209619, 1, 1, 1, 1, 1,
0.05272257, -0.4741145, 1.668539, 1, 1, 1, 1, 1,
0.05294593, 0.3032246, -1.247233, 1, 1, 1, 1, 1,
0.05813653, -1.005847, 2.528007, 1, 1, 1, 1, 1,
0.06883752, 0.5072308, 0.817202, 1, 1, 1, 1, 1,
0.07046901, 0.4437151, -0.2137604, 1, 1, 1, 1, 1,
0.07486042, -1.46192, 1.091787, 1, 1, 1, 1, 1,
0.07907758, 0.2411694, 0.06652694, 1, 1, 1, 1, 1,
0.0795631, 0.1208912, -1.19944, 1, 1, 1, 1, 1,
0.08088848, -2.867229, 2.746247, 0, 0, 1, 1, 1,
0.08197875, -1.804915, 4.507528, 1, 0, 0, 1, 1,
0.0822487, -1.167341, 4.769459, 1, 0, 0, 1, 1,
0.0840495, 0.213186, -0.3588751, 1, 0, 0, 1, 1,
0.08470168, 0.4700088, -0.3490324, 1, 0, 0, 1, 1,
0.08762135, 0.3718362, -0.7226559, 1, 0, 0, 1, 1,
0.08959512, -1.33531, 3.537483, 0, 0, 0, 1, 1,
0.09995533, -0.7587252, 4.436585, 0, 0, 0, 1, 1,
0.1001433, -0.03882988, 1.728416, 0, 0, 0, 1, 1,
0.10661, -0.36509, 3.556334, 0, 0, 0, 1, 1,
0.1073321, -1.557586, 2.308933, 0, 0, 0, 1, 1,
0.1074885, -0.8606155, 3.862161, 0, 0, 0, 1, 1,
0.1137209, -0.04370243, 1.839437, 0, 0, 0, 1, 1,
0.1144456, 0.7184868, -1.19643, 1, 1, 1, 1, 1,
0.1147863, -0.5511002, 4.260095, 1, 1, 1, 1, 1,
0.1181463, 1.440841, -1.235778, 1, 1, 1, 1, 1,
0.1185434, 0.9513121, -0.7981396, 1, 1, 1, 1, 1,
0.1193735, -1.521158, 2.549675, 1, 1, 1, 1, 1,
0.1213762, 0.2320025, 2.297204, 1, 1, 1, 1, 1,
0.1237015, -0.6391172, 3.748684, 1, 1, 1, 1, 1,
0.1247113, 0.7093962, -0.4757963, 1, 1, 1, 1, 1,
0.1261817, 0.3689557, 2.153439, 1, 1, 1, 1, 1,
0.1262226, 0.7232366, -1.853589, 1, 1, 1, 1, 1,
0.1282032, -0.6166892, 2.175936, 1, 1, 1, 1, 1,
0.1291747, -1.417539, 3.679074, 1, 1, 1, 1, 1,
0.1301196, -0.6440446, 1.737084, 1, 1, 1, 1, 1,
0.1334217, 0.02241663, 1.052813, 1, 1, 1, 1, 1,
0.1409192, 0.3221493, 0.4165098, 1, 1, 1, 1, 1,
0.146899, -2.105015, 4.366582, 0, 0, 1, 1, 1,
0.1482838, 1.378951, -0.08738883, 1, 0, 0, 1, 1,
0.1511228, 1.487333, 1.554371, 1, 0, 0, 1, 1,
0.154035, 0.1395271, 1.188219, 1, 0, 0, 1, 1,
0.1546488, -1.081381, 2.696094, 1, 0, 0, 1, 1,
0.1583284, -2.453653, 3.408854, 1, 0, 0, 1, 1,
0.1591363, 1.33529, 2.474149, 0, 0, 0, 1, 1,
0.164525, 0.1524325, -0.3998384, 0, 0, 0, 1, 1,
0.1651672, -1.243541, 2.557594, 0, 0, 0, 1, 1,
0.1660746, -0.7662597, 2.641268, 0, 0, 0, 1, 1,
0.1689419, 0.2400625, -0.6408855, 0, 0, 0, 1, 1,
0.1691929, -0.08109542, 2.785852, 0, 0, 0, 1, 1,
0.1697434, 0.9553394, -0.1412371, 0, 0, 0, 1, 1,
0.1700406, -0.1045917, 1.035319, 1, 1, 1, 1, 1,
0.1760166, -0.6859007, 1.883614, 1, 1, 1, 1, 1,
0.176509, 1.257817, -0.8964142, 1, 1, 1, 1, 1,
0.1786391, -0.5884616, 2.705147, 1, 1, 1, 1, 1,
0.1823427, -1.327669, 1.797446, 1, 1, 1, 1, 1,
0.1827864, 1.248563, 0.163828, 1, 1, 1, 1, 1,
0.1855419, 1.205876, -1.220999, 1, 1, 1, 1, 1,
0.1890405, 0.7177695, -1.662354, 1, 1, 1, 1, 1,
0.1929928, -0.6899672, 2.954118, 1, 1, 1, 1, 1,
0.1930755, -0.4796367, 2.078915, 1, 1, 1, 1, 1,
0.1975574, -0.4488871, 3.152407, 1, 1, 1, 1, 1,
0.1980617, -0.4328829, 2.354796, 1, 1, 1, 1, 1,
0.198531, 0.2277863, 0.3750884, 1, 1, 1, 1, 1,
0.1992645, -1.011334, 3.618354, 1, 1, 1, 1, 1,
0.2048209, 1.126653, -1.125537, 1, 1, 1, 1, 1,
0.2096606, 0.3929344, 0.9837772, 0, 0, 1, 1, 1,
0.2129643, -1.66193, 1.765935, 1, 0, 0, 1, 1,
0.2140312, 0.4039421, 2.628891, 1, 0, 0, 1, 1,
0.2151713, 1.942352, 0.9795979, 1, 0, 0, 1, 1,
0.2158653, -0.9225211, 3.145692, 1, 0, 0, 1, 1,
0.222546, -0.3383532, 1.963179, 1, 0, 0, 1, 1,
0.2250441, 0.8115065, 2.032585, 0, 0, 0, 1, 1,
0.2284902, -0.3306274, 3.567333, 0, 0, 0, 1, 1,
0.2292664, -0.4640012, 2.786693, 0, 0, 0, 1, 1,
0.2310266, 0.925129, 0.3911117, 0, 0, 0, 1, 1,
0.2347355, -1.148471, 1.777565, 0, 0, 0, 1, 1,
0.2359595, -1.036225, 4.36098, 0, 0, 0, 1, 1,
0.241798, -0.1116509, 1.590762, 0, 0, 0, 1, 1,
0.2456103, 0.9713988, -0.5635188, 1, 1, 1, 1, 1,
0.2457253, -0.08132678, 1.278234, 1, 1, 1, 1, 1,
0.2461359, -1.722695, 3.409597, 1, 1, 1, 1, 1,
0.2503192, 0.682499, -0.3278857, 1, 1, 1, 1, 1,
0.2519485, -0.308424, 2.109142, 1, 1, 1, 1, 1,
0.2554589, 0.8038428, -0.7448351, 1, 1, 1, 1, 1,
0.2618616, -0.1291656, 3.504839, 1, 1, 1, 1, 1,
0.262265, 1.20781, 0.6200443, 1, 1, 1, 1, 1,
0.2656567, 0.9428391, -0.3724416, 1, 1, 1, 1, 1,
0.2661919, -0.8004895, 2.520414, 1, 1, 1, 1, 1,
0.2700367, 1.768515, -0.1218563, 1, 1, 1, 1, 1,
0.2755657, 0.7979729, 2.291514, 1, 1, 1, 1, 1,
0.2768534, 0.5801338, -0.0009573537, 1, 1, 1, 1, 1,
0.2768553, -0.2330539, 1.752392, 1, 1, 1, 1, 1,
0.2786664, -0.4908336, 3.057252, 1, 1, 1, 1, 1,
0.2803924, -0.8050304, 2.830211, 0, 0, 1, 1, 1,
0.2815636, -0.1794611, 1.887049, 1, 0, 0, 1, 1,
0.2838463, -1.067054, 3.626709, 1, 0, 0, 1, 1,
0.2843785, 0.6371641, 0.4599277, 1, 0, 0, 1, 1,
0.2883257, -0.5640168, 2.661569, 1, 0, 0, 1, 1,
0.2909763, 0.2703029, 2.084844, 1, 0, 0, 1, 1,
0.2943819, 0.9666201, 1.108194, 0, 0, 0, 1, 1,
0.295171, -1.142963, 3.542354, 0, 0, 0, 1, 1,
0.2983648, 0.4507972, 0.006765208, 0, 0, 0, 1, 1,
0.2984321, 1.5405, 0.07358837, 0, 0, 0, 1, 1,
0.2989728, -0.1165912, 0.88694, 0, 0, 0, 1, 1,
0.3005394, -2.410563, 2.911141, 0, 0, 0, 1, 1,
0.3017203, -0.4317629, 3.745509, 0, 0, 0, 1, 1,
0.3017735, -0.9026762, 1.57035, 1, 1, 1, 1, 1,
0.302305, -2.411088, 3.120776, 1, 1, 1, 1, 1,
0.3027758, -0.7794709, 4.089766, 1, 1, 1, 1, 1,
0.3067305, 0.622526, -0.4091953, 1, 1, 1, 1, 1,
0.3089231, -0.3711077, 0.7675825, 1, 1, 1, 1, 1,
0.3099614, 0.411304, 1.095572, 1, 1, 1, 1, 1,
0.3100875, 2.468774, 2.390724, 1, 1, 1, 1, 1,
0.3118342, -1.906418, 2.560275, 1, 1, 1, 1, 1,
0.3140433, -0.7472936, 2.405001, 1, 1, 1, 1, 1,
0.3147055, 1.412678, 0.7033865, 1, 1, 1, 1, 1,
0.3167078, 0.04182372, 0.08212438, 1, 1, 1, 1, 1,
0.3207023, -1.069971, 4.908411, 1, 1, 1, 1, 1,
0.331003, 0.683951, -0.1433506, 1, 1, 1, 1, 1,
0.331874, -0.00545611, 1.817466, 1, 1, 1, 1, 1,
0.3319135, 0.328858, 0.09097145, 1, 1, 1, 1, 1,
0.338107, 0.5457855, 0.5101057, 0, 0, 1, 1, 1,
0.3419805, 1.001648, 0.5960929, 1, 0, 0, 1, 1,
0.3472969, 2.8376, -2.336, 1, 0, 0, 1, 1,
0.3475096, -0.9728801, 1.576644, 1, 0, 0, 1, 1,
0.3498774, -0.9431838, 4.392191, 1, 0, 0, 1, 1,
0.3526962, 0.678115, 0.6253897, 1, 0, 0, 1, 1,
0.3583687, -0.4079771, 0.8226234, 0, 0, 0, 1, 1,
0.3592244, -0.1200117, -1.125295, 0, 0, 0, 1, 1,
0.359839, 0.270443, 2.734783, 0, 0, 0, 1, 1,
0.3602014, 1.033962, 0.4581304, 0, 0, 0, 1, 1,
0.3608942, -0.002245327, 2.023567, 0, 0, 0, 1, 1,
0.3626149, -0.7399605, 2.446939, 0, 0, 0, 1, 1,
0.363153, 1.267998, 0.8017239, 0, 0, 0, 1, 1,
0.3648174, -2.454657, 1.585302, 1, 1, 1, 1, 1,
0.3716723, 0.3497616, 0.4783598, 1, 1, 1, 1, 1,
0.3809412, 0.5282615, 2.534254, 1, 1, 1, 1, 1,
0.382663, -0.8502797, 0.9332426, 1, 1, 1, 1, 1,
0.3867348, 0.4436392, 0.4680723, 1, 1, 1, 1, 1,
0.3891805, -1.218923, 2.851676, 1, 1, 1, 1, 1,
0.3908184, -2.422442, 4.230103, 1, 1, 1, 1, 1,
0.3954833, -0.5039694, 2.381519, 1, 1, 1, 1, 1,
0.3962541, -1.657156, 2.402275, 1, 1, 1, 1, 1,
0.3974736, 0.6194413, 1.315716, 1, 1, 1, 1, 1,
0.3986695, -0.5049686, -0.1228109, 1, 1, 1, 1, 1,
0.4014894, 0.4645554, 0.5126858, 1, 1, 1, 1, 1,
0.4022533, 0.5693535, 0.7221217, 1, 1, 1, 1, 1,
0.4109874, 0.3785263, 1.883692, 1, 1, 1, 1, 1,
0.414465, -1.526554, 4.296045, 1, 1, 1, 1, 1,
0.4171326, -1.325323, 3.188743, 0, 0, 1, 1, 1,
0.4195273, 0.5571991, 1.24393, 1, 0, 0, 1, 1,
0.4215086, 0.890718, -0.9067828, 1, 0, 0, 1, 1,
0.4222242, 1.713482, -0.1197809, 1, 0, 0, 1, 1,
0.4227141, 0.5208542, 1.892151, 1, 0, 0, 1, 1,
0.4243965, -0.2312602, 3.105003, 1, 0, 0, 1, 1,
0.4257674, 1.889646, -0.3470639, 0, 0, 0, 1, 1,
0.4287696, -0.3664734, 1.428363, 0, 0, 0, 1, 1,
0.434782, 1.12077, 1.439493, 0, 0, 0, 1, 1,
0.4365903, -1.001919, 0.5324315, 0, 0, 0, 1, 1,
0.4404219, -0.7365354, 2.957604, 0, 0, 0, 1, 1,
0.4413219, -0.329647, 1.611371, 0, 0, 0, 1, 1,
0.4450481, -0.4768023, 1.55062, 0, 0, 0, 1, 1,
0.4500816, -0.4969217, 0.9500093, 1, 1, 1, 1, 1,
0.4560022, -0.04648398, 2.914018, 1, 1, 1, 1, 1,
0.4560755, 1.070411, 1.890793, 1, 1, 1, 1, 1,
0.4574687, 0.1099411, 0.06026675, 1, 1, 1, 1, 1,
0.4575488, 0.6706787, -0.7775156, 1, 1, 1, 1, 1,
0.4673741, -0.1893062, 3.937848, 1, 1, 1, 1, 1,
0.4678514, 0.3759901, 2.664929, 1, 1, 1, 1, 1,
0.4704646, -0.8293543, 1.462533, 1, 1, 1, 1, 1,
0.4733129, -0.6502155, 3.517257, 1, 1, 1, 1, 1,
0.4743125, 0.6809486, 0.4728079, 1, 1, 1, 1, 1,
0.4765847, -0.3969197, 3.026273, 1, 1, 1, 1, 1,
0.4782329, 2.328737, 0.7717259, 1, 1, 1, 1, 1,
0.4804861, -1.715883, 2.22946, 1, 1, 1, 1, 1,
0.4814393, -0.3275514, 0.9442719, 1, 1, 1, 1, 1,
0.4828005, -0.5531431, 2.680507, 1, 1, 1, 1, 1,
0.4829995, -1.163537, 1.865749, 0, 0, 1, 1, 1,
0.4841384, -1.138803, 1.754547, 1, 0, 0, 1, 1,
0.4884053, 2.025774, -0.4162176, 1, 0, 0, 1, 1,
0.4926917, -1.78879, 0.6942047, 1, 0, 0, 1, 1,
0.493594, -1.017893, 3.751049, 1, 0, 0, 1, 1,
0.4960525, -0.5604987, 1.41917, 1, 0, 0, 1, 1,
0.4984154, -1.591508, 2.471244, 0, 0, 0, 1, 1,
0.5016437, -0.8751976, 3.46359, 0, 0, 0, 1, 1,
0.5023816, -1.393848, 3.337905, 0, 0, 0, 1, 1,
0.5065125, -0.04019593, 1.446378, 0, 0, 0, 1, 1,
0.5078218, -0.2889985, 2.681319, 0, 0, 0, 1, 1,
0.5092967, 0.8399022, 1.237319, 0, 0, 0, 1, 1,
0.5101439, -0.4959209, 1.360902, 0, 0, 0, 1, 1,
0.5168005, -0.1363302, 1.14784, 1, 1, 1, 1, 1,
0.5197102, -0.072646, 2.024715, 1, 1, 1, 1, 1,
0.5234717, 2.812835, -1.455359, 1, 1, 1, 1, 1,
0.5309978, -0.2862034, 1.861727, 1, 1, 1, 1, 1,
0.5315464, 0.3405261, 1.969813, 1, 1, 1, 1, 1,
0.538428, -1.38693, 3.206086, 1, 1, 1, 1, 1,
0.5388581, 0.3675975, 1.002634, 1, 1, 1, 1, 1,
0.5396225, -1.582737, 3.419211, 1, 1, 1, 1, 1,
0.5399739, 0.1227816, 0.6250235, 1, 1, 1, 1, 1,
0.5413439, 1.055391, -0.01499983, 1, 1, 1, 1, 1,
0.5442343, 1.078841, -2.453664, 1, 1, 1, 1, 1,
0.5442538, 0.9269719, 2.279815, 1, 1, 1, 1, 1,
0.5461667, -1.067822, 2.926925, 1, 1, 1, 1, 1,
0.5476486, -0.008688514, 2.950524, 1, 1, 1, 1, 1,
0.5479624, 0.9322234, -1.352392, 1, 1, 1, 1, 1,
0.548277, -1.425668, 2.604568, 0, 0, 1, 1, 1,
0.5499539, -0.4897052, 2.343573, 1, 0, 0, 1, 1,
0.5524083, -0.327432, 1.899932, 1, 0, 0, 1, 1,
0.5529212, 0.1601965, 0.5032929, 1, 0, 0, 1, 1,
0.556407, 0.2584693, 1.400329, 1, 0, 0, 1, 1,
0.5608751, 2.071257, 0.07559695, 1, 0, 0, 1, 1,
0.5627148, 0.05334401, 0.3967457, 0, 0, 0, 1, 1,
0.5627851, -0.02457224, 3.371603, 0, 0, 0, 1, 1,
0.5631079, 0.8373681, 1.87678, 0, 0, 0, 1, 1,
0.5640883, 1.143394, -1.412592, 0, 0, 0, 1, 1,
0.5643693, -0.3466074, 0.9236867, 0, 0, 0, 1, 1,
0.5706638, 1.225781, -0.1817217, 0, 0, 0, 1, 1,
0.5750128, 0.4475179, 0.2478098, 0, 0, 0, 1, 1,
0.5754374, -0.4158193, 1.847703, 1, 1, 1, 1, 1,
0.5808254, 0.664057, 1.550781, 1, 1, 1, 1, 1,
0.5816323, -0.8703409, 0.6932734, 1, 1, 1, 1, 1,
0.5833573, -2.004549, 2.214607, 1, 1, 1, 1, 1,
0.5842909, 0.2669904, 2.657912, 1, 1, 1, 1, 1,
0.5846824, 1.539526, 0.05749831, 1, 1, 1, 1, 1,
0.5862805, 1.842723, -0.6156998, 1, 1, 1, 1, 1,
0.5876676, 0.849873, -0.5375381, 1, 1, 1, 1, 1,
0.5884901, -0.5359152, 2.281971, 1, 1, 1, 1, 1,
0.5893568, -0.3836511, 1.958765, 1, 1, 1, 1, 1,
0.58958, -0.4165073, 2.457636, 1, 1, 1, 1, 1,
0.5896737, 0.8636211, 1.237123, 1, 1, 1, 1, 1,
0.592722, -0.08577629, 1.513695, 1, 1, 1, 1, 1,
0.5929174, -0.08623256, 1.850003, 1, 1, 1, 1, 1,
0.5934283, 0.5138773, -0.1897936, 1, 1, 1, 1, 1,
0.5943418, -0.5605294, 3.062325, 0, 0, 1, 1, 1,
0.5986232, -1.22891, 0.9172885, 1, 0, 0, 1, 1,
0.6002179, 1.166363, 0.7493464, 1, 0, 0, 1, 1,
0.6061116, -0.7357725, 3.417893, 1, 0, 0, 1, 1,
0.6063256, -0.7263017, 3.140832, 1, 0, 0, 1, 1,
0.6130907, -0.617017, 1.454374, 1, 0, 0, 1, 1,
0.6136349, -0.7693914, 2.73067, 0, 0, 0, 1, 1,
0.6185719, -0.4365872, 3.493423, 0, 0, 0, 1, 1,
0.6187901, -0.4514742, 1.845446, 0, 0, 0, 1, 1,
0.6225882, -0.3076656, 1.944267, 0, 0, 0, 1, 1,
0.6270461, -1.042943, 3.336179, 0, 0, 0, 1, 1,
0.6276093, -0.07082231, 2.115478, 0, 0, 0, 1, 1,
0.6290586, -0.5170404, 2.202393, 0, 0, 0, 1, 1,
0.6328433, 0.5829099, -0.02360606, 1, 1, 1, 1, 1,
0.6329014, -1.576494, 2.813985, 1, 1, 1, 1, 1,
0.635608, 0.1645508, 2.420071, 1, 1, 1, 1, 1,
0.6362285, 0.491714, 1.445387, 1, 1, 1, 1, 1,
0.6511708, -0.7374406, 2.229264, 1, 1, 1, 1, 1,
0.6556051, -1.260073, 3.945494, 1, 1, 1, 1, 1,
0.6568279, -0.2654616, 1.822987, 1, 1, 1, 1, 1,
0.6606925, -0.6021948, 2.601492, 1, 1, 1, 1, 1,
0.66144, -0.8709421, 1.699297, 1, 1, 1, 1, 1,
0.6629926, 0.1064799, 1.832965, 1, 1, 1, 1, 1,
0.6664825, -0.03615721, 0.8933786, 1, 1, 1, 1, 1,
0.6680071, -0.182541, 2.158227, 1, 1, 1, 1, 1,
0.668529, 1.554348, 0.6459907, 1, 1, 1, 1, 1,
0.672516, 0.3512139, 1.419738, 1, 1, 1, 1, 1,
0.6726988, 1.096255, 0.3401301, 1, 1, 1, 1, 1,
0.6734625, 1.246353, -0.8733433, 0, 0, 1, 1, 1,
0.6745833, 1.836594, 1.497636, 1, 0, 0, 1, 1,
0.6770281, 0.1985621, 2.086669, 1, 0, 0, 1, 1,
0.6799755, 0.2855799, 1.518018, 1, 0, 0, 1, 1,
0.6858615, 0.7394632, -1.876802, 1, 0, 0, 1, 1,
0.699513, -0.10562, 1.178444, 1, 0, 0, 1, 1,
0.7030142, 0.7020121, 0.635471, 0, 0, 0, 1, 1,
0.7054466, 0.120091, 2.295909, 0, 0, 0, 1, 1,
0.7084917, -0.04774219, 1.027556, 0, 0, 0, 1, 1,
0.7187664, 0.3140163, 2.120985, 0, 0, 0, 1, 1,
0.7196145, -1.432478, 1.66076, 0, 0, 0, 1, 1,
0.7226346, -0.7151384, 1.585559, 0, 0, 0, 1, 1,
0.7290953, 1.764919, -1.110587, 0, 0, 0, 1, 1,
0.7294374, 0.1612042, 2.830612, 1, 1, 1, 1, 1,
0.7295125, 0.5820237, 1.767738, 1, 1, 1, 1, 1,
0.7298144, 0.8161008, 0.4245015, 1, 1, 1, 1, 1,
0.7299349, 1.568027, 0.942231, 1, 1, 1, 1, 1,
0.7314283, -0.1633884, 1.824164, 1, 1, 1, 1, 1,
0.7410998, -0.2393571, 2.451673, 1, 1, 1, 1, 1,
0.7425472, 0.696678, 2.666025, 1, 1, 1, 1, 1,
0.7436076, 1.437146, 2.254817, 1, 1, 1, 1, 1,
0.7489003, -0.2639681, 2.040243, 1, 1, 1, 1, 1,
0.751784, 0.2323805, 2.466836, 1, 1, 1, 1, 1,
0.7520264, 1.238285, 1.805702, 1, 1, 1, 1, 1,
0.7529418, 0.7246527, 3.246446, 1, 1, 1, 1, 1,
0.7614049, 2.478277, 0.4443614, 1, 1, 1, 1, 1,
0.7680055, 1.21191, -1.483923, 1, 1, 1, 1, 1,
0.7759712, -0.4883724, 1.991254, 1, 1, 1, 1, 1,
0.7850007, 0.02900052, 1.116457, 0, 0, 1, 1, 1,
0.78653, 0.6543965, -0.3582906, 1, 0, 0, 1, 1,
0.7874094, -0.3397162, 3.49928, 1, 0, 0, 1, 1,
0.7875531, -0.007205868, 2.495044, 1, 0, 0, 1, 1,
0.7930162, 0.8405403, 1.899461, 1, 0, 0, 1, 1,
0.8035174, -0.5682727, 2.571967, 1, 0, 0, 1, 1,
0.8045677, -0.6517985, 1.427969, 0, 0, 0, 1, 1,
0.8092442, 2.127463, -1.062653, 0, 0, 0, 1, 1,
0.8125398, -0.03547401, 0.9214672, 0, 0, 0, 1, 1,
0.8137339, -1.275921, 3.870909, 0, 0, 0, 1, 1,
0.8151541, -0.6569998, 3.345399, 0, 0, 0, 1, 1,
0.8228099, 2.634892, 0.6324431, 0, 0, 0, 1, 1,
0.8273086, -0.9482325, 1.995682, 0, 0, 0, 1, 1,
0.8289511, -1.548371, 0.3301166, 1, 1, 1, 1, 1,
0.8297397, 1.074612, 1.885461, 1, 1, 1, 1, 1,
0.830154, 1.878587, 0.4108689, 1, 1, 1, 1, 1,
0.8330849, -1.414963, 3.811655, 1, 1, 1, 1, 1,
0.8376223, -0.8562334, 2.941515, 1, 1, 1, 1, 1,
0.8395041, 2.645391, 0.07961791, 1, 1, 1, 1, 1,
0.8495575, 1.476895, -0.8228309, 1, 1, 1, 1, 1,
0.850199, -0.7256664, 1.580286, 1, 1, 1, 1, 1,
0.850233, 2.381916, 0.1956901, 1, 1, 1, 1, 1,
0.851604, -1.000703, 1.93149, 1, 1, 1, 1, 1,
0.8519719, -0.5458022, 2.684003, 1, 1, 1, 1, 1,
0.8616946, -0.6040655, 2.670048, 1, 1, 1, 1, 1,
0.8689152, -0.5838719, 2.71243, 1, 1, 1, 1, 1,
0.8745582, -0.9306057, 4.019501, 1, 1, 1, 1, 1,
0.8777249, -1.064873, 2.833639, 1, 1, 1, 1, 1,
0.8871349, 0.3551981, 0.7873686, 0, 0, 1, 1, 1,
0.8922907, -0.08292534, 0.6975969, 1, 0, 0, 1, 1,
0.8923774, -0.6740627, 2.009029, 1, 0, 0, 1, 1,
0.8927284, -0.6567687, 3.238626, 1, 0, 0, 1, 1,
0.9128391, 0.4543157, 2.26942, 1, 0, 0, 1, 1,
0.915747, 0.5094676, 0.826566, 1, 0, 0, 1, 1,
0.9159727, 0.06570801, 0.8417535, 0, 0, 0, 1, 1,
0.918896, 0.5976084, 0.8636448, 0, 0, 0, 1, 1,
0.9304059, -1.627848, 1.434063, 0, 0, 0, 1, 1,
0.9378664, -0.2531464, 2.814975, 0, 0, 0, 1, 1,
0.9419729, 0.8612024, 0.005731777, 0, 0, 0, 1, 1,
0.9429218, 1.372032, -0.1210484, 0, 0, 0, 1, 1,
0.9441963, -0.4474766, 1.112382, 0, 0, 0, 1, 1,
0.9546052, 0.6224633, 0.7255008, 1, 1, 1, 1, 1,
0.9598061, 1.063355, -0.4293459, 1, 1, 1, 1, 1,
0.9623789, -1.841068, 1.575958, 1, 1, 1, 1, 1,
0.9722047, 0.3570093, 1.633561, 1, 1, 1, 1, 1,
0.9725713, -0.0938544, 1.678585, 1, 1, 1, 1, 1,
0.9745305, 2.186592, 0.9826375, 1, 1, 1, 1, 1,
0.9938257, -0.7306397, 1.552209, 1, 1, 1, 1, 1,
1.003855, -2.035131, 2.363345, 1, 1, 1, 1, 1,
1.007913, 0.1064816, 1.998211, 1, 1, 1, 1, 1,
1.008536, 0.01325429, 0.4666862, 1, 1, 1, 1, 1,
1.02569, 0.9373307, 0.9749261, 1, 1, 1, 1, 1,
1.028438, 0.5591311, 0.1168977, 1, 1, 1, 1, 1,
1.03682, -0.1280198, 2.37571, 1, 1, 1, 1, 1,
1.037026, 1.396768, -0.2990003, 1, 1, 1, 1, 1,
1.040291, 1.04496, 2.551573, 1, 1, 1, 1, 1,
1.04638, 0.6080389, 0.3426487, 0, 0, 1, 1, 1,
1.053798, 0.6254819, -0.404034, 1, 0, 0, 1, 1,
1.056201, 2.225082, -0.248591, 1, 0, 0, 1, 1,
1.056599, 0.6472584, 0.9387905, 1, 0, 0, 1, 1,
1.060261, -0.001590823, 2.710985, 1, 0, 0, 1, 1,
1.060573, 1.13999, 1.114907, 1, 0, 0, 1, 1,
1.065728, 0.4573476, -0.7787377, 0, 0, 0, 1, 1,
1.074939, -0.7370434, 3.558126, 0, 0, 0, 1, 1,
1.076572, -1.044374, 2.453513, 0, 0, 0, 1, 1,
1.076613, -0.6153321, 2.226981, 0, 0, 0, 1, 1,
1.085806, -1.238112, 1.938886, 0, 0, 0, 1, 1,
1.093533, 1.527809, 0.185256, 0, 0, 0, 1, 1,
1.094656, -0.4840552, 3.39064, 0, 0, 0, 1, 1,
1.094832, 1.450237, -0.8203071, 1, 1, 1, 1, 1,
1.106135, -0.8709921, 2.0921, 1, 1, 1, 1, 1,
1.109688, -0.1592852, 1.8651, 1, 1, 1, 1, 1,
1.114375, 0.5291427, 1.201057, 1, 1, 1, 1, 1,
1.115537, -1.110739, 0.96732, 1, 1, 1, 1, 1,
1.117326, 0.343614, 1.104876, 1, 1, 1, 1, 1,
1.118515, 1.816829, 1.053845, 1, 1, 1, 1, 1,
1.120925, 0.2205618, 1.900687, 1, 1, 1, 1, 1,
1.122808, 0.07609868, 2.917945, 1, 1, 1, 1, 1,
1.126828, 0.3232758, 2.451021, 1, 1, 1, 1, 1,
1.131288, 0.4113225, -0.2735222, 1, 1, 1, 1, 1,
1.133598, 0.3512126, 1.59836, 1, 1, 1, 1, 1,
1.151955, 0.7663158, 0.2417647, 1, 1, 1, 1, 1,
1.153523, 0.1697145, 3.37755, 1, 1, 1, 1, 1,
1.158276, 0.9063721, 2.080489, 1, 1, 1, 1, 1,
1.160952, -1.063608, 1.730851, 0, 0, 1, 1, 1,
1.169205, -0.817645, 2.214409, 1, 0, 0, 1, 1,
1.173894, -0.9683937, 1.898306, 1, 0, 0, 1, 1,
1.176188, -0.2069052, 1.093123, 1, 0, 0, 1, 1,
1.176533, -1.15242, 0.8752621, 1, 0, 0, 1, 1,
1.180454, 1.363355, 2.637485, 1, 0, 0, 1, 1,
1.185766, 0.6319866, 1.281745, 0, 0, 0, 1, 1,
1.186586, -0.357984, 4.068659, 0, 0, 0, 1, 1,
1.191377, -0.8482245, 3.226324, 0, 0, 0, 1, 1,
1.192832, -1.037989, 2.305527, 0, 0, 0, 1, 1,
1.200825, -0.91088, 3.830454, 0, 0, 0, 1, 1,
1.201493, 0.459443, 1.333629, 0, 0, 0, 1, 1,
1.203053, -0.362971, 0.6242997, 0, 0, 0, 1, 1,
1.20456, -0.9482791, 3.267391, 1, 1, 1, 1, 1,
1.215366, -1.346062, 3.328479, 1, 1, 1, 1, 1,
1.221922, 0.9513184, 1.358605, 1, 1, 1, 1, 1,
1.228455, 0.1887524, 1.166522, 1, 1, 1, 1, 1,
1.233233, -1.030937, 1.677203, 1, 1, 1, 1, 1,
1.238218, -1.633166, 1.094055, 1, 1, 1, 1, 1,
1.23869, 0.6588913, 0.6384529, 1, 1, 1, 1, 1,
1.241046, -1.312518, 2.396274, 1, 1, 1, 1, 1,
1.245398, 0.08974637, 0.8350426, 1, 1, 1, 1, 1,
1.256306, -0.7128725, 0.6943787, 1, 1, 1, 1, 1,
1.263058, 0.7782124, 1.904399, 1, 1, 1, 1, 1,
1.284379, 1.498599, 1.353431, 1, 1, 1, 1, 1,
1.291604, 0.168852, 0.5478604, 1, 1, 1, 1, 1,
1.294127, 0.06305456, 1.343715, 1, 1, 1, 1, 1,
1.300661, -2.223902, 2.781497, 1, 1, 1, 1, 1,
1.305364, 1.234489, 1.058187, 0, 0, 1, 1, 1,
1.312224, -0.2197152, 0.240388, 1, 0, 0, 1, 1,
1.31674, -0.7476294, 0.9814555, 1, 0, 0, 1, 1,
1.321746, -3.145167, 2.83191, 1, 0, 0, 1, 1,
1.324558, 0.6282378, 0.8050107, 1, 0, 0, 1, 1,
1.326654, -0.7677585, 1.658783, 1, 0, 0, 1, 1,
1.34236, 1.545323, 1.180699, 0, 0, 0, 1, 1,
1.344201, -0.6023949, 4.002205, 0, 0, 0, 1, 1,
1.349534, 0.9678018, 0.5028229, 0, 0, 0, 1, 1,
1.354193, 0.5779007, 1.678898, 0, 0, 0, 1, 1,
1.357619, -0.1891654, 2.356761, 0, 0, 0, 1, 1,
1.358755, 0.6800503, 2.471565, 0, 0, 0, 1, 1,
1.368569, 0.6109912, 2.306296, 0, 0, 0, 1, 1,
1.378099, -1.333378, 2.028321, 1, 1, 1, 1, 1,
1.381799, 0.9323446, 0.7976828, 1, 1, 1, 1, 1,
1.384534, -1.052337, -0.9255669, 1, 1, 1, 1, 1,
1.385109, -0.3641132, 1.18664, 1, 1, 1, 1, 1,
1.387115, 1.177963, 2.381455, 1, 1, 1, 1, 1,
1.388649, 0.8243493, 1.946274, 1, 1, 1, 1, 1,
1.397152, -0.1867017, 1.648488, 1, 1, 1, 1, 1,
1.397305, -0.88162, 2.26873, 1, 1, 1, 1, 1,
1.412017, 0.05393173, 0.6091592, 1, 1, 1, 1, 1,
1.419971, -1.27124, 3.880164, 1, 1, 1, 1, 1,
1.436751, 0.9878377, 0.3133766, 1, 1, 1, 1, 1,
1.438345, -0.2807603, 0.8447735, 1, 1, 1, 1, 1,
1.444237, -0.3514894, 1.895601, 1, 1, 1, 1, 1,
1.459043, 2.324023, 0.4004292, 1, 1, 1, 1, 1,
1.459082, -0.9047692, 3.237091, 1, 1, 1, 1, 1,
1.459792, 1.278723, 0.4499658, 0, 0, 1, 1, 1,
1.474106, 0.04914035, -1.179528, 1, 0, 0, 1, 1,
1.487859, -2.456089, 1.678126, 1, 0, 0, 1, 1,
1.497036, -1.510122, 1.981489, 1, 0, 0, 1, 1,
1.497405, -0.00953568, 2.203851, 1, 0, 0, 1, 1,
1.502137, 0.1618271, 0.7165575, 1, 0, 0, 1, 1,
1.503924, -0.6417892, 3.453691, 0, 0, 0, 1, 1,
1.512016, 0.5664626, 1.951162, 0, 0, 0, 1, 1,
1.513127, -0.458843, 3.548229, 0, 0, 0, 1, 1,
1.513963, -0.2102654, 2.248924, 0, 0, 0, 1, 1,
1.518621, -1.719703, 3.99776, 0, 0, 0, 1, 1,
1.523497, 0.744651, 1.728874, 0, 0, 0, 1, 1,
1.539717, -2.003706, 2.32098, 0, 0, 0, 1, 1,
1.554753, 1.087677, -0.09071667, 1, 1, 1, 1, 1,
1.555574, 0.6690202, 2.503789, 1, 1, 1, 1, 1,
1.55691, 1.047117, -0.1961546, 1, 1, 1, 1, 1,
1.561453, -0.8491937, 0.3442189, 1, 1, 1, 1, 1,
1.562428, -1.385885, 2.85235, 1, 1, 1, 1, 1,
1.5627, -0.2344469, -0.8371618, 1, 1, 1, 1, 1,
1.56396, 0.7786306, -1.422419, 1, 1, 1, 1, 1,
1.583244, -0.2562424, 1.839288, 1, 1, 1, 1, 1,
1.598749, 0.3219995, 0.8194451, 1, 1, 1, 1, 1,
1.617969, -0.02224363, 1.665921, 1, 1, 1, 1, 1,
1.623317, -0.865806, 1.988716, 1, 1, 1, 1, 1,
1.627838, -2.270101, 1.209342, 1, 1, 1, 1, 1,
1.631025, -1.007986, 2.253091, 1, 1, 1, 1, 1,
1.666121, 0.3056184, 2.447824, 1, 1, 1, 1, 1,
1.669188, -0.4766679, 1.621539, 1, 1, 1, 1, 1,
1.674254, 0.9112727, 3.787778, 0, 0, 1, 1, 1,
1.683701, 1.245889, 1.239122, 1, 0, 0, 1, 1,
1.689317, -0.8230448, 4.729921, 1, 0, 0, 1, 1,
1.691634, -0.2509412, 1.644098, 1, 0, 0, 1, 1,
1.701138, -0.3394094, 2.526798, 1, 0, 0, 1, 1,
1.722455, -0.5350928, 2.199078, 1, 0, 0, 1, 1,
1.736832, 0.5154582, 1.298589, 0, 0, 0, 1, 1,
1.743904, -0.4494999, 0.7747608, 0, 0, 0, 1, 1,
1.749602, 0.3346259, 3.301905, 0, 0, 0, 1, 1,
1.761049, 1.253878, 0.6013363, 0, 0, 0, 1, 1,
1.770915, -0.5925692, 2.322072, 0, 0, 0, 1, 1,
1.770918, -0.9695004, 1.585297, 0, 0, 0, 1, 1,
1.780871, -0.7890247, 1.370156, 0, 0, 0, 1, 1,
1.809341, 1.160928, -0.636833, 1, 1, 1, 1, 1,
1.813107, -0.8286489, 3.188105, 1, 1, 1, 1, 1,
1.814175, 0.006178959, 1.879301, 1, 1, 1, 1, 1,
1.817887, 0.808909, 0.9945381, 1, 1, 1, 1, 1,
1.821662, -1.247502, 1.26919, 1, 1, 1, 1, 1,
1.825218, 1.749276, 1.519265, 1, 1, 1, 1, 1,
1.84792, -0.07487198, 1.174292, 1, 1, 1, 1, 1,
1.878949, -0.163903, 0.4759575, 1, 1, 1, 1, 1,
1.953285, -0.4213199, 2.117011, 1, 1, 1, 1, 1,
2.033071, -0.07373592, 0.6504185, 1, 1, 1, 1, 1,
2.041929, -0.6444651, 1.845017, 1, 1, 1, 1, 1,
2.062409, -0.1834159, 0.7203799, 1, 1, 1, 1, 1,
2.094773, 0.6713975, 2.367439, 1, 1, 1, 1, 1,
2.098317, -0.5255708, -0.07982416, 1, 1, 1, 1, 1,
2.104288, -2.344655, 2.230578, 1, 1, 1, 1, 1,
2.11655, -0.9420137, 1.571334, 0, 0, 1, 1, 1,
2.122248, -1.608231, 1.510535, 1, 0, 0, 1, 1,
2.131746, -0.107509, 2.257231, 1, 0, 0, 1, 1,
2.150248, 0.8393465, -0.07115957, 1, 0, 0, 1, 1,
2.162271, 1.358846, 1.339127, 1, 0, 0, 1, 1,
2.193742, 1.919368, 0.3787549, 1, 0, 0, 1, 1,
2.270775, -1.290329, 1.213226, 0, 0, 0, 1, 1,
2.276168, 0.3127427, 1.550282, 0, 0, 0, 1, 1,
2.334332, 1.113783, -0.6593068, 0, 0, 0, 1, 1,
2.346006, 0.340238, 0.4920252, 0, 0, 0, 1, 1,
2.395579, -0.690529, 2.180542, 0, 0, 0, 1, 1,
2.424402, 0.08839843, 0.665715, 0, 0, 0, 1, 1,
2.462687, -0.5163416, 1.508314, 0, 0, 0, 1, 1,
2.488767, 0.659278, 3.687611, 1, 1, 1, 1, 1,
2.562618, -1.032128, 1.52293, 1, 1, 1, 1, 1,
2.571045, -0.481758, 1.511076, 1, 1, 1, 1, 1,
2.580615, -1.991594, 2.167867, 1, 1, 1, 1, 1,
2.61607, -0.5766776, 1.767142, 1, 1, 1, 1, 1,
2.844751, 0.07548594, 1.485352, 1, 1, 1, 1, 1,
3.013829, -0.1114823, 1.431166, 1, 1, 1, 1, 1
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
var radius = 9.269174;
var distance = 32.55758;
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
mvMatrix.translate( 0.1934166, 0.1393334, 0.1955764 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.55758);
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
