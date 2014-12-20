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
-2.907026, 1.108581, -1.606593, 1, 0, 0, 1,
-2.793549, -0.2052656, -3.132524, 1, 0.007843138, 0, 1,
-2.677319, -0.4150003, -0.9263385, 1, 0.01176471, 0, 1,
-2.573471, 1.464303, -0.7125782, 1, 0.01960784, 0, 1,
-2.468665, -0.7556383, -3.473375, 1, 0.02352941, 0, 1,
-2.447474, -0.0110278, -1.789873, 1, 0.03137255, 0, 1,
-2.405385, 0.0569969, -2.407737, 1, 0.03529412, 0, 1,
-2.379439, 0.2350338, -2.717769, 1, 0.04313726, 0, 1,
-2.309026, 1.621907, -1.027345, 1, 0.04705882, 0, 1,
-2.294092, 0.672312, -0.2392422, 1, 0.05490196, 0, 1,
-2.221734, -3.371619, -3.469004, 1, 0.05882353, 0, 1,
-2.147684, 0.5058683, -0.2554709, 1, 0.06666667, 0, 1,
-2.133137, -0.8944959, -2.976635, 1, 0.07058824, 0, 1,
-2.117067, -0.8280482, -1.519565, 1, 0.07843138, 0, 1,
-2.038686, 0.9878411, -1.910155, 1, 0.08235294, 0, 1,
-2.031712, 0.3774865, -0.9397536, 1, 0.09019608, 0, 1,
-2.028549, -0.166441, -3.146484, 1, 0.09411765, 0, 1,
-2.020729, -0.6963444, -2.907357, 1, 0.1019608, 0, 1,
-2.008546, -1.001129, -1.528654, 1, 0.1098039, 0, 1,
-1.977097, -0.4082516, -1.905001, 1, 0.1137255, 0, 1,
-1.965391, -1.081412, -3.622323, 1, 0.1215686, 0, 1,
-1.917377, -0.8961977, -1.023519, 1, 0.1254902, 0, 1,
-1.916426, -0.3685354, 0.1174616, 1, 0.1333333, 0, 1,
-1.911529, -0.5172243, -2.460624, 1, 0.1372549, 0, 1,
-1.88069, 0.7709398, -2.168762, 1, 0.145098, 0, 1,
-1.838634, 0.8804711, -2.145042, 1, 0.1490196, 0, 1,
-1.809161, 0.2327434, -1.002597, 1, 0.1568628, 0, 1,
-1.789396, 0.6620259, -0.5055102, 1, 0.1607843, 0, 1,
-1.7719, 0.9363864, -0.3718485, 1, 0.1686275, 0, 1,
-1.763006, -0.3628318, -2.035516, 1, 0.172549, 0, 1,
-1.757693, 0.1479116, -2.607944, 1, 0.1803922, 0, 1,
-1.756026, -1.403219, -2.272567, 1, 0.1843137, 0, 1,
-1.743736, -0.7001941, -1.487958, 1, 0.1921569, 0, 1,
-1.742985, -0.1821765, -1.664031, 1, 0.1960784, 0, 1,
-1.741577, 0.6687045, -2.01565, 1, 0.2039216, 0, 1,
-1.73543, -1.968089, -3.099745, 1, 0.2117647, 0, 1,
-1.702814, 1.458048, -0.4484164, 1, 0.2156863, 0, 1,
-1.695151, -0.513403, -2.40538, 1, 0.2235294, 0, 1,
-1.695066, 0.2842511, -1.231954, 1, 0.227451, 0, 1,
-1.686125, -2.195685, -3.256333, 1, 0.2352941, 0, 1,
-1.674406, 0.9746686, -1.62125, 1, 0.2392157, 0, 1,
-1.658981, -0.123228, -0.2877916, 1, 0.2470588, 0, 1,
-1.637176, -0.3116208, -1.925719, 1, 0.2509804, 0, 1,
-1.635758, -0.880565, -1.497593, 1, 0.2588235, 0, 1,
-1.635542, 1.827695, -0.213934, 1, 0.2627451, 0, 1,
-1.628616, -2.277554, -2.521207, 1, 0.2705882, 0, 1,
-1.619883, 0.3141676, -1.415142, 1, 0.2745098, 0, 1,
-1.616942, 1.511217, -2.580626, 1, 0.282353, 0, 1,
-1.612176, 0.5139115, -0.8396783, 1, 0.2862745, 0, 1,
-1.582168, 0.2310081, -1.155699, 1, 0.2941177, 0, 1,
-1.576688, -0.1739538, -1.530745, 1, 0.3019608, 0, 1,
-1.57355, 1.126476, 0.1720656, 1, 0.3058824, 0, 1,
-1.571638, 0.8562123, 0.3156652, 1, 0.3137255, 0, 1,
-1.544454, 1.332484, -0.8187774, 1, 0.3176471, 0, 1,
-1.544454, -1.652573, -5.045255, 1, 0.3254902, 0, 1,
-1.535012, 0.1235453, -2.402693, 1, 0.3294118, 0, 1,
-1.524185, -0.4991001, -2.16482, 1, 0.3372549, 0, 1,
-1.518729, 1.619626, -0.3271216, 1, 0.3411765, 0, 1,
-1.502031, -0.7930914, -2.028639, 1, 0.3490196, 0, 1,
-1.499801, -2.149551, -3.723749, 1, 0.3529412, 0, 1,
-1.493952, 0.7937625, -2.146248, 1, 0.3607843, 0, 1,
-1.483785, 1.356761, -0.5793776, 1, 0.3647059, 0, 1,
-1.483773, 0.6217432, 1.522403, 1, 0.372549, 0, 1,
-1.483112, -1.263825, -4.019981, 1, 0.3764706, 0, 1,
-1.47828, 0.4889827, 0.8883405, 1, 0.3843137, 0, 1,
-1.468201, -1.612468, -1.763948, 1, 0.3882353, 0, 1,
-1.452464, -0.8921152, -2.097376, 1, 0.3960784, 0, 1,
-1.450686, -0.4078307, -0.8885008, 1, 0.4039216, 0, 1,
-1.440546, 1.298155, -1.493672, 1, 0.4078431, 0, 1,
-1.435923, 0.6457238, -0.7383122, 1, 0.4156863, 0, 1,
-1.416982, 1.580181, -0.4719043, 1, 0.4196078, 0, 1,
-1.415916, 0.5322821, -0.04632077, 1, 0.427451, 0, 1,
-1.403243, -0.3126808, -1.570719, 1, 0.4313726, 0, 1,
-1.403013, 1.653505, -1.352916, 1, 0.4392157, 0, 1,
-1.399428, -0.9851419, -2.836286, 1, 0.4431373, 0, 1,
-1.399245, -0.4886483, -1.187427, 1, 0.4509804, 0, 1,
-1.368454, -0.7912251, -2.324245, 1, 0.454902, 0, 1,
-1.368011, -0.7849782, -1.678468, 1, 0.4627451, 0, 1,
-1.358479, -0.08824929, 0.5441818, 1, 0.4666667, 0, 1,
-1.345404, 0.08107953, 0.1778436, 1, 0.4745098, 0, 1,
-1.343196, 0.2970756, -1.879059, 1, 0.4784314, 0, 1,
-1.343095, -1.604732, -3.627189, 1, 0.4862745, 0, 1,
-1.342271, -1.06633, -1.85497, 1, 0.4901961, 0, 1,
-1.34195, 0.6678765, -1.709544, 1, 0.4980392, 0, 1,
-1.339634, -0.4123662, -2.253685, 1, 0.5058824, 0, 1,
-1.336132, -1.813267, -2.009359, 1, 0.509804, 0, 1,
-1.334135, 0.5556696, -2.56339, 1, 0.5176471, 0, 1,
-1.31913, -0.3738978, -2.654426, 1, 0.5215687, 0, 1,
-1.313089, -1.838878, -2.441481, 1, 0.5294118, 0, 1,
-1.299945, 1.204332, -1.110871, 1, 0.5333334, 0, 1,
-1.299435, -1.043748, -0.6482841, 1, 0.5411765, 0, 1,
-1.285423, 0.1642893, -1.141883, 1, 0.5450981, 0, 1,
-1.279183, 1.237353, -0.9090583, 1, 0.5529412, 0, 1,
-1.268812, -2.81704, -2.45712, 1, 0.5568628, 0, 1,
-1.267657, -0.1675904, -1.658404, 1, 0.5647059, 0, 1,
-1.260107, -0.1919548, -0.7314371, 1, 0.5686275, 0, 1,
-1.257773, 0.5632607, -0.8461704, 1, 0.5764706, 0, 1,
-1.244093, 0.5962057, -2.858663, 1, 0.5803922, 0, 1,
-1.23715, -0.4294218, -0.8941673, 1, 0.5882353, 0, 1,
-1.230996, 0.3671393, -2.385957, 1, 0.5921569, 0, 1,
-1.222802, 0.6322179, -0.8478301, 1, 0.6, 0, 1,
-1.221236, -0.06262266, -3.154549, 1, 0.6078432, 0, 1,
-1.219694, -0.8716689, -4.140936, 1, 0.6117647, 0, 1,
-1.207622, -0.4876935, -1.640005, 1, 0.6196079, 0, 1,
-1.203116, 0.2606331, 1.254373, 1, 0.6235294, 0, 1,
-1.202082, 0.3410527, -1.440886, 1, 0.6313726, 0, 1,
-1.201723, 2.397238, 0.4947801, 1, 0.6352941, 0, 1,
-1.195377, 0.3555399, -1.311221, 1, 0.6431373, 0, 1,
-1.194196, -1.179612, -1.50446, 1, 0.6470588, 0, 1,
-1.181919, -0.349157, -3.347442, 1, 0.654902, 0, 1,
-1.164513, -0.3891919, -1.303942, 1, 0.6588235, 0, 1,
-1.161395, 0.2439588, -0.7043555, 1, 0.6666667, 0, 1,
-1.148814, 0.2054373, -3.215049, 1, 0.6705883, 0, 1,
-1.148126, -0.7482957, -2.220849, 1, 0.6784314, 0, 1,
-1.144115, -0.6218171, -1.854436, 1, 0.682353, 0, 1,
-1.139337, -0.4481326, -2.408696, 1, 0.6901961, 0, 1,
-1.135752, -0.2164773, -2.636471, 1, 0.6941177, 0, 1,
-1.124382, -0.7145991, -2.087132, 1, 0.7019608, 0, 1,
-1.122941, -0.120882, -1.411062, 1, 0.7098039, 0, 1,
-1.118482, -0.6631014, -1.667199, 1, 0.7137255, 0, 1,
-1.115623, 0.5261809, -2.176231, 1, 0.7215686, 0, 1,
-1.103805, -0.1710977, -1.74801, 1, 0.7254902, 0, 1,
-1.102627, 0.4466193, -0.1856594, 1, 0.7333333, 0, 1,
-1.098389, 0.1621177, -0.2509415, 1, 0.7372549, 0, 1,
-1.094966, 0.4984075, -3.209699, 1, 0.7450981, 0, 1,
-1.087033, -0.7177907, -3.632942, 1, 0.7490196, 0, 1,
-1.076138, 0.680469, -2.398155, 1, 0.7568628, 0, 1,
-1.065603, -0.6006138, -1.176821, 1, 0.7607843, 0, 1,
-1.058922, 0.247007, -2.593037, 1, 0.7686275, 0, 1,
-1.044628, 0.09157022, 0.3351967, 1, 0.772549, 0, 1,
-1.0435, -0.7745085, -2.847963, 1, 0.7803922, 0, 1,
-1.040916, -1.654465, -3.109715, 1, 0.7843137, 0, 1,
-1.04015, 0.6033165, -1.384583, 1, 0.7921569, 0, 1,
-1.03639, -1.42591, -0.792634, 1, 0.7960784, 0, 1,
-1.034412, 0.01018434, -1.334987, 1, 0.8039216, 0, 1,
-1.034003, -1.25545, -2.252178, 1, 0.8117647, 0, 1,
-1.030213, -1.57894, -2.569697, 1, 0.8156863, 0, 1,
-1.029989, -0.715854, -1.901966, 1, 0.8235294, 0, 1,
-1.024278, -0.4166965, -1.751696, 1, 0.827451, 0, 1,
-1.022907, -0.1445325, -2.205617, 1, 0.8352941, 0, 1,
-1.021487, 0.4488864, -1.324126, 1, 0.8392157, 0, 1,
-1.019016, 0.3078517, -2.666422, 1, 0.8470588, 0, 1,
-1.01783, 1.467218, 0.05418626, 1, 0.8509804, 0, 1,
-1.016246, 0.3805999, -1.098759, 1, 0.8588235, 0, 1,
-1.007239, 0.6412613, 0.1948715, 1, 0.8627451, 0, 1,
-1.000333, -0.9974446, -3.578472, 1, 0.8705882, 0, 1,
-0.9980072, 0.7447848, -1.479936, 1, 0.8745098, 0, 1,
-0.9974192, 1.363671, -0.7854461, 1, 0.8823529, 0, 1,
-0.9899455, -0.3213128, -1.112086, 1, 0.8862745, 0, 1,
-0.9849828, -1.576526, -3.277032, 1, 0.8941177, 0, 1,
-0.984841, 1.005078, -1.164835, 1, 0.8980392, 0, 1,
-0.9844261, 0.4823491, -1.18757, 1, 0.9058824, 0, 1,
-0.9775499, 0.9990652, -0.307074, 1, 0.9137255, 0, 1,
-0.9739224, -1.446756, -0.5164053, 1, 0.9176471, 0, 1,
-0.9572165, -0.2298448, -1.861487, 1, 0.9254902, 0, 1,
-0.95571, -0.373482, -2.53903, 1, 0.9294118, 0, 1,
-0.9462197, -0.8255801, -4.312285, 1, 0.9372549, 0, 1,
-0.9389691, 0.5780713, -1.555295, 1, 0.9411765, 0, 1,
-0.9307989, -0.9366452, -3.289092, 1, 0.9490196, 0, 1,
-0.9260002, -0.7566717, -2.145598, 1, 0.9529412, 0, 1,
-0.9104854, -1.06748, -2.482134, 1, 0.9607843, 0, 1,
-0.9076794, 0.4902097, -1.014166, 1, 0.9647059, 0, 1,
-0.9042114, 2.068654, 0.1212512, 1, 0.972549, 0, 1,
-0.8963002, -0.9540495, -2.161996, 1, 0.9764706, 0, 1,
-0.8951051, 0.6421354, -1.376086, 1, 0.9843137, 0, 1,
-0.8938185, -2.332869, -0.9534953, 1, 0.9882353, 0, 1,
-0.8935756, -0.4471216, -2.477872, 1, 0.9960784, 0, 1,
-0.8823019, 0.4687376, -0.7721099, 0.9960784, 1, 0, 1,
-0.8765233, 0.2792701, 0.4750379, 0.9921569, 1, 0, 1,
-0.8758331, 2.011053, 0.5608911, 0.9843137, 1, 0, 1,
-0.8684877, -0.7252215, -2.884555, 0.9803922, 1, 0, 1,
-0.8660396, 0.3210083, -2.84593, 0.972549, 1, 0, 1,
-0.8656846, -0.4457289, -3.191116, 0.9686275, 1, 0, 1,
-0.8648233, 1.572436, -0.8971022, 0.9607843, 1, 0, 1,
-0.8616982, -0.5483847, -1.725468, 0.9568627, 1, 0, 1,
-0.8608575, 1.880313, -2.656805, 0.9490196, 1, 0, 1,
-0.8607236, 0.1775157, -1.40916, 0.945098, 1, 0, 1,
-0.8538985, -0.1201998, -2.40668, 0.9372549, 1, 0, 1,
-0.8536702, 0.540543, -0.07654214, 0.9333333, 1, 0, 1,
-0.8503414, 0.1020373, -2.053148, 0.9254902, 1, 0, 1,
-0.8479524, -0.8665969, -2.889409, 0.9215686, 1, 0, 1,
-0.8471293, -0.2805875, -2.470729, 0.9137255, 1, 0, 1,
-0.8460335, 0.4982309, -0.8462983, 0.9098039, 1, 0, 1,
-0.8440421, 1.23633, -1.162435, 0.9019608, 1, 0, 1,
-0.8407915, 1.544516, -0.9906653, 0.8941177, 1, 0, 1,
-0.8386238, 0.1838021, -1.197813, 0.8901961, 1, 0, 1,
-0.8366168, -0.8708937, -3.283051, 0.8823529, 1, 0, 1,
-0.8358235, 0.4680357, 0.4657033, 0.8784314, 1, 0, 1,
-0.8321522, -0.2211163, -3.652155, 0.8705882, 1, 0, 1,
-0.8220642, -0.765574, -3.65529, 0.8666667, 1, 0, 1,
-0.8190076, 1.349796, -0.842091, 0.8588235, 1, 0, 1,
-0.8187249, 0.2714781, -0.8526586, 0.854902, 1, 0, 1,
-0.8163162, -1.746792, -3.867537, 0.8470588, 1, 0, 1,
-0.8087962, 0.2293397, -0.4712878, 0.8431373, 1, 0, 1,
-0.7938457, -0.198682, -2.396638, 0.8352941, 1, 0, 1,
-0.7933679, 1.382337, 0.5907388, 0.8313726, 1, 0, 1,
-0.7909655, 0.2860751, -0.7111765, 0.8235294, 1, 0, 1,
-0.7899144, -0.9687327, -4.567107, 0.8196079, 1, 0, 1,
-0.7892928, -0.2723164, -1.493471, 0.8117647, 1, 0, 1,
-0.7879637, -1.145074, -2.506577, 0.8078431, 1, 0, 1,
-0.787308, -0.5055596, -3.384238, 0.8, 1, 0, 1,
-0.7826686, 0.5952135, -3.504651, 0.7921569, 1, 0, 1,
-0.7790136, -0.2188344, -0.5190858, 0.7882353, 1, 0, 1,
-0.7780629, 0.5514988, 0.5633426, 0.7803922, 1, 0, 1,
-0.7744848, 0.4661414, -1.239565, 0.7764706, 1, 0, 1,
-0.7665314, 1.959094, 0.5051327, 0.7686275, 1, 0, 1,
-0.7627874, -0.9936043, -2.772197, 0.7647059, 1, 0, 1,
-0.7615234, -0.992317, -4.180088, 0.7568628, 1, 0, 1,
-0.7584836, -1.212517, -3.094627, 0.7529412, 1, 0, 1,
-0.7575395, -0.4965151, -2.881786, 0.7450981, 1, 0, 1,
-0.7531935, -0.1215448, -2.594616, 0.7411765, 1, 0, 1,
-0.7484854, -1.212669, -2.412566, 0.7333333, 1, 0, 1,
-0.747316, 1.282135, -0.8000931, 0.7294118, 1, 0, 1,
-0.7440758, -0.4876742, -3.223755, 0.7215686, 1, 0, 1,
-0.742285, -1.204068, -2.043455, 0.7176471, 1, 0, 1,
-0.7363008, -1.219549, -2.56295, 0.7098039, 1, 0, 1,
-0.726458, -0.5078984, -1.344963, 0.7058824, 1, 0, 1,
-0.7218389, -0.09438922, -1.952255, 0.6980392, 1, 0, 1,
-0.7217027, -0.7374288, -2.687379, 0.6901961, 1, 0, 1,
-0.7172237, 0.00034247, -1.596007, 0.6862745, 1, 0, 1,
-0.7124744, -0.2181189, -4.182665, 0.6784314, 1, 0, 1,
-0.7102836, -0.2332036, -0.6637406, 0.6745098, 1, 0, 1,
-0.7099435, 1.45598, -1.688141, 0.6666667, 1, 0, 1,
-0.7072252, -0.1803191, -1.98209, 0.6627451, 1, 0, 1,
-0.6948123, 0.6653982, -2.387125, 0.654902, 1, 0, 1,
-0.6928895, 0.7954373, -0.7269587, 0.6509804, 1, 0, 1,
-0.6918287, 0.8105984, -2.894641, 0.6431373, 1, 0, 1,
-0.6910356, 0.1288037, -0.4259143, 0.6392157, 1, 0, 1,
-0.6906965, 0.1735747, -0.9766747, 0.6313726, 1, 0, 1,
-0.688175, -1.135913, -2.543, 0.627451, 1, 0, 1,
-0.6869703, -0.7291307, -2.351032, 0.6196079, 1, 0, 1,
-0.6858426, -1.134955, -3.260721, 0.6156863, 1, 0, 1,
-0.6802122, 0.8015745, -2.413306, 0.6078432, 1, 0, 1,
-0.6780122, 0.1932456, -1.495347, 0.6039216, 1, 0, 1,
-0.6770204, 0.1882094, -1.231614, 0.5960785, 1, 0, 1,
-0.672059, 0.8174204, -2.08987, 0.5882353, 1, 0, 1,
-0.660776, -1.052781, -0.978512, 0.5843138, 1, 0, 1,
-0.6606502, 0.2277774, -1.102704, 0.5764706, 1, 0, 1,
-0.6606454, 0.316225, -0.4553987, 0.572549, 1, 0, 1,
-0.6567636, -1.061651, -3.003918, 0.5647059, 1, 0, 1,
-0.6547468, -1.323959, -3.229331, 0.5607843, 1, 0, 1,
-0.6447727, 0.5771065, -0.7646823, 0.5529412, 1, 0, 1,
-0.6438184, -1.013036, -4.166748, 0.5490196, 1, 0, 1,
-0.6369998, -0.4077953, -0.6728016, 0.5411765, 1, 0, 1,
-0.6318755, -0.4024847, -1.769028, 0.5372549, 1, 0, 1,
-0.6317086, 2.197953, 0.09315506, 0.5294118, 1, 0, 1,
-0.6302572, -0.1478788, -1.321124, 0.5254902, 1, 0, 1,
-0.6296536, 0.1557866, -2.090713, 0.5176471, 1, 0, 1,
-0.6283931, -0.03706859, -3.00112, 0.5137255, 1, 0, 1,
-0.6249301, 0.3451625, -0.2961292, 0.5058824, 1, 0, 1,
-0.6212649, 0.4963101, -1.207543, 0.5019608, 1, 0, 1,
-0.6166584, 1.407046, -2.168429, 0.4941176, 1, 0, 1,
-0.613614, 0.2576959, -2.479685, 0.4862745, 1, 0, 1,
-0.6101239, -1.011563, -2.243366, 0.4823529, 1, 0, 1,
-0.6072733, -0.4631097, -2.184305, 0.4745098, 1, 0, 1,
-0.6071568, -0.4349709, -2.424263, 0.4705882, 1, 0, 1,
-0.6042421, 0.1887403, -2.257834, 0.4627451, 1, 0, 1,
-0.6023922, -1.285398, -3.873422, 0.4588235, 1, 0, 1,
-0.6018809, 0.764513, -0.6168571, 0.4509804, 1, 0, 1,
-0.599618, 0.8320308, -0.1749214, 0.4470588, 1, 0, 1,
-0.5992122, -0.6122252, -2.451293, 0.4392157, 1, 0, 1,
-0.5990679, 0.09163691, -1.178413, 0.4352941, 1, 0, 1,
-0.5953022, 2.182044, -0.9409851, 0.427451, 1, 0, 1,
-0.5932968, -0.4478049, -2.097089, 0.4235294, 1, 0, 1,
-0.5923637, -2.138966, -2.167132, 0.4156863, 1, 0, 1,
-0.5913132, 0.1098273, -1.319906, 0.4117647, 1, 0, 1,
-0.5902582, -0.5485507, -2.014727, 0.4039216, 1, 0, 1,
-0.5873588, 0.07428353, -1.710399, 0.3960784, 1, 0, 1,
-0.5817958, -0.4754053, -0.9507406, 0.3921569, 1, 0, 1,
-0.5776597, 0.396235, -0.9147968, 0.3843137, 1, 0, 1,
-0.5689996, 0.2251299, -1.794455, 0.3803922, 1, 0, 1,
-0.5676725, -1.099249, -4.440032, 0.372549, 1, 0, 1,
-0.5653333, -0.02534444, -1.825879, 0.3686275, 1, 0, 1,
-0.5586154, 1.603612, -0.08713625, 0.3607843, 1, 0, 1,
-0.5565836, 0.8247933, -0.9124982, 0.3568628, 1, 0, 1,
-0.5558435, 2.561427, -0.03941686, 0.3490196, 1, 0, 1,
-0.5470956, -0.8823158, -3.878411, 0.345098, 1, 0, 1,
-0.5306439, 0.6515608, 0.0611131, 0.3372549, 1, 0, 1,
-0.5288991, 0.1803335, -0.1561629, 0.3333333, 1, 0, 1,
-0.5247418, 0.009901852, -1.778955, 0.3254902, 1, 0, 1,
-0.5234392, 0.9570917, 1.191916, 0.3215686, 1, 0, 1,
-0.5215904, 1.990273, 0.1967559, 0.3137255, 1, 0, 1,
-0.5197303, 0.9740155, 1.30859, 0.3098039, 1, 0, 1,
-0.5180495, -0.4270521, -3.000518, 0.3019608, 1, 0, 1,
-0.5172037, 0.4453065, -1.214166, 0.2941177, 1, 0, 1,
-0.5149017, 1.124804, -1.048387, 0.2901961, 1, 0, 1,
-0.5144178, 0.2412266, -0.9026034, 0.282353, 1, 0, 1,
-0.5120016, 0.7761832, 0.4807113, 0.2784314, 1, 0, 1,
-0.5092157, -0.7878563, -1.97799, 0.2705882, 1, 0, 1,
-0.5071082, 1.35386, 0.6633402, 0.2666667, 1, 0, 1,
-0.5056075, -0.9031268, -1.356529, 0.2588235, 1, 0, 1,
-0.5028633, 0.05165609, -2.867533, 0.254902, 1, 0, 1,
-0.5011245, 0.7887144, -0.6382017, 0.2470588, 1, 0, 1,
-0.4958516, 0.4044394, 0.5488057, 0.2431373, 1, 0, 1,
-0.4933259, 0.02357136, -5.040029, 0.2352941, 1, 0, 1,
-0.4913536, -2.466062, -3.675136, 0.2313726, 1, 0, 1,
-0.4878685, -0.5921039, -3.132904, 0.2235294, 1, 0, 1,
-0.4876762, 0.8077389, -0.4751809, 0.2196078, 1, 0, 1,
-0.4853421, 1.031764, -1.784495, 0.2117647, 1, 0, 1,
-0.4839179, -0.5103524, -1.836946, 0.2078431, 1, 0, 1,
-0.4828354, -0.8363884, -2.179426, 0.2, 1, 0, 1,
-0.4827094, 1.031827, -0.8198324, 0.1921569, 1, 0, 1,
-0.4805627, 0.7392248, -1.418552, 0.1882353, 1, 0, 1,
-0.4791794, 0.8431085, -2.314372, 0.1803922, 1, 0, 1,
-0.4772124, -0.4479311, -2.217446, 0.1764706, 1, 0, 1,
-0.4767546, 0.4795162, 0.5239698, 0.1686275, 1, 0, 1,
-0.4764844, 0.1266938, -2.388509, 0.1647059, 1, 0, 1,
-0.4716659, -0.2862584, -2.124632, 0.1568628, 1, 0, 1,
-0.4708779, -0.08525271, -1.195387, 0.1529412, 1, 0, 1,
-0.4663974, 0.5640823, -2.056045, 0.145098, 1, 0, 1,
-0.4623412, -0.8346841, -2.727928, 0.1411765, 1, 0, 1,
-0.4615647, -0.8063926, -1.986637, 0.1333333, 1, 0, 1,
-0.4604388, 1.583907, -1.073943, 0.1294118, 1, 0, 1,
-0.4582722, -0.9434965, -3.250262, 0.1215686, 1, 0, 1,
-0.4568139, 0.3895213, -1.288207, 0.1176471, 1, 0, 1,
-0.4536648, -1.357766, -2.669473, 0.1098039, 1, 0, 1,
-0.4525385, 0.8969849, -1.333709, 0.1058824, 1, 0, 1,
-0.4502535, -0.5770991, -4.369723, 0.09803922, 1, 0, 1,
-0.4460295, -0.6528271, -1.431399, 0.09019608, 1, 0, 1,
-0.4438853, -0.1842704, -1.614664, 0.08627451, 1, 0, 1,
-0.442774, -0.988506, -3.217002, 0.07843138, 1, 0, 1,
-0.441971, 0.9099699, 0.63538, 0.07450981, 1, 0, 1,
-0.437677, -0.5946596, -2.387326, 0.06666667, 1, 0, 1,
-0.437258, -0.3555011, -2.872523, 0.0627451, 1, 0, 1,
-0.4366099, -0.2835808, -2.625552, 0.05490196, 1, 0, 1,
-0.4359267, -0.5892552, -2.949997, 0.05098039, 1, 0, 1,
-0.4298736, -0.6471937, -2.105928, 0.04313726, 1, 0, 1,
-0.4285042, 0.9533415, -2.442212, 0.03921569, 1, 0, 1,
-0.4278178, -0.03992517, -3.301533, 0.03137255, 1, 0, 1,
-0.4268735, -0.603696, -2.112364, 0.02745098, 1, 0, 1,
-0.4242525, -0.5916974, -4.411286, 0.01960784, 1, 0, 1,
-0.4176033, 1.81722, -1.716633, 0.01568628, 1, 0, 1,
-0.4164016, 2.77351, -0.2051411, 0.007843138, 1, 0, 1,
-0.4153073, -1.127909, -2.812503, 0.003921569, 1, 0, 1,
-0.413529, 0.1893587, -1.781272, 0, 1, 0.003921569, 1,
-0.4071249, -1.014662, -3.399896, 0, 1, 0.01176471, 1,
-0.4067433, 0.5104492, -2.829503, 0, 1, 0.01568628, 1,
-0.406235, 1.692942, -0.2688493, 0, 1, 0.02352941, 1,
-0.4036417, -1.427776, -4.154387, 0, 1, 0.02745098, 1,
-0.4001411, 0.666025, 0.1124545, 0, 1, 0.03529412, 1,
-0.3995803, 0.3881926, -2.219152, 0, 1, 0.03921569, 1,
-0.395831, -0.4081031, -1.987157, 0, 1, 0.04705882, 1,
-0.3895848, 0.1873958, -2.780862, 0, 1, 0.05098039, 1,
-0.3849345, 1.161956, 0.2996745, 0, 1, 0.05882353, 1,
-0.3844065, 0.9439798, 0.4905099, 0, 1, 0.0627451, 1,
-0.3842292, 1.347157, 0.4929215, 0, 1, 0.07058824, 1,
-0.3726647, 0.181201, 0.6822535, 0, 1, 0.07450981, 1,
-0.3712951, -0.5660146, -2.811386, 0, 1, 0.08235294, 1,
-0.3681774, 0.5783638, 0.4471611, 0, 1, 0.08627451, 1,
-0.3647946, 0.6690479, -0.2070009, 0, 1, 0.09411765, 1,
-0.3647585, -0.4506375, -2.856434, 0, 1, 0.1019608, 1,
-0.3645237, -1.608287, -4.050023, 0, 1, 0.1058824, 1,
-0.363486, -0.2808501, -1.642094, 0, 1, 0.1137255, 1,
-0.3632665, -0.2414379, -2.218935, 0, 1, 0.1176471, 1,
-0.363204, 0.2404728, -1.029812, 0, 1, 0.1254902, 1,
-0.3561033, 0.7513059, 0.7869052, 0, 1, 0.1294118, 1,
-0.3547474, 0.3074791, -1.414602, 0, 1, 0.1372549, 1,
-0.3502774, 0.9882542, 1.238747, 0, 1, 0.1411765, 1,
-0.3452663, -0.159502, -2.274649, 0, 1, 0.1490196, 1,
-0.3423576, 2.332417, -1.569503, 0, 1, 0.1529412, 1,
-0.3397913, -1.36524, -1.887669, 0, 1, 0.1607843, 1,
-0.3370876, 0.6135874, -0.9786733, 0, 1, 0.1647059, 1,
-0.3369985, 1.71929, 0.640496, 0, 1, 0.172549, 1,
-0.3344721, 1.131157, -1.532052, 0, 1, 0.1764706, 1,
-0.3333739, -0.817974, -3.168264, 0, 1, 0.1843137, 1,
-0.3298855, -0.1644008, 0.09395465, 0, 1, 0.1882353, 1,
-0.3266569, -0.1619834, -3.708521, 0, 1, 0.1960784, 1,
-0.3257654, 1.277779, 1.580019, 0, 1, 0.2039216, 1,
-0.3249527, -0.06817218, -2.150635, 0, 1, 0.2078431, 1,
-0.323036, 0.6759721, 0.1167355, 0, 1, 0.2156863, 1,
-0.3217473, 0.8302262, 0.4592427, 0, 1, 0.2196078, 1,
-0.3177246, -0.3452408, -0.2739927, 0, 1, 0.227451, 1,
-0.3171341, 1.337759, 0.003498056, 0, 1, 0.2313726, 1,
-0.3164924, 0.1543482, 0.2541352, 0, 1, 0.2392157, 1,
-0.3163528, -1.278482, -3.336118, 0, 1, 0.2431373, 1,
-0.3160866, -1.091825, -2.151643, 0, 1, 0.2509804, 1,
-0.3160052, 0.5058879, -0.3901785, 0, 1, 0.254902, 1,
-0.3140854, 0.3394857, 1.40828, 0, 1, 0.2627451, 1,
-0.3137844, -0.4714722, -2.204118, 0, 1, 0.2666667, 1,
-0.3131279, 0.3737563, -0.2529274, 0, 1, 0.2745098, 1,
-0.3068469, 0.366838, -0.6938916, 0, 1, 0.2784314, 1,
-0.3058003, -0.9041584, -2.41691, 0, 1, 0.2862745, 1,
-0.3027475, -0.3312219, -3.911155, 0, 1, 0.2901961, 1,
-0.3018416, 0.3391034, 0.1646776, 0, 1, 0.2980392, 1,
-0.3016106, 0.5075294, -1.931127, 0, 1, 0.3058824, 1,
-0.3014397, 0.7233217, 0.5393578, 0, 1, 0.3098039, 1,
-0.3005861, -0.4986729, -2.343114, 0, 1, 0.3176471, 1,
-0.2999272, 0.6496135, -0.8837555, 0, 1, 0.3215686, 1,
-0.2958404, -2.386258, -1.834277, 0, 1, 0.3294118, 1,
-0.2914956, 0.8806924, 0.06113102, 0, 1, 0.3333333, 1,
-0.2908824, -1.570704, -2.499899, 0, 1, 0.3411765, 1,
-0.2902243, 1.342439, -2.634665, 0, 1, 0.345098, 1,
-0.2873341, 0.616386, -1.355673, 0, 1, 0.3529412, 1,
-0.2850765, 0.8610317, -0.8401114, 0, 1, 0.3568628, 1,
-0.281459, 0.425948, -0.3578456, 0, 1, 0.3647059, 1,
-0.2807608, 1.395921, 0.2819273, 0, 1, 0.3686275, 1,
-0.2750611, -0.6023647, -2.51355, 0, 1, 0.3764706, 1,
-0.2709198, -0.4732815, -2.80828, 0, 1, 0.3803922, 1,
-0.2686164, -1.822915, -2.980623, 0, 1, 0.3882353, 1,
-0.2685015, 0.9904709, -1.793426, 0, 1, 0.3921569, 1,
-0.2648349, 0.4565887, -0.1694674, 0, 1, 0.4, 1,
-0.2643806, -1.63713, -3.099124, 0, 1, 0.4078431, 1,
-0.2619109, 0.7880984, -0.223874, 0, 1, 0.4117647, 1,
-0.2599785, 0.9064385, 0.5579931, 0, 1, 0.4196078, 1,
-0.2555365, 0.5125872, 0.6274976, 0, 1, 0.4235294, 1,
-0.251406, 0.0600236, -3.01654, 0, 1, 0.4313726, 1,
-0.2492044, -0.2286721, -2.274892, 0, 1, 0.4352941, 1,
-0.2462022, 1.796388, 1.334728, 0, 1, 0.4431373, 1,
-0.2412436, 1.218753, -0.2873224, 0, 1, 0.4470588, 1,
-0.2359316, -0.8466914, -2.241724, 0, 1, 0.454902, 1,
-0.233362, -0.2373917, -1.394766, 0, 1, 0.4588235, 1,
-0.2332827, -1.217375, -4.019606, 0, 1, 0.4666667, 1,
-0.2280926, 0.1293979, 0.0354532, 0, 1, 0.4705882, 1,
-0.2271011, 0.8436003, 0.9124067, 0, 1, 0.4784314, 1,
-0.2258682, -1.028689, -2.594359, 0, 1, 0.4823529, 1,
-0.2225658, -1.504375, -2.6659, 0, 1, 0.4901961, 1,
-0.218076, 0.3279674, 0.4538029, 0, 1, 0.4941176, 1,
-0.2077657, 0.8682998, -0.7678158, 0, 1, 0.5019608, 1,
-0.2076245, 1.864467, -0.1891884, 0, 1, 0.509804, 1,
-0.2063887, 0.05328731, -0.8812969, 0, 1, 0.5137255, 1,
-0.2037466, -1.286638, -3.234574, 0, 1, 0.5215687, 1,
-0.2037071, -0.5586304, -3.410494, 0, 1, 0.5254902, 1,
-0.201264, 0.3517547, -0.3693624, 0, 1, 0.5333334, 1,
-0.1993562, 0.7140598, -0.3079974, 0, 1, 0.5372549, 1,
-0.1990757, -0.726094, -3.665622, 0, 1, 0.5450981, 1,
-0.197098, -0.6041197, -4.475668, 0, 1, 0.5490196, 1,
-0.1966923, -0.7255012, -2.073234, 0, 1, 0.5568628, 1,
-0.1921482, -0.04699551, -2.842789, 0, 1, 0.5607843, 1,
-0.1858476, -0.3497153, -2.834519, 0, 1, 0.5686275, 1,
-0.1720091, -2.12247, -1.924618, 0, 1, 0.572549, 1,
-0.1718602, -0.9296764, -3.079731, 0, 1, 0.5803922, 1,
-0.1685641, 0.01135426, -3.741868, 0, 1, 0.5843138, 1,
-0.1685338, -1.324202, -4.4426, 0, 1, 0.5921569, 1,
-0.1681203, 1.108753, 0.4774124, 0, 1, 0.5960785, 1,
-0.1676284, -0.7106368, -2.40541, 0, 1, 0.6039216, 1,
-0.1672136, 0.08113749, -1.870361, 0, 1, 0.6117647, 1,
-0.1622737, -1.017233, -3.185891, 0, 1, 0.6156863, 1,
-0.1613093, 1.606628, -1.249975, 0, 1, 0.6235294, 1,
-0.1596772, -0.283866, -3.1397, 0, 1, 0.627451, 1,
-0.1557176, 0.6296973, 0.177409, 0, 1, 0.6352941, 1,
-0.1531984, -0.0002596215, -1.718313, 0, 1, 0.6392157, 1,
-0.1486484, -0.977706, -1.768373, 0, 1, 0.6470588, 1,
-0.1438415, 1.63509, 0.1300074, 0, 1, 0.6509804, 1,
-0.1409947, -0.01831015, -1.147945, 0, 1, 0.6588235, 1,
-0.1355706, 0.1276611, -0.2154289, 0, 1, 0.6627451, 1,
-0.1314742, -1.989398, -4.616342, 0, 1, 0.6705883, 1,
-0.1274851, 1.820225, -1.699335, 0, 1, 0.6745098, 1,
-0.1186981, 0.4992015, -0.9976239, 0, 1, 0.682353, 1,
-0.1166502, -1.653528, -4.837126, 0, 1, 0.6862745, 1,
-0.115964, 0.5447948, -1.297625, 0, 1, 0.6941177, 1,
-0.1154996, -0.4382717, -3.086115, 0, 1, 0.7019608, 1,
-0.1147795, 0.4419518, -0.3539414, 0, 1, 0.7058824, 1,
-0.1118894, -1.289822, -2.60309, 0, 1, 0.7137255, 1,
-0.1066059, -0.3678656, -2.150453, 0, 1, 0.7176471, 1,
-0.1058347, -0.2335345, -4.067465, 0, 1, 0.7254902, 1,
-0.1054999, 0.1267382, 0.2777798, 0, 1, 0.7294118, 1,
-0.1051849, -1.14922, -4.358812, 0, 1, 0.7372549, 1,
-0.1038306, -0.2746337, -3.648675, 0, 1, 0.7411765, 1,
-0.1033505, -0.3052597, -3.035938, 0, 1, 0.7490196, 1,
-0.08910549, -0.9111282, -3.972612, 0, 1, 0.7529412, 1,
-0.08443896, -0.7003095, -3.751734, 0, 1, 0.7607843, 1,
-0.08315232, -0.1914401, -1.524178, 0, 1, 0.7647059, 1,
-0.0827577, 1.30549, -0.04217508, 0, 1, 0.772549, 1,
-0.07975101, -0.336747, -3.162216, 0, 1, 0.7764706, 1,
-0.07874215, 0.7552779, -0.7695302, 0, 1, 0.7843137, 1,
-0.07120334, -0.05443757, -1.38676, 0, 1, 0.7882353, 1,
-0.068753, 1.237342, -0.190197, 0, 1, 0.7960784, 1,
-0.05801916, 0.6711977, 1.078843, 0, 1, 0.8039216, 1,
-0.05519984, -0.5360164, -3.036149, 0, 1, 0.8078431, 1,
-0.04986305, -1.144493, -3.099161, 0, 1, 0.8156863, 1,
-0.04864167, -0.03471334, -2.182823, 0, 1, 0.8196079, 1,
-0.04703411, -0.6573246, -2.194829, 0, 1, 0.827451, 1,
-0.04215964, -0.2843991, -2.593321, 0, 1, 0.8313726, 1,
-0.04190145, -1.107127, -4.038774, 0, 1, 0.8392157, 1,
-0.04041191, 1.554173, 1.728822, 0, 1, 0.8431373, 1,
-0.03953865, -1.100012, -1.333129, 0, 1, 0.8509804, 1,
-0.03937744, -0.8393492, -3.62875, 0, 1, 0.854902, 1,
-0.03700611, -1.484543, -3.936547, 0, 1, 0.8627451, 1,
-0.03358571, -0.2047392, -2.873679, 0, 1, 0.8666667, 1,
-0.03259996, 0.4903671, -0.0876093, 0, 1, 0.8745098, 1,
-0.03219432, 0.8790399, 0.8515638, 0, 1, 0.8784314, 1,
-0.0287034, 1.328488, -0.09458052, 0, 1, 0.8862745, 1,
-0.01210099, 0.21812, -0.4967754, 0, 1, 0.8901961, 1,
-0.0117964, 0.2648073, 1.479542, 0, 1, 0.8980392, 1,
-0.0116045, 0.6266105, -0.5455206, 0, 1, 0.9058824, 1,
-0.00136142, 0.02990236, -0.4602897, 0, 1, 0.9098039, 1,
0.006653883, -1.529038, 3.771516, 0, 1, 0.9176471, 1,
0.01151359, -0.3039722, 3.733509, 0, 1, 0.9215686, 1,
0.01937666, 0.02251583, 1.003571, 0, 1, 0.9294118, 1,
0.0232471, -0.3486837, 2.862692, 0, 1, 0.9333333, 1,
0.0238773, -0.3518354, 2.505959, 0, 1, 0.9411765, 1,
0.02566432, 1.071775, -1.300048, 0, 1, 0.945098, 1,
0.02771141, 1.290063, 0.758948, 0, 1, 0.9529412, 1,
0.03266352, -0.115839, 4.534196, 0, 1, 0.9568627, 1,
0.0359279, -0.9985332, 3.15364, 0, 1, 0.9647059, 1,
0.03693039, 0.3370314, -0.3314864, 0, 1, 0.9686275, 1,
0.03927758, 0.3389125, 0.1050768, 0, 1, 0.9764706, 1,
0.048779, 1.69267, -0.6230648, 0, 1, 0.9803922, 1,
0.05082556, -0.3515883, 1.02979, 0, 1, 0.9882353, 1,
0.05269153, 0.02754149, 1.537901, 0, 1, 0.9921569, 1,
0.05459807, -0.3133419, 0.9987713, 0, 1, 1, 1,
0.05643187, -0.8125477, 3.457201, 0, 0.9921569, 1, 1,
0.06320933, -2.177077, 2.100592, 0, 0.9882353, 1, 1,
0.06628285, 1.001682, -0.3901826, 0, 0.9803922, 1, 1,
0.07235518, 0.2971625, 0.1171137, 0, 0.9764706, 1, 1,
0.07275704, 0.5969512, 0.5191212, 0, 0.9686275, 1, 1,
0.07330091, 0.2002985, 0.1237008, 0, 0.9647059, 1, 1,
0.07415771, 0.8114578, 0.1320078, 0, 0.9568627, 1, 1,
0.07500345, 1.397466, 0.4709421, 0, 0.9529412, 1, 1,
0.07760821, -0.3827458, 3.464206, 0, 0.945098, 1, 1,
0.08255295, 1.439437, -0.7957767, 0, 0.9411765, 1, 1,
0.08432925, -0.1236614, 2.048017, 0, 0.9333333, 1, 1,
0.08512606, -0.6718103, 5.298164, 0, 0.9294118, 1, 1,
0.08968819, 0.442789, 1.212148, 0, 0.9215686, 1, 1,
0.09328391, -1.346147, 3.987781, 0, 0.9176471, 1, 1,
0.0987962, -0.3037531, 0.4375995, 0, 0.9098039, 1, 1,
0.09901653, -1.320543, 2.497985, 0, 0.9058824, 1, 1,
0.1008743, 0.4312444, -1.042261, 0, 0.8980392, 1, 1,
0.1040248, -0.1083019, 0.9304506, 0, 0.8901961, 1, 1,
0.1172688, -1.471042, 0.7539964, 0, 0.8862745, 1, 1,
0.1197724, -0.2900978, 2.317001, 0, 0.8784314, 1, 1,
0.1245956, -0.001114519, 2.384858, 0, 0.8745098, 1, 1,
0.1252153, -1.194013, 2.545659, 0, 0.8666667, 1, 1,
0.1266198, 0.1029389, 0.8270817, 0, 0.8627451, 1, 1,
0.1283076, -0.9191789, 3.291677, 0, 0.854902, 1, 1,
0.1366605, 0.2209701, -0.793488, 0, 0.8509804, 1, 1,
0.1369861, -0.02394849, 0.4088486, 0, 0.8431373, 1, 1,
0.1386343, -0.4961726, 2.548961, 0, 0.8392157, 1, 1,
0.1425715, 1.802513, -0.2996881, 0, 0.8313726, 1, 1,
0.1449192, -1.025159, 2.233195, 0, 0.827451, 1, 1,
0.148821, -0.3429448, 2.069658, 0, 0.8196079, 1, 1,
0.1491919, -0.2069178, 3.389839, 0, 0.8156863, 1, 1,
0.1516454, 0.02945022, 0.5655861, 0, 0.8078431, 1, 1,
0.15319, -1.215124, 4.044314, 0, 0.8039216, 1, 1,
0.1557069, -0.4535069, 2.7947, 0, 0.7960784, 1, 1,
0.1581361, 1.084108, -0.2380728, 0, 0.7882353, 1, 1,
0.159436, -2.301478, 0.179851, 0, 0.7843137, 1, 1,
0.1669794, 0.1233278, -1.364068, 0, 0.7764706, 1, 1,
0.171867, 1.874952, -0.228661, 0, 0.772549, 1, 1,
0.1723803, 0.07266255, 1.475464, 0, 0.7647059, 1, 1,
0.1803724, -1.253064, 4.098781, 0, 0.7607843, 1, 1,
0.1831245, 1.546706, 1.790349, 0, 0.7529412, 1, 1,
0.1876882, -0.4496939, 3.38703, 0, 0.7490196, 1, 1,
0.1884006, 0.3319946, 0.698041, 0, 0.7411765, 1, 1,
0.1886395, 1.615988, 0.585556, 0, 0.7372549, 1, 1,
0.1888806, 1.758351, 0.7977346, 0, 0.7294118, 1, 1,
0.1930071, 1.264275, 0.06004578, 0, 0.7254902, 1, 1,
0.2023458, -0.8760948, 3.055054, 0, 0.7176471, 1, 1,
0.2023514, -0.6637527, 1.809546, 0, 0.7137255, 1, 1,
0.2065695, 0.8889169, -1.960201, 0, 0.7058824, 1, 1,
0.2077181, -1.301266, 1.723692, 0, 0.6980392, 1, 1,
0.2079, -1.1666, 3.426633, 0, 0.6941177, 1, 1,
0.2123659, 1.223501, 0.249961, 0, 0.6862745, 1, 1,
0.2140497, 1.425861, 2.136203, 0, 0.682353, 1, 1,
0.2146011, 0.3400508, -1.082905, 0, 0.6745098, 1, 1,
0.2149395, -0.4335926, 2.20395, 0, 0.6705883, 1, 1,
0.2151936, -0.8934801, 2.475623, 0, 0.6627451, 1, 1,
0.2159075, -2.053638, 2.933779, 0, 0.6588235, 1, 1,
0.2161303, -0.1317027, 2.725668, 0, 0.6509804, 1, 1,
0.2213403, 0.2023257, -1.302456, 0, 0.6470588, 1, 1,
0.247285, -0.5916052, 3.251945, 0, 0.6392157, 1, 1,
0.252316, 0.2440313, 0.4164232, 0, 0.6352941, 1, 1,
0.2530299, 0.9301978, 0.4898856, 0, 0.627451, 1, 1,
0.2532091, -1.021819, 2.91071, 0, 0.6235294, 1, 1,
0.2556261, 0.7353765, -0.3404023, 0, 0.6156863, 1, 1,
0.2561184, 0.4612004, 1.13704, 0, 0.6117647, 1, 1,
0.2595527, -0.8685862, 1.853661, 0, 0.6039216, 1, 1,
0.2621782, -1.154185, 2.222503, 0, 0.5960785, 1, 1,
0.2632003, -1.536566, 1.753634, 0, 0.5921569, 1, 1,
0.2656724, 0.2297244, 1.151337, 0, 0.5843138, 1, 1,
0.2659624, 0.5770723, -1.781158, 0, 0.5803922, 1, 1,
0.2663739, -1.034651, 4.762547, 0, 0.572549, 1, 1,
0.2672084, -1.63155, 2.999312, 0, 0.5686275, 1, 1,
0.274414, 1.225425, -1.037645, 0, 0.5607843, 1, 1,
0.2826138, -0.3868285, 2.962138, 0, 0.5568628, 1, 1,
0.2836777, 1.543709, 1.135108, 0, 0.5490196, 1, 1,
0.2843061, 0.4076597, -0.2087531, 0, 0.5450981, 1, 1,
0.2844275, 0.9236124, -0.8058531, 0, 0.5372549, 1, 1,
0.2864279, -1.27719, 2.310028, 0, 0.5333334, 1, 1,
0.2917815, -0.01184634, 1.558147, 0, 0.5254902, 1, 1,
0.2926945, -0.3275307, 2.296042, 0, 0.5215687, 1, 1,
0.2932965, 0.4973409, -0.4532594, 0, 0.5137255, 1, 1,
0.3006687, -0.3693816, 4.069521, 0, 0.509804, 1, 1,
0.3012693, 0.5268711, 0.8049981, 0, 0.5019608, 1, 1,
0.3052469, 0.152797, 0.8185319, 0, 0.4941176, 1, 1,
0.3145137, 0.9072518, 1.452224, 0, 0.4901961, 1, 1,
0.3155749, -1.563964, 4.932061, 0, 0.4823529, 1, 1,
0.3161165, -1.377479, 3.566284, 0, 0.4784314, 1, 1,
0.3183543, -0.3582301, 3.586693, 0, 0.4705882, 1, 1,
0.3193023, 0.0833666, 0.6330515, 0, 0.4666667, 1, 1,
0.3208629, 0.04081603, 1.636073, 0, 0.4588235, 1, 1,
0.3238426, 0.3229807, 0.9042545, 0, 0.454902, 1, 1,
0.3246034, 1.320769, 1.558586, 0, 0.4470588, 1, 1,
0.3310621, 0.7768853, 0.4078005, 0, 0.4431373, 1, 1,
0.3333578, -0.5749738, 3.924538, 0, 0.4352941, 1, 1,
0.3336437, -0.8941674, 1.844518, 0, 0.4313726, 1, 1,
0.3353947, -0.4032879, 3.63359, 0, 0.4235294, 1, 1,
0.3357593, 1.908082, 2.308137, 0, 0.4196078, 1, 1,
0.3381968, 0.4498149, -1.842205, 0, 0.4117647, 1, 1,
0.340093, 1.15245, 1.735554, 0, 0.4078431, 1, 1,
0.3403766, 1.163895, 0.9258376, 0, 0.4, 1, 1,
0.3439288, -0.7328262, 3.425244, 0, 0.3921569, 1, 1,
0.3451656, 0.5359033, 1.766494, 0, 0.3882353, 1, 1,
0.347097, 0.412853, 0.511113, 0, 0.3803922, 1, 1,
0.3482285, -0.4659115, 3.389549, 0, 0.3764706, 1, 1,
0.3565504, 0.6750152, -0.4735377, 0, 0.3686275, 1, 1,
0.3581225, 2.058756, 2.031776, 0, 0.3647059, 1, 1,
0.3646228, 1.244472, -1.540886, 0, 0.3568628, 1, 1,
0.3657192, -1.092832, 2.492774, 0, 0.3529412, 1, 1,
0.36959, 0.1481039, 2.369984, 0, 0.345098, 1, 1,
0.3809567, 1.328179, 0.4446581, 0, 0.3411765, 1, 1,
0.3816126, 0.2462699, 0.2868212, 0, 0.3333333, 1, 1,
0.3855149, -1.057698, 1.815676, 0, 0.3294118, 1, 1,
0.3876998, -1.257191, 3.06928, 0, 0.3215686, 1, 1,
0.3878834, 0.7573141, -0.4113748, 0, 0.3176471, 1, 1,
0.3888884, -0.8591276, 0.1042844, 0, 0.3098039, 1, 1,
0.3953778, -1.552592, 2.232195, 0, 0.3058824, 1, 1,
0.401836, -1.504028, 3.544695, 0, 0.2980392, 1, 1,
0.4036419, -1.946412, 3.304916, 0, 0.2901961, 1, 1,
0.4039945, -0.8795844, 2.651695, 0, 0.2862745, 1, 1,
0.4046467, 1.946205, 2.031249, 0, 0.2784314, 1, 1,
0.4047604, 0.6657224, 0.2902236, 0, 0.2745098, 1, 1,
0.4054832, 1.688775, 1.507272, 0, 0.2666667, 1, 1,
0.4063954, 0.4191704, 0.7329294, 0, 0.2627451, 1, 1,
0.4136139, -0.5502127, 3.133883, 0, 0.254902, 1, 1,
0.4183923, -0.4891381, 4.489542, 0, 0.2509804, 1, 1,
0.4230429, 0.3284827, 1.517548, 0, 0.2431373, 1, 1,
0.4255717, 0.9075934, 0.0461426, 0, 0.2392157, 1, 1,
0.4259796, 0.08323218, 1.42043, 0, 0.2313726, 1, 1,
0.4277402, -0.3160858, 1.885661, 0, 0.227451, 1, 1,
0.4294987, -0.2588586, 3.170445, 0, 0.2196078, 1, 1,
0.4313229, 0.8770108, -0.3362075, 0, 0.2156863, 1, 1,
0.4322433, -0.4614798, 0.7842606, 0, 0.2078431, 1, 1,
0.4388343, -1.217719, 2.409742, 0, 0.2039216, 1, 1,
0.4404935, 2.094988, 0.9631574, 0, 0.1960784, 1, 1,
0.4446487, 0.2850673, 2.907876, 0, 0.1882353, 1, 1,
0.4447214, 0.1176296, 0.06827653, 0, 0.1843137, 1, 1,
0.4485947, -0.6771708, 1.95145, 0, 0.1764706, 1, 1,
0.4530775, -1.4536, 2.800947, 0, 0.172549, 1, 1,
0.4584514, -0.5932423, 2.622063, 0, 0.1647059, 1, 1,
0.4587191, 0.9912851, 0.7721758, 0, 0.1607843, 1, 1,
0.4621316, 1.100928, 0.0541587, 0, 0.1529412, 1, 1,
0.4675005, -0.8434035, 2.999983, 0, 0.1490196, 1, 1,
0.469311, -1.512505, 3.926699, 0, 0.1411765, 1, 1,
0.4713719, -0.5416147, 2.709816, 0, 0.1372549, 1, 1,
0.4759758, -0.5065652, 2.628194, 0, 0.1294118, 1, 1,
0.4783911, 1.022889, -0.1074253, 0, 0.1254902, 1, 1,
0.4809409, -0.7473612, 1.539363, 0, 0.1176471, 1, 1,
0.4820289, -1.050429, 1.547756, 0, 0.1137255, 1, 1,
0.4845392, -0.3020971, 3.256733, 0, 0.1058824, 1, 1,
0.486409, 0.8551522, 1.248664, 0, 0.09803922, 1, 1,
0.4876018, -0.9770347, 4.117929, 0, 0.09411765, 1, 1,
0.490078, 0.1231446, -0.6713556, 0, 0.08627451, 1, 1,
0.4925462, -1.742126, 1.604023, 0, 0.08235294, 1, 1,
0.4927499, 0.1333191, 2.08245, 0, 0.07450981, 1, 1,
0.494049, -1.216747, 2.046018, 0, 0.07058824, 1, 1,
0.4955487, 0.3734413, 1.66594, 0, 0.0627451, 1, 1,
0.4957406, -0.2044388, 1.954745, 0, 0.05882353, 1, 1,
0.4998506, 0.7943429, -0.04786493, 0, 0.05098039, 1, 1,
0.5027858, -0.03107803, 2.361303, 0, 0.04705882, 1, 1,
0.5029745, -0.9692873, 3.937759, 0, 0.03921569, 1, 1,
0.5049118, 0.9063093, 0.8869442, 0, 0.03529412, 1, 1,
0.5076963, 0.02644562, 0.9908912, 0, 0.02745098, 1, 1,
0.5084609, -0.2763487, 1.60612, 0, 0.02352941, 1, 1,
0.5087156, 0.08738694, 0.6505332, 0, 0.01568628, 1, 1,
0.5121199, 2.520741, -0.2252842, 0, 0.01176471, 1, 1,
0.5207483, -1.707529, 2.839168, 0, 0.003921569, 1, 1,
0.5223678, 0.2523399, 2.387924, 0.003921569, 0, 1, 1,
0.522741, -0.2331823, 1.803737, 0.007843138, 0, 1, 1,
0.5256677, 0.3594875, 0.2215746, 0.01568628, 0, 1, 1,
0.5282997, 0.9823912, 1.452251, 0.01960784, 0, 1, 1,
0.5289388, 1.555675, 0.4142139, 0.02745098, 0, 1, 1,
0.5300265, 0.2742828, 1.017651, 0.03137255, 0, 1, 1,
0.5315166, -0.7913727, 2.448731, 0.03921569, 0, 1, 1,
0.5350603, -0.3927539, 2.243108, 0.04313726, 0, 1, 1,
0.535468, -0.8214523, 2.80816, 0.05098039, 0, 1, 1,
0.5372155, 0.1428438, 1.604746, 0.05490196, 0, 1, 1,
0.538268, 0.1300484, 0.09761783, 0.0627451, 0, 1, 1,
0.5410531, -1.516897, 4.872637, 0.06666667, 0, 1, 1,
0.5448121, 2.12614, 1.274574, 0.07450981, 0, 1, 1,
0.546217, -1.019278, 2.996524, 0.07843138, 0, 1, 1,
0.5466399, -1.293839, 2.631048, 0.08627451, 0, 1, 1,
0.5492792, -1.024583, 2.378814, 0.09019608, 0, 1, 1,
0.5512269, -0.1572246, 2.147708, 0.09803922, 0, 1, 1,
0.5512275, 0.9197652, 0.2444413, 0.1058824, 0, 1, 1,
0.5516454, -0.2643129, 0.8371133, 0.1098039, 0, 1, 1,
0.5547419, -1.074746, 2.709419, 0.1176471, 0, 1, 1,
0.5553246, 1.579964, -1.069046, 0.1215686, 0, 1, 1,
0.5558969, 2.61243, 0.5695653, 0.1294118, 0, 1, 1,
0.5578249, 0.828764, 1.178333, 0.1333333, 0, 1, 1,
0.5578497, 0.2001422, 1.285295, 0.1411765, 0, 1, 1,
0.5582626, -2.007584, 1.355515, 0.145098, 0, 1, 1,
0.5694643, 0.6490896, 2.017793, 0.1529412, 0, 1, 1,
0.5730864, 0.3189811, -0.08486731, 0.1568628, 0, 1, 1,
0.5740796, 0.6186855, 0.4557054, 0.1647059, 0, 1, 1,
0.5775899, -0.3839765, -0.7860707, 0.1686275, 0, 1, 1,
0.5793998, 0.7932125, -0.02986147, 0.1764706, 0, 1, 1,
0.5822455, -0.6369923, 2.496329, 0.1803922, 0, 1, 1,
0.5838333, 0.4407875, -0.4973616, 0.1882353, 0, 1, 1,
0.588383, -1.265559, 1.937233, 0.1921569, 0, 1, 1,
0.5885231, 0.1702598, 0.2164387, 0.2, 0, 1, 1,
0.5893868, 0.9184807, 1.114423, 0.2078431, 0, 1, 1,
0.5935085, 0.1388301, 2.554083, 0.2117647, 0, 1, 1,
0.5949737, 0.8141445, -2.338492, 0.2196078, 0, 1, 1,
0.5954869, -0.6730448, 3.965022, 0.2235294, 0, 1, 1,
0.5959209, -0.6189581, 1.853241, 0.2313726, 0, 1, 1,
0.5968463, -0.362233, 1.72552, 0.2352941, 0, 1, 1,
0.6056439, 1.585476, -0.1651541, 0.2431373, 0, 1, 1,
0.6083891, -0.4883723, 0.0684561, 0.2470588, 0, 1, 1,
0.6122473, 0.09558912, 0.9745498, 0.254902, 0, 1, 1,
0.6124232, -0.1752315, 0.01147492, 0.2588235, 0, 1, 1,
0.6163121, -1.010593, 2.850874, 0.2666667, 0, 1, 1,
0.6220474, -0.6925589, 0.2972137, 0.2705882, 0, 1, 1,
0.6264994, -0.3560256, 1.603006, 0.2784314, 0, 1, 1,
0.6288384, -1.055788, 2.445007, 0.282353, 0, 1, 1,
0.6301177, -1.924477, 3.605171, 0.2901961, 0, 1, 1,
0.6313845, -0.6242883, 2.300246, 0.2941177, 0, 1, 1,
0.6379891, -0.7649481, 3.612134, 0.3019608, 0, 1, 1,
0.6404101, 1.42439, -0.3544944, 0.3098039, 0, 1, 1,
0.6461555, 0.4742134, 1.107957, 0.3137255, 0, 1, 1,
0.6463678, -0.435025, 3.050236, 0.3215686, 0, 1, 1,
0.6469862, -0.2263217, 2.19005, 0.3254902, 0, 1, 1,
0.6497268, -0.04620169, 3.695979, 0.3333333, 0, 1, 1,
0.6498531, -0.7108419, 2.718118, 0.3372549, 0, 1, 1,
0.6500893, 0.1659149, 1.145605, 0.345098, 0, 1, 1,
0.654064, -0.644093, -1.454758, 0.3490196, 0, 1, 1,
0.656314, 1.454556, 2.736085, 0.3568628, 0, 1, 1,
0.658716, -1.472848, 1.364664, 0.3607843, 0, 1, 1,
0.65962, -0.02930759, 1.485151, 0.3686275, 0, 1, 1,
0.6600987, -0.4081492, 2.389033, 0.372549, 0, 1, 1,
0.6613522, 0.6906773, 0.7294283, 0.3803922, 0, 1, 1,
0.6620674, -1.324751, 2.528181, 0.3843137, 0, 1, 1,
0.6631366, -0.740491, 2.747412, 0.3921569, 0, 1, 1,
0.663245, -0.5302106, 2.471664, 0.3960784, 0, 1, 1,
0.6641655, -0.06774027, 0.8445634, 0.4039216, 0, 1, 1,
0.6666631, -1.806046, 5.189357, 0.4117647, 0, 1, 1,
0.6705704, 0.1253114, 1.567776, 0.4156863, 0, 1, 1,
0.6760442, 0.7641338, -0.3289406, 0.4235294, 0, 1, 1,
0.6861391, 0.04921599, 2.216945, 0.427451, 0, 1, 1,
0.6937604, 0.7187682, 0.4151185, 0.4352941, 0, 1, 1,
0.6990131, -0.2470418, 1.66284, 0.4392157, 0, 1, 1,
0.6994779, 0.9985726, 0.01213388, 0.4470588, 0, 1, 1,
0.6999259, 2.054651, 0.003533568, 0.4509804, 0, 1, 1,
0.701022, -1.348244, 4.286498, 0.4588235, 0, 1, 1,
0.7057765, 0.751519, 0.4842337, 0.4627451, 0, 1, 1,
0.7121904, -0.5320105, 1.892698, 0.4705882, 0, 1, 1,
0.7133214, -1.930346, 2.129954, 0.4745098, 0, 1, 1,
0.7141006, 0.4064915, 0.9753122, 0.4823529, 0, 1, 1,
0.7155191, 1.14251, 1.30264, 0.4862745, 0, 1, 1,
0.7171187, 1.471023, 1.131157, 0.4941176, 0, 1, 1,
0.7172052, 0.4579936, -0.1293456, 0.5019608, 0, 1, 1,
0.7172472, 1.092071, -0.3362586, 0.5058824, 0, 1, 1,
0.7188147, 0.7167518, -0.3947974, 0.5137255, 0, 1, 1,
0.7189075, -1.629897, 1.257814, 0.5176471, 0, 1, 1,
0.7203722, -0.01996977, 1.522424, 0.5254902, 0, 1, 1,
0.721513, 0.07906922, 1.685123, 0.5294118, 0, 1, 1,
0.7216958, 0.3287412, 1.767488, 0.5372549, 0, 1, 1,
0.7242984, 0.03543505, -0.2492302, 0.5411765, 0, 1, 1,
0.7245334, 1.916995, -0.2058821, 0.5490196, 0, 1, 1,
0.7260722, -0.7361883, 2.348218, 0.5529412, 0, 1, 1,
0.7278215, -0.3206211, 1.772074, 0.5607843, 0, 1, 1,
0.7296677, 0.6056031, 2.05993, 0.5647059, 0, 1, 1,
0.734667, 1.019674, 1.227994, 0.572549, 0, 1, 1,
0.7351077, 0.756825, 0.7811618, 0.5764706, 0, 1, 1,
0.7445412, -1.566758, 2.786049, 0.5843138, 0, 1, 1,
0.7449926, 0.344496, 2.016229, 0.5882353, 0, 1, 1,
0.7511265, 0.03757449, 2.052788, 0.5960785, 0, 1, 1,
0.7522817, 1.174985, 1.639619, 0.6039216, 0, 1, 1,
0.7528974, 0.5402789, 2.636355, 0.6078432, 0, 1, 1,
0.7555736, 0.1400613, 1.833519, 0.6156863, 0, 1, 1,
0.757257, 1.617001, 1.184135, 0.6196079, 0, 1, 1,
0.7580231, 0.8615308, 0.6137664, 0.627451, 0, 1, 1,
0.7642199, -1.044497, 2.785968, 0.6313726, 0, 1, 1,
0.7648975, -0.03890106, 1.115827, 0.6392157, 0, 1, 1,
0.7650598, 1.492728, 0.2935256, 0.6431373, 0, 1, 1,
0.7795708, 1.368486, -0.4225385, 0.6509804, 0, 1, 1,
0.7887386, 0.1450762, 1.642646, 0.654902, 0, 1, 1,
0.789869, 0.279146, 0.5593792, 0.6627451, 0, 1, 1,
0.7905226, -0.08620565, 1.894837, 0.6666667, 0, 1, 1,
0.7965303, -0.4099426, 2.634095, 0.6745098, 0, 1, 1,
0.8082284, 0.1823791, -0.1018602, 0.6784314, 0, 1, 1,
0.8119423, 0.4046623, 2.183331, 0.6862745, 0, 1, 1,
0.8123165, 2.313366, -0.6778998, 0.6901961, 0, 1, 1,
0.8153775, 0.7018797, 0.3901148, 0.6980392, 0, 1, 1,
0.8172555, 1.32605, -0.6244064, 0.7058824, 0, 1, 1,
0.8217481, 0.9963148, 0.857124, 0.7098039, 0, 1, 1,
0.8244811, 0.5807933, 2.181354, 0.7176471, 0, 1, 1,
0.8266166, -0.2390606, 3.926348, 0.7215686, 0, 1, 1,
0.827506, 2.561651, 1.593376, 0.7294118, 0, 1, 1,
0.8279242, -0.4220638, 3.090408, 0.7333333, 0, 1, 1,
0.8285462, 1.317433, 0.5867749, 0.7411765, 0, 1, 1,
0.8377206, 0.5555518, 1.500042, 0.7450981, 0, 1, 1,
0.8377955, -0.3574803, 2.427263, 0.7529412, 0, 1, 1,
0.8401784, -0.3951106, 1.960545, 0.7568628, 0, 1, 1,
0.8403491, 0.467561, 0.03166673, 0.7647059, 0, 1, 1,
0.8410406, 0.0620934, 1.627841, 0.7686275, 0, 1, 1,
0.8467514, -1.477152, 1.987165, 0.7764706, 0, 1, 1,
0.8484862, 2.046737, 0.3206659, 0.7803922, 0, 1, 1,
0.8531122, -0.8469379, 2.168176, 0.7882353, 0, 1, 1,
0.8745635, -1.210771, 2.385354, 0.7921569, 0, 1, 1,
0.8755046, -1.579019, 3.939536, 0.8, 0, 1, 1,
0.8755584, 0.1705747, 1.580865, 0.8078431, 0, 1, 1,
0.8771883, -1.472778, 2.30438, 0.8117647, 0, 1, 1,
0.8780566, -0.08197048, 2.49369, 0.8196079, 0, 1, 1,
0.8824944, -0.0701202, 1.353048, 0.8235294, 0, 1, 1,
0.8825301, -0.09880037, 1.653635, 0.8313726, 0, 1, 1,
0.8846909, -1.657445, 2.026839, 0.8352941, 0, 1, 1,
0.890857, -1.430574, 2.080282, 0.8431373, 0, 1, 1,
0.8923895, 0.7424021, 1.32947, 0.8470588, 0, 1, 1,
0.8927172, -1.218221, 0.9010758, 0.854902, 0, 1, 1,
0.9026661, 0.05958442, 0.6646562, 0.8588235, 0, 1, 1,
0.9051915, -1.2765, 3.625314, 0.8666667, 0, 1, 1,
0.9067436, -0.6127121, 1.243662, 0.8705882, 0, 1, 1,
0.9156928, -0.85516, 2.14948, 0.8784314, 0, 1, 1,
0.9260655, 0.3253257, 1.205429, 0.8823529, 0, 1, 1,
0.9279674, 0.5233549, -0.007647181, 0.8901961, 0, 1, 1,
0.9281057, 0.4236971, 1.86865, 0.8941177, 0, 1, 1,
0.9340926, 0.3102344, -0.9343389, 0.9019608, 0, 1, 1,
0.9345456, 0.4348581, 1.578515, 0.9098039, 0, 1, 1,
0.9371929, -3.254963, 1.596526, 0.9137255, 0, 1, 1,
0.9376799, 2.372426, -0.9218194, 0.9215686, 0, 1, 1,
0.9402633, -0.4991871, 2.677158, 0.9254902, 0, 1, 1,
0.9414578, 0.3511637, 0.05085078, 0.9333333, 0, 1, 1,
0.9435931, -0.1172417, 1.581401, 0.9372549, 0, 1, 1,
0.9473823, -0.7219748, 2.073074, 0.945098, 0, 1, 1,
0.95017, 0.122333, 0.8470557, 0.9490196, 0, 1, 1,
0.9503615, -0.009899518, 2.714839, 0.9568627, 0, 1, 1,
0.9612969, 0.9729422, 1.38766, 0.9607843, 0, 1, 1,
0.9669901, -0.190531, 3.053725, 0.9686275, 0, 1, 1,
0.9690095, 0.4571982, 1.181049, 0.972549, 0, 1, 1,
0.9720395, 0.3097985, 1.276938, 0.9803922, 0, 1, 1,
0.9902824, 0.4004505, 1.059241, 0.9843137, 0, 1, 1,
1.004197, 1.135139, 0.1834509, 0.9921569, 0, 1, 1,
1.006342, -0.7676376, 1.757651, 0.9960784, 0, 1, 1,
1.017399, 1.463203, 0.94406, 1, 0, 0.9960784, 1,
1.017737, 0.7547508, 1.899055, 1, 0, 0.9882353, 1,
1.017875, 1.46552, 1.590418, 1, 0, 0.9843137, 1,
1.021058, -0.1704984, 4.257255, 1, 0, 0.9764706, 1,
1.023733, 1.198915, 0.7538299, 1, 0, 0.972549, 1,
1.035569, 1.175025, -1.103404, 1, 0, 0.9647059, 1,
1.03571, -0.4481876, 2.502833, 1, 0, 0.9607843, 1,
1.043699, -1.065412, 3.176354, 1, 0, 0.9529412, 1,
1.043775, 0.3771124, 0.9549869, 1, 0, 0.9490196, 1,
1.043779, -1.209265, 0.7273254, 1, 0, 0.9411765, 1,
1.043847, -0.1185267, 0.848262, 1, 0, 0.9372549, 1,
1.047204, 0.7345086, -0.04173738, 1, 0, 0.9294118, 1,
1.047845, -0.3871837, 1.847845, 1, 0, 0.9254902, 1,
1.050627, 1.657149, 0.3967866, 1, 0, 0.9176471, 1,
1.054731, -0.6522583, 1.832636, 1, 0, 0.9137255, 1,
1.056435, 0.5951788, -1.113288, 1, 0, 0.9058824, 1,
1.063918, 0.5723287, 1.229371, 1, 0, 0.9019608, 1,
1.06694, 0.9329418, 1.70316, 1, 0, 0.8941177, 1,
1.072483, 0.6157165, 1.422423, 1, 0, 0.8862745, 1,
1.074445, -2.093092, 0.5909322, 1, 0, 0.8823529, 1,
1.077523, -1.515392, 1.64531, 1, 0, 0.8745098, 1,
1.080507, 0.5535777, 2.082216, 1, 0, 0.8705882, 1,
1.080996, -1.795155, 2.822361, 1, 0, 0.8627451, 1,
1.098522, 2.044667, 1.117431, 1, 0, 0.8588235, 1,
1.099382, -0.07967494, 1.954436, 1, 0, 0.8509804, 1,
1.103393, -2.799805, 3.12417, 1, 0, 0.8470588, 1,
1.105204, 0.2227091, 0.1084276, 1, 0, 0.8392157, 1,
1.115941, -0.4181787, 3.352304, 1, 0, 0.8352941, 1,
1.117262, 0.7852112, 0.5790591, 1, 0, 0.827451, 1,
1.120576, 0.3095497, 0.1450926, 1, 0, 0.8235294, 1,
1.122912, 0.3856753, 3.142562, 1, 0, 0.8156863, 1,
1.122966, 0.2593759, 2.165567, 1, 0, 0.8117647, 1,
1.127384, -1.249524, 2.077295, 1, 0, 0.8039216, 1,
1.141188, 0.3979437, -0.2023548, 1, 0, 0.7960784, 1,
1.142133, 1.213555, 0.3627149, 1, 0, 0.7921569, 1,
1.142688, 0.4014879, 0.4089302, 1, 0, 0.7843137, 1,
1.165499, -0.8680773, 2.417608, 1, 0, 0.7803922, 1,
1.172549, -0.126185, 1.528856, 1, 0, 0.772549, 1,
1.188315, -0.08689106, 1.981988, 1, 0, 0.7686275, 1,
1.190632, 0.6391337, 2.477708, 1, 0, 0.7607843, 1,
1.196989, -0.7673829, 2.763949, 1, 0, 0.7568628, 1,
1.205125, 1.04989, 1.113337, 1, 0, 0.7490196, 1,
1.209168, -0.9117515, 2.462065, 1, 0, 0.7450981, 1,
1.209226, 1.269367, 0.668115, 1, 0, 0.7372549, 1,
1.211458, 0.5956802, 0.5359482, 1, 0, 0.7333333, 1,
1.217342, -0.09368252, 2.19353, 1, 0, 0.7254902, 1,
1.221885, 0.2387512, -0.3300997, 1, 0, 0.7215686, 1,
1.227774, 0.2784131, -1.123072, 1, 0, 0.7137255, 1,
1.231358, -0.8278046, 2.661315, 1, 0, 0.7098039, 1,
1.238137, 0.02459587, 1.524412, 1, 0, 0.7019608, 1,
1.239493, -1.957107, 3.532755, 1, 0, 0.6941177, 1,
1.240611, -0.2487051, 2.043017, 1, 0, 0.6901961, 1,
1.243982, -1.202798, 3.231918, 1, 0, 0.682353, 1,
1.250215, -0.002388468, 0.3254536, 1, 0, 0.6784314, 1,
1.259114, -0.2301892, 3.038754, 1, 0, 0.6705883, 1,
1.266809, 0.2390546, 0.08812024, 1, 0, 0.6666667, 1,
1.276703, -0.6868548, 2.12434, 1, 0, 0.6588235, 1,
1.288223, -0.6700323, 2.401756, 1, 0, 0.654902, 1,
1.290886, 0.3801586, 2.100704, 1, 0, 0.6470588, 1,
1.290996, 0.3486091, 2.351843, 1, 0, 0.6431373, 1,
1.297399, -1.437792, 1.059632, 1, 0, 0.6352941, 1,
1.302457, -1.564425, 1.703108, 1, 0, 0.6313726, 1,
1.30952, -2.050028, 3.392784, 1, 0, 0.6235294, 1,
1.310245, -1.447641, 2.356507, 1, 0, 0.6196079, 1,
1.311903, 0.6490439, 1.271573, 1, 0, 0.6117647, 1,
1.313664, 0.2213165, 2.217988, 1, 0, 0.6078432, 1,
1.317032, -1.280853, 3.221765, 1, 0, 0.6, 1,
1.318744, 1.733472, 0.6335953, 1, 0, 0.5921569, 1,
1.32396, -0.1752554, -0.7749785, 1, 0, 0.5882353, 1,
1.324023, 0.5571835, 1.442908, 1, 0, 0.5803922, 1,
1.32538, 0.535585, 1.598791, 1, 0, 0.5764706, 1,
1.328125, 0.3341373, -0.8300606, 1, 0, 0.5686275, 1,
1.336426, 0.5722663, 2.01266, 1, 0, 0.5647059, 1,
1.340103, 2.662316, -0.8080662, 1, 0, 0.5568628, 1,
1.367267, 0.9163254, 1.525959, 1, 0, 0.5529412, 1,
1.386962, -0.1831167, 0.7208166, 1, 0, 0.5450981, 1,
1.397363, 0.4138606, 2.015816, 1, 0, 0.5411765, 1,
1.398292, -0.7170594, 0.6903331, 1, 0, 0.5333334, 1,
1.401474, 0.4233705, 1.286028, 1, 0, 0.5294118, 1,
1.407378, 0.3627214, 0.4983689, 1, 0, 0.5215687, 1,
1.415798, 0.6694261, 2.421732, 1, 0, 0.5176471, 1,
1.420928, 0.4044318, 2.627884, 1, 0, 0.509804, 1,
1.435376, -0.7531877, 1.678365, 1, 0, 0.5058824, 1,
1.447306, -0.8564139, 3.244879, 1, 0, 0.4980392, 1,
1.464231, 0.8979183, 1.591839, 1, 0, 0.4901961, 1,
1.471475, 0.2002824, 2.282722, 1, 0, 0.4862745, 1,
1.477005, -1.476212, 2.895137, 1, 0, 0.4784314, 1,
1.480285, -2.46906, 2.198851, 1, 0, 0.4745098, 1,
1.504776, 1.292777, 0.3589776, 1, 0, 0.4666667, 1,
1.505804, 1.898248, 0.426123, 1, 0, 0.4627451, 1,
1.533813, -2.402602, 3.141011, 1, 0, 0.454902, 1,
1.535218, 1.044627, 2.249882, 1, 0, 0.4509804, 1,
1.535391, -1.279009, 2.220102, 1, 0, 0.4431373, 1,
1.547803, 0.5533794, 0.9083096, 1, 0, 0.4392157, 1,
1.555564, 0.635303, 1.276535, 1, 0, 0.4313726, 1,
1.556794, 0.8680845, 1.01618, 1, 0, 0.427451, 1,
1.56012, 2.298527, -0.01531011, 1, 0, 0.4196078, 1,
1.567477, 0.342545, 1.617392, 1, 0, 0.4156863, 1,
1.574496, 0.8318083, 0.6730893, 1, 0, 0.4078431, 1,
1.577538, -0.6525722, 0.7566591, 1, 0, 0.4039216, 1,
1.581909, -1.339935, 2.031361, 1, 0, 0.3960784, 1,
1.582092, 1.471468, 1.218304, 1, 0, 0.3882353, 1,
1.594613, -0.3456015, 2.43195, 1, 0, 0.3843137, 1,
1.597088, -0.2806833, 0.9485238, 1, 0, 0.3764706, 1,
1.598593, 2.468558, 1.965063, 1, 0, 0.372549, 1,
1.599234, 0.2603267, 1.869631, 1, 0, 0.3647059, 1,
1.60806, -1.210593, 0.5534861, 1, 0, 0.3607843, 1,
1.615256, 0.02488272, 1.631019, 1, 0, 0.3529412, 1,
1.620048, -0.2101552, 3.531853, 1, 0, 0.3490196, 1,
1.62631, 0.7241739, -0.2721634, 1, 0, 0.3411765, 1,
1.633403, 1.117622, 1.585846, 1, 0, 0.3372549, 1,
1.641394, -1.000297, 3.753545, 1, 0, 0.3294118, 1,
1.64328, -0.1021307, 2.410326, 1, 0, 0.3254902, 1,
1.646785, -0.6976754, 2.352955, 1, 0, 0.3176471, 1,
1.649505, 0.6420429, 2.409674, 1, 0, 0.3137255, 1,
1.650398, 1.828425, 0.7267986, 1, 0, 0.3058824, 1,
1.663364, 0.6299976, 1.235913, 1, 0, 0.2980392, 1,
1.670379, 1.165323, 2.632355, 1, 0, 0.2941177, 1,
1.670509, 0.1007964, -0.5045686, 1, 0, 0.2862745, 1,
1.671034, 0.3629046, 2.414325, 1, 0, 0.282353, 1,
1.679712, -0.3625752, 2.516392, 1, 0, 0.2745098, 1,
1.680043, -1.187595, 2.809423, 1, 0, 0.2705882, 1,
1.705883, -0.09025386, 0.8823032, 1, 0, 0.2627451, 1,
1.707315, 1.030297, 1.437721, 1, 0, 0.2588235, 1,
1.713564, 2.736444, -1.357744, 1, 0, 0.2509804, 1,
1.719497, 1.278368, 0.1496728, 1, 0, 0.2470588, 1,
1.723717, -1.116847, 2.012798, 1, 0, 0.2392157, 1,
1.724172, 0.4708686, 1.181411, 1, 0, 0.2352941, 1,
1.740632, -0.6959372, 2.075771, 1, 0, 0.227451, 1,
1.749012, 1.320698, 0.2172491, 1, 0, 0.2235294, 1,
1.750646, -1.240349, 4.003368, 1, 0, 0.2156863, 1,
1.806566, -1.059327, 3.03385, 1, 0, 0.2117647, 1,
1.83003, -0.1179093, -0.1307975, 1, 0, 0.2039216, 1,
1.847304, -1.457972, 2.475586, 1, 0, 0.1960784, 1,
1.84938, -0.4360494, 2.862279, 1, 0, 0.1921569, 1,
1.866931, -0.6923202, 1.553433, 1, 0, 0.1843137, 1,
1.883889, 0.995499, 1.312881, 1, 0, 0.1803922, 1,
1.884308, 1.513442, 0.7005759, 1, 0, 0.172549, 1,
1.908298, -0.8903291, 0.5512637, 1, 0, 0.1686275, 1,
1.938174, 0.5216054, 0.8741407, 1, 0, 0.1607843, 1,
1.946484, 0.8622321, 1.233338, 1, 0, 0.1568628, 1,
1.957774, -0.2575205, 3.55951, 1, 0, 0.1490196, 1,
1.961622, -0.0728239, 0.08301807, 1, 0, 0.145098, 1,
2.031482, 0.6390786, 2.010554, 1, 0, 0.1372549, 1,
2.04372, -2.390866, 2.316475, 1, 0, 0.1333333, 1,
2.060907, -0.9883571, 3.194638, 1, 0, 0.1254902, 1,
2.170223, -0.3680721, 2.068698, 1, 0, 0.1215686, 1,
2.180496, -1.032955, 1.679485, 1, 0, 0.1137255, 1,
2.180921, 0.4591221, 1.344429, 1, 0, 0.1098039, 1,
2.189983, 1.345967, 2.427045, 1, 0, 0.1019608, 1,
2.191177, -1.000123, 1.72476, 1, 0, 0.09411765, 1,
2.204272, 1.163489, 0.5900674, 1, 0, 0.09019608, 1,
2.216254, -1.887936, 1.689239, 1, 0, 0.08235294, 1,
2.216382, -0.03849462, 2.858657, 1, 0, 0.07843138, 1,
2.292349, -1.092096, 1.321331, 1, 0, 0.07058824, 1,
2.31105, 0.06440078, 1.822593, 1, 0, 0.06666667, 1,
2.45817, 0.3952712, 1.636955, 1, 0, 0.05882353, 1,
2.509529, -1.18335, 2.451098, 1, 0, 0.05490196, 1,
2.667001, -0.8905479, -0.17033, 1, 0, 0.04705882, 1,
2.720462, -0.7838027, 1.700051, 1, 0, 0.04313726, 1,
2.931677, 0.518164, 1.505147, 1, 0, 0.03529412, 1,
2.949064, -0.4436937, 1.85843, 1, 0, 0.03137255, 1,
3.023014, 0.4742122, 2.139211, 1, 0, 0.02352941, 1,
3.064091, 0.925669, 0.18002, 1, 0, 0.01960784, 1,
3.064556, -0.355587, -1.815218, 1, 0, 0.01176471, 1,
3.451565, -0.0156843, 1.13298, 1, 0, 0.007843138, 1
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
0.2722694, -4.413218, -6.798465, 0, -0.5, 0.5, 0.5,
0.2722694, -4.413218, -6.798465, 1, -0.5, 0.5, 0.5,
0.2722694, -4.413218, -6.798465, 1, 1.5, 0.5, 0.5,
0.2722694, -4.413218, -6.798465, 0, 1.5, 0.5, 0.5
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
-3.984807, -0.2990545, -6.798465, 0, -0.5, 0.5, 0.5,
-3.984807, -0.2990545, -6.798465, 1, -0.5, 0.5, 0.5,
-3.984807, -0.2990545, -6.798465, 1, 1.5, 0.5, 0.5,
-3.984807, -0.2990545, -6.798465, 0, 1.5, 0.5, 0.5
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
-3.984807, -4.413218, 0.1264546, 0, -0.5, 0.5, 0.5,
-3.984807, -4.413218, 0.1264546, 1, -0.5, 0.5, 0.5,
-3.984807, -4.413218, 0.1264546, 1, 1.5, 0.5, 0.5,
-3.984807, -4.413218, 0.1264546, 0, 1.5, 0.5, 0.5
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
-2, -3.463796, -5.200407,
3, -3.463796, -5.200407,
-2, -3.463796, -5.200407,
-2, -3.622033, -5.46675,
-1, -3.463796, -5.200407,
-1, -3.622033, -5.46675,
0, -3.463796, -5.200407,
0, -3.622033, -5.46675,
1, -3.463796, -5.200407,
1, -3.622033, -5.46675,
2, -3.463796, -5.200407,
2, -3.622033, -5.46675,
3, -3.463796, -5.200407,
3, -3.622033, -5.46675
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
-2, -3.938507, -5.999435, 0, -0.5, 0.5, 0.5,
-2, -3.938507, -5.999435, 1, -0.5, 0.5, 0.5,
-2, -3.938507, -5.999435, 1, 1.5, 0.5, 0.5,
-2, -3.938507, -5.999435, 0, 1.5, 0.5, 0.5,
-1, -3.938507, -5.999435, 0, -0.5, 0.5, 0.5,
-1, -3.938507, -5.999435, 1, -0.5, 0.5, 0.5,
-1, -3.938507, -5.999435, 1, 1.5, 0.5, 0.5,
-1, -3.938507, -5.999435, 0, 1.5, 0.5, 0.5,
0, -3.938507, -5.999435, 0, -0.5, 0.5, 0.5,
0, -3.938507, -5.999435, 1, -0.5, 0.5, 0.5,
0, -3.938507, -5.999435, 1, 1.5, 0.5, 0.5,
0, -3.938507, -5.999435, 0, 1.5, 0.5, 0.5,
1, -3.938507, -5.999435, 0, -0.5, 0.5, 0.5,
1, -3.938507, -5.999435, 1, -0.5, 0.5, 0.5,
1, -3.938507, -5.999435, 1, 1.5, 0.5, 0.5,
1, -3.938507, -5.999435, 0, 1.5, 0.5, 0.5,
2, -3.938507, -5.999435, 0, -0.5, 0.5, 0.5,
2, -3.938507, -5.999435, 1, -0.5, 0.5, 0.5,
2, -3.938507, -5.999435, 1, 1.5, 0.5, 0.5,
2, -3.938507, -5.999435, 0, 1.5, 0.5, 0.5,
3, -3.938507, -5.999435, 0, -0.5, 0.5, 0.5,
3, -3.938507, -5.999435, 1, -0.5, 0.5, 0.5,
3, -3.938507, -5.999435, 1, 1.5, 0.5, 0.5,
3, -3.938507, -5.999435, 0, 1.5, 0.5, 0.5
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
-3.002405, -3, -5.200407,
-3.002405, 2, -5.200407,
-3.002405, -3, -5.200407,
-3.166138, -3, -5.46675,
-3.002405, -2, -5.200407,
-3.166138, -2, -5.46675,
-3.002405, -1, -5.200407,
-3.166138, -1, -5.46675,
-3.002405, 0, -5.200407,
-3.166138, 0, -5.46675,
-3.002405, 1, -5.200407,
-3.166138, 1, -5.46675,
-3.002405, 2, -5.200407,
-3.166138, 2, -5.46675
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
-3.493606, -3, -5.999435, 0, -0.5, 0.5, 0.5,
-3.493606, -3, -5.999435, 1, -0.5, 0.5, 0.5,
-3.493606, -3, -5.999435, 1, 1.5, 0.5, 0.5,
-3.493606, -3, -5.999435, 0, 1.5, 0.5, 0.5,
-3.493606, -2, -5.999435, 0, -0.5, 0.5, 0.5,
-3.493606, -2, -5.999435, 1, -0.5, 0.5, 0.5,
-3.493606, -2, -5.999435, 1, 1.5, 0.5, 0.5,
-3.493606, -2, -5.999435, 0, 1.5, 0.5, 0.5,
-3.493606, -1, -5.999435, 0, -0.5, 0.5, 0.5,
-3.493606, -1, -5.999435, 1, -0.5, 0.5, 0.5,
-3.493606, -1, -5.999435, 1, 1.5, 0.5, 0.5,
-3.493606, -1, -5.999435, 0, 1.5, 0.5, 0.5,
-3.493606, 0, -5.999435, 0, -0.5, 0.5, 0.5,
-3.493606, 0, -5.999435, 1, -0.5, 0.5, 0.5,
-3.493606, 0, -5.999435, 1, 1.5, 0.5, 0.5,
-3.493606, 0, -5.999435, 0, 1.5, 0.5, 0.5,
-3.493606, 1, -5.999435, 0, -0.5, 0.5, 0.5,
-3.493606, 1, -5.999435, 1, -0.5, 0.5, 0.5,
-3.493606, 1, -5.999435, 1, 1.5, 0.5, 0.5,
-3.493606, 1, -5.999435, 0, 1.5, 0.5, 0.5,
-3.493606, 2, -5.999435, 0, -0.5, 0.5, 0.5,
-3.493606, 2, -5.999435, 1, -0.5, 0.5, 0.5,
-3.493606, 2, -5.999435, 1, 1.5, 0.5, 0.5,
-3.493606, 2, -5.999435, 0, 1.5, 0.5, 0.5
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
-3.002405, -3.463796, -4,
-3.002405, -3.463796, 4,
-3.002405, -3.463796, -4,
-3.166138, -3.622033, -4,
-3.002405, -3.463796, -2,
-3.166138, -3.622033, -2,
-3.002405, -3.463796, 0,
-3.166138, -3.622033, 0,
-3.002405, -3.463796, 2,
-3.166138, -3.622033, 2,
-3.002405, -3.463796, 4,
-3.166138, -3.622033, 4
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
-3.493606, -3.938507, -4, 0, -0.5, 0.5, 0.5,
-3.493606, -3.938507, -4, 1, -0.5, 0.5, 0.5,
-3.493606, -3.938507, -4, 1, 1.5, 0.5, 0.5,
-3.493606, -3.938507, -4, 0, 1.5, 0.5, 0.5,
-3.493606, -3.938507, -2, 0, -0.5, 0.5, 0.5,
-3.493606, -3.938507, -2, 1, -0.5, 0.5, 0.5,
-3.493606, -3.938507, -2, 1, 1.5, 0.5, 0.5,
-3.493606, -3.938507, -2, 0, 1.5, 0.5, 0.5,
-3.493606, -3.938507, 0, 0, -0.5, 0.5, 0.5,
-3.493606, -3.938507, 0, 1, -0.5, 0.5, 0.5,
-3.493606, -3.938507, 0, 1, 1.5, 0.5, 0.5,
-3.493606, -3.938507, 0, 0, 1.5, 0.5, 0.5,
-3.493606, -3.938507, 2, 0, -0.5, 0.5, 0.5,
-3.493606, -3.938507, 2, 1, -0.5, 0.5, 0.5,
-3.493606, -3.938507, 2, 1, 1.5, 0.5, 0.5,
-3.493606, -3.938507, 2, 0, 1.5, 0.5, 0.5,
-3.493606, -3.938507, 4, 0, -0.5, 0.5, 0.5,
-3.493606, -3.938507, 4, 1, -0.5, 0.5, 0.5,
-3.493606, -3.938507, 4, 1, 1.5, 0.5, 0.5,
-3.493606, -3.938507, 4, 0, 1.5, 0.5, 0.5
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
-3.002405, -3.463796, -5.200407,
-3.002405, 2.865687, -5.200407,
-3.002405, -3.463796, 5.453316,
-3.002405, 2.865687, 5.453316,
-3.002405, -3.463796, -5.200407,
-3.002405, -3.463796, 5.453316,
-3.002405, 2.865687, -5.200407,
-3.002405, 2.865687, 5.453316,
-3.002405, -3.463796, -5.200407,
3.546943, -3.463796, -5.200407,
-3.002405, -3.463796, 5.453316,
3.546943, -3.463796, 5.453316,
-3.002405, 2.865687, -5.200407,
3.546943, 2.865687, -5.200407,
-3.002405, 2.865687, 5.453316,
3.546943, 2.865687, 5.453316,
3.546943, -3.463796, -5.200407,
3.546943, 2.865687, -5.200407,
3.546943, -3.463796, 5.453316,
3.546943, 2.865687, 5.453316,
3.546943, -3.463796, -5.200407,
3.546943, -3.463796, 5.453316,
3.546943, 2.865687, -5.200407,
3.546943, 2.865687, 5.453316
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
var radius = 7.484459;
var distance = 33.29921;
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
mvMatrix.translate( -0.2722694, 0.2990545, -0.1264546 );
mvMatrix.scale( 1.235595, 1.278516, 0.7595791 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.29921);
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
Thiophanate<-read.table("Thiophanate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Thiophanate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Thiophanate' not found
```

```r
y<-Thiophanate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Thiophanate' not found
```

```r
z<-Thiophanate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Thiophanate' not found
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
-2.907026, 1.108581, -1.606593, 0, 0, 1, 1, 1,
-2.793549, -0.2052656, -3.132524, 1, 0, 0, 1, 1,
-2.677319, -0.4150003, -0.9263385, 1, 0, 0, 1, 1,
-2.573471, 1.464303, -0.7125782, 1, 0, 0, 1, 1,
-2.468665, -0.7556383, -3.473375, 1, 0, 0, 1, 1,
-2.447474, -0.0110278, -1.789873, 1, 0, 0, 1, 1,
-2.405385, 0.0569969, -2.407737, 0, 0, 0, 1, 1,
-2.379439, 0.2350338, -2.717769, 0, 0, 0, 1, 1,
-2.309026, 1.621907, -1.027345, 0, 0, 0, 1, 1,
-2.294092, 0.672312, -0.2392422, 0, 0, 0, 1, 1,
-2.221734, -3.371619, -3.469004, 0, 0, 0, 1, 1,
-2.147684, 0.5058683, -0.2554709, 0, 0, 0, 1, 1,
-2.133137, -0.8944959, -2.976635, 0, 0, 0, 1, 1,
-2.117067, -0.8280482, -1.519565, 1, 1, 1, 1, 1,
-2.038686, 0.9878411, -1.910155, 1, 1, 1, 1, 1,
-2.031712, 0.3774865, -0.9397536, 1, 1, 1, 1, 1,
-2.028549, -0.166441, -3.146484, 1, 1, 1, 1, 1,
-2.020729, -0.6963444, -2.907357, 1, 1, 1, 1, 1,
-2.008546, -1.001129, -1.528654, 1, 1, 1, 1, 1,
-1.977097, -0.4082516, -1.905001, 1, 1, 1, 1, 1,
-1.965391, -1.081412, -3.622323, 1, 1, 1, 1, 1,
-1.917377, -0.8961977, -1.023519, 1, 1, 1, 1, 1,
-1.916426, -0.3685354, 0.1174616, 1, 1, 1, 1, 1,
-1.911529, -0.5172243, -2.460624, 1, 1, 1, 1, 1,
-1.88069, 0.7709398, -2.168762, 1, 1, 1, 1, 1,
-1.838634, 0.8804711, -2.145042, 1, 1, 1, 1, 1,
-1.809161, 0.2327434, -1.002597, 1, 1, 1, 1, 1,
-1.789396, 0.6620259, -0.5055102, 1, 1, 1, 1, 1,
-1.7719, 0.9363864, -0.3718485, 0, 0, 1, 1, 1,
-1.763006, -0.3628318, -2.035516, 1, 0, 0, 1, 1,
-1.757693, 0.1479116, -2.607944, 1, 0, 0, 1, 1,
-1.756026, -1.403219, -2.272567, 1, 0, 0, 1, 1,
-1.743736, -0.7001941, -1.487958, 1, 0, 0, 1, 1,
-1.742985, -0.1821765, -1.664031, 1, 0, 0, 1, 1,
-1.741577, 0.6687045, -2.01565, 0, 0, 0, 1, 1,
-1.73543, -1.968089, -3.099745, 0, 0, 0, 1, 1,
-1.702814, 1.458048, -0.4484164, 0, 0, 0, 1, 1,
-1.695151, -0.513403, -2.40538, 0, 0, 0, 1, 1,
-1.695066, 0.2842511, -1.231954, 0, 0, 0, 1, 1,
-1.686125, -2.195685, -3.256333, 0, 0, 0, 1, 1,
-1.674406, 0.9746686, -1.62125, 0, 0, 0, 1, 1,
-1.658981, -0.123228, -0.2877916, 1, 1, 1, 1, 1,
-1.637176, -0.3116208, -1.925719, 1, 1, 1, 1, 1,
-1.635758, -0.880565, -1.497593, 1, 1, 1, 1, 1,
-1.635542, 1.827695, -0.213934, 1, 1, 1, 1, 1,
-1.628616, -2.277554, -2.521207, 1, 1, 1, 1, 1,
-1.619883, 0.3141676, -1.415142, 1, 1, 1, 1, 1,
-1.616942, 1.511217, -2.580626, 1, 1, 1, 1, 1,
-1.612176, 0.5139115, -0.8396783, 1, 1, 1, 1, 1,
-1.582168, 0.2310081, -1.155699, 1, 1, 1, 1, 1,
-1.576688, -0.1739538, -1.530745, 1, 1, 1, 1, 1,
-1.57355, 1.126476, 0.1720656, 1, 1, 1, 1, 1,
-1.571638, 0.8562123, 0.3156652, 1, 1, 1, 1, 1,
-1.544454, 1.332484, -0.8187774, 1, 1, 1, 1, 1,
-1.544454, -1.652573, -5.045255, 1, 1, 1, 1, 1,
-1.535012, 0.1235453, -2.402693, 1, 1, 1, 1, 1,
-1.524185, -0.4991001, -2.16482, 0, 0, 1, 1, 1,
-1.518729, 1.619626, -0.3271216, 1, 0, 0, 1, 1,
-1.502031, -0.7930914, -2.028639, 1, 0, 0, 1, 1,
-1.499801, -2.149551, -3.723749, 1, 0, 0, 1, 1,
-1.493952, 0.7937625, -2.146248, 1, 0, 0, 1, 1,
-1.483785, 1.356761, -0.5793776, 1, 0, 0, 1, 1,
-1.483773, 0.6217432, 1.522403, 0, 0, 0, 1, 1,
-1.483112, -1.263825, -4.019981, 0, 0, 0, 1, 1,
-1.47828, 0.4889827, 0.8883405, 0, 0, 0, 1, 1,
-1.468201, -1.612468, -1.763948, 0, 0, 0, 1, 1,
-1.452464, -0.8921152, -2.097376, 0, 0, 0, 1, 1,
-1.450686, -0.4078307, -0.8885008, 0, 0, 0, 1, 1,
-1.440546, 1.298155, -1.493672, 0, 0, 0, 1, 1,
-1.435923, 0.6457238, -0.7383122, 1, 1, 1, 1, 1,
-1.416982, 1.580181, -0.4719043, 1, 1, 1, 1, 1,
-1.415916, 0.5322821, -0.04632077, 1, 1, 1, 1, 1,
-1.403243, -0.3126808, -1.570719, 1, 1, 1, 1, 1,
-1.403013, 1.653505, -1.352916, 1, 1, 1, 1, 1,
-1.399428, -0.9851419, -2.836286, 1, 1, 1, 1, 1,
-1.399245, -0.4886483, -1.187427, 1, 1, 1, 1, 1,
-1.368454, -0.7912251, -2.324245, 1, 1, 1, 1, 1,
-1.368011, -0.7849782, -1.678468, 1, 1, 1, 1, 1,
-1.358479, -0.08824929, 0.5441818, 1, 1, 1, 1, 1,
-1.345404, 0.08107953, 0.1778436, 1, 1, 1, 1, 1,
-1.343196, 0.2970756, -1.879059, 1, 1, 1, 1, 1,
-1.343095, -1.604732, -3.627189, 1, 1, 1, 1, 1,
-1.342271, -1.06633, -1.85497, 1, 1, 1, 1, 1,
-1.34195, 0.6678765, -1.709544, 1, 1, 1, 1, 1,
-1.339634, -0.4123662, -2.253685, 0, 0, 1, 1, 1,
-1.336132, -1.813267, -2.009359, 1, 0, 0, 1, 1,
-1.334135, 0.5556696, -2.56339, 1, 0, 0, 1, 1,
-1.31913, -0.3738978, -2.654426, 1, 0, 0, 1, 1,
-1.313089, -1.838878, -2.441481, 1, 0, 0, 1, 1,
-1.299945, 1.204332, -1.110871, 1, 0, 0, 1, 1,
-1.299435, -1.043748, -0.6482841, 0, 0, 0, 1, 1,
-1.285423, 0.1642893, -1.141883, 0, 0, 0, 1, 1,
-1.279183, 1.237353, -0.9090583, 0, 0, 0, 1, 1,
-1.268812, -2.81704, -2.45712, 0, 0, 0, 1, 1,
-1.267657, -0.1675904, -1.658404, 0, 0, 0, 1, 1,
-1.260107, -0.1919548, -0.7314371, 0, 0, 0, 1, 1,
-1.257773, 0.5632607, -0.8461704, 0, 0, 0, 1, 1,
-1.244093, 0.5962057, -2.858663, 1, 1, 1, 1, 1,
-1.23715, -0.4294218, -0.8941673, 1, 1, 1, 1, 1,
-1.230996, 0.3671393, -2.385957, 1, 1, 1, 1, 1,
-1.222802, 0.6322179, -0.8478301, 1, 1, 1, 1, 1,
-1.221236, -0.06262266, -3.154549, 1, 1, 1, 1, 1,
-1.219694, -0.8716689, -4.140936, 1, 1, 1, 1, 1,
-1.207622, -0.4876935, -1.640005, 1, 1, 1, 1, 1,
-1.203116, 0.2606331, 1.254373, 1, 1, 1, 1, 1,
-1.202082, 0.3410527, -1.440886, 1, 1, 1, 1, 1,
-1.201723, 2.397238, 0.4947801, 1, 1, 1, 1, 1,
-1.195377, 0.3555399, -1.311221, 1, 1, 1, 1, 1,
-1.194196, -1.179612, -1.50446, 1, 1, 1, 1, 1,
-1.181919, -0.349157, -3.347442, 1, 1, 1, 1, 1,
-1.164513, -0.3891919, -1.303942, 1, 1, 1, 1, 1,
-1.161395, 0.2439588, -0.7043555, 1, 1, 1, 1, 1,
-1.148814, 0.2054373, -3.215049, 0, 0, 1, 1, 1,
-1.148126, -0.7482957, -2.220849, 1, 0, 0, 1, 1,
-1.144115, -0.6218171, -1.854436, 1, 0, 0, 1, 1,
-1.139337, -0.4481326, -2.408696, 1, 0, 0, 1, 1,
-1.135752, -0.2164773, -2.636471, 1, 0, 0, 1, 1,
-1.124382, -0.7145991, -2.087132, 1, 0, 0, 1, 1,
-1.122941, -0.120882, -1.411062, 0, 0, 0, 1, 1,
-1.118482, -0.6631014, -1.667199, 0, 0, 0, 1, 1,
-1.115623, 0.5261809, -2.176231, 0, 0, 0, 1, 1,
-1.103805, -0.1710977, -1.74801, 0, 0, 0, 1, 1,
-1.102627, 0.4466193, -0.1856594, 0, 0, 0, 1, 1,
-1.098389, 0.1621177, -0.2509415, 0, 0, 0, 1, 1,
-1.094966, 0.4984075, -3.209699, 0, 0, 0, 1, 1,
-1.087033, -0.7177907, -3.632942, 1, 1, 1, 1, 1,
-1.076138, 0.680469, -2.398155, 1, 1, 1, 1, 1,
-1.065603, -0.6006138, -1.176821, 1, 1, 1, 1, 1,
-1.058922, 0.247007, -2.593037, 1, 1, 1, 1, 1,
-1.044628, 0.09157022, 0.3351967, 1, 1, 1, 1, 1,
-1.0435, -0.7745085, -2.847963, 1, 1, 1, 1, 1,
-1.040916, -1.654465, -3.109715, 1, 1, 1, 1, 1,
-1.04015, 0.6033165, -1.384583, 1, 1, 1, 1, 1,
-1.03639, -1.42591, -0.792634, 1, 1, 1, 1, 1,
-1.034412, 0.01018434, -1.334987, 1, 1, 1, 1, 1,
-1.034003, -1.25545, -2.252178, 1, 1, 1, 1, 1,
-1.030213, -1.57894, -2.569697, 1, 1, 1, 1, 1,
-1.029989, -0.715854, -1.901966, 1, 1, 1, 1, 1,
-1.024278, -0.4166965, -1.751696, 1, 1, 1, 1, 1,
-1.022907, -0.1445325, -2.205617, 1, 1, 1, 1, 1,
-1.021487, 0.4488864, -1.324126, 0, 0, 1, 1, 1,
-1.019016, 0.3078517, -2.666422, 1, 0, 0, 1, 1,
-1.01783, 1.467218, 0.05418626, 1, 0, 0, 1, 1,
-1.016246, 0.3805999, -1.098759, 1, 0, 0, 1, 1,
-1.007239, 0.6412613, 0.1948715, 1, 0, 0, 1, 1,
-1.000333, -0.9974446, -3.578472, 1, 0, 0, 1, 1,
-0.9980072, 0.7447848, -1.479936, 0, 0, 0, 1, 1,
-0.9974192, 1.363671, -0.7854461, 0, 0, 0, 1, 1,
-0.9899455, -0.3213128, -1.112086, 0, 0, 0, 1, 1,
-0.9849828, -1.576526, -3.277032, 0, 0, 0, 1, 1,
-0.984841, 1.005078, -1.164835, 0, 0, 0, 1, 1,
-0.9844261, 0.4823491, -1.18757, 0, 0, 0, 1, 1,
-0.9775499, 0.9990652, -0.307074, 0, 0, 0, 1, 1,
-0.9739224, -1.446756, -0.5164053, 1, 1, 1, 1, 1,
-0.9572165, -0.2298448, -1.861487, 1, 1, 1, 1, 1,
-0.95571, -0.373482, -2.53903, 1, 1, 1, 1, 1,
-0.9462197, -0.8255801, -4.312285, 1, 1, 1, 1, 1,
-0.9389691, 0.5780713, -1.555295, 1, 1, 1, 1, 1,
-0.9307989, -0.9366452, -3.289092, 1, 1, 1, 1, 1,
-0.9260002, -0.7566717, -2.145598, 1, 1, 1, 1, 1,
-0.9104854, -1.06748, -2.482134, 1, 1, 1, 1, 1,
-0.9076794, 0.4902097, -1.014166, 1, 1, 1, 1, 1,
-0.9042114, 2.068654, 0.1212512, 1, 1, 1, 1, 1,
-0.8963002, -0.9540495, -2.161996, 1, 1, 1, 1, 1,
-0.8951051, 0.6421354, -1.376086, 1, 1, 1, 1, 1,
-0.8938185, -2.332869, -0.9534953, 1, 1, 1, 1, 1,
-0.8935756, -0.4471216, -2.477872, 1, 1, 1, 1, 1,
-0.8823019, 0.4687376, -0.7721099, 1, 1, 1, 1, 1,
-0.8765233, 0.2792701, 0.4750379, 0, 0, 1, 1, 1,
-0.8758331, 2.011053, 0.5608911, 1, 0, 0, 1, 1,
-0.8684877, -0.7252215, -2.884555, 1, 0, 0, 1, 1,
-0.8660396, 0.3210083, -2.84593, 1, 0, 0, 1, 1,
-0.8656846, -0.4457289, -3.191116, 1, 0, 0, 1, 1,
-0.8648233, 1.572436, -0.8971022, 1, 0, 0, 1, 1,
-0.8616982, -0.5483847, -1.725468, 0, 0, 0, 1, 1,
-0.8608575, 1.880313, -2.656805, 0, 0, 0, 1, 1,
-0.8607236, 0.1775157, -1.40916, 0, 0, 0, 1, 1,
-0.8538985, -0.1201998, -2.40668, 0, 0, 0, 1, 1,
-0.8536702, 0.540543, -0.07654214, 0, 0, 0, 1, 1,
-0.8503414, 0.1020373, -2.053148, 0, 0, 0, 1, 1,
-0.8479524, -0.8665969, -2.889409, 0, 0, 0, 1, 1,
-0.8471293, -0.2805875, -2.470729, 1, 1, 1, 1, 1,
-0.8460335, 0.4982309, -0.8462983, 1, 1, 1, 1, 1,
-0.8440421, 1.23633, -1.162435, 1, 1, 1, 1, 1,
-0.8407915, 1.544516, -0.9906653, 1, 1, 1, 1, 1,
-0.8386238, 0.1838021, -1.197813, 1, 1, 1, 1, 1,
-0.8366168, -0.8708937, -3.283051, 1, 1, 1, 1, 1,
-0.8358235, 0.4680357, 0.4657033, 1, 1, 1, 1, 1,
-0.8321522, -0.2211163, -3.652155, 1, 1, 1, 1, 1,
-0.8220642, -0.765574, -3.65529, 1, 1, 1, 1, 1,
-0.8190076, 1.349796, -0.842091, 1, 1, 1, 1, 1,
-0.8187249, 0.2714781, -0.8526586, 1, 1, 1, 1, 1,
-0.8163162, -1.746792, -3.867537, 1, 1, 1, 1, 1,
-0.8087962, 0.2293397, -0.4712878, 1, 1, 1, 1, 1,
-0.7938457, -0.198682, -2.396638, 1, 1, 1, 1, 1,
-0.7933679, 1.382337, 0.5907388, 1, 1, 1, 1, 1,
-0.7909655, 0.2860751, -0.7111765, 0, 0, 1, 1, 1,
-0.7899144, -0.9687327, -4.567107, 1, 0, 0, 1, 1,
-0.7892928, -0.2723164, -1.493471, 1, 0, 0, 1, 1,
-0.7879637, -1.145074, -2.506577, 1, 0, 0, 1, 1,
-0.787308, -0.5055596, -3.384238, 1, 0, 0, 1, 1,
-0.7826686, 0.5952135, -3.504651, 1, 0, 0, 1, 1,
-0.7790136, -0.2188344, -0.5190858, 0, 0, 0, 1, 1,
-0.7780629, 0.5514988, 0.5633426, 0, 0, 0, 1, 1,
-0.7744848, 0.4661414, -1.239565, 0, 0, 0, 1, 1,
-0.7665314, 1.959094, 0.5051327, 0, 0, 0, 1, 1,
-0.7627874, -0.9936043, -2.772197, 0, 0, 0, 1, 1,
-0.7615234, -0.992317, -4.180088, 0, 0, 0, 1, 1,
-0.7584836, -1.212517, -3.094627, 0, 0, 0, 1, 1,
-0.7575395, -0.4965151, -2.881786, 1, 1, 1, 1, 1,
-0.7531935, -0.1215448, -2.594616, 1, 1, 1, 1, 1,
-0.7484854, -1.212669, -2.412566, 1, 1, 1, 1, 1,
-0.747316, 1.282135, -0.8000931, 1, 1, 1, 1, 1,
-0.7440758, -0.4876742, -3.223755, 1, 1, 1, 1, 1,
-0.742285, -1.204068, -2.043455, 1, 1, 1, 1, 1,
-0.7363008, -1.219549, -2.56295, 1, 1, 1, 1, 1,
-0.726458, -0.5078984, -1.344963, 1, 1, 1, 1, 1,
-0.7218389, -0.09438922, -1.952255, 1, 1, 1, 1, 1,
-0.7217027, -0.7374288, -2.687379, 1, 1, 1, 1, 1,
-0.7172237, 0.00034247, -1.596007, 1, 1, 1, 1, 1,
-0.7124744, -0.2181189, -4.182665, 1, 1, 1, 1, 1,
-0.7102836, -0.2332036, -0.6637406, 1, 1, 1, 1, 1,
-0.7099435, 1.45598, -1.688141, 1, 1, 1, 1, 1,
-0.7072252, -0.1803191, -1.98209, 1, 1, 1, 1, 1,
-0.6948123, 0.6653982, -2.387125, 0, 0, 1, 1, 1,
-0.6928895, 0.7954373, -0.7269587, 1, 0, 0, 1, 1,
-0.6918287, 0.8105984, -2.894641, 1, 0, 0, 1, 1,
-0.6910356, 0.1288037, -0.4259143, 1, 0, 0, 1, 1,
-0.6906965, 0.1735747, -0.9766747, 1, 0, 0, 1, 1,
-0.688175, -1.135913, -2.543, 1, 0, 0, 1, 1,
-0.6869703, -0.7291307, -2.351032, 0, 0, 0, 1, 1,
-0.6858426, -1.134955, -3.260721, 0, 0, 0, 1, 1,
-0.6802122, 0.8015745, -2.413306, 0, 0, 0, 1, 1,
-0.6780122, 0.1932456, -1.495347, 0, 0, 0, 1, 1,
-0.6770204, 0.1882094, -1.231614, 0, 0, 0, 1, 1,
-0.672059, 0.8174204, -2.08987, 0, 0, 0, 1, 1,
-0.660776, -1.052781, -0.978512, 0, 0, 0, 1, 1,
-0.6606502, 0.2277774, -1.102704, 1, 1, 1, 1, 1,
-0.6606454, 0.316225, -0.4553987, 1, 1, 1, 1, 1,
-0.6567636, -1.061651, -3.003918, 1, 1, 1, 1, 1,
-0.6547468, -1.323959, -3.229331, 1, 1, 1, 1, 1,
-0.6447727, 0.5771065, -0.7646823, 1, 1, 1, 1, 1,
-0.6438184, -1.013036, -4.166748, 1, 1, 1, 1, 1,
-0.6369998, -0.4077953, -0.6728016, 1, 1, 1, 1, 1,
-0.6318755, -0.4024847, -1.769028, 1, 1, 1, 1, 1,
-0.6317086, 2.197953, 0.09315506, 1, 1, 1, 1, 1,
-0.6302572, -0.1478788, -1.321124, 1, 1, 1, 1, 1,
-0.6296536, 0.1557866, -2.090713, 1, 1, 1, 1, 1,
-0.6283931, -0.03706859, -3.00112, 1, 1, 1, 1, 1,
-0.6249301, 0.3451625, -0.2961292, 1, 1, 1, 1, 1,
-0.6212649, 0.4963101, -1.207543, 1, 1, 1, 1, 1,
-0.6166584, 1.407046, -2.168429, 1, 1, 1, 1, 1,
-0.613614, 0.2576959, -2.479685, 0, 0, 1, 1, 1,
-0.6101239, -1.011563, -2.243366, 1, 0, 0, 1, 1,
-0.6072733, -0.4631097, -2.184305, 1, 0, 0, 1, 1,
-0.6071568, -0.4349709, -2.424263, 1, 0, 0, 1, 1,
-0.6042421, 0.1887403, -2.257834, 1, 0, 0, 1, 1,
-0.6023922, -1.285398, -3.873422, 1, 0, 0, 1, 1,
-0.6018809, 0.764513, -0.6168571, 0, 0, 0, 1, 1,
-0.599618, 0.8320308, -0.1749214, 0, 0, 0, 1, 1,
-0.5992122, -0.6122252, -2.451293, 0, 0, 0, 1, 1,
-0.5990679, 0.09163691, -1.178413, 0, 0, 0, 1, 1,
-0.5953022, 2.182044, -0.9409851, 0, 0, 0, 1, 1,
-0.5932968, -0.4478049, -2.097089, 0, 0, 0, 1, 1,
-0.5923637, -2.138966, -2.167132, 0, 0, 0, 1, 1,
-0.5913132, 0.1098273, -1.319906, 1, 1, 1, 1, 1,
-0.5902582, -0.5485507, -2.014727, 1, 1, 1, 1, 1,
-0.5873588, 0.07428353, -1.710399, 1, 1, 1, 1, 1,
-0.5817958, -0.4754053, -0.9507406, 1, 1, 1, 1, 1,
-0.5776597, 0.396235, -0.9147968, 1, 1, 1, 1, 1,
-0.5689996, 0.2251299, -1.794455, 1, 1, 1, 1, 1,
-0.5676725, -1.099249, -4.440032, 1, 1, 1, 1, 1,
-0.5653333, -0.02534444, -1.825879, 1, 1, 1, 1, 1,
-0.5586154, 1.603612, -0.08713625, 1, 1, 1, 1, 1,
-0.5565836, 0.8247933, -0.9124982, 1, 1, 1, 1, 1,
-0.5558435, 2.561427, -0.03941686, 1, 1, 1, 1, 1,
-0.5470956, -0.8823158, -3.878411, 1, 1, 1, 1, 1,
-0.5306439, 0.6515608, 0.0611131, 1, 1, 1, 1, 1,
-0.5288991, 0.1803335, -0.1561629, 1, 1, 1, 1, 1,
-0.5247418, 0.009901852, -1.778955, 1, 1, 1, 1, 1,
-0.5234392, 0.9570917, 1.191916, 0, 0, 1, 1, 1,
-0.5215904, 1.990273, 0.1967559, 1, 0, 0, 1, 1,
-0.5197303, 0.9740155, 1.30859, 1, 0, 0, 1, 1,
-0.5180495, -0.4270521, -3.000518, 1, 0, 0, 1, 1,
-0.5172037, 0.4453065, -1.214166, 1, 0, 0, 1, 1,
-0.5149017, 1.124804, -1.048387, 1, 0, 0, 1, 1,
-0.5144178, 0.2412266, -0.9026034, 0, 0, 0, 1, 1,
-0.5120016, 0.7761832, 0.4807113, 0, 0, 0, 1, 1,
-0.5092157, -0.7878563, -1.97799, 0, 0, 0, 1, 1,
-0.5071082, 1.35386, 0.6633402, 0, 0, 0, 1, 1,
-0.5056075, -0.9031268, -1.356529, 0, 0, 0, 1, 1,
-0.5028633, 0.05165609, -2.867533, 0, 0, 0, 1, 1,
-0.5011245, 0.7887144, -0.6382017, 0, 0, 0, 1, 1,
-0.4958516, 0.4044394, 0.5488057, 1, 1, 1, 1, 1,
-0.4933259, 0.02357136, -5.040029, 1, 1, 1, 1, 1,
-0.4913536, -2.466062, -3.675136, 1, 1, 1, 1, 1,
-0.4878685, -0.5921039, -3.132904, 1, 1, 1, 1, 1,
-0.4876762, 0.8077389, -0.4751809, 1, 1, 1, 1, 1,
-0.4853421, 1.031764, -1.784495, 1, 1, 1, 1, 1,
-0.4839179, -0.5103524, -1.836946, 1, 1, 1, 1, 1,
-0.4828354, -0.8363884, -2.179426, 1, 1, 1, 1, 1,
-0.4827094, 1.031827, -0.8198324, 1, 1, 1, 1, 1,
-0.4805627, 0.7392248, -1.418552, 1, 1, 1, 1, 1,
-0.4791794, 0.8431085, -2.314372, 1, 1, 1, 1, 1,
-0.4772124, -0.4479311, -2.217446, 1, 1, 1, 1, 1,
-0.4767546, 0.4795162, 0.5239698, 1, 1, 1, 1, 1,
-0.4764844, 0.1266938, -2.388509, 1, 1, 1, 1, 1,
-0.4716659, -0.2862584, -2.124632, 1, 1, 1, 1, 1,
-0.4708779, -0.08525271, -1.195387, 0, 0, 1, 1, 1,
-0.4663974, 0.5640823, -2.056045, 1, 0, 0, 1, 1,
-0.4623412, -0.8346841, -2.727928, 1, 0, 0, 1, 1,
-0.4615647, -0.8063926, -1.986637, 1, 0, 0, 1, 1,
-0.4604388, 1.583907, -1.073943, 1, 0, 0, 1, 1,
-0.4582722, -0.9434965, -3.250262, 1, 0, 0, 1, 1,
-0.4568139, 0.3895213, -1.288207, 0, 0, 0, 1, 1,
-0.4536648, -1.357766, -2.669473, 0, 0, 0, 1, 1,
-0.4525385, 0.8969849, -1.333709, 0, 0, 0, 1, 1,
-0.4502535, -0.5770991, -4.369723, 0, 0, 0, 1, 1,
-0.4460295, -0.6528271, -1.431399, 0, 0, 0, 1, 1,
-0.4438853, -0.1842704, -1.614664, 0, 0, 0, 1, 1,
-0.442774, -0.988506, -3.217002, 0, 0, 0, 1, 1,
-0.441971, 0.9099699, 0.63538, 1, 1, 1, 1, 1,
-0.437677, -0.5946596, -2.387326, 1, 1, 1, 1, 1,
-0.437258, -0.3555011, -2.872523, 1, 1, 1, 1, 1,
-0.4366099, -0.2835808, -2.625552, 1, 1, 1, 1, 1,
-0.4359267, -0.5892552, -2.949997, 1, 1, 1, 1, 1,
-0.4298736, -0.6471937, -2.105928, 1, 1, 1, 1, 1,
-0.4285042, 0.9533415, -2.442212, 1, 1, 1, 1, 1,
-0.4278178, -0.03992517, -3.301533, 1, 1, 1, 1, 1,
-0.4268735, -0.603696, -2.112364, 1, 1, 1, 1, 1,
-0.4242525, -0.5916974, -4.411286, 1, 1, 1, 1, 1,
-0.4176033, 1.81722, -1.716633, 1, 1, 1, 1, 1,
-0.4164016, 2.77351, -0.2051411, 1, 1, 1, 1, 1,
-0.4153073, -1.127909, -2.812503, 1, 1, 1, 1, 1,
-0.413529, 0.1893587, -1.781272, 1, 1, 1, 1, 1,
-0.4071249, -1.014662, -3.399896, 1, 1, 1, 1, 1,
-0.4067433, 0.5104492, -2.829503, 0, 0, 1, 1, 1,
-0.406235, 1.692942, -0.2688493, 1, 0, 0, 1, 1,
-0.4036417, -1.427776, -4.154387, 1, 0, 0, 1, 1,
-0.4001411, 0.666025, 0.1124545, 1, 0, 0, 1, 1,
-0.3995803, 0.3881926, -2.219152, 1, 0, 0, 1, 1,
-0.395831, -0.4081031, -1.987157, 1, 0, 0, 1, 1,
-0.3895848, 0.1873958, -2.780862, 0, 0, 0, 1, 1,
-0.3849345, 1.161956, 0.2996745, 0, 0, 0, 1, 1,
-0.3844065, 0.9439798, 0.4905099, 0, 0, 0, 1, 1,
-0.3842292, 1.347157, 0.4929215, 0, 0, 0, 1, 1,
-0.3726647, 0.181201, 0.6822535, 0, 0, 0, 1, 1,
-0.3712951, -0.5660146, -2.811386, 0, 0, 0, 1, 1,
-0.3681774, 0.5783638, 0.4471611, 0, 0, 0, 1, 1,
-0.3647946, 0.6690479, -0.2070009, 1, 1, 1, 1, 1,
-0.3647585, -0.4506375, -2.856434, 1, 1, 1, 1, 1,
-0.3645237, -1.608287, -4.050023, 1, 1, 1, 1, 1,
-0.363486, -0.2808501, -1.642094, 1, 1, 1, 1, 1,
-0.3632665, -0.2414379, -2.218935, 1, 1, 1, 1, 1,
-0.363204, 0.2404728, -1.029812, 1, 1, 1, 1, 1,
-0.3561033, 0.7513059, 0.7869052, 1, 1, 1, 1, 1,
-0.3547474, 0.3074791, -1.414602, 1, 1, 1, 1, 1,
-0.3502774, 0.9882542, 1.238747, 1, 1, 1, 1, 1,
-0.3452663, -0.159502, -2.274649, 1, 1, 1, 1, 1,
-0.3423576, 2.332417, -1.569503, 1, 1, 1, 1, 1,
-0.3397913, -1.36524, -1.887669, 1, 1, 1, 1, 1,
-0.3370876, 0.6135874, -0.9786733, 1, 1, 1, 1, 1,
-0.3369985, 1.71929, 0.640496, 1, 1, 1, 1, 1,
-0.3344721, 1.131157, -1.532052, 1, 1, 1, 1, 1,
-0.3333739, -0.817974, -3.168264, 0, 0, 1, 1, 1,
-0.3298855, -0.1644008, 0.09395465, 1, 0, 0, 1, 1,
-0.3266569, -0.1619834, -3.708521, 1, 0, 0, 1, 1,
-0.3257654, 1.277779, 1.580019, 1, 0, 0, 1, 1,
-0.3249527, -0.06817218, -2.150635, 1, 0, 0, 1, 1,
-0.323036, 0.6759721, 0.1167355, 1, 0, 0, 1, 1,
-0.3217473, 0.8302262, 0.4592427, 0, 0, 0, 1, 1,
-0.3177246, -0.3452408, -0.2739927, 0, 0, 0, 1, 1,
-0.3171341, 1.337759, 0.003498056, 0, 0, 0, 1, 1,
-0.3164924, 0.1543482, 0.2541352, 0, 0, 0, 1, 1,
-0.3163528, -1.278482, -3.336118, 0, 0, 0, 1, 1,
-0.3160866, -1.091825, -2.151643, 0, 0, 0, 1, 1,
-0.3160052, 0.5058879, -0.3901785, 0, 0, 0, 1, 1,
-0.3140854, 0.3394857, 1.40828, 1, 1, 1, 1, 1,
-0.3137844, -0.4714722, -2.204118, 1, 1, 1, 1, 1,
-0.3131279, 0.3737563, -0.2529274, 1, 1, 1, 1, 1,
-0.3068469, 0.366838, -0.6938916, 1, 1, 1, 1, 1,
-0.3058003, -0.9041584, -2.41691, 1, 1, 1, 1, 1,
-0.3027475, -0.3312219, -3.911155, 1, 1, 1, 1, 1,
-0.3018416, 0.3391034, 0.1646776, 1, 1, 1, 1, 1,
-0.3016106, 0.5075294, -1.931127, 1, 1, 1, 1, 1,
-0.3014397, 0.7233217, 0.5393578, 1, 1, 1, 1, 1,
-0.3005861, -0.4986729, -2.343114, 1, 1, 1, 1, 1,
-0.2999272, 0.6496135, -0.8837555, 1, 1, 1, 1, 1,
-0.2958404, -2.386258, -1.834277, 1, 1, 1, 1, 1,
-0.2914956, 0.8806924, 0.06113102, 1, 1, 1, 1, 1,
-0.2908824, -1.570704, -2.499899, 1, 1, 1, 1, 1,
-0.2902243, 1.342439, -2.634665, 1, 1, 1, 1, 1,
-0.2873341, 0.616386, -1.355673, 0, 0, 1, 1, 1,
-0.2850765, 0.8610317, -0.8401114, 1, 0, 0, 1, 1,
-0.281459, 0.425948, -0.3578456, 1, 0, 0, 1, 1,
-0.2807608, 1.395921, 0.2819273, 1, 0, 0, 1, 1,
-0.2750611, -0.6023647, -2.51355, 1, 0, 0, 1, 1,
-0.2709198, -0.4732815, -2.80828, 1, 0, 0, 1, 1,
-0.2686164, -1.822915, -2.980623, 0, 0, 0, 1, 1,
-0.2685015, 0.9904709, -1.793426, 0, 0, 0, 1, 1,
-0.2648349, 0.4565887, -0.1694674, 0, 0, 0, 1, 1,
-0.2643806, -1.63713, -3.099124, 0, 0, 0, 1, 1,
-0.2619109, 0.7880984, -0.223874, 0, 0, 0, 1, 1,
-0.2599785, 0.9064385, 0.5579931, 0, 0, 0, 1, 1,
-0.2555365, 0.5125872, 0.6274976, 0, 0, 0, 1, 1,
-0.251406, 0.0600236, -3.01654, 1, 1, 1, 1, 1,
-0.2492044, -0.2286721, -2.274892, 1, 1, 1, 1, 1,
-0.2462022, 1.796388, 1.334728, 1, 1, 1, 1, 1,
-0.2412436, 1.218753, -0.2873224, 1, 1, 1, 1, 1,
-0.2359316, -0.8466914, -2.241724, 1, 1, 1, 1, 1,
-0.233362, -0.2373917, -1.394766, 1, 1, 1, 1, 1,
-0.2332827, -1.217375, -4.019606, 1, 1, 1, 1, 1,
-0.2280926, 0.1293979, 0.0354532, 1, 1, 1, 1, 1,
-0.2271011, 0.8436003, 0.9124067, 1, 1, 1, 1, 1,
-0.2258682, -1.028689, -2.594359, 1, 1, 1, 1, 1,
-0.2225658, -1.504375, -2.6659, 1, 1, 1, 1, 1,
-0.218076, 0.3279674, 0.4538029, 1, 1, 1, 1, 1,
-0.2077657, 0.8682998, -0.7678158, 1, 1, 1, 1, 1,
-0.2076245, 1.864467, -0.1891884, 1, 1, 1, 1, 1,
-0.2063887, 0.05328731, -0.8812969, 1, 1, 1, 1, 1,
-0.2037466, -1.286638, -3.234574, 0, 0, 1, 1, 1,
-0.2037071, -0.5586304, -3.410494, 1, 0, 0, 1, 1,
-0.201264, 0.3517547, -0.3693624, 1, 0, 0, 1, 1,
-0.1993562, 0.7140598, -0.3079974, 1, 0, 0, 1, 1,
-0.1990757, -0.726094, -3.665622, 1, 0, 0, 1, 1,
-0.197098, -0.6041197, -4.475668, 1, 0, 0, 1, 1,
-0.1966923, -0.7255012, -2.073234, 0, 0, 0, 1, 1,
-0.1921482, -0.04699551, -2.842789, 0, 0, 0, 1, 1,
-0.1858476, -0.3497153, -2.834519, 0, 0, 0, 1, 1,
-0.1720091, -2.12247, -1.924618, 0, 0, 0, 1, 1,
-0.1718602, -0.9296764, -3.079731, 0, 0, 0, 1, 1,
-0.1685641, 0.01135426, -3.741868, 0, 0, 0, 1, 1,
-0.1685338, -1.324202, -4.4426, 0, 0, 0, 1, 1,
-0.1681203, 1.108753, 0.4774124, 1, 1, 1, 1, 1,
-0.1676284, -0.7106368, -2.40541, 1, 1, 1, 1, 1,
-0.1672136, 0.08113749, -1.870361, 1, 1, 1, 1, 1,
-0.1622737, -1.017233, -3.185891, 1, 1, 1, 1, 1,
-0.1613093, 1.606628, -1.249975, 1, 1, 1, 1, 1,
-0.1596772, -0.283866, -3.1397, 1, 1, 1, 1, 1,
-0.1557176, 0.6296973, 0.177409, 1, 1, 1, 1, 1,
-0.1531984, -0.0002596215, -1.718313, 1, 1, 1, 1, 1,
-0.1486484, -0.977706, -1.768373, 1, 1, 1, 1, 1,
-0.1438415, 1.63509, 0.1300074, 1, 1, 1, 1, 1,
-0.1409947, -0.01831015, -1.147945, 1, 1, 1, 1, 1,
-0.1355706, 0.1276611, -0.2154289, 1, 1, 1, 1, 1,
-0.1314742, -1.989398, -4.616342, 1, 1, 1, 1, 1,
-0.1274851, 1.820225, -1.699335, 1, 1, 1, 1, 1,
-0.1186981, 0.4992015, -0.9976239, 1, 1, 1, 1, 1,
-0.1166502, -1.653528, -4.837126, 0, 0, 1, 1, 1,
-0.115964, 0.5447948, -1.297625, 1, 0, 0, 1, 1,
-0.1154996, -0.4382717, -3.086115, 1, 0, 0, 1, 1,
-0.1147795, 0.4419518, -0.3539414, 1, 0, 0, 1, 1,
-0.1118894, -1.289822, -2.60309, 1, 0, 0, 1, 1,
-0.1066059, -0.3678656, -2.150453, 1, 0, 0, 1, 1,
-0.1058347, -0.2335345, -4.067465, 0, 0, 0, 1, 1,
-0.1054999, 0.1267382, 0.2777798, 0, 0, 0, 1, 1,
-0.1051849, -1.14922, -4.358812, 0, 0, 0, 1, 1,
-0.1038306, -0.2746337, -3.648675, 0, 0, 0, 1, 1,
-0.1033505, -0.3052597, -3.035938, 0, 0, 0, 1, 1,
-0.08910549, -0.9111282, -3.972612, 0, 0, 0, 1, 1,
-0.08443896, -0.7003095, -3.751734, 0, 0, 0, 1, 1,
-0.08315232, -0.1914401, -1.524178, 1, 1, 1, 1, 1,
-0.0827577, 1.30549, -0.04217508, 1, 1, 1, 1, 1,
-0.07975101, -0.336747, -3.162216, 1, 1, 1, 1, 1,
-0.07874215, 0.7552779, -0.7695302, 1, 1, 1, 1, 1,
-0.07120334, -0.05443757, -1.38676, 1, 1, 1, 1, 1,
-0.068753, 1.237342, -0.190197, 1, 1, 1, 1, 1,
-0.05801916, 0.6711977, 1.078843, 1, 1, 1, 1, 1,
-0.05519984, -0.5360164, -3.036149, 1, 1, 1, 1, 1,
-0.04986305, -1.144493, -3.099161, 1, 1, 1, 1, 1,
-0.04864167, -0.03471334, -2.182823, 1, 1, 1, 1, 1,
-0.04703411, -0.6573246, -2.194829, 1, 1, 1, 1, 1,
-0.04215964, -0.2843991, -2.593321, 1, 1, 1, 1, 1,
-0.04190145, -1.107127, -4.038774, 1, 1, 1, 1, 1,
-0.04041191, 1.554173, 1.728822, 1, 1, 1, 1, 1,
-0.03953865, -1.100012, -1.333129, 1, 1, 1, 1, 1,
-0.03937744, -0.8393492, -3.62875, 0, 0, 1, 1, 1,
-0.03700611, -1.484543, -3.936547, 1, 0, 0, 1, 1,
-0.03358571, -0.2047392, -2.873679, 1, 0, 0, 1, 1,
-0.03259996, 0.4903671, -0.0876093, 1, 0, 0, 1, 1,
-0.03219432, 0.8790399, 0.8515638, 1, 0, 0, 1, 1,
-0.0287034, 1.328488, -0.09458052, 1, 0, 0, 1, 1,
-0.01210099, 0.21812, -0.4967754, 0, 0, 0, 1, 1,
-0.0117964, 0.2648073, 1.479542, 0, 0, 0, 1, 1,
-0.0116045, 0.6266105, -0.5455206, 0, 0, 0, 1, 1,
-0.00136142, 0.02990236, -0.4602897, 0, 0, 0, 1, 1,
0.006653883, -1.529038, 3.771516, 0, 0, 0, 1, 1,
0.01151359, -0.3039722, 3.733509, 0, 0, 0, 1, 1,
0.01937666, 0.02251583, 1.003571, 0, 0, 0, 1, 1,
0.0232471, -0.3486837, 2.862692, 1, 1, 1, 1, 1,
0.0238773, -0.3518354, 2.505959, 1, 1, 1, 1, 1,
0.02566432, 1.071775, -1.300048, 1, 1, 1, 1, 1,
0.02771141, 1.290063, 0.758948, 1, 1, 1, 1, 1,
0.03266352, -0.115839, 4.534196, 1, 1, 1, 1, 1,
0.0359279, -0.9985332, 3.15364, 1, 1, 1, 1, 1,
0.03693039, 0.3370314, -0.3314864, 1, 1, 1, 1, 1,
0.03927758, 0.3389125, 0.1050768, 1, 1, 1, 1, 1,
0.048779, 1.69267, -0.6230648, 1, 1, 1, 1, 1,
0.05082556, -0.3515883, 1.02979, 1, 1, 1, 1, 1,
0.05269153, 0.02754149, 1.537901, 1, 1, 1, 1, 1,
0.05459807, -0.3133419, 0.9987713, 1, 1, 1, 1, 1,
0.05643187, -0.8125477, 3.457201, 1, 1, 1, 1, 1,
0.06320933, -2.177077, 2.100592, 1, 1, 1, 1, 1,
0.06628285, 1.001682, -0.3901826, 1, 1, 1, 1, 1,
0.07235518, 0.2971625, 0.1171137, 0, 0, 1, 1, 1,
0.07275704, 0.5969512, 0.5191212, 1, 0, 0, 1, 1,
0.07330091, 0.2002985, 0.1237008, 1, 0, 0, 1, 1,
0.07415771, 0.8114578, 0.1320078, 1, 0, 0, 1, 1,
0.07500345, 1.397466, 0.4709421, 1, 0, 0, 1, 1,
0.07760821, -0.3827458, 3.464206, 1, 0, 0, 1, 1,
0.08255295, 1.439437, -0.7957767, 0, 0, 0, 1, 1,
0.08432925, -0.1236614, 2.048017, 0, 0, 0, 1, 1,
0.08512606, -0.6718103, 5.298164, 0, 0, 0, 1, 1,
0.08968819, 0.442789, 1.212148, 0, 0, 0, 1, 1,
0.09328391, -1.346147, 3.987781, 0, 0, 0, 1, 1,
0.0987962, -0.3037531, 0.4375995, 0, 0, 0, 1, 1,
0.09901653, -1.320543, 2.497985, 0, 0, 0, 1, 1,
0.1008743, 0.4312444, -1.042261, 1, 1, 1, 1, 1,
0.1040248, -0.1083019, 0.9304506, 1, 1, 1, 1, 1,
0.1172688, -1.471042, 0.7539964, 1, 1, 1, 1, 1,
0.1197724, -0.2900978, 2.317001, 1, 1, 1, 1, 1,
0.1245956, -0.001114519, 2.384858, 1, 1, 1, 1, 1,
0.1252153, -1.194013, 2.545659, 1, 1, 1, 1, 1,
0.1266198, 0.1029389, 0.8270817, 1, 1, 1, 1, 1,
0.1283076, -0.9191789, 3.291677, 1, 1, 1, 1, 1,
0.1366605, 0.2209701, -0.793488, 1, 1, 1, 1, 1,
0.1369861, -0.02394849, 0.4088486, 1, 1, 1, 1, 1,
0.1386343, -0.4961726, 2.548961, 1, 1, 1, 1, 1,
0.1425715, 1.802513, -0.2996881, 1, 1, 1, 1, 1,
0.1449192, -1.025159, 2.233195, 1, 1, 1, 1, 1,
0.148821, -0.3429448, 2.069658, 1, 1, 1, 1, 1,
0.1491919, -0.2069178, 3.389839, 1, 1, 1, 1, 1,
0.1516454, 0.02945022, 0.5655861, 0, 0, 1, 1, 1,
0.15319, -1.215124, 4.044314, 1, 0, 0, 1, 1,
0.1557069, -0.4535069, 2.7947, 1, 0, 0, 1, 1,
0.1581361, 1.084108, -0.2380728, 1, 0, 0, 1, 1,
0.159436, -2.301478, 0.179851, 1, 0, 0, 1, 1,
0.1669794, 0.1233278, -1.364068, 1, 0, 0, 1, 1,
0.171867, 1.874952, -0.228661, 0, 0, 0, 1, 1,
0.1723803, 0.07266255, 1.475464, 0, 0, 0, 1, 1,
0.1803724, -1.253064, 4.098781, 0, 0, 0, 1, 1,
0.1831245, 1.546706, 1.790349, 0, 0, 0, 1, 1,
0.1876882, -0.4496939, 3.38703, 0, 0, 0, 1, 1,
0.1884006, 0.3319946, 0.698041, 0, 0, 0, 1, 1,
0.1886395, 1.615988, 0.585556, 0, 0, 0, 1, 1,
0.1888806, 1.758351, 0.7977346, 1, 1, 1, 1, 1,
0.1930071, 1.264275, 0.06004578, 1, 1, 1, 1, 1,
0.2023458, -0.8760948, 3.055054, 1, 1, 1, 1, 1,
0.2023514, -0.6637527, 1.809546, 1, 1, 1, 1, 1,
0.2065695, 0.8889169, -1.960201, 1, 1, 1, 1, 1,
0.2077181, -1.301266, 1.723692, 1, 1, 1, 1, 1,
0.2079, -1.1666, 3.426633, 1, 1, 1, 1, 1,
0.2123659, 1.223501, 0.249961, 1, 1, 1, 1, 1,
0.2140497, 1.425861, 2.136203, 1, 1, 1, 1, 1,
0.2146011, 0.3400508, -1.082905, 1, 1, 1, 1, 1,
0.2149395, -0.4335926, 2.20395, 1, 1, 1, 1, 1,
0.2151936, -0.8934801, 2.475623, 1, 1, 1, 1, 1,
0.2159075, -2.053638, 2.933779, 1, 1, 1, 1, 1,
0.2161303, -0.1317027, 2.725668, 1, 1, 1, 1, 1,
0.2213403, 0.2023257, -1.302456, 1, 1, 1, 1, 1,
0.247285, -0.5916052, 3.251945, 0, 0, 1, 1, 1,
0.252316, 0.2440313, 0.4164232, 1, 0, 0, 1, 1,
0.2530299, 0.9301978, 0.4898856, 1, 0, 0, 1, 1,
0.2532091, -1.021819, 2.91071, 1, 0, 0, 1, 1,
0.2556261, 0.7353765, -0.3404023, 1, 0, 0, 1, 1,
0.2561184, 0.4612004, 1.13704, 1, 0, 0, 1, 1,
0.2595527, -0.8685862, 1.853661, 0, 0, 0, 1, 1,
0.2621782, -1.154185, 2.222503, 0, 0, 0, 1, 1,
0.2632003, -1.536566, 1.753634, 0, 0, 0, 1, 1,
0.2656724, 0.2297244, 1.151337, 0, 0, 0, 1, 1,
0.2659624, 0.5770723, -1.781158, 0, 0, 0, 1, 1,
0.2663739, -1.034651, 4.762547, 0, 0, 0, 1, 1,
0.2672084, -1.63155, 2.999312, 0, 0, 0, 1, 1,
0.274414, 1.225425, -1.037645, 1, 1, 1, 1, 1,
0.2826138, -0.3868285, 2.962138, 1, 1, 1, 1, 1,
0.2836777, 1.543709, 1.135108, 1, 1, 1, 1, 1,
0.2843061, 0.4076597, -0.2087531, 1, 1, 1, 1, 1,
0.2844275, 0.9236124, -0.8058531, 1, 1, 1, 1, 1,
0.2864279, -1.27719, 2.310028, 1, 1, 1, 1, 1,
0.2917815, -0.01184634, 1.558147, 1, 1, 1, 1, 1,
0.2926945, -0.3275307, 2.296042, 1, 1, 1, 1, 1,
0.2932965, 0.4973409, -0.4532594, 1, 1, 1, 1, 1,
0.3006687, -0.3693816, 4.069521, 1, 1, 1, 1, 1,
0.3012693, 0.5268711, 0.8049981, 1, 1, 1, 1, 1,
0.3052469, 0.152797, 0.8185319, 1, 1, 1, 1, 1,
0.3145137, 0.9072518, 1.452224, 1, 1, 1, 1, 1,
0.3155749, -1.563964, 4.932061, 1, 1, 1, 1, 1,
0.3161165, -1.377479, 3.566284, 1, 1, 1, 1, 1,
0.3183543, -0.3582301, 3.586693, 0, 0, 1, 1, 1,
0.3193023, 0.0833666, 0.6330515, 1, 0, 0, 1, 1,
0.3208629, 0.04081603, 1.636073, 1, 0, 0, 1, 1,
0.3238426, 0.3229807, 0.9042545, 1, 0, 0, 1, 1,
0.3246034, 1.320769, 1.558586, 1, 0, 0, 1, 1,
0.3310621, 0.7768853, 0.4078005, 1, 0, 0, 1, 1,
0.3333578, -0.5749738, 3.924538, 0, 0, 0, 1, 1,
0.3336437, -0.8941674, 1.844518, 0, 0, 0, 1, 1,
0.3353947, -0.4032879, 3.63359, 0, 0, 0, 1, 1,
0.3357593, 1.908082, 2.308137, 0, 0, 0, 1, 1,
0.3381968, 0.4498149, -1.842205, 0, 0, 0, 1, 1,
0.340093, 1.15245, 1.735554, 0, 0, 0, 1, 1,
0.3403766, 1.163895, 0.9258376, 0, 0, 0, 1, 1,
0.3439288, -0.7328262, 3.425244, 1, 1, 1, 1, 1,
0.3451656, 0.5359033, 1.766494, 1, 1, 1, 1, 1,
0.347097, 0.412853, 0.511113, 1, 1, 1, 1, 1,
0.3482285, -0.4659115, 3.389549, 1, 1, 1, 1, 1,
0.3565504, 0.6750152, -0.4735377, 1, 1, 1, 1, 1,
0.3581225, 2.058756, 2.031776, 1, 1, 1, 1, 1,
0.3646228, 1.244472, -1.540886, 1, 1, 1, 1, 1,
0.3657192, -1.092832, 2.492774, 1, 1, 1, 1, 1,
0.36959, 0.1481039, 2.369984, 1, 1, 1, 1, 1,
0.3809567, 1.328179, 0.4446581, 1, 1, 1, 1, 1,
0.3816126, 0.2462699, 0.2868212, 1, 1, 1, 1, 1,
0.3855149, -1.057698, 1.815676, 1, 1, 1, 1, 1,
0.3876998, -1.257191, 3.06928, 1, 1, 1, 1, 1,
0.3878834, 0.7573141, -0.4113748, 1, 1, 1, 1, 1,
0.3888884, -0.8591276, 0.1042844, 1, 1, 1, 1, 1,
0.3953778, -1.552592, 2.232195, 0, 0, 1, 1, 1,
0.401836, -1.504028, 3.544695, 1, 0, 0, 1, 1,
0.4036419, -1.946412, 3.304916, 1, 0, 0, 1, 1,
0.4039945, -0.8795844, 2.651695, 1, 0, 0, 1, 1,
0.4046467, 1.946205, 2.031249, 1, 0, 0, 1, 1,
0.4047604, 0.6657224, 0.2902236, 1, 0, 0, 1, 1,
0.4054832, 1.688775, 1.507272, 0, 0, 0, 1, 1,
0.4063954, 0.4191704, 0.7329294, 0, 0, 0, 1, 1,
0.4136139, -0.5502127, 3.133883, 0, 0, 0, 1, 1,
0.4183923, -0.4891381, 4.489542, 0, 0, 0, 1, 1,
0.4230429, 0.3284827, 1.517548, 0, 0, 0, 1, 1,
0.4255717, 0.9075934, 0.0461426, 0, 0, 0, 1, 1,
0.4259796, 0.08323218, 1.42043, 0, 0, 0, 1, 1,
0.4277402, -0.3160858, 1.885661, 1, 1, 1, 1, 1,
0.4294987, -0.2588586, 3.170445, 1, 1, 1, 1, 1,
0.4313229, 0.8770108, -0.3362075, 1, 1, 1, 1, 1,
0.4322433, -0.4614798, 0.7842606, 1, 1, 1, 1, 1,
0.4388343, -1.217719, 2.409742, 1, 1, 1, 1, 1,
0.4404935, 2.094988, 0.9631574, 1, 1, 1, 1, 1,
0.4446487, 0.2850673, 2.907876, 1, 1, 1, 1, 1,
0.4447214, 0.1176296, 0.06827653, 1, 1, 1, 1, 1,
0.4485947, -0.6771708, 1.95145, 1, 1, 1, 1, 1,
0.4530775, -1.4536, 2.800947, 1, 1, 1, 1, 1,
0.4584514, -0.5932423, 2.622063, 1, 1, 1, 1, 1,
0.4587191, 0.9912851, 0.7721758, 1, 1, 1, 1, 1,
0.4621316, 1.100928, 0.0541587, 1, 1, 1, 1, 1,
0.4675005, -0.8434035, 2.999983, 1, 1, 1, 1, 1,
0.469311, -1.512505, 3.926699, 1, 1, 1, 1, 1,
0.4713719, -0.5416147, 2.709816, 0, 0, 1, 1, 1,
0.4759758, -0.5065652, 2.628194, 1, 0, 0, 1, 1,
0.4783911, 1.022889, -0.1074253, 1, 0, 0, 1, 1,
0.4809409, -0.7473612, 1.539363, 1, 0, 0, 1, 1,
0.4820289, -1.050429, 1.547756, 1, 0, 0, 1, 1,
0.4845392, -0.3020971, 3.256733, 1, 0, 0, 1, 1,
0.486409, 0.8551522, 1.248664, 0, 0, 0, 1, 1,
0.4876018, -0.9770347, 4.117929, 0, 0, 0, 1, 1,
0.490078, 0.1231446, -0.6713556, 0, 0, 0, 1, 1,
0.4925462, -1.742126, 1.604023, 0, 0, 0, 1, 1,
0.4927499, 0.1333191, 2.08245, 0, 0, 0, 1, 1,
0.494049, -1.216747, 2.046018, 0, 0, 0, 1, 1,
0.4955487, 0.3734413, 1.66594, 0, 0, 0, 1, 1,
0.4957406, -0.2044388, 1.954745, 1, 1, 1, 1, 1,
0.4998506, 0.7943429, -0.04786493, 1, 1, 1, 1, 1,
0.5027858, -0.03107803, 2.361303, 1, 1, 1, 1, 1,
0.5029745, -0.9692873, 3.937759, 1, 1, 1, 1, 1,
0.5049118, 0.9063093, 0.8869442, 1, 1, 1, 1, 1,
0.5076963, 0.02644562, 0.9908912, 1, 1, 1, 1, 1,
0.5084609, -0.2763487, 1.60612, 1, 1, 1, 1, 1,
0.5087156, 0.08738694, 0.6505332, 1, 1, 1, 1, 1,
0.5121199, 2.520741, -0.2252842, 1, 1, 1, 1, 1,
0.5207483, -1.707529, 2.839168, 1, 1, 1, 1, 1,
0.5223678, 0.2523399, 2.387924, 1, 1, 1, 1, 1,
0.522741, -0.2331823, 1.803737, 1, 1, 1, 1, 1,
0.5256677, 0.3594875, 0.2215746, 1, 1, 1, 1, 1,
0.5282997, 0.9823912, 1.452251, 1, 1, 1, 1, 1,
0.5289388, 1.555675, 0.4142139, 1, 1, 1, 1, 1,
0.5300265, 0.2742828, 1.017651, 0, 0, 1, 1, 1,
0.5315166, -0.7913727, 2.448731, 1, 0, 0, 1, 1,
0.5350603, -0.3927539, 2.243108, 1, 0, 0, 1, 1,
0.535468, -0.8214523, 2.80816, 1, 0, 0, 1, 1,
0.5372155, 0.1428438, 1.604746, 1, 0, 0, 1, 1,
0.538268, 0.1300484, 0.09761783, 1, 0, 0, 1, 1,
0.5410531, -1.516897, 4.872637, 0, 0, 0, 1, 1,
0.5448121, 2.12614, 1.274574, 0, 0, 0, 1, 1,
0.546217, -1.019278, 2.996524, 0, 0, 0, 1, 1,
0.5466399, -1.293839, 2.631048, 0, 0, 0, 1, 1,
0.5492792, -1.024583, 2.378814, 0, 0, 0, 1, 1,
0.5512269, -0.1572246, 2.147708, 0, 0, 0, 1, 1,
0.5512275, 0.9197652, 0.2444413, 0, 0, 0, 1, 1,
0.5516454, -0.2643129, 0.8371133, 1, 1, 1, 1, 1,
0.5547419, -1.074746, 2.709419, 1, 1, 1, 1, 1,
0.5553246, 1.579964, -1.069046, 1, 1, 1, 1, 1,
0.5558969, 2.61243, 0.5695653, 1, 1, 1, 1, 1,
0.5578249, 0.828764, 1.178333, 1, 1, 1, 1, 1,
0.5578497, 0.2001422, 1.285295, 1, 1, 1, 1, 1,
0.5582626, -2.007584, 1.355515, 1, 1, 1, 1, 1,
0.5694643, 0.6490896, 2.017793, 1, 1, 1, 1, 1,
0.5730864, 0.3189811, -0.08486731, 1, 1, 1, 1, 1,
0.5740796, 0.6186855, 0.4557054, 1, 1, 1, 1, 1,
0.5775899, -0.3839765, -0.7860707, 1, 1, 1, 1, 1,
0.5793998, 0.7932125, -0.02986147, 1, 1, 1, 1, 1,
0.5822455, -0.6369923, 2.496329, 1, 1, 1, 1, 1,
0.5838333, 0.4407875, -0.4973616, 1, 1, 1, 1, 1,
0.588383, -1.265559, 1.937233, 1, 1, 1, 1, 1,
0.5885231, 0.1702598, 0.2164387, 0, 0, 1, 1, 1,
0.5893868, 0.9184807, 1.114423, 1, 0, 0, 1, 1,
0.5935085, 0.1388301, 2.554083, 1, 0, 0, 1, 1,
0.5949737, 0.8141445, -2.338492, 1, 0, 0, 1, 1,
0.5954869, -0.6730448, 3.965022, 1, 0, 0, 1, 1,
0.5959209, -0.6189581, 1.853241, 1, 0, 0, 1, 1,
0.5968463, -0.362233, 1.72552, 0, 0, 0, 1, 1,
0.6056439, 1.585476, -0.1651541, 0, 0, 0, 1, 1,
0.6083891, -0.4883723, 0.0684561, 0, 0, 0, 1, 1,
0.6122473, 0.09558912, 0.9745498, 0, 0, 0, 1, 1,
0.6124232, -0.1752315, 0.01147492, 0, 0, 0, 1, 1,
0.6163121, -1.010593, 2.850874, 0, 0, 0, 1, 1,
0.6220474, -0.6925589, 0.2972137, 0, 0, 0, 1, 1,
0.6264994, -0.3560256, 1.603006, 1, 1, 1, 1, 1,
0.6288384, -1.055788, 2.445007, 1, 1, 1, 1, 1,
0.6301177, -1.924477, 3.605171, 1, 1, 1, 1, 1,
0.6313845, -0.6242883, 2.300246, 1, 1, 1, 1, 1,
0.6379891, -0.7649481, 3.612134, 1, 1, 1, 1, 1,
0.6404101, 1.42439, -0.3544944, 1, 1, 1, 1, 1,
0.6461555, 0.4742134, 1.107957, 1, 1, 1, 1, 1,
0.6463678, -0.435025, 3.050236, 1, 1, 1, 1, 1,
0.6469862, -0.2263217, 2.19005, 1, 1, 1, 1, 1,
0.6497268, -0.04620169, 3.695979, 1, 1, 1, 1, 1,
0.6498531, -0.7108419, 2.718118, 1, 1, 1, 1, 1,
0.6500893, 0.1659149, 1.145605, 1, 1, 1, 1, 1,
0.654064, -0.644093, -1.454758, 1, 1, 1, 1, 1,
0.656314, 1.454556, 2.736085, 1, 1, 1, 1, 1,
0.658716, -1.472848, 1.364664, 1, 1, 1, 1, 1,
0.65962, -0.02930759, 1.485151, 0, 0, 1, 1, 1,
0.6600987, -0.4081492, 2.389033, 1, 0, 0, 1, 1,
0.6613522, 0.6906773, 0.7294283, 1, 0, 0, 1, 1,
0.6620674, -1.324751, 2.528181, 1, 0, 0, 1, 1,
0.6631366, -0.740491, 2.747412, 1, 0, 0, 1, 1,
0.663245, -0.5302106, 2.471664, 1, 0, 0, 1, 1,
0.6641655, -0.06774027, 0.8445634, 0, 0, 0, 1, 1,
0.6666631, -1.806046, 5.189357, 0, 0, 0, 1, 1,
0.6705704, 0.1253114, 1.567776, 0, 0, 0, 1, 1,
0.6760442, 0.7641338, -0.3289406, 0, 0, 0, 1, 1,
0.6861391, 0.04921599, 2.216945, 0, 0, 0, 1, 1,
0.6937604, 0.7187682, 0.4151185, 0, 0, 0, 1, 1,
0.6990131, -0.2470418, 1.66284, 0, 0, 0, 1, 1,
0.6994779, 0.9985726, 0.01213388, 1, 1, 1, 1, 1,
0.6999259, 2.054651, 0.003533568, 1, 1, 1, 1, 1,
0.701022, -1.348244, 4.286498, 1, 1, 1, 1, 1,
0.7057765, 0.751519, 0.4842337, 1, 1, 1, 1, 1,
0.7121904, -0.5320105, 1.892698, 1, 1, 1, 1, 1,
0.7133214, -1.930346, 2.129954, 1, 1, 1, 1, 1,
0.7141006, 0.4064915, 0.9753122, 1, 1, 1, 1, 1,
0.7155191, 1.14251, 1.30264, 1, 1, 1, 1, 1,
0.7171187, 1.471023, 1.131157, 1, 1, 1, 1, 1,
0.7172052, 0.4579936, -0.1293456, 1, 1, 1, 1, 1,
0.7172472, 1.092071, -0.3362586, 1, 1, 1, 1, 1,
0.7188147, 0.7167518, -0.3947974, 1, 1, 1, 1, 1,
0.7189075, -1.629897, 1.257814, 1, 1, 1, 1, 1,
0.7203722, -0.01996977, 1.522424, 1, 1, 1, 1, 1,
0.721513, 0.07906922, 1.685123, 1, 1, 1, 1, 1,
0.7216958, 0.3287412, 1.767488, 0, 0, 1, 1, 1,
0.7242984, 0.03543505, -0.2492302, 1, 0, 0, 1, 1,
0.7245334, 1.916995, -0.2058821, 1, 0, 0, 1, 1,
0.7260722, -0.7361883, 2.348218, 1, 0, 0, 1, 1,
0.7278215, -0.3206211, 1.772074, 1, 0, 0, 1, 1,
0.7296677, 0.6056031, 2.05993, 1, 0, 0, 1, 1,
0.734667, 1.019674, 1.227994, 0, 0, 0, 1, 1,
0.7351077, 0.756825, 0.7811618, 0, 0, 0, 1, 1,
0.7445412, -1.566758, 2.786049, 0, 0, 0, 1, 1,
0.7449926, 0.344496, 2.016229, 0, 0, 0, 1, 1,
0.7511265, 0.03757449, 2.052788, 0, 0, 0, 1, 1,
0.7522817, 1.174985, 1.639619, 0, 0, 0, 1, 1,
0.7528974, 0.5402789, 2.636355, 0, 0, 0, 1, 1,
0.7555736, 0.1400613, 1.833519, 1, 1, 1, 1, 1,
0.757257, 1.617001, 1.184135, 1, 1, 1, 1, 1,
0.7580231, 0.8615308, 0.6137664, 1, 1, 1, 1, 1,
0.7642199, -1.044497, 2.785968, 1, 1, 1, 1, 1,
0.7648975, -0.03890106, 1.115827, 1, 1, 1, 1, 1,
0.7650598, 1.492728, 0.2935256, 1, 1, 1, 1, 1,
0.7795708, 1.368486, -0.4225385, 1, 1, 1, 1, 1,
0.7887386, 0.1450762, 1.642646, 1, 1, 1, 1, 1,
0.789869, 0.279146, 0.5593792, 1, 1, 1, 1, 1,
0.7905226, -0.08620565, 1.894837, 1, 1, 1, 1, 1,
0.7965303, -0.4099426, 2.634095, 1, 1, 1, 1, 1,
0.8082284, 0.1823791, -0.1018602, 1, 1, 1, 1, 1,
0.8119423, 0.4046623, 2.183331, 1, 1, 1, 1, 1,
0.8123165, 2.313366, -0.6778998, 1, 1, 1, 1, 1,
0.8153775, 0.7018797, 0.3901148, 1, 1, 1, 1, 1,
0.8172555, 1.32605, -0.6244064, 0, 0, 1, 1, 1,
0.8217481, 0.9963148, 0.857124, 1, 0, 0, 1, 1,
0.8244811, 0.5807933, 2.181354, 1, 0, 0, 1, 1,
0.8266166, -0.2390606, 3.926348, 1, 0, 0, 1, 1,
0.827506, 2.561651, 1.593376, 1, 0, 0, 1, 1,
0.8279242, -0.4220638, 3.090408, 1, 0, 0, 1, 1,
0.8285462, 1.317433, 0.5867749, 0, 0, 0, 1, 1,
0.8377206, 0.5555518, 1.500042, 0, 0, 0, 1, 1,
0.8377955, -0.3574803, 2.427263, 0, 0, 0, 1, 1,
0.8401784, -0.3951106, 1.960545, 0, 0, 0, 1, 1,
0.8403491, 0.467561, 0.03166673, 0, 0, 0, 1, 1,
0.8410406, 0.0620934, 1.627841, 0, 0, 0, 1, 1,
0.8467514, -1.477152, 1.987165, 0, 0, 0, 1, 1,
0.8484862, 2.046737, 0.3206659, 1, 1, 1, 1, 1,
0.8531122, -0.8469379, 2.168176, 1, 1, 1, 1, 1,
0.8745635, -1.210771, 2.385354, 1, 1, 1, 1, 1,
0.8755046, -1.579019, 3.939536, 1, 1, 1, 1, 1,
0.8755584, 0.1705747, 1.580865, 1, 1, 1, 1, 1,
0.8771883, -1.472778, 2.30438, 1, 1, 1, 1, 1,
0.8780566, -0.08197048, 2.49369, 1, 1, 1, 1, 1,
0.8824944, -0.0701202, 1.353048, 1, 1, 1, 1, 1,
0.8825301, -0.09880037, 1.653635, 1, 1, 1, 1, 1,
0.8846909, -1.657445, 2.026839, 1, 1, 1, 1, 1,
0.890857, -1.430574, 2.080282, 1, 1, 1, 1, 1,
0.8923895, 0.7424021, 1.32947, 1, 1, 1, 1, 1,
0.8927172, -1.218221, 0.9010758, 1, 1, 1, 1, 1,
0.9026661, 0.05958442, 0.6646562, 1, 1, 1, 1, 1,
0.9051915, -1.2765, 3.625314, 1, 1, 1, 1, 1,
0.9067436, -0.6127121, 1.243662, 0, 0, 1, 1, 1,
0.9156928, -0.85516, 2.14948, 1, 0, 0, 1, 1,
0.9260655, 0.3253257, 1.205429, 1, 0, 0, 1, 1,
0.9279674, 0.5233549, -0.007647181, 1, 0, 0, 1, 1,
0.9281057, 0.4236971, 1.86865, 1, 0, 0, 1, 1,
0.9340926, 0.3102344, -0.9343389, 1, 0, 0, 1, 1,
0.9345456, 0.4348581, 1.578515, 0, 0, 0, 1, 1,
0.9371929, -3.254963, 1.596526, 0, 0, 0, 1, 1,
0.9376799, 2.372426, -0.9218194, 0, 0, 0, 1, 1,
0.9402633, -0.4991871, 2.677158, 0, 0, 0, 1, 1,
0.9414578, 0.3511637, 0.05085078, 0, 0, 0, 1, 1,
0.9435931, -0.1172417, 1.581401, 0, 0, 0, 1, 1,
0.9473823, -0.7219748, 2.073074, 0, 0, 0, 1, 1,
0.95017, 0.122333, 0.8470557, 1, 1, 1, 1, 1,
0.9503615, -0.009899518, 2.714839, 1, 1, 1, 1, 1,
0.9612969, 0.9729422, 1.38766, 1, 1, 1, 1, 1,
0.9669901, -0.190531, 3.053725, 1, 1, 1, 1, 1,
0.9690095, 0.4571982, 1.181049, 1, 1, 1, 1, 1,
0.9720395, 0.3097985, 1.276938, 1, 1, 1, 1, 1,
0.9902824, 0.4004505, 1.059241, 1, 1, 1, 1, 1,
1.004197, 1.135139, 0.1834509, 1, 1, 1, 1, 1,
1.006342, -0.7676376, 1.757651, 1, 1, 1, 1, 1,
1.017399, 1.463203, 0.94406, 1, 1, 1, 1, 1,
1.017737, 0.7547508, 1.899055, 1, 1, 1, 1, 1,
1.017875, 1.46552, 1.590418, 1, 1, 1, 1, 1,
1.021058, -0.1704984, 4.257255, 1, 1, 1, 1, 1,
1.023733, 1.198915, 0.7538299, 1, 1, 1, 1, 1,
1.035569, 1.175025, -1.103404, 1, 1, 1, 1, 1,
1.03571, -0.4481876, 2.502833, 0, 0, 1, 1, 1,
1.043699, -1.065412, 3.176354, 1, 0, 0, 1, 1,
1.043775, 0.3771124, 0.9549869, 1, 0, 0, 1, 1,
1.043779, -1.209265, 0.7273254, 1, 0, 0, 1, 1,
1.043847, -0.1185267, 0.848262, 1, 0, 0, 1, 1,
1.047204, 0.7345086, -0.04173738, 1, 0, 0, 1, 1,
1.047845, -0.3871837, 1.847845, 0, 0, 0, 1, 1,
1.050627, 1.657149, 0.3967866, 0, 0, 0, 1, 1,
1.054731, -0.6522583, 1.832636, 0, 0, 0, 1, 1,
1.056435, 0.5951788, -1.113288, 0, 0, 0, 1, 1,
1.063918, 0.5723287, 1.229371, 0, 0, 0, 1, 1,
1.06694, 0.9329418, 1.70316, 0, 0, 0, 1, 1,
1.072483, 0.6157165, 1.422423, 0, 0, 0, 1, 1,
1.074445, -2.093092, 0.5909322, 1, 1, 1, 1, 1,
1.077523, -1.515392, 1.64531, 1, 1, 1, 1, 1,
1.080507, 0.5535777, 2.082216, 1, 1, 1, 1, 1,
1.080996, -1.795155, 2.822361, 1, 1, 1, 1, 1,
1.098522, 2.044667, 1.117431, 1, 1, 1, 1, 1,
1.099382, -0.07967494, 1.954436, 1, 1, 1, 1, 1,
1.103393, -2.799805, 3.12417, 1, 1, 1, 1, 1,
1.105204, 0.2227091, 0.1084276, 1, 1, 1, 1, 1,
1.115941, -0.4181787, 3.352304, 1, 1, 1, 1, 1,
1.117262, 0.7852112, 0.5790591, 1, 1, 1, 1, 1,
1.120576, 0.3095497, 0.1450926, 1, 1, 1, 1, 1,
1.122912, 0.3856753, 3.142562, 1, 1, 1, 1, 1,
1.122966, 0.2593759, 2.165567, 1, 1, 1, 1, 1,
1.127384, -1.249524, 2.077295, 1, 1, 1, 1, 1,
1.141188, 0.3979437, -0.2023548, 1, 1, 1, 1, 1,
1.142133, 1.213555, 0.3627149, 0, 0, 1, 1, 1,
1.142688, 0.4014879, 0.4089302, 1, 0, 0, 1, 1,
1.165499, -0.8680773, 2.417608, 1, 0, 0, 1, 1,
1.172549, -0.126185, 1.528856, 1, 0, 0, 1, 1,
1.188315, -0.08689106, 1.981988, 1, 0, 0, 1, 1,
1.190632, 0.6391337, 2.477708, 1, 0, 0, 1, 1,
1.196989, -0.7673829, 2.763949, 0, 0, 0, 1, 1,
1.205125, 1.04989, 1.113337, 0, 0, 0, 1, 1,
1.209168, -0.9117515, 2.462065, 0, 0, 0, 1, 1,
1.209226, 1.269367, 0.668115, 0, 0, 0, 1, 1,
1.211458, 0.5956802, 0.5359482, 0, 0, 0, 1, 1,
1.217342, -0.09368252, 2.19353, 0, 0, 0, 1, 1,
1.221885, 0.2387512, -0.3300997, 0, 0, 0, 1, 1,
1.227774, 0.2784131, -1.123072, 1, 1, 1, 1, 1,
1.231358, -0.8278046, 2.661315, 1, 1, 1, 1, 1,
1.238137, 0.02459587, 1.524412, 1, 1, 1, 1, 1,
1.239493, -1.957107, 3.532755, 1, 1, 1, 1, 1,
1.240611, -0.2487051, 2.043017, 1, 1, 1, 1, 1,
1.243982, -1.202798, 3.231918, 1, 1, 1, 1, 1,
1.250215, -0.002388468, 0.3254536, 1, 1, 1, 1, 1,
1.259114, -0.2301892, 3.038754, 1, 1, 1, 1, 1,
1.266809, 0.2390546, 0.08812024, 1, 1, 1, 1, 1,
1.276703, -0.6868548, 2.12434, 1, 1, 1, 1, 1,
1.288223, -0.6700323, 2.401756, 1, 1, 1, 1, 1,
1.290886, 0.3801586, 2.100704, 1, 1, 1, 1, 1,
1.290996, 0.3486091, 2.351843, 1, 1, 1, 1, 1,
1.297399, -1.437792, 1.059632, 1, 1, 1, 1, 1,
1.302457, -1.564425, 1.703108, 1, 1, 1, 1, 1,
1.30952, -2.050028, 3.392784, 0, 0, 1, 1, 1,
1.310245, -1.447641, 2.356507, 1, 0, 0, 1, 1,
1.311903, 0.6490439, 1.271573, 1, 0, 0, 1, 1,
1.313664, 0.2213165, 2.217988, 1, 0, 0, 1, 1,
1.317032, -1.280853, 3.221765, 1, 0, 0, 1, 1,
1.318744, 1.733472, 0.6335953, 1, 0, 0, 1, 1,
1.32396, -0.1752554, -0.7749785, 0, 0, 0, 1, 1,
1.324023, 0.5571835, 1.442908, 0, 0, 0, 1, 1,
1.32538, 0.535585, 1.598791, 0, 0, 0, 1, 1,
1.328125, 0.3341373, -0.8300606, 0, 0, 0, 1, 1,
1.336426, 0.5722663, 2.01266, 0, 0, 0, 1, 1,
1.340103, 2.662316, -0.8080662, 0, 0, 0, 1, 1,
1.367267, 0.9163254, 1.525959, 0, 0, 0, 1, 1,
1.386962, -0.1831167, 0.7208166, 1, 1, 1, 1, 1,
1.397363, 0.4138606, 2.015816, 1, 1, 1, 1, 1,
1.398292, -0.7170594, 0.6903331, 1, 1, 1, 1, 1,
1.401474, 0.4233705, 1.286028, 1, 1, 1, 1, 1,
1.407378, 0.3627214, 0.4983689, 1, 1, 1, 1, 1,
1.415798, 0.6694261, 2.421732, 1, 1, 1, 1, 1,
1.420928, 0.4044318, 2.627884, 1, 1, 1, 1, 1,
1.435376, -0.7531877, 1.678365, 1, 1, 1, 1, 1,
1.447306, -0.8564139, 3.244879, 1, 1, 1, 1, 1,
1.464231, 0.8979183, 1.591839, 1, 1, 1, 1, 1,
1.471475, 0.2002824, 2.282722, 1, 1, 1, 1, 1,
1.477005, -1.476212, 2.895137, 1, 1, 1, 1, 1,
1.480285, -2.46906, 2.198851, 1, 1, 1, 1, 1,
1.504776, 1.292777, 0.3589776, 1, 1, 1, 1, 1,
1.505804, 1.898248, 0.426123, 1, 1, 1, 1, 1,
1.533813, -2.402602, 3.141011, 0, 0, 1, 1, 1,
1.535218, 1.044627, 2.249882, 1, 0, 0, 1, 1,
1.535391, -1.279009, 2.220102, 1, 0, 0, 1, 1,
1.547803, 0.5533794, 0.9083096, 1, 0, 0, 1, 1,
1.555564, 0.635303, 1.276535, 1, 0, 0, 1, 1,
1.556794, 0.8680845, 1.01618, 1, 0, 0, 1, 1,
1.56012, 2.298527, -0.01531011, 0, 0, 0, 1, 1,
1.567477, 0.342545, 1.617392, 0, 0, 0, 1, 1,
1.574496, 0.8318083, 0.6730893, 0, 0, 0, 1, 1,
1.577538, -0.6525722, 0.7566591, 0, 0, 0, 1, 1,
1.581909, -1.339935, 2.031361, 0, 0, 0, 1, 1,
1.582092, 1.471468, 1.218304, 0, 0, 0, 1, 1,
1.594613, -0.3456015, 2.43195, 0, 0, 0, 1, 1,
1.597088, -0.2806833, 0.9485238, 1, 1, 1, 1, 1,
1.598593, 2.468558, 1.965063, 1, 1, 1, 1, 1,
1.599234, 0.2603267, 1.869631, 1, 1, 1, 1, 1,
1.60806, -1.210593, 0.5534861, 1, 1, 1, 1, 1,
1.615256, 0.02488272, 1.631019, 1, 1, 1, 1, 1,
1.620048, -0.2101552, 3.531853, 1, 1, 1, 1, 1,
1.62631, 0.7241739, -0.2721634, 1, 1, 1, 1, 1,
1.633403, 1.117622, 1.585846, 1, 1, 1, 1, 1,
1.641394, -1.000297, 3.753545, 1, 1, 1, 1, 1,
1.64328, -0.1021307, 2.410326, 1, 1, 1, 1, 1,
1.646785, -0.6976754, 2.352955, 1, 1, 1, 1, 1,
1.649505, 0.6420429, 2.409674, 1, 1, 1, 1, 1,
1.650398, 1.828425, 0.7267986, 1, 1, 1, 1, 1,
1.663364, 0.6299976, 1.235913, 1, 1, 1, 1, 1,
1.670379, 1.165323, 2.632355, 1, 1, 1, 1, 1,
1.670509, 0.1007964, -0.5045686, 0, 0, 1, 1, 1,
1.671034, 0.3629046, 2.414325, 1, 0, 0, 1, 1,
1.679712, -0.3625752, 2.516392, 1, 0, 0, 1, 1,
1.680043, -1.187595, 2.809423, 1, 0, 0, 1, 1,
1.705883, -0.09025386, 0.8823032, 1, 0, 0, 1, 1,
1.707315, 1.030297, 1.437721, 1, 0, 0, 1, 1,
1.713564, 2.736444, -1.357744, 0, 0, 0, 1, 1,
1.719497, 1.278368, 0.1496728, 0, 0, 0, 1, 1,
1.723717, -1.116847, 2.012798, 0, 0, 0, 1, 1,
1.724172, 0.4708686, 1.181411, 0, 0, 0, 1, 1,
1.740632, -0.6959372, 2.075771, 0, 0, 0, 1, 1,
1.749012, 1.320698, 0.2172491, 0, 0, 0, 1, 1,
1.750646, -1.240349, 4.003368, 0, 0, 0, 1, 1,
1.806566, -1.059327, 3.03385, 1, 1, 1, 1, 1,
1.83003, -0.1179093, -0.1307975, 1, 1, 1, 1, 1,
1.847304, -1.457972, 2.475586, 1, 1, 1, 1, 1,
1.84938, -0.4360494, 2.862279, 1, 1, 1, 1, 1,
1.866931, -0.6923202, 1.553433, 1, 1, 1, 1, 1,
1.883889, 0.995499, 1.312881, 1, 1, 1, 1, 1,
1.884308, 1.513442, 0.7005759, 1, 1, 1, 1, 1,
1.908298, -0.8903291, 0.5512637, 1, 1, 1, 1, 1,
1.938174, 0.5216054, 0.8741407, 1, 1, 1, 1, 1,
1.946484, 0.8622321, 1.233338, 1, 1, 1, 1, 1,
1.957774, -0.2575205, 3.55951, 1, 1, 1, 1, 1,
1.961622, -0.0728239, 0.08301807, 1, 1, 1, 1, 1,
2.031482, 0.6390786, 2.010554, 1, 1, 1, 1, 1,
2.04372, -2.390866, 2.316475, 1, 1, 1, 1, 1,
2.060907, -0.9883571, 3.194638, 1, 1, 1, 1, 1,
2.170223, -0.3680721, 2.068698, 0, 0, 1, 1, 1,
2.180496, -1.032955, 1.679485, 1, 0, 0, 1, 1,
2.180921, 0.4591221, 1.344429, 1, 0, 0, 1, 1,
2.189983, 1.345967, 2.427045, 1, 0, 0, 1, 1,
2.191177, -1.000123, 1.72476, 1, 0, 0, 1, 1,
2.204272, 1.163489, 0.5900674, 1, 0, 0, 1, 1,
2.216254, -1.887936, 1.689239, 0, 0, 0, 1, 1,
2.216382, -0.03849462, 2.858657, 0, 0, 0, 1, 1,
2.292349, -1.092096, 1.321331, 0, 0, 0, 1, 1,
2.31105, 0.06440078, 1.822593, 0, 0, 0, 1, 1,
2.45817, 0.3952712, 1.636955, 0, 0, 0, 1, 1,
2.509529, -1.18335, 2.451098, 0, 0, 0, 1, 1,
2.667001, -0.8905479, -0.17033, 0, 0, 0, 1, 1,
2.720462, -0.7838027, 1.700051, 1, 1, 1, 1, 1,
2.931677, 0.518164, 1.505147, 1, 1, 1, 1, 1,
2.949064, -0.4436937, 1.85843, 1, 1, 1, 1, 1,
3.023014, 0.4742122, 2.139211, 1, 1, 1, 1, 1,
3.064091, 0.925669, 0.18002, 1, 1, 1, 1, 1,
3.064556, -0.355587, -1.815218, 1, 1, 1, 1, 1,
3.451565, -0.0156843, 1.13298, 1, 1, 1, 1, 1
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
var radius = 9.343028;
var distance = 32.81699;
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
mvMatrix.translate( -0.2722695, 0.2990545, -0.1264546 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.81699);
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
