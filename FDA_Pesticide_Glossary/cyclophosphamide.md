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
-2.772974, 0.03406925, -2.022314, 1, 0, 0, 1,
-2.681503, -1.372191, -2.400045, 1, 0.007843138, 0, 1,
-2.507003, 0.8337935, -1.032518, 1, 0.01176471, 0, 1,
-2.504156, 0.1212825, -1.623441, 1, 0.01960784, 0, 1,
-2.430832, 0.8483628, -0.4017898, 1, 0.02352941, 0, 1,
-2.407167, 0.7996573, -1.48993, 1, 0.03137255, 0, 1,
-2.357572, 0.07588735, -0.4942888, 1, 0.03529412, 0, 1,
-2.355964, 0.7461451, -0.2304537, 1, 0.04313726, 0, 1,
-2.272891, 1.234622, 0.139983, 1, 0.04705882, 0, 1,
-2.257783, 1.129424, -1.968543, 1, 0.05490196, 0, 1,
-2.239251, -0.725858, -1.143807, 1, 0.05882353, 0, 1,
-2.197067, 0.06161587, -1.509807, 1, 0.06666667, 0, 1,
-2.196899, -1.757309, -2.416693, 1, 0.07058824, 0, 1,
-2.143027, 1.166255, -0.05075013, 1, 0.07843138, 0, 1,
-2.126977, -0.1814333, -1.163275, 1, 0.08235294, 0, 1,
-2.122885, 0.5229347, 0.3526131, 1, 0.09019608, 0, 1,
-2.051175, 0.3237027, -2.903545, 1, 0.09411765, 0, 1,
-2.047039, 1.101188, 0.004566219, 1, 0.1019608, 0, 1,
-2.003354, -0.1442788, -0.2549025, 1, 0.1098039, 0, 1,
-1.987234, 0.721696, -1.259212, 1, 0.1137255, 0, 1,
-1.983499, -2.310875, -2.745462, 1, 0.1215686, 0, 1,
-1.925347, -1.046058, -2.331809, 1, 0.1254902, 0, 1,
-1.909118, -0.2970866, -1.898793, 1, 0.1333333, 0, 1,
-1.90514, -0.144205, -1.815565, 1, 0.1372549, 0, 1,
-1.883432, 1.770733, -1.756733, 1, 0.145098, 0, 1,
-1.874087, -0.8814554, -2.888247, 1, 0.1490196, 0, 1,
-1.866177, 1.055195, 0.4510463, 1, 0.1568628, 0, 1,
-1.864107, -2.033212, -1.919352, 1, 0.1607843, 0, 1,
-1.854793, -0.5709247, -1.173229, 1, 0.1686275, 0, 1,
-1.851775, 0.003091566, -0.6261041, 1, 0.172549, 0, 1,
-1.846717, -0.1941023, -2.747346, 1, 0.1803922, 0, 1,
-1.841614, -0.4304796, -2.290887, 1, 0.1843137, 0, 1,
-1.828995, 0.02102951, 0.8003795, 1, 0.1921569, 0, 1,
-1.825403, -0.8451176, -1.993717, 1, 0.1960784, 0, 1,
-1.809286, 1.67209, 0.9404334, 1, 0.2039216, 0, 1,
-1.803656, -1.587502, -2.132213, 1, 0.2117647, 0, 1,
-1.803449, -0.2341392, -3.02387, 1, 0.2156863, 0, 1,
-1.796129, 0.03096151, -1.179102, 1, 0.2235294, 0, 1,
-1.795239, 0.3062958, -0.6609594, 1, 0.227451, 0, 1,
-1.784222, 0.7728878, 1.705457, 1, 0.2352941, 0, 1,
-1.775265, 0.1040026, -1.865869, 1, 0.2392157, 0, 1,
-1.762453, -0.7493786, -2.980991, 1, 0.2470588, 0, 1,
-1.757191, 1.325194, -1.757298, 1, 0.2509804, 0, 1,
-1.756576, 0.4094945, -0.01767996, 1, 0.2588235, 0, 1,
-1.752874, -0.6363125, -1.210749, 1, 0.2627451, 0, 1,
-1.752229, 1.929512, 2.910707, 1, 0.2705882, 0, 1,
-1.744985, 1.625846, 0.4186312, 1, 0.2745098, 0, 1,
-1.739049, 0.7043688, -1.785664, 1, 0.282353, 0, 1,
-1.733406, 0.715589, -2.670362, 1, 0.2862745, 0, 1,
-1.717764, 1.946041, -1.727475, 1, 0.2941177, 0, 1,
-1.699039, -0.01345036, -1.100883, 1, 0.3019608, 0, 1,
-1.689838, -2.22668, -1.263009, 1, 0.3058824, 0, 1,
-1.675179, -1.089886, -2.782496, 1, 0.3137255, 0, 1,
-1.646533, 0.8505901, -1.357572, 1, 0.3176471, 0, 1,
-1.615741, -0.4808929, 0.07427155, 1, 0.3254902, 0, 1,
-1.615634, -0.1793012, -3.208388, 1, 0.3294118, 0, 1,
-1.596282, -0.6246094, -2.486332, 1, 0.3372549, 0, 1,
-1.592887, 1.914339, -1.751384, 1, 0.3411765, 0, 1,
-1.590418, 1.520969, -3.062215, 1, 0.3490196, 0, 1,
-1.580382, -1.12305, -1.623148, 1, 0.3529412, 0, 1,
-1.579306, 1.53142, -1.573976, 1, 0.3607843, 0, 1,
-1.573066, 1.727484, -0.1366958, 1, 0.3647059, 0, 1,
-1.572399, 1.722704, -1.403955, 1, 0.372549, 0, 1,
-1.567749, 0.3062408, -2.363784, 1, 0.3764706, 0, 1,
-1.553369, 1.677037, -1.315201, 1, 0.3843137, 0, 1,
-1.516124, 0.3056117, -0.8228185, 1, 0.3882353, 0, 1,
-1.504916, 0.473472, -1.568118, 1, 0.3960784, 0, 1,
-1.497502, 0.4586597, -0.6872268, 1, 0.4039216, 0, 1,
-1.497047, -1.285699, -2.600801, 1, 0.4078431, 0, 1,
-1.491581, 1.214035, -0.9508123, 1, 0.4156863, 0, 1,
-1.470357, 1.504497, 0.1507901, 1, 0.4196078, 0, 1,
-1.462331, 0.5251409, -0.7163303, 1, 0.427451, 0, 1,
-1.456705, 0.5413638, -1.62406, 1, 0.4313726, 0, 1,
-1.444164, -0.7098119, -1.73696, 1, 0.4392157, 0, 1,
-1.440967, -0.5326571, -1.672204, 1, 0.4431373, 0, 1,
-1.433031, 1.183648, -1.130776, 1, 0.4509804, 0, 1,
-1.424384, -0.8440747, -3.135233, 1, 0.454902, 0, 1,
-1.413469, -1.12339, -1.518312, 1, 0.4627451, 0, 1,
-1.412648, -0.004870041, -2.326182, 1, 0.4666667, 0, 1,
-1.404344, -0.3679777, -2.002312, 1, 0.4745098, 0, 1,
-1.404122, 0.1425009, -1.261632, 1, 0.4784314, 0, 1,
-1.390887, -0.4907889, -1.427339, 1, 0.4862745, 0, 1,
-1.389869, 1.308827, -2.035773, 1, 0.4901961, 0, 1,
-1.389694, -0.2560127, -3.304732, 1, 0.4980392, 0, 1,
-1.374877, -0.289833, -2.32092, 1, 0.5058824, 0, 1,
-1.374689, 1.475533, -1.68694, 1, 0.509804, 0, 1,
-1.370348, -0.1007731, -1.758148, 1, 0.5176471, 0, 1,
-1.368934, 0.8334314, -1.053309, 1, 0.5215687, 0, 1,
-1.367704, -1.54776, -2.566819, 1, 0.5294118, 0, 1,
-1.359084, 0.2219512, 0.3731387, 1, 0.5333334, 0, 1,
-1.358722, -0.7979228, -2.664706, 1, 0.5411765, 0, 1,
-1.358532, 0.6416625, -2.063692, 1, 0.5450981, 0, 1,
-1.344042, -0.5750176, -0.8723177, 1, 0.5529412, 0, 1,
-1.335254, 0.7305103, -0.7705425, 1, 0.5568628, 0, 1,
-1.329588, 1.303748, -0.45675, 1, 0.5647059, 0, 1,
-1.328739, -1.516922, -1.378761, 1, 0.5686275, 0, 1,
-1.328267, 0.03818497, -2.51944, 1, 0.5764706, 0, 1,
-1.326814, 1.335047, -1.270133, 1, 0.5803922, 0, 1,
-1.326086, -1.210708, -2.264569, 1, 0.5882353, 0, 1,
-1.322231, 0.8415332, -0.9436746, 1, 0.5921569, 0, 1,
-1.314055, 1.879928, 1.422181, 1, 0.6, 0, 1,
-1.305902, -0.3716241, 0.1666133, 1, 0.6078432, 0, 1,
-1.300722, -0.3025713, -1.716585, 1, 0.6117647, 0, 1,
-1.298898, 1.10712, -0.8196132, 1, 0.6196079, 0, 1,
-1.297487, 0.1332705, -1.489964, 1, 0.6235294, 0, 1,
-1.27769, 0.4320061, -1.114479, 1, 0.6313726, 0, 1,
-1.275132, -0.8265265, -1.044133, 1, 0.6352941, 0, 1,
-1.272339, 0.8651219, -0.1003405, 1, 0.6431373, 0, 1,
-1.271884, -1.668809, -2.884243, 1, 0.6470588, 0, 1,
-1.269578, -0.09258323, -1.829611, 1, 0.654902, 0, 1,
-1.266663, 0.2406631, -1.36116, 1, 0.6588235, 0, 1,
-1.265031, 0.6202829, -2.417772, 1, 0.6666667, 0, 1,
-1.26366, 1.674006, -0.3751931, 1, 0.6705883, 0, 1,
-1.254129, 1.744226, 1.525036, 1, 0.6784314, 0, 1,
-1.253837, 0.2875216, -2.626336, 1, 0.682353, 0, 1,
-1.248834, 2.346312, 2.230036, 1, 0.6901961, 0, 1,
-1.236596, -2.084747, -3.447804, 1, 0.6941177, 0, 1,
-1.236397, 0.7430686, -1.948012, 1, 0.7019608, 0, 1,
-1.232304, -0.06780977, -0.2023571, 1, 0.7098039, 0, 1,
-1.224941, -0.09009355, -1.749663, 1, 0.7137255, 0, 1,
-1.22188, -0.3209823, -1.241664, 1, 0.7215686, 0, 1,
-1.221754, -0.597005, -2.234262, 1, 0.7254902, 0, 1,
-1.216283, -1.021719, -2.852161, 1, 0.7333333, 0, 1,
-1.204293, -1.483377, -1.708982, 1, 0.7372549, 0, 1,
-1.202954, -2.029305, -2.906468, 1, 0.7450981, 0, 1,
-1.198494, 1.621453, -0.08443789, 1, 0.7490196, 0, 1,
-1.197296, -0.553178, -1.500905, 1, 0.7568628, 0, 1,
-1.193559, -1.070547, -0.7785774, 1, 0.7607843, 0, 1,
-1.182601, 1.253262, -0.0605048, 1, 0.7686275, 0, 1,
-1.181355, -0.8785327, -0.08918228, 1, 0.772549, 0, 1,
-1.171677, -1.44095, -2.255954, 1, 0.7803922, 0, 1,
-1.161354, 0.4419737, 0.3571931, 1, 0.7843137, 0, 1,
-1.156779, -0.2472246, -2.509542, 1, 0.7921569, 0, 1,
-1.156361, -0.874046, -1.922967, 1, 0.7960784, 0, 1,
-1.153495, -0.5755761, -1.936383, 1, 0.8039216, 0, 1,
-1.149838, 1.099142, -0.4269586, 1, 0.8117647, 0, 1,
-1.149608, 0.120462, -0.8526958, 1, 0.8156863, 0, 1,
-1.143096, 1.788575, 0.02410357, 1, 0.8235294, 0, 1,
-1.135005, 0.2403914, -2.470295, 1, 0.827451, 0, 1,
-1.121657, 0.6507031, 0.0211457, 1, 0.8352941, 0, 1,
-1.12155, -0.4577936, -2.059255, 1, 0.8392157, 0, 1,
-1.113346, -0.3082606, -1.913865, 1, 0.8470588, 0, 1,
-1.110282, -0.8928992, -1.053419, 1, 0.8509804, 0, 1,
-1.099842, 0.5773745, -1.138497, 1, 0.8588235, 0, 1,
-1.096327, 0.2282598, -2.646806, 1, 0.8627451, 0, 1,
-1.089775, 0.4206807, 0.2699219, 1, 0.8705882, 0, 1,
-1.087777, 0.3637213, -2.742053, 1, 0.8745098, 0, 1,
-1.087152, -0.1266642, -0.08146775, 1, 0.8823529, 0, 1,
-1.083872, -0.9390942, -3.014395, 1, 0.8862745, 0, 1,
-1.079298, 0.05433444, -4.238461, 1, 0.8941177, 0, 1,
-1.074444, 1.242105, -0.7056592, 1, 0.8980392, 0, 1,
-1.067374, 0.5937439, 1.035211, 1, 0.9058824, 0, 1,
-1.065246, 0.3334131, -1.653729, 1, 0.9137255, 0, 1,
-1.057243, -0.3758201, 0.003443002, 1, 0.9176471, 0, 1,
-1.057024, 1.649256, -0.5255067, 1, 0.9254902, 0, 1,
-1.049022, -0.1936803, 0.7716237, 1, 0.9294118, 0, 1,
-1.042183, 0.4243095, -0.7148601, 1, 0.9372549, 0, 1,
-1.041041, 1.584626, -2.66715, 1, 0.9411765, 0, 1,
-1.035752, -1.135015, -1.805096, 1, 0.9490196, 0, 1,
-1.034465, -0.6368493, -0.5448099, 1, 0.9529412, 0, 1,
-1.034263, 0.1796179, -1.661951, 1, 0.9607843, 0, 1,
-1.026523, -1.590271, -1.2617, 1, 0.9647059, 0, 1,
-1.025452, 1.329974, -0.9277277, 1, 0.972549, 0, 1,
-1.01625, -0.2387532, -2.143004, 1, 0.9764706, 0, 1,
-1.014779, -0.6416902, -2.791813, 1, 0.9843137, 0, 1,
-1.013135, 1.145489, -1.332901, 1, 0.9882353, 0, 1,
-1.00075, 0.9777447, -0.6068178, 1, 0.9960784, 0, 1,
-1.00007, -0.6877961, -1.852848, 0.9960784, 1, 0, 1,
-0.999577, -1.045406, -3.380472, 0.9921569, 1, 0, 1,
-0.9992881, -1.937707, -0.4864486, 0.9843137, 1, 0, 1,
-0.9990236, -0.5126698, -2.133339, 0.9803922, 1, 0, 1,
-0.9928903, -0.0744582, -0.4197816, 0.972549, 1, 0, 1,
-0.9847965, -1.364527, -3.654298, 0.9686275, 1, 0, 1,
-0.9811481, -2.452342, -4.155425, 0.9607843, 1, 0, 1,
-0.9780862, 0.268888, -3.033171, 0.9568627, 1, 0, 1,
-0.9682463, 1.953783, -1.0575, 0.9490196, 1, 0, 1,
-0.9620632, 0.04338846, -1.215452, 0.945098, 1, 0, 1,
-0.9610358, 1.864742, -2.282682, 0.9372549, 1, 0, 1,
-0.9596917, -1.532618e-05, 0.5135751, 0.9333333, 1, 0, 1,
-0.9571033, -1.817054, -3.82292, 0.9254902, 1, 0, 1,
-0.9527358, 1.150942, -1.46854, 0.9215686, 1, 0, 1,
-0.9468033, 0.6753262, -1.669999, 0.9137255, 1, 0, 1,
-0.9400824, 2.057702, 1.80538, 0.9098039, 1, 0, 1,
-0.9396991, -0.320423, -2.207979, 0.9019608, 1, 0, 1,
-0.9393857, -0.07587359, -0.01043073, 0.8941177, 1, 0, 1,
-0.9388092, 0.660605, -0.1368401, 0.8901961, 1, 0, 1,
-0.9355157, -0.9216604, -2.715588, 0.8823529, 1, 0, 1,
-0.93495, 0.2658644, -0.9552516, 0.8784314, 1, 0, 1,
-0.9349472, 1.743279, 1.683874, 0.8705882, 1, 0, 1,
-0.9299829, 1.670946, 1.178071, 0.8666667, 1, 0, 1,
-0.9289905, -0.01009877, -2.154233, 0.8588235, 1, 0, 1,
-0.9286634, 1.429993, -0.6003994, 0.854902, 1, 0, 1,
-0.9223952, -0.8978067, -1.280403, 0.8470588, 1, 0, 1,
-0.921892, 1.102966, 0.5632975, 0.8431373, 1, 0, 1,
-0.9197073, 1.246653, 0.6409276, 0.8352941, 1, 0, 1,
-0.9149739, 1.511674, -0.3018569, 0.8313726, 1, 0, 1,
-0.9096493, -1.928989, -2.837084, 0.8235294, 1, 0, 1,
-0.9075584, -0.07007062, -1.437185, 0.8196079, 1, 0, 1,
-0.9060968, -0.2807593, -1.897796, 0.8117647, 1, 0, 1,
-0.9059911, 0.3159141, -0.3073122, 0.8078431, 1, 0, 1,
-0.897181, 0.5700287, -0.3683714, 0.8, 1, 0, 1,
-0.8915944, 2.535825, -0.08552291, 0.7921569, 1, 0, 1,
-0.8748042, 0.1331379, 1.689961, 0.7882353, 1, 0, 1,
-0.866442, -1.71539, -2.116647, 0.7803922, 1, 0, 1,
-0.8642351, 0.2920246, -2.423051, 0.7764706, 1, 0, 1,
-0.8633352, -0.1920421, -2.135313, 0.7686275, 1, 0, 1,
-0.8601347, -0.5426074, -0.6780467, 0.7647059, 1, 0, 1,
-0.853468, -0.7795359, -1.20011, 0.7568628, 1, 0, 1,
-0.8521019, 1.031643, -1.53922, 0.7529412, 1, 0, 1,
-0.8488776, -1.272918, -1.944142, 0.7450981, 1, 0, 1,
-0.8481951, 0.2628843, -2.377271, 0.7411765, 1, 0, 1,
-0.843147, -0.07086252, -0.3379058, 0.7333333, 1, 0, 1,
-0.842368, -0.2702923, -2.357649, 0.7294118, 1, 0, 1,
-0.8381832, -1.799121, -3.732371, 0.7215686, 1, 0, 1,
-0.8367643, -0.5642627, -1.820754, 0.7176471, 1, 0, 1,
-0.8310928, -1.14607, -3.204747, 0.7098039, 1, 0, 1,
-0.8283256, 1.827568, -0.1302666, 0.7058824, 1, 0, 1,
-0.821532, 0.7177061, -2.584175, 0.6980392, 1, 0, 1,
-0.8160447, 0.05018253, -2.627343, 0.6901961, 1, 0, 1,
-0.8082352, 1.140314, 0.6751555, 0.6862745, 1, 0, 1,
-0.8051171, 0.6836686, -2.096317, 0.6784314, 1, 0, 1,
-0.8022081, -1.766169, -1.287678, 0.6745098, 1, 0, 1,
-0.7923201, 0.978946, -1.81756, 0.6666667, 1, 0, 1,
-0.7901998, -0.01813183, -1.932585, 0.6627451, 1, 0, 1,
-0.7874699, -0.9001024, -2.882513, 0.654902, 1, 0, 1,
-0.7863914, -0.09501341, -2.86384, 0.6509804, 1, 0, 1,
-0.7791712, 1.74307, -1.152444, 0.6431373, 1, 0, 1,
-0.7737357, -1.552909, -0.8581024, 0.6392157, 1, 0, 1,
-0.771449, 0.08368631, -2.593433, 0.6313726, 1, 0, 1,
-0.7660307, -0.4235155, -2.403339, 0.627451, 1, 0, 1,
-0.765789, 1.60557, -0.1502729, 0.6196079, 1, 0, 1,
-0.7612811, 0.8000358, -2.008662, 0.6156863, 1, 0, 1,
-0.757827, -0.5788716, -1.821558, 0.6078432, 1, 0, 1,
-0.7554986, 1.038309, -1.994283, 0.6039216, 1, 0, 1,
-0.7529195, 0.126288, -1.689963, 0.5960785, 1, 0, 1,
-0.7497705, 1.358186, -0.06223648, 0.5882353, 1, 0, 1,
-0.7481223, 1.528133, -0.1133945, 0.5843138, 1, 0, 1,
-0.744492, 0.6733822, -1.732873, 0.5764706, 1, 0, 1,
-0.7436794, -2.986408, -4.134415, 0.572549, 1, 0, 1,
-0.7404006, 2.475035, 0.05304814, 0.5647059, 1, 0, 1,
-0.7393622, 1.170347, -1.042939, 0.5607843, 1, 0, 1,
-0.7366477, -0.09572503, -1.890458, 0.5529412, 1, 0, 1,
-0.7363977, 1.400551, 0.107978, 0.5490196, 1, 0, 1,
-0.7361172, 0.8637103, 0.1819805, 0.5411765, 1, 0, 1,
-0.7340887, 1.58006, 0.6239385, 0.5372549, 1, 0, 1,
-0.7339506, 1.032346, -1.479791, 0.5294118, 1, 0, 1,
-0.7317775, 0.09359446, -1.753265, 0.5254902, 1, 0, 1,
-0.7306345, 1.885112, -1.976665, 0.5176471, 1, 0, 1,
-0.729513, -0.0697918, -1.669723, 0.5137255, 1, 0, 1,
-0.7192327, 1.867103, 0.9227322, 0.5058824, 1, 0, 1,
-0.7152571, 0.3716068, -1.37979, 0.5019608, 1, 0, 1,
-0.7118092, -0.8297498, -3.841228, 0.4941176, 1, 0, 1,
-0.7057468, 0.7073457, 0.7618665, 0.4862745, 1, 0, 1,
-0.6987987, 0.8355172, -0.3658143, 0.4823529, 1, 0, 1,
-0.6961171, 2.051532, 0.0748589, 0.4745098, 1, 0, 1,
-0.6929598, -0.2766738, -1.707025, 0.4705882, 1, 0, 1,
-0.6846214, -0.3263887, -1.061196, 0.4627451, 1, 0, 1,
-0.677541, 0.5212978, -1.531238, 0.4588235, 1, 0, 1,
-0.6751016, -0.7036968, -2.128824, 0.4509804, 1, 0, 1,
-0.6729026, -1.45479, -4.091819, 0.4470588, 1, 0, 1,
-0.6724678, -0.2663879, -2.523334, 0.4392157, 1, 0, 1,
-0.6703994, -2.248081, -1.585289, 0.4352941, 1, 0, 1,
-0.6669632, 0.2145387, -1.189521, 0.427451, 1, 0, 1,
-0.6637035, -1.276965, -2.013829, 0.4235294, 1, 0, 1,
-0.65696, -0.3350251, -2.646327, 0.4156863, 1, 0, 1,
-0.6566744, -1.051993, -2.517329, 0.4117647, 1, 0, 1,
-0.6557794, -0.7921956, -2.599257, 0.4039216, 1, 0, 1,
-0.6522076, 0.07379968, -3.296242, 0.3960784, 1, 0, 1,
-0.6507055, -0.1635718, -3.036952, 0.3921569, 1, 0, 1,
-0.650192, -0.09496995, -0.9465923, 0.3843137, 1, 0, 1,
-0.6377177, -1.160424, -3.463479, 0.3803922, 1, 0, 1,
-0.6312963, -0.9399375, -1.505234, 0.372549, 1, 0, 1,
-0.6311336, -2.217745, -2.894278, 0.3686275, 1, 0, 1,
-0.6298059, 0.4489905, 0.3225539, 0.3607843, 1, 0, 1,
-0.6248723, 0.6326737, -2.045939, 0.3568628, 1, 0, 1,
-0.6235741, 0.08497957, -3.882802, 0.3490196, 1, 0, 1,
-0.6192678, 0.5479857, -0.8023559, 0.345098, 1, 0, 1,
-0.6183123, 0.3728071, -1.549071, 0.3372549, 1, 0, 1,
-0.616106, -0.3513353, -2.595198, 0.3333333, 1, 0, 1,
-0.6125551, 0.5779086, -1.923937, 0.3254902, 1, 0, 1,
-0.6105008, 0.9976439, -0.24067, 0.3215686, 1, 0, 1,
-0.5992256, 0.7982033, -0.03182722, 0.3137255, 1, 0, 1,
-0.5975829, -0.4518887, -1.830108, 0.3098039, 1, 0, 1,
-0.5880947, -0.530246, -1.786281, 0.3019608, 1, 0, 1,
-0.5854153, 0.5770994, -3.374035, 0.2941177, 1, 0, 1,
-0.5853163, 1.322544, -1.205945, 0.2901961, 1, 0, 1,
-0.578724, 0.5620432, -2.617785, 0.282353, 1, 0, 1,
-0.5782897, -0.5369956, -0.7513447, 0.2784314, 1, 0, 1,
-0.577978, 0.5976932, -2.102915, 0.2705882, 1, 0, 1,
-0.5742163, 0.5969527, -0.8926091, 0.2666667, 1, 0, 1,
-0.5692798, 0.4262955, 0.1123777, 0.2588235, 1, 0, 1,
-0.5692458, 0.5189365, -1.969205, 0.254902, 1, 0, 1,
-0.5644987, 1.409108, 0.930202, 0.2470588, 1, 0, 1,
-0.5536966, 0.4024903, -2.08872, 0.2431373, 1, 0, 1,
-0.5525223, -0.2618555, -3.090876, 0.2352941, 1, 0, 1,
-0.548134, 0.1787148, -0.6543908, 0.2313726, 1, 0, 1,
-0.5470009, -0.5294245, -1.902032, 0.2235294, 1, 0, 1,
-0.5467602, -0.3537115, -0.8415895, 0.2196078, 1, 0, 1,
-0.5452602, -0.8730758, -1.972513, 0.2117647, 1, 0, 1,
-0.5404174, 3.020579, 1.003861, 0.2078431, 1, 0, 1,
-0.5379338, -0.3762039, -1.43394, 0.2, 1, 0, 1,
-0.5342237, 0.2672258, -1.898219, 0.1921569, 1, 0, 1,
-0.5261396, 0.08208384, 0.9157992, 0.1882353, 1, 0, 1,
-0.5244695, 0.207142, -2.950588, 0.1803922, 1, 0, 1,
-0.524262, -1.721587, -2.864074, 0.1764706, 1, 0, 1,
-0.5225381, 2.459919, -0.1004184, 0.1686275, 1, 0, 1,
-0.5220028, 0.4688606, -0.3369496, 0.1647059, 1, 0, 1,
-0.5203269, 1.508992, -0.7096162, 0.1568628, 1, 0, 1,
-0.5186174, 0.5646991, -1.133721, 0.1529412, 1, 0, 1,
-0.5129016, 1.575184, -2.192295, 0.145098, 1, 0, 1,
-0.510489, 0.3602568, -0.5593485, 0.1411765, 1, 0, 1,
-0.5099086, -0.2351069, -2.664632, 0.1333333, 1, 0, 1,
-0.5042058, -0.08042249, -0.8379437, 0.1294118, 1, 0, 1,
-0.5013916, 1.045969, -0.3144816, 0.1215686, 1, 0, 1,
-0.500553, 1.66245, -0.8256893, 0.1176471, 1, 0, 1,
-0.4999829, 0.8699363, -1.01788, 0.1098039, 1, 0, 1,
-0.496791, 0.9781251, -1.603303, 0.1058824, 1, 0, 1,
-0.495223, 0.8279701, -1.164729, 0.09803922, 1, 0, 1,
-0.4881125, -1.092491, -2.436849, 0.09019608, 1, 0, 1,
-0.4870405, 1.178262, -0.1038814, 0.08627451, 1, 0, 1,
-0.4863987, -0.2696895, -0.853376, 0.07843138, 1, 0, 1,
-0.4842181, 0.3578355, -1.675999, 0.07450981, 1, 0, 1,
-0.4818735, -0.8988514, -1.732357, 0.06666667, 1, 0, 1,
-0.4789985, 0.5209137, 1.132936, 0.0627451, 1, 0, 1,
-0.4785752, 0.06969238, -2.405813, 0.05490196, 1, 0, 1,
-0.4784993, 1.202466, -0.07772119, 0.05098039, 1, 0, 1,
-0.4782713, -0.6347337, -2.440093, 0.04313726, 1, 0, 1,
-0.476802, -1.34156, -4.965474, 0.03921569, 1, 0, 1,
-0.4733792, 0.6282709, -1.045426, 0.03137255, 1, 0, 1,
-0.4733263, -0.885344, -1.351519, 0.02745098, 1, 0, 1,
-0.4691073, -0.450112, -4.646287, 0.01960784, 1, 0, 1,
-0.4684914, 0.5393101, 0.3537801, 0.01568628, 1, 0, 1,
-0.4676285, 0.6333691, -1.778331, 0.007843138, 1, 0, 1,
-0.4664203, 0.6957856, -1.672175, 0.003921569, 1, 0, 1,
-0.4634244, -0.4022167, -2.625305, 0, 1, 0.003921569, 1,
-0.4618587, 0.290905, -0.3037054, 0, 1, 0.01176471, 1,
-0.4617082, -0.04385248, -0.2601634, 0, 1, 0.01568628, 1,
-0.4611143, -2.530815, -2.876369, 0, 1, 0.02352941, 1,
-0.4605808, -0.4993972, -1.669662, 0, 1, 0.02745098, 1,
-0.4599316, -0.7763171, -3.352365, 0, 1, 0.03529412, 1,
-0.4586982, 0.4033377, -2.691755, 0, 1, 0.03921569, 1,
-0.4586728, -0.3957963, -3.292456, 0, 1, 0.04705882, 1,
-0.4585969, 1.387711, -2.373429, 0, 1, 0.05098039, 1,
-0.4559048, 0.3829794, -1.182487, 0, 1, 0.05882353, 1,
-0.4476277, -0.1675707, -2.321803, 0, 1, 0.0627451, 1,
-0.4462192, -1.969825, -2.278692, 0, 1, 0.07058824, 1,
-0.4431667, 2.037642, -0.1336812, 0, 1, 0.07450981, 1,
-0.4427626, -0.296326, -2.566772, 0, 1, 0.08235294, 1,
-0.4417626, -1.855299, -4.959571, 0, 1, 0.08627451, 1,
-0.4386781, 0.3185939, 0.6767132, 0, 1, 0.09411765, 1,
-0.4372807, 1.220476, -0.3729986, 0, 1, 0.1019608, 1,
-0.4345917, 0.9341191, -0.3792356, 0, 1, 0.1058824, 1,
-0.4342076, 0.5261398, 0.4994442, 0, 1, 0.1137255, 1,
-0.4320618, -1.291925, -0.5276204, 0, 1, 0.1176471, 1,
-0.4300445, 0.5882027, -1.563993, 0, 1, 0.1254902, 1,
-0.4290526, 0.06531139, -0.2982319, 0, 1, 0.1294118, 1,
-0.4270429, 0.2372235, -1.493389, 0, 1, 0.1372549, 1,
-0.4250519, 0.7813005, -0.3398956, 0, 1, 0.1411765, 1,
-0.4247457, 1.08505, -0.9644029, 0, 1, 0.1490196, 1,
-0.4242324, 0.03107687, -2.694745, 0, 1, 0.1529412, 1,
-0.4241944, -0.5921538, -3.296864, 0, 1, 0.1607843, 1,
-0.4232839, 0.8982977, 0.675664, 0, 1, 0.1647059, 1,
-0.4208563, -0.03568655, -0.67066, 0, 1, 0.172549, 1,
-0.4206141, -0.06368158, -0.3308349, 0, 1, 0.1764706, 1,
-0.4187194, 1.358014, -0.3045109, 0, 1, 0.1843137, 1,
-0.4102065, 0.9808176, -0.875255, 0, 1, 0.1882353, 1,
-0.4086112, 0.2149187, -2.563096, 0, 1, 0.1960784, 1,
-0.4027877, -0.3909355, -1.738034, 0, 1, 0.2039216, 1,
-0.4023353, -0.4761519, -2.893284, 0, 1, 0.2078431, 1,
-0.3959455, 0.8888453, -0.4334034, 0, 1, 0.2156863, 1,
-0.3956021, 0.03150862, -2.858178, 0, 1, 0.2196078, 1,
-0.388802, 0.3415971, -0.8433878, 0, 1, 0.227451, 1,
-0.3885336, -0.5424553, -3.706869, 0, 1, 0.2313726, 1,
-0.3857222, 0.3880873, -0.7095696, 0, 1, 0.2392157, 1,
-0.3853413, -0.2659634, -3.506721, 0, 1, 0.2431373, 1,
-0.3803944, -0.9027093, -2.320173, 0, 1, 0.2509804, 1,
-0.3759547, -1.120899, -2.684613, 0, 1, 0.254902, 1,
-0.3747816, 0.1926037, -1.993989, 0, 1, 0.2627451, 1,
-0.3719053, -2.130337, -1.622922, 0, 1, 0.2666667, 1,
-0.3687849, 0.3511792, -1.242029, 0, 1, 0.2745098, 1,
-0.367019, 0.231637, -0.5353333, 0, 1, 0.2784314, 1,
-0.3633121, -1.110168, -2.404782, 0, 1, 0.2862745, 1,
-0.3605444, -0.9733906, -1.523106, 0, 1, 0.2901961, 1,
-0.3585159, -0.2292245, -1.959926, 0, 1, 0.2980392, 1,
-0.3573311, -0.3913637, -2.048898, 0, 1, 0.3058824, 1,
-0.3566509, -0.6575295, -2.195232, 0, 1, 0.3098039, 1,
-0.3534268, -0.06162507, -1.291905, 0, 1, 0.3176471, 1,
-0.3528501, -1.244009, -3.787126, 0, 1, 0.3215686, 1,
-0.3527272, 0.05338332, -1.208934, 0, 1, 0.3294118, 1,
-0.3479615, 0.8720418, -0.3489301, 0, 1, 0.3333333, 1,
-0.3471795, 0.6055233, -1.038899, 0, 1, 0.3411765, 1,
-0.3459783, -0.9671711, -2.272579, 0, 1, 0.345098, 1,
-0.3398741, 0.6489721, -0.05091363, 0, 1, 0.3529412, 1,
-0.33824, 0.3856607, -2.329681, 0, 1, 0.3568628, 1,
-0.334778, 0.1078199, 0.5777726, 0, 1, 0.3647059, 1,
-0.333373, 0.8889027, -1.27996, 0, 1, 0.3686275, 1,
-0.3326271, -0.9264433, -3.61569, 0, 1, 0.3764706, 1,
-0.3305469, 0.6577054, 0.850933, 0, 1, 0.3803922, 1,
-0.328317, -1.258659, -1.332703, 0, 1, 0.3882353, 1,
-0.3269091, 0.100793, 0.06513901, 0, 1, 0.3921569, 1,
-0.3262733, -0.6733576, -3.280256, 0, 1, 0.4, 1,
-0.3254047, 0.8033663, 0.7191042, 0, 1, 0.4078431, 1,
-0.3244904, -0.7610646, -3.807794, 0, 1, 0.4117647, 1,
-0.3227009, -0.2749817, -0.374153, 0, 1, 0.4196078, 1,
-0.3198082, -1.310986, -3.968317, 0, 1, 0.4235294, 1,
-0.319326, -1.005755, -0.7951736, 0, 1, 0.4313726, 1,
-0.3189331, -0.9996315, -2.541375, 0, 1, 0.4352941, 1,
-0.3135851, -0.394011, -3.519166, 0, 1, 0.4431373, 1,
-0.3016969, -0.8080657, -2.266732, 0, 1, 0.4470588, 1,
-0.300127, -0.06543697, -3.188592, 0, 1, 0.454902, 1,
-0.2984154, 1.088141, -1.626229, 0, 1, 0.4588235, 1,
-0.2966735, 0.397928, -0.6545228, 0, 1, 0.4666667, 1,
-0.294662, -1.609166, -2.680719, 0, 1, 0.4705882, 1,
-0.2861586, 0.249098, -2.182119, 0, 1, 0.4784314, 1,
-0.2858694, -0.5666097, -2.058756, 0, 1, 0.4823529, 1,
-0.282088, 0.02223375, -1.600981, 0, 1, 0.4901961, 1,
-0.2786806, 0.5041224, -1.026664, 0, 1, 0.4941176, 1,
-0.2749346, 0.9023604, -0.6183439, 0, 1, 0.5019608, 1,
-0.2746155, 0.869285, 1.60978, 0, 1, 0.509804, 1,
-0.2697786, 1.240991, -1.724489, 0, 1, 0.5137255, 1,
-0.2684385, -0.5817529, -2.925143, 0, 1, 0.5215687, 1,
-0.2666456, 0.4817508, -1.216142, 0, 1, 0.5254902, 1,
-0.2662443, 0.2891621, -2.66162, 0, 1, 0.5333334, 1,
-0.2620075, 0.6012232, 0.8888994, 0, 1, 0.5372549, 1,
-0.2615393, 0.8285559, -1.891851, 0, 1, 0.5450981, 1,
-0.2511252, 1.809748, -2.04646, 0, 1, 0.5490196, 1,
-0.2493035, -0.6935694, -2.928178, 0, 1, 0.5568628, 1,
-0.2434787, -0.1934127, -1.765151, 0, 1, 0.5607843, 1,
-0.2400628, -1.048656, -3.126256, 0, 1, 0.5686275, 1,
-0.2393606, -0.8925503, -2.912695, 0, 1, 0.572549, 1,
-0.2384431, -1.202064, -3.335033, 0, 1, 0.5803922, 1,
-0.2352924, 2.396988, -0.5350735, 0, 1, 0.5843138, 1,
-0.232559, 1.321455, 0.952951, 0, 1, 0.5921569, 1,
-0.2238393, 2.445467, -1.351692, 0, 1, 0.5960785, 1,
-0.2219709, -0.05657603, -2.469748, 0, 1, 0.6039216, 1,
-0.2210437, 0.6272321, -0.1454529, 0, 1, 0.6117647, 1,
-0.2207981, -1.032452, -3.579555, 0, 1, 0.6156863, 1,
-0.217472, -0.3481982, -2.904316, 0, 1, 0.6235294, 1,
-0.2158325, 0.03006645, -2.179013, 0, 1, 0.627451, 1,
-0.2134401, -0.4118634, -3.517569, 0, 1, 0.6352941, 1,
-0.2114923, -0.06491283, -1.801368, 0, 1, 0.6392157, 1,
-0.2063423, -0.4563192, -2.919426, 0, 1, 0.6470588, 1,
-0.2047166, -0.3532329, -3.978469, 0, 1, 0.6509804, 1,
-0.2037414, 0.5566983, -0.4784784, 0, 1, 0.6588235, 1,
-0.2029051, 0.8795353, -2.117379, 0, 1, 0.6627451, 1,
-0.1996364, 0.3432349, -1.452896, 0, 1, 0.6705883, 1,
-0.1964631, -0.7696202, -2.780396, 0, 1, 0.6745098, 1,
-0.1945346, 0.2144869, -1.689138, 0, 1, 0.682353, 1,
-0.1905207, 1.551282, 0.5447023, 0, 1, 0.6862745, 1,
-0.1892891, 0.9053254, 0.7208011, 0, 1, 0.6941177, 1,
-0.1779979, -0.01362616, -1.724019, 0, 1, 0.7019608, 1,
-0.1723855, 0.06408801, -2.432788, 0, 1, 0.7058824, 1,
-0.1710382, 0.9176801, 0.2443335, 0, 1, 0.7137255, 1,
-0.1708721, -0.4963712, -0.4917923, 0, 1, 0.7176471, 1,
-0.168117, -1.072809, -2.461418, 0, 1, 0.7254902, 1,
-0.1667512, 1.424397, -0.7770275, 0, 1, 0.7294118, 1,
-0.1649043, -0.2635208, -3.18771, 0, 1, 0.7372549, 1,
-0.1604289, -0.1337847, -1.851246, 0, 1, 0.7411765, 1,
-0.1603358, -0.09706762, -0.9614015, 0, 1, 0.7490196, 1,
-0.1582638, 1.223179, -0.8632326, 0, 1, 0.7529412, 1,
-0.1569545, -0.7165129, -2.404817, 0, 1, 0.7607843, 1,
-0.1480735, 0.06930152, -0.5764896, 0, 1, 0.7647059, 1,
-0.1449812, 1.105857, -0.963913, 0, 1, 0.772549, 1,
-0.1380087, 0.9185399, 0.9929916, 0, 1, 0.7764706, 1,
-0.1327558, -0.07119472, -1.746335, 0, 1, 0.7843137, 1,
-0.1238117, -1.164424, -0.6947269, 0, 1, 0.7882353, 1,
-0.1236049, 0.5676969, -0.80934, 0, 1, 0.7960784, 1,
-0.123384, -0.8882109, -2.579156, 0, 1, 0.8039216, 1,
-0.1225083, 0.1972966, -1.065633, 0, 1, 0.8078431, 1,
-0.1220625, 0.008643735, -2.768439, 0, 1, 0.8156863, 1,
-0.119571, 1.160993, -0.2070556, 0, 1, 0.8196079, 1,
-0.1190115, 0.8506982, -0.03642883, 0, 1, 0.827451, 1,
-0.1188676, -0.6368136, -3.481204, 0, 1, 0.8313726, 1,
-0.1188526, -0.1659651, -3.02052, 0, 1, 0.8392157, 1,
-0.1165859, -1.532065, -3.113652, 0, 1, 0.8431373, 1,
-0.1163781, 1.809413, 0.7559307, 0, 1, 0.8509804, 1,
-0.1157993, -0.9272004, -3.256948, 0, 1, 0.854902, 1,
-0.1155233, -1.783307, -3.124676, 0, 1, 0.8627451, 1,
-0.1102088, 0.4582208, 1.364364, 0, 1, 0.8666667, 1,
-0.1101225, -0.2870772, -3.705643, 0, 1, 0.8745098, 1,
-0.1072072, -0.1917273, -3.273934, 0, 1, 0.8784314, 1,
-0.1069591, 2.414696, -1.877408, 0, 1, 0.8862745, 1,
-0.1057925, -0.5128387, -0.9887087, 0, 1, 0.8901961, 1,
-0.1034524, 0.5269666, 1.035143, 0, 1, 0.8980392, 1,
-0.1030903, -0.7075618, -2.414896, 0, 1, 0.9058824, 1,
-0.1017638, -0.6398953, -0.602347, 0, 1, 0.9098039, 1,
-0.1013291, 0.7350712, -0.2935616, 0, 1, 0.9176471, 1,
-0.1007072, -0.5905141, -2.854118, 0, 1, 0.9215686, 1,
-0.09723379, -1.34924, -4.057652, 0, 1, 0.9294118, 1,
-0.09419364, -0.5227997, -2.058229, 0, 1, 0.9333333, 1,
-0.08470345, 0.1533929, 0.0227451, 0, 1, 0.9411765, 1,
-0.0837234, 0.9246982, 0.0954653, 0, 1, 0.945098, 1,
-0.08302947, -0.5316944, -3.890835, 0, 1, 0.9529412, 1,
-0.08106453, -0.4539154, -1.66225, 0, 1, 0.9568627, 1,
-0.07569347, 0.6078328, -0.886166, 0, 1, 0.9647059, 1,
-0.07432466, 0.5849621, -1.812665, 0, 1, 0.9686275, 1,
-0.06754751, -0.2144459, -1.590559, 0, 1, 0.9764706, 1,
-0.06488703, -1.746919, -1.383915, 0, 1, 0.9803922, 1,
-0.06069847, -0.5516005, -3.198967, 0, 1, 0.9882353, 1,
-0.05843315, 0.5169144, -0.7224897, 0, 1, 0.9921569, 1,
-0.05616127, -0.9250677, -3.85569, 0, 1, 1, 1,
-0.05613876, -1.541754, -2.302372, 0, 0.9921569, 1, 1,
-0.05555594, 0.2117379, 1.053516, 0, 0.9882353, 1, 1,
-0.04963468, -2.802232, -2.496973, 0, 0.9803922, 1, 1,
-0.04543923, -1.235902, -4.231639, 0, 0.9764706, 1, 1,
-0.04400831, -0.4630187, -3.087346, 0, 0.9686275, 1, 1,
-0.03760968, -0.1474563, -3.008883, 0, 0.9647059, 1, 1,
-0.03585211, -1.584934, -4.014913, 0, 0.9568627, 1, 1,
-0.03389691, -0.3431492, -2.260423, 0, 0.9529412, 1, 1,
-0.03356739, 1.53116, -0.5845127, 0, 0.945098, 1, 1,
-0.03057755, 1.186055, 1.236265, 0, 0.9411765, 1, 1,
-0.030548, 0.4950102, -0.149443, 0, 0.9333333, 1, 1,
-0.02716259, -0.8181315, -2.571928, 0, 0.9294118, 1, 1,
-0.02618938, 0.2964906, 1.154201, 0, 0.9215686, 1, 1,
-0.0149606, -2.156485, -3.601254, 0, 0.9176471, 1, 1,
-0.01364578, -0.5979259, -4.945831, 0, 0.9098039, 1, 1,
-0.01352578, -0.0008721089, -2.433019, 0, 0.9058824, 1, 1,
-0.01260993, -1.241248, -3.774744, 0, 0.8980392, 1, 1,
-0.01255828, 0.2068717, 0.3174695, 0, 0.8901961, 1, 1,
-0.01190402, -1.259709, -4.32515, 0, 0.8862745, 1, 1,
-0.01172134, 1.927928, -0.9475204, 0, 0.8784314, 1, 1,
-0.01167433, 0.1217913, -1.449615, 0, 0.8745098, 1, 1,
-0.01157221, 0.03266382, -1.802864, 0, 0.8666667, 1, 1,
-0.008229368, 0.2505817, -0.1358969, 0, 0.8627451, 1, 1,
-0.004788083, -0.4419999, -4.201783, 0, 0.854902, 1, 1,
-0.003546724, 0.4058162, 0.6810699, 0, 0.8509804, 1, 1,
-0.003316691, -0.7081125, -4.851774, 0, 0.8431373, 1, 1,
-0.003046126, 1.226083, 0.4060172, 0, 0.8392157, 1, 1,
0.00297869, 1.351945, 0.3409635, 0, 0.8313726, 1, 1,
0.003716835, -0.4680347, 4.335238, 0, 0.827451, 1, 1,
0.009710323, -1.038804, 3.461186, 0, 0.8196079, 1, 1,
0.01032007, -1.265387, 3.854789, 0, 0.8156863, 1, 1,
0.01542664, -2.144689, 3.290192, 0, 0.8078431, 1, 1,
0.01787253, -1.204804, 3.785506, 0, 0.8039216, 1, 1,
0.01814228, 1.808894, 1.824257, 0, 0.7960784, 1, 1,
0.02013896, -0.06340263, 1.639637, 0, 0.7882353, 1, 1,
0.02152958, 0.5635084, -0.09535471, 0, 0.7843137, 1, 1,
0.02211239, -0.7741752, 2.467845, 0, 0.7764706, 1, 1,
0.02259212, 0.3576736, 0.3209438, 0, 0.772549, 1, 1,
0.02364182, 1.083015, -0.3377234, 0, 0.7647059, 1, 1,
0.02755054, -1.912437, 2.66088, 0, 0.7607843, 1, 1,
0.02909645, 0.5479251, 1.939566, 0, 0.7529412, 1, 1,
0.02999223, 1.268135, 0.02871682, 0, 0.7490196, 1, 1,
0.03081904, -0.8034295, 1.318209, 0, 0.7411765, 1, 1,
0.03086168, 0.101014, 0.8090666, 0, 0.7372549, 1, 1,
0.03648795, -1.842933, 3.060425, 0, 0.7294118, 1, 1,
0.03826832, -0.5894631, 2.36553, 0, 0.7254902, 1, 1,
0.03909588, 0.110946, -0.2007831, 0, 0.7176471, 1, 1,
0.04197177, -2.576469, 2.385989, 0, 0.7137255, 1, 1,
0.04797001, -0.1329887, 4.349261, 0, 0.7058824, 1, 1,
0.05100815, 0.3028793, -1.8647, 0, 0.6980392, 1, 1,
0.05169685, -1.010859, 3.102613, 0, 0.6941177, 1, 1,
0.05250196, -0.8159148, 3.191044, 0, 0.6862745, 1, 1,
0.05489154, 0.1909747, 0.2970064, 0, 0.682353, 1, 1,
0.05635023, -0.2089421, 2.811175, 0, 0.6745098, 1, 1,
0.05851291, 0.4440078, 1.52866, 0, 0.6705883, 1, 1,
0.06001572, 0.1524387, 0.4038789, 0, 0.6627451, 1, 1,
0.06049405, 0.5938234, -0.7446207, 0, 0.6588235, 1, 1,
0.06212366, 0.01804865, 0.419436, 0, 0.6509804, 1, 1,
0.06459717, -0.1789476, 4.144886, 0, 0.6470588, 1, 1,
0.06923246, -0.05188106, 3.496249, 0, 0.6392157, 1, 1,
0.06999149, -1.005124, 2.37148, 0, 0.6352941, 1, 1,
0.07152293, -0.2852603, 3.610727, 0, 0.627451, 1, 1,
0.07182183, -0.1215854, 2.384132, 0, 0.6235294, 1, 1,
0.07302357, -0.06367508, 3.78336, 0, 0.6156863, 1, 1,
0.07335433, -0.7435877, 2.056041, 0, 0.6117647, 1, 1,
0.073875, 0.0894961, 0.2981388, 0, 0.6039216, 1, 1,
0.07947703, 0.4631466, -1.23305, 0, 0.5960785, 1, 1,
0.08005844, -0.5295428, 1.732619, 0, 0.5921569, 1, 1,
0.08273129, 1.297591, -1.646055, 0, 0.5843138, 1, 1,
0.08545473, 1.996869, 1.037639, 0, 0.5803922, 1, 1,
0.08614995, -1.098945, 2.744812, 0, 0.572549, 1, 1,
0.08668693, -0.2774849, 4.480956, 0, 0.5686275, 1, 1,
0.0883515, -0.3847165, 1.823456, 0, 0.5607843, 1, 1,
0.09116373, -1.117382, 2.39626, 0, 0.5568628, 1, 1,
0.1026908, 1.173689, -0.6660998, 0, 0.5490196, 1, 1,
0.1054162, 0.9456496, -0.03511814, 0, 0.5450981, 1, 1,
0.1079463, 1.379797, 0.9953861, 0, 0.5372549, 1, 1,
0.1084856, 1.389082, 0.9525705, 0, 0.5333334, 1, 1,
0.1085811, 0.8433278, 0.5640765, 0, 0.5254902, 1, 1,
0.1099897, -1.20824, 1.523564, 0, 0.5215687, 1, 1,
0.1137286, -0.1005967, 3.304014, 0, 0.5137255, 1, 1,
0.1172024, -2.411288, 3.271513, 0, 0.509804, 1, 1,
0.1178697, 0.5998636, -1.502042, 0, 0.5019608, 1, 1,
0.1182326, -0.2515112, 3.021798, 0, 0.4941176, 1, 1,
0.1237725, 0.04822885, 0.330262, 0, 0.4901961, 1, 1,
0.1287686, -2.059395, 3.417292, 0, 0.4823529, 1, 1,
0.1296139, 0.9364828, 2.264494, 0, 0.4784314, 1, 1,
0.1345756, 1.704411, -0.7898081, 0, 0.4705882, 1, 1,
0.1365962, -0.2453681, 2.688783, 0, 0.4666667, 1, 1,
0.1372589, -0.6877953, 1.851772, 0, 0.4588235, 1, 1,
0.1543429, -1.979549, 3.127763, 0, 0.454902, 1, 1,
0.1550953, -0.200152, 3.361089, 0, 0.4470588, 1, 1,
0.1553353, 0.7316759, -0.9015666, 0, 0.4431373, 1, 1,
0.156778, 0.5813841, -0.5829617, 0, 0.4352941, 1, 1,
0.1608234, 0.3989829, 0.7162622, 0, 0.4313726, 1, 1,
0.1610263, -1.198622, 2.93827, 0, 0.4235294, 1, 1,
0.1622559, -1.174179, 2.92869, 0, 0.4196078, 1, 1,
0.1622866, 1.391725, -1.54196, 0, 0.4117647, 1, 1,
0.1635605, -1.207123, 1.969685, 0, 0.4078431, 1, 1,
0.1653216, 1.211591, 1.023077, 0, 0.4, 1, 1,
0.1659359, -0.243532, 1.392193, 0, 0.3921569, 1, 1,
0.1695961, -0.2045676, 3.100226, 0, 0.3882353, 1, 1,
0.1703306, 1.124459, 0.2066811, 0, 0.3803922, 1, 1,
0.1738787, 1.272906, -0.2507835, 0, 0.3764706, 1, 1,
0.1760452, 0.9512188, -1.23406, 0, 0.3686275, 1, 1,
0.1763665, -0.2148865, 1.466939, 0, 0.3647059, 1, 1,
0.1766507, -0.6546775, 1.939509, 0, 0.3568628, 1, 1,
0.1829913, 1.798083, -0.03837441, 0, 0.3529412, 1, 1,
0.1858513, 1.277636, -0.1177523, 0, 0.345098, 1, 1,
0.1889952, 0.731618, -0.1611158, 0, 0.3411765, 1, 1,
0.1950076, 0.08234613, 1.030702, 0, 0.3333333, 1, 1,
0.2012242, -0.08841787, -0.02910508, 0, 0.3294118, 1, 1,
0.2051885, 1.475538, -0.2366231, 0, 0.3215686, 1, 1,
0.207059, 0.8860292, -0.371599, 0, 0.3176471, 1, 1,
0.2076011, -0.3227802, 2.57195, 0, 0.3098039, 1, 1,
0.2093997, -1.404283, 1.432946, 0, 0.3058824, 1, 1,
0.2132155, 0.4227371, 0.9063056, 0, 0.2980392, 1, 1,
0.2189298, -1.245121, 3.261801, 0, 0.2901961, 1, 1,
0.219189, -0.3558812, 2.62897, 0, 0.2862745, 1, 1,
0.2255833, 1.656959, -0.6178131, 0, 0.2784314, 1, 1,
0.2259872, 0.4854406, 0.6792534, 0, 0.2745098, 1, 1,
0.2287167, 0.2146218, 1.190031, 0, 0.2666667, 1, 1,
0.2313607, 0.3252634, 0.1621302, 0, 0.2627451, 1, 1,
0.2387398, -0.4520682, 1.44402, 0, 0.254902, 1, 1,
0.2401007, 2.289822, 0.9270055, 0, 0.2509804, 1, 1,
0.2401045, -0.3298202, 2.279668, 0, 0.2431373, 1, 1,
0.2427861, -1.392538, 3.554399, 0, 0.2392157, 1, 1,
0.2486449, -0.598107, 2.422957, 0, 0.2313726, 1, 1,
0.2514894, 1.758826, -0.3895152, 0, 0.227451, 1, 1,
0.2534553, 1.191877, 1.133727, 0, 0.2196078, 1, 1,
0.2544449, 1.810254, -0.1357106, 0, 0.2156863, 1, 1,
0.2595766, -0.1790653, 2.116192, 0, 0.2078431, 1, 1,
0.2630957, 2.24846, -1.018748, 0, 0.2039216, 1, 1,
0.2634098, -1.395085, 2.579638, 0, 0.1960784, 1, 1,
0.2648236, -0.3566497, 2.579293, 0, 0.1882353, 1, 1,
0.266684, 1.091605, -0.2689549, 0, 0.1843137, 1, 1,
0.2669677, 1.626965, 0.6271009, 0, 0.1764706, 1, 1,
0.2697218, 0.8525326, 0.8423674, 0, 0.172549, 1, 1,
0.2699583, 0.2683099, 1.645009, 0, 0.1647059, 1, 1,
0.2736011, 2.271921, -0.5867919, 0, 0.1607843, 1, 1,
0.2744072, 0.2718068, 0.367505, 0, 0.1529412, 1, 1,
0.2748387, 0.6808659, -0.7895965, 0, 0.1490196, 1, 1,
0.2759112, 1.597506, -0.7259572, 0, 0.1411765, 1, 1,
0.2774885, 0.3418678, -0.005836087, 0, 0.1372549, 1, 1,
0.2812226, -0.5032657, 2.912151, 0, 0.1294118, 1, 1,
0.2814189, -0.4373856, 2.319524, 0, 0.1254902, 1, 1,
0.286637, -0.4356928, 2.294139, 0, 0.1176471, 1, 1,
0.2882859, 0.603016, 0.3595682, 0, 0.1137255, 1, 1,
0.2892644, -0.4171977, 2.13562, 0, 0.1058824, 1, 1,
0.2912834, 0.4478347, -0.8986931, 0, 0.09803922, 1, 1,
0.2913396, 0.7908596, 1.606559, 0, 0.09411765, 1, 1,
0.2913801, -0.9992483, 2.496757, 0, 0.08627451, 1, 1,
0.2928115, 1.349115, 1.31925, 0, 0.08235294, 1, 1,
0.2935651, -0.8775437, 4.658081, 0, 0.07450981, 1, 1,
0.3008724, -0.4061457, 4.822679, 0, 0.07058824, 1, 1,
0.3028079, -0.05766692, 1.454587, 0, 0.0627451, 1, 1,
0.3122296, 0.6088068, 0.7019274, 0, 0.05882353, 1, 1,
0.3175484, 0.09744807, 2.463635, 0, 0.05098039, 1, 1,
0.3230486, 0.3251669, 0.7772779, 0, 0.04705882, 1, 1,
0.3235103, -1.174206, 2.89062, 0, 0.03921569, 1, 1,
0.3280146, -1.517626, 2.189184, 0, 0.03529412, 1, 1,
0.3286924, -0.9798971, 3.028282, 0, 0.02745098, 1, 1,
0.3291798, -0.8200638, 3.312871, 0, 0.02352941, 1, 1,
0.3319211, -0.373496, 4.854504, 0, 0.01568628, 1, 1,
0.3415335, -2.619503, 2.741968, 0, 0.01176471, 1, 1,
0.3433866, -0.5750927, 1.786342, 0, 0.003921569, 1, 1,
0.3436053, -1.34291, 1.969699, 0.003921569, 0, 1, 1,
0.3444137, 0.1139291, 2.314614, 0.007843138, 0, 1, 1,
0.3447193, 1.852404, 1.283834, 0.01568628, 0, 1, 1,
0.355767, 0.1977026, 0.4428131, 0.01960784, 0, 1, 1,
0.3594001, 0.3029808, -0.2855409, 0.02745098, 0, 1, 1,
0.3606902, 0.3465113, 0.5225853, 0.03137255, 0, 1, 1,
0.3680127, 1.800163, -0.9842311, 0.03921569, 0, 1, 1,
0.3720114, -0.8066458, 2.810884, 0.04313726, 0, 1, 1,
0.3828427, -2.270113, 1.793927, 0.05098039, 0, 1, 1,
0.3901188, 1.005048, -0.341702, 0.05490196, 0, 1, 1,
0.3945198, -0.2872728, 0.6074761, 0.0627451, 0, 1, 1,
0.3954242, -0.005716112, 1.70867, 0.06666667, 0, 1, 1,
0.3993369, -0.09813297, 1.530521, 0.07450981, 0, 1, 1,
0.4035229, 0.6577339, 0.5774255, 0.07843138, 0, 1, 1,
0.4120253, 0.1608655, 1.192994, 0.08627451, 0, 1, 1,
0.4218442, -1.375831, 3.940046, 0.09019608, 0, 1, 1,
0.4243685, 0.5811621, 1.900592, 0.09803922, 0, 1, 1,
0.424637, 1.152187, 1.640787, 0.1058824, 0, 1, 1,
0.425693, 0.8847252, 1.129241, 0.1098039, 0, 1, 1,
0.426042, 1.267832, -0.6468391, 0.1176471, 0, 1, 1,
0.4297954, -1.002009, 2.957332, 0.1215686, 0, 1, 1,
0.430944, 0.6881786, 1.984647, 0.1294118, 0, 1, 1,
0.432297, 1.511935, -0.03762705, 0.1333333, 0, 1, 1,
0.4373065, 0.8398796, -0.0502408, 0.1411765, 0, 1, 1,
0.4398681, 0.4732578, -0.9811972, 0.145098, 0, 1, 1,
0.4407034, 1.181806, 0.9704618, 0.1529412, 0, 1, 1,
0.4445467, -0.6426995, 3.611275, 0.1568628, 0, 1, 1,
0.4465025, 0.5350758, 0.1513515, 0.1647059, 0, 1, 1,
0.4476879, 0.4183414, -0.3307347, 0.1686275, 0, 1, 1,
0.44982, -1.574657, 3.765169, 0.1764706, 0, 1, 1,
0.4551838, -2.140232, 2.628727, 0.1803922, 0, 1, 1,
0.4600501, -0.2933384, 1.097276, 0.1882353, 0, 1, 1,
0.4638007, -0.1898675, 2.561855, 0.1921569, 0, 1, 1,
0.4638878, 2.849104, -0.0397641, 0.2, 0, 1, 1,
0.4664049, 0.09800734, 1.761899, 0.2078431, 0, 1, 1,
0.4666966, -0.479807, 3.76907, 0.2117647, 0, 1, 1,
0.478491, -0.2130706, -0.08181279, 0.2196078, 0, 1, 1,
0.4829053, 0.07082828, -0.5568066, 0.2235294, 0, 1, 1,
0.4886815, 1.415391, 1.525934, 0.2313726, 0, 1, 1,
0.495357, 0.2200727, 1.378847, 0.2352941, 0, 1, 1,
0.4955771, 1.088508, 1.415309, 0.2431373, 0, 1, 1,
0.4959693, -1.385885, 3.371425, 0.2470588, 0, 1, 1,
0.4982459, 0.5300295, -0.2328309, 0.254902, 0, 1, 1,
0.4997633, -2.799338, 3.772926, 0.2588235, 0, 1, 1,
0.4999991, -0.06037417, 1.328753, 0.2666667, 0, 1, 1,
0.5053335, -0.4910555, 2.562918, 0.2705882, 0, 1, 1,
0.5092618, 0.4298724, 0.799993, 0.2784314, 0, 1, 1,
0.5114807, 0.003600732, 1.340639, 0.282353, 0, 1, 1,
0.5126196, 0.01905947, 1.831145, 0.2901961, 0, 1, 1,
0.5132634, 0.5915013, 0.2138516, 0.2941177, 0, 1, 1,
0.51639, -0.7592086, 3.919322, 0.3019608, 0, 1, 1,
0.5173758, 0.1802632, 1.059915, 0.3098039, 0, 1, 1,
0.5219091, 1.003549, 0.8657764, 0.3137255, 0, 1, 1,
0.5238354, 0.379701, 0.7676712, 0.3215686, 0, 1, 1,
0.5305651, 0.05193779, 1.447132, 0.3254902, 0, 1, 1,
0.5340112, 2.054962, -0.4885858, 0.3333333, 0, 1, 1,
0.5389987, 0.7094442, -0.1603115, 0.3372549, 0, 1, 1,
0.5409865, 0.1284865, -0.4018905, 0.345098, 0, 1, 1,
0.5438514, 1.137573, -0.9598465, 0.3490196, 0, 1, 1,
0.5460044, -0.1188594, 0.7724708, 0.3568628, 0, 1, 1,
0.5512745, 1.948448, 0.06854121, 0.3607843, 0, 1, 1,
0.55243, -0.6525334, 0.7034066, 0.3686275, 0, 1, 1,
0.5531486, 0.1688775, 0.5450366, 0.372549, 0, 1, 1,
0.5543801, 1.107675, -1.965847, 0.3803922, 0, 1, 1,
0.556409, 0.2732772, -0.1679267, 0.3843137, 0, 1, 1,
0.5588573, 1.514213, -0.6812048, 0.3921569, 0, 1, 1,
0.5596245, -1.141604, 2.293339, 0.3960784, 0, 1, 1,
0.5624904, -0.602914, 1.291076, 0.4039216, 0, 1, 1,
0.5645334, 1.572491, -1.217961, 0.4117647, 0, 1, 1,
0.5676827, -1.517547, 1.136481, 0.4156863, 0, 1, 1,
0.5763639, 0.5358995, 0.437985, 0.4235294, 0, 1, 1,
0.577774, 0.6782423, 0.6171693, 0.427451, 0, 1, 1,
0.5788447, 0.4056741, 2.295515, 0.4352941, 0, 1, 1,
0.5824086, 0.2531275, 1.753831, 0.4392157, 0, 1, 1,
0.5826394, -0.958824, 3.643063, 0.4470588, 0, 1, 1,
0.5918847, 0.8362552, -0.1968371, 0.4509804, 0, 1, 1,
0.5945889, -0.4017088, 1.85113, 0.4588235, 0, 1, 1,
0.5948778, -0.2289854, 2.785859, 0.4627451, 0, 1, 1,
0.5957994, 0.2732674, 0.7976322, 0.4705882, 0, 1, 1,
0.5961168, -1.1446, 3.870233, 0.4745098, 0, 1, 1,
0.5964482, -1.368464, 0.8762236, 0.4823529, 0, 1, 1,
0.5967972, 0.851351, -0.6215537, 0.4862745, 0, 1, 1,
0.6124102, -1.411721, 2.376465, 0.4941176, 0, 1, 1,
0.6201591, -1.846104, 3.495382, 0.5019608, 0, 1, 1,
0.635325, -0.1878877, 1.127761, 0.5058824, 0, 1, 1,
0.635839, -0.7564178, 2.944377, 0.5137255, 0, 1, 1,
0.6382105, -0.06483735, -0.08378916, 0.5176471, 0, 1, 1,
0.6390543, -0.3092096, 0.8574712, 0.5254902, 0, 1, 1,
0.6411161, 0.7843892, -1.530047, 0.5294118, 0, 1, 1,
0.6462491, 0.3166722, 0.3608165, 0.5372549, 0, 1, 1,
0.6466383, 0.03349964, 3.279785, 0.5411765, 0, 1, 1,
0.6468241, -0.611263, 2.749448, 0.5490196, 0, 1, 1,
0.6504414, -2.045695, 3.502689, 0.5529412, 0, 1, 1,
0.6549846, -0.3470477, 2.843211, 0.5607843, 0, 1, 1,
0.6653324, -0.04881334, 2.498549, 0.5647059, 0, 1, 1,
0.6656345, 0.1273742, 1.528677, 0.572549, 0, 1, 1,
0.6688643, 0.5102615, 0.8094724, 0.5764706, 0, 1, 1,
0.6784531, 0.6079547, 0.1820996, 0.5843138, 0, 1, 1,
0.6790331, 0.6675623, 1.073726, 0.5882353, 0, 1, 1,
0.6864927, -0.3225004, 1.532459, 0.5960785, 0, 1, 1,
0.6889022, -0.8402816, 4.001979, 0.6039216, 0, 1, 1,
0.6900977, 0.1733461, 2.889161, 0.6078432, 0, 1, 1,
0.6920606, 0.6071285, 0.4772453, 0.6156863, 0, 1, 1,
0.6934336, 0.6464128, 2.594521, 0.6196079, 0, 1, 1,
0.6954729, 0.7295299, 1.25433, 0.627451, 0, 1, 1,
0.6977648, 0.927914, 0.3659076, 0.6313726, 0, 1, 1,
0.6984777, -0.7055702, 5.078851, 0.6392157, 0, 1, 1,
0.708773, -0.410121, 2.201099, 0.6431373, 0, 1, 1,
0.7122984, -0.2439989, 0.4571984, 0.6509804, 0, 1, 1,
0.713115, 2.665541, -0.415142, 0.654902, 0, 1, 1,
0.7157329, 0.6056752, 0.5654485, 0.6627451, 0, 1, 1,
0.7160973, -1.475884, 3.692225, 0.6666667, 0, 1, 1,
0.7169881, -0.2241203, 1.600697, 0.6745098, 0, 1, 1,
0.7226095, 1.673831, 0.383225, 0.6784314, 0, 1, 1,
0.7292093, -0.2018753, 2.098126, 0.6862745, 0, 1, 1,
0.7395512, 0.8885702, 1.260186, 0.6901961, 0, 1, 1,
0.7401455, -0.1716562, 1.950565, 0.6980392, 0, 1, 1,
0.7452101, -1.945744, 3.31768, 0.7058824, 0, 1, 1,
0.7481685, 1.40972, 0.918269, 0.7098039, 0, 1, 1,
0.749896, 1.076341, -1.197383, 0.7176471, 0, 1, 1,
0.7511108, -0.6838915, 3.839339, 0.7215686, 0, 1, 1,
0.7520094, 0.656839, 1.212519, 0.7294118, 0, 1, 1,
0.75367, 0.5045274, 1.408677, 0.7333333, 0, 1, 1,
0.7549292, -1.074468, 2.808686, 0.7411765, 0, 1, 1,
0.7550236, 0.903842, 1.572935, 0.7450981, 0, 1, 1,
0.7675165, 0.751474, -0.316669, 0.7529412, 0, 1, 1,
0.767854, -0.5317768, 1.54985, 0.7568628, 0, 1, 1,
0.7749982, 0.9280975, -2.453284, 0.7647059, 0, 1, 1,
0.7784348, -3.589315, 2.670935, 0.7686275, 0, 1, 1,
0.7807124, 1.007033, 0.104029, 0.7764706, 0, 1, 1,
0.7839557, 0.7870504, 0.8605127, 0.7803922, 0, 1, 1,
0.7842316, 0.6865225, 1.410004, 0.7882353, 0, 1, 1,
0.7869589, 0.701232, 1.433044, 0.7921569, 0, 1, 1,
0.7871534, -0.1572136, 2.810445, 0.8, 0, 1, 1,
0.7958602, -0.3848461, 1.722384, 0.8078431, 0, 1, 1,
0.7961009, 0.204576, 1.341993, 0.8117647, 0, 1, 1,
0.796901, -0.2450957, 2.947559, 0.8196079, 0, 1, 1,
0.7992222, -1.107235, 2.460626, 0.8235294, 0, 1, 1,
0.8114945, -0.960791, 2.876685, 0.8313726, 0, 1, 1,
0.8175793, -0.1492397, 0.8196671, 0.8352941, 0, 1, 1,
0.8186255, 0.4326093, 0.1044617, 0.8431373, 0, 1, 1,
0.8315156, 0.184642, 1.165316, 0.8470588, 0, 1, 1,
0.8338935, -1.37313, 3.72494, 0.854902, 0, 1, 1,
0.8369084, 0.7369789, 0.1726255, 0.8588235, 0, 1, 1,
0.8371906, -0.5335227, 1.697141, 0.8666667, 0, 1, 1,
0.8380463, 0.1338409, 1.320233, 0.8705882, 0, 1, 1,
0.8387522, -0.05237208, 1.98824, 0.8784314, 0, 1, 1,
0.8408376, -1.313266, 3.23438, 0.8823529, 0, 1, 1,
0.8419529, 0.7185879, 1.288622, 0.8901961, 0, 1, 1,
0.8467593, -0.481112, 2.486969, 0.8941177, 0, 1, 1,
0.8498135, 1.076727, 2.050741, 0.9019608, 0, 1, 1,
0.852682, -0.5307142, 1.123392, 0.9098039, 0, 1, 1,
0.8606977, 1.002416, 1.618631, 0.9137255, 0, 1, 1,
0.8614265, -0.8499411, 2.679085, 0.9215686, 0, 1, 1,
0.8670251, 0.5881295, 1.038669, 0.9254902, 0, 1, 1,
0.8690661, -0.02525416, 2.857372, 0.9333333, 0, 1, 1,
0.8701081, -0.2975424, 2.127997, 0.9372549, 0, 1, 1,
0.8742676, 0.1702209, 2.011005, 0.945098, 0, 1, 1,
0.8843391, -0.8254029, 2.514699, 0.9490196, 0, 1, 1,
0.8880625, 0.7249017, 2.221619, 0.9568627, 0, 1, 1,
0.8895106, -0.5399566, 2.589796, 0.9607843, 0, 1, 1,
0.8916046, 0.6783088, 0.7252661, 0.9686275, 0, 1, 1,
0.8927104, 0.7164762, 1.226241, 0.972549, 0, 1, 1,
0.9061304, -0.5762388, 2.761285, 0.9803922, 0, 1, 1,
0.9120518, -0.3227962, 0.7350853, 0.9843137, 0, 1, 1,
0.9146748, -0.5564349, 1.719328, 0.9921569, 0, 1, 1,
0.9149646, 0.6513532, 0.1463748, 0.9960784, 0, 1, 1,
0.917736, -0.5042042, 2.333903, 1, 0, 0.9960784, 1,
0.9362409, -0.6849709, 1.43055, 1, 0, 0.9882353, 1,
0.9365283, -1.244802, 2.156396, 1, 0, 0.9843137, 1,
0.9379297, 0.3118517, 0.739009, 1, 0, 0.9764706, 1,
0.9394073, 0.6727113, 2.656498, 1, 0, 0.972549, 1,
0.9426524, -0.5369064, 2.642347, 1, 0, 0.9647059, 1,
0.9431691, -0.1188645, 2.165169, 1, 0, 0.9607843, 1,
0.9516541, 0.6088176, 0.1186769, 1, 0, 0.9529412, 1,
0.9661142, -0.5491818, 2.037096, 1, 0, 0.9490196, 1,
0.9875231, -0.3282439, 2.720688, 1, 0, 0.9411765, 1,
0.9941722, -0.1454718, 1.366732, 1, 0, 0.9372549, 1,
0.9950876, -0.04641778, 2.423101, 1, 0, 0.9294118, 1,
0.9960029, -1.671696, 2.143292, 1, 0, 0.9254902, 1,
1.006769, 0.3517576, 2.29516, 1, 0, 0.9176471, 1,
1.008859, -0.7133822, 0.8521883, 1, 0, 0.9137255, 1,
1.015772, -0.5427845, 2.422087, 1, 0, 0.9058824, 1,
1.029983, 0.5492563, 1.083563, 1, 0, 0.9019608, 1,
1.041006, 0.1683506, 1.670144, 1, 0, 0.8941177, 1,
1.041695, 1.980528, -1.943347, 1, 0, 0.8862745, 1,
1.048455, 0.7106437, 0.5640298, 1, 0, 0.8823529, 1,
1.050485, -0.9697122, 2.209304, 1, 0, 0.8745098, 1,
1.050617, -0.5133647, 0.4091614, 1, 0, 0.8705882, 1,
1.053622, -0.1096537, 1.375976, 1, 0, 0.8627451, 1,
1.05406, -0.4567378, 0.2755491, 1, 0, 0.8588235, 1,
1.054093, 0.8940018, 1.189248, 1, 0, 0.8509804, 1,
1.057709, -0.8142272, 1.767212, 1, 0, 0.8470588, 1,
1.061592, -1.436062, 2.053044, 1, 0, 0.8392157, 1,
1.061874, -0.1314017, 2.207345, 1, 0, 0.8352941, 1,
1.078245, -0.9908533, 2.528185, 1, 0, 0.827451, 1,
1.078838, -0.6515656, 4.287903, 1, 0, 0.8235294, 1,
1.080061, 0.2159755, -0.7900623, 1, 0, 0.8156863, 1,
1.081329, 1.17394, 1.45791, 1, 0, 0.8117647, 1,
1.082593, -0.06774031, 1.020781, 1, 0, 0.8039216, 1,
1.092455, -0.7542425, 2.522129, 1, 0, 0.7960784, 1,
1.095374, -0.4997579, 2.217328, 1, 0, 0.7921569, 1,
1.109279, -0.4799924, 2.521565, 1, 0, 0.7843137, 1,
1.112641, -0.5272501, 1.346831, 1, 0, 0.7803922, 1,
1.114288, 0.7672724, 1.162532, 1, 0, 0.772549, 1,
1.115074, -1.44182, 2.303979, 1, 0, 0.7686275, 1,
1.125101, 0.5082304, 0.3231898, 1, 0, 0.7607843, 1,
1.125273, -0.4918743, 1.658251, 1, 0, 0.7568628, 1,
1.127997, 1.408676, 1.178064, 1, 0, 0.7490196, 1,
1.132824, 1.963009, -2.632371, 1, 0, 0.7450981, 1,
1.135618, 1.804082, 0.866373, 1, 0, 0.7372549, 1,
1.144543, -0.8381804, 3.111171, 1, 0, 0.7333333, 1,
1.149107, -1.031176, 1.243088, 1, 0, 0.7254902, 1,
1.157989, 1.992754, 1.210173, 1, 0, 0.7215686, 1,
1.185265, -1.190957, 3.035481, 1, 0, 0.7137255, 1,
1.188407, -0.705972, 1.29514, 1, 0, 0.7098039, 1,
1.194143, 0.1928258, 0.7217945, 1, 0, 0.7019608, 1,
1.199811, -0.4453425, 2.204842, 1, 0, 0.6941177, 1,
1.20707, -1.385606, 2.099179, 1, 0, 0.6901961, 1,
1.207685, -1.013737, 4.203324, 1, 0, 0.682353, 1,
1.208483, -0.3768235, 0.1679871, 1, 0, 0.6784314, 1,
1.214646, -0.6552698, 2.083228, 1, 0, 0.6705883, 1,
1.229665, 0.3127635, 3.108139, 1, 0, 0.6666667, 1,
1.231894, 0.4694072, 0.7015299, 1, 0, 0.6588235, 1,
1.233559, -0.346944, 0.4764752, 1, 0, 0.654902, 1,
1.235356, 0.4588152, 1.24245, 1, 0, 0.6470588, 1,
1.255866, -1.021309, 2.436114, 1, 0, 0.6431373, 1,
1.257408, 0.3424748, 1.184387, 1, 0, 0.6352941, 1,
1.258134, 0.3552774, 2.243249, 1, 0, 0.6313726, 1,
1.260061, 0.02906218, 0.6578923, 1, 0, 0.6235294, 1,
1.262093, -0.9949421, 1.32639, 1, 0, 0.6196079, 1,
1.265723, 1.461365, -0.302011, 1, 0, 0.6117647, 1,
1.272532, -0.2735785, 0.753249, 1, 0, 0.6078432, 1,
1.280897, -0.008229021, 1.50868, 1, 0, 0.6, 1,
1.281137, 0.6804014, 2.284766, 1, 0, 0.5921569, 1,
1.283114, -1.059472, 2.672036, 1, 0, 0.5882353, 1,
1.283864, -0.3613178, 3.182719, 1, 0, 0.5803922, 1,
1.294679, -1.642293, 3.556434, 1, 0, 0.5764706, 1,
1.308857, 2.421412, 0.3428921, 1, 0, 0.5686275, 1,
1.315777, 1.164263, 1.077145, 1, 0, 0.5647059, 1,
1.32092, -1.10399, 2.476845, 1, 0, 0.5568628, 1,
1.32285, -0.0602559, 0.4689946, 1, 0, 0.5529412, 1,
1.327068, 0.2418884, 1.193837, 1, 0, 0.5450981, 1,
1.349868, 0.6506932, 0.8607492, 1, 0, 0.5411765, 1,
1.351947, 0.5156507, 2.138062, 1, 0, 0.5333334, 1,
1.355031, -0.5616065, 2.889215, 1, 0, 0.5294118, 1,
1.367819, -0.3179869, 3.207846, 1, 0, 0.5215687, 1,
1.380675, -0.8538097, 2.439538, 1, 0, 0.5176471, 1,
1.382744, 0.4274535, 1.917758, 1, 0, 0.509804, 1,
1.39895, 1.299219, 2.273887, 1, 0, 0.5058824, 1,
1.402533, 0.3172816, 1.783873, 1, 0, 0.4980392, 1,
1.404885, -1.337421, 1.668754, 1, 0, 0.4901961, 1,
1.40597, -2.506457, 1.816722, 1, 0, 0.4862745, 1,
1.419994, 0.4579669, 2.597797, 1, 0, 0.4784314, 1,
1.435145, 0.1894119, 1.036559, 1, 0, 0.4745098, 1,
1.449651, 0.6246098, 1.711095, 1, 0, 0.4666667, 1,
1.461015, -1.489796, 1.693411, 1, 0, 0.4627451, 1,
1.464227, -0.7376773, 3.819046, 1, 0, 0.454902, 1,
1.475733, 1.176839, -0.3202972, 1, 0, 0.4509804, 1,
1.481299, -0.8401454, 1.85101, 1, 0, 0.4431373, 1,
1.485672, -1.812369, 3.315592, 1, 0, 0.4392157, 1,
1.493585, 0.8202912, 0.3709947, 1, 0, 0.4313726, 1,
1.502891, -0.03806891, 1.788403, 1, 0, 0.427451, 1,
1.505725, -1.384698, 2.604697, 1, 0, 0.4196078, 1,
1.507175, 1.279206, 0.652894, 1, 0, 0.4156863, 1,
1.51457, -0.6081246, 3.775171, 1, 0, 0.4078431, 1,
1.519585, 1.801444, 0.006586785, 1, 0, 0.4039216, 1,
1.5197, 0.2438852, -1.068592, 1, 0, 0.3960784, 1,
1.523175, -0.1999798, 1.188641, 1, 0, 0.3882353, 1,
1.528508, 0.2268354, 2.24089, 1, 0, 0.3843137, 1,
1.536095, -0.3673589, 1.660924, 1, 0, 0.3764706, 1,
1.553568, 1.281021, 2.306849, 1, 0, 0.372549, 1,
1.559898, 0.1593398, 1.174283, 1, 0, 0.3647059, 1,
1.573572, 2.61218, 1.38493, 1, 0, 0.3607843, 1,
1.575497, 1.315926, 1.751852, 1, 0, 0.3529412, 1,
1.605314, 0.6934798, -0.3804618, 1, 0, 0.3490196, 1,
1.614569, -0.6045706, 1.561962, 1, 0, 0.3411765, 1,
1.61637, 0.6709367, 0.6596256, 1, 0, 0.3372549, 1,
1.618118, -1.161681, 2.938627, 1, 0, 0.3294118, 1,
1.628947, 0.09683037, 0.5734414, 1, 0, 0.3254902, 1,
1.635114, 1.861263, -1.382413, 1, 0, 0.3176471, 1,
1.638968, 0.4028245, 1.420239, 1, 0, 0.3137255, 1,
1.644007, -1.118684, 1.470477, 1, 0, 0.3058824, 1,
1.664865, -1.581065, 1.670874, 1, 0, 0.2980392, 1,
1.67229, -0.1915696, 0.8439954, 1, 0, 0.2941177, 1,
1.683229, -0.7836406, 2.455033, 1, 0, 0.2862745, 1,
1.702731, 0.1788259, 0.01249161, 1, 0, 0.282353, 1,
1.704992, -0.1395637, 2.078402, 1, 0, 0.2745098, 1,
1.714644, 0.1918794, 2.570807, 1, 0, 0.2705882, 1,
1.719313, 0.3355141, 3.826497, 1, 0, 0.2627451, 1,
1.730532, -0.2532504, 0.6526496, 1, 0, 0.2588235, 1,
1.731718, -1.168118, 1.278996, 1, 0, 0.2509804, 1,
1.756785, -0.513502, 2.972858, 1, 0, 0.2470588, 1,
1.777583, 0.4066338, 1.725199, 1, 0, 0.2392157, 1,
1.816292, -0.4308451, 1.461883, 1, 0, 0.2352941, 1,
1.818876, -0.1281411, 1.650814, 1, 0, 0.227451, 1,
1.837385, -0.4278738, 2.691007, 1, 0, 0.2235294, 1,
1.850118, 1.418223, 1.373181, 1, 0, 0.2156863, 1,
1.858164, 1.411441, 0.7589703, 1, 0, 0.2117647, 1,
1.864963, -0.4686255, 1.992253, 1, 0, 0.2039216, 1,
1.869364, -1.342149, 2.302578, 1, 0, 0.1960784, 1,
1.892781, 0.9166946, 1.827197, 1, 0, 0.1921569, 1,
1.89607, 0.6646075, 1.438488, 1, 0, 0.1843137, 1,
1.910282, 0.9868131, 0.8769855, 1, 0, 0.1803922, 1,
1.949217, 0.6678839, 0.5287969, 1, 0, 0.172549, 1,
1.96995, 1.315605, -0.2888967, 1, 0, 0.1686275, 1,
2.029557, 1.041723, 1.612061, 1, 0, 0.1607843, 1,
2.097392, 1.109895, 1.149771, 1, 0, 0.1568628, 1,
2.104864, 0.93656, -0.7781906, 1, 0, 0.1490196, 1,
2.110616, -0.9738057, 2.329624, 1, 0, 0.145098, 1,
2.111759, 0.02258947, 1.088897, 1, 0, 0.1372549, 1,
2.113857, -1.864714, 1.515144, 1, 0, 0.1333333, 1,
2.174791, 0.2675974, 1.424791, 1, 0, 0.1254902, 1,
2.179846, -0.5202038, 1.716537, 1, 0, 0.1215686, 1,
2.19697, 0.47202, 0.9742392, 1, 0, 0.1137255, 1,
2.20853, -0.2658539, 0.7758084, 1, 0, 0.1098039, 1,
2.212718, -2.661744, 2.24175, 1, 0, 0.1019608, 1,
2.243692, -2.602824, 1.922199, 1, 0, 0.09411765, 1,
2.244992, -0.3416212, 2.064866, 1, 0, 0.09019608, 1,
2.269427, 0.4893925, 1.120161, 1, 0, 0.08235294, 1,
2.302266, 0.7078657, -0.37644, 1, 0, 0.07843138, 1,
2.315568, -1.073389, 3.297074, 1, 0, 0.07058824, 1,
2.319138, -0.7639312, -0.4611035, 1, 0, 0.06666667, 1,
2.35816, 0.02946667, 2.874842, 1, 0, 0.05882353, 1,
2.373077, 0.9603188, 0.004711296, 1, 0, 0.05490196, 1,
2.381073, 0.09742258, 0.9768857, 1, 0, 0.04705882, 1,
2.384683, 1.439131, 0.9787576, 1, 0, 0.04313726, 1,
2.411202, 1.060847, -0.5017306, 1, 0, 0.03529412, 1,
2.484023, 0.09590097, 2.41545, 1, 0, 0.03137255, 1,
2.582287, 0.6782084, -1.102776, 1, 0, 0.02352941, 1,
2.614518, -1.670794, 3.86976, 1, 0, 0.01960784, 1,
2.870446, 0.4308869, 1.577613, 1, 0, 0.01176471, 1,
2.971246, -0.6911994, 0.3694254, 1, 0, 0.007843138, 1
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
0.09913599, -4.709692, -6.667987, 0, -0.5, 0.5, 0.5,
0.09913599, -4.709692, -6.667987, 1, -0.5, 0.5, 0.5,
0.09913599, -4.709692, -6.667987, 1, 1.5, 0.5, 0.5,
0.09913599, -4.709692, -6.667987, 0, 1.5, 0.5, 0.5
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
-3.746619, -0.284368, -6.667987, 0, -0.5, 0.5, 0.5,
-3.746619, -0.284368, -6.667987, 1, -0.5, 0.5, 0.5,
-3.746619, -0.284368, -6.667987, 1, 1.5, 0.5, 0.5,
-3.746619, -0.284368, -6.667987, 0, 1.5, 0.5, 0.5
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
-3.746619, -4.709692, 0.05668831, 0, -0.5, 0.5, 0.5,
-3.746619, -4.709692, 0.05668831, 1, -0.5, 0.5, 0.5,
-3.746619, -4.709692, 0.05668831, 1, 1.5, 0.5, 0.5,
-3.746619, -4.709692, 0.05668831, 0, 1.5, 0.5, 0.5
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
-2, -3.688464, -5.116139,
2, -3.688464, -5.116139,
-2, -3.688464, -5.116139,
-2, -3.858668, -5.37478,
-1, -3.688464, -5.116139,
-1, -3.858668, -5.37478,
0, -3.688464, -5.116139,
0, -3.858668, -5.37478,
1, -3.688464, -5.116139,
1, -3.858668, -5.37478,
2, -3.688464, -5.116139,
2, -3.858668, -5.37478
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
"2"
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
-2, -4.199078, -5.892063, 0, -0.5, 0.5, 0.5,
-2, -4.199078, -5.892063, 1, -0.5, 0.5, 0.5,
-2, -4.199078, -5.892063, 1, 1.5, 0.5, 0.5,
-2, -4.199078, -5.892063, 0, 1.5, 0.5, 0.5,
-1, -4.199078, -5.892063, 0, -0.5, 0.5, 0.5,
-1, -4.199078, -5.892063, 1, -0.5, 0.5, 0.5,
-1, -4.199078, -5.892063, 1, 1.5, 0.5, 0.5,
-1, -4.199078, -5.892063, 0, 1.5, 0.5, 0.5,
0, -4.199078, -5.892063, 0, -0.5, 0.5, 0.5,
0, -4.199078, -5.892063, 1, -0.5, 0.5, 0.5,
0, -4.199078, -5.892063, 1, 1.5, 0.5, 0.5,
0, -4.199078, -5.892063, 0, 1.5, 0.5, 0.5,
1, -4.199078, -5.892063, 0, -0.5, 0.5, 0.5,
1, -4.199078, -5.892063, 1, -0.5, 0.5, 0.5,
1, -4.199078, -5.892063, 1, 1.5, 0.5, 0.5,
1, -4.199078, -5.892063, 0, 1.5, 0.5, 0.5,
2, -4.199078, -5.892063, 0, -0.5, 0.5, 0.5,
2, -4.199078, -5.892063, 1, -0.5, 0.5, 0.5,
2, -4.199078, -5.892063, 1, 1.5, 0.5, 0.5,
2, -4.199078, -5.892063, 0, 1.5, 0.5, 0.5
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
-2.859137, -3, -5.116139,
-2.859137, 3, -5.116139,
-2.859137, -3, -5.116139,
-3.007051, -3, -5.37478,
-2.859137, -2, -5.116139,
-3.007051, -2, -5.37478,
-2.859137, -1, -5.116139,
-3.007051, -1, -5.37478,
-2.859137, 0, -5.116139,
-3.007051, 0, -5.37478,
-2.859137, 1, -5.116139,
-3.007051, 1, -5.37478,
-2.859137, 2, -5.116139,
-3.007051, 2, -5.37478,
-2.859137, 3, -5.116139,
-3.007051, 3, -5.37478
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
-3.302878, -3, -5.892063, 0, -0.5, 0.5, 0.5,
-3.302878, -3, -5.892063, 1, -0.5, 0.5, 0.5,
-3.302878, -3, -5.892063, 1, 1.5, 0.5, 0.5,
-3.302878, -3, -5.892063, 0, 1.5, 0.5, 0.5,
-3.302878, -2, -5.892063, 0, -0.5, 0.5, 0.5,
-3.302878, -2, -5.892063, 1, -0.5, 0.5, 0.5,
-3.302878, -2, -5.892063, 1, 1.5, 0.5, 0.5,
-3.302878, -2, -5.892063, 0, 1.5, 0.5, 0.5,
-3.302878, -1, -5.892063, 0, -0.5, 0.5, 0.5,
-3.302878, -1, -5.892063, 1, -0.5, 0.5, 0.5,
-3.302878, -1, -5.892063, 1, 1.5, 0.5, 0.5,
-3.302878, -1, -5.892063, 0, 1.5, 0.5, 0.5,
-3.302878, 0, -5.892063, 0, -0.5, 0.5, 0.5,
-3.302878, 0, -5.892063, 1, -0.5, 0.5, 0.5,
-3.302878, 0, -5.892063, 1, 1.5, 0.5, 0.5,
-3.302878, 0, -5.892063, 0, 1.5, 0.5, 0.5,
-3.302878, 1, -5.892063, 0, -0.5, 0.5, 0.5,
-3.302878, 1, -5.892063, 1, -0.5, 0.5, 0.5,
-3.302878, 1, -5.892063, 1, 1.5, 0.5, 0.5,
-3.302878, 1, -5.892063, 0, 1.5, 0.5, 0.5,
-3.302878, 2, -5.892063, 0, -0.5, 0.5, 0.5,
-3.302878, 2, -5.892063, 1, -0.5, 0.5, 0.5,
-3.302878, 2, -5.892063, 1, 1.5, 0.5, 0.5,
-3.302878, 2, -5.892063, 0, 1.5, 0.5, 0.5,
-3.302878, 3, -5.892063, 0, -0.5, 0.5, 0.5,
-3.302878, 3, -5.892063, 1, -0.5, 0.5, 0.5,
-3.302878, 3, -5.892063, 1, 1.5, 0.5, 0.5,
-3.302878, 3, -5.892063, 0, 1.5, 0.5, 0.5
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
-2.859137, -3.688464, -4,
-2.859137, -3.688464, 4,
-2.859137, -3.688464, -4,
-3.007051, -3.858668, -4,
-2.859137, -3.688464, -2,
-3.007051, -3.858668, -2,
-2.859137, -3.688464, 0,
-3.007051, -3.858668, 0,
-2.859137, -3.688464, 2,
-3.007051, -3.858668, 2,
-2.859137, -3.688464, 4,
-3.007051, -3.858668, 4
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
-3.302878, -4.199078, -4, 0, -0.5, 0.5, 0.5,
-3.302878, -4.199078, -4, 1, -0.5, 0.5, 0.5,
-3.302878, -4.199078, -4, 1, 1.5, 0.5, 0.5,
-3.302878, -4.199078, -4, 0, 1.5, 0.5, 0.5,
-3.302878, -4.199078, -2, 0, -0.5, 0.5, 0.5,
-3.302878, -4.199078, -2, 1, -0.5, 0.5, 0.5,
-3.302878, -4.199078, -2, 1, 1.5, 0.5, 0.5,
-3.302878, -4.199078, -2, 0, 1.5, 0.5, 0.5,
-3.302878, -4.199078, 0, 0, -0.5, 0.5, 0.5,
-3.302878, -4.199078, 0, 1, -0.5, 0.5, 0.5,
-3.302878, -4.199078, 0, 1, 1.5, 0.5, 0.5,
-3.302878, -4.199078, 0, 0, 1.5, 0.5, 0.5,
-3.302878, -4.199078, 2, 0, -0.5, 0.5, 0.5,
-3.302878, -4.199078, 2, 1, -0.5, 0.5, 0.5,
-3.302878, -4.199078, 2, 1, 1.5, 0.5, 0.5,
-3.302878, -4.199078, 2, 0, 1.5, 0.5, 0.5,
-3.302878, -4.199078, 4, 0, -0.5, 0.5, 0.5,
-3.302878, -4.199078, 4, 1, -0.5, 0.5, 0.5,
-3.302878, -4.199078, 4, 1, 1.5, 0.5, 0.5,
-3.302878, -4.199078, 4, 0, 1.5, 0.5, 0.5
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
-2.859137, -3.688464, -5.116139,
-2.859137, 3.119728, -5.116139,
-2.859137, -3.688464, 5.229516,
-2.859137, 3.119728, 5.229516,
-2.859137, -3.688464, -5.116139,
-2.859137, -3.688464, 5.229516,
-2.859137, 3.119728, -5.116139,
-2.859137, 3.119728, 5.229516,
-2.859137, -3.688464, -5.116139,
3.057409, -3.688464, -5.116139,
-2.859137, -3.688464, 5.229516,
3.057409, -3.688464, 5.229516,
-2.859137, 3.119728, -5.116139,
3.057409, 3.119728, -5.116139,
-2.859137, 3.119728, 5.229516,
3.057409, 3.119728, 5.229516,
3.057409, -3.688464, -5.116139,
3.057409, 3.119728, -5.116139,
3.057409, -3.688464, 5.229516,
3.057409, 3.119728, 5.229516,
3.057409, -3.688464, -5.116139,
3.057409, -3.688464, 5.229516,
3.057409, 3.119728, -5.116139,
3.057409, 3.119728, 5.229516
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
var radius = 7.329154;
var distance = 32.60823;
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
mvMatrix.translate( -0.09913599, 0.284368, -0.05668831 );
mvMatrix.scale( 1.339367, 1.163955, 0.7659665 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.60823);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
cyclophosphamide<-read.table("cyclophosphamide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-cyclophosphamide$V2
```

```
## Error in eval(expr, envir, enclos): object 'cyclophosphamide' not found
```

```r
y<-cyclophosphamide$V3
```

```
## Error in eval(expr, envir, enclos): object 'cyclophosphamide' not found
```

```r
z<-cyclophosphamide$V4
```

```
## Error in eval(expr, envir, enclos): object 'cyclophosphamide' not found
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
-2.772974, 0.03406925, -2.022314, 0, 0, 1, 1, 1,
-2.681503, -1.372191, -2.400045, 1, 0, 0, 1, 1,
-2.507003, 0.8337935, -1.032518, 1, 0, 0, 1, 1,
-2.504156, 0.1212825, -1.623441, 1, 0, 0, 1, 1,
-2.430832, 0.8483628, -0.4017898, 1, 0, 0, 1, 1,
-2.407167, 0.7996573, -1.48993, 1, 0, 0, 1, 1,
-2.357572, 0.07588735, -0.4942888, 0, 0, 0, 1, 1,
-2.355964, 0.7461451, -0.2304537, 0, 0, 0, 1, 1,
-2.272891, 1.234622, 0.139983, 0, 0, 0, 1, 1,
-2.257783, 1.129424, -1.968543, 0, 0, 0, 1, 1,
-2.239251, -0.725858, -1.143807, 0, 0, 0, 1, 1,
-2.197067, 0.06161587, -1.509807, 0, 0, 0, 1, 1,
-2.196899, -1.757309, -2.416693, 0, 0, 0, 1, 1,
-2.143027, 1.166255, -0.05075013, 1, 1, 1, 1, 1,
-2.126977, -0.1814333, -1.163275, 1, 1, 1, 1, 1,
-2.122885, 0.5229347, 0.3526131, 1, 1, 1, 1, 1,
-2.051175, 0.3237027, -2.903545, 1, 1, 1, 1, 1,
-2.047039, 1.101188, 0.004566219, 1, 1, 1, 1, 1,
-2.003354, -0.1442788, -0.2549025, 1, 1, 1, 1, 1,
-1.987234, 0.721696, -1.259212, 1, 1, 1, 1, 1,
-1.983499, -2.310875, -2.745462, 1, 1, 1, 1, 1,
-1.925347, -1.046058, -2.331809, 1, 1, 1, 1, 1,
-1.909118, -0.2970866, -1.898793, 1, 1, 1, 1, 1,
-1.90514, -0.144205, -1.815565, 1, 1, 1, 1, 1,
-1.883432, 1.770733, -1.756733, 1, 1, 1, 1, 1,
-1.874087, -0.8814554, -2.888247, 1, 1, 1, 1, 1,
-1.866177, 1.055195, 0.4510463, 1, 1, 1, 1, 1,
-1.864107, -2.033212, -1.919352, 1, 1, 1, 1, 1,
-1.854793, -0.5709247, -1.173229, 0, 0, 1, 1, 1,
-1.851775, 0.003091566, -0.6261041, 1, 0, 0, 1, 1,
-1.846717, -0.1941023, -2.747346, 1, 0, 0, 1, 1,
-1.841614, -0.4304796, -2.290887, 1, 0, 0, 1, 1,
-1.828995, 0.02102951, 0.8003795, 1, 0, 0, 1, 1,
-1.825403, -0.8451176, -1.993717, 1, 0, 0, 1, 1,
-1.809286, 1.67209, 0.9404334, 0, 0, 0, 1, 1,
-1.803656, -1.587502, -2.132213, 0, 0, 0, 1, 1,
-1.803449, -0.2341392, -3.02387, 0, 0, 0, 1, 1,
-1.796129, 0.03096151, -1.179102, 0, 0, 0, 1, 1,
-1.795239, 0.3062958, -0.6609594, 0, 0, 0, 1, 1,
-1.784222, 0.7728878, 1.705457, 0, 0, 0, 1, 1,
-1.775265, 0.1040026, -1.865869, 0, 0, 0, 1, 1,
-1.762453, -0.7493786, -2.980991, 1, 1, 1, 1, 1,
-1.757191, 1.325194, -1.757298, 1, 1, 1, 1, 1,
-1.756576, 0.4094945, -0.01767996, 1, 1, 1, 1, 1,
-1.752874, -0.6363125, -1.210749, 1, 1, 1, 1, 1,
-1.752229, 1.929512, 2.910707, 1, 1, 1, 1, 1,
-1.744985, 1.625846, 0.4186312, 1, 1, 1, 1, 1,
-1.739049, 0.7043688, -1.785664, 1, 1, 1, 1, 1,
-1.733406, 0.715589, -2.670362, 1, 1, 1, 1, 1,
-1.717764, 1.946041, -1.727475, 1, 1, 1, 1, 1,
-1.699039, -0.01345036, -1.100883, 1, 1, 1, 1, 1,
-1.689838, -2.22668, -1.263009, 1, 1, 1, 1, 1,
-1.675179, -1.089886, -2.782496, 1, 1, 1, 1, 1,
-1.646533, 0.8505901, -1.357572, 1, 1, 1, 1, 1,
-1.615741, -0.4808929, 0.07427155, 1, 1, 1, 1, 1,
-1.615634, -0.1793012, -3.208388, 1, 1, 1, 1, 1,
-1.596282, -0.6246094, -2.486332, 0, 0, 1, 1, 1,
-1.592887, 1.914339, -1.751384, 1, 0, 0, 1, 1,
-1.590418, 1.520969, -3.062215, 1, 0, 0, 1, 1,
-1.580382, -1.12305, -1.623148, 1, 0, 0, 1, 1,
-1.579306, 1.53142, -1.573976, 1, 0, 0, 1, 1,
-1.573066, 1.727484, -0.1366958, 1, 0, 0, 1, 1,
-1.572399, 1.722704, -1.403955, 0, 0, 0, 1, 1,
-1.567749, 0.3062408, -2.363784, 0, 0, 0, 1, 1,
-1.553369, 1.677037, -1.315201, 0, 0, 0, 1, 1,
-1.516124, 0.3056117, -0.8228185, 0, 0, 0, 1, 1,
-1.504916, 0.473472, -1.568118, 0, 0, 0, 1, 1,
-1.497502, 0.4586597, -0.6872268, 0, 0, 0, 1, 1,
-1.497047, -1.285699, -2.600801, 0, 0, 0, 1, 1,
-1.491581, 1.214035, -0.9508123, 1, 1, 1, 1, 1,
-1.470357, 1.504497, 0.1507901, 1, 1, 1, 1, 1,
-1.462331, 0.5251409, -0.7163303, 1, 1, 1, 1, 1,
-1.456705, 0.5413638, -1.62406, 1, 1, 1, 1, 1,
-1.444164, -0.7098119, -1.73696, 1, 1, 1, 1, 1,
-1.440967, -0.5326571, -1.672204, 1, 1, 1, 1, 1,
-1.433031, 1.183648, -1.130776, 1, 1, 1, 1, 1,
-1.424384, -0.8440747, -3.135233, 1, 1, 1, 1, 1,
-1.413469, -1.12339, -1.518312, 1, 1, 1, 1, 1,
-1.412648, -0.004870041, -2.326182, 1, 1, 1, 1, 1,
-1.404344, -0.3679777, -2.002312, 1, 1, 1, 1, 1,
-1.404122, 0.1425009, -1.261632, 1, 1, 1, 1, 1,
-1.390887, -0.4907889, -1.427339, 1, 1, 1, 1, 1,
-1.389869, 1.308827, -2.035773, 1, 1, 1, 1, 1,
-1.389694, -0.2560127, -3.304732, 1, 1, 1, 1, 1,
-1.374877, -0.289833, -2.32092, 0, 0, 1, 1, 1,
-1.374689, 1.475533, -1.68694, 1, 0, 0, 1, 1,
-1.370348, -0.1007731, -1.758148, 1, 0, 0, 1, 1,
-1.368934, 0.8334314, -1.053309, 1, 0, 0, 1, 1,
-1.367704, -1.54776, -2.566819, 1, 0, 0, 1, 1,
-1.359084, 0.2219512, 0.3731387, 1, 0, 0, 1, 1,
-1.358722, -0.7979228, -2.664706, 0, 0, 0, 1, 1,
-1.358532, 0.6416625, -2.063692, 0, 0, 0, 1, 1,
-1.344042, -0.5750176, -0.8723177, 0, 0, 0, 1, 1,
-1.335254, 0.7305103, -0.7705425, 0, 0, 0, 1, 1,
-1.329588, 1.303748, -0.45675, 0, 0, 0, 1, 1,
-1.328739, -1.516922, -1.378761, 0, 0, 0, 1, 1,
-1.328267, 0.03818497, -2.51944, 0, 0, 0, 1, 1,
-1.326814, 1.335047, -1.270133, 1, 1, 1, 1, 1,
-1.326086, -1.210708, -2.264569, 1, 1, 1, 1, 1,
-1.322231, 0.8415332, -0.9436746, 1, 1, 1, 1, 1,
-1.314055, 1.879928, 1.422181, 1, 1, 1, 1, 1,
-1.305902, -0.3716241, 0.1666133, 1, 1, 1, 1, 1,
-1.300722, -0.3025713, -1.716585, 1, 1, 1, 1, 1,
-1.298898, 1.10712, -0.8196132, 1, 1, 1, 1, 1,
-1.297487, 0.1332705, -1.489964, 1, 1, 1, 1, 1,
-1.27769, 0.4320061, -1.114479, 1, 1, 1, 1, 1,
-1.275132, -0.8265265, -1.044133, 1, 1, 1, 1, 1,
-1.272339, 0.8651219, -0.1003405, 1, 1, 1, 1, 1,
-1.271884, -1.668809, -2.884243, 1, 1, 1, 1, 1,
-1.269578, -0.09258323, -1.829611, 1, 1, 1, 1, 1,
-1.266663, 0.2406631, -1.36116, 1, 1, 1, 1, 1,
-1.265031, 0.6202829, -2.417772, 1, 1, 1, 1, 1,
-1.26366, 1.674006, -0.3751931, 0, 0, 1, 1, 1,
-1.254129, 1.744226, 1.525036, 1, 0, 0, 1, 1,
-1.253837, 0.2875216, -2.626336, 1, 0, 0, 1, 1,
-1.248834, 2.346312, 2.230036, 1, 0, 0, 1, 1,
-1.236596, -2.084747, -3.447804, 1, 0, 0, 1, 1,
-1.236397, 0.7430686, -1.948012, 1, 0, 0, 1, 1,
-1.232304, -0.06780977, -0.2023571, 0, 0, 0, 1, 1,
-1.224941, -0.09009355, -1.749663, 0, 0, 0, 1, 1,
-1.22188, -0.3209823, -1.241664, 0, 0, 0, 1, 1,
-1.221754, -0.597005, -2.234262, 0, 0, 0, 1, 1,
-1.216283, -1.021719, -2.852161, 0, 0, 0, 1, 1,
-1.204293, -1.483377, -1.708982, 0, 0, 0, 1, 1,
-1.202954, -2.029305, -2.906468, 0, 0, 0, 1, 1,
-1.198494, 1.621453, -0.08443789, 1, 1, 1, 1, 1,
-1.197296, -0.553178, -1.500905, 1, 1, 1, 1, 1,
-1.193559, -1.070547, -0.7785774, 1, 1, 1, 1, 1,
-1.182601, 1.253262, -0.0605048, 1, 1, 1, 1, 1,
-1.181355, -0.8785327, -0.08918228, 1, 1, 1, 1, 1,
-1.171677, -1.44095, -2.255954, 1, 1, 1, 1, 1,
-1.161354, 0.4419737, 0.3571931, 1, 1, 1, 1, 1,
-1.156779, -0.2472246, -2.509542, 1, 1, 1, 1, 1,
-1.156361, -0.874046, -1.922967, 1, 1, 1, 1, 1,
-1.153495, -0.5755761, -1.936383, 1, 1, 1, 1, 1,
-1.149838, 1.099142, -0.4269586, 1, 1, 1, 1, 1,
-1.149608, 0.120462, -0.8526958, 1, 1, 1, 1, 1,
-1.143096, 1.788575, 0.02410357, 1, 1, 1, 1, 1,
-1.135005, 0.2403914, -2.470295, 1, 1, 1, 1, 1,
-1.121657, 0.6507031, 0.0211457, 1, 1, 1, 1, 1,
-1.12155, -0.4577936, -2.059255, 0, 0, 1, 1, 1,
-1.113346, -0.3082606, -1.913865, 1, 0, 0, 1, 1,
-1.110282, -0.8928992, -1.053419, 1, 0, 0, 1, 1,
-1.099842, 0.5773745, -1.138497, 1, 0, 0, 1, 1,
-1.096327, 0.2282598, -2.646806, 1, 0, 0, 1, 1,
-1.089775, 0.4206807, 0.2699219, 1, 0, 0, 1, 1,
-1.087777, 0.3637213, -2.742053, 0, 0, 0, 1, 1,
-1.087152, -0.1266642, -0.08146775, 0, 0, 0, 1, 1,
-1.083872, -0.9390942, -3.014395, 0, 0, 0, 1, 1,
-1.079298, 0.05433444, -4.238461, 0, 0, 0, 1, 1,
-1.074444, 1.242105, -0.7056592, 0, 0, 0, 1, 1,
-1.067374, 0.5937439, 1.035211, 0, 0, 0, 1, 1,
-1.065246, 0.3334131, -1.653729, 0, 0, 0, 1, 1,
-1.057243, -0.3758201, 0.003443002, 1, 1, 1, 1, 1,
-1.057024, 1.649256, -0.5255067, 1, 1, 1, 1, 1,
-1.049022, -0.1936803, 0.7716237, 1, 1, 1, 1, 1,
-1.042183, 0.4243095, -0.7148601, 1, 1, 1, 1, 1,
-1.041041, 1.584626, -2.66715, 1, 1, 1, 1, 1,
-1.035752, -1.135015, -1.805096, 1, 1, 1, 1, 1,
-1.034465, -0.6368493, -0.5448099, 1, 1, 1, 1, 1,
-1.034263, 0.1796179, -1.661951, 1, 1, 1, 1, 1,
-1.026523, -1.590271, -1.2617, 1, 1, 1, 1, 1,
-1.025452, 1.329974, -0.9277277, 1, 1, 1, 1, 1,
-1.01625, -0.2387532, -2.143004, 1, 1, 1, 1, 1,
-1.014779, -0.6416902, -2.791813, 1, 1, 1, 1, 1,
-1.013135, 1.145489, -1.332901, 1, 1, 1, 1, 1,
-1.00075, 0.9777447, -0.6068178, 1, 1, 1, 1, 1,
-1.00007, -0.6877961, -1.852848, 1, 1, 1, 1, 1,
-0.999577, -1.045406, -3.380472, 0, 0, 1, 1, 1,
-0.9992881, -1.937707, -0.4864486, 1, 0, 0, 1, 1,
-0.9990236, -0.5126698, -2.133339, 1, 0, 0, 1, 1,
-0.9928903, -0.0744582, -0.4197816, 1, 0, 0, 1, 1,
-0.9847965, -1.364527, -3.654298, 1, 0, 0, 1, 1,
-0.9811481, -2.452342, -4.155425, 1, 0, 0, 1, 1,
-0.9780862, 0.268888, -3.033171, 0, 0, 0, 1, 1,
-0.9682463, 1.953783, -1.0575, 0, 0, 0, 1, 1,
-0.9620632, 0.04338846, -1.215452, 0, 0, 0, 1, 1,
-0.9610358, 1.864742, -2.282682, 0, 0, 0, 1, 1,
-0.9596917, -1.532618e-05, 0.5135751, 0, 0, 0, 1, 1,
-0.9571033, -1.817054, -3.82292, 0, 0, 0, 1, 1,
-0.9527358, 1.150942, -1.46854, 0, 0, 0, 1, 1,
-0.9468033, 0.6753262, -1.669999, 1, 1, 1, 1, 1,
-0.9400824, 2.057702, 1.80538, 1, 1, 1, 1, 1,
-0.9396991, -0.320423, -2.207979, 1, 1, 1, 1, 1,
-0.9393857, -0.07587359, -0.01043073, 1, 1, 1, 1, 1,
-0.9388092, 0.660605, -0.1368401, 1, 1, 1, 1, 1,
-0.9355157, -0.9216604, -2.715588, 1, 1, 1, 1, 1,
-0.93495, 0.2658644, -0.9552516, 1, 1, 1, 1, 1,
-0.9349472, 1.743279, 1.683874, 1, 1, 1, 1, 1,
-0.9299829, 1.670946, 1.178071, 1, 1, 1, 1, 1,
-0.9289905, -0.01009877, -2.154233, 1, 1, 1, 1, 1,
-0.9286634, 1.429993, -0.6003994, 1, 1, 1, 1, 1,
-0.9223952, -0.8978067, -1.280403, 1, 1, 1, 1, 1,
-0.921892, 1.102966, 0.5632975, 1, 1, 1, 1, 1,
-0.9197073, 1.246653, 0.6409276, 1, 1, 1, 1, 1,
-0.9149739, 1.511674, -0.3018569, 1, 1, 1, 1, 1,
-0.9096493, -1.928989, -2.837084, 0, 0, 1, 1, 1,
-0.9075584, -0.07007062, -1.437185, 1, 0, 0, 1, 1,
-0.9060968, -0.2807593, -1.897796, 1, 0, 0, 1, 1,
-0.9059911, 0.3159141, -0.3073122, 1, 0, 0, 1, 1,
-0.897181, 0.5700287, -0.3683714, 1, 0, 0, 1, 1,
-0.8915944, 2.535825, -0.08552291, 1, 0, 0, 1, 1,
-0.8748042, 0.1331379, 1.689961, 0, 0, 0, 1, 1,
-0.866442, -1.71539, -2.116647, 0, 0, 0, 1, 1,
-0.8642351, 0.2920246, -2.423051, 0, 0, 0, 1, 1,
-0.8633352, -0.1920421, -2.135313, 0, 0, 0, 1, 1,
-0.8601347, -0.5426074, -0.6780467, 0, 0, 0, 1, 1,
-0.853468, -0.7795359, -1.20011, 0, 0, 0, 1, 1,
-0.8521019, 1.031643, -1.53922, 0, 0, 0, 1, 1,
-0.8488776, -1.272918, -1.944142, 1, 1, 1, 1, 1,
-0.8481951, 0.2628843, -2.377271, 1, 1, 1, 1, 1,
-0.843147, -0.07086252, -0.3379058, 1, 1, 1, 1, 1,
-0.842368, -0.2702923, -2.357649, 1, 1, 1, 1, 1,
-0.8381832, -1.799121, -3.732371, 1, 1, 1, 1, 1,
-0.8367643, -0.5642627, -1.820754, 1, 1, 1, 1, 1,
-0.8310928, -1.14607, -3.204747, 1, 1, 1, 1, 1,
-0.8283256, 1.827568, -0.1302666, 1, 1, 1, 1, 1,
-0.821532, 0.7177061, -2.584175, 1, 1, 1, 1, 1,
-0.8160447, 0.05018253, -2.627343, 1, 1, 1, 1, 1,
-0.8082352, 1.140314, 0.6751555, 1, 1, 1, 1, 1,
-0.8051171, 0.6836686, -2.096317, 1, 1, 1, 1, 1,
-0.8022081, -1.766169, -1.287678, 1, 1, 1, 1, 1,
-0.7923201, 0.978946, -1.81756, 1, 1, 1, 1, 1,
-0.7901998, -0.01813183, -1.932585, 1, 1, 1, 1, 1,
-0.7874699, -0.9001024, -2.882513, 0, 0, 1, 1, 1,
-0.7863914, -0.09501341, -2.86384, 1, 0, 0, 1, 1,
-0.7791712, 1.74307, -1.152444, 1, 0, 0, 1, 1,
-0.7737357, -1.552909, -0.8581024, 1, 0, 0, 1, 1,
-0.771449, 0.08368631, -2.593433, 1, 0, 0, 1, 1,
-0.7660307, -0.4235155, -2.403339, 1, 0, 0, 1, 1,
-0.765789, 1.60557, -0.1502729, 0, 0, 0, 1, 1,
-0.7612811, 0.8000358, -2.008662, 0, 0, 0, 1, 1,
-0.757827, -0.5788716, -1.821558, 0, 0, 0, 1, 1,
-0.7554986, 1.038309, -1.994283, 0, 0, 0, 1, 1,
-0.7529195, 0.126288, -1.689963, 0, 0, 0, 1, 1,
-0.7497705, 1.358186, -0.06223648, 0, 0, 0, 1, 1,
-0.7481223, 1.528133, -0.1133945, 0, 0, 0, 1, 1,
-0.744492, 0.6733822, -1.732873, 1, 1, 1, 1, 1,
-0.7436794, -2.986408, -4.134415, 1, 1, 1, 1, 1,
-0.7404006, 2.475035, 0.05304814, 1, 1, 1, 1, 1,
-0.7393622, 1.170347, -1.042939, 1, 1, 1, 1, 1,
-0.7366477, -0.09572503, -1.890458, 1, 1, 1, 1, 1,
-0.7363977, 1.400551, 0.107978, 1, 1, 1, 1, 1,
-0.7361172, 0.8637103, 0.1819805, 1, 1, 1, 1, 1,
-0.7340887, 1.58006, 0.6239385, 1, 1, 1, 1, 1,
-0.7339506, 1.032346, -1.479791, 1, 1, 1, 1, 1,
-0.7317775, 0.09359446, -1.753265, 1, 1, 1, 1, 1,
-0.7306345, 1.885112, -1.976665, 1, 1, 1, 1, 1,
-0.729513, -0.0697918, -1.669723, 1, 1, 1, 1, 1,
-0.7192327, 1.867103, 0.9227322, 1, 1, 1, 1, 1,
-0.7152571, 0.3716068, -1.37979, 1, 1, 1, 1, 1,
-0.7118092, -0.8297498, -3.841228, 1, 1, 1, 1, 1,
-0.7057468, 0.7073457, 0.7618665, 0, 0, 1, 1, 1,
-0.6987987, 0.8355172, -0.3658143, 1, 0, 0, 1, 1,
-0.6961171, 2.051532, 0.0748589, 1, 0, 0, 1, 1,
-0.6929598, -0.2766738, -1.707025, 1, 0, 0, 1, 1,
-0.6846214, -0.3263887, -1.061196, 1, 0, 0, 1, 1,
-0.677541, 0.5212978, -1.531238, 1, 0, 0, 1, 1,
-0.6751016, -0.7036968, -2.128824, 0, 0, 0, 1, 1,
-0.6729026, -1.45479, -4.091819, 0, 0, 0, 1, 1,
-0.6724678, -0.2663879, -2.523334, 0, 0, 0, 1, 1,
-0.6703994, -2.248081, -1.585289, 0, 0, 0, 1, 1,
-0.6669632, 0.2145387, -1.189521, 0, 0, 0, 1, 1,
-0.6637035, -1.276965, -2.013829, 0, 0, 0, 1, 1,
-0.65696, -0.3350251, -2.646327, 0, 0, 0, 1, 1,
-0.6566744, -1.051993, -2.517329, 1, 1, 1, 1, 1,
-0.6557794, -0.7921956, -2.599257, 1, 1, 1, 1, 1,
-0.6522076, 0.07379968, -3.296242, 1, 1, 1, 1, 1,
-0.6507055, -0.1635718, -3.036952, 1, 1, 1, 1, 1,
-0.650192, -0.09496995, -0.9465923, 1, 1, 1, 1, 1,
-0.6377177, -1.160424, -3.463479, 1, 1, 1, 1, 1,
-0.6312963, -0.9399375, -1.505234, 1, 1, 1, 1, 1,
-0.6311336, -2.217745, -2.894278, 1, 1, 1, 1, 1,
-0.6298059, 0.4489905, 0.3225539, 1, 1, 1, 1, 1,
-0.6248723, 0.6326737, -2.045939, 1, 1, 1, 1, 1,
-0.6235741, 0.08497957, -3.882802, 1, 1, 1, 1, 1,
-0.6192678, 0.5479857, -0.8023559, 1, 1, 1, 1, 1,
-0.6183123, 0.3728071, -1.549071, 1, 1, 1, 1, 1,
-0.616106, -0.3513353, -2.595198, 1, 1, 1, 1, 1,
-0.6125551, 0.5779086, -1.923937, 1, 1, 1, 1, 1,
-0.6105008, 0.9976439, -0.24067, 0, 0, 1, 1, 1,
-0.5992256, 0.7982033, -0.03182722, 1, 0, 0, 1, 1,
-0.5975829, -0.4518887, -1.830108, 1, 0, 0, 1, 1,
-0.5880947, -0.530246, -1.786281, 1, 0, 0, 1, 1,
-0.5854153, 0.5770994, -3.374035, 1, 0, 0, 1, 1,
-0.5853163, 1.322544, -1.205945, 1, 0, 0, 1, 1,
-0.578724, 0.5620432, -2.617785, 0, 0, 0, 1, 1,
-0.5782897, -0.5369956, -0.7513447, 0, 0, 0, 1, 1,
-0.577978, 0.5976932, -2.102915, 0, 0, 0, 1, 1,
-0.5742163, 0.5969527, -0.8926091, 0, 0, 0, 1, 1,
-0.5692798, 0.4262955, 0.1123777, 0, 0, 0, 1, 1,
-0.5692458, 0.5189365, -1.969205, 0, 0, 0, 1, 1,
-0.5644987, 1.409108, 0.930202, 0, 0, 0, 1, 1,
-0.5536966, 0.4024903, -2.08872, 1, 1, 1, 1, 1,
-0.5525223, -0.2618555, -3.090876, 1, 1, 1, 1, 1,
-0.548134, 0.1787148, -0.6543908, 1, 1, 1, 1, 1,
-0.5470009, -0.5294245, -1.902032, 1, 1, 1, 1, 1,
-0.5467602, -0.3537115, -0.8415895, 1, 1, 1, 1, 1,
-0.5452602, -0.8730758, -1.972513, 1, 1, 1, 1, 1,
-0.5404174, 3.020579, 1.003861, 1, 1, 1, 1, 1,
-0.5379338, -0.3762039, -1.43394, 1, 1, 1, 1, 1,
-0.5342237, 0.2672258, -1.898219, 1, 1, 1, 1, 1,
-0.5261396, 0.08208384, 0.9157992, 1, 1, 1, 1, 1,
-0.5244695, 0.207142, -2.950588, 1, 1, 1, 1, 1,
-0.524262, -1.721587, -2.864074, 1, 1, 1, 1, 1,
-0.5225381, 2.459919, -0.1004184, 1, 1, 1, 1, 1,
-0.5220028, 0.4688606, -0.3369496, 1, 1, 1, 1, 1,
-0.5203269, 1.508992, -0.7096162, 1, 1, 1, 1, 1,
-0.5186174, 0.5646991, -1.133721, 0, 0, 1, 1, 1,
-0.5129016, 1.575184, -2.192295, 1, 0, 0, 1, 1,
-0.510489, 0.3602568, -0.5593485, 1, 0, 0, 1, 1,
-0.5099086, -0.2351069, -2.664632, 1, 0, 0, 1, 1,
-0.5042058, -0.08042249, -0.8379437, 1, 0, 0, 1, 1,
-0.5013916, 1.045969, -0.3144816, 1, 0, 0, 1, 1,
-0.500553, 1.66245, -0.8256893, 0, 0, 0, 1, 1,
-0.4999829, 0.8699363, -1.01788, 0, 0, 0, 1, 1,
-0.496791, 0.9781251, -1.603303, 0, 0, 0, 1, 1,
-0.495223, 0.8279701, -1.164729, 0, 0, 0, 1, 1,
-0.4881125, -1.092491, -2.436849, 0, 0, 0, 1, 1,
-0.4870405, 1.178262, -0.1038814, 0, 0, 0, 1, 1,
-0.4863987, -0.2696895, -0.853376, 0, 0, 0, 1, 1,
-0.4842181, 0.3578355, -1.675999, 1, 1, 1, 1, 1,
-0.4818735, -0.8988514, -1.732357, 1, 1, 1, 1, 1,
-0.4789985, 0.5209137, 1.132936, 1, 1, 1, 1, 1,
-0.4785752, 0.06969238, -2.405813, 1, 1, 1, 1, 1,
-0.4784993, 1.202466, -0.07772119, 1, 1, 1, 1, 1,
-0.4782713, -0.6347337, -2.440093, 1, 1, 1, 1, 1,
-0.476802, -1.34156, -4.965474, 1, 1, 1, 1, 1,
-0.4733792, 0.6282709, -1.045426, 1, 1, 1, 1, 1,
-0.4733263, -0.885344, -1.351519, 1, 1, 1, 1, 1,
-0.4691073, -0.450112, -4.646287, 1, 1, 1, 1, 1,
-0.4684914, 0.5393101, 0.3537801, 1, 1, 1, 1, 1,
-0.4676285, 0.6333691, -1.778331, 1, 1, 1, 1, 1,
-0.4664203, 0.6957856, -1.672175, 1, 1, 1, 1, 1,
-0.4634244, -0.4022167, -2.625305, 1, 1, 1, 1, 1,
-0.4618587, 0.290905, -0.3037054, 1, 1, 1, 1, 1,
-0.4617082, -0.04385248, -0.2601634, 0, 0, 1, 1, 1,
-0.4611143, -2.530815, -2.876369, 1, 0, 0, 1, 1,
-0.4605808, -0.4993972, -1.669662, 1, 0, 0, 1, 1,
-0.4599316, -0.7763171, -3.352365, 1, 0, 0, 1, 1,
-0.4586982, 0.4033377, -2.691755, 1, 0, 0, 1, 1,
-0.4586728, -0.3957963, -3.292456, 1, 0, 0, 1, 1,
-0.4585969, 1.387711, -2.373429, 0, 0, 0, 1, 1,
-0.4559048, 0.3829794, -1.182487, 0, 0, 0, 1, 1,
-0.4476277, -0.1675707, -2.321803, 0, 0, 0, 1, 1,
-0.4462192, -1.969825, -2.278692, 0, 0, 0, 1, 1,
-0.4431667, 2.037642, -0.1336812, 0, 0, 0, 1, 1,
-0.4427626, -0.296326, -2.566772, 0, 0, 0, 1, 1,
-0.4417626, -1.855299, -4.959571, 0, 0, 0, 1, 1,
-0.4386781, 0.3185939, 0.6767132, 1, 1, 1, 1, 1,
-0.4372807, 1.220476, -0.3729986, 1, 1, 1, 1, 1,
-0.4345917, 0.9341191, -0.3792356, 1, 1, 1, 1, 1,
-0.4342076, 0.5261398, 0.4994442, 1, 1, 1, 1, 1,
-0.4320618, -1.291925, -0.5276204, 1, 1, 1, 1, 1,
-0.4300445, 0.5882027, -1.563993, 1, 1, 1, 1, 1,
-0.4290526, 0.06531139, -0.2982319, 1, 1, 1, 1, 1,
-0.4270429, 0.2372235, -1.493389, 1, 1, 1, 1, 1,
-0.4250519, 0.7813005, -0.3398956, 1, 1, 1, 1, 1,
-0.4247457, 1.08505, -0.9644029, 1, 1, 1, 1, 1,
-0.4242324, 0.03107687, -2.694745, 1, 1, 1, 1, 1,
-0.4241944, -0.5921538, -3.296864, 1, 1, 1, 1, 1,
-0.4232839, 0.8982977, 0.675664, 1, 1, 1, 1, 1,
-0.4208563, -0.03568655, -0.67066, 1, 1, 1, 1, 1,
-0.4206141, -0.06368158, -0.3308349, 1, 1, 1, 1, 1,
-0.4187194, 1.358014, -0.3045109, 0, 0, 1, 1, 1,
-0.4102065, 0.9808176, -0.875255, 1, 0, 0, 1, 1,
-0.4086112, 0.2149187, -2.563096, 1, 0, 0, 1, 1,
-0.4027877, -0.3909355, -1.738034, 1, 0, 0, 1, 1,
-0.4023353, -0.4761519, -2.893284, 1, 0, 0, 1, 1,
-0.3959455, 0.8888453, -0.4334034, 1, 0, 0, 1, 1,
-0.3956021, 0.03150862, -2.858178, 0, 0, 0, 1, 1,
-0.388802, 0.3415971, -0.8433878, 0, 0, 0, 1, 1,
-0.3885336, -0.5424553, -3.706869, 0, 0, 0, 1, 1,
-0.3857222, 0.3880873, -0.7095696, 0, 0, 0, 1, 1,
-0.3853413, -0.2659634, -3.506721, 0, 0, 0, 1, 1,
-0.3803944, -0.9027093, -2.320173, 0, 0, 0, 1, 1,
-0.3759547, -1.120899, -2.684613, 0, 0, 0, 1, 1,
-0.3747816, 0.1926037, -1.993989, 1, 1, 1, 1, 1,
-0.3719053, -2.130337, -1.622922, 1, 1, 1, 1, 1,
-0.3687849, 0.3511792, -1.242029, 1, 1, 1, 1, 1,
-0.367019, 0.231637, -0.5353333, 1, 1, 1, 1, 1,
-0.3633121, -1.110168, -2.404782, 1, 1, 1, 1, 1,
-0.3605444, -0.9733906, -1.523106, 1, 1, 1, 1, 1,
-0.3585159, -0.2292245, -1.959926, 1, 1, 1, 1, 1,
-0.3573311, -0.3913637, -2.048898, 1, 1, 1, 1, 1,
-0.3566509, -0.6575295, -2.195232, 1, 1, 1, 1, 1,
-0.3534268, -0.06162507, -1.291905, 1, 1, 1, 1, 1,
-0.3528501, -1.244009, -3.787126, 1, 1, 1, 1, 1,
-0.3527272, 0.05338332, -1.208934, 1, 1, 1, 1, 1,
-0.3479615, 0.8720418, -0.3489301, 1, 1, 1, 1, 1,
-0.3471795, 0.6055233, -1.038899, 1, 1, 1, 1, 1,
-0.3459783, -0.9671711, -2.272579, 1, 1, 1, 1, 1,
-0.3398741, 0.6489721, -0.05091363, 0, 0, 1, 1, 1,
-0.33824, 0.3856607, -2.329681, 1, 0, 0, 1, 1,
-0.334778, 0.1078199, 0.5777726, 1, 0, 0, 1, 1,
-0.333373, 0.8889027, -1.27996, 1, 0, 0, 1, 1,
-0.3326271, -0.9264433, -3.61569, 1, 0, 0, 1, 1,
-0.3305469, 0.6577054, 0.850933, 1, 0, 0, 1, 1,
-0.328317, -1.258659, -1.332703, 0, 0, 0, 1, 1,
-0.3269091, 0.100793, 0.06513901, 0, 0, 0, 1, 1,
-0.3262733, -0.6733576, -3.280256, 0, 0, 0, 1, 1,
-0.3254047, 0.8033663, 0.7191042, 0, 0, 0, 1, 1,
-0.3244904, -0.7610646, -3.807794, 0, 0, 0, 1, 1,
-0.3227009, -0.2749817, -0.374153, 0, 0, 0, 1, 1,
-0.3198082, -1.310986, -3.968317, 0, 0, 0, 1, 1,
-0.319326, -1.005755, -0.7951736, 1, 1, 1, 1, 1,
-0.3189331, -0.9996315, -2.541375, 1, 1, 1, 1, 1,
-0.3135851, -0.394011, -3.519166, 1, 1, 1, 1, 1,
-0.3016969, -0.8080657, -2.266732, 1, 1, 1, 1, 1,
-0.300127, -0.06543697, -3.188592, 1, 1, 1, 1, 1,
-0.2984154, 1.088141, -1.626229, 1, 1, 1, 1, 1,
-0.2966735, 0.397928, -0.6545228, 1, 1, 1, 1, 1,
-0.294662, -1.609166, -2.680719, 1, 1, 1, 1, 1,
-0.2861586, 0.249098, -2.182119, 1, 1, 1, 1, 1,
-0.2858694, -0.5666097, -2.058756, 1, 1, 1, 1, 1,
-0.282088, 0.02223375, -1.600981, 1, 1, 1, 1, 1,
-0.2786806, 0.5041224, -1.026664, 1, 1, 1, 1, 1,
-0.2749346, 0.9023604, -0.6183439, 1, 1, 1, 1, 1,
-0.2746155, 0.869285, 1.60978, 1, 1, 1, 1, 1,
-0.2697786, 1.240991, -1.724489, 1, 1, 1, 1, 1,
-0.2684385, -0.5817529, -2.925143, 0, 0, 1, 1, 1,
-0.2666456, 0.4817508, -1.216142, 1, 0, 0, 1, 1,
-0.2662443, 0.2891621, -2.66162, 1, 0, 0, 1, 1,
-0.2620075, 0.6012232, 0.8888994, 1, 0, 0, 1, 1,
-0.2615393, 0.8285559, -1.891851, 1, 0, 0, 1, 1,
-0.2511252, 1.809748, -2.04646, 1, 0, 0, 1, 1,
-0.2493035, -0.6935694, -2.928178, 0, 0, 0, 1, 1,
-0.2434787, -0.1934127, -1.765151, 0, 0, 0, 1, 1,
-0.2400628, -1.048656, -3.126256, 0, 0, 0, 1, 1,
-0.2393606, -0.8925503, -2.912695, 0, 0, 0, 1, 1,
-0.2384431, -1.202064, -3.335033, 0, 0, 0, 1, 1,
-0.2352924, 2.396988, -0.5350735, 0, 0, 0, 1, 1,
-0.232559, 1.321455, 0.952951, 0, 0, 0, 1, 1,
-0.2238393, 2.445467, -1.351692, 1, 1, 1, 1, 1,
-0.2219709, -0.05657603, -2.469748, 1, 1, 1, 1, 1,
-0.2210437, 0.6272321, -0.1454529, 1, 1, 1, 1, 1,
-0.2207981, -1.032452, -3.579555, 1, 1, 1, 1, 1,
-0.217472, -0.3481982, -2.904316, 1, 1, 1, 1, 1,
-0.2158325, 0.03006645, -2.179013, 1, 1, 1, 1, 1,
-0.2134401, -0.4118634, -3.517569, 1, 1, 1, 1, 1,
-0.2114923, -0.06491283, -1.801368, 1, 1, 1, 1, 1,
-0.2063423, -0.4563192, -2.919426, 1, 1, 1, 1, 1,
-0.2047166, -0.3532329, -3.978469, 1, 1, 1, 1, 1,
-0.2037414, 0.5566983, -0.4784784, 1, 1, 1, 1, 1,
-0.2029051, 0.8795353, -2.117379, 1, 1, 1, 1, 1,
-0.1996364, 0.3432349, -1.452896, 1, 1, 1, 1, 1,
-0.1964631, -0.7696202, -2.780396, 1, 1, 1, 1, 1,
-0.1945346, 0.2144869, -1.689138, 1, 1, 1, 1, 1,
-0.1905207, 1.551282, 0.5447023, 0, 0, 1, 1, 1,
-0.1892891, 0.9053254, 0.7208011, 1, 0, 0, 1, 1,
-0.1779979, -0.01362616, -1.724019, 1, 0, 0, 1, 1,
-0.1723855, 0.06408801, -2.432788, 1, 0, 0, 1, 1,
-0.1710382, 0.9176801, 0.2443335, 1, 0, 0, 1, 1,
-0.1708721, -0.4963712, -0.4917923, 1, 0, 0, 1, 1,
-0.168117, -1.072809, -2.461418, 0, 0, 0, 1, 1,
-0.1667512, 1.424397, -0.7770275, 0, 0, 0, 1, 1,
-0.1649043, -0.2635208, -3.18771, 0, 0, 0, 1, 1,
-0.1604289, -0.1337847, -1.851246, 0, 0, 0, 1, 1,
-0.1603358, -0.09706762, -0.9614015, 0, 0, 0, 1, 1,
-0.1582638, 1.223179, -0.8632326, 0, 0, 0, 1, 1,
-0.1569545, -0.7165129, -2.404817, 0, 0, 0, 1, 1,
-0.1480735, 0.06930152, -0.5764896, 1, 1, 1, 1, 1,
-0.1449812, 1.105857, -0.963913, 1, 1, 1, 1, 1,
-0.1380087, 0.9185399, 0.9929916, 1, 1, 1, 1, 1,
-0.1327558, -0.07119472, -1.746335, 1, 1, 1, 1, 1,
-0.1238117, -1.164424, -0.6947269, 1, 1, 1, 1, 1,
-0.1236049, 0.5676969, -0.80934, 1, 1, 1, 1, 1,
-0.123384, -0.8882109, -2.579156, 1, 1, 1, 1, 1,
-0.1225083, 0.1972966, -1.065633, 1, 1, 1, 1, 1,
-0.1220625, 0.008643735, -2.768439, 1, 1, 1, 1, 1,
-0.119571, 1.160993, -0.2070556, 1, 1, 1, 1, 1,
-0.1190115, 0.8506982, -0.03642883, 1, 1, 1, 1, 1,
-0.1188676, -0.6368136, -3.481204, 1, 1, 1, 1, 1,
-0.1188526, -0.1659651, -3.02052, 1, 1, 1, 1, 1,
-0.1165859, -1.532065, -3.113652, 1, 1, 1, 1, 1,
-0.1163781, 1.809413, 0.7559307, 1, 1, 1, 1, 1,
-0.1157993, -0.9272004, -3.256948, 0, 0, 1, 1, 1,
-0.1155233, -1.783307, -3.124676, 1, 0, 0, 1, 1,
-0.1102088, 0.4582208, 1.364364, 1, 0, 0, 1, 1,
-0.1101225, -0.2870772, -3.705643, 1, 0, 0, 1, 1,
-0.1072072, -0.1917273, -3.273934, 1, 0, 0, 1, 1,
-0.1069591, 2.414696, -1.877408, 1, 0, 0, 1, 1,
-0.1057925, -0.5128387, -0.9887087, 0, 0, 0, 1, 1,
-0.1034524, 0.5269666, 1.035143, 0, 0, 0, 1, 1,
-0.1030903, -0.7075618, -2.414896, 0, 0, 0, 1, 1,
-0.1017638, -0.6398953, -0.602347, 0, 0, 0, 1, 1,
-0.1013291, 0.7350712, -0.2935616, 0, 0, 0, 1, 1,
-0.1007072, -0.5905141, -2.854118, 0, 0, 0, 1, 1,
-0.09723379, -1.34924, -4.057652, 0, 0, 0, 1, 1,
-0.09419364, -0.5227997, -2.058229, 1, 1, 1, 1, 1,
-0.08470345, 0.1533929, 0.0227451, 1, 1, 1, 1, 1,
-0.0837234, 0.9246982, 0.0954653, 1, 1, 1, 1, 1,
-0.08302947, -0.5316944, -3.890835, 1, 1, 1, 1, 1,
-0.08106453, -0.4539154, -1.66225, 1, 1, 1, 1, 1,
-0.07569347, 0.6078328, -0.886166, 1, 1, 1, 1, 1,
-0.07432466, 0.5849621, -1.812665, 1, 1, 1, 1, 1,
-0.06754751, -0.2144459, -1.590559, 1, 1, 1, 1, 1,
-0.06488703, -1.746919, -1.383915, 1, 1, 1, 1, 1,
-0.06069847, -0.5516005, -3.198967, 1, 1, 1, 1, 1,
-0.05843315, 0.5169144, -0.7224897, 1, 1, 1, 1, 1,
-0.05616127, -0.9250677, -3.85569, 1, 1, 1, 1, 1,
-0.05613876, -1.541754, -2.302372, 1, 1, 1, 1, 1,
-0.05555594, 0.2117379, 1.053516, 1, 1, 1, 1, 1,
-0.04963468, -2.802232, -2.496973, 1, 1, 1, 1, 1,
-0.04543923, -1.235902, -4.231639, 0, 0, 1, 1, 1,
-0.04400831, -0.4630187, -3.087346, 1, 0, 0, 1, 1,
-0.03760968, -0.1474563, -3.008883, 1, 0, 0, 1, 1,
-0.03585211, -1.584934, -4.014913, 1, 0, 0, 1, 1,
-0.03389691, -0.3431492, -2.260423, 1, 0, 0, 1, 1,
-0.03356739, 1.53116, -0.5845127, 1, 0, 0, 1, 1,
-0.03057755, 1.186055, 1.236265, 0, 0, 0, 1, 1,
-0.030548, 0.4950102, -0.149443, 0, 0, 0, 1, 1,
-0.02716259, -0.8181315, -2.571928, 0, 0, 0, 1, 1,
-0.02618938, 0.2964906, 1.154201, 0, 0, 0, 1, 1,
-0.0149606, -2.156485, -3.601254, 0, 0, 0, 1, 1,
-0.01364578, -0.5979259, -4.945831, 0, 0, 0, 1, 1,
-0.01352578, -0.0008721089, -2.433019, 0, 0, 0, 1, 1,
-0.01260993, -1.241248, -3.774744, 1, 1, 1, 1, 1,
-0.01255828, 0.2068717, 0.3174695, 1, 1, 1, 1, 1,
-0.01190402, -1.259709, -4.32515, 1, 1, 1, 1, 1,
-0.01172134, 1.927928, -0.9475204, 1, 1, 1, 1, 1,
-0.01167433, 0.1217913, -1.449615, 1, 1, 1, 1, 1,
-0.01157221, 0.03266382, -1.802864, 1, 1, 1, 1, 1,
-0.008229368, 0.2505817, -0.1358969, 1, 1, 1, 1, 1,
-0.004788083, -0.4419999, -4.201783, 1, 1, 1, 1, 1,
-0.003546724, 0.4058162, 0.6810699, 1, 1, 1, 1, 1,
-0.003316691, -0.7081125, -4.851774, 1, 1, 1, 1, 1,
-0.003046126, 1.226083, 0.4060172, 1, 1, 1, 1, 1,
0.00297869, 1.351945, 0.3409635, 1, 1, 1, 1, 1,
0.003716835, -0.4680347, 4.335238, 1, 1, 1, 1, 1,
0.009710323, -1.038804, 3.461186, 1, 1, 1, 1, 1,
0.01032007, -1.265387, 3.854789, 1, 1, 1, 1, 1,
0.01542664, -2.144689, 3.290192, 0, 0, 1, 1, 1,
0.01787253, -1.204804, 3.785506, 1, 0, 0, 1, 1,
0.01814228, 1.808894, 1.824257, 1, 0, 0, 1, 1,
0.02013896, -0.06340263, 1.639637, 1, 0, 0, 1, 1,
0.02152958, 0.5635084, -0.09535471, 1, 0, 0, 1, 1,
0.02211239, -0.7741752, 2.467845, 1, 0, 0, 1, 1,
0.02259212, 0.3576736, 0.3209438, 0, 0, 0, 1, 1,
0.02364182, 1.083015, -0.3377234, 0, 0, 0, 1, 1,
0.02755054, -1.912437, 2.66088, 0, 0, 0, 1, 1,
0.02909645, 0.5479251, 1.939566, 0, 0, 0, 1, 1,
0.02999223, 1.268135, 0.02871682, 0, 0, 0, 1, 1,
0.03081904, -0.8034295, 1.318209, 0, 0, 0, 1, 1,
0.03086168, 0.101014, 0.8090666, 0, 0, 0, 1, 1,
0.03648795, -1.842933, 3.060425, 1, 1, 1, 1, 1,
0.03826832, -0.5894631, 2.36553, 1, 1, 1, 1, 1,
0.03909588, 0.110946, -0.2007831, 1, 1, 1, 1, 1,
0.04197177, -2.576469, 2.385989, 1, 1, 1, 1, 1,
0.04797001, -0.1329887, 4.349261, 1, 1, 1, 1, 1,
0.05100815, 0.3028793, -1.8647, 1, 1, 1, 1, 1,
0.05169685, -1.010859, 3.102613, 1, 1, 1, 1, 1,
0.05250196, -0.8159148, 3.191044, 1, 1, 1, 1, 1,
0.05489154, 0.1909747, 0.2970064, 1, 1, 1, 1, 1,
0.05635023, -0.2089421, 2.811175, 1, 1, 1, 1, 1,
0.05851291, 0.4440078, 1.52866, 1, 1, 1, 1, 1,
0.06001572, 0.1524387, 0.4038789, 1, 1, 1, 1, 1,
0.06049405, 0.5938234, -0.7446207, 1, 1, 1, 1, 1,
0.06212366, 0.01804865, 0.419436, 1, 1, 1, 1, 1,
0.06459717, -0.1789476, 4.144886, 1, 1, 1, 1, 1,
0.06923246, -0.05188106, 3.496249, 0, 0, 1, 1, 1,
0.06999149, -1.005124, 2.37148, 1, 0, 0, 1, 1,
0.07152293, -0.2852603, 3.610727, 1, 0, 0, 1, 1,
0.07182183, -0.1215854, 2.384132, 1, 0, 0, 1, 1,
0.07302357, -0.06367508, 3.78336, 1, 0, 0, 1, 1,
0.07335433, -0.7435877, 2.056041, 1, 0, 0, 1, 1,
0.073875, 0.0894961, 0.2981388, 0, 0, 0, 1, 1,
0.07947703, 0.4631466, -1.23305, 0, 0, 0, 1, 1,
0.08005844, -0.5295428, 1.732619, 0, 0, 0, 1, 1,
0.08273129, 1.297591, -1.646055, 0, 0, 0, 1, 1,
0.08545473, 1.996869, 1.037639, 0, 0, 0, 1, 1,
0.08614995, -1.098945, 2.744812, 0, 0, 0, 1, 1,
0.08668693, -0.2774849, 4.480956, 0, 0, 0, 1, 1,
0.0883515, -0.3847165, 1.823456, 1, 1, 1, 1, 1,
0.09116373, -1.117382, 2.39626, 1, 1, 1, 1, 1,
0.1026908, 1.173689, -0.6660998, 1, 1, 1, 1, 1,
0.1054162, 0.9456496, -0.03511814, 1, 1, 1, 1, 1,
0.1079463, 1.379797, 0.9953861, 1, 1, 1, 1, 1,
0.1084856, 1.389082, 0.9525705, 1, 1, 1, 1, 1,
0.1085811, 0.8433278, 0.5640765, 1, 1, 1, 1, 1,
0.1099897, -1.20824, 1.523564, 1, 1, 1, 1, 1,
0.1137286, -0.1005967, 3.304014, 1, 1, 1, 1, 1,
0.1172024, -2.411288, 3.271513, 1, 1, 1, 1, 1,
0.1178697, 0.5998636, -1.502042, 1, 1, 1, 1, 1,
0.1182326, -0.2515112, 3.021798, 1, 1, 1, 1, 1,
0.1237725, 0.04822885, 0.330262, 1, 1, 1, 1, 1,
0.1287686, -2.059395, 3.417292, 1, 1, 1, 1, 1,
0.1296139, 0.9364828, 2.264494, 1, 1, 1, 1, 1,
0.1345756, 1.704411, -0.7898081, 0, 0, 1, 1, 1,
0.1365962, -0.2453681, 2.688783, 1, 0, 0, 1, 1,
0.1372589, -0.6877953, 1.851772, 1, 0, 0, 1, 1,
0.1543429, -1.979549, 3.127763, 1, 0, 0, 1, 1,
0.1550953, -0.200152, 3.361089, 1, 0, 0, 1, 1,
0.1553353, 0.7316759, -0.9015666, 1, 0, 0, 1, 1,
0.156778, 0.5813841, -0.5829617, 0, 0, 0, 1, 1,
0.1608234, 0.3989829, 0.7162622, 0, 0, 0, 1, 1,
0.1610263, -1.198622, 2.93827, 0, 0, 0, 1, 1,
0.1622559, -1.174179, 2.92869, 0, 0, 0, 1, 1,
0.1622866, 1.391725, -1.54196, 0, 0, 0, 1, 1,
0.1635605, -1.207123, 1.969685, 0, 0, 0, 1, 1,
0.1653216, 1.211591, 1.023077, 0, 0, 0, 1, 1,
0.1659359, -0.243532, 1.392193, 1, 1, 1, 1, 1,
0.1695961, -0.2045676, 3.100226, 1, 1, 1, 1, 1,
0.1703306, 1.124459, 0.2066811, 1, 1, 1, 1, 1,
0.1738787, 1.272906, -0.2507835, 1, 1, 1, 1, 1,
0.1760452, 0.9512188, -1.23406, 1, 1, 1, 1, 1,
0.1763665, -0.2148865, 1.466939, 1, 1, 1, 1, 1,
0.1766507, -0.6546775, 1.939509, 1, 1, 1, 1, 1,
0.1829913, 1.798083, -0.03837441, 1, 1, 1, 1, 1,
0.1858513, 1.277636, -0.1177523, 1, 1, 1, 1, 1,
0.1889952, 0.731618, -0.1611158, 1, 1, 1, 1, 1,
0.1950076, 0.08234613, 1.030702, 1, 1, 1, 1, 1,
0.2012242, -0.08841787, -0.02910508, 1, 1, 1, 1, 1,
0.2051885, 1.475538, -0.2366231, 1, 1, 1, 1, 1,
0.207059, 0.8860292, -0.371599, 1, 1, 1, 1, 1,
0.2076011, -0.3227802, 2.57195, 1, 1, 1, 1, 1,
0.2093997, -1.404283, 1.432946, 0, 0, 1, 1, 1,
0.2132155, 0.4227371, 0.9063056, 1, 0, 0, 1, 1,
0.2189298, -1.245121, 3.261801, 1, 0, 0, 1, 1,
0.219189, -0.3558812, 2.62897, 1, 0, 0, 1, 1,
0.2255833, 1.656959, -0.6178131, 1, 0, 0, 1, 1,
0.2259872, 0.4854406, 0.6792534, 1, 0, 0, 1, 1,
0.2287167, 0.2146218, 1.190031, 0, 0, 0, 1, 1,
0.2313607, 0.3252634, 0.1621302, 0, 0, 0, 1, 1,
0.2387398, -0.4520682, 1.44402, 0, 0, 0, 1, 1,
0.2401007, 2.289822, 0.9270055, 0, 0, 0, 1, 1,
0.2401045, -0.3298202, 2.279668, 0, 0, 0, 1, 1,
0.2427861, -1.392538, 3.554399, 0, 0, 0, 1, 1,
0.2486449, -0.598107, 2.422957, 0, 0, 0, 1, 1,
0.2514894, 1.758826, -0.3895152, 1, 1, 1, 1, 1,
0.2534553, 1.191877, 1.133727, 1, 1, 1, 1, 1,
0.2544449, 1.810254, -0.1357106, 1, 1, 1, 1, 1,
0.2595766, -0.1790653, 2.116192, 1, 1, 1, 1, 1,
0.2630957, 2.24846, -1.018748, 1, 1, 1, 1, 1,
0.2634098, -1.395085, 2.579638, 1, 1, 1, 1, 1,
0.2648236, -0.3566497, 2.579293, 1, 1, 1, 1, 1,
0.266684, 1.091605, -0.2689549, 1, 1, 1, 1, 1,
0.2669677, 1.626965, 0.6271009, 1, 1, 1, 1, 1,
0.2697218, 0.8525326, 0.8423674, 1, 1, 1, 1, 1,
0.2699583, 0.2683099, 1.645009, 1, 1, 1, 1, 1,
0.2736011, 2.271921, -0.5867919, 1, 1, 1, 1, 1,
0.2744072, 0.2718068, 0.367505, 1, 1, 1, 1, 1,
0.2748387, 0.6808659, -0.7895965, 1, 1, 1, 1, 1,
0.2759112, 1.597506, -0.7259572, 1, 1, 1, 1, 1,
0.2774885, 0.3418678, -0.005836087, 0, 0, 1, 1, 1,
0.2812226, -0.5032657, 2.912151, 1, 0, 0, 1, 1,
0.2814189, -0.4373856, 2.319524, 1, 0, 0, 1, 1,
0.286637, -0.4356928, 2.294139, 1, 0, 0, 1, 1,
0.2882859, 0.603016, 0.3595682, 1, 0, 0, 1, 1,
0.2892644, -0.4171977, 2.13562, 1, 0, 0, 1, 1,
0.2912834, 0.4478347, -0.8986931, 0, 0, 0, 1, 1,
0.2913396, 0.7908596, 1.606559, 0, 0, 0, 1, 1,
0.2913801, -0.9992483, 2.496757, 0, 0, 0, 1, 1,
0.2928115, 1.349115, 1.31925, 0, 0, 0, 1, 1,
0.2935651, -0.8775437, 4.658081, 0, 0, 0, 1, 1,
0.3008724, -0.4061457, 4.822679, 0, 0, 0, 1, 1,
0.3028079, -0.05766692, 1.454587, 0, 0, 0, 1, 1,
0.3122296, 0.6088068, 0.7019274, 1, 1, 1, 1, 1,
0.3175484, 0.09744807, 2.463635, 1, 1, 1, 1, 1,
0.3230486, 0.3251669, 0.7772779, 1, 1, 1, 1, 1,
0.3235103, -1.174206, 2.89062, 1, 1, 1, 1, 1,
0.3280146, -1.517626, 2.189184, 1, 1, 1, 1, 1,
0.3286924, -0.9798971, 3.028282, 1, 1, 1, 1, 1,
0.3291798, -0.8200638, 3.312871, 1, 1, 1, 1, 1,
0.3319211, -0.373496, 4.854504, 1, 1, 1, 1, 1,
0.3415335, -2.619503, 2.741968, 1, 1, 1, 1, 1,
0.3433866, -0.5750927, 1.786342, 1, 1, 1, 1, 1,
0.3436053, -1.34291, 1.969699, 1, 1, 1, 1, 1,
0.3444137, 0.1139291, 2.314614, 1, 1, 1, 1, 1,
0.3447193, 1.852404, 1.283834, 1, 1, 1, 1, 1,
0.355767, 0.1977026, 0.4428131, 1, 1, 1, 1, 1,
0.3594001, 0.3029808, -0.2855409, 1, 1, 1, 1, 1,
0.3606902, 0.3465113, 0.5225853, 0, 0, 1, 1, 1,
0.3680127, 1.800163, -0.9842311, 1, 0, 0, 1, 1,
0.3720114, -0.8066458, 2.810884, 1, 0, 0, 1, 1,
0.3828427, -2.270113, 1.793927, 1, 0, 0, 1, 1,
0.3901188, 1.005048, -0.341702, 1, 0, 0, 1, 1,
0.3945198, -0.2872728, 0.6074761, 1, 0, 0, 1, 1,
0.3954242, -0.005716112, 1.70867, 0, 0, 0, 1, 1,
0.3993369, -0.09813297, 1.530521, 0, 0, 0, 1, 1,
0.4035229, 0.6577339, 0.5774255, 0, 0, 0, 1, 1,
0.4120253, 0.1608655, 1.192994, 0, 0, 0, 1, 1,
0.4218442, -1.375831, 3.940046, 0, 0, 0, 1, 1,
0.4243685, 0.5811621, 1.900592, 0, 0, 0, 1, 1,
0.424637, 1.152187, 1.640787, 0, 0, 0, 1, 1,
0.425693, 0.8847252, 1.129241, 1, 1, 1, 1, 1,
0.426042, 1.267832, -0.6468391, 1, 1, 1, 1, 1,
0.4297954, -1.002009, 2.957332, 1, 1, 1, 1, 1,
0.430944, 0.6881786, 1.984647, 1, 1, 1, 1, 1,
0.432297, 1.511935, -0.03762705, 1, 1, 1, 1, 1,
0.4373065, 0.8398796, -0.0502408, 1, 1, 1, 1, 1,
0.4398681, 0.4732578, -0.9811972, 1, 1, 1, 1, 1,
0.4407034, 1.181806, 0.9704618, 1, 1, 1, 1, 1,
0.4445467, -0.6426995, 3.611275, 1, 1, 1, 1, 1,
0.4465025, 0.5350758, 0.1513515, 1, 1, 1, 1, 1,
0.4476879, 0.4183414, -0.3307347, 1, 1, 1, 1, 1,
0.44982, -1.574657, 3.765169, 1, 1, 1, 1, 1,
0.4551838, -2.140232, 2.628727, 1, 1, 1, 1, 1,
0.4600501, -0.2933384, 1.097276, 1, 1, 1, 1, 1,
0.4638007, -0.1898675, 2.561855, 1, 1, 1, 1, 1,
0.4638878, 2.849104, -0.0397641, 0, 0, 1, 1, 1,
0.4664049, 0.09800734, 1.761899, 1, 0, 0, 1, 1,
0.4666966, -0.479807, 3.76907, 1, 0, 0, 1, 1,
0.478491, -0.2130706, -0.08181279, 1, 0, 0, 1, 1,
0.4829053, 0.07082828, -0.5568066, 1, 0, 0, 1, 1,
0.4886815, 1.415391, 1.525934, 1, 0, 0, 1, 1,
0.495357, 0.2200727, 1.378847, 0, 0, 0, 1, 1,
0.4955771, 1.088508, 1.415309, 0, 0, 0, 1, 1,
0.4959693, -1.385885, 3.371425, 0, 0, 0, 1, 1,
0.4982459, 0.5300295, -0.2328309, 0, 0, 0, 1, 1,
0.4997633, -2.799338, 3.772926, 0, 0, 0, 1, 1,
0.4999991, -0.06037417, 1.328753, 0, 0, 0, 1, 1,
0.5053335, -0.4910555, 2.562918, 0, 0, 0, 1, 1,
0.5092618, 0.4298724, 0.799993, 1, 1, 1, 1, 1,
0.5114807, 0.003600732, 1.340639, 1, 1, 1, 1, 1,
0.5126196, 0.01905947, 1.831145, 1, 1, 1, 1, 1,
0.5132634, 0.5915013, 0.2138516, 1, 1, 1, 1, 1,
0.51639, -0.7592086, 3.919322, 1, 1, 1, 1, 1,
0.5173758, 0.1802632, 1.059915, 1, 1, 1, 1, 1,
0.5219091, 1.003549, 0.8657764, 1, 1, 1, 1, 1,
0.5238354, 0.379701, 0.7676712, 1, 1, 1, 1, 1,
0.5305651, 0.05193779, 1.447132, 1, 1, 1, 1, 1,
0.5340112, 2.054962, -0.4885858, 1, 1, 1, 1, 1,
0.5389987, 0.7094442, -0.1603115, 1, 1, 1, 1, 1,
0.5409865, 0.1284865, -0.4018905, 1, 1, 1, 1, 1,
0.5438514, 1.137573, -0.9598465, 1, 1, 1, 1, 1,
0.5460044, -0.1188594, 0.7724708, 1, 1, 1, 1, 1,
0.5512745, 1.948448, 0.06854121, 1, 1, 1, 1, 1,
0.55243, -0.6525334, 0.7034066, 0, 0, 1, 1, 1,
0.5531486, 0.1688775, 0.5450366, 1, 0, 0, 1, 1,
0.5543801, 1.107675, -1.965847, 1, 0, 0, 1, 1,
0.556409, 0.2732772, -0.1679267, 1, 0, 0, 1, 1,
0.5588573, 1.514213, -0.6812048, 1, 0, 0, 1, 1,
0.5596245, -1.141604, 2.293339, 1, 0, 0, 1, 1,
0.5624904, -0.602914, 1.291076, 0, 0, 0, 1, 1,
0.5645334, 1.572491, -1.217961, 0, 0, 0, 1, 1,
0.5676827, -1.517547, 1.136481, 0, 0, 0, 1, 1,
0.5763639, 0.5358995, 0.437985, 0, 0, 0, 1, 1,
0.577774, 0.6782423, 0.6171693, 0, 0, 0, 1, 1,
0.5788447, 0.4056741, 2.295515, 0, 0, 0, 1, 1,
0.5824086, 0.2531275, 1.753831, 0, 0, 0, 1, 1,
0.5826394, -0.958824, 3.643063, 1, 1, 1, 1, 1,
0.5918847, 0.8362552, -0.1968371, 1, 1, 1, 1, 1,
0.5945889, -0.4017088, 1.85113, 1, 1, 1, 1, 1,
0.5948778, -0.2289854, 2.785859, 1, 1, 1, 1, 1,
0.5957994, 0.2732674, 0.7976322, 1, 1, 1, 1, 1,
0.5961168, -1.1446, 3.870233, 1, 1, 1, 1, 1,
0.5964482, -1.368464, 0.8762236, 1, 1, 1, 1, 1,
0.5967972, 0.851351, -0.6215537, 1, 1, 1, 1, 1,
0.6124102, -1.411721, 2.376465, 1, 1, 1, 1, 1,
0.6201591, -1.846104, 3.495382, 1, 1, 1, 1, 1,
0.635325, -0.1878877, 1.127761, 1, 1, 1, 1, 1,
0.635839, -0.7564178, 2.944377, 1, 1, 1, 1, 1,
0.6382105, -0.06483735, -0.08378916, 1, 1, 1, 1, 1,
0.6390543, -0.3092096, 0.8574712, 1, 1, 1, 1, 1,
0.6411161, 0.7843892, -1.530047, 1, 1, 1, 1, 1,
0.6462491, 0.3166722, 0.3608165, 0, 0, 1, 1, 1,
0.6466383, 0.03349964, 3.279785, 1, 0, 0, 1, 1,
0.6468241, -0.611263, 2.749448, 1, 0, 0, 1, 1,
0.6504414, -2.045695, 3.502689, 1, 0, 0, 1, 1,
0.6549846, -0.3470477, 2.843211, 1, 0, 0, 1, 1,
0.6653324, -0.04881334, 2.498549, 1, 0, 0, 1, 1,
0.6656345, 0.1273742, 1.528677, 0, 0, 0, 1, 1,
0.6688643, 0.5102615, 0.8094724, 0, 0, 0, 1, 1,
0.6784531, 0.6079547, 0.1820996, 0, 0, 0, 1, 1,
0.6790331, 0.6675623, 1.073726, 0, 0, 0, 1, 1,
0.6864927, -0.3225004, 1.532459, 0, 0, 0, 1, 1,
0.6889022, -0.8402816, 4.001979, 0, 0, 0, 1, 1,
0.6900977, 0.1733461, 2.889161, 0, 0, 0, 1, 1,
0.6920606, 0.6071285, 0.4772453, 1, 1, 1, 1, 1,
0.6934336, 0.6464128, 2.594521, 1, 1, 1, 1, 1,
0.6954729, 0.7295299, 1.25433, 1, 1, 1, 1, 1,
0.6977648, 0.927914, 0.3659076, 1, 1, 1, 1, 1,
0.6984777, -0.7055702, 5.078851, 1, 1, 1, 1, 1,
0.708773, -0.410121, 2.201099, 1, 1, 1, 1, 1,
0.7122984, -0.2439989, 0.4571984, 1, 1, 1, 1, 1,
0.713115, 2.665541, -0.415142, 1, 1, 1, 1, 1,
0.7157329, 0.6056752, 0.5654485, 1, 1, 1, 1, 1,
0.7160973, -1.475884, 3.692225, 1, 1, 1, 1, 1,
0.7169881, -0.2241203, 1.600697, 1, 1, 1, 1, 1,
0.7226095, 1.673831, 0.383225, 1, 1, 1, 1, 1,
0.7292093, -0.2018753, 2.098126, 1, 1, 1, 1, 1,
0.7395512, 0.8885702, 1.260186, 1, 1, 1, 1, 1,
0.7401455, -0.1716562, 1.950565, 1, 1, 1, 1, 1,
0.7452101, -1.945744, 3.31768, 0, 0, 1, 1, 1,
0.7481685, 1.40972, 0.918269, 1, 0, 0, 1, 1,
0.749896, 1.076341, -1.197383, 1, 0, 0, 1, 1,
0.7511108, -0.6838915, 3.839339, 1, 0, 0, 1, 1,
0.7520094, 0.656839, 1.212519, 1, 0, 0, 1, 1,
0.75367, 0.5045274, 1.408677, 1, 0, 0, 1, 1,
0.7549292, -1.074468, 2.808686, 0, 0, 0, 1, 1,
0.7550236, 0.903842, 1.572935, 0, 0, 0, 1, 1,
0.7675165, 0.751474, -0.316669, 0, 0, 0, 1, 1,
0.767854, -0.5317768, 1.54985, 0, 0, 0, 1, 1,
0.7749982, 0.9280975, -2.453284, 0, 0, 0, 1, 1,
0.7784348, -3.589315, 2.670935, 0, 0, 0, 1, 1,
0.7807124, 1.007033, 0.104029, 0, 0, 0, 1, 1,
0.7839557, 0.7870504, 0.8605127, 1, 1, 1, 1, 1,
0.7842316, 0.6865225, 1.410004, 1, 1, 1, 1, 1,
0.7869589, 0.701232, 1.433044, 1, 1, 1, 1, 1,
0.7871534, -0.1572136, 2.810445, 1, 1, 1, 1, 1,
0.7958602, -0.3848461, 1.722384, 1, 1, 1, 1, 1,
0.7961009, 0.204576, 1.341993, 1, 1, 1, 1, 1,
0.796901, -0.2450957, 2.947559, 1, 1, 1, 1, 1,
0.7992222, -1.107235, 2.460626, 1, 1, 1, 1, 1,
0.8114945, -0.960791, 2.876685, 1, 1, 1, 1, 1,
0.8175793, -0.1492397, 0.8196671, 1, 1, 1, 1, 1,
0.8186255, 0.4326093, 0.1044617, 1, 1, 1, 1, 1,
0.8315156, 0.184642, 1.165316, 1, 1, 1, 1, 1,
0.8338935, -1.37313, 3.72494, 1, 1, 1, 1, 1,
0.8369084, 0.7369789, 0.1726255, 1, 1, 1, 1, 1,
0.8371906, -0.5335227, 1.697141, 1, 1, 1, 1, 1,
0.8380463, 0.1338409, 1.320233, 0, 0, 1, 1, 1,
0.8387522, -0.05237208, 1.98824, 1, 0, 0, 1, 1,
0.8408376, -1.313266, 3.23438, 1, 0, 0, 1, 1,
0.8419529, 0.7185879, 1.288622, 1, 0, 0, 1, 1,
0.8467593, -0.481112, 2.486969, 1, 0, 0, 1, 1,
0.8498135, 1.076727, 2.050741, 1, 0, 0, 1, 1,
0.852682, -0.5307142, 1.123392, 0, 0, 0, 1, 1,
0.8606977, 1.002416, 1.618631, 0, 0, 0, 1, 1,
0.8614265, -0.8499411, 2.679085, 0, 0, 0, 1, 1,
0.8670251, 0.5881295, 1.038669, 0, 0, 0, 1, 1,
0.8690661, -0.02525416, 2.857372, 0, 0, 0, 1, 1,
0.8701081, -0.2975424, 2.127997, 0, 0, 0, 1, 1,
0.8742676, 0.1702209, 2.011005, 0, 0, 0, 1, 1,
0.8843391, -0.8254029, 2.514699, 1, 1, 1, 1, 1,
0.8880625, 0.7249017, 2.221619, 1, 1, 1, 1, 1,
0.8895106, -0.5399566, 2.589796, 1, 1, 1, 1, 1,
0.8916046, 0.6783088, 0.7252661, 1, 1, 1, 1, 1,
0.8927104, 0.7164762, 1.226241, 1, 1, 1, 1, 1,
0.9061304, -0.5762388, 2.761285, 1, 1, 1, 1, 1,
0.9120518, -0.3227962, 0.7350853, 1, 1, 1, 1, 1,
0.9146748, -0.5564349, 1.719328, 1, 1, 1, 1, 1,
0.9149646, 0.6513532, 0.1463748, 1, 1, 1, 1, 1,
0.917736, -0.5042042, 2.333903, 1, 1, 1, 1, 1,
0.9362409, -0.6849709, 1.43055, 1, 1, 1, 1, 1,
0.9365283, -1.244802, 2.156396, 1, 1, 1, 1, 1,
0.9379297, 0.3118517, 0.739009, 1, 1, 1, 1, 1,
0.9394073, 0.6727113, 2.656498, 1, 1, 1, 1, 1,
0.9426524, -0.5369064, 2.642347, 1, 1, 1, 1, 1,
0.9431691, -0.1188645, 2.165169, 0, 0, 1, 1, 1,
0.9516541, 0.6088176, 0.1186769, 1, 0, 0, 1, 1,
0.9661142, -0.5491818, 2.037096, 1, 0, 0, 1, 1,
0.9875231, -0.3282439, 2.720688, 1, 0, 0, 1, 1,
0.9941722, -0.1454718, 1.366732, 1, 0, 0, 1, 1,
0.9950876, -0.04641778, 2.423101, 1, 0, 0, 1, 1,
0.9960029, -1.671696, 2.143292, 0, 0, 0, 1, 1,
1.006769, 0.3517576, 2.29516, 0, 0, 0, 1, 1,
1.008859, -0.7133822, 0.8521883, 0, 0, 0, 1, 1,
1.015772, -0.5427845, 2.422087, 0, 0, 0, 1, 1,
1.029983, 0.5492563, 1.083563, 0, 0, 0, 1, 1,
1.041006, 0.1683506, 1.670144, 0, 0, 0, 1, 1,
1.041695, 1.980528, -1.943347, 0, 0, 0, 1, 1,
1.048455, 0.7106437, 0.5640298, 1, 1, 1, 1, 1,
1.050485, -0.9697122, 2.209304, 1, 1, 1, 1, 1,
1.050617, -0.5133647, 0.4091614, 1, 1, 1, 1, 1,
1.053622, -0.1096537, 1.375976, 1, 1, 1, 1, 1,
1.05406, -0.4567378, 0.2755491, 1, 1, 1, 1, 1,
1.054093, 0.8940018, 1.189248, 1, 1, 1, 1, 1,
1.057709, -0.8142272, 1.767212, 1, 1, 1, 1, 1,
1.061592, -1.436062, 2.053044, 1, 1, 1, 1, 1,
1.061874, -0.1314017, 2.207345, 1, 1, 1, 1, 1,
1.078245, -0.9908533, 2.528185, 1, 1, 1, 1, 1,
1.078838, -0.6515656, 4.287903, 1, 1, 1, 1, 1,
1.080061, 0.2159755, -0.7900623, 1, 1, 1, 1, 1,
1.081329, 1.17394, 1.45791, 1, 1, 1, 1, 1,
1.082593, -0.06774031, 1.020781, 1, 1, 1, 1, 1,
1.092455, -0.7542425, 2.522129, 1, 1, 1, 1, 1,
1.095374, -0.4997579, 2.217328, 0, 0, 1, 1, 1,
1.109279, -0.4799924, 2.521565, 1, 0, 0, 1, 1,
1.112641, -0.5272501, 1.346831, 1, 0, 0, 1, 1,
1.114288, 0.7672724, 1.162532, 1, 0, 0, 1, 1,
1.115074, -1.44182, 2.303979, 1, 0, 0, 1, 1,
1.125101, 0.5082304, 0.3231898, 1, 0, 0, 1, 1,
1.125273, -0.4918743, 1.658251, 0, 0, 0, 1, 1,
1.127997, 1.408676, 1.178064, 0, 0, 0, 1, 1,
1.132824, 1.963009, -2.632371, 0, 0, 0, 1, 1,
1.135618, 1.804082, 0.866373, 0, 0, 0, 1, 1,
1.144543, -0.8381804, 3.111171, 0, 0, 0, 1, 1,
1.149107, -1.031176, 1.243088, 0, 0, 0, 1, 1,
1.157989, 1.992754, 1.210173, 0, 0, 0, 1, 1,
1.185265, -1.190957, 3.035481, 1, 1, 1, 1, 1,
1.188407, -0.705972, 1.29514, 1, 1, 1, 1, 1,
1.194143, 0.1928258, 0.7217945, 1, 1, 1, 1, 1,
1.199811, -0.4453425, 2.204842, 1, 1, 1, 1, 1,
1.20707, -1.385606, 2.099179, 1, 1, 1, 1, 1,
1.207685, -1.013737, 4.203324, 1, 1, 1, 1, 1,
1.208483, -0.3768235, 0.1679871, 1, 1, 1, 1, 1,
1.214646, -0.6552698, 2.083228, 1, 1, 1, 1, 1,
1.229665, 0.3127635, 3.108139, 1, 1, 1, 1, 1,
1.231894, 0.4694072, 0.7015299, 1, 1, 1, 1, 1,
1.233559, -0.346944, 0.4764752, 1, 1, 1, 1, 1,
1.235356, 0.4588152, 1.24245, 1, 1, 1, 1, 1,
1.255866, -1.021309, 2.436114, 1, 1, 1, 1, 1,
1.257408, 0.3424748, 1.184387, 1, 1, 1, 1, 1,
1.258134, 0.3552774, 2.243249, 1, 1, 1, 1, 1,
1.260061, 0.02906218, 0.6578923, 0, 0, 1, 1, 1,
1.262093, -0.9949421, 1.32639, 1, 0, 0, 1, 1,
1.265723, 1.461365, -0.302011, 1, 0, 0, 1, 1,
1.272532, -0.2735785, 0.753249, 1, 0, 0, 1, 1,
1.280897, -0.008229021, 1.50868, 1, 0, 0, 1, 1,
1.281137, 0.6804014, 2.284766, 1, 0, 0, 1, 1,
1.283114, -1.059472, 2.672036, 0, 0, 0, 1, 1,
1.283864, -0.3613178, 3.182719, 0, 0, 0, 1, 1,
1.294679, -1.642293, 3.556434, 0, 0, 0, 1, 1,
1.308857, 2.421412, 0.3428921, 0, 0, 0, 1, 1,
1.315777, 1.164263, 1.077145, 0, 0, 0, 1, 1,
1.32092, -1.10399, 2.476845, 0, 0, 0, 1, 1,
1.32285, -0.0602559, 0.4689946, 0, 0, 0, 1, 1,
1.327068, 0.2418884, 1.193837, 1, 1, 1, 1, 1,
1.349868, 0.6506932, 0.8607492, 1, 1, 1, 1, 1,
1.351947, 0.5156507, 2.138062, 1, 1, 1, 1, 1,
1.355031, -0.5616065, 2.889215, 1, 1, 1, 1, 1,
1.367819, -0.3179869, 3.207846, 1, 1, 1, 1, 1,
1.380675, -0.8538097, 2.439538, 1, 1, 1, 1, 1,
1.382744, 0.4274535, 1.917758, 1, 1, 1, 1, 1,
1.39895, 1.299219, 2.273887, 1, 1, 1, 1, 1,
1.402533, 0.3172816, 1.783873, 1, 1, 1, 1, 1,
1.404885, -1.337421, 1.668754, 1, 1, 1, 1, 1,
1.40597, -2.506457, 1.816722, 1, 1, 1, 1, 1,
1.419994, 0.4579669, 2.597797, 1, 1, 1, 1, 1,
1.435145, 0.1894119, 1.036559, 1, 1, 1, 1, 1,
1.449651, 0.6246098, 1.711095, 1, 1, 1, 1, 1,
1.461015, -1.489796, 1.693411, 1, 1, 1, 1, 1,
1.464227, -0.7376773, 3.819046, 0, 0, 1, 1, 1,
1.475733, 1.176839, -0.3202972, 1, 0, 0, 1, 1,
1.481299, -0.8401454, 1.85101, 1, 0, 0, 1, 1,
1.485672, -1.812369, 3.315592, 1, 0, 0, 1, 1,
1.493585, 0.8202912, 0.3709947, 1, 0, 0, 1, 1,
1.502891, -0.03806891, 1.788403, 1, 0, 0, 1, 1,
1.505725, -1.384698, 2.604697, 0, 0, 0, 1, 1,
1.507175, 1.279206, 0.652894, 0, 0, 0, 1, 1,
1.51457, -0.6081246, 3.775171, 0, 0, 0, 1, 1,
1.519585, 1.801444, 0.006586785, 0, 0, 0, 1, 1,
1.5197, 0.2438852, -1.068592, 0, 0, 0, 1, 1,
1.523175, -0.1999798, 1.188641, 0, 0, 0, 1, 1,
1.528508, 0.2268354, 2.24089, 0, 0, 0, 1, 1,
1.536095, -0.3673589, 1.660924, 1, 1, 1, 1, 1,
1.553568, 1.281021, 2.306849, 1, 1, 1, 1, 1,
1.559898, 0.1593398, 1.174283, 1, 1, 1, 1, 1,
1.573572, 2.61218, 1.38493, 1, 1, 1, 1, 1,
1.575497, 1.315926, 1.751852, 1, 1, 1, 1, 1,
1.605314, 0.6934798, -0.3804618, 1, 1, 1, 1, 1,
1.614569, -0.6045706, 1.561962, 1, 1, 1, 1, 1,
1.61637, 0.6709367, 0.6596256, 1, 1, 1, 1, 1,
1.618118, -1.161681, 2.938627, 1, 1, 1, 1, 1,
1.628947, 0.09683037, 0.5734414, 1, 1, 1, 1, 1,
1.635114, 1.861263, -1.382413, 1, 1, 1, 1, 1,
1.638968, 0.4028245, 1.420239, 1, 1, 1, 1, 1,
1.644007, -1.118684, 1.470477, 1, 1, 1, 1, 1,
1.664865, -1.581065, 1.670874, 1, 1, 1, 1, 1,
1.67229, -0.1915696, 0.8439954, 1, 1, 1, 1, 1,
1.683229, -0.7836406, 2.455033, 0, 0, 1, 1, 1,
1.702731, 0.1788259, 0.01249161, 1, 0, 0, 1, 1,
1.704992, -0.1395637, 2.078402, 1, 0, 0, 1, 1,
1.714644, 0.1918794, 2.570807, 1, 0, 0, 1, 1,
1.719313, 0.3355141, 3.826497, 1, 0, 0, 1, 1,
1.730532, -0.2532504, 0.6526496, 1, 0, 0, 1, 1,
1.731718, -1.168118, 1.278996, 0, 0, 0, 1, 1,
1.756785, -0.513502, 2.972858, 0, 0, 0, 1, 1,
1.777583, 0.4066338, 1.725199, 0, 0, 0, 1, 1,
1.816292, -0.4308451, 1.461883, 0, 0, 0, 1, 1,
1.818876, -0.1281411, 1.650814, 0, 0, 0, 1, 1,
1.837385, -0.4278738, 2.691007, 0, 0, 0, 1, 1,
1.850118, 1.418223, 1.373181, 0, 0, 0, 1, 1,
1.858164, 1.411441, 0.7589703, 1, 1, 1, 1, 1,
1.864963, -0.4686255, 1.992253, 1, 1, 1, 1, 1,
1.869364, -1.342149, 2.302578, 1, 1, 1, 1, 1,
1.892781, 0.9166946, 1.827197, 1, 1, 1, 1, 1,
1.89607, 0.6646075, 1.438488, 1, 1, 1, 1, 1,
1.910282, 0.9868131, 0.8769855, 1, 1, 1, 1, 1,
1.949217, 0.6678839, 0.5287969, 1, 1, 1, 1, 1,
1.96995, 1.315605, -0.2888967, 1, 1, 1, 1, 1,
2.029557, 1.041723, 1.612061, 1, 1, 1, 1, 1,
2.097392, 1.109895, 1.149771, 1, 1, 1, 1, 1,
2.104864, 0.93656, -0.7781906, 1, 1, 1, 1, 1,
2.110616, -0.9738057, 2.329624, 1, 1, 1, 1, 1,
2.111759, 0.02258947, 1.088897, 1, 1, 1, 1, 1,
2.113857, -1.864714, 1.515144, 1, 1, 1, 1, 1,
2.174791, 0.2675974, 1.424791, 1, 1, 1, 1, 1,
2.179846, -0.5202038, 1.716537, 0, 0, 1, 1, 1,
2.19697, 0.47202, 0.9742392, 1, 0, 0, 1, 1,
2.20853, -0.2658539, 0.7758084, 1, 0, 0, 1, 1,
2.212718, -2.661744, 2.24175, 1, 0, 0, 1, 1,
2.243692, -2.602824, 1.922199, 1, 0, 0, 1, 1,
2.244992, -0.3416212, 2.064866, 1, 0, 0, 1, 1,
2.269427, 0.4893925, 1.120161, 0, 0, 0, 1, 1,
2.302266, 0.7078657, -0.37644, 0, 0, 0, 1, 1,
2.315568, -1.073389, 3.297074, 0, 0, 0, 1, 1,
2.319138, -0.7639312, -0.4611035, 0, 0, 0, 1, 1,
2.35816, 0.02946667, 2.874842, 0, 0, 0, 1, 1,
2.373077, 0.9603188, 0.004711296, 0, 0, 0, 1, 1,
2.381073, 0.09742258, 0.9768857, 0, 0, 0, 1, 1,
2.384683, 1.439131, 0.9787576, 1, 1, 1, 1, 1,
2.411202, 1.060847, -0.5017306, 1, 1, 1, 1, 1,
2.484023, 0.09590097, 2.41545, 1, 1, 1, 1, 1,
2.582287, 0.6782084, -1.102776, 1, 1, 1, 1, 1,
2.614518, -1.670794, 3.86976, 1, 1, 1, 1, 1,
2.870446, 0.4308869, 1.577613, 1, 1, 1, 1, 1,
2.971246, -0.6911994, 0.3694254, 1, 1, 1, 1, 1
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
var radius = 9.189593;
var distance = 32.27806;
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
mvMatrix.translate( -0.09913599, 0.284368, -0.05668831 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.27806);
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