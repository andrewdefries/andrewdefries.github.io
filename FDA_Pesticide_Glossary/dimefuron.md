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
-2.849768, -0.3720431, 0.2022037, 1, 0, 0, 1,
-2.794418, 1.294788, 0.340887, 1, 0.007843138, 0, 1,
-2.754407, -0.9614313, -0.9916641, 1, 0.01176471, 0, 1,
-2.660654, -0.6432614, -1.511331, 1, 0.01960784, 0, 1,
-2.646908, -1.374642, -0.07148484, 1, 0.02352941, 0, 1,
-2.635461, -0.2098652, -1.191216, 1, 0.03137255, 0, 1,
-2.58396, -0.00938352, -2.21528, 1, 0.03529412, 0, 1,
-2.52562, -0.2778556, -1.683795, 1, 0.04313726, 0, 1,
-2.519902, -0.1259202, 0.09336989, 1, 0.04705882, 0, 1,
-2.496518, -2.027129, -0.2120583, 1, 0.05490196, 0, 1,
-2.443373, -1.381525, -2.618942, 1, 0.05882353, 0, 1,
-2.348314, 1.303976, -0.1498994, 1, 0.06666667, 0, 1,
-2.338296, -1.660652, -1.473216, 1, 0.07058824, 0, 1,
-2.284132, -0.04087757, -1.182909, 1, 0.07843138, 0, 1,
-2.262597, -0.4897545, -2.085421, 1, 0.08235294, 0, 1,
-2.241927, 0.6471387, 0.8467883, 1, 0.09019608, 0, 1,
-2.217068, 1.296614, -0.1139637, 1, 0.09411765, 0, 1,
-2.174022, -0.06930286, -2.456562, 1, 0.1019608, 0, 1,
-2.163486, 1.698521, -0.6965036, 1, 0.1098039, 0, 1,
-2.155536, 0.06309828, -1.676529, 1, 0.1137255, 0, 1,
-2.105963, -2.114659, -3.515993, 1, 0.1215686, 0, 1,
-2.079618, 2.020022, -1.905775, 1, 0.1254902, 0, 1,
-2.077508, -0.03018687, -3.159249, 1, 0.1333333, 0, 1,
-2.068347, 0.778167, -0.4971268, 1, 0.1372549, 0, 1,
-2.060391, 0.09850528, -3.008589, 1, 0.145098, 0, 1,
-2.008763, -1.142429, -3.133674, 1, 0.1490196, 0, 1,
-2.003481, -0.6087872, -1.105667, 1, 0.1568628, 0, 1,
-2.002746, 1.305158, -2.313009, 1, 0.1607843, 0, 1,
-1.959532, 1.621251, -0.9628799, 1, 0.1686275, 0, 1,
-1.958394, -0.07895664, -1.634336, 1, 0.172549, 0, 1,
-1.957926, 2.14288, -0.2324417, 1, 0.1803922, 0, 1,
-1.952714, -0.08326886, -2.624195, 1, 0.1843137, 0, 1,
-1.935052, 1.112915, -2.077469, 1, 0.1921569, 0, 1,
-1.923126, 0.9878238, 0.9566442, 1, 0.1960784, 0, 1,
-1.902019, 0.5574205, -2.055454, 1, 0.2039216, 0, 1,
-1.897446, -0.5074816, -2.883549, 1, 0.2117647, 0, 1,
-1.874368, 1.260624, -0.8038246, 1, 0.2156863, 0, 1,
-1.863969, 1.125136, 0.08131125, 1, 0.2235294, 0, 1,
-1.861054, -0.1906092, -1.819609, 1, 0.227451, 0, 1,
-1.860265, 1.10936, -1.390058, 1, 0.2352941, 0, 1,
-1.855181, 1.999309, -1.443667, 1, 0.2392157, 0, 1,
-1.822598, -0.3284541, -2.7203, 1, 0.2470588, 0, 1,
-1.816755, 0.3859834, 0.2692225, 1, 0.2509804, 0, 1,
-1.813438, 0.9828808, -1.16272, 1, 0.2588235, 0, 1,
-1.808853, 1.431654, -3.475126, 1, 0.2627451, 0, 1,
-1.788584, 0.910807, -0.6000965, 1, 0.2705882, 0, 1,
-1.788081, 1.06284, -0.2463632, 1, 0.2745098, 0, 1,
-1.786049, 0.8645388, -0.3410301, 1, 0.282353, 0, 1,
-1.779097, 1.117497, -1.283257, 1, 0.2862745, 0, 1,
-1.775661, 0.06764641, -2.176944, 1, 0.2941177, 0, 1,
-1.768269, -0.1820046, -1.180936, 1, 0.3019608, 0, 1,
-1.759863, 2.115611, -0.5360836, 1, 0.3058824, 0, 1,
-1.703317, -1.958257, -0.09718963, 1, 0.3137255, 0, 1,
-1.701339, 0.5100423, -2.143922, 1, 0.3176471, 0, 1,
-1.684058, -1.248278, -3.040601, 1, 0.3254902, 0, 1,
-1.68233, 1.237343, -1.180888, 1, 0.3294118, 0, 1,
-1.675733, 0.8947784, -3.075461, 1, 0.3372549, 0, 1,
-1.656829, 0.07611271, -2.214441, 1, 0.3411765, 0, 1,
-1.645515, -1.753188, -4.147312, 1, 0.3490196, 0, 1,
-1.629877, 0.5225902, -2.503341, 1, 0.3529412, 0, 1,
-1.622682, 1.726625, -2.343956, 1, 0.3607843, 0, 1,
-1.609069, 1.105501, 1.079499, 1, 0.3647059, 0, 1,
-1.601697, 0.2888003, -1.96945, 1, 0.372549, 0, 1,
-1.599783, -0.2153617, -0.5405579, 1, 0.3764706, 0, 1,
-1.591101, 0.1633076, -0.7576969, 1, 0.3843137, 0, 1,
-1.587688, 0.02849342, -3.752019, 1, 0.3882353, 0, 1,
-1.585525, -0.03690604, -0.5161624, 1, 0.3960784, 0, 1,
-1.569134, 0.1997453, -2.45407, 1, 0.4039216, 0, 1,
-1.569055, 0.5225631, -0.5316533, 1, 0.4078431, 0, 1,
-1.561819, -0.3342102, -2.797654, 1, 0.4156863, 0, 1,
-1.557278, 0.4283112, -0.6852497, 1, 0.4196078, 0, 1,
-1.553079, 1.200221, -0.4117321, 1, 0.427451, 0, 1,
-1.551143, 0.682069, -0.6685879, 1, 0.4313726, 0, 1,
-1.54432, 1.428707, -0.1584252, 1, 0.4392157, 0, 1,
-1.539369, 0.7034583, -1.806817, 1, 0.4431373, 0, 1,
-1.538085, -0.9237883, -2.934771, 1, 0.4509804, 0, 1,
-1.531701, -0.4452112, -0.549257, 1, 0.454902, 0, 1,
-1.528929, 0.7813876, -0.3381509, 1, 0.4627451, 0, 1,
-1.524385, -1.515375, -3.443802, 1, 0.4666667, 0, 1,
-1.501402, 0.6322886, 0.1239415, 1, 0.4745098, 0, 1,
-1.500733, -1.526458, -1.392006, 1, 0.4784314, 0, 1,
-1.497081, -0.2419843, -1.433459, 1, 0.4862745, 0, 1,
-1.476171, 1.119281, -0.9597113, 1, 0.4901961, 0, 1,
-1.465166, -1.12534, -1.457402, 1, 0.4980392, 0, 1,
-1.461886, 1.271869, -0.138887, 1, 0.5058824, 0, 1,
-1.459781, 1.228073, -2.143057, 1, 0.509804, 0, 1,
-1.456397, 1.159497, -1.347965, 1, 0.5176471, 0, 1,
-1.453539, 0.803785, -1.136316, 1, 0.5215687, 0, 1,
-1.445942, -0.6724136, -2.438392, 1, 0.5294118, 0, 1,
-1.442604, -0.5684137, -2.605707, 1, 0.5333334, 0, 1,
-1.428088, -2.433552, -1.236784, 1, 0.5411765, 0, 1,
-1.426942, 0.4770046, -1.65976, 1, 0.5450981, 0, 1,
-1.417101, 0.04354722, -1.231099, 1, 0.5529412, 0, 1,
-1.415886, 0.51516, 0.1519245, 1, 0.5568628, 0, 1,
-1.415358, -0.1931665, -1.044693, 1, 0.5647059, 0, 1,
-1.402543, -0.5125557, -2.229264, 1, 0.5686275, 0, 1,
-1.391072, 0.7494584, -0.8692216, 1, 0.5764706, 0, 1,
-1.391041, -2.730251, -2.485111, 1, 0.5803922, 0, 1,
-1.389488, -0.1967184, -0.003673855, 1, 0.5882353, 0, 1,
-1.376702, -0.5758047, -2.885056, 1, 0.5921569, 0, 1,
-1.360258, 0.2496908, -2.532356, 1, 0.6, 0, 1,
-1.35546, 0.3811509, -2.727793, 1, 0.6078432, 0, 1,
-1.352407, 1.249844, -0.997667, 1, 0.6117647, 0, 1,
-1.344568, 1.439093, -1.448146, 1, 0.6196079, 0, 1,
-1.326583, 0.5412635, -0.9516644, 1, 0.6235294, 0, 1,
-1.32491, -1.160028, -3.02753, 1, 0.6313726, 0, 1,
-1.317747, 0.5368488, 0.5379422, 1, 0.6352941, 0, 1,
-1.299866, 0.2019104, -2.25942, 1, 0.6431373, 0, 1,
-1.296233, 0.7112984, -1.821267, 1, 0.6470588, 0, 1,
-1.292072, 1.049858, -2.725587, 1, 0.654902, 0, 1,
-1.290721, -0.2524087, -2.769924, 1, 0.6588235, 0, 1,
-1.28458, 0.2889611, -1.767733, 1, 0.6666667, 0, 1,
-1.282255, 0.4561829, -0.637623, 1, 0.6705883, 0, 1,
-1.278718, -0.6544152, -2.857863, 1, 0.6784314, 0, 1,
-1.273923, -1.412579, -3.984382, 1, 0.682353, 0, 1,
-1.27383, 0.1894798, -3.13248, 1, 0.6901961, 0, 1,
-1.260007, -0.02902881, -1.673888, 1, 0.6941177, 0, 1,
-1.254491, 0.8269277, -2.865333, 1, 0.7019608, 0, 1,
-1.252973, 0.7708546, -1.096895, 1, 0.7098039, 0, 1,
-1.248004, 0.4551259, -1.598345, 1, 0.7137255, 0, 1,
-1.245687, -0.1294171, -2.618504, 1, 0.7215686, 0, 1,
-1.243343, -1.43756, -1.846812, 1, 0.7254902, 0, 1,
-1.233227, -0.2439777, -2.17639, 1, 0.7333333, 0, 1,
-1.232839, 0.429433, -0.51004, 1, 0.7372549, 0, 1,
-1.222714, 0.5948427, -1.330036, 1, 0.7450981, 0, 1,
-1.222044, 0.4249409, -0.7187034, 1, 0.7490196, 0, 1,
-1.214585, -1.954359, -2.956621, 1, 0.7568628, 0, 1,
-1.211614, 0.9738801, -0.1384044, 1, 0.7607843, 0, 1,
-1.210598, 1.231588, -1.396334, 1, 0.7686275, 0, 1,
-1.193127, -0.0905997, 0.05387161, 1, 0.772549, 0, 1,
-1.188511, 0.4856363, -1.135059, 1, 0.7803922, 0, 1,
-1.185641, -0.4208179, -0.4865857, 1, 0.7843137, 0, 1,
-1.182329, -1.225117, -3.389164, 1, 0.7921569, 0, 1,
-1.174926, 0.3253607, -1.833414, 1, 0.7960784, 0, 1,
-1.165057, -0.1569904, -1.70244, 1, 0.8039216, 0, 1,
-1.162647, 1.595448, -2.413373, 1, 0.8117647, 0, 1,
-1.16236, 0.09523851, -0.6403939, 1, 0.8156863, 0, 1,
-1.157882, -1.62348, -2.373289, 1, 0.8235294, 0, 1,
-1.151763, -0.5066169, -0.9582904, 1, 0.827451, 0, 1,
-1.149457, -0.3452547, -1.522492, 1, 0.8352941, 0, 1,
-1.136072, 0.5385497, 0.3830932, 1, 0.8392157, 0, 1,
-1.131434, -1.378822, -2.582519, 1, 0.8470588, 0, 1,
-1.12229, 0.3150447, -1.474149, 1, 0.8509804, 0, 1,
-1.120512, 0.04674852, -3.994399, 1, 0.8588235, 0, 1,
-1.119396, -0.3933508, -0.1466852, 1, 0.8627451, 0, 1,
-1.116649, -0.04012429, -0.6763728, 1, 0.8705882, 0, 1,
-1.116377, -1.84892, -1.996553, 1, 0.8745098, 0, 1,
-1.104315, -0.7658622, -2.388763, 1, 0.8823529, 0, 1,
-1.102619, 1.735308, -0.6040897, 1, 0.8862745, 0, 1,
-1.096515, 0.4836217, -2.770951, 1, 0.8941177, 0, 1,
-1.089305, 1.534479, 0.4092104, 1, 0.8980392, 0, 1,
-1.082114, -1.14178, -1.862848, 1, 0.9058824, 0, 1,
-1.080668, -0.1578682, -1.099711, 1, 0.9137255, 0, 1,
-1.075326, -0.7116026, -1.757882, 1, 0.9176471, 0, 1,
-1.072842, 0.9915032, -1.466111, 1, 0.9254902, 0, 1,
-1.072256, -0.1327953, -2.419908, 1, 0.9294118, 0, 1,
-1.06867, -1.260821, -2.137486, 1, 0.9372549, 0, 1,
-1.067755, -0.07360651, -2.442663, 1, 0.9411765, 0, 1,
-1.067191, 0.3992118, -2.06281, 1, 0.9490196, 0, 1,
-1.062777, -1.065976, -2.074245, 1, 0.9529412, 0, 1,
-1.05497, -1.396572, -2.237118, 1, 0.9607843, 0, 1,
-1.050157, -0.1378982, -1.091828, 1, 0.9647059, 0, 1,
-1.050056, 1.209558, -0.904744, 1, 0.972549, 0, 1,
-1.048535, 1.824022, -1.608561, 1, 0.9764706, 0, 1,
-1.046182, -0.07638173, -2.535152, 1, 0.9843137, 0, 1,
-1.040906, 1.689779, 0.4455363, 1, 0.9882353, 0, 1,
-1.040501, -0.8201196, -3.045794, 1, 0.9960784, 0, 1,
-1.029573, 2.056238, 0.01578694, 0.9960784, 1, 0, 1,
-1.023955, 0.3650023, 0.7279209, 0.9921569, 1, 0, 1,
-1.021552, -0.9277408, -2.494372, 0.9843137, 1, 0, 1,
-1.017436, 0.709205, -1.400513, 0.9803922, 1, 0, 1,
-1.012514, 1.364624, -2.816456, 0.972549, 1, 0, 1,
-1.011862, -0.2308329, 0.2019942, 0.9686275, 1, 0, 1,
-1.010185, -0.05819929, -1.8134, 0.9607843, 1, 0, 1,
-1.007348, 0.05793026, -1.038688, 0.9568627, 1, 0, 1,
-0.9997422, 0.9709567, -0.7981931, 0.9490196, 1, 0, 1,
-0.9979489, 0.03742298, -1.903287, 0.945098, 1, 0, 1,
-0.9931726, 0.3862412, -0.7064565, 0.9372549, 1, 0, 1,
-0.9916126, 1.38096, -0.5562709, 0.9333333, 1, 0, 1,
-0.9855765, 0.7342858, -2.358509, 0.9254902, 1, 0, 1,
-0.9838331, -0.4958312, -1.542232, 0.9215686, 1, 0, 1,
-0.9813669, -1.158897, -3.751324, 0.9137255, 1, 0, 1,
-0.9772696, -0.7802987, -3.109076, 0.9098039, 1, 0, 1,
-0.9663556, -0.268842, -1.824201, 0.9019608, 1, 0, 1,
-0.9646809, -0.7381979, -2.84302, 0.8941177, 1, 0, 1,
-0.9584054, -1.776619, -3.165345, 0.8901961, 1, 0, 1,
-0.9477357, 1.712389, -0.6017243, 0.8823529, 1, 0, 1,
-0.9459147, 0.454974, -1.340738, 0.8784314, 1, 0, 1,
-0.9449379, -1.087915, -2.985668, 0.8705882, 1, 0, 1,
-0.9374876, -3.144599, -2.136445, 0.8666667, 1, 0, 1,
-0.9338654, -0.2400449, -0.4665209, 0.8588235, 1, 0, 1,
-0.9334962, 1.130291, 0.2331764, 0.854902, 1, 0, 1,
-0.9323952, -0.9917596, -3.67103, 0.8470588, 1, 0, 1,
-0.9261903, 0.08218642, -2.880649, 0.8431373, 1, 0, 1,
-0.9183513, -0.2975365, -1.45769, 0.8352941, 1, 0, 1,
-0.918195, -0.5379634, -2.453453, 0.8313726, 1, 0, 1,
-0.917015, 0.5564024, -1.143203, 0.8235294, 1, 0, 1,
-0.9138128, 1.037461, 0.09651428, 0.8196079, 1, 0, 1,
-0.9113436, -0.6566494, -0.8720908, 0.8117647, 1, 0, 1,
-0.9086908, -1.088828, -4.132628, 0.8078431, 1, 0, 1,
-0.9042105, 1.250802, -0.9785059, 0.8, 1, 0, 1,
-0.9040321, 1.45391, -2.622999, 0.7921569, 1, 0, 1,
-0.89698, 0.2888013, 0.5464182, 0.7882353, 1, 0, 1,
-0.8893225, -0.9901832, -2.789708, 0.7803922, 1, 0, 1,
-0.8703459, 1.376385, -0.8757962, 0.7764706, 1, 0, 1,
-0.8664031, -0.5049269, -2.378387, 0.7686275, 1, 0, 1,
-0.8648134, 0.2718987, -0.09340648, 0.7647059, 1, 0, 1,
-0.8642829, 0.2447383, -2.947097, 0.7568628, 1, 0, 1,
-0.8628508, 0.3095894, -0.8498566, 0.7529412, 1, 0, 1,
-0.8602184, 0.1887348, -0.8949928, 0.7450981, 1, 0, 1,
-0.8599588, -0.4088939, -1.838588, 0.7411765, 1, 0, 1,
-0.8545967, -0.6405801, -3.087228, 0.7333333, 1, 0, 1,
-0.8541613, -0.2003908, -1.969086, 0.7294118, 1, 0, 1,
-0.846902, 0.5553893, -1.941636, 0.7215686, 1, 0, 1,
-0.8362715, -0.2009823, -2.133785, 0.7176471, 1, 0, 1,
-0.8359213, 1.3803, -2.249289, 0.7098039, 1, 0, 1,
-0.829918, 0.03246405, -1.095935, 0.7058824, 1, 0, 1,
-0.8298827, 1.142558, -1.05639, 0.6980392, 1, 0, 1,
-0.8281022, 1.411764, -1.966254, 0.6901961, 1, 0, 1,
-0.8265206, -0.6509428, -1.313259, 0.6862745, 1, 0, 1,
-0.8243954, 1.688676, -2.051087, 0.6784314, 1, 0, 1,
-0.8175631, -0.4849412, -1.603472, 0.6745098, 1, 0, 1,
-0.8172079, -0.08699909, -1.833231, 0.6666667, 1, 0, 1,
-0.8157166, -0.3881431, -1.548913, 0.6627451, 1, 0, 1,
-0.8140425, -3.270633, -3.888142, 0.654902, 1, 0, 1,
-0.8140283, -0.470451, -1.939363, 0.6509804, 1, 0, 1,
-0.812487, 0.765083, -1.333134, 0.6431373, 1, 0, 1,
-0.805889, -0.5222554, -1.17532, 0.6392157, 1, 0, 1,
-0.805222, 0.8310221, -0.3172515, 0.6313726, 1, 0, 1,
-0.8005079, 0.05350076, -0.7096077, 0.627451, 1, 0, 1,
-0.7961478, -1.187866, -2.061156, 0.6196079, 1, 0, 1,
-0.7885266, 0.7317824, -3.883202, 0.6156863, 1, 0, 1,
-0.7860281, 0.33697, -1.611296, 0.6078432, 1, 0, 1,
-0.7855918, 0.9257927, -0.03783648, 0.6039216, 1, 0, 1,
-0.7800449, 1.660282, -0.5456198, 0.5960785, 1, 0, 1,
-0.7785359, -0.7878308, -1.405105, 0.5882353, 1, 0, 1,
-0.7781639, 1.760002, -1.197535, 0.5843138, 1, 0, 1,
-0.7772511, 0.6203319, 0.2863748, 0.5764706, 1, 0, 1,
-0.7750066, -0.8200949, -3.057869, 0.572549, 1, 0, 1,
-0.7668371, -0.423361, -2.723736, 0.5647059, 1, 0, 1,
-0.765999, -0.6028663, -3.034987, 0.5607843, 1, 0, 1,
-0.7649818, 0.7320662, 0.1571637, 0.5529412, 1, 0, 1,
-0.7593416, 0.09517894, -1.559929, 0.5490196, 1, 0, 1,
-0.7575824, -0.9749793, -3.033551, 0.5411765, 1, 0, 1,
-0.7566056, 1.14057, -1.496091, 0.5372549, 1, 0, 1,
-0.754836, 0.4074963, -0.4121162, 0.5294118, 1, 0, 1,
-0.7522789, 1.539882, -2.375288, 0.5254902, 1, 0, 1,
-0.7503729, -1.783195, -3.745453, 0.5176471, 1, 0, 1,
-0.7451923, -0.9263797, -1.630224, 0.5137255, 1, 0, 1,
-0.7436063, -0.3454572, -2.058013, 0.5058824, 1, 0, 1,
-0.7404203, 0.1262915, -1.04428, 0.5019608, 1, 0, 1,
-0.7376041, -1.279227, -2.168428, 0.4941176, 1, 0, 1,
-0.7374721, -0.5699363, -1.881936, 0.4862745, 1, 0, 1,
-0.7308578, -0.672102, -2.887488, 0.4823529, 1, 0, 1,
-0.7168452, -1.134044, -2.439978, 0.4745098, 1, 0, 1,
-0.7154933, 1.314349, -0.8483898, 0.4705882, 1, 0, 1,
-0.6962471, -0.6923961, -2.352735, 0.4627451, 1, 0, 1,
-0.6962072, 1.287688, -0.466221, 0.4588235, 1, 0, 1,
-0.6947826, -0.2941726, -1.153836, 0.4509804, 1, 0, 1,
-0.6947114, 0.9787446, -0.1775535, 0.4470588, 1, 0, 1,
-0.6938268, -0.5601649, -2.432865, 0.4392157, 1, 0, 1,
-0.6898151, -0.6955549, -2.419715, 0.4352941, 1, 0, 1,
-0.6865759, -0.1557155, -1.14691, 0.427451, 1, 0, 1,
-0.6846415, -1.500795, -4.062369, 0.4235294, 1, 0, 1,
-0.6791336, -0.3269674, -0.9110564, 0.4156863, 1, 0, 1,
-0.6781192, -0.6630965, -3.005153, 0.4117647, 1, 0, 1,
-0.6773468, 1.899852, -1.262946, 0.4039216, 1, 0, 1,
-0.6710163, -0.2191451, -3.60195, 0.3960784, 1, 0, 1,
-0.6647111, 1.789724, -0.7537915, 0.3921569, 1, 0, 1,
-0.657136, 1.725399, 0.3319697, 0.3843137, 1, 0, 1,
-0.6548331, 1.408863, -2.004978, 0.3803922, 1, 0, 1,
-0.6507608, 0.5008314, 0.7312772, 0.372549, 1, 0, 1,
-0.64934, 0.279435, -1.127095, 0.3686275, 1, 0, 1,
-0.6455356, -0.8215668, -2.009495, 0.3607843, 1, 0, 1,
-0.6421402, -2.040466, -3.903294, 0.3568628, 1, 0, 1,
-0.6404604, -0.1626974, -0.8652327, 0.3490196, 1, 0, 1,
-0.6304449, -0.6134587, -0.5595886, 0.345098, 1, 0, 1,
-0.6284295, -1.388517, -3.358803, 0.3372549, 1, 0, 1,
-0.6277815, -0.38074, -2.800184, 0.3333333, 1, 0, 1,
-0.6114578, -0.8147041, -2.936653, 0.3254902, 1, 0, 1,
-0.6071042, 1.494429, -0.7286958, 0.3215686, 1, 0, 1,
-0.6054365, 0.7122546, 0.2216706, 0.3137255, 1, 0, 1,
-0.6020078, 1.151303, -2.02174, 0.3098039, 1, 0, 1,
-0.6014541, -0.04070323, -0.9621258, 0.3019608, 1, 0, 1,
-0.6005625, -0.4448749, -1.822854, 0.2941177, 1, 0, 1,
-0.5995308, 0.1013906, -1.895482, 0.2901961, 1, 0, 1,
-0.5994735, 0.9481285, 0.7246269, 0.282353, 1, 0, 1,
-0.5941151, -1.016517, -4.739963, 0.2784314, 1, 0, 1,
-0.5940448, 0.2605778, -0.4289343, 0.2705882, 1, 0, 1,
-0.5800332, -0.2108977, -2.937266, 0.2666667, 1, 0, 1,
-0.5757836, -1.453077, -2.228813, 0.2588235, 1, 0, 1,
-0.5754403, -1.31083, -2.969991, 0.254902, 1, 0, 1,
-0.5732334, -0.7228431, -2.919511, 0.2470588, 1, 0, 1,
-0.5705416, -1.221542, -2.830635, 0.2431373, 1, 0, 1,
-0.5663977, -0.006193111, -2.961488, 0.2352941, 1, 0, 1,
-0.5654381, -0.3685087, -3.745972, 0.2313726, 1, 0, 1,
-0.5650743, 1.009545, -0.335211, 0.2235294, 1, 0, 1,
-0.5491759, -0.1079398, -1.753651, 0.2196078, 1, 0, 1,
-0.5484607, -0.6627119, -1.069095, 0.2117647, 1, 0, 1,
-0.5468922, -1.163893, -3.576133, 0.2078431, 1, 0, 1,
-0.5444059, -1.841268, -2.0837, 0.2, 1, 0, 1,
-0.5373757, 0.4450522, 0.03821614, 0.1921569, 1, 0, 1,
-0.5365297, -0.4449376, -2.327068, 0.1882353, 1, 0, 1,
-0.5334036, -1.159331, -3.435207, 0.1803922, 1, 0, 1,
-0.5255814, -0.4261183, -2.878228, 0.1764706, 1, 0, 1,
-0.5253721, -0.7339897, -2.467383, 0.1686275, 1, 0, 1,
-0.5172912, -0.002176908, -0.05651795, 0.1647059, 1, 0, 1,
-0.5133198, 0.07868226, -0.2820095, 0.1568628, 1, 0, 1,
-0.5089281, -1.042837, -4.301418, 0.1529412, 1, 0, 1,
-0.5053186, 1.321457, -1.899486, 0.145098, 1, 0, 1,
-0.5042041, -0.5701027, -2.750354, 0.1411765, 1, 0, 1,
-0.5035442, 0.1899912, -2.532425, 0.1333333, 1, 0, 1,
-0.5019743, -1.232684, -3.656297, 0.1294118, 1, 0, 1,
-0.4973784, -0.5264323, -3.342297, 0.1215686, 1, 0, 1,
-0.4960761, -0.5204874, -3.732162, 0.1176471, 1, 0, 1,
-0.4956559, 1.15596, -1.887847, 0.1098039, 1, 0, 1,
-0.4920502, 0.1468523, -0.1262703, 0.1058824, 1, 0, 1,
-0.4909629, 0.3032294, -1.378801, 0.09803922, 1, 0, 1,
-0.4901597, 0.4978766, -1.078452, 0.09019608, 1, 0, 1,
-0.4892854, -0.328631, -4.179724, 0.08627451, 1, 0, 1,
-0.4765383, 1.524651, 0.3254699, 0.07843138, 1, 0, 1,
-0.4757285, -0.381672, -2.160006, 0.07450981, 1, 0, 1,
-0.4661294, 0.9841567, 0.435504, 0.06666667, 1, 0, 1,
-0.4640402, -0.6291065, -2.273237, 0.0627451, 1, 0, 1,
-0.4609068, -0.1401878, -1.183439, 0.05490196, 1, 0, 1,
-0.4587007, 0.2084402, -0.3899523, 0.05098039, 1, 0, 1,
-0.4584817, -1.889453, -1.265527, 0.04313726, 1, 0, 1,
-0.4578971, -0.8741449, -3.175127, 0.03921569, 1, 0, 1,
-0.4576578, -0.2240116, -1.570003, 0.03137255, 1, 0, 1,
-0.4537095, -1.117433, -2.615521, 0.02745098, 1, 0, 1,
-0.4511518, 0.2277956, 0.1802443, 0.01960784, 1, 0, 1,
-0.4485763, -0.4881541, -2.774494, 0.01568628, 1, 0, 1,
-0.4427027, -0.1248876, -2.110469, 0.007843138, 1, 0, 1,
-0.4392889, -1.163171, -2.8065, 0.003921569, 1, 0, 1,
-0.4383286, 0.9249209, -0.7228438, 0, 1, 0.003921569, 1,
-0.4380356, -0.6039754, -1.393724, 0, 1, 0.01176471, 1,
-0.4321793, -1.731776, -2.347279, 0, 1, 0.01568628, 1,
-0.4291779, 0.3563896, -1.184323, 0, 1, 0.02352941, 1,
-0.4284748, -0.9089611, -1.470585, 0, 1, 0.02745098, 1,
-0.427903, 1.380957, -1.230905, 0, 1, 0.03529412, 1,
-0.4272815, 1.346888, -0.6757383, 0, 1, 0.03921569, 1,
-0.4257786, -0.7798148, -3.503713, 0, 1, 0.04705882, 1,
-0.4230738, 0.7164217, -1.193963, 0, 1, 0.05098039, 1,
-0.4206608, -0.06526026, 0.5048699, 0, 1, 0.05882353, 1,
-0.4189657, 1.184265, -0.1616659, 0, 1, 0.0627451, 1,
-0.4181246, 0.6378224, -0.007694136, 0, 1, 0.07058824, 1,
-0.4158837, 1.360018, -0.5868108, 0, 1, 0.07450981, 1,
-0.4128233, 0.2391098, -1.858675, 0, 1, 0.08235294, 1,
-0.4027982, 1.853358, 0.3782018, 0, 1, 0.08627451, 1,
-0.4001634, -0.4310153, -3.641809, 0, 1, 0.09411765, 1,
-0.3987048, 0.5110398, -0.8444126, 0, 1, 0.1019608, 1,
-0.398639, 0.1895327, -0.2891922, 0, 1, 0.1058824, 1,
-0.3916895, -0.6664072, -2.900083, 0, 1, 0.1137255, 1,
-0.3872361, -0.3859464, -2.401881, 0, 1, 0.1176471, 1,
-0.3839121, -0.07817194, -1.926967, 0, 1, 0.1254902, 1,
-0.3823295, 0.1645217, -1.548307, 0, 1, 0.1294118, 1,
-0.3779068, 1.545633, -1.016626, 0, 1, 0.1372549, 1,
-0.3750759, -0.1385239, -1.362297, 0, 1, 0.1411765, 1,
-0.3738108, 0.1811576, -1.538609, 0, 1, 0.1490196, 1,
-0.3683016, 0.2247482, -0.9987813, 0, 1, 0.1529412, 1,
-0.3665792, -0.8153493, -1.940006, 0, 1, 0.1607843, 1,
-0.3645605, 0.8536825, -0.7637717, 0, 1, 0.1647059, 1,
-0.3619336, 0.1061655, -1.893885, 0, 1, 0.172549, 1,
-0.3578371, 1.957741, -0.7633783, 0, 1, 0.1764706, 1,
-0.353367, 0.8120865, -0.1434578, 0, 1, 0.1843137, 1,
-0.3494217, -0.1182797, -2.070622, 0, 1, 0.1882353, 1,
-0.3494198, -0.2254335, -3.954623, 0, 1, 0.1960784, 1,
-0.3423262, -1.241627, -1.871087, 0, 1, 0.2039216, 1,
-0.3396408, -0.3989007, -2.586256, 0, 1, 0.2078431, 1,
-0.3395537, 0.3294367, -0.7774739, 0, 1, 0.2156863, 1,
-0.3346511, -0.6261698, -3.777496, 0, 1, 0.2196078, 1,
-0.3339659, 1.26705, -1.53433, 0, 1, 0.227451, 1,
-0.3337481, -0.4254966, -2.729471, 0, 1, 0.2313726, 1,
-0.3334582, -0.1508994, -2.389934, 0, 1, 0.2392157, 1,
-0.3304642, -0.9549909, -2.627796, 0, 1, 0.2431373, 1,
-0.3293288, 0.1762262, -2.113446, 0, 1, 0.2509804, 1,
-0.3285117, 0.8193302, -1.17344, 0, 1, 0.254902, 1,
-0.3273799, -1.033052, -1.803701, 0, 1, 0.2627451, 1,
-0.3234377, 0.4846247, -0.405744, 0, 1, 0.2666667, 1,
-0.3113573, -0.810762, -1.730271, 0, 1, 0.2745098, 1,
-0.3095942, 0.8092616, 0.2700069, 0, 1, 0.2784314, 1,
-0.3075011, 0.3455867, -0.759491, 0, 1, 0.2862745, 1,
-0.305961, -1.687127, -3.093847, 0, 1, 0.2901961, 1,
-0.3021676, -0.6606658, -3.602089, 0, 1, 0.2980392, 1,
-0.3009776, -0.144826, -2.058192, 0, 1, 0.3058824, 1,
-0.3006346, -1.3503, -3.341574, 0, 1, 0.3098039, 1,
-0.2908748, -0.2981921, -1.23548, 0, 1, 0.3176471, 1,
-0.2906573, 1.678686, -0.6955308, 0, 1, 0.3215686, 1,
-0.2883228, -1.699148, -3.928223, 0, 1, 0.3294118, 1,
-0.2808014, 0.4220184, -1.262354, 0, 1, 0.3333333, 1,
-0.2789663, -0.6295989, -2.893636, 0, 1, 0.3411765, 1,
-0.2787873, 0.495619, 0.1093379, 0, 1, 0.345098, 1,
-0.2743134, 1.195275, -0.08082325, 0, 1, 0.3529412, 1,
-0.2722581, 1.069469, 1.354549, 0, 1, 0.3568628, 1,
-0.2602673, -1.105761, -3.522743, 0, 1, 0.3647059, 1,
-0.2601964, 0.147155, -1.242389, 0, 1, 0.3686275, 1,
-0.2581242, 0.2549811, -1.295131, 0, 1, 0.3764706, 1,
-0.2563457, 0.8492608, 0.5531563, 0, 1, 0.3803922, 1,
-0.2560004, -0.1229568, -2.774555, 0, 1, 0.3882353, 1,
-0.2444156, 0.5540365, 0.2448905, 0, 1, 0.3921569, 1,
-0.2428218, 0.7133196, -0.4975619, 0, 1, 0.4, 1,
-0.2380339, -0.4081497, -4.251265, 0, 1, 0.4078431, 1,
-0.2361044, 0.9450003, -1.643473, 0, 1, 0.4117647, 1,
-0.227816, 0.22358, -1.262335, 0, 1, 0.4196078, 1,
-0.223294, -0.4357544, -1.922366, 0, 1, 0.4235294, 1,
-0.2152824, -1.920255, -4.142974, 0, 1, 0.4313726, 1,
-0.2143455, 0.6614711, -0.4246097, 0, 1, 0.4352941, 1,
-0.2138195, -0.1073818, -1.701422, 0, 1, 0.4431373, 1,
-0.2133904, -0.4706152, -2.020197, 0, 1, 0.4470588, 1,
-0.2131939, 0.5408955, 0.4191872, 0, 1, 0.454902, 1,
-0.1988555, -0.2264877, -2.369887, 0, 1, 0.4588235, 1,
-0.1978947, 0.1182425, -1.426226, 0, 1, 0.4666667, 1,
-0.1873886, 0.9637746, 0.1291671, 0, 1, 0.4705882, 1,
-0.1867279, -0.6107212, -3.864151, 0, 1, 0.4784314, 1,
-0.1864126, -0.5517558, -4.41892, 0, 1, 0.4823529, 1,
-0.1825856, -0.4221733, -2.619789, 0, 1, 0.4901961, 1,
-0.1803309, 1.042379, -1.224355, 0, 1, 0.4941176, 1,
-0.1797016, 0.008114625, 0.1381611, 0, 1, 0.5019608, 1,
-0.1759625, 0.8456081, -1.010571, 0, 1, 0.509804, 1,
-0.1729368, 0.7054451, 1.086919, 0, 1, 0.5137255, 1,
-0.1715747, 0.6176622, 0.7561358, 0, 1, 0.5215687, 1,
-0.1711652, 1.13218, -0.9221441, 0, 1, 0.5254902, 1,
-0.1695773, -0.3754361, -3.708874, 0, 1, 0.5333334, 1,
-0.165909, -1.703775, -2.778131, 0, 1, 0.5372549, 1,
-0.1579091, 0.8584102, 1.269178, 0, 1, 0.5450981, 1,
-0.1527315, 0.4779469, 0.008281493, 0, 1, 0.5490196, 1,
-0.1505464, -0.3790537, -2.409835, 0, 1, 0.5568628, 1,
-0.1468743, 1.064842, 1.29893, 0, 1, 0.5607843, 1,
-0.1455071, 1.972708, -0.4195159, 0, 1, 0.5686275, 1,
-0.1409057, -0.2634613, -5.503818, 0, 1, 0.572549, 1,
-0.1365125, 0.02205391, -0.7267015, 0, 1, 0.5803922, 1,
-0.1355135, 0.9956281, -0.6720517, 0, 1, 0.5843138, 1,
-0.133714, -0.311609, -3.784552, 0, 1, 0.5921569, 1,
-0.1336384, 0.1237641, -1.52815, 0, 1, 0.5960785, 1,
-0.1316462, 0.5859901, 1.238523, 0, 1, 0.6039216, 1,
-0.1297017, 0.8611937, 0.5804364, 0, 1, 0.6117647, 1,
-0.1278008, 0.475578, -0.617561, 0, 1, 0.6156863, 1,
-0.1216507, 1.17032, -0.571931, 0, 1, 0.6235294, 1,
-0.1195911, 0.4274672, -0.6604717, 0, 1, 0.627451, 1,
-0.1189557, -1.354398, -2.365374, 0, 1, 0.6352941, 1,
-0.1175042, 0.05830842, -1.220224, 0, 1, 0.6392157, 1,
-0.1165196, 0.1719918, -0.2992709, 0, 1, 0.6470588, 1,
-0.1163893, 0.6415972, 0.7608755, 0, 1, 0.6509804, 1,
-0.1138549, -0.116342, -3.49063, 0, 1, 0.6588235, 1,
-0.1101578, 0.1360973, -1.435126, 0, 1, 0.6627451, 1,
-0.1097503, -0.4929285, -3.148717, 0, 1, 0.6705883, 1,
-0.1062885, 1.0531, 1.576172, 0, 1, 0.6745098, 1,
-0.1062003, -0.8885692, -4.52203, 0, 1, 0.682353, 1,
-0.1055592, -1.566115, -3.90539, 0, 1, 0.6862745, 1,
-0.1055179, -0.6967391, -2.485303, 0, 1, 0.6941177, 1,
-0.1026227, -1.381856, -2.072846, 0, 1, 0.7019608, 1,
-0.1017161, -0.1208811, -2.759382, 0, 1, 0.7058824, 1,
-0.09587722, -0.778392, -4.71227, 0, 1, 0.7137255, 1,
-0.09342657, -0.09959299, -4.127792, 0, 1, 0.7176471, 1,
-0.08395267, 1.536409, -0.1534393, 0, 1, 0.7254902, 1,
-0.07659412, 1.171561, 0.3580216, 0, 1, 0.7294118, 1,
-0.07451338, 0.0741341, -0.1296183, 0, 1, 0.7372549, 1,
-0.07251538, -0.7532087, -2.65654, 0, 1, 0.7411765, 1,
-0.07202356, -0.02596632, -3.220331, 0, 1, 0.7490196, 1,
-0.07100597, 1.103994, 0.02153912, 0, 1, 0.7529412, 1,
-0.06968214, 1.748204, 2.108419, 0, 1, 0.7607843, 1,
-0.0667232, -0.2346042, -2.50153, 0, 1, 0.7647059, 1,
-0.0666156, 1.091045, -0.5142962, 0, 1, 0.772549, 1,
-0.06541898, -2.094345, -2.902454, 0, 1, 0.7764706, 1,
-0.0635729, -0.16503, -2.633683, 0, 1, 0.7843137, 1,
-0.06257529, 0.9537068, -0.2609441, 0, 1, 0.7882353, 1,
-0.06212546, -0.7397641, -4.092619, 0, 1, 0.7960784, 1,
-0.06093033, 0.6041894, 0.4111177, 0, 1, 0.8039216, 1,
-0.0556004, 1.348151, -0.7359693, 0, 1, 0.8078431, 1,
-0.05338038, -0.2291968, -3.130179, 0, 1, 0.8156863, 1,
-0.0504457, -0.6336649, -3.036329, 0, 1, 0.8196079, 1,
-0.0483272, -0.0508219, -1.445896, 0, 1, 0.827451, 1,
-0.04601793, 2.093731, 0.8408256, 0, 1, 0.8313726, 1,
-0.02970856, -1.065615, -4.079128, 0, 1, 0.8392157, 1,
-0.02168838, -0.2943569, -4.297315, 0, 1, 0.8431373, 1,
-0.02155358, 1.189035, 1.608642, 0, 1, 0.8509804, 1,
-0.02136655, -0.4722603, -2.803159, 0, 1, 0.854902, 1,
-0.0205365, 0.3453649, 1.738797, 0, 1, 0.8627451, 1,
-0.01754582, -0.8815259, -2.966433, 0, 1, 0.8666667, 1,
-0.01552517, 2.687759, 1.320683, 0, 1, 0.8745098, 1,
-0.01453515, 1.272372, -0.4799518, 0, 1, 0.8784314, 1,
-0.01012929, -0.8978531, -1.446581, 0, 1, 0.8862745, 1,
-0.003828133, 1.113346, 0.1014054, 0, 1, 0.8901961, 1,
-0.003750654, -0.5555315, -3.95279, 0, 1, 0.8980392, 1,
-0.003604178, 0.3189957, 0.2879179, 0, 1, 0.9058824, 1,
0.001405449, -0.245886, 2.375189, 0, 1, 0.9098039, 1,
0.004840889, 0.6357431, 0.2883165, 0, 1, 0.9176471, 1,
0.004888726, -1.323318, 5.187232, 0, 1, 0.9215686, 1,
0.008966892, -1.31377, 2.541107, 0, 1, 0.9294118, 1,
0.01315082, 2.468678, -1.308511, 0, 1, 0.9333333, 1,
0.02029551, 0.02264636, 0.69134, 0, 1, 0.9411765, 1,
0.02212408, 0.1157942, -0.1970479, 0, 1, 0.945098, 1,
0.02346305, 0.07836146, 0.05333279, 0, 1, 0.9529412, 1,
0.02901067, 1.051731, -1.867243, 0, 1, 0.9568627, 1,
0.0305426, -0.6631557, 2.91017, 0, 1, 0.9647059, 1,
0.03183653, -0.2677577, 1.755657, 0, 1, 0.9686275, 1,
0.03225669, -0.3560826, 4.410428, 0, 1, 0.9764706, 1,
0.0332053, -0.007933902, 1.299268, 0, 1, 0.9803922, 1,
0.03429964, -1.002265, 3.259168, 0, 1, 0.9882353, 1,
0.03800006, -0.4314296, 2.722181, 0, 1, 0.9921569, 1,
0.03927774, 0.3426573, -1.2358, 0, 1, 1, 1,
0.03945635, -0.1023599, 3.288852, 0, 0.9921569, 1, 1,
0.04015399, -0.3792215, 2.730656, 0, 0.9882353, 1, 1,
0.04025638, 0.1492209, -1.297915, 0, 0.9803922, 1, 1,
0.04338367, 0.6154704, -0.9952316, 0, 0.9764706, 1, 1,
0.04628087, 1.08453, -1.872087, 0, 0.9686275, 1, 1,
0.04726505, -0.9269356, 2.79457, 0, 0.9647059, 1, 1,
0.04811113, -0.4557279, 3.721263, 0, 0.9568627, 1, 1,
0.05179398, 0.479632, 0.2480019, 0, 0.9529412, 1, 1,
0.05605852, 1.084507, -1.615692, 0, 0.945098, 1, 1,
0.05722313, -0.1597964, 3.452949, 0, 0.9411765, 1, 1,
0.05744097, -2.137274, 3.215331, 0, 0.9333333, 1, 1,
0.0596082, 0.7779036, 1.479318, 0, 0.9294118, 1, 1,
0.06137623, 0.3199322, 1.249765, 0, 0.9215686, 1, 1,
0.06561651, 0.1535965, 0.6793321, 0, 0.9176471, 1, 1,
0.07537757, 0.1610582, 1.112009, 0, 0.9098039, 1, 1,
0.07622994, 0.8490525, -2.232001, 0, 0.9058824, 1, 1,
0.07768211, 0.09105876, -0.04198574, 0, 0.8980392, 1, 1,
0.07886169, 0.1910923, 0.8610697, 0, 0.8901961, 1, 1,
0.07986423, 0.493464, 0.7630345, 0, 0.8862745, 1, 1,
0.08543028, -1.388211, 1.338005, 0, 0.8784314, 1, 1,
0.08787148, 0.3874477, -0.5239581, 0, 0.8745098, 1, 1,
0.08954498, -0.1868327, 1.5295, 0, 0.8666667, 1, 1,
0.08962663, -0.7586503, 3.883945, 0, 0.8627451, 1, 1,
0.09131096, -0.3757608, 0.6689023, 0, 0.854902, 1, 1,
0.09410305, -1.879786, 4.545918, 0, 0.8509804, 1, 1,
0.1045156, -0.3081279, 2.980018, 0, 0.8431373, 1, 1,
0.1066397, -0.1209261, 2.033622, 0, 0.8392157, 1, 1,
0.1074412, 1.59057, 1.770145, 0, 0.8313726, 1, 1,
0.1146448, 1.938296, -0.60884, 0, 0.827451, 1, 1,
0.1187025, 1.021287, -1.190862, 0, 0.8196079, 1, 1,
0.1204525, -0.9947163, 3.692379, 0, 0.8156863, 1, 1,
0.1242246, -0.7097982, 2.330454, 0, 0.8078431, 1, 1,
0.1263062, 0.2506054, -0.05535867, 0, 0.8039216, 1, 1,
0.1287953, 0.2833625, -0.4411803, 0, 0.7960784, 1, 1,
0.1288777, 0.8510094, 0.4901672, 0, 0.7882353, 1, 1,
0.1300522, 0.5429922, -0.1881294, 0, 0.7843137, 1, 1,
0.134713, -1.252338, 3.382974, 0, 0.7764706, 1, 1,
0.1380473, -0.6138273, 2.66932, 0, 0.772549, 1, 1,
0.1381923, -0.3365454, 4.234126, 0, 0.7647059, 1, 1,
0.1475859, -0.1138558, 2.150363, 0, 0.7607843, 1, 1,
0.1485445, 0.3954919, 0.7929178, 0, 0.7529412, 1, 1,
0.1499231, 0.1254625, 2.784662, 0, 0.7490196, 1, 1,
0.1535659, 0.1772324, 0.2440504, 0, 0.7411765, 1, 1,
0.1567124, -1.020953, 3.815507, 0, 0.7372549, 1, 1,
0.1570292, 1.513978, -0.149227, 0, 0.7294118, 1, 1,
0.1570514, 1.49896, 1.725445, 0, 0.7254902, 1, 1,
0.1589204, 0.8486722, -0.3259275, 0, 0.7176471, 1, 1,
0.1606908, 1.023994, 1.902674, 0, 0.7137255, 1, 1,
0.1640175, 0.03904533, 1.91962, 0, 0.7058824, 1, 1,
0.1671786, 0.4249975, -0.5734533, 0, 0.6980392, 1, 1,
0.1681774, 0.8263617, 1.553733, 0, 0.6941177, 1, 1,
0.1747772, 2.457737, -0.271521, 0, 0.6862745, 1, 1,
0.1801244, 1.073865, 0.836611, 0, 0.682353, 1, 1,
0.183434, 1.09178, -1.125855, 0, 0.6745098, 1, 1,
0.1846963, 0.9097636, 1.475278, 0, 0.6705883, 1, 1,
0.1859475, 0.4656737, 0.5651273, 0, 0.6627451, 1, 1,
0.186248, 0.1152026, 1.313747, 0, 0.6588235, 1, 1,
0.186679, -0.6667641, 2.503591, 0, 0.6509804, 1, 1,
0.1878086, -0.9992099, 4.035623, 0, 0.6470588, 1, 1,
0.1882323, -0.2618799, 2.722482, 0, 0.6392157, 1, 1,
0.1882384, -0.3707921, 2.39676, 0, 0.6352941, 1, 1,
0.1952075, -0.5782889, 1.429627, 0, 0.627451, 1, 1,
0.1953231, -0.03907799, 1.622422, 0, 0.6235294, 1, 1,
0.1973609, 0.7564549, -0.6289745, 0, 0.6156863, 1, 1,
0.2006804, 1.900015, -1.239802, 0, 0.6117647, 1, 1,
0.2032893, 0.4395162, -0.3665193, 0, 0.6039216, 1, 1,
0.2067327, -1.584755, 3.433539, 0, 0.5960785, 1, 1,
0.2078438, -0.5151044, 2.414605, 0, 0.5921569, 1, 1,
0.2112514, -0.5158763, 2.450849, 0, 0.5843138, 1, 1,
0.2118533, -0.7674572, 3.876337, 0, 0.5803922, 1, 1,
0.212965, -0.3687392, 2.932418, 0, 0.572549, 1, 1,
0.2132653, 0.9260555, 1.148756, 0, 0.5686275, 1, 1,
0.2169553, -0.8961442, 2.977379, 0, 0.5607843, 1, 1,
0.2184308, -2.268299, 3.584529, 0, 0.5568628, 1, 1,
0.2195743, -0.6199304, 3.553785, 0, 0.5490196, 1, 1,
0.2206547, -0.09638232, 1.169489, 0, 0.5450981, 1, 1,
0.2213574, -0.4658117, 2.949038, 0, 0.5372549, 1, 1,
0.221665, 0.6928894, 1.781603, 0, 0.5333334, 1, 1,
0.2219382, -1.806054, 4.065289, 0, 0.5254902, 1, 1,
0.2275697, 0.4639143, 0.1831052, 0, 0.5215687, 1, 1,
0.2341918, -0.282186, 3.753639, 0, 0.5137255, 1, 1,
0.2368308, -0.5386044, 2.811484, 0, 0.509804, 1, 1,
0.237059, 0.4269598, 1.144266, 0, 0.5019608, 1, 1,
0.2419326, 0.05306563, 1.30447, 0, 0.4941176, 1, 1,
0.2429439, -0.5150027, 4.007051, 0, 0.4901961, 1, 1,
0.2489399, 0.5096489, 0.6253405, 0, 0.4823529, 1, 1,
0.2508865, -0.8275089, 1.804592, 0, 0.4784314, 1, 1,
0.2518939, 1.138201, 1.286271, 0, 0.4705882, 1, 1,
0.2534571, 2.214307, 0.597068, 0, 0.4666667, 1, 1,
0.2579943, 0.9347512, 0.2252179, 0, 0.4588235, 1, 1,
0.2611434, -1.082109, 2.858058, 0, 0.454902, 1, 1,
0.2611808, 0.3277975, 0.3130597, 0, 0.4470588, 1, 1,
0.2649836, -0.5859025, 2.231541, 0, 0.4431373, 1, 1,
0.2672892, 0.4197176, -0.2656627, 0, 0.4352941, 1, 1,
0.274768, 0.05551171, 1.105825, 0, 0.4313726, 1, 1,
0.2761365, -0.8182884, 2.556895, 0, 0.4235294, 1, 1,
0.2778468, 0.4680322, 1.250651, 0, 0.4196078, 1, 1,
0.2782826, -0.2667476, 3.45595, 0, 0.4117647, 1, 1,
0.279289, 0.6228563, 0.6354331, 0, 0.4078431, 1, 1,
0.281764, -1.107452, 3.441082, 0, 0.4, 1, 1,
0.2830552, 0.2155811, -0.1412703, 0, 0.3921569, 1, 1,
0.2844695, -0.4758554, 2.637446, 0, 0.3882353, 1, 1,
0.2849918, 0.1029849, 2.704024, 0, 0.3803922, 1, 1,
0.2854836, -0.6609455, 3.4541, 0, 0.3764706, 1, 1,
0.2880155, -0.3293079, 1.137826, 0, 0.3686275, 1, 1,
0.2917839, 0.9795654, 0.579389, 0, 0.3647059, 1, 1,
0.2921365, -0.6964952, 1.647558, 0, 0.3568628, 1, 1,
0.2945004, -0.5433417, 2.348205, 0, 0.3529412, 1, 1,
0.2947285, 0.9361547, -1.093109, 0, 0.345098, 1, 1,
0.2968494, 0.6608106, 0.5469725, 0, 0.3411765, 1, 1,
0.2978945, 0.6055278, 0.3499529, 0, 0.3333333, 1, 1,
0.3030627, -1.24897, 2.215184, 0, 0.3294118, 1, 1,
0.3046153, 1.134079, 0.07158415, 0, 0.3215686, 1, 1,
0.3052884, 1.502517, -1.850562, 0, 0.3176471, 1, 1,
0.3072922, 0.1922893, 1.677614, 0, 0.3098039, 1, 1,
0.3091131, -1.243985, 3.260937, 0, 0.3058824, 1, 1,
0.3103811, -1.264203, 3.132161, 0, 0.2980392, 1, 1,
0.3122808, 0.01173253, 2.448385, 0, 0.2901961, 1, 1,
0.3137366, 0.05865619, -0.5213127, 0, 0.2862745, 1, 1,
0.3145385, 0.3349582, -1.275473, 0, 0.2784314, 1, 1,
0.3161352, -0.4266235, 0.1202093, 0, 0.2745098, 1, 1,
0.3176629, -2.421528, 2.241727, 0, 0.2666667, 1, 1,
0.3193146, 0.1388101, 3.299896, 0, 0.2627451, 1, 1,
0.320691, -1.354561, 1.498475, 0, 0.254902, 1, 1,
0.3259625, 0.01390854, 0.76362, 0, 0.2509804, 1, 1,
0.3303545, -0.4860494, 3.35272, 0, 0.2431373, 1, 1,
0.3357752, 0.2258023, 0.2975549, 0, 0.2392157, 1, 1,
0.3371989, 0.4843885, 0.1584434, 0, 0.2313726, 1, 1,
0.3372784, -0.3506081, 2.109967, 0, 0.227451, 1, 1,
0.337723, -0.2999231, 1.779147, 0, 0.2196078, 1, 1,
0.3394743, 0.325561, 0.4060166, 0, 0.2156863, 1, 1,
0.3422964, -1.568722, 2.289504, 0, 0.2078431, 1, 1,
0.3436657, 0.005946307, 1.008681, 0, 0.2039216, 1, 1,
0.3519679, 1.436266, 0.680647, 0, 0.1960784, 1, 1,
0.352598, 0.8403666, -0.7027091, 0, 0.1882353, 1, 1,
0.3555007, 1.121174, -0.3663624, 0, 0.1843137, 1, 1,
0.3565628, -0.7621836, 3.856766, 0, 0.1764706, 1, 1,
0.3587999, 2.032271, -0.3828484, 0, 0.172549, 1, 1,
0.3612398, 0.7010638, 0.1305111, 0, 0.1647059, 1, 1,
0.3684578, -0.767701, 1.91399, 0, 0.1607843, 1, 1,
0.3698918, 1.483145, 0.6639298, 0, 0.1529412, 1, 1,
0.3708802, -0.7942055, 3.864568, 0, 0.1490196, 1, 1,
0.3757361, -0.09890505, 0.7316522, 0, 0.1411765, 1, 1,
0.3784192, -1.56831, 3.548394, 0, 0.1372549, 1, 1,
0.3830261, 0.09488911, 1.573194, 0, 0.1294118, 1, 1,
0.384988, -1.591676, 2.824441, 0, 0.1254902, 1, 1,
0.3850315, -1.174357, 4.091654, 0, 0.1176471, 1, 1,
0.385939, 0.6379766, 0.09290538, 0, 0.1137255, 1, 1,
0.3889963, 1.522869, 1.585869, 0, 0.1058824, 1, 1,
0.3919698, -0.5716355, 0.8763267, 0, 0.09803922, 1, 1,
0.3949737, -0.3962986, 3.716214, 0, 0.09411765, 1, 1,
0.3981552, -0.07912105, 4.232232, 0, 0.08627451, 1, 1,
0.4036951, -0.3452347, 3.320201, 0, 0.08235294, 1, 1,
0.403708, 1.256451, 0.5293388, 0, 0.07450981, 1, 1,
0.4077754, -1.596179, 3.472354, 0, 0.07058824, 1, 1,
0.4116368, -0.994716, 3.711393, 0, 0.0627451, 1, 1,
0.4190722, -2.066802, 2.381335, 0, 0.05882353, 1, 1,
0.4190731, -2.066585, 5.859091, 0, 0.05098039, 1, 1,
0.4220136, -0.4335999, 3.755214, 0, 0.04705882, 1, 1,
0.4285209, 0.8472672, 0.8604344, 0, 0.03921569, 1, 1,
0.4286661, 0.5983106, -0.5144908, 0, 0.03529412, 1, 1,
0.4311841, -0.7137712, 2.658747, 0, 0.02745098, 1, 1,
0.4413496, 0.7961639, 1.128389, 0, 0.02352941, 1, 1,
0.4499457, 0.2827633, 1.259472, 0, 0.01568628, 1, 1,
0.4536364, 1.990395, -0.2245395, 0, 0.01176471, 1, 1,
0.4556837, 1.363322, -0.05132631, 0, 0.003921569, 1, 1,
0.4581701, -0.955279, 2.267455, 0.003921569, 0, 1, 1,
0.4667131, -0.4909571, 5.073691, 0.007843138, 0, 1, 1,
0.4684151, 0.9775455, 1.692242, 0.01568628, 0, 1, 1,
0.4686661, 0.5861446, 1.62158, 0.01960784, 0, 1, 1,
0.4717672, 0.6934123, 1.036503, 0.02745098, 0, 1, 1,
0.4744259, -0.2211416, 0.6747914, 0.03137255, 0, 1, 1,
0.4752938, 0.9971588, -0.6420977, 0.03921569, 0, 1, 1,
0.4753098, -1.387392, 1.281151, 0.04313726, 0, 1, 1,
0.4775417, -0.2413211, 1.462372, 0.05098039, 0, 1, 1,
0.4784179, -0.2398166, 1.973266, 0.05490196, 0, 1, 1,
0.4812297, 1.332685, 0.1509798, 0.0627451, 0, 1, 1,
0.4837813, -1.277209, 4.231717, 0.06666667, 0, 1, 1,
0.4842899, -0.6142704, 1.479484, 0.07450981, 0, 1, 1,
0.4848734, 0.9915, -0.1675366, 0.07843138, 0, 1, 1,
0.4885334, -0.1778187, 3.048833, 0.08627451, 0, 1, 1,
0.4912904, -0.4541633, 1.80264, 0.09019608, 0, 1, 1,
0.4983516, 1.184757, 0.8519206, 0.09803922, 0, 1, 1,
0.502162, -0.277918, 1.628413, 0.1058824, 0, 1, 1,
0.5055287, 0.471651, 0.06717477, 0.1098039, 0, 1, 1,
0.5204789, -0.9497803, 1.944763, 0.1176471, 0, 1, 1,
0.5224941, 0.2819446, 0.636656, 0.1215686, 0, 1, 1,
0.522847, 2.492849, 1.915101, 0.1294118, 0, 1, 1,
0.5273824, -0.3436717, 1.470902, 0.1333333, 0, 1, 1,
0.5386781, -1.648038, 4.783152, 0.1411765, 0, 1, 1,
0.5428779, 0.9858249, -0.1833178, 0.145098, 0, 1, 1,
0.5459711, 0.1632313, -0.5188178, 0.1529412, 0, 1, 1,
0.5516094, 0.9435175, 1.394004, 0.1568628, 0, 1, 1,
0.5543153, -1.023981, 3.37792, 0.1647059, 0, 1, 1,
0.5621408, 0.06220676, 1.576116, 0.1686275, 0, 1, 1,
0.565585, -1.844605, 2.326575, 0.1764706, 0, 1, 1,
0.5659003, 0.6279698, 0.7010506, 0.1803922, 0, 1, 1,
0.571974, -1.347523, 3.800906, 0.1882353, 0, 1, 1,
0.5738517, 0.16394, 1.11728, 0.1921569, 0, 1, 1,
0.5749543, -0.08783446, 0.9335199, 0.2, 0, 1, 1,
0.5758057, -0.1350437, 1.250373, 0.2078431, 0, 1, 1,
0.5761582, 2.353441, 0.07525603, 0.2117647, 0, 1, 1,
0.579142, 0.6151336, 1.139919, 0.2196078, 0, 1, 1,
0.5796345, 1.256677, 0.9732288, 0.2235294, 0, 1, 1,
0.5862052, -1.04104, 2.347597, 0.2313726, 0, 1, 1,
0.5907506, 0.8102164, -0.1112716, 0.2352941, 0, 1, 1,
0.5920042, -0.02113924, 1.40945, 0.2431373, 0, 1, 1,
0.5931956, -0.7605649, 3.679842, 0.2470588, 0, 1, 1,
0.5954064, 0.2471602, 0.592905, 0.254902, 0, 1, 1,
0.5982194, 0.365108, 0.9913883, 0.2588235, 0, 1, 1,
0.5985216, 0.8612527, 0.7530163, 0.2666667, 0, 1, 1,
0.6033044, -0.6838076, 2.748236, 0.2705882, 0, 1, 1,
0.6056673, 0.5022147, 0.9811723, 0.2784314, 0, 1, 1,
0.6095517, 0.8697674, 1.675263, 0.282353, 0, 1, 1,
0.6134401, 1.113892, 0.4156013, 0.2901961, 0, 1, 1,
0.6158, 0.5764565, 2.504628, 0.2941177, 0, 1, 1,
0.6175876, 1.950347, 0.2592765, 0.3019608, 0, 1, 1,
0.6188844, 0.8936759, 1.089737, 0.3098039, 0, 1, 1,
0.6190997, 0.4897543, 0.5676491, 0.3137255, 0, 1, 1,
0.6194396, 2.343661, 1.214134, 0.3215686, 0, 1, 1,
0.6312938, -1.626018, 2.625496, 0.3254902, 0, 1, 1,
0.6321585, 1.089501, 1.048783, 0.3333333, 0, 1, 1,
0.6333691, 0.2930771, 2.369835, 0.3372549, 0, 1, 1,
0.635199, 2.238648, 0.6096978, 0.345098, 0, 1, 1,
0.636632, 1.105126, 0.6260575, 0.3490196, 0, 1, 1,
0.6373082, 1.409211, -0.05747033, 0.3568628, 0, 1, 1,
0.6373827, -0.6404318, 3.003998, 0.3607843, 0, 1, 1,
0.6427976, 1.111636, -0.7156245, 0.3686275, 0, 1, 1,
0.6437017, 1.296333, -0.04961376, 0.372549, 0, 1, 1,
0.6488028, -0.1133771, 0.8784022, 0.3803922, 0, 1, 1,
0.6493211, 1.816304, 2.361156, 0.3843137, 0, 1, 1,
0.650422, -1.216917, 2.055386, 0.3921569, 0, 1, 1,
0.6525632, 0.735872, 0.1351982, 0.3960784, 0, 1, 1,
0.6526936, 0.7373412, 0.1419642, 0.4039216, 0, 1, 1,
0.6534977, 1.935328, 0.5660118, 0.4117647, 0, 1, 1,
0.6635042, -0.1354211, 1.698922, 0.4156863, 0, 1, 1,
0.663617, -1.050643, 2.479733, 0.4235294, 0, 1, 1,
0.6636382, 2.039532, 0.758998, 0.427451, 0, 1, 1,
0.6661988, -1.625876, 2.290376, 0.4352941, 0, 1, 1,
0.6737536, -1.806441, 4.195771, 0.4392157, 0, 1, 1,
0.6767197, 0.3781804, 2.944817, 0.4470588, 0, 1, 1,
0.6847845, 0.1524853, 0.5266936, 0.4509804, 0, 1, 1,
0.6906949, 2.356092, 0.5407559, 0.4588235, 0, 1, 1,
0.6910535, 0.2228481, 2.082457, 0.4627451, 0, 1, 1,
0.6952896, -1.432271, 2.407954, 0.4705882, 0, 1, 1,
0.7006491, 0.2489653, 1.845466, 0.4745098, 0, 1, 1,
0.7019673, -1.308636, 2.932688, 0.4823529, 0, 1, 1,
0.7029261, -0.3576809, 1.718203, 0.4862745, 0, 1, 1,
0.7082224, 0.7559574, 0.1018039, 0.4941176, 0, 1, 1,
0.7101938, 0.4777103, 1.267328, 0.5019608, 0, 1, 1,
0.7114833, -1.433108, 2.381429, 0.5058824, 0, 1, 1,
0.7122905, -2.162874, 2.768385, 0.5137255, 0, 1, 1,
0.7137749, 0.4064258, -0.4030685, 0.5176471, 0, 1, 1,
0.7232701, 0.7617065, -0.08695658, 0.5254902, 0, 1, 1,
0.7250342, 0.4253051, 1.001383, 0.5294118, 0, 1, 1,
0.7252052, 0.4584451, 2.026528, 0.5372549, 0, 1, 1,
0.7255679, -0.1765979, 1.656096, 0.5411765, 0, 1, 1,
0.7260985, -0.02659828, 1.480017, 0.5490196, 0, 1, 1,
0.7264406, 0.1906351, 2.526099, 0.5529412, 0, 1, 1,
0.7297144, 1.361609, 0.4732962, 0.5607843, 0, 1, 1,
0.7336727, 1.549307, -0.8572727, 0.5647059, 0, 1, 1,
0.737974, 2.152639, 0.6148292, 0.572549, 0, 1, 1,
0.7435594, -0.5777878, 1.499517, 0.5764706, 0, 1, 1,
0.7455473, 0.324541, 2.046236, 0.5843138, 0, 1, 1,
0.7455882, 0.2673199, 1.598139, 0.5882353, 0, 1, 1,
0.7490363, 0.9497802, 0.1359765, 0.5960785, 0, 1, 1,
0.7492065, 0.0042063, 2.102421, 0.6039216, 0, 1, 1,
0.7568741, -0.1888709, 1.82495, 0.6078432, 0, 1, 1,
0.7598296, 0.5076396, 1.502047, 0.6156863, 0, 1, 1,
0.7645496, -0.05850679, 3.145861, 0.6196079, 0, 1, 1,
0.7663876, -1.942633, 2.849453, 0.627451, 0, 1, 1,
0.7679627, 0.3338853, 0.6740193, 0.6313726, 0, 1, 1,
0.7679685, -0.6945583, 2.856843, 0.6392157, 0, 1, 1,
0.7772607, 0.1559774, 2.833318, 0.6431373, 0, 1, 1,
0.7798619, -0.899644, 2.433356, 0.6509804, 0, 1, 1,
0.780577, 2.004372, -0.152212, 0.654902, 0, 1, 1,
0.7975292, -0.7191033, 2.864292, 0.6627451, 0, 1, 1,
0.8043607, -1.749316, 5.732162, 0.6666667, 0, 1, 1,
0.8100817, -0.02727714, 0.7496162, 0.6745098, 0, 1, 1,
0.8202344, -0.9206905, 1.393918, 0.6784314, 0, 1, 1,
0.8209372, 0.0149516, 1.600214, 0.6862745, 0, 1, 1,
0.8263267, 0.1130352, 1.178424, 0.6901961, 0, 1, 1,
0.8292341, -0.2705716, 1.619236, 0.6980392, 0, 1, 1,
0.8300443, 0.05825767, -0.1708023, 0.7058824, 0, 1, 1,
0.8396451, -0.7301748, 1.45285, 0.7098039, 0, 1, 1,
0.8406373, -0.06042904, 3.625971, 0.7176471, 0, 1, 1,
0.8410134, -0.353459, 2.931444, 0.7215686, 0, 1, 1,
0.842952, 0.1452642, 1.2742, 0.7294118, 0, 1, 1,
0.846249, -0.06456459, 2.23025, 0.7333333, 0, 1, 1,
0.8521068, -1.326737, 3.115307, 0.7411765, 0, 1, 1,
0.8551871, -1.046396, 0.2557368, 0.7450981, 0, 1, 1,
0.8567627, -0.5844389, 1.558416, 0.7529412, 0, 1, 1,
0.8596216, 0.6998444, 0.7365685, 0.7568628, 0, 1, 1,
0.8609271, 0.6120088, -0.303667, 0.7647059, 0, 1, 1,
0.8618463, 0.8228601, 0.2470793, 0.7686275, 0, 1, 1,
0.8623659, 0.3842553, -0.188971, 0.7764706, 0, 1, 1,
0.8633955, 0.8347244, 2.09987, 0.7803922, 0, 1, 1,
0.8672467, 1.581968, 0.5370404, 0.7882353, 0, 1, 1,
0.8732849, 0.522615, 1.926084, 0.7921569, 0, 1, 1,
0.8742679, 0.8757318, 0.7391988, 0.8, 0, 1, 1,
0.876741, -0.7702782, 4.205365, 0.8078431, 0, 1, 1,
0.8778552, 0.5082251, 0.2777863, 0.8117647, 0, 1, 1,
0.8805249, -1.309662, 3.268664, 0.8196079, 0, 1, 1,
0.8864998, 0.3289054, 1.22215, 0.8235294, 0, 1, 1,
0.8870023, -0.1039966, 2.819517, 0.8313726, 0, 1, 1,
0.8903005, -1.280178, 2.587298, 0.8352941, 0, 1, 1,
0.8905803, 0.2603682, 0.5529891, 0.8431373, 0, 1, 1,
0.8952442, -1.905077, 2.192506, 0.8470588, 0, 1, 1,
0.8963546, 1.835693, 0.9970687, 0.854902, 0, 1, 1,
0.9257063, -1.404652, 2.270766, 0.8588235, 0, 1, 1,
0.9264823, 1.460895, -0.0529202, 0.8666667, 0, 1, 1,
0.9311694, 0.7482589, -0.1117222, 0.8705882, 0, 1, 1,
0.9348689, -0.6261781, 2.97949, 0.8784314, 0, 1, 1,
0.935318, -0.06800342, 3.390492, 0.8823529, 0, 1, 1,
0.9366993, -1.280045, 0.781712, 0.8901961, 0, 1, 1,
0.9370069, -2.011567, 1.258845, 0.8941177, 0, 1, 1,
0.9395906, 0.6978024, 1.721955, 0.9019608, 0, 1, 1,
0.9430659, 0.1009053, 1.114001, 0.9098039, 0, 1, 1,
0.9479404, -0.6267995, 0.5832382, 0.9137255, 0, 1, 1,
0.9514256, 2.577848, 1.465511, 0.9215686, 0, 1, 1,
0.9573847, -0.6611078, 3.062539, 0.9254902, 0, 1, 1,
0.9731203, -0.1244928, 2.3937, 0.9333333, 0, 1, 1,
0.9751561, 0.8444808, 1.642066, 0.9372549, 0, 1, 1,
0.9782564, 0.4389471, 0.9632646, 0.945098, 0, 1, 1,
0.9784113, 0.4385183, 2.165159, 0.9490196, 0, 1, 1,
0.9809272, -0.07315296, 2.538737, 0.9568627, 0, 1, 1,
0.9869656, 0.634392, -0.2382051, 0.9607843, 0, 1, 1,
0.9900181, 0.07835326, 2.173204, 0.9686275, 0, 1, 1,
0.9943132, 0.1987965, -0.02916899, 0.972549, 0, 1, 1,
1.005329, 1.768255, -0.6509664, 0.9803922, 0, 1, 1,
1.009196, 0.2904772, 2.061299, 0.9843137, 0, 1, 1,
1.011095, -1.14705, 1.404874, 0.9921569, 0, 1, 1,
1.011437, 0.3636759, 1.730071, 0.9960784, 0, 1, 1,
1.012234, 1.17471, 0.9458836, 1, 0, 0.9960784, 1,
1.01898, -0.1069655, 0.6778272, 1, 0, 0.9882353, 1,
1.020539, -0.1133914, 2.853744, 1, 0, 0.9843137, 1,
1.023054, -0.9902189, 2.447708, 1, 0, 0.9764706, 1,
1.025104, -0.5043395, 0.06546754, 1, 0, 0.972549, 1,
1.029702, 0.5152289, 2.507186, 1, 0, 0.9647059, 1,
1.035807, -0.02309323, -0.3165858, 1, 0, 0.9607843, 1,
1.040538, -0.4077558, 0.1634066, 1, 0, 0.9529412, 1,
1.040828, -0.4499415, 0.5360404, 1, 0, 0.9490196, 1,
1.044946, 2.156087, 1.102185, 1, 0, 0.9411765, 1,
1.046842, -0.5699267, 3.607434, 1, 0, 0.9372549, 1,
1.054986, -0.4113567, 1.515774, 1, 0, 0.9294118, 1,
1.057347, 0.8223132, 2.045503, 1, 0, 0.9254902, 1,
1.06295, -1.289331, 2.052595, 1, 0, 0.9176471, 1,
1.065403, -0.1329603, 1.068621, 1, 0, 0.9137255, 1,
1.066342, 1.38975, 1.632026, 1, 0, 0.9058824, 1,
1.070955, 0.5545927, 2.500254, 1, 0, 0.9019608, 1,
1.076833, -0.7126332, 2.275897, 1, 0, 0.8941177, 1,
1.077955, 0.4800841, 1.391945, 1, 0, 0.8862745, 1,
1.08266, -0.3597935, 2.057157, 1, 0, 0.8823529, 1,
1.102888, 0.08143128, 1.267208, 1, 0, 0.8745098, 1,
1.105471, 0.3792802, 1.664153, 1, 0, 0.8705882, 1,
1.108202, -0.2765131, 1.712468, 1, 0, 0.8627451, 1,
1.108322, -0.5964448, 2.357408, 1, 0, 0.8588235, 1,
1.108458, -1.480933, 1.325447, 1, 0, 0.8509804, 1,
1.115006, 0.2816255, 0.6187398, 1, 0, 0.8470588, 1,
1.122055, -0.9205686, 2.980122, 1, 0, 0.8392157, 1,
1.124416, 0.9438074, -0.1921259, 1, 0, 0.8352941, 1,
1.12669, 0.6150674, 1.287678, 1, 0, 0.827451, 1,
1.128655, 0.008201422, 1.99718, 1, 0, 0.8235294, 1,
1.131887, 1.284552, 0.459153, 1, 0, 0.8156863, 1,
1.137152, -0.5843835, 2.27719, 1, 0, 0.8117647, 1,
1.139069, -0.05235315, 1.978133, 1, 0, 0.8039216, 1,
1.141154, 0.663917, 1.037544, 1, 0, 0.7960784, 1,
1.147015, -1.03542, 2.540432, 1, 0, 0.7921569, 1,
1.153647, 0.4955881, 1.070418, 1, 0, 0.7843137, 1,
1.155134, -0.9920726, 0.1329082, 1, 0, 0.7803922, 1,
1.164733, 0.06077459, 3.008794, 1, 0, 0.772549, 1,
1.166013, 1.283536, -0.2333606, 1, 0, 0.7686275, 1,
1.170261, -0.878872, 3.858812, 1, 0, 0.7607843, 1,
1.170743, -0.260001, 0.8105068, 1, 0, 0.7568628, 1,
1.175119, -0.1163827, 1.066166, 1, 0, 0.7490196, 1,
1.175172, 0.05262168, 2.531799, 1, 0, 0.7450981, 1,
1.178095, 1.686347, 1.225636, 1, 0, 0.7372549, 1,
1.18456, -0.3868591, 2.755759, 1, 0, 0.7333333, 1,
1.188303, 0.335394, 1.134366, 1, 0, 0.7254902, 1,
1.192992, 0.2759105, 2.578497, 1, 0, 0.7215686, 1,
1.200057, 0.2832107, 1.812146, 1, 0, 0.7137255, 1,
1.226623, 1.948256, 1.632077, 1, 0, 0.7098039, 1,
1.228269, -2.06319, 2.991383, 1, 0, 0.7019608, 1,
1.238513, -1.572772, 1.663098, 1, 0, 0.6941177, 1,
1.241971, 1.447705, 1.371185, 1, 0, 0.6901961, 1,
1.243909, -1.342422, 1.989057, 1, 0, 0.682353, 1,
1.246981, 1.610409, 2.50228, 1, 0, 0.6784314, 1,
1.246993, 0.3938931, 0.3957613, 1, 0, 0.6705883, 1,
1.248506, -0.05240481, 2.051253, 1, 0, 0.6666667, 1,
1.249177, 0.08501721, 0.9268315, 1, 0, 0.6588235, 1,
1.250647, 0.4914477, -0.09948912, 1, 0, 0.654902, 1,
1.257994, 0.1686413, 1.252841, 1, 0, 0.6470588, 1,
1.265042, 2.604763, -0.001394883, 1, 0, 0.6431373, 1,
1.273711, -1.013014, 1.660346, 1, 0, 0.6352941, 1,
1.275701, 1.339223, 0.1747387, 1, 0, 0.6313726, 1,
1.275706, 1.061276, 1.400592, 1, 0, 0.6235294, 1,
1.276212, 0.5719616, 2.921101, 1, 0, 0.6196079, 1,
1.281128, -0.1454294, 1.671062, 1, 0, 0.6117647, 1,
1.284021, 0.9509563, 0.3620661, 1, 0, 0.6078432, 1,
1.286305, 0.07310937, 2.165928, 1, 0, 0.6, 1,
1.286874, 0.7779099, 0.9495733, 1, 0, 0.5921569, 1,
1.293221, -0.5439058, 2.300783, 1, 0, 0.5882353, 1,
1.293312, -0.2708057, 2.203698, 1, 0, 0.5803922, 1,
1.297033, 0.8847637, 1.29276, 1, 0, 0.5764706, 1,
1.298025, 0.2864846, 1.038748, 1, 0, 0.5686275, 1,
1.30299, 0.7358302, 0.6076964, 1, 0, 0.5647059, 1,
1.30637, -1.878127, 3.580851, 1, 0, 0.5568628, 1,
1.329599, 0.335343, 1.02112, 1, 0, 0.5529412, 1,
1.335125, 0.9729021, 2.523651, 1, 0, 0.5450981, 1,
1.339363, -0.7951552, 2.107325, 1, 0, 0.5411765, 1,
1.353488, -1.408362, 3.184455, 1, 0, 0.5333334, 1,
1.38285, 2.503584, 0.4627273, 1, 0, 0.5294118, 1,
1.399789, -0.6445342, 1.594854, 1, 0, 0.5215687, 1,
1.399804, -0.5879621, 2.858357, 1, 0, 0.5176471, 1,
1.404251, 0.008670464, 1.783564, 1, 0, 0.509804, 1,
1.415132, -1.717626, 1.545163, 1, 0, 0.5058824, 1,
1.415152, 0.5316766, -1.115242, 1, 0, 0.4980392, 1,
1.429537, 0.144311, 0.9821849, 1, 0, 0.4901961, 1,
1.438075, -1.29933, 1.406848, 1, 0, 0.4862745, 1,
1.438301, 0.7274385, 1.373608, 1, 0, 0.4784314, 1,
1.439217, -0.2962454, 2.871, 1, 0, 0.4745098, 1,
1.448396, -0.4095575, 1.14792, 1, 0, 0.4666667, 1,
1.44844, 0.508512, 1.897358, 1, 0, 0.4627451, 1,
1.452619, 0.3032053, 2.367539, 1, 0, 0.454902, 1,
1.460165, -0.4544418, 2.336322, 1, 0, 0.4509804, 1,
1.463962, 0.3541897, 1.120653, 1, 0, 0.4431373, 1,
1.478591, 1.075314, 2.445244, 1, 0, 0.4392157, 1,
1.483099, 1.10392, 1.971968, 1, 0, 0.4313726, 1,
1.48993, 0.3744916, 1.930324, 1, 0, 0.427451, 1,
1.49631, -0.2050151, 1.972243, 1, 0, 0.4196078, 1,
1.496886, 2.525846, 3.470145, 1, 0, 0.4156863, 1,
1.498248, -0.6026422, 3.77685, 1, 0, 0.4078431, 1,
1.49954, 1.233945, 1.738918, 1, 0, 0.4039216, 1,
1.508877, -2.11618, 2.476007, 1, 0, 0.3960784, 1,
1.509818, 1.300719, 2.489586, 1, 0, 0.3882353, 1,
1.511013, 0.4168388, 2.754596, 1, 0, 0.3843137, 1,
1.511393, 1.899065, -0.536535, 1, 0, 0.3764706, 1,
1.513651, -0.3036565, 2.724184, 1, 0, 0.372549, 1,
1.533705, 0.1286007, 0.2010319, 1, 0, 0.3647059, 1,
1.537056, -0.2144362, 0.3090763, 1, 0, 0.3607843, 1,
1.546076, -0.1126255, 3.421342, 1, 0, 0.3529412, 1,
1.552511, 0.3301422, 3.656025, 1, 0, 0.3490196, 1,
1.553103, 0.2473742, 1.599677, 1, 0, 0.3411765, 1,
1.557125, -0.5482624, 4.077796, 1, 0, 0.3372549, 1,
1.560979, -1.324633, 3.445007, 1, 0, 0.3294118, 1,
1.568553, -0.1969598, 1.528722, 1, 0, 0.3254902, 1,
1.597491, -0.6668239, 2.924138, 1, 0, 0.3176471, 1,
1.601938, -0.1991918, 1.026269, 1, 0, 0.3137255, 1,
1.608867, -1.297461, 2.881241, 1, 0, 0.3058824, 1,
1.623182, 0.3528065, 1.126224, 1, 0, 0.2980392, 1,
1.643953, -0.1345322, 1.811776, 1, 0, 0.2941177, 1,
1.668345, 0.1298086, 1.373609, 1, 0, 0.2862745, 1,
1.67241, 0.02537757, 3.161221, 1, 0, 0.282353, 1,
1.682421, 2.572037, 1.895247, 1, 0, 0.2745098, 1,
1.684597, 1.383899, 1.146737, 1, 0, 0.2705882, 1,
1.685467, 1.391413, 1.70527, 1, 0, 0.2627451, 1,
1.690683, 0.9387123, 2.113466, 1, 0, 0.2588235, 1,
1.693556, -0.1861556, 1.590703, 1, 0, 0.2509804, 1,
1.702646, -0.5611433, 2.948989, 1, 0, 0.2470588, 1,
1.720678, -0.2303911, 0.9256061, 1, 0, 0.2392157, 1,
1.742689, -1.578182, 3.397328, 1, 0, 0.2352941, 1,
1.755975, -0.1882423, 0.01878036, 1, 0, 0.227451, 1,
1.765166, 2.113538, 0.310894, 1, 0, 0.2235294, 1,
1.766498, -0.639657, 2.163772, 1, 0, 0.2156863, 1,
1.769623, -0.5551495, 2.011167, 1, 0, 0.2117647, 1,
1.771301, 0.5098224, 1.598937, 1, 0, 0.2039216, 1,
1.78456, -0.03505629, 2.567622, 1, 0, 0.1960784, 1,
1.836254, 0.1283615, 0.9607754, 1, 0, 0.1921569, 1,
1.841582, 0.001675972, 2.852431, 1, 0, 0.1843137, 1,
1.876649, 0.6173187, 2.912493, 1, 0, 0.1803922, 1,
1.876933, 0.1492814, 1.102944, 1, 0, 0.172549, 1,
1.890065, 0.9383191, 0.9390696, 1, 0, 0.1686275, 1,
1.905347, -0.4555798, 3.39045, 1, 0, 0.1607843, 1,
1.925109, 1.722206, 0.5432895, 1, 0, 0.1568628, 1,
1.93481, 0.6619759, 0.9893644, 1, 0, 0.1490196, 1,
1.940841, 0.9287924, 2.401363, 1, 0, 0.145098, 1,
1.9477, 0.03872695, 2.772084, 1, 0, 0.1372549, 1,
1.95205, -0.4418754, 0.3278181, 1, 0, 0.1333333, 1,
1.995089, -1.249971, 2.081464, 1, 0, 0.1254902, 1,
2.008307, 1.567295, 0.6870663, 1, 0, 0.1215686, 1,
2.018891, -0.8930396, 3.718816, 1, 0, 0.1137255, 1,
2.028097, 0.8885475, 1.536298, 1, 0, 0.1098039, 1,
2.04384, 0.06935316, 2.252562, 1, 0, 0.1019608, 1,
2.141116, -0.2253647, 1.441893, 1, 0, 0.09411765, 1,
2.169557, -1.47463, 1.48949, 1, 0, 0.09019608, 1,
2.221018, -0.4336567, -0.01001993, 1, 0, 0.08235294, 1,
2.240262, 0.9147683, 1.365296, 1, 0, 0.07843138, 1,
2.266139, 0.1826721, 2.0044, 1, 0, 0.07058824, 1,
2.313188, -0.05206887, 0.6920094, 1, 0, 0.06666667, 1,
2.31495, -0.8167117, 2.926259, 1, 0, 0.05882353, 1,
2.328959, 0.9675509, 1.31428, 1, 0, 0.05490196, 1,
2.444292, -0.07985551, 0.9990374, 1, 0, 0.04705882, 1,
2.460899, -1.62208, 2.011426, 1, 0, 0.04313726, 1,
2.465879, 0.4631248, 1.498501, 1, 0, 0.03529412, 1,
2.486377, -0.1091286, -0.3795996, 1, 0, 0.03137255, 1,
2.600585, -1.029823, 2.288029, 1, 0, 0.02352941, 1,
2.722235, -0.0002224283, 4.275457, 1, 0, 0.01960784, 1,
2.817378, -0.9942997, 0.3709396, 1, 0, 0.01176471, 1,
3.376361, -0.03422394, 1.739588, 1, 0, 0.007843138, 1
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
0.2632965, -4.28058, -7.429831, 0, -0.5, 0.5, 0.5,
0.2632965, -4.28058, -7.429831, 1, -0.5, 0.5, 0.5,
0.2632965, -4.28058, -7.429831, 1, 1.5, 0.5, 0.5,
0.2632965, -4.28058, -7.429831, 0, 1.5, 0.5, 0.5
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
-3.905097, -0.2914367, -7.429831, 0, -0.5, 0.5, 0.5,
-3.905097, -0.2914367, -7.429831, 1, -0.5, 0.5, 0.5,
-3.905097, -0.2914367, -7.429831, 1, 1.5, 0.5, 0.5,
-3.905097, -0.2914367, -7.429831, 0, 1.5, 0.5, 0.5
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
-3.905097, -4.28058, 0.1776366, 0, -0.5, 0.5, 0.5,
-3.905097, -4.28058, 0.1776366, 1, -0.5, 0.5, 0.5,
-3.905097, -4.28058, 0.1776366, 1, 1.5, 0.5, 0.5,
-3.905097, -4.28058, 0.1776366, 0, 1.5, 0.5, 0.5
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
-2, -3.360009, -5.674261,
3, -3.360009, -5.674261,
-2, -3.360009, -5.674261,
-2, -3.513437, -5.966856,
-1, -3.360009, -5.674261,
-1, -3.513437, -5.966856,
0, -3.360009, -5.674261,
0, -3.513437, -5.966856,
1, -3.360009, -5.674261,
1, -3.513437, -5.966856,
2, -3.360009, -5.674261,
2, -3.513437, -5.966856,
3, -3.360009, -5.674261,
3, -3.513437, -5.966856
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
-2, -3.820294, -6.552046, 0, -0.5, 0.5, 0.5,
-2, -3.820294, -6.552046, 1, -0.5, 0.5, 0.5,
-2, -3.820294, -6.552046, 1, 1.5, 0.5, 0.5,
-2, -3.820294, -6.552046, 0, 1.5, 0.5, 0.5,
-1, -3.820294, -6.552046, 0, -0.5, 0.5, 0.5,
-1, -3.820294, -6.552046, 1, -0.5, 0.5, 0.5,
-1, -3.820294, -6.552046, 1, 1.5, 0.5, 0.5,
-1, -3.820294, -6.552046, 0, 1.5, 0.5, 0.5,
0, -3.820294, -6.552046, 0, -0.5, 0.5, 0.5,
0, -3.820294, -6.552046, 1, -0.5, 0.5, 0.5,
0, -3.820294, -6.552046, 1, 1.5, 0.5, 0.5,
0, -3.820294, -6.552046, 0, 1.5, 0.5, 0.5,
1, -3.820294, -6.552046, 0, -0.5, 0.5, 0.5,
1, -3.820294, -6.552046, 1, -0.5, 0.5, 0.5,
1, -3.820294, -6.552046, 1, 1.5, 0.5, 0.5,
1, -3.820294, -6.552046, 0, 1.5, 0.5, 0.5,
2, -3.820294, -6.552046, 0, -0.5, 0.5, 0.5,
2, -3.820294, -6.552046, 1, -0.5, 0.5, 0.5,
2, -3.820294, -6.552046, 1, 1.5, 0.5, 0.5,
2, -3.820294, -6.552046, 0, 1.5, 0.5, 0.5,
3, -3.820294, -6.552046, 0, -0.5, 0.5, 0.5,
3, -3.820294, -6.552046, 1, -0.5, 0.5, 0.5,
3, -3.820294, -6.552046, 1, 1.5, 0.5, 0.5,
3, -3.820294, -6.552046, 0, 1.5, 0.5, 0.5
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
-2.94316, -3, -5.674261,
-2.94316, 2, -5.674261,
-2.94316, -3, -5.674261,
-3.103483, -3, -5.966856,
-2.94316, -2, -5.674261,
-3.103483, -2, -5.966856,
-2.94316, -1, -5.674261,
-3.103483, -1, -5.966856,
-2.94316, 0, -5.674261,
-3.103483, 0, -5.966856,
-2.94316, 1, -5.674261,
-3.103483, 1, -5.966856,
-2.94316, 2, -5.674261,
-3.103483, 2, -5.966856
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
-3.424129, -3, -6.552046, 0, -0.5, 0.5, 0.5,
-3.424129, -3, -6.552046, 1, -0.5, 0.5, 0.5,
-3.424129, -3, -6.552046, 1, 1.5, 0.5, 0.5,
-3.424129, -3, -6.552046, 0, 1.5, 0.5, 0.5,
-3.424129, -2, -6.552046, 0, -0.5, 0.5, 0.5,
-3.424129, -2, -6.552046, 1, -0.5, 0.5, 0.5,
-3.424129, -2, -6.552046, 1, 1.5, 0.5, 0.5,
-3.424129, -2, -6.552046, 0, 1.5, 0.5, 0.5,
-3.424129, -1, -6.552046, 0, -0.5, 0.5, 0.5,
-3.424129, -1, -6.552046, 1, -0.5, 0.5, 0.5,
-3.424129, -1, -6.552046, 1, 1.5, 0.5, 0.5,
-3.424129, -1, -6.552046, 0, 1.5, 0.5, 0.5,
-3.424129, 0, -6.552046, 0, -0.5, 0.5, 0.5,
-3.424129, 0, -6.552046, 1, -0.5, 0.5, 0.5,
-3.424129, 0, -6.552046, 1, 1.5, 0.5, 0.5,
-3.424129, 0, -6.552046, 0, 1.5, 0.5, 0.5,
-3.424129, 1, -6.552046, 0, -0.5, 0.5, 0.5,
-3.424129, 1, -6.552046, 1, -0.5, 0.5, 0.5,
-3.424129, 1, -6.552046, 1, 1.5, 0.5, 0.5,
-3.424129, 1, -6.552046, 0, 1.5, 0.5, 0.5,
-3.424129, 2, -6.552046, 0, -0.5, 0.5, 0.5,
-3.424129, 2, -6.552046, 1, -0.5, 0.5, 0.5,
-3.424129, 2, -6.552046, 1, 1.5, 0.5, 0.5,
-3.424129, 2, -6.552046, 0, 1.5, 0.5, 0.5
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
-2.94316, -3.360009, -4,
-2.94316, -3.360009, 4,
-2.94316, -3.360009, -4,
-3.103483, -3.513437, -4,
-2.94316, -3.360009, -2,
-3.103483, -3.513437, -2,
-2.94316, -3.360009, 0,
-3.103483, -3.513437, 0,
-2.94316, -3.360009, 2,
-3.103483, -3.513437, 2,
-2.94316, -3.360009, 4,
-3.103483, -3.513437, 4
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
-3.424129, -3.820294, -4, 0, -0.5, 0.5, 0.5,
-3.424129, -3.820294, -4, 1, -0.5, 0.5, 0.5,
-3.424129, -3.820294, -4, 1, 1.5, 0.5, 0.5,
-3.424129, -3.820294, -4, 0, 1.5, 0.5, 0.5,
-3.424129, -3.820294, -2, 0, -0.5, 0.5, 0.5,
-3.424129, -3.820294, -2, 1, -0.5, 0.5, 0.5,
-3.424129, -3.820294, -2, 1, 1.5, 0.5, 0.5,
-3.424129, -3.820294, -2, 0, 1.5, 0.5, 0.5,
-3.424129, -3.820294, 0, 0, -0.5, 0.5, 0.5,
-3.424129, -3.820294, 0, 1, -0.5, 0.5, 0.5,
-3.424129, -3.820294, 0, 1, 1.5, 0.5, 0.5,
-3.424129, -3.820294, 0, 0, 1.5, 0.5, 0.5,
-3.424129, -3.820294, 2, 0, -0.5, 0.5, 0.5,
-3.424129, -3.820294, 2, 1, -0.5, 0.5, 0.5,
-3.424129, -3.820294, 2, 1, 1.5, 0.5, 0.5,
-3.424129, -3.820294, 2, 0, 1.5, 0.5, 0.5,
-3.424129, -3.820294, 4, 0, -0.5, 0.5, 0.5,
-3.424129, -3.820294, 4, 1, -0.5, 0.5, 0.5,
-3.424129, -3.820294, 4, 1, 1.5, 0.5, 0.5,
-3.424129, -3.820294, 4, 0, 1.5, 0.5, 0.5
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
-2.94316, -3.360009, -5.674261,
-2.94316, 2.777135, -5.674261,
-2.94316, -3.360009, 6.029534,
-2.94316, 2.777135, 6.029534,
-2.94316, -3.360009, -5.674261,
-2.94316, -3.360009, 6.029534,
-2.94316, 2.777135, -5.674261,
-2.94316, 2.777135, 6.029534,
-2.94316, -3.360009, -5.674261,
3.469753, -3.360009, -5.674261,
-2.94316, -3.360009, 6.029534,
3.469753, -3.360009, 6.029534,
-2.94316, 2.777135, -5.674261,
3.469753, 2.777135, -5.674261,
-2.94316, 2.777135, 6.029534,
3.469753, 2.777135, 6.029534,
3.469753, -3.360009, -5.674261,
3.469753, 2.777135, -5.674261,
3.469753, -3.360009, 6.029534,
3.469753, 2.777135, 6.029534,
3.469753, -3.360009, -5.674261,
3.469753, -3.360009, 6.029534,
3.469753, 2.777135, -5.674261,
3.469753, 2.777135, 6.029534
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
var radius = 7.843679;
var distance = 34.89741;
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
mvMatrix.translate( -0.2632965, 0.2914367, -0.1776366 );
mvMatrix.scale( 1.322447, 1.381871, 0.7246144 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.89741);
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
dimefuron<-read.table("dimefuron.xyz")
```

```
## Error in read.table("dimefuron.xyz"): no lines available in input
```

```r
x<-dimefuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'dimefuron' not found
```

```r
y<-dimefuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'dimefuron' not found
```

```r
z<-dimefuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'dimefuron' not found
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
-2.849768, -0.3720431, 0.2022037, 0, 0, 1, 1, 1,
-2.794418, 1.294788, 0.340887, 1, 0, 0, 1, 1,
-2.754407, -0.9614313, -0.9916641, 1, 0, 0, 1, 1,
-2.660654, -0.6432614, -1.511331, 1, 0, 0, 1, 1,
-2.646908, -1.374642, -0.07148484, 1, 0, 0, 1, 1,
-2.635461, -0.2098652, -1.191216, 1, 0, 0, 1, 1,
-2.58396, -0.00938352, -2.21528, 0, 0, 0, 1, 1,
-2.52562, -0.2778556, -1.683795, 0, 0, 0, 1, 1,
-2.519902, -0.1259202, 0.09336989, 0, 0, 0, 1, 1,
-2.496518, -2.027129, -0.2120583, 0, 0, 0, 1, 1,
-2.443373, -1.381525, -2.618942, 0, 0, 0, 1, 1,
-2.348314, 1.303976, -0.1498994, 0, 0, 0, 1, 1,
-2.338296, -1.660652, -1.473216, 0, 0, 0, 1, 1,
-2.284132, -0.04087757, -1.182909, 1, 1, 1, 1, 1,
-2.262597, -0.4897545, -2.085421, 1, 1, 1, 1, 1,
-2.241927, 0.6471387, 0.8467883, 1, 1, 1, 1, 1,
-2.217068, 1.296614, -0.1139637, 1, 1, 1, 1, 1,
-2.174022, -0.06930286, -2.456562, 1, 1, 1, 1, 1,
-2.163486, 1.698521, -0.6965036, 1, 1, 1, 1, 1,
-2.155536, 0.06309828, -1.676529, 1, 1, 1, 1, 1,
-2.105963, -2.114659, -3.515993, 1, 1, 1, 1, 1,
-2.079618, 2.020022, -1.905775, 1, 1, 1, 1, 1,
-2.077508, -0.03018687, -3.159249, 1, 1, 1, 1, 1,
-2.068347, 0.778167, -0.4971268, 1, 1, 1, 1, 1,
-2.060391, 0.09850528, -3.008589, 1, 1, 1, 1, 1,
-2.008763, -1.142429, -3.133674, 1, 1, 1, 1, 1,
-2.003481, -0.6087872, -1.105667, 1, 1, 1, 1, 1,
-2.002746, 1.305158, -2.313009, 1, 1, 1, 1, 1,
-1.959532, 1.621251, -0.9628799, 0, 0, 1, 1, 1,
-1.958394, -0.07895664, -1.634336, 1, 0, 0, 1, 1,
-1.957926, 2.14288, -0.2324417, 1, 0, 0, 1, 1,
-1.952714, -0.08326886, -2.624195, 1, 0, 0, 1, 1,
-1.935052, 1.112915, -2.077469, 1, 0, 0, 1, 1,
-1.923126, 0.9878238, 0.9566442, 1, 0, 0, 1, 1,
-1.902019, 0.5574205, -2.055454, 0, 0, 0, 1, 1,
-1.897446, -0.5074816, -2.883549, 0, 0, 0, 1, 1,
-1.874368, 1.260624, -0.8038246, 0, 0, 0, 1, 1,
-1.863969, 1.125136, 0.08131125, 0, 0, 0, 1, 1,
-1.861054, -0.1906092, -1.819609, 0, 0, 0, 1, 1,
-1.860265, 1.10936, -1.390058, 0, 0, 0, 1, 1,
-1.855181, 1.999309, -1.443667, 0, 0, 0, 1, 1,
-1.822598, -0.3284541, -2.7203, 1, 1, 1, 1, 1,
-1.816755, 0.3859834, 0.2692225, 1, 1, 1, 1, 1,
-1.813438, 0.9828808, -1.16272, 1, 1, 1, 1, 1,
-1.808853, 1.431654, -3.475126, 1, 1, 1, 1, 1,
-1.788584, 0.910807, -0.6000965, 1, 1, 1, 1, 1,
-1.788081, 1.06284, -0.2463632, 1, 1, 1, 1, 1,
-1.786049, 0.8645388, -0.3410301, 1, 1, 1, 1, 1,
-1.779097, 1.117497, -1.283257, 1, 1, 1, 1, 1,
-1.775661, 0.06764641, -2.176944, 1, 1, 1, 1, 1,
-1.768269, -0.1820046, -1.180936, 1, 1, 1, 1, 1,
-1.759863, 2.115611, -0.5360836, 1, 1, 1, 1, 1,
-1.703317, -1.958257, -0.09718963, 1, 1, 1, 1, 1,
-1.701339, 0.5100423, -2.143922, 1, 1, 1, 1, 1,
-1.684058, -1.248278, -3.040601, 1, 1, 1, 1, 1,
-1.68233, 1.237343, -1.180888, 1, 1, 1, 1, 1,
-1.675733, 0.8947784, -3.075461, 0, 0, 1, 1, 1,
-1.656829, 0.07611271, -2.214441, 1, 0, 0, 1, 1,
-1.645515, -1.753188, -4.147312, 1, 0, 0, 1, 1,
-1.629877, 0.5225902, -2.503341, 1, 0, 0, 1, 1,
-1.622682, 1.726625, -2.343956, 1, 0, 0, 1, 1,
-1.609069, 1.105501, 1.079499, 1, 0, 0, 1, 1,
-1.601697, 0.2888003, -1.96945, 0, 0, 0, 1, 1,
-1.599783, -0.2153617, -0.5405579, 0, 0, 0, 1, 1,
-1.591101, 0.1633076, -0.7576969, 0, 0, 0, 1, 1,
-1.587688, 0.02849342, -3.752019, 0, 0, 0, 1, 1,
-1.585525, -0.03690604, -0.5161624, 0, 0, 0, 1, 1,
-1.569134, 0.1997453, -2.45407, 0, 0, 0, 1, 1,
-1.569055, 0.5225631, -0.5316533, 0, 0, 0, 1, 1,
-1.561819, -0.3342102, -2.797654, 1, 1, 1, 1, 1,
-1.557278, 0.4283112, -0.6852497, 1, 1, 1, 1, 1,
-1.553079, 1.200221, -0.4117321, 1, 1, 1, 1, 1,
-1.551143, 0.682069, -0.6685879, 1, 1, 1, 1, 1,
-1.54432, 1.428707, -0.1584252, 1, 1, 1, 1, 1,
-1.539369, 0.7034583, -1.806817, 1, 1, 1, 1, 1,
-1.538085, -0.9237883, -2.934771, 1, 1, 1, 1, 1,
-1.531701, -0.4452112, -0.549257, 1, 1, 1, 1, 1,
-1.528929, 0.7813876, -0.3381509, 1, 1, 1, 1, 1,
-1.524385, -1.515375, -3.443802, 1, 1, 1, 1, 1,
-1.501402, 0.6322886, 0.1239415, 1, 1, 1, 1, 1,
-1.500733, -1.526458, -1.392006, 1, 1, 1, 1, 1,
-1.497081, -0.2419843, -1.433459, 1, 1, 1, 1, 1,
-1.476171, 1.119281, -0.9597113, 1, 1, 1, 1, 1,
-1.465166, -1.12534, -1.457402, 1, 1, 1, 1, 1,
-1.461886, 1.271869, -0.138887, 0, 0, 1, 1, 1,
-1.459781, 1.228073, -2.143057, 1, 0, 0, 1, 1,
-1.456397, 1.159497, -1.347965, 1, 0, 0, 1, 1,
-1.453539, 0.803785, -1.136316, 1, 0, 0, 1, 1,
-1.445942, -0.6724136, -2.438392, 1, 0, 0, 1, 1,
-1.442604, -0.5684137, -2.605707, 1, 0, 0, 1, 1,
-1.428088, -2.433552, -1.236784, 0, 0, 0, 1, 1,
-1.426942, 0.4770046, -1.65976, 0, 0, 0, 1, 1,
-1.417101, 0.04354722, -1.231099, 0, 0, 0, 1, 1,
-1.415886, 0.51516, 0.1519245, 0, 0, 0, 1, 1,
-1.415358, -0.1931665, -1.044693, 0, 0, 0, 1, 1,
-1.402543, -0.5125557, -2.229264, 0, 0, 0, 1, 1,
-1.391072, 0.7494584, -0.8692216, 0, 0, 0, 1, 1,
-1.391041, -2.730251, -2.485111, 1, 1, 1, 1, 1,
-1.389488, -0.1967184, -0.003673855, 1, 1, 1, 1, 1,
-1.376702, -0.5758047, -2.885056, 1, 1, 1, 1, 1,
-1.360258, 0.2496908, -2.532356, 1, 1, 1, 1, 1,
-1.35546, 0.3811509, -2.727793, 1, 1, 1, 1, 1,
-1.352407, 1.249844, -0.997667, 1, 1, 1, 1, 1,
-1.344568, 1.439093, -1.448146, 1, 1, 1, 1, 1,
-1.326583, 0.5412635, -0.9516644, 1, 1, 1, 1, 1,
-1.32491, -1.160028, -3.02753, 1, 1, 1, 1, 1,
-1.317747, 0.5368488, 0.5379422, 1, 1, 1, 1, 1,
-1.299866, 0.2019104, -2.25942, 1, 1, 1, 1, 1,
-1.296233, 0.7112984, -1.821267, 1, 1, 1, 1, 1,
-1.292072, 1.049858, -2.725587, 1, 1, 1, 1, 1,
-1.290721, -0.2524087, -2.769924, 1, 1, 1, 1, 1,
-1.28458, 0.2889611, -1.767733, 1, 1, 1, 1, 1,
-1.282255, 0.4561829, -0.637623, 0, 0, 1, 1, 1,
-1.278718, -0.6544152, -2.857863, 1, 0, 0, 1, 1,
-1.273923, -1.412579, -3.984382, 1, 0, 0, 1, 1,
-1.27383, 0.1894798, -3.13248, 1, 0, 0, 1, 1,
-1.260007, -0.02902881, -1.673888, 1, 0, 0, 1, 1,
-1.254491, 0.8269277, -2.865333, 1, 0, 0, 1, 1,
-1.252973, 0.7708546, -1.096895, 0, 0, 0, 1, 1,
-1.248004, 0.4551259, -1.598345, 0, 0, 0, 1, 1,
-1.245687, -0.1294171, -2.618504, 0, 0, 0, 1, 1,
-1.243343, -1.43756, -1.846812, 0, 0, 0, 1, 1,
-1.233227, -0.2439777, -2.17639, 0, 0, 0, 1, 1,
-1.232839, 0.429433, -0.51004, 0, 0, 0, 1, 1,
-1.222714, 0.5948427, -1.330036, 0, 0, 0, 1, 1,
-1.222044, 0.4249409, -0.7187034, 1, 1, 1, 1, 1,
-1.214585, -1.954359, -2.956621, 1, 1, 1, 1, 1,
-1.211614, 0.9738801, -0.1384044, 1, 1, 1, 1, 1,
-1.210598, 1.231588, -1.396334, 1, 1, 1, 1, 1,
-1.193127, -0.0905997, 0.05387161, 1, 1, 1, 1, 1,
-1.188511, 0.4856363, -1.135059, 1, 1, 1, 1, 1,
-1.185641, -0.4208179, -0.4865857, 1, 1, 1, 1, 1,
-1.182329, -1.225117, -3.389164, 1, 1, 1, 1, 1,
-1.174926, 0.3253607, -1.833414, 1, 1, 1, 1, 1,
-1.165057, -0.1569904, -1.70244, 1, 1, 1, 1, 1,
-1.162647, 1.595448, -2.413373, 1, 1, 1, 1, 1,
-1.16236, 0.09523851, -0.6403939, 1, 1, 1, 1, 1,
-1.157882, -1.62348, -2.373289, 1, 1, 1, 1, 1,
-1.151763, -0.5066169, -0.9582904, 1, 1, 1, 1, 1,
-1.149457, -0.3452547, -1.522492, 1, 1, 1, 1, 1,
-1.136072, 0.5385497, 0.3830932, 0, 0, 1, 1, 1,
-1.131434, -1.378822, -2.582519, 1, 0, 0, 1, 1,
-1.12229, 0.3150447, -1.474149, 1, 0, 0, 1, 1,
-1.120512, 0.04674852, -3.994399, 1, 0, 0, 1, 1,
-1.119396, -0.3933508, -0.1466852, 1, 0, 0, 1, 1,
-1.116649, -0.04012429, -0.6763728, 1, 0, 0, 1, 1,
-1.116377, -1.84892, -1.996553, 0, 0, 0, 1, 1,
-1.104315, -0.7658622, -2.388763, 0, 0, 0, 1, 1,
-1.102619, 1.735308, -0.6040897, 0, 0, 0, 1, 1,
-1.096515, 0.4836217, -2.770951, 0, 0, 0, 1, 1,
-1.089305, 1.534479, 0.4092104, 0, 0, 0, 1, 1,
-1.082114, -1.14178, -1.862848, 0, 0, 0, 1, 1,
-1.080668, -0.1578682, -1.099711, 0, 0, 0, 1, 1,
-1.075326, -0.7116026, -1.757882, 1, 1, 1, 1, 1,
-1.072842, 0.9915032, -1.466111, 1, 1, 1, 1, 1,
-1.072256, -0.1327953, -2.419908, 1, 1, 1, 1, 1,
-1.06867, -1.260821, -2.137486, 1, 1, 1, 1, 1,
-1.067755, -0.07360651, -2.442663, 1, 1, 1, 1, 1,
-1.067191, 0.3992118, -2.06281, 1, 1, 1, 1, 1,
-1.062777, -1.065976, -2.074245, 1, 1, 1, 1, 1,
-1.05497, -1.396572, -2.237118, 1, 1, 1, 1, 1,
-1.050157, -0.1378982, -1.091828, 1, 1, 1, 1, 1,
-1.050056, 1.209558, -0.904744, 1, 1, 1, 1, 1,
-1.048535, 1.824022, -1.608561, 1, 1, 1, 1, 1,
-1.046182, -0.07638173, -2.535152, 1, 1, 1, 1, 1,
-1.040906, 1.689779, 0.4455363, 1, 1, 1, 1, 1,
-1.040501, -0.8201196, -3.045794, 1, 1, 1, 1, 1,
-1.029573, 2.056238, 0.01578694, 1, 1, 1, 1, 1,
-1.023955, 0.3650023, 0.7279209, 0, 0, 1, 1, 1,
-1.021552, -0.9277408, -2.494372, 1, 0, 0, 1, 1,
-1.017436, 0.709205, -1.400513, 1, 0, 0, 1, 1,
-1.012514, 1.364624, -2.816456, 1, 0, 0, 1, 1,
-1.011862, -0.2308329, 0.2019942, 1, 0, 0, 1, 1,
-1.010185, -0.05819929, -1.8134, 1, 0, 0, 1, 1,
-1.007348, 0.05793026, -1.038688, 0, 0, 0, 1, 1,
-0.9997422, 0.9709567, -0.7981931, 0, 0, 0, 1, 1,
-0.9979489, 0.03742298, -1.903287, 0, 0, 0, 1, 1,
-0.9931726, 0.3862412, -0.7064565, 0, 0, 0, 1, 1,
-0.9916126, 1.38096, -0.5562709, 0, 0, 0, 1, 1,
-0.9855765, 0.7342858, -2.358509, 0, 0, 0, 1, 1,
-0.9838331, -0.4958312, -1.542232, 0, 0, 0, 1, 1,
-0.9813669, -1.158897, -3.751324, 1, 1, 1, 1, 1,
-0.9772696, -0.7802987, -3.109076, 1, 1, 1, 1, 1,
-0.9663556, -0.268842, -1.824201, 1, 1, 1, 1, 1,
-0.9646809, -0.7381979, -2.84302, 1, 1, 1, 1, 1,
-0.9584054, -1.776619, -3.165345, 1, 1, 1, 1, 1,
-0.9477357, 1.712389, -0.6017243, 1, 1, 1, 1, 1,
-0.9459147, 0.454974, -1.340738, 1, 1, 1, 1, 1,
-0.9449379, -1.087915, -2.985668, 1, 1, 1, 1, 1,
-0.9374876, -3.144599, -2.136445, 1, 1, 1, 1, 1,
-0.9338654, -0.2400449, -0.4665209, 1, 1, 1, 1, 1,
-0.9334962, 1.130291, 0.2331764, 1, 1, 1, 1, 1,
-0.9323952, -0.9917596, -3.67103, 1, 1, 1, 1, 1,
-0.9261903, 0.08218642, -2.880649, 1, 1, 1, 1, 1,
-0.9183513, -0.2975365, -1.45769, 1, 1, 1, 1, 1,
-0.918195, -0.5379634, -2.453453, 1, 1, 1, 1, 1,
-0.917015, 0.5564024, -1.143203, 0, 0, 1, 1, 1,
-0.9138128, 1.037461, 0.09651428, 1, 0, 0, 1, 1,
-0.9113436, -0.6566494, -0.8720908, 1, 0, 0, 1, 1,
-0.9086908, -1.088828, -4.132628, 1, 0, 0, 1, 1,
-0.9042105, 1.250802, -0.9785059, 1, 0, 0, 1, 1,
-0.9040321, 1.45391, -2.622999, 1, 0, 0, 1, 1,
-0.89698, 0.2888013, 0.5464182, 0, 0, 0, 1, 1,
-0.8893225, -0.9901832, -2.789708, 0, 0, 0, 1, 1,
-0.8703459, 1.376385, -0.8757962, 0, 0, 0, 1, 1,
-0.8664031, -0.5049269, -2.378387, 0, 0, 0, 1, 1,
-0.8648134, 0.2718987, -0.09340648, 0, 0, 0, 1, 1,
-0.8642829, 0.2447383, -2.947097, 0, 0, 0, 1, 1,
-0.8628508, 0.3095894, -0.8498566, 0, 0, 0, 1, 1,
-0.8602184, 0.1887348, -0.8949928, 1, 1, 1, 1, 1,
-0.8599588, -0.4088939, -1.838588, 1, 1, 1, 1, 1,
-0.8545967, -0.6405801, -3.087228, 1, 1, 1, 1, 1,
-0.8541613, -0.2003908, -1.969086, 1, 1, 1, 1, 1,
-0.846902, 0.5553893, -1.941636, 1, 1, 1, 1, 1,
-0.8362715, -0.2009823, -2.133785, 1, 1, 1, 1, 1,
-0.8359213, 1.3803, -2.249289, 1, 1, 1, 1, 1,
-0.829918, 0.03246405, -1.095935, 1, 1, 1, 1, 1,
-0.8298827, 1.142558, -1.05639, 1, 1, 1, 1, 1,
-0.8281022, 1.411764, -1.966254, 1, 1, 1, 1, 1,
-0.8265206, -0.6509428, -1.313259, 1, 1, 1, 1, 1,
-0.8243954, 1.688676, -2.051087, 1, 1, 1, 1, 1,
-0.8175631, -0.4849412, -1.603472, 1, 1, 1, 1, 1,
-0.8172079, -0.08699909, -1.833231, 1, 1, 1, 1, 1,
-0.8157166, -0.3881431, -1.548913, 1, 1, 1, 1, 1,
-0.8140425, -3.270633, -3.888142, 0, 0, 1, 1, 1,
-0.8140283, -0.470451, -1.939363, 1, 0, 0, 1, 1,
-0.812487, 0.765083, -1.333134, 1, 0, 0, 1, 1,
-0.805889, -0.5222554, -1.17532, 1, 0, 0, 1, 1,
-0.805222, 0.8310221, -0.3172515, 1, 0, 0, 1, 1,
-0.8005079, 0.05350076, -0.7096077, 1, 0, 0, 1, 1,
-0.7961478, -1.187866, -2.061156, 0, 0, 0, 1, 1,
-0.7885266, 0.7317824, -3.883202, 0, 0, 0, 1, 1,
-0.7860281, 0.33697, -1.611296, 0, 0, 0, 1, 1,
-0.7855918, 0.9257927, -0.03783648, 0, 0, 0, 1, 1,
-0.7800449, 1.660282, -0.5456198, 0, 0, 0, 1, 1,
-0.7785359, -0.7878308, -1.405105, 0, 0, 0, 1, 1,
-0.7781639, 1.760002, -1.197535, 0, 0, 0, 1, 1,
-0.7772511, 0.6203319, 0.2863748, 1, 1, 1, 1, 1,
-0.7750066, -0.8200949, -3.057869, 1, 1, 1, 1, 1,
-0.7668371, -0.423361, -2.723736, 1, 1, 1, 1, 1,
-0.765999, -0.6028663, -3.034987, 1, 1, 1, 1, 1,
-0.7649818, 0.7320662, 0.1571637, 1, 1, 1, 1, 1,
-0.7593416, 0.09517894, -1.559929, 1, 1, 1, 1, 1,
-0.7575824, -0.9749793, -3.033551, 1, 1, 1, 1, 1,
-0.7566056, 1.14057, -1.496091, 1, 1, 1, 1, 1,
-0.754836, 0.4074963, -0.4121162, 1, 1, 1, 1, 1,
-0.7522789, 1.539882, -2.375288, 1, 1, 1, 1, 1,
-0.7503729, -1.783195, -3.745453, 1, 1, 1, 1, 1,
-0.7451923, -0.9263797, -1.630224, 1, 1, 1, 1, 1,
-0.7436063, -0.3454572, -2.058013, 1, 1, 1, 1, 1,
-0.7404203, 0.1262915, -1.04428, 1, 1, 1, 1, 1,
-0.7376041, -1.279227, -2.168428, 1, 1, 1, 1, 1,
-0.7374721, -0.5699363, -1.881936, 0, 0, 1, 1, 1,
-0.7308578, -0.672102, -2.887488, 1, 0, 0, 1, 1,
-0.7168452, -1.134044, -2.439978, 1, 0, 0, 1, 1,
-0.7154933, 1.314349, -0.8483898, 1, 0, 0, 1, 1,
-0.6962471, -0.6923961, -2.352735, 1, 0, 0, 1, 1,
-0.6962072, 1.287688, -0.466221, 1, 0, 0, 1, 1,
-0.6947826, -0.2941726, -1.153836, 0, 0, 0, 1, 1,
-0.6947114, 0.9787446, -0.1775535, 0, 0, 0, 1, 1,
-0.6938268, -0.5601649, -2.432865, 0, 0, 0, 1, 1,
-0.6898151, -0.6955549, -2.419715, 0, 0, 0, 1, 1,
-0.6865759, -0.1557155, -1.14691, 0, 0, 0, 1, 1,
-0.6846415, -1.500795, -4.062369, 0, 0, 0, 1, 1,
-0.6791336, -0.3269674, -0.9110564, 0, 0, 0, 1, 1,
-0.6781192, -0.6630965, -3.005153, 1, 1, 1, 1, 1,
-0.6773468, 1.899852, -1.262946, 1, 1, 1, 1, 1,
-0.6710163, -0.2191451, -3.60195, 1, 1, 1, 1, 1,
-0.6647111, 1.789724, -0.7537915, 1, 1, 1, 1, 1,
-0.657136, 1.725399, 0.3319697, 1, 1, 1, 1, 1,
-0.6548331, 1.408863, -2.004978, 1, 1, 1, 1, 1,
-0.6507608, 0.5008314, 0.7312772, 1, 1, 1, 1, 1,
-0.64934, 0.279435, -1.127095, 1, 1, 1, 1, 1,
-0.6455356, -0.8215668, -2.009495, 1, 1, 1, 1, 1,
-0.6421402, -2.040466, -3.903294, 1, 1, 1, 1, 1,
-0.6404604, -0.1626974, -0.8652327, 1, 1, 1, 1, 1,
-0.6304449, -0.6134587, -0.5595886, 1, 1, 1, 1, 1,
-0.6284295, -1.388517, -3.358803, 1, 1, 1, 1, 1,
-0.6277815, -0.38074, -2.800184, 1, 1, 1, 1, 1,
-0.6114578, -0.8147041, -2.936653, 1, 1, 1, 1, 1,
-0.6071042, 1.494429, -0.7286958, 0, 0, 1, 1, 1,
-0.6054365, 0.7122546, 0.2216706, 1, 0, 0, 1, 1,
-0.6020078, 1.151303, -2.02174, 1, 0, 0, 1, 1,
-0.6014541, -0.04070323, -0.9621258, 1, 0, 0, 1, 1,
-0.6005625, -0.4448749, -1.822854, 1, 0, 0, 1, 1,
-0.5995308, 0.1013906, -1.895482, 1, 0, 0, 1, 1,
-0.5994735, 0.9481285, 0.7246269, 0, 0, 0, 1, 1,
-0.5941151, -1.016517, -4.739963, 0, 0, 0, 1, 1,
-0.5940448, 0.2605778, -0.4289343, 0, 0, 0, 1, 1,
-0.5800332, -0.2108977, -2.937266, 0, 0, 0, 1, 1,
-0.5757836, -1.453077, -2.228813, 0, 0, 0, 1, 1,
-0.5754403, -1.31083, -2.969991, 0, 0, 0, 1, 1,
-0.5732334, -0.7228431, -2.919511, 0, 0, 0, 1, 1,
-0.5705416, -1.221542, -2.830635, 1, 1, 1, 1, 1,
-0.5663977, -0.006193111, -2.961488, 1, 1, 1, 1, 1,
-0.5654381, -0.3685087, -3.745972, 1, 1, 1, 1, 1,
-0.5650743, 1.009545, -0.335211, 1, 1, 1, 1, 1,
-0.5491759, -0.1079398, -1.753651, 1, 1, 1, 1, 1,
-0.5484607, -0.6627119, -1.069095, 1, 1, 1, 1, 1,
-0.5468922, -1.163893, -3.576133, 1, 1, 1, 1, 1,
-0.5444059, -1.841268, -2.0837, 1, 1, 1, 1, 1,
-0.5373757, 0.4450522, 0.03821614, 1, 1, 1, 1, 1,
-0.5365297, -0.4449376, -2.327068, 1, 1, 1, 1, 1,
-0.5334036, -1.159331, -3.435207, 1, 1, 1, 1, 1,
-0.5255814, -0.4261183, -2.878228, 1, 1, 1, 1, 1,
-0.5253721, -0.7339897, -2.467383, 1, 1, 1, 1, 1,
-0.5172912, -0.002176908, -0.05651795, 1, 1, 1, 1, 1,
-0.5133198, 0.07868226, -0.2820095, 1, 1, 1, 1, 1,
-0.5089281, -1.042837, -4.301418, 0, 0, 1, 1, 1,
-0.5053186, 1.321457, -1.899486, 1, 0, 0, 1, 1,
-0.5042041, -0.5701027, -2.750354, 1, 0, 0, 1, 1,
-0.5035442, 0.1899912, -2.532425, 1, 0, 0, 1, 1,
-0.5019743, -1.232684, -3.656297, 1, 0, 0, 1, 1,
-0.4973784, -0.5264323, -3.342297, 1, 0, 0, 1, 1,
-0.4960761, -0.5204874, -3.732162, 0, 0, 0, 1, 1,
-0.4956559, 1.15596, -1.887847, 0, 0, 0, 1, 1,
-0.4920502, 0.1468523, -0.1262703, 0, 0, 0, 1, 1,
-0.4909629, 0.3032294, -1.378801, 0, 0, 0, 1, 1,
-0.4901597, 0.4978766, -1.078452, 0, 0, 0, 1, 1,
-0.4892854, -0.328631, -4.179724, 0, 0, 0, 1, 1,
-0.4765383, 1.524651, 0.3254699, 0, 0, 0, 1, 1,
-0.4757285, -0.381672, -2.160006, 1, 1, 1, 1, 1,
-0.4661294, 0.9841567, 0.435504, 1, 1, 1, 1, 1,
-0.4640402, -0.6291065, -2.273237, 1, 1, 1, 1, 1,
-0.4609068, -0.1401878, -1.183439, 1, 1, 1, 1, 1,
-0.4587007, 0.2084402, -0.3899523, 1, 1, 1, 1, 1,
-0.4584817, -1.889453, -1.265527, 1, 1, 1, 1, 1,
-0.4578971, -0.8741449, -3.175127, 1, 1, 1, 1, 1,
-0.4576578, -0.2240116, -1.570003, 1, 1, 1, 1, 1,
-0.4537095, -1.117433, -2.615521, 1, 1, 1, 1, 1,
-0.4511518, 0.2277956, 0.1802443, 1, 1, 1, 1, 1,
-0.4485763, -0.4881541, -2.774494, 1, 1, 1, 1, 1,
-0.4427027, -0.1248876, -2.110469, 1, 1, 1, 1, 1,
-0.4392889, -1.163171, -2.8065, 1, 1, 1, 1, 1,
-0.4383286, 0.9249209, -0.7228438, 1, 1, 1, 1, 1,
-0.4380356, -0.6039754, -1.393724, 1, 1, 1, 1, 1,
-0.4321793, -1.731776, -2.347279, 0, 0, 1, 1, 1,
-0.4291779, 0.3563896, -1.184323, 1, 0, 0, 1, 1,
-0.4284748, -0.9089611, -1.470585, 1, 0, 0, 1, 1,
-0.427903, 1.380957, -1.230905, 1, 0, 0, 1, 1,
-0.4272815, 1.346888, -0.6757383, 1, 0, 0, 1, 1,
-0.4257786, -0.7798148, -3.503713, 1, 0, 0, 1, 1,
-0.4230738, 0.7164217, -1.193963, 0, 0, 0, 1, 1,
-0.4206608, -0.06526026, 0.5048699, 0, 0, 0, 1, 1,
-0.4189657, 1.184265, -0.1616659, 0, 0, 0, 1, 1,
-0.4181246, 0.6378224, -0.007694136, 0, 0, 0, 1, 1,
-0.4158837, 1.360018, -0.5868108, 0, 0, 0, 1, 1,
-0.4128233, 0.2391098, -1.858675, 0, 0, 0, 1, 1,
-0.4027982, 1.853358, 0.3782018, 0, 0, 0, 1, 1,
-0.4001634, -0.4310153, -3.641809, 1, 1, 1, 1, 1,
-0.3987048, 0.5110398, -0.8444126, 1, 1, 1, 1, 1,
-0.398639, 0.1895327, -0.2891922, 1, 1, 1, 1, 1,
-0.3916895, -0.6664072, -2.900083, 1, 1, 1, 1, 1,
-0.3872361, -0.3859464, -2.401881, 1, 1, 1, 1, 1,
-0.3839121, -0.07817194, -1.926967, 1, 1, 1, 1, 1,
-0.3823295, 0.1645217, -1.548307, 1, 1, 1, 1, 1,
-0.3779068, 1.545633, -1.016626, 1, 1, 1, 1, 1,
-0.3750759, -0.1385239, -1.362297, 1, 1, 1, 1, 1,
-0.3738108, 0.1811576, -1.538609, 1, 1, 1, 1, 1,
-0.3683016, 0.2247482, -0.9987813, 1, 1, 1, 1, 1,
-0.3665792, -0.8153493, -1.940006, 1, 1, 1, 1, 1,
-0.3645605, 0.8536825, -0.7637717, 1, 1, 1, 1, 1,
-0.3619336, 0.1061655, -1.893885, 1, 1, 1, 1, 1,
-0.3578371, 1.957741, -0.7633783, 1, 1, 1, 1, 1,
-0.353367, 0.8120865, -0.1434578, 0, 0, 1, 1, 1,
-0.3494217, -0.1182797, -2.070622, 1, 0, 0, 1, 1,
-0.3494198, -0.2254335, -3.954623, 1, 0, 0, 1, 1,
-0.3423262, -1.241627, -1.871087, 1, 0, 0, 1, 1,
-0.3396408, -0.3989007, -2.586256, 1, 0, 0, 1, 1,
-0.3395537, 0.3294367, -0.7774739, 1, 0, 0, 1, 1,
-0.3346511, -0.6261698, -3.777496, 0, 0, 0, 1, 1,
-0.3339659, 1.26705, -1.53433, 0, 0, 0, 1, 1,
-0.3337481, -0.4254966, -2.729471, 0, 0, 0, 1, 1,
-0.3334582, -0.1508994, -2.389934, 0, 0, 0, 1, 1,
-0.3304642, -0.9549909, -2.627796, 0, 0, 0, 1, 1,
-0.3293288, 0.1762262, -2.113446, 0, 0, 0, 1, 1,
-0.3285117, 0.8193302, -1.17344, 0, 0, 0, 1, 1,
-0.3273799, -1.033052, -1.803701, 1, 1, 1, 1, 1,
-0.3234377, 0.4846247, -0.405744, 1, 1, 1, 1, 1,
-0.3113573, -0.810762, -1.730271, 1, 1, 1, 1, 1,
-0.3095942, 0.8092616, 0.2700069, 1, 1, 1, 1, 1,
-0.3075011, 0.3455867, -0.759491, 1, 1, 1, 1, 1,
-0.305961, -1.687127, -3.093847, 1, 1, 1, 1, 1,
-0.3021676, -0.6606658, -3.602089, 1, 1, 1, 1, 1,
-0.3009776, -0.144826, -2.058192, 1, 1, 1, 1, 1,
-0.3006346, -1.3503, -3.341574, 1, 1, 1, 1, 1,
-0.2908748, -0.2981921, -1.23548, 1, 1, 1, 1, 1,
-0.2906573, 1.678686, -0.6955308, 1, 1, 1, 1, 1,
-0.2883228, -1.699148, -3.928223, 1, 1, 1, 1, 1,
-0.2808014, 0.4220184, -1.262354, 1, 1, 1, 1, 1,
-0.2789663, -0.6295989, -2.893636, 1, 1, 1, 1, 1,
-0.2787873, 0.495619, 0.1093379, 1, 1, 1, 1, 1,
-0.2743134, 1.195275, -0.08082325, 0, 0, 1, 1, 1,
-0.2722581, 1.069469, 1.354549, 1, 0, 0, 1, 1,
-0.2602673, -1.105761, -3.522743, 1, 0, 0, 1, 1,
-0.2601964, 0.147155, -1.242389, 1, 0, 0, 1, 1,
-0.2581242, 0.2549811, -1.295131, 1, 0, 0, 1, 1,
-0.2563457, 0.8492608, 0.5531563, 1, 0, 0, 1, 1,
-0.2560004, -0.1229568, -2.774555, 0, 0, 0, 1, 1,
-0.2444156, 0.5540365, 0.2448905, 0, 0, 0, 1, 1,
-0.2428218, 0.7133196, -0.4975619, 0, 0, 0, 1, 1,
-0.2380339, -0.4081497, -4.251265, 0, 0, 0, 1, 1,
-0.2361044, 0.9450003, -1.643473, 0, 0, 0, 1, 1,
-0.227816, 0.22358, -1.262335, 0, 0, 0, 1, 1,
-0.223294, -0.4357544, -1.922366, 0, 0, 0, 1, 1,
-0.2152824, -1.920255, -4.142974, 1, 1, 1, 1, 1,
-0.2143455, 0.6614711, -0.4246097, 1, 1, 1, 1, 1,
-0.2138195, -0.1073818, -1.701422, 1, 1, 1, 1, 1,
-0.2133904, -0.4706152, -2.020197, 1, 1, 1, 1, 1,
-0.2131939, 0.5408955, 0.4191872, 1, 1, 1, 1, 1,
-0.1988555, -0.2264877, -2.369887, 1, 1, 1, 1, 1,
-0.1978947, 0.1182425, -1.426226, 1, 1, 1, 1, 1,
-0.1873886, 0.9637746, 0.1291671, 1, 1, 1, 1, 1,
-0.1867279, -0.6107212, -3.864151, 1, 1, 1, 1, 1,
-0.1864126, -0.5517558, -4.41892, 1, 1, 1, 1, 1,
-0.1825856, -0.4221733, -2.619789, 1, 1, 1, 1, 1,
-0.1803309, 1.042379, -1.224355, 1, 1, 1, 1, 1,
-0.1797016, 0.008114625, 0.1381611, 1, 1, 1, 1, 1,
-0.1759625, 0.8456081, -1.010571, 1, 1, 1, 1, 1,
-0.1729368, 0.7054451, 1.086919, 1, 1, 1, 1, 1,
-0.1715747, 0.6176622, 0.7561358, 0, 0, 1, 1, 1,
-0.1711652, 1.13218, -0.9221441, 1, 0, 0, 1, 1,
-0.1695773, -0.3754361, -3.708874, 1, 0, 0, 1, 1,
-0.165909, -1.703775, -2.778131, 1, 0, 0, 1, 1,
-0.1579091, 0.8584102, 1.269178, 1, 0, 0, 1, 1,
-0.1527315, 0.4779469, 0.008281493, 1, 0, 0, 1, 1,
-0.1505464, -0.3790537, -2.409835, 0, 0, 0, 1, 1,
-0.1468743, 1.064842, 1.29893, 0, 0, 0, 1, 1,
-0.1455071, 1.972708, -0.4195159, 0, 0, 0, 1, 1,
-0.1409057, -0.2634613, -5.503818, 0, 0, 0, 1, 1,
-0.1365125, 0.02205391, -0.7267015, 0, 0, 0, 1, 1,
-0.1355135, 0.9956281, -0.6720517, 0, 0, 0, 1, 1,
-0.133714, -0.311609, -3.784552, 0, 0, 0, 1, 1,
-0.1336384, 0.1237641, -1.52815, 1, 1, 1, 1, 1,
-0.1316462, 0.5859901, 1.238523, 1, 1, 1, 1, 1,
-0.1297017, 0.8611937, 0.5804364, 1, 1, 1, 1, 1,
-0.1278008, 0.475578, -0.617561, 1, 1, 1, 1, 1,
-0.1216507, 1.17032, -0.571931, 1, 1, 1, 1, 1,
-0.1195911, 0.4274672, -0.6604717, 1, 1, 1, 1, 1,
-0.1189557, -1.354398, -2.365374, 1, 1, 1, 1, 1,
-0.1175042, 0.05830842, -1.220224, 1, 1, 1, 1, 1,
-0.1165196, 0.1719918, -0.2992709, 1, 1, 1, 1, 1,
-0.1163893, 0.6415972, 0.7608755, 1, 1, 1, 1, 1,
-0.1138549, -0.116342, -3.49063, 1, 1, 1, 1, 1,
-0.1101578, 0.1360973, -1.435126, 1, 1, 1, 1, 1,
-0.1097503, -0.4929285, -3.148717, 1, 1, 1, 1, 1,
-0.1062885, 1.0531, 1.576172, 1, 1, 1, 1, 1,
-0.1062003, -0.8885692, -4.52203, 1, 1, 1, 1, 1,
-0.1055592, -1.566115, -3.90539, 0, 0, 1, 1, 1,
-0.1055179, -0.6967391, -2.485303, 1, 0, 0, 1, 1,
-0.1026227, -1.381856, -2.072846, 1, 0, 0, 1, 1,
-0.1017161, -0.1208811, -2.759382, 1, 0, 0, 1, 1,
-0.09587722, -0.778392, -4.71227, 1, 0, 0, 1, 1,
-0.09342657, -0.09959299, -4.127792, 1, 0, 0, 1, 1,
-0.08395267, 1.536409, -0.1534393, 0, 0, 0, 1, 1,
-0.07659412, 1.171561, 0.3580216, 0, 0, 0, 1, 1,
-0.07451338, 0.0741341, -0.1296183, 0, 0, 0, 1, 1,
-0.07251538, -0.7532087, -2.65654, 0, 0, 0, 1, 1,
-0.07202356, -0.02596632, -3.220331, 0, 0, 0, 1, 1,
-0.07100597, 1.103994, 0.02153912, 0, 0, 0, 1, 1,
-0.06968214, 1.748204, 2.108419, 0, 0, 0, 1, 1,
-0.0667232, -0.2346042, -2.50153, 1, 1, 1, 1, 1,
-0.0666156, 1.091045, -0.5142962, 1, 1, 1, 1, 1,
-0.06541898, -2.094345, -2.902454, 1, 1, 1, 1, 1,
-0.0635729, -0.16503, -2.633683, 1, 1, 1, 1, 1,
-0.06257529, 0.9537068, -0.2609441, 1, 1, 1, 1, 1,
-0.06212546, -0.7397641, -4.092619, 1, 1, 1, 1, 1,
-0.06093033, 0.6041894, 0.4111177, 1, 1, 1, 1, 1,
-0.0556004, 1.348151, -0.7359693, 1, 1, 1, 1, 1,
-0.05338038, -0.2291968, -3.130179, 1, 1, 1, 1, 1,
-0.0504457, -0.6336649, -3.036329, 1, 1, 1, 1, 1,
-0.0483272, -0.0508219, -1.445896, 1, 1, 1, 1, 1,
-0.04601793, 2.093731, 0.8408256, 1, 1, 1, 1, 1,
-0.02970856, -1.065615, -4.079128, 1, 1, 1, 1, 1,
-0.02168838, -0.2943569, -4.297315, 1, 1, 1, 1, 1,
-0.02155358, 1.189035, 1.608642, 1, 1, 1, 1, 1,
-0.02136655, -0.4722603, -2.803159, 0, 0, 1, 1, 1,
-0.0205365, 0.3453649, 1.738797, 1, 0, 0, 1, 1,
-0.01754582, -0.8815259, -2.966433, 1, 0, 0, 1, 1,
-0.01552517, 2.687759, 1.320683, 1, 0, 0, 1, 1,
-0.01453515, 1.272372, -0.4799518, 1, 0, 0, 1, 1,
-0.01012929, -0.8978531, -1.446581, 1, 0, 0, 1, 1,
-0.003828133, 1.113346, 0.1014054, 0, 0, 0, 1, 1,
-0.003750654, -0.5555315, -3.95279, 0, 0, 0, 1, 1,
-0.003604178, 0.3189957, 0.2879179, 0, 0, 0, 1, 1,
0.001405449, -0.245886, 2.375189, 0, 0, 0, 1, 1,
0.004840889, 0.6357431, 0.2883165, 0, 0, 0, 1, 1,
0.004888726, -1.323318, 5.187232, 0, 0, 0, 1, 1,
0.008966892, -1.31377, 2.541107, 0, 0, 0, 1, 1,
0.01315082, 2.468678, -1.308511, 1, 1, 1, 1, 1,
0.02029551, 0.02264636, 0.69134, 1, 1, 1, 1, 1,
0.02212408, 0.1157942, -0.1970479, 1, 1, 1, 1, 1,
0.02346305, 0.07836146, 0.05333279, 1, 1, 1, 1, 1,
0.02901067, 1.051731, -1.867243, 1, 1, 1, 1, 1,
0.0305426, -0.6631557, 2.91017, 1, 1, 1, 1, 1,
0.03183653, -0.2677577, 1.755657, 1, 1, 1, 1, 1,
0.03225669, -0.3560826, 4.410428, 1, 1, 1, 1, 1,
0.0332053, -0.007933902, 1.299268, 1, 1, 1, 1, 1,
0.03429964, -1.002265, 3.259168, 1, 1, 1, 1, 1,
0.03800006, -0.4314296, 2.722181, 1, 1, 1, 1, 1,
0.03927774, 0.3426573, -1.2358, 1, 1, 1, 1, 1,
0.03945635, -0.1023599, 3.288852, 1, 1, 1, 1, 1,
0.04015399, -0.3792215, 2.730656, 1, 1, 1, 1, 1,
0.04025638, 0.1492209, -1.297915, 1, 1, 1, 1, 1,
0.04338367, 0.6154704, -0.9952316, 0, 0, 1, 1, 1,
0.04628087, 1.08453, -1.872087, 1, 0, 0, 1, 1,
0.04726505, -0.9269356, 2.79457, 1, 0, 0, 1, 1,
0.04811113, -0.4557279, 3.721263, 1, 0, 0, 1, 1,
0.05179398, 0.479632, 0.2480019, 1, 0, 0, 1, 1,
0.05605852, 1.084507, -1.615692, 1, 0, 0, 1, 1,
0.05722313, -0.1597964, 3.452949, 0, 0, 0, 1, 1,
0.05744097, -2.137274, 3.215331, 0, 0, 0, 1, 1,
0.0596082, 0.7779036, 1.479318, 0, 0, 0, 1, 1,
0.06137623, 0.3199322, 1.249765, 0, 0, 0, 1, 1,
0.06561651, 0.1535965, 0.6793321, 0, 0, 0, 1, 1,
0.07537757, 0.1610582, 1.112009, 0, 0, 0, 1, 1,
0.07622994, 0.8490525, -2.232001, 0, 0, 0, 1, 1,
0.07768211, 0.09105876, -0.04198574, 1, 1, 1, 1, 1,
0.07886169, 0.1910923, 0.8610697, 1, 1, 1, 1, 1,
0.07986423, 0.493464, 0.7630345, 1, 1, 1, 1, 1,
0.08543028, -1.388211, 1.338005, 1, 1, 1, 1, 1,
0.08787148, 0.3874477, -0.5239581, 1, 1, 1, 1, 1,
0.08954498, -0.1868327, 1.5295, 1, 1, 1, 1, 1,
0.08962663, -0.7586503, 3.883945, 1, 1, 1, 1, 1,
0.09131096, -0.3757608, 0.6689023, 1, 1, 1, 1, 1,
0.09410305, -1.879786, 4.545918, 1, 1, 1, 1, 1,
0.1045156, -0.3081279, 2.980018, 1, 1, 1, 1, 1,
0.1066397, -0.1209261, 2.033622, 1, 1, 1, 1, 1,
0.1074412, 1.59057, 1.770145, 1, 1, 1, 1, 1,
0.1146448, 1.938296, -0.60884, 1, 1, 1, 1, 1,
0.1187025, 1.021287, -1.190862, 1, 1, 1, 1, 1,
0.1204525, -0.9947163, 3.692379, 1, 1, 1, 1, 1,
0.1242246, -0.7097982, 2.330454, 0, 0, 1, 1, 1,
0.1263062, 0.2506054, -0.05535867, 1, 0, 0, 1, 1,
0.1287953, 0.2833625, -0.4411803, 1, 0, 0, 1, 1,
0.1288777, 0.8510094, 0.4901672, 1, 0, 0, 1, 1,
0.1300522, 0.5429922, -0.1881294, 1, 0, 0, 1, 1,
0.134713, -1.252338, 3.382974, 1, 0, 0, 1, 1,
0.1380473, -0.6138273, 2.66932, 0, 0, 0, 1, 1,
0.1381923, -0.3365454, 4.234126, 0, 0, 0, 1, 1,
0.1475859, -0.1138558, 2.150363, 0, 0, 0, 1, 1,
0.1485445, 0.3954919, 0.7929178, 0, 0, 0, 1, 1,
0.1499231, 0.1254625, 2.784662, 0, 0, 0, 1, 1,
0.1535659, 0.1772324, 0.2440504, 0, 0, 0, 1, 1,
0.1567124, -1.020953, 3.815507, 0, 0, 0, 1, 1,
0.1570292, 1.513978, -0.149227, 1, 1, 1, 1, 1,
0.1570514, 1.49896, 1.725445, 1, 1, 1, 1, 1,
0.1589204, 0.8486722, -0.3259275, 1, 1, 1, 1, 1,
0.1606908, 1.023994, 1.902674, 1, 1, 1, 1, 1,
0.1640175, 0.03904533, 1.91962, 1, 1, 1, 1, 1,
0.1671786, 0.4249975, -0.5734533, 1, 1, 1, 1, 1,
0.1681774, 0.8263617, 1.553733, 1, 1, 1, 1, 1,
0.1747772, 2.457737, -0.271521, 1, 1, 1, 1, 1,
0.1801244, 1.073865, 0.836611, 1, 1, 1, 1, 1,
0.183434, 1.09178, -1.125855, 1, 1, 1, 1, 1,
0.1846963, 0.9097636, 1.475278, 1, 1, 1, 1, 1,
0.1859475, 0.4656737, 0.5651273, 1, 1, 1, 1, 1,
0.186248, 0.1152026, 1.313747, 1, 1, 1, 1, 1,
0.186679, -0.6667641, 2.503591, 1, 1, 1, 1, 1,
0.1878086, -0.9992099, 4.035623, 1, 1, 1, 1, 1,
0.1882323, -0.2618799, 2.722482, 0, 0, 1, 1, 1,
0.1882384, -0.3707921, 2.39676, 1, 0, 0, 1, 1,
0.1952075, -0.5782889, 1.429627, 1, 0, 0, 1, 1,
0.1953231, -0.03907799, 1.622422, 1, 0, 0, 1, 1,
0.1973609, 0.7564549, -0.6289745, 1, 0, 0, 1, 1,
0.2006804, 1.900015, -1.239802, 1, 0, 0, 1, 1,
0.2032893, 0.4395162, -0.3665193, 0, 0, 0, 1, 1,
0.2067327, -1.584755, 3.433539, 0, 0, 0, 1, 1,
0.2078438, -0.5151044, 2.414605, 0, 0, 0, 1, 1,
0.2112514, -0.5158763, 2.450849, 0, 0, 0, 1, 1,
0.2118533, -0.7674572, 3.876337, 0, 0, 0, 1, 1,
0.212965, -0.3687392, 2.932418, 0, 0, 0, 1, 1,
0.2132653, 0.9260555, 1.148756, 0, 0, 0, 1, 1,
0.2169553, -0.8961442, 2.977379, 1, 1, 1, 1, 1,
0.2184308, -2.268299, 3.584529, 1, 1, 1, 1, 1,
0.2195743, -0.6199304, 3.553785, 1, 1, 1, 1, 1,
0.2206547, -0.09638232, 1.169489, 1, 1, 1, 1, 1,
0.2213574, -0.4658117, 2.949038, 1, 1, 1, 1, 1,
0.221665, 0.6928894, 1.781603, 1, 1, 1, 1, 1,
0.2219382, -1.806054, 4.065289, 1, 1, 1, 1, 1,
0.2275697, 0.4639143, 0.1831052, 1, 1, 1, 1, 1,
0.2341918, -0.282186, 3.753639, 1, 1, 1, 1, 1,
0.2368308, -0.5386044, 2.811484, 1, 1, 1, 1, 1,
0.237059, 0.4269598, 1.144266, 1, 1, 1, 1, 1,
0.2419326, 0.05306563, 1.30447, 1, 1, 1, 1, 1,
0.2429439, -0.5150027, 4.007051, 1, 1, 1, 1, 1,
0.2489399, 0.5096489, 0.6253405, 1, 1, 1, 1, 1,
0.2508865, -0.8275089, 1.804592, 1, 1, 1, 1, 1,
0.2518939, 1.138201, 1.286271, 0, 0, 1, 1, 1,
0.2534571, 2.214307, 0.597068, 1, 0, 0, 1, 1,
0.2579943, 0.9347512, 0.2252179, 1, 0, 0, 1, 1,
0.2611434, -1.082109, 2.858058, 1, 0, 0, 1, 1,
0.2611808, 0.3277975, 0.3130597, 1, 0, 0, 1, 1,
0.2649836, -0.5859025, 2.231541, 1, 0, 0, 1, 1,
0.2672892, 0.4197176, -0.2656627, 0, 0, 0, 1, 1,
0.274768, 0.05551171, 1.105825, 0, 0, 0, 1, 1,
0.2761365, -0.8182884, 2.556895, 0, 0, 0, 1, 1,
0.2778468, 0.4680322, 1.250651, 0, 0, 0, 1, 1,
0.2782826, -0.2667476, 3.45595, 0, 0, 0, 1, 1,
0.279289, 0.6228563, 0.6354331, 0, 0, 0, 1, 1,
0.281764, -1.107452, 3.441082, 0, 0, 0, 1, 1,
0.2830552, 0.2155811, -0.1412703, 1, 1, 1, 1, 1,
0.2844695, -0.4758554, 2.637446, 1, 1, 1, 1, 1,
0.2849918, 0.1029849, 2.704024, 1, 1, 1, 1, 1,
0.2854836, -0.6609455, 3.4541, 1, 1, 1, 1, 1,
0.2880155, -0.3293079, 1.137826, 1, 1, 1, 1, 1,
0.2917839, 0.9795654, 0.579389, 1, 1, 1, 1, 1,
0.2921365, -0.6964952, 1.647558, 1, 1, 1, 1, 1,
0.2945004, -0.5433417, 2.348205, 1, 1, 1, 1, 1,
0.2947285, 0.9361547, -1.093109, 1, 1, 1, 1, 1,
0.2968494, 0.6608106, 0.5469725, 1, 1, 1, 1, 1,
0.2978945, 0.6055278, 0.3499529, 1, 1, 1, 1, 1,
0.3030627, -1.24897, 2.215184, 1, 1, 1, 1, 1,
0.3046153, 1.134079, 0.07158415, 1, 1, 1, 1, 1,
0.3052884, 1.502517, -1.850562, 1, 1, 1, 1, 1,
0.3072922, 0.1922893, 1.677614, 1, 1, 1, 1, 1,
0.3091131, -1.243985, 3.260937, 0, 0, 1, 1, 1,
0.3103811, -1.264203, 3.132161, 1, 0, 0, 1, 1,
0.3122808, 0.01173253, 2.448385, 1, 0, 0, 1, 1,
0.3137366, 0.05865619, -0.5213127, 1, 0, 0, 1, 1,
0.3145385, 0.3349582, -1.275473, 1, 0, 0, 1, 1,
0.3161352, -0.4266235, 0.1202093, 1, 0, 0, 1, 1,
0.3176629, -2.421528, 2.241727, 0, 0, 0, 1, 1,
0.3193146, 0.1388101, 3.299896, 0, 0, 0, 1, 1,
0.320691, -1.354561, 1.498475, 0, 0, 0, 1, 1,
0.3259625, 0.01390854, 0.76362, 0, 0, 0, 1, 1,
0.3303545, -0.4860494, 3.35272, 0, 0, 0, 1, 1,
0.3357752, 0.2258023, 0.2975549, 0, 0, 0, 1, 1,
0.3371989, 0.4843885, 0.1584434, 0, 0, 0, 1, 1,
0.3372784, -0.3506081, 2.109967, 1, 1, 1, 1, 1,
0.337723, -0.2999231, 1.779147, 1, 1, 1, 1, 1,
0.3394743, 0.325561, 0.4060166, 1, 1, 1, 1, 1,
0.3422964, -1.568722, 2.289504, 1, 1, 1, 1, 1,
0.3436657, 0.005946307, 1.008681, 1, 1, 1, 1, 1,
0.3519679, 1.436266, 0.680647, 1, 1, 1, 1, 1,
0.352598, 0.8403666, -0.7027091, 1, 1, 1, 1, 1,
0.3555007, 1.121174, -0.3663624, 1, 1, 1, 1, 1,
0.3565628, -0.7621836, 3.856766, 1, 1, 1, 1, 1,
0.3587999, 2.032271, -0.3828484, 1, 1, 1, 1, 1,
0.3612398, 0.7010638, 0.1305111, 1, 1, 1, 1, 1,
0.3684578, -0.767701, 1.91399, 1, 1, 1, 1, 1,
0.3698918, 1.483145, 0.6639298, 1, 1, 1, 1, 1,
0.3708802, -0.7942055, 3.864568, 1, 1, 1, 1, 1,
0.3757361, -0.09890505, 0.7316522, 1, 1, 1, 1, 1,
0.3784192, -1.56831, 3.548394, 0, 0, 1, 1, 1,
0.3830261, 0.09488911, 1.573194, 1, 0, 0, 1, 1,
0.384988, -1.591676, 2.824441, 1, 0, 0, 1, 1,
0.3850315, -1.174357, 4.091654, 1, 0, 0, 1, 1,
0.385939, 0.6379766, 0.09290538, 1, 0, 0, 1, 1,
0.3889963, 1.522869, 1.585869, 1, 0, 0, 1, 1,
0.3919698, -0.5716355, 0.8763267, 0, 0, 0, 1, 1,
0.3949737, -0.3962986, 3.716214, 0, 0, 0, 1, 1,
0.3981552, -0.07912105, 4.232232, 0, 0, 0, 1, 1,
0.4036951, -0.3452347, 3.320201, 0, 0, 0, 1, 1,
0.403708, 1.256451, 0.5293388, 0, 0, 0, 1, 1,
0.4077754, -1.596179, 3.472354, 0, 0, 0, 1, 1,
0.4116368, -0.994716, 3.711393, 0, 0, 0, 1, 1,
0.4190722, -2.066802, 2.381335, 1, 1, 1, 1, 1,
0.4190731, -2.066585, 5.859091, 1, 1, 1, 1, 1,
0.4220136, -0.4335999, 3.755214, 1, 1, 1, 1, 1,
0.4285209, 0.8472672, 0.8604344, 1, 1, 1, 1, 1,
0.4286661, 0.5983106, -0.5144908, 1, 1, 1, 1, 1,
0.4311841, -0.7137712, 2.658747, 1, 1, 1, 1, 1,
0.4413496, 0.7961639, 1.128389, 1, 1, 1, 1, 1,
0.4499457, 0.2827633, 1.259472, 1, 1, 1, 1, 1,
0.4536364, 1.990395, -0.2245395, 1, 1, 1, 1, 1,
0.4556837, 1.363322, -0.05132631, 1, 1, 1, 1, 1,
0.4581701, -0.955279, 2.267455, 1, 1, 1, 1, 1,
0.4667131, -0.4909571, 5.073691, 1, 1, 1, 1, 1,
0.4684151, 0.9775455, 1.692242, 1, 1, 1, 1, 1,
0.4686661, 0.5861446, 1.62158, 1, 1, 1, 1, 1,
0.4717672, 0.6934123, 1.036503, 1, 1, 1, 1, 1,
0.4744259, -0.2211416, 0.6747914, 0, 0, 1, 1, 1,
0.4752938, 0.9971588, -0.6420977, 1, 0, 0, 1, 1,
0.4753098, -1.387392, 1.281151, 1, 0, 0, 1, 1,
0.4775417, -0.2413211, 1.462372, 1, 0, 0, 1, 1,
0.4784179, -0.2398166, 1.973266, 1, 0, 0, 1, 1,
0.4812297, 1.332685, 0.1509798, 1, 0, 0, 1, 1,
0.4837813, -1.277209, 4.231717, 0, 0, 0, 1, 1,
0.4842899, -0.6142704, 1.479484, 0, 0, 0, 1, 1,
0.4848734, 0.9915, -0.1675366, 0, 0, 0, 1, 1,
0.4885334, -0.1778187, 3.048833, 0, 0, 0, 1, 1,
0.4912904, -0.4541633, 1.80264, 0, 0, 0, 1, 1,
0.4983516, 1.184757, 0.8519206, 0, 0, 0, 1, 1,
0.502162, -0.277918, 1.628413, 0, 0, 0, 1, 1,
0.5055287, 0.471651, 0.06717477, 1, 1, 1, 1, 1,
0.5204789, -0.9497803, 1.944763, 1, 1, 1, 1, 1,
0.5224941, 0.2819446, 0.636656, 1, 1, 1, 1, 1,
0.522847, 2.492849, 1.915101, 1, 1, 1, 1, 1,
0.5273824, -0.3436717, 1.470902, 1, 1, 1, 1, 1,
0.5386781, -1.648038, 4.783152, 1, 1, 1, 1, 1,
0.5428779, 0.9858249, -0.1833178, 1, 1, 1, 1, 1,
0.5459711, 0.1632313, -0.5188178, 1, 1, 1, 1, 1,
0.5516094, 0.9435175, 1.394004, 1, 1, 1, 1, 1,
0.5543153, -1.023981, 3.37792, 1, 1, 1, 1, 1,
0.5621408, 0.06220676, 1.576116, 1, 1, 1, 1, 1,
0.565585, -1.844605, 2.326575, 1, 1, 1, 1, 1,
0.5659003, 0.6279698, 0.7010506, 1, 1, 1, 1, 1,
0.571974, -1.347523, 3.800906, 1, 1, 1, 1, 1,
0.5738517, 0.16394, 1.11728, 1, 1, 1, 1, 1,
0.5749543, -0.08783446, 0.9335199, 0, 0, 1, 1, 1,
0.5758057, -0.1350437, 1.250373, 1, 0, 0, 1, 1,
0.5761582, 2.353441, 0.07525603, 1, 0, 0, 1, 1,
0.579142, 0.6151336, 1.139919, 1, 0, 0, 1, 1,
0.5796345, 1.256677, 0.9732288, 1, 0, 0, 1, 1,
0.5862052, -1.04104, 2.347597, 1, 0, 0, 1, 1,
0.5907506, 0.8102164, -0.1112716, 0, 0, 0, 1, 1,
0.5920042, -0.02113924, 1.40945, 0, 0, 0, 1, 1,
0.5931956, -0.7605649, 3.679842, 0, 0, 0, 1, 1,
0.5954064, 0.2471602, 0.592905, 0, 0, 0, 1, 1,
0.5982194, 0.365108, 0.9913883, 0, 0, 0, 1, 1,
0.5985216, 0.8612527, 0.7530163, 0, 0, 0, 1, 1,
0.6033044, -0.6838076, 2.748236, 0, 0, 0, 1, 1,
0.6056673, 0.5022147, 0.9811723, 1, 1, 1, 1, 1,
0.6095517, 0.8697674, 1.675263, 1, 1, 1, 1, 1,
0.6134401, 1.113892, 0.4156013, 1, 1, 1, 1, 1,
0.6158, 0.5764565, 2.504628, 1, 1, 1, 1, 1,
0.6175876, 1.950347, 0.2592765, 1, 1, 1, 1, 1,
0.6188844, 0.8936759, 1.089737, 1, 1, 1, 1, 1,
0.6190997, 0.4897543, 0.5676491, 1, 1, 1, 1, 1,
0.6194396, 2.343661, 1.214134, 1, 1, 1, 1, 1,
0.6312938, -1.626018, 2.625496, 1, 1, 1, 1, 1,
0.6321585, 1.089501, 1.048783, 1, 1, 1, 1, 1,
0.6333691, 0.2930771, 2.369835, 1, 1, 1, 1, 1,
0.635199, 2.238648, 0.6096978, 1, 1, 1, 1, 1,
0.636632, 1.105126, 0.6260575, 1, 1, 1, 1, 1,
0.6373082, 1.409211, -0.05747033, 1, 1, 1, 1, 1,
0.6373827, -0.6404318, 3.003998, 1, 1, 1, 1, 1,
0.6427976, 1.111636, -0.7156245, 0, 0, 1, 1, 1,
0.6437017, 1.296333, -0.04961376, 1, 0, 0, 1, 1,
0.6488028, -0.1133771, 0.8784022, 1, 0, 0, 1, 1,
0.6493211, 1.816304, 2.361156, 1, 0, 0, 1, 1,
0.650422, -1.216917, 2.055386, 1, 0, 0, 1, 1,
0.6525632, 0.735872, 0.1351982, 1, 0, 0, 1, 1,
0.6526936, 0.7373412, 0.1419642, 0, 0, 0, 1, 1,
0.6534977, 1.935328, 0.5660118, 0, 0, 0, 1, 1,
0.6635042, -0.1354211, 1.698922, 0, 0, 0, 1, 1,
0.663617, -1.050643, 2.479733, 0, 0, 0, 1, 1,
0.6636382, 2.039532, 0.758998, 0, 0, 0, 1, 1,
0.6661988, -1.625876, 2.290376, 0, 0, 0, 1, 1,
0.6737536, -1.806441, 4.195771, 0, 0, 0, 1, 1,
0.6767197, 0.3781804, 2.944817, 1, 1, 1, 1, 1,
0.6847845, 0.1524853, 0.5266936, 1, 1, 1, 1, 1,
0.6906949, 2.356092, 0.5407559, 1, 1, 1, 1, 1,
0.6910535, 0.2228481, 2.082457, 1, 1, 1, 1, 1,
0.6952896, -1.432271, 2.407954, 1, 1, 1, 1, 1,
0.7006491, 0.2489653, 1.845466, 1, 1, 1, 1, 1,
0.7019673, -1.308636, 2.932688, 1, 1, 1, 1, 1,
0.7029261, -0.3576809, 1.718203, 1, 1, 1, 1, 1,
0.7082224, 0.7559574, 0.1018039, 1, 1, 1, 1, 1,
0.7101938, 0.4777103, 1.267328, 1, 1, 1, 1, 1,
0.7114833, -1.433108, 2.381429, 1, 1, 1, 1, 1,
0.7122905, -2.162874, 2.768385, 1, 1, 1, 1, 1,
0.7137749, 0.4064258, -0.4030685, 1, 1, 1, 1, 1,
0.7232701, 0.7617065, -0.08695658, 1, 1, 1, 1, 1,
0.7250342, 0.4253051, 1.001383, 1, 1, 1, 1, 1,
0.7252052, 0.4584451, 2.026528, 0, 0, 1, 1, 1,
0.7255679, -0.1765979, 1.656096, 1, 0, 0, 1, 1,
0.7260985, -0.02659828, 1.480017, 1, 0, 0, 1, 1,
0.7264406, 0.1906351, 2.526099, 1, 0, 0, 1, 1,
0.7297144, 1.361609, 0.4732962, 1, 0, 0, 1, 1,
0.7336727, 1.549307, -0.8572727, 1, 0, 0, 1, 1,
0.737974, 2.152639, 0.6148292, 0, 0, 0, 1, 1,
0.7435594, -0.5777878, 1.499517, 0, 0, 0, 1, 1,
0.7455473, 0.324541, 2.046236, 0, 0, 0, 1, 1,
0.7455882, 0.2673199, 1.598139, 0, 0, 0, 1, 1,
0.7490363, 0.9497802, 0.1359765, 0, 0, 0, 1, 1,
0.7492065, 0.0042063, 2.102421, 0, 0, 0, 1, 1,
0.7568741, -0.1888709, 1.82495, 0, 0, 0, 1, 1,
0.7598296, 0.5076396, 1.502047, 1, 1, 1, 1, 1,
0.7645496, -0.05850679, 3.145861, 1, 1, 1, 1, 1,
0.7663876, -1.942633, 2.849453, 1, 1, 1, 1, 1,
0.7679627, 0.3338853, 0.6740193, 1, 1, 1, 1, 1,
0.7679685, -0.6945583, 2.856843, 1, 1, 1, 1, 1,
0.7772607, 0.1559774, 2.833318, 1, 1, 1, 1, 1,
0.7798619, -0.899644, 2.433356, 1, 1, 1, 1, 1,
0.780577, 2.004372, -0.152212, 1, 1, 1, 1, 1,
0.7975292, -0.7191033, 2.864292, 1, 1, 1, 1, 1,
0.8043607, -1.749316, 5.732162, 1, 1, 1, 1, 1,
0.8100817, -0.02727714, 0.7496162, 1, 1, 1, 1, 1,
0.8202344, -0.9206905, 1.393918, 1, 1, 1, 1, 1,
0.8209372, 0.0149516, 1.600214, 1, 1, 1, 1, 1,
0.8263267, 0.1130352, 1.178424, 1, 1, 1, 1, 1,
0.8292341, -0.2705716, 1.619236, 1, 1, 1, 1, 1,
0.8300443, 0.05825767, -0.1708023, 0, 0, 1, 1, 1,
0.8396451, -0.7301748, 1.45285, 1, 0, 0, 1, 1,
0.8406373, -0.06042904, 3.625971, 1, 0, 0, 1, 1,
0.8410134, -0.353459, 2.931444, 1, 0, 0, 1, 1,
0.842952, 0.1452642, 1.2742, 1, 0, 0, 1, 1,
0.846249, -0.06456459, 2.23025, 1, 0, 0, 1, 1,
0.8521068, -1.326737, 3.115307, 0, 0, 0, 1, 1,
0.8551871, -1.046396, 0.2557368, 0, 0, 0, 1, 1,
0.8567627, -0.5844389, 1.558416, 0, 0, 0, 1, 1,
0.8596216, 0.6998444, 0.7365685, 0, 0, 0, 1, 1,
0.8609271, 0.6120088, -0.303667, 0, 0, 0, 1, 1,
0.8618463, 0.8228601, 0.2470793, 0, 0, 0, 1, 1,
0.8623659, 0.3842553, -0.188971, 0, 0, 0, 1, 1,
0.8633955, 0.8347244, 2.09987, 1, 1, 1, 1, 1,
0.8672467, 1.581968, 0.5370404, 1, 1, 1, 1, 1,
0.8732849, 0.522615, 1.926084, 1, 1, 1, 1, 1,
0.8742679, 0.8757318, 0.7391988, 1, 1, 1, 1, 1,
0.876741, -0.7702782, 4.205365, 1, 1, 1, 1, 1,
0.8778552, 0.5082251, 0.2777863, 1, 1, 1, 1, 1,
0.8805249, -1.309662, 3.268664, 1, 1, 1, 1, 1,
0.8864998, 0.3289054, 1.22215, 1, 1, 1, 1, 1,
0.8870023, -0.1039966, 2.819517, 1, 1, 1, 1, 1,
0.8903005, -1.280178, 2.587298, 1, 1, 1, 1, 1,
0.8905803, 0.2603682, 0.5529891, 1, 1, 1, 1, 1,
0.8952442, -1.905077, 2.192506, 1, 1, 1, 1, 1,
0.8963546, 1.835693, 0.9970687, 1, 1, 1, 1, 1,
0.9257063, -1.404652, 2.270766, 1, 1, 1, 1, 1,
0.9264823, 1.460895, -0.0529202, 1, 1, 1, 1, 1,
0.9311694, 0.7482589, -0.1117222, 0, 0, 1, 1, 1,
0.9348689, -0.6261781, 2.97949, 1, 0, 0, 1, 1,
0.935318, -0.06800342, 3.390492, 1, 0, 0, 1, 1,
0.9366993, -1.280045, 0.781712, 1, 0, 0, 1, 1,
0.9370069, -2.011567, 1.258845, 1, 0, 0, 1, 1,
0.9395906, 0.6978024, 1.721955, 1, 0, 0, 1, 1,
0.9430659, 0.1009053, 1.114001, 0, 0, 0, 1, 1,
0.9479404, -0.6267995, 0.5832382, 0, 0, 0, 1, 1,
0.9514256, 2.577848, 1.465511, 0, 0, 0, 1, 1,
0.9573847, -0.6611078, 3.062539, 0, 0, 0, 1, 1,
0.9731203, -0.1244928, 2.3937, 0, 0, 0, 1, 1,
0.9751561, 0.8444808, 1.642066, 0, 0, 0, 1, 1,
0.9782564, 0.4389471, 0.9632646, 0, 0, 0, 1, 1,
0.9784113, 0.4385183, 2.165159, 1, 1, 1, 1, 1,
0.9809272, -0.07315296, 2.538737, 1, 1, 1, 1, 1,
0.9869656, 0.634392, -0.2382051, 1, 1, 1, 1, 1,
0.9900181, 0.07835326, 2.173204, 1, 1, 1, 1, 1,
0.9943132, 0.1987965, -0.02916899, 1, 1, 1, 1, 1,
1.005329, 1.768255, -0.6509664, 1, 1, 1, 1, 1,
1.009196, 0.2904772, 2.061299, 1, 1, 1, 1, 1,
1.011095, -1.14705, 1.404874, 1, 1, 1, 1, 1,
1.011437, 0.3636759, 1.730071, 1, 1, 1, 1, 1,
1.012234, 1.17471, 0.9458836, 1, 1, 1, 1, 1,
1.01898, -0.1069655, 0.6778272, 1, 1, 1, 1, 1,
1.020539, -0.1133914, 2.853744, 1, 1, 1, 1, 1,
1.023054, -0.9902189, 2.447708, 1, 1, 1, 1, 1,
1.025104, -0.5043395, 0.06546754, 1, 1, 1, 1, 1,
1.029702, 0.5152289, 2.507186, 1, 1, 1, 1, 1,
1.035807, -0.02309323, -0.3165858, 0, 0, 1, 1, 1,
1.040538, -0.4077558, 0.1634066, 1, 0, 0, 1, 1,
1.040828, -0.4499415, 0.5360404, 1, 0, 0, 1, 1,
1.044946, 2.156087, 1.102185, 1, 0, 0, 1, 1,
1.046842, -0.5699267, 3.607434, 1, 0, 0, 1, 1,
1.054986, -0.4113567, 1.515774, 1, 0, 0, 1, 1,
1.057347, 0.8223132, 2.045503, 0, 0, 0, 1, 1,
1.06295, -1.289331, 2.052595, 0, 0, 0, 1, 1,
1.065403, -0.1329603, 1.068621, 0, 0, 0, 1, 1,
1.066342, 1.38975, 1.632026, 0, 0, 0, 1, 1,
1.070955, 0.5545927, 2.500254, 0, 0, 0, 1, 1,
1.076833, -0.7126332, 2.275897, 0, 0, 0, 1, 1,
1.077955, 0.4800841, 1.391945, 0, 0, 0, 1, 1,
1.08266, -0.3597935, 2.057157, 1, 1, 1, 1, 1,
1.102888, 0.08143128, 1.267208, 1, 1, 1, 1, 1,
1.105471, 0.3792802, 1.664153, 1, 1, 1, 1, 1,
1.108202, -0.2765131, 1.712468, 1, 1, 1, 1, 1,
1.108322, -0.5964448, 2.357408, 1, 1, 1, 1, 1,
1.108458, -1.480933, 1.325447, 1, 1, 1, 1, 1,
1.115006, 0.2816255, 0.6187398, 1, 1, 1, 1, 1,
1.122055, -0.9205686, 2.980122, 1, 1, 1, 1, 1,
1.124416, 0.9438074, -0.1921259, 1, 1, 1, 1, 1,
1.12669, 0.6150674, 1.287678, 1, 1, 1, 1, 1,
1.128655, 0.008201422, 1.99718, 1, 1, 1, 1, 1,
1.131887, 1.284552, 0.459153, 1, 1, 1, 1, 1,
1.137152, -0.5843835, 2.27719, 1, 1, 1, 1, 1,
1.139069, -0.05235315, 1.978133, 1, 1, 1, 1, 1,
1.141154, 0.663917, 1.037544, 1, 1, 1, 1, 1,
1.147015, -1.03542, 2.540432, 0, 0, 1, 1, 1,
1.153647, 0.4955881, 1.070418, 1, 0, 0, 1, 1,
1.155134, -0.9920726, 0.1329082, 1, 0, 0, 1, 1,
1.164733, 0.06077459, 3.008794, 1, 0, 0, 1, 1,
1.166013, 1.283536, -0.2333606, 1, 0, 0, 1, 1,
1.170261, -0.878872, 3.858812, 1, 0, 0, 1, 1,
1.170743, -0.260001, 0.8105068, 0, 0, 0, 1, 1,
1.175119, -0.1163827, 1.066166, 0, 0, 0, 1, 1,
1.175172, 0.05262168, 2.531799, 0, 0, 0, 1, 1,
1.178095, 1.686347, 1.225636, 0, 0, 0, 1, 1,
1.18456, -0.3868591, 2.755759, 0, 0, 0, 1, 1,
1.188303, 0.335394, 1.134366, 0, 0, 0, 1, 1,
1.192992, 0.2759105, 2.578497, 0, 0, 0, 1, 1,
1.200057, 0.2832107, 1.812146, 1, 1, 1, 1, 1,
1.226623, 1.948256, 1.632077, 1, 1, 1, 1, 1,
1.228269, -2.06319, 2.991383, 1, 1, 1, 1, 1,
1.238513, -1.572772, 1.663098, 1, 1, 1, 1, 1,
1.241971, 1.447705, 1.371185, 1, 1, 1, 1, 1,
1.243909, -1.342422, 1.989057, 1, 1, 1, 1, 1,
1.246981, 1.610409, 2.50228, 1, 1, 1, 1, 1,
1.246993, 0.3938931, 0.3957613, 1, 1, 1, 1, 1,
1.248506, -0.05240481, 2.051253, 1, 1, 1, 1, 1,
1.249177, 0.08501721, 0.9268315, 1, 1, 1, 1, 1,
1.250647, 0.4914477, -0.09948912, 1, 1, 1, 1, 1,
1.257994, 0.1686413, 1.252841, 1, 1, 1, 1, 1,
1.265042, 2.604763, -0.001394883, 1, 1, 1, 1, 1,
1.273711, -1.013014, 1.660346, 1, 1, 1, 1, 1,
1.275701, 1.339223, 0.1747387, 1, 1, 1, 1, 1,
1.275706, 1.061276, 1.400592, 0, 0, 1, 1, 1,
1.276212, 0.5719616, 2.921101, 1, 0, 0, 1, 1,
1.281128, -0.1454294, 1.671062, 1, 0, 0, 1, 1,
1.284021, 0.9509563, 0.3620661, 1, 0, 0, 1, 1,
1.286305, 0.07310937, 2.165928, 1, 0, 0, 1, 1,
1.286874, 0.7779099, 0.9495733, 1, 0, 0, 1, 1,
1.293221, -0.5439058, 2.300783, 0, 0, 0, 1, 1,
1.293312, -0.2708057, 2.203698, 0, 0, 0, 1, 1,
1.297033, 0.8847637, 1.29276, 0, 0, 0, 1, 1,
1.298025, 0.2864846, 1.038748, 0, 0, 0, 1, 1,
1.30299, 0.7358302, 0.6076964, 0, 0, 0, 1, 1,
1.30637, -1.878127, 3.580851, 0, 0, 0, 1, 1,
1.329599, 0.335343, 1.02112, 0, 0, 0, 1, 1,
1.335125, 0.9729021, 2.523651, 1, 1, 1, 1, 1,
1.339363, -0.7951552, 2.107325, 1, 1, 1, 1, 1,
1.353488, -1.408362, 3.184455, 1, 1, 1, 1, 1,
1.38285, 2.503584, 0.4627273, 1, 1, 1, 1, 1,
1.399789, -0.6445342, 1.594854, 1, 1, 1, 1, 1,
1.399804, -0.5879621, 2.858357, 1, 1, 1, 1, 1,
1.404251, 0.008670464, 1.783564, 1, 1, 1, 1, 1,
1.415132, -1.717626, 1.545163, 1, 1, 1, 1, 1,
1.415152, 0.5316766, -1.115242, 1, 1, 1, 1, 1,
1.429537, 0.144311, 0.9821849, 1, 1, 1, 1, 1,
1.438075, -1.29933, 1.406848, 1, 1, 1, 1, 1,
1.438301, 0.7274385, 1.373608, 1, 1, 1, 1, 1,
1.439217, -0.2962454, 2.871, 1, 1, 1, 1, 1,
1.448396, -0.4095575, 1.14792, 1, 1, 1, 1, 1,
1.44844, 0.508512, 1.897358, 1, 1, 1, 1, 1,
1.452619, 0.3032053, 2.367539, 0, 0, 1, 1, 1,
1.460165, -0.4544418, 2.336322, 1, 0, 0, 1, 1,
1.463962, 0.3541897, 1.120653, 1, 0, 0, 1, 1,
1.478591, 1.075314, 2.445244, 1, 0, 0, 1, 1,
1.483099, 1.10392, 1.971968, 1, 0, 0, 1, 1,
1.48993, 0.3744916, 1.930324, 1, 0, 0, 1, 1,
1.49631, -0.2050151, 1.972243, 0, 0, 0, 1, 1,
1.496886, 2.525846, 3.470145, 0, 0, 0, 1, 1,
1.498248, -0.6026422, 3.77685, 0, 0, 0, 1, 1,
1.49954, 1.233945, 1.738918, 0, 0, 0, 1, 1,
1.508877, -2.11618, 2.476007, 0, 0, 0, 1, 1,
1.509818, 1.300719, 2.489586, 0, 0, 0, 1, 1,
1.511013, 0.4168388, 2.754596, 0, 0, 0, 1, 1,
1.511393, 1.899065, -0.536535, 1, 1, 1, 1, 1,
1.513651, -0.3036565, 2.724184, 1, 1, 1, 1, 1,
1.533705, 0.1286007, 0.2010319, 1, 1, 1, 1, 1,
1.537056, -0.2144362, 0.3090763, 1, 1, 1, 1, 1,
1.546076, -0.1126255, 3.421342, 1, 1, 1, 1, 1,
1.552511, 0.3301422, 3.656025, 1, 1, 1, 1, 1,
1.553103, 0.2473742, 1.599677, 1, 1, 1, 1, 1,
1.557125, -0.5482624, 4.077796, 1, 1, 1, 1, 1,
1.560979, -1.324633, 3.445007, 1, 1, 1, 1, 1,
1.568553, -0.1969598, 1.528722, 1, 1, 1, 1, 1,
1.597491, -0.6668239, 2.924138, 1, 1, 1, 1, 1,
1.601938, -0.1991918, 1.026269, 1, 1, 1, 1, 1,
1.608867, -1.297461, 2.881241, 1, 1, 1, 1, 1,
1.623182, 0.3528065, 1.126224, 1, 1, 1, 1, 1,
1.643953, -0.1345322, 1.811776, 1, 1, 1, 1, 1,
1.668345, 0.1298086, 1.373609, 0, 0, 1, 1, 1,
1.67241, 0.02537757, 3.161221, 1, 0, 0, 1, 1,
1.682421, 2.572037, 1.895247, 1, 0, 0, 1, 1,
1.684597, 1.383899, 1.146737, 1, 0, 0, 1, 1,
1.685467, 1.391413, 1.70527, 1, 0, 0, 1, 1,
1.690683, 0.9387123, 2.113466, 1, 0, 0, 1, 1,
1.693556, -0.1861556, 1.590703, 0, 0, 0, 1, 1,
1.702646, -0.5611433, 2.948989, 0, 0, 0, 1, 1,
1.720678, -0.2303911, 0.9256061, 0, 0, 0, 1, 1,
1.742689, -1.578182, 3.397328, 0, 0, 0, 1, 1,
1.755975, -0.1882423, 0.01878036, 0, 0, 0, 1, 1,
1.765166, 2.113538, 0.310894, 0, 0, 0, 1, 1,
1.766498, -0.639657, 2.163772, 0, 0, 0, 1, 1,
1.769623, -0.5551495, 2.011167, 1, 1, 1, 1, 1,
1.771301, 0.5098224, 1.598937, 1, 1, 1, 1, 1,
1.78456, -0.03505629, 2.567622, 1, 1, 1, 1, 1,
1.836254, 0.1283615, 0.9607754, 1, 1, 1, 1, 1,
1.841582, 0.001675972, 2.852431, 1, 1, 1, 1, 1,
1.876649, 0.6173187, 2.912493, 1, 1, 1, 1, 1,
1.876933, 0.1492814, 1.102944, 1, 1, 1, 1, 1,
1.890065, 0.9383191, 0.9390696, 1, 1, 1, 1, 1,
1.905347, -0.4555798, 3.39045, 1, 1, 1, 1, 1,
1.925109, 1.722206, 0.5432895, 1, 1, 1, 1, 1,
1.93481, 0.6619759, 0.9893644, 1, 1, 1, 1, 1,
1.940841, 0.9287924, 2.401363, 1, 1, 1, 1, 1,
1.9477, 0.03872695, 2.772084, 1, 1, 1, 1, 1,
1.95205, -0.4418754, 0.3278181, 1, 1, 1, 1, 1,
1.995089, -1.249971, 2.081464, 1, 1, 1, 1, 1,
2.008307, 1.567295, 0.6870663, 0, 0, 1, 1, 1,
2.018891, -0.8930396, 3.718816, 1, 0, 0, 1, 1,
2.028097, 0.8885475, 1.536298, 1, 0, 0, 1, 1,
2.04384, 0.06935316, 2.252562, 1, 0, 0, 1, 1,
2.141116, -0.2253647, 1.441893, 1, 0, 0, 1, 1,
2.169557, -1.47463, 1.48949, 1, 0, 0, 1, 1,
2.221018, -0.4336567, -0.01001993, 0, 0, 0, 1, 1,
2.240262, 0.9147683, 1.365296, 0, 0, 0, 1, 1,
2.266139, 0.1826721, 2.0044, 0, 0, 0, 1, 1,
2.313188, -0.05206887, 0.6920094, 0, 0, 0, 1, 1,
2.31495, -0.8167117, 2.926259, 0, 0, 0, 1, 1,
2.328959, 0.9675509, 1.31428, 0, 0, 0, 1, 1,
2.444292, -0.07985551, 0.9990374, 0, 0, 0, 1, 1,
2.460899, -1.62208, 2.011426, 1, 1, 1, 1, 1,
2.465879, 0.4631248, 1.498501, 1, 1, 1, 1, 1,
2.486377, -0.1091286, -0.3795996, 1, 1, 1, 1, 1,
2.600585, -1.029823, 2.288029, 1, 1, 1, 1, 1,
2.722235, -0.0002224283, 4.275457, 1, 1, 1, 1, 1,
2.817378, -0.9942997, 0.3709396, 1, 1, 1, 1, 1,
3.376361, -0.03422394, 1.739588, 1, 1, 1, 1, 1
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
var radius = 9.67707;
var distance = 33.9903;
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
mvMatrix.translate( -0.2632964, 0.2914367, -0.1776366 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.9903);
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
