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
-3.292613, -1.302046, -0.913734, 1, 0, 0, 1,
-2.745018, 0.4375822, -1.800275, 1, 0.007843138, 0, 1,
-2.653806, -0.6148768, -2.378572, 1, 0.01176471, 0, 1,
-2.613494, 0.1910618, -2.540032, 1, 0.01960784, 0, 1,
-2.612422, -0.05093281, -2.122335, 1, 0.02352941, 0, 1,
-2.54669, 0.7464669, -2.490878, 1, 0.03137255, 0, 1,
-2.542388, -0.592692, -0.4719373, 1, 0.03529412, 0, 1,
-2.522967, 0.2880755, -2.81755, 1, 0.04313726, 0, 1,
-2.512762, 0.5194073, -1.136399, 1, 0.04705882, 0, 1,
-2.493257, 2.083029, -0.6798328, 1, 0.05490196, 0, 1,
-2.422485, -1.031367, -0.06208571, 1, 0.05882353, 0, 1,
-2.392601, -1.752237, -3.032825, 1, 0.06666667, 0, 1,
-2.379755, 0.297515, -0.05359093, 1, 0.07058824, 0, 1,
-2.360241, 1.53589, -1.193351, 1, 0.07843138, 0, 1,
-2.311662, 0.02508342, -1.032868, 1, 0.08235294, 0, 1,
-2.272533, -0.1829237, -4.411059, 1, 0.09019608, 0, 1,
-2.155982, -0.2337758, -0.8268638, 1, 0.09411765, 0, 1,
-2.121874, 0.2126807, -2.035497, 1, 0.1019608, 0, 1,
-2.086861, 1.476985, -1.48799, 1, 0.1098039, 0, 1,
-2.086038, 0.5354369, -1.168154, 1, 0.1137255, 0, 1,
-2.044709, -1.314403, -1.644341, 1, 0.1215686, 0, 1,
-1.994959, -1.367758, -1.38193, 1, 0.1254902, 0, 1,
-1.992314, 1.678323, -1.926043, 1, 0.1333333, 0, 1,
-1.961294, -0.2642042, -1.001662, 1, 0.1372549, 0, 1,
-1.939286, -0.9780112, -2.269325, 1, 0.145098, 0, 1,
-1.936876, 1.549548, -1.996887, 1, 0.1490196, 0, 1,
-1.884739, 0.1574554, -2.119119, 1, 0.1568628, 0, 1,
-1.871393, -0.7759893, -1.364726, 1, 0.1607843, 0, 1,
-1.855444, 0.3071751, -3.450087, 1, 0.1686275, 0, 1,
-1.837801, 0.4089758, -1.168839, 1, 0.172549, 0, 1,
-1.822343, -0.2828274, -0.6043956, 1, 0.1803922, 0, 1,
-1.818437, 1.266567, -0.38281, 1, 0.1843137, 0, 1,
-1.816878, 0.2897086, -3.680684, 1, 0.1921569, 0, 1,
-1.812225, 0.01215864, -1.970082, 1, 0.1960784, 0, 1,
-1.809939, -1.004396, -2.375189, 1, 0.2039216, 0, 1,
-1.803551, -0.4570002, -0.3200645, 1, 0.2117647, 0, 1,
-1.785879, 0.6346834, -1.767936, 1, 0.2156863, 0, 1,
-1.766787, 1.016077, 0.08204492, 1, 0.2235294, 0, 1,
-1.766453, -2.045601, -1.515363, 1, 0.227451, 0, 1,
-1.742501, 0.3857735, -2.426657, 1, 0.2352941, 0, 1,
-1.739198, -1.230388, -2.150685, 1, 0.2392157, 0, 1,
-1.720021, 0.65843, -1.482432, 1, 0.2470588, 0, 1,
-1.71185, -0.418733, -2.222181, 1, 0.2509804, 0, 1,
-1.697981, 1.097153, -0.2230299, 1, 0.2588235, 0, 1,
-1.677036, -0.5813875, -3.154904, 1, 0.2627451, 0, 1,
-1.671681, -1.638268, -1.857726, 1, 0.2705882, 0, 1,
-1.619083, 0.6632133, -1.28246, 1, 0.2745098, 0, 1,
-1.605604, 0.01792611, -0.7616668, 1, 0.282353, 0, 1,
-1.604742, -0.4473795, -0.3651806, 1, 0.2862745, 0, 1,
-1.593855, -0.6621314, -3.438055, 1, 0.2941177, 0, 1,
-1.593483, 0.3881633, -1.720042, 1, 0.3019608, 0, 1,
-1.583469, -0.9804658, -1.79321, 1, 0.3058824, 0, 1,
-1.565418, 0.5544005, -1.438511, 1, 0.3137255, 0, 1,
-1.559073, -0.9175222, -3.507767, 1, 0.3176471, 0, 1,
-1.558353, -0.1437427, -3.328975, 1, 0.3254902, 0, 1,
-1.558196, 0.1318043, -1.898102, 1, 0.3294118, 0, 1,
-1.551399, 0.6248628, -1.517403, 1, 0.3372549, 0, 1,
-1.549998, 1.231992, -1.338802, 1, 0.3411765, 0, 1,
-1.541142, 0.01923058, -2.330613, 1, 0.3490196, 0, 1,
-1.537224, -0.2786146, -0.3153044, 1, 0.3529412, 0, 1,
-1.530612, -1.723648, -2.988423, 1, 0.3607843, 0, 1,
-1.515993, 0.5290437, -1.225566, 1, 0.3647059, 0, 1,
-1.510565, -0.2493228, -1.905724, 1, 0.372549, 0, 1,
-1.509838, -1.478873, -4.914574, 1, 0.3764706, 0, 1,
-1.509826, 1.244617, -0.9526587, 1, 0.3843137, 0, 1,
-1.509712, 0.4963408, -0.1742307, 1, 0.3882353, 0, 1,
-1.502997, 0.2006092, -1.541021, 1, 0.3960784, 0, 1,
-1.5022, 1.604967, -1.412006, 1, 0.4039216, 0, 1,
-1.498386, 0.8387655, -2.60333, 1, 0.4078431, 0, 1,
-1.48446, -1.893846, -3.642452, 1, 0.4156863, 0, 1,
-1.48124, 0.1601897, -3.452211, 1, 0.4196078, 0, 1,
-1.471552, -0.3873819, -2.078097, 1, 0.427451, 0, 1,
-1.470377, 0.5708443, -1.177463, 1, 0.4313726, 0, 1,
-1.445666, 1.569785, -1.208494, 1, 0.4392157, 0, 1,
-1.442552, 0.2479797, -1.333741, 1, 0.4431373, 0, 1,
-1.422031, -1.785995, -2.11213, 1, 0.4509804, 0, 1,
-1.420242, 0.05266967, -1.216697, 1, 0.454902, 0, 1,
-1.400787, 0.7123242, -0.8488553, 1, 0.4627451, 0, 1,
-1.398009, 0.1137944, -1.744655, 1, 0.4666667, 0, 1,
-1.395086, -1.406944, -0.3492486, 1, 0.4745098, 0, 1,
-1.393589, 0.3718941, -0.7562758, 1, 0.4784314, 0, 1,
-1.382121, -0.7373516, -1.593635, 1, 0.4862745, 0, 1,
-1.374875, -0.2695787, -0.357641, 1, 0.4901961, 0, 1,
-1.367237, -0.3707604, -2.406073, 1, 0.4980392, 0, 1,
-1.356906, 0.0960379, -1.218733, 1, 0.5058824, 0, 1,
-1.349612, 1.43562, -0.5219678, 1, 0.509804, 0, 1,
-1.337911, -0.1418996, -1.853955, 1, 0.5176471, 0, 1,
-1.337871, -1.472921, -1.972279, 1, 0.5215687, 0, 1,
-1.326924, -1.733911, -3.03897, 1, 0.5294118, 0, 1,
-1.318683, -0.2073283, -1.906364, 1, 0.5333334, 0, 1,
-1.31762, 2.315055, -0.1799105, 1, 0.5411765, 0, 1,
-1.313521, -0.3394795, -0.4686338, 1, 0.5450981, 0, 1,
-1.297652, 0.4524685, -2.273755, 1, 0.5529412, 0, 1,
-1.297461, 0.8849085, -1.401404, 1, 0.5568628, 0, 1,
-1.290483, 0.636106, -3.629913, 1, 0.5647059, 0, 1,
-1.287217, 0.5277974, -1.734932, 1, 0.5686275, 0, 1,
-1.283474, 0.1143116, -0.2234404, 1, 0.5764706, 0, 1,
-1.278798, 0.772576, 0.4126539, 1, 0.5803922, 0, 1,
-1.249377, -0.553606, -2.087536, 1, 0.5882353, 0, 1,
-1.248521, 0.2521892, -0.8570037, 1, 0.5921569, 0, 1,
-1.247737, 1.542949, -2.090062, 1, 0.6, 0, 1,
-1.243865, -0.7298668, -1.176974, 1, 0.6078432, 0, 1,
-1.243427, 0.215476, -0.5337319, 1, 0.6117647, 0, 1,
-1.239448, 1.230138, -0.9556244, 1, 0.6196079, 0, 1,
-1.237941, -0.4638704, -1.116277, 1, 0.6235294, 0, 1,
-1.235199, -0.00766824, -2.19231, 1, 0.6313726, 0, 1,
-1.223284, 0.2262888, -0.914473, 1, 0.6352941, 0, 1,
-1.21016, 0.3807957, -1.611266, 1, 0.6431373, 0, 1,
-1.195735, -0.383932, -1.686001, 1, 0.6470588, 0, 1,
-1.195551, -2.126884, -1.844687, 1, 0.654902, 0, 1,
-1.176756, -0.8945182, -1.685962, 1, 0.6588235, 0, 1,
-1.166908, -0.8785375, -3.315519, 1, 0.6666667, 0, 1,
-1.162435, 0.6654263, -1.203318, 1, 0.6705883, 0, 1,
-1.161911, -1.470171, -1.753773, 1, 0.6784314, 0, 1,
-1.160042, 0.01900507, -2.535542, 1, 0.682353, 0, 1,
-1.150767, -0.5202528, -3.107828, 1, 0.6901961, 0, 1,
-1.146483, 0.5096502, 0.1888713, 1, 0.6941177, 0, 1,
-1.141824, 0.2001614, -0.637392, 1, 0.7019608, 0, 1,
-1.141771, -1.426352, -1.912141, 1, 0.7098039, 0, 1,
-1.140178, 0.3160086, -2.441254, 1, 0.7137255, 0, 1,
-1.132861, 0.6350737, -1.991975, 1, 0.7215686, 0, 1,
-1.132562, -0.839256, -0.7564362, 1, 0.7254902, 0, 1,
-1.131052, -0.2243661, -2.983768, 1, 0.7333333, 0, 1,
-1.129957, -1.499397, -2.448022, 1, 0.7372549, 0, 1,
-1.128332, -0.8243021, -1.984269, 1, 0.7450981, 0, 1,
-1.126605, 0.03000989, -0.4542389, 1, 0.7490196, 0, 1,
-1.125805, -0.2453008, -3.135561, 1, 0.7568628, 0, 1,
-1.120158, 1.135274, -1.284368, 1, 0.7607843, 0, 1,
-1.114678, -1.528578, -4.469892, 1, 0.7686275, 0, 1,
-1.110767, -0.9832347, -3.271778, 1, 0.772549, 0, 1,
-1.109173, -0.8959369, -2.622797, 1, 0.7803922, 0, 1,
-1.095183, -1.811806, -2.680682, 1, 0.7843137, 0, 1,
-1.090822, 0.0008408899, -0.6168161, 1, 0.7921569, 0, 1,
-1.083289, -0.7081056, -2.677646, 1, 0.7960784, 0, 1,
-1.07838, -0.1813393, -1.659946, 1, 0.8039216, 0, 1,
-1.067791, 0.05938475, -0.8656324, 1, 0.8117647, 0, 1,
-1.064864, 0.8608956, -2.096373, 1, 0.8156863, 0, 1,
-1.058505, -0.01174079, -2.298629, 1, 0.8235294, 0, 1,
-1.046978, -0.7599064, -1.732836, 1, 0.827451, 0, 1,
-1.044795, -0.6354554, -3.611834, 1, 0.8352941, 0, 1,
-1.044421, 1.225738, -1.574455, 1, 0.8392157, 0, 1,
-1.044217, 1.064046, 0.2133675, 1, 0.8470588, 0, 1,
-1.04121, -0.4762183, -2.650417, 1, 0.8509804, 0, 1,
-1.027084, 1.166346, -0.5318304, 1, 0.8588235, 0, 1,
-1.016375, -0.6192341, -2.719153, 1, 0.8627451, 0, 1,
-1.009513, -1.826432, -3.291842, 1, 0.8705882, 0, 1,
-1.008253, -0.5015691, -1.381747, 1, 0.8745098, 0, 1,
-1.00686, 0.7992269, -1.666036, 1, 0.8823529, 0, 1,
-0.9999968, -0.07115401, -2.407243, 1, 0.8862745, 0, 1,
-0.9868895, -1.619014, -1.38801, 1, 0.8941177, 0, 1,
-0.9865157, 1.986421, 1.762287, 1, 0.8980392, 0, 1,
-0.9800074, -0.1240322, -2.264936, 1, 0.9058824, 0, 1,
-0.9754436, -0.44387, -2.209405, 1, 0.9137255, 0, 1,
-0.962725, 0.82655, 0.04344896, 1, 0.9176471, 0, 1,
-0.961237, -1.034075, -1.512563, 1, 0.9254902, 0, 1,
-0.9562821, 0.5027971, -1.461229, 1, 0.9294118, 0, 1,
-0.9545218, -0.1716383, -1.666408, 1, 0.9372549, 0, 1,
-0.9540758, -0.2804261, -1.137607, 1, 0.9411765, 0, 1,
-0.9510624, 0.7450551, -0.07646577, 1, 0.9490196, 0, 1,
-0.9472401, -0.5237753, -3.423215, 1, 0.9529412, 0, 1,
-0.9374738, 1.090738, -1.869759, 1, 0.9607843, 0, 1,
-0.9364989, 0.06738596, -0.8929179, 1, 0.9647059, 0, 1,
-0.9338285, -0.07193947, -1.358078, 1, 0.972549, 0, 1,
-0.9314409, -0.1526555, -2.241596, 1, 0.9764706, 0, 1,
-0.9298831, 0.2382636, -1.753413, 1, 0.9843137, 0, 1,
-0.9245547, -0.549189, -3.322206, 1, 0.9882353, 0, 1,
-0.9230936, 1.536305, 1.358622, 1, 0.9960784, 0, 1,
-0.9196979, -0.3714085, -1.761586, 0.9960784, 1, 0, 1,
-0.915934, -1.039474, -1.258698, 0.9921569, 1, 0, 1,
-0.9123179, -0.4198852, -2.634718, 0.9843137, 1, 0, 1,
-0.9031053, -0.2495984, -1.659111, 0.9803922, 1, 0, 1,
-0.9023341, 0.4460578, -0.3539346, 0.972549, 1, 0, 1,
-0.9000185, -0.1744387, -2.52671, 0.9686275, 1, 0, 1,
-0.8965256, -2.051393, -1.585663, 0.9607843, 1, 0, 1,
-0.8945746, -0.6766146, -2.280739, 0.9568627, 1, 0, 1,
-0.8913741, 1.009933, -1.434691, 0.9490196, 1, 0, 1,
-0.8896203, 0.4817179, 0.01288244, 0.945098, 1, 0, 1,
-0.885406, -0.01997608, -2.706457, 0.9372549, 1, 0, 1,
-0.8837879, 0.9975958, -0.4198563, 0.9333333, 1, 0, 1,
-0.8836578, -0.7113857, -2.156595, 0.9254902, 1, 0, 1,
-0.8754212, 0.2051858, -2.861653, 0.9215686, 1, 0, 1,
-0.872173, -0.8548831, -1.708624, 0.9137255, 1, 0, 1,
-0.8657705, 1.291903, -1.845699, 0.9098039, 1, 0, 1,
-0.8596612, 0.2192171, -2.374256, 0.9019608, 1, 0, 1,
-0.8585908, -0.6808696, -1.399773, 0.8941177, 1, 0, 1,
-0.8578113, 0.6384156, 1.648899, 0.8901961, 1, 0, 1,
-0.8573022, -0.5579335, -2.961063, 0.8823529, 1, 0, 1,
-0.8571154, -0.9241568, -2.746942, 0.8784314, 1, 0, 1,
-0.8495964, -0.3831818, -1.898259, 0.8705882, 1, 0, 1,
-0.8471953, 0.09441962, -0.392837, 0.8666667, 1, 0, 1,
-0.8471049, -1.849721, -1.586501, 0.8588235, 1, 0, 1,
-0.8391353, -0.3718613, -1.902479, 0.854902, 1, 0, 1,
-0.8366024, -0.4016178, -3.310702, 0.8470588, 1, 0, 1,
-0.8336868, 1.535187, 0.5083376, 0.8431373, 1, 0, 1,
-0.8305597, -1.133785, -1.892654, 0.8352941, 1, 0, 1,
-0.8246939, 0.1907521, -1.330579, 0.8313726, 1, 0, 1,
-0.8227649, -0.2748674, -1.787268, 0.8235294, 1, 0, 1,
-0.8125138, -0.4684841, -2.808004, 0.8196079, 1, 0, 1,
-0.8061321, 0.3552906, -2.016554, 0.8117647, 1, 0, 1,
-0.7971836, -1.305275, -2.072057, 0.8078431, 1, 0, 1,
-0.7968729, 1.125033, -1.06249, 0.8, 1, 0, 1,
-0.7843209, 0.4039988, -2.473194, 0.7921569, 1, 0, 1,
-0.7791008, -1.893129, -2.437919, 0.7882353, 1, 0, 1,
-0.778856, -0.6578059, -3.729007, 0.7803922, 1, 0, 1,
-0.7769857, 1.165143, -0.5526253, 0.7764706, 1, 0, 1,
-0.7733763, 0.3987665, -1.622605, 0.7686275, 1, 0, 1,
-0.7714587, 0.7583247, -1.400431, 0.7647059, 1, 0, 1,
-0.7706867, -0.5771964, -2.001936, 0.7568628, 1, 0, 1,
-0.7704913, 1.512765, -0.9578751, 0.7529412, 1, 0, 1,
-0.7704032, 0.5374181, -1.764611, 0.7450981, 1, 0, 1,
-0.7694995, 0.7817847, -2.393322, 0.7411765, 1, 0, 1,
-0.7668093, 0.4199151, -1.653362, 0.7333333, 1, 0, 1,
-0.7624572, 0.9142932, -0.4775452, 0.7294118, 1, 0, 1,
-0.7605889, 0.2147334, -1.420693, 0.7215686, 1, 0, 1,
-0.7596558, 0.07189126, -1.842247, 0.7176471, 1, 0, 1,
-0.748872, 0.9169729, 0.7973745, 0.7098039, 1, 0, 1,
-0.7416092, -0.5577397, -1.99305, 0.7058824, 1, 0, 1,
-0.7405232, -0.5573091, -2.65579, 0.6980392, 1, 0, 1,
-0.7399896, 0.5869291, 0.162768, 0.6901961, 1, 0, 1,
-0.7394202, -0.1322712, -2.145474, 0.6862745, 1, 0, 1,
-0.7388176, -1.230482, -2.841454, 0.6784314, 1, 0, 1,
-0.7339345, 0.5998041, -0.6524876, 0.6745098, 1, 0, 1,
-0.7243705, -0.1770837, -0.2840528, 0.6666667, 1, 0, 1,
-0.7235057, -0.7510805, -1.818753, 0.6627451, 1, 0, 1,
-0.7157359, 1.406898, 1.215883, 0.654902, 1, 0, 1,
-0.7133613, -1.633125, -1.728047, 0.6509804, 1, 0, 1,
-0.7131358, 0.3632804, -0.008234074, 0.6431373, 1, 0, 1,
-0.7077686, 0.7544476, 0.6307038, 0.6392157, 1, 0, 1,
-0.7015141, 0.8931157, -0.5337053, 0.6313726, 1, 0, 1,
-0.7009269, -0.7197573, -2.072698, 0.627451, 1, 0, 1,
-0.6981781, -0.03914867, -1.913856, 0.6196079, 1, 0, 1,
-0.683161, -0.00791596, -1.695058, 0.6156863, 1, 0, 1,
-0.6809445, -0.03887096, 0.5723507, 0.6078432, 1, 0, 1,
-0.6743733, 0.3643193, -1.582517, 0.6039216, 1, 0, 1,
-0.6742632, 1.733457, -0.5777369, 0.5960785, 1, 0, 1,
-0.672202, 0.7727669, 0.2150232, 0.5882353, 1, 0, 1,
-0.6720474, 1.171202, 0.3857377, 0.5843138, 1, 0, 1,
-0.6718137, 0.9455245, -0.8602879, 0.5764706, 1, 0, 1,
-0.6697245, 0.4449973, 1.817519, 0.572549, 1, 0, 1,
-0.6659996, -1.148313, -2.894378, 0.5647059, 1, 0, 1,
-0.6652828, 1.0402, -0.7527149, 0.5607843, 1, 0, 1,
-0.6636665, -0.5571929, -0.8324314, 0.5529412, 1, 0, 1,
-0.6620548, -0.5983873, -2.977214, 0.5490196, 1, 0, 1,
-0.6572834, -1.664582, -2.710588, 0.5411765, 1, 0, 1,
-0.6560881, 1.975531, -0.4629711, 0.5372549, 1, 0, 1,
-0.6526386, 0.3301681, -0.7346905, 0.5294118, 1, 0, 1,
-0.6521659, -1.260309, -2.677749, 0.5254902, 1, 0, 1,
-0.6515812, -1.855418, -2.502843, 0.5176471, 1, 0, 1,
-0.6496192, 2.245839, 1.088606, 0.5137255, 1, 0, 1,
-0.646975, -0.01976769, -1.987635, 0.5058824, 1, 0, 1,
-0.6440369, 0.177338, -0.7050965, 0.5019608, 1, 0, 1,
-0.6409623, -0.05238676, -2.533683, 0.4941176, 1, 0, 1,
-0.6399594, 0.6418858, -1.03083, 0.4862745, 1, 0, 1,
-0.6366653, -0.02592192, -2.207408, 0.4823529, 1, 0, 1,
-0.6365773, -1.586571, -4.440567, 0.4745098, 1, 0, 1,
-0.6313426, -1.189894, -3.424065, 0.4705882, 1, 0, 1,
-0.6313248, -1.072619, -1.185472, 0.4627451, 1, 0, 1,
-0.6227266, 0.04974898, -0.341283, 0.4588235, 1, 0, 1,
-0.6225737, -0.9481445, -1.894135, 0.4509804, 1, 0, 1,
-0.6114736, -1.699923, -3.525696, 0.4470588, 1, 0, 1,
-0.6105502, 0.2708351, -1.829927, 0.4392157, 1, 0, 1,
-0.6097259, 0.210765, -1.857603, 0.4352941, 1, 0, 1,
-0.6017554, 0.2111669, -0.8004386, 0.427451, 1, 0, 1,
-0.6013924, 0.3976909, -1.201789, 0.4235294, 1, 0, 1,
-0.6007608, 0.185851, -1.833797, 0.4156863, 1, 0, 1,
-0.5932107, 0.5185572, -0.9679388, 0.4117647, 1, 0, 1,
-0.5879408, -0.0816837, -0.1929675, 0.4039216, 1, 0, 1,
-0.5860645, -0.5273066, -1.82138, 0.3960784, 1, 0, 1,
-0.5856202, 1.075028, -2.121464, 0.3921569, 1, 0, 1,
-0.5850984, 1.080052, -2.210905, 0.3843137, 1, 0, 1,
-0.5818164, 0.7042934, 0.8076631, 0.3803922, 1, 0, 1,
-0.5812148, -1.176961, -3.42076, 0.372549, 1, 0, 1,
-0.5795143, 1.314029, 0.0003253966, 0.3686275, 1, 0, 1,
-0.5765688, -1.414124, -0.6523694, 0.3607843, 1, 0, 1,
-0.5744627, -0.6352915, -2.418694, 0.3568628, 1, 0, 1,
-0.5686317, 1.740554, -2.030645, 0.3490196, 1, 0, 1,
-0.5654913, -0.4427153, -2.475932, 0.345098, 1, 0, 1,
-0.5641923, -0.03513364, -3.769542, 0.3372549, 1, 0, 1,
-0.5616801, -0.4065341, -0.7853472, 0.3333333, 1, 0, 1,
-0.5583327, 0.3118236, -1.278767, 0.3254902, 1, 0, 1,
-0.5539323, 0.1039677, -0.1880835, 0.3215686, 1, 0, 1,
-0.5535101, -0.6503118, -3.170393, 0.3137255, 1, 0, 1,
-0.553427, -1.175365, -1.848244, 0.3098039, 1, 0, 1,
-0.5512197, -0.3099221, -1.691493, 0.3019608, 1, 0, 1,
-0.5506068, 0.8663051, 0.0783536, 0.2941177, 1, 0, 1,
-0.5446228, 1.614405, -0.8701543, 0.2901961, 1, 0, 1,
-0.5393533, 0.1130697, -1.246999, 0.282353, 1, 0, 1,
-0.5365947, -0.6483565, -3.606721, 0.2784314, 1, 0, 1,
-0.5352293, -0.2233672, -1.017095, 0.2705882, 1, 0, 1,
-0.5336997, 0.2490963, -0.1754563, 0.2666667, 1, 0, 1,
-0.5294876, 0.03766347, -1.083474, 0.2588235, 1, 0, 1,
-0.5288171, 0.4927572, 0.1069319, 0.254902, 1, 0, 1,
-0.5251673, 0.1318337, 0.7622199, 0.2470588, 1, 0, 1,
-0.5140471, 0.9775265, -0.6613207, 0.2431373, 1, 0, 1,
-0.5132723, 0.1890504, -2.666689, 0.2352941, 1, 0, 1,
-0.5080699, -0.4807999, -2.886932, 0.2313726, 1, 0, 1,
-0.5064809, -0.7174147, -2.82921, 0.2235294, 1, 0, 1,
-0.5064359, -0.6520169, -2.712597, 0.2196078, 1, 0, 1,
-0.5054159, 0.04996223, -1.6957, 0.2117647, 1, 0, 1,
-0.5038434, -1.654364, -3.121612, 0.2078431, 1, 0, 1,
-0.5032911, -0.8974429, -2.262476, 0.2, 1, 0, 1,
-0.5017029, -0.1179905, -0.8993196, 0.1921569, 1, 0, 1,
-0.501153, 1.614064, -0.7087554, 0.1882353, 1, 0, 1,
-0.4977854, -1.527052, -2.480005, 0.1803922, 1, 0, 1,
-0.4951008, -0.7082714, -1.315591, 0.1764706, 1, 0, 1,
-0.4941582, -0.09954952, -3.890167, 0.1686275, 1, 0, 1,
-0.4896506, -1.578793, -1.741274, 0.1647059, 1, 0, 1,
-0.4863774, -2.262348, -4.379328, 0.1568628, 1, 0, 1,
-0.4758208, -1.412054, -4.060207, 0.1529412, 1, 0, 1,
-0.4738776, -0.3019385, -3.260478, 0.145098, 1, 0, 1,
-0.471352, -0.2011869, -2.361601, 0.1411765, 1, 0, 1,
-0.4713144, -0.4688226, -2.044909, 0.1333333, 1, 0, 1,
-0.4707828, -0.9252974, -3.44689, 0.1294118, 1, 0, 1,
-0.4691886, 0.04408241, 1.029309, 0.1215686, 1, 0, 1,
-0.4670571, 0.4754871, -2.738358, 0.1176471, 1, 0, 1,
-0.4611698, -0.001396813, -1.753335, 0.1098039, 1, 0, 1,
-0.4605673, -0.6195703, -2.089235, 0.1058824, 1, 0, 1,
-0.4603854, 2.04798, 0.6261001, 0.09803922, 1, 0, 1,
-0.4583978, -2.359728, -3.418044, 0.09019608, 1, 0, 1,
-0.4506386, 0.5178096, -2.159707, 0.08627451, 1, 0, 1,
-0.4380867, 0.1910912, -1.309271, 0.07843138, 1, 0, 1,
-0.4351524, -1.720544, -2.610019, 0.07450981, 1, 0, 1,
-0.4327056, -0.3424803, -3.271656, 0.06666667, 1, 0, 1,
-0.4261396, -0.3606758, -1.733559, 0.0627451, 1, 0, 1,
-0.4186405, -0.09002531, -2.376536, 0.05490196, 1, 0, 1,
-0.4184351, -0.4444085, -2.623608, 0.05098039, 1, 0, 1,
-0.4165987, 0.7404035, -0.6240878, 0.04313726, 1, 0, 1,
-0.4163059, -0.6055704, -2.859388, 0.03921569, 1, 0, 1,
-0.4146188, -0.3871483, -1.482145, 0.03137255, 1, 0, 1,
-0.4139957, 0.7107138, 0.07440166, 0.02745098, 1, 0, 1,
-0.4138063, 2.546658, -0.9380209, 0.01960784, 1, 0, 1,
-0.4083763, -1.540823, -2.892753, 0.01568628, 1, 0, 1,
-0.4064515, -1.579023, -3.205102, 0.007843138, 1, 0, 1,
-0.4039482, 1.35112, 0.4935506, 0.003921569, 1, 0, 1,
-0.4013653, -1.762875, -3.813407, 0, 1, 0.003921569, 1,
-0.401131, -0.391275, -1.744409, 0, 1, 0.01176471, 1,
-0.3992746, 0.7716417, -0.07394738, 0, 1, 0.01568628, 1,
-0.397624, -0.06736363, -0.3890345, 0, 1, 0.02352941, 1,
-0.3960527, -0.04608156, -2.071926, 0, 1, 0.02745098, 1,
-0.3941542, 2.630285, 0.1310419, 0, 1, 0.03529412, 1,
-0.3922107, -0.4172771, -1.456049, 0, 1, 0.03921569, 1,
-0.3920324, -1.310292, -3.560106, 0, 1, 0.04705882, 1,
-0.3882885, 1.157318, 0.479671, 0, 1, 0.05098039, 1,
-0.3880537, -0.09811731, -2.249533, 0, 1, 0.05882353, 1,
-0.3853535, -0.7393107, -4.123545, 0, 1, 0.0627451, 1,
-0.3765157, -1.362459, -1.438488, 0, 1, 0.07058824, 1,
-0.3739103, -0.08364397, -2.441087, 0, 1, 0.07450981, 1,
-0.3712978, -1.463057, -2.798624, 0, 1, 0.08235294, 1,
-0.3679703, -0.4526267, -2.484311, 0, 1, 0.08627451, 1,
-0.3679556, -0.6479277, -2.30964, 0, 1, 0.09411765, 1,
-0.3663661, 0.9428287, -1.785418, 0, 1, 0.1019608, 1,
-0.3632989, -0.5134637, -1.120473, 0, 1, 0.1058824, 1,
-0.3585464, 0.8944607, 0.4436023, 0, 1, 0.1137255, 1,
-0.3550789, 0.002263191, -1.34112, 0, 1, 0.1176471, 1,
-0.3516245, 0.8217297, -0.09979963, 0, 1, 0.1254902, 1,
-0.3470564, -0.2626877, -1.646713, 0, 1, 0.1294118, 1,
-0.3453744, -0.4303738, -3.05512, 0, 1, 0.1372549, 1,
-0.3411846, -0.3914156, -2.134598, 0, 1, 0.1411765, 1,
-0.339818, 0.02362702, -4.346832, 0, 1, 0.1490196, 1,
-0.3384493, -0.7523847, -4.312617, 0, 1, 0.1529412, 1,
-0.3329555, 0.6719359, 0.645783, 0, 1, 0.1607843, 1,
-0.3305485, 0.728322, -0.09429441, 0, 1, 0.1647059, 1,
-0.3263854, -2.671223, -4.703655, 0, 1, 0.172549, 1,
-0.3258268, -0.3797792, -1.987335, 0, 1, 0.1764706, 1,
-0.3252574, 0.1956183, -2.02614, 0, 1, 0.1843137, 1,
-0.3251239, 1.308297, -1.607117, 0, 1, 0.1882353, 1,
-0.3219071, -0.3022568, -1.82513, 0, 1, 0.1960784, 1,
-0.3219021, 0.275394, -0.7254199, 0, 1, 0.2039216, 1,
-0.321875, 1.665268, -0.8598948, 0, 1, 0.2078431, 1,
-0.319452, -0.2773674, -1.768902, 0, 1, 0.2156863, 1,
-0.3175423, 0.8746383, -1.060077, 0, 1, 0.2196078, 1,
-0.3131616, -1.375902, -5.123525, 0, 1, 0.227451, 1,
-0.3119179, -0.07737915, -0.3786587, 0, 1, 0.2313726, 1,
-0.3107854, 0.2526799, -2.254893, 0, 1, 0.2392157, 1,
-0.3106237, -0.2665586, -2.769847, 0, 1, 0.2431373, 1,
-0.3076202, 0.2469886, -1.300955, 0, 1, 0.2509804, 1,
-0.3069535, 2.397, -1.158956, 0, 1, 0.254902, 1,
-0.3015293, -1.038232, -1.846584, 0, 1, 0.2627451, 1,
-0.2948655, -1.602743, -2.524207, 0, 1, 0.2666667, 1,
-0.2933554, 0.9196963, 0.6030709, 0, 1, 0.2745098, 1,
-0.2895641, -1.361585, -2.83828, 0, 1, 0.2784314, 1,
-0.2869185, 0.9652144, -0.8632815, 0, 1, 0.2862745, 1,
-0.2863282, -1.985723, -1.999086, 0, 1, 0.2901961, 1,
-0.2854879, -0.6495496, -3.482626, 0, 1, 0.2980392, 1,
-0.2850906, 1.239094, 0.538379, 0, 1, 0.3058824, 1,
-0.2842801, 0.2006745, -0.418244, 0, 1, 0.3098039, 1,
-0.2842318, -0.6570461, -2.770727, 0, 1, 0.3176471, 1,
-0.2838164, 0.008879085, -2.346837, 0, 1, 0.3215686, 1,
-0.2836925, -0.8194101, -4.380792, 0, 1, 0.3294118, 1,
-0.2831192, 1.722541, -0.6109965, 0, 1, 0.3333333, 1,
-0.2803823, 0.3679227, -1.173854, 0, 1, 0.3411765, 1,
-0.2775599, 0.5441501, 0.5974955, 0, 1, 0.345098, 1,
-0.2734837, 0.6097508, 0.8383721, 0, 1, 0.3529412, 1,
-0.2706518, -0.3649025, -2.408332, 0, 1, 0.3568628, 1,
-0.2693267, 0.7272474, -0.04157075, 0, 1, 0.3647059, 1,
-0.2630125, -2.044241, -4.333084, 0, 1, 0.3686275, 1,
-0.2614465, 0.01751331, -1.427083, 0, 1, 0.3764706, 1,
-0.2596802, 0.8337435, 0.9101124, 0, 1, 0.3803922, 1,
-0.2590458, 0.3958074, -0.1761796, 0, 1, 0.3882353, 1,
-0.2587126, 0.3594789, 0.209118, 0, 1, 0.3921569, 1,
-0.2552296, -0.2851976, -1.626756, 0, 1, 0.4, 1,
-0.2530541, -1.021773, -2.080643, 0, 1, 0.4078431, 1,
-0.2521362, 0.05975923, 0.08301844, 0, 1, 0.4117647, 1,
-0.2482155, 1.300049, -1.139912, 0, 1, 0.4196078, 1,
-0.246417, -0.4856873, -3.06543, 0, 1, 0.4235294, 1,
-0.2448378, -0.7477407, -2.631974, 0, 1, 0.4313726, 1,
-0.2432553, 0.08296601, 0.8365508, 0, 1, 0.4352941, 1,
-0.2413691, 0.8492748, -1.822423, 0, 1, 0.4431373, 1,
-0.2405507, 0.7433457, -2.200053, 0, 1, 0.4470588, 1,
-0.2383059, 0.3449384, -0.3344699, 0, 1, 0.454902, 1,
-0.2361711, -1.103674, -2.636337, 0, 1, 0.4588235, 1,
-0.2361634, 0.7283415, -1.951267, 0, 1, 0.4666667, 1,
-0.2336662, -0.9377972, -3.147259, 0, 1, 0.4705882, 1,
-0.2327216, 0.2431692, -3.1408, 0, 1, 0.4784314, 1,
-0.2290944, 0.5043361, 0.2600716, 0, 1, 0.4823529, 1,
-0.2279703, -0.6102184, -5.145256, 0, 1, 0.4901961, 1,
-0.2204371, -0.2243605, -1.92461, 0, 1, 0.4941176, 1,
-0.2186448, -0.0444595, -2.0145, 0, 1, 0.5019608, 1,
-0.2139757, -1.365205, -3.522372, 0, 1, 0.509804, 1,
-0.2091702, -0.20131, -2.977927, 0, 1, 0.5137255, 1,
-0.2062843, 0.7885296, 0.2743935, 0, 1, 0.5215687, 1,
-0.1966725, -0.8541106, -3.252563, 0, 1, 0.5254902, 1,
-0.1943137, 0.5756713, -1.627836, 0, 1, 0.5333334, 1,
-0.1922527, 0.7386195, -0.8177847, 0, 1, 0.5372549, 1,
-0.1916347, -1.201267, -2.787694, 0, 1, 0.5450981, 1,
-0.1915539, 0.9007642, -0.2471139, 0, 1, 0.5490196, 1,
-0.1829973, 0.8039836, 0.7488912, 0, 1, 0.5568628, 1,
-0.1789337, -1.028729, -3.346685, 0, 1, 0.5607843, 1,
-0.1671918, -0.6019861, -3.206209, 0, 1, 0.5686275, 1,
-0.1661019, 0.6584715, 0.8000264, 0, 1, 0.572549, 1,
-0.1633821, -0.40532, -1.967975, 0, 1, 0.5803922, 1,
-0.1562399, -0.08059052, -2.8962, 0, 1, 0.5843138, 1,
-0.1548634, -0.09619959, -2.680724, 0, 1, 0.5921569, 1,
-0.1542323, 0.9006519, 0.3138091, 0, 1, 0.5960785, 1,
-0.1530952, 1.83664, 1.105467, 0, 1, 0.6039216, 1,
-0.1520635, 0.3045377, -0.203334, 0, 1, 0.6117647, 1,
-0.1496967, 1.021249, 0.3510042, 0, 1, 0.6156863, 1,
-0.1435668, -1.417551, -2.73718, 0, 1, 0.6235294, 1,
-0.1393228, -0.8339377, -4.758208, 0, 1, 0.627451, 1,
-0.138945, -0.5799053, -4.124561, 0, 1, 0.6352941, 1,
-0.1356066, 1.031745, -1.117659, 0, 1, 0.6392157, 1,
-0.1355195, -0.7475951, -2.273803, 0, 1, 0.6470588, 1,
-0.134544, 1.662971, -1.337333, 0, 1, 0.6509804, 1,
-0.1343485, -0.6081971, -1.821158, 0, 1, 0.6588235, 1,
-0.1315765, 0.2997566, -0.6386645, 0, 1, 0.6627451, 1,
-0.1266488, 2.370858, -0.3081028, 0, 1, 0.6705883, 1,
-0.1259567, 0.9264879, -0.41915, 0, 1, 0.6745098, 1,
-0.1256407, -0.6251603, -2.481044, 0, 1, 0.682353, 1,
-0.1207409, 0.353228, -2.104137, 0, 1, 0.6862745, 1,
-0.1194214, 0.6766388, -1.78716, 0, 1, 0.6941177, 1,
-0.1161419, -0.9335651, -2.856199, 0, 1, 0.7019608, 1,
-0.1145273, -0.6979544, -2.709892, 0, 1, 0.7058824, 1,
-0.113801, 1.201246, 0.6139222, 0, 1, 0.7137255, 1,
-0.1134269, -0.6869498, -2.239568, 0, 1, 0.7176471, 1,
-0.1127208, 0.6102675, -1.009892, 0, 1, 0.7254902, 1,
-0.1043414, -0.4243986, -3.47982, 0, 1, 0.7294118, 1,
-0.1003099, -0.006628843, -1.712656, 0, 1, 0.7372549, 1,
-0.09917679, -0.6559546, -3.648537, 0, 1, 0.7411765, 1,
-0.09754594, -0.01891993, -2.012106, 0, 1, 0.7490196, 1,
-0.09684667, -0.001249321, -2.567062, 0, 1, 0.7529412, 1,
-0.09410264, 0.2412201, 0.1496976, 0, 1, 0.7607843, 1,
-0.09398308, 0.02989849, 0.6583808, 0, 1, 0.7647059, 1,
-0.0912762, -0.7978026, -2.638397, 0, 1, 0.772549, 1,
-0.08937427, -1.207507, -3.104331, 0, 1, 0.7764706, 1,
-0.07811068, 0.8651199, 0.1247284, 0, 1, 0.7843137, 1,
-0.0779745, -1.048526, -2.173629, 0, 1, 0.7882353, 1,
-0.07454871, 0.4014195, -1.576325, 0, 1, 0.7960784, 1,
-0.07346286, -1.67695, -3.954871, 0, 1, 0.8039216, 1,
-0.07331911, -0.0443821, -0.665121, 0, 1, 0.8078431, 1,
-0.07001497, -1.071231, -2.390824, 0, 1, 0.8156863, 1,
-0.06987885, 0.2792404, 0.1980722, 0, 1, 0.8196079, 1,
-0.06190495, 2.248499, -2.005099, 0, 1, 0.827451, 1,
-0.05969658, 1.995912, -1.632517, 0, 1, 0.8313726, 1,
-0.05374606, -0.2817288, -2.250808, 0, 1, 0.8392157, 1,
-0.04303995, -0.1277351, -2.639199, 0, 1, 0.8431373, 1,
-0.04113182, 0.162456, -0.1985977, 0, 1, 0.8509804, 1,
-0.03823765, 0.3206655, -1.185185, 0, 1, 0.854902, 1,
-0.03625707, -0.7425174, -2.336372, 0, 1, 0.8627451, 1,
-0.03160583, 1.917644, 1.6666, 0, 1, 0.8666667, 1,
-0.02992936, -1.706522, -3.034588, 0, 1, 0.8745098, 1,
-0.02891782, -0.6651914, -3.704468, 0, 1, 0.8784314, 1,
-0.02334641, -0.4055899, -3.285578, 0, 1, 0.8862745, 1,
-0.01905885, -0.7874737, -3.673856, 0, 1, 0.8901961, 1,
-0.01550459, 0.1835247, -1.451539, 0, 1, 0.8980392, 1,
-0.01474628, -0.8613753, -1.635267, 0, 1, 0.9058824, 1,
-0.01380105, 0.8504756, -0.4207967, 0, 1, 0.9098039, 1,
-0.008723192, -0.154387, -3.482692, 0, 1, 0.9176471, 1,
-0.008491256, -0.3182876, -3.213424, 0, 1, 0.9215686, 1,
-0.007818431, 1.108717, 1.517788, 0, 1, 0.9294118, 1,
-0.005022778, 0.4824284, -0.531356, 0, 1, 0.9333333, 1,
0.0003385082, 1.006893, 1.007265, 0, 1, 0.9411765, 1,
0.002193476, 2.638853, 0.1785126, 0, 1, 0.945098, 1,
0.002265802, 0.5092905, -0.3047412, 0, 1, 0.9529412, 1,
0.0046853, 0.5495173, -0.07259168, 0, 1, 0.9568627, 1,
0.006729469, -1.226087, 3.207472, 0, 1, 0.9647059, 1,
0.01130395, -0.4219418, 3.663722, 0, 1, 0.9686275, 1,
0.01476394, 1.099151, -1.03281, 0, 1, 0.9764706, 1,
0.01570628, -1.161325, 1.96302, 0, 1, 0.9803922, 1,
0.01594883, -0.3144018, 4.361744, 0, 1, 0.9882353, 1,
0.01624035, -0.9251496, 2.785321, 0, 1, 0.9921569, 1,
0.0179918, -0.09521182, 4.058399, 0, 1, 1, 1,
0.02137876, 0.07218713, 2.09492, 0, 0.9921569, 1, 1,
0.02442484, 0.2759164, -1.630008, 0, 0.9882353, 1, 1,
0.03255333, 0.1412722, 0.02069673, 0, 0.9803922, 1, 1,
0.0351228, 0.7026919, -0.54552, 0, 0.9764706, 1, 1,
0.03515418, 0.7073404, -1.547547, 0, 0.9686275, 1, 1,
0.03583995, -1.229354, 2.712976, 0, 0.9647059, 1, 1,
0.03594984, -0.7250441, 3.424473, 0, 0.9568627, 1, 1,
0.0374751, 0.4886367, 0.322172, 0, 0.9529412, 1, 1,
0.03942247, -0.669534, 2.53843, 0, 0.945098, 1, 1,
0.04250731, 1.910483, 1.18155, 0, 0.9411765, 1, 1,
0.04251423, 1.507588, -1.135634, 0, 0.9333333, 1, 1,
0.04598965, -1.480843, 3.174563, 0, 0.9294118, 1, 1,
0.04635317, -0.1451989, 2.31301, 0, 0.9215686, 1, 1,
0.05014604, -0.4572306, 2.26478, 0, 0.9176471, 1, 1,
0.05257769, -0.3172605, 3.996902, 0, 0.9098039, 1, 1,
0.05793337, -0.9701574, 2.656634, 0, 0.9058824, 1, 1,
0.07117774, -0.3544554, 1.979926, 0, 0.8980392, 1, 1,
0.07170348, 0.2374164, -2.01992, 0, 0.8901961, 1, 1,
0.0804698, 0.1100116, 0.8233122, 0, 0.8862745, 1, 1,
0.08273272, -1.35207, 1.297771, 0, 0.8784314, 1, 1,
0.08572807, -1.170417, 3.174014, 0, 0.8745098, 1, 1,
0.08643292, 2.859211, -0.8062043, 0, 0.8666667, 1, 1,
0.08753379, -0.5883609, 2.990253, 0, 0.8627451, 1, 1,
0.08896141, 0.6074247, -0.4548882, 0, 0.854902, 1, 1,
0.09058143, -1.605981, 3.907002, 0, 0.8509804, 1, 1,
0.09940491, -1.853229, 3.496231, 0, 0.8431373, 1, 1,
0.1000766, -2.405764, 1.115686, 0, 0.8392157, 1, 1,
0.1085299, 0.7686908, 1.194781, 0, 0.8313726, 1, 1,
0.1087864, 0.7830483, 1.090992, 0, 0.827451, 1, 1,
0.1174333, -0.9419426, 3.651624, 0, 0.8196079, 1, 1,
0.123118, 1.279238, 1.6861, 0, 0.8156863, 1, 1,
0.1255977, -1.102305, 2.202209, 0, 0.8078431, 1, 1,
0.1324899, -0.1928719, 3.184206, 0, 0.8039216, 1, 1,
0.1363559, -1.040807, 2.021611, 0, 0.7960784, 1, 1,
0.1384126, -0.2905665, 2.747281, 0, 0.7882353, 1, 1,
0.1395249, -1.565014, 3.809807, 0, 0.7843137, 1, 1,
0.1406796, -0.07315559, 2.151786, 0, 0.7764706, 1, 1,
0.1447582, -0.2446542, 3.091517, 0, 0.772549, 1, 1,
0.1458438, -0.05819745, 2.571229, 0, 0.7647059, 1, 1,
0.151207, -1.114924, 3.797946, 0, 0.7607843, 1, 1,
0.1530589, 0.2918617, 1.263953, 0, 0.7529412, 1, 1,
0.1555233, 1.15832, -0.6263634, 0, 0.7490196, 1, 1,
0.1562146, -1.085701, 2.382709, 0, 0.7411765, 1, 1,
0.1562483, -0.272651, 3.051606, 0, 0.7372549, 1, 1,
0.1575623, 1.040523, -2.741817, 0, 0.7294118, 1, 1,
0.1577954, 0.06835222, 2.428434, 0, 0.7254902, 1, 1,
0.1583113, -0.1506413, 2.300287, 0, 0.7176471, 1, 1,
0.1603913, 0.9866601, 0.5101607, 0, 0.7137255, 1, 1,
0.1678979, 1.658368, 0.1298738, 0, 0.7058824, 1, 1,
0.1687869, 0.02447262, 1.319844, 0, 0.6980392, 1, 1,
0.1710868, -0.4051884, 1.042332, 0, 0.6941177, 1, 1,
0.1756878, 1.051421, 0.9169992, 0, 0.6862745, 1, 1,
0.1799563, -0.312649, 3.317825, 0, 0.682353, 1, 1,
0.1824919, 0.4344101, 1.083489, 0, 0.6745098, 1, 1,
0.1836049, -0.2445, 3.17838, 0, 0.6705883, 1, 1,
0.1872954, -0.718459, 2.151033, 0, 0.6627451, 1, 1,
0.1947137, -0.2753284, 1.079228, 0, 0.6588235, 1, 1,
0.196316, 0.7032856, 2.564121, 0, 0.6509804, 1, 1,
0.1983308, 0.3768977, 1.987582, 0, 0.6470588, 1, 1,
0.2007469, 2.371015, 0.7996554, 0, 0.6392157, 1, 1,
0.2016464, 0.4329249, -0.1502883, 0, 0.6352941, 1, 1,
0.2052337, -0.5420559, 2.182902, 0, 0.627451, 1, 1,
0.2071158, 0.2807792, 0.5735922, 0, 0.6235294, 1, 1,
0.208343, -2.386919, 2.439683, 0, 0.6156863, 1, 1,
0.2124041, -1.15872, 2.769045, 0, 0.6117647, 1, 1,
0.2131672, -0.1797512, 1.54303, 0, 0.6039216, 1, 1,
0.2132659, 1.201236, -1.19769, 0, 0.5960785, 1, 1,
0.213298, 0.8810521, 1.173312, 0, 0.5921569, 1, 1,
0.2183978, -0.402046, 1.634575, 0, 0.5843138, 1, 1,
0.2187427, -2.042645, 3.815111, 0, 0.5803922, 1, 1,
0.2203887, -0.6111785, 3.242152, 0, 0.572549, 1, 1,
0.2207413, -0.127096, 2.891903, 0, 0.5686275, 1, 1,
0.2263295, -1.424543, 3.509941, 0, 0.5607843, 1, 1,
0.2265233, 1.370408, 0.8645318, 0, 0.5568628, 1, 1,
0.229942, 0.5989838, 1.562919, 0, 0.5490196, 1, 1,
0.2317237, -1.193319, 3.652475, 0, 0.5450981, 1, 1,
0.2327523, 0.06764076, 2.350234, 0, 0.5372549, 1, 1,
0.2330975, -3.46016, 3.926411, 0, 0.5333334, 1, 1,
0.2361735, 0.1490745, 2.230942, 0, 0.5254902, 1, 1,
0.2370754, 0.217882, 1.76924, 0, 0.5215687, 1, 1,
0.2395904, -0.6814102, 2.912869, 0, 0.5137255, 1, 1,
0.2416714, -0.6338847, 2.140746, 0, 0.509804, 1, 1,
0.2421048, -0.9321022, 3.24666, 0, 0.5019608, 1, 1,
0.2439201, -1.139563, 5.070688, 0, 0.4941176, 1, 1,
0.2447349, -0.2555393, 2.33972, 0, 0.4901961, 1, 1,
0.2461339, -0.3033203, 2.297668, 0, 0.4823529, 1, 1,
0.2465993, -1.563488, 3.025982, 0, 0.4784314, 1, 1,
0.2483868, 0.05583502, 1.402663, 0, 0.4705882, 1, 1,
0.2500217, 0.8542307, 0.5205485, 0, 0.4666667, 1, 1,
0.2541967, -1.014508, 2.267226, 0, 0.4588235, 1, 1,
0.2585223, -1.536162, 5.047558, 0, 0.454902, 1, 1,
0.2592564, -0.2515776, 2.066955, 0, 0.4470588, 1, 1,
0.2615826, 0.6947078, 1.517596, 0, 0.4431373, 1, 1,
0.2622169, 1.508901, -0.9227047, 0, 0.4352941, 1, 1,
0.2663333, -1.120798, 2.207715, 0, 0.4313726, 1, 1,
0.2708932, -1.915716, 2.611146, 0, 0.4235294, 1, 1,
0.2709052, 0.7747266, 0.05720049, 0, 0.4196078, 1, 1,
0.2714006, 1.217317, 0.5748416, 0, 0.4117647, 1, 1,
0.2721578, -0.7967126, 2.932868, 0, 0.4078431, 1, 1,
0.2722278, -0.4581006, 2.886549, 0, 0.4, 1, 1,
0.2726482, -0.3024854, 2.048152, 0, 0.3921569, 1, 1,
0.2726547, 1.521699, 0.08968414, 0, 0.3882353, 1, 1,
0.2748266, -1.957246, 3.322833, 0, 0.3803922, 1, 1,
0.2808264, 0.5845085, 1.008496, 0, 0.3764706, 1, 1,
0.2830044, -0.2071023, 2.118572, 0, 0.3686275, 1, 1,
0.2834775, -1.42276, 1.977201, 0, 0.3647059, 1, 1,
0.3002693, 0.3233191, 0.8739012, 0, 0.3568628, 1, 1,
0.3046105, -1.682717, 3.337201, 0, 0.3529412, 1, 1,
0.304757, -0.3240439, 1.887174, 0, 0.345098, 1, 1,
0.3065232, 0.6462991, 1.130832, 0, 0.3411765, 1, 1,
0.3096224, -1.800888, 3.484486, 0, 0.3333333, 1, 1,
0.3172902, -1.837576, 1.631098, 0, 0.3294118, 1, 1,
0.3229381, -0.1207293, 1.633988, 0, 0.3215686, 1, 1,
0.3231739, -1.150073, 2.407019, 0, 0.3176471, 1, 1,
0.3236972, 1.087193, 0.7927528, 0, 0.3098039, 1, 1,
0.3280923, -1.12343, 3.171833, 0, 0.3058824, 1, 1,
0.3291066, -0.07539024, 1.495981, 0, 0.2980392, 1, 1,
0.3295166, -0.9983278, 3.85828, 0, 0.2901961, 1, 1,
0.333436, -2.073931, 1.960866, 0, 0.2862745, 1, 1,
0.3335131, -0.4146787, 1.083418, 0, 0.2784314, 1, 1,
0.3414715, -0.0343144, 1.627078, 0, 0.2745098, 1, 1,
0.3457285, -0.6303481, 2.41908, 0, 0.2666667, 1, 1,
0.3463734, 3.195062, -0.5640091, 0, 0.2627451, 1, 1,
0.3496053, -1.258102, 1.199364, 0, 0.254902, 1, 1,
0.3521494, 0.9151261, 0.5362342, 0, 0.2509804, 1, 1,
0.3522247, 0.4076382, -0.5052291, 0, 0.2431373, 1, 1,
0.3536342, -0.1491746, 0.7990199, 0, 0.2392157, 1, 1,
0.3554899, 0.7489904, -0.8604715, 0, 0.2313726, 1, 1,
0.3571609, -1.161142, 2.35796, 0, 0.227451, 1, 1,
0.3571687, 0.6769911, 0.5856397, 0, 0.2196078, 1, 1,
0.3653615, 1.650825, 0.8315027, 0, 0.2156863, 1, 1,
0.3657236, 0.9577349, 1.537995, 0, 0.2078431, 1, 1,
0.3700675, 2.403841, 0.7062178, 0, 0.2039216, 1, 1,
0.370542, -0.270889, 1.680851, 0, 0.1960784, 1, 1,
0.3730561, 0.6535707, 1.681237, 0, 0.1882353, 1, 1,
0.3740816, 1.964067, -0.4884982, 0, 0.1843137, 1, 1,
0.3745055, 0.0468297, 1.767778, 0, 0.1764706, 1, 1,
0.3748054, -0.4951653, 2.783712, 0, 0.172549, 1, 1,
0.3790243, 1.122344, 0.4144204, 0, 0.1647059, 1, 1,
0.3818401, 0.04172713, 0.542266, 0, 0.1607843, 1, 1,
0.3837575, 0.4577785, -1.002859, 0, 0.1529412, 1, 1,
0.3853092, -2.854812, 3.417873, 0, 0.1490196, 1, 1,
0.3859124, 0.832835, -0.4788772, 0, 0.1411765, 1, 1,
0.3877032, -0.6953337, 2.244701, 0, 0.1372549, 1, 1,
0.3899603, -1.041561, 4.729813, 0, 0.1294118, 1, 1,
0.391242, -0.5654968, 4.502607, 0, 0.1254902, 1, 1,
0.3924146, 1.310626, 0.8801008, 0, 0.1176471, 1, 1,
0.3941576, -0.8107776, 3.880732, 0, 0.1137255, 1, 1,
0.3953934, 1.600467, 0.8794788, 0, 0.1058824, 1, 1,
0.3987572, 0.1338065, -0.7229267, 0, 0.09803922, 1, 1,
0.4033265, -2.323744, 1.184811, 0, 0.09411765, 1, 1,
0.4061917, -1.203712, 4.134171, 0, 0.08627451, 1, 1,
0.4079574, 1.542549, 1.204348, 0, 0.08235294, 1, 1,
0.4082408, 0.06890862, 1.935472, 0, 0.07450981, 1, 1,
0.40842, -0.2738284, 3.052579, 0, 0.07058824, 1, 1,
0.4169587, -0.02221947, 1.272851, 0, 0.0627451, 1, 1,
0.4200768, 0.4261045, 0.552296, 0, 0.05882353, 1, 1,
0.4219411, -0.7890689, 2.089056, 0, 0.05098039, 1, 1,
0.4246921, -1.204262, 2.557739, 0, 0.04705882, 1, 1,
0.4257879, 0.5491209, 2.758045, 0, 0.03921569, 1, 1,
0.4276968, 0.3423255, 0.5388367, 0, 0.03529412, 1, 1,
0.4295558, 1.735405, 1.263744, 0, 0.02745098, 1, 1,
0.4357139, 0.7745702, -0.7044433, 0, 0.02352941, 1, 1,
0.4413873, 0.9235991, -1.152706, 0, 0.01568628, 1, 1,
0.4436999, -0.2585076, 1.096147, 0, 0.01176471, 1, 1,
0.4441539, 1.068, -0.6461353, 0, 0.003921569, 1, 1,
0.4447147, -1.220443, 5.19008, 0.003921569, 0, 1, 1,
0.4447611, 2.453806, 0.2527795, 0.007843138, 0, 1, 1,
0.454001, -0.8171826, 0.2771356, 0.01568628, 0, 1, 1,
0.4548796, 0.8511087, 0.6549405, 0.01960784, 0, 1, 1,
0.4565168, -0.5741248, 1.05476, 0.02745098, 0, 1, 1,
0.4567903, -0.03712439, 1.103859, 0.03137255, 0, 1, 1,
0.4586171, 0.3348695, 1.464215, 0.03921569, 0, 1, 1,
0.4591006, 2.944647, -0.8916028, 0.04313726, 0, 1, 1,
0.4625307, 1.579771, 0.9139044, 0.05098039, 0, 1, 1,
0.4638712, 1.046287, -0.4271401, 0.05490196, 0, 1, 1,
0.46525, -0.02683559, 1.042376, 0.0627451, 0, 1, 1,
0.4675413, 0.5691316, -0.02826659, 0.06666667, 0, 1, 1,
0.4693781, 1.055157, -1.340257, 0.07450981, 0, 1, 1,
0.4703421, -0.1069518, 2.297745, 0.07843138, 0, 1, 1,
0.4750877, -1.183075, 1.50482, 0.08627451, 0, 1, 1,
0.4769866, -2.241173, 3.21164, 0.09019608, 0, 1, 1,
0.479297, -0.666468, 3.505929, 0.09803922, 0, 1, 1,
0.4811826, 0.5188568, 0.002138294, 0.1058824, 0, 1, 1,
0.4834143, 2.146133, 0.2544929, 0.1098039, 0, 1, 1,
0.4878449, -0.06426951, 1.637312, 0.1176471, 0, 1, 1,
0.4894416, -0.3134339, 1.137671, 0.1215686, 0, 1, 1,
0.4915457, -1.04165, 2.972016, 0.1294118, 0, 1, 1,
0.4916691, -0.01021202, 2.548979, 0.1333333, 0, 1, 1,
0.4971394, -1.605126, 2.905773, 0.1411765, 0, 1, 1,
0.4986797, -1.554345, 3.915149, 0.145098, 0, 1, 1,
0.5001626, 1.27316, 0.8669137, 0.1529412, 0, 1, 1,
0.502285, 0.1627305, 2.422014, 0.1568628, 0, 1, 1,
0.505704, -0.3179961, 2.046842, 0.1647059, 0, 1, 1,
0.5081808, -0.4021357, 2.965723, 0.1686275, 0, 1, 1,
0.5155048, 0.2862977, 3.373425, 0.1764706, 0, 1, 1,
0.5280739, -0.1376418, 1.583968, 0.1803922, 0, 1, 1,
0.5316709, 0.1638875, 1.675519, 0.1882353, 0, 1, 1,
0.53442, 0.8669337, 0.9743994, 0.1921569, 0, 1, 1,
0.5363973, -0.2353918, 0.2400686, 0.2, 0, 1, 1,
0.5392833, 0.4358732, 1.968748, 0.2078431, 0, 1, 1,
0.5399662, 0.1886225, 0.2590835, 0.2117647, 0, 1, 1,
0.540318, -0.1361679, 1.867747, 0.2196078, 0, 1, 1,
0.542007, -1.635053, 2.460906, 0.2235294, 0, 1, 1,
0.5446071, -0.1155349, 2.118736, 0.2313726, 0, 1, 1,
0.5452222, -0.3547597, 2.694961, 0.2352941, 0, 1, 1,
0.5462885, 1.230995, -0.4774014, 0.2431373, 0, 1, 1,
0.5464461, 0.02637175, -0.3559261, 0.2470588, 0, 1, 1,
0.5473475, 0.7530965, -0.641421, 0.254902, 0, 1, 1,
0.5477551, -2.058746, 2.572116, 0.2588235, 0, 1, 1,
0.5488263, 0.8422195, 0.1456362, 0.2666667, 0, 1, 1,
0.5524307, -0.8655709, 3.343269, 0.2705882, 0, 1, 1,
0.5546866, 1.376566, -0.09346852, 0.2784314, 0, 1, 1,
0.5601676, -0.7699364, 3.083366, 0.282353, 0, 1, 1,
0.5612623, -2.617812, 3.809367, 0.2901961, 0, 1, 1,
0.5618567, 1.407954, 0.5048628, 0.2941177, 0, 1, 1,
0.5643842, -0.5037459, 1.037468, 0.3019608, 0, 1, 1,
0.5684714, -0.134825, 3.068683, 0.3098039, 0, 1, 1,
0.5694363, -0.7627346, 3.627288, 0.3137255, 0, 1, 1,
0.5716783, -0.3812307, 3.060849, 0.3215686, 0, 1, 1,
0.5720748, -0.02775285, 2.84834, 0.3254902, 0, 1, 1,
0.5761756, -1.106375, 1.456646, 0.3333333, 0, 1, 1,
0.5838738, -0.120693, 1.687371, 0.3372549, 0, 1, 1,
0.5866504, -0.849196, 2.307099, 0.345098, 0, 1, 1,
0.5875939, -1.506639, 2.040357, 0.3490196, 0, 1, 1,
0.5877505, -1.707507, 1.527921, 0.3568628, 0, 1, 1,
0.5892622, 1.475822, -0.6819971, 0.3607843, 0, 1, 1,
0.604207, 1.416471, -0.8934519, 0.3686275, 0, 1, 1,
0.6051319, 0.816088, -0.06402408, 0.372549, 0, 1, 1,
0.6061989, -0.8741997, 3.522656, 0.3803922, 0, 1, 1,
0.6065269, 1.94362, -0.2261868, 0.3843137, 0, 1, 1,
0.6076041, -0.5085652, 1.177226, 0.3921569, 0, 1, 1,
0.6097034, -0.1374555, 1.117669, 0.3960784, 0, 1, 1,
0.6151479, 0.1858303, 0.5335328, 0.4039216, 0, 1, 1,
0.6175843, 0.5927849, 3.028868, 0.4117647, 0, 1, 1,
0.6194785, 1.016034, 0.4952075, 0.4156863, 0, 1, 1,
0.6199909, -1.371869, 3.993634, 0.4235294, 0, 1, 1,
0.6212008, -0.4103545, 2.646252, 0.427451, 0, 1, 1,
0.6229721, -0.05785237, 2.531408, 0.4352941, 0, 1, 1,
0.6289434, -0.7640761, 1.855287, 0.4392157, 0, 1, 1,
0.6322125, 0.8116181, -0.7970024, 0.4470588, 0, 1, 1,
0.6322477, 0.248382, 1.837605, 0.4509804, 0, 1, 1,
0.6369628, -0.9888977, 2.281858, 0.4588235, 0, 1, 1,
0.6417192, 0.445834, 1.515911, 0.4627451, 0, 1, 1,
0.6427637, 0.09656715, 1.327528, 0.4705882, 0, 1, 1,
0.6450842, 0.6392729, 1.411789, 0.4745098, 0, 1, 1,
0.6463147, -0.2623799, 1.794487, 0.4823529, 0, 1, 1,
0.6571839, -0.9473709, 1.3464, 0.4862745, 0, 1, 1,
0.6726735, -0.5514483, 2.679053, 0.4941176, 0, 1, 1,
0.6762813, 0.3139367, 0.2054686, 0.5019608, 0, 1, 1,
0.6821855, 0.2108018, 0.1609185, 0.5058824, 0, 1, 1,
0.6925201, 0.6487936, -0.1069958, 0.5137255, 0, 1, 1,
0.6946993, -0.6616585, 1.632914, 0.5176471, 0, 1, 1,
0.7089741, -2.50519, 2.343976, 0.5254902, 0, 1, 1,
0.7094125, 0.213975, 4.447502, 0.5294118, 0, 1, 1,
0.7097505, -0.9164657, 2.217989, 0.5372549, 0, 1, 1,
0.7101976, -2.379086, 2.745433, 0.5411765, 0, 1, 1,
0.7127618, 0.3147139, 0.6257138, 0.5490196, 0, 1, 1,
0.7202414, -0.3844369, 0.7156624, 0.5529412, 0, 1, 1,
0.7219477, 0.5988342, 2.399877, 0.5607843, 0, 1, 1,
0.7264185, -0.5698984, 2.6974, 0.5647059, 0, 1, 1,
0.7326987, -0.4740937, 1.617207, 0.572549, 0, 1, 1,
0.7329574, 0.4732938, 2.433015, 0.5764706, 0, 1, 1,
0.7380257, 1.071344, 0.7463913, 0.5843138, 0, 1, 1,
0.739639, 3.2087, 1.243958, 0.5882353, 0, 1, 1,
0.745027, 0.0312004, 1.976831, 0.5960785, 0, 1, 1,
0.7503333, -1.225825, 3.48574, 0.6039216, 0, 1, 1,
0.7558874, -0.6735471, 2.369938, 0.6078432, 0, 1, 1,
0.7587875, -0.4962515, 1.717459, 0.6156863, 0, 1, 1,
0.7598242, 0.3371411, 2.984424, 0.6196079, 0, 1, 1,
0.7667241, 1.585521, 1.097386, 0.627451, 0, 1, 1,
0.7706208, -0.8195264, 1.890568, 0.6313726, 0, 1, 1,
0.7728903, -2.69377, 4.30311, 0.6392157, 0, 1, 1,
0.7733178, 0.06704039, 0.5022552, 0.6431373, 0, 1, 1,
0.7765275, 2.068918, 0.4562786, 0.6509804, 0, 1, 1,
0.7774451, 0.2989117, 1.639471, 0.654902, 0, 1, 1,
0.7808886, -2.849079, 2.444641, 0.6627451, 0, 1, 1,
0.7829522, 0.5799968, 0.5429575, 0.6666667, 0, 1, 1,
0.7900568, 1.660947, 0.6005297, 0.6745098, 0, 1, 1,
0.7916986, 1.335277, -0.7644025, 0.6784314, 0, 1, 1,
0.7923322, -2.355835, 1.482646, 0.6862745, 0, 1, 1,
0.7942159, 1.139872, 1.357702, 0.6901961, 0, 1, 1,
0.7963481, -0.619828, 5.556197, 0.6980392, 0, 1, 1,
0.8044804, 1.790283, 1.341708, 0.7058824, 0, 1, 1,
0.8090528, 2.248487, 0.5997596, 0.7098039, 0, 1, 1,
0.8132993, -1.394091, 2.087339, 0.7176471, 0, 1, 1,
0.814597, 1.151137, -0.185254, 0.7215686, 0, 1, 1,
0.8174418, 1.793967, -0.4116161, 0.7294118, 0, 1, 1,
0.818447, -0.05254972, 3.107083, 0.7333333, 0, 1, 1,
0.8218625, -0.06000587, 2.138772, 0.7411765, 0, 1, 1,
0.8228455, 0.7657126, 0.2589467, 0.7450981, 0, 1, 1,
0.8242256, -0.1232846, 2.391572, 0.7529412, 0, 1, 1,
0.8280666, 0.4495966, 1.784066, 0.7568628, 0, 1, 1,
0.8295003, 1.701756, 0.2929107, 0.7647059, 0, 1, 1,
0.8297946, -1.316979, 2.669269, 0.7686275, 0, 1, 1,
0.8310509, 0.9276052, -0.9498622, 0.7764706, 0, 1, 1,
0.8390307, 0.05368121, 1.105654, 0.7803922, 0, 1, 1,
0.8427064, 0.79449, 0.6271031, 0.7882353, 0, 1, 1,
0.8442959, -0.5898691, 0.8043087, 0.7921569, 0, 1, 1,
0.8577074, -0.5306371, 1.799449, 0.8, 0, 1, 1,
0.8595079, -0.7814741, 2.084553, 0.8078431, 0, 1, 1,
0.8634576, 0.06185259, 1.571275, 0.8117647, 0, 1, 1,
0.8666825, 0.7989146, 1.872453, 0.8196079, 0, 1, 1,
0.8668336, -1.965503, 3.902148, 0.8235294, 0, 1, 1,
0.8705413, -1.190203, 2.898516, 0.8313726, 0, 1, 1,
0.8752123, 0.06589603, 1.329977, 0.8352941, 0, 1, 1,
0.8763143, 0.08554128, 1.271159, 0.8431373, 0, 1, 1,
0.8821208, 0.8313437, 0.4961777, 0.8470588, 0, 1, 1,
0.8824536, -0.3076758, 2.296643, 0.854902, 0, 1, 1,
0.8832744, 0.6159568, 1.591877, 0.8588235, 0, 1, 1,
0.8837142, 1.039145, 0.833397, 0.8666667, 0, 1, 1,
0.8870403, 0.05531577, 0.7646598, 0.8705882, 0, 1, 1,
0.8888423, 0.552658, 0.991592, 0.8784314, 0, 1, 1,
0.895418, 0.3434431, 2.190665, 0.8823529, 0, 1, 1,
0.9000053, 1.863293, 1.834319, 0.8901961, 0, 1, 1,
0.9066977, 0.09376125, 1.978556, 0.8941177, 0, 1, 1,
0.90763, -0.8932284, 0.5323669, 0.9019608, 0, 1, 1,
0.9086761, 0.9307314, 1.43411, 0.9098039, 0, 1, 1,
0.9093786, -0.1910579, 1.784992, 0.9137255, 0, 1, 1,
0.9241459, 0.1065839, 2.439899, 0.9215686, 0, 1, 1,
0.930851, 1.683911, 0.02250155, 0.9254902, 0, 1, 1,
0.9332504, -0.2884848, 1.196653, 0.9333333, 0, 1, 1,
0.9355862, -0.1159049, 0.63367, 0.9372549, 0, 1, 1,
0.9454173, 0.07381651, 2.31883, 0.945098, 0, 1, 1,
0.9456232, -0.2327911, 0.256817, 0.9490196, 0, 1, 1,
0.9502282, -1.180522, 2.307708, 0.9568627, 0, 1, 1,
0.9524683, 0.1893618, 2.185848, 0.9607843, 0, 1, 1,
0.9564449, -1.055675, 2.16397, 0.9686275, 0, 1, 1,
0.9625063, -0.5380679, 1.623092, 0.972549, 0, 1, 1,
0.9870993, -0.6172147, 1.929142, 0.9803922, 0, 1, 1,
0.9887484, -0.9085354, 2.742851, 0.9843137, 0, 1, 1,
0.9971527, 0.4700703, -0.08878272, 0.9921569, 0, 1, 1,
0.9971793, -0.139222, 1.128826, 0.9960784, 0, 1, 1,
0.9981217, -0.2848206, 2.846316, 1, 0, 0.9960784, 1,
1.003281, -2.081143, 2.243901, 1, 0, 0.9882353, 1,
1.007256, 0.4892142, 2.197741, 1, 0, 0.9843137, 1,
1.015872, -0.04146289, 2.380587, 1, 0, 0.9764706, 1,
1.021628, -0.8086004, 3.063904, 1, 0, 0.972549, 1,
1.022985, -0.1484714, 2.437148, 1, 0, 0.9647059, 1,
1.025927, 0.2756875, 2.253124, 1, 0, 0.9607843, 1,
1.029593, 0.6507511, 2.530456, 1, 0, 0.9529412, 1,
1.032865, -0.2813863, 2.145282, 1, 0, 0.9490196, 1,
1.034874, 1.151736, -0.09698213, 1, 0, 0.9411765, 1,
1.036668, -0.05783194, 0.8896285, 1, 0, 0.9372549, 1,
1.040461, 1.455945, 1.210934, 1, 0, 0.9294118, 1,
1.040738, 0.5198077, 1.242769, 1, 0, 0.9254902, 1,
1.040799, -0.2238772, 1.042241, 1, 0, 0.9176471, 1,
1.042371, 0.03120615, 1.699413, 1, 0, 0.9137255, 1,
1.043625, -0.07188021, 1.949558, 1, 0, 0.9058824, 1,
1.045503, 1.535723, 1.463296, 1, 0, 0.9019608, 1,
1.048343, -0.009406597, 0.1186909, 1, 0, 0.8941177, 1,
1.052567, 1.391978, -1.467286, 1, 0, 0.8862745, 1,
1.054536, 1.976761, 0.2528029, 1, 0, 0.8823529, 1,
1.056768, -1.825631, 2.324346, 1, 0, 0.8745098, 1,
1.075898, -0.4148549, 1.143892, 1, 0, 0.8705882, 1,
1.076388, -0.7220553, 3.164602, 1, 0, 0.8627451, 1,
1.077847, -0.4529102, 1.516316, 1, 0, 0.8588235, 1,
1.080791, -1.507867, 3.72473, 1, 0, 0.8509804, 1,
1.081394, 0.310371, 1.333814, 1, 0, 0.8470588, 1,
1.091616, 2.239395, 0.174359, 1, 0, 0.8392157, 1,
1.092938, 0.624832, 1.096325, 1, 0, 0.8352941, 1,
1.095134, -0.49218, 1.129327, 1, 0, 0.827451, 1,
1.102784, 0.8807058, 1.266914, 1, 0, 0.8235294, 1,
1.104049, 1.601796, 0.8437129, 1, 0, 0.8156863, 1,
1.11051, 1.017107, 2.452883, 1, 0, 0.8117647, 1,
1.120321, 0.1143008, 0.3207197, 1, 0, 0.8039216, 1,
1.122215, -0.7864774, 1.490178, 1, 0, 0.7960784, 1,
1.122439, 0.4829777, -0.5604013, 1, 0, 0.7921569, 1,
1.140533, -0.7263908, 1.773569, 1, 0, 0.7843137, 1,
1.14196, -1.274452, 1.913203, 1, 0, 0.7803922, 1,
1.159011, 0.656651, 0.3987471, 1, 0, 0.772549, 1,
1.166535, 0.2738262, 0.8394695, 1, 0, 0.7686275, 1,
1.195544, 1.996401, 0.5018402, 1, 0, 0.7607843, 1,
1.195863, -0.4669923, 1.479676, 1, 0, 0.7568628, 1,
1.208097, -2.690433, 2.217999, 1, 0, 0.7490196, 1,
1.218453, -1.38058, 3.012858, 1, 0, 0.7450981, 1,
1.229382, 0.9190006, 0.5882084, 1, 0, 0.7372549, 1,
1.231022, -0.03275495, 0.6803305, 1, 0, 0.7333333, 1,
1.237785, 1.494791, 1.149655, 1, 0, 0.7254902, 1,
1.248146, -0.6980114, 1.291475, 1, 0, 0.7215686, 1,
1.251408, 0.3353314, 2.188586, 1, 0, 0.7137255, 1,
1.252349, -0.78588, 3.072042, 1, 0, 0.7098039, 1,
1.26234, 1.977111, -0.2419241, 1, 0, 0.7019608, 1,
1.266501, -0.1434046, 2.650099, 1, 0, 0.6941177, 1,
1.267762, 1.851125, 1.317771, 1, 0, 0.6901961, 1,
1.27194, -2.379744, 3.224317, 1, 0, 0.682353, 1,
1.29832, 0.1569085, 1.163894, 1, 0, 0.6784314, 1,
1.305136, 0.7904817, 1.727595, 1, 0, 0.6705883, 1,
1.312299, 1.080132, 1.237274, 1, 0, 0.6666667, 1,
1.312428, 0.4291188, 0.9801287, 1, 0, 0.6588235, 1,
1.315006, 0.6892663, 0.4474174, 1, 0, 0.654902, 1,
1.326726, -1.911036, 3.624433, 1, 0, 0.6470588, 1,
1.349633, 0.5169724, 2.046252, 1, 0, 0.6431373, 1,
1.357852, 0.4832614, 3.982435, 1, 0, 0.6352941, 1,
1.364313, -0.8674828, 2.022265, 1, 0, 0.6313726, 1,
1.368099, -1.191072, 1.76907, 1, 0, 0.6235294, 1,
1.370319, 2.535829, -0.2949753, 1, 0, 0.6196079, 1,
1.380205, -0.5185859, 1.18654, 1, 0, 0.6117647, 1,
1.382248, -1.42774, 3.336303, 1, 0, 0.6078432, 1,
1.389278, 0.1483799, 0.864095, 1, 0, 0.6, 1,
1.397018, -0.6123, 3.176347, 1, 0, 0.5921569, 1,
1.399583, 0.192222, 0.4298137, 1, 0, 0.5882353, 1,
1.400566, -1.641098, 1.802022, 1, 0, 0.5803922, 1,
1.428568, -1.408753, 2.65051, 1, 0, 0.5764706, 1,
1.431091, 0.3944882, 1.903533, 1, 0, 0.5686275, 1,
1.443612, 0.5673564, -0.4013413, 1, 0, 0.5647059, 1,
1.444687, -0.5260162, 1.85325, 1, 0, 0.5568628, 1,
1.465108, 0.165341, 3.826589, 1, 0, 0.5529412, 1,
1.474995, -0.4082245, 0.7678146, 1, 0, 0.5450981, 1,
1.483383, 0.6343974, 1.099813, 1, 0, 0.5411765, 1,
1.485679, -1.728558, 1.423047, 1, 0, 0.5333334, 1,
1.485862, 0.8219432, 0.4818411, 1, 0, 0.5294118, 1,
1.486323, 2.651482, 0.8948512, 1, 0, 0.5215687, 1,
1.487505, 1.37889, 0.435382, 1, 0, 0.5176471, 1,
1.492753, -0.8400491, 1.702776, 1, 0, 0.509804, 1,
1.492776, 0.2034235, 1.915272, 1, 0, 0.5058824, 1,
1.496656, -2.180613, 1.704286, 1, 0, 0.4980392, 1,
1.497117, -0.6760741, 1.365124, 1, 0, 0.4901961, 1,
1.500298, -0.4922733, 1.600203, 1, 0, 0.4862745, 1,
1.502224, -1.377602, 1.573327, 1, 0, 0.4784314, 1,
1.511722, -0.9412858, 1.17024, 1, 0, 0.4745098, 1,
1.515974, 0.2600595, 1.313277, 1, 0, 0.4666667, 1,
1.518539, -0.8185718, 1.908941, 1, 0, 0.4627451, 1,
1.520216, 0.8149679, 2.061506, 1, 0, 0.454902, 1,
1.52067, 0.01052137, 0.05509611, 1, 0, 0.4509804, 1,
1.522682, 0.1863108, 1.606995, 1, 0, 0.4431373, 1,
1.523478, 1.383885, 0.9720916, 1, 0, 0.4392157, 1,
1.526085, 0.9721678, 1.578368, 1, 0, 0.4313726, 1,
1.534653, -2.264307, 3.429811, 1, 0, 0.427451, 1,
1.535579, -0.8494257, 1.422715, 1, 0, 0.4196078, 1,
1.536521, 0.7209724, -0.8360618, 1, 0, 0.4156863, 1,
1.550005, 0.3523325, -0.1316879, 1, 0, 0.4078431, 1,
1.551186, 0.4031774, 2.930103, 1, 0, 0.4039216, 1,
1.551962, 1.51405, 1.68073, 1, 0, 0.3960784, 1,
1.553425, -1.396559, 2.864031, 1, 0, 0.3882353, 1,
1.554625, 1.880315, 1.596396, 1, 0, 0.3843137, 1,
1.56036, -1.348091, 3.304985, 1, 0, 0.3764706, 1,
1.569019, -0.02445558, 0.6735092, 1, 0, 0.372549, 1,
1.576242, -0.3057253, 0.4296763, 1, 0, 0.3647059, 1,
1.58306, 1.633266, -0.1122475, 1, 0, 0.3607843, 1,
1.586734, 1.303732, 0.8957675, 1, 0, 0.3529412, 1,
1.589744, 0.0583216, 1.44313, 1, 0, 0.3490196, 1,
1.592681, 0.07853057, 2.546634, 1, 0, 0.3411765, 1,
1.602412, -1.422629, 1.258768, 1, 0, 0.3372549, 1,
1.608098, 0.303041, 2.47103, 1, 0, 0.3294118, 1,
1.613356, -1.612866, 3.203127, 1, 0, 0.3254902, 1,
1.615168, 0.5546198, 1.671173, 1, 0, 0.3176471, 1,
1.630335, 1.695115, 1.356376, 1, 0, 0.3137255, 1,
1.636535, -0.9324077, 3.820067, 1, 0, 0.3058824, 1,
1.642471, 0.2626627, 1.170757, 1, 0, 0.2980392, 1,
1.648466, 1.027811, 2.593272, 1, 0, 0.2941177, 1,
1.652869, 0.04316709, 2.830197, 1, 0, 0.2862745, 1,
1.673902, -1.258321, 2.119574, 1, 0, 0.282353, 1,
1.674954, 0.3719641, 0.392833, 1, 0, 0.2745098, 1,
1.68112, 0.1912376, 2.435456, 1, 0, 0.2705882, 1,
1.681336, 0.8821471, 0.5656517, 1, 0, 0.2627451, 1,
1.68719, 0.4405121, 1.146756, 1, 0, 0.2588235, 1,
1.714393, -2.049498, 2.460242, 1, 0, 0.2509804, 1,
1.719732, -0.1839799, 2.666403, 1, 0, 0.2470588, 1,
1.754953, 0.3665258, 1.185489, 1, 0, 0.2392157, 1,
1.774889, -0.5071831, 2.315809, 1, 0, 0.2352941, 1,
1.778525, -0.7507472, 3.545295, 1, 0, 0.227451, 1,
1.785602, -0.9569778, 0.9355301, 1, 0, 0.2235294, 1,
1.809037, 0.02364189, 1.011683, 1, 0, 0.2156863, 1,
1.811515, -0.6591017, 1.875567, 1, 0, 0.2117647, 1,
1.817685, 0.9325145, 2.035733, 1, 0, 0.2039216, 1,
1.81881, -0.2121979, 1.351148, 1, 0, 0.1960784, 1,
1.849853, 0.898087, -1.261816, 1, 0, 0.1921569, 1,
1.866387, 0.08253556, 2.105061, 1, 0, 0.1843137, 1,
1.881087, 0.952076, -0.6844437, 1, 0, 0.1803922, 1,
1.885794, -0.1066602, 3.312881, 1, 0, 0.172549, 1,
1.886288, 0.8846161, 1.332069, 1, 0, 0.1686275, 1,
1.889526, -0.7862461, 1.763114, 1, 0, 0.1607843, 1,
1.91141, -1.532529, 1.839479, 1, 0, 0.1568628, 1,
1.957586, 0.1397111, 3.372021, 1, 0, 0.1490196, 1,
1.959052, 0.1085257, 2.154247, 1, 0, 0.145098, 1,
1.985081, 1.860663, 1.33508, 1, 0, 0.1372549, 1,
2.000711, -1.410639, 2.793846, 1, 0, 0.1333333, 1,
2.022056, 0.6866112, 1.43374, 1, 0, 0.1254902, 1,
2.03014, -0.6212729, 3.192789, 1, 0, 0.1215686, 1,
2.049046, -0.8038247, 4.61172, 1, 0, 0.1137255, 1,
2.065129, 0.09316076, 1.863342, 1, 0, 0.1098039, 1,
2.103233, 1.717773, 1.249179, 1, 0, 0.1019608, 1,
2.120296, 0.03059433, 2.896709, 1, 0, 0.09411765, 1,
2.148267, -0.304478, 1.431564, 1, 0, 0.09019608, 1,
2.161541, 0.09441695, 1.843198, 1, 0, 0.08235294, 1,
2.211742, -0.09920061, 1.088169, 1, 0, 0.07843138, 1,
2.239167, -1.200186, 1.740004, 1, 0, 0.07058824, 1,
2.277239, -0.1497812, 1.183071, 1, 0, 0.06666667, 1,
2.291636, 0.251947, 1.40519, 1, 0, 0.05882353, 1,
2.319309, -0.4153213, 2.125648, 1, 0, 0.05490196, 1,
2.338701, 0.5301305, 2.112086, 1, 0, 0.04705882, 1,
2.542902, -0.6981656, 3.712172, 1, 0, 0.04313726, 1,
2.674158, 0.3449523, 1.035136, 1, 0, 0.03529412, 1,
2.732489, 1.149662, 2.549398, 1, 0, 0.03137255, 1,
2.771605, 0.2610716, -2.02859, 1, 0, 0.02352941, 1,
2.877894, -0.5064043, 3.793388, 1, 0, 0.01960784, 1,
2.883293, 1.366193, 3.133047, 1, 0, 0.01176471, 1,
3.527387, -0.4601812, 1.374388, 1, 0, 0.007843138, 1
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
0.1173872, -4.590532, -6.959152, 0, -0.5, 0.5, 0.5,
0.1173872, -4.590532, -6.959152, 1, -0.5, 0.5, 0.5,
0.1173872, -4.590532, -6.959152, 1, 1.5, 0.5, 0.5,
0.1173872, -4.590532, -6.959152, 0, 1.5, 0.5, 0.5
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
-4.448603, -0.1257302, -6.959152, 0, -0.5, 0.5, 0.5,
-4.448603, -0.1257302, -6.959152, 1, -0.5, 0.5, 0.5,
-4.448603, -0.1257302, -6.959152, 1, 1.5, 0.5, 0.5,
-4.448603, -0.1257302, -6.959152, 0, 1.5, 0.5, 0.5
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
-4.448603, -4.590532, 0.2054706, 0, -0.5, 0.5, 0.5,
-4.448603, -4.590532, 0.2054706, 1, -0.5, 0.5, 0.5,
-4.448603, -4.590532, 0.2054706, 1, 1.5, 0.5, 0.5,
-4.448603, -4.590532, 0.2054706, 0, 1.5, 0.5, 0.5
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
-3, -3.560193, -5.305778,
3, -3.560193, -5.305778,
-3, -3.560193, -5.305778,
-3, -3.731916, -5.58134,
-2, -3.560193, -5.305778,
-2, -3.731916, -5.58134,
-1, -3.560193, -5.305778,
-1, -3.731916, -5.58134,
0, -3.560193, -5.305778,
0, -3.731916, -5.58134,
1, -3.560193, -5.305778,
1, -3.731916, -5.58134,
2, -3.560193, -5.305778,
2, -3.731916, -5.58134,
3, -3.560193, -5.305778,
3, -3.731916, -5.58134
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
-3, -4.075363, -6.132465, 0, -0.5, 0.5, 0.5,
-3, -4.075363, -6.132465, 1, -0.5, 0.5, 0.5,
-3, -4.075363, -6.132465, 1, 1.5, 0.5, 0.5,
-3, -4.075363, -6.132465, 0, 1.5, 0.5, 0.5,
-2, -4.075363, -6.132465, 0, -0.5, 0.5, 0.5,
-2, -4.075363, -6.132465, 1, -0.5, 0.5, 0.5,
-2, -4.075363, -6.132465, 1, 1.5, 0.5, 0.5,
-2, -4.075363, -6.132465, 0, 1.5, 0.5, 0.5,
-1, -4.075363, -6.132465, 0, -0.5, 0.5, 0.5,
-1, -4.075363, -6.132465, 1, -0.5, 0.5, 0.5,
-1, -4.075363, -6.132465, 1, 1.5, 0.5, 0.5,
-1, -4.075363, -6.132465, 0, 1.5, 0.5, 0.5,
0, -4.075363, -6.132465, 0, -0.5, 0.5, 0.5,
0, -4.075363, -6.132465, 1, -0.5, 0.5, 0.5,
0, -4.075363, -6.132465, 1, 1.5, 0.5, 0.5,
0, -4.075363, -6.132465, 0, 1.5, 0.5, 0.5,
1, -4.075363, -6.132465, 0, -0.5, 0.5, 0.5,
1, -4.075363, -6.132465, 1, -0.5, 0.5, 0.5,
1, -4.075363, -6.132465, 1, 1.5, 0.5, 0.5,
1, -4.075363, -6.132465, 0, 1.5, 0.5, 0.5,
2, -4.075363, -6.132465, 0, -0.5, 0.5, 0.5,
2, -4.075363, -6.132465, 1, -0.5, 0.5, 0.5,
2, -4.075363, -6.132465, 1, 1.5, 0.5, 0.5,
2, -4.075363, -6.132465, 0, 1.5, 0.5, 0.5,
3, -4.075363, -6.132465, 0, -0.5, 0.5, 0.5,
3, -4.075363, -6.132465, 1, -0.5, 0.5, 0.5,
3, -4.075363, -6.132465, 1, 1.5, 0.5, 0.5,
3, -4.075363, -6.132465, 0, 1.5, 0.5, 0.5
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
-3.394913, -3, -5.305778,
-3.394913, 3, -5.305778,
-3.394913, -3, -5.305778,
-3.570528, -3, -5.58134,
-3.394913, -2, -5.305778,
-3.570528, -2, -5.58134,
-3.394913, -1, -5.305778,
-3.570528, -1, -5.58134,
-3.394913, 0, -5.305778,
-3.570528, 0, -5.58134,
-3.394913, 1, -5.305778,
-3.570528, 1, -5.58134,
-3.394913, 2, -5.305778,
-3.570528, 2, -5.58134,
-3.394913, 3, -5.305778,
-3.570528, 3, -5.58134
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
-3.921758, -3, -6.132465, 0, -0.5, 0.5, 0.5,
-3.921758, -3, -6.132465, 1, -0.5, 0.5, 0.5,
-3.921758, -3, -6.132465, 1, 1.5, 0.5, 0.5,
-3.921758, -3, -6.132465, 0, 1.5, 0.5, 0.5,
-3.921758, -2, -6.132465, 0, -0.5, 0.5, 0.5,
-3.921758, -2, -6.132465, 1, -0.5, 0.5, 0.5,
-3.921758, -2, -6.132465, 1, 1.5, 0.5, 0.5,
-3.921758, -2, -6.132465, 0, 1.5, 0.5, 0.5,
-3.921758, -1, -6.132465, 0, -0.5, 0.5, 0.5,
-3.921758, -1, -6.132465, 1, -0.5, 0.5, 0.5,
-3.921758, -1, -6.132465, 1, 1.5, 0.5, 0.5,
-3.921758, -1, -6.132465, 0, 1.5, 0.5, 0.5,
-3.921758, 0, -6.132465, 0, -0.5, 0.5, 0.5,
-3.921758, 0, -6.132465, 1, -0.5, 0.5, 0.5,
-3.921758, 0, -6.132465, 1, 1.5, 0.5, 0.5,
-3.921758, 0, -6.132465, 0, 1.5, 0.5, 0.5,
-3.921758, 1, -6.132465, 0, -0.5, 0.5, 0.5,
-3.921758, 1, -6.132465, 1, -0.5, 0.5, 0.5,
-3.921758, 1, -6.132465, 1, 1.5, 0.5, 0.5,
-3.921758, 1, -6.132465, 0, 1.5, 0.5, 0.5,
-3.921758, 2, -6.132465, 0, -0.5, 0.5, 0.5,
-3.921758, 2, -6.132465, 1, -0.5, 0.5, 0.5,
-3.921758, 2, -6.132465, 1, 1.5, 0.5, 0.5,
-3.921758, 2, -6.132465, 0, 1.5, 0.5, 0.5,
-3.921758, 3, -6.132465, 0, -0.5, 0.5, 0.5,
-3.921758, 3, -6.132465, 1, -0.5, 0.5, 0.5,
-3.921758, 3, -6.132465, 1, 1.5, 0.5, 0.5,
-3.921758, 3, -6.132465, 0, 1.5, 0.5, 0.5
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
-3.394913, -3.560193, -4,
-3.394913, -3.560193, 4,
-3.394913, -3.560193, -4,
-3.570528, -3.731916, -4,
-3.394913, -3.560193, -2,
-3.570528, -3.731916, -2,
-3.394913, -3.560193, 0,
-3.570528, -3.731916, 0,
-3.394913, -3.560193, 2,
-3.570528, -3.731916, 2,
-3.394913, -3.560193, 4,
-3.570528, -3.731916, 4
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
-3.921758, -4.075363, -4, 0, -0.5, 0.5, 0.5,
-3.921758, -4.075363, -4, 1, -0.5, 0.5, 0.5,
-3.921758, -4.075363, -4, 1, 1.5, 0.5, 0.5,
-3.921758, -4.075363, -4, 0, 1.5, 0.5, 0.5,
-3.921758, -4.075363, -2, 0, -0.5, 0.5, 0.5,
-3.921758, -4.075363, -2, 1, -0.5, 0.5, 0.5,
-3.921758, -4.075363, -2, 1, 1.5, 0.5, 0.5,
-3.921758, -4.075363, -2, 0, 1.5, 0.5, 0.5,
-3.921758, -4.075363, 0, 0, -0.5, 0.5, 0.5,
-3.921758, -4.075363, 0, 1, -0.5, 0.5, 0.5,
-3.921758, -4.075363, 0, 1, 1.5, 0.5, 0.5,
-3.921758, -4.075363, 0, 0, 1.5, 0.5, 0.5,
-3.921758, -4.075363, 2, 0, -0.5, 0.5, 0.5,
-3.921758, -4.075363, 2, 1, -0.5, 0.5, 0.5,
-3.921758, -4.075363, 2, 1, 1.5, 0.5, 0.5,
-3.921758, -4.075363, 2, 0, 1.5, 0.5, 0.5,
-3.921758, -4.075363, 4, 0, -0.5, 0.5, 0.5,
-3.921758, -4.075363, 4, 1, -0.5, 0.5, 0.5,
-3.921758, -4.075363, 4, 1, 1.5, 0.5, 0.5,
-3.921758, -4.075363, 4, 0, 1.5, 0.5, 0.5
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
-3.394913, -3.560193, -5.305778,
-3.394913, 3.308733, -5.305778,
-3.394913, -3.560193, 5.716719,
-3.394913, 3.308733, 5.716719,
-3.394913, -3.560193, -5.305778,
-3.394913, -3.560193, 5.716719,
-3.394913, 3.308733, -5.305778,
-3.394913, 3.308733, 5.716719,
-3.394913, -3.560193, -5.305778,
3.629687, -3.560193, -5.305778,
-3.394913, -3.560193, 5.716719,
3.629687, -3.560193, 5.716719,
-3.394913, 3.308733, -5.305778,
3.629687, 3.308733, -5.305778,
-3.394913, 3.308733, 5.716719,
3.629687, 3.308733, 5.716719,
3.629687, -3.560193, -5.305778,
3.629687, 3.308733, -5.305778,
3.629687, -3.560193, 5.716719,
3.629687, 3.308733, 5.716719,
3.629687, -3.560193, -5.305778,
3.629687, -3.560193, 5.716719,
3.629687, 3.308733, -5.305778,
3.629687, 3.308733, 5.716719
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
var radius = 7.884537;
var distance = 35.0792;
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
mvMatrix.translate( -0.1173872, 0.1257302, -0.2054706 );
mvMatrix.scale( 1.21358, 1.241084, 0.7734106 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.0792);
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
amino_sulfonic_acid<-read.table("amino_sulfonic_acid.xyz", skip=1)
```

```
## Error in read.table("amino_sulfonic_acid.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-amino_sulfonic_acid$V2
```

```
## Error in eval(expr, envir, enclos): object 'amino_sulfonic_acid' not found
```

```r
y<-amino_sulfonic_acid$V3
```

```
## Error in eval(expr, envir, enclos): object 'amino_sulfonic_acid' not found
```

```r
z<-amino_sulfonic_acid$V4
```

```
## Error in eval(expr, envir, enclos): object 'amino_sulfonic_acid' not found
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
-3.292613, -1.302046, -0.913734, 0, 0, 1, 1, 1,
-2.745018, 0.4375822, -1.800275, 1, 0, 0, 1, 1,
-2.653806, -0.6148768, -2.378572, 1, 0, 0, 1, 1,
-2.613494, 0.1910618, -2.540032, 1, 0, 0, 1, 1,
-2.612422, -0.05093281, -2.122335, 1, 0, 0, 1, 1,
-2.54669, 0.7464669, -2.490878, 1, 0, 0, 1, 1,
-2.542388, -0.592692, -0.4719373, 0, 0, 0, 1, 1,
-2.522967, 0.2880755, -2.81755, 0, 0, 0, 1, 1,
-2.512762, 0.5194073, -1.136399, 0, 0, 0, 1, 1,
-2.493257, 2.083029, -0.6798328, 0, 0, 0, 1, 1,
-2.422485, -1.031367, -0.06208571, 0, 0, 0, 1, 1,
-2.392601, -1.752237, -3.032825, 0, 0, 0, 1, 1,
-2.379755, 0.297515, -0.05359093, 0, 0, 0, 1, 1,
-2.360241, 1.53589, -1.193351, 1, 1, 1, 1, 1,
-2.311662, 0.02508342, -1.032868, 1, 1, 1, 1, 1,
-2.272533, -0.1829237, -4.411059, 1, 1, 1, 1, 1,
-2.155982, -0.2337758, -0.8268638, 1, 1, 1, 1, 1,
-2.121874, 0.2126807, -2.035497, 1, 1, 1, 1, 1,
-2.086861, 1.476985, -1.48799, 1, 1, 1, 1, 1,
-2.086038, 0.5354369, -1.168154, 1, 1, 1, 1, 1,
-2.044709, -1.314403, -1.644341, 1, 1, 1, 1, 1,
-1.994959, -1.367758, -1.38193, 1, 1, 1, 1, 1,
-1.992314, 1.678323, -1.926043, 1, 1, 1, 1, 1,
-1.961294, -0.2642042, -1.001662, 1, 1, 1, 1, 1,
-1.939286, -0.9780112, -2.269325, 1, 1, 1, 1, 1,
-1.936876, 1.549548, -1.996887, 1, 1, 1, 1, 1,
-1.884739, 0.1574554, -2.119119, 1, 1, 1, 1, 1,
-1.871393, -0.7759893, -1.364726, 1, 1, 1, 1, 1,
-1.855444, 0.3071751, -3.450087, 0, 0, 1, 1, 1,
-1.837801, 0.4089758, -1.168839, 1, 0, 0, 1, 1,
-1.822343, -0.2828274, -0.6043956, 1, 0, 0, 1, 1,
-1.818437, 1.266567, -0.38281, 1, 0, 0, 1, 1,
-1.816878, 0.2897086, -3.680684, 1, 0, 0, 1, 1,
-1.812225, 0.01215864, -1.970082, 1, 0, 0, 1, 1,
-1.809939, -1.004396, -2.375189, 0, 0, 0, 1, 1,
-1.803551, -0.4570002, -0.3200645, 0, 0, 0, 1, 1,
-1.785879, 0.6346834, -1.767936, 0, 0, 0, 1, 1,
-1.766787, 1.016077, 0.08204492, 0, 0, 0, 1, 1,
-1.766453, -2.045601, -1.515363, 0, 0, 0, 1, 1,
-1.742501, 0.3857735, -2.426657, 0, 0, 0, 1, 1,
-1.739198, -1.230388, -2.150685, 0, 0, 0, 1, 1,
-1.720021, 0.65843, -1.482432, 1, 1, 1, 1, 1,
-1.71185, -0.418733, -2.222181, 1, 1, 1, 1, 1,
-1.697981, 1.097153, -0.2230299, 1, 1, 1, 1, 1,
-1.677036, -0.5813875, -3.154904, 1, 1, 1, 1, 1,
-1.671681, -1.638268, -1.857726, 1, 1, 1, 1, 1,
-1.619083, 0.6632133, -1.28246, 1, 1, 1, 1, 1,
-1.605604, 0.01792611, -0.7616668, 1, 1, 1, 1, 1,
-1.604742, -0.4473795, -0.3651806, 1, 1, 1, 1, 1,
-1.593855, -0.6621314, -3.438055, 1, 1, 1, 1, 1,
-1.593483, 0.3881633, -1.720042, 1, 1, 1, 1, 1,
-1.583469, -0.9804658, -1.79321, 1, 1, 1, 1, 1,
-1.565418, 0.5544005, -1.438511, 1, 1, 1, 1, 1,
-1.559073, -0.9175222, -3.507767, 1, 1, 1, 1, 1,
-1.558353, -0.1437427, -3.328975, 1, 1, 1, 1, 1,
-1.558196, 0.1318043, -1.898102, 1, 1, 1, 1, 1,
-1.551399, 0.6248628, -1.517403, 0, 0, 1, 1, 1,
-1.549998, 1.231992, -1.338802, 1, 0, 0, 1, 1,
-1.541142, 0.01923058, -2.330613, 1, 0, 0, 1, 1,
-1.537224, -0.2786146, -0.3153044, 1, 0, 0, 1, 1,
-1.530612, -1.723648, -2.988423, 1, 0, 0, 1, 1,
-1.515993, 0.5290437, -1.225566, 1, 0, 0, 1, 1,
-1.510565, -0.2493228, -1.905724, 0, 0, 0, 1, 1,
-1.509838, -1.478873, -4.914574, 0, 0, 0, 1, 1,
-1.509826, 1.244617, -0.9526587, 0, 0, 0, 1, 1,
-1.509712, 0.4963408, -0.1742307, 0, 0, 0, 1, 1,
-1.502997, 0.2006092, -1.541021, 0, 0, 0, 1, 1,
-1.5022, 1.604967, -1.412006, 0, 0, 0, 1, 1,
-1.498386, 0.8387655, -2.60333, 0, 0, 0, 1, 1,
-1.48446, -1.893846, -3.642452, 1, 1, 1, 1, 1,
-1.48124, 0.1601897, -3.452211, 1, 1, 1, 1, 1,
-1.471552, -0.3873819, -2.078097, 1, 1, 1, 1, 1,
-1.470377, 0.5708443, -1.177463, 1, 1, 1, 1, 1,
-1.445666, 1.569785, -1.208494, 1, 1, 1, 1, 1,
-1.442552, 0.2479797, -1.333741, 1, 1, 1, 1, 1,
-1.422031, -1.785995, -2.11213, 1, 1, 1, 1, 1,
-1.420242, 0.05266967, -1.216697, 1, 1, 1, 1, 1,
-1.400787, 0.7123242, -0.8488553, 1, 1, 1, 1, 1,
-1.398009, 0.1137944, -1.744655, 1, 1, 1, 1, 1,
-1.395086, -1.406944, -0.3492486, 1, 1, 1, 1, 1,
-1.393589, 0.3718941, -0.7562758, 1, 1, 1, 1, 1,
-1.382121, -0.7373516, -1.593635, 1, 1, 1, 1, 1,
-1.374875, -0.2695787, -0.357641, 1, 1, 1, 1, 1,
-1.367237, -0.3707604, -2.406073, 1, 1, 1, 1, 1,
-1.356906, 0.0960379, -1.218733, 0, 0, 1, 1, 1,
-1.349612, 1.43562, -0.5219678, 1, 0, 0, 1, 1,
-1.337911, -0.1418996, -1.853955, 1, 0, 0, 1, 1,
-1.337871, -1.472921, -1.972279, 1, 0, 0, 1, 1,
-1.326924, -1.733911, -3.03897, 1, 0, 0, 1, 1,
-1.318683, -0.2073283, -1.906364, 1, 0, 0, 1, 1,
-1.31762, 2.315055, -0.1799105, 0, 0, 0, 1, 1,
-1.313521, -0.3394795, -0.4686338, 0, 0, 0, 1, 1,
-1.297652, 0.4524685, -2.273755, 0, 0, 0, 1, 1,
-1.297461, 0.8849085, -1.401404, 0, 0, 0, 1, 1,
-1.290483, 0.636106, -3.629913, 0, 0, 0, 1, 1,
-1.287217, 0.5277974, -1.734932, 0, 0, 0, 1, 1,
-1.283474, 0.1143116, -0.2234404, 0, 0, 0, 1, 1,
-1.278798, 0.772576, 0.4126539, 1, 1, 1, 1, 1,
-1.249377, -0.553606, -2.087536, 1, 1, 1, 1, 1,
-1.248521, 0.2521892, -0.8570037, 1, 1, 1, 1, 1,
-1.247737, 1.542949, -2.090062, 1, 1, 1, 1, 1,
-1.243865, -0.7298668, -1.176974, 1, 1, 1, 1, 1,
-1.243427, 0.215476, -0.5337319, 1, 1, 1, 1, 1,
-1.239448, 1.230138, -0.9556244, 1, 1, 1, 1, 1,
-1.237941, -0.4638704, -1.116277, 1, 1, 1, 1, 1,
-1.235199, -0.00766824, -2.19231, 1, 1, 1, 1, 1,
-1.223284, 0.2262888, -0.914473, 1, 1, 1, 1, 1,
-1.21016, 0.3807957, -1.611266, 1, 1, 1, 1, 1,
-1.195735, -0.383932, -1.686001, 1, 1, 1, 1, 1,
-1.195551, -2.126884, -1.844687, 1, 1, 1, 1, 1,
-1.176756, -0.8945182, -1.685962, 1, 1, 1, 1, 1,
-1.166908, -0.8785375, -3.315519, 1, 1, 1, 1, 1,
-1.162435, 0.6654263, -1.203318, 0, 0, 1, 1, 1,
-1.161911, -1.470171, -1.753773, 1, 0, 0, 1, 1,
-1.160042, 0.01900507, -2.535542, 1, 0, 0, 1, 1,
-1.150767, -0.5202528, -3.107828, 1, 0, 0, 1, 1,
-1.146483, 0.5096502, 0.1888713, 1, 0, 0, 1, 1,
-1.141824, 0.2001614, -0.637392, 1, 0, 0, 1, 1,
-1.141771, -1.426352, -1.912141, 0, 0, 0, 1, 1,
-1.140178, 0.3160086, -2.441254, 0, 0, 0, 1, 1,
-1.132861, 0.6350737, -1.991975, 0, 0, 0, 1, 1,
-1.132562, -0.839256, -0.7564362, 0, 0, 0, 1, 1,
-1.131052, -0.2243661, -2.983768, 0, 0, 0, 1, 1,
-1.129957, -1.499397, -2.448022, 0, 0, 0, 1, 1,
-1.128332, -0.8243021, -1.984269, 0, 0, 0, 1, 1,
-1.126605, 0.03000989, -0.4542389, 1, 1, 1, 1, 1,
-1.125805, -0.2453008, -3.135561, 1, 1, 1, 1, 1,
-1.120158, 1.135274, -1.284368, 1, 1, 1, 1, 1,
-1.114678, -1.528578, -4.469892, 1, 1, 1, 1, 1,
-1.110767, -0.9832347, -3.271778, 1, 1, 1, 1, 1,
-1.109173, -0.8959369, -2.622797, 1, 1, 1, 1, 1,
-1.095183, -1.811806, -2.680682, 1, 1, 1, 1, 1,
-1.090822, 0.0008408899, -0.6168161, 1, 1, 1, 1, 1,
-1.083289, -0.7081056, -2.677646, 1, 1, 1, 1, 1,
-1.07838, -0.1813393, -1.659946, 1, 1, 1, 1, 1,
-1.067791, 0.05938475, -0.8656324, 1, 1, 1, 1, 1,
-1.064864, 0.8608956, -2.096373, 1, 1, 1, 1, 1,
-1.058505, -0.01174079, -2.298629, 1, 1, 1, 1, 1,
-1.046978, -0.7599064, -1.732836, 1, 1, 1, 1, 1,
-1.044795, -0.6354554, -3.611834, 1, 1, 1, 1, 1,
-1.044421, 1.225738, -1.574455, 0, 0, 1, 1, 1,
-1.044217, 1.064046, 0.2133675, 1, 0, 0, 1, 1,
-1.04121, -0.4762183, -2.650417, 1, 0, 0, 1, 1,
-1.027084, 1.166346, -0.5318304, 1, 0, 0, 1, 1,
-1.016375, -0.6192341, -2.719153, 1, 0, 0, 1, 1,
-1.009513, -1.826432, -3.291842, 1, 0, 0, 1, 1,
-1.008253, -0.5015691, -1.381747, 0, 0, 0, 1, 1,
-1.00686, 0.7992269, -1.666036, 0, 0, 0, 1, 1,
-0.9999968, -0.07115401, -2.407243, 0, 0, 0, 1, 1,
-0.9868895, -1.619014, -1.38801, 0, 0, 0, 1, 1,
-0.9865157, 1.986421, 1.762287, 0, 0, 0, 1, 1,
-0.9800074, -0.1240322, -2.264936, 0, 0, 0, 1, 1,
-0.9754436, -0.44387, -2.209405, 0, 0, 0, 1, 1,
-0.962725, 0.82655, 0.04344896, 1, 1, 1, 1, 1,
-0.961237, -1.034075, -1.512563, 1, 1, 1, 1, 1,
-0.9562821, 0.5027971, -1.461229, 1, 1, 1, 1, 1,
-0.9545218, -0.1716383, -1.666408, 1, 1, 1, 1, 1,
-0.9540758, -0.2804261, -1.137607, 1, 1, 1, 1, 1,
-0.9510624, 0.7450551, -0.07646577, 1, 1, 1, 1, 1,
-0.9472401, -0.5237753, -3.423215, 1, 1, 1, 1, 1,
-0.9374738, 1.090738, -1.869759, 1, 1, 1, 1, 1,
-0.9364989, 0.06738596, -0.8929179, 1, 1, 1, 1, 1,
-0.9338285, -0.07193947, -1.358078, 1, 1, 1, 1, 1,
-0.9314409, -0.1526555, -2.241596, 1, 1, 1, 1, 1,
-0.9298831, 0.2382636, -1.753413, 1, 1, 1, 1, 1,
-0.9245547, -0.549189, -3.322206, 1, 1, 1, 1, 1,
-0.9230936, 1.536305, 1.358622, 1, 1, 1, 1, 1,
-0.9196979, -0.3714085, -1.761586, 1, 1, 1, 1, 1,
-0.915934, -1.039474, -1.258698, 0, 0, 1, 1, 1,
-0.9123179, -0.4198852, -2.634718, 1, 0, 0, 1, 1,
-0.9031053, -0.2495984, -1.659111, 1, 0, 0, 1, 1,
-0.9023341, 0.4460578, -0.3539346, 1, 0, 0, 1, 1,
-0.9000185, -0.1744387, -2.52671, 1, 0, 0, 1, 1,
-0.8965256, -2.051393, -1.585663, 1, 0, 0, 1, 1,
-0.8945746, -0.6766146, -2.280739, 0, 0, 0, 1, 1,
-0.8913741, 1.009933, -1.434691, 0, 0, 0, 1, 1,
-0.8896203, 0.4817179, 0.01288244, 0, 0, 0, 1, 1,
-0.885406, -0.01997608, -2.706457, 0, 0, 0, 1, 1,
-0.8837879, 0.9975958, -0.4198563, 0, 0, 0, 1, 1,
-0.8836578, -0.7113857, -2.156595, 0, 0, 0, 1, 1,
-0.8754212, 0.2051858, -2.861653, 0, 0, 0, 1, 1,
-0.872173, -0.8548831, -1.708624, 1, 1, 1, 1, 1,
-0.8657705, 1.291903, -1.845699, 1, 1, 1, 1, 1,
-0.8596612, 0.2192171, -2.374256, 1, 1, 1, 1, 1,
-0.8585908, -0.6808696, -1.399773, 1, 1, 1, 1, 1,
-0.8578113, 0.6384156, 1.648899, 1, 1, 1, 1, 1,
-0.8573022, -0.5579335, -2.961063, 1, 1, 1, 1, 1,
-0.8571154, -0.9241568, -2.746942, 1, 1, 1, 1, 1,
-0.8495964, -0.3831818, -1.898259, 1, 1, 1, 1, 1,
-0.8471953, 0.09441962, -0.392837, 1, 1, 1, 1, 1,
-0.8471049, -1.849721, -1.586501, 1, 1, 1, 1, 1,
-0.8391353, -0.3718613, -1.902479, 1, 1, 1, 1, 1,
-0.8366024, -0.4016178, -3.310702, 1, 1, 1, 1, 1,
-0.8336868, 1.535187, 0.5083376, 1, 1, 1, 1, 1,
-0.8305597, -1.133785, -1.892654, 1, 1, 1, 1, 1,
-0.8246939, 0.1907521, -1.330579, 1, 1, 1, 1, 1,
-0.8227649, -0.2748674, -1.787268, 0, 0, 1, 1, 1,
-0.8125138, -0.4684841, -2.808004, 1, 0, 0, 1, 1,
-0.8061321, 0.3552906, -2.016554, 1, 0, 0, 1, 1,
-0.7971836, -1.305275, -2.072057, 1, 0, 0, 1, 1,
-0.7968729, 1.125033, -1.06249, 1, 0, 0, 1, 1,
-0.7843209, 0.4039988, -2.473194, 1, 0, 0, 1, 1,
-0.7791008, -1.893129, -2.437919, 0, 0, 0, 1, 1,
-0.778856, -0.6578059, -3.729007, 0, 0, 0, 1, 1,
-0.7769857, 1.165143, -0.5526253, 0, 0, 0, 1, 1,
-0.7733763, 0.3987665, -1.622605, 0, 0, 0, 1, 1,
-0.7714587, 0.7583247, -1.400431, 0, 0, 0, 1, 1,
-0.7706867, -0.5771964, -2.001936, 0, 0, 0, 1, 1,
-0.7704913, 1.512765, -0.9578751, 0, 0, 0, 1, 1,
-0.7704032, 0.5374181, -1.764611, 1, 1, 1, 1, 1,
-0.7694995, 0.7817847, -2.393322, 1, 1, 1, 1, 1,
-0.7668093, 0.4199151, -1.653362, 1, 1, 1, 1, 1,
-0.7624572, 0.9142932, -0.4775452, 1, 1, 1, 1, 1,
-0.7605889, 0.2147334, -1.420693, 1, 1, 1, 1, 1,
-0.7596558, 0.07189126, -1.842247, 1, 1, 1, 1, 1,
-0.748872, 0.9169729, 0.7973745, 1, 1, 1, 1, 1,
-0.7416092, -0.5577397, -1.99305, 1, 1, 1, 1, 1,
-0.7405232, -0.5573091, -2.65579, 1, 1, 1, 1, 1,
-0.7399896, 0.5869291, 0.162768, 1, 1, 1, 1, 1,
-0.7394202, -0.1322712, -2.145474, 1, 1, 1, 1, 1,
-0.7388176, -1.230482, -2.841454, 1, 1, 1, 1, 1,
-0.7339345, 0.5998041, -0.6524876, 1, 1, 1, 1, 1,
-0.7243705, -0.1770837, -0.2840528, 1, 1, 1, 1, 1,
-0.7235057, -0.7510805, -1.818753, 1, 1, 1, 1, 1,
-0.7157359, 1.406898, 1.215883, 0, 0, 1, 1, 1,
-0.7133613, -1.633125, -1.728047, 1, 0, 0, 1, 1,
-0.7131358, 0.3632804, -0.008234074, 1, 0, 0, 1, 1,
-0.7077686, 0.7544476, 0.6307038, 1, 0, 0, 1, 1,
-0.7015141, 0.8931157, -0.5337053, 1, 0, 0, 1, 1,
-0.7009269, -0.7197573, -2.072698, 1, 0, 0, 1, 1,
-0.6981781, -0.03914867, -1.913856, 0, 0, 0, 1, 1,
-0.683161, -0.00791596, -1.695058, 0, 0, 0, 1, 1,
-0.6809445, -0.03887096, 0.5723507, 0, 0, 0, 1, 1,
-0.6743733, 0.3643193, -1.582517, 0, 0, 0, 1, 1,
-0.6742632, 1.733457, -0.5777369, 0, 0, 0, 1, 1,
-0.672202, 0.7727669, 0.2150232, 0, 0, 0, 1, 1,
-0.6720474, 1.171202, 0.3857377, 0, 0, 0, 1, 1,
-0.6718137, 0.9455245, -0.8602879, 1, 1, 1, 1, 1,
-0.6697245, 0.4449973, 1.817519, 1, 1, 1, 1, 1,
-0.6659996, -1.148313, -2.894378, 1, 1, 1, 1, 1,
-0.6652828, 1.0402, -0.7527149, 1, 1, 1, 1, 1,
-0.6636665, -0.5571929, -0.8324314, 1, 1, 1, 1, 1,
-0.6620548, -0.5983873, -2.977214, 1, 1, 1, 1, 1,
-0.6572834, -1.664582, -2.710588, 1, 1, 1, 1, 1,
-0.6560881, 1.975531, -0.4629711, 1, 1, 1, 1, 1,
-0.6526386, 0.3301681, -0.7346905, 1, 1, 1, 1, 1,
-0.6521659, -1.260309, -2.677749, 1, 1, 1, 1, 1,
-0.6515812, -1.855418, -2.502843, 1, 1, 1, 1, 1,
-0.6496192, 2.245839, 1.088606, 1, 1, 1, 1, 1,
-0.646975, -0.01976769, -1.987635, 1, 1, 1, 1, 1,
-0.6440369, 0.177338, -0.7050965, 1, 1, 1, 1, 1,
-0.6409623, -0.05238676, -2.533683, 1, 1, 1, 1, 1,
-0.6399594, 0.6418858, -1.03083, 0, 0, 1, 1, 1,
-0.6366653, -0.02592192, -2.207408, 1, 0, 0, 1, 1,
-0.6365773, -1.586571, -4.440567, 1, 0, 0, 1, 1,
-0.6313426, -1.189894, -3.424065, 1, 0, 0, 1, 1,
-0.6313248, -1.072619, -1.185472, 1, 0, 0, 1, 1,
-0.6227266, 0.04974898, -0.341283, 1, 0, 0, 1, 1,
-0.6225737, -0.9481445, -1.894135, 0, 0, 0, 1, 1,
-0.6114736, -1.699923, -3.525696, 0, 0, 0, 1, 1,
-0.6105502, 0.2708351, -1.829927, 0, 0, 0, 1, 1,
-0.6097259, 0.210765, -1.857603, 0, 0, 0, 1, 1,
-0.6017554, 0.2111669, -0.8004386, 0, 0, 0, 1, 1,
-0.6013924, 0.3976909, -1.201789, 0, 0, 0, 1, 1,
-0.6007608, 0.185851, -1.833797, 0, 0, 0, 1, 1,
-0.5932107, 0.5185572, -0.9679388, 1, 1, 1, 1, 1,
-0.5879408, -0.0816837, -0.1929675, 1, 1, 1, 1, 1,
-0.5860645, -0.5273066, -1.82138, 1, 1, 1, 1, 1,
-0.5856202, 1.075028, -2.121464, 1, 1, 1, 1, 1,
-0.5850984, 1.080052, -2.210905, 1, 1, 1, 1, 1,
-0.5818164, 0.7042934, 0.8076631, 1, 1, 1, 1, 1,
-0.5812148, -1.176961, -3.42076, 1, 1, 1, 1, 1,
-0.5795143, 1.314029, 0.0003253966, 1, 1, 1, 1, 1,
-0.5765688, -1.414124, -0.6523694, 1, 1, 1, 1, 1,
-0.5744627, -0.6352915, -2.418694, 1, 1, 1, 1, 1,
-0.5686317, 1.740554, -2.030645, 1, 1, 1, 1, 1,
-0.5654913, -0.4427153, -2.475932, 1, 1, 1, 1, 1,
-0.5641923, -0.03513364, -3.769542, 1, 1, 1, 1, 1,
-0.5616801, -0.4065341, -0.7853472, 1, 1, 1, 1, 1,
-0.5583327, 0.3118236, -1.278767, 1, 1, 1, 1, 1,
-0.5539323, 0.1039677, -0.1880835, 0, 0, 1, 1, 1,
-0.5535101, -0.6503118, -3.170393, 1, 0, 0, 1, 1,
-0.553427, -1.175365, -1.848244, 1, 0, 0, 1, 1,
-0.5512197, -0.3099221, -1.691493, 1, 0, 0, 1, 1,
-0.5506068, 0.8663051, 0.0783536, 1, 0, 0, 1, 1,
-0.5446228, 1.614405, -0.8701543, 1, 0, 0, 1, 1,
-0.5393533, 0.1130697, -1.246999, 0, 0, 0, 1, 1,
-0.5365947, -0.6483565, -3.606721, 0, 0, 0, 1, 1,
-0.5352293, -0.2233672, -1.017095, 0, 0, 0, 1, 1,
-0.5336997, 0.2490963, -0.1754563, 0, 0, 0, 1, 1,
-0.5294876, 0.03766347, -1.083474, 0, 0, 0, 1, 1,
-0.5288171, 0.4927572, 0.1069319, 0, 0, 0, 1, 1,
-0.5251673, 0.1318337, 0.7622199, 0, 0, 0, 1, 1,
-0.5140471, 0.9775265, -0.6613207, 1, 1, 1, 1, 1,
-0.5132723, 0.1890504, -2.666689, 1, 1, 1, 1, 1,
-0.5080699, -0.4807999, -2.886932, 1, 1, 1, 1, 1,
-0.5064809, -0.7174147, -2.82921, 1, 1, 1, 1, 1,
-0.5064359, -0.6520169, -2.712597, 1, 1, 1, 1, 1,
-0.5054159, 0.04996223, -1.6957, 1, 1, 1, 1, 1,
-0.5038434, -1.654364, -3.121612, 1, 1, 1, 1, 1,
-0.5032911, -0.8974429, -2.262476, 1, 1, 1, 1, 1,
-0.5017029, -0.1179905, -0.8993196, 1, 1, 1, 1, 1,
-0.501153, 1.614064, -0.7087554, 1, 1, 1, 1, 1,
-0.4977854, -1.527052, -2.480005, 1, 1, 1, 1, 1,
-0.4951008, -0.7082714, -1.315591, 1, 1, 1, 1, 1,
-0.4941582, -0.09954952, -3.890167, 1, 1, 1, 1, 1,
-0.4896506, -1.578793, -1.741274, 1, 1, 1, 1, 1,
-0.4863774, -2.262348, -4.379328, 1, 1, 1, 1, 1,
-0.4758208, -1.412054, -4.060207, 0, 0, 1, 1, 1,
-0.4738776, -0.3019385, -3.260478, 1, 0, 0, 1, 1,
-0.471352, -0.2011869, -2.361601, 1, 0, 0, 1, 1,
-0.4713144, -0.4688226, -2.044909, 1, 0, 0, 1, 1,
-0.4707828, -0.9252974, -3.44689, 1, 0, 0, 1, 1,
-0.4691886, 0.04408241, 1.029309, 1, 0, 0, 1, 1,
-0.4670571, 0.4754871, -2.738358, 0, 0, 0, 1, 1,
-0.4611698, -0.001396813, -1.753335, 0, 0, 0, 1, 1,
-0.4605673, -0.6195703, -2.089235, 0, 0, 0, 1, 1,
-0.4603854, 2.04798, 0.6261001, 0, 0, 0, 1, 1,
-0.4583978, -2.359728, -3.418044, 0, 0, 0, 1, 1,
-0.4506386, 0.5178096, -2.159707, 0, 0, 0, 1, 1,
-0.4380867, 0.1910912, -1.309271, 0, 0, 0, 1, 1,
-0.4351524, -1.720544, -2.610019, 1, 1, 1, 1, 1,
-0.4327056, -0.3424803, -3.271656, 1, 1, 1, 1, 1,
-0.4261396, -0.3606758, -1.733559, 1, 1, 1, 1, 1,
-0.4186405, -0.09002531, -2.376536, 1, 1, 1, 1, 1,
-0.4184351, -0.4444085, -2.623608, 1, 1, 1, 1, 1,
-0.4165987, 0.7404035, -0.6240878, 1, 1, 1, 1, 1,
-0.4163059, -0.6055704, -2.859388, 1, 1, 1, 1, 1,
-0.4146188, -0.3871483, -1.482145, 1, 1, 1, 1, 1,
-0.4139957, 0.7107138, 0.07440166, 1, 1, 1, 1, 1,
-0.4138063, 2.546658, -0.9380209, 1, 1, 1, 1, 1,
-0.4083763, -1.540823, -2.892753, 1, 1, 1, 1, 1,
-0.4064515, -1.579023, -3.205102, 1, 1, 1, 1, 1,
-0.4039482, 1.35112, 0.4935506, 1, 1, 1, 1, 1,
-0.4013653, -1.762875, -3.813407, 1, 1, 1, 1, 1,
-0.401131, -0.391275, -1.744409, 1, 1, 1, 1, 1,
-0.3992746, 0.7716417, -0.07394738, 0, 0, 1, 1, 1,
-0.397624, -0.06736363, -0.3890345, 1, 0, 0, 1, 1,
-0.3960527, -0.04608156, -2.071926, 1, 0, 0, 1, 1,
-0.3941542, 2.630285, 0.1310419, 1, 0, 0, 1, 1,
-0.3922107, -0.4172771, -1.456049, 1, 0, 0, 1, 1,
-0.3920324, -1.310292, -3.560106, 1, 0, 0, 1, 1,
-0.3882885, 1.157318, 0.479671, 0, 0, 0, 1, 1,
-0.3880537, -0.09811731, -2.249533, 0, 0, 0, 1, 1,
-0.3853535, -0.7393107, -4.123545, 0, 0, 0, 1, 1,
-0.3765157, -1.362459, -1.438488, 0, 0, 0, 1, 1,
-0.3739103, -0.08364397, -2.441087, 0, 0, 0, 1, 1,
-0.3712978, -1.463057, -2.798624, 0, 0, 0, 1, 1,
-0.3679703, -0.4526267, -2.484311, 0, 0, 0, 1, 1,
-0.3679556, -0.6479277, -2.30964, 1, 1, 1, 1, 1,
-0.3663661, 0.9428287, -1.785418, 1, 1, 1, 1, 1,
-0.3632989, -0.5134637, -1.120473, 1, 1, 1, 1, 1,
-0.3585464, 0.8944607, 0.4436023, 1, 1, 1, 1, 1,
-0.3550789, 0.002263191, -1.34112, 1, 1, 1, 1, 1,
-0.3516245, 0.8217297, -0.09979963, 1, 1, 1, 1, 1,
-0.3470564, -0.2626877, -1.646713, 1, 1, 1, 1, 1,
-0.3453744, -0.4303738, -3.05512, 1, 1, 1, 1, 1,
-0.3411846, -0.3914156, -2.134598, 1, 1, 1, 1, 1,
-0.339818, 0.02362702, -4.346832, 1, 1, 1, 1, 1,
-0.3384493, -0.7523847, -4.312617, 1, 1, 1, 1, 1,
-0.3329555, 0.6719359, 0.645783, 1, 1, 1, 1, 1,
-0.3305485, 0.728322, -0.09429441, 1, 1, 1, 1, 1,
-0.3263854, -2.671223, -4.703655, 1, 1, 1, 1, 1,
-0.3258268, -0.3797792, -1.987335, 1, 1, 1, 1, 1,
-0.3252574, 0.1956183, -2.02614, 0, 0, 1, 1, 1,
-0.3251239, 1.308297, -1.607117, 1, 0, 0, 1, 1,
-0.3219071, -0.3022568, -1.82513, 1, 0, 0, 1, 1,
-0.3219021, 0.275394, -0.7254199, 1, 0, 0, 1, 1,
-0.321875, 1.665268, -0.8598948, 1, 0, 0, 1, 1,
-0.319452, -0.2773674, -1.768902, 1, 0, 0, 1, 1,
-0.3175423, 0.8746383, -1.060077, 0, 0, 0, 1, 1,
-0.3131616, -1.375902, -5.123525, 0, 0, 0, 1, 1,
-0.3119179, -0.07737915, -0.3786587, 0, 0, 0, 1, 1,
-0.3107854, 0.2526799, -2.254893, 0, 0, 0, 1, 1,
-0.3106237, -0.2665586, -2.769847, 0, 0, 0, 1, 1,
-0.3076202, 0.2469886, -1.300955, 0, 0, 0, 1, 1,
-0.3069535, 2.397, -1.158956, 0, 0, 0, 1, 1,
-0.3015293, -1.038232, -1.846584, 1, 1, 1, 1, 1,
-0.2948655, -1.602743, -2.524207, 1, 1, 1, 1, 1,
-0.2933554, 0.9196963, 0.6030709, 1, 1, 1, 1, 1,
-0.2895641, -1.361585, -2.83828, 1, 1, 1, 1, 1,
-0.2869185, 0.9652144, -0.8632815, 1, 1, 1, 1, 1,
-0.2863282, -1.985723, -1.999086, 1, 1, 1, 1, 1,
-0.2854879, -0.6495496, -3.482626, 1, 1, 1, 1, 1,
-0.2850906, 1.239094, 0.538379, 1, 1, 1, 1, 1,
-0.2842801, 0.2006745, -0.418244, 1, 1, 1, 1, 1,
-0.2842318, -0.6570461, -2.770727, 1, 1, 1, 1, 1,
-0.2838164, 0.008879085, -2.346837, 1, 1, 1, 1, 1,
-0.2836925, -0.8194101, -4.380792, 1, 1, 1, 1, 1,
-0.2831192, 1.722541, -0.6109965, 1, 1, 1, 1, 1,
-0.2803823, 0.3679227, -1.173854, 1, 1, 1, 1, 1,
-0.2775599, 0.5441501, 0.5974955, 1, 1, 1, 1, 1,
-0.2734837, 0.6097508, 0.8383721, 0, 0, 1, 1, 1,
-0.2706518, -0.3649025, -2.408332, 1, 0, 0, 1, 1,
-0.2693267, 0.7272474, -0.04157075, 1, 0, 0, 1, 1,
-0.2630125, -2.044241, -4.333084, 1, 0, 0, 1, 1,
-0.2614465, 0.01751331, -1.427083, 1, 0, 0, 1, 1,
-0.2596802, 0.8337435, 0.9101124, 1, 0, 0, 1, 1,
-0.2590458, 0.3958074, -0.1761796, 0, 0, 0, 1, 1,
-0.2587126, 0.3594789, 0.209118, 0, 0, 0, 1, 1,
-0.2552296, -0.2851976, -1.626756, 0, 0, 0, 1, 1,
-0.2530541, -1.021773, -2.080643, 0, 0, 0, 1, 1,
-0.2521362, 0.05975923, 0.08301844, 0, 0, 0, 1, 1,
-0.2482155, 1.300049, -1.139912, 0, 0, 0, 1, 1,
-0.246417, -0.4856873, -3.06543, 0, 0, 0, 1, 1,
-0.2448378, -0.7477407, -2.631974, 1, 1, 1, 1, 1,
-0.2432553, 0.08296601, 0.8365508, 1, 1, 1, 1, 1,
-0.2413691, 0.8492748, -1.822423, 1, 1, 1, 1, 1,
-0.2405507, 0.7433457, -2.200053, 1, 1, 1, 1, 1,
-0.2383059, 0.3449384, -0.3344699, 1, 1, 1, 1, 1,
-0.2361711, -1.103674, -2.636337, 1, 1, 1, 1, 1,
-0.2361634, 0.7283415, -1.951267, 1, 1, 1, 1, 1,
-0.2336662, -0.9377972, -3.147259, 1, 1, 1, 1, 1,
-0.2327216, 0.2431692, -3.1408, 1, 1, 1, 1, 1,
-0.2290944, 0.5043361, 0.2600716, 1, 1, 1, 1, 1,
-0.2279703, -0.6102184, -5.145256, 1, 1, 1, 1, 1,
-0.2204371, -0.2243605, -1.92461, 1, 1, 1, 1, 1,
-0.2186448, -0.0444595, -2.0145, 1, 1, 1, 1, 1,
-0.2139757, -1.365205, -3.522372, 1, 1, 1, 1, 1,
-0.2091702, -0.20131, -2.977927, 1, 1, 1, 1, 1,
-0.2062843, 0.7885296, 0.2743935, 0, 0, 1, 1, 1,
-0.1966725, -0.8541106, -3.252563, 1, 0, 0, 1, 1,
-0.1943137, 0.5756713, -1.627836, 1, 0, 0, 1, 1,
-0.1922527, 0.7386195, -0.8177847, 1, 0, 0, 1, 1,
-0.1916347, -1.201267, -2.787694, 1, 0, 0, 1, 1,
-0.1915539, 0.9007642, -0.2471139, 1, 0, 0, 1, 1,
-0.1829973, 0.8039836, 0.7488912, 0, 0, 0, 1, 1,
-0.1789337, -1.028729, -3.346685, 0, 0, 0, 1, 1,
-0.1671918, -0.6019861, -3.206209, 0, 0, 0, 1, 1,
-0.1661019, 0.6584715, 0.8000264, 0, 0, 0, 1, 1,
-0.1633821, -0.40532, -1.967975, 0, 0, 0, 1, 1,
-0.1562399, -0.08059052, -2.8962, 0, 0, 0, 1, 1,
-0.1548634, -0.09619959, -2.680724, 0, 0, 0, 1, 1,
-0.1542323, 0.9006519, 0.3138091, 1, 1, 1, 1, 1,
-0.1530952, 1.83664, 1.105467, 1, 1, 1, 1, 1,
-0.1520635, 0.3045377, -0.203334, 1, 1, 1, 1, 1,
-0.1496967, 1.021249, 0.3510042, 1, 1, 1, 1, 1,
-0.1435668, -1.417551, -2.73718, 1, 1, 1, 1, 1,
-0.1393228, -0.8339377, -4.758208, 1, 1, 1, 1, 1,
-0.138945, -0.5799053, -4.124561, 1, 1, 1, 1, 1,
-0.1356066, 1.031745, -1.117659, 1, 1, 1, 1, 1,
-0.1355195, -0.7475951, -2.273803, 1, 1, 1, 1, 1,
-0.134544, 1.662971, -1.337333, 1, 1, 1, 1, 1,
-0.1343485, -0.6081971, -1.821158, 1, 1, 1, 1, 1,
-0.1315765, 0.2997566, -0.6386645, 1, 1, 1, 1, 1,
-0.1266488, 2.370858, -0.3081028, 1, 1, 1, 1, 1,
-0.1259567, 0.9264879, -0.41915, 1, 1, 1, 1, 1,
-0.1256407, -0.6251603, -2.481044, 1, 1, 1, 1, 1,
-0.1207409, 0.353228, -2.104137, 0, 0, 1, 1, 1,
-0.1194214, 0.6766388, -1.78716, 1, 0, 0, 1, 1,
-0.1161419, -0.9335651, -2.856199, 1, 0, 0, 1, 1,
-0.1145273, -0.6979544, -2.709892, 1, 0, 0, 1, 1,
-0.113801, 1.201246, 0.6139222, 1, 0, 0, 1, 1,
-0.1134269, -0.6869498, -2.239568, 1, 0, 0, 1, 1,
-0.1127208, 0.6102675, -1.009892, 0, 0, 0, 1, 1,
-0.1043414, -0.4243986, -3.47982, 0, 0, 0, 1, 1,
-0.1003099, -0.006628843, -1.712656, 0, 0, 0, 1, 1,
-0.09917679, -0.6559546, -3.648537, 0, 0, 0, 1, 1,
-0.09754594, -0.01891993, -2.012106, 0, 0, 0, 1, 1,
-0.09684667, -0.001249321, -2.567062, 0, 0, 0, 1, 1,
-0.09410264, 0.2412201, 0.1496976, 0, 0, 0, 1, 1,
-0.09398308, 0.02989849, 0.6583808, 1, 1, 1, 1, 1,
-0.0912762, -0.7978026, -2.638397, 1, 1, 1, 1, 1,
-0.08937427, -1.207507, -3.104331, 1, 1, 1, 1, 1,
-0.07811068, 0.8651199, 0.1247284, 1, 1, 1, 1, 1,
-0.0779745, -1.048526, -2.173629, 1, 1, 1, 1, 1,
-0.07454871, 0.4014195, -1.576325, 1, 1, 1, 1, 1,
-0.07346286, -1.67695, -3.954871, 1, 1, 1, 1, 1,
-0.07331911, -0.0443821, -0.665121, 1, 1, 1, 1, 1,
-0.07001497, -1.071231, -2.390824, 1, 1, 1, 1, 1,
-0.06987885, 0.2792404, 0.1980722, 1, 1, 1, 1, 1,
-0.06190495, 2.248499, -2.005099, 1, 1, 1, 1, 1,
-0.05969658, 1.995912, -1.632517, 1, 1, 1, 1, 1,
-0.05374606, -0.2817288, -2.250808, 1, 1, 1, 1, 1,
-0.04303995, -0.1277351, -2.639199, 1, 1, 1, 1, 1,
-0.04113182, 0.162456, -0.1985977, 1, 1, 1, 1, 1,
-0.03823765, 0.3206655, -1.185185, 0, 0, 1, 1, 1,
-0.03625707, -0.7425174, -2.336372, 1, 0, 0, 1, 1,
-0.03160583, 1.917644, 1.6666, 1, 0, 0, 1, 1,
-0.02992936, -1.706522, -3.034588, 1, 0, 0, 1, 1,
-0.02891782, -0.6651914, -3.704468, 1, 0, 0, 1, 1,
-0.02334641, -0.4055899, -3.285578, 1, 0, 0, 1, 1,
-0.01905885, -0.7874737, -3.673856, 0, 0, 0, 1, 1,
-0.01550459, 0.1835247, -1.451539, 0, 0, 0, 1, 1,
-0.01474628, -0.8613753, -1.635267, 0, 0, 0, 1, 1,
-0.01380105, 0.8504756, -0.4207967, 0, 0, 0, 1, 1,
-0.008723192, -0.154387, -3.482692, 0, 0, 0, 1, 1,
-0.008491256, -0.3182876, -3.213424, 0, 0, 0, 1, 1,
-0.007818431, 1.108717, 1.517788, 0, 0, 0, 1, 1,
-0.005022778, 0.4824284, -0.531356, 1, 1, 1, 1, 1,
0.0003385082, 1.006893, 1.007265, 1, 1, 1, 1, 1,
0.002193476, 2.638853, 0.1785126, 1, 1, 1, 1, 1,
0.002265802, 0.5092905, -0.3047412, 1, 1, 1, 1, 1,
0.0046853, 0.5495173, -0.07259168, 1, 1, 1, 1, 1,
0.006729469, -1.226087, 3.207472, 1, 1, 1, 1, 1,
0.01130395, -0.4219418, 3.663722, 1, 1, 1, 1, 1,
0.01476394, 1.099151, -1.03281, 1, 1, 1, 1, 1,
0.01570628, -1.161325, 1.96302, 1, 1, 1, 1, 1,
0.01594883, -0.3144018, 4.361744, 1, 1, 1, 1, 1,
0.01624035, -0.9251496, 2.785321, 1, 1, 1, 1, 1,
0.0179918, -0.09521182, 4.058399, 1, 1, 1, 1, 1,
0.02137876, 0.07218713, 2.09492, 1, 1, 1, 1, 1,
0.02442484, 0.2759164, -1.630008, 1, 1, 1, 1, 1,
0.03255333, 0.1412722, 0.02069673, 1, 1, 1, 1, 1,
0.0351228, 0.7026919, -0.54552, 0, 0, 1, 1, 1,
0.03515418, 0.7073404, -1.547547, 1, 0, 0, 1, 1,
0.03583995, -1.229354, 2.712976, 1, 0, 0, 1, 1,
0.03594984, -0.7250441, 3.424473, 1, 0, 0, 1, 1,
0.0374751, 0.4886367, 0.322172, 1, 0, 0, 1, 1,
0.03942247, -0.669534, 2.53843, 1, 0, 0, 1, 1,
0.04250731, 1.910483, 1.18155, 0, 0, 0, 1, 1,
0.04251423, 1.507588, -1.135634, 0, 0, 0, 1, 1,
0.04598965, -1.480843, 3.174563, 0, 0, 0, 1, 1,
0.04635317, -0.1451989, 2.31301, 0, 0, 0, 1, 1,
0.05014604, -0.4572306, 2.26478, 0, 0, 0, 1, 1,
0.05257769, -0.3172605, 3.996902, 0, 0, 0, 1, 1,
0.05793337, -0.9701574, 2.656634, 0, 0, 0, 1, 1,
0.07117774, -0.3544554, 1.979926, 1, 1, 1, 1, 1,
0.07170348, 0.2374164, -2.01992, 1, 1, 1, 1, 1,
0.0804698, 0.1100116, 0.8233122, 1, 1, 1, 1, 1,
0.08273272, -1.35207, 1.297771, 1, 1, 1, 1, 1,
0.08572807, -1.170417, 3.174014, 1, 1, 1, 1, 1,
0.08643292, 2.859211, -0.8062043, 1, 1, 1, 1, 1,
0.08753379, -0.5883609, 2.990253, 1, 1, 1, 1, 1,
0.08896141, 0.6074247, -0.4548882, 1, 1, 1, 1, 1,
0.09058143, -1.605981, 3.907002, 1, 1, 1, 1, 1,
0.09940491, -1.853229, 3.496231, 1, 1, 1, 1, 1,
0.1000766, -2.405764, 1.115686, 1, 1, 1, 1, 1,
0.1085299, 0.7686908, 1.194781, 1, 1, 1, 1, 1,
0.1087864, 0.7830483, 1.090992, 1, 1, 1, 1, 1,
0.1174333, -0.9419426, 3.651624, 1, 1, 1, 1, 1,
0.123118, 1.279238, 1.6861, 1, 1, 1, 1, 1,
0.1255977, -1.102305, 2.202209, 0, 0, 1, 1, 1,
0.1324899, -0.1928719, 3.184206, 1, 0, 0, 1, 1,
0.1363559, -1.040807, 2.021611, 1, 0, 0, 1, 1,
0.1384126, -0.2905665, 2.747281, 1, 0, 0, 1, 1,
0.1395249, -1.565014, 3.809807, 1, 0, 0, 1, 1,
0.1406796, -0.07315559, 2.151786, 1, 0, 0, 1, 1,
0.1447582, -0.2446542, 3.091517, 0, 0, 0, 1, 1,
0.1458438, -0.05819745, 2.571229, 0, 0, 0, 1, 1,
0.151207, -1.114924, 3.797946, 0, 0, 0, 1, 1,
0.1530589, 0.2918617, 1.263953, 0, 0, 0, 1, 1,
0.1555233, 1.15832, -0.6263634, 0, 0, 0, 1, 1,
0.1562146, -1.085701, 2.382709, 0, 0, 0, 1, 1,
0.1562483, -0.272651, 3.051606, 0, 0, 0, 1, 1,
0.1575623, 1.040523, -2.741817, 1, 1, 1, 1, 1,
0.1577954, 0.06835222, 2.428434, 1, 1, 1, 1, 1,
0.1583113, -0.1506413, 2.300287, 1, 1, 1, 1, 1,
0.1603913, 0.9866601, 0.5101607, 1, 1, 1, 1, 1,
0.1678979, 1.658368, 0.1298738, 1, 1, 1, 1, 1,
0.1687869, 0.02447262, 1.319844, 1, 1, 1, 1, 1,
0.1710868, -0.4051884, 1.042332, 1, 1, 1, 1, 1,
0.1756878, 1.051421, 0.9169992, 1, 1, 1, 1, 1,
0.1799563, -0.312649, 3.317825, 1, 1, 1, 1, 1,
0.1824919, 0.4344101, 1.083489, 1, 1, 1, 1, 1,
0.1836049, -0.2445, 3.17838, 1, 1, 1, 1, 1,
0.1872954, -0.718459, 2.151033, 1, 1, 1, 1, 1,
0.1947137, -0.2753284, 1.079228, 1, 1, 1, 1, 1,
0.196316, 0.7032856, 2.564121, 1, 1, 1, 1, 1,
0.1983308, 0.3768977, 1.987582, 1, 1, 1, 1, 1,
0.2007469, 2.371015, 0.7996554, 0, 0, 1, 1, 1,
0.2016464, 0.4329249, -0.1502883, 1, 0, 0, 1, 1,
0.2052337, -0.5420559, 2.182902, 1, 0, 0, 1, 1,
0.2071158, 0.2807792, 0.5735922, 1, 0, 0, 1, 1,
0.208343, -2.386919, 2.439683, 1, 0, 0, 1, 1,
0.2124041, -1.15872, 2.769045, 1, 0, 0, 1, 1,
0.2131672, -0.1797512, 1.54303, 0, 0, 0, 1, 1,
0.2132659, 1.201236, -1.19769, 0, 0, 0, 1, 1,
0.213298, 0.8810521, 1.173312, 0, 0, 0, 1, 1,
0.2183978, -0.402046, 1.634575, 0, 0, 0, 1, 1,
0.2187427, -2.042645, 3.815111, 0, 0, 0, 1, 1,
0.2203887, -0.6111785, 3.242152, 0, 0, 0, 1, 1,
0.2207413, -0.127096, 2.891903, 0, 0, 0, 1, 1,
0.2263295, -1.424543, 3.509941, 1, 1, 1, 1, 1,
0.2265233, 1.370408, 0.8645318, 1, 1, 1, 1, 1,
0.229942, 0.5989838, 1.562919, 1, 1, 1, 1, 1,
0.2317237, -1.193319, 3.652475, 1, 1, 1, 1, 1,
0.2327523, 0.06764076, 2.350234, 1, 1, 1, 1, 1,
0.2330975, -3.46016, 3.926411, 1, 1, 1, 1, 1,
0.2361735, 0.1490745, 2.230942, 1, 1, 1, 1, 1,
0.2370754, 0.217882, 1.76924, 1, 1, 1, 1, 1,
0.2395904, -0.6814102, 2.912869, 1, 1, 1, 1, 1,
0.2416714, -0.6338847, 2.140746, 1, 1, 1, 1, 1,
0.2421048, -0.9321022, 3.24666, 1, 1, 1, 1, 1,
0.2439201, -1.139563, 5.070688, 1, 1, 1, 1, 1,
0.2447349, -0.2555393, 2.33972, 1, 1, 1, 1, 1,
0.2461339, -0.3033203, 2.297668, 1, 1, 1, 1, 1,
0.2465993, -1.563488, 3.025982, 1, 1, 1, 1, 1,
0.2483868, 0.05583502, 1.402663, 0, 0, 1, 1, 1,
0.2500217, 0.8542307, 0.5205485, 1, 0, 0, 1, 1,
0.2541967, -1.014508, 2.267226, 1, 0, 0, 1, 1,
0.2585223, -1.536162, 5.047558, 1, 0, 0, 1, 1,
0.2592564, -0.2515776, 2.066955, 1, 0, 0, 1, 1,
0.2615826, 0.6947078, 1.517596, 1, 0, 0, 1, 1,
0.2622169, 1.508901, -0.9227047, 0, 0, 0, 1, 1,
0.2663333, -1.120798, 2.207715, 0, 0, 0, 1, 1,
0.2708932, -1.915716, 2.611146, 0, 0, 0, 1, 1,
0.2709052, 0.7747266, 0.05720049, 0, 0, 0, 1, 1,
0.2714006, 1.217317, 0.5748416, 0, 0, 0, 1, 1,
0.2721578, -0.7967126, 2.932868, 0, 0, 0, 1, 1,
0.2722278, -0.4581006, 2.886549, 0, 0, 0, 1, 1,
0.2726482, -0.3024854, 2.048152, 1, 1, 1, 1, 1,
0.2726547, 1.521699, 0.08968414, 1, 1, 1, 1, 1,
0.2748266, -1.957246, 3.322833, 1, 1, 1, 1, 1,
0.2808264, 0.5845085, 1.008496, 1, 1, 1, 1, 1,
0.2830044, -0.2071023, 2.118572, 1, 1, 1, 1, 1,
0.2834775, -1.42276, 1.977201, 1, 1, 1, 1, 1,
0.3002693, 0.3233191, 0.8739012, 1, 1, 1, 1, 1,
0.3046105, -1.682717, 3.337201, 1, 1, 1, 1, 1,
0.304757, -0.3240439, 1.887174, 1, 1, 1, 1, 1,
0.3065232, 0.6462991, 1.130832, 1, 1, 1, 1, 1,
0.3096224, -1.800888, 3.484486, 1, 1, 1, 1, 1,
0.3172902, -1.837576, 1.631098, 1, 1, 1, 1, 1,
0.3229381, -0.1207293, 1.633988, 1, 1, 1, 1, 1,
0.3231739, -1.150073, 2.407019, 1, 1, 1, 1, 1,
0.3236972, 1.087193, 0.7927528, 1, 1, 1, 1, 1,
0.3280923, -1.12343, 3.171833, 0, 0, 1, 1, 1,
0.3291066, -0.07539024, 1.495981, 1, 0, 0, 1, 1,
0.3295166, -0.9983278, 3.85828, 1, 0, 0, 1, 1,
0.333436, -2.073931, 1.960866, 1, 0, 0, 1, 1,
0.3335131, -0.4146787, 1.083418, 1, 0, 0, 1, 1,
0.3414715, -0.0343144, 1.627078, 1, 0, 0, 1, 1,
0.3457285, -0.6303481, 2.41908, 0, 0, 0, 1, 1,
0.3463734, 3.195062, -0.5640091, 0, 0, 0, 1, 1,
0.3496053, -1.258102, 1.199364, 0, 0, 0, 1, 1,
0.3521494, 0.9151261, 0.5362342, 0, 0, 0, 1, 1,
0.3522247, 0.4076382, -0.5052291, 0, 0, 0, 1, 1,
0.3536342, -0.1491746, 0.7990199, 0, 0, 0, 1, 1,
0.3554899, 0.7489904, -0.8604715, 0, 0, 0, 1, 1,
0.3571609, -1.161142, 2.35796, 1, 1, 1, 1, 1,
0.3571687, 0.6769911, 0.5856397, 1, 1, 1, 1, 1,
0.3653615, 1.650825, 0.8315027, 1, 1, 1, 1, 1,
0.3657236, 0.9577349, 1.537995, 1, 1, 1, 1, 1,
0.3700675, 2.403841, 0.7062178, 1, 1, 1, 1, 1,
0.370542, -0.270889, 1.680851, 1, 1, 1, 1, 1,
0.3730561, 0.6535707, 1.681237, 1, 1, 1, 1, 1,
0.3740816, 1.964067, -0.4884982, 1, 1, 1, 1, 1,
0.3745055, 0.0468297, 1.767778, 1, 1, 1, 1, 1,
0.3748054, -0.4951653, 2.783712, 1, 1, 1, 1, 1,
0.3790243, 1.122344, 0.4144204, 1, 1, 1, 1, 1,
0.3818401, 0.04172713, 0.542266, 1, 1, 1, 1, 1,
0.3837575, 0.4577785, -1.002859, 1, 1, 1, 1, 1,
0.3853092, -2.854812, 3.417873, 1, 1, 1, 1, 1,
0.3859124, 0.832835, -0.4788772, 1, 1, 1, 1, 1,
0.3877032, -0.6953337, 2.244701, 0, 0, 1, 1, 1,
0.3899603, -1.041561, 4.729813, 1, 0, 0, 1, 1,
0.391242, -0.5654968, 4.502607, 1, 0, 0, 1, 1,
0.3924146, 1.310626, 0.8801008, 1, 0, 0, 1, 1,
0.3941576, -0.8107776, 3.880732, 1, 0, 0, 1, 1,
0.3953934, 1.600467, 0.8794788, 1, 0, 0, 1, 1,
0.3987572, 0.1338065, -0.7229267, 0, 0, 0, 1, 1,
0.4033265, -2.323744, 1.184811, 0, 0, 0, 1, 1,
0.4061917, -1.203712, 4.134171, 0, 0, 0, 1, 1,
0.4079574, 1.542549, 1.204348, 0, 0, 0, 1, 1,
0.4082408, 0.06890862, 1.935472, 0, 0, 0, 1, 1,
0.40842, -0.2738284, 3.052579, 0, 0, 0, 1, 1,
0.4169587, -0.02221947, 1.272851, 0, 0, 0, 1, 1,
0.4200768, 0.4261045, 0.552296, 1, 1, 1, 1, 1,
0.4219411, -0.7890689, 2.089056, 1, 1, 1, 1, 1,
0.4246921, -1.204262, 2.557739, 1, 1, 1, 1, 1,
0.4257879, 0.5491209, 2.758045, 1, 1, 1, 1, 1,
0.4276968, 0.3423255, 0.5388367, 1, 1, 1, 1, 1,
0.4295558, 1.735405, 1.263744, 1, 1, 1, 1, 1,
0.4357139, 0.7745702, -0.7044433, 1, 1, 1, 1, 1,
0.4413873, 0.9235991, -1.152706, 1, 1, 1, 1, 1,
0.4436999, -0.2585076, 1.096147, 1, 1, 1, 1, 1,
0.4441539, 1.068, -0.6461353, 1, 1, 1, 1, 1,
0.4447147, -1.220443, 5.19008, 1, 1, 1, 1, 1,
0.4447611, 2.453806, 0.2527795, 1, 1, 1, 1, 1,
0.454001, -0.8171826, 0.2771356, 1, 1, 1, 1, 1,
0.4548796, 0.8511087, 0.6549405, 1, 1, 1, 1, 1,
0.4565168, -0.5741248, 1.05476, 1, 1, 1, 1, 1,
0.4567903, -0.03712439, 1.103859, 0, 0, 1, 1, 1,
0.4586171, 0.3348695, 1.464215, 1, 0, 0, 1, 1,
0.4591006, 2.944647, -0.8916028, 1, 0, 0, 1, 1,
0.4625307, 1.579771, 0.9139044, 1, 0, 0, 1, 1,
0.4638712, 1.046287, -0.4271401, 1, 0, 0, 1, 1,
0.46525, -0.02683559, 1.042376, 1, 0, 0, 1, 1,
0.4675413, 0.5691316, -0.02826659, 0, 0, 0, 1, 1,
0.4693781, 1.055157, -1.340257, 0, 0, 0, 1, 1,
0.4703421, -0.1069518, 2.297745, 0, 0, 0, 1, 1,
0.4750877, -1.183075, 1.50482, 0, 0, 0, 1, 1,
0.4769866, -2.241173, 3.21164, 0, 0, 0, 1, 1,
0.479297, -0.666468, 3.505929, 0, 0, 0, 1, 1,
0.4811826, 0.5188568, 0.002138294, 0, 0, 0, 1, 1,
0.4834143, 2.146133, 0.2544929, 1, 1, 1, 1, 1,
0.4878449, -0.06426951, 1.637312, 1, 1, 1, 1, 1,
0.4894416, -0.3134339, 1.137671, 1, 1, 1, 1, 1,
0.4915457, -1.04165, 2.972016, 1, 1, 1, 1, 1,
0.4916691, -0.01021202, 2.548979, 1, 1, 1, 1, 1,
0.4971394, -1.605126, 2.905773, 1, 1, 1, 1, 1,
0.4986797, -1.554345, 3.915149, 1, 1, 1, 1, 1,
0.5001626, 1.27316, 0.8669137, 1, 1, 1, 1, 1,
0.502285, 0.1627305, 2.422014, 1, 1, 1, 1, 1,
0.505704, -0.3179961, 2.046842, 1, 1, 1, 1, 1,
0.5081808, -0.4021357, 2.965723, 1, 1, 1, 1, 1,
0.5155048, 0.2862977, 3.373425, 1, 1, 1, 1, 1,
0.5280739, -0.1376418, 1.583968, 1, 1, 1, 1, 1,
0.5316709, 0.1638875, 1.675519, 1, 1, 1, 1, 1,
0.53442, 0.8669337, 0.9743994, 1, 1, 1, 1, 1,
0.5363973, -0.2353918, 0.2400686, 0, 0, 1, 1, 1,
0.5392833, 0.4358732, 1.968748, 1, 0, 0, 1, 1,
0.5399662, 0.1886225, 0.2590835, 1, 0, 0, 1, 1,
0.540318, -0.1361679, 1.867747, 1, 0, 0, 1, 1,
0.542007, -1.635053, 2.460906, 1, 0, 0, 1, 1,
0.5446071, -0.1155349, 2.118736, 1, 0, 0, 1, 1,
0.5452222, -0.3547597, 2.694961, 0, 0, 0, 1, 1,
0.5462885, 1.230995, -0.4774014, 0, 0, 0, 1, 1,
0.5464461, 0.02637175, -0.3559261, 0, 0, 0, 1, 1,
0.5473475, 0.7530965, -0.641421, 0, 0, 0, 1, 1,
0.5477551, -2.058746, 2.572116, 0, 0, 0, 1, 1,
0.5488263, 0.8422195, 0.1456362, 0, 0, 0, 1, 1,
0.5524307, -0.8655709, 3.343269, 0, 0, 0, 1, 1,
0.5546866, 1.376566, -0.09346852, 1, 1, 1, 1, 1,
0.5601676, -0.7699364, 3.083366, 1, 1, 1, 1, 1,
0.5612623, -2.617812, 3.809367, 1, 1, 1, 1, 1,
0.5618567, 1.407954, 0.5048628, 1, 1, 1, 1, 1,
0.5643842, -0.5037459, 1.037468, 1, 1, 1, 1, 1,
0.5684714, -0.134825, 3.068683, 1, 1, 1, 1, 1,
0.5694363, -0.7627346, 3.627288, 1, 1, 1, 1, 1,
0.5716783, -0.3812307, 3.060849, 1, 1, 1, 1, 1,
0.5720748, -0.02775285, 2.84834, 1, 1, 1, 1, 1,
0.5761756, -1.106375, 1.456646, 1, 1, 1, 1, 1,
0.5838738, -0.120693, 1.687371, 1, 1, 1, 1, 1,
0.5866504, -0.849196, 2.307099, 1, 1, 1, 1, 1,
0.5875939, -1.506639, 2.040357, 1, 1, 1, 1, 1,
0.5877505, -1.707507, 1.527921, 1, 1, 1, 1, 1,
0.5892622, 1.475822, -0.6819971, 1, 1, 1, 1, 1,
0.604207, 1.416471, -0.8934519, 0, 0, 1, 1, 1,
0.6051319, 0.816088, -0.06402408, 1, 0, 0, 1, 1,
0.6061989, -0.8741997, 3.522656, 1, 0, 0, 1, 1,
0.6065269, 1.94362, -0.2261868, 1, 0, 0, 1, 1,
0.6076041, -0.5085652, 1.177226, 1, 0, 0, 1, 1,
0.6097034, -0.1374555, 1.117669, 1, 0, 0, 1, 1,
0.6151479, 0.1858303, 0.5335328, 0, 0, 0, 1, 1,
0.6175843, 0.5927849, 3.028868, 0, 0, 0, 1, 1,
0.6194785, 1.016034, 0.4952075, 0, 0, 0, 1, 1,
0.6199909, -1.371869, 3.993634, 0, 0, 0, 1, 1,
0.6212008, -0.4103545, 2.646252, 0, 0, 0, 1, 1,
0.6229721, -0.05785237, 2.531408, 0, 0, 0, 1, 1,
0.6289434, -0.7640761, 1.855287, 0, 0, 0, 1, 1,
0.6322125, 0.8116181, -0.7970024, 1, 1, 1, 1, 1,
0.6322477, 0.248382, 1.837605, 1, 1, 1, 1, 1,
0.6369628, -0.9888977, 2.281858, 1, 1, 1, 1, 1,
0.6417192, 0.445834, 1.515911, 1, 1, 1, 1, 1,
0.6427637, 0.09656715, 1.327528, 1, 1, 1, 1, 1,
0.6450842, 0.6392729, 1.411789, 1, 1, 1, 1, 1,
0.6463147, -0.2623799, 1.794487, 1, 1, 1, 1, 1,
0.6571839, -0.9473709, 1.3464, 1, 1, 1, 1, 1,
0.6726735, -0.5514483, 2.679053, 1, 1, 1, 1, 1,
0.6762813, 0.3139367, 0.2054686, 1, 1, 1, 1, 1,
0.6821855, 0.2108018, 0.1609185, 1, 1, 1, 1, 1,
0.6925201, 0.6487936, -0.1069958, 1, 1, 1, 1, 1,
0.6946993, -0.6616585, 1.632914, 1, 1, 1, 1, 1,
0.7089741, -2.50519, 2.343976, 1, 1, 1, 1, 1,
0.7094125, 0.213975, 4.447502, 1, 1, 1, 1, 1,
0.7097505, -0.9164657, 2.217989, 0, 0, 1, 1, 1,
0.7101976, -2.379086, 2.745433, 1, 0, 0, 1, 1,
0.7127618, 0.3147139, 0.6257138, 1, 0, 0, 1, 1,
0.7202414, -0.3844369, 0.7156624, 1, 0, 0, 1, 1,
0.7219477, 0.5988342, 2.399877, 1, 0, 0, 1, 1,
0.7264185, -0.5698984, 2.6974, 1, 0, 0, 1, 1,
0.7326987, -0.4740937, 1.617207, 0, 0, 0, 1, 1,
0.7329574, 0.4732938, 2.433015, 0, 0, 0, 1, 1,
0.7380257, 1.071344, 0.7463913, 0, 0, 0, 1, 1,
0.739639, 3.2087, 1.243958, 0, 0, 0, 1, 1,
0.745027, 0.0312004, 1.976831, 0, 0, 0, 1, 1,
0.7503333, -1.225825, 3.48574, 0, 0, 0, 1, 1,
0.7558874, -0.6735471, 2.369938, 0, 0, 0, 1, 1,
0.7587875, -0.4962515, 1.717459, 1, 1, 1, 1, 1,
0.7598242, 0.3371411, 2.984424, 1, 1, 1, 1, 1,
0.7667241, 1.585521, 1.097386, 1, 1, 1, 1, 1,
0.7706208, -0.8195264, 1.890568, 1, 1, 1, 1, 1,
0.7728903, -2.69377, 4.30311, 1, 1, 1, 1, 1,
0.7733178, 0.06704039, 0.5022552, 1, 1, 1, 1, 1,
0.7765275, 2.068918, 0.4562786, 1, 1, 1, 1, 1,
0.7774451, 0.2989117, 1.639471, 1, 1, 1, 1, 1,
0.7808886, -2.849079, 2.444641, 1, 1, 1, 1, 1,
0.7829522, 0.5799968, 0.5429575, 1, 1, 1, 1, 1,
0.7900568, 1.660947, 0.6005297, 1, 1, 1, 1, 1,
0.7916986, 1.335277, -0.7644025, 1, 1, 1, 1, 1,
0.7923322, -2.355835, 1.482646, 1, 1, 1, 1, 1,
0.7942159, 1.139872, 1.357702, 1, 1, 1, 1, 1,
0.7963481, -0.619828, 5.556197, 1, 1, 1, 1, 1,
0.8044804, 1.790283, 1.341708, 0, 0, 1, 1, 1,
0.8090528, 2.248487, 0.5997596, 1, 0, 0, 1, 1,
0.8132993, -1.394091, 2.087339, 1, 0, 0, 1, 1,
0.814597, 1.151137, -0.185254, 1, 0, 0, 1, 1,
0.8174418, 1.793967, -0.4116161, 1, 0, 0, 1, 1,
0.818447, -0.05254972, 3.107083, 1, 0, 0, 1, 1,
0.8218625, -0.06000587, 2.138772, 0, 0, 0, 1, 1,
0.8228455, 0.7657126, 0.2589467, 0, 0, 0, 1, 1,
0.8242256, -0.1232846, 2.391572, 0, 0, 0, 1, 1,
0.8280666, 0.4495966, 1.784066, 0, 0, 0, 1, 1,
0.8295003, 1.701756, 0.2929107, 0, 0, 0, 1, 1,
0.8297946, -1.316979, 2.669269, 0, 0, 0, 1, 1,
0.8310509, 0.9276052, -0.9498622, 0, 0, 0, 1, 1,
0.8390307, 0.05368121, 1.105654, 1, 1, 1, 1, 1,
0.8427064, 0.79449, 0.6271031, 1, 1, 1, 1, 1,
0.8442959, -0.5898691, 0.8043087, 1, 1, 1, 1, 1,
0.8577074, -0.5306371, 1.799449, 1, 1, 1, 1, 1,
0.8595079, -0.7814741, 2.084553, 1, 1, 1, 1, 1,
0.8634576, 0.06185259, 1.571275, 1, 1, 1, 1, 1,
0.8666825, 0.7989146, 1.872453, 1, 1, 1, 1, 1,
0.8668336, -1.965503, 3.902148, 1, 1, 1, 1, 1,
0.8705413, -1.190203, 2.898516, 1, 1, 1, 1, 1,
0.8752123, 0.06589603, 1.329977, 1, 1, 1, 1, 1,
0.8763143, 0.08554128, 1.271159, 1, 1, 1, 1, 1,
0.8821208, 0.8313437, 0.4961777, 1, 1, 1, 1, 1,
0.8824536, -0.3076758, 2.296643, 1, 1, 1, 1, 1,
0.8832744, 0.6159568, 1.591877, 1, 1, 1, 1, 1,
0.8837142, 1.039145, 0.833397, 1, 1, 1, 1, 1,
0.8870403, 0.05531577, 0.7646598, 0, 0, 1, 1, 1,
0.8888423, 0.552658, 0.991592, 1, 0, 0, 1, 1,
0.895418, 0.3434431, 2.190665, 1, 0, 0, 1, 1,
0.9000053, 1.863293, 1.834319, 1, 0, 0, 1, 1,
0.9066977, 0.09376125, 1.978556, 1, 0, 0, 1, 1,
0.90763, -0.8932284, 0.5323669, 1, 0, 0, 1, 1,
0.9086761, 0.9307314, 1.43411, 0, 0, 0, 1, 1,
0.9093786, -0.1910579, 1.784992, 0, 0, 0, 1, 1,
0.9241459, 0.1065839, 2.439899, 0, 0, 0, 1, 1,
0.930851, 1.683911, 0.02250155, 0, 0, 0, 1, 1,
0.9332504, -0.2884848, 1.196653, 0, 0, 0, 1, 1,
0.9355862, -0.1159049, 0.63367, 0, 0, 0, 1, 1,
0.9454173, 0.07381651, 2.31883, 0, 0, 0, 1, 1,
0.9456232, -0.2327911, 0.256817, 1, 1, 1, 1, 1,
0.9502282, -1.180522, 2.307708, 1, 1, 1, 1, 1,
0.9524683, 0.1893618, 2.185848, 1, 1, 1, 1, 1,
0.9564449, -1.055675, 2.16397, 1, 1, 1, 1, 1,
0.9625063, -0.5380679, 1.623092, 1, 1, 1, 1, 1,
0.9870993, -0.6172147, 1.929142, 1, 1, 1, 1, 1,
0.9887484, -0.9085354, 2.742851, 1, 1, 1, 1, 1,
0.9971527, 0.4700703, -0.08878272, 1, 1, 1, 1, 1,
0.9971793, -0.139222, 1.128826, 1, 1, 1, 1, 1,
0.9981217, -0.2848206, 2.846316, 1, 1, 1, 1, 1,
1.003281, -2.081143, 2.243901, 1, 1, 1, 1, 1,
1.007256, 0.4892142, 2.197741, 1, 1, 1, 1, 1,
1.015872, -0.04146289, 2.380587, 1, 1, 1, 1, 1,
1.021628, -0.8086004, 3.063904, 1, 1, 1, 1, 1,
1.022985, -0.1484714, 2.437148, 1, 1, 1, 1, 1,
1.025927, 0.2756875, 2.253124, 0, 0, 1, 1, 1,
1.029593, 0.6507511, 2.530456, 1, 0, 0, 1, 1,
1.032865, -0.2813863, 2.145282, 1, 0, 0, 1, 1,
1.034874, 1.151736, -0.09698213, 1, 0, 0, 1, 1,
1.036668, -0.05783194, 0.8896285, 1, 0, 0, 1, 1,
1.040461, 1.455945, 1.210934, 1, 0, 0, 1, 1,
1.040738, 0.5198077, 1.242769, 0, 0, 0, 1, 1,
1.040799, -0.2238772, 1.042241, 0, 0, 0, 1, 1,
1.042371, 0.03120615, 1.699413, 0, 0, 0, 1, 1,
1.043625, -0.07188021, 1.949558, 0, 0, 0, 1, 1,
1.045503, 1.535723, 1.463296, 0, 0, 0, 1, 1,
1.048343, -0.009406597, 0.1186909, 0, 0, 0, 1, 1,
1.052567, 1.391978, -1.467286, 0, 0, 0, 1, 1,
1.054536, 1.976761, 0.2528029, 1, 1, 1, 1, 1,
1.056768, -1.825631, 2.324346, 1, 1, 1, 1, 1,
1.075898, -0.4148549, 1.143892, 1, 1, 1, 1, 1,
1.076388, -0.7220553, 3.164602, 1, 1, 1, 1, 1,
1.077847, -0.4529102, 1.516316, 1, 1, 1, 1, 1,
1.080791, -1.507867, 3.72473, 1, 1, 1, 1, 1,
1.081394, 0.310371, 1.333814, 1, 1, 1, 1, 1,
1.091616, 2.239395, 0.174359, 1, 1, 1, 1, 1,
1.092938, 0.624832, 1.096325, 1, 1, 1, 1, 1,
1.095134, -0.49218, 1.129327, 1, 1, 1, 1, 1,
1.102784, 0.8807058, 1.266914, 1, 1, 1, 1, 1,
1.104049, 1.601796, 0.8437129, 1, 1, 1, 1, 1,
1.11051, 1.017107, 2.452883, 1, 1, 1, 1, 1,
1.120321, 0.1143008, 0.3207197, 1, 1, 1, 1, 1,
1.122215, -0.7864774, 1.490178, 1, 1, 1, 1, 1,
1.122439, 0.4829777, -0.5604013, 0, 0, 1, 1, 1,
1.140533, -0.7263908, 1.773569, 1, 0, 0, 1, 1,
1.14196, -1.274452, 1.913203, 1, 0, 0, 1, 1,
1.159011, 0.656651, 0.3987471, 1, 0, 0, 1, 1,
1.166535, 0.2738262, 0.8394695, 1, 0, 0, 1, 1,
1.195544, 1.996401, 0.5018402, 1, 0, 0, 1, 1,
1.195863, -0.4669923, 1.479676, 0, 0, 0, 1, 1,
1.208097, -2.690433, 2.217999, 0, 0, 0, 1, 1,
1.218453, -1.38058, 3.012858, 0, 0, 0, 1, 1,
1.229382, 0.9190006, 0.5882084, 0, 0, 0, 1, 1,
1.231022, -0.03275495, 0.6803305, 0, 0, 0, 1, 1,
1.237785, 1.494791, 1.149655, 0, 0, 0, 1, 1,
1.248146, -0.6980114, 1.291475, 0, 0, 0, 1, 1,
1.251408, 0.3353314, 2.188586, 1, 1, 1, 1, 1,
1.252349, -0.78588, 3.072042, 1, 1, 1, 1, 1,
1.26234, 1.977111, -0.2419241, 1, 1, 1, 1, 1,
1.266501, -0.1434046, 2.650099, 1, 1, 1, 1, 1,
1.267762, 1.851125, 1.317771, 1, 1, 1, 1, 1,
1.27194, -2.379744, 3.224317, 1, 1, 1, 1, 1,
1.29832, 0.1569085, 1.163894, 1, 1, 1, 1, 1,
1.305136, 0.7904817, 1.727595, 1, 1, 1, 1, 1,
1.312299, 1.080132, 1.237274, 1, 1, 1, 1, 1,
1.312428, 0.4291188, 0.9801287, 1, 1, 1, 1, 1,
1.315006, 0.6892663, 0.4474174, 1, 1, 1, 1, 1,
1.326726, -1.911036, 3.624433, 1, 1, 1, 1, 1,
1.349633, 0.5169724, 2.046252, 1, 1, 1, 1, 1,
1.357852, 0.4832614, 3.982435, 1, 1, 1, 1, 1,
1.364313, -0.8674828, 2.022265, 1, 1, 1, 1, 1,
1.368099, -1.191072, 1.76907, 0, 0, 1, 1, 1,
1.370319, 2.535829, -0.2949753, 1, 0, 0, 1, 1,
1.380205, -0.5185859, 1.18654, 1, 0, 0, 1, 1,
1.382248, -1.42774, 3.336303, 1, 0, 0, 1, 1,
1.389278, 0.1483799, 0.864095, 1, 0, 0, 1, 1,
1.397018, -0.6123, 3.176347, 1, 0, 0, 1, 1,
1.399583, 0.192222, 0.4298137, 0, 0, 0, 1, 1,
1.400566, -1.641098, 1.802022, 0, 0, 0, 1, 1,
1.428568, -1.408753, 2.65051, 0, 0, 0, 1, 1,
1.431091, 0.3944882, 1.903533, 0, 0, 0, 1, 1,
1.443612, 0.5673564, -0.4013413, 0, 0, 0, 1, 1,
1.444687, -0.5260162, 1.85325, 0, 0, 0, 1, 1,
1.465108, 0.165341, 3.826589, 0, 0, 0, 1, 1,
1.474995, -0.4082245, 0.7678146, 1, 1, 1, 1, 1,
1.483383, 0.6343974, 1.099813, 1, 1, 1, 1, 1,
1.485679, -1.728558, 1.423047, 1, 1, 1, 1, 1,
1.485862, 0.8219432, 0.4818411, 1, 1, 1, 1, 1,
1.486323, 2.651482, 0.8948512, 1, 1, 1, 1, 1,
1.487505, 1.37889, 0.435382, 1, 1, 1, 1, 1,
1.492753, -0.8400491, 1.702776, 1, 1, 1, 1, 1,
1.492776, 0.2034235, 1.915272, 1, 1, 1, 1, 1,
1.496656, -2.180613, 1.704286, 1, 1, 1, 1, 1,
1.497117, -0.6760741, 1.365124, 1, 1, 1, 1, 1,
1.500298, -0.4922733, 1.600203, 1, 1, 1, 1, 1,
1.502224, -1.377602, 1.573327, 1, 1, 1, 1, 1,
1.511722, -0.9412858, 1.17024, 1, 1, 1, 1, 1,
1.515974, 0.2600595, 1.313277, 1, 1, 1, 1, 1,
1.518539, -0.8185718, 1.908941, 1, 1, 1, 1, 1,
1.520216, 0.8149679, 2.061506, 0, 0, 1, 1, 1,
1.52067, 0.01052137, 0.05509611, 1, 0, 0, 1, 1,
1.522682, 0.1863108, 1.606995, 1, 0, 0, 1, 1,
1.523478, 1.383885, 0.9720916, 1, 0, 0, 1, 1,
1.526085, 0.9721678, 1.578368, 1, 0, 0, 1, 1,
1.534653, -2.264307, 3.429811, 1, 0, 0, 1, 1,
1.535579, -0.8494257, 1.422715, 0, 0, 0, 1, 1,
1.536521, 0.7209724, -0.8360618, 0, 0, 0, 1, 1,
1.550005, 0.3523325, -0.1316879, 0, 0, 0, 1, 1,
1.551186, 0.4031774, 2.930103, 0, 0, 0, 1, 1,
1.551962, 1.51405, 1.68073, 0, 0, 0, 1, 1,
1.553425, -1.396559, 2.864031, 0, 0, 0, 1, 1,
1.554625, 1.880315, 1.596396, 0, 0, 0, 1, 1,
1.56036, -1.348091, 3.304985, 1, 1, 1, 1, 1,
1.569019, -0.02445558, 0.6735092, 1, 1, 1, 1, 1,
1.576242, -0.3057253, 0.4296763, 1, 1, 1, 1, 1,
1.58306, 1.633266, -0.1122475, 1, 1, 1, 1, 1,
1.586734, 1.303732, 0.8957675, 1, 1, 1, 1, 1,
1.589744, 0.0583216, 1.44313, 1, 1, 1, 1, 1,
1.592681, 0.07853057, 2.546634, 1, 1, 1, 1, 1,
1.602412, -1.422629, 1.258768, 1, 1, 1, 1, 1,
1.608098, 0.303041, 2.47103, 1, 1, 1, 1, 1,
1.613356, -1.612866, 3.203127, 1, 1, 1, 1, 1,
1.615168, 0.5546198, 1.671173, 1, 1, 1, 1, 1,
1.630335, 1.695115, 1.356376, 1, 1, 1, 1, 1,
1.636535, -0.9324077, 3.820067, 1, 1, 1, 1, 1,
1.642471, 0.2626627, 1.170757, 1, 1, 1, 1, 1,
1.648466, 1.027811, 2.593272, 1, 1, 1, 1, 1,
1.652869, 0.04316709, 2.830197, 0, 0, 1, 1, 1,
1.673902, -1.258321, 2.119574, 1, 0, 0, 1, 1,
1.674954, 0.3719641, 0.392833, 1, 0, 0, 1, 1,
1.68112, 0.1912376, 2.435456, 1, 0, 0, 1, 1,
1.681336, 0.8821471, 0.5656517, 1, 0, 0, 1, 1,
1.68719, 0.4405121, 1.146756, 1, 0, 0, 1, 1,
1.714393, -2.049498, 2.460242, 0, 0, 0, 1, 1,
1.719732, -0.1839799, 2.666403, 0, 0, 0, 1, 1,
1.754953, 0.3665258, 1.185489, 0, 0, 0, 1, 1,
1.774889, -0.5071831, 2.315809, 0, 0, 0, 1, 1,
1.778525, -0.7507472, 3.545295, 0, 0, 0, 1, 1,
1.785602, -0.9569778, 0.9355301, 0, 0, 0, 1, 1,
1.809037, 0.02364189, 1.011683, 0, 0, 0, 1, 1,
1.811515, -0.6591017, 1.875567, 1, 1, 1, 1, 1,
1.817685, 0.9325145, 2.035733, 1, 1, 1, 1, 1,
1.81881, -0.2121979, 1.351148, 1, 1, 1, 1, 1,
1.849853, 0.898087, -1.261816, 1, 1, 1, 1, 1,
1.866387, 0.08253556, 2.105061, 1, 1, 1, 1, 1,
1.881087, 0.952076, -0.6844437, 1, 1, 1, 1, 1,
1.885794, -0.1066602, 3.312881, 1, 1, 1, 1, 1,
1.886288, 0.8846161, 1.332069, 1, 1, 1, 1, 1,
1.889526, -0.7862461, 1.763114, 1, 1, 1, 1, 1,
1.91141, -1.532529, 1.839479, 1, 1, 1, 1, 1,
1.957586, 0.1397111, 3.372021, 1, 1, 1, 1, 1,
1.959052, 0.1085257, 2.154247, 1, 1, 1, 1, 1,
1.985081, 1.860663, 1.33508, 1, 1, 1, 1, 1,
2.000711, -1.410639, 2.793846, 1, 1, 1, 1, 1,
2.022056, 0.6866112, 1.43374, 1, 1, 1, 1, 1,
2.03014, -0.6212729, 3.192789, 0, 0, 1, 1, 1,
2.049046, -0.8038247, 4.61172, 1, 0, 0, 1, 1,
2.065129, 0.09316076, 1.863342, 1, 0, 0, 1, 1,
2.103233, 1.717773, 1.249179, 1, 0, 0, 1, 1,
2.120296, 0.03059433, 2.896709, 1, 0, 0, 1, 1,
2.148267, -0.304478, 1.431564, 1, 0, 0, 1, 1,
2.161541, 0.09441695, 1.843198, 0, 0, 0, 1, 1,
2.211742, -0.09920061, 1.088169, 0, 0, 0, 1, 1,
2.239167, -1.200186, 1.740004, 0, 0, 0, 1, 1,
2.277239, -0.1497812, 1.183071, 0, 0, 0, 1, 1,
2.291636, 0.251947, 1.40519, 0, 0, 0, 1, 1,
2.319309, -0.4153213, 2.125648, 0, 0, 0, 1, 1,
2.338701, 0.5301305, 2.112086, 0, 0, 0, 1, 1,
2.542902, -0.6981656, 3.712172, 1, 1, 1, 1, 1,
2.674158, 0.3449523, 1.035136, 1, 1, 1, 1, 1,
2.732489, 1.149662, 2.549398, 1, 1, 1, 1, 1,
2.771605, 0.2610716, -2.02859, 1, 1, 1, 1, 1,
2.877894, -0.5064043, 3.793388, 1, 1, 1, 1, 1,
2.883293, 1.366193, 3.133047, 1, 1, 1, 1, 1,
3.527387, -0.4601812, 1.374388, 1, 1, 1, 1, 1
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
var radius = 9.75019;
var distance = 34.24713;
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
mvMatrix.translate( -0.1173873, 0.12573, -0.2054706 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.24713);
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