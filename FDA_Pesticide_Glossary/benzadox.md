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
-2.794165, 0.3331475, -1.74859, 1, 0, 0, 1,
-2.513794, 0.4167731, -1.176052, 1, 0.007843138, 0, 1,
-2.380936, 1.529996, -2.655563, 1, 0.01176471, 0, 1,
-2.37888, 0.0258101, -1.247167, 1, 0.01960784, 0, 1,
-2.33867, 0.2222507, -0.05113447, 1, 0.02352941, 0, 1,
-2.317073, -0.2471953, -1.604601, 1, 0.03137255, 0, 1,
-2.295703, 0.2081527, -2.64643, 1, 0.03529412, 0, 1,
-2.243938, 0.1764556, -2.970296, 1, 0.04313726, 0, 1,
-2.224537, 0.946035, -3.162129, 1, 0.04705882, 0, 1,
-2.219061, 1.196241, -0.5031386, 1, 0.05490196, 0, 1,
-2.201772, -0.9887711, -1.199857, 1, 0.05882353, 0, 1,
-2.19392, 0.2885373, -0.1361148, 1, 0.06666667, 0, 1,
-2.191834, 0.2824536, -0.7711888, 1, 0.07058824, 0, 1,
-2.190481, 1.261389, -1.535528, 1, 0.07843138, 0, 1,
-2.183752, -0.4010531, -3.047604, 1, 0.08235294, 0, 1,
-2.163502, 0.1908469, -0.7797961, 1, 0.09019608, 0, 1,
-2.133388, 0.1888967, -2.366135, 1, 0.09411765, 0, 1,
-2.126179, 0.11931, -2.01456, 1, 0.1019608, 0, 1,
-2.11362, 0.4047916, -1.64364, 1, 0.1098039, 0, 1,
-2.109251, -1.403665, -1.008928, 1, 0.1137255, 0, 1,
-2.097403, 1.313048, -1.416341, 1, 0.1215686, 0, 1,
-2.055794, -0.5828627, 1.033428, 1, 0.1254902, 0, 1,
-2.051515, 0.2137217, -1.555648, 1, 0.1333333, 0, 1,
-2.042477, 1.221415, -1.638669, 1, 0.1372549, 0, 1,
-2.026248, 0.8877723, 0.7460783, 1, 0.145098, 0, 1,
-2.000539, -0.4772088, -3.218189, 1, 0.1490196, 0, 1,
-1.973963, 0.6923511, -1.679558, 1, 0.1568628, 0, 1,
-1.969475, 1.238424, -1.21577, 1, 0.1607843, 0, 1,
-1.951368, 0.8531718, -1.858883, 1, 0.1686275, 0, 1,
-1.925849, -0.5950752, -2.781117, 1, 0.172549, 0, 1,
-1.919977, 1.853059, -1.092332, 1, 0.1803922, 0, 1,
-1.900485, 0.5963732, -1.699763, 1, 0.1843137, 0, 1,
-1.891859, 0.8828745, -0.7463523, 1, 0.1921569, 0, 1,
-1.881222, 0.4185169, -0.9775999, 1, 0.1960784, 0, 1,
-1.866093, 0.8104424, -0.9786158, 1, 0.2039216, 0, 1,
-1.862844, 1.327918, -3.086265, 1, 0.2117647, 0, 1,
-1.860775, 0.8070025, -1.778625, 1, 0.2156863, 0, 1,
-1.831572, 0.2784939, -2.903818, 1, 0.2235294, 0, 1,
-1.831217, -2.419385, -2.718838, 1, 0.227451, 0, 1,
-1.827822, -0.4117475, -2.694842, 1, 0.2352941, 0, 1,
-1.821104, 0.2396253, -0.9411892, 1, 0.2392157, 0, 1,
-1.796598, 0.2388815, -0.04090272, 1, 0.2470588, 0, 1,
-1.790713, -0.5390781, 0.3607165, 1, 0.2509804, 0, 1,
-1.778419, 0.07626454, -1.223648, 1, 0.2588235, 0, 1,
-1.776894, -0.8677039, -2.949868, 1, 0.2627451, 0, 1,
-1.773805, -0.858137, -0.8041915, 1, 0.2705882, 0, 1,
-1.732352, 0.9172205, -2.397936, 1, 0.2745098, 0, 1,
-1.705329, -1.254418, -2.472628, 1, 0.282353, 0, 1,
-1.676485, -0.2048471, -1.144572, 1, 0.2862745, 0, 1,
-1.670225, -0.9079132, -1.703657, 1, 0.2941177, 0, 1,
-1.664607, 0.1291638, 0.03792046, 1, 0.3019608, 0, 1,
-1.664589, 0.6478059, 0.1110601, 1, 0.3058824, 0, 1,
-1.659275, -1.366803, -2.791657, 1, 0.3137255, 0, 1,
-1.650977, 0.3616988, -1.197491, 1, 0.3176471, 0, 1,
-1.646151, 0.783762, -2.83707, 1, 0.3254902, 0, 1,
-1.640182, -0.05493877, -0.7730005, 1, 0.3294118, 0, 1,
-1.63639, 0.2936994, -0.6519404, 1, 0.3372549, 0, 1,
-1.625567, 1.246713, -0.3860371, 1, 0.3411765, 0, 1,
-1.625318, 0.1451939, -1.135773, 1, 0.3490196, 0, 1,
-1.613722, 1.038191, -0.03281272, 1, 0.3529412, 0, 1,
-1.601519, -1.265289, -0.9195804, 1, 0.3607843, 0, 1,
-1.601266, -0.4277182, -1.496181, 1, 0.3647059, 0, 1,
-1.601023, 2.50594, -1.854257, 1, 0.372549, 0, 1,
-1.594485, -1.519037, -2.454403, 1, 0.3764706, 0, 1,
-1.58327, 1.383661, -0.09888037, 1, 0.3843137, 0, 1,
-1.567207, 1.26067, -0.35102, 1, 0.3882353, 0, 1,
-1.559302, -0.2575874, -1.690438, 1, 0.3960784, 0, 1,
-1.551004, 1.316278, -1.428179, 1, 0.4039216, 0, 1,
-1.549071, 0.3237469, 0.09571245, 1, 0.4078431, 0, 1,
-1.53326, 1.621041, -1.01261, 1, 0.4156863, 0, 1,
-1.522887, -1.022425, -1.345473, 1, 0.4196078, 0, 1,
-1.519278, -0.6530641, -1.343497, 1, 0.427451, 0, 1,
-1.519095, 1.365334, -0.1358013, 1, 0.4313726, 0, 1,
-1.502433, -1.651202, -1.564992, 1, 0.4392157, 0, 1,
-1.500763, -0.3797574, -2.521484, 1, 0.4431373, 0, 1,
-1.498095, -0.9619132, -2.988263, 1, 0.4509804, 0, 1,
-1.488694, -1.779948, -1.31877, 1, 0.454902, 0, 1,
-1.473061, -1.996409, -4.378608, 1, 0.4627451, 0, 1,
-1.460213, -0.9548287, -2.669885, 1, 0.4666667, 0, 1,
-1.450486, -0.07533545, -1.29609, 1, 0.4745098, 0, 1,
-1.449213, 1.106037, -2.253457, 1, 0.4784314, 0, 1,
-1.439392, 1.031425, 0.3052582, 1, 0.4862745, 0, 1,
-1.433895, 0.07742045, -1.289598, 1, 0.4901961, 0, 1,
-1.426059, -0.3537482, -1.70627, 1, 0.4980392, 0, 1,
-1.422573, 0.1547392, -4.285509, 1, 0.5058824, 0, 1,
-1.418237, 1.190584, -0.6354982, 1, 0.509804, 0, 1,
-1.417927, -1.727535, -0.2245673, 1, 0.5176471, 0, 1,
-1.416147, 1.251206, 0.2946709, 1, 0.5215687, 0, 1,
-1.411325, -0.5916867, -1.284794, 1, 0.5294118, 0, 1,
-1.408895, 0.3989683, -1.50199, 1, 0.5333334, 0, 1,
-1.404987, -0.8166711, -2.728286, 1, 0.5411765, 0, 1,
-1.398744, 0.7429034, -0.2210291, 1, 0.5450981, 0, 1,
-1.39041, -0.6371932, -2.176416, 1, 0.5529412, 0, 1,
-1.388827, 0.3130929, -0.4703299, 1, 0.5568628, 0, 1,
-1.384292, 0.7684452, -0.4807581, 1, 0.5647059, 0, 1,
-1.361624, -1.488675, -1.808399, 1, 0.5686275, 0, 1,
-1.360983, -0.6636037, 0.05628783, 1, 0.5764706, 0, 1,
-1.359016, 0.5345331, -0.9662113, 1, 0.5803922, 0, 1,
-1.35781, -0.6643345, -0.2079221, 1, 0.5882353, 0, 1,
-1.354125, -0.1878719, -1.429495, 1, 0.5921569, 0, 1,
-1.350847, -0.8440979, -3.240228, 1, 0.6, 0, 1,
-1.34939, 0.3439938, -2.335011, 1, 0.6078432, 0, 1,
-1.345003, 0.8315938, -0.4594745, 1, 0.6117647, 0, 1,
-1.339739, -1.049853, -4.063497, 1, 0.6196079, 0, 1,
-1.337456, 1.789328, -1.170573, 1, 0.6235294, 0, 1,
-1.330332, -0.4311866, -3.255537, 1, 0.6313726, 0, 1,
-1.329367, -0.9012938, -1.866221, 1, 0.6352941, 0, 1,
-1.325549, -0.6049774, -2.591438, 1, 0.6431373, 0, 1,
-1.324096, -2.372912, -2.723216, 1, 0.6470588, 0, 1,
-1.321641, -1.338896, -4.398256, 1, 0.654902, 0, 1,
-1.320157, -0.5197325, -1.701576, 1, 0.6588235, 0, 1,
-1.303944, -0.2677949, -2.398243, 1, 0.6666667, 0, 1,
-1.289243, 1.108439, -1.870012, 1, 0.6705883, 0, 1,
-1.281341, 2.013261, -1.422713, 1, 0.6784314, 0, 1,
-1.277677, 0.5289787, -2.39827, 1, 0.682353, 0, 1,
-1.271077, -0.2577078, -0.7271546, 1, 0.6901961, 0, 1,
-1.268864, -1.911756, -3.781257, 1, 0.6941177, 0, 1,
-1.264124, -0.6297238, -2.895916, 1, 0.7019608, 0, 1,
-1.262436, -0.5517428, -2.598538, 1, 0.7098039, 0, 1,
-1.260945, -0.1800603, -1.540051, 1, 0.7137255, 0, 1,
-1.260236, 1.664643, -0.2770083, 1, 0.7215686, 0, 1,
-1.241991, 1.034006, 0.9811507, 1, 0.7254902, 0, 1,
-1.236975, -0.5686753, -1.616397, 1, 0.7333333, 0, 1,
-1.234637, -0.2524776, 0.02673283, 1, 0.7372549, 0, 1,
-1.232978, -2.483634, -2.427951, 1, 0.7450981, 0, 1,
-1.227357, 1.582385, 0.9328744, 1, 0.7490196, 0, 1,
-1.212026, -1.074188, -1.340846, 1, 0.7568628, 0, 1,
-1.203239, 0.3778382, -1.493106, 1, 0.7607843, 0, 1,
-1.194776, 0.3841832, -0.9403796, 1, 0.7686275, 0, 1,
-1.191324, -0.9265221, -2.827521, 1, 0.772549, 0, 1,
-1.191086, 1.037612, -1.075648, 1, 0.7803922, 0, 1,
-1.182751, 0.4947866, -1.134601, 1, 0.7843137, 0, 1,
-1.181774, 1.099565, -1.479469, 1, 0.7921569, 0, 1,
-1.179798, 0.2801924, -0.3675606, 1, 0.7960784, 0, 1,
-1.174897, -0.009445414, -2.707479, 1, 0.8039216, 0, 1,
-1.174059, -0.3252933, -1.841859, 1, 0.8117647, 0, 1,
-1.174029, 0.1226922, 0.1049654, 1, 0.8156863, 0, 1,
-1.171458, -0.9017645, -3.96624, 1, 0.8235294, 0, 1,
-1.163924, 0.0414065, -2.829658, 1, 0.827451, 0, 1,
-1.15723, 1.898481, -1.908444, 1, 0.8352941, 0, 1,
-1.156769, -1.330857, -3.83747, 1, 0.8392157, 0, 1,
-1.156615, -0.2931092, -2.292205, 1, 0.8470588, 0, 1,
-1.148838, 0.7448472, -0.3070028, 1, 0.8509804, 0, 1,
-1.146648, -0.9754658, -2.339232, 1, 0.8588235, 0, 1,
-1.14306, 0.2977693, -2.068992, 1, 0.8627451, 0, 1,
-1.139112, -0.8127075, -2.339009, 1, 0.8705882, 0, 1,
-1.133439, -0.02626102, -1.659496, 1, 0.8745098, 0, 1,
-1.130736, 0.3254396, -2.037561, 1, 0.8823529, 0, 1,
-1.129689, 0.2761836, -2.215673, 1, 0.8862745, 0, 1,
-1.125284, -0.8201244, -2.956104, 1, 0.8941177, 0, 1,
-1.12374, 0.05017596, -2.396907, 1, 0.8980392, 0, 1,
-1.108369, 0.8161178, -0.930786, 1, 0.9058824, 0, 1,
-1.106454, -0.1351293, -1.472333, 1, 0.9137255, 0, 1,
-1.105566, 1.836588, 0.1533497, 1, 0.9176471, 0, 1,
-1.103584, 1.077452, -0.1596176, 1, 0.9254902, 0, 1,
-1.101576, 0.4489841, -0.950814, 1, 0.9294118, 0, 1,
-1.094802, -1.457171, -3.881536, 1, 0.9372549, 0, 1,
-1.091651, -0.7175208, -2.509283, 1, 0.9411765, 0, 1,
-1.088061, -0.3874151, -2.12809, 1, 0.9490196, 0, 1,
-1.084396, -0.8827768, -3.587559, 1, 0.9529412, 0, 1,
-1.076693, 1.232248, 0.9387737, 1, 0.9607843, 0, 1,
-1.066029, 0.2553999, -0.4011479, 1, 0.9647059, 0, 1,
-1.061325, 0.5044339, -0.7643588, 1, 0.972549, 0, 1,
-1.05437, -0.407663, -2.820896, 1, 0.9764706, 0, 1,
-1.041522, -0.4141049, -1.609161, 1, 0.9843137, 0, 1,
-1.023135, -1.286418, -2.154557, 1, 0.9882353, 0, 1,
-1.013501, 0.7056297, -1.993297, 1, 0.9960784, 0, 1,
-1.007212, -0.3719501, -2.522182, 0.9960784, 1, 0, 1,
-1.005225, -0.2831421, -2.36639, 0.9921569, 1, 0, 1,
-0.996621, -2.273618, -4.909087, 0.9843137, 1, 0, 1,
-0.9955971, 0.3067487, 0.5860572, 0.9803922, 1, 0, 1,
-0.9954054, -0.294881, -1.520251, 0.972549, 1, 0, 1,
-0.9943499, 1.310063, -0.55549, 0.9686275, 1, 0, 1,
-0.9804462, -1.634162, -2.405025, 0.9607843, 1, 0, 1,
-0.9763463, -2.274052, -3.096777, 0.9568627, 1, 0, 1,
-0.9731935, -1.122054, -3.59896, 0.9490196, 1, 0, 1,
-0.972536, 0.4200416, 0.07580913, 0.945098, 1, 0, 1,
-0.9687753, 0.3987138, -1.060812, 0.9372549, 1, 0, 1,
-0.9646926, -1.041301, -2.014159, 0.9333333, 1, 0, 1,
-0.9608108, 0.3773319, -0.775507, 0.9254902, 1, 0, 1,
-0.9582931, 0.6716158, 0.459783, 0.9215686, 1, 0, 1,
-0.9547114, -1.036781, -2.868373, 0.9137255, 1, 0, 1,
-0.9504398, -1.263307, -2.496136, 0.9098039, 1, 0, 1,
-0.9471986, 1.252283, -0.1317166, 0.9019608, 1, 0, 1,
-0.9454499, -0.925014, 0.007249366, 0.8941177, 1, 0, 1,
-0.9377007, -0.4114637, -1.871126, 0.8901961, 1, 0, 1,
-0.930461, -1.888775, -2.479108, 0.8823529, 1, 0, 1,
-0.9226126, 0.2021322, 0.7489256, 0.8784314, 1, 0, 1,
-0.9163716, -1.566603, -4.417778, 0.8705882, 1, 0, 1,
-0.9140228, -2.335765, -3.039125, 0.8666667, 1, 0, 1,
-0.9108095, 0.8245025, 1.177978, 0.8588235, 1, 0, 1,
-0.8978841, -0.2134356, -1.12602, 0.854902, 1, 0, 1,
-0.8973841, -0.4033627, -1.254418, 0.8470588, 1, 0, 1,
-0.8966739, -0.3901753, -0.8283003, 0.8431373, 1, 0, 1,
-0.8955, -2.016382, -2.487883, 0.8352941, 1, 0, 1,
-0.8856865, -0.6926633, -2.514076, 0.8313726, 1, 0, 1,
-0.8847836, -1.403327, -3.918662, 0.8235294, 1, 0, 1,
-0.8816735, -0.3638071, -2.518397, 0.8196079, 1, 0, 1,
-0.8770071, -0.6159757, -3.031651, 0.8117647, 1, 0, 1,
-0.8718414, -0.3829615, -0.8730369, 0.8078431, 1, 0, 1,
-0.8672925, 1.546392, -0.52756, 0.8, 1, 0, 1,
-0.8647808, 0.02382496, -1.306682, 0.7921569, 1, 0, 1,
-0.863668, -0.6548182, -2.384601, 0.7882353, 1, 0, 1,
-0.8620353, -1.204096, -2.034161, 0.7803922, 1, 0, 1,
-0.8573868, 1.56671, -0.05166841, 0.7764706, 1, 0, 1,
-0.8567774, 0.7211626, -1.684318, 0.7686275, 1, 0, 1,
-0.8469324, 0.08593304, -2.404235, 0.7647059, 1, 0, 1,
-0.8458, -0.8929745, -4.779157, 0.7568628, 1, 0, 1,
-0.8407079, 0.1191865, -4.142498, 0.7529412, 1, 0, 1,
-0.8394006, -0.4906586, -0.5660437, 0.7450981, 1, 0, 1,
-0.8324766, -0.01847254, -2.482252, 0.7411765, 1, 0, 1,
-0.8264253, -0.06832314, -1.695278, 0.7333333, 1, 0, 1,
-0.8235372, 0.5506839, 0.8016068, 0.7294118, 1, 0, 1,
-0.8177264, -0.3804942, -2.319318, 0.7215686, 1, 0, 1,
-0.8150194, 0.9649529, -0.668256, 0.7176471, 1, 0, 1,
-0.8068564, -0.03850393, -2.050603, 0.7098039, 1, 0, 1,
-0.8012417, 0.1681544, -2.546719, 0.7058824, 1, 0, 1,
-0.7990248, 0.3420595, -2.192429, 0.6980392, 1, 0, 1,
-0.793811, 0.1557655, -0.6903495, 0.6901961, 1, 0, 1,
-0.7926545, 0.1257043, -2.736497, 0.6862745, 1, 0, 1,
-0.7833475, -0.8670747, -2.066348, 0.6784314, 1, 0, 1,
-0.7816914, 0.2980466, -1.116024, 0.6745098, 1, 0, 1,
-0.7809858, 1.074432, -0.2837001, 0.6666667, 1, 0, 1,
-0.7809356, 0.6545452, -1.603307, 0.6627451, 1, 0, 1,
-0.7707734, 0.04544025, -2.204624, 0.654902, 1, 0, 1,
-0.7628651, -0.5541514, -1.988364, 0.6509804, 1, 0, 1,
-0.7578137, 0.896697, -1.710465, 0.6431373, 1, 0, 1,
-0.7558601, -0.04628469, -1.781155, 0.6392157, 1, 0, 1,
-0.75528, -0.5285279, -3.576723, 0.6313726, 1, 0, 1,
-0.7478201, -1.155076, -1.797807, 0.627451, 1, 0, 1,
-0.7476607, -1.421613, -2.929309, 0.6196079, 1, 0, 1,
-0.7466108, 0.1769611, -2.091226, 0.6156863, 1, 0, 1,
-0.7427769, -0.7379048, -1.143515, 0.6078432, 1, 0, 1,
-0.7426922, 0.4517499, -1.721753, 0.6039216, 1, 0, 1,
-0.7419206, -0.5072545, -2.760528, 0.5960785, 1, 0, 1,
-0.7411096, -0.1907924, -2.873934, 0.5882353, 1, 0, 1,
-0.7410374, 1.040182, -0.2415678, 0.5843138, 1, 0, 1,
-0.7366861, 0.2250587, -0.05213892, 0.5764706, 1, 0, 1,
-0.7354347, -0.9445401, -1.862866, 0.572549, 1, 0, 1,
-0.7344455, -0.9173717, -2.395835, 0.5647059, 1, 0, 1,
-0.7340608, -0.4555856, -3.188784, 0.5607843, 1, 0, 1,
-0.7308218, -0.1003304, -2.598019, 0.5529412, 1, 0, 1,
-0.725615, 1.466486, 0.3179325, 0.5490196, 1, 0, 1,
-0.7227675, -0.6062005, -1.880152, 0.5411765, 1, 0, 1,
-0.7200643, -1.649339, -3.811356, 0.5372549, 1, 0, 1,
-0.7114837, -0.4707561, -1.566404, 0.5294118, 1, 0, 1,
-0.7101198, 1.527365, 0.6373912, 0.5254902, 1, 0, 1,
-0.7082127, -1.443809, -2.973169, 0.5176471, 1, 0, 1,
-0.7077374, 2.655222, 1.341447, 0.5137255, 1, 0, 1,
-0.7046402, 1.032827, -0.7391233, 0.5058824, 1, 0, 1,
-0.7021781, -0.4766093, -1.775429, 0.5019608, 1, 0, 1,
-0.702105, 0.7897636, 0.1842191, 0.4941176, 1, 0, 1,
-0.696147, 0.3754402, -0.3808467, 0.4862745, 1, 0, 1,
-0.6919775, 1.538366, 1.741045, 0.4823529, 1, 0, 1,
-0.6887168, -0.956568, -1.459425, 0.4745098, 1, 0, 1,
-0.6864599, -0.3418356, -2.554877, 0.4705882, 1, 0, 1,
-0.6862894, 0.6658903, 0.6323152, 0.4627451, 1, 0, 1,
-0.680631, 0.01484911, -1.683932, 0.4588235, 1, 0, 1,
-0.6707561, -0.4448803, -3.368032, 0.4509804, 1, 0, 1,
-0.6650549, -1.347032, -3.08755, 0.4470588, 1, 0, 1,
-0.6642925, -2.091379, -2.698622, 0.4392157, 1, 0, 1,
-0.662654, 0.9714794, 1.361284, 0.4352941, 1, 0, 1,
-0.660355, 0.7799203, 0.9193198, 0.427451, 1, 0, 1,
-0.6602352, 0.1623207, 0.7183155, 0.4235294, 1, 0, 1,
-0.6596758, 1.12075, 0.6607215, 0.4156863, 1, 0, 1,
-0.6567829, 0.8729703, -0.02539398, 0.4117647, 1, 0, 1,
-0.653986, 0.1986099, -1.285838, 0.4039216, 1, 0, 1,
-0.648155, 1.273044, -0.5224578, 0.3960784, 1, 0, 1,
-0.6465586, -1.057103, -3.532812, 0.3921569, 1, 0, 1,
-0.6441148, -0.8330765, -1.491591, 0.3843137, 1, 0, 1,
-0.637145, 0.7242648, -1.606364, 0.3803922, 1, 0, 1,
-0.6315922, 0.5584441, 0.5425718, 0.372549, 1, 0, 1,
-0.6277607, 0.1684158, -1.829135, 0.3686275, 1, 0, 1,
-0.6195759, -0.9329355, -3.293789, 0.3607843, 1, 0, 1,
-0.6121793, -1.033107, -2.790684, 0.3568628, 1, 0, 1,
-0.610839, 0.3336147, -0.9798637, 0.3490196, 1, 0, 1,
-0.6108308, -1.469358, -3.639435, 0.345098, 1, 0, 1,
-0.6079524, -0.9561265, -2.515242, 0.3372549, 1, 0, 1,
-0.6060684, -0.4559548, -3.097079, 0.3333333, 1, 0, 1,
-0.6056643, -0.7130107, -2.818337, 0.3254902, 1, 0, 1,
-0.6037254, -1.308587, -2.738151, 0.3215686, 1, 0, 1,
-0.6024176, 1.879474, 0.5594629, 0.3137255, 1, 0, 1,
-0.6019538, 1.510957, 0.3569935, 0.3098039, 1, 0, 1,
-0.5965111, -1.221377, -3.734572, 0.3019608, 1, 0, 1,
-0.5963047, -0.2803717, -2.824518, 0.2941177, 1, 0, 1,
-0.5937633, -0.3737577, -1.942909, 0.2901961, 1, 0, 1,
-0.5908099, -0.9461909, -1.818986, 0.282353, 1, 0, 1,
-0.5845159, -0.7102228, -3.283134, 0.2784314, 1, 0, 1,
-0.5838395, -0.4733321, -4.362196, 0.2705882, 1, 0, 1,
-0.5834994, 0.2617981, -1.316872, 0.2666667, 1, 0, 1,
-0.5748519, 0.7258282, -1.588667, 0.2588235, 1, 0, 1,
-0.5744318, -1.144307, -2.94647, 0.254902, 1, 0, 1,
-0.5735513, -1.023615, -0.6582417, 0.2470588, 1, 0, 1,
-0.5713743, -0.3360196, -1.927988, 0.2431373, 1, 0, 1,
-0.5706008, 1.253585, -1.199501, 0.2352941, 1, 0, 1,
-0.5593308, -0.2009265, -0.7679921, 0.2313726, 1, 0, 1,
-0.5586524, 1.135913, 0.7372336, 0.2235294, 1, 0, 1,
-0.5572129, 0.5283636, -1.311432, 0.2196078, 1, 0, 1,
-0.5563463, 0.00737307, -2.791236, 0.2117647, 1, 0, 1,
-0.5527391, 0.4280379, 0.1825027, 0.2078431, 1, 0, 1,
-0.5457664, 0.2667928, -1.989549, 0.2, 1, 0, 1,
-0.5423435, 1.298671, 0.8201813, 0.1921569, 1, 0, 1,
-0.5395432, 0.6042415, 0.364969, 0.1882353, 1, 0, 1,
-0.5320442, 0.2026096, -0.003168164, 0.1803922, 1, 0, 1,
-0.5309196, 1.268829, -0.6347702, 0.1764706, 1, 0, 1,
-0.5282785, 0.1682862, -1.457607, 0.1686275, 1, 0, 1,
-0.5265241, 0.05525426, -1.375507, 0.1647059, 1, 0, 1,
-0.5257655, 0.2501816, -1.537681, 0.1568628, 1, 0, 1,
-0.5227635, -0.7354321, -2.016862, 0.1529412, 1, 0, 1,
-0.5214373, 0.7751358, 0.09737488, 0.145098, 1, 0, 1,
-0.5194238, -1.337738, -3.296425, 0.1411765, 1, 0, 1,
-0.5169066, -0.9127042, -2.96205, 0.1333333, 1, 0, 1,
-0.5126046, -0.7143949, -2.220033, 0.1294118, 1, 0, 1,
-0.5113348, -1.147003, -2.612377, 0.1215686, 1, 0, 1,
-0.5083253, 0.3583508, -0.9815849, 0.1176471, 1, 0, 1,
-0.5077347, -0.6887505, -1.525163, 0.1098039, 1, 0, 1,
-0.50698, -0.9209107, -1.396935, 0.1058824, 1, 0, 1,
-0.5054862, 0.3745541, -0.5608974, 0.09803922, 1, 0, 1,
-0.5051955, -1.673663, -1.431652, 0.09019608, 1, 0, 1,
-0.4981143, -2.291616, -3.793791, 0.08627451, 1, 0, 1,
-0.4952548, -0.07533942, -0.6203447, 0.07843138, 1, 0, 1,
-0.4952454, -0.3691848, -2.399079, 0.07450981, 1, 0, 1,
-0.4915233, -0.2742782, -1.587047, 0.06666667, 1, 0, 1,
-0.491246, 0.03991844, -3.244564, 0.0627451, 1, 0, 1,
-0.4890453, -1.544182, -2.105473, 0.05490196, 1, 0, 1,
-0.4804603, -0.7913177, -0.6017, 0.05098039, 1, 0, 1,
-0.4711066, 0.4090346, -0.4316587, 0.04313726, 1, 0, 1,
-0.4660462, -0.1373592, -2.21449, 0.03921569, 1, 0, 1,
-0.4596855, -0.7284918, -3.635838, 0.03137255, 1, 0, 1,
-0.4596772, 1.391572, -0.3395441, 0.02745098, 1, 0, 1,
-0.4573867, -1.264741, -2.521856, 0.01960784, 1, 0, 1,
-0.4554299, 0.000533532, -2.135619, 0.01568628, 1, 0, 1,
-0.452762, 0.005327321, 0.05193764, 0.007843138, 1, 0, 1,
-0.4523509, -1.181287, -4.119194, 0.003921569, 1, 0, 1,
-0.4497936, 0.62928, 0.4542612, 0, 1, 0.003921569, 1,
-0.4492794, 1.171432, -0.3056259, 0, 1, 0.01176471, 1,
-0.4459046, -0.447884, 0.1031, 0, 1, 0.01568628, 1,
-0.4384623, -0.7208079, -2.538999, 0, 1, 0.02352941, 1,
-0.4364525, 0.4506967, -1.282895, 0, 1, 0.02745098, 1,
-0.4335147, -1.90076, -2.929048, 0, 1, 0.03529412, 1,
-0.4318672, -0.7061607, -3.604465, 0, 1, 0.03921569, 1,
-0.4297895, 0.9659034, -0.8047981, 0, 1, 0.04705882, 1,
-0.4258984, 1.547281, -1.337174, 0, 1, 0.05098039, 1,
-0.4255699, 0.8456028, 0.3092237, 0, 1, 0.05882353, 1,
-0.4196229, -0.503502, -1.098235, 0, 1, 0.0627451, 1,
-0.4159694, -0.9714923, -2.659695, 0, 1, 0.07058824, 1,
-0.4159689, 1.086109, -0.7209915, 0, 1, 0.07450981, 1,
-0.410777, -1.582803, -2.44807, 0, 1, 0.08235294, 1,
-0.4094614, -1.123865, -3.61067, 0, 1, 0.08627451, 1,
-0.4078363, -0.9650549, -2.727608, 0, 1, 0.09411765, 1,
-0.3983971, -0.2414516, -0.6731184, 0, 1, 0.1019608, 1,
-0.3973664, -0.3128817, -1.823544, 0, 1, 0.1058824, 1,
-0.3917558, -1.071699, -2.685136, 0, 1, 0.1137255, 1,
-0.3904727, 0.1243886, -0.8320671, 0, 1, 0.1176471, 1,
-0.3857169, 1.040717, -0.9755943, 0, 1, 0.1254902, 1,
-0.3803469, -2.276235, -4.382467, 0, 1, 0.1294118, 1,
-0.3789667, 0.7696866, -0.07370044, 0, 1, 0.1372549, 1,
-0.3786749, -0.1073978, -1.78983, 0, 1, 0.1411765, 1,
-0.3762276, -0.553723, -2.211211, 0, 1, 0.1490196, 1,
-0.3719408, 0.7632878, -1.284428, 0, 1, 0.1529412, 1,
-0.3654548, -0.7024366, -3.42135, 0, 1, 0.1607843, 1,
-0.3627425, -0.9445941, -2.728047, 0, 1, 0.1647059, 1,
-0.3606379, 0.03789425, -1.712625, 0, 1, 0.172549, 1,
-0.3570808, -0.4655071, -2.448315, 0, 1, 0.1764706, 1,
-0.3568066, 0.1059289, -1.375678, 0, 1, 0.1843137, 1,
-0.3556536, 0.03302221, -1.366371, 0, 1, 0.1882353, 1,
-0.3479106, 0.9111153, 2.545748, 0, 1, 0.1960784, 1,
-0.3426416, -0.1751343, -1.55629, 0, 1, 0.2039216, 1,
-0.3407132, -0.7898796, -3.457236, 0, 1, 0.2078431, 1,
-0.3386657, 0.1144462, -1.030845, 0, 1, 0.2156863, 1,
-0.3318951, -0.1210093, -1.939184, 0, 1, 0.2196078, 1,
-0.3306294, -1.314364, -2.296135, 0, 1, 0.227451, 1,
-0.3278262, -0.01084028, -2.012029, 0, 1, 0.2313726, 1,
-0.3270191, -1.497142, -4.295522, 0, 1, 0.2392157, 1,
-0.3246887, 0.4855299, 0.8641216, 0, 1, 0.2431373, 1,
-0.3210302, 3.18038, -0.8429996, 0, 1, 0.2509804, 1,
-0.3176669, -0.1876375, -1.566309, 0, 1, 0.254902, 1,
-0.3176379, -1.332617, -2.528205, 0, 1, 0.2627451, 1,
-0.3150208, -0.1505289, -1.812708, 0, 1, 0.2666667, 1,
-0.3125267, -0.1168541, -1.316072, 0, 1, 0.2745098, 1,
-0.3080459, 1.150922, -3.038298, 0, 1, 0.2784314, 1,
-0.3070517, -1.110273, -2.426529, 0, 1, 0.2862745, 1,
-0.3052239, 0.3149597, -1.009519, 0, 1, 0.2901961, 1,
-0.3037892, 2.388343, -0.6371999, 0, 1, 0.2980392, 1,
-0.3014675, -0.09525097, -3.2291, 0, 1, 0.3058824, 1,
-0.3009312, 0.1692968, 0.9486843, 0, 1, 0.3098039, 1,
-0.2994164, -0.613152, -4.361211, 0, 1, 0.3176471, 1,
-0.2982629, -0.4611373, -4.217429, 0, 1, 0.3215686, 1,
-0.2978841, -1.208694, -2.235757, 0, 1, 0.3294118, 1,
-0.2974569, -1.379191, -2.319774, 0, 1, 0.3333333, 1,
-0.2962873, 1.637841, 0.725917, 0, 1, 0.3411765, 1,
-0.2947071, -2.34489, -4.009884, 0, 1, 0.345098, 1,
-0.2936546, 1.582739, -1.046628, 0, 1, 0.3529412, 1,
-0.2929204, 0.04705544, -1.219232, 0, 1, 0.3568628, 1,
-0.2920513, 1.028581, 1.440374, 0, 1, 0.3647059, 1,
-0.2812818, -0.08252463, -2.262084, 0, 1, 0.3686275, 1,
-0.2783259, -1.322874, -2.595669, 0, 1, 0.3764706, 1,
-0.2745974, 1.539905, -1.108034, 0, 1, 0.3803922, 1,
-0.2738006, -1.617022, -2.623153, 0, 1, 0.3882353, 1,
-0.2730192, 0.3205981, 2.491427, 0, 1, 0.3921569, 1,
-0.2729636, 0.640477, -0.724453, 0, 1, 0.4, 1,
-0.2694519, -0.3438379, -4.580768, 0, 1, 0.4078431, 1,
-0.2645128, 0.5323849, -0.2690921, 0, 1, 0.4117647, 1,
-0.2635307, 1.821179, 0.008376861, 0, 1, 0.4196078, 1,
-0.2631571, -0.6584706, -2.421292, 0, 1, 0.4235294, 1,
-0.2587799, -0.02391356, -3.304693, 0, 1, 0.4313726, 1,
-0.2583107, 0.06241095, 0.6550542, 0, 1, 0.4352941, 1,
-0.2572195, -0.08459884, -2.983169, 0, 1, 0.4431373, 1,
-0.2568131, 1.490911, 0.7064094, 0, 1, 0.4470588, 1,
-0.2528613, 0.9984861, 0.08507335, 0, 1, 0.454902, 1,
-0.2519634, 0.2304953, -0.3430115, 0, 1, 0.4588235, 1,
-0.2456291, 0.03752392, -0.3183273, 0, 1, 0.4666667, 1,
-0.2423798, -0.5749661, -3.247687, 0, 1, 0.4705882, 1,
-0.2416914, 1.782793, -1.177087, 0, 1, 0.4784314, 1,
-0.2416291, 0.1366791, -1.153655, 0, 1, 0.4823529, 1,
-0.2372959, 1.169039, -0.2425597, 0, 1, 0.4901961, 1,
-0.2370245, 0.8733854, 0.6232628, 0, 1, 0.4941176, 1,
-0.2367632, 2.027402, -0.5337946, 0, 1, 0.5019608, 1,
-0.2365385, -1.489758, -2.203932, 0, 1, 0.509804, 1,
-0.2348927, 0.4562623, -1.216025, 0, 1, 0.5137255, 1,
-0.2251839, 0.6192617, 0.9371005, 0, 1, 0.5215687, 1,
-0.2222666, 0.2498871, -0.7113495, 0, 1, 0.5254902, 1,
-0.2214326, 2.163751, 0.9136639, 0, 1, 0.5333334, 1,
-0.2205871, 2.131476, -0.5223271, 0, 1, 0.5372549, 1,
-0.2186115, -0.1236308, -1.825558, 0, 1, 0.5450981, 1,
-0.2128489, 0.8178458, -1.576086, 0, 1, 0.5490196, 1,
-0.2041258, 1.887648, 0.3980943, 0, 1, 0.5568628, 1,
-0.2023231, -0.002081666, -2.184931, 0, 1, 0.5607843, 1,
-0.2003442, 0.04175011, 0.03407691, 0, 1, 0.5686275, 1,
-0.1996228, -1.073811, -3.372082, 0, 1, 0.572549, 1,
-0.1918296, -0.9604668, -3.577443, 0, 1, 0.5803922, 1,
-0.1815908, 0.8025447, -0.2161611, 0, 1, 0.5843138, 1,
-0.1795949, 0.4246288, -0.1049102, 0, 1, 0.5921569, 1,
-0.1791321, -0.03894592, -1.574067, 0, 1, 0.5960785, 1,
-0.1778518, -0.5036812, -3.088744, 0, 1, 0.6039216, 1,
-0.171228, -0.103318, -2.208453, 0, 1, 0.6117647, 1,
-0.1705109, -0.5788118, -2.384895, 0, 1, 0.6156863, 1,
-0.1669433, 0.2915742, -0.7625707, 0, 1, 0.6235294, 1,
-0.1663462, -1.074703, -4.773114, 0, 1, 0.627451, 1,
-0.1615698, -0.06621252, -2.059402, 0, 1, 0.6352941, 1,
-0.1612028, 0.8903329, -1.471444, 0, 1, 0.6392157, 1,
-0.1594663, 1.316927, 0.6618453, 0, 1, 0.6470588, 1,
-0.1577512, -0.8123927, -3.074818, 0, 1, 0.6509804, 1,
-0.1576716, 0.2800921, 0.4897776, 0, 1, 0.6588235, 1,
-0.1535457, 0.0457737, -1.356223, 0, 1, 0.6627451, 1,
-0.1532468, -0.03558354, -3.147007, 0, 1, 0.6705883, 1,
-0.1519517, 1.871741, -0.6477404, 0, 1, 0.6745098, 1,
-0.1477221, 0.4150053, 1.551045, 0, 1, 0.682353, 1,
-0.1451224, 0.4456415, 0.2900405, 0, 1, 0.6862745, 1,
-0.1446674, 0.04965037, -1.337289, 0, 1, 0.6941177, 1,
-0.1439736, -0.3800226, -2.263444, 0, 1, 0.7019608, 1,
-0.1397123, -0.6624389, -3.596467, 0, 1, 0.7058824, 1,
-0.1385389, 1.299047, 0.6168097, 0, 1, 0.7137255, 1,
-0.1369207, 1.626644, -1.606663, 0, 1, 0.7176471, 1,
-0.1366331, 0.5125853, -0.9813564, 0, 1, 0.7254902, 1,
-0.1360532, 0.5218183, -1.680197, 0, 1, 0.7294118, 1,
-0.1328524, 0.1531399, 0.354017, 0, 1, 0.7372549, 1,
-0.1250843, -0.1148668, -2.793746, 0, 1, 0.7411765, 1,
-0.1244796, 0.2696445, -0.4278382, 0, 1, 0.7490196, 1,
-0.123911, 1.104025, 0.613574, 0, 1, 0.7529412, 1,
-0.121692, 0.6148087, 0.5493595, 0, 1, 0.7607843, 1,
-0.1207875, -2.371808, -3.777377, 0, 1, 0.7647059, 1,
-0.1199871, 1.005401, 0.08522826, 0, 1, 0.772549, 1,
-0.110965, 0.06304269, -2.123606, 0, 1, 0.7764706, 1,
-0.1094355, -0.03900865, -1.644048, 0, 1, 0.7843137, 1,
-0.1092363, -0.1014754, -1.717738, 0, 1, 0.7882353, 1,
-0.1076422, -1.109501, -3.672395, 0, 1, 0.7960784, 1,
-0.1039734, 0.847114, -2.590905, 0, 1, 0.8039216, 1,
-0.1035939, 0.6822972, -0.6603144, 0, 1, 0.8078431, 1,
-0.1029089, 1.473247, -0.05766584, 0, 1, 0.8156863, 1,
-0.09892572, 1.256784, -0.6773886, 0, 1, 0.8196079, 1,
-0.09708654, -0.7769983, -2.903076, 0, 1, 0.827451, 1,
-0.09151278, -0.1343882, -3.490895, 0, 1, 0.8313726, 1,
-0.08886765, -0.4336489, -3.96761, 0, 1, 0.8392157, 1,
-0.08708855, 1.106357, 0.0285895, 0, 1, 0.8431373, 1,
-0.08404692, -1.281096, -1.757501, 0, 1, 0.8509804, 1,
-0.08262126, -0.4617763, -2.120989, 0, 1, 0.854902, 1,
-0.08138225, 2.417145, 0.4372778, 0, 1, 0.8627451, 1,
-0.07965194, -0.2508654, -3.977545, 0, 1, 0.8666667, 1,
-0.07895195, -0.5524731, -2.198258, 0, 1, 0.8745098, 1,
-0.07835143, -1.869918, -2.781354, 0, 1, 0.8784314, 1,
-0.07767688, 0.7235038, 0.06240543, 0, 1, 0.8862745, 1,
-0.07501863, 0.01064579, -2.166161, 0, 1, 0.8901961, 1,
-0.07434249, 1.718166, -1.173668, 0, 1, 0.8980392, 1,
-0.06850274, 1.059733, 1.111308, 0, 1, 0.9058824, 1,
-0.06808791, -3.338835, -2.891937, 0, 1, 0.9098039, 1,
-0.0644686, 1.521806, -1.168399, 0, 1, 0.9176471, 1,
-0.06306521, -1.237775, -3.789016, 0, 1, 0.9215686, 1,
-0.05588491, -0.04496654, -0.8628818, 0, 1, 0.9294118, 1,
-0.05263685, -1.668827, -2.193109, 0, 1, 0.9333333, 1,
-0.05247909, -1.249024, -3.546883, 0, 1, 0.9411765, 1,
-0.04563289, 0.5569018, -0.6057234, 0, 1, 0.945098, 1,
-0.04498563, -1.363235, -4.021589, 0, 1, 0.9529412, 1,
-0.04448287, -0.1533073, -1.71877, 0, 1, 0.9568627, 1,
-0.03753835, -0.5507529, -3.468972, 0, 1, 0.9647059, 1,
-0.03552382, 0.001309975, -0.7785196, 0, 1, 0.9686275, 1,
-0.03211901, 2.166478, -1.951027, 0, 1, 0.9764706, 1,
-0.03171292, -0.6538258, -2.60164, 0, 1, 0.9803922, 1,
-0.03037763, 1.274044, -0.2575729, 0, 1, 0.9882353, 1,
-0.02503455, 0.2371537, 0.1221126, 0, 1, 0.9921569, 1,
-0.02397902, -2.800653, -5.333498, 0, 1, 1, 1,
-0.02354157, 0.7622848, -0.2654701, 0, 0.9921569, 1, 1,
-0.01799964, -0.401221, -1.85445, 0, 0.9882353, 1, 1,
-0.01716356, 0.3514496, -1.240626, 0, 0.9803922, 1, 1,
-0.01670178, 2.164061, 0.2843882, 0, 0.9764706, 1, 1,
-0.01669703, 0.09763493, 2.068123, 0, 0.9686275, 1, 1,
-0.007037557, -0.6996205, -1.325662, 0, 0.9647059, 1, 1,
-0.0005294118, -1.117235, -3.474825, 0, 0.9568627, 1, 1,
0.008923567, 0.2534956, -1.034144, 0, 0.9529412, 1, 1,
0.01127803, -1.457574, 3.232097, 0, 0.945098, 1, 1,
0.01263575, -1.231295, 3.48621, 0, 0.9411765, 1, 1,
0.01275909, 0.4586861, -0.3680081, 0, 0.9333333, 1, 1,
0.01791271, -0.2689212, 2.971383, 0, 0.9294118, 1, 1,
0.01805134, -0.3278469, 2.318138, 0, 0.9215686, 1, 1,
0.02609081, -0.9942195, 2.665879, 0, 0.9176471, 1, 1,
0.02755343, -0.109286, 2.263231, 0, 0.9098039, 1, 1,
0.02982005, 0.741711, -0.3250269, 0, 0.9058824, 1, 1,
0.03336501, 1.552301, 0.550573, 0, 0.8980392, 1, 1,
0.03356501, -0.2647496, 1.152498, 0, 0.8901961, 1, 1,
0.03559347, 0.1193919, 0.8148968, 0, 0.8862745, 1, 1,
0.03834847, 1.569086, -0.362311, 0, 0.8784314, 1, 1,
0.03871903, -0.1252079, 2.866677, 0, 0.8745098, 1, 1,
0.04311375, 1.465518, -0.546193, 0, 0.8666667, 1, 1,
0.04381848, 0.9376298, 0.2236027, 0, 0.8627451, 1, 1,
0.04569999, -0.9493114, 1.913917, 0, 0.854902, 1, 1,
0.04662085, 0.3172317, -0.1656997, 0, 0.8509804, 1, 1,
0.05106369, 0.2557591, 0.4211726, 0, 0.8431373, 1, 1,
0.05169642, -0.3946113, 1.254441, 0, 0.8392157, 1, 1,
0.0541329, 0.4691844, 0.0005951722, 0, 0.8313726, 1, 1,
0.05553472, -0.1443236, 1.086888, 0, 0.827451, 1, 1,
0.05574467, 0.4176201, -0.4889863, 0, 0.8196079, 1, 1,
0.05948187, -0.2956589, 1.744619, 0, 0.8156863, 1, 1,
0.0599596, 0.775621, -0.1693447, 0, 0.8078431, 1, 1,
0.06923013, -1.097714, 0.6183127, 0, 0.8039216, 1, 1,
0.07064389, -0.6015244, 2.335736, 0, 0.7960784, 1, 1,
0.07210421, 0.00826841, 0.8765172, 0, 0.7882353, 1, 1,
0.07243989, 1.176264, 0.1367146, 0, 0.7843137, 1, 1,
0.07312282, 0.2441585, -0.6858905, 0, 0.7764706, 1, 1,
0.07554763, -0.9960151, 5.537294, 0, 0.772549, 1, 1,
0.07774721, -0.6595925, 2.802628, 0, 0.7647059, 1, 1,
0.08278206, -1.446679, 2.925988, 0, 0.7607843, 1, 1,
0.0831585, 1.323166, 0.09697515, 0, 0.7529412, 1, 1,
0.08787344, -0.4693854, 1.788906, 0, 0.7490196, 1, 1,
0.08897044, -1.512231, 3.906735, 0, 0.7411765, 1, 1,
0.0907117, 0.120969, 1.280666, 0, 0.7372549, 1, 1,
0.09165622, 0.2142812, 1.74816, 0, 0.7294118, 1, 1,
0.09380123, -1.581239, 4.58586, 0, 0.7254902, 1, 1,
0.09473044, -1.2759, 3.537788, 0, 0.7176471, 1, 1,
0.09607171, -0.3466064, 2.952529, 0, 0.7137255, 1, 1,
0.09733104, -0.2553316, 5.501181, 0, 0.7058824, 1, 1,
0.09832207, -1.089978, 5.102882, 0, 0.6980392, 1, 1,
0.09937995, -0.928783, 2.395023, 0, 0.6941177, 1, 1,
0.1010902, 1.038437, 0.7536883, 0, 0.6862745, 1, 1,
0.1177424, -0.3969292, 2.064248, 0, 0.682353, 1, 1,
0.1224751, -0.9683709, 2.973317, 0, 0.6745098, 1, 1,
0.1261799, 0.3370145, -0.6205117, 0, 0.6705883, 1, 1,
0.1294784, 0.009309351, -0.2773047, 0, 0.6627451, 1, 1,
0.1299959, 0.4841703, -0.4857967, 0, 0.6588235, 1, 1,
0.133091, 0.1922175, 0.3312893, 0, 0.6509804, 1, 1,
0.1394707, -1.283001, 2.967182, 0, 0.6470588, 1, 1,
0.1406716, -0.4827121, 1.748292, 0, 0.6392157, 1, 1,
0.1439066, 0.4254468, -0.7129842, 0, 0.6352941, 1, 1,
0.144452, -0.647109, 5.137232, 0, 0.627451, 1, 1,
0.1446764, -0.351925, 3.534686, 0, 0.6235294, 1, 1,
0.1525952, -0.712284, 2.430016, 0, 0.6156863, 1, 1,
0.1532242, -0.3210795, 3.598398, 0, 0.6117647, 1, 1,
0.1589048, 1.382329, -0.04785981, 0, 0.6039216, 1, 1,
0.160365, 0.8516657, 1.999819, 0, 0.5960785, 1, 1,
0.160569, -0.4654711, 3.123697, 0, 0.5921569, 1, 1,
0.1638356, -1.726712, 2.999769, 0, 0.5843138, 1, 1,
0.1677482, -0.7074426, 3.379983, 0, 0.5803922, 1, 1,
0.1679131, -0.1196366, 2.159514, 0, 0.572549, 1, 1,
0.1706534, 0.8007877, -0.2520192, 0, 0.5686275, 1, 1,
0.1707273, -0.129451, 0.4377346, 0, 0.5607843, 1, 1,
0.1718636, 0.6892741, -0.08916464, 0, 0.5568628, 1, 1,
0.1718728, -0.2434862, 2.876183, 0, 0.5490196, 1, 1,
0.1755783, -1.726692, 3.616384, 0, 0.5450981, 1, 1,
0.1776354, -0.04860042, 1.487228, 0, 0.5372549, 1, 1,
0.1782968, 1.123672, -1.729011, 0, 0.5333334, 1, 1,
0.1783643, 1.334444, 1.728563, 0, 0.5254902, 1, 1,
0.182735, 0.9200665, -0.3287791, 0, 0.5215687, 1, 1,
0.1832375, 0.5200747, 1.062496, 0, 0.5137255, 1, 1,
0.192592, 1.29717, 1.028963, 0, 0.509804, 1, 1,
0.1949275, -0.5511318, 2.23263, 0, 0.5019608, 1, 1,
0.1972254, -0.6025133, 2.526153, 0, 0.4941176, 1, 1,
0.1981884, -0.4220984, 4.027462, 0, 0.4901961, 1, 1,
0.1992984, -0.3700623, 2.056041, 0, 0.4823529, 1, 1,
0.1999453, 0.357262, 0.1467054, 0, 0.4784314, 1, 1,
0.2052248, -0.447564, 1.925728, 0, 0.4705882, 1, 1,
0.2130716, 0.160982, 1.845077, 0, 0.4666667, 1, 1,
0.2164614, -0.992108, 2.419957, 0, 0.4588235, 1, 1,
0.2170946, 0.2421383, 1.394878, 0, 0.454902, 1, 1,
0.2172022, 0.1395482, 1.349106, 0, 0.4470588, 1, 1,
0.2268139, 0.9336319, 0.6204379, 0, 0.4431373, 1, 1,
0.226962, 0.8197739, -0.1126962, 0, 0.4352941, 1, 1,
0.2320736, 1.638017, -0.2282214, 0, 0.4313726, 1, 1,
0.2330669, 0.2269494, -0.450679, 0, 0.4235294, 1, 1,
0.2350928, -1.942192, 2.671913, 0, 0.4196078, 1, 1,
0.2377539, -0.1113033, 2.292551, 0, 0.4117647, 1, 1,
0.2387367, -1.229462, 4.592629, 0, 0.4078431, 1, 1,
0.2418779, 2.095211, -0.8565169, 0, 0.4, 1, 1,
0.2443839, -0.5562275, 2.242749, 0, 0.3921569, 1, 1,
0.2455385, -2.380291, 1.649435, 0, 0.3882353, 1, 1,
0.2478836, -0.1471739, 0.6998002, 0, 0.3803922, 1, 1,
0.2497639, 0.4317537, 0.5984067, 0, 0.3764706, 1, 1,
0.2523892, -1.160938, 1.262384, 0, 0.3686275, 1, 1,
0.2563367, 0.7615517, -1.739134, 0, 0.3647059, 1, 1,
0.2590295, 0.7601972, 2.023336, 0, 0.3568628, 1, 1,
0.2591092, 0.1032193, 0.7826142, 0, 0.3529412, 1, 1,
0.2595533, -1.264632, 2.380125, 0, 0.345098, 1, 1,
0.2613681, -2.119178, 1.711684, 0, 0.3411765, 1, 1,
0.2666364, -0.2259066, 2.119542, 0, 0.3333333, 1, 1,
0.2667884, -0.3884475, 3.582819, 0, 0.3294118, 1, 1,
0.2676696, 1.759155, 1.050905, 0, 0.3215686, 1, 1,
0.2722771, -1.560171, 2.271215, 0, 0.3176471, 1, 1,
0.2730928, 0.2239116, 0.2367823, 0, 0.3098039, 1, 1,
0.279486, -1.167665, 1.440161, 0, 0.3058824, 1, 1,
0.2800601, -0.08615924, 1.755215, 0, 0.2980392, 1, 1,
0.2828807, 0.694726, 1.70694, 0, 0.2901961, 1, 1,
0.2830238, -2.423765, 2.532898, 0, 0.2862745, 1, 1,
0.2861045, -2.250049, 3.322613, 0, 0.2784314, 1, 1,
0.2901409, -0.7541908, 2.937381, 0, 0.2745098, 1, 1,
0.2905417, 0.7582635, -0.5510126, 0, 0.2666667, 1, 1,
0.2909824, -1.125365, 2.746949, 0, 0.2627451, 1, 1,
0.2924822, 0.9459863, 0.7335517, 0, 0.254902, 1, 1,
0.3000961, 0.05301242, -1.327945, 0, 0.2509804, 1, 1,
0.3028854, -1.21122, 3.071853, 0, 0.2431373, 1, 1,
0.3060737, -1.204927, 2.086184, 0, 0.2392157, 1, 1,
0.3085175, 0.4052987, 1.941254, 0, 0.2313726, 1, 1,
0.3108503, 0.7150252, -0.373748, 0, 0.227451, 1, 1,
0.3112314, 0.2883861, 1.409588, 0, 0.2196078, 1, 1,
0.317635, 0.515182, 1.357987, 0, 0.2156863, 1, 1,
0.3177608, -0.5433255, 3.164326, 0, 0.2078431, 1, 1,
0.3230851, 0.9858618, 0.6401693, 0, 0.2039216, 1, 1,
0.3281351, 1.481485, -1.301076, 0, 0.1960784, 1, 1,
0.3311659, 0.7074377, 0.5419791, 0, 0.1882353, 1, 1,
0.3321674, -1.710799, 3.207206, 0, 0.1843137, 1, 1,
0.3370419, -0.3744928, 0.7002757, 0, 0.1764706, 1, 1,
0.3371301, 0.1843409, 2.303847, 0, 0.172549, 1, 1,
0.340482, 0.277577, 1.290158, 0, 0.1647059, 1, 1,
0.3422171, 1.627127, 0.7711651, 0, 0.1607843, 1, 1,
0.3528182, 0.1863842, 0.5669566, 0, 0.1529412, 1, 1,
0.3556137, -1.31209, 4.194797, 0, 0.1490196, 1, 1,
0.3585807, 0.9761928, 0.5886865, 0, 0.1411765, 1, 1,
0.3591613, 0.6974535, 0.1474288, 0, 0.1372549, 1, 1,
0.3607367, -0.7691601, 1.734245, 0, 0.1294118, 1, 1,
0.3646338, -1.135416, 2.179526, 0, 0.1254902, 1, 1,
0.3683541, -0.6352881, 3.128831, 0, 0.1176471, 1, 1,
0.3700844, 1.749831, 1.013657, 0, 0.1137255, 1, 1,
0.3701954, 1.58835, 0.06288281, 0, 0.1058824, 1, 1,
0.3720353, 0.07507296, 0.3961102, 0, 0.09803922, 1, 1,
0.3743129, 0.863372, -0.7176433, 0, 0.09411765, 1, 1,
0.3747911, -0.01719883, 2.469285, 0, 0.08627451, 1, 1,
0.3791039, -1.210847, 3.477971, 0, 0.08235294, 1, 1,
0.3833052, 1.144633, 1.030642, 0, 0.07450981, 1, 1,
0.3859947, 0.945109, 0.1692355, 0, 0.07058824, 1, 1,
0.3866233, -2.310445, 2.630753, 0, 0.0627451, 1, 1,
0.388035, 1.257459, -0.4696579, 0, 0.05882353, 1, 1,
0.3894231, -1.515645, 2.118289, 0, 0.05098039, 1, 1,
0.3934612, -0.1660746, 1.399722, 0, 0.04705882, 1, 1,
0.3941635, -0.434528, 2.449606, 0, 0.03921569, 1, 1,
0.396499, -0.0809761, 3.272811, 0, 0.03529412, 1, 1,
0.3968133, -1.515727, 1.9611, 0, 0.02745098, 1, 1,
0.4002025, 1.369789, 0.1952499, 0, 0.02352941, 1, 1,
0.4008011, -1.479611, 3.94298, 0, 0.01568628, 1, 1,
0.4062493, -1.040834, 2.94825, 0, 0.01176471, 1, 1,
0.4094771, -0.9491228, 1.963294, 0, 0.003921569, 1, 1,
0.4104217, 0.2750493, 1.695358, 0.003921569, 0, 1, 1,
0.4151098, 0.4098962, 1.61932, 0.007843138, 0, 1, 1,
0.4163122, 2.818139, 0.5428866, 0.01568628, 0, 1, 1,
0.4180732, 0.7013713, 1.427559, 0.01960784, 0, 1, 1,
0.424208, 1.689821, 0.6397879, 0.02745098, 0, 1, 1,
0.4250563, -0.7644929, 2.182787, 0.03137255, 0, 1, 1,
0.4281574, 0.4810436, 0.2871159, 0.03921569, 0, 1, 1,
0.4370907, 0.3597832, 1.914714, 0.04313726, 0, 1, 1,
0.4445819, -1.44969, 3.324027, 0.05098039, 0, 1, 1,
0.4460062, 0.1710444, -0.310392, 0.05490196, 0, 1, 1,
0.4530373, -0.3108144, 0.6675454, 0.0627451, 0, 1, 1,
0.4608536, -0.7591063, 1.901834, 0.06666667, 0, 1, 1,
0.4609444, 0.7862906, 0.5451906, 0.07450981, 0, 1, 1,
0.4629036, 2.200153, 0.1324368, 0.07843138, 0, 1, 1,
0.4745153, 0.2898774, 1.198392, 0.08627451, 0, 1, 1,
0.4844733, -0.5133571, 2.586907, 0.09019608, 0, 1, 1,
0.4886727, -0.2724557, 2.692292, 0.09803922, 0, 1, 1,
0.4903684, 0.05547196, 1.054192, 0.1058824, 0, 1, 1,
0.4913755, 0.4251098, 0.8587248, 0.1098039, 0, 1, 1,
0.4963914, 0.625735, 0.5199918, 0.1176471, 0, 1, 1,
0.500746, 0.2622182, 1.321512, 0.1215686, 0, 1, 1,
0.5129356, -1.058082, 3.743712, 0.1294118, 0, 1, 1,
0.5147938, -0.08074471, 2.014445, 0.1333333, 0, 1, 1,
0.5153343, -1.445083, 2.058895, 0.1411765, 0, 1, 1,
0.5255196, 0.6453641, 0.7069196, 0.145098, 0, 1, 1,
0.5309064, -1.930531, 3.75409, 0.1529412, 0, 1, 1,
0.5390809, 0.8634565, 0.4830526, 0.1568628, 0, 1, 1,
0.5412217, 0.6364202, 0.5386164, 0.1647059, 0, 1, 1,
0.5521581, 0.841645, 0.5548235, 0.1686275, 0, 1, 1,
0.5542426, -1.436626, 3.038771, 0.1764706, 0, 1, 1,
0.5592213, 1.215525, -0.5153899, 0.1803922, 0, 1, 1,
0.5622964, -0.501549, 2.977018, 0.1882353, 0, 1, 1,
0.5687754, -0.5487331, 3.395984, 0.1921569, 0, 1, 1,
0.571492, 0.5281842, 1.077836, 0.2, 0, 1, 1,
0.5757671, 0.688176, 0.6183304, 0.2078431, 0, 1, 1,
0.5779873, -0.4937382, 3.562713, 0.2117647, 0, 1, 1,
0.5782681, -1.382435, 2.973969, 0.2196078, 0, 1, 1,
0.5837486, -1.666365, 2.125199, 0.2235294, 0, 1, 1,
0.5877559, -0.4903578, 2.889648, 0.2313726, 0, 1, 1,
0.5929276, 0.3657251, 1.105082, 0.2352941, 0, 1, 1,
0.5935943, -0.4442102, 3.75549, 0.2431373, 0, 1, 1,
0.5953298, 0.009284423, 0.7652103, 0.2470588, 0, 1, 1,
0.5961862, 0.006117956, 2.741745, 0.254902, 0, 1, 1,
0.6000296, -0.6322024, 3.83293, 0.2588235, 0, 1, 1,
0.6012894, -0.08450819, -0.2454299, 0.2666667, 0, 1, 1,
0.6017783, 0.9304273, 0.9714415, 0.2705882, 0, 1, 1,
0.6054244, 1.206147, 0.0800551, 0.2784314, 0, 1, 1,
0.6060823, -0.04904246, -0.3502637, 0.282353, 0, 1, 1,
0.6066306, -2.107439, 3.612022, 0.2901961, 0, 1, 1,
0.6078154, -0.4456289, 1.069897, 0.2941177, 0, 1, 1,
0.6088347, -0.4087793, 2.539955, 0.3019608, 0, 1, 1,
0.610832, -0.743172, 1.52444, 0.3098039, 0, 1, 1,
0.615658, -0.7224541, 3.314647, 0.3137255, 0, 1, 1,
0.6181996, 0.2190209, 0.4777594, 0.3215686, 0, 1, 1,
0.6284333, -0.9965248, 2.972051, 0.3254902, 0, 1, 1,
0.6295098, -0.8342305, 1.731097, 0.3333333, 0, 1, 1,
0.6348442, -0.3624821, 2.318743, 0.3372549, 0, 1, 1,
0.6359603, 0.835661, 1.092874, 0.345098, 0, 1, 1,
0.6380997, -0.3296001, 0.6223511, 0.3490196, 0, 1, 1,
0.6384122, -0.1309867, 0.5785395, 0.3568628, 0, 1, 1,
0.6415823, 0.3968548, 0.7726429, 0.3607843, 0, 1, 1,
0.6512055, -1.528321, 2.675342, 0.3686275, 0, 1, 1,
0.6551365, -0.1540552, 0.9965252, 0.372549, 0, 1, 1,
0.657814, 1.919481, 0.9982706, 0.3803922, 0, 1, 1,
0.6582896, -1.151046, 2.585149, 0.3843137, 0, 1, 1,
0.6591997, 0.423225, 0.4922499, 0.3921569, 0, 1, 1,
0.6597012, -1.144529, 1.869646, 0.3960784, 0, 1, 1,
0.6615635, 0.2190553, 0.1354004, 0.4039216, 0, 1, 1,
0.6651399, -0.3489456, 2.535557, 0.4117647, 0, 1, 1,
0.6661767, -1.319085, 1.732484, 0.4156863, 0, 1, 1,
0.6668693, 1.925555, -0.4533737, 0.4235294, 0, 1, 1,
0.6764756, -0.5382814, 3.836943, 0.427451, 0, 1, 1,
0.6783054, 0.2279397, 1.426432, 0.4352941, 0, 1, 1,
0.6786992, 1.325491, 0.2014343, 0.4392157, 0, 1, 1,
0.6811132, -1.06843, 3.426221, 0.4470588, 0, 1, 1,
0.6845863, 0.691913, 0.9989462, 0.4509804, 0, 1, 1,
0.6846601, 1.098885, 0.09320539, 0.4588235, 0, 1, 1,
0.6847665, -0.1032735, 1.652995, 0.4627451, 0, 1, 1,
0.6857234, -1.138387, 2.296564, 0.4705882, 0, 1, 1,
0.6902581, -0.8184147, 4.313198, 0.4745098, 0, 1, 1,
0.6940023, -0.9163099, 3.296096, 0.4823529, 0, 1, 1,
0.6948041, -0.2458714, 2.855272, 0.4862745, 0, 1, 1,
0.6952459, -0.2713865, 2.274314, 0.4941176, 0, 1, 1,
0.6961682, 0.3347905, 1.223992, 0.5019608, 0, 1, 1,
0.6966118, 0.3640202, 0.9622906, 0.5058824, 0, 1, 1,
0.7037587, 0.1917104, 0.06604336, 0.5137255, 0, 1, 1,
0.7050652, 0.2198918, 1.201813, 0.5176471, 0, 1, 1,
0.7132185, 1.351527, 0.1836499, 0.5254902, 0, 1, 1,
0.7165819, -1.602448, 2.351056, 0.5294118, 0, 1, 1,
0.7175031, 0.07035507, 1.670281, 0.5372549, 0, 1, 1,
0.7180743, 0.3375053, 1.099192, 0.5411765, 0, 1, 1,
0.7194043, -0.8452282, 1.779136, 0.5490196, 0, 1, 1,
0.7194465, 1.080317, -0.04446332, 0.5529412, 0, 1, 1,
0.7228388, -0.2544754, 2.728878, 0.5607843, 0, 1, 1,
0.7264792, -1.518836, 1.954556, 0.5647059, 0, 1, 1,
0.7268035, -1.60166, 2.047869, 0.572549, 0, 1, 1,
0.7281943, -1.516274, 3.394992, 0.5764706, 0, 1, 1,
0.7390245, -0.1580292, 1.825942, 0.5843138, 0, 1, 1,
0.7394406, 0.8707221, 0.3393309, 0.5882353, 0, 1, 1,
0.7434157, -2.082613, 4.523575, 0.5960785, 0, 1, 1,
0.7467966, 0.6643541, -0.9295904, 0.6039216, 0, 1, 1,
0.7474285, -0.438866, -0.09982306, 0.6078432, 0, 1, 1,
0.7500114, 1.623311, 0.9856583, 0.6156863, 0, 1, 1,
0.7516679, 1.714177, 0.2708548, 0.6196079, 0, 1, 1,
0.7518445, -0.7220091, 1.681311, 0.627451, 0, 1, 1,
0.7538996, -1.542714, 2.700379, 0.6313726, 0, 1, 1,
0.7627663, 0.606696, 0.231034, 0.6392157, 0, 1, 1,
0.7634956, 0.9968022, 0.1366471, 0.6431373, 0, 1, 1,
0.7655693, -1.019392, 3.260549, 0.6509804, 0, 1, 1,
0.7697756, 0.6225113, -0.714098, 0.654902, 0, 1, 1,
0.7699479, 1.07472, 1.010257, 0.6627451, 0, 1, 1,
0.7701179, 0.8249479, 3.057265, 0.6666667, 0, 1, 1,
0.7726414, -0.5920311, 2.707917, 0.6745098, 0, 1, 1,
0.7791467, -0.4826826, 0.7222455, 0.6784314, 0, 1, 1,
0.7806021, 0.8474764, 1.394032, 0.6862745, 0, 1, 1,
0.7810218, 1.622893, -0.0461988, 0.6901961, 0, 1, 1,
0.7839955, -1.50262, 3.139786, 0.6980392, 0, 1, 1,
0.7864509, -0.06390405, 2.847754, 0.7058824, 0, 1, 1,
0.7887502, 0.0413849, 0.6066073, 0.7098039, 0, 1, 1,
0.7925568, 0.2384905, -0.8844436, 0.7176471, 0, 1, 1,
0.7956193, -0.8790399, 1.99471, 0.7215686, 0, 1, 1,
0.7972347, 1.064826, 0.7641585, 0.7294118, 0, 1, 1,
0.8029072, 0.675498, 0.5399861, 0.7333333, 0, 1, 1,
0.8038567, 1.071952, 0.9745955, 0.7411765, 0, 1, 1,
0.8086578, -1.604025, 1.293844, 0.7450981, 0, 1, 1,
0.8091759, -0.8066671, 1.939561, 0.7529412, 0, 1, 1,
0.8158304, -1.92397, 1.30465, 0.7568628, 0, 1, 1,
0.8163252, 0.3188398, 2.209979, 0.7647059, 0, 1, 1,
0.8175786, 0.6017818, -1.527328, 0.7686275, 0, 1, 1,
0.8184341, 1.50006, -1.341541, 0.7764706, 0, 1, 1,
0.8207111, -0.816739, 2.772296, 0.7803922, 0, 1, 1,
0.8233326, 0.1080626, 2.972032, 0.7882353, 0, 1, 1,
0.8244225, 2.621384, 1.514142, 0.7921569, 0, 1, 1,
0.8252177, -0.1873641, 2.959235, 0.8, 0, 1, 1,
0.8314662, -0.843696, 3.399588, 0.8078431, 0, 1, 1,
0.8443498, -1.6273, 3.491682, 0.8117647, 0, 1, 1,
0.8450679, 1.678396, 0.5542204, 0.8196079, 0, 1, 1,
0.8464897, -0.4044073, 1.961598, 0.8235294, 0, 1, 1,
0.8506312, 1.207749, -0.818125, 0.8313726, 0, 1, 1,
0.8537542, -1.100113, 2.196371, 0.8352941, 0, 1, 1,
0.8676773, 0.5722558, 1.375492, 0.8431373, 0, 1, 1,
0.8686939, -2.502423, 3.23105, 0.8470588, 0, 1, 1,
0.8701693, -1.38598, 1.844779, 0.854902, 0, 1, 1,
0.8709295, 0.2661055, 2.776672, 0.8588235, 0, 1, 1,
0.8741845, 1.755352, 2.968372, 0.8666667, 0, 1, 1,
0.8763325, -1.153595, 2.79881, 0.8705882, 0, 1, 1,
0.8786317, 0.5123171, 2.462345, 0.8784314, 0, 1, 1,
0.8790908, -0.9044488, 2.868209, 0.8823529, 0, 1, 1,
0.8801298, -0.0576385, 3.323841, 0.8901961, 0, 1, 1,
0.8830018, 0.2897646, 1.807658, 0.8941177, 0, 1, 1,
0.8834929, -2.116999, 3.103967, 0.9019608, 0, 1, 1,
0.8886088, -0.5088755, 3.577264, 0.9098039, 0, 1, 1,
0.8927324, 1.315583, -0.178136, 0.9137255, 0, 1, 1,
0.8949911, 1.074697, 1.528603, 0.9215686, 0, 1, 1,
0.8953844, 0.2122289, 0.924861, 0.9254902, 0, 1, 1,
0.8973508, 0.006562671, 2.238891, 0.9333333, 0, 1, 1,
0.9016422, 0.1496727, 1.23661, 0.9372549, 0, 1, 1,
0.9122031, -1.257136, 2.467856, 0.945098, 0, 1, 1,
0.9127808, 0.7167671, 1.576996, 0.9490196, 0, 1, 1,
0.9128003, -0.7546909, 1.933001, 0.9568627, 0, 1, 1,
0.9147742, -1.148137, 2.010397, 0.9607843, 0, 1, 1,
0.9180115, 0.9570811, 0.8477748, 0.9686275, 0, 1, 1,
0.9183232, 1.267031, 0.7349757, 0.972549, 0, 1, 1,
0.9194015, -0.7116852, 3.178663, 0.9803922, 0, 1, 1,
0.9222518, -1.283711, 3.022849, 0.9843137, 0, 1, 1,
0.9228038, 0.1187577, 0.9344138, 0.9921569, 0, 1, 1,
0.9237224, -0.3056538, 2.311996, 0.9960784, 0, 1, 1,
0.9247208, -0.839233, 2.025489, 1, 0, 0.9960784, 1,
0.9257963, -2.259562, 3.157161, 1, 0, 0.9882353, 1,
0.9280242, 0.6663386, 0.4630672, 1, 0, 0.9843137, 1,
0.9346011, -2.341876, 3.638159, 1, 0, 0.9764706, 1,
0.9451154, 0.3653211, 1.570604, 1, 0, 0.972549, 1,
0.9462121, -1.073537, 3.330479, 1, 0, 0.9647059, 1,
0.95091, 2.061599, -0.7007823, 1, 0, 0.9607843, 1,
0.964323, 1.367846, -1.01695, 1, 0, 0.9529412, 1,
0.9672757, 1.441069, -0.2715272, 1, 0, 0.9490196, 1,
0.9692492, -0.2331821, 2.881538, 1, 0, 0.9411765, 1,
0.9744309, -1.474202, 2.009297, 1, 0, 0.9372549, 1,
0.9759833, 1.059922, 1.146757, 1, 0, 0.9294118, 1,
0.9786019, 0.5267444, 0.7653186, 1, 0, 0.9254902, 1,
0.9831234, -1.022185, 1.309382, 1, 0, 0.9176471, 1,
0.9840785, 0.4693645, 0.735851, 1, 0, 0.9137255, 1,
0.9917105, 1.131897, 0.6987386, 1, 0, 0.9058824, 1,
0.9933406, -0.4542057, 4.234236, 1, 0, 0.9019608, 1,
0.9983863, -0.1342233, 2.844433, 1, 0, 0.8941177, 1,
0.9993919, 0.6589684, 0.8025146, 1, 0, 0.8862745, 1,
1.001353, -0.8104279, 2.526776, 1, 0, 0.8823529, 1,
1.007003, -0.6905544, 1.940519, 1, 0, 0.8745098, 1,
1.008303, -1.200009, 3.077085, 1, 0, 0.8705882, 1,
1.011174, 0.1059084, 2.160082, 1, 0, 0.8627451, 1,
1.019094, -1.367751, 1.906149, 1, 0, 0.8588235, 1,
1.026542, 0.1339763, 2.743037, 1, 0, 0.8509804, 1,
1.02655, -0.08689256, 0.8668752, 1, 0, 0.8470588, 1,
1.03297, -0.127613, 0.551378, 1, 0, 0.8392157, 1,
1.038459, 1.577113, 0.2168864, 1, 0, 0.8352941, 1,
1.045098, 0.9809192, 1.870657, 1, 0, 0.827451, 1,
1.047049, -0.486111, 2.528636, 1, 0, 0.8235294, 1,
1.047642, 1.158395, 2.396, 1, 0, 0.8156863, 1,
1.051299, 0.4354629, 0.5850587, 1, 0, 0.8117647, 1,
1.051472, -0.1433704, 1.236195, 1, 0, 0.8039216, 1,
1.065112, 0.3587742, 0.8858489, 1, 0, 0.7960784, 1,
1.066177, -0.3368459, 1.72333, 1, 0, 0.7921569, 1,
1.067315, 0.1543698, 1.627914, 1, 0, 0.7843137, 1,
1.069152, 0.1689438, 1.203052, 1, 0, 0.7803922, 1,
1.075881, -0.7930649, 1.998954, 1, 0, 0.772549, 1,
1.078339, -0.8786268, 3.152151, 1, 0, 0.7686275, 1,
1.110633, 1.066414, 1.06199, 1, 0, 0.7607843, 1,
1.121162, -0.7194916, 2.626784, 1, 0, 0.7568628, 1,
1.122841, 0.641961, 2.366318, 1, 0, 0.7490196, 1,
1.124331, -0.05258482, 2.225971, 1, 0, 0.7450981, 1,
1.125672, 1.364568, 0.4866883, 1, 0, 0.7372549, 1,
1.136452, -0.4527443, 1.791994, 1, 0, 0.7333333, 1,
1.139414, -2.591028, 2.055645, 1, 0, 0.7254902, 1,
1.139521, 1.526868, 0.881828, 1, 0, 0.7215686, 1,
1.139795, -0.4945986, 1.434, 1, 0, 0.7137255, 1,
1.146865, 0.4775741, 0.1802439, 1, 0, 0.7098039, 1,
1.153534, -1.139959, 2.221809, 1, 0, 0.7019608, 1,
1.160184, 0.8373548, 0.01653372, 1, 0, 0.6941177, 1,
1.161042, 1.007416, 1.518649, 1, 0, 0.6901961, 1,
1.164161, -0.826975, 2.41749, 1, 0, 0.682353, 1,
1.171493, -0.1928336, 2.115111, 1, 0, 0.6784314, 1,
1.173728, -1.345408, 1.304523, 1, 0, 0.6705883, 1,
1.184255, 0.1170787, 1.545636, 1, 0, 0.6666667, 1,
1.195261, 0.5606571, 1.49855, 1, 0, 0.6588235, 1,
1.197243, -0.2858918, 1.339617, 1, 0, 0.654902, 1,
1.206066, 1.755745, 0.6697766, 1, 0, 0.6470588, 1,
1.206288, 0.5765535, 2.832929, 1, 0, 0.6431373, 1,
1.207844, -1.096174, 2.572405, 1, 0, 0.6352941, 1,
1.209398, 0.7361848, 1.804226, 1, 0, 0.6313726, 1,
1.212215, -0.1872932, 1.411389, 1, 0, 0.6235294, 1,
1.217018, -1.098054, 2.762002, 1, 0, 0.6196079, 1,
1.219269, 1.643058, -0.3651848, 1, 0, 0.6117647, 1,
1.221177, -0.2007049, 2.282207, 1, 0, 0.6078432, 1,
1.225502, 1.505942, 1.61043, 1, 0, 0.6, 1,
1.226417, -0.8052019, 1.892648, 1, 0, 0.5921569, 1,
1.23238, -0.5564992, 0.9030524, 1, 0, 0.5882353, 1,
1.233617, -0.1661176, 2.591053, 1, 0, 0.5803922, 1,
1.235594, -0.1767364, 1.994985, 1, 0, 0.5764706, 1,
1.241273, 0.2868528, 1.197437, 1, 0, 0.5686275, 1,
1.246873, 1.151223, 0.8193679, 1, 0, 0.5647059, 1,
1.257125, 1.125739, 1.453774, 1, 0, 0.5568628, 1,
1.257956, -1.158203, 2.820484, 1, 0, 0.5529412, 1,
1.289388, 0.4749441, 2.423346, 1, 0, 0.5450981, 1,
1.297211, 1.354674, 2.615048, 1, 0, 0.5411765, 1,
1.30354, 0.7591637, 1.453689, 1, 0, 0.5333334, 1,
1.307039, 0.482265, 0.2835012, 1, 0, 0.5294118, 1,
1.313774, 0.3880735, 0.6331995, 1, 0, 0.5215687, 1,
1.323129, -0.4017763, 0.9407141, 1, 0, 0.5176471, 1,
1.329302, -0.8513066, 1.400335, 1, 0, 0.509804, 1,
1.334264, 0.3800202, 0.5256429, 1, 0, 0.5058824, 1,
1.339566, -0.9249712, 2.64128, 1, 0, 0.4980392, 1,
1.342977, -0.042745, 1.191419, 1, 0, 0.4901961, 1,
1.375418, -0.9199919, 1.086503, 1, 0, 0.4862745, 1,
1.375538, 1.392721, 1.722837, 1, 0, 0.4784314, 1,
1.378211, 1.868544, 0.8132628, 1, 0, 0.4745098, 1,
1.380741, 1.042797, -0.4900964, 1, 0, 0.4666667, 1,
1.388926, -0.4531921, 2.06023, 1, 0, 0.4627451, 1,
1.394715, -0.3456008, 3.178401, 1, 0, 0.454902, 1,
1.398334, 0.3235381, 0.3129236, 1, 0, 0.4509804, 1,
1.405729, -1.161803, 4.005852, 1, 0, 0.4431373, 1,
1.425231, 1.33076, 1.072227, 1, 0, 0.4392157, 1,
1.428235, 0.5203874, 0.9555297, 1, 0, 0.4313726, 1,
1.437879, -1.056149, 1.581591, 1, 0, 0.427451, 1,
1.44988, 0.4712264, -0.003502357, 1, 0, 0.4196078, 1,
1.457989, 0.6944864, 0.7652228, 1, 0, 0.4156863, 1,
1.461519, 0.2134618, 1.29317, 1, 0, 0.4078431, 1,
1.462699, -0.3724713, 0.9510661, 1, 0, 0.4039216, 1,
1.470358, -2.655582, 1.362812, 1, 0, 0.3960784, 1,
1.498239, -1.378379, 3.586829, 1, 0, 0.3882353, 1,
1.500821, -0.2738265, -0.1874157, 1, 0, 0.3843137, 1,
1.501686, 0.3869485, 0.5298002, 1, 0, 0.3764706, 1,
1.513769, -0.9068797, 2.65043, 1, 0, 0.372549, 1,
1.522699, 0.2091374, 3.016047, 1, 0, 0.3647059, 1,
1.529792, 1.230837, 1.031393, 1, 0, 0.3607843, 1,
1.547818, -0.2811441, 2.018407, 1, 0, 0.3529412, 1,
1.550608, 1.946509, 0.9304475, 1, 0, 0.3490196, 1,
1.554007, 0.417594, 1.701631, 1, 0, 0.3411765, 1,
1.555729, -0.6751711, 2.616189, 1, 0, 0.3372549, 1,
1.579548, -0.2861717, 1.925257, 1, 0, 0.3294118, 1,
1.583063, 0.5826203, 0.3359842, 1, 0, 0.3254902, 1,
1.585402, -1.012709, 1.575418, 1, 0, 0.3176471, 1,
1.596455, -0.4054185, 3.498096, 1, 0, 0.3137255, 1,
1.615733, 1.209322, 0.9416463, 1, 0, 0.3058824, 1,
1.617737, 0.1358778, 2.042954, 1, 0, 0.2980392, 1,
1.627717, 0.4187479, 0.6063337, 1, 0, 0.2941177, 1,
1.632878, -0.2054711, 0.7445386, 1, 0, 0.2862745, 1,
1.647959, -0.6694398, 4.653162, 1, 0, 0.282353, 1,
1.649248, 0.7114445, 0.8858989, 1, 0, 0.2745098, 1,
1.665871, 0.04586751, 1.270869, 1, 0, 0.2705882, 1,
1.672712, 0.2841951, 1.676419, 1, 0, 0.2627451, 1,
1.677098, -1.644982, 2.883321, 1, 0, 0.2588235, 1,
1.678499, 0.9054128, 1.10694, 1, 0, 0.2509804, 1,
1.68776, -1.76844, 2.654249, 1, 0, 0.2470588, 1,
1.688747, 0.4429372, -0.1802559, 1, 0, 0.2392157, 1,
1.698904, -0.7249845, 3.056285, 1, 0, 0.2352941, 1,
1.716725, 0.2110816, 1.018942, 1, 0, 0.227451, 1,
1.719363, -0.968374, 0.5650008, 1, 0, 0.2235294, 1,
1.722641, -1.447971, 2.04038, 1, 0, 0.2156863, 1,
1.744806, -0.4147864, -0.5798684, 1, 0, 0.2117647, 1,
1.78299, -0.4265341, 2.593047, 1, 0, 0.2039216, 1,
1.788985, -0.2619846, 2.661083, 1, 0, 0.1960784, 1,
1.812255, 0.7592537, 1.062321, 1, 0, 0.1921569, 1,
1.816012, 0.124797, 0.7179815, 1, 0, 0.1843137, 1,
1.819128, -0.5683038, 1.783567, 1, 0, 0.1803922, 1,
1.821981, -1.381809, -0.231691, 1, 0, 0.172549, 1,
1.854967, -1.412469, 4.020137, 1, 0, 0.1686275, 1,
1.912333, -0.973052, 2.637831, 1, 0, 0.1607843, 1,
1.924582, 1.697123, 2.283669, 1, 0, 0.1568628, 1,
1.9246, -0.5426325, 0.3079816, 1, 0, 0.1490196, 1,
1.998329, 1.424589, 0.4496855, 1, 0, 0.145098, 1,
2.01048, 0.5385817, 0.8019364, 1, 0, 0.1372549, 1,
2.042819, 0.9675879, -0.1853324, 1, 0, 0.1333333, 1,
2.069006, -0.8836506, 2.646393, 1, 0, 0.1254902, 1,
2.082938, 0.1331466, 2.987252, 1, 0, 0.1215686, 1,
2.104659, -0.7499741, 1.80753, 1, 0, 0.1137255, 1,
2.107946, -0.8319327, 2.589237, 1, 0, 0.1098039, 1,
2.112747, 1.438584, 1.352656, 1, 0, 0.1019608, 1,
2.121918, 0.02858606, 1.260853, 1, 0, 0.09411765, 1,
2.129592, 1.020965, 1.630159, 1, 0, 0.09019608, 1,
2.15088, 0.4699532, 0.8769166, 1, 0, 0.08235294, 1,
2.212302, -1.047015, 1.753756, 1, 0, 0.07843138, 1,
2.271577, -0.4055004, 2.763416, 1, 0, 0.07058824, 1,
2.273259, -0.9726597, 1.090805, 1, 0, 0.06666667, 1,
2.277115, 0.1650004, 0.4634278, 1, 0, 0.05882353, 1,
2.319076, -2.244231, 1.989391, 1, 0, 0.05490196, 1,
2.424357, 0.03453855, 1.907431, 1, 0, 0.04705882, 1,
2.426789, -0.802001, 0.8627768, 1, 0, 0.04313726, 1,
2.441047, 2.716653, 1.754943, 1, 0, 0.03529412, 1,
2.498985, 0.6334873, 1.838054, 1, 0, 0.03137255, 1,
2.513509, -0.9579099, 0.5959927, 1, 0, 0.02352941, 1,
2.528947, 0.3771524, 0.5953524, 1, 0, 0.01960784, 1,
2.698297, -1.39481, 3.046987, 1, 0, 0.01176471, 1,
3.723029, 0.208262, 2.087337, 1, 0, 0.007843138, 1
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
0.4644318, -4.443842, -7.176097, 0, -0.5, 0.5, 0.5,
0.4644318, -4.443842, -7.176097, 1, -0.5, 0.5, 0.5,
0.4644318, -4.443842, -7.176097, 1, 1.5, 0.5, 0.5,
0.4644318, -4.443842, -7.176097, 0, 1.5, 0.5, 0.5
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
-3.898829, -0.07922721, -7.176097, 0, -0.5, 0.5, 0.5,
-3.898829, -0.07922721, -7.176097, 1, -0.5, 0.5, 0.5,
-3.898829, -0.07922721, -7.176097, 1, 1.5, 0.5, 0.5,
-3.898829, -0.07922721, -7.176097, 0, 1.5, 0.5, 0.5
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
-3.898829, -4.443842, 0.101898, 0, -0.5, 0.5, 0.5,
-3.898829, -4.443842, 0.101898, 1, -0.5, 0.5, 0.5,
-3.898829, -4.443842, 0.101898, 1, 1.5, 0.5, 0.5,
-3.898829, -4.443842, 0.101898, 0, 1.5, 0.5, 0.5
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
-2, -3.436623, -5.49656,
3, -3.436623, -5.49656,
-2, -3.436623, -5.49656,
-2, -3.604493, -5.776483,
-1, -3.436623, -5.49656,
-1, -3.604493, -5.776483,
0, -3.436623, -5.49656,
0, -3.604493, -5.776483,
1, -3.436623, -5.49656,
1, -3.604493, -5.776483,
2, -3.436623, -5.49656,
2, -3.604493, -5.776483,
3, -3.436623, -5.49656,
3, -3.604493, -5.776483
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
-2, -3.940232, -6.336329, 0, -0.5, 0.5, 0.5,
-2, -3.940232, -6.336329, 1, -0.5, 0.5, 0.5,
-2, -3.940232, -6.336329, 1, 1.5, 0.5, 0.5,
-2, -3.940232, -6.336329, 0, 1.5, 0.5, 0.5,
-1, -3.940232, -6.336329, 0, -0.5, 0.5, 0.5,
-1, -3.940232, -6.336329, 1, -0.5, 0.5, 0.5,
-1, -3.940232, -6.336329, 1, 1.5, 0.5, 0.5,
-1, -3.940232, -6.336329, 0, 1.5, 0.5, 0.5,
0, -3.940232, -6.336329, 0, -0.5, 0.5, 0.5,
0, -3.940232, -6.336329, 1, -0.5, 0.5, 0.5,
0, -3.940232, -6.336329, 1, 1.5, 0.5, 0.5,
0, -3.940232, -6.336329, 0, 1.5, 0.5, 0.5,
1, -3.940232, -6.336329, 0, -0.5, 0.5, 0.5,
1, -3.940232, -6.336329, 1, -0.5, 0.5, 0.5,
1, -3.940232, -6.336329, 1, 1.5, 0.5, 0.5,
1, -3.940232, -6.336329, 0, 1.5, 0.5, 0.5,
2, -3.940232, -6.336329, 0, -0.5, 0.5, 0.5,
2, -3.940232, -6.336329, 1, -0.5, 0.5, 0.5,
2, -3.940232, -6.336329, 1, 1.5, 0.5, 0.5,
2, -3.940232, -6.336329, 0, 1.5, 0.5, 0.5,
3, -3.940232, -6.336329, 0, -0.5, 0.5, 0.5,
3, -3.940232, -6.336329, 1, -0.5, 0.5, 0.5,
3, -3.940232, -6.336329, 1, 1.5, 0.5, 0.5,
3, -3.940232, -6.336329, 0, 1.5, 0.5, 0.5
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
-2.891923, -3, -5.49656,
-2.891923, 3, -5.49656,
-2.891923, -3, -5.49656,
-3.059741, -3, -5.776483,
-2.891923, -2, -5.49656,
-3.059741, -2, -5.776483,
-2.891923, -1, -5.49656,
-3.059741, -1, -5.776483,
-2.891923, 0, -5.49656,
-3.059741, 0, -5.776483,
-2.891923, 1, -5.49656,
-3.059741, 1, -5.776483,
-2.891923, 2, -5.49656,
-3.059741, 2, -5.776483,
-2.891923, 3, -5.49656,
-3.059741, 3, -5.776483
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
-3.395376, -3, -6.336329, 0, -0.5, 0.5, 0.5,
-3.395376, -3, -6.336329, 1, -0.5, 0.5, 0.5,
-3.395376, -3, -6.336329, 1, 1.5, 0.5, 0.5,
-3.395376, -3, -6.336329, 0, 1.5, 0.5, 0.5,
-3.395376, -2, -6.336329, 0, -0.5, 0.5, 0.5,
-3.395376, -2, -6.336329, 1, -0.5, 0.5, 0.5,
-3.395376, -2, -6.336329, 1, 1.5, 0.5, 0.5,
-3.395376, -2, -6.336329, 0, 1.5, 0.5, 0.5,
-3.395376, -1, -6.336329, 0, -0.5, 0.5, 0.5,
-3.395376, -1, -6.336329, 1, -0.5, 0.5, 0.5,
-3.395376, -1, -6.336329, 1, 1.5, 0.5, 0.5,
-3.395376, -1, -6.336329, 0, 1.5, 0.5, 0.5,
-3.395376, 0, -6.336329, 0, -0.5, 0.5, 0.5,
-3.395376, 0, -6.336329, 1, -0.5, 0.5, 0.5,
-3.395376, 0, -6.336329, 1, 1.5, 0.5, 0.5,
-3.395376, 0, -6.336329, 0, 1.5, 0.5, 0.5,
-3.395376, 1, -6.336329, 0, -0.5, 0.5, 0.5,
-3.395376, 1, -6.336329, 1, -0.5, 0.5, 0.5,
-3.395376, 1, -6.336329, 1, 1.5, 0.5, 0.5,
-3.395376, 1, -6.336329, 0, 1.5, 0.5, 0.5,
-3.395376, 2, -6.336329, 0, -0.5, 0.5, 0.5,
-3.395376, 2, -6.336329, 1, -0.5, 0.5, 0.5,
-3.395376, 2, -6.336329, 1, 1.5, 0.5, 0.5,
-3.395376, 2, -6.336329, 0, 1.5, 0.5, 0.5,
-3.395376, 3, -6.336329, 0, -0.5, 0.5, 0.5,
-3.395376, 3, -6.336329, 1, -0.5, 0.5, 0.5,
-3.395376, 3, -6.336329, 1, 1.5, 0.5, 0.5,
-3.395376, 3, -6.336329, 0, 1.5, 0.5, 0.5
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
-2.891923, -3.436623, -4,
-2.891923, -3.436623, 4,
-2.891923, -3.436623, -4,
-3.059741, -3.604493, -4,
-2.891923, -3.436623, -2,
-3.059741, -3.604493, -2,
-2.891923, -3.436623, 0,
-3.059741, -3.604493, 0,
-2.891923, -3.436623, 2,
-3.059741, -3.604493, 2,
-2.891923, -3.436623, 4,
-3.059741, -3.604493, 4
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
-3.395376, -3.940232, -4, 0, -0.5, 0.5, 0.5,
-3.395376, -3.940232, -4, 1, -0.5, 0.5, 0.5,
-3.395376, -3.940232, -4, 1, 1.5, 0.5, 0.5,
-3.395376, -3.940232, -4, 0, 1.5, 0.5, 0.5,
-3.395376, -3.940232, -2, 0, -0.5, 0.5, 0.5,
-3.395376, -3.940232, -2, 1, -0.5, 0.5, 0.5,
-3.395376, -3.940232, -2, 1, 1.5, 0.5, 0.5,
-3.395376, -3.940232, -2, 0, 1.5, 0.5, 0.5,
-3.395376, -3.940232, 0, 0, -0.5, 0.5, 0.5,
-3.395376, -3.940232, 0, 1, -0.5, 0.5, 0.5,
-3.395376, -3.940232, 0, 1, 1.5, 0.5, 0.5,
-3.395376, -3.940232, 0, 0, 1.5, 0.5, 0.5,
-3.395376, -3.940232, 2, 0, -0.5, 0.5, 0.5,
-3.395376, -3.940232, 2, 1, -0.5, 0.5, 0.5,
-3.395376, -3.940232, 2, 1, 1.5, 0.5, 0.5,
-3.395376, -3.940232, 2, 0, 1.5, 0.5, 0.5,
-3.395376, -3.940232, 4, 0, -0.5, 0.5, 0.5,
-3.395376, -3.940232, 4, 1, -0.5, 0.5, 0.5,
-3.395376, -3.940232, 4, 1, 1.5, 0.5, 0.5,
-3.395376, -3.940232, 4, 0, 1.5, 0.5, 0.5
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
-2.891923, -3.436623, -5.49656,
-2.891923, 3.278169, -5.49656,
-2.891923, -3.436623, 5.700356,
-2.891923, 3.278169, 5.700356,
-2.891923, -3.436623, -5.49656,
-2.891923, -3.436623, 5.700356,
-2.891923, 3.278169, -5.49656,
-2.891923, 3.278169, 5.700356,
-2.891923, -3.436623, -5.49656,
3.820786, -3.436623, -5.49656,
-2.891923, -3.436623, 5.700356,
3.820786, -3.436623, 5.700356,
-2.891923, 3.278169, -5.49656,
3.820786, 3.278169, -5.49656,
-2.891923, 3.278169, 5.700356,
3.820786, 3.278169, 5.700356,
3.820786, -3.436623, -5.49656,
3.820786, 3.278169, -5.49656,
3.820786, -3.436623, 5.700356,
3.820786, 3.278169, 5.700356,
3.820786, -3.436623, -5.49656,
3.820786, -3.436623, 5.700356,
3.820786, 3.278169, -5.49656,
3.820786, 3.278169, 5.700356
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
var radius = 7.839152;
var distance = 34.87727;
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
mvMatrix.translate( -0.4644318, 0.07922721, -0.101898 );
mvMatrix.scale( 1.262656, 1.262265, 0.7569803 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.87727);
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
benzadox<-read.table("benzadox.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-benzadox$V2
```

```
## Error in eval(expr, envir, enclos): object 'benzadox' not found
```

```r
y<-benzadox$V3
```

```
## Error in eval(expr, envir, enclos): object 'benzadox' not found
```

```r
z<-benzadox$V4
```

```
## Error in eval(expr, envir, enclos): object 'benzadox' not found
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
-2.794165, 0.3331475, -1.74859, 0, 0, 1, 1, 1,
-2.513794, 0.4167731, -1.176052, 1, 0, 0, 1, 1,
-2.380936, 1.529996, -2.655563, 1, 0, 0, 1, 1,
-2.37888, 0.0258101, -1.247167, 1, 0, 0, 1, 1,
-2.33867, 0.2222507, -0.05113447, 1, 0, 0, 1, 1,
-2.317073, -0.2471953, -1.604601, 1, 0, 0, 1, 1,
-2.295703, 0.2081527, -2.64643, 0, 0, 0, 1, 1,
-2.243938, 0.1764556, -2.970296, 0, 0, 0, 1, 1,
-2.224537, 0.946035, -3.162129, 0, 0, 0, 1, 1,
-2.219061, 1.196241, -0.5031386, 0, 0, 0, 1, 1,
-2.201772, -0.9887711, -1.199857, 0, 0, 0, 1, 1,
-2.19392, 0.2885373, -0.1361148, 0, 0, 0, 1, 1,
-2.191834, 0.2824536, -0.7711888, 0, 0, 0, 1, 1,
-2.190481, 1.261389, -1.535528, 1, 1, 1, 1, 1,
-2.183752, -0.4010531, -3.047604, 1, 1, 1, 1, 1,
-2.163502, 0.1908469, -0.7797961, 1, 1, 1, 1, 1,
-2.133388, 0.1888967, -2.366135, 1, 1, 1, 1, 1,
-2.126179, 0.11931, -2.01456, 1, 1, 1, 1, 1,
-2.11362, 0.4047916, -1.64364, 1, 1, 1, 1, 1,
-2.109251, -1.403665, -1.008928, 1, 1, 1, 1, 1,
-2.097403, 1.313048, -1.416341, 1, 1, 1, 1, 1,
-2.055794, -0.5828627, 1.033428, 1, 1, 1, 1, 1,
-2.051515, 0.2137217, -1.555648, 1, 1, 1, 1, 1,
-2.042477, 1.221415, -1.638669, 1, 1, 1, 1, 1,
-2.026248, 0.8877723, 0.7460783, 1, 1, 1, 1, 1,
-2.000539, -0.4772088, -3.218189, 1, 1, 1, 1, 1,
-1.973963, 0.6923511, -1.679558, 1, 1, 1, 1, 1,
-1.969475, 1.238424, -1.21577, 1, 1, 1, 1, 1,
-1.951368, 0.8531718, -1.858883, 0, 0, 1, 1, 1,
-1.925849, -0.5950752, -2.781117, 1, 0, 0, 1, 1,
-1.919977, 1.853059, -1.092332, 1, 0, 0, 1, 1,
-1.900485, 0.5963732, -1.699763, 1, 0, 0, 1, 1,
-1.891859, 0.8828745, -0.7463523, 1, 0, 0, 1, 1,
-1.881222, 0.4185169, -0.9775999, 1, 0, 0, 1, 1,
-1.866093, 0.8104424, -0.9786158, 0, 0, 0, 1, 1,
-1.862844, 1.327918, -3.086265, 0, 0, 0, 1, 1,
-1.860775, 0.8070025, -1.778625, 0, 0, 0, 1, 1,
-1.831572, 0.2784939, -2.903818, 0, 0, 0, 1, 1,
-1.831217, -2.419385, -2.718838, 0, 0, 0, 1, 1,
-1.827822, -0.4117475, -2.694842, 0, 0, 0, 1, 1,
-1.821104, 0.2396253, -0.9411892, 0, 0, 0, 1, 1,
-1.796598, 0.2388815, -0.04090272, 1, 1, 1, 1, 1,
-1.790713, -0.5390781, 0.3607165, 1, 1, 1, 1, 1,
-1.778419, 0.07626454, -1.223648, 1, 1, 1, 1, 1,
-1.776894, -0.8677039, -2.949868, 1, 1, 1, 1, 1,
-1.773805, -0.858137, -0.8041915, 1, 1, 1, 1, 1,
-1.732352, 0.9172205, -2.397936, 1, 1, 1, 1, 1,
-1.705329, -1.254418, -2.472628, 1, 1, 1, 1, 1,
-1.676485, -0.2048471, -1.144572, 1, 1, 1, 1, 1,
-1.670225, -0.9079132, -1.703657, 1, 1, 1, 1, 1,
-1.664607, 0.1291638, 0.03792046, 1, 1, 1, 1, 1,
-1.664589, 0.6478059, 0.1110601, 1, 1, 1, 1, 1,
-1.659275, -1.366803, -2.791657, 1, 1, 1, 1, 1,
-1.650977, 0.3616988, -1.197491, 1, 1, 1, 1, 1,
-1.646151, 0.783762, -2.83707, 1, 1, 1, 1, 1,
-1.640182, -0.05493877, -0.7730005, 1, 1, 1, 1, 1,
-1.63639, 0.2936994, -0.6519404, 0, 0, 1, 1, 1,
-1.625567, 1.246713, -0.3860371, 1, 0, 0, 1, 1,
-1.625318, 0.1451939, -1.135773, 1, 0, 0, 1, 1,
-1.613722, 1.038191, -0.03281272, 1, 0, 0, 1, 1,
-1.601519, -1.265289, -0.9195804, 1, 0, 0, 1, 1,
-1.601266, -0.4277182, -1.496181, 1, 0, 0, 1, 1,
-1.601023, 2.50594, -1.854257, 0, 0, 0, 1, 1,
-1.594485, -1.519037, -2.454403, 0, 0, 0, 1, 1,
-1.58327, 1.383661, -0.09888037, 0, 0, 0, 1, 1,
-1.567207, 1.26067, -0.35102, 0, 0, 0, 1, 1,
-1.559302, -0.2575874, -1.690438, 0, 0, 0, 1, 1,
-1.551004, 1.316278, -1.428179, 0, 0, 0, 1, 1,
-1.549071, 0.3237469, 0.09571245, 0, 0, 0, 1, 1,
-1.53326, 1.621041, -1.01261, 1, 1, 1, 1, 1,
-1.522887, -1.022425, -1.345473, 1, 1, 1, 1, 1,
-1.519278, -0.6530641, -1.343497, 1, 1, 1, 1, 1,
-1.519095, 1.365334, -0.1358013, 1, 1, 1, 1, 1,
-1.502433, -1.651202, -1.564992, 1, 1, 1, 1, 1,
-1.500763, -0.3797574, -2.521484, 1, 1, 1, 1, 1,
-1.498095, -0.9619132, -2.988263, 1, 1, 1, 1, 1,
-1.488694, -1.779948, -1.31877, 1, 1, 1, 1, 1,
-1.473061, -1.996409, -4.378608, 1, 1, 1, 1, 1,
-1.460213, -0.9548287, -2.669885, 1, 1, 1, 1, 1,
-1.450486, -0.07533545, -1.29609, 1, 1, 1, 1, 1,
-1.449213, 1.106037, -2.253457, 1, 1, 1, 1, 1,
-1.439392, 1.031425, 0.3052582, 1, 1, 1, 1, 1,
-1.433895, 0.07742045, -1.289598, 1, 1, 1, 1, 1,
-1.426059, -0.3537482, -1.70627, 1, 1, 1, 1, 1,
-1.422573, 0.1547392, -4.285509, 0, 0, 1, 1, 1,
-1.418237, 1.190584, -0.6354982, 1, 0, 0, 1, 1,
-1.417927, -1.727535, -0.2245673, 1, 0, 0, 1, 1,
-1.416147, 1.251206, 0.2946709, 1, 0, 0, 1, 1,
-1.411325, -0.5916867, -1.284794, 1, 0, 0, 1, 1,
-1.408895, 0.3989683, -1.50199, 1, 0, 0, 1, 1,
-1.404987, -0.8166711, -2.728286, 0, 0, 0, 1, 1,
-1.398744, 0.7429034, -0.2210291, 0, 0, 0, 1, 1,
-1.39041, -0.6371932, -2.176416, 0, 0, 0, 1, 1,
-1.388827, 0.3130929, -0.4703299, 0, 0, 0, 1, 1,
-1.384292, 0.7684452, -0.4807581, 0, 0, 0, 1, 1,
-1.361624, -1.488675, -1.808399, 0, 0, 0, 1, 1,
-1.360983, -0.6636037, 0.05628783, 0, 0, 0, 1, 1,
-1.359016, 0.5345331, -0.9662113, 1, 1, 1, 1, 1,
-1.35781, -0.6643345, -0.2079221, 1, 1, 1, 1, 1,
-1.354125, -0.1878719, -1.429495, 1, 1, 1, 1, 1,
-1.350847, -0.8440979, -3.240228, 1, 1, 1, 1, 1,
-1.34939, 0.3439938, -2.335011, 1, 1, 1, 1, 1,
-1.345003, 0.8315938, -0.4594745, 1, 1, 1, 1, 1,
-1.339739, -1.049853, -4.063497, 1, 1, 1, 1, 1,
-1.337456, 1.789328, -1.170573, 1, 1, 1, 1, 1,
-1.330332, -0.4311866, -3.255537, 1, 1, 1, 1, 1,
-1.329367, -0.9012938, -1.866221, 1, 1, 1, 1, 1,
-1.325549, -0.6049774, -2.591438, 1, 1, 1, 1, 1,
-1.324096, -2.372912, -2.723216, 1, 1, 1, 1, 1,
-1.321641, -1.338896, -4.398256, 1, 1, 1, 1, 1,
-1.320157, -0.5197325, -1.701576, 1, 1, 1, 1, 1,
-1.303944, -0.2677949, -2.398243, 1, 1, 1, 1, 1,
-1.289243, 1.108439, -1.870012, 0, 0, 1, 1, 1,
-1.281341, 2.013261, -1.422713, 1, 0, 0, 1, 1,
-1.277677, 0.5289787, -2.39827, 1, 0, 0, 1, 1,
-1.271077, -0.2577078, -0.7271546, 1, 0, 0, 1, 1,
-1.268864, -1.911756, -3.781257, 1, 0, 0, 1, 1,
-1.264124, -0.6297238, -2.895916, 1, 0, 0, 1, 1,
-1.262436, -0.5517428, -2.598538, 0, 0, 0, 1, 1,
-1.260945, -0.1800603, -1.540051, 0, 0, 0, 1, 1,
-1.260236, 1.664643, -0.2770083, 0, 0, 0, 1, 1,
-1.241991, 1.034006, 0.9811507, 0, 0, 0, 1, 1,
-1.236975, -0.5686753, -1.616397, 0, 0, 0, 1, 1,
-1.234637, -0.2524776, 0.02673283, 0, 0, 0, 1, 1,
-1.232978, -2.483634, -2.427951, 0, 0, 0, 1, 1,
-1.227357, 1.582385, 0.9328744, 1, 1, 1, 1, 1,
-1.212026, -1.074188, -1.340846, 1, 1, 1, 1, 1,
-1.203239, 0.3778382, -1.493106, 1, 1, 1, 1, 1,
-1.194776, 0.3841832, -0.9403796, 1, 1, 1, 1, 1,
-1.191324, -0.9265221, -2.827521, 1, 1, 1, 1, 1,
-1.191086, 1.037612, -1.075648, 1, 1, 1, 1, 1,
-1.182751, 0.4947866, -1.134601, 1, 1, 1, 1, 1,
-1.181774, 1.099565, -1.479469, 1, 1, 1, 1, 1,
-1.179798, 0.2801924, -0.3675606, 1, 1, 1, 1, 1,
-1.174897, -0.009445414, -2.707479, 1, 1, 1, 1, 1,
-1.174059, -0.3252933, -1.841859, 1, 1, 1, 1, 1,
-1.174029, 0.1226922, 0.1049654, 1, 1, 1, 1, 1,
-1.171458, -0.9017645, -3.96624, 1, 1, 1, 1, 1,
-1.163924, 0.0414065, -2.829658, 1, 1, 1, 1, 1,
-1.15723, 1.898481, -1.908444, 1, 1, 1, 1, 1,
-1.156769, -1.330857, -3.83747, 0, 0, 1, 1, 1,
-1.156615, -0.2931092, -2.292205, 1, 0, 0, 1, 1,
-1.148838, 0.7448472, -0.3070028, 1, 0, 0, 1, 1,
-1.146648, -0.9754658, -2.339232, 1, 0, 0, 1, 1,
-1.14306, 0.2977693, -2.068992, 1, 0, 0, 1, 1,
-1.139112, -0.8127075, -2.339009, 1, 0, 0, 1, 1,
-1.133439, -0.02626102, -1.659496, 0, 0, 0, 1, 1,
-1.130736, 0.3254396, -2.037561, 0, 0, 0, 1, 1,
-1.129689, 0.2761836, -2.215673, 0, 0, 0, 1, 1,
-1.125284, -0.8201244, -2.956104, 0, 0, 0, 1, 1,
-1.12374, 0.05017596, -2.396907, 0, 0, 0, 1, 1,
-1.108369, 0.8161178, -0.930786, 0, 0, 0, 1, 1,
-1.106454, -0.1351293, -1.472333, 0, 0, 0, 1, 1,
-1.105566, 1.836588, 0.1533497, 1, 1, 1, 1, 1,
-1.103584, 1.077452, -0.1596176, 1, 1, 1, 1, 1,
-1.101576, 0.4489841, -0.950814, 1, 1, 1, 1, 1,
-1.094802, -1.457171, -3.881536, 1, 1, 1, 1, 1,
-1.091651, -0.7175208, -2.509283, 1, 1, 1, 1, 1,
-1.088061, -0.3874151, -2.12809, 1, 1, 1, 1, 1,
-1.084396, -0.8827768, -3.587559, 1, 1, 1, 1, 1,
-1.076693, 1.232248, 0.9387737, 1, 1, 1, 1, 1,
-1.066029, 0.2553999, -0.4011479, 1, 1, 1, 1, 1,
-1.061325, 0.5044339, -0.7643588, 1, 1, 1, 1, 1,
-1.05437, -0.407663, -2.820896, 1, 1, 1, 1, 1,
-1.041522, -0.4141049, -1.609161, 1, 1, 1, 1, 1,
-1.023135, -1.286418, -2.154557, 1, 1, 1, 1, 1,
-1.013501, 0.7056297, -1.993297, 1, 1, 1, 1, 1,
-1.007212, -0.3719501, -2.522182, 1, 1, 1, 1, 1,
-1.005225, -0.2831421, -2.36639, 0, 0, 1, 1, 1,
-0.996621, -2.273618, -4.909087, 1, 0, 0, 1, 1,
-0.9955971, 0.3067487, 0.5860572, 1, 0, 0, 1, 1,
-0.9954054, -0.294881, -1.520251, 1, 0, 0, 1, 1,
-0.9943499, 1.310063, -0.55549, 1, 0, 0, 1, 1,
-0.9804462, -1.634162, -2.405025, 1, 0, 0, 1, 1,
-0.9763463, -2.274052, -3.096777, 0, 0, 0, 1, 1,
-0.9731935, -1.122054, -3.59896, 0, 0, 0, 1, 1,
-0.972536, 0.4200416, 0.07580913, 0, 0, 0, 1, 1,
-0.9687753, 0.3987138, -1.060812, 0, 0, 0, 1, 1,
-0.9646926, -1.041301, -2.014159, 0, 0, 0, 1, 1,
-0.9608108, 0.3773319, -0.775507, 0, 0, 0, 1, 1,
-0.9582931, 0.6716158, 0.459783, 0, 0, 0, 1, 1,
-0.9547114, -1.036781, -2.868373, 1, 1, 1, 1, 1,
-0.9504398, -1.263307, -2.496136, 1, 1, 1, 1, 1,
-0.9471986, 1.252283, -0.1317166, 1, 1, 1, 1, 1,
-0.9454499, -0.925014, 0.007249366, 1, 1, 1, 1, 1,
-0.9377007, -0.4114637, -1.871126, 1, 1, 1, 1, 1,
-0.930461, -1.888775, -2.479108, 1, 1, 1, 1, 1,
-0.9226126, 0.2021322, 0.7489256, 1, 1, 1, 1, 1,
-0.9163716, -1.566603, -4.417778, 1, 1, 1, 1, 1,
-0.9140228, -2.335765, -3.039125, 1, 1, 1, 1, 1,
-0.9108095, 0.8245025, 1.177978, 1, 1, 1, 1, 1,
-0.8978841, -0.2134356, -1.12602, 1, 1, 1, 1, 1,
-0.8973841, -0.4033627, -1.254418, 1, 1, 1, 1, 1,
-0.8966739, -0.3901753, -0.8283003, 1, 1, 1, 1, 1,
-0.8955, -2.016382, -2.487883, 1, 1, 1, 1, 1,
-0.8856865, -0.6926633, -2.514076, 1, 1, 1, 1, 1,
-0.8847836, -1.403327, -3.918662, 0, 0, 1, 1, 1,
-0.8816735, -0.3638071, -2.518397, 1, 0, 0, 1, 1,
-0.8770071, -0.6159757, -3.031651, 1, 0, 0, 1, 1,
-0.8718414, -0.3829615, -0.8730369, 1, 0, 0, 1, 1,
-0.8672925, 1.546392, -0.52756, 1, 0, 0, 1, 1,
-0.8647808, 0.02382496, -1.306682, 1, 0, 0, 1, 1,
-0.863668, -0.6548182, -2.384601, 0, 0, 0, 1, 1,
-0.8620353, -1.204096, -2.034161, 0, 0, 0, 1, 1,
-0.8573868, 1.56671, -0.05166841, 0, 0, 0, 1, 1,
-0.8567774, 0.7211626, -1.684318, 0, 0, 0, 1, 1,
-0.8469324, 0.08593304, -2.404235, 0, 0, 0, 1, 1,
-0.8458, -0.8929745, -4.779157, 0, 0, 0, 1, 1,
-0.8407079, 0.1191865, -4.142498, 0, 0, 0, 1, 1,
-0.8394006, -0.4906586, -0.5660437, 1, 1, 1, 1, 1,
-0.8324766, -0.01847254, -2.482252, 1, 1, 1, 1, 1,
-0.8264253, -0.06832314, -1.695278, 1, 1, 1, 1, 1,
-0.8235372, 0.5506839, 0.8016068, 1, 1, 1, 1, 1,
-0.8177264, -0.3804942, -2.319318, 1, 1, 1, 1, 1,
-0.8150194, 0.9649529, -0.668256, 1, 1, 1, 1, 1,
-0.8068564, -0.03850393, -2.050603, 1, 1, 1, 1, 1,
-0.8012417, 0.1681544, -2.546719, 1, 1, 1, 1, 1,
-0.7990248, 0.3420595, -2.192429, 1, 1, 1, 1, 1,
-0.793811, 0.1557655, -0.6903495, 1, 1, 1, 1, 1,
-0.7926545, 0.1257043, -2.736497, 1, 1, 1, 1, 1,
-0.7833475, -0.8670747, -2.066348, 1, 1, 1, 1, 1,
-0.7816914, 0.2980466, -1.116024, 1, 1, 1, 1, 1,
-0.7809858, 1.074432, -0.2837001, 1, 1, 1, 1, 1,
-0.7809356, 0.6545452, -1.603307, 1, 1, 1, 1, 1,
-0.7707734, 0.04544025, -2.204624, 0, 0, 1, 1, 1,
-0.7628651, -0.5541514, -1.988364, 1, 0, 0, 1, 1,
-0.7578137, 0.896697, -1.710465, 1, 0, 0, 1, 1,
-0.7558601, -0.04628469, -1.781155, 1, 0, 0, 1, 1,
-0.75528, -0.5285279, -3.576723, 1, 0, 0, 1, 1,
-0.7478201, -1.155076, -1.797807, 1, 0, 0, 1, 1,
-0.7476607, -1.421613, -2.929309, 0, 0, 0, 1, 1,
-0.7466108, 0.1769611, -2.091226, 0, 0, 0, 1, 1,
-0.7427769, -0.7379048, -1.143515, 0, 0, 0, 1, 1,
-0.7426922, 0.4517499, -1.721753, 0, 0, 0, 1, 1,
-0.7419206, -0.5072545, -2.760528, 0, 0, 0, 1, 1,
-0.7411096, -0.1907924, -2.873934, 0, 0, 0, 1, 1,
-0.7410374, 1.040182, -0.2415678, 0, 0, 0, 1, 1,
-0.7366861, 0.2250587, -0.05213892, 1, 1, 1, 1, 1,
-0.7354347, -0.9445401, -1.862866, 1, 1, 1, 1, 1,
-0.7344455, -0.9173717, -2.395835, 1, 1, 1, 1, 1,
-0.7340608, -0.4555856, -3.188784, 1, 1, 1, 1, 1,
-0.7308218, -0.1003304, -2.598019, 1, 1, 1, 1, 1,
-0.725615, 1.466486, 0.3179325, 1, 1, 1, 1, 1,
-0.7227675, -0.6062005, -1.880152, 1, 1, 1, 1, 1,
-0.7200643, -1.649339, -3.811356, 1, 1, 1, 1, 1,
-0.7114837, -0.4707561, -1.566404, 1, 1, 1, 1, 1,
-0.7101198, 1.527365, 0.6373912, 1, 1, 1, 1, 1,
-0.7082127, -1.443809, -2.973169, 1, 1, 1, 1, 1,
-0.7077374, 2.655222, 1.341447, 1, 1, 1, 1, 1,
-0.7046402, 1.032827, -0.7391233, 1, 1, 1, 1, 1,
-0.7021781, -0.4766093, -1.775429, 1, 1, 1, 1, 1,
-0.702105, 0.7897636, 0.1842191, 1, 1, 1, 1, 1,
-0.696147, 0.3754402, -0.3808467, 0, 0, 1, 1, 1,
-0.6919775, 1.538366, 1.741045, 1, 0, 0, 1, 1,
-0.6887168, -0.956568, -1.459425, 1, 0, 0, 1, 1,
-0.6864599, -0.3418356, -2.554877, 1, 0, 0, 1, 1,
-0.6862894, 0.6658903, 0.6323152, 1, 0, 0, 1, 1,
-0.680631, 0.01484911, -1.683932, 1, 0, 0, 1, 1,
-0.6707561, -0.4448803, -3.368032, 0, 0, 0, 1, 1,
-0.6650549, -1.347032, -3.08755, 0, 0, 0, 1, 1,
-0.6642925, -2.091379, -2.698622, 0, 0, 0, 1, 1,
-0.662654, 0.9714794, 1.361284, 0, 0, 0, 1, 1,
-0.660355, 0.7799203, 0.9193198, 0, 0, 0, 1, 1,
-0.6602352, 0.1623207, 0.7183155, 0, 0, 0, 1, 1,
-0.6596758, 1.12075, 0.6607215, 0, 0, 0, 1, 1,
-0.6567829, 0.8729703, -0.02539398, 1, 1, 1, 1, 1,
-0.653986, 0.1986099, -1.285838, 1, 1, 1, 1, 1,
-0.648155, 1.273044, -0.5224578, 1, 1, 1, 1, 1,
-0.6465586, -1.057103, -3.532812, 1, 1, 1, 1, 1,
-0.6441148, -0.8330765, -1.491591, 1, 1, 1, 1, 1,
-0.637145, 0.7242648, -1.606364, 1, 1, 1, 1, 1,
-0.6315922, 0.5584441, 0.5425718, 1, 1, 1, 1, 1,
-0.6277607, 0.1684158, -1.829135, 1, 1, 1, 1, 1,
-0.6195759, -0.9329355, -3.293789, 1, 1, 1, 1, 1,
-0.6121793, -1.033107, -2.790684, 1, 1, 1, 1, 1,
-0.610839, 0.3336147, -0.9798637, 1, 1, 1, 1, 1,
-0.6108308, -1.469358, -3.639435, 1, 1, 1, 1, 1,
-0.6079524, -0.9561265, -2.515242, 1, 1, 1, 1, 1,
-0.6060684, -0.4559548, -3.097079, 1, 1, 1, 1, 1,
-0.6056643, -0.7130107, -2.818337, 1, 1, 1, 1, 1,
-0.6037254, -1.308587, -2.738151, 0, 0, 1, 1, 1,
-0.6024176, 1.879474, 0.5594629, 1, 0, 0, 1, 1,
-0.6019538, 1.510957, 0.3569935, 1, 0, 0, 1, 1,
-0.5965111, -1.221377, -3.734572, 1, 0, 0, 1, 1,
-0.5963047, -0.2803717, -2.824518, 1, 0, 0, 1, 1,
-0.5937633, -0.3737577, -1.942909, 1, 0, 0, 1, 1,
-0.5908099, -0.9461909, -1.818986, 0, 0, 0, 1, 1,
-0.5845159, -0.7102228, -3.283134, 0, 0, 0, 1, 1,
-0.5838395, -0.4733321, -4.362196, 0, 0, 0, 1, 1,
-0.5834994, 0.2617981, -1.316872, 0, 0, 0, 1, 1,
-0.5748519, 0.7258282, -1.588667, 0, 0, 0, 1, 1,
-0.5744318, -1.144307, -2.94647, 0, 0, 0, 1, 1,
-0.5735513, -1.023615, -0.6582417, 0, 0, 0, 1, 1,
-0.5713743, -0.3360196, -1.927988, 1, 1, 1, 1, 1,
-0.5706008, 1.253585, -1.199501, 1, 1, 1, 1, 1,
-0.5593308, -0.2009265, -0.7679921, 1, 1, 1, 1, 1,
-0.5586524, 1.135913, 0.7372336, 1, 1, 1, 1, 1,
-0.5572129, 0.5283636, -1.311432, 1, 1, 1, 1, 1,
-0.5563463, 0.00737307, -2.791236, 1, 1, 1, 1, 1,
-0.5527391, 0.4280379, 0.1825027, 1, 1, 1, 1, 1,
-0.5457664, 0.2667928, -1.989549, 1, 1, 1, 1, 1,
-0.5423435, 1.298671, 0.8201813, 1, 1, 1, 1, 1,
-0.5395432, 0.6042415, 0.364969, 1, 1, 1, 1, 1,
-0.5320442, 0.2026096, -0.003168164, 1, 1, 1, 1, 1,
-0.5309196, 1.268829, -0.6347702, 1, 1, 1, 1, 1,
-0.5282785, 0.1682862, -1.457607, 1, 1, 1, 1, 1,
-0.5265241, 0.05525426, -1.375507, 1, 1, 1, 1, 1,
-0.5257655, 0.2501816, -1.537681, 1, 1, 1, 1, 1,
-0.5227635, -0.7354321, -2.016862, 0, 0, 1, 1, 1,
-0.5214373, 0.7751358, 0.09737488, 1, 0, 0, 1, 1,
-0.5194238, -1.337738, -3.296425, 1, 0, 0, 1, 1,
-0.5169066, -0.9127042, -2.96205, 1, 0, 0, 1, 1,
-0.5126046, -0.7143949, -2.220033, 1, 0, 0, 1, 1,
-0.5113348, -1.147003, -2.612377, 1, 0, 0, 1, 1,
-0.5083253, 0.3583508, -0.9815849, 0, 0, 0, 1, 1,
-0.5077347, -0.6887505, -1.525163, 0, 0, 0, 1, 1,
-0.50698, -0.9209107, -1.396935, 0, 0, 0, 1, 1,
-0.5054862, 0.3745541, -0.5608974, 0, 0, 0, 1, 1,
-0.5051955, -1.673663, -1.431652, 0, 0, 0, 1, 1,
-0.4981143, -2.291616, -3.793791, 0, 0, 0, 1, 1,
-0.4952548, -0.07533942, -0.6203447, 0, 0, 0, 1, 1,
-0.4952454, -0.3691848, -2.399079, 1, 1, 1, 1, 1,
-0.4915233, -0.2742782, -1.587047, 1, 1, 1, 1, 1,
-0.491246, 0.03991844, -3.244564, 1, 1, 1, 1, 1,
-0.4890453, -1.544182, -2.105473, 1, 1, 1, 1, 1,
-0.4804603, -0.7913177, -0.6017, 1, 1, 1, 1, 1,
-0.4711066, 0.4090346, -0.4316587, 1, 1, 1, 1, 1,
-0.4660462, -0.1373592, -2.21449, 1, 1, 1, 1, 1,
-0.4596855, -0.7284918, -3.635838, 1, 1, 1, 1, 1,
-0.4596772, 1.391572, -0.3395441, 1, 1, 1, 1, 1,
-0.4573867, -1.264741, -2.521856, 1, 1, 1, 1, 1,
-0.4554299, 0.000533532, -2.135619, 1, 1, 1, 1, 1,
-0.452762, 0.005327321, 0.05193764, 1, 1, 1, 1, 1,
-0.4523509, -1.181287, -4.119194, 1, 1, 1, 1, 1,
-0.4497936, 0.62928, 0.4542612, 1, 1, 1, 1, 1,
-0.4492794, 1.171432, -0.3056259, 1, 1, 1, 1, 1,
-0.4459046, -0.447884, 0.1031, 0, 0, 1, 1, 1,
-0.4384623, -0.7208079, -2.538999, 1, 0, 0, 1, 1,
-0.4364525, 0.4506967, -1.282895, 1, 0, 0, 1, 1,
-0.4335147, -1.90076, -2.929048, 1, 0, 0, 1, 1,
-0.4318672, -0.7061607, -3.604465, 1, 0, 0, 1, 1,
-0.4297895, 0.9659034, -0.8047981, 1, 0, 0, 1, 1,
-0.4258984, 1.547281, -1.337174, 0, 0, 0, 1, 1,
-0.4255699, 0.8456028, 0.3092237, 0, 0, 0, 1, 1,
-0.4196229, -0.503502, -1.098235, 0, 0, 0, 1, 1,
-0.4159694, -0.9714923, -2.659695, 0, 0, 0, 1, 1,
-0.4159689, 1.086109, -0.7209915, 0, 0, 0, 1, 1,
-0.410777, -1.582803, -2.44807, 0, 0, 0, 1, 1,
-0.4094614, -1.123865, -3.61067, 0, 0, 0, 1, 1,
-0.4078363, -0.9650549, -2.727608, 1, 1, 1, 1, 1,
-0.3983971, -0.2414516, -0.6731184, 1, 1, 1, 1, 1,
-0.3973664, -0.3128817, -1.823544, 1, 1, 1, 1, 1,
-0.3917558, -1.071699, -2.685136, 1, 1, 1, 1, 1,
-0.3904727, 0.1243886, -0.8320671, 1, 1, 1, 1, 1,
-0.3857169, 1.040717, -0.9755943, 1, 1, 1, 1, 1,
-0.3803469, -2.276235, -4.382467, 1, 1, 1, 1, 1,
-0.3789667, 0.7696866, -0.07370044, 1, 1, 1, 1, 1,
-0.3786749, -0.1073978, -1.78983, 1, 1, 1, 1, 1,
-0.3762276, -0.553723, -2.211211, 1, 1, 1, 1, 1,
-0.3719408, 0.7632878, -1.284428, 1, 1, 1, 1, 1,
-0.3654548, -0.7024366, -3.42135, 1, 1, 1, 1, 1,
-0.3627425, -0.9445941, -2.728047, 1, 1, 1, 1, 1,
-0.3606379, 0.03789425, -1.712625, 1, 1, 1, 1, 1,
-0.3570808, -0.4655071, -2.448315, 1, 1, 1, 1, 1,
-0.3568066, 0.1059289, -1.375678, 0, 0, 1, 1, 1,
-0.3556536, 0.03302221, -1.366371, 1, 0, 0, 1, 1,
-0.3479106, 0.9111153, 2.545748, 1, 0, 0, 1, 1,
-0.3426416, -0.1751343, -1.55629, 1, 0, 0, 1, 1,
-0.3407132, -0.7898796, -3.457236, 1, 0, 0, 1, 1,
-0.3386657, 0.1144462, -1.030845, 1, 0, 0, 1, 1,
-0.3318951, -0.1210093, -1.939184, 0, 0, 0, 1, 1,
-0.3306294, -1.314364, -2.296135, 0, 0, 0, 1, 1,
-0.3278262, -0.01084028, -2.012029, 0, 0, 0, 1, 1,
-0.3270191, -1.497142, -4.295522, 0, 0, 0, 1, 1,
-0.3246887, 0.4855299, 0.8641216, 0, 0, 0, 1, 1,
-0.3210302, 3.18038, -0.8429996, 0, 0, 0, 1, 1,
-0.3176669, -0.1876375, -1.566309, 0, 0, 0, 1, 1,
-0.3176379, -1.332617, -2.528205, 1, 1, 1, 1, 1,
-0.3150208, -0.1505289, -1.812708, 1, 1, 1, 1, 1,
-0.3125267, -0.1168541, -1.316072, 1, 1, 1, 1, 1,
-0.3080459, 1.150922, -3.038298, 1, 1, 1, 1, 1,
-0.3070517, -1.110273, -2.426529, 1, 1, 1, 1, 1,
-0.3052239, 0.3149597, -1.009519, 1, 1, 1, 1, 1,
-0.3037892, 2.388343, -0.6371999, 1, 1, 1, 1, 1,
-0.3014675, -0.09525097, -3.2291, 1, 1, 1, 1, 1,
-0.3009312, 0.1692968, 0.9486843, 1, 1, 1, 1, 1,
-0.2994164, -0.613152, -4.361211, 1, 1, 1, 1, 1,
-0.2982629, -0.4611373, -4.217429, 1, 1, 1, 1, 1,
-0.2978841, -1.208694, -2.235757, 1, 1, 1, 1, 1,
-0.2974569, -1.379191, -2.319774, 1, 1, 1, 1, 1,
-0.2962873, 1.637841, 0.725917, 1, 1, 1, 1, 1,
-0.2947071, -2.34489, -4.009884, 1, 1, 1, 1, 1,
-0.2936546, 1.582739, -1.046628, 0, 0, 1, 1, 1,
-0.2929204, 0.04705544, -1.219232, 1, 0, 0, 1, 1,
-0.2920513, 1.028581, 1.440374, 1, 0, 0, 1, 1,
-0.2812818, -0.08252463, -2.262084, 1, 0, 0, 1, 1,
-0.2783259, -1.322874, -2.595669, 1, 0, 0, 1, 1,
-0.2745974, 1.539905, -1.108034, 1, 0, 0, 1, 1,
-0.2738006, -1.617022, -2.623153, 0, 0, 0, 1, 1,
-0.2730192, 0.3205981, 2.491427, 0, 0, 0, 1, 1,
-0.2729636, 0.640477, -0.724453, 0, 0, 0, 1, 1,
-0.2694519, -0.3438379, -4.580768, 0, 0, 0, 1, 1,
-0.2645128, 0.5323849, -0.2690921, 0, 0, 0, 1, 1,
-0.2635307, 1.821179, 0.008376861, 0, 0, 0, 1, 1,
-0.2631571, -0.6584706, -2.421292, 0, 0, 0, 1, 1,
-0.2587799, -0.02391356, -3.304693, 1, 1, 1, 1, 1,
-0.2583107, 0.06241095, 0.6550542, 1, 1, 1, 1, 1,
-0.2572195, -0.08459884, -2.983169, 1, 1, 1, 1, 1,
-0.2568131, 1.490911, 0.7064094, 1, 1, 1, 1, 1,
-0.2528613, 0.9984861, 0.08507335, 1, 1, 1, 1, 1,
-0.2519634, 0.2304953, -0.3430115, 1, 1, 1, 1, 1,
-0.2456291, 0.03752392, -0.3183273, 1, 1, 1, 1, 1,
-0.2423798, -0.5749661, -3.247687, 1, 1, 1, 1, 1,
-0.2416914, 1.782793, -1.177087, 1, 1, 1, 1, 1,
-0.2416291, 0.1366791, -1.153655, 1, 1, 1, 1, 1,
-0.2372959, 1.169039, -0.2425597, 1, 1, 1, 1, 1,
-0.2370245, 0.8733854, 0.6232628, 1, 1, 1, 1, 1,
-0.2367632, 2.027402, -0.5337946, 1, 1, 1, 1, 1,
-0.2365385, -1.489758, -2.203932, 1, 1, 1, 1, 1,
-0.2348927, 0.4562623, -1.216025, 1, 1, 1, 1, 1,
-0.2251839, 0.6192617, 0.9371005, 0, 0, 1, 1, 1,
-0.2222666, 0.2498871, -0.7113495, 1, 0, 0, 1, 1,
-0.2214326, 2.163751, 0.9136639, 1, 0, 0, 1, 1,
-0.2205871, 2.131476, -0.5223271, 1, 0, 0, 1, 1,
-0.2186115, -0.1236308, -1.825558, 1, 0, 0, 1, 1,
-0.2128489, 0.8178458, -1.576086, 1, 0, 0, 1, 1,
-0.2041258, 1.887648, 0.3980943, 0, 0, 0, 1, 1,
-0.2023231, -0.002081666, -2.184931, 0, 0, 0, 1, 1,
-0.2003442, 0.04175011, 0.03407691, 0, 0, 0, 1, 1,
-0.1996228, -1.073811, -3.372082, 0, 0, 0, 1, 1,
-0.1918296, -0.9604668, -3.577443, 0, 0, 0, 1, 1,
-0.1815908, 0.8025447, -0.2161611, 0, 0, 0, 1, 1,
-0.1795949, 0.4246288, -0.1049102, 0, 0, 0, 1, 1,
-0.1791321, -0.03894592, -1.574067, 1, 1, 1, 1, 1,
-0.1778518, -0.5036812, -3.088744, 1, 1, 1, 1, 1,
-0.171228, -0.103318, -2.208453, 1, 1, 1, 1, 1,
-0.1705109, -0.5788118, -2.384895, 1, 1, 1, 1, 1,
-0.1669433, 0.2915742, -0.7625707, 1, 1, 1, 1, 1,
-0.1663462, -1.074703, -4.773114, 1, 1, 1, 1, 1,
-0.1615698, -0.06621252, -2.059402, 1, 1, 1, 1, 1,
-0.1612028, 0.8903329, -1.471444, 1, 1, 1, 1, 1,
-0.1594663, 1.316927, 0.6618453, 1, 1, 1, 1, 1,
-0.1577512, -0.8123927, -3.074818, 1, 1, 1, 1, 1,
-0.1576716, 0.2800921, 0.4897776, 1, 1, 1, 1, 1,
-0.1535457, 0.0457737, -1.356223, 1, 1, 1, 1, 1,
-0.1532468, -0.03558354, -3.147007, 1, 1, 1, 1, 1,
-0.1519517, 1.871741, -0.6477404, 1, 1, 1, 1, 1,
-0.1477221, 0.4150053, 1.551045, 1, 1, 1, 1, 1,
-0.1451224, 0.4456415, 0.2900405, 0, 0, 1, 1, 1,
-0.1446674, 0.04965037, -1.337289, 1, 0, 0, 1, 1,
-0.1439736, -0.3800226, -2.263444, 1, 0, 0, 1, 1,
-0.1397123, -0.6624389, -3.596467, 1, 0, 0, 1, 1,
-0.1385389, 1.299047, 0.6168097, 1, 0, 0, 1, 1,
-0.1369207, 1.626644, -1.606663, 1, 0, 0, 1, 1,
-0.1366331, 0.5125853, -0.9813564, 0, 0, 0, 1, 1,
-0.1360532, 0.5218183, -1.680197, 0, 0, 0, 1, 1,
-0.1328524, 0.1531399, 0.354017, 0, 0, 0, 1, 1,
-0.1250843, -0.1148668, -2.793746, 0, 0, 0, 1, 1,
-0.1244796, 0.2696445, -0.4278382, 0, 0, 0, 1, 1,
-0.123911, 1.104025, 0.613574, 0, 0, 0, 1, 1,
-0.121692, 0.6148087, 0.5493595, 0, 0, 0, 1, 1,
-0.1207875, -2.371808, -3.777377, 1, 1, 1, 1, 1,
-0.1199871, 1.005401, 0.08522826, 1, 1, 1, 1, 1,
-0.110965, 0.06304269, -2.123606, 1, 1, 1, 1, 1,
-0.1094355, -0.03900865, -1.644048, 1, 1, 1, 1, 1,
-0.1092363, -0.1014754, -1.717738, 1, 1, 1, 1, 1,
-0.1076422, -1.109501, -3.672395, 1, 1, 1, 1, 1,
-0.1039734, 0.847114, -2.590905, 1, 1, 1, 1, 1,
-0.1035939, 0.6822972, -0.6603144, 1, 1, 1, 1, 1,
-0.1029089, 1.473247, -0.05766584, 1, 1, 1, 1, 1,
-0.09892572, 1.256784, -0.6773886, 1, 1, 1, 1, 1,
-0.09708654, -0.7769983, -2.903076, 1, 1, 1, 1, 1,
-0.09151278, -0.1343882, -3.490895, 1, 1, 1, 1, 1,
-0.08886765, -0.4336489, -3.96761, 1, 1, 1, 1, 1,
-0.08708855, 1.106357, 0.0285895, 1, 1, 1, 1, 1,
-0.08404692, -1.281096, -1.757501, 1, 1, 1, 1, 1,
-0.08262126, -0.4617763, -2.120989, 0, 0, 1, 1, 1,
-0.08138225, 2.417145, 0.4372778, 1, 0, 0, 1, 1,
-0.07965194, -0.2508654, -3.977545, 1, 0, 0, 1, 1,
-0.07895195, -0.5524731, -2.198258, 1, 0, 0, 1, 1,
-0.07835143, -1.869918, -2.781354, 1, 0, 0, 1, 1,
-0.07767688, 0.7235038, 0.06240543, 1, 0, 0, 1, 1,
-0.07501863, 0.01064579, -2.166161, 0, 0, 0, 1, 1,
-0.07434249, 1.718166, -1.173668, 0, 0, 0, 1, 1,
-0.06850274, 1.059733, 1.111308, 0, 0, 0, 1, 1,
-0.06808791, -3.338835, -2.891937, 0, 0, 0, 1, 1,
-0.0644686, 1.521806, -1.168399, 0, 0, 0, 1, 1,
-0.06306521, -1.237775, -3.789016, 0, 0, 0, 1, 1,
-0.05588491, -0.04496654, -0.8628818, 0, 0, 0, 1, 1,
-0.05263685, -1.668827, -2.193109, 1, 1, 1, 1, 1,
-0.05247909, -1.249024, -3.546883, 1, 1, 1, 1, 1,
-0.04563289, 0.5569018, -0.6057234, 1, 1, 1, 1, 1,
-0.04498563, -1.363235, -4.021589, 1, 1, 1, 1, 1,
-0.04448287, -0.1533073, -1.71877, 1, 1, 1, 1, 1,
-0.03753835, -0.5507529, -3.468972, 1, 1, 1, 1, 1,
-0.03552382, 0.001309975, -0.7785196, 1, 1, 1, 1, 1,
-0.03211901, 2.166478, -1.951027, 1, 1, 1, 1, 1,
-0.03171292, -0.6538258, -2.60164, 1, 1, 1, 1, 1,
-0.03037763, 1.274044, -0.2575729, 1, 1, 1, 1, 1,
-0.02503455, 0.2371537, 0.1221126, 1, 1, 1, 1, 1,
-0.02397902, -2.800653, -5.333498, 1, 1, 1, 1, 1,
-0.02354157, 0.7622848, -0.2654701, 1, 1, 1, 1, 1,
-0.01799964, -0.401221, -1.85445, 1, 1, 1, 1, 1,
-0.01716356, 0.3514496, -1.240626, 1, 1, 1, 1, 1,
-0.01670178, 2.164061, 0.2843882, 0, 0, 1, 1, 1,
-0.01669703, 0.09763493, 2.068123, 1, 0, 0, 1, 1,
-0.007037557, -0.6996205, -1.325662, 1, 0, 0, 1, 1,
-0.0005294118, -1.117235, -3.474825, 1, 0, 0, 1, 1,
0.008923567, 0.2534956, -1.034144, 1, 0, 0, 1, 1,
0.01127803, -1.457574, 3.232097, 1, 0, 0, 1, 1,
0.01263575, -1.231295, 3.48621, 0, 0, 0, 1, 1,
0.01275909, 0.4586861, -0.3680081, 0, 0, 0, 1, 1,
0.01791271, -0.2689212, 2.971383, 0, 0, 0, 1, 1,
0.01805134, -0.3278469, 2.318138, 0, 0, 0, 1, 1,
0.02609081, -0.9942195, 2.665879, 0, 0, 0, 1, 1,
0.02755343, -0.109286, 2.263231, 0, 0, 0, 1, 1,
0.02982005, 0.741711, -0.3250269, 0, 0, 0, 1, 1,
0.03336501, 1.552301, 0.550573, 1, 1, 1, 1, 1,
0.03356501, -0.2647496, 1.152498, 1, 1, 1, 1, 1,
0.03559347, 0.1193919, 0.8148968, 1, 1, 1, 1, 1,
0.03834847, 1.569086, -0.362311, 1, 1, 1, 1, 1,
0.03871903, -0.1252079, 2.866677, 1, 1, 1, 1, 1,
0.04311375, 1.465518, -0.546193, 1, 1, 1, 1, 1,
0.04381848, 0.9376298, 0.2236027, 1, 1, 1, 1, 1,
0.04569999, -0.9493114, 1.913917, 1, 1, 1, 1, 1,
0.04662085, 0.3172317, -0.1656997, 1, 1, 1, 1, 1,
0.05106369, 0.2557591, 0.4211726, 1, 1, 1, 1, 1,
0.05169642, -0.3946113, 1.254441, 1, 1, 1, 1, 1,
0.0541329, 0.4691844, 0.0005951722, 1, 1, 1, 1, 1,
0.05553472, -0.1443236, 1.086888, 1, 1, 1, 1, 1,
0.05574467, 0.4176201, -0.4889863, 1, 1, 1, 1, 1,
0.05948187, -0.2956589, 1.744619, 1, 1, 1, 1, 1,
0.0599596, 0.775621, -0.1693447, 0, 0, 1, 1, 1,
0.06923013, -1.097714, 0.6183127, 1, 0, 0, 1, 1,
0.07064389, -0.6015244, 2.335736, 1, 0, 0, 1, 1,
0.07210421, 0.00826841, 0.8765172, 1, 0, 0, 1, 1,
0.07243989, 1.176264, 0.1367146, 1, 0, 0, 1, 1,
0.07312282, 0.2441585, -0.6858905, 1, 0, 0, 1, 1,
0.07554763, -0.9960151, 5.537294, 0, 0, 0, 1, 1,
0.07774721, -0.6595925, 2.802628, 0, 0, 0, 1, 1,
0.08278206, -1.446679, 2.925988, 0, 0, 0, 1, 1,
0.0831585, 1.323166, 0.09697515, 0, 0, 0, 1, 1,
0.08787344, -0.4693854, 1.788906, 0, 0, 0, 1, 1,
0.08897044, -1.512231, 3.906735, 0, 0, 0, 1, 1,
0.0907117, 0.120969, 1.280666, 0, 0, 0, 1, 1,
0.09165622, 0.2142812, 1.74816, 1, 1, 1, 1, 1,
0.09380123, -1.581239, 4.58586, 1, 1, 1, 1, 1,
0.09473044, -1.2759, 3.537788, 1, 1, 1, 1, 1,
0.09607171, -0.3466064, 2.952529, 1, 1, 1, 1, 1,
0.09733104, -0.2553316, 5.501181, 1, 1, 1, 1, 1,
0.09832207, -1.089978, 5.102882, 1, 1, 1, 1, 1,
0.09937995, -0.928783, 2.395023, 1, 1, 1, 1, 1,
0.1010902, 1.038437, 0.7536883, 1, 1, 1, 1, 1,
0.1177424, -0.3969292, 2.064248, 1, 1, 1, 1, 1,
0.1224751, -0.9683709, 2.973317, 1, 1, 1, 1, 1,
0.1261799, 0.3370145, -0.6205117, 1, 1, 1, 1, 1,
0.1294784, 0.009309351, -0.2773047, 1, 1, 1, 1, 1,
0.1299959, 0.4841703, -0.4857967, 1, 1, 1, 1, 1,
0.133091, 0.1922175, 0.3312893, 1, 1, 1, 1, 1,
0.1394707, -1.283001, 2.967182, 1, 1, 1, 1, 1,
0.1406716, -0.4827121, 1.748292, 0, 0, 1, 1, 1,
0.1439066, 0.4254468, -0.7129842, 1, 0, 0, 1, 1,
0.144452, -0.647109, 5.137232, 1, 0, 0, 1, 1,
0.1446764, -0.351925, 3.534686, 1, 0, 0, 1, 1,
0.1525952, -0.712284, 2.430016, 1, 0, 0, 1, 1,
0.1532242, -0.3210795, 3.598398, 1, 0, 0, 1, 1,
0.1589048, 1.382329, -0.04785981, 0, 0, 0, 1, 1,
0.160365, 0.8516657, 1.999819, 0, 0, 0, 1, 1,
0.160569, -0.4654711, 3.123697, 0, 0, 0, 1, 1,
0.1638356, -1.726712, 2.999769, 0, 0, 0, 1, 1,
0.1677482, -0.7074426, 3.379983, 0, 0, 0, 1, 1,
0.1679131, -0.1196366, 2.159514, 0, 0, 0, 1, 1,
0.1706534, 0.8007877, -0.2520192, 0, 0, 0, 1, 1,
0.1707273, -0.129451, 0.4377346, 1, 1, 1, 1, 1,
0.1718636, 0.6892741, -0.08916464, 1, 1, 1, 1, 1,
0.1718728, -0.2434862, 2.876183, 1, 1, 1, 1, 1,
0.1755783, -1.726692, 3.616384, 1, 1, 1, 1, 1,
0.1776354, -0.04860042, 1.487228, 1, 1, 1, 1, 1,
0.1782968, 1.123672, -1.729011, 1, 1, 1, 1, 1,
0.1783643, 1.334444, 1.728563, 1, 1, 1, 1, 1,
0.182735, 0.9200665, -0.3287791, 1, 1, 1, 1, 1,
0.1832375, 0.5200747, 1.062496, 1, 1, 1, 1, 1,
0.192592, 1.29717, 1.028963, 1, 1, 1, 1, 1,
0.1949275, -0.5511318, 2.23263, 1, 1, 1, 1, 1,
0.1972254, -0.6025133, 2.526153, 1, 1, 1, 1, 1,
0.1981884, -0.4220984, 4.027462, 1, 1, 1, 1, 1,
0.1992984, -0.3700623, 2.056041, 1, 1, 1, 1, 1,
0.1999453, 0.357262, 0.1467054, 1, 1, 1, 1, 1,
0.2052248, -0.447564, 1.925728, 0, 0, 1, 1, 1,
0.2130716, 0.160982, 1.845077, 1, 0, 0, 1, 1,
0.2164614, -0.992108, 2.419957, 1, 0, 0, 1, 1,
0.2170946, 0.2421383, 1.394878, 1, 0, 0, 1, 1,
0.2172022, 0.1395482, 1.349106, 1, 0, 0, 1, 1,
0.2268139, 0.9336319, 0.6204379, 1, 0, 0, 1, 1,
0.226962, 0.8197739, -0.1126962, 0, 0, 0, 1, 1,
0.2320736, 1.638017, -0.2282214, 0, 0, 0, 1, 1,
0.2330669, 0.2269494, -0.450679, 0, 0, 0, 1, 1,
0.2350928, -1.942192, 2.671913, 0, 0, 0, 1, 1,
0.2377539, -0.1113033, 2.292551, 0, 0, 0, 1, 1,
0.2387367, -1.229462, 4.592629, 0, 0, 0, 1, 1,
0.2418779, 2.095211, -0.8565169, 0, 0, 0, 1, 1,
0.2443839, -0.5562275, 2.242749, 1, 1, 1, 1, 1,
0.2455385, -2.380291, 1.649435, 1, 1, 1, 1, 1,
0.2478836, -0.1471739, 0.6998002, 1, 1, 1, 1, 1,
0.2497639, 0.4317537, 0.5984067, 1, 1, 1, 1, 1,
0.2523892, -1.160938, 1.262384, 1, 1, 1, 1, 1,
0.2563367, 0.7615517, -1.739134, 1, 1, 1, 1, 1,
0.2590295, 0.7601972, 2.023336, 1, 1, 1, 1, 1,
0.2591092, 0.1032193, 0.7826142, 1, 1, 1, 1, 1,
0.2595533, -1.264632, 2.380125, 1, 1, 1, 1, 1,
0.2613681, -2.119178, 1.711684, 1, 1, 1, 1, 1,
0.2666364, -0.2259066, 2.119542, 1, 1, 1, 1, 1,
0.2667884, -0.3884475, 3.582819, 1, 1, 1, 1, 1,
0.2676696, 1.759155, 1.050905, 1, 1, 1, 1, 1,
0.2722771, -1.560171, 2.271215, 1, 1, 1, 1, 1,
0.2730928, 0.2239116, 0.2367823, 1, 1, 1, 1, 1,
0.279486, -1.167665, 1.440161, 0, 0, 1, 1, 1,
0.2800601, -0.08615924, 1.755215, 1, 0, 0, 1, 1,
0.2828807, 0.694726, 1.70694, 1, 0, 0, 1, 1,
0.2830238, -2.423765, 2.532898, 1, 0, 0, 1, 1,
0.2861045, -2.250049, 3.322613, 1, 0, 0, 1, 1,
0.2901409, -0.7541908, 2.937381, 1, 0, 0, 1, 1,
0.2905417, 0.7582635, -0.5510126, 0, 0, 0, 1, 1,
0.2909824, -1.125365, 2.746949, 0, 0, 0, 1, 1,
0.2924822, 0.9459863, 0.7335517, 0, 0, 0, 1, 1,
0.3000961, 0.05301242, -1.327945, 0, 0, 0, 1, 1,
0.3028854, -1.21122, 3.071853, 0, 0, 0, 1, 1,
0.3060737, -1.204927, 2.086184, 0, 0, 0, 1, 1,
0.3085175, 0.4052987, 1.941254, 0, 0, 0, 1, 1,
0.3108503, 0.7150252, -0.373748, 1, 1, 1, 1, 1,
0.3112314, 0.2883861, 1.409588, 1, 1, 1, 1, 1,
0.317635, 0.515182, 1.357987, 1, 1, 1, 1, 1,
0.3177608, -0.5433255, 3.164326, 1, 1, 1, 1, 1,
0.3230851, 0.9858618, 0.6401693, 1, 1, 1, 1, 1,
0.3281351, 1.481485, -1.301076, 1, 1, 1, 1, 1,
0.3311659, 0.7074377, 0.5419791, 1, 1, 1, 1, 1,
0.3321674, -1.710799, 3.207206, 1, 1, 1, 1, 1,
0.3370419, -0.3744928, 0.7002757, 1, 1, 1, 1, 1,
0.3371301, 0.1843409, 2.303847, 1, 1, 1, 1, 1,
0.340482, 0.277577, 1.290158, 1, 1, 1, 1, 1,
0.3422171, 1.627127, 0.7711651, 1, 1, 1, 1, 1,
0.3528182, 0.1863842, 0.5669566, 1, 1, 1, 1, 1,
0.3556137, -1.31209, 4.194797, 1, 1, 1, 1, 1,
0.3585807, 0.9761928, 0.5886865, 1, 1, 1, 1, 1,
0.3591613, 0.6974535, 0.1474288, 0, 0, 1, 1, 1,
0.3607367, -0.7691601, 1.734245, 1, 0, 0, 1, 1,
0.3646338, -1.135416, 2.179526, 1, 0, 0, 1, 1,
0.3683541, -0.6352881, 3.128831, 1, 0, 0, 1, 1,
0.3700844, 1.749831, 1.013657, 1, 0, 0, 1, 1,
0.3701954, 1.58835, 0.06288281, 1, 0, 0, 1, 1,
0.3720353, 0.07507296, 0.3961102, 0, 0, 0, 1, 1,
0.3743129, 0.863372, -0.7176433, 0, 0, 0, 1, 1,
0.3747911, -0.01719883, 2.469285, 0, 0, 0, 1, 1,
0.3791039, -1.210847, 3.477971, 0, 0, 0, 1, 1,
0.3833052, 1.144633, 1.030642, 0, 0, 0, 1, 1,
0.3859947, 0.945109, 0.1692355, 0, 0, 0, 1, 1,
0.3866233, -2.310445, 2.630753, 0, 0, 0, 1, 1,
0.388035, 1.257459, -0.4696579, 1, 1, 1, 1, 1,
0.3894231, -1.515645, 2.118289, 1, 1, 1, 1, 1,
0.3934612, -0.1660746, 1.399722, 1, 1, 1, 1, 1,
0.3941635, -0.434528, 2.449606, 1, 1, 1, 1, 1,
0.396499, -0.0809761, 3.272811, 1, 1, 1, 1, 1,
0.3968133, -1.515727, 1.9611, 1, 1, 1, 1, 1,
0.4002025, 1.369789, 0.1952499, 1, 1, 1, 1, 1,
0.4008011, -1.479611, 3.94298, 1, 1, 1, 1, 1,
0.4062493, -1.040834, 2.94825, 1, 1, 1, 1, 1,
0.4094771, -0.9491228, 1.963294, 1, 1, 1, 1, 1,
0.4104217, 0.2750493, 1.695358, 1, 1, 1, 1, 1,
0.4151098, 0.4098962, 1.61932, 1, 1, 1, 1, 1,
0.4163122, 2.818139, 0.5428866, 1, 1, 1, 1, 1,
0.4180732, 0.7013713, 1.427559, 1, 1, 1, 1, 1,
0.424208, 1.689821, 0.6397879, 1, 1, 1, 1, 1,
0.4250563, -0.7644929, 2.182787, 0, 0, 1, 1, 1,
0.4281574, 0.4810436, 0.2871159, 1, 0, 0, 1, 1,
0.4370907, 0.3597832, 1.914714, 1, 0, 0, 1, 1,
0.4445819, -1.44969, 3.324027, 1, 0, 0, 1, 1,
0.4460062, 0.1710444, -0.310392, 1, 0, 0, 1, 1,
0.4530373, -0.3108144, 0.6675454, 1, 0, 0, 1, 1,
0.4608536, -0.7591063, 1.901834, 0, 0, 0, 1, 1,
0.4609444, 0.7862906, 0.5451906, 0, 0, 0, 1, 1,
0.4629036, 2.200153, 0.1324368, 0, 0, 0, 1, 1,
0.4745153, 0.2898774, 1.198392, 0, 0, 0, 1, 1,
0.4844733, -0.5133571, 2.586907, 0, 0, 0, 1, 1,
0.4886727, -0.2724557, 2.692292, 0, 0, 0, 1, 1,
0.4903684, 0.05547196, 1.054192, 0, 0, 0, 1, 1,
0.4913755, 0.4251098, 0.8587248, 1, 1, 1, 1, 1,
0.4963914, 0.625735, 0.5199918, 1, 1, 1, 1, 1,
0.500746, 0.2622182, 1.321512, 1, 1, 1, 1, 1,
0.5129356, -1.058082, 3.743712, 1, 1, 1, 1, 1,
0.5147938, -0.08074471, 2.014445, 1, 1, 1, 1, 1,
0.5153343, -1.445083, 2.058895, 1, 1, 1, 1, 1,
0.5255196, 0.6453641, 0.7069196, 1, 1, 1, 1, 1,
0.5309064, -1.930531, 3.75409, 1, 1, 1, 1, 1,
0.5390809, 0.8634565, 0.4830526, 1, 1, 1, 1, 1,
0.5412217, 0.6364202, 0.5386164, 1, 1, 1, 1, 1,
0.5521581, 0.841645, 0.5548235, 1, 1, 1, 1, 1,
0.5542426, -1.436626, 3.038771, 1, 1, 1, 1, 1,
0.5592213, 1.215525, -0.5153899, 1, 1, 1, 1, 1,
0.5622964, -0.501549, 2.977018, 1, 1, 1, 1, 1,
0.5687754, -0.5487331, 3.395984, 1, 1, 1, 1, 1,
0.571492, 0.5281842, 1.077836, 0, 0, 1, 1, 1,
0.5757671, 0.688176, 0.6183304, 1, 0, 0, 1, 1,
0.5779873, -0.4937382, 3.562713, 1, 0, 0, 1, 1,
0.5782681, -1.382435, 2.973969, 1, 0, 0, 1, 1,
0.5837486, -1.666365, 2.125199, 1, 0, 0, 1, 1,
0.5877559, -0.4903578, 2.889648, 1, 0, 0, 1, 1,
0.5929276, 0.3657251, 1.105082, 0, 0, 0, 1, 1,
0.5935943, -0.4442102, 3.75549, 0, 0, 0, 1, 1,
0.5953298, 0.009284423, 0.7652103, 0, 0, 0, 1, 1,
0.5961862, 0.006117956, 2.741745, 0, 0, 0, 1, 1,
0.6000296, -0.6322024, 3.83293, 0, 0, 0, 1, 1,
0.6012894, -0.08450819, -0.2454299, 0, 0, 0, 1, 1,
0.6017783, 0.9304273, 0.9714415, 0, 0, 0, 1, 1,
0.6054244, 1.206147, 0.0800551, 1, 1, 1, 1, 1,
0.6060823, -0.04904246, -0.3502637, 1, 1, 1, 1, 1,
0.6066306, -2.107439, 3.612022, 1, 1, 1, 1, 1,
0.6078154, -0.4456289, 1.069897, 1, 1, 1, 1, 1,
0.6088347, -0.4087793, 2.539955, 1, 1, 1, 1, 1,
0.610832, -0.743172, 1.52444, 1, 1, 1, 1, 1,
0.615658, -0.7224541, 3.314647, 1, 1, 1, 1, 1,
0.6181996, 0.2190209, 0.4777594, 1, 1, 1, 1, 1,
0.6284333, -0.9965248, 2.972051, 1, 1, 1, 1, 1,
0.6295098, -0.8342305, 1.731097, 1, 1, 1, 1, 1,
0.6348442, -0.3624821, 2.318743, 1, 1, 1, 1, 1,
0.6359603, 0.835661, 1.092874, 1, 1, 1, 1, 1,
0.6380997, -0.3296001, 0.6223511, 1, 1, 1, 1, 1,
0.6384122, -0.1309867, 0.5785395, 1, 1, 1, 1, 1,
0.6415823, 0.3968548, 0.7726429, 1, 1, 1, 1, 1,
0.6512055, -1.528321, 2.675342, 0, 0, 1, 1, 1,
0.6551365, -0.1540552, 0.9965252, 1, 0, 0, 1, 1,
0.657814, 1.919481, 0.9982706, 1, 0, 0, 1, 1,
0.6582896, -1.151046, 2.585149, 1, 0, 0, 1, 1,
0.6591997, 0.423225, 0.4922499, 1, 0, 0, 1, 1,
0.6597012, -1.144529, 1.869646, 1, 0, 0, 1, 1,
0.6615635, 0.2190553, 0.1354004, 0, 0, 0, 1, 1,
0.6651399, -0.3489456, 2.535557, 0, 0, 0, 1, 1,
0.6661767, -1.319085, 1.732484, 0, 0, 0, 1, 1,
0.6668693, 1.925555, -0.4533737, 0, 0, 0, 1, 1,
0.6764756, -0.5382814, 3.836943, 0, 0, 0, 1, 1,
0.6783054, 0.2279397, 1.426432, 0, 0, 0, 1, 1,
0.6786992, 1.325491, 0.2014343, 0, 0, 0, 1, 1,
0.6811132, -1.06843, 3.426221, 1, 1, 1, 1, 1,
0.6845863, 0.691913, 0.9989462, 1, 1, 1, 1, 1,
0.6846601, 1.098885, 0.09320539, 1, 1, 1, 1, 1,
0.6847665, -0.1032735, 1.652995, 1, 1, 1, 1, 1,
0.6857234, -1.138387, 2.296564, 1, 1, 1, 1, 1,
0.6902581, -0.8184147, 4.313198, 1, 1, 1, 1, 1,
0.6940023, -0.9163099, 3.296096, 1, 1, 1, 1, 1,
0.6948041, -0.2458714, 2.855272, 1, 1, 1, 1, 1,
0.6952459, -0.2713865, 2.274314, 1, 1, 1, 1, 1,
0.6961682, 0.3347905, 1.223992, 1, 1, 1, 1, 1,
0.6966118, 0.3640202, 0.9622906, 1, 1, 1, 1, 1,
0.7037587, 0.1917104, 0.06604336, 1, 1, 1, 1, 1,
0.7050652, 0.2198918, 1.201813, 1, 1, 1, 1, 1,
0.7132185, 1.351527, 0.1836499, 1, 1, 1, 1, 1,
0.7165819, -1.602448, 2.351056, 1, 1, 1, 1, 1,
0.7175031, 0.07035507, 1.670281, 0, 0, 1, 1, 1,
0.7180743, 0.3375053, 1.099192, 1, 0, 0, 1, 1,
0.7194043, -0.8452282, 1.779136, 1, 0, 0, 1, 1,
0.7194465, 1.080317, -0.04446332, 1, 0, 0, 1, 1,
0.7228388, -0.2544754, 2.728878, 1, 0, 0, 1, 1,
0.7264792, -1.518836, 1.954556, 1, 0, 0, 1, 1,
0.7268035, -1.60166, 2.047869, 0, 0, 0, 1, 1,
0.7281943, -1.516274, 3.394992, 0, 0, 0, 1, 1,
0.7390245, -0.1580292, 1.825942, 0, 0, 0, 1, 1,
0.7394406, 0.8707221, 0.3393309, 0, 0, 0, 1, 1,
0.7434157, -2.082613, 4.523575, 0, 0, 0, 1, 1,
0.7467966, 0.6643541, -0.9295904, 0, 0, 0, 1, 1,
0.7474285, -0.438866, -0.09982306, 0, 0, 0, 1, 1,
0.7500114, 1.623311, 0.9856583, 1, 1, 1, 1, 1,
0.7516679, 1.714177, 0.2708548, 1, 1, 1, 1, 1,
0.7518445, -0.7220091, 1.681311, 1, 1, 1, 1, 1,
0.7538996, -1.542714, 2.700379, 1, 1, 1, 1, 1,
0.7627663, 0.606696, 0.231034, 1, 1, 1, 1, 1,
0.7634956, 0.9968022, 0.1366471, 1, 1, 1, 1, 1,
0.7655693, -1.019392, 3.260549, 1, 1, 1, 1, 1,
0.7697756, 0.6225113, -0.714098, 1, 1, 1, 1, 1,
0.7699479, 1.07472, 1.010257, 1, 1, 1, 1, 1,
0.7701179, 0.8249479, 3.057265, 1, 1, 1, 1, 1,
0.7726414, -0.5920311, 2.707917, 1, 1, 1, 1, 1,
0.7791467, -0.4826826, 0.7222455, 1, 1, 1, 1, 1,
0.7806021, 0.8474764, 1.394032, 1, 1, 1, 1, 1,
0.7810218, 1.622893, -0.0461988, 1, 1, 1, 1, 1,
0.7839955, -1.50262, 3.139786, 1, 1, 1, 1, 1,
0.7864509, -0.06390405, 2.847754, 0, 0, 1, 1, 1,
0.7887502, 0.0413849, 0.6066073, 1, 0, 0, 1, 1,
0.7925568, 0.2384905, -0.8844436, 1, 0, 0, 1, 1,
0.7956193, -0.8790399, 1.99471, 1, 0, 0, 1, 1,
0.7972347, 1.064826, 0.7641585, 1, 0, 0, 1, 1,
0.8029072, 0.675498, 0.5399861, 1, 0, 0, 1, 1,
0.8038567, 1.071952, 0.9745955, 0, 0, 0, 1, 1,
0.8086578, -1.604025, 1.293844, 0, 0, 0, 1, 1,
0.8091759, -0.8066671, 1.939561, 0, 0, 0, 1, 1,
0.8158304, -1.92397, 1.30465, 0, 0, 0, 1, 1,
0.8163252, 0.3188398, 2.209979, 0, 0, 0, 1, 1,
0.8175786, 0.6017818, -1.527328, 0, 0, 0, 1, 1,
0.8184341, 1.50006, -1.341541, 0, 0, 0, 1, 1,
0.8207111, -0.816739, 2.772296, 1, 1, 1, 1, 1,
0.8233326, 0.1080626, 2.972032, 1, 1, 1, 1, 1,
0.8244225, 2.621384, 1.514142, 1, 1, 1, 1, 1,
0.8252177, -0.1873641, 2.959235, 1, 1, 1, 1, 1,
0.8314662, -0.843696, 3.399588, 1, 1, 1, 1, 1,
0.8443498, -1.6273, 3.491682, 1, 1, 1, 1, 1,
0.8450679, 1.678396, 0.5542204, 1, 1, 1, 1, 1,
0.8464897, -0.4044073, 1.961598, 1, 1, 1, 1, 1,
0.8506312, 1.207749, -0.818125, 1, 1, 1, 1, 1,
0.8537542, -1.100113, 2.196371, 1, 1, 1, 1, 1,
0.8676773, 0.5722558, 1.375492, 1, 1, 1, 1, 1,
0.8686939, -2.502423, 3.23105, 1, 1, 1, 1, 1,
0.8701693, -1.38598, 1.844779, 1, 1, 1, 1, 1,
0.8709295, 0.2661055, 2.776672, 1, 1, 1, 1, 1,
0.8741845, 1.755352, 2.968372, 1, 1, 1, 1, 1,
0.8763325, -1.153595, 2.79881, 0, 0, 1, 1, 1,
0.8786317, 0.5123171, 2.462345, 1, 0, 0, 1, 1,
0.8790908, -0.9044488, 2.868209, 1, 0, 0, 1, 1,
0.8801298, -0.0576385, 3.323841, 1, 0, 0, 1, 1,
0.8830018, 0.2897646, 1.807658, 1, 0, 0, 1, 1,
0.8834929, -2.116999, 3.103967, 1, 0, 0, 1, 1,
0.8886088, -0.5088755, 3.577264, 0, 0, 0, 1, 1,
0.8927324, 1.315583, -0.178136, 0, 0, 0, 1, 1,
0.8949911, 1.074697, 1.528603, 0, 0, 0, 1, 1,
0.8953844, 0.2122289, 0.924861, 0, 0, 0, 1, 1,
0.8973508, 0.006562671, 2.238891, 0, 0, 0, 1, 1,
0.9016422, 0.1496727, 1.23661, 0, 0, 0, 1, 1,
0.9122031, -1.257136, 2.467856, 0, 0, 0, 1, 1,
0.9127808, 0.7167671, 1.576996, 1, 1, 1, 1, 1,
0.9128003, -0.7546909, 1.933001, 1, 1, 1, 1, 1,
0.9147742, -1.148137, 2.010397, 1, 1, 1, 1, 1,
0.9180115, 0.9570811, 0.8477748, 1, 1, 1, 1, 1,
0.9183232, 1.267031, 0.7349757, 1, 1, 1, 1, 1,
0.9194015, -0.7116852, 3.178663, 1, 1, 1, 1, 1,
0.9222518, -1.283711, 3.022849, 1, 1, 1, 1, 1,
0.9228038, 0.1187577, 0.9344138, 1, 1, 1, 1, 1,
0.9237224, -0.3056538, 2.311996, 1, 1, 1, 1, 1,
0.9247208, -0.839233, 2.025489, 1, 1, 1, 1, 1,
0.9257963, -2.259562, 3.157161, 1, 1, 1, 1, 1,
0.9280242, 0.6663386, 0.4630672, 1, 1, 1, 1, 1,
0.9346011, -2.341876, 3.638159, 1, 1, 1, 1, 1,
0.9451154, 0.3653211, 1.570604, 1, 1, 1, 1, 1,
0.9462121, -1.073537, 3.330479, 1, 1, 1, 1, 1,
0.95091, 2.061599, -0.7007823, 0, 0, 1, 1, 1,
0.964323, 1.367846, -1.01695, 1, 0, 0, 1, 1,
0.9672757, 1.441069, -0.2715272, 1, 0, 0, 1, 1,
0.9692492, -0.2331821, 2.881538, 1, 0, 0, 1, 1,
0.9744309, -1.474202, 2.009297, 1, 0, 0, 1, 1,
0.9759833, 1.059922, 1.146757, 1, 0, 0, 1, 1,
0.9786019, 0.5267444, 0.7653186, 0, 0, 0, 1, 1,
0.9831234, -1.022185, 1.309382, 0, 0, 0, 1, 1,
0.9840785, 0.4693645, 0.735851, 0, 0, 0, 1, 1,
0.9917105, 1.131897, 0.6987386, 0, 0, 0, 1, 1,
0.9933406, -0.4542057, 4.234236, 0, 0, 0, 1, 1,
0.9983863, -0.1342233, 2.844433, 0, 0, 0, 1, 1,
0.9993919, 0.6589684, 0.8025146, 0, 0, 0, 1, 1,
1.001353, -0.8104279, 2.526776, 1, 1, 1, 1, 1,
1.007003, -0.6905544, 1.940519, 1, 1, 1, 1, 1,
1.008303, -1.200009, 3.077085, 1, 1, 1, 1, 1,
1.011174, 0.1059084, 2.160082, 1, 1, 1, 1, 1,
1.019094, -1.367751, 1.906149, 1, 1, 1, 1, 1,
1.026542, 0.1339763, 2.743037, 1, 1, 1, 1, 1,
1.02655, -0.08689256, 0.8668752, 1, 1, 1, 1, 1,
1.03297, -0.127613, 0.551378, 1, 1, 1, 1, 1,
1.038459, 1.577113, 0.2168864, 1, 1, 1, 1, 1,
1.045098, 0.9809192, 1.870657, 1, 1, 1, 1, 1,
1.047049, -0.486111, 2.528636, 1, 1, 1, 1, 1,
1.047642, 1.158395, 2.396, 1, 1, 1, 1, 1,
1.051299, 0.4354629, 0.5850587, 1, 1, 1, 1, 1,
1.051472, -0.1433704, 1.236195, 1, 1, 1, 1, 1,
1.065112, 0.3587742, 0.8858489, 1, 1, 1, 1, 1,
1.066177, -0.3368459, 1.72333, 0, 0, 1, 1, 1,
1.067315, 0.1543698, 1.627914, 1, 0, 0, 1, 1,
1.069152, 0.1689438, 1.203052, 1, 0, 0, 1, 1,
1.075881, -0.7930649, 1.998954, 1, 0, 0, 1, 1,
1.078339, -0.8786268, 3.152151, 1, 0, 0, 1, 1,
1.110633, 1.066414, 1.06199, 1, 0, 0, 1, 1,
1.121162, -0.7194916, 2.626784, 0, 0, 0, 1, 1,
1.122841, 0.641961, 2.366318, 0, 0, 0, 1, 1,
1.124331, -0.05258482, 2.225971, 0, 0, 0, 1, 1,
1.125672, 1.364568, 0.4866883, 0, 0, 0, 1, 1,
1.136452, -0.4527443, 1.791994, 0, 0, 0, 1, 1,
1.139414, -2.591028, 2.055645, 0, 0, 0, 1, 1,
1.139521, 1.526868, 0.881828, 0, 0, 0, 1, 1,
1.139795, -0.4945986, 1.434, 1, 1, 1, 1, 1,
1.146865, 0.4775741, 0.1802439, 1, 1, 1, 1, 1,
1.153534, -1.139959, 2.221809, 1, 1, 1, 1, 1,
1.160184, 0.8373548, 0.01653372, 1, 1, 1, 1, 1,
1.161042, 1.007416, 1.518649, 1, 1, 1, 1, 1,
1.164161, -0.826975, 2.41749, 1, 1, 1, 1, 1,
1.171493, -0.1928336, 2.115111, 1, 1, 1, 1, 1,
1.173728, -1.345408, 1.304523, 1, 1, 1, 1, 1,
1.184255, 0.1170787, 1.545636, 1, 1, 1, 1, 1,
1.195261, 0.5606571, 1.49855, 1, 1, 1, 1, 1,
1.197243, -0.2858918, 1.339617, 1, 1, 1, 1, 1,
1.206066, 1.755745, 0.6697766, 1, 1, 1, 1, 1,
1.206288, 0.5765535, 2.832929, 1, 1, 1, 1, 1,
1.207844, -1.096174, 2.572405, 1, 1, 1, 1, 1,
1.209398, 0.7361848, 1.804226, 1, 1, 1, 1, 1,
1.212215, -0.1872932, 1.411389, 0, 0, 1, 1, 1,
1.217018, -1.098054, 2.762002, 1, 0, 0, 1, 1,
1.219269, 1.643058, -0.3651848, 1, 0, 0, 1, 1,
1.221177, -0.2007049, 2.282207, 1, 0, 0, 1, 1,
1.225502, 1.505942, 1.61043, 1, 0, 0, 1, 1,
1.226417, -0.8052019, 1.892648, 1, 0, 0, 1, 1,
1.23238, -0.5564992, 0.9030524, 0, 0, 0, 1, 1,
1.233617, -0.1661176, 2.591053, 0, 0, 0, 1, 1,
1.235594, -0.1767364, 1.994985, 0, 0, 0, 1, 1,
1.241273, 0.2868528, 1.197437, 0, 0, 0, 1, 1,
1.246873, 1.151223, 0.8193679, 0, 0, 0, 1, 1,
1.257125, 1.125739, 1.453774, 0, 0, 0, 1, 1,
1.257956, -1.158203, 2.820484, 0, 0, 0, 1, 1,
1.289388, 0.4749441, 2.423346, 1, 1, 1, 1, 1,
1.297211, 1.354674, 2.615048, 1, 1, 1, 1, 1,
1.30354, 0.7591637, 1.453689, 1, 1, 1, 1, 1,
1.307039, 0.482265, 0.2835012, 1, 1, 1, 1, 1,
1.313774, 0.3880735, 0.6331995, 1, 1, 1, 1, 1,
1.323129, -0.4017763, 0.9407141, 1, 1, 1, 1, 1,
1.329302, -0.8513066, 1.400335, 1, 1, 1, 1, 1,
1.334264, 0.3800202, 0.5256429, 1, 1, 1, 1, 1,
1.339566, -0.9249712, 2.64128, 1, 1, 1, 1, 1,
1.342977, -0.042745, 1.191419, 1, 1, 1, 1, 1,
1.375418, -0.9199919, 1.086503, 1, 1, 1, 1, 1,
1.375538, 1.392721, 1.722837, 1, 1, 1, 1, 1,
1.378211, 1.868544, 0.8132628, 1, 1, 1, 1, 1,
1.380741, 1.042797, -0.4900964, 1, 1, 1, 1, 1,
1.388926, -0.4531921, 2.06023, 1, 1, 1, 1, 1,
1.394715, -0.3456008, 3.178401, 0, 0, 1, 1, 1,
1.398334, 0.3235381, 0.3129236, 1, 0, 0, 1, 1,
1.405729, -1.161803, 4.005852, 1, 0, 0, 1, 1,
1.425231, 1.33076, 1.072227, 1, 0, 0, 1, 1,
1.428235, 0.5203874, 0.9555297, 1, 0, 0, 1, 1,
1.437879, -1.056149, 1.581591, 1, 0, 0, 1, 1,
1.44988, 0.4712264, -0.003502357, 0, 0, 0, 1, 1,
1.457989, 0.6944864, 0.7652228, 0, 0, 0, 1, 1,
1.461519, 0.2134618, 1.29317, 0, 0, 0, 1, 1,
1.462699, -0.3724713, 0.9510661, 0, 0, 0, 1, 1,
1.470358, -2.655582, 1.362812, 0, 0, 0, 1, 1,
1.498239, -1.378379, 3.586829, 0, 0, 0, 1, 1,
1.500821, -0.2738265, -0.1874157, 0, 0, 0, 1, 1,
1.501686, 0.3869485, 0.5298002, 1, 1, 1, 1, 1,
1.513769, -0.9068797, 2.65043, 1, 1, 1, 1, 1,
1.522699, 0.2091374, 3.016047, 1, 1, 1, 1, 1,
1.529792, 1.230837, 1.031393, 1, 1, 1, 1, 1,
1.547818, -0.2811441, 2.018407, 1, 1, 1, 1, 1,
1.550608, 1.946509, 0.9304475, 1, 1, 1, 1, 1,
1.554007, 0.417594, 1.701631, 1, 1, 1, 1, 1,
1.555729, -0.6751711, 2.616189, 1, 1, 1, 1, 1,
1.579548, -0.2861717, 1.925257, 1, 1, 1, 1, 1,
1.583063, 0.5826203, 0.3359842, 1, 1, 1, 1, 1,
1.585402, -1.012709, 1.575418, 1, 1, 1, 1, 1,
1.596455, -0.4054185, 3.498096, 1, 1, 1, 1, 1,
1.615733, 1.209322, 0.9416463, 1, 1, 1, 1, 1,
1.617737, 0.1358778, 2.042954, 1, 1, 1, 1, 1,
1.627717, 0.4187479, 0.6063337, 1, 1, 1, 1, 1,
1.632878, -0.2054711, 0.7445386, 0, 0, 1, 1, 1,
1.647959, -0.6694398, 4.653162, 1, 0, 0, 1, 1,
1.649248, 0.7114445, 0.8858989, 1, 0, 0, 1, 1,
1.665871, 0.04586751, 1.270869, 1, 0, 0, 1, 1,
1.672712, 0.2841951, 1.676419, 1, 0, 0, 1, 1,
1.677098, -1.644982, 2.883321, 1, 0, 0, 1, 1,
1.678499, 0.9054128, 1.10694, 0, 0, 0, 1, 1,
1.68776, -1.76844, 2.654249, 0, 0, 0, 1, 1,
1.688747, 0.4429372, -0.1802559, 0, 0, 0, 1, 1,
1.698904, -0.7249845, 3.056285, 0, 0, 0, 1, 1,
1.716725, 0.2110816, 1.018942, 0, 0, 0, 1, 1,
1.719363, -0.968374, 0.5650008, 0, 0, 0, 1, 1,
1.722641, -1.447971, 2.04038, 0, 0, 0, 1, 1,
1.744806, -0.4147864, -0.5798684, 1, 1, 1, 1, 1,
1.78299, -0.4265341, 2.593047, 1, 1, 1, 1, 1,
1.788985, -0.2619846, 2.661083, 1, 1, 1, 1, 1,
1.812255, 0.7592537, 1.062321, 1, 1, 1, 1, 1,
1.816012, 0.124797, 0.7179815, 1, 1, 1, 1, 1,
1.819128, -0.5683038, 1.783567, 1, 1, 1, 1, 1,
1.821981, -1.381809, -0.231691, 1, 1, 1, 1, 1,
1.854967, -1.412469, 4.020137, 1, 1, 1, 1, 1,
1.912333, -0.973052, 2.637831, 1, 1, 1, 1, 1,
1.924582, 1.697123, 2.283669, 1, 1, 1, 1, 1,
1.9246, -0.5426325, 0.3079816, 1, 1, 1, 1, 1,
1.998329, 1.424589, 0.4496855, 1, 1, 1, 1, 1,
2.01048, 0.5385817, 0.8019364, 1, 1, 1, 1, 1,
2.042819, 0.9675879, -0.1853324, 1, 1, 1, 1, 1,
2.069006, -0.8836506, 2.646393, 1, 1, 1, 1, 1,
2.082938, 0.1331466, 2.987252, 0, 0, 1, 1, 1,
2.104659, -0.7499741, 1.80753, 1, 0, 0, 1, 1,
2.107946, -0.8319327, 2.589237, 1, 0, 0, 1, 1,
2.112747, 1.438584, 1.352656, 1, 0, 0, 1, 1,
2.121918, 0.02858606, 1.260853, 1, 0, 0, 1, 1,
2.129592, 1.020965, 1.630159, 1, 0, 0, 1, 1,
2.15088, 0.4699532, 0.8769166, 0, 0, 0, 1, 1,
2.212302, -1.047015, 1.753756, 0, 0, 0, 1, 1,
2.271577, -0.4055004, 2.763416, 0, 0, 0, 1, 1,
2.273259, -0.9726597, 1.090805, 0, 0, 0, 1, 1,
2.277115, 0.1650004, 0.4634278, 0, 0, 0, 1, 1,
2.319076, -2.244231, 1.989391, 0, 0, 0, 1, 1,
2.424357, 0.03453855, 1.907431, 0, 0, 0, 1, 1,
2.426789, -0.802001, 0.8627768, 1, 1, 1, 1, 1,
2.441047, 2.716653, 1.754943, 1, 1, 1, 1, 1,
2.498985, 0.6334873, 1.838054, 1, 1, 1, 1, 1,
2.513509, -0.9579099, 0.5959927, 1, 1, 1, 1, 1,
2.528947, 0.3771524, 0.5953524, 1, 1, 1, 1, 1,
2.698297, -1.39481, 3.046987, 1, 1, 1, 1, 1,
3.723029, 0.208262, 2.087337, 1, 1, 1, 1, 1
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
var radius = 9.695876;
var distance = 34.05635;
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
mvMatrix.translate( -0.4644318, 0.07922721, -0.101898 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.05635);
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
