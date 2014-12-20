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
-3.300333, 1.809615, 0.9687192, 1, 0, 0, 1,
-2.87762, 1.124741, -3.050148, 1, 0.007843138, 0, 1,
-2.846661, 1.808357, -0.1239158, 1, 0.01176471, 0, 1,
-2.787714, 0.5512537, -0.6367424, 1, 0.01960784, 0, 1,
-2.669318, 1.172835, -1.411194, 1, 0.02352941, 0, 1,
-2.603641, -0.2236681, -0.2261005, 1, 0.03137255, 0, 1,
-2.524384, -1.927297, -1.348365, 1, 0.03529412, 0, 1,
-2.400715, 0.04190122, -1.742564, 1, 0.04313726, 0, 1,
-2.286015, 1.672506, -0.6822399, 1, 0.04705882, 0, 1,
-2.278048, 2.233435, -1.390468, 1, 0.05490196, 0, 1,
-2.191914, -0.2742595, -2.825897, 1, 0.05882353, 0, 1,
-2.168037, -0.6216992, 0.122897, 1, 0.06666667, 0, 1,
-2.167145, -1.131764, 0.2410243, 1, 0.07058824, 0, 1,
-2.126856, 0.8617957, -0.9332651, 1, 0.07843138, 0, 1,
-2.10523, 0.4233543, -1.849342, 1, 0.08235294, 0, 1,
-2.100313, -0.8199598, -3.036656, 1, 0.09019608, 0, 1,
-2.063936, 0.5677571, -3.179776, 1, 0.09411765, 0, 1,
-2.060843, -1.339289, -0.4863873, 1, 0.1019608, 0, 1,
-2.034816, -0.04896577, -0.9339689, 1, 0.1098039, 0, 1,
-2.019691, 0.7583624, -1.584558, 1, 0.1137255, 0, 1,
-1.991782, 1.367958, -1.272669, 1, 0.1215686, 0, 1,
-1.98507, 0.441651, -2.552649, 1, 0.1254902, 0, 1,
-1.981375, -1.169581, -2.464632, 1, 0.1333333, 0, 1,
-1.976137, -0.9925702, -2.1517, 1, 0.1372549, 0, 1,
-1.974399, -1.076481, -3.557118, 1, 0.145098, 0, 1,
-1.970383, 0.273504, -0.2290069, 1, 0.1490196, 0, 1,
-1.937858, 0.4832243, -1.541516, 1, 0.1568628, 0, 1,
-1.920113, -0.3031051, -1.59434, 1, 0.1607843, 0, 1,
-1.911424, 1.104942, -1.184105, 1, 0.1686275, 0, 1,
-1.904127, -2.182343, -2.84171, 1, 0.172549, 0, 1,
-1.894573, 0.8601697, -1.42965, 1, 0.1803922, 0, 1,
-1.886016, -1.160353, -2.096735, 1, 0.1843137, 0, 1,
-1.881196, 0.2991377, -1.221561, 1, 0.1921569, 0, 1,
-1.860455, -1.20036, -2.077188, 1, 0.1960784, 0, 1,
-1.844237, -2.069521, -3.638149, 1, 0.2039216, 0, 1,
-1.843375, -1.176067, -2.984823, 1, 0.2117647, 0, 1,
-1.843015, -0.8109055, -1.00137, 1, 0.2156863, 0, 1,
-1.833676, 1.441654, -0.3795872, 1, 0.2235294, 0, 1,
-1.80022, -1.227613, -2.135009, 1, 0.227451, 0, 1,
-1.754313, -1.799625, -2.025626, 1, 0.2352941, 0, 1,
-1.734946, 0.5010865, -2.020821, 1, 0.2392157, 0, 1,
-1.724335, 1.153631, -2.56942, 1, 0.2470588, 0, 1,
-1.718192, -0.9990337, -3.202382, 1, 0.2509804, 0, 1,
-1.717945, 0.5992317, -0.04973996, 1, 0.2588235, 0, 1,
-1.709993, 0.4619519, -2.266609, 1, 0.2627451, 0, 1,
-1.704042, 0.7851303, -0.7802251, 1, 0.2705882, 0, 1,
-1.703493, 0.2902701, -1.085832, 1, 0.2745098, 0, 1,
-1.690801, -0.439633, -1.757497, 1, 0.282353, 0, 1,
-1.687108, 0.2811809, -1.250152, 1, 0.2862745, 0, 1,
-1.66643, -0.9173722, -1.83762, 1, 0.2941177, 0, 1,
-1.666299, -1.725681, 0.05315977, 1, 0.3019608, 0, 1,
-1.665774, 0.2882206, -0.5317104, 1, 0.3058824, 0, 1,
-1.64861, -0.3142997, -2.038467, 1, 0.3137255, 0, 1,
-1.635271, -2.011724, -2.244407, 1, 0.3176471, 0, 1,
-1.633083, 0.1902884, -0.7730164, 1, 0.3254902, 0, 1,
-1.625832, -0.2516729, -2.702065, 1, 0.3294118, 0, 1,
-1.617473, -1.896747, -0.9398083, 1, 0.3372549, 0, 1,
-1.604679, 0.8414155, -1.885679, 1, 0.3411765, 0, 1,
-1.602385, -0.237999, -2.063773, 1, 0.3490196, 0, 1,
-1.595761, 2.263726, 0.185097, 1, 0.3529412, 0, 1,
-1.582862, 0.9508981, -0.3533731, 1, 0.3607843, 0, 1,
-1.578315, -0.6471063, -3.287534, 1, 0.3647059, 0, 1,
-1.575517, -0.01437583, -0.8143361, 1, 0.372549, 0, 1,
-1.571092, -0.2475585, -1.744627, 1, 0.3764706, 0, 1,
-1.560861, -0.1731701, 0.01919997, 1, 0.3843137, 0, 1,
-1.556615, 0.1595221, -1.066686, 1, 0.3882353, 0, 1,
-1.544423, -1.680629, -3.137031, 1, 0.3960784, 0, 1,
-1.532961, -0.9051988, -1.616895, 1, 0.4039216, 0, 1,
-1.521148, 0.4847149, 0.2275435, 1, 0.4078431, 0, 1,
-1.517681, -0.3242843, -0.8576006, 1, 0.4156863, 0, 1,
-1.510691, -0.04931585, -1.320619, 1, 0.4196078, 0, 1,
-1.501384, -0.5772954, -1.609496, 1, 0.427451, 0, 1,
-1.489221, 0.5766512, -0.07394148, 1, 0.4313726, 0, 1,
-1.474098, 2.281618, -1.995, 1, 0.4392157, 0, 1,
-1.469908, -0.5250437, -1.359912, 1, 0.4431373, 0, 1,
-1.462041, -0.0223358, -3.516701, 1, 0.4509804, 0, 1,
-1.454012, -0.2655925, -3.945907, 1, 0.454902, 0, 1,
-1.451782, 1.065106, -2.748789, 1, 0.4627451, 0, 1,
-1.447205, 0.5098031, -3.066942, 1, 0.4666667, 0, 1,
-1.431299, 0.119381, -2.845672, 1, 0.4745098, 0, 1,
-1.429585, 1.811177, -0.6064433, 1, 0.4784314, 0, 1,
-1.424509, -0.2713893, -2.503728, 1, 0.4862745, 0, 1,
-1.424404, -0.6044922, -1.193051, 1, 0.4901961, 0, 1,
-1.423253, 0.07928568, -1.37109, 1, 0.4980392, 0, 1,
-1.421619, -1.004748, -0.4450558, 1, 0.5058824, 0, 1,
-1.414179, -0.1728625, -3.079879, 1, 0.509804, 0, 1,
-1.405577, 1.064963, -2.280779, 1, 0.5176471, 0, 1,
-1.404573, 1.248331, -1.987698, 1, 0.5215687, 0, 1,
-1.403558, -0.3046922, -1.985719, 1, 0.5294118, 0, 1,
-1.388681, -0.5435079, -1.609227, 1, 0.5333334, 0, 1,
-1.378905, 0.02710482, -2.679099, 1, 0.5411765, 0, 1,
-1.375062, 1.641543, 0.6708975, 1, 0.5450981, 0, 1,
-1.36004, -1.073588, -2.226272, 1, 0.5529412, 0, 1,
-1.350649, 0.1172205, -3.26157, 1, 0.5568628, 0, 1,
-1.34429, -1.240217, -0.6654423, 1, 0.5647059, 0, 1,
-1.341451, -0.9586177, -1.045023, 1, 0.5686275, 0, 1,
-1.325066, 0.7148281, 0.2311492, 1, 0.5764706, 0, 1,
-1.322416, -0.5437095, -1.78745, 1, 0.5803922, 0, 1,
-1.315937, -1.33239, -2.595386, 1, 0.5882353, 0, 1,
-1.306878, -1.389035, -1.957914, 1, 0.5921569, 0, 1,
-1.296121, -1.059911, -3.223385, 1, 0.6, 0, 1,
-1.295041, 0.3231509, -4.136903, 1, 0.6078432, 0, 1,
-1.29361, 1.642128, -2.925691, 1, 0.6117647, 0, 1,
-1.292257, -0.04681696, -0.652732, 1, 0.6196079, 0, 1,
-1.265827, 0.6942064, -2.404528, 1, 0.6235294, 0, 1,
-1.259706, -0.2788675, -1.568103, 1, 0.6313726, 0, 1,
-1.236891, -0.5650579, -3.580383, 1, 0.6352941, 0, 1,
-1.232275, 0.7444902, -1.147532, 1, 0.6431373, 0, 1,
-1.225331, 1.585477, -0.9507208, 1, 0.6470588, 0, 1,
-1.222582, -0.8714097, 0.448198, 1, 0.654902, 0, 1,
-1.217751, 1.403438, -0.419189, 1, 0.6588235, 0, 1,
-1.216057, 0.1993154, -0.8904837, 1, 0.6666667, 0, 1,
-1.215015, 1.77658, -0.1792503, 1, 0.6705883, 0, 1,
-1.201584, 0.4013701, -0.06297185, 1, 0.6784314, 0, 1,
-1.200203, 1.037272, -1.046119, 1, 0.682353, 0, 1,
-1.196066, -0.8685787, -2.821919, 1, 0.6901961, 0, 1,
-1.195953, 0.7335364, 1.28829, 1, 0.6941177, 0, 1,
-1.191856, 2.785153, 0.2587556, 1, 0.7019608, 0, 1,
-1.180223, 0.4530905, -1.469003, 1, 0.7098039, 0, 1,
-1.178592, -0.8374109, 0.6496271, 1, 0.7137255, 0, 1,
-1.178085, -0.7971783, -3.519362, 1, 0.7215686, 0, 1,
-1.171187, -0.7640733, -1.61748, 1, 0.7254902, 0, 1,
-1.166791, -0.6946017, -1.506609, 1, 0.7333333, 0, 1,
-1.163898, 0.0577245, -0.5478176, 1, 0.7372549, 0, 1,
-1.162472, 1.844695, 0.3406775, 1, 0.7450981, 0, 1,
-1.159834, 0.07631613, -1.859945, 1, 0.7490196, 0, 1,
-1.149419, -0.8182396, -2.857141, 1, 0.7568628, 0, 1,
-1.138185, 0.10992, -2.657799, 1, 0.7607843, 0, 1,
-1.131591, 0.169744, -2.917358, 1, 0.7686275, 0, 1,
-1.125842, 0.1474362, -2.469942, 1, 0.772549, 0, 1,
-1.125188, -0.3751141, -2.870362, 1, 0.7803922, 0, 1,
-1.119117, 0.1635105, -0.3685212, 1, 0.7843137, 0, 1,
-1.118641, 0.8146612, -1.734261, 1, 0.7921569, 0, 1,
-1.118181, 0.2641215, -1.416252, 1, 0.7960784, 0, 1,
-1.113559, 1.508045, -1.536018, 1, 0.8039216, 0, 1,
-1.112696, 0.1692558, -1.629536, 1, 0.8117647, 0, 1,
-1.107059, -0.4594581, -0.6129961, 1, 0.8156863, 0, 1,
-1.106757, 0.692075, -0.8686639, 1, 0.8235294, 0, 1,
-1.105354, 0.6284234, -1.13131, 1, 0.827451, 0, 1,
-1.104947, 0.3127864, -0.7421144, 1, 0.8352941, 0, 1,
-1.101939, 1.910144, 0.269231, 1, 0.8392157, 0, 1,
-1.100115, -1.222549, -1.84474, 1, 0.8470588, 0, 1,
-1.099207, 1.264342, 0.6217688, 1, 0.8509804, 0, 1,
-1.095436, 0.1008536, -2.138927, 1, 0.8588235, 0, 1,
-1.09479, 0.4946117, -0.2121232, 1, 0.8627451, 0, 1,
-1.086059, -1.18805, -1.26626, 1, 0.8705882, 0, 1,
-1.06329, 0.8835015, -1.09603, 1, 0.8745098, 0, 1,
-1.058225, 0.05432432, -1.465322, 1, 0.8823529, 0, 1,
-1.055847, 0.2322725, -3.363657, 1, 0.8862745, 0, 1,
-1.055341, 0.008449145, -3.151174, 1, 0.8941177, 0, 1,
-1.053453, -1.309316, -1.642737, 1, 0.8980392, 0, 1,
-1.053421, 1.078015, -0.5085978, 1, 0.9058824, 0, 1,
-1.052366, 0.2881361, -1.141286, 1, 0.9137255, 0, 1,
-1.045823, 1.08834, 0.4899152, 1, 0.9176471, 0, 1,
-1.04067, 0.373925, -2.9921, 1, 0.9254902, 0, 1,
-1.027112, 0.2844683, -1.674766, 1, 0.9294118, 0, 1,
-1.019976, -0.2889033, -2.347018, 1, 0.9372549, 0, 1,
-1.012977, -0.3824314, -1.362574, 1, 0.9411765, 0, 1,
-1.012576, 0.6005567, -0.09420539, 1, 0.9490196, 0, 1,
-1.008976, -0.09150739, -2.078009, 1, 0.9529412, 0, 1,
-1.002711, -0.2054022, -2.217269, 1, 0.9607843, 0, 1,
-0.9982251, 0.8793595, -0.8922836, 1, 0.9647059, 0, 1,
-0.9945127, 0.6732636, -1.878631, 1, 0.972549, 0, 1,
-0.9930261, 1.655575, 0.5586742, 1, 0.9764706, 0, 1,
-0.9863437, -1.094335, -3.935416, 1, 0.9843137, 0, 1,
-0.9843507, 1.103786, -0.920715, 1, 0.9882353, 0, 1,
-0.9824281, 0.5833826, -1.223024, 1, 0.9960784, 0, 1,
-0.9819014, 0.2284423, -1.308532, 0.9960784, 1, 0, 1,
-0.9755704, 2.025547, 0.5676548, 0.9921569, 1, 0, 1,
-0.9730841, 0.3301983, -1.560488, 0.9843137, 1, 0, 1,
-0.9714778, -0.173182, -1.312672, 0.9803922, 1, 0, 1,
-0.9682887, 0.2999608, -0.2190764, 0.972549, 1, 0, 1,
-0.9663144, 0.8326182, -0.05301677, 0.9686275, 1, 0, 1,
-0.9629982, -1.821961, -1.819812, 0.9607843, 1, 0, 1,
-0.9624904, 0.9649417, -0.1681009, 0.9568627, 1, 0, 1,
-0.9504086, -0.9206719, -1.946687, 0.9490196, 1, 0, 1,
-0.9383659, 0.3430699, 0.003503443, 0.945098, 1, 0, 1,
-0.9373043, -0.1028692, -2.279643, 0.9372549, 1, 0, 1,
-0.9311177, -0.7477214, -1.978237, 0.9333333, 1, 0, 1,
-0.9243008, -0.6815344, -2.849855, 0.9254902, 1, 0, 1,
-0.9192324, 0.3722231, -1.122448, 0.9215686, 1, 0, 1,
-0.9104804, -0.1332993, -1.176728, 0.9137255, 1, 0, 1,
-0.9075122, 1.01573, -1.551707, 0.9098039, 1, 0, 1,
-0.9010367, 0.1148173, -2.686861, 0.9019608, 1, 0, 1,
-0.8988687, -1.583516, -1.92047, 0.8941177, 1, 0, 1,
-0.8974593, 1.11197, -1.242316, 0.8901961, 1, 0, 1,
-0.890548, -1.342635, -0.6841396, 0.8823529, 1, 0, 1,
-0.8892437, -2.007513, -2.943156, 0.8784314, 1, 0, 1,
-0.8851195, -0.2569138, -2.062099, 0.8705882, 1, 0, 1,
-0.8791317, 0.0642406, -1.128878, 0.8666667, 1, 0, 1,
-0.8764387, 0.6125659, -0.606337, 0.8588235, 1, 0, 1,
-0.8756287, -0.6545902, -0.5848076, 0.854902, 1, 0, 1,
-0.8707901, -1.509714, -1.993932, 0.8470588, 1, 0, 1,
-0.8694798, 0.3082215, -0.9209742, 0.8431373, 1, 0, 1,
-0.8630432, -0.1586886, -1.498242, 0.8352941, 1, 0, 1,
-0.8531508, -2.159822, -3.078409, 0.8313726, 1, 0, 1,
-0.8528997, 1.774004, 0.443684, 0.8235294, 1, 0, 1,
-0.8519391, 0.8034235, -2.069336, 0.8196079, 1, 0, 1,
-0.849551, -0.5612515, -1.921549, 0.8117647, 1, 0, 1,
-0.8483143, -0.2492516, -2.840912, 0.8078431, 1, 0, 1,
-0.8477761, -0.03221494, -1.187996, 0.8, 1, 0, 1,
-0.8444623, -0.8578945, -4.367291, 0.7921569, 1, 0, 1,
-0.8393947, -0.399057, -2.179657, 0.7882353, 1, 0, 1,
-0.8322336, -0.8874387, -3.617129, 0.7803922, 1, 0, 1,
-0.8258371, 1.137846, -0.1540697, 0.7764706, 1, 0, 1,
-0.8247186, -0.8184563, -3.972089, 0.7686275, 1, 0, 1,
-0.8198198, -1.13785, -1.259859, 0.7647059, 1, 0, 1,
-0.8173311, 1.137286, -0.5492859, 0.7568628, 1, 0, 1,
-0.8145705, -0.9505424, -4.274677, 0.7529412, 1, 0, 1,
-0.8125369, -0.2599579, -2.157313, 0.7450981, 1, 0, 1,
-0.8100901, 1.28385, -0.8553277, 0.7411765, 1, 0, 1,
-0.8079101, 0.9154984, 0.827727, 0.7333333, 1, 0, 1,
-0.7962853, -0.3203508, -3.503688, 0.7294118, 1, 0, 1,
-0.7946455, -0.5774096, -1.634893, 0.7215686, 1, 0, 1,
-0.7875803, -0.8098341, -1.525044, 0.7176471, 1, 0, 1,
-0.7845382, -0.1644488, -2.031764, 0.7098039, 1, 0, 1,
-0.78159, 0.8421988, 0.620851, 0.7058824, 1, 0, 1,
-0.7776114, -0.6502408, -2.234181, 0.6980392, 1, 0, 1,
-0.773777, 0.512695, -1.562842, 0.6901961, 1, 0, 1,
-0.7732968, 1.332049, -0.7083716, 0.6862745, 1, 0, 1,
-0.7727085, -0.09763297, -2.684798, 0.6784314, 1, 0, 1,
-0.7680208, 1.107917, -0.6752432, 0.6745098, 1, 0, 1,
-0.768, 0.6209932, -0.2900664, 0.6666667, 1, 0, 1,
-0.7677805, 0.09705453, -1.990274, 0.6627451, 1, 0, 1,
-0.7642223, 0.279065, -1.940926, 0.654902, 1, 0, 1,
-0.7630958, -0.1729216, -0.6038983, 0.6509804, 1, 0, 1,
-0.7544618, -0.3547961, -1.970415, 0.6431373, 1, 0, 1,
-0.7541961, -0.8965028, -4.150089, 0.6392157, 1, 0, 1,
-0.7529001, -0.7473136, -0.8583391, 0.6313726, 1, 0, 1,
-0.7465491, 0.7493238, 0.4132013, 0.627451, 1, 0, 1,
-0.7448459, -0.2577188, -1.030952, 0.6196079, 1, 0, 1,
-0.7428967, -0.8331349, -3.096894, 0.6156863, 1, 0, 1,
-0.7408451, -0.7458315, -2.460931, 0.6078432, 1, 0, 1,
-0.7400219, 0.8307256, -0.2283166, 0.6039216, 1, 0, 1,
-0.7371255, -1.669383, -3.038856, 0.5960785, 1, 0, 1,
-0.7361614, 0.9719831, -1.021906, 0.5882353, 1, 0, 1,
-0.7277616, 0.801029, -1.04196, 0.5843138, 1, 0, 1,
-0.725903, 0.620371, -3.046763, 0.5764706, 1, 0, 1,
-0.7254847, -0.8806184, -2.215437, 0.572549, 1, 0, 1,
-0.7242307, -2.075237, -2.672097, 0.5647059, 1, 0, 1,
-0.7216411, -0.1692568, -0.2981996, 0.5607843, 1, 0, 1,
-0.7093785, -0.8570397, -3.637146, 0.5529412, 1, 0, 1,
-0.7051096, 1.704277, -1.364788, 0.5490196, 1, 0, 1,
-0.7042381, -0.02184548, -1.232176, 0.5411765, 1, 0, 1,
-0.7002767, -0.4567701, -1.765585, 0.5372549, 1, 0, 1,
-0.6984178, 0.04802911, -2.182303, 0.5294118, 1, 0, 1,
-0.6979921, -0.001830218, 0.322122, 0.5254902, 1, 0, 1,
-0.6952874, 1.752289, -0.4057005, 0.5176471, 1, 0, 1,
-0.6921895, -0.7970312, -2.542559, 0.5137255, 1, 0, 1,
-0.6890496, -0.09521107, 0.1787983, 0.5058824, 1, 0, 1,
-0.6812631, -0.125682, -1.719092, 0.5019608, 1, 0, 1,
-0.6802403, -0.08047431, 0.3570652, 0.4941176, 1, 0, 1,
-0.6797613, -0.5265447, -2.286616, 0.4862745, 1, 0, 1,
-0.6661721, 0.3059298, -1.002006, 0.4823529, 1, 0, 1,
-0.6602471, 0.8506555, -1.216371, 0.4745098, 1, 0, 1,
-0.6594627, 1.573824, 0.970868, 0.4705882, 1, 0, 1,
-0.657129, 0.001605598, -1.478878, 0.4627451, 1, 0, 1,
-0.6559338, -1.217951, -3.186483, 0.4588235, 1, 0, 1,
-0.6554039, -0.2776717, -1.758324, 0.4509804, 1, 0, 1,
-0.6526377, 0.3635226, -0.6181937, 0.4470588, 1, 0, 1,
-0.6483728, 0.3043987, -2.689039, 0.4392157, 1, 0, 1,
-0.6479096, -0.0569557, -2.878749, 0.4352941, 1, 0, 1,
-0.6475924, 1.171478, -0.192758, 0.427451, 1, 0, 1,
-0.6433195, -1.187118, -4.076294, 0.4235294, 1, 0, 1,
-0.6237268, 0.7878239, -0.4710604, 0.4156863, 1, 0, 1,
-0.6223958, -0.7847878, -1.684042, 0.4117647, 1, 0, 1,
-0.6219575, 0.9930401, -1.755416, 0.4039216, 1, 0, 1,
-0.6180744, -0.09451306, -2.539599, 0.3960784, 1, 0, 1,
-0.6108872, 0.5963118, -2.738456, 0.3921569, 1, 0, 1,
-0.5983316, -0.551648, -1.996097, 0.3843137, 1, 0, 1,
-0.5871243, -0.5652184, -2.939077, 0.3803922, 1, 0, 1,
-0.5870114, -1.468611, -3.293083, 0.372549, 1, 0, 1,
-0.5845925, -0.5858923, -1.575772, 0.3686275, 1, 0, 1,
-0.5842233, 1.197142, -1.841778, 0.3607843, 1, 0, 1,
-0.5837232, -0.1081435, -0.1257833, 0.3568628, 1, 0, 1,
-0.5804155, -0.7415038, -3.183357, 0.3490196, 1, 0, 1,
-0.5754775, 1.487129, -0.7390021, 0.345098, 1, 0, 1,
-0.562601, 0.5245963, 0.5122267, 0.3372549, 1, 0, 1,
-0.5593218, 0.360156, -1.450027, 0.3333333, 1, 0, 1,
-0.5570654, 0.1819128, -0.7701263, 0.3254902, 1, 0, 1,
-0.5567863, -0.2906848, -1.67409, 0.3215686, 1, 0, 1,
-0.556379, -0.9359955, -2.865523, 0.3137255, 1, 0, 1,
-0.5557681, 1.050212, 0.3247218, 0.3098039, 1, 0, 1,
-0.5531517, 0.4558209, -1.340831, 0.3019608, 1, 0, 1,
-0.5510837, 0.2433692, -2.171769, 0.2941177, 1, 0, 1,
-0.5449079, 0.5351505, -0.6521554, 0.2901961, 1, 0, 1,
-0.5439729, 0.5179429, -2.10522, 0.282353, 1, 0, 1,
-0.5424485, 0.4659357, -1.12666, 0.2784314, 1, 0, 1,
-0.537966, 0.2361713, -1.517802, 0.2705882, 1, 0, 1,
-0.5348111, -0.07609043, -2.322116, 0.2666667, 1, 0, 1,
-0.5306145, 2.085273, -1.96238, 0.2588235, 1, 0, 1,
-0.5279712, 0.5915774, -0.8684105, 0.254902, 1, 0, 1,
-0.5260906, 1.173823, -0.9192648, 0.2470588, 1, 0, 1,
-0.5252232, 1.540716, -1.529733, 0.2431373, 1, 0, 1,
-0.5234574, 0.1003018, -3.990789, 0.2352941, 1, 0, 1,
-0.5205863, -1.696763, -3.063309, 0.2313726, 1, 0, 1,
-0.5162337, 0.4777503, -0.3630957, 0.2235294, 1, 0, 1,
-0.5153601, 1.267362, -1.443805, 0.2196078, 1, 0, 1,
-0.5097469, -0.2482009, -2.302159, 0.2117647, 1, 0, 1,
-0.5091324, 0.007790668, -0.6833034, 0.2078431, 1, 0, 1,
-0.4981414, -0.8345999, -2.422314, 0.2, 1, 0, 1,
-0.4913506, -0.1825847, -3.86894, 0.1921569, 1, 0, 1,
-0.4880562, -2.625714, -2.677444, 0.1882353, 1, 0, 1,
-0.4867924, -0.2337052, -1.931078, 0.1803922, 1, 0, 1,
-0.4858588, 1.125762, -0.2258097, 0.1764706, 1, 0, 1,
-0.4725762, -0.9541413, -2.901173, 0.1686275, 1, 0, 1,
-0.4718943, -0.1641793, -3.372384, 0.1647059, 1, 0, 1,
-0.4706462, -1.720149, -1.688545, 0.1568628, 1, 0, 1,
-0.4656696, -0.5473591, -1.408606, 0.1529412, 1, 0, 1,
-0.4655612, -1.08851, -1.713956, 0.145098, 1, 0, 1,
-0.4654909, 0.6315791, -1.835203, 0.1411765, 1, 0, 1,
-0.46458, -0.4382647, -2.909853, 0.1333333, 1, 0, 1,
-0.4619947, 1.284361, -2.82749, 0.1294118, 1, 0, 1,
-0.4603745, 0.2744766, -3.233632, 0.1215686, 1, 0, 1,
-0.4594718, 0.8619004, -0.2579926, 0.1176471, 1, 0, 1,
-0.4582899, -0.1767353, -2.874657, 0.1098039, 1, 0, 1,
-0.4559665, -0.1140301, -0.7314374, 0.1058824, 1, 0, 1,
-0.4537809, 0.09938069, -1.387214, 0.09803922, 1, 0, 1,
-0.4502139, 0.02946935, -1.242484, 0.09019608, 1, 0, 1,
-0.4489202, 0.1142143, -1.129797, 0.08627451, 1, 0, 1,
-0.4474944, 0.8108745, 0.6555578, 0.07843138, 1, 0, 1,
-0.4440348, 0.08554045, -1.154046, 0.07450981, 1, 0, 1,
-0.4411485, -0.6737214, -4.506907, 0.06666667, 1, 0, 1,
-0.4396892, 1.223026, -0.8202987, 0.0627451, 1, 0, 1,
-0.4372482, 1.036086, -1.744537, 0.05490196, 1, 0, 1,
-0.4371659, -2.08021, -2.018263, 0.05098039, 1, 0, 1,
-0.4352401, -0.2684077, -0.4053431, 0.04313726, 1, 0, 1,
-0.4349633, -0.5871891, -3.784039, 0.03921569, 1, 0, 1,
-0.4318421, 0.2338607, 1.088583, 0.03137255, 1, 0, 1,
-0.4270328, 0.4148998, -0.9836518, 0.02745098, 1, 0, 1,
-0.4184125, -1.676875, -2.599067, 0.01960784, 1, 0, 1,
-0.4182352, 0.1473599, 0.5188898, 0.01568628, 1, 0, 1,
-0.4122785, -1.552887, -2.118477, 0.007843138, 1, 0, 1,
-0.4105724, -0.1291805, -2.368452, 0.003921569, 1, 0, 1,
-0.4104813, 0.3426839, 0.5117539, 0, 1, 0.003921569, 1,
-0.4063146, -0.5256647, -3.184486, 0, 1, 0.01176471, 1,
-0.3999977, 0.4085513, -0.6604968, 0, 1, 0.01568628, 1,
-0.3960364, 1.188985, -0.2597204, 0, 1, 0.02352941, 1,
-0.3950413, 0.2460077, -0.1185981, 0, 1, 0.02745098, 1,
-0.3895824, 0.3041182, -2.005283, 0, 1, 0.03529412, 1,
-0.3877273, 0.6142792, -2.150609, 0, 1, 0.03921569, 1,
-0.3850984, -0.7608069, -2.387391, 0, 1, 0.04705882, 1,
-0.3847595, -0.8003994, -5.149994, 0, 1, 0.05098039, 1,
-0.3828736, 1.00903, -0.9862462, 0, 1, 0.05882353, 1,
-0.3795059, 0.844468, -0.01511857, 0, 1, 0.0627451, 1,
-0.3793407, 0.8241304, -1.486751, 0, 1, 0.07058824, 1,
-0.3767309, 1.259313, -0.636136, 0, 1, 0.07450981, 1,
-0.3711796, 0.7355497, -1.015558, 0, 1, 0.08235294, 1,
-0.3668593, 0.4391011, -0.3465115, 0, 1, 0.08627451, 1,
-0.3661085, -0.1495091, -3.894544, 0, 1, 0.09411765, 1,
-0.3581623, 0.64092, 0.6657256, 0, 1, 0.1019608, 1,
-0.3572907, 0.7530675, -0.06021182, 0, 1, 0.1058824, 1,
-0.352039, -0.7776012, -2.862509, 0, 1, 0.1137255, 1,
-0.3510592, 1.352347, -0.7804004, 0, 1, 0.1176471, 1,
-0.3502894, -0.34833, -1.831512, 0, 1, 0.1254902, 1,
-0.3488948, 0.5130736, -1.598595, 0, 1, 0.1294118, 1,
-0.346589, -1.837396, -2.771322, 0, 1, 0.1372549, 1,
-0.3454475, 0.5021544, 0.1245284, 0, 1, 0.1411765, 1,
-0.3451133, -0.1918321, -1.5761, 0, 1, 0.1490196, 1,
-0.3442318, 1.709706, -0.5017774, 0, 1, 0.1529412, 1,
-0.3432162, -0.1205196, -1.274063, 0, 1, 0.1607843, 1,
-0.3408008, 0.5560025, 0.8785445, 0, 1, 0.1647059, 1,
-0.3388837, -0.4966777, -2.18713, 0, 1, 0.172549, 1,
-0.3369788, -0.03183376, -2.409884, 0, 1, 0.1764706, 1,
-0.336356, 0.1099507, -1.146124, 0, 1, 0.1843137, 1,
-0.333124, 2.73418, 1.336024, 0, 1, 0.1882353, 1,
-0.3317712, 0.914163, -1.402186, 0, 1, 0.1960784, 1,
-0.3306984, 0.1989653, 0.8735321, 0, 1, 0.2039216, 1,
-0.3285638, -0.1115346, -2.023853, 0, 1, 0.2078431, 1,
-0.328395, 0.3520633, 0.5357403, 0, 1, 0.2156863, 1,
-0.3208402, -0.4332968, -2.351445, 0, 1, 0.2196078, 1,
-0.3208346, 0.9520208, 0.01253641, 0, 1, 0.227451, 1,
-0.3183174, -0.947178, -1.40572, 0, 1, 0.2313726, 1,
-0.3144377, 1.063618, 0.4202132, 0, 1, 0.2392157, 1,
-0.3077438, 0.2999398, -0.5228032, 0, 1, 0.2431373, 1,
-0.3060167, 0.8904208, -1.247885, 0, 1, 0.2509804, 1,
-0.3022737, -0.1448436, -1.753456, 0, 1, 0.254902, 1,
-0.2991776, 0.03625448, -2.28105, 0, 1, 0.2627451, 1,
-0.2973765, -2.362905, -2.724951, 0, 1, 0.2666667, 1,
-0.2934674, -1.196839, -4.439876, 0, 1, 0.2745098, 1,
-0.2880113, -0.8172604, -2.384842, 0, 1, 0.2784314, 1,
-0.2840298, -0.01225621, -0.2263861, 0, 1, 0.2862745, 1,
-0.2814197, 0.8306042, 0.3236362, 0, 1, 0.2901961, 1,
-0.2811274, -0.4743926, -2.145867, 0, 1, 0.2980392, 1,
-0.2758589, 0.8211182, -1.968504, 0, 1, 0.3058824, 1,
-0.275108, 0.1407714, -1.260345, 0, 1, 0.3098039, 1,
-0.2709899, 0.2701997, 0.7244791, 0, 1, 0.3176471, 1,
-0.2689977, 3.028484, -1.802855, 0, 1, 0.3215686, 1,
-0.2672961, -0.2034284, -1.043136, 0, 1, 0.3294118, 1,
-0.2627895, 0.9155891, 1.420067, 0, 1, 0.3333333, 1,
-0.2608812, -2.325763, -2.672278, 0, 1, 0.3411765, 1,
-0.2602977, 0.9765874, -0.1810393, 0, 1, 0.345098, 1,
-0.2595938, -0.03286755, -2.657215, 0, 1, 0.3529412, 1,
-0.2594381, -0.5046692, -2.990563, 0, 1, 0.3568628, 1,
-0.2524899, 1.405956, 1.291212, 0, 1, 0.3647059, 1,
-0.2495428, 0.2914984, -1.084895, 0, 1, 0.3686275, 1,
-0.2449316, 0.7298957, -0.9863227, 0, 1, 0.3764706, 1,
-0.2412969, 0.9788031, 0.7745598, 0, 1, 0.3803922, 1,
-0.2400122, 2.180814, -0.5119651, 0, 1, 0.3882353, 1,
-0.2321825, -0.2332871, -2.754417, 0, 1, 0.3921569, 1,
-0.2281177, -1.073805, -3.57819, 0, 1, 0.4, 1,
-0.2196152, -1.373368, -3.475829, 0, 1, 0.4078431, 1,
-0.2180734, 0.1664266, 0.2481916, 0, 1, 0.4117647, 1,
-0.2180512, -0.483816, -4.215919, 0, 1, 0.4196078, 1,
-0.2075737, -0.690507, -2.925534, 0, 1, 0.4235294, 1,
-0.2007092, -1.068333, -3.979291, 0, 1, 0.4313726, 1,
-0.1963147, 1.376526, -0.7968715, 0, 1, 0.4352941, 1,
-0.1933426, -2.026153, -1.356452, 0, 1, 0.4431373, 1,
-0.1917132, -1.934179, -3.659446, 0, 1, 0.4470588, 1,
-0.1894239, -0.5995511, -1.644215, 0, 1, 0.454902, 1,
-0.1863243, -1.080596, -5.191123, 0, 1, 0.4588235, 1,
-0.1860207, 0.2013067, -0.1353696, 0, 1, 0.4666667, 1,
-0.1815854, -2.127482, -3.354907, 0, 1, 0.4705882, 1,
-0.1745418, 0.8893592, 1.396874, 0, 1, 0.4784314, 1,
-0.1743894, 1.700097, 1.33645, 0, 1, 0.4823529, 1,
-0.1663507, 0.1955487, -0.3438318, 0, 1, 0.4901961, 1,
-0.1637848, 0.1543761, -1.149197, 0, 1, 0.4941176, 1,
-0.1630693, -0.8772475, -3.345245, 0, 1, 0.5019608, 1,
-0.1606122, 0.9389686, 0.246053, 0, 1, 0.509804, 1,
-0.1556431, 1.016513, -1.625987, 0, 1, 0.5137255, 1,
-0.1518189, -1.445087, -3.858851, 0, 1, 0.5215687, 1,
-0.1514661, 0.1648597, -2.948139, 0, 1, 0.5254902, 1,
-0.1510934, 0.03684507, -2.189664, 0, 1, 0.5333334, 1,
-0.1500555, 1.233643, 1.08887, 0, 1, 0.5372549, 1,
-0.1493432, 0.8807129, -0.2814068, 0, 1, 0.5450981, 1,
-0.1491861, -1.494104, -3.51995, 0, 1, 0.5490196, 1,
-0.1446576, 0.7619325, -0.2300798, 0, 1, 0.5568628, 1,
-0.1368779, 0.8021787, -0.06197124, 0, 1, 0.5607843, 1,
-0.1366714, 0.1984845, 1.441014, 0, 1, 0.5686275, 1,
-0.1340882, 0.1634091, -0.08182739, 0, 1, 0.572549, 1,
-0.1334484, 0.163057, -2.206352, 0, 1, 0.5803922, 1,
-0.1326126, -1.223804, -3.07161, 0, 1, 0.5843138, 1,
-0.1257549, -0.3709111, -3.609845, 0, 1, 0.5921569, 1,
-0.1214087, -0.6949779, -3.810597, 0, 1, 0.5960785, 1,
-0.1170567, -2.179619, -0.700592, 0, 1, 0.6039216, 1,
-0.1168954, 0.0006196623, -2.346426, 0, 1, 0.6117647, 1,
-0.1161258, 0.6262679, -1.12069, 0, 1, 0.6156863, 1,
-0.1126762, -1.040722, -3.455892, 0, 1, 0.6235294, 1,
-0.1123282, -0.6534758, -3.353462, 0, 1, 0.627451, 1,
-0.1115468, -0.5139431, -3.994766, 0, 1, 0.6352941, 1,
-0.1108757, -0.8385447, -3.060814, 0, 1, 0.6392157, 1,
-0.1107773, -1.172821, -4.672842, 0, 1, 0.6470588, 1,
-0.1087208, -0.05831436, -2.638669, 0, 1, 0.6509804, 1,
-0.1058213, 1.025175, 0.492861, 0, 1, 0.6588235, 1,
-0.1051678, -1.213112, -3.49632, 0, 1, 0.6627451, 1,
-0.1031482, 0.1466178, 0.4227768, 0, 1, 0.6705883, 1,
-0.09881467, 0.6096608, -1.227277, 0, 1, 0.6745098, 1,
-0.09680425, -0.5399028, -3.350794, 0, 1, 0.682353, 1,
-0.08995346, 0.3992977, 0.2020698, 0, 1, 0.6862745, 1,
-0.08932377, 0.9008802, 0.6247786, 0, 1, 0.6941177, 1,
-0.08699995, 0.08665247, -0.1151244, 0, 1, 0.7019608, 1,
-0.08681731, -1.448833, -5.611953, 0, 1, 0.7058824, 1,
-0.08301623, 0.2425102, 0.6316744, 0, 1, 0.7137255, 1,
-0.08062373, 1.089885, 0.3360233, 0, 1, 0.7176471, 1,
-0.07788756, -2.614885, -3.613751, 0, 1, 0.7254902, 1,
-0.07489198, 0.1418069, -2.059676, 0, 1, 0.7294118, 1,
-0.07244605, 0.347428, 0.1032273, 0, 1, 0.7372549, 1,
-0.07203864, -0.2044529, -2.977235, 0, 1, 0.7411765, 1,
-0.07132656, -0.5687783, -5.139095, 0, 1, 0.7490196, 1,
-0.07041939, 1.626639, 1.214055, 0, 1, 0.7529412, 1,
-0.06800538, -0.03791421, 0.1568819, 0, 1, 0.7607843, 1,
-0.05621708, -0.9958845, -3.886091, 0, 1, 0.7647059, 1,
-0.05518431, -0.2810177, -1.59322, 0, 1, 0.772549, 1,
-0.0539781, -0.6069947, -2.65503, 0, 1, 0.7764706, 1,
-0.05372002, -1.285665, -2.374318, 0, 1, 0.7843137, 1,
-0.0527588, -1.650955, -1.507786, 0, 1, 0.7882353, 1,
-0.052228, 0.4136589, -1.549152, 0, 1, 0.7960784, 1,
-0.0519047, -0.8435581, -3.875948, 0, 1, 0.8039216, 1,
-0.05167921, 0.4753878, -0.7106964, 0, 1, 0.8078431, 1,
-0.05119285, 1.119291, 0.2415696, 0, 1, 0.8156863, 1,
-0.04728981, -1.004957, -3.89132, 0, 1, 0.8196079, 1,
-0.04631818, 0.4799842, 0.9455183, 0, 1, 0.827451, 1,
-0.04545168, -0.3112764, -2.103817, 0, 1, 0.8313726, 1,
-0.04387876, -1.319775, -2.534319, 0, 1, 0.8392157, 1,
-0.03997022, -0.248581, -1.795087, 0, 1, 0.8431373, 1,
-0.03920579, -0.9392855, -2.671198, 0, 1, 0.8509804, 1,
-0.03561234, 0.7714031, 1.02673, 0, 1, 0.854902, 1,
-0.03333369, -1.35911, -2.448339, 0, 1, 0.8627451, 1,
-0.03019178, -0.1300941, -3.02173, 0, 1, 0.8666667, 1,
-0.02785438, -1.375581, -2.353626, 0, 1, 0.8745098, 1,
-0.02675615, -0.5866376, -1.50775, 0, 1, 0.8784314, 1,
-0.02426403, -0.3081738, -3.390533, 0, 1, 0.8862745, 1,
-0.01155208, 1.865931, 0.5071093, 0, 1, 0.8901961, 1,
-0.0108177, 1.061783, -0.74712, 0, 1, 0.8980392, 1,
-0.009651528, -0.5113204, -2.76133, 0, 1, 0.9058824, 1,
-0.00695328, 1.004948, 1.908732, 0, 1, 0.9098039, 1,
-0.005627114, -1.737098, -3.437221, 0, 1, 0.9176471, 1,
-0.005027577, 0.3680321, 0.3951197, 0, 1, 0.9215686, 1,
-0.004208877, -0.9878937, -2.33536, 0, 1, 0.9294118, 1,
-0.003427084, 0.3153289, -0.3043248, 0, 1, 0.9333333, 1,
-0.003297651, 1.658619, 1.116252, 0, 1, 0.9411765, 1,
-0.00191206, -0.4920589, -3.93488, 0, 1, 0.945098, 1,
-0.001307392, 0.8599384, -0.04558899, 0, 1, 0.9529412, 1,
0.005291485, -0.1544162, 4.649815, 0, 1, 0.9568627, 1,
0.008168895, -0.8238415, 3.229131, 0, 1, 0.9647059, 1,
0.009431088, 0.007553548, 1.730705, 0, 1, 0.9686275, 1,
0.01438155, 0.3984315, 0.1734015, 0, 1, 0.9764706, 1,
0.01482224, -0.1230106, 4.357393, 0, 1, 0.9803922, 1,
0.01506789, -0.5017314, 2.933652, 0, 1, 0.9882353, 1,
0.0163684, -0.6897367, 3.67898, 0, 1, 0.9921569, 1,
0.0219513, 0.3755808, 1.191773, 0, 1, 1, 1,
0.0247059, -0.155142, 2.327296, 0, 0.9921569, 1, 1,
0.02929367, -0.2715919, 3.815346, 0, 0.9882353, 1, 1,
0.03367215, 0.4255249, 1.183859, 0, 0.9803922, 1, 1,
0.03386717, 0.2375075, -0.585636, 0, 0.9764706, 1, 1,
0.03496326, 0.7010736, 0.1786962, 0, 0.9686275, 1, 1,
0.03636952, 1.59122, -1.156052, 0, 0.9647059, 1, 1,
0.0367802, 0.6427214, -0.4764441, 0, 0.9568627, 1, 1,
0.03805163, -0.1726555, 4.413293, 0, 0.9529412, 1, 1,
0.03926357, -0.61685, 2.593073, 0, 0.945098, 1, 1,
0.04371532, -0.3687822, 4.373404, 0, 0.9411765, 1, 1,
0.04422406, -1.391735, 4.130798, 0, 0.9333333, 1, 1,
0.0490938, 0.2106888, -0.31339, 0, 0.9294118, 1, 1,
0.05407768, -2.238408, 3.48377, 0, 0.9215686, 1, 1,
0.05512395, 0.4020491, 1.384092, 0, 0.9176471, 1, 1,
0.05675562, -1.127579, 2.692102, 0, 0.9098039, 1, 1,
0.06279231, 0.1476949, 0.7145644, 0, 0.9058824, 1, 1,
0.06960565, 0.4409694, 0.73177, 0, 0.8980392, 1, 1,
0.07024805, 0.8107709, 1.581703, 0, 0.8901961, 1, 1,
0.07554394, -0.7402198, 3.475646, 0, 0.8862745, 1, 1,
0.07607467, 0.2858733, -0.4441932, 0, 0.8784314, 1, 1,
0.07890671, 0.2684568, -0.3846588, 0, 0.8745098, 1, 1,
0.08397102, 0.6002446, 0.3614533, 0, 0.8666667, 1, 1,
0.08430818, 1.093955, 2.230024, 0, 0.8627451, 1, 1,
0.08468027, 0.9819069, -0.7736524, 0, 0.854902, 1, 1,
0.08713582, 0.1425685, -0.6213948, 0, 0.8509804, 1, 1,
0.0871891, -0.6390302, 4.850488, 0, 0.8431373, 1, 1,
0.09109242, -0.6721418, 3.508506, 0, 0.8392157, 1, 1,
0.09276008, -0.7981746, 2.618821, 0, 0.8313726, 1, 1,
0.09317003, 0.9137231, -0.3082351, 0, 0.827451, 1, 1,
0.09631587, 0.2797961, 1.136838, 0, 0.8196079, 1, 1,
0.09634764, -0.9075884, 2.223238, 0, 0.8156863, 1, 1,
0.102209, -1.247191, 3.043236, 0, 0.8078431, 1, 1,
0.1027417, -0.1896247, 2.718609, 0, 0.8039216, 1, 1,
0.1032411, -1.929998, 2.010175, 0, 0.7960784, 1, 1,
0.1085022, 1.656127, 0.6600731, 0, 0.7882353, 1, 1,
0.1105942, -0.09199103, 2.676638, 0, 0.7843137, 1, 1,
0.1114738, -0.2367692, 2.915928, 0, 0.7764706, 1, 1,
0.1133811, -1.139871, 1.784128, 0, 0.772549, 1, 1,
0.1152092, 0.5365557, 0.4831568, 0, 0.7647059, 1, 1,
0.1183072, 1.316156, 0.2009093, 0, 0.7607843, 1, 1,
0.1228358, -0.5594975, 2.584017, 0, 0.7529412, 1, 1,
0.1234173, 0.256473, 0.04380813, 0, 0.7490196, 1, 1,
0.1296035, 0.449082, -0.01322405, 0, 0.7411765, 1, 1,
0.1304722, 0.2838722, -0.1524408, 0, 0.7372549, 1, 1,
0.1308064, -0.5894296, 3.101727, 0, 0.7294118, 1, 1,
0.1353713, 0.4143877, -0.606363, 0, 0.7254902, 1, 1,
0.1400152, -0.465432, 2.251669, 0, 0.7176471, 1, 1,
0.140328, -1.866608, 2.748205, 0, 0.7137255, 1, 1,
0.1467746, -1.746212, 3.449016, 0, 0.7058824, 1, 1,
0.1481773, -0.2873386, 2.932753, 0, 0.6980392, 1, 1,
0.1492622, -0.01140814, 1.644523, 0, 0.6941177, 1, 1,
0.1526408, 0.5515713, 1.478403, 0, 0.6862745, 1, 1,
0.1534826, 0.0770594, -1.600652, 0, 0.682353, 1, 1,
0.1535238, 0.8275568, -0.04155279, 0, 0.6745098, 1, 1,
0.154388, -0.3005956, 0.493241, 0, 0.6705883, 1, 1,
0.1559018, 0.6822421, 0.01221886, 0, 0.6627451, 1, 1,
0.155967, 1.401105, -1.222851, 0, 0.6588235, 1, 1,
0.156449, 1.715272, 0.0407402, 0, 0.6509804, 1, 1,
0.1576472, 1.233183, -1.439762, 0, 0.6470588, 1, 1,
0.1587131, 0.4354777, 1.34717, 0, 0.6392157, 1, 1,
0.158914, 0.6347422, 0.3496854, 0, 0.6352941, 1, 1,
0.1638129, 1.57962, 0.512554, 0, 0.627451, 1, 1,
0.163858, 0.4109023, 0.09345023, 0, 0.6235294, 1, 1,
0.1699095, -1.033796, 2.545105, 0, 0.6156863, 1, 1,
0.1701776, 0.4031684, 0.1317317, 0, 0.6117647, 1, 1,
0.1709577, -0.5321133, 3.713872, 0, 0.6039216, 1, 1,
0.1710745, -0.1774392, 1.429002, 0, 0.5960785, 1, 1,
0.172063, -0.7851089, 2.016837, 0, 0.5921569, 1, 1,
0.1757353, 1.934806, -0.06744638, 0, 0.5843138, 1, 1,
0.1801748, 0.6649396, -0.7315049, 0, 0.5803922, 1, 1,
0.1833706, -1.292992, 2.009431, 0, 0.572549, 1, 1,
0.1848399, -0.5066285, 2.534263, 0, 0.5686275, 1, 1,
0.1863862, -0.6265524, 3.745075, 0, 0.5607843, 1, 1,
0.1869237, 0.7453761, 1.818902, 0, 0.5568628, 1, 1,
0.1879494, -0.07833465, 1.786954, 0, 0.5490196, 1, 1,
0.1881616, -0.1719585, 3.37531, 0, 0.5450981, 1, 1,
0.188661, 1.070496, 0.4079596, 0, 0.5372549, 1, 1,
0.1921062, -0.602945, 1.773554, 0, 0.5333334, 1, 1,
0.1924002, -0.07706603, 2.440431, 0, 0.5254902, 1, 1,
0.192555, -0.4132742, 2.446354, 0, 0.5215687, 1, 1,
0.1958928, -1.538411, 3.948042, 0, 0.5137255, 1, 1,
0.1970541, 0.6514891, 0.03074548, 0, 0.509804, 1, 1,
0.1972605, 0.6213987, 1.271285, 0, 0.5019608, 1, 1,
0.1995293, -0.2370099, 3.846782, 0, 0.4941176, 1, 1,
0.2009993, -0.02210069, 2.498047, 0, 0.4901961, 1, 1,
0.2019713, -1.122163, 1.627666, 0, 0.4823529, 1, 1,
0.2034915, 1.24835, 0.1109514, 0, 0.4784314, 1, 1,
0.203603, 0.7919936, 3.420977, 0, 0.4705882, 1, 1,
0.2050881, -0.575411, 4.209866, 0, 0.4666667, 1, 1,
0.2071295, -0.2183688, 2.67586, 0, 0.4588235, 1, 1,
0.2094412, 0.6366342, 0.9978003, 0, 0.454902, 1, 1,
0.2102645, 1.405768, 0.406962, 0, 0.4470588, 1, 1,
0.2132037, 1.762228, 0.2579302, 0, 0.4431373, 1, 1,
0.2144875, -0.7640125, 2.022337, 0, 0.4352941, 1, 1,
0.2150361, -0.2202468, 4.041254, 0, 0.4313726, 1, 1,
0.2160133, -0.6726477, 2.233435, 0, 0.4235294, 1, 1,
0.2169116, 0.7896408, -1.335495, 0, 0.4196078, 1, 1,
0.2170913, 0.3250008, 0.6104217, 0, 0.4117647, 1, 1,
0.2177542, -0.7592441, 2.983176, 0, 0.4078431, 1, 1,
0.2215516, 2.121059, 0.7178127, 0, 0.4, 1, 1,
0.2241971, 0.6921905, 2.068373, 0, 0.3921569, 1, 1,
0.2244061, 0.08476069, -0.2338094, 0, 0.3882353, 1, 1,
0.226039, 2.27775, -2.940771, 0, 0.3803922, 1, 1,
0.2262461, -0.148323, 1.570475, 0, 0.3764706, 1, 1,
0.2282861, -1.17227, 3.732274, 0, 0.3686275, 1, 1,
0.2291462, 0.1509163, 0.9502476, 0, 0.3647059, 1, 1,
0.2320046, 0.8398612, 0.5632905, 0, 0.3568628, 1, 1,
0.2342508, 1.211959, -0.9542377, 0, 0.3529412, 1, 1,
0.2361955, -0.4710105, 2.456932, 0, 0.345098, 1, 1,
0.2407964, -0.1348659, 1.653733, 0, 0.3411765, 1, 1,
0.2414928, 1.865999, 0.6878213, 0, 0.3333333, 1, 1,
0.2484569, -0.3457297, 4.241756, 0, 0.3294118, 1, 1,
0.2501318, -0.2821982, 1.870951, 0, 0.3215686, 1, 1,
0.2521372, 1.457999, -1.41597, 0, 0.3176471, 1, 1,
0.2521989, 0.8001068, 0.02238717, 0, 0.3098039, 1, 1,
0.2603392, -1.688009, 1.812034, 0, 0.3058824, 1, 1,
0.2615665, -0.2990977, 3.155396, 0, 0.2980392, 1, 1,
0.2712881, 0.6485164, -0.005051212, 0, 0.2901961, 1, 1,
0.2736046, -0.2691384, 1.561659, 0, 0.2862745, 1, 1,
0.2792587, -0.1125872, 1.261412, 0, 0.2784314, 1, 1,
0.2826859, 0.7928827, -0.3160355, 0, 0.2745098, 1, 1,
0.2828427, 0.2552896, 1.612656, 0, 0.2666667, 1, 1,
0.2843668, -0.07698999, 0.6022721, 0, 0.2627451, 1, 1,
0.2864152, -1.9433, 2.07198, 0, 0.254902, 1, 1,
0.2879123, 2.16622, 0.1855911, 0, 0.2509804, 1, 1,
0.2899562, -0.8507158, 4.210217, 0, 0.2431373, 1, 1,
0.2964738, -1.191769, 0.9226792, 0, 0.2392157, 1, 1,
0.2993976, 0.3395931, 0.1396731, 0, 0.2313726, 1, 1,
0.3012322, 0.6289208, -0.03409863, 0, 0.227451, 1, 1,
0.3015383, 0.2630616, 1.393287, 0, 0.2196078, 1, 1,
0.3030568, -0.9234273, 3.331409, 0, 0.2156863, 1, 1,
0.3031002, 1.471495, -0.1823396, 0, 0.2078431, 1, 1,
0.3095252, 0.1739041, 2.766564, 0, 0.2039216, 1, 1,
0.3126352, -0.005818431, 0.510448, 0, 0.1960784, 1, 1,
0.3186725, -1.673577, 1.457011, 0, 0.1882353, 1, 1,
0.3189128, 0.8185431, -0.1670397, 0, 0.1843137, 1, 1,
0.3233658, -0.202183, 0.73245, 0, 0.1764706, 1, 1,
0.3241009, 2.05619, -0.1469328, 0, 0.172549, 1, 1,
0.3295224, -0.1191224, 1.898644, 0, 0.1647059, 1, 1,
0.3369922, 1.473362, 1.722699, 0, 0.1607843, 1, 1,
0.3372068, -0.7203795, 2.938537, 0, 0.1529412, 1, 1,
0.3373154, -0.9753962, 4.019961, 0, 0.1490196, 1, 1,
0.3383836, -0.7070649, 3.142187, 0, 0.1411765, 1, 1,
0.3406735, 1.166191, 1.055399, 0, 0.1372549, 1, 1,
0.3434672, 1.43508, 0.1272732, 0, 0.1294118, 1, 1,
0.3442698, -1.223236, 1.826815, 0, 0.1254902, 1, 1,
0.3475783, 1.067911, 1.597898, 0, 0.1176471, 1, 1,
0.3500692, 0.001410508, 2.567763, 0, 0.1137255, 1, 1,
0.3624294, 0.117838, 2.655702, 0, 0.1058824, 1, 1,
0.365291, 0.5615214, 1.853252, 0, 0.09803922, 1, 1,
0.3654158, -1.208089, 4.449272, 0, 0.09411765, 1, 1,
0.3717977, -0.5467251, 2.520348, 0, 0.08627451, 1, 1,
0.371955, 1.130578, 0.5249402, 0, 0.08235294, 1, 1,
0.3770467, -0.118149, 1.400255, 0, 0.07450981, 1, 1,
0.3810682, -0.9338614, 4.600029, 0, 0.07058824, 1, 1,
0.3890063, -0.4319694, 2.689772, 0, 0.0627451, 1, 1,
0.3895027, 0.3272934, 3.937673, 0, 0.05882353, 1, 1,
0.3924601, 0.8821212, 0.7522985, 0, 0.05098039, 1, 1,
0.3960755, 0.4863171, 0.2856515, 0, 0.04705882, 1, 1,
0.3980506, -0.426894, 5.156576, 0, 0.03921569, 1, 1,
0.3986897, 0.4929031, 0.6797315, 0, 0.03529412, 1, 1,
0.399286, 1.656147, 0.934099, 0, 0.02745098, 1, 1,
0.3992963, -0.4812177, 5.583805, 0, 0.02352941, 1, 1,
0.4009596, -0.08959919, 1.231336, 0, 0.01568628, 1, 1,
0.4069373, -0.9242814, 3.467594, 0, 0.01176471, 1, 1,
0.408503, 1.314938, -1.228758, 0, 0.003921569, 1, 1,
0.4128653, -1.233981, 1.173264, 0.003921569, 0, 1, 1,
0.4173962, -0.723462, 1.656276, 0.007843138, 0, 1, 1,
0.4215986, 0.2082743, 2.381676, 0.01568628, 0, 1, 1,
0.4242181, 0.7501482, -1.365289, 0.01960784, 0, 1, 1,
0.424559, 0.733816, 1.57285, 0.02745098, 0, 1, 1,
0.4314622, 0.2264866, 0.9050898, 0.03137255, 0, 1, 1,
0.4324929, -0.2673712, 2.294098, 0.03921569, 0, 1, 1,
0.4364394, -0.8939132, 2.540045, 0.04313726, 0, 1, 1,
0.4380912, -0.4229123, 1.008873, 0.05098039, 0, 1, 1,
0.4489399, 1.208854, 1.396366, 0.05490196, 0, 1, 1,
0.4506909, 1.384788, 0.5541343, 0.0627451, 0, 1, 1,
0.4514254, 1.012013, 1.058521, 0.06666667, 0, 1, 1,
0.4536749, -3.168187, 4.479938, 0.07450981, 0, 1, 1,
0.4631879, 0.2507788, 0.8577925, 0.07843138, 0, 1, 1,
0.4702976, 0.3702856, 1.871597, 0.08627451, 0, 1, 1,
0.4764722, 0.7686402, 0.2434406, 0.09019608, 0, 1, 1,
0.479168, -1.652379, 2.440566, 0.09803922, 0, 1, 1,
0.4816448, 0.3314229, 1.630435, 0.1058824, 0, 1, 1,
0.4838382, 1.287378, -0.08338121, 0.1098039, 0, 1, 1,
0.4867262, 0.1859743, 1.551505, 0.1176471, 0, 1, 1,
0.4908, 1.80469, -0.09748573, 0.1215686, 0, 1, 1,
0.4939548, 1.061638, 0.8658636, 0.1294118, 0, 1, 1,
0.4945364, -1.172591, 3.239687, 0.1333333, 0, 1, 1,
0.495466, -0.2088205, 1.761132, 0.1411765, 0, 1, 1,
0.4996353, -1.516661, 4.443149, 0.145098, 0, 1, 1,
0.5019915, 1.053799, -0.09912596, 0.1529412, 0, 1, 1,
0.5032501, 0.3966758, 0.8379958, 0.1568628, 0, 1, 1,
0.5069728, -0.2698154, 2.038004, 0.1647059, 0, 1, 1,
0.5143635, -0.2494252, 1.981558, 0.1686275, 0, 1, 1,
0.5339747, 2.996228, -0.8415065, 0.1764706, 0, 1, 1,
0.539793, 0.1842849, 0.2266997, 0.1803922, 0, 1, 1,
0.5399444, -0.1633167, 0.3483012, 0.1882353, 0, 1, 1,
0.54102, -0.8654663, 2.380612, 0.1921569, 0, 1, 1,
0.5487366, 1.739983, -0.1691805, 0.2, 0, 1, 1,
0.5531279, -1.601397, 1.747071, 0.2078431, 0, 1, 1,
0.5542681, 1.00889, -1.243971, 0.2117647, 0, 1, 1,
0.5587819, -0.4490924, 3.121943, 0.2196078, 0, 1, 1,
0.5592878, 0.818535, 1.094277, 0.2235294, 0, 1, 1,
0.560779, -0.4787171, 2.70146, 0.2313726, 0, 1, 1,
0.5617065, 0.8024197, 2.118975, 0.2352941, 0, 1, 1,
0.5627871, 0.3577714, -1.370507, 0.2431373, 0, 1, 1,
0.5663513, -0.5515137, 0.9660113, 0.2470588, 0, 1, 1,
0.5720308, 0.5785311, -0.06155494, 0.254902, 0, 1, 1,
0.5744255, -0.7253413, 3.37625, 0.2588235, 0, 1, 1,
0.5760888, 0.7337639, 1.497425, 0.2666667, 0, 1, 1,
0.5805078, -0.5718794, 3.31925, 0.2705882, 0, 1, 1,
0.5806805, 0.976993, 0.7578816, 0.2784314, 0, 1, 1,
0.5829392, -1.704044, 1.67747, 0.282353, 0, 1, 1,
0.5853613, 2.063947, -0.8486666, 0.2901961, 0, 1, 1,
0.5884554, -1.201, 3.21749, 0.2941177, 0, 1, 1,
0.5900281, -1.094676, 2.684519, 0.3019608, 0, 1, 1,
0.5958325, 0.936859, 1.540209, 0.3098039, 0, 1, 1,
0.6037845, -0.5965317, 2.710707, 0.3137255, 0, 1, 1,
0.6053037, 2.261871, 1.903891, 0.3215686, 0, 1, 1,
0.6061876, 0.7244025, -0.101245, 0.3254902, 0, 1, 1,
0.6112801, -1.823102, 3.196225, 0.3333333, 0, 1, 1,
0.6131045, 0.7467512, -0.0654825, 0.3372549, 0, 1, 1,
0.6155323, 0.03225855, 2.080348, 0.345098, 0, 1, 1,
0.6176425, -1.231688, 3.069526, 0.3490196, 0, 1, 1,
0.6214907, -0.08886881, 1.338236, 0.3568628, 0, 1, 1,
0.621751, -1.146428, 2.860963, 0.3607843, 0, 1, 1,
0.624975, 1.502862, 0.9807422, 0.3686275, 0, 1, 1,
0.6292413, 1.399348, 0.960498, 0.372549, 0, 1, 1,
0.630688, -0.5164708, 2.985146, 0.3803922, 0, 1, 1,
0.6331196, -0.6033858, 0.1183925, 0.3843137, 0, 1, 1,
0.6370283, -0.7865485, 1.752329, 0.3921569, 0, 1, 1,
0.6396526, 1.204876, 1.561429, 0.3960784, 0, 1, 1,
0.6411827, -1.282733, 2.349746, 0.4039216, 0, 1, 1,
0.6429443, -0.005561063, 2.162638, 0.4117647, 0, 1, 1,
0.6479567, 0.1770848, 1.618555, 0.4156863, 0, 1, 1,
0.6535957, -1.6505, 1.795242, 0.4235294, 0, 1, 1,
0.672623, 0.6201139, 2.387304, 0.427451, 0, 1, 1,
0.6823811, 0.4332097, 2.193841, 0.4352941, 0, 1, 1,
0.6854703, 0.23514, -0.2468314, 0.4392157, 0, 1, 1,
0.6892505, -0.3268318, 1.645015, 0.4470588, 0, 1, 1,
0.692113, -1.062058, 3.239083, 0.4509804, 0, 1, 1,
0.6933761, 0.8229191, 1.435478, 0.4588235, 0, 1, 1,
0.6949559, -0.6582093, 5.168546, 0.4627451, 0, 1, 1,
0.7048057, 1.204445, 0.905128, 0.4705882, 0, 1, 1,
0.7052063, 1.689308, 0.1948609, 0.4745098, 0, 1, 1,
0.70649, 0.8738626, 1.366758, 0.4823529, 0, 1, 1,
0.7126166, -0.1012239, 0.9359638, 0.4862745, 0, 1, 1,
0.7138554, 0.7281491, 0.1389762, 0.4941176, 0, 1, 1,
0.7157127, -0.3557448, 1.584394, 0.5019608, 0, 1, 1,
0.7162215, -0.1434421, 1.910692, 0.5058824, 0, 1, 1,
0.7171505, -0.8608667, 4.102656, 0.5137255, 0, 1, 1,
0.7216826, -0.6855868, 1.056471, 0.5176471, 0, 1, 1,
0.7302623, 0.3675623, 1.864689, 0.5254902, 0, 1, 1,
0.7326859, -0.7112159, 3.607641, 0.5294118, 0, 1, 1,
0.7378336, 0.5002464, 2.63114, 0.5372549, 0, 1, 1,
0.7421027, 1.761007, 1.632213, 0.5411765, 0, 1, 1,
0.7424802, -1.133853, 1.40488, 0.5490196, 0, 1, 1,
0.7446713, 0.910414, 0.8770152, 0.5529412, 0, 1, 1,
0.7456901, 0.09519505, 1.483454, 0.5607843, 0, 1, 1,
0.7457358, 2.310812, 1.300512, 0.5647059, 0, 1, 1,
0.7490531, 0.7051427, 0.1846322, 0.572549, 0, 1, 1,
0.750693, -0.08920293, 2.023947, 0.5764706, 0, 1, 1,
0.754971, -1.736282, 2.422348, 0.5843138, 0, 1, 1,
0.7552534, 0.1940044, 1.198143, 0.5882353, 0, 1, 1,
0.7555284, 0.6890275, 1.991085, 0.5960785, 0, 1, 1,
0.7568813, 0.8746424, 1.238574, 0.6039216, 0, 1, 1,
0.7583364, -0.2072848, 3.622789, 0.6078432, 0, 1, 1,
0.7586915, -0.6149163, 1.287892, 0.6156863, 0, 1, 1,
0.7614396, -0.03970776, 2.946596, 0.6196079, 0, 1, 1,
0.7615546, 0.6095874, 1.189826, 0.627451, 0, 1, 1,
0.7679294, -1.271416, 3.151724, 0.6313726, 0, 1, 1,
0.768351, -0.003425815, 2.776503, 0.6392157, 0, 1, 1,
0.7694902, 0.2417782, -1.166423, 0.6431373, 0, 1, 1,
0.7702128, 0.6682739, 0.4720282, 0.6509804, 0, 1, 1,
0.7740938, -1.094131, 2.565449, 0.654902, 0, 1, 1,
0.7766607, 0.4200717, 2.717614, 0.6627451, 0, 1, 1,
0.777164, 0.2674114, 3.084128, 0.6666667, 0, 1, 1,
0.7783209, 0.5679563, 2.15936, 0.6745098, 0, 1, 1,
0.7801604, -0.2345716, 0.08154995, 0.6784314, 0, 1, 1,
0.7810168, -0.8373674, 3.033097, 0.6862745, 0, 1, 1,
0.7872794, 0.3533388, 1.837944, 0.6901961, 0, 1, 1,
0.7915862, 0.4196893, 0.9483034, 0.6980392, 0, 1, 1,
0.7932873, -1.580343, 2.993271, 0.7058824, 0, 1, 1,
0.797008, -2.438353, 4.044569, 0.7098039, 0, 1, 1,
0.7973086, 1.139003, 2.369375, 0.7176471, 0, 1, 1,
0.8056779, 1.973149, -2.381498, 0.7215686, 0, 1, 1,
0.8056816, 1.441213, -0.06250153, 0.7294118, 0, 1, 1,
0.8059847, 0.1930608, 2.20122, 0.7333333, 0, 1, 1,
0.8100042, 0.2645489, 2.635868, 0.7411765, 0, 1, 1,
0.8118682, -0.9046899, 4.908173, 0.7450981, 0, 1, 1,
0.8197811, -0.2488064, 0.5451566, 0.7529412, 0, 1, 1,
0.8201197, -0.7385792, 2.873724, 0.7568628, 0, 1, 1,
0.822001, -0.3330169, 0.8718833, 0.7647059, 0, 1, 1,
0.8224397, -0.06071183, 0.7508432, 0.7686275, 0, 1, 1,
0.825869, 2.654006, -0.4225546, 0.7764706, 0, 1, 1,
0.8291382, -0.8023863, 2.528844, 0.7803922, 0, 1, 1,
0.8296391, 0.2373342, 0.9851735, 0.7882353, 0, 1, 1,
0.8345786, 0.148525, 1.80615, 0.7921569, 0, 1, 1,
0.8381985, 0.3761706, 1.1871, 0.8, 0, 1, 1,
0.8455865, 0.6337644, 2.222631, 0.8078431, 0, 1, 1,
0.8498175, 0.1457828, 0.7584715, 0.8117647, 0, 1, 1,
0.8507767, 1.712854, 1.855303, 0.8196079, 0, 1, 1,
0.8533887, -0.2591014, 1.606688, 0.8235294, 0, 1, 1,
0.8546745, -0.73382, 1.267272, 0.8313726, 0, 1, 1,
0.8585734, -1.340184, 3.67781, 0.8352941, 0, 1, 1,
0.8654661, -0.7145701, 2.576293, 0.8431373, 0, 1, 1,
0.8731752, 1.248828, 0.7147214, 0.8470588, 0, 1, 1,
0.8735493, 0.5495092, 1.547511, 0.854902, 0, 1, 1,
0.8803922, 1.094687, 1.043305, 0.8588235, 0, 1, 1,
0.9113975, -2.606525, 2.337325, 0.8666667, 0, 1, 1,
0.925891, -0.9927988, 1.719202, 0.8705882, 0, 1, 1,
0.9277641, 2.633984, 1.346931, 0.8784314, 0, 1, 1,
0.9397994, -0.3697077, 2.23516, 0.8823529, 0, 1, 1,
0.9412024, -0.2744049, 1.110502, 0.8901961, 0, 1, 1,
0.9433261, 1.200116, 2.034387, 0.8941177, 0, 1, 1,
0.9457549, -0.790153, 2.185492, 0.9019608, 0, 1, 1,
0.9517171, -0.03654875, 2.167444, 0.9098039, 0, 1, 1,
0.9558021, 1.658369, 0.06027129, 0.9137255, 0, 1, 1,
0.9603769, -0.02587599, 3.281635, 0.9215686, 0, 1, 1,
0.9741006, -0.4638957, 1.750691, 0.9254902, 0, 1, 1,
0.9751369, -0.7859917, 2.137148, 0.9333333, 0, 1, 1,
0.9753344, -0.524617, 4.210887, 0.9372549, 0, 1, 1,
0.9868094, -1.221751, 2.103636, 0.945098, 0, 1, 1,
0.987061, -0.9738159, 2.235909, 0.9490196, 0, 1, 1,
0.9880444, 0.8908883, 1.183412, 0.9568627, 0, 1, 1,
0.9898386, 0.2202722, 2.682584, 0.9607843, 0, 1, 1,
0.9909484, -1.050328, 1.223954, 0.9686275, 0, 1, 1,
0.9916432, 0.4206625, 0.6335187, 0.972549, 0, 1, 1,
0.9940546, 1.194582, -0.7568473, 0.9803922, 0, 1, 1,
0.9946313, -0.1644963, 2.054018, 0.9843137, 0, 1, 1,
1.001877, 1.631584, 1.038305, 0.9921569, 0, 1, 1,
1.003957, 0.5149742, 2.052924, 0.9960784, 0, 1, 1,
1.005597, 0.862836, 0.2823778, 1, 0, 0.9960784, 1,
1.005889, -0.5944288, 0.970697, 1, 0, 0.9882353, 1,
1.008909, -0.3899124, 3.098445, 1, 0, 0.9843137, 1,
1.019396, -0.3195939, 2.153763, 1, 0, 0.9764706, 1,
1.019897, -1.189512, 1.32399, 1, 0, 0.972549, 1,
1.026401, 0.4672045, 0.2773719, 1, 0, 0.9647059, 1,
1.031794, 0.3852745, 1.014685, 1, 0, 0.9607843, 1,
1.03632, -1.641614, 1.920392, 1, 0, 0.9529412, 1,
1.040513, 0.3372828, 2.645426, 1, 0, 0.9490196, 1,
1.041876, 0.7336411, -1.136373, 1, 0, 0.9411765, 1,
1.043255, -1.611366, 5.321908, 1, 0, 0.9372549, 1,
1.045387, 0.166873, 0.4740642, 1, 0, 0.9294118, 1,
1.045969, -0.3755134, 1.833916, 1, 0, 0.9254902, 1,
1.049762, 1.769639, 1.328385, 1, 0, 0.9176471, 1,
1.074931, -1.239326, 1.275554, 1, 0, 0.9137255, 1,
1.075608, 2.054909, 0.1853406, 1, 0, 0.9058824, 1,
1.079157, 0.2670847, 1.495869, 1, 0, 0.9019608, 1,
1.080135, -0.7064166, 3.349479, 1, 0, 0.8941177, 1,
1.088875, -0.5057105, 1.609811, 1, 0, 0.8862745, 1,
1.096132, -0.1502527, -0.8628783, 1, 0, 0.8823529, 1,
1.096867, 0.03274805, 1.782496, 1, 0, 0.8745098, 1,
1.103621, 0.8086243, 1.659754, 1, 0, 0.8705882, 1,
1.116912, 0.4527294, 2.247263, 1, 0, 0.8627451, 1,
1.124134, 0.9891779, -0.2629564, 1, 0, 0.8588235, 1,
1.136067, -0.1168754, 1.303766, 1, 0, 0.8509804, 1,
1.138553, -1.389761, 1.594347, 1, 0, 0.8470588, 1,
1.139136, 0.3012449, 1.824633, 1, 0, 0.8392157, 1,
1.143304, -0.5376965, 3.462336, 1, 0, 0.8352941, 1,
1.147924, -0.3417659, 2.362137, 1, 0, 0.827451, 1,
1.149373, -0.739145, 2.668965, 1, 0, 0.8235294, 1,
1.155829, -0.9621028, 3.227835, 1, 0, 0.8156863, 1,
1.158557, -1.030211, 2.680126, 1, 0, 0.8117647, 1,
1.159779, -0.3905995, 2.245981, 1, 0, 0.8039216, 1,
1.161465, -0.3720318, 2.581248, 1, 0, 0.7960784, 1,
1.17553, 0.542448, -0.03746062, 1, 0, 0.7921569, 1,
1.183404, -1.632832, 2.589468, 1, 0, 0.7843137, 1,
1.187009, 0.6636583, 1.166175, 1, 0, 0.7803922, 1,
1.187501, 0.8798941, 0.3356873, 1, 0, 0.772549, 1,
1.193406, 0.3292847, 0.7739266, 1, 0, 0.7686275, 1,
1.202252, -0.287056, 2.332234, 1, 0, 0.7607843, 1,
1.203786, 0.1094835, 0.8135186, 1, 0, 0.7568628, 1,
1.208697, 0.2773253, 2.420116, 1, 0, 0.7490196, 1,
1.20905, -1.041807, 0.9674044, 1, 0, 0.7450981, 1,
1.209985, 0.3097905, 1.303721, 1, 0, 0.7372549, 1,
1.210291, 1.498817, 0.08228574, 1, 0, 0.7333333, 1,
1.215312, -0.613797, 2.278293, 1, 0, 0.7254902, 1,
1.215749, -0.07775778, 1.020954, 1, 0, 0.7215686, 1,
1.21689, 0.4624842, 0.291655, 1, 0, 0.7137255, 1,
1.21832, 0.1489515, -0.6101345, 1, 0, 0.7098039, 1,
1.219968, -0.5346924, 0.9618352, 1, 0, 0.7019608, 1,
1.223468, -1.048592, 3.090221, 1, 0, 0.6941177, 1,
1.243765, -1.775389, 3.569867, 1, 0, 0.6901961, 1,
1.248884, 0.5671737, 1.741205, 1, 0, 0.682353, 1,
1.249539, 1.383033, 0.9150443, 1, 0, 0.6784314, 1,
1.25142, 0.2063035, 1.545986, 1, 0, 0.6705883, 1,
1.261817, -0.4439009, 2.919827, 1, 0, 0.6666667, 1,
1.261865, -1.136444, 2.545675, 1, 0, 0.6588235, 1,
1.269266, 1.112537, 0.318774, 1, 0, 0.654902, 1,
1.278654, -0.9646654, 2.505547, 1, 0, 0.6470588, 1,
1.300487, 0.06824107, 1.770436, 1, 0, 0.6431373, 1,
1.301056, 0.8728656, 0.1880324, 1, 0, 0.6352941, 1,
1.310539, 0.2296845, 0.8499566, 1, 0, 0.6313726, 1,
1.317665, 0.7249345, 2.636787, 1, 0, 0.6235294, 1,
1.32123, 0.654583, 0.6609696, 1, 0, 0.6196079, 1,
1.325228, -0.8725843, 0.183184, 1, 0, 0.6117647, 1,
1.326787, -0.1756662, 0.7373784, 1, 0, 0.6078432, 1,
1.32868, 0.06199917, 0.7177641, 1, 0, 0.6, 1,
1.332556, -2.104707, 2.465773, 1, 0, 0.5921569, 1,
1.333642, 0.5548519, 2.785123, 1, 0, 0.5882353, 1,
1.341228, 0.1909839, 0.967872, 1, 0, 0.5803922, 1,
1.344559, -0.4658605, 2.856247, 1, 0, 0.5764706, 1,
1.355444, 0.9359463, -0.2230779, 1, 0, 0.5686275, 1,
1.373308, 0.5900992, 0.9813322, 1, 0, 0.5647059, 1,
1.374509, -0.4324048, 3.1437, 1, 0, 0.5568628, 1,
1.389749, 2.481841, 1.096923, 1, 0, 0.5529412, 1,
1.396101, 1.054454, 0.1980665, 1, 0, 0.5450981, 1,
1.4019, 1.402113, 0.9185714, 1, 0, 0.5411765, 1,
1.414728, -2.208059, 3.206842, 1, 0, 0.5333334, 1,
1.424278, 0.2599569, 0.3291334, 1, 0, 0.5294118, 1,
1.427746, 0.4860733, 0.6786521, 1, 0, 0.5215687, 1,
1.430004, 1.46675, 0.2328112, 1, 0, 0.5176471, 1,
1.430004, 0.4028924, 0.4304314, 1, 0, 0.509804, 1,
1.430562, -0.8072252, 2.12891, 1, 0, 0.5058824, 1,
1.432775, -1.309914, 2.314389, 1, 0, 0.4980392, 1,
1.434316, 0.732499, -1.189122, 1, 0, 0.4901961, 1,
1.455189, 0.9174654, 0.9936315, 1, 0, 0.4862745, 1,
1.460708, 0.6635969, 1.731083, 1, 0, 0.4784314, 1,
1.460968, -1.459461, 2.516827, 1, 0, 0.4745098, 1,
1.463962, 1.638406, 1.44639, 1, 0, 0.4666667, 1,
1.465358, 0.8061431, 1.20528, 1, 0, 0.4627451, 1,
1.468173, 1.628824, 0.9374722, 1, 0, 0.454902, 1,
1.469759, 1.003852, 2.301981, 1, 0, 0.4509804, 1,
1.476049, 2.833761, -0.7114588, 1, 0, 0.4431373, 1,
1.476072, 0.3856095, 1.977189, 1, 0, 0.4392157, 1,
1.4843, 0.4740092, 2.254752, 1, 0, 0.4313726, 1,
1.48823, 0.1526669, 2.064807, 1, 0, 0.427451, 1,
1.492351, -0.8459401, 1.60703, 1, 0, 0.4196078, 1,
1.494859, -0.2015145, 2.470036, 1, 0, 0.4156863, 1,
1.50308, -0.620517, 2.86356, 1, 0, 0.4078431, 1,
1.504343, -0.6253358, 1.070357, 1, 0, 0.4039216, 1,
1.515262, 1.230302, 1.016667, 1, 0, 0.3960784, 1,
1.52636, 0.8229297, 0.9888006, 1, 0, 0.3882353, 1,
1.548294, 0.2510891, 0.7002534, 1, 0, 0.3843137, 1,
1.568833, -0.4077303, 0.1483476, 1, 0, 0.3764706, 1,
1.571379, 1.427418, 0.1156069, 1, 0, 0.372549, 1,
1.589533, -0.7137928, 2.114227, 1, 0, 0.3647059, 1,
1.589853, 0.6477346, 0.8061495, 1, 0, 0.3607843, 1,
1.595224, -1.131681, 1.517514, 1, 0, 0.3529412, 1,
1.603217, 1.33707, 0.3456794, 1, 0, 0.3490196, 1,
1.607956, -1.482024, 4.930542, 1, 0, 0.3411765, 1,
1.610063, -0.1973501, 1.205825, 1, 0, 0.3372549, 1,
1.637947, 0.09936045, -0.0006379005, 1, 0, 0.3294118, 1,
1.65301, 1.565484, -0.5883617, 1, 0, 0.3254902, 1,
1.680599, -0.2417841, 1.692577, 1, 0, 0.3176471, 1,
1.686404, -1.148576, 2.259157, 1, 0, 0.3137255, 1,
1.689011, 0.654823, 1.466721, 1, 0, 0.3058824, 1,
1.692266, 0.3614056, -0.4412434, 1, 0, 0.2980392, 1,
1.693206, 1.447115, 1.123922, 1, 0, 0.2941177, 1,
1.704036, -0.102719, 2.537288, 1, 0, 0.2862745, 1,
1.706591, -0.422087, 0.6087382, 1, 0, 0.282353, 1,
1.720959, 1.100342, 0.2456478, 1, 0, 0.2745098, 1,
1.72618, 0.718723, 1.432492, 1, 0, 0.2705882, 1,
1.730063, -0.5269418, 2.363924, 1, 0, 0.2627451, 1,
1.750192, 1.524997, 1.656091, 1, 0, 0.2588235, 1,
1.766249, 0.06405916, 0.4069093, 1, 0, 0.2509804, 1,
1.775771, -0.338468, 1.294562, 1, 0, 0.2470588, 1,
1.795743, 1.467277, 0.5139073, 1, 0, 0.2392157, 1,
1.798943, 1.066732, 0.3209499, 1, 0, 0.2352941, 1,
1.803119, 0.5413082, 2.262327, 1, 0, 0.227451, 1,
1.807395, 0.5872071, -0.08105641, 1, 0, 0.2235294, 1,
1.831463, -2.958158, 1.046232, 1, 0, 0.2156863, 1,
1.840799, -0.4835187, 2.809155, 1, 0, 0.2117647, 1,
1.854309, -0.07693275, 2.775957, 1, 0, 0.2039216, 1,
1.88293, 0.2711644, 2.694838, 1, 0, 0.1960784, 1,
1.886063, -0.812722, 3.275182, 1, 0, 0.1921569, 1,
1.888054, -0.9383647, 2.392663, 1, 0, 0.1843137, 1,
1.897413, 0.06920774, 0.9732031, 1, 0, 0.1803922, 1,
1.906147, -0.3602988, 1.982483, 1, 0, 0.172549, 1,
1.921096, -1.674505, 2.877622, 1, 0, 0.1686275, 1,
1.944194, -0.008973439, 1.854072, 1, 0, 0.1607843, 1,
1.968452, -0.3867995, 0.7633024, 1, 0, 0.1568628, 1,
1.97289, -0.4861223, 2.007362, 1, 0, 0.1490196, 1,
1.980825, -1.069739, 1.515235, 1, 0, 0.145098, 1,
2.008065, -1.98916, 5.118185, 1, 0, 0.1372549, 1,
2.066808, 1.005237, 1.068506, 1, 0, 0.1333333, 1,
2.070259, -0.3888171, 0.8852891, 1, 0, 0.1254902, 1,
2.108546, -1.045957, 1.478579, 1, 0, 0.1215686, 1,
2.148839, 0.01527298, 1.297398, 1, 0, 0.1137255, 1,
2.19523, 0.08518405, 1.84266, 1, 0, 0.1098039, 1,
2.206853, 0.2693888, 1.426857, 1, 0, 0.1019608, 1,
2.209563, 0.7928044, 2.73012, 1, 0, 0.09411765, 1,
2.250683, 0.2097433, 2.384003, 1, 0, 0.09019608, 1,
2.281254, 0.3943024, 0.8959875, 1, 0, 0.08235294, 1,
2.374733, -0.1838502, 0.230824, 1, 0, 0.07843138, 1,
2.382941, 0.4130157, 2.957317, 1, 0, 0.07058824, 1,
2.444806, -2.35888, 1.855436, 1, 0, 0.06666667, 1,
2.462037, 0.5695275, 1.011846, 1, 0, 0.05882353, 1,
2.484432, 0.5877622, 1.620201, 1, 0, 0.05490196, 1,
2.511545, 0.1624651, 0.4911938, 1, 0, 0.04705882, 1,
2.522683, 0.004984862, 1.315874, 1, 0, 0.04313726, 1,
2.628102, -1.02041, 2.522059, 1, 0, 0.03529412, 1,
2.764348, -0.4575535, 1.583052, 1, 0, 0.03137255, 1,
2.78935, 0.1671063, 1.566021, 1, 0, 0.02352941, 1,
2.835792, 1.896417, 1.011077, 1, 0, 0.01960784, 1,
2.842363, -2.232006, 3.9479, 1, 0, 0.01176471, 1,
3.236091, 0.1001104, 0.5284058, 1, 0, 0.007843138, 1
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
-0.0321213, -4.218523, -7.509634, 0, -0.5, 0.5, 0.5,
-0.0321213, -4.218523, -7.509634, 1, -0.5, 0.5, 0.5,
-0.0321213, -4.218523, -7.509634, 1, 1.5, 0.5, 0.5,
-0.0321213, -4.218523, -7.509634, 0, 1.5, 0.5, 0.5
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
-4.408257, -0.06985128, -7.509634, 0, -0.5, 0.5, 0.5,
-4.408257, -0.06985128, -7.509634, 1, -0.5, 0.5, 0.5,
-4.408257, -0.06985128, -7.509634, 1, 1.5, 0.5, 0.5,
-4.408257, -0.06985128, -7.509634, 0, 1.5, 0.5, 0.5
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
-4.408257, -4.218523, -0.01407385, 0, -0.5, 0.5, 0.5,
-4.408257, -4.218523, -0.01407385, 1, -0.5, 0.5, 0.5,
-4.408257, -4.218523, -0.01407385, 1, 1.5, 0.5, 0.5,
-4.408257, -4.218523, -0.01407385, 0, 1.5, 0.5, 0.5
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
-3, -3.261137, -5.779889,
3, -3.261137, -5.779889,
-3, -3.261137, -5.779889,
-3, -3.420701, -6.06818,
-2, -3.261137, -5.779889,
-2, -3.420701, -6.06818,
-1, -3.261137, -5.779889,
-1, -3.420701, -6.06818,
0, -3.261137, -5.779889,
0, -3.420701, -6.06818,
1, -3.261137, -5.779889,
1, -3.420701, -6.06818,
2, -3.261137, -5.779889,
2, -3.420701, -6.06818,
3, -3.261137, -5.779889,
3, -3.420701, -6.06818
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
-3, -3.73983, -6.644762, 0, -0.5, 0.5, 0.5,
-3, -3.73983, -6.644762, 1, -0.5, 0.5, 0.5,
-3, -3.73983, -6.644762, 1, 1.5, 0.5, 0.5,
-3, -3.73983, -6.644762, 0, 1.5, 0.5, 0.5,
-2, -3.73983, -6.644762, 0, -0.5, 0.5, 0.5,
-2, -3.73983, -6.644762, 1, -0.5, 0.5, 0.5,
-2, -3.73983, -6.644762, 1, 1.5, 0.5, 0.5,
-2, -3.73983, -6.644762, 0, 1.5, 0.5, 0.5,
-1, -3.73983, -6.644762, 0, -0.5, 0.5, 0.5,
-1, -3.73983, -6.644762, 1, -0.5, 0.5, 0.5,
-1, -3.73983, -6.644762, 1, 1.5, 0.5, 0.5,
-1, -3.73983, -6.644762, 0, 1.5, 0.5, 0.5,
0, -3.73983, -6.644762, 0, -0.5, 0.5, 0.5,
0, -3.73983, -6.644762, 1, -0.5, 0.5, 0.5,
0, -3.73983, -6.644762, 1, 1.5, 0.5, 0.5,
0, -3.73983, -6.644762, 0, 1.5, 0.5, 0.5,
1, -3.73983, -6.644762, 0, -0.5, 0.5, 0.5,
1, -3.73983, -6.644762, 1, -0.5, 0.5, 0.5,
1, -3.73983, -6.644762, 1, 1.5, 0.5, 0.5,
1, -3.73983, -6.644762, 0, 1.5, 0.5, 0.5,
2, -3.73983, -6.644762, 0, -0.5, 0.5, 0.5,
2, -3.73983, -6.644762, 1, -0.5, 0.5, 0.5,
2, -3.73983, -6.644762, 1, 1.5, 0.5, 0.5,
2, -3.73983, -6.644762, 0, 1.5, 0.5, 0.5,
3, -3.73983, -6.644762, 0, -0.5, 0.5, 0.5,
3, -3.73983, -6.644762, 1, -0.5, 0.5, 0.5,
3, -3.73983, -6.644762, 1, 1.5, 0.5, 0.5,
3, -3.73983, -6.644762, 0, 1.5, 0.5, 0.5
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
-3.39838, -3, -5.779889,
-3.39838, 3, -5.779889,
-3.39838, -3, -5.779889,
-3.566693, -3, -6.06818,
-3.39838, -2, -5.779889,
-3.566693, -2, -6.06818,
-3.39838, -1, -5.779889,
-3.566693, -1, -6.06818,
-3.39838, 0, -5.779889,
-3.566693, 0, -6.06818,
-3.39838, 1, -5.779889,
-3.566693, 1, -6.06818,
-3.39838, 2, -5.779889,
-3.566693, 2, -6.06818,
-3.39838, 3, -5.779889,
-3.566693, 3, -6.06818
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
-3.903318, -3, -6.644762, 0, -0.5, 0.5, 0.5,
-3.903318, -3, -6.644762, 1, -0.5, 0.5, 0.5,
-3.903318, -3, -6.644762, 1, 1.5, 0.5, 0.5,
-3.903318, -3, -6.644762, 0, 1.5, 0.5, 0.5,
-3.903318, -2, -6.644762, 0, -0.5, 0.5, 0.5,
-3.903318, -2, -6.644762, 1, -0.5, 0.5, 0.5,
-3.903318, -2, -6.644762, 1, 1.5, 0.5, 0.5,
-3.903318, -2, -6.644762, 0, 1.5, 0.5, 0.5,
-3.903318, -1, -6.644762, 0, -0.5, 0.5, 0.5,
-3.903318, -1, -6.644762, 1, -0.5, 0.5, 0.5,
-3.903318, -1, -6.644762, 1, 1.5, 0.5, 0.5,
-3.903318, -1, -6.644762, 0, 1.5, 0.5, 0.5,
-3.903318, 0, -6.644762, 0, -0.5, 0.5, 0.5,
-3.903318, 0, -6.644762, 1, -0.5, 0.5, 0.5,
-3.903318, 0, -6.644762, 1, 1.5, 0.5, 0.5,
-3.903318, 0, -6.644762, 0, 1.5, 0.5, 0.5,
-3.903318, 1, -6.644762, 0, -0.5, 0.5, 0.5,
-3.903318, 1, -6.644762, 1, -0.5, 0.5, 0.5,
-3.903318, 1, -6.644762, 1, 1.5, 0.5, 0.5,
-3.903318, 1, -6.644762, 0, 1.5, 0.5, 0.5,
-3.903318, 2, -6.644762, 0, -0.5, 0.5, 0.5,
-3.903318, 2, -6.644762, 1, -0.5, 0.5, 0.5,
-3.903318, 2, -6.644762, 1, 1.5, 0.5, 0.5,
-3.903318, 2, -6.644762, 0, 1.5, 0.5, 0.5,
-3.903318, 3, -6.644762, 0, -0.5, 0.5, 0.5,
-3.903318, 3, -6.644762, 1, -0.5, 0.5, 0.5,
-3.903318, 3, -6.644762, 1, 1.5, 0.5, 0.5,
-3.903318, 3, -6.644762, 0, 1.5, 0.5, 0.5
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
-3.39838, -3.261137, -4,
-3.39838, -3.261137, 4,
-3.39838, -3.261137, -4,
-3.566693, -3.420701, -4,
-3.39838, -3.261137, -2,
-3.566693, -3.420701, -2,
-3.39838, -3.261137, 0,
-3.566693, -3.420701, 0,
-3.39838, -3.261137, 2,
-3.566693, -3.420701, 2,
-3.39838, -3.261137, 4,
-3.566693, -3.420701, 4
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
-3.903318, -3.73983, -4, 0, -0.5, 0.5, 0.5,
-3.903318, -3.73983, -4, 1, -0.5, 0.5, 0.5,
-3.903318, -3.73983, -4, 1, 1.5, 0.5, 0.5,
-3.903318, -3.73983, -4, 0, 1.5, 0.5, 0.5,
-3.903318, -3.73983, -2, 0, -0.5, 0.5, 0.5,
-3.903318, -3.73983, -2, 1, -0.5, 0.5, 0.5,
-3.903318, -3.73983, -2, 1, 1.5, 0.5, 0.5,
-3.903318, -3.73983, -2, 0, 1.5, 0.5, 0.5,
-3.903318, -3.73983, 0, 0, -0.5, 0.5, 0.5,
-3.903318, -3.73983, 0, 1, -0.5, 0.5, 0.5,
-3.903318, -3.73983, 0, 1, 1.5, 0.5, 0.5,
-3.903318, -3.73983, 0, 0, 1.5, 0.5, 0.5,
-3.903318, -3.73983, 2, 0, -0.5, 0.5, 0.5,
-3.903318, -3.73983, 2, 1, -0.5, 0.5, 0.5,
-3.903318, -3.73983, 2, 1, 1.5, 0.5, 0.5,
-3.903318, -3.73983, 2, 0, 1.5, 0.5, 0.5,
-3.903318, -3.73983, 4, 0, -0.5, 0.5, 0.5,
-3.903318, -3.73983, 4, 1, -0.5, 0.5, 0.5,
-3.903318, -3.73983, 4, 1, 1.5, 0.5, 0.5,
-3.903318, -3.73983, 4, 0, 1.5, 0.5, 0.5
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
-3.39838, -3.261137, -5.779889,
-3.39838, 3.121434, -5.779889,
-3.39838, -3.261137, 5.751741,
-3.39838, 3.121434, 5.751741,
-3.39838, -3.261137, -5.779889,
-3.39838, -3.261137, 5.751741,
-3.39838, 3.121434, -5.779889,
-3.39838, 3.121434, 5.751741,
-3.39838, -3.261137, -5.779889,
3.334137, -3.261137, -5.779889,
-3.39838, -3.261137, 5.751741,
3.334137, -3.261137, 5.751741,
-3.39838, 3.121434, -5.779889,
3.334137, 3.121434, -5.779889,
-3.39838, 3.121434, 5.751741,
3.334137, 3.121434, 5.751741,
3.334137, -3.261137, -5.779889,
3.334137, 3.121434, -5.779889,
3.334137, -3.261137, 5.751741,
3.334137, 3.121434, 5.751741,
3.334137, -3.261137, -5.779889,
3.334137, -3.261137, 5.751741,
3.334137, 3.121434, -5.779889,
3.334137, 3.121434, 5.751741
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
var radius = 7.902958;
var distance = 35.16115;
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
mvMatrix.translate( 0.0321213, 0.06985128, 0.01407385 );
mvMatrix.scale( 1.269189, 1.338776, 0.7409908 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.16115);
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
diclomezine<-read.table("diclomezine.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-diclomezine$V2
```

```
## Error in eval(expr, envir, enclos): object 'diclomezine' not found
```

```r
y<-diclomezine$V3
```

```
## Error in eval(expr, envir, enclos): object 'diclomezine' not found
```

```r
z<-diclomezine$V4
```

```
## Error in eval(expr, envir, enclos): object 'diclomezine' not found
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
-3.300333, 1.809615, 0.9687192, 0, 0, 1, 1, 1,
-2.87762, 1.124741, -3.050148, 1, 0, 0, 1, 1,
-2.846661, 1.808357, -0.1239158, 1, 0, 0, 1, 1,
-2.787714, 0.5512537, -0.6367424, 1, 0, 0, 1, 1,
-2.669318, 1.172835, -1.411194, 1, 0, 0, 1, 1,
-2.603641, -0.2236681, -0.2261005, 1, 0, 0, 1, 1,
-2.524384, -1.927297, -1.348365, 0, 0, 0, 1, 1,
-2.400715, 0.04190122, -1.742564, 0, 0, 0, 1, 1,
-2.286015, 1.672506, -0.6822399, 0, 0, 0, 1, 1,
-2.278048, 2.233435, -1.390468, 0, 0, 0, 1, 1,
-2.191914, -0.2742595, -2.825897, 0, 0, 0, 1, 1,
-2.168037, -0.6216992, 0.122897, 0, 0, 0, 1, 1,
-2.167145, -1.131764, 0.2410243, 0, 0, 0, 1, 1,
-2.126856, 0.8617957, -0.9332651, 1, 1, 1, 1, 1,
-2.10523, 0.4233543, -1.849342, 1, 1, 1, 1, 1,
-2.100313, -0.8199598, -3.036656, 1, 1, 1, 1, 1,
-2.063936, 0.5677571, -3.179776, 1, 1, 1, 1, 1,
-2.060843, -1.339289, -0.4863873, 1, 1, 1, 1, 1,
-2.034816, -0.04896577, -0.9339689, 1, 1, 1, 1, 1,
-2.019691, 0.7583624, -1.584558, 1, 1, 1, 1, 1,
-1.991782, 1.367958, -1.272669, 1, 1, 1, 1, 1,
-1.98507, 0.441651, -2.552649, 1, 1, 1, 1, 1,
-1.981375, -1.169581, -2.464632, 1, 1, 1, 1, 1,
-1.976137, -0.9925702, -2.1517, 1, 1, 1, 1, 1,
-1.974399, -1.076481, -3.557118, 1, 1, 1, 1, 1,
-1.970383, 0.273504, -0.2290069, 1, 1, 1, 1, 1,
-1.937858, 0.4832243, -1.541516, 1, 1, 1, 1, 1,
-1.920113, -0.3031051, -1.59434, 1, 1, 1, 1, 1,
-1.911424, 1.104942, -1.184105, 0, 0, 1, 1, 1,
-1.904127, -2.182343, -2.84171, 1, 0, 0, 1, 1,
-1.894573, 0.8601697, -1.42965, 1, 0, 0, 1, 1,
-1.886016, -1.160353, -2.096735, 1, 0, 0, 1, 1,
-1.881196, 0.2991377, -1.221561, 1, 0, 0, 1, 1,
-1.860455, -1.20036, -2.077188, 1, 0, 0, 1, 1,
-1.844237, -2.069521, -3.638149, 0, 0, 0, 1, 1,
-1.843375, -1.176067, -2.984823, 0, 0, 0, 1, 1,
-1.843015, -0.8109055, -1.00137, 0, 0, 0, 1, 1,
-1.833676, 1.441654, -0.3795872, 0, 0, 0, 1, 1,
-1.80022, -1.227613, -2.135009, 0, 0, 0, 1, 1,
-1.754313, -1.799625, -2.025626, 0, 0, 0, 1, 1,
-1.734946, 0.5010865, -2.020821, 0, 0, 0, 1, 1,
-1.724335, 1.153631, -2.56942, 1, 1, 1, 1, 1,
-1.718192, -0.9990337, -3.202382, 1, 1, 1, 1, 1,
-1.717945, 0.5992317, -0.04973996, 1, 1, 1, 1, 1,
-1.709993, 0.4619519, -2.266609, 1, 1, 1, 1, 1,
-1.704042, 0.7851303, -0.7802251, 1, 1, 1, 1, 1,
-1.703493, 0.2902701, -1.085832, 1, 1, 1, 1, 1,
-1.690801, -0.439633, -1.757497, 1, 1, 1, 1, 1,
-1.687108, 0.2811809, -1.250152, 1, 1, 1, 1, 1,
-1.66643, -0.9173722, -1.83762, 1, 1, 1, 1, 1,
-1.666299, -1.725681, 0.05315977, 1, 1, 1, 1, 1,
-1.665774, 0.2882206, -0.5317104, 1, 1, 1, 1, 1,
-1.64861, -0.3142997, -2.038467, 1, 1, 1, 1, 1,
-1.635271, -2.011724, -2.244407, 1, 1, 1, 1, 1,
-1.633083, 0.1902884, -0.7730164, 1, 1, 1, 1, 1,
-1.625832, -0.2516729, -2.702065, 1, 1, 1, 1, 1,
-1.617473, -1.896747, -0.9398083, 0, 0, 1, 1, 1,
-1.604679, 0.8414155, -1.885679, 1, 0, 0, 1, 1,
-1.602385, -0.237999, -2.063773, 1, 0, 0, 1, 1,
-1.595761, 2.263726, 0.185097, 1, 0, 0, 1, 1,
-1.582862, 0.9508981, -0.3533731, 1, 0, 0, 1, 1,
-1.578315, -0.6471063, -3.287534, 1, 0, 0, 1, 1,
-1.575517, -0.01437583, -0.8143361, 0, 0, 0, 1, 1,
-1.571092, -0.2475585, -1.744627, 0, 0, 0, 1, 1,
-1.560861, -0.1731701, 0.01919997, 0, 0, 0, 1, 1,
-1.556615, 0.1595221, -1.066686, 0, 0, 0, 1, 1,
-1.544423, -1.680629, -3.137031, 0, 0, 0, 1, 1,
-1.532961, -0.9051988, -1.616895, 0, 0, 0, 1, 1,
-1.521148, 0.4847149, 0.2275435, 0, 0, 0, 1, 1,
-1.517681, -0.3242843, -0.8576006, 1, 1, 1, 1, 1,
-1.510691, -0.04931585, -1.320619, 1, 1, 1, 1, 1,
-1.501384, -0.5772954, -1.609496, 1, 1, 1, 1, 1,
-1.489221, 0.5766512, -0.07394148, 1, 1, 1, 1, 1,
-1.474098, 2.281618, -1.995, 1, 1, 1, 1, 1,
-1.469908, -0.5250437, -1.359912, 1, 1, 1, 1, 1,
-1.462041, -0.0223358, -3.516701, 1, 1, 1, 1, 1,
-1.454012, -0.2655925, -3.945907, 1, 1, 1, 1, 1,
-1.451782, 1.065106, -2.748789, 1, 1, 1, 1, 1,
-1.447205, 0.5098031, -3.066942, 1, 1, 1, 1, 1,
-1.431299, 0.119381, -2.845672, 1, 1, 1, 1, 1,
-1.429585, 1.811177, -0.6064433, 1, 1, 1, 1, 1,
-1.424509, -0.2713893, -2.503728, 1, 1, 1, 1, 1,
-1.424404, -0.6044922, -1.193051, 1, 1, 1, 1, 1,
-1.423253, 0.07928568, -1.37109, 1, 1, 1, 1, 1,
-1.421619, -1.004748, -0.4450558, 0, 0, 1, 1, 1,
-1.414179, -0.1728625, -3.079879, 1, 0, 0, 1, 1,
-1.405577, 1.064963, -2.280779, 1, 0, 0, 1, 1,
-1.404573, 1.248331, -1.987698, 1, 0, 0, 1, 1,
-1.403558, -0.3046922, -1.985719, 1, 0, 0, 1, 1,
-1.388681, -0.5435079, -1.609227, 1, 0, 0, 1, 1,
-1.378905, 0.02710482, -2.679099, 0, 0, 0, 1, 1,
-1.375062, 1.641543, 0.6708975, 0, 0, 0, 1, 1,
-1.36004, -1.073588, -2.226272, 0, 0, 0, 1, 1,
-1.350649, 0.1172205, -3.26157, 0, 0, 0, 1, 1,
-1.34429, -1.240217, -0.6654423, 0, 0, 0, 1, 1,
-1.341451, -0.9586177, -1.045023, 0, 0, 0, 1, 1,
-1.325066, 0.7148281, 0.2311492, 0, 0, 0, 1, 1,
-1.322416, -0.5437095, -1.78745, 1, 1, 1, 1, 1,
-1.315937, -1.33239, -2.595386, 1, 1, 1, 1, 1,
-1.306878, -1.389035, -1.957914, 1, 1, 1, 1, 1,
-1.296121, -1.059911, -3.223385, 1, 1, 1, 1, 1,
-1.295041, 0.3231509, -4.136903, 1, 1, 1, 1, 1,
-1.29361, 1.642128, -2.925691, 1, 1, 1, 1, 1,
-1.292257, -0.04681696, -0.652732, 1, 1, 1, 1, 1,
-1.265827, 0.6942064, -2.404528, 1, 1, 1, 1, 1,
-1.259706, -0.2788675, -1.568103, 1, 1, 1, 1, 1,
-1.236891, -0.5650579, -3.580383, 1, 1, 1, 1, 1,
-1.232275, 0.7444902, -1.147532, 1, 1, 1, 1, 1,
-1.225331, 1.585477, -0.9507208, 1, 1, 1, 1, 1,
-1.222582, -0.8714097, 0.448198, 1, 1, 1, 1, 1,
-1.217751, 1.403438, -0.419189, 1, 1, 1, 1, 1,
-1.216057, 0.1993154, -0.8904837, 1, 1, 1, 1, 1,
-1.215015, 1.77658, -0.1792503, 0, 0, 1, 1, 1,
-1.201584, 0.4013701, -0.06297185, 1, 0, 0, 1, 1,
-1.200203, 1.037272, -1.046119, 1, 0, 0, 1, 1,
-1.196066, -0.8685787, -2.821919, 1, 0, 0, 1, 1,
-1.195953, 0.7335364, 1.28829, 1, 0, 0, 1, 1,
-1.191856, 2.785153, 0.2587556, 1, 0, 0, 1, 1,
-1.180223, 0.4530905, -1.469003, 0, 0, 0, 1, 1,
-1.178592, -0.8374109, 0.6496271, 0, 0, 0, 1, 1,
-1.178085, -0.7971783, -3.519362, 0, 0, 0, 1, 1,
-1.171187, -0.7640733, -1.61748, 0, 0, 0, 1, 1,
-1.166791, -0.6946017, -1.506609, 0, 0, 0, 1, 1,
-1.163898, 0.0577245, -0.5478176, 0, 0, 0, 1, 1,
-1.162472, 1.844695, 0.3406775, 0, 0, 0, 1, 1,
-1.159834, 0.07631613, -1.859945, 1, 1, 1, 1, 1,
-1.149419, -0.8182396, -2.857141, 1, 1, 1, 1, 1,
-1.138185, 0.10992, -2.657799, 1, 1, 1, 1, 1,
-1.131591, 0.169744, -2.917358, 1, 1, 1, 1, 1,
-1.125842, 0.1474362, -2.469942, 1, 1, 1, 1, 1,
-1.125188, -0.3751141, -2.870362, 1, 1, 1, 1, 1,
-1.119117, 0.1635105, -0.3685212, 1, 1, 1, 1, 1,
-1.118641, 0.8146612, -1.734261, 1, 1, 1, 1, 1,
-1.118181, 0.2641215, -1.416252, 1, 1, 1, 1, 1,
-1.113559, 1.508045, -1.536018, 1, 1, 1, 1, 1,
-1.112696, 0.1692558, -1.629536, 1, 1, 1, 1, 1,
-1.107059, -0.4594581, -0.6129961, 1, 1, 1, 1, 1,
-1.106757, 0.692075, -0.8686639, 1, 1, 1, 1, 1,
-1.105354, 0.6284234, -1.13131, 1, 1, 1, 1, 1,
-1.104947, 0.3127864, -0.7421144, 1, 1, 1, 1, 1,
-1.101939, 1.910144, 0.269231, 0, 0, 1, 1, 1,
-1.100115, -1.222549, -1.84474, 1, 0, 0, 1, 1,
-1.099207, 1.264342, 0.6217688, 1, 0, 0, 1, 1,
-1.095436, 0.1008536, -2.138927, 1, 0, 0, 1, 1,
-1.09479, 0.4946117, -0.2121232, 1, 0, 0, 1, 1,
-1.086059, -1.18805, -1.26626, 1, 0, 0, 1, 1,
-1.06329, 0.8835015, -1.09603, 0, 0, 0, 1, 1,
-1.058225, 0.05432432, -1.465322, 0, 0, 0, 1, 1,
-1.055847, 0.2322725, -3.363657, 0, 0, 0, 1, 1,
-1.055341, 0.008449145, -3.151174, 0, 0, 0, 1, 1,
-1.053453, -1.309316, -1.642737, 0, 0, 0, 1, 1,
-1.053421, 1.078015, -0.5085978, 0, 0, 0, 1, 1,
-1.052366, 0.2881361, -1.141286, 0, 0, 0, 1, 1,
-1.045823, 1.08834, 0.4899152, 1, 1, 1, 1, 1,
-1.04067, 0.373925, -2.9921, 1, 1, 1, 1, 1,
-1.027112, 0.2844683, -1.674766, 1, 1, 1, 1, 1,
-1.019976, -0.2889033, -2.347018, 1, 1, 1, 1, 1,
-1.012977, -0.3824314, -1.362574, 1, 1, 1, 1, 1,
-1.012576, 0.6005567, -0.09420539, 1, 1, 1, 1, 1,
-1.008976, -0.09150739, -2.078009, 1, 1, 1, 1, 1,
-1.002711, -0.2054022, -2.217269, 1, 1, 1, 1, 1,
-0.9982251, 0.8793595, -0.8922836, 1, 1, 1, 1, 1,
-0.9945127, 0.6732636, -1.878631, 1, 1, 1, 1, 1,
-0.9930261, 1.655575, 0.5586742, 1, 1, 1, 1, 1,
-0.9863437, -1.094335, -3.935416, 1, 1, 1, 1, 1,
-0.9843507, 1.103786, -0.920715, 1, 1, 1, 1, 1,
-0.9824281, 0.5833826, -1.223024, 1, 1, 1, 1, 1,
-0.9819014, 0.2284423, -1.308532, 1, 1, 1, 1, 1,
-0.9755704, 2.025547, 0.5676548, 0, 0, 1, 1, 1,
-0.9730841, 0.3301983, -1.560488, 1, 0, 0, 1, 1,
-0.9714778, -0.173182, -1.312672, 1, 0, 0, 1, 1,
-0.9682887, 0.2999608, -0.2190764, 1, 0, 0, 1, 1,
-0.9663144, 0.8326182, -0.05301677, 1, 0, 0, 1, 1,
-0.9629982, -1.821961, -1.819812, 1, 0, 0, 1, 1,
-0.9624904, 0.9649417, -0.1681009, 0, 0, 0, 1, 1,
-0.9504086, -0.9206719, -1.946687, 0, 0, 0, 1, 1,
-0.9383659, 0.3430699, 0.003503443, 0, 0, 0, 1, 1,
-0.9373043, -0.1028692, -2.279643, 0, 0, 0, 1, 1,
-0.9311177, -0.7477214, -1.978237, 0, 0, 0, 1, 1,
-0.9243008, -0.6815344, -2.849855, 0, 0, 0, 1, 1,
-0.9192324, 0.3722231, -1.122448, 0, 0, 0, 1, 1,
-0.9104804, -0.1332993, -1.176728, 1, 1, 1, 1, 1,
-0.9075122, 1.01573, -1.551707, 1, 1, 1, 1, 1,
-0.9010367, 0.1148173, -2.686861, 1, 1, 1, 1, 1,
-0.8988687, -1.583516, -1.92047, 1, 1, 1, 1, 1,
-0.8974593, 1.11197, -1.242316, 1, 1, 1, 1, 1,
-0.890548, -1.342635, -0.6841396, 1, 1, 1, 1, 1,
-0.8892437, -2.007513, -2.943156, 1, 1, 1, 1, 1,
-0.8851195, -0.2569138, -2.062099, 1, 1, 1, 1, 1,
-0.8791317, 0.0642406, -1.128878, 1, 1, 1, 1, 1,
-0.8764387, 0.6125659, -0.606337, 1, 1, 1, 1, 1,
-0.8756287, -0.6545902, -0.5848076, 1, 1, 1, 1, 1,
-0.8707901, -1.509714, -1.993932, 1, 1, 1, 1, 1,
-0.8694798, 0.3082215, -0.9209742, 1, 1, 1, 1, 1,
-0.8630432, -0.1586886, -1.498242, 1, 1, 1, 1, 1,
-0.8531508, -2.159822, -3.078409, 1, 1, 1, 1, 1,
-0.8528997, 1.774004, 0.443684, 0, 0, 1, 1, 1,
-0.8519391, 0.8034235, -2.069336, 1, 0, 0, 1, 1,
-0.849551, -0.5612515, -1.921549, 1, 0, 0, 1, 1,
-0.8483143, -0.2492516, -2.840912, 1, 0, 0, 1, 1,
-0.8477761, -0.03221494, -1.187996, 1, 0, 0, 1, 1,
-0.8444623, -0.8578945, -4.367291, 1, 0, 0, 1, 1,
-0.8393947, -0.399057, -2.179657, 0, 0, 0, 1, 1,
-0.8322336, -0.8874387, -3.617129, 0, 0, 0, 1, 1,
-0.8258371, 1.137846, -0.1540697, 0, 0, 0, 1, 1,
-0.8247186, -0.8184563, -3.972089, 0, 0, 0, 1, 1,
-0.8198198, -1.13785, -1.259859, 0, 0, 0, 1, 1,
-0.8173311, 1.137286, -0.5492859, 0, 0, 0, 1, 1,
-0.8145705, -0.9505424, -4.274677, 0, 0, 0, 1, 1,
-0.8125369, -0.2599579, -2.157313, 1, 1, 1, 1, 1,
-0.8100901, 1.28385, -0.8553277, 1, 1, 1, 1, 1,
-0.8079101, 0.9154984, 0.827727, 1, 1, 1, 1, 1,
-0.7962853, -0.3203508, -3.503688, 1, 1, 1, 1, 1,
-0.7946455, -0.5774096, -1.634893, 1, 1, 1, 1, 1,
-0.7875803, -0.8098341, -1.525044, 1, 1, 1, 1, 1,
-0.7845382, -0.1644488, -2.031764, 1, 1, 1, 1, 1,
-0.78159, 0.8421988, 0.620851, 1, 1, 1, 1, 1,
-0.7776114, -0.6502408, -2.234181, 1, 1, 1, 1, 1,
-0.773777, 0.512695, -1.562842, 1, 1, 1, 1, 1,
-0.7732968, 1.332049, -0.7083716, 1, 1, 1, 1, 1,
-0.7727085, -0.09763297, -2.684798, 1, 1, 1, 1, 1,
-0.7680208, 1.107917, -0.6752432, 1, 1, 1, 1, 1,
-0.768, 0.6209932, -0.2900664, 1, 1, 1, 1, 1,
-0.7677805, 0.09705453, -1.990274, 1, 1, 1, 1, 1,
-0.7642223, 0.279065, -1.940926, 0, 0, 1, 1, 1,
-0.7630958, -0.1729216, -0.6038983, 1, 0, 0, 1, 1,
-0.7544618, -0.3547961, -1.970415, 1, 0, 0, 1, 1,
-0.7541961, -0.8965028, -4.150089, 1, 0, 0, 1, 1,
-0.7529001, -0.7473136, -0.8583391, 1, 0, 0, 1, 1,
-0.7465491, 0.7493238, 0.4132013, 1, 0, 0, 1, 1,
-0.7448459, -0.2577188, -1.030952, 0, 0, 0, 1, 1,
-0.7428967, -0.8331349, -3.096894, 0, 0, 0, 1, 1,
-0.7408451, -0.7458315, -2.460931, 0, 0, 0, 1, 1,
-0.7400219, 0.8307256, -0.2283166, 0, 0, 0, 1, 1,
-0.7371255, -1.669383, -3.038856, 0, 0, 0, 1, 1,
-0.7361614, 0.9719831, -1.021906, 0, 0, 0, 1, 1,
-0.7277616, 0.801029, -1.04196, 0, 0, 0, 1, 1,
-0.725903, 0.620371, -3.046763, 1, 1, 1, 1, 1,
-0.7254847, -0.8806184, -2.215437, 1, 1, 1, 1, 1,
-0.7242307, -2.075237, -2.672097, 1, 1, 1, 1, 1,
-0.7216411, -0.1692568, -0.2981996, 1, 1, 1, 1, 1,
-0.7093785, -0.8570397, -3.637146, 1, 1, 1, 1, 1,
-0.7051096, 1.704277, -1.364788, 1, 1, 1, 1, 1,
-0.7042381, -0.02184548, -1.232176, 1, 1, 1, 1, 1,
-0.7002767, -0.4567701, -1.765585, 1, 1, 1, 1, 1,
-0.6984178, 0.04802911, -2.182303, 1, 1, 1, 1, 1,
-0.6979921, -0.001830218, 0.322122, 1, 1, 1, 1, 1,
-0.6952874, 1.752289, -0.4057005, 1, 1, 1, 1, 1,
-0.6921895, -0.7970312, -2.542559, 1, 1, 1, 1, 1,
-0.6890496, -0.09521107, 0.1787983, 1, 1, 1, 1, 1,
-0.6812631, -0.125682, -1.719092, 1, 1, 1, 1, 1,
-0.6802403, -0.08047431, 0.3570652, 1, 1, 1, 1, 1,
-0.6797613, -0.5265447, -2.286616, 0, 0, 1, 1, 1,
-0.6661721, 0.3059298, -1.002006, 1, 0, 0, 1, 1,
-0.6602471, 0.8506555, -1.216371, 1, 0, 0, 1, 1,
-0.6594627, 1.573824, 0.970868, 1, 0, 0, 1, 1,
-0.657129, 0.001605598, -1.478878, 1, 0, 0, 1, 1,
-0.6559338, -1.217951, -3.186483, 1, 0, 0, 1, 1,
-0.6554039, -0.2776717, -1.758324, 0, 0, 0, 1, 1,
-0.6526377, 0.3635226, -0.6181937, 0, 0, 0, 1, 1,
-0.6483728, 0.3043987, -2.689039, 0, 0, 0, 1, 1,
-0.6479096, -0.0569557, -2.878749, 0, 0, 0, 1, 1,
-0.6475924, 1.171478, -0.192758, 0, 0, 0, 1, 1,
-0.6433195, -1.187118, -4.076294, 0, 0, 0, 1, 1,
-0.6237268, 0.7878239, -0.4710604, 0, 0, 0, 1, 1,
-0.6223958, -0.7847878, -1.684042, 1, 1, 1, 1, 1,
-0.6219575, 0.9930401, -1.755416, 1, 1, 1, 1, 1,
-0.6180744, -0.09451306, -2.539599, 1, 1, 1, 1, 1,
-0.6108872, 0.5963118, -2.738456, 1, 1, 1, 1, 1,
-0.5983316, -0.551648, -1.996097, 1, 1, 1, 1, 1,
-0.5871243, -0.5652184, -2.939077, 1, 1, 1, 1, 1,
-0.5870114, -1.468611, -3.293083, 1, 1, 1, 1, 1,
-0.5845925, -0.5858923, -1.575772, 1, 1, 1, 1, 1,
-0.5842233, 1.197142, -1.841778, 1, 1, 1, 1, 1,
-0.5837232, -0.1081435, -0.1257833, 1, 1, 1, 1, 1,
-0.5804155, -0.7415038, -3.183357, 1, 1, 1, 1, 1,
-0.5754775, 1.487129, -0.7390021, 1, 1, 1, 1, 1,
-0.562601, 0.5245963, 0.5122267, 1, 1, 1, 1, 1,
-0.5593218, 0.360156, -1.450027, 1, 1, 1, 1, 1,
-0.5570654, 0.1819128, -0.7701263, 1, 1, 1, 1, 1,
-0.5567863, -0.2906848, -1.67409, 0, 0, 1, 1, 1,
-0.556379, -0.9359955, -2.865523, 1, 0, 0, 1, 1,
-0.5557681, 1.050212, 0.3247218, 1, 0, 0, 1, 1,
-0.5531517, 0.4558209, -1.340831, 1, 0, 0, 1, 1,
-0.5510837, 0.2433692, -2.171769, 1, 0, 0, 1, 1,
-0.5449079, 0.5351505, -0.6521554, 1, 0, 0, 1, 1,
-0.5439729, 0.5179429, -2.10522, 0, 0, 0, 1, 1,
-0.5424485, 0.4659357, -1.12666, 0, 0, 0, 1, 1,
-0.537966, 0.2361713, -1.517802, 0, 0, 0, 1, 1,
-0.5348111, -0.07609043, -2.322116, 0, 0, 0, 1, 1,
-0.5306145, 2.085273, -1.96238, 0, 0, 0, 1, 1,
-0.5279712, 0.5915774, -0.8684105, 0, 0, 0, 1, 1,
-0.5260906, 1.173823, -0.9192648, 0, 0, 0, 1, 1,
-0.5252232, 1.540716, -1.529733, 1, 1, 1, 1, 1,
-0.5234574, 0.1003018, -3.990789, 1, 1, 1, 1, 1,
-0.5205863, -1.696763, -3.063309, 1, 1, 1, 1, 1,
-0.5162337, 0.4777503, -0.3630957, 1, 1, 1, 1, 1,
-0.5153601, 1.267362, -1.443805, 1, 1, 1, 1, 1,
-0.5097469, -0.2482009, -2.302159, 1, 1, 1, 1, 1,
-0.5091324, 0.007790668, -0.6833034, 1, 1, 1, 1, 1,
-0.4981414, -0.8345999, -2.422314, 1, 1, 1, 1, 1,
-0.4913506, -0.1825847, -3.86894, 1, 1, 1, 1, 1,
-0.4880562, -2.625714, -2.677444, 1, 1, 1, 1, 1,
-0.4867924, -0.2337052, -1.931078, 1, 1, 1, 1, 1,
-0.4858588, 1.125762, -0.2258097, 1, 1, 1, 1, 1,
-0.4725762, -0.9541413, -2.901173, 1, 1, 1, 1, 1,
-0.4718943, -0.1641793, -3.372384, 1, 1, 1, 1, 1,
-0.4706462, -1.720149, -1.688545, 1, 1, 1, 1, 1,
-0.4656696, -0.5473591, -1.408606, 0, 0, 1, 1, 1,
-0.4655612, -1.08851, -1.713956, 1, 0, 0, 1, 1,
-0.4654909, 0.6315791, -1.835203, 1, 0, 0, 1, 1,
-0.46458, -0.4382647, -2.909853, 1, 0, 0, 1, 1,
-0.4619947, 1.284361, -2.82749, 1, 0, 0, 1, 1,
-0.4603745, 0.2744766, -3.233632, 1, 0, 0, 1, 1,
-0.4594718, 0.8619004, -0.2579926, 0, 0, 0, 1, 1,
-0.4582899, -0.1767353, -2.874657, 0, 0, 0, 1, 1,
-0.4559665, -0.1140301, -0.7314374, 0, 0, 0, 1, 1,
-0.4537809, 0.09938069, -1.387214, 0, 0, 0, 1, 1,
-0.4502139, 0.02946935, -1.242484, 0, 0, 0, 1, 1,
-0.4489202, 0.1142143, -1.129797, 0, 0, 0, 1, 1,
-0.4474944, 0.8108745, 0.6555578, 0, 0, 0, 1, 1,
-0.4440348, 0.08554045, -1.154046, 1, 1, 1, 1, 1,
-0.4411485, -0.6737214, -4.506907, 1, 1, 1, 1, 1,
-0.4396892, 1.223026, -0.8202987, 1, 1, 1, 1, 1,
-0.4372482, 1.036086, -1.744537, 1, 1, 1, 1, 1,
-0.4371659, -2.08021, -2.018263, 1, 1, 1, 1, 1,
-0.4352401, -0.2684077, -0.4053431, 1, 1, 1, 1, 1,
-0.4349633, -0.5871891, -3.784039, 1, 1, 1, 1, 1,
-0.4318421, 0.2338607, 1.088583, 1, 1, 1, 1, 1,
-0.4270328, 0.4148998, -0.9836518, 1, 1, 1, 1, 1,
-0.4184125, -1.676875, -2.599067, 1, 1, 1, 1, 1,
-0.4182352, 0.1473599, 0.5188898, 1, 1, 1, 1, 1,
-0.4122785, -1.552887, -2.118477, 1, 1, 1, 1, 1,
-0.4105724, -0.1291805, -2.368452, 1, 1, 1, 1, 1,
-0.4104813, 0.3426839, 0.5117539, 1, 1, 1, 1, 1,
-0.4063146, -0.5256647, -3.184486, 1, 1, 1, 1, 1,
-0.3999977, 0.4085513, -0.6604968, 0, 0, 1, 1, 1,
-0.3960364, 1.188985, -0.2597204, 1, 0, 0, 1, 1,
-0.3950413, 0.2460077, -0.1185981, 1, 0, 0, 1, 1,
-0.3895824, 0.3041182, -2.005283, 1, 0, 0, 1, 1,
-0.3877273, 0.6142792, -2.150609, 1, 0, 0, 1, 1,
-0.3850984, -0.7608069, -2.387391, 1, 0, 0, 1, 1,
-0.3847595, -0.8003994, -5.149994, 0, 0, 0, 1, 1,
-0.3828736, 1.00903, -0.9862462, 0, 0, 0, 1, 1,
-0.3795059, 0.844468, -0.01511857, 0, 0, 0, 1, 1,
-0.3793407, 0.8241304, -1.486751, 0, 0, 0, 1, 1,
-0.3767309, 1.259313, -0.636136, 0, 0, 0, 1, 1,
-0.3711796, 0.7355497, -1.015558, 0, 0, 0, 1, 1,
-0.3668593, 0.4391011, -0.3465115, 0, 0, 0, 1, 1,
-0.3661085, -0.1495091, -3.894544, 1, 1, 1, 1, 1,
-0.3581623, 0.64092, 0.6657256, 1, 1, 1, 1, 1,
-0.3572907, 0.7530675, -0.06021182, 1, 1, 1, 1, 1,
-0.352039, -0.7776012, -2.862509, 1, 1, 1, 1, 1,
-0.3510592, 1.352347, -0.7804004, 1, 1, 1, 1, 1,
-0.3502894, -0.34833, -1.831512, 1, 1, 1, 1, 1,
-0.3488948, 0.5130736, -1.598595, 1, 1, 1, 1, 1,
-0.346589, -1.837396, -2.771322, 1, 1, 1, 1, 1,
-0.3454475, 0.5021544, 0.1245284, 1, 1, 1, 1, 1,
-0.3451133, -0.1918321, -1.5761, 1, 1, 1, 1, 1,
-0.3442318, 1.709706, -0.5017774, 1, 1, 1, 1, 1,
-0.3432162, -0.1205196, -1.274063, 1, 1, 1, 1, 1,
-0.3408008, 0.5560025, 0.8785445, 1, 1, 1, 1, 1,
-0.3388837, -0.4966777, -2.18713, 1, 1, 1, 1, 1,
-0.3369788, -0.03183376, -2.409884, 1, 1, 1, 1, 1,
-0.336356, 0.1099507, -1.146124, 0, 0, 1, 1, 1,
-0.333124, 2.73418, 1.336024, 1, 0, 0, 1, 1,
-0.3317712, 0.914163, -1.402186, 1, 0, 0, 1, 1,
-0.3306984, 0.1989653, 0.8735321, 1, 0, 0, 1, 1,
-0.3285638, -0.1115346, -2.023853, 1, 0, 0, 1, 1,
-0.328395, 0.3520633, 0.5357403, 1, 0, 0, 1, 1,
-0.3208402, -0.4332968, -2.351445, 0, 0, 0, 1, 1,
-0.3208346, 0.9520208, 0.01253641, 0, 0, 0, 1, 1,
-0.3183174, -0.947178, -1.40572, 0, 0, 0, 1, 1,
-0.3144377, 1.063618, 0.4202132, 0, 0, 0, 1, 1,
-0.3077438, 0.2999398, -0.5228032, 0, 0, 0, 1, 1,
-0.3060167, 0.8904208, -1.247885, 0, 0, 0, 1, 1,
-0.3022737, -0.1448436, -1.753456, 0, 0, 0, 1, 1,
-0.2991776, 0.03625448, -2.28105, 1, 1, 1, 1, 1,
-0.2973765, -2.362905, -2.724951, 1, 1, 1, 1, 1,
-0.2934674, -1.196839, -4.439876, 1, 1, 1, 1, 1,
-0.2880113, -0.8172604, -2.384842, 1, 1, 1, 1, 1,
-0.2840298, -0.01225621, -0.2263861, 1, 1, 1, 1, 1,
-0.2814197, 0.8306042, 0.3236362, 1, 1, 1, 1, 1,
-0.2811274, -0.4743926, -2.145867, 1, 1, 1, 1, 1,
-0.2758589, 0.8211182, -1.968504, 1, 1, 1, 1, 1,
-0.275108, 0.1407714, -1.260345, 1, 1, 1, 1, 1,
-0.2709899, 0.2701997, 0.7244791, 1, 1, 1, 1, 1,
-0.2689977, 3.028484, -1.802855, 1, 1, 1, 1, 1,
-0.2672961, -0.2034284, -1.043136, 1, 1, 1, 1, 1,
-0.2627895, 0.9155891, 1.420067, 1, 1, 1, 1, 1,
-0.2608812, -2.325763, -2.672278, 1, 1, 1, 1, 1,
-0.2602977, 0.9765874, -0.1810393, 1, 1, 1, 1, 1,
-0.2595938, -0.03286755, -2.657215, 0, 0, 1, 1, 1,
-0.2594381, -0.5046692, -2.990563, 1, 0, 0, 1, 1,
-0.2524899, 1.405956, 1.291212, 1, 0, 0, 1, 1,
-0.2495428, 0.2914984, -1.084895, 1, 0, 0, 1, 1,
-0.2449316, 0.7298957, -0.9863227, 1, 0, 0, 1, 1,
-0.2412969, 0.9788031, 0.7745598, 1, 0, 0, 1, 1,
-0.2400122, 2.180814, -0.5119651, 0, 0, 0, 1, 1,
-0.2321825, -0.2332871, -2.754417, 0, 0, 0, 1, 1,
-0.2281177, -1.073805, -3.57819, 0, 0, 0, 1, 1,
-0.2196152, -1.373368, -3.475829, 0, 0, 0, 1, 1,
-0.2180734, 0.1664266, 0.2481916, 0, 0, 0, 1, 1,
-0.2180512, -0.483816, -4.215919, 0, 0, 0, 1, 1,
-0.2075737, -0.690507, -2.925534, 0, 0, 0, 1, 1,
-0.2007092, -1.068333, -3.979291, 1, 1, 1, 1, 1,
-0.1963147, 1.376526, -0.7968715, 1, 1, 1, 1, 1,
-0.1933426, -2.026153, -1.356452, 1, 1, 1, 1, 1,
-0.1917132, -1.934179, -3.659446, 1, 1, 1, 1, 1,
-0.1894239, -0.5995511, -1.644215, 1, 1, 1, 1, 1,
-0.1863243, -1.080596, -5.191123, 1, 1, 1, 1, 1,
-0.1860207, 0.2013067, -0.1353696, 1, 1, 1, 1, 1,
-0.1815854, -2.127482, -3.354907, 1, 1, 1, 1, 1,
-0.1745418, 0.8893592, 1.396874, 1, 1, 1, 1, 1,
-0.1743894, 1.700097, 1.33645, 1, 1, 1, 1, 1,
-0.1663507, 0.1955487, -0.3438318, 1, 1, 1, 1, 1,
-0.1637848, 0.1543761, -1.149197, 1, 1, 1, 1, 1,
-0.1630693, -0.8772475, -3.345245, 1, 1, 1, 1, 1,
-0.1606122, 0.9389686, 0.246053, 1, 1, 1, 1, 1,
-0.1556431, 1.016513, -1.625987, 1, 1, 1, 1, 1,
-0.1518189, -1.445087, -3.858851, 0, 0, 1, 1, 1,
-0.1514661, 0.1648597, -2.948139, 1, 0, 0, 1, 1,
-0.1510934, 0.03684507, -2.189664, 1, 0, 0, 1, 1,
-0.1500555, 1.233643, 1.08887, 1, 0, 0, 1, 1,
-0.1493432, 0.8807129, -0.2814068, 1, 0, 0, 1, 1,
-0.1491861, -1.494104, -3.51995, 1, 0, 0, 1, 1,
-0.1446576, 0.7619325, -0.2300798, 0, 0, 0, 1, 1,
-0.1368779, 0.8021787, -0.06197124, 0, 0, 0, 1, 1,
-0.1366714, 0.1984845, 1.441014, 0, 0, 0, 1, 1,
-0.1340882, 0.1634091, -0.08182739, 0, 0, 0, 1, 1,
-0.1334484, 0.163057, -2.206352, 0, 0, 0, 1, 1,
-0.1326126, -1.223804, -3.07161, 0, 0, 0, 1, 1,
-0.1257549, -0.3709111, -3.609845, 0, 0, 0, 1, 1,
-0.1214087, -0.6949779, -3.810597, 1, 1, 1, 1, 1,
-0.1170567, -2.179619, -0.700592, 1, 1, 1, 1, 1,
-0.1168954, 0.0006196623, -2.346426, 1, 1, 1, 1, 1,
-0.1161258, 0.6262679, -1.12069, 1, 1, 1, 1, 1,
-0.1126762, -1.040722, -3.455892, 1, 1, 1, 1, 1,
-0.1123282, -0.6534758, -3.353462, 1, 1, 1, 1, 1,
-0.1115468, -0.5139431, -3.994766, 1, 1, 1, 1, 1,
-0.1108757, -0.8385447, -3.060814, 1, 1, 1, 1, 1,
-0.1107773, -1.172821, -4.672842, 1, 1, 1, 1, 1,
-0.1087208, -0.05831436, -2.638669, 1, 1, 1, 1, 1,
-0.1058213, 1.025175, 0.492861, 1, 1, 1, 1, 1,
-0.1051678, -1.213112, -3.49632, 1, 1, 1, 1, 1,
-0.1031482, 0.1466178, 0.4227768, 1, 1, 1, 1, 1,
-0.09881467, 0.6096608, -1.227277, 1, 1, 1, 1, 1,
-0.09680425, -0.5399028, -3.350794, 1, 1, 1, 1, 1,
-0.08995346, 0.3992977, 0.2020698, 0, 0, 1, 1, 1,
-0.08932377, 0.9008802, 0.6247786, 1, 0, 0, 1, 1,
-0.08699995, 0.08665247, -0.1151244, 1, 0, 0, 1, 1,
-0.08681731, -1.448833, -5.611953, 1, 0, 0, 1, 1,
-0.08301623, 0.2425102, 0.6316744, 1, 0, 0, 1, 1,
-0.08062373, 1.089885, 0.3360233, 1, 0, 0, 1, 1,
-0.07788756, -2.614885, -3.613751, 0, 0, 0, 1, 1,
-0.07489198, 0.1418069, -2.059676, 0, 0, 0, 1, 1,
-0.07244605, 0.347428, 0.1032273, 0, 0, 0, 1, 1,
-0.07203864, -0.2044529, -2.977235, 0, 0, 0, 1, 1,
-0.07132656, -0.5687783, -5.139095, 0, 0, 0, 1, 1,
-0.07041939, 1.626639, 1.214055, 0, 0, 0, 1, 1,
-0.06800538, -0.03791421, 0.1568819, 0, 0, 0, 1, 1,
-0.05621708, -0.9958845, -3.886091, 1, 1, 1, 1, 1,
-0.05518431, -0.2810177, -1.59322, 1, 1, 1, 1, 1,
-0.0539781, -0.6069947, -2.65503, 1, 1, 1, 1, 1,
-0.05372002, -1.285665, -2.374318, 1, 1, 1, 1, 1,
-0.0527588, -1.650955, -1.507786, 1, 1, 1, 1, 1,
-0.052228, 0.4136589, -1.549152, 1, 1, 1, 1, 1,
-0.0519047, -0.8435581, -3.875948, 1, 1, 1, 1, 1,
-0.05167921, 0.4753878, -0.7106964, 1, 1, 1, 1, 1,
-0.05119285, 1.119291, 0.2415696, 1, 1, 1, 1, 1,
-0.04728981, -1.004957, -3.89132, 1, 1, 1, 1, 1,
-0.04631818, 0.4799842, 0.9455183, 1, 1, 1, 1, 1,
-0.04545168, -0.3112764, -2.103817, 1, 1, 1, 1, 1,
-0.04387876, -1.319775, -2.534319, 1, 1, 1, 1, 1,
-0.03997022, -0.248581, -1.795087, 1, 1, 1, 1, 1,
-0.03920579, -0.9392855, -2.671198, 1, 1, 1, 1, 1,
-0.03561234, 0.7714031, 1.02673, 0, 0, 1, 1, 1,
-0.03333369, -1.35911, -2.448339, 1, 0, 0, 1, 1,
-0.03019178, -0.1300941, -3.02173, 1, 0, 0, 1, 1,
-0.02785438, -1.375581, -2.353626, 1, 0, 0, 1, 1,
-0.02675615, -0.5866376, -1.50775, 1, 0, 0, 1, 1,
-0.02426403, -0.3081738, -3.390533, 1, 0, 0, 1, 1,
-0.01155208, 1.865931, 0.5071093, 0, 0, 0, 1, 1,
-0.0108177, 1.061783, -0.74712, 0, 0, 0, 1, 1,
-0.009651528, -0.5113204, -2.76133, 0, 0, 0, 1, 1,
-0.00695328, 1.004948, 1.908732, 0, 0, 0, 1, 1,
-0.005627114, -1.737098, -3.437221, 0, 0, 0, 1, 1,
-0.005027577, 0.3680321, 0.3951197, 0, 0, 0, 1, 1,
-0.004208877, -0.9878937, -2.33536, 0, 0, 0, 1, 1,
-0.003427084, 0.3153289, -0.3043248, 1, 1, 1, 1, 1,
-0.003297651, 1.658619, 1.116252, 1, 1, 1, 1, 1,
-0.00191206, -0.4920589, -3.93488, 1, 1, 1, 1, 1,
-0.001307392, 0.8599384, -0.04558899, 1, 1, 1, 1, 1,
0.005291485, -0.1544162, 4.649815, 1, 1, 1, 1, 1,
0.008168895, -0.8238415, 3.229131, 1, 1, 1, 1, 1,
0.009431088, 0.007553548, 1.730705, 1, 1, 1, 1, 1,
0.01438155, 0.3984315, 0.1734015, 1, 1, 1, 1, 1,
0.01482224, -0.1230106, 4.357393, 1, 1, 1, 1, 1,
0.01506789, -0.5017314, 2.933652, 1, 1, 1, 1, 1,
0.0163684, -0.6897367, 3.67898, 1, 1, 1, 1, 1,
0.0219513, 0.3755808, 1.191773, 1, 1, 1, 1, 1,
0.0247059, -0.155142, 2.327296, 1, 1, 1, 1, 1,
0.02929367, -0.2715919, 3.815346, 1, 1, 1, 1, 1,
0.03367215, 0.4255249, 1.183859, 1, 1, 1, 1, 1,
0.03386717, 0.2375075, -0.585636, 0, 0, 1, 1, 1,
0.03496326, 0.7010736, 0.1786962, 1, 0, 0, 1, 1,
0.03636952, 1.59122, -1.156052, 1, 0, 0, 1, 1,
0.0367802, 0.6427214, -0.4764441, 1, 0, 0, 1, 1,
0.03805163, -0.1726555, 4.413293, 1, 0, 0, 1, 1,
0.03926357, -0.61685, 2.593073, 1, 0, 0, 1, 1,
0.04371532, -0.3687822, 4.373404, 0, 0, 0, 1, 1,
0.04422406, -1.391735, 4.130798, 0, 0, 0, 1, 1,
0.0490938, 0.2106888, -0.31339, 0, 0, 0, 1, 1,
0.05407768, -2.238408, 3.48377, 0, 0, 0, 1, 1,
0.05512395, 0.4020491, 1.384092, 0, 0, 0, 1, 1,
0.05675562, -1.127579, 2.692102, 0, 0, 0, 1, 1,
0.06279231, 0.1476949, 0.7145644, 0, 0, 0, 1, 1,
0.06960565, 0.4409694, 0.73177, 1, 1, 1, 1, 1,
0.07024805, 0.8107709, 1.581703, 1, 1, 1, 1, 1,
0.07554394, -0.7402198, 3.475646, 1, 1, 1, 1, 1,
0.07607467, 0.2858733, -0.4441932, 1, 1, 1, 1, 1,
0.07890671, 0.2684568, -0.3846588, 1, 1, 1, 1, 1,
0.08397102, 0.6002446, 0.3614533, 1, 1, 1, 1, 1,
0.08430818, 1.093955, 2.230024, 1, 1, 1, 1, 1,
0.08468027, 0.9819069, -0.7736524, 1, 1, 1, 1, 1,
0.08713582, 0.1425685, -0.6213948, 1, 1, 1, 1, 1,
0.0871891, -0.6390302, 4.850488, 1, 1, 1, 1, 1,
0.09109242, -0.6721418, 3.508506, 1, 1, 1, 1, 1,
0.09276008, -0.7981746, 2.618821, 1, 1, 1, 1, 1,
0.09317003, 0.9137231, -0.3082351, 1, 1, 1, 1, 1,
0.09631587, 0.2797961, 1.136838, 1, 1, 1, 1, 1,
0.09634764, -0.9075884, 2.223238, 1, 1, 1, 1, 1,
0.102209, -1.247191, 3.043236, 0, 0, 1, 1, 1,
0.1027417, -0.1896247, 2.718609, 1, 0, 0, 1, 1,
0.1032411, -1.929998, 2.010175, 1, 0, 0, 1, 1,
0.1085022, 1.656127, 0.6600731, 1, 0, 0, 1, 1,
0.1105942, -0.09199103, 2.676638, 1, 0, 0, 1, 1,
0.1114738, -0.2367692, 2.915928, 1, 0, 0, 1, 1,
0.1133811, -1.139871, 1.784128, 0, 0, 0, 1, 1,
0.1152092, 0.5365557, 0.4831568, 0, 0, 0, 1, 1,
0.1183072, 1.316156, 0.2009093, 0, 0, 0, 1, 1,
0.1228358, -0.5594975, 2.584017, 0, 0, 0, 1, 1,
0.1234173, 0.256473, 0.04380813, 0, 0, 0, 1, 1,
0.1296035, 0.449082, -0.01322405, 0, 0, 0, 1, 1,
0.1304722, 0.2838722, -0.1524408, 0, 0, 0, 1, 1,
0.1308064, -0.5894296, 3.101727, 1, 1, 1, 1, 1,
0.1353713, 0.4143877, -0.606363, 1, 1, 1, 1, 1,
0.1400152, -0.465432, 2.251669, 1, 1, 1, 1, 1,
0.140328, -1.866608, 2.748205, 1, 1, 1, 1, 1,
0.1467746, -1.746212, 3.449016, 1, 1, 1, 1, 1,
0.1481773, -0.2873386, 2.932753, 1, 1, 1, 1, 1,
0.1492622, -0.01140814, 1.644523, 1, 1, 1, 1, 1,
0.1526408, 0.5515713, 1.478403, 1, 1, 1, 1, 1,
0.1534826, 0.0770594, -1.600652, 1, 1, 1, 1, 1,
0.1535238, 0.8275568, -0.04155279, 1, 1, 1, 1, 1,
0.154388, -0.3005956, 0.493241, 1, 1, 1, 1, 1,
0.1559018, 0.6822421, 0.01221886, 1, 1, 1, 1, 1,
0.155967, 1.401105, -1.222851, 1, 1, 1, 1, 1,
0.156449, 1.715272, 0.0407402, 1, 1, 1, 1, 1,
0.1576472, 1.233183, -1.439762, 1, 1, 1, 1, 1,
0.1587131, 0.4354777, 1.34717, 0, 0, 1, 1, 1,
0.158914, 0.6347422, 0.3496854, 1, 0, 0, 1, 1,
0.1638129, 1.57962, 0.512554, 1, 0, 0, 1, 1,
0.163858, 0.4109023, 0.09345023, 1, 0, 0, 1, 1,
0.1699095, -1.033796, 2.545105, 1, 0, 0, 1, 1,
0.1701776, 0.4031684, 0.1317317, 1, 0, 0, 1, 1,
0.1709577, -0.5321133, 3.713872, 0, 0, 0, 1, 1,
0.1710745, -0.1774392, 1.429002, 0, 0, 0, 1, 1,
0.172063, -0.7851089, 2.016837, 0, 0, 0, 1, 1,
0.1757353, 1.934806, -0.06744638, 0, 0, 0, 1, 1,
0.1801748, 0.6649396, -0.7315049, 0, 0, 0, 1, 1,
0.1833706, -1.292992, 2.009431, 0, 0, 0, 1, 1,
0.1848399, -0.5066285, 2.534263, 0, 0, 0, 1, 1,
0.1863862, -0.6265524, 3.745075, 1, 1, 1, 1, 1,
0.1869237, 0.7453761, 1.818902, 1, 1, 1, 1, 1,
0.1879494, -0.07833465, 1.786954, 1, 1, 1, 1, 1,
0.1881616, -0.1719585, 3.37531, 1, 1, 1, 1, 1,
0.188661, 1.070496, 0.4079596, 1, 1, 1, 1, 1,
0.1921062, -0.602945, 1.773554, 1, 1, 1, 1, 1,
0.1924002, -0.07706603, 2.440431, 1, 1, 1, 1, 1,
0.192555, -0.4132742, 2.446354, 1, 1, 1, 1, 1,
0.1958928, -1.538411, 3.948042, 1, 1, 1, 1, 1,
0.1970541, 0.6514891, 0.03074548, 1, 1, 1, 1, 1,
0.1972605, 0.6213987, 1.271285, 1, 1, 1, 1, 1,
0.1995293, -0.2370099, 3.846782, 1, 1, 1, 1, 1,
0.2009993, -0.02210069, 2.498047, 1, 1, 1, 1, 1,
0.2019713, -1.122163, 1.627666, 1, 1, 1, 1, 1,
0.2034915, 1.24835, 0.1109514, 1, 1, 1, 1, 1,
0.203603, 0.7919936, 3.420977, 0, 0, 1, 1, 1,
0.2050881, -0.575411, 4.209866, 1, 0, 0, 1, 1,
0.2071295, -0.2183688, 2.67586, 1, 0, 0, 1, 1,
0.2094412, 0.6366342, 0.9978003, 1, 0, 0, 1, 1,
0.2102645, 1.405768, 0.406962, 1, 0, 0, 1, 1,
0.2132037, 1.762228, 0.2579302, 1, 0, 0, 1, 1,
0.2144875, -0.7640125, 2.022337, 0, 0, 0, 1, 1,
0.2150361, -0.2202468, 4.041254, 0, 0, 0, 1, 1,
0.2160133, -0.6726477, 2.233435, 0, 0, 0, 1, 1,
0.2169116, 0.7896408, -1.335495, 0, 0, 0, 1, 1,
0.2170913, 0.3250008, 0.6104217, 0, 0, 0, 1, 1,
0.2177542, -0.7592441, 2.983176, 0, 0, 0, 1, 1,
0.2215516, 2.121059, 0.7178127, 0, 0, 0, 1, 1,
0.2241971, 0.6921905, 2.068373, 1, 1, 1, 1, 1,
0.2244061, 0.08476069, -0.2338094, 1, 1, 1, 1, 1,
0.226039, 2.27775, -2.940771, 1, 1, 1, 1, 1,
0.2262461, -0.148323, 1.570475, 1, 1, 1, 1, 1,
0.2282861, -1.17227, 3.732274, 1, 1, 1, 1, 1,
0.2291462, 0.1509163, 0.9502476, 1, 1, 1, 1, 1,
0.2320046, 0.8398612, 0.5632905, 1, 1, 1, 1, 1,
0.2342508, 1.211959, -0.9542377, 1, 1, 1, 1, 1,
0.2361955, -0.4710105, 2.456932, 1, 1, 1, 1, 1,
0.2407964, -0.1348659, 1.653733, 1, 1, 1, 1, 1,
0.2414928, 1.865999, 0.6878213, 1, 1, 1, 1, 1,
0.2484569, -0.3457297, 4.241756, 1, 1, 1, 1, 1,
0.2501318, -0.2821982, 1.870951, 1, 1, 1, 1, 1,
0.2521372, 1.457999, -1.41597, 1, 1, 1, 1, 1,
0.2521989, 0.8001068, 0.02238717, 1, 1, 1, 1, 1,
0.2603392, -1.688009, 1.812034, 0, 0, 1, 1, 1,
0.2615665, -0.2990977, 3.155396, 1, 0, 0, 1, 1,
0.2712881, 0.6485164, -0.005051212, 1, 0, 0, 1, 1,
0.2736046, -0.2691384, 1.561659, 1, 0, 0, 1, 1,
0.2792587, -0.1125872, 1.261412, 1, 0, 0, 1, 1,
0.2826859, 0.7928827, -0.3160355, 1, 0, 0, 1, 1,
0.2828427, 0.2552896, 1.612656, 0, 0, 0, 1, 1,
0.2843668, -0.07698999, 0.6022721, 0, 0, 0, 1, 1,
0.2864152, -1.9433, 2.07198, 0, 0, 0, 1, 1,
0.2879123, 2.16622, 0.1855911, 0, 0, 0, 1, 1,
0.2899562, -0.8507158, 4.210217, 0, 0, 0, 1, 1,
0.2964738, -1.191769, 0.9226792, 0, 0, 0, 1, 1,
0.2993976, 0.3395931, 0.1396731, 0, 0, 0, 1, 1,
0.3012322, 0.6289208, -0.03409863, 1, 1, 1, 1, 1,
0.3015383, 0.2630616, 1.393287, 1, 1, 1, 1, 1,
0.3030568, -0.9234273, 3.331409, 1, 1, 1, 1, 1,
0.3031002, 1.471495, -0.1823396, 1, 1, 1, 1, 1,
0.3095252, 0.1739041, 2.766564, 1, 1, 1, 1, 1,
0.3126352, -0.005818431, 0.510448, 1, 1, 1, 1, 1,
0.3186725, -1.673577, 1.457011, 1, 1, 1, 1, 1,
0.3189128, 0.8185431, -0.1670397, 1, 1, 1, 1, 1,
0.3233658, -0.202183, 0.73245, 1, 1, 1, 1, 1,
0.3241009, 2.05619, -0.1469328, 1, 1, 1, 1, 1,
0.3295224, -0.1191224, 1.898644, 1, 1, 1, 1, 1,
0.3369922, 1.473362, 1.722699, 1, 1, 1, 1, 1,
0.3372068, -0.7203795, 2.938537, 1, 1, 1, 1, 1,
0.3373154, -0.9753962, 4.019961, 1, 1, 1, 1, 1,
0.3383836, -0.7070649, 3.142187, 1, 1, 1, 1, 1,
0.3406735, 1.166191, 1.055399, 0, 0, 1, 1, 1,
0.3434672, 1.43508, 0.1272732, 1, 0, 0, 1, 1,
0.3442698, -1.223236, 1.826815, 1, 0, 0, 1, 1,
0.3475783, 1.067911, 1.597898, 1, 0, 0, 1, 1,
0.3500692, 0.001410508, 2.567763, 1, 0, 0, 1, 1,
0.3624294, 0.117838, 2.655702, 1, 0, 0, 1, 1,
0.365291, 0.5615214, 1.853252, 0, 0, 0, 1, 1,
0.3654158, -1.208089, 4.449272, 0, 0, 0, 1, 1,
0.3717977, -0.5467251, 2.520348, 0, 0, 0, 1, 1,
0.371955, 1.130578, 0.5249402, 0, 0, 0, 1, 1,
0.3770467, -0.118149, 1.400255, 0, 0, 0, 1, 1,
0.3810682, -0.9338614, 4.600029, 0, 0, 0, 1, 1,
0.3890063, -0.4319694, 2.689772, 0, 0, 0, 1, 1,
0.3895027, 0.3272934, 3.937673, 1, 1, 1, 1, 1,
0.3924601, 0.8821212, 0.7522985, 1, 1, 1, 1, 1,
0.3960755, 0.4863171, 0.2856515, 1, 1, 1, 1, 1,
0.3980506, -0.426894, 5.156576, 1, 1, 1, 1, 1,
0.3986897, 0.4929031, 0.6797315, 1, 1, 1, 1, 1,
0.399286, 1.656147, 0.934099, 1, 1, 1, 1, 1,
0.3992963, -0.4812177, 5.583805, 1, 1, 1, 1, 1,
0.4009596, -0.08959919, 1.231336, 1, 1, 1, 1, 1,
0.4069373, -0.9242814, 3.467594, 1, 1, 1, 1, 1,
0.408503, 1.314938, -1.228758, 1, 1, 1, 1, 1,
0.4128653, -1.233981, 1.173264, 1, 1, 1, 1, 1,
0.4173962, -0.723462, 1.656276, 1, 1, 1, 1, 1,
0.4215986, 0.2082743, 2.381676, 1, 1, 1, 1, 1,
0.4242181, 0.7501482, -1.365289, 1, 1, 1, 1, 1,
0.424559, 0.733816, 1.57285, 1, 1, 1, 1, 1,
0.4314622, 0.2264866, 0.9050898, 0, 0, 1, 1, 1,
0.4324929, -0.2673712, 2.294098, 1, 0, 0, 1, 1,
0.4364394, -0.8939132, 2.540045, 1, 0, 0, 1, 1,
0.4380912, -0.4229123, 1.008873, 1, 0, 0, 1, 1,
0.4489399, 1.208854, 1.396366, 1, 0, 0, 1, 1,
0.4506909, 1.384788, 0.5541343, 1, 0, 0, 1, 1,
0.4514254, 1.012013, 1.058521, 0, 0, 0, 1, 1,
0.4536749, -3.168187, 4.479938, 0, 0, 0, 1, 1,
0.4631879, 0.2507788, 0.8577925, 0, 0, 0, 1, 1,
0.4702976, 0.3702856, 1.871597, 0, 0, 0, 1, 1,
0.4764722, 0.7686402, 0.2434406, 0, 0, 0, 1, 1,
0.479168, -1.652379, 2.440566, 0, 0, 0, 1, 1,
0.4816448, 0.3314229, 1.630435, 0, 0, 0, 1, 1,
0.4838382, 1.287378, -0.08338121, 1, 1, 1, 1, 1,
0.4867262, 0.1859743, 1.551505, 1, 1, 1, 1, 1,
0.4908, 1.80469, -0.09748573, 1, 1, 1, 1, 1,
0.4939548, 1.061638, 0.8658636, 1, 1, 1, 1, 1,
0.4945364, -1.172591, 3.239687, 1, 1, 1, 1, 1,
0.495466, -0.2088205, 1.761132, 1, 1, 1, 1, 1,
0.4996353, -1.516661, 4.443149, 1, 1, 1, 1, 1,
0.5019915, 1.053799, -0.09912596, 1, 1, 1, 1, 1,
0.5032501, 0.3966758, 0.8379958, 1, 1, 1, 1, 1,
0.5069728, -0.2698154, 2.038004, 1, 1, 1, 1, 1,
0.5143635, -0.2494252, 1.981558, 1, 1, 1, 1, 1,
0.5339747, 2.996228, -0.8415065, 1, 1, 1, 1, 1,
0.539793, 0.1842849, 0.2266997, 1, 1, 1, 1, 1,
0.5399444, -0.1633167, 0.3483012, 1, 1, 1, 1, 1,
0.54102, -0.8654663, 2.380612, 1, 1, 1, 1, 1,
0.5487366, 1.739983, -0.1691805, 0, 0, 1, 1, 1,
0.5531279, -1.601397, 1.747071, 1, 0, 0, 1, 1,
0.5542681, 1.00889, -1.243971, 1, 0, 0, 1, 1,
0.5587819, -0.4490924, 3.121943, 1, 0, 0, 1, 1,
0.5592878, 0.818535, 1.094277, 1, 0, 0, 1, 1,
0.560779, -0.4787171, 2.70146, 1, 0, 0, 1, 1,
0.5617065, 0.8024197, 2.118975, 0, 0, 0, 1, 1,
0.5627871, 0.3577714, -1.370507, 0, 0, 0, 1, 1,
0.5663513, -0.5515137, 0.9660113, 0, 0, 0, 1, 1,
0.5720308, 0.5785311, -0.06155494, 0, 0, 0, 1, 1,
0.5744255, -0.7253413, 3.37625, 0, 0, 0, 1, 1,
0.5760888, 0.7337639, 1.497425, 0, 0, 0, 1, 1,
0.5805078, -0.5718794, 3.31925, 0, 0, 0, 1, 1,
0.5806805, 0.976993, 0.7578816, 1, 1, 1, 1, 1,
0.5829392, -1.704044, 1.67747, 1, 1, 1, 1, 1,
0.5853613, 2.063947, -0.8486666, 1, 1, 1, 1, 1,
0.5884554, -1.201, 3.21749, 1, 1, 1, 1, 1,
0.5900281, -1.094676, 2.684519, 1, 1, 1, 1, 1,
0.5958325, 0.936859, 1.540209, 1, 1, 1, 1, 1,
0.6037845, -0.5965317, 2.710707, 1, 1, 1, 1, 1,
0.6053037, 2.261871, 1.903891, 1, 1, 1, 1, 1,
0.6061876, 0.7244025, -0.101245, 1, 1, 1, 1, 1,
0.6112801, -1.823102, 3.196225, 1, 1, 1, 1, 1,
0.6131045, 0.7467512, -0.0654825, 1, 1, 1, 1, 1,
0.6155323, 0.03225855, 2.080348, 1, 1, 1, 1, 1,
0.6176425, -1.231688, 3.069526, 1, 1, 1, 1, 1,
0.6214907, -0.08886881, 1.338236, 1, 1, 1, 1, 1,
0.621751, -1.146428, 2.860963, 1, 1, 1, 1, 1,
0.624975, 1.502862, 0.9807422, 0, 0, 1, 1, 1,
0.6292413, 1.399348, 0.960498, 1, 0, 0, 1, 1,
0.630688, -0.5164708, 2.985146, 1, 0, 0, 1, 1,
0.6331196, -0.6033858, 0.1183925, 1, 0, 0, 1, 1,
0.6370283, -0.7865485, 1.752329, 1, 0, 0, 1, 1,
0.6396526, 1.204876, 1.561429, 1, 0, 0, 1, 1,
0.6411827, -1.282733, 2.349746, 0, 0, 0, 1, 1,
0.6429443, -0.005561063, 2.162638, 0, 0, 0, 1, 1,
0.6479567, 0.1770848, 1.618555, 0, 0, 0, 1, 1,
0.6535957, -1.6505, 1.795242, 0, 0, 0, 1, 1,
0.672623, 0.6201139, 2.387304, 0, 0, 0, 1, 1,
0.6823811, 0.4332097, 2.193841, 0, 0, 0, 1, 1,
0.6854703, 0.23514, -0.2468314, 0, 0, 0, 1, 1,
0.6892505, -0.3268318, 1.645015, 1, 1, 1, 1, 1,
0.692113, -1.062058, 3.239083, 1, 1, 1, 1, 1,
0.6933761, 0.8229191, 1.435478, 1, 1, 1, 1, 1,
0.6949559, -0.6582093, 5.168546, 1, 1, 1, 1, 1,
0.7048057, 1.204445, 0.905128, 1, 1, 1, 1, 1,
0.7052063, 1.689308, 0.1948609, 1, 1, 1, 1, 1,
0.70649, 0.8738626, 1.366758, 1, 1, 1, 1, 1,
0.7126166, -0.1012239, 0.9359638, 1, 1, 1, 1, 1,
0.7138554, 0.7281491, 0.1389762, 1, 1, 1, 1, 1,
0.7157127, -0.3557448, 1.584394, 1, 1, 1, 1, 1,
0.7162215, -0.1434421, 1.910692, 1, 1, 1, 1, 1,
0.7171505, -0.8608667, 4.102656, 1, 1, 1, 1, 1,
0.7216826, -0.6855868, 1.056471, 1, 1, 1, 1, 1,
0.7302623, 0.3675623, 1.864689, 1, 1, 1, 1, 1,
0.7326859, -0.7112159, 3.607641, 1, 1, 1, 1, 1,
0.7378336, 0.5002464, 2.63114, 0, 0, 1, 1, 1,
0.7421027, 1.761007, 1.632213, 1, 0, 0, 1, 1,
0.7424802, -1.133853, 1.40488, 1, 0, 0, 1, 1,
0.7446713, 0.910414, 0.8770152, 1, 0, 0, 1, 1,
0.7456901, 0.09519505, 1.483454, 1, 0, 0, 1, 1,
0.7457358, 2.310812, 1.300512, 1, 0, 0, 1, 1,
0.7490531, 0.7051427, 0.1846322, 0, 0, 0, 1, 1,
0.750693, -0.08920293, 2.023947, 0, 0, 0, 1, 1,
0.754971, -1.736282, 2.422348, 0, 0, 0, 1, 1,
0.7552534, 0.1940044, 1.198143, 0, 0, 0, 1, 1,
0.7555284, 0.6890275, 1.991085, 0, 0, 0, 1, 1,
0.7568813, 0.8746424, 1.238574, 0, 0, 0, 1, 1,
0.7583364, -0.2072848, 3.622789, 0, 0, 0, 1, 1,
0.7586915, -0.6149163, 1.287892, 1, 1, 1, 1, 1,
0.7614396, -0.03970776, 2.946596, 1, 1, 1, 1, 1,
0.7615546, 0.6095874, 1.189826, 1, 1, 1, 1, 1,
0.7679294, -1.271416, 3.151724, 1, 1, 1, 1, 1,
0.768351, -0.003425815, 2.776503, 1, 1, 1, 1, 1,
0.7694902, 0.2417782, -1.166423, 1, 1, 1, 1, 1,
0.7702128, 0.6682739, 0.4720282, 1, 1, 1, 1, 1,
0.7740938, -1.094131, 2.565449, 1, 1, 1, 1, 1,
0.7766607, 0.4200717, 2.717614, 1, 1, 1, 1, 1,
0.777164, 0.2674114, 3.084128, 1, 1, 1, 1, 1,
0.7783209, 0.5679563, 2.15936, 1, 1, 1, 1, 1,
0.7801604, -0.2345716, 0.08154995, 1, 1, 1, 1, 1,
0.7810168, -0.8373674, 3.033097, 1, 1, 1, 1, 1,
0.7872794, 0.3533388, 1.837944, 1, 1, 1, 1, 1,
0.7915862, 0.4196893, 0.9483034, 1, 1, 1, 1, 1,
0.7932873, -1.580343, 2.993271, 0, 0, 1, 1, 1,
0.797008, -2.438353, 4.044569, 1, 0, 0, 1, 1,
0.7973086, 1.139003, 2.369375, 1, 0, 0, 1, 1,
0.8056779, 1.973149, -2.381498, 1, 0, 0, 1, 1,
0.8056816, 1.441213, -0.06250153, 1, 0, 0, 1, 1,
0.8059847, 0.1930608, 2.20122, 1, 0, 0, 1, 1,
0.8100042, 0.2645489, 2.635868, 0, 0, 0, 1, 1,
0.8118682, -0.9046899, 4.908173, 0, 0, 0, 1, 1,
0.8197811, -0.2488064, 0.5451566, 0, 0, 0, 1, 1,
0.8201197, -0.7385792, 2.873724, 0, 0, 0, 1, 1,
0.822001, -0.3330169, 0.8718833, 0, 0, 0, 1, 1,
0.8224397, -0.06071183, 0.7508432, 0, 0, 0, 1, 1,
0.825869, 2.654006, -0.4225546, 0, 0, 0, 1, 1,
0.8291382, -0.8023863, 2.528844, 1, 1, 1, 1, 1,
0.8296391, 0.2373342, 0.9851735, 1, 1, 1, 1, 1,
0.8345786, 0.148525, 1.80615, 1, 1, 1, 1, 1,
0.8381985, 0.3761706, 1.1871, 1, 1, 1, 1, 1,
0.8455865, 0.6337644, 2.222631, 1, 1, 1, 1, 1,
0.8498175, 0.1457828, 0.7584715, 1, 1, 1, 1, 1,
0.8507767, 1.712854, 1.855303, 1, 1, 1, 1, 1,
0.8533887, -0.2591014, 1.606688, 1, 1, 1, 1, 1,
0.8546745, -0.73382, 1.267272, 1, 1, 1, 1, 1,
0.8585734, -1.340184, 3.67781, 1, 1, 1, 1, 1,
0.8654661, -0.7145701, 2.576293, 1, 1, 1, 1, 1,
0.8731752, 1.248828, 0.7147214, 1, 1, 1, 1, 1,
0.8735493, 0.5495092, 1.547511, 1, 1, 1, 1, 1,
0.8803922, 1.094687, 1.043305, 1, 1, 1, 1, 1,
0.9113975, -2.606525, 2.337325, 1, 1, 1, 1, 1,
0.925891, -0.9927988, 1.719202, 0, 0, 1, 1, 1,
0.9277641, 2.633984, 1.346931, 1, 0, 0, 1, 1,
0.9397994, -0.3697077, 2.23516, 1, 0, 0, 1, 1,
0.9412024, -0.2744049, 1.110502, 1, 0, 0, 1, 1,
0.9433261, 1.200116, 2.034387, 1, 0, 0, 1, 1,
0.9457549, -0.790153, 2.185492, 1, 0, 0, 1, 1,
0.9517171, -0.03654875, 2.167444, 0, 0, 0, 1, 1,
0.9558021, 1.658369, 0.06027129, 0, 0, 0, 1, 1,
0.9603769, -0.02587599, 3.281635, 0, 0, 0, 1, 1,
0.9741006, -0.4638957, 1.750691, 0, 0, 0, 1, 1,
0.9751369, -0.7859917, 2.137148, 0, 0, 0, 1, 1,
0.9753344, -0.524617, 4.210887, 0, 0, 0, 1, 1,
0.9868094, -1.221751, 2.103636, 0, 0, 0, 1, 1,
0.987061, -0.9738159, 2.235909, 1, 1, 1, 1, 1,
0.9880444, 0.8908883, 1.183412, 1, 1, 1, 1, 1,
0.9898386, 0.2202722, 2.682584, 1, 1, 1, 1, 1,
0.9909484, -1.050328, 1.223954, 1, 1, 1, 1, 1,
0.9916432, 0.4206625, 0.6335187, 1, 1, 1, 1, 1,
0.9940546, 1.194582, -0.7568473, 1, 1, 1, 1, 1,
0.9946313, -0.1644963, 2.054018, 1, 1, 1, 1, 1,
1.001877, 1.631584, 1.038305, 1, 1, 1, 1, 1,
1.003957, 0.5149742, 2.052924, 1, 1, 1, 1, 1,
1.005597, 0.862836, 0.2823778, 1, 1, 1, 1, 1,
1.005889, -0.5944288, 0.970697, 1, 1, 1, 1, 1,
1.008909, -0.3899124, 3.098445, 1, 1, 1, 1, 1,
1.019396, -0.3195939, 2.153763, 1, 1, 1, 1, 1,
1.019897, -1.189512, 1.32399, 1, 1, 1, 1, 1,
1.026401, 0.4672045, 0.2773719, 1, 1, 1, 1, 1,
1.031794, 0.3852745, 1.014685, 0, 0, 1, 1, 1,
1.03632, -1.641614, 1.920392, 1, 0, 0, 1, 1,
1.040513, 0.3372828, 2.645426, 1, 0, 0, 1, 1,
1.041876, 0.7336411, -1.136373, 1, 0, 0, 1, 1,
1.043255, -1.611366, 5.321908, 1, 0, 0, 1, 1,
1.045387, 0.166873, 0.4740642, 1, 0, 0, 1, 1,
1.045969, -0.3755134, 1.833916, 0, 0, 0, 1, 1,
1.049762, 1.769639, 1.328385, 0, 0, 0, 1, 1,
1.074931, -1.239326, 1.275554, 0, 0, 0, 1, 1,
1.075608, 2.054909, 0.1853406, 0, 0, 0, 1, 1,
1.079157, 0.2670847, 1.495869, 0, 0, 0, 1, 1,
1.080135, -0.7064166, 3.349479, 0, 0, 0, 1, 1,
1.088875, -0.5057105, 1.609811, 0, 0, 0, 1, 1,
1.096132, -0.1502527, -0.8628783, 1, 1, 1, 1, 1,
1.096867, 0.03274805, 1.782496, 1, 1, 1, 1, 1,
1.103621, 0.8086243, 1.659754, 1, 1, 1, 1, 1,
1.116912, 0.4527294, 2.247263, 1, 1, 1, 1, 1,
1.124134, 0.9891779, -0.2629564, 1, 1, 1, 1, 1,
1.136067, -0.1168754, 1.303766, 1, 1, 1, 1, 1,
1.138553, -1.389761, 1.594347, 1, 1, 1, 1, 1,
1.139136, 0.3012449, 1.824633, 1, 1, 1, 1, 1,
1.143304, -0.5376965, 3.462336, 1, 1, 1, 1, 1,
1.147924, -0.3417659, 2.362137, 1, 1, 1, 1, 1,
1.149373, -0.739145, 2.668965, 1, 1, 1, 1, 1,
1.155829, -0.9621028, 3.227835, 1, 1, 1, 1, 1,
1.158557, -1.030211, 2.680126, 1, 1, 1, 1, 1,
1.159779, -0.3905995, 2.245981, 1, 1, 1, 1, 1,
1.161465, -0.3720318, 2.581248, 1, 1, 1, 1, 1,
1.17553, 0.542448, -0.03746062, 0, 0, 1, 1, 1,
1.183404, -1.632832, 2.589468, 1, 0, 0, 1, 1,
1.187009, 0.6636583, 1.166175, 1, 0, 0, 1, 1,
1.187501, 0.8798941, 0.3356873, 1, 0, 0, 1, 1,
1.193406, 0.3292847, 0.7739266, 1, 0, 0, 1, 1,
1.202252, -0.287056, 2.332234, 1, 0, 0, 1, 1,
1.203786, 0.1094835, 0.8135186, 0, 0, 0, 1, 1,
1.208697, 0.2773253, 2.420116, 0, 0, 0, 1, 1,
1.20905, -1.041807, 0.9674044, 0, 0, 0, 1, 1,
1.209985, 0.3097905, 1.303721, 0, 0, 0, 1, 1,
1.210291, 1.498817, 0.08228574, 0, 0, 0, 1, 1,
1.215312, -0.613797, 2.278293, 0, 0, 0, 1, 1,
1.215749, -0.07775778, 1.020954, 0, 0, 0, 1, 1,
1.21689, 0.4624842, 0.291655, 1, 1, 1, 1, 1,
1.21832, 0.1489515, -0.6101345, 1, 1, 1, 1, 1,
1.219968, -0.5346924, 0.9618352, 1, 1, 1, 1, 1,
1.223468, -1.048592, 3.090221, 1, 1, 1, 1, 1,
1.243765, -1.775389, 3.569867, 1, 1, 1, 1, 1,
1.248884, 0.5671737, 1.741205, 1, 1, 1, 1, 1,
1.249539, 1.383033, 0.9150443, 1, 1, 1, 1, 1,
1.25142, 0.2063035, 1.545986, 1, 1, 1, 1, 1,
1.261817, -0.4439009, 2.919827, 1, 1, 1, 1, 1,
1.261865, -1.136444, 2.545675, 1, 1, 1, 1, 1,
1.269266, 1.112537, 0.318774, 1, 1, 1, 1, 1,
1.278654, -0.9646654, 2.505547, 1, 1, 1, 1, 1,
1.300487, 0.06824107, 1.770436, 1, 1, 1, 1, 1,
1.301056, 0.8728656, 0.1880324, 1, 1, 1, 1, 1,
1.310539, 0.2296845, 0.8499566, 1, 1, 1, 1, 1,
1.317665, 0.7249345, 2.636787, 0, 0, 1, 1, 1,
1.32123, 0.654583, 0.6609696, 1, 0, 0, 1, 1,
1.325228, -0.8725843, 0.183184, 1, 0, 0, 1, 1,
1.326787, -0.1756662, 0.7373784, 1, 0, 0, 1, 1,
1.32868, 0.06199917, 0.7177641, 1, 0, 0, 1, 1,
1.332556, -2.104707, 2.465773, 1, 0, 0, 1, 1,
1.333642, 0.5548519, 2.785123, 0, 0, 0, 1, 1,
1.341228, 0.1909839, 0.967872, 0, 0, 0, 1, 1,
1.344559, -0.4658605, 2.856247, 0, 0, 0, 1, 1,
1.355444, 0.9359463, -0.2230779, 0, 0, 0, 1, 1,
1.373308, 0.5900992, 0.9813322, 0, 0, 0, 1, 1,
1.374509, -0.4324048, 3.1437, 0, 0, 0, 1, 1,
1.389749, 2.481841, 1.096923, 0, 0, 0, 1, 1,
1.396101, 1.054454, 0.1980665, 1, 1, 1, 1, 1,
1.4019, 1.402113, 0.9185714, 1, 1, 1, 1, 1,
1.414728, -2.208059, 3.206842, 1, 1, 1, 1, 1,
1.424278, 0.2599569, 0.3291334, 1, 1, 1, 1, 1,
1.427746, 0.4860733, 0.6786521, 1, 1, 1, 1, 1,
1.430004, 1.46675, 0.2328112, 1, 1, 1, 1, 1,
1.430004, 0.4028924, 0.4304314, 1, 1, 1, 1, 1,
1.430562, -0.8072252, 2.12891, 1, 1, 1, 1, 1,
1.432775, -1.309914, 2.314389, 1, 1, 1, 1, 1,
1.434316, 0.732499, -1.189122, 1, 1, 1, 1, 1,
1.455189, 0.9174654, 0.9936315, 1, 1, 1, 1, 1,
1.460708, 0.6635969, 1.731083, 1, 1, 1, 1, 1,
1.460968, -1.459461, 2.516827, 1, 1, 1, 1, 1,
1.463962, 1.638406, 1.44639, 1, 1, 1, 1, 1,
1.465358, 0.8061431, 1.20528, 1, 1, 1, 1, 1,
1.468173, 1.628824, 0.9374722, 0, 0, 1, 1, 1,
1.469759, 1.003852, 2.301981, 1, 0, 0, 1, 1,
1.476049, 2.833761, -0.7114588, 1, 0, 0, 1, 1,
1.476072, 0.3856095, 1.977189, 1, 0, 0, 1, 1,
1.4843, 0.4740092, 2.254752, 1, 0, 0, 1, 1,
1.48823, 0.1526669, 2.064807, 1, 0, 0, 1, 1,
1.492351, -0.8459401, 1.60703, 0, 0, 0, 1, 1,
1.494859, -0.2015145, 2.470036, 0, 0, 0, 1, 1,
1.50308, -0.620517, 2.86356, 0, 0, 0, 1, 1,
1.504343, -0.6253358, 1.070357, 0, 0, 0, 1, 1,
1.515262, 1.230302, 1.016667, 0, 0, 0, 1, 1,
1.52636, 0.8229297, 0.9888006, 0, 0, 0, 1, 1,
1.548294, 0.2510891, 0.7002534, 0, 0, 0, 1, 1,
1.568833, -0.4077303, 0.1483476, 1, 1, 1, 1, 1,
1.571379, 1.427418, 0.1156069, 1, 1, 1, 1, 1,
1.589533, -0.7137928, 2.114227, 1, 1, 1, 1, 1,
1.589853, 0.6477346, 0.8061495, 1, 1, 1, 1, 1,
1.595224, -1.131681, 1.517514, 1, 1, 1, 1, 1,
1.603217, 1.33707, 0.3456794, 1, 1, 1, 1, 1,
1.607956, -1.482024, 4.930542, 1, 1, 1, 1, 1,
1.610063, -0.1973501, 1.205825, 1, 1, 1, 1, 1,
1.637947, 0.09936045, -0.0006379005, 1, 1, 1, 1, 1,
1.65301, 1.565484, -0.5883617, 1, 1, 1, 1, 1,
1.680599, -0.2417841, 1.692577, 1, 1, 1, 1, 1,
1.686404, -1.148576, 2.259157, 1, 1, 1, 1, 1,
1.689011, 0.654823, 1.466721, 1, 1, 1, 1, 1,
1.692266, 0.3614056, -0.4412434, 1, 1, 1, 1, 1,
1.693206, 1.447115, 1.123922, 1, 1, 1, 1, 1,
1.704036, -0.102719, 2.537288, 0, 0, 1, 1, 1,
1.706591, -0.422087, 0.6087382, 1, 0, 0, 1, 1,
1.720959, 1.100342, 0.2456478, 1, 0, 0, 1, 1,
1.72618, 0.718723, 1.432492, 1, 0, 0, 1, 1,
1.730063, -0.5269418, 2.363924, 1, 0, 0, 1, 1,
1.750192, 1.524997, 1.656091, 1, 0, 0, 1, 1,
1.766249, 0.06405916, 0.4069093, 0, 0, 0, 1, 1,
1.775771, -0.338468, 1.294562, 0, 0, 0, 1, 1,
1.795743, 1.467277, 0.5139073, 0, 0, 0, 1, 1,
1.798943, 1.066732, 0.3209499, 0, 0, 0, 1, 1,
1.803119, 0.5413082, 2.262327, 0, 0, 0, 1, 1,
1.807395, 0.5872071, -0.08105641, 0, 0, 0, 1, 1,
1.831463, -2.958158, 1.046232, 0, 0, 0, 1, 1,
1.840799, -0.4835187, 2.809155, 1, 1, 1, 1, 1,
1.854309, -0.07693275, 2.775957, 1, 1, 1, 1, 1,
1.88293, 0.2711644, 2.694838, 1, 1, 1, 1, 1,
1.886063, -0.812722, 3.275182, 1, 1, 1, 1, 1,
1.888054, -0.9383647, 2.392663, 1, 1, 1, 1, 1,
1.897413, 0.06920774, 0.9732031, 1, 1, 1, 1, 1,
1.906147, -0.3602988, 1.982483, 1, 1, 1, 1, 1,
1.921096, -1.674505, 2.877622, 1, 1, 1, 1, 1,
1.944194, -0.008973439, 1.854072, 1, 1, 1, 1, 1,
1.968452, -0.3867995, 0.7633024, 1, 1, 1, 1, 1,
1.97289, -0.4861223, 2.007362, 1, 1, 1, 1, 1,
1.980825, -1.069739, 1.515235, 1, 1, 1, 1, 1,
2.008065, -1.98916, 5.118185, 1, 1, 1, 1, 1,
2.066808, 1.005237, 1.068506, 1, 1, 1, 1, 1,
2.070259, -0.3888171, 0.8852891, 1, 1, 1, 1, 1,
2.108546, -1.045957, 1.478579, 0, 0, 1, 1, 1,
2.148839, 0.01527298, 1.297398, 1, 0, 0, 1, 1,
2.19523, 0.08518405, 1.84266, 1, 0, 0, 1, 1,
2.206853, 0.2693888, 1.426857, 1, 0, 0, 1, 1,
2.209563, 0.7928044, 2.73012, 1, 0, 0, 1, 1,
2.250683, 0.2097433, 2.384003, 1, 0, 0, 1, 1,
2.281254, 0.3943024, 0.8959875, 0, 0, 0, 1, 1,
2.374733, -0.1838502, 0.230824, 0, 0, 0, 1, 1,
2.382941, 0.4130157, 2.957317, 0, 0, 0, 1, 1,
2.444806, -2.35888, 1.855436, 0, 0, 0, 1, 1,
2.462037, 0.5695275, 1.011846, 0, 0, 0, 1, 1,
2.484432, 0.5877622, 1.620201, 0, 0, 0, 1, 1,
2.511545, 0.1624651, 0.4911938, 0, 0, 0, 1, 1,
2.522683, 0.004984862, 1.315874, 1, 1, 1, 1, 1,
2.628102, -1.02041, 2.522059, 1, 1, 1, 1, 1,
2.764348, -0.4575535, 1.583052, 1, 1, 1, 1, 1,
2.78935, 0.1671063, 1.566021, 1, 1, 1, 1, 1,
2.835792, 1.896417, 1.011077, 1, 1, 1, 1, 1,
2.842363, -2.232006, 3.9479, 1, 1, 1, 1, 1,
3.236091, 0.1001104, 0.5284058, 1, 1, 1, 1, 1
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
var radius = 9.748879;
var distance = 34.24252;
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
mvMatrix.translate( 0.03212118, 0.06985116, 0.01407385 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.24252);
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
