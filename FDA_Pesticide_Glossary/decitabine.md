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
-2.800858, -0.9330752, -1.565071, 1, 0, 0, 1,
-2.766104, 0.8216126, -1.730028, 1, 0.007843138, 0, 1,
-2.747107, -1.43616, -2.180113, 1, 0.01176471, 0, 1,
-2.591513, 1.978466, -1.271604, 1, 0.01960784, 0, 1,
-2.452007, -0.3120811, -1.850357, 1, 0.02352941, 0, 1,
-2.292648, 0.13693, -0.8720836, 1, 0.03137255, 0, 1,
-2.27089, -0.5951074, -1.410072, 1, 0.03529412, 0, 1,
-2.251464, 0.1337768, -0.7401988, 1, 0.04313726, 0, 1,
-2.15121, 1.151744, 0.3949374, 1, 0.04705882, 0, 1,
-2.134824, 0.0635619, -0.2406156, 1, 0.05490196, 0, 1,
-2.09857, -1.701017, -1.336482, 1, 0.05882353, 0, 1,
-2.078394, -1.13969, -0.3277282, 1, 0.06666667, 0, 1,
-2.06707, 0.4725888, -2.018712, 1, 0.07058824, 0, 1,
-2.036465, -0.2412402, -2.797295, 1, 0.07843138, 0, 1,
-2.027798, 0.6275753, -2.600603, 1, 0.08235294, 0, 1,
-2.022858, 1.298978, -1.233731, 1, 0.09019608, 0, 1,
-1.99154, -0.1643313, 0.2278263, 1, 0.09411765, 0, 1,
-1.981789, -1.083887, -2.774611, 1, 0.1019608, 0, 1,
-1.97712, 0.8137083, -1.27758, 1, 0.1098039, 0, 1,
-1.944127, 0.7100065, -0.5623134, 1, 0.1137255, 0, 1,
-1.943427, 0.5101027, -1.278453, 1, 0.1215686, 0, 1,
-1.942306, -0.2715244, -1.436751, 1, 0.1254902, 0, 1,
-1.918075, -0.7965662, -3.003765, 1, 0.1333333, 0, 1,
-1.911365, 0.3306274, -2.28024, 1, 0.1372549, 0, 1,
-1.862068, 0.05615998, -2.284699, 1, 0.145098, 0, 1,
-1.790053, -0.6849628, -2.542096, 1, 0.1490196, 0, 1,
-1.790033, -2.316329, -1.234729, 1, 0.1568628, 0, 1,
-1.758847, -0.7267905, -2.902673, 1, 0.1607843, 0, 1,
-1.725407, 0.09076624, -2.723335, 1, 0.1686275, 0, 1,
-1.719154, -2.31024, -3.192415, 1, 0.172549, 0, 1,
-1.709615, 1.933736, -1.624446, 1, 0.1803922, 0, 1,
-1.677712, -0.07212397, -2.301046, 1, 0.1843137, 0, 1,
-1.667395, 0.9058241, -1.077646, 1, 0.1921569, 0, 1,
-1.650711, 0.8858949, -0.9735235, 1, 0.1960784, 0, 1,
-1.649729, 0.2813765, -0.6166179, 1, 0.2039216, 0, 1,
-1.625441, 0.206056, -2.508381, 1, 0.2117647, 0, 1,
-1.614191, -1.57571, -1.371024, 1, 0.2156863, 0, 1,
-1.610253, -0.6256553, -4.097007, 1, 0.2235294, 0, 1,
-1.609108, -0.05202604, -0.920717, 1, 0.227451, 0, 1,
-1.607322, 0.8153519, -0.8823702, 1, 0.2352941, 0, 1,
-1.58824, 0.8032522, -0.3608624, 1, 0.2392157, 0, 1,
-1.573708, -0.4389139, -2.812003, 1, 0.2470588, 0, 1,
-1.570615, -0.2403057, -1.55728, 1, 0.2509804, 0, 1,
-1.56502, 1.39977, -0.07507215, 1, 0.2588235, 0, 1,
-1.56432, -0.9396288, -2.444973, 1, 0.2627451, 0, 1,
-1.55757, 0.692615, -0.8955719, 1, 0.2705882, 0, 1,
-1.548584, 1.199598, -2.650231, 1, 0.2745098, 0, 1,
-1.545414, 1.117778, -1.368303, 1, 0.282353, 0, 1,
-1.540868, -0.2570599, -1.13223, 1, 0.2862745, 0, 1,
-1.535899, 1.796402, 0.03510837, 1, 0.2941177, 0, 1,
-1.520289, -1.038052, -0.1190663, 1, 0.3019608, 0, 1,
-1.519557, -0.4094567, -0.532433, 1, 0.3058824, 0, 1,
-1.518121, -1.111597, -2.715204, 1, 0.3137255, 0, 1,
-1.502403, 2.61006, -0.5009469, 1, 0.3176471, 0, 1,
-1.499365, -0.4974848, -3.184254, 1, 0.3254902, 0, 1,
-1.493033, 0.321743, -1.417579, 1, 0.3294118, 0, 1,
-1.492718, 0.355408, -1.225142, 1, 0.3372549, 0, 1,
-1.471094, -1.337357, -3.514654, 1, 0.3411765, 0, 1,
-1.468212, -0.2391961, -1.537762, 1, 0.3490196, 0, 1,
-1.463317, 0.6907728, -1.276374, 1, 0.3529412, 0, 1,
-1.434806, 0.01386256, -0.7085872, 1, 0.3607843, 0, 1,
-1.430495, 0.1538523, -0.7364704, 1, 0.3647059, 0, 1,
-1.427938, -2.171619, -3.984701, 1, 0.372549, 0, 1,
-1.401492, 1.662459, -1.773374, 1, 0.3764706, 0, 1,
-1.392746, 1.150219, -1.505838, 1, 0.3843137, 0, 1,
-1.371333, -0.2837474, -1.275007, 1, 0.3882353, 0, 1,
-1.364679, -0.05222467, -3.41437, 1, 0.3960784, 0, 1,
-1.351298, -1.121587, -3.560401, 1, 0.4039216, 0, 1,
-1.35126, -0.4288264, -2.057769, 1, 0.4078431, 0, 1,
-1.336383, 0.673026, -1.004614, 1, 0.4156863, 0, 1,
-1.32268, 0.1662435, -0.8378299, 1, 0.4196078, 0, 1,
-1.318463, -0.4289199, -2.56716, 1, 0.427451, 0, 1,
-1.317009, -0.4668176, -1.737462, 1, 0.4313726, 0, 1,
-1.315255, 1.656994, 1.10505, 1, 0.4392157, 0, 1,
-1.304429, 0.928961, -1.076842, 1, 0.4431373, 0, 1,
-1.301772, -0.9025881, -3.746409, 1, 0.4509804, 0, 1,
-1.300478, -1.581204, -1.740383, 1, 0.454902, 0, 1,
-1.29989, 0.3699621, -0.6138676, 1, 0.4627451, 0, 1,
-1.293831, 0.8049358, -1.576665, 1, 0.4666667, 0, 1,
-1.277788, 1.7786, -0.440652, 1, 0.4745098, 0, 1,
-1.275948, -0.1870918, -3.465357, 1, 0.4784314, 0, 1,
-1.27521, 0.2973459, 0.203062, 1, 0.4862745, 0, 1,
-1.250485, -1.957707, -3.82752, 1, 0.4901961, 0, 1,
-1.248175, -2.378543, -2.536804, 1, 0.4980392, 0, 1,
-1.242887, 1.715485, -1.641026, 1, 0.5058824, 0, 1,
-1.240209, 0.2277965, -1.439883, 1, 0.509804, 0, 1,
-1.238258, -1.065145, -1.793877, 1, 0.5176471, 0, 1,
-1.236532, 0.5470007, -1.715717, 1, 0.5215687, 0, 1,
-1.2262, -1.356464, -1.487438, 1, 0.5294118, 0, 1,
-1.223839, 2.033429, -1.427906, 1, 0.5333334, 0, 1,
-1.220589, -0.01883332, -1.917395, 1, 0.5411765, 0, 1,
-1.219322, 0.192939, -0.8154694, 1, 0.5450981, 0, 1,
-1.212814, -1.598909, -0.733824, 1, 0.5529412, 0, 1,
-1.211856, -0.3915293, -2.258241, 1, 0.5568628, 0, 1,
-1.211291, -1.482095, -1.954033, 1, 0.5647059, 0, 1,
-1.209364, 0.1922572, -2.563082, 1, 0.5686275, 0, 1,
-1.203667, -0.9683062, -1.188736, 1, 0.5764706, 0, 1,
-1.199155, 0.5690952, 0.03058824, 1, 0.5803922, 0, 1,
-1.195237, -0.6020018, -4.285728, 1, 0.5882353, 0, 1,
-1.194675, 1.770387, -1.965983, 1, 0.5921569, 0, 1,
-1.191741, -1.402533, -2.735097, 1, 0.6, 0, 1,
-1.168854, -0.3493611, -1.318236, 1, 0.6078432, 0, 1,
-1.166739, 1.042748, 0.2881646, 1, 0.6117647, 0, 1,
-1.164268, -1.211985, -3.666638, 1, 0.6196079, 0, 1,
-1.162578, 0.03840041, -1.746077, 1, 0.6235294, 0, 1,
-1.155742, -2.1804, -1.175074, 1, 0.6313726, 0, 1,
-1.1552, 1.454252, -0.6760426, 1, 0.6352941, 0, 1,
-1.141803, -0.6518175, -2.03415, 1, 0.6431373, 0, 1,
-1.140834, 0.2284932, -0.8932568, 1, 0.6470588, 0, 1,
-1.134493, 0.08473618, -2.075365, 1, 0.654902, 0, 1,
-1.133244, -0.5734895, -4.577924, 1, 0.6588235, 0, 1,
-1.13211, -1.439004, -3.838879, 1, 0.6666667, 0, 1,
-1.126505, 0.4924908, -2.981209, 1, 0.6705883, 0, 1,
-1.122018, -0.3154103, -2.610353, 1, 0.6784314, 0, 1,
-1.110186, 0.7186128, -1.407671, 1, 0.682353, 0, 1,
-1.109381, -0.5265415, -0.2132582, 1, 0.6901961, 0, 1,
-1.101482, 0.9617732, -0.8281292, 1, 0.6941177, 0, 1,
-1.099158, 1.159135, -0.8664207, 1, 0.7019608, 0, 1,
-1.097899, 0.1616634, -1.340408, 1, 0.7098039, 0, 1,
-1.097555, 0.361709, -1.554144, 1, 0.7137255, 0, 1,
-1.097288, -1.922419, -2.752864, 1, 0.7215686, 0, 1,
-1.092281, 0.6292258, -1.467921, 1, 0.7254902, 0, 1,
-1.091989, -0.3047416, -2.057347, 1, 0.7333333, 0, 1,
-1.088317, -0.2970247, -1.378271, 1, 0.7372549, 0, 1,
-1.086189, -0.9567667, -2.437329, 1, 0.7450981, 0, 1,
-1.085524, -0.6920499, -2.890357, 1, 0.7490196, 0, 1,
-1.080481, 0.3606168, -2.490574, 1, 0.7568628, 0, 1,
-1.066863, -0.6674265, -2.030562, 1, 0.7607843, 0, 1,
-1.063258, -0.2452512, -1.194217, 1, 0.7686275, 0, 1,
-1.059303, -2.000735, -2.180813, 1, 0.772549, 0, 1,
-1.056568, -0.8050543, -3.213295, 1, 0.7803922, 0, 1,
-1.055768, 0.06421268, -0.8091127, 1, 0.7843137, 0, 1,
-1.053795, -0.5394489, -2.515476, 1, 0.7921569, 0, 1,
-1.047071, 1.156412, -0.753979, 1, 0.7960784, 0, 1,
-1.043757, -0.4318238, 0.2673042, 1, 0.8039216, 0, 1,
-1.039584, -0.04440463, -1.081465, 1, 0.8117647, 0, 1,
-1.038447, -0.4566153, 0.1804832, 1, 0.8156863, 0, 1,
-1.03788, 0.5142553, -1.535627, 1, 0.8235294, 0, 1,
-1.021317, 0.2332128, -2.016769, 1, 0.827451, 0, 1,
-1.019269, 0.8174388, -2.773512, 1, 0.8352941, 0, 1,
-1.018309, -0.7112257, -2.118765, 1, 0.8392157, 0, 1,
-1.017012, -0.04865953, -1.958084, 1, 0.8470588, 0, 1,
-1.01308, -0.0519072, -1.631627, 1, 0.8509804, 0, 1,
-1.012301, 1.071711, -1.181342, 1, 0.8588235, 0, 1,
-1.007426, 0.136084, -1.453601, 1, 0.8627451, 0, 1,
-1.001223, -2.134861, -1.743025, 1, 0.8705882, 0, 1,
-0.993513, -0.2608678, -1.22662, 1, 0.8745098, 0, 1,
-0.992713, -0.6928211, -2.163407, 1, 0.8823529, 0, 1,
-0.9918852, 0.2619631, -1.149896, 1, 0.8862745, 0, 1,
-0.991442, 0.2787617, -0.1008735, 1, 0.8941177, 0, 1,
-0.9883571, 1.033195, -1.064788, 1, 0.8980392, 0, 1,
-0.9858181, 1.036651, -1.493624, 1, 0.9058824, 0, 1,
-0.982473, -0.6053768, -4.133537, 1, 0.9137255, 0, 1,
-0.9815659, 1.023997, -1.215124, 1, 0.9176471, 0, 1,
-0.9797408, -1.225937, -3.293987, 1, 0.9254902, 0, 1,
-0.9788561, -0.2127531, -0.5032408, 1, 0.9294118, 0, 1,
-0.9698116, 0.4809839, 0.6065884, 1, 0.9372549, 0, 1,
-0.9580451, -0.8947969, -4.353513, 1, 0.9411765, 0, 1,
-0.9578308, -0.8244715, -3.377577, 1, 0.9490196, 0, 1,
-0.956847, -2.070435, -4.175018, 1, 0.9529412, 0, 1,
-0.9499023, -1.127148, -2.995435, 1, 0.9607843, 0, 1,
-0.9448097, 1.555979, 0.3234845, 1, 0.9647059, 0, 1,
-0.9406769, 1.637081, -0.4491371, 1, 0.972549, 0, 1,
-0.9378539, 0.7543011, -0.6988929, 1, 0.9764706, 0, 1,
-0.9373354, 0.1159186, -2.197364, 1, 0.9843137, 0, 1,
-0.9327479, -1.749494, -1.401981, 1, 0.9882353, 0, 1,
-0.9322637, -0.119763, -3.399576, 1, 0.9960784, 0, 1,
-0.93032, 0.5062746, -1.302032, 0.9960784, 1, 0, 1,
-0.9228343, 2.188648, 0.1256324, 0.9921569, 1, 0, 1,
-0.9126777, -0.4195102, -2.091584, 0.9843137, 1, 0, 1,
-0.9109588, 2.265538, -1.341121, 0.9803922, 1, 0, 1,
-0.9106979, 0.8765233, -1.013232, 0.972549, 1, 0, 1,
-0.9097077, 1.242688, 0.1113439, 0.9686275, 1, 0, 1,
-0.9030023, 0.5103619, -2.985332, 0.9607843, 1, 0, 1,
-0.8955963, 0.181414, -2.88775, 0.9568627, 1, 0, 1,
-0.8947616, 0.4325671, -0.8248507, 0.9490196, 1, 0, 1,
-0.8919097, -0.1849087, -3.421764, 0.945098, 1, 0, 1,
-0.889334, 0.7891426, -2.322676, 0.9372549, 1, 0, 1,
-0.8892327, -0.2406594, -1.784727, 0.9333333, 1, 0, 1,
-0.8889177, 0.6394104, -0.8284437, 0.9254902, 1, 0, 1,
-0.8783211, 1.469961, 0.9869348, 0.9215686, 1, 0, 1,
-0.8716937, 0.1165736, -1.823798, 0.9137255, 1, 0, 1,
-0.8656712, -1.244416, -2.043443, 0.9098039, 1, 0, 1,
-0.8629788, 0.6224239, 0.657852, 0.9019608, 1, 0, 1,
-0.8616305, -0.7728477, -0.9332179, 0.8941177, 1, 0, 1,
-0.8581856, -1.167924, -2.199372, 0.8901961, 1, 0, 1,
-0.8580707, 1.795031, -1.860769, 0.8823529, 1, 0, 1,
-0.8562985, -0.9371666, -0.8903149, 0.8784314, 1, 0, 1,
-0.8562109, 0.7469467, -0.313602, 0.8705882, 1, 0, 1,
-0.8556795, -0.05423967, -1.871475, 0.8666667, 1, 0, 1,
-0.8522217, 1.391268, -1.692595, 0.8588235, 1, 0, 1,
-0.8426509, -1.061839, -3.92222, 0.854902, 1, 0, 1,
-0.8412934, 0.145548, -1.270283, 0.8470588, 1, 0, 1,
-0.8379178, -0.3326248, -1.978394, 0.8431373, 1, 0, 1,
-0.8360522, 1.181643, 0.2788103, 0.8352941, 1, 0, 1,
-0.8335657, -0.1691265, -2.326276, 0.8313726, 1, 0, 1,
-0.8327822, -0.3228971, -2.109498, 0.8235294, 1, 0, 1,
-0.8327052, -0.3904737, -2.681918, 0.8196079, 1, 0, 1,
-0.8321676, 0.07221674, -1.015275, 0.8117647, 1, 0, 1,
-0.8316836, 0.1866259, -1.046316, 0.8078431, 1, 0, 1,
-0.8264237, -1.337136, -2.721178, 0.8, 1, 0, 1,
-0.8084131, -0.8804091, -4.756659, 0.7921569, 1, 0, 1,
-0.8074564, 0.2543001, -0.3338909, 0.7882353, 1, 0, 1,
-0.8069048, -0.02333305, -0.6816516, 0.7803922, 1, 0, 1,
-0.80626, 0.1465428, -2.413588, 0.7764706, 1, 0, 1,
-0.8013994, -0.2561217, -1.311074, 0.7686275, 1, 0, 1,
-0.7935554, -0.6218684, -2.790178, 0.7647059, 1, 0, 1,
-0.7829301, 0.1446698, -1.752636, 0.7568628, 1, 0, 1,
-0.7552742, -0.5625273, -1.816192, 0.7529412, 1, 0, 1,
-0.7541925, 1.206854, -0.3614258, 0.7450981, 1, 0, 1,
-0.750765, 0.6426802, -1.461982, 0.7411765, 1, 0, 1,
-0.7507212, 0.08243117, -3.083784, 0.7333333, 1, 0, 1,
-0.7422212, 0.1335855, -0.2231164, 0.7294118, 1, 0, 1,
-0.7409422, -2.109659, -1.654786, 0.7215686, 1, 0, 1,
-0.7397512, 0.1555007, -1.473242, 0.7176471, 1, 0, 1,
-0.7395896, -1.707308, -2.425607, 0.7098039, 1, 0, 1,
-0.7391972, -0.2353754, -2.694311, 0.7058824, 1, 0, 1,
-0.7382209, -0.5311579, -1.39187, 0.6980392, 1, 0, 1,
-0.7365601, 0.7675963, 0.1045908, 0.6901961, 1, 0, 1,
-0.7324668, 0.8061463, 0.8968648, 0.6862745, 1, 0, 1,
-0.730955, 0.7510628, -1.701077, 0.6784314, 1, 0, 1,
-0.7264839, -1.309892, -2.983579, 0.6745098, 1, 0, 1,
-0.7236562, 1.743923, -1.647128, 0.6666667, 1, 0, 1,
-0.7227584, -1.289233, -3.00191, 0.6627451, 1, 0, 1,
-0.7219124, -0.4530736, -1.196371, 0.654902, 1, 0, 1,
-0.715712, -0.1179578, -0.9535198, 0.6509804, 1, 0, 1,
-0.7136059, 1.042222, -0.04288768, 0.6431373, 1, 0, 1,
-0.7049477, 0.919434, -1.71057, 0.6392157, 1, 0, 1,
-0.7016457, 0.5140274, -1.69952, 0.6313726, 1, 0, 1,
-0.699479, -0.7776625, -2.401115, 0.627451, 1, 0, 1,
-0.6855862, 0.9428158, -1.547862, 0.6196079, 1, 0, 1,
-0.6847822, -0.3242766, -3.005184, 0.6156863, 1, 0, 1,
-0.6831313, 0.07254727, -0.1421941, 0.6078432, 1, 0, 1,
-0.6824821, -1.110203, -2.666193, 0.6039216, 1, 0, 1,
-0.6764395, 1.028759, -0.01689852, 0.5960785, 1, 0, 1,
-0.6759136, -0.2515334, -2.632047, 0.5882353, 1, 0, 1,
-0.6758692, 1.045698, -2.308058, 0.5843138, 1, 0, 1,
-0.6701465, -1.475551, -1.27091, 0.5764706, 1, 0, 1,
-0.6669156, 0.8736132, -0.2115855, 0.572549, 1, 0, 1,
-0.6561076, 2.188991, -0.6248796, 0.5647059, 1, 0, 1,
-0.6559622, -0.6852412, -3.14348, 0.5607843, 1, 0, 1,
-0.6516087, -0.4813948, -2.617494, 0.5529412, 1, 0, 1,
-0.6496869, -0.1483736, -1.755139, 0.5490196, 1, 0, 1,
-0.64813, -0.1412383, -1.536473, 0.5411765, 1, 0, 1,
-0.6480693, 0.2923622, -1.935505, 0.5372549, 1, 0, 1,
-0.6467162, -0.4581382, -2.29766, 0.5294118, 1, 0, 1,
-0.6397813, 0.9871932, -0.3650183, 0.5254902, 1, 0, 1,
-0.6389709, -0.06644561, -3.004049, 0.5176471, 1, 0, 1,
-0.6361874, 1.7361, 0.2896953, 0.5137255, 1, 0, 1,
-0.6285483, -0.369436, -1.963234, 0.5058824, 1, 0, 1,
-0.6269006, 0.9592188, -0.01468537, 0.5019608, 1, 0, 1,
-0.6261192, -1.487959, -2.780442, 0.4941176, 1, 0, 1,
-0.6245436, -0.02533287, -1.426889, 0.4862745, 1, 0, 1,
-0.6240811, -0.02097522, -1.031322, 0.4823529, 1, 0, 1,
-0.6237049, -1.790783, -1.524084, 0.4745098, 1, 0, 1,
-0.6200767, 0.6112193, -2.079066, 0.4705882, 1, 0, 1,
-0.6199877, -0.8733155, -2.747556, 0.4627451, 1, 0, 1,
-0.6193889, 0.8159506, -1.138011, 0.4588235, 1, 0, 1,
-0.6187128, -1.878246, -2.113732, 0.4509804, 1, 0, 1,
-0.6186656, -1.102315, -3.209316, 0.4470588, 1, 0, 1,
-0.6186061, -1.644273, -4.225497, 0.4392157, 1, 0, 1,
-0.6173568, -0.3725016, -2.767485, 0.4352941, 1, 0, 1,
-0.6122805, 0.7972215, -1.48751, 0.427451, 1, 0, 1,
-0.6107171, 1.499927, 0.139146, 0.4235294, 1, 0, 1,
-0.6099786, 0.372326, -0.1495653, 0.4156863, 1, 0, 1,
-0.6093138, -0.2072088, -3.216532, 0.4117647, 1, 0, 1,
-0.6091299, -0.1335058, -1.656253, 0.4039216, 1, 0, 1,
-0.6058019, 1.728961, -0.9036737, 0.3960784, 1, 0, 1,
-0.6053125, -0.4511331, -2.993327, 0.3921569, 1, 0, 1,
-0.6033773, -1.232424, -1.842783, 0.3843137, 1, 0, 1,
-0.6014209, 1.047065, 1.699803, 0.3803922, 1, 0, 1,
-0.5860389, -0.09109189, -2.241569, 0.372549, 1, 0, 1,
-0.5790776, 0.1350368, -1.007967, 0.3686275, 1, 0, 1,
-0.5773361, 0.1033536, -1.475764, 0.3607843, 1, 0, 1,
-0.5771996, -0.2926813, -3.724176, 0.3568628, 1, 0, 1,
-0.5710521, -0.3949468, -1.835032, 0.3490196, 1, 0, 1,
-0.5623202, -1.013437, 0.127118, 0.345098, 1, 0, 1,
-0.5605456, 0.169846, -1.086277, 0.3372549, 1, 0, 1,
-0.556866, 0.1380881, -1.292356, 0.3333333, 1, 0, 1,
-0.5513991, -0.3417187, -1.118575, 0.3254902, 1, 0, 1,
-0.5509242, -1.646518, -3.712943, 0.3215686, 1, 0, 1,
-0.5442447, -0.6671839, -4.930803, 0.3137255, 1, 0, 1,
-0.5412483, 0.8325052, 0.3668718, 0.3098039, 1, 0, 1,
-0.5395735, 1.200909, -1.708414, 0.3019608, 1, 0, 1,
-0.5390887, 0.7711574, -0.7882707, 0.2941177, 1, 0, 1,
-0.5330225, 0.344282, -0.8118722, 0.2901961, 1, 0, 1,
-0.5293469, 1.392542, 0.5322649, 0.282353, 1, 0, 1,
-0.528855, 0.9997513, -2.149071, 0.2784314, 1, 0, 1,
-0.5271767, -1.710479, -3.918343, 0.2705882, 1, 0, 1,
-0.5239688, 0.9683155, 0.2640868, 0.2666667, 1, 0, 1,
-0.5197213, -2.55237, -3.333253, 0.2588235, 1, 0, 1,
-0.5196244, 1.442506, 0.1615475, 0.254902, 1, 0, 1,
-0.5189093, -2.539499, -2.949901, 0.2470588, 1, 0, 1,
-0.5182893, -0.1735298, -1.834703, 0.2431373, 1, 0, 1,
-0.5159304, 0.5969316, -2.975799, 0.2352941, 1, 0, 1,
-0.5140014, 1.538403, 1.221179, 0.2313726, 1, 0, 1,
-0.5122896, -0.2896648, -1.517849, 0.2235294, 1, 0, 1,
-0.5122254, 1.18923, 0.5293097, 0.2196078, 1, 0, 1,
-0.5079442, 0.7476236, -0.7011871, 0.2117647, 1, 0, 1,
-0.5023998, -0.3152871, -0.9081714, 0.2078431, 1, 0, 1,
-0.5012718, 0.1110611, -2.980963, 0.2, 1, 0, 1,
-0.4998801, 0.4234851, -0.1806825, 0.1921569, 1, 0, 1,
-0.4978217, 0.9065157, -0.2045367, 0.1882353, 1, 0, 1,
-0.487245, 0.1832859, -1.080017, 0.1803922, 1, 0, 1,
-0.47706, 0.5368826, -0.8263877, 0.1764706, 1, 0, 1,
-0.4731159, -1.19368, -0.7558914, 0.1686275, 1, 0, 1,
-0.4710966, 0.06012776, -0.3765967, 0.1647059, 1, 0, 1,
-0.4698347, 0.5084557, -0.1375897, 0.1568628, 1, 0, 1,
-0.4614919, -0.8503788, -1.686601, 0.1529412, 1, 0, 1,
-0.4607636, -0.2650268, -2.662608, 0.145098, 1, 0, 1,
-0.4603402, -1.346534, -0.6367214, 0.1411765, 1, 0, 1,
-0.4554115, -0.8846557, -4.234, 0.1333333, 1, 0, 1,
-0.4540755, 1.808816, 0.8449744, 0.1294118, 1, 0, 1,
-0.4531052, 0.5287395, -0.4309314, 0.1215686, 1, 0, 1,
-0.4468134, 0.8445134, 0.1669547, 0.1176471, 1, 0, 1,
-0.4468084, -0.5757373, -2.447499, 0.1098039, 1, 0, 1,
-0.4435237, 1.874274, 1.206531, 0.1058824, 1, 0, 1,
-0.4412703, -0.03468454, -0.2980904, 0.09803922, 1, 0, 1,
-0.4305149, 0.933758, 0.9970682, 0.09019608, 1, 0, 1,
-0.4245111, 0.370922, -2.258164, 0.08627451, 1, 0, 1,
-0.4216646, -0.559366, -2.600823, 0.07843138, 1, 0, 1,
-0.4213149, 0.02276738, -2.343818, 0.07450981, 1, 0, 1,
-0.4154652, -1.478854, -2.167595, 0.06666667, 1, 0, 1,
-0.4153813, 1.162791, -0.2890296, 0.0627451, 1, 0, 1,
-0.4135304, -1.334364, -2.844546, 0.05490196, 1, 0, 1,
-0.4095925, -0.8623045, -1.712189, 0.05098039, 1, 0, 1,
-0.4051757, 1.148604, -1.037285, 0.04313726, 1, 0, 1,
-0.4049301, 0.4999835, -0.6324381, 0.03921569, 1, 0, 1,
-0.3999518, 0.03229397, -2.818301, 0.03137255, 1, 0, 1,
-0.399516, 1.198017, -2.698102, 0.02745098, 1, 0, 1,
-0.3943083, -0.9896531, -1.349121, 0.01960784, 1, 0, 1,
-0.3927796, -1.52256, -4.499403, 0.01568628, 1, 0, 1,
-0.3888047, -0.4873027, -3.037735, 0.007843138, 1, 0, 1,
-0.3870155, 0.924632, -1.360693, 0.003921569, 1, 0, 1,
-0.3843039, -0.9661356, -2.930072, 0, 1, 0.003921569, 1,
-0.3782941, -1.315652, -3.78769, 0, 1, 0.01176471, 1,
-0.3769855, -0.1495716, -1.426485, 0, 1, 0.01568628, 1,
-0.3756854, -0.5319607, -3.442274, 0, 1, 0.02352941, 1,
-0.3720541, -0.462912, -3.359258, 0, 1, 0.02745098, 1,
-0.3695348, -0.09795635, -2.003569, 0, 1, 0.03529412, 1,
-0.3681163, 0.6470437, -0.2610484, 0, 1, 0.03921569, 1,
-0.3671734, -1.989225, -3.522274, 0, 1, 0.04705882, 1,
-0.3668336, 0.6258286, -0.7923967, 0, 1, 0.05098039, 1,
-0.3629019, -1.241832, -2.494664, 0, 1, 0.05882353, 1,
-0.3588459, 0.4908763, 0.8248339, 0, 1, 0.0627451, 1,
-0.3556603, 0.6426155, -0.9402865, 0, 1, 0.07058824, 1,
-0.3477311, 0.1312499, -2.17165, 0, 1, 0.07450981, 1,
-0.3401465, -0.09774945, -0.7227776, 0, 1, 0.08235294, 1,
-0.3317574, 0.03795864, -1.778017, 0, 1, 0.08627451, 1,
-0.3299839, 1.295156, -0.4059993, 0, 1, 0.09411765, 1,
-0.3276306, -1.237432, -3.372828, 0, 1, 0.1019608, 1,
-0.3267384, -0.753756, -3.004243, 0, 1, 0.1058824, 1,
-0.3213975, 0.8581163, -1.66252, 0, 1, 0.1137255, 1,
-0.3179287, -1.276153, -3.357552, 0, 1, 0.1176471, 1,
-0.3178005, -0.8062029, -2.608728, 0, 1, 0.1254902, 1,
-0.3139519, -2.404521, -3.710471, 0, 1, 0.1294118, 1,
-0.3079709, -1.06888, -2.071602, 0, 1, 0.1372549, 1,
-0.3079683, -1.860273, -1.726334, 0, 1, 0.1411765, 1,
-0.3038273, -1.705287, -2.365304, 0, 1, 0.1490196, 1,
-0.3003404, -0.5449176, -2.398699, 0, 1, 0.1529412, 1,
-0.3001156, -0.4213956, -2.24245, 0, 1, 0.1607843, 1,
-0.3000495, 1.420693, -1.096268, 0, 1, 0.1647059, 1,
-0.2979853, 0.9060074, -1.667977, 0, 1, 0.172549, 1,
-0.2960922, 1.703074, -0.4206128, 0, 1, 0.1764706, 1,
-0.2850725, 0.3334245, -1.164009, 0, 1, 0.1843137, 1,
-0.2841565, -0.4876106, -2.365321, 0, 1, 0.1882353, 1,
-0.2834257, 1.282835, -0.3332827, 0, 1, 0.1960784, 1,
-0.2831489, -0.948795, -1.987019, 0, 1, 0.2039216, 1,
-0.2825099, 1.03551, -0.7045846, 0, 1, 0.2078431, 1,
-0.2790221, 0.3770751, -1.150872, 0, 1, 0.2156863, 1,
-0.2789763, -0.1166715, -2.998982, 0, 1, 0.2196078, 1,
-0.2730321, 0.03837745, -1.667944, 0, 1, 0.227451, 1,
-0.272127, 3.105555, 0.3172806, 0, 1, 0.2313726, 1,
-0.2718142, -2.234354, -2.398453, 0, 1, 0.2392157, 1,
-0.2645344, -0.4951973, -2.782324, 0, 1, 0.2431373, 1,
-0.2622613, 0.5002289, -0.4681923, 0, 1, 0.2509804, 1,
-0.2608593, -2.573579, -2.865599, 0, 1, 0.254902, 1,
-0.2597821, 0.7808133, -0.2829498, 0, 1, 0.2627451, 1,
-0.2591712, 1.990347, 0.3274271, 0, 1, 0.2666667, 1,
-0.2567206, -0.884554, -1.967134, 0, 1, 0.2745098, 1,
-0.2557685, 1.560732, -0.3052835, 0, 1, 0.2784314, 1,
-0.2446525, -0.4881324, -3.888612, 0, 1, 0.2862745, 1,
-0.2422576, 0.2016756, 0.0449058, 0, 1, 0.2901961, 1,
-0.2370094, 0.8107668, -0.3348055, 0, 1, 0.2980392, 1,
-0.234572, -0.03747613, -0.7770045, 0, 1, 0.3058824, 1,
-0.232105, 0.4065154, 0.1468316, 0, 1, 0.3098039, 1,
-0.2243169, 0.5831802, -0.6066306, 0, 1, 0.3176471, 1,
-0.2197842, -0.6957867, -2.890405, 0, 1, 0.3215686, 1,
-0.2163661, -0.3002532, 0.7862908, 0, 1, 0.3294118, 1,
-0.2161397, -0.1376321, -2.979503, 0, 1, 0.3333333, 1,
-0.2158955, 0.2818887, -1.543034, 0, 1, 0.3411765, 1,
-0.2155411, 0.09574945, -1.422264, 0, 1, 0.345098, 1,
-0.2114989, -1.972539, -2.502954, 0, 1, 0.3529412, 1,
-0.2098667, -0.7034832, -1.64223, 0, 1, 0.3568628, 1,
-0.2039094, -2.019881, -3.645504, 0, 1, 0.3647059, 1,
-0.2025691, 0.6916476, 0.007310113, 0, 1, 0.3686275, 1,
-0.2018219, 0.5009094, -0.8324571, 0, 1, 0.3764706, 1,
-0.2017615, 0.419609, 0.02224315, 0, 1, 0.3803922, 1,
-0.2016953, 0.441289, 0.7386789, 0, 1, 0.3882353, 1,
-0.1999478, 0.5897893, -0.9173464, 0, 1, 0.3921569, 1,
-0.1956853, 0.4881819, -1.340639, 0, 1, 0.4, 1,
-0.1930616, -1.062221, -2.588898, 0, 1, 0.4078431, 1,
-0.190936, -0.4103046, -3.158715, 0, 1, 0.4117647, 1,
-0.1849114, 2.154884, 0.3224155, 0, 1, 0.4196078, 1,
-0.1806161, -1.370942, -4.384532, 0, 1, 0.4235294, 1,
-0.1774188, -1.392983, -2.442659, 0, 1, 0.4313726, 1,
-0.1768865, 0.2754697, 0.2412558, 0, 1, 0.4352941, 1,
-0.1732826, -0.6154357, -2.407475, 0, 1, 0.4431373, 1,
-0.1728155, 0.9234419, -0.3097792, 0, 1, 0.4470588, 1,
-0.1707129, -0.9079864, -3.726901, 0, 1, 0.454902, 1,
-0.1696157, 0.5811008, -0.7257478, 0, 1, 0.4588235, 1,
-0.168949, -0.9962732, -3.043335, 0, 1, 0.4666667, 1,
-0.1611367, -0.3601463, -1.941314, 0, 1, 0.4705882, 1,
-0.1597799, -0.02733075, -1.984682, 0, 1, 0.4784314, 1,
-0.1580157, 0.2635621, -0.962126, 0, 1, 0.4823529, 1,
-0.1448568, 0.969009, -0.002041611, 0, 1, 0.4901961, 1,
-0.1409338, -0.5211438, -3.113599, 0, 1, 0.4941176, 1,
-0.139803, -0.4142755, -3.387671, 0, 1, 0.5019608, 1,
-0.1380989, -1.914956, -4.356049, 0, 1, 0.509804, 1,
-0.1323239, 0.4565836, -0.07942647, 0, 1, 0.5137255, 1,
-0.1295861, -0.07205354, -2.645254, 0, 1, 0.5215687, 1,
-0.1291222, -0.9791824, -1.549865, 0, 1, 0.5254902, 1,
-0.1288951, -1.384968, -3.73641, 0, 1, 0.5333334, 1,
-0.1283575, 0.7539995, -1.954191, 0, 1, 0.5372549, 1,
-0.1283543, -1.50818, -3.105058, 0, 1, 0.5450981, 1,
-0.1280884, 0.5520671, -1.089937, 0, 1, 0.5490196, 1,
-0.1227047, 0.8300672, -0.9776769, 0, 1, 0.5568628, 1,
-0.1180735, -0.3708137, -2.536676, 0, 1, 0.5607843, 1,
-0.1179464, -1.692987, -4.056511, 0, 1, 0.5686275, 1,
-0.1177699, 0.3590915, -1.122026, 0, 1, 0.572549, 1,
-0.1140458, -0.04153853, -1.526152, 0, 1, 0.5803922, 1,
-0.1128742, 0.4349841, -0.636894, 0, 1, 0.5843138, 1,
-0.1093787, -0.06699289, -2.772089, 0, 1, 0.5921569, 1,
-0.1062649, 0.712377, 1.149857, 0, 1, 0.5960785, 1,
-0.102984, -1.273322, -3.712035, 0, 1, 0.6039216, 1,
-0.1005428, 0.285389, -0.3860151, 0, 1, 0.6117647, 1,
-0.1000374, 0.96134, -2.193988, 0, 1, 0.6156863, 1,
-0.09905185, -0.1702649, -2.846125, 0, 1, 0.6235294, 1,
-0.09670223, 2.202888, -1.094576, 0, 1, 0.627451, 1,
-0.09455044, -0.5846841, -3.33478, 0, 1, 0.6352941, 1,
-0.09008591, 1.120613, 0.6468868, 0, 1, 0.6392157, 1,
-0.08927646, -0.06659859, -2.23738, 0, 1, 0.6470588, 1,
-0.0889907, -0.03172036, -3.251537, 0, 1, 0.6509804, 1,
-0.08840372, 0.1448156, -0.1969777, 0, 1, 0.6588235, 1,
-0.08820264, 0.2987168, -0.1475818, 0, 1, 0.6627451, 1,
-0.08814807, -0.5242231, -3.37507, 0, 1, 0.6705883, 1,
-0.0871472, 1.658838, -1.114021, 0, 1, 0.6745098, 1,
-0.08691557, 0.5148124, -0.467106, 0, 1, 0.682353, 1,
-0.08166397, 2.070366, 1.886337, 0, 1, 0.6862745, 1,
-0.08131579, -1.143112, -2.432739, 0, 1, 0.6941177, 1,
-0.08066128, 0.1377774, -0.4074243, 0, 1, 0.7019608, 1,
-0.07854878, -0.509189, -4.055007, 0, 1, 0.7058824, 1,
-0.07372714, 0.2281913, -0.4740575, 0, 1, 0.7137255, 1,
-0.07307059, -1.521531, -2.149712, 0, 1, 0.7176471, 1,
-0.06963161, 0.738491, 1.585157, 0, 1, 0.7254902, 1,
-0.06561901, 0.7006173, 0.2729383, 0, 1, 0.7294118, 1,
-0.06398422, -1.229871, -3.326701, 0, 1, 0.7372549, 1,
-0.06296053, 0.5614149, 0.7264184, 0, 1, 0.7411765, 1,
-0.05957757, -2.114286, -2.591265, 0, 1, 0.7490196, 1,
-0.05882227, -0.6013328, -3.332509, 0, 1, 0.7529412, 1,
-0.05696642, 0.546237, 0.5507228, 0, 1, 0.7607843, 1,
-0.05632227, 0.5570305, -2.249165, 0, 1, 0.7647059, 1,
-0.0501303, -2.980053, -2.563591, 0, 1, 0.772549, 1,
-0.04894948, -0.3114495, -2.000587, 0, 1, 0.7764706, 1,
-0.04879485, -1.671418, -3.176841, 0, 1, 0.7843137, 1,
-0.04742608, 0.4992073, -0.7773958, 0, 1, 0.7882353, 1,
-0.04622373, 0.8480495, 0.307568, 0, 1, 0.7960784, 1,
-0.04460112, -1.004006, -3.11062, 0, 1, 0.8039216, 1,
-0.04160425, 2.676403, -0.1386763, 0, 1, 0.8078431, 1,
-0.0415308, -0.905821, -4.578851, 0, 1, 0.8156863, 1,
-0.0395766, -1.375526, -3.589878, 0, 1, 0.8196079, 1,
-0.0374462, -0.6274495, -1.991973, 0, 1, 0.827451, 1,
-0.03693362, 0.06045149, -1.176351, 0, 1, 0.8313726, 1,
-0.03456242, 0.02636125, -2.240252, 0, 1, 0.8392157, 1,
-0.03448568, -0.5009518, -3.147477, 0, 1, 0.8431373, 1,
-0.0344577, 1.844344, -1.070476, 0, 1, 0.8509804, 1,
-0.03394706, -0.6338594, -4.454536, 0, 1, 0.854902, 1,
-0.03291144, -1.329126, -3.464602, 0, 1, 0.8627451, 1,
-0.03068823, -2.070696, -2.861907, 0, 1, 0.8666667, 1,
-0.02992443, 1.147844, -1.183274, 0, 1, 0.8745098, 1,
-0.02733936, -0.2053411, -2.353655, 0, 1, 0.8784314, 1,
-0.02386283, 0.7145437, 1.771125, 0, 1, 0.8862745, 1,
-0.01832625, 0.9614989, 0.5927469, 0, 1, 0.8901961, 1,
-0.01613214, 0.1120862, 0.8810302, 0, 1, 0.8980392, 1,
-0.01284085, 1.757655, 0.4098316, 0, 1, 0.9058824, 1,
-0.009794171, 0.4679811, 0.7137057, 0, 1, 0.9098039, 1,
-0.008689021, -1.483142, -3.315552, 0, 1, 0.9176471, 1,
-0.008042956, 0.9174908, 0.7599388, 0, 1, 0.9215686, 1,
-0.005162747, 0.2354637, -0.3260919, 0, 1, 0.9294118, 1,
-0.001713355, -0.0624019, -2.474713, 0, 1, 0.9333333, 1,
0.00155018, 1.088461, 1.624135, 0, 1, 0.9411765, 1,
0.003408114, -0.2256568, 1.977316, 0, 1, 0.945098, 1,
0.004404123, -0.7078562, 1.261414, 0, 1, 0.9529412, 1,
0.005287443, -0.3509446, 2.466577, 0, 1, 0.9568627, 1,
0.005650581, 0.154954, -0.4717071, 0, 1, 0.9647059, 1,
0.005974496, 0.1261775, 0.7334329, 0, 1, 0.9686275, 1,
0.009181862, 0.4603887, 2.456125, 0, 1, 0.9764706, 1,
0.01543169, -0.2056422, 4.92221, 0, 1, 0.9803922, 1,
0.01644404, -1.159436, 2.518345, 0, 1, 0.9882353, 1,
0.02008072, -0.965645, 3.449313, 0, 1, 0.9921569, 1,
0.02255137, 1.594943, -0.01547981, 0, 1, 1, 1,
0.024483, 1.854491, -0.1108887, 0, 0.9921569, 1, 1,
0.02967254, 0.2807652, 1.736091, 0, 0.9882353, 1, 1,
0.03459432, 1.354293, -0.5231103, 0, 0.9803922, 1, 1,
0.0348707, 0.05417979, 1.1363, 0, 0.9764706, 1, 1,
0.03953657, -1.055364, 3.237736, 0, 0.9686275, 1, 1,
0.04036254, 0.7081759, 0.1577906, 0, 0.9647059, 1, 1,
0.04150788, -1.427244, 4.119815, 0, 0.9568627, 1, 1,
0.0416136, 0.3529918, 0.8331084, 0, 0.9529412, 1, 1,
0.0468064, -0.9546773, 4.430095, 0, 0.945098, 1, 1,
0.04770057, -3.136728, 4.098995, 0, 0.9411765, 1, 1,
0.04902072, -0.4155039, 2.863271, 0, 0.9333333, 1, 1,
0.05114662, 1.283068, -1.512561, 0, 0.9294118, 1, 1,
0.05212834, 1.139633, 0.7023641, 0, 0.9215686, 1, 1,
0.05246381, 0.9182694, 1.119292, 0, 0.9176471, 1, 1,
0.05488001, -1.204126, 2.488115, 0, 0.9098039, 1, 1,
0.06126282, -0.08615228, 2.33964, 0, 0.9058824, 1, 1,
0.06167562, -1.234913, 2.444472, 0, 0.8980392, 1, 1,
0.06375099, -0.07787073, 1.746993, 0, 0.8901961, 1, 1,
0.06773606, 0.4141554, 1.244071, 0, 0.8862745, 1, 1,
0.06992069, -0.01923818, 1.468348, 0, 0.8784314, 1, 1,
0.0705466, -1.255316, 3.338739, 0, 0.8745098, 1, 1,
0.0801484, 0.9238732, -0.5265982, 0, 0.8666667, 1, 1,
0.09556711, 1.446973, 0.953526, 0, 0.8627451, 1, 1,
0.09671774, 0.5728108, 0.489638, 0, 0.854902, 1, 1,
0.1042122, 1.033239, 1.034914, 0, 0.8509804, 1, 1,
0.1042697, -0.9528025, 4.138186, 0, 0.8431373, 1, 1,
0.1074011, -0.741828, 1.855699, 0, 0.8392157, 1, 1,
0.1085518, 0.1211688, 1.695967, 0, 0.8313726, 1, 1,
0.1092447, 0.4596542, -0.8004487, 0, 0.827451, 1, 1,
0.1097237, -0.3067001, 3.440356, 0, 0.8196079, 1, 1,
0.116376, 0.3895133, 0.234731, 0, 0.8156863, 1, 1,
0.1214647, -0.06588078, 4.016181, 0, 0.8078431, 1, 1,
0.1215521, -2.127963, 2.177311, 0, 0.8039216, 1, 1,
0.1293946, -1.01571, 3.997018, 0, 0.7960784, 1, 1,
0.1313871, -0.3695824, 2.494425, 0, 0.7882353, 1, 1,
0.1363227, 1.149914, 0.801515, 0, 0.7843137, 1, 1,
0.1393438, 1.45623, 1.353918, 0, 0.7764706, 1, 1,
0.1432466, -1.400813, 2.427812, 0, 0.772549, 1, 1,
0.1533538, 0.2640503, 1.336064, 0, 0.7647059, 1, 1,
0.1623141, -1.443063, 2.678196, 0, 0.7607843, 1, 1,
0.1623447, 0.358348, 2.269037, 0, 0.7529412, 1, 1,
0.1643339, 1.545743, 0.5002955, 0, 0.7490196, 1, 1,
0.1645844, -0.9566523, 1.961454, 0, 0.7411765, 1, 1,
0.1649054, -0.07934503, 1.909418, 0, 0.7372549, 1, 1,
0.1675961, 0.1519331, 0.9626004, 0, 0.7294118, 1, 1,
0.1686374, 1.271829, 0.7426778, 0, 0.7254902, 1, 1,
0.1716972, 1.658344, -1.08823, 0, 0.7176471, 1, 1,
0.1791894, 0.8818936, -1.582921, 0, 0.7137255, 1, 1,
0.1796162, -0.464773, 2.11747, 0, 0.7058824, 1, 1,
0.1834827, 0.07200601, 1.023296, 0, 0.6980392, 1, 1,
0.1853201, 0.7273664, -1.50589, 0, 0.6941177, 1, 1,
0.1859509, 0.6500555, 1.006864, 0, 0.6862745, 1, 1,
0.1937169, -0.585598, 1.863143, 0, 0.682353, 1, 1,
0.1937573, -0.1154223, 1.039904, 0, 0.6745098, 1, 1,
0.1995549, 0.6484808, 0.1681457, 0, 0.6705883, 1, 1,
0.1997941, 0.6982971, 0.5499728, 0, 0.6627451, 1, 1,
0.2009324, 0.0237486, 1.517533, 0, 0.6588235, 1, 1,
0.2073807, -0.4166061, 2.208261, 0, 0.6509804, 1, 1,
0.2094802, -0.1320968, 1.334935, 0, 0.6470588, 1, 1,
0.2138072, 0.432015, -0.8972102, 0, 0.6392157, 1, 1,
0.2145205, -0.4099434, 2.940087, 0, 0.6352941, 1, 1,
0.2148696, -1.116935, 3.065644, 0, 0.627451, 1, 1,
0.2181373, -1.475468, 3.616963, 0, 0.6235294, 1, 1,
0.2184397, -0.6197641, 1.44262, 0, 0.6156863, 1, 1,
0.2207762, -0.7619687, 3.159404, 0, 0.6117647, 1, 1,
0.2311066, 0.7153285, 2.33322, 0, 0.6039216, 1, 1,
0.2321475, -0.4101173, 3.660716, 0, 0.5960785, 1, 1,
0.2345027, 1.704238, 0.5597696, 0, 0.5921569, 1, 1,
0.2376796, 1.002956, 0.1842275, 0, 0.5843138, 1, 1,
0.2431922, 0.3647485, 0.5969961, 0, 0.5803922, 1, 1,
0.2541602, 1.378365, 1.619865, 0, 0.572549, 1, 1,
0.2561028, 0.1298294, 1.171798, 0, 0.5686275, 1, 1,
0.2583203, -1.200112, 3.285512, 0, 0.5607843, 1, 1,
0.259899, -0.3457432, 1.453594, 0, 0.5568628, 1, 1,
0.2607369, -0.4998083, 2.648552, 0, 0.5490196, 1, 1,
0.2692931, -0.5025029, 0.7036731, 0, 0.5450981, 1, 1,
0.2722673, -1.798558, 3.73646, 0, 0.5372549, 1, 1,
0.273818, 0.8564106, 1.73612, 0, 0.5333334, 1, 1,
0.2741202, 0.1967649, 0.6183341, 0, 0.5254902, 1, 1,
0.2800438, -0.1732176, 0.9003102, 0, 0.5215687, 1, 1,
0.2816377, -1.407364, 2.35898, 0, 0.5137255, 1, 1,
0.2863058, 0.309862, 0.2927378, 0, 0.509804, 1, 1,
0.2865108, 1.243004, 0.08064477, 0, 0.5019608, 1, 1,
0.2872037, 0.3709164, -0.3935732, 0, 0.4941176, 1, 1,
0.2888789, -0.05244725, 2.042504, 0, 0.4901961, 1, 1,
0.2950728, 0.311691, 2.700323, 0, 0.4823529, 1, 1,
0.2957868, 1.394069, -0.514278, 0, 0.4784314, 1, 1,
0.2961926, -1.684221, 3.533009, 0, 0.4705882, 1, 1,
0.2964023, 0.3761053, 1.141992, 0, 0.4666667, 1, 1,
0.2972722, 1.240996, -0.8075519, 0, 0.4588235, 1, 1,
0.2982283, 1.545923, 1.130383, 0, 0.454902, 1, 1,
0.3012348, 0.6689806, 0.7003667, 0, 0.4470588, 1, 1,
0.3050966, 0.2192255, -0.2757198, 0, 0.4431373, 1, 1,
0.3077519, -0.4016276, 3.257396, 0, 0.4352941, 1, 1,
0.3098567, -0.2798405, 0.03242411, 0, 0.4313726, 1, 1,
0.3102684, 0.8334295, 0.9102101, 0, 0.4235294, 1, 1,
0.3142012, -0.2588943, 2.218118, 0, 0.4196078, 1, 1,
0.3159353, 0.1654583, 0.5602595, 0, 0.4117647, 1, 1,
0.3175683, 0.1051035, 0.3102213, 0, 0.4078431, 1, 1,
0.3180949, -0.1958167, 2.321772, 0, 0.4, 1, 1,
0.3187847, 0.1912905, -0.2605397, 0, 0.3921569, 1, 1,
0.3193039, 0.6567055, 1.140898, 0, 0.3882353, 1, 1,
0.3238168, -0.9968484, 1.540628, 0, 0.3803922, 1, 1,
0.3253028, -0.4577192, 3.372381, 0, 0.3764706, 1, 1,
0.3258109, -1.800178, 3.251718, 0, 0.3686275, 1, 1,
0.3266775, 0.6152307, -0.1564049, 0, 0.3647059, 1, 1,
0.3307822, -0.6650209, 1.936998, 0, 0.3568628, 1, 1,
0.3335412, -0.8139381, 3.707804, 0, 0.3529412, 1, 1,
0.3338722, -0.421814, 2.31456, 0, 0.345098, 1, 1,
0.3407275, -0.3270436, 3.618814, 0, 0.3411765, 1, 1,
0.345578, 0.4817765, 2.675116, 0, 0.3333333, 1, 1,
0.3468446, -1.1833, 2.985933, 0, 0.3294118, 1, 1,
0.3475958, -0.0008483524, 0.7041887, 0, 0.3215686, 1, 1,
0.3476538, 0.8796698, 0.8342406, 0, 0.3176471, 1, 1,
0.3511653, -0.4394708, 2.364771, 0, 0.3098039, 1, 1,
0.354631, 1.651111, -0.014942, 0, 0.3058824, 1, 1,
0.354825, -0.4746822, 2.00889, 0, 0.2980392, 1, 1,
0.3575033, -1.245792, 2.049069, 0, 0.2901961, 1, 1,
0.3713204, 1.407363, 0.561963, 0, 0.2862745, 1, 1,
0.3776026, -1.090438, 1.249252, 0, 0.2784314, 1, 1,
0.3789896, -1.707583, 4.453738, 0, 0.2745098, 1, 1,
0.3795232, 0.1596269, 1.128137, 0, 0.2666667, 1, 1,
0.381051, -0.7168222, 1.445014, 0, 0.2627451, 1, 1,
0.3878469, 0.7648143, 0.7162206, 0, 0.254902, 1, 1,
0.3878544, 0.435781, 0.299071, 0, 0.2509804, 1, 1,
0.3878547, 0.7363081, 0.612056, 0, 0.2431373, 1, 1,
0.3883561, 0.06087881, 2.403355, 0, 0.2392157, 1, 1,
0.389066, 0.03965545, 0.9439397, 0, 0.2313726, 1, 1,
0.3900789, -1.727246, 1.383084, 0, 0.227451, 1, 1,
0.392011, 2.074544, 1.817912, 0, 0.2196078, 1, 1,
0.398188, 0.09195949, 1.238911, 0, 0.2156863, 1, 1,
0.4008555, -0.7766487, 2.045965, 0, 0.2078431, 1, 1,
0.4047975, 1.644794, 1.219123, 0, 0.2039216, 1, 1,
0.4082714, 0.9957119, 0.682493, 0, 0.1960784, 1, 1,
0.4091491, -0.2421751, 1.83044, 0, 0.1882353, 1, 1,
0.4110981, 0.1656672, 2.003999, 0, 0.1843137, 1, 1,
0.4159682, -0.9547508, 2.097779, 0, 0.1764706, 1, 1,
0.4162191, -0.6088135, 2.359314, 0, 0.172549, 1, 1,
0.4187888, -1.106962, 2.082794, 0, 0.1647059, 1, 1,
0.4194403, -2.00614, 1.835732, 0, 0.1607843, 1, 1,
0.4197984, 0.9722857, -0.9137546, 0, 0.1529412, 1, 1,
0.4230102, -0.892783, 3.30867, 0, 0.1490196, 1, 1,
0.4257369, -0.09695561, 0.441884, 0, 0.1411765, 1, 1,
0.4264371, 1.919543, -1.941368, 0, 0.1372549, 1, 1,
0.4291606, 0.218846, 2.150293, 0, 0.1294118, 1, 1,
0.4296224, -0.2213394, 3.343973, 0, 0.1254902, 1, 1,
0.4305563, -0.3756639, 4.101061, 0, 0.1176471, 1, 1,
0.4308029, -1.625405, 3.26753, 0, 0.1137255, 1, 1,
0.4331852, -0.3107677, 0.9704151, 0, 0.1058824, 1, 1,
0.4380406, -2.451637, 1.9719, 0, 0.09803922, 1, 1,
0.4399253, -0.4400244, 1.562408, 0, 0.09411765, 1, 1,
0.4458325, 0.2941434, 0.7412219, 0, 0.08627451, 1, 1,
0.4467798, -0.1032384, 0.3579571, 0, 0.08235294, 1, 1,
0.4499761, 1.188205, 2.493595, 0, 0.07450981, 1, 1,
0.4538223, 0.4368218, 0.06121411, 0, 0.07058824, 1, 1,
0.4548014, 0.5236102, 0.3747782, 0, 0.0627451, 1, 1,
0.4551071, 0.5276578, 0.6937125, 0, 0.05882353, 1, 1,
0.4638714, 0.3719741, 1.266321, 0, 0.05098039, 1, 1,
0.4691487, -0.341577, 1.900179, 0, 0.04705882, 1, 1,
0.4700213, 0.2076064, 0.7047358, 0, 0.03921569, 1, 1,
0.4722036, -0.5173519, 2.148513, 0, 0.03529412, 1, 1,
0.4723897, 0.2550935, -1.000093, 0, 0.02745098, 1, 1,
0.4728852, -0.607402, 1.950746, 0, 0.02352941, 1, 1,
0.4769351, 0.8269565, -1.183101, 0, 0.01568628, 1, 1,
0.4776682, -0.6719255, 2.723394, 0, 0.01176471, 1, 1,
0.4792144, -1.02895, 2.751925, 0, 0.003921569, 1, 1,
0.4822048, 0.3588958, 1.87391, 0.003921569, 0, 1, 1,
0.4825032, 0.7267764, -0.147643, 0.007843138, 0, 1, 1,
0.4849699, 0.4636829, 1.852361, 0.01568628, 0, 1, 1,
0.48655, -0.3192675, 2.487209, 0.01960784, 0, 1, 1,
0.4867662, 2.093981, 0.5658641, 0.02745098, 0, 1, 1,
0.4901212, 0.6899259, 0.4101966, 0.03137255, 0, 1, 1,
0.4928626, 1.025434, -1.974729, 0.03921569, 0, 1, 1,
0.4950635, 0.8735458, 1.808187, 0.04313726, 0, 1, 1,
0.4977549, 0.6789057, 2.042254, 0.05098039, 0, 1, 1,
0.5025241, 0.8765799, 0.9219099, 0.05490196, 0, 1, 1,
0.5037676, 0.8955582, 2.01804, 0.0627451, 0, 1, 1,
0.5038445, -1.890352, 1.79021, 0.06666667, 0, 1, 1,
0.5105954, -0.08154624, 1.224942, 0.07450981, 0, 1, 1,
0.5143755, 1.276814, 0.2131439, 0.07843138, 0, 1, 1,
0.5144931, -1.678229, 4.529479, 0.08627451, 0, 1, 1,
0.5181767, -0.1820711, 2.865813, 0.09019608, 0, 1, 1,
0.518387, -0.293984, 0.7756559, 0.09803922, 0, 1, 1,
0.5224456, 1.082722, -0.677958, 0.1058824, 0, 1, 1,
0.5267341, 0.3006234, 2.129192, 0.1098039, 0, 1, 1,
0.5288441, -0.7412979, 1.946946, 0.1176471, 0, 1, 1,
0.5290865, 0.3269391, -0.01535862, 0.1215686, 0, 1, 1,
0.5321633, -0.360536, 3.317937, 0.1294118, 0, 1, 1,
0.5326326, -0.2737707, 0.1295798, 0.1333333, 0, 1, 1,
0.5338282, 1.150147, 1.909371, 0.1411765, 0, 1, 1,
0.5530378, 0.1635355, 1.940544, 0.145098, 0, 1, 1,
0.553985, -0.8950575, 2.797338, 0.1529412, 0, 1, 1,
0.5580755, 0.1755509, 1.789362, 0.1568628, 0, 1, 1,
0.5600293, -1.829883, 4.849455, 0.1647059, 0, 1, 1,
0.561218, -0.4386937, 0.6814129, 0.1686275, 0, 1, 1,
0.562247, 0.9256116, 0.02705312, 0.1764706, 0, 1, 1,
0.5626693, 0.7685512, -0.08539869, 0.1803922, 0, 1, 1,
0.5646269, 1.405268, -1.584255, 0.1882353, 0, 1, 1,
0.5696129, -0.9074124, 2.251123, 0.1921569, 0, 1, 1,
0.5704232, 0.6905668, 0.5634393, 0.2, 0, 1, 1,
0.5773571, 0.5732478, 2.499256, 0.2078431, 0, 1, 1,
0.5780072, 0.7063566, -0.1623547, 0.2117647, 0, 1, 1,
0.584354, -1.420629, 2.651893, 0.2196078, 0, 1, 1,
0.5872435, -1.151297, 1.482274, 0.2235294, 0, 1, 1,
0.5882902, 0.07655057, 0.6724203, 0.2313726, 0, 1, 1,
0.5969787, -1.157777, 3.067753, 0.2352941, 0, 1, 1,
0.5984992, -1.702391, 3.672811, 0.2431373, 0, 1, 1,
0.5987371, 1.527256, -0.5383083, 0.2470588, 0, 1, 1,
0.5992329, 1.015326, 1.282137, 0.254902, 0, 1, 1,
0.5994357, -0.7979399, 2.943421, 0.2588235, 0, 1, 1,
0.5998088, 0.3186927, 0.3959895, 0.2666667, 0, 1, 1,
0.6012583, -1.96568, 2.001719, 0.2705882, 0, 1, 1,
0.6064668, 0.1467542, -0.6999187, 0.2784314, 0, 1, 1,
0.6175973, 0.6987, 0.06401187, 0.282353, 0, 1, 1,
0.6185741, -1.007435, 2.722584, 0.2901961, 0, 1, 1,
0.6198599, 2.32278, -1.065423, 0.2941177, 0, 1, 1,
0.6334872, 1.374243, 1.807468, 0.3019608, 0, 1, 1,
0.6373566, 1.4356, 0.02010699, 0.3098039, 0, 1, 1,
0.6379305, -0.1551615, 2.700423, 0.3137255, 0, 1, 1,
0.6415402, 1.248803, 0.6411737, 0.3215686, 0, 1, 1,
0.6493581, 1.288574, 0.5152856, 0.3254902, 0, 1, 1,
0.6539434, 0.3494072, 2.055921, 0.3333333, 0, 1, 1,
0.6552595, -0.719438, 2.6845, 0.3372549, 0, 1, 1,
0.6558026, 0.6355346, 0.7974018, 0.345098, 0, 1, 1,
0.6566432, 0.2207516, 2.275787, 0.3490196, 0, 1, 1,
0.6571273, 0.273134, 1.395989, 0.3568628, 0, 1, 1,
0.6652858, -0.4807928, 3.412596, 0.3607843, 0, 1, 1,
0.6672734, 0.456425, 0.2218472, 0.3686275, 0, 1, 1,
0.6675636, -1.21466, 2.392314, 0.372549, 0, 1, 1,
0.6676822, -0.503643, 2.353883, 0.3803922, 0, 1, 1,
0.6780919, -0.5650237, 3.683047, 0.3843137, 0, 1, 1,
0.6808866, 1.780378, -2.067918, 0.3921569, 0, 1, 1,
0.6856109, 1.550183, 0.3862771, 0.3960784, 0, 1, 1,
0.6891549, 1.22535, -0.3605307, 0.4039216, 0, 1, 1,
0.6913514, -0.03550181, 2.767662, 0.4117647, 0, 1, 1,
0.6940743, 0.4451109, 2.382651, 0.4156863, 0, 1, 1,
0.695368, -0.6328052, 3.410185, 0.4235294, 0, 1, 1,
0.7015038, -0.8600425, 0.8688842, 0.427451, 0, 1, 1,
0.7017831, 0.1010499, 2.036225, 0.4352941, 0, 1, 1,
0.7043063, 0.1616381, 1.980097, 0.4392157, 0, 1, 1,
0.7138109, 0.8554971, 2.459086, 0.4470588, 0, 1, 1,
0.7140088, 0.2863089, 0.09647632, 0.4509804, 0, 1, 1,
0.7192839, -0.3889459, 1.735429, 0.4588235, 0, 1, 1,
0.7223472, -0.844076, 1.114283, 0.4627451, 0, 1, 1,
0.7307194, 0.7751891, -1.214154, 0.4705882, 0, 1, 1,
0.7375394, 1.269033, 0.3367421, 0.4745098, 0, 1, 1,
0.7389678, -0.5705009, 0.8546701, 0.4823529, 0, 1, 1,
0.7440581, 0.7973804, 0.04534759, 0.4862745, 0, 1, 1,
0.7444913, 1.21782, -0.175612, 0.4941176, 0, 1, 1,
0.7457538, -0.2813352, -0.0132813, 0.5019608, 0, 1, 1,
0.7476625, 0.872211, 0.8311982, 0.5058824, 0, 1, 1,
0.7489374, -0.673372, 2.365411, 0.5137255, 0, 1, 1,
0.7538701, -0.9446152, 1.416205, 0.5176471, 0, 1, 1,
0.7547182, 0.8446236, 1.574608, 0.5254902, 0, 1, 1,
0.756646, -0.6792109, 2.219931, 0.5294118, 0, 1, 1,
0.7583221, -0.0315498, 2.892816, 0.5372549, 0, 1, 1,
0.7601684, 0.02597148, 1.256347, 0.5411765, 0, 1, 1,
0.7604868, -0.1553073, 0.717486, 0.5490196, 0, 1, 1,
0.7620709, -1.00743, 2.179664, 0.5529412, 0, 1, 1,
0.7644964, 0.5756117, 1.107302, 0.5607843, 0, 1, 1,
0.7645677, 1.187476, 2.02983, 0.5647059, 0, 1, 1,
0.765604, -1.338346, 2.713311, 0.572549, 0, 1, 1,
0.765624, -0.01184386, 2.289972, 0.5764706, 0, 1, 1,
0.7665929, 0.107581, 2.957806, 0.5843138, 0, 1, 1,
0.7687942, -1.635845, 4.908208, 0.5882353, 0, 1, 1,
0.7748241, -0.1565501, 0.8660309, 0.5960785, 0, 1, 1,
0.7775821, 1.557687, 0.7576984, 0.6039216, 0, 1, 1,
0.7842468, 1.187934, -0.06439334, 0.6078432, 0, 1, 1,
0.7847251, -0.443619, 1.045822, 0.6156863, 0, 1, 1,
0.785536, -0.1954965, 1.912861, 0.6196079, 0, 1, 1,
0.7863387, -0.488914, 4.317384, 0.627451, 0, 1, 1,
0.7944608, 1.008602, -0.868587, 0.6313726, 0, 1, 1,
0.8042606, -0.6282187, -0.1700356, 0.6392157, 0, 1, 1,
0.8071631, 0.7844836, 1.502298, 0.6431373, 0, 1, 1,
0.8084161, 0.2856032, 1.739184, 0.6509804, 0, 1, 1,
0.811747, -0.2907745, 3.893625, 0.654902, 0, 1, 1,
0.8119811, -0.7786722, 2.808192, 0.6627451, 0, 1, 1,
0.8139837, 0.4269989, 2.103242, 0.6666667, 0, 1, 1,
0.8146043, 0.4661241, 0.875562, 0.6745098, 0, 1, 1,
0.8147894, -0.4396667, 1.568512, 0.6784314, 0, 1, 1,
0.8148715, -0.4150924, 2.202363, 0.6862745, 0, 1, 1,
0.81631, -0.5933837, 1.206082, 0.6901961, 0, 1, 1,
0.8301752, -0.0326261, 2.171207, 0.6980392, 0, 1, 1,
0.8311215, -0.4836441, 1.88591, 0.7058824, 0, 1, 1,
0.8337722, 0.3743862, 3.176233, 0.7098039, 0, 1, 1,
0.8362233, 0.6078452, 1.023576, 0.7176471, 0, 1, 1,
0.837145, -0.8694279, 2.305669, 0.7215686, 0, 1, 1,
0.8373707, -0.9188413, 2.145313, 0.7294118, 0, 1, 1,
0.8379604, -0.2854923, 2.91571, 0.7333333, 0, 1, 1,
0.8401713, 1.955898, 0.5719002, 0.7411765, 0, 1, 1,
0.8440823, 0.429422, 1.134516, 0.7450981, 0, 1, 1,
0.849032, -1.217625, 2.577349, 0.7529412, 0, 1, 1,
0.8554922, 0.3794645, 2.282963, 0.7568628, 0, 1, 1,
0.8568574, 0.6561068, -0.6402923, 0.7647059, 0, 1, 1,
0.8591371, -1.070157, 2.902917, 0.7686275, 0, 1, 1,
0.8620415, -0.06378894, 1.320028, 0.7764706, 0, 1, 1,
0.8717148, -0.7227396, 3.525576, 0.7803922, 0, 1, 1,
0.8779991, -1.111296, 4.102473, 0.7882353, 0, 1, 1,
0.8833263, -0.0983417, 2.102355, 0.7921569, 0, 1, 1,
0.8868936, -0.6050236, 2.513421, 0.8, 0, 1, 1,
0.8907171, 2.61812, 1.241798, 0.8078431, 0, 1, 1,
0.9015753, -0.473302, 4.412575, 0.8117647, 0, 1, 1,
0.905088, 0.1090827, 2.710544, 0.8196079, 0, 1, 1,
0.9057977, -0.9058495, 2.267809, 0.8235294, 0, 1, 1,
0.9212612, -0.1028513, 3.552549, 0.8313726, 0, 1, 1,
0.9234176, 1.279398, 2.291831, 0.8352941, 0, 1, 1,
0.9239974, 1.030205, 1.496811, 0.8431373, 0, 1, 1,
0.928295, -0.7198821, 1.707059, 0.8470588, 0, 1, 1,
0.9291872, -0.1237917, 1.419692, 0.854902, 0, 1, 1,
0.9390981, 0.4548447, -0.7022622, 0.8588235, 0, 1, 1,
0.9432838, 0.8332044, 0.6966603, 0.8666667, 0, 1, 1,
0.944168, -0.1851565, 1.776753, 0.8705882, 0, 1, 1,
0.9512055, -1.981192, 3.48104, 0.8784314, 0, 1, 1,
0.9563568, -0.5807738, 3.296541, 0.8823529, 0, 1, 1,
0.9571662, -0.8799527, 2.313203, 0.8901961, 0, 1, 1,
0.9696503, 0.5963306, -0.2495537, 0.8941177, 0, 1, 1,
0.9698793, -1.801008, 3.260159, 0.9019608, 0, 1, 1,
0.9802116, -1.365334, 0.826429, 0.9098039, 0, 1, 1,
0.9890686, -0.3125634, 2.933746, 0.9137255, 0, 1, 1,
0.9897894, 0.4909864, 1.967614, 0.9215686, 0, 1, 1,
0.9919235, -0.3339043, 3.016705, 0.9254902, 0, 1, 1,
1.01095, -0.1520015, 0.9717686, 0.9333333, 0, 1, 1,
1.012956, -1.347514, 1.634243, 0.9372549, 0, 1, 1,
1.013676, -0.6034231, 2.821357, 0.945098, 0, 1, 1,
1.015081, -0.880444, 2.165497, 0.9490196, 0, 1, 1,
1.01632, -2.473381, 3.198459, 0.9568627, 0, 1, 1,
1.019202, -0.2718884, 2.603524, 0.9607843, 0, 1, 1,
1.023187, -0.1179013, 1.339615, 0.9686275, 0, 1, 1,
1.024928, 0.7370501, 2.4661, 0.972549, 0, 1, 1,
1.025569, 0.3211087, 1.840729, 0.9803922, 0, 1, 1,
1.029051, -1.790587, 3.260468, 0.9843137, 0, 1, 1,
1.031718, 0.08384363, -0.02960123, 0.9921569, 0, 1, 1,
1.039768, -1.294746, 4.550629, 0.9960784, 0, 1, 1,
1.045372, 0.4904954, -0.5589415, 1, 0, 0.9960784, 1,
1.045516, -0.4684026, 1.161273, 1, 0, 0.9882353, 1,
1.048827, -1.042654, 1.748392, 1, 0, 0.9843137, 1,
1.048886, 1.266797, 1.734288, 1, 0, 0.9764706, 1,
1.050493, -0.6526875, 1.047199, 1, 0, 0.972549, 1,
1.052535, 1.013513, 0.9251456, 1, 0, 0.9647059, 1,
1.054584, 1.777767, 1.0591, 1, 0, 0.9607843, 1,
1.060329, -1.038908, 2.438286, 1, 0, 0.9529412, 1,
1.066406, -0.6283731, 2.186975, 1, 0, 0.9490196, 1,
1.068174, -0.7196348, 3.031293, 1, 0, 0.9411765, 1,
1.072877, -0.001807937, 4.504864, 1, 0, 0.9372549, 1,
1.075006, 0.9716183, 0.5995977, 1, 0, 0.9294118, 1,
1.083133, -0.8701149, 1.47435, 1, 0, 0.9254902, 1,
1.086339, -0.5524687, 2.314643, 1, 0, 0.9176471, 1,
1.086713, 1.815629, 1.828539, 1, 0, 0.9137255, 1,
1.095105, 1.026717, 0.1124066, 1, 0, 0.9058824, 1,
1.101106, 1.959538, 1.422064, 1, 0, 0.9019608, 1,
1.103874, 1.469232, 0.2753197, 1, 0, 0.8941177, 1,
1.114849, -0.267347, 2.623027, 1, 0, 0.8862745, 1,
1.115041, -0.3464022, 3.191353, 1, 0, 0.8823529, 1,
1.115676, -1.631253, 1.514893, 1, 0, 0.8745098, 1,
1.120472, 0.1288048, 2.374319, 1, 0, 0.8705882, 1,
1.122919, -0.5843375, 2.486006, 1, 0, 0.8627451, 1,
1.127647, 0.6673226, 1.104267, 1, 0, 0.8588235, 1,
1.1279, 0.779421, 1.543483, 1, 0, 0.8509804, 1,
1.138972, -1.939454, 1.388616, 1, 0, 0.8470588, 1,
1.143746, 1.386385, -0.05906663, 1, 0, 0.8392157, 1,
1.144685, 0.6040589, 0.4623182, 1, 0, 0.8352941, 1,
1.148313, 1.171468, 1.128033, 1, 0, 0.827451, 1,
1.151428, -0.7845538, 0.5416498, 1, 0, 0.8235294, 1,
1.154969, 0.7394717, 1.595903, 1, 0, 0.8156863, 1,
1.15775, 0.3984458, 1.7505, 1, 0, 0.8117647, 1,
1.161466, 0.6195478, -0.3282775, 1, 0, 0.8039216, 1,
1.177041, -1.480998, 0.8579247, 1, 0, 0.7960784, 1,
1.178525, -0.2201274, 1.273647, 1, 0, 0.7921569, 1,
1.178936, -0.153113, 2.813098, 1, 0, 0.7843137, 1,
1.185076, -2.480206, 2.180239, 1, 0, 0.7803922, 1,
1.186665, -0.7739582, 2.834228, 1, 0, 0.772549, 1,
1.192605, 0.8891577, 0.3867191, 1, 0, 0.7686275, 1,
1.197412, 1.491298, 0.2642578, 1, 0, 0.7607843, 1,
1.197777, 0.9162964, 1.228692, 1, 0, 0.7568628, 1,
1.203816, -0.7660602, 1.851954, 1, 0, 0.7490196, 1,
1.21714, 1.129732, 2.164888, 1, 0, 0.7450981, 1,
1.22243, 0.4863417, 0.0634658, 1, 0, 0.7372549, 1,
1.230329, 0.7377508, 0.4617975, 1, 0, 0.7333333, 1,
1.235601, -0.8607231, 1.11489, 1, 0, 0.7254902, 1,
1.237519, 0.2451117, 2.513618, 1, 0, 0.7215686, 1,
1.242643, -1.826201, 3.197511, 1, 0, 0.7137255, 1,
1.248643, -0.9254961, 0.9262534, 1, 0, 0.7098039, 1,
1.249567, -1.253697, 3.446465, 1, 0, 0.7019608, 1,
1.249735, -1.484877, 1.624913, 1, 0, 0.6941177, 1,
1.252042, -0.8547342, 2.32451, 1, 0, 0.6901961, 1,
1.257095, 0.994675, -0.2691379, 1, 0, 0.682353, 1,
1.257454, -0.239786, 1.798713, 1, 0, 0.6784314, 1,
1.260867, -0.4084731, 3.394121, 1, 0, 0.6705883, 1,
1.26983, -0.4432685, 1.430062, 1, 0, 0.6666667, 1,
1.273894, -0.425993, 1.758995, 1, 0, 0.6588235, 1,
1.284972, 0.6840412, 1.86604, 1, 0, 0.654902, 1,
1.287848, -0.7949181, 3.564936, 1, 0, 0.6470588, 1,
1.292212, 0.03865094, 1.283752, 1, 0, 0.6431373, 1,
1.29718, -0.4349073, 2.852025, 1, 0, 0.6352941, 1,
1.302793, -0.01390633, 1.240689, 1, 0, 0.6313726, 1,
1.306606, -0.177279, 1.758113, 1, 0, 0.6235294, 1,
1.307448, 1.122979, -0.6296166, 1, 0, 0.6196079, 1,
1.312727, 0.09255325, 2.139306, 1, 0, 0.6117647, 1,
1.321747, -0.2110887, 2.00487, 1, 0, 0.6078432, 1,
1.328923, 0.6494431, 0.4389542, 1, 0, 0.6, 1,
1.330279, -0.7365812, 2.103984, 1, 0, 0.5921569, 1,
1.333593, 1.375714, 0.7897967, 1, 0, 0.5882353, 1,
1.335459, -0.3912367, 0.8224728, 1, 0, 0.5803922, 1,
1.340125, -2.360451, 2.98814, 1, 0, 0.5764706, 1,
1.341687, -0.2912244, 1.254351, 1, 0, 0.5686275, 1,
1.350925, -1.878439, 2.099109, 1, 0, 0.5647059, 1,
1.362364, 1.147272, 0.9506797, 1, 0, 0.5568628, 1,
1.365844, -0.4465444, 2.296102, 1, 0, 0.5529412, 1,
1.366755, -1.978062, 1.930159, 1, 0, 0.5450981, 1,
1.376518, 0.1358778, 2.19971, 1, 0, 0.5411765, 1,
1.379934, -0.004641932, 3.007428, 1, 0, 0.5333334, 1,
1.388811, 1.728683, 1.308701, 1, 0, 0.5294118, 1,
1.390703, -1.196849, 2.568711, 1, 0, 0.5215687, 1,
1.392087, 1.399021, 0.9995321, 1, 0, 0.5176471, 1,
1.395778, 1.693504, 1.263319, 1, 0, 0.509804, 1,
1.396447, -0.9854485, 1.28543, 1, 0, 0.5058824, 1,
1.396778, -2.419952, 2.220132, 1, 0, 0.4980392, 1,
1.404894, 0.5530893, 2.052907, 1, 0, 0.4901961, 1,
1.407034, -0.8624045, 2.157207, 1, 0, 0.4862745, 1,
1.41623, -2.190702, 2.684801, 1, 0, 0.4784314, 1,
1.416835, -0.1810345, -0.4460452, 1, 0, 0.4745098, 1,
1.434228, 0.2749754, -0.02913391, 1, 0, 0.4666667, 1,
1.442546, 0.3508822, -0.26392, 1, 0, 0.4627451, 1,
1.469775, -0.9877375, 2.941648, 1, 0, 0.454902, 1,
1.476521, 1.570085, 1.660785, 1, 0, 0.4509804, 1,
1.478279, 0.8774829, 0.2480045, 1, 0, 0.4431373, 1,
1.480896, -1.684691, 1.684383, 1, 0, 0.4392157, 1,
1.48966, 0.1538283, 1.972236, 1, 0, 0.4313726, 1,
1.502876, 0.1564071, 0.7935278, 1, 0, 0.427451, 1,
1.503659, 1.031421, 0.5569496, 1, 0, 0.4196078, 1,
1.506376, -1.231579, 2.465771, 1, 0, 0.4156863, 1,
1.521544, 0.7368397, 3.105074, 1, 0, 0.4078431, 1,
1.525108, 0.4622936, 0.8626716, 1, 0, 0.4039216, 1,
1.527525, -0.01067894, 1.90537, 1, 0, 0.3960784, 1,
1.5301, 1.173018, 1.074673, 1, 0, 0.3882353, 1,
1.538223, 1.74902, 2.489906, 1, 0, 0.3843137, 1,
1.539414, -1.153527, 1.765447, 1, 0, 0.3764706, 1,
1.540542, -0.4364046, 1.675143, 1, 0, 0.372549, 1,
1.546163, 0.567735, 1.654036, 1, 0, 0.3647059, 1,
1.550174, 0.9604459, 2.120988, 1, 0, 0.3607843, 1,
1.561589, 1.41595, -0.1932012, 1, 0, 0.3529412, 1,
1.576159, -0.8007964, 3.886899, 1, 0, 0.3490196, 1,
1.578077, -1.630623, 2.626394, 1, 0, 0.3411765, 1,
1.579368, 0.5607724, 1.338026, 1, 0, 0.3372549, 1,
1.584517, -0.8587796, 1.732662, 1, 0, 0.3294118, 1,
1.587007, 0.3268723, -0.04872674, 1, 0, 0.3254902, 1,
1.592538, -0.104874, 1.433253, 1, 0, 0.3176471, 1,
1.595709, 0.3244037, 2.405428, 1, 0, 0.3137255, 1,
1.601696, -1.050122, 3.307108, 1, 0, 0.3058824, 1,
1.606884, 0.11979, 2.009912, 1, 0, 0.2980392, 1,
1.616749, 0.8174412, 2.646665, 1, 0, 0.2941177, 1,
1.634918, -2.148553, 3.34332, 1, 0, 0.2862745, 1,
1.642562, 0.06542199, 1.778107, 1, 0, 0.282353, 1,
1.659209, -0.6117727, 2.831188, 1, 0, 0.2745098, 1,
1.660604, 1.497078, -0.001352438, 1, 0, 0.2705882, 1,
1.661159, 0.5435663, -0.08790648, 1, 0, 0.2627451, 1,
1.675405, 0.9683816, -0.4781525, 1, 0, 0.2588235, 1,
1.689576, -0.2583477, 1.383613, 1, 0, 0.2509804, 1,
1.708569, 0.601215, 0.1612389, 1, 0, 0.2470588, 1,
1.718397, 0.007184766, 2.561131, 1, 0, 0.2392157, 1,
1.718908, 1.427787, 0.3112972, 1, 0, 0.2352941, 1,
1.731904, -1.3211, 4.783825, 1, 0, 0.227451, 1,
1.778967, 0.03318887, 0.1374054, 1, 0, 0.2235294, 1,
1.807487, 1.473902, 1.514205, 1, 0, 0.2156863, 1,
1.847048, -1.654538, 2.971719, 1, 0, 0.2117647, 1,
1.851427, -0.4685926, 2.547121, 1, 0, 0.2039216, 1,
1.857713, 0.0933658, 2.691959, 1, 0, 0.1960784, 1,
1.876205, -1.468191, 2.352347, 1, 0, 0.1921569, 1,
1.88083, -0.07266562, 1.020194, 1, 0, 0.1843137, 1,
1.951156, -0.3758786, 1.931475, 1, 0, 0.1803922, 1,
1.973507, -2.011005, 2.279477, 1, 0, 0.172549, 1,
1.974467, -0.06234975, 1.924238, 1, 0, 0.1686275, 1,
1.977403, -0.3717473, -0.07387879, 1, 0, 0.1607843, 1,
1.978489, 0.8072429, 1.187219, 1, 0, 0.1568628, 1,
1.980388, 0.6080436, 1.794514, 1, 0, 0.1490196, 1,
1.981095, -0.1824393, -0.7622697, 1, 0, 0.145098, 1,
2.024568, -1.294096, 2.132057, 1, 0, 0.1372549, 1,
2.046285, -1.869055, 1.589696, 1, 0, 0.1333333, 1,
2.059698, -0.1236402, 1.352981, 1, 0, 0.1254902, 1,
2.073124, -1.612876, 3.40168, 1, 0, 0.1215686, 1,
2.085654, 0.3313339, 0.9555404, 1, 0, 0.1137255, 1,
2.087742, 1.620398, 0.9383366, 1, 0, 0.1098039, 1,
2.093346, 0.1177789, 1.632838, 1, 0, 0.1019608, 1,
2.145722, -0.4834096, -0.2211028, 1, 0, 0.09411765, 1,
2.149553, 0.570331, 0.5727139, 1, 0, 0.09019608, 1,
2.182914, -1.0703, 3.476676, 1, 0, 0.08235294, 1,
2.183729, -0.2862654, 2.265619, 1, 0, 0.07843138, 1,
2.191135, -0.308023, 1.507741, 1, 0, 0.07058824, 1,
2.253527, 0.9776119, 0.649747, 1, 0, 0.06666667, 1,
2.259423, -0.5492598, 0.2102387, 1, 0, 0.05882353, 1,
2.284904, 0.8653057, 2.074537, 1, 0, 0.05490196, 1,
2.390458, -0.6930879, 1.412563, 1, 0, 0.04705882, 1,
2.407993, 1.254611, 1.807985, 1, 0, 0.04313726, 1,
2.442401, 0.8379488, 1.011332, 1, 0, 0.03529412, 1,
2.469085, 0.9682789, 0.7945674, 1, 0, 0.03137255, 1,
2.504286, -0.9473566, 1.156882, 1, 0, 0.02352941, 1,
2.513157, -0.3863216, 1.894767, 1, 0, 0.01960784, 1,
2.519905, 0.7757506, 2.423339, 1, 0, 0.01176471, 1,
2.738526, 0.5611155, 1.01744, 1, 0, 0.007843138, 1
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
-0.03116608, -4.194795, -6.600888, 0, -0.5, 0.5, 0.5,
-0.03116608, -4.194795, -6.600888, 1, -0.5, 0.5, 0.5,
-0.03116608, -4.194795, -6.600888, 1, 1.5, 0.5, 0.5,
-0.03116608, -4.194795, -6.600888, 0, 1.5, 0.5, 0.5
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
-3.739784, -0.0155865, -6.600888, 0, -0.5, 0.5, 0.5,
-3.739784, -0.0155865, -6.600888, 1, -0.5, 0.5, 0.5,
-3.739784, -0.0155865, -6.600888, 1, 1.5, 0.5, 0.5,
-3.739784, -0.0155865, -6.600888, 0, 1.5, 0.5, 0.5
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
-3.739784, -4.194795, -0.004296541, 0, -0.5, 0.5, 0.5,
-3.739784, -4.194795, -0.004296541, 1, -0.5, 0.5, 0.5,
-3.739784, -4.194795, -0.004296541, 1, 1.5, 0.5, 0.5,
-3.739784, -4.194795, -0.004296541, 0, 1.5, 0.5, 0.5
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
-2, -3.230363, -5.078598,
2, -3.230363, -5.078598,
-2, -3.230363, -5.078598,
-2, -3.391101, -5.332313,
-1, -3.230363, -5.078598,
-1, -3.391101, -5.332313,
0, -3.230363, -5.078598,
0, -3.391101, -5.332313,
1, -3.230363, -5.078598,
1, -3.391101, -5.332313,
2, -3.230363, -5.078598,
2, -3.391101, -5.332313
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
-2, -3.712579, -5.839743, 0, -0.5, 0.5, 0.5,
-2, -3.712579, -5.839743, 1, -0.5, 0.5, 0.5,
-2, -3.712579, -5.839743, 1, 1.5, 0.5, 0.5,
-2, -3.712579, -5.839743, 0, 1.5, 0.5, 0.5,
-1, -3.712579, -5.839743, 0, -0.5, 0.5, 0.5,
-1, -3.712579, -5.839743, 1, -0.5, 0.5, 0.5,
-1, -3.712579, -5.839743, 1, 1.5, 0.5, 0.5,
-1, -3.712579, -5.839743, 0, 1.5, 0.5, 0.5,
0, -3.712579, -5.839743, 0, -0.5, 0.5, 0.5,
0, -3.712579, -5.839743, 1, -0.5, 0.5, 0.5,
0, -3.712579, -5.839743, 1, 1.5, 0.5, 0.5,
0, -3.712579, -5.839743, 0, 1.5, 0.5, 0.5,
1, -3.712579, -5.839743, 0, -0.5, 0.5, 0.5,
1, -3.712579, -5.839743, 1, -0.5, 0.5, 0.5,
1, -3.712579, -5.839743, 1, 1.5, 0.5, 0.5,
1, -3.712579, -5.839743, 0, 1.5, 0.5, 0.5,
2, -3.712579, -5.839743, 0, -0.5, 0.5, 0.5,
2, -3.712579, -5.839743, 1, -0.5, 0.5, 0.5,
2, -3.712579, -5.839743, 1, 1.5, 0.5, 0.5,
2, -3.712579, -5.839743, 0, 1.5, 0.5, 0.5
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
-2.883949, -3, -5.078598,
-2.883949, 3, -5.078598,
-2.883949, -3, -5.078598,
-3.026588, -3, -5.332313,
-2.883949, -2, -5.078598,
-3.026588, -2, -5.332313,
-2.883949, -1, -5.078598,
-3.026588, -1, -5.332313,
-2.883949, 0, -5.078598,
-3.026588, 0, -5.332313,
-2.883949, 1, -5.078598,
-3.026588, 1, -5.332313,
-2.883949, 2, -5.078598,
-3.026588, 2, -5.332313,
-2.883949, 3, -5.078598,
-3.026588, 3, -5.332313
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
-3.311867, -3, -5.839743, 0, -0.5, 0.5, 0.5,
-3.311867, -3, -5.839743, 1, -0.5, 0.5, 0.5,
-3.311867, -3, -5.839743, 1, 1.5, 0.5, 0.5,
-3.311867, -3, -5.839743, 0, 1.5, 0.5, 0.5,
-3.311867, -2, -5.839743, 0, -0.5, 0.5, 0.5,
-3.311867, -2, -5.839743, 1, -0.5, 0.5, 0.5,
-3.311867, -2, -5.839743, 1, 1.5, 0.5, 0.5,
-3.311867, -2, -5.839743, 0, 1.5, 0.5, 0.5,
-3.311867, -1, -5.839743, 0, -0.5, 0.5, 0.5,
-3.311867, -1, -5.839743, 1, -0.5, 0.5, 0.5,
-3.311867, -1, -5.839743, 1, 1.5, 0.5, 0.5,
-3.311867, -1, -5.839743, 0, 1.5, 0.5, 0.5,
-3.311867, 0, -5.839743, 0, -0.5, 0.5, 0.5,
-3.311867, 0, -5.839743, 1, -0.5, 0.5, 0.5,
-3.311867, 0, -5.839743, 1, 1.5, 0.5, 0.5,
-3.311867, 0, -5.839743, 0, 1.5, 0.5, 0.5,
-3.311867, 1, -5.839743, 0, -0.5, 0.5, 0.5,
-3.311867, 1, -5.839743, 1, -0.5, 0.5, 0.5,
-3.311867, 1, -5.839743, 1, 1.5, 0.5, 0.5,
-3.311867, 1, -5.839743, 0, 1.5, 0.5, 0.5,
-3.311867, 2, -5.839743, 0, -0.5, 0.5, 0.5,
-3.311867, 2, -5.839743, 1, -0.5, 0.5, 0.5,
-3.311867, 2, -5.839743, 1, 1.5, 0.5, 0.5,
-3.311867, 2, -5.839743, 0, 1.5, 0.5, 0.5,
-3.311867, 3, -5.839743, 0, -0.5, 0.5, 0.5,
-3.311867, 3, -5.839743, 1, -0.5, 0.5, 0.5,
-3.311867, 3, -5.839743, 1, 1.5, 0.5, 0.5,
-3.311867, 3, -5.839743, 0, 1.5, 0.5, 0.5
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
-2.883949, -3.230363, -4,
-2.883949, -3.230363, 4,
-2.883949, -3.230363, -4,
-3.026588, -3.391101, -4,
-2.883949, -3.230363, -2,
-3.026588, -3.391101, -2,
-2.883949, -3.230363, 0,
-3.026588, -3.391101, 0,
-2.883949, -3.230363, 2,
-3.026588, -3.391101, 2,
-2.883949, -3.230363, 4,
-3.026588, -3.391101, 4
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
-3.311867, -3.712579, -4, 0, -0.5, 0.5, 0.5,
-3.311867, -3.712579, -4, 1, -0.5, 0.5, 0.5,
-3.311867, -3.712579, -4, 1, 1.5, 0.5, 0.5,
-3.311867, -3.712579, -4, 0, 1.5, 0.5, 0.5,
-3.311867, -3.712579, -2, 0, -0.5, 0.5, 0.5,
-3.311867, -3.712579, -2, 1, -0.5, 0.5, 0.5,
-3.311867, -3.712579, -2, 1, 1.5, 0.5, 0.5,
-3.311867, -3.712579, -2, 0, 1.5, 0.5, 0.5,
-3.311867, -3.712579, 0, 0, -0.5, 0.5, 0.5,
-3.311867, -3.712579, 0, 1, -0.5, 0.5, 0.5,
-3.311867, -3.712579, 0, 1, 1.5, 0.5, 0.5,
-3.311867, -3.712579, 0, 0, 1.5, 0.5, 0.5,
-3.311867, -3.712579, 2, 0, -0.5, 0.5, 0.5,
-3.311867, -3.712579, 2, 1, -0.5, 0.5, 0.5,
-3.311867, -3.712579, 2, 1, 1.5, 0.5, 0.5,
-3.311867, -3.712579, 2, 0, 1.5, 0.5, 0.5,
-3.311867, -3.712579, 4, 0, -0.5, 0.5, 0.5,
-3.311867, -3.712579, 4, 1, -0.5, 0.5, 0.5,
-3.311867, -3.712579, 4, 1, 1.5, 0.5, 0.5,
-3.311867, -3.712579, 4, 0, 1.5, 0.5, 0.5
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
-2.883949, -3.230363, -5.078598,
-2.883949, 3.19919, -5.078598,
-2.883949, -3.230363, 5.070005,
-2.883949, 3.19919, 5.070005,
-2.883949, -3.230363, -5.078598,
-2.883949, -3.230363, 5.070005,
-2.883949, 3.19919, -5.078598,
-2.883949, 3.19919, 5.070005,
-2.883949, -3.230363, -5.078598,
2.821617, -3.230363, -5.078598,
-2.883949, -3.230363, 5.070005,
2.821617, -3.230363, 5.070005,
-2.883949, 3.19919, -5.078598,
2.821617, 3.19919, -5.078598,
-2.883949, 3.19919, 5.070005,
2.821617, 3.19919, 5.070005,
2.821617, -3.230363, -5.078598,
2.821617, 3.19919, -5.078598,
2.821617, -3.230363, 5.070005,
2.821617, 3.19919, 5.070005,
2.821617, -3.230363, -5.078598,
2.821617, -3.230363, 5.070005,
2.821617, 3.19919, -5.078598,
2.821617, 3.19919, 5.070005
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
var radius = 7.101877;
var distance = 31.59705;
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
mvMatrix.translate( 0.03116608, 0.0155865, 0.004296541 );
mvMatrix.scale( 1.345824, 1.194281, 0.7566252 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -31.59705);
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
decitabine<-read.table("decitabine.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-decitabine$V2
```

```
## Error in eval(expr, envir, enclos): object 'decitabine' not found
```

```r
y<-decitabine$V3
```

```
## Error in eval(expr, envir, enclos): object 'decitabine' not found
```

```r
z<-decitabine$V4
```

```
## Error in eval(expr, envir, enclos): object 'decitabine' not found
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
-2.800858, -0.9330752, -1.565071, 0, 0, 1, 1, 1,
-2.766104, 0.8216126, -1.730028, 1, 0, 0, 1, 1,
-2.747107, -1.43616, -2.180113, 1, 0, 0, 1, 1,
-2.591513, 1.978466, -1.271604, 1, 0, 0, 1, 1,
-2.452007, -0.3120811, -1.850357, 1, 0, 0, 1, 1,
-2.292648, 0.13693, -0.8720836, 1, 0, 0, 1, 1,
-2.27089, -0.5951074, -1.410072, 0, 0, 0, 1, 1,
-2.251464, 0.1337768, -0.7401988, 0, 0, 0, 1, 1,
-2.15121, 1.151744, 0.3949374, 0, 0, 0, 1, 1,
-2.134824, 0.0635619, -0.2406156, 0, 0, 0, 1, 1,
-2.09857, -1.701017, -1.336482, 0, 0, 0, 1, 1,
-2.078394, -1.13969, -0.3277282, 0, 0, 0, 1, 1,
-2.06707, 0.4725888, -2.018712, 0, 0, 0, 1, 1,
-2.036465, -0.2412402, -2.797295, 1, 1, 1, 1, 1,
-2.027798, 0.6275753, -2.600603, 1, 1, 1, 1, 1,
-2.022858, 1.298978, -1.233731, 1, 1, 1, 1, 1,
-1.99154, -0.1643313, 0.2278263, 1, 1, 1, 1, 1,
-1.981789, -1.083887, -2.774611, 1, 1, 1, 1, 1,
-1.97712, 0.8137083, -1.27758, 1, 1, 1, 1, 1,
-1.944127, 0.7100065, -0.5623134, 1, 1, 1, 1, 1,
-1.943427, 0.5101027, -1.278453, 1, 1, 1, 1, 1,
-1.942306, -0.2715244, -1.436751, 1, 1, 1, 1, 1,
-1.918075, -0.7965662, -3.003765, 1, 1, 1, 1, 1,
-1.911365, 0.3306274, -2.28024, 1, 1, 1, 1, 1,
-1.862068, 0.05615998, -2.284699, 1, 1, 1, 1, 1,
-1.790053, -0.6849628, -2.542096, 1, 1, 1, 1, 1,
-1.790033, -2.316329, -1.234729, 1, 1, 1, 1, 1,
-1.758847, -0.7267905, -2.902673, 1, 1, 1, 1, 1,
-1.725407, 0.09076624, -2.723335, 0, 0, 1, 1, 1,
-1.719154, -2.31024, -3.192415, 1, 0, 0, 1, 1,
-1.709615, 1.933736, -1.624446, 1, 0, 0, 1, 1,
-1.677712, -0.07212397, -2.301046, 1, 0, 0, 1, 1,
-1.667395, 0.9058241, -1.077646, 1, 0, 0, 1, 1,
-1.650711, 0.8858949, -0.9735235, 1, 0, 0, 1, 1,
-1.649729, 0.2813765, -0.6166179, 0, 0, 0, 1, 1,
-1.625441, 0.206056, -2.508381, 0, 0, 0, 1, 1,
-1.614191, -1.57571, -1.371024, 0, 0, 0, 1, 1,
-1.610253, -0.6256553, -4.097007, 0, 0, 0, 1, 1,
-1.609108, -0.05202604, -0.920717, 0, 0, 0, 1, 1,
-1.607322, 0.8153519, -0.8823702, 0, 0, 0, 1, 1,
-1.58824, 0.8032522, -0.3608624, 0, 0, 0, 1, 1,
-1.573708, -0.4389139, -2.812003, 1, 1, 1, 1, 1,
-1.570615, -0.2403057, -1.55728, 1, 1, 1, 1, 1,
-1.56502, 1.39977, -0.07507215, 1, 1, 1, 1, 1,
-1.56432, -0.9396288, -2.444973, 1, 1, 1, 1, 1,
-1.55757, 0.692615, -0.8955719, 1, 1, 1, 1, 1,
-1.548584, 1.199598, -2.650231, 1, 1, 1, 1, 1,
-1.545414, 1.117778, -1.368303, 1, 1, 1, 1, 1,
-1.540868, -0.2570599, -1.13223, 1, 1, 1, 1, 1,
-1.535899, 1.796402, 0.03510837, 1, 1, 1, 1, 1,
-1.520289, -1.038052, -0.1190663, 1, 1, 1, 1, 1,
-1.519557, -0.4094567, -0.532433, 1, 1, 1, 1, 1,
-1.518121, -1.111597, -2.715204, 1, 1, 1, 1, 1,
-1.502403, 2.61006, -0.5009469, 1, 1, 1, 1, 1,
-1.499365, -0.4974848, -3.184254, 1, 1, 1, 1, 1,
-1.493033, 0.321743, -1.417579, 1, 1, 1, 1, 1,
-1.492718, 0.355408, -1.225142, 0, 0, 1, 1, 1,
-1.471094, -1.337357, -3.514654, 1, 0, 0, 1, 1,
-1.468212, -0.2391961, -1.537762, 1, 0, 0, 1, 1,
-1.463317, 0.6907728, -1.276374, 1, 0, 0, 1, 1,
-1.434806, 0.01386256, -0.7085872, 1, 0, 0, 1, 1,
-1.430495, 0.1538523, -0.7364704, 1, 0, 0, 1, 1,
-1.427938, -2.171619, -3.984701, 0, 0, 0, 1, 1,
-1.401492, 1.662459, -1.773374, 0, 0, 0, 1, 1,
-1.392746, 1.150219, -1.505838, 0, 0, 0, 1, 1,
-1.371333, -0.2837474, -1.275007, 0, 0, 0, 1, 1,
-1.364679, -0.05222467, -3.41437, 0, 0, 0, 1, 1,
-1.351298, -1.121587, -3.560401, 0, 0, 0, 1, 1,
-1.35126, -0.4288264, -2.057769, 0, 0, 0, 1, 1,
-1.336383, 0.673026, -1.004614, 1, 1, 1, 1, 1,
-1.32268, 0.1662435, -0.8378299, 1, 1, 1, 1, 1,
-1.318463, -0.4289199, -2.56716, 1, 1, 1, 1, 1,
-1.317009, -0.4668176, -1.737462, 1, 1, 1, 1, 1,
-1.315255, 1.656994, 1.10505, 1, 1, 1, 1, 1,
-1.304429, 0.928961, -1.076842, 1, 1, 1, 1, 1,
-1.301772, -0.9025881, -3.746409, 1, 1, 1, 1, 1,
-1.300478, -1.581204, -1.740383, 1, 1, 1, 1, 1,
-1.29989, 0.3699621, -0.6138676, 1, 1, 1, 1, 1,
-1.293831, 0.8049358, -1.576665, 1, 1, 1, 1, 1,
-1.277788, 1.7786, -0.440652, 1, 1, 1, 1, 1,
-1.275948, -0.1870918, -3.465357, 1, 1, 1, 1, 1,
-1.27521, 0.2973459, 0.203062, 1, 1, 1, 1, 1,
-1.250485, -1.957707, -3.82752, 1, 1, 1, 1, 1,
-1.248175, -2.378543, -2.536804, 1, 1, 1, 1, 1,
-1.242887, 1.715485, -1.641026, 0, 0, 1, 1, 1,
-1.240209, 0.2277965, -1.439883, 1, 0, 0, 1, 1,
-1.238258, -1.065145, -1.793877, 1, 0, 0, 1, 1,
-1.236532, 0.5470007, -1.715717, 1, 0, 0, 1, 1,
-1.2262, -1.356464, -1.487438, 1, 0, 0, 1, 1,
-1.223839, 2.033429, -1.427906, 1, 0, 0, 1, 1,
-1.220589, -0.01883332, -1.917395, 0, 0, 0, 1, 1,
-1.219322, 0.192939, -0.8154694, 0, 0, 0, 1, 1,
-1.212814, -1.598909, -0.733824, 0, 0, 0, 1, 1,
-1.211856, -0.3915293, -2.258241, 0, 0, 0, 1, 1,
-1.211291, -1.482095, -1.954033, 0, 0, 0, 1, 1,
-1.209364, 0.1922572, -2.563082, 0, 0, 0, 1, 1,
-1.203667, -0.9683062, -1.188736, 0, 0, 0, 1, 1,
-1.199155, 0.5690952, 0.03058824, 1, 1, 1, 1, 1,
-1.195237, -0.6020018, -4.285728, 1, 1, 1, 1, 1,
-1.194675, 1.770387, -1.965983, 1, 1, 1, 1, 1,
-1.191741, -1.402533, -2.735097, 1, 1, 1, 1, 1,
-1.168854, -0.3493611, -1.318236, 1, 1, 1, 1, 1,
-1.166739, 1.042748, 0.2881646, 1, 1, 1, 1, 1,
-1.164268, -1.211985, -3.666638, 1, 1, 1, 1, 1,
-1.162578, 0.03840041, -1.746077, 1, 1, 1, 1, 1,
-1.155742, -2.1804, -1.175074, 1, 1, 1, 1, 1,
-1.1552, 1.454252, -0.6760426, 1, 1, 1, 1, 1,
-1.141803, -0.6518175, -2.03415, 1, 1, 1, 1, 1,
-1.140834, 0.2284932, -0.8932568, 1, 1, 1, 1, 1,
-1.134493, 0.08473618, -2.075365, 1, 1, 1, 1, 1,
-1.133244, -0.5734895, -4.577924, 1, 1, 1, 1, 1,
-1.13211, -1.439004, -3.838879, 1, 1, 1, 1, 1,
-1.126505, 0.4924908, -2.981209, 0, 0, 1, 1, 1,
-1.122018, -0.3154103, -2.610353, 1, 0, 0, 1, 1,
-1.110186, 0.7186128, -1.407671, 1, 0, 0, 1, 1,
-1.109381, -0.5265415, -0.2132582, 1, 0, 0, 1, 1,
-1.101482, 0.9617732, -0.8281292, 1, 0, 0, 1, 1,
-1.099158, 1.159135, -0.8664207, 1, 0, 0, 1, 1,
-1.097899, 0.1616634, -1.340408, 0, 0, 0, 1, 1,
-1.097555, 0.361709, -1.554144, 0, 0, 0, 1, 1,
-1.097288, -1.922419, -2.752864, 0, 0, 0, 1, 1,
-1.092281, 0.6292258, -1.467921, 0, 0, 0, 1, 1,
-1.091989, -0.3047416, -2.057347, 0, 0, 0, 1, 1,
-1.088317, -0.2970247, -1.378271, 0, 0, 0, 1, 1,
-1.086189, -0.9567667, -2.437329, 0, 0, 0, 1, 1,
-1.085524, -0.6920499, -2.890357, 1, 1, 1, 1, 1,
-1.080481, 0.3606168, -2.490574, 1, 1, 1, 1, 1,
-1.066863, -0.6674265, -2.030562, 1, 1, 1, 1, 1,
-1.063258, -0.2452512, -1.194217, 1, 1, 1, 1, 1,
-1.059303, -2.000735, -2.180813, 1, 1, 1, 1, 1,
-1.056568, -0.8050543, -3.213295, 1, 1, 1, 1, 1,
-1.055768, 0.06421268, -0.8091127, 1, 1, 1, 1, 1,
-1.053795, -0.5394489, -2.515476, 1, 1, 1, 1, 1,
-1.047071, 1.156412, -0.753979, 1, 1, 1, 1, 1,
-1.043757, -0.4318238, 0.2673042, 1, 1, 1, 1, 1,
-1.039584, -0.04440463, -1.081465, 1, 1, 1, 1, 1,
-1.038447, -0.4566153, 0.1804832, 1, 1, 1, 1, 1,
-1.03788, 0.5142553, -1.535627, 1, 1, 1, 1, 1,
-1.021317, 0.2332128, -2.016769, 1, 1, 1, 1, 1,
-1.019269, 0.8174388, -2.773512, 1, 1, 1, 1, 1,
-1.018309, -0.7112257, -2.118765, 0, 0, 1, 1, 1,
-1.017012, -0.04865953, -1.958084, 1, 0, 0, 1, 1,
-1.01308, -0.0519072, -1.631627, 1, 0, 0, 1, 1,
-1.012301, 1.071711, -1.181342, 1, 0, 0, 1, 1,
-1.007426, 0.136084, -1.453601, 1, 0, 0, 1, 1,
-1.001223, -2.134861, -1.743025, 1, 0, 0, 1, 1,
-0.993513, -0.2608678, -1.22662, 0, 0, 0, 1, 1,
-0.992713, -0.6928211, -2.163407, 0, 0, 0, 1, 1,
-0.9918852, 0.2619631, -1.149896, 0, 0, 0, 1, 1,
-0.991442, 0.2787617, -0.1008735, 0, 0, 0, 1, 1,
-0.9883571, 1.033195, -1.064788, 0, 0, 0, 1, 1,
-0.9858181, 1.036651, -1.493624, 0, 0, 0, 1, 1,
-0.982473, -0.6053768, -4.133537, 0, 0, 0, 1, 1,
-0.9815659, 1.023997, -1.215124, 1, 1, 1, 1, 1,
-0.9797408, -1.225937, -3.293987, 1, 1, 1, 1, 1,
-0.9788561, -0.2127531, -0.5032408, 1, 1, 1, 1, 1,
-0.9698116, 0.4809839, 0.6065884, 1, 1, 1, 1, 1,
-0.9580451, -0.8947969, -4.353513, 1, 1, 1, 1, 1,
-0.9578308, -0.8244715, -3.377577, 1, 1, 1, 1, 1,
-0.956847, -2.070435, -4.175018, 1, 1, 1, 1, 1,
-0.9499023, -1.127148, -2.995435, 1, 1, 1, 1, 1,
-0.9448097, 1.555979, 0.3234845, 1, 1, 1, 1, 1,
-0.9406769, 1.637081, -0.4491371, 1, 1, 1, 1, 1,
-0.9378539, 0.7543011, -0.6988929, 1, 1, 1, 1, 1,
-0.9373354, 0.1159186, -2.197364, 1, 1, 1, 1, 1,
-0.9327479, -1.749494, -1.401981, 1, 1, 1, 1, 1,
-0.9322637, -0.119763, -3.399576, 1, 1, 1, 1, 1,
-0.93032, 0.5062746, -1.302032, 1, 1, 1, 1, 1,
-0.9228343, 2.188648, 0.1256324, 0, 0, 1, 1, 1,
-0.9126777, -0.4195102, -2.091584, 1, 0, 0, 1, 1,
-0.9109588, 2.265538, -1.341121, 1, 0, 0, 1, 1,
-0.9106979, 0.8765233, -1.013232, 1, 0, 0, 1, 1,
-0.9097077, 1.242688, 0.1113439, 1, 0, 0, 1, 1,
-0.9030023, 0.5103619, -2.985332, 1, 0, 0, 1, 1,
-0.8955963, 0.181414, -2.88775, 0, 0, 0, 1, 1,
-0.8947616, 0.4325671, -0.8248507, 0, 0, 0, 1, 1,
-0.8919097, -0.1849087, -3.421764, 0, 0, 0, 1, 1,
-0.889334, 0.7891426, -2.322676, 0, 0, 0, 1, 1,
-0.8892327, -0.2406594, -1.784727, 0, 0, 0, 1, 1,
-0.8889177, 0.6394104, -0.8284437, 0, 0, 0, 1, 1,
-0.8783211, 1.469961, 0.9869348, 0, 0, 0, 1, 1,
-0.8716937, 0.1165736, -1.823798, 1, 1, 1, 1, 1,
-0.8656712, -1.244416, -2.043443, 1, 1, 1, 1, 1,
-0.8629788, 0.6224239, 0.657852, 1, 1, 1, 1, 1,
-0.8616305, -0.7728477, -0.9332179, 1, 1, 1, 1, 1,
-0.8581856, -1.167924, -2.199372, 1, 1, 1, 1, 1,
-0.8580707, 1.795031, -1.860769, 1, 1, 1, 1, 1,
-0.8562985, -0.9371666, -0.8903149, 1, 1, 1, 1, 1,
-0.8562109, 0.7469467, -0.313602, 1, 1, 1, 1, 1,
-0.8556795, -0.05423967, -1.871475, 1, 1, 1, 1, 1,
-0.8522217, 1.391268, -1.692595, 1, 1, 1, 1, 1,
-0.8426509, -1.061839, -3.92222, 1, 1, 1, 1, 1,
-0.8412934, 0.145548, -1.270283, 1, 1, 1, 1, 1,
-0.8379178, -0.3326248, -1.978394, 1, 1, 1, 1, 1,
-0.8360522, 1.181643, 0.2788103, 1, 1, 1, 1, 1,
-0.8335657, -0.1691265, -2.326276, 1, 1, 1, 1, 1,
-0.8327822, -0.3228971, -2.109498, 0, 0, 1, 1, 1,
-0.8327052, -0.3904737, -2.681918, 1, 0, 0, 1, 1,
-0.8321676, 0.07221674, -1.015275, 1, 0, 0, 1, 1,
-0.8316836, 0.1866259, -1.046316, 1, 0, 0, 1, 1,
-0.8264237, -1.337136, -2.721178, 1, 0, 0, 1, 1,
-0.8084131, -0.8804091, -4.756659, 1, 0, 0, 1, 1,
-0.8074564, 0.2543001, -0.3338909, 0, 0, 0, 1, 1,
-0.8069048, -0.02333305, -0.6816516, 0, 0, 0, 1, 1,
-0.80626, 0.1465428, -2.413588, 0, 0, 0, 1, 1,
-0.8013994, -0.2561217, -1.311074, 0, 0, 0, 1, 1,
-0.7935554, -0.6218684, -2.790178, 0, 0, 0, 1, 1,
-0.7829301, 0.1446698, -1.752636, 0, 0, 0, 1, 1,
-0.7552742, -0.5625273, -1.816192, 0, 0, 0, 1, 1,
-0.7541925, 1.206854, -0.3614258, 1, 1, 1, 1, 1,
-0.750765, 0.6426802, -1.461982, 1, 1, 1, 1, 1,
-0.7507212, 0.08243117, -3.083784, 1, 1, 1, 1, 1,
-0.7422212, 0.1335855, -0.2231164, 1, 1, 1, 1, 1,
-0.7409422, -2.109659, -1.654786, 1, 1, 1, 1, 1,
-0.7397512, 0.1555007, -1.473242, 1, 1, 1, 1, 1,
-0.7395896, -1.707308, -2.425607, 1, 1, 1, 1, 1,
-0.7391972, -0.2353754, -2.694311, 1, 1, 1, 1, 1,
-0.7382209, -0.5311579, -1.39187, 1, 1, 1, 1, 1,
-0.7365601, 0.7675963, 0.1045908, 1, 1, 1, 1, 1,
-0.7324668, 0.8061463, 0.8968648, 1, 1, 1, 1, 1,
-0.730955, 0.7510628, -1.701077, 1, 1, 1, 1, 1,
-0.7264839, -1.309892, -2.983579, 1, 1, 1, 1, 1,
-0.7236562, 1.743923, -1.647128, 1, 1, 1, 1, 1,
-0.7227584, -1.289233, -3.00191, 1, 1, 1, 1, 1,
-0.7219124, -0.4530736, -1.196371, 0, 0, 1, 1, 1,
-0.715712, -0.1179578, -0.9535198, 1, 0, 0, 1, 1,
-0.7136059, 1.042222, -0.04288768, 1, 0, 0, 1, 1,
-0.7049477, 0.919434, -1.71057, 1, 0, 0, 1, 1,
-0.7016457, 0.5140274, -1.69952, 1, 0, 0, 1, 1,
-0.699479, -0.7776625, -2.401115, 1, 0, 0, 1, 1,
-0.6855862, 0.9428158, -1.547862, 0, 0, 0, 1, 1,
-0.6847822, -0.3242766, -3.005184, 0, 0, 0, 1, 1,
-0.6831313, 0.07254727, -0.1421941, 0, 0, 0, 1, 1,
-0.6824821, -1.110203, -2.666193, 0, 0, 0, 1, 1,
-0.6764395, 1.028759, -0.01689852, 0, 0, 0, 1, 1,
-0.6759136, -0.2515334, -2.632047, 0, 0, 0, 1, 1,
-0.6758692, 1.045698, -2.308058, 0, 0, 0, 1, 1,
-0.6701465, -1.475551, -1.27091, 1, 1, 1, 1, 1,
-0.6669156, 0.8736132, -0.2115855, 1, 1, 1, 1, 1,
-0.6561076, 2.188991, -0.6248796, 1, 1, 1, 1, 1,
-0.6559622, -0.6852412, -3.14348, 1, 1, 1, 1, 1,
-0.6516087, -0.4813948, -2.617494, 1, 1, 1, 1, 1,
-0.6496869, -0.1483736, -1.755139, 1, 1, 1, 1, 1,
-0.64813, -0.1412383, -1.536473, 1, 1, 1, 1, 1,
-0.6480693, 0.2923622, -1.935505, 1, 1, 1, 1, 1,
-0.6467162, -0.4581382, -2.29766, 1, 1, 1, 1, 1,
-0.6397813, 0.9871932, -0.3650183, 1, 1, 1, 1, 1,
-0.6389709, -0.06644561, -3.004049, 1, 1, 1, 1, 1,
-0.6361874, 1.7361, 0.2896953, 1, 1, 1, 1, 1,
-0.6285483, -0.369436, -1.963234, 1, 1, 1, 1, 1,
-0.6269006, 0.9592188, -0.01468537, 1, 1, 1, 1, 1,
-0.6261192, -1.487959, -2.780442, 1, 1, 1, 1, 1,
-0.6245436, -0.02533287, -1.426889, 0, 0, 1, 1, 1,
-0.6240811, -0.02097522, -1.031322, 1, 0, 0, 1, 1,
-0.6237049, -1.790783, -1.524084, 1, 0, 0, 1, 1,
-0.6200767, 0.6112193, -2.079066, 1, 0, 0, 1, 1,
-0.6199877, -0.8733155, -2.747556, 1, 0, 0, 1, 1,
-0.6193889, 0.8159506, -1.138011, 1, 0, 0, 1, 1,
-0.6187128, -1.878246, -2.113732, 0, 0, 0, 1, 1,
-0.6186656, -1.102315, -3.209316, 0, 0, 0, 1, 1,
-0.6186061, -1.644273, -4.225497, 0, 0, 0, 1, 1,
-0.6173568, -0.3725016, -2.767485, 0, 0, 0, 1, 1,
-0.6122805, 0.7972215, -1.48751, 0, 0, 0, 1, 1,
-0.6107171, 1.499927, 0.139146, 0, 0, 0, 1, 1,
-0.6099786, 0.372326, -0.1495653, 0, 0, 0, 1, 1,
-0.6093138, -0.2072088, -3.216532, 1, 1, 1, 1, 1,
-0.6091299, -0.1335058, -1.656253, 1, 1, 1, 1, 1,
-0.6058019, 1.728961, -0.9036737, 1, 1, 1, 1, 1,
-0.6053125, -0.4511331, -2.993327, 1, 1, 1, 1, 1,
-0.6033773, -1.232424, -1.842783, 1, 1, 1, 1, 1,
-0.6014209, 1.047065, 1.699803, 1, 1, 1, 1, 1,
-0.5860389, -0.09109189, -2.241569, 1, 1, 1, 1, 1,
-0.5790776, 0.1350368, -1.007967, 1, 1, 1, 1, 1,
-0.5773361, 0.1033536, -1.475764, 1, 1, 1, 1, 1,
-0.5771996, -0.2926813, -3.724176, 1, 1, 1, 1, 1,
-0.5710521, -0.3949468, -1.835032, 1, 1, 1, 1, 1,
-0.5623202, -1.013437, 0.127118, 1, 1, 1, 1, 1,
-0.5605456, 0.169846, -1.086277, 1, 1, 1, 1, 1,
-0.556866, 0.1380881, -1.292356, 1, 1, 1, 1, 1,
-0.5513991, -0.3417187, -1.118575, 1, 1, 1, 1, 1,
-0.5509242, -1.646518, -3.712943, 0, 0, 1, 1, 1,
-0.5442447, -0.6671839, -4.930803, 1, 0, 0, 1, 1,
-0.5412483, 0.8325052, 0.3668718, 1, 0, 0, 1, 1,
-0.5395735, 1.200909, -1.708414, 1, 0, 0, 1, 1,
-0.5390887, 0.7711574, -0.7882707, 1, 0, 0, 1, 1,
-0.5330225, 0.344282, -0.8118722, 1, 0, 0, 1, 1,
-0.5293469, 1.392542, 0.5322649, 0, 0, 0, 1, 1,
-0.528855, 0.9997513, -2.149071, 0, 0, 0, 1, 1,
-0.5271767, -1.710479, -3.918343, 0, 0, 0, 1, 1,
-0.5239688, 0.9683155, 0.2640868, 0, 0, 0, 1, 1,
-0.5197213, -2.55237, -3.333253, 0, 0, 0, 1, 1,
-0.5196244, 1.442506, 0.1615475, 0, 0, 0, 1, 1,
-0.5189093, -2.539499, -2.949901, 0, 0, 0, 1, 1,
-0.5182893, -0.1735298, -1.834703, 1, 1, 1, 1, 1,
-0.5159304, 0.5969316, -2.975799, 1, 1, 1, 1, 1,
-0.5140014, 1.538403, 1.221179, 1, 1, 1, 1, 1,
-0.5122896, -0.2896648, -1.517849, 1, 1, 1, 1, 1,
-0.5122254, 1.18923, 0.5293097, 1, 1, 1, 1, 1,
-0.5079442, 0.7476236, -0.7011871, 1, 1, 1, 1, 1,
-0.5023998, -0.3152871, -0.9081714, 1, 1, 1, 1, 1,
-0.5012718, 0.1110611, -2.980963, 1, 1, 1, 1, 1,
-0.4998801, 0.4234851, -0.1806825, 1, 1, 1, 1, 1,
-0.4978217, 0.9065157, -0.2045367, 1, 1, 1, 1, 1,
-0.487245, 0.1832859, -1.080017, 1, 1, 1, 1, 1,
-0.47706, 0.5368826, -0.8263877, 1, 1, 1, 1, 1,
-0.4731159, -1.19368, -0.7558914, 1, 1, 1, 1, 1,
-0.4710966, 0.06012776, -0.3765967, 1, 1, 1, 1, 1,
-0.4698347, 0.5084557, -0.1375897, 1, 1, 1, 1, 1,
-0.4614919, -0.8503788, -1.686601, 0, 0, 1, 1, 1,
-0.4607636, -0.2650268, -2.662608, 1, 0, 0, 1, 1,
-0.4603402, -1.346534, -0.6367214, 1, 0, 0, 1, 1,
-0.4554115, -0.8846557, -4.234, 1, 0, 0, 1, 1,
-0.4540755, 1.808816, 0.8449744, 1, 0, 0, 1, 1,
-0.4531052, 0.5287395, -0.4309314, 1, 0, 0, 1, 1,
-0.4468134, 0.8445134, 0.1669547, 0, 0, 0, 1, 1,
-0.4468084, -0.5757373, -2.447499, 0, 0, 0, 1, 1,
-0.4435237, 1.874274, 1.206531, 0, 0, 0, 1, 1,
-0.4412703, -0.03468454, -0.2980904, 0, 0, 0, 1, 1,
-0.4305149, 0.933758, 0.9970682, 0, 0, 0, 1, 1,
-0.4245111, 0.370922, -2.258164, 0, 0, 0, 1, 1,
-0.4216646, -0.559366, -2.600823, 0, 0, 0, 1, 1,
-0.4213149, 0.02276738, -2.343818, 1, 1, 1, 1, 1,
-0.4154652, -1.478854, -2.167595, 1, 1, 1, 1, 1,
-0.4153813, 1.162791, -0.2890296, 1, 1, 1, 1, 1,
-0.4135304, -1.334364, -2.844546, 1, 1, 1, 1, 1,
-0.4095925, -0.8623045, -1.712189, 1, 1, 1, 1, 1,
-0.4051757, 1.148604, -1.037285, 1, 1, 1, 1, 1,
-0.4049301, 0.4999835, -0.6324381, 1, 1, 1, 1, 1,
-0.3999518, 0.03229397, -2.818301, 1, 1, 1, 1, 1,
-0.399516, 1.198017, -2.698102, 1, 1, 1, 1, 1,
-0.3943083, -0.9896531, -1.349121, 1, 1, 1, 1, 1,
-0.3927796, -1.52256, -4.499403, 1, 1, 1, 1, 1,
-0.3888047, -0.4873027, -3.037735, 1, 1, 1, 1, 1,
-0.3870155, 0.924632, -1.360693, 1, 1, 1, 1, 1,
-0.3843039, -0.9661356, -2.930072, 1, 1, 1, 1, 1,
-0.3782941, -1.315652, -3.78769, 1, 1, 1, 1, 1,
-0.3769855, -0.1495716, -1.426485, 0, 0, 1, 1, 1,
-0.3756854, -0.5319607, -3.442274, 1, 0, 0, 1, 1,
-0.3720541, -0.462912, -3.359258, 1, 0, 0, 1, 1,
-0.3695348, -0.09795635, -2.003569, 1, 0, 0, 1, 1,
-0.3681163, 0.6470437, -0.2610484, 1, 0, 0, 1, 1,
-0.3671734, -1.989225, -3.522274, 1, 0, 0, 1, 1,
-0.3668336, 0.6258286, -0.7923967, 0, 0, 0, 1, 1,
-0.3629019, -1.241832, -2.494664, 0, 0, 0, 1, 1,
-0.3588459, 0.4908763, 0.8248339, 0, 0, 0, 1, 1,
-0.3556603, 0.6426155, -0.9402865, 0, 0, 0, 1, 1,
-0.3477311, 0.1312499, -2.17165, 0, 0, 0, 1, 1,
-0.3401465, -0.09774945, -0.7227776, 0, 0, 0, 1, 1,
-0.3317574, 0.03795864, -1.778017, 0, 0, 0, 1, 1,
-0.3299839, 1.295156, -0.4059993, 1, 1, 1, 1, 1,
-0.3276306, -1.237432, -3.372828, 1, 1, 1, 1, 1,
-0.3267384, -0.753756, -3.004243, 1, 1, 1, 1, 1,
-0.3213975, 0.8581163, -1.66252, 1, 1, 1, 1, 1,
-0.3179287, -1.276153, -3.357552, 1, 1, 1, 1, 1,
-0.3178005, -0.8062029, -2.608728, 1, 1, 1, 1, 1,
-0.3139519, -2.404521, -3.710471, 1, 1, 1, 1, 1,
-0.3079709, -1.06888, -2.071602, 1, 1, 1, 1, 1,
-0.3079683, -1.860273, -1.726334, 1, 1, 1, 1, 1,
-0.3038273, -1.705287, -2.365304, 1, 1, 1, 1, 1,
-0.3003404, -0.5449176, -2.398699, 1, 1, 1, 1, 1,
-0.3001156, -0.4213956, -2.24245, 1, 1, 1, 1, 1,
-0.3000495, 1.420693, -1.096268, 1, 1, 1, 1, 1,
-0.2979853, 0.9060074, -1.667977, 1, 1, 1, 1, 1,
-0.2960922, 1.703074, -0.4206128, 1, 1, 1, 1, 1,
-0.2850725, 0.3334245, -1.164009, 0, 0, 1, 1, 1,
-0.2841565, -0.4876106, -2.365321, 1, 0, 0, 1, 1,
-0.2834257, 1.282835, -0.3332827, 1, 0, 0, 1, 1,
-0.2831489, -0.948795, -1.987019, 1, 0, 0, 1, 1,
-0.2825099, 1.03551, -0.7045846, 1, 0, 0, 1, 1,
-0.2790221, 0.3770751, -1.150872, 1, 0, 0, 1, 1,
-0.2789763, -0.1166715, -2.998982, 0, 0, 0, 1, 1,
-0.2730321, 0.03837745, -1.667944, 0, 0, 0, 1, 1,
-0.272127, 3.105555, 0.3172806, 0, 0, 0, 1, 1,
-0.2718142, -2.234354, -2.398453, 0, 0, 0, 1, 1,
-0.2645344, -0.4951973, -2.782324, 0, 0, 0, 1, 1,
-0.2622613, 0.5002289, -0.4681923, 0, 0, 0, 1, 1,
-0.2608593, -2.573579, -2.865599, 0, 0, 0, 1, 1,
-0.2597821, 0.7808133, -0.2829498, 1, 1, 1, 1, 1,
-0.2591712, 1.990347, 0.3274271, 1, 1, 1, 1, 1,
-0.2567206, -0.884554, -1.967134, 1, 1, 1, 1, 1,
-0.2557685, 1.560732, -0.3052835, 1, 1, 1, 1, 1,
-0.2446525, -0.4881324, -3.888612, 1, 1, 1, 1, 1,
-0.2422576, 0.2016756, 0.0449058, 1, 1, 1, 1, 1,
-0.2370094, 0.8107668, -0.3348055, 1, 1, 1, 1, 1,
-0.234572, -0.03747613, -0.7770045, 1, 1, 1, 1, 1,
-0.232105, 0.4065154, 0.1468316, 1, 1, 1, 1, 1,
-0.2243169, 0.5831802, -0.6066306, 1, 1, 1, 1, 1,
-0.2197842, -0.6957867, -2.890405, 1, 1, 1, 1, 1,
-0.2163661, -0.3002532, 0.7862908, 1, 1, 1, 1, 1,
-0.2161397, -0.1376321, -2.979503, 1, 1, 1, 1, 1,
-0.2158955, 0.2818887, -1.543034, 1, 1, 1, 1, 1,
-0.2155411, 0.09574945, -1.422264, 1, 1, 1, 1, 1,
-0.2114989, -1.972539, -2.502954, 0, 0, 1, 1, 1,
-0.2098667, -0.7034832, -1.64223, 1, 0, 0, 1, 1,
-0.2039094, -2.019881, -3.645504, 1, 0, 0, 1, 1,
-0.2025691, 0.6916476, 0.007310113, 1, 0, 0, 1, 1,
-0.2018219, 0.5009094, -0.8324571, 1, 0, 0, 1, 1,
-0.2017615, 0.419609, 0.02224315, 1, 0, 0, 1, 1,
-0.2016953, 0.441289, 0.7386789, 0, 0, 0, 1, 1,
-0.1999478, 0.5897893, -0.9173464, 0, 0, 0, 1, 1,
-0.1956853, 0.4881819, -1.340639, 0, 0, 0, 1, 1,
-0.1930616, -1.062221, -2.588898, 0, 0, 0, 1, 1,
-0.190936, -0.4103046, -3.158715, 0, 0, 0, 1, 1,
-0.1849114, 2.154884, 0.3224155, 0, 0, 0, 1, 1,
-0.1806161, -1.370942, -4.384532, 0, 0, 0, 1, 1,
-0.1774188, -1.392983, -2.442659, 1, 1, 1, 1, 1,
-0.1768865, 0.2754697, 0.2412558, 1, 1, 1, 1, 1,
-0.1732826, -0.6154357, -2.407475, 1, 1, 1, 1, 1,
-0.1728155, 0.9234419, -0.3097792, 1, 1, 1, 1, 1,
-0.1707129, -0.9079864, -3.726901, 1, 1, 1, 1, 1,
-0.1696157, 0.5811008, -0.7257478, 1, 1, 1, 1, 1,
-0.168949, -0.9962732, -3.043335, 1, 1, 1, 1, 1,
-0.1611367, -0.3601463, -1.941314, 1, 1, 1, 1, 1,
-0.1597799, -0.02733075, -1.984682, 1, 1, 1, 1, 1,
-0.1580157, 0.2635621, -0.962126, 1, 1, 1, 1, 1,
-0.1448568, 0.969009, -0.002041611, 1, 1, 1, 1, 1,
-0.1409338, -0.5211438, -3.113599, 1, 1, 1, 1, 1,
-0.139803, -0.4142755, -3.387671, 1, 1, 1, 1, 1,
-0.1380989, -1.914956, -4.356049, 1, 1, 1, 1, 1,
-0.1323239, 0.4565836, -0.07942647, 1, 1, 1, 1, 1,
-0.1295861, -0.07205354, -2.645254, 0, 0, 1, 1, 1,
-0.1291222, -0.9791824, -1.549865, 1, 0, 0, 1, 1,
-0.1288951, -1.384968, -3.73641, 1, 0, 0, 1, 1,
-0.1283575, 0.7539995, -1.954191, 1, 0, 0, 1, 1,
-0.1283543, -1.50818, -3.105058, 1, 0, 0, 1, 1,
-0.1280884, 0.5520671, -1.089937, 1, 0, 0, 1, 1,
-0.1227047, 0.8300672, -0.9776769, 0, 0, 0, 1, 1,
-0.1180735, -0.3708137, -2.536676, 0, 0, 0, 1, 1,
-0.1179464, -1.692987, -4.056511, 0, 0, 0, 1, 1,
-0.1177699, 0.3590915, -1.122026, 0, 0, 0, 1, 1,
-0.1140458, -0.04153853, -1.526152, 0, 0, 0, 1, 1,
-0.1128742, 0.4349841, -0.636894, 0, 0, 0, 1, 1,
-0.1093787, -0.06699289, -2.772089, 0, 0, 0, 1, 1,
-0.1062649, 0.712377, 1.149857, 1, 1, 1, 1, 1,
-0.102984, -1.273322, -3.712035, 1, 1, 1, 1, 1,
-0.1005428, 0.285389, -0.3860151, 1, 1, 1, 1, 1,
-0.1000374, 0.96134, -2.193988, 1, 1, 1, 1, 1,
-0.09905185, -0.1702649, -2.846125, 1, 1, 1, 1, 1,
-0.09670223, 2.202888, -1.094576, 1, 1, 1, 1, 1,
-0.09455044, -0.5846841, -3.33478, 1, 1, 1, 1, 1,
-0.09008591, 1.120613, 0.6468868, 1, 1, 1, 1, 1,
-0.08927646, -0.06659859, -2.23738, 1, 1, 1, 1, 1,
-0.0889907, -0.03172036, -3.251537, 1, 1, 1, 1, 1,
-0.08840372, 0.1448156, -0.1969777, 1, 1, 1, 1, 1,
-0.08820264, 0.2987168, -0.1475818, 1, 1, 1, 1, 1,
-0.08814807, -0.5242231, -3.37507, 1, 1, 1, 1, 1,
-0.0871472, 1.658838, -1.114021, 1, 1, 1, 1, 1,
-0.08691557, 0.5148124, -0.467106, 1, 1, 1, 1, 1,
-0.08166397, 2.070366, 1.886337, 0, 0, 1, 1, 1,
-0.08131579, -1.143112, -2.432739, 1, 0, 0, 1, 1,
-0.08066128, 0.1377774, -0.4074243, 1, 0, 0, 1, 1,
-0.07854878, -0.509189, -4.055007, 1, 0, 0, 1, 1,
-0.07372714, 0.2281913, -0.4740575, 1, 0, 0, 1, 1,
-0.07307059, -1.521531, -2.149712, 1, 0, 0, 1, 1,
-0.06963161, 0.738491, 1.585157, 0, 0, 0, 1, 1,
-0.06561901, 0.7006173, 0.2729383, 0, 0, 0, 1, 1,
-0.06398422, -1.229871, -3.326701, 0, 0, 0, 1, 1,
-0.06296053, 0.5614149, 0.7264184, 0, 0, 0, 1, 1,
-0.05957757, -2.114286, -2.591265, 0, 0, 0, 1, 1,
-0.05882227, -0.6013328, -3.332509, 0, 0, 0, 1, 1,
-0.05696642, 0.546237, 0.5507228, 0, 0, 0, 1, 1,
-0.05632227, 0.5570305, -2.249165, 1, 1, 1, 1, 1,
-0.0501303, -2.980053, -2.563591, 1, 1, 1, 1, 1,
-0.04894948, -0.3114495, -2.000587, 1, 1, 1, 1, 1,
-0.04879485, -1.671418, -3.176841, 1, 1, 1, 1, 1,
-0.04742608, 0.4992073, -0.7773958, 1, 1, 1, 1, 1,
-0.04622373, 0.8480495, 0.307568, 1, 1, 1, 1, 1,
-0.04460112, -1.004006, -3.11062, 1, 1, 1, 1, 1,
-0.04160425, 2.676403, -0.1386763, 1, 1, 1, 1, 1,
-0.0415308, -0.905821, -4.578851, 1, 1, 1, 1, 1,
-0.0395766, -1.375526, -3.589878, 1, 1, 1, 1, 1,
-0.0374462, -0.6274495, -1.991973, 1, 1, 1, 1, 1,
-0.03693362, 0.06045149, -1.176351, 1, 1, 1, 1, 1,
-0.03456242, 0.02636125, -2.240252, 1, 1, 1, 1, 1,
-0.03448568, -0.5009518, -3.147477, 1, 1, 1, 1, 1,
-0.0344577, 1.844344, -1.070476, 1, 1, 1, 1, 1,
-0.03394706, -0.6338594, -4.454536, 0, 0, 1, 1, 1,
-0.03291144, -1.329126, -3.464602, 1, 0, 0, 1, 1,
-0.03068823, -2.070696, -2.861907, 1, 0, 0, 1, 1,
-0.02992443, 1.147844, -1.183274, 1, 0, 0, 1, 1,
-0.02733936, -0.2053411, -2.353655, 1, 0, 0, 1, 1,
-0.02386283, 0.7145437, 1.771125, 1, 0, 0, 1, 1,
-0.01832625, 0.9614989, 0.5927469, 0, 0, 0, 1, 1,
-0.01613214, 0.1120862, 0.8810302, 0, 0, 0, 1, 1,
-0.01284085, 1.757655, 0.4098316, 0, 0, 0, 1, 1,
-0.009794171, 0.4679811, 0.7137057, 0, 0, 0, 1, 1,
-0.008689021, -1.483142, -3.315552, 0, 0, 0, 1, 1,
-0.008042956, 0.9174908, 0.7599388, 0, 0, 0, 1, 1,
-0.005162747, 0.2354637, -0.3260919, 0, 0, 0, 1, 1,
-0.001713355, -0.0624019, -2.474713, 1, 1, 1, 1, 1,
0.00155018, 1.088461, 1.624135, 1, 1, 1, 1, 1,
0.003408114, -0.2256568, 1.977316, 1, 1, 1, 1, 1,
0.004404123, -0.7078562, 1.261414, 1, 1, 1, 1, 1,
0.005287443, -0.3509446, 2.466577, 1, 1, 1, 1, 1,
0.005650581, 0.154954, -0.4717071, 1, 1, 1, 1, 1,
0.005974496, 0.1261775, 0.7334329, 1, 1, 1, 1, 1,
0.009181862, 0.4603887, 2.456125, 1, 1, 1, 1, 1,
0.01543169, -0.2056422, 4.92221, 1, 1, 1, 1, 1,
0.01644404, -1.159436, 2.518345, 1, 1, 1, 1, 1,
0.02008072, -0.965645, 3.449313, 1, 1, 1, 1, 1,
0.02255137, 1.594943, -0.01547981, 1, 1, 1, 1, 1,
0.024483, 1.854491, -0.1108887, 1, 1, 1, 1, 1,
0.02967254, 0.2807652, 1.736091, 1, 1, 1, 1, 1,
0.03459432, 1.354293, -0.5231103, 1, 1, 1, 1, 1,
0.0348707, 0.05417979, 1.1363, 0, 0, 1, 1, 1,
0.03953657, -1.055364, 3.237736, 1, 0, 0, 1, 1,
0.04036254, 0.7081759, 0.1577906, 1, 0, 0, 1, 1,
0.04150788, -1.427244, 4.119815, 1, 0, 0, 1, 1,
0.0416136, 0.3529918, 0.8331084, 1, 0, 0, 1, 1,
0.0468064, -0.9546773, 4.430095, 1, 0, 0, 1, 1,
0.04770057, -3.136728, 4.098995, 0, 0, 0, 1, 1,
0.04902072, -0.4155039, 2.863271, 0, 0, 0, 1, 1,
0.05114662, 1.283068, -1.512561, 0, 0, 0, 1, 1,
0.05212834, 1.139633, 0.7023641, 0, 0, 0, 1, 1,
0.05246381, 0.9182694, 1.119292, 0, 0, 0, 1, 1,
0.05488001, -1.204126, 2.488115, 0, 0, 0, 1, 1,
0.06126282, -0.08615228, 2.33964, 0, 0, 0, 1, 1,
0.06167562, -1.234913, 2.444472, 1, 1, 1, 1, 1,
0.06375099, -0.07787073, 1.746993, 1, 1, 1, 1, 1,
0.06773606, 0.4141554, 1.244071, 1, 1, 1, 1, 1,
0.06992069, -0.01923818, 1.468348, 1, 1, 1, 1, 1,
0.0705466, -1.255316, 3.338739, 1, 1, 1, 1, 1,
0.0801484, 0.9238732, -0.5265982, 1, 1, 1, 1, 1,
0.09556711, 1.446973, 0.953526, 1, 1, 1, 1, 1,
0.09671774, 0.5728108, 0.489638, 1, 1, 1, 1, 1,
0.1042122, 1.033239, 1.034914, 1, 1, 1, 1, 1,
0.1042697, -0.9528025, 4.138186, 1, 1, 1, 1, 1,
0.1074011, -0.741828, 1.855699, 1, 1, 1, 1, 1,
0.1085518, 0.1211688, 1.695967, 1, 1, 1, 1, 1,
0.1092447, 0.4596542, -0.8004487, 1, 1, 1, 1, 1,
0.1097237, -0.3067001, 3.440356, 1, 1, 1, 1, 1,
0.116376, 0.3895133, 0.234731, 1, 1, 1, 1, 1,
0.1214647, -0.06588078, 4.016181, 0, 0, 1, 1, 1,
0.1215521, -2.127963, 2.177311, 1, 0, 0, 1, 1,
0.1293946, -1.01571, 3.997018, 1, 0, 0, 1, 1,
0.1313871, -0.3695824, 2.494425, 1, 0, 0, 1, 1,
0.1363227, 1.149914, 0.801515, 1, 0, 0, 1, 1,
0.1393438, 1.45623, 1.353918, 1, 0, 0, 1, 1,
0.1432466, -1.400813, 2.427812, 0, 0, 0, 1, 1,
0.1533538, 0.2640503, 1.336064, 0, 0, 0, 1, 1,
0.1623141, -1.443063, 2.678196, 0, 0, 0, 1, 1,
0.1623447, 0.358348, 2.269037, 0, 0, 0, 1, 1,
0.1643339, 1.545743, 0.5002955, 0, 0, 0, 1, 1,
0.1645844, -0.9566523, 1.961454, 0, 0, 0, 1, 1,
0.1649054, -0.07934503, 1.909418, 0, 0, 0, 1, 1,
0.1675961, 0.1519331, 0.9626004, 1, 1, 1, 1, 1,
0.1686374, 1.271829, 0.7426778, 1, 1, 1, 1, 1,
0.1716972, 1.658344, -1.08823, 1, 1, 1, 1, 1,
0.1791894, 0.8818936, -1.582921, 1, 1, 1, 1, 1,
0.1796162, -0.464773, 2.11747, 1, 1, 1, 1, 1,
0.1834827, 0.07200601, 1.023296, 1, 1, 1, 1, 1,
0.1853201, 0.7273664, -1.50589, 1, 1, 1, 1, 1,
0.1859509, 0.6500555, 1.006864, 1, 1, 1, 1, 1,
0.1937169, -0.585598, 1.863143, 1, 1, 1, 1, 1,
0.1937573, -0.1154223, 1.039904, 1, 1, 1, 1, 1,
0.1995549, 0.6484808, 0.1681457, 1, 1, 1, 1, 1,
0.1997941, 0.6982971, 0.5499728, 1, 1, 1, 1, 1,
0.2009324, 0.0237486, 1.517533, 1, 1, 1, 1, 1,
0.2073807, -0.4166061, 2.208261, 1, 1, 1, 1, 1,
0.2094802, -0.1320968, 1.334935, 1, 1, 1, 1, 1,
0.2138072, 0.432015, -0.8972102, 0, 0, 1, 1, 1,
0.2145205, -0.4099434, 2.940087, 1, 0, 0, 1, 1,
0.2148696, -1.116935, 3.065644, 1, 0, 0, 1, 1,
0.2181373, -1.475468, 3.616963, 1, 0, 0, 1, 1,
0.2184397, -0.6197641, 1.44262, 1, 0, 0, 1, 1,
0.2207762, -0.7619687, 3.159404, 1, 0, 0, 1, 1,
0.2311066, 0.7153285, 2.33322, 0, 0, 0, 1, 1,
0.2321475, -0.4101173, 3.660716, 0, 0, 0, 1, 1,
0.2345027, 1.704238, 0.5597696, 0, 0, 0, 1, 1,
0.2376796, 1.002956, 0.1842275, 0, 0, 0, 1, 1,
0.2431922, 0.3647485, 0.5969961, 0, 0, 0, 1, 1,
0.2541602, 1.378365, 1.619865, 0, 0, 0, 1, 1,
0.2561028, 0.1298294, 1.171798, 0, 0, 0, 1, 1,
0.2583203, -1.200112, 3.285512, 1, 1, 1, 1, 1,
0.259899, -0.3457432, 1.453594, 1, 1, 1, 1, 1,
0.2607369, -0.4998083, 2.648552, 1, 1, 1, 1, 1,
0.2692931, -0.5025029, 0.7036731, 1, 1, 1, 1, 1,
0.2722673, -1.798558, 3.73646, 1, 1, 1, 1, 1,
0.273818, 0.8564106, 1.73612, 1, 1, 1, 1, 1,
0.2741202, 0.1967649, 0.6183341, 1, 1, 1, 1, 1,
0.2800438, -0.1732176, 0.9003102, 1, 1, 1, 1, 1,
0.2816377, -1.407364, 2.35898, 1, 1, 1, 1, 1,
0.2863058, 0.309862, 0.2927378, 1, 1, 1, 1, 1,
0.2865108, 1.243004, 0.08064477, 1, 1, 1, 1, 1,
0.2872037, 0.3709164, -0.3935732, 1, 1, 1, 1, 1,
0.2888789, -0.05244725, 2.042504, 1, 1, 1, 1, 1,
0.2950728, 0.311691, 2.700323, 1, 1, 1, 1, 1,
0.2957868, 1.394069, -0.514278, 1, 1, 1, 1, 1,
0.2961926, -1.684221, 3.533009, 0, 0, 1, 1, 1,
0.2964023, 0.3761053, 1.141992, 1, 0, 0, 1, 1,
0.2972722, 1.240996, -0.8075519, 1, 0, 0, 1, 1,
0.2982283, 1.545923, 1.130383, 1, 0, 0, 1, 1,
0.3012348, 0.6689806, 0.7003667, 1, 0, 0, 1, 1,
0.3050966, 0.2192255, -0.2757198, 1, 0, 0, 1, 1,
0.3077519, -0.4016276, 3.257396, 0, 0, 0, 1, 1,
0.3098567, -0.2798405, 0.03242411, 0, 0, 0, 1, 1,
0.3102684, 0.8334295, 0.9102101, 0, 0, 0, 1, 1,
0.3142012, -0.2588943, 2.218118, 0, 0, 0, 1, 1,
0.3159353, 0.1654583, 0.5602595, 0, 0, 0, 1, 1,
0.3175683, 0.1051035, 0.3102213, 0, 0, 0, 1, 1,
0.3180949, -0.1958167, 2.321772, 0, 0, 0, 1, 1,
0.3187847, 0.1912905, -0.2605397, 1, 1, 1, 1, 1,
0.3193039, 0.6567055, 1.140898, 1, 1, 1, 1, 1,
0.3238168, -0.9968484, 1.540628, 1, 1, 1, 1, 1,
0.3253028, -0.4577192, 3.372381, 1, 1, 1, 1, 1,
0.3258109, -1.800178, 3.251718, 1, 1, 1, 1, 1,
0.3266775, 0.6152307, -0.1564049, 1, 1, 1, 1, 1,
0.3307822, -0.6650209, 1.936998, 1, 1, 1, 1, 1,
0.3335412, -0.8139381, 3.707804, 1, 1, 1, 1, 1,
0.3338722, -0.421814, 2.31456, 1, 1, 1, 1, 1,
0.3407275, -0.3270436, 3.618814, 1, 1, 1, 1, 1,
0.345578, 0.4817765, 2.675116, 1, 1, 1, 1, 1,
0.3468446, -1.1833, 2.985933, 1, 1, 1, 1, 1,
0.3475958, -0.0008483524, 0.7041887, 1, 1, 1, 1, 1,
0.3476538, 0.8796698, 0.8342406, 1, 1, 1, 1, 1,
0.3511653, -0.4394708, 2.364771, 1, 1, 1, 1, 1,
0.354631, 1.651111, -0.014942, 0, 0, 1, 1, 1,
0.354825, -0.4746822, 2.00889, 1, 0, 0, 1, 1,
0.3575033, -1.245792, 2.049069, 1, 0, 0, 1, 1,
0.3713204, 1.407363, 0.561963, 1, 0, 0, 1, 1,
0.3776026, -1.090438, 1.249252, 1, 0, 0, 1, 1,
0.3789896, -1.707583, 4.453738, 1, 0, 0, 1, 1,
0.3795232, 0.1596269, 1.128137, 0, 0, 0, 1, 1,
0.381051, -0.7168222, 1.445014, 0, 0, 0, 1, 1,
0.3878469, 0.7648143, 0.7162206, 0, 0, 0, 1, 1,
0.3878544, 0.435781, 0.299071, 0, 0, 0, 1, 1,
0.3878547, 0.7363081, 0.612056, 0, 0, 0, 1, 1,
0.3883561, 0.06087881, 2.403355, 0, 0, 0, 1, 1,
0.389066, 0.03965545, 0.9439397, 0, 0, 0, 1, 1,
0.3900789, -1.727246, 1.383084, 1, 1, 1, 1, 1,
0.392011, 2.074544, 1.817912, 1, 1, 1, 1, 1,
0.398188, 0.09195949, 1.238911, 1, 1, 1, 1, 1,
0.4008555, -0.7766487, 2.045965, 1, 1, 1, 1, 1,
0.4047975, 1.644794, 1.219123, 1, 1, 1, 1, 1,
0.4082714, 0.9957119, 0.682493, 1, 1, 1, 1, 1,
0.4091491, -0.2421751, 1.83044, 1, 1, 1, 1, 1,
0.4110981, 0.1656672, 2.003999, 1, 1, 1, 1, 1,
0.4159682, -0.9547508, 2.097779, 1, 1, 1, 1, 1,
0.4162191, -0.6088135, 2.359314, 1, 1, 1, 1, 1,
0.4187888, -1.106962, 2.082794, 1, 1, 1, 1, 1,
0.4194403, -2.00614, 1.835732, 1, 1, 1, 1, 1,
0.4197984, 0.9722857, -0.9137546, 1, 1, 1, 1, 1,
0.4230102, -0.892783, 3.30867, 1, 1, 1, 1, 1,
0.4257369, -0.09695561, 0.441884, 1, 1, 1, 1, 1,
0.4264371, 1.919543, -1.941368, 0, 0, 1, 1, 1,
0.4291606, 0.218846, 2.150293, 1, 0, 0, 1, 1,
0.4296224, -0.2213394, 3.343973, 1, 0, 0, 1, 1,
0.4305563, -0.3756639, 4.101061, 1, 0, 0, 1, 1,
0.4308029, -1.625405, 3.26753, 1, 0, 0, 1, 1,
0.4331852, -0.3107677, 0.9704151, 1, 0, 0, 1, 1,
0.4380406, -2.451637, 1.9719, 0, 0, 0, 1, 1,
0.4399253, -0.4400244, 1.562408, 0, 0, 0, 1, 1,
0.4458325, 0.2941434, 0.7412219, 0, 0, 0, 1, 1,
0.4467798, -0.1032384, 0.3579571, 0, 0, 0, 1, 1,
0.4499761, 1.188205, 2.493595, 0, 0, 0, 1, 1,
0.4538223, 0.4368218, 0.06121411, 0, 0, 0, 1, 1,
0.4548014, 0.5236102, 0.3747782, 0, 0, 0, 1, 1,
0.4551071, 0.5276578, 0.6937125, 1, 1, 1, 1, 1,
0.4638714, 0.3719741, 1.266321, 1, 1, 1, 1, 1,
0.4691487, -0.341577, 1.900179, 1, 1, 1, 1, 1,
0.4700213, 0.2076064, 0.7047358, 1, 1, 1, 1, 1,
0.4722036, -0.5173519, 2.148513, 1, 1, 1, 1, 1,
0.4723897, 0.2550935, -1.000093, 1, 1, 1, 1, 1,
0.4728852, -0.607402, 1.950746, 1, 1, 1, 1, 1,
0.4769351, 0.8269565, -1.183101, 1, 1, 1, 1, 1,
0.4776682, -0.6719255, 2.723394, 1, 1, 1, 1, 1,
0.4792144, -1.02895, 2.751925, 1, 1, 1, 1, 1,
0.4822048, 0.3588958, 1.87391, 1, 1, 1, 1, 1,
0.4825032, 0.7267764, -0.147643, 1, 1, 1, 1, 1,
0.4849699, 0.4636829, 1.852361, 1, 1, 1, 1, 1,
0.48655, -0.3192675, 2.487209, 1, 1, 1, 1, 1,
0.4867662, 2.093981, 0.5658641, 1, 1, 1, 1, 1,
0.4901212, 0.6899259, 0.4101966, 0, 0, 1, 1, 1,
0.4928626, 1.025434, -1.974729, 1, 0, 0, 1, 1,
0.4950635, 0.8735458, 1.808187, 1, 0, 0, 1, 1,
0.4977549, 0.6789057, 2.042254, 1, 0, 0, 1, 1,
0.5025241, 0.8765799, 0.9219099, 1, 0, 0, 1, 1,
0.5037676, 0.8955582, 2.01804, 1, 0, 0, 1, 1,
0.5038445, -1.890352, 1.79021, 0, 0, 0, 1, 1,
0.5105954, -0.08154624, 1.224942, 0, 0, 0, 1, 1,
0.5143755, 1.276814, 0.2131439, 0, 0, 0, 1, 1,
0.5144931, -1.678229, 4.529479, 0, 0, 0, 1, 1,
0.5181767, -0.1820711, 2.865813, 0, 0, 0, 1, 1,
0.518387, -0.293984, 0.7756559, 0, 0, 0, 1, 1,
0.5224456, 1.082722, -0.677958, 0, 0, 0, 1, 1,
0.5267341, 0.3006234, 2.129192, 1, 1, 1, 1, 1,
0.5288441, -0.7412979, 1.946946, 1, 1, 1, 1, 1,
0.5290865, 0.3269391, -0.01535862, 1, 1, 1, 1, 1,
0.5321633, -0.360536, 3.317937, 1, 1, 1, 1, 1,
0.5326326, -0.2737707, 0.1295798, 1, 1, 1, 1, 1,
0.5338282, 1.150147, 1.909371, 1, 1, 1, 1, 1,
0.5530378, 0.1635355, 1.940544, 1, 1, 1, 1, 1,
0.553985, -0.8950575, 2.797338, 1, 1, 1, 1, 1,
0.5580755, 0.1755509, 1.789362, 1, 1, 1, 1, 1,
0.5600293, -1.829883, 4.849455, 1, 1, 1, 1, 1,
0.561218, -0.4386937, 0.6814129, 1, 1, 1, 1, 1,
0.562247, 0.9256116, 0.02705312, 1, 1, 1, 1, 1,
0.5626693, 0.7685512, -0.08539869, 1, 1, 1, 1, 1,
0.5646269, 1.405268, -1.584255, 1, 1, 1, 1, 1,
0.5696129, -0.9074124, 2.251123, 1, 1, 1, 1, 1,
0.5704232, 0.6905668, 0.5634393, 0, 0, 1, 1, 1,
0.5773571, 0.5732478, 2.499256, 1, 0, 0, 1, 1,
0.5780072, 0.7063566, -0.1623547, 1, 0, 0, 1, 1,
0.584354, -1.420629, 2.651893, 1, 0, 0, 1, 1,
0.5872435, -1.151297, 1.482274, 1, 0, 0, 1, 1,
0.5882902, 0.07655057, 0.6724203, 1, 0, 0, 1, 1,
0.5969787, -1.157777, 3.067753, 0, 0, 0, 1, 1,
0.5984992, -1.702391, 3.672811, 0, 0, 0, 1, 1,
0.5987371, 1.527256, -0.5383083, 0, 0, 0, 1, 1,
0.5992329, 1.015326, 1.282137, 0, 0, 0, 1, 1,
0.5994357, -0.7979399, 2.943421, 0, 0, 0, 1, 1,
0.5998088, 0.3186927, 0.3959895, 0, 0, 0, 1, 1,
0.6012583, -1.96568, 2.001719, 0, 0, 0, 1, 1,
0.6064668, 0.1467542, -0.6999187, 1, 1, 1, 1, 1,
0.6175973, 0.6987, 0.06401187, 1, 1, 1, 1, 1,
0.6185741, -1.007435, 2.722584, 1, 1, 1, 1, 1,
0.6198599, 2.32278, -1.065423, 1, 1, 1, 1, 1,
0.6334872, 1.374243, 1.807468, 1, 1, 1, 1, 1,
0.6373566, 1.4356, 0.02010699, 1, 1, 1, 1, 1,
0.6379305, -0.1551615, 2.700423, 1, 1, 1, 1, 1,
0.6415402, 1.248803, 0.6411737, 1, 1, 1, 1, 1,
0.6493581, 1.288574, 0.5152856, 1, 1, 1, 1, 1,
0.6539434, 0.3494072, 2.055921, 1, 1, 1, 1, 1,
0.6552595, -0.719438, 2.6845, 1, 1, 1, 1, 1,
0.6558026, 0.6355346, 0.7974018, 1, 1, 1, 1, 1,
0.6566432, 0.2207516, 2.275787, 1, 1, 1, 1, 1,
0.6571273, 0.273134, 1.395989, 1, 1, 1, 1, 1,
0.6652858, -0.4807928, 3.412596, 1, 1, 1, 1, 1,
0.6672734, 0.456425, 0.2218472, 0, 0, 1, 1, 1,
0.6675636, -1.21466, 2.392314, 1, 0, 0, 1, 1,
0.6676822, -0.503643, 2.353883, 1, 0, 0, 1, 1,
0.6780919, -0.5650237, 3.683047, 1, 0, 0, 1, 1,
0.6808866, 1.780378, -2.067918, 1, 0, 0, 1, 1,
0.6856109, 1.550183, 0.3862771, 1, 0, 0, 1, 1,
0.6891549, 1.22535, -0.3605307, 0, 0, 0, 1, 1,
0.6913514, -0.03550181, 2.767662, 0, 0, 0, 1, 1,
0.6940743, 0.4451109, 2.382651, 0, 0, 0, 1, 1,
0.695368, -0.6328052, 3.410185, 0, 0, 0, 1, 1,
0.7015038, -0.8600425, 0.8688842, 0, 0, 0, 1, 1,
0.7017831, 0.1010499, 2.036225, 0, 0, 0, 1, 1,
0.7043063, 0.1616381, 1.980097, 0, 0, 0, 1, 1,
0.7138109, 0.8554971, 2.459086, 1, 1, 1, 1, 1,
0.7140088, 0.2863089, 0.09647632, 1, 1, 1, 1, 1,
0.7192839, -0.3889459, 1.735429, 1, 1, 1, 1, 1,
0.7223472, -0.844076, 1.114283, 1, 1, 1, 1, 1,
0.7307194, 0.7751891, -1.214154, 1, 1, 1, 1, 1,
0.7375394, 1.269033, 0.3367421, 1, 1, 1, 1, 1,
0.7389678, -0.5705009, 0.8546701, 1, 1, 1, 1, 1,
0.7440581, 0.7973804, 0.04534759, 1, 1, 1, 1, 1,
0.7444913, 1.21782, -0.175612, 1, 1, 1, 1, 1,
0.7457538, -0.2813352, -0.0132813, 1, 1, 1, 1, 1,
0.7476625, 0.872211, 0.8311982, 1, 1, 1, 1, 1,
0.7489374, -0.673372, 2.365411, 1, 1, 1, 1, 1,
0.7538701, -0.9446152, 1.416205, 1, 1, 1, 1, 1,
0.7547182, 0.8446236, 1.574608, 1, 1, 1, 1, 1,
0.756646, -0.6792109, 2.219931, 1, 1, 1, 1, 1,
0.7583221, -0.0315498, 2.892816, 0, 0, 1, 1, 1,
0.7601684, 0.02597148, 1.256347, 1, 0, 0, 1, 1,
0.7604868, -0.1553073, 0.717486, 1, 0, 0, 1, 1,
0.7620709, -1.00743, 2.179664, 1, 0, 0, 1, 1,
0.7644964, 0.5756117, 1.107302, 1, 0, 0, 1, 1,
0.7645677, 1.187476, 2.02983, 1, 0, 0, 1, 1,
0.765604, -1.338346, 2.713311, 0, 0, 0, 1, 1,
0.765624, -0.01184386, 2.289972, 0, 0, 0, 1, 1,
0.7665929, 0.107581, 2.957806, 0, 0, 0, 1, 1,
0.7687942, -1.635845, 4.908208, 0, 0, 0, 1, 1,
0.7748241, -0.1565501, 0.8660309, 0, 0, 0, 1, 1,
0.7775821, 1.557687, 0.7576984, 0, 0, 0, 1, 1,
0.7842468, 1.187934, -0.06439334, 0, 0, 0, 1, 1,
0.7847251, -0.443619, 1.045822, 1, 1, 1, 1, 1,
0.785536, -0.1954965, 1.912861, 1, 1, 1, 1, 1,
0.7863387, -0.488914, 4.317384, 1, 1, 1, 1, 1,
0.7944608, 1.008602, -0.868587, 1, 1, 1, 1, 1,
0.8042606, -0.6282187, -0.1700356, 1, 1, 1, 1, 1,
0.8071631, 0.7844836, 1.502298, 1, 1, 1, 1, 1,
0.8084161, 0.2856032, 1.739184, 1, 1, 1, 1, 1,
0.811747, -0.2907745, 3.893625, 1, 1, 1, 1, 1,
0.8119811, -0.7786722, 2.808192, 1, 1, 1, 1, 1,
0.8139837, 0.4269989, 2.103242, 1, 1, 1, 1, 1,
0.8146043, 0.4661241, 0.875562, 1, 1, 1, 1, 1,
0.8147894, -0.4396667, 1.568512, 1, 1, 1, 1, 1,
0.8148715, -0.4150924, 2.202363, 1, 1, 1, 1, 1,
0.81631, -0.5933837, 1.206082, 1, 1, 1, 1, 1,
0.8301752, -0.0326261, 2.171207, 1, 1, 1, 1, 1,
0.8311215, -0.4836441, 1.88591, 0, 0, 1, 1, 1,
0.8337722, 0.3743862, 3.176233, 1, 0, 0, 1, 1,
0.8362233, 0.6078452, 1.023576, 1, 0, 0, 1, 1,
0.837145, -0.8694279, 2.305669, 1, 0, 0, 1, 1,
0.8373707, -0.9188413, 2.145313, 1, 0, 0, 1, 1,
0.8379604, -0.2854923, 2.91571, 1, 0, 0, 1, 1,
0.8401713, 1.955898, 0.5719002, 0, 0, 0, 1, 1,
0.8440823, 0.429422, 1.134516, 0, 0, 0, 1, 1,
0.849032, -1.217625, 2.577349, 0, 0, 0, 1, 1,
0.8554922, 0.3794645, 2.282963, 0, 0, 0, 1, 1,
0.8568574, 0.6561068, -0.6402923, 0, 0, 0, 1, 1,
0.8591371, -1.070157, 2.902917, 0, 0, 0, 1, 1,
0.8620415, -0.06378894, 1.320028, 0, 0, 0, 1, 1,
0.8717148, -0.7227396, 3.525576, 1, 1, 1, 1, 1,
0.8779991, -1.111296, 4.102473, 1, 1, 1, 1, 1,
0.8833263, -0.0983417, 2.102355, 1, 1, 1, 1, 1,
0.8868936, -0.6050236, 2.513421, 1, 1, 1, 1, 1,
0.8907171, 2.61812, 1.241798, 1, 1, 1, 1, 1,
0.9015753, -0.473302, 4.412575, 1, 1, 1, 1, 1,
0.905088, 0.1090827, 2.710544, 1, 1, 1, 1, 1,
0.9057977, -0.9058495, 2.267809, 1, 1, 1, 1, 1,
0.9212612, -0.1028513, 3.552549, 1, 1, 1, 1, 1,
0.9234176, 1.279398, 2.291831, 1, 1, 1, 1, 1,
0.9239974, 1.030205, 1.496811, 1, 1, 1, 1, 1,
0.928295, -0.7198821, 1.707059, 1, 1, 1, 1, 1,
0.9291872, -0.1237917, 1.419692, 1, 1, 1, 1, 1,
0.9390981, 0.4548447, -0.7022622, 1, 1, 1, 1, 1,
0.9432838, 0.8332044, 0.6966603, 1, 1, 1, 1, 1,
0.944168, -0.1851565, 1.776753, 0, 0, 1, 1, 1,
0.9512055, -1.981192, 3.48104, 1, 0, 0, 1, 1,
0.9563568, -0.5807738, 3.296541, 1, 0, 0, 1, 1,
0.9571662, -0.8799527, 2.313203, 1, 0, 0, 1, 1,
0.9696503, 0.5963306, -0.2495537, 1, 0, 0, 1, 1,
0.9698793, -1.801008, 3.260159, 1, 0, 0, 1, 1,
0.9802116, -1.365334, 0.826429, 0, 0, 0, 1, 1,
0.9890686, -0.3125634, 2.933746, 0, 0, 0, 1, 1,
0.9897894, 0.4909864, 1.967614, 0, 0, 0, 1, 1,
0.9919235, -0.3339043, 3.016705, 0, 0, 0, 1, 1,
1.01095, -0.1520015, 0.9717686, 0, 0, 0, 1, 1,
1.012956, -1.347514, 1.634243, 0, 0, 0, 1, 1,
1.013676, -0.6034231, 2.821357, 0, 0, 0, 1, 1,
1.015081, -0.880444, 2.165497, 1, 1, 1, 1, 1,
1.01632, -2.473381, 3.198459, 1, 1, 1, 1, 1,
1.019202, -0.2718884, 2.603524, 1, 1, 1, 1, 1,
1.023187, -0.1179013, 1.339615, 1, 1, 1, 1, 1,
1.024928, 0.7370501, 2.4661, 1, 1, 1, 1, 1,
1.025569, 0.3211087, 1.840729, 1, 1, 1, 1, 1,
1.029051, -1.790587, 3.260468, 1, 1, 1, 1, 1,
1.031718, 0.08384363, -0.02960123, 1, 1, 1, 1, 1,
1.039768, -1.294746, 4.550629, 1, 1, 1, 1, 1,
1.045372, 0.4904954, -0.5589415, 1, 1, 1, 1, 1,
1.045516, -0.4684026, 1.161273, 1, 1, 1, 1, 1,
1.048827, -1.042654, 1.748392, 1, 1, 1, 1, 1,
1.048886, 1.266797, 1.734288, 1, 1, 1, 1, 1,
1.050493, -0.6526875, 1.047199, 1, 1, 1, 1, 1,
1.052535, 1.013513, 0.9251456, 1, 1, 1, 1, 1,
1.054584, 1.777767, 1.0591, 0, 0, 1, 1, 1,
1.060329, -1.038908, 2.438286, 1, 0, 0, 1, 1,
1.066406, -0.6283731, 2.186975, 1, 0, 0, 1, 1,
1.068174, -0.7196348, 3.031293, 1, 0, 0, 1, 1,
1.072877, -0.001807937, 4.504864, 1, 0, 0, 1, 1,
1.075006, 0.9716183, 0.5995977, 1, 0, 0, 1, 1,
1.083133, -0.8701149, 1.47435, 0, 0, 0, 1, 1,
1.086339, -0.5524687, 2.314643, 0, 0, 0, 1, 1,
1.086713, 1.815629, 1.828539, 0, 0, 0, 1, 1,
1.095105, 1.026717, 0.1124066, 0, 0, 0, 1, 1,
1.101106, 1.959538, 1.422064, 0, 0, 0, 1, 1,
1.103874, 1.469232, 0.2753197, 0, 0, 0, 1, 1,
1.114849, -0.267347, 2.623027, 0, 0, 0, 1, 1,
1.115041, -0.3464022, 3.191353, 1, 1, 1, 1, 1,
1.115676, -1.631253, 1.514893, 1, 1, 1, 1, 1,
1.120472, 0.1288048, 2.374319, 1, 1, 1, 1, 1,
1.122919, -0.5843375, 2.486006, 1, 1, 1, 1, 1,
1.127647, 0.6673226, 1.104267, 1, 1, 1, 1, 1,
1.1279, 0.779421, 1.543483, 1, 1, 1, 1, 1,
1.138972, -1.939454, 1.388616, 1, 1, 1, 1, 1,
1.143746, 1.386385, -0.05906663, 1, 1, 1, 1, 1,
1.144685, 0.6040589, 0.4623182, 1, 1, 1, 1, 1,
1.148313, 1.171468, 1.128033, 1, 1, 1, 1, 1,
1.151428, -0.7845538, 0.5416498, 1, 1, 1, 1, 1,
1.154969, 0.7394717, 1.595903, 1, 1, 1, 1, 1,
1.15775, 0.3984458, 1.7505, 1, 1, 1, 1, 1,
1.161466, 0.6195478, -0.3282775, 1, 1, 1, 1, 1,
1.177041, -1.480998, 0.8579247, 1, 1, 1, 1, 1,
1.178525, -0.2201274, 1.273647, 0, 0, 1, 1, 1,
1.178936, -0.153113, 2.813098, 1, 0, 0, 1, 1,
1.185076, -2.480206, 2.180239, 1, 0, 0, 1, 1,
1.186665, -0.7739582, 2.834228, 1, 0, 0, 1, 1,
1.192605, 0.8891577, 0.3867191, 1, 0, 0, 1, 1,
1.197412, 1.491298, 0.2642578, 1, 0, 0, 1, 1,
1.197777, 0.9162964, 1.228692, 0, 0, 0, 1, 1,
1.203816, -0.7660602, 1.851954, 0, 0, 0, 1, 1,
1.21714, 1.129732, 2.164888, 0, 0, 0, 1, 1,
1.22243, 0.4863417, 0.0634658, 0, 0, 0, 1, 1,
1.230329, 0.7377508, 0.4617975, 0, 0, 0, 1, 1,
1.235601, -0.8607231, 1.11489, 0, 0, 0, 1, 1,
1.237519, 0.2451117, 2.513618, 0, 0, 0, 1, 1,
1.242643, -1.826201, 3.197511, 1, 1, 1, 1, 1,
1.248643, -0.9254961, 0.9262534, 1, 1, 1, 1, 1,
1.249567, -1.253697, 3.446465, 1, 1, 1, 1, 1,
1.249735, -1.484877, 1.624913, 1, 1, 1, 1, 1,
1.252042, -0.8547342, 2.32451, 1, 1, 1, 1, 1,
1.257095, 0.994675, -0.2691379, 1, 1, 1, 1, 1,
1.257454, -0.239786, 1.798713, 1, 1, 1, 1, 1,
1.260867, -0.4084731, 3.394121, 1, 1, 1, 1, 1,
1.26983, -0.4432685, 1.430062, 1, 1, 1, 1, 1,
1.273894, -0.425993, 1.758995, 1, 1, 1, 1, 1,
1.284972, 0.6840412, 1.86604, 1, 1, 1, 1, 1,
1.287848, -0.7949181, 3.564936, 1, 1, 1, 1, 1,
1.292212, 0.03865094, 1.283752, 1, 1, 1, 1, 1,
1.29718, -0.4349073, 2.852025, 1, 1, 1, 1, 1,
1.302793, -0.01390633, 1.240689, 1, 1, 1, 1, 1,
1.306606, -0.177279, 1.758113, 0, 0, 1, 1, 1,
1.307448, 1.122979, -0.6296166, 1, 0, 0, 1, 1,
1.312727, 0.09255325, 2.139306, 1, 0, 0, 1, 1,
1.321747, -0.2110887, 2.00487, 1, 0, 0, 1, 1,
1.328923, 0.6494431, 0.4389542, 1, 0, 0, 1, 1,
1.330279, -0.7365812, 2.103984, 1, 0, 0, 1, 1,
1.333593, 1.375714, 0.7897967, 0, 0, 0, 1, 1,
1.335459, -0.3912367, 0.8224728, 0, 0, 0, 1, 1,
1.340125, -2.360451, 2.98814, 0, 0, 0, 1, 1,
1.341687, -0.2912244, 1.254351, 0, 0, 0, 1, 1,
1.350925, -1.878439, 2.099109, 0, 0, 0, 1, 1,
1.362364, 1.147272, 0.9506797, 0, 0, 0, 1, 1,
1.365844, -0.4465444, 2.296102, 0, 0, 0, 1, 1,
1.366755, -1.978062, 1.930159, 1, 1, 1, 1, 1,
1.376518, 0.1358778, 2.19971, 1, 1, 1, 1, 1,
1.379934, -0.004641932, 3.007428, 1, 1, 1, 1, 1,
1.388811, 1.728683, 1.308701, 1, 1, 1, 1, 1,
1.390703, -1.196849, 2.568711, 1, 1, 1, 1, 1,
1.392087, 1.399021, 0.9995321, 1, 1, 1, 1, 1,
1.395778, 1.693504, 1.263319, 1, 1, 1, 1, 1,
1.396447, -0.9854485, 1.28543, 1, 1, 1, 1, 1,
1.396778, -2.419952, 2.220132, 1, 1, 1, 1, 1,
1.404894, 0.5530893, 2.052907, 1, 1, 1, 1, 1,
1.407034, -0.8624045, 2.157207, 1, 1, 1, 1, 1,
1.41623, -2.190702, 2.684801, 1, 1, 1, 1, 1,
1.416835, -0.1810345, -0.4460452, 1, 1, 1, 1, 1,
1.434228, 0.2749754, -0.02913391, 1, 1, 1, 1, 1,
1.442546, 0.3508822, -0.26392, 1, 1, 1, 1, 1,
1.469775, -0.9877375, 2.941648, 0, 0, 1, 1, 1,
1.476521, 1.570085, 1.660785, 1, 0, 0, 1, 1,
1.478279, 0.8774829, 0.2480045, 1, 0, 0, 1, 1,
1.480896, -1.684691, 1.684383, 1, 0, 0, 1, 1,
1.48966, 0.1538283, 1.972236, 1, 0, 0, 1, 1,
1.502876, 0.1564071, 0.7935278, 1, 0, 0, 1, 1,
1.503659, 1.031421, 0.5569496, 0, 0, 0, 1, 1,
1.506376, -1.231579, 2.465771, 0, 0, 0, 1, 1,
1.521544, 0.7368397, 3.105074, 0, 0, 0, 1, 1,
1.525108, 0.4622936, 0.8626716, 0, 0, 0, 1, 1,
1.527525, -0.01067894, 1.90537, 0, 0, 0, 1, 1,
1.5301, 1.173018, 1.074673, 0, 0, 0, 1, 1,
1.538223, 1.74902, 2.489906, 0, 0, 0, 1, 1,
1.539414, -1.153527, 1.765447, 1, 1, 1, 1, 1,
1.540542, -0.4364046, 1.675143, 1, 1, 1, 1, 1,
1.546163, 0.567735, 1.654036, 1, 1, 1, 1, 1,
1.550174, 0.9604459, 2.120988, 1, 1, 1, 1, 1,
1.561589, 1.41595, -0.1932012, 1, 1, 1, 1, 1,
1.576159, -0.8007964, 3.886899, 1, 1, 1, 1, 1,
1.578077, -1.630623, 2.626394, 1, 1, 1, 1, 1,
1.579368, 0.5607724, 1.338026, 1, 1, 1, 1, 1,
1.584517, -0.8587796, 1.732662, 1, 1, 1, 1, 1,
1.587007, 0.3268723, -0.04872674, 1, 1, 1, 1, 1,
1.592538, -0.104874, 1.433253, 1, 1, 1, 1, 1,
1.595709, 0.3244037, 2.405428, 1, 1, 1, 1, 1,
1.601696, -1.050122, 3.307108, 1, 1, 1, 1, 1,
1.606884, 0.11979, 2.009912, 1, 1, 1, 1, 1,
1.616749, 0.8174412, 2.646665, 1, 1, 1, 1, 1,
1.634918, -2.148553, 3.34332, 0, 0, 1, 1, 1,
1.642562, 0.06542199, 1.778107, 1, 0, 0, 1, 1,
1.659209, -0.6117727, 2.831188, 1, 0, 0, 1, 1,
1.660604, 1.497078, -0.001352438, 1, 0, 0, 1, 1,
1.661159, 0.5435663, -0.08790648, 1, 0, 0, 1, 1,
1.675405, 0.9683816, -0.4781525, 1, 0, 0, 1, 1,
1.689576, -0.2583477, 1.383613, 0, 0, 0, 1, 1,
1.708569, 0.601215, 0.1612389, 0, 0, 0, 1, 1,
1.718397, 0.007184766, 2.561131, 0, 0, 0, 1, 1,
1.718908, 1.427787, 0.3112972, 0, 0, 0, 1, 1,
1.731904, -1.3211, 4.783825, 0, 0, 0, 1, 1,
1.778967, 0.03318887, 0.1374054, 0, 0, 0, 1, 1,
1.807487, 1.473902, 1.514205, 0, 0, 0, 1, 1,
1.847048, -1.654538, 2.971719, 1, 1, 1, 1, 1,
1.851427, -0.4685926, 2.547121, 1, 1, 1, 1, 1,
1.857713, 0.0933658, 2.691959, 1, 1, 1, 1, 1,
1.876205, -1.468191, 2.352347, 1, 1, 1, 1, 1,
1.88083, -0.07266562, 1.020194, 1, 1, 1, 1, 1,
1.951156, -0.3758786, 1.931475, 1, 1, 1, 1, 1,
1.973507, -2.011005, 2.279477, 1, 1, 1, 1, 1,
1.974467, -0.06234975, 1.924238, 1, 1, 1, 1, 1,
1.977403, -0.3717473, -0.07387879, 1, 1, 1, 1, 1,
1.978489, 0.8072429, 1.187219, 1, 1, 1, 1, 1,
1.980388, 0.6080436, 1.794514, 1, 1, 1, 1, 1,
1.981095, -0.1824393, -0.7622697, 1, 1, 1, 1, 1,
2.024568, -1.294096, 2.132057, 1, 1, 1, 1, 1,
2.046285, -1.869055, 1.589696, 1, 1, 1, 1, 1,
2.059698, -0.1236402, 1.352981, 1, 1, 1, 1, 1,
2.073124, -1.612876, 3.40168, 0, 0, 1, 1, 1,
2.085654, 0.3313339, 0.9555404, 1, 0, 0, 1, 1,
2.087742, 1.620398, 0.9383366, 1, 0, 0, 1, 1,
2.093346, 0.1177789, 1.632838, 1, 0, 0, 1, 1,
2.145722, -0.4834096, -0.2211028, 1, 0, 0, 1, 1,
2.149553, 0.570331, 0.5727139, 1, 0, 0, 1, 1,
2.182914, -1.0703, 3.476676, 0, 0, 0, 1, 1,
2.183729, -0.2862654, 2.265619, 0, 0, 0, 1, 1,
2.191135, -0.308023, 1.507741, 0, 0, 0, 1, 1,
2.253527, 0.9776119, 0.649747, 0, 0, 0, 1, 1,
2.259423, -0.5492598, 0.2102387, 0, 0, 0, 1, 1,
2.284904, 0.8653057, 2.074537, 0, 0, 0, 1, 1,
2.390458, -0.6930879, 1.412563, 0, 0, 0, 1, 1,
2.407993, 1.254611, 1.807985, 1, 1, 1, 1, 1,
2.442401, 0.8379488, 1.011332, 1, 1, 1, 1, 1,
2.469085, 0.9682789, 0.7945674, 1, 1, 1, 1, 1,
2.504286, -0.9473566, 1.156882, 1, 1, 1, 1, 1,
2.513157, -0.3863216, 1.894767, 1, 1, 1, 1, 1,
2.519905, 0.7757506, 2.423339, 1, 1, 1, 1, 1,
2.738526, 0.5611155, 1.01744, 1, 1, 1, 1, 1
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
var radius = 8.957936;
var distance = 31.46437;
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
mvMatrix.translate( 0.03116608, 0.01558638, 0.004296541 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.46437);
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