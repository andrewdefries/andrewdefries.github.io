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
-3.350188, -1.685968, -3.69415, 1, 0, 0, 1,
-3.122036, 0.3266414, -2.688626, 1, 0.007843138, 0, 1,
-2.794547, -0.6864657, -2.013752, 1, 0.01176471, 0, 1,
-2.721629, 0.8178961, -1.022164, 1, 0.01960784, 0, 1,
-2.593238, -1.902337, -2.276389, 1, 0.02352941, 0, 1,
-2.538218, 0.6926197, -1.56986, 1, 0.03137255, 0, 1,
-2.499372, -0.2817675, -1.961545, 1, 0.03529412, 0, 1,
-2.496274, 0.2812605, -2.381463, 1, 0.04313726, 0, 1,
-2.34625, -0.2047566, -1.882856, 1, 0.04705882, 0, 1,
-2.243876, -1.263484, -4.122512, 1, 0.05490196, 0, 1,
-2.233873, 0.4355698, -1.559748, 1, 0.05882353, 0, 1,
-2.232669, 0.8342168, -2.139111, 1, 0.06666667, 0, 1,
-2.230736, 0.05194551, -3.401715, 1, 0.07058824, 0, 1,
-2.165242, 0.6188783, -0.6866791, 1, 0.07843138, 0, 1,
-2.159596, 0.8657903, -0.4601225, 1, 0.08235294, 0, 1,
-2.145351, -0.6806222, -2.291367, 1, 0.09019608, 0, 1,
-2.037796, -0.04274504, -2.322951, 1, 0.09411765, 0, 1,
-2.00642, -2.701701, -1.690834, 1, 0.1019608, 0, 1,
-1.94873, -0.4328241, -1.92868, 1, 0.1098039, 0, 1,
-1.917343, -0.3736835, 0.5835949, 1, 0.1137255, 0, 1,
-1.915739, -1.258322, -3.668266, 1, 0.1215686, 0, 1,
-1.900771, 0.4976554, -1.874552, 1, 0.1254902, 0, 1,
-1.869282, -1.227129, -0.04084472, 1, 0.1333333, 0, 1,
-1.859291, 1.207366, -0.8015489, 1, 0.1372549, 0, 1,
-1.854275, -1.642449, -1.924057, 1, 0.145098, 0, 1,
-1.833201, 1.582124, -0.9935172, 1, 0.1490196, 0, 1,
-1.830198, -0.1799268, -2.293198, 1, 0.1568628, 0, 1,
-1.826106, 1.767405, -0.1804851, 1, 0.1607843, 0, 1,
-1.823718, -0.2075886, -1.362705, 1, 0.1686275, 0, 1,
-1.819176, 0.1884697, -2.141424, 1, 0.172549, 0, 1,
-1.811924, 1.39007, -0.5679852, 1, 0.1803922, 0, 1,
-1.805239, 0.4013784, -3.290491, 1, 0.1843137, 0, 1,
-1.786772, 1.374483, -1.777478, 1, 0.1921569, 0, 1,
-1.777704, -0.245375, -3.465103, 1, 0.1960784, 0, 1,
-1.743965, 1.13656, -0.3563052, 1, 0.2039216, 0, 1,
-1.732464, -0.1424868, -1.117211, 1, 0.2117647, 0, 1,
-1.718307, 0.571702, -0.9714504, 1, 0.2156863, 0, 1,
-1.694021, -1.695669, -3.41768, 1, 0.2235294, 0, 1,
-1.688115, -0.9964374, -1.156037, 1, 0.227451, 0, 1,
-1.674486, 1.630327, -0.1568774, 1, 0.2352941, 0, 1,
-1.662276, -0.6267228, -3.113464, 1, 0.2392157, 0, 1,
-1.650608, 0.123285, -1.475909, 1, 0.2470588, 0, 1,
-1.648128, -0.02565959, -0.5363702, 1, 0.2509804, 0, 1,
-1.639208, -0.4249495, -1.102239, 1, 0.2588235, 0, 1,
-1.631197, 0.6468294, -0.2136024, 1, 0.2627451, 0, 1,
-1.628219, 0.556531, -0.01191592, 1, 0.2705882, 0, 1,
-1.622871, -0.817423, -1.560004, 1, 0.2745098, 0, 1,
-1.612953, 0.3922553, -1.62311, 1, 0.282353, 0, 1,
-1.60102, -1.990905, -2.411482, 1, 0.2862745, 0, 1,
-1.600351, 1.545012, -0.2470926, 1, 0.2941177, 0, 1,
-1.59076, 0.9409997, 0.2109831, 1, 0.3019608, 0, 1,
-1.590724, 1.433972, -0.5382204, 1, 0.3058824, 0, 1,
-1.59018, 1.576505, -0.4024803, 1, 0.3137255, 0, 1,
-1.586368, 0.8133909, -1.081552, 1, 0.3176471, 0, 1,
-1.583889, -0.2779693, -3.616825, 1, 0.3254902, 0, 1,
-1.573635, -0.9939961, -1.207882, 1, 0.3294118, 0, 1,
-1.561013, 0.2303782, -2.693977, 1, 0.3372549, 0, 1,
-1.544439, -0.01052974, 0.745208, 1, 0.3411765, 0, 1,
-1.535603, 1.01915, 0.3081169, 1, 0.3490196, 0, 1,
-1.531191, -0.3411809, -2.604324, 1, 0.3529412, 0, 1,
-1.527651, 1.369915, -1.831352, 1, 0.3607843, 0, 1,
-1.523332, 2.335972, -1.700823, 1, 0.3647059, 0, 1,
-1.523083, -0.2899463, -1.698786, 1, 0.372549, 0, 1,
-1.522692, -1.834543, -4.150724, 1, 0.3764706, 0, 1,
-1.501938, -0.8466279, -1.829148, 1, 0.3843137, 0, 1,
-1.500719, 1.176061, -1.374011, 1, 0.3882353, 0, 1,
-1.497851, -2.104286, -1.152817, 1, 0.3960784, 0, 1,
-1.485914, -0.6409308, -1.814599, 1, 0.4039216, 0, 1,
-1.48169, -1.701709, -3.473785, 1, 0.4078431, 0, 1,
-1.476473, -1.339999, -1.131456, 1, 0.4156863, 0, 1,
-1.469924, 0.6988384, 0.5222808, 1, 0.4196078, 0, 1,
-1.425978, 0.4562721, -0.5395442, 1, 0.427451, 0, 1,
-1.425436, -1.586, -1.590678, 1, 0.4313726, 0, 1,
-1.421039, 0.5182307, -3.044871, 1, 0.4392157, 0, 1,
-1.419142, 1.27244, -1.969742, 1, 0.4431373, 0, 1,
-1.414161, -1.223542, -0.848875, 1, 0.4509804, 0, 1,
-1.413282, 0.4432038, -2.308975, 1, 0.454902, 0, 1,
-1.41095, -1.303806, -3.284752, 1, 0.4627451, 0, 1,
-1.408611, 2.054401, -0.9350715, 1, 0.4666667, 0, 1,
-1.404998, 0.7194772, -0.4149984, 1, 0.4745098, 0, 1,
-1.401399, 1.227019, -0.2166029, 1, 0.4784314, 0, 1,
-1.401265, -0.5266398, -2.338863, 1, 0.4862745, 0, 1,
-1.398021, -0.807552, -0.7241303, 1, 0.4901961, 0, 1,
-1.397788, 0.0709473, -2.717803, 1, 0.4980392, 0, 1,
-1.368875, 1.226292, -1.688442, 1, 0.5058824, 0, 1,
-1.368597, 0.7006831, -0.1682191, 1, 0.509804, 0, 1,
-1.352877, -0.1849504, -0.9227767, 1, 0.5176471, 0, 1,
-1.348631, -1.542258, -3.05999, 1, 0.5215687, 0, 1,
-1.345762, -0.3771031, -0.238024, 1, 0.5294118, 0, 1,
-1.338577, 2.227542, 0.71727, 1, 0.5333334, 0, 1,
-1.337212, -0.4941423, -1.726584, 1, 0.5411765, 0, 1,
-1.329181, -2.119011, -1.211577, 1, 0.5450981, 0, 1,
-1.329077, 0.2740902, -1.408046, 1, 0.5529412, 0, 1,
-1.328926, 0.3202918, -1.404843, 1, 0.5568628, 0, 1,
-1.325787, 0.1476038, -1.270333, 1, 0.5647059, 0, 1,
-1.321044, 2.826104, 0.07865943, 1, 0.5686275, 0, 1,
-1.319174, 0.1025241, -1.831346, 1, 0.5764706, 0, 1,
-1.308116, -0.5319238, -0.7507839, 1, 0.5803922, 0, 1,
-1.298991, -0.4509612, -3.43112, 1, 0.5882353, 0, 1,
-1.291005, 0.4738429, -0.5768991, 1, 0.5921569, 0, 1,
-1.284634, 0.06755236, 0.4729498, 1, 0.6, 0, 1,
-1.282348, -1.155717, -4.473035, 1, 0.6078432, 0, 1,
-1.28146, 0.3974866, -2.751049, 1, 0.6117647, 0, 1,
-1.265252, -0.4409136, -1.137051, 1, 0.6196079, 0, 1,
-1.261334, 0.1844045, -1.371931, 1, 0.6235294, 0, 1,
-1.261018, 0.3059084, -2.242092, 1, 0.6313726, 0, 1,
-1.244776, 0.5660619, -3.975583, 1, 0.6352941, 0, 1,
-1.241796, 1.42112, 1.4557, 1, 0.6431373, 0, 1,
-1.237334, 2.12288, -0.8002262, 1, 0.6470588, 0, 1,
-1.236932, 0.03438566, -3.01336, 1, 0.654902, 0, 1,
-1.236713, 0.1895781, 0.2246697, 1, 0.6588235, 0, 1,
-1.231547, -0.3718607, -1.720163, 1, 0.6666667, 0, 1,
-1.230608, 0.7448925, -2.53732, 1, 0.6705883, 0, 1,
-1.225198, -1.094822, -2.871796, 1, 0.6784314, 0, 1,
-1.224471, -1.527033, -3.484163, 1, 0.682353, 0, 1,
-1.220332, -0.2469686, -2.569208, 1, 0.6901961, 0, 1,
-1.219745, -2.831523, -2.77266, 1, 0.6941177, 0, 1,
-1.216176, 1.097773, 0.3519035, 1, 0.7019608, 0, 1,
-1.207313, -0.5203823, -3.798042, 1, 0.7098039, 0, 1,
-1.201714, 1.468691, -0.8206406, 1, 0.7137255, 0, 1,
-1.1985, -1.184785, -3.127033, 1, 0.7215686, 0, 1,
-1.193964, -0.5968075, -1.283391, 1, 0.7254902, 0, 1,
-1.190573, -0.3704644, -0.7812783, 1, 0.7333333, 0, 1,
-1.182637, 1.050108, 0.6641395, 1, 0.7372549, 0, 1,
-1.163268, -0.1176851, -0.9062394, 1, 0.7450981, 0, 1,
-1.162641, 1.36191, -0.7785292, 1, 0.7490196, 0, 1,
-1.159367, -1.286657, -1.52302, 1, 0.7568628, 0, 1,
-1.158436, -0.2859981, -0.4946959, 1, 0.7607843, 0, 1,
-1.148603, -0.2926545, -0.9283781, 1, 0.7686275, 0, 1,
-1.14567, 0.1511531, -1.047284, 1, 0.772549, 0, 1,
-1.138519, 1.755903, -0.9925121, 1, 0.7803922, 0, 1,
-1.125915, -0.219402, -2.111814, 1, 0.7843137, 0, 1,
-1.120151, 0.4586128, -3.211073, 1, 0.7921569, 0, 1,
-1.117231, -0.3637672, -0.5644379, 1, 0.7960784, 0, 1,
-1.114438, 0.7273915, -1.180607, 1, 0.8039216, 0, 1,
-1.106945, 1.499104, 0.7982845, 1, 0.8117647, 0, 1,
-1.105148, 0.09558026, -3.204551, 1, 0.8156863, 0, 1,
-1.101371, 0.03363553, -1.036824, 1, 0.8235294, 0, 1,
-1.100583, 1.594898, -1.06619, 1, 0.827451, 0, 1,
-1.094606, 0.6930419, -1.314412, 1, 0.8352941, 0, 1,
-1.093247, -1.770235, -3.562003, 1, 0.8392157, 0, 1,
-1.08953, -1.934961, -1.483847, 1, 0.8470588, 0, 1,
-1.085609, 1.348086, -2.616709, 1, 0.8509804, 0, 1,
-1.079162, -0.470649, -1.685267, 1, 0.8588235, 0, 1,
-1.077823, 2.086165, -0.8896767, 1, 0.8627451, 0, 1,
-1.074355, -0.02400353, -1.124826, 1, 0.8705882, 0, 1,
-1.068225, -1.766998, -1.478743, 1, 0.8745098, 0, 1,
-1.068188, 0.8286919, -0.5390438, 1, 0.8823529, 0, 1,
-1.062763, -1.086264, -3.158054, 1, 0.8862745, 0, 1,
-1.049881, 0.07944423, -1.25559, 1, 0.8941177, 0, 1,
-1.048483, -1.202544, -3.118848, 1, 0.8980392, 0, 1,
-1.045176, -0.4522879, -2.348211, 1, 0.9058824, 0, 1,
-1.040333, 0.9013768, -1.492838, 1, 0.9137255, 0, 1,
-1.038173, -1.155019, -2.276291, 1, 0.9176471, 0, 1,
-1.034796, -0.8996699, -0.794469, 1, 0.9254902, 0, 1,
-1.032681, 1.092695, 1.106868, 1, 0.9294118, 0, 1,
-1.031439, 0.03591371, -2.716954, 1, 0.9372549, 0, 1,
-1.029393, -1.007802, -2.172081, 1, 0.9411765, 0, 1,
-1.02513, -0.9822899, -2.920002, 1, 0.9490196, 0, 1,
-1.024604, 0.5292569, -0.7596978, 1, 0.9529412, 0, 1,
-1.023094, 0.7210324, -0.716506, 1, 0.9607843, 0, 1,
-1.016643, -0.9058573, -0.3575057, 1, 0.9647059, 0, 1,
-1.016535, -0.8125582, -1.183755, 1, 0.972549, 0, 1,
-1.016507, 0.2070039, -0.9157557, 1, 0.9764706, 0, 1,
-1.015518, 0.220337, 0.3483004, 1, 0.9843137, 0, 1,
-1.003325, 0.9336399, -0.993086, 1, 0.9882353, 0, 1,
-1.001187, 1.271451, -1.899857, 1, 0.9960784, 0, 1,
-0.9972315, -1.636575, -1.775092, 0.9960784, 1, 0, 1,
-0.9933095, 0.9686095, -1.678337, 0.9921569, 1, 0, 1,
-0.9933057, -0.3297771, -3.27694, 0.9843137, 1, 0, 1,
-0.991801, -1.519548, -2.813602, 0.9803922, 1, 0, 1,
-0.9869928, -1.780673, -4.828616, 0.972549, 1, 0, 1,
-0.986369, 0.8738394, -1.892464, 0.9686275, 1, 0, 1,
-0.9807129, -0.2526912, -1.108039, 0.9607843, 1, 0, 1,
-0.9676801, -0.8944827, -2.088731, 0.9568627, 1, 0, 1,
-0.960452, -1.201477, -3.451614, 0.9490196, 1, 0, 1,
-0.9602219, 2.056919, -0.6108583, 0.945098, 1, 0, 1,
-0.9586315, -0.5049509, -2.055871, 0.9372549, 1, 0, 1,
-0.9565338, 1.75604, -1.046157, 0.9333333, 1, 0, 1,
-0.9558599, 1.771149, 1.063692, 0.9254902, 1, 0, 1,
-0.9554578, 0.2309888, -0.955081, 0.9215686, 1, 0, 1,
-0.9477702, 0.3574186, -0.07467061, 0.9137255, 1, 0, 1,
-0.9420565, -1.656879, -4.1875, 0.9098039, 1, 0, 1,
-0.9418772, -0.9716066, -3.037474, 0.9019608, 1, 0, 1,
-0.9337922, -0.8283284, -1.321427, 0.8941177, 1, 0, 1,
-0.9281318, 1.690888, -0.9537335, 0.8901961, 1, 0, 1,
-0.9206194, -0.01040521, -2.721217, 0.8823529, 1, 0, 1,
-0.9151416, 2.495164, -0.1229914, 0.8784314, 1, 0, 1,
-0.9149081, -0.2364562, -0.9804301, 0.8705882, 1, 0, 1,
-0.9120081, -0.3646459, -1.881508, 0.8666667, 1, 0, 1,
-0.9112654, 0.5233744, -0.6035471, 0.8588235, 1, 0, 1,
-0.9096778, 0.03954435, -1.565325, 0.854902, 1, 0, 1,
-0.9093831, -1.751037, -1.109254, 0.8470588, 1, 0, 1,
-0.9069118, -0.5948945, -2.15953, 0.8431373, 1, 0, 1,
-0.906801, -0.6258143, -2.558418, 0.8352941, 1, 0, 1,
-0.8988086, -0.6745831, -1.203879, 0.8313726, 1, 0, 1,
-0.8979218, 0.3044964, -0.9951832, 0.8235294, 1, 0, 1,
-0.8974085, -1.24043, -3.085643, 0.8196079, 1, 0, 1,
-0.8897541, 0.3022199, -0.903919, 0.8117647, 1, 0, 1,
-0.887799, 0.8803628, -0.7488626, 0.8078431, 1, 0, 1,
-0.8854805, -0.843799, -1.796746, 0.8, 1, 0, 1,
-0.8811979, 0.08526202, -0.6479986, 0.7921569, 1, 0, 1,
-0.8784103, 0.4935512, 0.1609292, 0.7882353, 1, 0, 1,
-0.8697888, -0.1573977, 0.5813078, 0.7803922, 1, 0, 1,
-0.8587564, 0.7484242, -1.63651, 0.7764706, 1, 0, 1,
-0.8465, -0.01964795, -3.42321, 0.7686275, 1, 0, 1,
-0.8341085, -0.003023786, -2.014733, 0.7647059, 1, 0, 1,
-0.8258901, 0.02553516, -1.488779, 0.7568628, 1, 0, 1,
-0.8208469, 0.7528104, -1.195626, 0.7529412, 1, 0, 1,
-0.8204657, 0.4332208, -1.837549, 0.7450981, 1, 0, 1,
-0.8196219, 0.1911821, -0.1715158, 0.7411765, 1, 0, 1,
-0.8195763, -0.1503655, -2.154267, 0.7333333, 1, 0, 1,
-0.8177968, 1.318808, -0.05343811, 0.7294118, 1, 0, 1,
-0.8152795, -1.097856, -1.291765, 0.7215686, 1, 0, 1,
-0.8127176, 0.4358475, -1.121021, 0.7176471, 1, 0, 1,
-0.8093283, -2.377825, -1.594299, 0.7098039, 1, 0, 1,
-0.804834, 0.3640453, -2.071551, 0.7058824, 1, 0, 1,
-0.8038316, 2.735789, -1.167917, 0.6980392, 1, 0, 1,
-0.8013932, -0.7361705, -2.151504, 0.6901961, 1, 0, 1,
-0.7839538, -0.1393906, -0.6558685, 0.6862745, 1, 0, 1,
-0.7827144, -1.595137, -2.215488, 0.6784314, 1, 0, 1,
-0.7799553, -0.3833396, -1.858544, 0.6745098, 1, 0, 1,
-0.7755903, 0.5437998, -2.078169, 0.6666667, 1, 0, 1,
-0.7750579, -0.02229968, -2.855005, 0.6627451, 1, 0, 1,
-0.7639997, 0.3966084, -1.725127, 0.654902, 1, 0, 1,
-0.7610018, -0.6934926, -1.437319, 0.6509804, 1, 0, 1,
-0.7550686, 0.166284, -0.9187298, 0.6431373, 1, 0, 1,
-0.7537764, -0.3084082, -1.710973, 0.6392157, 1, 0, 1,
-0.7519795, 0.7885303, 1.674292, 0.6313726, 1, 0, 1,
-0.7503539, 1.195499, 0.3306874, 0.627451, 1, 0, 1,
-0.7415426, 0.8855702, -1.016816, 0.6196079, 1, 0, 1,
-0.7380101, -0.1848945, -1.214619, 0.6156863, 1, 0, 1,
-0.7356725, 0.1199092, 0.2093932, 0.6078432, 1, 0, 1,
-0.731741, 0.7700761, -1.080258, 0.6039216, 1, 0, 1,
-0.7290488, 1.79227, -0.5024784, 0.5960785, 1, 0, 1,
-0.7271429, 0.9855407, -0.3865911, 0.5882353, 1, 0, 1,
-0.7253633, -0.05345946, -0.4832219, 0.5843138, 1, 0, 1,
-0.7241417, -0.1757403, -2.81936, 0.5764706, 1, 0, 1,
-0.7197023, 1.19734, 0.74833, 0.572549, 1, 0, 1,
-0.7189213, -1.629107, -0.5839434, 0.5647059, 1, 0, 1,
-0.7091894, -0.738528, -1.034621, 0.5607843, 1, 0, 1,
-0.6996896, -0.129943, -2.390162, 0.5529412, 1, 0, 1,
-0.6845708, 0.8305585, -2.417818, 0.5490196, 1, 0, 1,
-0.6837555, 0.9016246, -0.9241665, 0.5411765, 1, 0, 1,
-0.682022, 1.055285, -0.6893216, 0.5372549, 1, 0, 1,
-0.6730133, 0.4528428, -1.443014, 0.5294118, 1, 0, 1,
-0.6633993, -0.6723207, -3.486025, 0.5254902, 1, 0, 1,
-0.6631141, 0.07749252, -1.367747, 0.5176471, 1, 0, 1,
-0.6616671, -0.9455574, -2.485528, 0.5137255, 1, 0, 1,
-0.6593503, -0.2412466, -1.030404, 0.5058824, 1, 0, 1,
-0.6584003, 1.383009, -0.532466, 0.5019608, 1, 0, 1,
-0.6572109, 0.7592447, -0.2150623, 0.4941176, 1, 0, 1,
-0.6554198, 0.5767688, 0.7072261, 0.4862745, 1, 0, 1,
-0.6509201, -0.6921741, -3.424399, 0.4823529, 1, 0, 1,
-0.6433343, -2.394176, -3.601853, 0.4745098, 1, 0, 1,
-0.6427505, -0.8870395, -2.19462, 0.4705882, 1, 0, 1,
-0.6404474, -0.7767613, -3.797646, 0.4627451, 1, 0, 1,
-0.6284165, 0.422325, -1.369391, 0.4588235, 1, 0, 1,
-0.6265979, 0.3382626, -1.40239, 0.4509804, 1, 0, 1,
-0.6264068, -0.3168667, 1.524021, 0.4470588, 1, 0, 1,
-0.6249177, -0.6751527, -1.240923, 0.4392157, 1, 0, 1,
-0.624097, -0.04653061, -1.299965, 0.4352941, 1, 0, 1,
-0.6233229, -0.1189036, -1.322506, 0.427451, 1, 0, 1,
-0.6225414, 0.2194446, -2.645877, 0.4235294, 1, 0, 1,
-0.6212004, -0.3999807, -2.175113, 0.4156863, 1, 0, 1,
-0.6201832, 0.2151179, -0.5642222, 0.4117647, 1, 0, 1,
-0.613703, -1.942519, -1.333008, 0.4039216, 1, 0, 1,
-0.6131119, 0.5714557, 0.1979617, 0.3960784, 1, 0, 1,
-0.607658, -0.732197, -3.226794, 0.3921569, 1, 0, 1,
-0.6019021, -0.9540995, -0.9532261, 0.3843137, 1, 0, 1,
-0.5999587, 0.5473762, -1.087836, 0.3803922, 1, 0, 1,
-0.5935773, 0.5464274, -2.460584, 0.372549, 1, 0, 1,
-0.5900229, 0.8961308, -0.8093586, 0.3686275, 1, 0, 1,
-0.5772892, 1.785386, -1.520101, 0.3607843, 1, 0, 1,
-0.575038, 0.2219759, -1.108088, 0.3568628, 1, 0, 1,
-0.5720388, 1.29695, -0.2718496, 0.3490196, 1, 0, 1,
-0.5625063, -0.3172929, -1.607908, 0.345098, 1, 0, 1,
-0.5614462, 0.8518091, 0.1338295, 0.3372549, 1, 0, 1,
-0.5597128, 0.818873, -2.436753, 0.3333333, 1, 0, 1,
-0.5580986, 0.5796233, -1.323393, 0.3254902, 1, 0, 1,
-0.5536512, 1.828997, -0.6371068, 0.3215686, 1, 0, 1,
-0.5515864, 0.2029763, -0.3890083, 0.3137255, 1, 0, 1,
-0.5457086, -0.7083178, -2.578977, 0.3098039, 1, 0, 1,
-0.5421283, -0.6812847, -1.863235, 0.3019608, 1, 0, 1,
-0.5408266, 0.2220846, -0.2188544, 0.2941177, 1, 0, 1,
-0.5346898, -0.06052164, -3.073042, 0.2901961, 1, 0, 1,
-0.5317893, -0.8801981, -1.727564, 0.282353, 1, 0, 1,
-0.527252, -0.2487225, -1.830673, 0.2784314, 1, 0, 1,
-0.5271879, 1.16289, -0.5488721, 0.2705882, 1, 0, 1,
-0.5270023, 0.2443952, -0.4242254, 0.2666667, 1, 0, 1,
-0.523815, 0.4287696, -2.45517, 0.2588235, 1, 0, 1,
-0.5187119, -0.1994186, -1.693082, 0.254902, 1, 0, 1,
-0.5125101, 0.3066621, -0.7268565, 0.2470588, 1, 0, 1,
-0.5111625, -0.9945127, -4.223526, 0.2431373, 1, 0, 1,
-0.5088621, 0.3081995, 0.1511551, 0.2352941, 1, 0, 1,
-0.5077806, -1.447599, -2.18281, 0.2313726, 1, 0, 1,
-0.5065434, -0.4430276, -2.744202, 0.2235294, 1, 0, 1,
-0.5020693, -0.6458795, -3.406623, 0.2196078, 1, 0, 1,
-0.4943002, -0.2238235, -1.088856, 0.2117647, 1, 0, 1,
-0.4937936, -0.3809274, -1.185077, 0.2078431, 1, 0, 1,
-0.4915302, -0.1107466, -2.09499, 0.2, 1, 0, 1,
-0.4824539, -1.135946, -2.252552, 0.1921569, 1, 0, 1,
-0.4821695, -1.540689, -2.610376, 0.1882353, 1, 0, 1,
-0.480578, 0.7657979, -2.283087, 0.1803922, 1, 0, 1,
-0.4796655, -1.632114, -4.662139, 0.1764706, 1, 0, 1,
-0.4782939, 1.676128, -0.3504141, 0.1686275, 1, 0, 1,
-0.4705593, -0.01876948, -2.66234, 0.1647059, 1, 0, 1,
-0.4683625, -0.09222534, -2.132741, 0.1568628, 1, 0, 1,
-0.4673874, -0.1103963, -1.328375, 0.1529412, 1, 0, 1,
-0.4669808, -0.5990011, -1.69915, 0.145098, 1, 0, 1,
-0.4651174, -0.5766658, -2.576189, 0.1411765, 1, 0, 1,
-0.4591739, 1.383684, -0.06504066, 0.1333333, 1, 0, 1,
-0.4572024, -0.4532028, -3.501723, 0.1294118, 1, 0, 1,
-0.4526476, 0.2347035, -0.3563243, 0.1215686, 1, 0, 1,
-0.4470591, 0.04870626, -1.125103, 0.1176471, 1, 0, 1,
-0.4462546, 1.683541, -1.039487, 0.1098039, 1, 0, 1,
-0.4417383, 0.2676663, -1.235965, 0.1058824, 1, 0, 1,
-0.4374857, -2.240119, -2.793289, 0.09803922, 1, 0, 1,
-0.4341576, 0.657085, -0.08364133, 0.09019608, 1, 0, 1,
-0.4250286, 1.198858, -0.5903658, 0.08627451, 1, 0, 1,
-0.4229434, 2.17125, -2.003793, 0.07843138, 1, 0, 1,
-0.4202493, 1.053092, 1.500339, 0.07450981, 1, 0, 1,
-0.4183713, -1.593317, -2.375643, 0.06666667, 1, 0, 1,
-0.4131652, 0.004125629, -1.618344, 0.0627451, 1, 0, 1,
-0.4126616, 0.1927314, -1.942486, 0.05490196, 1, 0, 1,
-0.4032992, -1.573785, -2.317969, 0.05098039, 1, 0, 1,
-0.3950078, -1.174383, -3.878868, 0.04313726, 1, 0, 1,
-0.3925287, -1.527965, -2.034908, 0.03921569, 1, 0, 1,
-0.3894022, -0.9099332, -2.328909, 0.03137255, 1, 0, 1,
-0.3890175, -0.8901975, -2.243286, 0.02745098, 1, 0, 1,
-0.3820559, 0.1959621, -0.7903367, 0.01960784, 1, 0, 1,
-0.3800401, -0.9438342, -2.204963, 0.01568628, 1, 0, 1,
-0.3756743, -1.709447, -2.332026, 0.007843138, 1, 0, 1,
-0.3747078, 0.2918821, 0.2672004, 0.003921569, 1, 0, 1,
-0.3731258, 0.1261649, -1.407233, 0, 1, 0.003921569, 1,
-0.3729449, 0.005305881, -2.230247, 0, 1, 0.01176471, 1,
-0.3713251, 1.273123, -0.8619404, 0, 1, 0.01568628, 1,
-0.3681047, -0.2517098, -0.6399815, 0, 1, 0.02352941, 1,
-0.3671547, 0.7265043, -1.149168, 0, 1, 0.02745098, 1,
-0.3661855, 0.2706016, 0.1045022, 0, 1, 0.03529412, 1,
-0.3652398, 0.1437734, -0.07019363, 0, 1, 0.03921569, 1,
-0.364496, 0.6654578, 1.465543, 0, 1, 0.04705882, 1,
-0.3611422, -0.9578275, -1.492001, 0, 1, 0.05098039, 1,
-0.3584259, 0.2086389, -2.263372, 0, 1, 0.05882353, 1,
-0.3551175, 1.69133, -2.301792, 0, 1, 0.0627451, 1,
-0.3538443, 0.7971933, -2.120869, 0, 1, 0.07058824, 1,
-0.3509392, 1.693703, -1.906198, 0, 1, 0.07450981, 1,
-0.3506115, -1.17002, -2.91, 0, 1, 0.08235294, 1,
-0.350049, 0.0586743, -1.103614, 0, 1, 0.08627451, 1,
-0.3500484, 0.523864, 0.6790801, 0, 1, 0.09411765, 1,
-0.3458411, -0.2699974, -0.7060603, 0, 1, 0.1019608, 1,
-0.3417934, -1.301511, -3.202043, 0, 1, 0.1058824, 1,
-0.337058, 0.07532793, -0.6009824, 0, 1, 0.1137255, 1,
-0.3305346, 0.4158618, -0.0181349, 0, 1, 0.1176471, 1,
-0.3175676, -2.124513, -2.045518, 0, 1, 0.1254902, 1,
-0.3143992, -1.272882, -3.229108, 0, 1, 0.1294118, 1,
-0.3132748, -0.5473026, -1.987436, 0, 1, 0.1372549, 1,
-0.3125008, 1.099441, 2.429657, 0, 1, 0.1411765, 1,
-0.3109283, -0.168611, -3.053747, 0, 1, 0.1490196, 1,
-0.3045791, -0.5916787, -3.115052, 0, 1, 0.1529412, 1,
-0.2977095, -0.98325, -2.694289, 0, 1, 0.1607843, 1,
-0.2939207, 1.565279, 0.5965549, 0, 1, 0.1647059, 1,
-0.293549, 0.190061, -1.192693, 0, 1, 0.172549, 1,
-0.2912926, 0.4018471, -0.5334662, 0, 1, 0.1764706, 1,
-0.2839201, -0.8819388, -4.685895, 0, 1, 0.1843137, 1,
-0.2731331, 1.08064, -0.09304026, 0, 1, 0.1882353, 1,
-0.2700638, 1.336082, 0.3870022, 0, 1, 0.1960784, 1,
-0.2686037, -1.009883, -2.23454, 0, 1, 0.2039216, 1,
-0.2633231, -0.9459095, -2.461183, 0, 1, 0.2078431, 1,
-0.2631668, -0.7357371, -2.893962, 0, 1, 0.2156863, 1,
-0.2622194, 0.4564917, -0.1820254, 0, 1, 0.2196078, 1,
-0.2608645, -1.003794, -4.050524, 0, 1, 0.227451, 1,
-0.2599384, -0.6953157, -2.70249, 0, 1, 0.2313726, 1,
-0.2585977, -0.1593854, -1.599501, 0, 1, 0.2392157, 1,
-0.2576751, 0.8972149, 1.584017, 0, 1, 0.2431373, 1,
-0.2524126, 0.1180931, -0.1820308, 0, 1, 0.2509804, 1,
-0.2480849, 0.5308383, 1.04528, 0, 1, 0.254902, 1,
-0.2458299, -0.3764971, -2.24437, 0, 1, 0.2627451, 1,
-0.2457072, 1.91753, 2.644817, 0, 1, 0.2666667, 1,
-0.2421607, -0.8111891, -3.398617, 0, 1, 0.2745098, 1,
-0.2410103, -0.1001478, -1.14765, 0, 1, 0.2784314, 1,
-0.2396654, -1.814248, -2.744405, 0, 1, 0.2862745, 1,
-0.2392967, -0.493649, -3.723136, 0, 1, 0.2901961, 1,
-0.2359297, 0.7464455, -1.307348, 0, 1, 0.2980392, 1,
-0.2332877, 1.0085, -0.7995871, 0, 1, 0.3058824, 1,
-0.23257, -0.3890029, -3.627262, 0, 1, 0.3098039, 1,
-0.2247946, -0.9672503, -4.810205, 0, 1, 0.3176471, 1,
-0.224469, 0.09073, -2.340827, 0, 1, 0.3215686, 1,
-0.2199481, -0.7363909, -1.358565, 0, 1, 0.3294118, 1,
-0.2151112, -0.106206, -1.315196, 0, 1, 0.3333333, 1,
-0.2118239, 0.4112122, 0.1802766, 0, 1, 0.3411765, 1,
-0.2078897, -0.2395601, -3.667788, 0, 1, 0.345098, 1,
-0.1990971, -0.1825383, -2.184647, 0, 1, 0.3529412, 1,
-0.1990723, 0.8296905, 1.480981, 0, 1, 0.3568628, 1,
-0.1962409, -0.4497195, -1.847538, 0, 1, 0.3647059, 1,
-0.1958604, -0.1933096, -2.811581, 0, 1, 0.3686275, 1,
-0.1937379, -0.1277446, -0.254758, 0, 1, 0.3764706, 1,
-0.1918228, -0.4517522, -2.367751, 0, 1, 0.3803922, 1,
-0.1908471, -0.03771548, -0.6539942, 0, 1, 0.3882353, 1,
-0.1903526, 0.4606816, -0.1185718, 0, 1, 0.3921569, 1,
-0.1893189, 1.7916, -1.023099, 0, 1, 0.4, 1,
-0.1892669, 1.010486, 0.1861686, 0, 1, 0.4078431, 1,
-0.1882062, -1.676669, -1.573714, 0, 1, 0.4117647, 1,
-0.1870565, 0.2446125, -1.578176, 0, 1, 0.4196078, 1,
-0.1852095, 1.52615, -0.9370145, 0, 1, 0.4235294, 1,
-0.1822106, -0.09294873, -2.046016, 0, 1, 0.4313726, 1,
-0.1773273, -1.624207, -3.856001, 0, 1, 0.4352941, 1,
-0.1771519, -0.3489175, -3.049455, 0, 1, 0.4431373, 1,
-0.1750961, -0.225338, -1.50377, 0, 1, 0.4470588, 1,
-0.1737709, 1.453333, 0.9479362, 0, 1, 0.454902, 1,
-0.1733944, 0.9955709, 0.5942687, 0, 1, 0.4588235, 1,
-0.1677271, 0.07800713, -0.4743273, 0, 1, 0.4666667, 1,
-0.166213, -1.960028, -2.112573, 0, 1, 0.4705882, 1,
-0.1660694, 0.5165187, -1.967189, 0, 1, 0.4784314, 1,
-0.1635438, 0.4681127, -0.3834299, 0, 1, 0.4823529, 1,
-0.1615589, 1.282421, -1.288725, 0, 1, 0.4901961, 1,
-0.1603487, 0.1914484, 0.7356409, 0, 1, 0.4941176, 1,
-0.1602733, -0.2148343, -3.374103, 0, 1, 0.5019608, 1,
-0.157254, 1.109179, -0.6137062, 0, 1, 0.509804, 1,
-0.1560765, -0.06559038, -0.5633786, 0, 1, 0.5137255, 1,
-0.15404, 0.1640695, -1.717728, 0, 1, 0.5215687, 1,
-0.1540249, -0.9915946, -3.54068, 0, 1, 0.5254902, 1,
-0.1508182, 0.5431675, 1.458632, 0, 1, 0.5333334, 1,
-0.1501686, -0.253914, -1.607018, 0, 1, 0.5372549, 1,
-0.1475067, 0.7997498, 1.458452, 0, 1, 0.5450981, 1,
-0.1404888, -0.3751592, -4.427101, 0, 1, 0.5490196, 1,
-0.1364361, 0.6893248, -0.6899807, 0, 1, 0.5568628, 1,
-0.1277757, -2.204327, -3.929327, 0, 1, 0.5607843, 1,
-0.1262496, 1.304272, 0.05465004, 0, 1, 0.5686275, 1,
-0.1253472, 0.2718316, -0.4369917, 0, 1, 0.572549, 1,
-0.1230595, 0.2250804, -2.435885, 0, 1, 0.5803922, 1,
-0.1229611, 0.4096048, -1.470254, 0, 1, 0.5843138, 1,
-0.1218447, 1.813477, -0.8781217, 0, 1, 0.5921569, 1,
-0.1213017, 0.6347624, 0.1714429, 0, 1, 0.5960785, 1,
-0.1187601, 1.201336, 1.542262, 0, 1, 0.6039216, 1,
-0.1180861, 1.230832, -0.3752699, 0, 1, 0.6117647, 1,
-0.117847, -1.021936, -2.623788, 0, 1, 0.6156863, 1,
-0.1169377, -2.342388, -3.251669, 0, 1, 0.6235294, 1,
-0.1117276, -1.460518, -2.605065, 0, 1, 0.627451, 1,
-0.1116396, 0.7147497, 0.1562674, 0, 1, 0.6352941, 1,
-0.1099984, -0.5153917, -3.445379, 0, 1, 0.6392157, 1,
-0.1044586, 0.697203, 0.9275176, 0, 1, 0.6470588, 1,
-0.1011406, -1.226938, -4.27001, 0, 1, 0.6509804, 1,
-0.1007417, -0.6473909, -4.33112, 0, 1, 0.6588235, 1,
-0.09994195, 1.148782, -0.6252068, 0, 1, 0.6627451, 1,
-0.09910083, -1.286443, -3.452416, 0, 1, 0.6705883, 1,
-0.09768556, -1.620668, -2.039935, 0, 1, 0.6745098, 1,
-0.08564236, 1.00922, -0.3699096, 0, 1, 0.682353, 1,
-0.08554973, 0.4911689, 1.26637, 0, 1, 0.6862745, 1,
-0.08376042, 0.6198583, -0.9390036, 0, 1, 0.6941177, 1,
-0.0801817, 0.2679321, 0.7379605, 0, 1, 0.7019608, 1,
-0.07853264, 0.9703291, -0.5013931, 0, 1, 0.7058824, 1,
-0.07741341, 0.1305653, -0.9623715, 0, 1, 0.7137255, 1,
-0.07455497, -0.8663483, -3.199573, 0, 1, 0.7176471, 1,
-0.06825796, -0.1091468, -1.399095, 0, 1, 0.7254902, 1,
-0.06667305, -0.3810576, -2.361611, 0, 1, 0.7294118, 1,
-0.06368045, -0.9434887, -2.927088, 0, 1, 0.7372549, 1,
-0.06310122, 1.486489, -0.5182504, 0, 1, 0.7411765, 1,
-0.06193068, -0.1793994, -2.047654, 0, 1, 0.7490196, 1,
-0.06119166, 0.9848716, -1.642279, 0, 1, 0.7529412, 1,
-0.06028591, -0.7251134, -4.134914, 0, 1, 0.7607843, 1,
-0.05016792, -0.5695526, -1.14572, 0, 1, 0.7647059, 1,
-0.04985166, 0.2482711, -0.1000267, 0, 1, 0.772549, 1,
-0.04960085, -0.4191397, -2.463276, 0, 1, 0.7764706, 1,
-0.04431336, 0.3308468, -0.830459, 0, 1, 0.7843137, 1,
-0.0426594, 1.488373, 0.5451272, 0, 1, 0.7882353, 1,
-0.04113594, -0.3425558, -2.33715, 0, 1, 0.7960784, 1,
-0.04012674, 1.029251, 1.214307, 0, 1, 0.8039216, 1,
-0.03973553, 1.457511, 2.789548, 0, 1, 0.8078431, 1,
-0.03918844, -0.6286288, -3.454692, 0, 1, 0.8156863, 1,
-0.03628718, 0.1265286, 0.5399509, 0, 1, 0.8196079, 1,
-0.03504302, -2.021719, -3.599217, 0, 1, 0.827451, 1,
-0.03182752, -0.3644155, -3.617951, 0, 1, 0.8313726, 1,
-0.03062734, 2.21518, -1.279661, 0, 1, 0.8392157, 1,
-0.02939273, -0.8254333, -4.293639, 0, 1, 0.8431373, 1,
-0.02604329, -2.632142, -2.437287, 0, 1, 0.8509804, 1,
-0.01885997, -1.40013, -2.257986, 0, 1, 0.854902, 1,
-0.01865749, 0.2647749, 1.037851, 0, 1, 0.8627451, 1,
-0.007513196, 1.626215, -0.7346092, 0, 1, 0.8666667, 1,
-0.007426038, 0.7180341, 0.5012802, 0, 1, 0.8745098, 1,
-0.005355915, 0.9745396, 0.4078231, 0, 1, 0.8784314, 1,
-0.002313393, -0.6805938, -2.113679, 0, 1, 0.8862745, 1,
0.003549672, 0.8876273, -0.5227516, 0, 1, 0.8901961, 1,
0.004669236, 0.2212688, 1.023733, 0, 1, 0.8980392, 1,
0.0074544, 0.5941962, -0.2502329, 0, 1, 0.9058824, 1,
0.009955985, -1.56025, 2.347608, 0, 1, 0.9098039, 1,
0.01292824, -0.06622037, 0.7925454, 0, 1, 0.9176471, 1,
0.01317936, 1.625027, -0.4205852, 0, 1, 0.9215686, 1,
0.01318556, 0.9542671, 0.09178937, 0, 1, 0.9294118, 1,
0.01395531, 0.490941, -0.9321428, 0, 1, 0.9333333, 1,
0.01452822, 1.261986, -0.02402578, 0, 1, 0.9411765, 1,
0.01632104, 1.40883, 1.600999, 0, 1, 0.945098, 1,
0.01732128, 0.6651061, -0.3320495, 0, 1, 0.9529412, 1,
0.02643696, -1.731906, 2.99638, 0, 1, 0.9568627, 1,
0.02792019, -1.268494, 4.005155, 0, 1, 0.9647059, 1,
0.03279871, -0.8869156, 3.40743, 0, 1, 0.9686275, 1,
0.04231673, -0.2616673, 1.768815, 0, 1, 0.9764706, 1,
0.04238746, 0.6693733, 0.1303829, 0, 1, 0.9803922, 1,
0.04254999, -1.15698, 4.796553, 0, 1, 0.9882353, 1,
0.04334949, -0.3167415, 3.919452, 0, 1, 0.9921569, 1,
0.04415801, -0.2175788, 1.885383, 0, 1, 1, 1,
0.04739312, 0.8182049, 0.4115862, 0, 0.9921569, 1, 1,
0.05466899, 1.232481, 0.7316606, 0, 0.9882353, 1, 1,
0.0583622, 0.6661371, 0.5664295, 0, 0.9803922, 1, 1,
0.06352393, 0.5828267, -0.01843508, 0, 0.9764706, 1, 1,
0.07374933, -0.24077, 4.125167, 0, 0.9686275, 1, 1,
0.07507538, 0.9357636, 1.903626, 0, 0.9647059, 1, 1,
0.07569658, 0.8936973, -0.4257954, 0, 0.9568627, 1, 1,
0.07795269, 0.01850681, 2.203921, 0, 0.9529412, 1, 1,
0.07919078, 0.9894636, 0.2081694, 0, 0.945098, 1, 1,
0.08082056, 1.537838, -0.4082822, 0, 0.9411765, 1, 1,
0.08138472, -1.031756, 3.124496, 0, 0.9333333, 1, 1,
0.08508652, -0.738197, 3.054345, 0, 0.9294118, 1, 1,
0.08610232, 0.3261578, 1.244219, 0, 0.9215686, 1, 1,
0.08619076, -0.03942613, 1.731798, 0, 0.9176471, 1, 1,
0.08631326, -0.5259818, 2.686437, 0, 0.9098039, 1, 1,
0.09592265, 0.09267848, 0.6726835, 0, 0.9058824, 1, 1,
0.09649672, -0.2420043, 3.505265, 0, 0.8980392, 1, 1,
0.09905674, 0.7402781, 1.28938, 0, 0.8901961, 1, 1,
0.1038875, 0.3136867, -0.8101127, 0, 0.8862745, 1, 1,
0.1134761, 0.6146672, -0.7417179, 0, 0.8784314, 1, 1,
0.1157883, -1.737472, 2.4442, 0, 0.8745098, 1, 1,
0.1184586, 0.4918385, 0.4263473, 0, 0.8666667, 1, 1,
0.1213808, -0.1814476, 3.295806, 0, 0.8627451, 1, 1,
0.1224714, -0.02211751, 1.855422, 0, 0.854902, 1, 1,
0.1260472, 0.4634762, -1.069323, 0, 0.8509804, 1, 1,
0.1316087, -0.5446855, 2.340593, 0, 0.8431373, 1, 1,
0.1327872, 1.251715, 1.105885, 0, 0.8392157, 1, 1,
0.1328039, -1.38823, 3.173661, 0, 0.8313726, 1, 1,
0.1328286, 0.6999425, 1.633187, 0, 0.827451, 1, 1,
0.1353765, 0.1367317, 2.408916, 0, 0.8196079, 1, 1,
0.1358571, -0.1372438, 3.233682, 0, 0.8156863, 1, 1,
0.1367484, 0.1587963, 2.573724, 0, 0.8078431, 1, 1,
0.1378756, 0.3909036, -1.385748, 0, 0.8039216, 1, 1,
0.1435351, 0.8145126, -0.441573, 0, 0.7960784, 1, 1,
0.1466752, -0.4005204, 1.46318, 0, 0.7882353, 1, 1,
0.1484389, 0.1753711, 0.9185442, 0, 0.7843137, 1, 1,
0.1498981, 0.457961, -0.03975447, 0, 0.7764706, 1, 1,
0.1524836, -1.635864, 4.109395, 0, 0.772549, 1, 1,
0.1555385, 0.3900381, 0.6375365, 0, 0.7647059, 1, 1,
0.1572122, -0.2522772, 1.958558, 0, 0.7607843, 1, 1,
0.1611686, -0.04287348, 3.396237, 0, 0.7529412, 1, 1,
0.1622169, 2.045935, 0.1003123, 0, 0.7490196, 1, 1,
0.1651883, 1.391782, -1.348023, 0, 0.7411765, 1, 1,
0.1668779, -0.002332553, 1.841399, 0, 0.7372549, 1, 1,
0.1690078, 0.03760495, 1.289056, 0, 0.7294118, 1, 1,
0.1691788, 0.6240328, -0.5108716, 0, 0.7254902, 1, 1,
0.1697791, 0.07831255, 0.7994229, 0, 0.7176471, 1, 1,
0.1746707, 2.514016, -0.7428113, 0, 0.7137255, 1, 1,
0.1758169, -0.3906888, 2.723922, 0, 0.7058824, 1, 1,
0.1768591, 1.395305, -0.3953513, 0, 0.6980392, 1, 1,
0.1789273, -1.336485, 1.126818, 0, 0.6941177, 1, 1,
0.1815967, -1.657722, 2.676274, 0, 0.6862745, 1, 1,
0.1829318, -0.4295947, 3.347503, 0, 0.682353, 1, 1,
0.183827, -0.8324217, 1.335404, 0, 0.6745098, 1, 1,
0.1905178, 0.8724652, -0.3074251, 0, 0.6705883, 1, 1,
0.1928434, -0.2572015, 2.706558, 0, 0.6627451, 1, 1,
0.1936347, 0.1842377, 1.874809, 0, 0.6588235, 1, 1,
0.1939128, 1.195619, 1.474099, 0, 0.6509804, 1, 1,
0.2011581, 0.2260034, 0.4245879, 0, 0.6470588, 1, 1,
0.2021036, -0.4038889, 2.434746, 0, 0.6392157, 1, 1,
0.2053258, -0.3445792, 3.046691, 0, 0.6352941, 1, 1,
0.2076143, -0.02781962, 1.842293, 0, 0.627451, 1, 1,
0.2079237, -1.557625, 3.988252, 0, 0.6235294, 1, 1,
0.208697, -0.6874663, 2.654928, 0, 0.6156863, 1, 1,
0.2113961, 0.08016871, 0.214853, 0, 0.6117647, 1, 1,
0.2132045, 0.3404616, 1.203458, 0, 0.6039216, 1, 1,
0.2178783, 0.07007265, 1.993241, 0, 0.5960785, 1, 1,
0.2260745, -1.64353, 2.682852, 0, 0.5921569, 1, 1,
0.2269686, -0.03613848, 0.8853872, 0, 0.5843138, 1, 1,
0.2270548, -1.24894, 1.807362, 0, 0.5803922, 1, 1,
0.2272765, 1.362212, -0.5479015, 0, 0.572549, 1, 1,
0.2276981, -1.11352, 1.786144, 0, 0.5686275, 1, 1,
0.2336019, 0.1055065, 0.9551675, 0, 0.5607843, 1, 1,
0.2345688, -0.7185715, 3.467847, 0, 0.5568628, 1, 1,
0.2434684, -1.176336, 2.168242, 0, 0.5490196, 1, 1,
0.2447889, -0.6152114, 3.302256, 0, 0.5450981, 1, 1,
0.245073, 0.8001349, -1.018113, 0, 0.5372549, 1, 1,
0.247433, -0.5637043, 2.756331, 0, 0.5333334, 1, 1,
0.2583329, -0.3875791, 2.656434, 0, 0.5254902, 1, 1,
0.2585589, -0.00170781, 1.124761, 0, 0.5215687, 1, 1,
0.2602931, -0.02836505, 2.730331, 0, 0.5137255, 1, 1,
0.2608802, 0.4955809, 0.2803343, 0, 0.509804, 1, 1,
0.2623522, -1.025397, 3.97051, 0, 0.5019608, 1, 1,
0.2652429, 0.4524902, 2.562485, 0, 0.4941176, 1, 1,
0.2753776, -0.3432767, 2.493313, 0, 0.4901961, 1, 1,
0.2761613, -0.05316649, 1.974965, 0, 0.4823529, 1, 1,
0.2772984, -0.7884796, 2.826985, 0, 0.4784314, 1, 1,
0.2846467, 0.6180745, 1.742196, 0, 0.4705882, 1, 1,
0.2899011, -1.132661, 2.415696, 0, 0.4666667, 1, 1,
0.2903795, 0.845744, -0.1385752, 0, 0.4588235, 1, 1,
0.2928087, -0.5730977, 2.5754, 0, 0.454902, 1, 1,
0.2943657, 0.2003442, 0.9404668, 0, 0.4470588, 1, 1,
0.297554, -0.9082262, 2.996142, 0, 0.4431373, 1, 1,
0.2995695, -0.6965988, 2.277955, 0, 0.4352941, 1, 1,
0.3016781, 0.8325837, 1.799645, 0, 0.4313726, 1, 1,
0.3018374, 0.6810812, 1.919229, 0, 0.4235294, 1, 1,
0.3030795, 1.422646, -0.3624741, 0, 0.4196078, 1, 1,
0.3171467, 0.1471464, 2.090956, 0, 0.4117647, 1, 1,
0.3185434, 0.5281852, 0.4123795, 0, 0.4078431, 1, 1,
0.3187445, 1.178054, -0.04798505, 0, 0.4, 1, 1,
0.3231956, 0.4283508, -0.877118, 0, 0.3921569, 1, 1,
0.3233166, 0.684862, 0.6369594, 0, 0.3882353, 1, 1,
0.3234158, 0.2610209, 0.6671858, 0, 0.3803922, 1, 1,
0.3236215, -0.5446122, 3.306457, 0, 0.3764706, 1, 1,
0.3238938, -0.4716906, 3.350648, 0, 0.3686275, 1, 1,
0.32535, -0.7365933, 1.647958, 0, 0.3647059, 1, 1,
0.3261372, 0.8062631, -0.3896434, 0, 0.3568628, 1, 1,
0.3276131, 1.463051, -0.6284435, 0, 0.3529412, 1, 1,
0.3293606, -0.5658543, 4.543607, 0, 0.345098, 1, 1,
0.3323985, -0.6634436, 4.191271, 0, 0.3411765, 1, 1,
0.3326993, 1.112273, -0.3388654, 0, 0.3333333, 1, 1,
0.3391549, -0.1888884, 3.007738, 0, 0.3294118, 1, 1,
0.3433222, -0.9926677, 3.223433, 0, 0.3215686, 1, 1,
0.3433981, -1.049893, 3.767915, 0, 0.3176471, 1, 1,
0.3441454, 0.3630714, -0.5247624, 0, 0.3098039, 1, 1,
0.3455812, -1.173887, 2.400175, 0, 0.3058824, 1, 1,
0.3480687, -1.367414, 3.065473, 0, 0.2980392, 1, 1,
0.3484893, 0.5221355, 1.846843, 0, 0.2901961, 1, 1,
0.3514812, -0.1982475, 3.291534, 0, 0.2862745, 1, 1,
0.3517166, -1.028126, 3.9138, 0, 0.2784314, 1, 1,
0.3547757, 1.004306, 0.2522883, 0, 0.2745098, 1, 1,
0.3648801, 0.3105118, 0.5984186, 0, 0.2666667, 1, 1,
0.3662608, -0.3088464, 2.495962, 0, 0.2627451, 1, 1,
0.3662654, 0.461826, 1.597157, 0, 0.254902, 1, 1,
0.3742489, 0.3448155, 0.001122914, 0, 0.2509804, 1, 1,
0.3798193, 0.5954069, 0.9622867, 0, 0.2431373, 1, 1,
0.3803133, 0.3358003, 1.58183, 0, 0.2392157, 1, 1,
0.3820279, -1.507447, 2.007021, 0, 0.2313726, 1, 1,
0.388705, -0.01100589, 3.006044, 0, 0.227451, 1, 1,
0.3899004, 0.5667843, 1.96501, 0, 0.2196078, 1, 1,
0.3921256, 0.3784101, 0.05474991, 0, 0.2156863, 1, 1,
0.3964896, 0.3868189, 0.235909, 0, 0.2078431, 1, 1,
0.3999561, 1.258405, -0.1773035, 0, 0.2039216, 1, 1,
0.4042487, -1.081359, 2.725262, 0, 0.1960784, 1, 1,
0.4075924, 2.818417, -0.5253676, 0, 0.1882353, 1, 1,
0.41124, 0.5752273, 0.431807, 0, 0.1843137, 1, 1,
0.4115224, 0.1679235, 3.124942, 0, 0.1764706, 1, 1,
0.4118799, 0.7395781, -0.5833041, 0, 0.172549, 1, 1,
0.4121613, 0.6308827, 0.6355208, 0, 0.1647059, 1, 1,
0.4193352, 0.6641885, 1.715488, 0, 0.1607843, 1, 1,
0.420958, -0.1435182, 2.122831, 0, 0.1529412, 1, 1,
0.4230669, 0.5414106, 0.4440587, 0, 0.1490196, 1, 1,
0.4341312, 0.801245, 1.700621, 0, 0.1411765, 1, 1,
0.4378335, 0.5461355, 0.5403774, 0, 0.1372549, 1, 1,
0.4390599, -1.118723, 1.383814, 0, 0.1294118, 1, 1,
0.4447836, 1.698789, 1.826047, 0, 0.1254902, 1, 1,
0.4470061, -1.925884, 3.219193, 0, 0.1176471, 1, 1,
0.4501163, 1.257112, 0.8915147, 0, 0.1137255, 1, 1,
0.4512444, 0.7183731, 0.008713438, 0, 0.1058824, 1, 1,
0.4544918, -1.433363, 1.705188, 0, 0.09803922, 1, 1,
0.4558075, -0.7870178, 2.091321, 0, 0.09411765, 1, 1,
0.4600885, 0.7218663, 1.257943, 0, 0.08627451, 1, 1,
0.4625351, 0.3107196, 0.7923252, 0, 0.08235294, 1, 1,
0.4737096, 0.611748, -0.4269355, 0, 0.07450981, 1, 1,
0.477311, 0.3033581, 1.336364, 0, 0.07058824, 1, 1,
0.4802822, -0.5114964, 2.613635, 0, 0.0627451, 1, 1,
0.487689, -0.4071963, 2.960748, 0, 0.05882353, 1, 1,
0.4898312, 0.1487908, 2.009126, 0, 0.05098039, 1, 1,
0.4899195, -0.3654969, 1.913989, 0, 0.04705882, 1, 1,
0.4910502, -0.03438852, 0.7605355, 0, 0.03921569, 1, 1,
0.4949431, -0.1064759, 0.5454693, 0, 0.03529412, 1, 1,
0.495194, 0.329629, 1.336926, 0, 0.02745098, 1, 1,
0.496304, 1.08624, -0.7098007, 0, 0.02352941, 1, 1,
0.4965121, 0.5641683, 0.877176, 0, 0.01568628, 1, 1,
0.4975363, -0.5693023, 1.331546, 0, 0.01176471, 1, 1,
0.5042195, 0.9068619, 1.425193, 0, 0.003921569, 1, 1,
0.5132135, 0.4316251, 1.786949, 0.003921569, 0, 1, 1,
0.5149487, -0.8876224, 2.83323, 0.007843138, 0, 1, 1,
0.5188022, -0.1790033, 2.099431, 0.01568628, 0, 1, 1,
0.5236905, 0.9827319, 1.059624, 0.01960784, 0, 1, 1,
0.5248432, 2.469415, -0.08418819, 0.02745098, 0, 1, 1,
0.5257477, 0.2237459, 1.085951, 0.03137255, 0, 1, 1,
0.5282179, -0.6065205, 1.471976, 0.03921569, 0, 1, 1,
0.528312, 0.8384552, 0.4694198, 0.04313726, 0, 1, 1,
0.5283286, 0.5168599, -0.7472938, 0.05098039, 0, 1, 1,
0.5286977, 1.209313, 0.2530123, 0.05490196, 0, 1, 1,
0.5320816, -1.162769, 1.997558, 0.0627451, 0, 1, 1,
0.5379819, -1.159137, 1.616693, 0.06666667, 0, 1, 1,
0.5420435, -2.034644, 5.176926, 0.07450981, 0, 1, 1,
0.5444568, 0.332992, 1.402116, 0.07843138, 0, 1, 1,
0.5486372, 0.3907129, 1.006237, 0.08627451, 0, 1, 1,
0.5544523, 0.4185777, 2.696946, 0.09019608, 0, 1, 1,
0.5549906, 0.4659366, 2.044146, 0.09803922, 0, 1, 1,
0.5567315, -1.063059, 2.614095, 0.1058824, 0, 1, 1,
0.5586672, 0.7957755, 0.4841248, 0.1098039, 0, 1, 1,
0.5621685, -1.452297, 2.034784, 0.1176471, 0, 1, 1,
0.5678095, 0.3413742, -0.2819362, 0.1215686, 0, 1, 1,
0.5701981, -1.715338, 1.275134, 0.1294118, 0, 1, 1,
0.5718849, 0.5466721, -0.2116716, 0.1333333, 0, 1, 1,
0.5722393, -0.9100381, 3.290753, 0.1411765, 0, 1, 1,
0.5778404, -0.8218889, 1.825682, 0.145098, 0, 1, 1,
0.5823324, -0.008364229, 1.689719, 0.1529412, 0, 1, 1,
0.5909173, 0.3679324, 0.7106671, 0.1568628, 0, 1, 1,
0.6003796, -1.734406, 3.689061, 0.1647059, 0, 1, 1,
0.6035212, -0.7910295, 1.805186, 0.1686275, 0, 1, 1,
0.6064613, 0.7069409, 0.3845264, 0.1764706, 0, 1, 1,
0.6078041, 1.530006, -0.4295927, 0.1803922, 0, 1, 1,
0.6138069, 0.6965894, 0.09104344, 0.1882353, 0, 1, 1,
0.6145886, 0.08386803, 0.3915692, 0.1921569, 0, 1, 1,
0.6214341, 0.3619094, 1.934079, 0.2, 0, 1, 1,
0.6244754, -0.5680882, -0.3459053, 0.2078431, 0, 1, 1,
0.6262388, 0.5302606, 1.838087, 0.2117647, 0, 1, 1,
0.6278194, 0.7757024, 0.8924009, 0.2196078, 0, 1, 1,
0.6309335, 0.7268245, 3.45363, 0.2235294, 0, 1, 1,
0.6331148, -0.9316846, 2.084462, 0.2313726, 0, 1, 1,
0.6337017, -0.3431486, 1.650656, 0.2352941, 0, 1, 1,
0.6494408, 0.6086167, 2.745014, 0.2431373, 0, 1, 1,
0.6575829, -0.3162229, 2.338857, 0.2470588, 0, 1, 1,
0.659878, 0.9251673, 0.7047517, 0.254902, 0, 1, 1,
0.6678483, -2.049378, 3.948172, 0.2588235, 0, 1, 1,
0.6782353, -0.3845671, 2.254284, 0.2666667, 0, 1, 1,
0.6821979, 0.364993, -1.63194, 0.2705882, 0, 1, 1,
0.6829584, 1.220018, -0.4890622, 0.2784314, 0, 1, 1,
0.6862102, 1.589358, 1.359736, 0.282353, 0, 1, 1,
0.6914433, 0.3821141, 0.4935499, 0.2901961, 0, 1, 1,
0.6922997, -0.7944602, 0.7135202, 0.2941177, 0, 1, 1,
0.6933625, -0.5549998, 2.498003, 0.3019608, 0, 1, 1,
0.6961688, -0.05909227, 0.8502462, 0.3098039, 0, 1, 1,
0.7049509, 0.7945224, -0.2117363, 0.3137255, 0, 1, 1,
0.7107111, -0.772563, 2.67983, 0.3215686, 0, 1, 1,
0.7123703, -0.03306723, 0.5192145, 0.3254902, 0, 1, 1,
0.712867, 2.107426, 0.6635621, 0.3333333, 0, 1, 1,
0.7138843, 0.09597476, 1.64498, 0.3372549, 0, 1, 1,
0.7183204, 0.1760307, 0.3396029, 0.345098, 0, 1, 1,
0.7200568, 1.397003, 0.5715024, 0.3490196, 0, 1, 1,
0.7276002, -0.1309158, 2.196831, 0.3568628, 0, 1, 1,
0.7276381, -0.1436388, 1.673434, 0.3607843, 0, 1, 1,
0.734135, 0.04688265, 1.929404, 0.3686275, 0, 1, 1,
0.7367874, 0.1855213, 0.5652211, 0.372549, 0, 1, 1,
0.7391458, 1.227071, 0.2945225, 0.3803922, 0, 1, 1,
0.7399478, 1.408454, 0.5512328, 0.3843137, 0, 1, 1,
0.7403602, -2.334795, 1.891673, 0.3921569, 0, 1, 1,
0.7446439, 0.05511506, 2.530432, 0.3960784, 0, 1, 1,
0.7447567, -0.3676083, 0.3875591, 0.4039216, 0, 1, 1,
0.7494782, 1.08408, 0.2009608, 0.4117647, 0, 1, 1,
0.7520806, -1.686019, 4.690406, 0.4156863, 0, 1, 1,
0.7528912, -1.033075, 2.467006, 0.4235294, 0, 1, 1,
0.7659925, 0.9875007, 0.4703721, 0.427451, 0, 1, 1,
0.7665493, 0.3621602, 1.502428, 0.4352941, 0, 1, 1,
0.7672588, 0.8606573, -0.01186369, 0.4392157, 0, 1, 1,
0.7677161, 0.1677011, 2.142856, 0.4470588, 0, 1, 1,
0.7707196, 0.2955084, 0.8435364, 0.4509804, 0, 1, 1,
0.7795285, 0.3290161, -0.6236596, 0.4588235, 0, 1, 1,
0.7838928, 0.9927148, 1.052067, 0.4627451, 0, 1, 1,
0.7905337, -0.04389273, 2.207249, 0.4705882, 0, 1, 1,
0.7916356, 1.071885, 1.560263, 0.4745098, 0, 1, 1,
0.7923387, -1.371343, 1.998102, 0.4823529, 0, 1, 1,
0.7947802, 0.2139748, -0.8189805, 0.4862745, 0, 1, 1,
0.8002127, 0.2760569, 0.8387655, 0.4941176, 0, 1, 1,
0.8023014, 0.9101902, 1.432675, 0.5019608, 0, 1, 1,
0.811464, -0.1719544, 1.002546, 0.5058824, 0, 1, 1,
0.8159137, 0.084528, 0.894492, 0.5137255, 0, 1, 1,
0.8221059, -1.142279, 1.191534, 0.5176471, 0, 1, 1,
0.8243206, -0.7566872, 1.712466, 0.5254902, 0, 1, 1,
0.8244547, 0.2193325, -0.119002, 0.5294118, 0, 1, 1,
0.8257707, 0.3905742, 1.629307, 0.5372549, 0, 1, 1,
0.8314263, -1.242704, 2.676414, 0.5411765, 0, 1, 1,
0.833093, 2.344104, 0.1000998, 0.5490196, 0, 1, 1,
0.8341187, 0.8179067, 2.785136, 0.5529412, 0, 1, 1,
0.8421718, -1.510606, 2.099982, 0.5607843, 0, 1, 1,
0.8446001, 0.8152454, -0.1609387, 0.5647059, 0, 1, 1,
0.859036, 0.2476674, 0.08548259, 0.572549, 0, 1, 1,
0.8641405, -0.610299, 1.459831, 0.5764706, 0, 1, 1,
0.865308, -0.9072727, 2.834898, 0.5843138, 0, 1, 1,
0.8654391, -1.146852, 1.049961, 0.5882353, 0, 1, 1,
0.8665099, -0.1129306, 1.139755, 0.5960785, 0, 1, 1,
0.8669813, -0.4037183, 1.518238, 0.6039216, 0, 1, 1,
0.8673038, 0.3687964, 0.2460764, 0.6078432, 0, 1, 1,
0.8703776, -0.4133359, 1.294391, 0.6156863, 0, 1, 1,
0.8751616, 1.75498, 0.8973159, 0.6196079, 0, 1, 1,
0.8826932, -1.427028, 2.774918, 0.627451, 0, 1, 1,
0.8877916, 0.3100142, 0.7653656, 0.6313726, 0, 1, 1,
0.8936203, -1.381581, 2.095172, 0.6392157, 0, 1, 1,
0.9040351, 1.439744, 1.286061, 0.6431373, 0, 1, 1,
0.9056521, 0.2102019, 1.879712, 0.6509804, 0, 1, 1,
0.9112476, -0.3318409, 0.9743756, 0.654902, 0, 1, 1,
0.9238048, 1.032433, -0.2495506, 0.6627451, 0, 1, 1,
0.923825, 1.026721, 1.087419, 0.6666667, 0, 1, 1,
0.9259809, 0.6301612, 0.3026834, 0.6745098, 0, 1, 1,
0.9275056, -0.3933657, 1.833038, 0.6784314, 0, 1, 1,
0.9283509, -0.3641385, 0.7134511, 0.6862745, 0, 1, 1,
0.9454287, -0.5786565, 3.144848, 0.6901961, 0, 1, 1,
0.9472273, -2.697443, 2.169865, 0.6980392, 0, 1, 1,
0.9475608, 1.000492, 1.457663, 0.7058824, 0, 1, 1,
0.9479176, 2.125393, -1.220111, 0.7098039, 0, 1, 1,
0.9483089, 1.824875, 1.132751, 0.7176471, 0, 1, 1,
0.9500466, -0.8558253, 2.935194, 0.7215686, 0, 1, 1,
0.9506675, 0.7668004, 1.327229, 0.7294118, 0, 1, 1,
0.9522571, -1.05072, 3.095578, 0.7333333, 0, 1, 1,
0.9612491, -0.47271, 2.347732, 0.7411765, 0, 1, 1,
0.9627832, -0.7568324, 2.891522, 0.7450981, 0, 1, 1,
0.9697099, 1.908879, 3.198345, 0.7529412, 0, 1, 1,
0.9699538, -1.422152, 4.467406, 0.7568628, 0, 1, 1,
0.97497, -0.1556948, 2.149178, 0.7647059, 0, 1, 1,
0.9753364, -0.9781141, 1.237659, 0.7686275, 0, 1, 1,
0.976528, 1.008044, 1.924075, 0.7764706, 0, 1, 1,
1.005038, -0.3808168, 3.172779, 0.7803922, 0, 1, 1,
1.006399, -0.5877401, 2.526347, 0.7882353, 0, 1, 1,
1.016087, -0.8283855, 3.019283, 0.7921569, 0, 1, 1,
1.019176, 0.6659113, 1.821241, 0.8, 0, 1, 1,
1.01933, -0.533289, 2.99681, 0.8078431, 0, 1, 1,
1.020519, 0.7748505, 1.149867, 0.8117647, 0, 1, 1,
1.03365, -0.4351042, 1.224337, 0.8196079, 0, 1, 1,
1.036941, 0.9546474, 1.78896, 0.8235294, 0, 1, 1,
1.038411, -0.8944688, 1.038417, 0.8313726, 0, 1, 1,
1.04443, 0.1457292, 2.539832, 0.8352941, 0, 1, 1,
1.045723, -0.6295208, 2.565346, 0.8431373, 0, 1, 1,
1.046039, -0.1704419, 3.155944, 0.8470588, 0, 1, 1,
1.047363, 1.10528, 1.399518, 0.854902, 0, 1, 1,
1.048805, 0.5725513, 1.01437, 0.8588235, 0, 1, 1,
1.051387, -1.236298, 0.74044, 0.8666667, 0, 1, 1,
1.051486, 0.2852025, 1.618443, 0.8705882, 0, 1, 1,
1.058882, -0.5107483, 1.463736, 0.8784314, 0, 1, 1,
1.060241, -0.3375072, 2.713441, 0.8823529, 0, 1, 1,
1.06503, -1.160307, 1.869834, 0.8901961, 0, 1, 1,
1.067729, 0.6399178, 1.588557, 0.8941177, 0, 1, 1,
1.079068, 0.3631029, 0.2986059, 0.9019608, 0, 1, 1,
1.081573, -0.6209545, 4.176024, 0.9098039, 0, 1, 1,
1.084621, 0.05208073, 0.6547031, 0.9137255, 0, 1, 1,
1.087256, -0.2821386, 2.057422, 0.9215686, 0, 1, 1,
1.089107, 0.1560342, 0.5739509, 0.9254902, 0, 1, 1,
1.093273, 0.06432875, 0.8547856, 0.9333333, 0, 1, 1,
1.097775, -0.6307321, 3.029185, 0.9372549, 0, 1, 1,
1.100001, 0.5913538, 0.3475581, 0.945098, 0, 1, 1,
1.108057, -0.1318847, 0.4826266, 0.9490196, 0, 1, 1,
1.111075, -0.9971571, 2.076984, 0.9568627, 0, 1, 1,
1.118589, -1.722753, 2.821241, 0.9607843, 0, 1, 1,
1.12073, -0.5982855, 2.024732, 0.9686275, 0, 1, 1,
1.122174, 0.2021501, 3.268789, 0.972549, 0, 1, 1,
1.125512, 1.785363, 1.786719, 0.9803922, 0, 1, 1,
1.125843, 0.5513368, 1.827869, 0.9843137, 0, 1, 1,
1.128597, -1.466335, 1.890553, 0.9921569, 0, 1, 1,
1.131413, 0.3060303, 1.327757, 0.9960784, 0, 1, 1,
1.134244, 1.248048, 0.6390626, 1, 0, 0.9960784, 1,
1.135595, 0.0249959, 3.242426, 1, 0, 0.9882353, 1,
1.137613, -0.2175572, 2.108949, 1, 0, 0.9843137, 1,
1.148414, 1.157321, 1.788936, 1, 0, 0.9764706, 1,
1.151019, -0.06040031, 1.779237, 1, 0, 0.972549, 1,
1.151552, 0.2726623, 2.0502, 1, 0, 0.9647059, 1,
1.151995, 2.025917, 0.4860504, 1, 0, 0.9607843, 1,
1.153446, -2.06325, 2.074422, 1, 0, 0.9529412, 1,
1.158959, -1.524162, 4.658621, 1, 0, 0.9490196, 1,
1.159128, -0.3492133, 0.7793714, 1, 0, 0.9411765, 1,
1.166584, 0.2292829, 2.361609, 1, 0, 0.9372549, 1,
1.175545, -0.4336993, 1.973554, 1, 0, 0.9294118, 1,
1.176987, 0.399976, 0.5024791, 1, 0, 0.9254902, 1,
1.186985, -0.378278, 1.193317, 1, 0, 0.9176471, 1,
1.188684, 0.5319294, 1.196059, 1, 0, 0.9137255, 1,
1.194417, 0.6137875, 0.990516, 1, 0, 0.9058824, 1,
1.195742, 1.429944, 0.768451, 1, 0, 0.9019608, 1,
1.197568, 0.001125186, -0.5275726, 1, 0, 0.8941177, 1,
1.205016, 0.5315013, 2.66877, 1, 0, 0.8862745, 1,
1.2078, 0.9082817, 2.373568, 1, 0, 0.8823529, 1,
1.212866, 0.8764038, 2.225095, 1, 0, 0.8745098, 1,
1.213844, 0.4824454, 1.287218, 1, 0, 0.8705882, 1,
1.220001, -1.071424, 4.541975, 1, 0, 0.8627451, 1,
1.221639, 0.2716313, 1.578598, 1, 0, 0.8588235, 1,
1.222283, 0.1790905, 0.8822492, 1, 0, 0.8509804, 1,
1.223123, 1.203756, -0.7652419, 1, 0, 0.8470588, 1,
1.223686, -0.9885029, 2.907276, 1, 0, 0.8392157, 1,
1.224046, 0.7610889, 2.528558, 1, 0, 0.8352941, 1,
1.231783, 1.123341, 1.148701, 1, 0, 0.827451, 1,
1.233907, -0.7052293, 3.456556, 1, 0, 0.8235294, 1,
1.240966, 0.1053888, 1.167486, 1, 0, 0.8156863, 1,
1.245623, 0.1472845, 1.064399, 1, 0, 0.8117647, 1,
1.252341, -0.3505392, 2.241839, 1, 0, 0.8039216, 1,
1.252683, -0.5175617, 2.329516, 1, 0, 0.7960784, 1,
1.261299, -0.3968624, 2.320693, 1, 0, 0.7921569, 1,
1.268937, 0.2219267, -0.009203781, 1, 0, 0.7843137, 1,
1.278219, -1.692877, 1.442364, 1, 0, 0.7803922, 1,
1.283086, -1.41102, 2.183016, 1, 0, 0.772549, 1,
1.283473, -0.3590523, 0.7462958, 1, 0, 0.7686275, 1,
1.291277, 0.3087057, 1.640208, 1, 0, 0.7607843, 1,
1.295928, 0.8492883, 0.2309559, 1, 0, 0.7568628, 1,
1.298839, 0.9616954, 0.9089811, 1, 0, 0.7490196, 1,
1.299472, 0.3099729, 0.9357512, 1, 0, 0.7450981, 1,
1.308085, 0.3280854, 0.7125371, 1, 0, 0.7372549, 1,
1.313524, 0.05424286, 3.343116, 1, 0, 0.7333333, 1,
1.323816, -0.6474591, 2.898102, 1, 0, 0.7254902, 1,
1.331233, -0.7384039, 2.513345, 1, 0, 0.7215686, 1,
1.335165, -0.244661, 2.515707, 1, 0, 0.7137255, 1,
1.336224, 1.410217, 1.294576, 1, 0, 0.7098039, 1,
1.339119, -1.12992, 2.085996, 1, 0, 0.7019608, 1,
1.360042, -1.796626, 3.286033, 1, 0, 0.6941177, 1,
1.362971, -1.240704, -0.06842306, 1, 0, 0.6901961, 1,
1.364471, -0.4202977, 0.7814912, 1, 0, 0.682353, 1,
1.36657, -1.362211, 4.471116, 1, 0, 0.6784314, 1,
1.373402, -0.4390388, 3.894627, 1, 0, 0.6705883, 1,
1.378238, -0.6957352, 1.391606, 1, 0, 0.6666667, 1,
1.383321, -0.5615436, 2.956672, 1, 0, 0.6588235, 1,
1.392077, -0.154729, 3.141662, 1, 0, 0.654902, 1,
1.399555, 1.940539, 0.8970661, 1, 0, 0.6470588, 1,
1.399591, 0.6996034, 1.374619, 1, 0, 0.6431373, 1,
1.404026, -0.3397372, 0.2321197, 1, 0, 0.6352941, 1,
1.409627, -0.8964583, 2.944121, 1, 0, 0.6313726, 1,
1.411533, -1.574284, 2.339453, 1, 0, 0.6235294, 1,
1.417608, -0.1927292, 0.9428087, 1, 0, 0.6196079, 1,
1.420211, 1.407269, 1.595619, 1, 0, 0.6117647, 1,
1.42309, 0.1364474, 0.5541546, 1, 0, 0.6078432, 1,
1.437639, 0.3212484, 2.111019, 1, 0, 0.6, 1,
1.448741, 0.2658933, 3.429617, 1, 0, 0.5921569, 1,
1.450563, 1.208741, 2.363894, 1, 0, 0.5882353, 1,
1.463069, -2.360345, 2.796805, 1, 0, 0.5803922, 1,
1.471358, -1.443594, 3.198641, 1, 0, 0.5764706, 1,
1.485134, -0.8302605, 0.9865345, 1, 0, 0.5686275, 1,
1.486367, 0.07913289, 0.7697005, 1, 0, 0.5647059, 1,
1.494848, -0.4088663, 1.196995, 1, 0, 0.5568628, 1,
1.498931, -1.923382, 3.260618, 1, 0, 0.5529412, 1,
1.500548, -0.2800882, 1.725242, 1, 0, 0.5450981, 1,
1.503043, 1.230436, 1.179387, 1, 0, 0.5411765, 1,
1.505737, 0.9570099, 0.9984742, 1, 0, 0.5333334, 1,
1.509966, -0.9356418, 4.425555, 1, 0, 0.5294118, 1,
1.514673, 0.3306975, 1.103904, 1, 0, 0.5215687, 1,
1.516133, -0.3746171, 1.787823, 1, 0, 0.5176471, 1,
1.522658, 0.9868991, -0.03325301, 1, 0, 0.509804, 1,
1.533349, 0.7658709, 2.260659, 1, 0, 0.5058824, 1,
1.537113, -1.787423, 3.400929, 1, 0, 0.4980392, 1,
1.537972, 0.4948382, 2.644797, 1, 0, 0.4901961, 1,
1.545413, 0.3728606, 1.465995, 1, 0, 0.4862745, 1,
1.56924, -1.770602, 2.712461, 1, 0, 0.4784314, 1,
1.5899, -0.3516918, 2.334586, 1, 0, 0.4745098, 1,
1.593871, -0.3308225, 1.257808, 1, 0, 0.4666667, 1,
1.606058, -1.076806, 1.309097, 1, 0, 0.4627451, 1,
1.610194, -0.1905141, 2.320666, 1, 0, 0.454902, 1,
1.613045, 0.01841752, 1.438731, 1, 0, 0.4509804, 1,
1.623558, -1.076188, 1.996791, 1, 0, 0.4431373, 1,
1.623899, 2.457977, 2.425301, 1, 0, 0.4392157, 1,
1.631682, 1.213151, 0.5072695, 1, 0, 0.4313726, 1,
1.633222, 0.7341337, 0.609179, 1, 0, 0.427451, 1,
1.634272, -1.081785, 1.704754, 1, 0, 0.4196078, 1,
1.637064, 0.5271945, 0.1339554, 1, 0, 0.4156863, 1,
1.637841, 0.1674275, -0.7021104, 1, 0, 0.4078431, 1,
1.641075, -1.644872, 4.304534, 1, 0, 0.4039216, 1,
1.649284, 1.905971, 1.027755, 1, 0, 0.3960784, 1,
1.649611, 0.09349836, 1.131623, 1, 0, 0.3882353, 1,
1.666142, -1.198331, 3.75804, 1, 0, 0.3843137, 1,
1.666186, -0.2251283, 1.417104, 1, 0, 0.3764706, 1,
1.666449, 0.4205356, 0.9795635, 1, 0, 0.372549, 1,
1.669782, 1.263683, 0.9267751, 1, 0, 0.3647059, 1,
1.675718, 1.657694, 0.1645883, 1, 0, 0.3607843, 1,
1.691739, 0.2019457, 2.58475, 1, 0, 0.3529412, 1,
1.691937, -0.1173198, 3.339562, 1, 0, 0.3490196, 1,
1.69237, 0.0244655, 1.702556, 1, 0, 0.3411765, 1,
1.702509, -1.498175, 0.6137593, 1, 0, 0.3372549, 1,
1.70694, -0.08438282, 0.287635, 1, 0, 0.3294118, 1,
1.715124, 0.002933252, 1.974052, 1, 0, 0.3254902, 1,
1.715153, 0.5952281, 2.273137, 1, 0, 0.3176471, 1,
1.718785, -0.9060304, 3.513466, 1, 0, 0.3137255, 1,
1.720127, 0.7131078, 2.355189, 1, 0, 0.3058824, 1,
1.73743, 0.2107598, 1.253409, 1, 0, 0.2980392, 1,
1.752107, -2.289128, 2.647417, 1, 0, 0.2941177, 1,
1.755055, -0.3584688, 1.158983, 1, 0, 0.2862745, 1,
1.764505, 0.9625063, 1.548432, 1, 0, 0.282353, 1,
1.766866, 0.5078562, 1.521163, 1, 0, 0.2745098, 1,
1.779452, 0.8619398, 0.6433787, 1, 0, 0.2705882, 1,
1.807253, -0.7740647, 1.017773, 1, 0, 0.2627451, 1,
1.814026, 2.637738, 1.572887, 1, 0, 0.2588235, 1,
1.820965, 0.7697715, 0.9711215, 1, 0, 0.2509804, 1,
1.824857, 0.2064921, 0.3948436, 1, 0, 0.2470588, 1,
1.834492, -0.1145415, 2.551903, 1, 0, 0.2392157, 1,
1.834685, -0.2719533, -0.0212963, 1, 0, 0.2352941, 1,
1.834957, -0.9079836, 2.303185, 1, 0, 0.227451, 1,
1.838286, -0.08422226, 2.847261, 1, 0, 0.2235294, 1,
1.850676, 0.9054749, 2.451181, 1, 0, 0.2156863, 1,
1.859215, -0.6810175, 2.053038, 1, 0, 0.2117647, 1,
1.859397, -0.6232901, 2.79537, 1, 0, 0.2039216, 1,
1.861721, -0.008640342, 1.940706, 1, 0, 0.1960784, 1,
1.869992, 1.36899, 0.7861838, 1, 0, 0.1921569, 1,
1.905069, 1.485306, 0.5680472, 1, 0, 0.1843137, 1,
1.933336, -1.002649, 0.750487, 1, 0, 0.1803922, 1,
1.944934, -0.3827289, 1.372651, 1, 0, 0.172549, 1,
1.94757, 1.316076, 0.9716029, 1, 0, 0.1686275, 1,
1.952238, 0.3562725, -0.4125144, 1, 0, 0.1607843, 1,
2.051267, 1.034569, -0.01020035, 1, 0, 0.1568628, 1,
2.118216, -1.793613, 2.797476, 1, 0, 0.1490196, 1,
2.121123, 0.8626873, 1.69759, 1, 0, 0.145098, 1,
2.124298, -0.3033535, 1.895761, 1, 0, 0.1372549, 1,
2.178763, 1.080759, 0.2050585, 1, 0, 0.1333333, 1,
2.192353, -0.4990947, 2.15086, 1, 0, 0.1254902, 1,
2.246043, -0.3474192, 1.212133, 1, 0, 0.1215686, 1,
2.265799, 0.8867878, 2.434788, 1, 0, 0.1137255, 1,
2.281323, 0.7253721, 1.984742, 1, 0, 0.1098039, 1,
2.283083, 0.2369492, 1.824118, 1, 0, 0.1019608, 1,
2.317175, -0.4222061, 1.805911, 1, 0, 0.09411765, 1,
2.345971, -0.1181943, 1.197909, 1, 0, 0.09019608, 1,
2.352554, 0.4563529, 0.9582532, 1, 0, 0.08235294, 1,
2.393729, 2.359633, 0.4508196, 1, 0, 0.07843138, 1,
2.434261, 1.827329, 0.2282892, 1, 0, 0.07058824, 1,
2.442157, -0.4259752, 2.579665, 1, 0, 0.06666667, 1,
2.456491, -0.2555151, 0.7873327, 1, 0, 0.05882353, 1,
2.470516, -0.4189316, 0.2207816, 1, 0, 0.05490196, 1,
2.482677, 0.7550864, 0.4897613, 1, 0, 0.04705882, 1,
2.498844, 0.946964, -1.043571, 1, 0, 0.04313726, 1,
2.530996, -0.05303789, 3.517019, 1, 0, 0.03529412, 1,
2.56903, -0.1590939, 1.367986, 1, 0, 0.03137255, 1,
2.587884, -1.057298, 2.821228, 1, 0, 0.02352941, 1,
2.648077, -0.108024, 0.4265101, 1, 0, 0.01960784, 1,
2.651325, 1.124246, 0.699038, 1, 0, 0.01176471, 1,
2.884578, -0.2695283, 1.737351, 1, 0, 0.007843138, 1
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
-0.2328048, -3.790491, -6.524555, 0, -0.5, 0.5, 0.5,
-0.2328048, -3.790491, -6.524555, 1, -0.5, 0.5, 0.5,
-0.2328048, -3.790491, -6.524555, 1, 1.5, 0.5, 0.5,
-0.2328048, -3.790491, -6.524555, 0, 1.5, 0.5, 0.5
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
-4.406981, -0.002709746, -6.524555, 0, -0.5, 0.5, 0.5,
-4.406981, -0.002709746, -6.524555, 1, -0.5, 0.5, 0.5,
-4.406981, -0.002709746, -6.524555, 1, 1.5, 0.5, 0.5,
-4.406981, -0.002709746, -6.524555, 0, 1.5, 0.5, 0.5
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
-4.406981, -3.790491, 0.1741552, 0, -0.5, 0.5, 0.5,
-4.406981, -3.790491, 0.1741552, 1, -0.5, 0.5, 0.5,
-4.406981, -3.790491, 0.1741552, 1, 1.5, 0.5, 0.5,
-4.406981, -3.790491, 0.1741552, 0, 1.5, 0.5, 0.5
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
-3, -2.916388, -4.978699,
2, -2.916388, -4.978699,
-3, -2.916388, -4.978699,
-3, -3.062072, -5.236341,
-2, -2.916388, -4.978699,
-2, -3.062072, -5.236341,
-1, -2.916388, -4.978699,
-1, -3.062072, -5.236341,
0, -2.916388, -4.978699,
0, -3.062072, -5.236341,
1, -2.916388, -4.978699,
1, -3.062072, -5.236341,
2, -2.916388, -4.978699,
2, -3.062072, -5.236341
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
-3, -3.35344, -5.751627, 0, -0.5, 0.5, 0.5,
-3, -3.35344, -5.751627, 1, -0.5, 0.5, 0.5,
-3, -3.35344, -5.751627, 1, 1.5, 0.5, 0.5,
-3, -3.35344, -5.751627, 0, 1.5, 0.5, 0.5,
-2, -3.35344, -5.751627, 0, -0.5, 0.5, 0.5,
-2, -3.35344, -5.751627, 1, -0.5, 0.5, 0.5,
-2, -3.35344, -5.751627, 1, 1.5, 0.5, 0.5,
-2, -3.35344, -5.751627, 0, 1.5, 0.5, 0.5,
-1, -3.35344, -5.751627, 0, -0.5, 0.5, 0.5,
-1, -3.35344, -5.751627, 1, -0.5, 0.5, 0.5,
-1, -3.35344, -5.751627, 1, 1.5, 0.5, 0.5,
-1, -3.35344, -5.751627, 0, 1.5, 0.5, 0.5,
0, -3.35344, -5.751627, 0, -0.5, 0.5, 0.5,
0, -3.35344, -5.751627, 1, -0.5, 0.5, 0.5,
0, -3.35344, -5.751627, 1, 1.5, 0.5, 0.5,
0, -3.35344, -5.751627, 0, 1.5, 0.5, 0.5,
1, -3.35344, -5.751627, 0, -0.5, 0.5, 0.5,
1, -3.35344, -5.751627, 1, -0.5, 0.5, 0.5,
1, -3.35344, -5.751627, 1, 1.5, 0.5, 0.5,
1, -3.35344, -5.751627, 0, 1.5, 0.5, 0.5,
2, -3.35344, -5.751627, 0, -0.5, 0.5, 0.5,
2, -3.35344, -5.751627, 1, -0.5, 0.5, 0.5,
2, -3.35344, -5.751627, 1, 1.5, 0.5, 0.5,
2, -3.35344, -5.751627, 0, 1.5, 0.5, 0.5
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
-3.443709, -2, -4.978699,
-3.443709, 2, -4.978699,
-3.443709, -2, -4.978699,
-3.604254, -2, -5.236341,
-3.443709, -1, -4.978699,
-3.604254, -1, -5.236341,
-3.443709, 0, -4.978699,
-3.604254, 0, -5.236341,
-3.443709, 1, -4.978699,
-3.604254, 1, -5.236341,
-3.443709, 2, -4.978699,
-3.604254, 2, -5.236341
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
-3.925345, -2, -5.751627, 0, -0.5, 0.5, 0.5,
-3.925345, -2, -5.751627, 1, -0.5, 0.5, 0.5,
-3.925345, -2, -5.751627, 1, 1.5, 0.5, 0.5,
-3.925345, -2, -5.751627, 0, 1.5, 0.5, 0.5,
-3.925345, -1, -5.751627, 0, -0.5, 0.5, 0.5,
-3.925345, -1, -5.751627, 1, -0.5, 0.5, 0.5,
-3.925345, -1, -5.751627, 1, 1.5, 0.5, 0.5,
-3.925345, -1, -5.751627, 0, 1.5, 0.5, 0.5,
-3.925345, 0, -5.751627, 0, -0.5, 0.5, 0.5,
-3.925345, 0, -5.751627, 1, -0.5, 0.5, 0.5,
-3.925345, 0, -5.751627, 1, 1.5, 0.5, 0.5,
-3.925345, 0, -5.751627, 0, 1.5, 0.5, 0.5,
-3.925345, 1, -5.751627, 0, -0.5, 0.5, 0.5,
-3.925345, 1, -5.751627, 1, -0.5, 0.5, 0.5,
-3.925345, 1, -5.751627, 1, 1.5, 0.5, 0.5,
-3.925345, 1, -5.751627, 0, 1.5, 0.5, 0.5,
-3.925345, 2, -5.751627, 0, -0.5, 0.5, 0.5,
-3.925345, 2, -5.751627, 1, -0.5, 0.5, 0.5,
-3.925345, 2, -5.751627, 1, 1.5, 0.5, 0.5,
-3.925345, 2, -5.751627, 0, 1.5, 0.5, 0.5
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
-3.443709, -2.916388, -4,
-3.443709, -2.916388, 4,
-3.443709, -2.916388, -4,
-3.604254, -3.062072, -4,
-3.443709, -2.916388, -2,
-3.604254, -3.062072, -2,
-3.443709, -2.916388, 0,
-3.604254, -3.062072, 0,
-3.443709, -2.916388, 2,
-3.604254, -3.062072, 2,
-3.443709, -2.916388, 4,
-3.604254, -3.062072, 4
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
-3.925345, -3.35344, -4, 0, -0.5, 0.5, 0.5,
-3.925345, -3.35344, -4, 1, -0.5, 0.5, 0.5,
-3.925345, -3.35344, -4, 1, 1.5, 0.5, 0.5,
-3.925345, -3.35344, -4, 0, 1.5, 0.5, 0.5,
-3.925345, -3.35344, -2, 0, -0.5, 0.5, 0.5,
-3.925345, -3.35344, -2, 1, -0.5, 0.5, 0.5,
-3.925345, -3.35344, -2, 1, 1.5, 0.5, 0.5,
-3.925345, -3.35344, -2, 0, 1.5, 0.5, 0.5,
-3.925345, -3.35344, 0, 0, -0.5, 0.5, 0.5,
-3.925345, -3.35344, 0, 1, -0.5, 0.5, 0.5,
-3.925345, -3.35344, 0, 1, 1.5, 0.5, 0.5,
-3.925345, -3.35344, 0, 0, 1.5, 0.5, 0.5,
-3.925345, -3.35344, 2, 0, -0.5, 0.5, 0.5,
-3.925345, -3.35344, 2, 1, -0.5, 0.5, 0.5,
-3.925345, -3.35344, 2, 1, 1.5, 0.5, 0.5,
-3.925345, -3.35344, 2, 0, 1.5, 0.5, 0.5,
-3.925345, -3.35344, 4, 0, -0.5, 0.5, 0.5,
-3.925345, -3.35344, 4, 1, -0.5, 0.5, 0.5,
-3.925345, -3.35344, 4, 1, 1.5, 0.5, 0.5,
-3.925345, -3.35344, 4, 0, 1.5, 0.5, 0.5
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
-3.443709, -2.916388, -4.978699,
-3.443709, 2.910968, -4.978699,
-3.443709, -2.916388, 5.327009,
-3.443709, 2.910968, 5.327009,
-3.443709, -2.916388, -4.978699,
-3.443709, -2.916388, 5.327009,
-3.443709, 2.910968, -4.978699,
-3.443709, 2.910968, 5.327009,
-3.443709, -2.916388, -4.978699,
2.9781, -2.916388, -4.978699,
-3.443709, -2.916388, 5.327009,
2.9781, -2.916388, 5.327009,
-3.443709, 2.910968, -4.978699,
2.9781, 2.910968, -4.978699,
-3.443709, 2.910968, 5.327009,
2.9781, 2.910968, 5.327009,
2.9781, -2.916388, -4.978699,
2.9781, 2.910968, -4.978699,
2.9781, -2.916388, 5.327009,
2.9781, 2.910968, 5.327009,
2.9781, -2.916388, -4.978699,
2.9781, -2.916388, 5.327009,
2.9781, 2.910968, -4.978699,
2.9781, 2.910968, 5.327009
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
var radius = 7.192013;
var distance = 31.99808;
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
mvMatrix.translate( 0.2328048, 0.002709746, -0.1741552 );
mvMatrix.scale( 1.210896, 1.334421, 0.7545474 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -31.99808);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Sulfotep<-read.table("Sulfotep.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Sulfotep$V2
```

```
## Error in eval(expr, envir, enclos): object 'Sulfotep' not found
```

```r
y<-Sulfotep$V3
```

```
## Error in eval(expr, envir, enclos): object 'Sulfotep' not found
```

```r
z<-Sulfotep$V4
```

```
## Error in eval(expr, envir, enclos): object 'Sulfotep' not found
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
-3.350188, -1.685968, -3.69415, 0, 0, 1, 1, 1,
-3.122036, 0.3266414, -2.688626, 1, 0, 0, 1, 1,
-2.794547, -0.6864657, -2.013752, 1, 0, 0, 1, 1,
-2.721629, 0.8178961, -1.022164, 1, 0, 0, 1, 1,
-2.593238, -1.902337, -2.276389, 1, 0, 0, 1, 1,
-2.538218, 0.6926197, -1.56986, 1, 0, 0, 1, 1,
-2.499372, -0.2817675, -1.961545, 0, 0, 0, 1, 1,
-2.496274, 0.2812605, -2.381463, 0, 0, 0, 1, 1,
-2.34625, -0.2047566, -1.882856, 0, 0, 0, 1, 1,
-2.243876, -1.263484, -4.122512, 0, 0, 0, 1, 1,
-2.233873, 0.4355698, -1.559748, 0, 0, 0, 1, 1,
-2.232669, 0.8342168, -2.139111, 0, 0, 0, 1, 1,
-2.230736, 0.05194551, -3.401715, 0, 0, 0, 1, 1,
-2.165242, 0.6188783, -0.6866791, 1, 1, 1, 1, 1,
-2.159596, 0.8657903, -0.4601225, 1, 1, 1, 1, 1,
-2.145351, -0.6806222, -2.291367, 1, 1, 1, 1, 1,
-2.037796, -0.04274504, -2.322951, 1, 1, 1, 1, 1,
-2.00642, -2.701701, -1.690834, 1, 1, 1, 1, 1,
-1.94873, -0.4328241, -1.92868, 1, 1, 1, 1, 1,
-1.917343, -0.3736835, 0.5835949, 1, 1, 1, 1, 1,
-1.915739, -1.258322, -3.668266, 1, 1, 1, 1, 1,
-1.900771, 0.4976554, -1.874552, 1, 1, 1, 1, 1,
-1.869282, -1.227129, -0.04084472, 1, 1, 1, 1, 1,
-1.859291, 1.207366, -0.8015489, 1, 1, 1, 1, 1,
-1.854275, -1.642449, -1.924057, 1, 1, 1, 1, 1,
-1.833201, 1.582124, -0.9935172, 1, 1, 1, 1, 1,
-1.830198, -0.1799268, -2.293198, 1, 1, 1, 1, 1,
-1.826106, 1.767405, -0.1804851, 1, 1, 1, 1, 1,
-1.823718, -0.2075886, -1.362705, 0, 0, 1, 1, 1,
-1.819176, 0.1884697, -2.141424, 1, 0, 0, 1, 1,
-1.811924, 1.39007, -0.5679852, 1, 0, 0, 1, 1,
-1.805239, 0.4013784, -3.290491, 1, 0, 0, 1, 1,
-1.786772, 1.374483, -1.777478, 1, 0, 0, 1, 1,
-1.777704, -0.245375, -3.465103, 1, 0, 0, 1, 1,
-1.743965, 1.13656, -0.3563052, 0, 0, 0, 1, 1,
-1.732464, -0.1424868, -1.117211, 0, 0, 0, 1, 1,
-1.718307, 0.571702, -0.9714504, 0, 0, 0, 1, 1,
-1.694021, -1.695669, -3.41768, 0, 0, 0, 1, 1,
-1.688115, -0.9964374, -1.156037, 0, 0, 0, 1, 1,
-1.674486, 1.630327, -0.1568774, 0, 0, 0, 1, 1,
-1.662276, -0.6267228, -3.113464, 0, 0, 0, 1, 1,
-1.650608, 0.123285, -1.475909, 1, 1, 1, 1, 1,
-1.648128, -0.02565959, -0.5363702, 1, 1, 1, 1, 1,
-1.639208, -0.4249495, -1.102239, 1, 1, 1, 1, 1,
-1.631197, 0.6468294, -0.2136024, 1, 1, 1, 1, 1,
-1.628219, 0.556531, -0.01191592, 1, 1, 1, 1, 1,
-1.622871, -0.817423, -1.560004, 1, 1, 1, 1, 1,
-1.612953, 0.3922553, -1.62311, 1, 1, 1, 1, 1,
-1.60102, -1.990905, -2.411482, 1, 1, 1, 1, 1,
-1.600351, 1.545012, -0.2470926, 1, 1, 1, 1, 1,
-1.59076, 0.9409997, 0.2109831, 1, 1, 1, 1, 1,
-1.590724, 1.433972, -0.5382204, 1, 1, 1, 1, 1,
-1.59018, 1.576505, -0.4024803, 1, 1, 1, 1, 1,
-1.586368, 0.8133909, -1.081552, 1, 1, 1, 1, 1,
-1.583889, -0.2779693, -3.616825, 1, 1, 1, 1, 1,
-1.573635, -0.9939961, -1.207882, 1, 1, 1, 1, 1,
-1.561013, 0.2303782, -2.693977, 0, 0, 1, 1, 1,
-1.544439, -0.01052974, 0.745208, 1, 0, 0, 1, 1,
-1.535603, 1.01915, 0.3081169, 1, 0, 0, 1, 1,
-1.531191, -0.3411809, -2.604324, 1, 0, 0, 1, 1,
-1.527651, 1.369915, -1.831352, 1, 0, 0, 1, 1,
-1.523332, 2.335972, -1.700823, 1, 0, 0, 1, 1,
-1.523083, -0.2899463, -1.698786, 0, 0, 0, 1, 1,
-1.522692, -1.834543, -4.150724, 0, 0, 0, 1, 1,
-1.501938, -0.8466279, -1.829148, 0, 0, 0, 1, 1,
-1.500719, 1.176061, -1.374011, 0, 0, 0, 1, 1,
-1.497851, -2.104286, -1.152817, 0, 0, 0, 1, 1,
-1.485914, -0.6409308, -1.814599, 0, 0, 0, 1, 1,
-1.48169, -1.701709, -3.473785, 0, 0, 0, 1, 1,
-1.476473, -1.339999, -1.131456, 1, 1, 1, 1, 1,
-1.469924, 0.6988384, 0.5222808, 1, 1, 1, 1, 1,
-1.425978, 0.4562721, -0.5395442, 1, 1, 1, 1, 1,
-1.425436, -1.586, -1.590678, 1, 1, 1, 1, 1,
-1.421039, 0.5182307, -3.044871, 1, 1, 1, 1, 1,
-1.419142, 1.27244, -1.969742, 1, 1, 1, 1, 1,
-1.414161, -1.223542, -0.848875, 1, 1, 1, 1, 1,
-1.413282, 0.4432038, -2.308975, 1, 1, 1, 1, 1,
-1.41095, -1.303806, -3.284752, 1, 1, 1, 1, 1,
-1.408611, 2.054401, -0.9350715, 1, 1, 1, 1, 1,
-1.404998, 0.7194772, -0.4149984, 1, 1, 1, 1, 1,
-1.401399, 1.227019, -0.2166029, 1, 1, 1, 1, 1,
-1.401265, -0.5266398, -2.338863, 1, 1, 1, 1, 1,
-1.398021, -0.807552, -0.7241303, 1, 1, 1, 1, 1,
-1.397788, 0.0709473, -2.717803, 1, 1, 1, 1, 1,
-1.368875, 1.226292, -1.688442, 0, 0, 1, 1, 1,
-1.368597, 0.7006831, -0.1682191, 1, 0, 0, 1, 1,
-1.352877, -0.1849504, -0.9227767, 1, 0, 0, 1, 1,
-1.348631, -1.542258, -3.05999, 1, 0, 0, 1, 1,
-1.345762, -0.3771031, -0.238024, 1, 0, 0, 1, 1,
-1.338577, 2.227542, 0.71727, 1, 0, 0, 1, 1,
-1.337212, -0.4941423, -1.726584, 0, 0, 0, 1, 1,
-1.329181, -2.119011, -1.211577, 0, 0, 0, 1, 1,
-1.329077, 0.2740902, -1.408046, 0, 0, 0, 1, 1,
-1.328926, 0.3202918, -1.404843, 0, 0, 0, 1, 1,
-1.325787, 0.1476038, -1.270333, 0, 0, 0, 1, 1,
-1.321044, 2.826104, 0.07865943, 0, 0, 0, 1, 1,
-1.319174, 0.1025241, -1.831346, 0, 0, 0, 1, 1,
-1.308116, -0.5319238, -0.7507839, 1, 1, 1, 1, 1,
-1.298991, -0.4509612, -3.43112, 1, 1, 1, 1, 1,
-1.291005, 0.4738429, -0.5768991, 1, 1, 1, 1, 1,
-1.284634, 0.06755236, 0.4729498, 1, 1, 1, 1, 1,
-1.282348, -1.155717, -4.473035, 1, 1, 1, 1, 1,
-1.28146, 0.3974866, -2.751049, 1, 1, 1, 1, 1,
-1.265252, -0.4409136, -1.137051, 1, 1, 1, 1, 1,
-1.261334, 0.1844045, -1.371931, 1, 1, 1, 1, 1,
-1.261018, 0.3059084, -2.242092, 1, 1, 1, 1, 1,
-1.244776, 0.5660619, -3.975583, 1, 1, 1, 1, 1,
-1.241796, 1.42112, 1.4557, 1, 1, 1, 1, 1,
-1.237334, 2.12288, -0.8002262, 1, 1, 1, 1, 1,
-1.236932, 0.03438566, -3.01336, 1, 1, 1, 1, 1,
-1.236713, 0.1895781, 0.2246697, 1, 1, 1, 1, 1,
-1.231547, -0.3718607, -1.720163, 1, 1, 1, 1, 1,
-1.230608, 0.7448925, -2.53732, 0, 0, 1, 1, 1,
-1.225198, -1.094822, -2.871796, 1, 0, 0, 1, 1,
-1.224471, -1.527033, -3.484163, 1, 0, 0, 1, 1,
-1.220332, -0.2469686, -2.569208, 1, 0, 0, 1, 1,
-1.219745, -2.831523, -2.77266, 1, 0, 0, 1, 1,
-1.216176, 1.097773, 0.3519035, 1, 0, 0, 1, 1,
-1.207313, -0.5203823, -3.798042, 0, 0, 0, 1, 1,
-1.201714, 1.468691, -0.8206406, 0, 0, 0, 1, 1,
-1.1985, -1.184785, -3.127033, 0, 0, 0, 1, 1,
-1.193964, -0.5968075, -1.283391, 0, 0, 0, 1, 1,
-1.190573, -0.3704644, -0.7812783, 0, 0, 0, 1, 1,
-1.182637, 1.050108, 0.6641395, 0, 0, 0, 1, 1,
-1.163268, -0.1176851, -0.9062394, 0, 0, 0, 1, 1,
-1.162641, 1.36191, -0.7785292, 1, 1, 1, 1, 1,
-1.159367, -1.286657, -1.52302, 1, 1, 1, 1, 1,
-1.158436, -0.2859981, -0.4946959, 1, 1, 1, 1, 1,
-1.148603, -0.2926545, -0.9283781, 1, 1, 1, 1, 1,
-1.14567, 0.1511531, -1.047284, 1, 1, 1, 1, 1,
-1.138519, 1.755903, -0.9925121, 1, 1, 1, 1, 1,
-1.125915, -0.219402, -2.111814, 1, 1, 1, 1, 1,
-1.120151, 0.4586128, -3.211073, 1, 1, 1, 1, 1,
-1.117231, -0.3637672, -0.5644379, 1, 1, 1, 1, 1,
-1.114438, 0.7273915, -1.180607, 1, 1, 1, 1, 1,
-1.106945, 1.499104, 0.7982845, 1, 1, 1, 1, 1,
-1.105148, 0.09558026, -3.204551, 1, 1, 1, 1, 1,
-1.101371, 0.03363553, -1.036824, 1, 1, 1, 1, 1,
-1.100583, 1.594898, -1.06619, 1, 1, 1, 1, 1,
-1.094606, 0.6930419, -1.314412, 1, 1, 1, 1, 1,
-1.093247, -1.770235, -3.562003, 0, 0, 1, 1, 1,
-1.08953, -1.934961, -1.483847, 1, 0, 0, 1, 1,
-1.085609, 1.348086, -2.616709, 1, 0, 0, 1, 1,
-1.079162, -0.470649, -1.685267, 1, 0, 0, 1, 1,
-1.077823, 2.086165, -0.8896767, 1, 0, 0, 1, 1,
-1.074355, -0.02400353, -1.124826, 1, 0, 0, 1, 1,
-1.068225, -1.766998, -1.478743, 0, 0, 0, 1, 1,
-1.068188, 0.8286919, -0.5390438, 0, 0, 0, 1, 1,
-1.062763, -1.086264, -3.158054, 0, 0, 0, 1, 1,
-1.049881, 0.07944423, -1.25559, 0, 0, 0, 1, 1,
-1.048483, -1.202544, -3.118848, 0, 0, 0, 1, 1,
-1.045176, -0.4522879, -2.348211, 0, 0, 0, 1, 1,
-1.040333, 0.9013768, -1.492838, 0, 0, 0, 1, 1,
-1.038173, -1.155019, -2.276291, 1, 1, 1, 1, 1,
-1.034796, -0.8996699, -0.794469, 1, 1, 1, 1, 1,
-1.032681, 1.092695, 1.106868, 1, 1, 1, 1, 1,
-1.031439, 0.03591371, -2.716954, 1, 1, 1, 1, 1,
-1.029393, -1.007802, -2.172081, 1, 1, 1, 1, 1,
-1.02513, -0.9822899, -2.920002, 1, 1, 1, 1, 1,
-1.024604, 0.5292569, -0.7596978, 1, 1, 1, 1, 1,
-1.023094, 0.7210324, -0.716506, 1, 1, 1, 1, 1,
-1.016643, -0.9058573, -0.3575057, 1, 1, 1, 1, 1,
-1.016535, -0.8125582, -1.183755, 1, 1, 1, 1, 1,
-1.016507, 0.2070039, -0.9157557, 1, 1, 1, 1, 1,
-1.015518, 0.220337, 0.3483004, 1, 1, 1, 1, 1,
-1.003325, 0.9336399, -0.993086, 1, 1, 1, 1, 1,
-1.001187, 1.271451, -1.899857, 1, 1, 1, 1, 1,
-0.9972315, -1.636575, -1.775092, 1, 1, 1, 1, 1,
-0.9933095, 0.9686095, -1.678337, 0, 0, 1, 1, 1,
-0.9933057, -0.3297771, -3.27694, 1, 0, 0, 1, 1,
-0.991801, -1.519548, -2.813602, 1, 0, 0, 1, 1,
-0.9869928, -1.780673, -4.828616, 1, 0, 0, 1, 1,
-0.986369, 0.8738394, -1.892464, 1, 0, 0, 1, 1,
-0.9807129, -0.2526912, -1.108039, 1, 0, 0, 1, 1,
-0.9676801, -0.8944827, -2.088731, 0, 0, 0, 1, 1,
-0.960452, -1.201477, -3.451614, 0, 0, 0, 1, 1,
-0.9602219, 2.056919, -0.6108583, 0, 0, 0, 1, 1,
-0.9586315, -0.5049509, -2.055871, 0, 0, 0, 1, 1,
-0.9565338, 1.75604, -1.046157, 0, 0, 0, 1, 1,
-0.9558599, 1.771149, 1.063692, 0, 0, 0, 1, 1,
-0.9554578, 0.2309888, -0.955081, 0, 0, 0, 1, 1,
-0.9477702, 0.3574186, -0.07467061, 1, 1, 1, 1, 1,
-0.9420565, -1.656879, -4.1875, 1, 1, 1, 1, 1,
-0.9418772, -0.9716066, -3.037474, 1, 1, 1, 1, 1,
-0.9337922, -0.8283284, -1.321427, 1, 1, 1, 1, 1,
-0.9281318, 1.690888, -0.9537335, 1, 1, 1, 1, 1,
-0.9206194, -0.01040521, -2.721217, 1, 1, 1, 1, 1,
-0.9151416, 2.495164, -0.1229914, 1, 1, 1, 1, 1,
-0.9149081, -0.2364562, -0.9804301, 1, 1, 1, 1, 1,
-0.9120081, -0.3646459, -1.881508, 1, 1, 1, 1, 1,
-0.9112654, 0.5233744, -0.6035471, 1, 1, 1, 1, 1,
-0.9096778, 0.03954435, -1.565325, 1, 1, 1, 1, 1,
-0.9093831, -1.751037, -1.109254, 1, 1, 1, 1, 1,
-0.9069118, -0.5948945, -2.15953, 1, 1, 1, 1, 1,
-0.906801, -0.6258143, -2.558418, 1, 1, 1, 1, 1,
-0.8988086, -0.6745831, -1.203879, 1, 1, 1, 1, 1,
-0.8979218, 0.3044964, -0.9951832, 0, 0, 1, 1, 1,
-0.8974085, -1.24043, -3.085643, 1, 0, 0, 1, 1,
-0.8897541, 0.3022199, -0.903919, 1, 0, 0, 1, 1,
-0.887799, 0.8803628, -0.7488626, 1, 0, 0, 1, 1,
-0.8854805, -0.843799, -1.796746, 1, 0, 0, 1, 1,
-0.8811979, 0.08526202, -0.6479986, 1, 0, 0, 1, 1,
-0.8784103, 0.4935512, 0.1609292, 0, 0, 0, 1, 1,
-0.8697888, -0.1573977, 0.5813078, 0, 0, 0, 1, 1,
-0.8587564, 0.7484242, -1.63651, 0, 0, 0, 1, 1,
-0.8465, -0.01964795, -3.42321, 0, 0, 0, 1, 1,
-0.8341085, -0.003023786, -2.014733, 0, 0, 0, 1, 1,
-0.8258901, 0.02553516, -1.488779, 0, 0, 0, 1, 1,
-0.8208469, 0.7528104, -1.195626, 0, 0, 0, 1, 1,
-0.8204657, 0.4332208, -1.837549, 1, 1, 1, 1, 1,
-0.8196219, 0.1911821, -0.1715158, 1, 1, 1, 1, 1,
-0.8195763, -0.1503655, -2.154267, 1, 1, 1, 1, 1,
-0.8177968, 1.318808, -0.05343811, 1, 1, 1, 1, 1,
-0.8152795, -1.097856, -1.291765, 1, 1, 1, 1, 1,
-0.8127176, 0.4358475, -1.121021, 1, 1, 1, 1, 1,
-0.8093283, -2.377825, -1.594299, 1, 1, 1, 1, 1,
-0.804834, 0.3640453, -2.071551, 1, 1, 1, 1, 1,
-0.8038316, 2.735789, -1.167917, 1, 1, 1, 1, 1,
-0.8013932, -0.7361705, -2.151504, 1, 1, 1, 1, 1,
-0.7839538, -0.1393906, -0.6558685, 1, 1, 1, 1, 1,
-0.7827144, -1.595137, -2.215488, 1, 1, 1, 1, 1,
-0.7799553, -0.3833396, -1.858544, 1, 1, 1, 1, 1,
-0.7755903, 0.5437998, -2.078169, 1, 1, 1, 1, 1,
-0.7750579, -0.02229968, -2.855005, 1, 1, 1, 1, 1,
-0.7639997, 0.3966084, -1.725127, 0, 0, 1, 1, 1,
-0.7610018, -0.6934926, -1.437319, 1, 0, 0, 1, 1,
-0.7550686, 0.166284, -0.9187298, 1, 0, 0, 1, 1,
-0.7537764, -0.3084082, -1.710973, 1, 0, 0, 1, 1,
-0.7519795, 0.7885303, 1.674292, 1, 0, 0, 1, 1,
-0.7503539, 1.195499, 0.3306874, 1, 0, 0, 1, 1,
-0.7415426, 0.8855702, -1.016816, 0, 0, 0, 1, 1,
-0.7380101, -0.1848945, -1.214619, 0, 0, 0, 1, 1,
-0.7356725, 0.1199092, 0.2093932, 0, 0, 0, 1, 1,
-0.731741, 0.7700761, -1.080258, 0, 0, 0, 1, 1,
-0.7290488, 1.79227, -0.5024784, 0, 0, 0, 1, 1,
-0.7271429, 0.9855407, -0.3865911, 0, 0, 0, 1, 1,
-0.7253633, -0.05345946, -0.4832219, 0, 0, 0, 1, 1,
-0.7241417, -0.1757403, -2.81936, 1, 1, 1, 1, 1,
-0.7197023, 1.19734, 0.74833, 1, 1, 1, 1, 1,
-0.7189213, -1.629107, -0.5839434, 1, 1, 1, 1, 1,
-0.7091894, -0.738528, -1.034621, 1, 1, 1, 1, 1,
-0.6996896, -0.129943, -2.390162, 1, 1, 1, 1, 1,
-0.6845708, 0.8305585, -2.417818, 1, 1, 1, 1, 1,
-0.6837555, 0.9016246, -0.9241665, 1, 1, 1, 1, 1,
-0.682022, 1.055285, -0.6893216, 1, 1, 1, 1, 1,
-0.6730133, 0.4528428, -1.443014, 1, 1, 1, 1, 1,
-0.6633993, -0.6723207, -3.486025, 1, 1, 1, 1, 1,
-0.6631141, 0.07749252, -1.367747, 1, 1, 1, 1, 1,
-0.6616671, -0.9455574, -2.485528, 1, 1, 1, 1, 1,
-0.6593503, -0.2412466, -1.030404, 1, 1, 1, 1, 1,
-0.6584003, 1.383009, -0.532466, 1, 1, 1, 1, 1,
-0.6572109, 0.7592447, -0.2150623, 1, 1, 1, 1, 1,
-0.6554198, 0.5767688, 0.7072261, 0, 0, 1, 1, 1,
-0.6509201, -0.6921741, -3.424399, 1, 0, 0, 1, 1,
-0.6433343, -2.394176, -3.601853, 1, 0, 0, 1, 1,
-0.6427505, -0.8870395, -2.19462, 1, 0, 0, 1, 1,
-0.6404474, -0.7767613, -3.797646, 1, 0, 0, 1, 1,
-0.6284165, 0.422325, -1.369391, 1, 0, 0, 1, 1,
-0.6265979, 0.3382626, -1.40239, 0, 0, 0, 1, 1,
-0.6264068, -0.3168667, 1.524021, 0, 0, 0, 1, 1,
-0.6249177, -0.6751527, -1.240923, 0, 0, 0, 1, 1,
-0.624097, -0.04653061, -1.299965, 0, 0, 0, 1, 1,
-0.6233229, -0.1189036, -1.322506, 0, 0, 0, 1, 1,
-0.6225414, 0.2194446, -2.645877, 0, 0, 0, 1, 1,
-0.6212004, -0.3999807, -2.175113, 0, 0, 0, 1, 1,
-0.6201832, 0.2151179, -0.5642222, 1, 1, 1, 1, 1,
-0.613703, -1.942519, -1.333008, 1, 1, 1, 1, 1,
-0.6131119, 0.5714557, 0.1979617, 1, 1, 1, 1, 1,
-0.607658, -0.732197, -3.226794, 1, 1, 1, 1, 1,
-0.6019021, -0.9540995, -0.9532261, 1, 1, 1, 1, 1,
-0.5999587, 0.5473762, -1.087836, 1, 1, 1, 1, 1,
-0.5935773, 0.5464274, -2.460584, 1, 1, 1, 1, 1,
-0.5900229, 0.8961308, -0.8093586, 1, 1, 1, 1, 1,
-0.5772892, 1.785386, -1.520101, 1, 1, 1, 1, 1,
-0.575038, 0.2219759, -1.108088, 1, 1, 1, 1, 1,
-0.5720388, 1.29695, -0.2718496, 1, 1, 1, 1, 1,
-0.5625063, -0.3172929, -1.607908, 1, 1, 1, 1, 1,
-0.5614462, 0.8518091, 0.1338295, 1, 1, 1, 1, 1,
-0.5597128, 0.818873, -2.436753, 1, 1, 1, 1, 1,
-0.5580986, 0.5796233, -1.323393, 1, 1, 1, 1, 1,
-0.5536512, 1.828997, -0.6371068, 0, 0, 1, 1, 1,
-0.5515864, 0.2029763, -0.3890083, 1, 0, 0, 1, 1,
-0.5457086, -0.7083178, -2.578977, 1, 0, 0, 1, 1,
-0.5421283, -0.6812847, -1.863235, 1, 0, 0, 1, 1,
-0.5408266, 0.2220846, -0.2188544, 1, 0, 0, 1, 1,
-0.5346898, -0.06052164, -3.073042, 1, 0, 0, 1, 1,
-0.5317893, -0.8801981, -1.727564, 0, 0, 0, 1, 1,
-0.527252, -0.2487225, -1.830673, 0, 0, 0, 1, 1,
-0.5271879, 1.16289, -0.5488721, 0, 0, 0, 1, 1,
-0.5270023, 0.2443952, -0.4242254, 0, 0, 0, 1, 1,
-0.523815, 0.4287696, -2.45517, 0, 0, 0, 1, 1,
-0.5187119, -0.1994186, -1.693082, 0, 0, 0, 1, 1,
-0.5125101, 0.3066621, -0.7268565, 0, 0, 0, 1, 1,
-0.5111625, -0.9945127, -4.223526, 1, 1, 1, 1, 1,
-0.5088621, 0.3081995, 0.1511551, 1, 1, 1, 1, 1,
-0.5077806, -1.447599, -2.18281, 1, 1, 1, 1, 1,
-0.5065434, -0.4430276, -2.744202, 1, 1, 1, 1, 1,
-0.5020693, -0.6458795, -3.406623, 1, 1, 1, 1, 1,
-0.4943002, -0.2238235, -1.088856, 1, 1, 1, 1, 1,
-0.4937936, -0.3809274, -1.185077, 1, 1, 1, 1, 1,
-0.4915302, -0.1107466, -2.09499, 1, 1, 1, 1, 1,
-0.4824539, -1.135946, -2.252552, 1, 1, 1, 1, 1,
-0.4821695, -1.540689, -2.610376, 1, 1, 1, 1, 1,
-0.480578, 0.7657979, -2.283087, 1, 1, 1, 1, 1,
-0.4796655, -1.632114, -4.662139, 1, 1, 1, 1, 1,
-0.4782939, 1.676128, -0.3504141, 1, 1, 1, 1, 1,
-0.4705593, -0.01876948, -2.66234, 1, 1, 1, 1, 1,
-0.4683625, -0.09222534, -2.132741, 1, 1, 1, 1, 1,
-0.4673874, -0.1103963, -1.328375, 0, 0, 1, 1, 1,
-0.4669808, -0.5990011, -1.69915, 1, 0, 0, 1, 1,
-0.4651174, -0.5766658, -2.576189, 1, 0, 0, 1, 1,
-0.4591739, 1.383684, -0.06504066, 1, 0, 0, 1, 1,
-0.4572024, -0.4532028, -3.501723, 1, 0, 0, 1, 1,
-0.4526476, 0.2347035, -0.3563243, 1, 0, 0, 1, 1,
-0.4470591, 0.04870626, -1.125103, 0, 0, 0, 1, 1,
-0.4462546, 1.683541, -1.039487, 0, 0, 0, 1, 1,
-0.4417383, 0.2676663, -1.235965, 0, 0, 0, 1, 1,
-0.4374857, -2.240119, -2.793289, 0, 0, 0, 1, 1,
-0.4341576, 0.657085, -0.08364133, 0, 0, 0, 1, 1,
-0.4250286, 1.198858, -0.5903658, 0, 0, 0, 1, 1,
-0.4229434, 2.17125, -2.003793, 0, 0, 0, 1, 1,
-0.4202493, 1.053092, 1.500339, 1, 1, 1, 1, 1,
-0.4183713, -1.593317, -2.375643, 1, 1, 1, 1, 1,
-0.4131652, 0.004125629, -1.618344, 1, 1, 1, 1, 1,
-0.4126616, 0.1927314, -1.942486, 1, 1, 1, 1, 1,
-0.4032992, -1.573785, -2.317969, 1, 1, 1, 1, 1,
-0.3950078, -1.174383, -3.878868, 1, 1, 1, 1, 1,
-0.3925287, -1.527965, -2.034908, 1, 1, 1, 1, 1,
-0.3894022, -0.9099332, -2.328909, 1, 1, 1, 1, 1,
-0.3890175, -0.8901975, -2.243286, 1, 1, 1, 1, 1,
-0.3820559, 0.1959621, -0.7903367, 1, 1, 1, 1, 1,
-0.3800401, -0.9438342, -2.204963, 1, 1, 1, 1, 1,
-0.3756743, -1.709447, -2.332026, 1, 1, 1, 1, 1,
-0.3747078, 0.2918821, 0.2672004, 1, 1, 1, 1, 1,
-0.3731258, 0.1261649, -1.407233, 1, 1, 1, 1, 1,
-0.3729449, 0.005305881, -2.230247, 1, 1, 1, 1, 1,
-0.3713251, 1.273123, -0.8619404, 0, 0, 1, 1, 1,
-0.3681047, -0.2517098, -0.6399815, 1, 0, 0, 1, 1,
-0.3671547, 0.7265043, -1.149168, 1, 0, 0, 1, 1,
-0.3661855, 0.2706016, 0.1045022, 1, 0, 0, 1, 1,
-0.3652398, 0.1437734, -0.07019363, 1, 0, 0, 1, 1,
-0.364496, 0.6654578, 1.465543, 1, 0, 0, 1, 1,
-0.3611422, -0.9578275, -1.492001, 0, 0, 0, 1, 1,
-0.3584259, 0.2086389, -2.263372, 0, 0, 0, 1, 1,
-0.3551175, 1.69133, -2.301792, 0, 0, 0, 1, 1,
-0.3538443, 0.7971933, -2.120869, 0, 0, 0, 1, 1,
-0.3509392, 1.693703, -1.906198, 0, 0, 0, 1, 1,
-0.3506115, -1.17002, -2.91, 0, 0, 0, 1, 1,
-0.350049, 0.0586743, -1.103614, 0, 0, 0, 1, 1,
-0.3500484, 0.523864, 0.6790801, 1, 1, 1, 1, 1,
-0.3458411, -0.2699974, -0.7060603, 1, 1, 1, 1, 1,
-0.3417934, -1.301511, -3.202043, 1, 1, 1, 1, 1,
-0.337058, 0.07532793, -0.6009824, 1, 1, 1, 1, 1,
-0.3305346, 0.4158618, -0.0181349, 1, 1, 1, 1, 1,
-0.3175676, -2.124513, -2.045518, 1, 1, 1, 1, 1,
-0.3143992, -1.272882, -3.229108, 1, 1, 1, 1, 1,
-0.3132748, -0.5473026, -1.987436, 1, 1, 1, 1, 1,
-0.3125008, 1.099441, 2.429657, 1, 1, 1, 1, 1,
-0.3109283, -0.168611, -3.053747, 1, 1, 1, 1, 1,
-0.3045791, -0.5916787, -3.115052, 1, 1, 1, 1, 1,
-0.2977095, -0.98325, -2.694289, 1, 1, 1, 1, 1,
-0.2939207, 1.565279, 0.5965549, 1, 1, 1, 1, 1,
-0.293549, 0.190061, -1.192693, 1, 1, 1, 1, 1,
-0.2912926, 0.4018471, -0.5334662, 1, 1, 1, 1, 1,
-0.2839201, -0.8819388, -4.685895, 0, 0, 1, 1, 1,
-0.2731331, 1.08064, -0.09304026, 1, 0, 0, 1, 1,
-0.2700638, 1.336082, 0.3870022, 1, 0, 0, 1, 1,
-0.2686037, -1.009883, -2.23454, 1, 0, 0, 1, 1,
-0.2633231, -0.9459095, -2.461183, 1, 0, 0, 1, 1,
-0.2631668, -0.7357371, -2.893962, 1, 0, 0, 1, 1,
-0.2622194, 0.4564917, -0.1820254, 0, 0, 0, 1, 1,
-0.2608645, -1.003794, -4.050524, 0, 0, 0, 1, 1,
-0.2599384, -0.6953157, -2.70249, 0, 0, 0, 1, 1,
-0.2585977, -0.1593854, -1.599501, 0, 0, 0, 1, 1,
-0.2576751, 0.8972149, 1.584017, 0, 0, 0, 1, 1,
-0.2524126, 0.1180931, -0.1820308, 0, 0, 0, 1, 1,
-0.2480849, 0.5308383, 1.04528, 0, 0, 0, 1, 1,
-0.2458299, -0.3764971, -2.24437, 1, 1, 1, 1, 1,
-0.2457072, 1.91753, 2.644817, 1, 1, 1, 1, 1,
-0.2421607, -0.8111891, -3.398617, 1, 1, 1, 1, 1,
-0.2410103, -0.1001478, -1.14765, 1, 1, 1, 1, 1,
-0.2396654, -1.814248, -2.744405, 1, 1, 1, 1, 1,
-0.2392967, -0.493649, -3.723136, 1, 1, 1, 1, 1,
-0.2359297, 0.7464455, -1.307348, 1, 1, 1, 1, 1,
-0.2332877, 1.0085, -0.7995871, 1, 1, 1, 1, 1,
-0.23257, -0.3890029, -3.627262, 1, 1, 1, 1, 1,
-0.2247946, -0.9672503, -4.810205, 1, 1, 1, 1, 1,
-0.224469, 0.09073, -2.340827, 1, 1, 1, 1, 1,
-0.2199481, -0.7363909, -1.358565, 1, 1, 1, 1, 1,
-0.2151112, -0.106206, -1.315196, 1, 1, 1, 1, 1,
-0.2118239, 0.4112122, 0.1802766, 1, 1, 1, 1, 1,
-0.2078897, -0.2395601, -3.667788, 1, 1, 1, 1, 1,
-0.1990971, -0.1825383, -2.184647, 0, 0, 1, 1, 1,
-0.1990723, 0.8296905, 1.480981, 1, 0, 0, 1, 1,
-0.1962409, -0.4497195, -1.847538, 1, 0, 0, 1, 1,
-0.1958604, -0.1933096, -2.811581, 1, 0, 0, 1, 1,
-0.1937379, -0.1277446, -0.254758, 1, 0, 0, 1, 1,
-0.1918228, -0.4517522, -2.367751, 1, 0, 0, 1, 1,
-0.1908471, -0.03771548, -0.6539942, 0, 0, 0, 1, 1,
-0.1903526, 0.4606816, -0.1185718, 0, 0, 0, 1, 1,
-0.1893189, 1.7916, -1.023099, 0, 0, 0, 1, 1,
-0.1892669, 1.010486, 0.1861686, 0, 0, 0, 1, 1,
-0.1882062, -1.676669, -1.573714, 0, 0, 0, 1, 1,
-0.1870565, 0.2446125, -1.578176, 0, 0, 0, 1, 1,
-0.1852095, 1.52615, -0.9370145, 0, 0, 0, 1, 1,
-0.1822106, -0.09294873, -2.046016, 1, 1, 1, 1, 1,
-0.1773273, -1.624207, -3.856001, 1, 1, 1, 1, 1,
-0.1771519, -0.3489175, -3.049455, 1, 1, 1, 1, 1,
-0.1750961, -0.225338, -1.50377, 1, 1, 1, 1, 1,
-0.1737709, 1.453333, 0.9479362, 1, 1, 1, 1, 1,
-0.1733944, 0.9955709, 0.5942687, 1, 1, 1, 1, 1,
-0.1677271, 0.07800713, -0.4743273, 1, 1, 1, 1, 1,
-0.166213, -1.960028, -2.112573, 1, 1, 1, 1, 1,
-0.1660694, 0.5165187, -1.967189, 1, 1, 1, 1, 1,
-0.1635438, 0.4681127, -0.3834299, 1, 1, 1, 1, 1,
-0.1615589, 1.282421, -1.288725, 1, 1, 1, 1, 1,
-0.1603487, 0.1914484, 0.7356409, 1, 1, 1, 1, 1,
-0.1602733, -0.2148343, -3.374103, 1, 1, 1, 1, 1,
-0.157254, 1.109179, -0.6137062, 1, 1, 1, 1, 1,
-0.1560765, -0.06559038, -0.5633786, 1, 1, 1, 1, 1,
-0.15404, 0.1640695, -1.717728, 0, 0, 1, 1, 1,
-0.1540249, -0.9915946, -3.54068, 1, 0, 0, 1, 1,
-0.1508182, 0.5431675, 1.458632, 1, 0, 0, 1, 1,
-0.1501686, -0.253914, -1.607018, 1, 0, 0, 1, 1,
-0.1475067, 0.7997498, 1.458452, 1, 0, 0, 1, 1,
-0.1404888, -0.3751592, -4.427101, 1, 0, 0, 1, 1,
-0.1364361, 0.6893248, -0.6899807, 0, 0, 0, 1, 1,
-0.1277757, -2.204327, -3.929327, 0, 0, 0, 1, 1,
-0.1262496, 1.304272, 0.05465004, 0, 0, 0, 1, 1,
-0.1253472, 0.2718316, -0.4369917, 0, 0, 0, 1, 1,
-0.1230595, 0.2250804, -2.435885, 0, 0, 0, 1, 1,
-0.1229611, 0.4096048, -1.470254, 0, 0, 0, 1, 1,
-0.1218447, 1.813477, -0.8781217, 0, 0, 0, 1, 1,
-0.1213017, 0.6347624, 0.1714429, 1, 1, 1, 1, 1,
-0.1187601, 1.201336, 1.542262, 1, 1, 1, 1, 1,
-0.1180861, 1.230832, -0.3752699, 1, 1, 1, 1, 1,
-0.117847, -1.021936, -2.623788, 1, 1, 1, 1, 1,
-0.1169377, -2.342388, -3.251669, 1, 1, 1, 1, 1,
-0.1117276, -1.460518, -2.605065, 1, 1, 1, 1, 1,
-0.1116396, 0.7147497, 0.1562674, 1, 1, 1, 1, 1,
-0.1099984, -0.5153917, -3.445379, 1, 1, 1, 1, 1,
-0.1044586, 0.697203, 0.9275176, 1, 1, 1, 1, 1,
-0.1011406, -1.226938, -4.27001, 1, 1, 1, 1, 1,
-0.1007417, -0.6473909, -4.33112, 1, 1, 1, 1, 1,
-0.09994195, 1.148782, -0.6252068, 1, 1, 1, 1, 1,
-0.09910083, -1.286443, -3.452416, 1, 1, 1, 1, 1,
-0.09768556, -1.620668, -2.039935, 1, 1, 1, 1, 1,
-0.08564236, 1.00922, -0.3699096, 1, 1, 1, 1, 1,
-0.08554973, 0.4911689, 1.26637, 0, 0, 1, 1, 1,
-0.08376042, 0.6198583, -0.9390036, 1, 0, 0, 1, 1,
-0.0801817, 0.2679321, 0.7379605, 1, 0, 0, 1, 1,
-0.07853264, 0.9703291, -0.5013931, 1, 0, 0, 1, 1,
-0.07741341, 0.1305653, -0.9623715, 1, 0, 0, 1, 1,
-0.07455497, -0.8663483, -3.199573, 1, 0, 0, 1, 1,
-0.06825796, -0.1091468, -1.399095, 0, 0, 0, 1, 1,
-0.06667305, -0.3810576, -2.361611, 0, 0, 0, 1, 1,
-0.06368045, -0.9434887, -2.927088, 0, 0, 0, 1, 1,
-0.06310122, 1.486489, -0.5182504, 0, 0, 0, 1, 1,
-0.06193068, -0.1793994, -2.047654, 0, 0, 0, 1, 1,
-0.06119166, 0.9848716, -1.642279, 0, 0, 0, 1, 1,
-0.06028591, -0.7251134, -4.134914, 0, 0, 0, 1, 1,
-0.05016792, -0.5695526, -1.14572, 1, 1, 1, 1, 1,
-0.04985166, 0.2482711, -0.1000267, 1, 1, 1, 1, 1,
-0.04960085, -0.4191397, -2.463276, 1, 1, 1, 1, 1,
-0.04431336, 0.3308468, -0.830459, 1, 1, 1, 1, 1,
-0.0426594, 1.488373, 0.5451272, 1, 1, 1, 1, 1,
-0.04113594, -0.3425558, -2.33715, 1, 1, 1, 1, 1,
-0.04012674, 1.029251, 1.214307, 1, 1, 1, 1, 1,
-0.03973553, 1.457511, 2.789548, 1, 1, 1, 1, 1,
-0.03918844, -0.6286288, -3.454692, 1, 1, 1, 1, 1,
-0.03628718, 0.1265286, 0.5399509, 1, 1, 1, 1, 1,
-0.03504302, -2.021719, -3.599217, 1, 1, 1, 1, 1,
-0.03182752, -0.3644155, -3.617951, 1, 1, 1, 1, 1,
-0.03062734, 2.21518, -1.279661, 1, 1, 1, 1, 1,
-0.02939273, -0.8254333, -4.293639, 1, 1, 1, 1, 1,
-0.02604329, -2.632142, -2.437287, 1, 1, 1, 1, 1,
-0.01885997, -1.40013, -2.257986, 0, 0, 1, 1, 1,
-0.01865749, 0.2647749, 1.037851, 1, 0, 0, 1, 1,
-0.007513196, 1.626215, -0.7346092, 1, 0, 0, 1, 1,
-0.007426038, 0.7180341, 0.5012802, 1, 0, 0, 1, 1,
-0.005355915, 0.9745396, 0.4078231, 1, 0, 0, 1, 1,
-0.002313393, -0.6805938, -2.113679, 1, 0, 0, 1, 1,
0.003549672, 0.8876273, -0.5227516, 0, 0, 0, 1, 1,
0.004669236, 0.2212688, 1.023733, 0, 0, 0, 1, 1,
0.0074544, 0.5941962, -0.2502329, 0, 0, 0, 1, 1,
0.009955985, -1.56025, 2.347608, 0, 0, 0, 1, 1,
0.01292824, -0.06622037, 0.7925454, 0, 0, 0, 1, 1,
0.01317936, 1.625027, -0.4205852, 0, 0, 0, 1, 1,
0.01318556, 0.9542671, 0.09178937, 0, 0, 0, 1, 1,
0.01395531, 0.490941, -0.9321428, 1, 1, 1, 1, 1,
0.01452822, 1.261986, -0.02402578, 1, 1, 1, 1, 1,
0.01632104, 1.40883, 1.600999, 1, 1, 1, 1, 1,
0.01732128, 0.6651061, -0.3320495, 1, 1, 1, 1, 1,
0.02643696, -1.731906, 2.99638, 1, 1, 1, 1, 1,
0.02792019, -1.268494, 4.005155, 1, 1, 1, 1, 1,
0.03279871, -0.8869156, 3.40743, 1, 1, 1, 1, 1,
0.04231673, -0.2616673, 1.768815, 1, 1, 1, 1, 1,
0.04238746, 0.6693733, 0.1303829, 1, 1, 1, 1, 1,
0.04254999, -1.15698, 4.796553, 1, 1, 1, 1, 1,
0.04334949, -0.3167415, 3.919452, 1, 1, 1, 1, 1,
0.04415801, -0.2175788, 1.885383, 1, 1, 1, 1, 1,
0.04739312, 0.8182049, 0.4115862, 1, 1, 1, 1, 1,
0.05466899, 1.232481, 0.7316606, 1, 1, 1, 1, 1,
0.0583622, 0.6661371, 0.5664295, 1, 1, 1, 1, 1,
0.06352393, 0.5828267, -0.01843508, 0, 0, 1, 1, 1,
0.07374933, -0.24077, 4.125167, 1, 0, 0, 1, 1,
0.07507538, 0.9357636, 1.903626, 1, 0, 0, 1, 1,
0.07569658, 0.8936973, -0.4257954, 1, 0, 0, 1, 1,
0.07795269, 0.01850681, 2.203921, 1, 0, 0, 1, 1,
0.07919078, 0.9894636, 0.2081694, 1, 0, 0, 1, 1,
0.08082056, 1.537838, -0.4082822, 0, 0, 0, 1, 1,
0.08138472, -1.031756, 3.124496, 0, 0, 0, 1, 1,
0.08508652, -0.738197, 3.054345, 0, 0, 0, 1, 1,
0.08610232, 0.3261578, 1.244219, 0, 0, 0, 1, 1,
0.08619076, -0.03942613, 1.731798, 0, 0, 0, 1, 1,
0.08631326, -0.5259818, 2.686437, 0, 0, 0, 1, 1,
0.09592265, 0.09267848, 0.6726835, 0, 0, 0, 1, 1,
0.09649672, -0.2420043, 3.505265, 1, 1, 1, 1, 1,
0.09905674, 0.7402781, 1.28938, 1, 1, 1, 1, 1,
0.1038875, 0.3136867, -0.8101127, 1, 1, 1, 1, 1,
0.1134761, 0.6146672, -0.7417179, 1, 1, 1, 1, 1,
0.1157883, -1.737472, 2.4442, 1, 1, 1, 1, 1,
0.1184586, 0.4918385, 0.4263473, 1, 1, 1, 1, 1,
0.1213808, -0.1814476, 3.295806, 1, 1, 1, 1, 1,
0.1224714, -0.02211751, 1.855422, 1, 1, 1, 1, 1,
0.1260472, 0.4634762, -1.069323, 1, 1, 1, 1, 1,
0.1316087, -0.5446855, 2.340593, 1, 1, 1, 1, 1,
0.1327872, 1.251715, 1.105885, 1, 1, 1, 1, 1,
0.1328039, -1.38823, 3.173661, 1, 1, 1, 1, 1,
0.1328286, 0.6999425, 1.633187, 1, 1, 1, 1, 1,
0.1353765, 0.1367317, 2.408916, 1, 1, 1, 1, 1,
0.1358571, -0.1372438, 3.233682, 1, 1, 1, 1, 1,
0.1367484, 0.1587963, 2.573724, 0, 0, 1, 1, 1,
0.1378756, 0.3909036, -1.385748, 1, 0, 0, 1, 1,
0.1435351, 0.8145126, -0.441573, 1, 0, 0, 1, 1,
0.1466752, -0.4005204, 1.46318, 1, 0, 0, 1, 1,
0.1484389, 0.1753711, 0.9185442, 1, 0, 0, 1, 1,
0.1498981, 0.457961, -0.03975447, 1, 0, 0, 1, 1,
0.1524836, -1.635864, 4.109395, 0, 0, 0, 1, 1,
0.1555385, 0.3900381, 0.6375365, 0, 0, 0, 1, 1,
0.1572122, -0.2522772, 1.958558, 0, 0, 0, 1, 1,
0.1611686, -0.04287348, 3.396237, 0, 0, 0, 1, 1,
0.1622169, 2.045935, 0.1003123, 0, 0, 0, 1, 1,
0.1651883, 1.391782, -1.348023, 0, 0, 0, 1, 1,
0.1668779, -0.002332553, 1.841399, 0, 0, 0, 1, 1,
0.1690078, 0.03760495, 1.289056, 1, 1, 1, 1, 1,
0.1691788, 0.6240328, -0.5108716, 1, 1, 1, 1, 1,
0.1697791, 0.07831255, 0.7994229, 1, 1, 1, 1, 1,
0.1746707, 2.514016, -0.7428113, 1, 1, 1, 1, 1,
0.1758169, -0.3906888, 2.723922, 1, 1, 1, 1, 1,
0.1768591, 1.395305, -0.3953513, 1, 1, 1, 1, 1,
0.1789273, -1.336485, 1.126818, 1, 1, 1, 1, 1,
0.1815967, -1.657722, 2.676274, 1, 1, 1, 1, 1,
0.1829318, -0.4295947, 3.347503, 1, 1, 1, 1, 1,
0.183827, -0.8324217, 1.335404, 1, 1, 1, 1, 1,
0.1905178, 0.8724652, -0.3074251, 1, 1, 1, 1, 1,
0.1928434, -0.2572015, 2.706558, 1, 1, 1, 1, 1,
0.1936347, 0.1842377, 1.874809, 1, 1, 1, 1, 1,
0.1939128, 1.195619, 1.474099, 1, 1, 1, 1, 1,
0.2011581, 0.2260034, 0.4245879, 1, 1, 1, 1, 1,
0.2021036, -0.4038889, 2.434746, 0, 0, 1, 1, 1,
0.2053258, -0.3445792, 3.046691, 1, 0, 0, 1, 1,
0.2076143, -0.02781962, 1.842293, 1, 0, 0, 1, 1,
0.2079237, -1.557625, 3.988252, 1, 0, 0, 1, 1,
0.208697, -0.6874663, 2.654928, 1, 0, 0, 1, 1,
0.2113961, 0.08016871, 0.214853, 1, 0, 0, 1, 1,
0.2132045, 0.3404616, 1.203458, 0, 0, 0, 1, 1,
0.2178783, 0.07007265, 1.993241, 0, 0, 0, 1, 1,
0.2260745, -1.64353, 2.682852, 0, 0, 0, 1, 1,
0.2269686, -0.03613848, 0.8853872, 0, 0, 0, 1, 1,
0.2270548, -1.24894, 1.807362, 0, 0, 0, 1, 1,
0.2272765, 1.362212, -0.5479015, 0, 0, 0, 1, 1,
0.2276981, -1.11352, 1.786144, 0, 0, 0, 1, 1,
0.2336019, 0.1055065, 0.9551675, 1, 1, 1, 1, 1,
0.2345688, -0.7185715, 3.467847, 1, 1, 1, 1, 1,
0.2434684, -1.176336, 2.168242, 1, 1, 1, 1, 1,
0.2447889, -0.6152114, 3.302256, 1, 1, 1, 1, 1,
0.245073, 0.8001349, -1.018113, 1, 1, 1, 1, 1,
0.247433, -0.5637043, 2.756331, 1, 1, 1, 1, 1,
0.2583329, -0.3875791, 2.656434, 1, 1, 1, 1, 1,
0.2585589, -0.00170781, 1.124761, 1, 1, 1, 1, 1,
0.2602931, -0.02836505, 2.730331, 1, 1, 1, 1, 1,
0.2608802, 0.4955809, 0.2803343, 1, 1, 1, 1, 1,
0.2623522, -1.025397, 3.97051, 1, 1, 1, 1, 1,
0.2652429, 0.4524902, 2.562485, 1, 1, 1, 1, 1,
0.2753776, -0.3432767, 2.493313, 1, 1, 1, 1, 1,
0.2761613, -0.05316649, 1.974965, 1, 1, 1, 1, 1,
0.2772984, -0.7884796, 2.826985, 1, 1, 1, 1, 1,
0.2846467, 0.6180745, 1.742196, 0, 0, 1, 1, 1,
0.2899011, -1.132661, 2.415696, 1, 0, 0, 1, 1,
0.2903795, 0.845744, -0.1385752, 1, 0, 0, 1, 1,
0.2928087, -0.5730977, 2.5754, 1, 0, 0, 1, 1,
0.2943657, 0.2003442, 0.9404668, 1, 0, 0, 1, 1,
0.297554, -0.9082262, 2.996142, 1, 0, 0, 1, 1,
0.2995695, -0.6965988, 2.277955, 0, 0, 0, 1, 1,
0.3016781, 0.8325837, 1.799645, 0, 0, 0, 1, 1,
0.3018374, 0.6810812, 1.919229, 0, 0, 0, 1, 1,
0.3030795, 1.422646, -0.3624741, 0, 0, 0, 1, 1,
0.3171467, 0.1471464, 2.090956, 0, 0, 0, 1, 1,
0.3185434, 0.5281852, 0.4123795, 0, 0, 0, 1, 1,
0.3187445, 1.178054, -0.04798505, 0, 0, 0, 1, 1,
0.3231956, 0.4283508, -0.877118, 1, 1, 1, 1, 1,
0.3233166, 0.684862, 0.6369594, 1, 1, 1, 1, 1,
0.3234158, 0.2610209, 0.6671858, 1, 1, 1, 1, 1,
0.3236215, -0.5446122, 3.306457, 1, 1, 1, 1, 1,
0.3238938, -0.4716906, 3.350648, 1, 1, 1, 1, 1,
0.32535, -0.7365933, 1.647958, 1, 1, 1, 1, 1,
0.3261372, 0.8062631, -0.3896434, 1, 1, 1, 1, 1,
0.3276131, 1.463051, -0.6284435, 1, 1, 1, 1, 1,
0.3293606, -0.5658543, 4.543607, 1, 1, 1, 1, 1,
0.3323985, -0.6634436, 4.191271, 1, 1, 1, 1, 1,
0.3326993, 1.112273, -0.3388654, 1, 1, 1, 1, 1,
0.3391549, -0.1888884, 3.007738, 1, 1, 1, 1, 1,
0.3433222, -0.9926677, 3.223433, 1, 1, 1, 1, 1,
0.3433981, -1.049893, 3.767915, 1, 1, 1, 1, 1,
0.3441454, 0.3630714, -0.5247624, 1, 1, 1, 1, 1,
0.3455812, -1.173887, 2.400175, 0, 0, 1, 1, 1,
0.3480687, -1.367414, 3.065473, 1, 0, 0, 1, 1,
0.3484893, 0.5221355, 1.846843, 1, 0, 0, 1, 1,
0.3514812, -0.1982475, 3.291534, 1, 0, 0, 1, 1,
0.3517166, -1.028126, 3.9138, 1, 0, 0, 1, 1,
0.3547757, 1.004306, 0.2522883, 1, 0, 0, 1, 1,
0.3648801, 0.3105118, 0.5984186, 0, 0, 0, 1, 1,
0.3662608, -0.3088464, 2.495962, 0, 0, 0, 1, 1,
0.3662654, 0.461826, 1.597157, 0, 0, 0, 1, 1,
0.3742489, 0.3448155, 0.001122914, 0, 0, 0, 1, 1,
0.3798193, 0.5954069, 0.9622867, 0, 0, 0, 1, 1,
0.3803133, 0.3358003, 1.58183, 0, 0, 0, 1, 1,
0.3820279, -1.507447, 2.007021, 0, 0, 0, 1, 1,
0.388705, -0.01100589, 3.006044, 1, 1, 1, 1, 1,
0.3899004, 0.5667843, 1.96501, 1, 1, 1, 1, 1,
0.3921256, 0.3784101, 0.05474991, 1, 1, 1, 1, 1,
0.3964896, 0.3868189, 0.235909, 1, 1, 1, 1, 1,
0.3999561, 1.258405, -0.1773035, 1, 1, 1, 1, 1,
0.4042487, -1.081359, 2.725262, 1, 1, 1, 1, 1,
0.4075924, 2.818417, -0.5253676, 1, 1, 1, 1, 1,
0.41124, 0.5752273, 0.431807, 1, 1, 1, 1, 1,
0.4115224, 0.1679235, 3.124942, 1, 1, 1, 1, 1,
0.4118799, 0.7395781, -0.5833041, 1, 1, 1, 1, 1,
0.4121613, 0.6308827, 0.6355208, 1, 1, 1, 1, 1,
0.4193352, 0.6641885, 1.715488, 1, 1, 1, 1, 1,
0.420958, -0.1435182, 2.122831, 1, 1, 1, 1, 1,
0.4230669, 0.5414106, 0.4440587, 1, 1, 1, 1, 1,
0.4341312, 0.801245, 1.700621, 1, 1, 1, 1, 1,
0.4378335, 0.5461355, 0.5403774, 0, 0, 1, 1, 1,
0.4390599, -1.118723, 1.383814, 1, 0, 0, 1, 1,
0.4447836, 1.698789, 1.826047, 1, 0, 0, 1, 1,
0.4470061, -1.925884, 3.219193, 1, 0, 0, 1, 1,
0.4501163, 1.257112, 0.8915147, 1, 0, 0, 1, 1,
0.4512444, 0.7183731, 0.008713438, 1, 0, 0, 1, 1,
0.4544918, -1.433363, 1.705188, 0, 0, 0, 1, 1,
0.4558075, -0.7870178, 2.091321, 0, 0, 0, 1, 1,
0.4600885, 0.7218663, 1.257943, 0, 0, 0, 1, 1,
0.4625351, 0.3107196, 0.7923252, 0, 0, 0, 1, 1,
0.4737096, 0.611748, -0.4269355, 0, 0, 0, 1, 1,
0.477311, 0.3033581, 1.336364, 0, 0, 0, 1, 1,
0.4802822, -0.5114964, 2.613635, 0, 0, 0, 1, 1,
0.487689, -0.4071963, 2.960748, 1, 1, 1, 1, 1,
0.4898312, 0.1487908, 2.009126, 1, 1, 1, 1, 1,
0.4899195, -0.3654969, 1.913989, 1, 1, 1, 1, 1,
0.4910502, -0.03438852, 0.7605355, 1, 1, 1, 1, 1,
0.4949431, -0.1064759, 0.5454693, 1, 1, 1, 1, 1,
0.495194, 0.329629, 1.336926, 1, 1, 1, 1, 1,
0.496304, 1.08624, -0.7098007, 1, 1, 1, 1, 1,
0.4965121, 0.5641683, 0.877176, 1, 1, 1, 1, 1,
0.4975363, -0.5693023, 1.331546, 1, 1, 1, 1, 1,
0.5042195, 0.9068619, 1.425193, 1, 1, 1, 1, 1,
0.5132135, 0.4316251, 1.786949, 1, 1, 1, 1, 1,
0.5149487, -0.8876224, 2.83323, 1, 1, 1, 1, 1,
0.5188022, -0.1790033, 2.099431, 1, 1, 1, 1, 1,
0.5236905, 0.9827319, 1.059624, 1, 1, 1, 1, 1,
0.5248432, 2.469415, -0.08418819, 1, 1, 1, 1, 1,
0.5257477, 0.2237459, 1.085951, 0, 0, 1, 1, 1,
0.5282179, -0.6065205, 1.471976, 1, 0, 0, 1, 1,
0.528312, 0.8384552, 0.4694198, 1, 0, 0, 1, 1,
0.5283286, 0.5168599, -0.7472938, 1, 0, 0, 1, 1,
0.5286977, 1.209313, 0.2530123, 1, 0, 0, 1, 1,
0.5320816, -1.162769, 1.997558, 1, 0, 0, 1, 1,
0.5379819, -1.159137, 1.616693, 0, 0, 0, 1, 1,
0.5420435, -2.034644, 5.176926, 0, 0, 0, 1, 1,
0.5444568, 0.332992, 1.402116, 0, 0, 0, 1, 1,
0.5486372, 0.3907129, 1.006237, 0, 0, 0, 1, 1,
0.5544523, 0.4185777, 2.696946, 0, 0, 0, 1, 1,
0.5549906, 0.4659366, 2.044146, 0, 0, 0, 1, 1,
0.5567315, -1.063059, 2.614095, 0, 0, 0, 1, 1,
0.5586672, 0.7957755, 0.4841248, 1, 1, 1, 1, 1,
0.5621685, -1.452297, 2.034784, 1, 1, 1, 1, 1,
0.5678095, 0.3413742, -0.2819362, 1, 1, 1, 1, 1,
0.5701981, -1.715338, 1.275134, 1, 1, 1, 1, 1,
0.5718849, 0.5466721, -0.2116716, 1, 1, 1, 1, 1,
0.5722393, -0.9100381, 3.290753, 1, 1, 1, 1, 1,
0.5778404, -0.8218889, 1.825682, 1, 1, 1, 1, 1,
0.5823324, -0.008364229, 1.689719, 1, 1, 1, 1, 1,
0.5909173, 0.3679324, 0.7106671, 1, 1, 1, 1, 1,
0.6003796, -1.734406, 3.689061, 1, 1, 1, 1, 1,
0.6035212, -0.7910295, 1.805186, 1, 1, 1, 1, 1,
0.6064613, 0.7069409, 0.3845264, 1, 1, 1, 1, 1,
0.6078041, 1.530006, -0.4295927, 1, 1, 1, 1, 1,
0.6138069, 0.6965894, 0.09104344, 1, 1, 1, 1, 1,
0.6145886, 0.08386803, 0.3915692, 1, 1, 1, 1, 1,
0.6214341, 0.3619094, 1.934079, 0, 0, 1, 1, 1,
0.6244754, -0.5680882, -0.3459053, 1, 0, 0, 1, 1,
0.6262388, 0.5302606, 1.838087, 1, 0, 0, 1, 1,
0.6278194, 0.7757024, 0.8924009, 1, 0, 0, 1, 1,
0.6309335, 0.7268245, 3.45363, 1, 0, 0, 1, 1,
0.6331148, -0.9316846, 2.084462, 1, 0, 0, 1, 1,
0.6337017, -0.3431486, 1.650656, 0, 0, 0, 1, 1,
0.6494408, 0.6086167, 2.745014, 0, 0, 0, 1, 1,
0.6575829, -0.3162229, 2.338857, 0, 0, 0, 1, 1,
0.659878, 0.9251673, 0.7047517, 0, 0, 0, 1, 1,
0.6678483, -2.049378, 3.948172, 0, 0, 0, 1, 1,
0.6782353, -0.3845671, 2.254284, 0, 0, 0, 1, 1,
0.6821979, 0.364993, -1.63194, 0, 0, 0, 1, 1,
0.6829584, 1.220018, -0.4890622, 1, 1, 1, 1, 1,
0.6862102, 1.589358, 1.359736, 1, 1, 1, 1, 1,
0.6914433, 0.3821141, 0.4935499, 1, 1, 1, 1, 1,
0.6922997, -0.7944602, 0.7135202, 1, 1, 1, 1, 1,
0.6933625, -0.5549998, 2.498003, 1, 1, 1, 1, 1,
0.6961688, -0.05909227, 0.8502462, 1, 1, 1, 1, 1,
0.7049509, 0.7945224, -0.2117363, 1, 1, 1, 1, 1,
0.7107111, -0.772563, 2.67983, 1, 1, 1, 1, 1,
0.7123703, -0.03306723, 0.5192145, 1, 1, 1, 1, 1,
0.712867, 2.107426, 0.6635621, 1, 1, 1, 1, 1,
0.7138843, 0.09597476, 1.64498, 1, 1, 1, 1, 1,
0.7183204, 0.1760307, 0.3396029, 1, 1, 1, 1, 1,
0.7200568, 1.397003, 0.5715024, 1, 1, 1, 1, 1,
0.7276002, -0.1309158, 2.196831, 1, 1, 1, 1, 1,
0.7276381, -0.1436388, 1.673434, 1, 1, 1, 1, 1,
0.734135, 0.04688265, 1.929404, 0, 0, 1, 1, 1,
0.7367874, 0.1855213, 0.5652211, 1, 0, 0, 1, 1,
0.7391458, 1.227071, 0.2945225, 1, 0, 0, 1, 1,
0.7399478, 1.408454, 0.5512328, 1, 0, 0, 1, 1,
0.7403602, -2.334795, 1.891673, 1, 0, 0, 1, 1,
0.7446439, 0.05511506, 2.530432, 1, 0, 0, 1, 1,
0.7447567, -0.3676083, 0.3875591, 0, 0, 0, 1, 1,
0.7494782, 1.08408, 0.2009608, 0, 0, 0, 1, 1,
0.7520806, -1.686019, 4.690406, 0, 0, 0, 1, 1,
0.7528912, -1.033075, 2.467006, 0, 0, 0, 1, 1,
0.7659925, 0.9875007, 0.4703721, 0, 0, 0, 1, 1,
0.7665493, 0.3621602, 1.502428, 0, 0, 0, 1, 1,
0.7672588, 0.8606573, -0.01186369, 0, 0, 0, 1, 1,
0.7677161, 0.1677011, 2.142856, 1, 1, 1, 1, 1,
0.7707196, 0.2955084, 0.8435364, 1, 1, 1, 1, 1,
0.7795285, 0.3290161, -0.6236596, 1, 1, 1, 1, 1,
0.7838928, 0.9927148, 1.052067, 1, 1, 1, 1, 1,
0.7905337, -0.04389273, 2.207249, 1, 1, 1, 1, 1,
0.7916356, 1.071885, 1.560263, 1, 1, 1, 1, 1,
0.7923387, -1.371343, 1.998102, 1, 1, 1, 1, 1,
0.7947802, 0.2139748, -0.8189805, 1, 1, 1, 1, 1,
0.8002127, 0.2760569, 0.8387655, 1, 1, 1, 1, 1,
0.8023014, 0.9101902, 1.432675, 1, 1, 1, 1, 1,
0.811464, -0.1719544, 1.002546, 1, 1, 1, 1, 1,
0.8159137, 0.084528, 0.894492, 1, 1, 1, 1, 1,
0.8221059, -1.142279, 1.191534, 1, 1, 1, 1, 1,
0.8243206, -0.7566872, 1.712466, 1, 1, 1, 1, 1,
0.8244547, 0.2193325, -0.119002, 1, 1, 1, 1, 1,
0.8257707, 0.3905742, 1.629307, 0, 0, 1, 1, 1,
0.8314263, -1.242704, 2.676414, 1, 0, 0, 1, 1,
0.833093, 2.344104, 0.1000998, 1, 0, 0, 1, 1,
0.8341187, 0.8179067, 2.785136, 1, 0, 0, 1, 1,
0.8421718, -1.510606, 2.099982, 1, 0, 0, 1, 1,
0.8446001, 0.8152454, -0.1609387, 1, 0, 0, 1, 1,
0.859036, 0.2476674, 0.08548259, 0, 0, 0, 1, 1,
0.8641405, -0.610299, 1.459831, 0, 0, 0, 1, 1,
0.865308, -0.9072727, 2.834898, 0, 0, 0, 1, 1,
0.8654391, -1.146852, 1.049961, 0, 0, 0, 1, 1,
0.8665099, -0.1129306, 1.139755, 0, 0, 0, 1, 1,
0.8669813, -0.4037183, 1.518238, 0, 0, 0, 1, 1,
0.8673038, 0.3687964, 0.2460764, 0, 0, 0, 1, 1,
0.8703776, -0.4133359, 1.294391, 1, 1, 1, 1, 1,
0.8751616, 1.75498, 0.8973159, 1, 1, 1, 1, 1,
0.8826932, -1.427028, 2.774918, 1, 1, 1, 1, 1,
0.8877916, 0.3100142, 0.7653656, 1, 1, 1, 1, 1,
0.8936203, -1.381581, 2.095172, 1, 1, 1, 1, 1,
0.9040351, 1.439744, 1.286061, 1, 1, 1, 1, 1,
0.9056521, 0.2102019, 1.879712, 1, 1, 1, 1, 1,
0.9112476, -0.3318409, 0.9743756, 1, 1, 1, 1, 1,
0.9238048, 1.032433, -0.2495506, 1, 1, 1, 1, 1,
0.923825, 1.026721, 1.087419, 1, 1, 1, 1, 1,
0.9259809, 0.6301612, 0.3026834, 1, 1, 1, 1, 1,
0.9275056, -0.3933657, 1.833038, 1, 1, 1, 1, 1,
0.9283509, -0.3641385, 0.7134511, 1, 1, 1, 1, 1,
0.9454287, -0.5786565, 3.144848, 1, 1, 1, 1, 1,
0.9472273, -2.697443, 2.169865, 1, 1, 1, 1, 1,
0.9475608, 1.000492, 1.457663, 0, 0, 1, 1, 1,
0.9479176, 2.125393, -1.220111, 1, 0, 0, 1, 1,
0.9483089, 1.824875, 1.132751, 1, 0, 0, 1, 1,
0.9500466, -0.8558253, 2.935194, 1, 0, 0, 1, 1,
0.9506675, 0.7668004, 1.327229, 1, 0, 0, 1, 1,
0.9522571, -1.05072, 3.095578, 1, 0, 0, 1, 1,
0.9612491, -0.47271, 2.347732, 0, 0, 0, 1, 1,
0.9627832, -0.7568324, 2.891522, 0, 0, 0, 1, 1,
0.9697099, 1.908879, 3.198345, 0, 0, 0, 1, 1,
0.9699538, -1.422152, 4.467406, 0, 0, 0, 1, 1,
0.97497, -0.1556948, 2.149178, 0, 0, 0, 1, 1,
0.9753364, -0.9781141, 1.237659, 0, 0, 0, 1, 1,
0.976528, 1.008044, 1.924075, 0, 0, 0, 1, 1,
1.005038, -0.3808168, 3.172779, 1, 1, 1, 1, 1,
1.006399, -0.5877401, 2.526347, 1, 1, 1, 1, 1,
1.016087, -0.8283855, 3.019283, 1, 1, 1, 1, 1,
1.019176, 0.6659113, 1.821241, 1, 1, 1, 1, 1,
1.01933, -0.533289, 2.99681, 1, 1, 1, 1, 1,
1.020519, 0.7748505, 1.149867, 1, 1, 1, 1, 1,
1.03365, -0.4351042, 1.224337, 1, 1, 1, 1, 1,
1.036941, 0.9546474, 1.78896, 1, 1, 1, 1, 1,
1.038411, -0.8944688, 1.038417, 1, 1, 1, 1, 1,
1.04443, 0.1457292, 2.539832, 1, 1, 1, 1, 1,
1.045723, -0.6295208, 2.565346, 1, 1, 1, 1, 1,
1.046039, -0.1704419, 3.155944, 1, 1, 1, 1, 1,
1.047363, 1.10528, 1.399518, 1, 1, 1, 1, 1,
1.048805, 0.5725513, 1.01437, 1, 1, 1, 1, 1,
1.051387, -1.236298, 0.74044, 1, 1, 1, 1, 1,
1.051486, 0.2852025, 1.618443, 0, 0, 1, 1, 1,
1.058882, -0.5107483, 1.463736, 1, 0, 0, 1, 1,
1.060241, -0.3375072, 2.713441, 1, 0, 0, 1, 1,
1.06503, -1.160307, 1.869834, 1, 0, 0, 1, 1,
1.067729, 0.6399178, 1.588557, 1, 0, 0, 1, 1,
1.079068, 0.3631029, 0.2986059, 1, 0, 0, 1, 1,
1.081573, -0.6209545, 4.176024, 0, 0, 0, 1, 1,
1.084621, 0.05208073, 0.6547031, 0, 0, 0, 1, 1,
1.087256, -0.2821386, 2.057422, 0, 0, 0, 1, 1,
1.089107, 0.1560342, 0.5739509, 0, 0, 0, 1, 1,
1.093273, 0.06432875, 0.8547856, 0, 0, 0, 1, 1,
1.097775, -0.6307321, 3.029185, 0, 0, 0, 1, 1,
1.100001, 0.5913538, 0.3475581, 0, 0, 0, 1, 1,
1.108057, -0.1318847, 0.4826266, 1, 1, 1, 1, 1,
1.111075, -0.9971571, 2.076984, 1, 1, 1, 1, 1,
1.118589, -1.722753, 2.821241, 1, 1, 1, 1, 1,
1.12073, -0.5982855, 2.024732, 1, 1, 1, 1, 1,
1.122174, 0.2021501, 3.268789, 1, 1, 1, 1, 1,
1.125512, 1.785363, 1.786719, 1, 1, 1, 1, 1,
1.125843, 0.5513368, 1.827869, 1, 1, 1, 1, 1,
1.128597, -1.466335, 1.890553, 1, 1, 1, 1, 1,
1.131413, 0.3060303, 1.327757, 1, 1, 1, 1, 1,
1.134244, 1.248048, 0.6390626, 1, 1, 1, 1, 1,
1.135595, 0.0249959, 3.242426, 1, 1, 1, 1, 1,
1.137613, -0.2175572, 2.108949, 1, 1, 1, 1, 1,
1.148414, 1.157321, 1.788936, 1, 1, 1, 1, 1,
1.151019, -0.06040031, 1.779237, 1, 1, 1, 1, 1,
1.151552, 0.2726623, 2.0502, 1, 1, 1, 1, 1,
1.151995, 2.025917, 0.4860504, 0, 0, 1, 1, 1,
1.153446, -2.06325, 2.074422, 1, 0, 0, 1, 1,
1.158959, -1.524162, 4.658621, 1, 0, 0, 1, 1,
1.159128, -0.3492133, 0.7793714, 1, 0, 0, 1, 1,
1.166584, 0.2292829, 2.361609, 1, 0, 0, 1, 1,
1.175545, -0.4336993, 1.973554, 1, 0, 0, 1, 1,
1.176987, 0.399976, 0.5024791, 0, 0, 0, 1, 1,
1.186985, -0.378278, 1.193317, 0, 0, 0, 1, 1,
1.188684, 0.5319294, 1.196059, 0, 0, 0, 1, 1,
1.194417, 0.6137875, 0.990516, 0, 0, 0, 1, 1,
1.195742, 1.429944, 0.768451, 0, 0, 0, 1, 1,
1.197568, 0.001125186, -0.5275726, 0, 0, 0, 1, 1,
1.205016, 0.5315013, 2.66877, 0, 0, 0, 1, 1,
1.2078, 0.9082817, 2.373568, 1, 1, 1, 1, 1,
1.212866, 0.8764038, 2.225095, 1, 1, 1, 1, 1,
1.213844, 0.4824454, 1.287218, 1, 1, 1, 1, 1,
1.220001, -1.071424, 4.541975, 1, 1, 1, 1, 1,
1.221639, 0.2716313, 1.578598, 1, 1, 1, 1, 1,
1.222283, 0.1790905, 0.8822492, 1, 1, 1, 1, 1,
1.223123, 1.203756, -0.7652419, 1, 1, 1, 1, 1,
1.223686, -0.9885029, 2.907276, 1, 1, 1, 1, 1,
1.224046, 0.7610889, 2.528558, 1, 1, 1, 1, 1,
1.231783, 1.123341, 1.148701, 1, 1, 1, 1, 1,
1.233907, -0.7052293, 3.456556, 1, 1, 1, 1, 1,
1.240966, 0.1053888, 1.167486, 1, 1, 1, 1, 1,
1.245623, 0.1472845, 1.064399, 1, 1, 1, 1, 1,
1.252341, -0.3505392, 2.241839, 1, 1, 1, 1, 1,
1.252683, -0.5175617, 2.329516, 1, 1, 1, 1, 1,
1.261299, -0.3968624, 2.320693, 0, 0, 1, 1, 1,
1.268937, 0.2219267, -0.009203781, 1, 0, 0, 1, 1,
1.278219, -1.692877, 1.442364, 1, 0, 0, 1, 1,
1.283086, -1.41102, 2.183016, 1, 0, 0, 1, 1,
1.283473, -0.3590523, 0.7462958, 1, 0, 0, 1, 1,
1.291277, 0.3087057, 1.640208, 1, 0, 0, 1, 1,
1.295928, 0.8492883, 0.2309559, 0, 0, 0, 1, 1,
1.298839, 0.9616954, 0.9089811, 0, 0, 0, 1, 1,
1.299472, 0.3099729, 0.9357512, 0, 0, 0, 1, 1,
1.308085, 0.3280854, 0.7125371, 0, 0, 0, 1, 1,
1.313524, 0.05424286, 3.343116, 0, 0, 0, 1, 1,
1.323816, -0.6474591, 2.898102, 0, 0, 0, 1, 1,
1.331233, -0.7384039, 2.513345, 0, 0, 0, 1, 1,
1.335165, -0.244661, 2.515707, 1, 1, 1, 1, 1,
1.336224, 1.410217, 1.294576, 1, 1, 1, 1, 1,
1.339119, -1.12992, 2.085996, 1, 1, 1, 1, 1,
1.360042, -1.796626, 3.286033, 1, 1, 1, 1, 1,
1.362971, -1.240704, -0.06842306, 1, 1, 1, 1, 1,
1.364471, -0.4202977, 0.7814912, 1, 1, 1, 1, 1,
1.36657, -1.362211, 4.471116, 1, 1, 1, 1, 1,
1.373402, -0.4390388, 3.894627, 1, 1, 1, 1, 1,
1.378238, -0.6957352, 1.391606, 1, 1, 1, 1, 1,
1.383321, -0.5615436, 2.956672, 1, 1, 1, 1, 1,
1.392077, -0.154729, 3.141662, 1, 1, 1, 1, 1,
1.399555, 1.940539, 0.8970661, 1, 1, 1, 1, 1,
1.399591, 0.6996034, 1.374619, 1, 1, 1, 1, 1,
1.404026, -0.3397372, 0.2321197, 1, 1, 1, 1, 1,
1.409627, -0.8964583, 2.944121, 1, 1, 1, 1, 1,
1.411533, -1.574284, 2.339453, 0, 0, 1, 1, 1,
1.417608, -0.1927292, 0.9428087, 1, 0, 0, 1, 1,
1.420211, 1.407269, 1.595619, 1, 0, 0, 1, 1,
1.42309, 0.1364474, 0.5541546, 1, 0, 0, 1, 1,
1.437639, 0.3212484, 2.111019, 1, 0, 0, 1, 1,
1.448741, 0.2658933, 3.429617, 1, 0, 0, 1, 1,
1.450563, 1.208741, 2.363894, 0, 0, 0, 1, 1,
1.463069, -2.360345, 2.796805, 0, 0, 0, 1, 1,
1.471358, -1.443594, 3.198641, 0, 0, 0, 1, 1,
1.485134, -0.8302605, 0.9865345, 0, 0, 0, 1, 1,
1.486367, 0.07913289, 0.7697005, 0, 0, 0, 1, 1,
1.494848, -0.4088663, 1.196995, 0, 0, 0, 1, 1,
1.498931, -1.923382, 3.260618, 0, 0, 0, 1, 1,
1.500548, -0.2800882, 1.725242, 1, 1, 1, 1, 1,
1.503043, 1.230436, 1.179387, 1, 1, 1, 1, 1,
1.505737, 0.9570099, 0.9984742, 1, 1, 1, 1, 1,
1.509966, -0.9356418, 4.425555, 1, 1, 1, 1, 1,
1.514673, 0.3306975, 1.103904, 1, 1, 1, 1, 1,
1.516133, -0.3746171, 1.787823, 1, 1, 1, 1, 1,
1.522658, 0.9868991, -0.03325301, 1, 1, 1, 1, 1,
1.533349, 0.7658709, 2.260659, 1, 1, 1, 1, 1,
1.537113, -1.787423, 3.400929, 1, 1, 1, 1, 1,
1.537972, 0.4948382, 2.644797, 1, 1, 1, 1, 1,
1.545413, 0.3728606, 1.465995, 1, 1, 1, 1, 1,
1.56924, -1.770602, 2.712461, 1, 1, 1, 1, 1,
1.5899, -0.3516918, 2.334586, 1, 1, 1, 1, 1,
1.593871, -0.3308225, 1.257808, 1, 1, 1, 1, 1,
1.606058, -1.076806, 1.309097, 1, 1, 1, 1, 1,
1.610194, -0.1905141, 2.320666, 0, 0, 1, 1, 1,
1.613045, 0.01841752, 1.438731, 1, 0, 0, 1, 1,
1.623558, -1.076188, 1.996791, 1, 0, 0, 1, 1,
1.623899, 2.457977, 2.425301, 1, 0, 0, 1, 1,
1.631682, 1.213151, 0.5072695, 1, 0, 0, 1, 1,
1.633222, 0.7341337, 0.609179, 1, 0, 0, 1, 1,
1.634272, -1.081785, 1.704754, 0, 0, 0, 1, 1,
1.637064, 0.5271945, 0.1339554, 0, 0, 0, 1, 1,
1.637841, 0.1674275, -0.7021104, 0, 0, 0, 1, 1,
1.641075, -1.644872, 4.304534, 0, 0, 0, 1, 1,
1.649284, 1.905971, 1.027755, 0, 0, 0, 1, 1,
1.649611, 0.09349836, 1.131623, 0, 0, 0, 1, 1,
1.666142, -1.198331, 3.75804, 0, 0, 0, 1, 1,
1.666186, -0.2251283, 1.417104, 1, 1, 1, 1, 1,
1.666449, 0.4205356, 0.9795635, 1, 1, 1, 1, 1,
1.669782, 1.263683, 0.9267751, 1, 1, 1, 1, 1,
1.675718, 1.657694, 0.1645883, 1, 1, 1, 1, 1,
1.691739, 0.2019457, 2.58475, 1, 1, 1, 1, 1,
1.691937, -0.1173198, 3.339562, 1, 1, 1, 1, 1,
1.69237, 0.0244655, 1.702556, 1, 1, 1, 1, 1,
1.702509, -1.498175, 0.6137593, 1, 1, 1, 1, 1,
1.70694, -0.08438282, 0.287635, 1, 1, 1, 1, 1,
1.715124, 0.002933252, 1.974052, 1, 1, 1, 1, 1,
1.715153, 0.5952281, 2.273137, 1, 1, 1, 1, 1,
1.718785, -0.9060304, 3.513466, 1, 1, 1, 1, 1,
1.720127, 0.7131078, 2.355189, 1, 1, 1, 1, 1,
1.73743, 0.2107598, 1.253409, 1, 1, 1, 1, 1,
1.752107, -2.289128, 2.647417, 1, 1, 1, 1, 1,
1.755055, -0.3584688, 1.158983, 0, 0, 1, 1, 1,
1.764505, 0.9625063, 1.548432, 1, 0, 0, 1, 1,
1.766866, 0.5078562, 1.521163, 1, 0, 0, 1, 1,
1.779452, 0.8619398, 0.6433787, 1, 0, 0, 1, 1,
1.807253, -0.7740647, 1.017773, 1, 0, 0, 1, 1,
1.814026, 2.637738, 1.572887, 1, 0, 0, 1, 1,
1.820965, 0.7697715, 0.9711215, 0, 0, 0, 1, 1,
1.824857, 0.2064921, 0.3948436, 0, 0, 0, 1, 1,
1.834492, -0.1145415, 2.551903, 0, 0, 0, 1, 1,
1.834685, -0.2719533, -0.0212963, 0, 0, 0, 1, 1,
1.834957, -0.9079836, 2.303185, 0, 0, 0, 1, 1,
1.838286, -0.08422226, 2.847261, 0, 0, 0, 1, 1,
1.850676, 0.9054749, 2.451181, 0, 0, 0, 1, 1,
1.859215, -0.6810175, 2.053038, 1, 1, 1, 1, 1,
1.859397, -0.6232901, 2.79537, 1, 1, 1, 1, 1,
1.861721, -0.008640342, 1.940706, 1, 1, 1, 1, 1,
1.869992, 1.36899, 0.7861838, 1, 1, 1, 1, 1,
1.905069, 1.485306, 0.5680472, 1, 1, 1, 1, 1,
1.933336, -1.002649, 0.750487, 1, 1, 1, 1, 1,
1.944934, -0.3827289, 1.372651, 1, 1, 1, 1, 1,
1.94757, 1.316076, 0.9716029, 1, 1, 1, 1, 1,
1.952238, 0.3562725, -0.4125144, 1, 1, 1, 1, 1,
2.051267, 1.034569, -0.01020035, 1, 1, 1, 1, 1,
2.118216, -1.793613, 2.797476, 1, 1, 1, 1, 1,
2.121123, 0.8626873, 1.69759, 1, 1, 1, 1, 1,
2.124298, -0.3033535, 1.895761, 1, 1, 1, 1, 1,
2.178763, 1.080759, 0.2050585, 1, 1, 1, 1, 1,
2.192353, -0.4990947, 2.15086, 1, 1, 1, 1, 1,
2.246043, -0.3474192, 1.212133, 0, 0, 1, 1, 1,
2.265799, 0.8867878, 2.434788, 1, 0, 0, 1, 1,
2.281323, 0.7253721, 1.984742, 1, 0, 0, 1, 1,
2.283083, 0.2369492, 1.824118, 1, 0, 0, 1, 1,
2.317175, -0.4222061, 1.805911, 1, 0, 0, 1, 1,
2.345971, -0.1181943, 1.197909, 1, 0, 0, 1, 1,
2.352554, 0.4563529, 0.9582532, 0, 0, 0, 1, 1,
2.393729, 2.359633, 0.4508196, 0, 0, 0, 1, 1,
2.434261, 1.827329, 0.2282892, 0, 0, 0, 1, 1,
2.442157, -0.4259752, 2.579665, 0, 0, 0, 1, 1,
2.456491, -0.2555151, 0.7873327, 0, 0, 0, 1, 1,
2.470516, -0.4189316, 0.2207816, 0, 0, 0, 1, 1,
2.482677, 0.7550864, 0.4897613, 0, 0, 0, 1, 1,
2.498844, 0.946964, -1.043571, 1, 1, 1, 1, 1,
2.530996, -0.05303789, 3.517019, 1, 1, 1, 1, 1,
2.56903, -0.1590939, 1.367986, 1, 1, 1, 1, 1,
2.587884, -1.057298, 2.821228, 1, 1, 1, 1, 1,
2.648077, -0.108024, 0.4265101, 1, 1, 1, 1, 1,
2.651325, 1.124246, 0.699038, 1, 1, 1, 1, 1,
2.884578, -0.2695283, 1.737351, 1, 1, 1, 1, 1
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
var radius = 9.047185;
var distance = 31.77785;
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
mvMatrix.translate( 0.2328047, 0.002709746, -0.1741552 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.77785);
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
