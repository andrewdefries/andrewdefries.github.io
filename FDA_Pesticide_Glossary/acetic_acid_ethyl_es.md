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
-3.268771, -2.152407, -4.147461, 1, 0, 0, 1,
-3.1426, 0.6748644, -2.088397, 1, 0.007843138, 0, 1,
-3.054349, -1.6569, -0.8633971, 1, 0.01176471, 0, 1,
-2.805427, 1.95915, -1.482714, 1, 0.01960784, 0, 1,
-2.598594, 0.2067039, -1.91379, 1, 0.02352941, 0, 1,
-2.49756, -0.4679894, -1.498231, 1, 0.03137255, 0, 1,
-2.467449, -1.266558, -2.471377, 1, 0.03529412, 0, 1,
-2.440012, 1.453668, -1.802475, 1, 0.04313726, 0, 1,
-2.413669, 0.3850941, -1.339278, 1, 0.04705882, 0, 1,
-2.360295, -0.6275337, -2.192078, 1, 0.05490196, 0, 1,
-2.311617, 0.05091168, -1.818992, 1, 0.05882353, 0, 1,
-2.294317, -0.1890033, -3.387125, 1, 0.06666667, 0, 1,
-2.288901, 1.11379, 0.100924, 1, 0.07058824, 0, 1,
-2.262193, 0.2577516, -0.3411121, 1, 0.07843138, 0, 1,
-2.248463, 1.211685, -1.03936, 1, 0.08235294, 0, 1,
-2.237451, 0.3769335, -0.6547253, 1, 0.09019608, 0, 1,
-2.179023, 0.1528748, -1.994781, 1, 0.09411765, 0, 1,
-2.137116, 0.7332268, -0.2984844, 1, 0.1019608, 0, 1,
-2.091018, 0.1545618, -1.746692, 1, 0.1098039, 0, 1,
-2.088758, 0.5465819, 0.5166896, 1, 0.1137255, 0, 1,
-2.073806, 0.9975154, -2.130105, 1, 0.1215686, 0, 1,
-2.057542, 0.05656322, -0.8486612, 1, 0.1254902, 0, 1,
-2.014215, -0.3190462, -0.9448453, 1, 0.1333333, 0, 1,
-2.000301, -2.338819, -2.942069, 1, 0.1372549, 0, 1,
-1.983007, 1.25119, -0.5841919, 1, 0.145098, 0, 1,
-1.982832, -0.1334492, -3.004585, 1, 0.1490196, 0, 1,
-1.982092, -0.3319925, -2.146166, 1, 0.1568628, 0, 1,
-1.979175, -0.4839662, -0.03250704, 1, 0.1607843, 0, 1,
-1.959499, -0.06051945, -2.044608, 1, 0.1686275, 0, 1,
-1.954582, -0.003005598, -1.398082, 1, 0.172549, 0, 1,
-1.933395, 1.571516, -0.1493317, 1, 0.1803922, 0, 1,
-1.913271, -1.44148, -1.847732, 1, 0.1843137, 0, 1,
-1.903156, 0.9459177, -2.125905, 1, 0.1921569, 0, 1,
-1.895829, -1.843835, -3.163024, 1, 0.1960784, 0, 1,
-1.881889, 0.2797866, -1.102776, 1, 0.2039216, 0, 1,
-1.873349, -0.586904, -1.699405, 1, 0.2117647, 0, 1,
-1.853941, 0.1451113, -0.487476, 1, 0.2156863, 0, 1,
-1.82083, -1.045848, -3.024873, 1, 0.2235294, 0, 1,
-1.803059, -0.5542331, -1.76031, 1, 0.227451, 0, 1,
-1.793558, 0.8374816, -0.6258829, 1, 0.2352941, 0, 1,
-1.791017, 2.078358, -0.7197539, 1, 0.2392157, 0, 1,
-1.780083, -0.4267188, -0.6975082, 1, 0.2470588, 0, 1,
-1.772395, -0.3831971, -0.7501265, 1, 0.2509804, 0, 1,
-1.738436, 1.086915, -1.797367, 1, 0.2588235, 0, 1,
-1.731052, -0.7731537, -2.916909, 1, 0.2627451, 0, 1,
-1.730297, 0.5408744, -0.707348, 1, 0.2705882, 0, 1,
-1.724598, -1.028266, -1.96734, 1, 0.2745098, 0, 1,
-1.723243, 0.2511637, -2.987643, 1, 0.282353, 0, 1,
-1.714599, 1.503973, -1.637819, 1, 0.2862745, 0, 1,
-1.685165, -0.2000967, -3.187917, 1, 0.2941177, 0, 1,
-1.683666, 1.012899, -1.775897, 1, 0.3019608, 0, 1,
-1.655065, 0.3459571, -2.213865, 1, 0.3058824, 0, 1,
-1.620692, 1.471982, -2.2693, 1, 0.3137255, 0, 1,
-1.615973, 0.380844, -1.153552, 1, 0.3176471, 0, 1,
-1.60202, 0.4914768, -2.461658, 1, 0.3254902, 0, 1,
-1.595875, -1.21343, -1.084746, 1, 0.3294118, 0, 1,
-1.590095, 0.07604469, -0.5954944, 1, 0.3372549, 0, 1,
-1.5883, -0.9209614, -0.2484007, 1, 0.3411765, 0, 1,
-1.587622, -0.3567778, -1.417071, 1, 0.3490196, 0, 1,
-1.561923, 1.822755, -1.568999, 1, 0.3529412, 0, 1,
-1.552824, -1.413076, -2.978719, 1, 0.3607843, 0, 1,
-1.549827, -1.018178, -2.983464, 1, 0.3647059, 0, 1,
-1.549523, 1.147724, -0.1913625, 1, 0.372549, 0, 1,
-1.542842, 0.5081727, -1.137973, 1, 0.3764706, 0, 1,
-1.538272, -1.304963, -2.564688, 1, 0.3843137, 0, 1,
-1.534276, 1.381268, -1.028913, 1, 0.3882353, 0, 1,
-1.522806, -1.187502, -3.073974, 1, 0.3960784, 0, 1,
-1.51412, 0.109927, -2.347504, 1, 0.4039216, 0, 1,
-1.509924, -1.411511, -1.458552, 1, 0.4078431, 0, 1,
-1.504375, -0.556468, -0.793863, 1, 0.4156863, 0, 1,
-1.497728, 0.7748683, -0.6404087, 1, 0.4196078, 0, 1,
-1.489978, -0.6952483, -3.476873, 1, 0.427451, 0, 1,
-1.488818, -1.622742, -1.369183, 1, 0.4313726, 0, 1,
-1.488247, 0.1470084, 0.3165092, 1, 0.4392157, 0, 1,
-1.471117, -0.7942327, -3.140042, 1, 0.4431373, 0, 1,
-1.456369, 1.191819, -1.319968, 1, 0.4509804, 0, 1,
-1.455268, 0.1169573, -2.674242, 1, 0.454902, 0, 1,
-1.450428, 1.44379, -1.038484, 1, 0.4627451, 0, 1,
-1.449662, -1.478077, -3.712072, 1, 0.4666667, 0, 1,
-1.448172, -0.6167883, -1.785694, 1, 0.4745098, 0, 1,
-1.440179, -0.4752914, -2.871689, 1, 0.4784314, 0, 1,
-1.437241, -0.3564048, 0.9677369, 1, 0.4862745, 0, 1,
-1.42861, -0.2159031, -1.140821, 1, 0.4901961, 0, 1,
-1.418146, 0.6381032, -2.70285, 1, 0.4980392, 0, 1,
-1.412642, -0.9704589, -1.104027, 1, 0.5058824, 0, 1,
-1.410568, 0.3090443, 1.12948, 1, 0.509804, 0, 1,
-1.410234, -1.084964, -2.509291, 1, 0.5176471, 0, 1,
-1.383135, -0.5557638, -2.050038, 1, 0.5215687, 0, 1,
-1.379602, 0.6059589, -0.7102039, 1, 0.5294118, 0, 1,
-1.377108, 1.346822, -1.728733, 1, 0.5333334, 0, 1,
-1.356678, -2.376273, -0.9738418, 1, 0.5411765, 0, 1,
-1.344722, 0.3219675, -2.894713, 1, 0.5450981, 0, 1,
-1.342208, 1.162786, -0.7442451, 1, 0.5529412, 0, 1,
-1.341326, 0.9812711, -2.078298, 1, 0.5568628, 0, 1,
-1.338288, 2.33024, -0.7977393, 1, 0.5647059, 0, 1,
-1.33649, 0.7615547, -0.6725183, 1, 0.5686275, 0, 1,
-1.324667, -1.405714, -1.461208, 1, 0.5764706, 0, 1,
-1.314613, 0.9660957, -0.4719843, 1, 0.5803922, 0, 1,
-1.31149, 0.4344273, -3.221807, 1, 0.5882353, 0, 1,
-1.311399, -0.1529833, -0.8051293, 1, 0.5921569, 0, 1,
-1.302047, 1.577999, -0.2518419, 1, 0.6, 0, 1,
-1.290162, 0.2541233, 0.4838866, 1, 0.6078432, 0, 1,
-1.268348, 0.0999293, 0.3869392, 1, 0.6117647, 0, 1,
-1.267157, 0.346421, -1.494961, 1, 0.6196079, 0, 1,
-1.236081, -0.5826562, -4.507164, 1, 0.6235294, 0, 1,
-1.229812, -0.4154273, -3.557586, 1, 0.6313726, 0, 1,
-1.224366, -1.639295, -1.965554, 1, 0.6352941, 0, 1,
-1.219694, -0.5066201, -2.648805, 1, 0.6431373, 0, 1,
-1.209145, 0.6775391, -1.791906, 1, 0.6470588, 0, 1,
-1.203652, 1.992335, -1.140463, 1, 0.654902, 0, 1,
-1.200026, -0.3625686, -1.713326, 1, 0.6588235, 0, 1,
-1.198513, 0.1957179, -2.945996, 1, 0.6666667, 0, 1,
-1.191888, 0.1120069, -0.5969536, 1, 0.6705883, 0, 1,
-1.17637, -1.748727, -1.864857, 1, 0.6784314, 0, 1,
-1.168815, 1.882883, 0.5943874, 1, 0.682353, 0, 1,
-1.164628, -0.6977165, -3.321681, 1, 0.6901961, 0, 1,
-1.156141, -1.100016, -2.977248, 1, 0.6941177, 0, 1,
-1.15117, -1.828826, -2.545498, 1, 0.7019608, 0, 1,
-1.151043, -2.2091, -3.104098, 1, 0.7098039, 0, 1,
-1.147063, 1.004003, -0.4393086, 1, 0.7137255, 0, 1,
-1.145647, -1.677481, -4.372403, 1, 0.7215686, 0, 1,
-1.142985, 0.6151049, 0.072198, 1, 0.7254902, 0, 1,
-1.135324, 0.8506544, -2.402246, 1, 0.7333333, 0, 1,
-1.133414, 1.183113, -2.262229, 1, 0.7372549, 0, 1,
-1.127244, -1.141618, -2.843779, 1, 0.7450981, 0, 1,
-1.12029, -0.2349795, -0.7425048, 1, 0.7490196, 0, 1,
-1.119737, -1.497504, -3.176917, 1, 0.7568628, 0, 1,
-1.118936, -0.2836443, -2.705151, 1, 0.7607843, 0, 1,
-1.10594, 0.6247524, 0.5116345, 1, 0.7686275, 0, 1,
-1.088001, 1.140815, -2.351206, 1, 0.772549, 0, 1,
-1.0868, 3.182306, -0.2735459, 1, 0.7803922, 0, 1,
-1.076984, -0.2114591, -0.7378516, 1, 0.7843137, 0, 1,
-1.076544, -0.5723053, -2.137735, 1, 0.7921569, 0, 1,
-1.076375, 0.9188746, -2.470823, 1, 0.7960784, 0, 1,
-1.075639, -0.3878224, -0.431528, 1, 0.8039216, 0, 1,
-1.065476, 1.278385, 0.1231059, 1, 0.8117647, 0, 1,
-1.064348, 0.6479133, -0.8083419, 1, 0.8156863, 0, 1,
-1.064252, 0.763813, -2.778726, 1, 0.8235294, 0, 1,
-1.050566, -0.03885033, -0.8906881, 1, 0.827451, 0, 1,
-1.048323, -0.164989, -1.514855, 1, 0.8352941, 0, 1,
-1.045026, -0.08559088, -1.483059, 1, 0.8392157, 0, 1,
-1.04281, 1.539613, 1.143304, 1, 0.8470588, 0, 1,
-1.038491, -0.5057393, -2.215619, 1, 0.8509804, 0, 1,
-1.037398, -1.112364, -2.377083, 1, 0.8588235, 0, 1,
-1.037374, -2.471046, -0.6711178, 1, 0.8627451, 0, 1,
-1.036061, -1.530569, -1.491525, 1, 0.8705882, 0, 1,
-1.020678, -0.248024, -2.35309, 1, 0.8745098, 0, 1,
-1.018079, 0.3560186, -1.802107, 1, 0.8823529, 0, 1,
-1.016157, -0.8854101, -2.965598, 1, 0.8862745, 0, 1,
-1.013354, -1.322357, -2.698423, 1, 0.8941177, 0, 1,
-1.005405, 0.2345608, 0.8128923, 1, 0.8980392, 0, 1,
-0.9981273, -0.9161666, -3.153421, 1, 0.9058824, 0, 1,
-0.9977248, -1.682346, -2.65911, 1, 0.9137255, 0, 1,
-0.9918218, -0.2510871, -2.456146, 1, 0.9176471, 0, 1,
-0.9896993, -0.6239795, -3.257905, 1, 0.9254902, 0, 1,
-0.9764106, -2.723024, -1.331648, 1, 0.9294118, 0, 1,
-0.9750377, -1.426946, -3.552171, 1, 0.9372549, 0, 1,
-0.9746657, 0.8430253, -1.608823, 1, 0.9411765, 0, 1,
-0.9741752, -0.8406476, -0.9756935, 1, 0.9490196, 0, 1,
-0.9726408, -0.6202202, -1.64617, 1, 0.9529412, 0, 1,
-0.9719224, 0.6494893, -1.850433, 1, 0.9607843, 0, 1,
-0.9426571, -1.028354, -0.5345952, 1, 0.9647059, 0, 1,
-0.9386821, -0.647144, -2.823027, 1, 0.972549, 0, 1,
-0.9375064, 0.8731109, -1.669415, 1, 0.9764706, 0, 1,
-0.9364949, 0.3839752, -0.457808, 1, 0.9843137, 0, 1,
-0.9278086, 0.9065309, -0.3614955, 1, 0.9882353, 0, 1,
-0.9167924, 0.9759843, -0.9979445, 1, 0.9960784, 0, 1,
-0.9038147, 1.134112, 0.01037963, 0.9960784, 1, 0, 1,
-0.9001333, -0.3376807, -1.384083, 0.9921569, 1, 0, 1,
-0.8951744, 0.2434619, -2.098778, 0.9843137, 1, 0, 1,
-0.8933025, 0.1153956, -0.4584403, 0.9803922, 1, 0, 1,
-0.8917117, -0.5098675, -1.929107, 0.972549, 1, 0, 1,
-0.8913489, 0.5645536, -0.3168797, 0.9686275, 1, 0, 1,
-0.8909548, 0.3371543, -1.522571, 0.9607843, 1, 0, 1,
-0.8877723, -1.032572, -3.004033, 0.9568627, 1, 0, 1,
-0.8869835, 0.3905183, 0.01704287, 0.9490196, 1, 0, 1,
-0.886739, 0.4908364, 0.3288463, 0.945098, 1, 0, 1,
-0.8865837, 0.1255491, -1.986461, 0.9372549, 1, 0, 1,
-0.882593, -0.3377143, -1.181125, 0.9333333, 1, 0, 1,
-0.8802856, -0.658845, -3.29292, 0.9254902, 1, 0, 1,
-0.8784269, -1.16453, -3.761192, 0.9215686, 1, 0, 1,
-0.8754792, -0.4298364, -1.960231, 0.9137255, 1, 0, 1,
-0.8720587, 1.073343, 0.4622477, 0.9098039, 1, 0, 1,
-0.867401, 1.733196, 0.184062, 0.9019608, 1, 0, 1,
-0.8607355, 0.1356104, -2.61889, 0.8941177, 1, 0, 1,
-0.8573768, 0.1854635, -1.463814, 0.8901961, 1, 0, 1,
-0.8520924, 0.2971401, -2.999265, 0.8823529, 1, 0, 1,
-0.8519231, -0.7454413, -1.699294, 0.8784314, 1, 0, 1,
-0.8492056, -1.667314, -3.122747, 0.8705882, 1, 0, 1,
-0.8484758, -1.23312, -1.702809, 0.8666667, 1, 0, 1,
-0.8453509, 0.07969958, -2.659601, 0.8588235, 1, 0, 1,
-0.8443896, 1.97173, -1.008148, 0.854902, 1, 0, 1,
-0.843854, -0.5122911, -1.785917, 0.8470588, 1, 0, 1,
-0.8316651, -0.1593573, -2.962828, 0.8431373, 1, 0, 1,
-0.8306225, -1.022948, -0.7363706, 0.8352941, 1, 0, 1,
-0.8167474, 1.029668, -2.642573, 0.8313726, 1, 0, 1,
-0.8164632, 0.5290888, -0.1605389, 0.8235294, 1, 0, 1,
-0.8162579, 0.2334612, -2.011712, 0.8196079, 1, 0, 1,
-0.8148339, -0.8208413, -1.137929, 0.8117647, 1, 0, 1,
-0.8099365, 0.1587771, -3.662043, 0.8078431, 1, 0, 1,
-0.8040099, -1.329925, -2.326762, 0.8, 1, 0, 1,
-0.80268, 1.209773, 0.7315342, 0.7921569, 1, 0, 1,
-0.8020891, -0.4130764, -1.878742, 0.7882353, 1, 0, 1,
-0.7988401, -0.2139981, -0.6253328, 0.7803922, 1, 0, 1,
-0.7984954, 0.7017695, 0.07577713, 0.7764706, 1, 0, 1,
-0.7982754, 0.4039966, -0.3388719, 0.7686275, 1, 0, 1,
-0.7976102, 0.04859642, -1.078596, 0.7647059, 1, 0, 1,
-0.7930845, 0.7477007, -0.7354674, 0.7568628, 1, 0, 1,
-0.7921295, -0.4728257, -2.823945, 0.7529412, 1, 0, 1,
-0.7857006, -1.168982, -1.176267, 0.7450981, 1, 0, 1,
-0.7815436, -0.738616, -2.920411, 0.7411765, 1, 0, 1,
-0.7783217, -0.4252115, -1.159149, 0.7333333, 1, 0, 1,
-0.776019, 0.2016765, -1.131168, 0.7294118, 1, 0, 1,
-0.7750787, 0.07296407, -1.530238, 0.7215686, 1, 0, 1,
-0.7740679, -0.4252808, -0.8723898, 0.7176471, 1, 0, 1,
-0.7701266, 1.246822, -1.779409, 0.7098039, 1, 0, 1,
-0.769399, 0.08483229, -0.7277678, 0.7058824, 1, 0, 1,
-0.7617478, -0.06103673, -1.413445, 0.6980392, 1, 0, 1,
-0.7587544, -0.7046635, -2.332579, 0.6901961, 1, 0, 1,
-0.7575732, 1.043637, 1.845971, 0.6862745, 1, 0, 1,
-0.7552828, 0.442394, 2.253103, 0.6784314, 1, 0, 1,
-0.7494199, -0.6761581, -1.722893, 0.6745098, 1, 0, 1,
-0.7427425, -0.2050559, -1.817683, 0.6666667, 1, 0, 1,
-0.7412955, 1.103459, -1.053498, 0.6627451, 1, 0, 1,
-0.7364491, -1.414096, -3.24105, 0.654902, 1, 0, 1,
-0.7349148, 2.120533, -0.3753102, 0.6509804, 1, 0, 1,
-0.7328205, -1.834656, -2.486566, 0.6431373, 1, 0, 1,
-0.7327372, 1.112084, 0.05625824, 0.6392157, 1, 0, 1,
-0.7237895, -2.605322, -3.199653, 0.6313726, 1, 0, 1,
-0.7131482, -0.2972554, -2.199613, 0.627451, 1, 0, 1,
-0.71246, -0.4307294, -0.3459027, 0.6196079, 1, 0, 1,
-0.7121267, 2.379265, -0.4362306, 0.6156863, 1, 0, 1,
-0.7102945, -0.6792352, -1.937121, 0.6078432, 1, 0, 1,
-0.7009128, 1.583106, -0.3710149, 0.6039216, 1, 0, 1,
-0.6920944, -0.4033177, -0.7381215, 0.5960785, 1, 0, 1,
-0.690334, -1.486722, -1.965097, 0.5882353, 1, 0, 1,
-0.6856663, -0.2433521, -0.8249952, 0.5843138, 1, 0, 1,
-0.6791568, 1.288627, 0.02690219, 0.5764706, 1, 0, 1,
-0.6762894, -0.4141148, -4.214199, 0.572549, 1, 0, 1,
-0.6728226, 0.8021207, -0.9102156, 0.5647059, 1, 0, 1,
-0.6727135, 0.6859028, -0.604688, 0.5607843, 1, 0, 1,
-0.6716865, -0.04211311, -2.668951, 0.5529412, 1, 0, 1,
-0.66811, 0.0788381, -0.7294928, 0.5490196, 1, 0, 1,
-0.6678494, -0.6867909, -0.9085251, 0.5411765, 1, 0, 1,
-0.6667583, 0.9053675, -1.621942, 0.5372549, 1, 0, 1,
-0.6604479, -4.401145, -5.705822, 0.5294118, 1, 0, 1,
-0.6573784, 0.3446075, -0.6325775, 0.5254902, 1, 0, 1,
-0.6455882, -0.3923106, -1.943033, 0.5176471, 1, 0, 1,
-0.6430259, 0.08081839, -2.174245, 0.5137255, 1, 0, 1,
-0.6423798, 1.804805, 0.8294894, 0.5058824, 1, 0, 1,
-0.6398249, -0.1797731, -3.257206, 0.5019608, 1, 0, 1,
-0.6356555, -0.6511625, -0.5045465, 0.4941176, 1, 0, 1,
-0.6341542, -1.400408, -2.776816, 0.4862745, 1, 0, 1,
-0.6321957, -0.0846979, -2.05255, 0.4823529, 1, 0, 1,
-0.6296188, 0.08868249, -1.365704, 0.4745098, 1, 0, 1,
-0.6293895, -0.405425, -1.468743, 0.4705882, 1, 0, 1,
-0.6270703, 1.001795, 0.7649801, 0.4627451, 1, 0, 1,
-0.6155026, 0.132822, -1.837743, 0.4588235, 1, 0, 1,
-0.6141102, 1.424313, -0.3638369, 0.4509804, 1, 0, 1,
-0.6132908, -0.9873147, -1.811823, 0.4470588, 1, 0, 1,
-0.6073501, 1.07845, 1.106909, 0.4392157, 1, 0, 1,
-0.6059106, -0.5143542, -4.129558, 0.4352941, 1, 0, 1,
-0.6024143, 0.5400416, 1.007614, 0.427451, 1, 0, 1,
-0.6022674, -0.005639159, -1.237729, 0.4235294, 1, 0, 1,
-0.600982, -1.143849, -2.501843, 0.4156863, 1, 0, 1,
-0.5980833, 0.3305852, -1.486818, 0.4117647, 1, 0, 1,
-0.5941776, -0.03385896, -0.3964632, 0.4039216, 1, 0, 1,
-0.5914059, 3.414083, -1.444132, 0.3960784, 1, 0, 1,
-0.5890594, 0.5657965, -0.02903571, 0.3921569, 1, 0, 1,
-0.5765151, 0.2078734, -2.436137, 0.3843137, 1, 0, 1,
-0.5734051, -0.1854107, -1.134418, 0.3803922, 1, 0, 1,
-0.5729315, -1.727814, -3.558652, 0.372549, 1, 0, 1,
-0.5661042, -0.7131834, -3.520372, 0.3686275, 1, 0, 1,
-0.5643805, -0.583764, -3.147636, 0.3607843, 1, 0, 1,
-0.5619627, -0.4599301, -2.937865, 0.3568628, 1, 0, 1,
-0.5597906, -1.200732, -4.870809, 0.3490196, 1, 0, 1,
-0.5551539, 1.077267, -0.1507931, 0.345098, 1, 0, 1,
-0.5527074, 1.175895, 0.341877, 0.3372549, 1, 0, 1,
-0.5506473, -1.289266, -3.521103, 0.3333333, 1, 0, 1,
-0.54994, -0.7931322, -2.150755, 0.3254902, 1, 0, 1,
-0.5403646, -1.362203, -3.141518, 0.3215686, 1, 0, 1,
-0.5295564, 1.14968, 0.7136949, 0.3137255, 1, 0, 1,
-0.5294076, -1.767126, -2.284648, 0.3098039, 1, 0, 1,
-0.5286581, 0.8034941, -0.5709944, 0.3019608, 1, 0, 1,
-0.5266348, -0.2768407, -1.046879, 0.2941177, 1, 0, 1,
-0.5229833, -1.287514, -3.60161, 0.2901961, 1, 0, 1,
-0.5199611, -0.4690035, -1.156944, 0.282353, 1, 0, 1,
-0.5170053, 1.251401, -0.3153569, 0.2784314, 1, 0, 1,
-0.5152157, -1.400529, -3.120938, 0.2705882, 1, 0, 1,
-0.5147755, 0.2961415, 0.2646352, 0.2666667, 1, 0, 1,
-0.5146582, -1.662291, -3.26921, 0.2588235, 1, 0, 1,
-0.5077129, -0.2415941, -1.670814, 0.254902, 1, 0, 1,
-0.5060385, 0.3866033, -3.006335, 0.2470588, 1, 0, 1,
-0.5028977, -0.7622769, -2.221253, 0.2431373, 1, 0, 1,
-0.4998392, -0.6681834, -2.125295, 0.2352941, 1, 0, 1,
-0.4949247, -0.4166035, -3.427007, 0.2313726, 1, 0, 1,
-0.4941371, -1.697802, -2.883971, 0.2235294, 1, 0, 1,
-0.4940308, 0.6750528, -0.4257114, 0.2196078, 1, 0, 1,
-0.4927652, 1.354654, -0.1770813, 0.2117647, 1, 0, 1,
-0.4919348, 0.1445994, 0.9486441, 0.2078431, 1, 0, 1,
-0.491304, 0.1548441, -2.213615, 0.2, 1, 0, 1,
-0.4900802, -0.5953092, -2.493778, 0.1921569, 1, 0, 1,
-0.4892108, -0.7274908, -2.449138, 0.1882353, 1, 0, 1,
-0.4869863, 0.2422673, -1.265431, 0.1803922, 1, 0, 1,
-0.4849485, 1.079307, 1.497179, 0.1764706, 1, 0, 1,
-0.4818186, -0.09583898, -2.062448, 0.1686275, 1, 0, 1,
-0.4769665, -0.02860216, -1.494809, 0.1647059, 1, 0, 1,
-0.4753424, 2.036935, 0.6672155, 0.1568628, 1, 0, 1,
-0.4744704, -1.81083, -2.790642, 0.1529412, 1, 0, 1,
-0.4674352, 0.3933717, 0.2803083, 0.145098, 1, 0, 1,
-0.4649408, -1.523224, -3.109223, 0.1411765, 1, 0, 1,
-0.4644886, -1.219957, -0.7386684, 0.1333333, 1, 0, 1,
-0.4556186, -0.8238778, -4.13787, 0.1294118, 1, 0, 1,
-0.4529344, -0.2353889, -4.611538, 0.1215686, 1, 0, 1,
-0.4495193, 1.326694, -0.3239118, 0.1176471, 1, 0, 1,
-0.4490847, 0.01210664, -0.9246486, 0.1098039, 1, 0, 1,
-0.4395176, 0.591466, -0.5623944, 0.1058824, 1, 0, 1,
-0.4379317, 0.9936066, 2.640712, 0.09803922, 1, 0, 1,
-0.4371934, 0.7062457, -1.295314, 0.09019608, 1, 0, 1,
-0.4344191, 0.02124047, -2.268402, 0.08627451, 1, 0, 1,
-0.4337369, 1.194496, 1.128572, 0.07843138, 1, 0, 1,
-0.4323058, 0.02310947, -1.314621, 0.07450981, 1, 0, 1,
-0.4301752, -0.007555043, 0.3353649, 0.06666667, 1, 0, 1,
-0.4273421, 0.3703507, -1.24144, 0.0627451, 1, 0, 1,
-0.4228275, -0.004071794, -3.169088, 0.05490196, 1, 0, 1,
-0.4216006, 1.224303, -1.395267, 0.05098039, 1, 0, 1,
-0.4212186, -0.3911055, -1.469764, 0.04313726, 1, 0, 1,
-0.4159859, 1.241694, 2.691879, 0.03921569, 1, 0, 1,
-0.4141844, -0.5386652, -3.086466, 0.03137255, 1, 0, 1,
-0.4096374, -0.8587599, -3.017289, 0.02745098, 1, 0, 1,
-0.4090821, -2.978868, -2.885665, 0.01960784, 1, 0, 1,
-0.4081405, 1.115838, 1.508588, 0.01568628, 1, 0, 1,
-0.399583, -2.932931, -3.836554, 0.007843138, 1, 0, 1,
-0.3987373, -0.4897358, -3.338862, 0.003921569, 1, 0, 1,
-0.3969954, -0.3075226, -0.7482165, 0, 1, 0.003921569, 1,
-0.3963642, 1.483708, -0.8316966, 0, 1, 0.01176471, 1,
-0.3961131, 0.1094463, -0.5403396, 0, 1, 0.01568628, 1,
-0.3954169, 0.7539482, -1.759458, 0, 1, 0.02352941, 1,
-0.3888633, 0.4824928, -0.4637125, 0, 1, 0.02745098, 1,
-0.3878613, 0.6550433, 0.636178, 0, 1, 0.03529412, 1,
-0.3833312, 1.111171, 1.099967, 0, 1, 0.03921569, 1,
-0.3741433, 1.742809, -0.289858, 0, 1, 0.04705882, 1,
-0.3739715, -0.4383803, -2.002982, 0, 1, 0.05098039, 1,
-0.3739449, 0.3235005, -2.445611, 0, 1, 0.05882353, 1,
-0.3656513, 0.2711655, -1.540271, 0, 1, 0.0627451, 1,
-0.3647587, 0.4599582, 0.3528874, 0, 1, 0.07058824, 1,
-0.3638453, -0.1921141, -1.622233, 0, 1, 0.07450981, 1,
-0.3602129, 0.05636444, -1.767617, 0, 1, 0.08235294, 1,
-0.353035, -2.508839, -3.182367, 0, 1, 0.08627451, 1,
-0.3526129, 0.832065, -0.8530157, 0, 1, 0.09411765, 1,
-0.3523397, -0.816434, -2.749275, 0, 1, 0.1019608, 1,
-0.3511328, -0.7631092, -1.103691, 0, 1, 0.1058824, 1,
-0.3493923, 1.871189, -0.8346917, 0, 1, 0.1137255, 1,
-0.3473258, -2.086814, -1.74639, 0, 1, 0.1176471, 1,
-0.3460565, -2.046197, -3.192866, 0, 1, 0.1254902, 1,
-0.3430497, 0.1693394, -1.810384, 0, 1, 0.1294118, 1,
-0.3424175, -1.192659, -3.7799, 0, 1, 0.1372549, 1,
-0.3349257, 0.1253774, -2.18712, 0, 1, 0.1411765, 1,
-0.3346408, 0.2076254, -2.967788, 0, 1, 0.1490196, 1,
-0.3332844, -0.4197967, -2.354697, 0, 1, 0.1529412, 1,
-0.3302763, -0.1870829, -1.815657, 0, 1, 0.1607843, 1,
-0.3232073, 0.8681553, -0.2814891, 0, 1, 0.1647059, 1,
-0.3229031, 0.06449644, -0.9648001, 0, 1, 0.172549, 1,
-0.3227201, 0.5943001, -1.29175, 0, 1, 0.1764706, 1,
-0.3224292, 1.766142, 0.1945233, 0, 1, 0.1843137, 1,
-0.3218468, -0.862207, -4.420593, 0, 1, 0.1882353, 1,
-0.3196282, 1.858573, 0.206109, 0, 1, 0.1960784, 1,
-0.3170231, -0.1585898, -3.321309, 0, 1, 0.2039216, 1,
-0.3132857, -0.01822262, 0.4240508, 0, 1, 0.2078431, 1,
-0.3132495, -0.3689753, -3.223113, 0, 1, 0.2156863, 1,
-0.3120824, 0.2487448, -1.240569, 0, 1, 0.2196078, 1,
-0.3103483, -0.644936, -3.610347, 0, 1, 0.227451, 1,
-0.309013, 0.8616499, -0.2319343, 0, 1, 0.2313726, 1,
-0.3069042, -0.5666663, -2.351378, 0, 1, 0.2392157, 1,
-0.3003396, -1.304139, -2.710647, 0, 1, 0.2431373, 1,
-0.2997545, 0.5153393, -0.9017302, 0, 1, 0.2509804, 1,
-0.2991802, -0.6981773, -4.053647, 0, 1, 0.254902, 1,
-0.2989985, 0.8170015, -0.08293261, 0, 1, 0.2627451, 1,
-0.2945989, -1.291938, -0.394264, 0, 1, 0.2666667, 1,
-0.2939633, 0.8816218, 0.2724457, 0, 1, 0.2745098, 1,
-0.2858101, -0.3796645, -2.431511, 0, 1, 0.2784314, 1,
-0.2845064, 0.5046663, -1.492566, 0, 1, 0.2862745, 1,
-0.2841186, -0.3075924, -3.72669, 0, 1, 0.2901961, 1,
-0.2807346, -0.4120525, 0.004853742, 0, 1, 0.2980392, 1,
-0.2781337, 0.3999345, -0.7215951, 0, 1, 0.3058824, 1,
-0.2766748, -1.526033, -1.096287, 0, 1, 0.3098039, 1,
-0.2764891, -1.320477, -2.021433, 0, 1, 0.3176471, 1,
-0.2720896, -0.7552833, -1.824598, 0, 1, 0.3215686, 1,
-0.2711696, -0.137962, -2.351064, 0, 1, 0.3294118, 1,
-0.2677479, 0.2121809, -0.477073, 0, 1, 0.3333333, 1,
-0.2579681, -1.492146, -2.483039, 0, 1, 0.3411765, 1,
-0.257125, 1.577328, 0.02881348, 0, 1, 0.345098, 1,
-0.2512057, -2.44973, -2.231303, 0, 1, 0.3529412, 1,
-0.2447623, -0.5549571, -3.824996, 0, 1, 0.3568628, 1,
-0.238387, 0.4224647, -1.512375, 0, 1, 0.3647059, 1,
-0.2305561, 0.2133446, 0.782871, 0, 1, 0.3686275, 1,
-0.2282329, 0.4250399, 0.911876, 0, 1, 0.3764706, 1,
-0.2269867, -0.3409947, -1.361549, 0, 1, 0.3803922, 1,
-0.2247467, 0.6226925, -0.5690877, 0, 1, 0.3882353, 1,
-0.2186319, -1.038324, -4.268791, 0, 1, 0.3921569, 1,
-0.2180185, -0.6911545, -1.54326, 0, 1, 0.4, 1,
-0.2163848, 0.6239539, -1.573351, 0, 1, 0.4078431, 1,
-0.215405, 1.775232, -0.9789687, 0, 1, 0.4117647, 1,
-0.2153986, -1.248208, -2.175484, 0, 1, 0.4196078, 1,
-0.2070499, 1.1285, -0.04758947, 0, 1, 0.4235294, 1,
-0.2062784, 0.4957807, 1.525029, 0, 1, 0.4313726, 1,
-0.2058905, 0.4172741, -0.8134448, 0, 1, 0.4352941, 1,
-0.2057738, -0.1173071, -0.9001184, 0, 1, 0.4431373, 1,
-0.2029399, -0.9911411, -4.461736, 0, 1, 0.4470588, 1,
-0.2016441, 0.9588244, -1.049427, 0, 1, 0.454902, 1,
-0.1998508, 0.9339148, -1.585636, 0, 1, 0.4588235, 1,
-0.1935949, 0.449727, -2.321892, 0, 1, 0.4666667, 1,
-0.192695, 0.2587942, 0.6756133, 0, 1, 0.4705882, 1,
-0.1825598, -0.812342, -0.8759682, 0, 1, 0.4784314, 1,
-0.181746, 1.500307, -0.3212289, 0, 1, 0.4823529, 1,
-0.1798299, -1.163157, -3.027774, 0, 1, 0.4901961, 1,
-0.1733155, -1.227637, -2.936572, 0, 1, 0.4941176, 1,
-0.1730586, 1.082208, 0.7109275, 0, 1, 0.5019608, 1,
-0.1702052, 0.7757022, -0.7213653, 0, 1, 0.509804, 1,
-0.1664699, 2.111112, 0.9978044, 0, 1, 0.5137255, 1,
-0.1637156, -0.2920713, -2.54977, 0, 1, 0.5215687, 1,
-0.1635906, -0.4463609, -0.9428134, 0, 1, 0.5254902, 1,
-0.1629063, -0.8420529, -3.343292, 0, 1, 0.5333334, 1,
-0.1594226, 1.676211, 3.255623, 0, 1, 0.5372549, 1,
-0.1583343, -0.9178149, -3.14449, 0, 1, 0.5450981, 1,
-0.1578404, -0.8638241, -2.861223, 0, 1, 0.5490196, 1,
-0.1573042, 0.3058485, -1.622002, 0, 1, 0.5568628, 1,
-0.1558329, 0.5791913, -0.3138849, 0, 1, 0.5607843, 1,
-0.154737, -2.044381, -3.601004, 0, 1, 0.5686275, 1,
-0.1538003, 2.179569, 0.2028819, 0, 1, 0.572549, 1,
-0.153119, 0.9005833, -0.9626754, 0, 1, 0.5803922, 1,
-0.1527189, -0.9590557, -2.919277, 0, 1, 0.5843138, 1,
-0.1508974, 0.5369585, -0.2679656, 0, 1, 0.5921569, 1,
-0.1442753, -1.34311, -4.05332, 0, 1, 0.5960785, 1,
-0.1427841, -1.766954, -4.330629, 0, 1, 0.6039216, 1,
-0.1393858, -0.4257928, -2.159648, 0, 1, 0.6117647, 1,
-0.1376892, -0.9914253, -3.144373, 0, 1, 0.6156863, 1,
-0.1369898, -1.665791, -2.46322, 0, 1, 0.6235294, 1,
-0.1323895, -1.498965, -3.51192, 0, 1, 0.627451, 1,
-0.1306387, -1.56837, -4.00138, 0, 1, 0.6352941, 1,
-0.1295411, 1.421531, -1.465475, 0, 1, 0.6392157, 1,
-0.1294361, 0.6979206, 0.3337596, 0, 1, 0.6470588, 1,
-0.1239563, 0.797803, -1.383292, 0, 1, 0.6509804, 1,
-0.1212632, -1.436382, -3.051531, 0, 1, 0.6588235, 1,
-0.1212497, -0.2005108, -3.439396, 0, 1, 0.6627451, 1,
-0.1197477, 0.7345802, 0.8187233, 0, 1, 0.6705883, 1,
-0.1140161, 0.6724666, -0.2445329, 0, 1, 0.6745098, 1,
-0.113337, -0.1489852, -3.171207, 0, 1, 0.682353, 1,
-0.1131766, 1.38588, 1.291686, 0, 1, 0.6862745, 1,
-0.1121807, -0.4214815, -3.376314, 0, 1, 0.6941177, 1,
-0.1115555, 0.3992537, -0.6587043, 0, 1, 0.7019608, 1,
-0.1086512, 0.6287619, 0.8707263, 0, 1, 0.7058824, 1,
-0.1056452, -1.405938, -2.729713, 0, 1, 0.7137255, 1,
-0.1052909, 0.7595348, -0.5635008, 0, 1, 0.7176471, 1,
-0.1037075, 0.6561141, 0.2748226, 0, 1, 0.7254902, 1,
-0.1030517, -0.8147526, -4.658717, 0, 1, 0.7294118, 1,
-0.1028792, 1.366956, 0.9165167, 0, 1, 0.7372549, 1,
-0.1021537, 0.3344138, -1.790164, 0, 1, 0.7411765, 1,
-0.09537156, 1.615634, -0.9697117, 0, 1, 0.7490196, 1,
-0.09453251, 1.252255, 0.6170032, 0, 1, 0.7529412, 1,
-0.09206717, 0.6059447, -0.7097585, 0, 1, 0.7607843, 1,
-0.09057491, 1.033045, 0.07218051, 0, 1, 0.7647059, 1,
-0.09021727, -0.8764709, -2.836174, 0, 1, 0.772549, 1,
-0.09018411, -0.05900826, -4.142959, 0, 1, 0.7764706, 1,
-0.08828896, -0.7793988, -2.684826, 0, 1, 0.7843137, 1,
-0.08711495, 0.1879909, 1.270026, 0, 1, 0.7882353, 1,
-0.08674841, -0.7337224, -2.763563, 0, 1, 0.7960784, 1,
-0.08479806, -1.452592, -2.598106, 0, 1, 0.8039216, 1,
-0.08288366, -0.5234714, -2.640018, 0, 1, 0.8078431, 1,
-0.08221731, -1.420943, -2.805103, 0, 1, 0.8156863, 1,
-0.08167592, 0.4731113, -0.7731017, 0, 1, 0.8196079, 1,
-0.08112628, -0.6669983, -3.05463, 0, 1, 0.827451, 1,
-0.08022942, -0.05707105, -2.106581, 0, 1, 0.8313726, 1,
-0.06960859, 1.061519, 0.9095962, 0, 1, 0.8392157, 1,
-0.0667291, -1.302616, -5.155838, 0, 1, 0.8431373, 1,
-0.06416332, -1.762988, -3.982274, 0, 1, 0.8509804, 1,
-0.06121299, -0.7997344, -3.813057, 0, 1, 0.854902, 1,
-0.06090491, -2.103224, -2.234318, 0, 1, 0.8627451, 1,
-0.05855728, -0.0632775, -3.849017, 0, 1, 0.8666667, 1,
-0.05749033, 0.7081527, 1.321652, 0, 1, 0.8745098, 1,
-0.05145835, -0.03447423, -2.666988, 0, 1, 0.8784314, 1,
-0.04383452, 1.574698, 0.4372816, 0, 1, 0.8862745, 1,
-0.04123729, -0.1256006, -3.659498, 0, 1, 0.8901961, 1,
-0.0397161, 1.197119, -0.4718836, 0, 1, 0.8980392, 1,
-0.0383129, -1.962496, -4.491937, 0, 1, 0.9058824, 1,
-0.03819278, 2.665521, 1.183448, 0, 1, 0.9098039, 1,
-0.03396136, 0.3190711, -0.09103332, 0, 1, 0.9176471, 1,
-0.02306452, -0.1132914, -2.813233, 0, 1, 0.9215686, 1,
-0.02004985, 1.425486, -1.127353, 0, 1, 0.9294118, 1,
-0.0199454, 0.2069215, 0.803231, 0, 1, 0.9333333, 1,
-0.01861997, 0.5454072, -1.209481, 0, 1, 0.9411765, 1,
-0.01782275, 1.242026, -0.2567446, 0, 1, 0.945098, 1,
-0.01395341, -1.001439, -3.501407, 0, 1, 0.9529412, 1,
-0.01257254, 0.006540627, 0.08032066, 0, 1, 0.9568627, 1,
-0.01236357, 0.3943383, -0.7239077, 0, 1, 0.9647059, 1,
-0.009209049, 1.542046, -0.4025243, 0, 1, 0.9686275, 1,
0.0003327027, -1.603753, 2.294885, 0, 1, 0.9764706, 1,
0.0003711167, -1.117895, 3.20174, 0, 1, 0.9803922, 1,
0.001724218, -0.437622, 3.299144, 0, 1, 0.9882353, 1,
0.002216495, -0.7840476, 3.920995, 0, 1, 0.9921569, 1,
0.002852812, 0.6103112, -0.7804667, 0, 1, 1, 1,
0.01712858, -0.2357514, 3.818692, 0, 0.9921569, 1, 1,
0.01857119, 0.3485787, 1.333788, 0, 0.9882353, 1, 1,
0.02265393, -0.5048086, 4.399387, 0, 0.9803922, 1, 1,
0.02672954, 0.9576916, -0.577979, 0, 0.9764706, 1, 1,
0.02678264, -1.561957, 3.305573, 0, 0.9686275, 1, 1,
0.02859647, -1.00898, 3.262067, 0, 0.9647059, 1, 1,
0.03036453, -2.521298, 5.291037, 0, 0.9568627, 1, 1,
0.03126702, 0.5313672, 0.01577589, 0, 0.9529412, 1, 1,
0.03370867, 1.25464, -1.429173, 0, 0.945098, 1, 1,
0.03415417, 0.3976173, 0.2613562, 0, 0.9411765, 1, 1,
0.03617211, 0.1328186, -0.1075754, 0, 0.9333333, 1, 1,
0.04126608, -1.383455, 4.603048, 0, 0.9294118, 1, 1,
0.04177542, 0.7681316, 0.004352896, 0, 0.9215686, 1, 1,
0.04288702, 0.2367224, 2.66467, 0, 0.9176471, 1, 1,
0.0439346, -0.01785262, 1.720977, 0, 0.9098039, 1, 1,
0.04624723, 0.4070774, 0.3691918, 0, 0.9058824, 1, 1,
0.05809677, 1.065332, 0.1890394, 0, 0.8980392, 1, 1,
0.06135282, 1.798959, -0.02508211, 0, 0.8901961, 1, 1,
0.0624563, 0.03765569, 0.04372495, 0, 0.8862745, 1, 1,
0.06664656, -1.549243, 3.705563, 0, 0.8784314, 1, 1,
0.06896375, -0.6714376, 2.402892, 0, 0.8745098, 1, 1,
0.07101025, 0.7373108, -0.4295582, 0, 0.8666667, 1, 1,
0.07320563, -0.04722056, 2.010137, 0, 0.8627451, 1, 1,
0.07613847, 3.000662, -0.352429, 0, 0.854902, 1, 1,
0.07714419, -0.01955364, 1.844209, 0, 0.8509804, 1, 1,
0.0775197, -0.6128398, 3.126776, 0, 0.8431373, 1, 1,
0.07764996, -0.9274495, 4.441335, 0, 0.8392157, 1, 1,
0.09499567, 0.02552153, 2.205563, 0, 0.8313726, 1, 1,
0.09570204, -0.6950151, 3.985126, 0, 0.827451, 1, 1,
0.09625126, 1.817646, 1.106942, 0, 0.8196079, 1, 1,
0.09785287, -0.01139474, 0.3946872, 0, 0.8156863, 1, 1,
0.09808496, -0.3882064, 3.003268, 0, 0.8078431, 1, 1,
0.09841355, -0.4937095, 3.937871, 0, 0.8039216, 1, 1,
0.1017295, 0.1901358, 1.089925, 0, 0.7960784, 1, 1,
0.1046959, 0.3045154, -0.05477549, 0, 0.7882353, 1, 1,
0.1060212, 0.0006160056, 2.886927, 0, 0.7843137, 1, 1,
0.1072951, 0.2494401, -0.2601996, 0, 0.7764706, 1, 1,
0.1121611, -0.3341154, 2.156285, 0, 0.772549, 1, 1,
0.1130522, 0.5672698, 0.0944873, 0, 0.7647059, 1, 1,
0.1141219, -1.238486, 3.23977, 0, 0.7607843, 1, 1,
0.1157359, 0.06449997, 2.582194, 0, 0.7529412, 1, 1,
0.1194603, 1.032137, -0.410182, 0, 0.7490196, 1, 1,
0.1234213, -0.4638488, 1.553592, 0, 0.7411765, 1, 1,
0.125009, 1.399086, 0.1475502, 0, 0.7372549, 1, 1,
0.1264006, -1.046627, 1.695532, 0, 0.7294118, 1, 1,
0.127055, -0.1345142, 2.967761, 0, 0.7254902, 1, 1,
0.128435, -0.4382024, 4.18018, 0, 0.7176471, 1, 1,
0.129296, 0.3437067, 0.8829066, 0, 0.7137255, 1, 1,
0.1311584, -0.03707041, 1.825854, 0, 0.7058824, 1, 1,
0.1313628, -0.008935728, 2.792988, 0, 0.6980392, 1, 1,
0.1383696, -0.2787875, 3.65376, 0, 0.6941177, 1, 1,
0.1438452, -1.778318, 4.885225, 0, 0.6862745, 1, 1,
0.1482973, 0.2218566, 0.8077578, 0, 0.682353, 1, 1,
0.1506278, 2.326931, -0.4933509, 0, 0.6745098, 1, 1,
0.1511335, 0.3872381, 0.6998236, 0, 0.6705883, 1, 1,
0.1516707, -1.418412, 2.031866, 0, 0.6627451, 1, 1,
0.1556012, -0.3839135, 1.430225, 0, 0.6588235, 1, 1,
0.1591926, -0.4025511, 3.19032, 0, 0.6509804, 1, 1,
0.1621703, 1.258877, -0.8081198, 0, 0.6470588, 1, 1,
0.1628594, -1.444569, 2.723332, 0, 0.6392157, 1, 1,
0.1730795, -1.952451, 4.756796, 0, 0.6352941, 1, 1,
0.1744127, -0.1083409, 1.297551, 0, 0.627451, 1, 1,
0.1783733, -1.237173, 2.419019, 0, 0.6235294, 1, 1,
0.1807455, -0.9902549, 3.464615, 0, 0.6156863, 1, 1,
0.1831349, 1.239165, -0.421261, 0, 0.6117647, 1, 1,
0.1841336, -1.075391, 1.739989, 0, 0.6039216, 1, 1,
0.1871849, 0.7383553, 1.87492, 0, 0.5960785, 1, 1,
0.2046552, 1.764077, -0.9949862, 0, 0.5921569, 1, 1,
0.2093776, 0.1449924, 1.848005, 0, 0.5843138, 1, 1,
0.2108393, 0.3375734, 1.120872, 0, 0.5803922, 1, 1,
0.2115814, 0.4468589, 0.8761316, 0, 0.572549, 1, 1,
0.2138314, 1.441387, 1.630173, 0, 0.5686275, 1, 1,
0.2152285, -0.6614282, 3.336307, 0, 0.5607843, 1, 1,
0.2157004, -0.01487911, 0.690316, 0, 0.5568628, 1, 1,
0.2240103, -0.1898727, 2.840475, 0, 0.5490196, 1, 1,
0.2258969, 1.342457, 0.3343972, 0, 0.5450981, 1, 1,
0.229829, -0.8879033, 3.60851, 0, 0.5372549, 1, 1,
0.2307914, 0.8568909, 1.655166, 0, 0.5333334, 1, 1,
0.2315856, -0.8475642, 2.352201, 0, 0.5254902, 1, 1,
0.2330736, -0.6132803, 1.658932, 0, 0.5215687, 1, 1,
0.2358156, -0.9842141, 3.844399, 0, 0.5137255, 1, 1,
0.2363302, 0.904005, 0.1614852, 0, 0.509804, 1, 1,
0.2423854, -1.029379, 1.964039, 0, 0.5019608, 1, 1,
0.2455964, 1.013225, -0.2203621, 0, 0.4941176, 1, 1,
0.2470621, 0.2140869, 3.058371, 0, 0.4901961, 1, 1,
0.2488407, 0.2116716, 1.027379, 0, 0.4823529, 1, 1,
0.2511395, -0.472373, 4.242698, 0, 0.4784314, 1, 1,
0.2535721, 0.7861651, -0.3825665, 0, 0.4705882, 1, 1,
0.2557921, 0.1475687, 0.8248469, 0, 0.4666667, 1, 1,
0.2600702, 0.4810972, 2.241272, 0, 0.4588235, 1, 1,
0.2605025, 0.5956687, 0.7941081, 0, 0.454902, 1, 1,
0.2645732, -0.1579074, 0.6089613, 0, 0.4470588, 1, 1,
0.2670166, -0.8898031, 2.589456, 0, 0.4431373, 1, 1,
0.2673689, -1.411913, 2.437366, 0, 0.4352941, 1, 1,
0.2701911, 0.6008038, -0.1812489, 0, 0.4313726, 1, 1,
0.2795122, -1.27283, 3.071662, 0, 0.4235294, 1, 1,
0.279654, 0.932923, 0.69098, 0, 0.4196078, 1, 1,
0.2796832, 0.05888633, 1.352259, 0, 0.4117647, 1, 1,
0.2819764, -0.02248126, 0.6477717, 0, 0.4078431, 1, 1,
0.2827097, -2.002519, 2.824553, 0, 0.4, 1, 1,
0.2850201, -0.6256695, 2.378252, 0, 0.3921569, 1, 1,
0.2877196, 2.156915, 1.779869, 0, 0.3882353, 1, 1,
0.2897162, 0.3284155, 0.7553, 0, 0.3803922, 1, 1,
0.2898025, -1.281027, 2.951107, 0, 0.3764706, 1, 1,
0.2912653, -0.2911729, 2.467059, 0, 0.3686275, 1, 1,
0.2960733, 0.06220908, 0.961129, 0, 0.3647059, 1, 1,
0.297322, -0.07475328, 4.029111, 0, 0.3568628, 1, 1,
0.2978104, -1.405227, 2.468364, 0, 0.3529412, 1, 1,
0.3010561, -2.278046, 3.521496, 0, 0.345098, 1, 1,
0.3056246, -1.110594, 1.744805, 0, 0.3411765, 1, 1,
0.3132752, 0.4523697, 1.095592, 0, 0.3333333, 1, 1,
0.3136388, -1.417601, 3.080897, 0, 0.3294118, 1, 1,
0.3195034, -1.427206, 3.632299, 0, 0.3215686, 1, 1,
0.3196848, -2.457326, 3.058386, 0, 0.3176471, 1, 1,
0.3240262, -1.923683, 2.375207, 0, 0.3098039, 1, 1,
0.3240616, 0.4043963, 0.06567574, 0, 0.3058824, 1, 1,
0.3244706, -0.2580644, 3.261051, 0, 0.2980392, 1, 1,
0.3332441, -0.06437932, 2.104909, 0, 0.2901961, 1, 1,
0.3339505, -1.03818, 3.50095, 0, 0.2862745, 1, 1,
0.3438441, -0.8287481, 2.642031, 0, 0.2784314, 1, 1,
0.344174, 1.319355, 1.225702, 0, 0.2745098, 1, 1,
0.347028, -1.075717, 2.562825, 0, 0.2666667, 1, 1,
0.348141, -1.237226, 2.786041, 0, 0.2627451, 1, 1,
0.349316, -0.9098527, 4.248598, 0, 0.254902, 1, 1,
0.3512264, 0.03811081, 1.626894, 0, 0.2509804, 1, 1,
0.3532729, 0.3810936, 1.122162, 0, 0.2431373, 1, 1,
0.3593542, 0.7434942, 1.325904, 0, 0.2392157, 1, 1,
0.3594314, 0.2586585, -0.2790326, 0, 0.2313726, 1, 1,
0.3597341, 1.304177, 0.6829612, 0, 0.227451, 1, 1,
0.3637558, 0.5766805, 0.6484382, 0, 0.2196078, 1, 1,
0.3682566, -0.1449853, 2.609839, 0, 0.2156863, 1, 1,
0.3685989, -0.190921, 2.134312, 0, 0.2078431, 1, 1,
0.3727244, -1.616828, 4.762861, 0, 0.2039216, 1, 1,
0.3730662, -1.084694, 3.933768, 0, 0.1960784, 1, 1,
0.3735396, 2.025951, -0.8387344, 0, 0.1882353, 1, 1,
0.3750908, -0.1935879, -0.04546522, 0, 0.1843137, 1, 1,
0.3755571, -0.2790661, 2.408743, 0, 0.1764706, 1, 1,
0.3759744, 0.60764, 0.02110643, 0, 0.172549, 1, 1,
0.3803081, 0.6059843, 0.9000209, 0, 0.1647059, 1, 1,
0.3803303, -0.03381642, 0.7413326, 0, 0.1607843, 1, 1,
0.3830326, 1.386582, 1.926485, 0, 0.1529412, 1, 1,
0.3837668, -0.2334255, 1.516083, 0, 0.1490196, 1, 1,
0.3862559, 0.2177182, 1.855428, 0, 0.1411765, 1, 1,
0.3879959, -0.4082184, 4.34393, 0, 0.1372549, 1, 1,
0.3908129, -0.2781434, 3.146841, 0, 0.1294118, 1, 1,
0.3922176, 0.1302616, 0.8416033, 0, 0.1254902, 1, 1,
0.398813, -0.8618916, 2.83578, 0, 0.1176471, 1, 1,
0.3995799, 1.862607, 0.4134059, 0, 0.1137255, 1, 1,
0.4005379, -0.6761868, 2.451971, 0, 0.1058824, 1, 1,
0.4023744, 1.3068, -0.9088154, 0, 0.09803922, 1, 1,
0.4032045, 0.6138839, 0.6983194, 0, 0.09411765, 1, 1,
0.410611, 1.528204, 0.6430465, 0, 0.08627451, 1, 1,
0.411382, -0.8284755, 4.29116, 0, 0.08235294, 1, 1,
0.4126259, -0.2315431, 1.504075, 0, 0.07450981, 1, 1,
0.414766, 1.846961, 0.5154275, 0, 0.07058824, 1, 1,
0.421192, -1.485356, 1.636355, 0, 0.0627451, 1, 1,
0.4239923, -0.9781134, 1.466502, 0, 0.05882353, 1, 1,
0.4263226, -0.1509008, 2.802879, 0, 0.05098039, 1, 1,
0.434241, 2.171055, 0.5938933, 0, 0.04705882, 1, 1,
0.436417, 0.9683514, 1.707643, 0, 0.03921569, 1, 1,
0.4407204, -0.4388228, 2.749136, 0, 0.03529412, 1, 1,
0.4492797, -1.167343, 4.215743, 0, 0.02745098, 1, 1,
0.4493667, 0.4363513, 0.4481394, 0, 0.02352941, 1, 1,
0.45078, -0.3247167, 2.058866, 0, 0.01568628, 1, 1,
0.4514758, -0.65425, 2.418995, 0, 0.01176471, 1, 1,
0.4517373, -1.036141, 2.557864, 0, 0.003921569, 1, 1,
0.4543386, -0.3685469, 4.89142, 0.003921569, 0, 1, 1,
0.4548155, -1.077682, 2.019943, 0.007843138, 0, 1, 1,
0.4557801, -1.020605, 2.431037, 0.01568628, 0, 1, 1,
0.4572249, -1.782592, 4.159479, 0.01960784, 0, 1, 1,
0.4589621, -0.06786278, 1.042605, 0.02745098, 0, 1, 1,
0.4591902, -2.096521, 1.833835, 0.03137255, 0, 1, 1,
0.4666473, 0.3187289, 1.911226, 0.03921569, 0, 1, 1,
0.4687064, -0.5654103, 1.421603, 0.04313726, 0, 1, 1,
0.4691353, 1.310547, 0.04250168, 0.05098039, 0, 1, 1,
0.4766036, -2.952698, 3.62675, 0.05490196, 0, 1, 1,
0.4823748, -1.718081, 1.187073, 0.0627451, 0, 1, 1,
0.4883462, -0.02136778, 1.597683, 0.06666667, 0, 1, 1,
0.4891148, 1.00496, 1.539147, 0.07450981, 0, 1, 1,
0.4959283, -0.6272039, 3.842127, 0.07843138, 0, 1, 1,
0.4960299, 0.104856, 2.49031, 0.08627451, 0, 1, 1,
0.5053191, -0.9122515, 2.630132, 0.09019608, 0, 1, 1,
0.5080118, -1.247942, 0.9130815, 0.09803922, 0, 1, 1,
0.508494, -1.627345, 2.029585, 0.1058824, 0, 1, 1,
0.5101663, -1.423316, 2.968256, 0.1098039, 0, 1, 1,
0.5168608, 0.2615951, 1.254725, 0.1176471, 0, 1, 1,
0.5207813, 0.5187687, 1.063231, 0.1215686, 0, 1, 1,
0.5209894, 0.695051, -0.1043912, 0.1294118, 0, 1, 1,
0.5233502, -0.5263035, 2.880444, 0.1333333, 0, 1, 1,
0.5258542, 1.83871, -0.4648049, 0.1411765, 0, 1, 1,
0.5261179, -0.1434164, 0.9694223, 0.145098, 0, 1, 1,
0.5263218, -0.5300249, 1.657119, 0.1529412, 0, 1, 1,
0.5277113, 1.206303, -0.5268601, 0.1568628, 0, 1, 1,
0.5370871, -1.320673, 2.533361, 0.1647059, 0, 1, 1,
0.5388682, 0.303301, 1.1126, 0.1686275, 0, 1, 1,
0.5460235, 0.4516497, 1.380365, 0.1764706, 0, 1, 1,
0.5509338, 1.452754, 1.618739, 0.1803922, 0, 1, 1,
0.5543321, -0.3841738, 1.419246, 0.1882353, 0, 1, 1,
0.5555297, 1.705713, 1.284852, 0.1921569, 0, 1, 1,
0.5556393, 2.076857, 1.291281, 0.2, 0, 1, 1,
0.558858, 0.1244694, -0.5344199, 0.2078431, 0, 1, 1,
0.5611417, 1.509607, -0.8306016, 0.2117647, 0, 1, 1,
0.5620311, 1.300991, -0.7671121, 0.2196078, 0, 1, 1,
0.5636629, 0.6545832, 1.563305, 0.2235294, 0, 1, 1,
0.5638515, 0.4367248, 1.271489, 0.2313726, 0, 1, 1,
0.5649445, -1.959567, 3.081617, 0.2352941, 0, 1, 1,
0.5704579, -0.305864, 3.79319, 0.2431373, 0, 1, 1,
0.5745375, -0.2427398, 1.845252, 0.2470588, 0, 1, 1,
0.575463, -1.059773, 2.329144, 0.254902, 0, 1, 1,
0.5754947, 0.8907965, 0.8267893, 0.2588235, 0, 1, 1,
0.5840475, 0.4179706, 0.9407286, 0.2666667, 0, 1, 1,
0.5895211, -0.918556, 3.716932, 0.2705882, 0, 1, 1,
0.5934946, -1.571496, 4.768478, 0.2784314, 0, 1, 1,
0.5939422, -1.156174, 4.466909, 0.282353, 0, 1, 1,
0.5947124, 1.417466, 0.201906, 0.2901961, 0, 1, 1,
0.5956165, -1.317599, 2.486989, 0.2941177, 0, 1, 1,
0.5960162, -0.5066637, 1.490164, 0.3019608, 0, 1, 1,
0.6027937, 0.6056867, 0.9779148, 0.3098039, 0, 1, 1,
0.6052345, 1.658818, 1.492267, 0.3137255, 0, 1, 1,
0.605644, -0.0805108, 3.616566, 0.3215686, 0, 1, 1,
0.6075535, 0.5669405, 2.24492, 0.3254902, 0, 1, 1,
0.6085303, -0.01224945, 2.391375, 0.3333333, 0, 1, 1,
0.6151785, 1.364866, 0.09529825, 0.3372549, 0, 1, 1,
0.6153575, -0.8468591, 2.793619, 0.345098, 0, 1, 1,
0.6177523, 0.5572855, 0.2117653, 0.3490196, 0, 1, 1,
0.6224701, 0.2565272, 0.07758394, 0.3568628, 0, 1, 1,
0.6226324, -0.5260178, 2.508892, 0.3607843, 0, 1, 1,
0.6231855, 0.979503, 2.546296, 0.3686275, 0, 1, 1,
0.6250852, 1.823525, 1.009868, 0.372549, 0, 1, 1,
0.6254123, 1.766942, -0.1194524, 0.3803922, 0, 1, 1,
0.6284032, 2.16803, 0.9075749, 0.3843137, 0, 1, 1,
0.6312202, 0.3171804, -0.143263, 0.3921569, 0, 1, 1,
0.6313, 1.289247, 0.00335705, 0.3960784, 0, 1, 1,
0.6319655, 0.3020898, 2.518307, 0.4039216, 0, 1, 1,
0.6340031, -0.04369237, 2.710314, 0.4117647, 0, 1, 1,
0.6345417, -1.319711, 2.929096, 0.4156863, 0, 1, 1,
0.6349913, -0.1801028, 1.650548, 0.4235294, 0, 1, 1,
0.6415898, 1.466238, 0.4411561, 0.427451, 0, 1, 1,
0.643841, 0.715293, -1.048596, 0.4352941, 0, 1, 1,
0.6485977, 1.253666, 1.185626, 0.4392157, 0, 1, 1,
0.6491386, 1.014605, 0.3832452, 0.4470588, 0, 1, 1,
0.651513, 0.3210292, 2.060548, 0.4509804, 0, 1, 1,
0.6520955, 0.5057448, 2.084068, 0.4588235, 0, 1, 1,
0.6536602, 0.6373506, -0.4069712, 0.4627451, 0, 1, 1,
0.6565296, 1.812811, 0.9083041, 0.4705882, 0, 1, 1,
0.6573671, 0.1685691, 1.071621, 0.4745098, 0, 1, 1,
0.6580625, -0.2611267, 2.549888, 0.4823529, 0, 1, 1,
0.6607447, -2.160991, 3.487285, 0.4862745, 0, 1, 1,
0.6620715, -0.3446638, 2.707122, 0.4941176, 0, 1, 1,
0.66309, -1.663258, 2.344832, 0.5019608, 0, 1, 1,
0.6643335, 0.7348289, 0.988879, 0.5058824, 0, 1, 1,
0.6737043, 0.158148, 0.4915124, 0.5137255, 0, 1, 1,
0.6792043, 0.04587015, 1.921348, 0.5176471, 0, 1, 1,
0.6811124, -1.957918, 2.577484, 0.5254902, 0, 1, 1,
0.6867343, 1.084402, 1.010554, 0.5294118, 0, 1, 1,
0.6915314, -0.7909299, 1.979839, 0.5372549, 0, 1, 1,
0.6928098, -0.821198, 2.066955, 0.5411765, 0, 1, 1,
0.6939529, 0.6562843, -1.186514, 0.5490196, 0, 1, 1,
0.6945868, -0.88052, 1.992662, 0.5529412, 0, 1, 1,
0.7014592, -0.7881938, 2.371925, 0.5607843, 0, 1, 1,
0.7027707, -0.7301419, 1.308524, 0.5647059, 0, 1, 1,
0.7038565, -0.007576272, 1.944054, 0.572549, 0, 1, 1,
0.7127413, -0.1998958, 1.961219, 0.5764706, 0, 1, 1,
0.7128991, -0.115737, 2.553951, 0.5843138, 0, 1, 1,
0.7158071, -0.2793675, 2.168814, 0.5882353, 0, 1, 1,
0.7188029, -0.580283, 1.800588, 0.5960785, 0, 1, 1,
0.7257541, 1.54281, -0.8993586, 0.6039216, 0, 1, 1,
0.7279432, -0.3246212, 1.224331, 0.6078432, 0, 1, 1,
0.7385433, 0.2639468, 0.764108, 0.6156863, 0, 1, 1,
0.7421885, -0.1403087, 1.33797, 0.6196079, 0, 1, 1,
0.7450482, -0.2674443, 1.198846, 0.627451, 0, 1, 1,
0.7512368, 1.806141, -1.776308, 0.6313726, 0, 1, 1,
0.7526805, 0.6824209, -1.692427, 0.6392157, 0, 1, 1,
0.7545012, -0.5007579, 2.400401, 0.6431373, 0, 1, 1,
0.7602533, 1.060113, 0.5506063, 0.6509804, 0, 1, 1,
0.7610518, -0.9067346, 0.102167, 0.654902, 0, 1, 1,
0.7616396, -0.2839921, 1.256845, 0.6627451, 0, 1, 1,
0.7634646, -0.1140236, -0.1435678, 0.6666667, 0, 1, 1,
0.7654979, -1.260898, 4.793231, 0.6745098, 0, 1, 1,
0.7684453, 0.6625947, 0.6359445, 0.6784314, 0, 1, 1,
0.7693341, -0.2004138, 0.9740598, 0.6862745, 0, 1, 1,
0.7743133, -1.654833, 5.005348, 0.6901961, 0, 1, 1,
0.7767872, -1.214763, 3.613655, 0.6980392, 0, 1, 1,
0.7790917, 0.8557475, 0.7144427, 0.7058824, 0, 1, 1,
0.7806003, 1.188128, 0.4116766, 0.7098039, 0, 1, 1,
0.782491, 0.002341415, 2.1423, 0.7176471, 0, 1, 1,
0.7881224, 0.1315186, 2.807018, 0.7215686, 0, 1, 1,
0.7898775, 0.6242812, 0.01359445, 0.7294118, 0, 1, 1,
0.7930531, -0.01539323, 1.58007, 0.7333333, 0, 1, 1,
0.7939259, 0.3742348, 1.656269, 0.7411765, 0, 1, 1,
0.7947832, 0.3528493, 0.9677697, 0.7450981, 0, 1, 1,
0.7960739, 0.6520242, -0.2134672, 0.7529412, 0, 1, 1,
0.7971456, 0.9991826, 0.07475309, 0.7568628, 0, 1, 1,
0.7983773, -1.023133, 3.756869, 0.7647059, 0, 1, 1,
0.8014186, 1.385221, -0.667512, 0.7686275, 0, 1, 1,
0.8050672, 0.2324732, 2.22857, 0.7764706, 0, 1, 1,
0.811545, -0.7716591, 2.875353, 0.7803922, 0, 1, 1,
0.8150751, 1.661645, 1.662548, 0.7882353, 0, 1, 1,
0.8242974, 0.009773336, 1.528484, 0.7921569, 0, 1, 1,
0.8261739, 0.4317378, 1.945995, 0.8, 0, 1, 1,
0.8275798, -0.2686091, 0.4715335, 0.8078431, 0, 1, 1,
0.8367593, 0.09150979, 3.498872, 0.8117647, 0, 1, 1,
0.8385129, -0.9632181, 2.69531, 0.8196079, 0, 1, 1,
0.8460752, 1.262974, 1.737789, 0.8235294, 0, 1, 1,
0.8462825, -0.0824705, 2.669687, 0.8313726, 0, 1, 1,
0.847914, 1.124694, -0.5827746, 0.8352941, 0, 1, 1,
0.8487401, -1.748472, 1.175482, 0.8431373, 0, 1, 1,
0.8508052, 1.08838, 2.178317, 0.8470588, 0, 1, 1,
0.863926, -0.08891055, 0.6653826, 0.854902, 0, 1, 1,
0.8644531, -0.6837853, 1.186908, 0.8588235, 0, 1, 1,
0.8650364, 0.4181957, 1.356636, 0.8666667, 0, 1, 1,
0.8655463, -0.703468, 2.696605, 0.8705882, 0, 1, 1,
0.8723902, 0.3923571, 2.373636, 0.8784314, 0, 1, 1,
0.8728696, -0.9765208, 2.011026, 0.8823529, 0, 1, 1,
0.8734974, 0.3122005, 1.272991, 0.8901961, 0, 1, 1,
0.877799, -1.400395, 3.841967, 0.8941177, 0, 1, 1,
0.8797109, -0.9506388, 3.060929, 0.9019608, 0, 1, 1,
0.8866334, 1.618178, 0.8178663, 0.9098039, 0, 1, 1,
0.8972967, 0.8972583, 2.726068, 0.9137255, 0, 1, 1,
0.9061074, 0.5088487, 0.9717425, 0.9215686, 0, 1, 1,
0.9130995, -0.4164049, 1.624139, 0.9254902, 0, 1, 1,
0.9216787, 0.3476985, 1.102224, 0.9333333, 0, 1, 1,
0.9224956, 0.7141629, 1.191424, 0.9372549, 0, 1, 1,
0.9239727, -1.119078, 1.416504, 0.945098, 0, 1, 1,
0.9241136, 1.883295, 0.8564086, 0.9490196, 0, 1, 1,
0.9294603, 0.02402189, 1.293445, 0.9568627, 0, 1, 1,
0.9325513, -0.5240555, 1.808398, 0.9607843, 0, 1, 1,
0.9350452, -2.089641, 1.768038, 0.9686275, 0, 1, 1,
0.9376903, 0.2994424, 1.416772, 0.972549, 0, 1, 1,
0.9512303, -0.4481616, 0.8936447, 0.9803922, 0, 1, 1,
0.9566504, 0.8235605, -0.4572493, 0.9843137, 0, 1, 1,
0.9601222, -0.4034973, 0.6709518, 0.9921569, 0, 1, 1,
0.9660333, 1.758074, 1.275485, 0.9960784, 0, 1, 1,
0.9672713, 1.169588, 0.907887, 1, 0, 0.9960784, 1,
0.9677696, -0.444078, 1.310073, 1, 0, 0.9882353, 1,
0.9684721, 0.07618209, 1.481614, 1, 0, 0.9843137, 1,
0.978165, 0.4311552, 0.203886, 1, 0, 0.9764706, 1,
0.9824528, 0.6857445, 1.359253, 1, 0, 0.972549, 1,
0.9826174, 0.2916287, 0.6813948, 1, 0, 0.9647059, 1,
0.9830118, 1.496443, -0.821749, 1, 0, 0.9607843, 1,
0.9862143, -1.205641, 0.08467048, 1, 0, 0.9529412, 1,
0.994203, 0.7596763, 1.702209, 1, 0, 0.9490196, 1,
0.9990391, 1.736382, -0.2430558, 1, 0, 0.9411765, 1,
1.003152, 1.861473, 1.212703, 1, 0, 0.9372549, 1,
1.024379, -0.2037071, 2.492034, 1, 0, 0.9294118, 1,
1.027183, 0.569248, -1.01018, 1, 0, 0.9254902, 1,
1.031046, -1.487011, 2.419101, 1, 0, 0.9176471, 1,
1.033527, 0.1337172, -0.01810345, 1, 0, 0.9137255, 1,
1.04947, -1.220907, 2.698307, 1, 0, 0.9058824, 1,
1.049714, -0.8306888, 1.1894, 1, 0, 0.9019608, 1,
1.051221, -0.8808731, 2.653024, 1, 0, 0.8941177, 1,
1.058797, -0.8414075, 2.975295, 1, 0, 0.8862745, 1,
1.059051, -2.194698, 2.002387, 1, 0, 0.8823529, 1,
1.075753, 0.7896462, 1.137958, 1, 0, 0.8745098, 1,
1.077865, -0.79142, 3.05334, 1, 0, 0.8705882, 1,
1.08149, -0.872983, 1.919183, 1, 0, 0.8627451, 1,
1.082039, 0.8163019, 1.619899, 1, 0, 0.8588235, 1,
1.082325, -1.361475, 2.79472, 1, 0, 0.8509804, 1,
1.086079, -1.507179, 1.337097, 1, 0, 0.8470588, 1,
1.092081, 0.1337344, 2.08176, 1, 0, 0.8392157, 1,
1.09283, -1.336159, 2.857729, 1, 0, 0.8352941, 1,
1.105117, -0.4810586, 0.3484737, 1, 0, 0.827451, 1,
1.109155, 1.106017, -0.2881417, 1, 0, 0.8235294, 1,
1.118049, 1.042307, 0.2704895, 1, 0, 0.8156863, 1,
1.130856, -0.6408873, 1.576085, 1, 0, 0.8117647, 1,
1.143561, 0.2009242, -0.7107546, 1, 0, 0.8039216, 1,
1.146211, 0.8243979, 1.673851, 1, 0, 0.7960784, 1,
1.154051, 0.4897661, -0.2642039, 1, 0, 0.7921569, 1,
1.157634, 0.3828852, -0.4219212, 1, 0, 0.7843137, 1,
1.170538, -0.3458842, 1.558975, 1, 0, 0.7803922, 1,
1.172357, -0.5019988, 1.542584, 1, 0, 0.772549, 1,
1.187191, -0.6241212, 1.326479, 1, 0, 0.7686275, 1,
1.187249, 0.03964921, 1.326086, 1, 0, 0.7607843, 1,
1.191505, 0.7042982, 0.5303888, 1, 0, 0.7568628, 1,
1.195571, 2.242868, 0.8109969, 1, 0, 0.7490196, 1,
1.195817, 1.737649, 1.124776, 1, 0, 0.7450981, 1,
1.200115, 0.3181016, 1.728114, 1, 0, 0.7372549, 1,
1.200746, -0.03320368, 2.762892, 1, 0, 0.7333333, 1,
1.202727, 0.4757785, 0.3273573, 1, 0, 0.7254902, 1,
1.20603, 0.2543819, 2.31023, 1, 0, 0.7215686, 1,
1.206401, 0.4208073, 0.4783523, 1, 0, 0.7137255, 1,
1.211138, 1.169891, 1.056773, 1, 0, 0.7098039, 1,
1.214516, 0.2397456, 1.250829, 1, 0, 0.7019608, 1,
1.225188, 0.04206534, -0.5613557, 1, 0, 0.6941177, 1,
1.228612, -0.4940484, 1.068287, 1, 0, 0.6901961, 1,
1.23179, -1.48684, 0.9141981, 1, 0, 0.682353, 1,
1.233713, -0.5557163, 2.079584, 1, 0, 0.6784314, 1,
1.236032, -0.1949418, 0.4323678, 1, 0, 0.6705883, 1,
1.239291, 0.7757882, 0.432262, 1, 0, 0.6666667, 1,
1.249919, 1.331162, 1.567754, 1, 0, 0.6588235, 1,
1.253788, 0.2623255, -1.145402, 1, 0, 0.654902, 1,
1.258203, 0.646376, 0.1753333, 1, 0, 0.6470588, 1,
1.260176, 0.8715348, -0.2390042, 1, 0, 0.6431373, 1,
1.260686, -0.2787988, 1.375561, 1, 0, 0.6352941, 1,
1.267442, 0.578141, 1.032849, 1, 0, 0.6313726, 1,
1.270914, 1.720977, 1.067363, 1, 0, 0.6235294, 1,
1.277314, -0.7301685, 2.994511, 1, 0, 0.6196079, 1,
1.285472, -0.9097396, 2.750443, 1, 0, 0.6117647, 1,
1.292346, -0.1604921, 1.57382, 1, 0, 0.6078432, 1,
1.294128, 0.4483726, 0.941007, 1, 0, 0.6, 1,
1.301233, -1.671344, 1.368766, 1, 0, 0.5921569, 1,
1.306304, 0.1416673, 0.3876384, 1, 0, 0.5882353, 1,
1.311239, 0.8352193, 0.3691694, 1, 0, 0.5803922, 1,
1.324014, 0.9765384, -0.05363802, 1, 0, 0.5764706, 1,
1.324683, -0.8231609, 2.544903, 1, 0, 0.5686275, 1,
1.324799, 0.2982226, 1.758024, 1, 0, 0.5647059, 1,
1.327605, -1.244699, 3.176175, 1, 0, 0.5568628, 1,
1.332923, -0.9098784, 2.591528, 1, 0, 0.5529412, 1,
1.333678, 0.5413103, 2.254594, 1, 0, 0.5450981, 1,
1.335459, -0.0002335686, 2.714603, 1, 0, 0.5411765, 1,
1.336644, -0.2640995, 1.715564, 1, 0, 0.5333334, 1,
1.337041, 0.1335841, 1.046686, 1, 0, 0.5294118, 1,
1.338081, 0.456572, -0.706077, 1, 0, 0.5215687, 1,
1.340575, 0.3254558, -0.1311601, 1, 0, 0.5176471, 1,
1.341887, -0.1167498, 1.325777, 1, 0, 0.509804, 1,
1.346916, -0.2606117, 0.8920633, 1, 0, 0.5058824, 1,
1.350222, -0.8791555, 1.188821, 1, 0, 0.4980392, 1,
1.352278, 0.5182323, -0.5062676, 1, 0, 0.4901961, 1,
1.353532, -0.1503599, 0.6761546, 1, 0, 0.4862745, 1,
1.355937, 0.837962, 1.828643, 1, 0, 0.4784314, 1,
1.363395, -0.256561, 1.806687, 1, 0, 0.4745098, 1,
1.364312, 0.8788557, 1.45592, 1, 0, 0.4666667, 1,
1.369102, 1.289818, 2.000368, 1, 0, 0.4627451, 1,
1.376218, 0.7290762, -0.2599603, 1, 0, 0.454902, 1,
1.382145, -0.3663709, 0.8968592, 1, 0, 0.4509804, 1,
1.386858, -1.229151, 2.780531, 1, 0, 0.4431373, 1,
1.388548, -1.860288, 3.839144, 1, 0, 0.4392157, 1,
1.399396, -0.6393673, 1.07869, 1, 0, 0.4313726, 1,
1.404304, -0.3376371, 3.18339, 1, 0, 0.427451, 1,
1.420351, 0.3024572, 2.043212, 1, 0, 0.4196078, 1,
1.426652, 1.728555, 1.921058, 1, 0, 0.4156863, 1,
1.428726, 1.104943, 2.848592, 1, 0, 0.4078431, 1,
1.431512, 0.9998631, 1.921979, 1, 0, 0.4039216, 1,
1.437128, -0.293387, 3.45256, 1, 0, 0.3960784, 1,
1.455898, 1.212719, 0.4011048, 1, 0, 0.3882353, 1,
1.471742, -2.273839, 0.7186615, 1, 0, 0.3843137, 1,
1.477755, -1.664782, 1.437372, 1, 0, 0.3764706, 1,
1.478031, 0.5410754, 1.672205, 1, 0, 0.372549, 1,
1.485889, 1.674888, 0.8508683, 1, 0, 0.3647059, 1,
1.509337, 0.718564, 1.31737, 1, 0, 0.3607843, 1,
1.518384, -0.8762063, 2.738899, 1, 0, 0.3529412, 1,
1.525367, -0.4404069, 1.332104, 1, 0, 0.3490196, 1,
1.527513, -1.462265, 1.492915, 1, 0, 0.3411765, 1,
1.528737, 0.2466443, 1.984187, 1, 0, 0.3372549, 1,
1.53311, 0.3450945, 2.648954, 1, 0, 0.3294118, 1,
1.560078, 0.1297822, 1.979355, 1, 0, 0.3254902, 1,
1.56818, -1.064894, 4.251395, 1, 0, 0.3176471, 1,
1.574451, -0.2850702, 2.744188, 1, 0, 0.3137255, 1,
1.601848, -0.4124023, 0.5342644, 1, 0, 0.3058824, 1,
1.602437, -1.213918, 1.418573, 1, 0, 0.2980392, 1,
1.604747, 1.221395, -0.7163928, 1, 0, 0.2941177, 1,
1.605529, 1.371962, -0.1421048, 1, 0, 0.2862745, 1,
1.623792, -0.7318394, 2.182428, 1, 0, 0.282353, 1,
1.635008, 0.2667896, 3.654132, 1, 0, 0.2745098, 1,
1.638782, 1.544535, 2.426177, 1, 0, 0.2705882, 1,
1.680223, 0.24585, 1.653328, 1, 0, 0.2627451, 1,
1.683284, 0.1923118, -1.175602, 1, 0, 0.2588235, 1,
1.687071, 0.6844813, 0.3973416, 1, 0, 0.2509804, 1,
1.696407, -0.3536195, 1.778908, 1, 0, 0.2470588, 1,
1.719439, -1.600846, 3.472437, 1, 0, 0.2392157, 1,
1.721138, -0.3946855, 1.385173, 1, 0, 0.2352941, 1,
1.72351, 0.7856166, 0.771352, 1, 0, 0.227451, 1,
1.725145, 0.4789208, 1.246838, 1, 0, 0.2235294, 1,
1.737199, -0.07339116, 0.359314, 1, 0, 0.2156863, 1,
1.746971, -0.0257183, 0.1362787, 1, 0, 0.2117647, 1,
1.749046, -0.3388764, 2.26767, 1, 0, 0.2039216, 1,
1.768926, 0.8308498, 1.795984, 1, 0, 0.1960784, 1,
1.770909, 2.517916, 0.4514211, 1, 0, 0.1921569, 1,
1.779611, -2.457432, 2.726748, 1, 0, 0.1843137, 1,
1.786346, -0.3577411, 2.803074, 1, 0, 0.1803922, 1,
1.788524, -1.86951, 1.33637, 1, 0, 0.172549, 1,
1.794024, 0.9823011, 0.1433832, 1, 0, 0.1686275, 1,
1.811716, -0.346517, 1.152459, 1, 0, 0.1607843, 1,
1.818597, -0.06946062, 1.403868, 1, 0, 0.1568628, 1,
1.818682, 0.0202939, 0.9292738, 1, 0, 0.1490196, 1,
1.822371, -1.480206, 4.954392, 1, 0, 0.145098, 1,
1.822628, -0.06261908, 0.5727599, 1, 0, 0.1372549, 1,
1.847343, -0.4235439, 0.2444122, 1, 0, 0.1333333, 1,
1.854178, -1.86052, 3.559889, 1, 0, 0.1254902, 1,
1.884467, 2.126156, 0.1879794, 1, 0, 0.1215686, 1,
1.941933, 2.153301, 1.165941, 1, 0, 0.1137255, 1,
1.973933, -0.07705959, 2.496549, 1, 0, 0.1098039, 1,
1.973985, -0.6101652, 1.095103, 1, 0, 0.1019608, 1,
1.982627, 0.00272944, 3.026906, 1, 0, 0.09411765, 1,
1.983331, 0.03653958, 2.929987, 1, 0, 0.09019608, 1,
2.034449, -1.101799, 1.005363, 1, 0, 0.08235294, 1,
2.037644, 0.8831744, 2.099366, 1, 0, 0.07843138, 1,
2.054529, 1.423547, 0.8639157, 1, 0, 0.07058824, 1,
2.068475, -0.09703197, 1.275502, 1, 0, 0.06666667, 1,
2.150431, -0.4415538, 2.085655, 1, 0, 0.05882353, 1,
2.182797, 0.02361405, 0.7653474, 1, 0, 0.05490196, 1,
2.259649, -0.6703956, 0.8347894, 1, 0, 0.04705882, 1,
2.407364, -1.534017, 1.675321, 1, 0, 0.04313726, 1,
2.429403, 0.4015118, 3.26478, 1, 0, 0.03529412, 1,
2.512188, 2.627716, 1.989903, 1, 0, 0.03137255, 1,
2.569382, 1.872337, 2.454283, 1, 0, 0.02352941, 1,
2.851177, -1.664922, 3.445485, 1, 0, 0.01960784, 1,
3.25267, 0.2501548, -0.5881058, 1, 0, 0.01176471, 1,
3.376482, -0.2387056, -0.01256366, 1, 0, 0.007843138, 1
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
0.05385566, -5.725826, -7.56979, 0, -0.5, 0.5, 0.5,
0.05385566, -5.725826, -7.56979, 1, -0.5, 0.5, 0.5,
0.05385566, -5.725826, -7.56979, 1, 1.5, 0.5, 0.5,
0.05385566, -5.725826, -7.56979, 0, 1.5, 0.5, 0.5
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
-4.395141, -0.4935306, -7.56979, 0, -0.5, 0.5, 0.5,
-4.395141, -0.4935306, -7.56979, 1, -0.5, 0.5, 0.5,
-4.395141, -0.4935306, -7.56979, 1, 1.5, 0.5, 0.5,
-4.395141, -0.4935306, -7.56979, 0, 1.5, 0.5, 0.5
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
-4.395141, -5.725826, -0.2073927, 0, -0.5, 0.5, 0.5,
-4.395141, -5.725826, -0.2073927, 1, -0.5, 0.5, 0.5,
-4.395141, -5.725826, -0.2073927, 1, 1.5, 0.5, 0.5,
-4.395141, -5.725826, -0.2073927, 0, 1.5, 0.5, 0.5
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
-3, -4.518373, -5.870775,
3, -4.518373, -5.870775,
-3, -4.518373, -5.870775,
-3, -4.719615, -6.153944,
-2, -4.518373, -5.870775,
-2, -4.719615, -6.153944,
-1, -4.518373, -5.870775,
-1, -4.719615, -6.153944,
0, -4.518373, -5.870775,
0, -4.719615, -6.153944,
1, -4.518373, -5.870775,
1, -4.719615, -6.153944,
2, -4.518373, -5.870775,
2, -4.719615, -6.153944,
3, -4.518373, -5.870775,
3, -4.719615, -6.153944
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
-3, -5.122099, -6.720283, 0, -0.5, 0.5, 0.5,
-3, -5.122099, -6.720283, 1, -0.5, 0.5, 0.5,
-3, -5.122099, -6.720283, 1, 1.5, 0.5, 0.5,
-3, -5.122099, -6.720283, 0, 1.5, 0.5, 0.5,
-2, -5.122099, -6.720283, 0, -0.5, 0.5, 0.5,
-2, -5.122099, -6.720283, 1, -0.5, 0.5, 0.5,
-2, -5.122099, -6.720283, 1, 1.5, 0.5, 0.5,
-2, -5.122099, -6.720283, 0, 1.5, 0.5, 0.5,
-1, -5.122099, -6.720283, 0, -0.5, 0.5, 0.5,
-1, -5.122099, -6.720283, 1, -0.5, 0.5, 0.5,
-1, -5.122099, -6.720283, 1, 1.5, 0.5, 0.5,
-1, -5.122099, -6.720283, 0, 1.5, 0.5, 0.5,
0, -5.122099, -6.720283, 0, -0.5, 0.5, 0.5,
0, -5.122099, -6.720283, 1, -0.5, 0.5, 0.5,
0, -5.122099, -6.720283, 1, 1.5, 0.5, 0.5,
0, -5.122099, -6.720283, 0, 1.5, 0.5, 0.5,
1, -5.122099, -6.720283, 0, -0.5, 0.5, 0.5,
1, -5.122099, -6.720283, 1, -0.5, 0.5, 0.5,
1, -5.122099, -6.720283, 1, 1.5, 0.5, 0.5,
1, -5.122099, -6.720283, 0, 1.5, 0.5, 0.5,
2, -5.122099, -6.720283, 0, -0.5, 0.5, 0.5,
2, -5.122099, -6.720283, 1, -0.5, 0.5, 0.5,
2, -5.122099, -6.720283, 1, 1.5, 0.5, 0.5,
2, -5.122099, -6.720283, 0, 1.5, 0.5, 0.5,
3, -5.122099, -6.720283, 0, -0.5, 0.5, 0.5,
3, -5.122099, -6.720283, 1, -0.5, 0.5, 0.5,
3, -5.122099, -6.720283, 1, 1.5, 0.5, 0.5,
3, -5.122099, -6.720283, 0, 1.5, 0.5, 0.5
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
-3.36845, -4, -5.870775,
-3.36845, 2, -5.870775,
-3.36845, -4, -5.870775,
-3.539565, -4, -6.153944,
-3.36845, -2, -5.870775,
-3.539565, -2, -6.153944,
-3.36845, 0, -5.870775,
-3.539565, 0, -6.153944,
-3.36845, 2, -5.870775,
-3.539565, 2, -6.153944
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
"-4",
"-2",
"0",
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
-3.881796, -4, -6.720283, 0, -0.5, 0.5, 0.5,
-3.881796, -4, -6.720283, 1, -0.5, 0.5, 0.5,
-3.881796, -4, -6.720283, 1, 1.5, 0.5, 0.5,
-3.881796, -4, -6.720283, 0, 1.5, 0.5, 0.5,
-3.881796, -2, -6.720283, 0, -0.5, 0.5, 0.5,
-3.881796, -2, -6.720283, 1, -0.5, 0.5, 0.5,
-3.881796, -2, -6.720283, 1, 1.5, 0.5, 0.5,
-3.881796, -2, -6.720283, 0, 1.5, 0.5, 0.5,
-3.881796, 0, -6.720283, 0, -0.5, 0.5, 0.5,
-3.881796, 0, -6.720283, 1, -0.5, 0.5, 0.5,
-3.881796, 0, -6.720283, 1, 1.5, 0.5, 0.5,
-3.881796, 0, -6.720283, 0, 1.5, 0.5, 0.5,
-3.881796, 2, -6.720283, 0, -0.5, 0.5, 0.5,
-3.881796, 2, -6.720283, 1, -0.5, 0.5, 0.5,
-3.881796, 2, -6.720283, 1, 1.5, 0.5, 0.5,
-3.881796, 2, -6.720283, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.36845, -4.518373, -4,
-3.36845, -4.518373, 4,
-3.36845, -4.518373, -4,
-3.539565, -4.719615, -4,
-3.36845, -4.518373, -2,
-3.539565, -4.719615, -2,
-3.36845, -4.518373, 0,
-3.539565, -4.719615, 0,
-3.36845, -4.518373, 2,
-3.539565, -4.719615, 2,
-3.36845, -4.518373, 4,
-3.539565, -4.719615, 4
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
-3.881796, -5.122099, -4, 0, -0.5, 0.5, 0.5,
-3.881796, -5.122099, -4, 1, -0.5, 0.5, 0.5,
-3.881796, -5.122099, -4, 1, 1.5, 0.5, 0.5,
-3.881796, -5.122099, -4, 0, 1.5, 0.5, 0.5,
-3.881796, -5.122099, -2, 0, -0.5, 0.5, 0.5,
-3.881796, -5.122099, -2, 1, -0.5, 0.5, 0.5,
-3.881796, -5.122099, -2, 1, 1.5, 0.5, 0.5,
-3.881796, -5.122099, -2, 0, 1.5, 0.5, 0.5,
-3.881796, -5.122099, 0, 0, -0.5, 0.5, 0.5,
-3.881796, -5.122099, 0, 1, -0.5, 0.5, 0.5,
-3.881796, -5.122099, 0, 1, 1.5, 0.5, 0.5,
-3.881796, -5.122099, 0, 0, 1.5, 0.5, 0.5,
-3.881796, -5.122099, 2, 0, -0.5, 0.5, 0.5,
-3.881796, -5.122099, 2, 1, -0.5, 0.5, 0.5,
-3.881796, -5.122099, 2, 1, 1.5, 0.5, 0.5,
-3.881796, -5.122099, 2, 0, 1.5, 0.5, 0.5,
-3.881796, -5.122099, 4, 0, -0.5, 0.5, 0.5,
-3.881796, -5.122099, 4, 1, -0.5, 0.5, 0.5,
-3.881796, -5.122099, 4, 1, 1.5, 0.5, 0.5,
-3.881796, -5.122099, 4, 0, 1.5, 0.5, 0.5
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
-3.36845, -4.518373, -5.870775,
-3.36845, 3.531312, -5.870775,
-3.36845, -4.518373, 5.45599,
-3.36845, 3.531312, 5.45599,
-3.36845, -4.518373, -5.870775,
-3.36845, -4.518373, 5.45599,
-3.36845, 3.531312, -5.870775,
-3.36845, 3.531312, 5.45599,
-3.36845, -4.518373, -5.870775,
3.476161, -4.518373, -5.870775,
-3.36845, -4.518373, 5.45599,
3.476161, -4.518373, 5.45599,
-3.36845, 3.531312, -5.870775,
3.476161, 3.531312, -5.870775,
-3.36845, 3.531312, 5.45599,
3.476161, 3.531312, 5.45599,
3.476161, -4.518373, -5.870775,
3.476161, 3.531312, -5.870775,
3.476161, -4.518373, 5.45599,
3.476161, 3.531312, 5.45599,
3.476161, -4.518373, -5.870775,
3.476161, -4.518373, 5.45599,
3.476161, 3.531312, -5.870775,
3.476161, 3.531312, 5.45599
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
var radius = 8.271387;
var distance = 36.80033;
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
mvMatrix.translate( -0.05385566, 0.4935306, 0.2073927 );
mvMatrix.scale( 1.306603, 1.110998, 0.7895622 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.80033);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
acetic_acid_ethyl_es<-read.table("acetic_acid_ethyl_es.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 6 elements
```

```r
x<-acetic_acid_ethyl_es$V2
```

```
## Error in eval(expr, envir, enclos): object 'acetic_acid_ethyl_es' not found
```

```r
y<-acetic_acid_ethyl_es$V3
```

```
## Error in eval(expr, envir, enclos): object 'acetic_acid_ethyl_es' not found
```

```r
z<-acetic_acid_ethyl_es$V4
```

```
## Error in eval(expr, envir, enclos): object 'acetic_acid_ethyl_es' not found
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
-3.268771, -2.152407, -4.147461, 0, 0, 1, 1, 1,
-3.1426, 0.6748644, -2.088397, 1, 0, 0, 1, 1,
-3.054349, -1.6569, -0.8633971, 1, 0, 0, 1, 1,
-2.805427, 1.95915, -1.482714, 1, 0, 0, 1, 1,
-2.598594, 0.2067039, -1.91379, 1, 0, 0, 1, 1,
-2.49756, -0.4679894, -1.498231, 1, 0, 0, 1, 1,
-2.467449, -1.266558, -2.471377, 0, 0, 0, 1, 1,
-2.440012, 1.453668, -1.802475, 0, 0, 0, 1, 1,
-2.413669, 0.3850941, -1.339278, 0, 0, 0, 1, 1,
-2.360295, -0.6275337, -2.192078, 0, 0, 0, 1, 1,
-2.311617, 0.05091168, -1.818992, 0, 0, 0, 1, 1,
-2.294317, -0.1890033, -3.387125, 0, 0, 0, 1, 1,
-2.288901, 1.11379, 0.100924, 0, 0, 0, 1, 1,
-2.262193, 0.2577516, -0.3411121, 1, 1, 1, 1, 1,
-2.248463, 1.211685, -1.03936, 1, 1, 1, 1, 1,
-2.237451, 0.3769335, -0.6547253, 1, 1, 1, 1, 1,
-2.179023, 0.1528748, -1.994781, 1, 1, 1, 1, 1,
-2.137116, 0.7332268, -0.2984844, 1, 1, 1, 1, 1,
-2.091018, 0.1545618, -1.746692, 1, 1, 1, 1, 1,
-2.088758, 0.5465819, 0.5166896, 1, 1, 1, 1, 1,
-2.073806, 0.9975154, -2.130105, 1, 1, 1, 1, 1,
-2.057542, 0.05656322, -0.8486612, 1, 1, 1, 1, 1,
-2.014215, -0.3190462, -0.9448453, 1, 1, 1, 1, 1,
-2.000301, -2.338819, -2.942069, 1, 1, 1, 1, 1,
-1.983007, 1.25119, -0.5841919, 1, 1, 1, 1, 1,
-1.982832, -0.1334492, -3.004585, 1, 1, 1, 1, 1,
-1.982092, -0.3319925, -2.146166, 1, 1, 1, 1, 1,
-1.979175, -0.4839662, -0.03250704, 1, 1, 1, 1, 1,
-1.959499, -0.06051945, -2.044608, 0, 0, 1, 1, 1,
-1.954582, -0.003005598, -1.398082, 1, 0, 0, 1, 1,
-1.933395, 1.571516, -0.1493317, 1, 0, 0, 1, 1,
-1.913271, -1.44148, -1.847732, 1, 0, 0, 1, 1,
-1.903156, 0.9459177, -2.125905, 1, 0, 0, 1, 1,
-1.895829, -1.843835, -3.163024, 1, 0, 0, 1, 1,
-1.881889, 0.2797866, -1.102776, 0, 0, 0, 1, 1,
-1.873349, -0.586904, -1.699405, 0, 0, 0, 1, 1,
-1.853941, 0.1451113, -0.487476, 0, 0, 0, 1, 1,
-1.82083, -1.045848, -3.024873, 0, 0, 0, 1, 1,
-1.803059, -0.5542331, -1.76031, 0, 0, 0, 1, 1,
-1.793558, 0.8374816, -0.6258829, 0, 0, 0, 1, 1,
-1.791017, 2.078358, -0.7197539, 0, 0, 0, 1, 1,
-1.780083, -0.4267188, -0.6975082, 1, 1, 1, 1, 1,
-1.772395, -0.3831971, -0.7501265, 1, 1, 1, 1, 1,
-1.738436, 1.086915, -1.797367, 1, 1, 1, 1, 1,
-1.731052, -0.7731537, -2.916909, 1, 1, 1, 1, 1,
-1.730297, 0.5408744, -0.707348, 1, 1, 1, 1, 1,
-1.724598, -1.028266, -1.96734, 1, 1, 1, 1, 1,
-1.723243, 0.2511637, -2.987643, 1, 1, 1, 1, 1,
-1.714599, 1.503973, -1.637819, 1, 1, 1, 1, 1,
-1.685165, -0.2000967, -3.187917, 1, 1, 1, 1, 1,
-1.683666, 1.012899, -1.775897, 1, 1, 1, 1, 1,
-1.655065, 0.3459571, -2.213865, 1, 1, 1, 1, 1,
-1.620692, 1.471982, -2.2693, 1, 1, 1, 1, 1,
-1.615973, 0.380844, -1.153552, 1, 1, 1, 1, 1,
-1.60202, 0.4914768, -2.461658, 1, 1, 1, 1, 1,
-1.595875, -1.21343, -1.084746, 1, 1, 1, 1, 1,
-1.590095, 0.07604469, -0.5954944, 0, 0, 1, 1, 1,
-1.5883, -0.9209614, -0.2484007, 1, 0, 0, 1, 1,
-1.587622, -0.3567778, -1.417071, 1, 0, 0, 1, 1,
-1.561923, 1.822755, -1.568999, 1, 0, 0, 1, 1,
-1.552824, -1.413076, -2.978719, 1, 0, 0, 1, 1,
-1.549827, -1.018178, -2.983464, 1, 0, 0, 1, 1,
-1.549523, 1.147724, -0.1913625, 0, 0, 0, 1, 1,
-1.542842, 0.5081727, -1.137973, 0, 0, 0, 1, 1,
-1.538272, -1.304963, -2.564688, 0, 0, 0, 1, 1,
-1.534276, 1.381268, -1.028913, 0, 0, 0, 1, 1,
-1.522806, -1.187502, -3.073974, 0, 0, 0, 1, 1,
-1.51412, 0.109927, -2.347504, 0, 0, 0, 1, 1,
-1.509924, -1.411511, -1.458552, 0, 0, 0, 1, 1,
-1.504375, -0.556468, -0.793863, 1, 1, 1, 1, 1,
-1.497728, 0.7748683, -0.6404087, 1, 1, 1, 1, 1,
-1.489978, -0.6952483, -3.476873, 1, 1, 1, 1, 1,
-1.488818, -1.622742, -1.369183, 1, 1, 1, 1, 1,
-1.488247, 0.1470084, 0.3165092, 1, 1, 1, 1, 1,
-1.471117, -0.7942327, -3.140042, 1, 1, 1, 1, 1,
-1.456369, 1.191819, -1.319968, 1, 1, 1, 1, 1,
-1.455268, 0.1169573, -2.674242, 1, 1, 1, 1, 1,
-1.450428, 1.44379, -1.038484, 1, 1, 1, 1, 1,
-1.449662, -1.478077, -3.712072, 1, 1, 1, 1, 1,
-1.448172, -0.6167883, -1.785694, 1, 1, 1, 1, 1,
-1.440179, -0.4752914, -2.871689, 1, 1, 1, 1, 1,
-1.437241, -0.3564048, 0.9677369, 1, 1, 1, 1, 1,
-1.42861, -0.2159031, -1.140821, 1, 1, 1, 1, 1,
-1.418146, 0.6381032, -2.70285, 1, 1, 1, 1, 1,
-1.412642, -0.9704589, -1.104027, 0, 0, 1, 1, 1,
-1.410568, 0.3090443, 1.12948, 1, 0, 0, 1, 1,
-1.410234, -1.084964, -2.509291, 1, 0, 0, 1, 1,
-1.383135, -0.5557638, -2.050038, 1, 0, 0, 1, 1,
-1.379602, 0.6059589, -0.7102039, 1, 0, 0, 1, 1,
-1.377108, 1.346822, -1.728733, 1, 0, 0, 1, 1,
-1.356678, -2.376273, -0.9738418, 0, 0, 0, 1, 1,
-1.344722, 0.3219675, -2.894713, 0, 0, 0, 1, 1,
-1.342208, 1.162786, -0.7442451, 0, 0, 0, 1, 1,
-1.341326, 0.9812711, -2.078298, 0, 0, 0, 1, 1,
-1.338288, 2.33024, -0.7977393, 0, 0, 0, 1, 1,
-1.33649, 0.7615547, -0.6725183, 0, 0, 0, 1, 1,
-1.324667, -1.405714, -1.461208, 0, 0, 0, 1, 1,
-1.314613, 0.9660957, -0.4719843, 1, 1, 1, 1, 1,
-1.31149, 0.4344273, -3.221807, 1, 1, 1, 1, 1,
-1.311399, -0.1529833, -0.8051293, 1, 1, 1, 1, 1,
-1.302047, 1.577999, -0.2518419, 1, 1, 1, 1, 1,
-1.290162, 0.2541233, 0.4838866, 1, 1, 1, 1, 1,
-1.268348, 0.0999293, 0.3869392, 1, 1, 1, 1, 1,
-1.267157, 0.346421, -1.494961, 1, 1, 1, 1, 1,
-1.236081, -0.5826562, -4.507164, 1, 1, 1, 1, 1,
-1.229812, -0.4154273, -3.557586, 1, 1, 1, 1, 1,
-1.224366, -1.639295, -1.965554, 1, 1, 1, 1, 1,
-1.219694, -0.5066201, -2.648805, 1, 1, 1, 1, 1,
-1.209145, 0.6775391, -1.791906, 1, 1, 1, 1, 1,
-1.203652, 1.992335, -1.140463, 1, 1, 1, 1, 1,
-1.200026, -0.3625686, -1.713326, 1, 1, 1, 1, 1,
-1.198513, 0.1957179, -2.945996, 1, 1, 1, 1, 1,
-1.191888, 0.1120069, -0.5969536, 0, 0, 1, 1, 1,
-1.17637, -1.748727, -1.864857, 1, 0, 0, 1, 1,
-1.168815, 1.882883, 0.5943874, 1, 0, 0, 1, 1,
-1.164628, -0.6977165, -3.321681, 1, 0, 0, 1, 1,
-1.156141, -1.100016, -2.977248, 1, 0, 0, 1, 1,
-1.15117, -1.828826, -2.545498, 1, 0, 0, 1, 1,
-1.151043, -2.2091, -3.104098, 0, 0, 0, 1, 1,
-1.147063, 1.004003, -0.4393086, 0, 0, 0, 1, 1,
-1.145647, -1.677481, -4.372403, 0, 0, 0, 1, 1,
-1.142985, 0.6151049, 0.072198, 0, 0, 0, 1, 1,
-1.135324, 0.8506544, -2.402246, 0, 0, 0, 1, 1,
-1.133414, 1.183113, -2.262229, 0, 0, 0, 1, 1,
-1.127244, -1.141618, -2.843779, 0, 0, 0, 1, 1,
-1.12029, -0.2349795, -0.7425048, 1, 1, 1, 1, 1,
-1.119737, -1.497504, -3.176917, 1, 1, 1, 1, 1,
-1.118936, -0.2836443, -2.705151, 1, 1, 1, 1, 1,
-1.10594, 0.6247524, 0.5116345, 1, 1, 1, 1, 1,
-1.088001, 1.140815, -2.351206, 1, 1, 1, 1, 1,
-1.0868, 3.182306, -0.2735459, 1, 1, 1, 1, 1,
-1.076984, -0.2114591, -0.7378516, 1, 1, 1, 1, 1,
-1.076544, -0.5723053, -2.137735, 1, 1, 1, 1, 1,
-1.076375, 0.9188746, -2.470823, 1, 1, 1, 1, 1,
-1.075639, -0.3878224, -0.431528, 1, 1, 1, 1, 1,
-1.065476, 1.278385, 0.1231059, 1, 1, 1, 1, 1,
-1.064348, 0.6479133, -0.8083419, 1, 1, 1, 1, 1,
-1.064252, 0.763813, -2.778726, 1, 1, 1, 1, 1,
-1.050566, -0.03885033, -0.8906881, 1, 1, 1, 1, 1,
-1.048323, -0.164989, -1.514855, 1, 1, 1, 1, 1,
-1.045026, -0.08559088, -1.483059, 0, 0, 1, 1, 1,
-1.04281, 1.539613, 1.143304, 1, 0, 0, 1, 1,
-1.038491, -0.5057393, -2.215619, 1, 0, 0, 1, 1,
-1.037398, -1.112364, -2.377083, 1, 0, 0, 1, 1,
-1.037374, -2.471046, -0.6711178, 1, 0, 0, 1, 1,
-1.036061, -1.530569, -1.491525, 1, 0, 0, 1, 1,
-1.020678, -0.248024, -2.35309, 0, 0, 0, 1, 1,
-1.018079, 0.3560186, -1.802107, 0, 0, 0, 1, 1,
-1.016157, -0.8854101, -2.965598, 0, 0, 0, 1, 1,
-1.013354, -1.322357, -2.698423, 0, 0, 0, 1, 1,
-1.005405, 0.2345608, 0.8128923, 0, 0, 0, 1, 1,
-0.9981273, -0.9161666, -3.153421, 0, 0, 0, 1, 1,
-0.9977248, -1.682346, -2.65911, 0, 0, 0, 1, 1,
-0.9918218, -0.2510871, -2.456146, 1, 1, 1, 1, 1,
-0.9896993, -0.6239795, -3.257905, 1, 1, 1, 1, 1,
-0.9764106, -2.723024, -1.331648, 1, 1, 1, 1, 1,
-0.9750377, -1.426946, -3.552171, 1, 1, 1, 1, 1,
-0.9746657, 0.8430253, -1.608823, 1, 1, 1, 1, 1,
-0.9741752, -0.8406476, -0.9756935, 1, 1, 1, 1, 1,
-0.9726408, -0.6202202, -1.64617, 1, 1, 1, 1, 1,
-0.9719224, 0.6494893, -1.850433, 1, 1, 1, 1, 1,
-0.9426571, -1.028354, -0.5345952, 1, 1, 1, 1, 1,
-0.9386821, -0.647144, -2.823027, 1, 1, 1, 1, 1,
-0.9375064, 0.8731109, -1.669415, 1, 1, 1, 1, 1,
-0.9364949, 0.3839752, -0.457808, 1, 1, 1, 1, 1,
-0.9278086, 0.9065309, -0.3614955, 1, 1, 1, 1, 1,
-0.9167924, 0.9759843, -0.9979445, 1, 1, 1, 1, 1,
-0.9038147, 1.134112, 0.01037963, 1, 1, 1, 1, 1,
-0.9001333, -0.3376807, -1.384083, 0, 0, 1, 1, 1,
-0.8951744, 0.2434619, -2.098778, 1, 0, 0, 1, 1,
-0.8933025, 0.1153956, -0.4584403, 1, 0, 0, 1, 1,
-0.8917117, -0.5098675, -1.929107, 1, 0, 0, 1, 1,
-0.8913489, 0.5645536, -0.3168797, 1, 0, 0, 1, 1,
-0.8909548, 0.3371543, -1.522571, 1, 0, 0, 1, 1,
-0.8877723, -1.032572, -3.004033, 0, 0, 0, 1, 1,
-0.8869835, 0.3905183, 0.01704287, 0, 0, 0, 1, 1,
-0.886739, 0.4908364, 0.3288463, 0, 0, 0, 1, 1,
-0.8865837, 0.1255491, -1.986461, 0, 0, 0, 1, 1,
-0.882593, -0.3377143, -1.181125, 0, 0, 0, 1, 1,
-0.8802856, -0.658845, -3.29292, 0, 0, 0, 1, 1,
-0.8784269, -1.16453, -3.761192, 0, 0, 0, 1, 1,
-0.8754792, -0.4298364, -1.960231, 1, 1, 1, 1, 1,
-0.8720587, 1.073343, 0.4622477, 1, 1, 1, 1, 1,
-0.867401, 1.733196, 0.184062, 1, 1, 1, 1, 1,
-0.8607355, 0.1356104, -2.61889, 1, 1, 1, 1, 1,
-0.8573768, 0.1854635, -1.463814, 1, 1, 1, 1, 1,
-0.8520924, 0.2971401, -2.999265, 1, 1, 1, 1, 1,
-0.8519231, -0.7454413, -1.699294, 1, 1, 1, 1, 1,
-0.8492056, -1.667314, -3.122747, 1, 1, 1, 1, 1,
-0.8484758, -1.23312, -1.702809, 1, 1, 1, 1, 1,
-0.8453509, 0.07969958, -2.659601, 1, 1, 1, 1, 1,
-0.8443896, 1.97173, -1.008148, 1, 1, 1, 1, 1,
-0.843854, -0.5122911, -1.785917, 1, 1, 1, 1, 1,
-0.8316651, -0.1593573, -2.962828, 1, 1, 1, 1, 1,
-0.8306225, -1.022948, -0.7363706, 1, 1, 1, 1, 1,
-0.8167474, 1.029668, -2.642573, 1, 1, 1, 1, 1,
-0.8164632, 0.5290888, -0.1605389, 0, 0, 1, 1, 1,
-0.8162579, 0.2334612, -2.011712, 1, 0, 0, 1, 1,
-0.8148339, -0.8208413, -1.137929, 1, 0, 0, 1, 1,
-0.8099365, 0.1587771, -3.662043, 1, 0, 0, 1, 1,
-0.8040099, -1.329925, -2.326762, 1, 0, 0, 1, 1,
-0.80268, 1.209773, 0.7315342, 1, 0, 0, 1, 1,
-0.8020891, -0.4130764, -1.878742, 0, 0, 0, 1, 1,
-0.7988401, -0.2139981, -0.6253328, 0, 0, 0, 1, 1,
-0.7984954, 0.7017695, 0.07577713, 0, 0, 0, 1, 1,
-0.7982754, 0.4039966, -0.3388719, 0, 0, 0, 1, 1,
-0.7976102, 0.04859642, -1.078596, 0, 0, 0, 1, 1,
-0.7930845, 0.7477007, -0.7354674, 0, 0, 0, 1, 1,
-0.7921295, -0.4728257, -2.823945, 0, 0, 0, 1, 1,
-0.7857006, -1.168982, -1.176267, 1, 1, 1, 1, 1,
-0.7815436, -0.738616, -2.920411, 1, 1, 1, 1, 1,
-0.7783217, -0.4252115, -1.159149, 1, 1, 1, 1, 1,
-0.776019, 0.2016765, -1.131168, 1, 1, 1, 1, 1,
-0.7750787, 0.07296407, -1.530238, 1, 1, 1, 1, 1,
-0.7740679, -0.4252808, -0.8723898, 1, 1, 1, 1, 1,
-0.7701266, 1.246822, -1.779409, 1, 1, 1, 1, 1,
-0.769399, 0.08483229, -0.7277678, 1, 1, 1, 1, 1,
-0.7617478, -0.06103673, -1.413445, 1, 1, 1, 1, 1,
-0.7587544, -0.7046635, -2.332579, 1, 1, 1, 1, 1,
-0.7575732, 1.043637, 1.845971, 1, 1, 1, 1, 1,
-0.7552828, 0.442394, 2.253103, 1, 1, 1, 1, 1,
-0.7494199, -0.6761581, -1.722893, 1, 1, 1, 1, 1,
-0.7427425, -0.2050559, -1.817683, 1, 1, 1, 1, 1,
-0.7412955, 1.103459, -1.053498, 1, 1, 1, 1, 1,
-0.7364491, -1.414096, -3.24105, 0, 0, 1, 1, 1,
-0.7349148, 2.120533, -0.3753102, 1, 0, 0, 1, 1,
-0.7328205, -1.834656, -2.486566, 1, 0, 0, 1, 1,
-0.7327372, 1.112084, 0.05625824, 1, 0, 0, 1, 1,
-0.7237895, -2.605322, -3.199653, 1, 0, 0, 1, 1,
-0.7131482, -0.2972554, -2.199613, 1, 0, 0, 1, 1,
-0.71246, -0.4307294, -0.3459027, 0, 0, 0, 1, 1,
-0.7121267, 2.379265, -0.4362306, 0, 0, 0, 1, 1,
-0.7102945, -0.6792352, -1.937121, 0, 0, 0, 1, 1,
-0.7009128, 1.583106, -0.3710149, 0, 0, 0, 1, 1,
-0.6920944, -0.4033177, -0.7381215, 0, 0, 0, 1, 1,
-0.690334, -1.486722, -1.965097, 0, 0, 0, 1, 1,
-0.6856663, -0.2433521, -0.8249952, 0, 0, 0, 1, 1,
-0.6791568, 1.288627, 0.02690219, 1, 1, 1, 1, 1,
-0.6762894, -0.4141148, -4.214199, 1, 1, 1, 1, 1,
-0.6728226, 0.8021207, -0.9102156, 1, 1, 1, 1, 1,
-0.6727135, 0.6859028, -0.604688, 1, 1, 1, 1, 1,
-0.6716865, -0.04211311, -2.668951, 1, 1, 1, 1, 1,
-0.66811, 0.0788381, -0.7294928, 1, 1, 1, 1, 1,
-0.6678494, -0.6867909, -0.9085251, 1, 1, 1, 1, 1,
-0.6667583, 0.9053675, -1.621942, 1, 1, 1, 1, 1,
-0.6604479, -4.401145, -5.705822, 1, 1, 1, 1, 1,
-0.6573784, 0.3446075, -0.6325775, 1, 1, 1, 1, 1,
-0.6455882, -0.3923106, -1.943033, 1, 1, 1, 1, 1,
-0.6430259, 0.08081839, -2.174245, 1, 1, 1, 1, 1,
-0.6423798, 1.804805, 0.8294894, 1, 1, 1, 1, 1,
-0.6398249, -0.1797731, -3.257206, 1, 1, 1, 1, 1,
-0.6356555, -0.6511625, -0.5045465, 1, 1, 1, 1, 1,
-0.6341542, -1.400408, -2.776816, 0, 0, 1, 1, 1,
-0.6321957, -0.0846979, -2.05255, 1, 0, 0, 1, 1,
-0.6296188, 0.08868249, -1.365704, 1, 0, 0, 1, 1,
-0.6293895, -0.405425, -1.468743, 1, 0, 0, 1, 1,
-0.6270703, 1.001795, 0.7649801, 1, 0, 0, 1, 1,
-0.6155026, 0.132822, -1.837743, 1, 0, 0, 1, 1,
-0.6141102, 1.424313, -0.3638369, 0, 0, 0, 1, 1,
-0.6132908, -0.9873147, -1.811823, 0, 0, 0, 1, 1,
-0.6073501, 1.07845, 1.106909, 0, 0, 0, 1, 1,
-0.6059106, -0.5143542, -4.129558, 0, 0, 0, 1, 1,
-0.6024143, 0.5400416, 1.007614, 0, 0, 0, 1, 1,
-0.6022674, -0.005639159, -1.237729, 0, 0, 0, 1, 1,
-0.600982, -1.143849, -2.501843, 0, 0, 0, 1, 1,
-0.5980833, 0.3305852, -1.486818, 1, 1, 1, 1, 1,
-0.5941776, -0.03385896, -0.3964632, 1, 1, 1, 1, 1,
-0.5914059, 3.414083, -1.444132, 1, 1, 1, 1, 1,
-0.5890594, 0.5657965, -0.02903571, 1, 1, 1, 1, 1,
-0.5765151, 0.2078734, -2.436137, 1, 1, 1, 1, 1,
-0.5734051, -0.1854107, -1.134418, 1, 1, 1, 1, 1,
-0.5729315, -1.727814, -3.558652, 1, 1, 1, 1, 1,
-0.5661042, -0.7131834, -3.520372, 1, 1, 1, 1, 1,
-0.5643805, -0.583764, -3.147636, 1, 1, 1, 1, 1,
-0.5619627, -0.4599301, -2.937865, 1, 1, 1, 1, 1,
-0.5597906, -1.200732, -4.870809, 1, 1, 1, 1, 1,
-0.5551539, 1.077267, -0.1507931, 1, 1, 1, 1, 1,
-0.5527074, 1.175895, 0.341877, 1, 1, 1, 1, 1,
-0.5506473, -1.289266, -3.521103, 1, 1, 1, 1, 1,
-0.54994, -0.7931322, -2.150755, 1, 1, 1, 1, 1,
-0.5403646, -1.362203, -3.141518, 0, 0, 1, 1, 1,
-0.5295564, 1.14968, 0.7136949, 1, 0, 0, 1, 1,
-0.5294076, -1.767126, -2.284648, 1, 0, 0, 1, 1,
-0.5286581, 0.8034941, -0.5709944, 1, 0, 0, 1, 1,
-0.5266348, -0.2768407, -1.046879, 1, 0, 0, 1, 1,
-0.5229833, -1.287514, -3.60161, 1, 0, 0, 1, 1,
-0.5199611, -0.4690035, -1.156944, 0, 0, 0, 1, 1,
-0.5170053, 1.251401, -0.3153569, 0, 0, 0, 1, 1,
-0.5152157, -1.400529, -3.120938, 0, 0, 0, 1, 1,
-0.5147755, 0.2961415, 0.2646352, 0, 0, 0, 1, 1,
-0.5146582, -1.662291, -3.26921, 0, 0, 0, 1, 1,
-0.5077129, -0.2415941, -1.670814, 0, 0, 0, 1, 1,
-0.5060385, 0.3866033, -3.006335, 0, 0, 0, 1, 1,
-0.5028977, -0.7622769, -2.221253, 1, 1, 1, 1, 1,
-0.4998392, -0.6681834, -2.125295, 1, 1, 1, 1, 1,
-0.4949247, -0.4166035, -3.427007, 1, 1, 1, 1, 1,
-0.4941371, -1.697802, -2.883971, 1, 1, 1, 1, 1,
-0.4940308, 0.6750528, -0.4257114, 1, 1, 1, 1, 1,
-0.4927652, 1.354654, -0.1770813, 1, 1, 1, 1, 1,
-0.4919348, 0.1445994, 0.9486441, 1, 1, 1, 1, 1,
-0.491304, 0.1548441, -2.213615, 1, 1, 1, 1, 1,
-0.4900802, -0.5953092, -2.493778, 1, 1, 1, 1, 1,
-0.4892108, -0.7274908, -2.449138, 1, 1, 1, 1, 1,
-0.4869863, 0.2422673, -1.265431, 1, 1, 1, 1, 1,
-0.4849485, 1.079307, 1.497179, 1, 1, 1, 1, 1,
-0.4818186, -0.09583898, -2.062448, 1, 1, 1, 1, 1,
-0.4769665, -0.02860216, -1.494809, 1, 1, 1, 1, 1,
-0.4753424, 2.036935, 0.6672155, 1, 1, 1, 1, 1,
-0.4744704, -1.81083, -2.790642, 0, 0, 1, 1, 1,
-0.4674352, 0.3933717, 0.2803083, 1, 0, 0, 1, 1,
-0.4649408, -1.523224, -3.109223, 1, 0, 0, 1, 1,
-0.4644886, -1.219957, -0.7386684, 1, 0, 0, 1, 1,
-0.4556186, -0.8238778, -4.13787, 1, 0, 0, 1, 1,
-0.4529344, -0.2353889, -4.611538, 1, 0, 0, 1, 1,
-0.4495193, 1.326694, -0.3239118, 0, 0, 0, 1, 1,
-0.4490847, 0.01210664, -0.9246486, 0, 0, 0, 1, 1,
-0.4395176, 0.591466, -0.5623944, 0, 0, 0, 1, 1,
-0.4379317, 0.9936066, 2.640712, 0, 0, 0, 1, 1,
-0.4371934, 0.7062457, -1.295314, 0, 0, 0, 1, 1,
-0.4344191, 0.02124047, -2.268402, 0, 0, 0, 1, 1,
-0.4337369, 1.194496, 1.128572, 0, 0, 0, 1, 1,
-0.4323058, 0.02310947, -1.314621, 1, 1, 1, 1, 1,
-0.4301752, -0.007555043, 0.3353649, 1, 1, 1, 1, 1,
-0.4273421, 0.3703507, -1.24144, 1, 1, 1, 1, 1,
-0.4228275, -0.004071794, -3.169088, 1, 1, 1, 1, 1,
-0.4216006, 1.224303, -1.395267, 1, 1, 1, 1, 1,
-0.4212186, -0.3911055, -1.469764, 1, 1, 1, 1, 1,
-0.4159859, 1.241694, 2.691879, 1, 1, 1, 1, 1,
-0.4141844, -0.5386652, -3.086466, 1, 1, 1, 1, 1,
-0.4096374, -0.8587599, -3.017289, 1, 1, 1, 1, 1,
-0.4090821, -2.978868, -2.885665, 1, 1, 1, 1, 1,
-0.4081405, 1.115838, 1.508588, 1, 1, 1, 1, 1,
-0.399583, -2.932931, -3.836554, 1, 1, 1, 1, 1,
-0.3987373, -0.4897358, -3.338862, 1, 1, 1, 1, 1,
-0.3969954, -0.3075226, -0.7482165, 1, 1, 1, 1, 1,
-0.3963642, 1.483708, -0.8316966, 1, 1, 1, 1, 1,
-0.3961131, 0.1094463, -0.5403396, 0, 0, 1, 1, 1,
-0.3954169, 0.7539482, -1.759458, 1, 0, 0, 1, 1,
-0.3888633, 0.4824928, -0.4637125, 1, 0, 0, 1, 1,
-0.3878613, 0.6550433, 0.636178, 1, 0, 0, 1, 1,
-0.3833312, 1.111171, 1.099967, 1, 0, 0, 1, 1,
-0.3741433, 1.742809, -0.289858, 1, 0, 0, 1, 1,
-0.3739715, -0.4383803, -2.002982, 0, 0, 0, 1, 1,
-0.3739449, 0.3235005, -2.445611, 0, 0, 0, 1, 1,
-0.3656513, 0.2711655, -1.540271, 0, 0, 0, 1, 1,
-0.3647587, 0.4599582, 0.3528874, 0, 0, 0, 1, 1,
-0.3638453, -0.1921141, -1.622233, 0, 0, 0, 1, 1,
-0.3602129, 0.05636444, -1.767617, 0, 0, 0, 1, 1,
-0.353035, -2.508839, -3.182367, 0, 0, 0, 1, 1,
-0.3526129, 0.832065, -0.8530157, 1, 1, 1, 1, 1,
-0.3523397, -0.816434, -2.749275, 1, 1, 1, 1, 1,
-0.3511328, -0.7631092, -1.103691, 1, 1, 1, 1, 1,
-0.3493923, 1.871189, -0.8346917, 1, 1, 1, 1, 1,
-0.3473258, -2.086814, -1.74639, 1, 1, 1, 1, 1,
-0.3460565, -2.046197, -3.192866, 1, 1, 1, 1, 1,
-0.3430497, 0.1693394, -1.810384, 1, 1, 1, 1, 1,
-0.3424175, -1.192659, -3.7799, 1, 1, 1, 1, 1,
-0.3349257, 0.1253774, -2.18712, 1, 1, 1, 1, 1,
-0.3346408, 0.2076254, -2.967788, 1, 1, 1, 1, 1,
-0.3332844, -0.4197967, -2.354697, 1, 1, 1, 1, 1,
-0.3302763, -0.1870829, -1.815657, 1, 1, 1, 1, 1,
-0.3232073, 0.8681553, -0.2814891, 1, 1, 1, 1, 1,
-0.3229031, 0.06449644, -0.9648001, 1, 1, 1, 1, 1,
-0.3227201, 0.5943001, -1.29175, 1, 1, 1, 1, 1,
-0.3224292, 1.766142, 0.1945233, 0, 0, 1, 1, 1,
-0.3218468, -0.862207, -4.420593, 1, 0, 0, 1, 1,
-0.3196282, 1.858573, 0.206109, 1, 0, 0, 1, 1,
-0.3170231, -0.1585898, -3.321309, 1, 0, 0, 1, 1,
-0.3132857, -0.01822262, 0.4240508, 1, 0, 0, 1, 1,
-0.3132495, -0.3689753, -3.223113, 1, 0, 0, 1, 1,
-0.3120824, 0.2487448, -1.240569, 0, 0, 0, 1, 1,
-0.3103483, -0.644936, -3.610347, 0, 0, 0, 1, 1,
-0.309013, 0.8616499, -0.2319343, 0, 0, 0, 1, 1,
-0.3069042, -0.5666663, -2.351378, 0, 0, 0, 1, 1,
-0.3003396, -1.304139, -2.710647, 0, 0, 0, 1, 1,
-0.2997545, 0.5153393, -0.9017302, 0, 0, 0, 1, 1,
-0.2991802, -0.6981773, -4.053647, 0, 0, 0, 1, 1,
-0.2989985, 0.8170015, -0.08293261, 1, 1, 1, 1, 1,
-0.2945989, -1.291938, -0.394264, 1, 1, 1, 1, 1,
-0.2939633, 0.8816218, 0.2724457, 1, 1, 1, 1, 1,
-0.2858101, -0.3796645, -2.431511, 1, 1, 1, 1, 1,
-0.2845064, 0.5046663, -1.492566, 1, 1, 1, 1, 1,
-0.2841186, -0.3075924, -3.72669, 1, 1, 1, 1, 1,
-0.2807346, -0.4120525, 0.004853742, 1, 1, 1, 1, 1,
-0.2781337, 0.3999345, -0.7215951, 1, 1, 1, 1, 1,
-0.2766748, -1.526033, -1.096287, 1, 1, 1, 1, 1,
-0.2764891, -1.320477, -2.021433, 1, 1, 1, 1, 1,
-0.2720896, -0.7552833, -1.824598, 1, 1, 1, 1, 1,
-0.2711696, -0.137962, -2.351064, 1, 1, 1, 1, 1,
-0.2677479, 0.2121809, -0.477073, 1, 1, 1, 1, 1,
-0.2579681, -1.492146, -2.483039, 1, 1, 1, 1, 1,
-0.257125, 1.577328, 0.02881348, 1, 1, 1, 1, 1,
-0.2512057, -2.44973, -2.231303, 0, 0, 1, 1, 1,
-0.2447623, -0.5549571, -3.824996, 1, 0, 0, 1, 1,
-0.238387, 0.4224647, -1.512375, 1, 0, 0, 1, 1,
-0.2305561, 0.2133446, 0.782871, 1, 0, 0, 1, 1,
-0.2282329, 0.4250399, 0.911876, 1, 0, 0, 1, 1,
-0.2269867, -0.3409947, -1.361549, 1, 0, 0, 1, 1,
-0.2247467, 0.6226925, -0.5690877, 0, 0, 0, 1, 1,
-0.2186319, -1.038324, -4.268791, 0, 0, 0, 1, 1,
-0.2180185, -0.6911545, -1.54326, 0, 0, 0, 1, 1,
-0.2163848, 0.6239539, -1.573351, 0, 0, 0, 1, 1,
-0.215405, 1.775232, -0.9789687, 0, 0, 0, 1, 1,
-0.2153986, -1.248208, -2.175484, 0, 0, 0, 1, 1,
-0.2070499, 1.1285, -0.04758947, 0, 0, 0, 1, 1,
-0.2062784, 0.4957807, 1.525029, 1, 1, 1, 1, 1,
-0.2058905, 0.4172741, -0.8134448, 1, 1, 1, 1, 1,
-0.2057738, -0.1173071, -0.9001184, 1, 1, 1, 1, 1,
-0.2029399, -0.9911411, -4.461736, 1, 1, 1, 1, 1,
-0.2016441, 0.9588244, -1.049427, 1, 1, 1, 1, 1,
-0.1998508, 0.9339148, -1.585636, 1, 1, 1, 1, 1,
-0.1935949, 0.449727, -2.321892, 1, 1, 1, 1, 1,
-0.192695, 0.2587942, 0.6756133, 1, 1, 1, 1, 1,
-0.1825598, -0.812342, -0.8759682, 1, 1, 1, 1, 1,
-0.181746, 1.500307, -0.3212289, 1, 1, 1, 1, 1,
-0.1798299, -1.163157, -3.027774, 1, 1, 1, 1, 1,
-0.1733155, -1.227637, -2.936572, 1, 1, 1, 1, 1,
-0.1730586, 1.082208, 0.7109275, 1, 1, 1, 1, 1,
-0.1702052, 0.7757022, -0.7213653, 1, 1, 1, 1, 1,
-0.1664699, 2.111112, 0.9978044, 1, 1, 1, 1, 1,
-0.1637156, -0.2920713, -2.54977, 0, 0, 1, 1, 1,
-0.1635906, -0.4463609, -0.9428134, 1, 0, 0, 1, 1,
-0.1629063, -0.8420529, -3.343292, 1, 0, 0, 1, 1,
-0.1594226, 1.676211, 3.255623, 1, 0, 0, 1, 1,
-0.1583343, -0.9178149, -3.14449, 1, 0, 0, 1, 1,
-0.1578404, -0.8638241, -2.861223, 1, 0, 0, 1, 1,
-0.1573042, 0.3058485, -1.622002, 0, 0, 0, 1, 1,
-0.1558329, 0.5791913, -0.3138849, 0, 0, 0, 1, 1,
-0.154737, -2.044381, -3.601004, 0, 0, 0, 1, 1,
-0.1538003, 2.179569, 0.2028819, 0, 0, 0, 1, 1,
-0.153119, 0.9005833, -0.9626754, 0, 0, 0, 1, 1,
-0.1527189, -0.9590557, -2.919277, 0, 0, 0, 1, 1,
-0.1508974, 0.5369585, -0.2679656, 0, 0, 0, 1, 1,
-0.1442753, -1.34311, -4.05332, 1, 1, 1, 1, 1,
-0.1427841, -1.766954, -4.330629, 1, 1, 1, 1, 1,
-0.1393858, -0.4257928, -2.159648, 1, 1, 1, 1, 1,
-0.1376892, -0.9914253, -3.144373, 1, 1, 1, 1, 1,
-0.1369898, -1.665791, -2.46322, 1, 1, 1, 1, 1,
-0.1323895, -1.498965, -3.51192, 1, 1, 1, 1, 1,
-0.1306387, -1.56837, -4.00138, 1, 1, 1, 1, 1,
-0.1295411, 1.421531, -1.465475, 1, 1, 1, 1, 1,
-0.1294361, 0.6979206, 0.3337596, 1, 1, 1, 1, 1,
-0.1239563, 0.797803, -1.383292, 1, 1, 1, 1, 1,
-0.1212632, -1.436382, -3.051531, 1, 1, 1, 1, 1,
-0.1212497, -0.2005108, -3.439396, 1, 1, 1, 1, 1,
-0.1197477, 0.7345802, 0.8187233, 1, 1, 1, 1, 1,
-0.1140161, 0.6724666, -0.2445329, 1, 1, 1, 1, 1,
-0.113337, -0.1489852, -3.171207, 1, 1, 1, 1, 1,
-0.1131766, 1.38588, 1.291686, 0, 0, 1, 1, 1,
-0.1121807, -0.4214815, -3.376314, 1, 0, 0, 1, 1,
-0.1115555, 0.3992537, -0.6587043, 1, 0, 0, 1, 1,
-0.1086512, 0.6287619, 0.8707263, 1, 0, 0, 1, 1,
-0.1056452, -1.405938, -2.729713, 1, 0, 0, 1, 1,
-0.1052909, 0.7595348, -0.5635008, 1, 0, 0, 1, 1,
-0.1037075, 0.6561141, 0.2748226, 0, 0, 0, 1, 1,
-0.1030517, -0.8147526, -4.658717, 0, 0, 0, 1, 1,
-0.1028792, 1.366956, 0.9165167, 0, 0, 0, 1, 1,
-0.1021537, 0.3344138, -1.790164, 0, 0, 0, 1, 1,
-0.09537156, 1.615634, -0.9697117, 0, 0, 0, 1, 1,
-0.09453251, 1.252255, 0.6170032, 0, 0, 0, 1, 1,
-0.09206717, 0.6059447, -0.7097585, 0, 0, 0, 1, 1,
-0.09057491, 1.033045, 0.07218051, 1, 1, 1, 1, 1,
-0.09021727, -0.8764709, -2.836174, 1, 1, 1, 1, 1,
-0.09018411, -0.05900826, -4.142959, 1, 1, 1, 1, 1,
-0.08828896, -0.7793988, -2.684826, 1, 1, 1, 1, 1,
-0.08711495, 0.1879909, 1.270026, 1, 1, 1, 1, 1,
-0.08674841, -0.7337224, -2.763563, 1, 1, 1, 1, 1,
-0.08479806, -1.452592, -2.598106, 1, 1, 1, 1, 1,
-0.08288366, -0.5234714, -2.640018, 1, 1, 1, 1, 1,
-0.08221731, -1.420943, -2.805103, 1, 1, 1, 1, 1,
-0.08167592, 0.4731113, -0.7731017, 1, 1, 1, 1, 1,
-0.08112628, -0.6669983, -3.05463, 1, 1, 1, 1, 1,
-0.08022942, -0.05707105, -2.106581, 1, 1, 1, 1, 1,
-0.06960859, 1.061519, 0.9095962, 1, 1, 1, 1, 1,
-0.0667291, -1.302616, -5.155838, 1, 1, 1, 1, 1,
-0.06416332, -1.762988, -3.982274, 1, 1, 1, 1, 1,
-0.06121299, -0.7997344, -3.813057, 0, 0, 1, 1, 1,
-0.06090491, -2.103224, -2.234318, 1, 0, 0, 1, 1,
-0.05855728, -0.0632775, -3.849017, 1, 0, 0, 1, 1,
-0.05749033, 0.7081527, 1.321652, 1, 0, 0, 1, 1,
-0.05145835, -0.03447423, -2.666988, 1, 0, 0, 1, 1,
-0.04383452, 1.574698, 0.4372816, 1, 0, 0, 1, 1,
-0.04123729, -0.1256006, -3.659498, 0, 0, 0, 1, 1,
-0.0397161, 1.197119, -0.4718836, 0, 0, 0, 1, 1,
-0.0383129, -1.962496, -4.491937, 0, 0, 0, 1, 1,
-0.03819278, 2.665521, 1.183448, 0, 0, 0, 1, 1,
-0.03396136, 0.3190711, -0.09103332, 0, 0, 0, 1, 1,
-0.02306452, -0.1132914, -2.813233, 0, 0, 0, 1, 1,
-0.02004985, 1.425486, -1.127353, 0, 0, 0, 1, 1,
-0.0199454, 0.2069215, 0.803231, 1, 1, 1, 1, 1,
-0.01861997, 0.5454072, -1.209481, 1, 1, 1, 1, 1,
-0.01782275, 1.242026, -0.2567446, 1, 1, 1, 1, 1,
-0.01395341, -1.001439, -3.501407, 1, 1, 1, 1, 1,
-0.01257254, 0.006540627, 0.08032066, 1, 1, 1, 1, 1,
-0.01236357, 0.3943383, -0.7239077, 1, 1, 1, 1, 1,
-0.009209049, 1.542046, -0.4025243, 1, 1, 1, 1, 1,
0.0003327027, -1.603753, 2.294885, 1, 1, 1, 1, 1,
0.0003711167, -1.117895, 3.20174, 1, 1, 1, 1, 1,
0.001724218, -0.437622, 3.299144, 1, 1, 1, 1, 1,
0.002216495, -0.7840476, 3.920995, 1, 1, 1, 1, 1,
0.002852812, 0.6103112, -0.7804667, 1, 1, 1, 1, 1,
0.01712858, -0.2357514, 3.818692, 1, 1, 1, 1, 1,
0.01857119, 0.3485787, 1.333788, 1, 1, 1, 1, 1,
0.02265393, -0.5048086, 4.399387, 1, 1, 1, 1, 1,
0.02672954, 0.9576916, -0.577979, 0, 0, 1, 1, 1,
0.02678264, -1.561957, 3.305573, 1, 0, 0, 1, 1,
0.02859647, -1.00898, 3.262067, 1, 0, 0, 1, 1,
0.03036453, -2.521298, 5.291037, 1, 0, 0, 1, 1,
0.03126702, 0.5313672, 0.01577589, 1, 0, 0, 1, 1,
0.03370867, 1.25464, -1.429173, 1, 0, 0, 1, 1,
0.03415417, 0.3976173, 0.2613562, 0, 0, 0, 1, 1,
0.03617211, 0.1328186, -0.1075754, 0, 0, 0, 1, 1,
0.04126608, -1.383455, 4.603048, 0, 0, 0, 1, 1,
0.04177542, 0.7681316, 0.004352896, 0, 0, 0, 1, 1,
0.04288702, 0.2367224, 2.66467, 0, 0, 0, 1, 1,
0.0439346, -0.01785262, 1.720977, 0, 0, 0, 1, 1,
0.04624723, 0.4070774, 0.3691918, 0, 0, 0, 1, 1,
0.05809677, 1.065332, 0.1890394, 1, 1, 1, 1, 1,
0.06135282, 1.798959, -0.02508211, 1, 1, 1, 1, 1,
0.0624563, 0.03765569, 0.04372495, 1, 1, 1, 1, 1,
0.06664656, -1.549243, 3.705563, 1, 1, 1, 1, 1,
0.06896375, -0.6714376, 2.402892, 1, 1, 1, 1, 1,
0.07101025, 0.7373108, -0.4295582, 1, 1, 1, 1, 1,
0.07320563, -0.04722056, 2.010137, 1, 1, 1, 1, 1,
0.07613847, 3.000662, -0.352429, 1, 1, 1, 1, 1,
0.07714419, -0.01955364, 1.844209, 1, 1, 1, 1, 1,
0.0775197, -0.6128398, 3.126776, 1, 1, 1, 1, 1,
0.07764996, -0.9274495, 4.441335, 1, 1, 1, 1, 1,
0.09499567, 0.02552153, 2.205563, 1, 1, 1, 1, 1,
0.09570204, -0.6950151, 3.985126, 1, 1, 1, 1, 1,
0.09625126, 1.817646, 1.106942, 1, 1, 1, 1, 1,
0.09785287, -0.01139474, 0.3946872, 1, 1, 1, 1, 1,
0.09808496, -0.3882064, 3.003268, 0, 0, 1, 1, 1,
0.09841355, -0.4937095, 3.937871, 1, 0, 0, 1, 1,
0.1017295, 0.1901358, 1.089925, 1, 0, 0, 1, 1,
0.1046959, 0.3045154, -0.05477549, 1, 0, 0, 1, 1,
0.1060212, 0.0006160056, 2.886927, 1, 0, 0, 1, 1,
0.1072951, 0.2494401, -0.2601996, 1, 0, 0, 1, 1,
0.1121611, -0.3341154, 2.156285, 0, 0, 0, 1, 1,
0.1130522, 0.5672698, 0.0944873, 0, 0, 0, 1, 1,
0.1141219, -1.238486, 3.23977, 0, 0, 0, 1, 1,
0.1157359, 0.06449997, 2.582194, 0, 0, 0, 1, 1,
0.1194603, 1.032137, -0.410182, 0, 0, 0, 1, 1,
0.1234213, -0.4638488, 1.553592, 0, 0, 0, 1, 1,
0.125009, 1.399086, 0.1475502, 0, 0, 0, 1, 1,
0.1264006, -1.046627, 1.695532, 1, 1, 1, 1, 1,
0.127055, -0.1345142, 2.967761, 1, 1, 1, 1, 1,
0.128435, -0.4382024, 4.18018, 1, 1, 1, 1, 1,
0.129296, 0.3437067, 0.8829066, 1, 1, 1, 1, 1,
0.1311584, -0.03707041, 1.825854, 1, 1, 1, 1, 1,
0.1313628, -0.008935728, 2.792988, 1, 1, 1, 1, 1,
0.1383696, -0.2787875, 3.65376, 1, 1, 1, 1, 1,
0.1438452, -1.778318, 4.885225, 1, 1, 1, 1, 1,
0.1482973, 0.2218566, 0.8077578, 1, 1, 1, 1, 1,
0.1506278, 2.326931, -0.4933509, 1, 1, 1, 1, 1,
0.1511335, 0.3872381, 0.6998236, 1, 1, 1, 1, 1,
0.1516707, -1.418412, 2.031866, 1, 1, 1, 1, 1,
0.1556012, -0.3839135, 1.430225, 1, 1, 1, 1, 1,
0.1591926, -0.4025511, 3.19032, 1, 1, 1, 1, 1,
0.1621703, 1.258877, -0.8081198, 1, 1, 1, 1, 1,
0.1628594, -1.444569, 2.723332, 0, 0, 1, 1, 1,
0.1730795, -1.952451, 4.756796, 1, 0, 0, 1, 1,
0.1744127, -0.1083409, 1.297551, 1, 0, 0, 1, 1,
0.1783733, -1.237173, 2.419019, 1, 0, 0, 1, 1,
0.1807455, -0.9902549, 3.464615, 1, 0, 0, 1, 1,
0.1831349, 1.239165, -0.421261, 1, 0, 0, 1, 1,
0.1841336, -1.075391, 1.739989, 0, 0, 0, 1, 1,
0.1871849, 0.7383553, 1.87492, 0, 0, 0, 1, 1,
0.2046552, 1.764077, -0.9949862, 0, 0, 0, 1, 1,
0.2093776, 0.1449924, 1.848005, 0, 0, 0, 1, 1,
0.2108393, 0.3375734, 1.120872, 0, 0, 0, 1, 1,
0.2115814, 0.4468589, 0.8761316, 0, 0, 0, 1, 1,
0.2138314, 1.441387, 1.630173, 0, 0, 0, 1, 1,
0.2152285, -0.6614282, 3.336307, 1, 1, 1, 1, 1,
0.2157004, -0.01487911, 0.690316, 1, 1, 1, 1, 1,
0.2240103, -0.1898727, 2.840475, 1, 1, 1, 1, 1,
0.2258969, 1.342457, 0.3343972, 1, 1, 1, 1, 1,
0.229829, -0.8879033, 3.60851, 1, 1, 1, 1, 1,
0.2307914, 0.8568909, 1.655166, 1, 1, 1, 1, 1,
0.2315856, -0.8475642, 2.352201, 1, 1, 1, 1, 1,
0.2330736, -0.6132803, 1.658932, 1, 1, 1, 1, 1,
0.2358156, -0.9842141, 3.844399, 1, 1, 1, 1, 1,
0.2363302, 0.904005, 0.1614852, 1, 1, 1, 1, 1,
0.2423854, -1.029379, 1.964039, 1, 1, 1, 1, 1,
0.2455964, 1.013225, -0.2203621, 1, 1, 1, 1, 1,
0.2470621, 0.2140869, 3.058371, 1, 1, 1, 1, 1,
0.2488407, 0.2116716, 1.027379, 1, 1, 1, 1, 1,
0.2511395, -0.472373, 4.242698, 1, 1, 1, 1, 1,
0.2535721, 0.7861651, -0.3825665, 0, 0, 1, 1, 1,
0.2557921, 0.1475687, 0.8248469, 1, 0, 0, 1, 1,
0.2600702, 0.4810972, 2.241272, 1, 0, 0, 1, 1,
0.2605025, 0.5956687, 0.7941081, 1, 0, 0, 1, 1,
0.2645732, -0.1579074, 0.6089613, 1, 0, 0, 1, 1,
0.2670166, -0.8898031, 2.589456, 1, 0, 0, 1, 1,
0.2673689, -1.411913, 2.437366, 0, 0, 0, 1, 1,
0.2701911, 0.6008038, -0.1812489, 0, 0, 0, 1, 1,
0.2795122, -1.27283, 3.071662, 0, 0, 0, 1, 1,
0.279654, 0.932923, 0.69098, 0, 0, 0, 1, 1,
0.2796832, 0.05888633, 1.352259, 0, 0, 0, 1, 1,
0.2819764, -0.02248126, 0.6477717, 0, 0, 0, 1, 1,
0.2827097, -2.002519, 2.824553, 0, 0, 0, 1, 1,
0.2850201, -0.6256695, 2.378252, 1, 1, 1, 1, 1,
0.2877196, 2.156915, 1.779869, 1, 1, 1, 1, 1,
0.2897162, 0.3284155, 0.7553, 1, 1, 1, 1, 1,
0.2898025, -1.281027, 2.951107, 1, 1, 1, 1, 1,
0.2912653, -0.2911729, 2.467059, 1, 1, 1, 1, 1,
0.2960733, 0.06220908, 0.961129, 1, 1, 1, 1, 1,
0.297322, -0.07475328, 4.029111, 1, 1, 1, 1, 1,
0.2978104, -1.405227, 2.468364, 1, 1, 1, 1, 1,
0.3010561, -2.278046, 3.521496, 1, 1, 1, 1, 1,
0.3056246, -1.110594, 1.744805, 1, 1, 1, 1, 1,
0.3132752, 0.4523697, 1.095592, 1, 1, 1, 1, 1,
0.3136388, -1.417601, 3.080897, 1, 1, 1, 1, 1,
0.3195034, -1.427206, 3.632299, 1, 1, 1, 1, 1,
0.3196848, -2.457326, 3.058386, 1, 1, 1, 1, 1,
0.3240262, -1.923683, 2.375207, 1, 1, 1, 1, 1,
0.3240616, 0.4043963, 0.06567574, 0, 0, 1, 1, 1,
0.3244706, -0.2580644, 3.261051, 1, 0, 0, 1, 1,
0.3332441, -0.06437932, 2.104909, 1, 0, 0, 1, 1,
0.3339505, -1.03818, 3.50095, 1, 0, 0, 1, 1,
0.3438441, -0.8287481, 2.642031, 1, 0, 0, 1, 1,
0.344174, 1.319355, 1.225702, 1, 0, 0, 1, 1,
0.347028, -1.075717, 2.562825, 0, 0, 0, 1, 1,
0.348141, -1.237226, 2.786041, 0, 0, 0, 1, 1,
0.349316, -0.9098527, 4.248598, 0, 0, 0, 1, 1,
0.3512264, 0.03811081, 1.626894, 0, 0, 0, 1, 1,
0.3532729, 0.3810936, 1.122162, 0, 0, 0, 1, 1,
0.3593542, 0.7434942, 1.325904, 0, 0, 0, 1, 1,
0.3594314, 0.2586585, -0.2790326, 0, 0, 0, 1, 1,
0.3597341, 1.304177, 0.6829612, 1, 1, 1, 1, 1,
0.3637558, 0.5766805, 0.6484382, 1, 1, 1, 1, 1,
0.3682566, -0.1449853, 2.609839, 1, 1, 1, 1, 1,
0.3685989, -0.190921, 2.134312, 1, 1, 1, 1, 1,
0.3727244, -1.616828, 4.762861, 1, 1, 1, 1, 1,
0.3730662, -1.084694, 3.933768, 1, 1, 1, 1, 1,
0.3735396, 2.025951, -0.8387344, 1, 1, 1, 1, 1,
0.3750908, -0.1935879, -0.04546522, 1, 1, 1, 1, 1,
0.3755571, -0.2790661, 2.408743, 1, 1, 1, 1, 1,
0.3759744, 0.60764, 0.02110643, 1, 1, 1, 1, 1,
0.3803081, 0.6059843, 0.9000209, 1, 1, 1, 1, 1,
0.3803303, -0.03381642, 0.7413326, 1, 1, 1, 1, 1,
0.3830326, 1.386582, 1.926485, 1, 1, 1, 1, 1,
0.3837668, -0.2334255, 1.516083, 1, 1, 1, 1, 1,
0.3862559, 0.2177182, 1.855428, 1, 1, 1, 1, 1,
0.3879959, -0.4082184, 4.34393, 0, 0, 1, 1, 1,
0.3908129, -0.2781434, 3.146841, 1, 0, 0, 1, 1,
0.3922176, 0.1302616, 0.8416033, 1, 0, 0, 1, 1,
0.398813, -0.8618916, 2.83578, 1, 0, 0, 1, 1,
0.3995799, 1.862607, 0.4134059, 1, 0, 0, 1, 1,
0.4005379, -0.6761868, 2.451971, 1, 0, 0, 1, 1,
0.4023744, 1.3068, -0.9088154, 0, 0, 0, 1, 1,
0.4032045, 0.6138839, 0.6983194, 0, 0, 0, 1, 1,
0.410611, 1.528204, 0.6430465, 0, 0, 0, 1, 1,
0.411382, -0.8284755, 4.29116, 0, 0, 0, 1, 1,
0.4126259, -0.2315431, 1.504075, 0, 0, 0, 1, 1,
0.414766, 1.846961, 0.5154275, 0, 0, 0, 1, 1,
0.421192, -1.485356, 1.636355, 0, 0, 0, 1, 1,
0.4239923, -0.9781134, 1.466502, 1, 1, 1, 1, 1,
0.4263226, -0.1509008, 2.802879, 1, 1, 1, 1, 1,
0.434241, 2.171055, 0.5938933, 1, 1, 1, 1, 1,
0.436417, 0.9683514, 1.707643, 1, 1, 1, 1, 1,
0.4407204, -0.4388228, 2.749136, 1, 1, 1, 1, 1,
0.4492797, -1.167343, 4.215743, 1, 1, 1, 1, 1,
0.4493667, 0.4363513, 0.4481394, 1, 1, 1, 1, 1,
0.45078, -0.3247167, 2.058866, 1, 1, 1, 1, 1,
0.4514758, -0.65425, 2.418995, 1, 1, 1, 1, 1,
0.4517373, -1.036141, 2.557864, 1, 1, 1, 1, 1,
0.4543386, -0.3685469, 4.89142, 1, 1, 1, 1, 1,
0.4548155, -1.077682, 2.019943, 1, 1, 1, 1, 1,
0.4557801, -1.020605, 2.431037, 1, 1, 1, 1, 1,
0.4572249, -1.782592, 4.159479, 1, 1, 1, 1, 1,
0.4589621, -0.06786278, 1.042605, 1, 1, 1, 1, 1,
0.4591902, -2.096521, 1.833835, 0, 0, 1, 1, 1,
0.4666473, 0.3187289, 1.911226, 1, 0, 0, 1, 1,
0.4687064, -0.5654103, 1.421603, 1, 0, 0, 1, 1,
0.4691353, 1.310547, 0.04250168, 1, 0, 0, 1, 1,
0.4766036, -2.952698, 3.62675, 1, 0, 0, 1, 1,
0.4823748, -1.718081, 1.187073, 1, 0, 0, 1, 1,
0.4883462, -0.02136778, 1.597683, 0, 0, 0, 1, 1,
0.4891148, 1.00496, 1.539147, 0, 0, 0, 1, 1,
0.4959283, -0.6272039, 3.842127, 0, 0, 0, 1, 1,
0.4960299, 0.104856, 2.49031, 0, 0, 0, 1, 1,
0.5053191, -0.9122515, 2.630132, 0, 0, 0, 1, 1,
0.5080118, -1.247942, 0.9130815, 0, 0, 0, 1, 1,
0.508494, -1.627345, 2.029585, 0, 0, 0, 1, 1,
0.5101663, -1.423316, 2.968256, 1, 1, 1, 1, 1,
0.5168608, 0.2615951, 1.254725, 1, 1, 1, 1, 1,
0.5207813, 0.5187687, 1.063231, 1, 1, 1, 1, 1,
0.5209894, 0.695051, -0.1043912, 1, 1, 1, 1, 1,
0.5233502, -0.5263035, 2.880444, 1, 1, 1, 1, 1,
0.5258542, 1.83871, -0.4648049, 1, 1, 1, 1, 1,
0.5261179, -0.1434164, 0.9694223, 1, 1, 1, 1, 1,
0.5263218, -0.5300249, 1.657119, 1, 1, 1, 1, 1,
0.5277113, 1.206303, -0.5268601, 1, 1, 1, 1, 1,
0.5370871, -1.320673, 2.533361, 1, 1, 1, 1, 1,
0.5388682, 0.303301, 1.1126, 1, 1, 1, 1, 1,
0.5460235, 0.4516497, 1.380365, 1, 1, 1, 1, 1,
0.5509338, 1.452754, 1.618739, 1, 1, 1, 1, 1,
0.5543321, -0.3841738, 1.419246, 1, 1, 1, 1, 1,
0.5555297, 1.705713, 1.284852, 1, 1, 1, 1, 1,
0.5556393, 2.076857, 1.291281, 0, 0, 1, 1, 1,
0.558858, 0.1244694, -0.5344199, 1, 0, 0, 1, 1,
0.5611417, 1.509607, -0.8306016, 1, 0, 0, 1, 1,
0.5620311, 1.300991, -0.7671121, 1, 0, 0, 1, 1,
0.5636629, 0.6545832, 1.563305, 1, 0, 0, 1, 1,
0.5638515, 0.4367248, 1.271489, 1, 0, 0, 1, 1,
0.5649445, -1.959567, 3.081617, 0, 0, 0, 1, 1,
0.5704579, -0.305864, 3.79319, 0, 0, 0, 1, 1,
0.5745375, -0.2427398, 1.845252, 0, 0, 0, 1, 1,
0.575463, -1.059773, 2.329144, 0, 0, 0, 1, 1,
0.5754947, 0.8907965, 0.8267893, 0, 0, 0, 1, 1,
0.5840475, 0.4179706, 0.9407286, 0, 0, 0, 1, 1,
0.5895211, -0.918556, 3.716932, 0, 0, 0, 1, 1,
0.5934946, -1.571496, 4.768478, 1, 1, 1, 1, 1,
0.5939422, -1.156174, 4.466909, 1, 1, 1, 1, 1,
0.5947124, 1.417466, 0.201906, 1, 1, 1, 1, 1,
0.5956165, -1.317599, 2.486989, 1, 1, 1, 1, 1,
0.5960162, -0.5066637, 1.490164, 1, 1, 1, 1, 1,
0.6027937, 0.6056867, 0.9779148, 1, 1, 1, 1, 1,
0.6052345, 1.658818, 1.492267, 1, 1, 1, 1, 1,
0.605644, -0.0805108, 3.616566, 1, 1, 1, 1, 1,
0.6075535, 0.5669405, 2.24492, 1, 1, 1, 1, 1,
0.6085303, -0.01224945, 2.391375, 1, 1, 1, 1, 1,
0.6151785, 1.364866, 0.09529825, 1, 1, 1, 1, 1,
0.6153575, -0.8468591, 2.793619, 1, 1, 1, 1, 1,
0.6177523, 0.5572855, 0.2117653, 1, 1, 1, 1, 1,
0.6224701, 0.2565272, 0.07758394, 1, 1, 1, 1, 1,
0.6226324, -0.5260178, 2.508892, 1, 1, 1, 1, 1,
0.6231855, 0.979503, 2.546296, 0, 0, 1, 1, 1,
0.6250852, 1.823525, 1.009868, 1, 0, 0, 1, 1,
0.6254123, 1.766942, -0.1194524, 1, 0, 0, 1, 1,
0.6284032, 2.16803, 0.9075749, 1, 0, 0, 1, 1,
0.6312202, 0.3171804, -0.143263, 1, 0, 0, 1, 1,
0.6313, 1.289247, 0.00335705, 1, 0, 0, 1, 1,
0.6319655, 0.3020898, 2.518307, 0, 0, 0, 1, 1,
0.6340031, -0.04369237, 2.710314, 0, 0, 0, 1, 1,
0.6345417, -1.319711, 2.929096, 0, 0, 0, 1, 1,
0.6349913, -0.1801028, 1.650548, 0, 0, 0, 1, 1,
0.6415898, 1.466238, 0.4411561, 0, 0, 0, 1, 1,
0.643841, 0.715293, -1.048596, 0, 0, 0, 1, 1,
0.6485977, 1.253666, 1.185626, 0, 0, 0, 1, 1,
0.6491386, 1.014605, 0.3832452, 1, 1, 1, 1, 1,
0.651513, 0.3210292, 2.060548, 1, 1, 1, 1, 1,
0.6520955, 0.5057448, 2.084068, 1, 1, 1, 1, 1,
0.6536602, 0.6373506, -0.4069712, 1, 1, 1, 1, 1,
0.6565296, 1.812811, 0.9083041, 1, 1, 1, 1, 1,
0.6573671, 0.1685691, 1.071621, 1, 1, 1, 1, 1,
0.6580625, -0.2611267, 2.549888, 1, 1, 1, 1, 1,
0.6607447, -2.160991, 3.487285, 1, 1, 1, 1, 1,
0.6620715, -0.3446638, 2.707122, 1, 1, 1, 1, 1,
0.66309, -1.663258, 2.344832, 1, 1, 1, 1, 1,
0.6643335, 0.7348289, 0.988879, 1, 1, 1, 1, 1,
0.6737043, 0.158148, 0.4915124, 1, 1, 1, 1, 1,
0.6792043, 0.04587015, 1.921348, 1, 1, 1, 1, 1,
0.6811124, -1.957918, 2.577484, 1, 1, 1, 1, 1,
0.6867343, 1.084402, 1.010554, 1, 1, 1, 1, 1,
0.6915314, -0.7909299, 1.979839, 0, 0, 1, 1, 1,
0.6928098, -0.821198, 2.066955, 1, 0, 0, 1, 1,
0.6939529, 0.6562843, -1.186514, 1, 0, 0, 1, 1,
0.6945868, -0.88052, 1.992662, 1, 0, 0, 1, 1,
0.7014592, -0.7881938, 2.371925, 1, 0, 0, 1, 1,
0.7027707, -0.7301419, 1.308524, 1, 0, 0, 1, 1,
0.7038565, -0.007576272, 1.944054, 0, 0, 0, 1, 1,
0.7127413, -0.1998958, 1.961219, 0, 0, 0, 1, 1,
0.7128991, -0.115737, 2.553951, 0, 0, 0, 1, 1,
0.7158071, -0.2793675, 2.168814, 0, 0, 0, 1, 1,
0.7188029, -0.580283, 1.800588, 0, 0, 0, 1, 1,
0.7257541, 1.54281, -0.8993586, 0, 0, 0, 1, 1,
0.7279432, -0.3246212, 1.224331, 0, 0, 0, 1, 1,
0.7385433, 0.2639468, 0.764108, 1, 1, 1, 1, 1,
0.7421885, -0.1403087, 1.33797, 1, 1, 1, 1, 1,
0.7450482, -0.2674443, 1.198846, 1, 1, 1, 1, 1,
0.7512368, 1.806141, -1.776308, 1, 1, 1, 1, 1,
0.7526805, 0.6824209, -1.692427, 1, 1, 1, 1, 1,
0.7545012, -0.5007579, 2.400401, 1, 1, 1, 1, 1,
0.7602533, 1.060113, 0.5506063, 1, 1, 1, 1, 1,
0.7610518, -0.9067346, 0.102167, 1, 1, 1, 1, 1,
0.7616396, -0.2839921, 1.256845, 1, 1, 1, 1, 1,
0.7634646, -0.1140236, -0.1435678, 1, 1, 1, 1, 1,
0.7654979, -1.260898, 4.793231, 1, 1, 1, 1, 1,
0.7684453, 0.6625947, 0.6359445, 1, 1, 1, 1, 1,
0.7693341, -0.2004138, 0.9740598, 1, 1, 1, 1, 1,
0.7743133, -1.654833, 5.005348, 1, 1, 1, 1, 1,
0.7767872, -1.214763, 3.613655, 1, 1, 1, 1, 1,
0.7790917, 0.8557475, 0.7144427, 0, 0, 1, 1, 1,
0.7806003, 1.188128, 0.4116766, 1, 0, 0, 1, 1,
0.782491, 0.002341415, 2.1423, 1, 0, 0, 1, 1,
0.7881224, 0.1315186, 2.807018, 1, 0, 0, 1, 1,
0.7898775, 0.6242812, 0.01359445, 1, 0, 0, 1, 1,
0.7930531, -0.01539323, 1.58007, 1, 0, 0, 1, 1,
0.7939259, 0.3742348, 1.656269, 0, 0, 0, 1, 1,
0.7947832, 0.3528493, 0.9677697, 0, 0, 0, 1, 1,
0.7960739, 0.6520242, -0.2134672, 0, 0, 0, 1, 1,
0.7971456, 0.9991826, 0.07475309, 0, 0, 0, 1, 1,
0.7983773, -1.023133, 3.756869, 0, 0, 0, 1, 1,
0.8014186, 1.385221, -0.667512, 0, 0, 0, 1, 1,
0.8050672, 0.2324732, 2.22857, 0, 0, 0, 1, 1,
0.811545, -0.7716591, 2.875353, 1, 1, 1, 1, 1,
0.8150751, 1.661645, 1.662548, 1, 1, 1, 1, 1,
0.8242974, 0.009773336, 1.528484, 1, 1, 1, 1, 1,
0.8261739, 0.4317378, 1.945995, 1, 1, 1, 1, 1,
0.8275798, -0.2686091, 0.4715335, 1, 1, 1, 1, 1,
0.8367593, 0.09150979, 3.498872, 1, 1, 1, 1, 1,
0.8385129, -0.9632181, 2.69531, 1, 1, 1, 1, 1,
0.8460752, 1.262974, 1.737789, 1, 1, 1, 1, 1,
0.8462825, -0.0824705, 2.669687, 1, 1, 1, 1, 1,
0.847914, 1.124694, -0.5827746, 1, 1, 1, 1, 1,
0.8487401, -1.748472, 1.175482, 1, 1, 1, 1, 1,
0.8508052, 1.08838, 2.178317, 1, 1, 1, 1, 1,
0.863926, -0.08891055, 0.6653826, 1, 1, 1, 1, 1,
0.8644531, -0.6837853, 1.186908, 1, 1, 1, 1, 1,
0.8650364, 0.4181957, 1.356636, 1, 1, 1, 1, 1,
0.8655463, -0.703468, 2.696605, 0, 0, 1, 1, 1,
0.8723902, 0.3923571, 2.373636, 1, 0, 0, 1, 1,
0.8728696, -0.9765208, 2.011026, 1, 0, 0, 1, 1,
0.8734974, 0.3122005, 1.272991, 1, 0, 0, 1, 1,
0.877799, -1.400395, 3.841967, 1, 0, 0, 1, 1,
0.8797109, -0.9506388, 3.060929, 1, 0, 0, 1, 1,
0.8866334, 1.618178, 0.8178663, 0, 0, 0, 1, 1,
0.8972967, 0.8972583, 2.726068, 0, 0, 0, 1, 1,
0.9061074, 0.5088487, 0.9717425, 0, 0, 0, 1, 1,
0.9130995, -0.4164049, 1.624139, 0, 0, 0, 1, 1,
0.9216787, 0.3476985, 1.102224, 0, 0, 0, 1, 1,
0.9224956, 0.7141629, 1.191424, 0, 0, 0, 1, 1,
0.9239727, -1.119078, 1.416504, 0, 0, 0, 1, 1,
0.9241136, 1.883295, 0.8564086, 1, 1, 1, 1, 1,
0.9294603, 0.02402189, 1.293445, 1, 1, 1, 1, 1,
0.9325513, -0.5240555, 1.808398, 1, 1, 1, 1, 1,
0.9350452, -2.089641, 1.768038, 1, 1, 1, 1, 1,
0.9376903, 0.2994424, 1.416772, 1, 1, 1, 1, 1,
0.9512303, -0.4481616, 0.8936447, 1, 1, 1, 1, 1,
0.9566504, 0.8235605, -0.4572493, 1, 1, 1, 1, 1,
0.9601222, -0.4034973, 0.6709518, 1, 1, 1, 1, 1,
0.9660333, 1.758074, 1.275485, 1, 1, 1, 1, 1,
0.9672713, 1.169588, 0.907887, 1, 1, 1, 1, 1,
0.9677696, -0.444078, 1.310073, 1, 1, 1, 1, 1,
0.9684721, 0.07618209, 1.481614, 1, 1, 1, 1, 1,
0.978165, 0.4311552, 0.203886, 1, 1, 1, 1, 1,
0.9824528, 0.6857445, 1.359253, 1, 1, 1, 1, 1,
0.9826174, 0.2916287, 0.6813948, 1, 1, 1, 1, 1,
0.9830118, 1.496443, -0.821749, 0, 0, 1, 1, 1,
0.9862143, -1.205641, 0.08467048, 1, 0, 0, 1, 1,
0.994203, 0.7596763, 1.702209, 1, 0, 0, 1, 1,
0.9990391, 1.736382, -0.2430558, 1, 0, 0, 1, 1,
1.003152, 1.861473, 1.212703, 1, 0, 0, 1, 1,
1.024379, -0.2037071, 2.492034, 1, 0, 0, 1, 1,
1.027183, 0.569248, -1.01018, 0, 0, 0, 1, 1,
1.031046, -1.487011, 2.419101, 0, 0, 0, 1, 1,
1.033527, 0.1337172, -0.01810345, 0, 0, 0, 1, 1,
1.04947, -1.220907, 2.698307, 0, 0, 0, 1, 1,
1.049714, -0.8306888, 1.1894, 0, 0, 0, 1, 1,
1.051221, -0.8808731, 2.653024, 0, 0, 0, 1, 1,
1.058797, -0.8414075, 2.975295, 0, 0, 0, 1, 1,
1.059051, -2.194698, 2.002387, 1, 1, 1, 1, 1,
1.075753, 0.7896462, 1.137958, 1, 1, 1, 1, 1,
1.077865, -0.79142, 3.05334, 1, 1, 1, 1, 1,
1.08149, -0.872983, 1.919183, 1, 1, 1, 1, 1,
1.082039, 0.8163019, 1.619899, 1, 1, 1, 1, 1,
1.082325, -1.361475, 2.79472, 1, 1, 1, 1, 1,
1.086079, -1.507179, 1.337097, 1, 1, 1, 1, 1,
1.092081, 0.1337344, 2.08176, 1, 1, 1, 1, 1,
1.09283, -1.336159, 2.857729, 1, 1, 1, 1, 1,
1.105117, -0.4810586, 0.3484737, 1, 1, 1, 1, 1,
1.109155, 1.106017, -0.2881417, 1, 1, 1, 1, 1,
1.118049, 1.042307, 0.2704895, 1, 1, 1, 1, 1,
1.130856, -0.6408873, 1.576085, 1, 1, 1, 1, 1,
1.143561, 0.2009242, -0.7107546, 1, 1, 1, 1, 1,
1.146211, 0.8243979, 1.673851, 1, 1, 1, 1, 1,
1.154051, 0.4897661, -0.2642039, 0, 0, 1, 1, 1,
1.157634, 0.3828852, -0.4219212, 1, 0, 0, 1, 1,
1.170538, -0.3458842, 1.558975, 1, 0, 0, 1, 1,
1.172357, -0.5019988, 1.542584, 1, 0, 0, 1, 1,
1.187191, -0.6241212, 1.326479, 1, 0, 0, 1, 1,
1.187249, 0.03964921, 1.326086, 1, 0, 0, 1, 1,
1.191505, 0.7042982, 0.5303888, 0, 0, 0, 1, 1,
1.195571, 2.242868, 0.8109969, 0, 0, 0, 1, 1,
1.195817, 1.737649, 1.124776, 0, 0, 0, 1, 1,
1.200115, 0.3181016, 1.728114, 0, 0, 0, 1, 1,
1.200746, -0.03320368, 2.762892, 0, 0, 0, 1, 1,
1.202727, 0.4757785, 0.3273573, 0, 0, 0, 1, 1,
1.20603, 0.2543819, 2.31023, 0, 0, 0, 1, 1,
1.206401, 0.4208073, 0.4783523, 1, 1, 1, 1, 1,
1.211138, 1.169891, 1.056773, 1, 1, 1, 1, 1,
1.214516, 0.2397456, 1.250829, 1, 1, 1, 1, 1,
1.225188, 0.04206534, -0.5613557, 1, 1, 1, 1, 1,
1.228612, -0.4940484, 1.068287, 1, 1, 1, 1, 1,
1.23179, -1.48684, 0.9141981, 1, 1, 1, 1, 1,
1.233713, -0.5557163, 2.079584, 1, 1, 1, 1, 1,
1.236032, -0.1949418, 0.4323678, 1, 1, 1, 1, 1,
1.239291, 0.7757882, 0.432262, 1, 1, 1, 1, 1,
1.249919, 1.331162, 1.567754, 1, 1, 1, 1, 1,
1.253788, 0.2623255, -1.145402, 1, 1, 1, 1, 1,
1.258203, 0.646376, 0.1753333, 1, 1, 1, 1, 1,
1.260176, 0.8715348, -0.2390042, 1, 1, 1, 1, 1,
1.260686, -0.2787988, 1.375561, 1, 1, 1, 1, 1,
1.267442, 0.578141, 1.032849, 1, 1, 1, 1, 1,
1.270914, 1.720977, 1.067363, 0, 0, 1, 1, 1,
1.277314, -0.7301685, 2.994511, 1, 0, 0, 1, 1,
1.285472, -0.9097396, 2.750443, 1, 0, 0, 1, 1,
1.292346, -0.1604921, 1.57382, 1, 0, 0, 1, 1,
1.294128, 0.4483726, 0.941007, 1, 0, 0, 1, 1,
1.301233, -1.671344, 1.368766, 1, 0, 0, 1, 1,
1.306304, 0.1416673, 0.3876384, 0, 0, 0, 1, 1,
1.311239, 0.8352193, 0.3691694, 0, 0, 0, 1, 1,
1.324014, 0.9765384, -0.05363802, 0, 0, 0, 1, 1,
1.324683, -0.8231609, 2.544903, 0, 0, 0, 1, 1,
1.324799, 0.2982226, 1.758024, 0, 0, 0, 1, 1,
1.327605, -1.244699, 3.176175, 0, 0, 0, 1, 1,
1.332923, -0.9098784, 2.591528, 0, 0, 0, 1, 1,
1.333678, 0.5413103, 2.254594, 1, 1, 1, 1, 1,
1.335459, -0.0002335686, 2.714603, 1, 1, 1, 1, 1,
1.336644, -0.2640995, 1.715564, 1, 1, 1, 1, 1,
1.337041, 0.1335841, 1.046686, 1, 1, 1, 1, 1,
1.338081, 0.456572, -0.706077, 1, 1, 1, 1, 1,
1.340575, 0.3254558, -0.1311601, 1, 1, 1, 1, 1,
1.341887, -0.1167498, 1.325777, 1, 1, 1, 1, 1,
1.346916, -0.2606117, 0.8920633, 1, 1, 1, 1, 1,
1.350222, -0.8791555, 1.188821, 1, 1, 1, 1, 1,
1.352278, 0.5182323, -0.5062676, 1, 1, 1, 1, 1,
1.353532, -0.1503599, 0.6761546, 1, 1, 1, 1, 1,
1.355937, 0.837962, 1.828643, 1, 1, 1, 1, 1,
1.363395, -0.256561, 1.806687, 1, 1, 1, 1, 1,
1.364312, 0.8788557, 1.45592, 1, 1, 1, 1, 1,
1.369102, 1.289818, 2.000368, 1, 1, 1, 1, 1,
1.376218, 0.7290762, -0.2599603, 0, 0, 1, 1, 1,
1.382145, -0.3663709, 0.8968592, 1, 0, 0, 1, 1,
1.386858, -1.229151, 2.780531, 1, 0, 0, 1, 1,
1.388548, -1.860288, 3.839144, 1, 0, 0, 1, 1,
1.399396, -0.6393673, 1.07869, 1, 0, 0, 1, 1,
1.404304, -0.3376371, 3.18339, 1, 0, 0, 1, 1,
1.420351, 0.3024572, 2.043212, 0, 0, 0, 1, 1,
1.426652, 1.728555, 1.921058, 0, 0, 0, 1, 1,
1.428726, 1.104943, 2.848592, 0, 0, 0, 1, 1,
1.431512, 0.9998631, 1.921979, 0, 0, 0, 1, 1,
1.437128, -0.293387, 3.45256, 0, 0, 0, 1, 1,
1.455898, 1.212719, 0.4011048, 0, 0, 0, 1, 1,
1.471742, -2.273839, 0.7186615, 0, 0, 0, 1, 1,
1.477755, -1.664782, 1.437372, 1, 1, 1, 1, 1,
1.478031, 0.5410754, 1.672205, 1, 1, 1, 1, 1,
1.485889, 1.674888, 0.8508683, 1, 1, 1, 1, 1,
1.509337, 0.718564, 1.31737, 1, 1, 1, 1, 1,
1.518384, -0.8762063, 2.738899, 1, 1, 1, 1, 1,
1.525367, -0.4404069, 1.332104, 1, 1, 1, 1, 1,
1.527513, -1.462265, 1.492915, 1, 1, 1, 1, 1,
1.528737, 0.2466443, 1.984187, 1, 1, 1, 1, 1,
1.53311, 0.3450945, 2.648954, 1, 1, 1, 1, 1,
1.560078, 0.1297822, 1.979355, 1, 1, 1, 1, 1,
1.56818, -1.064894, 4.251395, 1, 1, 1, 1, 1,
1.574451, -0.2850702, 2.744188, 1, 1, 1, 1, 1,
1.601848, -0.4124023, 0.5342644, 1, 1, 1, 1, 1,
1.602437, -1.213918, 1.418573, 1, 1, 1, 1, 1,
1.604747, 1.221395, -0.7163928, 1, 1, 1, 1, 1,
1.605529, 1.371962, -0.1421048, 0, 0, 1, 1, 1,
1.623792, -0.7318394, 2.182428, 1, 0, 0, 1, 1,
1.635008, 0.2667896, 3.654132, 1, 0, 0, 1, 1,
1.638782, 1.544535, 2.426177, 1, 0, 0, 1, 1,
1.680223, 0.24585, 1.653328, 1, 0, 0, 1, 1,
1.683284, 0.1923118, -1.175602, 1, 0, 0, 1, 1,
1.687071, 0.6844813, 0.3973416, 0, 0, 0, 1, 1,
1.696407, -0.3536195, 1.778908, 0, 0, 0, 1, 1,
1.719439, -1.600846, 3.472437, 0, 0, 0, 1, 1,
1.721138, -0.3946855, 1.385173, 0, 0, 0, 1, 1,
1.72351, 0.7856166, 0.771352, 0, 0, 0, 1, 1,
1.725145, 0.4789208, 1.246838, 0, 0, 0, 1, 1,
1.737199, -0.07339116, 0.359314, 0, 0, 0, 1, 1,
1.746971, -0.0257183, 0.1362787, 1, 1, 1, 1, 1,
1.749046, -0.3388764, 2.26767, 1, 1, 1, 1, 1,
1.768926, 0.8308498, 1.795984, 1, 1, 1, 1, 1,
1.770909, 2.517916, 0.4514211, 1, 1, 1, 1, 1,
1.779611, -2.457432, 2.726748, 1, 1, 1, 1, 1,
1.786346, -0.3577411, 2.803074, 1, 1, 1, 1, 1,
1.788524, -1.86951, 1.33637, 1, 1, 1, 1, 1,
1.794024, 0.9823011, 0.1433832, 1, 1, 1, 1, 1,
1.811716, -0.346517, 1.152459, 1, 1, 1, 1, 1,
1.818597, -0.06946062, 1.403868, 1, 1, 1, 1, 1,
1.818682, 0.0202939, 0.9292738, 1, 1, 1, 1, 1,
1.822371, -1.480206, 4.954392, 1, 1, 1, 1, 1,
1.822628, -0.06261908, 0.5727599, 1, 1, 1, 1, 1,
1.847343, -0.4235439, 0.2444122, 1, 1, 1, 1, 1,
1.854178, -1.86052, 3.559889, 1, 1, 1, 1, 1,
1.884467, 2.126156, 0.1879794, 0, 0, 1, 1, 1,
1.941933, 2.153301, 1.165941, 1, 0, 0, 1, 1,
1.973933, -0.07705959, 2.496549, 1, 0, 0, 1, 1,
1.973985, -0.6101652, 1.095103, 1, 0, 0, 1, 1,
1.982627, 0.00272944, 3.026906, 1, 0, 0, 1, 1,
1.983331, 0.03653958, 2.929987, 1, 0, 0, 1, 1,
2.034449, -1.101799, 1.005363, 0, 0, 0, 1, 1,
2.037644, 0.8831744, 2.099366, 0, 0, 0, 1, 1,
2.054529, 1.423547, 0.8639157, 0, 0, 0, 1, 1,
2.068475, -0.09703197, 1.275502, 0, 0, 0, 1, 1,
2.150431, -0.4415538, 2.085655, 0, 0, 0, 1, 1,
2.182797, 0.02361405, 0.7653474, 0, 0, 0, 1, 1,
2.259649, -0.6703956, 0.8347894, 0, 0, 0, 1, 1,
2.407364, -1.534017, 1.675321, 1, 1, 1, 1, 1,
2.429403, 0.4015118, 3.26478, 1, 1, 1, 1, 1,
2.512188, 2.627716, 1.989903, 1, 1, 1, 1, 1,
2.569382, 1.872337, 2.454283, 1, 1, 1, 1, 1,
2.851177, -1.664922, 3.445485, 1, 1, 1, 1, 1,
3.25267, 0.2501548, -0.5881058, 1, 1, 1, 1, 1,
3.376482, -0.2387056, -0.01256366, 1, 1, 1, 1, 1
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
var radius = 10.14146;
var distance = 35.62145;
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
mvMatrix.translate( -0.05385542, 0.4935305, 0.2073927 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.62145);
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
