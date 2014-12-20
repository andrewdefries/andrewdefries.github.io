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
-3.891849, 0.3270051, -3.328122, 1, 0, 0, 1,
-3.688582, -0.09707899, 0.01823372, 1, 0.007843138, 0, 1,
-3.352035, -1.324374, -0.8376219, 1, 0.01176471, 0, 1,
-2.973253, 0.2579978, -1.969592, 1, 0.01960784, 0, 1,
-2.918426, 1.904104, -1.288726, 1, 0.02352941, 0, 1,
-2.827712, 1.392627, -2.560434, 1, 0.03137255, 0, 1,
-2.708065, 1.216112, -1.219951, 1, 0.03529412, 0, 1,
-2.511378, -0.2452456, -3.131656, 1, 0.04313726, 0, 1,
-2.48674, -0.4886402, -3.495388, 1, 0.04705882, 0, 1,
-2.467194, -0.2405407, -1.380161, 1, 0.05490196, 0, 1,
-2.461036, 2.096494, -1.254907, 1, 0.05882353, 0, 1,
-2.422562, 0.9684785, -1.58297, 1, 0.06666667, 0, 1,
-2.354734, 1.990295, -1.343176, 1, 0.07058824, 0, 1,
-2.217817, 0.04420649, -2.565719, 1, 0.07843138, 0, 1,
-2.210513, -2.20494, -2.083074, 1, 0.08235294, 0, 1,
-2.10743, -0.05089319, -2.673126, 1, 0.09019608, 0, 1,
-2.09801, 0.06146341, -1.579306, 1, 0.09411765, 0, 1,
-2.077051, 0.3480195, -0.9738798, 1, 0.1019608, 0, 1,
-2.071232, -1.250441, -2.028711, 1, 0.1098039, 0, 1,
-2.060694, 0.6476443, -0.795472, 1, 0.1137255, 0, 1,
-2.053718, -1.398342, -1.544295, 1, 0.1215686, 0, 1,
-2.006665, 0.8150048, -0.7336727, 1, 0.1254902, 0, 1,
-1.958231, 1.293141, -0.9312738, 1, 0.1333333, 0, 1,
-1.949453, -1.345074, -1.258684, 1, 0.1372549, 0, 1,
-1.946541, -0.6377569, -2.321708, 1, 0.145098, 0, 1,
-1.917192, -1.868252, -2.922683, 1, 0.1490196, 0, 1,
-1.914978, -1.280398, -3.778896, 1, 0.1568628, 0, 1,
-1.905495, -0.1489782, -1.281366, 1, 0.1607843, 0, 1,
-1.894527, 1.427778, -0.346524, 1, 0.1686275, 0, 1,
-1.871223, -1.933866, -3.722273, 1, 0.172549, 0, 1,
-1.806175, -1.218964, -0.8414367, 1, 0.1803922, 0, 1,
-1.803337, 1.25474, -2.701229, 1, 0.1843137, 0, 1,
-1.782198, -1.16017, -1.717051, 1, 0.1921569, 0, 1,
-1.772043, -2.581159, -1.684832, 1, 0.1960784, 0, 1,
-1.756053, 1.220086, -1.134994, 1, 0.2039216, 0, 1,
-1.725774, -0.1779518, -0.9917231, 1, 0.2117647, 0, 1,
-1.710774, -1.850015, -2.200917, 1, 0.2156863, 0, 1,
-1.695487, -0.5335758, -4.428653, 1, 0.2235294, 0, 1,
-1.691856, -1.334012, 0.2816981, 1, 0.227451, 0, 1,
-1.689814, 0.4527774, -1.410761, 1, 0.2352941, 0, 1,
-1.661505, -0.9241484, 0.5441881, 1, 0.2392157, 0, 1,
-1.654222, -1.335205, -1.170398, 1, 0.2470588, 0, 1,
-1.631002, 0.6701155, 0.3836208, 1, 0.2509804, 0, 1,
-1.612368, 0.6449081, -1.428938, 1, 0.2588235, 0, 1,
-1.610838, 0.9307614, -0.2101269, 1, 0.2627451, 0, 1,
-1.599383, -0.9486679, -2.617644, 1, 0.2705882, 0, 1,
-1.578402, 0.867324, -0.2788856, 1, 0.2745098, 0, 1,
-1.569062, 0.3337193, -1.647086, 1, 0.282353, 0, 1,
-1.567262, 0.6600381, -0.1334845, 1, 0.2862745, 0, 1,
-1.552992, 0.1780378, -2.442782, 1, 0.2941177, 0, 1,
-1.546098, 0.9943676, -0.7997671, 1, 0.3019608, 0, 1,
-1.544895, 0.7269146, -0.516488, 1, 0.3058824, 0, 1,
-1.544557, -0.01057948, -2.205306, 1, 0.3137255, 0, 1,
-1.53315, -0.6315355, -2.576933, 1, 0.3176471, 0, 1,
-1.52246, -0.382274, -0.5796017, 1, 0.3254902, 0, 1,
-1.513054, 0.03424691, -1.563375, 1, 0.3294118, 0, 1,
-1.510867, -0.1090146, -4.090613, 1, 0.3372549, 0, 1,
-1.509086, 0.6210592, -1.150634, 1, 0.3411765, 0, 1,
-1.497833, 0.9122981, 0.3319912, 1, 0.3490196, 0, 1,
-1.482156, -0.82556, -2.173903, 1, 0.3529412, 0, 1,
-1.478999, -1.257392, -3.947054, 1, 0.3607843, 0, 1,
-1.475542, 1.37459, -1.801423, 1, 0.3647059, 0, 1,
-1.474594, -1.581862, -2.813436, 1, 0.372549, 0, 1,
-1.473649, -0.09973432, -3.084748, 1, 0.3764706, 0, 1,
-1.46821, 0.7800117, -2.762363, 1, 0.3843137, 0, 1,
-1.458227, 1.828677, -1.17657, 1, 0.3882353, 0, 1,
-1.442589, 0.4966586, -0.982303, 1, 0.3960784, 0, 1,
-1.437236, -0.7681877, -3.561643, 1, 0.4039216, 0, 1,
-1.432746, 0.8056342, 0.2884565, 1, 0.4078431, 0, 1,
-1.428171, 0.4940786, -1.915469, 1, 0.4156863, 0, 1,
-1.426694, -1.399641, -2.513101, 1, 0.4196078, 0, 1,
-1.424512, 0.0623903, -1.114617, 1, 0.427451, 0, 1,
-1.419201, 0.8731318, -1.673282, 1, 0.4313726, 0, 1,
-1.418977, 0.1324845, -2.491758, 1, 0.4392157, 0, 1,
-1.402971, 0.806855, -1.167875, 1, 0.4431373, 0, 1,
-1.396075, -2.444903, -3.216616, 1, 0.4509804, 0, 1,
-1.388942, -0.4608793, -2.968825, 1, 0.454902, 0, 1,
-1.388512, 1.926973, -0.2752452, 1, 0.4627451, 0, 1,
-1.382082, 2.18721, -1.967765, 1, 0.4666667, 0, 1,
-1.379525, 2.544931, -0.09648555, 1, 0.4745098, 0, 1,
-1.37722, 1.831004, -0.4814615, 1, 0.4784314, 0, 1,
-1.364257, -0.9008504, -1.372143, 1, 0.4862745, 0, 1,
-1.362356, -1.243625, -1.486579, 1, 0.4901961, 0, 1,
-1.356955, 1.810322, -2.014879, 1, 0.4980392, 0, 1,
-1.355783, -0.3115036, -2.752174, 1, 0.5058824, 0, 1,
-1.352099, 1.351704, -0.5667233, 1, 0.509804, 0, 1,
-1.334709, 1.19137, -1.407246, 1, 0.5176471, 0, 1,
-1.333893, -0.2491191, -1.265367, 1, 0.5215687, 0, 1,
-1.328052, 0.5302786, -1.429702, 1, 0.5294118, 0, 1,
-1.32599, -0.2374983, -1.601817, 1, 0.5333334, 0, 1,
-1.325318, 0.4974681, -1.917579, 1, 0.5411765, 0, 1,
-1.325011, -2.421093, -3.171963, 1, 0.5450981, 0, 1,
-1.299497, 0.9680592, -0.6929539, 1, 0.5529412, 0, 1,
-1.296113, -1.140153, -2.502847, 1, 0.5568628, 0, 1,
-1.293745, 0.03869881, -1.826141, 1, 0.5647059, 0, 1,
-1.286782, 1.575743, -2.244556, 1, 0.5686275, 0, 1,
-1.282909, -0.4007459, -3.493365, 1, 0.5764706, 0, 1,
-1.281276, 1.430881, -1.324397, 1, 0.5803922, 0, 1,
-1.276021, 0.2566475, -2.06766, 1, 0.5882353, 0, 1,
-1.275428, 0.1315268, -2.254197, 1, 0.5921569, 0, 1,
-1.268588, 0.4600107, -1.466903, 1, 0.6, 0, 1,
-1.26814, -0.8682417, -3.077976, 1, 0.6078432, 0, 1,
-1.263724, -0.2075626, -3.100022, 1, 0.6117647, 0, 1,
-1.263709, -0.1317316, 0.1206273, 1, 0.6196079, 0, 1,
-1.262143, -0.887503, -2.390838, 1, 0.6235294, 0, 1,
-1.259028, 1.423831, -2.056926, 1, 0.6313726, 0, 1,
-1.252021, -1.092471, -3.273122, 1, 0.6352941, 0, 1,
-1.249699, -1.555757, -2.913725, 1, 0.6431373, 0, 1,
-1.248595, 0.3634166, -1.420608, 1, 0.6470588, 0, 1,
-1.23875, -0.3418255, -0.7536872, 1, 0.654902, 0, 1,
-1.234381, -0.2610608, -1.797091, 1, 0.6588235, 0, 1,
-1.22247, -1.411512, -3.310039, 1, 0.6666667, 0, 1,
-1.219566, 0.5212991, -2.749045, 1, 0.6705883, 0, 1,
-1.215614, 0.7629842, -0.5533738, 1, 0.6784314, 0, 1,
-1.211854, 0.1098916, -2.607361, 1, 0.682353, 0, 1,
-1.209859, -0.9762673, -2.400992, 1, 0.6901961, 0, 1,
-1.199814, 0.5717857, -1.03585, 1, 0.6941177, 0, 1,
-1.190234, -0.8108401, -2.780955, 1, 0.7019608, 0, 1,
-1.187071, -0.6317679, -2.367395, 1, 0.7098039, 0, 1,
-1.178895, 0.532566, -0.327256, 1, 0.7137255, 0, 1,
-1.169889, 0.4807036, -0.8069643, 1, 0.7215686, 0, 1,
-1.166886, 0.6061732, -0.6906894, 1, 0.7254902, 0, 1,
-1.165598, 0.1761059, -1.228986, 1, 0.7333333, 0, 1,
-1.156104, 0.912414, -1.823494, 1, 0.7372549, 0, 1,
-1.151469, 1.192016, 0.0004856872, 1, 0.7450981, 0, 1,
-1.14572, 0.5389757, -0.4089326, 1, 0.7490196, 0, 1,
-1.137441, 1.68002, 0.1567738, 1, 0.7568628, 0, 1,
-1.124036, 1.474916, 0.8842106, 1, 0.7607843, 0, 1,
-1.119837, 1.065204, -1.26368, 1, 0.7686275, 0, 1,
-1.119366, -0.03108247, -2.136212, 1, 0.772549, 0, 1,
-1.119261, -0.6633126, -2.964644, 1, 0.7803922, 0, 1,
-1.115087, -0.3526917, -0.1377316, 1, 0.7843137, 0, 1,
-1.112675, 0.9316679, -0.913107, 1, 0.7921569, 0, 1,
-1.107813, -1.516191, -1.881532, 1, 0.7960784, 0, 1,
-1.098675, -0.4392057, -1.705099, 1, 0.8039216, 0, 1,
-1.084112, -0.566022, -2.357102, 1, 0.8117647, 0, 1,
-1.082365, 0.4771758, -1.589628, 1, 0.8156863, 0, 1,
-1.075046, 0.5485035, -0.1489245, 1, 0.8235294, 0, 1,
-1.073369, 0.412405, -1.469826, 1, 0.827451, 0, 1,
-1.072198, 0.2888392, -1.423102, 1, 0.8352941, 0, 1,
-1.071823, -0.9683846, -4.22089, 1, 0.8392157, 0, 1,
-1.069675, 0.509078, -0.4268501, 1, 0.8470588, 0, 1,
-1.069273, 0.1504595, -1.767598, 1, 0.8509804, 0, 1,
-1.065843, -0.08757038, -0.5649801, 1, 0.8588235, 0, 1,
-1.063781, 2.49303, -0.7375726, 1, 0.8627451, 0, 1,
-1.057633, -0.5071188, -3.63894, 1, 0.8705882, 0, 1,
-1.056993, 1.310169, -1.571504, 1, 0.8745098, 0, 1,
-1.056436, -1.654903, -1.89464, 1, 0.8823529, 0, 1,
-1.052114, 0.8065566, -1.475068, 1, 0.8862745, 0, 1,
-1.035041, -0.5976611, -1.480938, 1, 0.8941177, 0, 1,
-1.034678, 1.786019, -0.3043765, 1, 0.8980392, 0, 1,
-1.030141, 1.072324, 0.6355514, 1, 0.9058824, 0, 1,
-1.027192, 1.258569, 0.2829742, 1, 0.9137255, 0, 1,
-1.024923, -0.8400894, -1.980258, 1, 0.9176471, 0, 1,
-1.014343, 0.6700292, -2.809838, 1, 0.9254902, 0, 1,
-1.014176, 1.35559, 0.4407069, 1, 0.9294118, 0, 1,
-0.9963818, 1.625478, 0.1825261, 1, 0.9372549, 0, 1,
-0.995436, -0.1858085, -1.215346, 1, 0.9411765, 0, 1,
-0.9929611, 0.3094648, -0.2955469, 1, 0.9490196, 0, 1,
-0.9915496, -0.04120196, -1.680793, 1, 0.9529412, 0, 1,
-0.9896978, -0.3459385, -0.9593715, 1, 0.9607843, 0, 1,
-0.9859142, 1.070372, -1.055516, 1, 0.9647059, 0, 1,
-0.9845802, 1.088563, -0.6504486, 1, 0.972549, 0, 1,
-0.9721705, -0.3646413, -2.486723, 1, 0.9764706, 0, 1,
-0.9714699, 0.607863, -0.7049473, 1, 0.9843137, 0, 1,
-0.971125, 0.06124768, -2.406318, 1, 0.9882353, 0, 1,
-0.961468, -1.290537, -3.413106, 1, 0.9960784, 0, 1,
-0.9542161, 0.6832396, -0.147123, 0.9960784, 1, 0, 1,
-0.9528059, 1.857155, 0.7677639, 0.9921569, 1, 0, 1,
-0.9503373, 1.998783, -2.206309, 0.9843137, 1, 0, 1,
-0.9488248, -0.0572108, -2.548969, 0.9803922, 1, 0, 1,
-0.9440784, -1.247866, -2.702562, 0.972549, 1, 0, 1,
-0.9434781, 0.7734736, -0.881779, 0.9686275, 1, 0, 1,
-0.9433475, -0.5425568, -1.986174, 0.9607843, 1, 0, 1,
-0.9429097, -1.124475, -2.656233, 0.9568627, 1, 0, 1,
-0.9384625, -2.000505, -3.522557, 0.9490196, 1, 0, 1,
-0.9356314, 0.6650167, 0.3607216, 0.945098, 1, 0, 1,
-0.9351379, 1.43402, 0.10064, 0.9372549, 1, 0, 1,
-0.934981, 0.2393849, -1.24494, 0.9333333, 1, 0, 1,
-0.9336264, 1.053303, 0.6912015, 0.9254902, 1, 0, 1,
-0.9305697, 0.3777724, -0.868533, 0.9215686, 1, 0, 1,
-0.9213625, 1.832384, 0.719368, 0.9137255, 1, 0, 1,
-0.9156215, 0.7980756, -0.3392971, 0.9098039, 1, 0, 1,
-0.9126936, -0.2391702, -0.4843719, 0.9019608, 1, 0, 1,
-0.9113027, 1.596005, 1.301294, 0.8941177, 1, 0, 1,
-0.9048947, 0.9395788, -0.5686002, 0.8901961, 1, 0, 1,
-0.901496, -2.117609, -3.10311, 0.8823529, 1, 0, 1,
-0.8955697, -0.5169612, -3.221183, 0.8784314, 1, 0, 1,
-0.8934361, 1.392679, -0.8058614, 0.8705882, 1, 0, 1,
-0.8871574, -1.022714, -1.293307, 0.8666667, 1, 0, 1,
-0.88696, -0.8846229, -0.6886421, 0.8588235, 1, 0, 1,
-0.8865642, 0.6033862, 0.1501426, 0.854902, 1, 0, 1,
-0.8861163, -0.238371, -0.5489249, 0.8470588, 1, 0, 1,
-0.876747, 0.720807, -0.5980649, 0.8431373, 1, 0, 1,
-0.8764484, -1.087355, -1.874321, 0.8352941, 1, 0, 1,
-0.8754767, -0.623113, -1.697623, 0.8313726, 1, 0, 1,
-0.8704639, -0.9555598, -3.332873, 0.8235294, 1, 0, 1,
-0.8599808, -0.2786385, -1.5032, 0.8196079, 1, 0, 1,
-0.857847, 0.8738548, -0.4515268, 0.8117647, 1, 0, 1,
-0.8572227, 0.4006513, -0.5542573, 0.8078431, 1, 0, 1,
-0.8567606, 0.366072, -0.4279307, 0.8, 1, 0, 1,
-0.8554772, 0.2158729, -1.471099, 0.7921569, 1, 0, 1,
-0.8512035, 0.8938748, -1.619795, 0.7882353, 1, 0, 1,
-0.8474395, -0.09205321, -1.23292, 0.7803922, 1, 0, 1,
-0.8467271, -0.5522813, -0.2458686, 0.7764706, 1, 0, 1,
-0.8450834, 0.5653399, 0.3394477, 0.7686275, 1, 0, 1,
-0.8314754, -0.2721555, -0.7044211, 0.7647059, 1, 0, 1,
-0.8300195, 1.586022, -1.509093, 0.7568628, 1, 0, 1,
-0.8236214, -0.6413306, -2.043548, 0.7529412, 1, 0, 1,
-0.8227537, 1.586688, 1.00624, 0.7450981, 1, 0, 1,
-0.8210796, 1.187548, -0.2374135, 0.7411765, 1, 0, 1,
-0.8194268, 1.55043, -0.5098284, 0.7333333, 1, 0, 1,
-0.8091888, 1.239954, -1.195141, 0.7294118, 1, 0, 1,
-0.8079094, 0.3166311, -1.686908, 0.7215686, 1, 0, 1,
-0.8026905, 1.229234, -0.6020786, 0.7176471, 1, 0, 1,
-0.7913629, 0.09465046, -1.534771, 0.7098039, 1, 0, 1,
-0.7903835, 0.583347, -0.2083745, 0.7058824, 1, 0, 1,
-0.788475, 1.110297, -0.4767937, 0.6980392, 1, 0, 1,
-0.7724626, 0.8543276, -1.496482, 0.6901961, 1, 0, 1,
-0.7722422, 0.7374838, -0.3078375, 0.6862745, 1, 0, 1,
-0.7625933, -0.9358616, -2.196326, 0.6784314, 1, 0, 1,
-0.7572571, 1.299185, -0.4223516, 0.6745098, 1, 0, 1,
-0.7551374, 0.503976, 0.7060405, 0.6666667, 1, 0, 1,
-0.754901, 0.6538833, -0.3672748, 0.6627451, 1, 0, 1,
-0.7502437, 0.6753145, -0.02862611, 0.654902, 1, 0, 1,
-0.7430048, 1.185033, -0.688243, 0.6509804, 1, 0, 1,
-0.7360271, -0.378234, -2.772129, 0.6431373, 1, 0, 1,
-0.7272677, -0.2685844, -1.246445, 0.6392157, 1, 0, 1,
-0.7240443, -0.3854915, -1.147638, 0.6313726, 1, 0, 1,
-0.7148505, -1.039006, -2.370232, 0.627451, 1, 0, 1,
-0.7139197, 1.57056, 0.8277784, 0.6196079, 1, 0, 1,
-0.7095676, 0.3789415, -2.103082, 0.6156863, 1, 0, 1,
-0.7084335, 0.2021739, -0.509636, 0.6078432, 1, 0, 1,
-0.7057803, -0.1612391, -1.355688, 0.6039216, 1, 0, 1,
-0.7036577, -0.1102873, -1.653607, 0.5960785, 1, 0, 1,
-0.7014863, 0.04625764, -1.89546, 0.5882353, 1, 0, 1,
-0.6976813, 0.02913932, -1.808927, 0.5843138, 1, 0, 1,
-0.6946672, 1.360597, -0.7502235, 0.5764706, 1, 0, 1,
-0.6903955, 1.093153, -0.1571859, 0.572549, 1, 0, 1,
-0.6899755, 1.468557, 0.4721102, 0.5647059, 1, 0, 1,
-0.6814234, -1.120046, -2.834233, 0.5607843, 1, 0, 1,
-0.6804237, -0.7502474, -3.685782, 0.5529412, 1, 0, 1,
-0.6730989, -0.5299458, -1.650143, 0.5490196, 1, 0, 1,
-0.6712465, 1.391797, -0.5017451, 0.5411765, 1, 0, 1,
-0.6703689, -0.1753111, -0.9453325, 0.5372549, 1, 0, 1,
-0.6688933, 0.05340791, -0.9974521, 0.5294118, 1, 0, 1,
-0.6682014, -0.5736799, -2.161253, 0.5254902, 1, 0, 1,
-0.6609004, -0.819773, -2.036113, 0.5176471, 1, 0, 1,
-0.6557121, 0.5423923, -0.4944602, 0.5137255, 1, 0, 1,
-0.6549515, -0.2372731, -0.1785241, 0.5058824, 1, 0, 1,
-0.6477603, 0.04981197, -1.871163, 0.5019608, 1, 0, 1,
-0.6416394, 0.3164295, 0.3740055, 0.4941176, 1, 0, 1,
-0.640251, -0.5182822, -2.263893, 0.4862745, 1, 0, 1,
-0.6385455, -1.34577, -1.967967, 0.4823529, 1, 0, 1,
-0.6365629, -0.4399783, -2.70777, 0.4745098, 1, 0, 1,
-0.6341099, 1.030497, -1.181097, 0.4705882, 1, 0, 1,
-0.6326221, 0.373583, -0.01079592, 0.4627451, 1, 0, 1,
-0.6301405, -1.378397, -1.36937, 0.4588235, 1, 0, 1,
-0.626027, -0.1533175, -0.7752602, 0.4509804, 1, 0, 1,
-0.620782, -0.5051656, -1.99854, 0.4470588, 1, 0, 1,
-0.6175356, -2.539005, -2.856864, 0.4392157, 1, 0, 1,
-0.6110212, -1.235207, -3.287566, 0.4352941, 1, 0, 1,
-0.6034812, -0.2282894, -1.9017, 0.427451, 1, 0, 1,
-0.6013407, -0.2688547, -1.665525, 0.4235294, 1, 0, 1,
-0.5870844, 0.07389612, -0.05991538, 0.4156863, 1, 0, 1,
-0.5868613, 1.330603, 0.288708, 0.4117647, 1, 0, 1,
-0.5846779, 0.6676276, -1.253611, 0.4039216, 1, 0, 1,
-0.5781412, 0.4013111, -1.015999, 0.3960784, 1, 0, 1,
-0.5739952, 0.3879449, -0.5125059, 0.3921569, 1, 0, 1,
-0.5719296, -1.234633, -2.973403, 0.3843137, 1, 0, 1,
-0.5646996, 0.4544684, 0.01976732, 0.3803922, 1, 0, 1,
-0.5605375, 0.7194738, -0.3579932, 0.372549, 1, 0, 1,
-0.5587505, -1.343089, -2.298289, 0.3686275, 1, 0, 1,
-0.5582315, -1.476386, -3.277864, 0.3607843, 1, 0, 1,
-0.5577859, 0.4496637, -2.646565, 0.3568628, 1, 0, 1,
-0.5463799, 1.252916, -1.079472, 0.3490196, 1, 0, 1,
-0.5446844, -1.222768, -1.504324, 0.345098, 1, 0, 1,
-0.5408697, -0.5131699, -1.802344, 0.3372549, 1, 0, 1,
-0.5399879, 0.9516984, -1.064075, 0.3333333, 1, 0, 1,
-0.5388479, 0.8589469, -1.048734, 0.3254902, 1, 0, 1,
-0.5337984, 1.303195, 2.103864, 0.3215686, 1, 0, 1,
-0.53258, 0.218332, -1.72221, 0.3137255, 1, 0, 1,
-0.5218462, -0.7331135, -4.561153, 0.3098039, 1, 0, 1,
-0.5211436, -0.2690801, 0.435035, 0.3019608, 1, 0, 1,
-0.5179526, -1.854916, -1.652006, 0.2941177, 1, 0, 1,
-0.5137792, 0.2445843, -1.055718, 0.2901961, 1, 0, 1,
-0.5133407, 1.155627, 1.15201, 0.282353, 1, 0, 1,
-0.5099592, -0.5361106, -2.777167, 0.2784314, 1, 0, 1,
-0.5099462, -2.250017, -2.387024, 0.2705882, 1, 0, 1,
-0.5055385, 0.7355108, -1.029156, 0.2666667, 1, 0, 1,
-0.5000893, 0.1960593, -2.265083, 0.2588235, 1, 0, 1,
-0.4963732, 2.430047, -0.9637451, 0.254902, 1, 0, 1,
-0.4921171, -0.7927718, -3.999511, 0.2470588, 1, 0, 1,
-0.4904642, -0.01376373, -2.503748, 0.2431373, 1, 0, 1,
-0.4847933, -0.1749404, -2.913538, 0.2352941, 1, 0, 1,
-0.4846804, 0.06294151, -1.802206, 0.2313726, 1, 0, 1,
-0.4834075, 0.3950369, 0.09460088, 0.2235294, 1, 0, 1,
-0.4819948, 0.3382747, -0.2595065, 0.2196078, 1, 0, 1,
-0.4810772, -0.4570681, -3.042813, 0.2117647, 1, 0, 1,
-0.4800946, 0.9586402, -0.9926497, 0.2078431, 1, 0, 1,
-0.4784999, -1.087825, -3.909348, 0.2, 1, 0, 1,
-0.4762451, -0.560465, -2.742702, 0.1921569, 1, 0, 1,
-0.4760089, 0.4873551, -1.210944, 0.1882353, 1, 0, 1,
-0.4714738, 0.04705851, -0.9854904, 0.1803922, 1, 0, 1,
-0.4708206, -0.1874229, -3.382935, 0.1764706, 1, 0, 1,
-0.4673106, -0.8937103, -1.661472, 0.1686275, 1, 0, 1,
-0.4595749, -1.435391, -3.68557, 0.1647059, 1, 0, 1,
-0.4590099, 0.3683169, 0.2075641, 0.1568628, 1, 0, 1,
-0.4549342, -1.788398, -2.318338, 0.1529412, 1, 0, 1,
-0.454776, 1.438527, -0.8365151, 0.145098, 1, 0, 1,
-0.4463081, -0.8722398, -3.177408, 0.1411765, 1, 0, 1,
-0.4433543, 0.6428781, -1.059422, 0.1333333, 1, 0, 1,
-0.4425618, -0.5583428, -3.888785, 0.1294118, 1, 0, 1,
-0.4414231, -1.577738, -2.895932, 0.1215686, 1, 0, 1,
-0.435253, -0.3513119, -2.452506, 0.1176471, 1, 0, 1,
-0.4346811, -1.549755, -2.361714, 0.1098039, 1, 0, 1,
-0.4311389, 0.354515, -2.14848, 0.1058824, 1, 0, 1,
-0.4177312, 1.087633, -0.5786103, 0.09803922, 1, 0, 1,
-0.415785, 0.9188219, 1.324919, 0.09019608, 1, 0, 1,
-0.4155078, -0.6965767, -2.294439, 0.08627451, 1, 0, 1,
-0.4128968, -0.8946831, -3.200969, 0.07843138, 1, 0, 1,
-0.4082865, -0.4847125, -3.37448, 0.07450981, 1, 0, 1,
-0.4037558, -0.302218, 0.02964591, 0.06666667, 1, 0, 1,
-0.4022924, 1.788335, -0.270651, 0.0627451, 1, 0, 1,
-0.3988722, -0.02096123, -0.5649216, 0.05490196, 1, 0, 1,
-0.3971128, 1.079159, -1.22027, 0.05098039, 1, 0, 1,
-0.3969472, -1.242005, -3.55392, 0.04313726, 1, 0, 1,
-0.3948548, -0.4671063, -1.489872, 0.03921569, 1, 0, 1,
-0.3939627, 1.109205, -0.6085796, 0.03137255, 1, 0, 1,
-0.3938731, -0.1845761, -3.133337, 0.02745098, 1, 0, 1,
-0.3917867, 0.831852, 0.7954223, 0.01960784, 1, 0, 1,
-0.389798, 0.5634809, -1.481923, 0.01568628, 1, 0, 1,
-0.3867638, -1.098606, -2.25095, 0.007843138, 1, 0, 1,
-0.3851708, 0.8567987, -1.964468, 0.003921569, 1, 0, 1,
-0.3830493, 0.4319936, 0.04566754, 0, 1, 0.003921569, 1,
-0.3769878, -0.6050182, -2.63395, 0, 1, 0.01176471, 1,
-0.3722594, -1.503136, -1.28547, 0, 1, 0.01568628, 1,
-0.3718624, 0.6605878, -2.313475, 0, 1, 0.02352941, 1,
-0.3716485, 0.8956787, 0.2307188, 0, 1, 0.02745098, 1,
-0.3703477, 0.5805448, -0.7719464, 0, 1, 0.03529412, 1,
-0.3695935, -0.4962949, -4.159387, 0, 1, 0.03921569, 1,
-0.3688732, -0.2328621, -2.956143, 0, 1, 0.04705882, 1,
-0.3624105, 1.290477, -0.1317412, 0, 1, 0.05098039, 1,
-0.3623879, 0.950896, 0.2647527, 0, 1, 0.05882353, 1,
-0.3617592, -0.6602447, -3.210655, 0, 1, 0.0627451, 1,
-0.3564841, -0.7717312, -2.945927, 0, 1, 0.07058824, 1,
-0.347344, -0.588841, -3.108843, 0, 1, 0.07450981, 1,
-0.3466627, 2.435503, -0.5037791, 0, 1, 0.08235294, 1,
-0.3456473, -0.7922393, -2.46016, 0, 1, 0.08627451, 1,
-0.3400929, -1.119315, -2.976233, 0, 1, 0.09411765, 1,
-0.3400703, 0.3190666, -0.01857255, 0, 1, 0.1019608, 1,
-0.3398922, -0.5685768, -2.39712, 0, 1, 0.1058824, 1,
-0.3339722, 0.01472021, -1.145381, 0, 1, 0.1137255, 1,
-0.3309745, 0.8995092, 0.2176723, 0, 1, 0.1176471, 1,
-0.329716, 0.2165661, -1.637798, 0, 1, 0.1254902, 1,
-0.3271055, 0.02042614, -1.339087, 0, 1, 0.1294118, 1,
-0.3239868, -0.3544025, -1.97283, 0, 1, 0.1372549, 1,
-0.3221511, 0.715734, 0.3634233, 0, 1, 0.1411765, 1,
-0.3198771, 0.8185263, -1.323074, 0, 1, 0.1490196, 1,
-0.3179043, 0.1905186, 0.1775382, 0, 1, 0.1529412, 1,
-0.3144498, -0.6015735, -3.65732, 0, 1, 0.1607843, 1,
-0.3144301, -0.05662961, -1.034279, 0, 1, 0.1647059, 1,
-0.3142318, 0.6418056, -0.07677627, 0, 1, 0.172549, 1,
-0.3129993, 0.6262029, -0.6023656, 0, 1, 0.1764706, 1,
-0.3103263, -0.705919, -0.9216367, 0, 1, 0.1843137, 1,
-0.3090864, -1.688424, -4.077907, 0, 1, 0.1882353, 1,
-0.3064616, -1.153659, -4.994642, 0, 1, 0.1960784, 1,
-0.3052715, -0.7805098, -2.241343, 0, 1, 0.2039216, 1,
-0.298576, -0.6231786, -2.344148, 0, 1, 0.2078431, 1,
-0.2966778, -0.1628806, -2.760204, 0, 1, 0.2156863, 1,
-0.2946845, -1.682226, -2.897166, 0, 1, 0.2196078, 1,
-0.2919475, -1.318221, -2.834289, 0, 1, 0.227451, 1,
-0.289238, 1.513986, 0.3208254, 0, 1, 0.2313726, 1,
-0.288268, 0.447167, -0.9052379, 0, 1, 0.2392157, 1,
-0.2846164, 0.2087358, -2.039733, 0, 1, 0.2431373, 1,
-0.2791325, -1.603556, -1.61073, 0, 1, 0.2509804, 1,
-0.2779233, 0.09685177, -2.27231, 0, 1, 0.254902, 1,
-0.2764113, -0.3629732, -2.248217, 0, 1, 0.2627451, 1,
-0.2763785, -0.08274021, -0.4985539, 0, 1, 0.2666667, 1,
-0.2699532, 0.9010285, 0.1731326, 0, 1, 0.2745098, 1,
-0.2690028, 1.25539, 0.186363, 0, 1, 0.2784314, 1,
-0.2643976, -0.423714, -4.043941, 0, 1, 0.2862745, 1,
-0.2643939, 0.2289502, -0.8199918, 0, 1, 0.2901961, 1,
-0.2641461, -0.6540502, -3.222346, 0, 1, 0.2980392, 1,
-0.2612943, 0.3988842, 0.8608856, 0, 1, 0.3058824, 1,
-0.2567897, 0.7719927, -1.02086, 0, 1, 0.3098039, 1,
-0.2522889, 0.7103357, 0.465591, 0, 1, 0.3176471, 1,
-0.2477682, -1.032067, -3.268747, 0, 1, 0.3215686, 1,
-0.2472659, 0.870438, -0.7693676, 0, 1, 0.3294118, 1,
-0.2400151, 0.1021486, -0.2213118, 0, 1, 0.3333333, 1,
-0.239046, 0.8106049, -0.3193168, 0, 1, 0.3411765, 1,
-0.237304, 0.7570769, 0.136461, 0, 1, 0.345098, 1,
-0.2333937, 0.9918257, -0.783471, 0, 1, 0.3529412, 1,
-0.2319898, 0.08603796, -0.6579706, 0, 1, 0.3568628, 1,
-0.2318224, 0.3066727, -0.2329413, 0, 1, 0.3647059, 1,
-0.230704, -0.8680627, -3.876737, 0, 1, 0.3686275, 1,
-0.2292771, 0.6218703, 0.3315249, 0, 1, 0.3764706, 1,
-0.2282703, 2.786279, -0.1901921, 0, 1, 0.3803922, 1,
-0.2211705, 0.7063263, -0.09077603, 0, 1, 0.3882353, 1,
-0.2190167, 1.408276, 0.2339124, 0, 1, 0.3921569, 1,
-0.2187574, 0.1496725, -2.098614, 0, 1, 0.4, 1,
-0.209629, 0.4908656, 0.9850251, 0, 1, 0.4078431, 1,
-0.2038171, 0.7285171, -0.2358439, 0, 1, 0.4117647, 1,
-0.2017187, -0.6075181, -4.052726, 0, 1, 0.4196078, 1,
-0.1998244, 0.9719588, 0.2574069, 0, 1, 0.4235294, 1,
-0.199651, 0.7060567, 0.6468701, 0, 1, 0.4313726, 1,
-0.1994053, -0.6166607, -2.995352, 0, 1, 0.4352941, 1,
-0.1992729, 0.6181496, 0.3537776, 0, 1, 0.4431373, 1,
-0.1983077, -0.173223, -2.133312, 0, 1, 0.4470588, 1,
-0.1975156, -0.7718685, -3.620682, 0, 1, 0.454902, 1,
-0.1904747, 0.7571112, 0.9440226, 0, 1, 0.4588235, 1,
-0.1903856, -1.195631, -3.380984, 0, 1, 0.4666667, 1,
-0.1889922, -0.2372906, -1.728605, 0, 1, 0.4705882, 1,
-0.1866666, -0.3710579, -2.360218, 0, 1, 0.4784314, 1,
-0.1861857, -0.9650867, -3.683108, 0, 1, 0.4823529, 1,
-0.18024, -1.133454, -2.657715, 0, 1, 0.4901961, 1,
-0.1798006, 1.141668, 0.4327712, 0, 1, 0.4941176, 1,
-0.1774551, 1.231236, 1.018652, 0, 1, 0.5019608, 1,
-0.1654774, -2.21803, -3.404918, 0, 1, 0.509804, 1,
-0.1650109, -0.06213928, -1.27323, 0, 1, 0.5137255, 1,
-0.1608279, 1.622369, -0.4323763, 0, 1, 0.5215687, 1,
-0.1606645, -1.24624, -2.520225, 0, 1, 0.5254902, 1,
-0.1562643, 0.04458953, -0.6921276, 0, 1, 0.5333334, 1,
-0.1558088, -1.279328, -2.18047, 0, 1, 0.5372549, 1,
-0.1530665, 1.011733, 1.049009, 0, 1, 0.5450981, 1,
-0.1520782, -1.095701, -2.525365, 0, 1, 0.5490196, 1,
-0.1515236, -2.139744, -1.543732, 0, 1, 0.5568628, 1,
-0.1500902, -0.7629729, -4.741797, 0, 1, 0.5607843, 1,
-0.1482407, -1.281243, -3.74712, 0, 1, 0.5686275, 1,
-0.1404516, 1.092151, -0.7448328, 0, 1, 0.572549, 1,
-0.13928, -0.7414262, -3.501733, 0, 1, 0.5803922, 1,
-0.1335093, 2.107231, 0.8660028, 0, 1, 0.5843138, 1,
-0.1293819, 0.9459631, 1.08088, 0, 1, 0.5921569, 1,
-0.1293802, 0.6468169, -2.369847, 0, 1, 0.5960785, 1,
-0.1286223, -0.3581904, -3.166948, 0, 1, 0.6039216, 1,
-0.1231631, -0.1575415, -3.048377, 0, 1, 0.6117647, 1,
-0.1190679, 0.3671532, 0.148188, 0, 1, 0.6156863, 1,
-0.1140315, 0.0843063, -0.08330351, 0, 1, 0.6235294, 1,
-0.1123329, -0.378274, -2.617285, 0, 1, 0.627451, 1,
-0.1121528, 0.7198302, 1.880621, 0, 1, 0.6352941, 1,
-0.1104341, -0.7904009, -1.943674, 0, 1, 0.6392157, 1,
-0.1070142, -0.4254872, -1.357226, 0, 1, 0.6470588, 1,
-0.1055077, 1.659925, 0.7664151, 0, 1, 0.6509804, 1,
-0.1028911, 0.4443785, -0.9772784, 0, 1, 0.6588235, 1,
-0.102046, -0.1669903, -1.859828, 0, 1, 0.6627451, 1,
-0.1016797, 0.2878852, 0.281426, 0, 1, 0.6705883, 1,
-0.09668347, 0.674405, -1.593681, 0, 1, 0.6745098, 1,
-0.09568861, -0.02357097, -1.442809, 0, 1, 0.682353, 1,
-0.08652595, -0.4595464, -3.081258, 0, 1, 0.6862745, 1,
-0.08398904, -0.4418764, -2.829539, 0, 1, 0.6941177, 1,
-0.08290881, -0.1889179, -2.107283, 0, 1, 0.7019608, 1,
-0.07996886, -0.3795851, -3.609992, 0, 1, 0.7058824, 1,
-0.07856523, -0.806923, -3.003515, 0, 1, 0.7137255, 1,
-0.07612582, -1.26147, -3.293883, 0, 1, 0.7176471, 1,
-0.07063376, 0.2500342, -0.6372321, 0, 1, 0.7254902, 1,
-0.06928461, 1.890282, -1.227674, 0, 1, 0.7294118, 1,
-0.06763791, -0.9437392, -2.399569, 0, 1, 0.7372549, 1,
-0.06342717, 0.5751972, 1.645962, 0, 1, 0.7411765, 1,
-0.06057731, 0.1209521, 0.7729803, 0, 1, 0.7490196, 1,
-0.06032528, -0.02777201, -1.605595, 0, 1, 0.7529412, 1,
-0.05543914, -0.1143546, -5.340026, 0, 1, 0.7607843, 1,
-0.05191209, 0.761434, -0.5988975, 0, 1, 0.7647059, 1,
-0.0498439, -0.1478168, -3.649962, 0, 1, 0.772549, 1,
-0.04862539, -0.9033604, -5.003313, 0, 1, 0.7764706, 1,
-0.04720983, -0.9182856, -1.163475, 0, 1, 0.7843137, 1,
-0.04593128, 0.3787322, 0.7903444, 0, 1, 0.7882353, 1,
-0.04379189, 0.03434408, -1.774981, 0, 1, 0.7960784, 1,
-0.04254954, 0.6228611, -0.578769, 0, 1, 0.8039216, 1,
-0.0422194, 0.3563134, 0.1538403, 0, 1, 0.8078431, 1,
-0.04061, -0.08717172, -3.283395, 0, 1, 0.8156863, 1,
-0.03507255, 1.298221, -1.088174, 0, 1, 0.8196079, 1,
-0.02846059, 0.7909399, -2.119102, 0, 1, 0.827451, 1,
-0.02746869, -1.429202, -1.6815, 0, 1, 0.8313726, 1,
-0.0248606, 1.365438, 0.3266598, 0, 1, 0.8392157, 1,
-0.02289688, 1.27471, 0.2121211, 0, 1, 0.8431373, 1,
-0.02226186, -0.5945529, -2.015947, 0, 1, 0.8509804, 1,
-0.02087379, -0.5694036, -4.021647, 0, 1, 0.854902, 1,
-0.02077819, 0.288427, -1.403695, 0, 1, 0.8627451, 1,
-0.01868446, 0.6823826, 1.841158, 0, 1, 0.8666667, 1,
-0.01826725, -0.2075395, -3.295323, 0, 1, 0.8745098, 1,
-0.01771341, -0.1340741, -3.219186, 0, 1, 0.8784314, 1,
-0.01606947, 0.3754393, -0.2510696, 0, 1, 0.8862745, 1,
-0.01583868, -0.6180718, -1.586853, 0, 1, 0.8901961, 1,
-0.01403573, -0.1779669, -2.1297, 0, 1, 0.8980392, 1,
-0.01273679, 1.045917, 0.9245582, 0, 1, 0.9058824, 1,
-0.009634385, -1.265544, -4.732468, 0, 1, 0.9098039, 1,
-0.00540682, -1.026391, -3.573384, 0, 1, 0.9176471, 1,
-0.003251977, 0.4419026, -0.3349257, 0, 1, 0.9215686, 1,
-0.003176642, -0.2907965, -4.566312, 0, 1, 0.9294118, 1,
0.001009786, 0.1657094, 1.711335, 0, 1, 0.9333333, 1,
0.001629871, -1.819936, 3.06001, 0, 1, 0.9411765, 1,
0.002242171, -0.2002761, 3.884788, 0, 1, 0.945098, 1,
0.009340614, -0.8933228, 2.996231, 0, 1, 0.9529412, 1,
0.01160163, -0.6325794, 3.971448, 0, 1, 0.9568627, 1,
0.01329041, -1.918218, 3.27075, 0, 1, 0.9647059, 1,
0.0135716, 0.3155211, -1.772283, 0, 1, 0.9686275, 1,
0.0144091, 0.4849666, -0.5015897, 0, 1, 0.9764706, 1,
0.01599879, 2.187144, -0.4806367, 0, 1, 0.9803922, 1,
0.01664861, 0.5590537, 0.7834782, 0, 1, 0.9882353, 1,
0.01892248, -0.04413519, 2.583887, 0, 1, 0.9921569, 1,
0.01934256, -0.2195913, 3.37979, 0, 1, 1, 1,
0.02707502, 0.6009271, 0.9266527, 0, 0.9921569, 1, 1,
0.02760914, -0.5224851, 1.746342, 0, 0.9882353, 1, 1,
0.03229865, -0.1340479, 2.418433, 0, 0.9803922, 1, 1,
0.03250401, 0.8083447, -0.1982354, 0, 0.9764706, 1, 1,
0.03524398, 2.023822, -1.425126, 0, 0.9686275, 1, 1,
0.03541547, 0.5208728, -0.6362367, 0, 0.9647059, 1, 1,
0.03941993, 0.1243659, -0.6394601, 0, 0.9568627, 1, 1,
0.03967741, 1.096808, 0.5891786, 0, 0.9529412, 1, 1,
0.04004516, 0.8606236, -0.1594324, 0, 0.945098, 1, 1,
0.04406533, -1.039504, 3.149848, 0, 0.9411765, 1, 1,
0.04428788, 0.8328608, -0.7170045, 0, 0.9333333, 1, 1,
0.0469524, -0.6735639, 3.419269, 0, 0.9294118, 1, 1,
0.05173704, 0.0782655, -2.777989, 0, 0.9215686, 1, 1,
0.05855723, 1.240139, -0.9796615, 0, 0.9176471, 1, 1,
0.05868808, -0.3068245, 3.835369, 0, 0.9098039, 1, 1,
0.05898477, 1.444944, 0.9401268, 0, 0.9058824, 1, 1,
0.05973496, 2.249044, 1.270938, 0, 0.8980392, 1, 1,
0.06225831, 0.1206223, -0.1995096, 0, 0.8901961, 1, 1,
0.06450777, -1.689451, 5.307353, 0, 0.8862745, 1, 1,
0.06750324, -0.2538739, 0.6019357, 0, 0.8784314, 1, 1,
0.06842002, 0.3369525, -1.09494, 0, 0.8745098, 1, 1,
0.06853592, -1.123225, 3.722155, 0, 0.8666667, 1, 1,
0.07191703, -0.6701391, 1.508005, 0, 0.8627451, 1, 1,
0.07343879, -1.402544, 2.465182, 0, 0.854902, 1, 1,
0.07597253, 1.486534, 0.4769863, 0, 0.8509804, 1, 1,
0.07641342, -0.6668936, 4.528695, 0, 0.8431373, 1, 1,
0.07811301, -0.1261634, 3.186342, 0, 0.8392157, 1, 1,
0.07837255, 0.1643837, 0.2844263, 0, 0.8313726, 1, 1,
0.07845557, 0.1849819, 2.003534, 0, 0.827451, 1, 1,
0.07846415, -1.138144, 3.605522, 0, 0.8196079, 1, 1,
0.08129527, 0.2106921, -0.6569461, 0, 0.8156863, 1, 1,
0.0821086, -0.1959513, 0.8530641, 0, 0.8078431, 1, 1,
0.08374792, -1.98204, 3.850643, 0, 0.8039216, 1, 1,
0.08460781, 1.231128, 0.9962699, 0, 0.7960784, 1, 1,
0.08574542, 1.76752, -0.5592296, 0, 0.7882353, 1, 1,
0.08651023, -1.354045, 2.057764, 0, 0.7843137, 1, 1,
0.08793112, 0.769908, 1.701514, 0, 0.7764706, 1, 1,
0.09187069, -1.406416, 3.259858, 0, 0.772549, 1, 1,
0.0931934, 1.572483, -0.9483045, 0, 0.7647059, 1, 1,
0.09338973, 1.12841, -0.2842144, 0, 0.7607843, 1, 1,
0.1011375, -0.4132518, 2.8311, 0, 0.7529412, 1, 1,
0.101871, -0.3537935, 2.527035, 0, 0.7490196, 1, 1,
0.1040701, -1.746678, 5.461049, 0, 0.7411765, 1, 1,
0.1045518, -1.757411, 2.370693, 0, 0.7372549, 1, 1,
0.1095255, -1.048504, 2.673763, 0, 0.7294118, 1, 1,
0.1099836, -1.633713, 2.772806, 0, 0.7254902, 1, 1,
0.1175577, 0.9717236, -0.4093809, 0, 0.7176471, 1, 1,
0.1183432, 2.162973, -0.7842999, 0, 0.7137255, 1, 1,
0.1215954, 0.8846399, -0.2580644, 0, 0.7058824, 1, 1,
0.1217617, -0.8848885, 2.87146, 0, 0.6980392, 1, 1,
0.1232869, -0.2078843, 4.488245, 0, 0.6941177, 1, 1,
0.1248128, -1.726035, 2.263143, 0, 0.6862745, 1, 1,
0.1315908, 0.8990576, 1.22133, 0, 0.682353, 1, 1,
0.1323993, 1.163258, -0.9689311, 0, 0.6745098, 1, 1,
0.1324892, 0.567504, -1.020219, 0, 0.6705883, 1, 1,
0.1331648, -0.6600043, 2.735037, 0, 0.6627451, 1, 1,
0.1352922, 0.1845997, 0.6784066, 0, 0.6588235, 1, 1,
0.1359005, 0.3469229, -0.002284854, 0, 0.6509804, 1, 1,
0.1391115, 1.372872, 4.327602, 0, 0.6470588, 1, 1,
0.1404443, 1.042468, 0.6576862, 0, 0.6392157, 1, 1,
0.1418116, -0.6803254, 3.841364, 0, 0.6352941, 1, 1,
0.1429524, -0.02289982, 4.562673, 0, 0.627451, 1, 1,
0.1447009, -0.9271786, 4.580082, 0, 0.6235294, 1, 1,
0.1475323, -0.587329, 2.504253, 0, 0.6156863, 1, 1,
0.1518825, 0.1797702, -0.2307799, 0, 0.6117647, 1, 1,
0.1529988, 0.7360212, -0.5517845, 0, 0.6039216, 1, 1,
0.1538107, -0.2314521, 1.888951, 0, 0.5960785, 1, 1,
0.1543721, 0.3356686, -0.0001502289, 0, 0.5921569, 1, 1,
0.1600503, -0.8497908, 0.7112245, 0, 0.5843138, 1, 1,
0.1613109, 0.6682821, -0.006283635, 0, 0.5803922, 1, 1,
0.1625626, -1.720838, 0.5792043, 0, 0.572549, 1, 1,
0.1657259, 0.9305941, -1.148503, 0, 0.5686275, 1, 1,
0.1683987, -0.8080699, 4.560886, 0, 0.5607843, 1, 1,
0.1691398, 1.600249, -0.5050252, 0, 0.5568628, 1, 1,
0.1732662, 0.5482444, -0.05516602, 0, 0.5490196, 1, 1,
0.1740403, -0.16025, 2.269427, 0, 0.5450981, 1, 1,
0.1837891, -0.6147435, 3.269912, 0, 0.5372549, 1, 1,
0.1851226, -0.06371183, 0.949737, 0, 0.5333334, 1, 1,
0.190011, -0.660419, 2.374799, 0, 0.5254902, 1, 1,
0.1968405, -0.3272429, 2.650353, 0, 0.5215687, 1, 1,
0.1974899, 0.933759, 0.1003933, 0, 0.5137255, 1, 1,
0.1980406, 1.196116, 2.820933, 0, 0.509804, 1, 1,
0.198385, -0.9168248, 2.91055, 0, 0.5019608, 1, 1,
0.200242, -0.4274028, 1.859072, 0, 0.4941176, 1, 1,
0.2035257, -1.333727, 2.618814, 0, 0.4901961, 1, 1,
0.2042762, -1.527119, 4.109643, 0, 0.4823529, 1, 1,
0.2064709, -0.8031757, 2.662437, 0, 0.4784314, 1, 1,
0.2071542, -0.2022543, 3.420423, 0, 0.4705882, 1, 1,
0.2082107, 0.20122, -0.9056717, 0, 0.4666667, 1, 1,
0.2122821, -0.2678284, 3.373245, 0, 0.4588235, 1, 1,
0.2125614, 0.4366686, -1.491112, 0, 0.454902, 1, 1,
0.2166916, -1.060487, 3.826128, 0, 0.4470588, 1, 1,
0.2171865, -0.4030994, 4.812845, 0, 0.4431373, 1, 1,
0.2177212, -0.2935681, 2.638015, 0, 0.4352941, 1, 1,
0.2183835, -0.4913332, 2.919679, 0, 0.4313726, 1, 1,
0.2196731, 0.2821249, -0.0255923, 0, 0.4235294, 1, 1,
0.2220839, 1.069042, -0.7205626, 0, 0.4196078, 1, 1,
0.2223689, 1.659086, 0.6713898, 0, 0.4117647, 1, 1,
0.2240249, 0.687048, 1.773523, 0, 0.4078431, 1, 1,
0.2257934, -0.2323699, 2.78086, 0, 0.4, 1, 1,
0.2264517, 1.132129, 0.1742471, 0, 0.3921569, 1, 1,
0.2275685, -0.02421505, 3.458123, 0, 0.3882353, 1, 1,
0.22876, 0.01460167, 1.921841, 0, 0.3803922, 1, 1,
0.2304855, -1.025215, 3.2394, 0, 0.3764706, 1, 1,
0.2349335, -0.2566527, 2.425678, 0, 0.3686275, 1, 1,
0.2414834, 1.291258, -1.30087, 0, 0.3647059, 1, 1,
0.2441851, -1.351165, 2.75423, 0, 0.3568628, 1, 1,
0.2444354, -2.557009, 2.776197, 0, 0.3529412, 1, 1,
0.2449508, 0.5462726, -0.1681909, 0, 0.345098, 1, 1,
0.2466732, 0.3710742, 0.9509444, 0, 0.3411765, 1, 1,
0.2489612, 0.3803498, 0.3828041, 0, 0.3333333, 1, 1,
0.2506057, -1.313296, 3.720262, 0, 0.3294118, 1, 1,
0.2594236, 0.0001041738, 0.7555246, 0, 0.3215686, 1, 1,
0.2604182, -0.518332, 3.712054, 0, 0.3176471, 1, 1,
0.2627055, 0.5402548, 2.275725, 0, 0.3098039, 1, 1,
0.263052, 0.5128365, 1.751995, 0, 0.3058824, 1, 1,
0.2634317, -0.8627335, 3.735257, 0, 0.2980392, 1, 1,
0.26616, 0.03869512, 0.4577737, 0, 0.2901961, 1, 1,
0.2724053, 1.793255, 0.5372809, 0, 0.2862745, 1, 1,
0.2777986, 1.002047, 0.3285877, 0, 0.2784314, 1, 1,
0.2791013, 0.4641937, -0.4162255, 0, 0.2745098, 1, 1,
0.2801319, -0.1455337, 3.219344, 0, 0.2666667, 1, 1,
0.2817658, -3.083905, 4.314871, 0, 0.2627451, 1, 1,
0.2847242, 0.144966, 0.8365431, 0, 0.254902, 1, 1,
0.2853054, 0.8594132, 1.908567, 0, 0.2509804, 1, 1,
0.2854753, 0.6190544, -1.192199, 0, 0.2431373, 1, 1,
0.2957675, 0.7498504, 1.533289, 0, 0.2392157, 1, 1,
0.2988147, -0.5266976, 3.472308, 0, 0.2313726, 1, 1,
0.2992109, -0.06633723, 1.18772, 0, 0.227451, 1, 1,
0.3042958, -0.42858, 2.384892, 0, 0.2196078, 1, 1,
0.3076482, -0.8237338, 3.413918, 0, 0.2156863, 1, 1,
0.3131172, -0.6718924, 3.02957, 0, 0.2078431, 1, 1,
0.323814, -0.03383211, 0.4953911, 0, 0.2039216, 1, 1,
0.3238475, 0.6952987, 0.6191924, 0, 0.1960784, 1, 1,
0.3238957, -1.361881, 2.04436, 0, 0.1882353, 1, 1,
0.3240009, -0.616845, 3.151632, 0, 0.1843137, 1, 1,
0.3241454, -0.401433, 3.795384, 0, 0.1764706, 1, 1,
0.3242015, -0.6097652, 2.411764, 0, 0.172549, 1, 1,
0.3256741, -0.06688291, 1.65807, 0, 0.1647059, 1, 1,
0.3275613, -0.2806762, 2.053227, 0, 0.1607843, 1, 1,
0.333432, 0.7184845, 0.6040545, 0, 0.1529412, 1, 1,
0.3352354, 0.1982287, -0.2560222, 0, 0.1490196, 1, 1,
0.3377092, 1.330439, 1.320302, 0, 0.1411765, 1, 1,
0.3396342, 1.24827, -0.0002060373, 0, 0.1372549, 1, 1,
0.3397713, 0.8347745, -1.668008, 0, 0.1294118, 1, 1,
0.3408128, -1.017141, 1.158718, 0, 0.1254902, 1, 1,
0.3444816, -0.2665723, 2.188199, 0, 0.1176471, 1, 1,
0.3476142, 0.1924292, 0.09432365, 0, 0.1137255, 1, 1,
0.3545097, -1.426743, 2.106841, 0, 0.1058824, 1, 1,
0.3566196, 1.269725, 1.123037, 0, 0.09803922, 1, 1,
0.3574272, -1.30318, 3.157151, 0, 0.09411765, 1, 1,
0.3612834, 0.109427, 1.553678, 0, 0.08627451, 1, 1,
0.3697209, -1.30398, 3.505844, 0, 0.08235294, 1, 1,
0.3735023, 1.038882, -1.100493, 0, 0.07450981, 1, 1,
0.3738987, -0.02851111, 2.059746, 0, 0.07058824, 1, 1,
0.3761534, 0.3435307, 0.2331603, 0, 0.0627451, 1, 1,
0.3764271, 0.512591, 0.2138982, 0, 0.05882353, 1, 1,
0.3772452, -2.12708, 2.575876, 0, 0.05098039, 1, 1,
0.3777679, -0.009536091, 0.9932687, 0, 0.04705882, 1, 1,
0.383695, 2.605981, 1.856082, 0, 0.03921569, 1, 1,
0.3870681, 0.9738148, 0.5980124, 0, 0.03529412, 1, 1,
0.3876803, -1.044034, 3.700966, 0, 0.02745098, 1, 1,
0.3889709, 0.7319007, -0.07253439, 0, 0.02352941, 1, 1,
0.3897218, -1.189353, 4.014632, 0, 0.01568628, 1, 1,
0.3902901, 0.4062092, 0.8428454, 0, 0.01176471, 1, 1,
0.3907405, 1.017088, -0.5595829, 0, 0.003921569, 1, 1,
0.4004746, -0.7579236, 1.983541, 0.003921569, 0, 1, 1,
0.403298, -0.1710159, 2.692745, 0.007843138, 0, 1, 1,
0.4038112, 1.288112, 0.01591752, 0.01568628, 0, 1, 1,
0.406722, 0.6465464, 0.03766594, 0.01960784, 0, 1, 1,
0.4076314, -0.217684, 0.8621259, 0.02745098, 0, 1, 1,
0.4130256, -0.6219099, 3.007771, 0.03137255, 0, 1, 1,
0.4147574, -0.555088, 3.081281, 0.03921569, 0, 1, 1,
0.4152465, 0.2632061, 0.6670418, 0.04313726, 0, 1, 1,
0.4152977, -2.355756, 3.557089, 0.05098039, 0, 1, 1,
0.4171157, -0.6405282, 1.466706, 0.05490196, 0, 1, 1,
0.4171367, -0.4720637, 3.593456, 0.0627451, 0, 1, 1,
0.4179356, -0.4834003, 2.228023, 0.06666667, 0, 1, 1,
0.4184514, 0.004120538, 0.8014216, 0.07450981, 0, 1, 1,
0.4235269, 1.170508, 2.386595, 0.07843138, 0, 1, 1,
0.4268342, 0.4437883, 0.2409708, 0.08627451, 0, 1, 1,
0.429107, 0.05983475, 3.029593, 0.09019608, 0, 1, 1,
0.4291904, 1.446893, -1.147899, 0.09803922, 0, 1, 1,
0.4332671, 0.03990763, 0.6556609, 0.1058824, 0, 1, 1,
0.4342121, -0.6767629, 3.585531, 0.1098039, 0, 1, 1,
0.4354018, -0.4283151, 3.160488, 0.1176471, 0, 1, 1,
0.4354295, 0.9506107, 0.7719138, 0.1215686, 0, 1, 1,
0.4396861, -0.09669158, 0.8187469, 0.1294118, 0, 1, 1,
0.440406, 0.05793048, 2.031637, 0.1333333, 0, 1, 1,
0.4414399, -2.351036, 2.42713, 0.1411765, 0, 1, 1,
0.4477115, -0.03496698, 0.7807091, 0.145098, 0, 1, 1,
0.449034, 0.8924836, 1.499782, 0.1529412, 0, 1, 1,
0.4505253, 0.7380134, 0.6793465, 0.1568628, 0, 1, 1,
0.4506548, 0.4087312, 1.664312, 0.1647059, 0, 1, 1,
0.4542561, 1.43653, 0.1408232, 0.1686275, 0, 1, 1,
0.4569996, 1.154122, 0.8593754, 0.1764706, 0, 1, 1,
0.4647161, 0.4871148, -0.2657887, 0.1803922, 0, 1, 1,
0.4647401, -0.3003036, 1.353868, 0.1882353, 0, 1, 1,
0.4717234, 0.2768753, 1.560326, 0.1921569, 0, 1, 1,
0.4735833, -1.614319, 0.9943259, 0.2, 0, 1, 1,
0.4760109, -1.157766, 1.621022, 0.2078431, 0, 1, 1,
0.4761192, -0.9333541, 0.332556, 0.2117647, 0, 1, 1,
0.4803578, 1.062349, 0.2060352, 0.2196078, 0, 1, 1,
0.4829788, -1.580608, 2.860957, 0.2235294, 0, 1, 1,
0.4855777, -0.8950961, 2.791424, 0.2313726, 0, 1, 1,
0.4863784, -1.082047, 1.946332, 0.2352941, 0, 1, 1,
0.4980207, -0.1385468, 0.396022, 0.2431373, 0, 1, 1,
0.501148, 1.805934, -1.623491, 0.2470588, 0, 1, 1,
0.5037966, -0.8623908, 1.115337, 0.254902, 0, 1, 1,
0.5040467, 0.3095076, 2.712228, 0.2588235, 0, 1, 1,
0.5067263, 0.4933931, 0.5988448, 0.2666667, 0, 1, 1,
0.5087896, 0.3098862, 1.119331, 0.2705882, 0, 1, 1,
0.5088814, -1.776827, 2.503522, 0.2784314, 0, 1, 1,
0.5093849, 0.7753681, 1.56434, 0.282353, 0, 1, 1,
0.5135577, -0.6759644, 2.518437, 0.2901961, 0, 1, 1,
0.5173718, -0.6304402, 2.745687, 0.2941177, 0, 1, 1,
0.518896, -0.5175565, 2.506294, 0.3019608, 0, 1, 1,
0.5246733, -0.344933, 1.067479, 0.3098039, 0, 1, 1,
0.5254513, -0.2405248, 2.922473, 0.3137255, 0, 1, 1,
0.5372397, 0.7183458, -0.06429865, 0.3215686, 0, 1, 1,
0.5406718, 1.797883, -1.100086, 0.3254902, 0, 1, 1,
0.5407718, -1.457444, 4.145714, 0.3333333, 0, 1, 1,
0.5412862, -0.9412261, 3.796351, 0.3372549, 0, 1, 1,
0.5441741, 0.6898907, -0.8296294, 0.345098, 0, 1, 1,
0.5443346, 1.069583, -0.2304661, 0.3490196, 0, 1, 1,
0.5453817, -1.08654, 2.305503, 0.3568628, 0, 1, 1,
0.5484335, -0.8796488, 2.42532, 0.3607843, 0, 1, 1,
0.549723, 1.151784, -0.5627803, 0.3686275, 0, 1, 1,
0.5507796, 0.4209816, -0.2965676, 0.372549, 0, 1, 1,
0.5543311, 0.5131876, 0.0845302, 0.3803922, 0, 1, 1,
0.5576764, -1.430363, 2.762764, 0.3843137, 0, 1, 1,
0.5645587, 0.09668465, 0.9103159, 0.3921569, 0, 1, 1,
0.5655575, 1.235043, 0.6706168, 0.3960784, 0, 1, 1,
0.5701489, 0.3678103, 0.8055683, 0.4039216, 0, 1, 1,
0.5731017, -0.9465937, 3.455917, 0.4117647, 0, 1, 1,
0.577064, 2.525138, 0.4266137, 0.4156863, 0, 1, 1,
0.5798044, -0.1733691, 0.502933, 0.4235294, 0, 1, 1,
0.5814155, 1.383613, 1.061927, 0.427451, 0, 1, 1,
0.5826065, 0.4070539, 1.082131, 0.4352941, 0, 1, 1,
0.5849694, 1.189979, -0.01155537, 0.4392157, 0, 1, 1,
0.5872726, 1.861441, 1.104983, 0.4470588, 0, 1, 1,
0.5927275, -0.3731467, 1.417562, 0.4509804, 0, 1, 1,
0.5977414, 0.3375107, 0.7212368, 0.4588235, 0, 1, 1,
0.6032914, -0.5602759, 2.567723, 0.4627451, 0, 1, 1,
0.6061302, -0.07663719, 1.271576, 0.4705882, 0, 1, 1,
0.613249, 0.6596298, 1.060323, 0.4745098, 0, 1, 1,
0.6134779, 0.3489303, 1.540617, 0.4823529, 0, 1, 1,
0.6154051, 0.7212591, 0.4200545, 0.4862745, 0, 1, 1,
0.6182602, -1.817736, 3.305142, 0.4941176, 0, 1, 1,
0.6211093, 0.5889489, 0.2183028, 0.5019608, 0, 1, 1,
0.6293879, 1.694617, 1.180828, 0.5058824, 0, 1, 1,
0.6297584, 1.164028, -0.7366058, 0.5137255, 0, 1, 1,
0.6359848, 0.2529088, 0.2234487, 0.5176471, 0, 1, 1,
0.6427494, 0.02595135, 1.363534, 0.5254902, 0, 1, 1,
0.6440182, 0.3285432, 0.03309204, 0.5294118, 0, 1, 1,
0.6442893, -2.387415, 2.05402, 0.5372549, 0, 1, 1,
0.647036, 0.09037117, 0.2152143, 0.5411765, 0, 1, 1,
0.6482174, 0.40208, 1.127156, 0.5490196, 0, 1, 1,
0.6482574, -0.3568787, 1.618948, 0.5529412, 0, 1, 1,
0.6490887, -1.559829, 2.759079, 0.5607843, 0, 1, 1,
0.6509973, -0.05345322, 1.671101, 0.5647059, 0, 1, 1,
0.6546733, 1.829612, 0.6003826, 0.572549, 0, 1, 1,
0.6555805, 0.9765146, 0.2753181, 0.5764706, 0, 1, 1,
0.6561109, -2.398317, 3.601928, 0.5843138, 0, 1, 1,
0.6586671, -0.4758654, 3.396076, 0.5882353, 0, 1, 1,
0.6619554, -1.037763, 2.976176, 0.5960785, 0, 1, 1,
0.6658602, 0.0251112, 1.176793, 0.6039216, 0, 1, 1,
0.6694243, 0.5518073, 2.181959, 0.6078432, 0, 1, 1,
0.6766052, -1.803327, 1.892718, 0.6156863, 0, 1, 1,
0.6852177, -1.501716, 4.382978, 0.6196079, 0, 1, 1,
0.6860505, 0.9709582, 0.8553145, 0.627451, 0, 1, 1,
0.6863542, -2.28016, 5.938938, 0.6313726, 0, 1, 1,
0.6932595, -0.150479, 1.925528, 0.6392157, 0, 1, 1,
0.697611, -1.339089, 2.678214, 0.6431373, 0, 1, 1,
0.7071968, 1.126963, -1.979078, 0.6509804, 0, 1, 1,
0.7109793, 1.554079, -0.2206431, 0.654902, 0, 1, 1,
0.711155, 1.324722, 0.4362426, 0.6627451, 0, 1, 1,
0.7158689, -0.07489696, 1.886369, 0.6666667, 0, 1, 1,
0.7161548, -2.081754, 0.2414887, 0.6745098, 0, 1, 1,
0.717109, -0.02962127, 2.218576, 0.6784314, 0, 1, 1,
0.7185017, -1.329698, 5.028919, 0.6862745, 0, 1, 1,
0.7187836, 0.7893369, 1.778397, 0.6901961, 0, 1, 1,
0.7190217, -2.137228, 2.88104, 0.6980392, 0, 1, 1,
0.7198845, 0.9182378, 0.6897627, 0.7058824, 0, 1, 1,
0.7216252, 0.1768756, 1.859269, 0.7098039, 0, 1, 1,
0.7237784, 1.884912, 0.8821896, 0.7176471, 0, 1, 1,
0.7246875, -1.332915, 2.40536, 0.7215686, 0, 1, 1,
0.7256843, 0.3739934, 1.566656, 0.7294118, 0, 1, 1,
0.7285794, -1.33407, 3.592769, 0.7333333, 0, 1, 1,
0.7339677, -1.36993, 0.8050457, 0.7411765, 0, 1, 1,
0.736313, -0.2202426, 2.345672, 0.7450981, 0, 1, 1,
0.7366133, 0.1740652, 3.613932, 0.7529412, 0, 1, 1,
0.7404265, -1.17384, 3.976907, 0.7568628, 0, 1, 1,
0.7412848, -0.8851579, 1.238027, 0.7647059, 0, 1, 1,
0.7432804, 0.2557923, 0.5176872, 0.7686275, 0, 1, 1,
0.7451006, 0.5645571, 2.160629, 0.7764706, 0, 1, 1,
0.7465147, -0.4641249, 1.828635, 0.7803922, 0, 1, 1,
0.7506825, -1.635212, 2.224034, 0.7882353, 0, 1, 1,
0.7530467, -0.4018279, 2.819644, 0.7921569, 0, 1, 1,
0.7581928, 0.6705843, 2.298266, 0.8, 0, 1, 1,
0.772016, 0.6276652, 0.6053748, 0.8078431, 0, 1, 1,
0.7801402, -1.246206, 1.845816, 0.8117647, 0, 1, 1,
0.7838626, -0.673138, 0.8889941, 0.8196079, 0, 1, 1,
0.7861729, -0.2557349, 1.728397, 0.8235294, 0, 1, 1,
0.7893105, -0.6345204, 3.934651, 0.8313726, 0, 1, 1,
0.7913937, 1.485889, 1.294248, 0.8352941, 0, 1, 1,
0.7936022, 0.5634283, 0.2214417, 0.8431373, 0, 1, 1,
0.7942479, 1.701924, 2.07289, 0.8470588, 0, 1, 1,
0.8025394, 0.3715908, 1.767, 0.854902, 0, 1, 1,
0.8040082, -1.072483, 1.355722, 0.8588235, 0, 1, 1,
0.8051395, -2.58887, 2.830592, 0.8666667, 0, 1, 1,
0.8061486, 1.246707, 1.370559, 0.8705882, 0, 1, 1,
0.8077666, -0.6737772, -0.7496276, 0.8784314, 0, 1, 1,
0.8101527, 1.35936, 2.927978, 0.8823529, 0, 1, 1,
0.8115039, -0.1795897, 2.588068, 0.8901961, 0, 1, 1,
0.814015, -0.2776788, 1.391075, 0.8941177, 0, 1, 1,
0.8219509, 0.1374051, 2.603343, 0.9019608, 0, 1, 1,
0.8233733, -0.7584909, 2.283724, 0.9098039, 0, 1, 1,
0.8253572, -0.4884428, 1.526829, 0.9137255, 0, 1, 1,
0.8255341, 0.4331855, -0.4748737, 0.9215686, 0, 1, 1,
0.8278219, -0.4965944, 2.039109, 0.9254902, 0, 1, 1,
0.842905, -0.07357159, 1.588159, 0.9333333, 0, 1, 1,
0.8500892, 0.5422357, 1.964042, 0.9372549, 0, 1, 1,
0.8638375, 1.39171, 0.03447481, 0.945098, 0, 1, 1,
0.8640392, 1.639784, 0.5251212, 0.9490196, 0, 1, 1,
0.8654986, -0.263042, 0.8160228, 0.9568627, 0, 1, 1,
0.8684881, -0.5109662, 2.781758, 0.9607843, 0, 1, 1,
0.8724405, 0.1736796, 0.2311738, 0.9686275, 0, 1, 1,
0.87554, 0.679735, 1.270122, 0.972549, 0, 1, 1,
0.8862473, 0.1026496, 3.488148, 0.9803922, 0, 1, 1,
0.8925263, 0.914239, 1.196744, 0.9843137, 0, 1, 1,
0.8950239, -0.3502491, 2.496323, 0.9921569, 0, 1, 1,
0.896126, -0.1237909, 2.226656, 0.9960784, 0, 1, 1,
0.8966928, -0.6962445, 2.236862, 1, 0, 0.9960784, 1,
0.901692, -1.682211, 3.607771, 1, 0, 0.9882353, 1,
0.9044023, 0.8829299, 1.641896, 1, 0, 0.9843137, 1,
0.9092773, -0.0008868656, 1.461216, 1, 0, 0.9764706, 1,
0.9099437, -2.175992, 1.466838, 1, 0, 0.972549, 1,
0.9105638, 1.140945, 1.138379, 1, 0, 0.9647059, 1,
0.9195023, -1.01144, 2.782575, 1, 0, 0.9607843, 1,
0.9212449, 0.3238878, 2.055247, 1, 0, 0.9529412, 1,
0.9264857, -1.764807, 1.530954, 1, 0, 0.9490196, 1,
0.926847, 1.41127, 1.408337, 1, 0, 0.9411765, 1,
0.9276585, 0.5030615, 3.208524, 1, 0, 0.9372549, 1,
0.9343602, 0.2259357, 0.54495, 1, 0, 0.9294118, 1,
0.9378015, -1.419321, 3.532836, 1, 0, 0.9254902, 1,
0.9449064, -0.6452617, 0.8112656, 1, 0, 0.9176471, 1,
0.9532183, -1.383937, 2.499885, 1, 0, 0.9137255, 1,
0.9577366, 1.814478, 0.3561445, 1, 0, 0.9058824, 1,
0.9606432, -1.488625, 3.31662, 1, 0, 0.9019608, 1,
0.9658523, 0.2782621, 1.32854, 1, 0, 0.8941177, 1,
0.971299, 1.045753, 1.995235, 1, 0, 0.8862745, 1,
0.9862282, 0.9626006, 0.4767495, 1, 0, 0.8823529, 1,
0.9888037, 0.5890366, -0.2464235, 1, 0, 0.8745098, 1,
0.9935049, 0.7943226, -0.3948188, 1, 0, 0.8705882, 1,
0.9981048, -0.3137094, 1.236032, 1, 0, 0.8627451, 1,
1.003892, 0.4942655, 2.902264, 1, 0, 0.8588235, 1,
1.011517, 1.560852, 2.089998, 1, 0, 0.8509804, 1,
1.014681, 1.15159, 1.403949, 1, 0, 0.8470588, 1,
1.015246, 1.119513, 1.75556, 1, 0, 0.8392157, 1,
1.016213, -0.05815627, 2.606216, 1, 0, 0.8352941, 1,
1.018531, 1.748583, 0.3999324, 1, 0, 0.827451, 1,
1.022924, -0.4401606, 2.484008, 1, 0, 0.8235294, 1,
1.023415, -1.327585, 1.738021, 1, 0, 0.8156863, 1,
1.039939, 1.763673, -0.8383727, 1, 0, 0.8117647, 1,
1.042917, 0.5321748, 0.2071135, 1, 0, 0.8039216, 1,
1.045492, 0.05522005, 1.140399, 1, 0, 0.7960784, 1,
1.048191, -0.3264878, 2.786438, 1, 0, 0.7921569, 1,
1.048848, -1.181296, 0.5766436, 1, 0, 0.7843137, 1,
1.059912, -1.818842, 2.380282, 1, 0, 0.7803922, 1,
1.064011, -1.398006, 2.511443, 1, 0, 0.772549, 1,
1.066267, -0.8236097, 1.897943, 1, 0, 0.7686275, 1,
1.072204, 1.85386, 0.8958948, 1, 0, 0.7607843, 1,
1.073489, 2.238551, -1.42038, 1, 0, 0.7568628, 1,
1.077, -3.541958, 1.905718, 1, 0, 0.7490196, 1,
1.077507, 1.995864, -1.064305, 1, 0, 0.7450981, 1,
1.080352, 0.01072175, 1.544814, 1, 0, 0.7372549, 1,
1.080698, -1.022735, -0.04675403, 1, 0, 0.7333333, 1,
1.084561, 2.542879, 1.151691, 1, 0, 0.7254902, 1,
1.095044, 0.138481, 1.062978, 1, 0, 0.7215686, 1,
1.096708, -0.1216112, 1.987542, 1, 0, 0.7137255, 1,
1.098328, 0.5284135, -0.2581033, 1, 0, 0.7098039, 1,
1.111301, 1.087882, 4.527397, 1, 0, 0.7019608, 1,
1.113551, 0.8688692, -0.6096539, 1, 0, 0.6941177, 1,
1.113652, 0.8733084, 1.514139, 1, 0, 0.6901961, 1,
1.11418, -0.1174797, 1.416201, 1, 0, 0.682353, 1,
1.121989, -0.5858749, 1.542241, 1, 0, 0.6784314, 1,
1.126925, 0.1727819, 2.20461, 1, 0, 0.6705883, 1,
1.127164, -1.068096, 2.092894, 1, 0, 0.6666667, 1,
1.127591, -0.521431, 3.143636, 1, 0, 0.6588235, 1,
1.12999, -0.820276, 0.6279499, 1, 0, 0.654902, 1,
1.132516, -0.2532182, 1.59875, 1, 0, 0.6470588, 1,
1.138613, 1.509928, 1.195263, 1, 0, 0.6431373, 1,
1.14416, -0.07460505, 3.558883, 1, 0, 0.6352941, 1,
1.14533, 0.5863423, 3.128377, 1, 0, 0.6313726, 1,
1.15301, 0.1642006, 1.403487, 1, 0, 0.6235294, 1,
1.159121, -0.008456761, 0.6215857, 1, 0, 0.6196079, 1,
1.166316, 0.7698005, 1.035641, 1, 0, 0.6117647, 1,
1.166918, -0.3062713, 2.558661, 1, 0, 0.6078432, 1,
1.184006, 1.513903, 1.264706, 1, 0, 0.6, 1,
1.186747, -0.3396689, 2.133721, 1, 0, 0.5921569, 1,
1.201601, -1.171491, 1.88439, 1, 0, 0.5882353, 1,
1.204937, 0.4996502, 2.849546, 1, 0, 0.5803922, 1,
1.206621, 0.9318249, 0.8213994, 1, 0, 0.5764706, 1,
1.223796, 1.59722, -0.03264622, 1, 0, 0.5686275, 1,
1.22406, 1.191264, -0.2845312, 1, 0, 0.5647059, 1,
1.230645, -0.2865307, 0.4913878, 1, 0, 0.5568628, 1,
1.236571, 0.5385257, 0.6101034, 1, 0, 0.5529412, 1,
1.244758, -0.1734811, 1.551338, 1, 0, 0.5450981, 1,
1.255738, 0.7775879, 2.801598, 1, 0, 0.5411765, 1,
1.257037, 0.07789776, 1.475212, 1, 0, 0.5333334, 1,
1.264086, -0.6796012, 2.132323, 1, 0, 0.5294118, 1,
1.266479, -1.02336, 3.40353, 1, 0, 0.5215687, 1,
1.277129, -0.9116213, 2.814186, 1, 0, 0.5176471, 1,
1.295878, -1.56125, 0.7404844, 1, 0, 0.509804, 1,
1.296606, -0.1709321, 1.866451, 1, 0, 0.5058824, 1,
1.298094, -1.870991, 3.757225, 1, 0, 0.4980392, 1,
1.300259, 1.937513, -1.339539, 1, 0, 0.4901961, 1,
1.309146, 1.744649, -0.7112186, 1, 0, 0.4862745, 1,
1.318125, -0.3404022, 1.736709, 1, 0, 0.4784314, 1,
1.32265, 0.9508315, 1.742948, 1, 0, 0.4745098, 1,
1.32659, -0.5018055, 1.644373, 1, 0, 0.4666667, 1,
1.350302, -2.092672, 3.374028, 1, 0, 0.4627451, 1,
1.351689, 0.9057878, 0.3617312, 1, 0, 0.454902, 1,
1.361074, 1.198887, 0.5583057, 1, 0, 0.4509804, 1,
1.369356, 0.1856591, 0.8180821, 1, 0, 0.4431373, 1,
1.371153, 0.7126186, 1.461927, 1, 0, 0.4392157, 1,
1.373409, 1.765531, 1.782984, 1, 0, 0.4313726, 1,
1.39552, -1.077994, 2.44615, 1, 0, 0.427451, 1,
1.4044, 0.5974043, 1.148649, 1, 0, 0.4196078, 1,
1.407113, -1.889073, 3.511901, 1, 0, 0.4156863, 1,
1.411256, -1.332871, 1.896666, 1, 0, 0.4078431, 1,
1.412383, 0.7537954, 0.6768491, 1, 0, 0.4039216, 1,
1.416348, -0.8435392, 0.857571, 1, 0, 0.3960784, 1,
1.441443, 0.06249225, 1.413033, 1, 0, 0.3882353, 1,
1.462373, -1.453107, 1.270238, 1, 0, 0.3843137, 1,
1.468855, -0.08039765, 1.346198, 1, 0, 0.3764706, 1,
1.469536, -1.174587, 2.842118, 1, 0, 0.372549, 1,
1.48121, -1.265361, 2.202661, 1, 0, 0.3647059, 1,
1.48376, -0.8805504, 1.982137, 1, 0, 0.3607843, 1,
1.509066, 0.01236934, 0.02017415, 1, 0, 0.3529412, 1,
1.510906, 0.852555, 0.1484902, 1, 0, 0.3490196, 1,
1.51876, -1.109123, 1.348852, 1, 0, 0.3411765, 1,
1.518848, 0.8859642, 2.278258, 1, 0, 0.3372549, 1,
1.521067, 0.3325177, 0.1776966, 1, 0, 0.3294118, 1,
1.521735, -0.6626589, 3.213561, 1, 0, 0.3254902, 1,
1.537331, -1.372672, 0.9570105, 1, 0, 0.3176471, 1,
1.564063, 0.7733257, 2.057054, 1, 0, 0.3137255, 1,
1.564216, 0.1579126, -0.06619035, 1, 0, 0.3058824, 1,
1.565065, -0.5072865, 2.392408, 1, 0, 0.2980392, 1,
1.585339, -0.3298329, 1.578097, 1, 0, 0.2941177, 1,
1.58584, 1.224729, 0.6110469, 1, 0, 0.2862745, 1,
1.593124, 0.6976872, 1.290807, 1, 0, 0.282353, 1,
1.604336, 0.8622388, 0.3295256, 1, 0, 0.2745098, 1,
1.60673, 0.2734294, 1.460428, 1, 0, 0.2705882, 1,
1.607979, -0.3088852, 0.6023811, 1, 0, 0.2627451, 1,
1.661226, 1.458053, -1.12559, 1, 0, 0.2588235, 1,
1.689764, -0.7811684, 2.031317, 1, 0, 0.2509804, 1,
1.720621, -0.7031144, 4.019685, 1, 0, 0.2470588, 1,
1.728676, -2.014311, 2.494502, 1, 0, 0.2392157, 1,
1.736621, 0.317637, 0.06804457, 1, 0, 0.2352941, 1,
1.758796, -0.5965474, 1.255384, 1, 0, 0.227451, 1,
1.776491, 0.5428146, 1.378565, 1, 0, 0.2235294, 1,
1.788038, -0.1483034, 1.844961, 1, 0, 0.2156863, 1,
1.794558, -0.4952518, -0.09868152, 1, 0, 0.2117647, 1,
1.810296, 0.8792388, 1.077076, 1, 0, 0.2039216, 1,
1.81104, -0.826924, 3.454886, 1, 0, 0.1960784, 1,
1.82502, 0.2327853, 1.719316, 1, 0, 0.1921569, 1,
1.826487, 0.5601966, 0.889342, 1, 0, 0.1843137, 1,
1.833482, -0.5040218, 1.532528, 1, 0, 0.1803922, 1,
1.847371, -1.142711, 2.478717, 1, 0, 0.172549, 1,
1.855461, -0.2863522, 1.035476, 1, 0, 0.1686275, 1,
1.899693, -0.6621583, 1.649431, 1, 0, 0.1607843, 1,
1.902812, -0.3244008, 2.314748, 1, 0, 0.1568628, 1,
1.954872, 0.8785658, 1.177415, 1, 0, 0.1490196, 1,
1.972334, 0.08440653, 2.235198, 1, 0, 0.145098, 1,
1.973682, 0.1988428, 1.907303, 1, 0, 0.1372549, 1,
1.989326, -0.06928919, -0.1405034, 1, 0, 0.1333333, 1,
1.995683, -1.613305, 2.081076, 1, 0, 0.1254902, 1,
1.997713, 1.206679, 0.7056487, 1, 0, 0.1215686, 1,
2.000956, -0.05321155, 2.100004, 1, 0, 0.1137255, 1,
2.020541, -0.4478952, 3.561906, 1, 0, 0.1098039, 1,
2.033334, 1.050942, 0.8571907, 1, 0, 0.1019608, 1,
2.051259, -1.732775, 1.217795, 1, 0, 0.09411765, 1,
2.081908, 0.07936317, 2.640097, 1, 0, 0.09019608, 1,
2.083995, 0.4095807, 2.502635, 1, 0, 0.08235294, 1,
2.102722, 1.630744, 0.837429, 1, 0, 0.07843138, 1,
2.104427, 0.3337229, -0.2962993, 1, 0, 0.07058824, 1,
2.271904, -1.302063, 2.030398, 1, 0, 0.06666667, 1,
2.293889, 0.6642411, 0.875481, 1, 0, 0.05882353, 1,
2.381696, 0.2158235, 1.439961, 1, 0, 0.05490196, 1,
2.430256, 1.592085, 0.741855, 1, 0, 0.04705882, 1,
2.532642, -0.2868656, 1.825245, 1, 0, 0.04313726, 1,
2.540925, 0.0599068, 0.2988216, 1, 0, 0.03529412, 1,
2.552655, 0.528275, 3.223493, 1, 0, 0.03137255, 1,
2.690424, 1.128226, 1.321313, 1, 0, 0.02352941, 1,
2.789158, -0.4555549, 0.9434156, 1, 0, 0.01960784, 1,
2.902349, -0.5279202, 2.525934, 1, 0, 0.01176471, 1,
3.098241, 0.296408, 1.521392, 1, 0, 0.007843138, 1
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
-0.396804, -4.614594, -7.251811, 0, -0.5, 0.5, 0.5,
-0.396804, -4.614594, -7.251811, 1, -0.5, 0.5, 0.5,
-0.396804, -4.614594, -7.251811, 1, 1.5, 0.5, 0.5,
-0.396804, -4.614594, -7.251811, 0, 1.5, 0.5, 0.5
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
-5.076669, -0.3778394, -7.251811, 0, -0.5, 0.5, 0.5,
-5.076669, -0.3778394, -7.251811, 1, -0.5, 0.5, 0.5,
-5.076669, -0.3778394, -7.251811, 1, 1.5, 0.5, 0.5,
-5.076669, -0.3778394, -7.251811, 0, 1.5, 0.5, 0.5
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
-5.076669, -4.614594, 0.2994556, 0, -0.5, 0.5, 0.5,
-5.076669, -4.614594, 0.2994556, 1, -0.5, 0.5, 0.5,
-5.076669, -4.614594, 0.2994556, 1, 1.5, 0.5, 0.5,
-5.076669, -4.614594, 0.2994556, 0, 1.5, 0.5, 0.5
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
-3, -3.636882, -5.509211,
3, -3.636882, -5.509211,
-3, -3.636882, -5.509211,
-3, -3.799834, -5.799644,
-2, -3.636882, -5.509211,
-2, -3.799834, -5.799644,
-1, -3.636882, -5.509211,
-1, -3.799834, -5.799644,
0, -3.636882, -5.509211,
0, -3.799834, -5.799644,
1, -3.636882, -5.509211,
1, -3.799834, -5.799644,
2, -3.636882, -5.509211,
2, -3.799834, -5.799644,
3, -3.636882, -5.509211,
3, -3.799834, -5.799644
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
-3, -4.125738, -6.380511, 0, -0.5, 0.5, 0.5,
-3, -4.125738, -6.380511, 1, -0.5, 0.5, 0.5,
-3, -4.125738, -6.380511, 1, 1.5, 0.5, 0.5,
-3, -4.125738, -6.380511, 0, 1.5, 0.5, 0.5,
-2, -4.125738, -6.380511, 0, -0.5, 0.5, 0.5,
-2, -4.125738, -6.380511, 1, -0.5, 0.5, 0.5,
-2, -4.125738, -6.380511, 1, 1.5, 0.5, 0.5,
-2, -4.125738, -6.380511, 0, 1.5, 0.5, 0.5,
-1, -4.125738, -6.380511, 0, -0.5, 0.5, 0.5,
-1, -4.125738, -6.380511, 1, -0.5, 0.5, 0.5,
-1, -4.125738, -6.380511, 1, 1.5, 0.5, 0.5,
-1, -4.125738, -6.380511, 0, 1.5, 0.5, 0.5,
0, -4.125738, -6.380511, 0, -0.5, 0.5, 0.5,
0, -4.125738, -6.380511, 1, -0.5, 0.5, 0.5,
0, -4.125738, -6.380511, 1, 1.5, 0.5, 0.5,
0, -4.125738, -6.380511, 0, 1.5, 0.5, 0.5,
1, -4.125738, -6.380511, 0, -0.5, 0.5, 0.5,
1, -4.125738, -6.380511, 1, -0.5, 0.5, 0.5,
1, -4.125738, -6.380511, 1, 1.5, 0.5, 0.5,
1, -4.125738, -6.380511, 0, 1.5, 0.5, 0.5,
2, -4.125738, -6.380511, 0, -0.5, 0.5, 0.5,
2, -4.125738, -6.380511, 1, -0.5, 0.5, 0.5,
2, -4.125738, -6.380511, 1, 1.5, 0.5, 0.5,
2, -4.125738, -6.380511, 0, 1.5, 0.5, 0.5,
3, -4.125738, -6.380511, 0, -0.5, 0.5, 0.5,
3, -4.125738, -6.380511, 1, -0.5, 0.5, 0.5,
3, -4.125738, -6.380511, 1, 1.5, 0.5, 0.5,
3, -4.125738, -6.380511, 0, 1.5, 0.5, 0.5
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
-3.9967, -3, -5.509211,
-3.9967, 2, -5.509211,
-3.9967, -3, -5.509211,
-4.176695, -3, -5.799644,
-3.9967, -2, -5.509211,
-4.176695, -2, -5.799644,
-3.9967, -1, -5.509211,
-4.176695, -1, -5.799644,
-3.9967, 0, -5.509211,
-4.176695, 0, -5.799644,
-3.9967, 1, -5.509211,
-4.176695, 1, -5.799644,
-3.9967, 2, -5.509211,
-4.176695, 2, -5.799644
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
-4.536685, -3, -6.380511, 0, -0.5, 0.5, 0.5,
-4.536685, -3, -6.380511, 1, -0.5, 0.5, 0.5,
-4.536685, -3, -6.380511, 1, 1.5, 0.5, 0.5,
-4.536685, -3, -6.380511, 0, 1.5, 0.5, 0.5,
-4.536685, -2, -6.380511, 0, -0.5, 0.5, 0.5,
-4.536685, -2, -6.380511, 1, -0.5, 0.5, 0.5,
-4.536685, -2, -6.380511, 1, 1.5, 0.5, 0.5,
-4.536685, -2, -6.380511, 0, 1.5, 0.5, 0.5,
-4.536685, -1, -6.380511, 0, -0.5, 0.5, 0.5,
-4.536685, -1, -6.380511, 1, -0.5, 0.5, 0.5,
-4.536685, -1, -6.380511, 1, 1.5, 0.5, 0.5,
-4.536685, -1, -6.380511, 0, 1.5, 0.5, 0.5,
-4.536685, 0, -6.380511, 0, -0.5, 0.5, 0.5,
-4.536685, 0, -6.380511, 1, -0.5, 0.5, 0.5,
-4.536685, 0, -6.380511, 1, 1.5, 0.5, 0.5,
-4.536685, 0, -6.380511, 0, 1.5, 0.5, 0.5,
-4.536685, 1, -6.380511, 0, -0.5, 0.5, 0.5,
-4.536685, 1, -6.380511, 1, -0.5, 0.5, 0.5,
-4.536685, 1, -6.380511, 1, 1.5, 0.5, 0.5,
-4.536685, 1, -6.380511, 0, 1.5, 0.5, 0.5,
-4.536685, 2, -6.380511, 0, -0.5, 0.5, 0.5,
-4.536685, 2, -6.380511, 1, -0.5, 0.5, 0.5,
-4.536685, 2, -6.380511, 1, 1.5, 0.5, 0.5,
-4.536685, 2, -6.380511, 0, 1.5, 0.5, 0.5
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
-3.9967, -3.636882, -4,
-3.9967, -3.636882, 4,
-3.9967, -3.636882, -4,
-4.176695, -3.799834, -4,
-3.9967, -3.636882, -2,
-4.176695, -3.799834, -2,
-3.9967, -3.636882, 0,
-4.176695, -3.799834, 0,
-3.9967, -3.636882, 2,
-4.176695, -3.799834, 2,
-3.9967, -3.636882, 4,
-4.176695, -3.799834, 4
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
-4.536685, -4.125738, -4, 0, -0.5, 0.5, 0.5,
-4.536685, -4.125738, -4, 1, -0.5, 0.5, 0.5,
-4.536685, -4.125738, -4, 1, 1.5, 0.5, 0.5,
-4.536685, -4.125738, -4, 0, 1.5, 0.5, 0.5,
-4.536685, -4.125738, -2, 0, -0.5, 0.5, 0.5,
-4.536685, -4.125738, -2, 1, -0.5, 0.5, 0.5,
-4.536685, -4.125738, -2, 1, 1.5, 0.5, 0.5,
-4.536685, -4.125738, -2, 0, 1.5, 0.5, 0.5,
-4.536685, -4.125738, 0, 0, -0.5, 0.5, 0.5,
-4.536685, -4.125738, 0, 1, -0.5, 0.5, 0.5,
-4.536685, -4.125738, 0, 1, 1.5, 0.5, 0.5,
-4.536685, -4.125738, 0, 0, 1.5, 0.5, 0.5,
-4.536685, -4.125738, 2, 0, -0.5, 0.5, 0.5,
-4.536685, -4.125738, 2, 1, -0.5, 0.5, 0.5,
-4.536685, -4.125738, 2, 1, 1.5, 0.5, 0.5,
-4.536685, -4.125738, 2, 0, 1.5, 0.5, 0.5,
-4.536685, -4.125738, 4, 0, -0.5, 0.5, 0.5,
-4.536685, -4.125738, 4, 1, -0.5, 0.5, 0.5,
-4.536685, -4.125738, 4, 1, 1.5, 0.5, 0.5,
-4.536685, -4.125738, 4, 0, 1.5, 0.5, 0.5
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
-3.9967, -3.636882, -5.509211,
-3.9967, 2.881203, -5.509211,
-3.9967, -3.636882, 6.108122,
-3.9967, 2.881203, 6.108122,
-3.9967, -3.636882, -5.509211,
-3.9967, -3.636882, 6.108122,
-3.9967, 2.881203, -5.509211,
-3.9967, 2.881203, 6.108122,
-3.9967, -3.636882, -5.509211,
3.203092, -3.636882, -5.509211,
-3.9967, -3.636882, 6.108122,
3.203092, -3.636882, 6.108122,
-3.9967, 2.881203, -5.509211,
3.203092, 2.881203, -5.509211,
-3.9967, 2.881203, 6.108122,
3.203092, 2.881203, 6.108122,
3.203092, -3.636882, -5.509211,
3.203092, 2.881203, -5.509211,
3.203092, -3.636882, 6.108122,
3.203092, 2.881203, 6.108122,
3.203092, -3.636882, -5.509211,
3.203092, -3.636882, 6.108122,
3.203092, 2.881203, -5.509211,
3.203092, 2.881203, 6.108122
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
var radius = 8.085617;
var distance = 35.97382;
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
mvMatrix.translate( 0.396804, 0.3778394, -0.2994556 );
mvMatrix.scale( 1.214247, 1.341242, 0.7525245 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.97382);
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
XMC<-read.table("XMC.xyz")
```

```
## Error in read.table("XMC.xyz"): no lines available in input
```

```r
x<-XMC$V2
```

```
## Error in eval(expr, envir, enclos): object 'XMC' not found
```

```r
y<-XMC$V3
```

```
## Error in eval(expr, envir, enclos): object 'XMC' not found
```

```r
z<-XMC$V4
```

```
## Error in eval(expr, envir, enclos): object 'XMC' not found
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
-3.891849, 0.3270051, -3.328122, 0, 0, 1, 1, 1,
-3.688582, -0.09707899, 0.01823372, 1, 0, 0, 1, 1,
-3.352035, -1.324374, -0.8376219, 1, 0, 0, 1, 1,
-2.973253, 0.2579978, -1.969592, 1, 0, 0, 1, 1,
-2.918426, 1.904104, -1.288726, 1, 0, 0, 1, 1,
-2.827712, 1.392627, -2.560434, 1, 0, 0, 1, 1,
-2.708065, 1.216112, -1.219951, 0, 0, 0, 1, 1,
-2.511378, -0.2452456, -3.131656, 0, 0, 0, 1, 1,
-2.48674, -0.4886402, -3.495388, 0, 0, 0, 1, 1,
-2.467194, -0.2405407, -1.380161, 0, 0, 0, 1, 1,
-2.461036, 2.096494, -1.254907, 0, 0, 0, 1, 1,
-2.422562, 0.9684785, -1.58297, 0, 0, 0, 1, 1,
-2.354734, 1.990295, -1.343176, 0, 0, 0, 1, 1,
-2.217817, 0.04420649, -2.565719, 1, 1, 1, 1, 1,
-2.210513, -2.20494, -2.083074, 1, 1, 1, 1, 1,
-2.10743, -0.05089319, -2.673126, 1, 1, 1, 1, 1,
-2.09801, 0.06146341, -1.579306, 1, 1, 1, 1, 1,
-2.077051, 0.3480195, -0.9738798, 1, 1, 1, 1, 1,
-2.071232, -1.250441, -2.028711, 1, 1, 1, 1, 1,
-2.060694, 0.6476443, -0.795472, 1, 1, 1, 1, 1,
-2.053718, -1.398342, -1.544295, 1, 1, 1, 1, 1,
-2.006665, 0.8150048, -0.7336727, 1, 1, 1, 1, 1,
-1.958231, 1.293141, -0.9312738, 1, 1, 1, 1, 1,
-1.949453, -1.345074, -1.258684, 1, 1, 1, 1, 1,
-1.946541, -0.6377569, -2.321708, 1, 1, 1, 1, 1,
-1.917192, -1.868252, -2.922683, 1, 1, 1, 1, 1,
-1.914978, -1.280398, -3.778896, 1, 1, 1, 1, 1,
-1.905495, -0.1489782, -1.281366, 1, 1, 1, 1, 1,
-1.894527, 1.427778, -0.346524, 0, 0, 1, 1, 1,
-1.871223, -1.933866, -3.722273, 1, 0, 0, 1, 1,
-1.806175, -1.218964, -0.8414367, 1, 0, 0, 1, 1,
-1.803337, 1.25474, -2.701229, 1, 0, 0, 1, 1,
-1.782198, -1.16017, -1.717051, 1, 0, 0, 1, 1,
-1.772043, -2.581159, -1.684832, 1, 0, 0, 1, 1,
-1.756053, 1.220086, -1.134994, 0, 0, 0, 1, 1,
-1.725774, -0.1779518, -0.9917231, 0, 0, 0, 1, 1,
-1.710774, -1.850015, -2.200917, 0, 0, 0, 1, 1,
-1.695487, -0.5335758, -4.428653, 0, 0, 0, 1, 1,
-1.691856, -1.334012, 0.2816981, 0, 0, 0, 1, 1,
-1.689814, 0.4527774, -1.410761, 0, 0, 0, 1, 1,
-1.661505, -0.9241484, 0.5441881, 0, 0, 0, 1, 1,
-1.654222, -1.335205, -1.170398, 1, 1, 1, 1, 1,
-1.631002, 0.6701155, 0.3836208, 1, 1, 1, 1, 1,
-1.612368, 0.6449081, -1.428938, 1, 1, 1, 1, 1,
-1.610838, 0.9307614, -0.2101269, 1, 1, 1, 1, 1,
-1.599383, -0.9486679, -2.617644, 1, 1, 1, 1, 1,
-1.578402, 0.867324, -0.2788856, 1, 1, 1, 1, 1,
-1.569062, 0.3337193, -1.647086, 1, 1, 1, 1, 1,
-1.567262, 0.6600381, -0.1334845, 1, 1, 1, 1, 1,
-1.552992, 0.1780378, -2.442782, 1, 1, 1, 1, 1,
-1.546098, 0.9943676, -0.7997671, 1, 1, 1, 1, 1,
-1.544895, 0.7269146, -0.516488, 1, 1, 1, 1, 1,
-1.544557, -0.01057948, -2.205306, 1, 1, 1, 1, 1,
-1.53315, -0.6315355, -2.576933, 1, 1, 1, 1, 1,
-1.52246, -0.382274, -0.5796017, 1, 1, 1, 1, 1,
-1.513054, 0.03424691, -1.563375, 1, 1, 1, 1, 1,
-1.510867, -0.1090146, -4.090613, 0, 0, 1, 1, 1,
-1.509086, 0.6210592, -1.150634, 1, 0, 0, 1, 1,
-1.497833, 0.9122981, 0.3319912, 1, 0, 0, 1, 1,
-1.482156, -0.82556, -2.173903, 1, 0, 0, 1, 1,
-1.478999, -1.257392, -3.947054, 1, 0, 0, 1, 1,
-1.475542, 1.37459, -1.801423, 1, 0, 0, 1, 1,
-1.474594, -1.581862, -2.813436, 0, 0, 0, 1, 1,
-1.473649, -0.09973432, -3.084748, 0, 0, 0, 1, 1,
-1.46821, 0.7800117, -2.762363, 0, 0, 0, 1, 1,
-1.458227, 1.828677, -1.17657, 0, 0, 0, 1, 1,
-1.442589, 0.4966586, -0.982303, 0, 0, 0, 1, 1,
-1.437236, -0.7681877, -3.561643, 0, 0, 0, 1, 1,
-1.432746, 0.8056342, 0.2884565, 0, 0, 0, 1, 1,
-1.428171, 0.4940786, -1.915469, 1, 1, 1, 1, 1,
-1.426694, -1.399641, -2.513101, 1, 1, 1, 1, 1,
-1.424512, 0.0623903, -1.114617, 1, 1, 1, 1, 1,
-1.419201, 0.8731318, -1.673282, 1, 1, 1, 1, 1,
-1.418977, 0.1324845, -2.491758, 1, 1, 1, 1, 1,
-1.402971, 0.806855, -1.167875, 1, 1, 1, 1, 1,
-1.396075, -2.444903, -3.216616, 1, 1, 1, 1, 1,
-1.388942, -0.4608793, -2.968825, 1, 1, 1, 1, 1,
-1.388512, 1.926973, -0.2752452, 1, 1, 1, 1, 1,
-1.382082, 2.18721, -1.967765, 1, 1, 1, 1, 1,
-1.379525, 2.544931, -0.09648555, 1, 1, 1, 1, 1,
-1.37722, 1.831004, -0.4814615, 1, 1, 1, 1, 1,
-1.364257, -0.9008504, -1.372143, 1, 1, 1, 1, 1,
-1.362356, -1.243625, -1.486579, 1, 1, 1, 1, 1,
-1.356955, 1.810322, -2.014879, 1, 1, 1, 1, 1,
-1.355783, -0.3115036, -2.752174, 0, 0, 1, 1, 1,
-1.352099, 1.351704, -0.5667233, 1, 0, 0, 1, 1,
-1.334709, 1.19137, -1.407246, 1, 0, 0, 1, 1,
-1.333893, -0.2491191, -1.265367, 1, 0, 0, 1, 1,
-1.328052, 0.5302786, -1.429702, 1, 0, 0, 1, 1,
-1.32599, -0.2374983, -1.601817, 1, 0, 0, 1, 1,
-1.325318, 0.4974681, -1.917579, 0, 0, 0, 1, 1,
-1.325011, -2.421093, -3.171963, 0, 0, 0, 1, 1,
-1.299497, 0.9680592, -0.6929539, 0, 0, 0, 1, 1,
-1.296113, -1.140153, -2.502847, 0, 0, 0, 1, 1,
-1.293745, 0.03869881, -1.826141, 0, 0, 0, 1, 1,
-1.286782, 1.575743, -2.244556, 0, 0, 0, 1, 1,
-1.282909, -0.4007459, -3.493365, 0, 0, 0, 1, 1,
-1.281276, 1.430881, -1.324397, 1, 1, 1, 1, 1,
-1.276021, 0.2566475, -2.06766, 1, 1, 1, 1, 1,
-1.275428, 0.1315268, -2.254197, 1, 1, 1, 1, 1,
-1.268588, 0.4600107, -1.466903, 1, 1, 1, 1, 1,
-1.26814, -0.8682417, -3.077976, 1, 1, 1, 1, 1,
-1.263724, -0.2075626, -3.100022, 1, 1, 1, 1, 1,
-1.263709, -0.1317316, 0.1206273, 1, 1, 1, 1, 1,
-1.262143, -0.887503, -2.390838, 1, 1, 1, 1, 1,
-1.259028, 1.423831, -2.056926, 1, 1, 1, 1, 1,
-1.252021, -1.092471, -3.273122, 1, 1, 1, 1, 1,
-1.249699, -1.555757, -2.913725, 1, 1, 1, 1, 1,
-1.248595, 0.3634166, -1.420608, 1, 1, 1, 1, 1,
-1.23875, -0.3418255, -0.7536872, 1, 1, 1, 1, 1,
-1.234381, -0.2610608, -1.797091, 1, 1, 1, 1, 1,
-1.22247, -1.411512, -3.310039, 1, 1, 1, 1, 1,
-1.219566, 0.5212991, -2.749045, 0, 0, 1, 1, 1,
-1.215614, 0.7629842, -0.5533738, 1, 0, 0, 1, 1,
-1.211854, 0.1098916, -2.607361, 1, 0, 0, 1, 1,
-1.209859, -0.9762673, -2.400992, 1, 0, 0, 1, 1,
-1.199814, 0.5717857, -1.03585, 1, 0, 0, 1, 1,
-1.190234, -0.8108401, -2.780955, 1, 0, 0, 1, 1,
-1.187071, -0.6317679, -2.367395, 0, 0, 0, 1, 1,
-1.178895, 0.532566, -0.327256, 0, 0, 0, 1, 1,
-1.169889, 0.4807036, -0.8069643, 0, 0, 0, 1, 1,
-1.166886, 0.6061732, -0.6906894, 0, 0, 0, 1, 1,
-1.165598, 0.1761059, -1.228986, 0, 0, 0, 1, 1,
-1.156104, 0.912414, -1.823494, 0, 0, 0, 1, 1,
-1.151469, 1.192016, 0.0004856872, 0, 0, 0, 1, 1,
-1.14572, 0.5389757, -0.4089326, 1, 1, 1, 1, 1,
-1.137441, 1.68002, 0.1567738, 1, 1, 1, 1, 1,
-1.124036, 1.474916, 0.8842106, 1, 1, 1, 1, 1,
-1.119837, 1.065204, -1.26368, 1, 1, 1, 1, 1,
-1.119366, -0.03108247, -2.136212, 1, 1, 1, 1, 1,
-1.119261, -0.6633126, -2.964644, 1, 1, 1, 1, 1,
-1.115087, -0.3526917, -0.1377316, 1, 1, 1, 1, 1,
-1.112675, 0.9316679, -0.913107, 1, 1, 1, 1, 1,
-1.107813, -1.516191, -1.881532, 1, 1, 1, 1, 1,
-1.098675, -0.4392057, -1.705099, 1, 1, 1, 1, 1,
-1.084112, -0.566022, -2.357102, 1, 1, 1, 1, 1,
-1.082365, 0.4771758, -1.589628, 1, 1, 1, 1, 1,
-1.075046, 0.5485035, -0.1489245, 1, 1, 1, 1, 1,
-1.073369, 0.412405, -1.469826, 1, 1, 1, 1, 1,
-1.072198, 0.2888392, -1.423102, 1, 1, 1, 1, 1,
-1.071823, -0.9683846, -4.22089, 0, 0, 1, 1, 1,
-1.069675, 0.509078, -0.4268501, 1, 0, 0, 1, 1,
-1.069273, 0.1504595, -1.767598, 1, 0, 0, 1, 1,
-1.065843, -0.08757038, -0.5649801, 1, 0, 0, 1, 1,
-1.063781, 2.49303, -0.7375726, 1, 0, 0, 1, 1,
-1.057633, -0.5071188, -3.63894, 1, 0, 0, 1, 1,
-1.056993, 1.310169, -1.571504, 0, 0, 0, 1, 1,
-1.056436, -1.654903, -1.89464, 0, 0, 0, 1, 1,
-1.052114, 0.8065566, -1.475068, 0, 0, 0, 1, 1,
-1.035041, -0.5976611, -1.480938, 0, 0, 0, 1, 1,
-1.034678, 1.786019, -0.3043765, 0, 0, 0, 1, 1,
-1.030141, 1.072324, 0.6355514, 0, 0, 0, 1, 1,
-1.027192, 1.258569, 0.2829742, 0, 0, 0, 1, 1,
-1.024923, -0.8400894, -1.980258, 1, 1, 1, 1, 1,
-1.014343, 0.6700292, -2.809838, 1, 1, 1, 1, 1,
-1.014176, 1.35559, 0.4407069, 1, 1, 1, 1, 1,
-0.9963818, 1.625478, 0.1825261, 1, 1, 1, 1, 1,
-0.995436, -0.1858085, -1.215346, 1, 1, 1, 1, 1,
-0.9929611, 0.3094648, -0.2955469, 1, 1, 1, 1, 1,
-0.9915496, -0.04120196, -1.680793, 1, 1, 1, 1, 1,
-0.9896978, -0.3459385, -0.9593715, 1, 1, 1, 1, 1,
-0.9859142, 1.070372, -1.055516, 1, 1, 1, 1, 1,
-0.9845802, 1.088563, -0.6504486, 1, 1, 1, 1, 1,
-0.9721705, -0.3646413, -2.486723, 1, 1, 1, 1, 1,
-0.9714699, 0.607863, -0.7049473, 1, 1, 1, 1, 1,
-0.971125, 0.06124768, -2.406318, 1, 1, 1, 1, 1,
-0.961468, -1.290537, -3.413106, 1, 1, 1, 1, 1,
-0.9542161, 0.6832396, -0.147123, 1, 1, 1, 1, 1,
-0.9528059, 1.857155, 0.7677639, 0, 0, 1, 1, 1,
-0.9503373, 1.998783, -2.206309, 1, 0, 0, 1, 1,
-0.9488248, -0.0572108, -2.548969, 1, 0, 0, 1, 1,
-0.9440784, -1.247866, -2.702562, 1, 0, 0, 1, 1,
-0.9434781, 0.7734736, -0.881779, 1, 0, 0, 1, 1,
-0.9433475, -0.5425568, -1.986174, 1, 0, 0, 1, 1,
-0.9429097, -1.124475, -2.656233, 0, 0, 0, 1, 1,
-0.9384625, -2.000505, -3.522557, 0, 0, 0, 1, 1,
-0.9356314, 0.6650167, 0.3607216, 0, 0, 0, 1, 1,
-0.9351379, 1.43402, 0.10064, 0, 0, 0, 1, 1,
-0.934981, 0.2393849, -1.24494, 0, 0, 0, 1, 1,
-0.9336264, 1.053303, 0.6912015, 0, 0, 0, 1, 1,
-0.9305697, 0.3777724, -0.868533, 0, 0, 0, 1, 1,
-0.9213625, 1.832384, 0.719368, 1, 1, 1, 1, 1,
-0.9156215, 0.7980756, -0.3392971, 1, 1, 1, 1, 1,
-0.9126936, -0.2391702, -0.4843719, 1, 1, 1, 1, 1,
-0.9113027, 1.596005, 1.301294, 1, 1, 1, 1, 1,
-0.9048947, 0.9395788, -0.5686002, 1, 1, 1, 1, 1,
-0.901496, -2.117609, -3.10311, 1, 1, 1, 1, 1,
-0.8955697, -0.5169612, -3.221183, 1, 1, 1, 1, 1,
-0.8934361, 1.392679, -0.8058614, 1, 1, 1, 1, 1,
-0.8871574, -1.022714, -1.293307, 1, 1, 1, 1, 1,
-0.88696, -0.8846229, -0.6886421, 1, 1, 1, 1, 1,
-0.8865642, 0.6033862, 0.1501426, 1, 1, 1, 1, 1,
-0.8861163, -0.238371, -0.5489249, 1, 1, 1, 1, 1,
-0.876747, 0.720807, -0.5980649, 1, 1, 1, 1, 1,
-0.8764484, -1.087355, -1.874321, 1, 1, 1, 1, 1,
-0.8754767, -0.623113, -1.697623, 1, 1, 1, 1, 1,
-0.8704639, -0.9555598, -3.332873, 0, 0, 1, 1, 1,
-0.8599808, -0.2786385, -1.5032, 1, 0, 0, 1, 1,
-0.857847, 0.8738548, -0.4515268, 1, 0, 0, 1, 1,
-0.8572227, 0.4006513, -0.5542573, 1, 0, 0, 1, 1,
-0.8567606, 0.366072, -0.4279307, 1, 0, 0, 1, 1,
-0.8554772, 0.2158729, -1.471099, 1, 0, 0, 1, 1,
-0.8512035, 0.8938748, -1.619795, 0, 0, 0, 1, 1,
-0.8474395, -0.09205321, -1.23292, 0, 0, 0, 1, 1,
-0.8467271, -0.5522813, -0.2458686, 0, 0, 0, 1, 1,
-0.8450834, 0.5653399, 0.3394477, 0, 0, 0, 1, 1,
-0.8314754, -0.2721555, -0.7044211, 0, 0, 0, 1, 1,
-0.8300195, 1.586022, -1.509093, 0, 0, 0, 1, 1,
-0.8236214, -0.6413306, -2.043548, 0, 0, 0, 1, 1,
-0.8227537, 1.586688, 1.00624, 1, 1, 1, 1, 1,
-0.8210796, 1.187548, -0.2374135, 1, 1, 1, 1, 1,
-0.8194268, 1.55043, -0.5098284, 1, 1, 1, 1, 1,
-0.8091888, 1.239954, -1.195141, 1, 1, 1, 1, 1,
-0.8079094, 0.3166311, -1.686908, 1, 1, 1, 1, 1,
-0.8026905, 1.229234, -0.6020786, 1, 1, 1, 1, 1,
-0.7913629, 0.09465046, -1.534771, 1, 1, 1, 1, 1,
-0.7903835, 0.583347, -0.2083745, 1, 1, 1, 1, 1,
-0.788475, 1.110297, -0.4767937, 1, 1, 1, 1, 1,
-0.7724626, 0.8543276, -1.496482, 1, 1, 1, 1, 1,
-0.7722422, 0.7374838, -0.3078375, 1, 1, 1, 1, 1,
-0.7625933, -0.9358616, -2.196326, 1, 1, 1, 1, 1,
-0.7572571, 1.299185, -0.4223516, 1, 1, 1, 1, 1,
-0.7551374, 0.503976, 0.7060405, 1, 1, 1, 1, 1,
-0.754901, 0.6538833, -0.3672748, 1, 1, 1, 1, 1,
-0.7502437, 0.6753145, -0.02862611, 0, 0, 1, 1, 1,
-0.7430048, 1.185033, -0.688243, 1, 0, 0, 1, 1,
-0.7360271, -0.378234, -2.772129, 1, 0, 0, 1, 1,
-0.7272677, -0.2685844, -1.246445, 1, 0, 0, 1, 1,
-0.7240443, -0.3854915, -1.147638, 1, 0, 0, 1, 1,
-0.7148505, -1.039006, -2.370232, 1, 0, 0, 1, 1,
-0.7139197, 1.57056, 0.8277784, 0, 0, 0, 1, 1,
-0.7095676, 0.3789415, -2.103082, 0, 0, 0, 1, 1,
-0.7084335, 0.2021739, -0.509636, 0, 0, 0, 1, 1,
-0.7057803, -0.1612391, -1.355688, 0, 0, 0, 1, 1,
-0.7036577, -0.1102873, -1.653607, 0, 0, 0, 1, 1,
-0.7014863, 0.04625764, -1.89546, 0, 0, 0, 1, 1,
-0.6976813, 0.02913932, -1.808927, 0, 0, 0, 1, 1,
-0.6946672, 1.360597, -0.7502235, 1, 1, 1, 1, 1,
-0.6903955, 1.093153, -0.1571859, 1, 1, 1, 1, 1,
-0.6899755, 1.468557, 0.4721102, 1, 1, 1, 1, 1,
-0.6814234, -1.120046, -2.834233, 1, 1, 1, 1, 1,
-0.6804237, -0.7502474, -3.685782, 1, 1, 1, 1, 1,
-0.6730989, -0.5299458, -1.650143, 1, 1, 1, 1, 1,
-0.6712465, 1.391797, -0.5017451, 1, 1, 1, 1, 1,
-0.6703689, -0.1753111, -0.9453325, 1, 1, 1, 1, 1,
-0.6688933, 0.05340791, -0.9974521, 1, 1, 1, 1, 1,
-0.6682014, -0.5736799, -2.161253, 1, 1, 1, 1, 1,
-0.6609004, -0.819773, -2.036113, 1, 1, 1, 1, 1,
-0.6557121, 0.5423923, -0.4944602, 1, 1, 1, 1, 1,
-0.6549515, -0.2372731, -0.1785241, 1, 1, 1, 1, 1,
-0.6477603, 0.04981197, -1.871163, 1, 1, 1, 1, 1,
-0.6416394, 0.3164295, 0.3740055, 1, 1, 1, 1, 1,
-0.640251, -0.5182822, -2.263893, 0, 0, 1, 1, 1,
-0.6385455, -1.34577, -1.967967, 1, 0, 0, 1, 1,
-0.6365629, -0.4399783, -2.70777, 1, 0, 0, 1, 1,
-0.6341099, 1.030497, -1.181097, 1, 0, 0, 1, 1,
-0.6326221, 0.373583, -0.01079592, 1, 0, 0, 1, 1,
-0.6301405, -1.378397, -1.36937, 1, 0, 0, 1, 1,
-0.626027, -0.1533175, -0.7752602, 0, 0, 0, 1, 1,
-0.620782, -0.5051656, -1.99854, 0, 0, 0, 1, 1,
-0.6175356, -2.539005, -2.856864, 0, 0, 0, 1, 1,
-0.6110212, -1.235207, -3.287566, 0, 0, 0, 1, 1,
-0.6034812, -0.2282894, -1.9017, 0, 0, 0, 1, 1,
-0.6013407, -0.2688547, -1.665525, 0, 0, 0, 1, 1,
-0.5870844, 0.07389612, -0.05991538, 0, 0, 0, 1, 1,
-0.5868613, 1.330603, 0.288708, 1, 1, 1, 1, 1,
-0.5846779, 0.6676276, -1.253611, 1, 1, 1, 1, 1,
-0.5781412, 0.4013111, -1.015999, 1, 1, 1, 1, 1,
-0.5739952, 0.3879449, -0.5125059, 1, 1, 1, 1, 1,
-0.5719296, -1.234633, -2.973403, 1, 1, 1, 1, 1,
-0.5646996, 0.4544684, 0.01976732, 1, 1, 1, 1, 1,
-0.5605375, 0.7194738, -0.3579932, 1, 1, 1, 1, 1,
-0.5587505, -1.343089, -2.298289, 1, 1, 1, 1, 1,
-0.5582315, -1.476386, -3.277864, 1, 1, 1, 1, 1,
-0.5577859, 0.4496637, -2.646565, 1, 1, 1, 1, 1,
-0.5463799, 1.252916, -1.079472, 1, 1, 1, 1, 1,
-0.5446844, -1.222768, -1.504324, 1, 1, 1, 1, 1,
-0.5408697, -0.5131699, -1.802344, 1, 1, 1, 1, 1,
-0.5399879, 0.9516984, -1.064075, 1, 1, 1, 1, 1,
-0.5388479, 0.8589469, -1.048734, 1, 1, 1, 1, 1,
-0.5337984, 1.303195, 2.103864, 0, 0, 1, 1, 1,
-0.53258, 0.218332, -1.72221, 1, 0, 0, 1, 1,
-0.5218462, -0.7331135, -4.561153, 1, 0, 0, 1, 1,
-0.5211436, -0.2690801, 0.435035, 1, 0, 0, 1, 1,
-0.5179526, -1.854916, -1.652006, 1, 0, 0, 1, 1,
-0.5137792, 0.2445843, -1.055718, 1, 0, 0, 1, 1,
-0.5133407, 1.155627, 1.15201, 0, 0, 0, 1, 1,
-0.5099592, -0.5361106, -2.777167, 0, 0, 0, 1, 1,
-0.5099462, -2.250017, -2.387024, 0, 0, 0, 1, 1,
-0.5055385, 0.7355108, -1.029156, 0, 0, 0, 1, 1,
-0.5000893, 0.1960593, -2.265083, 0, 0, 0, 1, 1,
-0.4963732, 2.430047, -0.9637451, 0, 0, 0, 1, 1,
-0.4921171, -0.7927718, -3.999511, 0, 0, 0, 1, 1,
-0.4904642, -0.01376373, -2.503748, 1, 1, 1, 1, 1,
-0.4847933, -0.1749404, -2.913538, 1, 1, 1, 1, 1,
-0.4846804, 0.06294151, -1.802206, 1, 1, 1, 1, 1,
-0.4834075, 0.3950369, 0.09460088, 1, 1, 1, 1, 1,
-0.4819948, 0.3382747, -0.2595065, 1, 1, 1, 1, 1,
-0.4810772, -0.4570681, -3.042813, 1, 1, 1, 1, 1,
-0.4800946, 0.9586402, -0.9926497, 1, 1, 1, 1, 1,
-0.4784999, -1.087825, -3.909348, 1, 1, 1, 1, 1,
-0.4762451, -0.560465, -2.742702, 1, 1, 1, 1, 1,
-0.4760089, 0.4873551, -1.210944, 1, 1, 1, 1, 1,
-0.4714738, 0.04705851, -0.9854904, 1, 1, 1, 1, 1,
-0.4708206, -0.1874229, -3.382935, 1, 1, 1, 1, 1,
-0.4673106, -0.8937103, -1.661472, 1, 1, 1, 1, 1,
-0.4595749, -1.435391, -3.68557, 1, 1, 1, 1, 1,
-0.4590099, 0.3683169, 0.2075641, 1, 1, 1, 1, 1,
-0.4549342, -1.788398, -2.318338, 0, 0, 1, 1, 1,
-0.454776, 1.438527, -0.8365151, 1, 0, 0, 1, 1,
-0.4463081, -0.8722398, -3.177408, 1, 0, 0, 1, 1,
-0.4433543, 0.6428781, -1.059422, 1, 0, 0, 1, 1,
-0.4425618, -0.5583428, -3.888785, 1, 0, 0, 1, 1,
-0.4414231, -1.577738, -2.895932, 1, 0, 0, 1, 1,
-0.435253, -0.3513119, -2.452506, 0, 0, 0, 1, 1,
-0.4346811, -1.549755, -2.361714, 0, 0, 0, 1, 1,
-0.4311389, 0.354515, -2.14848, 0, 0, 0, 1, 1,
-0.4177312, 1.087633, -0.5786103, 0, 0, 0, 1, 1,
-0.415785, 0.9188219, 1.324919, 0, 0, 0, 1, 1,
-0.4155078, -0.6965767, -2.294439, 0, 0, 0, 1, 1,
-0.4128968, -0.8946831, -3.200969, 0, 0, 0, 1, 1,
-0.4082865, -0.4847125, -3.37448, 1, 1, 1, 1, 1,
-0.4037558, -0.302218, 0.02964591, 1, 1, 1, 1, 1,
-0.4022924, 1.788335, -0.270651, 1, 1, 1, 1, 1,
-0.3988722, -0.02096123, -0.5649216, 1, 1, 1, 1, 1,
-0.3971128, 1.079159, -1.22027, 1, 1, 1, 1, 1,
-0.3969472, -1.242005, -3.55392, 1, 1, 1, 1, 1,
-0.3948548, -0.4671063, -1.489872, 1, 1, 1, 1, 1,
-0.3939627, 1.109205, -0.6085796, 1, 1, 1, 1, 1,
-0.3938731, -0.1845761, -3.133337, 1, 1, 1, 1, 1,
-0.3917867, 0.831852, 0.7954223, 1, 1, 1, 1, 1,
-0.389798, 0.5634809, -1.481923, 1, 1, 1, 1, 1,
-0.3867638, -1.098606, -2.25095, 1, 1, 1, 1, 1,
-0.3851708, 0.8567987, -1.964468, 1, 1, 1, 1, 1,
-0.3830493, 0.4319936, 0.04566754, 1, 1, 1, 1, 1,
-0.3769878, -0.6050182, -2.63395, 1, 1, 1, 1, 1,
-0.3722594, -1.503136, -1.28547, 0, 0, 1, 1, 1,
-0.3718624, 0.6605878, -2.313475, 1, 0, 0, 1, 1,
-0.3716485, 0.8956787, 0.2307188, 1, 0, 0, 1, 1,
-0.3703477, 0.5805448, -0.7719464, 1, 0, 0, 1, 1,
-0.3695935, -0.4962949, -4.159387, 1, 0, 0, 1, 1,
-0.3688732, -0.2328621, -2.956143, 1, 0, 0, 1, 1,
-0.3624105, 1.290477, -0.1317412, 0, 0, 0, 1, 1,
-0.3623879, 0.950896, 0.2647527, 0, 0, 0, 1, 1,
-0.3617592, -0.6602447, -3.210655, 0, 0, 0, 1, 1,
-0.3564841, -0.7717312, -2.945927, 0, 0, 0, 1, 1,
-0.347344, -0.588841, -3.108843, 0, 0, 0, 1, 1,
-0.3466627, 2.435503, -0.5037791, 0, 0, 0, 1, 1,
-0.3456473, -0.7922393, -2.46016, 0, 0, 0, 1, 1,
-0.3400929, -1.119315, -2.976233, 1, 1, 1, 1, 1,
-0.3400703, 0.3190666, -0.01857255, 1, 1, 1, 1, 1,
-0.3398922, -0.5685768, -2.39712, 1, 1, 1, 1, 1,
-0.3339722, 0.01472021, -1.145381, 1, 1, 1, 1, 1,
-0.3309745, 0.8995092, 0.2176723, 1, 1, 1, 1, 1,
-0.329716, 0.2165661, -1.637798, 1, 1, 1, 1, 1,
-0.3271055, 0.02042614, -1.339087, 1, 1, 1, 1, 1,
-0.3239868, -0.3544025, -1.97283, 1, 1, 1, 1, 1,
-0.3221511, 0.715734, 0.3634233, 1, 1, 1, 1, 1,
-0.3198771, 0.8185263, -1.323074, 1, 1, 1, 1, 1,
-0.3179043, 0.1905186, 0.1775382, 1, 1, 1, 1, 1,
-0.3144498, -0.6015735, -3.65732, 1, 1, 1, 1, 1,
-0.3144301, -0.05662961, -1.034279, 1, 1, 1, 1, 1,
-0.3142318, 0.6418056, -0.07677627, 1, 1, 1, 1, 1,
-0.3129993, 0.6262029, -0.6023656, 1, 1, 1, 1, 1,
-0.3103263, -0.705919, -0.9216367, 0, 0, 1, 1, 1,
-0.3090864, -1.688424, -4.077907, 1, 0, 0, 1, 1,
-0.3064616, -1.153659, -4.994642, 1, 0, 0, 1, 1,
-0.3052715, -0.7805098, -2.241343, 1, 0, 0, 1, 1,
-0.298576, -0.6231786, -2.344148, 1, 0, 0, 1, 1,
-0.2966778, -0.1628806, -2.760204, 1, 0, 0, 1, 1,
-0.2946845, -1.682226, -2.897166, 0, 0, 0, 1, 1,
-0.2919475, -1.318221, -2.834289, 0, 0, 0, 1, 1,
-0.289238, 1.513986, 0.3208254, 0, 0, 0, 1, 1,
-0.288268, 0.447167, -0.9052379, 0, 0, 0, 1, 1,
-0.2846164, 0.2087358, -2.039733, 0, 0, 0, 1, 1,
-0.2791325, -1.603556, -1.61073, 0, 0, 0, 1, 1,
-0.2779233, 0.09685177, -2.27231, 0, 0, 0, 1, 1,
-0.2764113, -0.3629732, -2.248217, 1, 1, 1, 1, 1,
-0.2763785, -0.08274021, -0.4985539, 1, 1, 1, 1, 1,
-0.2699532, 0.9010285, 0.1731326, 1, 1, 1, 1, 1,
-0.2690028, 1.25539, 0.186363, 1, 1, 1, 1, 1,
-0.2643976, -0.423714, -4.043941, 1, 1, 1, 1, 1,
-0.2643939, 0.2289502, -0.8199918, 1, 1, 1, 1, 1,
-0.2641461, -0.6540502, -3.222346, 1, 1, 1, 1, 1,
-0.2612943, 0.3988842, 0.8608856, 1, 1, 1, 1, 1,
-0.2567897, 0.7719927, -1.02086, 1, 1, 1, 1, 1,
-0.2522889, 0.7103357, 0.465591, 1, 1, 1, 1, 1,
-0.2477682, -1.032067, -3.268747, 1, 1, 1, 1, 1,
-0.2472659, 0.870438, -0.7693676, 1, 1, 1, 1, 1,
-0.2400151, 0.1021486, -0.2213118, 1, 1, 1, 1, 1,
-0.239046, 0.8106049, -0.3193168, 1, 1, 1, 1, 1,
-0.237304, 0.7570769, 0.136461, 1, 1, 1, 1, 1,
-0.2333937, 0.9918257, -0.783471, 0, 0, 1, 1, 1,
-0.2319898, 0.08603796, -0.6579706, 1, 0, 0, 1, 1,
-0.2318224, 0.3066727, -0.2329413, 1, 0, 0, 1, 1,
-0.230704, -0.8680627, -3.876737, 1, 0, 0, 1, 1,
-0.2292771, 0.6218703, 0.3315249, 1, 0, 0, 1, 1,
-0.2282703, 2.786279, -0.1901921, 1, 0, 0, 1, 1,
-0.2211705, 0.7063263, -0.09077603, 0, 0, 0, 1, 1,
-0.2190167, 1.408276, 0.2339124, 0, 0, 0, 1, 1,
-0.2187574, 0.1496725, -2.098614, 0, 0, 0, 1, 1,
-0.209629, 0.4908656, 0.9850251, 0, 0, 0, 1, 1,
-0.2038171, 0.7285171, -0.2358439, 0, 0, 0, 1, 1,
-0.2017187, -0.6075181, -4.052726, 0, 0, 0, 1, 1,
-0.1998244, 0.9719588, 0.2574069, 0, 0, 0, 1, 1,
-0.199651, 0.7060567, 0.6468701, 1, 1, 1, 1, 1,
-0.1994053, -0.6166607, -2.995352, 1, 1, 1, 1, 1,
-0.1992729, 0.6181496, 0.3537776, 1, 1, 1, 1, 1,
-0.1983077, -0.173223, -2.133312, 1, 1, 1, 1, 1,
-0.1975156, -0.7718685, -3.620682, 1, 1, 1, 1, 1,
-0.1904747, 0.7571112, 0.9440226, 1, 1, 1, 1, 1,
-0.1903856, -1.195631, -3.380984, 1, 1, 1, 1, 1,
-0.1889922, -0.2372906, -1.728605, 1, 1, 1, 1, 1,
-0.1866666, -0.3710579, -2.360218, 1, 1, 1, 1, 1,
-0.1861857, -0.9650867, -3.683108, 1, 1, 1, 1, 1,
-0.18024, -1.133454, -2.657715, 1, 1, 1, 1, 1,
-0.1798006, 1.141668, 0.4327712, 1, 1, 1, 1, 1,
-0.1774551, 1.231236, 1.018652, 1, 1, 1, 1, 1,
-0.1654774, -2.21803, -3.404918, 1, 1, 1, 1, 1,
-0.1650109, -0.06213928, -1.27323, 1, 1, 1, 1, 1,
-0.1608279, 1.622369, -0.4323763, 0, 0, 1, 1, 1,
-0.1606645, -1.24624, -2.520225, 1, 0, 0, 1, 1,
-0.1562643, 0.04458953, -0.6921276, 1, 0, 0, 1, 1,
-0.1558088, -1.279328, -2.18047, 1, 0, 0, 1, 1,
-0.1530665, 1.011733, 1.049009, 1, 0, 0, 1, 1,
-0.1520782, -1.095701, -2.525365, 1, 0, 0, 1, 1,
-0.1515236, -2.139744, -1.543732, 0, 0, 0, 1, 1,
-0.1500902, -0.7629729, -4.741797, 0, 0, 0, 1, 1,
-0.1482407, -1.281243, -3.74712, 0, 0, 0, 1, 1,
-0.1404516, 1.092151, -0.7448328, 0, 0, 0, 1, 1,
-0.13928, -0.7414262, -3.501733, 0, 0, 0, 1, 1,
-0.1335093, 2.107231, 0.8660028, 0, 0, 0, 1, 1,
-0.1293819, 0.9459631, 1.08088, 0, 0, 0, 1, 1,
-0.1293802, 0.6468169, -2.369847, 1, 1, 1, 1, 1,
-0.1286223, -0.3581904, -3.166948, 1, 1, 1, 1, 1,
-0.1231631, -0.1575415, -3.048377, 1, 1, 1, 1, 1,
-0.1190679, 0.3671532, 0.148188, 1, 1, 1, 1, 1,
-0.1140315, 0.0843063, -0.08330351, 1, 1, 1, 1, 1,
-0.1123329, -0.378274, -2.617285, 1, 1, 1, 1, 1,
-0.1121528, 0.7198302, 1.880621, 1, 1, 1, 1, 1,
-0.1104341, -0.7904009, -1.943674, 1, 1, 1, 1, 1,
-0.1070142, -0.4254872, -1.357226, 1, 1, 1, 1, 1,
-0.1055077, 1.659925, 0.7664151, 1, 1, 1, 1, 1,
-0.1028911, 0.4443785, -0.9772784, 1, 1, 1, 1, 1,
-0.102046, -0.1669903, -1.859828, 1, 1, 1, 1, 1,
-0.1016797, 0.2878852, 0.281426, 1, 1, 1, 1, 1,
-0.09668347, 0.674405, -1.593681, 1, 1, 1, 1, 1,
-0.09568861, -0.02357097, -1.442809, 1, 1, 1, 1, 1,
-0.08652595, -0.4595464, -3.081258, 0, 0, 1, 1, 1,
-0.08398904, -0.4418764, -2.829539, 1, 0, 0, 1, 1,
-0.08290881, -0.1889179, -2.107283, 1, 0, 0, 1, 1,
-0.07996886, -0.3795851, -3.609992, 1, 0, 0, 1, 1,
-0.07856523, -0.806923, -3.003515, 1, 0, 0, 1, 1,
-0.07612582, -1.26147, -3.293883, 1, 0, 0, 1, 1,
-0.07063376, 0.2500342, -0.6372321, 0, 0, 0, 1, 1,
-0.06928461, 1.890282, -1.227674, 0, 0, 0, 1, 1,
-0.06763791, -0.9437392, -2.399569, 0, 0, 0, 1, 1,
-0.06342717, 0.5751972, 1.645962, 0, 0, 0, 1, 1,
-0.06057731, 0.1209521, 0.7729803, 0, 0, 0, 1, 1,
-0.06032528, -0.02777201, -1.605595, 0, 0, 0, 1, 1,
-0.05543914, -0.1143546, -5.340026, 0, 0, 0, 1, 1,
-0.05191209, 0.761434, -0.5988975, 1, 1, 1, 1, 1,
-0.0498439, -0.1478168, -3.649962, 1, 1, 1, 1, 1,
-0.04862539, -0.9033604, -5.003313, 1, 1, 1, 1, 1,
-0.04720983, -0.9182856, -1.163475, 1, 1, 1, 1, 1,
-0.04593128, 0.3787322, 0.7903444, 1, 1, 1, 1, 1,
-0.04379189, 0.03434408, -1.774981, 1, 1, 1, 1, 1,
-0.04254954, 0.6228611, -0.578769, 1, 1, 1, 1, 1,
-0.0422194, 0.3563134, 0.1538403, 1, 1, 1, 1, 1,
-0.04061, -0.08717172, -3.283395, 1, 1, 1, 1, 1,
-0.03507255, 1.298221, -1.088174, 1, 1, 1, 1, 1,
-0.02846059, 0.7909399, -2.119102, 1, 1, 1, 1, 1,
-0.02746869, -1.429202, -1.6815, 1, 1, 1, 1, 1,
-0.0248606, 1.365438, 0.3266598, 1, 1, 1, 1, 1,
-0.02289688, 1.27471, 0.2121211, 1, 1, 1, 1, 1,
-0.02226186, -0.5945529, -2.015947, 1, 1, 1, 1, 1,
-0.02087379, -0.5694036, -4.021647, 0, 0, 1, 1, 1,
-0.02077819, 0.288427, -1.403695, 1, 0, 0, 1, 1,
-0.01868446, 0.6823826, 1.841158, 1, 0, 0, 1, 1,
-0.01826725, -0.2075395, -3.295323, 1, 0, 0, 1, 1,
-0.01771341, -0.1340741, -3.219186, 1, 0, 0, 1, 1,
-0.01606947, 0.3754393, -0.2510696, 1, 0, 0, 1, 1,
-0.01583868, -0.6180718, -1.586853, 0, 0, 0, 1, 1,
-0.01403573, -0.1779669, -2.1297, 0, 0, 0, 1, 1,
-0.01273679, 1.045917, 0.9245582, 0, 0, 0, 1, 1,
-0.009634385, -1.265544, -4.732468, 0, 0, 0, 1, 1,
-0.00540682, -1.026391, -3.573384, 0, 0, 0, 1, 1,
-0.003251977, 0.4419026, -0.3349257, 0, 0, 0, 1, 1,
-0.003176642, -0.2907965, -4.566312, 0, 0, 0, 1, 1,
0.001009786, 0.1657094, 1.711335, 1, 1, 1, 1, 1,
0.001629871, -1.819936, 3.06001, 1, 1, 1, 1, 1,
0.002242171, -0.2002761, 3.884788, 1, 1, 1, 1, 1,
0.009340614, -0.8933228, 2.996231, 1, 1, 1, 1, 1,
0.01160163, -0.6325794, 3.971448, 1, 1, 1, 1, 1,
0.01329041, -1.918218, 3.27075, 1, 1, 1, 1, 1,
0.0135716, 0.3155211, -1.772283, 1, 1, 1, 1, 1,
0.0144091, 0.4849666, -0.5015897, 1, 1, 1, 1, 1,
0.01599879, 2.187144, -0.4806367, 1, 1, 1, 1, 1,
0.01664861, 0.5590537, 0.7834782, 1, 1, 1, 1, 1,
0.01892248, -0.04413519, 2.583887, 1, 1, 1, 1, 1,
0.01934256, -0.2195913, 3.37979, 1, 1, 1, 1, 1,
0.02707502, 0.6009271, 0.9266527, 1, 1, 1, 1, 1,
0.02760914, -0.5224851, 1.746342, 1, 1, 1, 1, 1,
0.03229865, -0.1340479, 2.418433, 1, 1, 1, 1, 1,
0.03250401, 0.8083447, -0.1982354, 0, 0, 1, 1, 1,
0.03524398, 2.023822, -1.425126, 1, 0, 0, 1, 1,
0.03541547, 0.5208728, -0.6362367, 1, 0, 0, 1, 1,
0.03941993, 0.1243659, -0.6394601, 1, 0, 0, 1, 1,
0.03967741, 1.096808, 0.5891786, 1, 0, 0, 1, 1,
0.04004516, 0.8606236, -0.1594324, 1, 0, 0, 1, 1,
0.04406533, -1.039504, 3.149848, 0, 0, 0, 1, 1,
0.04428788, 0.8328608, -0.7170045, 0, 0, 0, 1, 1,
0.0469524, -0.6735639, 3.419269, 0, 0, 0, 1, 1,
0.05173704, 0.0782655, -2.777989, 0, 0, 0, 1, 1,
0.05855723, 1.240139, -0.9796615, 0, 0, 0, 1, 1,
0.05868808, -0.3068245, 3.835369, 0, 0, 0, 1, 1,
0.05898477, 1.444944, 0.9401268, 0, 0, 0, 1, 1,
0.05973496, 2.249044, 1.270938, 1, 1, 1, 1, 1,
0.06225831, 0.1206223, -0.1995096, 1, 1, 1, 1, 1,
0.06450777, -1.689451, 5.307353, 1, 1, 1, 1, 1,
0.06750324, -0.2538739, 0.6019357, 1, 1, 1, 1, 1,
0.06842002, 0.3369525, -1.09494, 1, 1, 1, 1, 1,
0.06853592, -1.123225, 3.722155, 1, 1, 1, 1, 1,
0.07191703, -0.6701391, 1.508005, 1, 1, 1, 1, 1,
0.07343879, -1.402544, 2.465182, 1, 1, 1, 1, 1,
0.07597253, 1.486534, 0.4769863, 1, 1, 1, 1, 1,
0.07641342, -0.6668936, 4.528695, 1, 1, 1, 1, 1,
0.07811301, -0.1261634, 3.186342, 1, 1, 1, 1, 1,
0.07837255, 0.1643837, 0.2844263, 1, 1, 1, 1, 1,
0.07845557, 0.1849819, 2.003534, 1, 1, 1, 1, 1,
0.07846415, -1.138144, 3.605522, 1, 1, 1, 1, 1,
0.08129527, 0.2106921, -0.6569461, 1, 1, 1, 1, 1,
0.0821086, -0.1959513, 0.8530641, 0, 0, 1, 1, 1,
0.08374792, -1.98204, 3.850643, 1, 0, 0, 1, 1,
0.08460781, 1.231128, 0.9962699, 1, 0, 0, 1, 1,
0.08574542, 1.76752, -0.5592296, 1, 0, 0, 1, 1,
0.08651023, -1.354045, 2.057764, 1, 0, 0, 1, 1,
0.08793112, 0.769908, 1.701514, 1, 0, 0, 1, 1,
0.09187069, -1.406416, 3.259858, 0, 0, 0, 1, 1,
0.0931934, 1.572483, -0.9483045, 0, 0, 0, 1, 1,
0.09338973, 1.12841, -0.2842144, 0, 0, 0, 1, 1,
0.1011375, -0.4132518, 2.8311, 0, 0, 0, 1, 1,
0.101871, -0.3537935, 2.527035, 0, 0, 0, 1, 1,
0.1040701, -1.746678, 5.461049, 0, 0, 0, 1, 1,
0.1045518, -1.757411, 2.370693, 0, 0, 0, 1, 1,
0.1095255, -1.048504, 2.673763, 1, 1, 1, 1, 1,
0.1099836, -1.633713, 2.772806, 1, 1, 1, 1, 1,
0.1175577, 0.9717236, -0.4093809, 1, 1, 1, 1, 1,
0.1183432, 2.162973, -0.7842999, 1, 1, 1, 1, 1,
0.1215954, 0.8846399, -0.2580644, 1, 1, 1, 1, 1,
0.1217617, -0.8848885, 2.87146, 1, 1, 1, 1, 1,
0.1232869, -0.2078843, 4.488245, 1, 1, 1, 1, 1,
0.1248128, -1.726035, 2.263143, 1, 1, 1, 1, 1,
0.1315908, 0.8990576, 1.22133, 1, 1, 1, 1, 1,
0.1323993, 1.163258, -0.9689311, 1, 1, 1, 1, 1,
0.1324892, 0.567504, -1.020219, 1, 1, 1, 1, 1,
0.1331648, -0.6600043, 2.735037, 1, 1, 1, 1, 1,
0.1352922, 0.1845997, 0.6784066, 1, 1, 1, 1, 1,
0.1359005, 0.3469229, -0.002284854, 1, 1, 1, 1, 1,
0.1391115, 1.372872, 4.327602, 1, 1, 1, 1, 1,
0.1404443, 1.042468, 0.6576862, 0, 0, 1, 1, 1,
0.1418116, -0.6803254, 3.841364, 1, 0, 0, 1, 1,
0.1429524, -0.02289982, 4.562673, 1, 0, 0, 1, 1,
0.1447009, -0.9271786, 4.580082, 1, 0, 0, 1, 1,
0.1475323, -0.587329, 2.504253, 1, 0, 0, 1, 1,
0.1518825, 0.1797702, -0.2307799, 1, 0, 0, 1, 1,
0.1529988, 0.7360212, -0.5517845, 0, 0, 0, 1, 1,
0.1538107, -0.2314521, 1.888951, 0, 0, 0, 1, 1,
0.1543721, 0.3356686, -0.0001502289, 0, 0, 0, 1, 1,
0.1600503, -0.8497908, 0.7112245, 0, 0, 0, 1, 1,
0.1613109, 0.6682821, -0.006283635, 0, 0, 0, 1, 1,
0.1625626, -1.720838, 0.5792043, 0, 0, 0, 1, 1,
0.1657259, 0.9305941, -1.148503, 0, 0, 0, 1, 1,
0.1683987, -0.8080699, 4.560886, 1, 1, 1, 1, 1,
0.1691398, 1.600249, -0.5050252, 1, 1, 1, 1, 1,
0.1732662, 0.5482444, -0.05516602, 1, 1, 1, 1, 1,
0.1740403, -0.16025, 2.269427, 1, 1, 1, 1, 1,
0.1837891, -0.6147435, 3.269912, 1, 1, 1, 1, 1,
0.1851226, -0.06371183, 0.949737, 1, 1, 1, 1, 1,
0.190011, -0.660419, 2.374799, 1, 1, 1, 1, 1,
0.1968405, -0.3272429, 2.650353, 1, 1, 1, 1, 1,
0.1974899, 0.933759, 0.1003933, 1, 1, 1, 1, 1,
0.1980406, 1.196116, 2.820933, 1, 1, 1, 1, 1,
0.198385, -0.9168248, 2.91055, 1, 1, 1, 1, 1,
0.200242, -0.4274028, 1.859072, 1, 1, 1, 1, 1,
0.2035257, -1.333727, 2.618814, 1, 1, 1, 1, 1,
0.2042762, -1.527119, 4.109643, 1, 1, 1, 1, 1,
0.2064709, -0.8031757, 2.662437, 1, 1, 1, 1, 1,
0.2071542, -0.2022543, 3.420423, 0, 0, 1, 1, 1,
0.2082107, 0.20122, -0.9056717, 1, 0, 0, 1, 1,
0.2122821, -0.2678284, 3.373245, 1, 0, 0, 1, 1,
0.2125614, 0.4366686, -1.491112, 1, 0, 0, 1, 1,
0.2166916, -1.060487, 3.826128, 1, 0, 0, 1, 1,
0.2171865, -0.4030994, 4.812845, 1, 0, 0, 1, 1,
0.2177212, -0.2935681, 2.638015, 0, 0, 0, 1, 1,
0.2183835, -0.4913332, 2.919679, 0, 0, 0, 1, 1,
0.2196731, 0.2821249, -0.0255923, 0, 0, 0, 1, 1,
0.2220839, 1.069042, -0.7205626, 0, 0, 0, 1, 1,
0.2223689, 1.659086, 0.6713898, 0, 0, 0, 1, 1,
0.2240249, 0.687048, 1.773523, 0, 0, 0, 1, 1,
0.2257934, -0.2323699, 2.78086, 0, 0, 0, 1, 1,
0.2264517, 1.132129, 0.1742471, 1, 1, 1, 1, 1,
0.2275685, -0.02421505, 3.458123, 1, 1, 1, 1, 1,
0.22876, 0.01460167, 1.921841, 1, 1, 1, 1, 1,
0.2304855, -1.025215, 3.2394, 1, 1, 1, 1, 1,
0.2349335, -0.2566527, 2.425678, 1, 1, 1, 1, 1,
0.2414834, 1.291258, -1.30087, 1, 1, 1, 1, 1,
0.2441851, -1.351165, 2.75423, 1, 1, 1, 1, 1,
0.2444354, -2.557009, 2.776197, 1, 1, 1, 1, 1,
0.2449508, 0.5462726, -0.1681909, 1, 1, 1, 1, 1,
0.2466732, 0.3710742, 0.9509444, 1, 1, 1, 1, 1,
0.2489612, 0.3803498, 0.3828041, 1, 1, 1, 1, 1,
0.2506057, -1.313296, 3.720262, 1, 1, 1, 1, 1,
0.2594236, 0.0001041738, 0.7555246, 1, 1, 1, 1, 1,
0.2604182, -0.518332, 3.712054, 1, 1, 1, 1, 1,
0.2627055, 0.5402548, 2.275725, 1, 1, 1, 1, 1,
0.263052, 0.5128365, 1.751995, 0, 0, 1, 1, 1,
0.2634317, -0.8627335, 3.735257, 1, 0, 0, 1, 1,
0.26616, 0.03869512, 0.4577737, 1, 0, 0, 1, 1,
0.2724053, 1.793255, 0.5372809, 1, 0, 0, 1, 1,
0.2777986, 1.002047, 0.3285877, 1, 0, 0, 1, 1,
0.2791013, 0.4641937, -0.4162255, 1, 0, 0, 1, 1,
0.2801319, -0.1455337, 3.219344, 0, 0, 0, 1, 1,
0.2817658, -3.083905, 4.314871, 0, 0, 0, 1, 1,
0.2847242, 0.144966, 0.8365431, 0, 0, 0, 1, 1,
0.2853054, 0.8594132, 1.908567, 0, 0, 0, 1, 1,
0.2854753, 0.6190544, -1.192199, 0, 0, 0, 1, 1,
0.2957675, 0.7498504, 1.533289, 0, 0, 0, 1, 1,
0.2988147, -0.5266976, 3.472308, 0, 0, 0, 1, 1,
0.2992109, -0.06633723, 1.18772, 1, 1, 1, 1, 1,
0.3042958, -0.42858, 2.384892, 1, 1, 1, 1, 1,
0.3076482, -0.8237338, 3.413918, 1, 1, 1, 1, 1,
0.3131172, -0.6718924, 3.02957, 1, 1, 1, 1, 1,
0.323814, -0.03383211, 0.4953911, 1, 1, 1, 1, 1,
0.3238475, 0.6952987, 0.6191924, 1, 1, 1, 1, 1,
0.3238957, -1.361881, 2.04436, 1, 1, 1, 1, 1,
0.3240009, -0.616845, 3.151632, 1, 1, 1, 1, 1,
0.3241454, -0.401433, 3.795384, 1, 1, 1, 1, 1,
0.3242015, -0.6097652, 2.411764, 1, 1, 1, 1, 1,
0.3256741, -0.06688291, 1.65807, 1, 1, 1, 1, 1,
0.3275613, -0.2806762, 2.053227, 1, 1, 1, 1, 1,
0.333432, 0.7184845, 0.6040545, 1, 1, 1, 1, 1,
0.3352354, 0.1982287, -0.2560222, 1, 1, 1, 1, 1,
0.3377092, 1.330439, 1.320302, 1, 1, 1, 1, 1,
0.3396342, 1.24827, -0.0002060373, 0, 0, 1, 1, 1,
0.3397713, 0.8347745, -1.668008, 1, 0, 0, 1, 1,
0.3408128, -1.017141, 1.158718, 1, 0, 0, 1, 1,
0.3444816, -0.2665723, 2.188199, 1, 0, 0, 1, 1,
0.3476142, 0.1924292, 0.09432365, 1, 0, 0, 1, 1,
0.3545097, -1.426743, 2.106841, 1, 0, 0, 1, 1,
0.3566196, 1.269725, 1.123037, 0, 0, 0, 1, 1,
0.3574272, -1.30318, 3.157151, 0, 0, 0, 1, 1,
0.3612834, 0.109427, 1.553678, 0, 0, 0, 1, 1,
0.3697209, -1.30398, 3.505844, 0, 0, 0, 1, 1,
0.3735023, 1.038882, -1.100493, 0, 0, 0, 1, 1,
0.3738987, -0.02851111, 2.059746, 0, 0, 0, 1, 1,
0.3761534, 0.3435307, 0.2331603, 0, 0, 0, 1, 1,
0.3764271, 0.512591, 0.2138982, 1, 1, 1, 1, 1,
0.3772452, -2.12708, 2.575876, 1, 1, 1, 1, 1,
0.3777679, -0.009536091, 0.9932687, 1, 1, 1, 1, 1,
0.383695, 2.605981, 1.856082, 1, 1, 1, 1, 1,
0.3870681, 0.9738148, 0.5980124, 1, 1, 1, 1, 1,
0.3876803, -1.044034, 3.700966, 1, 1, 1, 1, 1,
0.3889709, 0.7319007, -0.07253439, 1, 1, 1, 1, 1,
0.3897218, -1.189353, 4.014632, 1, 1, 1, 1, 1,
0.3902901, 0.4062092, 0.8428454, 1, 1, 1, 1, 1,
0.3907405, 1.017088, -0.5595829, 1, 1, 1, 1, 1,
0.4004746, -0.7579236, 1.983541, 1, 1, 1, 1, 1,
0.403298, -0.1710159, 2.692745, 1, 1, 1, 1, 1,
0.4038112, 1.288112, 0.01591752, 1, 1, 1, 1, 1,
0.406722, 0.6465464, 0.03766594, 1, 1, 1, 1, 1,
0.4076314, -0.217684, 0.8621259, 1, 1, 1, 1, 1,
0.4130256, -0.6219099, 3.007771, 0, 0, 1, 1, 1,
0.4147574, -0.555088, 3.081281, 1, 0, 0, 1, 1,
0.4152465, 0.2632061, 0.6670418, 1, 0, 0, 1, 1,
0.4152977, -2.355756, 3.557089, 1, 0, 0, 1, 1,
0.4171157, -0.6405282, 1.466706, 1, 0, 0, 1, 1,
0.4171367, -0.4720637, 3.593456, 1, 0, 0, 1, 1,
0.4179356, -0.4834003, 2.228023, 0, 0, 0, 1, 1,
0.4184514, 0.004120538, 0.8014216, 0, 0, 0, 1, 1,
0.4235269, 1.170508, 2.386595, 0, 0, 0, 1, 1,
0.4268342, 0.4437883, 0.2409708, 0, 0, 0, 1, 1,
0.429107, 0.05983475, 3.029593, 0, 0, 0, 1, 1,
0.4291904, 1.446893, -1.147899, 0, 0, 0, 1, 1,
0.4332671, 0.03990763, 0.6556609, 0, 0, 0, 1, 1,
0.4342121, -0.6767629, 3.585531, 1, 1, 1, 1, 1,
0.4354018, -0.4283151, 3.160488, 1, 1, 1, 1, 1,
0.4354295, 0.9506107, 0.7719138, 1, 1, 1, 1, 1,
0.4396861, -0.09669158, 0.8187469, 1, 1, 1, 1, 1,
0.440406, 0.05793048, 2.031637, 1, 1, 1, 1, 1,
0.4414399, -2.351036, 2.42713, 1, 1, 1, 1, 1,
0.4477115, -0.03496698, 0.7807091, 1, 1, 1, 1, 1,
0.449034, 0.8924836, 1.499782, 1, 1, 1, 1, 1,
0.4505253, 0.7380134, 0.6793465, 1, 1, 1, 1, 1,
0.4506548, 0.4087312, 1.664312, 1, 1, 1, 1, 1,
0.4542561, 1.43653, 0.1408232, 1, 1, 1, 1, 1,
0.4569996, 1.154122, 0.8593754, 1, 1, 1, 1, 1,
0.4647161, 0.4871148, -0.2657887, 1, 1, 1, 1, 1,
0.4647401, -0.3003036, 1.353868, 1, 1, 1, 1, 1,
0.4717234, 0.2768753, 1.560326, 1, 1, 1, 1, 1,
0.4735833, -1.614319, 0.9943259, 0, 0, 1, 1, 1,
0.4760109, -1.157766, 1.621022, 1, 0, 0, 1, 1,
0.4761192, -0.9333541, 0.332556, 1, 0, 0, 1, 1,
0.4803578, 1.062349, 0.2060352, 1, 0, 0, 1, 1,
0.4829788, -1.580608, 2.860957, 1, 0, 0, 1, 1,
0.4855777, -0.8950961, 2.791424, 1, 0, 0, 1, 1,
0.4863784, -1.082047, 1.946332, 0, 0, 0, 1, 1,
0.4980207, -0.1385468, 0.396022, 0, 0, 0, 1, 1,
0.501148, 1.805934, -1.623491, 0, 0, 0, 1, 1,
0.5037966, -0.8623908, 1.115337, 0, 0, 0, 1, 1,
0.5040467, 0.3095076, 2.712228, 0, 0, 0, 1, 1,
0.5067263, 0.4933931, 0.5988448, 0, 0, 0, 1, 1,
0.5087896, 0.3098862, 1.119331, 0, 0, 0, 1, 1,
0.5088814, -1.776827, 2.503522, 1, 1, 1, 1, 1,
0.5093849, 0.7753681, 1.56434, 1, 1, 1, 1, 1,
0.5135577, -0.6759644, 2.518437, 1, 1, 1, 1, 1,
0.5173718, -0.6304402, 2.745687, 1, 1, 1, 1, 1,
0.518896, -0.5175565, 2.506294, 1, 1, 1, 1, 1,
0.5246733, -0.344933, 1.067479, 1, 1, 1, 1, 1,
0.5254513, -0.2405248, 2.922473, 1, 1, 1, 1, 1,
0.5372397, 0.7183458, -0.06429865, 1, 1, 1, 1, 1,
0.5406718, 1.797883, -1.100086, 1, 1, 1, 1, 1,
0.5407718, -1.457444, 4.145714, 1, 1, 1, 1, 1,
0.5412862, -0.9412261, 3.796351, 1, 1, 1, 1, 1,
0.5441741, 0.6898907, -0.8296294, 1, 1, 1, 1, 1,
0.5443346, 1.069583, -0.2304661, 1, 1, 1, 1, 1,
0.5453817, -1.08654, 2.305503, 1, 1, 1, 1, 1,
0.5484335, -0.8796488, 2.42532, 1, 1, 1, 1, 1,
0.549723, 1.151784, -0.5627803, 0, 0, 1, 1, 1,
0.5507796, 0.4209816, -0.2965676, 1, 0, 0, 1, 1,
0.5543311, 0.5131876, 0.0845302, 1, 0, 0, 1, 1,
0.5576764, -1.430363, 2.762764, 1, 0, 0, 1, 1,
0.5645587, 0.09668465, 0.9103159, 1, 0, 0, 1, 1,
0.5655575, 1.235043, 0.6706168, 1, 0, 0, 1, 1,
0.5701489, 0.3678103, 0.8055683, 0, 0, 0, 1, 1,
0.5731017, -0.9465937, 3.455917, 0, 0, 0, 1, 1,
0.577064, 2.525138, 0.4266137, 0, 0, 0, 1, 1,
0.5798044, -0.1733691, 0.502933, 0, 0, 0, 1, 1,
0.5814155, 1.383613, 1.061927, 0, 0, 0, 1, 1,
0.5826065, 0.4070539, 1.082131, 0, 0, 0, 1, 1,
0.5849694, 1.189979, -0.01155537, 0, 0, 0, 1, 1,
0.5872726, 1.861441, 1.104983, 1, 1, 1, 1, 1,
0.5927275, -0.3731467, 1.417562, 1, 1, 1, 1, 1,
0.5977414, 0.3375107, 0.7212368, 1, 1, 1, 1, 1,
0.6032914, -0.5602759, 2.567723, 1, 1, 1, 1, 1,
0.6061302, -0.07663719, 1.271576, 1, 1, 1, 1, 1,
0.613249, 0.6596298, 1.060323, 1, 1, 1, 1, 1,
0.6134779, 0.3489303, 1.540617, 1, 1, 1, 1, 1,
0.6154051, 0.7212591, 0.4200545, 1, 1, 1, 1, 1,
0.6182602, -1.817736, 3.305142, 1, 1, 1, 1, 1,
0.6211093, 0.5889489, 0.2183028, 1, 1, 1, 1, 1,
0.6293879, 1.694617, 1.180828, 1, 1, 1, 1, 1,
0.6297584, 1.164028, -0.7366058, 1, 1, 1, 1, 1,
0.6359848, 0.2529088, 0.2234487, 1, 1, 1, 1, 1,
0.6427494, 0.02595135, 1.363534, 1, 1, 1, 1, 1,
0.6440182, 0.3285432, 0.03309204, 1, 1, 1, 1, 1,
0.6442893, -2.387415, 2.05402, 0, 0, 1, 1, 1,
0.647036, 0.09037117, 0.2152143, 1, 0, 0, 1, 1,
0.6482174, 0.40208, 1.127156, 1, 0, 0, 1, 1,
0.6482574, -0.3568787, 1.618948, 1, 0, 0, 1, 1,
0.6490887, -1.559829, 2.759079, 1, 0, 0, 1, 1,
0.6509973, -0.05345322, 1.671101, 1, 0, 0, 1, 1,
0.6546733, 1.829612, 0.6003826, 0, 0, 0, 1, 1,
0.6555805, 0.9765146, 0.2753181, 0, 0, 0, 1, 1,
0.6561109, -2.398317, 3.601928, 0, 0, 0, 1, 1,
0.6586671, -0.4758654, 3.396076, 0, 0, 0, 1, 1,
0.6619554, -1.037763, 2.976176, 0, 0, 0, 1, 1,
0.6658602, 0.0251112, 1.176793, 0, 0, 0, 1, 1,
0.6694243, 0.5518073, 2.181959, 0, 0, 0, 1, 1,
0.6766052, -1.803327, 1.892718, 1, 1, 1, 1, 1,
0.6852177, -1.501716, 4.382978, 1, 1, 1, 1, 1,
0.6860505, 0.9709582, 0.8553145, 1, 1, 1, 1, 1,
0.6863542, -2.28016, 5.938938, 1, 1, 1, 1, 1,
0.6932595, -0.150479, 1.925528, 1, 1, 1, 1, 1,
0.697611, -1.339089, 2.678214, 1, 1, 1, 1, 1,
0.7071968, 1.126963, -1.979078, 1, 1, 1, 1, 1,
0.7109793, 1.554079, -0.2206431, 1, 1, 1, 1, 1,
0.711155, 1.324722, 0.4362426, 1, 1, 1, 1, 1,
0.7158689, -0.07489696, 1.886369, 1, 1, 1, 1, 1,
0.7161548, -2.081754, 0.2414887, 1, 1, 1, 1, 1,
0.717109, -0.02962127, 2.218576, 1, 1, 1, 1, 1,
0.7185017, -1.329698, 5.028919, 1, 1, 1, 1, 1,
0.7187836, 0.7893369, 1.778397, 1, 1, 1, 1, 1,
0.7190217, -2.137228, 2.88104, 1, 1, 1, 1, 1,
0.7198845, 0.9182378, 0.6897627, 0, 0, 1, 1, 1,
0.7216252, 0.1768756, 1.859269, 1, 0, 0, 1, 1,
0.7237784, 1.884912, 0.8821896, 1, 0, 0, 1, 1,
0.7246875, -1.332915, 2.40536, 1, 0, 0, 1, 1,
0.7256843, 0.3739934, 1.566656, 1, 0, 0, 1, 1,
0.7285794, -1.33407, 3.592769, 1, 0, 0, 1, 1,
0.7339677, -1.36993, 0.8050457, 0, 0, 0, 1, 1,
0.736313, -0.2202426, 2.345672, 0, 0, 0, 1, 1,
0.7366133, 0.1740652, 3.613932, 0, 0, 0, 1, 1,
0.7404265, -1.17384, 3.976907, 0, 0, 0, 1, 1,
0.7412848, -0.8851579, 1.238027, 0, 0, 0, 1, 1,
0.7432804, 0.2557923, 0.5176872, 0, 0, 0, 1, 1,
0.7451006, 0.5645571, 2.160629, 0, 0, 0, 1, 1,
0.7465147, -0.4641249, 1.828635, 1, 1, 1, 1, 1,
0.7506825, -1.635212, 2.224034, 1, 1, 1, 1, 1,
0.7530467, -0.4018279, 2.819644, 1, 1, 1, 1, 1,
0.7581928, 0.6705843, 2.298266, 1, 1, 1, 1, 1,
0.772016, 0.6276652, 0.6053748, 1, 1, 1, 1, 1,
0.7801402, -1.246206, 1.845816, 1, 1, 1, 1, 1,
0.7838626, -0.673138, 0.8889941, 1, 1, 1, 1, 1,
0.7861729, -0.2557349, 1.728397, 1, 1, 1, 1, 1,
0.7893105, -0.6345204, 3.934651, 1, 1, 1, 1, 1,
0.7913937, 1.485889, 1.294248, 1, 1, 1, 1, 1,
0.7936022, 0.5634283, 0.2214417, 1, 1, 1, 1, 1,
0.7942479, 1.701924, 2.07289, 1, 1, 1, 1, 1,
0.8025394, 0.3715908, 1.767, 1, 1, 1, 1, 1,
0.8040082, -1.072483, 1.355722, 1, 1, 1, 1, 1,
0.8051395, -2.58887, 2.830592, 1, 1, 1, 1, 1,
0.8061486, 1.246707, 1.370559, 0, 0, 1, 1, 1,
0.8077666, -0.6737772, -0.7496276, 1, 0, 0, 1, 1,
0.8101527, 1.35936, 2.927978, 1, 0, 0, 1, 1,
0.8115039, -0.1795897, 2.588068, 1, 0, 0, 1, 1,
0.814015, -0.2776788, 1.391075, 1, 0, 0, 1, 1,
0.8219509, 0.1374051, 2.603343, 1, 0, 0, 1, 1,
0.8233733, -0.7584909, 2.283724, 0, 0, 0, 1, 1,
0.8253572, -0.4884428, 1.526829, 0, 0, 0, 1, 1,
0.8255341, 0.4331855, -0.4748737, 0, 0, 0, 1, 1,
0.8278219, -0.4965944, 2.039109, 0, 0, 0, 1, 1,
0.842905, -0.07357159, 1.588159, 0, 0, 0, 1, 1,
0.8500892, 0.5422357, 1.964042, 0, 0, 0, 1, 1,
0.8638375, 1.39171, 0.03447481, 0, 0, 0, 1, 1,
0.8640392, 1.639784, 0.5251212, 1, 1, 1, 1, 1,
0.8654986, -0.263042, 0.8160228, 1, 1, 1, 1, 1,
0.8684881, -0.5109662, 2.781758, 1, 1, 1, 1, 1,
0.8724405, 0.1736796, 0.2311738, 1, 1, 1, 1, 1,
0.87554, 0.679735, 1.270122, 1, 1, 1, 1, 1,
0.8862473, 0.1026496, 3.488148, 1, 1, 1, 1, 1,
0.8925263, 0.914239, 1.196744, 1, 1, 1, 1, 1,
0.8950239, -0.3502491, 2.496323, 1, 1, 1, 1, 1,
0.896126, -0.1237909, 2.226656, 1, 1, 1, 1, 1,
0.8966928, -0.6962445, 2.236862, 1, 1, 1, 1, 1,
0.901692, -1.682211, 3.607771, 1, 1, 1, 1, 1,
0.9044023, 0.8829299, 1.641896, 1, 1, 1, 1, 1,
0.9092773, -0.0008868656, 1.461216, 1, 1, 1, 1, 1,
0.9099437, -2.175992, 1.466838, 1, 1, 1, 1, 1,
0.9105638, 1.140945, 1.138379, 1, 1, 1, 1, 1,
0.9195023, -1.01144, 2.782575, 0, 0, 1, 1, 1,
0.9212449, 0.3238878, 2.055247, 1, 0, 0, 1, 1,
0.9264857, -1.764807, 1.530954, 1, 0, 0, 1, 1,
0.926847, 1.41127, 1.408337, 1, 0, 0, 1, 1,
0.9276585, 0.5030615, 3.208524, 1, 0, 0, 1, 1,
0.9343602, 0.2259357, 0.54495, 1, 0, 0, 1, 1,
0.9378015, -1.419321, 3.532836, 0, 0, 0, 1, 1,
0.9449064, -0.6452617, 0.8112656, 0, 0, 0, 1, 1,
0.9532183, -1.383937, 2.499885, 0, 0, 0, 1, 1,
0.9577366, 1.814478, 0.3561445, 0, 0, 0, 1, 1,
0.9606432, -1.488625, 3.31662, 0, 0, 0, 1, 1,
0.9658523, 0.2782621, 1.32854, 0, 0, 0, 1, 1,
0.971299, 1.045753, 1.995235, 0, 0, 0, 1, 1,
0.9862282, 0.9626006, 0.4767495, 1, 1, 1, 1, 1,
0.9888037, 0.5890366, -0.2464235, 1, 1, 1, 1, 1,
0.9935049, 0.7943226, -0.3948188, 1, 1, 1, 1, 1,
0.9981048, -0.3137094, 1.236032, 1, 1, 1, 1, 1,
1.003892, 0.4942655, 2.902264, 1, 1, 1, 1, 1,
1.011517, 1.560852, 2.089998, 1, 1, 1, 1, 1,
1.014681, 1.15159, 1.403949, 1, 1, 1, 1, 1,
1.015246, 1.119513, 1.75556, 1, 1, 1, 1, 1,
1.016213, -0.05815627, 2.606216, 1, 1, 1, 1, 1,
1.018531, 1.748583, 0.3999324, 1, 1, 1, 1, 1,
1.022924, -0.4401606, 2.484008, 1, 1, 1, 1, 1,
1.023415, -1.327585, 1.738021, 1, 1, 1, 1, 1,
1.039939, 1.763673, -0.8383727, 1, 1, 1, 1, 1,
1.042917, 0.5321748, 0.2071135, 1, 1, 1, 1, 1,
1.045492, 0.05522005, 1.140399, 1, 1, 1, 1, 1,
1.048191, -0.3264878, 2.786438, 0, 0, 1, 1, 1,
1.048848, -1.181296, 0.5766436, 1, 0, 0, 1, 1,
1.059912, -1.818842, 2.380282, 1, 0, 0, 1, 1,
1.064011, -1.398006, 2.511443, 1, 0, 0, 1, 1,
1.066267, -0.8236097, 1.897943, 1, 0, 0, 1, 1,
1.072204, 1.85386, 0.8958948, 1, 0, 0, 1, 1,
1.073489, 2.238551, -1.42038, 0, 0, 0, 1, 1,
1.077, -3.541958, 1.905718, 0, 0, 0, 1, 1,
1.077507, 1.995864, -1.064305, 0, 0, 0, 1, 1,
1.080352, 0.01072175, 1.544814, 0, 0, 0, 1, 1,
1.080698, -1.022735, -0.04675403, 0, 0, 0, 1, 1,
1.084561, 2.542879, 1.151691, 0, 0, 0, 1, 1,
1.095044, 0.138481, 1.062978, 0, 0, 0, 1, 1,
1.096708, -0.1216112, 1.987542, 1, 1, 1, 1, 1,
1.098328, 0.5284135, -0.2581033, 1, 1, 1, 1, 1,
1.111301, 1.087882, 4.527397, 1, 1, 1, 1, 1,
1.113551, 0.8688692, -0.6096539, 1, 1, 1, 1, 1,
1.113652, 0.8733084, 1.514139, 1, 1, 1, 1, 1,
1.11418, -0.1174797, 1.416201, 1, 1, 1, 1, 1,
1.121989, -0.5858749, 1.542241, 1, 1, 1, 1, 1,
1.126925, 0.1727819, 2.20461, 1, 1, 1, 1, 1,
1.127164, -1.068096, 2.092894, 1, 1, 1, 1, 1,
1.127591, -0.521431, 3.143636, 1, 1, 1, 1, 1,
1.12999, -0.820276, 0.6279499, 1, 1, 1, 1, 1,
1.132516, -0.2532182, 1.59875, 1, 1, 1, 1, 1,
1.138613, 1.509928, 1.195263, 1, 1, 1, 1, 1,
1.14416, -0.07460505, 3.558883, 1, 1, 1, 1, 1,
1.14533, 0.5863423, 3.128377, 1, 1, 1, 1, 1,
1.15301, 0.1642006, 1.403487, 0, 0, 1, 1, 1,
1.159121, -0.008456761, 0.6215857, 1, 0, 0, 1, 1,
1.166316, 0.7698005, 1.035641, 1, 0, 0, 1, 1,
1.166918, -0.3062713, 2.558661, 1, 0, 0, 1, 1,
1.184006, 1.513903, 1.264706, 1, 0, 0, 1, 1,
1.186747, -0.3396689, 2.133721, 1, 0, 0, 1, 1,
1.201601, -1.171491, 1.88439, 0, 0, 0, 1, 1,
1.204937, 0.4996502, 2.849546, 0, 0, 0, 1, 1,
1.206621, 0.9318249, 0.8213994, 0, 0, 0, 1, 1,
1.223796, 1.59722, -0.03264622, 0, 0, 0, 1, 1,
1.22406, 1.191264, -0.2845312, 0, 0, 0, 1, 1,
1.230645, -0.2865307, 0.4913878, 0, 0, 0, 1, 1,
1.236571, 0.5385257, 0.6101034, 0, 0, 0, 1, 1,
1.244758, -0.1734811, 1.551338, 1, 1, 1, 1, 1,
1.255738, 0.7775879, 2.801598, 1, 1, 1, 1, 1,
1.257037, 0.07789776, 1.475212, 1, 1, 1, 1, 1,
1.264086, -0.6796012, 2.132323, 1, 1, 1, 1, 1,
1.266479, -1.02336, 3.40353, 1, 1, 1, 1, 1,
1.277129, -0.9116213, 2.814186, 1, 1, 1, 1, 1,
1.295878, -1.56125, 0.7404844, 1, 1, 1, 1, 1,
1.296606, -0.1709321, 1.866451, 1, 1, 1, 1, 1,
1.298094, -1.870991, 3.757225, 1, 1, 1, 1, 1,
1.300259, 1.937513, -1.339539, 1, 1, 1, 1, 1,
1.309146, 1.744649, -0.7112186, 1, 1, 1, 1, 1,
1.318125, -0.3404022, 1.736709, 1, 1, 1, 1, 1,
1.32265, 0.9508315, 1.742948, 1, 1, 1, 1, 1,
1.32659, -0.5018055, 1.644373, 1, 1, 1, 1, 1,
1.350302, -2.092672, 3.374028, 1, 1, 1, 1, 1,
1.351689, 0.9057878, 0.3617312, 0, 0, 1, 1, 1,
1.361074, 1.198887, 0.5583057, 1, 0, 0, 1, 1,
1.369356, 0.1856591, 0.8180821, 1, 0, 0, 1, 1,
1.371153, 0.7126186, 1.461927, 1, 0, 0, 1, 1,
1.373409, 1.765531, 1.782984, 1, 0, 0, 1, 1,
1.39552, -1.077994, 2.44615, 1, 0, 0, 1, 1,
1.4044, 0.5974043, 1.148649, 0, 0, 0, 1, 1,
1.407113, -1.889073, 3.511901, 0, 0, 0, 1, 1,
1.411256, -1.332871, 1.896666, 0, 0, 0, 1, 1,
1.412383, 0.7537954, 0.6768491, 0, 0, 0, 1, 1,
1.416348, -0.8435392, 0.857571, 0, 0, 0, 1, 1,
1.441443, 0.06249225, 1.413033, 0, 0, 0, 1, 1,
1.462373, -1.453107, 1.270238, 0, 0, 0, 1, 1,
1.468855, -0.08039765, 1.346198, 1, 1, 1, 1, 1,
1.469536, -1.174587, 2.842118, 1, 1, 1, 1, 1,
1.48121, -1.265361, 2.202661, 1, 1, 1, 1, 1,
1.48376, -0.8805504, 1.982137, 1, 1, 1, 1, 1,
1.509066, 0.01236934, 0.02017415, 1, 1, 1, 1, 1,
1.510906, 0.852555, 0.1484902, 1, 1, 1, 1, 1,
1.51876, -1.109123, 1.348852, 1, 1, 1, 1, 1,
1.518848, 0.8859642, 2.278258, 1, 1, 1, 1, 1,
1.521067, 0.3325177, 0.1776966, 1, 1, 1, 1, 1,
1.521735, -0.6626589, 3.213561, 1, 1, 1, 1, 1,
1.537331, -1.372672, 0.9570105, 1, 1, 1, 1, 1,
1.564063, 0.7733257, 2.057054, 1, 1, 1, 1, 1,
1.564216, 0.1579126, -0.06619035, 1, 1, 1, 1, 1,
1.565065, -0.5072865, 2.392408, 1, 1, 1, 1, 1,
1.585339, -0.3298329, 1.578097, 1, 1, 1, 1, 1,
1.58584, 1.224729, 0.6110469, 0, 0, 1, 1, 1,
1.593124, 0.6976872, 1.290807, 1, 0, 0, 1, 1,
1.604336, 0.8622388, 0.3295256, 1, 0, 0, 1, 1,
1.60673, 0.2734294, 1.460428, 1, 0, 0, 1, 1,
1.607979, -0.3088852, 0.6023811, 1, 0, 0, 1, 1,
1.661226, 1.458053, -1.12559, 1, 0, 0, 1, 1,
1.689764, -0.7811684, 2.031317, 0, 0, 0, 1, 1,
1.720621, -0.7031144, 4.019685, 0, 0, 0, 1, 1,
1.728676, -2.014311, 2.494502, 0, 0, 0, 1, 1,
1.736621, 0.317637, 0.06804457, 0, 0, 0, 1, 1,
1.758796, -0.5965474, 1.255384, 0, 0, 0, 1, 1,
1.776491, 0.5428146, 1.378565, 0, 0, 0, 1, 1,
1.788038, -0.1483034, 1.844961, 0, 0, 0, 1, 1,
1.794558, -0.4952518, -0.09868152, 1, 1, 1, 1, 1,
1.810296, 0.8792388, 1.077076, 1, 1, 1, 1, 1,
1.81104, -0.826924, 3.454886, 1, 1, 1, 1, 1,
1.82502, 0.2327853, 1.719316, 1, 1, 1, 1, 1,
1.826487, 0.5601966, 0.889342, 1, 1, 1, 1, 1,
1.833482, -0.5040218, 1.532528, 1, 1, 1, 1, 1,
1.847371, -1.142711, 2.478717, 1, 1, 1, 1, 1,
1.855461, -0.2863522, 1.035476, 1, 1, 1, 1, 1,
1.899693, -0.6621583, 1.649431, 1, 1, 1, 1, 1,
1.902812, -0.3244008, 2.314748, 1, 1, 1, 1, 1,
1.954872, 0.8785658, 1.177415, 1, 1, 1, 1, 1,
1.972334, 0.08440653, 2.235198, 1, 1, 1, 1, 1,
1.973682, 0.1988428, 1.907303, 1, 1, 1, 1, 1,
1.989326, -0.06928919, -0.1405034, 1, 1, 1, 1, 1,
1.995683, -1.613305, 2.081076, 1, 1, 1, 1, 1,
1.997713, 1.206679, 0.7056487, 0, 0, 1, 1, 1,
2.000956, -0.05321155, 2.100004, 1, 0, 0, 1, 1,
2.020541, -0.4478952, 3.561906, 1, 0, 0, 1, 1,
2.033334, 1.050942, 0.8571907, 1, 0, 0, 1, 1,
2.051259, -1.732775, 1.217795, 1, 0, 0, 1, 1,
2.081908, 0.07936317, 2.640097, 1, 0, 0, 1, 1,
2.083995, 0.4095807, 2.502635, 0, 0, 0, 1, 1,
2.102722, 1.630744, 0.837429, 0, 0, 0, 1, 1,
2.104427, 0.3337229, -0.2962993, 0, 0, 0, 1, 1,
2.271904, -1.302063, 2.030398, 0, 0, 0, 1, 1,
2.293889, 0.6642411, 0.875481, 0, 0, 0, 1, 1,
2.381696, 0.2158235, 1.439961, 0, 0, 0, 1, 1,
2.430256, 1.592085, 0.741855, 0, 0, 0, 1, 1,
2.532642, -0.2868656, 1.825245, 1, 1, 1, 1, 1,
2.540925, 0.0599068, 0.2988216, 1, 1, 1, 1, 1,
2.552655, 0.528275, 3.223493, 1, 1, 1, 1, 1,
2.690424, 1.128226, 1.321313, 1, 1, 1, 1, 1,
2.789158, -0.4555549, 0.9434156, 1, 1, 1, 1, 1,
2.902349, -0.5279202, 2.525934, 1, 1, 1, 1, 1,
3.098241, 0.296408, 1.521392, 1, 1, 1, 1, 1
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
var radius = 9.938306;
var distance = 34.90788;
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
mvMatrix.translate( 0.3968039, 0.3778393, -0.2994556 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.90788);
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
