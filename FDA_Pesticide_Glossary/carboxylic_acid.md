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
-3.025283, 0.1580871, -1.015614, 1, 0, 0, 1,
-2.751072, -0.3628715, -2.902283, 1, 0.007843138, 0, 1,
-2.676498, 0.4187013, -0.7341763, 1, 0.01176471, 0, 1,
-2.433018, 0.8883823, -2.751757, 1, 0.01960784, 0, 1,
-2.426502, 1.53942, -0.6812874, 1, 0.02352941, 0, 1,
-2.337113, 0.1446502, -0.3634337, 1, 0.03137255, 0, 1,
-2.323394, 1.155039, -1.705553, 1, 0.03529412, 0, 1,
-2.280429, 0.03799401, -2.013758, 1, 0.04313726, 0, 1,
-2.24113, 1.846252, -2.053941, 1, 0.04705882, 0, 1,
-2.23005, 1.548684, -1.122977, 1, 0.05490196, 0, 1,
-2.203269, 0.3404749, -1.533668, 1, 0.05882353, 0, 1,
-2.135019, 0.8004639, -0.04090249, 1, 0.06666667, 0, 1,
-2.088916, 0.90381, -1.157398, 1, 0.07058824, 0, 1,
-2.082739, -0.6550137, -1.176324, 1, 0.07843138, 0, 1,
-2.062115, 0.6896342, 0.1575507, 1, 0.08235294, 0, 1,
-2.015229, -1.746478, -0.4019982, 1, 0.09019608, 0, 1,
-2.007867, 0.1176219, -2.304033, 1, 0.09411765, 0, 1,
-1.979393, -0.6430265, -0.9135193, 1, 0.1019608, 0, 1,
-1.968014, 0.5410148, -1.632501, 1, 0.1098039, 0, 1,
-1.953655, -0.4592751, -1.438539, 1, 0.1137255, 0, 1,
-1.947795, 0.04917591, -0.6941108, 1, 0.1215686, 0, 1,
-1.923991, -0.4509126, -1.845143, 1, 0.1254902, 0, 1,
-1.890248, -0.1665584, -3.311396, 1, 0.1333333, 0, 1,
-1.888113, -0.1302767, -1.042447, 1, 0.1372549, 0, 1,
-1.886804, -2.172463, -1.294157, 1, 0.145098, 0, 1,
-1.884149, 0.03617947, -3.080614, 1, 0.1490196, 0, 1,
-1.881163, -0.4377946, -1.549639, 1, 0.1568628, 0, 1,
-1.875321, -0.3436258, 0.5269368, 1, 0.1607843, 0, 1,
-1.854641, 1.122294, 0.05728581, 1, 0.1686275, 0, 1,
-1.837281, -0.1185491, -1.231831, 1, 0.172549, 0, 1,
-1.815202, 0.6484011, -1.713633, 1, 0.1803922, 0, 1,
-1.813936, 0.3493937, -0.2873447, 1, 0.1843137, 0, 1,
-1.774621, -0.8738735, -1.926429, 1, 0.1921569, 0, 1,
-1.76789, -2.018162, -1.212534, 1, 0.1960784, 0, 1,
-1.743513, 0.8965663, 1.765155, 1, 0.2039216, 0, 1,
-1.730627, -2.117923, -1.240021, 1, 0.2117647, 0, 1,
-1.69442, -0.3181806, -3.222617, 1, 0.2156863, 0, 1,
-1.674798, -0.5649453, -2.150607, 1, 0.2235294, 0, 1,
-1.674452, 0.58236, -0.267227, 1, 0.227451, 0, 1,
-1.673179, 1.031726, -0.4381681, 1, 0.2352941, 0, 1,
-1.669247, 0.4656339, -1.15115, 1, 0.2392157, 0, 1,
-1.669224, -0.1878062, -1.742595, 1, 0.2470588, 0, 1,
-1.661277, -1.361137, -1.899145, 1, 0.2509804, 0, 1,
-1.646893, -0.1753881, 0.3465588, 1, 0.2588235, 0, 1,
-1.63602, 2.186695, 0.8063237, 1, 0.2627451, 0, 1,
-1.614871, 0.3832902, 0.2429219, 1, 0.2705882, 0, 1,
-1.608561, 0.2972252, -1.602409, 1, 0.2745098, 0, 1,
-1.606583, 0.2708307, -1.365793, 1, 0.282353, 0, 1,
-1.595258, -0.3357984, -3.379167, 1, 0.2862745, 0, 1,
-1.585095, -0.4650407, 0.4044431, 1, 0.2941177, 0, 1,
-1.580243, -0.577081, -1.106852, 1, 0.3019608, 0, 1,
-1.575449, -1.941733, -3.826993, 1, 0.3058824, 0, 1,
-1.569063, 0.3421185, -2.737529, 1, 0.3137255, 0, 1,
-1.567364, -1.29485, 0.2844615, 1, 0.3176471, 0, 1,
-1.56634, -2.700351, -2.723272, 1, 0.3254902, 0, 1,
-1.563846, -1.33797, -3.785699, 1, 0.3294118, 0, 1,
-1.560871, -1.19364, -1.573499, 1, 0.3372549, 0, 1,
-1.54854, -1.111325, -2.623968, 1, 0.3411765, 0, 1,
-1.539863, 2.572893, -2.179162, 1, 0.3490196, 0, 1,
-1.527884, 0.912209, -1.183011, 1, 0.3529412, 0, 1,
-1.501875, -1.465869, -2.805962, 1, 0.3607843, 0, 1,
-1.48262, -1.81343, -3.211839, 1, 0.3647059, 0, 1,
-1.482097, -0.6293876, -2.328529, 1, 0.372549, 0, 1,
-1.454968, -0.3572382, -2.464524, 1, 0.3764706, 0, 1,
-1.448217, -0.9049105, -4.273135, 1, 0.3843137, 0, 1,
-1.438068, -0.458503, -1.727114, 1, 0.3882353, 0, 1,
-1.426191, -1.868821, -3.921201, 1, 0.3960784, 0, 1,
-1.423339, 1.073055, -2.124151, 1, 0.4039216, 0, 1,
-1.413398, -1.911666, -2.081371, 1, 0.4078431, 0, 1,
-1.408275, -1.705963, -0.2021509, 1, 0.4156863, 0, 1,
-1.402361, -0.5777025, -0.5028737, 1, 0.4196078, 0, 1,
-1.400024, -0.215489, -1.384478, 1, 0.427451, 0, 1,
-1.399208, -0.1843121, -1.378041, 1, 0.4313726, 0, 1,
-1.38084, -0.5191504, -1.012104, 1, 0.4392157, 0, 1,
-1.378237, 1.670238, 0.3993432, 1, 0.4431373, 0, 1,
-1.368672, 0.8079482, -1.149345, 1, 0.4509804, 0, 1,
-1.367261, 0.5937688, -3.143244, 1, 0.454902, 0, 1,
-1.352194, -1.625237, -1.680649, 1, 0.4627451, 0, 1,
-1.344148, 2.164154, -0.3323508, 1, 0.4666667, 0, 1,
-1.342947, -0.6061836, -2.790621, 1, 0.4745098, 0, 1,
-1.339569, -0.4851013, -1.550953, 1, 0.4784314, 0, 1,
-1.327765, 1.600275, -0.6529526, 1, 0.4862745, 0, 1,
-1.326371, 0.6553513, -4.16478, 1, 0.4901961, 0, 1,
-1.316229, 0.5791574, 0.07615235, 1, 0.4980392, 0, 1,
-1.311125, 0.3055446, -1.351055, 1, 0.5058824, 0, 1,
-1.305157, -0.4851647, -1.106924, 1, 0.509804, 0, 1,
-1.301783, -0.02876675, -1.687286, 1, 0.5176471, 0, 1,
-1.299516, 1.104132, -1.743087, 1, 0.5215687, 0, 1,
-1.283679, 0.3522312, -1.264459, 1, 0.5294118, 0, 1,
-1.280274, 0.1181833, -0.2940644, 1, 0.5333334, 0, 1,
-1.279286, -2.493685, -3.167256, 1, 0.5411765, 0, 1,
-1.274116, -0.4108244, -3.171491, 1, 0.5450981, 0, 1,
-1.2736, -1.289583, -1.669694, 1, 0.5529412, 0, 1,
-1.272839, -0.6079457, -1.750577, 1, 0.5568628, 0, 1,
-1.262876, -0.09220547, -0.5993606, 1, 0.5647059, 0, 1,
-1.25751, 1.74555, -2.11595, 1, 0.5686275, 0, 1,
-1.256484, -0.6113144, -3.776088, 1, 0.5764706, 0, 1,
-1.24196, -0.2255904, -3.028065, 1, 0.5803922, 0, 1,
-1.234985, 0.6940869, -1.948092, 1, 0.5882353, 0, 1,
-1.234689, -1.265889, -3.320043, 1, 0.5921569, 0, 1,
-1.230598, 0.8930289, -1.15789, 1, 0.6, 0, 1,
-1.222158, 1.249268, -1.901435, 1, 0.6078432, 0, 1,
-1.220109, -0.832399, -1.684003, 1, 0.6117647, 0, 1,
-1.201879, 0.4397782, -0.1487442, 1, 0.6196079, 0, 1,
-1.199149, -2.20611, -2.795427, 1, 0.6235294, 0, 1,
-1.195647, -0.3836729, 0.04432653, 1, 0.6313726, 0, 1,
-1.194941, -1.082642, -2.288707, 1, 0.6352941, 0, 1,
-1.191999, 1.369633, -1.259391, 1, 0.6431373, 0, 1,
-1.187802, 1.752418, 1.496331, 1, 0.6470588, 0, 1,
-1.184032, 2.422084, -0.1246876, 1, 0.654902, 0, 1,
-1.17988, -0.7519176, -0.4919716, 1, 0.6588235, 0, 1,
-1.178624, 0.6236212, -2.510871, 1, 0.6666667, 0, 1,
-1.178288, 0.3253269, -2.342772, 1, 0.6705883, 0, 1,
-1.170626, -1.512992, -3.234783, 1, 0.6784314, 0, 1,
-1.167317, -0.02782167, -2.889159, 1, 0.682353, 0, 1,
-1.159495, 0.8261299, -1.346069, 1, 0.6901961, 0, 1,
-1.15714, 0.5165124, -1.025211, 1, 0.6941177, 0, 1,
-1.153371, -0.5624034, 0.05870515, 1, 0.7019608, 0, 1,
-1.150614, 0.6483849, -2.553945, 1, 0.7098039, 0, 1,
-1.145084, -0.7863071, -2.761098, 1, 0.7137255, 0, 1,
-1.144245, 0.668595, -1.695094, 1, 0.7215686, 0, 1,
-1.128235, -0.7561827, -2.727065, 1, 0.7254902, 0, 1,
-1.125629, 2.530791, -0.817252, 1, 0.7333333, 0, 1,
-1.118043, -1.22638, -3.771955, 1, 0.7372549, 0, 1,
-1.114851, -0.7311552, -2.086368, 1, 0.7450981, 0, 1,
-1.114538, -0.5699278, -1.362245, 1, 0.7490196, 0, 1,
-1.106003, 1.621336, -0.1415581, 1, 0.7568628, 0, 1,
-1.103844, 0.9476929, -2.252722, 1, 0.7607843, 0, 1,
-1.10341, 1.224974, -0.5803685, 1, 0.7686275, 0, 1,
-1.1, -0.8299593, -2.935274, 1, 0.772549, 0, 1,
-1.095952, -0.6936853, -1.533757, 1, 0.7803922, 0, 1,
-1.093482, 0.06498227, -0.358074, 1, 0.7843137, 0, 1,
-1.092018, -0.1819243, -0.4670627, 1, 0.7921569, 0, 1,
-1.090665, -2.175503, -3.401888, 1, 0.7960784, 0, 1,
-1.088859, 0.1937908, -0.8758175, 1, 0.8039216, 0, 1,
-1.079441, -0.7702771, -2.636964, 1, 0.8117647, 0, 1,
-1.074269, -0.7118988, -2.167747, 1, 0.8156863, 0, 1,
-1.073752, -1.206425, -2.014186, 1, 0.8235294, 0, 1,
-1.067566, 0.09942438, 0.4754441, 1, 0.827451, 0, 1,
-1.067382, 0.2065823, -4.193767, 1, 0.8352941, 0, 1,
-1.061895, -1.336465, -3.118031, 1, 0.8392157, 0, 1,
-1.061584, -0.7898005, -2.236797, 1, 0.8470588, 0, 1,
-1.060639, -1.008812, -4.147493, 1, 0.8509804, 0, 1,
-1.059501, 0.6269214, -0.5468628, 1, 0.8588235, 0, 1,
-1.055645, -0.09022501, -3.850949, 1, 0.8627451, 0, 1,
-1.054467, 1.371153, -0.2438836, 1, 0.8705882, 0, 1,
-1.051742, -1.366054, -2.265176, 1, 0.8745098, 0, 1,
-1.047055, 0.4206879, -1.101501, 1, 0.8823529, 0, 1,
-1.045595, -1.683562, -2.176383, 1, 0.8862745, 0, 1,
-1.043107, 1.276512, -2.969474, 1, 0.8941177, 0, 1,
-1.0426, -2.105113, -1.531788, 1, 0.8980392, 0, 1,
-1.039717, 0.7408775, -0.4357403, 1, 0.9058824, 0, 1,
-1.033617, -0.7599631, -0.5542421, 1, 0.9137255, 0, 1,
-1.029323, 0.06539165, -1.687347, 1, 0.9176471, 0, 1,
-1.023362, -0.3365625, -2.474816, 1, 0.9254902, 0, 1,
-1.020689, 0.01072119, -3.060572, 1, 0.9294118, 0, 1,
-1.016474, 0.4219647, -0.1144315, 1, 0.9372549, 0, 1,
-1.015934, 0.9313033, -1.834942, 1, 0.9411765, 0, 1,
-1.015083, 2.669253, -0.7148389, 1, 0.9490196, 0, 1,
-1.013828, 0.6152637, -1.368148, 1, 0.9529412, 0, 1,
-1.012287, 1.231671, -0.5768937, 1, 0.9607843, 0, 1,
-1.012056, -0.8634319, -1.994752, 1, 0.9647059, 0, 1,
-1.011512, 0.8360057, 0.08151323, 1, 0.972549, 0, 1,
-1.007654, -0.02886592, -0.5216509, 1, 0.9764706, 0, 1,
-1.007251, 0.3881981, -2.21285, 1, 0.9843137, 0, 1,
-1.004588, 0.1401267, -1.295371, 1, 0.9882353, 0, 1,
-1.003309, -0.2596834, -1.304764, 1, 0.9960784, 0, 1,
-1.001858, 0.2355148, -1.989619, 0.9960784, 1, 0, 1,
-1.001759, -0.5724795, -1.347014, 0.9921569, 1, 0, 1,
-0.9960221, -0.7398103, -2.813653, 0.9843137, 1, 0, 1,
-0.9876228, -0.02041321, -1.373058, 0.9803922, 1, 0, 1,
-0.9837416, -0.03800846, -1.111091, 0.972549, 1, 0, 1,
-0.9788681, 0.3796013, -2.462224, 0.9686275, 1, 0, 1,
-0.9704896, 2.004243, -0.3123433, 0.9607843, 1, 0, 1,
-0.9666258, -1.634711, -3.91506, 0.9568627, 1, 0, 1,
-0.9597385, 0.9906013, 0.1678708, 0.9490196, 1, 0, 1,
-0.9592767, 1.250506, 0.7886276, 0.945098, 1, 0, 1,
-0.9564114, -0.2260234, -2.794527, 0.9372549, 1, 0, 1,
-0.9542785, -0.6492884, -3.466649, 0.9333333, 1, 0, 1,
-0.9518829, -0.1345471, -2.108508, 0.9254902, 1, 0, 1,
-0.9235684, 0.01079465, -1.076949, 0.9215686, 1, 0, 1,
-0.9220794, 0.8371589, -0.4651253, 0.9137255, 1, 0, 1,
-0.9199845, -0.4494568, -2.515035, 0.9098039, 1, 0, 1,
-0.9066279, 0.09330146, -1.344246, 0.9019608, 1, 0, 1,
-0.9060561, -0.2736887, -0.4950643, 0.8941177, 1, 0, 1,
-0.899715, -1.91253, -1.901241, 0.8901961, 1, 0, 1,
-0.8965715, -1.061614, -1.772321, 0.8823529, 1, 0, 1,
-0.8939591, -0.810285, -1.125093, 0.8784314, 1, 0, 1,
-0.8916002, 0.1344974, -2.759662, 0.8705882, 1, 0, 1,
-0.8866935, 0.09678841, -2.561145, 0.8666667, 1, 0, 1,
-0.8862152, 0.1267615, -3.117687, 0.8588235, 1, 0, 1,
-0.8829698, 1.845651, -1.471873, 0.854902, 1, 0, 1,
-0.8800139, -0.8542727, -1.929239, 0.8470588, 1, 0, 1,
-0.8752119, -0.3884266, -1.36623, 0.8431373, 1, 0, 1,
-0.8741698, 0.4219086, 1.969791, 0.8352941, 1, 0, 1,
-0.8718279, -0.04447851, -1.792426, 0.8313726, 1, 0, 1,
-0.870918, 1.009925, -1.271881, 0.8235294, 1, 0, 1,
-0.8629976, 0.1735577, -2.31708, 0.8196079, 1, 0, 1,
-0.8606103, -1.125461, -1.709749, 0.8117647, 1, 0, 1,
-0.8562974, -1.576355, -3.614418, 0.8078431, 1, 0, 1,
-0.8548763, 2.315491, 1.288369, 0.8, 1, 0, 1,
-0.8522416, 0.1358174, -0.7057192, 0.7921569, 1, 0, 1,
-0.8461338, 0.005565008, -1.731368, 0.7882353, 1, 0, 1,
-0.8442013, -0.2474257, -0.5216112, 0.7803922, 1, 0, 1,
-0.8427046, -1.104208, -2.557473, 0.7764706, 1, 0, 1,
-0.839818, -0.6680548, -1.69755, 0.7686275, 1, 0, 1,
-0.8294594, -1.086937, -2.459738, 0.7647059, 1, 0, 1,
-0.8166627, 0.964403, -1.578244, 0.7568628, 1, 0, 1,
-0.8142118, -0.02393341, -2.14525, 0.7529412, 1, 0, 1,
-0.8128518, 0.9348339, -0.4754227, 0.7450981, 1, 0, 1,
-0.8064801, 0.8886513, 0.2448856, 0.7411765, 1, 0, 1,
-0.8044741, 0.3567367, -1.281737, 0.7333333, 1, 0, 1,
-0.7977111, 0.3573956, -1.972173, 0.7294118, 1, 0, 1,
-0.7956834, -0.2201555, -0.2550931, 0.7215686, 1, 0, 1,
-0.7949329, 0.2638033, -2.177187, 0.7176471, 1, 0, 1,
-0.7943183, -0.1498011, -2.499214, 0.7098039, 1, 0, 1,
-0.7909476, -0.1801462, 0.3345856, 0.7058824, 1, 0, 1,
-0.7906613, 0.294482, -2.141381, 0.6980392, 1, 0, 1,
-0.790483, 1.120951, 0.01348211, 0.6901961, 1, 0, 1,
-0.7798115, -1.107097, -2.288627, 0.6862745, 1, 0, 1,
-0.7771634, -0.863394, -1.873711, 0.6784314, 1, 0, 1,
-0.7735205, -0.1427133, -1.984906, 0.6745098, 1, 0, 1,
-0.7713125, -0.7035179, -1.286698, 0.6666667, 1, 0, 1,
-0.7586498, 0.3582141, -2.195657, 0.6627451, 1, 0, 1,
-0.7578384, 1.068363, 0.07730144, 0.654902, 1, 0, 1,
-0.7567412, -1.185423, -2.001078, 0.6509804, 1, 0, 1,
-0.7535502, 0.7130828, -0.2427359, 0.6431373, 1, 0, 1,
-0.7530103, 1.072871, 0.363941, 0.6392157, 1, 0, 1,
-0.7489069, 0.7767686, -1.38824, 0.6313726, 1, 0, 1,
-0.7484559, -0.003223203, -0.8673378, 0.627451, 1, 0, 1,
-0.7430438, -0.2594409, -1.729167, 0.6196079, 1, 0, 1,
-0.7428989, 0.7629642, 1.029108, 0.6156863, 1, 0, 1,
-0.7424085, -0.09228709, -1.887785, 0.6078432, 1, 0, 1,
-0.7420452, -1.064466, -2.665468, 0.6039216, 1, 0, 1,
-0.739527, -1.614415, -2.345876, 0.5960785, 1, 0, 1,
-0.7389875, 0.227806, 0.1827688, 0.5882353, 1, 0, 1,
-0.7368709, 0.2442662, -0.8767427, 0.5843138, 1, 0, 1,
-0.7347322, 1.038349, -0.9128464, 0.5764706, 1, 0, 1,
-0.7186259, 0.6442443, -1.023504, 0.572549, 1, 0, 1,
-0.7171723, 1.157289, -2.203212, 0.5647059, 1, 0, 1,
-0.7141687, 2.057064, -0.7668984, 0.5607843, 1, 0, 1,
-0.7020094, 0.02985228, -3.752129, 0.5529412, 1, 0, 1,
-0.7004428, 1.532232, 0.5624203, 0.5490196, 1, 0, 1,
-0.6956719, 0.02943513, -1.388739, 0.5411765, 1, 0, 1,
-0.6914827, -0.8179435, -3.44138, 0.5372549, 1, 0, 1,
-0.6895884, -1.447927, -2.539866, 0.5294118, 1, 0, 1,
-0.6855436, 0.2460397, -1.160594, 0.5254902, 1, 0, 1,
-0.6768484, 1.026207, -1.142874, 0.5176471, 1, 0, 1,
-0.6739364, 0.4200448, -0.4544269, 0.5137255, 1, 0, 1,
-0.6738667, 2.073348, -0.2542979, 0.5058824, 1, 0, 1,
-0.6725664, -0.5107231, -3.469193, 0.5019608, 1, 0, 1,
-0.6711612, 1.539166, -0.8150319, 0.4941176, 1, 0, 1,
-0.6711601, 1.469738, 0.6556498, 0.4862745, 1, 0, 1,
-0.6698623, -1.393282, -1.8579, 0.4823529, 1, 0, 1,
-0.6677104, -2.083639, -2.723111, 0.4745098, 1, 0, 1,
-0.6670058, 1.811392, -0.1869952, 0.4705882, 1, 0, 1,
-0.6659572, 2.862928, 0.2259011, 0.4627451, 1, 0, 1,
-0.6654983, -1.115553, -3.070638, 0.4588235, 1, 0, 1,
-0.6623683, 1.174381, -2.041424, 0.4509804, 1, 0, 1,
-0.6618415, 0.8799376, 1.733803, 0.4470588, 1, 0, 1,
-0.6615348, -0.2282424, -1.850585, 0.4392157, 1, 0, 1,
-0.6608264, -0.3259036, -3.808447, 0.4352941, 1, 0, 1,
-0.6569337, 1.078406, -0.2566651, 0.427451, 1, 0, 1,
-0.6554711, 1.712393, -0.3779015, 0.4235294, 1, 0, 1,
-0.6551067, -0.1330509, -0.4546886, 0.4156863, 1, 0, 1,
-0.6495329, -0.08151681, -3.437097, 0.4117647, 1, 0, 1,
-0.6465076, 0.3944162, -2.188903, 0.4039216, 1, 0, 1,
-0.6461293, -0.2092775, -3.970502, 0.3960784, 1, 0, 1,
-0.6337921, -0.6920345, -0.1386791, 0.3921569, 1, 0, 1,
-0.6272804, 1.373879, -0.3945497, 0.3843137, 1, 0, 1,
-0.6256213, -0.08928166, -1.972367, 0.3803922, 1, 0, 1,
-0.6236823, 0.06943276, -2.526197, 0.372549, 1, 0, 1,
-0.6227523, -2.391436, -4.500114, 0.3686275, 1, 0, 1,
-0.6203168, -0.2439522, -1.744508, 0.3607843, 1, 0, 1,
-0.6165398, 0.2819045, -1.977506, 0.3568628, 1, 0, 1,
-0.6149547, 0.003279658, -2.982368, 0.3490196, 1, 0, 1,
-0.6110364, 0.5524311, -0.03601382, 0.345098, 1, 0, 1,
-0.6093867, 1.215733, 1.142783, 0.3372549, 1, 0, 1,
-0.6089668, -0.8836782, -2.075406, 0.3333333, 1, 0, 1,
-0.6055177, -0.8079001, -2.875356, 0.3254902, 1, 0, 1,
-0.6035039, -0.6629782, -1.920525, 0.3215686, 1, 0, 1,
-0.5981827, -0.2172065, -0.3979309, 0.3137255, 1, 0, 1,
-0.5929176, -1.652101, -2.858119, 0.3098039, 1, 0, 1,
-0.5924631, -0.8440424, -1.287259, 0.3019608, 1, 0, 1,
-0.5912424, -1.161092, -1.6377, 0.2941177, 1, 0, 1,
-0.5886875, -0.7227365, -3.252063, 0.2901961, 1, 0, 1,
-0.5870455, 0.6795509, -0.7056823, 0.282353, 1, 0, 1,
-0.5786315, -0.3475843, -0.60124, 0.2784314, 1, 0, 1,
-0.5718402, -1.067781, -2.78862, 0.2705882, 1, 0, 1,
-0.5604835, -0.9997433, -3.331013, 0.2666667, 1, 0, 1,
-0.5562352, 0.829295, -1.4047, 0.2588235, 1, 0, 1,
-0.5560626, -0.2336709, -2.558499, 0.254902, 1, 0, 1,
-0.5554804, 0.2449262, -2.854071, 0.2470588, 1, 0, 1,
-0.5527613, -0.6908379, -1.699279, 0.2431373, 1, 0, 1,
-0.5429536, -0.7438751, -1.946081, 0.2352941, 1, 0, 1,
-0.5395675, 0.9658449, -1.307101, 0.2313726, 1, 0, 1,
-0.5392837, -0.7879372, -2.856722, 0.2235294, 1, 0, 1,
-0.5390857, -0.4624319, -1.278861, 0.2196078, 1, 0, 1,
-0.5374815, -0.2325095, -2.137582, 0.2117647, 1, 0, 1,
-0.5359071, 0.3759518, -1.40916, 0.2078431, 1, 0, 1,
-0.5350595, 0.8068661, -1.295371, 0.2, 1, 0, 1,
-0.5342348, 0.3417239, -1.436297, 0.1921569, 1, 0, 1,
-0.5317513, 0.7278773, -0.3979248, 0.1882353, 1, 0, 1,
-0.5315029, -0.6672493, -1.694033, 0.1803922, 1, 0, 1,
-0.528264, 0.9455364, 1.614004, 0.1764706, 1, 0, 1,
-0.5244572, -0.2926362, -3.19039, 0.1686275, 1, 0, 1,
-0.5210525, -0.6666451, -3.631547, 0.1647059, 1, 0, 1,
-0.516735, 0.3308497, 0.6275823, 0.1568628, 1, 0, 1,
-0.5086012, 1.229924, -0.3583088, 0.1529412, 1, 0, 1,
-0.5065216, -0.1647827, -0.7949885, 0.145098, 1, 0, 1,
-0.5062026, -0.4724351, -2.793481, 0.1411765, 1, 0, 1,
-0.5008017, 0.2570658, -1.872009, 0.1333333, 1, 0, 1,
-0.4986427, 0.04338891, -1.515291, 0.1294118, 1, 0, 1,
-0.4971234, -1.168216, -3.130248, 0.1215686, 1, 0, 1,
-0.4968333, 0.2291317, -0.8122132, 0.1176471, 1, 0, 1,
-0.4941299, -0.5688171, 1.075212, 0.1098039, 1, 0, 1,
-0.4934776, 0.3013102, -2.193166, 0.1058824, 1, 0, 1,
-0.4888712, -1.892931, -3.142092, 0.09803922, 1, 0, 1,
-0.4882555, -0.367514, -3.116328, 0.09019608, 1, 0, 1,
-0.484029, 1.24833, 0.6237347, 0.08627451, 1, 0, 1,
-0.4840235, 0.9452494, -0.9347776, 0.07843138, 1, 0, 1,
-0.482043, -0.306096, -3.338536, 0.07450981, 1, 0, 1,
-0.4794644, -0.8672929, -3.525877, 0.06666667, 1, 0, 1,
-0.4769355, 1.249591, -1.085034, 0.0627451, 1, 0, 1,
-0.4762779, 1.184912, 0.1931793, 0.05490196, 1, 0, 1,
-0.4756587, -1.489446, -3.282403, 0.05098039, 1, 0, 1,
-0.4752171, -1.874302, -3.485161, 0.04313726, 1, 0, 1,
-0.4687275, -0.9782108, -1.575405, 0.03921569, 1, 0, 1,
-0.468324, -1.434147, -2.36481, 0.03137255, 1, 0, 1,
-0.4582776, 0.8732255, -1.012712, 0.02745098, 1, 0, 1,
-0.4551054, 0.1640606, -0.5881624, 0.01960784, 1, 0, 1,
-0.4514452, -0.07134903, -2.215106, 0.01568628, 1, 0, 1,
-0.450003, -0.4241976, -3.305102, 0.007843138, 1, 0, 1,
-0.4354515, -1.251263, -1.817128, 0.003921569, 1, 0, 1,
-0.43386, 0.2964091, -0.3423643, 0, 1, 0.003921569, 1,
-0.4268177, -0.1897188, -3.896911, 0, 1, 0.01176471, 1,
-0.413416, -0.5345732, -2.610357, 0, 1, 0.01568628, 1,
-0.4033433, 1.301411, -1.199168, 0, 1, 0.02352941, 1,
-0.3984477, 2.006982, -0.001718534, 0, 1, 0.02745098, 1,
-0.3932585, 0.3723941, 0.2477314, 0, 1, 0.03529412, 1,
-0.3929988, 0.4152632, -1.262842, 0, 1, 0.03921569, 1,
-0.3929422, -0.5276288, -2.867289, 0, 1, 0.04705882, 1,
-0.3905839, 0.3568052, -2.140307, 0, 1, 0.05098039, 1,
-0.3876503, -2.533814, -4.60243, 0, 1, 0.05882353, 1,
-0.37977, 0.006050724, -1.531838, 0, 1, 0.0627451, 1,
-0.3760848, -0.6795992, -2.379448, 0, 1, 0.07058824, 1,
-0.3757944, -0.2013098, -1.881483, 0, 1, 0.07450981, 1,
-0.3733845, 0.7143704, -0.9090345, 0, 1, 0.08235294, 1,
-0.3722776, 0.1030878, -1.093357, 0, 1, 0.08627451, 1,
-0.3707318, 0.9550687, -0.5504693, 0, 1, 0.09411765, 1,
-0.3697258, 0.6652364, -1.44647, 0, 1, 0.1019608, 1,
-0.3662522, 0.04932228, -2.598273, 0, 1, 0.1058824, 1,
-0.3613968, 1.786434, -0.6912699, 0, 1, 0.1137255, 1,
-0.3596355, 0.7428898, 1.02633, 0, 1, 0.1176471, 1,
-0.355505, 0.7621789, -2.192942, 0, 1, 0.1254902, 1,
-0.3482269, 0.541611, 0.4838185, 0, 1, 0.1294118, 1,
-0.3476191, 1.822862, -0.0459719, 0, 1, 0.1372549, 1,
-0.3420719, 1.325006, 0.6986818, 0, 1, 0.1411765, 1,
-0.3411353, -1.343999, -1.53156, 0, 1, 0.1490196, 1,
-0.3398108, 0.2613594, -0.7271593, 0, 1, 0.1529412, 1,
-0.3388707, -1.572594, -3.929687, 0, 1, 0.1607843, 1,
-0.3387834, -2.859265, -4.592277, 0, 1, 0.1647059, 1,
-0.3349791, -0.1389851, -1.667686, 0, 1, 0.172549, 1,
-0.3338695, 0.9513963, -1.336504, 0, 1, 0.1764706, 1,
-0.3316541, -0.5526132, -2.4462, 0, 1, 0.1843137, 1,
-0.331027, 1.171011, -0.2209436, 0, 1, 0.1882353, 1,
-0.3305401, 0.512068, 0.7083498, 0, 1, 0.1960784, 1,
-0.3288491, -0.8799126, -3.3225, 0, 1, 0.2039216, 1,
-0.3264842, -0.4443464, -1.510698, 0, 1, 0.2078431, 1,
-0.3250028, -1.531971, -3.482353, 0, 1, 0.2156863, 1,
-0.3245347, -1.09877, -2.717947, 0, 1, 0.2196078, 1,
-0.321019, -1.954748, -3.101173, 0, 1, 0.227451, 1,
-0.3184747, -0.3056032, -3.020086, 0, 1, 0.2313726, 1,
-0.3178645, -0.9231029, -2.062404, 0, 1, 0.2392157, 1,
-0.316349, -0.1553522, -3.390508, 0, 1, 0.2431373, 1,
-0.3155492, -2.662897, -4.920589, 0, 1, 0.2509804, 1,
-0.3130856, -1.251451, -3.570337, 0, 1, 0.254902, 1,
-0.3117781, -1.081767, -4.538318, 0, 1, 0.2627451, 1,
-0.3073791, 0.310429, 0.7022372, 0, 1, 0.2666667, 1,
-0.3064356, -0.0210579, -0.9841615, 0, 1, 0.2745098, 1,
-0.3005396, -0.8550233, -4.111457, 0, 1, 0.2784314, 1,
-0.2960384, 0.1118613, -0.3428384, 0, 1, 0.2862745, 1,
-0.2956882, -0.1605259, -1.678128, 0, 1, 0.2901961, 1,
-0.2930896, 0.265415, 0.5772609, 0, 1, 0.2980392, 1,
-0.2916538, -0.519681, -1.550231, 0, 1, 0.3058824, 1,
-0.2910104, -1.638989, -3.436435, 0, 1, 0.3098039, 1,
-0.2897103, -0.3949094, -2.396883, 0, 1, 0.3176471, 1,
-0.289452, 0.3582399, -0.9083465, 0, 1, 0.3215686, 1,
-0.2891611, -1.193614, -2.039605, 0, 1, 0.3294118, 1,
-0.2880539, 0.05343235, -1.62112, 0, 1, 0.3333333, 1,
-0.2828946, 1.941451, -0.8852577, 0, 1, 0.3411765, 1,
-0.2813925, -0.564113, -3.27898, 0, 1, 0.345098, 1,
-0.2785498, -1.301231, -1.872561, 0, 1, 0.3529412, 1,
-0.2757756, 1.109345, -0.3900695, 0, 1, 0.3568628, 1,
-0.273614, 0.7979612, 0.8835797, 0, 1, 0.3647059, 1,
-0.271852, -0.2597805, -1.238941, 0, 1, 0.3686275, 1,
-0.2685566, -0.9538706, -2.29912, 0, 1, 0.3764706, 1,
-0.2660426, -0.3700544, -3.181508, 0, 1, 0.3803922, 1,
-0.2647114, 0.711158, -1.238778, 0, 1, 0.3882353, 1,
-0.2599857, -0.8873464, -2.955097, 0, 1, 0.3921569, 1,
-0.2512963, 0.3921549, -0.4226444, 0, 1, 0.4, 1,
-0.2490145, 0.2523514, -0.909304, 0, 1, 0.4078431, 1,
-0.2432218, -0.003057014, -0.9114217, 0, 1, 0.4117647, 1,
-0.2415353, 0.7130224, 0.627503, 0, 1, 0.4196078, 1,
-0.2404972, -0.7337682, -2.984122, 0, 1, 0.4235294, 1,
-0.2402608, -0.2338231, -2.775594, 0, 1, 0.4313726, 1,
-0.2338926, -1.918385, -0.8194342, 0, 1, 0.4352941, 1,
-0.226768, -0.06779339, -1.099005, 0, 1, 0.4431373, 1,
-0.2267044, 1.24968, 0.8015216, 0, 1, 0.4470588, 1,
-0.2263536, -0.9612826, -3.372653, 0, 1, 0.454902, 1,
-0.2262686, 0.07433826, 0.5786331, 0, 1, 0.4588235, 1,
-0.2240576, -0.7979625, -3.69133, 0, 1, 0.4666667, 1,
-0.2212327, -0.3167579, -1.623955, 0, 1, 0.4705882, 1,
-0.2147073, -0.06518578, -2.477686, 0, 1, 0.4784314, 1,
-0.2134692, 0.681547, -0.6462249, 0, 1, 0.4823529, 1,
-0.2132871, 1.26184, 0.4352919, 0, 1, 0.4901961, 1,
-0.2102122, 0.9523343, -1.777549, 0, 1, 0.4941176, 1,
-0.2078406, 2.131747, -1.139431, 0, 1, 0.5019608, 1,
-0.2066403, 1.20844, -1.947952, 0, 1, 0.509804, 1,
-0.2047885, 2.315893, -0.6713296, 0, 1, 0.5137255, 1,
-0.2039898, 0.6084508, 0.3677572, 0, 1, 0.5215687, 1,
-0.1947875, 1.182912, -0.2794704, 0, 1, 0.5254902, 1,
-0.1903966, -0.3312402, -1.975265, 0, 1, 0.5333334, 1,
-0.1853695, -1.906138, -1.396573, 0, 1, 0.5372549, 1,
-0.1791098, -0.9121045, -3.601585, 0, 1, 0.5450981, 1,
-0.1767713, 1.28275, 0.7563084, 0, 1, 0.5490196, 1,
-0.174824, 0.2537167, -0.8079008, 0, 1, 0.5568628, 1,
-0.1637799, 0.992696, -0.2910278, 0, 1, 0.5607843, 1,
-0.1619795, -2.260754, -2.763423, 0, 1, 0.5686275, 1,
-0.1572314, 0.6135994, -1.22297, 0, 1, 0.572549, 1,
-0.155522, -1.687086, -2.739307, 0, 1, 0.5803922, 1,
-0.1553986, 0.5880298, -0.2247345, 0, 1, 0.5843138, 1,
-0.1500402, -1.094714, -3.032438, 0, 1, 0.5921569, 1,
-0.1467053, -1.196836, -4.032244, 0, 1, 0.5960785, 1,
-0.1456919, 0.01290528, -1.1414, 0, 1, 0.6039216, 1,
-0.143032, -0.3991611, -2.830901, 0, 1, 0.6117647, 1,
-0.1417895, 0.08618349, -1.819073, 0, 1, 0.6156863, 1,
-0.1394434, -1.506556, -2.553255, 0, 1, 0.6235294, 1,
-0.1304993, 1.12205, -0.72219, 0, 1, 0.627451, 1,
-0.1263341, 0.7877601, 1.194884, 0, 1, 0.6352941, 1,
-0.126255, -0.1377186, -2.292328, 0, 1, 0.6392157, 1,
-0.126212, 0.6505268, 0.3909763, 0, 1, 0.6470588, 1,
-0.1244349, 1.76073, 0.7663818, 0, 1, 0.6509804, 1,
-0.11649, 0.3172326, -0.6725242, 0, 1, 0.6588235, 1,
-0.1135445, 1.002828, -0.5509122, 0, 1, 0.6627451, 1,
-0.1134848, 2.009033, -0.4434884, 0, 1, 0.6705883, 1,
-0.1104241, -0.5353524, -2.944014, 0, 1, 0.6745098, 1,
-0.1070689, -0.09494796, -0.4013736, 0, 1, 0.682353, 1,
-0.1066624, 0.4476284, -1.802005, 0, 1, 0.6862745, 1,
-0.09067364, 0.497783, -2.376421, 0, 1, 0.6941177, 1,
-0.0897269, 0.8045974, -0.448573, 0, 1, 0.7019608, 1,
-0.08950433, 0.3184571, -0.3263804, 0, 1, 0.7058824, 1,
-0.08939414, 0.3660855, -0.0169592, 0, 1, 0.7137255, 1,
-0.08728008, -1.29626, -4.185578, 0, 1, 0.7176471, 1,
-0.08529322, 1.633511, 2.75047, 0, 1, 0.7254902, 1,
-0.0840104, -0.2514058, -2.485275, 0, 1, 0.7294118, 1,
-0.0787775, -0.1497552, -1.77518, 0, 1, 0.7372549, 1,
-0.07861079, 1.585872, -0.09266245, 0, 1, 0.7411765, 1,
-0.07670042, 1.392459, 0.2135521, 0, 1, 0.7490196, 1,
-0.07538977, 0.1684051, -0.6654555, 0, 1, 0.7529412, 1,
-0.0702033, -0.753989, -3.99598, 0, 1, 0.7607843, 1,
-0.07010292, 0.7928766, -0.6602798, 0, 1, 0.7647059, 1,
-0.06749966, 0.8487651, -0.1717099, 0, 1, 0.772549, 1,
-0.06696357, -1.95771, -3.519478, 0, 1, 0.7764706, 1,
-0.05962957, -2.190015, -4.928875, 0, 1, 0.7843137, 1,
-0.04782658, -0.02003464, -2.611169, 0, 1, 0.7882353, 1,
-0.04748588, -1.880016, -3.870965, 0, 1, 0.7960784, 1,
-0.04729878, 0.5960085, -1.038794, 0, 1, 0.8039216, 1,
-0.04570549, 0.09062964, -0.1652452, 0, 1, 0.8078431, 1,
-0.04563142, 0.2766126, 0.0331553, 0, 1, 0.8156863, 1,
-0.04236466, 0.7300699, -0.1378967, 0, 1, 0.8196079, 1,
-0.04092064, -0.2692128, -1.98343, 0, 1, 0.827451, 1,
-0.04011665, -1.211723, -2.452977, 0, 1, 0.8313726, 1,
-0.0386648, -1.625901, -2.508383, 0, 1, 0.8392157, 1,
-0.03600546, -0.5684004, -2.625951, 0, 1, 0.8431373, 1,
-0.02975786, -1.524418, -3.969963, 0, 1, 0.8509804, 1,
-0.02771515, -0.2751699, -2.816545, 0, 1, 0.854902, 1,
-0.02686991, 0.453657, 0.3288868, 0, 1, 0.8627451, 1,
-0.02373305, -0.03204985, -3.681306, 0, 1, 0.8666667, 1,
-0.019413, -0.11421, -2.524196, 0, 1, 0.8745098, 1,
-0.01516881, 0.06730874, -0.5672967, 0, 1, 0.8784314, 1,
-0.01050082, 0.788056, 0.4972804, 0, 1, 0.8862745, 1,
-0.008722341, 0.9614296, 0.03190787, 0, 1, 0.8901961, 1,
-0.006800653, -2.359063, -3.381278, 0, 1, 0.8980392, 1,
-0.0005321935, -0.4569677, -2.403603, 0, 1, 0.9058824, 1,
-0.0003348361, -1.57924, -3.701297, 0, 1, 0.9098039, 1,
0.001150778, 0.9996291, -0.9166289, 0, 1, 0.9176471, 1,
0.002859256, -1.709693, 3.58712, 0, 1, 0.9215686, 1,
0.002886513, 0.7219313, -1.494061, 0, 1, 0.9294118, 1,
0.009424527, 0.6789607, -1.08189, 0, 1, 0.9333333, 1,
0.01058727, 1.197589, 0.2570035, 0, 1, 0.9411765, 1,
0.01455018, -0.6242847, 2.973901, 0, 1, 0.945098, 1,
0.01484069, 0.4152876, -0.7015386, 0, 1, 0.9529412, 1,
0.0181149, -0.1985054, 1.233337, 0, 1, 0.9568627, 1,
0.01886351, 1.822269, -0.1318751, 0, 1, 0.9647059, 1,
0.02640377, 2.1319, 1.054907, 0, 1, 0.9686275, 1,
0.02691185, -0.8424249, 3.475414, 0, 1, 0.9764706, 1,
0.02890585, 0.9331582, 1.047312, 0, 1, 0.9803922, 1,
0.03689763, 0.4683598, -0.1951148, 0, 1, 0.9882353, 1,
0.03707542, -1.709378, 3.719121, 0, 1, 0.9921569, 1,
0.03773357, -0.2332151, 2.401169, 0, 1, 1, 1,
0.04131062, 0.4497909, 0.5744576, 0, 0.9921569, 1, 1,
0.04419583, -0.6500331, 3.466604, 0, 0.9882353, 1, 1,
0.04493104, 1.027024, 0.759132, 0, 0.9803922, 1, 1,
0.04634826, -0.2853039, 3.587076, 0, 0.9764706, 1, 1,
0.04735681, 0.4702912, 0.006957751, 0, 0.9686275, 1, 1,
0.04818286, -0.2483254, 2.74224, 0, 0.9647059, 1, 1,
0.04826601, -0.5517728, 3.991785, 0, 0.9568627, 1, 1,
0.05022219, -1.135345, 1.80049, 0, 0.9529412, 1, 1,
0.05486561, 0.4669081, 0.566776, 0, 0.945098, 1, 1,
0.05505794, 0.1163728, -0.5907811, 0, 0.9411765, 1, 1,
0.05833681, 1.14953, -0.3976585, 0, 0.9333333, 1, 1,
0.06466909, 0.07384743, 1.570752, 0, 0.9294118, 1, 1,
0.06495293, -1.392338, 2.984553, 0, 0.9215686, 1, 1,
0.06759727, -1.701535, 3.890898, 0, 0.9176471, 1, 1,
0.06839029, -0.04389664, 1.308522, 0, 0.9098039, 1, 1,
0.07874662, -0.3206218, 2.820746, 0, 0.9058824, 1, 1,
0.08758722, 0.3648344, 0.319505, 0, 0.8980392, 1, 1,
0.09144693, -0.07740477, 1.851891, 0, 0.8901961, 1, 1,
0.09334984, -1.180461, 2.491092, 0, 0.8862745, 1, 1,
0.09595035, -0.02059758, 2.56352, 0, 0.8784314, 1, 1,
0.1056846, -1.806978, 2.810372, 0, 0.8745098, 1, 1,
0.110789, 0.4416617, 0.09582663, 0, 0.8666667, 1, 1,
0.1143175, 0.9072528, 1.110698, 0, 0.8627451, 1, 1,
0.1175499, 0.7253614, 0.3174467, 0, 0.854902, 1, 1,
0.1179172, 1.317506, 1.084767, 0, 0.8509804, 1, 1,
0.1191205, -0.04566262, 1.465076, 0, 0.8431373, 1, 1,
0.1213005, -0.6760461, 4.971332, 0, 0.8392157, 1, 1,
0.1229307, -0.07297061, 3.251172, 0, 0.8313726, 1, 1,
0.1235948, -0.6580209, 2.365984, 0, 0.827451, 1, 1,
0.1264102, 0.05603113, 0.9189481, 0, 0.8196079, 1, 1,
0.1273911, 1.210758, 1.708627, 0, 0.8156863, 1, 1,
0.1318429, 1.091754, -0.5200724, 0, 0.8078431, 1, 1,
0.1328362, -0.7786593, 2.227801, 0, 0.8039216, 1, 1,
0.1344861, -0.3286149, 2.766646, 0, 0.7960784, 1, 1,
0.1413084, 1.448787, 0.1084777, 0, 0.7882353, 1, 1,
0.1423843, -0.224714, 3.212575, 0, 0.7843137, 1, 1,
0.1518957, -0.4379048, 2.314741, 0, 0.7764706, 1, 1,
0.1521025, -0.9136209, 4.573977, 0, 0.772549, 1, 1,
0.1533475, 0.1934175, 0.1943986, 0, 0.7647059, 1, 1,
0.1541526, 1.284263, 0.8194234, 0, 0.7607843, 1, 1,
0.1655764, -1.368489, 3.703297, 0, 0.7529412, 1, 1,
0.1662236, -0.335326, 3.221754, 0, 0.7490196, 1, 1,
0.1683408, -0.6627567, 3.560488, 0, 0.7411765, 1, 1,
0.1724886, 0.5442562, 0.5211579, 0, 0.7372549, 1, 1,
0.1742757, 0.2071918, 1.988934, 0, 0.7294118, 1, 1,
0.1776947, 1.060913, 0.972033, 0, 0.7254902, 1, 1,
0.1784979, -1.022074, 5.426844, 0, 0.7176471, 1, 1,
0.183778, 0.370369, -0.7968663, 0, 0.7137255, 1, 1,
0.1914394, 1.558756, -0.8017004, 0, 0.7058824, 1, 1,
0.1920427, 2.461392, 0.3298694, 0, 0.6980392, 1, 1,
0.1945194, -1.592001, 1.942839, 0, 0.6941177, 1, 1,
0.1955131, -0.1717734, 2.258017, 0, 0.6862745, 1, 1,
0.196937, -0.5549077, 1.982219, 0, 0.682353, 1, 1,
0.1978083, 1.007717, 1.023429, 0, 0.6745098, 1, 1,
0.1989253, -0.5496311, 2.963857, 0, 0.6705883, 1, 1,
0.2057406, 0.761731, -0.8283821, 0, 0.6627451, 1, 1,
0.2071309, 1.175298, 0.0905301, 0, 0.6588235, 1, 1,
0.2125428, 0.2609531, -0.4387471, 0, 0.6509804, 1, 1,
0.2148388, 1.010614, 0.9949282, 0, 0.6470588, 1, 1,
0.2185685, -0.4082851, 2.550498, 0, 0.6392157, 1, 1,
0.2196216, 0.1976593, 3.349124, 0, 0.6352941, 1, 1,
0.2200895, 1.53547, -1.65501, 0, 0.627451, 1, 1,
0.2208533, -0.00701293, 1.729475, 0, 0.6235294, 1, 1,
0.2227636, 0.7344409, 0.5161026, 0, 0.6156863, 1, 1,
0.2234308, -0.3053467, 3.177484, 0, 0.6117647, 1, 1,
0.2272895, -0.6022333, 1.846738, 0, 0.6039216, 1, 1,
0.2278975, -0.2843406, 0.7499393, 0, 0.5960785, 1, 1,
0.2295062, -0.1813375, 2.496731, 0, 0.5921569, 1, 1,
0.2295459, -1.459376, 4.376967, 0, 0.5843138, 1, 1,
0.2306488, -0.4452656, 3.15563, 0, 0.5803922, 1, 1,
0.2345534, 1.716903, -0.956112, 0, 0.572549, 1, 1,
0.234757, 1.232755, 0.4030112, 0, 0.5686275, 1, 1,
0.2355414, -1.890471, 1.425673, 0, 0.5607843, 1, 1,
0.2388011, -0.9344734, 3.143193, 0, 0.5568628, 1, 1,
0.2430113, 1.134394, 1.606472, 0, 0.5490196, 1, 1,
0.2452314, 0.3649446, 1.380541, 0, 0.5450981, 1, 1,
0.248603, -0.9451052, 5.789189, 0, 0.5372549, 1, 1,
0.2699888, -0.8390407, 1.738828, 0, 0.5333334, 1, 1,
0.2704549, 3.83425, 0.3741257, 0, 0.5254902, 1, 1,
0.2717368, 0.1347655, -0.2455373, 0, 0.5215687, 1, 1,
0.2737619, 0.4776379, 0.0564482, 0, 0.5137255, 1, 1,
0.2775941, 0.6079385, 0.9907522, 0, 0.509804, 1, 1,
0.2814305, 1.084217, -0.517713, 0, 0.5019608, 1, 1,
0.2814682, -2.525327, 1.98989, 0, 0.4941176, 1, 1,
0.2841052, -0.4717132, 1.709125, 0, 0.4901961, 1, 1,
0.2943534, 1.278774, 1.196386, 0, 0.4823529, 1, 1,
0.3001206, -1.317613, 3.340487, 0, 0.4784314, 1, 1,
0.3002361, -0.08332051, 0.5068865, 0, 0.4705882, 1, 1,
0.3011834, 0.7174168, 1.58699, 0, 0.4666667, 1, 1,
0.3016897, -0.5806862, 1.578748, 0, 0.4588235, 1, 1,
0.3038422, 1.592052, 1.482686, 0, 0.454902, 1, 1,
0.3045342, -0.9988474, 3.984492, 0, 0.4470588, 1, 1,
0.305934, -0.3969398, 1.130345, 0, 0.4431373, 1, 1,
0.3072404, 0.7664332, 0.4432619, 0, 0.4352941, 1, 1,
0.3128199, 0.9055949, -0.270427, 0, 0.4313726, 1, 1,
0.314181, -0.06419259, 0.9602944, 0, 0.4235294, 1, 1,
0.315798, -0.3314245, 0.902133, 0, 0.4196078, 1, 1,
0.3162143, 0.2478514, 1.278365, 0, 0.4117647, 1, 1,
0.3163923, 0.09948048, 0.6060777, 0, 0.4078431, 1, 1,
0.318221, 0.9037414, 0.46454, 0, 0.4, 1, 1,
0.3194721, -0.3629822, 2.917017, 0, 0.3921569, 1, 1,
0.3231882, -0.9901122, 3.238076, 0, 0.3882353, 1, 1,
0.323244, 1.060241, -2.384517, 0, 0.3803922, 1, 1,
0.3254782, 1.169749, -0.1764093, 0, 0.3764706, 1, 1,
0.3277414, -0.4065588, 3.310802, 0, 0.3686275, 1, 1,
0.3363637, 1.421295, -0.6007165, 0, 0.3647059, 1, 1,
0.3372004, 0.5346492, -0.467691, 0, 0.3568628, 1, 1,
0.3411982, 0.4328421, 1.564116, 0, 0.3529412, 1, 1,
0.3440658, -0.3171514, 3.151427, 0, 0.345098, 1, 1,
0.3461806, -0.0061924, 1.437691, 0, 0.3411765, 1, 1,
0.349714, 0.6555597, 0.7445953, 0, 0.3333333, 1, 1,
0.3523001, 0.8096997, -0.3069258, 0, 0.3294118, 1, 1,
0.3600001, -1.454449, 3.995573, 0, 0.3215686, 1, 1,
0.3609013, 0.4668903, 1.031921, 0, 0.3176471, 1, 1,
0.3690275, 0.3533875, 0.170672, 0, 0.3098039, 1, 1,
0.3696114, -1.284027, 2.995062, 0, 0.3058824, 1, 1,
0.3704408, -0.9616659, 2.184973, 0, 0.2980392, 1, 1,
0.3722362, -3.175558, 4.04237, 0, 0.2901961, 1, 1,
0.3735873, 0.3984964, 0.8737754, 0, 0.2862745, 1, 1,
0.374165, -0.9348494, 2.978028, 0, 0.2784314, 1, 1,
0.3743335, 0.2827772, 1.158049, 0, 0.2745098, 1, 1,
0.376292, 0.5159363, -1.067284, 0, 0.2666667, 1, 1,
0.3763074, -0.695425, 4.593294, 0, 0.2627451, 1, 1,
0.3793064, 0.8622532, 1.410973, 0, 0.254902, 1, 1,
0.3839945, -1.602262, 2.350363, 0, 0.2509804, 1, 1,
0.389462, -0.6825864, 3.119905, 0, 0.2431373, 1, 1,
0.3902216, -0.7256153, 1.797862, 0, 0.2392157, 1, 1,
0.3921773, -0.5274909, 1.591435, 0, 0.2313726, 1, 1,
0.3921959, 0.7416757, 0.6368735, 0, 0.227451, 1, 1,
0.3927651, 0.4519767, -0.6325195, 0, 0.2196078, 1, 1,
0.3956342, -0.7491403, 1.990244, 0, 0.2156863, 1, 1,
0.3995135, 2.212201, -1.251316, 0, 0.2078431, 1, 1,
0.4004919, -0.6084362, 4.458394, 0, 0.2039216, 1, 1,
0.4030581, 1.494653, 0.261303, 0, 0.1960784, 1, 1,
0.4081021, -0.558768, 2.434144, 0, 0.1882353, 1, 1,
0.4115774, -1.264174, 4.591242, 0, 0.1843137, 1, 1,
0.4119259, 0.4837789, 1.632592, 0, 0.1764706, 1, 1,
0.4142033, 0.2585561, 1.878673, 0, 0.172549, 1, 1,
0.4170316, 0.10053, 1.760788, 0, 0.1647059, 1, 1,
0.4201173, -0.4771302, 3.787622, 0, 0.1607843, 1, 1,
0.4232022, 0.8577819, 0.5251392, 0, 0.1529412, 1, 1,
0.4277392, -0.4818431, 2.314098, 0, 0.1490196, 1, 1,
0.4312981, 0.1317129, -0.4897166, 0, 0.1411765, 1, 1,
0.431601, -0.4004799, 2.141814, 0, 0.1372549, 1, 1,
0.4317752, -0.286373, 1.425989, 0, 0.1294118, 1, 1,
0.4322062, 1.463274, -0.2653889, 0, 0.1254902, 1, 1,
0.4325585, -0.6131535, 2.237667, 0, 0.1176471, 1, 1,
0.4333198, 0.6106759, 0.01815769, 0, 0.1137255, 1, 1,
0.4357227, 0.575961, 0.8696672, 0, 0.1058824, 1, 1,
0.4383104, 1.852796, 0.5449932, 0, 0.09803922, 1, 1,
0.4386565, -1.274143, 3.41244, 0, 0.09411765, 1, 1,
0.4412521, -0.1998537, 3.407821, 0, 0.08627451, 1, 1,
0.4512344, -1.358613, 1.970397, 0, 0.08235294, 1, 1,
0.4520476, -0.8071017, 3.150703, 0, 0.07450981, 1, 1,
0.4570071, 0.02790712, 1.559004, 0, 0.07058824, 1, 1,
0.459194, 0.5298815, -1.458742, 0, 0.0627451, 1, 1,
0.4598071, -2.136497, 1.444866, 0, 0.05882353, 1, 1,
0.4605666, 0.06611083, 2.264572, 0, 0.05098039, 1, 1,
0.4649933, 0.9407237, -1.137636, 0, 0.04705882, 1, 1,
0.4651089, 0.8113763, -0.7811872, 0, 0.03921569, 1, 1,
0.465607, 0.05538088, -0.4460088, 0, 0.03529412, 1, 1,
0.4691373, -0.1154677, 2.748482, 0, 0.02745098, 1, 1,
0.4771014, -0.4405699, 3.802793, 0, 0.02352941, 1, 1,
0.4780714, 1.955114, 0.4516672, 0, 0.01568628, 1, 1,
0.4801549, 0.1457884, 0.1438219, 0, 0.01176471, 1, 1,
0.4813647, -0.4778329, 2.416542, 0, 0.003921569, 1, 1,
0.4829039, -0.04653736, 1.706055, 0.003921569, 0, 1, 1,
0.4863192, -0.5904748, 1.942547, 0.007843138, 0, 1, 1,
0.4879321, 0.1400762, 1.171652, 0.01568628, 0, 1, 1,
0.489575, -1.678293, 1.896397, 0.01960784, 0, 1, 1,
0.4896289, 1.019695, -0.1204187, 0.02745098, 0, 1, 1,
0.4953103, 0.7069855, 0.1166046, 0.03137255, 0, 1, 1,
0.4956773, 0.3878089, 1.637357, 0.03921569, 0, 1, 1,
0.4971607, -0.1954609, 1.295063, 0.04313726, 0, 1, 1,
0.4999844, 0.02794995, 1.887144, 0.05098039, 0, 1, 1,
0.5002792, 1.948125, 0.3541761, 0.05490196, 0, 1, 1,
0.5037742, -0.4920258, 3.009695, 0.0627451, 0, 1, 1,
0.509307, -1.158357, 2.472228, 0.06666667, 0, 1, 1,
0.5093449, 0.2692364, 2.091852, 0.07450981, 0, 1, 1,
0.5123151, -0.705534, 1.884017, 0.07843138, 0, 1, 1,
0.5149482, -0.04485066, 0.66348, 0.08627451, 0, 1, 1,
0.5201991, 0.8515111, -1.630906, 0.09019608, 0, 1, 1,
0.528573, 0.0002141923, 1.815598, 0.09803922, 0, 1, 1,
0.5321125, -1.668782, 2.445533, 0.1058824, 0, 1, 1,
0.5454967, 1.497207, -0.4465056, 0.1098039, 0, 1, 1,
0.5480205, 0.7528066, -0.08906122, 0.1176471, 0, 1, 1,
0.5496289, -0.9756852, 2.005488, 0.1215686, 0, 1, 1,
0.5543104, -0.9054459, 3.062541, 0.1294118, 0, 1, 1,
0.556697, -0.04147201, 0.9537968, 0.1333333, 0, 1, 1,
0.5579143, -0.3030276, 2.145154, 0.1411765, 0, 1, 1,
0.5716621, 0.5043106, 1.088704, 0.145098, 0, 1, 1,
0.572239, -2.029621, 1.297985, 0.1529412, 0, 1, 1,
0.5742318, 0.09072456, 1.424297, 0.1568628, 0, 1, 1,
0.5745472, -0.2678074, 2.384731, 0.1647059, 0, 1, 1,
0.5772635, -0.723897, 2.433247, 0.1686275, 0, 1, 1,
0.5779708, -0.3608243, 2.87715, 0.1764706, 0, 1, 1,
0.5807759, 1.99862, -0.7397266, 0.1803922, 0, 1, 1,
0.5817451, 0.7387817, 1.377959, 0.1882353, 0, 1, 1,
0.5830134, 0.1772154, 2.12317, 0.1921569, 0, 1, 1,
0.5861447, 0.2329644, -0.04863289, 0.2, 0, 1, 1,
0.5890915, -0.2397011, 0.4928244, 0.2078431, 0, 1, 1,
0.591484, -1.420342, 2.664486, 0.2117647, 0, 1, 1,
0.5924649, 1.136657, 0.0103218, 0.2196078, 0, 1, 1,
0.5937756, 0.7574533, -0.4410212, 0.2235294, 0, 1, 1,
0.5967421, -0.7834845, 3.022869, 0.2313726, 0, 1, 1,
0.6010327, 0.8637189, 0.1068098, 0.2352941, 0, 1, 1,
0.6037943, 0.02755278, 0.6544601, 0.2431373, 0, 1, 1,
0.6093794, 0.9119809, 0.1501109, 0.2470588, 0, 1, 1,
0.6109908, -0.5891598, 1.399207, 0.254902, 0, 1, 1,
0.6181515, -1.248299, 1.781061, 0.2588235, 0, 1, 1,
0.6206223, -0.1511195, 1.577791, 0.2666667, 0, 1, 1,
0.628674, -0.2119721, 0.7625616, 0.2705882, 0, 1, 1,
0.6298333, 1.360076, -0.432181, 0.2784314, 0, 1, 1,
0.6321016, -0.8054941, 3.820484, 0.282353, 0, 1, 1,
0.6338314, 0.5738552, -0.1672055, 0.2901961, 0, 1, 1,
0.6379772, -0.6417041, 2.729473, 0.2941177, 0, 1, 1,
0.639011, -0.443047, 2.940642, 0.3019608, 0, 1, 1,
0.6466436, -0.1377834, 2.216, 0.3098039, 0, 1, 1,
0.6467904, -0.6573873, 3.244616, 0.3137255, 0, 1, 1,
0.6485507, 0.9522145, -1.069967, 0.3215686, 0, 1, 1,
0.6489648, 0.4681966, 0.8934138, 0.3254902, 0, 1, 1,
0.6542323, -0.3192846, 1.377257, 0.3333333, 0, 1, 1,
0.6569511, 0.7863641, 1.798367, 0.3372549, 0, 1, 1,
0.6608637, -1.45424, 2.416195, 0.345098, 0, 1, 1,
0.6628927, -0.7827042, 2.484985, 0.3490196, 0, 1, 1,
0.6633217, -2.02175, 5.27832, 0.3568628, 0, 1, 1,
0.6646208, -1.058559, 4.502746, 0.3607843, 0, 1, 1,
0.6670494, -0.6323097, 1.932642, 0.3686275, 0, 1, 1,
0.667458, -1.312144, 3.698292, 0.372549, 0, 1, 1,
0.6737201, 0.5351263, -0.2044166, 0.3803922, 0, 1, 1,
0.6786227, -0.6205856, 2.475697, 0.3843137, 0, 1, 1,
0.682237, -1.136686, 3.813082, 0.3921569, 0, 1, 1,
0.6909941, -0.3728015, 1.987569, 0.3960784, 0, 1, 1,
0.7014041, 1.628693, 0.4462042, 0.4039216, 0, 1, 1,
0.70156, 2.72823, 1.090101, 0.4117647, 0, 1, 1,
0.7043052, -0.563081, 1.576019, 0.4156863, 0, 1, 1,
0.7047876, 0.8313621, 1.125789, 0.4235294, 0, 1, 1,
0.709, -0.9843383, 0.8630754, 0.427451, 0, 1, 1,
0.7150906, -1.168771, 1.000411, 0.4352941, 0, 1, 1,
0.7194489, -1.736476, 2.23858, 0.4392157, 0, 1, 1,
0.7197676, 0.6730834, 0.9165998, 0.4470588, 0, 1, 1,
0.7227401, -0.4776628, 2.194823, 0.4509804, 0, 1, 1,
0.7237533, 0.843666, 0.09436311, 0.4588235, 0, 1, 1,
0.7259619, -0.887276, 0.5838822, 0.4627451, 0, 1, 1,
0.7275261, 0.2834092, 0.6095309, 0.4705882, 0, 1, 1,
0.7306861, -0.2648436, 1.703297, 0.4745098, 0, 1, 1,
0.7316851, -1.462571, 3.665728, 0.4823529, 0, 1, 1,
0.7331159, 1.44945, 0.6797469, 0.4862745, 0, 1, 1,
0.7332314, 0.05420738, -0.5229852, 0.4941176, 0, 1, 1,
0.737117, -0.2055154, 1.34726, 0.5019608, 0, 1, 1,
0.7392343, -0.3283084, 1.008681, 0.5058824, 0, 1, 1,
0.7393917, -0.1674122, 2.422058, 0.5137255, 0, 1, 1,
0.7476575, 0.3339723, 1.04628, 0.5176471, 0, 1, 1,
0.74795, -2.051574, 4.344229, 0.5254902, 0, 1, 1,
0.7481368, -0.05673555, 2.401419, 0.5294118, 0, 1, 1,
0.7482263, 1.02238, 1.303081, 0.5372549, 0, 1, 1,
0.7487481, -1.047527, 2.984632, 0.5411765, 0, 1, 1,
0.7488381, 0.8372729, -0.9023541, 0.5490196, 0, 1, 1,
0.7506014, 0.2063743, 1.760566, 0.5529412, 0, 1, 1,
0.7527082, -0.4025866, 2.233274, 0.5607843, 0, 1, 1,
0.7539442, 1.887262, -0.4789108, 0.5647059, 0, 1, 1,
0.7541177, -1.815567, 1.425275, 0.572549, 0, 1, 1,
0.7559531, -1.230456, 1.992146, 0.5764706, 0, 1, 1,
0.7635112, 0.9327936, -0.2990722, 0.5843138, 0, 1, 1,
0.7680922, -0.8291314, 2.66647, 0.5882353, 0, 1, 1,
0.7712793, 1.515342, 0.8044187, 0.5960785, 0, 1, 1,
0.7808554, 0.394197, 2.71788, 0.6039216, 0, 1, 1,
0.7809574, 1.089026, 1.161431, 0.6078432, 0, 1, 1,
0.7838142, 1.106485, -0.5247372, 0.6156863, 0, 1, 1,
0.7865281, -0.3633187, 2.047887, 0.6196079, 0, 1, 1,
0.7887356, 1.176393, 1.097697, 0.627451, 0, 1, 1,
0.7918201, -0.2042838, 2.028296, 0.6313726, 0, 1, 1,
0.7983717, -0.9459273, 3.627885, 0.6392157, 0, 1, 1,
0.7996209, -0.664813, 1.500168, 0.6431373, 0, 1, 1,
0.8003381, -0.3484199, 2.548869, 0.6509804, 0, 1, 1,
0.8006727, -0.3276705, 1.318596, 0.654902, 0, 1, 1,
0.8053458, 0.06752365, 2.700154, 0.6627451, 0, 1, 1,
0.8075018, -0.7002092, 2.876859, 0.6666667, 0, 1, 1,
0.8094606, -0.2050947, 2.303522, 0.6745098, 0, 1, 1,
0.8120286, -0.580289, 0.5323403, 0.6784314, 0, 1, 1,
0.8124977, 0.7753483, 2.464849, 0.6862745, 0, 1, 1,
0.8141901, 1.376078, 0.5027373, 0.6901961, 0, 1, 1,
0.8142091, -2.446983, 2.418958, 0.6980392, 0, 1, 1,
0.8146166, -0.281574, 1.755573, 0.7058824, 0, 1, 1,
0.8153659, -0.05546949, 2.744829, 0.7098039, 0, 1, 1,
0.8156483, 0.5988122, -0.1150248, 0.7176471, 0, 1, 1,
0.823055, -0.7646631, 0.5446048, 0.7215686, 0, 1, 1,
0.8249743, -1.287095, 1.532832, 0.7294118, 0, 1, 1,
0.8291255, -1.093517, 3.259706, 0.7333333, 0, 1, 1,
0.8328339, 0.6908596, 0.9887347, 0.7411765, 0, 1, 1,
0.8353425, -0.8457803, 2.708986, 0.7450981, 0, 1, 1,
0.8374804, -0.2067896, 0.7600427, 0.7529412, 0, 1, 1,
0.837747, 1.0888, -0.04881447, 0.7568628, 0, 1, 1,
0.8437144, 1.589211, 2.130343, 0.7647059, 0, 1, 1,
0.852316, 1.302662, 0.1587382, 0.7686275, 0, 1, 1,
0.8556874, -1.019943, 3.946595, 0.7764706, 0, 1, 1,
0.8614676, -1.961883, 4.200412, 0.7803922, 0, 1, 1,
0.8620816, 0.9636658, -0.560406, 0.7882353, 0, 1, 1,
0.8640584, -0.6117963, 2.684756, 0.7921569, 0, 1, 1,
0.8656239, -0.1055541, 3.038969, 0.8, 0, 1, 1,
0.867688, -0.3136409, 2.287186, 0.8078431, 0, 1, 1,
0.867991, -2.218469, 3.402877, 0.8117647, 0, 1, 1,
0.8779895, -0.8274725, 4.840192, 0.8196079, 0, 1, 1,
0.8810186, 0.15739, 0.9668083, 0.8235294, 0, 1, 1,
0.8820052, 0.5307602, 2.225106, 0.8313726, 0, 1, 1,
0.8820349, -0.1506626, 1.915734, 0.8352941, 0, 1, 1,
0.8833011, -1.322073, 3.394246, 0.8431373, 0, 1, 1,
0.8858656, 0.3184476, 1.019743, 0.8470588, 0, 1, 1,
0.889406, -1.930359, 1.374034, 0.854902, 0, 1, 1,
0.8957773, -1.624757, 3.189081, 0.8588235, 0, 1, 1,
0.8958212, 0.27518, -0.1744489, 0.8666667, 0, 1, 1,
0.8961723, -1.307623, 2.400105, 0.8705882, 0, 1, 1,
0.8986194, 0.5060771, 0.5523266, 0.8784314, 0, 1, 1,
0.9006581, 0.5590667, 1.553074, 0.8823529, 0, 1, 1,
0.9141551, -2.899774, 1.002188, 0.8901961, 0, 1, 1,
0.9156542, -1.38586, 4.680941, 0.8941177, 0, 1, 1,
0.9202965, 2.17346, 0.4086125, 0.9019608, 0, 1, 1,
0.9205076, 0.3852777, -0.5615443, 0.9098039, 0, 1, 1,
0.9228193, -0.7207739, 1.935421, 0.9137255, 0, 1, 1,
0.9315071, 0.560407, 2.225973, 0.9215686, 0, 1, 1,
0.9336358, 0.5254288, 1.179956, 0.9254902, 0, 1, 1,
0.9373007, 0.1747148, 2.599123, 0.9333333, 0, 1, 1,
0.9396426, 0.5118115, 0.8113492, 0.9372549, 0, 1, 1,
0.9425095, -0.9580899, 1.398532, 0.945098, 0, 1, 1,
0.9465474, -0.2753996, 2.623185, 0.9490196, 0, 1, 1,
0.9490303, -0.2098166, 2.477842, 0.9568627, 0, 1, 1,
0.949071, 1.73312, 1.089332, 0.9607843, 0, 1, 1,
0.9492087, -0.3564089, 1.615865, 0.9686275, 0, 1, 1,
0.9513423, 1.127841, 0.5922142, 0.972549, 0, 1, 1,
0.9529039, 0.002022022, 0.1577244, 0.9803922, 0, 1, 1,
0.9576855, 0.5879874, 2.059073, 0.9843137, 0, 1, 1,
0.9580297, -0.7180185, 3.288407, 0.9921569, 0, 1, 1,
0.9596924, 1.473588, 0.9630428, 0.9960784, 0, 1, 1,
0.9650392, 0.1662783, -0.2167332, 1, 0, 0.9960784, 1,
0.9667634, 1.310833, 1.087611, 1, 0, 0.9882353, 1,
0.968309, 1.316647, -0.6367449, 1, 0, 0.9843137, 1,
0.9722263, 0.3697416, 0.9868946, 1, 0, 0.9764706, 1,
0.9923536, 1.314944, 1.381671, 1, 0, 0.972549, 1,
0.9941974, -0.8359016, 2.339474, 1, 0, 0.9647059, 1,
1.004249, 1.096552, 0.03461784, 1, 0, 0.9607843, 1,
1.015315, 0.9730808, 0.5453547, 1, 0, 0.9529412, 1,
1.015975, 1.011589, 0.04215739, 1, 0, 0.9490196, 1,
1.019483, -1.07141, 3.757918, 1, 0, 0.9411765, 1,
1.019793, 0.3972417, 1.492456, 1, 0, 0.9372549, 1,
1.020639, -0.162614, 0.6430838, 1, 0, 0.9294118, 1,
1.032567, 1.11195, 1.904626, 1, 0, 0.9254902, 1,
1.032775, -0.03743773, 1.627919, 1, 0, 0.9176471, 1,
1.034604, -1.196707, 2.685717, 1, 0, 0.9137255, 1,
1.037294, -0.3276126, 2.157357, 1, 0, 0.9058824, 1,
1.040758, -0.9146084, 2.71186, 1, 0, 0.9019608, 1,
1.040762, 0.02270982, 2.015623, 1, 0, 0.8941177, 1,
1.04964, -2.227107, 2.925467, 1, 0, 0.8862745, 1,
1.049996, -1.020727, 2.088107, 1, 0, 0.8823529, 1,
1.051466, 0.0771554, 0.08365667, 1, 0, 0.8745098, 1,
1.053024, 0.671189, 3.143363, 1, 0, 0.8705882, 1,
1.055257, -0.5662764, 0.2692411, 1, 0, 0.8627451, 1,
1.057272, 0.5347884, 1.846609, 1, 0, 0.8588235, 1,
1.0598, 0.9886425, 0.4649116, 1, 0, 0.8509804, 1,
1.071391, 0.3782924, 1.226758, 1, 0, 0.8470588, 1,
1.078889, -0.2229744, 2.468414, 1, 0, 0.8392157, 1,
1.080664, 0.2321514, 2.919555, 1, 0, 0.8352941, 1,
1.081747, 0.6947334, 1.759654, 1, 0, 0.827451, 1,
1.083908, 0.1603971, 0.715161, 1, 0, 0.8235294, 1,
1.08728, 0.3770357, 0.1318987, 1, 0, 0.8156863, 1,
1.088535, 0.1305486, 0.7479529, 1, 0, 0.8117647, 1,
1.096906, 0.849519, 0.6740938, 1, 0, 0.8039216, 1,
1.098546, 1.071805, -0.4551135, 1, 0, 0.7960784, 1,
1.099884, 0.7702414, 1.978994, 1, 0, 0.7921569, 1,
1.105571, 0.3203942, 0.04238927, 1, 0, 0.7843137, 1,
1.106639, -1.345165, 2.555808, 1, 0, 0.7803922, 1,
1.109622, 0.5270216, 0.3108194, 1, 0, 0.772549, 1,
1.115841, -0.6366819, 0.8837839, 1, 0, 0.7686275, 1,
1.138468, 1.48852, 1.099908, 1, 0, 0.7607843, 1,
1.140471, -0.1385287, 1.430096, 1, 0, 0.7568628, 1,
1.149848, 1.084399, 0.3018855, 1, 0, 0.7490196, 1,
1.1522, -0.8221124, 2.955299, 1, 0, 0.7450981, 1,
1.156808, -0.5276552, 0.3863908, 1, 0, 0.7372549, 1,
1.157531, -0.3825948, 0.7300901, 1, 0, 0.7333333, 1,
1.161717, -0.9794587, 1.488232, 1, 0, 0.7254902, 1,
1.163742, -0.5441184, 2.189902, 1, 0, 0.7215686, 1,
1.166464, -0.5749256, 3.257249, 1, 0, 0.7137255, 1,
1.166775, -0.3976846, 2.910208, 1, 0, 0.7098039, 1,
1.16698, 1.171404, 0.5232671, 1, 0, 0.7019608, 1,
1.172553, 0.159161, 1.760587, 1, 0, 0.6941177, 1,
1.17485, -1.125518, 4.142531, 1, 0, 0.6901961, 1,
1.182157, -1.151438, 2.294414, 1, 0, 0.682353, 1,
1.184057, -0.373154, 0.8345578, 1, 0, 0.6784314, 1,
1.198219, 0.1528647, 2.589406, 1, 0, 0.6705883, 1,
1.21521, 0.3693492, 1.841822, 1, 0, 0.6666667, 1,
1.226953, 0.7366959, 3.034303, 1, 0, 0.6588235, 1,
1.235671, 0.8934757, 1.370464, 1, 0, 0.654902, 1,
1.24319, -0.04372371, 1.256821, 1, 0, 0.6470588, 1,
1.244861, 1.028012, -1.135576, 1, 0, 0.6431373, 1,
1.248512, -0.4406873, 1.672918, 1, 0, 0.6352941, 1,
1.248546, 0.1347656, 1.014684, 1, 0, 0.6313726, 1,
1.256546, 2.070881, 0.1996277, 1, 0, 0.6235294, 1,
1.257699, -0.05529536, -0.04271327, 1, 0, 0.6196079, 1,
1.259153, 1.454551, -0.04333561, 1, 0, 0.6117647, 1,
1.269986, 0.6184449, 1.43656, 1, 0, 0.6078432, 1,
1.280804, -2.924918, 3.6083, 1, 0, 0.6, 1,
1.282017, 1.875173, 2.713854, 1, 0, 0.5921569, 1,
1.288447, -1.735779, 2.819965, 1, 0, 0.5882353, 1,
1.289668, -0.351851, 0.7329138, 1, 0, 0.5803922, 1,
1.310333, -0.6383983, 1.929299, 1, 0, 0.5764706, 1,
1.325096, -0.7590005, 1.722829, 1, 0, 0.5686275, 1,
1.331087, 0.8744447, 2.650966, 1, 0, 0.5647059, 1,
1.339238, 1.205782, -1.786565, 1, 0, 0.5568628, 1,
1.353696, -0.4408357, 3.165756, 1, 0, 0.5529412, 1,
1.354258, 2.342547, 0.1718244, 1, 0, 0.5450981, 1,
1.35654, 0.5283281, 1.451571, 1, 0, 0.5411765, 1,
1.3625, 0.7813823, 1.502649, 1, 0, 0.5333334, 1,
1.363981, -0.02694917, 0.01710969, 1, 0, 0.5294118, 1,
1.371135, -0.8517623, 2.833575, 1, 0, 0.5215687, 1,
1.382285, 1.08965, 0.05232783, 1, 0, 0.5176471, 1,
1.391448, 0.1208575, 0.9598988, 1, 0, 0.509804, 1,
1.397092, 2.275119, -0.7407561, 1, 0, 0.5058824, 1,
1.403913, -0.5387337, 4.676178, 1, 0, 0.4980392, 1,
1.407046, -0.2824868, 1.293298, 1, 0, 0.4901961, 1,
1.409702, -0.8980138, 2.668771, 1, 0, 0.4862745, 1,
1.413765, 0.7387765, 2.007813, 1, 0, 0.4784314, 1,
1.41984, -0.9780391, 3.507905, 1, 0, 0.4745098, 1,
1.428684, 0.7860169, 1.525235, 1, 0, 0.4666667, 1,
1.432151, -0.2356565, 0.5763388, 1, 0, 0.4627451, 1,
1.432452, -0.180221, 0.3689348, 1, 0, 0.454902, 1,
1.435546, -2.421889, 3.664238, 1, 0, 0.4509804, 1,
1.436411, 1.712674, 0.7313413, 1, 0, 0.4431373, 1,
1.445309, -1.361501, 1.852488, 1, 0, 0.4392157, 1,
1.446611, -0.4095141, 2.817091, 1, 0, 0.4313726, 1,
1.45921, 0.858166, 0.4041086, 1, 0, 0.427451, 1,
1.460722, -1.353809, 3.25976, 1, 0, 0.4196078, 1,
1.460887, 0.5049177, 3.163561, 1, 0, 0.4156863, 1,
1.464024, -1.100853, 2.273357, 1, 0, 0.4078431, 1,
1.4762, 0.2683847, 2.055399, 1, 0, 0.4039216, 1,
1.485013, -0.434685, 2.681115, 1, 0, 0.3960784, 1,
1.48677, -0.2414599, 2.573735, 1, 0, 0.3882353, 1,
1.497103, 1.780114, -0.0119467, 1, 0, 0.3843137, 1,
1.49723, -1.405365, 1.635019, 1, 0, 0.3764706, 1,
1.501168, 0.2526291, 2.04194, 1, 0, 0.372549, 1,
1.514618, 0.1513718, 2.345054, 1, 0, 0.3647059, 1,
1.525452, 1.367618, 1.109563, 1, 0, 0.3607843, 1,
1.550448, 0.3967777, 0.3190436, 1, 0, 0.3529412, 1,
1.554494, 0.4104913, 2.040448, 1, 0, 0.3490196, 1,
1.576258, -0.01679054, 0.1691862, 1, 0, 0.3411765, 1,
1.581531, 0.02218356, 2.531595, 1, 0, 0.3372549, 1,
1.586175, 0.9006992, 2.36023, 1, 0, 0.3294118, 1,
1.621279, 1.03948, -0.06785714, 1, 0, 0.3254902, 1,
1.625226, -0.04817901, 0.7725604, 1, 0, 0.3176471, 1,
1.625807, 0.6248336, 0.9233326, 1, 0, 0.3137255, 1,
1.626915, 0.4509352, 3.179406, 1, 0, 0.3058824, 1,
1.636551, 0.4616035, 1.956881, 1, 0, 0.2980392, 1,
1.638743, -1.189343, 2.682077, 1, 0, 0.2941177, 1,
1.638882, 1.610591, 1.40456, 1, 0, 0.2862745, 1,
1.64376, 1.911756, 0.8580871, 1, 0, 0.282353, 1,
1.647969, -0.8909686, 2.510349, 1, 0, 0.2745098, 1,
1.648878, 0.08721928, 2.339252, 1, 0, 0.2705882, 1,
1.673976, 1.819942, -0.3455365, 1, 0, 0.2627451, 1,
1.680869, 0.5352313, 1.540334, 1, 0, 0.2588235, 1,
1.681588, -0.331796, 1.503947, 1, 0, 0.2509804, 1,
1.683812, -1.885229, 1.845077, 1, 0, 0.2470588, 1,
1.713163, 0.5452504, 0.4925948, 1, 0, 0.2392157, 1,
1.730301, 0.7528887, 0.5257919, 1, 0, 0.2352941, 1,
1.732972, 0.2302504, 0.5087179, 1, 0, 0.227451, 1,
1.84693, -0.985983, 2.101571, 1, 0, 0.2235294, 1,
1.878389, 1.65457, 1.191335, 1, 0, 0.2156863, 1,
1.880865, -1.311211, 2.969701, 1, 0, 0.2117647, 1,
1.886361, 0.7545218, 0.7078959, 1, 0, 0.2039216, 1,
1.926575, 1.297149, 1.544812, 1, 0, 0.1960784, 1,
1.932765, 0.7588345, 1.473923, 1, 0, 0.1921569, 1,
1.936913, -0.3479419, 3.242116, 1, 0, 0.1843137, 1,
1.958036, -0.3185219, 2.606685, 1, 0, 0.1803922, 1,
1.96374, -1.248413, 2.357634, 1, 0, 0.172549, 1,
1.989867, 0.9409457, 1.282374, 1, 0, 0.1686275, 1,
2.000074, -1.789371, 2.994135, 1, 0, 0.1607843, 1,
2.034964, 0.7772534, 2.408687, 1, 0, 0.1568628, 1,
2.058919, -1.653605, 1.536101, 1, 0, 0.1490196, 1,
2.095885, 0.5199688, 1.002585, 1, 0, 0.145098, 1,
2.104593, -1.391905, -0.1523739, 1, 0, 0.1372549, 1,
2.110966, 0.4659948, -0.126546, 1, 0, 0.1333333, 1,
2.137561, -0.9017493, 1.147101, 1, 0, 0.1254902, 1,
2.16806, -0.8773015, 2.084643, 1, 0, 0.1215686, 1,
2.217838, 0.2212846, 1.604, 1, 0, 0.1137255, 1,
2.237725, -0.5975291, 3.93194, 1, 0, 0.1098039, 1,
2.264107, 0.1657675, 0.2809896, 1, 0, 0.1019608, 1,
2.381027, 1.398284, 3.025913, 1, 0, 0.09411765, 1,
2.428964, -0.5347172, 3.167268, 1, 0, 0.09019608, 1,
2.432847, 0.8492322, 1.44075, 1, 0, 0.08235294, 1,
2.433275, 1.537653, -0.3643588, 1, 0, 0.07843138, 1,
2.463118, -0.01514161, 0.1141427, 1, 0, 0.07058824, 1,
2.502688, 0.1434994, 1.485726, 1, 0, 0.06666667, 1,
2.535124, -1.071899, 0.6376883, 1, 0, 0.05882353, 1,
2.595683, 1.141901, 0.07775641, 1, 0, 0.05490196, 1,
2.632097, 0.5061421, 1.660741, 1, 0, 0.04705882, 1,
2.639666, -1.165478, 1.534531, 1, 0, 0.04313726, 1,
2.682333, 0.7465976, 0.8939705, 1, 0, 0.03529412, 1,
2.741881, 0.5931517, 1.107715, 1, 0, 0.03137255, 1,
2.970107, 0.948957, 1.490854, 1, 0, 0.02352941, 1,
3.117882, -0.03983406, 1.362105, 1, 0, 0.01960784, 1,
3.268029, 0.6866373, 2.519043, 1, 0, 0.01176471, 1,
3.966292, -0.5305853, 0.931986, 1, 0, 0.007843138, 1
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
0.4705049, -4.363721, -6.745587, 0, -0.5, 0.5, 0.5,
0.4705049, -4.363721, -6.745587, 1, -0.5, 0.5, 0.5,
0.4705049, -4.363721, -6.745587, 1, 1.5, 0.5, 0.5,
0.4705049, -4.363721, -6.745587, 0, 1.5, 0.5, 0.5
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
-4.210355, 0.3293458, -6.745587, 0, -0.5, 0.5, 0.5,
-4.210355, 0.3293458, -6.745587, 1, -0.5, 0.5, 0.5,
-4.210355, 0.3293458, -6.745587, 1, 1.5, 0.5, 0.5,
-4.210355, 0.3293458, -6.745587, 0, 1.5, 0.5, 0.5
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
-4.210355, -4.363721, 0.4301569, 0, -0.5, 0.5, 0.5,
-4.210355, -4.363721, 0.4301569, 1, -0.5, 0.5, 0.5,
-4.210355, -4.363721, 0.4301569, 1, 1.5, 0.5, 0.5,
-4.210355, -4.363721, 0.4301569, 0, 1.5, 0.5, 0.5
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
-3, -3.280705, -5.089646,
3, -3.280705, -5.089646,
-3, -3.280705, -5.089646,
-3, -3.461208, -5.365636,
-2, -3.280705, -5.089646,
-2, -3.461208, -5.365636,
-1, -3.280705, -5.089646,
-1, -3.461208, -5.365636,
0, -3.280705, -5.089646,
0, -3.461208, -5.365636,
1, -3.280705, -5.089646,
1, -3.461208, -5.365636,
2, -3.280705, -5.089646,
2, -3.461208, -5.365636,
3, -3.280705, -5.089646,
3, -3.461208, -5.365636
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
-3, -3.822213, -5.917616, 0, -0.5, 0.5, 0.5,
-3, -3.822213, -5.917616, 1, -0.5, 0.5, 0.5,
-3, -3.822213, -5.917616, 1, 1.5, 0.5, 0.5,
-3, -3.822213, -5.917616, 0, 1.5, 0.5, 0.5,
-2, -3.822213, -5.917616, 0, -0.5, 0.5, 0.5,
-2, -3.822213, -5.917616, 1, -0.5, 0.5, 0.5,
-2, -3.822213, -5.917616, 1, 1.5, 0.5, 0.5,
-2, -3.822213, -5.917616, 0, 1.5, 0.5, 0.5,
-1, -3.822213, -5.917616, 0, -0.5, 0.5, 0.5,
-1, -3.822213, -5.917616, 1, -0.5, 0.5, 0.5,
-1, -3.822213, -5.917616, 1, 1.5, 0.5, 0.5,
-1, -3.822213, -5.917616, 0, 1.5, 0.5, 0.5,
0, -3.822213, -5.917616, 0, -0.5, 0.5, 0.5,
0, -3.822213, -5.917616, 1, -0.5, 0.5, 0.5,
0, -3.822213, -5.917616, 1, 1.5, 0.5, 0.5,
0, -3.822213, -5.917616, 0, 1.5, 0.5, 0.5,
1, -3.822213, -5.917616, 0, -0.5, 0.5, 0.5,
1, -3.822213, -5.917616, 1, -0.5, 0.5, 0.5,
1, -3.822213, -5.917616, 1, 1.5, 0.5, 0.5,
1, -3.822213, -5.917616, 0, 1.5, 0.5, 0.5,
2, -3.822213, -5.917616, 0, -0.5, 0.5, 0.5,
2, -3.822213, -5.917616, 1, -0.5, 0.5, 0.5,
2, -3.822213, -5.917616, 1, 1.5, 0.5, 0.5,
2, -3.822213, -5.917616, 0, 1.5, 0.5, 0.5,
3, -3.822213, -5.917616, 0, -0.5, 0.5, 0.5,
3, -3.822213, -5.917616, 1, -0.5, 0.5, 0.5,
3, -3.822213, -5.917616, 1, 1.5, 0.5, 0.5,
3, -3.822213, -5.917616, 0, 1.5, 0.5, 0.5
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
-3.130156, -2, -5.089646,
-3.130156, 2, -5.089646,
-3.130156, -2, -5.089646,
-3.310189, -2, -5.365636,
-3.130156, 0, -5.089646,
-3.310189, 0, -5.365636,
-3.130156, 2, -5.089646,
-3.310189, 2, -5.365636
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
-3.670255, -2, -5.917616, 0, -0.5, 0.5, 0.5,
-3.670255, -2, -5.917616, 1, -0.5, 0.5, 0.5,
-3.670255, -2, -5.917616, 1, 1.5, 0.5, 0.5,
-3.670255, -2, -5.917616, 0, 1.5, 0.5, 0.5,
-3.670255, 0, -5.917616, 0, -0.5, 0.5, 0.5,
-3.670255, 0, -5.917616, 1, -0.5, 0.5, 0.5,
-3.670255, 0, -5.917616, 1, 1.5, 0.5, 0.5,
-3.670255, 0, -5.917616, 0, 1.5, 0.5, 0.5,
-3.670255, 2, -5.917616, 0, -0.5, 0.5, 0.5,
-3.670255, 2, -5.917616, 1, -0.5, 0.5, 0.5,
-3.670255, 2, -5.917616, 1, 1.5, 0.5, 0.5,
-3.670255, 2, -5.917616, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.130156, -3.280705, -4,
-3.130156, -3.280705, 4,
-3.130156, -3.280705, -4,
-3.310189, -3.461208, -4,
-3.130156, -3.280705, -2,
-3.310189, -3.461208, -2,
-3.130156, -3.280705, 0,
-3.310189, -3.461208, 0,
-3.130156, -3.280705, 2,
-3.310189, -3.461208, 2,
-3.130156, -3.280705, 4,
-3.310189, -3.461208, 4
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
-3.670255, -3.822213, -4, 0, -0.5, 0.5, 0.5,
-3.670255, -3.822213, -4, 1, -0.5, 0.5, 0.5,
-3.670255, -3.822213, -4, 1, 1.5, 0.5, 0.5,
-3.670255, -3.822213, -4, 0, 1.5, 0.5, 0.5,
-3.670255, -3.822213, -2, 0, -0.5, 0.5, 0.5,
-3.670255, -3.822213, -2, 1, -0.5, 0.5, 0.5,
-3.670255, -3.822213, -2, 1, 1.5, 0.5, 0.5,
-3.670255, -3.822213, -2, 0, 1.5, 0.5, 0.5,
-3.670255, -3.822213, 0, 0, -0.5, 0.5, 0.5,
-3.670255, -3.822213, 0, 1, -0.5, 0.5, 0.5,
-3.670255, -3.822213, 0, 1, 1.5, 0.5, 0.5,
-3.670255, -3.822213, 0, 0, 1.5, 0.5, 0.5,
-3.670255, -3.822213, 2, 0, -0.5, 0.5, 0.5,
-3.670255, -3.822213, 2, 1, -0.5, 0.5, 0.5,
-3.670255, -3.822213, 2, 1, 1.5, 0.5, 0.5,
-3.670255, -3.822213, 2, 0, 1.5, 0.5, 0.5,
-3.670255, -3.822213, 4, 0, -0.5, 0.5, 0.5,
-3.670255, -3.822213, 4, 1, -0.5, 0.5, 0.5,
-3.670255, -3.822213, 4, 1, 1.5, 0.5, 0.5,
-3.670255, -3.822213, 4, 0, 1.5, 0.5, 0.5
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
-3.130156, -3.280705, -5.089646,
-3.130156, 3.939397, -5.089646,
-3.130156, -3.280705, 5.94996,
-3.130156, 3.939397, 5.94996,
-3.130156, -3.280705, -5.089646,
-3.130156, -3.280705, 5.94996,
-3.130156, 3.939397, -5.089646,
-3.130156, 3.939397, 5.94996,
-3.130156, -3.280705, -5.089646,
4.071166, -3.280705, -5.089646,
-3.130156, -3.280705, 5.94996,
4.071166, -3.280705, 5.94996,
-3.130156, 3.939397, -5.089646,
4.071166, 3.939397, -5.089646,
-3.130156, 3.939397, 5.94996,
4.071166, 3.939397, 5.94996,
4.071166, -3.280705, -5.089646,
4.071166, 3.939397, -5.089646,
4.071166, -3.280705, 5.94996,
4.071166, 3.939397, 5.94996,
4.071166, -3.280705, -5.089646,
4.071166, -3.280705, 5.94996,
4.071166, 3.939397, -5.089646,
4.071166, 3.939397, 5.94996
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
var radius = 8.025034;
var distance = 35.70428;
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
mvMatrix.translate( -0.4705049, -0.3293458, -0.4301569 );
mvMatrix.scale( 1.204893, 1.201759, 0.7859722 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.70428);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
carboxylic_acid<-read.table("carboxylic_acid.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-carboxylic_acid$V2
```

```
## Error in eval(expr, envir, enclos): object 'carboxylic_acid' not found
```

```r
y<-carboxylic_acid$V3
```

```
## Error in eval(expr, envir, enclos): object 'carboxylic_acid' not found
```

```r
z<-carboxylic_acid$V4
```

```
## Error in eval(expr, envir, enclos): object 'carboxylic_acid' not found
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
-3.025283, 0.1580871, -1.015614, 0, 0, 1, 1, 1,
-2.751072, -0.3628715, -2.902283, 1, 0, 0, 1, 1,
-2.676498, 0.4187013, -0.7341763, 1, 0, 0, 1, 1,
-2.433018, 0.8883823, -2.751757, 1, 0, 0, 1, 1,
-2.426502, 1.53942, -0.6812874, 1, 0, 0, 1, 1,
-2.337113, 0.1446502, -0.3634337, 1, 0, 0, 1, 1,
-2.323394, 1.155039, -1.705553, 0, 0, 0, 1, 1,
-2.280429, 0.03799401, -2.013758, 0, 0, 0, 1, 1,
-2.24113, 1.846252, -2.053941, 0, 0, 0, 1, 1,
-2.23005, 1.548684, -1.122977, 0, 0, 0, 1, 1,
-2.203269, 0.3404749, -1.533668, 0, 0, 0, 1, 1,
-2.135019, 0.8004639, -0.04090249, 0, 0, 0, 1, 1,
-2.088916, 0.90381, -1.157398, 0, 0, 0, 1, 1,
-2.082739, -0.6550137, -1.176324, 1, 1, 1, 1, 1,
-2.062115, 0.6896342, 0.1575507, 1, 1, 1, 1, 1,
-2.015229, -1.746478, -0.4019982, 1, 1, 1, 1, 1,
-2.007867, 0.1176219, -2.304033, 1, 1, 1, 1, 1,
-1.979393, -0.6430265, -0.9135193, 1, 1, 1, 1, 1,
-1.968014, 0.5410148, -1.632501, 1, 1, 1, 1, 1,
-1.953655, -0.4592751, -1.438539, 1, 1, 1, 1, 1,
-1.947795, 0.04917591, -0.6941108, 1, 1, 1, 1, 1,
-1.923991, -0.4509126, -1.845143, 1, 1, 1, 1, 1,
-1.890248, -0.1665584, -3.311396, 1, 1, 1, 1, 1,
-1.888113, -0.1302767, -1.042447, 1, 1, 1, 1, 1,
-1.886804, -2.172463, -1.294157, 1, 1, 1, 1, 1,
-1.884149, 0.03617947, -3.080614, 1, 1, 1, 1, 1,
-1.881163, -0.4377946, -1.549639, 1, 1, 1, 1, 1,
-1.875321, -0.3436258, 0.5269368, 1, 1, 1, 1, 1,
-1.854641, 1.122294, 0.05728581, 0, 0, 1, 1, 1,
-1.837281, -0.1185491, -1.231831, 1, 0, 0, 1, 1,
-1.815202, 0.6484011, -1.713633, 1, 0, 0, 1, 1,
-1.813936, 0.3493937, -0.2873447, 1, 0, 0, 1, 1,
-1.774621, -0.8738735, -1.926429, 1, 0, 0, 1, 1,
-1.76789, -2.018162, -1.212534, 1, 0, 0, 1, 1,
-1.743513, 0.8965663, 1.765155, 0, 0, 0, 1, 1,
-1.730627, -2.117923, -1.240021, 0, 0, 0, 1, 1,
-1.69442, -0.3181806, -3.222617, 0, 0, 0, 1, 1,
-1.674798, -0.5649453, -2.150607, 0, 0, 0, 1, 1,
-1.674452, 0.58236, -0.267227, 0, 0, 0, 1, 1,
-1.673179, 1.031726, -0.4381681, 0, 0, 0, 1, 1,
-1.669247, 0.4656339, -1.15115, 0, 0, 0, 1, 1,
-1.669224, -0.1878062, -1.742595, 1, 1, 1, 1, 1,
-1.661277, -1.361137, -1.899145, 1, 1, 1, 1, 1,
-1.646893, -0.1753881, 0.3465588, 1, 1, 1, 1, 1,
-1.63602, 2.186695, 0.8063237, 1, 1, 1, 1, 1,
-1.614871, 0.3832902, 0.2429219, 1, 1, 1, 1, 1,
-1.608561, 0.2972252, -1.602409, 1, 1, 1, 1, 1,
-1.606583, 0.2708307, -1.365793, 1, 1, 1, 1, 1,
-1.595258, -0.3357984, -3.379167, 1, 1, 1, 1, 1,
-1.585095, -0.4650407, 0.4044431, 1, 1, 1, 1, 1,
-1.580243, -0.577081, -1.106852, 1, 1, 1, 1, 1,
-1.575449, -1.941733, -3.826993, 1, 1, 1, 1, 1,
-1.569063, 0.3421185, -2.737529, 1, 1, 1, 1, 1,
-1.567364, -1.29485, 0.2844615, 1, 1, 1, 1, 1,
-1.56634, -2.700351, -2.723272, 1, 1, 1, 1, 1,
-1.563846, -1.33797, -3.785699, 1, 1, 1, 1, 1,
-1.560871, -1.19364, -1.573499, 0, 0, 1, 1, 1,
-1.54854, -1.111325, -2.623968, 1, 0, 0, 1, 1,
-1.539863, 2.572893, -2.179162, 1, 0, 0, 1, 1,
-1.527884, 0.912209, -1.183011, 1, 0, 0, 1, 1,
-1.501875, -1.465869, -2.805962, 1, 0, 0, 1, 1,
-1.48262, -1.81343, -3.211839, 1, 0, 0, 1, 1,
-1.482097, -0.6293876, -2.328529, 0, 0, 0, 1, 1,
-1.454968, -0.3572382, -2.464524, 0, 0, 0, 1, 1,
-1.448217, -0.9049105, -4.273135, 0, 0, 0, 1, 1,
-1.438068, -0.458503, -1.727114, 0, 0, 0, 1, 1,
-1.426191, -1.868821, -3.921201, 0, 0, 0, 1, 1,
-1.423339, 1.073055, -2.124151, 0, 0, 0, 1, 1,
-1.413398, -1.911666, -2.081371, 0, 0, 0, 1, 1,
-1.408275, -1.705963, -0.2021509, 1, 1, 1, 1, 1,
-1.402361, -0.5777025, -0.5028737, 1, 1, 1, 1, 1,
-1.400024, -0.215489, -1.384478, 1, 1, 1, 1, 1,
-1.399208, -0.1843121, -1.378041, 1, 1, 1, 1, 1,
-1.38084, -0.5191504, -1.012104, 1, 1, 1, 1, 1,
-1.378237, 1.670238, 0.3993432, 1, 1, 1, 1, 1,
-1.368672, 0.8079482, -1.149345, 1, 1, 1, 1, 1,
-1.367261, 0.5937688, -3.143244, 1, 1, 1, 1, 1,
-1.352194, -1.625237, -1.680649, 1, 1, 1, 1, 1,
-1.344148, 2.164154, -0.3323508, 1, 1, 1, 1, 1,
-1.342947, -0.6061836, -2.790621, 1, 1, 1, 1, 1,
-1.339569, -0.4851013, -1.550953, 1, 1, 1, 1, 1,
-1.327765, 1.600275, -0.6529526, 1, 1, 1, 1, 1,
-1.326371, 0.6553513, -4.16478, 1, 1, 1, 1, 1,
-1.316229, 0.5791574, 0.07615235, 1, 1, 1, 1, 1,
-1.311125, 0.3055446, -1.351055, 0, 0, 1, 1, 1,
-1.305157, -0.4851647, -1.106924, 1, 0, 0, 1, 1,
-1.301783, -0.02876675, -1.687286, 1, 0, 0, 1, 1,
-1.299516, 1.104132, -1.743087, 1, 0, 0, 1, 1,
-1.283679, 0.3522312, -1.264459, 1, 0, 0, 1, 1,
-1.280274, 0.1181833, -0.2940644, 1, 0, 0, 1, 1,
-1.279286, -2.493685, -3.167256, 0, 0, 0, 1, 1,
-1.274116, -0.4108244, -3.171491, 0, 0, 0, 1, 1,
-1.2736, -1.289583, -1.669694, 0, 0, 0, 1, 1,
-1.272839, -0.6079457, -1.750577, 0, 0, 0, 1, 1,
-1.262876, -0.09220547, -0.5993606, 0, 0, 0, 1, 1,
-1.25751, 1.74555, -2.11595, 0, 0, 0, 1, 1,
-1.256484, -0.6113144, -3.776088, 0, 0, 0, 1, 1,
-1.24196, -0.2255904, -3.028065, 1, 1, 1, 1, 1,
-1.234985, 0.6940869, -1.948092, 1, 1, 1, 1, 1,
-1.234689, -1.265889, -3.320043, 1, 1, 1, 1, 1,
-1.230598, 0.8930289, -1.15789, 1, 1, 1, 1, 1,
-1.222158, 1.249268, -1.901435, 1, 1, 1, 1, 1,
-1.220109, -0.832399, -1.684003, 1, 1, 1, 1, 1,
-1.201879, 0.4397782, -0.1487442, 1, 1, 1, 1, 1,
-1.199149, -2.20611, -2.795427, 1, 1, 1, 1, 1,
-1.195647, -0.3836729, 0.04432653, 1, 1, 1, 1, 1,
-1.194941, -1.082642, -2.288707, 1, 1, 1, 1, 1,
-1.191999, 1.369633, -1.259391, 1, 1, 1, 1, 1,
-1.187802, 1.752418, 1.496331, 1, 1, 1, 1, 1,
-1.184032, 2.422084, -0.1246876, 1, 1, 1, 1, 1,
-1.17988, -0.7519176, -0.4919716, 1, 1, 1, 1, 1,
-1.178624, 0.6236212, -2.510871, 1, 1, 1, 1, 1,
-1.178288, 0.3253269, -2.342772, 0, 0, 1, 1, 1,
-1.170626, -1.512992, -3.234783, 1, 0, 0, 1, 1,
-1.167317, -0.02782167, -2.889159, 1, 0, 0, 1, 1,
-1.159495, 0.8261299, -1.346069, 1, 0, 0, 1, 1,
-1.15714, 0.5165124, -1.025211, 1, 0, 0, 1, 1,
-1.153371, -0.5624034, 0.05870515, 1, 0, 0, 1, 1,
-1.150614, 0.6483849, -2.553945, 0, 0, 0, 1, 1,
-1.145084, -0.7863071, -2.761098, 0, 0, 0, 1, 1,
-1.144245, 0.668595, -1.695094, 0, 0, 0, 1, 1,
-1.128235, -0.7561827, -2.727065, 0, 0, 0, 1, 1,
-1.125629, 2.530791, -0.817252, 0, 0, 0, 1, 1,
-1.118043, -1.22638, -3.771955, 0, 0, 0, 1, 1,
-1.114851, -0.7311552, -2.086368, 0, 0, 0, 1, 1,
-1.114538, -0.5699278, -1.362245, 1, 1, 1, 1, 1,
-1.106003, 1.621336, -0.1415581, 1, 1, 1, 1, 1,
-1.103844, 0.9476929, -2.252722, 1, 1, 1, 1, 1,
-1.10341, 1.224974, -0.5803685, 1, 1, 1, 1, 1,
-1.1, -0.8299593, -2.935274, 1, 1, 1, 1, 1,
-1.095952, -0.6936853, -1.533757, 1, 1, 1, 1, 1,
-1.093482, 0.06498227, -0.358074, 1, 1, 1, 1, 1,
-1.092018, -0.1819243, -0.4670627, 1, 1, 1, 1, 1,
-1.090665, -2.175503, -3.401888, 1, 1, 1, 1, 1,
-1.088859, 0.1937908, -0.8758175, 1, 1, 1, 1, 1,
-1.079441, -0.7702771, -2.636964, 1, 1, 1, 1, 1,
-1.074269, -0.7118988, -2.167747, 1, 1, 1, 1, 1,
-1.073752, -1.206425, -2.014186, 1, 1, 1, 1, 1,
-1.067566, 0.09942438, 0.4754441, 1, 1, 1, 1, 1,
-1.067382, 0.2065823, -4.193767, 1, 1, 1, 1, 1,
-1.061895, -1.336465, -3.118031, 0, 0, 1, 1, 1,
-1.061584, -0.7898005, -2.236797, 1, 0, 0, 1, 1,
-1.060639, -1.008812, -4.147493, 1, 0, 0, 1, 1,
-1.059501, 0.6269214, -0.5468628, 1, 0, 0, 1, 1,
-1.055645, -0.09022501, -3.850949, 1, 0, 0, 1, 1,
-1.054467, 1.371153, -0.2438836, 1, 0, 0, 1, 1,
-1.051742, -1.366054, -2.265176, 0, 0, 0, 1, 1,
-1.047055, 0.4206879, -1.101501, 0, 0, 0, 1, 1,
-1.045595, -1.683562, -2.176383, 0, 0, 0, 1, 1,
-1.043107, 1.276512, -2.969474, 0, 0, 0, 1, 1,
-1.0426, -2.105113, -1.531788, 0, 0, 0, 1, 1,
-1.039717, 0.7408775, -0.4357403, 0, 0, 0, 1, 1,
-1.033617, -0.7599631, -0.5542421, 0, 0, 0, 1, 1,
-1.029323, 0.06539165, -1.687347, 1, 1, 1, 1, 1,
-1.023362, -0.3365625, -2.474816, 1, 1, 1, 1, 1,
-1.020689, 0.01072119, -3.060572, 1, 1, 1, 1, 1,
-1.016474, 0.4219647, -0.1144315, 1, 1, 1, 1, 1,
-1.015934, 0.9313033, -1.834942, 1, 1, 1, 1, 1,
-1.015083, 2.669253, -0.7148389, 1, 1, 1, 1, 1,
-1.013828, 0.6152637, -1.368148, 1, 1, 1, 1, 1,
-1.012287, 1.231671, -0.5768937, 1, 1, 1, 1, 1,
-1.012056, -0.8634319, -1.994752, 1, 1, 1, 1, 1,
-1.011512, 0.8360057, 0.08151323, 1, 1, 1, 1, 1,
-1.007654, -0.02886592, -0.5216509, 1, 1, 1, 1, 1,
-1.007251, 0.3881981, -2.21285, 1, 1, 1, 1, 1,
-1.004588, 0.1401267, -1.295371, 1, 1, 1, 1, 1,
-1.003309, -0.2596834, -1.304764, 1, 1, 1, 1, 1,
-1.001858, 0.2355148, -1.989619, 1, 1, 1, 1, 1,
-1.001759, -0.5724795, -1.347014, 0, 0, 1, 1, 1,
-0.9960221, -0.7398103, -2.813653, 1, 0, 0, 1, 1,
-0.9876228, -0.02041321, -1.373058, 1, 0, 0, 1, 1,
-0.9837416, -0.03800846, -1.111091, 1, 0, 0, 1, 1,
-0.9788681, 0.3796013, -2.462224, 1, 0, 0, 1, 1,
-0.9704896, 2.004243, -0.3123433, 1, 0, 0, 1, 1,
-0.9666258, -1.634711, -3.91506, 0, 0, 0, 1, 1,
-0.9597385, 0.9906013, 0.1678708, 0, 0, 0, 1, 1,
-0.9592767, 1.250506, 0.7886276, 0, 0, 0, 1, 1,
-0.9564114, -0.2260234, -2.794527, 0, 0, 0, 1, 1,
-0.9542785, -0.6492884, -3.466649, 0, 0, 0, 1, 1,
-0.9518829, -0.1345471, -2.108508, 0, 0, 0, 1, 1,
-0.9235684, 0.01079465, -1.076949, 0, 0, 0, 1, 1,
-0.9220794, 0.8371589, -0.4651253, 1, 1, 1, 1, 1,
-0.9199845, -0.4494568, -2.515035, 1, 1, 1, 1, 1,
-0.9066279, 0.09330146, -1.344246, 1, 1, 1, 1, 1,
-0.9060561, -0.2736887, -0.4950643, 1, 1, 1, 1, 1,
-0.899715, -1.91253, -1.901241, 1, 1, 1, 1, 1,
-0.8965715, -1.061614, -1.772321, 1, 1, 1, 1, 1,
-0.8939591, -0.810285, -1.125093, 1, 1, 1, 1, 1,
-0.8916002, 0.1344974, -2.759662, 1, 1, 1, 1, 1,
-0.8866935, 0.09678841, -2.561145, 1, 1, 1, 1, 1,
-0.8862152, 0.1267615, -3.117687, 1, 1, 1, 1, 1,
-0.8829698, 1.845651, -1.471873, 1, 1, 1, 1, 1,
-0.8800139, -0.8542727, -1.929239, 1, 1, 1, 1, 1,
-0.8752119, -0.3884266, -1.36623, 1, 1, 1, 1, 1,
-0.8741698, 0.4219086, 1.969791, 1, 1, 1, 1, 1,
-0.8718279, -0.04447851, -1.792426, 1, 1, 1, 1, 1,
-0.870918, 1.009925, -1.271881, 0, 0, 1, 1, 1,
-0.8629976, 0.1735577, -2.31708, 1, 0, 0, 1, 1,
-0.8606103, -1.125461, -1.709749, 1, 0, 0, 1, 1,
-0.8562974, -1.576355, -3.614418, 1, 0, 0, 1, 1,
-0.8548763, 2.315491, 1.288369, 1, 0, 0, 1, 1,
-0.8522416, 0.1358174, -0.7057192, 1, 0, 0, 1, 1,
-0.8461338, 0.005565008, -1.731368, 0, 0, 0, 1, 1,
-0.8442013, -0.2474257, -0.5216112, 0, 0, 0, 1, 1,
-0.8427046, -1.104208, -2.557473, 0, 0, 0, 1, 1,
-0.839818, -0.6680548, -1.69755, 0, 0, 0, 1, 1,
-0.8294594, -1.086937, -2.459738, 0, 0, 0, 1, 1,
-0.8166627, 0.964403, -1.578244, 0, 0, 0, 1, 1,
-0.8142118, -0.02393341, -2.14525, 0, 0, 0, 1, 1,
-0.8128518, 0.9348339, -0.4754227, 1, 1, 1, 1, 1,
-0.8064801, 0.8886513, 0.2448856, 1, 1, 1, 1, 1,
-0.8044741, 0.3567367, -1.281737, 1, 1, 1, 1, 1,
-0.7977111, 0.3573956, -1.972173, 1, 1, 1, 1, 1,
-0.7956834, -0.2201555, -0.2550931, 1, 1, 1, 1, 1,
-0.7949329, 0.2638033, -2.177187, 1, 1, 1, 1, 1,
-0.7943183, -0.1498011, -2.499214, 1, 1, 1, 1, 1,
-0.7909476, -0.1801462, 0.3345856, 1, 1, 1, 1, 1,
-0.7906613, 0.294482, -2.141381, 1, 1, 1, 1, 1,
-0.790483, 1.120951, 0.01348211, 1, 1, 1, 1, 1,
-0.7798115, -1.107097, -2.288627, 1, 1, 1, 1, 1,
-0.7771634, -0.863394, -1.873711, 1, 1, 1, 1, 1,
-0.7735205, -0.1427133, -1.984906, 1, 1, 1, 1, 1,
-0.7713125, -0.7035179, -1.286698, 1, 1, 1, 1, 1,
-0.7586498, 0.3582141, -2.195657, 1, 1, 1, 1, 1,
-0.7578384, 1.068363, 0.07730144, 0, 0, 1, 1, 1,
-0.7567412, -1.185423, -2.001078, 1, 0, 0, 1, 1,
-0.7535502, 0.7130828, -0.2427359, 1, 0, 0, 1, 1,
-0.7530103, 1.072871, 0.363941, 1, 0, 0, 1, 1,
-0.7489069, 0.7767686, -1.38824, 1, 0, 0, 1, 1,
-0.7484559, -0.003223203, -0.8673378, 1, 0, 0, 1, 1,
-0.7430438, -0.2594409, -1.729167, 0, 0, 0, 1, 1,
-0.7428989, 0.7629642, 1.029108, 0, 0, 0, 1, 1,
-0.7424085, -0.09228709, -1.887785, 0, 0, 0, 1, 1,
-0.7420452, -1.064466, -2.665468, 0, 0, 0, 1, 1,
-0.739527, -1.614415, -2.345876, 0, 0, 0, 1, 1,
-0.7389875, 0.227806, 0.1827688, 0, 0, 0, 1, 1,
-0.7368709, 0.2442662, -0.8767427, 0, 0, 0, 1, 1,
-0.7347322, 1.038349, -0.9128464, 1, 1, 1, 1, 1,
-0.7186259, 0.6442443, -1.023504, 1, 1, 1, 1, 1,
-0.7171723, 1.157289, -2.203212, 1, 1, 1, 1, 1,
-0.7141687, 2.057064, -0.7668984, 1, 1, 1, 1, 1,
-0.7020094, 0.02985228, -3.752129, 1, 1, 1, 1, 1,
-0.7004428, 1.532232, 0.5624203, 1, 1, 1, 1, 1,
-0.6956719, 0.02943513, -1.388739, 1, 1, 1, 1, 1,
-0.6914827, -0.8179435, -3.44138, 1, 1, 1, 1, 1,
-0.6895884, -1.447927, -2.539866, 1, 1, 1, 1, 1,
-0.6855436, 0.2460397, -1.160594, 1, 1, 1, 1, 1,
-0.6768484, 1.026207, -1.142874, 1, 1, 1, 1, 1,
-0.6739364, 0.4200448, -0.4544269, 1, 1, 1, 1, 1,
-0.6738667, 2.073348, -0.2542979, 1, 1, 1, 1, 1,
-0.6725664, -0.5107231, -3.469193, 1, 1, 1, 1, 1,
-0.6711612, 1.539166, -0.8150319, 1, 1, 1, 1, 1,
-0.6711601, 1.469738, 0.6556498, 0, 0, 1, 1, 1,
-0.6698623, -1.393282, -1.8579, 1, 0, 0, 1, 1,
-0.6677104, -2.083639, -2.723111, 1, 0, 0, 1, 1,
-0.6670058, 1.811392, -0.1869952, 1, 0, 0, 1, 1,
-0.6659572, 2.862928, 0.2259011, 1, 0, 0, 1, 1,
-0.6654983, -1.115553, -3.070638, 1, 0, 0, 1, 1,
-0.6623683, 1.174381, -2.041424, 0, 0, 0, 1, 1,
-0.6618415, 0.8799376, 1.733803, 0, 0, 0, 1, 1,
-0.6615348, -0.2282424, -1.850585, 0, 0, 0, 1, 1,
-0.6608264, -0.3259036, -3.808447, 0, 0, 0, 1, 1,
-0.6569337, 1.078406, -0.2566651, 0, 0, 0, 1, 1,
-0.6554711, 1.712393, -0.3779015, 0, 0, 0, 1, 1,
-0.6551067, -0.1330509, -0.4546886, 0, 0, 0, 1, 1,
-0.6495329, -0.08151681, -3.437097, 1, 1, 1, 1, 1,
-0.6465076, 0.3944162, -2.188903, 1, 1, 1, 1, 1,
-0.6461293, -0.2092775, -3.970502, 1, 1, 1, 1, 1,
-0.6337921, -0.6920345, -0.1386791, 1, 1, 1, 1, 1,
-0.6272804, 1.373879, -0.3945497, 1, 1, 1, 1, 1,
-0.6256213, -0.08928166, -1.972367, 1, 1, 1, 1, 1,
-0.6236823, 0.06943276, -2.526197, 1, 1, 1, 1, 1,
-0.6227523, -2.391436, -4.500114, 1, 1, 1, 1, 1,
-0.6203168, -0.2439522, -1.744508, 1, 1, 1, 1, 1,
-0.6165398, 0.2819045, -1.977506, 1, 1, 1, 1, 1,
-0.6149547, 0.003279658, -2.982368, 1, 1, 1, 1, 1,
-0.6110364, 0.5524311, -0.03601382, 1, 1, 1, 1, 1,
-0.6093867, 1.215733, 1.142783, 1, 1, 1, 1, 1,
-0.6089668, -0.8836782, -2.075406, 1, 1, 1, 1, 1,
-0.6055177, -0.8079001, -2.875356, 1, 1, 1, 1, 1,
-0.6035039, -0.6629782, -1.920525, 0, 0, 1, 1, 1,
-0.5981827, -0.2172065, -0.3979309, 1, 0, 0, 1, 1,
-0.5929176, -1.652101, -2.858119, 1, 0, 0, 1, 1,
-0.5924631, -0.8440424, -1.287259, 1, 0, 0, 1, 1,
-0.5912424, -1.161092, -1.6377, 1, 0, 0, 1, 1,
-0.5886875, -0.7227365, -3.252063, 1, 0, 0, 1, 1,
-0.5870455, 0.6795509, -0.7056823, 0, 0, 0, 1, 1,
-0.5786315, -0.3475843, -0.60124, 0, 0, 0, 1, 1,
-0.5718402, -1.067781, -2.78862, 0, 0, 0, 1, 1,
-0.5604835, -0.9997433, -3.331013, 0, 0, 0, 1, 1,
-0.5562352, 0.829295, -1.4047, 0, 0, 0, 1, 1,
-0.5560626, -0.2336709, -2.558499, 0, 0, 0, 1, 1,
-0.5554804, 0.2449262, -2.854071, 0, 0, 0, 1, 1,
-0.5527613, -0.6908379, -1.699279, 1, 1, 1, 1, 1,
-0.5429536, -0.7438751, -1.946081, 1, 1, 1, 1, 1,
-0.5395675, 0.9658449, -1.307101, 1, 1, 1, 1, 1,
-0.5392837, -0.7879372, -2.856722, 1, 1, 1, 1, 1,
-0.5390857, -0.4624319, -1.278861, 1, 1, 1, 1, 1,
-0.5374815, -0.2325095, -2.137582, 1, 1, 1, 1, 1,
-0.5359071, 0.3759518, -1.40916, 1, 1, 1, 1, 1,
-0.5350595, 0.8068661, -1.295371, 1, 1, 1, 1, 1,
-0.5342348, 0.3417239, -1.436297, 1, 1, 1, 1, 1,
-0.5317513, 0.7278773, -0.3979248, 1, 1, 1, 1, 1,
-0.5315029, -0.6672493, -1.694033, 1, 1, 1, 1, 1,
-0.528264, 0.9455364, 1.614004, 1, 1, 1, 1, 1,
-0.5244572, -0.2926362, -3.19039, 1, 1, 1, 1, 1,
-0.5210525, -0.6666451, -3.631547, 1, 1, 1, 1, 1,
-0.516735, 0.3308497, 0.6275823, 1, 1, 1, 1, 1,
-0.5086012, 1.229924, -0.3583088, 0, 0, 1, 1, 1,
-0.5065216, -0.1647827, -0.7949885, 1, 0, 0, 1, 1,
-0.5062026, -0.4724351, -2.793481, 1, 0, 0, 1, 1,
-0.5008017, 0.2570658, -1.872009, 1, 0, 0, 1, 1,
-0.4986427, 0.04338891, -1.515291, 1, 0, 0, 1, 1,
-0.4971234, -1.168216, -3.130248, 1, 0, 0, 1, 1,
-0.4968333, 0.2291317, -0.8122132, 0, 0, 0, 1, 1,
-0.4941299, -0.5688171, 1.075212, 0, 0, 0, 1, 1,
-0.4934776, 0.3013102, -2.193166, 0, 0, 0, 1, 1,
-0.4888712, -1.892931, -3.142092, 0, 0, 0, 1, 1,
-0.4882555, -0.367514, -3.116328, 0, 0, 0, 1, 1,
-0.484029, 1.24833, 0.6237347, 0, 0, 0, 1, 1,
-0.4840235, 0.9452494, -0.9347776, 0, 0, 0, 1, 1,
-0.482043, -0.306096, -3.338536, 1, 1, 1, 1, 1,
-0.4794644, -0.8672929, -3.525877, 1, 1, 1, 1, 1,
-0.4769355, 1.249591, -1.085034, 1, 1, 1, 1, 1,
-0.4762779, 1.184912, 0.1931793, 1, 1, 1, 1, 1,
-0.4756587, -1.489446, -3.282403, 1, 1, 1, 1, 1,
-0.4752171, -1.874302, -3.485161, 1, 1, 1, 1, 1,
-0.4687275, -0.9782108, -1.575405, 1, 1, 1, 1, 1,
-0.468324, -1.434147, -2.36481, 1, 1, 1, 1, 1,
-0.4582776, 0.8732255, -1.012712, 1, 1, 1, 1, 1,
-0.4551054, 0.1640606, -0.5881624, 1, 1, 1, 1, 1,
-0.4514452, -0.07134903, -2.215106, 1, 1, 1, 1, 1,
-0.450003, -0.4241976, -3.305102, 1, 1, 1, 1, 1,
-0.4354515, -1.251263, -1.817128, 1, 1, 1, 1, 1,
-0.43386, 0.2964091, -0.3423643, 1, 1, 1, 1, 1,
-0.4268177, -0.1897188, -3.896911, 1, 1, 1, 1, 1,
-0.413416, -0.5345732, -2.610357, 0, 0, 1, 1, 1,
-0.4033433, 1.301411, -1.199168, 1, 0, 0, 1, 1,
-0.3984477, 2.006982, -0.001718534, 1, 0, 0, 1, 1,
-0.3932585, 0.3723941, 0.2477314, 1, 0, 0, 1, 1,
-0.3929988, 0.4152632, -1.262842, 1, 0, 0, 1, 1,
-0.3929422, -0.5276288, -2.867289, 1, 0, 0, 1, 1,
-0.3905839, 0.3568052, -2.140307, 0, 0, 0, 1, 1,
-0.3876503, -2.533814, -4.60243, 0, 0, 0, 1, 1,
-0.37977, 0.006050724, -1.531838, 0, 0, 0, 1, 1,
-0.3760848, -0.6795992, -2.379448, 0, 0, 0, 1, 1,
-0.3757944, -0.2013098, -1.881483, 0, 0, 0, 1, 1,
-0.3733845, 0.7143704, -0.9090345, 0, 0, 0, 1, 1,
-0.3722776, 0.1030878, -1.093357, 0, 0, 0, 1, 1,
-0.3707318, 0.9550687, -0.5504693, 1, 1, 1, 1, 1,
-0.3697258, 0.6652364, -1.44647, 1, 1, 1, 1, 1,
-0.3662522, 0.04932228, -2.598273, 1, 1, 1, 1, 1,
-0.3613968, 1.786434, -0.6912699, 1, 1, 1, 1, 1,
-0.3596355, 0.7428898, 1.02633, 1, 1, 1, 1, 1,
-0.355505, 0.7621789, -2.192942, 1, 1, 1, 1, 1,
-0.3482269, 0.541611, 0.4838185, 1, 1, 1, 1, 1,
-0.3476191, 1.822862, -0.0459719, 1, 1, 1, 1, 1,
-0.3420719, 1.325006, 0.6986818, 1, 1, 1, 1, 1,
-0.3411353, -1.343999, -1.53156, 1, 1, 1, 1, 1,
-0.3398108, 0.2613594, -0.7271593, 1, 1, 1, 1, 1,
-0.3388707, -1.572594, -3.929687, 1, 1, 1, 1, 1,
-0.3387834, -2.859265, -4.592277, 1, 1, 1, 1, 1,
-0.3349791, -0.1389851, -1.667686, 1, 1, 1, 1, 1,
-0.3338695, 0.9513963, -1.336504, 1, 1, 1, 1, 1,
-0.3316541, -0.5526132, -2.4462, 0, 0, 1, 1, 1,
-0.331027, 1.171011, -0.2209436, 1, 0, 0, 1, 1,
-0.3305401, 0.512068, 0.7083498, 1, 0, 0, 1, 1,
-0.3288491, -0.8799126, -3.3225, 1, 0, 0, 1, 1,
-0.3264842, -0.4443464, -1.510698, 1, 0, 0, 1, 1,
-0.3250028, -1.531971, -3.482353, 1, 0, 0, 1, 1,
-0.3245347, -1.09877, -2.717947, 0, 0, 0, 1, 1,
-0.321019, -1.954748, -3.101173, 0, 0, 0, 1, 1,
-0.3184747, -0.3056032, -3.020086, 0, 0, 0, 1, 1,
-0.3178645, -0.9231029, -2.062404, 0, 0, 0, 1, 1,
-0.316349, -0.1553522, -3.390508, 0, 0, 0, 1, 1,
-0.3155492, -2.662897, -4.920589, 0, 0, 0, 1, 1,
-0.3130856, -1.251451, -3.570337, 0, 0, 0, 1, 1,
-0.3117781, -1.081767, -4.538318, 1, 1, 1, 1, 1,
-0.3073791, 0.310429, 0.7022372, 1, 1, 1, 1, 1,
-0.3064356, -0.0210579, -0.9841615, 1, 1, 1, 1, 1,
-0.3005396, -0.8550233, -4.111457, 1, 1, 1, 1, 1,
-0.2960384, 0.1118613, -0.3428384, 1, 1, 1, 1, 1,
-0.2956882, -0.1605259, -1.678128, 1, 1, 1, 1, 1,
-0.2930896, 0.265415, 0.5772609, 1, 1, 1, 1, 1,
-0.2916538, -0.519681, -1.550231, 1, 1, 1, 1, 1,
-0.2910104, -1.638989, -3.436435, 1, 1, 1, 1, 1,
-0.2897103, -0.3949094, -2.396883, 1, 1, 1, 1, 1,
-0.289452, 0.3582399, -0.9083465, 1, 1, 1, 1, 1,
-0.2891611, -1.193614, -2.039605, 1, 1, 1, 1, 1,
-0.2880539, 0.05343235, -1.62112, 1, 1, 1, 1, 1,
-0.2828946, 1.941451, -0.8852577, 1, 1, 1, 1, 1,
-0.2813925, -0.564113, -3.27898, 1, 1, 1, 1, 1,
-0.2785498, -1.301231, -1.872561, 0, 0, 1, 1, 1,
-0.2757756, 1.109345, -0.3900695, 1, 0, 0, 1, 1,
-0.273614, 0.7979612, 0.8835797, 1, 0, 0, 1, 1,
-0.271852, -0.2597805, -1.238941, 1, 0, 0, 1, 1,
-0.2685566, -0.9538706, -2.29912, 1, 0, 0, 1, 1,
-0.2660426, -0.3700544, -3.181508, 1, 0, 0, 1, 1,
-0.2647114, 0.711158, -1.238778, 0, 0, 0, 1, 1,
-0.2599857, -0.8873464, -2.955097, 0, 0, 0, 1, 1,
-0.2512963, 0.3921549, -0.4226444, 0, 0, 0, 1, 1,
-0.2490145, 0.2523514, -0.909304, 0, 0, 0, 1, 1,
-0.2432218, -0.003057014, -0.9114217, 0, 0, 0, 1, 1,
-0.2415353, 0.7130224, 0.627503, 0, 0, 0, 1, 1,
-0.2404972, -0.7337682, -2.984122, 0, 0, 0, 1, 1,
-0.2402608, -0.2338231, -2.775594, 1, 1, 1, 1, 1,
-0.2338926, -1.918385, -0.8194342, 1, 1, 1, 1, 1,
-0.226768, -0.06779339, -1.099005, 1, 1, 1, 1, 1,
-0.2267044, 1.24968, 0.8015216, 1, 1, 1, 1, 1,
-0.2263536, -0.9612826, -3.372653, 1, 1, 1, 1, 1,
-0.2262686, 0.07433826, 0.5786331, 1, 1, 1, 1, 1,
-0.2240576, -0.7979625, -3.69133, 1, 1, 1, 1, 1,
-0.2212327, -0.3167579, -1.623955, 1, 1, 1, 1, 1,
-0.2147073, -0.06518578, -2.477686, 1, 1, 1, 1, 1,
-0.2134692, 0.681547, -0.6462249, 1, 1, 1, 1, 1,
-0.2132871, 1.26184, 0.4352919, 1, 1, 1, 1, 1,
-0.2102122, 0.9523343, -1.777549, 1, 1, 1, 1, 1,
-0.2078406, 2.131747, -1.139431, 1, 1, 1, 1, 1,
-0.2066403, 1.20844, -1.947952, 1, 1, 1, 1, 1,
-0.2047885, 2.315893, -0.6713296, 1, 1, 1, 1, 1,
-0.2039898, 0.6084508, 0.3677572, 0, 0, 1, 1, 1,
-0.1947875, 1.182912, -0.2794704, 1, 0, 0, 1, 1,
-0.1903966, -0.3312402, -1.975265, 1, 0, 0, 1, 1,
-0.1853695, -1.906138, -1.396573, 1, 0, 0, 1, 1,
-0.1791098, -0.9121045, -3.601585, 1, 0, 0, 1, 1,
-0.1767713, 1.28275, 0.7563084, 1, 0, 0, 1, 1,
-0.174824, 0.2537167, -0.8079008, 0, 0, 0, 1, 1,
-0.1637799, 0.992696, -0.2910278, 0, 0, 0, 1, 1,
-0.1619795, -2.260754, -2.763423, 0, 0, 0, 1, 1,
-0.1572314, 0.6135994, -1.22297, 0, 0, 0, 1, 1,
-0.155522, -1.687086, -2.739307, 0, 0, 0, 1, 1,
-0.1553986, 0.5880298, -0.2247345, 0, 0, 0, 1, 1,
-0.1500402, -1.094714, -3.032438, 0, 0, 0, 1, 1,
-0.1467053, -1.196836, -4.032244, 1, 1, 1, 1, 1,
-0.1456919, 0.01290528, -1.1414, 1, 1, 1, 1, 1,
-0.143032, -0.3991611, -2.830901, 1, 1, 1, 1, 1,
-0.1417895, 0.08618349, -1.819073, 1, 1, 1, 1, 1,
-0.1394434, -1.506556, -2.553255, 1, 1, 1, 1, 1,
-0.1304993, 1.12205, -0.72219, 1, 1, 1, 1, 1,
-0.1263341, 0.7877601, 1.194884, 1, 1, 1, 1, 1,
-0.126255, -0.1377186, -2.292328, 1, 1, 1, 1, 1,
-0.126212, 0.6505268, 0.3909763, 1, 1, 1, 1, 1,
-0.1244349, 1.76073, 0.7663818, 1, 1, 1, 1, 1,
-0.11649, 0.3172326, -0.6725242, 1, 1, 1, 1, 1,
-0.1135445, 1.002828, -0.5509122, 1, 1, 1, 1, 1,
-0.1134848, 2.009033, -0.4434884, 1, 1, 1, 1, 1,
-0.1104241, -0.5353524, -2.944014, 1, 1, 1, 1, 1,
-0.1070689, -0.09494796, -0.4013736, 1, 1, 1, 1, 1,
-0.1066624, 0.4476284, -1.802005, 0, 0, 1, 1, 1,
-0.09067364, 0.497783, -2.376421, 1, 0, 0, 1, 1,
-0.0897269, 0.8045974, -0.448573, 1, 0, 0, 1, 1,
-0.08950433, 0.3184571, -0.3263804, 1, 0, 0, 1, 1,
-0.08939414, 0.3660855, -0.0169592, 1, 0, 0, 1, 1,
-0.08728008, -1.29626, -4.185578, 1, 0, 0, 1, 1,
-0.08529322, 1.633511, 2.75047, 0, 0, 0, 1, 1,
-0.0840104, -0.2514058, -2.485275, 0, 0, 0, 1, 1,
-0.0787775, -0.1497552, -1.77518, 0, 0, 0, 1, 1,
-0.07861079, 1.585872, -0.09266245, 0, 0, 0, 1, 1,
-0.07670042, 1.392459, 0.2135521, 0, 0, 0, 1, 1,
-0.07538977, 0.1684051, -0.6654555, 0, 0, 0, 1, 1,
-0.0702033, -0.753989, -3.99598, 0, 0, 0, 1, 1,
-0.07010292, 0.7928766, -0.6602798, 1, 1, 1, 1, 1,
-0.06749966, 0.8487651, -0.1717099, 1, 1, 1, 1, 1,
-0.06696357, -1.95771, -3.519478, 1, 1, 1, 1, 1,
-0.05962957, -2.190015, -4.928875, 1, 1, 1, 1, 1,
-0.04782658, -0.02003464, -2.611169, 1, 1, 1, 1, 1,
-0.04748588, -1.880016, -3.870965, 1, 1, 1, 1, 1,
-0.04729878, 0.5960085, -1.038794, 1, 1, 1, 1, 1,
-0.04570549, 0.09062964, -0.1652452, 1, 1, 1, 1, 1,
-0.04563142, 0.2766126, 0.0331553, 1, 1, 1, 1, 1,
-0.04236466, 0.7300699, -0.1378967, 1, 1, 1, 1, 1,
-0.04092064, -0.2692128, -1.98343, 1, 1, 1, 1, 1,
-0.04011665, -1.211723, -2.452977, 1, 1, 1, 1, 1,
-0.0386648, -1.625901, -2.508383, 1, 1, 1, 1, 1,
-0.03600546, -0.5684004, -2.625951, 1, 1, 1, 1, 1,
-0.02975786, -1.524418, -3.969963, 1, 1, 1, 1, 1,
-0.02771515, -0.2751699, -2.816545, 0, 0, 1, 1, 1,
-0.02686991, 0.453657, 0.3288868, 1, 0, 0, 1, 1,
-0.02373305, -0.03204985, -3.681306, 1, 0, 0, 1, 1,
-0.019413, -0.11421, -2.524196, 1, 0, 0, 1, 1,
-0.01516881, 0.06730874, -0.5672967, 1, 0, 0, 1, 1,
-0.01050082, 0.788056, 0.4972804, 1, 0, 0, 1, 1,
-0.008722341, 0.9614296, 0.03190787, 0, 0, 0, 1, 1,
-0.006800653, -2.359063, -3.381278, 0, 0, 0, 1, 1,
-0.0005321935, -0.4569677, -2.403603, 0, 0, 0, 1, 1,
-0.0003348361, -1.57924, -3.701297, 0, 0, 0, 1, 1,
0.001150778, 0.9996291, -0.9166289, 0, 0, 0, 1, 1,
0.002859256, -1.709693, 3.58712, 0, 0, 0, 1, 1,
0.002886513, 0.7219313, -1.494061, 0, 0, 0, 1, 1,
0.009424527, 0.6789607, -1.08189, 1, 1, 1, 1, 1,
0.01058727, 1.197589, 0.2570035, 1, 1, 1, 1, 1,
0.01455018, -0.6242847, 2.973901, 1, 1, 1, 1, 1,
0.01484069, 0.4152876, -0.7015386, 1, 1, 1, 1, 1,
0.0181149, -0.1985054, 1.233337, 1, 1, 1, 1, 1,
0.01886351, 1.822269, -0.1318751, 1, 1, 1, 1, 1,
0.02640377, 2.1319, 1.054907, 1, 1, 1, 1, 1,
0.02691185, -0.8424249, 3.475414, 1, 1, 1, 1, 1,
0.02890585, 0.9331582, 1.047312, 1, 1, 1, 1, 1,
0.03689763, 0.4683598, -0.1951148, 1, 1, 1, 1, 1,
0.03707542, -1.709378, 3.719121, 1, 1, 1, 1, 1,
0.03773357, -0.2332151, 2.401169, 1, 1, 1, 1, 1,
0.04131062, 0.4497909, 0.5744576, 1, 1, 1, 1, 1,
0.04419583, -0.6500331, 3.466604, 1, 1, 1, 1, 1,
0.04493104, 1.027024, 0.759132, 1, 1, 1, 1, 1,
0.04634826, -0.2853039, 3.587076, 0, 0, 1, 1, 1,
0.04735681, 0.4702912, 0.006957751, 1, 0, 0, 1, 1,
0.04818286, -0.2483254, 2.74224, 1, 0, 0, 1, 1,
0.04826601, -0.5517728, 3.991785, 1, 0, 0, 1, 1,
0.05022219, -1.135345, 1.80049, 1, 0, 0, 1, 1,
0.05486561, 0.4669081, 0.566776, 1, 0, 0, 1, 1,
0.05505794, 0.1163728, -0.5907811, 0, 0, 0, 1, 1,
0.05833681, 1.14953, -0.3976585, 0, 0, 0, 1, 1,
0.06466909, 0.07384743, 1.570752, 0, 0, 0, 1, 1,
0.06495293, -1.392338, 2.984553, 0, 0, 0, 1, 1,
0.06759727, -1.701535, 3.890898, 0, 0, 0, 1, 1,
0.06839029, -0.04389664, 1.308522, 0, 0, 0, 1, 1,
0.07874662, -0.3206218, 2.820746, 0, 0, 0, 1, 1,
0.08758722, 0.3648344, 0.319505, 1, 1, 1, 1, 1,
0.09144693, -0.07740477, 1.851891, 1, 1, 1, 1, 1,
0.09334984, -1.180461, 2.491092, 1, 1, 1, 1, 1,
0.09595035, -0.02059758, 2.56352, 1, 1, 1, 1, 1,
0.1056846, -1.806978, 2.810372, 1, 1, 1, 1, 1,
0.110789, 0.4416617, 0.09582663, 1, 1, 1, 1, 1,
0.1143175, 0.9072528, 1.110698, 1, 1, 1, 1, 1,
0.1175499, 0.7253614, 0.3174467, 1, 1, 1, 1, 1,
0.1179172, 1.317506, 1.084767, 1, 1, 1, 1, 1,
0.1191205, -0.04566262, 1.465076, 1, 1, 1, 1, 1,
0.1213005, -0.6760461, 4.971332, 1, 1, 1, 1, 1,
0.1229307, -0.07297061, 3.251172, 1, 1, 1, 1, 1,
0.1235948, -0.6580209, 2.365984, 1, 1, 1, 1, 1,
0.1264102, 0.05603113, 0.9189481, 1, 1, 1, 1, 1,
0.1273911, 1.210758, 1.708627, 1, 1, 1, 1, 1,
0.1318429, 1.091754, -0.5200724, 0, 0, 1, 1, 1,
0.1328362, -0.7786593, 2.227801, 1, 0, 0, 1, 1,
0.1344861, -0.3286149, 2.766646, 1, 0, 0, 1, 1,
0.1413084, 1.448787, 0.1084777, 1, 0, 0, 1, 1,
0.1423843, -0.224714, 3.212575, 1, 0, 0, 1, 1,
0.1518957, -0.4379048, 2.314741, 1, 0, 0, 1, 1,
0.1521025, -0.9136209, 4.573977, 0, 0, 0, 1, 1,
0.1533475, 0.1934175, 0.1943986, 0, 0, 0, 1, 1,
0.1541526, 1.284263, 0.8194234, 0, 0, 0, 1, 1,
0.1655764, -1.368489, 3.703297, 0, 0, 0, 1, 1,
0.1662236, -0.335326, 3.221754, 0, 0, 0, 1, 1,
0.1683408, -0.6627567, 3.560488, 0, 0, 0, 1, 1,
0.1724886, 0.5442562, 0.5211579, 0, 0, 0, 1, 1,
0.1742757, 0.2071918, 1.988934, 1, 1, 1, 1, 1,
0.1776947, 1.060913, 0.972033, 1, 1, 1, 1, 1,
0.1784979, -1.022074, 5.426844, 1, 1, 1, 1, 1,
0.183778, 0.370369, -0.7968663, 1, 1, 1, 1, 1,
0.1914394, 1.558756, -0.8017004, 1, 1, 1, 1, 1,
0.1920427, 2.461392, 0.3298694, 1, 1, 1, 1, 1,
0.1945194, -1.592001, 1.942839, 1, 1, 1, 1, 1,
0.1955131, -0.1717734, 2.258017, 1, 1, 1, 1, 1,
0.196937, -0.5549077, 1.982219, 1, 1, 1, 1, 1,
0.1978083, 1.007717, 1.023429, 1, 1, 1, 1, 1,
0.1989253, -0.5496311, 2.963857, 1, 1, 1, 1, 1,
0.2057406, 0.761731, -0.8283821, 1, 1, 1, 1, 1,
0.2071309, 1.175298, 0.0905301, 1, 1, 1, 1, 1,
0.2125428, 0.2609531, -0.4387471, 1, 1, 1, 1, 1,
0.2148388, 1.010614, 0.9949282, 1, 1, 1, 1, 1,
0.2185685, -0.4082851, 2.550498, 0, 0, 1, 1, 1,
0.2196216, 0.1976593, 3.349124, 1, 0, 0, 1, 1,
0.2200895, 1.53547, -1.65501, 1, 0, 0, 1, 1,
0.2208533, -0.00701293, 1.729475, 1, 0, 0, 1, 1,
0.2227636, 0.7344409, 0.5161026, 1, 0, 0, 1, 1,
0.2234308, -0.3053467, 3.177484, 1, 0, 0, 1, 1,
0.2272895, -0.6022333, 1.846738, 0, 0, 0, 1, 1,
0.2278975, -0.2843406, 0.7499393, 0, 0, 0, 1, 1,
0.2295062, -0.1813375, 2.496731, 0, 0, 0, 1, 1,
0.2295459, -1.459376, 4.376967, 0, 0, 0, 1, 1,
0.2306488, -0.4452656, 3.15563, 0, 0, 0, 1, 1,
0.2345534, 1.716903, -0.956112, 0, 0, 0, 1, 1,
0.234757, 1.232755, 0.4030112, 0, 0, 0, 1, 1,
0.2355414, -1.890471, 1.425673, 1, 1, 1, 1, 1,
0.2388011, -0.9344734, 3.143193, 1, 1, 1, 1, 1,
0.2430113, 1.134394, 1.606472, 1, 1, 1, 1, 1,
0.2452314, 0.3649446, 1.380541, 1, 1, 1, 1, 1,
0.248603, -0.9451052, 5.789189, 1, 1, 1, 1, 1,
0.2699888, -0.8390407, 1.738828, 1, 1, 1, 1, 1,
0.2704549, 3.83425, 0.3741257, 1, 1, 1, 1, 1,
0.2717368, 0.1347655, -0.2455373, 1, 1, 1, 1, 1,
0.2737619, 0.4776379, 0.0564482, 1, 1, 1, 1, 1,
0.2775941, 0.6079385, 0.9907522, 1, 1, 1, 1, 1,
0.2814305, 1.084217, -0.517713, 1, 1, 1, 1, 1,
0.2814682, -2.525327, 1.98989, 1, 1, 1, 1, 1,
0.2841052, -0.4717132, 1.709125, 1, 1, 1, 1, 1,
0.2943534, 1.278774, 1.196386, 1, 1, 1, 1, 1,
0.3001206, -1.317613, 3.340487, 1, 1, 1, 1, 1,
0.3002361, -0.08332051, 0.5068865, 0, 0, 1, 1, 1,
0.3011834, 0.7174168, 1.58699, 1, 0, 0, 1, 1,
0.3016897, -0.5806862, 1.578748, 1, 0, 0, 1, 1,
0.3038422, 1.592052, 1.482686, 1, 0, 0, 1, 1,
0.3045342, -0.9988474, 3.984492, 1, 0, 0, 1, 1,
0.305934, -0.3969398, 1.130345, 1, 0, 0, 1, 1,
0.3072404, 0.7664332, 0.4432619, 0, 0, 0, 1, 1,
0.3128199, 0.9055949, -0.270427, 0, 0, 0, 1, 1,
0.314181, -0.06419259, 0.9602944, 0, 0, 0, 1, 1,
0.315798, -0.3314245, 0.902133, 0, 0, 0, 1, 1,
0.3162143, 0.2478514, 1.278365, 0, 0, 0, 1, 1,
0.3163923, 0.09948048, 0.6060777, 0, 0, 0, 1, 1,
0.318221, 0.9037414, 0.46454, 0, 0, 0, 1, 1,
0.3194721, -0.3629822, 2.917017, 1, 1, 1, 1, 1,
0.3231882, -0.9901122, 3.238076, 1, 1, 1, 1, 1,
0.323244, 1.060241, -2.384517, 1, 1, 1, 1, 1,
0.3254782, 1.169749, -0.1764093, 1, 1, 1, 1, 1,
0.3277414, -0.4065588, 3.310802, 1, 1, 1, 1, 1,
0.3363637, 1.421295, -0.6007165, 1, 1, 1, 1, 1,
0.3372004, 0.5346492, -0.467691, 1, 1, 1, 1, 1,
0.3411982, 0.4328421, 1.564116, 1, 1, 1, 1, 1,
0.3440658, -0.3171514, 3.151427, 1, 1, 1, 1, 1,
0.3461806, -0.0061924, 1.437691, 1, 1, 1, 1, 1,
0.349714, 0.6555597, 0.7445953, 1, 1, 1, 1, 1,
0.3523001, 0.8096997, -0.3069258, 1, 1, 1, 1, 1,
0.3600001, -1.454449, 3.995573, 1, 1, 1, 1, 1,
0.3609013, 0.4668903, 1.031921, 1, 1, 1, 1, 1,
0.3690275, 0.3533875, 0.170672, 1, 1, 1, 1, 1,
0.3696114, -1.284027, 2.995062, 0, 0, 1, 1, 1,
0.3704408, -0.9616659, 2.184973, 1, 0, 0, 1, 1,
0.3722362, -3.175558, 4.04237, 1, 0, 0, 1, 1,
0.3735873, 0.3984964, 0.8737754, 1, 0, 0, 1, 1,
0.374165, -0.9348494, 2.978028, 1, 0, 0, 1, 1,
0.3743335, 0.2827772, 1.158049, 1, 0, 0, 1, 1,
0.376292, 0.5159363, -1.067284, 0, 0, 0, 1, 1,
0.3763074, -0.695425, 4.593294, 0, 0, 0, 1, 1,
0.3793064, 0.8622532, 1.410973, 0, 0, 0, 1, 1,
0.3839945, -1.602262, 2.350363, 0, 0, 0, 1, 1,
0.389462, -0.6825864, 3.119905, 0, 0, 0, 1, 1,
0.3902216, -0.7256153, 1.797862, 0, 0, 0, 1, 1,
0.3921773, -0.5274909, 1.591435, 0, 0, 0, 1, 1,
0.3921959, 0.7416757, 0.6368735, 1, 1, 1, 1, 1,
0.3927651, 0.4519767, -0.6325195, 1, 1, 1, 1, 1,
0.3956342, -0.7491403, 1.990244, 1, 1, 1, 1, 1,
0.3995135, 2.212201, -1.251316, 1, 1, 1, 1, 1,
0.4004919, -0.6084362, 4.458394, 1, 1, 1, 1, 1,
0.4030581, 1.494653, 0.261303, 1, 1, 1, 1, 1,
0.4081021, -0.558768, 2.434144, 1, 1, 1, 1, 1,
0.4115774, -1.264174, 4.591242, 1, 1, 1, 1, 1,
0.4119259, 0.4837789, 1.632592, 1, 1, 1, 1, 1,
0.4142033, 0.2585561, 1.878673, 1, 1, 1, 1, 1,
0.4170316, 0.10053, 1.760788, 1, 1, 1, 1, 1,
0.4201173, -0.4771302, 3.787622, 1, 1, 1, 1, 1,
0.4232022, 0.8577819, 0.5251392, 1, 1, 1, 1, 1,
0.4277392, -0.4818431, 2.314098, 1, 1, 1, 1, 1,
0.4312981, 0.1317129, -0.4897166, 1, 1, 1, 1, 1,
0.431601, -0.4004799, 2.141814, 0, 0, 1, 1, 1,
0.4317752, -0.286373, 1.425989, 1, 0, 0, 1, 1,
0.4322062, 1.463274, -0.2653889, 1, 0, 0, 1, 1,
0.4325585, -0.6131535, 2.237667, 1, 0, 0, 1, 1,
0.4333198, 0.6106759, 0.01815769, 1, 0, 0, 1, 1,
0.4357227, 0.575961, 0.8696672, 1, 0, 0, 1, 1,
0.4383104, 1.852796, 0.5449932, 0, 0, 0, 1, 1,
0.4386565, -1.274143, 3.41244, 0, 0, 0, 1, 1,
0.4412521, -0.1998537, 3.407821, 0, 0, 0, 1, 1,
0.4512344, -1.358613, 1.970397, 0, 0, 0, 1, 1,
0.4520476, -0.8071017, 3.150703, 0, 0, 0, 1, 1,
0.4570071, 0.02790712, 1.559004, 0, 0, 0, 1, 1,
0.459194, 0.5298815, -1.458742, 0, 0, 0, 1, 1,
0.4598071, -2.136497, 1.444866, 1, 1, 1, 1, 1,
0.4605666, 0.06611083, 2.264572, 1, 1, 1, 1, 1,
0.4649933, 0.9407237, -1.137636, 1, 1, 1, 1, 1,
0.4651089, 0.8113763, -0.7811872, 1, 1, 1, 1, 1,
0.465607, 0.05538088, -0.4460088, 1, 1, 1, 1, 1,
0.4691373, -0.1154677, 2.748482, 1, 1, 1, 1, 1,
0.4771014, -0.4405699, 3.802793, 1, 1, 1, 1, 1,
0.4780714, 1.955114, 0.4516672, 1, 1, 1, 1, 1,
0.4801549, 0.1457884, 0.1438219, 1, 1, 1, 1, 1,
0.4813647, -0.4778329, 2.416542, 1, 1, 1, 1, 1,
0.4829039, -0.04653736, 1.706055, 1, 1, 1, 1, 1,
0.4863192, -0.5904748, 1.942547, 1, 1, 1, 1, 1,
0.4879321, 0.1400762, 1.171652, 1, 1, 1, 1, 1,
0.489575, -1.678293, 1.896397, 1, 1, 1, 1, 1,
0.4896289, 1.019695, -0.1204187, 1, 1, 1, 1, 1,
0.4953103, 0.7069855, 0.1166046, 0, 0, 1, 1, 1,
0.4956773, 0.3878089, 1.637357, 1, 0, 0, 1, 1,
0.4971607, -0.1954609, 1.295063, 1, 0, 0, 1, 1,
0.4999844, 0.02794995, 1.887144, 1, 0, 0, 1, 1,
0.5002792, 1.948125, 0.3541761, 1, 0, 0, 1, 1,
0.5037742, -0.4920258, 3.009695, 1, 0, 0, 1, 1,
0.509307, -1.158357, 2.472228, 0, 0, 0, 1, 1,
0.5093449, 0.2692364, 2.091852, 0, 0, 0, 1, 1,
0.5123151, -0.705534, 1.884017, 0, 0, 0, 1, 1,
0.5149482, -0.04485066, 0.66348, 0, 0, 0, 1, 1,
0.5201991, 0.8515111, -1.630906, 0, 0, 0, 1, 1,
0.528573, 0.0002141923, 1.815598, 0, 0, 0, 1, 1,
0.5321125, -1.668782, 2.445533, 0, 0, 0, 1, 1,
0.5454967, 1.497207, -0.4465056, 1, 1, 1, 1, 1,
0.5480205, 0.7528066, -0.08906122, 1, 1, 1, 1, 1,
0.5496289, -0.9756852, 2.005488, 1, 1, 1, 1, 1,
0.5543104, -0.9054459, 3.062541, 1, 1, 1, 1, 1,
0.556697, -0.04147201, 0.9537968, 1, 1, 1, 1, 1,
0.5579143, -0.3030276, 2.145154, 1, 1, 1, 1, 1,
0.5716621, 0.5043106, 1.088704, 1, 1, 1, 1, 1,
0.572239, -2.029621, 1.297985, 1, 1, 1, 1, 1,
0.5742318, 0.09072456, 1.424297, 1, 1, 1, 1, 1,
0.5745472, -0.2678074, 2.384731, 1, 1, 1, 1, 1,
0.5772635, -0.723897, 2.433247, 1, 1, 1, 1, 1,
0.5779708, -0.3608243, 2.87715, 1, 1, 1, 1, 1,
0.5807759, 1.99862, -0.7397266, 1, 1, 1, 1, 1,
0.5817451, 0.7387817, 1.377959, 1, 1, 1, 1, 1,
0.5830134, 0.1772154, 2.12317, 1, 1, 1, 1, 1,
0.5861447, 0.2329644, -0.04863289, 0, 0, 1, 1, 1,
0.5890915, -0.2397011, 0.4928244, 1, 0, 0, 1, 1,
0.591484, -1.420342, 2.664486, 1, 0, 0, 1, 1,
0.5924649, 1.136657, 0.0103218, 1, 0, 0, 1, 1,
0.5937756, 0.7574533, -0.4410212, 1, 0, 0, 1, 1,
0.5967421, -0.7834845, 3.022869, 1, 0, 0, 1, 1,
0.6010327, 0.8637189, 0.1068098, 0, 0, 0, 1, 1,
0.6037943, 0.02755278, 0.6544601, 0, 0, 0, 1, 1,
0.6093794, 0.9119809, 0.1501109, 0, 0, 0, 1, 1,
0.6109908, -0.5891598, 1.399207, 0, 0, 0, 1, 1,
0.6181515, -1.248299, 1.781061, 0, 0, 0, 1, 1,
0.6206223, -0.1511195, 1.577791, 0, 0, 0, 1, 1,
0.628674, -0.2119721, 0.7625616, 0, 0, 0, 1, 1,
0.6298333, 1.360076, -0.432181, 1, 1, 1, 1, 1,
0.6321016, -0.8054941, 3.820484, 1, 1, 1, 1, 1,
0.6338314, 0.5738552, -0.1672055, 1, 1, 1, 1, 1,
0.6379772, -0.6417041, 2.729473, 1, 1, 1, 1, 1,
0.639011, -0.443047, 2.940642, 1, 1, 1, 1, 1,
0.6466436, -0.1377834, 2.216, 1, 1, 1, 1, 1,
0.6467904, -0.6573873, 3.244616, 1, 1, 1, 1, 1,
0.6485507, 0.9522145, -1.069967, 1, 1, 1, 1, 1,
0.6489648, 0.4681966, 0.8934138, 1, 1, 1, 1, 1,
0.6542323, -0.3192846, 1.377257, 1, 1, 1, 1, 1,
0.6569511, 0.7863641, 1.798367, 1, 1, 1, 1, 1,
0.6608637, -1.45424, 2.416195, 1, 1, 1, 1, 1,
0.6628927, -0.7827042, 2.484985, 1, 1, 1, 1, 1,
0.6633217, -2.02175, 5.27832, 1, 1, 1, 1, 1,
0.6646208, -1.058559, 4.502746, 1, 1, 1, 1, 1,
0.6670494, -0.6323097, 1.932642, 0, 0, 1, 1, 1,
0.667458, -1.312144, 3.698292, 1, 0, 0, 1, 1,
0.6737201, 0.5351263, -0.2044166, 1, 0, 0, 1, 1,
0.6786227, -0.6205856, 2.475697, 1, 0, 0, 1, 1,
0.682237, -1.136686, 3.813082, 1, 0, 0, 1, 1,
0.6909941, -0.3728015, 1.987569, 1, 0, 0, 1, 1,
0.7014041, 1.628693, 0.4462042, 0, 0, 0, 1, 1,
0.70156, 2.72823, 1.090101, 0, 0, 0, 1, 1,
0.7043052, -0.563081, 1.576019, 0, 0, 0, 1, 1,
0.7047876, 0.8313621, 1.125789, 0, 0, 0, 1, 1,
0.709, -0.9843383, 0.8630754, 0, 0, 0, 1, 1,
0.7150906, -1.168771, 1.000411, 0, 0, 0, 1, 1,
0.7194489, -1.736476, 2.23858, 0, 0, 0, 1, 1,
0.7197676, 0.6730834, 0.9165998, 1, 1, 1, 1, 1,
0.7227401, -0.4776628, 2.194823, 1, 1, 1, 1, 1,
0.7237533, 0.843666, 0.09436311, 1, 1, 1, 1, 1,
0.7259619, -0.887276, 0.5838822, 1, 1, 1, 1, 1,
0.7275261, 0.2834092, 0.6095309, 1, 1, 1, 1, 1,
0.7306861, -0.2648436, 1.703297, 1, 1, 1, 1, 1,
0.7316851, -1.462571, 3.665728, 1, 1, 1, 1, 1,
0.7331159, 1.44945, 0.6797469, 1, 1, 1, 1, 1,
0.7332314, 0.05420738, -0.5229852, 1, 1, 1, 1, 1,
0.737117, -0.2055154, 1.34726, 1, 1, 1, 1, 1,
0.7392343, -0.3283084, 1.008681, 1, 1, 1, 1, 1,
0.7393917, -0.1674122, 2.422058, 1, 1, 1, 1, 1,
0.7476575, 0.3339723, 1.04628, 1, 1, 1, 1, 1,
0.74795, -2.051574, 4.344229, 1, 1, 1, 1, 1,
0.7481368, -0.05673555, 2.401419, 1, 1, 1, 1, 1,
0.7482263, 1.02238, 1.303081, 0, 0, 1, 1, 1,
0.7487481, -1.047527, 2.984632, 1, 0, 0, 1, 1,
0.7488381, 0.8372729, -0.9023541, 1, 0, 0, 1, 1,
0.7506014, 0.2063743, 1.760566, 1, 0, 0, 1, 1,
0.7527082, -0.4025866, 2.233274, 1, 0, 0, 1, 1,
0.7539442, 1.887262, -0.4789108, 1, 0, 0, 1, 1,
0.7541177, -1.815567, 1.425275, 0, 0, 0, 1, 1,
0.7559531, -1.230456, 1.992146, 0, 0, 0, 1, 1,
0.7635112, 0.9327936, -0.2990722, 0, 0, 0, 1, 1,
0.7680922, -0.8291314, 2.66647, 0, 0, 0, 1, 1,
0.7712793, 1.515342, 0.8044187, 0, 0, 0, 1, 1,
0.7808554, 0.394197, 2.71788, 0, 0, 0, 1, 1,
0.7809574, 1.089026, 1.161431, 0, 0, 0, 1, 1,
0.7838142, 1.106485, -0.5247372, 1, 1, 1, 1, 1,
0.7865281, -0.3633187, 2.047887, 1, 1, 1, 1, 1,
0.7887356, 1.176393, 1.097697, 1, 1, 1, 1, 1,
0.7918201, -0.2042838, 2.028296, 1, 1, 1, 1, 1,
0.7983717, -0.9459273, 3.627885, 1, 1, 1, 1, 1,
0.7996209, -0.664813, 1.500168, 1, 1, 1, 1, 1,
0.8003381, -0.3484199, 2.548869, 1, 1, 1, 1, 1,
0.8006727, -0.3276705, 1.318596, 1, 1, 1, 1, 1,
0.8053458, 0.06752365, 2.700154, 1, 1, 1, 1, 1,
0.8075018, -0.7002092, 2.876859, 1, 1, 1, 1, 1,
0.8094606, -0.2050947, 2.303522, 1, 1, 1, 1, 1,
0.8120286, -0.580289, 0.5323403, 1, 1, 1, 1, 1,
0.8124977, 0.7753483, 2.464849, 1, 1, 1, 1, 1,
0.8141901, 1.376078, 0.5027373, 1, 1, 1, 1, 1,
0.8142091, -2.446983, 2.418958, 1, 1, 1, 1, 1,
0.8146166, -0.281574, 1.755573, 0, 0, 1, 1, 1,
0.8153659, -0.05546949, 2.744829, 1, 0, 0, 1, 1,
0.8156483, 0.5988122, -0.1150248, 1, 0, 0, 1, 1,
0.823055, -0.7646631, 0.5446048, 1, 0, 0, 1, 1,
0.8249743, -1.287095, 1.532832, 1, 0, 0, 1, 1,
0.8291255, -1.093517, 3.259706, 1, 0, 0, 1, 1,
0.8328339, 0.6908596, 0.9887347, 0, 0, 0, 1, 1,
0.8353425, -0.8457803, 2.708986, 0, 0, 0, 1, 1,
0.8374804, -0.2067896, 0.7600427, 0, 0, 0, 1, 1,
0.837747, 1.0888, -0.04881447, 0, 0, 0, 1, 1,
0.8437144, 1.589211, 2.130343, 0, 0, 0, 1, 1,
0.852316, 1.302662, 0.1587382, 0, 0, 0, 1, 1,
0.8556874, -1.019943, 3.946595, 0, 0, 0, 1, 1,
0.8614676, -1.961883, 4.200412, 1, 1, 1, 1, 1,
0.8620816, 0.9636658, -0.560406, 1, 1, 1, 1, 1,
0.8640584, -0.6117963, 2.684756, 1, 1, 1, 1, 1,
0.8656239, -0.1055541, 3.038969, 1, 1, 1, 1, 1,
0.867688, -0.3136409, 2.287186, 1, 1, 1, 1, 1,
0.867991, -2.218469, 3.402877, 1, 1, 1, 1, 1,
0.8779895, -0.8274725, 4.840192, 1, 1, 1, 1, 1,
0.8810186, 0.15739, 0.9668083, 1, 1, 1, 1, 1,
0.8820052, 0.5307602, 2.225106, 1, 1, 1, 1, 1,
0.8820349, -0.1506626, 1.915734, 1, 1, 1, 1, 1,
0.8833011, -1.322073, 3.394246, 1, 1, 1, 1, 1,
0.8858656, 0.3184476, 1.019743, 1, 1, 1, 1, 1,
0.889406, -1.930359, 1.374034, 1, 1, 1, 1, 1,
0.8957773, -1.624757, 3.189081, 1, 1, 1, 1, 1,
0.8958212, 0.27518, -0.1744489, 1, 1, 1, 1, 1,
0.8961723, -1.307623, 2.400105, 0, 0, 1, 1, 1,
0.8986194, 0.5060771, 0.5523266, 1, 0, 0, 1, 1,
0.9006581, 0.5590667, 1.553074, 1, 0, 0, 1, 1,
0.9141551, -2.899774, 1.002188, 1, 0, 0, 1, 1,
0.9156542, -1.38586, 4.680941, 1, 0, 0, 1, 1,
0.9202965, 2.17346, 0.4086125, 1, 0, 0, 1, 1,
0.9205076, 0.3852777, -0.5615443, 0, 0, 0, 1, 1,
0.9228193, -0.7207739, 1.935421, 0, 0, 0, 1, 1,
0.9315071, 0.560407, 2.225973, 0, 0, 0, 1, 1,
0.9336358, 0.5254288, 1.179956, 0, 0, 0, 1, 1,
0.9373007, 0.1747148, 2.599123, 0, 0, 0, 1, 1,
0.9396426, 0.5118115, 0.8113492, 0, 0, 0, 1, 1,
0.9425095, -0.9580899, 1.398532, 0, 0, 0, 1, 1,
0.9465474, -0.2753996, 2.623185, 1, 1, 1, 1, 1,
0.9490303, -0.2098166, 2.477842, 1, 1, 1, 1, 1,
0.949071, 1.73312, 1.089332, 1, 1, 1, 1, 1,
0.9492087, -0.3564089, 1.615865, 1, 1, 1, 1, 1,
0.9513423, 1.127841, 0.5922142, 1, 1, 1, 1, 1,
0.9529039, 0.002022022, 0.1577244, 1, 1, 1, 1, 1,
0.9576855, 0.5879874, 2.059073, 1, 1, 1, 1, 1,
0.9580297, -0.7180185, 3.288407, 1, 1, 1, 1, 1,
0.9596924, 1.473588, 0.9630428, 1, 1, 1, 1, 1,
0.9650392, 0.1662783, -0.2167332, 1, 1, 1, 1, 1,
0.9667634, 1.310833, 1.087611, 1, 1, 1, 1, 1,
0.968309, 1.316647, -0.6367449, 1, 1, 1, 1, 1,
0.9722263, 0.3697416, 0.9868946, 1, 1, 1, 1, 1,
0.9923536, 1.314944, 1.381671, 1, 1, 1, 1, 1,
0.9941974, -0.8359016, 2.339474, 1, 1, 1, 1, 1,
1.004249, 1.096552, 0.03461784, 0, 0, 1, 1, 1,
1.015315, 0.9730808, 0.5453547, 1, 0, 0, 1, 1,
1.015975, 1.011589, 0.04215739, 1, 0, 0, 1, 1,
1.019483, -1.07141, 3.757918, 1, 0, 0, 1, 1,
1.019793, 0.3972417, 1.492456, 1, 0, 0, 1, 1,
1.020639, -0.162614, 0.6430838, 1, 0, 0, 1, 1,
1.032567, 1.11195, 1.904626, 0, 0, 0, 1, 1,
1.032775, -0.03743773, 1.627919, 0, 0, 0, 1, 1,
1.034604, -1.196707, 2.685717, 0, 0, 0, 1, 1,
1.037294, -0.3276126, 2.157357, 0, 0, 0, 1, 1,
1.040758, -0.9146084, 2.71186, 0, 0, 0, 1, 1,
1.040762, 0.02270982, 2.015623, 0, 0, 0, 1, 1,
1.04964, -2.227107, 2.925467, 0, 0, 0, 1, 1,
1.049996, -1.020727, 2.088107, 1, 1, 1, 1, 1,
1.051466, 0.0771554, 0.08365667, 1, 1, 1, 1, 1,
1.053024, 0.671189, 3.143363, 1, 1, 1, 1, 1,
1.055257, -0.5662764, 0.2692411, 1, 1, 1, 1, 1,
1.057272, 0.5347884, 1.846609, 1, 1, 1, 1, 1,
1.0598, 0.9886425, 0.4649116, 1, 1, 1, 1, 1,
1.071391, 0.3782924, 1.226758, 1, 1, 1, 1, 1,
1.078889, -0.2229744, 2.468414, 1, 1, 1, 1, 1,
1.080664, 0.2321514, 2.919555, 1, 1, 1, 1, 1,
1.081747, 0.6947334, 1.759654, 1, 1, 1, 1, 1,
1.083908, 0.1603971, 0.715161, 1, 1, 1, 1, 1,
1.08728, 0.3770357, 0.1318987, 1, 1, 1, 1, 1,
1.088535, 0.1305486, 0.7479529, 1, 1, 1, 1, 1,
1.096906, 0.849519, 0.6740938, 1, 1, 1, 1, 1,
1.098546, 1.071805, -0.4551135, 1, 1, 1, 1, 1,
1.099884, 0.7702414, 1.978994, 0, 0, 1, 1, 1,
1.105571, 0.3203942, 0.04238927, 1, 0, 0, 1, 1,
1.106639, -1.345165, 2.555808, 1, 0, 0, 1, 1,
1.109622, 0.5270216, 0.3108194, 1, 0, 0, 1, 1,
1.115841, -0.6366819, 0.8837839, 1, 0, 0, 1, 1,
1.138468, 1.48852, 1.099908, 1, 0, 0, 1, 1,
1.140471, -0.1385287, 1.430096, 0, 0, 0, 1, 1,
1.149848, 1.084399, 0.3018855, 0, 0, 0, 1, 1,
1.1522, -0.8221124, 2.955299, 0, 0, 0, 1, 1,
1.156808, -0.5276552, 0.3863908, 0, 0, 0, 1, 1,
1.157531, -0.3825948, 0.7300901, 0, 0, 0, 1, 1,
1.161717, -0.9794587, 1.488232, 0, 0, 0, 1, 1,
1.163742, -0.5441184, 2.189902, 0, 0, 0, 1, 1,
1.166464, -0.5749256, 3.257249, 1, 1, 1, 1, 1,
1.166775, -0.3976846, 2.910208, 1, 1, 1, 1, 1,
1.16698, 1.171404, 0.5232671, 1, 1, 1, 1, 1,
1.172553, 0.159161, 1.760587, 1, 1, 1, 1, 1,
1.17485, -1.125518, 4.142531, 1, 1, 1, 1, 1,
1.182157, -1.151438, 2.294414, 1, 1, 1, 1, 1,
1.184057, -0.373154, 0.8345578, 1, 1, 1, 1, 1,
1.198219, 0.1528647, 2.589406, 1, 1, 1, 1, 1,
1.21521, 0.3693492, 1.841822, 1, 1, 1, 1, 1,
1.226953, 0.7366959, 3.034303, 1, 1, 1, 1, 1,
1.235671, 0.8934757, 1.370464, 1, 1, 1, 1, 1,
1.24319, -0.04372371, 1.256821, 1, 1, 1, 1, 1,
1.244861, 1.028012, -1.135576, 1, 1, 1, 1, 1,
1.248512, -0.4406873, 1.672918, 1, 1, 1, 1, 1,
1.248546, 0.1347656, 1.014684, 1, 1, 1, 1, 1,
1.256546, 2.070881, 0.1996277, 0, 0, 1, 1, 1,
1.257699, -0.05529536, -0.04271327, 1, 0, 0, 1, 1,
1.259153, 1.454551, -0.04333561, 1, 0, 0, 1, 1,
1.269986, 0.6184449, 1.43656, 1, 0, 0, 1, 1,
1.280804, -2.924918, 3.6083, 1, 0, 0, 1, 1,
1.282017, 1.875173, 2.713854, 1, 0, 0, 1, 1,
1.288447, -1.735779, 2.819965, 0, 0, 0, 1, 1,
1.289668, -0.351851, 0.7329138, 0, 0, 0, 1, 1,
1.310333, -0.6383983, 1.929299, 0, 0, 0, 1, 1,
1.325096, -0.7590005, 1.722829, 0, 0, 0, 1, 1,
1.331087, 0.8744447, 2.650966, 0, 0, 0, 1, 1,
1.339238, 1.205782, -1.786565, 0, 0, 0, 1, 1,
1.353696, -0.4408357, 3.165756, 0, 0, 0, 1, 1,
1.354258, 2.342547, 0.1718244, 1, 1, 1, 1, 1,
1.35654, 0.5283281, 1.451571, 1, 1, 1, 1, 1,
1.3625, 0.7813823, 1.502649, 1, 1, 1, 1, 1,
1.363981, -0.02694917, 0.01710969, 1, 1, 1, 1, 1,
1.371135, -0.8517623, 2.833575, 1, 1, 1, 1, 1,
1.382285, 1.08965, 0.05232783, 1, 1, 1, 1, 1,
1.391448, 0.1208575, 0.9598988, 1, 1, 1, 1, 1,
1.397092, 2.275119, -0.7407561, 1, 1, 1, 1, 1,
1.403913, -0.5387337, 4.676178, 1, 1, 1, 1, 1,
1.407046, -0.2824868, 1.293298, 1, 1, 1, 1, 1,
1.409702, -0.8980138, 2.668771, 1, 1, 1, 1, 1,
1.413765, 0.7387765, 2.007813, 1, 1, 1, 1, 1,
1.41984, -0.9780391, 3.507905, 1, 1, 1, 1, 1,
1.428684, 0.7860169, 1.525235, 1, 1, 1, 1, 1,
1.432151, -0.2356565, 0.5763388, 1, 1, 1, 1, 1,
1.432452, -0.180221, 0.3689348, 0, 0, 1, 1, 1,
1.435546, -2.421889, 3.664238, 1, 0, 0, 1, 1,
1.436411, 1.712674, 0.7313413, 1, 0, 0, 1, 1,
1.445309, -1.361501, 1.852488, 1, 0, 0, 1, 1,
1.446611, -0.4095141, 2.817091, 1, 0, 0, 1, 1,
1.45921, 0.858166, 0.4041086, 1, 0, 0, 1, 1,
1.460722, -1.353809, 3.25976, 0, 0, 0, 1, 1,
1.460887, 0.5049177, 3.163561, 0, 0, 0, 1, 1,
1.464024, -1.100853, 2.273357, 0, 0, 0, 1, 1,
1.4762, 0.2683847, 2.055399, 0, 0, 0, 1, 1,
1.485013, -0.434685, 2.681115, 0, 0, 0, 1, 1,
1.48677, -0.2414599, 2.573735, 0, 0, 0, 1, 1,
1.497103, 1.780114, -0.0119467, 0, 0, 0, 1, 1,
1.49723, -1.405365, 1.635019, 1, 1, 1, 1, 1,
1.501168, 0.2526291, 2.04194, 1, 1, 1, 1, 1,
1.514618, 0.1513718, 2.345054, 1, 1, 1, 1, 1,
1.525452, 1.367618, 1.109563, 1, 1, 1, 1, 1,
1.550448, 0.3967777, 0.3190436, 1, 1, 1, 1, 1,
1.554494, 0.4104913, 2.040448, 1, 1, 1, 1, 1,
1.576258, -0.01679054, 0.1691862, 1, 1, 1, 1, 1,
1.581531, 0.02218356, 2.531595, 1, 1, 1, 1, 1,
1.586175, 0.9006992, 2.36023, 1, 1, 1, 1, 1,
1.621279, 1.03948, -0.06785714, 1, 1, 1, 1, 1,
1.625226, -0.04817901, 0.7725604, 1, 1, 1, 1, 1,
1.625807, 0.6248336, 0.9233326, 1, 1, 1, 1, 1,
1.626915, 0.4509352, 3.179406, 1, 1, 1, 1, 1,
1.636551, 0.4616035, 1.956881, 1, 1, 1, 1, 1,
1.638743, -1.189343, 2.682077, 1, 1, 1, 1, 1,
1.638882, 1.610591, 1.40456, 0, 0, 1, 1, 1,
1.64376, 1.911756, 0.8580871, 1, 0, 0, 1, 1,
1.647969, -0.8909686, 2.510349, 1, 0, 0, 1, 1,
1.648878, 0.08721928, 2.339252, 1, 0, 0, 1, 1,
1.673976, 1.819942, -0.3455365, 1, 0, 0, 1, 1,
1.680869, 0.5352313, 1.540334, 1, 0, 0, 1, 1,
1.681588, -0.331796, 1.503947, 0, 0, 0, 1, 1,
1.683812, -1.885229, 1.845077, 0, 0, 0, 1, 1,
1.713163, 0.5452504, 0.4925948, 0, 0, 0, 1, 1,
1.730301, 0.7528887, 0.5257919, 0, 0, 0, 1, 1,
1.732972, 0.2302504, 0.5087179, 0, 0, 0, 1, 1,
1.84693, -0.985983, 2.101571, 0, 0, 0, 1, 1,
1.878389, 1.65457, 1.191335, 0, 0, 0, 1, 1,
1.880865, -1.311211, 2.969701, 1, 1, 1, 1, 1,
1.886361, 0.7545218, 0.7078959, 1, 1, 1, 1, 1,
1.926575, 1.297149, 1.544812, 1, 1, 1, 1, 1,
1.932765, 0.7588345, 1.473923, 1, 1, 1, 1, 1,
1.936913, -0.3479419, 3.242116, 1, 1, 1, 1, 1,
1.958036, -0.3185219, 2.606685, 1, 1, 1, 1, 1,
1.96374, -1.248413, 2.357634, 1, 1, 1, 1, 1,
1.989867, 0.9409457, 1.282374, 1, 1, 1, 1, 1,
2.000074, -1.789371, 2.994135, 1, 1, 1, 1, 1,
2.034964, 0.7772534, 2.408687, 1, 1, 1, 1, 1,
2.058919, -1.653605, 1.536101, 1, 1, 1, 1, 1,
2.095885, 0.5199688, 1.002585, 1, 1, 1, 1, 1,
2.104593, -1.391905, -0.1523739, 1, 1, 1, 1, 1,
2.110966, 0.4659948, -0.126546, 1, 1, 1, 1, 1,
2.137561, -0.9017493, 1.147101, 1, 1, 1, 1, 1,
2.16806, -0.8773015, 2.084643, 0, 0, 1, 1, 1,
2.217838, 0.2212846, 1.604, 1, 0, 0, 1, 1,
2.237725, -0.5975291, 3.93194, 1, 0, 0, 1, 1,
2.264107, 0.1657675, 0.2809896, 1, 0, 0, 1, 1,
2.381027, 1.398284, 3.025913, 1, 0, 0, 1, 1,
2.428964, -0.5347172, 3.167268, 1, 0, 0, 1, 1,
2.432847, 0.8492322, 1.44075, 0, 0, 0, 1, 1,
2.433275, 1.537653, -0.3643588, 0, 0, 0, 1, 1,
2.463118, -0.01514161, 0.1141427, 0, 0, 0, 1, 1,
2.502688, 0.1434994, 1.485726, 0, 0, 0, 1, 1,
2.535124, -1.071899, 0.6376883, 0, 0, 0, 1, 1,
2.595683, 1.141901, 0.07775641, 0, 0, 0, 1, 1,
2.632097, 0.5061421, 1.660741, 0, 0, 0, 1, 1,
2.639666, -1.165478, 1.534531, 1, 1, 1, 1, 1,
2.682333, 0.7465976, 0.8939705, 1, 1, 1, 1, 1,
2.741881, 0.5931517, 1.107715, 1, 1, 1, 1, 1,
2.970107, 0.948957, 1.490854, 1, 1, 1, 1, 1,
3.117882, -0.03983406, 1.362105, 1, 1, 1, 1, 1,
3.268029, 0.6866373, 2.519043, 1, 1, 1, 1, 1,
3.966292, -0.5305853, 0.931986, 1, 1, 1, 1, 1
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
var radius = 9.89655;
var distance = 34.76121;
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
mvMatrix.translate( -0.4705048, -0.3293459, -0.4301569 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.76121);
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
