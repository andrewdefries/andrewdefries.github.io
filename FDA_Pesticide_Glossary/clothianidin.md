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
-2.772508, -1.355238, -0.866304, 1, 0, 0, 1,
-2.729077, 1.75829, -0.9975204, 1, 0.007843138, 0, 1,
-2.728161, -0.145871, -2.93157, 1, 0.01176471, 0, 1,
-2.691037, 0.6119332, -1.189325, 1, 0.01960784, 0, 1,
-2.624364, 0.7333269, -2.111794, 1, 0.02352941, 0, 1,
-2.592332, 1.879019, 0.6033123, 1, 0.03137255, 0, 1,
-2.563456, 1.211202, -1.580955, 1, 0.03529412, 0, 1,
-2.556882, 1.630857, -2.325837, 1, 0.04313726, 0, 1,
-2.356384, 1.66606, -0.9259856, 1, 0.04705882, 0, 1,
-2.355201, -1.39285, -1.748843, 1, 0.05490196, 0, 1,
-2.328478, 1.826428, -0.6461422, 1, 0.05882353, 0, 1,
-2.274782, -0.8186173, -2.712714, 1, 0.06666667, 0, 1,
-2.248714, 0.7057871, -0.7957785, 1, 0.07058824, 0, 1,
-2.223897, 0.5933996, -2.295242, 1, 0.07843138, 0, 1,
-2.223871, -0.4872989, -5.508445, 1, 0.08235294, 0, 1,
-2.151341, 0.5261617, -1.253486, 1, 0.09019608, 0, 1,
-2.124674, -1.628459, -2.371993, 1, 0.09411765, 0, 1,
-2.123398, 0.7726606, -2.076583, 1, 0.1019608, 0, 1,
-2.105323, -1.126617, -1.52778, 1, 0.1098039, 0, 1,
-2.100697, 0.6129874, 0.06020929, 1, 0.1137255, 0, 1,
-2.093193, -0.2462156, -2.190101, 1, 0.1215686, 0, 1,
-2.089372, -1.553195, -3.477338, 1, 0.1254902, 0, 1,
-2.069388, -0.4830872, -2.159647, 1, 0.1333333, 0, 1,
-2.062934, -1.244618, -3.469054, 1, 0.1372549, 0, 1,
-2.038499, 0.7869976, -0.4213281, 1, 0.145098, 0, 1,
-2.035488, 0.6011226, -2.272196, 1, 0.1490196, 0, 1,
-2.035141, -0.9257188, -1.928012, 1, 0.1568628, 0, 1,
-2.030322, -0.1487773, 0.672929, 1, 0.1607843, 0, 1,
-2.024614, 1.802155, -0.1953982, 1, 0.1686275, 0, 1,
-2.023661, 1.333873, -2.590219, 1, 0.172549, 0, 1,
-2.019359, 0.8334928, -1.554907, 1, 0.1803922, 0, 1,
-1.985462, -0.7394331, -3.036659, 1, 0.1843137, 0, 1,
-1.978748, -0.2642657, -1.554125, 1, 0.1921569, 0, 1,
-1.976643, 0.6801543, -0.4645753, 1, 0.1960784, 0, 1,
-1.971009, -0.6252985, -3.516389, 1, 0.2039216, 0, 1,
-1.951047, 0.02677581, -2.62397, 1, 0.2117647, 0, 1,
-1.912366, 0.5640934, -0.2055771, 1, 0.2156863, 0, 1,
-1.853228, 1.052189, -1.861606, 1, 0.2235294, 0, 1,
-1.806498, -0.8584717, -1.307421, 1, 0.227451, 0, 1,
-1.802309, -0.3385936, -2.333104, 1, 0.2352941, 0, 1,
-1.774707, -0.8869161, -3.268378, 1, 0.2392157, 0, 1,
-1.768918, 0.09336963, -2.627271, 1, 0.2470588, 0, 1,
-1.766251, 0.3448725, -1.56432, 1, 0.2509804, 0, 1,
-1.765212, 1.747707, -0.5175898, 1, 0.2588235, 0, 1,
-1.756527, 0.3069729, -1.074851, 1, 0.2627451, 0, 1,
-1.730618, 0.7611616, -1.408865, 1, 0.2705882, 0, 1,
-1.694611, 1.014103, 0.02484115, 1, 0.2745098, 0, 1,
-1.690644, 0.07213291, 0.2026877, 1, 0.282353, 0, 1,
-1.689313, -0.115201, -0.4592921, 1, 0.2862745, 0, 1,
-1.681675, -0.3744819, -2.512628, 1, 0.2941177, 0, 1,
-1.65441, -0.007941972, -1.666999, 1, 0.3019608, 0, 1,
-1.653272, 0.4969705, -1.747073, 1, 0.3058824, 0, 1,
-1.631789, 0.3472015, -1.078059, 1, 0.3137255, 0, 1,
-1.629106, 0.9996747, -0.856625, 1, 0.3176471, 0, 1,
-1.620646, -0.3465887, -1.658824, 1, 0.3254902, 0, 1,
-1.61886, 0.320226, -1.705814, 1, 0.3294118, 0, 1,
-1.614998, -0.6549904, -2.374122, 1, 0.3372549, 0, 1,
-1.607644, 1.285628, -1.686257, 1, 0.3411765, 0, 1,
-1.607459, 2.027785, -1.799575, 1, 0.3490196, 0, 1,
-1.604889, 0.8131963, -0.7427473, 1, 0.3529412, 0, 1,
-1.601693, 0.7473509, -0.8985631, 1, 0.3607843, 0, 1,
-1.599243, 0.2804128, 0.4068016, 1, 0.3647059, 0, 1,
-1.59837, -0.7992603, -2.014184, 1, 0.372549, 0, 1,
-1.583941, -0.6113878, -2.515738, 1, 0.3764706, 0, 1,
-1.575794, 2.462753, 0.2794264, 1, 0.3843137, 0, 1,
-1.56814, 0.5254281, -2.397702, 1, 0.3882353, 0, 1,
-1.557316, -1.019519, -1.630557, 1, 0.3960784, 0, 1,
-1.539199, -0.7159138, -2.686335, 1, 0.4039216, 0, 1,
-1.531124, 0.7327468, -0.6562651, 1, 0.4078431, 0, 1,
-1.52498, 0.2955312, -2.564577, 1, 0.4156863, 0, 1,
-1.51573, -0.125864, -0.390425, 1, 0.4196078, 0, 1,
-1.513696, -0.4265066, -1.49477, 1, 0.427451, 0, 1,
-1.509912, -1.029226, -1.07593, 1, 0.4313726, 0, 1,
-1.500318, -0.2973399, -2.16448, 1, 0.4392157, 0, 1,
-1.50027, -0.6448264, -1.692253, 1, 0.4431373, 0, 1,
-1.497308, 1.239935, -0.05717038, 1, 0.4509804, 0, 1,
-1.492527, -0.2014482, -1.617278, 1, 0.454902, 0, 1,
-1.490331, -2.100783, -2.10357, 1, 0.4627451, 0, 1,
-1.483025, 1.527179, 0.02202633, 1, 0.4666667, 0, 1,
-1.476951, 0.7643544, -0.4989055, 1, 0.4745098, 0, 1,
-1.469973, 0.5319389, -1.403968, 1, 0.4784314, 0, 1,
-1.465932, -1.497565, -4.18588, 1, 0.4862745, 0, 1,
-1.46152, 1.305032, -1.487707, 1, 0.4901961, 0, 1,
-1.45562, -1.12209, -3.176652, 1, 0.4980392, 0, 1,
-1.454732, 1.089798, -0.2316699, 1, 0.5058824, 0, 1,
-1.45042, 1.063366, -0.7213806, 1, 0.509804, 0, 1,
-1.433337, 1.29318, -1.144497, 1, 0.5176471, 0, 1,
-1.405115, 2.789756, -1.598741, 1, 0.5215687, 0, 1,
-1.396214, -0.4389925, -0.3441983, 1, 0.5294118, 0, 1,
-1.395166, -1.569807, -2.257538, 1, 0.5333334, 0, 1,
-1.386823, -0.20782, -1.45743, 1, 0.5411765, 0, 1,
-1.379327, 0.9153718, -0.2050489, 1, 0.5450981, 0, 1,
-1.379022, -0.5578973, -0.8215097, 1, 0.5529412, 0, 1,
-1.37113, -0.9253513, -2.693982, 1, 0.5568628, 0, 1,
-1.359743, 2.185308, 1.030511, 1, 0.5647059, 0, 1,
-1.356383, -0.2542318, -1.730471, 1, 0.5686275, 0, 1,
-1.355306, -1.073769, -3.246462, 1, 0.5764706, 0, 1,
-1.335717, -1.211768, -4.853841, 1, 0.5803922, 0, 1,
-1.328488, -0.5496251, -4.16255, 1, 0.5882353, 0, 1,
-1.328091, 0.9122411, -1.616912, 1, 0.5921569, 0, 1,
-1.321861, -0.497267, -1.240025, 1, 0.6, 0, 1,
-1.319482, 0.9330332, -0.01071719, 1, 0.6078432, 0, 1,
-1.319329, 0.1205445, -0.7783248, 1, 0.6117647, 0, 1,
-1.308757, 0.5509713, -2.026873, 1, 0.6196079, 0, 1,
-1.298113, 0.3525827, -0.1358841, 1, 0.6235294, 0, 1,
-1.289549, 0.04152531, -2.368908, 1, 0.6313726, 0, 1,
-1.289161, 1.564778, -1.139446, 1, 0.6352941, 0, 1,
-1.282057, -0.1351456, -0.3792447, 1, 0.6431373, 0, 1,
-1.275381, -0.933713, -2.782172, 1, 0.6470588, 0, 1,
-1.275334, 0.9128898, -0.6380249, 1, 0.654902, 0, 1,
-1.266875, -0.01973717, -0.4883761, 1, 0.6588235, 0, 1,
-1.265366, -0.2478956, -1.973176, 1, 0.6666667, 0, 1,
-1.245254, -0.8152463, -2.106422, 1, 0.6705883, 0, 1,
-1.245133, 1.839544, -0.02285029, 1, 0.6784314, 0, 1,
-1.237267, -0.1287247, -1.968027, 1, 0.682353, 0, 1,
-1.230216, 0.2844605, -2.726589, 1, 0.6901961, 0, 1,
-1.228534, 0.5776378, -1.062396, 1, 0.6941177, 0, 1,
-1.228352, 0.00122618, -0.1386005, 1, 0.7019608, 0, 1,
-1.22296, -0.6716129, 0.2005931, 1, 0.7098039, 0, 1,
-1.222393, 2.057525, -1.52872, 1, 0.7137255, 0, 1,
-1.212923, -0.4662999, -2.339701, 1, 0.7215686, 0, 1,
-1.209174, -1.503085, -2.426007, 1, 0.7254902, 0, 1,
-1.202589, 0.4086044, -1.689862, 1, 0.7333333, 0, 1,
-1.192782, 0.6024274, -2.019007, 1, 0.7372549, 0, 1,
-1.188618, -1.125686, -2.876125, 1, 0.7450981, 0, 1,
-1.180993, -1.201452, -2.262496, 1, 0.7490196, 0, 1,
-1.17951, 0.9397941, -0.9555851, 1, 0.7568628, 0, 1,
-1.177705, -0.4089246, -2.240585, 1, 0.7607843, 0, 1,
-1.172034, -1.014817, -4.04454, 1, 0.7686275, 0, 1,
-1.161801, 3.074611, -1.777204, 1, 0.772549, 0, 1,
-1.156836, -0.7571718, -2.992086, 1, 0.7803922, 0, 1,
-1.152155, -1.048116, -2.405891, 1, 0.7843137, 0, 1,
-1.149148, 0.1821503, -1.851758, 1, 0.7921569, 0, 1,
-1.148899, -0.3898085, -1.567952, 1, 0.7960784, 0, 1,
-1.141318, 0.4040459, -3.06161, 1, 0.8039216, 0, 1,
-1.140798, 0.7233493, -0.430511, 1, 0.8117647, 0, 1,
-1.139016, 0.3885733, -0.3595201, 1, 0.8156863, 0, 1,
-1.137704, -0.03609594, 1.216652, 1, 0.8235294, 0, 1,
-1.129586, -2.384583, -3.246733, 1, 0.827451, 0, 1,
-1.12127, -0.5162787, -2.290156, 1, 0.8352941, 0, 1,
-1.121195, 0.4120898, -0.3976867, 1, 0.8392157, 0, 1,
-1.116726, -0.5078961, -1.526212, 1, 0.8470588, 0, 1,
-1.110996, 1.585033, -0.7813711, 1, 0.8509804, 0, 1,
-1.109403, -1.178956, -4.218427, 1, 0.8588235, 0, 1,
-1.10765, -0.9814495, -2.864027, 1, 0.8627451, 0, 1,
-1.091874, -0.1829735, -0.5923195, 1, 0.8705882, 0, 1,
-1.091624, 0.4554547, -1.635721, 1, 0.8745098, 0, 1,
-1.090834, 0.06176347, -2.331644, 1, 0.8823529, 0, 1,
-1.086524, 0.1820717, 0.183595, 1, 0.8862745, 0, 1,
-1.08576, -1.013335, -0.6440948, 1, 0.8941177, 0, 1,
-1.081377, 0.1470466, -3.062118, 1, 0.8980392, 0, 1,
-1.071871, -0.9105929, -2.81228, 1, 0.9058824, 0, 1,
-1.064714, 0.01083454, -1.501951, 1, 0.9137255, 0, 1,
-1.064302, 0.1141709, -1.483652, 1, 0.9176471, 0, 1,
-1.060036, 0.3279823, -1.364358, 1, 0.9254902, 0, 1,
-1.052349, -1.774408, -2.213727, 1, 0.9294118, 0, 1,
-1.050394, -1.09291, -2.792305, 1, 0.9372549, 0, 1,
-1.04917, 0.07659607, 0.2782707, 1, 0.9411765, 0, 1,
-1.038739, 0.538977, -0.5244963, 1, 0.9490196, 0, 1,
-1.031014, -0.8025163, -0.421192, 1, 0.9529412, 0, 1,
-1.017202, -0.8461927, -4.307433, 1, 0.9607843, 0, 1,
-1.01511, -0.4132996, -1.871541, 1, 0.9647059, 0, 1,
-1.003343, 0.3211352, -2.094018, 1, 0.972549, 0, 1,
-0.998451, 1.495686, -0.6282208, 1, 0.9764706, 0, 1,
-0.9955628, 1.12364, -1.825895, 1, 0.9843137, 0, 1,
-0.9888343, 0.546779, -1.792904, 1, 0.9882353, 0, 1,
-0.9883782, -0.7608063, -2.673838, 1, 0.9960784, 0, 1,
-0.9881282, -1.052683, -3.989197, 0.9960784, 1, 0, 1,
-0.982915, 0.2708413, -2.507932, 0.9921569, 1, 0, 1,
-0.9768383, -0.4367847, -2.781923, 0.9843137, 1, 0, 1,
-0.9758438, -0.8697107, -2.293299, 0.9803922, 1, 0, 1,
-0.9741579, -0.3647908, -3.696579, 0.972549, 1, 0, 1,
-0.9643849, -1.226528, -1.120052, 0.9686275, 1, 0, 1,
-0.9633886, 1.258869, -1.859623, 0.9607843, 1, 0, 1,
-0.9621938, -0.1168891, -2.545263, 0.9568627, 1, 0, 1,
-0.9545023, 0.3222094, -0.9994535, 0.9490196, 1, 0, 1,
-0.9487309, 0.3843921, 0.3190495, 0.945098, 1, 0, 1,
-0.9460543, -1.190957, -2.582989, 0.9372549, 1, 0, 1,
-0.9424218, 1.014786, -1.599991, 0.9333333, 1, 0, 1,
-0.9331608, 1.74657, -0.1312168, 0.9254902, 1, 0, 1,
-0.9304851, 0.7510301, -2.22841, 0.9215686, 1, 0, 1,
-0.9282117, 1.082194, -1.417235, 0.9137255, 1, 0, 1,
-0.9246383, 1.353044, 0.8534595, 0.9098039, 1, 0, 1,
-0.9221039, -1.127227, -1.438205, 0.9019608, 1, 0, 1,
-0.9219207, -0.8083637, -2.186867, 0.8941177, 1, 0, 1,
-0.9201757, -1.42525, -2.807942, 0.8901961, 1, 0, 1,
-0.9145963, 1.589526, 0.3927892, 0.8823529, 1, 0, 1,
-0.913992, 1.242659, -1.411021, 0.8784314, 1, 0, 1,
-0.9135578, -1.332403, -2.994365, 0.8705882, 1, 0, 1,
-0.9123681, 0.2511533, -1.1683, 0.8666667, 1, 0, 1,
-0.9119918, 1.996924, -0.9443668, 0.8588235, 1, 0, 1,
-0.9067194, 2.991105, 0.6244301, 0.854902, 1, 0, 1,
-0.9048601, 1.238945, -0.8179992, 0.8470588, 1, 0, 1,
-0.902279, 1.435588, -0.1677745, 0.8431373, 1, 0, 1,
-0.9011557, -0.1597586, -1.903512, 0.8352941, 1, 0, 1,
-0.8999571, -0.1312773, -1.900288, 0.8313726, 1, 0, 1,
-0.8982663, 0.0002487727, -1.401865, 0.8235294, 1, 0, 1,
-0.8899575, -1.715571, -2.928933, 0.8196079, 1, 0, 1,
-0.8885363, 0.7447015, -1.073581, 0.8117647, 1, 0, 1,
-0.8881156, -0.8541408, -2.975728, 0.8078431, 1, 0, 1,
-0.8806384, -0.5032786, -0.7895389, 0.8, 1, 0, 1,
-0.8740473, 2.380253, 0.6025709, 0.7921569, 1, 0, 1,
-0.8710651, 1.520494, -2.154403, 0.7882353, 1, 0, 1,
-0.8687878, 0.09655326, -1.77625, 0.7803922, 1, 0, 1,
-0.8641844, 1.331624, -0.8262123, 0.7764706, 1, 0, 1,
-0.8545613, 0.6799125, -0.3626669, 0.7686275, 1, 0, 1,
-0.852817, 0.8568425, -0.7870297, 0.7647059, 1, 0, 1,
-0.8508623, -0.2829846, -2.403518, 0.7568628, 1, 0, 1,
-0.8470156, 1.128907, -1.166033, 0.7529412, 1, 0, 1,
-0.84213, 0.1494426, -1.601026, 0.7450981, 1, 0, 1,
-0.8334901, 1.50646, 0.1792455, 0.7411765, 1, 0, 1,
-0.8320732, -0.2946604, -2.247468, 0.7333333, 1, 0, 1,
-0.8296177, 0.5667485, 0.5667123, 0.7294118, 1, 0, 1,
-0.8247139, 0.6733815, -0.476111, 0.7215686, 1, 0, 1,
-0.8219665, -0.6439245, -0.7805715, 0.7176471, 1, 0, 1,
-0.8202345, 0.002109267, -1.100352, 0.7098039, 1, 0, 1,
-0.8184517, 0.559935, -1.188324, 0.7058824, 1, 0, 1,
-0.816461, -1.7323, -0.6148605, 0.6980392, 1, 0, 1,
-0.8147214, 0.1252171, -2.645806, 0.6901961, 1, 0, 1,
-0.811508, 0.8316539, 0.3726731, 0.6862745, 1, 0, 1,
-0.8058629, 0.5619581, 0.2061048, 0.6784314, 1, 0, 1,
-0.8054315, 1.130477, -0.2475419, 0.6745098, 1, 0, 1,
-0.8047757, 0.5612441, -0.07299025, 0.6666667, 1, 0, 1,
-0.8018535, 0.5559289, -0.6534595, 0.6627451, 1, 0, 1,
-0.8011273, 0.1409636, -1.685612, 0.654902, 1, 0, 1,
-0.7980016, -0.01712908, -0.3322397, 0.6509804, 1, 0, 1,
-0.7943345, -0.08596526, 0.3509398, 0.6431373, 1, 0, 1,
-0.7933902, 0.6501068, -0.1943371, 0.6392157, 1, 0, 1,
-0.7879546, 0.9976378, -0.6139883, 0.6313726, 1, 0, 1,
-0.7872807, 1.031208, -0.5497786, 0.627451, 1, 0, 1,
-0.7852003, 1.704746, -0.08774311, 0.6196079, 1, 0, 1,
-0.7819191, -0.9033275, -2.611737, 0.6156863, 1, 0, 1,
-0.7772152, -0.7518051, -1.408169, 0.6078432, 1, 0, 1,
-0.7754548, -0.7528849, -4.272809, 0.6039216, 1, 0, 1,
-0.7739928, -0.4932883, -0.5185995, 0.5960785, 1, 0, 1,
-0.771593, 1.261211, 2.159163, 0.5882353, 1, 0, 1,
-0.7713138, -0.05736734, -3.513424, 0.5843138, 1, 0, 1,
-0.7672983, 0.9651911, 0.2384332, 0.5764706, 1, 0, 1,
-0.7639566, 0.3001918, -1.017744, 0.572549, 1, 0, 1,
-0.7638183, 0.1573627, -0.1320057, 0.5647059, 1, 0, 1,
-0.753688, -1.300841, -2.973716, 0.5607843, 1, 0, 1,
-0.7524559, -0.1702675, -2.292596, 0.5529412, 1, 0, 1,
-0.7480754, -0.723252, -3.208577, 0.5490196, 1, 0, 1,
-0.7476047, 1.235432, 0.6538743, 0.5411765, 1, 0, 1,
-0.7391, 1.743517, 0.9351342, 0.5372549, 1, 0, 1,
-0.7387871, -0.3106141, -0.7498197, 0.5294118, 1, 0, 1,
-0.7347026, 0.8133333, 1.4187, 0.5254902, 1, 0, 1,
-0.7340701, -0.5158823, -4.128543, 0.5176471, 1, 0, 1,
-0.7310061, 0.4704783, -1.698533, 0.5137255, 1, 0, 1,
-0.7309452, -2.270325, -2.277588, 0.5058824, 1, 0, 1,
-0.7298728, -1.50292, -2.986128, 0.5019608, 1, 0, 1,
-0.729194, 0.5556149, -2.348725, 0.4941176, 1, 0, 1,
-0.7280269, 2.117977, -0.2577229, 0.4862745, 1, 0, 1,
-0.7264185, -0.7763596, -0.7822801, 0.4823529, 1, 0, 1,
-0.7257172, 0.34857, -1.246552, 0.4745098, 1, 0, 1,
-0.7244002, 1.026642, -2.654289, 0.4705882, 1, 0, 1,
-0.7213973, -0.7370786, -1.82602, 0.4627451, 1, 0, 1,
-0.7126996, -0.2542524, -0.5649508, 0.4588235, 1, 0, 1,
-0.7044035, -1.193822, -0.5027733, 0.4509804, 1, 0, 1,
-0.7023322, 1.6369, 1.764848, 0.4470588, 1, 0, 1,
-0.7004455, 0.155347, -2.618703, 0.4392157, 1, 0, 1,
-0.6981201, 0.5805366, -0.4261349, 0.4352941, 1, 0, 1,
-0.6979962, -0.5952306, -1.424752, 0.427451, 1, 0, 1,
-0.6929922, 1.30246, -1.111995, 0.4235294, 1, 0, 1,
-0.6927288, 0.2921912, -2.159765, 0.4156863, 1, 0, 1,
-0.6890831, 1.261416, -1.153865, 0.4117647, 1, 0, 1,
-0.6857335, 0.4232688, -1.357578, 0.4039216, 1, 0, 1,
-0.6730803, -1.191654, -2.056839, 0.3960784, 1, 0, 1,
-0.6704838, 1.209141, -1.807267, 0.3921569, 1, 0, 1,
-0.6697786, -0.9990348, -3.649545, 0.3843137, 1, 0, 1,
-0.6689895, -0.4218759, -0.9658705, 0.3803922, 1, 0, 1,
-0.665542, 0.3050705, -2.119833, 0.372549, 1, 0, 1,
-0.6654218, 0.5613905, -1.755854, 0.3686275, 1, 0, 1,
-0.663397, 0.06281968, -0.7712694, 0.3607843, 1, 0, 1,
-0.655387, -1.688477, -3.976166, 0.3568628, 1, 0, 1,
-0.649829, 0.01235383, -1.989152, 0.3490196, 1, 0, 1,
-0.6482166, -0.4324225, -0.4093433, 0.345098, 1, 0, 1,
-0.6469851, -1.883433, -3.511454, 0.3372549, 1, 0, 1,
-0.6461254, -0.3614254, -0.6435818, 0.3333333, 1, 0, 1,
-0.6420819, -1.714274, -3.652494, 0.3254902, 1, 0, 1,
-0.6396822, -2.47964, -3.635454, 0.3215686, 1, 0, 1,
-0.6322011, -1.039757, -1.951795, 0.3137255, 1, 0, 1,
-0.6265602, 1.511588, 0.4516349, 0.3098039, 1, 0, 1,
-0.6224881, 0.421699, -0.430431, 0.3019608, 1, 0, 1,
-0.6207368, -0.9357826, -2.544392, 0.2941177, 1, 0, 1,
-0.6205066, -1.93488, -3.258302, 0.2901961, 1, 0, 1,
-0.6186954, 1.228124, -1.368943, 0.282353, 1, 0, 1,
-0.6164858, -0.0900792, -1.287955, 0.2784314, 1, 0, 1,
-0.6097602, -0.1616343, -0.2644304, 0.2705882, 1, 0, 1,
-0.6087855, -1.302139, -1.661153, 0.2666667, 1, 0, 1,
-0.6080592, 1.326097, 0.1396758, 0.2588235, 1, 0, 1,
-0.6005857, -1.923222, -2.242013, 0.254902, 1, 0, 1,
-0.5984543, 1.441322, 0.315092, 0.2470588, 1, 0, 1,
-0.5890122, -0.8967922, -3.824553, 0.2431373, 1, 0, 1,
-0.5808495, -0.008297685, -2.518469, 0.2352941, 1, 0, 1,
-0.5804695, -0.02687269, -0.5245919, 0.2313726, 1, 0, 1,
-0.5757303, 0.4745097, 0.4134865, 0.2235294, 1, 0, 1,
-0.574107, -0.1819005, -3.610473, 0.2196078, 1, 0, 1,
-0.5718852, 1.601009, -0.5542939, 0.2117647, 1, 0, 1,
-0.5695733, 2.824837, 0.112057, 0.2078431, 1, 0, 1,
-0.5658105, -0.4579371, -2.616815, 0.2, 1, 0, 1,
-0.5653214, -0.3044558, -0.4264884, 0.1921569, 1, 0, 1,
-0.5633741, 0.3178426, -0.6308207, 0.1882353, 1, 0, 1,
-0.5631215, -1.118037, -1.657456, 0.1803922, 1, 0, 1,
-0.560375, -0.5834532, -2.922813, 0.1764706, 1, 0, 1,
-0.560043, -0.7472796, -1.372819, 0.1686275, 1, 0, 1,
-0.550046, -1.855077, -1.317349, 0.1647059, 1, 0, 1,
-0.547428, 0.9077136, 0.2044082, 0.1568628, 1, 0, 1,
-0.545728, 1.092746, 0.6106122, 0.1529412, 1, 0, 1,
-0.5450136, -3.200243, -1.596165, 0.145098, 1, 0, 1,
-0.5449805, 0.3934703, -1.481524, 0.1411765, 1, 0, 1,
-0.5370264, 1.17212, -1.08106, 0.1333333, 1, 0, 1,
-0.5359965, 0.4788439, -0.02294524, 0.1294118, 1, 0, 1,
-0.5332522, 0.9054125, -0.1930731, 0.1215686, 1, 0, 1,
-0.5320546, 0.6800028, -0.7646844, 0.1176471, 1, 0, 1,
-0.5301263, 0.6707023, -1.085288, 0.1098039, 1, 0, 1,
-0.5286836, 1.165654, -0.9028518, 0.1058824, 1, 0, 1,
-0.5283341, 0.3155162, -1.575961, 0.09803922, 1, 0, 1,
-0.5231038, -1.562135, -1.674091, 0.09019608, 1, 0, 1,
-0.5151542, 0.1934537, -0.8012612, 0.08627451, 1, 0, 1,
-0.5078737, 0.5550999, -2.046836, 0.07843138, 1, 0, 1,
-0.5015114, 1.134147, 0.7935361, 0.07450981, 1, 0, 1,
-0.4984798, 0.9209418, -0.8525186, 0.06666667, 1, 0, 1,
-0.4976832, -2.043898, -2.598823, 0.0627451, 1, 0, 1,
-0.487394, -0.141039, -3.657764, 0.05490196, 1, 0, 1,
-0.4855467, -0.3993065, -2.603755, 0.05098039, 1, 0, 1,
-0.4840328, 0.5693266, -0.4535414, 0.04313726, 1, 0, 1,
-0.4839434, -0.04418138, -1.047833, 0.03921569, 1, 0, 1,
-0.475937, -1.111182, -2.091651, 0.03137255, 1, 0, 1,
-0.472817, 0.2842618, 0.398341, 0.02745098, 1, 0, 1,
-0.4631507, -0.3046574, -2.019918, 0.01960784, 1, 0, 1,
-0.461153, 0.3936985, -2.454563, 0.01568628, 1, 0, 1,
-0.4604943, 0.7423543, -0.4178626, 0.007843138, 1, 0, 1,
-0.4570017, 0.4939241, -0.1839823, 0.003921569, 1, 0, 1,
-0.4544788, 1.36324, 0.02619419, 0, 1, 0.003921569, 1,
-0.4473624, -2.596927, -1.964874, 0, 1, 0.01176471, 1,
-0.4457327, -1.609252, -4.263033, 0, 1, 0.01568628, 1,
-0.4444754, 0.7287747, 0.3728096, 0, 1, 0.02352941, 1,
-0.4419618, -0.9841995, -2.499472, 0, 1, 0.02745098, 1,
-0.4413528, -0.5393732, -0.9299735, 0, 1, 0.03529412, 1,
-0.437626, 3.402977, -0.8003812, 0, 1, 0.03921569, 1,
-0.4360083, -1.138769, -1.818436, 0, 1, 0.04705882, 1,
-0.432666, 0.03558898, -0.7266194, 0, 1, 0.05098039, 1,
-0.4219944, 0.04313992, -1.894751, 0, 1, 0.05882353, 1,
-0.4203168, 0.8372255, 0.4560359, 0, 1, 0.0627451, 1,
-0.4200231, -0.2530422, -3.279274, 0, 1, 0.07058824, 1,
-0.4172707, 1.106313, -0.1284542, 0, 1, 0.07450981, 1,
-0.4146086, 0.9695566, -3.189575, 0, 1, 0.08235294, 1,
-0.4139484, -1.275092, -5.21291, 0, 1, 0.08627451, 1,
-0.4124681, -0.6369794, 0.04287985, 0, 1, 0.09411765, 1,
-0.4121616, -0.1220628, -0.6321259, 0, 1, 0.1019608, 1,
-0.4121077, 0.2344278, -1.536389, 0, 1, 0.1058824, 1,
-0.408693, -1.275931, -3.961968, 0, 1, 0.1137255, 1,
-0.4054295, 0.4386875, -0.8133966, 0, 1, 0.1176471, 1,
-0.4011428, 0.7993652, -1.240452, 0, 1, 0.1254902, 1,
-0.3988786, -0.8735064, -3.049268, 0, 1, 0.1294118, 1,
-0.3960502, -0.206853, -2.06333, 0, 1, 0.1372549, 1,
-0.3936233, 0.02861826, -2.990403, 0, 1, 0.1411765, 1,
-0.3927708, 0.5873838, 0.4769486, 0, 1, 0.1490196, 1,
-0.3889872, 0.5677959, -2.401737, 0, 1, 0.1529412, 1,
-0.3860068, -0.3288672, -3.71773, 0, 1, 0.1607843, 1,
-0.3856076, 0.1518724, 1.018218, 0, 1, 0.1647059, 1,
-0.3845243, 1.612473, 1.019872, 0, 1, 0.172549, 1,
-0.3841524, -1.881547, -2.895049, 0, 1, 0.1764706, 1,
-0.3836743, -0.5683874, -1.555415, 0, 1, 0.1843137, 1,
-0.3720056, 0.3888892, 0.3641167, 0, 1, 0.1882353, 1,
-0.3718308, 0.4083907, -0.5712144, 0, 1, 0.1960784, 1,
-0.3649423, -0.6986522, -4.099563, 0, 1, 0.2039216, 1,
-0.3621388, 0.1036539, -2.227666, 0, 1, 0.2078431, 1,
-0.3617885, 0.2802862, -0.1148379, 0, 1, 0.2156863, 1,
-0.3601567, 0.4773906, -0.7841489, 0, 1, 0.2196078, 1,
-0.3597952, 0.5740585, 0.3744172, 0, 1, 0.227451, 1,
-0.3577618, -0.8359328, -2.416474, 0, 1, 0.2313726, 1,
-0.3547877, 1.614282, 1.224806, 0, 1, 0.2392157, 1,
-0.3514748, -0.1573418, -1.360137, 0, 1, 0.2431373, 1,
-0.3510355, 0.02572147, -2.117924, 0, 1, 0.2509804, 1,
-0.3451577, -1.289727, -2.706073, 0, 1, 0.254902, 1,
-0.341217, -1.169962, -3.929885, 0, 1, 0.2627451, 1,
-0.340653, 1.431566, 1.392222, 0, 1, 0.2666667, 1,
-0.339622, 0.1407395, -0.8011098, 0, 1, 0.2745098, 1,
-0.3360345, 0.04147426, -1.981472, 0, 1, 0.2784314, 1,
-0.3313637, -1.233554, -0.06849544, 0, 1, 0.2862745, 1,
-0.3313556, 0.09722833, -1.293478, 0, 1, 0.2901961, 1,
-0.329405, 3.181649, 0.6905763, 0, 1, 0.2980392, 1,
-0.3265201, 0.922998, 1.028631, 0, 1, 0.3058824, 1,
-0.3196513, -0.3251397, -2.852894, 0, 1, 0.3098039, 1,
-0.3166969, -1.210922, -3.204666, 0, 1, 0.3176471, 1,
-0.3149979, -0.9646606, -2.669331, 0, 1, 0.3215686, 1,
-0.3091925, 0.6043957, -0.2982243, 0, 1, 0.3294118, 1,
-0.302037, 1.111773, -1.335298, 0, 1, 0.3333333, 1,
-0.3010722, -1.132596, -2.435945, 0, 1, 0.3411765, 1,
-0.2999472, 0.2491776, -0.1291451, 0, 1, 0.345098, 1,
-0.2950654, 1.294143, 1.62973, 0, 1, 0.3529412, 1,
-0.2942848, -0.5585606, -1.836421, 0, 1, 0.3568628, 1,
-0.2928798, 0.5171027, 0.2717904, 0, 1, 0.3647059, 1,
-0.2896613, -0.8343936, -2.674559, 0, 1, 0.3686275, 1,
-0.2896065, -2.80054, -3.208065, 0, 1, 0.3764706, 1,
-0.2879348, -0.06771904, -1.077778, 0, 1, 0.3803922, 1,
-0.2833853, -0.4124724, -0.1569069, 0, 1, 0.3882353, 1,
-0.2832817, -1.4216, -3.160408, 0, 1, 0.3921569, 1,
-0.2710441, 0.3299459, 0.3464596, 0, 1, 0.4, 1,
-0.262162, -0.8129485, -4.54833, 0, 1, 0.4078431, 1,
-0.2601008, -0.9141155, -3.69586, 0, 1, 0.4117647, 1,
-0.2588238, -1.228545, -3.430721, 0, 1, 0.4196078, 1,
-0.2495263, -1.553689, -3.58094, 0, 1, 0.4235294, 1,
-0.2470818, -1.404441, -2.170096, 0, 1, 0.4313726, 1,
-0.2446769, -0.3016977, -3.750636, 0, 1, 0.4352941, 1,
-0.2443502, 1.861193, -0.4570104, 0, 1, 0.4431373, 1,
-0.2442606, -0.8991089, -3.997352, 0, 1, 0.4470588, 1,
-0.2428959, 1.682064, -0.874416, 0, 1, 0.454902, 1,
-0.2400901, -0.1175425, -1.668022, 0, 1, 0.4588235, 1,
-0.2372052, -0.01979818, -1.829002, 0, 1, 0.4666667, 1,
-0.2359283, 0.7549011, -0.4123972, 0, 1, 0.4705882, 1,
-0.2342896, -0.9592687, -2.654625, 0, 1, 0.4784314, 1,
-0.2328264, 0.6155849, 1.215462, 0, 1, 0.4823529, 1,
-0.2277295, -0.3621274, -2.130031, 0, 1, 0.4901961, 1,
-0.2206782, -0.3949664, -3.653755, 0, 1, 0.4941176, 1,
-0.2147491, -1.337263, -2.013031, 0, 1, 0.5019608, 1,
-0.2085372, 0.5930271, -1.861265, 0, 1, 0.509804, 1,
-0.2058763, -0.9808363, -3.745867, 0, 1, 0.5137255, 1,
-0.2054185, 0.875458, -2.452751, 0, 1, 0.5215687, 1,
-0.2044879, 0.353655, -0.6316007, 0, 1, 0.5254902, 1,
-0.2043235, 0.1890679, -1.19618, 0, 1, 0.5333334, 1,
-0.2010892, -1.450824, -3.217252, 0, 1, 0.5372549, 1,
-0.1951958, -0.7881306, -2.282092, 0, 1, 0.5450981, 1,
-0.1931144, 0.09533242, -1.503563, 0, 1, 0.5490196, 1,
-0.1907286, 1.713938, -0.4372701, 0, 1, 0.5568628, 1,
-0.1904057, 1.748219, -0.2205131, 0, 1, 0.5607843, 1,
-0.1875864, -0.3161967, -2.834794, 0, 1, 0.5686275, 1,
-0.1814604, 0.8395077, 0.9179252, 0, 1, 0.572549, 1,
-0.1725171, -0.1459086, -2.749952, 0, 1, 0.5803922, 1,
-0.1721208, 0.09544241, -0.677791, 0, 1, 0.5843138, 1,
-0.1718375, 0.9260133, 0.8433063, 0, 1, 0.5921569, 1,
-0.1664128, -0.577352, -4.450613, 0, 1, 0.5960785, 1,
-0.1630124, 0.3757357, -1.445267, 0, 1, 0.6039216, 1,
-0.1627349, 0.5803998, -1.353902, 0, 1, 0.6117647, 1,
-0.158016, -1.264968, -1.251348, 0, 1, 0.6156863, 1,
-0.1574689, 0.1270092, -1.781675, 0, 1, 0.6235294, 1,
-0.1558333, -2.228894, -1.896292, 0, 1, 0.627451, 1,
-0.1546953, 3.016793, -0.9513724, 0, 1, 0.6352941, 1,
-0.1546779, 1.248329, 0.1986163, 0, 1, 0.6392157, 1,
-0.1498833, 1.368561, 0.4970149, 0, 1, 0.6470588, 1,
-0.1457755, -0.0545238, -2.052111, 0, 1, 0.6509804, 1,
-0.1379212, 1.123001, 0.8295932, 0, 1, 0.6588235, 1,
-0.1353865, 2.205306, -0.4342096, 0, 1, 0.6627451, 1,
-0.1295997, -1.802953, -3.415328, 0, 1, 0.6705883, 1,
-0.128759, -0.1270081, -3.404134, 0, 1, 0.6745098, 1,
-0.12721, 1.337671, 1.317424, 0, 1, 0.682353, 1,
-0.1262541, 1.461876, 0.001608791, 0, 1, 0.6862745, 1,
-0.1249809, -0.09128279, -1.280142, 0, 1, 0.6941177, 1,
-0.1239214, 0.2800415, -0.7600083, 0, 1, 0.7019608, 1,
-0.1219116, 0.9905694, -0.8406096, 0, 1, 0.7058824, 1,
-0.1207393, 0.5055603, -2.336967, 0, 1, 0.7137255, 1,
-0.1204746, 0.6031045, -0.8071249, 0, 1, 0.7176471, 1,
-0.1203786, 1.068158, 0.6115231, 0, 1, 0.7254902, 1,
-0.11983, -1.015319, -2.33457, 0, 1, 0.7294118, 1,
-0.1192424, 0.7406278, 1.093661, 0, 1, 0.7372549, 1,
-0.1175435, -0.5230777, -4.645088, 0, 1, 0.7411765, 1,
-0.1129594, 0.1497286, 1.073747, 0, 1, 0.7490196, 1,
-0.1073227, 0.5029833, -1.780146, 0, 1, 0.7529412, 1,
-0.104264, -0.8682784, -4.202903, 0, 1, 0.7607843, 1,
-0.09783202, -0.275693, -3.397235, 0, 1, 0.7647059, 1,
-0.09635081, -0.3918364, -1.64498, 0, 1, 0.772549, 1,
-0.09630787, -0.1820982, -2.527641, 0, 1, 0.7764706, 1,
-0.08752809, -0.457063, -2.939104, 0, 1, 0.7843137, 1,
-0.08357366, -0.1730775, -1.466947, 0, 1, 0.7882353, 1,
-0.0831816, 2.542957, -0.2091422, 0, 1, 0.7960784, 1,
-0.07384336, 2.253121, -0.1428031, 0, 1, 0.8039216, 1,
-0.07301003, 0.2917233, -1.031591, 0, 1, 0.8078431, 1,
-0.07195865, -1.288962, -3.817186, 0, 1, 0.8156863, 1,
-0.06840034, -0.3554978, -4.042654, 0, 1, 0.8196079, 1,
-0.06822028, -0.3981877, -4.053417, 0, 1, 0.827451, 1,
-0.06746783, 1.894861, -1.590472, 0, 1, 0.8313726, 1,
-0.06570863, -0.0751005, -1.573928, 0, 1, 0.8392157, 1,
-0.06517309, -0.4199473, -2.858054, 0, 1, 0.8431373, 1,
-0.06296107, 1.140994, -0.3885757, 0, 1, 0.8509804, 1,
-0.06222769, -0.3270923, -3.048123, 0, 1, 0.854902, 1,
-0.06191864, 0.9917638, 0.1232088, 0, 1, 0.8627451, 1,
-0.06167512, -1.374892, -3.293338, 0, 1, 0.8666667, 1,
-0.06073922, 1.047654, -0.2437056, 0, 1, 0.8745098, 1,
-0.06047708, 1.528262, 0.6461552, 0, 1, 0.8784314, 1,
-0.05326499, 0.6833417, -0.1499803, 0, 1, 0.8862745, 1,
-0.05128228, -0.361155, -4.745865, 0, 1, 0.8901961, 1,
-0.05076149, 0.8955274, -2.116734, 0, 1, 0.8980392, 1,
-0.04871633, 0.06071575, -0.1700685, 0, 1, 0.9058824, 1,
-0.04800327, -0.7768325, -2.451456, 0, 1, 0.9098039, 1,
-0.0470014, 0.01473804, -1.307295, 0, 1, 0.9176471, 1,
-0.04231143, 0.02817936, -2.288967, 0, 1, 0.9215686, 1,
-0.04163494, -0.90965, -3.996614, 0, 1, 0.9294118, 1,
-0.04007304, -0.7507818, -3.33248, 0, 1, 0.9333333, 1,
-0.03833743, -0.6625667, -3.725956, 0, 1, 0.9411765, 1,
-0.03818895, -0.4709679, -0.9400221, 0, 1, 0.945098, 1,
-0.03431458, -1.332802, -2.879251, 0, 1, 0.9529412, 1,
-0.03428071, 0.58115, -0.3127506, 0, 1, 0.9568627, 1,
-0.03189616, 1.711921, 1.01641, 0, 1, 0.9647059, 1,
-0.03084274, -0.7171518, -2.948267, 0, 1, 0.9686275, 1,
-0.03073957, 0.06017965, -0.02121064, 0, 1, 0.9764706, 1,
-0.02937768, -0.2760535, -3.847597, 0, 1, 0.9803922, 1,
-0.02754978, 0.007044153, -1.402085, 0, 1, 0.9882353, 1,
-0.02460487, 0.134899, -1.299343, 0, 1, 0.9921569, 1,
-0.01959369, 0.7938957, -0.3137386, 0, 1, 1, 1,
-0.01800228, -0.3221626, -2.811253, 0, 0.9921569, 1, 1,
-0.01771997, -0.4169618, -3.23599, 0, 0.9882353, 1, 1,
-0.01649171, -0.5713532, -2.666241, 0, 0.9803922, 1, 1,
-0.01423155, 0.1432508, -0.2385323, 0, 0.9764706, 1, 1,
-0.007662473, -0.3570381, -4.132562, 0, 0.9686275, 1, 1,
-0.005861404, -0.3752794, -1.931665, 0, 0.9647059, 1, 1,
-0.003858412, -1.846122, -3.450434, 0, 0.9568627, 1, 1,
-0.002404995, -0.3514443, -3.627992, 0, 0.9529412, 1, 1,
-0.001857226, -1.735368, -2.366453, 0, 0.945098, 1, 1,
0.004356795, 0.1550015, -0.1863993, 0, 0.9411765, 1, 1,
0.005818352, -0.3048757, 2.727562, 0, 0.9333333, 1, 1,
0.01349832, 1.277808, -1.489205, 0, 0.9294118, 1, 1,
0.0158399, -1.501182, 2.637136, 0, 0.9215686, 1, 1,
0.01916645, -0.5380264, 3.362631, 0, 0.9176471, 1, 1,
0.02062139, -0.3140119, 3.87809, 0, 0.9098039, 1, 1,
0.02256977, 1.412307, 1.739758, 0, 0.9058824, 1, 1,
0.0233368, -1.58166, 3.801399, 0, 0.8980392, 1, 1,
0.02657957, -1.478598, 3.436267, 0, 0.8901961, 1, 1,
0.02818643, 1.334678, 2.173444, 0, 0.8862745, 1, 1,
0.0375829, -1.199839, 3.275394, 0, 0.8784314, 1, 1,
0.04430526, -1.084693, 4.404299, 0, 0.8745098, 1, 1,
0.0446699, 1.91265, 1.705043, 0, 0.8666667, 1, 1,
0.04483687, 1.983477, -0.1998513, 0, 0.8627451, 1, 1,
0.046902, -0.1767592, 1.843199, 0, 0.854902, 1, 1,
0.05052317, -2.440305, 2.261828, 0, 0.8509804, 1, 1,
0.0514508, -0.3082406, 2.276172, 0, 0.8431373, 1, 1,
0.05388457, 0.6736953, 1.384882, 0, 0.8392157, 1, 1,
0.05626188, -0.4399957, 3.608255, 0, 0.8313726, 1, 1,
0.05936215, -1.042082, 2.793825, 0, 0.827451, 1, 1,
0.06440934, -0.9526249, 2.799097, 0, 0.8196079, 1, 1,
0.06561396, 0.5194721, -0.5040638, 0, 0.8156863, 1, 1,
0.06695929, 0.2230156, 1.116937, 0, 0.8078431, 1, 1,
0.06697883, -0.7124234, 3.722286, 0, 0.8039216, 1, 1,
0.06792888, 0.241619, 0.7502344, 0, 0.7960784, 1, 1,
0.07052136, -1.018124, 4.567912, 0, 0.7882353, 1, 1,
0.07363383, 0.3604265, -0.5944845, 0, 0.7843137, 1, 1,
0.07561521, 0.4482705, -0.9224705, 0, 0.7764706, 1, 1,
0.08534359, 0.8809581, 0.1140712, 0, 0.772549, 1, 1,
0.08615937, 0.3853873, 0.4323322, 0, 0.7647059, 1, 1,
0.08656546, -1.717183, 1.97574, 0, 0.7607843, 1, 1,
0.09041876, -1.571985, 2.242938, 0, 0.7529412, 1, 1,
0.09376806, 0.3856777, 0.5655429, 0, 0.7490196, 1, 1,
0.09407508, -0.964678, 1.229515, 0, 0.7411765, 1, 1,
0.09409623, 0.4390892, -0.4392639, 0, 0.7372549, 1, 1,
0.09465887, -0.1066374, 3.704917, 0, 0.7294118, 1, 1,
0.09564639, -0.3834438, 2.389218, 0, 0.7254902, 1, 1,
0.09710573, -1.701064, 1.3369, 0, 0.7176471, 1, 1,
0.09767035, -1.394506, 2.562778, 0, 0.7137255, 1, 1,
0.1025536, -0.1673324, 2.387848, 0, 0.7058824, 1, 1,
0.1044806, 1.419894, -0.9584795, 0, 0.6980392, 1, 1,
0.1051287, 1.387226, -1.628477, 0, 0.6941177, 1, 1,
0.1063833, -0.5000792, 3.833018, 0, 0.6862745, 1, 1,
0.110103, -0.6676731, 4.115715, 0, 0.682353, 1, 1,
0.1107565, -1.030475, 1.971164, 0, 0.6745098, 1, 1,
0.1107673, 1.119845, -0.6800222, 0, 0.6705883, 1, 1,
0.1116345, 0.06401823, 1.201247, 0, 0.6627451, 1, 1,
0.1124184, 1.751774, -1.816884, 0, 0.6588235, 1, 1,
0.1167969, 1.041466, -0.4333791, 0, 0.6509804, 1, 1,
0.1185188, -2.01802, 3.953461, 0, 0.6470588, 1, 1,
0.1186738, -0.2569777, 2.779409, 0, 0.6392157, 1, 1,
0.1195862, 1.746284, -0.4766537, 0, 0.6352941, 1, 1,
0.1226184, -0.881887, 2.702627, 0, 0.627451, 1, 1,
0.1244518, 2.128016, -0.3435277, 0, 0.6235294, 1, 1,
0.1249956, 0.5046109, -0.881353, 0, 0.6156863, 1, 1,
0.1257091, 0.01529036, 2.063752, 0, 0.6117647, 1, 1,
0.1275226, 0.1046888, 0.1038796, 0, 0.6039216, 1, 1,
0.1289819, 1.55036, -0.4105033, 0, 0.5960785, 1, 1,
0.134956, 1.428163, 0.2350332, 0, 0.5921569, 1, 1,
0.1354428, 0.5919693, -0.6431007, 0, 0.5843138, 1, 1,
0.1397768, -1.284951, 1.759463, 0, 0.5803922, 1, 1,
0.1413737, -0.2888136, 2.776432, 0, 0.572549, 1, 1,
0.1416952, 0.5282747, 0.917366, 0, 0.5686275, 1, 1,
0.1417633, -0.6631123, 2.582323, 0, 0.5607843, 1, 1,
0.143427, 1.256703, 1.308474, 0, 0.5568628, 1, 1,
0.1451078, -1.625436, 3.403454, 0, 0.5490196, 1, 1,
0.1457874, -0.5680692, 3.079854, 0, 0.5450981, 1, 1,
0.1493194, 0.3985429, 0.2659665, 0, 0.5372549, 1, 1,
0.1512553, -1.131163, 2.648079, 0, 0.5333334, 1, 1,
0.1592243, -0.872686, 1.287398, 0, 0.5254902, 1, 1,
0.161631, -0.4990036, 2.281073, 0, 0.5215687, 1, 1,
0.1635374, -1.96194, 3.518021, 0, 0.5137255, 1, 1,
0.1658642, 0.703877, -0.3670151, 0, 0.509804, 1, 1,
0.1665867, -1.188422, 2.37231, 0, 0.5019608, 1, 1,
0.1682146, -0.1279901, 2.943825, 0, 0.4941176, 1, 1,
0.1715353, -1.063776, 2.328577, 0, 0.4901961, 1, 1,
0.173061, -0.512704, 2.801975, 0, 0.4823529, 1, 1,
0.1736016, -1.953463, 2.957398, 0, 0.4784314, 1, 1,
0.1798492, 0.7392669, 2.371644, 0, 0.4705882, 1, 1,
0.1811152, -1.068032, 1.164155, 0, 0.4666667, 1, 1,
0.1889588, 0.9682078, 2.384068, 0, 0.4588235, 1, 1,
0.1915599, -1.063441, 3.186444, 0, 0.454902, 1, 1,
0.1974823, 0.5854775, -0.6358622, 0, 0.4470588, 1, 1,
0.1980215, -0.2393964, 1.464573, 0, 0.4431373, 1, 1,
0.204844, 0.3264945, 0.02865382, 0, 0.4352941, 1, 1,
0.2048835, -0.7710692, 2.419297, 0, 0.4313726, 1, 1,
0.2110156, -0.6641256, 3.975254, 0, 0.4235294, 1, 1,
0.2146031, 0.6719736, 0.9945242, 0, 0.4196078, 1, 1,
0.2154932, -1.177974, 4.09257, 0, 0.4117647, 1, 1,
0.2173752, -0.8624447, 2.21067, 0, 0.4078431, 1, 1,
0.222111, 1.267197, -0.8164038, 0, 0.4, 1, 1,
0.2244162, -0.3141944, 3.835547, 0, 0.3921569, 1, 1,
0.2244692, 0.01836477, 1.509371, 0, 0.3882353, 1, 1,
0.2263764, 1.842028, -1.607018, 0, 0.3803922, 1, 1,
0.2319106, -0.2314001, 4.006084, 0, 0.3764706, 1, 1,
0.233003, -0.3200391, 2.473943, 0, 0.3686275, 1, 1,
0.2395021, 0.3421052, -1.231039, 0, 0.3647059, 1, 1,
0.2396528, 1.848096, 1.238012, 0, 0.3568628, 1, 1,
0.2412158, 1.388643, 2.024998, 0, 0.3529412, 1, 1,
0.2441634, 0.5070857, 0.2711382, 0, 0.345098, 1, 1,
0.2499434, 0.4383334, -0.0127729, 0, 0.3411765, 1, 1,
0.2558121, 0.8917137, 1.367139, 0, 0.3333333, 1, 1,
0.257777, 0.8504248, 1.457772, 0, 0.3294118, 1, 1,
0.2582383, -0.08661194, 2.163433, 0, 0.3215686, 1, 1,
0.2644989, 0.654028, -0.5139865, 0, 0.3176471, 1, 1,
0.269005, -0.2587227, 1.524952, 0, 0.3098039, 1, 1,
0.2720712, 0.9477661, -0.5176129, 0, 0.3058824, 1, 1,
0.273977, -0.5256211, 2.29204, 0, 0.2980392, 1, 1,
0.2747506, 1.418833, 0.08642378, 0, 0.2901961, 1, 1,
0.2777293, 0.6661184, -0.3352011, 0, 0.2862745, 1, 1,
0.2813312, -0.1021898, 1.418662, 0, 0.2784314, 1, 1,
0.2830513, 0.5685158, 0.07057468, 0, 0.2745098, 1, 1,
0.2892769, -1.358817, 1.985104, 0, 0.2666667, 1, 1,
0.2933988, -0.3956307, 2.456823, 0, 0.2627451, 1, 1,
0.2956639, 0.1957783, 0.09382737, 0, 0.254902, 1, 1,
0.3100334, 0.7485188, -0.02166065, 0, 0.2509804, 1, 1,
0.3139556, 1.328828, -1.620951, 0, 0.2431373, 1, 1,
0.3157772, 0.02042983, 1.102116, 0, 0.2392157, 1, 1,
0.3192241, -0.879961, 2.566575, 0, 0.2313726, 1, 1,
0.3197445, 0.6497516, -0.6192629, 0, 0.227451, 1, 1,
0.3217863, -0.8954691, 3.215133, 0, 0.2196078, 1, 1,
0.3230348, -1.207259, 3.636071, 0, 0.2156863, 1, 1,
0.3231257, -1.462238, 2.634604, 0, 0.2078431, 1, 1,
0.3254476, 1.089011, 2.120119, 0, 0.2039216, 1, 1,
0.3274129, -1.260033, 4.296754, 0, 0.1960784, 1, 1,
0.3293167, -0.282794, 2.686276, 0, 0.1882353, 1, 1,
0.3369766, -0.7804514, 0.8638012, 0, 0.1843137, 1, 1,
0.3370171, -0.9283366, 3.424739, 0, 0.1764706, 1, 1,
0.339159, 1.337054, -0.1500392, 0, 0.172549, 1, 1,
0.3400454, -1.33101, 2.19319, 0, 0.1647059, 1, 1,
0.3406765, -0.9456941, 3.120967, 0, 0.1607843, 1, 1,
0.3450871, -0.9145455, 3.78388, 0, 0.1529412, 1, 1,
0.3453438, 0.814735, 1.060182, 0, 0.1490196, 1, 1,
0.3464655, -1.184659, 3.048014, 0, 0.1411765, 1, 1,
0.349331, 0.5434651, 1.250369, 0, 0.1372549, 1, 1,
0.3533094, -0.02840128, 2.065609, 0, 0.1294118, 1, 1,
0.353961, 0.2659678, 1.199918, 0, 0.1254902, 1, 1,
0.356183, -0.9981018, 0.2662489, 0, 0.1176471, 1, 1,
0.3598811, 1.005474, 0.9434556, 0, 0.1137255, 1, 1,
0.3625347, -0.3303594, 2.26442, 0, 0.1058824, 1, 1,
0.3625575, 0.03547743, 2.182761, 0, 0.09803922, 1, 1,
0.3642226, -0.1383115, 1.617515, 0, 0.09411765, 1, 1,
0.3651188, -0.8241119, 2.236717, 0, 0.08627451, 1, 1,
0.3672455, -0.6677026, 0.7336946, 0, 0.08235294, 1, 1,
0.3728974, -0.7572755, 2.823563, 0, 0.07450981, 1, 1,
0.375947, 0.6540554, 0.2491497, 0, 0.07058824, 1, 1,
0.3763263, 0.2918912, 0.1510354, 0, 0.0627451, 1, 1,
0.3795542, 0.5973724, 1.653527, 0, 0.05882353, 1, 1,
0.3803757, 0.8160959, 0.560631, 0, 0.05098039, 1, 1,
0.3827873, -0.07297477, 1.249918, 0, 0.04705882, 1, 1,
0.3832029, 0.8400254, 0.7327508, 0, 0.03921569, 1, 1,
0.3895836, 1.403789, -0.9546958, 0, 0.03529412, 1, 1,
0.392209, -0.144524, 4.279131, 0, 0.02745098, 1, 1,
0.392848, -2.629396, 4.421698, 0, 0.02352941, 1, 1,
0.3962755, 0.307129, 1.1619, 0, 0.01568628, 1, 1,
0.3986708, -0.3012605, 4.292007, 0, 0.01176471, 1, 1,
0.4015821, 0.6499804, 1.733717, 0, 0.003921569, 1, 1,
0.4022338, 0.2771235, -1.23517, 0.003921569, 0, 1, 1,
0.40367, -1.393906, 2.940413, 0.007843138, 0, 1, 1,
0.4045193, -0.005979303, 1.114799, 0.01568628, 0, 1, 1,
0.4075088, 0.3400079, 0.9102926, 0.01960784, 0, 1, 1,
0.4108737, 0.1982298, 0.8669422, 0.02745098, 0, 1, 1,
0.4122634, -0.4926527, 1.975296, 0.03137255, 0, 1, 1,
0.4140108, 1.584741, -1.976462, 0.03921569, 0, 1, 1,
0.4188298, 0.1903471, -0.03953634, 0.04313726, 0, 1, 1,
0.4249338, -0.6756586, 4.799027, 0.05098039, 0, 1, 1,
0.4253249, 0.7814732, 0.4557942, 0.05490196, 0, 1, 1,
0.4258552, -0.2251354, 1.821799, 0.0627451, 0, 1, 1,
0.4272284, -0.1516038, 0.849041, 0.06666667, 0, 1, 1,
0.4312173, -1.406256, 3.997313, 0.07450981, 0, 1, 1,
0.4474973, 0.6796278, 0.5157102, 0.07843138, 0, 1, 1,
0.448488, 1.152468, 1.426976, 0.08627451, 0, 1, 1,
0.4537488, -0.2235101, 2.314578, 0.09019608, 0, 1, 1,
0.4546736, 1.581038, 0.5366462, 0.09803922, 0, 1, 1,
0.4582307, -0.2129313, 0.880367, 0.1058824, 0, 1, 1,
0.4728542, 0.4262776, 0.2355435, 0.1098039, 0, 1, 1,
0.4741744, -0.5197458, 2.863772, 0.1176471, 0, 1, 1,
0.4750677, 1.520113, -0.09604593, 0.1215686, 0, 1, 1,
0.4759291, 0.05521251, -0.2178611, 0.1294118, 0, 1, 1,
0.4820888, -1.981566, 3.644071, 0.1333333, 0, 1, 1,
0.4853891, -0.713904, 2.848085, 0.1411765, 0, 1, 1,
0.4919757, 0.8058599, 1.895467, 0.145098, 0, 1, 1,
0.4960956, 0.6248234, 1.176484, 0.1529412, 0, 1, 1,
0.5056238, -0.2058001, 0.7539387, 0.1568628, 0, 1, 1,
0.5091868, 0.02031776, 2.156146, 0.1647059, 0, 1, 1,
0.5099019, -0.6424289, 2.426397, 0.1686275, 0, 1, 1,
0.5100541, -0.200167, 2.388157, 0.1764706, 0, 1, 1,
0.5112755, -0.2124436, 2.372224, 0.1803922, 0, 1, 1,
0.5170263, 0.4368179, -0.4620962, 0.1882353, 0, 1, 1,
0.5199514, -0.01718359, 1.585047, 0.1921569, 0, 1, 1,
0.521167, -0.1176109, 2.722223, 0.2, 0, 1, 1,
0.5226982, 0.02369956, 2.179702, 0.2078431, 0, 1, 1,
0.523691, 0.5192368, 0.4896782, 0.2117647, 0, 1, 1,
0.5295738, 0.08549957, -0.178113, 0.2196078, 0, 1, 1,
0.5310538, 0.6864024, 0.1350658, 0.2235294, 0, 1, 1,
0.531454, 0.6157833, -2.646669, 0.2313726, 0, 1, 1,
0.5319034, 1.079689, 1.152979, 0.2352941, 0, 1, 1,
0.5327705, -0.02497527, 1.431714, 0.2431373, 0, 1, 1,
0.5393642, 1.250103, 0.5226491, 0.2470588, 0, 1, 1,
0.5435437, -2.326871, 2.069369, 0.254902, 0, 1, 1,
0.5439138, 1.267481, -0.6489424, 0.2588235, 0, 1, 1,
0.5496638, 0.7629597, -0.4836706, 0.2666667, 0, 1, 1,
0.5551776, -0.2739035, 2.903094, 0.2705882, 0, 1, 1,
0.556248, 1.043242, 0.3559405, 0.2784314, 0, 1, 1,
0.5570687, -0.8531233, 2.33481, 0.282353, 0, 1, 1,
0.5587467, 0.6808844, 2.068323, 0.2901961, 0, 1, 1,
0.5654112, -0.9520235, 3.6759, 0.2941177, 0, 1, 1,
0.5671833, -2.243008, 3.111792, 0.3019608, 0, 1, 1,
0.5740296, 0.8580838, 1.083337, 0.3098039, 0, 1, 1,
0.5792183, -0.2534164, 1.796048, 0.3137255, 0, 1, 1,
0.5834983, -0.5288062, 3.595148, 0.3215686, 0, 1, 1,
0.5951049, -0.2248846, 2.56025, 0.3254902, 0, 1, 1,
0.597921, -0.3962806, 3.141633, 0.3333333, 0, 1, 1,
0.5988261, 0.2623858, 1.172484, 0.3372549, 0, 1, 1,
0.6032928, 0.3945661, 1.542955, 0.345098, 0, 1, 1,
0.604925, 0.7190759, 0.1473297, 0.3490196, 0, 1, 1,
0.6066194, 1.931583, -1.881794, 0.3568628, 0, 1, 1,
0.6078669, 0.840915, 0.6968098, 0.3607843, 0, 1, 1,
0.6086633, 3.126453, 1.326907, 0.3686275, 0, 1, 1,
0.6110659, 0.9007177, 2.379033, 0.372549, 0, 1, 1,
0.611456, 1.194826, 0.5483447, 0.3803922, 0, 1, 1,
0.6149528, -0.603983, 3.139882, 0.3843137, 0, 1, 1,
0.6288258, -0.2538512, 2.795857, 0.3921569, 0, 1, 1,
0.633342, -0.2496709, 0.2596397, 0.3960784, 0, 1, 1,
0.6347418, -0.3201428, 2.059294, 0.4039216, 0, 1, 1,
0.6366625, 1.219323, 0.5008916, 0.4117647, 0, 1, 1,
0.6367157, 1.459986, 0.6596232, 0.4156863, 0, 1, 1,
0.6376137, 1.160367, 1.619676, 0.4235294, 0, 1, 1,
0.6381871, -1.432704, 2.596543, 0.427451, 0, 1, 1,
0.6384461, 1.105806, 1.00194, 0.4352941, 0, 1, 1,
0.6386889, -0.3413117, 0.7116773, 0.4392157, 0, 1, 1,
0.6429694, 1.81028, -0.1145663, 0.4470588, 0, 1, 1,
0.6449095, -0.6600555, 2.097077, 0.4509804, 0, 1, 1,
0.6467941, -0.365124, 1.286927, 0.4588235, 0, 1, 1,
0.6506053, -1.291349, 3.078331, 0.4627451, 0, 1, 1,
0.6592695, 1.310368, 2.503503, 0.4705882, 0, 1, 1,
0.6652048, 2.053474, -0.3195065, 0.4745098, 0, 1, 1,
0.6659219, -0.1375495, 0.8592599, 0.4823529, 0, 1, 1,
0.6710147, -0.3309521, 1.123991, 0.4862745, 0, 1, 1,
0.6725609, -0.7606527, 2.365502, 0.4941176, 0, 1, 1,
0.6776597, -0.03823906, 0.259008, 0.5019608, 0, 1, 1,
0.6849778, -0.02205938, 1.707444, 0.5058824, 0, 1, 1,
0.6892048, 1.342356, -0.03325133, 0.5137255, 0, 1, 1,
0.6936806, 0.7068215, 0.8670868, 0.5176471, 0, 1, 1,
0.6953449, -0.7752758, 4.321712, 0.5254902, 0, 1, 1,
0.6972078, -1.552854, 3.868544, 0.5294118, 0, 1, 1,
0.6973027, -1.28344, 3.255009, 0.5372549, 0, 1, 1,
0.7023782, -0.5503211, 3.659678, 0.5411765, 0, 1, 1,
0.7100335, 0.4074767, -0.04712737, 0.5490196, 0, 1, 1,
0.7205315, 0.1690393, 0.9036146, 0.5529412, 0, 1, 1,
0.7213212, 1.44548, 0.9932327, 0.5607843, 0, 1, 1,
0.7223467, 0.1899476, 3.119476, 0.5647059, 0, 1, 1,
0.7243332, -1.384668, 1.226985, 0.572549, 0, 1, 1,
0.72689, 0.1304269, 2.48362, 0.5764706, 0, 1, 1,
0.733097, -0.2271374, 2.621701, 0.5843138, 0, 1, 1,
0.7342608, 0.7418505, 0.9240714, 0.5882353, 0, 1, 1,
0.7385889, -0.2949962, 2.15415, 0.5960785, 0, 1, 1,
0.7400941, -1.276738, 2.709884, 0.6039216, 0, 1, 1,
0.740256, 0.345237, 0.8191617, 0.6078432, 0, 1, 1,
0.7448143, 0.2729584, 1.223168, 0.6156863, 0, 1, 1,
0.7467394, -1.19936, 1.912138, 0.6196079, 0, 1, 1,
0.7518621, 0.5407047, -1.003943, 0.627451, 0, 1, 1,
0.7518762, 0.7564074, 0.1960271, 0.6313726, 0, 1, 1,
0.754372, 0.4641055, 0.301666, 0.6392157, 0, 1, 1,
0.7551468, 1.911126, 2.820472, 0.6431373, 0, 1, 1,
0.7621015, -0.9018682, 2.796069, 0.6509804, 0, 1, 1,
0.7645118, -0.5221626, 2.209142, 0.654902, 0, 1, 1,
0.7671663, -0.0718509, 2.813273, 0.6627451, 0, 1, 1,
0.7678288, -0.2623416, 1.716433, 0.6666667, 0, 1, 1,
0.7698933, -1.336373, 3.297906, 0.6745098, 0, 1, 1,
0.7741184, 0.7028202, 1.154624, 0.6784314, 0, 1, 1,
0.7817645, -0.3088463, 1.876686, 0.6862745, 0, 1, 1,
0.7865381, 0.4330713, 1.340872, 0.6901961, 0, 1, 1,
0.7878217, -1.104431, 1.997594, 0.6980392, 0, 1, 1,
0.7916866, 0.6273548, 0.2259635, 0.7058824, 0, 1, 1,
0.7947284, 0.2700128, 2.193631, 0.7098039, 0, 1, 1,
0.7963498, 0.5143056, 2.367429, 0.7176471, 0, 1, 1,
0.7976432, 0.2049045, 1.940774, 0.7215686, 0, 1, 1,
0.8003057, 0.8553155, 2.134796, 0.7294118, 0, 1, 1,
0.8026401, -0.9354656, 2.248099, 0.7333333, 0, 1, 1,
0.80941, 0.5093824, 2.204628, 0.7411765, 0, 1, 1,
0.8111125, 1.224883, 2.177342, 0.7450981, 0, 1, 1,
0.8169776, -1.103621, 2.214951, 0.7529412, 0, 1, 1,
0.8188996, -0.8014789, 2.902196, 0.7568628, 0, 1, 1,
0.8218591, -2.48286, 3.8379, 0.7647059, 0, 1, 1,
0.8225445, -0.6909215, 1.646165, 0.7686275, 0, 1, 1,
0.8250759, 1.001161, 0.7466435, 0.7764706, 0, 1, 1,
0.8252534, 0.537442, 2.184157, 0.7803922, 0, 1, 1,
0.8258344, -2.120872, 1.681631, 0.7882353, 0, 1, 1,
0.831513, -0.400304, 1.035453, 0.7921569, 0, 1, 1,
0.8321107, -1.677475, 3.095443, 0.8, 0, 1, 1,
0.8408945, -0.65605, 2.362326, 0.8078431, 0, 1, 1,
0.8424867, 0.9898021, -0.3873612, 0.8117647, 0, 1, 1,
0.8435479, 0.9668456, 0.9339575, 0.8196079, 0, 1, 1,
0.8466762, -0.4943556, 1.409139, 0.8235294, 0, 1, 1,
0.8487685, 0.09106261, 1.409062, 0.8313726, 0, 1, 1,
0.8548922, -1.508307, 2.700625, 0.8352941, 0, 1, 1,
0.8581905, -0.2068113, 1.304813, 0.8431373, 0, 1, 1,
0.8601261, 0.2630588, 0.2640722, 0.8470588, 0, 1, 1,
0.8625448, -0.4181453, 2.281043, 0.854902, 0, 1, 1,
0.8632662, -0.3723626, 0.5045038, 0.8588235, 0, 1, 1,
0.8633258, -0.6672376, 0.2751852, 0.8666667, 0, 1, 1,
0.865634, -0.1000784, 0.7757814, 0.8705882, 0, 1, 1,
0.8779802, 1.673502, -0.2173619, 0.8784314, 0, 1, 1,
0.8780293, 0.6228792, 0.2048667, 0.8823529, 0, 1, 1,
0.8860971, -0.2650203, 3.619056, 0.8901961, 0, 1, 1,
0.8868868, -1.863175, 1.340934, 0.8941177, 0, 1, 1,
0.8928723, -0.3139954, 1.534848, 0.9019608, 0, 1, 1,
0.9035691, -0.08490682, 0.4523411, 0.9098039, 0, 1, 1,
0.913869, 0.2794559, 2.105699, 0.9137255, 0, 1, 1,
0.9217934, -0.2428974, 2.451583, 0.9215686, 0, 1, 1,
0.9247358, -0.6571761, 1.355011, 0.9254902, 0, 1, 1,
0.9314252, 0.5451852, 0.04497943, 0.9333333, 0, 1, 1,
0.9374048, 0.7563756, 0.3440898, 0.9372549, 0, 1, 1,
0.9442101, 2.648109, -0.04959726, 0.945098, 0, 1, 1,
0.9500087, -0.9870255, 3.312054, 0.9490196, 0, 1, 1,
0.9605544, -0.5075379, 3.588906, 0.9568627, 0, 1, 1,
0.9618917, 2.7397, 1.996473, 0.9607843, 0, 1, 1,
0.9654073, -0.9397869, 0.2837349, 0.9686275, 0, 1, 1,
0.9660075, -2.431131, 2.657231, 0.972549, 0, 1, 1,
0.9683633, -0.8562337, 2.801919, 0.9803922, 0, 1, 1,
0.9692395, 1.341193, 1.553151, 0.9843137, 0, 1, 1,
0.9740172, 0.1470159, 1.583084, 0.9921569, 0, 1, 1,
0.9795524, -0.6598675, 2.873783, 0.9960784, 0, 1, 1,
0.9824702, 0.494366, 0.5152836, 1, 0, 0.9960784, 1,
0.9935728, 1.53591, -1.201571, 1, 0, 0.9882353, 1,
0.9963639, 0.05722328, -0.3284915, 1, 0, 0.9843137, 1,
0.9994944, -0.6621559, 1.511517, 1, 0, 0.9764706, 1,
1.011737, 1.743282, 0.7862276, 1, 0, 0.972549, 1,
1.013112, -0.5739366, 2.619151, 1, 0, 0.9647059, 1,
1.014277, 0.9900001, 3.750514, 1, 0, 0.9607843, 1,
1.0187, -0.6479083, -0.1218254, 1, 0, 0.9529412, 1,
1.034654, -0.3793312, 2.976026, 1, 0, 0.9490196, 1,
1.03635, 0.1176213, 1.807608, 1, 0, 0.9411765, 1,
1.040616, 0.4774159, 1.90574, 1, 0, 0.9372549, 1,
1.067229, 0.4471437, 1.628458, 1, 0, 0.9294118, 1,
1.071317, 0.4455762, 1.486894, 1, 0, 0.9254902, 1,
1.073093, -1.21839, 1.363624, 1, 0, 0.9176471, 1,
1.075703, 0.6020991, 0.3517281, 1, 0, 0.9137255, 1,
1.077181, -0.9084498, 0.6957169, 1, 0, 0.9058824, 1,
1.078506, -1.88609, 1.917391, 1, 0, 0.9019608, 1,
1.082339, 0.4860632, 0.5264047, 1, 0, 0.8941177, 1,
1.08596, 0.6804982, 2.393403, 1, 0, 0.8862745, 1,
1.087455, 0.3390421, -0.2786736, 1, 0, 0.8823529, 1,
1.093174, 1.967491, 0.6607032, 1, 0, 0.8745098, 1,
1.094739, 0.3171064, 2.116267, 1, 0, 0.8705882, 1,
1.098098, -2.226014, 2.042784, 1, 0, 0.8627451, 1,
1.105025, 0.727605, 1.50553, 1, 0, 0.8588235, 1,
1.117636, 1.156505, -0.6617715, 1, 0, 0.8509804, 1,
1.124569, -0.4016576, 2.546604, 1, 0, 0.8470588, 1,
1.124779, -0.4183011, 2.07892, 1, 0, 0.8392157, 1,
1.129165, 0.257234, 2.532675, 1, 0, 0.8352941, 1,
1.134056, 1.131658, 1.102693, 1, 0, 0.827451, 1,
1.138594, -0.5431707, 2.110508, 1, 0, 0.8235294, 1,
1.145681, 0.1282091, 2.17792, 1, 0, 0.8156863, 1,
1.146305, 1.610287, -0.07842366, 1, 0, 0.8117647, 1,
1.148754, 1.984689, 0.3771398, 1, 0, 0.8039216, 1,
1.151284, 0.0007425781, 1.944163, 1, 0, 0.7960784, 1,
1.154232, 0.3800177, 3.953078, 1, 0, 0.7921569, 1,
1.15652, 0.2735294, 1.914915, 1, 0, 0.7843137, 1,
1.16073, -1.083106, 3.786623, 1, 0, 0.7803922, 1,
1.161136, 1.23715, 0.8920512, 1, 0, 0.772549, 1,
1.162842, -0.7485983, -0.006954846, 1, 0, 0.7686275, 1,
1.16503, 0.3987609, 1.307063, 1, 0, 0.7607843, 1,
1.165088, 1.404993, 0.7425149, 1, 0, 0.7568628, 1,
1.166394, 0.2786115, -0.4580933, 1, 0, 0.7490196, 1,
1.167127, -0.8309125, 2.360074, 1, 0, 0.7450981, 1,
1.167892, 0.5167727, 0.1007073, 1, 0, 0.7372549, 1,
1.168818, 0.948921, 2.568241, 1, 0, 0.7333333, 1,
1.175428, 0.2852182, -0.2471277, 1, 0, 0.7254902, 1,
1.183259, -0.328872, 2.175899, 1, 0, 0.7215686, 1,
1.183583, 0.3266328, 1.234403, 1, 0, 0.7137255, 1,
1.188249, -0.1527857, 1.058621, 1, 0, 0.7098039, 1,
1.195321, 0.5186864, 2.20145, 1, 0, 0.7019608, 1,
1.217422, 0.08950575, 2.41696, 1, 0, 0.6941177, 1,
1.222613, 0.8756448, 1.226145, 1, 0, 0.6901961, 1,
1.226121, -0.6255571, 1.785901, 1, 0, 0.682353, 1,
1.22773, 0.504961, 2.026567, 1, 0, 0.6784314, 1,
1.227832, 0.2016044, 1.596558, 1, 0, 0.6705883, 1,
1.229004, 0.3387461, 2.242528, 1, 0, 0.6666667, 1,
1.230023, -0.158125, 1.755113, 1, 0, 0.6588235, 1,
1.234893, -1.444199, 2.554664, 1, 0, 0.654902, 1,
1.241084, 0.08934301, 1.639621, 1, 0, 0.6470588, 1,
1.248841, -1.410573, 3.595622, 1, 0, 0.6431373, 1,
1.250179, -0.6724684, 2.776989, 1, 0, 0.6352941, 1,
1.259668, 0.7658308, 1.715532, 1, 0, 0.6313726, 1,
1.269762, 0.3455719, 2.288949, 1, 0, 0.6235294, 1,
1.270267, -0.1417483, 1.408267, 1, 0, 0.6196079, 1,
1.273695, -1.49731, 2.635288, 1, 0, 0.6117647, 1,
1.282047, 1.084147, 1.495669, 1, 0, 0.6078432, 1,
1.286232, -0.7688169, 2.999537, 1, 0, 0.6, 1,
1.288838, 0.7499191, 0.3454211, 1, 0, 0.5921569, 1,
1.292235, -0.6815041, 1.574978, 1, 0, 0.5882353, 1,
1.293426, -0.008563457, 0.2961236, 1, 0, 0.5803922, 1,
1.30215, 1.508737, 0.3349831, 1, 0, 0.5764706, 1,
1.309868, -0.04945913, 3.448488, 1, 0, 0.5686275, 1,
1.317436, -0.6683798, 3.496242, 1, 0, 0.5647059, 1,
1.320856, -0.5190079, -0.564114, 1, 0, 0.5568628, 1,
1.324529, 0.4424794, 1.166618, 1, 0, 0.5529412, 1,
1.327441, 0.4334651, -0.03982391, 1, 0, 0.5450981, 1,
1.337185, 0.9253512, 0.1459291, 1, 0, 0.5411765, 1,
1.358868, -1.584126, 2.417497, 1, 0, 0.5333334, 1,
1.367098, -0.2743228, 2.312092, 1, 0, 0.5294118, 1,
1.375129, -0.7562104, 3.611804, 1, 0, 0.5215687, 1,
1.386552, 0.8822351, -0.8198653, 1, 0, 0.5176471, 1,
1.388153, -2.664731, 2.755125, 1, 0, 0.509804, 1,
1.388385, -0.002992294, 2.963028, 1, 0, 0.5058824, 1,
1.395498, 0.8727997, -0.798112, 1, 0, 0.4980392, 1,
1.414155, 0.6909477, 1.990169, 1, 0, 0.4901961, 1,
1.42004, 0.3747894, 1.400256, 1, 0, 0.4862745, 1,
1.422083, 0.274877, 0.2312568, 1, 0, 0.4784314, 1,
1.423128, -0.01361252, 2.851252, 1, 0, 0.4745098, 1,
1.429491, 0.2996036, 2.452386, 1, 0, 0.4666667, 1,
1.4331, 0.7964059, 1.074606, 1, 0, 0.4627451, 1,
1.436086, 0.2341089, -0.1006479, 1, 0, 0.454902, 1,
1.439821, -0.2762826, 3.321349, 1, 0, 0.4509804, 1,
1.445238, 0.1817259, 0.7395179, 1, 0, 0.4431373, 1,
1.45201, 0.1077982, 1.520774, 1, 0, 0.4392157, 1,
1.453384, -0.9220696, 3.018873, 1, 0, 0.4313726, 1,
1.455255, 1.27458, 1.957616, 1, 0, 0.427451, 1,
1.460235, 0.0676913, 3.759808, 1, 0, 0.4196078, 1,
1.467402, -0.8052784, 1.831228, 1, 0, 0.4156863, 1,
1.487149, -0.0779009, 1.086668, 1, 0, 0.4078431, 1,
1.490245, -0.01667414, 0.6990474, 1, 0, 0.4039216, 1,
1.490942, -0.02196206, 1.277738, 1, 0, 0.3960784, 1,
1.507214, 1.32958, 1.392088, 1, 0, 0.3882353, 1,
1.509437, 0.9248188, 2.161211, 1, 0, 0.3843137, 1,
1.512093, 1.004321, 1.014259, 1, 0, 0.3764706, 1,
1.517232, 0.667666, 1.149877, 1, 0, 0.372549, 1,
1.517552, 0.6523766, 1.174888, 1, 0, 0.3647059, 1,
1.521821, -0.366048, 1.870295, 1, 0, 0.3607843, 1,
1.528901, -1.236265, 1.170628, 1, 0, 0.3529412, 1,
1.544971, -2.435821, 1.854023, 1, 0, 0.3490196, 1,
1.558948, 0.7739359, 2.420563, 1, 0, 0.3411765, 1,
1.566633, -0.4639268, 2.722445, 1, 0, 0.3372549, 1,
1.574493, 0.4141093, -0.1496587, 1, 0, 0.3294118, 1,
1.580732, -0.1112381, 1.043242, 1, 0, 0.3254902, 1,
1.585272, 0.8912382, 1.193977, 1, 0, 0.3176471, 1,
1.585308, 0.8142836, 2.585356, 1, 0, 0.3137255, 1,
1.608717, 0.08388189, 1.311966, 1, 0, 0.3058824, 1,
1.609576, -0.6292527, 0.3282264, 1, 0, 0.2980392, 1,
1.635673, -0.5106146, 4.665842, 1, 0, 0.2941177, 1,
1.637719, -0.1191548, 1.246813, 1, 0, 0.2862745, 1,
1.661128, 0.5949467, 0.3907009, 1, 0, 0.282353, 1,
1.684196, 0.9911785, 1.941769, 1, 0, 0.2745098, 1,
1.715282, -0.6010173, 0.9228772, 1, 0, 0.2705882, 1,
1.721038, -1.357324, 1.692406, 1, 0, 0.2627451, 1,
1.732287, 1.409303, -0.8724858, 1, 0, 0.2588235, 1,
1.763075, 0.1720395, 2.623895, 1, 0, 0.2509804, 1,
1.771082, 0.6475165, 1.204657, 1, 0, 0.2470588, 1,
1.774128, 0.881017, -0.5392058, 1, 0, 0.2392157, 1,
1.776089, -0.3647484, 3.549226, 1, 0, 0.2352941, 1,
1.788182, 0.3742724, 3.018468, 1, 0, 0.227451, 1,
1.788824, -0.4634189, 3.039438, 1, 0, 0.2235294, 1,
1.801046, 0.03251436, 2.013527, 1, 0, 0.2156863, 1,
1.801351, 0.5759197, -0.9845694, 1, 0, 0.2117647, 1,
1.810911, 1.751207, 1.675425, 1, 0, 0.2039216, 1,
1.841334, -0.7052011, 0.3521931, 1, 0, 0.1960784, 1,
1.870754, 1.841201, 1.444382, 1, 0, 0.1921569, 1,
1.876771, -0.8114162, 1.634107, 1, 0, 0.1843137, 1,
1.88759, -1.641441, 1.14388, 1, 0, 0.1803922, 1,
1.889483, -1.327087, 2.494727, 1, 0, 0.172549, 1,
1.894308, -0.4516735, 0.7319384, 1, 0, 0.1686275, 1,
1.904002, 1.065923, 1.111959, 1, 0, 0.1607843, 1,
1.927939, 0.6732863, 2.782807, 1, 0, 0.1568628, 1,
1.930908, 0.4356878, 1.981741, 1, 0, 0.1490196, 1,
1.949529, 0.4399273, 0.4370968, 1, 0, 0.145098, 1,
1.957559, 0.2246974, 1.316229, 1, 0, 0.1372549, 1,
1.98892, 0.4615409, 0.7454898, 1, 0, 0.1333333, 1,
1.990679, 1.029669, 1.802667, 1, 0, 0.1254902, 1,
2.001289, 0.1449482, -0.02422586, 1, 0, 0.1215686, 1,
2.015427, 0.5998253, 1.405305, 1, 0, 0.1137255, 1,
2.021464, 1.468554, 2.158752, 1, 0, 0.1098039, 1,
2.042135, -0.6295865, 1.795957, 1, 0, 0.1019608, 1,
2.042595, -1.115915, 1.392144, 1, 0, 0.09411765, 1,
2.053146, -0.7355325, 2.20928, 1, 0, 0.09019608, 1,
2.064165, 1.214858, -0.3976746, 1, 0, 0.08235294, 1,
2.203276, -0.8555176, 1.923347, 1, 0, 0.07843138, 1,
2.250254, -2.67182, 2.106889, 1, 0, 0.07058824, 1,
2.303507, 0.1503939, 0.7555982, 1, 0, 0.06666667, 1,
2.314184, 0.385472, 0.132134, 1, 0, 0.05882353, 1,
2.349648, -0.07878857, 1.68244, 1, 0, 0.05490196, 1,
2.381415, -2.147666, 1.283915, 1, 0, 0.04705882, 1,
2.430798, 0.353358, 4.183975, 1, 0, 0.04313726, 1,
2.47889, -0.8605988, 2.115443, 1, 0, 0.03529412, 1,
2.504006, 0.5935723, 1.670177, 1, 0, 0.03137255, 1,
2.529153, 0.9300291, -0.3172224, 1, 0, 0.02352941, 1,
2.635451, -0.372756, 1.489559, 1, 0, 0.01960784, 1,
2.69219, 0.118858, 0.381283, 1, 0, 0.01176471, 1,
3.048065, -0.5019605, 2.791301, 1, 0, 0.007843138, 1
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
0.1377783, -4.319488, -7.255561, 0, -0.5, 0.5, 0.5,
0.1377783, -4.319488, -7.255561, 1, -0.5, 0.5, 0.5,
0.1377783, -4.319488, -7.255561, 1, 1.5, 0.5, 0.5,
0.1377783, -4.319488, -7.255561, 0, 1.5, 0.5, 0.5
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
-3.759096, 0.101367, -7.255561, 0, -0.5, 0.5, 0.5,
-3.759096, 0.101367, -7.255561, 1, -0.5, 0.5, 0.5,
-3.759096, 0.101367, -7.255561, 1, 1.5, 0.5, 0.5,
-3.759096, 0.101367, -7.255561, 0, 1.5, 0.5, 0.5
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
-3.759096, -4.319488, -0.3547089, 0, -0.5, 0.5, 0.5,
-3.759096, -4.319488, -0.3547089, 1, -0.5, 0.5, 0.5,
-3.759096, -4.319488, -0.3547089, 1, 1.5, 0.5, 0.5,
-3.759096, -4.319488, -0.3547089, 0, 1.5, 0.5, 0.5
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
-2, -3.299291, -5.663057,
3, -3.299291, -5.663057,
-2, -3.299291, -5.663057,
-2, -3.469324, -5.928474,
-1, -3.299291, -5.663057,
-1, -3.469324, -5.928474,
0, -3.299291, -5.663057,
0, -3.469324, -5.928474,
1, -3.299291, -5.663057,
1, -3.469324, -5.928474,
2, -3.299291, -5.663057,
2, -3.469324, -5.928474,
3, -3.299291, -5.663057,
3, -3.469324, -5.928474
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
-2, -3.80939, -6.459309, 0, -0.5, 0.5, 0.5,
-2, -3.80939, -6.459309, 1, -0.5, 0.5, 0.5,
-2, -3.80939, -6.459309, 1, 1.5, 0.5, 0.5,
-2, -3.80939, -6.459309, 0, 1.5, 0.5, 0.5,
-1, -3.80939, -6.459309, 0, -0.5, 0.5, 0.5,
-1, -3.80939, -6.459309, 1, -0.5, 0.5, 0.5,
-1, -3.80939, -6.459309, 1, 1.5, 0.5, 0.5,
-1, -3.80939, -6.459309, 0, 1.5, 0.5, 0.5,
0, -3.80939, -6.459309, 0, -0.5, 0.5, 0.5,
0, -3.80939, -6.459309, 1, -0.5, 0.5, 0.5,
0, -3.80939, -6.459309, 1, 1.5, 0.5, 0.5,
0, -3.80939, -6.459309, 0, 1.5, 0.5, 0.5,
1, -3.80939, -6.459309, 0, -0.5, 0.5, 0.5,
1, -3.80939, -6.459309, 1, -0.5, 0.5, 0.5,
1, -3.80939, -6.459309, 1, 1.5, 0.5, 0.5,
1, -3.80939, -6.459309, 0, 1.5, 0.5, 0.5,
2, -3.80939, -6.459309, 0, -0.5, 0.5, 0.5,
2, -3.80939, -6.459309, 1, -0.5, 0.5, 0.5,
2, -3.80939, -6.459309, 1, 1.5, 0.5, 0.5,
2, -3.80939, -6.459309, 0, 1.5, 0.5, 0.5,
3, -3.80939, -6.459309, 0, -0.5, 0.5, 0.5,
3, -3.80939, -6.459309, 1, -0.5, 0.5, 0.5,
3, -3.80939, -6.459309, 1, 1.5, 0.5, 0.5,
3, -3.80939, -6.459309, 0, 1.5, 0.5, 0.5
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
-2.859817, -3, -5.663057,
-2.859817, 3, -5.663057,
-2.859817, -3, -5.663057,
-3.009697, -3, -5.928474,
-2.859817, -2, -5.663057,
-3.009697, -2, -5.928474,
-2.859817, -1, -5.663057,
-3.009697, -1, -5.928474,
-2.859817, 0, -5.663057,
-3.009697, 0, -5.928474,
-2.859817, 1, -5.663057,
-3.009697, 1, -5.928474,
-2.859817, 2, -5.663057,
-3.009697, 2, -5.928474,
-2.859817, 3, -5.663057,
-3.009697, 3, -5.928474
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
-3.309456, -3, -6.459309, 0, -0.5, 0.5, 0.5,
-3.309456, -3, -6.459309, 1, -0.5, 0.5, 0.5,
-3.309456, -3, -6.459309, 1, 1.5, 0.5, 0.5,
-3.309456, -3, -6.459309, 0, 1.5, 0.5, 0.5,
-3.309456, -2, -6.459309, 0, -0.5, 0.5, 0.5,
-3.309456, -2, -6.459309, 1, -0.5, 0.5, 0.5,
-3.309456, -2, -6.459309, 1, 1.5, 0.5, 0.5,
-3.309456, -2, -6.459309, 0, 1.5, 0.5, 0.5,
-3.309456, -1, -6.459309, 0, -0.5, 0.5, 0.5,
-3.309456, -1, -6.459309, 1, -0.5, 0.5, 0.5,
-3.309456, -1, -6.459309, 1, 1.5, 0.5, 0.5,
-3.309456, -1, -6.459309, 0, 1.5, 0.5, 0.5,
-3.309456, 0, -6.459309, 0, -0.5, 0.5, 0.5,
-3.309456, 0, -6.459309, 1, -0.5, 0.5, 0.5,
-3.309456, 0, -6.459309, 1, 1.5, 0.5, 0.5,
-3.309456, 0, -6.459309, 0, 1.5, 0.5, 0.5,
-3.309456, 1, -6.459309, 0, -0.5, 0.5, 0.5,
-3.309456, 1, -6.459309, 1, -0.5, 0.5, 0.5,
-3.309456, 1, -6.459309, 1, 1.5, 0.5, 0.5,
-3.309456, 1, -6.459309, 0, 1.5, 0.5, 0.5,
-3.309456, 2, -6.459309, 0, -0.5, 0.5, 0.5,
-3.309456, 2, -6.459309, 1, -0.5, 0.5, 0.5,
-3.309456, 2, -6.459309, 1, 1.5, 0.5, 0.5,
-3.309456, 2, -6.459309, 0, 1.5, 0.5, 0.5,
-3.309456, 3, -6.459309, 0, -0.5, 0.5, 0.5,
-3.309456, 3, -6.459309, 1, -0.5, 0.5, 0.5,
-3.309456, 3, -6.459309, 1, 1.5, 0.5, 0.5,
-3.309456, 3, -6.459309, 0, 1.5, 0.5, 0.5
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
-2.859817, -3.299291, -4,
-2.859817, -3.299291, 4,
-2.859817, -3.299291, -4,
-3.009697, -3.469324, -4,
-2.859817, -3.299291, -2,
-3.009697, -3.469324, -2,
-2.859817, -3.299291, 0,
-3.009697, -3.469324, 0,
-2.859817, -3.299291, 2,
-3.009697, -3.469324, 2,
-2.859817, -3.299291, 4,
-3.009697, -3.469324, 4
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
-3.309456, -3.80939, -4, 0, -0.5, 0.5, 0.5,
-3.309456, -3.80939, -4, 1, -0.5, 0.5, 0.5,
-3.309456, -3.80939, -4, 1, 1.5, 0.5, 0.5,
-3.309456, -3.80939, -4, 0, 1.5, 0.5, 0.5,
-3.309456, -3.80939, -2, 0, -0.5, 0.5, 0.5,
-3.309456, -3.80939, -2, 1, -0.5, 0.5, 0.5,
-3.309456, -3.80939, -2, 1, 1.5, 0.5, 0.5,
-3.309456, -3.80939, -2, 0, 1.5, 0.5, 0.5,
-3.309456, -3.80939, 0, 0, -0.5, 0.5, 0.5,
-3.309456, -3.80939, 0, 1, -0.5, 0.5, 0.5,
-3.309456, -3.80939, 0, 1, 1.5, 0.5, 0.5,
-3.309456, -3.80939, 0, 0, 1.5, 0.5, 0.5,
-3.309456, -3.80939, 2, 0, -0.5, 0.5, 0.5,
-3.309456, -3.80939, 2, 1, -0.5, 0.5, 0.5,
-3.309456, -3.80939, 2, 1, 1.5, 0.5, 0.5,
-3.309456, -3.80939, 2, 0, 1.5, 0.5, 0.5,
-3.309456, -3.80939, 4, 0, -0.5, 0.5, 0.5,
-3.309456, -3.80939, 4, 1, -0.5, 0.5, 0.5,
-3.309456, -3.80939, 4, 1, 1.5, 0.5, 0.5,
-3.309456, -3.80939, 4, 0, 1.5, 0.5, 0.5
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
-2.859817, -3.299291, -5.663057,
-2.859817, 3.502025, -5.663057,
-2.859817, -3.299291, 4.953639,
-2.859817, 3.502025, 4.953639,
-2.859817, -3.299291, -5.663057,
-2.859817, -3.299291, 4.953639,
-2.859817, 3.502025, -5.663057,
-2.859817, 3.502025, 4.953639,
-2.859817, -3.299291, -5.663057,
3.135374, -3.299291, -5.663057,
-2.859817, -3.299291, 4.953639,
3.135374, -3.299291, 4.953639,
-2.859817, 3.502025, -5.663057,
3.135374, 3.502025, -5.663057,
-2.859817, 3.502025, 4.953639,
3.135374, 3.502025, 4.953639,
3.135374, -3.299291, -5.663057,
3.135374, 3.502025, -5.663057,
3.135374, -3.299291, 4.953639,
3.135374, 3.502025, 4.953639,
3.135374, -3.299291, -5.663057,
3.135374, -3.299291, 4.953639,
3.135374, 3.502025, -5.663057,
3.135374, 3.502025, 4.953639
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
var radius = 7.454997;
var distance = 33.16813;
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
mvMatrix.translate( -0.1377783, -0.101367, 0.3547089 );
mvMatrix.scale( 1.344493, 1.185137, 0.7592276 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.16813);
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
clothianidin<-read.table("clothianidin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-clothianidin$V2
```

```
## Error in eval(expr, envir, enclos): object 'clothianidin' not found
```

```r
y<-clothianidin$V3
```

```
## Error in eval(expr, envir, enclos): object 'clothianidin' not found
```

```r
z<-clothianidin$V4
```

```
## Error in eval(expr, envir, enclos): object 'clothianidin' not found
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
-2.772508, -1.355238, -0.866304, 0, 0, 1, 1, 1,
-2.729077, 1.75829, -0.9975204, 1, 0, 0, 1, 1,
-2.728161, -0.145871, -2.93157, 1, 0, 0, 1, 1,
-2.691037, 0.6119332, -1.189325, 1, 0, 0, 1, 1,
-2.624364, 0.7333269, -2.111794, 1, 0, 0, 1, 1,
-2.592332, 1.879019, 0.6033123, 1, 0, 0, 1, 1,
-2.563456, 1.211202, -1.580955, 0, 0, 0, 1, 1,
-2.556882, 1.630857, -2.325837, 0, 0, 0, 1, 1,
-2.356384, 1.66606, -0.9259856, 0, 0, 0, 1, 1,
-2.355201, -1.39285, -1.748843, 0, 0, 0, 1, 1,
-2.328478, 1.826428, -0.6461422, 0, 0, 0, 1, 1,
-2.274782, -0.8186173, -2.712714, 0, 0, 0, 1, 1,
-2.248714, 0.7057871, -0.7957785, 0, 0, 0, 1, 1,
-2.223897, 0.5933996, -2.295242, 1, 1, 1, 1, 1,
-2.223871, -0.4872989, -5.508445, 1, 1, 1, 1, 1,
-2.151341, 0.5261617, -1.253486, 1, 1, 1, 1, 1,
-2.124674, -1.628459, -2.371993, 1, 1, 1, 1, 1,
-2.123398, 0.7726606, -2.076583, 1, 1, 1, 1, 1,
-2.105323, -1.126617, -1.52778, 1, 1, 1, 1, 1,
-2.100697, 0.6129874, 0.06020929, 1, 1, 1, 1, 1,
-2.093193, -0.2462156, -2.190101, 1, 1, 1, 1, 1,
-2.089372, -1.553195, -3.477338, 1, 1, 1, 1, 1,
-2.069388, -0.4830872, -2.159647, 1, 1, 1, 1, 1,
-2.062934, -1.244618, -3.469054, 1, 1, 1, 1, 1,
-2.038499, 0.7869976, -0.4213281, 1, 1, 1, 1, 1,
-2.035488, 0.6011226, -2.272196, 1, 1, 1, 1, 1,
-2.035141, -0.9257188, -1.928012, 1, 1, 1, 1, 1,
-2.030322, -0.1487773, 0.672929, 1, 1, 1, 1, 1,
-2.024614, 1.802155, -0.1953982, 0, 0, 1, 1, 1,
-2.023661, 1.333873, -2.590219, 1, 0, 0, 1, 1,
-2.019359, 0.8334928, -1.554907, 1, 0, 0, 1, 1,
-1.985462, -0.7394331, -3.036659, 1, 0, 0, 1, 1,
-1.978748, -0.2642657, -1.554125, 1, 0, 0, 1, 1,
-1.976643, 0.6801543, -0.4645753, 1, 0, 0, 1, 1,
-1.971009, -0.6252985, -3.516389, 0, 0, 0, 1, 1,
-1.951047, 0.02677581, -2.62397, 0, 0, 0, 1, 1,
-1.912366, 0.5640934, -0.2055771, 0, 0, 0, 1, 1,
-1.853228, 1.052189, -1.861606, 0, 0, 0, 1, 1,
-1.806498, -0.8584717, -1.307421, 0, 0, 0, 1, 1,
-1.802309, -0.3385936, -2.333104, 0, 0, 0, 1, 1,
-1.774707, -0.8869161, -3.268378, 0, 0, 0, 1, 1,
-1.768918, 0.09336963, -2.627271, 1, 1, 1, 1, 1,
-1.766251, 0.3448725, -1.56432, 1, 1, 1, 1, 1,
-1.765212, 1.747707, -0.5175898, 1, 1, 1, 1, 1,
-1.756527, 0.3069729, -1.074851, 1, 1, 1, 1, 1,
-1.730618, 0.7611616, -1.408865, 1, 1, 1, 1, 1,
-1.694611, 1.014103, 0.02484115, 1, 1, 1, 1, 1,
-1.690644, 0.07213291, 0.2026877, 1, 1, 1, 1, 1,
-1.689313, -0.115201, -0.4592921, 1, 1, 1, 1, 1,
-1.681675, -0.3744819, -2.512628, 1, 1, 1, 1, 1,
-1.65441, -0.007941972, -1.666999, 1, 1, 1, 1, 1,
-1.653272, 0.4969705, -1.747073, 1, 1, 1, 1, 1,
-1.631789, 0.3472015, -1.078059, 1, 1, 1, 1, 1,
-1.629106, 0.9996747, -0.856625, 1, 1, 1, 1, 1,
-1.620646, -0.3465887, -1.658824, 1, 1, 1, 1, 1,
-1.61886, 0.320226, -1.705814, 1, 1, 1, 1, 1,
-1.614998, -0.6549904, -2.374122, 0, 0, 1, 1, 1,
-1.607644, 1.285628, -1.686257, 1, 0, 0, 1, 1,
-1.607459, 2.027785, -1.799575, 1, 0, 0, 1, 1,
-1.604889, 0.8131963, -0.7427473, 1, 0, 0, 1, 1,
-1.601693, 0.7473509, -0.8985631, 1, 0, 0, 1, 1,
-1.599243, 0.2804128, 0.4068016, 1, 0, 0, 1, 1,
-1.59837, -0.7992603, -2.014184, 0, 0, 0, 1, 1,
-1.583941, -0.6113878, -2.515738, 0, 0, 0, 1, 1,
-1.575794, 2.462753, 0.2794264, 0, 0, 0, 1, 1,
-1.56814, 0.5254281, -2.397702, 0, 0, 0, 1, 1,
-1.557316, -1.019519, -1.630557, 0, 0, 0, 1, 1,
-1.539199, -0.7159138, -2.686335, 0, 0, 0, 1, 1,
-1.531124, 0.7327468, -0.6562651, 0, 0, 0, 1, 1,
-1.52498, 0.2955312, -2.564577, 1, 1, 1, 1, 1,
-1.51573, -0.125864, -0.390425, 1, 1, 1, 1, 1,
-1.513696, -0.4265066, -1.49477, 1, 1, 1, 1, 1,
-1.509912, -1.029226, -1.07593, 1, 1, 1, 1, 1,
-1.500318, -0.2973399, -2.16448, 1, 1, 1, 1, 1,
-1.50027, -0.6448264, -1.692253, 1, 1, 1, 1, 1,
-1.497308, 1.239935, -0.05717038, 1, 1, 1, 1, 1,
-1.492527, -0.2014482, -1.617278, 1, 1, 1, 1, 1,
-1.490331, -2.100783, -2.10357, 1, 1, 1, 1, 1,
-1.483025, 1.527179, 0.02202633, 1, 1, 1, 1, 1,
-1.476951, 0.7643544, -0.4989055, 1, 1, 1, 1, 1,
-1.469973, 0.5319389, -1.403968, 1, 1, 1, 1, 1,
-1.465932, -1.497565, -4.18588, 1, 1, 1, 1, 1,
-1.46152, 1.305032, -1.487707, 1, 1, 1, 1, 1,
-1.45562, -1.12209, -3.176652, 1, 1, 1, 1, 1,
-1.454732, 1.089798, -0.2316699, 0, 0, 1, 1, 1,
-1.45042, 1.063366, -0.7213806, 1, 0, 0, 1, 1,
-1.433337, 1.29318, -1.144497, 1, 0, 0, 1, 1,
-1.405115, 2.789756, -1.598741, 1, 0, 0, 1, 1,
-1.396214, -0.4389925, -0.3441983, 1, 0, 0, 1, 1,
-1.395166, -1.569807, -2.257538, 1, 0, 0, 1, 1,
-1.386823, -0.20782, -1.45743, 0, 0, 0, 1, 1,
-1.379327, 0.9153718, -0.2050489, 0, 0, 0, 1, 1,
-1.379022, -0.5578973, -0.8215097, 0, 0, 0, 1, 1,
-1.37113, -0.9253513, -2.693982, 0, 0, 0, 1, 1,
-1.359743, 2.185308, 1.030511, 0, 0, 0, 1, 1,
-1.356383, -0.2542318, -1.730471, 0, 0, 0, 1, 1,
-1.355306, -1.073769, -3.246462, 0, 0, 0, 1, 1,
-1.335717, -1.211768, -4.853841, 1, 1, 1, 1, 1,
-1.328488, -0.5496251, -4.16255, 1, 1, 1, 1, 1,
-1.328091, 0.9122411, -1.616912, 1, 1, 1, 1, 1,
-1.321861, -0.497267, -1.240025, 1, 1, 1, 1, 1,
-1.319482, 0.9330332, -0.01071719, 1, 1, 1, 1, 1,
-1.319329, 0.1205445, -0.7783248, 1, 1, 1, 1, 1,
-1.308757, 0.5509713, -2.026873, 1, 1, 1, 1, 1,
-1.298113, 0.3525827, -0.1358841, 1, 1, 1, 1, 1,
-1.289549, 0.04152531, -2.368908, 1, 1, 1, 1, 1,
-1.289161, 1.564778, -1.139446, 1, 1, 1, 1, 1,
-1.282057, -0.1351456, -0.3792447, 1, 1, 1, 1, 1,
-1.275381, -0.933713, -2.782172, 1, 1, 1, 1, 1,
-1.275334, 0.9128898, -0.6380249, 1, 1, 1, 1, 1,
-1.266875, -0.01973717, -0.4883761, 1, 1, 1, 1, 1,
-1.265366, -0.2478956, -1.973176, 1, 1, 1, 1, 1,
-1.245254, -0.8152463, -2.106422, 0, 0, 1, 1, 1,
-1.245133, 1.839544, -0.02285029, 1, 0, 0, 1, 1,
-1.237267, -0.1287247, -1.968027, 1, 0, 0, 1, 1,
-1.230216, 0.2844605, -2.726589, 1, 0, 0, 1, 1,
-1.228534, 0.5776378, -1.062396, 1, 0, 0, 1, 1,
-1.228352, 0.00122618, -0.1386005, 1, 0, 0, 1, 1,
-1.22296, -0.6716129, 0.2005931, 0, 0, 0, 1, 1,
-1.222393, 2.057525, -1.52872, 0, 0, 0, 1, 1,
-1.212923, -0.4662999, -2.339701, 0, 0, 0, 1, 1,
-1.209174, -1.503085, -2.426007, 0, 0, 0, 1, 1,
-1.202589, 0.4086044, -1.689862, 0, 0, 0, 1, 1,
-1.192782, 0.6024274, -2.019007, 0, 0, 0, 1, 1,
-1.188618, -1.125686, -2.876125, 0, 0, 0, 1, 1,
-1.180993, -1.201452, -2.262496, 1, 1, 1, 1, 1,
-1.17951, 0.9397941, -0.9555851, 1, 1, 1, 1, 1,
-1.177705, -0.4089246, -2.240585, 1, 1, 1, 1, 1,
-1.172034, -1.014817, -4.04454, 1, 1, 1, 1, 1,
-1.161801, 3.074611, -1.777204, 1, 1, 1, 1, 1,
-1.156836, -0.7571718, -2.992086, 1, 1, 1, 1, 1,
-1.152155, -1.048116, -2.405891, 1, 1, 1, 1, 1,
-1.149148, 0.1821503, -1.851758, 1, 1, 1, 1, 1,
-1.148899, -0.3898085, -1.567952, 1, 1, 1, 1, 1,
-1.141318, 0.4040459, -3.06161, 1, 1, 1, 1, 1,
-1.140798, 0.7233493, -0.430511, 1, 1, 1, 1, 1,
-1.139016, 0.3885733, -0.3595201, 1, 1, 1, 1, 1,
-1.137704, -0.03609594, 1.216652, 1, 1, 1, 1, 1,
-1.129586, -2.384583, -3.246733, 1, 1, 1, 1, 1,
-1.12127, -0.5162787, -2.290156, 1, 1, 1, 1, 1,
-1.121195, 0.4120898, -0.3976867, 0, 0, 1, 1, 1,
-1.116726, -0.5078961, -1.526212, 1, 0, 0, 1, 1,
-1.110996, 1.585033, -0.7813711, 1, 0, 0, 1, 1,
-1.109403, -1.178956, -4.218427, 1, 0, 0, 1, 1,
-1.10765, -0.9814495, -2.864027, 1, 0, 0, 1, 1,
-1.091874, -0.1829735, -0.5923195, 1, 0, 0, 1, 1,
-1.091624, 0.4554547, -1.635721, 0, 0, 0, 1, 1,
-1.090834, 0.06176347, -2.331644, 0, 0, 0, 1, 1,
-1.086524, 0.1820717, 0.183595, 0, 0, 0, 1, 1,
-1.08576, -1.013335, -0.6440948, 0, 0, 0, 1, 1,
-1.081377, 0.1470466, -3.062118, 0, 0, 0, 1, 1,
-1.071871, -0.9105929, -2.81228, 0, 0, 0, 1, 1,
-1.064714, 0.01083454, -1.501951, 0, 0, 0, 1, 1,
-1.064302, 0.1141709, -1.483652, 1, 1, 1, 1, 1,
-1.060036, 0.3279823, -1.364358, 1, 1, 1, 1, 1,
-1.052349, -1.774408, -2.213727, 1, 1, 1, 1, 1,
-1.050394, -1.09291, -2.792305, 1, 1, 1, 1, 1,
-1.04917, 0.07659607, 0.2782707, 1, 1, 1, 1, 1,
-1.038739, 0.538977, -0.5244963, 1, 1, 1, 1, 1,
-1.031014, -0.8025163, -0.421192, 1, 1, 1, 1, 1,
-1.017202, -0.8461927, -4.307433, 1, 1, 1, 1, 1,
-1.01511, -0.4132996, -1.871541, 1, 1, 1, 1, 1,
-1.003343, 0.3211352, -2.094018, 1, 1, 1, 1, 1,
-0.998451, 1.495686, -0.6282208, 1, 1, 1, 1, 1,
-0.9955628, 1.12364, -1.825895, 1, 1, 1, 1, 1,
-0.9888343, 0.546779, -1.792904, 1, 1, 1, 1, 1,
-0.9883782, -0.7608063, -2.673838, 1, 1, 1, 1, 1,
-0.9881282, -1.052683, -3.989197, 1, 1, 1, 1, 1,
-0.982915, 0.2708413, -2.507932, 0, 0, 1, 1, 1,
-0.9768383, -0.4367847, -2.781923, 1, 0, 0, 1, 1,
-0.9758438, -0.8697107, -2.293299, 1, 0, 0, 1, 1,
-0.9741579, -0.3647908, -3.696579, 1, 0, 0, 1, 1,
-0.9643849, -1.226528, -1.120052, 1, 0, 0, 1, 1,
-0.9633886, 1.258869, -1.859623, 1, 0, 0, 1, 1,
-0.9621938, -0.1168891, -2.545263, 0, 0, 0, 1, 1,
-0.9545023, 0.3222094, -0.9994535, 0, 0, 0, 1, 1,
-0.9487309, 0.3843921, 0.3190495, 0, 0, 0, 1, 1,
-0.9460543, -1.190957, -2.582989, 0, 0, 0, 1, 1,
-0.9424218, 1.014786, -1.599991, 0, 0, 0, 1, 1,
-0.9331608, 1.74657, -0.1312168, 0, 0, 0, 1, 1,
-0.9304851, 0.7510301, -2.22841, 0, 0, 0, 1, 1,
-0.9282117, 1.082194, -1.417235, 1, 1, 1, 1, 1,
-0.9246383, 1.353044, 0.8534595, 1, 1, 1, 1, 1,
-0.9221039, -1.127227, -1.438205, 1, 1, 1, 1, 1,
-0.9219207, -0.8083637, -2.186867, 1, 1, 1, 1, 1,
-0.9201757, -1.42525, -2.807942, 1, 1, 1, 1, 1,
-0.9145963, 1.589526, 0.3927892, 1, 1, 1, 1, 1,
-0.913992, 1.242659, -1.411021, 1, 1, 1, 1, 1,
-0.9135578, -1.332403, -2.994365, 1, 1, 1, 1, 1,
-0.9123681, 0.2511533, -1.1683, 1, 1, 1, 1, 1,
-0.9119918, 1.996924, -0.9443668, 1, 1, 1, 1, 1,
-0.9067194, 2.991105, 0.6244301, 1, 1, 1, 1, 1,
-0.9048601, 1.238945, -0.8179992, 1, 1, 1, 1, 1,
-0.902279, 1.435588, -0.1677745, 1, 1, 1, 1, 1,
-0.9011557, -0.1597586, -1.903512, 1, 1, 1, 1, 1,
-0.8999571, -0.1312773, -1.900288, 1, 1, 1, 1, 1,
-0.8982663, 0.0002487727, -1.401865, 0, 0, 1, 1, 1,
-0.8899575, -1.715571, -2.928933, 1, 0, 0, 1, 1,
-0.8885363, 0.7447015, -1.073581, 1, 0, 0, 1, 1,
-0.8881156, -0.8541408, -2.975728, 1, 0, 0, 1, 1,
-0.8806384, -0.5032786, -0.7895389, 1, 0, 0, 1, 1,
-0.8740473, 2.380253, 0.6025709, 1, 0, 0, 1, 1,
-0.8710651, 1.520494, -2.154403, 0, 0, 0, 1, 1,
-0.8687878, 0.09655326, -1.77625, 0, 0, 0, 1, 1,
-0.8641844, 1.331624, -0.8262123, 0, 0, 0, 1, 1,
-0.8545613, 0.6799125, -0.3626669, 0, 0, 0, 1, 1,
-0.852817, 0.8568425, -0.7870297, 0, 0, 0, 1, 1,
-0.8508623, -0.2829846, -2.403518, 0, 0, 0, 1, 1,
-0.8470156, 1.128907, -1.166033, 0, 0, 0, 1, 1,
-0.84213, 0.1494426, -1.601026, 1, 1, 1, 1, 1,
-0.8334901, 1.50646, 0.1792455, 1, 1, 1, 1, 1,
-0.8320732, -0.2946604, -2.247468, 1, 1, 1, 1, 1,
-0.8296177, 0.5667485, 0.5667123, 1, 1, 1, 1, 1,
-0.8247139, 0.6733815, -0.476111, 1, 1, 1, 1, 1,
-0.8219665, -0.6439245, -0.7805715, 1, 1, 1, 1, 1,
-0.8202345, 0.002109267, -1.100352, 1, 1, 1, 1, 1,
-0.8184517, 0.559935, -1.188324, 1, 1, 1, 1, 1,
-0.816461, -1.7323, -0.6148605, 1, 1, 1, 1, 1,
-0.8147214, 0.1252171, -2.645806, 1, 1, 1, 1, 1,
-0.811508, 0.8316539, 0.3726731, 1, 1, 1, 1, 1,
-0.8058629, 0.5619581, 0.2061048, 1, 1, 1, 1, 1,
-0.8054315, 1.130477, -0.2475419, 1, 1, 1, 1, 1,
-0.8047757, 0.5612441, -0.07299025, 1, 1, 1, 1, 1,
-0.8018535, 0.5559289, -0.6534595, 1, 1, 1, 1, 1,
-0.8011273, 0.1409636, -1.685612, 0, 0, 1, 1, 1,
-0.7980016, -0.01712908, -0.3322397, 1, 0, 0, 1, 1,
-0.7943345, -0.08596526, 0.3509398, 1, 0, 0, 1, 1,
-0.7933902, 0.6501068, -0.1943371, 1, 0, 0, 1, 1,
-0.7879546, 0.9976378, -0.6139883, 1, 0, 0, 1, 1,
-0.7872807, 1.031208, -0.5497786, 1, 0, 0, 1, 1,
-0.7852003, 1.704746, -0.08774311, 0, 0, 0, 1, 1,
-0.7819191, -0.9033275, -2.611737, 0, 0, 0, 1, 1,
-0.7772152, -0.7518051, -1.408169, 0, 0, 0, 1, 1,
-0.7754548, -0.7528849, -4.272809, 0, 0, 0, 1, 1,
-0.7739928, -0.4932883, -0.5185995, 0, 0, 0, 1, 1,
-0.771593, 1.261211, 2.159163, 0, 0, 0, 1, 1,
-0.7713138, -0.05736734, -3.513424, 0, 0, 0, 1, 1,
-0.7672983, 0.9651911, 0.2384332, 1, 1, 1, 1, 1,
-0.7639566, 0.3001918, -1.017744, 1, 1, 1, 1, 1,
-0.7638183, 0.1573627, -0.1320057, 1, 1, 1, 1, 1,
-0.753688, -1.300841, -2.973716, 1, 1, 1, 1, 1,
-0.7524559, -0.1702675, -2.292596, 1, 1, 1, 1, 1,
-0.7480754, -0.723252, -3.208577, 1, 1, 1, 1, 1,
-0.7476047, 1.235432, 0.6538743, 1, 1, 1, 1, 1,
-0.7391, 1.743517, 0.9351342, 1, 1, 1, 1, 1,
-0.7387871, -0.3106141, -0.7498197, 1, 1, 1, 1, 1,
-0.7347026, 0.8133333, 1.4187, 1, 1, 1, 1, 1,
-0.7340701, -0.5158823, -4.128543, 1, 1, 1, 1, 1,
-0.7310061, 0.4704783, -1.698533, 1, 1, 1, 1, 1,
-0.7309452, -2.270325, -2.277588, 1, 1, 1, 1, 1,
-0.7298728, -1.50292, -2.986128, 1, 1, 1, 1, 1,
-0.729194, 0.5556149, -2.348725, 1, 1, 1, 1, 1,
-0.7280269, 2.117977, -0.2577229, 0, 0, 1, 1, 1,
-0.7264185, -0.7763596, -0.7822801, 1, 0, 0, 1, 1,
-0.7257172, 0.34857, -1.246552, 1, 0, 0, 1, 1,
-0.7244002, 1.026642, -2.654289, 1, 0, 0, 1, 1,
-0.7213973, -0.7370786, -1.82602, 1, 0, 0, 1, 1,
-0.7126996, -0.2542524, -0.5649508, 1, 0, 0, 1, 1,
-0.7044035, -1.193822, -0.5027733, 0, 0, 0, 1, 1,
-0.7023322, 1.6369, 1.764848, 0, 0, 0, 1, 1,
-0.7004455, 0.155347, -2.618703, 0, 0, 0, 1, 1,
-0.6981201, 0.5805366, -0.4261349, 0, 0, 0, 1, 1,
-0.6979962, -0.5952306, -1.424752, 0, 0, 0, 1, 1,
-0.6929922, 1.30246, -1.111995, 0, 0, 0, 1, 1,
-0.6927288, 0.2921912, -2.159765, 0, 0, 0, 1, 1,
-0.6890831, 1.261416, -1.153865, 1, 1, 1, 1, 1,
-0.6857335, 0.4232688, -1.357578, 1, 1, 1, 1, 1,
-0.6730803, -1.191654, -2.056839, 1, 1, 1, 1, 1,
-0.6704838, 1.209141, -1.807267, 1, 1, 1, 1, 1,
-0.6697786, -0.9990348, -3.649545, 1, 1, 1, 1, 1,
-0.6689895, -0.4218759, -0.9658705, 1, 1, 1, 1, 1,
-0.665542, 0.3050705, -2.119833, 1, 1, 1, 1, 1,
-0.6654218, 0.5613905, -1.755854, 1, 1, 1, 1, 1,
-0.663397, 0.06281968, -0.7712694, 1, 1, 1, 1, 1,
-0.655387, -1.688477, -3.976166, 1, 1, 1, 1, 1,
-0.649829, 0.01235383, -1.989152, 1, 1, 1, 1, 1,
-0.6482166, -0.4324225, -0.4093433, 1, 1, 1, 1, 1,
-0.6469851, -1.883433, -3.511454, 1, 1, 1, 1, 1,
-0.6461254, -0.3614254, -0.6435818, 1, 1, 1, 1, 1,
-0.6420819, -1.714274, -3.652494, 1, 1, 1, 1, 1,
-0.6396822, -2.47964, -3.635454, 0, 0, 1, 1, 1,
-0.6322011, -1.039757, -1.951795, 1, 0, 0, 1, 1,
-0.6265602, 1.511588, 0.4516349, 1, 0, 0, 1, 1,
-0.6224881, 0.421699, -0.430431, 1, 0, 0, 1, 1,
-0.6207368, -0.9357826, -2.544392, 1, 0, 0, 1, 1,
-0.6205066, -1.93488, -3.258302, 1, 0, 0, 1, 1,
-0.6186954, 1.228124, -1.368943, 0, 0, 0, 1, 1,
-0.6164858, -0.0900792, -1.287955, 0, 0, 0, 1, 1,
-0.6097602, -0.1616343, -0.2644304, 0, 0, 0, 1, 1,
-0.6087855, -1.302139, -1.661153, 0, 0, 0, 1, 1,
-0.6080592, 1.326097, 0.1396758, 0, 0, 0, 1, 1,
-0.6005857, -1.923222, -2.242013, 0, 0, 0, 1, 1,
-0.5984543, 1.441322, 0.315092, 0, 0, 0, 1, 1,
-0.5890122, -0.8967922, -3.824553, 1, 1, 1, 1, 1,
-0.5808495, -0.008297685, -2.518469, 1, 1, 1, 1, 1,
-0.5804695, -0.02687269, -0.5245919, 1, 1, 1, 1, 1,
-0.5757303, 0.4745097, 0.4134865, 1, 1, 1, 1, 1,
-0.574107, -0.1819005, -3.610473, 1, 1, 1, 1, 1,
-0.5718852, 1.601009, -0.5542939, 1, 1, 1, 1, 1,
-0.5695733, 2.824837, 0.112057, 1, 1, 1, 1, 1,
-0.5658105, -0.4579371, -2.616815, 1, 1, 1, 1, 1,
-0.5653214, -0.3044558, -0.4264884, 1, 1, 1, 1, 1,
-0.5633741, 0.3178426, -0.6308207, 1, 1, 1, 1, 1,
-0.5631215, -1.118037, -1.657456, 1, 1, 1, 1, 1,
-0.560375, -0.5834532, -2.922813, 1, 1, 1, 1, 1,
-0.560043, -0.7472796, -1.372819, 1, 1, 1, 1, 1,
-0.550046, -1.855077, -1.317349, 1, 1, 1, 1, 1,
-0.547428, 0.9077136, 0.2044082, 1, 1, 1, 1, 1,
-0.545728, 1.092746, 0.6106122, 0, 0, 1, 1, 1,
-0.5450136, -3.200243, -1.596165, 1, 0, 0, 1, 1,
-0.5449805, 0.3934703, -1.481524, 1, 0, 0, 1, 1,
-0.5370264, 1.17212, -1.08106, 1, 0, 0, 1, 1,
-0.5359965, 0.4788439, -0.02294524, 1, 0, 0, 1, 1,
-0.5332522, 0.9054125, -0.1930731, 1, 0, 0, 1, 1,
-0.5320546, 0.6800028, -0.7646844, 0, 0, 0, 1, 1,
-0.5301263, 0.6707023, -1.085288, 0, 0, 0, 1, 1,
-0.5286836, 1.165654, -0.9028518, 0, 0, 0, 1, 1,
-0.5283341, 0.3155162, -1.575961, 0, 0, 0, 1, 1,
-0.5231038, -1.562135, -1.674091, 0, 0, 0, 1, 1,
-0.5151542, 0.1934537, -0.8012612, 0, 0, 0, 1, 1,
-0.5078737, 0.5550999, -2.046836, 0, 0, 0, 1, 1,
-0.5015114, 1.134147, 0.7935361, 1, 1, 1, 1, 1,
-0.4984798, 0.9209418, -0.8525186, 1, 1, 1, 1, 1,
-0.4976832, -2.043898, -2.598823, 1, 1, 1, 1, 1,
-0.487394, -0.141039, -3.657764, 1, 1, 1, 1, 1,
-0.4855467, -0.3993065, -2.603755, 1, 1, 1, 1, 1,
-0.4840328, 0.5693266, -0.4535414, 1, 1, 1, 1, 1,
-0.4839434, -0.04418138, -1.047833, 1, 1, 1, 1, 1,
-0.475937, -1.111182, -2.091651, 1, 1, 1, 1, 1,
-0.472817, 0.2842618, 0.398341, 1, 1, 1, 1, 1,
-0.4631507, -0.3046574, -2.019918, 1, 1, 1, 1, 1,
-0.461153, 0.3936985, -2.454563, 1, 1, 1, 1, 1,
-0.4604943, 0.7423543, -0.4178626, 1, 1, 1, 1, 1,
-0.4570017, 0.4939241, -0.1839823, 1, 1, 1, 1, 1,
-0.4544788, 1.36324, 0.02619419, 1, 1, 1, 1, 1,
-0.4473624, -2.596927, -1.964874, 1, 1, 1, 1, 1,
-0.4457327, -1.609252, -4.263033, 0, 0, 1, 1, 1,
-0.4444754, 0.7287747, 0.3728096, 1, 0, 0, 1, 1,
-0.4419618, -0.9841995, -2.499472, 1, 0, 0, 1, 1,
-0.4413528, -0.5393732, -0.9299735, 1, 0, 0, 1, 1,
-0.437626, 3.402977, -0.8003812, 1, 0, 0, 1, 1,
-0.4360083, -1.138769, -1.818436, 1, 0, 0, 1, 1,
-0.432666, 0.03558898, -0.7266194, 0, 0, 0, 1, 1,
-0.4219944, 0.04313992, -1.894751, 0, 0, 0, 1, 1,
-0.4203168, 0.8372255, 0.4560359, 0, 0, 0, 1, 1,
-0.4200231, -0.2530422, -3.279274, 0, 0, 0, 1, 1,
-0.4172707, 1.106313, -0.1284542, 0, 0, 0, 1, 1,
-0.4146086, 0.9695566, -3.189575, 0, 0, 0, 1, 1,
-0.4139484, -1.275092, -5.21291, 0, 0, 0, 1, 1,
-0.4124681, -0.6369794, 0.04287985, 1, 1, 1, 1, 1,
-0.4121616, -0.1220628, -0.6321259, 1, 1, 1, 1, 1,
-0.4121077, 0.2344278, -1.536389, 1, 1, 1, 1, 1,
-0.408693, -1.275931, -3.961968, 1, 1, 1, 1, 1,
-0.4054295, 0.4386875, -0.8133966, 1, 1, 1, 1, 1,
-0.4011428, 0.7993652, -1.240452, 1, 1, 1, 1, 1,
-0.3988786, -0.8735064, -3.049268, 1, 1, 1, 1, 1,
-0.3960502, -0.206853, -2.06333, 1, 1, 1, 1, 1,
-0.3936233, 0.02861826, -2.990403, 1, 1, 1, 1, 1,
-0.3927708, 0.5873838, 0.4769486, 1, 1, 1, 1, 1,
-0.3889872, 0.5677959, -2.401737, 1, 1, 1, 1, 1,
-0.3860068, -0.3288672, -3.71773, 1, 1, 1, 1, 1,
-0.3856076, 0.1518724, 1.018218, 1, 1, 1, 1, 1,
-0.3845243, 1.612473, 1.019872, 1, 1, 1, 1, 1,
-0.3841524, -1.881547, -2.895049, 1, 1, 1, 1, 1,
-0.3836743, -0.5683874, -1.555415, 0, 0, 1, 1, 1,
-0.3720056, 0.3888892, 0.3641167, 1, 0, 0, 1, 1,
-0.3718308, 0.4083907, -0.5712144, 1, 0, 0, 1, 1,
-0.3649423, -0.6986522, -4.099563, 1, 0, 0, 1, 1,
-0.3621388, 0.1036539, -2.227666, 1, 0, 0, 1, 1,
-0.3617885, 0.2802862, -0.1148379, 1, 0, 0, 1, 1,
-0.3601567, 0.4773906, -0.7841489, 0, 0, 0, 1, 1,
-0.3597952, 0.5740585, 0.3744172, 0, 0, 0, 1, 1,
-0.3577618, -0.8359328, -2.416474, 0, 0, 0, 1, 1,
-0.3547877, 1.614282, 1.224806, 0, 0, 0, 1, 1,
-0.3514748, -0.1573418, -1.360137, 0, 0, 0, 1, 1,
-0.3510355, 0.02572147, -2.117924, 0, 0, 0, 1, 1,
-0.3451577, -1.289727, -2.706073, 0, 0, 0, 1, 1,
-0.341217, -1.169962, -3.929885, 1, 1, 1, 1, 1,
-0.340653, 1.431566, 1.392222, 1, 1, 1, 1, 1,
-0.339622, 0.1407395, -0.8011098, 1, 1, 1, 1, 1,
-0.3360345, 0.04147426, -1.981472, 1, 1, 1, 1, 1,
-0.3313637, -1.233554, -0.06849544, 1, 1, 1, 1, 1,
-0.3313556, 0.09722833, -1.293478, 1, 1, 1, 1, 1,
-0.329405, 3.181649, 0.6905763, 1, 1, 1, 1, 1,
-0.3265201, 0.922998, 1.028631, 1, 1, 1, 1, 1,
-0.3196513, -0.3251397, -2.852894, 1, 1, 1, 1, 1,
-0.3166969, -1.210922, -3.204666, 1, 1, 1, 1, 1,
-0.3149979, -0.9646606, -2.669331, 1, 1, 1, 1, 1,
-0.3091925, 0.6043957, -0.2982243, 1, 1, 1, 1, 1,
-0.302037, 1.111773, -1.335298, 1, 1, 1, 1, 1,
-0.3010722, -1.132596, -2.435945, 1, 1, 1, 1, 1,
-0.2999472, 0.2491776, -0.1291451, 1, 1, 1, 1, 1,
-0.2950654, 1.294143, 1.62973, 0, 0, 1, 1, 1,
-0.2942848, -0.5585606, -1.836421, 1, 0, 0, 1, 1,
-0.2928798, 0.5171027, 0.2717904, 1, 0, 0, 1, 1,
-0.2896613, -0.8343936, -2.674559, 1, 0, 0, 1, 1,
-0.2896065, -2.80054, -3.208065, 1, 0, 0, 1, 1,
-0.2879348, -0.06771904, -1.077778, 1, 0, 0, 1, 1,
-0.2833853, -0.4124724, -0.1569069, 0, 0, 0, 1, 1,
-0.2832817, -1.4216, -3.160408, 0, 0, 0, 1, 1,
-0.2710441, 0.3299459, 0.3464596, 0, 0, 0, 1, 1,
-0.262162, -0.8129485, -4.54833, 0, 0, 0, 1, 1,
-0.2601008, -0.9141155, -3.69586, 0, 0, 0, 1, 1,
-0.2588238, -1.228545, -3.430721, 0, 0, 0, 1, 1,
-0.2495263, -1.553689, -3.58094, 0, 0, 0, 1, 1,
-0.2470818, -1.404441, -2.170096, 1, 1, 1, 1, 1,
-0.2446769, -0.3016977, -3.750636, 1, 1, 1, 1, 1,
-0.2443502, 1.861193, -0.4570104, 1, 1, 1, 1, 1,
-0.2442606, -0.8991089, -3.997352, 1, 1, 1, 1, 1,
-0.2428959, 1.682064, -0.874416, 1, 1, 1, 1, 1,
-0.2400901, -0.1175425, -1.668022, 1, 1, 1, 1, 1,
-0.2372052, -0.01979818, -1.829002, 1, 1, 1, 1, 1,
-0.2359283, 0.7549011, -0.4123972, 1, 1, 1, 1, 1,
-0.2342896, -0.9592687, -2.654625, 1, 1, 1, 1, 1,
-0.2328264, 0.6155849, 1.215462, 1, 1, 1, 1, 1,
-0.2277295, -0.3621274, -2.130031, 1, 1, 1, 1, 1,
-0.2206782, -0.3949664, -3.653755, 1, 1, 1, 1, 1,
-0.2147491, -1.337263, -2.013031, 1, 1, 1, 1, 1,
-0.2085372, 0.5930271, -1.861265, 1, 1, 1, 1, 1,
-0.2058763, -0.9808363, -3.745867, 1, 1, 1, 1, 1,
-0.2054185, 0.875458, -2.452751, 0, 0, 1, 1, 1,
-0.2044879, 0.353655, -0.6316007, 1, 0, 0, 1, 1,
-0.2043235, 0.1890679, -1.19618, 1, 0, 0, 1, 1,
-0.2010892, -1.450824, -3.217252, 1, 0, 0, 1, 1,
-0.1951958, -0.7881306, -2.282092, 1, 0, 0, 1, 1,
-0.1931144, 0.09533242, -1.503563, 1, 0, 0, 1, 1,
-0.1907286, 1.713938, -0.4372701, 0, 0, 0, 1, 1,
-0.1904057, 1.748219, -0.2205131, 0, 0, 0, 1, 1,
-0.1875864, -0.3161967, -2.834794, 0, 0, 0, 1, 1,
-0.1814604, 0.8395077, 0.9179252, 0, 0, 0, 1, 1,
-0.1725171, -0.1459086, -2.749952, 0, 0, 0, 1, 1,
-0.1721208, 0.09544241, -0.677791, 0, 0, 0, 1, 1,
-0.1718375, 0.9260133, 0.8433063, 0, 0, 0, 1, 1,
-0.1664128, -0.577352, -4.450613, 1, 1, 1, 1, 1,
-0.1630124, 0.3757357, -1.445267, 1, 1, 1, 1, 1,
-0.1627349, 0.5803998, -1.353902, 1, 1, 1, 1, 1,
-0.158016, -1.264968, -1.251348, 1, 1, 1, 1, 1,
-0.1574689, 0.1270092, -1.781675, 1, 1, 1, 1, 1,
-0.1558333, -2.228894, -1.896292, 1, 1, 1, 1, 1,
-0.1546953, 3.016793, -0.9513724, 1, 1, 1, 1, 1,
-0.1546779, 1.248329, 0.1986163, 1, 1, 1, 1, 1,
-0.1498833, 1.368561, 0.4970149, 1, 1, 1, 1, 1,
-0.1457755, -0.0545238, -2.052111, 1, 1, 1, 1, 1,
-0.1379212, 1.123001, 0.8295932, 1, 1, 1, 1, 1,
-0.1353865, 2.205306, -0.4342096, 1, 1, 1, 1, 1,
-0.1295997, -1.802953, -3.415328, 1, 1, 1, 1, 1,
-0.128759, -0.1270081, -3.404134, 1, 1, 1, 1, 1,
-0.12721, 1.337671, 1.317424, 1, 1, 1, 1, 1,
-0.1262541, 1.461876, 0.001608791, 0, 0, 1, 1, 1,
-0.1249809, -0.09128279, -1.280142, 1, 0, 0, 1, 1,
-0.1239214, 0.2800415, -0.7600083, 1, 0, 0, 1, 1,
-0.1219116, 0.9905694, -0.8406096, 1, 0, 0, 1, 1,
-0.1207393, 0.5055603, -2.336967, 1, 0, 0, 1, 1,
-0.1204746, 0.6031045, -0.8071249, 1, 0, 0, 1, 1,
-0.1203786, 1.068158, 0.6115231, 0, 0, 0, 1, 1,
-0.11983, -1.015319, -2.33457, 0, 0, 0, 1, 1,
-0.1192424, 0.7406278, 1.093661, 0, 0, 0, 1, 1,
-0.1175435, -0.5230777, -4.645088, 0, 0, 0, 1, 1,
-0.1129594, 0.1497286, 1.073747, 0, 0, 0, 1, 1,
-0.1073227, 0.5029833, -1.780146, 0, 0, 0, 1, 1,
-0.104264, -0.8682784, -4.202903, 0, 0, 0, 1, 1,
-0.09783202, -0.275693, -3.397235, 1, 1, 1, 1, 1,
-0.09635081, -0.3918364, -1.64498, 1, 1, 1, 1, 1,
-0.09630787, -0.1820982, -2.527641, 1, 1, 1, 1, 1,
-0.08752809, -0.457063, -2.939104, 1, 1, 1, 1, 1,
-0.08357366, -0.1730775, -1.466947, 1, 1, 1, 1, 1,
-0.0831816, 2.542957, -0.2091422, 1, 1, 1, 1, 1,
-0.07384336, 2.253121, -0.1428031, 1, 1, 1, 1, 1,
-0.07301003, 0.2917233, -1.031591, 1, 1, 1, 1, 1,
-0.07195865, -1.288962, -3.817186, 1, 1, 1, 1, 1,
-0.06840034, -0.3554978, -4.042654, 1, 1, 1, 1, 1,
-0.06822028, -0.3981877, -4.053417, 1, 1, 1, 1, 1,
-0.06746783, 1.894861, -1.590472, 1, 1, 1, 1, 1,
-0.06570863, -0.0751005, -1.573928, 1, 1, 1, 1, 1,
-0.06517309, -0.4199473, -2.858054, 1, 1, 1, 1, 1,
-0.06296107, 1.140994, -0.3885757, 1, 1, 1, 1, 1,
-0.06222769, -0.3270923, -3.048123, 0, 0, 1, 1, 1,
-0.06191864, 0.9917638, 0.1232088, 1, 0, 0, 1, 1,
-0.06167512, -1.374892, -3.293338, 1, 0, 0, 1, 1,
-0.06073922, 1.047654, -0.2437056, 1, 0, 0, 1, 1,
-0.06047708, 1.528262, 0.6461552, 1, 0, 0, 1, 1,
-0.05326499, 0.6833417, -0.1499803, 1, 0, 0, 1, 1,
-0.05128228, -0.361155, -4.745865, 0, 0, 0, 1, 1,
-0.05076149, 0.8955274, -2.116734, 0, 0, 0, 1, 1,
-0.04871633, 0.06071575, -0.1700685, 0, 0, 0, 1, 1,
-0.04800327, -0.7768325, -2.451456, 0, 0, 0, 1, 1,
-0.0470014, 0.01473804, -1.307295, 0, 0, 0, 1, 1,
-0.04231143, 0.02817936, -2.288967, 0, 0, 0, 1, 1,
-0.04163494, -0.90965, -3.996614, 0, 0, 0, 1, 1,
-0.04007304, -0.7507818, -3.33248, 1, 1, 1, 1, 1,
-0.03833743, -0.6625667, -3.725956, 1, 1, 1, 1, 1,
-0.03818895, -0.4709679, -0.9400221, 1, 1, 1, 1, 1,
-0.03431458, -1.332802, -2.879251, 1, 1, 1, 1, 1,
-0.03428071, 0.58115, -0.3127506, 1, 1, 1, 1, 1,
-0.03189616, 1.711921, 1.01641, 1, 1, 1, 1, 1,
-0.03084274, -0.7171518, -2.948267, 1, 1, 1, 1, 1,
-0.03073957, 0.06017965, -0.02121064, 1, 1, 1, 1, 1,
-0.02937768, -0.2760535, -3.847597, 1, 1, 1, 1, 1,
-0.02754978, 0.007044153, -1.402085, 1, 1, 1, 1, 1,
-0.02460487, 0.134899, -1.299343, 1, 1, 1, 1, 1,
-0.01959369, 0.7938957, -0.3137386, 1, 1, 1, 1, 1,
-0.01800228, -0.3221626, -2.811253, 1, 1, 1, 1, 1,
-0.01771997, -0.4169618, -3.23599, 1, 1, 1, 1, 1,
-0.01649171, -0.5713532, -2.666241, 1, 1, 1, 1, 1,
-0.01423155, 0.1432508, -0.2385323, 0, 0, 1, 1, 1,
-0.007662473, -0.3570381, -4.132562, 1, 0, 0, 1, 1,
-0.005861404, -0.3752794, -1.931665, 1, 0, 0, 1, 1,
-0.003858412, -1.846122, -3.450434, 1, 0, 0, 1, 1,
-0.002404995, -0.3514443, -3.627992, 1, 0, 0, 1, 1,
-0.001857226, -1.735368, -2.366453, 1, 0, 0, 1, 1,
0.004356795, 0.1550015, -0.1863993, 0, 0, 0, 1, 1,
0.005818352, -0.3048757, 2.727562, 0, 0, 0, 1, 1,
0.01349832, 1.277808, -1.489205, 0, 0, 0, 1, 1,
0.0158399, -1.501182, 2.637136, 0, 0, 0, 1, 1,
0.01916645, -0.5380264, 3.362631, 0, 0, 0, 1, 1,
0.02062139, -0.3140119, 3.87809, 0, 0, 0, 1, 1,
0.02256977, 1.412307, 1.739758, 0, 0, 0, 1, 1,
0.0233368, -1.58166, 3.801399, 1, 1, 1, 1, 1,
0.02657957, -1.478598, 3.436267, 1, 1, 1, 1, 1,
0.02818643, 1.334678, 2.173444, 1, 1, 1, 1, 1,
0.0375829, -1.199839, 3.275394, 1, 1, 1, 1, 1,
0.04430526, -1.084693, 4.404299, 1, 1, 1, 1, 1,
0.0446699, 1.91265, 1.705043, 1, 1, 1, 1, 1,
0.04483687, 1.983477, -0.1998513, 1, 1, 1, 1, 1,
0.046902, -0.1767592, 1.843199, 1, 1, 1, 1, 1,
0.05052317, -2.440305, 2.261828, 1, 1, 1, 1, 1,
0.0514508, -0.3082406, 2.276172, 1, 1, 1, 1, 1,
0.05388457, 0.6736953, 1.384882, 1, 1, 1, 1, 1,
0.05626188, -0.4399957, 3.608255, 1, 1, 1, 1, 1,
0.05936215, -1.042082, 2.793825, 1, 1, 1, 1, 1,
0.06440934, -0.9526249, 2.799097, 1, 1, 1, 1, 1,
0.06561396, 0.5194721, -0.5040638, 1, 1, 1, 1, 1,
0.06695929, 0.2230156, 1.116937, 0, 0, 1, 1, 1,
0.06697883, -0.7124234, 3.722286, 1, 0, 0, 1, 1,
0.06792888, 0.241619, 0.7502344, 1, 0, 0, 1, 1,
0.07052136, -1.018124, 4.567912, 1, 0, 0, 1, 1,
0.07363383, 0.3604265, -0.5944845, 1, 0, 0, 1, 1,
0.07561521, 0.4482705, -0.9224705, 1, 0, 0, 1, 1,
0.08534359, 0.8809581, 0.1140712, 0, 0, 0, 1, 1,
0.08615937, 0.3853873, 0.4323322, 0, 0, 0, 1, 1,
0.08656546, -1.717183, 1.97574, 0, 0, 0, 1, 1,
0.09041876, -1.571985, 2.242938, 0, 0, 0, 1, 1,
0.09376806, 0.3856777, 0.5655429, 0, 0, 0, 1, 1,
0.09407508, -0.964678, 1.229515, 0, 0, 0, 1, 1,
0.09409623, 0.4390892, -0.4392639, 0, 0, 0, 1, 1,
0.09465887, -0.1066374, 3.704917, 1, 1, 1, 1, 1,
0.09564639, -0.3834438, 2.389218, 1, 1, 1, 1, 1,
0.09710573, -1.701064, 1.3369, 1, 1, 1, 1, 1,
0.09767035, -1.394506, 2.562778, 1, 1, 1, 1, 1,
0.1025536, -0.1673324, 2.387848, 1, 1, 1, 1, 1,
0.1044806, 1.419894, -0.9584795, 1, 1, 1, 1, 1,
0.1051287, 1.387226, -1.628477, 1, 1, 1, 1, 1,
0.1063833, -0.5000792, 3.833018, 1, 1, 1, 1, 1,
0.110103, -0.6676731, 4.115715, 1, 1, 1, 1, 1,
0.1107565, -1.030475, 1.971164, 1, 1, 1, 1, 1,
0.1107673, 1.119845, -0.6800222, 1, 1, 1, 1, 1,
0.1116345, 0.06401823, 1.201247, 1, 1, 1, 1, 1,
0.1124184, 1.751774, -1.816884, 1, 1, 1, 1, 1,
0.1167969, 1.041466, -0.4333791, 1, 1, 1, 1, 1,
0.1185188, -2.01802, 3.953461, 1, 1, 1, 1, 1,
0.1186738, -0.2569777, 2.779409, 0, 0, 1, 1, 1,
0.1195862, 1.746284, -0.4766537, 1, 0, 0, 1, 1,
0.1226184, -0.881887, 2.702627, 1, 0, 0, 1, 1,
0.1244518, 2.128016, -0.3435277, 1, 0, 0, 1, 1,
0.1249956, 0.5046109, -0.881353, 1, 0, 0, 1, 1,
0.1257091, 0.01529036, 2.063752, 1, 0, 0, 1, 1,
0.1275226, 0.1046888, 0.1038796, 0, 0, 0, 1, 1,
0.1289819, 1.55036, -0.4105033, 0, 0, 0, 1, 1,
0.134956, 1.428163, 0.2350332, 0, 0, 0, 1, 1,
0.1354428, 0.5919693, -0.6431007, 0, 0, 0, 1, 1,
0.1397768, -1.284951, 1.759463, 0, 0, 0, 1, 1,
0.1413737, -0.2888136, 2.776432, 0, 0, 0, 1, 1,
0.1416952, 0.5282747, 0.917366, 0, 0, 0, 1, 1,
0.1417633, -0.6631123, 2.582323, 1, 1, 1, 1, 1,
0.143427, 1.256703, 1.308474, 1, 1, 1, 1, 1,
0.1451078, -1.625436, 3.403454, 1, 1, 1, 1, 1,
0.1457874, -0.5680692, 3.079854, 1, 1, 1, 1, 1,
0.1493194, 0.3985429, 0.2659665, 1, 1, 1, 1, 1,
0.1512553, -1.131163, 2.648079, 1, 1, 1, 1, 1,
0.1592243, -0.872686, 1.287398, 1, 1, 1, 1, 1,
0.161631, -0.4990036, 2.281073, 1, 1, 1, 1, 1,
0.1635374, -1.96194, 3.518021, 1, 1, 1, 1, 1,
0.1658642, 0.703877, -0.3670151, 1, 1, 1, 1, 1,
0.1665867, -1.188422, 2.37231, 1, 1, 1, 1, 1,
0.1682146, -0.1279901, 2.943825, 1, 1, 1, 1, 1,
0.1715353, -1.063776, 2.328577, 1, 1, 1, 1, 1,
0.173061, -0.512704, 2.801975, 1, 1, 1, 1, 1,
0.1736016, -1.953463, 2.957398, 1, 1, 1, 1, 1,
0.1798492, 0.7392669, 2.371644, 0, 0, 1, 1, 1,
0.1811152, -1.068032, 1.164155, 1, 0, 0, 1, 1,
0.1889588, 0.9682078, 2.384068, 1, 0, 0, 1, 1,
0.1915599, -1.063441, 3.186444, 1, 0, 0, 1, 1,
0.1974823, 0.5854775, -0.6358622, 1, 0, 0, 1, 1,
0.1980215, -0.2393964, 1.464573, 1, 0, 0, 1, 1,
0.204844, 0.3264945, 0.02865382, 0, 0, 0, 1, 1,
0.2048835, -0.7710692, 2.419297, 0, 0, 0, 1, 1,
0.2110156, -0.6641256, 3.975254, 0, 0, 0, 1, 1,
0.2146031, 0.6719736, 0.9945242, 0, 0, 0, 1, 1,
0.2154932, -1.177974, 4.09257, 0, 0, 0, 1, 1,
0.2173752, -0.8624447, 2.21067, 0, 0, 0, 1, 1,
0.222111, 1.267197, -0.8164038, 0, 0, 0, 1, 1,
0.2244162, -0.3141944, 3.835547, 1, 1, 1, 1, 1,
0.2244692, 0.01836477, 1.509371, 1, 1, 1, 1, 1,
0.2263764, 1.842028, -1.607018, 1, 1, 1, 1, 1,
0.2319106, -0.2314001, 4.006084, 1, 1, 1, 1, 1,
0.233003, -0.3200391, 2.473943, 1, 1, 1, 1, 1,
0.2395021, 0.3421052, -1.231039, 1, 1, 1, 1, 1,
0.2396528, 1.848096, 1.238012, 1, 1, 1, 1, 1,
0.2412158, 1.388643, 2.024998, 1, 1, 1, 1, 1,
0.2441634, 0.5070857, 0.2711382, 1, 1, 1, 1, 1,
0.2499434, 0.4383334, -0.0127729, 1, 1, 1, 1, 1,
0.2558121, 0.8917137, 1.367139, 1, 1, 1, 1, 1,
0.257777, 0.8504248, 1.457772, 1, 1, 1, 1, 1,
0.2582383, -0.08661194, 2.163433, 1, 1, 1, 1, 1,
0.2644989, 0.654028, -0.5139865, 1, 1, 1, 1, 1,
0.269005, -0.2587227, 1.524952, 1, 1, 1, 1, 1,
0.2720712, 0.9477661, -0.5176129, 0, 0, 1, 1, 1,
0.273977, -0.5256211, 2.29204, 1, 0, 0, 1, 1,
0.2747506, 1.418833, 0.08642378, 1, 0, 0, 1, 1,
0.2777293, 0.6661184, -0.3352011, 1, 0, 0, 1, 1,
0.2813312, -0.1021898, 1.418662, 1, 0, 0, 1, 1,
0.2830513, 0.5685158, 0.07057468, 1, 0, 0, 1, 1,
0.2892769, -1.358817, 1.985104, 0, 0, 0, 1, 1,
0.2933988, -0.3956307, 2.456823, 0, 0, 0, 1, 1,
0.2956639, 0.1957783, 0.09382737, 0, 0, 0, 1, 1,
0.3100334, 0.7485188, -0.02166065, 0, 0, 0, 1, 1,
0.3139556, 1.328828, -1.620951, 0, 0, 0, 1, 1,
0.3157772, 0.02042983, 1.102116, 0, 0, 0, 1, 1,
0.3192241, -0.879961, 2.566575, 0, 0, 0, 1, 1,
0.3197445, 0.6497516, -0.6192629, 1, 1, 1, 1, 1,
0.3217863, -0.8954691, 3.215133, 1, 1, 1, 1, 1,
0.3230348, -1.207259, 3.636071, 1, 1, 1, 1, 1,
0.3231257, -1.462238, 2.634604, 1, 1, 1, 1, 1,
0.3254476, 1.089011, 2.120119, 1, 1, 1, 1, 1,
0.3274129, -1.260033, 4.296754, 1, 1, 1, 1, 1,
0.3293167, -0.282794, 2.686276, 1, 1, 1, 1, 1,
0.3369766, -0.7804514, 0.8638012, 1, 1, 1, 1, 1,
0.3370171, -0.9283366, 3.424739, 1, 1, 1, 1, 1,
0.339159, 1.337054, -0.1500392, 1, 1, 1, 1, 1,
0.3400454, -1.33101, 2.19319, 1, 1, 1, 1, 1,
0.3406765, -0.9456941, 3.120967, 1, 1, 1, 1, 1,
0.3450871, -0.9145455, 3.78388, 1, 1, 1, 1, 1,
0.3453438, 0.814735, 1.060182, 1, 1, 1, 1, 1,
0.3464655, -1.184659, 3.048014, 1, 1, 1, 1, 1,
0.349331, 0.5434651, 1.250369, 0, 0, 1, 1, 1,
0.3533094, -0.02840128, 2.065609, 1, 0, 0, 1, 1,
0.353961, 0.2659678, 1.199918, 1, 0, 0, 1, 1,
0.356183, -0.9981018, 0.2662489, 1, 0, 0, 1, 1,
0.3598811, 1.005474, 0.9434556, 1, 0, 0, 1, 1,
0.3625347, -0.3303594, 2.26442, 1, 0, 0, 1, 1,
0.3625575, 0.03547743, 2.182761, 0, 0, 0, 1, 1,
0.3642226, -0.1383115, 1.617515, 0, 0, 0, 1, 1,
0.3651188, -0.8241119, 2.236717, 0, 0, 0, 1, 1,
0.3672455, -0.6677026, 0.7336946, 0, 0, 0, 1, 1,
0.3728974, -0.7572755, 2.823563, 0, 0, 0, 1, 1,
0.375947, 0.6540554, 0.2491497, 0, 0, 0, 1, 1,
0.3763263, 0.2918912, 0.1510354, 0, 0, 0, 1, 1,
0.3795542, 0.5973724, 1.653527, 1, 1, 1, 1, 1,
0.3803757, 0.8160959, 0.560631, 1, 1, 1, 1, 1,
0.3827873, -0.07297477, 1.249918, 1, 1, 1, 1, 1,
0.3832029, 0.8400254, 0.7327508, 1, 1, 1, 1, 1,
0.3895836, 1.403789, -0.9546958, 1, 1, 1, 1, 1,
0.392209, -0.144524, 4.279131, 1, 1, 1, 1, 1,
0.392848, -2.629396, 4.421698, 1, 1, 1, 1, 1,
0.3962755, 0.307129, 1.1619, 1, 1, 1, 1, 1,
0.3986708, -0.3012605, 4.292007, 1, 1, 1, 1, 1,
0.4015821, 0.6499804, 1.733717, 1, 1, 1, 1, 1,
0.4022338, 0.2771235, -1.23517, 1, 1, 1, 1, 1,
0.40367, -1.393906, 2.940413, 1, 1, 1, 1, 1,
0.4045193, -0.005979303, 1.114799, 1, 1, 1, 1, 1,
0.4075088, 0.3400079, 0.9102926, 1, 1, 1, 1, 1,
0.4108737, 0.1982298, 0.8669422, 1, 1, 1, 1, 1,
0.4122634, -0.4926527, 1.975296, 0, 0, 1, 1, 1,
0.4140108, 1.584741, -1.976462, 1, 0, 0, 1, 1,
0.4188298, 0.1903471, -0.03953634, 1, 0, 0, 1, 1,
0.4249338, -0.6756586, 4.799027, 1, 0, 0, 1, 1,
0.4253249, 0.7814732, 0.4557942, 1, 0, 0, 1, 1,
0.4258552, -0.2251354, 1.821799, 1, 0, 0, 1, 1,
0.4272284, -0.1516038, 0.849041, 0, 0, 0, 1, 1,
0.4312173, -1.406256, 3.997313, 0, 0, 0, 1, 1,
0.4474973, 0.6796278, 0.5157102, 0, 0, 0, 1, 1,
0.448488, 1.152468, 1.426976, 0, 0, 0, 1, 1,
0.4537488, -0.2235101, 2.314578, 0, 0, 0, 1, 1,
0.4546736, 1.581038, 0.5366462, 0, 0, 0, 1, 1,
0.4582307, -0.2129313, 0.880367, 0, 0, 0, 1, 1,
0.4728542, 0.4262776, 0.2355435, 1, 1, 1, 1, 1,
0.4741744, -0.5197458, 2.863772, 1, 1, 1, 1, 1,
0.4750677, 1.520113, -0.09604593, 1, 1, 1, 1, 1,
0.4759291, 0.05521251, -0.2178611, 1, 1, 1, 1, 1,
0.4820888, -1.981566, 3.644071, 1, 1, 1, 1, 1,
0.4853891, -0.713904, 2.848085, 1, 1, 1, 1, 1,
0.4919757, 0.8058599, 1.895467, 1, 1, 1, 1, 1,
0.4960956, 0.6248234, 1.176484, 1, 1, 1, 1, 1,
0.5056238, -0.2058001, 0.7539387, 1, 1, 1, 1, 1,
0.5091868, 0.02031776, 2.156146, 1, 1, 1, 1, 1,
0.5099019, -0.6424289, 2.426397, 1, 1, 1, 1, 1,
0.5100541, -0.200167, 2.388157, 1, 1, 1, 1, 1,
0.5112755, -0.2124436, 2.372224, 1, 1, 1, 1, 1,
0.5170263, 0.4368179, -0.4620962, 1, 1, 1, 1, 1,
0.5199514, -0.01718359, 1.585047, 1, 1, 1, 1, 1,
0.521167, -0.1176109, 2.722223, 0, 0, 1, 1, 1,
0.5226982, 0.02369956, 2.179702, 1, 0, 0, 1, 1,
0.523691, 0.5192368, 0.4896782, 1, 0, 0, 1, 1,
0.5295738, 0.08549957, -0.178113, 1, 0, 0, 1, 1,
0.5310538, 0.6864024, 0.1350658, 1, 0, 0, 1, 1,
0.531454, 0.6157833, -2.646669, 1, 0, 0, 1, 1,
0.5319034, 1.079689, 1.152979, 0, 0, 0, 1, 1,
0.5327705, -0.02497527, 1.431714, 0, 0, 0, 1, 1,
0.5393642, 1.250103, 0.5226491, 0, 0, 0, 1, 1,
0.5435437, -2.326871, 2.069369, 0, 0, 0, 1, 1,
0.5439138, 1.267481, -0.6489424, 0, 0, 0, 1, 1,
0.5496638, 0.7629597, -0.4836706, 0, 0, 0, 1, 1,
0.5551776, -0.2739035, 2.903094, 0, 0, 0, 1, 1,
0.556248, 1.043242, 0.3559405, 1, 1, 1, 1, 1,
0.5570687, -0.8531233, 2.33481, 1, 1, 1, 1, 1,
0.5587467, 0.6808844, 2.068323, 1, 1, 1, 1, 1,
0.5654112, -0.9520235, 3.6759, 1, 1, 1, 1, 1,
0.5671833, -2.243008, 3.111792, 1, 1, 1, 1, 1,
0.5740296, 0.8580838, 1.083337, 1, 1, 1, 1, 1,
0.5792183, -0.2534164, 1.796048, 1, 1, 1, 1, 1,
0.5834983, -0.5288062, 3.595148, 1, 1, 1, 1, 1,
0.5951049, -0.2248846, 2.56025, 1, 1, 1, 1, 1,
0.597921, -0.3962806, 3.141633, 1, 1, 1, 1, 1,
0.5988261, 0.2623858, 1.172484, 1, 1, 1, 1, 1,
0.6032928, 0.3945661, 1.542955, 1, 1, 1, 1, 1,
0.604925, 0.7190759, 0.1473297, 1, 1, 1, 1, 1,
0.6066194, 1.931583, -1.881794, 1, 1, 1, 1, 1,
0.6078669, 0.840915, 0.6968098, 1, 1, 1, 1, 1,
0.6086633, 3.126453, 1.326907, 0, 0, 1, 1, 1,
0.6110659, 0.9007177, 2.379033, 1, 0, 0, 1, 1,
0.611456, 1.194826, 0.5483447, 1, 0, 0, 1, 1,
0.6149528, -0.603983, 3.139882, 1, 0, 0, 1, 1,
0.6288258, -0.2538512, 2.795857, 1, 0, 0, 1, 1,
0.633342, -0.2496709, 0.2596397, 1, 0, 0, 1, 1,
0.6347418, -0.3201428, 2.059294, 0, 0, 0, 1, 1,
0.6366625, 1.219323, 0.5008916, 0, 0, 0, 1, 1,
0.6367157, 1.459986, 0.6596232, 0, 0, 0, 1, 1,
0.6376137, 1.160367, 1.619676, 0, 0, 0, 1, 1,
0.6381871, -1.432704, 2.596543, 0, 0, 0, 1, 1,
0.6384461, 1.105806, 1.00194, 0, 0, 0, 1, 1,
0.6386889, -0.3413117, 0.7116773, 0, 0, 0, 1, 1,
0.6429694, 1.81028, -0.1145663, 1, 1, 1, 1, 1,
0.6449095, -0.6600555, 2.097077, 1, 1, 1, 1, 1,
0.6467941, -0.365124, 1.286927, 1, 1, 1, 1, 1,
0.6506053, -1.291349, 3.078331, 1, 1, 1, 1, 1,
0.6592695, 1.310368, 2.503503, 1, 1, 1, 1, 1,
0.6652048, 2.053474, -0.3195065, 1, 1, 1, 1, 1,
0.6659219, -0.1375495, 0.8592599, 1, 1, 1, 1, 1,
0.6710147, -0.3309521, 1.123991, 1, 1, 1, 1, 1,
0.6725609, -0.7606527, 2.365502, 1, 1, 1, 1, 1,
0.6776597, -0.03823906, 0.259008, 1, 1, 1, 1, 1,
0.6849778, -0.02205938, 1.707444, 1, 1, 1, 1, 1,
0.6892048, 1.342356, -0.03325133, 1, 1, 1, 1, 1,
0.6936806, 0.7068215, 0.8670868, 1, 1, 1, 1, 1,
0.6953449, -0.7752758, 4.321712, 1, 1, 1, 1, 1,
0.6972078, -1.552854, 3.868544, 1, 1, 1, 1, 1,
0.6973027, -1.28344, 3.255009, 0, 0, 1, 1, 1,
0.7023782, -0.5503211, 3.659678, 1, 0, 0, 1, 1,
0.7100335, 0.4074767, -0.04712737, 1, 0, 0, 1, 1,
0.7205315, 0.1690393, 0.9036146, 1, 0, 0, 1, 1,
0.7213212, 1.44548, 0.9932327, 1, 0, 0, 1, 1,
0.7223467, 0.1899476, 3.119476, 1, 0, 0, 1, 1,
0.7243332, -1.384668, 1.226985, 0, 0, 0, 1, 1,
0.72689, 0.1304269, 2.48362, 0, 0, 0, 1, 1,
0.733097, -0.2271374, 2.621701, 0, 0, 0, 1, 1,
0.7342608, 0.7418505, 0.9240714, 0, 0, 0, 1, 1,
0.7385889, -0.2949962, 2.15415, 0, 0, 0, 1, 1,
0.7400941, -1.276738, 2.709884, 0, 0, 0, 1, 1,
0.740256, 0.345237, 0.8191617, 0, 0, 0, 1, 1,
0.7448143, 0.2729584, 1.223168, 1, 1, 1, 1, 1,
0.7467394, -1.19936, 1.912138, 1, 1, 1, 1, 1,
0.7518621, 0.5407047, -1.003943, 1, 1, 1, 1, 1,
0.7518762, 0.7564074, 0.1960271, 1, 1, 1, 1, 1,
0.754372, 0.4641055, 0.301666, 1, 1, 1, 1, 1,
0.7551468, 1.911126, 2.820472, 1, 1, 1, 1, 1,
0.7621015, -0.9018682, 2.796069, 1, 1, 1, 1, 1,
0.7645118, -0.5221626, 2.209142, 1, 1, 1, 1, 1,
0.7671663, -0.0718509, 2.813273, 1, 1, 1, 1, 1,
0.7678288, -0.2623416, 1.716433, 1, 1, 1, 1, 1,
0.7698933, -1.336373, 3.297906, 1, 1, 1, 1, 1,
0.7741184, 0.7028202, 1.154624, 1, 1, 1, 1, 1,
0.7817645, -0.3088463, 1.876686, 1, 1, 1, 1, 1,
0.7865381, 0.4330713, 1.340872, 1, 1, 1, 1, 1,
0.7878217, -1.104431, 1.997594, 1, 1, 1, 1, 1,
0.7916866, 0.6273548, 0.2259635, 0, 0, 1, 1, 1,
0.7947284, 0.2700128, 2.193631, 1, 0, 0, 1, 1,
0.7963498, 0.5143056, 2.367429, 1, 0, 0, 1, 1,
0.7976432, 0.2049045, 1.940774, 1, 0, 0, 1, 1,
0.8003057, 0.8553155, 2.134796, 1, 0, 0, 1, 1,
0.8026401, -0.9354656, 2.248099, 1, 0, 0, 1, 1,
0.80941, 0.5093824, 2.204628, 0, 0, 0, 1, 1,
0.8111125, 1.224883, 2.177342, 0, 0, 0, 1, 1,
0.8169776, -1.103621, 2.214951, 0, 0, 0, 1, 1,
0.8188996, -0.8014789, 2.902196, 0, 0, 0, 1, 1,
0.8218591, -2.48286, 3.8379, 0, 0, 0, 1, 1,
0.8225445, -0.6909215, 1.646165, 0, 0, 0, 1, 1,
0.8250759, 1.001161, 0.7466435, 0, 0, 0, 1, 1,
0.8252534, 0.537442, 2.184157, 1, 1, 1, 1, 1,
0.8258344, -2.120872, 1.681631, 1, 1, 1, 1, 1,
0.831513, -0.400304, 1.035453, 1, 1, 1, 1, 1,
0.8321107, -1.677475, 3.095443, 1, 1, 1, 1, 1,
0.8408945, -0.65605, 2.362326, 1, 1, 1, 1, 1,
0.8424867, 0.9898021, -0.3873612, 1, 1, 1, 1, 1,
0.8435479, 0.9668456, 0.9339575, 1, 1, 1, 1, 1,
0.8466762, -0.4943556, 1.409139, 1, 1, 1, 1, 1,
0.8487685, 0.09106261, 1.409062, 1, 1, 1, 1, 1,
0.8548922, -1.508307, 2.700625, 1, 1, 1, 1, 1,
0.8581905, -0.2068113, 1.304813, 1, 1, 1, 1, 1,
0.8601261, 0.2630588, 0.2640722, 1, 1, 1, 1, 1,
0.8625448, -0.4181453, 2.281043, 1, 1, 1, 1, 1,
0.8632662, -0.3723626, 0.5045038, 1, 1, 1, 1, 1,
0.8633258, -0.6672376, 0.2751852, 1, 1, 1, 1, 1,
0.865634, -0.1000784, 0.7757814, 0, 0, 1, 1, 1,
0.8779802, 1.673502, -0.2173619, 1, 0, 0, 1, 1,
0.8780293, 0.6228792, 0.2048667, 1, 0, 0, 1, 1,
0.8860971, -0.2650203, 3.619056, 1, 0, 0, 1, 1,
0.8868868, -1.863175, 1.340934, 1, 0, 0, 1, 1,
0.8928723, -0.3139954, 1.534848, 1, 0, 0, 1, 1,
0.9035691, -0.08490682, 0.4523411, 0, 0, 0, 1, 1,
0.913869, 0.2794559, 2.105699, 0, 0, 0, 1, 1,
0.9217934, -0.2428974, 2.451583, 0, 0, 0, 1, 1,
0.9247358, -0.6571761, 1.355011, 0, 0, 0, 1, 1,
0.9314252, 0.5451852, 0.04497943, 0, 0, 0, 1, 1,
0.9374048, 0.7563756, 0.3440898, 0, 0, 0, 1, 1,
0.9442101, 2.648109, -0.04959726, 0, 0, 0, 1, 1,
0.9500087, -0.9870255, 3.312054, 1, 1, 1, 1, 1,
0.9605544, -0.5075379, 3.588906, 1, 1, 1, 1, 1,
0.9618917, 2.7397, 1.996473, 1, 1, 1, 1, 1,
0.9654073, -0.9397869, 0.2837349, 1, 1, 1, 1, 1,
0.9660075, -2.431131, 2.657231, 1, 1, 1, 1, 1,
0.9683633, -0.8562337, 2.801919, 1, 1, 1, 1, 1,
0.9692395, 1.341193, 1.553151, 1, 1, 1, 1, 1,
0.9740172, 0.1470159, 1.583084, 1, 1, 1, 1, 1,
0.9795524, -0.6598675, 2.873783, 1, 1, 1, 1, 1,
0.9824702, 0.494366, 0.5152836, 1, 1, 1, 1, 1,
0.9935728, 1.53591, -1.201571, 1, 1, 1, 1, 1,
0.9963639, 0.05722328, -0.3284915, 1, 1, 1, 1, 1,
0.9994944, -0.6621559, 1.511517, 1, 1, 1, 1, 1,
1.011737, 1.743282, 0.7862276, 1, 1, 1, 1, 1,
1.013112, -0.5739366, 2.619151, 1, 1, 1, 1, 1,
1.014277, 0.9900001, 3.750514, 0, 0, 1, 1, 1,
1.0187, -0.6479083, -0.1218254, 1, 0, 0, 1, 1,
1.034654, -0.3793312, 2.976026, 1, 0, 0, 1, 1,
1.03635, 0.1176213, 1.807608, 1, 0, 0, 1, 1,
1.040616, 0.4774159, 1.90574, 1, 0, 0, 1, 1,
1.067229, 0.4471437, 1.628458, 1, 0, 0, 1, 1,
1.071317, 0.4455762, 1.486894, 0, 0, 0, 1, 1,
1.073093, -1.21839, 1.363624, 0, 0, 0, 1, 1,
1.075703, 0.6020991, 0.3517281, 0, 0, 0, 1, 1,
1.077181, -0.9084498, 0.6957169, 0, 0, 0, 1, 1,
1.078506, -1.88609, 1.917391, 0, 0, 0, 1, 1,
1.082339, 0.4860632, 0.5264047, 0, 0, 0, 1, 1,
1.08596, 0.6804982, 2.393403, 0, 0, 0, 1, 1,
1.087455, 0.3390421, -0.2786736, 1, 1, 1, 1, 1,
1.093174, 1.967491, 0.6607032, 1, 1, 1, 1, 1,
1.094739, 0.3171064, 2.116267, 1, 1, 1, 1, 1,
1.098098, -2.226014, 2.042784, 1, 1, 1, 1, 1,
1.105025, 0.727605, 1.50553, 1, 1, 1, 1, 1,
1.117636, 1.156505, -0.6617715, 1, 1, 1, 1, 1,
1.124569, -0.4016576, 2.546604, 1, 1, 1, 1, 1,
1.124779, -0.4183011, 2.07892, 1, 1, 1, 1, 1,
1.129165, 0.257234, 2.532675, 1, 1, 1, 1, 1,
1.134056, 1.131658, 1.102693, 1, 1, 1, 1, 1,
1.138594, -0.5431707, 2.110508, 1, 1, 1, 1, 1,
1.145681, 0.1282091, 2.17792, 1, 1, 1, 1, 1,
1.146305, 1.610287, -0.07842366, 1, 1, 1, 1, 1,
1.148754, 1.984689, 0.3771398, 1, 1, 1, 1, 1,
1.151284, 0.0007425781, 1.944163, 1, 1, 1, 1, 1,
1.154232, 0.3800177, 3.953078, 0, 0, 1, 1, 1,
1.15652, 0.2735294, 1.914915, 1, 0, 0, 1, 1,
1.16073, -1.083106, 3.786623, 1, 0, 0, 1, 1,
1.161136, 1.23715, 0.8920512, 1, 0, 0, 1, 1,
1.162842, -0.7485983, -0.006954846, 1, 0, 0, 1, 1,
1.16503, 0.3987609, 1.307063, 1, 0, 0, 1, 1,
1.165088, 1.404993, 0.7425149, 0, 0, 0, 1, 1,
1.166394, 0.2786115, -0.4580933, 0, 0, 0, 1, 1,
1.167127, -0.8309125, 2.360074, 0, 0, 0, 1, 1,
1.167892, 0.5167727, 0.1007073, 0, 0, 0, 1, 1,
1.168818, 0.948921, 2.568241, 0, 0, 0, 1, 1,
1.175428, 0.2852182, -0.2471277, 0, 0, 0, 1, 1,
1.183259, -0.328872, 2.175899, 0, 0, 0, 1, 1,
1.183583, 0.3266328, 1.234403, 1, 1, 1, 1, 1,
1.188249, -0.1527857, 1.058621, 1, 1, 1, 1, 1,
1.195321, 0.5186864, 2.20145, 1, 1, 1, 1, 1,
1.217422, 0.08950575, 2.41696, 1, 1, 1, 1, 1,
1.222613, 0.8756448, 1.226145, 1, 1, 1, 1, 1,
1.226121, -0.6255571, 1.785901, 1, 1, 1, 1, 1,
1.22773, 0.504961, 2.026567, 1, 1, 1, 1, 1,
1.227832, 0.2016044, 1.596558, 1, 1, 1, 1, 1,
1.229004, 0.3387461, 2.242528, 1, 1, 1, 1, 1,
1.230023, -0.158125, 1.755113, 1, 1, 1, 1, 1,
1.234893, -1.444199, 2.554664, 1, 1, 1, 1, 1,
1.241084, 0.08934301, 1.639621, 1, 1, 1, 1, 1,
1.248841, -1.410573, 3.595622, 1, 1, 1, 1, 1,
1.250179, -0.6724684, 2.776989, 1, 1, 1, 1, 1,
1.259668, 0.7658308, 1.715532, 1, 1, 1, 1, 1,
1.269762, 0.3455719, 2.288949, 0, 0, 1, 1, 1,
1.270267, -0.1417483, 1.408267, 1, 0, 0, 1, 1,
1.273695, -1.49731, 2.635288, 1, 0, 0, 1, 1,
1.282047, 1.084147, 1.495669, 1, 0, 0, 1, 1,
1.286232, -0.7688169, 2.999537, 1, 0, 0, 1, 1,
1.288838, 0.7499191, 0.3454211, 1, 0, 0, 1, 1,
1.292235, -0.6815041, 1.574978, 0, 0, 0, 1, 1,
1.293426, -0.008563457, 0.2961236, 0, 0, 0, 1, 1,
1.30215, 1.508737, 0.3349831, 0, 0, 0, 1, 1,
1.309868, -0.04945913, 3.448488, 0, 0, 0, 1, 1,
1.317436, -0.6683798, 3.496242, 0, 0, 0, 1, 1,
1.320856, -0.5190079, -0.564114, 0, 0, 0, 1, 1,
1.324529, 0.4424794, 1.166618, 0, 0, 0, 1, 1,
1.327441, 0.4334651, -0.03982391, 1, 1, 1, 1, 1,
1.337185, 0.9253512, 0.1459291, 1, 1, 1, 1, 1,
1.358868, -1.584126, 2.417497, 1, 1, 1, 1, 1,
1.367098, -0.2743228, 2.312092, 1, 1, 1, 1, 1,
1.375129, -0.7562104, 3.611804, 1, 1, 1, 1, 1,
1.386552, 0.8822351, -0.8198653, 1, 1, 1, 1, 1,
1.388153, -2.664731, 2.755125, 1, 1, 1, 1, 1,
1.388385, -0.002992294, 2.963028, 1, 1, 1, 1, 1,
1.395498, 0.8727997, -0.798112, 1, 1, 1, 1, 1,
1.414155, 0.6909477, 1.990169, 1, 1, 1, 1, 1,
1.42004, 0.3747894, 1.400256, 1, 1, 1, 1, 1,
1.422083, 0.274877, 0.2312568, 1, 1, 1, 1, 1,
1.423128, -0.01361252, 2.851252, 1, 1, 1, 1, 1,
1.429491, 0.2996036, 2.452386, 1, 1, 1, 1, 1,
1.4331, 0.7964059, 1.074606, 1, 1, 1, 1, 1,
1.436086, 0.2341089, -0.1006479, 0, 0, 1, 1, 1,
1.439821, -0.2762826, 3.321349, 1, 0, 0, 1, 1,
1.445238, 0.1817259, 0.7395179, 1, 0, 0, 1, 1,
1.45201, 0.1077982, 1.520774, 1, 0, 0, 1, 1,
1.453384, -0.9220696, 3.018873, 1, 0, 0, 1, 1,
1.455255, 1.27458, 1.957616, 1, 0, 0, 1, 1,
1.460235, 0.0676913, 3.759808, 0, 0, 0, 1, 1,
1.467402, -0.8052784, 1.831228, 0, 0, 0, 1, 1,
1.487149, -0.0779009, 1.086668, 0, 0, 0, 1, 1,
1.490245, -0.01667414, 0.6990474, 0, 0, 0, 1, 1,
1.490942, -0.02196206, 1.277738, 0, 0, 0, 1, 1,
1.507214, 1.32958, 1.392088, 0, 0, 0, 1, 1,
1.509437, 0.9248188, 2.161211, 0, 0, 0, 1, 1,
1.512093, 1.004321, 1.014259, 1, 1, 1, 1, 1,
1.517232, 0.667666, 1.149877, 1, 1, 1, 1, 1,
1.517552, 0.6523766, 1.174888, 1, 1, 1, 1, 1,
1.521821, -0.366048, 1.870295, 1, 1, 1, 1, 1,
1.528901, -1.236265, 1.170628, 1, 1, 1, 1, 1,
1.544971, -2.435821, 1.854023, 1, 1, 1, 1, 1,
1.558948, 0.7739359, 2.420563, 1, 1, 1, 1, 1,
1.566633, -0.4639268, 2.722445, 1, 1, 1, 1, 1,
1.574493, 0.4141093, -0.1496587, 1, 1, 1, 1, 1,
1.580732, -0.1112381, 1.043242, 1, 1, 1, 1, 1,
1.585272, 0.8912382, 1.193977, 1, 1, 1, 1, 1,
1.585308, 0.8142836, 2.585356, 1, 1, 1, 1, 1,
1.608717, 0.08388189, 1.311966, 1, 1, 1, 1, 1,
1.609576, -0.6292527, 0.3282264, 1, 1, 1, 1, 1,
1.635673, -0.5106146, 4.665842, 1, 1, 1, 1, 1,
1.637719, -0.1191548, 1.246813, 0, 0, 1, 1, 1,
1.661128, 0.5949467, 0.3907009, 1, 0, 0, 1, 1,
1.684196, 0.9911785, 1.941769, 1, 0, 0, 1, 1,
1.715282, -0.6010173, 0.9228772, 1, 0, 0, 1, 1,
1.721038, -1.357324, 1.692406, 1, 0, 0, 1, 1,
1.732287, 1.409303, -0.8724858, 1, 0, 0, 1, 1,
1.763075, 0.1720395, 2.623895, 0, 0, 0, 1, 1,
1.771082, 0.6475165, 1.204657, 0, 0, 0, 1, 1,
1.774128, 0.881017, -0.5392058, 0, 0, 0, 1, 1,
1.776089, -0.3647484, 3.549226, 0, 0, 0, 1, 1,
1.788182, 0.3742724, 3.018468, 0, 0, 0, 1, 1,
1.788824, -0.4634189, 3.039438, 0, 0, 0, 1, 1,
1.801046, 0.03251436, 2.013527, 0, 0, 0, 1, 1,
1.801351, 0.5759197, -0.9845694, 1, 1, 1, 1, 1,
1.810911, 1.751207, 1.675425, 1, 1, 1, 1, 1,
1.841334, -0.7052011, 0.3521931, 1, 1, 1, 1, 1,
1.870754, 1.841201, 1.444382, 1, 1, 1, 1, 1,
1.876771, -0.8114162, 1.634107, 1, 1, 1, 1, 1,
1.88759, -1.641441, 1.14388, 1, 1, 1, 1, 1,
1.889483, -1.327087, 2.494727, 1, 1, 1, 1, 1,
1.894308, -0.4516735, 0.7319384, 1, 1, 1, 1, 1,
1.904002, 1.065923, 1.111959, 1, 1, 1, 1, 1,
1.927939, 0.6732863, 2.782807, 1, 1, 1, 1, 1,
1.930908, 0.4356878, 1.981741, 1, 1, 1, 1, 1,
1.949529, 0.4399273, 0.4370968, 1, 1, 1, 1, 1,
1.957559, 0.2246974, 1.316229, 1, 1, 1, 1, 1,
1.98892, 0.4615409, 0.7454898, 1, 1, 1, 1, 1,
1.990679, 1.029669, 1.802667, 1, 1, 1, 1, 1,
2.001289, 0.1449482, -0.02422586, 0, 0, 1, 1, 1,
2.015427, 0.5998253, 1.405305, 1, 0, 0, 1, 1,
2.021464, 1.468554, 2.158752, 1, 0, 0, 1, 1,
2.042135, -0.6295865, 1.795957, 1, 0, 0, 1, 1,
2.042595, -1.115915, 1.392144, 1, 0, 0, 1, 1,
2.053146, -0.7355325, 2.20928, 1, 0, 0, 1, 1,
2.064165, 1.214858, -0.3976746, 0, 0, 0, 1, 1,
2.203276, -0.8555176, 1.923347, 0, 0, 0, 1, 1,
2.250254, -2.67182, 2.106889, 0, 0, 0, 1, 1,
2.303507, 0.1503939, 0.7555982, 0, 0, 0, 1, 1,
2.314184, 0.385472, 0.132134, 0, 0, 0, 1, 1,
2.349648, -0.07878857, 1.68244, 0, 0, 0, 1, 1,
2.381415, -2.147666, 1.283915, 0, 0, 0, 1, 1,
2.430798, 0.353358, 4.183975, 1, 1, 1, 1, 1,
2.47889, -0.8605988, 2.115443, 1, 1, 1, 1, 1,
2.504006, 0.5935723, 1.670177, 1, 1, 1, 1, 1,
2.529153, 0.9300291, -0.3172224, 1, 1, 1, 1, 1,
2.635451, -0.372756, 1.489559, 1, 1, 1, 1, 1,
2.69219, 0.118858, 0.381283, 1, 1, 1, 1, 1,
3.048065, -0.5019605, 2.791301, 1, 1, 1, 1, 1
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
var radius = 9.311918;
var distance = 32.70771;
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
mvMatrix.translate( -0.1377784, -0.101367, 0.3547089 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.70771);
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
