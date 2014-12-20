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
-3.218233, -1.127591, -1.445734, 1, 0, 0, 1,
-2.967109, -3.396749, -2.19249, 1, 0.007843138, 0, 1,
-2.9082, 1.577122, -1.388093, 1, 0.01176471, 0, 1,
-2.840632, -0.3340595, 0.5768845, 1, 0.01960784, 0, 1,
-2.810866, -0.9638929, -1.91248, 1, 0.02352941, 0, 1,
-2.740744, 0.1468374, -0.8490741, 1, 0.03137255, 0, 1,
-2.609329, -0.5232248, -1.047663, 1, 0.03529412, 0, 1,
-2.465862, -0.7709218, -1.856287, 1, 0.04313726, 0, 1,
-2.361968, 0.219179, -1.96511, 1, 0.04705882, 0, 1,
-2.333127, 0.318334, -0.8788679, 1, 0.05490196, 0, 1,
-2.196258, -0.8540389, -0.3638388, 1, 0.05882353, 0, 1,
-2.164577, 0.4507172, -2.037569, 1, 0.06666667, 0, 1,
-2.162645, 0.4461251, -1.022048, 1, 0.07058824, 0, 1,
-2.139723, -2.073472, -0.8918363, 1, 0.07843138, 0, 1,
-2.122697, 0.7898793, -1.460521, 1, 0.08235294, 0, 1,
-2.08558, 1.611378, 0.5576878, 1, 0.09019608, 0, 1,
-2.083503, -0.6575352, -2.939558, 1, 0.09411765, 0, 1,
-2.067124, 0.47701, -2.538445, 1, 0.1019608, 0, 1,
-2.061889, -0.2607006, -3.098262, 1, 0.1098039, 0, 1,
-2.030273, -0.2557509, -2.165242, 1, 0.1137255, 0, 1,
-2.010189, 0.03200632, -1.701356, 1, 0.1215686, 0, 1,
-2.007525, 0.1197866, -1.11617, 1, 0.1254902, 0, 1,
-1.984246, 0.7266561, 0.05666381, 1, 0.1333333, 0, 1,
-1.979547, 0.4369869, -1.720843, 1, 0.1372549, 0, 1,
-1.968799, 0.9874841, -2.371516, 1, 0.145098, 0, 1,
-1.967576, -0.3755426, -0.9739042, 1, 0.1490196, 0, 1,
-1.95082, -0.02780384, -0.792354, 1, 0.1568628, 0, 1,
-1.939091, 1.181347, -1.047057, 1, 0.1607843, 0, 1,
-1.931965, -2.450979, -2.410879, 1, 0.1686275, 0, 1,
-1.91385, -0.3102851, -2.252267, 1, 0.172549, 0, 1,
-1.887823, -0.2657223, -2.347654, 1, 0.1803922, 0, 1,
-1.879896, -0.1932544, -1.657364, 1, 0.1843137, 0, 1,
-1.857411, -0.1045967, -3.337006, 1, 0.1921569, 0, 1,
-1.835433, 1.667607, 0.4174382, 1, 0.1960784, 0, 1,
-1.834682, -0.9569691, -2.182841, 1, 0.2039216, 0, 1,
-1.799578, 1.646072, -2.289819, 1, 0.2117647, 0, 1,
-1.781552, 0.7229152, 0.1083053, 1, 0.2156863, 0, 1,
-1.749547, -0.5573972, -0.7460347, 1, 0.2235294, 0, 1,
-1.74724, 0.7900392, -1.635098, 1, 0.227451, 0, 1,
-1.729957, 1.15401, -1.328271, 1, 0.2352941, 0, 1,
-1.729519, -0.18176, -1.628716, 1, 0.2392157, 0, 1,
-1.721729, 0.04076954, -1.366558, 1, 0.2470588, 0, 1,
-1.714687, -1.009748, -2.748306, 1, 0.2509804, 0, 1,
-1.710293, -1.557324, -3.169624, 1, 0.2588235, 0, 1,
-1.703172, 0.1256444, -1.655658, 1, 0.2627451, 0, 1,
-1.681381, 1.57717, -1.398219, 1, 0.2705882, 0, 1,
-1.674799, 0.7382147, -0.9161205, 1, 0.2745098, 0, 1,
-1.670373, 0.566548, -0.374737, 1, 0.282353, 0, 1,
-1.654261, 0.8682452, 0.02908642, 1, 0.2862745, 0, 1,
-1.649648, -1.585417, -2.362934, 1, 0.2941177, 0, 1,
-1.647013, 0.04914705, -0.3769537, 1, 0.3019608, 0, 1,
-1.636112, -0.9246778, -2.991458, 1, 0.3058824, 0, 1,
-1.630999, -2.505706, -2.424942, 1, 0.3137255, 0, 1,
-1.630075, 0.08775894, -1.748409, 1, 0.3176471, 0, 1,
-1.629735, -0.9875574, -1.420469, 1, 0.3254902, 0, 1,
-1.623597, 0.3885511, -1.538847, 1, 0.3294118, 0, 1,
-1.616274, 0.3108951, -1.988564, 1, 0.3372549, 0, 1,
-1.607669, -0.194529, -3.010302, 1, 0.3411765, 0, 1,
-1.605517, 0.9766815, -0.9074819, 1, 0.3490196, 0, 1,
-1.595946, -1.471135, -1.994951, 1, 0.3529412, 0, 1,
-1.57426, -0.5725704, -1.73271, 1, 0.3607843, 0, 1,
-1.550678, 0.7058981, -0.1388905, 1, 0.3647059, 0, 1,
-1.547032, 0.4788686, -2.148803, 1, 0.372549, 0, 1,
-1.539174, 0.2352152, -0.9830337, 1, 0.3764706, 0, 1,
-1.5371, -1.256742, -1.708976, 1, 0.3843137, 0, 1,
-1.526794, 0.06517392, -1.473019, 1, 0.3882353, 0, 1,
-1.513719, -0.6117069, -2.749642, 1, 0.3960784, 0, 1,
-1.500834, -1.87667, -2.576913, 1, 0.4039216, 0, 1,
-1.499926, 0.06492145, -1.082697, 1, 0.4078431, 0, 1,
-1.496002, -0.2406812, -0.7959691, 1, 0.4156863, 0, 1,
-1.495373, 0.005825897, -2.157878, 1, 0.4196078, 0, 1,
-1.493976, -0.6283783, -1.669351, 1, 0.427451, 0, 1,
-1.466668, 0.2806925, -1.307692, 1, 0.4313726, 0, 1,
-1.454825, -0.8584648, -2.321641, 1, 0.4392157, 0, 1,
-1.446784, 0.2155439, -2.113396, 1, 0.4431373, 0, 1,
-1.429189, 0.1510532, -1.744762, 1, 0.4509804, 0, 1,
-1.428575, 0.1329052, -1.968703, 1, 0.454902, 0, 1,
-1.419588, 0.7191396, -1.886133, 1, 0.4627451, 0, 1,
-1.410413, -1.533036, -2.836622, 1, 0.4666667, 0, 1,
-1.403501, -1.176495, -3.029363, 1, 0.4745098, 0, 1,
-1.400259, -0.5044694, -1.443999, 1, 0.4784314, 0, 1,
-1.393082, 2.275353, -1.203816, 1, 0.4862745, 0, 1,
-1.388678, -0.0500468, -1.565554, 1, 0.4901961, 0, 1,
-1.386913, -1.467793, -2.002242, 1, 0.4980392, 0, 1,
-1.385256, -1.747058, -3.424845, 1, 0.5058824, 0, 1,
-1.379976, -0.9644374, -1.698201, 1, 0.509804, 0, 1,
-1.378639, 0.6338509, -2.041219, 1, 0.5176471, 0, 1,
-1.376147, 1.396922, -0.6088325, 1, 0.5215687, 0, 1,
-1.360546, 0.7483889, 0.2832356, 1, 0.5294118, 0, 1,
-1.357326, -0.5926413, -1.91834, 1, 0.5333334, 0, 1,
-1.354726, 0.3272134, 0.2103418, 1, 0.5411765, 0, 1,
-1.351653, -0.846091, -3.668334, 1, 0.5450981, 0, 1,
-1.335379, -1.022828, -2.939033, 1, 0.5529412, 0, 1,
-1.334508, -0.2595268, -2.23805, 1, 0.5568628, 0, 1,
-1.320574, 0.5293573, -0.8148746, 1, 0.5647059, 0, 1,
-1.317322, -0.1696138, -0.9913949, 1, 0.5686275, 0, 1,
-1.315897, -0.2374436, -1.763758, 1, 0.5764706, 0, 1,
-1.313619, -1.011519, -3.486895, 1, 0.5803922, 0, 1,
-1.305792, -1.386077, -2.822845, 1, 0.5882353, 0, 1,
-1.303556, -1.049731, -1.976342, 1, 0.5921569, 0, 1,
-1.290342, 0.9133888, -2.555715, 1, 0.6, 0, 1,
-1.269308, 0.7787716, -0.9059104, 1, 0.6078432, 0, 1,
-1.266237, 0.4794807, -0.177918, 1, 0.6117647, 0, 1,
-1.266175, -1.309137, -2.935059, 1, 0.6196079, 0, 1,
-1.252977, -2.023885, -2.250015, 1, 0.6235294, 0, 1,
-1.24871, 0.1973104, -1.019343, 1, 0.6313726, 0, 1,
-1.24613, 2.036502, -0.009475806, 1, 0.6352941, 0, 1,
-1.241988, -0.2103442, -3.927161, 1, 0.6431373, 0, 1,
-1.232571, 0.7008852, -0.8756939, 1, 0.6470588, 0, 1,
-1.232221, -0.6695728, -1.837114, 1, 0.654902, 0, 1,
-1.231923, 1.05, -1.080091, 1, 0.6588235, 0, 1,
-1.230865, -1.209002, -1.180317, 1, 0.6666667, 0, 1,
-1.230833, 0.1083602, -3.488713, 1, 0.6705883, 0, 1,
-1.223791, -1.605648, -2.708714, 1, 0.6784314, 0, 1,
-1.220644, -0.5802411, -3.565661, 1, 0.682353, 0, 1,
-1.217634, 0.3928443, -2.372952, 1, 0.6901961, 0, 1,
-1.215609, 0.9077107, -1.659995, 1, 0.6941177, 0, 1,
-1.206819, 0.7135013, -1.2876, 1, 0.7019608, 0, 1,
-1.202476, 1.386611, -2.231626, 1, 0.7098039, 0, 1,
-1.197357, 2.530011, -1.452445, 1, 0.7137255, 0, 1,
-1.195324, 1.039696, -0.2889197, 1, 0.7215686, 0, 1,
-1.194999, -0.05890797, -2.45014, 1, 0.7254902, 0, 1,
-1.191605, 0.7431579, -2.005382, 1, 0.7333333, 0, 1,
-1.190514, -0.5876663, -1.816649, 1, 0.7372549, 0, 1,
-1.189951, 1.24626, -2.421783, 1, 0.7450981, 0, 1,
-1.187549, -0.5127618, -2.45941, 1, 0.7490196, 0, 1,
-1.182527, -0.6198017, -1.094901, 1, 0.7568628, 0, 1,
-1.181165, -0.857775, -2.969818, 1, 0.7607843, 0, 1,
-1.179565, -1.412696, -3.243477, 1, 0.7686275, 0, 1,
-1.176998, -0.1415649, -1.523534, 1, 0.772549, 0, 1,
-1.17117, -1.052955, -1.955028, 1, 0.7803922, 0, 1,
-1.170608, -0.7331194, -3.517758, 1, 0.7843137, 0, 1,
-1.170127, -1.36823, -4.786593, 1, 0.7921569, 0, 1,
-1.160461, -0.5849623, -1.16729, 1, 0.7960784, 0, 1,
-1.15891, -1.588845, -1.191718, 1, 0.8039216, 0, 1,
-1.156643, -0.9486862, -2.280322, 1, 0.8117647, 0, 1,
-1.155469, 1.642067, 0.5428371, 1, 0.8156863, 0, 1,
-1.155174, 0.1030634, -1.318101, 1, 0.8235294, 0, 1,
-1.144732, -0.9550145, -2.644383, 1, 0.827451, 0, 1,
-1.14317, -0.9465783, -1.604485, 1, 0.8352941, 0, 1,
-1.14209, -1.980291, -2.446381, 1, 0.8392157, 0, 1,
-1.139406, 0.06518145, -3.897701, 1, 0.8470588, 0, 1,
-1.131017, 1.510805, -1.371931, 1, 0.8509804, 0, 1,
-1.130948, 1.478318, -1.633495, 1, 0.8588235, 0, 1,
-1.127897, -0.548708, -2.75046, 1, 0.8627451, 0, 1,
-1.126466, -0.727935, -2.397542, 1, 0.8705882, 0, 1,
-1.124869, -0.2013425, -1.336299, 1, 0.8745098, 0, 1,
-1.116923, -1.150216, -1.202226, 1, 0.8823529, 0, 1,
-1.111408, 0.8737133, -0.0588151, 1, 0.8862745, 0, 1,
-1.09935, 1.606512, -0.6961809, 1, 0.8941177, 0, 1,
-1.09639, 0.02777788, -1.938918, 1, 0.8980392, 0, 1,
-1.089363, -0.2223082, -2.157378, 1, 0.9058824, 0, 1,
-1.071993, -0.6101846, -1.117179, 1, 0.9137255, 0, 1,
-1.071632, -0.2233346, -2.264651, 1, 0.9176471, 0, 1,
-1.069578, 1.862145, -0.92572, 1, 0.9254902, 0, 1,
-1.065486, -0.02005276, -2.439668, 1, 0.9294118, 0, 1,
-1.062514, 0.9982293, -1.878932, 1, 0.9372549, 0, 1,
-1.061337, -0.2933165, -3.461696, 1, 0.9411765, 0, 1,
-1.057358, 0.2008836, 0.4016486, 1, 0.9490196, 0, 1,
-1.055853, -1.091078, -2.185981, 1, 0.9529412, 0, 1,
-1.054594, 0.3883728, -1.731784, 1, 0.9607843, 0, 1,
-1.050535, -0.5624734, -2.468333, 1, 0.9647059, 0, 1,
-1.041649, 0.9899754, -0.9837711, 1, 0.972549, 0, 1,
-1.034376, 0.7748784, -0.2982244, 1, 0.9764706, 0, 1,
-1.029567, -1.647155, -1.528501, 1, 0.9843137, 0, 1,
-1.028556, -0.7385575, -1.072807, 1, 0.9882353, 0, 1,
-1.026829, -0.934666, -4.019174, 1, 0.9960784, 0, 1,
-1.017416, -1.057453, -5.322198, 0.9960784, 1, 0, 1,
-1.015059, -0.2730671, -2.246247, 0.9921569, 1, 0, 1,
-1.009702, 0.09827818, -2.800549, 0.9843137, 1, 0, 1,
-1.006974, 0.2465963, -0.5528836, 0.9803922, 1, 0, 1,
-1.002827, -0.4334748, -1.777985, 0.972549, 1, 0, 1,
-0.9953235, 1.585562, -0.09210302, 0.9686275, 1, 0, 1,
-0.9947519, 0.2006182, -0.6792544, 0.9607843, 1, 0, 1,
-0.9857845, -0.0243229, -3.58353, 0.9568627, 1, 0, 1,
-0.9850662, 0.9594074, -1.892656, 0.9490196, 1, 0, 1,
-0.9836442, 0.9272695, -0.4875126, 0.945098, 1, 0, 1,
-0.9830494, -0.2591456, -0.03906592, 0.9372549, 1, 0, 1,
-0.9778612, -0.5237985, -3.258195, 0.9333333, 1, 0, 1,
-0.9774793, 2.391975, -1.580249, 0.9254902, 1, 0, 1,
-0.9661202, -0.2711026, -1.992715, 0.9215686, 1, 0, 1,
-0.9633467, -0.6398582, -2.514851, 0.9137255, 1, 0, 1,
-0.943803, -0.05832009, -2.334979, 0.9098039, 1, 0, 1,
-0.9321474, -0.5434338, -1.728447, 0.9019608, 1, 0, 1,
-0.9289972, -0.4430371, -0.5979785, 0.8941177, 1, 0, 1,
-0.9284108, 0.3796735, -2.233991, 0.8901961, 1, 0, 1,
-0.9206895, 0.696215, -2.24544, 0.8823529, 1, 0, 1,
-0.9196306, 0.7948408, -0.940529, 0.8784314, 1, 0, 1,
-0.9097093, 0.5835875, -0.8637535, 0.8705882, 1, 0, 1,
-0.907874, 1.001635, -1.321566, 0.8666667, 1, 0, 1,
-0.9050516, 0.4872819, -1.962736, 0.8588235, 1, 0, 1,
-0.8970033, 1.165666, -1.841731, 0.854902, 1, 0, 1,
-0.8949487, 0.4905336, -0.7567354, 0.8470588, 1, 0, 1,
-0.8888428, 1.332825, -1.246672, 0.8431373, 1, 0, 1,
-0.8867977, -0.5489205, -4.181684, 0.8352941, 1, 0, 1,
-0.8823063, -1.301253, -1.948069, 0.8313726, 1, 0, 1,
-0.8814455, -0.02964489, -0.3960526, 0.8235294, 1, 0, 1,
-0.8798454, -0.1749536, -2.932083, 0.8196079, 1, 0, 1,
-0.8747468, -2.483166, -2.532887, 0.8117647, 1, 0, 1,
-0.8707734, -0.9253592, 0.1909999, 0.8078431, 1, 0, 1,
-0.8522545, 0.02059396, -3.109571, 0.8, 1, 0, 1,
-0.8493022, 1.640688, -1.26582, 0.7921569, 1, 0, 1,
-0.8486974, 1.641426, 0.8832876, 0.7882353, 1, 0, 1,
-0.8461985, -0.4693852, -3.536162, 0.7803922, 1, 0, 1,
-0.8461069, -1.749835, -3.377996, 0.7764706, 1, 0, 1,
-0.8388982, -0.5961927, -3.791354, 0.7686275, 1, 0, 1,
-0.8366907, 0.8007755, 0.4154297, 0.7647059, 1, 0, 1,
-0.8273582, 0.07160559, -1.327859, 0.7568628, 1, 0, 1,
-0.8257264, -3.399757, -2.042332, 0.7529412, 1, 0, 1,
-0.8251835, -0.4302378, -1.769067, 0.7450981, 1, 0, 1,
-0.8229547, 2.08233, -0.7415772, 0.7411765, 1, 0, 1,
-0.8181244, 0.7193841, -1.740415, 0.7333333, 1, 0, 1,
-0.8146226, -0.09603223, 0.971693, 0.7294118, 1, 0, 1,
-0.8137591, -1.407865, -3.569167, 0.7215686, 1, 0, 1,
-0.8103645, 0.575205, -0.1904318, 0.7176471, 1, 0, 1,
-0.8099305, 2.278105, 0.7017017, 0.7098039, 1, 0, 1,
-0.8045358, -0.5954625, -3.258859, 0.7058824, 1, 0, 1,
-0.8041604, 2.94063, 0.1652353, 0.6980392, 1, 0, 1,
-0.8033544, 0.9109198, -2.518545, 0.6901961, 1, 0, 1,
-0.7974061, -1.646349, -2.149674, 0.6862745, 1, 0, 1,
-0.7969856, -0.1839931, -0.1957966, 0.6784314, 1, 0, 1,
-0.7929996, 0.07484905, -1.222308, 0.6745098, 1, 0, 1,
-0.7910548, -1.730475, -4.257279, 0.6666667, 1, 0, 1,
-0.791043, 0.5367945, -0.8570277, 0.6627451, 1, 0, 1,
-0.7886291, -0.4889396, -1.878824, 0.654902, 1, 0, 1,
-0.7844956, -0.7442961, -0.5978411, 0.6509804, 1, 0, 1,
-0.781128, 0.8265946, -0.8217254, 0.6431373, 1, 0, 1,
-0.780194, -0.4114214, -1.655397, 0.6392157, 1, 0, 1,
-0.777216, 1.077065, -0.6611468, 0.6313726, 1, 0, 1,
-0.7694218, 0.6095591, -0.8745874, 0.627451, 1, 0, 1,
-0.7655948, -0.7621229, -2.133401, 0.6196079, 1, 0, 1,
-0.7635472, -0.8453997, -3.044819, 0.6156863, 1, 0, 1,
-0.7610546, -0.8334363, -1.678489, 0.6078432, 1, 0, 1,
-0.7549474, 0.7575208, -0.1806483, 0.6039216, 1, 0, 1,
-0.7546657, -0.05906719, -1.928138, 0.5960785, 1, 0, 1,
-0.7420319, -1.21459, -1.988527, 0.5882353, 1, 0, 1,
-0.7375028, -0.1615732, -0.8758523, 0.5843138, 1, 0, 1,
-0.7311178, -0.2986902, -3.179469, 0.5764706, 1, 0, 1,
-0.7293916, 1.113346, -1.368657, 0.572549, 1, 0, 1,
-0.7281154, -0.9723292, -0.1035692, 0.5647059, 1, 0, 1,
-0.7271507, -0.5812573, -3.122715, 0.5607843, 1, 0, 1,
-0.7247823, 0.7259856, -1.561501, 0.5529412, 1, 0, 1,
-0.7216175, 1.552931, -1.618033, 0.5490196, 1, 0, 1,
-0.7177969, 1.388816, 0.388227, 0.5411765, 1, 0, 1,
-0.7101178, -2.081059, -3.03671, 0.5372549, 1, 0, 1,
-0.702697, 1.376463, -2.029364, 0.5294118, 1, 0, 1,
-0.6936697, -0.5221316, -1.696268, 0.5254902, 1, 0, 1,
-0.6897789, 1.716637, -2.570808, 0.5176471, 1, 0, 1,
-0.6892359, 0.5869271, 0.9779117, 0.5137255, 1, 0, 1,
-0.6888601, 0.4435729, -1.809598, 0.5058824, 1, 0, 1,
-0.6840692, -0.9824722, -2.823772, 0.5019608, 1, 0, 1,
-0.682205, -0.2738305, -2.222414, 0.4941176, 1, 0, 1,
-0.6751587, 0.7818573, -1.770635, 0.4862745, 1, 0, 1,
-0.6694085, 2.538176, 0.5927412, 0.4823529, 1, 0, 1,
-0.6662949, -0.1007396, -1.557073, 0.4745098, 1, 0, 1,
-0.6640714, 0.1793426, 0.1204485, 0.4705882, 1, 0, 1,
-0.6635067, -1.677647, -2.467484, 0.4627451, 1, 0, 1,
-0.6607165, 0.2684698, -0.7255379, 0.4588235, 1, 0, 1,
-0.6597562, 1.000066, 0.1157649, 0.4509804, 1, 0, 1,
-0.659575, -0.06838917, -2.319845, 0.4470588, 1, 0, 1,
-0.6593474, -2.143236, -4.355489, 0.4392157, 1, 0, 1,
-0.6588563, -0.5161641, -2.067327, 0.4352941, 1, 0, 1,
-0.658039, -0.1797431, -2.816124, 0.427451, 1, 0, 1,
-0.6570001, -0.0764212, -0.8886973, 0.4235294, 1, 0, 1,
-0.6563, 0.4786277, 0.3160111, 0.4156863, 1, 0, 1,
-0.6529346, 0.5557072, -0.877253, 0.4117647, 1, 0, 1,
-0.639676, -0.7298944, -2.82653, 0.4039216, 1, 0, 1,
-0.6331462, 0.9264371, 0.2199474, 0.3960784, 1, 0, 1,
-0.6329771, 0.9599298, -1.021065, 0.3921569, 1, 0, 1,
-0.631955, 0.4413902, -1.338493, 0.3843137, 1, 0, 1,
-0.6287761, -0.5726568, -3.10809, 0.3803922, 1, 0, 1,
-0.6257975, -1.153377, -1.406942, 0.372549, 1, 0, 1,
-0.623258, -2.08417, -2.784837, 0.3686275, 1, 0, 1,
-0.621267, 0.1143162, -1.884024, 0.3607843, 1, 0, 1,
-0.6209889, 1.927643, 0.5658125, 0.3568628, 1, 0, 1,
-0.6205593, 0.9949359, 0.06516548, 0.3490196, 1, 0, 1,
-0.6186373, 1.002938, 0.7802407, 0.345098, 1, 0, 1,
-0.6183051, 0.1033877, -1.287353, 0.3372549, 1, 0, 1,
-0.6140004, 0.6325962, -0.5268387, 0.3333333, 1, 0, 1,
-0.6127456, -0.8077329, -1.779412, 0.3254902, 1, 0, 1,
-0.60844, -0.6166068, -2.647592, 0.3215686, 1, 0, 1,
-0.6074926, -0.6059729, -2.727165, 0.3137255, 1, 0, 1,
-0.6037298, 1.287717, -0.7586463, 0.3098039, 1, 0, 1,
-0.602196, -0.2795129, -0.9845842, 0.3019608, 1, 0, 1,
-0.5992278, 0.539416, -0.6751935, 0.2941177, 1, 0, 1,
-0.5947052, 0.5817577, -0.6475502, 0.2901961, 1, 0, 1,
-0.5928562, 0.2690388, -0.6278999, 0.282353, 1, 0, 1,
-0.5869926, 0.5722032, 1.37889, 0.2784314, 1, 0, 1,
-0.5843194, -1.416453, -3.745599, 0.2705882, 1, 0, 1,
-0.5800552, -0.4200082, -2.359972, 0.2666667, 1, 0, 1,
-0.5758173, -0.004027677, -1.026986, 0.2588235, 1, 0, 1,
-0.5707733, 0.03663096, -1.611467, 0.254902, 1, 0, 1,
-0.5671041, 0.1899315, -1.444966, 0.2470588, 1, 0, 1,
-0.5653511, -2.223814, -1.535196, 0.2431373, 1, 0, 1,
-0.5635095, 0.4914237, -0.0009909071, 0.2352941, 1, 0, 1,
-0.5550948, -0.06452084, -1.475674, 0.2313726, 1, 0, 1,
-0.5547838, 0.08493302, -2.666643, 0.2235294, 1, 0, 1,
-0.5499153, -0.5292701, -2.248574, 0.2196078, 1, 0, 1,
-0.5441927, -0.2825571, 0.1619619, 0.2117647, 1, 0, 1,
-0.5409435, -0.617497, -3.696682, 0.2078431, 1, 0, 1,
-0.5400701, -1.622137, -2.552164, 0.2, 1, 0, 1,
-0.5360649, -0.3357587, -3.87274, 0.1921569, 1, 0, 1,
-0.5349148, 0.8537933, 0.4966326, 0.1882353, 1, 0, 1,
-0.531524, -0.06927228, 0.2506531, 0.1803922, 1, 0, 1,
-0.530803, 0.4986087, -2.025161, 0.1764706, 1, 0, 1,
-0.5307214, 1.21932, 0.01299143, 0.1686275, 1, 0, 1,
-0.5184543, 0.1047718, -1.196511, 0.1647059, 1, 0, 1,
-0.5163367, 1.18321, 0.7199121, 0.1568628, 1, 0, 1,
-0.5147956, -1.658707, -3.113227, 0.1529412, 1, 0, 1,
-0.5139945, 1.039194, 0.5839427, 0.145098, 1, 0, 1,
-0.5107961, 1.594461, 1.143264, 0.1411765, 1, 0, 1,
-0.5094619, -0.05694272, -1.028752, 0.1333333, 1, 0, 1,
-0.5074922, -0.1925043, -1.650453, 0.1294118, 1, 0, 1,
-0.5073672, 0.6334369, -1.424053, 0.1215686, 1, 0, 1,
-0.5064766, -2.495727, -4.260521, 0.1176471, 1, 0, 1,
-0.5058583, -0.9551067, -2.861962, 0.1098039, 1, 0, 1,
-0.5031139, 0.7559988, -1.227144, 0.1058824, 1, 0, 1,
-0.5021323, -0.4194395, -2.688894, 0.09803922, 1, 0, 1,
-0.5009531, -0.7825851, -0.9919352, 0.09019608, 1, 0, 1,
-0.4975293, -0.5560213, -3.464255, 0.08627451, 1, 0, 1,
-0.495822, -0.8800914, -3.887899, 0.07843138, 1, 0, 1,
-0.4934376, 0.7618994, -0.5755987, 0.07450981, 1, 0, 1,
-0.4858691, 0.08877839, -1.395499, 0.06666667, 1, 0, 1,
-0.4829931, 0.8354188, -1.487478, 0.0627451, 1, 0, 1,
-0.4727749, -0.1192385, 0.3492158, 0.05490196, 1, 0, 1,
-0.4726448, 1.370021, 0.0776084, 0.05098039, 1, 0, 1,
-0.4699693, -0.004298486, -0.3386185, 0.04313726, 1, 0, 1,
-0.4673292, -1.112219, -1.848864, 0.03921569, 1, 0, 1,
-0.4644942, -0.5853375, -2.380025, 0.03137255, 1, 0, 1,
-0.4641873, -0.644071, -1.339292, 0.02745098, 1, 0, 1,
-0.45949, -1.086407, -3.360624, 0.01960784, 1, 0, 1,
-0.4580004, 0.836776, 1.245076, 0.01568628, 1, 0, 1,
-0.4577492, 0.7329941, 0.7633561, 0.007843138, 1, 0, 1,
-0.4576675, 0.1019004, -2.087369, 0.003921569, 1, 0, 1,
-0.4474649, -0.03348948, -0.774551, 0, 1, 0.003921569, 1,
-0.4459618, 0.2297981, -1.020449, 0, 1, 0.01176471, 1,
-0.4453863, -1.417102, -3.235272, 0, 1, 0.01568628, 1,
-0.4437633, 0.9159398, 0.622442, 0, 1, 0.02352941, 1,
-0.4359739, 2.070018, 0.418427, 0, 1, 0.02745098, 1,
-0.4326245, 0.1634942, -1.10499, 0, 1, 0.03529412, 1,
-0.4285058, 0.9513618, -0.9341772, 0, 1, 0.03921569, 1,
-0.4278366, -0.9228337, -4.578125, 0, 1, 0.04705882, 1,
-0.4161898, 0.2806439, -1.834245, 0, 1, 0.05098039, 1,
-0.4159053, -0.6741177, -3.109267, 0, 1, 0.05882353, 1,
-0.4140423, 0.5778547, -2.018199, 0, 1, 0.0627451, 1,
-0.409644, 0.4822764, -2.619635, 0, 1, 0.07058824, 1,
-0.4063167, -2.317313, -3.085278, 0, 1, 0.07450981, 1,
-0.405219, -1.869654, -3.19608, 0, 1, 0.08235294, 1,
-0.4049684, -0.726245, -2.054199, 0, 1, 0.08627451, 1,
-0.4026161, 1.704239, -0.8111503, 0, 1, 0.09411765, 1,
-0.4021527, -0.4379824, -2.246739, 0, 1, 0.1019608, 1,
-0.4007068, 0.5308268, -0.7828429, 0, 1, 0.1058824, 1,
-0.3941123, 1.038478, -0.8149653, 0, 1, 0.1137255, 1,
-0.3940555, -0.4716695, -2.587213, 0, 1, 0.1176471, 1,
-0.3938567, -0.9280303, -3.354675, 0, 1, 0.1254902, 1,
-0.3936788, -0.8961352, -2.439648, 0, 1, 0.1294118, 1,
-0.3905334, -0.4863935, -3.141484, 0, 1, 0.1372549, 1,
-0.3892043, 0.4868937, -1.643672, 0, 1, 0.1411765, 1,
-0.387833, 0.5232691, -1.366845, 0, 1, 0.1490196, 1,
-0.3826191, 1.624015, -0.7229705, 0, 1, 0.1529412, 1,
-0.3795135, 0.5753757, -1.677221, 0, 1, 0.1607843, 1,
-0.3794053, 0.7174023, -0.9768477, 0, 1, 0.1647059, 1,
-0.3769287, -0.02272562, -1.421089, 0, 1, 0.172549, 1,
-0.3749277, 0.2116347, 0.2843285, 0, 1, 0.1764706, 1,
-0.3711146, -1.950529, -4.099148, 0, 1, 0.1843137, 1,
-0.3690496, -1.109439, -2.676471, 0, 1, 0.1882353, 1,
-0.3609577, -0.5877646, -1.837419, 0, 1, 0.1960784, 1,
-0.3572462, -1.335822, -0.8942137, 0, 1, 0.2039216, 1,
-0.3510031, -0.3859659, -2.463509, 0, 1, 0.2078431, 1,
-0.3488443, -0.6582783, -4.163191, 0, 1, 0.2156863, 1,
-0.3482444, 1.432549, -0.9198238, 0, 1, 0.2196078, 1,
-0.3467639, 1.280992, -0.621531, 0, 1, 0.227451, 1,
-0.3466252, 0.7320846, -0.4955865, 0, 1, 0.2313726, 1,
-0.3460333, -1.229213, -3.388218, 0, 1, 0.2392157, 1,
-0.3459297, -0.5186291, -0.9592604, 0, 1, 0.2431373, 1,
-0.334559, -1.258258, -1.914338, 0, 1, 0.2509804, 1,
-0.3343105, -0.8340665, -3.739434, 0, 1, 0.254902, 1,
-0.3335797, -0.7326276, -2.351397, 0, 1, 0.2627451, 1,
-0.3299434, 0.1873313, -1.998789, 0, 1, 0.2666667, 1,
-0.3284394, -0.3209071, -2.601732, 0, 1, 0.2745098, 1,
-0.3242363, 0.4115687, -0.2325668, 0, 1, 0.2784314, 1,
-0.3205881, -1.855959, -4.217685, 0, 1, 0.2862745, 1,
-0.3205479, 0.63267, -0.6142408, 0, 1, 0.2901961, 1,
-0.3165433, 2.123719, -0.6312999, 0, 1, 0.2980392, 1,
-0.3150878, 0.371368, 0.1683181, 0, 1, 0.3058824, 1,
-0.3121722, 0.2316294, -1.326459, 0, 1, 0.3098039, 1,
-0.3111669, 2.158134, -0.8567917, 0, 1, 0.3176471, 1,
-0.3066849, 0.5637659, -0.8980779, 0, 1, 0.3215686, 1,
-0.3046475, -1.663541, -3.218596, 0, 1, 0.3294118, 1,
-0.3001237, 1.400067, 0.6943244, 0, 1, 0.3333333, 1,
-0.2989632, -0.6776253, -4.512262, 0, 1, 0.3411765, 1,
-0.2971208, 0.5020738, 0.3291276, 0, 1, 0.345098, 1,
-0.2967878, 0.08024672, -2.458153, 0, 1, 0.3529412, 1,
-0.2881712, -2.516751, -2.323331, 0, 1, 0.3568628, 1,
-0.2877162, -1.180699, -4.355777, 0, 1, 0.3647059, 1,
-0.2876978, 1.109647, -0.5764444, 0, 1, 0.3686275, 1,
-0.2875611, 0.3423431, -0.4778714, 0, 1, 0.3764706, 1,
-0.2852937, -0.5554104, -3.602405, 0, 1, 0.3803922, 1,
-0.2851472, 0.3408496, 0.2892083, 0, 1, 0.3882353, 1,
-0.2811904, -0.1465099, -3.313704, 0, 1, 0.3921569, 1,
-0.277578, 0.6850226, -0.07557881, 0, 1, 0.4, 1,
-0.2751604, 1.290072, -1.448578, 0, 1, 0.4078431, 1,
-0.2751343, -1.264724, -3.164592, 0, 1, 0.4117647, 1,
-0.271958, -1.308583, -2.673382, 0, 1, 0.4196078, 1,
-0.2706073, 0.5536778, -0.06090461, 0, 1, 0.4235294, 1,
-0.2679854, 1.404422, 0.8246146, 0, 1, 0.4313726, 1,
-0.2643142, 0.05209436, -2.311599, 0, 1, 0.4352941, 1,
-0.2637783, 1.212429, 1.638686, 0, 1, 0.4431373, 1,
-0.2534851, 0.6047843, 0.1949209, 0, 1, 0.4470588, 1,
-0.252858, -0.1043908, -1.241002, 0, 1, 0.454902, 1,
-0.2522821, 0.4616401, -0.1849274, 0, 1, 0.4588235, 1,
-0.2510088, -2.20037, -2.48431, 0, 1, 0.4666667, 1,
-0.2469023, -0.5029467, -1.693122, 0, 1, 0.4705882, 1,
-0.2466045, -0.9615313, -3.425488, 0, 1, 0.4784314, 1,
-0.2452554, -0.04192868, -2.17362, 0, 1, 0.4823529, 1,
-0.2438051, 0.4340741, -1.976624, 0, 1, 0.4901961, 1,
-0.2407153, 0.6957098, -0.3459305, 0, 1, 0.4941176, 1,
-0.2404612, 1.407741, 0.5633907, 0, 1, 0.5019608, 1,
-0.2391547, -0.2498835, -0.2304637, 0, 1, 0.509804, 1,
-0.2385222, -1.146275, -4.352005, 0, 1, 0.5137255, 1,
-0.2358049, -0.1544901, -3.119037, 0, 1, 0.5215687, 1,
-0.2290611, 1.389465, 1.061058, 0, 1, 0.5254902, 1,
-0.228784, -0.5495908, -1.581974, 0, 1, 0.5333334, 1,
-0.2144113, 1.088431, -1.06186, 0, 1, 0.5372549, 1,
-0.2060166, 0.08431894, -2.702389, 0, 1, 0.5450981, 1,
-0.2048992, 0.006880651, -2.569526, 0, 1, 0.5490196, 1,
-0.2047711, 0.8317153, -1.756063, 0, 1, 0.5568628, 1,
-0.1967777, 0.7016285, -1.324193, 0, 1, 0.5607843, 1,
-0.1959978, 1.22348, 1.526532, 0, 1, 0.5686275, 1,
-0.1934547, -0.6795456, -4.527287, 0, 1, 0.572549, 1,
-0.1929918, 0.5263199, -0.5873742, 0, 1, 0.5803922, 1,
-0.1923747, -0.04294442, -3.093478, 0, 1, 0.5843138, 1,
-0.1893417, -1.47649, -3.185172, 0, 1, 0.5921569, 1,
-0.1843408, 1.350596, -0.5326183, 0, 1, 0.5960785, 1,
-0.183074, -0.8286017, -2.657764, 0, 1, 0.6039216, 1,
-0.1830028, -0.6053311, -1.947348, 0, 1, 0.6117647, 1,
-0.1829114, -0.8810796, -1.6266, 0, 1, 0.6156863, 1,
-0.1787575, 0.3498115, 0.2347389, 0, 1, 0.6235294, 1,
-0.1781419, 0.5008588, 0.07555958, 0, 1, 0.627451, 1,
-0.1747115, 0.6133839, -0.3317524, 0, 1, 0.6352941, 1,
-0.1712432, 0.04713291, -0.5676556, 0, 1, 0.6392157, 1,
-0.1706754, 0.7471757, -0.9373863, 0, 1, 0.6470588, 1,
-0.167453, -1.726538, -3.671062, 0, 1, 0.6509804, 1,
-0.1631409, 0.8127396, 0.8407807, 0, 1, 0.6588235, 1,
-0.1609575, -0.4228162, -2.091163, 0, 1, 0.6627451, 1,
-0.1603695, 0.3565489, -2.230346, 0, 1, 0.6705883, 1,
-0.1588771, -1.190756, -2.405636, 0, 1, 0.6745098, 1,
-0.157529, -0.4917483, -3.883802, 0, 1, 0.682353, 1,
-0.1573805, 2.057201, -2.2448, 0, 1, 0.6862745, 1,
-0.1513887, -0.4783492, -2.529822, 0, 1, 0.6941177, 1,
-0.1504376, 0.626493, -0.6848234, 0, 1, 0.7019608, 1,
-0.1439057, 0.9173735, -0.5496282, 0, 1, 0.7058824, 1,
-0.1425843, -1.107319, -3.93365, 0, 1, 0.7137255, 1,
-0.1386304, -0.5065238, -3.818355, 0, 1, 0.7176471, 1,
-0.1369537, 1.905078, -0.9158381, 0, 1, 0.7254902, 1,
-0.1367878, 0.3377926, -0.7838668, 0, 1, 0.7294118, 1,
-0.1346191, 0.6451243, -0.3351596, 0, 1, 0.7372549, 1,
-0.1315445, 0.6415765, -0.7594202, 0, 1, 0.7411765, 1,
-0.1220905, 1.361671, 0.3197024, 0, 1, 0.7490196, 1,
-0.1187975, -1.248441, -3.934323, 0, 1, 0.7529412, 1,
-0.1164594, -0.1534161, -3.320658, 0, 1, 0.7607843, 1,
-0.1134145, -1.640988, -2.989028, 0, 1, 0.7647059, 1,
-0.1106461, 1.270478, 0.7154601, 0, 1, 0.772549, 1,
-0.1096888, -1.569179, -3.942686, 0, 1, 0.7764706, 1,
-0.1046401, 0.6362985, -0.4225123, 0, 1, 0.7843137, 1,
-0.1017224, 1.108403, 0.3778687, 0, 1, 0.7882353, 1,
-0.101049, 0.2145069, -0.4405489, 0, 1, 0.7960784, 1,
-0.1005381, 0.8716412, -0.8446597, 0, 1, 0.8039216, 1,
-0.09764188, 0.589175, -1.534363, 0, 1, 0.8078431, 1,
-0.09677206, -1.149386, -0.9366966, 0, 1, 0.8156863, 1,
-0.09139492, 0.8618181, -0.1028979, 0, 1, 0.8196079, 1,
-0.08726789, 0.8295472, 0.02870026, 0, 1, 0.827451, 1,
-0.08690862, 0.067191, -1.927979, 0, 1, 0.8313726, 1,
-0.07730744, 0.9377866, -1.332002, 0, 1, 0.8392157, 1,
-0.07648481, 0.09448867, -1.19639, 0, 1, 0.8431373, 1,
-0.07593121, -0.8977472, -5.572049, 0, 1, 0.8509804, 1,
-0.07450899, 0.09614769, -0.9448163, 0, 1, 0.854902, 1,
-0.07269455, -0.3999332, -2.942139, 0, 1, 0.8627451, 1,
-0.06885283, -0.4386917, -6.012897, 0, 1, 0.8666667, 1,
-0.05544804, -1.802181, -2.046217, 0, 1, 0.8745098, 1,
-0.05400761, -0.4611865, -2.587051, 0, 1, 0.8784314, 1,
-0.05388209, -3.317925, -4.674399, 0, 1, 0.8862745, 1,
-0.05173156, -1.176718, -2.943263, 0, 1, 0.8901961, 1,
-0.05007153, 0.7468191, -1.139835, 0, 1, 0.8980392, 1,
-0.04701066, 0.4687752, 0.8770154, 0, 1, 0.9058824, 1,
-0.04331753, -0.5692663, -3.889404, 0, 1, 0.9098039, 1,
-0.03743144, -0.209401, -2.10166, 0, 1, 0.9176471, 1,
-0.03276042, 0.5347976, -0.4269828, 0, 1, 0.9215686, 1,
-0.02855913, -1.102492, -1.962664, 0, 1, 0.9294118, 1,
-0.02648433, -0.1404983, -1.91424, 0, 1, 0.9333333, 1,
-0.01502184, 0.3636667, 1.307811, 0, 1, 0.9411765, 1,
-0.01442077, 0.4620129, -0.258699, 0, 1, 0.945098, 1,
-0.01397375, -1.669591, -2.529009, 0, 1, 0.9529412, 1,
-0.01023314, -0.7997481, -2.107972, 0, 1, 0.9568627, 1,
0.001858982, 2.271971, 1.425584, 0, 1, 0.9647059, 1,
0.002871618, -1.626159, 3.941287, 0, 1, 0.9686275, 1,
0.004379169, 0.00309186, 1.496461, 0, 1, 0.9764706, 1,
0.009414204, -0.5271165, 3.925901, 0, 1, 0.9803922, 1,
0.01047181, 0.2568602, 0.666787, 0, 1, 0.9882353, 1,
0.01239956, 1.579802, -0.3124541, 0, 1, 0.9921569, 1,
0.01393162, 1.780147, 1.225942, 0, 1, 1, 1,
0.01737984, -0.1973922, 4.346211, 0, 0.9921569, 1, 1,
0.02058536, -0.3400218, 2.071251, 0, 0.9882353, 1, 1,
0.02156415, -1.497094, 1.332598, 0, 0.9803922, 1, 1,
0.02249069, 0.2614159, -0.6777915, 0, 0.9764706, 1, 1,
0.02331778, 0.1637692, 1.670924, 0, 0.9686275, 1, 1,
0.02371201, 1.65924, -1.593908, 0, 0.9647059, 1, 1,
0.02449553, 0.8375099, 0.008434267, 0, 0.9568627, 1, 1,
0.03011225, -0.6365134, 3.322798, 0, 0.9529412, 1, 1,
0.03136824, -0.3332333, 3.286091, 0, 0.945098, 1, 1,
0.03581463, 0.3170041, 1.034897, 0, 0.9411765, 1, 1,
0.03724334, 1.801071, -1.416171, 0, 0.9333333, 1, 1,
0.04135395, -0.8704556, 3.589203, 0, 0.9294118, 1, 1,
0.04155803, -0.01654555, 1.400878, 0, 0.9215686, 1, 1,
0.04676298, 2.22793, -1.239834, 0, 0.9176471, 1, 1,
0.04801002, -0.4336784, 3.539282, 0, 0.9098039, 1, 1,
0.05276406, -0.6221794, 4.260831, 0, 0.9058824, 1, 1,
0.05404347, 0.1954082, 0.03553885, 0, 0.8980392, 1, 1,
0.05880883, 2.347691, -1.795469, 0, 0.8901961, 1, 1,
0.06296121, -0.747368, 4.319122, 0, 0.8862745, 1, 1,
0.06558628, -1.204981, 1.927982, 0, 0.8784314, 1, 1,
0.06599186, -0.3770252, 2.623207, 0, 0.8745098, 1, 1,
0.06709983, -0.6953172, 4.06274, 0, 0.8666667, 1, 1,
0.07891568, 1.052216, 0.1306772, 0, 0.8627451, 1, 1,
0.0804501, 0.1740067, 0.2882789, 0, 0.854902, 1, 1,
0.0849051, -0.4133399, 2.49784, 0, 0.8509804, 1, 1,
0.0852254, 0.6080666, 0.4242488, 0, 0.8431373, 1, 1,
0.08542785, -0.06993371, 2.031583, 0, 0.8392157, 1, 1,
0.1060234, -0.5205121, 2.872366, 0, 0.8313726, 1, 1,
0.1063678, -2.143912, 3.12003, 0, 0.827451, 1, 1,
0.1098669, 0.1813395, 0.222486, 0, 0.8196079, 1, 1,
0.1136217, -0.8488371, 2.768889, 0, 0.8156863, 1, 1,
0.1178248, -0.9669049, 4.516294, 0, 0.8078431, 1, 1,
0.1181771, -0.4083592, 4.091086, 0, 0.8039216, 1, 1,
0.1208761, -1.122128, 4.515446, 0, 0.7960784, 1, 1,
0.1255236, 0.7070165, 1.829754, 0, 0.7882353, 1, 1,
0.1262006, 0.3223621, 0.9788106, 0, 0.7843137, 1, 1,
0.1302166, 0.02145404, 1.937652, 0, 0.7764706, 1, 1,
0.1304397, 0.6536036, 0.9015563, 0, 0.772549, 1, 1,
0.1316317, 1.012012, 1.199327, 0, 0.7647059, 1, 1,
0.1323975, 0.008356838, 0.8056793, 0, 0.7607843, 1, 1,
0.1329941, -0.09242269, 2.201713, 0, 0.7529412, 1, 1,
0.1354867, -0.9308736, 3.125474, 0, 0.7490196, 1, 1,
0.1365106, 1.355124, 0.07842266, 0, 0.7411765, 1, 1,
0.1365981, -0.5440171, 2.981556, 0, 0.7372549, 1, 1,
0.1372875, 0.5030231, -1.174323, 0, 0.7294118, 1, 1,
0.1423412, -1.670802, 2.349826, 0, 0.7254902, 1, 1,
0.1429742, 2.337692, -0.8599151, 0, 0.7176471, 1, 1,
0.1438163, -0.1572379, 0.00771773, 0, 0.7137255, 1, 1,
0.1468624, -0.09398175, 1.0811, 0, 0.7058824, 1, 1,
0.147336, 2.194656, 1.044391, 0, 0.6980392, 1, 1,
0.1515001, 1.535192, 0.6213912, 0, 0.6941177, 1, 1,
0.153414, -0.01349733, 1.895061, 0, 0.6862745, 1, 1,
0.1575679, -0.5423967, 3.715339, 0, 0.682353, 1, 1,
0.1595018, 1.88203, 1.181264, 0, 0.6745098, 1, 1,
0.1598012, -2.163122, 3.968693, 0, 0.6705883, 1, 1,
0.1636418, 0.3902389, -0.088898, 0, 0.6627451, 1, 1,
0.1665276, 1.26143, -0.004998038, 0, 0.6588235, 1, 1,
0.1749961, 0.1664948, 1.164213, 0, 0.6509804, 1, 1,
0.1776996, -1.883633, 2.309831, 0, 0.6470588, 1, 1,
0.1827916, -0.1500961, 4.0201, 0, 0.6392157, 1, 1,
0.1876247, -1.741678, 1.605713, 0, 0.6352941, 1, 1,
0.1929757, -0.6843436, 3.126781, 0, 0.627451, 1, 1,
0.1983478, 1.536235, -0.176469, 0, 0.6235294, 1, 1,
0.1996188, -0.5409893, 3.631293, 0, 0.6156863, 1, 1,
0.2008463, 0.4497477, -0.1161617, 0, 0.6117647, 1, 1,
0.2048597, -0.1696235, 1.877895, 0, 0.6039216, 1, 1,
0.2050079, 1.692744, -0.42756, 0, 0.5960785, 1, 1,
0.2072916, -0.5085314, 3.772389, 0, 0.5921569, 1, 1,
0.2092797, 0.6559839, 1.297828, 0, 0.5843138, 1, 1,
0.2126119, 0.7135421, 0.3759289, 0, 0.5803922, 1, 1,
0.2146222, 0.6339553, 0.7917986, 0, 0.572549, 1, 1,
0.2151268, -1.129, 2.604175, 0, 0.5686275, 1, 1,
0.2191593, 0.03447008, 0.5540714, 0, 0.5607843, 1, 1,
0.2201213, -0.02722075, 2.85275, 0, 0.5568628, 1, 1,
0.2203335, 1.174743, -0.5309517, 0, 0.5490196, 1, 1,
0.2222395, 0.6086956, 0.5275825, 0, 0.5450981, 1, 1,
0.2222576, 0.1383984, 1.494775, 0, 0.5372549, 1, 1,
0.2226925, 1.748212, -0.3943884, 0, 0.5333334, 1, 1,
0.2246439, 0.2862875, -1.168262, 0, 0.5254902, 1, 1,
0.2255638, 0.799166, -0.8611322, 0, 0.5215687, 1, 1,
0.2260799, 0.7424186, -0.7768152, 0, 0.5137255, 1, 1,
0.233043, -0.03479921, 2.179285, 0, 0.509804, 1, 1,
0.2335957, -0.4250005, 2.735311, 0, 0.5019608, 1, 1,
0.2339619, -1.121753, 1.884156, 0, 0.4941176, 1, 1,
0.2362332, -1.00513, 5.426841, 0, 0.4901961, 1, 1,
0.2371803, 0.763704, 0.07540343, 0, 0.4823529, 1, 1,
0.2377694, -0.7337691, 3.717048, 0, 0.4784314, 1, 1,
0.2400919, -0.6576451, 3.854631, 0, 0.4705882, 1, 1,
0.2411228, 0.005457893, 2.698591, 0, 0.4666667, 1, 1,
0.2456315, -1.757728, 3.334671, 0, 0.4588235, 1, 1,
0.2457749, -0.2319986, 1.901873, 0, 0.454902, 1, 1,
0.2510481, -0.1592909, 3.113342, 0, 0.4470588, 1, 1,
0.2536191, 0.686366, 0.7371708, 0, 0.4431373, 1, 1,
0.2541669, -0.6265252, 3.353409, 0, 0.4352941, 1, 1,
0.2607766, -1.320534, 2.538056, 0, 0.4313726, 1, 1,
0.2630829, -0.4770424, 0.8106128, 0, 0.4235294, 1, 1,
0.2642103, -1.638234, 2.657341, 0, 0.4196078, 1, 1,
0.2723013, -2.311209, 4.255987, 0, 0.4117647, 1, 1,
0.2733698, -0.09866404, 0.370332, 0, 0.4078431, 1, 1,
0.2753433, 0.7080746, 1.204774, 0, 0.4, 1, 1,
0.2858286, -1.813809, 2.027832, 0, 0.3921569, 1, 1,
0.2865817, 0.4751581, 1.172779, 0, 0.3882353, 1, 1,
0.2880228, 2.458746, 0.6700205, 0, 0.3803922, 1, 1,
0.289116, -0.1097593, 3.309797, 0, 0.3764706, 1, 1,
0.2922623, -0.5198094, 1.990951, 0, 0.3686275, 1, 1,
0.3001075, 0.1658764, 1.469642, 0, 0.3647059, 1, 1,
0.3012376, -0.8463013, 4.341038, 0, 0.3568628, 1, 1,
0.303255, 0.2258397, 2.48985, 0, 0.3529412, 1, 1,
0.3087258, -0.4548169, 2.754688, 0, 0.345098, 1, 1,
0.3146085, -1.287671, 2.273075, 0, 0.3411765, 1, 1,
0.315331, -0.9715392, 3.230815, 0, 0.3333333, 1, 1,
0.3173906, -0.2879431, 2.990123, 0, 0.3294118, 1, 1,
0.3189775, 0.5952731, -0.2258546, 0, 0.3215686, 1, 1,
0.327429, -0.437627, 2.333461, 0, 0.3176471, 1, 1,
0.3283004, -1.745642, 1.89235, 0, 0.3098039, 1, 1,
0.3318453, 0.4013166, 2.866363, 0, 0.3058824, 1, 1,
0.3347831, -1.139771, 2.184755, 0, 0.2980392, 1, 1,
0.3362104, 1.194548, 1.767967, 0, 0.2901961, 1, 1,
0.3390475, 0.02541008, 1.136725, 0, 0.2862745, 1, 1,
0.342688, 0.4625188, 1.617485, 0, 0.2784314, 1, 1,
0.3459977, -0.5955778, 3.43271, 0, 0.2745098, 1, 1,
0.3460285, 0.8201841, -0.3570048, 0, 0.2666667, 1, 1,
0.3465464, -0.3493071, 2.16005, 0, 0.2627451, 1, 1,
0.3506129, -0.2263445, 0.9298295, 0, 0.254902, 1, 1,
0.3607973, 1.203342, 0.4244253, 0, 0.2509804, 1, 1,
0.3636268, -0.3661418, 3.090356, 0, 0.2431373, 1, 1,
0.3657065, -0.3605051, 2.988869, 0, 0.2392157, 1, 1,
0.3664173, -0.5196187, 2.493414, 0, 0.2313726, 1, 1,
0.366703, -2.348554, 2.823254, 0, 0.227451, 1, 1,
0.3711607, 1.015149, 2.413175, 0, 0.2196078, 1, 1,
0.3716153, 0.6951546, 0.8613731, 0, 0.2156863, 1, 1,
0.3732196, 0.6214324, 0.5530333, 0, 0.2078431, 1, 1,
0.378802, -0.8830355, 3.734121, 0, 0.2039216, 1, 1,
0.3804268, -1.772375, 3.238641, 0, 0.1960784, 1, 1,
0.3817095, 0.6831322, -0.827557, 0, 0.1882353, 1, 1,
0.3871245, 0.2871151, 1.346268, 0, 0.1843137, 1, 1,
0.3906792, -0.6323408, 1.82592, 0, 0.1764706, 1, 1,
0.3939528, -0.006886821, 2.29039, 0, 0.172549, 1, 1,
0.3972593, 1.358779, -1.204088, 0, 0.1647059, 1, 1,
0.3982016, 0.4813349, -0.6617486, 0, 0.1607843, 1, 1,
0.4010243, 0.2617118, 0.7980793, 0, 0.1529412, 1, 1,
0.403407, -2.145349, 2.861669, 0, 0.1490196, 1, 1,
0.4047319, 1.549033, -0.4703896, 0, 0.1411765, 1, 1,
0.4070714, 0.9630026, 3.080525, 0, 0.1372549, 1, 1,
0.4149611, 0.4054052, -0.4713387, 0, 0.1294118, 1, 1,
0.415328, 0.9228519, -0.4745281, 0, 0.1254902, 1, 1,
0.4175792, 0.4749463, 2.0192, 0, 0.1176471, 1, 1,
0.4184602, -0.4279383, 2.440875, 0, 0.1137255, 1, 1,
0.4305753, -0.1907761, 2.395136, 0, 0.1058824, 1, 1,
0.4378412, -0.7986128, 5.48232, 0, 0.09803922, 1, 1,
0.444137, -0.4541331, 2.831458, 0, 0.09411765, 1, 1,
0.4470837, 0.3973244, 0.126957, 0, 0.08627451, 1, 1,
0.4484668, 1.069578, 0.1242219, 0, 0.08235294, 1, 1,
0.4495275, -0.2268328, 0.2798647, 0, 0.07450981, 1, 1,
0.4565638, -1.025833, 3.453392, 0, 0.07058824, 1, 1,
0.4566707, 1.512378, 1.515276, 0, 0.0627451, 1, 1,
0.4604527, -0.364546, 1.020494, 0, 0.05882353, 1, 1,
0.4648629, -1.296718, 1.319667, 0, 0.05098039, 1, 1,
0.4655875, 1.200193, 0.7505115, 0, 0.04705882, 1, 1,
0.4669248, -1.079699, 3.988024, 0, 0.03921569, 1, 1,
0.4730914, 0.5480962, -1.335679, 0, 0.03529412, 1, 1,
0.4742005, -1.802771, 2.815194, 0, 0.02745098, 1, 1,
0.4752816, 1.173928, -0.2948511, 0, 0.02352941, 1, 1,
0.4754183, 0.5537944, 1.899208, 0, 0.01568628, 1, 1,
0.4754561, 0.5222888, 0.5303276, 0, 0.01176471, 1, 1,
0.4771377, 1.312127, 2.115293, 0, 0.003921569, 1, 1,
0.4790053, 1.65803, 1.329544, 0.003921569, 0, 1, 1,
0.4838901, 0.0956266, 1.234296, 0.007843138, 0, 1, 1,
0.4852211, 0.7532089, 1.399395, 0.01568628, 0, 1, 1,
0.4865524, -0.4656529, 2.600496, 0.01960784, 0, 1, 1,
0.490303, 0.7417256, 1.469595, 0.02745098, 0, 1, 1,
0.4963306, -0.7792212, 2.637335, 0.03137255, 0, 1, 1,
0.5003281, -0.1682738, 1.656326, 0.03921569, 0, 1, 1,
0.505336, -1.176553, 1.770996, 0.04313726, 0, 1, 1,
0.5073329, -0.65674, 1.959051, 0.05098039, 0, 1, 1,
0.514282, 0.3769186, 0.1757995, 0.05490196, 0, 1, 1,
0.5144613, -0.6483332, 1.815455, 0.0627451, 0, 1, 1,
0.5174975, 1.289285, 1.617665, 0.06666667, 0, 1, 1,
0.5202819, -0.5824395, 3.006874, 0.07450981, 0, 1, 1,
0.5295619, 0.9940833, 0.1365297, 0.07843138, 0, 1, 1,
0.5301154, -0.1061021, 2.283699, 0.08627451, 0, 1, 1,
0.5306373, 0.3664322, 0.3118839, 0.09019608, 0, 1, 1,
0.5347965, 1.397087, 0.4576727, 0.09803922, 0, 1, 1,
0.5393407, 0.4796605, -0.1619822, 0.1058824, 0, 1, 1,
0.5398936, -0.5262302, 2.476961, 0.1098039, 0, 1, 1,
0.5500231, 0.231452, 0.1771223, 0.1176471, 0, 1, 1,
0.5523441, -1.214671, 3.469279, 0.1215686, 0, 1, 1,
0.5525544, 0.9195887, 0.4597697, 0.1294118, 0, 1, 1,
0.5561569, -0.5708436, 2.022602, 0.1333333, 0, 1, 1,
0.5572923, -0.9789752, 3.432858, 0.1411765, 0, 1, 1,
0.5578593, 0.3347111, 2.37897, 0.145098, 0, 1, 1,
0.558333, -0.1318713, 1.827784, 0.1529412, 0, 1, 1,
0.5595606, -0.2294994, 0.9443389, 0.1568628, 0, 1, 1,
0.5635951, 0.4398594, 1.560487, 0.1647059, 0, 1, 1,
0.5645478, 0.2300249, 2.575954, 0.1686275, 0, 1, 1,
0.5648275, -0.5009086, 1.274311, 0.1764706, 0, 1, 1,
0.5721508, -0.01650078, 0.6453999, 0.1803922, 0, 1, 1,
0.5745957, 2.528095, -0.1154694, 0.1882353, 0, 1, 1,
0.5756909, -2.028208, 3.162656, 0.1921569, 0, 1, 1,
0.580723, 0.08807838, 0.3005783, 0.2, 0, 1, 1,
0.5809046, -0.7641551, 2.351123, 0.2078431, 0, 1, 1,
0.5842872, -2.171173, 2.533463, 0.2117647, 0, 1, 1,
0.5882196, 0.2987294, -0.2520864, 0.2196078, 0, 1, 1,
0.5919843, 0.3965075, 2.139042, 0.2235294, 0, 1, 1,
0.5925044, -1.479995, 3.077368, 0.2313726, 0, 1, 1,
0.6034413, -0.2252619, 0.6902371, 0.2352941, 0, 1, 1,
0.6039667, 1.387987, 0.5188439, 0.2431373, 0, 1, 1,
0.6062161, 0.1590521, 2.082569, 0.2470588, 0, 1, 1,
0.6070369, 0.5783077, -0.1635139, 0.254902, 0, 1, 1,
0.6134602, -0.8577775, 2.35965, 0.2588235, 0, 1, 1,
0.6145703, -0.2944069, 3.192986, 0.2666667, 0, 1, 1,
0.6163107, 0.7940941, 0.4075855, 0.2705882, 0, 1, 1,
0.618429, -0.9130785, 1.906598, 0.2784314, 0, 1, 1,
0.6208759, -0.1334846, 1.843878, 0.282353, 0, 1, 1,
0.621969, -0.1625189, 1.545677, 0.2901961, 0, 1, 1,
0.6248406, -0.406206, 2.326027, 0.2941177, 0, 1, 1,
0.6309276, 0.8047065, 0.5050262, 0.3019608, 0, 1, 1,
0.6323913, -0.1686051, 1.250905, 0.3098039, 0, 1, 1,
0.6334296, 0.8810673, -0.3026593, 0.3137255, 0, 1, 1,
0.636122, 0.2193203, 1.370656, 0.3215686, 0, 1, 1,
0.6387745, 0.2513844, 0.4905578, 0.3254902, 0, 1, 1,
0.6417363, -0.2532587, 2.715139, 0.3333333, 0, 1, 1,
0.6473988, -0.1227563, 1.446988, 0.3372549, 0, 1, 1,
0.6504157, -1.236489, 2.913893, 0.345098, 0, 1, 1,
0.6548308, 1.511726, 1.433082, 0.3490196, 0, 1, 1,
0.6625499, -0.2707212, 2.039507, 0.3568628, 0, 1, 1,
0.6663733, -1.297968, 2.431618, 0.3607843, 0, 1, 1,
0.668174, -0.9074709, 1.808096, 0.3686275, 0, 1, 1,
0.6710025, -0.6606603, 2.550833, 0.372549, 0, 1, 1,
0.676577, -0.009033986, 1.04294, 0.3803922, 0, 1, 1,
0.6844369, 1.023012, 1.931127, 0.3843137, 0, 1, 1,
0.6863513, -0.04070741, 1.523861, 0.3921569, 0, 1, 1,
0.6901662, -0.9424368, 1.982695, 0.3960784, 0, 1, 1,
0.6922041, -0.3769825, 2.988493, 0.4039216, 0, 1, 1,
0.6935937, 1.457424, 0.9332528, 0.4117647, 0, 1, 1,
0.6951181, 0.7041805, 0.7130594, 0.4156863, 0, 1, 1,
0.6994259, -0.6238683, 3.038217, 0.4235294, 0, 1, 1,
0.7032965, -1.243097, 2.58557, 0.427451, 0, 1, 1,
0.708709, 0.8093349, 1.896493, 0.4352941, 0, 1, 1,
0.720567, 0.07981795, 1.519489, 0.4392157, 0, 1, 1,
0.7279883, 0.2594757, 1.235402, 0.4470588, 0, 1, 1,
0.7333378, 0.7648515, 1.021575, 0.4509804, 0, 1, 1,
0.7352546, 1.012839, 1.514768, 0.4588235, 0, 1, 1,
0.7367532, -0.1398402, 0.9039984, 0.4627451, 0, 1, 1,
0.7370648, -0.493363, 0.3970171, 0.4705882, 0, 1, 1,
0.7381922, -2.160428, 2.486611, 0.4745098, 0, 1, 1,
0.7387842, 0.05368335, 1.090441, 0.4823529, 0, 1, 1,
0.7404141, -1.048249, 2.627858, 0.4862745, 0, 1, 1,
0.7415919, 0.5664269, 1.456574, 0.4941176, 0, 1, 1,
0.7463005, -0.1163025, 0.8375817, 0.5019608, 0, 1, 1,
0.7477309, 2.277456, 1.506138, 0.5058824, 0, 1, 1,
0.7495018, -0.1885656, 2.937848, 0.5137255, 0, 1, 1,
0.7502858, -0.3284276, 0.2357135, 0.5176471, 0, 1, 1,
0.7536625, 0.682006, 0.4693755, 0.5254902, 0, 1, 1,
0.7544423, 2.240098, -1.258655, 0.5294118, 0, 1, 1,
0.7655579, 0.4951021, 0.681936, 0.5372549, 0, 1, 1,
0.7695689, 0.3840725, 1.519303, 0.5411765, 0, 1, 1,
0.770164, 0.3211259, 1.633582, 0.5490196, 0, 1, 1,
0.7704327, -0.3400548, 2.427159, 0.5529412, 0, 1, 1,
0.7719839, -0.493138, 3.798119, 0.5607843, 0, 1, 1,
0.7730028, -0.3175371, 1.042663, 0.5647059, 0, 1, 1,
0.7799529, 0.6978428, 2.114437, 0.572549, 0, 1, 1,
0.7890746, -0.2639799, 2.018011, 0.5764706, 0, 1, 1,
0.7903982, 1.016297, 1.529224, 0.5843138, 0, 1, 1,
0.7925321, -1.32917, 1.36205, 0.5882353, 0, 1, 1,
0.7949385, 1.501137, -0.7877692, 0.5960785, 0, 1, 1,
0.7962947, 0.6546558, -0.1560613, 0.6039216, 0, 1, 1,
0.7970248, 2.281153, -0.2870938, 0.6078432, 0, 1, 1,
0.8017677, 0.5263808, 0.356217, 0.6156863, 0, 1, 1,
0.8020231, 1.267709, 0.2634657, 0.6196079, 0, 1, 1,
0.8059771, 1.52216, 1.919729, 0.627451, 0, 1, 1,
0.806464, 0.7983028, 1.471996, 0.6313726, 0, 1, 1,
0.8073601, 0.4779513, 1.569485, 0.6392157, 0, 1, 1,
0.810396, 2.263863, -0.9052511, 0.6431373, 0, 1, 1,
0.810681, -0.01972702, 0.4572337, 0.6509804, 0, 1, 1,
0.8160238, -1.118166, 2.468564, 0.654902, 0, 1, 1,
0.8174323, -0.05904598, 1.118635, 0.6627451, 0, 1, 1,
0.8209379, 2.02424, 2.191165, 0.6666667, 0, 1, 1,
0.8236015, 1.085247, 2.769684, 0.6745098, 0, 1, 1,
0.82935, 0.6567427, 1.101178, 0.6784314, 0, 1, 1,
0.832734, 0.2397203, -0.4819027, 0.6862745, 0, 1, 1,
0.8329953, 0.4591456, 2.077734, 0.6901961, 0, 1, 1,
0.8356528, -1.532349, 3.935339, 0.6980392, 0, 1, 1,
0.8397365, 1.363911, 1.116852, 0.7058824, 0, 1, 1,
0.8421139, 0.2458089, 0.5626312, 0.7098039, 0, 1, 1,
0.8426536, -0.951183, 2.339898, 0.7176471, 0, 1, 1,
0.8436438, 1.1116, -0.04599734, 0.7215686, 0, 1, 1,
0.8456151, -0.9916626, 2.698299, 0.7294118, 0, 1, 1,
0.8465458, 0.2893244, 1.815651, 0.7333333, 0, 1, 1,
0.8475049, -0.06155011, 0.1805568, 0.7411765, 0, 1, 1,
0.8511121, 1.010408, 2.937378, 0.7450981, 0, 1, 1,
0.8534681, 2.40393, 0.1430774, 0.7529412, 0, 1, 1,
0.8567815, 0.5035719, 0.5146182, 0.7568628, 0, 1, 1,
0.8571384, -0.8131214, 2.495885, 0.7647059, 0, 1, 1,
0.8573046, 0.2192668, 0.780198, 0.7686275, 0, 1, 1,
0.8575327, 0.223895, 1.223174, 0.7764706, 0, 1, 1,
0.8579277, -0.4108865, 1.395556, 0.7803922, 0, 1, 1,
0.8683303, 0.07592016, 2.148003, 0.7882353, 0, 1, 1,
0.8714767, -2.328511, 2.109119, 0.7921569, 0, 1, 1,
0.8733281, 1.297254, 1.009128, 0.8, 0, 1, 1,
0.8816585, -1.101087, 2.046509, 0.8078431, 0, 1, 1,
0.8859789, 0.2896409, 1.224649, 0.8117647, 0, 1, 1,
0.894287, 0.5566093, 0.8897488, 0.8196079, 0, 1, 1,
0.8956106, -0.3503361, 2.406631, 0.8235294, 0, 1, 1,
0.8984213, -1.375489, 2.120515, 0.8313726, 0, 1, 1,
0.9092398, -0.696604, 4.218727, 0.8352941, 0, 1, 1,
0.9155811, 0.4015011, 1.870357, 0.8431373, 0, 1, 1,
0.9174358, 0.2056061, 1.260499, 0.8470588, 0, 1, 1,
0.9250933, 0.02262149, 1.56345, 0.854902, 0, 1, 1,
0.9272904, 0.7643256, 1.424271, 0.8588235, 0, 1, 1,
0.9408126, 0.1204325, -0.3291122, 0.8666667, 0, 1, 1,
0.943942, -0.1475444, 2.327606, 0.8705882, 0, 1, 1,
0.9479819, 0.09336817, 0.9767124, 0.8784314, 0, 1, 1,
0.9490522, 0.5590129, 1.766031, 0.8823529, 0, 1, 1,
0.9500597, -0.2845555, 1.188506, 0.8901961, 0, 1, 1,
0.9553255, 0.291773, 1.324802, 0.8941177, 0, 1, 1,
0.9621306, -0.2264953, 0.7761095, 0.9019608, 0, 1, 1,
0.9623032, -1.283134, 2.455258, 0.9098039, 0, 1, 1,
0.974458, -1.315138, 1.758041, 0.9137255, 0, 1, 1,
0.9762165, -1.512641, 2.729108, 0.9215686, 0, 1, 1,
0.9774477, -0.5088798, 4.247871, 0.9254902, 0, 1, 1,
0.9782848, 0.1779725, 2.129595, 0.9333333, 0, 1, 1,
0.9786195, 0.2245238, 1.385327, 0.9372549, 0, 1, 1,
0.9816659, -0.7065362, 2.191426, 0.945098, 0, 1, 1,
0.9878215, 1.488151, 1.448996, 0.9490196, 0, 1, 1,
0.9893155, -0.1942042, 0.2286994, 0.9568627, 0, 1, 1,
1.000548, 0.6685925, 0.8955234, 0.9607843, 0, 1, 1,
1.00991, 1.522982, 2.717875, 0.9686275, 0, 1, 1,
1.013581, -0.4104784, 1.318876, 0.972549, 0, 1, 1,
1.014655, -0.8061353, 1.790762, 0.9803922, 0, 1, 1,
1.014694, -0.808568, 1.822632, 0.9843137, 0, 1, 1,
1.016213, 0.5253247, -1.086588, 0.9921569, 0, 1, 1,
1.018944, 0.4903831, 0.9214444, 0.9960784, 0, 1, 1,
1.022079, -1.356937, 3.092506, 1, 0, 0.9960784, 1,
1.023498, -0.6780615, 1.135574, 1, 0, 0.9882353, 1,
1.023562, 0.8498829, 0.6791874, 1, 0, 0.9843137, 1,
1.028365, 2.086364, 0.3714478, 1, 0, 0.9764706, 1,
1.034555, -1.856796, 2.684757, 1, 0, 0.972549, 1,
1.036028, 0.4333406, -1.188589, 1, 0, 0.9647059, 1,
1.039389, -0.2749885, 1.131018, 1, 0, 0.9607843, 1,
1.041014, -0.2654664, 0.784985, 1, 0, 0.9529412, 1,
1.048019, 2.062818, 1.58466, 1, 0, 0.9490196, 1,
1.052088, 0.7883254, -1.14887, 1, 0, 0.9411765, 1,
1.061764, 0.1411487, -0.6237421, 1, 0, 0.9372549, 1,
1.063971, -1.267731, 2.344751, 1, 0, 0.9294118, 1,
1.067761, -1.558743, 3.045092, 1, 0, 0.9254902, 1,
1.069013, 0.213758, 2.503753, 1, 0, 0.9176471, 1,
1.080463, 1.147279, 0.1902281, 1, 0, 0.9137255, 1,
1.088461, -0.09428256, 2.346119, 1, 0, 0.9058824, 1,
1.107079, 1.946304, 2.081848, 1, 0, 0.9019608, 1,
1.109865, 0.6260045, 2.724438, 1, 0, 0.8941177, 1,
1.110212, -1.270446, 2.952477, 1, 0, 0.8862745, 1,
1.110977, 1.214398, 1.372037, 1, 0, 0.8823529, 1,
1.112994, -0.4837186, 2.012094, 1, 0, 0.8745098, 1,
1.117249, 2.077773, 0.2713793, 1, 0, 0.8705882, 1,
1.12134, -0.664718, 0.9408649, 1, 0, 0.8627451, 1,
1.127404, 0.316184, 0.9885694, 1, 0, 0.8588235, 1,
1.127431, 0.3425249, 0.9576249, 1, 0, 0.8509804, 1,
1.138558, 0.2103826, 1.364886, 1, 0, 0.8470588, 1,
1.152962, 0.7384135, -0.8687935, 1, 0, 0.8392157, 1,
1.1597, 0.9236481, 0.006590754, 1, 0, 0.8352941, 1,
1.160812, -1.371977, 1.628246, 1, 0, 0.827451, 1,
1.163536, -0.3174549, 1.894353, 1, 0, 0.8235294, 1,
1.169575, -0.9874929, 0.2818366, 1, 0, 0.8156863, 1,
1.175497, 1.232798, 0.4006972, 1, 0, 0.8117647, 1,
1.178092, -0.4186956, 3.098937, 1, 0, 0.8039216, 1,
1.191996, -0.1874876, 1.596404, 1, 0, 0.7960784, 1,
1.203082, -1.326501, 3.188551, 1, 0, 0.7921569, 1,
1.204096, -0.9750229, 2.465538, 1, 0, 0.7843137, 1,
1.206299, -0.07730258, 2.575263, 1, 0, 0.7803922, 1,
1.220879, 0.6001098, 2.626857, 1, 0, 0.772549, 1,
1.222404, 0.937432, 1.490788, 1, 0, 0.7686275, 1,
1.225237, -0.06692837, 1.994862, 1, 0, 0.7607843, 1,
1.22571, 0.05327648, 2.96021, 1, 0, 0.7568628, 1,
1.23147, 0.567322, 1.674444, 1, 0, 0.7490196, 1,
1.240532, 0.9884398, 2.133127, 1, 0, 0.7450981, 1,
1.248631, 1.723745, 0.9447411, 1, 0, 0.7372549, 1,
1.249448, -1.381182, 2.709375, 1, 0, 0.7333333, 1,
1.253178, 1.465586, -0.447972, 1, 0, 0.7254902, 1,
1.255104, 0.07806946, 1.029956, 1, 0, 0.7215686, 1,
1.258039, 0.3032582, -0.4514637, 1, 0, 0.7137255, 1,
1.26053, 1.220899, 1.355811, 1, 0, 0.7098039, 1,
1.264918, 0.2377724, 1.932449, 1, 0, 0.7019608, 1,
1.28312, 1.182785, 0.3892419, 1, 0, 0.6941177, 1,
1.301693, -0.3486046, 2.78957, 1, 0, 0.6901961, 1,
1.313377, 0.1291747, 0.2762851, 1, 0, 0.682353, 1,
1.31543, 0.5928296, 1.84281, 1, 0, 0.6784314, 1,
1.318209, 0.8611197, 0.4370573, 1, 0, 0.6705883, 1,
1.322216, -1.334262, 1.939944, 1, 0, 0.6666667, 1,
1.324587, 1.679219, 1.46232, 1, 0, 0.6588235, 1,
1.327159, 1.271068, 1.845512, 1, 0, 0.654902, 1,
1.330787, -0.6430616, 1.620285, 1, 0, 0.6470588, 1,
1.338094, -0.2920452, 1.708215, 1, 0, 0.6431373, 1,
1.339762, -0.2520635, 1.599609, 1, 0, 0.6352941, 1,
1.353808, 0.9893813, -0.3377332, 1, 0, 0.6313726, 1,
1.362576, -0.9051073, 1.177838, 1, 0, 0.6235294, 1,
1.364704, 0.7587553, 1.774384, 1, 0, 0.6196079, 1,
1.366045, -1.162054, 1.82695, 1, 0, 0.6117647, 1,
1.37403, -0.1064601, 2.250576, 1, 0, 0.6078432, 1,
1.374581, 0.1254903, -0.4419724, 1, 0, 0.6, 1,
1.376186, 1.661395, 1.190784, 1, 0, 0.5921569, 1,
1.380145, -1.928923, 2.621122, 1, 0, 0.5882353, 1,
1.386848, 1.586329, 0.549696, 1, 0, 0.5803922, 1,
1.388657, 0.5636363, 2.747672, 1, 0, 0.5764706, 1,
1.398811, 1.070292, 2.231315, 1, 0, 0.5686275, 1,
1.399991, -1.830912, 0.9514399, 1, 0, 0.5647059, 1,
1.406698, 0.4278447, 1.321427, 1, 0, 0.5568628, 1,
1.406819, -0.8839628, 3.005883, 1, 0, 0.5529412, 1,
1.436745, 1.188508, 1.214894, 1, 0, 0.5450981, 1,
1.439695, -0.9035416, 1.545309, 1, 0, 0.5411765, 1,
1.443097, 0.3195649, -0.05795065, 1, 0, 0.5333334, 1,
1.453395, 0.3327604, 1.336483, 1, 0, 0.5294118, 1,
1.45375, 0.09110353, -1.058941, 1, 0, 0.5215687, 1,
1.459557, -0.5801263, -0.0618691, 1, 0, 0.5176471, 1,
1.462458, -0.09089162, 1.239514, 1, 0, 0.509804, 1,
1.46514, -0.829827, 1.725925, 1, 0, 0.5058824, 1,
1.478169, 1.340425, -0.2435403, 1, 0, 0.4980392, 1,
1.486144, -0.08140912, 1.10809, 1, 0, 0.4901961, 1,
1.486429, -0.5657021, 0.6271699, 1, 0, 0.4862745, 1,
1.4874, 1.127894, 0.2360307, 1, 0, 0.4784314, 1,
1.493919, 1.262933, -0.1961834, 1, 0, 0.4745098, 1,
1.493991, 0.06294977, 1.785063, 1, 0, 0.4666667, 1,
1.509866, -1.651164, 3.070727, 1, 0, 0.4627451, 1,
1.511839, 0.04464107, 2.04049, 1, 0, 0.454902, 1,
1.511875, 0.4452141, 2.306992, 1, 0, 0.4509804, 1,
1.515252, -0.09431006, 0.9689231, 1, 0, 0.4431373, 1,
1.517911, 0.1920089, 0.1212808, 1, 0, 0.4392157, 1,
1.519533, 0.1064419, 2.081246, 1, 0, 0.4313726, 1,
1.521471, -1.162176, 1.286317, 1, 0, 0.427451, 1,
1.531953, -2.787162, 0.2451922, 1, 0, 0.4196078, 1,
1.539989, -1.166594, 3.226454, 1, 0, 0.4156863, 1,
1.568521, -0.3295906, 2.416028, 1, 0, 0.4078431, 1,
1.572436, 0.153528, 0.09691355, 1, 0, 0.4039216, 1,
1.57824, 1.173535, 0.4076784, 1, 0, 0.3960784, 1,
1.58239, 0.09843119, 1.826915, 1, 0, 0.3882353, 1,
1.595688, 0.4398249, 2.194952, 1, 0, 0.3843137, 1,
1.596099, -0.8853104, 1.887396, 1, 0, 0.3764706, 1,
1.599084, 0.2034469, 1.676081, 1, 0, 0.372549, 1,
1.606052, 0.2021747, 0.9575379, 1, 0, 0.3647059, 1,
1.617622, 0.1598208, 1.650391, 1, 0, 0.3607843, 1,
1.629563, 0.2219941, 0.1925757, 1, 0, 0.3529412, 1,
1.63985, 1.473004, 1.421812, 1, 0, 0.3490196, 1,
1.644783, -0.4605924, 1.804594, 1, 0, 0.3411765, 1,
1.646124, -0.524972, 1.81251, 1, 0, 0.3372549, 1,
1.648195, -0.3130175, 0.9518894, 1, 0, 0.3294118, 1,
1.669239, 0.8546512, -0.1859503, 1, 0, 0.3254902, 1,
1.673967, -0.3292672, 3.044162, 1, 0, 0.3176471, 1,
1.684291, -1.284626, 3.012078, 1, 0, 0.3137255, 1,
1.709775, -1.308217, 2.083421, 1, 0, 0.3058824, 1,
1.71226, -0.2297468, 2.023674, 1, 0, 0.2980392, 1,
1.714069, -0.3465739, 1.252433, 1, 0, 0.2941177, 1,
1.750576, 1.140994, -0.9240862, 1, 0, 0.2862745, 1,
1.76021, -0.9231402, 3.203616, 1, 0, 0.282353, 1,
1.772337, 0.458315, 0.5895517, 1, 0, 0.2745098, 1,
1.77586, -1.787751, 2.013258, 1, 0, 0.2705882, 1,
1.783295, 0.7166094, 0.3713687, 1, 0, 0.2627451, 1,
1.797462, -0.0885369, -0.6799698, 1, 0, 0.2588235, 1,
1.827696, 1.560584, 0.7734036, 1, 0, 0.2509804, 1,
1.83499, -0.4571709, 0.06870766, 1, 0, 0.2470588, 1,
1.849914, -0.5517052, 1.819716, 1, 0, 0.2392157, 1,
1.85432, -0.3893118, 2.253283, 1, 0, 0.2352941, 1,
1.887938, 0.4690477, 1.773099, 1, 0, 0.227451, 1,
1.926854, -1.140017, 2.194798, 1, 0, 0.2235294, 1,
1.939307, -0.9103778, 2.299963, 1, 0, 0.2156863, 1,
1.941088, 1.32334, 2.593513, 1, 0, 0.2117647, 1,
1.941947, -0.364308, 0.8543403, 1, 0, 0.2039216, 1,
1.953238, -1.163386, 1.877969, 1, 0, 0.1960784, 1,
1.963931, -0.853728, 2.878924, 1, 0, 0.1921569, 1,
1.975316, -0.4317865, 1.242843, 1, 0, 0.1843137, 1,
1.998753, 0.8522114, 1.450645, 1, 0, 0.1803922, 1,
2.000112, -0.201606, 2.094006, 1, 0, 0.172549, 1,
2.008797, -0.9660761, 1.11881, 1, 0, 0.1686275, 1,
2.010196, -0.08031374, 1.346667, 1, 0, 0.1607843, 1,
2.016849, -0.3578545, 3.405043, 1, 0, 0.1568628, 1,
2.032277, 0.05744167, 0.8080806, 1, 0, 0.1490196, 1,
2.055083, 0.3857124, 0.3934896, 1, 0, 0.145098, 1,
2.056287, -2.000135, 2.563246, 1, 0, 0.1372549, 1,
2.065788, 0.6521352, 0.7132612, 1, 0, 0.1333333, 1,
2.077693, -0.7013764, 1.734004, 1, 0, 0.1254902, 1,
2.080567, -0.3095192, 1.878705, 1, 0, 0.1215686, 1,
2.110757, 1.246129, 1.832474, 1, 0, 0.1137255, 1,
2.174885, 0.1101657, 0.8324184, 1, 0, 0.1098039, 1,
2.233741, -1.068515, 2.340012, 1, 0, 0.1019608, 1,
2.235438, 0.05815579, 1.341083, 1, 0, 0.09411765, 1,
2.265341, -0.2750273, 1.439252, 1, 0, 0.09019608, 1,
2.290418, -1.34836, 2.444725, 1, 0, 0.08235294, 1,
2.313654, 1.85737, 1.610072, 1, 0, 0.07843138, 1,
2.325072, 0.7379388, 1.167252, 1, 0, 0.07058824, 1,
2.386973, -1.036313, 1.62249, 1, 0, 0.06666667, 1,
2.389712, -0.04104411, 0.5172165, 1, 0, 0.05882353, 1,
2.391734, 3.14743, 1.951722, 1, 0, 0.05490196, 1,
2.414192, -0.1211438, 1.954718, 1, 0, 0.04705882, 1,
2.453308, 0.06029417, 2.99047, 1, 0, 0.04313726, 1,
2.569366, 1.03445, 1.912574, 1, 0, 0.03529412, 1,
2.590491, 1.567277, 1.467195, 1, 0, 0.03137255, 1,
2.770476, 0.003839621, 2.492629, 1, 0, 0.02352941, 1,
2.814524, -0.3154918, 1.650931, 1, 0, 0.01960784, 1,
2.853604, -0.4705936, -0.6853186, 1, 0, 0.01176471, 1,
3.414542, 0.5566204, 0.5512728, 1, 0, 0.007843138, 1
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
0.09815466, -4.509505, -7.961336, 0, -0.5, 0.5, 0.5,
0.09815466, -4.509505, -7.961336, 1, -0.5, 0.5, 0.5,
0.09815466, -4.509505, -7.961336, 1, 1.5, 0.5, 0.5,
0.09815466, -4.509505, -7.961336, 0, 1.5, 0.5, 0.5
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
-4.342488, -0.1261632, -7.961336, 0, -0.5, 0.5, 0.5,
-4.342488, -0.1261632, -7.961336, 1, -0.5, 0.5, 0.5,
-4.342488, -0.1261632, -7.961336, 1, 1.5, 0.5, 0.5,
-4.342488, -0.1261632, -7.961336, 0, 1.5, 0.5, 0.5
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
-4.342488, -4.509505, -0.2652881, 0, -0.5, 0.5, 0.5,
-4.342488, -4.509505, -0.2652881, 1, -0.5, 0.5, 0.5,
-4.342488, -4.509505, -0.2652881, 1, 1.5, 0.5, 0.5,
-4.342488, -4.509505, -0.2652881, 0, 1.5, 0.5, 0.5
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
-3, -3.497964, -6.185325,
3, -3.497964, -6.185325,
-3, -3.497964, -6.185325,
-3, -3.666554, -6.481327,
-2, -3.497964, -6.185325,
-2, -3.666554, -6.481327,
-1, -3.497964, -6.185325,
-1, -3.666554, -6.481327,
0, -3.497964, -6.185325,
0, -3.666554, -6.481327,
1, -3.497964, -6.185325,
1, -3.666554, -6.481327,
2, -3.497964, -6.185325,
2, -3.666554, -6.481327,
3, -3.497964, -6.185325,
3, -3.666554, -6.481327
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
-3, -4.003735, -7.07333, 0, -0.5, 0.5, 0.5,
-3, -4.003735, -7.07333, 1, -0.5, 0.5, 0.5,
-3, -4.003735, -7.07333, 1, 1.5, 0.5, 0.5,
-3, -4.003735, -7.07333, 0, 1.5, 0.5, 0.5,
-2, -4.003735, -7.07333, 0, -0.5, 0.5, 0.5,
-2, -4.003735, -7.07333, 1, -0.5, 0.5, 0.5,
-2, -4.003735, -7.07333, 1, 1.5, 0.5, 0.5,
-2, -4.003735, -7.07333, 0, 1.5, 0.5, 0.5,
-1, -4.003735, -7.07333, 0, -0.5, 0.5, 0.5,
-1, -4.003735, -7.07333, 1, -0.5, 0.5, 0.5,
-1, -4.003735, -7.07333, 1, 1.5, 0.5, 0.5,
-1, -4.003735, -7.07333, 0, 1.5, 0.5, 0.5,
0, -4.003735, -7.07333, 0, -0.5, 0.5, 0.5,
0, -4.003735, -7.07333, 1, -0.5, 0.5, 0.5,
0, -4.003735, -7.07333, 1, 1.5, 0.5, 0.5,
0, -4.003735, -7.07333, 0, 1.5, 0.5, 0.5,
1, -4.003735, -7.07333, 0, -0.5, 0.5, 0.5,
1, -4.003735, -7.07333, 1, -0.5, 0.5, 0.5,
1, -4.003735, -7.07333, 1, 1.5, 0.5, 0.5,
1, -4.003735, -7.07333, 0, 1.5, 0.5, 0.5,
2, -4.003735, -7.07333, 0, -0.5, 0.5, 0.5,
2, -4.003735, -7.07333, 1, -0.5, 0.5, 0.5,
2, -4.003735, -7.07333, 1, 1.5, 0.5, 0.5,
2, -4.003735, -7.07333, 0, 1.5, 0.5, 0.5,
3, -4.003735, -7.07333, 0, -0.5, 0.5, 0.5,
3, -4.003735, -7.07333, 1, -0.5, 0.5, 0.5,
3, -4.003735, -7.07333, 1, 1.5, 0.5, 0.5,
3, -4.003735, -7.07333, 0, 1.5, 0.5, 0.5
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
-3.317724, -3, -6.185325,
-3.317724, 3, -6.185325,
-3.317724, -3, -6.185325,
-3.488518, -3, -6.481327,
-3.317724, -2, -6.185325,
-3.488518, -2, -6.481327,
-3.317724, -1, -6.185325,
-3.488518, -1, -6.481327,
-3.317724, 0, -6.185325,
-3.488518, 0, -6.481327,
-3.317724, 1, -6.185325,
-3.488518, 1, -6.481327,
-3.317724, 2, -6.185325,
-3.488518, 2, -6.481327,
-3.317724, 3, -6.185325,
-3.488518, 3, -6.481327
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
-3.830106, -3, -7.07333, 0, -0.5, 0.5, 0.5,
-3.830106, -3, -7.07333, 1, -0.5, 0.5, 0.5,
-3.830106, -3, -7.07333, 1, 1.5, 0.5, 0.5,
-3.830106, -3, -7.07333, 0, 1.5, 0.5, 0.5,
-3.830106, -2, -7.07333, 0, -0.5, 0.5, 0.5,
-3.830106, -2, -7.07333, 1, -0.5, 0.5, 0.5,
-3.830106, -2, -7.07333, 1, 1.5, 0.5, 0.5,
-3.830106, -2, -7.07333, 0, 1.5, 0.5, 0.5,
-3.830106, -1, -7.07333, 0, -0.5, 0.5, 0.5,
-3.830106, -1, -7.07333, 1, -0.5, 0.5, 0.5,
-3.830106, -1, -7.07333, 1, 1.5, 0.5, 0.5,
-3.830106, -1, -7.07333, 0, 1.5, 0.5, 0.5,
-3.830106, 0, -7.07333, 0, -0.5, 0.5, 0.5,
-3.830106, 0, -7.07333, 1, -0.5, 0.5, 0.5,
-3.830106, 0, -7.07333, 1, 1.5, 0.5, 0.5,
-3.830106, 0, -7.07333, 0, 1.5, 0.5, 0.5,
-3.830106, 1, -7.07333, 0, -0.5, 0.5, 0.5,
-3.830106, 1, -7.07333, 1, -0.5, 0.5, 0.5,
-3.830106, 1, -7.07333, 1, 1.5, 0.5, 0.5,
-3.830106, 1, -7.07333, 0, 1.5, 0.5, 0.5,
-3.830106, 2, -7.07333, 0, -0.5, 0.5, 0.5,
-3.830106, 2, -7.07333, 1, -0.5, 0.5, 0.5,
-3.830106, 2, -7.07333, 1, 1.5, 0.5, 0.5,
-3.830106, 2, -7.07333, 0, 1.5, 0.5, 0.5,
-3.830106, 3, -7.07333, 0, -0.5, 0.5, 0.5,
-3.830106, 3, -7.07333, 1, -0.5, 0.5, 0.5,
-3.830106, 3, -7.07333, 1, 1.5, 0.5, 0.5,
-3.830106, 3, -7.07333, 0, 1.5, 0.5, 0.5
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
-3.317724, -3.497964, -6,
-3.317724, -3.497964, 4,
-3.317724, -3.497964, -6,
-3.488518, -3.666554, -6,
-3.317724, -3.497964, -4,
-3.488518, -3.666554, -4,
-3.317724, -3.497964, -2,
-3.488518, -3.666554, -2,
-3.317724, -3.497964, 0,
-3.488518, -3.666554, 0,
-3.317724, -3.497964, 2,
-3.488518, -3.666554, 2,
-3.317724, -3.497964, 4,
-3.488518, -3.666554, 4
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
-3.830106, -4.003735, -6, 0, -0.5, 0.5, 0.5,
-3.830106, -4.003735, -6, 1, -0.5, 0.5, 0.5,
-3.830106, -4.003735, -6, 1, 1.5, 0.5, 0.5,
-3.830106, -4.003735, -6, 0, 1.5, 0.5, 0.5,
-3.830106, -4.003735, -4, 0, -0.5, 0.5, 0.5,
-3.830106, -4.003735, -4, 1, -0.5, 0.5, 0.5,
-3.830106, -4.003735, -4, 1, 1.5, 0.5, 0.5,
-3.830106, -4.003735, -4, 0, 1.5, 0.5, 0.5,
-3.830106, -4.003735, -2, 0, -0.5, 0.5, 0.5,
-3.830106, -4.003735, -2, 1, -0.5, 0.5, 0.5,
-3.830106, -4.003735, -2, 1, 1.5, 0.5, 0.5,
-3.830106, -4.003735, -2, 0, 1.5, 0.5, 0.5,
-3.830106, -4.003735, 0, 0, -0.5, 0.5, 0.5,
-3.830106, -4.003735, 0, 1, -0.5, 0.5, 0.5,
-3.830106, -4.003735, 0, 1, 1.5, 0.5, 0.5,
-3.830106, -4.003735, 0, 0, 1.5, 0.5, 0.5,
-3.830106, -4.003735, 2, 0, -0.5, 0.5, 0.5,
-3.830106, -4.003735, 2, 1, -0.5, 0.5, 0.5,
-3.830106, -4.003735, 2, 1, 1.5, 0.5, 0.5,
-3.830106, -4.003735, 2, 0, 1.5, 0.5, 0.5,
-3.830106, -4.003735, 4, 0, -0.5, 0.5, 0.5,
-3.830106, -4.003735, 4, 1, -0.5, 0.5, 0.5,
-3.830106, -4.003735, 4, 1, 1.5, 0.5, 0.5,
-3.830106, -4.003735, 4, 0, 1.5, 0.5, 0.5
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
-3.317724, -3.497964, -6.185325,
-3.317724, 3.245638, -6.185325,
-3.317724, -3.497964, 5.654748,
-3.317724, 3.245638, 5.654748,
-3.317724, -3.497964, -6.185325,
-3.317724, -3.497964, 5.654748,
-3.317724, 3.245638, -6.185325,
-3.317724, 3.245638, 5.654748,
-3.317724, -3.497964, -6.185325,
3.514034, -3.497964, -6.185325,
-3.317724, -3.497964, 5.654748,
3.514034, -3.497964, 5.654748,
-3.317724, 3.245638, -6.185325,
3.514034, 3.245638, -6.185325,
-3.317724, 3.245638, 5.654748,
3.514034, 3.245638, 5.654748,
3.514034, -3.497964, -6.185325,
3.514034, 3.245638, -6.185325,
3.514034, -3.497964, 5.654748,
3.514034, 3.245638, 5.654748,
3.514034, -3.497964, -6.185325,
3.514034, -3.497964, 5.654748,
3.514034, 3.245638, -6.185325,
3.514034, 3.245638, 5.654748
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
var radius = 8.139245;
var distance = 36.21242;
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
mvMatrix.translate( -0.09815466, 0.1261632, 0.2652881 );
mvMatrix.scale( 1.288147, 1.304987, 0.7432649 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.21242);
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
arsorate<-read.table("arsorate.xyz")
```

```
## Error in read.table("arsorate.xyz"): no lines available in input
```

```r
x<-arsorate$V2
```

```
## Error in eval(expr, envir, enclos): object 'arsorate' not found
```

```r
y<-arsorate$V3
```

```
## Error in eval(expr, envir, enclos): object 'arsorate' not found
```

```r
z<-arsorate$V4
```

```
## Error in eval(expr, envir, enclos): object 'arsorate' not found
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
-3.218233, -1.127591, -1.445734, 0, 0, 1, 1, 1,
-2.967109, -3.396749, -2.19249, 1, 0, 0, 1, 1,
-2.9082, 1.577122, -1.388093, 1, 0, 0, 1, 1,
-2.840632, -0.3340595, 0.5768845, 1, 0, 0, 1, 1,
-2.810866, -0.9638929, -1.91248, 1, 0, 0, 1, 1,
-2.740744, 0.1468374, -0.8490741, 1, 0, 0, 1, 1,
-2.609329, -0.5232248, -1.047663, 0, 0, 0, 1, 1,
-2.465862, -0.7709218, -1.856287, 0, 0, 0, 1, 1,
-2.361968, 0.219179, -1.96511, 0, 0, 0, 1, 1,
-2.333127, 0.318334, -0.8788679, 0, 0, 0, 1, 1,
-2.196258, -0.8540389, -0.3638388, 0, 0, 0, 1, 1,
-2.164577, 0.4507172, -2.037569, 0, 0, 0, 1, 1,
-2.162645, 0.4461251, -1.022048, 0, 0, 0, 1, 1,
-2.139723, -2.073472, -0.8918363, 1, 1, 1, 1, 1,
-2.122697, 0.7898793, -1.460521, 1, 1, 1, 1, 1,
-2.08558, 1.611378, 0.5576878, 1, 1, 1, 1, 1,
-2.083503, -0.6575352, -2.939558, 1, 1, 1, 1, 1,
-2.067124, 0.47701, -2.538445, 1, 1, 1, 1, 1,
-2.061889, -0.2607006, -3.098262, 1, 1, 1, 1, 1,
-2.030273, -0.2557509, -2.165242, 1, 1, 1, 1, 1,
-2.010189, 0.03200632, -1.701356, 1, 1, 1, 1, 1,
-2.007525, 0.1197866, -1.11617, 1, 1, 1, 1, 1,
-1.984246, 0.7266561, 0.05666381, 1, 1, 1, 1, 1,
-1.979547, 0.4369869, -1.720843, 1, 1, 1, 1, 1,
-1.968799, 0.9874841, -2.371516, 1, 1, 1, 1, 1,
-1.967576, -0.3755426, -0.9739042, 1, 1, 1, 1, 1,
-1.95082, -0.02780384, -0.792354, 1, 1, 1, 1, 1,
-1.939091, 1.181347, -1.047057, 1, 1, 1, 1, 1,
-1.931965, -2.450979, -2.410879, 0, 0, 1, 1, 1,
-1.91385, -0.3102851, -2.252267, 1, 0, 0, 1, 1,
-1.887823, -0.2657223, -2.347654, 1, 0, 0, 1, 1,
-1.879896, -0.1932544, -1.657364, 1, 0, 0, 1, 1,
-1.857411, -0.1045967, -3.337006, 1, 0, 0, 1, 1,
-1.835433, 1.667607, 0.4174382, 1, 0, 0, 1, 1,
-1.834682, -0.9569691, -2.182841, 0, 0, 0, 1, 1,
-1.799578, 1.646072, -2.289819, 0, 0, 0, 1, 1,
-1.781552, 0.7229152, 0.1083053, 0, 0, 0, 1, 1,
-1.749547, -0.5573972, -0.7460347, 0, 0, 0, 1, 1,
-1.74724, 0.7900392, -1.635098, 0, 0, 0, 1, 1,
-1.729957, 1.15401, -1.328271, 0, 0, 0, 1, 1,
-1.729519, -0.18176, -1.628716, 0, 0, 0, 1, 1,
-1.721729, 0.04076954, -1.366558, 1, 1, 1, 1, 1,
-1.714687, -1.009748, -2.748306, 1, 1, 1, 1, 1,
-1.710293, -1.557324, -3.169624, 1, 1, 1, 1, 1,
-1.703172, 0.1256444, -1.655658, 1, 1, 1, 1, 1,
-1.681381, 1.57717, -1.398219, 1, 1, 1, 1, 1,
-1.674799, 0.7382147, -0.9161205, 1, 1, 1, 1, 1,
-1.670373, 0.566548, -0.374737, 1, 1, 1, 1, 1,
-1.654261, 0.8682452, 0.02908642, 1, 1, 1, 1, 1,
-1.649648, -1.585417, -2.362934, 1, 1, 1, 1, 1,
-1.647013, 0.04914705, -0.3769537, 1, 1, 1, 1, 1,
-1.636112, -0.9246778, -2.991458, 1, 1, 1, 1, 1,
-1.630999, -2.505706, -2.424942, 1, 1, 1, 1, 1,
-1.630075, 0.08775894, -1.748409, 1, 1, 1, 1, 1,
-1.629735, -0.9875574, -1.420469, 1, 1, 1, 1, 1,
-1.623597, 0.3885511, -1.538847, 1, 1, 1, 1, 1,
-1.616274, 0.3108951, -1.988564, 0, 0, 1, 1, 1,
-1.607669, -0.194529, -3.010302, 1, 0, 0, 1, 1,
-1.605517, 0.9766815, -0.9074819, 1, 0, 0, 1, 1,
-1.595946, -1.471135, -1.994951, 1, 0, 0, 1, 1,
-1.57426, -0.5725704, -1.73271, 1, 0, 0, 1, 1,
-1.550678, 0.7058981, -0.1388905, 1, 0, 0, 1, 1,
-1.547032, 0.4788686, -2.148803, 0, 0, 0, 1, 1,
-1.539174, 0.2352152, -0.9830337, 0, 0, 0, 1, 1,
-1.5371, -1.256742, -1.708976, 0, 0, 0, 1, 1,
-1.526794, 0.06517392, -1.473019, 0, 0, 0, 1, 1,
-1.513719, -0.6117069, -2.749642, 0, 0, 0, 1, 1,
-1.500834, -1.87667, -2.576913, 0, 0, 0, 1, 1,
-1.499926, 0.06492145, -1.082697, 0, 0, 0, 1, 1,
-1.496002, -0.2406812, -0.7959691, 1, 1, 1, 1, 1,
-1.495373, 0.005825897, -2.157878, 1, 1, 1, 1, 1,
-1.493976, -0.6283783, -1.669351, 1, 1, 1, 1, 1,
-1.466668, 0.2806925, -1.307692, 1, 1, 1, 1, 1,
-1.454825, -0.8584648, -2.321641, 1, 1, 1, 1, 1,
-1.446784, 0.2155439, -2.113396, 1, 1, 1, 1, 1,
-1.429189, 0.1510532, -1.744762, 1, 1, 1, 1, 1,
-1.428575, 0.1329052, -1.968703, 1, 1, 1, 1, 1,
-1.419588, 0.7191396, -1.886133, 1, 1, 1, 1, 1,
-1.410413, -1.533036, -2.836622, 1, 1, 1, 1, 1,
-1.403501, -1.176495, -3.029363, 1, 1, 1, 1, 1,
-1.400259, -0.5044694, -1.443999, 1, 1, 1, 1, 1,
-1.393082, 2.275353, -1.203816, 1, 1, 1, 1, 1,
-1.388678, -0.0500468, -1.565554, 1, 1, 1, 1, 1,
-1.386913, -1.467793, -2.002242, 1, 1, 1, 1, 1,
-1.385256, -1.747058, -3.424845, 0, 0, 1, 1, 1,
-1.379976, -0.9644374, -1.698201, 1, 0, 0, 1, 1,
-1.378639, 0.6338509, -2.041219, 1, 0, 0, 1, 1,
-1.376147, 1.396922, -0.6088325, 1, 0, 0, 1, 1,
-1.360546, 0.7483889, 0.2832356, 1, 0, 0, 1, 1,
-1.357326, -0.5926413, -1.91834, 1, 0, 0, 1, 1,
-1.354726, 0.3272134, 0.2103418, 0, 0, 0, 1, 1,
-1.351653, -0.846091, -3.668334, 0, 0, 0, 1, 1,
-1.335379, -1.022828, -2.939033, 0, 0, 0, 1, 1,
-1.334508, -0.2595268, -2.23805, 0, 0, 0, 1, 1,
-1.320574, 0.5293573, -0.8148746, 0, 0, 0, 1, 1,
-1.317322, -0.1696138, -0.9913949, 0, 0, 0, 1, 1,
-1.315897, -0.2374436, -1.763758, 0, 0, 0, 1, 1,
-1.313619, -1.011519, -3.486895, 1, 1, 1, 1, 1,
-1.305792, -1.386077, -2.822845, 1, 1, 1, 1, 1,
-1.303556, -1.049731, -1.976342, 1, 1, 1, 1, 1,
-1.290342, 0.9133888, -2.555715, 1, 1, 1, 1, 1,
-1.269308, 0.7787716, -0.9059104, 1, 1, 1, 1, 1,
-1.266237, 0.4794807, -0.177918, 1, 1, 1, 1, 1,
-1.266175, -1.309137, -2.935059, 1, 1, 1, 1, 1,
-1.252977, -2.023885, -2.250015, 1, 1, 1, 1, 1,
-1.24871, 0.1973104, -1.019343, 1, 1, 1, 1, 1,
-1.24613, 2.036502, -0.009475806, 1, 1, 1, 1, 1,
-1.241988, -0.2103442, -3.927161, 1, 1, 1, 1, 1,
-1.232571, 0.7008852, -0.8756939, 1, 1, 1, 1, 1,
-1.232221, -0.6695728, -1.837114, 1, 1, 1, 1, 1,
-1.231923, 1.05, -1.080091, 1, 1, 1, 1, 1,
-1.230865, -1.209002, -1.180317, 1, 1, 1, 1, 1,
-1.230833, 0.1083602, -3.488713, 0, 0, 1, 1, 1,
-1.223791, -1.605648, -2.708714, 1, 0, 0, 1, 1,
-1.220644, -0.5802411, -3.565661, 1, 0, 0, 1, 1,
-1.217634, 0.3928443, -2.372952, 1, 0, 0, 1, 1,
-1.215609, 0.9077107, -1.659995, 1, 0, 0, 1, 1,
-1.206819, 0.7135013, -1.2876, 1, 0, 0, 1, 1,
-1.202476, 1.386611, -2.231626, 0, 0, 0, 1, 1,
-1.197357, 2.530011, -1.452445, 0, 0, 0, 1, 1,
-1.195324, 1.039696, -0.2889197, 0, 0, 0, 1, 1,
-1.194999, -0.05890797, -2.45014, 0, 0, 0, 1, 1,
-1.191605, 0.7431579, -2.005382, 0, 0, 0, 1, 1,
-1.190514, -0.5876663, -1.816649, 0, 0, 0, 1, 1,
-1.189951, 1.24626, -2.421783, 0, 0, 0, 1, 1,
-1.187549, -0.5127618, -2.45941, 1, 1, 1, 1, 1,
-1.182527, -0.6198017, -1.094901, 1, 1, 1, 1, 1,
-1.181165, -0.857775, -2.969818, 1, 1, 1, 1, 1,
-1.179565, -1.412696, -3.243477, 1, 1, 1, 1, 1,
-1.176998, -0.1415649, -1.523534, 1, 1, 1, 1, 1,
-1.17117, -1.052955, -1.955028, 1, 1, 1, 1, 1,
-1.170608, -0.7331194, -3.517758, 1, 1, 1, 1, 1,
-1.170127, -1.36823, -4.786593, 1, 1, 1, 1, 1,
-1.160461, -0.5849623, -1.16729, 1, 1, 1, 1, 1,
-1.15891, -1.588845, -1.191718, 1, 1, 1, 1, 1,
-1.156643, -0.9486862, -2.280322, 1, 1, 1, 1, 1,
-1.155469, 1.642067, 0.5428371, 1, 1, 1, 1, 1,
-1.155174, 0.1030634, -1.318101, 1, 1, 1, 1, 1,
-1.144732, -0.9550145, -2.644383, 1, 1, 1, 1, 1,
-1.14317, -0.9465783, -1.604485, 1, 1, 1, 1, 1,
-1.14209, -1.980291, -2.446381, 0, 0, 1, 1, 1,
-1.139406, 0.06518145, -3.897701, 1, 0, 0, 1, 1,
-1.131017, 1.510805, -1.371931, 1, 0, 0, 1, 1,
-1.130948, 1.478318, -1.633495, 1, 0, 0, 1, 1,
-1.127897, -0.548708, -2.75046, 1, 0, 0, 1, 1,
-1.126466, -0.727935, -2.397542, 1, 0, 0, 1, 1,
-1.124869, -0.2013425, -1.336299, 0, 0, 0, 1, 1,
-1.116923, -1.150216, -1.202226, 0, 0, 0, 1, 1,
-1.111408, 0.8737133, -0.0588151, 0, 0, 0, 1, 1,
-1.09935, 1.606512, -0.6961809, 0, 0, 0, 1, 1,
-1.09639, 0.02777788, -1.938918, 0, 0, 0, 1, 1,
-1.089363, -0.2223082, -2.157378, 0, 0, 0, 1, 1,
-1.071993, -0.6101846, -1.117179, 0, 0, 0, 1, 1,
-1.071632, -0.2233346, -2.264651, 1, 1, 1, 1, 1,
-1.069578, 1.862145, -0.92572, 1, 1, 1, 1, 1,
-1.065486, -0.02005276, -2.439668, 1, 1, 1, 1, 1,
-1.062514, 0.9982293, -1.878932, 1, 1, 1, 1, 1,
-1.061337, -0.2933165, -3.461696, 1, 1, 1, 1, 1,
-1.057358, 0.2008836, 0.4016486, 1, 1, 1, 1, 1,
-1.055853, -1.091078, -2.185981, 1, 1, 1, 1, 1,
-1.054594, 0.3883728, -1.731784, 1, 1, 1, 1, 1,
-1.050535, -0.5624734, -2.468333, 1, 1, 1, 1, 1,
-1.041649, 0.9899754, -0.9837711, 1, 1, 1, 1, 1,
-1.034376, 0.7748784, -0.2982244, 1, 1, 1, 1, 1,
-1.029567, -1.647155, -1.528501, 1, 1, 1, 1, 1,
-1.028556, -0.7385575, -1.072807, 1, 1, 1, 1, 1,
-1.026829, -0.934666, -4.019174, 1, 1, 1, 1, 1,
-1.017416, -1.057453, -5.322198, 1, 1, 1, 1, 1,
-1.015059, -0.2730671, -2.246247, 0, 0, 1, 1, 1,
-1.009702, 0.09827818, -2.800549, 1, 0, 0, 1, 1,
-1.006974, 0.2465963, -0.5528836, 1, 0, 0, 1, 1,
-1.002827, -0.4334748, -1.777985, 1, 0, 0, 1, 1,
-0.9953235, 1.585562, -0.09210302, 1, 0, 0, 1, 1,
-0.9947519, 0.2006182, -0.6792544, 1, 0, 0, 1, 1,
-0.9857845, -0.0243229, -3.58353, 0, 0, 0, 1, 1,
-0.9850662, 0.9594074, -1.892656, 0, 0, 0, 1, 1,
-0.9836442, 0.9272695, -0.4875126, 0, 0, 0, 1, 1,
-0.9830494, -0.2591456, -0.03906592, 0, 0, 0, 1, 1,
-0.9778612, -0.5237985, -3.258195, 0, 0, 0, 1, 1,
-0.9774793, 2.391975, -1.580249, 0, 0, 0, 1, 1,
-0.9661202, -0.2711026, -1.992715, 0, 0, 0, 1, 1,
-0.9633467, -0.6398582, -2.514851, 1, 1, 1, 1, 1,
-0.943803, -0.05832009, -2.334979, 1, 1, 1, 1, 1,
-0.9321474, -0.5434338, -1.728447, 1, 1, 1, 1, 1,
-0.9289972, -0.4430371, -0.5979785, 1, 1, 1, 1, 1,
-0.9284108, 0.3796735, -2.233991, 1, 1, 1, 1, 1,
-0.9206895, 0.696215, -2.24544, 1, 1, 1, 1, 1,
-0.9196306, 0.7948408, -0.940529, 1, 1, 1, 1, 1,
-0.9097093, 0.5835875, -0.8637535, 1, 1, 1, 1, 1,
-0.907874, 1.001635, -1.321566, 1, 1, 1, 1, 1,
-0.9050516, 0.4872819, -1.962736, 1, 1, 1, 1, 1,
-0.8970033, 1.165666, -1.841731, 1, 1, 1, 1, 1,
-0.8949487, 0.4905336, -0.7567354, 1, 1, 1, 1, 1,
-0.8888428, 1.332825, -1.246672, 1, 1, 1, 1, 1,
-0.8867977, -0.5489205, -4.181684, 1, 1, 1, 1, 1,
-0.8823063, -1.301253, -1.948069, 1, 1, 1, 1, 1,
-0.8814455, -0.02964489, -0.3960526, 0, 0, 1, 1, 1,
-0.8798454, -0.1749536, -2.932083, 1, 0, 0, 1, 1,
-0.8747468, -2.483166, -2.532887, 1, 0, 0, 1, 1,
-0.8707734, -0.9253592, 0.1909999, 1, 0, 0, 1, 1,
-0.8522545, 0.02059396, -3.109571, 1, 0, 0, 1, 1,
-0.8493022, 1.640688, -1.26582, 1, 0, 0, 1, 1,
-0.8486974, 1.641426, 0.8832876, 0, 0, 0, 1, 1,
-0.8461985, -0.4693852, -3.536162, 0, 0, 0, 1, 1,
-0.8461069, -1.749835, -3.377996, 0, 0, 0, 1, 1,
-0.8388982, -0.5961927, -3.791354, 0, 0, 0, 1, 1,
-0.8366907, 0.8007755, 0.4154297, 0, 0, 0, 1, 1,
-0.8273582, 0.07160559, -1.327859, 0, 0, 0, 1, 1,
-0.8257264, -3.399757, -2.042332, 0, 0, 0, 1, 1,
-0.8251835, -0.4302378, -1.769067, 1, 1, 1, 1, 1,
-0.8229547, 2.08233, -0.7415772, 1, 1, 1, 1, 1,
-0.8181244, 0.7193841, -1.740415, 1, 1, 1, 1, 1,
-0.8146226, -0.09603223, 0.971693, 1, 1, 1, 1, 1,
-0.8137591, -1.407865, -3.569167, 1, 1, 1, 1, 1,
-0.8103645, 0.575205, -0.1904318, 1, 1, 1, 1, 1,
-0.8099305, 2.278105, 0.7017017, 1, 1, 1, 1, 1,
-0.8045358, -0.5954625, -3.258859, 1, 1, 1, 1, 1,
-0.8041604, 2.94063, 0.1652353, 1, 1, 1, 1, 1,
-0.8033544, 0.9109198, -2.518545, 1, 1, 1, 1, 1,
-0.7974061, -1.646349, -2.149674, 1, 1, 1, 1, 1,
-0.7969856, -0.1839931, -0.1957966, 1, 1, 1, 1, 1,
-0.7929996, 0.07484905, -1.222308, 1, 1, 1, 1, 1,
-0.7910548, -1.730475, -4.257279, 1, 1, 1, 1, 1,
-0.791043, 0.5367945, -0.8570277, 1, 1, 1, 1, 1,
-0.7886291, -0.4889396, -1.878824, 0, 0, 1, 1, 1,
-0.7844956, -0.7442961, -0.5978411, 1, 0, 0, 1, 1,
-0.781128, 0.8265946, -0.8217254, 1, 0, 0, 1, 1,
-0.780194, -0.4114214, -1.655397, 1, 0, 0, 1, 1,
-0.777216, 1.077065, -0.6611468, 1, 0, 0, 1, 1,
-0.7694218, 0.6095591, -0.8745874, 1, 0, 0, 1, 1,
-0.7655948, -0.7621229, -2.133401, 0, 0, 0, 1, 1,
-0.7635472, -0.8453997, -3.044819, 0, 0, 0, 1, 1,
-0.7610546, -0.8334363, -1.678489, 0, 0, 0, 1, 1,
-0.7549474, 0.7575208, -0.1806483, 0, 0, 0, 1, 1,
-0.7546657, -0.05906719, -1.928138, 0, 0, 0, 1, 1,
-0.7420319, -1.21459, -1.988527, 0, 0, 0, 1, 1,
-0.7375028, -0.1615732, -0.8758523, 0, 0, 0, 1, 1,
-0.7311178, -0.2986902, -3.179469, 1, 1, 1, 1, 1,
-0.7293916, 1.113346, -1.368657, 1, 1, 1, 1, 1,
-0.7281154, -0.9723292, -0.1035692, 1, 1, 1, 1, 1,
-0.7271507, -0.5812573, -3.122715, 1, 1, 1, 1, 1,
-0.7247823, 0.7259856, -1.561501, 1, 1, 1, 1, 1,
-0.7216175, 1.552931, -1.618033, 1, 1, 1, 1, 1,
-0.7177969, 1.388816, 0.388227, 1, 1, 1, 1, 1,
-0.7101178, -2.081059, -3.03671, 1, 1, 1, 1, 1,
-0.702697, 1.376463, -2.029364, 1, 1, 1, 1, 1,
-0.6936697, -0.5221316, -1.696268, 1, 1, 1, 1, 1,
-0.6897789, 1.716637, -2.570808, 1, 1, 1, 1, 1,
-0.6892359, 0.5869271, 0.9779117, 1, 1, 1, 1, 1,
-0.6888601, 0.4435729, -1.809598, 1, 1, 1, 1, 1,
-0.6840692, -0.9824722, -2.823772, 1, 1, 1, 1, 1,
-0.682205, -0.2738305, -2.222414, 1, 1, 1, 1, 1,
-0.6751587, 0.7818573, -1.770635, 0, 0, 1, 1, 1,
-0.6694085, 2.538176, 0.5927412, 1, 0, 0, 1, 1,
-0.6662949, -0.1007396, -1.557073, 1, 0, 0, 1, 1,
-0.6640714, 0.1793426, 0.1204485, 1, 0, 0, 1, 1,
-0.6635067, -1.677647, -2.467484, 1, 0, 0, 1, 1,
-0.6607165, 0.2684698, -0.7255379, 1, 0, 0, 1, 1,
-0.6597562, 1.000066, 0.1157649, 0, 0, 0, 1, 1,
-0.659575, -0.06838917, -2.319845, 0, 0, 0, 1, 1,
-0.6593474, -2.143236, -4.355489, 0, 0, 0, 1, 1,
-0.6588563, -0.5161641, -2.067327, 0, 0, 0, 1, 1,
-0.658039, -0.1797431, -2.816124, 0, 0, 0, 1, 1,
-0.6570001, -0.0764212, -0.8886973, 0, 0, 0, 1, 1,
-0.6563, 0.4786277, 0.3160111, 0, 0, 0, 1, 1,
-0.6529346, 0.5557072, -0.877253, 1, 1, 1, 1, 1,
-0.639676, -0.7298944, -2.82653, 1, 1, 1, 1, 1,
-0.6331462, 0.9264371, 0.2199474, 1, 1, 1, 1, 1,
-0.6329771, 0.9599298, -1.021065, 1, 1, 1, 1, 1,
-0.631955, 0.4413902, -1.338493, 1, 1, 1, 1, 1,
-0.6287761, -0.5726568, -3.10809, 1, 1, 1, 1, 1,
-0.6257975, -1.153377, -1.406942, 1, 1, 1, 1, 1,
-0.623258, -2.08417, -2.784837, 1, 1, 1, 1, 1,
-0.621267, 0.1143162, -1.884024, 1, 1, 1, 1, 1,
-0.6209889, 1.927643, 0.5658125, 1, 1, 1, 1, 1,
-0.6205593, 0.9949359, 0.06516548, 1, 1, 1, 1, 1,
-0.6186373, 1.002938, 0.7802407, 1, 1, 1, 1, 1,
-0.6183051, 0.1033877, -1.287353, 1, 1, 1, 1, 1,
-0.6140004, 0.6325962, -0.5268387, 1, 1, 1, 1, 1,
-0.6127456, -0.8077329, -1.779412, 1, 1, 1, 1, 1,
-0.60844, -0.6166068, -2.647592, 0, 0, 1, 1, 1,
-0.6074926, -0.6059729, -2.727165, 1, 0, 0, 1, 1,
-0.6037298, 1.287717, -0.7586463, 1, 0, 0, 1, 1,
-0.602196, -0.2795129, -0.9845842, 1, 0, 0, 1, 1,
-0.5992278, 0.539416, -0.6751935, 1, 0, 0, 1, 1,
-0.5947052, 0.5817577, -0.6475502, 1, 0, 0, 1, 1,
-0.5928562, 0.2690388, -0.6278999, 0, 0, 0, 1, 1,
-0.5869926, 0.5722032, 1.37889, 0, 0, 0, 1, 1,
-0.5843194, -1.416453, -3.745599, 0, 0, 0, 1, 1,
-0.5800552, -0.4200082, -2.359972, 0, 0, 0, 1, 1,
-0.5758173, -0.004027677, -1.026986, 0, 0, 0, 1, 1,
-0.5707733, 0.03663096, -1.611467, 0, 0, 0, 1, 1,
-0.5671041, 0.1899315, -1.444966, 0, 0, 0, 1, 1,
-0.5653511, -2.223814, -1.535196, 1, 1, 1, 1, 1,
-0.5635095, 0.4914237, -0.0009909071, 1, 1, 1, 1, 1,
-0.5550948, -0.06452084, -1.475674, 1, 1, 1, 1, 1,
-0.5547838, 0.08493302, -2.666643, 1, 1, 1, 1, 1,
-0.5499153, -0.5292701, -2.248574, 1, 1, 1, 1, 1,
-0.5441927, -0.2825571, 0.1619619, 1, 1, 1, 1, 1,
-0.5409435, -0.617497, -3.696682, 1, 1, 1, 1, 1,
-0.5400701, -1.622137, -2.552164, 1, 1, 1, 1, 1,
-0.5360649, -0.3357587, -3.87274, 1, 1, 1, 1, 1,
-0.5349148, 0.8537933, 0.4966326, 1, 1, 1, 1, 1,
-0.531524, -0.06927228, 0.2506531, 1, 1, 1, 1, 1,
-0.530803, 0.4986087, -2.025161, 1, 1, 1, 1, 1,
-0.5307214, 1.21932, 0.01299143, 1, 1, 1, 1, 1,
-0.5184543, 0.1047718, -1.196511, 1, 1, 1, 1, 1,
-0.5163367, 1.18321, 0.7199121, 1, 1, 1, 1, 1,
-0.5147956, -1.658707, -3.113227, 0, 0, 1, 1, 1,
-0.5139945, 1.039194, 0.5839427, 1, 0, 0, 1, 1,
-0.5107961, 1.594461, 1.143264, 1, 0, 0, 1, 1,
-0.5094619, -0.05694272, -1.028752, 1, 0, 0, 1, 1,
-0.5074922, -0.1925043, -1.650453, 1, 0, 0, 1, 1,
-0.5073672, 0.6334369, -1.424053, 1, 0, 0, 1, 1,
-0.5064766, -2.495727, -4.260521, 0, 0, 0, 1, 1,
-0.5058583, -0.9551067, -2.861962, 0, 0, 0, 1, 1,
-0.5031139, 0.7559988, -1.227144, 0, 0, 0, 1, 1,
-0.5021323, -0.4194395, -2.688894, 0, 0, 0, 1, 1,
-0.5009531, -0.7825851, -0.9919352, 0, 0, 0, 1, 1,
-0.4975293, -0.5560213, -3.464255, 0, 0, 0, 1, 1,
-0.495822, -0.8800914, -3.887899, 0, 0, 0, 1, 1,
-0.4934376, 0.7618994, -0.5755987, 1, 1, 1, 1, 1,
-0.4858691, 0.08877839, -1.395499, 1, 1, 1, 1, 1,
-0.4829931, 0.8354188, -1.487478, 1, 1, 1, 1, 1,
-0.4727749, -0.1192385, 0.3492158, 1, 1, 1, 1, 1,
-0.4726448, 1.370021, 0.0776084, 1, 1, 1, 1, 1,
-0.4699693, -0.004298486, -0.3386185, 1, 1, 1, 1, 1,
-0.4673292, -1.112219, -1.848864, 1, 1, 1, 1, 1,
-0.4644942, -0.5853375, -2.380025, 1, 1, 1, 1, 1,
-0.4641873, -0.644071, -1.339292, 1, 1, 1, 1, 1,
-0.45949, -1.086407, -3.360624, 1, 1, 1, 1, 1,
-0.4580004, 0.836776, 1.245076, 1, 1, 1, 1, 1,
-0.4577492, 0.7329941, 0.7633561, 1, 1, 1, 1, 1,
-0.4576675, 0.1019004, -2.087369, 1, 1, 1, 1, 1,
-0.4474649, -0.03348948, -0.774551, 1, 1, 1, 1, 1,
-0.4459618, 0.2297981, -1.020449, 1, 1, 1, 1, 1,
-0.4453863, -1.417102, -3.235272, 0, 0, 1, 1, 1,
-0.4437633, 0.9159398, 0.622442, 1, 0, 0, 1, 1,
-0.4359739, 2.070018, 0.418427, 1, 0, 0, 1, 1,
-0.4326245, 0.1634942, -1.10499, 1, 0, 0, 1, 1,
-0.4285058, 0.9513618, -0.9341772, 1, 0, 0, 1, 1,
-0.4278366, -0.9228337, -4.578125, 1, 0, 0, 1, 1,
-0.4161898, 0.2806439, -1.834245, 0, 0, 0, 1, 1,
-0.4159053, -0.6741177, -3.109267, 0, 0, 0, 1, 1,
-0.4140423, 0.5778547, -2.018199, 0, 0, 0, 1, 1,
-0.409644, 0.4822764, -2.619635, 0, 0, 0, 1, 1,
-0.4063167, -2.317313, -3.085278, 0, 0, 0, 1, 1,
-0.405219, -1.869654, -3.19608, 0, 0, 0, 1, 1,
-0.4049684, -0.726245, -2.054199, 0, 0, 0, 1, 1,
-0.4026161, 1.704239, -0.8111503, 1, 1, 1, 1, 1,
-0.4021527, -0.4379824, -2.246739, 1, 1, 1, 1, 1,
-0.4007068, 0.5308268, -0.7828429, 1, 1, 1, 1, 1,
-0.3941123, 1.038478, -0.8149653, 1, 1, 1, 1, 1,
-0.3940555, -0.4716695, -2.587213, 1, 1, 1, 1, 1,
-0.3938567, -0.9280303, -3.354675, 1, 1, 1, 1, 1,
-0.3936788, -0.8961352, -2.439648, 1, 1, 1, 1, 1,
-0.3905334, -0.4863935, -3.141484, 1, 1, 1, 1, 1,
-0.3892043, 0.4868937, -1.643672, 1, 1, 1, 1, 1,
-0.387833, 0.5232691, -1.366845, 1, 1, 1, 1, 1,
-0.3826191, 1.624015, -0.7229705, 1, 1, 1, 1, 1,
-0.3795135, 0.5753757, -1.677221, 1, 1, 1, 1, 1,
-0.3794053, 0.7174023, -0.9768477, 1, 1, 1, 1, 1,
-0.3769287, -0.02272562, -1.421089, 1, 1, 1, 1, 1,
-0.3749277, 0.2116347, 0.2843285, 1, 1, 1, 1, 1,
-0.3711146, -1.950529, -4.099148, 0, 0, 1, 1, 1,
-0.3690496, -1.109439, -2.676471, 1, 0, 0, 1, 1,
-0.3609577, -0.5877646, -1.837419, 1, 0, 0, 1, 1,
-0.3572462, -1.335822, -0.8942137, 1, 0, 0, 1, 1,
-0.3510031, -0.3859659, -2.463509, 1, 0, 0, 1, 1,
-0.3488443, -0.6582783, -4.163191, 1, 0, 0, 1, 1,
-0.3482444, 1.432549, -0.9198238, 0, 0, 0, 1, 1,
-0.3467639, 1.280992, -0.621531, 0, 0, 0, 1, 1,
-0.3466252, 0.7320846, -0.4955865, 0, 0, 0, 1, 1,
-0.3460333, -1.229213, -3.388218, 0, 0, 0, 1, 1,
-0.3459297, -0.5186291, -0.9592604, 0, 0, 0, 1, 1,
-0.334559, -1.258258, -1.914338, 0, 0, 0, 1, 1,
-0.3343105, -0.8340665, -3.739434, 0, 0, 0, 1, 1,
-0.3335797, -0.7326276, -2.351397, 1, 1, 1, 1, 1,
-0.3299434, 0.1873313, -1.998789, 1, 1, 1, 1, 1,
-0.3284394, -0.3209071, -2.601732, 1, 1, 1, 1, 1,
-0.3242363, 0.4115687, -0.2325668, 1, 1, 1, 1, 1,
-0.3205881, -1.855959, -4.217685, 1, 1, 1, 1, 1,
-0.3205479, 0.63267, -0.6142408, 1, 1, 1, 1, 1,
-0.3165433, 2.123719, -0.6312999, 1, 1, 1, 1, 1,
-0.3150878, 0.371368, 0.1683181, 1, 1, 1, 1, 1,
-0.3121722, 0.2316294, -1.326459, 1, 1, 1, 1, 1,
-0.3111669, 2.158134, -0.8567917, 1, 1, 1, 1, 1,
-0.3066849, 0.5637659, -0.8980779, 1, 1, 1, 1, 1,
-0.3046475, -1.663541, -3.218596, 1, 1, 1, 1, 1,
-0.3001237, 1.400067, 0.6943244, 1, 1, 1, 1, 1,
-0.2989632, -0.6776253, -4.512262, 1, 1, 1, 1, 1,
-0.2971208, 0.5020738, 0.3291276, 1, 1, 1, 1, 1,
-0.2967878, 0.08024672, -2.458153, 0, 0, 1, 1, 1,
-0.2881712, -2.516751, -2.323331, 1, 0, 0, 1, 1,
-0.2877162, -1.180699, -4.355777, 1, 0, 0, 1, 1,
-0.2876978, 1.109647, -0.5764444, 1, 0, 0, 1, 1,
-0.2875611, 0.3423431, -0.4778714, 1, 0, 0, 1, 1,
-0.2852937, -0.5554104, -3.602405, 1, 0, 0, 1, 1,
-0.2851472, 0.3408496, 0.2892083, 0, 0, 0, 1, 1,
-0.2811904, -0.1465099, -3.313704, 0, 0, 0, 1, 1,
-0.277578, 0.6850226, -0.07557881, 0, 0, 0, 1, 1,
-0.2751604, 1.290072, -1.448578, 0, 0, 0, 1, 1,
-0.2751343, -1.264724, -3.164592, 0, 0, 0, 1, 1,
-0.271958, -1.308583, -2.673382, 0, 0, 0, 1, 1,
-0.2706073, 0.5536778, -0.06090461, 0, 0, 0, 1, 1,
-0.2679854, 1.404422, 0.8246146, 1, 1, 1, 1, 1,
-0.2643142, 0.05209436, -2.311599, 1, 1, 1, 1, 1,
-0.2637783, 1.212429, 1.638686, 1, 1, 1, 1, 1,
-0.2534851, 0.6047843, 0.1949209, 1, 1, 1, 1, 1,
-0.252858, -0.1043908, -1.241002, 1, 1, 1, 1, 1,
-0.2522821, 0.4616401, -0.1849274, 1, 1, 1, 1, 1,
-0.2510088, -2.20037, -2.48431, 1, 1, 1, 1, 1,
-0.2469023, -0.5029467, -1.693122, 1, 1, 1, 1, 1,
-0.2466045, -0.9615313, -3.425488, 1, 1, 1, 1, 1,
-0.2452554, -0.04192868, -2.17362, 1, 1, 1, 1, 1,
-0.2438051, 0.4340741, -1.976624, 1, 1, 1, 1, 1,
-0.2407153, 0.6957098, -0.3459305, 1, 1, 1, 1, 1,
-0.2404612, 1.407741, 0.5633907, 1, 1, 1, 1, 1,
-0.2391547, -0.2498835, -0.2304637, 1, 1, 1, 1, 1,
-0.2385222, -1.146275, -4.352005, 1, 1, 1, 1, 1,
-0.2358049, -0.1544901, -3.119037, 0, 0, 1, 1, 1,
-0.2290611, 1.389465, 1.061058, 1, 0, 0, 1, 1,
-0.228784, -0.5495908, -1.581974, 1, 0, 0, 1, 1,
-0.2144113, 1.088431, -1.06186, 1, 0, 0, 1, 1,
-0.2060166, 0.08431894, -2.702389, 1, 0, 0, 1, 1,
-0.2048992, 0.006880651, -2.569526, 1, 0, 0, 1, 1,
-0.2047711, 0.8317153, -1.756063, 0, 0, 0, 1, 1,
-0.1967777, 0.7016285, -1.324193, 0, 0, 0, 1, 1,
-0.1959978, 1.22348, 1.526532, 0, 0, 0, 1, 1,
-0.1934547, -0.6795456, -4.527287, 0, 0, 0, 1, 1,
-0.1929918, 0.5263199, -0.5873742, 0, 0, 0, 1, 1,
-0.1923747, -0.04294442, -3.093478, 0, 0, 0, 1, 1,
-0.1893417, -1.47649, -3.185172, 0, 0, 0, 1, 1,
-0.1843408, 1.350596, -0.5326183, 1, 1, 1, 1, 1,
-0.183074, -0.8286017, -2.657764, 1, 1, 1, 1, 1,
-0.1830028, -0.6053311, -1.947348, 1, 1, 1, 1, 1,
-0.1829114, -0.8810796, -1.6266, 1, 1, 1, 1, 1,
-0.1787575, 0.3498115, 0.2347389, 1, 1, 1, 1, 1,
-0.1781419, 0.5008588, 0.07555958, 1, 1, 1, 1, 1,
-0.1747115, 0.6133839, -0.3317524, 1, 1, 1, 1, 1,
-0.1712432, 0.04713291, -0.5676556, 1, 1, 1, 1, 1,
-0.1706754, 0.7471757, -0.9373863, 1, 1, 1, 1, 1,
-0.167453, -1.726538, -3.671062, 1, 1, 1, 1, 1,
-0.1631409, 0.8127396, 0.8407807, 1, 1, 1, 1, 1,
-0.1609575, -0.4228162, -2.091163, 1, 1, 1, 1, 1,
-0.1603695, 0.3565489, -2.230346, 1, 1, 1, 1, 1,
-0.1588771, -1.190756, -2.405636, 1, 1, 1, 1, 1,
-0.157529, -0.4917483, -3.883802, 1, 1, 1, 1, 1,
-0.1573805, 2.057201, -2.2448, 0, 0, 1, 1, 1,
-0.1513887, -0.4783492, -2.529822, 1, 0, 0, 1, 1,
-0.1504376, 0.626493, -0.6848234, 1, 0, 0, 1, 1,
-0.1439057, 0.9173735, -0.5496282, 1, 0, 0, 1, 1,
-0.1425843, -1.107319, -3.93365, 1, 0, 0, 1, 1,
-0.1386304, -0.5065238, -3.818355, 1, 0, 0, 1, 1,
-0.1369537, 1.905078, -0.9158381, 0, 0, 0, 1, 1,
-0.1367878, 0.3377926, -0.7838668, 0, 0, 0, 1, 1,
-0.1346191, 0.6451243, -0.3351596, 0, 0, 0, 1, 1,
-0.1315445, 0.6415765, -0.7594202, 0, 0, 0, 1, 1,
-0.1220905, 1.361671, 0.3197024, 0, 0, 0, 1, 1,
-0.1187975, -1.248441, -3.934323, 0, 0, 0, 1, 1,
-0.1164594, -0.1534161, -3.320658, 0, 0, 0, 1, 1,
-0.1134145, -1.640988, -2.989028, 1, 1, 1, 1, 1,
-0.1106461, 1.270478, 0.7154601, 1, 1, 1, 1, 1,
-0.1096888, -1.569179, -3.942686, 1, 1, 1, 1, 1,
-0.1046401, 0.6362985, -0.4225123, 1, 1, 1, 1, 1,
-0.1017224, 1.108403, 0.3778687, 1, 1, 1, 1, 1,
-0.101049, 0.2145069, -0.4405489, 1, 1, 1, 1, 1,
-0.1005381, 0.8716412, -0.8446597, 1, 1, 1, 1, 1,
-0.09764188, 0.589175, -1.534363, 1, 1, 1, 1, 1,
-0.09677206, -1.149386, -0.9366966, 1, 1, 1, 1, 1,
-0.09139492, 0.8618181, -0.1028979, 1, 1, 1, 1, 1,
-0.08726789, 0.8295472, 0.02870026, 1, 1, 1, 1, 1,
-0.08690862, 0.067191, -1.927979, 1, 1, 1, 1, 1,
-0.07730744, 0.9377866, -1.332002, 1, 1, 1, 1, 1,
-0.07648481, 0.09448867, -1.19639, 1, 1, 1, 1, 1,
-0.07593121, -0.8977472, -5.572049, 1, 1, 1, 1, 1,
-0.07450899, 0.09614769, -0.9448163, 0, 0, 1, 1, 1,
-0.07269455, -0.3999332, -2.942139, 1, 0, 0, 1, 1,
-0.06885283, -0.4386917, -6.012897, 1, 0, 0, 1, 1,
-0.05544804, -1.802181, -2.046217, 1, 0, 0, 1, 1,
-0.05400761, -0.4611865, -2.587051, 1, 0, 0, 1, 1,
-0.05388209, -3.317925, -4.674399, 1, 0, 0, 1, 1,
-0.05173156, -1.176718, -2.943263, 0, 0, 0, 1, 1,
-0.05007153, 0.7468191, -1.139835, 0, 0, 0, 1, 1,
-0.04701066, 0.4687752, 0.8770154, 0, 0, 0, 1, 1,
-0.04331753, -0.5692663, -3.889404, 0, 0, 0, 1, 1,
-0.03743144, -0.209401, -2.10166, 0, 0, 0, 1, 1,
-0.03276042, 0.5347976, -0.4269828, 0, 0, 0, 1, 1,
-0.02855913, -1.102492, -1.962664, 0, 0, 0, 1, 1,
-0.02648433, -0.1404983, -1.91424, 1, 1, 1, 1, 1,
-0.01502184, 0.3636667, 1.307811, 1, 1, 1, 1, 1,
-0.01442077, 0.4620129, -0.258699, 1, 1, 1, 1, 1,
-0.01397375, -1.669591, -2.529009, 1, 1, 1, 1, 1,
-0.01023314, -0.7997481, -2.107972, 1, 1, 1, 1, 1,
0.001858982, 2.271971, 1.425584, 1, 1, 1, 1, 1,
0.002871618, -1.626159, 3.941287, 1, 1, 1, 1, 1,
0.004379169, 0.00309186, 1.496461, 1, 1, 1, 1, 1,
0.009414204, -0.5271165, 3.925901, 1, 1, 1, 1, 1,
0.01047181, 0.2568602, 0.666787, 1, 1, 1, 1, 1,
0.01239956, 1.579802, -0.3124541, 1, 1, 1, 1, 1,
0.01393162, 1.780147, 1.225942, 1, 1, 1, 1, 1,
0.01737984, -0.1973922, 4.346211, 1, 1, 1, 1, 1,
0.02058536, -0.3400218, 2.071251, 1, 1, 1, 1, 1,
0.02156415, -1.497094, 1.332598, 1, 1, 1, 1, 1,
0.02249069, 0.2614159, -0.6777915, 0, 0, 1, 1, 1,
0.02331778, 0.1637692, 1.670924, 1, 0, 0, 1, 1,
0.02371201, 1.65924, -1.593908, 1, 0, 0, 1, 1,
0.02449553, 0.8375099, 0.008434267, 1, 0, 0, 1, 1,
0.03011225, -0.6365134, 3.322798, 1, 0, 0, 1, 1,
0.03136824, -0.3332333, 3.286091, 1, 0, 0, 1, 1,
0.03581463, 0.3170041, 1.034897, 0, 0, 0, 1, 1,
0.03724334, 1.801071, -1.416171, 0, 0, 0, 1, 1,
0.04135395, -0.8704556, 3.589203, 0, 0, 0, 1, 1,
0.04155803, -0.01654555, 1.400878, 0, 0, 0, 1, 1,
0.04676298, 2.22793, -1.239834, 0, 0, 0, 1, 1,
0.04801002, -0.4336784, 3.539282, 0, 0, 0, 1, 1,
0.05276406, -0.6221794, 4.260831, 0, 0, 0, 1, 1,
0.05404347, 0.1954082, 0.03553885, 1, 1, 1, 1, 1,
0.05880883, 2.347691, -1.795469, 1, 1, 1, 1, 1,
0.06296121, -0.747368, 4.319122, 1, 1, 1, 1, 1,
0.06558628, -1.204981, 1.927982, 1, 1, 1, 1, 1,
0.06599186, -0.3770252, 2.623207, 1, 1, 1, 1, 1,
0.06709983, -0.6953172, 4.06274, 1, 1, 1, 1, 1,
0.07891568, 1.052216, 0.1306772, 1, 1, 1, 1, 1,
0.0804501, 0.1740067, 0.2882789, 1, 1, 1, 1, 1,
0.0849051, -0.4133399, 2.49784, 1, 1, 1, 1, 1,
0.0852254, 0.6080666, 0.4242488, 1, 1, 1, 1, 1,
0.08542785, -0.06993371, 2.031583, 1, 1, 1, 1, 1,
0.1060234, -0.5205121, 2.872366, 1, 1, 1, 1, 1,
0.1063678, -2.143912, 3.12003, 1, 1, 1, 1, 1,
0.1098669, 0.1813395, 0.222486, 1, 1, 1, 1, 1,
0.1136217, -0.8488371, 2.768889, 1, 1, 1, 1, 1,
0.1178248, -0.9669049, 4.516294, 0, 0, 1, 1, 1,
0.1181771, -0.4083592, 4.091086, 1, 0, 0, 1, 1,
0.1208761, -1.122128, 4.515446, 1, 0, 0, 1, 1,
0.1255236, 0.7070165, 1.829754, 1, 0, 0, 1, 1,
0.1262006, 0.3223621, 0.9788106, 1, 0, 0, 1, 1,
0.1302166, 0.02145404, 1.937652, 1, 0, 0, 1, 1,
0.1304397, 0.6536036, 0.9015563, 0, 0, 0, 1, 1,
0.1316317, 1.012012, 1.199327, 0, 0, 0, 1, 1,
0.1323975, 0.008356838, 0.8056793, 0, 0, 0, 1, 1,
0.1329941, -0.09242269, 2.201713, 0, 0, 0, 1, 1,
0.1354867, -0.9308736, 3.125474, 0, 0, 0, 1, 1,
0.1365106, 1.355124, 0.07842266, 0, 0, 0, 1, 1,
0.1365981, -0.5440171, 2.981556, 0, 0, 0, 1, 1,
0.1372875, 0.5030231, -1.174323, 1, 1, 1, 1, 1,
0.1423412, -1.670802, 2.349826, 1, 1, 1, 1, 1,
0.1429742, 2.337692, -0.8599151, 1, 1, 1, 1, 1,
0.1438163, -0.1572379, 0.00771773, 1, 1, 1, 1, 1,
0.1468624, -0.09398175, 1.0811, 1, 1, 1, 1, 1,
0.147336, 2.194656, 1.044391, 1, 1, 1, 1, 1,
0.1515001, 1.535192, 0.6213912, 1, 1, 1, 1, 1,
0.153414, -0.01349733, 1.895061, 1, 1, 1, 1, 1,
0.1575679, -0.5423967, 3.715339, 1, 1, 1, 1, 1,
0.1595018, 1.88203, 1.181264, 1, 1, 1, 1, 1,
0.1598012, -2.163122, 3.968693, 1, 1, 1, 1, 1,
0.1636418, 0.3902389, -0.088898, 1, 1, 1, 1, 1,
0.1665276, 1.26143, -0.004998038, 1, 1, 1, 1, 1,
0.1749961, 0.1664948, 1.164213, 1, 1, 1, 1, 1,
0.1776996, -1.883633, 2.309831, 1, 1, 1, 1, 1,
0.1827916, -0.1500961, 4.0201, 0, 0, 1, 1, 1,
0.1876247, -1.741678, 1.605713, 1, 0, 0, 1, 1,
0.1929757, -0.6843436, 3.126781, 1, 0, 0, 1, 1,
0.1983478, 1.536235, -0.176469, 1, 0, 0, 1, 1,
0.1996188, -0.5409893, 3.631293, 1, 0, 0, 1, 1,
0.2008463, 0.4497477, -0.1161617, 1, 0, 0, 1, 1,
0.2048597, -0.1696235, 1.877895, 0, 0, 0, 1, 1,
0.2050079, 1.692744, -0.42756, 0, 0, 0, 1, 1,
0.2072916, -0.5085314, 3.772389, 0, 0, 0, 1, 1,
0.2092797, 0.6559839, 1.297828, 0, 0, 0, 1, 1,
0.2126119, 0.7135421, 0.3759289, 0, 0, 0, 1, 1,
0.2146222, 0.6339553, 0.7917986, 0, 0, 0, 1, 1,
0.2151268, -1.129, 2.604175, 0, 0, 0, 1, 1,
0.2191593, 0.03447008, 0.5540714, 1, 1, 1, 1, 1,
0.2201213, -0.02722075, 2.85275, 1, 1, 1, 1, 1,
0.2203335, 1.174743, -0.5309517, 1, 1, 1, 1, 1,
0.2222395, 0.6086956, 0.5275825, 1, 1, 1, 1, 1,
0.2222576, 0.1383984, 1.494775, 1, 1, 1, 1, 1,
0.2226925, 1.748212, -0.3943884, 1, 1, 1, 1, 1,
0.2246439, 0.2862875, -1.168262, 1, 1, 1, 1, 1,
0.2255638, 0.799166, -0.8611322, 1, 1, 1, 1, 1,
0.2260799, 0.7424186, -0.7768152, 1, 1, 1, 1, 1,
0.233043, -0.03479921, 2.179285, 1, 1, 1, 1, 1,
0.2335957, -0.4250005, 2.735311, 1, 1, 1, 1, 1,
0.2339619, -1.121753, 1.884156, 1, 1, 1, 1, 1,
0.2362332, -1.00513, 5.426841, 1, 1, 1, 1, 1,
0.2371803, 0.763704, 0.07540343, 1, 1, 1, 1, 1,
0.2377694, -0.7337691, 3.717048, 1, 1, 1, 1, 1,
0.2400919, -0.6576451, 3.854631, 0, 0, 1, 1, 1,
0.2411228, 0.005457893, 2.698591, 1, 0, 0, 1, 1,
0.2456315, -1.757728, 3.334671, 1, 0, 0, 1, 1,
0.2457749, -0.2319986, 1.901873, 1, 0, 0, 1, 1,
0.2510481, -0.1592909, 3.113342, 1, 0, 0, 1, 1,
0.2536191, 0.686366, 0.7371708, 1, 0, 0, 1, 1,
0.2541669, -0.6265252, 3.353409, 0, 0, 0, 1, 1,
0.2607766, -1.320534, 2.538056, 0, 0, 0, 1, 1,
0.2630829, -0.4770424, 0.8106128, 0, 0, 0, 1, 1,
0.2642103, -1.638234, 2.657341, 0, 0, 0, 1, 1,
0.2723013, -2.311209, 4.255987, 0, 0, 0, 1, 1,
0.2733698, -0.09866404, 0.370332, 0, 0, 0, 1, 1,
0.2753433, 0.7080746, 1.204774, 0, 0, 0, 1, 1,
0.2858286, -1.813809, 2.027832, 1, 1, 1, 1, 1,
0.2865817, 0.4751581, 1.172779, 1, 1, 1, 1, 1,
0.2880228, 2.458746, 0.6700205, 1, 1, 1, 1, 1,
0.289116, -0.1097593, 3.309797, 1, 1, 1, 1, 1,
0.2922623, -0.5198094, 1.990951, 1, 1, 1, 1, 1,
0.3001075, 0.1658764, 1.469642, 1, 1, 1, 1, 1,
0.3012376, -0.8463013, 4.341038, 1, 1, 1, 1, 1,
0.303255, 0.2258397, 2.48985, 1, 1, 1, 1, 1,
0.3087258, -0.4548169, 2.754688, 1, 1, 1, 1, 1,
0.3146085, -1.287671, 2.273075, 1, 1, 1, 1, 1,
0.315331, -0.9715392, 3.230815, 1, 1, 1, 1, 1,
0.3173906, -0.2879431, 2.990123, 1, 1, 1, 1, 1,
0.3189775, 0.5952731, -0.2258546, 1, 1, 1, 1, 1,
0.327429, -0.437627, 2.333461, 1, 1, 1, 1, 1,
0.3283004, -1.745642, 1.89235, 1, 1, 1, 1, 1,
0.3318453, 0.4013166, 2.866363, 0, 0, 1, 1, 1,
0.3347831, -1.139771, 2.184755, 1, 0, 0, 1, 1,
0.3362104, 1.194548, 1.767967, 1, 0, 0, 1, 1,
0.3390475, 0.02541008, 1.136725, 1, 0, 0, 1, 1,
0.342688, 0.4625188, 1.617485, 1, 0, 0, 1, 1,
0.3459977, -0.5955778, 3.43271, 1, 0, 0, 1, 1,
0.3460285, 0.8201841, -0.3570048, 0, 0, 0, 1, 1,
0.3465464, -0.3493071, 2.16005, 0, 0, 0, 1, 1,
0.3506129, -0.2263445, 0.9298295, 0, 0, 0, 1, 1,
0.3607973, 1.203342, 0.4244253, 0, 0, 0, 1, 1,
0.3636268, -0.3661418, 3.090356, 0, 0, 0, 1, 1,
0.3657065, -0.3605051, 2.988869, 0, 0, 0, 1, 1,
0.3664173, -0.5196187, 2.493414, 0, 0, 0, 1, 1,
0.366703, -2.348554, 2.823254, 1, 1, 1, 1, 1,
0.3711607, 1.015149, 2.413175, 1, 1, 1, 1, 1,
0.3716153, 0.6951546, 0.8613731, 1, 1, 1, 1, 1,
0.3732196, 0.6214324, 0.5530333, 1, 1, 1, 1, 1,
0.378802, -0.8830355, 3.734121, 1, 1, 1, 1, 1,
0.3804268, -1.772375, 3.238641, 1, 1, 1, 1, 1,
0.3817095, 0.6831322, -0.827557, 1, 1, 1, 1, 1,
0.3871245, 0.2871151, 1.346268, 1, 1, 1, 1, 1,
0.3906792, -0.6323408, 1.82592, 1, 1, 1, 1, 1,
0.3939528, -0.006886821, 2.29039, 1, 1, 1, 1, 1,
0.3972593, 1.358779, -1.204088, 1, 1, 1, 1, 1,
0.3982016, 0.4813349, -0.6617486, 1, 1, 1, 1, 1,
0.4010243, 0.2617118, 0.7980793, 1, 1, 1, 1, 1,
0.403407, -2.145349, 2.861669, 1, 1, 1, 1, 1,
0.4047319, 1.549033, -0.4703896, 1, 1, 1, 1, 1,
0.4070714, 0.9630026, 3.080525, 0, 0, 1, 1, 1,
0.4149611, 0.4054052, -0.4713387, 1, 0, 0, 1, 1,
0.415328, 0.9228519, -0.4745281, 1, 0, 0, 1, 1,
0.4175792, 0.4749463, 2.0192, 1, 0, 0, 1, 1,
0.4184602, -0.4279383, 2.440875, 1, 0, 0, 1, 1,
0.4305753, -0.1907761, 2.395136, 1, 0, 0, 1, 1,
0.4378412, -0.7986128, 5.48232, 0, 0, 0, 1, 1,
0.444137, -0.4541331, 2.831458, 0, 0, 0, 1, 1,
0.4470837, 0.3973244, 0.126957, 0, 0, 0, 1, 1,
0.4484668, 1.069578, 0.1242219, 0, 0, 0, 1, 1,
0.4495275, -0.2268328, 0.2798647, 0, 0, 0, 1, 1,
0.4565638, -1.025833, 3.453392, 0, 0, 0, 1, 1,
0.4566707, 1.512378, 1.515276, 0, 0, 0, 1, 1,
0.4604527, -0.364546, 1.020494, 1, 1, 1, 1, 1,
0.4648629, -1.296718, 1.319667, 1, 1, 1, 1, 1,
0.4655875, 1.200193, 0.7505115, 1, 1, 1, 1, 1,
0.4669248, -1.079699, 3.988024, 1, 1, 1, 1, 1,
0.4730914, 0.5480962, -1.335679, 1, 1, 1, 1, 1,
0.4742005, -1.802771, 2.815194, 1, 1, 1, 1, 1,
0.4752816, 1.173928, -0.2948511, 1, 1, 1, 1, 1,
0.4754183, 0.5537944, 1.899208, 1, 1, 1, 1, 1,
0.4754561, 0.5222888, 0.5303276, 1, 1, 1, 1, 1,
0.4771377, 1.312127, 2.115293, 1, 1, 1, 1, 1,
0.4790053, 1.65803, 1.329544, 1, 1, 1, 1, 1,
0.4838901, 0.0956266, 1.234296, 1, 1, 1, 1, 1,
0.4852211, 0.7532089, 1.399395, 1, 1, 1, 1, 1,
0.4865524, -0.4656529, 2.600496, 1, 1, 1, 1, 1,
0.490303, 0.7417256, 1.469595, 1, 1, 1, 1, 1,
0.4963306, -0.7792212, 2.637335, 0, 0, 1, 1, 1,
0.5003281, -0.1682738, 1.656326, 1, 0, 0, 1, 1,
0.505336, -1.176553, 1.770996, 1, 0, 0, 1, 1,
0.5073329, -0.65674, 1.959051, 1, 0, 0, 1, 1,
0.514282, 0.3769186, 0.1757995, 1, 0, 0, 1, 1,
0.5144613, -0.6483332, 1.815455, 1, 0, 0, 1, 1,
0.5174975, 1.289285, 1.617665, 0, 0, 0, 1, 1,
0.5202819, -0.5824395, 3.006874, 0, 0, 0, 1, 1,
0.5295619, 0.9940833, 0.1365297, 0, 0, 0, 1, 1,
0.5301154, -0.1061021, 2.283699, 0, 0, 0, 1, 1,
0.5306373, 0.3664322, 0.3118839, 0, 0, 0, 1, 1,
0.5347965, 1.397087, 0.4576727, 0, 0, 0, 1, 1,
0.5393407, 0.4796605, -0.1619822, 0, 0, 0, 1, 1,
0.5398936, -0.5262302, 2.476961, 1, 1, 1, 1, 1,
0.5500231, 0.231452, 0.1771223, 1, 1, 1, 1, 1,
0.5523441, -1.214671, 3.469279, 1, 1, 1, 1, 1,
0.5525544, 0.9195887, 0.4597697, 1, 1, 1, 1, 1,
0.5561569, -0.5708436, 2.022602, 1, 1, 1, 1, 1,
0.5572923, -0.9789752, 3.432858, 1, 1, 1, 1, 1,
0.5578593, 0.3347111, 2.37897, 1, 1, 1, 1, 1,
0.558333, -0.1318713, 1.827784, 1, 1, 1, 1, 1,
0.5595606, -0.2294994, 0.9443389, 1, 1, 1, 1, 1,
0.5635951, 0.4398594, 1.560487, 1, 1, 1, 1, 1,
0.5645478, 0.2300249, 2.575954, 1, 1, 1, 1, 1,
0.5648275, -0.5009086, 1.274311, 1, 1, 1, 1, 1,
0.5721508, -0.01650078, 0.6453999, 1, 1, 1, 1, 1,
0.5745957, 2.528095, -0.1154694, 1, 1, 1, 1, 1,
0.5756909, -2.028208, 3.162656, 1, 1, 1, 1, 1,
0.580723, 0.08807838, 0.3005783, 0, 0, 1, 1, 1,
0.5809046, -0.7641551, 2.351123, 1, 0, 0, 1, 1,
0.5842872, -2.171173, 2.533463, 1, 0, 0, 1, 1,
0.5882196, 0.2987294, -0.2520864, 1, 0, 0, 1, 1,
0.5919843, 0.3965075, 2.139042, 1, 0, 0, 1, 1,
0.5925044, -1.479995, 3.077368, 1, 0, 0, 1, 1,
0.6034413, -0.2252619, 0.6902371, 0, 0, 0, 1, 1,
0.6039667, 1.387987, 0.5188439, 0, 0, 0, 1, 1,
0.6062161, 0.1590521, 2.082569, 0, 0, 0, 1, 1,
0.6070369, 0.5783077, -0.1635139, 0, 0, 0, 1, 1,
0.6134602, -0.8577775, 2.35965, 0, 0, 0, 1, 1,
0.6145703, -0.2944069, 3.192986, 0, 0, 0, 1, 1,
0.6163107, 0.7940941, 0.4075855, 0, 0, 0, 1, 1,
0.618429, -0.9130785, 1.906598, 1, 1, 1, 1, 1,
0.6208759, -0.1334846, 1.843878, 1, 1, 1, 1, 1,
0.621969, -0.1625189, 1.545677, 1, 1, 1, 1, 1,
0.6248406, -0.406206, 2.326027, 1, 1, 1, 1, 1,
0.6309276, 0.8047065, 0.5050262, 1, 1, 1, 1, 1,
0.6323913, -0.1686051, 1.250905, 1, 1, 1, 1, 1,
0.6334296, 0.8810673, -0.3026593, 1, 1, 1, 1, 1,
0.636122, 0.2193203, 1.370656, 1, 1, 1, 1, 1,
0.6387745, 0.2513844, 0.4905578, 1, 1, 1, 1, 1,
0.6417363, -0.2532587, 2.715139, 1, 1, 1, 1, 1,
0.6473988, -0.1227563, 1.446988, 1, 1, 1, 1, 1,
0.6504157, -1.236489, 2.913893, 1, 1, 1, 1, 1,
0.6548308, 1.511726, 1.433082, 1, 1, 1, 1, 1,
0.6625499, -0.2707212, 2.039507, 1, 1, 1, 1, 1,
0.6663733, -1.297968, 2.431618, 1, 1, 1, 1, 1,
0.668174, -0.9074709, 1.808096, 0, 0, 1, 1, 1,
0.6710025, -0.6606603, 2.550833, 1, 0, 0, 1, 1,
0.676577, -0.009033986, 1.04294, 1, 0, 0, 1, 1,
0.6844369, 1.023012, 1.931127, 1, 0, 0, 1, 1,
0.6863513, -0.04070741, 1.523861, 1, 0, 0, 1, 1,
0.6901662, -0.9424368, 1.982695, 1, 0, 0, 1, 1,
0.6922041, -0.3769825, 2.988493, 0, 0, 0, 1, 1,
0.6935937, 1.457424, 0.9332528, 0, 0, 0, 1, 1,
0.6951181, 0.7041805, 0.7130594, 0, 0, 0, 1, 1,
0.6994259, -0.6238683, 3.038217, 0, 0, 0, 1, 1,
0.7032965, -1.243097, 2.58557, 0, 0, 0, 1, 1,
0.708709, 0.8093349, 1.896493, 0, 0, 0, 1, 1,
0.720567, 0.07981795, 1.519489, 0, 0, 0, 1, 1,
0.7279883, 0.2594757, 1.235402, 1, 1, 1, 1, 1,
0.7333378, 0.7648515, 1.021575, 1, 1, 1, 1, 1,
0.7352546, 1.012839, 1.514768, 1, 1, 1, 1, 1,
0.7367532, -0.1398402, 0.9039984, 1, 1, 1, 1, 1,
0.7370648, -0.493363, 0.3970171, 1, 1, 1, 1, 1,
0.7381922, -2.160428, 2.486611, 1, 1, 1, 1, 1,
0.7387842, 0.05368335, 1.090441, 1, 1, 1, 1, 1,
0.7404141, -1.048249, 2.627858, 1, 1, 1, 1, 1,
0.7415919, 0.5664269, 1.456574, 1, 1, 1, 1, 1,
0.7463005, -0.1163025, 0.8375817, 1, 1, 1, 1, 1,
0.7477309, 2.277456, 1.506138, 1, 1, 1, 1, 1,
0.7495018, -0.1885656, 2.937848, 1, 1, 1, 1, 1,
0.7502858, -0.3284276, 0.2357135, 1, 1, 1, 1, 1,
0.7536625, 0.682006, 0.4693755, 1, 1, 1, 1, 1,
0.7544423, 2.240098, -1.258655, 1, 1, 1, 1, 1,
0.7655579, 0.4951021, 0.681936, 0, 0, 1, 1, 1,
0.7695689, 0.3840725, 1.519303, 1, 0, 0, 1, 1,
0.770164, 0.3211259, 1.633582, 1, 0, 0, 1, 1,
0.7704327, -0.3400548, 2.427159, 1, 0, 0, 1, 1,
0.7719839, -0.493138, 3.798119, 1, 0, 0, 1, 1,
0.7730028, -0.3175371, 1.042663, 1, 0, 0, 1, 1,
0.7799529, 0.6978428, 2.114437, 0, 0, 0, 1, 1,
0.7890746, -0.2639799, 2.018011, 0, 0, 0, 1, 1,
0.7903982, 1.016297, 1.529224, 0, 0, 0, 1, 1,
0.7925321, -1.32917, 1.36205, 0, 0, 0, 1, 1,
0.7949385, 1.501137, -0.7877692, 0, 0, 0, 1, 1,
0.7962947, 0.6546558, -0.1560613, 0, 0, 0, 1, 1,
0.7970248, 2.281153, -0.2870938, 0, 0, 0, 1, 1,
0.8017677, 0.5263808, 0.356217, 1, 1, 1, 1, 1,
0.8020231, 1.267709, 0.2634657, 1, 1, 1, 1, 1,
0.8059771, 1.52216, 1.919729, 1, 1, 1, 1, 1,
0.806464, 0.7983028, 1.471996, 1, 1, 1, 1, 1,
0.8073601, 0.4779513, 1.569485, 1, 1, 1, 1, 1,
0.810396, 2.263863, -0.9052511, 1, 1, 1, 1, 1,
0.810681, -0.01972702, 0.4572337, 1, 1, 1, 1, 1,
0.8160238, -1.118166, 2.468564, 1, 1, 1, 1, 1,
0.8174323, -0.05904598, 1.118635, 1, 1, 1, 1, 1,
0.8209379, 2.02424, 2.191165, 1, 1, 1, 1, 1,
0.8236015, 1.085247, 2.769684, 1, 1, 1, 1, 1,
0.82935, 0.6567427, 1.101178, 1, 1, 1, 1, 1,
0.832734, 0.2397203, -0.4819027, 1, 1, 1, 1, 1,
0.8329953, 0.4591456, 2.077734, 1, 1, 1, 1, 1,
0.8356528, -1.532349, 3.935339, 1, 1, 1, 1, 1,
0.8397365, 1.363911, 1.116852, 0, 0, 1, 1, 1,
0.8421139, 0.2458089, 0.5626312, 1, 0, 0, 1, 1,
0.8426536, -0.951183, 2.339898, 1, 0, 0, 1, 1,
0.8436438, 1.1116, -0.04599734, 1, 0, 0, 1, 1,
0.8456151, -0.9916626, 2.698299, 1, 0, 0, 1, 1,
0.8465458, 0.2893244, 1.815651, 1, 0, 0, 1, 1,
0.8475049, -0.06155011, 0.1805568, 0, 0, 0, 1, 1,
0.8511121, 1.010408, 2.937378, 0, 0, 0, 1, 1,
0.8534681, 2.40393, 0.1430774, 0, 0, 0, 1, 1,
0.8567815, 0.5035719, 0.5146182, 0, 0, 0, 1, 1,
0.8571384, -0.8131214, 2.495885, 0, 0, 0, 1, 1,
0.8573046, 0.2192668, 0.780198, 0, 0, 0, 1, 1,
0.8575327, 0.223895, 1.223174, 0, 0, 0, 1, 1,
0.8579277, -0.4108865, 1.395556, 1, 1, 1, 1, 1,
0.8683303, 0.07592016, 2.148003, 1, 1, 1, 1, 1,
0.8714767, -2.328511, 2.109119, 1, 1, 1, 1, 1,
0.8733281, 1.297254, 1.009128, 1, 1, 1, 1, 1,
0.8816585, -1.101087, 2.046509, 1, 1, 1, 1, 1,
0.8859789, 0.2896409, 1.224649, 1, 1, 1, 1, 1,
0.894287, 0.5566093, 0.8897488, 1, 1, 1, 1, 1,
0.8956106, -0.3503361, 2.406631, 1, 1, 1, 1, 1,
0.8984213, -1.375489, 2.120515, 1, 1, 1, 1, 1,
0.9092398, -0.696604, 4.218727, 1, 1, 1, 1, 1,
0.9155811, 0.4015011, 1.870357, 1, 1, 1, 1, 1,
0.9174358, 0.2056061, 1.260499, 1, 1, 1, 1, 1,
0.9250933, 0.02262149, 1.56345, 1, 1, 1, 1, 1,
0.9272904, 0.7643256, 1.424271, 1, 1, 1, 1, 1,
0.9408126, 0.1204325, -0.3291122, 1, 1, 1, 1, 1,
0.943942, -0.1475444, 2.327606, 0, 0, 1, 1, 1,
0.9479819, 0.09336817, 0.9767124, 1, 0, 0, 1, 1,
0.9490522, 0.5590129, 1.766031, 1, 0, 0, 1, 1,
0.9500597, -0.2845555, 1.188506, 1, 0, 0, 1, 1,
0.9553255, 0.291773, 1.324802, 1, 0, 0, 1, 1,
0.9621306, -0.2264953, 0.7761095, 1, 0, 0, 1, 1,
0.9623032, -1.283134, 2.455258, 0, 0, 0, 1, 1,
0.974458, -1.315138, 1.758041, 0, 0, 0, 1, 1,
0.9762165, -1.512641, 2.729108, 0, 0, 0, 1, 1,
0.9774477, -0.5088798, 4.247871, 0, 0, 0, 1, 1,
0.9782848, 0.1779725, 2.129595, 0, 0, 0, 1, 1,
0.9786195, 0.2245238, 1.385327, 0, 0, 0, 1, 1,
0.9816659, -0.7065362, 2.191426, 0, 0, 0, 1, 1,
0.9878215, 1.488151, 1.448996, 1, 1, 1, 1, 1,
0.9893155, -0.1942042, 0.2286994, 1, 1, 1, 1, 1,
1.000548, 0.6685925, 0.8955234, 1, 1, 1, 1, 1,
1.00991, 1.522982, 2.717875, 1, 1, 1, 1, 1,
1.013581, -0.4104784, 1.318876, 1, 1, 1, 1, 1,
1.014655, -0.8061353, 1.790762, 1, 1, 1, 1, 1,
1.014694, -0.808568, 1.822632, 1, 1, 1, 1, 1,
1.016213, 0.5253247, -1.086588, 1, 1, 1, 1, 1,
1.018944, 0.4903831, 0.9214444, 1, 1, 1, 1, 1,
1.022079, -1.356937, 3.092506, 1, 1, 1, 1, 1,
1.023498, -0.6780615, 1.135574, 1, 1, 1, 1, 1,
1.023562, 0.8498829, 0.6791874, 1, 1, 1, 1, 1,
1.028365, 2.086364, 0.3714478, 1, 1, 1, 1, 1,
1.034555, -1.856796, 2.684757, 1, 1, 1, 1, 1,
1.036028, 0.4333406, -1.188589, 1, 1, 1, 1, 1,
1.039389, -0.2749885, 1.131018, 0, 0, 1, 1, 1,
1.041014, -0.2654664, 0.784985, 1, 0, 0, 1, 1,
1.048019, 2.062818, 1.58466, 1, 0, 0, 1, 1,
1.052088, 0.7883254, -1.14887, 1, 0, 0, 1, 1,
1.061764, 0.1411487, -0.6237421, 1, 0, 0, 1, 1,
1.063971, -1.267731, 2.344751, 1, 0, 0, 1, 1,
1.067761, -1.558743, 3.045092, 0, 0, 0, 1, 1,
1.069013, 0.213758, 2.503753, 0, 0, 0, 1, 1,
1.080463, 1.147279, 0.1902281, 0, 0, 0, 1, 1,
1.088461, -0.09428256, 2.346119, 0, 0, 0, 1, 1,
1.107079, 1.946304, 2.081848, 0, 0, 0, 1, 1,
1.109865, 0.6260045, 2.724438, 0, 0, 0, 1, 1,
1.110212, -1.270446, 2.952477, 0, 0, 0, 1, 1,
1.110977, 1.214398, 1.372037, 1, 1, 1, 1, 1,
1.112994, -0.4837186, 2.012094, 1, 1, 1, 1, 1,
1.117249, 2.077773, 0.2713793, 1, 1, 1, 1, 1,
1.12134, -0.664718, 0.9408649, 1, 1, 1, 1, 1,
1.127404, 0.316184, 0.9885694, 1, 1, 1, 1, 1,
1.127431, 0.3425249, 0.9576249, 1, 1, 1, 1, 1,
1.138558, 0.2103826, 1.364886, 1, 1, 1, 1, 1,
1.152962, 0.7384135, -0.8687935, 1, 1, 1, 1, 1,
1.1597, 0.9236481, 0.006590754, 1, 1, 1, 1, 1,
1.160812, -1.371977, 1.628246, 1, 1, 1, 1, 1,
1.163536, -0.3174549, 1.894353, 1, 1, 1, 1, 1,
1.169575, -0.9874929, 0.2818366, 1, 1, 1, 1, 1,
1.175497, 1.232798, 0.4006972, 1, 1, 1, 1, 1,
1.178092, -0.4186956, 3.098937, 1, 1, 1, 1, 1,
1.191996, -0.1874876, 1.596404, 1, 1, 1, 1, 1,
1.203082, -1.326501, 3.188551, 0, 0, 1, 1, 1,
1.204096, -0.9750229, 2.465538, 1, 0, 0, 1, 1,
1.206299, -0.07730258, 2.575263, 1, 0, 0, 1, 1,
1.220879, 0.6001098, 2.626857, 1, 0, 0, 1, 1,
1.222404, 0.937432, 1.490788, 1, 0, 0, 1, 1,
1.225237, -0.06692837, 1.994862, 1, 0, 0, 1, 1,
1.22571, 0.05327648, 2.96021, 0, 0, 0, 1, 1,
1.23147, 0.567322, 1.674444, 0, 0, 0, 1, 1,
1.240532, 0.9884398, 2.133127, 0, 0, 0, 1, 1,
1.248631, 1.723745, 0.9447411, 0, 0, 0, 1, 1,
1.249448, -1.381182, 2.709375, 0, 0, 0, 1, 1,
1.253178, 1.465586, -0.447972, 0, 0, 0, 1, 1,
1.255104, 0.07806946, 1.029956, 0, 0, 0, 1, 1,
1.258039, 0.3032582, -0.4514637, 1, 1, 1, 1, 1,
1.26053, 1.220899, 1.355811, 1, 1, 1, 1, 1,
1.264918, 0.2377724, 1.932449, 1, 1, 1, 1, 1,
1.28312, 1.182785, 0.3892419, 1, 1, 1, 1, 1,
1.301693, -0.3486046, 2.78957, 1, 1, 1, 1, 1,
1.313377, 0.1291747, 0.2762851, 1, 1, 1, 1, 1,
1.31543, 0.5928296, 1.84281, 1, 1, 1, 1, 1,
1.318209, 0.8611197, 0.4370573, 1, 1, 1, 1, 1,
1.322216, -1.334262, 1.939944, 1, 1, 1, 1, 1,
1.324587, 1.679219, 1.46232, 1, 1, 1, 1, 1,
1.327159, 1.271068, 1.845512, 1, 1, 1, 1, 1,
1.330787, -0.6430616, 1.620285, 1, 1, 1, 1, 1,
1.338094, -0.2920452, 1.708215, 1, 1, 1, 1, 1,
1.339762, -0.2520635, 1.599609, 1, 1, 1, 1, 1,
1.353808, 0.9893813, -0.3377332, 1, 1, 1, 1, 1,
1.362576, -0.9051073, 1.177838, 0, 0, 1, 1, 1,
1.364704, 0.7587553, 1.774384, 1, 0, 0, 1, 1,
1.366045, -1.162054, 1.82695, 1, 0, 0, 1, 1,
1.37403, -0.1064601, 2.250576, 1, 0, 0, 1, 1,
1.374581, 0.1254903, -0.4419724, 1, 0, 0, 1, 1,
1.376186, 1.661395, 1.190784, 1, 0, 0, 1, 1,
1.380145, -1.928923, 2.621122, 0, 0, 0, 1, 1,
1.386848, 1.586329, 0.549696, 0, 0, 0, 1, 1,
1.388657, 0.5636363, 2.747672, 0, 0, 0, 1, 1,
1.398811, 1.070292, 2.231315, 0, 0, 0, 1, 1,
1.399991, -1.830912, 0.9514399, 0, 0, 0, 1, 1,
1.406698, 0.4278447, 1.321427, 0, 0, 0, 1, 1,
1.406819, -0.8839628, 3.005883, 0, 0, 0, 1, 1,
1.436745, 1.188508, 1.214894, 1, 1, 1, 1, 1,
1.439695, -0.9035416, 1.545309, 1, 1, 1, 1, 1,
1.443097, 0.3195649, -0.05795065, 1, 1, 1, 1, 1,
1.453395, 0.3327604, 1.336483, 1, 1, 1, 1, 1,
1.45375, 0.09110353, -1.058941, 1, 1, 1, 1, 1,
1.459557, -0.5801263, -0.0618691, 1, 1, 1, 1, 1,
1.462458, -0.09089162, 1.239514, 1, 1, 1, 1, 1,
1.46514, -0.829827, 1.725925, 1, 1, 1, 1, 1,
1.478169, 1.340425, -0.2435403, 1, 1, 1, 1, 1,
1.486144, -0.08140912, 1.10809, 1, 1, 1, 1, 1,
1.486429, -0.5657021, 0.6271699, 1, 1, 1, 1, 1,
1.4874, 1.127894, 0.2360307, 1, 1, 1, 1, 1,
1.493919, 1.262933, -0.1961834, 1, 1, 1, 1, 1,
1.493991, 0.06294977, 1.785063, 1, 1, 1, 1, 1,
1.509866, -1.651164, 3.070727, 1, 1, 1, 1, 1,
1.511839, 0.04464107, 2.04049, 0, 0, 1, 1, 1,
1.511875, 0.4452141, 2.306992, 1, 0, 0, 1, 1,
1.515252, -0.09431006, 0.9689231, 1, 0, 0, 1, 1,
1.517911, 0.1920089, 0.1212808, 1, 0, 0, 1, 1,
1.519533, 0.1064419, 2.081246, 1, 0, 0, 1, 1,
1.521471, -1.162176, 1.286317, 1, 0, 0, 1, 1,
1.531953, -2.787162, 0.2451922, 0, 0, 0, 1, 1,
1.539989, -1.166594, 3.226454, 0, 0, 0, 1, 1,
1.568521, -0.3295906, 2.416028, 0, 0, 0, 1, 1,
1.572436, 0.153528, 0.09691355, 0, 0, 0, 1, 1,
1.57824, 1.173535, 0.4076784, 0, 0, 0, 1, 1,
1.58239, 0.09843119, 1.826915, 0, 0, 0, 1, 1,
1.595688, 0.4398249, 2.194952, 0, 0, 0, 1, 1,
1.596099, -0.8853104, 1.887396, 1, 1, 1, 1, 1,
1.599084, 0.2034469, 1.676081, 1, 1, 1, 1, 1,
1.606052, 0.2021747, 0.9575379, 1, 1, 1, 1, 1,
1.617622, 0.1598208, 1.650391, 1, 1, 1, 1, 1,
1.629563, 0.2219941, 0.1925757, 1, 1, 1, 1, 1,
1.63985, 1.473004, 1.421812, 1, 1, 1, 1, 1,
1.644783, -0.4605924, 1.804594, 1, 1, 1, 1, 1,
1.646124, -0.524972, 1.81251, 1, 1, 1, 1, 1,
1.648195, -0.3130175, 0.9518894, 1, 1, 1, 1, 1,
1.669239, 0.8546512, -0.1859503, 1, 1, 1, 1, 1,
1.673967, -0.3292672, 3.044162, 1, 1, 1, 1, 1,
1.684291, -1.284626, 3.012078, 1, 1, 1, 1, 1,
1.709775, -1.308217, 2.083421, 1, 1, 1, 1, 1,
1.71226, -0.2297468, 2.023674, 1, 1, 1, 1, 1,
1.714069, -0.3465739, 1.252433, 1, 1, 1, 1, 1,
1.750576, 1.140994, -0.9240862, 0, 0, 1, 1, 1,
1.76021, -0.9231402, 3.203616, 1, 0, 0, 1, 1,
1.772337, 0.458315, 0.5895517, 1, 0, 0, 1, 1,
1.77586, -1.787751, 2.013258, 1, 0, 0, 1, 1,
1.783295, 0.7166094, 0.3713687, 1, 0, 0, 1, 1,
1.797462, -0.0885369, -0.6799698, 1, 0, 0, 1, 1,
1.827696, 1.560584, 0.7734036, 0, 0, 0, 1, 1,
1.83499, -0.4571709, 0.06870766, 0, 0, 0, 1, 1,
1.849914, -0.5517052, 1.819716, 0, 0, 0, 1, 1,
1.85432, -0.3893118, 2.253283, 0, 0, 0, 1, 1,
1.887938, 0.4690477, 1.773099, 0, 0, 0, 1, 1,
1.926854, -1.140017, 2.194798, 0, 0, 0, 1, 1,
1.939307, -0.9103778, 2.299963, 0, 0, 0, 1, 1,
1.941088, 1.32334, 2.593513, 1, 1, 1, 1, 1,
1.941947, -0.364308, 0.8543403, 1, 1, 1, 1, 1,
1.953238, -1.163386, 1.877969, 1, 1, 1, 1, 1,
1.963931, -0.853728, 2.878924, 1, 1, 1, 1, 1,
1.975316, -0.4317865, 1.242843, 1, 1, 1, 1, 1,
1.998753, 0.8522114, 1.450645, 1, 1, 1, 1, 1,
2.000112, -0.201606, 2.094006, 1, 1, 1, 1, 1,
2.008797, -0.9660761, 1.11881, 1, 1, 1, 1, 1,
2.010196, -0.08031374, 1.346667, 1, 1, 1, 1, 1,
2.016849, -0.3578545, 3.405043, 1, 1, 1, 1, 1,
2.032277, 0.05744167, 0.8080806, 1, 1, 1, 1, 1,
2.055083, 0.3857124, 0.3934896, 1, 1, 1, 1, 1,
2.056287, -2.000135, 2.563246, 1, 1, 1, 1, 1,
2.065788, 0.6521352, 0.7132612, 1, 1, 1, 1, 1,
2.077693, -0.7013764, 1.734004, 1, 1, 1, 1, 1,
2.080567, -0.3095192, 1.878705, 0, 0, 1, 1, 1,
2.110757, 1.246129, 1.832474, 1, 0, 0, 1, 1,
2.174885, 0.1101657, 0.8324184, 1, 0, 0, 1, 1,
2.233741, -1.068515, 2.340012, 1, 0, 0, 1, 1,
2.235438, 0.05815579, 1.341083, 1, 0, 0, 1, 1,
2.265341, -0.2750273, 1.439252, 1, 0, 0, 1, 1,
2.290418, -1.34836, 2.444725, 0, 0, 0, 1, 1,
2.313654, 1.85737, 1.610072, 0, 0, 0, 1, 1,
2.325072, 0.7379388, 1.167252, 0, 0, 0, 1, 1,
2.386973, -1.036313, 1.62249, 0, 0, 0, 1, 1,
2.389712, -0.04104411, 0.5172165, 0, 0, 0, 1, 1,
2.391734, 3.14743, 1.951722, 0, 0, 0, 1, 1,
2.414192, -0.1211438, 1.954718, 0, 0, 0, 1, 1,
2.453308, 0.06029417, 2.99047, 1, 1, 1, 1, 1,
2.569366, 1.03445, 1.912574, 1, 1, 1, 1, 1,
2.590491, 1.567277, 1.467195, 1, 1, 1, 1, 1,
2.770476, 0.003839621, 2.492629, 1, 1, 1, 1, 1,
2.814524, -0.3154918, 1.650931, 1, 1, 1, 1, 1,
2.853604, -0.4705936, -0.6853186, 1, 1, 1, 1, 1,
3.414542, 0.5566204, 0.5512728, 1, 1, 1, 1, 1
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
var radius = 9.986705;
var distance = 35.07788;
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
mvMatrix.translate( -0.09815478, 0.126163, 0.2652881 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.07788);
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
