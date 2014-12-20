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
-3.095734, 0.02748303, -0.9738019, 1, 0, 0, 1,
-3.073422, 0.575938, -1.802116, 1, 0.007843138, 0, 1,
-3.058144, 1.3488, -0.316349, 1, 0.01176471, 0, 1,
-3.054769, 2.947201, -0.130471, 1, 0.01960784, 0, 1,
-2.967557, -1.651473, -0.5633723, 1, 0.02352941, 0, 1,
-2.964179, -0.2524997, 0.01059539, 1, 0.03137255, 0, 1,
-2.777002, 1.476181, -2.794508, 1, 0.03529412, 0, 1,
-2.739431, -0.9387057, -0.01940305, 1, 0.04313726, 0, 1,
-2.721828, 0.170791, -0.8162679, 1, 0.04705882, 0, 1,
-2.578828, -0.2031413, -3.04044, 1, 0.05490196, 0, 1,
-2.576577, 0.004631806, -2.265882, 1, 0.05882353, 0, 1,
-2.493092, 0.1774189, -1.868338, 1, 0.06666667, 0, 1,
-2.457473, -1.908162, -0.396506, 1, 0.07058824, 0, 1,
-2.305172, 0.3177738, -3.365399, 1, 0.07843138, 0, 1,
-2.278387, -0.5451152, -1.445745, 1, 0.08235294, 0, 1,
-2.272518, -0.5800264, -1.115307, 1, 0.09019608, 0, 1,
-2.221083, 1.284263, 2.188294, 1, 0.09411765, 0, 1,
-2.190194, -0.06269815, -0.1591266, 1, 0.1019608, 0, 1,
-2.064926, -0.4083793, -0.936191, 1, 0.1098039, 0, 1,
-2.064667, 0.09379298, -1.272947, 1, 0.1137255, 0, 1,
-2.038248, -0.1719566, -1.025951, 1, 0.1215686, 0, 1,
-2.031563, 0.09834095, -1.042442, 1, 0.1254902, 0, 1,
-2.030427, -0.6378886, -3.174068, 1, 0.1333333, 0, 1,
-2.030148, -0.5105926, -2.220107, 1, 0.1372549, 0, 1,
-2.029984, 1.12314, -1.598704, 1, 0.145098, 0, 1,
-2.010736, 0.2972153, -1.253178, 1, 0.1490196, 0, 1,
-1.995469, 0.06040306, -3.234899, 1, 0.1568628, 0, 1,
-1.988101, -0.8618411, -3.57208, 1, 0.1607843, 0, 1,
-1.985177, -0.7210764, -2.679383, 1, 0.1686275, 0, 1,
-1.96586, 0.001670363, -1.321419, 1, 0.172549, 0, 1,
-1.961482, 0.5946673, -0.1078346, 1, 0.1803922, 0, 1,
-1.961434, -1.378561, -3.028047, 1, 0.1843137, 0, 1,
-1.937026, -0.8289464, -3.617966, 1, 0.1921569, 0, 1,
-1.895849, 1.077348, -0.9129174, 1, 0.1960784, 0, 1,
-1.853864, -0.3471268, -2.547759, 1, 0.2039216, 0, 1,
-1.838071, 0.6086234, -0.4997326, 1, 0.2117647, 0, 1,
-1.795025, 1.407254, -1.295614, 1, 0.2156863, 0, 1,
-1.779626, 0.7262325, -1.608212, 1, 0.2235294, 0, 1,
-1.76936, 0.2701567, 0.06758244, 1, 0.227451, 0, 1,
-1.767295, 1.263607, -0.3114004, 1, 0.2352941, 0, 1,
-1.7665, 0.7595165, -1.615694, 1, 0.2392157, 0, 1,
-1.73991, 0.8293189, 0.7519991, 1, 0.2470588, 0, 1,
-1.726442, 0.03266557, -0.1735599, 1, 0.2509804, 0, 1,
-1.722195, -1.020902, -1.643432, 1, 0.2588235, 0, 1,
-1.721005, 0.1704404, -2.647387, 1, 0.2627451, 0, 1,
-1.716111, 0.5032632, -2.625463, 1, 0.2705882, 0, 1,
-1.700368, 0.7988073, -1.227025, 1, 0.2745098, 0, 1,
-1.687572, -1.143215, -2.202965, 1, 0.282353, 0, 1,
-1.681435, -0.473903, -2.024217, 1, 0.2862745, 0, 1,
-1.677046, 1.331129, 0.7305928, 1, 0.2941177, 0, 1,
-1.673591, 0.5848337, -0.4033548, 1, 0.3019608, 0, 1,
-1.659463, -0.226403, -2.915681, 1, 0.3058824, 0, 1,
-1.656632, 0.4631317, -0.7580504, 1, 0.3137255, 0, 1,
-1.649538, -0.4381205, -0.3806872, 1, 0.3176471, 0, 1,
-1.627448, -1.253682, -2.457811, 1, 0.3254902, 0, 1,
-1.618324, -0.09736826, -2.479098, 1, 0.3294118, 0, 1,
-1.614374, 2.160438, -1.777368, 1, 0.3372549, 0, 1,
-1.613881, 0.7050493, -0.6537757, 1, 0.3411765, 0, 1,
-1.584868, -0.07175966, -0.8321543, 1, 0.3490196, 0, 1,
-1.581008, -0.9110802, -3.260457, 1, 0.3529412, 0, 1,
-1.580912, 0.2930537, -1.085217, 1, 0.3607843, 0, 1,
-1.573565, 0.1069296, -2.459301, 1, 0.3647059, 0, 1,
-1.573475, 0.1273671, -1.361977, 1, 0.372549, 0, 1,
-1.547771, -0.1386181, -3.738842, 1, 0.3764706, 0, 1,
-1.545465, -0.302916, -2.69013, 1, 0.3843137, 0, 1,
-1.539542, -0.9579409, -0.9299851, 1, 0.3882353, 0, 1,
-1.537066, 2.184203, -0.7923771, 1, 0.3960784, 0, 1,
-1.536997, -1.893989, -3.073818, 1, 0.4039216, 0, 1,
-1.534812, 0.6976402, -2.354451, 1, 0.4078431, 0, 1,
-1.51585, -1.965279, -0.6657621, 1, 0.4156863, 0, 1,
-1.514971, -2.057341, -1.830049, 1, 0.4196078, 0, 1,
-1.50968, -1.391829, -2.675837, 1, 0.427451, 0, 1,
-1.509415, 1.118942, -1.269458, 1, 0.4313726, 0, 1,
-1.499424, 0.240206, -2.510757, 1, 0.4392157, 0, 1,
-1.486444, 0.2078461, -2.063822, 1, 0.4431373, 0, 1,
-1.466974, -0.5644975, -2.513007, 1, 0.4509804, 0, 1,
-1.466655, -0.2155881, -1.710775, 1, 0.454902, 0, 1,
-1.459957, 0.09153409, -3.011654, 1, 0.4627451, 0, 1,
-1.459197, 1.598065, -1.304014, 1, 0.4666667, 0, 1,
-1.455868, 0.9676127, -0.09120698, 1, 0.4745098, 0, 1,
-1.447716, -0.5548222, -2.890154, 1, 0.4784314, 0, 1,
-1.433345, 0.3605952, 0.08184303, 1, 0.4862745, 0, 1,
-1.402185, -0.9648453, -2.80979, 1, 0.4901961, 0, 1,
-1.396915, 0.6809171, -2.039432, 1, 0.4980392, 0, 1,
-1.395488, -1.358749, -3.239071, 1, 0.5058824, 0, 1,
-1.39095, 0.6307404, -1.951803, 1, 0.509804, 0, 1,
-1.37868, -1.402366, -1.806668, 1, 0.5176471, 0, 1,
-1.370857, 0.02131529, -0.2777616, 1, 0.5215687, 0, 1,
-1.368824, -0.6602768, -1.584185, 1, 0.5294118, 0, 1,
-1.35288, -0.6967326, -3.313133, 1, 0.5333334, 0, 1,
-1.348204, 0.6557664, -1.732045, 1, 0.5411765, 0, 1,
-1.347575, 0.1729873, -0.8560458, 1, 0.5450981, 0, 1,
-1.333901, 0.7249805, -1.369293, 1, 0.5529412, 0, 1,
-1.320168, -0.6320984, -2.14234, 1, 0.5568628, 0, 1,
-1.315924, -1.503784, -2.491131, 1, 0.5647059, 0, 1,
-1.308007, 0.9420998, -1.196338, 1, 0.5686275, 0, 1,
-1.295985, -0.2889758, -0.9779188, 1, 0.5764706, 0, 1,
-1.285782, -0.9041199, -2.286642, 1, 0.5803922, 0, 1,
-1.280644, 0.534375, -2.091972, 1, 0.5882353, 0, 1,
-1.279347, -0.9795591, -1.945238, 1, 0.5921569, 0, 1,
-1.273759, -1.695475, -1.00936, 1, 0.6, 0, 1,
-1.266605, 0.4984022, -1.409964, 1, 0.6078432, 0, 1,
-1.261912, 2.20182, 0.4747375, 1, 0.6117647, 0, 1,
-1.243114, 0.7163064, -1.169966, 1, 0.6196079, 0, 1,
-1.239171, -0.3500665, -1.940742, 1, 0.6235294, 0, 1,
-1.230708, 1.218864, -2.181402, 1, 0.6313726, 0, 1,
-1.229169, -0.01454277, -0.9267671, 1, 0.6352941, 0, 1,
-1.229004, 0.5186433, -2.645308, 1, 0.6431373, 0, 1,
-1.228405, -0.7405194, -4.453414, 1, 0.6470588, 0, 1,
-1.211823, -0.4904881, -1.698979, 1, 0.654902, 0, 1,
-1.206456, 2.015017, 0.5414922, 1, 0.6588235, 0, 1,
-1.195017, 0.7437935, -0.8394799, 1, 0.6666667, 0, 1,
-1.193999, 2.982862, -1.489107, 1, 0.6705883, 0, 1,
-1.187605, 0.8628104, -1.053225, 1, 0.6784314, 0, 1,
-1.181385, -0.04206168, -1.388072, 1, 0.682353, 0, 1,
-1.168815, -1.876231, -3.122892, 1, 0.6901961, 0, 1,
-1.16748, 0.5116256, -0.6335682, 1, 0.6941177, 0, 1,
-1.165417, 2.213837, -1.383045, 1, 0.7019608, 0, 1,
-1.164682, -0.1028679, -3.350563, 1, 0.7098039, 0, 1,
-1.163648, 0.4126603, -3.142707, 1, 0.7137255, 0, 1,
-1.161392, 1.141378, -0.6643491, 1, 0.7215686, 0, 1,
-1.156601, 0.06043231, -2.997646, 1, 0.7254902, 0, 1,
-1.154942, 0.1814972, -1.776978, 1, 0.7333333, 0, 1,
-1.150534, 1.053255, 0.7202041, 1, 0.7372549, 0, 1,
-1.150151, -1.223754, -0.9959527, 1, 0.7450981, 0, 1,
-1.139696, -2.277581, -1.121988, 1, 0.7490196, 0, 1,
-1.135468, -0.7423341, -2.696049, 1, 0.7568628, 0, 1,
-1.133694, 0.1094297, -0.7473489, 1, 0.7607843, 0, 1,
-1.130515, 1.292446, -0.6766728, 1, 0.7686275, 0, 1,
-1.12497, 1.038712, 0.4129843, 1, 0.772549, 0, 1,
-1.117699, -1.088663, -4.002781, 1, 0.7803922, 0, 1,
-1.116051, 0.8542415, -0.1052814, 1, 0.7843137, 0, 1,
-1.111303, 0.8649802, -1.750341, 1, 0.7921569, 0, 1,
-1.10114, 1.797476, -1.19504, 1, 0.7960784, 0, 1,
-1.100307, 0.9534018, -2.033889, 1, 0.8039216, 0, 1,
-1.097229, 1.440465, -2.938349, 1, 0.8117647, 0, 1,
-1.094986, -0.5333312, -0.4526093, 1, 0.8156863, 0, 1,
-1.090968, 0.674592, -0.1068906, 1, 0.8235294, 0, 1,
-1.086037, 0.6636484, -0.7679403, 1, 0.827451, 0, 1,
-1.084312, 1.10759, -2.026637, 1, 0.8352941, 0, 1,
-1.07102, 0.3438396, -3.150177, 1, 0.8392157, 0, 1,
-1.069901, 0.08757514, -3.160223, 1, 0.8470588, 0, 1,
-1.067421, 0.01748676, -0.8335693, 1, 0.8509804, 0, 1,
-1.065487, 1.050431, -0.6777877, 1, 0.8588235, 0, 1,
-1.060847, -0.2136409, -1.061764, 1, 0.8627451, 0, 1,
-1.05577, -0.344431, -2.722731, 1, 0.8705882, 0, 1,
-1.047455, 0.7980472, -1.31009, 1, 0.8745098, 0, 1,
-1.04675, -1.14709, -2.493413, 1, 0.8823529, 0, 1,
-1.045101, -0.7961482, -2.843196, 1, 0.8862745, 0, 1,
-1.044494, -0.915359, -4.713396, 1, 0.8941177, 0, 1,
-1.035069, -0.6414471, -3.38035, 1, 0.8980392, 0, 1,
-1.014252, -0.5278524, -2.820312, 1, 0.9058824, 0, 1,
-1.012642, 1.197909, -0.4392547, 1, 0.9137255, 0, 1,
-1.00895, 1.944828, 0.08121344, 1, 0.9176471, 0, 1,
-1.008672, -0.3191227, -2.391206, 1, 0.9254902, 0, 1,
-1.007087, -0.5017893, -1.838943, 1, 0.9294118, 0, 1,
-1.006787, 1.968331, 0.02557837, 1, 0.9372549, 0, 1,
-1.002123, 1.37588, -0.6978363, 1, 0.9411765, 0, 1,
-1.000703, -1.297538, -3.056821, 1, 0.9490196, 0, 1,
-0.9961659, -1.007059, -1.534334, 1, 0.9529412, 0, 1,
-0.9932797, -0.6239377, -2.140318, 1, 0.9607843, 0, 1,
-0.9912784, 0.6526377, -0.5867254, 1, 0.9647059, 0, 1,
-0.9879158, -1.697867, -4.241194, 1, 0.972549, 0, 1,
-0.9861368, -0.3920625, -2.915039, 1, 0.9764706, 0, 1,
-0.9827901, 1.11628, 1.29763, 1, 0.9843137, 0, 1,
-0.9778718, 0.1200391, -2.128176, 1, 0.9882353, 0, 1,
-0.9740599, -0.1324119, -3.29341, 1, 0.9960784, 0, 1,
-0.9639217, -0.2736312, -1.334755, 0.9960784, 1, 0, 1,
-0.9639182, 2.282794, 0.1994893, 0.9921569, 1, 0, 1,
-0.9604444, 0.7417597, -1.424648, 0.9843137, 1, 0, 1,
-0.956336, -0.2065904, -2.198728, 0.9803922, 1, 0, 1,
-0.9497426, 1.387487, 0.2954433, 0.972549, 1, 0, 1,
-0.9491395, -0.5239052, -2.73541, 0.9686275, 1, 0, 1,
-0.944509, -0.4503972, -1.700565, 0.9607843, 1, 0, 1,
-0.9435146, -2.093641, -2.883157, 0.9568627, 1, 0, 1,
-0.9317298, 0.6403908, -1.05486, 0.9490196, 1, 0, 1,
-0.9287532, 1.392201, 0.9584306, 0.945098, 1, 0, 1,
-0.9241193, 0.0765999, -2.573034, 0.9372549, 1, 0, 1,
-0.924114, 0.5169476, -2.359141, 0.9333333, 1, 0, 1,
-0.920864, -0.3298444, -1.159806, 0.9254902, 1, 0, 1,
-0.9172462, 0.3987579, -0.4081078, 0.9215686, 1, 0, 1,
-0.9145324, -0.7367892, -1.98256, 0.9137255, 1, 0, 1,
-0.9106829, 1.54188, -0.155031, 0.9098039, 1, 0, 1,
-0.9068618, 2.352331, -1.145082, 0.9019608, 1, 0, 1,
-0.9054647, 0.6587855, -0.6994002, 0.8941177, 1, 0, 1,
-0.9029974, -0.977088, -3.094993, 0.8901961, 1, 0, 1,
-0.902411, 0.6989676, 0.2257498, 0.8823529, 1, 0, 1,
-0.9012807, -0.4970486, -2.635792, 0.8784314, 1, 0, 1,
-0.8971092, -0.8639451, -3.007019, 0.8705882, 1, 0, 1,
-0.895196, -0.4162375, -1.913174, 0.8666667, 1, 0, 1,
-0.8921978, 0.9193802, -1.720684, 0.8588235, 1, 0, 1,
-0.8865688, -0.5786812, -2.061857, 0.854902, 1, 0, 1,
-0.8832853, -0.9796222, -2.381278, 0.8470588, 1, 0, 1,
-0.8815876, 0.77608, -1.722127, 0.8431373, 1, 0, 1,
-0.8807608, 0.2050796, -2.254457, 0.8352941, 1, 0, 1,
-0.8758202, -1.032356, -1.018606, 0.8313726, 1, 0, 1,
-0.8700794, 0.5060992, 0.5746909, 0.8235294, 1, 0, 1,
-0.8670044, 0.5149202, -2.427267, 0.8196079, 1, 0, 1,
-0.8630231, -0.1051075, -0.606298, 0.8117647, 1, 0, 1,
-0.8582405, 0.7464771, -0.8653214, 0.8078431, 1, 0, 1,
-0.8575037, -0.4731611, -0.7765199, 0.8, 1, 0, 1,
-0.8515982, -0.9631818, -2.87738, 0.7921569, 1, 0, 1,
-0.8420282, -0.5810837, -2.970775, 0.7882353, 1, 0, 1,
-0.8406897, -0.8239681, -3.035607, 0.7803922, 1, 0, 1,
-0.8362554, 0.8864998, -1.770646, 0.7764706, 1, 0, 1,
-0.8344874, -0.6537771, -1.364371, 0.7686275, 1, 0, 1,
-0.8305656, 0.9464051, 0.05030707, 0.7647059, 1, 0, 1,
-0.8255125, -0.1750625, -1.70342, 0.7568628, 1, 0, 1,
-0.8247039, 1.651911, -0.3833032, 0.7529412, 1, 0, 1,
-0.8215448, -0.2768034, -3.014312, 0.7450981, 1, 0, 1,
-0.8195723, 1.094677, -0.8336478, 0.7411765, 1, 0, 1,
-0.8152509, 0.1785408, -1.238678, 0.7333333, 1, 0, 1,
-0.8096842, 0.976509, 0.5830711, 0.7294118, 1, 0, 1,
-0.8073971, 0.1927022, -1.199085, 0.7215686, 1, 0, 1,
-0.8063223, -1.383105, -3.578242, 0.7176471, 1, 0, 1,
-0.8050638, 0.7429208, 0.3520855, 0.7098039, 1, 0, 1,
-0.8018861, -0.3979087, -2.797385, 0.7058824, 1, 0, 1,
-0.8014128, -0.02731562, -2.222366, 0.6980392, 1, 0, 1,
-0.7782408, -0.379865, -1.859221, 0.6901961, 1, 0, 1,
-0.7781194, 0.4994261, -0.4531273, 0.6862745, 1, 0, 1,
-0.7730601, -1.09693, -2.891412, 0.6784314, 1, 0, 1,
-0.7723417, 1.350421, 0.1249865, 0.6745098, 1, 0, 1,
-0.7705594, 1.717588, -0.3160051, 0.6666667, 1, 0, 1,
-0.7689422, -0.3211359, -1.629798, 0.6627451, 1, 0, 1,
-0.7670041, -0.5455036, -2.40546, 0.654902, 1, 0, 1,
-0.7624547, -1.388386, -2.382304, 0.6509804, 1, 0, 1,
-0.7455396, 0.1706622, -2.437993, 0.6431373, 1, 0, 1,
-0.7400668, 1.518435, 0.06402046, 0.6392157, 1, 0, 1,
-0.7388235, -1.537191, -1.601905, 0.6313726, 1, 0, 1,
-0.7340853, -1.345341, -1.484442, 0.627451, 1, 0, 1,
-0.7337361, 0.8012903, -1.416578, 0.6196079, 1, 0, 1,
-0.7265305, -0.9966675, -3.744138, 0.6156863, 1, 0, 1,
-0.7249905, 0.961347, 0.6472406, 0.6078432, 1, 0, 1,
-0.7233815, -0.7037489, -2.469404, 0.6039216, 1, 0, 1,
-0.7129335, 0.3180566, -1.117648, 0.5960785, 1, 0, 1,
-0.7126001, 1.099845, -0.8877154, 0.5882353, 1, 0, 1,
-0.7112728, 1.185917, -0.9259483, 0.5843138, 1, 0, 1,
-0.7091228, 0.7393128, -1.04858, 0.5764706, 1, 0, 1,
-0.709046, 0.2511755, -2.29782, 0.572549, 1, 0, 1,
-0.7089745, 0.2567622, -1.571552, 0.5647059, 1, 0, 1,
-0.7009618, 0.5100223, -1.306742, 0.5607843, 1, 0, 1,
-0.6959245, -1.147881, -3.538163, 0.5529412, 1, 0, 1,
-0.6924203, -0.6115811, -2.881624, 0.5490196, 1, 0, 1,
-0.6917089, -0.5672263, -0.7291037, 0.5411765, 1, 0, 1,
-0.6907544, -1.634312, -2.437221, 0.5372549, 1, 0, 1,
-0.6906622, -0.5991464, -2.329796, 0.5294118, 1, 0, 1,
-0.6901462, -1.216453, -2.686318, 0.5254902, 1, 0, 1,
-0.6815131, 1.693009, -0.1250848, 0.5176471, 1, 0, 1,
-0.6813752, 1.556602, -2.377225, 0.5137255, 1, 0, 1,
-0.6791154, 3.09058, -0.1296606, 0.5058824, 1, 0, 1,
-0.6750883, -1.510521, -1.362193, 0.5019608, 1, 0, 1,
-0.6741245, 1.380074, 0.8490331, 0.4941176, 1, 0, 1,
-0.6733928, -1.338114, -3.01339, 0.4862745, 1, 0, 1,
-0.6682517, -1.470591, -2.522952, 0.4823529, 1, 0, 1,
-0.6635826, -0.3857635, -1.707387, 0.4745098, 1, 0, 1,
-0.660707, -0.2090803, -2.304285, 0.4705882, 1, 0, 1,
-0.6559693, 2.151592, 0.2602283, 0.4627451, 1, 0, 1,
-0.6547016, -0.8327907, -2.467749, 0.4588235, 1, 0, 1,
-0.6537448, -0.1939682, -1.035557, 0.4509804, 1, 0, 1,
-0.6524325, -0.6691393, -2.83038, 0.4470588, 1, 0, 1,
-0.6523079, 0.3204636, -0.70144, 0.4392157, 1, 0, 1,
-0.6419466, 0.4254922, -0.9140038, 0.4352941, 1, 0, 1,
-0.6396537, 0.2353897, -1.259289, 0.427451, 1, 0, 1,
-0.6368861, -0.08758586, -3.280869, 0.4235294, 1, 0, 1,
-0.6311814, 0.8472237, -0.4406236, 0.4156863, 1, 0, 1,
-0.6273069, 1.175024, -1.290677, 0.4117647, 1, 0, 1,
-0.6152716, 0.609192, -0.857757, 0.4039216, 1, 0, 1,
-0.6152656, -1.188397, -3.071498, 0.3960784, 1, 0, 1,
-0.6151512, -0.6054597, -0.8385659, 0.3921569, 1, 0, 1,
-0.6136043, -0.3723463, -2.508935, 0.3843137, 1, 0, 1,
-0.6130529, -0.2595762, -2.090171, 0.3803922, 1, 0, 1,
-0.610468, 0.2832214, -1.894189, 0.372549, 1, 0, 1,
-0.6027666, 0.6826918, -0.9988185, 0.3686275, 1, 0, 1,
-0.6026659, -0.8436983, -0.3097596, 0.3607843, 1, 0, 1,
-0.5952297, 0.2370713, -0.7908616, 0.3568628, 1, 0, 1,
-0.594016, -1.708898, -1.955496, 0.3490196, 1, 0, 1,
-0.5937642, -0.06916995, -1.677437, 0.345098, 1, 0, 1,
-0.5932396, 1.280349, 0.2981573, 0.3372549, 1, 0, 1,
-0.5926124, -0.7173711, -2.54072, 0.3333333, 1, 0, 1,
-0.5924078, 0.4609579, 0.5286365, 0.3254902, 1, 0, 1,
-0.5821093, -0.0250248, -1.404406, 0.3215686, 1, 0, 1,
-0.5781617, -0.5469997, -1.395719, 0.3137255, 1, 0, 1,
-0.5756862, -0.4967713, -0.89303, 0.3098039, 1, 0, 1,
-0.5717598, -0.4101227, -2.752739, 0.3019608, 1, 0, 1,
-0.5701646, 1.707777, -1.56829, 0.2941177, 1, 0, 1,
-0.5685397, 0.004143048, -2.008881, 0.2901961, 1, 0, 1,
-0.5670043, 0.3843209, -2.207131, 0.282353, 1, 0, 1,
-0.5598642, 0.3298846, -1.719878, 0.2784314, 1, 0, 1,
-0.5578087, 1.474689, -0.5310685, 0.2705882, 1, 0, 1,
-0.5571424, -0.2089848, -4.802508, 0.2666667, 1, 0, 1,
-0.5569485, -2.028607, -4.584277, 0.2588235, 1, 0, 1,
-0.555515, -0.3793923, -3.609679, 0.254902, 1, 0, 1,
-0.553728, 0.383585, -2.079085, 0.2470588, 1, 0, 1,
-0.5516221, 1.62244, -0.3859325, 0.2431373, 1, 0, 1,
-0.5511578, 0.7739444, -0.7091997, 0.2352941, 1, 0, 1,
-0.5484787, -1.192899, -2.30371, 0.2313726, 1, 0, 1,
-0.5443519, -0.7070171, -1.123433, 0.2235294, 1, 0, 1,
-0.5342525, 0.2992858, 0.4103525, 0.2196078, 1, 0, 1,
-0.5288271, -0.9952658, -2.675678, 0.2117647, 1, 0, 1,
-0.5265136, -1.930435, -3.427652, 0.2078431, 1, 0, 1,
-0.5262347, 0.685858, -1.299358, 0.2, 1, 0, 1,
-0.5213574, -0.1949534, -2.457143, 0.1921569, 1, 0, 1,
-0.516346, -0.1113258, -0.4725395, 0.1882353, 1, 0, 1,
-0.5128009, -1.223414, -0.8355106, 0.1803922, 1, 0, 1,
-0.511461, -0.4456418, -2.405263, 0.1764706, 1, 0, 1,
-0.5067496, -0.001306989, -1.007799, 0.1686275, 1, 0, 1,
-0.5054906, -0.5661846, -2.785537, 0.1647059, 1, 0, 1,
-0.4987292, -0.6622606, -1.06014, 0.1568628, 1, 0, 1,
-0.4987133, -2.014903, -2.269516, 0.1529412, 1, 0, 1,
-0.4979028, -1.363625, -4.302076, 0.145098, 1, 0, 1,
-0.4977635, 0.453635, -2.537781, 0.1411765, 1, 0, 1,
-0.4948983, -0.4671159, -2.392669, 0.1333333, 1, 0, 1,
-0.4926444, 0.5304684, -0.314954, 0.1294118, 1, 0, 1,
-0.4908051, 0.7677348, -0.07181828, 0.1215686, 1, 0, 1,
-0.4902301, 0.7212687, 0.5520623, 0.1176471, 1, 0, 1,
-0.4858424, -0.07419154, -1.865469, 0.1098039, 1, 0, 1,
-0.4838017, -0.9184834, -1.719652, 0.1058824, 1, 0, 1,
-0.4837065, 1.232041, 0.3060076, 0.09803922, 1, 0, 1,
-0.4771646, -0.6591907, -1.246223, 0.09019608, 1, 0, 1,
-0.4751713, 0.7710561, -1.58272, 0.08627451, 1, 0, 1,
-0.4709868, 0.6489869, -0.5477234, 0.07843138, 1, 0, 1,
-0.4654745, -0.4813594, -4.165141, 0.07450981, 1, 0, 1,
-0.4652665, 1.331523, -1.54057, 0.06666667, 1, 0, 1,
-0.4629807, -0.9093053, -3.191585, 0.0627451, 1, 0, 1,
-0.4611624, -0.4501914, -2.503748, 0.05490196, 1, 0, 1,
-0.4572605, 0.04286907, -2.525262, 0.05098039, 1, 0, 1,
-0.4541756, -0.2826331, -2.02718, 0.04313726, 1, 0, 1,
-0.4504636, -0.9044642, -3.157209, 0.03921569, 1, 0, 1,
-0.4457256, 0.473929, -1.691583, 0.03137255, 1, 0, 1,
-0.4448407, -0.4906948, -2.964353, 0.02745098, 1, 0, 1,
-0.4444278, -1.340154, -4.717889, 0.01960784, 1, 0, 1,
-0.4430262, -0.8061499, -1.675208, 0.01568628, 1, 0, 1,
-0.4415398, 0.006791016, -1.837564, 0.007843138, 1, 0, 1,
-0.4412082, 0.6134133, -0.6161327, 0.003921569, 1, 0, 1,
-0.4383944, -0.9102255, -1.986107, 0, 1, 0.003921569, 1,
-0.4361028, 0.07343946, -1.584195, 0, 1, 0.01176471, 1,
-0.4359445, -0.4861265, -0.678251, 0, 1, 0.01568628, 1,
-0.4339718, 0.3176291, -1.559086, 0, 1, 0.02352941, 1,
-0.431595, 0.4898388, -0.551187, 0, 1, 0.02745098, 1,
-0.4268276, -0.4216295, -2.909618, 0, 1, 0.03529412, 1,
-0.4257418, -1.576937, -1.014567, 0, 1, 0.03921569, 1,
-0.4245837, 0.188425, -1.818375, 0, 1, 0.04705882, 1,
-0.4158051, 0.7343095, 0.3100225, 0, 1, 0.05098039, 1,
-0.4143638, 2.271097, 1.252789, 0, 1, 0.05882353, 1,
-0.4130627, -1.194753, -1.645509, 0, 1, 0.0627451, 1,
-0.4125553, -0.3324594, -1.011038, 0, 1, 0.07058824, 1,
-0.4083866, 0.04060781, -1.857942, 0, 1, 0.07450981, 1,
-0.4076452, -0.4950301, -3.416904, 0, 1, 0.08235294, 1,
-0.4073952, 1.730361, -1.877174, 0, 1, 0.08627451, 1,
-0.4067435, 0.8047478, -1.096195, 0, 1, 0.09411765, 1,
-0.4047937, 0.5684, -0.4557787, 0, 1, 0.1019608, 1,
-0.403566, -0.6347235, -3.241342, 0, 1, 0.1058824, 1,
-0.3990201, -0.6747486, -0.7969034, 0, 1, 0.1137255, 1,
-0.3948315, 0.3896801, -0.4739151, 0, 1, 0.1176471, 1,
-0.3930159, -0.4919541, -4.566465, 0, 1, 0.1254902, 1,
-0.383615, 0.885586, 0.3426326, 0, 1, 0.1294118, 1,
-0.3802195, -0.5603158, -3.105035, 0, 1, 0.1372549, 1,
-0.3778439, -0.5020791, -2.171248, 0, 1, 0.1411765, 1,
-0.3769794, 0.1909048, -1.999192, 0, 1, 0.1490196, 1,
-0.3750097, 0.3849306, -0.08793158, 0, 1, 0.1529412, 1,
-0.3693263, 1.205145, -1.433692, 0, 1, 0.1607843, 1,
-0.3691012, 0.3054451, 0.8804653, 0, 1, 0.1647059, 1,
-0.367486, -0.3158222, -3.114882, 0, 1, 0.172549, 1,
-0.3670524, -1.397954, -1.804542, 0, 1, 0.1764706, 1,
-0.3624975, -0.1854824, -2.641767, 0, 1, 0.1843137, 1,
-0.3618045, 0.2392847, -0.5760521, 0, 1, 0.1882353, 1,
-0.3482554, 2.063241, -0.4513291, 0, 1, 0.1960784, 1,
-0.3474199, -0.1013685, -0.9781047, 0, 1, 0.2039216, 1,
-0.3409131, 0.3855632, -0.7127637, 0, 1, 0.2078431, 1,
-0.3400071, -0.7506962, -2.536769, 0, 1, 0.2156863, 1,
-0.3259914, 0.1968291, -1.426828, 0, 1, 0.2196078, 1,
-0.3256016, -0.8561734, -2.305415, 0, 1, 0.227451, 1,
-0.325172, 0.985293, 1.236676, 0, 1, 0.2313726, 1,
-0.3232364, 0.4283575, -0.4223736, 0, 1, 0.2392157, 1,
-0.3231304, -0.263345, -1.87467, 0, 1, 0.2431373, 1,
-0.3214194, -0.659737, -2.24585, 0, 1, 0.2509804, 1,
-0.3201816, 0.6241474, -0.4575461, 0, 1, 0.254902, 1,
-0.3182688, -1.054412, -4.110627, 0, 1, 0.2627451, 1,
-0.313357, 1.071713, 1.605518, 0, 1, 0.2666667, 1,
-0.3123135, -0.3806132, -3.181444, 0, 1, 0.2745098, 1,
-0.3080086, -0.4551482, -3.452364, 0, 1, 0.2784314, 1,
-0.3051181, -0.2901409, -3.419679, 0, 1, 0.2862745, 1,
-0.3032283, 0.01616438, -0.7712467, 0, 1, 0.2901961, 1,
-0.3023946, -0.7513238, -1.951915, 0, 1, 0.2980392, 1,
-0.3017241, -0.2876131, -3.994836, 0, 1, 0.3058824, 1,
-0.2990953, -0.2608968, -4.332459, 0, 1, 0.3098039, 1,
-0.2974662, 0.5267191, -0.9069106, 0, 1, 0.3176471, 1,
-0.2906741, -2.140905, -3.025917, 0, 1, 0.3215686, 1,
-0.289123, -1.860611, -4.200366, 0, 1, 0.3294118, 1,
-0.2881725, 1.026491, -1.171773, 0, 1, 0.3333333, 1,
-0.2825696, 0.5494296, 0.4162306, 0, 1, 0.3411765, 1,
-0.2820367, -0.3816156, -2.983246, 0, 1, 0.345098, 1,
-0.2801424, 0.1001282, -0.6010162, 0, 1, 0.3529412, 1,
-0.2776541, 0.4236009, -2.221756, 0, 1, 0.3568628, 1,
-0.2758409, -0.4585325, -3.357875, 0, 1, 0.3647059, 1,
-0.2699579, 0.4746319, 1.277011, 0, 1, 0.3686275, 1,
-0.2696731, 1.345048, -0.3568426, 0, 1, 0.3764706, 1,
-0.2687795, 0.1218033, -1.567953, 0, 1, 0.3803922, 1,
-0.2665105, 0.3227013, -0.323938, 0, 1, 0.3882353, 1,
-0.263324, -1.360155, -3.722267, 0, 1, 0.3921569, 1,
-0.2620685, -0.6879215, -3.436543, 0, 1, 0.4, 1,
-0.2577147, -0.296579, -2.176052, 0, 1, 0.4078431, 1,
-0.2569353, -0.0776492, -2.008032, 0, 1, 0.4117647, 1,
-0.2546746, -0.7883512, -2.404149, 0, 1, 0.4196078, 1,
-0.2505699, -1.629752, -1.920048, 0, 1, 0.4235294, 1,
-0.249584, -0.7073413, -2.241068, 0, 1, 0.4313726, 1,
-0.2459522, 1.362262, 0.9854312, 0, 1, 0.4352941, 1,
-0.2450671, -1.176237, -4.113418, 0, 1, 0.4431373, 1,
-0.2449724, 0.1609979, -1.467327, 0, 1, 0.4470588, 1,
-0.2447871, -0.0651869, -3.661027, 0, 1, 0.454902, 1,
-0.2419761, 1.379015, 0.07991532, 0, 1, 0.4588235, 1,
-0.2394716, 0.1163409, -2.297815, 0, 1, 0.4666667, 1,
-0.2333491, -0.2063827, -1.588374, 0, 1, 0.4705882, 1,
-0.2332822, -0.04030553, -1.157337, 0, 1, 0.4784314, 1,
-0.2325057, 1.505661, -0.3052292, 0, 1, 0.4823529, 1,
-0.2273089, -0.1847393, -4.610368, 0, 1, 0.4901961, 1,
-0.2259708, -0.6418257, -2.774656, 0, 1, 0.4941176, 1,
-0.225569, 0.3370314, -0.3686509, 0, 1, 0.5019608, 1,
-0.2184374, 0.06328379, -1.403074, 0, 1, 0.509804, 1,
-0.2149149, -1.157447, -3.152528, 0, 1, 0.5137255, 1,
-0.2141031, 1.141215, -1.249683, 0, 1, 0.5215687, 1,
-0.2034704, -0.3442572, -2.766774, 0, 1, 0.5254902, 1,
-0.2020238, 0.2857202, 1.508342, 0, 1, 0.5333334, 1,
-0.2000842, -1.341657, -4.113029, 0, 1, 0.5372549, 1,
-0.1999369, -0.3033503, -2.838383, 0, 1, 0.5450981, 1,
-0.1952957, 0.1440541, -1.559724, 0, 1, 0.5490196, 1,
-0.1936035, 1.922107, -1.777326, 0, 1, 0.5568628, 1,
-0.1930083, -1.231706, -3.275146, 0, 1, 0.5607843, 1,
-0.1866457, 0.7960318, 0.1455381, 0, 1, 0.5686275, 1,
-0.1856156, 1.147192, -0.9055127, 0, 1, 0.572549, 1,
-0.1848002, 0.5635113, 0.4562155, 0, 1, 0.5803922, 1,
-0.181732, -0.2349687, -0.02985217, 0, 1, 0.5843138, 1,
-0.179993, -0.7573001, -1.881602, 0, 1, 0.5921569, 1,
-0.1773348, 0.444344, 0.6050354, 0, 1, 0.5960785, 1,
-0.1765165, 1.422632, -0.1120469, 0, 1, 0.6039216, 1,
-0.1758821, 0.1076426, -1.049792, 0, 1, 0.6117647, 1,
-0.1735056, -0.1289058, -1.902553, 0, 1, 0.6156863, 1,
-0.1699598, 0.6223558, 0.117968, 0, 1, 0.6235294, 1,
-0.1683181, -0.4659166, -3.069257, 0, 1, 0.627451, 1,
-0.1625614, 0.5610502, -0.5881372, 0, 1, 0.6352941, 1,
-0.1612071, 0.1846301, -1.814463, 0, 1, 0.6392157, 1,
-0.1598023, 0.3560327, -1.112645, 0, 1, 0.6470588, 1,
-0.1578992, -0.572525, -2.357894, 0, 1, 0.6509804, 1,
-0.1578716, 1.427435, -1.144344, 0, 1, 0.6588235, 1,
-0.1555557, 1.077941, 0.6489924, 0, 1, 0.6627451, 1,
-0.1552797, -0.5356802, -0.2414425, 0, 1, 0.6705883, 1,
-0.1547567, -1.159228, -3.215124, 0, 1, 0.6745098, 1,
-0.1547472, 0.718016, -0.06371391, 0, 1, 0.682353, 1,
-0.1544794, 1.333619, -0.5422654, 0, 1, 0.6862745, 1,
-0.1536595, 1.157044, -0.6949882, 0, 1, 0.6941177, 1,
-0.1490737, 1.769395, -0.5471334, 0, 1, 0.7019608, 1,
-0.1483209, -1.13405, -3.143972, 0, 1, 0.7058824, 1,
-0.147548, -0.5059446, -2.644279, 0, 1, 0.7137255, 1,
-0.1474469, 0.7504308, -1.146336, 0, 1, 0.7176471, 1,
-0.1431387, 1.345874, 0.8170346, 0, 1, 0.7254902, 1,
-0.1423311, -0.04763417, -0.6282005, 0, 1, 0.7294118, 1,
-0.139557, -0.0961389, -1.817007, 0, 1, 0.7372549, 1,
-0.1388278, 0.992027, 0.6094514, 0, 1, 0.7411765, 1,
-0.1378707, -0.2571968, -2.438874, 0, 1, 0.7490196, 1,
-0.1344063, 1.382653, -0.2678296, 0, 1, 0.7529412, 1,
-0.1320896, 0.2466804, 0.1884034, 0, 1, 0.7607843, 1,
-0.1296025, -1.118586, -3.544202, 0, 1, 0.7647059, 1,
-0.1210582, 0.4816084, -0.9227352, 0, 1, 0.772549, 1,
-0.1206499, 0.3011395, 1.629452, 0, 1, 0.7764706, 1,
-0.1173411, -0.04707817, -0.5735412, 0, 1, 0.7843137, 1,
-0.1115328, -1.869714, -3.487896, 0, 1, 0.7882353, 1,
-0.1115012, 0.248828, -0.6931454, 0, 1, 0.7960784, 1,
-0.1088774, -0.1450763, -0.7901283, 0, 1, 0.8039216, 1,
-0.102615, 0.6400743, 0.4691841, 0, 1, 0.8078431, 1,
-0.1010568, -0.3942076, -3.549297, 0, 1, 0.8156863, 1,
-0.09367921, -1.144096, -1.858243, 0, 1, 0.8196079, 1,
-0.09242632, 1.983276, 1.007192, 0, 1, 0.827451, 1,
-0.08936428, -1.236788, -0.4203853, 0, 1, 0.8313726, 1,
-0.08644245, -0.05067407, -2.827742, 0, 1, 0.8392157, 1,
-0.07701844, 0.3862517, -0.917372, 0, 1, 0.8431373, 1,
-0.07607783, 1.014193, 2.06438, 0, 1, 0.8509804, 1,
-0.07406723, 0.438433, 0.3524911, 0, 1, 0.854902, 1,
-0.07383915, -0.2838793, -3.56104, 0, 1, 0.8627451, 1,
-0.07358331, 1.651662, -0.9154536, 0, 1, 0.8666667, 1,
-0.07350782, 0.7675906, -1.077131, 0, 1, 0.8745098, 1,
-0.07146865, -0.5673816, -3.008108, 0, 1, 0.8784314, 1,
-0.0649552, -0.3258828, -2.891938, 0, 1, 0.8862745, 1,
-0.0638648, 0.5252243, -0.4813982, 0, 1, 0.8901961, 1,
-0.06323941, 1.042231, -0.4861434, 0, 1, 0.8980392, 1,
-0.05997101, 0.09312548, -0.7242392, 0, 1, 0.9058824, 1,
-0.05373948, 0.5833378, 0.04630461, 0, 1, 0.9098039, 1,
-0.04729381, -1.156053, -4.49907, 0, 1, 0.9176471, 1,
-0.04313943, -0.732111, -2.682182, 0, 1, 0.9215686, 1,
-0.04166741, 1.024788, 0.1645468, 0, 1, 0.9294118, 1,
-0.04036215, 1.436629, -0.3321197, 0, 1, 0.9333333, 1,
-0.03580488, 1.256035, -0.1464717, 0, 1, 0.9411765, 1,
-0.03353039, 0.6919832, 0.3595141, 0, 1, 0.945098, 1,
-0.03026911, 0.4113838, -1.199689, 0, 1, 0.9529412, 1,
-0.02980373, 0.1634095, -1.291891, 0, 1, 0.9568627, 1,
-0.02826638, 1.378959, 1.292431, 0, 1, 0.9647059, 1,
-0.02000914, 1.477074, -0.8436072, 0, 1, 0.9686275, 1,
-0.01964285, -0.1427822, -2.997972, 0, 1, 0.9764706, 1,
-0.01721881, 0.7057307, 0.8156378, 0, 1, 0.9803922, 1,
-0.01203361, -0.7797104, -4.908811, 0, 1, 0.9882353, 1,
-0.01058912, -0.5373824, -3.124503, 0, 1, 0.9921569, 1,
-0.008594587, -1.172328, -2.279427, 0, 1, 1, 1,
-0.005145763, 0.4475215, -0.9384962, 0, 0.9921569, 1, 1,
0.003451638, 2.461698, 0.1092491, 0, 0.9882353, 1, 1,
0.01749741, -1.004225, 3.508986, 0, 0.9803922, 1, 1,
0.01957408, 0.07901261, 0.5743522, 0, 0.9764706, 1, 1,
0.02652639, -0.08560467, 3.523808, 0, 0.9686275, 1, 1,
0.02885741, -0.009818129, 2.15302, 0, 0.9647059, 1, 1,
0.02891316, -0.1735648, 4.697724, 0, 0.9568627, 1, 1,
0.03516717, -0.1400107, 2.249416, 0, 0.9529412, 1, 1,
0.0380173, 1.613242, -0.7643724, 0, 0.945098, 1, 1,
0.04129869, -0.8409343, 1.566209, 0, 0.9411765, 1, 1,
0.04341898, 1.972046, 0.03139021, 0, 0.9333333, 1, 1,
0.04358885, 2.511192, -0.2298347, 0, 0.9294118, 1, 1,
0.04849698, 1.190735, -0.6509857, 0, 0.9215686, 1, 1,
0.06123679, -0.1030965, 2.971218, 0, 0.9176471, 1, 1,
0.06467544, -0.03548812, 2.900616, 0, 0.9098039, 1, 1,
0.06535544, 0.3628134, -0.5819669, 0, 0.9058824, 1, 1,
0.07484996, 0.2773696, 0.3843491, 0, 0.8980392, 1, 1,
0.07634367, 0.3521326, 0.958225, 0, 0.8901961, 1, 1,
0.0786904, -2.057279, 3.176595, 0, 0.8862745, 1, 1,
0.07942101, -1.277114, 2.579154, 0, 0.8784314, 1, 1,
0.08741291, 0.6402647, 0.2379937, 0, 0.8745098, 1, 1,
0.09077821, -0.5465589, 1.890541, 0, 0.8666667, 1, 1,
0.09200341, 0.4883153, 0.5915872, 0, 0.8627451, 1, 1,
0.103472, 0.3205128, 0.1305108, 0, 0.854902, 1, 1,
0.1042936, -0.5339112, 3.910335, 0, 0.8509804, 1, 1,
0.1049891, -2.015064, 3.297265, 0, 0.8431373, 1, 1,
0.1077203, 0.3448425, -0.01943644, 0, 0.8392157, 1, 1,
0.1081948, -0.1494561, 3.156723, 0, 0.8313726, 1, 1,
0.1084165, 0.1280903, 0.5180438, 0, 0.827451, 1, 1,
0.109224, -0.09830943, 0.7181707, 0, 0.8196079, 1, 1,
0.1097734, -0.4771606, 4.147819, 0, 0.8156863, 1, 1,
0.1098249, 0.2557931, -1.360236, 0, 0.8078431, 1, 1,
0.1139134, 0.7661526, -1.19678, 0, 0.8039216, 1, 1,
0.116008, 0.01027312, 2.191334, 0, 0.7960784, 1, 1,
0.1163045, 0.6734946, -0.02241905, 0, 0.7882353, 1, 1,
0.1167223, -0.5202609, 3.927339, 0, 0.7843137, 1, 1,
0.1189259, 0.04061516, 1.092365, 0, 0.7764706, 1, 1,
0.1245077, 0.2306122, 0.448964, 0, 0.772549, 1, 1,
0.125272, -1.977073, 2.87877, 0, 0.7647059, 1, 1,
0.1307526, 0.5707605, 0.1345488, 0, 0.7607843, 1, 1,
0.1317172, 0.01725686, 1.725714, 0, 0.7529412, 1, 1,
0.1416148, 0.5350274, -0.3677651, 0, 0.7490196, 1, 1,
0.1433999, -0.1552911, 1.403728, 0, 0.7411765, 1, 1,
0.1436731, -0.3796443, 2.084225, 0, 0.7372549, 1, 1,
0.1467402, 1.232757, -0.918714, 0, 0.7294118, 1, 1,
0.1475842, -0.728357, 1.493448, 0, 0.7254902, 1, 1,
0.1480567, -0.8060438, 4.695263, 0, 0.7176471, 1, 1,
0.1513237, 0.002277425, 0.2902716, 0, 0.7137255, 1, 1,
0.1535037, 1.732087, 0.1010268, 0, 0.7058824, 1, 1,
0.1544189, 0.593303, 2.265427, 0, 0.6980392, 1, 1,
0.1547081, -1.469738, 2.459931, 0, 0.6941177, 1, 1,
0.1624642, 1.17226, 0.527625, 0, 0.6862745, 1, 1,
0.16371, -1.769236, 1.536426, 0, 0.682353, 1, 1,
0.1646394, -0.2253687, 3.007849, 0, 0.6745098, 1, 1,
0.1660179, 0.7217391, 0.767916, 0, 0.6705883, 1, 1,
0.1662434, -0.3474745, 2.30156, 0, 0.6627451, 1, 1,
0.1720355, -1.086924, 2.332924, 0, 0.6588235, 1, 1,
0.172854, 0.07806329, 2.4588, 0, 0.6509804, 1, 1,
0.1765373, 0.840146, 2.020108, 0, 0.6470588, 1, 1,
0.178455, -0.002430741, 4.513511, 0, 0.6392157, 1, 1,
0.1786239, 1.196061, 0.4943146, 0, 0.6352941, 1, 1,
0.1802345, -1.803661, 4.101036, 0, 0.627451, 1, 1,
0.1802973, -0.4754959, 2.64351, 0, 0.6235294, 1, 1,
0.1807156, -0.313212, 2.033977, 0, 0.6156863, 1, 1,
0.1825507, -0.842382, 2.608111, 0, 0.6117647, 1, 1,
0.1831985, -0.5685065, 2.41847, 0, 0.6039216, 1, 1,
0.1840442, -0.6618007, 3.673949, 0, 0.5960785, 1, 1,
0.187817, -0.6905167, 2.021128, 0, 0.5921569, 1, 1,
0.1901466, -0.6368156, 3.24899, 0, 0.5843138, 1, 1,
0.192862, 0.6347497, -2.100154, 0, 0.5803922, 1, 1,
0.1929936, 0.5770051, 0.1520279, 0, 0.572549, 1, 1,
0.2052113, 1.670718, -0.9131929, 0, 0.5686275, 1, 1,
0.2095691, -0.9108132, 2.525288, 0, 0.5607843, 1, 1,
0.2096966, -0.7332077, 1.939592, 0, 0.5568628, 1, 1,
0.2097923, 0.3286866, 0.9545625, 0, 0.5490196, 1, 1,
0.2113435, -0.6915048, 1.623355, 0, 0.5450981, 1, 1,
0.2113615, 0.3013276, 1.003292, 0, 0.5372549, 1, 1,
0.21727, -0.1962661, 1.467053, 0, 0.5333334, 1, 1,
0.2180616, 0.8197902, 0.3346485, 0, 0.5254902, 1, 1,
0.2182393, 1.836584, 1.312183, 0, 0.5215687, 1, 1,
0.2237397, 2.026054, -0.2885457, 0, 0.5137255, 1, 1,
0.2264748, -0.3721543, 1.384393, 0, 0.509804, 1, 1,
0.229491, -1.26633, 4.651957, 0, 0.5019608, 1, 1,
0.2300135, -0.4257891, 3.565312, 0, 0.4941176, 1, 1,
0.2342649, 0.3505024, 0.2116407, 0, 0.4901961, 1, 1,
0.2346914, 1.13279, 1.304517, 0, 0.4823529, 1, 1,
0.2380221, 0.6192678, 1.726143, 0, 0.4784314, 1, 1,
0.2419311, 1.20878, 0.7066543, 0, 0.4705882, 1, 1,
0.2438035, 0.5579232, 0.7197554, 0, 0.4666667, 1, 1,
0.2473731, -1.53453, 2.95948, 0, 0.4588235, 1, 1,
0.2518353, 0.186325, 0.1480977, 0, 0.454902, 1, 1,
0.2527271, 1.175868, -1.615437, 0, 0.4470588, 1, 1,
0.2537707, -0.1011503, 0.9909676, 0, 0.4431373, 1, 1,
0.2560302, -1.174074, 3.68969, 0, 0.4352941, 1, 1,
0.2593415, -0.3720072, 0.7804277, 0, 0.4313726, 1, 1,
0.2634108, 0.6685315, 0.880741, 0, 0.4235294, 1, 1,
0.2673507, 0.4914411, 0.9350557, 0, 0.4196078, 1, 1,
0.2734087, -0.2790863, 2.034174, 0, 0.4117647, 1, 1,
0.2776286, 0.3900873, 0.1605575, 0, 0.4078431, 1, 1,
0.2798039, 0.06550775, 1.660458, 0, 0.4, 1, 1,
0.2808212, -1.078778, 2.66941, 0, 0.3921569, 1, 1,
0.2884073, 0.3061076, 0.05329533, 0, 0.3882353, 1, 1,
0.2892008, -1.176321, 3.823311, 0, 0.3803922, 1, 1,
0.290062, 1.099656, 1.249788, 0, 0.3764706, 1, 1,
0.298508, -1.036875, 2.206125, 0, 0.3686275, 1, 1,
0.3005165, -0.4449402, 2.393057, 0, 0.3647059, 1, 1,
0.3015175, -2.321104, 3.065812, 0, 0.3568628, 1, 1,
0.3034384, -0.3434064, 4.063275, 0, 0.3529412, 1, 1,
0.3084278, -1.613604, 3.830375, 0, 0.345098, 1, 1,
0.3220261, -0.2201778, 1.975439, 0, 0.3411765, 1, 1,
0.3226783, 0.8248898, 0.2184628, 0, 0.3333333, 1, 1,
0.3248428, -0.9488887, 3.326511, 0, 0.3294118, 1, 1,
0.3257741, 0.9658264, 0.5191491, 0, 0.3215686, 1, 1,
0.3288489, -0.330752, 2.189604, 0, 0.3176471, 1, 1,
0.3364445, 0.6685461, -0.2196936, 0, 0.3098039, 1, 1,
0.3394984, -1.312488, 3.497636, 0, 0.3058824, 1, 1,
0.3403277, 0.00377912, 1.040106, 0, 0.2980392, 1, 1,
0.3404813, -0.8325831, 2.214778, 0, 0.2901961, 1, 1,
0.3405235, 0.5747776, -0.8648873, 0, 0.2862745, 1, 1,
0.3408879, 0.8996311, -0.6933938, 0, 0.2784314, 1, 1,
0.3465337, 0.7808875, 1.409649, 0, 0.2745098, 1, 1,
0.3484281, 0.09583526, 0.7198922, 0, 0.2666667, 1, 1,
0.3498733, -1.523785, 3.326722, 0, 0.2627451, 1, 1,
0.3505174, 1.181838, -1.48499, 0, 0.254902, 1, 1,
0.3511607, 1.231353, 1.081756, 0, 0.2509804, 1, 1,
0.3515824, -1.165566, 0.9468548, 0, 0.2431373, 1, 1,
0.3551522, 0.2166741, 0.4257643, 0, 0.2392157, 1, 1,
0.356881, 0.2345616, 0.09298549, 0, 0.2313726, 1, 1,
0.3579401, 1.395717, 0.9356091, 0, 0.227451, 1, 1,
0.3640177, -0.8722591, 4.778881, 0, 0.2196078, 1, 1,
0.365685, 0.2720995, 1.009079, 0, 0.2156863, 1, 1,
0.3668894, -1.2244, 2.816208, 0, 0.2078431, 1, 1,
0.3704234, -1.421102, 3.18033, 0, 0.2039216, 1, 1,
0.372118, 2.356836, -0.2476997, 0, 0.1960784, 1, 1,
0.3799878, -1.418571, 3.739329, 0, 0.1882353, 1, 1,
0.3824232, 1.451444, 1.94946, 0, 0.1843137, 1, 1,
0.383669, -1.336773, 1.073954, 0, 0.1764706, 1, 1,
0.3857172, -0.7264549, 2.760523, 0, 0.172549, 1, 1,
0.3863372, 0.8157879, 1.587409, 0, 0.1647059, 1, 1,
0.3898729, 0.8457795, -0.169305, 0, 0.1607843, 1, 1,
0.3902023, -1.167477, 4.42474, 0, 0.1529412, 1, 1,
0.3940725, -0.986749, 2.41622, 0, 0.1490196, 1, 1,
0.3968103, 1.178381, 0.03419292, 0, 0.1411765, 1, 1,
0.3971449, -0.6722013, 3.146758, 0, 0.1372549, 1, 1,
0.4025185, -0.9497954, 1.43855, 0, 0.1294118, 1, 1,
0.4078463, 2.109088, -3.261499, 0, 0.1254902, 1, 1,
0.4089054, 0.8638643, 1.198822, 0, 0.1176471, 1, 1,
0.4131435, -0.3007746, 2.147204, 0, 0.1137255, 1, 1,
0.4133758, -0.3701512, 2.378443, 0, 0.1058824, 1, 1,
0.4157338, -0.8033717, 4.030022, 0, 0.09803922, 1, 1,
0.4179309, -0.7011363, 2.043129, 0, 0.09411765, 1, 1,
0.4197219, 1.221626, -0.8364604, 0, 0.08627451, 1, 1,
0.4209361, 0.819715, 1.121663, 0, 0.08235294, 1, 1,
0.4213217, 0.03996817, 1.01419, 0, 0.07450981, 1, 1,
0.4289227, 2.272766, 0.4982597, 0, 0.07058824, 1, 1,
0.4325309, -1.334455, 3.904245, 0, 0.0627451, 1, 1,
0.4332686, 0.1077355, 0.4376613, 0, 0.05882353, 1, 1,
0.435726, -1.481434, 3.950694, 0, 0.05098039, 1, 1,
0.4424744, 0.00965418, 0.182348, 0, 0.04705882, 1, 1,
0.445154, 1.226792, 0.003013721, 0, 0.03921569, 1, 1,
0.4466424, -0.06804159, 1.679349, 0, 0.03529412, 1, 1,
0.4475085, 0.5301606, 1.070193, 0, 0.02745098, 1, 1,
0.4479209, -2.473924, 2.117823, 0, 0.02352941, 1, 1,
0.4523469, -0.6099693, 2.558923, 0, 0.01568628, 1, 1,
0.4531053, -2.597276, 3.072693, 0, 0.01176471, 1, 1,
0.4531544, -0.2144661, 2.584841, 0, 0.003921569, 1, 1,
0.4594713, 0.2265573, 1.33661, 0.003921569, 0, 1, 1,
0.4606051, 0.231538, -1.316722, 0.007843138, 0, 1, 1,
0.461665, 0.3996548, 0.4070077, 0.01568628, 0, 1, 1,
0.4632605, -1.854921, 2.935962, 0.01960784, 0, 1, 1,
0.4644532, 0.7238784, 0.8127342, 0.02745098, 0, 1, 1,
0.472405, -1.497859, 1.27897, 0.03137255, 0, 1, 1,
0.4732611, -0.5434622, 2.431773, 0.03921569, 0, 1, 1,
0.4773232, -0.455283, 3.189043, 0.04313726, 0, 1, 1,
0.4782112, 0.2505847, -0.9180841, 0.05098039, 0, 1, 1,
0.4811334, 2.444669, 0.3716159, 0.05490196, 0, 1, 1,
0.4861329, -1.658374, 1.596076, 0.0627451, 0, 1, 1,
0.48765, -0.8181829, 2.79566, 0.06666667, 0, 1, 1,
0.4888046, 0.1331526, 1.172157, 0.07450981, 0, 1, 1,
0.4909386, 0.3160639, 0.6615038, 0.07843138, 0, 1, 1,
0.4941158, 1.281742, 0.3518834, 0.08627451, 0, 1, 1,
0.4953479, -1.81141, 2.831676, 0.09019608, 0, 1, 1,
0.498679, 1.347981, 0.3022702, 0.09803922, 0, 1, 1,
0.5021535, 0.472109, -1.842321, 0.1058824, 0, 1, 1,
0.5026641, -1.952566, 1.824481, 0.1098039, 0, 1, 1,
0.5029918, 0.2101298, 1.81364, 0.1176471, 0, 1, 1,
0.50321, -1.056586, 2.849178, 0.1215686, 0, 1, 1,
0.5036131, -1.079696, 1.950234, 0.1294118, 0, 1, 1,
0.5043483, -0.5772974, 1.670543, 0.1333333, 0, 1, 1,
0.5063487, 0.5246236, 1.084517, 0.1411765, 0, 1, 1,
0.5077922, 1.01981, -0.7462526, 0.145098, 0, 1, 1,
0.5083323, -0.9624932, 5.057042, 0.1529412, 0, 1, 1,
0.5093995, 0.3140467, -0.09580702, 0.1568628, 0, 1, 1,
0.5156754, -1.043197, 0.8465345, 0.1647059, 0, 1, 1,
0.5171551, -1.699237, 3.152169, 0.1686275, 0, 1, 1,
0.5212848, 0.04248783, 1.885031, 0.1764706, 0, 1, 1,
0.5256588, -0.8241071, 3.643093, 0.1803922, 0, 1, 1,
0.5291116, -0.7862158, 2.505391, 0.1882353, 0, 1, 1,
0.5396978, 0.8754596, 2.225319, 0.1921569, 0, 1, 1,
0.5406583, -1.021974, 1.845054, 0.2, 0, 1, 1,
0.5450508, -2.101015, 3.409397, 0.2078431, 0, 1, 1,
0.5452175, 0.8468946, 0.6455784, 0.2117647, 0, 1, 1,
0.5480211, -0.04964304, 1.383162, 0.2196078, 0, 1, 1,
0.550602, -0.3783322, 2.626447, 0.2235294, 0, 1, 1,
0.5579209, 0.1436965, 2.341004, 0.2313726, 0, 1, 1,
0.5610307, -1.046056, 2.041577, 0.2352941, 0, 1, 1,
0.562792, 0.3687254, 0.3067514, 0.2431373, 0, 1, 1,
0.5691343, -0.4888809, 1.003642, 0.2470588, 0, 1, 1,
0.5716458, -1.152996, 4.304621, 0.254902, 0, 1, 1,
0.575947, -0.6511059, 2.469252, 0.2588235, 0, 1, 1,
0.57974, 0.1497469, 1.977524, 0.2666667, 0, 1, 1,
0.5824286, 1.205479, 0.3267022, 0.2705882, 0, 1, 1,
0.5898075, -2.17146, 5.252561, 0.2784314, 0, 1, 1,
0.5943437, 0.1133944, 0.2308093, 0.282353, 0, 1, 1,
0.5945112, 1.322044, 1.711752, 0.2901961, 0, 1, 1,
0.604117, -1.251754, 4.615656, 0.2941177, 0, 1, 1,
0.607464, 1.031065, 0.3875716, 0.3019608, 0, 1, 1,
0.6076617, 0.3631244, -0.241629, 0.3098039, 0, 1, 1,
0.6113529, 0.4062622, 0.6240456, 0.3137255, 0, 1, 1,
0.6127695, -1.257568, 3.42465, 0.3215686, 0, 1, 1,
0.615033, -1.441009, 2.808716, 0.3254902, 0, 1, 1,
0.6163173, 1.007574, -0.08855783, 0.3333333, 0, 1, 1,
0.6215896, 0.3743615, 0.6839879, 0.3372549, 0, 1, 1,
0.623197, 0.2400003, 2.043246, 0.345098, 0, 1, 1,
0.6288399, -0.2095364, 1.795334, 0.3490196, 0, 1, 1,
0.6328423, 0.6207674, -0.3532867, 0.3568628, 0, 1, 1,
0.6412271, -0.3789797, 0.9471424, 0.3607843, 0, 1, 1,
0.6421391, -0.6130624, 2.116428, 0.3686275, 0, 1, 1,
0.6453381, 0.8052518, -1.02544, 0.372549, 0, 1, 1,
0.6459104, 0.7676265, 1.880966, 0.3803922, 0, 1, 1,
0.6484155, 0.8562044, 1.453681, 0.3843137, 0, 1, 1,
0.6499596, 1.420353, -0.2328154, 0.3921569, 0, 1, 1,
0.6513331, 0.7099575, 1.408996, 0.3960784, 0, 1, 1,
0.6556525, 1.310287, -1.349632, 0.4039216, 0, 1, 1,
0.6562814, -0.8815187, 4.39233, 0.4117647, 0, 1, 1,
0.6604157, 0.5050884, 2.777611, 0.4156863, 0, 1, 1,
0.6630713, -0.7138031, 1.82271, 0.4235294, 0, 1, 1,
0.6635692, 1.193804, 1.613834, 0.427451, 0, 1, 1,
0.6648327, 0.9308349, -0.9337656, 0.4352941, 0, 1, 1,
0.6722053, 0.4127363, 0.6964437, 0.4392157, 0, 1, 1,
0.6795517, 1.155246, -0.7467577, 0.4470588, 0, 1, 1,
0.6896363, 0.4569941, 0.0155096, 0.4509804, 0, 1, 1,
0.6904455, 1.620457, 0.3212194, 0.4588235, 0, 1, 1,
0.6908252, -0.2776682, 2.822543, 0.4627451, 0, 1, 1,
0.6937473, -1.237476, 1.725601, 0.4705882, 0, 1, 1,
0.694901, -0.6070498, 1.366607, 0.4745098, 0, 1, 1,
0.6954349, -0.7887289, 2.36306, 0.4823529, 0, 1, 1,
0.6978165, 0.6644869, 0.5604608, 0.4862745, 0, 1, 1,
0.699017, 1.073277, 2.592417, 0.4941176, 0, 1, 1,
0.7012622, 1.413039, 0.3127615, 0.5019608, 0, 1, 1,
0.7066984, 0.975028, 1.341508, 0.5058824, 0, 1, 1,
0.7093962, 0.2519318, 0.9712781, 0.5137255, 0, 1, 1,
0.7138122, 0.5410723, 1.389504, 0.5176471, 0, 1, 1,
0.7209978, -2.112718, -0.3676815, 0.5254902, 0, 1, 1,
0.7257783, 1.546462, 1.045367, 0.5294118, 0, 1, 1,
0.7369486, -0.5324993, 1.401049, 0.5372549, 0, 1, 1,
0.7401351, 1.399349, 2.011454, 0.5411765, 0, 1, 1,
0.7436895, -0.1095473, 0.05624917, 0.5490196, 0, 1, 1,
0.7451382, 0.2287217, 0.8118896, 0.5529412, 0, 1, 1,
0.7463402, -1.154101, 2.868894, 0.5607843, 0, 1, 1,
0.7505128, 0.3702923, 1.523557, 0.5647059, 0, 1, 1,
0.751103, 1.489645, -0.3138913, 0.572549, 0, 1, 1,
0.7527383, -0.3487619, 1.4204, 0.5764706, 0, 1, 1,
0.7554212, -0.8594325, 4.836084, 0.5843138, 0, 1, 1,
0.7558724, -0.05858288, 1.384404, 0.5882353, 0, 1, 1,
0.7574452, 1.107789, 0.7615013, 0.5960785, 0, 1, 1,
0.7623563, 0.5074943, 0.9241096, 0.6039216, 0, 1, 1,
0.762622, 0.3918337, 1.454415, 0.6078432, 0, 1, 1,
0.7653185, 0.6301442, 0.03228986, 0.6156863, 0, 1, 1,
0.7689756, 0.8179158, 0.5080834, 0.6196079, 0, 1, 1,
0.7763013, 0.4845445, -0.1833187, 0.627451, 0, 1, 1,
0.7777711, 0.2489018, 2.821936, 0.6313726, 0, 1, 1,
0.7889948, -0.5379475, 2.199191, 0.6392157, 0, 1, 1,
0.795334, -0.1411373, -0.6285915, 0.6431373, 0, 1, 1,
0.7976839, -1.260356, 1.203256, 0.6509804, 0, 1, 1,
0.8023112, 0.02593993, 1.076438, 0.654902, 0, 1, 1,
0.8045371, 1.458505, 0.7980378, 0.6627451, 0, 1, 1,
0.806577, 1.682197, 0.03735716, 0.6666667, 0, 1, 1,
0.8140897, -1.351951, 1.484329, 0.6745098, 0, 1, 1,
0.8145086, 0.4413236, 1.141378, 0.6784314, 0, 1, 1,
0.8174187, 0.8748814, 1.9903, 0.6862745, 0, 1, 1,
0.8179243, -0.7190873, 1.750274, 0.6901961, 0, 1, 1,
0.8198599, 0.1198072, -0.1803581, 0.6980392, 0, 1, 1,
0.8305732, 0.2889288, 0.5546762, 0.7058824, 0, 1, 1,
0.8336057, -0.5021281, 1.381776, 0.7098039, 0, 1, 1,
0.8358459, 0.5423599, 2.154209, 0.7176471, 0, 1, 1,
0.8358989, 0.1108595, 0.695329, 0.7215686, 0, 1, 1,
0.8443874, 0.95574, 1.21476, 0.7294118, 0, 1, 1,
0.8492179, -0.1526242, 1.179753, 0.7333333, 0, 1, 1,
0.8508993, -0.5694098, 1.08382, 0.7411765, 0, 1, 1,
0.8510713, -1.152665, 3.251935, 0.7450981, 0, 1, 1,
0.8556687, -0.7668616, 3.287805, 0.7529412, 0, 1, 1,
0.8572696, -1.986093, 3.280428, 0.7568628, 0, 1, 1,
0.8576423, -0.8451635, 1.313272, 0.7647059, 0, 1, 1,
0.8586742, -1.986502, 2.681827, 0.7686275, 0, 1, 1,
0.8594811, -0.3545022, 1.983105, 0.7764706, 0, 1, 1,
0.8628472, 1.350035, 0.9549168, 0.7803922, 0, 1, 1,
0.863189, -0.1051959, 1.900995, 0.7882353, 0, 1, 1,
0.8635296, 1.677536, 0.5570914, 0.7921569, 0, 1, 1,
0.8757301, 0.4307053, -1.281164, 0.8, 0, 1, 1,
0.8763846, -0.6045085, 3.142442, 0.8078431, 0, 1, 1,
0.8782493, 0.7864829, 1.686547, 0.8117647, 0, 1, 1,
0.8845459, 0.8089772, -0.03767786, 0.8196079, 0, 1, 1,
0.8918862, -0.3595999, 0.8690502, 0.8235294, 0, 1, 1,
0.8979802, -0.4769641, 1.830842, 0.8313726, 0, 1, 1,
0.906417, 1.730998, 0.5082935, 0.8352941, 0, 1, 1,
0.9072562, 0.7306552, 1.583731, 0.8431373, 0, 1, 1,
0.9087389, 2.292335, 1.098463, 0.8470588, 0, 1, 1,
0.9226644, 0.0903886, 2.132281, 0.854902, 0, 1, 1,
0.9252083, -1.372801, 1.502526, 0.8588235, 0, 1, 1,
0.9265904, 0.8517353, 0.4719138, 0.8666667, 0, 1, 1,
0.9276787, -1.120798, 3.019576, 0.8705882, 0, 1, 1,
0.9318115, -1.155398, 2.425864, 0.8784314, 0, 1, 1,
0.9401982, 2.272862, -0.08097805, 0.8823529, 0, 1, 1,
0.9429554, -0.1921747, 2.996293, 0.8901961, 0, 1, 1,
0.9457926, -0.4917957, 1.734954, 0.8941177, 0, 1, 1,
0.9476792, -0.5224082, 2.226202, 0.9019608, 0, 1, 1,
0.9483936, 1.553778, 1.320616, 0.9098039, 0, 1, 1,
0.9603161, -0.07394955, 2.012019, 0.9137255, 0, 1, 1,
0.9617246, 0.6446902, 0.00338332, 0.9215686, 0, 1, 1,
0.9637372, 2.459561, 0.4963904, 0.9254902, 0, 1, 1,
0.970531, 0.4478002, 1.613537, 0.9333333, 0, 1, 1,
0.9709252, -0.3046066, 1.696505, 0.9372549, 0, 1, 1,
0.9761682, -0.03093122, 1.727498, 0.945098, 0, 1, 1,
0.9787553, -0.1166331, 2.734556, 0.9490196, 0, 1, 1,
0.9787936, -0.6407326, 4.124149, 0.9568627, 0, 1, 1,
0.9850821, -1.559333, 2.985622, 0.9607843, 0, 1, 1,
0.9858201, 0.1261102, 1.986078, 0.9686275, 0, 1, 1,
0.9877963, -0.3923829, 3.284652, 0.972549, 0, 1, 1,
0.9911309, -0.1074147, 1.419326, 0.9803922, 0, 1, 1,
0.9974949, 0.508774, 0.5582151, 0.9843137, 0, 1, 1,
1.018358, 1.976198, 2.3005, 0.9921569, 0, 1, 1,
1.020471, 0.5975478, 1.713042, 0.9960784, 0, 1, 1,
1.025036, -0.1981788, 2.348451, 1, 0, 0.9960784, 1,
1.025279, 0.9861045, 2.731049, 1, 0, 0.9882353, 1,
1.031316, 0.4375975, 0.2298732, 1, 0, 0.9843137, 1,
1.032608, 0.8762706, 2.324068, 1, 0, 0.9764706, 1,
1.036452, -0.3536219, 1.857099, 1, 0, 0.972549, 1,
1.042667, 0.4048782, 2.627752, 1, 0, 0.9647059, 1,
1.059056, 0.2898264, 0.09161283, 1, 0, 0.9607843, 1,
1.067499, -0.8813059, 1.831385, 1, 0, 0.9529412, 1,
1.073625, 2.461325, 0.112836, 1, 0, 0.9490196, 1,
1.078404, -0.3951377, 2.167819, 1, 0, 0.9411765, 1,
1.081604, 0.3403336, 2.091448, 1, 0, 0.9372549, 1,
1.089052, -0.9647536, 3.360772, 1, 0, 0.9294118, 1,
1.101542, -0.4172336, 2.316523, 1, 0, 0.9254902, 1,
1.103903, 1.234036, -1.412698, 1, 0, 0.9176471, 1,
1.105725, 0.6228182, -1.692766, 1, 0, 0.9137255, 1,
1.108534, -0.4546732, 1.064791, 1, 0, 0.9058824, 1,
1.112545, 2.78452, 0.2174233, 1, 0, 0.9019608, 1,
1.121201, 0.04346312, 0.2681738, 1, 0, 0.8941177, 1,
1.128275, 0.6629733, 0.911257, 1, 0, 0.8862745, 1,
1.137654, -1.326053, 2.208629, 1, 0, 0.8823529, 1,
1.138804, -1.210082, 3.994976, 1, 0, 0.8745098, 1,
1.139804, 0.4372517, -0.1535643, 1, 0, 0.8705882, 1,
1.141197, 0.5932845, 3.008928, 1, 0, 0.8627451, 1,
1.143515, 0.6018204, 2.657591, 1, 0, 0.8588235, 1,
1.144608, 0.3996807, 1.505873, 1, 0, 0.8509804, 1,
1.145118, -0.5620072, 1.599415, 1, 0, 0.8470588, 1,
1.146767, -0.6826978, 2.30219, 1, 0, 0.8392157, 1,
1.151608, 0.2878892, 3.24234, 1, 0, 0.8352941, 1,
1.154933, -0.7832987, 2.268363, 1, 0, 0.827451, 1,
1.15694, 0.294327, 1.030273, 1, 0, 0.8235294, 1,
1.15907, -1.042187, 1.377686, 1, 0, 0.8156863, 1,
1.160043, -1.592813, 3.011631, 1, 0, 0.8117647, 1,
1.17025, 0.3273621, 1.535399, 1, 0, 0.8039216, 1,
1.171598, -0.4841857, 1.678187, 1, 0, 0.7960784, 1,
1.172888, -0.95534, 2.612535, 1, 0, 0.7921569, 1,
1.178685, 0.5253346, 0.837299, 1, 0, 0.7843137, 1,
1.197318, -0.1381508, 1.427879, 1, 0, 0.7803922, 1,
1.201666, 0.4784478, 0.7731577, 1, 0, 0.772549, 1,
1.204351, -0.4985062, 2.009598, 1, 0, 0.7686275, 1,
1.205105, -2.553526, 4.094114, 1, 0, 0.7607843, 1,
1.206036, -0.8895505, 3.887086, 1, 0, 0.7568628, 1,
1.207848, -1.236783, 3.791369, 1, 0, 0.7490196, 1,
1.20829, -0.05240573, 1.857448, 1, 0, 0.7450981, 1,
1.222266, -0.2128985, 0.7913661, 1, 0, 0.7372549, 1,
1.2245, -1.385317, 3.316634, 1, 0, 0.7333333, 1,
1.224667, -0.7990448, 0.2341341, 1, 0, 0.7254902, 1,
1.227525, -0.3469182, 2.881279, 1, 0, 0.7215686, 1,
1.229384, 0.0817982, 1.760532, 1, 0, 0.7137255, 1,
1.229974, -0.3115114, 2.455124, 1, 0, 0.7098039, 1,
1.238024, 2.635509, -0.3602005, 1, 0, 0.7019608, 1,
1.243798, 0.01085115, 2.532128, 1, 0, 0.6941177, 1,
1.246453, -0.4510505, 2.556493, 1, 0, 0.6901961, 1,
1.256886, 0.4043599, 1.756297, 1, 0, 0.682353, 1,
1.2605, -1.861293, 3.006151, 1, 0, 0.6784314, 1,
1.261066, -0.1699772, 1.866244, 1, 0, 0.6705883, 1,
1.272431, -0.1208785, 0.04513922, 1, 0, 0.6666667, 1,
1.290411, -0.9031143, 2.380502, 1, 0, 0.6588235, 1,
1.290986, 0.6704198, 1.368665, 1, 0, 0.654902, 1,
1.294241, 0.6629672, 0.9111038, 1, 0, 0.6470588, 1,
1.303284, 0.2708454, 0.08261494, 1, 0, 0.6431373, 1,
1.304728, 0.8536179, 1.558815, 1, 0, 0.6352941, 1,
1.306821, -0.6438633, 3.369427, 1, 0, 0.6313726, 1,
1.308706, -1.180919, 2.345109, 1, 0, 0.6235294, 1,
1.309567, 1.504237, 0.612555, 1, 0, 0.6196079, 1,
1.322648, -0.1011279, 2.928065, 1, 0, 0.6117647, 1,
1.327976, -1.007806, 2.79902, 1, 0, 0.6078432, 1,
1.33331, 1.175708, 0.4826514, 1, 0, 0.6, 1,
1.339639, 0.2014761, 2.319585, 1, 0, 0.5921569, 1,
1.348338, -0.8259809, 2.266007, 1, 0, 0.5882353, 1,
1.358973, -1.036678, 3.213025, 1, 0, 0.5803922, 1,
1.359222, 1.968554, 0.03661364, 1, 0, 0.5764706, 1,
1.363651, 0.2185632, 2.206077, 1, 0, 0.5686275, 1,
1.365315, -0.8034674, 2.371575, 1, 0, 0.5647059, 1,
1.365503, 0.4897828, 4.165247, 1, 0, 0.5568628, 1,
1.370596, -0.849334, 1.78313, 1, 0, 0.5529412, 1,
1.376897, 0.2997913, 2.545933, 1, 0, 0.5450981, 1,
1.379903, 0.6404364, 1.088064, 1, 0, 0.5411765, 1,
1.382855, -0.7948213, 2.570336, 1, 0, 0.5333334, 1,
1.390488, 1.557582, 1.135413, 1, 0, 0.5294118, 1,
1.393934, 0.7732332, 0.3990311, 1, 0, 0.5215687, 1,
1.400413, 0.3995444, 0.1519924, 1, 0, 0.5176471, 1,
1.403197, 0.4860867, 0.477034, 1, 0, 0.509804, 1,
1.403238, -1.966266, 1.864731, 1, 0, 0.5058824, 1,
1.407504, -0.7632195, 3.106852, 1, 0, 0.4980392, 1,
1.410687, 0.632047, 3.689152, 1, 0, 0.4901961, 1,
1.414011, -0.7592133, 2.370123, 1, 0, 0.4862745, 1,
1.43638, -1.076397, 3.530018, 1, 0, 0.4784314, 1,
1.436524, -0.6425217, 2.986471, 1, 0, 0.4745098, 1,
1.440409, 0.7547246, 0.05718509, 1, 0, 0.4666667, 1,
1.444741, 0.7415617, 0.3884655, 1, 0, 0.4627451, 1,
1.451458, 2.297922, 1.779647, 1, 0, 0.454902, 1,
1.452264, -1.23981, 2.451128, 1, 0, 0.4509804, 1,
1.471267, -0.521421, 3.91026, 1, 0, 0.4431373, 1,
1.477601, 0.8334373, 1.517654, 1, 0, 0.4392157, 1,
1.494695, 1.607909, 1.190744, 1, 0, 0.4313726, 1,
1.499834, -0.3211481, 3.804397, 1, 0, 0.427451, 1,
1.520058, -1.632499, 1.233963, 1, 0, 0.4196078, 1,
1.526759, 0.8679628, 1.868228, 1, 0, 0.4156863, 1,
1.530327, -3.450601, 2.7042, 1, 0, 0.4078431, 1,
1.564898, 0.3281034, 0.8060775, 1, 0, 0.4039216, 1,
1.567447, 0.6277194, -0.2635996, 1, 0, 0.3960784, 1,
1.576426, -0.2002475, 2.809707, 1, 0, 0.3882353, 1,
1.578509, -0.4420216, 2.075356, 1, 0, 0.3843137, 1,
1.594954, 0.8128627, 1.205917, 1, 0, 0.3764706, 1,
1.6044, -0.2091687, 1.812725, 1, 0, 0.372549, 1,
1.604554, -0.04542299, 1.485181, 1, 0, 0.3647059, 1,
1.609921, 0.1076637, 1.366051, 1, 0, 0.3607843, 1,
1.619596, -0.3301632, 0.9378208, 1, 0, 0.3529412, 1,
1.630626, -1.310755, 1.857024, 1, 0, 0.3490196, 1,
1.633656, -0.5048677, 3.698236, 1, 0, 0.3411765, 1,
1.641357, -0.5583844, 3.245368, 1, 0, 0.3372549, 1,
1.649964, 0.84522, 2.855972, 1, 0, 0.3294118, 1,
1.66081, 0.3079167, 2.302669, 1, 0, 0.3254902, 1,
1.682151, -0.6096575, 0.4892424, 1, 0, 0.3176471, 1,
1.6835, 1.309846, 0.2854321, 1, 0, 0.3137255, 1,
1.690471, -1.124187, 2.99435, 1, 0, 0.3058824, 1,
1.695767, 0.3131007, 0.7183681, 1, 0, 0.2980392, 1,
1.696688, -0.7685277, 1.258871, 1, 0, 0.2941177, 1,
1.712555, 0.3584553, 1.703361, 1, 0, 0.2862745, 1,
1.716177, -0.3559943, 1.488453, 1, 0, 0.282353, 1,
1.736961, -1.318576, 1.80292, 1, 0, 0.2745098, 1,
1.747428, 0.1541098, 1.729884, 1, 0, 0.2705882, 1,
1.75367, -0.04213493, 1.08861, 1, 0, 0.2627451, 1,
1.766507, 1.486799, 0.7872537, 1, 0, 0.2588235, 1,
1.769256, -0.2060551, 1.417104, 1, 0, 0.2509804, 1,
1.771977, -0.9802347, 0.2122609, 1, 0, 0.2470588, 1,
1.786395, -0.990878, 3.06711, 1, 0, 0.2392157, 1,
1.787688, 0.1609708, 0.9410073, 1, 0, 0.2352941, 1,
1.789752, 0.1140639, 1.39945, 1, 0, 0.227451, 1,
1.794452, 1.540624, 0.2906941, 1, 0, 0.2235294, 1,
1.833295, -0.9682024, 1.714795, 1, 0, 0.2156863, 1,
1.838464, -1.646223, 1.889139, 1, 0, 0.2117647, 1,
1.851577, 1.450721, -0.359627, 1, 0, 0.2039216, 1,
1.883923, 1.761945, -0.2406764, 1, 0, 0.1960784, 1,
1.910077, -0.4421298, 1.788722, 1, 0, 0.1921569, 1,
1.920439, 0.1346138, 1.414374, 1, 0, 0.1843137, 1,
1.925982, -1.03171, 2.000204, 1, 0, 0.1803922, 1,
1.937356, 0.9239362, 0.148799, 1, 0, 0.172549, 1,
1.941334, 1.11175, -0.38146, 1, 0, 0.1686275, 1,
1.943553, -1.02, 2.725241, 1, 0, 0.1607843, 1,
1.952996, 3.407117, 1.888064, 1, 0, 0.1568628, 1,
1.962485, -1.941555, 1.341707, 1, 0, 0.1490196, 1,
1.969942, -1.332694, 3.366745, 1, 0, 0.145098, 1,
1.983093, -0.668326, 1.830323, 1, 0, 0.1372549, 1,
2.00404, -0.5954433, 2.790546, 1, 0, 0.1333333, 1,
2.006332, -0.05413, 0.8167623, 1, 0, 0.1254902, 1,
2.019329, 0.139964, 1.787819, 1, 0, 0.1215686, 1,
2.060648, 0.7605255, 1.273565, 1, 0, 0.1137255, 1,
2.107616, -1.01244, 2.724811, 1, 0, 0.1098039, 1,
2.12872, 1.282543, 0.04007454, 1, 0, 0.1019608, 1,
2.161412, 1.173657, 0.8127983, 1, 0, 0.09411765, 1,
2.169895, 0.7296913, 1.517374, 1, 0, 0.09019608, 1,
2.18403, -0.8112028, 1.108556, 1, 0, 0.08235294, 1,
2.208296, -0.1110644, 2.811383, 1, 0, 0.07843138, 1,
2.238147, 1.100753, 2.480381, 1, 0, 0.07058824, 1,
2.285078, 0.8335897, 1.710756, 1, 0, 0.06666667, 1,
2.302746, -0.04847785, 1.899918, 1, 0, 0.05882353, 1,
2.310481, -0.3718235, 0.7405047, 1, 0, 0.05490196, 1,
2.319973, 1.091888, 3.168493, 1, 0, 0.04705882, 1,
2.340759, -0.08030902, 1.267099, 1, 0, 0.04313726, 1,
2.447833, 0.1444149, -0.04076339, 1, 0, 0.03529412, 1,
2.468708, 0.2147016, 1.622341, 1, 0, 0.03137255, 1,
2.634171, -0.7191582, 2.687382, 1, 0, 0.02352941, 1,
2.906132, 0.64753, -0.2720464, 1, 0, 0.01960784, 1,
2.942806, -1.05537, 1.99432, 1, 0, 0.01176471, 1,
3.365411, 0.3828195, 1.207168, 1, 0, 0.007843138, 1
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
0.1348387, -4.612985, -6.631163, 0, -0.5, 0.5, 0.5,
0.1348387, -4.612985, -6.631163, 1, -0.5, 0.5, 0.5,
0.1348387, -4.612985, -6.631163, 1, 1.5, 0.5, 0.5,
0.1348387, -4.612985, -6.631163, 0, 1.5, 0.5, 0.5
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
-4.190898, -0.02174222, -6.631163, 0, -0.5, 0.5, 0.5,
-4.190898, -0.02174222, -6.631163, 1, -0.5, 0.5, 0.5,
-4.190898, -0.02174222, -6.631163, 1, 1.5, 0.5, 0.5,
-4.190898, -0.02174222, -6.631163, 0, 1.5, 0.5, 0.5
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
-4.190898, -4.612985, 0.1718752, 0, -0.5, 0.5, 0.5,
-4.190898, -4.612985, 0.1718752, 1, -0.5, 0.5, 0.5,
-4.190898, -4.612985, 0.1718752, 1, 1.5, 0.5, 0.5,
-4.190898, -4.612985, 0.1718752, 0, 1.5, 0.5, 0.5
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
-3, -3.553467, -5.061231,
3, -3.553467, -5.061231,
-3, -3.553467, -5.061231,
-3, -3.730053, -5.322886,
-2, -3.553467, -5.061231,
-2, -3.730053, -5.322886,
-1, -3.553467, -5.061231,
-1, -3.730053, -5.322886,
0, -3.553467, -5.061231,
0, -3.730053, -5.322886,
1, -3.553467, -5.061231,
1, -3.730053, -5.322886,
2, -3.553467, -5.061231,
2, -3.730053, -5.322886,
3, -3.553467, -5.061231,
3, -3.730053, -5.322886
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
-3, -4.083226, -5.846197, 0, -0.5, 0.5, 0.5,
-3, -4.083226, -5.846197, 1, -0.5, 0.5, 0.5,
-3, -4.083226, -5.846197, 1, 1.5, 0.5, 0.5,
-3, -4.083226, -5.846197, 0, 1.5, 0.5, 0.5,
-2, -4.083226, -5.846197, 0, -0.5, 0.5, 0.5,
-2, -4.083226, -5.846197, 1, -0.5, 0.5, 0.5,
-2, -4.083226, -5.846197, 1, 1.5, 0.5, 0.5,
-2, -4.083226, -5.846197, 0, 1.5, 0.5, 0.5,
-1, -4.083226, -5.846197, 0, -0.5, 0.5, 0.5,
-1, -4.083226, -5.846197, 1, -0.5, 0.5, 0.5,
-1, -4.083226, -5.846197, 1, 1.5, 0.5, 0.5,
-1, -4.083226, -5.846197, 0, 1.5, 0.5, 0.5,
0, -4.083226, -5.846197, 0, -0.5, 0.5, 0.5,
0, -4.083226, -5.846197, 1, -0.5, 0.5, 0.5,
0, -4.083226, -5.846197, 1, 1.5, 0.5, 0.5,
0, -4.083226, -5.846197, 0, 1.5, 0.5, 0.5,
1, -4.083226, -5.846197, 0, -0.5, 0.5, 0.5,
1, -4.083226, -5.846197, 1, -0.5, 0.5, 0.5,
1, -4.083226, -5.846197, 1, 1.5, 0.5, 0.5,
1, -4.083226, -5.846197, 0, 1.5, 0.5, 0.5,
2, -4.083226, -5.846197, 0, -0.5, 0.5, 0.5,
2, -4.083226, -5.846197, 1, -0.5, 0.5, 0.5,
2, -4.083226, -5.846197, 1, 1.5, 0.5, 0.5,
2, -4.083226, -5.846197, 0, 1.5, 0.5, 0.5,
3, -4.083226, -5.846197, 0, -0.5, 0.5, 0.5,
3, -4.083226, -5.846197, 1, -0.5, 0.5, 0.5,
3, -4.083226, -5.846197, 1, 1.5, 0.5, 0.5,
3, -4.083226, -5.846197, 0, 1.5, 0.5, 0.5
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
-3.192651, -3, -5.061231,
-3.192651, 3, -5.061231,
-3.192651, -3, -5.061231,
-3.359025, -3, -5.322886,
-3.192651, -2, -5.061231,
-3.359025, -2, -5.322886,
-3.192651, -1, -5.061231,
-3.359025, -1, -5.322886,
-3.192651, 0, -5.061231,
-3.359025, 0, -5.322886,
-3.192651, 1, -5.061231,
-3.359025, 1, -5.322886,
-3.192651, 2, -5.061231,
-3.359025, 2, -5.322886,
-3.192651, 3, -5.061231,
-3.359025, 3, -5.322886
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
-3.691775, -3, -5.846197, 0, -0.5, 0.5, 0.5,
-3.691775, -3, -5.846197, 1, -0.5, 0.5, 0.5,
-3.691775, -3, -5.846197, 1, 1.5, 0.5, 0.5,
-3.691775, -3, -5.846197, 0, 1.5, 0.5, 0.5,
-3.691775, -2, -5.846197, 0, -0.5, 0.5, 0.5,
-3.691775, -2, -5.846197, 1, -0.5, 0.5, 0.5,
-3.691775, -2, -5.846197, 1, 1.5, 0.5, 0.5,
-3.691775, -2, -5.846197, 0, 1.5, 0.5, 0.5,
-3.691775, -1, -5.846197, 0, -0.5, 0.5, 0.5,
-3.691775, -1, -5.846197, 1, -0.5, 0.5, 0.5,
-3.691775, -1, -5.846197, 1, 1.5, 0.5, 0.5,
-3.691775, -1, -5.846197, 0, 1.5, 0.5, 0.5,
-3.691775, 0, -5.846197, 0, -0.5, 0.5, 0.5,
-3.691775, 0, -5.846197, 1, -0.5, 0.5, 0.5,
-3.691775, 0, -5.846197, 1, 1.5, 0.5, 0.5,
-3.691775, 0, -5.846197, 0, 1.5, 0.5, 0.5,
-3.691775, 1, -5.846197, 0, -0.5, 0.5, 0.5,
-3.691775, 1, -5.846197, 1, -0.5, 0.5, 0.5,
-3.691775, 1, -5.846197, 1, 1.5, 0.5, 0.5,
-3.691775, 1, -5.846197, 0, 1.5, 0.5, 0.5,
-3.691775, 2, -5.846197, 0, -0.5, 0.5, 0.5,
-3.691775, 2, -5.846197, 1, -0.5, 0.5, 0.5,
-3.691775, 2, -5.846197, 1, 1.5, 0.5, 0.5,
-3.691775, 2, -5.846197, 0, 1.5, 0.5, 0.5,
-3.691775, 3, -5.846197, 0, -0.5, 0.5, 0.5,
-3.691775, 3, -5.846197, 1, -0.5, 0.5, 0.5,
-3.691775, 3, -5.846197, 1, 1.5, 0.5, 0.5,
-3.691775, 3, -5.846197, 0, 1.5, 0.5, 0.5
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
-3.192651, -3.553467, -4,
-3.192651, -3.553467, 4,
-3.192651, -3.553467, -4,
-3.359025, -3.730053, -4,
-3.192651, -3.553467, -2,
-3.359025, -3.730053, -2,
-3.192651, -3.553467, 0,
-3.359025, -3.730053, 0,
-3.192651, -3.553467, 2,
-3.359025, -3.730053, 2,
-3.192651, -3.553467, 4,
-3.359025, -3.730053, 4
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
-3.691775, -4.083226, -4, 0, -0.5, 0.5, 0.5,
-3.691775, -4.083226, -4, 1, -0.5, 0.5, 0.5,
-3.691775, -4.083226, -4, 1, 1.5, 0.5, 0.5,
-3.691775, -4.083226, -4, 0, 1.5, 0.5, 0.5,
-3.691775, -4.083226, -2, 0, -0.5, 0.5, 0.5,
-3.691775, -4.083226, -2, 1, -0.5, 0.5, 0.5,
-3.691775, -4.083226, -2, 1, 1.5, 0.5, 0.5,
-3.691775, -4.083226, -2, 0, 1.5, 0.5, 0.5,
-3.691775, -4.083226, 0, 0, -0.5, 0.5, 0.5,
-3.691775, -4.083226, 0, 1, -0.5, 0.5, 0.5,
-3.691775, -4.083226, 0, 1, 1.5, 0.5, 0.5,
-3.691775, -4.083226, 0, 0, 1.5, 0.5, 0.5,
-3.691775, -4.083226, 2, 0, -0.5, 0.5, 0.5,
-3.691775, -4.083226, 2, 1, -0.5, 0.5, 0.5,
-3.691775, -4.083226, 2, 1, 1.5, 0.5, 0.5,
-3.691775, -4.083226, 2, 0, 1.5, 0.5, 0.5,
-3.691775, -4.083226, 4, 0, -0.5, 0.5, 0.5,
-3.691775, -4.083226, 4, 1, -0.5, 0.5, 0.5,
-3.691775, -4.083226, 4, 1, 1.5, 0.5, 0.5,
-3.691775, -4.083226, 4, 0, 1.5, 0.5, 0.5
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
-3.192651, -3.553467, -5.061231,
-3.192651, 3.509983, -5.061231,
-3.192651, -3.553467, 5.404982,
-3.192651, 3.509983, 5.404982,
-3.192651, -3.553467, -5.061231,
-3.192651, -3.553467, 5.404982,
-3.192651, 3.509983, -5.061231,
-3.192651, 3.509983, 5.404982,
-3.192651, -3.553467, -5.061231,
3.462328, -3.553467, -5.061231,
-3.192651, -3.553467, 5.404982,
3.462328, -3.553467, 5.404982,
-3.192651, 3.509983, -5.061231,
3.462328, 3.509983, -5.061231,
-3.192651, 3.509983, 5.404982,
3.462328, 3.509983, 5.404982,
3.462328, -3.553467, -5.061231,
3.462328, 3.509983, -5.061231,
3.462328, -3.553467, 5.404982,
3.462328, 3.509983, 5.404982,
3.462328, -3.553467, -5.061231,
3.462328, -3.553467, 5.404982,
3.462328, 3.509983, -5.061231,
3.462328, 3.509983, 5.404982
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
var radius = 7.621583;
var distance = 33.90928;
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
mvMatrix.translate( -0.1348387, 0.02174222, -0.1718752 );
mvMatrix.scale( 1.238261, 1.166654, 0.787353 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.90928);
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
chlorpropham<-read.table("chlorpropham.xyz")
```

```
## Error in read.table("chlorpropham.xyz"): no lines available in input
```

```r
x<-chlorpropham$V2
```

```
## Error in eval(expr, envir, enclos): object 'chlorpropham' not found
```

```r
y<-chlorpropham$V3
```

```
## Error in eval(expr, envir, enclos): object 'chlorpropham' not found
```

```r
z<-chlorpropham$V4
```

```
## Error in eval(expr, envir, enclos): object 'chlorpropham' not found
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
-3.095734, 0.02748303, -0.9738019, 0, 0, 1, 1, 1,
-3.073422, 0.575938, -1.802116, 1, 0, 0, 1, 1,
-3.058144, 1.3488, -0.316349, 1, 0, 0, 1, 1,
-3.054769, 2.947201, -0.130471, 1, 0, 0, 1, 1,
-2.967557, -1.651473, -0.5633723, 1, 0, 0, 1, 1,
-2.964179, -0.2524997, 0.01059539, 1, 0, 0, 1, 1,
-2.777002, 1.476181, -2.794508, 0, 0, 0, 1, 1,
-2.739431, -0.9387057, -0.01940305, 0, 0, 0, 1, 1,
-2.721828, 0.170791, -0.8162679, 0, 0, 0, 1, 1,
-2.578828, -0.2031413, -3.04044, 0, 0, 0, 1, 1,
-2.576577, 0.004631806, -2.265882, 0, 0, 0, 1, 1,
-2.493092, 0.1774189, -1.868338, 0, 0, 0, 1, 1,
-2.457473, -1.908162, -0.396506, 0, 0, 0, 1, 1,
-2.305172, 0.3177738, -3.365399, 1, 1, 1, 1, 1,
-2.278387, -0.5451152, -1.445745, 1, 1, 1, 1, 1,
-2.272518, -0.5800264, -1.115307, 1, 1, 1, 1, 1,
-2.221083, 1.284263, 2.188294, 1, 1, 1, 1, 1,
-2.190194, -0.06269815, -0.1591266, 1, 1, 1, 1, 1,
-2.064926, -0.4083793, -0.936191, 1, 1, 1, 1, 1,
-2.064667, 0.09379298, -1.272947, 1, 1, 1, 1, 1,
-2.038248, -0.1719566, -1.025951, 1, 1, 1, 1, 1,
-2.031563, 0.09834095, -1.042442, 1, 1, 1, 1, 1,
-2.030427, -0.6378886, -3.174068, 1, 1, 1, 1, 1,
-2.030148, -0.5105926, -2.220107, 1, 1, 1, 1, 1,
-2.029984, 1.12314, -1.598704, 1, 1, 1, 1, 1,
-2.010736, 0.2972153, -1.253178, 1, 1, 1, 1, 1,
-1.995469, 0.06040306, -3.234899, 1, 1, 1, 1, 1,
-1.988101, -0.8618411, -3.57208, 1, 1, 1, 1, 1,
-1.985177, -0.7210764, -2.679383, 0, 0, 1, 1, 1,
-1.96586, 0.001670363, -1.321419, 1, 0, 0, 1, 1,
-1.961482, 0.5946673, -0.1078346, 1, 0, 0, 1, 1,
-1.961434, -1.378561, -3.028047, 1, 0, 0, 1, 1,
-1.937026, -0.8289464, -3.617966, 1, 0, 0, 1, 1,
-1.895849, 1.077348, -0.9129174, 1, 0, 0, 1, 1,
-1.853864, -0.3471268, -2.547759, 0, 0, 0, 1, 1,
-1.838071, 0.6086234, -0.4997326, 0, 0, 0, 1, 1,
-1.795025, 1.407254, -1.295614, 0, 0, 0, 1, 1,
-1.779626, 0.7262325, -1.608212, 0, 0, 0, 1, 1,
-1.76936, 0.2701567, 0.06758244, 0, 0, 0, 1, 1,
-1.767295, 1.263607, -0.3114004, 0, 0, 0, 1, 1,
-1.7665, 0.7595165, -1.615694, 0, 0, 0, 1, 1,
-1.73991, 0.8293189, 0.7519991, 1, 1, 1, 1, 1,
-1.726442, 0.03266557, -0.1735599, 1, 1, 1, 1, 1,
-1.722195, -1.020902, -1.643432, 1, 1, 1, 1, 1,
-1.721005, 0.1704404, -2.647387, 1, 1, 1, 1, 1,
-1.716111, 0.5032632, -2.625463, 1, 1, 1, 1, 1,
-1.700368, 0.7988073, -1.227025, 1, 1, 1, 1, 1,
-1.687572, -1.143215, -2.202965, 1, 1, 1, 1, 1,
-1.681435, -0.473903, -2.024217, 1, 1, 1, 1, 1,
-1.677046, 1.331129, 0.7305928, 1, 1, 1, 1, 1,
-1.673591, 0.5848337, -0.4033548, 1, 1, 1, 1, 1,
-1.659463, -0.226403, -2.915681, 1, 1, 1, 1, 1,
-1.656632, 0.4631317, -0.7580504, 1, 1, 1, 1, 1,
-1.649538, -0.4381205, -0.3806872, 1, 1, 1, 1, 1,
-1.627448, -1.253682, -2.457811, 1, 1, 1, 1, 1,
-1.618324, -0.09736826, -2.479098, 1, 1, 1, 1, 1,
-1.614374, 2.160438, -1.777368, 0, 0, 1, 1, 1,
-1.613881, 0.7050493, -0.6537757, 1, 0, 0, 1, 1,
-1.584868, -0.07175966, -0.8321543, 1, 0, 0, 1, 1,
-1.581008, -0.9110802, -3.260457, 1, 0, 0, 1, 1,
-1.580912, 0.2930537, -1.085217, 1, 0, 0, 1, 1,
-1.573565, 0.1069296, -2.459301, 1, 0, 0, 1, 1,
-1.573475, 0.1273671, -1.361977, 0, 0, 0, 1, 1,
-1.547771, -0.1386181, -3.738842, 0, 0, 0, 1, 1,
-1.545465, -0.302916, -2.69013, 0, 0, 0, 1, 1,
-1.539542, -0.9579409, -0.9299851, 0, 0, 0, 1, 1,
-1.537066, 2.184203, -0.7923771, 0, 0, 0, 1, 1,
-1.536997, -1.893989, -3.073818, 0, 0, 0, 1, 1,
-1.534812, 0.6976402, -2.354451, 0, 0, 0, 1, 1,
-1.51585, -1.965279, -0.6657621, 1, 1, 1, 1, 1,
-1.514971, -2.057341, -1.830049, 1, 1, 1, 1, 1,
-1.50968, -1.391829, -2.675837, 1, 1, 1, 1, 1,
-1.509415, 1.118942, -1.269458, 1, 1, 1, 1, 1,
-1.499424, 0.240206, -2.510757, 1, 1, 1, 1, 1,
-1.486444, 0.2078461, -2.063822, 1, 1, 1, 1, 1,
-1.466974, -0.5644975, -2.513007, 1, 1, 1, 1, 1,
-1.466655, -0.2155881, -1.710775, 1, 1, 1, 1, 1,
-1.459957, 0.09153409, -3.011654, 1, 1, 1, 1, 1,
-1.459197, 1.598065, -1.304014, 1, 1, 1, 1, 1,
-1.455868, 0.9676127, -0.09120698, 1, 1, 1, 1, 1,
-1.447716, -0.5548222, -2.890154, 1, 1, 1, 1, 1,
-1.433345, 0.3605952, 0.08184303, 1, 1, 1, 1, 1,
-1.402185, -0.9648453, -2.80979, 1, 1, 1, 1, 1,
-1.396915, 0.6809171, -2.039432, 1, 1, 1, 1, 1,
-1.395488, -1.358749, -3.239071, 0, 0, 1, 1, 1,
-1.39095, 0.6307404, -1.951803, 1, 0, 0, 1, 1,
-1.37868, -1.402366, -1.806668, 1, 0, 0, 1, 1,
-1.370857, 0.02131529, -0.2777616, 1, 0, 0, 1, 1,
-1.368824, -0.6602768, -1.584185, 1, 0, 0, 1, 1,
-1.35288, -0.6967326, -3.313133, 1, 0, 0, 1, 1,
-1.348204, 0.6557664, -1.732045, 0, 0, 0, 1, 1,
-1.347575, 0.1729873, -0.8560458, 0, 0, 0, 1, 1,
-1.333901, 0.7249805, -1.369293, 0, 0, 0, 1, 1,
-1.320168, -0.6320984, -2.14234, 0, 0, 0, 1, 1,
-1.315924, -1.503784, -2.491131, 0, 0, 0, 1, 1,
-1.308007, 0.9420998, -1.196338, 0, 0, 0, 1, 1,
-1.295985, -0.2889758, -0.9779188, 0, 0, 0, 1, 1,
-1.285782, -0.9041199, -2.286642, 1, 1, 1, 1, 1,
-1.280644, 0.534375, -2.091972, 1, 1, 1, 1, 1,
-1.279347, -0.9795591, -1.945238, 1, 1, 1, 1, 1,
-1.273759, -1.695475, -1.00936, 1, 1, 1, 1, 1,
-1.266605, 0.4984022, -1.409964, 1, 1, 1, 1, 1,
-1.261912, 2.20182, 0.4747375, 1, 1, 1, 1, 1,
-1.243114, 0.7163064, -1.169966, 1, 1, 1, 1, 1,
-1.239171, -0.3500665, -1.940742, 1, 1, 1, 1, 1,
-1.230708, 1.218864, -2.181402, 1, 1, 1, 1, 1,
-1.229169, -0.01454277, -0.9267671, 1, 1, 1, 1, 1,
-1.229004, 0.5186433, -2.645308, 1, 1, 1, 1, 1,
-1.228405, -0.7405194, -4.453414, 1, 1, 1, 1, 1,
-1.211823, -0.4904881, -1.698979, 1, 1, 1, 1, 1,
-1.206456, 2.015017, 0.5414922, 1, 1, 1, 1, 1,
-1.195017, 0.7437935, -0.8394799, 1, 1, 1, 1, 1,
-1.193999, 2.982862, -1.489107, 0, 0, 1, 1, 1,
-1.187605, 0.8628104, -1.053225, 1, 0, 0, 1, 1,
-1.181385, -0.04206168, -1.388072, 1, 0, 0, 1, 1,
-1.168815, -1.876231, -3.122892, 1, 0, 0, 1, 1,
-1.16748, 0.5116256, -0.6335682, 1, 0, 0, 1, 1,
-1.165417, 2.213837, -1.383045, 1, 0, 0, 1, 1,
-1.164682, -0.1028679, -3.350563, 0, 0, 0, 1, 1,
-1.163648, 0.4126603, -3.142707, 0, 0, 0, 1, 1,
-1.161392, 1.141378, -0.6643491, 0, 0, 0, 1, 1,
-1.156601, 0.06043231, -2.997646, 0, 0, 0, 1, 1,
-1.154942, 0.1814972, -1.776978, 0, 0, 0, 1, 1,
-1.150534, 1.053255, 0.7202041, 0, 0, 0, 1, 1,
-1.150151, -1.223754, -0.9959527, 0, 0, 0, 1, 1,
-1.139696, -2.277581, -1.121988, 1, 1, 1, 1, 1,
-1.135468, -0.7423341, -2.696049, 1, 1, 1, 1, 1,
-1.133694, 0.1094297, -0.7473489, 1, 1, 1, 1, 1,
-1.130515, 1.292446, -0.6766728, 1, 1, 1, 1, 1,
-1.12497, 1.038712, 0.4129843, 1, 1, 1, 1, 1,
-1.117699, -1.088663, -4.002781, 1, 1, 1, 1, 1,
-1.116051, 0.8542415, -0.1052814, 1, 1, 1, 1, 1,
-1.111303, 0.8649802, -1.750341, 1, 1, 1, 1, 1,
-1.10114, 1.797476, -1.19504, 1, 1, 1, 1, 1,
-1.100307, 0.9534018, -2.033889, 1, 1, 1, 1, 1,
-1.097229, 1.440465, -2.938349, 1, 1, 1, 1, 1,
-1.094986, -0.5333312, -0.4526093, 1, 1, 1, 1, 1,
-1.090968, 0.674592, -0.1068906, 1, 1, 1, 1, 1,
-1.086037, 0.6636484, -0.7679403, 1, 1, 1, 1, 1,
-1.084312, 1.10759, -2.026637, 1, 1, 1, 1, 1,
-1.07102, 0.3438396, -3.150177, 0, 0, 1, 1, 1,
-1.069901, 0.08757514, -3.160223, 1, 0, 0, 1, 1,
-1.067421, 0.01748676, -0.8335693, 1, 0, 0, 1, 1,
-1.065487, 1.050431, -0.6777877, 1, 0, 0, 1, 1,
-1.060847, -0.2136409, -1.061764, 1, 0, 0, 1, 1,
-1.05577, -0.344431, -2.722731, 1, 0, 0, 1, 1,
-1.047455, 0.7980472, -1.31009, 0, 0, 0, 1, 1,
-1.04675, -1.14709, -2.493413, 0, 0, 0, 1, 1,
-1.045101, -0.7961482, -2.843196, 0, 0, 0, 1, 1,
-1.044494, -0.915359, -4.713396, 0, 0, 0, 1, 1,
-1.035069, -0.6414471, -3.38035, 0, 0, 0, 1, 1,
-1.014252, -0.5278524, -2.820312, 0, 0, 0, 1, 1,
-1.012642, 1.197909, -0.4392547, 0, 0, 0, 1, 1,
-1.00895, 1.944828, 0.08121344, 1, 1, 1, 1, 1,
-1.008672, -0.3191227, -2.391206, 1, 1, 1, 1, 1,
-1.007087, -0.5017893, -1.838943, 1, 1, 1, 1, 1,
-1.006787, 1.968331, 0.02557837, 1, 1, 1, 1, 1,
-1.002123, 1.37588, -0.6978363, 1, 1, 1, 1, 1,
-1.000703, -1.297538, -3.056821, 1, 1, 1, 1, 1,
-0.9961659, -1.007059, -1.534334, 1, 1, 1, 1, 1,
-0.9932797, -0.6239377, -2.140318, 1, 1, 1, 1, 1,
-0.9912784, 0.6526377, -0.5867254, 1, 1, 1, 1, 1,
-0.9879158, -1.697867, -4.241194, 1, 1, 1, 1, 1,
-0.9861368, -0.3920625, -2.915039, 1, 1, 1, 1, 1,
-0.9827901, 1.11628, 1.29763, 1, 1, 1, 1, 1,
-0.9778718, 0.1200391, -2.128176, 1, 1, 1, 1, 1,
-0.9740599, -0.1324119, -3.29341, 1, 1, 1, 1, 1,
-0.9639217, -0.2736312, -1.334755, 1, 1, 1, 1, 1,
-0.9639182, 2.282794, 0.1994893, 0, 0, 1, 1, 1,
-0.9604444, 0.7417597, -1.424648, 1, 0, 0, 1, 1,
-0.956336, -0.2065904, -2.198728, 1, 0, 0, 1, 1,
-0.9497426, 1.387487, 0.2954433, 1, 0, 0, 1, 1,
-0.9491395, -0.5239052, -2.73541, 1, 0, 0, 1, 1,
-0.944509, -0.4503972, -1.700565, 1, 0, 0, 1, 1,
-0.9435146, -2.093641, -2.883157, 0, 0, 0, 1, 1,
-0.9317298, 0.6403908, -1.05486, 0, 0, 0, 1, 1,
-0.9287532, 1.392201, 0.9584306, 0, 0, 0, 1, 1,
-0.9241193, 0.0765999, -2.573034, 0, 0, 0, 1, 1,
-0.924114, 0.5169476, -2.359141, 0, 0, 0, 1, 1,
-0.920864, -0.3298444, -1.159806, 0, 0, 0, 1, 1,
-0.9172462, 0.3987579, -0.4081078, 0, 0, 0, 1, 1,
-0.9145324, -0.7367892, -1.98256, 1, 1, 1, 1, 1,
-0.9106829, 1.54188, -0.155031, 1, 1, 1, 1, 1,
-0.9068618, 2.352331, -1.145082, 1, 1, 1, 1, 1,
-0.9054647, 0.6587855, -0.6994002, 1, 1, 1, 1, 1,
-0.9029974, -0.977088, -3.094993, 1, 1, 1, 1, 1,
-0.902411, 0.6989676, 0.2257498, 1, 1, 1, 1, 1,
-0.9012807, -0.4970486, -2.635792, 1, 1, 1, 1, 1,
-0.8971092, -0.8639451, -3.007019, 1, 1, 1, 1, 1,
-0.895196, -0.4162375, -1.913174, 1, 1, 1, 1, 1,
-0.8921978, 0.9193802, -1.720684, 1, 1, 1, 1, 1,
-0.8865688, -0.5786812, -2.061857, 1, 1, 1, 1, 1,
-0.8832853, -0.9796222, -2.381278, 1, 1, 1, 1, 1,
-0.8815876, 0.77608, -1.722127, 1, 1, 1, 1, 1,
-0.8807608, 0.2050796, -2.254457, 1, 1, 1, 1, 1,
-0.8758202, -1.032356, -1.018606, 1, 1, 1, 1, 1,
-0.8700794, 0.5060992, 0.5746909, 0, 0, 1, 1, 1,
-0.8670044, 0.5149202, -2.427267, 1, 0, 0, 1, 1,
-0.8630231, -0.1051075, -0.606298, 1, 0, 0, 1, 1,
-0.8582405, 0.7464771, -0.8653214, 1, 0, 0, 1, 1,
-0.8575037, -0.4731611, -0.7765199, 1, 0, 0, 1, 1,
-0.8515982, -0.9631818, -2.87738, 1, 0, 0, 1, 1,
-0.8420282, -0.5810837, -2.970775, 0, 0, 0, 1, 1,
-0.8406897, -0.8239681, -3.035607, 0, 0, 0, 1, 1,
-0.8362554, 0.8864998, -1.770646, 0, 0, 0, 1, 1,
-0.8344874, -0.6537771, -1.364371, 0, 0, 0, 1, 1,
-0.8305656, 0.9464051, 0.05030707, 0, 0, 0, 1, 1,
-0.8255125, -0.1750625, -1.70342, 0, 0, 0, 1, 1,
-0.8247039, 1.651911, -0.3833032, 0, 0, 0, 1, 1,
-0.8215448, -0.2768034, -3.014312, 1, 1, 1, 1, 1,
-0.8195723, 1.094677, -0.8336478, 1, 1, 1, 1, 1,
-0.8152509, 0.1785408, -1.238678, 1, 1, 1, 1, 1,
-0.8096842, 0.976509, 0.5830711, 1, 1, 1, 1, 1,
-0.8073971, 0.1927022, -1.199085, 1, 1, 1, 1, 1,
-0.8063223, -1.383105, -3.578242, 1, 1, 1, 1, 1,
-0.8050638, 0.7429208, 0.3520855, 1, 1, 1, 1, 1,
-0.8018861, -0.3979087, -2.797385, 1, 1, 1, 1, 1,
-0.8014128, -0.02731562, -2.222366, 1, 1, 1, 1, 1,
-0.7782408, -0.379865, -1.859221, 1, 1, 1, 1, 1,
-0.7781194, 0.4994261, -0.4531273, 1, 1, 1, 1, 1,
-0.7730601, -1.09693, -2.891412, 1, 1, 1, 1, 1,
-0.7723417, 1.350421, 0.1249865, 1, 1, 1, 1, 1,
-0.7705594, 1.717588, -0.3160051, 1, 1, 1, 1, 1,
-0.7689422, -0.3211359, -1.629798, 1, 1, 1, 1, 1,
-0.7670041, -0.5455036, -2.40546, 0, 0, 1, 1, 1,
-0.7624547, -1.388386, -2.382304, 1, 0, 0, 1, 1,
-0.7455396, 0.1706622, -2.437993, 1, 0, 0, 1, 1,
-0.7400668, 1.518435, 0.06402046, 1, 0, 0, 1, 1,
-0.7388235, -1.537191, -1.601905, 1, 0, 0, 1, 1,
-0.7340853, -1.345341, -1.484442, 1, 0, 0, 1, 1,
-0.7337361, 0.8012903, -1.416578, 0, 0, 0, 1, 1,
-0.7265305, -0.9966675, -3.744138, 0, 0, 0, 1, 1,
-0.7249905, 0.961347, 0.6472406, 0, 0, 0, 1, 1,
-0.7233815, -0.7037489, -2.469404, 0, 0, 0, 1, 1,
-0.7129335, 0.3180566, -1.117648, 0, 0, 0, 1, 1,
-0.7126001, 1.099845, -0.8877154, 0, 0, 0, 1, 1,
-0.7112728, 1.185917, -0.9259483, 0, 0, 0, 1, 1,
-0.7091228, 0.7393128, -1.04858, 1, 1, 1, 1, 1,
-0.709046, 0.2511755, -2.29782, 1, 1, 1, 1, 1,
-0.7089745, 0.2567622, -1.571552, 1, 1, 1, 1, 1,
-0.7009618, 0.5100223, -1.306742, 1, 1, 1, 1, 1,
-0.6959245, -1.147881, -3.538163, 1, 1, 1, 1, 1,
-0.6924203, -0.6115811, -2.881624, 1, 1, 1, 1, 1,
-0.6917089, -0.5672263, -0.7291037, 1, 1, 1, 1, 1,
-0.6907544, -1.634312, -2.437221, 1, 1, 1, 1, 1,
-0.6906622, -0.5991464, -2.329796, 1, 1, 1, 1, 1,
-0.6901462, -1.216453, -2.686318, 1, 1, 1, 1, 1,
-0.6815131, 1.693009, -0.1250848, 1, 1, 1, 1, 1,
-0.6813752, 1.556602, -2.377225, 1, 1, 1, 1, 1,
-0.6791154, 3.09058, -0.1296606, 1, 1, 1, 1, 1,
-0.6750883, -1.510521, -1.362193, 1, 1, 1, 1, 1,
-0.6741245, 1.380074, 0.8490331, 1, 1, 1, 1, 1,
-0.6733928, -1.338114, -3.01339, 0, 0, 1, 1, 1,
-0.6682517, -1.470591, -2.522952, 1, 0, 0, 1, 1,
-0.6635826, -0.3857635, -1.707387, 1, 0, 0, 1, 1,
-0.660707, -0.2090803, -2.304285, 1, 0, 0, 1, 1,
-0.6559693, 2.151592, 0.2602283, 1, 0, 0, 1, 1,
-0.6547016, -0.8327907, -2.467749, 1, 0, 0, 1, 1,
-0.6537448, -0.1939682, -1.035557, 0, 0, 0, 1, 1,
-0.6524325, -0.6691393, -2.83038, 0, 0, 0, 1, 1,
-0.6523079, 0.3204636, -0.70144, 0, 0, 0, 1, 1,
-0.6419466, 0.4254922, -0.9140038, 0, 0, 0, 1, 1,
-0.6396537, 0.2353897, -1.259289, 0, 0, 0, 1, 1,
-0.6368861, -0.08758586, -3.280869, 0, 0, 0, 1, 1,
-0.6311814, 0.8472237, -0.4406236, 0, 0, 0, 1, 1,
-0.6273069, 1.175024, -1.290677, 1, 1, 1, 1, 1,
-0.6152716, 0.609192, -0.857757, 1, 1, 1, 1, 1,
-0.6152656, -1.188397, -3.071498, 1, 1, 1, 1, 1,
-0.6151512, -0.6054597, -0.8385659, 1, 1, 1, 1, 1,
-0.6136043, -0.3723463, -2.508935, 1, 1, 1, 1, 1,
-0.6130529, -0.2595762, -2.090171, 1, 1, 1, 1, 1,
-0.610468, 0.2832214, -1.894189, 1, 1, 1, 1, 1,
-0.6027666, 0.6826918, -0.9988185, 1, 1, 1, 1, 1,
-0.6026659, -0.8436983, -0.3097596, 1, 1, 1, 1, 1,
-0.5952297, 0.2370713, -0.7908616, 1, 1, 1, 1, 1,
-0.594016, -1.708898, -1.955496, 1, 1, 1, 1, 1,
-0.5937642, -0.06916995, -1.677437, 1, 1, 1, 1, 1,
-0.5932396, 1.280349, 0.2981573, 1, 1, 1, 1, 1,
-0.5926124, -0.7173711, -2.54072, 1, 1, 1, 1, 1,
-0.5924078, 0.4609579, 0.5286365, 1, 1, 1, 1, 1,
-0.5821093, -0.0250248, -1.404406, 0, 0, 1, 1, 1,
-0.5781617, -0.5469997, -1.395719, 1, 0, 0, 1, 1,
-0.5756862, -0.4967713, -0.89303, 1, 0, 0, 1, 1,
-0.5717598, -0.4101227, -2.752739, 1, 0, 0, 1, 1,
-0.5701646, 1.707777, -1.56829, 1, 0, 0, 1, 1,
-0.5685397, 0.004143048, -2.008881, 1, 0, 0, 1, 1,
-0.5670043, 0.3843209, -2.207131, 0, 0, 0, 1, 1,
-0.5598642, 0.3298846, -1.719878, 0, 0, 0, 1, 1,
-0.5578087, 1.474689, -0.5310685, 0, 0, 0, 1, 1,
-0.5571424, -0.2089848, -4.802508, 0, 0, 0, 1, 1,
-0.5569485, -2.028607, -4.584277, 0, 0, 0, 1, 1,
-0.555515, -0.3793923, -3.609679, 0, 0, 0, 1, 1,
-0.553728, 0.383585, -2.079085, 0, 0, 0, 1, 1,
-0.5516221, 1.62244, -0.3859325, 1, 1, 1, 1, 1,
-0.5511578, 0.7739444, -0.7091997, 1, 1, 1, 1, 1,
-0.5484787, -1.192899, -2.30371, 1, 1, 1, 1, 1,
-0.5443519, -0.7070171, -1.123433, 1, 1, 1, 1, 1,
-0.5342525, 0.2992858, 0.4103525, 1, 1, 1, 1, 1,
-0.5288271, -0.9952658, -2.675678, 1, 1, 1, 1, 1,
-0.5265136, -1.930435, -3.427652, 1, 1, 1, 1, 1,
-0.5262347, 0.685858, -1.299358, 1, 1, 1, 1, 1,
-0.5213574, -0.1949534, -2.457143, 1, 1, 1, 1, 1,
-0.516346, -0.1113258, -0.4725395, 1, 1, 1, 1, 1,
-0.5128009, -1.223414, -0.8355106, 1, 1, 1, 1, 1,
-0.511461, -0.4456418, -2.405263, 1, 1, 1, 1, 1,
-0.5067496, -0.001306989, -1.007799, 1, 1, 1, 1, 1,
-0.5054906, -0.5661846, -2.785537, 1, 1, 1, 1, 1,
-0.4987292, -0.6622606, -1.06014, 1, 1, 1, 1, 1,
-0.4987133, -2.014903, -2.269516, 0, 0, 1, 1, 1,
-0.4979028, -1.363625, -4.302076, 1, 0, 0, 1, 1,
-0.4977635, 0.453635, -2.537781, 1, 0, 0, 1, 1,
-0.4948983, -0.4671159, -2.392669, 1, 0, 0, 1, 1,
-0.4926444, 0.5304684, -0.314954, 1, 0, 0, 1, 1,
-0.4908051, 0.7677348, -0.07181828, 1, 0, 0, 1, 1,
-0.4902301, 0.7212687, 0.5520623, 0, 0, 0, 1, 1,
-0.4858424, -0.07419154, -1.865469, 0, 0, 0, 1, 1,
-0.4838017, -0.9184834, -1.719652, 0, 0, 0, 1, 1,
-0.4837065, 1.232041, 0.3060076, 0, 0, 0, 1, 1,
-0.4771646, -0.6591907, -1.246223, 0, 0, 0, 1, 1,
-0.4751713, 0.7710561, -1.58272, 0, 0, 0, 1, 1,
-0.4709868, 0.6489869, -0.5477234, 0, 0, 0, 1, 1,
-0.4654745, -0.4813594, -4.165141, 1, 1, 1, 1, 1,
-0.4652665, 1.331523, -1.54057, 1, 1, 1, 1, 1,
-0.4629807, -0.9093053, -3.191585, 1, 1, 1, 1, 1,
-0.4611624, -0.4501914, -2.503748, 1, 1, 1, 1, 1,
-0.4572605, 0.04286907, -2.525262, 1, 1, 1, 1, 1,
-0.4541756, -0.2826331, -2.02718, 1, 1, 1, 1, 1,
-0.4504636, -0.9044642, -3.157209, 1, 1, 1, 1, 1,
-0.4457256, 0.473929, -1.691583, 1, 1, 1, 1, 1,
-0.4448407, -0.4906948, -2.964353, 1, 1, 1, 1, 1,
-0.4444278, -1.340154, -4.717889, 1, 1, 1, 1, 1,
-0.4430262, -0.8061499, -1.675208, 1, 1, 1, 1, 1,
-0.4415398, 0.006791016, -1.837564, 1, 1, 1, 1, 1,
-0.4412082, 0.6134133, -0.6161327, 1, 1, 1, 1, 1,
-0.4383944, -0.9102255, -1.986107, 1, 1, 1, 1, 1,
-0.4361028, 0.07343946, -1.584195, 1, 1, 1, 1, 1,
-0.4359445, -0.4861265, -0.678251, 0, 0, 1, 1, 1,
-0.4339718, 0.3176291, -1.559086, 1, 0, 0, 1, 1,
-0.431595, 0.4898388, -0.551187, 1, 0, 0, 1, 1,
-0.4268276, -0.4216295, -2.909618, 1, 0, 0, 1, 1,
-0.4257418, -1.576937, -1.014567, 1, 0, 0, 1, 1,
-0.4245837, 0.188425, -1.818375, 1, 0, 0, 1, 1,
-0.4158051, 0.7343095, 0.3100225, 0, 0, 0, 1, 1,
-0.4143638, 2.271097, 1.252789, 0, 0, 0, 1, 1,
-0.4130627, -1.194753, -1.645509, 0, 0, 0, 1, 1,
-0.4125553, -0.3324594, -1.011038, 0, 0, 0, 1, 1,
-0.4083866, 0.04060781, -1.857942, 0, 0, 0, 1, 1,
-0.4076452, -0.4950301, -3.416904, 0, 0, 0, 1, 1,
-0.4073952, 1.730361, -1.877174, 0, 0, 0, 1, 1,
-0.4067435, 0.8047478, -1.096195, 1, 1, 1, 1, 1,
-0.4047937, 0.5684, -0.4557787, 1, 1, 1, 1, 1,
-0.403566, -0.6347235, -3.241342, 1, 1, 1, 1, 1,
-0.3990201, -0.6747486, -0.7969034, 1, 1, 1, 1, 1,
-0.3948315, 0.3896801, -0.4739151, 1, 1, 1, 1, 1,
-0.3930159, -0.4919541, -4.566465, 1, 1, 1, 1, 1,
-0.383615, 0.885586, 0.3426326, 1, 1, 1, 1, 1,
-0.3802195, -0.5603158, -3.105035, 1, 1, 1, 1, 1,
-0.3778439, -0.5020791, -2.171248, 1, 1, 1, 1, 1,
-0.3769794, 0.1909048, -1.999192, 1, 1, 1, 1, 1,
-0.3750097, 0.3849306, -0.08793158, 1, 1, 1, 1, 1,
-0.3693263, 1.205145, -1.433692, 1, 1, 1, 1, 1,
-0.3691012, 0.3054451, 0.8804653, 1, 1, 1, 1, 1,
-0.367486, -0.3158222, -3.114882, 1, 1, 1, 1, 1,
-0.3670524, -1.397954, -1.804542, 1, 1, 1, 1, 1,
-0.3624975, -0.1854824, -2.641767, 0, 0, 1, 1, 1,
-0.3618045, 0.2392847, -0.5760521, 1, 0, 0, 1, 1,
-0.3482554, 2.063241, -0.4513291, 1, 0, 0, 1, 1,
-0.3474199, -0.1013685, -0.9781047, 1, 0, 0, 1, 1,
-0.3409131, 0.3855632, -0.7127637, 1, 0, 0, 1, 1,
-0.3400071, -0.7506962, -2.536769, 1, 0, 0, 1, 1,
-0.3259914, 0.1968291, -1.426828, 0, 0, 0, 1, 1,
-0.3256016, -0.8561734, -2.305415, 0, 0, 0, 1, 1,
-0.325172, 0.985293, 1.236676, 0, 0, 0, 1, 1,
-0.3232364, 0.4283575, -0.4223736, 0, 0, 0, 1, 1,
-0.3231304, -0.263345, -1.87467, 0, 0, 0, 1, 1,
-0.3214194, -0.659737, -2.24585, 0, 0, 0, 1, 1,
-0.3201816, 0.6241474, -0.4575461, 0, 0, 0, 1, 1,
-0.3182688, -1.054412, -4.110627, 1, 1, 1, 1, 1,
-0.313357, 1.071713, 1.605518, 1, 1, 1, 1, 1,
-0.3123135, -0.3806132, -3.181444, 1, 1, 1, 1, 1,
-0.3080086, -0.4551482, -3.452364, 1, 1, 1, 1, 1,
-0.3051181, -0.2901409, -3.419679, 1, 1, 1, 1, 1,
-0.3032283, 0.01616438, -0.7712467, 1, 1, 1, 1, 1,
-0.3023946, -0.7513238, -1.951915, 1, 1, 1, 1, 1,
-0.3017241, -0.2876131, -3.994836, 1, 1, 1, 1, 1,
-0.2990953, -0.2608968, -4.332459, 1, 1, 1, 1, 1,
-0.2974662, 0.5267191, -0.9069106, 1, 1, 1, 1, 1,
-0.2906741, -2.140905, -3.025917, 1, 1, 1, 1, 1,
-0.289123, -1.860611, -4.200366, 1, 1, 1, 1, 1,
-0.2881725, 1.026491, -1.171773, 1, 1, 1, 1, 1,
-0.2825696, 0.5494296, 0.4162306, 1, 1, 1, 1, 1,
-0.2820367, -0.3816156, -2.983246, 1, 1, 1, 1, 1,
-0.2801424, 0.1001282, -0.6010162, 0, 0, 1, 1, 1,
-0.2776541, 0.4236009, -2.221756, 1, 0, 0, 1, 1,
-0.2758409, -0.4585325, -3.357875, 1, 0, 0, 1, 1,
-0.2699579, 0.4746319, 1.277011, 1, 0, 0, 1, 1,
-0.2696731, 1.345048, -0.3568426, 1, 0, 0, 1, 1,
-0.2687795, 0.1218033, -1.567953, 1, 0, 0, 1, 1,
-0.2665105, 0.3227013, -0.323938, 0, 0, 0, 1, 1,
-0.263324, -1.360155, -3.722267, 0, 0, 0, 1, 1,
-0.2620685, -0.6879215, -3.436543, 0, 0, 0, 1, 1,
-0.2577147, -0.296579, -2.176052, 0, 0, 0, 1, 1,
-0.2569353, -0.0776492, -2.008032, 0, 0, 0, 1, 1,
-0.2546746, -0.7883512, -2.404149, 0, 0, 0, 1, 1,
-0.2505699, -1.629752, -1.920048, 0, 0, 0, 1, 1,
-0.249584, -0.7073413, -2.241068, 1, 1, 1, 1, 1,
-0.2459522, 1.362262, 0.9854312, 1, 1, 1, 1, 1,
-0.2450671, -1.176237, -4.113418, 1, 1, 1, 1, 1,
-0.2449724, 0.1609979, -1.467327, 1, 1, 1, 1, 1,
-0.2447871, -0.0651869, -3.661027, 1, 1, 1, 1, 1,
-0.2419761, 1.379015, 0.07991532, 1, 1, 1, 1, 1,
-0.2394716, 0.1163409, -2.297815, 1, 1, 1, 1, 1,
-0.2333491, -0.2063827, -1.588374, 1, 1, 1, 1, 1,
-0.2332822, -0.04030553, -1.157337, 1, 1, 1, 1, 1,
-0.2325057, 1.505661, -0.3052292, 1, 1, 1, 1, 1,
-0.2273089, -0.1847393, -4.610368, 1, 1, 1, 1, 1,
-0.2259708, -0.6418257, -2.774656, 1, 1, 1, 1, 1,
-0.225569, 0.3370314, -0.3686509, 1, 1, 1, 1, 1,
-0.2184374, 0.06328379, -1.403074, 1, 1, 1, 1, 1,
-0.2149149, -1.157447, -3.152528, 1, 1, 1, 1, 1,
-0.2141031, 1.141215, -1.249683, 0, 0, 1, 1, 1,
-0.2034704, -0.3442572, -2.766774, 1, 0, 0, 1, 1,
-0.2020238, 0.2857202, 1.508342, 1, 0, 0, 1, 1,
-0.2000842, -1.341657, -4.113029, 1, 0, 0, 1, 1,
-0.1999369, -0.3033503, -2.838383, 1, 0, 0, 1, 1,
-0.1952957, 0.1440541, -1.559724, 1, 0, 0, 1, 1,
-0.1936035, 1.922107, -1.777326, 0, 0, 0, 1, 1,
-0.1930083, -1.231706, -3.275146, 0, 0, 0, 1, 1,
-0.1866457, 0.7960318, 0.1455381, 0, 0, 0, 1, 1,
-0.1856156, 1.147192, -0.9055127, 0, 0, 0, 1, 1,
-0.1848002, 0.5635113, 0.4562155, 0, 0, 0, 1, 1,
-0.181732, -0.2349687, -0.02985217, 0, 0, 0, 1, 1,
-0.179993, -0.7573001, -1.881602, 0, 0, 0, 1, 1,
-0.1773348, 0.444344, 0.6050354, 1, 1, 1, 1, 1,
-0.1765165, 1.422632, -0.1120469, 1, 1, 1, 1, 1,
-0.1758821, 0.1076426, -1.049792, 1, 1, 1, 1, 1,
-0.1735056, -0.1289058, -1.902553, 1, 1, 1, 1, 1,
-0.1699598, 0.6223558, 0.117968, 1, 1, 1, 1, 1,
-0.1683181, -0.4659166, -3.069257, 1, 1, 1, 1, 1,
-0.1625614, 0.5610502, -0.5881372, 1, 1, 1, 1, 1,
-0.1612071, 0.1846301, -1.814463, 1, 1, 1, 1, 1,
-0.1598023, 0.3560327, -1.112645, 1, 1, 1, 1, 1,
-0.1578992, -0.572525, -2.357894, 1, 1, 1, 1, 1,
-0.1578716, 1.427435, -1.144344, 1, 1, 1, 1, 1,
-0.1555557, 1.077941, 0.6489924, 1, 1, 1, 1, 1,
-0.1552797, -0.5356802, -0.2414425, 1, 1, 1, 1, 1,
-0.1547567, -1.159228, -3.215124, 1, 1, 1, 1, 1,
-0.1547472, 0.718016, -0.06371391, 1, 1, 1, 1, 1,
-0.1544794, 1.333619, -0.5422654, 0, 0, 1, 1, 1,
-0.1536595, 1.157044, -0.6949882, 1, 0, 0, 1, 1,
-0.1490737, 1.769395, -0.5471334, 1, 0, 0, 1, 1,
-0.1483209, -1.13405, -3.143972, 1, 0, 0, 1, 1,
-0.147548, -0.5059446, -2.644279, 1, 0, 0, 1, 1,
-0.1474469, 0.7504308, -1.146336, 1, 0, 0, 1, 1,
-0.1431387, 1.345874, 0.8170346, 0, 0, 0, 1, 1,
-0.1423311, -0.04763417, -0.6282005, 0, 0, 0, 1, 1,
-0.139557, -0.0961389, -1.817007, 0, 0, 0, 1, 1,
-0.1388278, 0.992027, 0.6094514, 0, 0, 0, 1, 1,
-0.1378707, -0.2571968, -2.438874, 0, 0, 0, 1, 1,
-0.1344063, 1.382653, -0.2678296, 0, 0, 0, 1, 1,
-0.1320896, 0.2466804, 0.1884034, 0, 0, 0, 1, 1,
-0.1296025, -1.118586, -3.544202, 1, 1, 1, 1, 1,
-0.1210582, 0.4816084, -0.9227352, 1, 1, 1, 1, 1,
-0.1206499, 0.3011395, 1.629452, 1, 1, 1, 1, 1,
-0.1173411, -0.04707817, -0.5735412, 1, 1, 1, 1, 1,
-0.1115328, -1.869714, -3.487896, 1, 1, 1, 1, 1,
-0.1115012, 0.248828, -0.6931454, 1, 1, 1, 1, 1,
-0.1088774, -0.1450763, -0.7901283, 1, 1, 1, 1, 1,
-0.102615, 0.6400743, 0.4691841, 1, 1, 1, 1, 1,
-0.1010568, -0.3942076, -3.549297, 1, 1, 1, 1, 1,
-0.09367921, -1.144096, -1.858243, 1, 1, 1, 1, 1,
-0.09242632, 1.983276, 1.007192, 1, 1, 1, 1, 1,
-0.08936428, -1.236788, -0.4203853, 1, 1, 1, 1, 1,
-0.08644245, -0.05067407, -2.827742, 1, 1, 1, 1, 1,
-0.07701844, 0.3862517, -0.917372, 1, 1, 1, 1, 1,
-0.07607783, 1.014193, 2.06438, 1, 1, 1, 1, 1,
-0.07406723, 0.438433, 0.3524911, 0, 0, 1, 1, 1,
-0.07383915, -0.2838793, -3.56104, 1, 0, 0, 1, 1,
-0.07358331, 1.651662, -0.9154536, 1, 0, 0, 1, 1,
-0.07350782, 0.7675906, -1.077131, 1, 0, 0, 1, 1,
-0.07146865, -0.5673816, -3.008108, 1, 0, 0, 1, 1,
-0.0649552, -0.3258828, -2.891938, 1, 0, 0, 1, 1,
-0.0638648, 0.5252243, -0.4813982, 0, 0, 0, 1, 1,
-0.06323941, 1.042231, -0.4861434, 0, 0, 0, 1, 1,
-0.05997101, 0.09312548, -0.7242392, 0, 0, 0, 1, 1,
-0.05373948, 0.5833378, 0.04630461, 0, 0, 0, 1, 1,
-0.04729381, -1.156053, -4.49907, 0, 0, 0, 1, 1,
-0.04313943, -0.732111, -2.682182, 0, 0, 0, 1, 1,
-0.04166741, 1.024788, 0.1645468, 0, 0, 0, 1, 1,
-0.04036215, 1.436629, -0.3321197, 1, 1, 1, 1, 1,
-0.03580488, 1.256035, -0.1464717, 1, 1, 1, 1, 1,
-0.03353039, 0.6919832, 0.3595141, 1, 1, 1, 1, 1,
-0.03026911, 0.4113838, -1.199689, 1, 1, 1, 1, 1,
-0.02980373, 0.1634095, -1.291891, 1, 1, 1, 1, 1,
-0.02826638, 1.378959, 1.292431, 1, 1, 1, 1, 1,
-0.02000914, 1.477074, -0.8436072, 1, 1, 1, 1, 1,
-0.01964285, -0.1427822, -2.997972, 1, 1, 1, 1, 1,
-0.01721881, 0.7057307, 0.8156378, 1, 1, 1, 1, 1,
-0.01203361, -0.7797104, -4.908811, 1, 1, 1, 1, 1,
-0.01058912, -0.5373824, -3.124503, 1, 1, 1, 1, 1,
-0.008594587, -1.172328, -2.279427, 1, 1, 1, 1, 1,
-0.005145763, 0.4475215, -0.9384962, 1, 1, 1, 1, 1,
0.003451638, 2.461698, 0.1092491, 1, 1, 1, 1, 1,
0.01749741, -1.004225, 3.508986, 1, 1, 1, 1, 1,
0.01957408, 0.07901261, 0.5743522, 0, 0, 1, 1, 1,
0.02652639, -0.08560467, 3.523808, 1, 0, 0, 1, 1,
0.02885741, -0.009818129, 2.15302, 1, 0, 0, 1, 1,
0.02891316, -0.1735648, 4.697724, 1, 0, 0, 1, 1,
0.03516717, -0.1400107, 2.249416, 1, 0, 0, 1, 1,
0.0380173, 1.613242, -0.7643724, 1, 0, 0, 1, 1,
0.04129869, -0.8409343, 1.566209, 0, 0, 0, 1, 1,
0.04341898, 1.972046, 0.03139021, 0, 0, 0, 1, 1,
0.04358885, 2.511192, -0.2298347, 0, 0, 0, 1, 1,
0.04849698, 1.190735, -0.6509857, 0, 0, 0, 1, 1,
0.06123679, -0.1030965, 2.971218, 0, 0, 0, 1, 1,
0.06467544, -0.03548812, 2.900616, 0, 0, 0, 1, 1,
0.06535544, 0.3628134, -0.5819669, 0, 0, 0, 1, 1,
0.07484996, 0.2773696, 0.3843491, 1, 1, 1, 1, 1,
0.07634367, 0.3521326, 0.958225, 1, 1, 1, 1, 1,
0.0786904, -2.057279, 3.176595, 1, 1, 1, 1, 1,
0.07942101, -1.277114, 2.579154, 1, 1, 1, 1, 1,
0.08741291, 0.6402647, 0.2379937, 1, 1, 1, 1, 1,
0.09077821, -0.5465589, 1.890541, 1, 1, 1, 1, 1,
0.09200341, 0.4883153, 0.5915872, 1, 1, 1, 1, 1,
0.103472, 0.3205128, 0.1305108, 1, 1, 1, 1, 1,
0.1042936, -0.5339112, 3.910335, 1, 1, 1, 1, 1,
0.1049891, -2.015064, 3.297265, 1, 1, 1, 1, 1,
0.1077203, 0.3448425, -0.01943644, 1, 1, 1, 1, 1,
0.1081948, -0.1494561, 3.156723, 1, 1, 1, 1, 1,
0.1084165, 0.1280903, 0.5180438, 1, 1, 1, 1, 1,
0.109224, -0.09830943, 0.7181707, 1, 1, 1, 1, 1,
0.1097734, -0.4771606, 4.147819, 1, 1, 1, 1, 1,
0.1098249, 0.2557931, -1.360236, 0, 0, 1, 1, 1,
0.1139134, 0.7661526, -1.19678, 1, 0, 0, 1, 1,
0.116008, 0.01027312, 2.191334, 1, 0, 0, 1, 1,
0.1163045, 0.6734946, -0.02241905, 1, 0, 0, 1, 1,
0.1167223, -0.5202609, 3.927339, 1, 0, 0, 1, 1,
0.1189259, 0.04061516, 1.092365, 1, 0, 0, 1, 1,
0.1245077, 0.2306122, 0.448964, 0, 0, 0, 1, 1,
0.125272, -1.977073, 2.87877, 0, 0, 0, 1, 1,
0.1307526, 0.5707605, 0.1345488, 0, 0, 0, 1, 1,
0.1317172, 0.01725686, 1.725714, 0, 0, 0, 1, 1,
0.1416148, 0.5350274, -0.3677651, 0, 0, 0, 1, 1,
0.1433999, -0.1552911, 1.403728, 0, 0, 0, 1, 1,
0.1436731, -0.3796443, 2.084225, 0, 0, 0, 1, 1,
0.1467402, 1.232757, -0.918714, 1, 1, 1, 1, 1,
0.1475842, -0.728357, 1.493448, 1, 1, 1, 1, 1,
0.1480567, -0.8060438, 4.695263, 1, 1, 1, 1, 1,
0.1513237, 0.002277425, 0.2902716, 1, 1, 1, 1, 1,
0.1535037, 1.732087, 0.1010268, 1, 1, 1, 1, 1,
0.1544189, 0.593303, 2.265427, 1, 1, 1, 1, 1,
0.1547081, -1.469738, 2.459931, 1, 1, 1, 1, 1,
0.1624642, 1.17226, 0.527625, 1, 1, 1, 1, 1,
0.16371, -1.769236, 1.536426, 1, 1, 1, 1, 1,
0.1646394, -0.2253687, 3.007849, 1, 1, 1, 1, 1,
0.1660179, 0.7217391, 0.767916, 1, 1, 1, 1, 1,
0.1662434, -0.3474745, 2.30156, 1, 1, 1, 1, 1,
0.1720355, -1.086924, 2.332924, 1, 1, 1, 1, 1,
0.172854, 0.07806329, 2.4588, 1, 1, 1, 1, 1,
0.1765373, 0.840146, 2.020108, 1, 1, 1, 1, 1,
0.178455, -0.002430741, 4.513511, 0, 0, 1, 1, 1,
0.1786239, 1.196061, 0.4943146, 1, 0, 0, 1, 1,
0.1802345, -1.803661, 4.101036, 1, 0, 0, 1, 1,
0.1802973, -0.4754959, 2.64351, 1, 0, 0, 1, 1,
0.1807156, -0.313212, 2.033977, 1, 0, 0, 1, 1,
0.1825507, -0.842382, 2.608111, 1, 0, 0, 1, 1,
0.1831985, -0.5685065, 2.41847, 0, 0, 0, 1, 1,
0.1840442, -0.6618007, 3.673949, 0, 0, 0, 1, 1,
0.187817, -0.6905167, 2.021128, 0, 0, 0, 1, 1,
0.1901466, -0.6368156, 3.24899, 0, 0, 0, 1, 1,
0.192862, 0.6347497, -2.100154, 0, 0, 0, 1, 1,
0.1929936, 0.5770051, 0.1520279, 0, 0, 0, 1, 1,
0.2052113, 1.670718, -0.9131929, 0, 0, 0, 1, 1,
0.2095691, -0.9108132, 2.525288, 1, 1, 1, 1, 1,
0.2096966, -0.7332077, 1.939592, 1, 1, 1, 1, 1,
0.2097923, 0.3286866, 0.9545625, 1, 1, 1, 1, 1,
0.2113435, -0.6915048, 1.623355, 1, 1, 1, 1, 1,
0.2113615, 0.3013276, 1.003292, 1, 1, 1, 1, 1,
0.21727, -0.1962661, 1.467053, 1, 1, 1, 1, 1,
0.2180616, 0.8197902, 0.3346485, 1, 1, 1, 1, 1,
0.2182393, 1.836584, 1.312183, 1, 1, 1, 1, 1,
0.2237397, 2.026054, -0.2885457, 1, 1, 1, 1, 1,
0.2264748, -0.3721543, 1.384393, 1, 1, 1, 1, 1,
0.229491, -1.26633, 4.651957, 1, 1, 1, 1, 1,
0.2300135, -0.4257891, 3.565312, 1, 1, 1, 1, 1,
0.2342649, 0.3505024, 0.2116407, 1, 1, 1, 1, 1,
0.2346914, 1.13279, 1.304517, 1, 1, 1, 1, 1,
0.2380221, 0.6192678, 1.726143, 1, 1, 1, 1, 1,
0.2419311, 1.20878, 0.7066543, 0, 0, 1, 1, 1,
0.2438035, 0.5579232, 0.7197554, 1, 0, 0, 1, 1,
0.2473731, -1.53453, 2.95948, 1, 0, 0, 1, 1,
0.2518353, 0.186325, 0.1480977, 1, 0, 0, 1, 1,
0.2527271, 1.175868, -1.615437, 1, 0, 0, 1, 1,
0.2537707, -0.1011503, 0.9909676, 1, 0, 0, 1, 1,
0.2560302, -1.174074, 3.68969, 0, 0, 0, 1, 1,
0.2593415, -0.3720072, 0.7804277, 0, 0, 0, 1, 1,
0.2634108, 0.6685315, 0.880741, 0, 0, 0, 1, 1,
0.2673507, 0.4914411, 0.9350557, 0, 0, 0, 1, 1,
0.2734087, -0.2790863, 2.034174, 0, 0, 0, 1, 1,
0.2776286, 0.3900873, 0.1605575, 0, 0, 0, 1, 1,
0.2798039, 0.06550775, 1.660458, 0, 0, 0, 1, 1,
0.2808212, -1.078778, 2.66941, 1, 1, 1, 1, 1,
0.2884073, 0.3061076, 0.05329533, 1, 1, 1, 1, 1,
0.2892008, -1.176321, 3.823311, 1, 1, 1, 1, 1,
0.290062, 1.099656, 1.249788, 1, 1, 1, 1, 1,
0.298508, -1.036875, 2.206125, 1, 1, 1, 1, 1,
0.3005165, -0.4449402, 2.393057, 1, 1, 1, 1, 1,
0.3015175, -2.321104, 3.065812, 1, 1, 1, 1, 1,
0.3034384, -0.3434064, 4.063275, 1, 1, 1, 1, 1,
0.3084278, -1.613604, 3.830375, 1, 1, 1, 1, 1,
0.3220261, -0.2201778, 1.975439, 1, 1, 1, 1, 1,
0.3226783, 0.8248898, 0.2184628, 1, 1, 1, 1, 1,
0.3248428, -0.9488887, 3.326511, 1, 1, 1, 1, 1,
0.3257741, 0.9658264, 0.5191491, 1, 1, 1, 1, 1,
0.3288489, -0.330752, 2.189604, 1, 1, 1, 1, 1,
0.3364445, 0.6685461, -0.2196936, 1, 1, 1, 1, 1,
0.3394984, -1.312488, 3.497636, 0, 0, 1, 1, 1,
0.3403277, 0.00377912, 1.040106, 1, 0, 0, 1, 1,
0.3404813, -0.8325831, 2.214778, 1, 0, 0, 1, 1,
0.3405235, 0.5747776, -0.8648873, 1, 0, 0, 1, 1,
0.3408879, 0.8996311, -0.6933938, 1, 0, 0, 1, 1,
0.3465337, 0.7808875, 1.409649, 1, 0, 0, 1, 1,
0.3484281, 0.09583526, 0.7198922, 0, 0, 0, 1, 1,
0.3498733, -1.523785, 3.326722, 0, 0, 0, 1, 1,
0.3505174, 1.181838, -1.48499, 0, 0, 0, 1, 1,
0.3511607, 1.231353, 1.081756, 0, 0, 0, 1, 1,
0.3515824, -1.165566, 0.9468548, 0, 0, 0, 1, 1,
0.3551522, 0.2166741, 0.4257643, 0, 0, 0, 1, 1,
0.356881, 0.2345616, 0.09298549, 0, 0, 0, 1, 1,
0.3579401, 1.395717, 0.9356091, 1, 1, 1, 1, 1,
0.3640177, -0.8722591, 4.778881, 1, 1, 1, 1, 1,
0.365685, 0.2720995, 1.009079, 1, 1, 1, 1, 1,
0.3668894, -1.2244, 2.816208, 1, 1, 1, 1, 1,
0.3704234, -1.421102, 3.18033, 1, 1, 1, 1, 1,
0.372118, 2.356836, -0.2476997, 1, 1, 1, 1, 1,
0.3799878, -1.418571, 3.739329, 1, 1, 1, 1, 1,
0.3824232, 1.451444, 1.94946, 1, 1, 1, 1, 1,
0.383669, -1.336773, 1.073954, 1, 1, 1, 1, 1,
0.3857172, -0.7264549, 2.760523, 1, 1, 1, 1, 1,
0.3863372, 0.8157879, 1.587409, 1, 1, 1, 1, 1,
0.3898729, 0.8457795, -0.169305, 1, 1, 1, 1, 1,
0.3902023, -1.167477, 4.42474, 1, 1, 1, 1, 1,
0.3940725, -0.986749, 2.41622, 1, 1, 1, 1, 1,
0.3968103, 1.178381, 0.03419292, 1, 1, 1, 1, 1,
0.3971449, -0.6722013, 3.146758, 0, 0, 1, 1, 1,
0.4025185, -0.9497954, 1.43855, 1, 0, 0, 1, 1,
0.4078463, 2.109088, -3.261499, 1, 0, 0, 1, 1,
0.4089054, 0.8638643, 1.198822, 1, 0, 0, 1, 1,
0.4131435, -0.3007746, 2.147204, 1, 0, 0, 1, 1,
0.4133758, -0.3701512, 2.378443, 1, 0, 0, 1, 1,
0.4157338, -0.8033717, 4.030022, 0, 0, 0, 1, 1,
0.4179309, -0.7011363, 2.043129, 0, 0, 0, 1, 1,
0.4197219, 1.221626, -0.8364604, 0, 0, 0, 1, 1,
0.4209361, 0.819715, 1.121663, 0, 0, 0, 1, 1,
0.4213217, 0.03996817, 1.01419, 0, 0, 0, 1, 1,
0.4289227, 2.272766, 0.4982597, 0, 0, 0, 1, 1,
0.4325309, -1.334455, 3.904245, 0, 0, 0, 1, 1,
0.4332686, 0.1077355, 0.4376613, 1, 1, 1, 1, 1,
0.435726, -1.481434, 3.950694, 1, 1, 1, 1, 1,
0.4424744, 0.00965418, 0.182348, 1, 1, 1, 1, 1,
0.445154, 1.226792, 0.003013721, 1, 1, 1, 1, 1,
0.4466424, -0.06804159, 1.679349, 1, 1, 1, 1, 1,
0.4475085, 0.5301606, 1.070193, 1, 1, 1, 1, 1,
0.4479209, -2.473924, 2.117823, 1, 1, 1, 1, 1,
0.4523469, -0.6099693, 2.558923, 1, 1, 1, 1, 1,
0.4531053, -2.597276, 3.072693, 1, 1, 1, 1, 1,
0.4531544, -0.2144661, 2.584841, 1, 1, 1, 1, 1,
0.4594713, 0.2265573, 1.33661, 1, 1, 1, 1, 1,
0.4606051, 0.231538, -1.316722, 1, 1, 1, 1, 1,
0.461665, 0.3996548, 0.4070077, 1, 1, 1, 1, 1,
0.4632605, -1.854921, 2.935962, 1, 1, 1, 1, 1,
0.4644532, 0.7238784, 0.8127342, 1, 1, 1, 1, 1,
0.472405, -1.497859, 1.27897, 0, 0, 1, 1, 1,
0.4732611, -0.5434622, 2.431773, 1, 0, 0, 1, 1,
0.4773232, -0.455283, 3.189043, 1, 0, 0, 1, 1,
0.4782112, 0.2505847, -0.9180841, 1, 0, 0, 1, 1,
0.4811334, 2.444669, 0.3716159, 1, 0, 0, 1, 1,
0.4861329, -1.658374, 1.596076, 1, 0, 0, 1, 1,
0.48765, -0.8181829, 2.79566, 0, 0, 0, 1, 1,
0.4888046, 0.1331526, 1.172157, 0, 0, 0, 1, 1,
0.4909386, 0.3160639, 0.6615038, 0, 0, 0, 1, 1,
0.4941158, 1.281742, 0.3518834, 0, 0, 0, 1, 1,
0.4953479, -1.81141, 2.831676, 0, 0, 0, 1, 1,
0.498679, 1.347981, 0.3022702, 0, 0, 0, 1, 1,
0.5021535, 0.472109, -1.842321, 0, 0, 0, 1, 1,
0.5026641, -1.952566, 1.824481, 1, 1, 1, 1, 1,
0.5029918, 0.2101298, 1.81364, 1, 1, 1, 1, 1,
0.50321, -1.056586, 2.849178, 1, 1, 1, 1, 1,
0.5036131, -1.079696, 1.950234, 1, 1, 1, 1, 1,
0.5043483, -0.5772974, 1.670543, 1, 1, 1, 1, 1,
0.5063487, 0.5246236, 1.084517, 1, 1, 1, 1, 1,
0.5077922, 1.01981, -0.7462526, 1, 1, 1, 1, 1,
0.5083323, -0.9624932, 5.057042, 1, 1, 1, 1, 1,
0.5093995, 0.3140467, -0.09580702, 1, 1, 1, 1, 1,
0.5156754, -1.043197, 0.8465345, 1, 1, 1, 1, 1,
0.5171551, -1.699237, 3.152169, 1, 1, 1, 1, 1,
0.5212848, 0.04248783, 1.885031, 1, 1, 1, 1, 1,
0.5256588, -0.8241071, 3.643093, 1, 1, 1, 1, 1,
0.5291116, -0.7862158, 2.505391, 1, 1, 1, 1, 1,
0.5396978, 0.8754596, 2.225319, 1, 1, 1, 1, 1,
0.5406583, -1.021974, 1.845054, 0, 0, 1, 1, 1,
0.5450508, -2.101015, 3.409397, 1, 0, 0, 1, 1,
0.5452175, 0.8468946, 0.6455784, 1, 0, 0, 1, 1,
0.5480211, -0.04964304, 1.383162, 1, 0, 0, 1, 1,
0.550602, -0.3783322, 2.626447, 1, 0, 0, 1, 1,
0.5579209, 0.1436965, 2.341004, 1, 0, 0, 1, 1,
0.5610307, -1.046056, 2.041577, 0, 0, 0, 1, 1,
0.562792, 0.3687254, 0.3067514, 0, 0, 0, 1, 1,
0.5691343, -0.4888809, 1.003642, 0, 0, 0, 1, 1,
0.5716458, -1.152996, 4.304621, 0, 0, 0, 1, 1,
0.575947, -0.6511059, 2.469252, 0, 0, 0, 1, 1,
0.57974, 0.1497469, 1.977524, 0, 0, 0, 1, 1,
0.5824286, 1.205479, 0.3267022, 0, 0, 0, 1, 1,
0.5898075, -2.17146, 5.252561, 1, 1, 1, 1, 1,
0.5943437, 0.1133944, 0.2308093, 1, 1, 1, 1, 1,
0.5945112, 1.322044, 1.711752, 1, 1, 1, 1, 1,
0.604117, -1.251754, 4.615656, 1, 1, 1, 1, 1,
0.607464, 1.031065, 0.3875716, 1, 1, 1, 1, 1,
0.6076617, 0.3631244, -0.241629, 1, 1, 1, 1, 1,
0.6113529, 0.4062622, 0.6240456, 1, 1, 1, 1, 1,
0.6127695, -1.257568, 3.42465, 1, 1, 1, 1, 1,
0.615033, -1.441009, 2.808716, 1, 1, 1, 1, 1,
0.6163173, 1.007574, -0.08855783, 1, 1, 1, 1, 1,
0.6215896, 0.3743615, 0.6839879, 1, 1, 1, 1, 1,
0.623197, 0.2400003, 2.043246, 1, 1, 1, 1, 1,
0.6288399, -0.2095364, 1.795334, 1, 1, 1, 1, 1,
0.6328423, 0.6207674, -0.3532867, 1, 1, 1, 1, 1,
0.6412271, -0.3789797, 0.9471424, 1, 1, 1, 1, 1,
0.6421391, -0.6130624, 2.116428, 0, 0, 1, 1, 1,
0.6453381, 0.8052518, -1.02544, 1, 0, 0, 1, 1,
0.6459104, 0.7676265, 1.880966, 1, 0, 0, 1, 1,
0.6484155, 0.8562044, 1.453681, 1, 0, 0, 1, 1,
0.6499596, 1.420353, -0.2328154, 1, 0, 0, 1, 1,
0.6513331, 0.7099575, 1.408996, 1, 0, 0, 1, 1,
0.6556525, 1.310287, -1.349632, 0, 0, 0, 1, 1,
0.6562814, -0.8815187, 4.39233, 0, 0, 0, 1, 1,
0.6604157, 0.5050884, 2.777611, 0, 0, 0, 1, 1,
0.6630713, -0.7138031, 1.82271, 0, 0, 0, 1, 1,
0.6635692, 1.193804, 1.613834, 0, 0, 0, 1, 1,
0.6648327, 0.9308349, -0.9337656, 0, 0, 0, 1, 1,
0.6722053, 0.4127363, 0.6964437, 0, 0, 0, 1, 1,
0.6795517, 1.155246, -0.7467577, 1, 1, 1, 1, 1,
0.6896363, 0.4569941, 0.0155096, 1, 1, 1, 1, 1,
0.6904455, 1.620457, 0.3212194, 1, 1, 1, 1, 1,
0.6908252, -0.2776682, 2.822543, 1, 1, 1, 1, 1,
0.6937473, -1.237476, 1.725601, 1, 1, 1, 1, 1,
0.694901, -0.6070498, 1.366607, 1, 1, 1, 1, 1,
0.6954349, -0.7887289, 2.36306, 1, 1, 1, 1, 1,
0.6978165, 0.6644869, 0.5604608, 1, 1, 1, 1, 1,
0.699017, 1.073277, 2.592417, 1, 1, 1, 1, 1,
0.7012622, 1.413039, 0.3127615, 1, 1, 1, 1, 1,
0.7066984, 0.975028, 1.341508, 1, 1, 1, 1, 1,
0.7093962, 0.2519318, 0.9712781, 1, 1, 1, 1, 1,
0.7138122, 0.5410723, 1.389504, 1, 1, 1, 1, 1,
0.7209978, -2.112718, -0.3676815, 1, 1, 1, 1, 1,
0.7257783, 1.546462, 1.045367, 1, 1, 1, 1, 1,
0.7369486, -0.5324993, 1.401049, 0, 0, 1, 1, 1,
0.7401351, 1.399349, 2.011454, 1, 0, 0, 1, 1,
0.7436895, -0.1095473, 0.05624917, 1, 0, 0, 1, 1,
0.7451382, 0.2287217, 0.8118896, 1, 0, 0, 1, 1,
0.7463402, -1.154101, 2.868894, 1, 0, 0, 1, 1,
0.7505128, 0.3702923, 1.523557, 1, 0, 0, 1, 1,
0.751103, 1.489645, -0.3138913, 0, 0, 0, 1, 1,
0.7527383, -0.3487619, 1.4204, 0, 0, 0, 1, 1,
0.7554212, -0.8594325, 4.836084, 0, 0, 0, 1, 1,
0.7558724, -0.05858288, 1.384404, 0, 0, 0, 1, 1,
0.7574452, 1.107789, 0.7615013, 0, 0, 0, 1, 1,
0.7623563, 0.5074943, 0.9241096, 0, 0, 0, 1, 1,
0.762622, 0.3918337, 1.454415, 0, 0, 0, 1, 1,
0.7653185, 0.6301442, 0.03228986, 1, 1, 1, 1, 1,
0.7689756, 0.8179158, 0.5080834, 1, 1, 1, 1, 1,
0.7763013, 0.4845445, -0.1833187, 1, 1, 1, 1, 1,
0.7777711, 0.2489018, 2.821936, 1, 1, 1, 1, 1,
0.7889948, -0.5379475, 2.199191, 1, 1, 1, 1, 1,
0.795334, -0.1411373, -0.6285915, 1, 1, 1, 1, 1,
0.7976839, -1.260356, 1.203256, 1, 1, 1, 1, 1,
0.8023112, 0.02593993, 1.076438, 1, 1, 1, 1, 1,
0.8045371, 1.458505, 0.7980378, 1, 1, 1, 1, 1,
0.806577, 1.682197, 0.03735716, 1, 1, 1, 1, 1,
0.8140897, -1.351951, 1.484329, 1, 1, 1, 1, 1,
0.8145086, 0.4413236, 1.141378, 1, 1, 1, 1, 1,
0.8174187, 0.8748814, 1.9903, 1, 1, 1, 1, 1,
0.8179243, -0.7190873, 1.750274, 1, 1, 1, 1, 1,
0.8198599, 0.1198072, -0.1803581, 1, 1, 1, 1, 1,
0.8305732, 0.2889288, 0.5546762, 0, 0, 1, 1, 1,
0.8336057, -0.5021281, 1.381776, 1, 0, 0, 1, 1,
0.8358459, 0.5423599, 2.154209, 1, 0, 0, 1, 1,
0.8358989, 0.1108595, 0.695329, 1, 0, 0, 1, 1,
0.8443874, 0.95574, 1.21476, 1, 0, 0, 1, 1,
0.8492179, -0.1526242, 1.179753, 1, 0, 0, 1, 1,
0.8508993, -0.5694098, 1.08382, 0, 0, 0, 1, 1,
0.8510713, -1.152665, 3.251935, 0, 0, 0, 1, 1,
0.8556687, -0.7668616, 3.287805, 0, 0, 0, 1, 1,
0.8572696, -1.986093, 3.280428, 0, 0, 0, 1, 1,
0.8576423, -0.8451635, 1.313272, 0, 0, 0, 1, 1,
0.8586742, -1.986502, 2.681827, 0, 0, 0, 1, 1,
0.8594811, -0.3545022, 1.983105, 0, 0, 0, 1, 1,
0.8628472, 1.350035, 0.9549168, 1, 1, 1, 1, 1,
0.863189, -0.1051959, 1.900995, 1, 1, 1, 1, 1,
0.8635296, 1.677536, 0.5570914, 1, 1, 1, 1, 1,
0.8757301, 0.4307053, -1.281164, 1, 1, 1, 1, 1,
0.8763846, -0.6045085, 3.142442, 1, 1, 1, 1, 1,
0.8782493, 0.7864829, 1.686547, 1, 1, 1, 1, 1,
0.8845459, 0.8089772, -0.03767786, 1, 1, 1, 1, 1,
0.8918862, -0.3595999, 0.8690502, 1, 1, 1, 1, 1,
0.8979802, -0.4769641, 1.830842, 1, 1, 1, 1, 1,
0.906417, 1.730998, 0.5082935, 1, 1, 1, 1, 1,
0.9072562, 0.7306552, 1.583731, 1, 1, 1, 1, 1,
0.9087389, 2.292335, 1.098463, 1, 1, 1, 1, 1,
0.9226644, 0.0903886, 2.132281, 1, 1, 1, 1, 1,
0.9252083, -1.372801, 1.502526, 1, 1, 1, 1, 1,
0.9265904, 0.8517353, 0.4719138, 1, 1, 1, 1, 1,
0.9276787, -1.120798, 3.019576, 0, 0, 1, 1, 1,
0.9318115, -1.155398, 2.425864, 1, 0, 0, 1, 1,
0.9401982, 2.272862, -0.08097805, 1, 0, 0, 1, 1,
0.9429554, -0.1921747, 2.996293, 1, 0, 0, 1, 1,
0.9457926, -0.4917957, 1.734954, 1, 0, 0, 1, 1,
0.9476792, -0.5224082, 2.226202, 1, 0, 0, 1, 1,
0.9483936, 1.553778, 1.320616, 0, 0, 0, 1, 1,
0.9603161, -0.07394955, 2.012019, 0, 0, 0, 1, 1,
0.9617246, 0.6446902, 0.00338332, 0, 0, 0, 1, 1,
0.9637372, 2.459561, 0.4963904, 0, 0, 0, 1, 1,
0.970531, 0.4478002, 1.613537, 0, 0, 0, 1, 1,
0.9709252, -0.3046066, 1.696505, 0, 0, 0, 1, 1,
0.9761682, -0.03093122, 1.727498, 0, 0, 0, 1, 1,
0.9787553, -0.1166331, 2.734556, 1, 1, 1, 1, 1,
0.9787936, -0.6407326, 4.124149, 1, 1, 1, 1, 1,
0.9850821, -1.559333, 2.985622, 1, 1, 1, 1, 1,
0.9858201, 0.1261102, 1.986078, 1, 1, 1, 1, 1,
0.9877963, -0.3923829, 3.284652, 1, 1, 1, 1, 1,
0.9911309, -0.1074147, 1.419326, 1, 1, 1, 1, 1,
0.9974949, 0.508774, 0.5582151, 1, 1, 1, 1, 1,
1.018358, 1.976198, 2.3005, 1, 1, 1, 1, 1,
1.020471, 0.5975478, 1.713042, 1, 1, 1, 1, 1,
1.025036, -0.1981788, 2.348451, 1, 1, 1, 1, 1,
1.025279, 0.9861045, 2.731049, 1, 1, 1, 1, 1,
1.031316, 0.4375975, 0.2298732, 1, 1, 1, 1, 1,
1.032608, 0.8762706, 2.324068, 1, 1, 1, 1, 1,
1.036452, -0.3536219, 1.857099, 1, 1, 1, 1, 1,
1.042667, 0.4048782, 2.627752, 1, 1, 1, 1, 1,
1.059056, 0.2898264, 0.09161283, 0, 0, 1, 1, 1,
1.067499, -0.8813059, 1.831385, 1, 0, 0, 1, 1,
1.073625, 2.461325, 0.112836, 1, 0, 0, 1, 1,
1.078404, -0.3951377, 2.167819, 1, 0, 0, 1, 1,
1.081604, 0.3403336, 2.091448, 1, 0, 0, 1, 1,
1.089052, -0.9647536, 3.360772, 1, 0, 0, 1, 1,
1.101542, -0.4172336, 2.316523, 0, 0, 0, 1, 1,
1.103903, 1.234036, -1.412698, 0, 0, 0, 1, 1,
1.105725, 0.6228182, -1.692766, 0, 0, 0, 1, 1,
1.108534, -0.4546732, 1.064791, 0, 0, 0, 1, 1,
1.112545, 2.78452, 0.2174233, 0, 0, 0, 1, 1,
1.121201, 0.04346312, 0.2681738, 0, 0, 0, 1, 1,
1.128275, 0.6629733, 0.911257, 0, 0, 0, 1, 1,
1.137654, -1.326053, 2.208629, 1, 1, 1, 1, 1,
1.138804, -1.210082, 3.994976, 1, 1, 1, 1, 1,
1.139804, 0.4372517, -0.1535643, 1, 1, 1, 1, 1,
1.141197, 0.5932845, 3.008928, 1, 1, 1, 1, 1,
1.143515, 0.6018204, 2.657591, 1, 1, 1, 1, 1,
1.144608, 0.3996807, 1.505873, 1, 1, 1, 1, 1,
1.145118, -0.5620072, 1.599415, 1, 1, 1, 1, 1,
1.146767, -0.6826978, 2.30219, 1, 1, 1, 1, 1,
1.151608, 0.2878892, 3.24234, 1, 1, 1, 1, 1,
1.154933, -0.7832987, 2.268363, 1, 1, 1, 1, 1,
1.15694, 0.294327, 1.030273, 1, 1, 1, 1, 1,
1.15907, -1.042187, 1.377686, 1, 1, 1, 1, 1,
1.160043, -1.592813, 3.011631, 1, 1, 1, 1, 1,
1.17025, 0.3273621, 1.535399, 1, 1, 1, 1, 1,
1.171598, -0.4841857, 1.678187, 1, 1, 1, 1, 1,
1.172888, -0.95534, 2.612535, 0, 0, 1, 1, 1,
1.178685, 0.5253346, 0.837299, 1, 0, 0, 1, 1,
1.197318, -0.1381508, 1.427879, 1, 0, 0, 1, 1,
1.201666, 0.4784478, 0.7731577, 1, 0, 0, 1, 1,
1.204351, -0.4985062, 2.009598, 1, 0, 0, 1, 1,
1.205105, -2.553526, 4.094114, 1, 0, 0, 1, 1,
1.206036, -0.8895505, 3.887086, 0, 0, 0, 1, 1,
1.207848, -1.236783, 3.791369, 0, 0, 0, 1, 1,
1.20829, -0.05240573, 1.857448, 0, 0, 0, 1, 1,
1.222266, -0.2128985, 0.7913661, 0, 0, 0, 1, 1,
1.2245, -1.385317, 3.316634, 0, 0, 0, 1, 1,
1.224667, -0.7990448, 0.2341341, 0, 0, 0, 1, 1,
1.227525, -0.3469182, 2.881279, 0, 0, 0, 1, 1,
1.229384, 0.0817982, 1.760532, 1, 1, 1, 1, 1,
1.229974, -0.3115114, 2.455124, 1, 1, 1, 1, 1,
1.238024, 2.635509, -0.3602005, 1, 1, 1, 1, 1,
1.243798, 0.01085115, 2.532128, 1, 1, 1, 1, 1,
1.246453, -0.4510505, 2.556493, 1, 1, 1, 1, 1,
1.256886, 0.4043599, 1.756297, 1, 1, 1, 1, 1,
1.2605, -1.861293, 3.006151, 1, 1, 1, 1, 1,
1.261066, -0.1699772, 1.866244, 1, 1, 1, 1, 1,
1.272431, -0.1208785, 0.04513922, 1, 1, 1, 1, 1,
1.290411, -0.9031143, 2.380502, 1, 1, 1, 1, 1,
1.290986, 0.6704198, 1.368665, 1, 1, 1, 1, 1,
1.294241, 0.6629672, 0.9111038, 1, 1, 1, 1, 1,
1.303284, 0.2708454, 0.08261494, 1, 1, 1, 1, 1,
1.304728, 0.8536179, 1.558815, 1, 1, 1, 1, 1,
1.306821, -0.6438633, 3.369427, 1, 1, 1, 1, 1,
1.308706, -1.180919, 2.345109, 0, 0, 1, 1, 1,
1.309567, 1.504237, 0.612555, 1, 0, 0, 1, 1,
1.322648, -0.1011279, 2.928065, 1, 0, 0, 1, 1,
1.327976, -1.007806, 2.79902, 1, 0, 0, 1, 1,
1.33331, 1.175708, 0.4826514, 1, 0, 0, 1, 1,
1.339639, 0.2014761, 2.319585, 1, 0, 0, 1, 1,
1.348338, -0.8259809, 2.266007, 0, 0, 0, 1, 1,
1.358973, -1.036678, 3.213025, 0, 0, 0, 1, 1,
1.359222, 1.968554, 0.03661364, 0, 0, 0, 1, 1,
1.363651, 0.2185632, 2.206077, 0, 0, 0, 1, 1,
1.365315, -0.8034674, 2.371575, 0, 0, 0, 1, 1,
1.365503, 0.4897828, 4.165247, 0, 0, 0, 1, 1,
1.370596, -0.849334, 1.78313, 0, 0, 0, 1, 1,
1.376897, 0.2997913, 2.545933, 1, 1, 1, 1, 1,
1.379903, 0.6404364, 1.088064, 1, 1, 1, 1, 1,
1.382855, -0.7948213, 2.570336, 1, 1, 1, 1, 1,
1.390488, 1.557582, 1.135413, 1, 1, 1, 1, 1,
1.393934, 0.7732332, 0.3990311, 1, 1, 1, 1, 1,
1.400413, 0.3995444, 0.1519924, 1, 1, 1, 1, 1,
1.403197, 0.4860867, 0.477034, 1, 1, 1, 1, 1,
1.403238, -1.966266, 1.864731, 1, 1, 1, 1, 1,
1.407504, -0.7632195, 3.106852, 1, 1, 1, 1, 1,
1.410687, 0.632047, 3.689152, 1, 1, 1, 1, 1,
1.414011, -0.7592133, 2.370123, 1, 1, 1, 1, 1,
1.43638, -1.076397, 3.530018, 1, 1, 1, 1, 1,
1.436524, -0.6425217, 2.986471, 1, 1, 1, 1, 1,
1.440409, 0.7547246, 0.05718509, 1, 1, 1, 1, 1,
1.444741, 0.7415617, 0.3884655, 1, 1, 1, 1, 1,
1.451458, 2.297922, 1.779647, 0, 0, 1, 1, 1,
1.452264, -1.23981, 2.451128, 1, 0, 0, 1, 1,
1.471267, -0.521421, 3.91026, 1, 0, 0, 1, 1,
1.477601, 0.8334373, 1.517654, 1, 0, 0, 1, 1,
1.494695, 1.607909, 1.190744, 1, 0, 0, 1, 1,
1.499834, -0.3211481, 3.804397, 1, 0, 0, 1, 1,
1.520058, -1.632499, 1.233963, 0, 0, 0, 1, 1,
1.526759, 0.8679628, 1.868228, 0, 0, 0, 1, 1,
1.530327, -3.450601, 2.7042, 0, 0, 0, 1, 1,
1.564898, 0.3281034, 0.8060775, 0, 0, 0, 1, 1,
1.567447, 0.6277194, -0.2635996, 0, 0, 0, 1, 1,
1.576426, -0.2002475, 2.809707, 0, 0, 0, 1, 1,
1.578509, -0.4420216, 2.075356, 0, 0, 0, 1, 1,
1.594954, 0.8128627, 1.205917, 1, 1, 1, 1, 1,
1.6044, -0.2091687, 1.812725, 1, 1, 1, 1, 1,
1.604554, -0.04542299, 1.485181, 1, 1, 1, 1, 1,
1.609921, 0.1076637, 1.366051, 1, 1, 1, 1, 1,
1.619596, -0.3301632, 0.9378208, 1, 1, 1, 1, 1,
1.630626, -1.310755, 1.857024, 1, 1, 1, 1, 1,
1.633656, -0.5048677, 3.698236, 1, 1, 1, 1, 1,
1.641357, -0.5583844, 3.245368, 1, 1, 1, 1, 1,
1.649964, 0.84522, 2.855972, 1, 1, 1, 1, 1,
1.66081, 0.3079167, 2.302669, 1, 1, 1, 1, 1,
1.682151, -0.6096575, 0.4892424, 1, 1, 1, 1, 1,
1.6835, 1.309846, 0.2854321, 1, 1, 1, 1, 1,
1.690471, -1.124187, 2.99435, 1, 1, 1, 1, 1,
1.695767, 0.3131007, 0.7183681, 1, 1, 1, 1, 1,
1.696688, -0.7685277, 1.258871, 1, 1, 1, 1, 1,
1.712555, 0.3584553, 1.703361, 0, 0, 1, 1, 1,
1.716177, -0.3559943, 1.488453, 1, 0, 0, 1, 1,
1.736961, -1.318576, 1.80292, 1, 0, 0, 1, 1,
1.747428, 0.1541098, 1.729884, 1, 0, 0, 1, 1,
1.75367, -0.04213493, 1.08861, 1, 0, 0, 1, 1,
1.766507, 1.486799, 0.7872537, 1, 0, 0, 1, 1,
1.769256, -0.2060551, 1.417104, 0, 0, 0, 1, 1,
1.771977, -0.9802347, 0.2122609, 0, 0, 0, 1, 1,
1.786395, -0.990878, 3.06711, 0, 0, 0, 1, 1,
1.787688, 0.1609708, 0.9410073, 0, 0, 0, 1, 1,
1.789752, 0.1140639, 1.39945, 0, 0, 0, 1, 1,
1.794452, 1.540624, 0.2906941, 0, 0, 0, 1, 1,
1.833295, -0.9682024, 1.714795, 0, 0, 0, 1, 1,
1.838464, -1.646223, 1.889139, 1, 1, 1, 1, 1,
1.851577, 1.450721, -0.359627, 1, 1, 1, 1, 1,
1.883923, 1.761945, -0.2406764, 1, 1, 1, 1, 1,
1.910077, -0.4421298, 1.788722, 1, 1, 1, 1, 1,
1.920439, 0.1346138, 1.414374, 1, 1, 1, 1, 1,
1.925982, -1.03171, 2.000204, 1, 1, 1, 1, 1,
1.937356, 0.9239362, 0.148799, 1, 1, 1, 1, 1,
1.941334, 1.11175, -0.38146, 1, 1, 1, 1, 1,
1.943553, -1.02, 2.725241, 1, 1, 1, 1, 1,
1.952996, 3.407117, 1.888064, 1, 1, 1, 1, 1,
1.962485, -1.941555, 1.341707, 1, 1, 1, 1, 1,
1.969942, -1.332694, 3.366745, 1, 1, 1, 1, 1,
1.983093, -0.668326, 1.830323, 1, 1, 1, 1, 1,
2.00404, -0.5954433, 2.790546, 1, 1, 1, 1, 1,
2.006332, -0.05413, 0.8167623, 1, 1, 1, 1, 1,
2.019329, 0.139964, 1.787819, 0, 0, 1, 1, 1,
2.060648, 0.7605255, 1.273565, 1, 0, 0, 1, 1,
2.107616, -1.01244, 2.724811, 1, 0, 0, 1, 1,
2.12872, 1.282543, 0.04007454, 1, 0, 0, 1, 1,
2.161412, 1.173657, 0.8127983, 1, 0, 0, 1, 1,
2.169895, 0.7296913, 1.517374, 1, 0, 0, 1, 1,
2.18403, -0.8112028, 1.108556, 0, 0, 0, 1, 1,
2.208296, -0.1110644, 2.811383, 0, 0, 0, 1, 1,
2.238147, 1.100753, 2.480381, 0, 0, 0, 1, 1,
2.285078, 0.8335897, 1.710756, 0, 0, 0, 1, 1,
2.302746, -0.04847785, 1.899918, 0, 0, 0, 1, 1,
2.310481, -0.3718235, 0.7405047, 0, 0, 0, 1, 1,
2.319973, 1.091888, 3.168493, 0, 0, 0, 1, 1,
2.340759, -0.08030902, 1.267099, 1, 1, 1, 1, 1,
2.447833, 0.1444149, -0.04076339, 1, 1, 1, 1, 1,
2.468708, 0.2147016, 1.622341, 1, 1, 1, 1, 1,
2.634171, -0.7191582, 2.687382, 1, 1, 1, 1, 1,
2.906132, 0.64753, -0.2720464, 1, 1, 1, 1, 1,
2.942806, -1.05537, 1.99432, 1, 1, 1, 1, 1,
3.365411, 0.3828195, 1.207168, 1, 1, 1, 1, 1
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
var radius = 9.493661;
var distance = 33.34608;
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
mvMatrix.translate( -0.1348388, 0.02174234, -0.1718752 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.34608);
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
