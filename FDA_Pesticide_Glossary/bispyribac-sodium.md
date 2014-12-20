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
-2.788243, -0.4300851, -1.754825, 1, 0, 0, 1,
-2.735705, -0.7030977, -3.317763, 1, 0.007843138, 0, 1,
-2.667815, -0.1564828, -0.4283505, 1, 0.01176471, 0, 1,
-2.579687, 0.3896882, -0.8555669, 1, 0.01960784, 0, 1,
-2.544022, 0.4007024, -1.616903, 1, 0.02352941, 0, 1,
-2.448903, -0.2706956, -1.152838, 1, 0.03137255, 0, 1,
-2.410916, -1.380288, -2.190036, 1, 0.03529412, 0, 1,
-2.407802, -0.1001396, -2.749466, 1, 0.04313726, 0, 1,
-2.25238, -0.8047299, -0.939748, 1, 0.04705882, 0, 1,
-2.250117, -0.007247239, -1.378888, 1, 0.05490196, 0, 1,
-2.231808, 1.084332, -2.016049, 1, 0.05882353, 0, 1,
-2.190371, -0.01244016, -0.873286, 1, 0.06666667, 0, 1,
-2.147204, -0.4578017, 0.7911578, 1, 0.07058824, 0, 1,
-2.129785, 0.6296258, -1.52272, 1, 0.07843138, 0, 1,
-2.110909, 0.1354289, -1.984789, 1, 0.08235294, 0, 1,
-2.100928, 0.08794031, -0.3499923, 1, 0.09019608, 0, 1,
-2.100526, 1.918073, -2.134973, 1, 0.09411765, 0, 1,
-2.093026, 0.1558265, -3.178692, 1, 0.1019608, 0, 1,
-2.064509, -0.1308374, -1.981449, 1, 0.1098039, 0, 1,
-2.01159, 0.3938347, 0.34563, 1, 0.1137255, 0, 1,
-1.948612, -1.154842, -2.359439, 1, 0.1215686, 0, 1,
-1.940003, -1.156367, -1.374084, 1, 0.1254902, 0, 1,
-1.93894, -0.3794723, -1.083751, 1, 0.1333333, 0, 1,
-1.910206, -0.8218914, -2.279517, 1, 0.1372549, 0, 1,
-1.851958, -1.365199, -1.228577, 1, 0.145098, 0, 1,
-1.83641, -0.8665313, -2.131237, 1, 0.1490196, 0, 1,
-1.813926, -0.9405633, -0.6164855, 1, 0.1568628, 0, 1,
-1.8118, -0.7764723, -3.072429, 1, 0.1607843, 0, 1,
-1.808923, -0.6563154, -1.370227, 1, 0.1686275, 0, 1,
-1.806272, -0.5543066, -1.096646, 1, 0.172549, 0, 1,
-1.793521, -0.2310548, -0.03849228, 1, 0.1803922, 0, 1,
-1.764411, -0.1345617, -0.9968334, 1, 0.1843137, 0, 1,
-1.754255, 0.13193, -0.8687392, 1, 0.1921569, 0, 1,
-1.743126, -0.9431157, -1.909932, 1, 0.1960784, 0, 1,
-1.704386, -0.03058917, -2.061731, 1, 0.2039216, 0, 1,
-1.702069, 1.933728, -0.3347908, 1, 0.2117647, 0, 1,
-1.688691, 1.903939, -1.108029, 1, 0.2156863, 0, 1,
-1.687824, 0.6870952, -0.9672554, 1, 0.2235294, 0, 1,
-1.674356, 0.5007188, -0.7367676, 1, 0.227451, 0, 1,
-1.667616, -0.9872009, -2.197534, 1, 0.2352941, 0, 1,
-1.662613, -0.6008818, 0.05980145, 1, 0.2392157, 0, 1,
-1.654433, 0.1550141, -4.982868, 1, 0.2470588, 0, 1,
-1.637182, 0.7800465, -1.12058, 1, 0.2509804, 0, 1,
-1.62483, -1.156085, -1.412214, 1, 0.2588235, 0, 1,
-1.623174, 0.5541463, -1.197367, 1, 0.2627451, 0, 1,
-1.614519, -0.6362036, -0.3155946, 1, 0.2705882, 0, 1,
-1.611056, -1.32191, -1.368702, 1, 0.2745098, 0, 1,
-1.595695, -0.7200211, -2.98096, 1, 0.282353, 0, 1,
-1.584121, 0.2177042, -0.9885665, 1, 0.2862745, 0, 1,
-1.580224, 1.809087, 0.5659862, 1, 0.2941177, 0, 1,
-1.575624, 1.124517, -1.062529, 1, 0.3019608, 0, 1,
-1.574226, -0.9508632, -3.748077, 1, 0.3058824, 0, 1,
-1.571352, -0.2926759, -0.992154, 1, 0.3137255, 0, 1,
-1.56828, 0.5319306, -0.3405792, 1, 0.3176471, 0, 1,
-1.560729, 0.6938757, -1.695853, 1, 0.3254902, 0, 1,
-1.558859, 1.368128, -2.422248, 1, 0.3294118, 0, 1,
-1.552864, 0.6529039, -2.204825, 1, 0.3372549, 0, 1,
-1.551465, -1.815939, -1.898156, 1, 0.3411765, 0, 1,
-1.548253, -0.6242843, -0.7131952, 1, 0.3490196, 0, 1,
-1.543756, 0.6915847, -1.588659, 1, 0.3529412, 0, 1,
-1.53836, -1.237525, -2.465869, 1, 0.3607843, 0, 1,
-1.532671, 0.249731, -2.540499, 1, 0.3647059, 0, 1,
-1.515352, -1.6891, -0.4256783, 1, 0.372549, 0, 1,
-1.504809, -1.255838, -1.20981, 1, 0.3764706, 0, 1,
-1.503439, 1.04742, 0.656208, 1, 0.3843137, 0, 1,
-1.497748, -0.2010399, -2.713421, 1, 0.3882353, 0, 1,
-1.496591, 0.04449121, -1.232189, 1, 0.3960784, 0, 1,
-1.495384, -1.186625, -2.614785, 1, 0.4039216, 0, 1,
-1.49391, -0.9532003, -1.174704, 1, 0.4078431, 0, 1,
-1.492752, -0.7319232, -1.973312, 1, 0.4156863, 0, 1,
-1.48216, -0.3913344, -2.523155, 1, 0.4196078, 0, 1,
-1.481049, -0.9744028, -2.184089, 1, 0.427451, 0, 1,
-1.435957, 0.4644956, 0.3454661, 1, 0.4313726, 0, 1,
-1.434577, -0.3803377, -1.892864, 1, 0.4392157, 0, 1,
-1.433711, 0.783469, 0.7585085, 1, 0.4431373, 0, 1,
-1.42689, 0.6647244, -0.9549997, 1, 0.4509804, 0, 1,
-1.425486, -0.6063694, -1.05069, 1, 0.454902, 0, 1,
-1.419502, 1.862316, 0.1866284, 1, 0.4627451, 0, 1,
-1.41655, -3.181405, -4.402957, 1, 0.4666667, 0, 1,
-1.414304, -0.6059167, 1.042866, 1, 0.4745098, 0, 1,
-1.413726, -0.7977858, -3.078028, 1, 0.4784314, 0, 1,
-1.40509, 0.6816393, -1.639063, 1, 0.4862745, 0, 1,
-1.396057, 0.4893571, -1.764032, 1, 0.4901961, 0, 1,
-1.39162, 0.2058021, -1.724778, 1, 0.4980392, 0, 1,
-1.391027, -0.3854689, -0.6186833, 1, 0.5058824, 0, 1,
-1.388454, -0.9189897, -1.372199, 1, 0.509804, 0, 1,
-1.380301, 1.474088, -0.6045184, 1, 0.5176471, 0, 1,
-1.369164, 0.6848267, -1.644793, 1, 0.5215687, 0, 1,
-1.366616, 0.5997757, -1.162515, 1, 0.5294118, 0, 1,
-1.365871, 1.692121, -1.480625, 1, 0.5333334, 0, 1,
-1.363941, -0.3474959, -1.869088, 1, 0.5411765, 0, 1,
-1.361673, 0.3942182, -1.097406, 1, 0.5450981, 0, 1,
-1.36132, -0.01248743, -1.175822, 1, 0.5529412, 0, 1,
-1.358988, 1.385749, -1.368066, 1, 0.5568628, 0, 1,
-1.355761, 1.54344, -0.04792135, 1, 0.5647059, 0, 1,
-1.355715, -1.394168, -2.837882, 1, 0.5686275, 0, 1,
-1.353567, -1.542704, -2.048244, 1, 0.5764706, 0, 1,
-1.348201, -2.151477, -2.420771, 1, 0.5803922, 0, 1,
-1.346662, -0.004211306, -2.949686, 1, 0.5882353, 0, 1,
-1.343379, -0.04258171, -1.4443, 1, 0.5921569, 0, 1,
-1.339757, -0.1319794, -1.927767, 1, 0.6, 0, 1,
-1.338814, -0.2583981, -1.273339, 1, 0.6078432, 0, 1,
-1.329304, 2.434436, -1.107203, 1, 0.6117647, 0, 1,
-1.319228, 1.128467, 0.1066307, 1, 0.6196079, 0, 1,
-1.310506, 0.3843102, -2.130967, 1, 0.6235294, 0, 1,
-1.30656, -1.317696, -1.899088, 1, 0.6313726, 0, 1,
-1.284036, -0.574188, -0.1304095, 1, 0.6352941, 0, 1,
-1.276212, 0.4560388, -0.8254198, 1, 0.6431373, 0, 1,
-1.274919, 0.5187327, -0.9529297, 1, 0.6470588, 0, 1,
-1.269792, 1.179772, -1.559215, 1, 0.654902, 0, 1,
-1.255108, -0.5259345, -0.592594, 1, 0.6588235, 0, 1,
-1.254326, 1.132584, -1.040773, 1, 0.6666667, 0, 1,
-1.249547, -0.6230866, -2.183226, 1, 0.6705883, 0, 1,
-1.245721, -0.9731709, -1.90937, 1, 0.6784314, 0, 1,
-1.241419, 0.7996514, -1.734556, 1, 0.682353, 0, 1,
-1.237649, 0.2943007, -2.256619, 1, 0.6901961, 0, 1,
-1.237191, 0.5456203, -1.347385, 1, 0.6941177, 0, 1,
-1.236105, -1.178829, -3.477093, 1, 0.7019608, 0, 1,
-1.234256, -0.3066348, -3.565278, 1, 0.7098039, 0, 1,
-1.22906, -0.9983334, -1.41734, 1, 0.7137255, 0, 1,
-1.22723, 0.8776605, -0.6781476, 1, 0.7215686, 0, 1,
-1.222617, 0.4041968, -0.2994864, 1, 0.7254902, 0, 1,
-1.207497, 0.9499086, -2.664609, 1, 0.7333333, 0, 1,
-1.199283, 0.1076332, -0.1706158, 1, 0.7372549, 0, 1,
-1.196882, -0.1640379, -2.154101, 1, 0.7450981, 0, 1,
-1.179228, -0.7832414, -2.171759, 1, 0.7490196, 0, 1,
-1.175855, 0.5772572, 0.8683513, 1, 0.7568628, 0, 1,
-1.155468, -1.50038, -3.21342, 1, 0.7607843, 0, 1,
-1.136482, 0.8695349, 0.2771345, 1, 0.7686275, 0, 1,
-1.130492, -0.9964555, -1.952195, 1, 0.772549, 0, 1,
-1.128621, 1.157539, -1.350822, 1, 0.7803922, 0, 1,
-1.127867, -0.1213269, -0.4820971, 1, 0.7843137, 0, 1,
-1.124549, -0.2465649, -0.5777256, 1, 0.7921569, 0, 1,
-1.115991, 0.8828272, 0.750229, 1, 0.7960784, 0, 1,
-1.115271, 0.3763802, -1.984559, 1, 0.8039216, 0, 1,
-1.114226, -0.1767022, -1.802662, 1, 0.8117647, 0, 1,
-1.10813, 0.9558808, -1.766261, 1, 0.8156863, 0, 1,
-1.103735, -1.355441, -0.8323925, 1, 0.8235294, 0, 1,
-1.101412, 1.550479, -0.8475852, 1, 0.827451, 0, 1,
-1.101093, -1.326325, -2.345873, 1, 0.8352941, 0, 1,
-1.099239, 0.4616874, -1.537057, 1, 0.8392157, 0, 1,
-1.095182, 1.392537, -1.096749, 1, 0.8470588, 0, 1,
-1.092188, -1.108082, -2.951641, 1, 0.8509804, 0, 1,
-1.08731, 0.1835722, -1.938394, 1, 0.8588235, 0, 1,
-1.078966, -0.2131978, -1.858374, 1, 0.8627451, 0, 1,
-1.074016, -0.8776984, -3.880656, 1, 0.8705882, 0, 1,
-1.073447, 1.361232, -0.5458197, 1, 0.8745098, 0, 1,
-1.073202, 0.2173643, -0.09317572, 1, 0.8823529, 0, 1,
-1.063722, -0.972429, -1.683576, 1, 0.8862745, 0, 1,
-1.061851, 0.1386394, -0.123392, 1, 0.8941177, 0, 1,
-1.057855, 2.373447, -0.4790503, 1, 0.8980392, 0, 1,
-1.056146, 0.8368023, 0.4672323, 1, 0.9058824, 0, 1,
-1.051692, -0.3270043, -1.916586, 1, 0.9137255, 0, 1,
-1.048013, 0.9463145, -1.409101, 1, 0.9176471, 0, 1,
-1.045527, -0.5421482, -1.749563, 1, 0.9254902, 0, 1,
-1.036607, 0.2677246, -0.9158106, 1, 0.9294118, 0, 1,
-1.032344, -1.957123, -2.487367, 1, 0.9372549, 0, 1,
-1.028631, 1.669479, 0.01510893, 1, 0.9411765, 0, 1,
-1.025737, 1.194203, -0.5890464, 1, 0.9490196, 0, 1,
-1.022795, 0.03290827, -0.4164437, 1, 0.9529412, 0, 1,
-1.022358, -0.5058818, -2.450585, 1, 0.9607843, 0, 1,
-1.012429, 0.03930736, -3.49259, 1, 0.9647059, 0, 1,
-1.008907, -0.6014972, -2.783014, 1, 0.972549, 0, 1,
-1.004786, 0.1267716, -1.428685, 1, 0.9764706, 0, 1,
-0.9994981, 0.8260741, -0.03256898, 1, 0.9843137, 0, 1,
-0.9992104, -0.2972955, -2.47497, 1, 0.9882353, 0, 1,
-0.9952964, -1.00475, -2.43312, 1, 0.9960784, 0, 1,
-0.9887281, 0.08835336, -0.9201287, 0.9960784, 1, 0, 1,
-0.9864496, 0.1418605, -0.5176867, 0.9921569, 1, 0, 1,
-0.986069, -0.7735425, -2.822261, 0.9843137, 1, 0, 1,
-0.9813582, 0.09999662, -0.9827827, 0.9803922, 1, 0, 1,
-0.9798458, 0.1612288, -2.081203, 0.972549, 1, 0, 1,
-0.9787031, -0.3458896, -0.5580214, 0.9686275, 1, 0, 1,
-0.9623896, -2.236266, -3.712686, 0.9607843, 1, 0, 1,
-0.9620396, 1.64486, 0.9212312, 0.9568627, 1, 0, 1,
-0.9601045, -0.3623349, -2.406657, 0.9490196, 1, 0, 1,
-0.9599128, 0.8434928, 0.6871396, 0.945098, 1, 0, 1,
-0.9491211, -1.190891, -3.282376, 0.9372549, 1, 0, 1,
-0.9424967, -0.7303779, -1.194177, 0.9333333, 1, 0, 1,
-0.9411767, 0.6955542, -0.4821481, 0.9254902, 1, 0, 1,
-0.9312829, 0.4831316, -2.675733, 0.9215686, 1, 0, 1,
-0.9290812, -0.1896753, -0.6234677, 0.9137255, 1, 0, 1,
-0.9227759, -2.632283, -2.017336, 0.9098039, 1, 0, 1,
-0.9217016, -0.5609688, -0.09692146, 0.9019608, 1, 0, 1,
-0.9127334, 0.5677196, -0.07253249, 0.8941177, 1, 0, 1,
-0.9071504, -2.052574, -2.108116, 0.8901961, 1, 0, 1,
-0.9001605, -1.136362, -3.5695, 0.8823529, 1, 0, 1,
-0.8989717, 0.3660209, -2.268003, 0.8784314, 1, 0, 1,
-0.8982722, -2.057779, -2.458849, 0.8705882, 1, 0, 1,
-0.8904814, 0.4352336, -1.439542, 0.8666667, 1, 0, 1,
-0.8874075, 0.8751506, -0.9549127, 0.8588235, 1, 0, 1,
-0.8723409, -0.6830201, -1.146794, 0.854902, 1, 0, 1,
-0.8712321, -0.9514915, -2.587019, 0.8470588, 1, 0, 1,
-0.8669794, -1.800545, -2.114797, 0.8431373, 1, 0, 1,
-0.8660951, -1.614543, -2.045655, 0.8352941, 1, 0, 1,
-0.8660499, 1.037665, -0.6049673, 0.8313726, 1, 0, 1,
-0.8618681, 0.8277377, -2.046985, 0.8235294, 1, 0, 1,
-0.8553078, 0.3978362, -0.9316859, 0.8196079, 1, 0, 1,
-0.8547761, -0.4170249, -0.619379, 0.8117647, 1, 0, 1,
-0.8532579, 0.1026565, -0.8880076, 0.8078431, 1, 0, 1,
-0.851354, 0.9703836, -1.916824, 0.8, 1, 0, 1,
-0.8481069, 0.8790758, -1.870631, 0.7921569, 1, 0, 1,
-0.8452826, 0.4223227, -1.398111, 0.7882353, 1, 0, 1,
-0.8447228, 0.1145837, -0.8138493, 0.7803922, 1, 0, 1,
-0.8388328, 0.9227191, 0.1295837, 0.7764706, 1, 0, 1,
-0.8379628, 1.010416, -0.1339855, 0.7686275, 1, 0, 1,
-0.8368188, -0.1197046, -2.115661, 0.7647059, 1, 0, 1,
-0.8326963, -0.102594, -0.9716539, 0.7568628, 1, 0, 1,
-0.831628, -0.9571909, -1.018977, 0.7529412, 1, 0, 1,
-0.8269998, -2.643379, -3.699209, 0.7450981, 1, 0, 1,
-0.821182, 0.1376327, -0.1291494, 0.7411765, 1, 0, 1,
-0.8207457, 1.461655, -0.3638391, 0.7333333, 1, 0, 1,
-0.8181424, 0.6263994, 0.5721927, 0.7294118, 1, 0, 1,
-0.816063, 1.107937, -0.4542977, 0.7215686, 1, 0, 1,
-0.8112752, 0.2422132, -0.5198714, 0.7176471, 1, 0, 1,
-0.8085737, 0.3000185, 0.4268262, 0.7098039, 1, 0, 1,
-0.8058889, 0.9992856, -0.202713, 0.7058824, 1, 0, 1,
-0.8026726, -1.015484, -3.148382, 0.6980392, 1, 0, 1,
-0.7958948, -1.687195, -2.464969, 0.6901961, 1, 0, 1,
-0.7952825, -0.5443314, -2.229909, 0.6862745, 1, 0, 1,
-0.7942369, -0.9227836, -2.263946, 0.6784314, 1, 0, 1,
-0.7921597, -0.06360669, -1.859144, 0.6745098, 1, 0, 1,
-0.7906689, 0.7227671, -1.448044, 0.6666667, 1, 0, 1,
-0.7892635, 0.3766662, -2.707668, 0.6627451, 1, 0, 1,
-0.785633, 0.263314, -2.001495, 0.654902, 1, 0, 1,
-0.7791616, -0.226326, -2.473759, 0.6509804, 1, 0, 1,
-0.7780876, 0.5131034, -1.573306, 0.6431373, 1, 0, 1,
-0.7696152, -0.2628153, -2.75915, 0.6392157, 1, 0, 1,
-0.7656817, -1.459471, -4.445088, 0.6313726, 1, 0, 1,
-0.7649493, 1.044647, -1.213772, 0.627451, 1, 0, 1,
-0.7637819, -1.252008, -3.687618, 0.6196079, 1, 0, 1,
-0.7548775, -0.3163647, -1.018367, 0.6156863, 1, 0, 1,
-0.7507319, -0.379216, -1.869286, 0.6078432, 1, 0, 1,
-0.7491873, 0.8940015, 0.2621207, 0.6039216, 1, 0, 1,
-0.7486079, -0.4784376, -2.57677, 0.5960785, 1, 0, 1,
-0.7484146, 0.6853321, -0.4686918, 0.5882353, 1, 0, 1,
-0.7466679, -1.658945, -1.873522, 0.5843138, 1, 0, 1,
-0.7447881, 0.4220258, -2.383802, 0.5764706, 1, 0, 1,
-0.74434, 0.3034028, -1.902376, 0.572549, 1, 0, 1,
-0.7441596, -1.494808, -3.526044, 0.5647059, 1, 0, 1,
-0.7387732, -0.4108724, -2.801207, 0.5607843, 1, 0, 1,
-0.7387719, -2.857594, -1.319992, 0.5529412, 1, 0, 1,
-0.7376952, 0.4846855, -1.001821, 0.5490196, 1, 0, 1,
-0.7339381, -1.778716, -1.65214, 0.5411765, 1, 0, 1,
-0.7314354, 1.919302, 0.429088, 0.5372549, 1, 0, 1,
-0.7284088, 1.649247, -1.129729, 0.5294118, 1, 0, 1,
-0.7274566, 0.04368516, -0.8311483, 0.5254902, 1, 0, 1,
-0.722882, -0.5223255, -1.155094, 0.5176471, 1, 0, 1,
-0.7212195, -0.7763293, -1.280354, 0.5137255, 1, 0, 1,
-0.7194847, 0.1298832, -2.006884, 0.5058824, 1, 0, 1,
-0.7185472, -0.5534452, -0.2700728, 0.5019608, 1, 0, 1,
-0.7166036, 1.202507, -0.9490212, 0.4941176, 1, 0, 1,
-0.7118721, 0.4788395, 1.47084, 0.4862745, 1, 0, 1,
-0.7086337, -2.046763, -1.974877, 0.4823529, 1, 0, 1,
-0.7021183, -0.3059573, -2.507862, 0.4745098, 1, 0, 1,
-0.7012494, 0.08772209, -3.080766, 0.4705882, 1, 0, 1,
-0.6966865, -0.5260695, -0.1690479, 0.4627451, 1, 0, 1,
-0.6954307, -0.5091346, -0.8885955, 0.4588235, 1, 0, 1,
-0.6944948, 0.07122774, 0.7729983, 0.4509804, 1, 0, 1,
-0.6891496, 0.179114, -1.805639, 0.4470588, 1, 0, 1,
-0.6874815, 0.3645749, -1.384502, 0.4392157, 1, 0, 1,
-0.6866224, 0.7707414, -0.4309476, 0.4352941, 1, 0, 1,
-0.6827617, -0.04984238, -1.408044, 0.427451, 1, 0, 1,
-0.6751419, 1.342944, -0.1882929, 0.4235294, 1, 0, 1,
-0.6744861, 0.02826034, -3.621772, 0.4156863, 1, 0, 1,
-0.6729362, 0.6104848, -1.663731, 0.4117647, 1, 0, 1,
-0.6717511, 0.04927444, -1.123305, 0.4039216, 1, 0, 1,
-0.6695071, 1.568156, -0.1201557, 0.3960784, 1, 0, 1,
-0.6675371, -0.1695786, -0.3792555, 0.3921569, 1, 0, 1,
-0.66584, 0.2744369, -0.8949153, 0.3843137, 1, 0, 1,
-0.6646281, 0.9328485, 0.4073674, 0.3803922, 1, 0, 1,
-0.6625411, 0.3740059, -0.1928305, 0.372549, 1, 0, 1,
-0.659129, -0.3894045, -2.686748, 0.3686275, 1, 0, 1,
-0.6549648, -2.208043, -2.411317, 0.3607843, 1, 0, 1,
-0.6527577, -0.2686509, -2.917559, 0.3568628, 1, 0, 1,
-0.6429044, 0.1244164, -2.117745, 0.3490196, 1, 0, 1,
-0.6402935, -0.6937578, -3.46668, 0.345098, 1, 0, 1,
-0.6398925, -0.9783444, -1.992448, 0.3372549, 1, 0, 1,
-0.6366145, 1.540069, 0.2325286, 0.3333333, 1, 0, 1,
-0.630586, 0.2019214, 0.5130291, 0.3254902, 1, 0, 1,
-0.6291459, -0.7724407, -3.454895, 0.3215686, 1, 0, 1,
-0.626931, 0.2074779, -1.698955, 0.3137255, 1, 0, 1,
-0.6229851, 0.2604448, 0.2761037, 0.3098039, 1, 0, 1,
-0.6212767, -1.6267, -2.851068, 0.3019608, 1, 0, 1,
-0.6201175, -0.3688004, -2.017146, 0.2941177, 1, 0, 1,
-0.6115106, -0.05447059, -0.7022142, 0.2901961, 1, 0, 1,
-0.6088707, 1.853641, -0.1129711, 0.282353, 1, 0, 1,
-0.6064194, 0.8515137, -1.790439, 0.2784314, 1, 0, 1,
-0.6051912, -0.3732892, -0.6533118, 0.2705882, 1, 0, 1,
-0.6043254, -0.140917, -2.263945, 0.2666667, 1, 0, 1,
-0.6005815, 0.009754659, -2.425155, 0.2588235, 1, 0, 1,
-0.5981865, -0.6500416, -2.418418, 0.254902, 1, 0, 1,
-0.59642, -2.157182, -3.005439, 0.2470588, 1, 0, 1,
-0.5958242, 0.667423, -0.6685364, 0.2431373, 1, 0, 1,
-0.592456, -0.5206706, -3.363412, 0.2352941, 1, 0, 1,
-0.5890676, 0.6544233, -1.097617, 0.2313726, 1, 0, 1,
-0.5850174, 0.3825276, 0.5408098, 0.2235294, 1, 0, 1,
-0.5799726, 0.01306713, -2.156507, 0.2196078, 1, 0, 1,
-0.5787882, -1.04842, -2.223694, 0.2117647, 1, 0, 1,
-0.5770917, -1.154665, -2.000128, 0.2078431, 1, 0, 1,
-0.5730115, -0.5230762, -2.894698, 0.2, 1, 0, 1,
-0.5640564, -0.9747045, -2.712048, 0.1921569, 1, 0, 1,
-0.564036, 1.23007, -0.1465544, 0.1882353, 1, 0, 1,
-0.5611639, 0.4199657, -0.4434395, 0.1803922, 1, 0, 1,
-0.5584556, -1.024619, -1.780362, 0.1764706, 1, 0, 1,
-0.558413, -1.049188, -3.881771, 0.1686275, 1, 0, 1,
-0.5583916, -1.510841, -3.476771, 0.1647059, 1, 0, 1,
-0.5555645, 0.793207, -0.4247845, 0.1568628, 1, 0, 1,
-0.5538015, -1.031488, -2.252699, 0.1529412, 1, 0, 1,
-0.5493525, 1.020225, -1.106281, 0.145098, 1, 0, 1,
-0.5475186, -1.391173, -1.615687, 0.1411765, 1, 0, 1,
-0.5455757, -0.8710898, -2.785231, 0.1333333, 1, 0, 1,
-0.5434462, 0.1206851, 0.9891517, 0.1294118, 1, 0, 1,
-0.5422248, -0.06735989, -2.28554, 0.1215686, 1, 0, 1,
-0.5388826, -0.1767189, -2.42891, 0.1176471, 1, 0, 1,
-0.5386243, 0.1585149, -1.020484, 0.1098039, 1, 0, 1,
-0.5303897, -0.1312403, -2.287702, 0.1058824, 1, 0, 1,
-0.529492, -0.1510294, -1.72388, 0.09803922, 1, 0, 1,
-0.5281106, 0.4428442, -0.7894197, 0.09019608, 1, 0, 1,
-0.5260358, -0.3937008, -0.4141698, 0.08627451, 1, 0, 1,
-0.5256548, 0.9337472, -2.658084, 0.07843138, 1, 0, 1,
-0.520926, -1.959462, -3.284178, 0.07450981, 1, 0, 1,
-0.5161768, 1.387046, 0.155369, 0.06666667, 1, 0, 1,
-0.5159164, -0.6701127, -3.472961, 0.0627451, 1, 0, 1,
-0.5134077, -0.199665, -2.37788, 0.05490196, 1, 0, 1,
-0.5126498, -1.201751, -3.168013, 0.05098039, 1, 0, 1,
-0.5122604, 1.302942, 0.6052798, 0.04313726, 1, 0, 1,
-0.5105338, -0.11893, -3.226784, 0.03921569, 1, 0, 1,
-0.5091701, -0.6089747, -3.568889, 0.03137255, 1, 0, 1,
-0.5082117, 2.200519, -0.06906802, 0.02745098, 1, 0, 1,
-0.5071214, -0.2088442, -1.810241, 0.01960784, 1, 0, 1,
-0.5029284, 0.2447134, -0.7417423, 0.01568628, 1, 0, 1,
-0.499506, 0.8350852, 0.6446604, 0.007843138, 1, 0, 1,
-0.4915634, 1.103625, 1.289512, 0.003921569, 1, 0, 1,
-0.4884169, 0.7585238, 0.462331, 0, 1, 0.003921569, 1,
-0.4817546, 1.057034, 0.8858225, 0, 1, 0.01176471, 1,
-0.4806744, -0.913424, -2.071983, 0, 1, 0.01568628, 1,
-0.4759369, -0.07680764, -3.201067, 0, 1, 0.02352941, 1,
-0.472795, -1.679721, -1.960054, 0, 1, 0.02745098, 1,
-0.4724495, 0.9788121, 0.4434869, 0, 1, 0.03529412, 1,
-0.4691114, 1.403257, -1.151643, 0, 1, 0.03921569, 1,
-0.4685159, -1.067178, -3.324682, 0, 1, 0.04705882, 1,
-0.4675441, 1.089053, 1.64974, 0, 1, 0.05098039, 1,
-0.4653399, 0.4909719, -0.2240413, 0, 1, 0.05882353, 1,
-0.4616264, -0.4639456, -2.97211, 0, 1, 0.0627451, 1,
-0.4609652, -0.1161396, -1.2023, 0, 1, 0.07058824, 1,
-0.4529774, 0.4825005, -1.117679, 0, 1, 0.07450981, 1,
-0.4504568, 1.200925, -0.004122557, 0, 1, 0.08235294, 1,
-0.4483216, 0.3493279, -1.146948, 0, 1, 0.08627451, 1,
-0.4461004, -0.6152427, -1.565307, 0, 1, 0.09411765, 1,
-0.4394629, 0.6042452, 0.8423244, 0, 1, 0.1019608, 1,
-0.4393715, 0.6182853, 0.2557157, 0, 1, 0.1058824, 1,
-0.4378942, -0.7480415, -1.949292, 0, 1, 0.1137255, 1,
-0.4357811, -0.6099073, -0.7305002, 0, 1, 0.1176471, 1,
-0.4340209, -0.08418625, -0.2596384, 0, 1, 0.1254902, 1,
-0.4336048, -0.2313292, -1.040769, 0, 1, 0.1294118, 1,
-0.4323181, 0.2378997, -1.591923, 0, 1, 0.1372549, 1,
-0.4280135, 0.846377, -0.5636867, 0, 1, 0.1411765, 1,
-0.4263327, 0.1038914, -2.035676, 0, 1, 0.1490196, 1,
-0.4255703, -0.09865907, -2.255711, 0, 1, 0.1529412, 1,
-0.4250244, 0.01642791, 0.5377538, 0, 1, 0.1607843, 1,
-0.424073, -0.3033461, -1.436005, 0, 1, 0.1647059, 1,
-0.4239956, -0.5823462, -1.136699, 0, 1, 0.172549, 1,
-0.4234873, 1.056562, -0.1271041, 0, 1, 0.1764706, 1,
-0.4230763, -0.5924472, -2.10917, 0, 1, 0.1843137, 1,
-0.414351, -0.9616293, -4.062975, 0, 1, 0.1882353, 1,
-0.4118719, -0.1652429, -1.450926, 0, 1, 0.1960784, 1,
-0.4115104, 0.9869122, 0.309789, 0, 1, 0.2039216, 1,
-0.4088895, 0.1833191, -1.386586, 0, 1, 0.2078431, 1,
-0.4049395, -0.7009345, -2.412083, 0, 1, 0.2156863, 1,
-0.4041915, -2.010313, -2.046824, 0, 1, 0.2196078, 1,
-0.4023272, 0.5824485, 0.4982181, 0, 1, 0.227451, 1,
-0.3927105, 0.8952099, 1.593067, 0, 1, 0.2313726, 1,
-0.3875979, 1.43171, -0.3536188, 0, 1, 0.2392157, 1,
-0.3870329, 0.04605319, -0.969798, 0, 1, 0.2431373, 1,
-0.3839934, -2.008312, -2.746353, 0, 1, 0.2509804, 1,
-0.3803678, -0.5129275, -2.703805, 0, 1, 0.254902, 1,
-0.3790891, -1.050794, -4.502299, 0, 1, 0.2627451, 1,
-0.3788042, -0.8718044, -1.554313, 0, 1, 0.2666667, 1,
-0.3753301, -0.03762189, -1.360942, 0, 1, 0.2745098, 1,
-0.3748916, -1.709697, -1.463214, 0, 1, 0.2784314, 1,
-0.3693305, 0.6625664, -0.4989785, 0, 1, 0.2862745, 1,
-0.3672749, -1.285326, -2.197333, 0, 1, 0.2901961, 1,
-0.3633556, 2.015835, -0.3072861, 0, 1, 0.2980392, 1,
-0.3616518, 0.3680628, -1.569013, 0, 1, 0.3058824, 1,
-0.3616128, 0.1811223, -1.042308, 0, 1, 0.3098039, 1,
-0.3495463, 0.2323609, -1.024499, 0, 1, 0.3176471, 1,
-0.3493864, 0.07765906, -0.907421, 0, 1, 0.3215686, 1,
-0.346366, -0.5994732, -2.861485, 0, 1, 0.3294118, 1,
-0.3411973, 0.241046, -0.9884492, 0, 1, 0.3333333, 1,
-0.3403674, 1.784166, -1.725256, 0, 1, 0.3411765, 1,
-0.3399842, -0.9491907, -1.56782, 0, 1, 0.345098, 1,
-0.3364886, 0.6330149, 0.04636906, 0, 1, 0.3529412, 1,
-0.3341905, -1.017675, -2.01008, 0, 1, 0.3568628, 1,
-0.3340584, 2.269509, -1.228486, 0, 1, 0.3647059, 1,
-0.3333723, 1.27813, 0.301854, 0, 1, 0.3686275, 1,
-0.3330321, -1.534071, -2.930624, 0, 1, 0.3764706, 1,
-0.3318358, 0.6474916, 0.4060083, 0, 1, 0.3803922, 1,
-0.3305924, -1.27445, -3.510283, 0, 1, 0.3882353, 1,
-0.3256649, -0.2902182, -1.650424, 0, 1, 0.3921569, 1,
-0.3244425, -1.099924, -3.317747, 0, 1, 0.4, 1,
-0.3206995, -0.4398906, -2.331758, 0, 1, 0.4078431, 1,
-0.3141723, 0.3767799, 0.1110457, 0, 1, 0.4117647, 1,
-0.3138907, -0.6174606, -3.31302, 0, 1, 0.4196078, 1,
-0.3071402, 0.4075936, -0.8584597, 0, 1, 0.4235294, 1,
-0.3043715, 0.5652084, -0.5461064, 0, 1, 0.4313726, 1,
-0.3027935, -0.354504, -1.375722, 0, 1, 0.4352941, 1,
-0.302629, 0.1311848, -1.873218, 0, 1, 0.4431373, 1,
-0.2960877, 1.860237, 0.7643703, 0, 1, 0.4470588, 1,
-0.2918989, -0.8715461, -1.763024, 0, 1, 0.454902, 1,
-0.2903259, 1.371608, -2.113524, 0, 1, 0.4588235, 1,
-0.2900519, 0.2195769, 0.1086128, 0, 1, 0.4666667, 1,
-0.2850837, 1.211038, -0.5469285, 0, 1, 0.4705882, 1,
-0.2826522, 1.360036, 0.3560166, 0, 1, 0.4784314, 1,
-0.2813722, 0.226509, 2.090811, 0, 1, 0.4823529, 1,
-0.2763153, -2.037051, -3.107392, 0, 1, 0.4901961, 1,
-0.2740141, -0.8710749, -2.679899, 0, 1, 0.4941176, 1,
-0.2726476, -0.2046509, -2.537562, 0, 1, 0.5019608, 1,
-0.2690548, -1.099128, -5.013912, 0, 1, 0.509804, 1,
-0.2675417, 1.257206, -1.163937, 0, 1, 0.5137255, 1,
-0.2613867, 0.3824759, 0.6255412, 0, 1, 0.5215687, 1,
-0.2602366, 1.929155, -1.049922, 0, 1, 0.5254902, 1,
-0.2562658, -0.03244382, -1.846249, 0, 1, 0.5333334, 1,
-0.2544737, 0.796375, 0.3526064, 0, 1, 0.5372549, 1,
-0.2523257, 0.2966802, -1.017376, 0, 1, 0.5450981, 1,
-0.2504379, -1.106919, -3.67602, 0, 1, 0.5490196, 1,
-0.249621, 0.2830135, 0.1444527, 0, 1, 0.5568628, 1,
-0.2419704, -0.7722341, -3.032974, 0, 1, 0.5607843, 1,
-0.2383908, -0.2935266, -4.425394, 0, 1, 0.5686275, 1,
-0.2343378, 0.2487103, -0.6517217, 0, 1, 0.572549, 1,
-0.2330576, 0.4640599, 0.4125548, 0, 1, 0.5803922, 1,
-0.2316037, 0.02510446, -1.657687, 0, 1, 0.5843138, 1,
-0.2288676, -0.7964755, -2.500963, 0, 1, 0.5921569, 1,
-0.2280701, 0.9833808, -0.4561037, 0, 1, 0.5960785, 1,
-0.2226319, -1.198142, -1.866632, 0, 1, 0.6039216, 1,
-0.2139688, 0.1672782, -2.178, 0, 1, 0.6117647, 1,
-0.2038935, -0.5311025, -3.120166, 0, 1, 0.6156863, 1,
-0.1994268, -0.9650058, -2.355069, 0, 1, 0.6235294, 1,
-0.1990266, 0.6791636, -0.2491594, 0, 1, 0.627451, 1,
-0.1909905, 0.940035, 1.042789, 0, 1, 0.6352941, 1,
-0.1861648, -0.6885252, -3.952798, 0, 1, 0.6392157, 1,
-0.1842023, 0.8992535, -0.5042943, 0, 1, 0.6470588, 1,
-0.1835551, -2.512003, -3.787732, 0, 1, 0.6509804, 1,
-0.1780456, 0.06359103, -2.344404, 0, 1, 0.6588235, 1,
-0.1759147, 0.7724809, -1.706384, 0, 1, 0.6627451, 1,
-0.1734817, 0.2725869, -1.579682, 0, 1, 0.6705883, 1,
-0.1712367, 0.3092727, -0.4435662, 0, 1, 0.6745098, 1,
-0.1592533, 0.7566328, 0.3153629, 0, 1, 0.682353, 1,
-0.1577998, -0.06991556, -2.070585, 0, 1, 0.6862745, 1,
-0.1563903, -0.8313068, -4.726918, 0, 1, 0.6941177, 1,
-0.1543166, -1.329516, -4.113338, 0, 1, 0.7019608, 1,
-0.1502471, 0.4256615, -0.01248887, 0, 1, 0.7058824, 1,
-0.1411988, 1.159517, -1.768561, 0, 1, 0.7137255, 1,
-0.141174, -0.2343051, -2.121286, 0, 1, 0.7176471, 1,
-0.138901, -0.5849627, -2.710608, 0, 1, 0.7254902, 1,
-0.1386174, 2.245653, 0.739544, 0, 1, 0.7294118, 1,
-0.1345822, 0.3803849, 0.4767829, 0, 1, 0.7372549, 1,
-0.1323491, 1.126101, 1.076098, 0, 1, 0.7411765, 1,
-0.1303914, 1.926546, 0.4877053, 0, 1, 0.7490196, 1,
-0.1270288, 0.4168792, -0.8424546, 0, 1, 0.7529412, 1,
-0.1236945, 0.001374183, -1.838596, 0, 1, 0.7607843, 1,
-0.1200202, -1.247236, -2.112219, 0, 1, 0.7647059, 1,
-0.1187622, -0.9074599, -4.50357, 0, 1, 0.772549, 1,
-0.1155571, -0.08414853, -1.869241, 0, 1, 0.7764706, 1,
-0.1118968, 0.9574379, -0.1036673, 0, 1, 0.7843137, 1,
-0.1108363, -0.1199868, -2.626671, 0, 1, 0.7882353, 1,
-0.1082694, 0.2253163, -0.01284448, 0, 1, 0.7960784, 1,
-0.09967909, -1.027184, -2.055213, 0, 1, 0.8039216, 1,
-0.09682562, 1.220938, 0.3291251, 0, 1, 0.8078431, 1,
-0.09505939, -0.2100522, -1.444007, 0, 1, 0.8156863, 1,
-0.09503713, 2.150586, -0.5878388, 0, 1, 0.8196079, 1,
-0.0932236, 0.6990257, 0.09082272, 0, 1, 0.827451, 1,
-0.09220656, 0.08985684, -0.840429, 0, 1, 0.8313726, 1,
-0.09175535, -0.7350602, -3.917913, 0, 1, 0.8392157, 1,
-0.09063783, 0.4022066, -1.189371, 0, 1, 0.8431373, 1,
-0.08842623, -1.776005, -3.09329, 0, 1, 0.8509804, 1,
-0.08504029, -0.05255552, -1.370861, 0, 1, 0.854902, 1,
-0.0762073, 0.1084471, -0.5590113, 0, 1, 0.8627451, 1,
-0.07263485, -0.04854443, -3.724439, 0, 1, 0.8666667, 1,
-0.06793328, -0.2754384, -3.53301, 0, 1, 0.8745098, 1,
-0.06505544, 0.6708128, 0.8618938, 0, 1, 0.8784314, 1,
-0.06105417, -0.5622204, -3.481678, 0, 1, 0.8862745, 1,
-0.05846933, -2.258116, -3.071347, 0, 1, 0.8901961, 1,
-0.05765786, 0.1295292, -1.436492, 0, 1, 0.8980392, 1,
-0.05716841, 0.6526145, -0.6799996, 0, 1, 0.9058824, 1,
-0.05587806, 0.5539232, 2.31651, 0, 1, 0.9098039, 1,
-0.05449374, 0.6847494, 0.3706082, 0, 1, 0.9176471, 1,
-0.04787793, 2.341152, -1.07773, 0, 1, 0.9215686, 1,
-0.04738786, 0.143417, -0.1284092, 0, 1, 0.9294118, 1,
-0.04087947, -0.1140275, -2.527318, 0, 1, 0.9333333, 1,
-0.03973302, -0.3721611, -2.493644, 0, 1, 0.9411765, 1,
-0.03721843, -1.038509, -4.15714, 0, 1, 0.945098, 1,
-0.03598914, 1.581237, 0.4867692, 0, 1, 0.9529412, 1,
-0.0303393, 0.7582824, -1.524185, 0, 1, 0.9568627, 1,
-0.027085, -0.2488687, -3.943559, 0, 1, 0.9647059, 1,
-0.02565041, 1.274893, 0.05180148, 0, 1, 0.9686275, 1,
-0.02481647, 0.1984444, -0.6958896, 0, 1, 0.9764706, 1,
-0.01592034, -0.1684416, -2.615402, 0, 1, 0.9803922, 1,
-0.01302601, -0.1721969, -3.107838, 0, 1, 0.9882353, 1,
-0.01116221, -1.482286, -2.621368, 0, 1, 0.9921569, 1,
-0.009731148, -0.5786788, -2.641297, 0, 1, 1, 1,
-0.008679805, -0.4692966, -1.925735, 0, 0.9921569, 1, 1,
-0.007803898, 0.08693443, -0.04697396, 0, 0.9882353, 1, 1,
-0.007667347, 2.952097, 0.3559182, 0, 0.9803922, 1, 1,
-0.00753336, 2.062007, -1.595816, 0, 0.9764706, 1, 1,
-0.006474386, 1.978787, -0.9449691, 0, 0.9686275, 1, 1,
-0.003738369, -1.123478, -4.233509, 0, 0.9647059, 1, 1,
-0.003646079, 1.332815, 3.114311, 0, 0.9568627, 1, 1,
0.003943365, 0.4127609, 1.455249, 0, 0.9529412, 1, 1,
0.006354645, 0.2679131, 0.6449606, 0, 0.945098, 1, 1,
0.009593579, 0.9691362, -0.2004656, 0, 0.9411765, 1, 1,
0.009623507, -0.07316692, 3.378121, 0, 0.9333333, 1, 1,
0.01379151, 0.5457274, -1.002958, 0, 0.9294118, 1, 1,
0.01548514, -0.4503821, 2.417335, 0, 0.9215686, 1, 1,
0.0175043, 1.408962, -0.3078065, 0, 0.9176471, 1, 1,
0.02236484, 0.08333833, -1.49819, 0, 0.9098039, 1, 1,
0.0235857, -0.3097788, 3.441324, 0, 0.9058824, 1, 1,
0.02453439, -0.158508, 3.920822, 0, 0.8980392, 1, 1,
0.03431056, 0.3592099, 0.8114237, 0, 0.8901961, 1, 1,
0.03776159, 0.5291074, 0.872197, 0, 0.8862745, 1, 1,
0.03933475, -0.8345532, 3.519046, 0, 0.8784314, 1, 1,
0.04199301, -0.2945383, 2.927386, 0, 0.8745098, 1, 1,
0.04400842, -0.2532404, 2.649281, 0, 0.8666667, 1, 1,
0.04488778, 1.292283, 0.1770269, 0, 0.8627451, 1, 1,
0.04507685, 0.2689194, 0.5150774, 0, 0.854902, 1, 1,
0.04871181, 0.3184723, 2.409145, 0, 0.8509804, 1, 1,
0.04874858, 0.4680108, 0.07762337, 0, 0.8431373, 1, 1,
0.05141666, -0.1976678, 2.262744, 0, 0.8392157, 1, 1,
0.05481315, -0.9422758, 3.534509, 0, 0.8313726, 1, 1,
0.05712116, -0.1892194, 2.152441, 0, 0.827451, 1, 1,
0.06345309, -0.08415157, 2.437678, 0, 0.8196079, 1, 1,
0.06491526, -0.5993145, 2.755252, 0, 0.8156863, 1, 1,
0.0653993, 1.754107, -1.233594, 0, 0.8078431, 1, 1,
0.066895, 0.7131225, 0.746362, 0, 0.8039216, 1, 1,
0.06818093, 0.4116103, 0.6591089, 0, 0.7960784, 1, 1,
0.07001659, 1.538362, -0.3143257, 0, 0.7882353, 1, 1,
0.07054199, -1.267678, 3.98776, 0, 0.7843137, 1, 1,
0.07257602, 1.532884, -0.3613579, 0, 0.7764706, 1, 1,
0.07312914, 0.4206071, 0.3239669, 0, 0.772549, 1, 1,
0.07556158, -0.1785168, 3.329066, 0, 0.7647059, 1, 1,
0.08430111, 0.8575848, -1.579766, 0, 0.7607843, 1, 1,
0.08510504, -0.9268569, 2.732488, 0, 0.7529412, 1, 1,
0.08753525, -0.288539, 2.141286, 0, 0.7490196, 1, 1,
0.08803117, 1.166059, -0.03031851, 0, 0.7411765, 1, 1,
0.09583522, -0.8078721, 4.088601, 0, 0.7372549, 1, 1,
0.09647115, -0.5565392, 2.856956, 0, 0.7294118, 1, 1,
0.0982354, -0.18719, 3.986413, 0, 0.7254902, 1, 1,
0.09847832, -0.3380099, 1.653801, 0, 0.7176471, 1, 1,
0.1001029, 0.08207888, 0.7300149, 0, 0.7137255, 1, 1,
0.1017839, -0.1424041, 2.064479, 0, 0.7058824, 1, 1,
0.1128639, -0.8225831, 3.394295, 0, 0.6980392, 1, 1,
0.1197252, 0.9728853, 0.1828701, 0, 0.6941177, 1, 1,
0.1218984, 0.00077782, 1.789355, 0, 0.6862745, 1, 1,
0.1246899, -0.4574581, 1.80194, 0, 0.682353, 1, 1,
0.1250567, 2.404666, 1.607675, 0, 0.6745098, 1, 1,
0.1257158, -0.5763001, 1.06255, 0, 0.6705883, 1, 1,
0.1278939, -1.639864, 2.405174, 0, 0.6627451, 1, 1,
0.1292292, -0.02140784, 2.545522, 0, 0.6588235, 1, 1,
0.130356, 0.3581387, 2.337205, 0, 0.6509804, 1, 1,
0.1321021, 0.4332636, 0.9841415, 0, 0.6470588, 1, 1,
0.1331128, 0.09434703, -0.06688119, 0, 0.6392157, 1, 1,
0.1351437, 0.5885376, 1.509537, 0, 0.6352941, 1, 1,
0.1355939, -1.23559, 3.635089, 0, 0.627451, 1, 1,
0.1395259, 0.1782269, 0.007072109, 0, 0.6235294, 1, 1,
0.1408816, 0.9991229, -0.4664482, 0, 0.6156863, 1, 1,
0.1448788, 1.438695, 0.406463, 0, 0.6117647, 1, 1,
0.1480829, 0.4777184, 1.600211, 0, 0.6039216, 1, 1,
0.1495311, 1.781185, 0.3125985, 0, 0.5960785, 1, 1,
0.1562132, 0.8435953, 2.301435, 0, 0.5921569, 1, 1,
0.1568939, -1.195294, 1.693149, 0, 0.5843138, 1, 1,
0.1569371, 0.663726, 0.342517, 0, 0.5803922, 1, 1,
0.1632788, -0.5082895, 3.39599, 0, 0.572549, 1, 1,
0.1673209, -0.2403447, 2.301353, 0, 0.5686275, 1, 1,
0.1688567, 0.5460387, -0.802403, 0, 0.5607843, 1, 1,
0.1697615, 0.04991102, 1.758949, 0, 0.5568628, 1, 1,
0.1731025, -0.3318429, 2.126431, 0, 0.5490196, 1, 1,
0.1735482, 0.439346, -0.5890296, 0, 0.5450981, 1, 1,
0.1756672, 0.1911256, 0.1016104, 0, 0.5372549, 1, 1,
0.1775155, 1.161998, -0.7845284, 0, 0.5333334, 1, 1,
0.1791803, -1.338781, 2.94577, 0, 0.5254902, 1, 1,
0.1827204, 0.02407613, 1.845529, 0, 0.5215687, 1, 1,
0.1848482, -0.4295886, 3.697034, 0, 0.5137255, 1, 1,
0.1850907, 0.3671876, 1.346448, 0, 0.509804, 1, 1,
0.1853838, -1.199743, 0.7767559, 0, 0.5019608, 1, 1,
0.1915079, 1.455223, -0.6719221, 0, 0.4941176, 1, 1,
0.1923727, -0.9441674, 4.96814, 0, 0.4901961, 1, 1,
0.1925855, -0.350687, 3.144133, 0, 0.4823529, 1, 1,
0.1932838, 1.301395, -0.9599806, 0, 0.4784314, 1, 1,
0.1989114, -0.9500986, 3.584642, 0, 0.4705882, 1, 1,
0.1992034, -0.6253968, 3.516001, 0, 0.4666667, 1, 1,
0.1999691, -1.171276, 2.987121, 0, 0.4588235, 1, 1,
0.2025735, 1.197441, 0.2588193, 0, 0.454902, 1, 1,
0.2029284, -0.9399276, 1.948385, 0, 0.4470588, 1, 1,
0.2038579, 0.408224, -1.995335, 0, 0.4431373, 1, 1,
0.2039808, 0.8815267, -1.056205, 0, 0.4352941, 1, 1,
0.2055117, 0.3057473, -0.4601851, 0, 0.4313726, 1, 1,
0.2110008, 1.001863, -1.480189, 0, 0.4235294, 1, 1,
0.2120791, -1.146627, 3.131088, 0, 0.4196078, 1, 1,
0.2121894, -2.274514, 4.009082, 0, 0.4117647, 1, 1,
0.2130765, 0.6433838, 0.7053691, 0, 0.4078431, 1, 1,
0.2152063, 1.276211, 0.2825939, 0, 0.4, 1, 1,
0.2190776, 0.3889267, -0.9605793, 0, 0.3921569, 1, 1,
0.2196905, -0.3887266, 0.489181, 0, 0.3882353, 1, 1,
0.2225848, 1.268994, 0.5353873, 0, 0.3803922, 1, 1,
0.2257743, 1.864317, -0.6783134, 0, 0.3764706, 1, 1,
0.2263282, -1.80633, 2.808242, 0, 0.3686275, 1, 1,
0.2280472, -0.8219193, 3.453869, 0, 0.3647059, 1, 1,
0.2280811, 2.663671, 1.577551, 0, 0.3568628, 1, 1,
0.2340241, 0.3139903, 1.412738, 0, 0.3529412, 1, 1,
0.2354817, 0.3343978, -0.8804013, 0, 0.345098, 1, 1,
0.2392395, -0.1882032, 1.113475, 0, 0.3411765, 1, 1,
0.2416108, 0.8727408, 1.138651, 0, 0.3333333, 1, 1,
0.2437564, -1.689063, 3.322846, 0, 0.3294118, 1, 1,
0.2463313, -0.0148187, 1.963956, 0, 0.3215686, 1, 1,
0.2475036, 0.6456146, 0.1820981, 0, 0.3176471, 1, 1,
0.249078, -0.524707, 2.440379, 0, 0.3098039, 1, 1,
0.2528029, 1.682148, -2.860387, 0, 0.3058824, 1, 1,
0.2534364, 0.355749, -0.6887172, 0, 0.2980392, 1, 1,
0.2535088, -0.2302448, 2.664664, 0, 0.2901961, 1, 1,
0.2539133, -0.1190211, 2.917147, 0, 0.2862745, 1, 1,
0.2566782, -0.03153155, 2.35876, 0, 0.2784314, 1, 1,
0.2570193, -0.8543032, 1.914111, 0, 0.2745098, 1, 1,
0.2589982, 0.9664035, -1.160453, 0, 0.2666667, 1, 1,
0.2650403, -0.3449381, 3.744453, 0, 0.2627451, 1, 1,
0.2658436, -0.4180968, -0.02665772, 0, 0.254902, 1, 1,
0.2670195, 0.9171576, 0.5776459, 0, 0.2509804, 1, 1,
0.272033, 0.9690718, -1.092995, 0, 0.2431373, 1, 1,
0.2838222, 0.8559992, -0.1378668, 0, 0.2392157, 1, 1,
0.2881275, 0.8076347, -0.03661994, 0, 0.2313726, 1, 1,
0.2883547, -0.5615487, 3.692037, 0, 0.227451, 1, 1,
0.288426, 0.5410904, -1.72852, 0, 0.2196078, 1, 1,
0.2890241, -0.2085995, 2.872628, 0, 0.2156863, 1, 1,
0.2893064, -0.1765809, 1.079539, 0, 0.2078431, 1, 1,
0.2914999, 0.7931573, 1.656692, 0, 0.2039216, 1, 1,
0.2977697, -0.449268, 0.7532271, 0, 0.1960784, 1, 1,
0.29907, -0.9251323, 4.002835, 0, 0.1882353, 1, 1,
0.2992006, 0.7906069, 1.300586, 0, 0.1843137, 1, 1,
0.3022776, 1.293154, -0.2095474, 0, 0.1764706, 1, 1,
0.3024209, -1.18913, 4.521932, 0, 0.172549, 1, 1,
0.3037767, -0.08669276, 1.903116, 0, 0.1647059, 1, 1,
0.3049743, 0.7897868, 0.7933968, 0, 0.1607843, 1, 1,
0.3113044, 1.548955, 0.05541953, 0, 0.1529412, 1, 1,
0.319409, 0.2134775, 2.098667, 0, 0.1490196, 1, 1,
0.3194356, 0.1350475, 1.205912, 0, 0.1411765, 1, 1,
0.3201736, 0.3333997, 1.200769, 0, 0.1372549, 1, 1,
0.3223646, 0.3003885, 1.730493, 0, 0.1294118, 1, 1,
0.3241812, -0.752732, 3.84582, 0, 0.1254902, 1, 1,
0.3250919, 1.232867, 1.654343, 0, 0.1176471, 1, 1,
0.3282421, -0.06955647, 1.470189, 0, 0.1137255, 1, 1,
0.3316591, -0.3567573, 0.344656, 0, 0.1058824, 1, 1,
0.3325887, 0.3073213, -0.3030323, 0, 0.09803922, 1, 1,
0.3332202, -0.1147206, 3.132503, 0, 0.09411765, 1, 1,
0.3352011, 0.8901731, -0.9966406, 0, 0.08627451, 1, 1,
0.3367502, -0.4446329, 1.195978, 0, 0.08235294, 1, 1,
0.3387572, -0.04348327, 1.724831, 0, 0.07450981, 1, 1,
0.3426511, -1.861536, 4.888863, 0, 0.07058824, 1, 1,
0.3437447, 0.5018525, 0.8932915, 0, 0.0627451, 1, 1,
0.3443429, 0.3249129, 1.75818, 0, 0.05882353, 1, 1,
0.3446146, 1.068086, 1.903583, 0, 0.05098039, 1, 1,
0.3447615, 0.2898945, 1.567135, 0, 0.04705882, 1, 1,
0.3459606, 0.5853912, -0.2405616, 0, 0.03921569, 1, 1,
0.3512152, -1.469022, 1.967196, 0, 0.03529412, 1, 1,
0.3541957, 0.567472, 1.023811, 0, 0.02745098, 1, 1,
0.3571619, 0.3973983, 0.1442404, 0, 0.02352941, 1, 1,
0.3575487, -0.1797555, -0.3393262, 0, 0.01568628, 1, 1,
0.3597628, 1.182172, 0.1890327, 0, 0.01176471, 1, 1,
0.3609504, 0.2446662, 1.313752, 0, 0.003921569, 1, 1,
0.3649563, 1.411796, 0.06907622, 0.003921569, 0, 1, 1,
0.3653549, 1.10884, 0.4676773, 0.007843138, 0, 1, 1,
0.3681598, -0.2570458, 3.9579, 0.01568628, 0, 1, 1,
0.3712336, -0.1357125, -1.523905, 0.01960784, 0, 1, 1,
0.3739083, 1.074185, -0.761875, 0.02745098, 0, 1, 1,
0.3740041, 0.1365468, -0.2996821, 0.03137255, 0, 1, 1,
0.3753463, -0.2433288, 3.389492, 0.03921569, 0, 1, 1,
0.3782014, 0.6695731, -1.088623, 0.04313726, 0, 1, 1,
0.3782478, 0.9956834, 1.478095, 0.05098039, 0, 1, 1,
0.3811001, -0.1587704, 2.622432, 0.05490196, 0, 1, 1,
0.3847644, -0.01017332, 1.877609, 0.0627451, 0, 1, 1,
0.3875678, 0.9352105, 0.02215152, 0.06666667, 0, 1, 1,
0.3902021, -0.8530935, 2.704156, 0.07450981, 0, 1, 1,
0.3908335, 0.5034094, -0.351248, 0.07843138, 0, 1, 1,
0.3926038, 1.052676, 1.438706, 0.08627451, 0, 1, 1,
0.3930613, 0.8596021, 0.6139966, 0.09019608, 0, 1, 1,
0.3989371, 0.7249067, 2.814743, 0.09803922, 0, 1, 1,
0.4026972, 0.3229302, 0.6086291, 0.1058824, 0, 1, 1,
0.402861, -1.678365, 2.419839, 0.1098039, 0, 1, 1,
0.411618, 1.212621, 0.03554634, 0.1176471, 0, 1, 1,
0.4130261, 0.6092416, 1.079084, 0.1215686, 0, 1, 1,
0.4135134, 1.243256, 1.028335, 0.1294118, 0, 1, 1,
0.414845, -0.6344343, 1.787957, 0.1333333, 0, 1, 1,
0.4151865, -0.2407443, 0.6508411, 0.1411765, 0, 1, 1,
0.4176584, 1.275916, 1.102519, 0.145098, 0, 1, 1,
0.4180628, -0.08346224, 1.756071, 0.1529412, 0, 1, 1,
0.4196522, 1.104798, 0.4651841, 0.1568628, 0, 1, 1,
0.4203819, 0.6469616, 1.171024, 0.1647059, 0, 1, 1,
0.4213245, -1.88182, 3.181627, 0.1686275, 0, 1, 1,
0.4215714, 1.237824, -0.7055054, 0.1764706, 0, 1, 1,
0.4266739, 0.7874243, -0.4362828, 0.1803922, 0, 1, 1,
0.4329668, 0.6152071, 0.7577912, 0.1882353, 0, 1, 1,
0.4334106, 0.07048379, 1.426785, 0.1921569, 0, 1, 1,
0.4400839, 0.1974546, 0.358059, 0.2, 0, 1, 1,
0.4404808, 0.4079034, 0.3541437, 0.2078431, 0, 1, 1,
0.4407983, -0.1188649, 2.019764, 0.2117647, 0, 1, 1,
0.4486926, -0.4256475, 1.57519, 0.2196078, 0, 1, 1,
0.449451, 0.4428445, 1.610066, 0.2235294, 0, 1, 1,
0.4517002, -1.172452, 1.55149, 0.2313726, 0, 1, 1,
0.4523537, -0.8324934, 3.414629, 0.2352941, 0, 1, 1,
0.453745, 0.6899794, 0.4255857, 0.2431373, 0, 1, 1,
0.454393, 0.01774992, 3.010197, 0.2470588, 0, 1, 1,
0.4639878, 0.4488504, 2.199809, 0.254902, 0, 1, 1,
0.4646245, 0.4086412, 2.300668, 0.2588235, 0, 1, 1,
0.4650509, -0.0682926, 1.292129, 0.2666667, 0, 1, 1,
0.4661021, -0.5370354, 1.985226, 0.2705882, 0, 1, 1,
0.4686956, -0.3224526, 3.688631, 0.2784314, 0, 1, 1,
0.479497, 0.4608037, -0.01235064, 0.282353, 0, 1, 1,
0.4801588, -0.5461414, 3.402717, 0.2901961, 0, 1, 1,
0.4857287, 0.05340526, 1.652589, 0.2941177, 0, 1, 1,
0.4915964, 0.1451846, 0.908446, 0.3019608, 0, 1, 1,
0.5049692, -0.2662388, 1.746587, 0.3098039, 0, 1, 1,
0.5058988, 2.413801, -0.2076104, 0.3137255, 0, 1, 1,
0.5170937, -0.4967613, 1.680276, 0.3215686, 0, 1, 1,
0.5171924, 0.5282055, 1.519617, 0.3254902, 0, 1, 1,
0.5176067, 0.2349583, 1.837408, 0.3333333, 0, 1, 1,
0.518833, -0.2744477, 3.014709, 0.3372549, 0, 1, 1,
0.5224118, -1.773638, 4.207845, 0.345098, 0, 1, 1,
0.5225914, -1.008682, 1.520519, 0.3490196, 0, 1, 1,
0.5232507, 1.176181, 1.438456, 0.3568628, 0, 1, 1,
0.5279717, -0.1909726, 1.162238, 0.3607843, 0, 1, 1,
0.5342446, 0.2977407, 0.7511761, 0.3686275, 0, 1, 1,
0.5379346, 0.04211807, -0.8214386, 0.372549, 0, 1, 1,
0.5388001, -1.34865, 2.587962, 0.3803922, 0, 1, 1,
0.5400737, -0.6338596, 2.51044, 0.3843137, 0, 1, 1,
0.5416184, 0.819913, 1.052074, 0.3921569, 0, 1, 1,
0.5428068, 1.020517, 1.156917, 0.3960784, 0, 1, 1,
0.5461712, 0.9332876, -0.928793, 0.4039216, 0, 1, 1,
0.5500063, 0.2277166, 3.352308, 0.4117647, 0, 1, 1,
0.5502868, 1.225032, -0.651803, 0.4156863, 0, 1, 1,
0.5533012, 0.9793617, -1.138878, 0.4235294, 0, 1, 1,
0.5533123, -0.6266732, 2.33684, 0.427451, 0, 1, 1,
0.5538195, 1.817205, -0.3141974, 0.4352941, 0, 1, 1,
0.5600896, 0.9372762, 1.03758, 0.4392157, 0, 1, 1,
0.5618759, 0.5576608, 0.9435596, 0.4470588, 0, 1, 1,
0.5674082, 1.214867, 1.033931, 0.4509804, 0, 1, 1,
0.5678966, -0.324614, 2.15085, 0.4588235, 0, 1, 1,
0.5716895, -0.5476527, 2.380017, 0.4627451, 0, 1, 1,
0.5742665, -1.85035, 3.690841, 0.4705882, 0, 1, 1,
0.5789355, 0.1683442, 1.148736, 0.4745098, 0, 1, 1,
0.5793508, -0.6317588, 3.047476, 0.4823529, 0, 1, 1,
0.5862904, -0.4309976, 1.258188, 0.4862745, 0, 1, 1,
0.5956367, -0.2789826, 3.708023, 0.4941176, 0, 1, 1,
0.5966695, -0.09432302, 1.796792, 0.5019608, 0, 1, 1,
0.5976381, 0.7273236, 0.9319156, 0.5058824, 0, 1, 1,
0.6017554, -1.049936, 2.395066, 0.5137255, 0, 1, 1,
0.6032763, -0.5951806, 2.283992, 0.5176471, 0, 1, 1,
0.6090891, 0.6235266, -0.2784694, 0.5254902, 0, 1, 1,
0.6130135, 0.1435511, 3.152704, 0.5294118, 0, 1, 1,
0.6159495, -0.2832955, 1.08869, 0.5372549, 0, 1, 1,
0.6182379, -0.3166702, 2.252359, 0.5411765, 0, 1, 1,
0.6211575, -0.5432956, 2.0979, 0.5490196, 0, 1, 1,
0.6236248, 0.8976017, -0.3184245, 0.5529412, 0, 1, 1,
0.6276004, -1.075993, 2.380332, 0.5607843, 0, 1, 1,
0.631766, -0.7682285, 4.707096, 0.5647059, 0, 1, 1,
0.6347438, 0.3658823, 0.71694, 0.572549, 0, 1, 1,
0.6354081, -1.122713, 1.029357, 0.5764706, 0, 1, 1,
0.6395409, 0.0634767, 2.846287, 0.5843138, 0, 1, 1,
0.6449468, 0.5417476, -0.4939, 0.5882353, 0, 1, 1,
0.6452219, -0.1283439, 2.098084, 0.5960785, 0, 1, 1,
0.6473053, -2.4654, 2.07234, 0.6039216, 0, 1, 1,
0.6524056, -0.8988433, 1.640291, 0.6078432, 0, 1, 1,
0.6528254, 0.2830954, 0.7971361, 0.6156863, 0, 1, 1,
0.6558674, -0.09122947, 2.883807, 0.6196079, 0, 1, 1,
0.6559098, -0.3847127, 3.73049, 0.627451, 0, 1, 1,
0.6604086, 0.01124876, 1.801975, 0.6313726, 0, 1, 1,
0.6608912, -0.6252543, 2.35457, 0.6392157, 0, 1, 1,
0.6651564, -0.7354411, 3.238877, 0.6431373, 0, 1, 1,
0.6656449, -0.1651324, 2.462193, 0.6509804, 0, 1, 1,
0.6679513, -1.542751, 0.6588642, 0.654902, 0, 1, 1,
0.6704072, 1.143513, -0.3794131, 0.6627451, 0, 1, 1,
0.6808233, -0.4934249, 2.208818, 0.6666667, 0, 1, 1,
0.6813918, -1.382314, 1.807971, 0.6745098, 0, 1, 1,
0.6926547, 0.7860866, 0.9999781, 0.6784314, 0, 1, 1,
0.6943592, -0.1127131, 4.924377, 0.6862745, 0, 1, 1,
0.6952598, 1.611256, 0.8647837, 0.6901961, 0, 1, 1,
0.7004243, -2.586056, 1.518387, 0.6980392, 0, 1, 1,
0.7004898, 0.2071279, 2.230009, 0.7058824, 0, 1, 1,
0.7040977, 0.4126136, 1.457578, 0.7098039, 0, 1, 1,
0.7069233, 0.334804, 1.434607, 0.7176471, 0, 1, 1,
0.7087183, -0.3853011, 1.975339, 0.7215686, 0, 1, 1,
0.7098349, 1.986202, 1.45383, 0.7294118, 0, 1, 1,
0.7127793, 1.291605, -0.06339242, 0.7333333, 0, 1, 1,
0.7131416, 2.224672, 0.9427372, 0.7411765, 0, 1, 1,
0.7146329, 0.6355174, -0.3809535, 0.7450981, 0, 1, 1,
0.7222607, 1.296104, 1.03327, 0.7529412, 0, 1, 1,
0.7249218, 2.001473, -0.7672647, 0.7568628, 0, 1, 1,
0.7308655, 0.04654693, 2.134712, 0.7647059, 0, 1, 1,
0.739854, 0.1125541, 0.5776392, 0.7686275, 0, 1, 1,
0.742618, -0.4034072, 2.332805, 0.7764706, 0, 1, 1,
0.7440519, -0.335317, 3.083655, 0.7803922, 0, 1, 1,
0.7448999, -0.09555229, 1.973244, 0.7882353, 0, 1, 1,
0.745795, 0.8237571, 2.365927, 0.7921569, 0, 1, 1,
0.7462431, 0.1054649, 2.66343, 0.8, 0, 1, 1,
0.7501296, 1.24679, 0.7723569, 0.8078431, 0, 1, 1,
0.7510062, 2.537228, -0.4643163, 0.8117647, 0, 1, 1,
0.7518643, -0.06215005, 1.053055, 0.8196079, 0, 1, 1,
0.7526871, 0.2221119, 3.524539, 0.8235294, 0, 1, 1,
0.754529, 0.04007422, 0.7830703, 0.8313726, 0, 1, 1,
0.76327, 0.5274225, 2.584883, 0.8352941, 0, 1, 1,
0.7633621, 1.374671, 0.6340688, 0.8431373, 0, 1, 1,
0.7641278, -1.125144, 1.998198, 0.8470588, 0, 1, 1,
0.7722172, -1.590754, 1.420065, 0.854902, 0, 1, 1,
0.7768995, -1.237144, 4.315702, 0.8588235, 0, 1, 1,
0.7784125, 0.4745395, 1.547289, 0.8666667, 0, 1, 1,
0.7792639, 0.1775928, 2.686278, 0.8705882, 0, 1, 1,
0.7906961, -0.02046906, -0.6333584, 0.8784314, 0, 1, 1,
0.7921476, -0.04376478, 2.617519, 0.8823529, 0, 1, 1,
0.7961259, 1.227273, -1.024872, 0.8901961, 0, 1, 1,
0.7984915, -0.7685658, 3.370157, 0.8941177, 0, 1, 1,
0.8007674, -0.1795722, 2.849076, 0.9019608, 0, 1, 1,
0.8026296, -0.08156577, 3.002882, 0.9098039, 0, 1, 1,
0.8032957, 0.3842339, 1.561181, 0.9137255, 0, 1, 1,
0.8048899, 0.01347145, 2.232169, 0.9215686, 0, 1, 1,
0.8118339, -0.4247772, 3.217972, 0.9254902, 0, 1, 1,
0.8197126, -1.192833, 2.643354, 0.9333333, 0, 1, 1,
0.8292067, -0.9598625, 2.510962, 0.9372549, 0, 1, 1,
0.8382694, 2.034343, -0.2299289, 0.945098, 0, 1, 1,
0.839088, 0.594052, -0.9918776, 0.9490196, 0, 1, 1,
0.8486586, 1.081755, -0.344756, 0.9568627, 0, 1, 1,
0.8518236, 0.1736538, -0.3618536, 0.9607843, 0, 1, 1,
0.8529545, 0.9635973, 0.9104858, 0.9686275, 0, 1, 1,
0.8633732, -0.02262474, 2.178619, 0.972549, 0, 1, 1,
0.8647068, -1.217175, 3.853174, 0.9803922, 0, 1, 1,
0.8717053, -1.468365, 1.161466, 0.9843137, 0, 1, 1,
0.8757376, -1.874623, 2.482546, 0.9921569, 0, 1, 1,
0.8797887, 1.299975, -0.2039817, 0.9960784, 0, 1, 1,
0.8805491, -1.43085, 3.268381, 1, 0, 0.9960784, 1,
0.8830137, 0.7876897, -0.9521677, 1, 0, 0.9882353, 1,
0.8840473, 1.153354, 2.448013, 1, 0, 0.9843137, 1,
0.8907753, -0.07835343, 0.3450157, 1, 0, 0.9764706, 1,
0.8909952, 0.7430224, 1.996449, 1, 0, 0.972549, 1,
0.8951548, -0.2859303, 2.624186, 1, 0, 0.9647059, 1,
0.9027251, -0.6044374, 1.946569, 1, 0, 0.9607843, 1,
0.908339, -0.6044248, 3.120968, 1, 0, 0.9529412, 1,
0.9098958, 0.3797029, 1.327254, 1, 0, 0.9490196, 1,
0.9279947, 0.4615636, 0.9136994, 1, 0, 0.9411765, 1,
0.9354944, 0.2350908, 0.9278083, 1, 0, 0.9372549, 1,
0.9502773, -0.4885276, 0.1961652, 1, 0, 0.9294118, 1,
0.9522856, 1.368372, 0.936181, 1, 0, 0.9254902, 1,
0.9536018, -0.1672008, 1.62686, 1, 0, 0.9176471, 1,
0.9632368, -1.029406, 2.432853, 1, 0, 0.9137255, 1,
0.964559, -1.907899, 2.92763, 1, 0, 0.9058824, 1,
0.9645745, 1.109527, -0.2331916, 1, 0, 0.9019608, 1,
0.9664215, 0.7408122, 0.6883367, 1, 0, 0.8941177, 1,
0.9811642, -2.1031, 2.755249, 1, 0, 0.8862745, 1,
0.9820862, 0.5499966, 0.8867608, 1, 0, 0.8823529, 1,
0.9845108, 0.03884819, 1.598021, 1, 0, 0.8745098, 1,
0.988874, -0.09273097, 0.8542935, 1, 0, 0.8705882, 1,
0.9994107, -0.9953471, 2.639789, 1, 0, 0.8627451, 1,
1.002738, 1.110399, 1.170063, 1, 0, 0.8588235, 1,
1.014022, -1.210309, 1.093093, 1, 0, 0.8509804, 1,
1.018816, 0.08220082, 1.44136, 1, 0, 0.8470588, 1,
1.019219, 0.6886704, 0.5478833, 1, 0, 0.8392157, 1,
1.023508, -0.4520314, 3.484709, 1, 0, 0.8352941, 1,
1.027203, -0.2190671, 2.036632, 1, 0, 0.827451, 1,
1.027773, 0.1936703, 1.838916, 1, 0, 0.8235294, 1,
1.03531, 0.3450871, 1.497986, 1, 0, 0.8156863, 1,
1.041436, 0.3997069, 0.4944701, 1, 0, 0.8117647, 1,
1.041603, -1.14056, 2.313354, 1, 0, 0.8039216, 1,
1.042878, 2.244231, -0.1746875, 1, 0, 0.7960784, 1,
1.043549, -0.4151828, 1.583994, 1, 0, 0.7921569, 1,
1.064793, 0.6423835, 0.06898893, 1, 0, 0.7843137, 1,
1.066862, 1.446119, 0.6272333, 1, 0, 0.7803922, 1,
1.067789, -2.068627, 2.231309, 1, 0, 0.772549, 1,
1.073148, 0.5832478, 1.08897, 1, 0, 0.7686275, 1,
1.07563, 1.392884, -0.2249891, 1, 0, 0.7607843, 1,
1.08867, 0.5373895, 1.26972, 1, 0, 0.7568628, 1,
1.092371, 1.571921, 0.6411859, 1, 0, 0.7490196, 1,
1.098547, 0.4887481, 0.8311046, 1, 0, 0.7450981, 1,
1.099394, 0.4461677, 0.2524682, 1, 0, 0.7372549, 1,
1.101388, 1.910437, 2.628068, 1, 0, 0.7333333, 1,
1.104108, -0.4955179, 3.587531, 1, 0, 0.7254902, 1,
1.107602, -0.02845517, 0.7492422, 1, 0, 0.7215686, 1,
1.109038, -1.174068, 1.730739, 1, 0, 0.7137255, 1,
1.11895, 0.7387202, 0.04104881, 1, 0, 0.7098039, 1,
1.119648, 0.3582245, -0.3010166, 1, 0, 0.7019608, 1,
1.120943, -0.1553007, 3.259162, 1, 0, 0.6941177, 1,
1.130878, -0.1476604, 1.508885, 1, 0, 0.6901961, 1,
1.143879, -2.342283, 2.16301, 1, 0, 0.682353, 1,
1.156561, 0.9404288, 0.5657811, 1, 0, 0.6784314, 1,
1.159118, 0.8021656, 0.2190032, 1, 0, 0.6705883, 1,
1.165401, -1.029497, 0.7089314, 1, 0, 0.6666667, 1,
1.174929, 0.2397791, 2.839868, 1, 0, 0.6588235, 1,
1.179903, 0.5440747, 2.522649, 1, 0, 0.654902, 1,
1.191818, -1.875439, 2.396742, 1, 0, 0.6470588, 1,
1.192287, 2.071379, 0.3984802, 1, 0, 0.6431373, 1,
1.201862, 0.3865326, 0.4669498, 1, 0, 0.6352941, 1,
1.210202, 0.7678617, 1.198022, 1, 0, 0.6313726, 1,
1.215925, 0.1556479, 1.477864, 1, 0, 0.6235294, 1,
1.217555, -1.996957, 3.706694, 1, 0, 0.6196079, 1,
1.219447, 0.3888618, 0.8613417, 1, 0, 0.6117647, 1,
1.223806, -0.6855344, 3.398169, 1, 0, 0.6078432, 1,
1.230835, -0.3833905, 2.160881, 1, 0, 0.6, 1,
1.247703, -1.755003, 2.030898, 1, 0, 0.5921569, 1,
1.248591, 0.2868202, 1.352964, 1, 0, 0.5882353, 1,
1.251091, -1.457201, 3.531565, 1, 0, 0.5803922, 1,
1.264699, -0.116125, 1.602627, 1, 0, 0.5764706, 1,
1.265934, 2.709865, 1.264703, 1, 0, 0.5686275, 1,
1.266779, -0.5032889, 2.540644, 1, 0, 0.5647059, 1,
1.283334, -0.009509775, 0.9467298, 1, 0, 0.5568628, 1,
1.283535, -0.2760035, 0.9028538, 1, 0, 0.5529412, 1,
1.288355, 0.324705, 2.211183, 1, 0, 0.5450981, 1,
1.289033, 0.320445, 2.562742, 1, 0, 0.5411765, 1,
1.294778, -1.246592, 1.464162, 1, 0, 0.5333334, 1,
1.295682, 0.3438817, 2.120435, 1, 0, 0.5294118, 1,
1.310818, 0.7214097, 0.1740378, 1, 0, 0.5215687, 1,
1.312863, -0.4785892, 3.357965, 1, 0, 0.5176471, 1,
1.321343, -0.1875977, 1.256972, 1, 0, 0.509804, 1,
1.327538, -0.3937683, 2.963807, 1, 0, 0.5058824, 1,
1.329909, 1.444309, 2.174061, 1, 0, 0.4980392, 1,
1.332868, -0.3834418, 2.095233, 1, 0, 0.4901961, 1,
1.344705, -0.1431964, 0.6278417, 1, 0, 0.4862745, 1,
1.361682, 0.6834677, 4.000362, 1, 0, 0.4784314, 1,
1.363948, -0.2464651, 2.583752, 1, 0, 0.4745098, 1,
1.367221, -1.568229, 3.198725, 1, 0, 0.4666667, 1,
1.368238, 1.225727, 1.518041, 1, 0, 0.4627451, 1,
1.36917, 0.6086797, 1.285921, 1, 0, 0.454902, 1,
1.372914, -1.176594, 1.715523, 1, 0, 0.4509804, 1,
1.376508, -0.7072156, 2.132746, 1, 0, 0.4431373, 1,
1.394734, -0.214514, 2.61474, 1, 0, 0.4392157, 1,
1.402153, 1.773806, 1.098024, 1, 0, 0.4313726, 1,
1.425098, -1.447209, 1.742487, 1, 0, 0.427451, 1,
1.42794, -0.5237778, 1.276492, 1, 0, 0.4196078, 1,
1.429004, 0.1135986, 1.736195, 1, 0, 0.4156863, 1,
1.431635, 0.3694242, -0.4109639, 1, 0, 0.4078431, 1,
1.441889, -2.555785, 3.473994, 1, 0, 0.4039216, 1,
1.45397, -0.4145539, 2.43309, 1, 0, 0.3960784, 1,
1.455022, 1.438796, 0.9709818, 1, 0, 0.3882353, 1,
1.455328, -0.4008737, 2.370667, 1, 0, 0.3843137, 1,
1.46717, 0.4293809, 1.339998, 1, 0, 0.3764706, 1,
1.473947, 0.04485644, 2.647943, 1, 0, 0.372549, 1,
1.481954, -0.8653511, 2.224974, 1, 0, 0.3647059, 1,
1.485954, 2.072686, 0.9570652, 1, 0, 0.3607843, 1,
1.489461, -1.134661, 1.245274, 1, 0, 0.3529412, 1,
1.508407, 0.283004, 2.800385, 1, 0, 0.3490196, 1,
1.518701, -0.1918837, 2.952959, 1, 0, 0.3411765, 1,
1.520041, -0.1858442, 1.523419, 1, 0, 0.3372549, 1,
1.53477, -1.327988, 4.643534, 1, 0, 0.3294118, 1,
1.560956, -0.3411312, 2.284268, 1, 0, 0.3254902, 1,
1.573454, -0.7640672, 2.546909, 1, 0, 0.3176471, 1,
1.589601, 0.5748938, -0.2693964, 1, 0, 0.3137255, 1,
1.597238, 0.6608138, 0.764284, 1, 0, 0.3058824, 1,
1.598429, 0.8148908, 1.526361, 1, 0, 0.2980392, 1,
1.605674, -0.6389307, 1.589939, 1, 0, 0.2941177, 1,
1.619119, 1.411648, 1.029828, 1, 0, 0.2862745, 1,
1.633404, 0.4269578, 2.665923, 1, 0, 0.282353, 1,
1.638963, 0.09999347, 1.966333, 1, 0, 0.2745098, 1,
1.642138, 0.5255454, 0.5458575, 1, 0, 0.2705882, 1,
1.644699, 0.431513, 0.6564546, 1, 0, 0.2627451, 1,
1.655761, -0.1729953, 1.15631, 1, 0, 0.2588235, 1,
1.657722, 0.3847137, 2.377132, 1, 0, 0.2509804, 1,
1.659207, -1.784419, 3.671649, 1, 0, 0.2470588, 1,
1.690418, -1.128326, 3.205856, 1, 0, 0.2392157, 1,
1.696737, 0.7387535, 2.862084, 1, 0, 0.2352941, 1,
1.717101, -2.350703, 2.271447, 1, 0, 0.227451, 1,
1.728632, -0.7272307, 2.114971, 1, 0, 0.2235294, 1,
1.734362, -0.2775106, 2.118503, 1, 0, 0.2156863, 1,
1.754582, -1.891899, 2.854922, 1, 0, 0.2117647, 1,
1.762345, 1.099953, 0.3644392, 1, 0, 0.2039216, 1,
1.778491, -0.4002247, 2.02702, 1, 0, 0.1960784, 1,
1.782516, -0.888683, 0.5944107, 1, 0, 0.1921569, 1,
1.786593, 1.342664, 1.279427, 1, 0, 0.1843137, 1,
1.838447, -0.4971622, 2.319498, 1, 0, 0.1803922, 1,
1.859836, -0.348268, 0.9513532, 1, 0, 0.172549, 1,
1.869309, 0.09010986, 0.613973, 1, 0, 0.1686275, 1,
1.89942, -1.040667, 2.250433, 1, 0, 0.1607843, 1,
1.904201, 0.1766372, 1.26569, 1, 0, 0.1568628, 1,
1.929115, 0.5953642, 0.5493369, 1, 0, 0.1490196, 1,
1.930743, 0.4549964, 1.698208, 1, 0, 0.145098, 1,
1.933551, 1.395838, 1.125294, 1, 0, 0.1372549, 1,
1.942591, 0.9843577, 1.926052, 1, 0, 0.1333333, 1,
1.969838, 0.005996767, 2.316713, 1, 0, 0.1254902, 1,
1.976292, 0.4174586, 1.275129, 1, 0, 0.1215686, 1,
1.996671, 1.493611, 0.8979121, 1, 0, 0.1137255, 1,
2.052475, 0.3126764, 2.698925, 1, 0, 0.1098039, 1,
2.065905, -0.7110769, 3.341867, 1, 0, 0.1019608, 1,
2.082901, 1.733578, 1.332789, 1, 0, 0.09411765, 1,
2.083619, 1.725617, -0.8122573, 1, 0, 0.09019608, 1,
2.117341, -1.127734, 2.251688, 1, 0, 0.08235294, 1,
2.132919, 1.282699, 0.735236, 1, 0, 0.07843138, 1,
2.160254, 0.05959678, 1.716091, 1, 0, 0.07058824, 1,
2.164246, -0.7369571, 1.509784, 1, 0, 0.06666667, 1,
2.188126, -0.03788031, 1.84544, 1, 0, 0.05882353, 1,
2.224116, 0.8717678, 0.383318, 1, 0, 0.05490196, 1,
2.255922, -1.38096, 1.253591, 1, 0, 0.04705882, 1,
2.346146, 0.6936375, 0.6329185, 1, 0, 0.04313726, 1,
2.46106, -1.068828, 1.359852, 1, 0, 0.03529412, 1,
2.577413, 2.2744, 1.174489, 1, 0, 0.03137255, 1,
2.652289, -0.540962, 1.670994, 1, 0, 0.02352941, 1,
2.700787, -0.2791936, 1.790751, 1, 0, 0.01960784, 1,
2.879159, -0.6116827, 2.042327, 1, 0, 0.01176471, 1,
3.073761, 0.8889972, 2.205749, 1, 0, 0.007843138, 1
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
0.142759, -4.221033, -6.705869, 0, -0.5, 0.5, 0.5,
0.142759, -4.221033, -6.705869, 1, -0.5, 0.5, 0.5,
0.142759, -4.221033, -6.705869, 1, 1.5, 0.5, 0.5,
0.142759, -4.221033, -6.705869, 0, 1.5, 0.5, 0.5
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
-3.781852, -0.1146539, -6.705869, 0, -0.5, 0.5, 0.5,
-3.781852, -0.1146539, -6.705869, 1, -0.5, 0.5, 0.5,
-3.781852, -0.1146539, -6.705869, 1, 1.5, 0.5, 0.5,
-3.781852, -0.1146539, -6.705869, 0, 1.5, 0.5, 0.5
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
-3.781852, -4.221033, -0.02288604, 0, -0.5, 0.5, 0.5,
-3.781852, -4.221033, -0.02288604, 1, -0.5, 0.5, 0.5,
-3.781852, -4.221033, -0.02288604, 1, 1.5, 0.5, 0.5,
-3.781852, -4.221033, -0.02288604, 0, 1.5, 0.5, 0.5
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
-2, -3.273407, -5.163642,
3, -3.273407, -5.163642,
-2, -3.273407, -5.163642,
-2, -3.431345, -5.420681,
-1, -3.273407, -5.163642,
-1, -3.431345, -5.420681,
0, -3.273407, -5.163642,
0, -3.431345, -5.420681,
1, -3.273407, -5.163642,
1, -3.431345, -5.420681,
2, -3.273407, -5.163642,
2, -3.431345, -5.420681,
3, -3.273407, -5.163642,
3, -3.431345, -5.420681
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
-2, -3.74722, -5.934756, 0, -0.5, 0.5, 0.5,
-2, -3.74722, -5.934756, 1, -0.5, 0.5, 0.5,
-2, -3.74722, -5.934756, 1, 1.5, 0.5, 0.5,
-2, -3.74722, -5.934756, 0, 1.5, 0.5, 0.5,
-1, -3.74722, -5.934756, 0, -0.5, 0.5, 0.5,
-1, -3.74722, -5.934756, 1, -0.5, 0.5, 0.5,
-1, -3.74722, -5.934756, 1, 1.5, 0.5, 0.5,
-1, -3.74722, -5.934756, 0, 1.5, 0.5, 0.5,
0, -3.74722, -5.934756, 0, -0.5, 0.5, 0.5,
0, -3.74722, -5.934756, 1, -0.5, 0.5, 0.5,
0, -3.74722, -5.934756, 1, 1.5, 0.5, 0.5,
0, -3.74722, -5.934756, 0, 1.5, 0.5, 0.5,
1, -3.74722, -5.934756, 0, -0.5, 0.5, 0.5,
1, -3.74722, -5.934756, 1, -0.5, 0.5, 0.5,
1, -3.74722, -5.934756, 1, 1.5, 0.5, 0.5,
1, -3.74722, -5.934756, 0, 1.5, 0.5, 0.5,
2, -3.74722, -5.934756, 0, -0.5, 0.5, 0.5,
2, -3.74722, -5.934756, 1, -0.5, 0.5, 0.5,
2, -3.74722, -5.934756, 1, 1.5, 0.5, 0.5,
2, -3.74722, -5.934756, 0, 1.5, 0.5, 0.5,
3, -3.74722, -5.934756, 0, -0.5, 0.5, 0.5,
3, -3.74722, -5.934756, 1, -0.5, 0.5, 0.5,
3, -3.74722, -5.934756, 1, 1.5, 0.5, 0.5,
3, -3.74722, -5.934756, 0, 1.5, 0.5, 0.5
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
-2.876173, -3, -5.163642,
-2.876173, 2, -5.163642,
-2.876173, -3, -5.163642,
-3.027119, -3, -5.420681,
-2.876173, -2, -5.163642,
-3.027119, -2, -5.420681,
-2.876173, -1, -5.163642,
-3.027119, -1, -5.420681,
-2.876173, 0, -5.163642,
-3.027119, 0, -5.420681,
-2.876173, 1, -5.163642,
-3.027119, 1, -5.420681,
-2.876173, 2, -5.163642,
-3.027119, 2, -5.420681
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
-3.329012, -3, -5.934756, 0, -0.5, 0.5, 0.5,
-3.329012, -3, -5.934756, 1, -0.5, 0.5, 0.5,
-3.329012, -3, -5.934756, 1, 1.5, 0.5, 0.5,
-3.329012, -3, -5.934756, 0, 1.5, 0.5, 0.5,
-3.329012, -2, -5.934756, 0, -0.5, 0.5, 0.5,
-3.329012, -2, -5.934756, 1, -0.5, 0.5, 0.5,
-3.329012, -2, -5.934756, 1, 1.5, 0.5, 0.5,
-3.329012, -2, -5.934756, 0, 1.5, 0.5, 0.5,
-3.329012, -1, -5.934756, 0, -0.5, 0.5, 0.5,
-3.329012, -1, -5.934756, 1, -0.5, 0.5, 0.5,
-3.329012, -1, -5.934756, 1, 1.5, 0.5, 0.5,
-3.329012, -1, -5.934756, 0, 1.5, 0.5, 0.5,
-3.329012, 0, -5.934756, 0, -0.5, 0.5, 0.5,
-3.329012, 0, -5.934756, 1, -0.5, 0.5, 0.5,
-3.329012, 0, -5.934756, 1, 1.5, 0.5, 0.5,
-3.329012, 0, -5.934756, 0, 1.5, 0.5, 0.5,
-3.329012, 1, -5.934756, 0, -0.5, 0.5, 0.5,
-3.329012, 1, -5.934756, 1, -0.5, 0.5, 0.5,
-3.329012, 1, -5.934756, 1, 1.5, 0.5, 0.5,
-3.329012, 1, -5.934756, 0, 1.5, 0.5, 0.5,
-3.329012, 2, -5.934756, 0, -0.5, 0.5, 0.5,
-3.329012, 2, -5.934756, 1, -0.5, 0.5, 0.5,
-3.329012, 2, -5.934756, 1, 1.5, 0.5, 0.5,
-3.329012, 2, -5.934756, 0, 1.5, 0.5, 0.5
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
-2.876173, -3.273407, -4,
-2.876173, -3.273407, 4,
-2.876173, -3.273407, -4,
-3.027119, -3.431345, -4,
-2.876173, -3.273407, -2,
-3.027119, -3.431345, -2,
-2.876173, -3.273407, 0,
-3.027119, -3.431345, 0,
-2.876173, -3.273407, 2,
-3.027119, -3.431345, 2,
-2.876173, -3.273407, 4,
-3.027119, -3.431345, 4
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
-3.329012, -3.74722, -4, 0, -0.5, 0.5, 0.5,
-3.329012, -3.74722, -4, 1, -0.5, 0.5, 0.5,
-3.329012, -3.74722, -4, 1, 1.5, 0.5, 0.5,
-3.329012, -3.74722, -4, 0, 1.5, 0.5, 0.5,
-3.329012, -3.74722, -2, 0, -0.5, 0.5, 0.5,
-3.329012, -3.74722, -2, 1, -0.5, 0.5, 0.5,
-3.329012, -3.74722, -2, 1, 1.5, 0.5, 0.5,
-3.329012, -3.74722, -2, 0, 1.5, 0.5, 0.5,
-3.329012, -3.74722, 0, 0, -0.5, 0.5, 0.5,
-3.329012, -3.74722, 0, 1, -0.5, 0.5, 0.5,
-3.329012, -3.74722, 0, 1, 1.5, 0.5, 0.5,
-3.329012, -3.74722, 0, 0, 1.5, 0.5, 0.5,
-3.329012, -3.74722, 2, 0, -0.5, 0.5, 0.5,
-3.329012, -3.74722, 2, 1, -0.5, 0.5, 0.5,
-3.329012, -3.74722, 2, 1, 1.5, 0.5, 0.5,
-3.329012, -3.74722, 2, 0, 1.5, 0.5, 0.5,
-3.329012, -3.74722, 4, 0, -0.5, 0.5, 0.5,
-3.329012, -3.74722, 4, 1, -0.5, 0.5, 0.5,
-3.329012, -3.74722, 4, 1, 1.5, 0.5, 0.5,
-3.329012, -3.74722, 4, 0, 1.5, 0.5, 0.5
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
-2.876173, -3.273407, -5.163642,
-2.876173, 3.044099, -5.163642,
-2.876173, -3.273407, 5.11787,
-2.876173, 3.044099, 5.11787,
-2.876173, -3.273407, -5.163642,
-2.876173, -3.273407, 5.11787,
-2.876173, 3.044099, -5.163642,
-2.876173, 3.044099, 5.11787,
-2.876173, -3.273407, -5.163642,
3.16169, -3.273407, -5.163642,
-2.876173, -3.273407, 5.11787,
3.16169, -3.273407, 5.11787,
-2.876173, 3.044099, -5.163642,
3.16169, 3.044099, -5.163642,
-2.876173, 3.044099, 5.11787,
3.16169, 3.044099, 5.11787,
3.16169, -3.273407, -5.163642,
3.16169, 3.044099, -5.163642,
3.16169, -3.273407, 5.11787,
3.16169, 3.044099, 5.11787,
3.16169, -3.273407, -5.163642,
3.16169, -3.273407, 5.11787,
3.16169, 3.044099, -5.163642,
3.16169, 3.044099, 5.11787
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
var radius = 7.2053;
var distance = 32.05719;
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
mvMatrix.translate( -0.142759, 0.1146539, 0.02288604 );
mvMatrix.scale( 1.290276, 1.233162, 0.7577203 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.05719);
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
bispyribac-sodium<-read.table("bispyribac-sodium.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-bispyribac-sodium$V2
```

```
## Error in eval(expr, envir, enclos): object 'bispyribac' not found
```

```r
y<-bispyribac-sodium$V3
```

```
## Error in eval(expr, envir, enclos): object 'bispyribac' not found
```

```r
z<-bispyribac-sodium$V4
```

```
## Error in eval(expr, envir, enclos): object 'bispyribac' not found
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
-2.788243, -0.4300851, -1.754825, 0, 0, 1, 1, 1,
-2.735705, -0.7030977, -3.317763, 1, 0, 0, 1, 1,
-2.667815, -0.1564828, -0.4283505, 1, 0, 0, 1, 1,
-2.579687, 0.3896882, -0.8555669, 1, 0, 0, 1, 1,
-2.544022, 0.4007024, -1.616903, 1, 0, 0, 1, 1,
-2.448903, -0.2706956, -1.152838, 1, 0, 0, 1, 1,
-2.410916, -1.380288, -2.190036, 0, 0, 0, 1, 1,
-2.407802, -0.1001396, -2.749466, 0, 0, 0, 1, 1,
-2.25238, -0.8047299, -0.939748, 0, 0, 0, 1, 1,
-2.250117, -0.007247239, -1.378888, 0, 0, 0, 1, 1,
-2.231808, 1.084332, -2.016049, 0, 0, 0, 1, 1,
-2.190371, -0.01244016, -0.873286, 0, 0, 0, 1, 1,
-2.147204, -0.4578017, 0.7911578, 0, 0, 0, 1, 1,
-2.129785, 0.6296258, -1.52272, 1, 1, 1, 1, 1,
-2.110909, 0.1354289, -1.984789, 1, 1, 1, 1, 1,
-2.100928, 0.08794031, -0.3499923, 1, 1, 1, 1, 1,
-2.100526, 1.918073, -2.134973, 1, 1, 1, 1, 1,
-2.093026, 0.1558265, -3.178692, 1, 1, 1, 1, 1,
-2.064509, -0.1308374, -1.981449, 1, 1, 1, 1, 1,
-2.01159, 0.3938347, 0.34563, 1, 1, 1, 1, 1,
-1.948612, -1.154842, -2.359439, 1, 1, 1, 1, 1,
-1.940003, -1.156367, -1.374084, 1, 1, 1, 1, 1,
-1.93894, -0.3794723, -1.083751, 1, 1, 1, 1, 1,
-1.910206, -0.8218914, -2.279517, 1, 1, 1, 1, 1,
-1.851958, -1.365199, -1.228577, 1, 1, 1, 1, 1,
-1.83641, -0.8665313, -2.131237, 1, 1, 1, 1, 1,
-1.813926, -0.9405633, -0.6164855, 1, 1, 1, 1, 1,
-1.8118, -0.7764723, -3.072429, 1, 1, 1, 1, 1,
-1.808923, -0.6563154, -1.370227, 0, 0, 1, 1, 1,
-1.806272, -0.5543066, -1.096646, 1, 0, 0, 1, 1,
-1.793521, -0.2310548, -0.03849228, 1, 0, 0, 1, 1,
-1.764411, -0.1345617, -0.9968334, 1, 0, 0, 1, 1,
-1.754255, 0.13193, -0.8687392, 1, 0, 0, 1, 1,
-1.743126, -0.9431157, -1.909932, 1, 0, 0, 1, 1,
-1.704386, -0.03058917, -2.061731, 0, 0, 0, 1, 1,
-1.702069, 1.933728, -0.3347908, 0, 0, 0, 1, 1,
-1.688691, 1.903939, -1.108029, 0, 0, 0, 1, 1,
-1.687824, 0.6870952, -0.9672554, 0, 0, 0, 1, 1,
-1.674356, 0.5007188, -0.7367676, 0, 0, 0, 1, 1,
-1.667616, -0.9872009, -2.197534, 0, 0, 0, 1, 1,
-1.662613, -0.6008818, 0.05980145, 0, 0, 0, 1, 1,
-1.654433, 0.1550141, -4.982868, 1, 1, 1, 1, 1,
-1.637182, 0.7800465, -1.12058, 1, 1, 1, 1, 1,
-1.62483, -1.156085, -1.412214, 1, 1, 1, 1, 1,
-1.623174, 0.5541463, -1.197367, 1, 1, 1, 1, 1,
-1.614519, -0.6362036, -0.3155946, 1, 1, 1, 1, 1,
-1.611056, -1.32191, -1.368702, 1, 1, 1, 1, 1,
-1.595695, -0.7200211, -2.98096, 1, 1, 1, 1, 1,
-1.584121, 0.2177042, -0.9885665, 1, 1, 1, 1, 1,
-1.580224, 1.809087, 0.5659862, 1, 1, 1, 1, 1,
-1.575624, 1.124517, -1.062529, 1, 1, 1, 1, 1,
-1.574226, -0.9508632, -3.748077, 1, 1, 1, 1, 1,
-1.571352, -0.2926759, -0.992154, 1, 1, 1, 1, 1,
-1.56828, 0.5319306, -0.3405792, 1, 1, 1, 1, 1,
-1.560729, 0.6938757, -1.695853, 1, 1, 1, 1, 1,
-1.558859, 1.368128, -2.422248, 1, 1, 1, 1, 1,
-1.552864, 0.6529039, -2.204825, 0, 0, 1, 1, 1,
-1.551465, -1.815939, -1.898156, 1, 0, 0, 1, 1,
-1.548253, -0.6242843, -0.7131952, 1, 0, 0, 1, 1,
-1.543756, 0.6915847, -1.588659, 1, 0, 0, 1, 1,
-1.53836, -1.237525, -2.465869, 1, 0, 0, 1, 1,
-1.532671, 0.249731, -2.540499, 1, 0, 0, 1, 1,
-1.515352, -1.6891, -0.4256783, 0, 0, 0, 1, 1,
-1.504809, -1.255838, -1.20981, 0, 0, 0, 1, 1,
-1.503439, 1.04742, 0.656208, 0, 0, 0, 1, 1,
-1.497748, -0.2010399, -2.713421, 0, 0, 0, 1, 1,
-1.496591, 0.04449121, -1.232189, 0, 0, 0, 1, 1,
-1.495384, -1.186625, -2.614785, 0, 0, 0, 1, 1,
-1.49391, -0.9532003, -1.174704, 0, 0, 0, 1, 1,
-1.492752, -0.7319232, -1.973312, 1, 1, 1, 1, 1,
-1.48216, -0.3913344, -2.523155, 1, 1, 1, 1, 1,
-1.481049, -0.9744028, -2.184089, 1, 1, 1, 1, 1,
-1.435957, 0.4644956, 0.3454661, 1, 1, 1, 1, 1,
-1.434577, -0.3803377, -1.892864, 1, 1, 1, 1, 1,
-1.433711, 0.783469, 0.7585085, 1, 1, 1, 1, 1,
-1.42689, 0.6647244, -0.9549997, 1, 1, 1, 1, 1,
-1.425486, -0.6063694, -1.05069, 1, 1, 1, 1, 1,
-1.419502, 1.862316, 0.1866284, 1, 1, 1, 1, 1,
-1.41655, -3.181405, -4.402957, 1, 1, 1, 1, 1,
-1.414304, -0.6059167, 1.042866, 1, 1, 1, 1, 1,
-1.413726, -0.7977858, -3.078028, 1, 1, 1, 1, 1,
-1.40509, 0.6816393, -1.639063, 1, 1, 1, 1, 1,
-1.396057, 0.4893571, -1.764032, 1, 1, 1, 1, 1,
-1.39162, 0.2058021, -1.724778, 1, 1, 1, 1, 1,
-1.391027, -0.3854689, -0.6186833, 0, 0, 1, 1, 1,
-1.388454, -0.9189897, -1.372199, 1, 0, 0, 1, 1,
-1.380301, 1.474088, -0.6045184, 1, 0, 0, 1, 1,
-1.369164, 0.6848267, -1.644793, 1, 0, 0, 1, 1,
-1.366616, 0.5997757, -1.162515, 1, 0, 0, 1, 1,
-1.365871, 1.692121, -1.480625, 1, 0, 0, 1, 1,
-1.363941, -0.3474959, -1.869088, 0, 0, 0, 1, 1,
-1.361673, 0.3942182, -1.097406, 0, 0, 0, 1, 1,
-1.36132, -0.01248743, -1.175822, 0, 0, 0, 1, 1,
-1.358988, 1.385749, -1.368066, 0, 0, 0, 1, 1,
-1.355761, 1.54344, -0.04792135, 0, 0, 0, 1, 1,
-1.355715, -1.394168, -2.837882, 0, 0, 0, 1, 1,
-1.353567, -1.542704, -2.048244, 0, 0, 0, 1, 1,
-1.348201, -2.151477, -2.420771, 1, 1, 1, 1, 1,
-1.346662, -0.004211306, -2.949686, 1, 1, 1, 1, 1,
-1.343379, -0.04258171, -1.4443, 1, 1, 1, 1, 1,
-1.339757, -0.1319794, -1.927767, 1, 1, 1, 1, 1,
-1.338814, -0.2583981, -1.273339, 1, 1, 1, 1, 1,
-1.329304, 2.434436, -1.107203, 1, 1, 1, 1, 1,
-1.319228, 1.128467, 0.1066307, 1, 1, 1, 1, 1,
-1.310506, 0.3843102, -2.130967, 1, 1, 1, 1, 1,
-1.30656, -1.317696, -1.899088, 1, 1, 1, 1, 1,
-1.284036, -0.574188, -0.1304095, 1, 1, 1, 1, 1,
-1.276212, 0.4560388, -0.8254198, 1, 1, 1, 1, 1,
-1.274919, 0.5187327, -0.9529297, 1, 1, 1, 1, 1,
-1.269792, 1.179772, -1.559215, 1, 1, 1, 1, 1,
-1.255108, -0.5259345, -0.592594, 1, 1, 1, 1, 1,
-1.254326, 1.132584, -1.040773, 1, 1, 1, 1, 1,
-1.249547, -0.6230866, -2.183226, 0, 0, 1, 1, 1,
-1.245721, -0.9731709, -1.90937, 1, 0, 0, 1, 1,
-1.241419, 0.7996514, -1.734556, 1, 0, 0, 1, 1,
-1.237649, 0.2943007, -2.256619, 1, 0, 0, 1, 1,
-1.237191, 0.5456203, -1.347385, 1, 0, 0, 1, 1,
-1.236105, -1.178829, -3.477093, 1, 0, 0, 1, 1,
-1.234256, -0.3066348, -3.565278, 0, 0, 0, 1, 1,
-1.22906, -0.9983334, -1.41734, 0, 0, 0, 1, 1,
-1.22723, 0.8776605, -0.6781476, 0, 0, 0, 1, 1,
-1.222617, 0.4041968, -0.2994864, 0, 0, 0, 1, 1,
-1.207497, 0.9499086, -2.664609, 0, 0, 0, 1, 1,
-1.199283, 0.1076332, -0.1706158, 0, 0, 0, 1, 1,
-1.196882, -0.1640379, -2.154101, 0, 0, 0, 1, 1,
-1.179228, -0.7832414, -2.171759, 1, 1, 1, 1, 1,
-1.175855, 0.5772572, 0.8683513, 1, 1, 1, 1, 1,
-1.155468, -1.50038, -3.21342, 1, 1, 1, 1, 1,
-1.136482, 0.8695349, 0.2771345, 1, 1, 1, 1, 1,
-1.130492, -0.9964555, -1.952195, 1, 1, 1, 1, 1,
-1.128621, 1.157539, -1.350822, 1, 1, 1, 1, 1,
-1.127867, -0.1213269, -0.4820971, 1, 1, 1, 1, 1,
-1.124549, -0.2465649, -0.5777256, 1, 1, 1, 1, 1,
-1.115991, 0.8828272, 0.750229, 1, 1, 1, 1, 1,
-1.115271, 0.3763802, -1.984559, 1, 1, 1, 1, 1,
-1.114226, -0.1767022, -1.802662, 1, 1, 1, 1, 1,
-1.10813, 0.9558808, -1.766261, 1, 1, 1, 1, 1,
-1.103735, -1.355441, -0.8323925, 1, 1, 1, 1, 1,
-1.101412, 1.550479, -0.8475852, 1, 1, 1, 1, 1,
-1.101093, -1.326325, -2.345873, 1, 1, 1, 1, 1,
-1.099239, 0.4616874, -1.537057, 0, 0, 1, 1, 1,
-1.095182, 1.392537, -1.096749, 1, 0, 0, 1, 1,
-1.092188, -1.108082, -2.951641, 1, 0, 0, 1, 1,
-1.08731, 0.1835722, -1.938394, 1, 0, 0, 1, 1,
-1.078966, -0.2131978, -1.858374, 1, 0, 0, 1, 1,
-1.074016, -0.8776984, -3.880656, 1, 0, 0, 1, 1,
-1.073447, 1.361232, -0.5458197, 0, 0, 0, 1, 1,
-1.073202, 0.2173643, -0.09317572, 0, 0, 0, 1, 1,
-1.063722, -0.972429, -1.683576, 0, 0, 0, 1, 1,
-1.061851, 0.1386394, -0.123392, 0, 0, 0, 1, 1,
-1.057855, 2.373447, -0.4790503, 0, 0, 0, 1, 1,
-1.056146, 0.8368023, 0.4672323, 0, 0, 0, 1, 1,
-1.051692, -0.3270043, -1.916586, 0, 0, 0, 1, 1,
-1.048013, 0.9463145, -1.409101, 1, 1, 1, 1, 1,
-1.045527, -0.5421482, -1.749563, 1, 1, 1, 1, 1,
-1.036607, 0.2677246, -0.9158106, 1, 1, 1, 1, 1,
-1.032344, -1.957123, -2.487367, 1, 1, 1, 1, 1,
-1.028631, 1.669479, 0.01510893, 1, 1, 1, 1, 1,
-1.025737, 1.194203, -0.5890464, 1, 1, 1, 1, 1,
-1.022795, 0.03290827, -0.4164437, 1, 1, 1, 1, 1,
-1.022358, -0.5058818, -2.450585, 1, 1, 1, 1, 1,
-1.012429, 0.03930736, -3.49259, 1, 1, 1, 1, 1,
-1.008907, -0.6014972, -2.783014, 1, 1, 1, 1, 1,
-1.004786, 0.1267716, -1.428685, 1, 1, 1, 1, 1,
-0.9994981, 0.8260741, -0.03256898, 1, 1, 1, 1, 1,
-0.9992104, -0.2972955, -2.47497, 1, 1, 1, 1, 1,
-0.9952964, -1.00475, -2.43312, 1, 1, 1, 1, 1,
-0.9887281, 0.08835336, -0.9201287, 1, 1, 1, 1, 1,
-0.9864496, 0.1418605, -0.5176867, 0, 0, 1, 1, 1,
-0.986069, -0.7735425, -2.822261, 1, 0, 0, 1, 1,
-0.9813582, 0.09999662, -0.9827827, 1, 0, 0, 1, 1,
-0.9798458, 0.1612288, -2.081203, 1, 0, 0, 1, 1,
-0.9787031, -0.3458896, -0.5580214, 1, 0, 0, 1, 1,
-0.9623896, -2.236266, -3.712686, 1, 0, 0, 1, 1,
-0.9620396, 1.64486, 0.9212312, 0, 0, 0, 1, 1,
-0.9601045, -0.3623349, -2.406657, 0, 0, 0, 1, 1,
-0.9599128, 0.8434928, 0.6871396, 0, 0, 0, 1, 1,
-0.9491211, -1.190891, -3.282376, 0, 0, 0, 1, 1,
-0.9424967, -0.7303779, -1.194177, 0, 0, 0, 1, 1,
-0.9411767, 0.6955542, -0.4821481, 0, 0, 0, 1, 1,
-0.9312829, 0.4831316, -2.675733, 0, 0, 0, 1, 1,
-0.9290812, -0.1896753, -0.6234677, 1, 1, 1, 1, 1,
-0.9227759, -2.632283, -2.017336, 1, 1, 1, 1, 1,
-0.9217016, -0.5609688, -0.09692146, 1, 1, 1, 1, 1,
-0.9127334, 0.5677196, -0.07253249, 1, 1, 1, 1, 1,
-0.9071504, -2.052574, -2.108116, 1, 1, 1, 1, 1,
-0.9001605, -1.136362, -3.5695, 1, 1, 1, 1, 1,
-0.8989717, 0.3660209, -2.268003, 1, 1, 1, 1, 1,
-0.8982722, -2.057779, -2.458849, 1, 1, 1, 1, 1,
-0.8904814, 0.4352336, -1.439542, 1, 1, 1, 1, 1,
-0.8874075, 0.8751506, -0.9549127, 1, 1, 1, 1, 1,
-0.8723409, -0.6830201, -1.146794, 1, 1, 1, 1, 1,
-0.8712321, -0.9514915, -2.587019, 1, 1, 1, 1, 1,
-0.8669794, -1.800545, -2.114797, 1, 1, 1, 1, 1,
-0.8660951, -1.614543, -2.045655, 1, 1, 1, 1, 1,
-0.8660499, 1.037665, -0.6049673, 1, 1, 1, 1, 1,
-0.8618681, 0.8277377, -2.046985, 0, 0, 1, 1, 1,
-0.8553078, 0.3978362, -0.9316859, 1, 0, 0, 1, 1,
-0.8547761, -0.4170249, -0.619379, 1, 0, 0, 1, 1,
-0.8532579, 0.1026565, -0.8880076, 1, 0, 0, 1, 1,
-0.851354, 0.9703836, -1.916824, 1, 0, 0, 1, 1,
-0.8481069, 0.8790758, -1.870631, 1, 0, 0, 1, 1,
-0.8452826, 0.4223227, -1.398111, 0, 0, 0, 1, 1,
-0.8447228, 0.1145837, -0.8138493, 0, 0, 0, 1, 1,
-0.8388328, 0.9227191, 0.1295837, 0, 0, 0, 1, 1,
-0.8379628, 1.010416, -0.1339855, 0, 0, 0, 1, 1,
-0.8368188, -0.1197046, -2.115661, 0, 0, 0, 1, 1,
-0.8326963, -0.102594, -0.9716539, 0, 0, 0, 1, 1,
-0.831628, -0.9571909, -1.018977, 0, 0, 0, 1, 1,
-0.8269998, -2.643379, -3.699209, 1, 1, 1, 1, 1,
-0.821182, 0.1376327, -0.1291494, 1, 1, 1, 1, 1,
-0.8207457, 1.461655, -0.3638391, 1, 1, 1, 1, 1,
-0.8181424, 0.6263994, 0.5721927, 1, 1, 1, 1, 1,
-0.816063, 1.107937, -0.4542977, 1, 1, 1, 1, 1,
-0.8112752, 0.2422132, -0.5198714, 1, 1, 1, 1, 1,
-0.8085737, 0.3000185, 0.4268262, 1, 1, 1, 1, 1,
-0.8058889, 0.9992856, -0.202713, 1, 1, 1, 1, 1,
-0.8026726, -1.015484, -3.148382, 1, 1, 1, 1, 1,
-0.7958948, -1.687195, -2.464969, 1, 1, 1, 1, 1,
-0.7952825, -0.5443314, -2.229909, 1, 1, 1, 1, 1,
-0.7942369, -0.9227836, -2.263946, 1, 1, 1, 1, 1,
-0.7921597, -0.06360669, -1.859144, 1, 1, 1, 1, 1,
-0.7906689, 0.7227671, -1.448044, 1, 1, 1, 1, 1,
-0.7892635, 0.3766662, -2.707668, 1, 1, 1, 1, 1,
-0.785633, 0.263314, -2.001495, 0, 0, 1, 1, 1,
-0.7791616, -0.226326, -2.473759, 1, 0, 0, 1, 1,
-0.7780876, 0.5131034, -1.573306, 1, 0, 0, 1, 1,
-0.7696152, -0.2628153, -2.75915, 1, 0, 0, 1, 1,
-0.7656817, -1.459471, -4.445088, 1, 0, 0, 1, 1,
-0.7649493, 1.044647, -1.213772, 1, 0, 0, 1, 1,
-0.7637819, -1.252008, -3.687618, 0, 0, 0, 1, 1,
-0.7548775, -0.3163647, -1.018367, 0, 0, 0, 1, 1,
-0.7507319, -0.379216, -1.869286, 0, 0, 0, 1, 1,
-0.7491873, 0.8940015, 0.2621207, 0, 0, 0, 1, 1,
-0.7486079, -0.4784376, -2.57677, 0, 0, 0, 1, 1,
-0.7484146, 0.6853321, -0.4686918, 0, 0, 0, 1, 1,
-0.7466679, -1.658945, -1.873522, 0, 0, 0, 1, 1,
-0.7447881, 0.4220258, -2.383802, 1, 1, 1, 1, 1,
-0.74434, 0.3034028, -1.902376, 1, 1, 1, 1, 1,
-0.7441596, -1.494808, -3.526044, 1, 1, 1, 1, 1,
-0.7387732, -0.4108724, -2.801207, 1, 1, 1, 1, 1,
-0.7387719, -2.857594, -1.319992, 1, 1, 1, 1, 1,
-0.7376952, 0.4846855, -1.001821, 1, 1, 1, 1, 1,
-0.7339381, -1.778716, -1.65214, 1, 1, 1, 1, 1,
-0.7314354, 1.919302, 0.429088, 1, 1, 1, 1, 1,
-0.7284088, 1.649247, -1.129729, 1, 1, 1, 1, 1,
-0.7274566, 0.04368516, -0.8311483, 1, 1, 1, 1, 1,
-0.722882, -0.5223255, -1.155094, 1, 1, 1, 1, 1,
-0.7212195, -0.7763293, -1.280354, 1, 1, 1, 1, 1,
-0.7194847, 0.1298832, -2.006884, 1, 1, 1, 1, 1,
-0.7185472, -0.5534452, -0.2700728, 1, 1, 1, 1, 1,
-0.7166036, 1.202507, -0.9490212, 1, 1, 1, 1, 1,
-0.7118721, 0.4788395, 1.47084, 0, 0, 1, 1, 1,
-0.7086337, -2.046763, -1.974877, 1, 0, 0, 1, 1,
-0.7021183, -0.3059573, -2.507862, 1, 0, 0, 1, 1,
-0.7012494, 0.08772209, -3.080766, 1, 0, 0, 1, 1,
-0.6966865, -0.5260695, -0.1690479, 1, 0, 0, 1, 1,
-0.6954307, -0.5091346, -0.8885955, 1, 0, 0, 1, 1,
-0.6944948, 0.07122774, 0.7729983, 0, 0, 0, 1, 1,
-0.6891496, 0.179114, -1.805639, 0, 0, 0, 1, 1,
-0.6874815, 0.3645749, -1.384502, 0, 0, 0, 1, 1,
-0.6866224, 0.7707414, -0.4309476, 0, 0, 0, 1, 1,
-0.6827617, -0.04984238, -1.408044, 0, 0, 0, 1, 1,
-0.6751419, 1.342944, -0.1882929, 0, 0, 0, 1, 1,
-0.6744861, 0.02826034, -3.621772, 0, 0, 0, 1, 1,
-0.6729362, 0.6104848, -1.663731, 1, 1, 1, 1, 1,
-0.6717511, 0.04927444, -1.123305, 1, 1, 1, 1, 1,
-0.6695071, 1.568156, -0.1201557, 1, 1, 1, 1, 1,
-0.6675371, -0.1695786, -0.3792555, 1, 1, 1, 1, 1,
-0.66584, 0.2744369, -0.8949153, 1, 1, 1, 1, 1,
-0.6646281, 0.9328485, 0.4073674, 1, 1, 1, 1, 1,
-0.6625411, 0.3740059, -0.1928305, 1, 1, 1, 1, 1,
-0.659129, -0.3894045, -2.686748, 1, 1, 1, 1, 1,
-0.6549648, -2.208043, -2.411317, 1, 1, 1, 1, 1,
-0.6527577, -0.2686509, -2.917559, 1, 1, 1, 1, 1,
-0.6429044, 0.1244164, -2.117745, 1, 1, 1, 1, 1,
-0.6402935, -0.6937578, -3.46668, 1, 1, 1, 1, 1,
-0.6398925, -0.9783444, -1.992448, 1, 1, 1, 1, 1,
-0.6366145, 1.540069, 0.2325286, 1, 1, 1, 1, 1,
-0.630586, 0.2019214, 0.5130291, 1, 1, 1, 1, 1,
-0.6291459, -0.7724407, -3.454895, 0, 0, 1, 1, 1,
-0.626931, 0.2074779, -1.698955, 1, 0, 0, 1, 1,
-0.6229851, 0.2604448, 0.2761037, 1, 0, 0, 1, 1,
-0.6212767, -1.6267, -2.851068, 1, 0, 0, 1, 1,
-0.6201175, -0.3688004, -2.017146, 1, 0, 0, 1, 1,
-0.6115106, -0.05447059, -0.7022142, 1, 0, 0, 1, 1,
-0.6088707, 1.853641, -0.1129711, 0, 0, 0, 1, 1,
-0.6064194, 0.8515137, -1.790439, 0, 0, 0, 1, 1,
-0.6051912, -0.3732892, -0.6533118, 0, 0, 0, 1, 1,
-0.6043254, -0.140917, -2.263945, 0, 0, 0, 1, 1,
-0.6005815, 0.009754659, -2.425155, 0, 0, 0, 1, 1,
-0.5981865, -0.6500416, -2.418418, 0, 0, 0, 1, 1,
-0.59642, -2.157182, -3.005439, 0, 0, 0, 1, 1,
-0.5958242, 0.667423, -0.6685364, 1, 1, 1, 1, 1,
-0.592456, -0.5206706, -3.363412, 1, 1, 1, 1, 1,
-0.5890676, 0.6544233, -1.097617, 1, 1, 1, 1, 1,
-0.5850174, 0.3825276, 0.5408098, 1, 1, 1, 1, 1,
-0.5799726, 0.01306713, -2.156507, 1, 1, 1, 1, 1,
-0.5787882, -1.04842, -2.223694, 1, 1, 1, 1, 1,
-0.5770917, -1.154665, -2.000128, 1, 1, 1, 1, 1,
-0.5730115, -0.5230762, -2.894698, 1, 1, 1, 1, 1,
-0.5640564, -0.9747045, -2.712048, 1, 1, 1, 1, 1,
-0.564036, 1.23007, -0.1465544, 1, 1, 1, 1, 1,
-0.5611639, 0.4199657, -0.4434395, 1, 1, 1, 1, 1,
-0.5584556, -1.024619, -1.780362, 1, 1, 1, 1, 1,
-0.558413, -1.049188, -3.881771, 1, 1, 1, 1, 1,
-0.5583916, -1.510841, -3.476771, 1, 1, 1, 1, 1,
-0.5555645, 0.793207, -0.4247845, 1, 1, 1, 1, 1,
-0.5538015, -1.031488, -2.252699, 0, 0, 1, 1, 1,
-0.5493525, 1.020225, -1.106281, 1, 0, 0, 1, 1,
-0.5475186, -1.391173, -1.615687, 1, 0, 0, 1, 1,
-0.5455757, -0.8710898, -2.785231, 1, 0, 0, 1, 1,
-0.5434462, 0.1206851, 0.9891517, 1, 0, 0, 1, 1,
-0.5422248, -0.06735989, -2.28554, 1, 0, 0, 1, 1,
-0.5388826, -0.1767189, -2.42891, 0, 0, 0, 1, 1,
-0.5386243, 0.1585149, -1.020484, 0, 0, 0, 1, 1,
-0.5303897, -0.1312403, -2.287702, 0, 0, 0, 1, 1,
-0.529492, -0.1510294, -1.72388, 0, 0, 0, 1, 1,
-0.5281106, 0.4428442, -0.7894197, 0, 0, 0, 1, 1,
-0.5260358, -0.3937008, -0.4141698, 0, 0, 0, 1, 1,
-0.5256548, 0.9337472, -2.658084, 0, 0, 0, 1, 1,
-0.520926, -1.959462, -3.284178, 1, 1, 1, 1, 1,
-0.5161768, 1.387046, 0.155369, 1, 1, 1, 1, 1,
-0.5159164, -0.6701127, -3.472961, 1, 1, 1, 1, 1,
-0.5134077, -0.199665, -2.37788, 1, 1, 1, 1, 1,
-0.5126498, -1.201751, -3.168013, 1, 1, 1, 1, 1,
-0.5122604, 1.302942, 0.6052798, 1, 1, 1, 1, 1,
-0.5105338, -0.11893, -3.226784, 1, 1, 1, 1, 1,
-0.5091701, -0.6089747, -3.568889, 1, 1, 1, 1, 1,
-0.5082117, 2.200519, -0.06906802, 1, 1, 1, 1, 1,
-0.5071214, -0.2088442, -1.810241, 1, 1, 1, 1, 1,
-0.5029284, 0.2447134, -0.7417423, 1, 1, 1, 1, 1,
-0.499506, 0.8350852, 0.6446604, 1, 1, 1, 1, 1,
-0.4915634, 1.103625, 1.289512, 1, 1, 1, 1, 1,
-0.4884169, 0.7585238, 0.462331, 1, 1, 1, 1, 1,
-0.4817546, 1.057034, 0.8858225, 1, 1, 1, 1, 1,
-0.4806744, -0.913424, -2.071983, 0, 0, 1, 1, 1,
-0.4759369, -0.07680764, -3.201067, 1, 0, 0, 1, 1,
-0.472795, -1.679721, -1.960054, 1, 0, 0, 1, 1,
-0.4724495, 0.9788121, 0.4434869, 1, 0, 0, 1, 1,
-0.4691114, 1.403257, -1.151643, 1, 0, 0, 1, 1,
-0.4685159, -1.067178, -3.324682, 1, 0, 0, 1, 1,
-0.4675441, 1.089053, 1.64974, 0, 0, 0, 1, 1,
-0.4653399, 0.4909719, -0.2240413, 0, 0, 0, 1, 1,
-0.4616264, -0.4639456, -2.97211, 0, 0, 0, 1, 1,
-0.4609652, -0.1161396, -1.2023, 0, 0, 0, 1, 1,
-0.4529774, 0.4825005, -1.117679, 0, 0, 0, 1, 1,
-0.4504568, 1.200925, -0.004122557, 0, 0, 0, 1, 1,
-0.4483216, 0.3493279, -1.146948, 0, 0, 0, 1, 1,
-0.4461004, -0.6152427, -1.565307, 1, 1, 1, 1, 1,
-0.4394629, 0.6042452, 0.8423244, 1, 1, 1, 1, 1,
-0.4393715, 0.6182853, 0.2557157, 1, 1, 1, 1, 1,
-0.4378942, -0.7480415, -1.949292, 1, 1, 1, 1, 1,
-0.4357811, -0.6099073, -0.7305002, 1, 1, 1, 1, 1,
-0.4340209, -0.08418625, -0.2596384, 1, 1, 1, 1, 1,
-0.4336048, -0.2313292, -1.040769, 1, 1, 1, 1, 1,
-0.4323181, 0.2378997, -1.591923, 1, 1, 1, 1, 1,
-0.4280135, 0.846377, -0.5636867, 1, 1, 1, 1, 1,
-0.4263327, 0.1038914, -2.035676, 1, 1, 1, 1, 1,
-0.4255703, -0.09865907, -2.255711, 1, 1, 1, 1, 1,
-0.4250244, 0.01642791, 0.5377538, 1, 1, 1, 1, 1,
-0.424073, -0.3033461, -1.436005, 1, 1, 1, 1, 1,
-0.4239956, -0.5823462, -1.136699, 1, 1, 1, 1, 1,
-0.4234873, 1.056562, -0.1271041, 1, 1, 1, 1, 1,
-0.4230763, -0.5924472, -2.10917, 0, 0, 1, 1, 1,
-0.414351, -0.9616293, -4.062975, 1, 0, 0, 1, 1,
-0.4118719, -0.1652429, -1.450926, 1, 0, 0, 1, 1,
-0.4115104, 0.9869122, 0.309789, 1, 0, 0, 1, 1,
-0.4088895, 0.1833191, -1.386586, 1, 0, 0, 1, 1,
-0.4049395, -0.7009345, -2.412083, 1, 0, 0, 1, 1,
-0.4041915, -2.010313, -2.046824, 0, 0, 0, 1, 1,
-0.4023272, 0.5824485, 0.4982181, 0, 0, 0, 1, 1,
-0.3927105, 0.8952099, 1.593067, 0, 0, 0, 1, 1,
-0.3875979, 1.43171, -0.3536188, 0, 0, 0, 1, 1,
-0.3870329, 0.04605319, -0.969798, 0, 0, 0, 1, 1,
-0.3839934, -2.008312, -2.746353, 0, 0, 0, 1, 1,
-0.3803678, -0.5129275, -2.703805, 0, 0, 0, 1, 1,
-0.3790891, -1.050794, -4.502299, 1, 1, 1, 1, 1,
-0.3788042, -0.8718044, -1.554313, 1, 1, 1, 1, 1,
-0.3753301, -0.03762189, -1.360942, 1, 1, 1, 1, 1,
-0.3748916, -1.709697, -1.463214, 1, 1, 1, 1, 1,
-0.3693305, 0.6625664, -0.4989785, 1, 1, 1, 1, 1,
-0.3672749, -1.285326, -2.197333, 1, 1, 1, 1, 1,
-0.3633556, 2.015835, -0.3072861, 1, 1, 1, 1, 1,
-0.3616518, 0.3680628, -1.569013, 1, 1, 1, 1, 1,
-0.3616128, 0.1811223, -1.042308, 1, 1, 1, 1, 1,
-0.3495463, 0.2323609, -1.024499, 1, 1, 1, 1, 1,
-0.3493864, 0.07765906, -0.907421, 1, 1, 1, 1, 1,
-0.346366, -0.5994732, -2.861485, 1, 1, 1, 1, 1,
-0.3411973, 0.241046, -0.9884492, 1, 1, 1, 1, 1,
-0.3403674, 1.784166, -1.725256, 1, 1, 1, 1, 1,
-0.3399842, -0.9491907, -1.56782, 1, 1, 1, 1, 1,
-0.3364886, 0.6330149, 0.04636906, 0, 0, 1, 1, 1,
-0.3341905, -1.017675, -2.01008, 1, 0, 0, 1, 1,
-0.3340584, 2.269509, -1.228486, 1, 0, 0, 1, 1,
-0.3333723, 1.27813, 0.301854, 1, 0, 0, 1, 1,
-0.3330321, -1.534071, -2.930624, 1, 0, 0, 1, 1,
-0.3318358, 0.6474916, 0.4060083, 1, 0, 0, 1, 1,
-0.3305924, -1.27445, -3.510283, 0, 0, 0, 1, 1,
-0.3256649, -0.2902182, -1.650424, 0, 0, 0, 1, 1,
-0.3244425, -1.099924, -3.317747, 0, 0, 0, 1, 1,
-0.3206995, -0.4398906, -2.331758, 0, 0, 0, 1, 1,
-0.3141723, 0.3767799, 0.1110457, 0, 0, 0, 1, 1,
-0.3138907, -0.6174606, -3.31302, 0, 0, 0, 1, 1,
-0.3071402, 0.4075936, -0.8584597, 0, 0, 0, 1, 1,
-0.3043715, 0.5652084, -0.5461064, 1, 1, 1, 1, 1,
-0.3027935, -0.354504, -1.375722, 1, 1, 1, 1, 1,
-0.302629, 0.1311848, -1.873218, 1, 1, 1, 1, 1,
-0.2960877, 1.860237, 0.7643703, 1, 1, 1, 1, 1,
-0.2918989, -0.8715461, -1.763024, 1, 1, 1, 1, 1,
-0.2903259, 1.371608, -2.113524, 1, 1, 1, 1, 1,
-0.2900519, 0.2195769, 0.1086128, 1, 1, 1, 1, 1,
-0.2850837, 1.211038, -0.5469285, 1, 1, 1, 1, 1,
-0.2826522, 1.360036, 0.3560166, 1, 1, 1, 1, 1,
-0.2813722, 0.226509, 2.090811, 1, 1, 1, 1, 1,
-0.2763153, -2.037051, -3.107392, 1, 1, 1, 1, 1,
-0.2740141, -0.8710749, -2.679899, 1, 1, 1, 1, 1,
-0.2726476, -0.2046509, -2.537562, 1, 1, 1, 1, 1,
-0.2690548, -1.099128, -5.013912, 1, 1, 1, 1, 1,
-0.2675417, 1.257206, -1.163937, 1, 1, 1, 1, 1,
-0.2613867, 0.3824759, 0.6255412, 0, 0, 1, 1, 1,
-0.2602366, 1.929155, -1.049922, 1, 0, 0, 1, 1,
-0.2562658, -0.03244382, -1.846249, 1, 0, 0, 1, 1,
-0.2544737, 0.796375, 0.3526064, 1, 0, 0, 1, 1,
-0.2523257, 0.2966802, -1.017376, 1, 0, 0, 1, 1,
-0.2504379, -1.106919, -3.67602, 1, 0, 0, 1, 1,
-0.249621, 0.2830135, 0.1444527, 0, 0, 0, 1, 1,
-0.2419704, -0.7722341, -3.032974, 0, 0, 0, 1, 1,
-0.2383908, -0.2935266, -4.425394, 0, 0, 0, 1, 1,
-0.2343378, 0.2487103, -0.6517217, 0, 0, 0, 1, 1,
-0.2330576, 0.4640599, 0.4125548, 0, 0, 0, 1, 1,
-0.2316037, 0.02510446, -1.657687, 0, 0, 0, 1, 1,
-0.2288676, -0.7964755, -2.500963, 0, 0, 0, 1, 1,
-0.2280701, 0.9833808, -0.4561037, 1, 1, 1, 1, 1,
-0.2226319, -1.198142, -1.866632, 1, 1, 1, 1, 1,
-0.2139688, 0.1672782, -2.178, 1, 1, 1, 1, 1,
-0.2038935, -0.5311025, -3.120166, 1, 1, 1, 1, 1,
-0.1994268, -0.9650058, -2.355069, 1, 1, 1, 1, 1,
-0.1990266, 0.6791636, -0.2491594, 1, 1, 1, 1, 1,
-0.1909905, 0.940035, 1.042789, 1, 1, 1, 1, 1,
-0.1861648, -0.6885252, -3.952798, 1, 1, 1, 1, 1,
-0.1842023, 0.8992535, -0.5042943, 1, 1, 1, 1, 1,
-0.1835551, -2.512003, -3.787732, 1, 1, 1, 1, 1,
-0.1780456, 0.06359103, -2.344404, 1, 1, 1, 1, 1,
-0.1759147, 0.7724809, -1.706384, 1, 1, 1, 1, 1,
-0.1734817, 0.2725869, -1.579682, 1, 1, 1, 1, 1,
-0.1712367, 0.3092727, -0.4435662, 1, 1, 1, 1, 1,
-0.1592533, 0.7566328, 0.3153629, 1, 1, 1, 1, 1,
-0.1577998, -0.06991556, -2.070585, 0, 0, 1, 1, 1,
-0.1563903, -0.8313068, -4.726918, 1, 0, 0, 1, 1,
-0.1543166, -1.329516, -4.113338, 1, 0, 0, 1, 1,
-0.1502471, 0.4256615, -0.01248887, 1, 0, 0, 1, 1,
-0.1411988, 1.159517, -1.768561, 1, 0, 0, 1, 1,
-0.141174, -0.2343051, -2.121286, 1, 0, 0, 1, 1,
-0.138901, -0.5849627, -2.710608, 0, 0, 0, 1, 1,
-0.1386174, 2.245653, 0.739544, 0, 0, 0, 1, 1,
-0.1345822, 0.3803849, 0.4767829, 0, 0, 0, 1, 1,
-0.1323491, 1.126101, 1.076098, 0, 0, 0, 1, 1,
-0.1303914, 1.926546, 0.4877053, 0, 0, 0, 1, 1,
-0.1270288, 0.4168792, -0.8424546, 0, 0, 0, 1, 1,
-0.1236945, 0.001374183, -1.838596, 0, 0, 0, 1, 1,
-0.1200202, -1.247236, -2.112219, 1, 1, 1, 1, 1,
-0.1187622, -0.9074599, -4.50357, 1, 1, 1, 1, 1,
-0.1155571, -0.08414853, -1.869241, 1, 1, 1, 1, 1,
-0.1118968, 0.9574379, -0.1036673, 1, 1, 1, 1, 1,
-0.1108363, -0.1199868, -2.626671, 1, 1, 1, 1, 1,
-0.1082694, 0.2253163, -0.01284448, 1, 1, 1, 1, 1,
-0.09967909, -1.027184, -2.055213, 1, 1, 1, 1, 1,
-0.09682562, 1.220938, 0.3291251, 1, 1, 1, 1, 1,
-0.09505939, -0.2100522, -1.444007, 1, 1, 1, 1, 1,
-0.09503713, 2.150586, -0.5878388, 1, 1, 1, 1, 1,
-0.0932236, 0.6990257, 0.09082272, 1, 1, 1, 1, 1,
-0.09220656, 0.08985684, -0.840429, 1, 1, 1, 1, 1,
-0.09175535, -0.7350602, -3.917913, 1, 1, 1, 1, 1,
-0.09063783, 0.4022066, -1.189371, 1, 1, 1, 1, 1,
-0.08842623, -1.776005, -3.09329, 1, 1, 1, 1, 1,
-0.08504029, -0.05255552, -1.370861, 0, 0, 1, 1, 1,
-0.0762073, 0.1084471, -0.5590113, 1, 0, 0, 1, 1,
-0.07263485, -0.04854443, -3.724439, 1, 0, 0, 1, 1,
-0.06793328, -0.2754384, -3.53301, 1, 0, 0, 1, 1,
-0.06505544, 0.6708128, 0.8618938, 1, 0, 0, 1, 1,
-0.06105417, -0.5622204, -3.481678, 1, 0, 0, 1, 1,
-0.05846933, -2.258116, -3.071347, 0, 0, 0, 1, 1,
-0.05765786, 0.1295292, -1.436492, 0, 0, 0, 1, 1,
-0.05716841, 0.6526145, -0.6799996, 0, 0, 0, 1, 1,
-0.05587806, 0.5539232, 2.31651, 0, 0, 0, 1, 1,
-0.05449374, 0.6847494, 0.3706082, 0, 0, 0, 1, 1,
-0.04787793, 2.341152, -1.07773, 0, 0, 0, 1, 1,
-0.04738786, 0.143417, -0.1284092, 0, 0, 0, 1, 1,
-0.04087947, -0.1140275, -2.527318, 1, 1, 1, 1, 1,
-0.03973302, -0.3721611, -2.493644, 1, 1, 1, 1, 1,
-0.03721843, -1.038509, -4.15714, 1, 1, 1, 1, 1,
-0.03598914, 1.581237, 0.4867692, 1, 1, 1, 1, 1,
-0.0303393, 0.7582824, -1.524185, 1, 1, 1, 1, 1,
-0.027085, -0.2488687, -3.943559, 1, 1, 1, 1, 1,
-0.02565041, 1.274893, 0.05180148, 1, 1, 1, 1, 1,
-0.02481647, 0.1984444, -0.6958896, 1, 1, 1, 1, 1,
-0.01592034, -0.1684416, -2.615402, 1, 1, 1, 1, 1,
-0.01302601, -0.1721969, -3.107838, 1, 1, 1, 1, 1,
-0.01116221, -1.482286, -2.621368, 1, 1, 1, 1, 1,
-0.009731148, -0.5786788, -2.641297, 1, 1, 1, 1, 1,
-0.008679805, -0.4692966, -1.925735, 1, 1, 1, 1, 1,
-0.007803898, 0.08693443, -0.04697396, 1, 1, 1, 1, 1,
-0.007667347, 2.952097, 0.3559182, 1, 1, 1, 1, 1,
-0.00753336, 2.062007, -1.595816, 0, 0, 1, 1, 1,
-0.006474386, 1.978787, -0.9449691, 1, 0, 0, 1, 1,
-0.003738369, -1.123478, -4.233509, 1, 0, 0, 1, 1,
-0.003646079, 1.332815, 3.114311, 1, 0, 0, 1, 1,
0.003943365, 0.4127609, 1.455249, 1, 0, 0, 1, 1,
0.006354645, 0.2679131, 0.6449606, 1, 0, 0, 1, 1,
0.009593579, 0.9691362, -0.2004656, 0, 0, 0, 1, 1,
0.009623507, -0.07316692, 3.378121, 0, 0, 0, 1, 1,
0.01379151, 0.5457274, -1.002958, 0, 0, 0, 1, 1,
0.01548514, -0.4503821, 2.417335, 0, 0, 0, 1, 1,
0.0175043, 1.408962, -0.3078065, 0, 0, 0, 1, 1,
0.02236484, 0.08333833, -1.49819, 0, 0, 0, 1, 1,
0.0235857, -0.3097788, 3.441324, 0, 0, 0, 1, 1,
0.02453439, -0.158508, 3.920822, 1, 1, 1, 1, 1,
0.03431056, 0.3592099, 0.8114237, 1, 1, 1, 1, 1,
0.03776159, 0.5291074, 0.872197, 1, 1, 1, 1, 1,
0.03933475, -0.8345532, 3.519046, 1, 1, 1, 1, 1,
0.04199301, -0.2945383, 2.927386, 1, 1, 1, 1, 1,
0.04400842, -0.2532404, 2.649281, 1, 1, 1, 1, 1,
0.04488778, 1.292283, 0.1770269, 1, 1, 1, 1, 1,
0.04507685, 0.2689194, 0.5150774, 1, 1, 1, 1, 1,
0.04871181, 0.3184723, 2.409145, 1, 1, 1, 1, 1,
0.04874858, 0.4680108, 0.07762337, 1, 1, 1, 1, 1,
0.05141666, -0.1976678, 2.262744, 1, 1, 1, 1, 1,
0.05481315, -0.9422758, 3.534509, 1, 1, 1, 1, 1,
0.05712116, -0.1892194, 2.152441, 1, 1, 1, 1, 1,
0.06345309, -0.08415157, 2.437678, 1, 1, 1, 1, 1,
0.06491526, -0.5993145, 2.755252, 1, 1, 1, 1, 1,
0.0653993, 1.754107, -1.233594, 0, 0, 1, 1, 1,
0.066895, 0.7131225, 0.746362, 1, 0, 0, 1, 1,
0.06818093, 0.4116103, 0.6591089, 1, 0, 0, 1, 1,
0.07001659, 1.538362, -0.3143257, 1, 0, 0, 1, 1,
0.07054199, -1.267678, 3.98776, 1, 0, 0, 1, 1,
0.07257602, 1.532884, -0.3613579, 1, 0, 0, 1, 1,
0.07312914, 0.4206071, 0.3239669, 0, 0, 0, 1, 1,
0.07556158, -0.1785168, 3.329066, 0, 0, 0, 1, 1,
0.08430111, 0.8575848, -1.579766, 0, 0, 0, 1, 1,
0.08510504, -0.9268569, 2.732488, 0, 0, 0, 1, 1,
0.08753525, -0.288539, 2.141286, 0, 0, 0, 1, 1,
0.08803117, 1.166059, -0.03031851, 0, 0, 0, 1, 1,
0.09583522, -0.8078721, 4.088601, 0, 0, 0, 1, 1,
0.09647115, -0.5565392, 2.856956, 1, 1, 1, 1, 1,
0.0982354, -0.18719, 3.986413, 1, 1, 1, 1, 1,
0.09847832, -0.3380099, 1.653801, 1, 1, 1, 1, 1,
0.1001029, 0.08207888, 0.7300149, 1, 1, 1, 1, 1,
0.1017839, -0.1424041, 2.064479, 1, 1, 1, 1, 1,
0.1128639, -0.8225831, 3.394295, 1, 1, 1, 1, 1,
0.1197252, 0.9728853, 0.1828701, 1, 1, 1, 1, 1,
0.1218984, 0.00077782, 1.789355, 1, 1, 1, 1, 1,
0.1246899, -0.4574581, 1.80194, 1, 1, 1, 1, 1,
0.1250567, 2.404666, 1.607675, 1, 1, 1, 1, 1,
0.1257158, -0.5763001, 1.06255, 1, 1, 1, 1, 1,
0.1278939, -1.639864, 2.405174, 1, 1, 1, 1, 1,
0.1292292, -0.02140784, 2.545522, 1, 1, 1, 1, 1,
0.130356, 0.3581387, 2.337205, 1, 1, 1, 1, 1,
0.1321021, 0.4332636, 0.9841415, 1, 1, 1, 1, 1,
0.1331128, 0.09434703, -0.06688119, 0, 0, 1, 1, 1,
0.1351437, 0.5885376, 1.509537, 1, 0, 0, 1, 1,
0.1355939, -1.23559, 3.635089, 1, 0, 0, 1, 1,
0.1395259, 0.1782269, 0.007072109, 1, 0, 0, 1, 1,
0.1408816, 0.9991229, -0.4664482, 1, 0, 0, 1, 1,
0.1448788, 1.438695, 0.406463, 1, 0, 0, 1, 1,
0.1480829, 0.4777184, 1.600211, 0, 0, 0, 1, 1,
0.1495311, 1.781185, 0.3125985, 0, 0, 0, 1, 1,
0.1562132, 0.8435953, 2.301435, 0, 0, 0, 1, 1,
0.1568939, -1.195294, 1.693149, 0, 0, 0, 1, 1,
0.1569371, 0.663726, 0.342517, 0, 0, 0, 1, 1,
0.1632788, -0.5082895, 3.39599, 0, 0, 0, 1, 1,
0.1673209, -0.2403447, 2.301353, 0, 0, 0, 1, 1,
0.1688567, 0.5460387, -0.802403, 1, 1, 1, 1, 1,
0.1697615, 0.04991102, 1.758949, 1, 1, 1, 1, 1,
0.1731025, -0.3318429, 2.126431, 1, 1, 1, 1, 1,
0.1735482, 0.439346, -0.5890296, 1, 1, 1, 1, 1,
0.1756672, 0.1911256, 0.1016104, 1, 1, 1, 1, 1,
0.1775155, 1.161998, -0.7845284, 1, 1, 1, 1, 1,
0.1791803, -1.338781, 2.94577, 1, 1, 1, 1, 1,
0.1827204, 0.02407613, 1.845529, 1, 1, 1, 1, 1,
0.1848482, -0.4295886, 3.697034, 1, 1, 1, 1, 1,
0.1850907, 0.3671876, 1.346448, 1, 1, 1, 1, 1,
0.1853838, -1.199743, 0.7767559, 1, 1, 1, 1, 1,
0.1915079, 1.455223, -0.6719221, 1, 1, 1, 1, 1,
0.1923727, -0.9441674, 4.96814, 1, 1, 1, 1, 1,
0.1925855, -0.350687, 3.144133, 1, 1, 1, 1, 1,
0.1932838, 1.301395, -0.9599806, 1, 1, 1, 1, 1,
0.1989114, -0.9500986, 3.584642, 0, 0, 1, 1, 1,
0.1992034, -0.6253968, 3.516001, 1, 0, 0, 1, 1,
0.1999691, -1.171276, 2.987121, 1, 0, 0, 1, 1,
0.2025735, 1.197441, 0.2588193, 1, 0, 0, 1, 1,
0.2029284, -0.9399276, 1.948385, 1, 0, 0, 1, 1,
0.2038579, 0.408224, -1.995335, 1, 0, 0, 1, 1,
0.2039808, 0.8815267, -1.056205, 0, 0, 0, 1, 1,
0.2055117, 0.3057473, -0.4601851, 0, 0, 0, 1, 1,
0.2110008, 1.001863, -1.480189, 0, 0, 0, 1, 1,
0.2120791, -1.146627, 3.131088, 0, 0, 0, 1, 1,
0.2121894, -2.274514, 4.009082, 0, 0, 0, 1, 1,
0.2130765, 0.6433838, 0.7053691, 0, 0, 0, 1, 1,
0.2152063, 1.276211, 0.2825939, 0, 0, 0, 1, 1,
0.2190776, 0.3889267, -0.9605793, 1, 1, 1, 1, 1,
0.2196905, -0.3887266, 0.489181, 1, 1, 1, 1, 1,
0.2225848, 1.268994, 0.5353873, 1, 1, 1, 1, 1,
0.2257743, 1.864317, -0.6783134, 1, 1, 1, 1, 1,
0.2263282, -1.80633, 2.808242, 1, 1, 1, 1, 1,
0.2280472, -0.8219193, 3.453869, 1, 1, 1, 1, 1,
0.2280811, 2.663671, 1.577551, 1, 1, 1, 1, 1,
0.2340241, 0.3139903, 1.412738, 1, 1, 1, 1, 1,
0.2354817, 0.3343978, -0.8804013, 1, 1, 1, 1, 1,
0.2392395, -0.1882032, 1.113475, 1, 1, 1, 1, 1,
0.2416108, 0.8727408, 1.138651, 1, 1, 1, 1, 1,
0.2437564, -1.689063, 3.322846, 1, 1, 1, 1, 1,
0.2463313, -0.0148187, 1.963956, 1, 1, 1, 1, 1,
0.2475036, 0.6456146, 0.1820981, 1, 1, 1, 1, 1,
0.249078, -0.524707, 2.440379, 1, 1, 1, 1, 1,
0.2528029, 1.682148, -2.860387, 0, 0, 1, 1, 1,
0.2534364, 0.355749, -0.6887172, 1, 0, 0, 1, 1,
0.2535088, -0.2302448, 2.664664, 1, 0, 0, 1, 1,
0.2539133, -0.1190211, 2.917147, 1, 0, 0, 1, 1,
0.2566782, -0.03153155, 2.35876, 1, 0, 0, 1, 1,
0.2570193, -0.8543032, 1.914111, 1, 0, 0, 1, 1,
0.2589982, 0.9664035, -1.160453, 0, 0, 0, 1, 1,
0.2650403, -0.3449381, 3.744453, 0, 0, 0, 1, 1,
0.2658436, -0.4180968, -0.02665772, 0, 0, 0, 1, 1,
0.2670195, 0.9171576, 0.5776459, 0, 0, 0, 1, 1,
0.272033, 0.9690718, -1.092995, 0, 0, 0, 1, 1,
0.2838222, 0.8559992, -0.1378668, 0, 0, 0, 1, 1,
0.2881275, 0.8076347, -0.03661994, 0, 0, 0, 1, 1,
0.2883547, -0.5615487, 3.692037, 1, 1, 1, 1, 1,
0.288426, 0.5410904, -1.72852, 1, 1, 1, 1, 1,
0.2890241, -0.2085995, 2.872628, 1, 1, 1, 1, 1,
0.2893064, -0.1765809, 1.079539, 1, 1, 1, 1, 1,
0.2914999, 0.7931573, 1.656692, 1, 1, 1, 1, 1,
0.2977697, -0.449268, 0.7532271, 1, 1, 1, 1, 1,
0.29907, -0.9251323, 4.002835, 1, 1, 1, 1, 1,
0.2992006, 0.7906069, 1.300586, 1, 1, 1, 1, 1,
0.3022776, 1.293154, -0.2095474, 1, 1, 1, 1, 1,
0.3024209, -1.18913, 4.521932, 1, 1, 1, 1, 1,
0.3037767, -0.08669276, 1.903116, 1, 1, 1, 1, 1,
0.3049743, 0.7897868, 0.7933968, 1, 1, 1, 1, 1,
0.3113044, 1.548955, 0.05541953, 1, 1, 1, 1, 1,
0.319409, 0.2134775, 2.098667, 1, 1, 1, 1, 1,
0.3194356, 0.1350475, 1.205912, 1, 1, 1, 1, 1,
0.3201736, 0.3333997, 1.200769, 0, 0, 1, 1, 1,
0.3223646, 0.3003885, 1.730493, 1, 0, 0, 1, 1,
0.3241812, -0.752732, 3.84582, 1, 0, 0, 1, 1,
0.3250919, 1.232867, 1.654343, 1, 0, 0, 1, 1,
0.3282421, -0.06955647, 1.470189, 1, 0, 0, 1, 1,
0.3316591, -0.3567573, 0.344656, 1, 0, 0, 1, 1,
0.3325887, 0.3073213, -0.3030323, 0, 0, 0, 1, 1,
0.3332202, -0.1147206, 3.132503, 0, 0, 0, 1, 1,
0.3352011, 0.8901731, -0.9966406, 0, 0, 0, 1, 1,
0.3367502, -0.4446329, 1.195978, 0, 0, 0, 1, 1,
0.3387572, -0.04348327, 1.724831, 0, 0, 0, 1, 1,
0.3426511, -1.861536, 4.888863, 0, 0, 0, 1, 1,
0.3437447, 0.5018525, 0.8932915, 0, 0, 0, 1, 1,
0.3443429, 0.3249129, 1.75818, 1, 1, 1, 1, 1,
0.3446146, 1.068086, 1.903583, 1, 1, 1, 1, 1,
0.3447615, 0.2898945, 1.567135, 1, 1, 1, 1, 1,
0.3459606, 0.5853912, -0.2405616, 1, 1, 1, 1, 1,
0.3512152, -1.469022, 1.967196, 1, 1, 1, 1, 1,
0.3541957, 0.567472, 1.023811, 1, 1, 1, 1, 1,
0.3571619, 0.3973983, 0.1442404, 1, 1, 1, 1, 1,
0.3575487, -0.1797555, -0.3393262, 1, 1, 1, 1, 1,
0.3597628, 1.182172, 0.1890327, 1, 1, 1, 1, 1,
0.3609504, 0.2446662, 1.313752, 1, 1, 1, 1, 1,
0.3649563, 1.411796, 0.06907622, 1, 1, 1, 1, 1,
0.3653549, 1.10884, 0.4676773, 1, 1, 1, 1, 1,
0.3681598, -0.2570458, 3.9579, 1, 1, 1, 1, 1,
0.3712336, -0.1357125, -1.523905, 1, 1, 1, 1, 1,
0.3739083, 1.074185, -0.761875, 1, 1, 1, 1, 1,
0.3740041, 0.1365468, -0.2996821, 0, 0, 1, 1, 1,
0.3753463, -0.2433288, 3.389492, 1, 0, 0, 1, 1,
0.3782014, 0.6695731, -1.088623, 1, 0, 0, 1, 1,
0.3782478, 0.9956834, 1.478095, 1, 0, 0, 1, 1,
0.3811001, -0.1587704, 2.622432, 1, 0, 0, 1, 1,
0.3847644, -0.01017332, 1.877609, 1, 0, 0, 1, 1,
0.3875678, 0.9352105, 0.02215152, 0, 0, 0, 1, 1,
0.3902021, -0.8530935, 2.704156, 0, 0, 0, 1, 1,
0.3908335, 0.5034094, -0.351248, 0, 0, 0, 1, 1,
0.3926038, 1.052676, 1.438706, 0, 0, 0, 1, 1,
0.3930613, 0.8596021, 0.6139966, 0, 0, 0, 1, 1,
0.3989371, 0.7249067, 2.814743, 0, 0, 0, 1, 1,
0.4026972, 0.3229302, 0.6086291, 0, 0, 0, 1, 1,
0.402861, -1.678365, 2.419839, 1, 1, 1, 1, 1,
0.411618, 1.212621, 0.03554634, 1, 1, 1, 1, 1,
0.4130261, 0.6092416, 1.079084, 1, 1, 1, 1, 1,
0.4135134, 1.243256, 1.028335, 1, 1, 1, 1, 1,
0.414845, -0.6344343, 1.787957, 1, 1, 1, 1, 1,
0.4151865, -0.2407443, 0.6508411, 1, 1, 1, 1, 1,
0.4176584, 1.275916, 1.102519, 1, 1, 1, 1, 1,
0.4180628, -0.08346224, 1.756071, 1, 1, 1, 1, 1,
0.4196522, 1.104798, 0.4651841, 1, 1, 1, 1, 1,
0.4203819, 0.6469616, 1.171024, 1, 1, 1, 1, 1,
0.4213245, -1.88182, 3.181627, 1, 1, 1, 1, 1,
0.4215714, 1.237824, -0.7055054, 1, 1, 1, 1, 1,
0.4266739, 0.7874243, -0.4362828, 1, 1, 1, 1, 1,
0.4329668, 0.6152071, 0.7577912, 1, 1, 1, 1, 1,
0.4334106, 0.07048379, 1.426785, 1, 1, 1, 1, 1,
0.4400839, 0.1974546, 0.358059, 0, 0, 1, 1, 1,
0.4404808, 0.4079034, 0.3541437, 1, 0, 0, 1, 1,
0.4407983, -0.1188649, 2.019764, 1, 0, 0, 1, 1,
0.4486926, -0.4256475, 1.57519, 1, 0, 0, 1, 1,
0.449451, 0.4428445, 1.610066, 1, 0, 0, 1, 1,
0.4517002, -1.172452, 1.55149, 1, 0, 0, 1, 1,
0.4523537, -0.8324934, 3.414629, 0, 0, 0, 1, 1,
0.453745, 0.6899794, 0.4255857, 0, 0, 0, 1, 1,
0.454393, 0.01774992, 3.010197, 0, 0, 0, 1, 1,
0.4639878, 0.4488504, 2.199809, 0, 0, 0, 1, 1,
0.4646245, 0.4086412, 2.300668, 0, 0, 0, 1, 1,
0.4650509, -0.0682926, 1.292129, 0, 0, 0, 1, 1,
0.4661021, -0.5370354, 1.985226, 0, 0, 0, 1, 1,
0.4686956, -0.3224526, 3.688631, 1, 1, 1, 1, 1,
0.479497, 0.4608037, -0.01235064, 1, 1, 1, 1, 1,
0.4801588, -0.5461414, 3.402717, 1, 1, 1, 1, 1,
0.4857287, 0.05340526, 1.652589, 1, 1, 1, 1, 1,
0.4915964, 0.1451846, 0.908446, 1, 1, 1, 1, 1,
0.5049692, -0.2662388, 1.746587, 1, 1, 1, 1, 1,
0.5058988, 2.413801, -0.2076104, 1, 1, 1, 1, 1,
0.5170937, -0.4967613, 1.680276, 1, 1, 1, 1, 1,
0.5171924, 0.5282055, 1.519617, 1, 1, 1, 1, 1,
0.5176067, 0.2349583, 1.837408, 1, 1, 1, 1, 1,
0.518833, -0.2744477, 3.014709, 1, 1, 1, 1, 1,
0.5224118, -1.773638, 4.207845, 1, 1, 1, 1, 1,
0.5225914, -1.008682, 1.520519, 1, 1, 1, 1, 1,
0.5232507, 1.176181, 1.438456, 1, 1, 1, 1, 1,
0.5279717, -0.1909726, 1.162238, 1, 1, 1, 1, 1,
0.5342446, 0.2977407, 0.7511761, 0, 0, 1, 1, 1,
0.5379346, 0.04211807, -0.8214386, 1, 0, 0, 1, 1,
0.5388001, -1.34865, 2.587962, 1, 0, 0, 1, 1,
0.5400737, -0.6338596, 2.51044, 1, 0, 0, 1, 1,
0.5416184, 0.819913, 1.052074, 1, 0, 0, 1, 1,
0.5428068, 1.020517, 1.156917, 1, 0, 0, 1, 1,
0.5461712, 0.9332876, -0.928793, 0, 0, 0, 1, 1,
0.5500063, 0.2277166, 3.352308, 0, 0, 0, 1, 1,
0.5502868, 1.225032, -0.651803, 0, 0, 0, 1, 1,
0.5533012, 0.9793617, -1.138878, 0, 0, 0, 1, 1,
0.5533123, -0.6266732, 2.33684, 0, 0, 0, 1, 1,
0.5538195, 1.817205, -0.3141974, 0, 0, 0, 1, 1,
0.5600896, 0.9372762, 1.03758, 0, 0, 0, 1, 1,
0.5618759, 0.5576608, 0.9435596, 1, 1, 1, 1, 1,
0.5674082, 1.214867, 1.033931, 1, 1, 1, 1, 1,
0.5678966, -0.324614, 2.15085, 1, 1, 1, 1, 1,
0.5716895, -0.5476527, 2.380017, 1, 1, 1, 1, 1,
0.5742665, -1.85035, 3.690841, 1, 1, 1, 1, 1,
0.5789355, 0.1683442, 1.148736, 1, 1, 1, 1, 1,
0.5793508, -0.6317588, 3.047476, 1, 1, 1, 1, 1,
0.5862904, -0.4309976, 1.258188, 1, 1, 1, 1, 1,
0.5956367, -0.2789826, 3.708023, 1, 1, 1, 1, 1,
0.5966695, -0.09432302, 1.796792, 1, 1, 1, 1, 1,
0.5976381, 0.7273236, 0.9319156, 1, 1, 1, 1, 1,
0.6017554, -1.049936, 2.395066, 1, 1, 1, 1, 1,
0.6032763, -0.5951806, 2.283992, 1, 1, 1, 1, 1,
0.6090891, 0.6235266, -0.2784694, 1, 1, 1, 1, 1,
0.6130135, 0.1435511, 3.152704, 1, 1, 1, 1, 1,
0.6159495, -0.2832955, 1.08869, 0, 0, 1, 1, 1,
0.6182379, -0.3166702, 2.252359, 1, 0, 0, 1, 1,
0.6211575, -0.5432956, 2.0979, 1, 0, 0, 1, 1,
0.6236248, 0.8976017, -0.3184245, 1, 0, 0, 1, 1,
0.6276004, -1.075993, 2.380332, 1, 0, 0, 1, 1,
0.631766, -0.7682285, 4.707096, 1, 0, 0, 1, 1,
0.6347438, 0.3658823, 0.71694, 0, 0, 0, 1, 1,
0.6354081, -1.122713, 1.029357, 0, 0, 0, 1, 1,
0.6395409, 0.0634767, 2.846287, 0, 0, 0, 1, 1,
0.6449468, 0.5417476, -0.4939, 0, 0, 0, 1, 1,
0.6452219, -0.1283439, 2.098084, 0, 0, 0, 1, 1,
0.6473053, -2.4654, 2.07234, 0, 0, 0, 1, 1,
0.6524056, -0.8988433, 1.640291, 0, 0, 0, 1, 1,
0.6528254, 0.2830954, 0.7971361, 1, 1, 1, 1, 1,
0.6558674, -0.09122947, 2.883807, 1, 1, 1, 1, 1,
0.6559098, -0.3847127, 3.73049, 1, 1, 1, 1, 1,
0.6604086, 0.01124876, 1.801975, 1, 1, 1, 1, 1,
0.6608912, -0.6252543, 2.35457, 1, 1, 1, 1, 1,
0.6651564, -0.7354411, 3.238877, 1, 1, 1, 1, 1,
0.6656449, -0.1651324, 2.462193, 1, 1, 1, 1, 1,
0.6679513, -1.542751, 0.6588642, 1, 1, 1, 1, 1,
0.6704072, 1.143513, -0.3794131, 1, 1, 1, 1, 1,
0.6808233, -0.4934249, 2.208818, 1, 1, 1, 1, 1,
0.6813918, -1.382314, 1.807971, 1, 1, 1, 1, 1,
0.6926547, 0.7860866, 0.9999781, 1, 1, 1, 1, 1,
0.6943592, -0.1127131, 4.924377, 1, 1, 1, 1, 1,
0.6952598, 1.611256, 0.8647837, 1, 1, 1, 1, 1,
0.7004243, -2.586056, 1.518387, 1, 1, 1, 1, 1,
0.7004898, 0.2071279, 2.230009, 0, 0, 1, 1, 1,
0.7040977, 0.4126136, 1.457578, 1, 0, 0, 1, 1,
0.7069233, 0.334804, 1.434607, 1, 0, 0, 1, 1,
0.7087183, -0.3853011, 1.975339, 1, 0, 0, 1, 1,
0.7098349, 1.986202, 1.45383, 1, 0, 0, 1, 1,
0.7127793, 1.291605, -0.06339242, 1, 0, 0, 1, 1,
0.7131416, 2.224672, 0.9427372, 0, 0, 0, 1, 1,
0.7146329, 0.6355174, -0.3809535, 0, 0, 0, 1, 1,
0.7222607, 1.296104, 1.03327, 0, 0, 0, 1, 1,
0.7249218, 2.001473, -0.7672647, 0, 0, 0, 1, 1,
0.7308655, 0.04654693, 2.134712, 0, 0, 0, 1, 1,
0.739854, 0.1125541, 0.5776392, 0, 0, 0, 1, 1,
0.742618, -0.4034072, 2.332805, 0, 0, 0, 1, 1,
0.7440519, -0.335317, 3.083655, 1, 1, 1, 1, 1,
0.7448999, -0.09555229, 1.973244, 1, 1, 1, 1, 1,
0.745795, 0.8237571, 2.365927, 1, 1, 1, 1, 1,
0.7462431, 0.1054649, 2.66343, 1, 1, 1, 1, 1,
0.7501296, 1.24679, 0.7723569, 1, 1, 1, 1, 1,
0.7510062, 2.537228, -0.4643163, 1, 1, 1, 1, 1,
0.7518643, -0.06215005, 1.053055, 1, 1, 1, 1, 1,
0.7526871, 0.2221119, 3.524539, 1, 1, 1, 1, 1,
0.754529, 0.04007422, 0.7830703, 1, 1, 1, 1, 1,
0.76327, 0.5274225, 2.584883, 1, 1, 1, 1, 1,
0.7633621, 1.374671, 0.6340688, 1, 1, 1, 1, 1,
0.7641278, -1.125144, 1.998198, 1, 1, 1, 1, 1,
0.7722172, -1.590754, 1.420065, 1, 1, 1, 1, 1,
0.7768995, -1.237144, 4.315702, 1, 1, 1, 1, 1,
0.7784125, 0.4745395, 1.547289, 1, 1, 1, 1, 1,
0.7792639, 0.1775928, 2.686278, 0, 0, 1, 1, 1,
0.7906961, -0.02046906, -0.6333584, 1, 0, 0, 1, 1,
0.7921476, -0.04376478, 2.617519, 1, 0, 0, 1, 1,
0.7961259, 1.227273, -1.024872, 1, 0, 0, 1, 1,
0.7984915, -0.7685658, 3.370157, 1, 0, 0, 1, 1,
0.8007674, -0.1795722, 2.849076, 1, 0, 0, 1, 1,
0.8026296, -0.08156577, 3.002882, 0, 0, 0, 1, 1,
0.8032957, 0.3842339, 1.561181, 0, 0, 0, 1, 1,
0.8048899, 0.01347145, 2.232169, 0, 0, 0, 1, 1,
0.8118339, -0.4247772, 3.217972, 0, 0, 0, 1, 1,
0.8197126, -1.192833, 2.643354, 0, 0, 0, 1, 1,
0.8292067, -0.9598625, 2.510962, 0, 0, 0, 1, 1,
0.8382694, 2.034343, -0.2299289, 0, 0, 0, 1, 1,
0.839088, 0.594052, -0.9918776, 1, 1, 1, 1, 1,
0.8486586, 1.081755, -0.344756, 1, 1, 1, 1, 1,
0.8518236, 0.1736538, -0.3618536, 1, 1, 1, 1, 1,
0.8529545, 0.9635973, 0.9104858, 1, 1, 1, 1, 1,
0.8633732, -0.02262474, 2.178619, 1, 1, 1, 1, 1,
0.8647068, -1.217175, 3.853174, 1, 1, 1, 1, 1,
0.8717053, -1.468365, 1.161466, 1, 1, 1, 1, 1,
0.8757376, -1.874623, 2.482546, 1, 1, 1, 1, 1,
0.8797887, 1.299975, -0.2039817, 1, 1, 1, 1, 1,
0.8805491, -1.43085, 3.268381, 1, 1, 1, 1, 1,
0.8830137, 0.7876897, -0.9521677, 1, 1, 1, 1, 1,
0.8840473, 1.153354, 2.448013, 1, 1, 1, 1, 1,
0.8907753, -0.07835343, 0.3450157, 1, 1, 1, 1, 1,
0.8909952, 0.7430224, 1.996449, 1, 1, 1, 1, 1,
0.8951548, -0.2859303, 2.624186, 1, 1, 1, 1, 1,
0.9027251, -0.6044374, 1.946569, 0, 0, 1, 1, 1,
0.908339, -0.6044248, 3.120968, 1, 0, 0, 1, 1,
0.9098958, 0.3797029, 1.327254, 1, 0, 0, 1, 1,
0.9279947, 0.4615636, 0.9136994, 1, 0, 0, 1, 1,
0.9354944, 0.2350908, 0.9278083, 1, 0, 0, 1, 1,
0.9502773, -0.4885276, 0.1961652, 1, 0, 0, 1, 1,
0.9522856, 1.368372, 0.936181, 0, 0, 0, 1, 1,
0.9536018, -0.1672008, 1.62686, 0, 0, 0, 1, 1,
0.9632368, -1.029406, 2.432853, 0, 0, 0, 1, 1,
0.964559, -1.907899, 2.92763, 0, 0, 0, 1, 1,
0.9645745, 1.109527, -0.2331916, 0, 0, 0, 1, 1,
0.9664215, 0.7408122, 0.6883367, 0, 0, 0, 1, 1,
0.9811642, -2.1031, 2.755249, 0, 0, 0, 1, 1,
0.9820862, 0.5499966, 0.8867608, 1, 1, 1, 1, 1,
0.9845108, 0.03884819, 1.598021, 1, 1, 1, 1, 1,
0.988874, -0.09273097, 0.8542935, 1, 1, 1, 1, 1,
0.9994107, -0.9953471, 2.639789, 1, 1, 1, 1, 1,
1.002738, 1.110399, 1.170063, 1, 1, 1, 1, 1,
1.014022, -1.210309, 1.093093, 1, 1, 1, 1, 1,
1.018816, 0.08220082, 1.44136, 1, 1, 1, 1, 1,
1.019219, 0.6886704, 0.5478833, 1, 1, 1, 1, 1,
1.023508, -0.4520314, 3.484709, 1, 1, 1, 1, 1,
1.027203, -0.2190671, 2.036632, 1, 1, 1, 1, 1,
1.027773, 0.1936703, 1.838916, 1, 1, 1, 1, 1,
1.03531, 0.3450871, 1.497986, 1, 1, 1, 1, 1,
1.041436, 0.3997069, 0.4944701, 1, 1, 1, 1, 1,
1.041603, -1.14056, 2.313354, 1, 1, 1, 1, 1,
1.042878, 2.244231, -0.1746875, 1, 1, 1, 1, 1,
1.043549, -0.4151828, 1.583994, 0, 0, 1, 1, 1,
1.064793, 0.6423835, 0.06898893, 1, 0, 0, 1, 1,
1.066862, 1.446119, 0.6272333, 1, 0, 0, 1, 1,
1.067789, -2.068627, 2.231309, 1, 0, 0, 1, 1,
1.073148, 0.5832478, 1.08897, 1, 0, 0, 1, 1,
1.07563, 1.392884, -0.2249891, 1, 0, 0, 1, 1,
1.08867, 0.5373895, 1.26972, 0, 0, 0, 1, 1,
1.092371, 1.571921, 0.6411859, 0, 0, 0, 1, 1,
1.098547, 0.4887481, 0.8311046, 0, 0, 0, 1, 1,
1.099394, 0.4461677, 0.2524682, 0, 0, 0, 1, 1,
1.101388, 1.910437, 2.628068, 0, 0, 0, 1, 1,
1.104108, -0.4955179, 3.587531, 0, 0, 0, 1, 1,
1.107602, -0.02845517, 0.7492422, 0, 0, 0, 1, 1,
1.109038, -1.174068, 1.730739, 1, 1, 1, 1, 1,
1.11895, 0.7387202, 0.04104881, 1, 1, 1, 1, 1,
1.119648, 0.3582245, -0.3010166, 1, 1, 1, 1, 1,
1.120943, -0.1553007, 3.259162, 1, 1, 1, 1, 1,
1.130878, -0.1476604, 1.508885, 1, 1, 1, 1, 1,
1.143879, -2.342283, 2.16301, 1, 1, 1, 1, 1,
1.156561, 0.9404288, 0.5657811, 1, 1, 1, 1, 1,
1.159118, 0.8021656, 0.2190032, 1, 1, 1, 1, 1,
1.165401, -1.029497, 0.7089314, 1, 1, 1, 1, 1,
1.174929, 0.2397791, 2.839868, 1, 1, 1, 1, 1,
1.179903, 0.5440747, 2.522649, 1, 1, 1, 1, 1,
1.191818, -1.875439, 2.396742, 1, 1, 1, 1, 1,
1.192287, 2.071379, 0.3984802, 1, 1, 1, 1, 1,
1.201862, 0.3865326, 0.4669498, 1, 1, 1, 1, 1,
1.210202, 0.7678617, 1.198022, 1, 1, 1, 1, 1,
1.215925, 0.1556479, 1.477864, 0, 0, 1, 1, 1,
1.217555, -1.996957, 3.706694, 1, 0, 0, 1, 1,
1.219447, 0.3888618, 0.8613417, 1, 0, 0, 1, 1,
1.223806, -0.6855344, 3.398169, 1, 0, 0, 1, 1,
1.230835, -0.3833905, 2.160881, 1, 0, 0, 1, 1,
1.247703, -1.755003, 2.030898, 1, 0, 0, 1, 1,
1.248591, 0.2868202, 1.352964, 0, 0, 0, 1, 1,
1.251091, -1.457201, 3.531565, 0, 0, 0, 1, 1,
1.264699, -0.116125, 1.602627, 0, 0, 0, 1, 1,
1.265934, 2.709865, 1.264703, 0, 0, 0, 1, 1,
1.266779, -0.5032889, 2.540644, 0, 0, 0, 1, 1,
1.283334, -0.009509775, 0.9467298, 0, 0, 0, 1, 1,
1.283535, -0.2760035, 0.9028538, 0, 0, 0, 1, 1,
1.288355, 0.324705, 2.211183, 1, 1, 1, 1, 1,
1.289033, 0.320445, 2.562742, 1, 1, 1, 1, 1,
1.294778, -1.246592, 1.464162, 1, 1, 1, 1, 1,
1.295682, 0.3438817, 2.120435, 1, 1, 1, 1, 1,
1.310818, 0.7214097, 0.1740378, 1, 1, 1, 1, 1,
1.312863, -0.4785892, 3.357965, 1, 1, 1, 1, 1,
1.321343, -0.1875977, 1.256972, 1, 1, 1, 1, 1,
1.327538, -0.3937683, 2.963807, 1, 1, 1, 1, 1,
1.329909, 1.444309, 2.174061, 1, 1, 1, 1, 1,
1.332868, -0.3834418, 2.095233, 1, 1, 1, 1, 1,
1.344705, -0.1431964, 0.6278417, 1, 1, 1, 1, 1,
1.361682, 0.6834677, 4.000362, 1, 1, 1, 1, 1,
1.363948, -0.2464651, 2.583752, 1, 1, 1, 1, 1,
1.367221, -1.568229, 3.198725, 1, 1, 1, 1, 1,
1.368238, 1.225727, 1.518041, 1, 1, 1, 1, 1,
1.36917, 0.6086797, 1.285921, 0, 0, 1, 1, 1,
1.372914, -1.176594, 1.715523, 1, 0, 0, 1, 1,
1.376508, -0.7072156, 2.132746, 1, 0, 0, 1, 1,
1.394734, -0.214514, 2.61474, 1, 0, 0, 1, 1,
1.402153, 1.773806, 1.098024, 1, 0, 0, 1, 1,
1.425098, -1.447209, 1.742487, 1, 0, 0, 1, 1,
1.42794, -0.5237778, 1.276492, 0, 0, 0, 1, 1,
1.429004, 0.1135986, 1.736195, 0, 0, 0, 1, 1,
1.431635, 0.3694242, -0.4109639, 0, 0, 0, 1, 1,
1.441889, -2.555785, 3.473994, 0, 0, 0, 1, 1,
1.45397, -0.4145539, 2.43309, 0, 0, 0, 1, 1,
1.455022, 1.438796, 0.9709818, 0, 0, 0, 1, 1,
1.455328, -0.4008737, 2.370667, 0, 0, 0, 1, 1,
1.46717, 0.4293809, 1.339998, 1, 1, 1, 1, 1,
1.473947, 0.04485644, 2.647943, 1, 1, 1, 1, 1,
1.481954, -0.8653511, 2.224974, 1, 1, 1, 1, 1,
1.485954, 2.072686, 0.9570652, 1, 1, 1, 1, 1,
1.489461, -1.134661, 1.245274, 1, 1, 1, 1, 1,
1.508407, 0.283004, 2.800385, 1, 1, 1, 1, 1,
1.518701, -0.1918837, 2.952959, 1, 1, 1, 1, 1,
1.520041, -0.1858442, 1.523419, 1, 1, 1, 1, 1,
1.53477, -1.327988, 4.643534, 1, 1, 1, 1, 1,
1.560956, -0.3411312, 2.284268, 1, 1, 1, 1, 1,
1.573454, -0.7640672, 2.546909, 1, 1, 1, 1, 1,
1.589601, 0.5748938, -0.2693964, 1, 1, 1, 1, 1,
1.597238, 0.6608138, 0.764284, 1, 1, 1, 1, 1,
1.598429, 0.8148908, 1.526361, 1, 1, 1, 1, 1,
1.605674, -0.6389307, 1.589939, 1, 1, 1, 1, 1,
1.619119, 1.411648, 1.029828, 0, 0, 1, 1, 1,
1.633404, 0.4269578, 2.665923, 1, 0, 0, 1, 1,
1.638963, 0.09999347, 1.966333, 1, 0, 0, 1, 1,
1.642138, 0.5255454, 0.5458575, 1, 0, 0, 1, 1,
1.644699, 0.431513, 0.6564546, 1, 0, 0, 1, 1,
1.655761, -0.1729953, 1.15631, 1, 0, 0, 1, 1,
1.657722, 0.3847137, 2.377132, 0, 0, 0, 1, 1,
1.659207, -1.784419, 3.671649, 0, 0, 0, 1, 1,
1.690418, -1.128326, 3.205856, 0, 0, 0, 1, 1,
1.696737, 0.7387535, 2.862084, 0, 0, 0, 1, 1,
1.717101, -2.350703, 2.271447, 0, 0, 0, 1, 1,
1.728632, -0.7272307, 2.114971, 0, 0, 0, 1, 1,
1.734362, -0.2775106, 2.118503, 0, 0, 0, 1, 1,
1.754582, -1.891899, 2.854922, 1, 1, 1, 1, 1,
1.762345, 1.099953, 0.3644392, 1, 1, 1, 1, 1,
1.778491, -0.4002247, 2.02702, 1, 1, 1, 1, 1,
1.782516, -0.888683, 0.5944107, 1, 1, 1, 1, 1,
1.786593, 1.342664, 1.279427, 1, 1, 1, 1, 1,
1.838447, -0.4971622, 2.319498, 1, 1, 1, 1, 1,
1.859836, -0.348268, 0.9513532, 1, 1, 1, 1, 1,
1.869309, 0.09010986, 0.613973, 1, 1, 1, 1, 1,
1.89942, -1.040667, 2.250433, 1, 1, 1, 1, 1,
1.904201, 0.1766372, 1.26569, 1, 1, 1, 1, 1,
1.929115, 0.5953642, 0.5493369, 1, 1, 1, 1, 1,
1.930743, 0.4549964, 1.698208, 1, 1, 1, 1, 1,
1.933551, 1.395838, 1.125294, 1, 1, 1, 1, 1,
1.942591, 0.9843577, 1.926052, 1, 1, 1, 1, 1,
1.969838, 0.005996767, 2.316713, 1, 1, 1, 1, 1,
1.976292, 0.4174586, 1.275129, 0, 0, 1, 1, 1,
1.996671, 1.493611, 0.8979121, 1, 0, 0, 1, 1,
2.052475, 0.3126764, 2.698925, 1, 0, 0, 1, 1,
2.065905, -0.7110769, 3.341867, 1, 0, 0, 1, 1,
2.082901, 1.733578, 1.332789, 1, 0, 0, 1, 1,
2.083619, 1.725617, -0.8122573, 1, 0, 0, 1, 1,
2.117341, -1.127734, 2.251688, 0, 0, 0, 1, 1,
2.132919, 1.282699, 0.735236, 0, 0, 0, 1, 1,
2.160254, 0.05959678, 1.716091, 0, 0, 0, 1, 1,
2.164246, -0.7369571, 1.509784, 0, 0, 0, 1, 1,
2.188126, -0.03788031, 1.84544, 0, 0, 0, 1, 1,
2.224116, 0.8717678, 0.383318, 0, 0, 0, 1, 1,
2.255922, -1.38096, 1.253591, 0, 0, 0, 1, 1,
2.346146, 0.6936375, 0.6329185, 1, 1, 1, 1, 1,
2.46106, -1.068828, 1.359852, 1, 1, 1, 1, 1,
2.577413, 2.2744, 1.174489, 1, 1, 1, 1, 1,
2.652289, -0.540962, 1.670994, 1, 1, 1, 1, 1,
2.700787, -0.2791936, 1.790751, 1, 1, 1, 1, 1,
2.879159, -0.6116827, 2.042327, 1, 1, 1, 1, 1,
3.073761, 0.8889972, 2.205749, 1, 1, 1, 1, 1
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
var radius = 9.063067;
var distance = 31.83364;
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
mvMatrix.translate( -0.142759, 0.1146539, 0.02288604 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.83364);
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
