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
-3.368253, 0.9013869, -0.4449663, 1, 0, 0, 1,
-2.998871, 0.6180186, -1.682311, 1, 0.007843138, 0, 1,
-2.910625, -0.09619052, -2.051133, 1, 0.01176471, 0, 1,
-2.83239, -0.117267, -1.147248, 1, 0.01960784, 0, 1,
-2.433608, -0.05516571, -2.178125, 1, 0.02352941, 0, 1,
-2.433255, -0.7294388, -0.7786941, 1, 0.03137255, 0, 1,
-2.401602, 0.6335888, -1.75433, 1, 0.03529412, 0, 1,
-2.393739, 0.290072, -2.016499, 1, 0.04313726, 0, 1,
-2.364077, -0.10293, -1.054267, 1, 0.04705882, 0, 1,
-2.180682, 0.3904836, -3.80649, 1, 0.05490196, 0, 1,
-2.163383, 1.017041, -0.3320558, 1, 0.05882353, 0, 1,
-2.125738, 0.8340223, -2.077602, 1, 0.06666667, 0, 1,
-2.110666, -0.6998851, -2.053441, 1, 0.07058824, 0, 1,
-2.098269, 1.137292, 0.5618404, 1, 0.07843138, 0, 1,
-2.080514, -0.6559278, 0.3895262, 1, 0.08235294, 0, 1,
-2.052791, -0.7577275, -0.07822349, 1, 0.09019608, 0, 1,
-2.033005, -0.473971, -1.680006, 1, 0.09411765, 0, 1,
-2.017937, 0.03302414, -1.778482, 1, 0.1019608, 0, 1,
-2.015332, 0.2257319, -1.54694, 1, 0.1098039, 0, 1,
-2.010116, 0.2323959, -0.4257092, 1, 0.1137255, 0, 1,
-2.008851, -0.2866394, -0.8132873, 1, 0.1215686, 0, 1,
-2.006416, -0.4185783, -1.732819, 1, 0.1254902, 0, 1,
-1.960537, 0.2100927, -1.136827, 1, 0.1333333, 0, 1,
-1.957142, 1.159989, -0.7830924, 1, 0.1372549, 0, 1,
-1.939889, 0.407169, -0.9495155, 1, 0.145098, 0, 1,
-1.933706, -0.5476004, -0.8884231, 1, 0.1490196, 0, 1,
-1.930379, 0.3745768, -1.366899, 1, 0.1568628, 0, 1,
-1.90921, 0.8598553, -0.5156178, 1, 0.1607843, 0, 1,
-1.897785, 0.5700181, -0.4979381, 1, 0.1686275, 0, 1,
-1.883044, -1.095577, -1.808427, 1, 0.172549, 0, 1,
-1.875952, 0.2914913, 0.4943486, 1, 0.1803922, 0, 1,
-1.846411, -2.208354, -2.890528, 1, 0.1843137, 0, 1,
-1.837859, 0.05483408, -2.184991, 1, 0.1921569, 0, 1,
-1.826133, 1.583646, -0.8725586, 1, 0.1960784, 0, 1,
-1.816345, -2.199967, -3.234843, 1, 0.2039216, 0, 1,
-1.808438, 0.002298271, -1.538219, 1, 0.2117647, 0, 1,
-1.802565, 0.2630698, -3.237773, 1, 0.2156863, 0, 1,
-1.799467, 1.246825, 0.7585484, 1, 0.2235294, 0, 1,
-1.770218, -1.04879, -4.024837, 1, 0.227451, 0, 1,
-1.763297, -0.7132829, -3.035115, 1, 0.2352941, 0, 1,
-1.750405, -0.5059704, -3.897976, 1, 0.2392157, 0, 1,
-1.740558, -0.3876342, -1.556637, 1, 0.2470588, 0, 1,
-1.739394, -0.1804789, -3.278822, 1, 0.2509804, 0, 1,
-1.683019, 0.565515, -0.4360524, 1, 0.2588235, 0, 1,
-1.662258, -0.3441104, -1.86082, 1, 0.2627451, 0, 1,
-1.660859, -0.7511523, -4.382491, 1, 0.2705882, 0, 1,
-1.660095, 1.334747, -1.964371, 1, 0.2745098, 0, 1,
-1.658428, 0.6143143, -1.220398, 1, 0.282353, 0, 1,
-1.657307, -1.415248, -2.617525, 1, 0.2862745, 0, 1,
-1.648413, 1.203807, -0.3503278, 1, 0.2941177, 0, 1,
-1.647421, -0.5776067, -3.357808, 1, 0.3019608, 0, 1,
-1.642351, -0.2607765, -2.970198, 1, 0.3058824, 0, 1,
-1.640208, 0.8617265, -1.407678, 1, 0.3137255, 0, 1,
-1.637588, -0.7699364, -2.417426, 1, 0.3176471, 0, 1,
-1.63288, 1.065364, -1.315246, 1, 0.3254902, 0, 1,
-1.628902, -0.7408372, -1.103305, 1, 0.3294118, 0, 1,
-1.608164, 0.9168084, -0.8357074, 1, 0.3372549, 0, 1,
-1.600413, -0.04604454, -1.095391, 1, 0.3411765, 0, 1,
-1.597624, 0.1710589, -1.580837, 1, 0.3490196, 0, 1,
-1.567407, -1.237148, -2.527392, 1, 0.3529412, 0, 1,
-1.551109, 0.8464248, -0.3574946, 1, 0.3607843, 0, 1,
-1.545545, -1.180624, -2.187636, 1, 0.3647059, 0, 1,
-1.538684, -2.147472, -1.604018, 1, 0.372549, 0, 1,
-1.520364, -1.749226, -3.934723, 1, 0.3764706, 0, 1,
-1.506548, -0.2806906, -1.143441, 1, 0.3843137, 0, 1,
-1.491806, -1.677304, -1.970803, 1, 0.3882353, 0, 1,
-1.48844, 0.9201255, 0.8614942, 1, 0.3960784, 0, 1,
-1.488245, 0.06260051, -1.309211, 1, 0.4039216, 0, 1,
-1.487052, -1.256845, -1.010895, 1, 0.4078431, 0, 1,
-1.483764, -1.171951, -0.5449914, 1, 0.4156863, 0, 1,
-1.476588, 1.253031, -1.536274, 1, 0.4196078, 0, 1,
-1.465467, 1.765764, -2.511064, 1, 0.427451, 0, 1,
-1.463358, 0.9865351, 0.355276, 1, 0.4313726, 0, 1,
-1.453402, 0.4076871, -0.5847693, 1, 0.4392157, 0, 1,
-1.442671, 0.3531811, -1.431014, 1, 0.4431373, 0, 1,
-1.439973, -0.3085601, -3.717511, 1, 0.4509804, 0, 1,
-1.439608, 0.3180318, -1.009092, 1, 0.454902, 0, 1,
-1.433264, -1.613845, -2.357818, 1, 0.4627451, 0, 1,
-1.416356, 0.2164937, -3.319732, 1, 0.4666667, 0, 1,
-1.40602, 0.4075037, -0.680261, 1, 0.4745098, 0, 1,
-1.396658, 0.4776231, -1.0274, 1, 0.4784314, 0, 1,
-1.389924, -0.557594, 0.1221206, 1, 0.4862745, 0, 1,
-1.384233, -0.4231736, -2.6065, 1, 0.4901961, 0, 1,
-1.365457, -0.730903, -1.544405, 1, 0.4980392, 0, 1,
-1.364992, 0.8204271, -1.82686, 1, 0.5058824, 0, 1,
-1.359951, -1.460104, -1.475055, 1, 0.509804, 0, 1,
-1.343662, -0.8533577, -1.92042, 1, 0.5176471, 0, 1,
-1.329738, 0.5997726, -1.487165, 1, 0.5215687, 0, 1,
-1.328256, -0.4192306, -2.1339, 1, 0.5294118, 0, 1,
-1.328002, -0.3620424, -3.375183, 1, 0.5333334, 0, 1,
-1.314636, 1.114751, -1.19221, 1, 0.5411765, 0, 1,
-1.296466, 1.391261, -0.1777009, 1, 0.5450981, 0, 1,
-1.275812, 0.1603478, -1.998983, 1, 0.5529412, 0, 1,
-1.266831, -0.6874703, -2.722245, 1, 0.5568628, 0, 1,
-1.25269, 0.4233721, 0.07182462, 1, 0.5647059, 0, 1,
-1.237086, 0.03390783, -2.218338, 1, 0.5686275, 0, 1,
-1.23612, -1.447801, -1.660864, 1, 0.5764706, 0, 1,
-1.234496, 1.081511, -0.4259138, 1, 0.5803922, 0, 1,
-1.224593, -1.802371, -1.841806, 1, 0.5882353, 0, 1,
-1.215644, 0.6951209, -0.5996554, 1, 0.5921569, 0, 1,
-1.209628, -0.3902353, -4.495423, 1, 0.6, 0, 1,
-1.205038, 0.4193983, -0.620452, 1, 0.6078432, 0, 1,
-1.204392, 0.5688769, -1.566604, 1, 0.6117647, 0, 1,
-1.193973, 0.8262169, -1.139256, 1, 0.6196079, 0, 1,
-1.193034, 0.9172007, -0.3967927, 1, 0.6235294, 0, 1,
-1.189771, -2.578214, -2.804683, 1, 0.6313726, 0, 1,
-1.187066, -0.02491095, -1.764262, 1, 0.6352941, 0, 1,
-1.182847, -1.088014, -2.102751, 1, 0.6431373, 0, 1,
-1.175422, -2.265501, -1.720288, 1, 0.6470588, 0, 1,
-1.173909, 0.7708067, -0.6701891, 1, 0.654902, 0, 1,
-1.159308, 0.06641484, -1.394352, 1, 0.6588235, 0, 1,
-1.153358, -0.7418, -2.467139, 1, 0.6666667, 0, 1,
-1.145384, 0.5784965, -0.932045, 1, 0.6705883, 0, 1,
-1.141848, -0.4445229, -1.355507, 1, 0.6784314, 0, 1,
-1.138263, -0.5879165, -2.827714, 1, 0.682353, 0, 1,
-1.137098, -0.3545527, -1.793529, 1, 0.6901961, 0, 1,
-1.133828, 0.5359753, -1.176624, 1, 0.6941177, 0, 1,
-1.133653, -0.02820258, -2.825096, 1, 0.7019608, 0, 1,
-1.123175, 0.05047032, -2.180585, 1, 0.7098039, 0, 1,
-1.120356, -1.25494, -3.196603, 1, 0.7137255, 0, 1,
-1.118706, 0.6643732, -1.625368, 1, 0.7215686, 0, 1,
-1.115734, 1.596954, 0.03219038, 1, 0.7254902, 0, 1,
-1.110427, 0.7862416, -2.591387, 1, 0.7333333, 0, 1,
-1.106057, -1.544838, -4.063964, 1, 0.7372549, 0, 1,
-1.104697, -1.477359, -4.015731, 1, 0.7450981, 0, 1,
-1.102984, -1.907285, -3.522684, 1, 0.7490196, 0, 1,
-1.102114, -0.4534783, -0.1961955, 1, 0.7568628, 0, 1,
-1.099657, 0.4239037, -2.077017, 1, 0.7607843, 0, 1,
-1.099122, -0.2848202, -0.880501, 1, 0.7686275, 0, 1,
-1.09771, 0.4475331, -1.479449, 1, 0.772549, 0, 1,
-1.079346, -1.065177, 0.6120512, 1, 0.7803922, 0, 1,
-1.0786, 1.286052, -0.5684148, 1, 0.7843137, 0, 1,
-1.074964, 0.3704624, -1.351215, 1, 0.7921569, 0, 1,
-1.07, 2.457185, -0.5531436, 1, 0.7960784, 0, 1,
-1.068927, 0.5492609, -2.149215, 1, 0.8039216, 0, 1,
-1.055344, -0.3938896, -2.565867, 1, 0.8117647, 0, 1,
-1.054164, -0.3162361, -1.533496, 1, 0.8156863, 0, 1,
-1.053905, 0.278639, -2.155478, 1, 0.8235294, 0, 1,
-1.052532, 1.246629, -0.5172033, 1, 0.827451, 0, 1,
-1.049491, -0.908355, -2.47791, 1, 0.8352941, 0, 1,
-1.046913, -0.5881673, -2.985777, 1, 0.8392157, 0, 1,
-1.044863, 1.329384, -0.09109129, 1, 0.8470588, 0, 1,
-1.043517, 1.160221, -0.3703832, 1, 0.8509804, 0, 1,
-1.036606, 0.5139488, -0.1741622, 1, 0.8588235, 0, 1,
-1.031065, -0.9893695, -3.675012, 1, 0.8627451, 0, 1,
-1.026254, -0.6615573, -1.456979, 1, 0.8705882, 0, 1,
-1.019044, 0.9286548, -0.1753633, 1, 0.8745098, 0, 1,
-1.017149, -1.045946, -1.878671, 1, 0.8823529, 0, 1,
-1.016618, 0.5699563, -1.280728, 1, 0.8862745, 0, 1,
-1.015187, 1.060029, -1.3462, 1, 0.8941177, 0, 1,
-1.013552, 0.04011991, -1.985573, 1, 0.8980392, 0, 1,
-1.006912, -1.055123, -2.273657, 1, 0.9058824, 0, 1,
-1.004085, 0.1011861, -1.355828, 1, 0.9137255, 0, 1,
-1.001204, -1.429367, -2.213055, 1, 0.9176471, 0, 1,
-0.9979855, -0.2321469, -2.504593, 1, 0.9254902, 0, 1,
-0.9928955, -0.0494106, -2.042609, 1, 0.9294118, 0, 1,
-0.9883049, -0.3753917, -2.637533, 1, 0.9372549, 0, 1,
-0.9818714, 0.7945469, -0.03506149, 1, 0.9411765, 0, 1,
-0.9722661, -0.3792153, -1.107642, 1, 0.9490196, 0, 1,
-0.9683968, 3.199007, -0.5753813, 1, 0.9529412, 0, 1,
-0.9618379, 1.052263, -1.790155, 1, 0.9607843, 0, 1,
-0.960799, -0.4103247, -1.154632, 1, 0.9647059, 0, 1,
-0.9561845, 1.157078, -0.6594176, 1, 0.972549, 0, 1,
-0.9560629, -0.3949734, -4.219764, 1, 0.9764706, 0, 1,
-0.9543001, 1.207548, -0.5721374, 1, 0.9843137, 0, 1,
-0.946378, -1.269656, -1.547405, 1, 0.9882353, 0, 1,
-0.9454845, -1.347037, -3.411414, 1, 0.9960784, 0, 1,
-0.9431407, 0.7703606, -0.8378657, 0.9960784, 1, 0, 1,
-0.9389783, 1.74668, 0.5722247, 0.9921569, 1, 0, 1,
-0.9375539, 1.39504, -2.209199, 0.9843137, 1, 0, 1,
-0.9374956, -1.519916, -1.077018, 0.9803922, 1, 0, 1,
-0.9345655, 0.4933594, -1.845956, 0.972549, 1, 0, 1,
-0.9302355, -0.6400347, -1.56472, 0.9686275, 1, 0, 1,
-0.9183626, 0.3001203, -1.895057, 0.9607843, 1, 0, 1,
-0.9157964, 0.1482586, -0.9859926, 0.9568627, 1, 0, 1,
-0.9096105, -0.3516521, -1.311219, 0.9490196, 1, 0, 1,
-0.9066976, -0.7299445, -2.007858, 0.945098, 1, 0, 1,
-0.899689, -0.8842297, -1.72775, 0.9372549, 1, 0, 1,
-0.8974513, -0.09332002, -1.871941, 0.9333333, 1, 0, 1,
-0.8970467, 1.135038, -1.306561, 0.9254902, 1, 0, 1,
-0.8966776, 1.099969, -0.4021694, 0.9215686, 1, 0, 1,
-0.8877369, 1.032515, -0.9723056, 0.9137255, 1, 0, 1,
-0.8818419, 0.7438095, 0.08175395, 0.9098039, 1, 0, 1,
-0.8746039, -1.130427, -2.545655, 0.9019608, 1, 0, 1,
-0.8710978, 1.240134, 0.602501, 0.8941177, 1, 0, 1,
-0.8678122, -1.024155, -3.993181, 0.8901961, 1, 0, 1,
-0.8618098, 2.616426, -1.675157, 0.8823529, 1, 0, 1,
-0.860181, 0.530569, -0.9301071, 0.8784314, 1, 0, 1,
-0.8439575, -1.334207, -4.066313, 0.8705882, 1, 0, 1,
-0.8387837, -1.180649, -3.112898, 0.8666667, 1, 0, 1,
-0.8385539, 0.2024514, -0.5929323, 0.8588235, 1, 0, 1,
-0.8306927, -1.096812, -1.778285, 0.854902, 1, 0, 1,
-0.8286973, -0.04865416, -1.697955, 0.8470588, 1, 0, 1,
-0.823297, -1.618072, -1.246616, 0.8431373, 1, 0, 1,
-0.8211019, -1.949712, -1.449737, 0.8352941, 1, 0, 1,
-0.8189712, -2.232877, -2.397639, 0.8313726, 1, 0, 1,
-0.8180879, 0.4447185, 0.08298807, 0.8235294, 1, 0, 1,
-0.8171604, -0.1971149, -3.644801, 0.8196079, 1, 0, 1,
-0.8141124, -0.2640711, -2.476645, 0.8117647, 1, 0, 1,
-0.8136064, 0.1301263, -0.4796587, 0.8078431, 1, 0, 1,
-0.8113676, 0.5767434, 0.6598477, 0.8, 1, 0, 1,
-0.8041005, 2.393527, -0.7875282, 0.7921569, 1, 0, 1,
-0.8037874, -1.884847, -1.576707, 0.7882353, 1, 0, 1,
-0.7969832, 0.3510761, 0.1121906, 0.7803922, 1, 0, 1,
-0.7924075, 1.070893, -2.619093, 0.7764706, 1, 0, 1,
-0.7863448, -0.1068362, -1.921029, 0.7686275, 1, 0, 1,
-0.7750281, -1.118671, -2.855633, 0.7647059, 1, 0, 1,
-0.770161, 0.4185015, -1.856419, 0.7568628, 1, 0, 1,
-0.7695202, 0.1023346, -2.623533, 0.7529412, 1, 0, 1,
-0.7634724, 0.377999, -2.188078, 0.7450981, 1, 0, 1,
-0.763467, -0.7406149, -3.863219, 0.7411765, 1, 0, 1,
-0.7571242, -0.5292454, -1.30018, 0.7333333, 1, 0, 1,
-0.755572, 0.4930544, -0.16625, 0.7294118, 1, 0, 1,
-0.7464501, 1.292019, -0.6008466, 0.7215686, 1, 0, 1,
-0.7445435, 0.2552529, -0.4832617, 0.7176471, 1, 0, 1,
-0.7444132, -0.6111086, -2.977509, 0.7098039, 1, 0, 1,
-0.737682, 0.4467979, -2.155229, 0.7058824, 1, 0, 1,
-0.7363827, 1.90443, -0.0706769, 0.6980392, 1, 0, 1,
-0.7359703, -1.074701, -3.428415, 0.6901961, 1, 0, 1,
-0.7354925, 0.883037, -0.9243719, 0.6862745, 1, 0, 1,
-0.7290605, 0.1113752, -1.210531, 0.6784314, 1, 0, 1,
-0.7276366, -0.3781341, -1.296308, 0.6745098, 1, 0, 1,
-0.7219135, 0.1000927, -1.522472, 0.6666667, 1, 0, 1,
-0.7172827, 0.5128161, -2.112647, 0.6627451, 1, 0, 1,
-0.7151643, -0.206055, -1.320742, 0.654902, 1, 0, 1,
-0.7080178, -0.7185271, -2.170319, 0.6509804, 1, 0, 1,
-0.7068068, 0.05464683, -0.6263145, 0.6431373, 1, 0, 1,
-0.7042989, -0.2704898, 0.2806826, 0.6392157, 1, 0, 1,
-0.7027084, -0.1189834, -1.869408, 0.6313726, 1, 0, 1,
-0.6997498, -0.5494782, -1.752977, 0.627451, 1, 0, 1,
-0.6836433, 0.4369574, -0.431743, 0.6196079, 1, 0, 1,
-0.6748929, -1.137839, -1.960312, 0.6156863, 1, 0, 1,
-0.6733908, 1.154868, -1.359535, 0.6078432, 1, 0, 1,
-0.6700662, 0.9611889, -2.270208, 0.6039216, 1, 0, 1,
-0.6660033, -0.5963559, -0.7590247, 0.5960785, 1, 0, 1,
-0.6629047, -0.534737, -2.918947, 0.5882353, 1, 0, 1,
-0.6627398, -0.5318803, -2.283683, 0.5843138, 1, 0, 1,
-0.6594292, 0.4416752, -1.055803, 0.5764706, 1, 0, 1,
-0.6526284, -1.180902, -3.924749, 0.572549, 1, 0, 1,
-0.6505, -0.2795558, -1.812891, 0.5647059, 1, 0, 1,
-0.6484853, 1.268864, -1.102075, 0.5607843, 1, 0, 1,
-0.6470254, -1.749798, -1.924909, 0.5529412, 1, 0, 1,
-0.6458513, -0.7898455, -0.8949972, 0.5490196, 1, 0, 1,
-0.6430935, -0.5678672, -3.301795, 0.5411765, 1, 0, 1,
-0.6397842, -0.7141057, -4.339224, 0.5372549, 1, 0, 1,
-0.6397588, -0.7801469, -2.199697, 0.5294118, 1, 0, 1,
-0.6391669, 0.2647612, -0.9973025, 0.5254902, 1, 0, 1,
-0.6365981, -0.3686904, -1.604047, 0.5176471, 1, 0, 1,
-0.6365448, -0.5226075, -2.558416, 0.5137255, 1, 0, 1,
-0.6246795, 0.2000063, -0.2675608, 0.5058824, 1, 0, 1,
-0.6246629, 0.6985623, -0.8788261, 0.5019608, 1, 0, 1,
-0.6234226, 0.6555744, -0.1750006, 0.4941176, 1, 0, 1,
-0.6221209, 0.5385031, -2.004558, 0.4862745, 1, 0, 1,
-0.6136879, 0.8025731, -1.0566, 0.4823529, 1, 0, 1,
-0.6106074, -0.4706477, -1.495335, 0.4745098, 1, 0, 1,
-0.6017591, 0.1734269, -1.749186, 0.4705882, 1, 0, 1,
-0.6007386, -0.2714129, -1.584432, 0.4627451, 1, 0, 1,
-0.5966663, 0.1623544, -2.445928, 0.4588235, 1, 0, 1,
-0.5951601, -2.120721, -2.026444, 0.4509804, 1, 0, 1,
-0.5949816, 0.4601153, -2.460143, 0.4470588, 1, 0, 1,
-0.5941082, -1.653066, -4.111023, 0.4392157, 1, 0, 1,
-0.5938396, -0.3920964, -2.691536, 0.4352941, 1, 0, 1,
-0.5897608, 1.006197, -1.747055, 0.427451, 1, 0, 1,
-0.5876221, 0.1011916, -1.186015, 0.4235294, 1, 0, 1,
-0.5866284, -2.236755, -4.07467, 0.4156863, 1, 0, 1,
-0.5865942, 1.207722, -0.06530699, 0.4117647, 1, 0, 1,
-0.5863846, 0.7361339, -0.3848017, 0.4039216, 1, 0, 1,
-0.5860311, -1.274105, -2.441457, 0.3960784, 1, 0, 1,
-0.5852318, 0.6859658, 0.1456873, 0.3921569, 1, 0, 1,
-0.5832897, 1.312307, -0.4835373, 0.3843137, 1, 0, 1,
-0.5813379, 0.6135719, -0.1470872, 0.3803922, 1, 0, 1,
-0.5793713, 0.530296, -0.8454095, 0.372549, 1, 0, 1,
-0.5750983, 0.4294533, -1.69396, 0.3686275, 1, 0, 1,
-0.5691717, -1.263252, -3.030986, 0.3607843, 1, 0, 1,
-0.5589653, -0.7862816, -3.71682, 0.3568628, 1, 0, 1,
-0.5573332, -0.6364475, -2.091213, 0.3490196, 1, 0, 1,
-0.5568574, 0.2210189, 0.2285185, 0.345098, 1, 0, 1,
-0.5554374, 0.3040685, -0.7530278, 0.3372549, 1, 0, 1,
-0.5485027, -0.8362975, -1.342185, 0.3333333, 1, 0, 1,
-0.5457634, -0.7809696, -1.871833, 0.3254902, 1, 0, 1,
-0.5421317, 0.05968258, -2.254909, 0.3215686, 1, 0, 1,
-0.5379117, -0.7898334, -2.786469, 0.3137255, 1, 0, 1,
-0.5363367, 1.301997, 0.106662, 0.3098039, 1, 0, 1,
-0.5340413, -0.01642251, -0.7383269, 0.3019608, 1, 0, 1,
-0.5312683, -0.8047301, -0.1351361, 0.2941177, 1, 0, 1,
-0.5308065, -0.1914305, -1.740472, 0.2901961, 1, 0, 1,
-0.5307968, 1.715897, -1.686448, 0.282353, 1, 0, 1,
-0.5277226, -0.6753597, -3.385629, 0.2784314, 1, 0, 1,
-0.5223317, 0.3528975, -0.2164295, 0.2705882, 1, 0, 1,
-0.5215352, 0.2654293, -1.305295, 0.2666667, 1, 0, 1,
-0.5215251, -0.6066355, -2.305134, 0.2588235, 1, 0, 1,
-0.5209102, 1.017824, 1.085429, 0.254902, 1, 0, 1,
-0.5198634, -1.090698, -5.800408, 0.2470588, 1, 0, 1,
-0.5183575, -0.284396, -2.567423, 0.2431373, 1, 0, 1,
-0.5151451, 1.277553, 0.8569899, 0.2352941, 1, 0, 1,
-0.514408, -0.4001679, -2.466161, 0.2313726, 1, 0, 1,
-0.5100822, -1.03664, -1.542118, 0.2235294, 1, 0, 1,
-0.509326, 0.5931683, 0.3247236, 0.2196078, 1, 0, 1,
-0.507086, -1.228985, -4.153253, 0.2117647, 1, 0, 1,
-0.4916597, -1.910292, -3.049705, 0.2078431, 1, 0, 1,
-0.4875365, -2.860073, -1.805922, 0.2, 1, 0, 1,
-0.4822407, 0.1773737, -1.441505, 0.1921569, 1, 0, 1,
-0.4817451, -0.5637774, -1.435711, 0.1882353, 1, 0, 1,
-0.4807374, 0.9204572, -1.330762, 0.1803922, 1, 0, 1,
-0.4789803, -0.5231534, -3.815869, 0.1764706, 1, 0, 1,
-0.4756753, 0.02970285, -1.431974, 0.1686275, 1, 0, 1,
-0.4651281, 1.465084, -1.370011, 0.1647059, 1, 0, 1,
-0.4580792, -1.199853, -4.015838, 0.1568628, 1, 0, 1,
-0.4576055, -1.151148, -1.698143, 0.1529412, 1, 0, 1,
-0.4565175, -0.9446511, -3.720589, 0.145098, 1, 0, 1,
-0.4530937, -0.7821972, -1.500561, 0.1411765, 1, 0, 1,
-0.4503841, 0.9783689, 1.03426, 0.1333333, 1, 0, 1,
-0.4445998, -0.1841519, -2.102748, 0.1294118, 1, 0, 1,
-0.4444748, -0.4424349, -2.812556, 0.1215686, 1, 0, 1,
-0.4430544, -0.3824722, -3.10987, 0.1176471, 1, 0, 1,
-0.4421054, 0.4867453, -0.512233, 0.1098039, 1, 0, 1,
-0.4384909, -0.5070164, -2.460134, 0.1058824, 1, 0, 1,
-0.4383007, 0.3011934, -2.935788, 0.09803922, 1, 0, 1,
-0.4357576, 0.02359044, -2.299384, 0.09019608, 1, 0, 1,
-0.4348719, 0.6929352, 0.3810751, 0.08627451, 1, 0, 1,
-0.4309464, -0.3443995, -3.364509, 0.07843138, 1, 0, 1,
-0.4306031, -0.570973, -2.042869, 0.07450981, 1, 0, 1,
-0.4242385, 0.1524635, -1.750895, 0.06666667, 1, 0, 1,
-0.4200953, 2.159101, 1.021182, 0.0627451, 1, 0, 1,
-0.41669, -1.425345, -2.484046, 0.05490196, 1, 0, 1,
-0.4147325, -1.040051, -3.822244, 0.05098039, 1, 0, 1,
-0.4142285, -0.4916667, -2.724544, 0.04313726, 1, 0, 1,
-0.4082027, -1.743693, -2.005727, 0.03921569, 1, 0, 1,
-0.4047529, -0.86211, -1.877282, 0.03137255, 1, 0, 1,
-0.4018077, 0.4899082, -0.1537574, 0.02745098, 1, 0, 1,
-0.4001972, 1.174978, -0.8680472, 0.01960784, 1, 0, 1,
-0.3967967, 0.2940371, -1.312966, 0.01568628, 1, 0, 1,
-0.3898954, 0.40394, 0.02907826, 0.007843138, 1, 0, 1,
-0.3880273, -0.95219, -2.429677, 0.003921569, 1, 0, 1,
-0.3856895, 0.1971837, -1.20753, 0, 1, 0.003921569, 1,
-0.3779981, -0.3345423, -1.46709, 0, 1, 0.01176471, 1,
-0.3737695, -1.955913, -4.748542, 0, 1, 0.01568628, 1,
-0.3732276, -0.9345121, -2.690874, 0, 1, 0.02352941, 1,
-0.3670841, -1.038526, -2.884183, 0, 1, 0.02745098, 1,
-0.3623427, 0.5748821, -0.05957134, 0, 1, 0.03529412, 1,
-0.3597037, 0.3576055, -0.2525583, 0, 1, 0.03921569, 1,
-0.3593899, 0.03825251, -1.408453, 0, 1, 0.04705882, 1,
-0.3580372, 0.06843115, -2.039108, 0, 1, 0.05098039, 1,
-0.3577146, 0.3808855, -1.356666, 0, 1, 0.05882353, 1,
-0.3540332, 0.07962301, -0.8335781, 0, 1, 0.0627451, 1,
-0.352161, -0.01225917, -2.561731, 0, 1, 0.07058824, 1,
-0.3520229, -1.426321, -0.9933722, 0, 1, 0.07450981, 1,
-0.349849, -1.016897, -3.422516, 0, 1, 0.08235294, 1,
-0.3487617, 0.3646224, -1.155407, 0, 1, 0.08627451, 1,
-0.3459156, 0.2121006, -0.6388241, 0, 1, 0.09411765, 1,
-0.3424622, -0.2909241, -3.853956, 0, 1, 0.1019608, 1,
-0.3408439, -0.7469337, -2.65338, 0, 1, 0.1058824, 1,
-0.3350912, -1.540716, -2.265894, 0, 1, 0.1137255, 1,
-0.3283854, 1.030553, 0.2340673, 0, 1, 0.1176471, 1,
-0.3249561, 0.01551282, 0.4080264, 0, 1, 0.1254902, 1,
-0.3220483, -1.333731, -2.914203, 0, 1, 0.1294118, 1,
-0.3173136, 1.088697, -0.8905399, 0, 1, 0.1372549, 1,
-0.311728, 0.5216476, -0.8255377, 0, 1, 0.1411765, 1,
-0.3113634, -0.2249029, -1.026025, 0, 1, 0.1490196, 1,
-0.3084838, -0.9751627, -4.132756, 0, 1, 0.1529412, 1,
-0.3076168, -0.9291525, -1.150851, 0, 1, 0.1607843, 1,
-0.3036711, -0.9733909, -1.446208, 0, 1, 0.1647059, 1,
-0.2974289, 0.2873992, -0.950749, 0, 1, 0.172549, 1,
-0.2951868, 0.09965178, -0.7327196, 0, 1, 0.1764706, 1,
-0.2914188, 2.010066, 0.4637951, 0, 1, 0.1843137, 1,
-0.2851359, 0.7641612, 0.2457659, 0, 1, 0.1882353, 1,
-0.2846826, -0.2793398, -3.249467, 0, 1, 0.1960784, 1,
-0.2832278, 0.6344086, 1.058191, 0, 1, 0.2039216, 1,
-0.2817219, -0.4673098, -3.77653, 0, 1, 0.2078431, 1,
-0.2800643, 2.441249, 1.317478, 0, 1, 0.2156863, 1,
-0.2777096, -0.3695435, -2.775548, 0, 1, 0.2196078, 1,
-0.2774646, 0.1417711, -0.9281965, 0, 1, 0.227451, 1,
-0.277001, 1.039248, -0.9731899, 0, 1, 0.2313726, 1,
-0.2760832, 0.3535081, 0.6150306, 0, 1, 0.2392157, 1,
-0.2732294, -0.6373202, 0.1267375, 0, 1, 0.2431373, 1,
-0.2721334, 0.8033224, -0.05864805, 0, 1, 0.2509804, 1,
-0.2698817, 0.6469839, -0.2951034, 0, 1, 0.254902, 1,
-0.265203, 0.6107026, -0.8666489, 0, 1, 0.2627451, 1,
-0.2651727, -0.1833826, -2.567175, 0, 1, 0.2666667, 1,
-0.2625795, -0.2213772, -1.002872, 0, 1, 0.2745098, 1,
-0.2571535, 0.6497866, -0.02776295, 0, 1, 0.2784314, 1,
-0.2555688, -1.090682, -3.78551, 0, 1, 0.2862745, 1,
-0.2519284, -0.4777846, -1.889786, 0, 1, 0.2901961, 1,
-0.2484729, 1.112325, 0.1448586, 0, 1, 0.2980392, 1,
-0.2444267, 0.6273622, -0.1564214, 0, 1, 0.3058824, 1,
-0.2427861, 2.294785, -1.279879, 0, 1, 0.3098039, 1,
-0.2415354, 0.3997987, -0.490732, 0, 1, 0.3176471, 1,
-0.2355982, -0.8673091, -4.129218, 0, 1, 0.3215686, 1,
-0.2326925, -1.352577, -4.425676, 0, 1, 0.3294118, 1,
-0.232225, -0.8674793, -2.122328, 0, 1, 0.3333333, 1,
-0.2301647, 1.533242, -1.134997, 0, 1, 0.3411765, 1,
-0.2274155, 1.357483, 0.3168974, 0, 1, 0.345098, 1,
-0.2272629, 0.5116262, -0.3726013, 0, 1, 0.3529412, 1,
-0.2255305, 0.0005738624, -1.744494, 0, 1, 0.3568628, 1,
-0.2231046, 0.1323532, -1.004138, 0, 1, 0.3647059, 1,
-0.22017, 0.8669779, -0.5177928, 0, 1, 0.3686275, 1,
-0.2182126, -0.4493423, -2.69329, 0, 1, 0.3764706, 1,
-0.2176356, 1.639243, -0.543263, 0, 1, 0.3803922, 1,
-0.2176017, 0.3907954, -0.5629811, 0, 1, 0.3882353, 1,
-0.2170939, -0.7972915, -3.203557, 0, 1, 0.3921569, 1,
-0.2080302, 0.4624989, -0.03577418, 0, 1, 0.4, 1,
-0.2062172, 1.167874, -0.03077764, 0, 1, 0.4078431, 1,
-0.2051657, -0.3503101, -4.04562, 0, 1, 0.4117647, 1,
-0.2014599, -0.7131931, -3.482055, 0, 1, 0.4196078, 1,
-0.2001764, -1.241997, -3.90377, 0, 1, 0.4235294, 1,
-0.1983798, -0.04531826, -0.7505822, 0, 1, 0.4313726, 1,
-0.1942911, 1.7626, -0.4009523, 0, 1, 0.4352941, 1,
-0.1922738, 0.03881563, -0.9929944, 0, 1, 0.4431373, 1,
-0.1913522, -0.2853517, -4.063673, 0, 1, 0.4470588, 1,
-0.190692, -0.3749837, -0.6554102, 0, 1, 0.454902, 1,
-0.1891971, 0.7876645, 0.6295255, 0, 1, 0.4588235, 1,
-0.1887139, 0.1100239, 0.5486326, 0, 1, 0.4666667, 1,
-0.186233, -2.304967, -2.347744, 0, 1, 0.4705882, 1,
-0.1850338, 0.3313617, -0.1429817, 0, 1, 0.4784314, 1,
-0.183616, -0.2716169, -1.392591, 0, 1, 0.4823529, 1,
-0.1759596, 1.22006, -0.02236168, 0, 1, 0.4901961, 1,
-0.1743969, 0.04213142, -0.7386228, 0, 1, 0.4941176, 1,
-0.1720427, -1.150433, -2.317981, 0, 1, 0.5019608, 1,
-0.171736, 0.1976857, -0.7135015, 0, 1, 0.509804, 1,
-0.1668115, 0.183476, -0.4657375, 0, 1, 0.5137255, 1,
-0.1662627, 0.02848792, -0.1581595, 0, 1, 0.5215687, 1,
-0.1647742, -0.5104494, -4.280017, 0, 1, 0.5254902, 1,
-0.1646718, 0.02464762, -1.648161, 0, 1, 0.5333334, 1,
-0.160036, -1.373815, -1.736129, 0, 1, 0.5372549, 1,
-0.1598206, -0.7721521, -2.498092, 0, 1, 0.5450981, 1,
-0.1555019, 0.6126034, 0.1595156, 0, 1, 0.5490196, 1,
-0.1533485, -0.7312566, -2.807263, 0, 1, 0.5568628, 1,
-0.1515445, -0.004770846, -1.600515, 0, 1, 0.5607843, 1,
-0.1494081, -1.430328, -2.683568, 0, 1, 0.5686275, 1,
-0.1417175, -1.338027, -3.979488, 0, 1, 0.572549, 1,
-0.1389161, 0.7692236, 0.3938937, 0, 1, 0.5803922, 1,
-0.1383993, -1.086877, -2.863352, 0, 1, 0.5843138, 1,
-0.1381211, -0.1191785, -1.371521, 0, 1, 0.5921569, 1,
-0.1357654, 0.1839605, -1.205484, 0, 1, 0.5960785, 1,
-0.1335189, -0.1905645, -3.840131, 0, 1, 0.6039216, 1,
-0.1282046, 0.3723667, 0.8519995, 0, 1, 0.6117647, 1,
-0.1258454, 1.41124, -0.3172409, 0, 1, 0.6156863, 1,
-0.1247614, 0.5485203, 0.6669183, 0, 1, 0.6235294, 1,
-0.1179224, 0.8589707, -1.417989, 0, 1, 0.627451, 1,
-0.1128615, 1.155627, 0.8725306, 0, 1, 0.6352941, 1,
-0.110846, -0.174878, -2.698677, 0, 1, 0.6392157, 1,
-0.1099237, 1.040036, -0.7190024, 0, 1, 0.6470588, 1,
-0.1075071, 1.223823, -1.599235, 0, 1, 0.6509804, 1,
-0.1070331, -2.048295, -2.406909, 0, 1, 0.6588235, 1,
-0.103253, -0.89113, -2.326525, 0, 1, 0.6627451, 1,
-0.09612428, -0.3814561, -3.114113, 0, 1, 0.6705883, 1,
-0.09185067, -0.5370356, -1.816381, 0, 1, 0.6745098, 1,
-0.08929707, 1.535967, 0.8860731, 0, 1, 0.682353, 1,
-0.08822248, -0.09104393, -1.681707, 0, 1, 0.6862745, 1,
-0.08801517, -1.381534, -4.18041, 0, 1, 0.6941177, 1,
-0.08580007, 0.9384103, -0.7079604, 0, 1, 0.7019608, 1,
-0.08182438, -0.05998843, -2.523421, 0, 1, 0.7058824, 1,
-0.081153, 0.03111761, -1.394357, 0, 1, 0.7137255, 1,
-0.08102374, -1.219088, -3.024124, 0, 1, 0.7176471, 1,
-0.0808507, -0.4759201, -2.114914, 0, 1, 0.7254902, 1,
-0.08041258, 0.607366, -0.06344156, 0, 1, 0.7294118, 1,
-0.07484774, 0.06665192, 0.1296165, 0, 1, 0.7372549, 1,
-0.07314021, -0.4643263, -0.09983098, 0, 1, 0.7411765, 1,
-0.07168192, 0.6148029, 0.2784187, 0, 1, 0.7490196, 1,
-0.07044695, -1.161245, -1.358477, 0, 1, 0.7529412, 1,
-0.06762104, 0.01179328, -0.5183539, 0, 1, 0.7607843, 1,
-0.06635822, 0.7798716, -0.6077068, 0, 1, 0.7647059, 1,
-0.0660648, 0.779363, -1.519378, 0, 1, 0.772549, 1,
-0.06449355, -0.931853, -3.938424, 0, 1, 0.7764706, 1,
-0.06437726, -1.642408, -4.619571, 0, 1, 0.7843137, 1,
-0.05898418, -0.2098089, -3.951758, 0, 1, 0.7882353, 1,
-0.04371782, -0.2634144, -2.376221, 0, 1, 0.7960784, 1,
-0.04285412, 0.9647667, -0.2257173, 0, 1, 0.8039216, 1,
-0.04283432, -0.5236801, -4.470591, 0, 1, 0.8078431, 1,
-0.04167395, 0.5228268, 0.272586, 0, 1, 0.8156863, 1,
-0.03735818, -1.14041, -1.631336, 0, 1, 0.8196079, 1,
-0.0365965, -0.1816406, -3.280241, 0, 1, 0.827451, 1,
-0.03381189, 0.2572315, 0.0533314, 0, 1, 0.8313726, 1,
-0.03250508, 1.366388, 1.295653, 0, 1, 0.8392157, 1,
-0.0322686, 0.2560383, 0.00452505, 0, 1, 0.8431373, 1,
-0.03192919, 0.05526951, -0.3140465, 0, 1, 0.8509804, 1,
-0.03013635, -0.3360969, -3.843568, 0, 1, 0.854902, 1,
-0.02908292, 1.294903, -0.3491603, 0, 1, 0.8627451, 1,
-0.02791038, -0.5924382, -2.490413, 0, 1, 0.8666667, 1,
-0.02098758, -0.1847175, -1.997089, 0, 1, 0.8745098, 1,
-0.02080126, -0.7313415, -3.091941, 0, 1, 0.8784314, 1,
-0.02062711, -0.9114199, -3.057106, 0, 1, 0.8862745, 1,
-0.01441392, -0.2100913, -3.267244, 0, 1, 0.8901961, 1,
-0.01377934, -0.4764614, -3.277716, 0, 1, 0.8980392, 1,
-0.01241103, -0.2672208, -2.309933, 0, 1, 0.9058824, 1,
-0.0122525, -0.6504883, -2.332051, 0, 1, 0.9098039, 1,
-0.01106754, 0.1859912, -1.385638, 0, 1, 0.9176471, 1,
-0.009286757, -0.3323105, -2.431041, 0, 1, 0.9215686, 1,
-0.003114161, -1.89791, -2.094894, 0, 1, 0.9294118, 1,
-0.001309972, 0.5838007, -0.09382143, 0, 1, 0.9333333, 1,
-0.00123782, 0.2890212, 2.112267, 0, 1, 0.9411765, 1,
-0.0006528072, 0.8319082, 0.1119946, 0, 1, 0.945098, 1,
0.001523582, 0.6567823, 0.8018137, 0, 1, 0.9529412, 1,
0.006376984, 0.7099125, 0.9946662, 0, 1, 0.9568627, 1,
0.006497248, -0.631579, 2.459777, 0, 1, 0.9647059, 1,
0.006666252, 0.1945373, -0.5028147, 0, 1, 0.9686275, 1,
0.007526213, -1.285934, 2.616837, 0, 1, 0.9764706, 1,
0.008497324, 0.0003869928, 1.585212, 0, 1, 0.9803922, 1,
0.01241749, -0.1719927, 2.782726, 0, 1, 0.9882353, 1,
0.01268631, -0.09353281, 4.183116, 0, 1, 0.9921569, 1,
0.01676806, -0.3591015, 4.416713, 0, 1, 1, 1,
0.01739725, -1.644927, 1.55289, 0, 0.9921569, 1, 1,
0.01816073, -0.001749558, 3.965968, 0, 0.9882353, 1, 1,
0.01981871, 0.1981424, 0.2426426, 0, 0.9803922, 1, 1,
0.02011539, -0.2277851, 4.078222, 0, 0.9764706, 1, 1,
0.0210649, -1.417456, 2.330472, 0, 0.9686275, 1, 1,
0.02888009, -0.805147, 2.514068, 0, 0.9647059, 1, 1,
0.02949916, 1.246631, -0.7881997, 0, 0.9568627, 1, 1,
0.0326507, 2.104252, -0.07863018, 0, 0.9529412, 1, 1,
0.03343679, -0.2930416, 4.073586, 0, 0.945098, 1, 1,
0.03462232, -0.9492773, 2.391432, 0, 0.9411765, 1, 1,
0.03792018, -0.2997196, 3.949885, 0, 0.9333333, 1, 1,
0.03926165, 0.432873, 0.6834767, 0, 0.9294118, 1, 1,
0.03941578, 1.845243, -2.440336, 0, 0.9215686, 1, 1,
0.04086556, -2.131844, 5.127675, 0, 0.9176471, 1, 1,
0.04094915, -1.348632, 3.970555, 0, 0.9098039, 1, 1,
0.04385047, -0.05217248, 4.331338, 0, 0.9058824, 1, 1,
0.04589574, 0.7374451, -0.3240653, 0, 0.8980392, 1, 1,
0.04791668, 1.08198, 1.048264, 0, 0.8901961, 1, 1,
0.05336058, 0.550354, -2.032296, 0, 0.8862745, 1, 1,
0.0582193, 0.1507531, 1.31459, 0, 0.8784314, 1, 1,
0.05917707, 0.8014765, -0.09733758, 0, 0.8745098, 1, 1,
0.06048036, -0.8056076, 0.8686745, 0, 0.8666667, 1, 1,
0.06054083, -0.3479743, 2.70968, 0, 0.8627451, 1, 1,
0.06758483, -0.04935375, 1.666563, 0, 0.854902, 1, 1,
0.06795083, -0.1959104, 3.802753, 0, 0.8509804, 1, 1,
0.07241838, 0.4988464, 1.123657, 0, 0.8431373, 1, 1,
0.07270376, -0.09677474, 1.785257, 0, 0.8392157, 1, 1,
0.07730787, 0.2946152, 0.6160957, 0, 0.8313726, 1, 1,
0.07813298, 3.260648, 2.494101, 0, 0.827451, 1, 1,
0.078981, -0.2493657, 1.115847, 0, 0.8196079, 1, 1,
0.07987374, 1.014797, 1.085847, 0, 0.8156863, 1, 1,
0.08279043, -0.395154, 2.462597, 0, 0.8078431, 1, 1,
0.09512953, -0.1699314, 1.965102, 0, 0.8039216, 1, 1,
0.09871216, -0.07769895, 4.295654, 0, 0.7960784, 1, 1,
0.09919516, 1.637505, 2.125344, 0, 0.7882353, 1, 1,
0.1050799, -0.36522, 2.503167, 0, 0.7843137, 1, 1,
0.1072014, -0.7064837, 3.275167, 0, 0.7764706, 1, 1,
0.1073431, -1.300558, 4.056282, 0, 0.772549, 1, 1,
0.1083255, 1.156723, 0.19204, 0, 0.7647059, 1, 1,
0.1086529, -1.270561, 2.593508, 0, 0.7607843, 1, 1,
0.1106206, -2.028684, 1.487093, 0, 0.7529412, 1, 1,
0.1129767, 0.3034624, 2.337673, 0, 0.7490196, 1, 1,
0.1146907, 0.2189654, 0.7671508, 0, 0.7411765, 1, 1,
0.1149732, 0.3048671, 0.9150041, 0, 0.7372549, 1, 1,
0.1203712, 0.5107206, -1.205448, 0, 0.7294118, 1, 1,
0.123769, -1.079491, 2.517926, 0, 0.7254902, 1, 1,
0.1250479, 1.552107, 0.02560783, 0, 0.7176471, 1, 1,
0.1258056, -0.5879067, 3.354714, 0, 0.7137255, 1, 1,
0.1259658, -1.138999, 3.242157, 0, 0.7058824, 1, 1,
0.1285119, -1.147505, 2.714955, 0, 0.6980392, 1, 1,
0.1369442, 1.456791, -1.080586, 0, 0.6941177, 1, 1,
0.1418006, -0.973315, 4.553751, 0, 0.6862745, 1, 1,
0.1422011, 0.5775607, -1.260966, 0, 0.682353, 1, 1,
0.1426472, 2.736343, 0.09583557, 0, 0.6745098, 1, 1,
0.1427386, -1.722891, 5.522064, 0, 0.6705883, 1, 1,
0.1435274, -0.303757, 2.075382, 0, 0.6627451, 1, 1,
0.1440636, 0.4262764, -0.2378187, 0, 0.6588235, 1, 1,
0.1460816, 0.08426677, 1.13684, 0, 0.6509804, 1, 1,
0.1482911, 2.390281, 0.9374879, 0, 0.6470588, 1, 1,
0.1490839, -1.84564, 3.286823, 0, 0.6392157, 1, 1,
0.1500915, -0.4149694, 2.972989, 0, 0.6352941, 1, 1,
0.1571222, -1.149913, 3.813988, 0, 0.627451, 1, 1,
0.158896, -0.178156, 1.635169, 0, 0.6235294, 1, 1,
0.1635349, 0.8137401, 0.040248, 0, 0.6156863, 1, 1,
0.1683325, 1.47371, -0.2494902, 0, 0.6117647, 1, 1,
0.1701339, 1.095137, -0.1846771, 0, 0.6039216, 1, 1,
0.1743615, 0.6941689, -0.752686, 0, 0.5960785, 1, 1,
0.1752119, -0.5862169, 3.017751, 0, 0.5921569, 1, 1,
0.1767359, -0.4637893, 3.694777, 0, 0.5843138, 1, 1,
0.1774247, 0.3159562, 0.4049124, 0, 0.5803922, 1, 1,
0.1891639, -0.1668399, 2.078848, 0, 0.572549, 1, 1,
0.1893595, 0.3660871, 1.319943, 0, 0.5686275, 1, 1,
0.1931893, 1.186558, -0.7300602, 0, 0.5607843, 1, 1,
0.1962014, 1.725018, -0.2936486, 0, 0.5568628, 1, 1,
0.1971152, -1.447157, 2.395528, 0, 0.5490196, 1, 1,
0.1980061, 0.7283797, 0.1312194, 0, 0.5450981, 1, 1,
0.1986987, 1.619943, 0.01135598, 0, 0.5372549, 1, 1,
0.2034409, -0.9842137, 2.980634, 0, 0.5333334, 1, 1,
0.2065068, 0.4006214, 1.017888, 0, 0.5254902, 1, 1,
0.2106556, -0.001539474, 1.786452, 0, 0.5215687, 1, 1,
0.2125674, 0.3592157, 0.8397058, 0, 0.5137255, 1, 1,
0.2227637, -0.1407071, 2.186571, 0, 0.509804, 1, 1,
0.2248586, -0.4111518, 2.084982, 0, 0.5019608, 1, 1,
0.2248909, -0.08093879, 1.751975, 0, 0.4941176, 1, 1,
0.2262201, 0.7160105, -1.534337, 0, 0.4901961, 1, 1,
0.2313352, -0.1538159, 1.933613, 0, 0.4823529, 1, 1,
0.2365588, -0.4905437, -0.08361502, 0, 0.4784314, 1, 1,
0.240546, -0.7200097, 1.213046, 0, 0.4705882, 1, 1,
0.2445652, 1.196185, 0.2036112, 0, 0.4666667, 1, 1,
0.2448036, -0.878888, 1.003478, 0, 0.4588235, 1, 1,
0.2486709, 1.410551, 0.7223196, 0, 0.454902, 1, 1,
0.2491975, 0.01444111, 0.5823275, 0, 0.4470588, 1, 1,
0.2517174, -1.767365, 2.978233, 0, 0.4431373, 1, 1,
0.2536983, 2.094922, 0.01805231, 0, 0.4352941, 1, 1,
0.2552065, -0.5638373, 2.661497, 0, 0.4313726, 1, 1,
0.2563846, 0.361324, 0.7617571, 0, 0.4235294, 1, 1,
0.2614301, -1.160043, 2.328084, 0, 0.4196078, 1, 1,
0.2632641, -0.165846, 0.7542225, 0, 0.4117647, 1, 1,
0.2659453, 0.3425655, 0.7966226, 0, 0.4078431, 1, 1,
0.2683489, -2.085542, 3.630496, 0, 0.4, 1, 1,
0.2714954, 0.1968142, 1.721139, 0, 0.3921569, 1, 1,
0.2804202, 0.646341, -0.9625846, 0, 0.3882353, 1, 1,
0.2837481, 1.067787, 1.810699, 0, 0.3803922, 1, 1,
0.2854127, 0.4856814, 0.9950005, 0, 0.3764706, 1, 1,
0.2862226, -1.292113, 0.7998164, 0, 0.3686275, 1, 1,
0.288063, 0.5843037, 1.238645, 0, 0.3647059, 1, 1,
0.3023433, 1.305612, 0.6288689, 0, 0.3568628, 1, 1,
0.3050776, 0.6624641, 1.047451, 0, 0.3529412, 1, 1,
0.3064703, -1.834, 3.149328, 0, 0.345098, 1, 1,
0.316572, -1.039723, 2.508551, 0, 0.3411765, 1, 1,
0.3168921, 0.4544376, -0.1602478, 0, 0.3333333, 1, 1,
0.3205391, 1.718936, 1.074106, 0, 0.3294118, 1, 1,
0.3217063, -1.14432, 4.914824, 0, 0.3215686, 1, 1,
0.3221612, -0.4409173, 1.22811, 0, 0.3176471, 1, 1,
0.3227285, -0.5854086, 3.486131, 0, 0.3098039, 1, 1,
0.3258188, 0.9107552, 0.7514987, 0, 0.3058824, 1, 1,
0.3271412, -1.224011, 2.636109, 0, 0.2980392, 1, 1,
0.3327624, 0.414353, -1.771305, 0, 0.2901961, 1, 1,
0.3365967, 0.2152758, 2.730391, 0, 0.2862745, 1, 1,
0.3417622, -0.05526337, 2.025845, 0, 0.2784314, 1, 1,
0.3429639, -1.134803, 2.10944, 0, 0.2745098, 1, 1,
0.3485694, 0.4764056, 0.8685678, 0, 0.2666667, 1, 1,
0.3543148, -1.125685, 0.902393, 0, 0.2627451, 1, 1,
0.3621753, 2.182729, 1.94211, 0, 0.254902, 1, 1,
0.365648, -0.2846651, 2.078317, 0, 0.2509804, 1, 1,
0.3668885, -1.25502, 3.592354, 0, 0.2431373, 1, 1,
0.3679462, -0.3688869, 2.262077, 0, 0.2392157, 1, 1,
0.3695923, 0.1155782, 0.6500235, 0, 0.2313726, 1, 1,
0.3714636, -0.1511806, 2.037705, 0, 0.227451, 1, 1,
0.375706, -0.3664361, 0.751675, 0, 0.2196078, 1, 1,
0.375918, -0.1062415, 2.552329, 0, 0.2156863, 1, 1,
0.3764942, 1.428993, -0.5077442, 0, 0.2078431, 1, 1,
0.376813, 0.2750156, -0.3359786, 0, 0.2039216, 1, 1,
0.3779118, 0.8055504, 0.009406781, 0, 0.1960784, 1, 1,
0.3819347, -1.804144, 3.5463, 0, 0.1882353, 1, 1,
0.3820343, -0.4935555, 2.334811, 0, 0.1843137, 1, 1,
0.3830056, 0.3684114, 0.905664, 0, 0.1764706, 1, 1,
0.3851967, 0.7854152, 0.2970867, 0, 0.172549, 1, 1,
0.3854698, 1.018336, -0.1627796, 0, 0.1647059, 1, 1,
0.3860542, -0.09686334, 2.360571, 0, 0.1607843, 1, 1,
0.3883958, 0.2803364, 2.049656, 0, 0.1529412, 1, 1,
0.3903231, 0.2696251, 0.2300054, 0, 0.1490196, 1, 1,
0.3924437, 1.219152, 1.186311, 0, 0.1411765, 1, 1,
0.3985038, -0.6494433, 1.996158, 0, 0.1372549, 1, 1,
0.4094141, 0.09777246, 1.690904, 0, 0.1294118, 1, 1,
0.4097813, -0.9655398, 2.55928, 0, 0.1254902, 1, 1,
0.41551, -0.3405673, 3.708045, 0, 0.1176471, 1, 1,
0.4184205, 0.1104729, 1.803441, 0, 0.1137255, 1, 1,
0.4263928, -0.2562588, 3.906152, 0, 0.1058824, 1, 1,
0.4283552, 2.170562, 1.101318, 0, 0.09803922, 1, 1,
0.42946, -1.847165, 2.726681, 0, 0.09411765, 1, 1,
0.4316098, -0.1504591, 0.9673533, 0, 0.08627451, 1, 1,
0.4342356, -1.624233, 1.619391, 0, 0.08235294, 1, 1,
0.4373797, -0.8363909, 2.167716, 0, 0.07450981, 1, 1,
0.4401532, 1.054989, 0.01883861, 0, 0.07058824, 1, 1,
0.4497578, -0.6354544, 1.963958, 0, 0.0627451, 1, 1,
0.4554615, -0.1276505, 2.233009, 0, 0.05882353, 1, 1,
0.4557689, 1.840551, 1.758883, 0, 0.05098039, 1, 1,
0.4563098, -1.039706, 2.34407, 0, 0.04705882, 1, 1,
0.4605487, -0.2007722, 2.370704, 0, 0.03921569, 1, 1,
0.4633687, 0.4985378, 1.555261, 0, 0.03529412, 1, 1,
0.4654521, 0.5973011, 1.837448, 0, 0.02745098, 1, 1,
0.46657, 0.2317321, 0.4140887, 0, 0.02352941, 1, 1,
0.468276, 0.1277721, 0.8603603, 0, 0.01568628, 1, 1,
0.4726627, -0.8811235, 2.640207, 0, 0.01176471, 1, 1,
0.4786482, 0.2969564, 1.7942, 0, 0.003921569, 1, 1,
0.4810012, 1.343455, 2.200532, 0.003921569, 0, 1, 1,
0.4843697, 1.445881, 0.06497022, 0.007843138, 0, 1, 1,
0.4866892, -1.752064, 5.483691, 0.01568628, 0, 1, 1,
0.4877754, -0.9760503, 3.355228, 0.01960784, 0, 1, 1,
0.4896134, 0.7012599, -0.281768, 0.02745098, 0, 1, 1,
0.4911752, -1.730761, 2.130619, 0.03137255, 0, 1, 1,
0.4916614, 0.4715159, 1.045507, 0.03921569, 0, 1, 1,
0.4975208, -1.188338, 2.772937, 0.04313726, 0, 1, 1,
0.4992642, -0.5064785, 1.482308, 0.05098039, 0, 1, 1,
0.4995698, -0.06586584, 2.279314, 0.05490196, 0, 1, 1,
0.5048317, 0.3533224, -0.9211006, 0.0627451, 0, 1, 1,
0.5048672, 3.072947, -0.5858055, 0.06666667, 0, 1, 1,
0.5154374, 0.8023378, 1.961216, 0.07450981, 0, 1, 1,
0.5167415, 1.4404, 2.057456, 0.07843138, 0, 1, 1,
0.5174473, -0.09393059, -0.4746419, 0.08627451, 0, 1, 1,
0.522555, -0.008344318, 0.4833384, 0.09019608, 0, 1, 1,
0.5251322, -1.16296, 2.687738, 0.09803922, 0, 1, 1,
0.525717, 1.14581, 1.109329, 0.1058824, 0, 1, 1,
0.5262398, 0.23902, 0.9270341, 0.1098039, 0, 1, 1,
0.5275007, 1.456455, -0.5446634, 0.1176471, 0, 1, 1,
0.5302312, -0.3241825, 2.253904, 0.1215686, 0, 1, 1,
0.5330032, 0.4332881, -0.07382847, 0.1294118, 0, 1, 1,
0.5363285, 1.65302, -0.1133326, 0.1333333, 0, 1, 1,
0.5392187, 1.158169, 0.6323858, 0.1411765, 0, 1, 1,
0.5406961, -0.9863778, 1.851747, 0.145098, 0, 1, 1,
0.5420948, 0.2555436, 0.8387749, 0.1529412, 0, 1, 1,
0.5423895, -1.078608, 2.49425, 0.1568628, 0, 1, 1,
0.5465118, -0.1606875, 0.963338, 0.1647059, 0, 1, 1,
0.5469961, 0.01975117, 0.3979164, 0.1686275, 0, 1, 1,
0.5486992, -0.7483524, 4.058884, 0.1764706, 0, 1, 1,
0.5491434, 0.8327063, 2.193588, 0.1803922, 0, 1, 1,
0.5499434, -0.9942225, 4.347395, 0.1882353, 0, 1, 1,
0.5515442, -1.254787, 1.098325, 0.1921569, 0, 1, 1,
0.5540108, 0.8534791, -0.02716037, 0.2, 0, 1, 1,
0.5552112, 0.0514658, 1.874426, 0.2078431, 0, 1, 1,
0.560035, -0.4565559, 1.802797, 0.2117647, 0, 1, 1,
0.5602789, -0.2038008, 1.589419, 0.2196078, 0, 1, 1,
0.562085, -2.121006, 1.177789, 0.2235294, 0, 1, 1,
0.5627228, -0.9857724, 2.708387, 0.2313726, 0, 1, 1,
0.5630312, 1.076359, 0.3446125, 0.2352941, 0, 1, 1,
0.5644025, -0.3055255, 3.386128, 0.2431373, 0, 1, 1,
0.5692323, 0.7104046, 1.812636, 0.2470588, 0, 1, 1,
0.5694283, 1.7162, -1.887976, 0.254902, 0, 1, 1,
0.5738231, 0.3253187, 2.627003, 0.2588235, 0, 1, 1,
0.583102, -0.4061456, 3.554418, 0.2666667, 0, 1, 1,
0.5880747, 1.511642, 0.1986747, 0.2705882, 0, 1, 1,
0.5890847, -0.5566582, 2.296949, 0.2784314, 0, 1, 1,
0.5930355, 0.1436229, 0.5964227, 0.282353, 0, 1, 1,
0.5936364, 0.2950489, 1.356509, 0.2901961, 0, 1, 1,
0.5943501, -0.5102555, 2.595671, 0.2941177, 0, 1, 1,
0.5951278, 0.9104656, 1.140145, 0.3019608, 0, 1, 1,
0.5951652, 0.1996738, 1.120553, 0.3098039, 0, 1, 1,
0.5954871, 0.8123523, 1.654423, 0.3137255, 0, 1, 1,
0.5960893, 1.058092, 0.1432242, 0.3215686, 0, 1, 1,
0.5967915, 0.2786395, 2.2732, 0.3254902, 0, 1, 1,
0.6008733, 0.785264, -0.004055417, 0.3333333, 0, 1, 1,
0.6035207, -1.924374, 2.356531, 0.3372549, 0, 1, 1,
0.6069478, 0.2385327, 0.06243643, 0.345098, 0, 1, 1,
0.6098481, 0.1160583, 2.161084, 0.3490196, 0, 1, 1,
0.6174808, 0.2229067, 1.510333, 0.3568628, 0, 1, 1,
0.618744, -0.2409416, 1.389775, 0.3607843, 0, 1, 1,
0.6231577, 0.4359803, 0.3551671, 0.3686275, 0, 1, 1,
0.6263537, -0.03507554, 1.280208, 0.372549, 0, 1, 1,
0.6282273, -1.053518, 3.534587, 0.3803922, 0, 1, 1,
0.6291751, 0.544469, 2.303024, 0.3843137, 0, 1, 1,
0.6297114, 0.3684166, -0.06773698, 0.3921569, 0, 1, 1,
0.6316692, 0.04260439, 2.284254, 0.3960784, 0, 1, 1,
0.6323996, 0.6660526, 0.2407589, 0.4039216, 0, 1, 1,
0.6361752, -0.7756239, 2.324733, 0.4117647, 0, 1, 1,
0.6393276, -0.9789898, 0.7382691, 0.4156863, 0, 1, 1,
0.6400287, -1.517336, 3.525895, 0.4235294, 0, 1, 1,
0.6415633, -0.04245342, 0.1537647, 0.427451, 0, 1, 1,
0.6560802, 0.2167363, -0.496565, 0.4352941, 0, 1, 1,
0.6587628, 2.59656, 0.690758, 0.4392157, 0, 1, 1,
0.6589152, -1.082959, 0.8934329, 0.4470588, 0, 1, 1,
0.6594974, -0.1502501, 3.898864, 0.4509804, 0, 1, 1,
0.6638192, 1.59237, -1.008592, 0.4588235, 0, 1, 1,
0.6683618, 0.05229333, 2.285647, 0.4627451, 0, 1, 1,
0.6712959, -0.597024, 4.266295, 0.4705882, 0, 1, 1,
0.6728563, 0.0230697, 2.468807, 0.4745098, 0, 1, 1,
0.6741407, -0.2686737, 1.78299, 0.4823529, 0, 1, 1,
0.6797171, -1.135374, 1.989146, 0.4862745, 0, 1, 1,
0.6806113, 0.2930848, 0.03517891, 0.4941176, 0, 1, 1,
0.6835826, -0.4419279, 1.361286, 0.5019608, 0, 1, 1,
0.6898048, -0.1793819, 1.072701, 0.5058824, 0, 1, 1,
0.7052267, -0.2617016, 1.460966, 0.5137255, 0, 1, 1,
0.7058969, -0.9694933, 1.578398, 0.5176471, 0, 1, 1,
0.7068747, 1.05244, 0.582817, 0.5254902, 0, 1, 1,
0.7159693, -1.177553, 2.662825, 0.5294118, 0, 1, 1,
0.7164668, -0.02300317, 1.342197, 0.5372549, 0, 1, 1,
0.7180052, -1.234788, 1.67031, 0.5411765, 0, 1, 1,
0.7196571, -0.7835765, 1.973351, 0.5490196, 0, 1, 1,
0.7209337, -1.238284, 1.324802, 0.5529412, 0, 1, 1,
0.7210171, -0.7924199, 2.527403, 0.5607843, 0, 1, 1,
0.7238733, 1.29086, 0.3154512, 0.5647059, 0, 1, 1,
0.7265931, 0.7113733, 3.226086, 0.572549, 0, 1, 1,
0.730253, -1.552518, 3.196266, 0.5764706, 0, 1, 1,
0.7421142, 0.310349, 0.636417, 0.5843138, 0, 1, 1,
0.7466609, -0.5768949, 3.515627, 0.5882353, 0, 1, 1,
0.7483211, 0.6256864, 1.356331, 0.5960785, 0, 1, 1,
0.7511082, -0.7100123, 2.268252, 0.6039216, 0, 1, 1,
0.7513478, -1.159085, 3.220178, 0.6078432, 0, 1, 1,
0.7716432, -0.7741919, 0.382991, 0.6156863, 0, 1, 1,
0.7765676, 0.3650862, 1.18407, 0.6196079, 0, 1, 1,
0.7776014, -1.000128, 2.315668, 0.627451, 0, 1, 1,
0.7832695, 0.875314, 0.06975426, 0.6313726, 0, 1, 1,
0.7833444, -0.005215346, 0.8293434, 0.6392157, 0, 1, 1,
0.7849228, 0.3648901, 1.384814, 0.6431373, 0, 1, 1,
0.7883721, -1.595589, 4.273252, 0.6509804, 0, 1, 1,
0.790952, -0.9088507, 2.058996, 0.654902, 0, 1, 1,
0.7939399, -0.2984101, 1.963379, 0.6627451, 0, 1, 1,
0.7985454, 0.5099886, 0.3807407, 0.6666667, 0, 1, 1,
0.8011101, 0.1318402, 1.78666, 0.6745098, 0, 1, 1,
0.8139891, 0.3247113, 1.454658, 0.6784314, 0, 1, 1,
0.8304761, 1.309387, 2.406209, 0.6862745, 0, 1, 1,
0.8310959, -0.6691101, 3.697943, 0.6901961, 0, 1, 1,
0.8330962, -1.151646, 2.751417, 0.6980392, 0, 1, 1,
0.8353027, 0.5997072, 0.03328284, 0.7058824, 0, 1, 1,
0.8431811, 0.0105206, 1.202052, 0.7098039, 0, 1, 1,
0.8492517, 0.7906796, 1.04372, 0.7176471, 0, 1, 1,
0.8507393, -1.594804, 2.753359, 0.7215686, 0, 1, 1,
0.8523303, 0.563888, 2.073989, 0.7294118, 0, 1, 1,
0.8523532, -0.7488808, 1.517485, 0.7333333, 0, 1, 1,
0.8549458, 0.723952, 0.9208112, 0.7411765, 0, 1, 1,
0.8599774, 1.571522, 0.5901949, 0.7450981, 0, 1, 1,
0.8613601, -0.9061771, 0.3525438, 0.7529412, 0, 1, 1,
0.8615702, -0.7637257, 3.285907, 0.7568628, 0, 1, 1,
0.8658103, 0.2649336, -0.6341687, 0.7647059, 0, 1, 1,
0.8696991, -1.6734, 2.086506, 0.7686275, 0, 1, 1,
0.8703359, 0.3371056, 0.9096929, 0.7764706, 0, 1, 1,
0.8764874, -0.8987175, 1.606508, 0.7803922, 0, 1, 1,
0.8781856, 0.7354178, -1.215908, 0.7882353, 0, 1, 1,
0.8796374, 1.903052, 1.162759, 0.7921569, 0, 1, 1,
0.8828881, -1.763188, 2.985775, 0.8, 0, 1, 1,
0.8884205, -1.236731, 1.933015, 0.8078431, 0, 1, 1,
0.896117, -0.101311, 0.9160572, 0.8117647, 0, 1, 1,
0.8961884, -0.8794426, 3.977763, 0.8196079, 0, 1, 1,
0.9022084, -0.2286504, 2.698711, 0.8235294, 0, 1, 1,
0.9036486, 0.187586, 1.231612, 0.8313726, 0, 1, 1,
0.9045025, -0.8739631, 3.247672, 0.8352941, 0, 1, 1,
0.9081075, 0.8736163, 0.6364996, 0.8431373, 0, 1, 1,
0.9114697, 1.100412, 0.7736034, 0.8470588, 0, 1, 1,
0.9119754, 0.1657134, 2.112141, 0.854902, 0, 1, 1,
0.9156967, 0.650623, 1.707313, 0.8588235, 0, 1, 1,
0.9176894, 0.3431173, -0.001092348, 0.8666667, 0, 1, 1,
0.9234211, 0.3678901, 1.703943, 0.8705882, 0, 1, 1,
0.9281946, 0.5641897, 1.912066, 0.8784314, 0, 1, 1,
0.9357648, 1.516169, 2.662353, 0.8823529, 0, 1, 1,
0.9371207, 2.501985, 0.3173174, 0.8901961, 0, 1, 1,
0.9430849, 1.802906, 0.2250761, 0.8941177, 0, 1, 1,
0.9440228, 0.9559405, -1.511272, 0.9019608, 0, 1, 1,
0.9520108, 0.1663987, 1.227147, 0.9098039, 0, 1, 1,
0.9521264, 0.2799074, 0.5746779, 0.9137255, 0, 1, 1,
0.9644825, -1.334539, 4.02704, 0.9215686, 0, 1, 1,
0.9667693, 1.176028, 0.2636109, 0.9254902, 0, 1, 1,
0.968563, 0.3853639, 0.7373733, 0.9333333, 0, 1, 1,
0.9699275, 0.009028055, 2.221321, 0.9372549, 0, 1, 1,
0.9729453, -0.2753364, -0.3456626, 0.945098, 0, 1, 1,
0.9738376, 0.7772124, 1.519017, 0.9490196, 0, 1, 1,
0.9777541, -0.7442686, 3.081234, 0.9568627, 0, 1, 1,
0.9785279, -2.065644, 3.017771, 0.9607843, 0, 1, 1,
0.981824, -0.7166501, 2.791319, 0.9686275, 0, 1, 1,
0.9840266, 0.3374732, 3.53602, 0.972549, 0, 1, 1,
0.9850324, 1.747687, 1.289583, 0.9803922, 0, 1, 1,
0.9903264, -0.6485103, 3.563461, 0.9843137, 0, 1, 1,
0.9918049, -1.143024, 2.360127, 0.9921569, 0, 1, 1,
0.9981549, 0.5597335, 2.514701, 0.9960784, 0, 1, 1,
1.000829, 0.4375417, 0.9204007, 1, 0, 0.9960784, 1,
1.003191, 0.549687, 1.018404, 1, 0, 0.9882353, 1,
1.008581, 2.281375, 0.2136589, 1, 0, 0.9843137, 1,
1.009031, 0.8203291, 2.894998, 1, 0, 0.9764706, 1,
1.011281, -0.9819803, 3.889579, 1, 0, 0.972549, 1,
1.012396, 0.461657, 0.1511634, 1, 0, 0.9647059, 1,
1.014206, 1.068749, -0.8869824, 1, 0, 0.9607843, 1,
1.014951, -0.5532008, 3.173645, 1, 0, 0.9529412, 1,
1.023909, -0.4470006, 0.9601815, 1, 0, 0.9490196, 1,
1.024058, -0.3587895, 1.404154, 1, 0, 0.9411765, 1,
1.024776, 0.3939238, -0.2907126, 1, 0, 0.9372549, 1,
1.02802, -0.1828509, 2.924017, 1, 0, 0.9294118, 1,
1.034228, 0.1911747, 1.416486, 1, 0, 0.9254902, 1,
1.037074, 1.129623, 0.173151, 1, 0, 0.9176471, 1,
1.04093, -1.025597, 1.748598, 1, 0, 0.9137255, 1,
1.046175, -3.140659, 1.877197, 1, 0, 0.9058824, 1,
1.048743, -0.4001163, 1.938509, 1, 0, 0.9019608, 1,
1.058051, 1.034136, 0.282961, 1, 0, 0.8941177, 1,
1.061653, 0.8555232, 1.487396, 1, 0, 0.8862745, 1,
1.072246, -1.394612, 1.873574, 1, 0, 0.8823529, 1,
1.082299, 1.265342, 0.5332395, 1, 0, 0.8745098, 1,
1.083353, 0.1874942, 0.9476357, 1, 0, 0.8705882, 1,
1.085355, 0.4304754, 0.1099542, 1, 0, 0.8627451, 1,
1.093242, -0.2130776, 2.610902, 1, 0, 0.8588235, 1,
1.097342, 0.1319956, 0.6162011, 1, 0, 0.8509804, 1,
1.103979, -0.5686018, 4.034405, 1, 0, 0.8470588, 1,
1.110647, -0.7582502, 3.152974, 1, 0, 0.8392157, 1,
1.112516, 2.0149, 2.305273, 1, 0, 0.8352941, 1,
1.123842, -0.8679484, 2.933585, 1, 0, 0.827451, 1,
1.124119, 0.900894, 0.1528048, 1, 0, 0.8235294, 1,
1.129663, -0.1259984, -0.5724561, 1, 0, 0.8156863, 1,
1.135883, 0.3215467, 0.5532795, 1, 0, 0.8117647, 1,
1.14251, 1.15215, 1.041023, 1, 0, 0.8039216, 1,
1.169735, 1.804907, 1.019855, 1, 0, 0.7960784, 1,
1.17046, -2.80207, 0.5702057, 1, 0, 0.7921569, 1,
1.184419, -1.19529, 3.277701, 1, 0, 0.7843137, 1,
1.187751, -0.1194281, 1.895725, 1, 0, 0.7803922, 1,
1.192427, 0.769855, 1.179344, 1, 0, 0.772549, 1,
1.193061, 0.7863129, 0.002251892, 1, 0, 0.7686275, 1,
1.201636, -0.2452639, 2.037536, 1, 0, 0.7607843, 1,
1.205221, -1.217114, 3.821175, 1, 0, 0.7568628, 1,
1.206043, -3.037858, 3.234786, 1, 0, 0.7490196, 1,
1.207632, -0.5811754, 0.7207178, 1, 0, 0.7450981, 1,
1.211983, -1.488921, 3.597004, 1, 0, 0.7372549, 1,
1.212003, 0.1019548, 3.09723, 1, 0, 0.7333333, 1,
1.213579, 0.5463261, 0.7783751, 1, 0, 0.7254902, 1,
1.220379, -0.3553747, 3.059163, 1, 0, 0.7215686, 1,
1.220646, 0.4184476, 1.344452, 1, 0, 0.7137255, 1,
1.220738, 0.4823188, -1.194188, 1, 0, 0.7098039, 1,
1.226497, -0.7838147, 3.204268, 1, 0, 0.7019608, 1,
1.233665, -1.414721, 2.886429, 1, 0, 0.6941177, 1,
1.255154, -0.7648194, 1.268193, 1, 0, 0.6901961, 1,
1.267778, -0.01205978, 2.077652, 1, 0, 0.682353, 1,
1.268375, 0.1585299, 1.455992, 1, 0, 0.6784314, 1,
1.268779, 2.993428, -0.5546259, 1, 0, 0.6705883, 1,
1.289646, -0.5645808, 3.041453, 1, 0, 0.6666667, 1,
1.292359, -0.1253507, 1.662669, 1, 0, 0.6588235, 1,
1.292448, -1.213792, 1.963763, 1, 0, 0.654902, 1,
1.294962, 1.549972, 1.35711, 1, 0, 0.6470588, 1,
1.304368, -0.02997971, 2.290656, 1, 0, 0.6431373, 1,
1.304967, 0.6087891, 1.146408, 1, 0, 0.6352941, 1,
1.307351, -0.5298277, 0.2445951, 1, 0, 0.6313726, 1,
1.311813, -0.08451984, 2.443412, 1, 0, 0.6235294, 1,
1.335155, -0.6770531, 1.597109, 1, 0, 0.6196079, 1,
1.339872, 0.4887067, 1.512002, 1, 0, 0.6117647, 1,
1.34521, -0.5034141, 3.694771, 1, 0, 0.6078432, 1,
1.346839, 1.104326, 3.076242, 1, 0, 0.6, 1,
1.351403, 0.05029143, 0.7680029, 1, 0, 0.5921569, 1,
1.354271, 0.4647881, 0.2624789, 1, 0, 0.5882353, 1,
1.377104, 0.5385656, 0.5232133, 1, 0, 0.5803922, 1,
1.384926, 1.874863, -1.062645, 1, 0, 0.5764706, 1,
1.397292, 0.1393391, 2.464818, 1, 0, 0.5686275, 1,
1.398022, -1.010821, 2.680773, 1, 0, 0.5647059, 1,
1.399573, 1.091094, 2.555243, 1, 0, 0.5568628, 1,
1.403558, -1.236871, 1.472443, 1, 0, 0.5529412, 1,
1.409982, 1.420403, 0.1382633, 1, 0, 0.5450981, 1,
1.415849, 0.5938749, 1.975286, 1, 0, 0.5411765, 1,
1.429229, -0.268607, 1.49175, 1, 0, 0.5333334, 1,
1.440002, 0.1356379, 0.09072539, 1, 0, 0.5294118, 1,
1.443053, 0.1594244, 1.490038, 1, 0, 0.5215687, 1,
1.455291, 0.9473436, 0.6296358, 1, 0, 0.5176471, 1,
1.466575, 0.6605864, 1.835569, 1, 0, 0.509804, 1,
1.473219, 1.058663, 0.4029366, 1, 0, 0.5058824, 1,
1.476853, 0.9046353, -0.6022633, 1, 0, 0.4980392, 1,
1.486526, -0.7649408, 2.75038, 1, 0, 0.4901961, 1,
1.500961, 2.886731, 1.212324, 1, 0, 0.4862745, 1,
1.508987, 1.04047, 2.944385, 1, 0, 0.4784314, 1,
1.511695, 1.219398, 0.8026025, 1, 0, 0.4745098, 1,
1.521227, 0.2861884, 1.588516, 1, 0, 0.4666667, 1,
1.533018, 1.725875, 1.921467, 1, 0, 0.4627451, 1,
1.540768, -0.8207951, 2.817985, 1, 0, 0.454902, 1,
1.544069, -0.2313961, 0.2069943, 1, 0, 0.4509804, 1,
1.560071, 3.034976, 0.3728724, 1, 0, 0.4431373, 1,
1.563468, -1.66948, 2.241355, 1, 0, 0.4392157, 1,
1.565303, 0.8559025, -0.05183535, 1, 0, 0.4313726, 1,
1.574673, -1.021349, 2.358761, 1, 0, 0.427451, 1,
1.577627, -0.08641961, 2.295942, 1, 0, 0.4196078, 1,
1.596593, 0.4525388, 1.469144, 1, 0, 0.4156863, 1,
1.608033, 1.479792, 3.037992, 1, 0, 0.4078431, 1,
1.617162, -0.5405109, 1.235972, 1, 0, 0.4039216, 1,
1.630102, -0.1325057, 1.478315, 1, 0, 0.3960784, 1,
1.635431, 0.2356906, 2.27827, 1, 0, 0.3882353, 1,
1.639674, 1.324914, -0.1550997, 1, 0, 0.3843137, 1,
1.641754, 0.860239, 1.198665, 1, 0, 0.3764706, 1,
1.653571, -0.9543773, 1.175711, 1, 0, 0.372549, 1,
1.659782, -1.272322, 0.4274291, 1, 0, 0.3647059, 1,
1.66353, -1.179821, 2.968503, 1, 0, 0.3607843, 1,
1.673788, 0.8270258, -0.06594726, 1, 0, 0.3529412, 1,
1.674531, -0.7189549, -0.2689723, 1, 0, 0.3490196, 1,
1.683702, 0.3685115, 2.364459, 1, 0, 0.3411765, 1,
1.684811, -0.238732, -0.2416427, 1, 0, 0.3372549, 1,
1.685159, -0.2272091, 2.979513, 1, 0, 0.3294118, 1,
1.691149, -0.6303492, 0.1128881, 1, 0, 0.3254902, 1,
1.691262, 0.1006387, 0.7732068, 1, 0, 0.3176471, 1,
1.698855, -0.2450195, 2.882357, 1, 0, 0.3137255, 1,
1.698972, 0.4796701, 2.259663, 1, 0, 0.3058824, 1,
1.701413, 1.622125, 2.140101, 1, 0, 0.2980392, 1,
1.70142, -0.5944881, 3.811735, 1, 0, 0.2941177, 1,
1.721056, 0.2291695, 4.388785, 1, 0, 0.2862745, 1,
1.738344, -0.3305323, 0.6463573, 1, 0, 0.282353, 1,
1.748669, -1.420243, 3.411155, 1, 0, 0.2745098, 1,
1.784464, 0.7509891, 1.056401, 1, 0, 0.2705882, 1,
1.788202, 1.138252, 0.6798353, 1, 0, 0.2627451, 1,
1.795227, -0.5235627, 0.942879, 1, 0, 0.2588235, 1,
1.800084, 0.3626601, 1.159241, 1, 0, 0.2509804, 1,
1.802057, 1.044231, 0.4984396, 1, 0, 0.2470588, 1,
1.803638, -0.8963181, 1.939265, 1, 0, 0.2392157, 1,
1.823861, 0.7666646, 1.65838, 1, 0, 0.2352941, 1,
1.825724, 1.651963, 2.439627, 1, 0, 0.227451, 1,
1.86463, -0.2212874, 2.022822, 1, 0, 0.2235294, 1,
1.875953, 2.462061, -0.2994689, 1, 0, 0.2156863, 1,
1.881533, -0.1829384, 0.321053, 1, 0, 0.2117647, 1,
1.897254, -0.2349173, 0.3478111, 1, 0, 0.2039216, 1,
1.916009, 0.7386098, 0.4742675, 1, 0, 0.1960784, 1,
1.953271, -0.5351607, 3.379595, 1, 0, 0.1921569, 1,
1.979595, 0.5617015, 1.218741, 1, 0, 0.1843137, 1,
1.998397, 0.2374171, 3.410368, 1, 0, 0.1803922, 1,
2.003948, -0.7293662, 2.493254, 1, 0, 0.172549, 1,
2.00472, -0.2791471, 0.7134061, 1, 0, 0.1686275, 1,
2.018979, 1.563851, 1.892524, 1, 0, 0.1607843, 1,
2.054706, -1.191185, 1.94742, 1, 0, 0.1568628, 1,
2.060811, 0.9962415, 1.281547, 1, 0, 0.1490196, 1,
2.062379, -1.418996, 1.857332, 1, 0, 0.145098, 1,
2.070912, -0.71531, 2.733677, 1, 0, 0.1372549, 1,
2.096289, 1.137084, 2.353741, 1, 0, 0.1333333, 1,
2.10307, -0.8883529, 1.957797, 1, 0, 0.1254902, 1,
2.130457, -0.6539553, 0.9917262, 1, 0, 0.1215686, 1,
2.14243, -0.3370102, 0.8309204, 1, 0, 0.1137255, 1,
2.163733, 0.4292459, 2.926929, 1, 0, 0.1098039, 1,
2.170611, -0.3524774, 2.932265, 1, 0, 0.1019608, 1,
2.178472, -0.8648503, 2.160995, 1, 0, 0.09411765, 1,
2.195415, 0.6175734, 0.2432739, 1, 0, 0.09019608, 1,
2.206292, -0.2699892, 2.619788, 1, 0, 0.08235294, 1,
2.210343, -0.7544885, 2.097437, 1, 0, 0.07843138, 1,
2.313275, -0.7768062, 0.7823262, 1, 0, 0.07058824, 1,
2.33516, -1.29911, 1.740659, 1, 0, 0.06666667, 1,
2.360434, 0.5481576, 2.127826, 1, 0, 0.05882353, 1,
2.382338, -0.4269604, 0.15068, 1, 0, 0.05490196, 1,
2.402316, 0.6735575, 0.7711812, 1, 0, 0.04705882, 1,
2.435333, -1.780446, 0.8137722, 1, 0, 0.04313726, 1,
2.452746, -0.3560324, 3.301473, 1, 0, 0.03529412, 1,
2.512294, 0.4604367, 1.01831, 1, 0, 0.03137255, 1,
2.622944, -1.427208, 0.7329049, 1, 0, 0.02352941, 1,
2.746361, 0.5118237, 1.772894, 1, 0, 0.01960784, 1,
2.828982, -1.275716, 0.6986321, 1, 0, 0.01176471, 1,
3.228745, 1.034681, 1.377093, 1, 0, 0.007843138, 1
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
-0.069754, -4.225681, -7.719567, 0, -0.5, 0.5, 0.5,
-0.069754, -4.225681, -7.719567, 1, -0.5, 0.5, 0.5,
-0.069754, -4.225681, -7.719567, 1, 1.5, 0.5, 0.5,
-0.069754, -4.225681, -7.719567, 0, 1.5, 0.5, 0.5
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
-4.486445, 0.05999458, -7.719567, 0, -0.5, 0.5, 0.5,
-4.486445, 0.05999458, -7.719567, 1, -0.5, 0.5, 0.5,
-4.486445, 0.05999458, -7.719567, 1, 1.5, 0.5, 0.5,
-4.486445, 0.05999458, -7.719567, 0, 1.5, 0.5, 0.5
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
-4.486445, -4.225681, -0.1391721, 0, -0.5, 0.5, 0.5,
-4.486445, -4.225681, -0.1391721, 1, -0.5, 0.5, 0.5,
-4.486445, -4.225681, -0.1391721, 1, 1.5, 0.5, 0.5,
-4.486445, -4.225681, -0.1391721, 0, 1.5, 0.5, 0.5
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
-3, -3.236679, -5.970245,
3, -3.236679, -5.970245,
-3, -3.236679, -5.970245,
-3, -3.401513, -6.261798,
-2, -3.236679, -5.970245,
-2, -3.401513, -6.261798,
-1, -3.236679, -5.970245,
-1, -3.401513, -6.261798,
0, -3.236679, -5.970245,
0, -3.401513, -6.261798,
1, -3.236679, -5.970245,
1, -3.401513, -6.261798,
2, -3.236679, -5.970245,
2, -3.401513, -6.261798,
3, -3.236679, -5.970245,
3, -3.401513, -6.261798
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
-3, -3.73118, -6.844906, 0, -0.5, 0.5, 0.5,
-3, -3.73118, -6.844906, 1, -0.5, 0.5, 0.5,
-3, -3.73118, -6.844906, 1, 1.5, 0.5, 0.5,
-3, -3.73118, -6.844906, 0, 1.5, 0.5, 0.5,
-2, -3.73118, -6.844906, 0, -0.5, 0.5, 0.5,
-2, -3.73118, -6.844906, 1, -0.5, 0.5, 0.5,
-2, -3.73118, -6.844906, 1, 1.5, 0.5, 0.5,
-2, -3.73118, -6.844906, 0, 1.5, 0.5, 0.5,
-1, -3.73118, -6.844906, 0, -0.5, 0.5, 0.5,
-1, -3.73118, -6.844906, 1, -0.5, 0.5, 0.5,
-1, -3.73118, -6.844906, 1, 1.5, 0.5, 0.5,
-1, -3.73118, -6.844906, 0, 1.5, 0.5, 0.5,
0, -3.73118, -6.844906, 0, -0.5, 0.5, 0.5,
0, -3.73118, -6.844906, 1, -0.5, 0.5, 0.5,
0, -3.73118, -6.844906, 1, 1.5, 0.5, 0.5,
0, -3.73118, -6.844906, 0, 1.5, 0.5, 0.5,
1, -3.73118, -6.844906, 0, -0.5, 0.5, 0.5,
1, -3.73118, -6.844906, 1, -0.5, 0.5, 0.5,
1, -3.73118, -6.844906, 1, 1.5, 0.5, 0.5,
1, -3.73118, -6.844906, 0, 1.5, 0.5, 0.5,
2, -3.73118, -6.844906, 0, -0.5, 0.5, 0.5,
2, -3.73118, -6.844906, 1, -0.5, 0.5, 0.5,
2, -3.73118, -6.844906, 1, 1.5, 0.5, 0.5,
2, -3.73118, -6.844906, 0, 1.5, 0.5, 0.5,
3, -3.73118, -6.844906, 0, -0.5, 0.5, 0.5,
3, -3.73118, -6.844906, 1, -0.5, 0.5, 0.5,
3, -3.73118, -6.844906, 1, 1.5, 0.5, 0.5,
3, -3.73118, -6.844906, 0, 1.5, 0.5, 0.5
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
-3.467208, -3, -5.970245,
-3.467208, 3, -5.970245,
-3.467208, -3, -5.970245,
-3.637081, -3, -6.261798,
-3.467208, -2, -5.970245,
-3.637081, -2, -6.261798,
-3.467208, -1, -5.970245,
-3.637081, -1, -6.261798,
-3.467208, 0, -5.970245,
-3.637081, 0, -6.261798,
-3.467208, 1, -5.970245,
-3.637081, 1, -6.261798,
-3.467208, 2, -5.970245,
-3.637081, 2, -6.261798,
-3.467208, 3, -5.970245,
-3.637081, 3, -6.261798
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
-3.976827, -3, -6.844906, 0, -0.5, 0.5, 0.5,
-3.976827, -3, -6.844906, 1, -0.5, 0.5, 0.5,
-3.976827, -3, -6.844906, 1, 1.5, 0.5, 0.5,
-3.976827, -3, -6.844906, 0, 1.5, 0.5, 0.5,
-3.976827, -2, -6.844906, 0, -0.5, 0.5, 0.5,
-3.976827, -2, -6.844906, 1, -0.5, 0.5, 0.5,
-3.976827, -2, -6.844906, 1, 1.5, 0.5, 0.5,
-3.976827, -2, -6.844906, 0, 1.5, 0.5, 0.5,
-3.976827, -1, -6.844906, 0, -0.5, 0.5, 0.5,
-3.976827, -1, -6.844906, 1, -0.5, 0.5, 0.5,
-3.976827, -1, -6.844906, 1, 1.5, 0.5, 0.5,
-3.976827, -1, -6.844906, 0, 1.5, 0.5, 0.5,
-3.976827, 0, -6.844906, 0, -0.5, 0.5, 0.5,
-3.976827, 0, -6.844906, 1, -0.5, 0.5, 0.5,
-3.976827, 0, -6.844906, 1, 1.5, 0.5, 0.5,
-3.976827, 0, -6.844906, 0, 1.5, 0.5, 0.5,
-3.976827, 1, -6.844906, 0, -0.5, 0.5, 0.5,
-3.976827, 1, -6.844906, 1, -0.5, 0.5, 0.5,
-3.976827, 1, -6.844906, 1, 1.5, 0.5, 0.5,
-3.976827, 1, -6.844906, 0, 1.5, 0.5, 0.5,
-3.976827, 2, -6.844906, 0, -0.5, 0.5, 0.5,
-3.976827, 2, -6.844906, 1, -0.5, 0.5, 0.5,
-3.976827, 2, -6.844906, 1, 1.5, 0.5, 0.5,
-3.976827, 2, -6.844906, 0, 1.5, 0.5, 0.5,
-3.976827, 3, -6.844906, 0, -0.5, 0.5, 0.5,
-3.976827, 3, -6.844906, 1, -0.5, 0.5, 0.5,
-3.976827, 3, -6.844906, 1, 1.5, 0.5, 0.5,
-3.976827, 3, -6.844906, 0, 1.5, 0.5, 0.5
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
-3.467208, -3.236679, -4,
-3.467208, -3.236679, 4,
-3.467208, -3.236679, -4,
-3.637081, -3.401513, -4,
-3.467208, -3.236679, -2,
-3.637081, -3.401513, -2,
-3.467208, -3.236679, 0,
-3.637081, -3.401513, 0,
-3.467208, -3.236679, 2,
-3.637081, -3.401513, 2,
-3.467208, -3.236679, 4,
-3.637081, -3.401513, 4
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
-3.976827, -3.73118, -4, 0, -0.5, 0.5, 0.5,
-3.976827, -3.73118, -4, 1, -0.5, 0.5, 0.5,
-3.976827, -3.73118, -4, 1, 1.5, 0.5, 0.5,
-3.976827, -3.73118, -4, 0, 1.5, 0.5, 0.5,
-3.976827, -3.73118, -2, 0, -0.5, 0.5, 0.5,
-3.976827, -3.73118, -2, 1, -0.5, 0.5, 0.5,
-3.976827, -3.73118, -2, 1, 1.5, 0.5, 0.5,
-3.976827, -3.73118, -2, 0, 1.5, 0.5, 0.5,
-3.976827, -3.73118, 0, 0, -0.5, 0.5, 0.5,
-3.976827, -3.73118, 0, 1, -0.5, 0.5, 0.5,
-3.976827, -3.73118, 0, 1, 1.5, 0.5, 0.5,
-3.976827, -3.73118, 0, 0, 1.5, 0.5, 0.5,
-3.976827, -3.73118, 2, 0, -0.5, 0.5, 0.5,
-3.976827, -3.73118, 2, 1, -0.5, 0.5, 0.5,
-3.976827, -3.73118, 2, 1, 1.5, 0.5, 0.5,
-3.976827, -3.73118, 2, 0, 1.5, 0.5, 0.5,
-3.976827, -3.73118, 4, 0, -0.5, 0.5, 0.5,
-3.976827, -3.73118, 4, 1, -0.5, 0.5, 0.5,
-3.976827, -3.73118, 4, 1, 1.5, 0.5, 0.5,
-3.976827, -3.73118, 4, 0, 1.5, 0.5, 0.5
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
-3.467208, -3.236679, -5.970245,
-3.467208, 3.356668, -5.970245,
-3.467208, -3.236679, 5.691901,
-3.467208, 3.356668, 5.691901,
-3.467208, -3.236679, -5.970245,
-3.467208, -3.236679, 5.691901,
-3.467208, 3.356668, -5.970245,
-3.467208, 3.356668, 5.691901,
-3.467208, -3.236679, -5.970245,
3.3277, -3.236679, -5.970245,
-3.467208, -3.236679, 5.691901,
3.3277, -3.236679, 5.691901,
-3.467208, 3.356668, -5.970245,
3.3277, 3.356668, -5.970245,
-3.467208, 3.356668, 5.691901,
3.3277, 3.356668, 5.691901,
3.3277, -3.236679, -5.970245,
3.3277, 3.356668, -5.970245,
3.3277, -3.236679, 5.691901,
3.3277, 3.356668, 5.691901,
3.3277, -3.236679, -5.970245,
3.3277, -3.236679, 5.691901,
3.3277, 3.356668, -5.970245,
3.3277, 3.356668, 5.691901
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
var radius = 8.021246;
var distance = 35.68743;
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
mvMatrix.translate( 0.069754, -0.05999458, 0.1391721 );
mvMatrix.scale( 1.276357, 1.315376, 0.7436649 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.68743);
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
butralin<-read.table("butralin.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-butralin$V2
```

```
## Error in eval(expr, envir, enclos): object 'butralin' not found
```

```r
y<-butralin$V3
```

```
## Error in eval(expr, envir, enclos): object 'butralin' not found
```

```r
z<-butralin$V4
```

```
## Error in eval(expr, envir, enclos): object 'butralin' not found
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
-3.368253, 0.9013869, -0.4449663, 0, 0, 1, 1, 1,
-2.998871, 0.6180186, -1.682311, 1, 0, 0, 1, 1,
-2.910625, -0.09619052, -2.051133, 1, 0, 0, 1, 1,
-2.83239, -0.117267, -1.147248, 1, 0, 0, 1, 1,
-2.433608, -0.05516571, -2.178125, 1, 0, 0, 1, 1,
-2.433255, -0.7294388, -0.7786941, 1, 0, 0, 1, 1,
-2.401602, 0.6335888, -1.75433, 0, 0, 0, 1, 1,
-2.393739, 0.290072, -2.016499, 0, 0, 0, 1, 1,
-2.364077, -0.10293, -1.054267, 0, 0, 0, 1, 1,
-2.180682, 0.3904836, -3.80649, 0, 0, 0, 1, 1,
-2.163383, 1.017041, -0.3320558, 0, 0, 0, 1, 1,
-2.125738, 0.8340223, -2.077602, 0, 0, 0, 1, 1,
-2.110666, -0.6998851, -2.053441, 0, 0, 0, 1, 1,
-2.098269, 1.137292, 0.5618404, 1, 1, 1, 1, 1,
-2.080514, -0.6559278, 0.3895262, 1, 1, 1, 1, 1,
-2.052791, -0.7577275, -0.07822349, 1, 1, 1, 1, 1,
-2.033005, -0.473971, -1.680006, 1, 1, 1, 1, 1,
-2.017937, 0.03302414, -1.778482, 1, 1, 1, 1, 1,
-2.015332, 0.2257319, -1.54694, 1, 1, 1, 1, 1,
-2.010116, 0.2323959, -0.4257092, 1, 1, 1, 1, 1,
-2.008851, -0.2866394, -0.8132873, 1, 1, 1, 1, 1,
-2.006416, -0.4185783, -1.732819, 1, 1, 1, 1, 1,
-1.960537, 0.2100927, -1.136827, 1, 1, 1, 1, 1,
-1.957142, 1.159989, -0.7830924, 1, 1, 1, 1, 1,
-1.939889, 0.407169, -0.9495155, 1, 1, 1, 1, 1,
-1.933706, -0.5476004, -0.8884231, 1, 1, 1, 1, 1,
-1.930379, 0.3745768, -1.366899, 1, 1, 1, 1, 1,
-1.90921, 0.8598553, -0.5156178, 1, 1, 1, 1, 1,
-1.897785, 0.5700181, -0.4979381, 0, 0, 1, 1, 1,
-1.883044, -1.095577, -1.808427, 1, 0, 0, 1, 1,
-1.875952, 0.2914913, 0.4943486, 1, 0, 0, 1, 1,
-1.846411, -2.208354, -2.890528, 1, 0, 0, 1, 1,
-1.837859, 0.05483408, -2.184991, 1, 0, 0, 1, 1,
-1.826133, 1.583646, -0.8725586, 1, 0, 0, 1, 1,
-1.816345, -2.199967, -3.234843, 0, 0, 0, 1, 1,
-1.808438, 0.002298271, -1.538219, 0, 0, 0, 1, 1,
-1.802565, 0.2630698, -3.237773, 0, 0, 0, 1, 1,
-1.799467, 1.246825, 0.7585484, 0, 0, 0, 1, 1,
-1.770218, -1.04879, -4.024837, 0, 0, 0, 1, 1,
-1.763297, -0.7132829, -3.035115, 0, 0, 0, 1, 1,
-1.750405, -0.5059704, -3.897976, 0, 0, 0, 1, 1,
-1.740558, -0.3876342, -1.556637, 1, 1, 1, 1, 1,
-1.739394, -0.1804789, -3.278822, 1, 1, 1, 1, 1,
-1.683019, 0.565515, -0.4360524, 1, 1, 1, 1, 1,
-1.662258, -0.3441104, -1.86082, 1, 1, 1, 1, 1,
-1.660859, -0.7511523, -4.382491, 1, 1, 1, 1, 1,
-1.660095, 1.334747, -1.964371, 1, 1, 1, 1, 1,
-1.658428, 0.6143143, -1.220398, 1, 1, 1, 1, 1,
-1.657307, -1.415248, -2.617525, 1, 1, 1, 1, 1,
-1.648413, 1.203807, -0.3503278, 1, 1, 1, 1, 1,
-1.647421, -0.5776067, -3.357808, 1, 1, 1, 1, 1,
-1.642351, -0.2607765, -2.970198, 1, 1, 1, 1, 1,
-1.640208, 0.8617265, -1.407678, 1, 1, 1, 1, 1,
-1.637588, -0.7699364, -2.417426, 1, 1, 1, 1, 1,
-1.63288, 1.065364, -1.315246, 1, 1, 1, 1, 1,
-1.628902, -0.7408372, -1.103305, 1, 1, 1, 1, 1,
-1.608164, 0.9168084, -0.8357074, 0, 0, 1, 1, 1,
-1.600413, -0.04604454, -1.095391, 1, 0, 0, 1, 1,
-1.597624, 0.1710589, -1.580837, 1, 0, 0, 1, 1,
-1.567407, -1.237148, -2.527392, 1, 0, 0, 1, 1,
-1.551109, 0.8464248, -0.3574946, 1, 0, 0, 1, 1,
-1.545545, -1.180624, -2.187636, 1, 0, 0, 1, 1,
-1.538684, -2.147472, -1.604018, 0, 0, 0, 1, 1,
-1.520364, -1.749226, -3.934723, 0, 0, 0, 1, 1,
-1.506548, -0.2806906, -1.143441, 0, 0, 0, 1, 1,
-1.491806, -1.677304, -1.970803, 0, 0, 0, 1, 1,
-1.48844, 0.9201255, 0.8614942, 0, 0, 0, 1, 1,
-1.488245, 0.06260051, -1.309211, 0, 0, 0, 1, 1,
-1.487052, -1.256845, -1.010895, 0, 0, 0, 1, 1,
-1.483764, -1.171951, -0.5449914, 1, 1, 1, 1, 1,
-1.476588, 1.253031, -1.536274, 1, 1, 1, 1, 1,
-1.465467, 1.765764, -2.511064, 1, 1, 1, 1, 1,
-1.463358, 0.9865351, 0.355276, 1, 1, 1, 1, 1,
-1.453402, 0.4076871, -0.5847693, 1, 1, 1, 1, 1,
-1.442671, 0.3531811, -1.431014, 1, 1, 1, 1, 1,
-1.439973, -0.3085601, -3.717511, 1, 1, 1, 1, 1,
-1.439608, 0.3180318, -1.009092, 1, 1, 1, 1, 1,
-1.433264, -1.613845, -2.357818, 1, 1, 1, 1, 1,
-1.416356, 0.2164937, -3.319732, 1, 1, 1, 1, 1,
-1.40602, 0.4075037, -0.680261, 1, 1, 1, 1, 1,
-1.396658, 0.4776231, -1.0274, 1, 1, 1, 1, 1,
-1.389924, -0.557594, 0.1221206, 1, 1, 1, 1, 1,
-1.384233, -0.4231736, -2.6065, 1, 1, 1, 1, 1,
-1.365457, -0.730903, -1.544405, 1, 1, 1, 1, 1,
-1.364992, 0.8204271, -1.82686, 0, 0, 1, 1, 1,
-1.359951, -1.460104, -1.475055, 1, 0, 0, 1, 1,
-1.343662, -0.8533577, -1.92042, 1, 0, 0, 1, 1,
-1.329738, 0.5997726, -1.487165, 1, 0, 0, 1, 1,
-1.328256, -0.4192306, -2.1339, 1, 0, 0, 1, 1,
-1.328002, -0.3620424, -3.375183, 1, 0, 0, 1, 1,
-1.314636, 1.114751, -1.19221, 0, 0, 0, 1, 1,
-1.296466, 1.391261, -0.1777009, 0, 0, 0, 1, 1,
-1.275812, 0.1603478, -1.998983, 0, 0, 0, 1, 1,
-1.266831, -0.6874703, -2.722245, 0, 0, 0, 1, 1,
-1.25269, 0.4233721, 0.07182462, 0, 0, 0, 1, 1,
-1.237086, 0.03390783, -2.218338, 0, 0, 0, 1, 1,
-1.23612, -1.447801, -1.660864, 0, 0, 0, 1, 1,
-1.234496, 1.081511, -0.4259138, 1, 1, 1, 1, 1,
-1.224593, -1.802371, -1.841806, 1, 1, 1, 1, 1,
-1.215644, 0.6951209, -0.5996554, 1, 1, 1, 1, 1,
-1.209628, -0.3902353, -4.495423, 1, 1, 1, 1, 1,
-1.205038, 0.4193983, -0.620452, 1, 1, 1, 1, 1,
-1.204392, 0.5688769, -1.566604, 1, 1, 1, 1, 1,
-1.193973, 0.8262169, -1.139256, 1, 1, 1, 1, 1,
-1.193034, 0.9172007, -0.3967927, 1, 1, 1, 1, 1,
-1.189771, -2.578214, -2.804683, 1, 1, 1, 1, 1,
-1.187066, -0.02491095, -1.764262, 1, 1, 1, 1, 1,
-1.182847, -1.088014, -2.102751, 1, 1, 1, 1, 1,
-1.175422, -2.265501, -1.720288, 1, 1, 1, 1, 1,
-1.173909, 0.7708067, -0.6701891, 1, 1, 1, 1, 1,
-1.159308, 0.06641484, -1.394352, 1, 1, 1, 1, 1,
-1.153358, -0.7418, -2.467139, 1, 1, 1, 1, 1,
-1.145384, 0.5784965, -0.932045, 0, 0, 1, 1, 1,
-1.141848, -0.4445229, -1.355507, 1, 0, 0, 1, 1,
-1.138263, -0.5879165, -2.827714, 1, 0, 0, 1, 1,
-1.137098, -0.3545527, -1.793529, 1, 0, 0, 1, 1,
-1.133828, 0.5359753, -1.176624, 1, 0, 0, 1, 1,
-1.133653, -0.02820258, -2.825096, 1, 0, 0, 1, 1,
-1.123175, 0.05047032, -2.180585, 0, 0, 0, 1, 1,
-1.120356, -1.25494, -3.196603, 0, 0, 0, 1, 1,
-1.118706, 0.6643732, -1.625368, 0, 0, 0, 1, 1,
-1.115734, 1.596954, 0.03219038, 0, 0, 0, 1, 1,
-1.110427, 0.7862416, -2.591387, 0, 0, 0, 1, 1,
-1.106057, -1.544838, -4.063964, 0, 0, 0, 1, 1,
-1.104697, -1.477359, -4.015731, 0, 0, 0, 1, 1,
-1.102984, -1.907285, -3.522684, 1, 1, 1, 1, 1,
-1.102114, -0.4534783, -0.1961955, 1, 1, 1, 1, 1,
-1.099657, 0.4239037, -2.077017, 1, 1, 1, 1, 1,
-1.099122, -0.2848202, -0.880501, 1, 1, 1, 1, 1,
-1.09771, 0.4475331, -1.479449, 1, 1, 1, 1, 1,
-1.079346, -1.065177, 0.6120512, 1, 1, 1, 1, 1,
-1.0786, 1.286052, -0.5684148, 1, 1, 1, 1, 1,
-1.074964, 0.3704624, -1.351215, 1, 1, 1, 1, 1,
-1.07, 2.457185, -0.5531436, 1, 1, 1, 1, 1,
-1.068927, 0.5492609, -2.149215, 1, 1, 1, 1, 1,
-1.055344, -0.3938896, -2.565867, 1, 1, 1, 1, 1,
-1.054164, -0.3162361, -1.533496, 1, 1, 1, 1, 1,
-1.053905, 0.278639, -2.155478, 1, 1, 1, 1, 1,
-1.052532, 1.246629, -0.5172033, 1, 1, 1, 1, 1,
-1.049491, -0.908355, -2.47791, 1, 1, 1, 1, 1,
-1.046913, -0.5881673, -2.985777, 0, 0, 1, 1, 1,
-1.044863, 1.329384, -0.09109129, 1, 0, 0, 1, 1,
-1.043517, 1.160221, -0.3703832, 1, 0, 0, 1, 1,
-1.036606, 0.5139488, -0.1741622, 1, 0, 0, 1, 1,
-1.031065, -0.9893695, -3.675012, 1, 0, 0, 1, 1,
-1.026254, -0.6615573, -1.456979, 1, 0, 0, 1, 1,
-1.019044, 0.9286548, -0.1753633, 0, 0, 0, 1, 1,
-1.017149, -1.045946, -1.878671, 0, 0, 0, 1, 1,
-1.016618, 0.5699563, -1.280728, 0, 0, 0, 1, 1,
-1.015187, 1.060029, -1.3462, 0, 0, 0, 1, 1,
-1.013552, 0.04011991, -1.985573, 0, 0, 0, 1, 1,
-1.006912, -1.055123, -2.273657, 0, 0, 0, 1, 1,
-1.004085, 0.1011861, -1.355828, 0, 0, 0, 1, 1,
-1.001204, -1.429367, -2.213055, 1, 1, 1, 1, 1,
-0.9979855, -0.2321469, -2.504593, 1, 1, 1, 1, 1,
-0.9928955, -0.0494106, -2.042609, 1, 1, 1, 1, 1,
-0.9883049, -0.3753917, -2.637533, 1, 1, 1, 1, 1,
-0.9818714, 0.7945469, -0.03506149, 1, 1, 1, 1, 1,
-0.9722661, -0.3792153, -1.107642, 1, 1, 1, 1, 1,
-0.9683968, 3.199007, -0.5753813, 1, 1, 1, 1, 1,
-0.9618379, 1.052263, -1.790155, 1, 1, 1, 1, 1,
-0.960799, -0.4103247, -1.154632, 1, 1, 1, 1, 1,
-0.9561845, 1.157078, -0.6594176, 1, 1, 1, 1, 1,
-0.9560629, -0.3949734, -4.219764, 1, 1, 1, 1, 1,
-0.9543001, 1.207548, -0.5721374, 1, 1, 1, 1, 1,
-0.946378, -1.269656, -1.547405, 1, 1, 1, 1, 1,
-0.9454845, -1.347037, -3.411414, 1, 1, 1, 1, 1,
-0.9431407, 0.7703606, -0.8378657, 1, 1, 1, 1, 1,
-0.9389783, 1.74668, 0.5722247, 0, 0, 1, 1, 1,
-0.9375539, 1.39504, -2.209199, 1, 0, 0, 1, 1,
-0.9374956, -1.519916, -1.077018, 1, 0, 0, 1, 1,
-0.9345655, 0.4933594, -1.845956, 1, 0, 0, 1, 1,
-0.9302355, -0.6400347, -1.56472, 1, 0, 0, 1, 1,
-0.9183626, 0.3001203, -1.895057, 1, 0, 0, 1, 1,
-0.9157964, 0.1482586, -0.9859926, 0, 0, 0, 1, 1,
-0.9096105, -0.3516521, -1.311219, 0, 0, 0, 1, 1,
-0.9066976, -0.7299445, -2.007858, 0, 0, 0, 1, 1,
-0.899689, -0.8842297, -1.72775, 0, 0, 0, 1, 1,
-0.8974513, -0.09332002, -1.871941, 0, 0, 0, 1, 1,
-0.8970467, 1.135038, -1.306561, 0, 0, 0, 1, 1,
-0.8966776, 1.099969, -0.4021694, 0, 0, 0, 1, 1,
-0.8877369, 1.032515, -0.9723056, 1, 1, 1, 1, 1,
-0.8818419, 0.7438095, 0.08175395, 1, 1, 1, 1, 1,
-0.8746039, -1.130427, -2.545655, 1, 1, 1, 1, 1,
-0.8710978, 1.240134, 0.602501, 1, 1, 1, 1, 1,
-0.8678122, -1.024155, -3.993181, 1, 1, 1, 1, 1,
-0.8618098, 2.616426, -1.675157, 1, 1, 1, 1, 1,
-0.860181, 0.530569, -0.9301071, 1, 1, 1, 1, 1,
-0.8439575, -1.334207, -4.066313, 1, 1, 1, 1, 1,
-0.8387837, -1.180649, -3.112898, 1, 1, 1, 1, 1,
-0.8385539, 0.2024514, -0.5929323, 1, 1, 1, 1, 1,
-0.8306927, -1.096812, -1.778285, 1, 1, 1, 1, 1,
-0.8286973, -0.04865416, -1.697955, 1, 1, 1, 1, 1,
-0.823297, -1.618072, -1.246616, 1, 1, 1, 1, 1,
-0.8211019, -1.949712, -1.449737, 1, 1, 1, 1, 1,
-0.8189712, -2.232877, -2.397639, 1, 1, 1, 1, 1,
-0.8180879, 0.4447185, 0.08298807, 0, 0, 1, 1, 1,
-0.8171604, -0.1971149, -3.644801, 1, 0, 0, 1, 1,
-0.8141124, -0.2640711, -2.476645, 1, 0, 0, 1, 1,
-0.8136064, 0.1301263, -0.4796587, 1, 0, 0, 1, 1,
-0.8113676, 0.5767434, 0.6598477, 1, 0, 0, 1, 1,
-0.8041005, 2.393527, -0.7875282, 1, 0, 0, 1, 1,
-0.8037874, -1.884847, -1.576707, 0, 0, 0, 1, 1,
-0.7969832, 0.3510761, 0.1121906, 0, 0, 0, 1, 1,
-0.7924075, 1.070893, -2.619093, 0, 0, 0, 1, 1,
-0.7863448, -0.1068362, -1.921029, 0, 0, 0, 1, 1,
-0.7750281, -1.118671, -2.855633, 0, 0, 0, 1, 1,
-0.770161, 0.4185015, -1.856419, 0, 0, 0, 1, 1,
-0.7695202, 0.1023346, -2.623533, 0, 0, 0, 1, 1,
-0.7634724, 0.377999, -2.188078, 1, 1, 1, 1, 1,
-0.763467, -0.7406149, -3.863219, 1, 1, 1, 1, 1,
-0.7571242, -0.5292454, -1.30018, 1, 1, 1, 1, 1,
-0.755572, 0.4930544, -0.16625, 1, 1, 1, 1, 1,
-0.7464501, 1.292019, -0.6008466, 1, 1, 1, 1, 1,
-0.7445435, 0.2552529, -0.4832617, 1, 1, 1, 1, 1,
-0.7444132, -0.6111086, -2.977509, 1, 1, 1, 1, 1,
-0.737682, 0.4467979, -2.155229, 1, 1, 1, 1, 1,
-0.7363827, 1.90443, -0.0706769, 1, 1, 1, 1, 1,
-0.7359703, -1.074701, -3.428415, 1, 1, 1, 1, 1,
-0.7354925, 0.883037, -0.9243719, 1, 1, 1, 1, 1,
-0.7290605, 0.1113752, -1.210531, 1, 1, 1, 1, 1,
-0.7276366, -0.3781341, -1.296308, 1, 1, 1, 1, 1,
-0.7219135, 0.1000927, -1.522472, 1, 1, 1, 1, 1,
-0.7172827, 0.5128161, -2.112647, 1, 1, 1, 1, 1,
-0.7151643, -0.206055, -1.320742, 0, 0, 1, 1, 1,
-0.7080178, -0.7185271, -2.170319, 1, 0, 0, 1, 1,
-0.7068068, 0.05464683, -0.6263145, 1, 0, 0, 1, 1,
-0.7042989, -0.2704898, 0.2806826, 1, 0, 0, 1, 1,
-0.7027084, -0.1189834, -1.869408, 1, 0, 0, 1, 1,
-0.6997498, -0.5494782, -1.752977, 1, 0, 0, 1, 1,
-0.6836433, 0.4369574, -0.431743, 0, 0, 0, 1, 1,
-0.6748929, -1.137839, -1.960312, 0, 0, 0, 1, 1,
-0.6733908, 1.154868, -1.359535, 0, 0, 0, 1, 1,
-0.6700662, 0.9611889, -2.270208, 0, 0, 0, 1, 1,
-0.6660033, -0.5963559, -0.7590247, 0, 0, 0, 1, 1,
-0.6629047, -0.534737, -2.918947, 0, 0, 0, 1, 1,
-0.6627398, -0.5318803, -2.283683, 0, 0, 0, 1, 1,
-0.6594292, 0.4416752, -1.055803, 1, 1, 1, 1, 1,
-0.6526284, -1.180902, -3.924749, 1, 1, 1, 1, 1,
-0.6505, -0.2795558, -1.812891, 1, 1, 1, 1, 1,
-0.6484853, 1.268864, -1.102075, 1, 1, 1, 1, 1,
-0.6470254, -1.749798, -1.924909, 1, 1, 1, 1, 1,
-0.6458513, -0.7898455, -0.8949972, 1, 1, 1, 1, 1,
-0.6430935, -0.5678672, -3.301795, 1, 1, 1, 1, 1,
-0.6397842, -0.7141057, -4.339224, 1, 1, 1, 1, 1,
-0.6397588, -0.7801469, -2.199697, 1, 1, 1, 1, 1,
-0.6391669, 0.2647612, -0.9973025, 1, 1, 1, 1, 1,
-0.6365981, -0.3686904, -1.604047, 1, 1, 1, 1, 1,
-0.6365448, -0.5226075, -2.558416, 1, 1, 1, 1, 1,
-0.6246795, 0.2000063, -0.2675608, 1, 1, 1, 1, 1,
-0.6246629, 0.6985623, -0.8788261, 1, 1, 1, 1, 1,
-0.6234226, 0.6555744, -0.1750006, 1, 1, 1, 1, 1,
-0.6221209, 0.5385031, -2.004558, 0, 0, 1, 1, 1,
-0.6136879, 0.8025731, -1.0566, 1, 0, 0, 1, 1,
-0.6106074, -0.4706477, -1.495335, 1, 0, 0, 1, 1,
-0.6017591, 0.1734269, -1.749186, 1, 0, 0, 1, 1,
-0.6007386, -0.2714129, -1.584432, 1, 0, 0, 1, 1,
-0.5966663, 0.1623544, -2.445928, 1, 0, 0, 1, 1,
-0.5951601, -2.120721, -2.026444, 0, 0, 0, 1, 1,
-0.5949816, 0.4601153, -2.460143, 0, 0, 0, 1, 1,
-0.5941082, -1.653066, -4.111023, 0, 0, 0, 1, 1,
-0.5938396, -0.3920964, -2.691536, 0, 0, 0, 1, 1,
-0.5897608, 1.006197, -1.747055, 0, 0, 0, 1, 1,
-0.5876221, 0.1011916, -1.186015, 0, 0, 0, 1, 1,
-0.5866284, -2.236755, -4.07467, 0, 0, 0, 1, 1,
-0.5865942, 1.207722, -0.06530699, 1, 1, 1, 1, 1,
-0.5863846, 0.7361339, -0.3848017, 1, 1, 1, 1, 1,
-0.5860311, -1.274105, -2.441457, 1, 1, 1, 1, 1,
-0.5852318, 0.6859658, 0.1456873, 1, 1, 1, 1, 1,
-0.5832897, 1.312307, -0.4835373, 1, 1, 1, 1, 1,
-0.5813379, 0.6135719, -0.1470872, 1, 1, 1, 1, 1,
-0.5793713, 0.530296, -0.8454095, 1, 1, 1, 1, 1,
-0.5750983, 0.4294533, -1.69396, 1, 1, 1, 1, 1,
-0.5691717, -1.263252, -3.030986, 1, 1, 1, 1, 1,
-0.5589653, -0.7862816, -3.71682, 1, 1, 1, 1, 1,
-0.5573332, -0.6364475, -2.091213, 1, 1, 1, 1, 1,
-0.5568574, 0.2210189, 0.2285185, 1, 1, 1, 1, 1,
-0.5554374, 0.3040685, -0.7530278, 1, 1, 1, 1, 1,
-0.5485027, -0.8362975, -1.342185, 1, 1, 1, 1, 1,
-0.5457634, -0.7809696, -1.871833, 1, 1, 1, 1, 1,
-0.5421317, 0.05968258, -2.254909, 0, 0, 1, 1, 1,
-0.5379117, -0.7898334, -2.786469, 1, 0, 0, 1, 1,
-0.5363367, 1.301997, 0.106662, 1, 0, 0, 1, 1,
-0.5340413, -0.01642251, -0.7383269, 1, 0, 0, 1, 1,
-0.5312683, -0.8047301, -0.1351361, 1, 0, 0, 1, 1,
-0.5308065, -0.1914305, -1.740472, 1, 0, 0, 1, 1,
-0.5307968, 1.715897, -1.686448, 0, 0, 0, 1, 1,
-0.5277226, -0.6753597, -3.385629, 0, 0, 0, 1, 1,
-0.5223317, 0.3528975, -0.2164295, 0, 0, 0, 1, 1,
-0.5215352, 0.2654293, -1.305295, 0, 0, 0, 1, 1,
-0.5215251, -0.6066355, -2.305134, 0, 0, 0, 1, 1,
-0.5209102, 1.017824, 1.085429, 0, 0, 0, 1, 1,
-0.5198634, -1.090698, -5.800408, 0, 0, 0, 1, 1,
-0.5183575, -0.284396, -2.567423, 1, 1, 1, 1, 1,
-0.5151451, 1.277553, 0.8569899, 1, 1, 1, 1, 1,
-0.514408, -0.4001679, -2.466161, 1, 1, 1, 1, 1,
-0.5100822, -1.03664, -1.542118, 1, 1, 1, 1, 1,
-0.509326, 0.5931683, 0.3247236, 1, 1, 1, 1, 1,
-0.507086, -1.228985, -4.153253, 1, 1, 1, 1, 1,
-0.4916597, -1.910292, -3.049705, 1, 1, 1, 1, 1,
-0.4875365, -2.860073, -1.805922, 1, 1, 1, 1, 1,
-0.4822407, 0.1773737, -1.441505, 1, 1, 1, 1, 1,
-0.4817451, -0.5637774, -1.435711, 1, 1, 1, 1, 1,
-0.4807374, 0.9204572, -1.330762, 1, 1, 1, 1, 1,
-0.4789803, -0.5231534, -3.815869, 1, 1, 1, 1, 1,
-0.4756753, 0.02970285, -1.431974, 1, 1, 1, 1, 1,
-0.4651281, 1.465084, -1.370011, 1, 1, 1, 1, 1,
-0.4580792, -1.199853, -4.015838, 1, 1, 1, 1, 1,
-0.4576055, -1.151148, -1.698143, 0, 0, 1, 1, 1,
-0.4565175, -0.9446511, -3.720589, 1, 0, 0, 1, 1,
-0.4530937, -0.7821972, -1.500561, 1, 0, 0, 1, 1,
-0.4503841, 0.9783689, 1.03426, 1, 0, 0, 1, 1,
-0.4445998, -0.1841519, -2.102748, 1, 0, 0, 1, 1,
-0.4444748, -0.4424349, -2.812556, 1, 0, 0, 1, 1,
-0.4430544, -0.3824722, -3.10987, 0, 0, 0, 1, 1,
-0.4421054, 0.4867453, -0.512233, 0, 0, 0, 1, 1,
-0.4384909, -0.5070164, -2.460134, 0, 0, 0, 1, 1,
-0.4383007, 0.3011934, -2.935788, 0, 0, 0, 1, 1,
-0.4357576, 0.02359044, -2.299384, 0, 0, 0, 1, 1,
-0.4348719, 0.6929352, 0.3810751, 0, 0, 0, 1, 1,
-0.4309464, -0.3443995, -3.364509, 0, 0, 0, 1, 1,
-0.4306031, -0.570973, -2.042869, 1, 1, 1, 1, 1,
-0.4242385, 0.1524635, -1.750895, 1, 1, 1, 1, 1,
-0.4200953, 2.159101, 1.021182, 1, 1, 1, 1, 1,
-0.41669, -1.425345, -2.484046, 1, 1, 1, 1, 1,
-0.4147325, -1.040051, -3.822244, 1, 1, 1, 1, 1,
-0.4142285, -0.4916667, -2.724544, 1, 1, 1, 1, 1,
-0.4082027, -1.743693, -2.005727, 1, 1, 1, 1, 1,
-0.4047529, -0.86211, -1.877282, 1, 1, 1, 1, 1,
-0.4018077, 0.4899082, -0.1537574, 1, 1, 1, 1, 1,
-0.4001972, 1.174978, -0.8680472, 1, 1, 1, 1, 1,
-0.3967967, 0.2940371, -1.312966, 1, 1, 1, 1, 1,
-0.3898954, 0.40394, 0.02907826, 1, 1, 1, 1, 1,
-0.3880273, -0.95219, -2.429677, 1, 1, 1, 1, 1,
-0.3856895, 0.1971837, -1.20753, 1, 1, 1, 1, 1,
-0.3779981, -0.3345423, -1.46709, 1, 1, 1, 1, 1,
-0.3737695, -1.955913, -4.748542, 0, 0, 1, 1, 1,
-0.3732276, -0.9345121, -2.690874, 1, 0, 0, 1, 1,
-0.3670841, -1.038526, -2.884183, 1, 0, 0, 1, 1,
-0.3623427, 0.5748821, -0.05957134, 1, 0, 0, 1, 1,
-0.3597037, 0.3576055, -0.2525583, 1, 0, 0, 1, 1,
-0.3593899, 0.03825251, -1.408453, 1, 0, 0, 1, 1,
-0.3580372, 0.06843115, -2.039108, 0, 0, 0, 1, 1,
-0.3577146, 0.3808855, -1.356666, 0, 0, 0, 1, 1,
-0.3540332, 0.07962301, -0.8335781, 0, 0, 0, 1, 1,
-0.352161, -0.01225917, -2.561731, 0, 0, 0, 1, 1,
-0.3520229, -1.426321, -0.9933722, 0, 0, 0, 1, 1,
-0.349849, -1.016897, -3.422516, 0, 0, 0, 1, 1,
-0.3487617, 0.3646224, -1.155407, 0, 0, 0, 1, 1,
-0.3459156, 0.2121006, -0.6388241, 1, 1, 1, 1, 1,
-0.3424622, -0.2909241, -3.853956, 1, 1, 1, 1, 1,
-0.3408439, -0.7469337, -2.65338, 1, 1, 1, 1, 1,
-0.3350912, -1.540716, -2.265894, 1, 1, 1, 1, 1,
-0.3283854, 1.030553, 0.2340673, 1, 1, 1, 1, 1,
-0.3249561, 0.01551282, 0.4080264, 1, 1, 1, 1, 1,
-0.3220483, -1.333731, -2.914203, 1, 1, 1, 1, 1,
-0.3173136, 1.088697, -0.8905399, 1, 1, 1, 1, 1,
-0.311728, 0.5216476, -0.8255377, 1, 1, 1, 1, 1,
-0.3113634, -0.2249029, -1.026025, 1, 1, 1, 1, 1,
-0.3084838, -0.9751627, -4.132756, 1, 1, 1, 1, 1,
-0.3076168, -0.9291525, -1.150851, 1, 1, 1, 1, 1,
-0.3036711, -0.9733909, -1.446208, 1, 1, 1, 1, 1,
-0.2974289, 0.2873992, -0.950749, 1, 1, 1, 1, 1,
-0.2951868, 0.09965178, -0.7327196, 1, 1, 1, 1, 1,
-0.2914188, 2.010066, 0.4637951, 0, 0, 1, 1, 1,
-0.2851359, 0.7641612, 0.2457659, 1, 0, 0, 1, 1,
-0.2846826, -0.2793398, -3.249467, 1, 0, 0, 1, 1,
-0.2832278, 0.6344086, 1.058191, 1, 0, 0, 1, 1,
-0.2817219, -0.4673098, -3.77653, 1, 0, 0, 1, 1,
-0.2800643, 2.441249, 1.317478, 1, 0, 0, 1, 1,
-0.2777096, -0.3695435, -2.775548, 0, 0, 0, 1, 1,
-0.2774646, 0.1417711, -0.9281965, 0, 0, 0, 1, 1,
-0.277001, 1.039248, -0.9731899, 0, 0, 0, 1, 1,
-0.2760832, 0.3535081, 0.6150306, 0, 0, 0, 1, 1,
-0.2732294, -0.6373202, 0.1267375, 0, 0, 0, 1, 1,
-0.2721334, 0.8033224, -0.05864805, 0, 0, 0, 1, 1,
-0.2698817, 0.6469839, -0.2951034, 0, 0, 0, 1, 1,
-0.265203, 0.6107026, -0.8666489, 1, 1, 1, 1, 1,
-0.2651727, -0.1833826, -2.567175, 1, 1, 1, 1, 1,
-0.2625795, -0.2213772, -1.002872, 1, 1, 1, 1, 1,
-0.2571535, 0.6497866, -0.02776295, 1, 1, 1, 1, 1,
-0.2555688, -1.090682, -3.78551, 1, 1, 1, 1, 1,
-0.2519284, -0.4777846, -1.889786, 1, 1, 1, 1, 1,
-0.2484729, 1.112325, 0.1448586, 1, 1, 1, 1, 1,
-0.2444267, 0.6273622, -0.1564214, 1, 1, 1, 1, 1,
-0.2427861, 2.294785, -1.279879, 1, 1, 1, 1, 1,
-0.2415354, 0.3997987, -0.490732, 1, 1, 1, 1, 1,
-0.2355982, -0.8673091, -4.129218, 1, 1, 1, 1, 1,
-0.2326925, -1.352577, -4.425676, 1, 1, 1, 1, 1,
-0.232225, -0.8674793, -2.122328, 1, 1, 1, 1, 1,
-0.2301647, 1.533242, -1.134997, 1, 1, 1, 1, 1,
-0.2274155, 1.357483, 0.3168974, 1, 1, 1, 1, 1,
-0.2272629, 0.5116262, -0.3726013, 0, 0, 1, 1, 1,
-0.2255305, 0.0005738624, -1.744494, 1, 0, 0, 1, 1,
-0.2231046, 0.1323532, -1.004138, 1, 0, 0, 1, 1,
-0.22017, 0.8669779, -0.5177928, 1, 0, 0, 1, 1,
-0.2182126, -0.4493423, -2.69329, 1, 0, 0, 1, 1,
-0.2176356, 1.639243, -0.543263, 1, 0, 0, 1, 1,
-0.2176017, 0.3907954, -0.5629811, 0, 0, 0, 1, 1,
-0.2170939, -0.7972915, -3.203557, 0, 0, 0, 1, 1,
-0.2080302, 0.4624989, -0.03577418, 0, 0, 0, 1, 1,
-0.2062172, 1.167874, -0.03077764, 0, 0, 0, 1, 1,
-0.2051657, -0.3503101, -4.04562, 0, 0, 0, 1, 1,
-0.2014599, -0.7131931, -3.482055, 0, 0, 0, 1, 1,
-0.2001764, -1.241997, -3.90377, 0, 0, 0, 1, 1,
-0.1983798, -0.04531826, -0.7505822, 1, 1, 1, 1, 1,
-0.1942911, 1.7626, -0.4009523, 1, 1, 1, 1, 1,
-0.1922738, 0.03881563, -0.9929944, 1, 1, 1, 1, 1,
-0.1913522, -0.2853517, -4.063673, 1, 1, 1, 1, 1,
-0.190692, -0.3749837, -0.6554102, 1, 1, 1, 1, 1,
-0.1891971, 0.7876645, 0.6295255, 1, 1, 1, 1, 1,
-0.1887139, 0.1100239, 0.5486326, 1, 1, 1, 1, 1,
-0.186233, -2.304967, -2.347744, 1, 1, 1, 1, 1,
-0.1850338, 0.3313617, -0.1429817, 1, 1, 1, 1, 1,
-0.183616, -0.2716169, -1.392591, 1, 1, 1, 1, 1,
-0.1759596, 1.22006, -0.02236168, 1, 1, 1, 1, 1,
-0.1743969, 0.04213142, -0.7386228, 1, 1, 1, 1, 1,
-0.1720427, -1.150433, -2.317981, 1, 1, 1, 1, 1,
-0.171736, 0.1976857, -0.7135015, 1, 1, 1, 1, 1,
-0.1668115, 0.183476, -0.4657375, 1, 1, 1, 1, 1,
-0.1662627, 0.02848792, -0.1581595, 0, 0, 1, 1, 1,
-0.1647742, -0.5104494, -4.280017, 1, 0, 0, 1, 1,
-0.1646718, 0.02464762, -1.648161, 1, 0, 0, 1, 1,
-0.160036, -1.373815, -1.736129, 1, 0, 0, 1, 1,
-0.1598206, -0.7721521, -2.498092, 1, 0, 0, 1, 1,
-0.1555019, 0.6126034, 0.1595156, 1, 0, 0, 1, 1,
-0.1533485, -0.7312566, -2.807263, 0, 0, 0, 1, 1,
-0.1515445, -0.004770846, -1.600515, 0, 0, 0, 1, 1,
-0.1494081, -1.430328, -2.683568, 0, 0, 0, 1, 1,
-0.1417175, -1.338027, -3.979488, 0, 0, 0, 1, 1,
-0.1389161, 0.7692236, 0.3938937, 0, 0, 0, 1, 1,
-0.1383993, -1.086877, -2.863352, 0, 0, 0, 1, 1,
-0.1381211, -0.1191785, -1.371521, 0, 0, 0, 1, 1,
-0.1357654, 0.1839605, -1.205484, 1, 1, 1, 1, 1,
-0.1335189, -0.1905645, -3.840131, 1, 1, 1, 1, 1,
-0.1282046, 0.3723667, 0.8519995, 1, 1, 1, 1, 1,
-0.1258454, 1.41124, -0.3172409, 1, 1, 1, 1, 1,
-0.1247614, 0.5485203, 0.6669183, 1, 1, 1, 1, 1,
-0.1179224, 0.8589707, -1.417989, 1, 1, 1, 1, 1,
-0.1128615, 1.155627, 0.8725306, 1, 1, 1, 1, 1,
-0.110846, -0.174878, -2.698677, 1, 1, 1, 1, 1,
-0.1099237, 1.040036, -0.7190024, 1, 1, 1, 1, 1,
-0.1075071, 1.223823, -1.599235, 1, 1, 1, 1, 1,
-0.1070331, -2.048295, -2.406909, 1, 1, 1, 1, 1,
-0.103253, -0.89113, -2.326525, 1, 1, 1, 1, 1,
-0.09612428, -0.3814561, -3.114113, 1, 1, 1, 1, 1,
-0.09185067, -0.5370356, -1.816381, 1, 1, 1, 1, 1,
-0.08929707, 1.535967, 0.8860731, 1, 1, 1, 1, 1,
-0.08822248, -0.09104393, -1.681707, 0, 0, 1, 1, 1,
-0.08801517, -1.381534, -4.18041, 1, 0, 0, 1, 1,
-0.08580007, 0.9384103, -0.7079604, 1, 0, 0, 1, 1,
-0.08182438, -0.05998843, -2.523421, 1, 0, 0, 1, 1,
-0.081153, 0.03111761, -1.394357, 1, 0, 0, 1, 1,
-0.08102374, -1.219088, -3.024124, 1, 0, 0, 1, 1,
-0.0808507, -0.4759201, -2.114914, 0, 0, 0, 1, 1,
-0.08041258, 0.607366, -0.06344156, 0, 0, 0, 1, 1,
-0.07484774, 0.06665192, 0.1296165, 0, 0, 0, 1, 1,
-0.07314021, -0.4643263, -0.09983098, 0, 0, 0, 1, 1,
-0.07168192, 0.6148029, 0.2784187, 0, 0, 0, 1, 1,
-0.07044695, -1.161245, -1.358477, 0, 0, 0, 1, 1,
-0.06762104, 0.01179328, -0.5183539, 0, 0, 0, 1, 1,
-0.06635822, 0.7798716, -0.6077068, 1, 1, 1, 1, 1,
-0.0660648, 0.779363, -1.519378, 1, 1, 1, 1, 1,
-0.06449355, -0.931853, -3.938424, 1, 1, 1, 1, 1,
-0.06437726, -1.642408, -4.619571, 1, 1, 1, 1, 1,
-0.05898418, -0.2098089, -3.951758, 1, 1, 1, 1, 1,
-0.04371782, -0.2634144, -2.376221, 1, 1, 1, 1, 1,
-0.04285412, 0.9647667, -0.2257173, 1, 1, 1, 1, 1,
-0.04283432, -0.5236801, -4.470591, 1, 1, 1, 1, 1,
-0.04167395, 0.5228268, 0.272586, 1, 1, 1, 1, 1,
-0.03735818, -1.14041, -1.631336, 1, 1, 1, 1, 1,
-0.0365965, -0.1816406, -3.280241, 1, 1, 1, 1, 1,
-0.03381189, 0.2572315, 0.0533314, 1, 1, 1, 1, 1,
-0.03250508, 1.366388, 1.295653, 1, 1, 1, 1, 1,
-0.0322686, 0.2560383, 0.00452505, 1, 1, 1, 1, 1,
-0.03192919, 0.05526951, -0.3140465, 1, 1, 1, 1, 1,
-0.03013635, -0.3360969, -3.843568, 0, 0, 1, 1, 1,
-0.02908292, 1.294903, -0.3491603, 1, 0, 0, 1, 1,
-0.02791038, -0.5924382, -2.490413, 1, 0, 0, 1, 1,
-0.02098758, -0.1847175, -1.997089, 1, 0, 0, 1, 1,
-0.02080126, -0.7313415, -3.091941, 1, 0, 0, 1, 1,
-0.02062711, -0.9114199, -3.057106, 1, 0, 0, 1, 1,
-0.01441392, -0.2100913, -3.267244, 0, 0, 0, 1, 1,
-0.01377934, -0.4764614, -3.277716, 0, 0, 0, 1, 1,
-0.01241103, -0.2672208, -2.309933, 0, 0, 0, 1, 1,
-0.0122525, -0.6504883, -2.332051, 0, 0, 0, 1, 1,
-0.01106754, 0.1859912, -1.385638, 0, 0, 0, 1, 1,
-0.009286757, -0.3323105, -2.431041, 0, 0, 0, 1, 1,
-0.003114161, -1.89791, -2.094894, 0, 0, 0, 1, 1,
-0.001309972, 0.5838007, -0.09382143, 1, 1, 1, 1, 1,
-0.00123782, 0.2890212, 2.112267, 1, 1, 1, 1, 1,
-0.0006528072, 0.8319082, 0.1119946, 1, 1, 1, 1, 1,
0.001523582, 0.6567823, 0.8018137, 1, 1, 1, 1, 1,
0.006376984, 0.7099125, 0.9946662, 1, 1, 1, 1, 1,
0.006497248, -0.631579, 2.459777, 1, 1, 1, 1, 1,
0.006666252, 0.1945373, -0.5028147, 1, 1, 1, 1, 1,
0.007526213, -1.285934, 2.616837, 1, 1, 1, 1, 1,
0.008497324, 0.0003869928, 1.585212, 1, 1, 1, 1, 1,
0.01241749, -0.1719927, 2.782726, 1, 1, 1, 1, 1,
0.01268631, -0.09353281, 4.183116, 1, 1, 1, 1, 1,
0.01676806, -0.3591015, 4.416713, 1, 1, 1, 1, 1,
0.01739725, -1.644927, 1.55289, 1, 1, 1, 1, 1,
0.01816073, -0.001749558, 3.965968, 1, 1, 1, 1, 1,
0.01981871, 0.1981424, 0.2426426, 1, 1, 1, 1, 1,
0.02011539, -0.2277851, 4.078222, 0, 0, 1, 1, 1,
0.0210649, -1.417456, 2.330472, 1, 0, 0, 1, 1,
0.02888009, -0.805147, 2.514068, 1, 0, 0, 1, 1,
0.02949916, 1.246631, -0.7881997, 1, 0, 0, 1, 1,
0.0326507, 2.104252, -0.07863018, 1, 0, 0, 1, 1,
0.03343679, -0.2930416, 4.073586, 1, 0, 0, 1, 1,
0.03462232, -0.9492773, 2.391432, 0, 0, 0, 1, 1,
0.03792018, -0.2997196, 3.949885, 0, 0, 0, 1, 1,
0.03926165, 0.432873, 0.6834767, 0, 0, 0, 1, 1,
0.03941578, 1.845243, -2.440336, 0, 0, 0, 1, 1,
0.04086556, -2.131844, 5.127675, 0, 0, 0, 1, 1,
0.04094915, -1.348632, 3.970555, 0, 0, 0, 1, 1,
0.04385047, -0.05217248, 4.331338, 0, 0, 0, 1, 1,
0.04589574, 0.7374451, -0.3240653, 1, 1, 1, 1, 1,
0.04791668, 1.08198, 1.048264, 1, 1, 1, 1, 1,
0.05336058, 0.550354, -2.032296, 1, 1, 1, 1, 1,
0.0582193, 0.1507531, 1.31459, 1, 1, 1, 1, 1,
0.05917707, 0.8014765, -0.09733758, 1, 1, 1, 1, 1,
0.06048036, -0.8056076, 0.8686745, 1, 1, 1, 1, 1,
0.06054083, -0.3479743, 2.70968, 1, 1, 1, 1, 1,
0.06758483, -0.04935375, 1.666563, 1, 1, 1, 1, 1,
0.06795083, -0.1959104, 3.802753, 1, 1, 1, 1, 1,
0.07241838, 0.4988464, 1.123657, 1, 1, 1, 1, 1,
0.07270376, -0.09677474, 1.785257, 1, 1, 1, 1, 1,
0.07730787, 0.2946152, 0.6160957, 1, 1, 1, 1, 1,
0.07813298, 3.260648, 2.494101, 1, 1, 1, 1, 1,
0.078981, -0.2493657, 1.115847, 1, 1, 1, 1, 1,
0.07987374, 1.014797, 1.085847, 1, 1, 1, 1, 1,
0.08279043, -0.395154, 2.462597, 0, 0, 1, 1, 1,
0.09512953, -0.1699314, 1.965102, 1, 0, 0, 1, 1,
0.09871216, -0.07769895, 4.295654, 1, 0, 0, 1, 1,
0.09919516, 1.637505, 2.125344, 1, 0, 0, 1, 1,
0.1050799, -0.36522, 2.503167, 1, 0, 0, 1, 1,
0.1072014, -0.7064837, 3.275167, 1, 0, 0, 1, 1,
0.1073431, -1.300558, 4.056282, 0, 0, 0, 1, 1,
0.1083255, 1.156723, 0.19204, 0, 0, 0, 1, 1,
0.1086529, -1.270561, 2.593508, 0, 0, 0, 1, 1,
0.1106206, -2.028684, 1.487093, 0, 0, 0, 1, 1,
0.1129767, 0.3034624, 2.337673, 0, 0, 0, 1, 1,
0.1146907, 0.2189654, 0.7671508, 0, 0, 0, 1, 1,
0.1149732, 0.3048671, 0.9150041, 0, 0, 0, 1, 1,
0.1203712, 0.5107206, -1.205448, 1, 1, 1, 1, 1,
0.123769, -1.079491, 2.517926, 1, 1, 1, 1, 1,
0.1250479, 1.552107, 0.02560783, 1, 1, 1, 1, 1,
0.1258056, -0.5879067, 3.354714, 1, 1, 1, 1, 1,
0.1259658, -1.138999, 3.242157, 1, 1, 1, 1, 1,
0.1285119, -1.147505, 2.714955, 1, 1, 1, 1, 1,
0.1369442, 1.456791, -1.080586, 1, 1, 1, 1, 1,
0.1418006, -0.973315, 4.553751, 1, 1, 1, 1, 1,
0.1422011, 0.5775607, -1.260966, 1, 1, 1, 1, 1,
0.1426472, 2.736343, 0.09583557, 1, 1, 1, 1, 1,
0.1427386, -1.722891, 5.522064, 1, 1, 1, 1, 1,
0.1435274, -0.303757, 2.075382, 1, 1, 1, 1, 1,
0.1440636, 0.4262764, -0.2378187, 1, 1, 1, 1, 1,
0.1460816, 0.08426677, 1.13684, 1, 1, 1, 1, 1,
0.1482911, 2.390281, 0.9374879, 1, 1, 1, 1, 1,
0.1490839, -1.84564, 3.286823, 0, 0, 1, 1, 1,
0.1500915, -0.4149694, 2.972989, 1, 0, 0, 1, 1,
0.1571222, -1.149913, 3.813988, 1, 0, 0, 1, 1,
0.158896, -0.178156, 1.635169, 1, 0, 0, 1, 1,
0.1635349, 0.8137401, 0.040248, 1, 0, 0, 1, 1,
0.1683325, 1.47371, -0.2494902, 1, 0, 0, 1, 1,
0.1701339, 1.095137, -0.1846771, 0, 0, 0, 1, 1,
0.1743615, 0.6941689, -0.752686, 0, 0, 0, 1, 1,
0.1752119, -0.5862169, 3.017751, 0, 0, 0, 1, 1,
0.1767359, -0.4637893, 3.694777, 0, 0, 0, 1, 1,
0.1774247, 0.3159562, 0.4049124, 0, 0, 0, 1, 1,
0.1891639, -0.1668399, 2.078848, 0, 0, 0, 1, 1,
0.1893595, 0.3660871, 1.319943, 0, 0, 0, 1, 1,
0.1931893, 1.186558, -0.7300602, 1, 1, 1, 1, 1,
0.1962014, 1.725018, -0.2936486, 1, 1, 1, 1, 1,
0.1971152, -1.447157, 2.395528, 1, 1, 1, 1, 1,
0.1980061, 0.7283797, 0.1312194, 1, 1, 1, 1, 1,
0.1986987, 1.619943, 0.01135598, 1, 1, 1, 1, 1,
0.2034409, -0.9842137, 2.980634, 1, 1, 1, 1, 1,
0.2065068, 0.4006214, 1.017888, 1, 1, 1, 1, 1,
0.2106556, -0.001539474, 1.786452, 1, 1, 1, 1, 1,
0.2125674, 0.3592157, 0.8397058, 1, 1, 1, 1, 1,
0.2227637, -0.1407071, 2.186571, 1, 1, 1, 1, 1,
0.2248586, -0.4111518, 2.084982, 1, 1, 1, 1, 1,
0.2248909, -0.08093879, 1.751975, 1, 1, 1, 1, 1,
0.2262201, 0.7160105, -1.534337, 1, 1, 1, 1, 1,
0.2313352, -0.1538159, 1.933613, 1, 1, 1, 1, 1,
0.2365588, -0.4905437, -0.08361502, 1, 1, 1, 1, 1,
0.240546, -0.7200097, 1.213046, 0, 0, 1, 1, 1,
0.2445652, 1.196185, 0.2036112, 1, 0, 0, 1, 1,
0.2448036, -0.878888, 1.003478, 1, 0, 0, 1, 1,
0.2486709, 1.410551, 0.7223196, 1, 0, 0, 1, 1,
0.2491975, 0.01444111, 0.5823275, 1, 0, 0, 1, 1,
0.2517174, -1.767365, 2.978233, 1, 0, 0, 1, 1,
0.2536983, 2.094922, 0.01805231, 0, 0, 0, 1, 1,
0.2552065, -0.5638373, 2.661497, 0, 0, 0, 1, 1,
0.2563846, 0.361324, 0.7617571, 0, 0, 0, 1, 1,
0.2614301, -1.160043, 2.328084, 0, 0, 0, 1, 1,
0.2632641, -0.165846, 0.7542225, 0, 0, 0, 1, 1,
0.2659453, 0.3425655, 0.7966226, 0, 0, 0, 1, 1,
0.2683489, -2.085542, 3.630496, 0, 0, 0, 1, 1,
0.2714954, 0.1968142, 1.721139, 1, 1, 1, 1, 1,
0.2804202, 0.646341, -0.9625846, 1, 1, 1, 1, 1,
0.2837481, 1.067787, 1.810699, 1, 1, 1, 1, 1,
0.2854127, 0.4856814, 0.9950005, 1, 1, 1, 1, 1,
0.2862226, -1.292113, 0.7998164, 1, 1, 1, 1, 1,
0.288063, 0.5843037, 1.238645, 1, 1, 1, 1, 1,
0.3023433, 1.305612, 0.6288689, 1, 1, 1, 1, 1,
0.3050776, 0.6624641, 1.047451, 1, 1, 1, 1, 1,
0.3064703, -1.834, 3.149328, 1, 1, 1, 1, 1,
0.316572, -1.039723, 2.508551, 1, 1, 1, 1, 1,
0.3168921, 0.4544376, -0.1602478, 1, 1, 1, 1, 1,
0.3205391, 1.718936, 1.074106, 1, 1, 1, 1, 1,
0.3217063, -1.14432, 4.914824, 1, 1, 1, 1, 1,
0.3221612, -0.4409173, 1.22811, 1, 1, 1, 1, 1,
0.3227285, -0.5854086, 3.486131, 1, 1, 1, 1, 1,
0.3258188, 0.9107552, 0.7514987, 0, 0, 1, 1, 1,
0.3271412, -1.224011, 2.636109, 1, 0, 0, 1, 1,
0.3327624, 0.414353, -1.771305, 1, 0, 0, 1, 1,
0.3365967, 0.2152758, 2.730391, 1, 0, 0, 1, 1,
0.3417622, -0.05526337, 2.025845, 1, 0, 0, 1, 1,
0.3429639, -1.134803, 2.10944, 1, 0, 0, 1, 1,
0.3485694, 0.4764056, 0.8685678, 0, 0, 0, 1, 1,
0.3543148, -1.125685, 0.902393, 0, 0, 0, 1, 1,
0.3621753, 2.182729, 1.94211, 0, 0, 0, 1, 1,
0.365648, -0.2846651, 2.078317, 0, 0, 0, 1, 1,
0.3668885, -1.25502, 3.592354, 0, 0, 0, 1, 1,
0.3679462, -0.3688869, 2.262077, 0, 0, 0, 1, 1,
0.3695923, 0.1155782, 0.6500235, 0, 0, 0, 1, 1,
0.3714636, -0.1511806, 2.037705, 1, 1, 1, 1, 1,
0.375706, -0.3664361, 0.751675, 1, 1, 1, 1, 1,
0.375918, -0.1062415, 2.552329, 1, 1, 1, 1, 1,
0.3764942, 1.428993, -0.5077442, 1, 1, 1, 1, 1,
0.376813, 0.2750156, -0.3359786, 1, 1, 1, 1, 1,
0.3779118, 0.8055504, 0.009406781, 1, 1, 1, 1, 1,
0.3819347, -1.804144, 3.5463, 1, 1, 1, 1, 1,
0.3820343, -0.4935555, 2.334811, 1, 1, 1, 1, 1,
0.3830056, 0.3684114, 0.905664, 1, 1, 1, 1, 1,
0.3851967, 0.7854152, 0.2970867, 1, 1, 1, 1, 1,
0.3854698, 1.018336, -0.1627796, 1, 1, 1, 1, 1,
0.3860542, -0.09686334, 2.360571, 1, 1, 1, 1, 1,
0.3883958, 0.2803364, 2.049656, 1, 1, 1, 1, 1,
0.3903231, 0.2696251, 0.2300054, 1, 1, 1, 1, 1,
0.3924437, 1.219152, 1.186311, 1, 1, 1, 1, 1,
0.3985038, -0.6494433, 1.996158, 0, 0, 1, 1, 1,
0.4094141, 0.09777246, 1.690904, 1, 0, 0, 1, 1,
0.4097813, -0.9655398, 2.55928, 1, 0, 0, 1, 1,
0.41551, -0.3405673, 3.708045, 1, 0, 0, 1, 1,
0.4184205, 0.1104729, 1.803441, 1, 0, 0, 1, 1,
0.4263928, -0.2562588, 3.906152, 1, 0, 0, 1, 1,
0.4283552, 2.170562, 1.101318, 0, 0, 0, 1, 1,
0.42946, -1.847165, 2.726681, 0, 0, 0, 1, 1,
0.4316098, -0.1504591, 0.9673533, 0, 0, 0, 1, 1,
0.4342356, -1.624233, 1.619391, 0, 0, 0, 1, 1,
0.4373797, -0.8363909, 2.167716, 0, 0, 0, 1, 1,
0.4401532, 1.054989, 0.01883861, 0, 0, 0, 1, 1,
0.4497578, -0.6354544, 1.963958, 0, 0, 0, 1, 1,
0.4554615, -0.1276505, 2.233009, 1, 1, 1, 1, 1,
0.4557689, 1.840551, 1.758883, 1, 1, 1, 1, 1,
0.4563098, -1.039706, 2.34407, 1, 1, 1, 1, 1,
0.4605487, -0.2007722, 2.370704, 1, 1, 1, 1, 1,
0.4633687, 0.4985378, 1.555261, 1, 1, 1, 1, 1,
0.4654521, 0.5973011, 1.837448, 1, 1, 1, 1, 1,
0.46657, 0.2317321, 0.4140887, 1, 1, 1, 1, 1,
0.468276, 0.1277721, 0.8603603, 1, 1, 1, 1, 1,
0.4726627, -0.8811235, 2.640207, 1, 1, 1, 1, 1,
0.4786482, 0.2969564, 1.7942, 1, 1, 1, 1, 1,
0.4810012, 1.343455, 2.200532, 1, 1, 1, 1, 1,
0.4843697, 1.445881, 0.06497022, 1, 1, 1, 1, 1,
0.4866892, -1.752064, 5.483691, 1, 1, 1, 1, 1,
0.4877754, -0.9760503, 3.355228, 1, 1, 1, 1, 1,
0.4896134, 0.7012599, -0.281768, 1, 1, 1, 1, 1,
0.4911752, -1.730761, 2.130619, 0, 0, 1, 1, 1,
0.4916614, 0.4715159, 1.045507, 1, 0, 0, 1, 1,
0.4975208, -1.188338, 2.772937, 1, 0, 0, 1, 1,
0.4992642, -0.5064785, 1.482308, 1, 0, 0, 1, 1,
0.4995698, -0.06586584, 2.279314, 1, 0, 0, 1, 1,
0.5048317, 0.3533224, -0.9211006, 1, 0, 0, 1, 1,
0.5048672, 3.072947, -0.5858055, 0, 0, 0, 1, 1,
0.5154374, 0.8023378, 1.961216, 0, 0, 0, 1, 1,
0.5167415, 1.4404, 2.057456, 0, 0, 0, 1, 1,
0.5174473, -0.09393059, -0.4746419, 0, 0, 0, 1, 1,
0.522555, -0.008344318, 0.4833384, 0, 0, 0, 1, 1,
0.5251322, -1.16296, 2.687738, 0, 0, 0, 1, 1,
0.525717, 1.14581, 1.109329, 0, 0, 0, 1, 1,
0.5262398, 0.23902, 0.9270341, 1, 1, 1, 1, 1,
0.5275007, 1.456455, -0.5446634, 1, 1, 1, 1, 1,
0.5302312, -0.3241825, 2.253904, 1, 1, 1, 1, 1,
0.5330032, 0.4332881, -0.07382847, 1, 1, 1, 1, 1,
0.5363285, 1.65302, -0.1133326, 1, 1, 1, 1, 1,
0.5392187, 1.158169, 0.6323858, 1, 1, 1, 1, 1,
0.5406961, -0.9863778, 1.851747, 1, 1, 1, 1, 1,
0.5420948, 0.2555436, 0.8387749, 1, 1, 1, 1, 1,
0.5423895, -1.078608, 2.49425, 1, 1, 1, 1, 1,
0.5465118, -0.1606875, 0.963338, 1, 1, 1, 1, 1,
0.5469961, 0.01975117, 0.3979164, 1, 1, 1, 1, 1,
0.5486992, -0.7483524, 4.058884, 1, 1, 1, 1, 1,
0.5491434, 0.8327063, 2.193588, 1, 1, 1, 1, 1,
0.5499434, -0.9942225, 4.347395, 1, 1, 1, 1, 1,
0.5515442, -1.254787, 1.098325, 1, 1, 1, 1, 1,
0.5540108, 0.8534791, -0.02716037, 0, 0, 1, 1, 1,
0.5552112, 0.0514658, 1.874426, 1, 0, 0, 1, 1,
0.560035, -0.4565559, 1.802797, 1, 0, 0, 1, 1,
0.5602789, -0.2038008, 1.589419, 1, 0, 0, 1, 1,
0.562085, -2.121006, 1.177789, 1, 0, 0, 1, 1,
0.5627228, -0.9857724, 2.708387, 1, 0, 0, 1, 1,
0.5630312, 1.076359, 0.3446125, 0, 0, 0, 1, 1,
0.5644025, -0.3055255, 3.386128, 0, 0, 0, 1, 1,
0.5692323, 0.7104046, 1.812636, 0, 0, 0, 1, 1,
0.5694283, 1.7162, -1.887976, 0, 0, 0, 1, 1,
0.5738231, 0.3253187, 2.627003, 0, 0, 0, 1, 1,
0.583102, -0.4061456, 3.554418, 0, 0, 0, 1, 1,
0.5880747, 1.511642, 0.1986747, 0, 0, 0, 1, 1,
0.5890847, -0.5566582, 2.296949, 1, 1, 1, 1, 1,
0.5930355, 0.1436229, 0.5964227, 1, 1, 1, 1, 1,
0.5936364, 0.2950489, 1.356509, 1, 1, 1, 1, 1,
0.5943501, -0.5102555, 2.595671, 1, 1, 1, 1, 1,
0.5951278, 0.9104656, 1.140145, 1, 1, 1, 1, 1,
0.5951652, 0.1996738, 1.120553, 1, 1, 1, 1, 1,
0.5954871, 0.8123523, 1.654423, 1, 1, 1, 1, 1,
0.5960893, 1.058092, 0.1432242, 1, 1, 1, 1, 1,
0.5967915, 0.2786395, 2.2732, 1, 1, 1, 1, 1,
0.6008733, 0.785264, -0.004055417, 1, 1, 1, 1, 1,
0.6035207, -1.924374, 2.356531, 1, 1, 1, 1, 1,
0.6069478, 0.2385327, 0.06243643, 1, 1, 1, 1, 1,
0.6098481, 0.1160583, 2.161084, 1, 1, 1, 1, 1,
0.6174808, 0.2229067, 1.510333, 1, 1, 1, 1, 1,
0.618744, -0.2409416, 1.389775, 1, 1, 1, 1, 1,
0.6231577, 0.4359803, 0.3551671, 0, 0, 1, 1, 1,
0.6263537, -0.03507554, 1.280208, 1, 0, 0, 1, 1,
0.6282273, -1.053518, 3.534587, 1, 0, 0, 1, 1,
0.6291751, 0.544469, 2.303024, 1, 0, 0, 1, 1,
0.6297114, 0.3684166, -0.06773698, 1, 0, 0, 1, 1,
0.6316692, 0.04260439, 2.284254, 1, 0, 0, 1, 1,
0.6323996, 0.6660526, 0.2407589, 0, 0, 0, 1, 1,
0.6361752, -0.7756239, 2.324733, 0, 0, 0, 1, 1,
0.6393276, -0.9789898, 0.7382691, 0, 0, 0, 1, 1,
0.6400287, -1.517336, 3.525895, 0, 0, 0, 1, 1,
0.6415633, -0.04245342, 0.1537647, 0, 0, 0, 1, 1,
0.6560802, 0.2167363, -0.496565, 0, 0, 0, 1, 1,
0.6587628, 2.59656, 0.690758, 0, 0, 0, 1, 1,
0.6589152, -1.082959, 0.8934329, 1, 1, 1, 1, 1,
0.6594974, -0.1502501, 3.898864, 1, 1, 1, 1, 1,
0.6638192, 1.59237, -1.008592, 1, 1, 1, 1, 1,
0.6683618, 0.05229333, 2.285647, 1, 1, 1, 1, 1,
0.6712959, -0.597024, 4.266295, 1, 1, 1, 1, 1,
0.6728563, 0.0230697, 2.468807, 1, 1, 1, 1, 1,
0.6741407, -0.2686737, 1.78299, 1, 1, 1, 1, 1,
0.6797171, -1.135374, 1.989146, 1, 1, 1, 1, 1,
0.6806113, 0.2930848, 0.03517891, 1, 1, 1, 1, 1,
0.6835826, -0.4419279, 1.361286, 1, 1, 1, 1, 1,
0.6898048, -0.1793819, 1.072701, 1, 1, 1, 1, 1,
0.7052267, -0.2617016, 1.460966, 1, 1, 1, 1, 1,
0.7058969, -0.9694933, 1.578398, 1, 1, 1, 1, 1,
0.7068747, 1.05244, 0.582817, 1, 1, 1, 1, 1,
0.7159693, -1.177553, 2.662825, 1, 1, 1, 1, 1,
0.7164668, -0.02300317, 1.342197, 0, 0, 1, 1, 1,
0.7180052, -1.234788, 1.67031, 1, 0, 0, 1, 1,
0.7196571, -0.7835765, 1.973351, 1, 0, 0, 1, 1,
0.7209337, -1.238284, 1.324802, 1, 0, 0, 1, 1,
0.7210171, -0.7924199, 2.527403, 1, 0, 0, 1, 1,
0.7238733, 1.29086, 0.3154512, 1, 0, 0, 1, 1,
0.7265931, 0.7113733, 3.226086, 0, 0, 0, 1, 1,
0.730253, -1.552518, 3.196266, 0, 0, 0, 1, 1,
0.7421142, 0.310349, 0.636417, 0, 0, 0, 1, 1,
0.7466609, -0.5768949, 3.515627, 0, 0, 0, 1, 1,
0.7483211, 0.6256864, 1.356331, 0, 0, 0, 1, 1,
0.7511082, -0.7100123, 2.268252, 0, 0, 0, 1, 1,
0.7513478, -1.159085, 3.220178, 0, 0, 0, 1, 1,
0.7716432, -0.7741919, 0.382991, 1, 1, 1, 1, 1,
0.7765676, 0.3650862, 1.18407, 1, 1, 1, 1, 1,
0.7776014, -1.000128, 2.315668, 1, 1, 1, 1, 1,
0.7832695, 0.875314, 0.06975426, 1, 1, 1, 1, 1,
0.7833444, -0.005215346, 0.8293434, 1, 1, 1, 1, 1,
0.7849228, 0.3648901, 1.384814, 1, 1, 1, 1, 1,
0.7883721, -1.595589, 4.273252, 1, 1, 1, 1, 1,
0.790952, -0.9088507, 2.058996, 1, 1, 1, 1, 1,
0.7939399, -0.2984101, 1.963379, 1, 1, 1, 1, 1,
0.7985454, 0.5099886, 0.3807407, 1, 1, 1, 1, 1,
0.8011101, 0.1318402, 1.78666, 1, 1, 1, 1, 1,
0.8139891, 0.3247113, 1.454658, 1, 1, 1, 1, 1,
0.8304761, 1.309387, 2.406209, 1, 1, 1, 1, 1,
0.8310959, -0.6691101, 3.697943, 1, 1, 1, 1, 1,
0.8330962, -1.151646, 2.751417, 1, 1, 1, 1, 1,
0.8353027, 0.5997072, 0.03328284, 0, 0, 1, 1, 1,
0.8431811, 0.0105206, 1.202052, 1, 0, 0, 1, 1,
0.8492517, 0.7906796, 1.04372, 1, 0, 0, 1, 1,
0.8507393, -1.594804, 2.753359, 1, 0, 0, 1, 1,
0.8523303, 0.563888, 2.073989, 1, 0, 0, 1, 1,
0.8523532, -0.7488808, 1.517485, 1, 0, 0, 1, 1,
0.8549458, 0.723952, 0.9208112, 0, 0, 0, 1, 1,
0.8599774, 1.571522, 0.5901949, 0, 0, 0, 1, 1,
0.8613601, -0.9061771, 0.3525438, 0, 0, 0, 1, 1,
0.8615702, -0.7637257, 3.285907, 0, 0, 0, 1, 1,
0.8658103, 0.2649336, -0.6341687, 0, 0, 0, 1, 1,
0.8696991, -1.6734, 2.086506, 0, 0, 0, 1, 1,
0.8703359, 0.3371056, 0.9096929, 0, 0, 0, 1, 1,
0.8764874, -0.8987175, 1.606508, 1, 1, 1, 1, 1,
0.8781856, 0.7354178, -1.215908, 1, 1, 1, 1, 1,
0.8796374, 1.903052, 1.162759, 1, 1, 1, 1, 1,
0.8828881, -1.763188, 2.985775, 1, 1, 1, 1, 1,
0.8884205, -1.236731, 1.933015, 1, 1, 1, 1, 1,
0.896117, -0.101311, 0.9160572, 1, 1, 1, 1, 1,
0.8961884, -0.8794426, 3.977763, 1, 1, 1, 1, 1,
0.9022084, -0.2286504, 2.698711, 1, 1, 1, 1, 1,
0.9036486, 0.187586, 1.231612, 1, 1, 1, 1, 1,
0.9045025, -0.8739631, 3.247672, 1, 1, 1, 1, 1,
0.9081075, 0.8736163, 0.6364996, 1, 1, 1, 1, 1,
0.9114697, 1.100412, 0.7736034, 1, 1, 1, 1, 1,
0.9119754, 0.1657134, 2.112141, 1, 1, 1, 1, 1,
0.9156967, 0.650623, 1.707313, 1, 1, 1, 1, 1,
0.9176894, 0.3431173, -0.001092348, 1, 1, 1, 1, 1,
0.9234211, 0.3678901, 1.703943, 0, 0, 1, 1, 1,
0.9281946, 0.5641897, 1.912066, 1, 0, 0, 1, 1,
0.9357648, 1.516169, 2.662353, 1, 0, 0, 1, 1,
0.9371207, 2.501985, 0.3173174, 1, 0, 0, 1, 1,
0.9430849, 1.802906, 0.2250761, 1, 0, 0, 1, 1,
0.9440228, 0.9559405, -1.511272, 1, 0, 0, 1, 1,
0.9520108, 0.1663987, 1.227147, 0, 0, 0, 1, 1,
0.9521264, 0.2799074, 0.5746779, 0, 0, 0, 1, 1,
0.9644825, -1.334539, 4.02704, 0, 0, 0, 1, 1,
0.9667693, 1.176028, 0.2636109, 0, 0, 0, 1, 1,
0.968563, 0.3853639, 0.7373733, 0, 0, 0, 1, 1,
0.9699275, 0.009028055, 2.221321, 0, 0, 0, 1, 1,
0.9729453, -0.2753364, -0.3456626, 0, 0, 0, 1, 1,
0.9738376, 0.7772124, 1.519017, 1, 1, 1, 1, 1,
0.9777541, -0.7442686, 3.081234, 1, 1, 1, 1, 1,
0.9785279, -2.065644, 3.017771, 1, 1, 1, 1, 1,
0.981824, -0.7166501, 2.791319, 1, 1, 1, 1, 1,
0.9840266, 0.3374732, 3.53602, 1, 1, 1, 1, 1,
0.9850324, 1.747687, 1.289583, 1, 1, 1, 1, 1,
0.9903264, -0.6485103, 3.563461, 1, 1, 1, 1, 1,
0.9918049, -1.143024, 2.360127, 1, 1, 1, 1, 1,
0.9981549, 0.5597335, 2.514701, 1, 1, 1, 1, 1,
1.000829, 0.4375417, 0.9204007, 1, 1, 1, 1, 1,
1.003191, 0.549687, 1.018404, 1, 1, 1, 1, 1,
1.008581, 2.281375, 0.2136589, 1, 1, 1, 1, 1,
1.009031, 0.8203291, 2.894998, 1, 1, 1, 1, 1,
1.011281, -0.9819803, 3.889579, 1, 1, 1, 1, 1,
1.012396, 0.461657, 0.1511634, 1, 1, 1, 1, 1,
1.014206, 1.068749, -0.8869824, 0, 0, 1, 1, 1,
1.014951, -0.5532008, 3.173645, 1, 0, 0, 1, 1,
1.023909, -0.4470006, 0.9601815, 1, 0, 0, 1, 1,
1.024058, -0.3587895, 1.404154, 1, 0, 0, 1, 1,
1.024776, 0.3939238, -0.2907126, 1, 0, 0, 1, 1,
1.02802, -0.1828509, 2.924017, 1, 0, 0, 1, 1,
1.034228, 0.1911747, 1.416486, 0, 0, 0, 1, 1,
1.037074, 1.129623, 0.173151, 0, 0, 0, 1, 1,
1.04093, -1.025597, 1.748598, 0, 0, 0, 1, 1,
1.046175, -3.140659, 1.877197, 0, 0, 0, 1, 1,
1.048743, -0.4001163, 1.938509, 0, 0, 0, 1, 1,
1.058051, 1.034136, 0.282961, 0, 0, 0, 1, 1,
1.061653, 0.8555232, 1.487396, 0, 0, 0, 1, 1,
1.072246, -1.394612, 1.873574, 1, 1, 1, 1, 1,
1.082299, 1.265342, 0.5332395, 1, 1, 1, 1, 1,
1.083353, 0.1874942, 0.9476357, 1, 1, 1, 1, 1,
1.085355, 0.4304754, 0.1099542, 1, 1, 1, 1, 1,
1.093242, -0.2130776, 2.610902, 1, 1, 1, 1, 1,
1.097342, 0.1319956, 0.6162011, 1, 1, 1, 1, 1,
1.103979, -0.5686018, 4.034405, 1, 1, 1, 1, 1,
1.110647, -0.7582502, 3.152974, 1, 1, 1, 1, 1,
1.112516, 2.0149, 2.305273, 1, 1, 1, 1, 1,
1.123842, -0.8679484, 2.933585, 1, 1, 1, 1, 1,
1.124119, 0.900894, 0.1528048, 1, 1, 1, 1, 1,
1.129663, -0.1259984, -0.5724561, 1, 1, 1, 1, 1,
1.135883, 0.3215467, 0.5532795, 1, 1, 1, 1, 1,
1.14251, 1.15215, 1.041023, 1, 1, 1, 1, 1,
1.169735, 1.804907, 1.019855, 1, 1, 1, 1, 1,
1.17046, -2.80207, 0.5702057, 0, 0, 1, 1, 1,
1.184419, -1.19529, 3.277701, 1, 0, 0, 1, 1,
1.187751, -0.1194281, 1.895725, 1, 0, 0, 1, 1,
1.192427, 0.769855, 1.179344, 1, 0, 0, 1, 1,
1.193061, 0.7863129, 0.002251892, 1, 0, 0, 1, 1,
1.201636, -0.2452639, 2.037536, 1, 0, 0, 1, 1,
1.205221, -1.217114, 3.821175, 0, 0, 0, 1, 1,
1.206043, -3.037858, 3.234786, 0, 0, 0, 1, 1,
1.207632, -0.5811754, 0.7207178, 0, 0, 0, 1, 1,
1.211983, -1.488921, 3.597004, 0, 0, 0, 1, 1,
1.212003, 0.1019548, 3.09723, 0, 0, 0, 1, 1,
1.213579, 0.5463261, 0.7783751, 0, 0, 0, 1, 1,
1.220379, -0.3553747, 3.059163, 0, 0, 0, 1, 1,
1.220646, 0.4184476, 1.344452, 1, 1, 1, 1, 1,
1.220738, 0.4823188, -1.194188, 1, 1, 1, 1, 1,
1.226497, -0.7838147, 3.204268, 1, 1, 1, 1, 1,
1.233665, -1.414721, 2.886429, 1, 1, 1, 1, 1,
1.255154, -0.7648194, 1.268193, 1, 1, 1, 1, 1,
1.267778, -0.01205978, 2.077652, 1, 1, 1, 1, 1,
1.268375, 0.1585299, 1.455992, 1, 1, 1, 1, 1,
1.268779, 2.993428, -0.5546259, 1, 1, 1, 1, 1,
1.289646, -0.5645808, 3.041453, 1, 1, 1, 1, 1,
1.292359, -0.1253507, 1.662669, 1, 1, 1, 1, 1,
1.292448, -1.213792, 1.963763, 1, 1, 1, 1, 1,
1.294962, 1.549972, 1.35711, 1, 1, 1, 1, 1,
1.304368, -0.02997971, 2.290656, 1, 1, 1, 1, 1,
1.304967, 0.6087891, 1.146408, 1, 1, 1, 1, 1,
1.307351, -0.5298277, 0.2445951, 1, 1, 1, 1, 1,
1.311813, -0.08451984, 2.443412, 0, 0, 1, 1, 1,
1.335155, -0.6770531, 1.597109, 1, 0, 0, 1, 1,
1.339872, 0.4887067, 1.512002, 1, 0, 0, 1, 1,
1.34521, -0.5034141, 3.694771, 1, 0, 0, 1, 1,
1.346839, 1.104326, 3.076242, 1, 0, 0, 1, 1,
1.351403, 0.05029143, 0.7680029, 1, 0, 0, 1, 1,
1.354271, 0.4647881, 0.2624789, 0, 0, 0, 1, 1,
1.377104, 0.5385656, 0.5232133, 0, 0, 0, 1, 1,
1.384926, 1.874863, -1.062645, 0, 0, 0, 1, 1,
1.397292, 0.1393391, 2.464818, 0, 0, 0, 1, 1,
1.398022, -1.010821, 2.680773, 0, 0, 0, 1, 1,
1.399573, 1.091094, 2.555243, 0, 0, 0, 1, 1,
1.403558, -1.236871, 1.472443, 0, 0, 0, 1, 1,
1.409982, 1.420403, 0.1382633, 1, 1, 1, 1, 1,
1.415849, 0.5938749, 1.975286, 1, 1, 1, 1, 1,
1.429229, -0.268607, 1.49175, 1, 1, 1, 1, 1,
1.440002, 0.1356379, 0.09072539, 1, 1, 1, 1, 1,
1.443053, 0.1594244, 1.490038, 1, 1, 1, 1, 1,
1.455291, 0.9473436, 0.6296358, 1, 1, 1, 1, 1,
1.466575, 0.6605864, 1.835569, 1, 1, 1, 1, 1,
1.473219, 1.058663, 0.4029366, 1, 1, 1, 1, 1,
1.476853, 0.9046353, -0.6022633, 1, 1, 1, 1, 1,
1.486526, -0.7649408, 2.75038, 1, 1, 1, 1, 1,
1.500961, 2.886731, 1.212324, 1, 1, 1, 1, 1,
1.508987, 1.04047, 2.944385, 1, 1, 1, 1, 1,
1.511695, 1.219398, 0.8026025, 1, 1, 1, 1, 1,
1.521227, 0.2861884, 1.588516, 1, 1, 1, 1, 1,
1.533018, 1.725875, 1.921467, 1, 1, 1, 1, 1,
1.540768, -0.8207951, 2.817985, 0, 0, 1, 1, 1,
1.544069, -0.2313961, 0.2069943, 1, 0, 0, 1, 1,
1.560071, 3.034976, 0.3728724, 1, 0, 0, 1, 1,
1.563468, -1.66948, 2.241355, 1, 0, 0, 1, 1,
1.565303, 0.8559025, -0.05183535, 1, 0, 0, 1, 1,
1.574673, -1.021349, 2.358761, 1, 0, 0, 1, 1,
1.577627, -0.08641961, 2.295942, 0, 0, 0, 1, 1,
1.596593, 0.4525388, 1.469144, 0, 0, 0, 1, 1,
1.608033, 1.479792, 3.037992, 0, 0, 0, 1, 1,
1.617162, -0.5405109, 1.235972, 0, 0, 0, 1, 1,
1.630102, -0.1325057, 1.478315, 0, 0, 0, 1, 1,
1.635431, 0.2356906, 2.27827, 0, 0, 0, 1, 1,
1.639674, 1.324914, -0.1550997, 0, 0, 0, 1, 1,
1.641754, 0.860239, 1.198665, 1, 1, 1, 1, 1,
1.653571, -0.9543773, 1.175711, 1, 1, 1, 1, 1,
1.659782, -1.272322, 0.4274291, 1, 1, 1, 1, 1,
1.66353, -1.179821, 2.968503, 1, 1, 1, 1, 1,
1.673788, 0.8270258, -0.06594726, 1, 1, 1, 1, 1,
1.674531, -0.7189549, -0.2689723, 1, 1, 1, 1, 1,
1.683702, 0.3685115, 2.364459, 1, 1, 1, 1, 1,
1.684811, -0.238732, -0.2416427, 1, 1, 1, 1, 1,
1.685159, -0.2272091, 2.979513, 1, 1, 1, 1, 1,
1.691149, -0.6303492, 0.1128881, 1, 1, 1, 1, 1,
1.691262, 0.1006387, 0.7732068, 1, 1, 1, 1, 1,
1.698855, -0.2450195, 2.882357, 1, 1, 1, 1, 1,
1.698972, 0.4796701, 2.259663, 1, 1, 1, 1, 1,
1.701413, 1.622125, 2.140101, 1, 1, 1, 1, 1,
1.70142, -0.5944881, 3.811735, 1, 1, 1, 1, 1,
1.721056, 0.2291695, 4.388785, 0, 0, 1, 1, 1,
1.738344, -0.3305323, 0.6463573, 1, 0, 0, 1, 1,
1.748669, -1.420243, 3.411155, 1, 0, 0, 1, 1,
1.784464, 0.7509891, 1.056401, 1, 0, 0, 1, 1,
1.788202, 1.138252, 0.6798353, 1, 0, 0, 1, 1,
1.795227, -0.5235627, 0.942879, 1, 0, 0, 1, 1,
1.800084, 0.3626601, 1.159241, 0, 0, 0, 1, 1,
1.802057, 1.044231, 0.4984396, 0, 0, 0, 1, 1,
1.803638, -0.8963181, 1.939265, 0, 0, 0, 1, 1,
1.823861, 0.7666646, 1.65838, 0, 0, 0, 1, 1,
1.825724, 1.651963, 2.439627, 0, 0, 0, 1, 1,
1.86463, -0.2212874, 2.022822, 0, 0, 0, 1, 1,
1.875953, 2.462061, -0.2994689, 0, 0, 0, 1, 1,
1.881533, -0.1829384, 0.321053, 1, 1, 1, 1, 1,
1.897254, -0.2349173, 0.3478111, 1, 1, 1, 1, 1,
1.916009, 0.7386098, 0.4742675, 1, 1, 1, 1, 1,
1.953271, -0.5351607, 3.379595, 1, 1, 1, 1, 1,
1.979595, 0.5617015, 1.218741, 1, 1, 1, 1, 1,
1.998397, 0.2374171, 3.410368, 1, 1, 1, 1, 1,
2.003948, -0.7293662, 2.493254, 1, 1, 1, 1, 1,
2.00472, -0.2791471, 0.7134061, 1, 1, 1, 1, 1,
2.018979, 1.563851, 1.892524, 1, 1, 1, 1, 1,
2.054706, -1.191185, 1.94742, 1, 1, 1, 1, 1,
2.060811, 0.9962415, 1.281547, 1, 1, 1, 1, 1,
2.062379, -1.418996, 1.857332, 1, 1, 1, 1, 1,
2.070912, -0.71531, 2.733677, 1, 1, 1, 1, 1,
2.096289, 1.137084, 2.353741, 1, 1, 1, 1, 1,
2.10307, -0.8883529, 1.957797, 1, 1, 1, 1, 1,
2.130457, -0.6539553, 0.9917262, 0, 0, 1, 1, 1,
2.14243, -0.3370102, 0.8309204, 1, 0, 0, 1, 1,
2.163733, 0.4292459, 2.926929, 1, 0, 0, 1, 1,
2.170611, -0.3524774, 2.932265, 1, 0, 0, 1, 1,
2.178472, -0.8648503, 2.160995, 1, 0, 0, 1, 1,
2.195415, 0.6175734, 0.2432739, 1, 0, 0, 1, 1,
2.206292, -0.2699892, 2.619788, 0, 0, 0, 1, 1,
2.210343, -0.7544885, 2.097437, 0, 0, 0, 1, 1,
2.313275, -0.7768062, 0.7823262, 0, 0, 0, 1, 1,
2.33516, -1.29911, 1.740659, 0, 0, 0, 1, 1,
2.360434, 0.5481576, 2.127826, 0, 0, 0, 1, 1,
2.382338, -0.4269604, 0.15068, 0, 0, 0, 1, 1,
2.402316, 0.6735575, 0.7711812, 0, 0, 0, 1, 1,
2.435333, -1.780446, 0.8137722, 1, 1, 1, 1, 1,
2.452746, -0.3560324, 3.301473, 1, 1, 1, 1, 1,
2.512294, 0.4604367, 1.01831, 1, 1, 1, 1, 1,
2.622944, -1.427208, 0.7329049, 1, 1, 1, 1, 1,
2.746361, 0.5118237, 1.772894, 1, 1, 1, 1, 1,
2.828982, -1.275716, 0.6986321, 1, 1, 1, 1, 1,
3.228745, 1.034681, 1.377093, 1, 1, 1, 1, 1
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
var radius = 9.86907;
var distance = 34.66469;
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
mvMatrix.translate( 0.06975412, -0.0599947, 0.1391721 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.66469);
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
