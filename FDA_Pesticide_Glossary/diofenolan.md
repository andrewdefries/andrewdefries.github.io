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
-3.643801, -0.1776099, -0.5381645, 1, 0, 0, 1,
-2.98901, 1.275659, -1.417765, 1, 0.007843138, 0, 1,
-2.82439, -1.234922, -3.908871, 1, 0.01176471, 0, 1,
-2.789514, -0.002829011, 0.9766162, 1, 0.01960784, 0, 1,
-2.782349, 0.4211705, -0.3737816, 1, 0.02352941, 0, 1,
-2.742051, -0.2912048, -2.381563, 1, 0.03137255, 0, 1,
-2.667492, -0.2292136, -1.422183, 1, 0.03529412, 0, 1,
-2.624185, -1.592129, -2.14467, 1, 0.04313726, 0, 1,
-2.518308, -0.8577638, -0.584475, 1, 0.04705882, 0, 1,
-2.492613, -0.1512069, -1.250168, 1, 0.05490196, 0, 1,
-2.427591, 0.9449276, -0.3374268, 1, 0.05882353, 0, 1,
-2.39369, -0.6264877, -1.953618, 1, 0.06666667, 0, 1,
-2.371336, 1.588763, 0.4843288, 1, 0.07058824, 0, 1,
-2.338003, -1.12953, -2.510007, 1, 0.07843138, 0, 1,
-2.284865, 1.82573, -2.800694, 1, 0.08235294, 0, 1,
-2.191883, 0.3673581, 0.7527782, 1, 0.09019608, 0, 1,
-2.182162, 1.54125, 0.3435309, 1, 0.09411765, 0, 1,
-2.153067, 1.817976, -2.559504, 1, 0.1019608, 0, 1,
-2.068264, 0.5250924, -1.405827, 1, 0.1098039, 0, 1,
-2.065287, -2.045464, -2.767064, 1, 0.1137255, 0, 1,
-2.059442, 0.9394981, -2.512929, 1, 0.1215686, 0, 1,
-2.009967, -0.111072, -2.425135, 1, 0.1254902, 0, 1,
-1.998447, 0.4123752, -0.903394, 1, 0.1333333, 0, 1,
-1.989689, -0.5578224, -3.722744, 1, 0.1372549, 0, 1,
-1.988427, -2.428206, -1.791913, 1, 0.145098, 0, 1,
-1.919657, 0.3066299, -1.541932, 1, 0.1490196, 0, 1,
-1.862809, 0.4364168, -1.983397, 1, 0.1568628, 0, 1,
-1.807783, -0.01874879, -2.258475, 1, 0.1607843, 0, 1,
-1.7966, -0.6574367, -1.524931, 1, 0.1686275, 0, 1,
-1.777568, 4.417357, 1.010204, 1, 0.172549, 0, 1,
-1.767311, -2.836309, -2.244777, 1, 0.1803922, 0, 1,
-1.764481, 0.3602089, -0.5657079, 1, 0.1843137, 0, 1,
-1.763246, 3.009707, -1.050204, 1, 0.1921569, 0, 1,
-1.760573, -0.554087, -2.369841, 1, 0.1960784, 0, 1,
-1.747622, 1.485681, -2.199559, 1, 0.2039216, 0, 1,
-1.744349, -1.149205, -2.609206, 1, 0.2117647, 0, 1,
-1.742148, -0.4235498, -3.693448, 1, 0.2156863, 0, 1,
-1.724654, -1.291064, -2.686957, 1, 0.2235294, 0, 1,
-1.722432, -0.3290871, -2.157574, 1, 0.227451, 0, 1,
-1.722388, 0.249556, -0.9965805, 1, 0.2352941, 0, 1,
-1.719851, -0.6899567, -2.778251, 1, 0.2392157, 0, 1,
-1.719014, -1.310032, -3.461539, 1, 0.2470588, 0, 1,
-1.701347, -1.537708, -1.534446, 1, 0.2509804, 0, 1,
-1.688604, 1.727402, 0.01263301, 1, 0.2588235, 0, 1,
-1.686881, 0.4180591, -1.034049, 1, 0.2627451, 0, 1,
-1.684517, -1.040801, -2.905851, 1, 0.2705882, 0, 1,
-1.671562, 1.914243, -1.962971, 1, 0.2745098, 0, 1,
-1.651429, 1.260908, -0.5680795, 1, 0.282353, 0, 1,
-1.641702, 0.5417337, -1.021291, 1, 0.2862745, 0, 1,
-1.638431, -1.496564, -3.263825, 1, 0.2941177, 0, 1,
-1.613164, -2.500116, -0.7741473, 1, 0.3019608, 0, 1,
-1.608706, -0.1319993, -1.904308, 1, 0.3058824, 0, 1,
-1.608583, -0.7537107, -2.1256, 1, 0.3137255, 0, 1,
-1.597937, 1.111845, -2.462787, 1, 0.3176471, 0, 1,
-1.559718, 0.3473975, -1.195747, 1, 0.3254902, 0, 1,
-1.550486, 0.9506738, -2.339475, 1, 0.3294118, 0, 1,
-1.546091, -1.11605, -2.060135, 1, 0.3372549, 0, 1,
-1.545428, 1.290502, -0.1819763, 1, 0.3411765, 0, 1,
-1.543686, 0.313199, -1.371631, 1, 0.3490196, 0, 1,
-1.52291, 0.1260447, -2.575429, 1, 0.3529412, 0, 1,
-1.519963, 0.4958612, -0.2588703, 1, 0.3607843, 0, 1,
-1.504066, 0.1402768, -1.71655, 1, 0.3647059, 0, 1,
-1.498564, -0.3213079, -2.037796, 1, 0.372549, 0, 1,
-1.491291, 0.1880541, 0.3313776, 1, 0.3764706, 0, 1,
-1.490525, -1.497502, -0.6091052, 1, 0.3843137, 0, 1,
-1.489054, 0.2044357, -2.178437, 1, 0.3882353, 0, 1,
-1.476478, -2.008683, -3.585933, 1, 0.3960784, 0, 1,
-1.462303, -2.061987, -2.540916, 1, 0.4039216, 0, 1,
-1.461337, -1.184273, -3.304756, 1, 0.4078431, 0, 1,
-1.460508, 0.4152571, -0.3109762, 1, 0.4156863, 0, 1,
-1.457494, -0.5423198, -0.5179022, 1, 0.4196078, 0, 1,
-1.452028, 0.2679524, -1.038087, 1, 0.427451, 0, 1,
-1.447899, 1.729033, -1.026098, 1, 0.4313726, 0, 1,
-1.44196, 0.8461172, -0.2320949, 1, 0.4392157, 0, 1,
-1.434684, 1.32277, -0.5104018, 1, 0.4431373, 0, 1,
-1.428422, 0.5435105, -0.6863643, 1, 0.4509804, 0, 1,
-1.40854, -1.412465, -1.950611, 1, 0.454902, 0, 1,
-1.388278, -0.4795961, -0.5632128, 1, 0.4627451, 0, 1,
-1.364001, -0.7124503, -1.267541, 1, 0.4666667, 0, 1,
-1.362077, 0.185735, 0.6881353, 1, 0.4745098, 0, 1,
-1.352207, -0.3690748, -2.342654, 1, 0.4784314, 0, 1,
-1.350414, 1.091155, -0.5350339, 1, 0.4862745, 0, 1,
-1.346857, 0.5354276, -0.7169765, 1, 0.4901961, 0, 1,
-1.339447, -0.3859289, -2.055678, 1, 0.4980392, 0, 1,
-1.332846, -0.9938655, -0.6407356, 1, 0.5058824, 0, 1,
-1.328025, 0.1614757, -2.527071, 1, 0.509804, 0, 1,
-1.318857, 1.40011, -0.776049, 1, 0.5176471, 0, 1,
-1.318137, -0.006844524, -1.09367, 1, 0.5215687, 0, 1,
-1.31392, -2.226273, -1.355654, 1, 0.5294118, 0, 1,
-1.30027, -0.6773528, -1.143405, 1, 0.5333334, 0, 1,
-1.298542, 0.3778708, -0.6652855, 1, 0.5411765, 0, 1,
-1.293364, 0.1107146, -0.7030261, 1, 0.5450981, 0, 1,
-1.291975, -0.7919915, -1.310456, 1, 0.5529412, 0, 1,
-1.291065, 0.9579282, -1.318295, 1, 0.5568628, 0, 1,
-1.28745, -0.5274097, -0.1842101, 1, 0.5647059, 0, 1,
-1.287252, 0.4674842, -2.036947, 1, 0.5686275, 0, 1,
-1.284757, -0.2498176, -1.471541, 1, 0.5764706, 0, 1,
-1.273494, 0.6430389, -3.072822, 1, 0.5803922, 0, 1,
-1.27106, 0.878062, -2.276104, 1, 0.5882353, 0, 1,
-1.246968, 0.9155582, -1.299274, 1, 0.5921569, 0, 1,
-1.23591, -0.4902102, -2.360176, 1, 0.6, 0, 1,
-1.233898, 1.372441, 1.98722, 1, 0.6078432, 0, 1,
-1.232258, -0.4034342, -2.68964, 1, 0.6117647, 0, 1,
-1.226609, -0.2630164, -2.185347, 1, 0.6196079, 0, 1,
-1.21314, 0.4040543, 0.4054416, 1, 0.6235294, 0, 1,
-1.211004, -0.8063045, -2.711224, 1, 0.6313726, 0, 1,
-1.209901, 0.7213885, -0.3012867, 1, 0.6352941, 0, 1,
-1.209527, -0.6120147, 0.7821591, 1, 0.6431373, 0, 1,
-1.198563, 1.22214, -0.6187475, 1, 0.6470588, 0, 1,
-1.197932, -0.04483002, -0.3418581, 1, 0.654902, 0, 1,
-1.197166, -0.6416298, -1.601645, 1, 0.6588235, 0, 1,
-1.196764, 0.7621727, -1.154283, 1, 0.6666667, 0, 1,
-1.193107, 0.2704111, 0.2636931, 1, 0.6705883, 0, 1,
-1.19231, -0.2713609, -1.674455, 1, 0.6784314, 0, 1,
-1.192206, -1.697477, -2.138941, 1, 0.682353, 0, 1,
-1.182708, 1.582037, 0.2525177, 1, 0.6901961, 0, 1,
-1.179094, -1.004787, -2.065387, 1, 0.6941177, 0, 1,
-1.173604, -0.6154212, -2.297256, 1, 0.7019608, 0, 1,
-1.161612, -0.3790483, -2.791708, 1, 0.7098039, 0, 1,
-1.151395, -1.316828, 0.3465865, 1, 0.7137255, 0, 1,
-1.146107, -0.5657708, -0.5991769, 1, 0.7215686, 0, 1,
-1.139197, 0.8617113, -1.446391, 1, 0.7254902, 0, 1,
-1.133394, 0.9929889, -0.2451844, 1, 0.7333333, 0, 1,
-1.125121, -0.2103622, -1.993861, 1, 0.7372549, 0, 1,
-1.119655, -0.2653638, -2.375465, 1, 0.7450981, 0, 1,
-1.118346, -0.3175596, -3.076174, 1, 0.7490196, 0, 1,
-1.096406, -0.5333325, -1.058887, 1, 0.7568628, 0, 1,
-1.0925, 1.563985, -0.1657751, 1, 0.7607843, 0, 1,
-1.079911, -0.09118497, 0.6026619, 1, 0.7686275, 0, 1,
-1.079216, -0.08074284, -1.74523, 1, 0.772549, 0, 1,
-1.0764, 0.3612365, -1.344445, 1, 0.7803922, 0, 1,
-1.074669, 0.5545957, -2.181877, 1, 0.7843137, 0, 1,
-1.068495, -2.647257, -3.295427, 1, 0.7921569, 0, 1,
-1.065562, -1.412938, -2.767163, 1, 0.7960784, 0, 1,
-1.062599, 1.515077, -0.03817225, 1, 0.8039216, 0, 1,
-1.056906, -0.7071916, -4.067818, 1, 0.8117647, 0, 1,
-1.051571, -0.9095373, -2.786926, 1, 0.8156863, 0, 1,
-1.049237, 1.442744, -1.3903, 1, 0.8235294, 0, 1,
-1.043933, 1.06021, -0.8219864, 1, 0.827451, 0, 1,
-1.031748, 1.014145, -0.5321172, 1, 0.8352941, 0, 1,
-1.024392, 0.8434615, -0.2144841, 1, 0.8392157, 0, 1,
-1.019031, 0.3205653, -0.2183816, 1, 0.8470588, 0, 1,
-1.011224, 0.2762838, -1.133277, 1, 0.8509804, 0, 1,
-1.008837, 2.240496, -0.8004213, 1, 0.8588235, 0, 1,
-1.005929, 0.2940911, -0.2989012, 1, 0.8627451, 0, 1,
-1.005542, 0.07527518, -1.37768, 1, 0.8705882, 0, 1,
-1.002072, 1.824815, -1.3929, 1, 0.8745098, 0, 1,
-1.001993, 2.15686, 0.7961217, 1, 0.8823529, 0, 1,
-1.001504, -1.49047, -0.6594204, 1, 0.8862745, 0, 1,
-1.000782, -0.7521617, -0.325569, 1, 0.8941177, 0, 1,
-0.9884344, 0.01084702, -1.021093, 1, 0.8980392, 0, 1,
-0.984474, -0.7634906, -3.175241, 1, 0.9058824, 0, 1,
-0.9737835, -1.148096, -2.625889, 1, 0.9137255, 0, 1,
-0.9653842, 1.173335, -0.3206615, 1, 0.9176471, 0, 1,
-0.9584371, 0.7166677, -0.9911392, 1, 0.9254902, 0, 1,
-0.9557195, 0.1867995, -2.002651, 1, 0.9294118, 0, 1,
-0.9486826, 0.05654842, -0.5063671, 1, 0.9372549, 0, 1,
-0.9477744, 1.137685, -2.494097, 1, 0.9411765, 0, 1,
-0.9444248, 1.917171, 0.6603526, 1, 0.9490196, 0, 1,
-0.939777, 0.7587858, -0.1986507, 1, 0.9529412, 0, 1,
-0.9382367, 0.1930143, -0.6065038, 1, 0.9607843, 0, 1,
-0.9381719, 1.093184, -0.4530707, 1, 0.9647059, 0, 1,
-0.9364024, -0.040275, -0.3565728, 1, 0.972549, 0, 1,
-0.9323473, 1.904177, 0.4844429, 1, 0.9764706, 0, 1,
-0.9319904, 1.425834, -1.021907, 1, 0.9843137, 0, 1,
-0.9286034, -0.4256141, -1.858244, 1, 0.9882353, 0, 1,
-0.9241884, 0.8783247, -1.271214, 1, 0.9960784, 0, 1,
-0.9219385, -0.01967815, -2.496323, 0.9960784, 1, 0, 1,
-0.9211246, 0.09959993, -0.9522322, 0.9921569, 1, 0, 1,
-0.9197485, -0.07996655, 0.1716854, 0.9843137, 1, 0, 1,
-0.9191004, -0.1961077, -1.387877, 0.9803922, 1, 0, 1,
-0.9102156, -2.1919, -2.270196, 0.972549, 1, 0, 1,
-0.9080908, -0.1703001, -1.095308, 0.9686275, 1, 0, 1,
-0.902138, -0.2453131, -1.1701, 0.9607843, 1, 0, 1,
-0.8947863, 0.3586631, -0.1397401, 0.9568627, 1, 0, 1,
-0.8906698, 0.8118311, -2.169524, 0.9490196, 1, 0, 1,
-0.889919, -0.7227301, -2.110667, 0.945098, 1, 0, 1,
-0.8885394, 2.924528, -0.8589131, 0.9372549, 1, 0, 1,
-0.8882359, -0.9216169, -2.326592, 0.9333333, 1, 0, 1,
-0.8836173, -0.001488845, -2.818191, 0.9254902, 1, 0, 1,
-0.8805932, -0.02625725, -1.781288, 0.9215686, 1, 0, 1,
-0.8795124, -0.9764275, -2.81145, 0.9137255, 1, 0, 1,
-0.8790756, 1.491029, 0.8343005, 0.9098039, 1, 0, 1,
-0.8730235, 0.9141572, 0.1288189, 0.9019608, 1, 0, 1,
-0.8654357, 1.063355, 0.8896272, 0.8941177, 1, 0, 1,
-0.8644149, 0.2636054, -2.312996, 0.8901961, 1, 0, 1,
-0.8526558, 1.307857, -0.5265354, 0.8823529, 1, 0, 1,
-0.8510833, -1.125812, -2.031534, 0.8784314, 1, 0, 1,
-0.8480918, 0.5350494, -1.16783, 0.8705882, 1, 0, 1,
-0.8479932, -0.4097043, -2.259835, 0.8666667, 1, 0, 1,
-0.8466386, -0.5608583, -4.674469, 0.8588235, 1, 0, 1,
-0.8438587, -1.820665, -3.525056, 0.854902, 1, 0, 1,
-0.8369192, -0.09277353, 0.4192528, 0.8470588, 1, 0, 1,
-0.8355547, 0.8615305, 0.7996414, 0.8431373, 1, 0, 1,
-0.8221012, 0.1849699, -1.475091, 0.8352941, 1, 0, 1,
-0.8105828, 0.7394189, -0.2929863, 0.8313726, 1, 0, 1,
-0.8077351, 0.5347459, -1.009216, 0.8235294, 1, 0, 1,
-0.7990252, -1.726478, -1.869073, 0.8196079, 1, 0, 1,
-0.7978388, 0.2686737, -0.7406258, 0.8117647, 1, 0, 1,
-0.7953137, 1.773534, -0.1290783, 0.8078431, 1, 0, 1,
-0.7926996, 0.9244709, -0.8002256, 0.8, 1, 0, 1,
-0.7923709, 2.06567, 1.582962, 0.7921569, 1, 0, 1,
-0.79032, 0.3690678, 0.1493306, 0.7882353, 1, 0, 1,
-0.788875, -0.5503521, -0.7864522, 0.7803922, 1, 0, 1,
-0.7884291, -0.4295177, -1.626367, 0.7764706, 1, 0, 1,
-0.7738066, 0.4192947, -0.9865642, 0.7686275, 1, 0, 1,
-0.7696981, 0.9770738, 0.1853882, 0.7647059, 1, 0, 1,
-0.7662228, 1.17781, -0.571356, 0.7568628, 1, 0, 1,
-0.7658177, 0.6930375, -1.265225, 0.7529412, 1, 0, 1,
-0.7595592, 1.679562, -0.6761762, 0.7450981, 1, 0, 1,
-0.7587325, 0.2407435, -0.3624929, 0.7411765, 1, 0, 1,
-0.755154, -0.2484609, -2.232402, 0.7333333, 1, 0, 1,
-0.7549328, 0.3859616, -1.682521, 0.7294118, 1, 0, 1,
-0.7526214, 0.6343443, -1.009742, 0.7215686, 1, 0, 1,
-0.750284, -1.721382, -3.130755, 0.7176471, 1, 0, 1,
-0.7375216, 0.03853304, 0.5402699, 0.7098039, 1, 0, 1,
-0.7315973, 0.8465989, -0.5101646, 0.7058824, 1, 0, 1,
-0.7301648, -0.5337572, -0.7357302, 0.6980392, 1, 0, 1,
-0.7275786, 1.254506, 0.2011276, 0.6901961, 1, 0, 1,
-0.7191957, 0.6992306, 0.7071359, 0.6862745, 1, 0, 1,
-0.7169947, 0.1509786, -0.5653098, 0.6784314, 1, 0, 1,
-0.7151021, -0.0936856, -0.1769343, 0.6745098, 1, 0, 1,
-0.7147089, 1.377038, -2.27364, 0.6666667, 1, 0, 1,
-0.7110806, 0.3152659, -2.221623, 0.6627451, 1, 0, 1,
-0.7090953, 0.2307137, 0.1219143, 0.654902, 1, 0, 1,
-0.7062224, -0.5743703, -2.322541, 0.6509804, 1, 0, 1,
-0.7044415, 1.184732, -0.230919, 0.6431373, 1, 0, 1,
-0.7040177, 0.3532304, -1.428087, 0.6392157, 1, 0, 1,
-0.7003881, 0.9748992, -1.010588, 0.6313726, 1, 0, 1,
-0.6981337, -1.487829, -3.503663, 0.627451, 1, 0, 1,
-0.6957949, -1.348876, -1.692946, 0.6196079, 1, 0, 1,
-0.6878822, -0.6858314, -2.267555, 0.6156863, 1, 0, 1,
-0.6868209, -0.1452607, -0.745873, 0.6078432, 1, 0, 1,
-0.6819682, -0.4389848, -3.150308, 0.6039216, 1, 0, 1,
-0.6816274, -1.318438, -2.405752, 0.5960785, 1, 0, 1,
-0.6808127, 1.126915, -2.223569, 0.5882353, 1, 0, 1,
-0.6801072, 0.04674908, -1.544704, 0.5843138, 1, 0, 1,
-0.68009, 1.307669, -1.040098, 0.5764706, 1, 0, 1,
-0.6796958, -1.002246, -3.584937, 0.572549, 1, 0, 1,
-0.6777367, 0.4755155, -2.141908, 0.5647059, 1, 0, 1,
-0.6746153, 0.2151808, -2.173162, 0.5607843, 1, 0, 1,
-0.6742435, -0.6294034, -3.270854, 0.5529412, 1, 0, 1,
-0.6704397, 0.17873, -1.60842, 0.5490196, 1, 0, 1,
-0.6689296, 0.2534091, -1.823508, 0.5411765, 1, 0, 1,
-0.6678133, 1.030594, -1.283075, 0.5372549, 1, 0, 1,
-0.6664627, -0.9383896, -2.465183, 0.5294118, 1, 0, 1,
-0.6639487, 0.3412333, -3.703591, 0.5254902, 1, 0, 1,
-0.6631267, 0.1570905, -1.363559, 0.5176471, 1, 0, 1,
-0.6626593, 0.9243075, -1.8347, 0.5137255, 1, 0, 1,
-0.6617239, -0.1544251, -0.9956574, 0.5058824, 1, 0, 1,
-0.661209, -0.02502437, -0.6156571, 0.5019608, 1, 0, 1,
-0.6585675, 0.7041271, 0.3904213, 0.4941176, 1, 0, 1,
-0.6424755, -0.9555369, -0.5718792, 0.4862745, 1, 0, 1,
-0.6339256, 0.4496647, -0.02451464, 0.4823529, 1, 0, 1,
-0.633382, -0.7398717, -1.292083, 0.4745098, 1, 0, 1,
-0.6315901, -1.043363, -1.009845, 0.4705882, 1, 0, 1,
-0.6311037, -0.1221569, -2.699864, 0.4627451, 1, 0, 1,
-0.6298856, -0.2974004, -2.243637, 0.4588235, 1, 0, 1,
-0.6250857, -1.290521, -1.137269, 0.4509804, 1, 0, 1,
-0.6241802, -0.3780976, -3.281757, 0.4470588, 1, 0, 1,
-0.6215699, 0.4628949, -2.042218, 0.4392157, 1, 0, 1,
-0.6191483, 0.01878104, -2.117394, 0.4352941, 1, 0, 1,
-0.6179117, 0.3526945, 0.2079129, 0.427451, 1, 0, 1,
-0.6148062, 0.7123017, -0.1493963, 0.4235294, 1, 0, 1,
-0.6127772, 0.8537354, 0.5636379, 0.4156863, 1, 0, 1,
-0.6116108, 0.698932, -1.624965, 0.4117647, 1, 0, 1,
-0.602227, -0.2709483, -1.71995, 0.4039216, 1, 0, 1,
-0.598445, 0.4627696, 0.1605608, 0.3960784, 1, 0, 1,
-0.5949591, 0.6366995, -0.7351002, 0.3921569, 1, 0, 1,
-0.5903099, 1.066912, -0.3355756, 0.3843137, 1, 0, 1,
-0.5897176, -0.1875406, -1.481812, 0.3803922, 1, 0, 1,
-0.5882574, 0.2256129, -1.934704, 0.372549, 1, 0, 1,
-0.5858451, -0.1524158, -1.267822, 0.3686275, 1, 0, 1,
-0.5838308, -1.836665, -3.119267, 0.3607843, 1, 0, 1,
-0.5819257, 1.385396, -1.18275, 0.3568628, 1, 0, 1,
-0.58161, -0.9545788, -2.726453, 0.3490196, 1, 0, 1,
-0.5805245, 2.109043, -0.6257987, 0.345098, 1, 0, 1,
-0.5759061, 0.6767364, -1.991686, 0.3372549, 1, 0, 1,
-0.5756343, -0.854075, -1.834854, 0.3333333, 1, 0, 1,
-0.5746872, -2.625975, -4.107249, 0.3254902, 1, 0, 1,
-0.5720785, -0.02025301, -2.65235, 0.3215686, 1, 0, 1,
-0.5532203, 0.5767438, -0.529099, 0.3137255, 1, 0, 1,
-0.5528686, -0.3225863, -3.199984, 0.3098039, 1, 0, 1,
-0.5520043, 0.9715844, 0.1511589, 0.3019608, 1, 0, 1,
-0.5509099, 1.889127, -0.1395078, 0.2941177, 1, 0, 1,
-0.5502224, -0.05931571, -1.716581, 0.2901961, 1, 0, 1,
-0.5448367, -0.9838603, -2.492004, 0.282353, 1, 0, 1,
-0.544512, -0.7777163, -4.726154, 0.2784314, 1, 0, 1,
-0.5435587, 1.311376, 0.3462905, 0.2705882, 1, 0, 1,
-0.5403278, -0.06375559, -1.671496, 0.2666667, 1, 0, 1,
-0.5402316, 0.9275249, -0.3413825, 0.2588235, 1, 0, 1,
-0.5399044, 0.3597465, -2.028609, 0.254902, 1, 0, 1,
-0.5359877, 0.1125886, -0.7368978, 0.2470588, 1, 0, 1,
-0.5353433, 1.003566, 0.2106236, 0.2431373, 1, 0, 1,
-0.5348574, -0.2459508, -1.79617, 0.2352941, 1, 0, 1,
-0.5307124, -1.970871, -0.9615859, 0.2313726, 1, 0, 1,
-0.52709, -1.548499, -2.860267, 0.2235294, 1, 0, 1,
-0.5246844, 0.1936428, -1.974274, 0.2196078, 1, 0, 1,
-0.5225716, -0.5735989, -0.891671, 0.2117647, 1, 0, 1,
-0.5200721, 0.3678763, -0.5379612, 0.2078431, 1, 0, 1,
-0.5168906, -0.6574454, -1.897915, 0.2, 1, 0, 1,
-0.5161496, -2.136148, -3.774479, 0.1921569, 1, 0, 1,
-0.5110719, -1.802907, -2.586057, 0.1882353, 1, 0, 1,
-0.5106375, -1.490943, -3.166124, 0.1803922, 1, 0, 1,
-0.5071638, 0.09243561, -1.876169, 0.1764706, 1, 0, 1,
-0.5040456, -0.9368591, -0.7016732, 0.1686275, 1, 0, 1,
-0.5035167, -0.8411422, -0.9927934, 0.1647059, 1, 0, 1,
-0.5030417, 0.282198, -1.74523, 0.1568628, 1, 0, 1,
-0.5010664, 1.304298, -0.6573156, 0.1529412, 1, 0, 1,
-0.4973422, 1.234721, -0.3432899, 0.145098, 1, 0, 1,
-0.4967231, -0.5543697, -1.274349, 0.1411765, 1, 0, 1,
-0.4933841, 0.271023, -1.242372, 0.1333333, 1, 0, 1,
-0.4908729, -0.3399604, -1.938493, 0.1294118, 1, 0, 1,
-0.4890679, 0.2660157, -1.512734, 0.1215686, 1, 0, 1,
-0.4879789, 0.08186686, -0.801012, 0.1176471, 1, 0, 1,
-0.4839228, 0.2836242, -2.66649, 0.1098039, 1, 0, 1,
-0.4837996, -1.32893, -0.996369, 0.1058824, 1, 0, 1,
-0.4837748, -1.731565, -1.508857, 0.09803922, 1, 0, 1,
-0.483693, 0.1505151, -0.3235082, 0.09019608, 1, 0, 1,
-0.4826508, -0.4470482, -0.9845214, 0.08627451, 1, 0, 1,
-0.4778042, 0.4611499, -1.599918, 0.07843138, 1, 0, 1,
-0.4773439, -0.1383416, -1.716297, 0.07450981, 1, 0, 1,
-0.4763971, -0.6782286, -2.259145, 0.06666667, 1, 0, 1,
-0.4732601, 0.4187253, -1.78095, 0.0627451, 1, 0, 1,
-0.4703461, 0.518845, -1.292198, 0.05490196, 1, 0, 1,
-0.4699991, -0.5408475, -3.864877, 0.05098039, 1, 0, 1,
-0.4693994, -0.4944551, -1.078263, 0.04313726, 1, 0, 1,
-0.467559, 0.5209286, -1.069564, 0.03921569, 1, 0, 1,
-0.4673232, 0.4028698, -1.937405, 0.03137255, 1, 0, 1,
-0.4668418, 0.5609059, -0.04487828, 0.02745098, 1, 0, 1,
-0.4660556, 0.170633, -1.617062, 0.01960784, 1, 0, 1,
-0.4643312, -0.6548576, -3.724407, 0.01568628, 1, 0, 1,
-0.4602034, -0.810096, -2.635511, 0.007843138, 1, 0, 1,
-0.4601288, -0.2983466, -2.486031, 0.003921569, 1, 0, 1,
-0.454913, -0.8085517, -0.9078546, 0, 1, 0.003921569, 1,
-0.4508739, -1.15881, -3.314371, 0, 1, 0.01176471, 1,
-0.4480122, 0.4136354, -2.074236, 0, 1, 0.01568628, 1,
-0.4471788, -0.3658091, -2.743528, 0, 1, 0.02352941, 1,
-0.4463479, -0.8651032, -3.0982, 0, 1, 0.02745098, 1,
-0.4463151, -0.8983747, -3.137905, 0, 1, 0.03529412, 1,
-0.4454658, -0.145696, -0.4658685, 0, 1, 0.03921569, 1,
-0.4454513, -0.7838342, -1.835036, 0, 1, 0.04705882, 1,
-0.4422437, -0.4772633, -2.378615, 0, 1, 0.05098039, 1,
-0.4402795, -0.7533283, -2.378476, 0, 1, 0.05882353, 1,
-0.4384404, -0.857763, -3.091175, 0, 1, 0.0627451, 1,
-0.438081, 0.6298024, 0.8778557, 0, 1, 0.07058824, 1,
-0.4350135, 0.7584705, -0.4997592, 0, 1, 0.07450981, 1,
-0.4316725, 0.9259347, -1.364215, 0, 1, 0.08235294, 1,
-0.4301783, 1.876331, -0.7811908, 0, 1, 0.08627451, 1,
-0.4212377, 0.1163976, -1.187388, 0, 1, 0.09411765, 1,
-0.4199881, 2.046198, 0.7124003, 0, 1, 0.1019608, 1,
-0.4174312, 0.2966433, -0.298865, 0, 1, 0.1058824, 1,
-0.4168678, 0.6252508, 0.7399209, 0, 1, 0.1137255, 1,
-0.4146924, 0.9050634, -0.5996374, 0, 1, 0.1176471, 1,
-0.4112248, 0.398363, -1.356371, 0, 1, 0.1254902, 1,
-0.4091128, 0.5684282, -0.1178155, 0, 1, 0.1294118, 1,
-0.4051898, 0.2521029, -1.795646, 0, 1, 0.1372549, 1,
-0.4010926, 0.8606578, -1.82547, 0, 1, 0.1411765, 1,
-0.4008879, -1.565351, -3.198709, 0, 1, 0.1490196, 1,
-0.3996304, 0.6243255, -0.8775738, 0, 1, 0.1529412, 1,
-0.3977199, -1.080823, -3.7063, 0, 1, 0.1607843, 1,
-0.3974563, -0.6230916, -3.306504, 0, 1, 0.1647059, 1,
-0.3932964, 0.9660767, -1.502653, 0, 1, 0.172549, 1,
-0.3887923, 1.443321, -0.2921278, 0, 1, 0.1764706, 1,
-0.3842954, 0.3286124, -0.647463, 0, 1, 0.1843137, 1,
-0.3753109, 0.1696834, -2.500375, 0, 1, 0.1882353, 1,
-0.3727011, -0.1049742, -1.293535, 0, 1, 0.1960784, 1,
-0.371951, -0.1123228, -0.5371944, 0, 1, 0.2039216, 1,
-0.3696074, -0.9333914, -2.434691, 0, 1, 0.2078431, 1,
-0.3684646, 0.2861592, -0.4145985, 0, 1, 0.2156863, 1,
-0.364338, 0.4210299, -0.875299, 0, 1, 0.2196078, 1,
-0.3636955, 0.758356, 1.379027, 0, 1, 0.227451, 1,
-0.3607642, -0.4278793, -2.883254, 0, 1, 0.2313726, 1,
-0.3605059, -0.5412749, -3.728742, 0, 1, 0.2392157, 1,
-0.3599811, 0.8029078, -1.889605, 0, 1, 0.2431373, 1,
-0.3592946, -0.4228642, -0.8106676, 0, 1, 0.2509804, 1,
-0.3588813, -2.015494, -4.416376, 0, 1, 0.254902, 1,
-0.3585385, 0.2855598, -0.1501411, 0, 1, 0.2627451, 1,
-0.3567971, -1.44663, -1.787174, 0, 1, 0.2666667, 1,
-0.3560365, 1.958638, 0.8284529, 0, 1, 0.2745098, 1,
-0.3521594, -1.120708, -2.992367, 0, 1, 0.2784314, 1,
-0.351644, -1.006981, -5.82161, 0, 1, 0.2862745, 1,
-0.3516091, 1.271327, -1.222469, 0, 1, 0.2901961, 1,
-0.3463697, -0.487371, -3.393422, 0, 1, 0.2980392, 1,
-0.3445899, 0.5817181, -0.2186806, 0, 1, 0.3058824, 1,
-0.3406618, 0.09482569, -1.641933, 0, 1, 0.3098039, 1,
-0.3381782, -0.2435529, -2.710671, 0, 1, 0.3176471, 1,
-0.3328758, -0.01326728, -0.6992575, 0, 1, 0.3215686, 1,
-0.325103, -0.5032592, -2.39066, 0, 1, 0.3294118, 1,
-0.3227161, -0.574048, -3.449613, 0, 1, 0.3333333, 1,
-0.3221718, -0.2001752, -2.588223, 0, 1, 0.3411765, 1,
-0.3200534, 0.6238875, 0.3377787, 0, 1, 0.345098, 1,
-0.3197241, -1.328602, -2.864832, 0, 1, 0.3529412, 1,
-0.3182458, -0.7618161, -2.675558, 0, 1, 0.3568628, 1,
-0.3115623, -1.066276, -1.838989, 0, 1, 0.3647059, 1,
-0.3098381, 0.214782, -0.399765, 0, 1, 0.3686275, 1,
-0.3083355, 0.9224033, 1.828248, 0, 1, 0.3764706, 1,
-0.3060084, 0.9160779, -1.156784, 0, 1, 0.3803922, 1,
-0.3053021, -0.002648712, -1.174692, 0, 1, 0.3882353, 1,
-0.3027541, 0.5809433, -0.1184435, 0, 1, 0.3921569, 1,
-0.299531, 2.569687, -0.7166031, 0, 1, 0.4, 1,
-0.2981896, 0.9591031, 2.669645, 0, 1, 0.4078431, 1,
-0.2971963, 0.9052995, -1.430596, 0, 1, 0.4117647, 1,
-0.2949886, -1.716467, -3.449665, 0, 1, 0.4196078, 1,
-0.2931442, -0.06772647, -2.694151, 0, 1, 0.4235294, 1,
-0.2890322, 0.07508729, -1.746589, 0, 1, 0.4313726, 1,
-0.2871927, 1.549665, -0.174385, 0, 1, 0.4352941, 1,
-0.2859516, 0.5046492, 0.4026851, 0, 1, 0.4431373, 1,
-0.2820871, 0.4075765, -1.365847, 0, 1, 0.4470588, 1,
-0.2813941, 0.2953699, -2.014589, 0, 1, 0.454902, 1,
-0.2812732, -0.291306, -1.280357, 0, 1, 0.4588235, 1,
-0.2632932, 0.3823485, 1.59772, 0, 1, 0.4666667, 1,
-0.2620447, -0.9118274, -3.62711, 0, 1, 0.4705882, 1,
-0.261292, 0.5932987, 0.1293717, 0, 1, 0.4784314, 1,
-0.2587995, -0.7285515, -1.901806, 0, 1, 0.4823529, 1,
-0.2529546, 0.8697985, 1.518248, 0, 1, 0.4901961, 1,
-0.2516052, -0.6881373, -3.104955, 0, 1, 0.4941176, 1,
-0.2485754, -0.5347361, -2.406158, 0, 1, 0.5019608, 1,
-0.2467448, 1.704447, 0.4827229, 0, 1, 0.509804, 1,
-0.2437224, 0.005299888, 0.6655907, 0, 1, 0.5137255, 1,
-0.2410635, 0.3645844, -1.286696, 0, 1, 0.5215687, 1,
-0.2396007, 0.02384788, -0.7590314, 0, 1, 0.5254902, 1,
-0.2395393, -0.9835642, -3.396525, 0, 1, 0.5333334, 1,
-0.2380539, 0.8068575, -0.08752363, 0, 1, 0.5372549, 1,
-0.237635, 0.6908811, -1.241765, 0, 1, 0.5450981, 1,
-0.237274, -0.3333307, -3.213663, 0, 1, 0.5490196, 1,
-0.2321145, -0.428977, -4.362147, 0, 1, 0.5568628, 1,
-0.2304755, -0.7945283, -1.729308, 0, 1, 0.5607843, 1,
-0.2272661, -1.090053, -3.838538, 0, 1, 0.5686275, 1,
-0.2241604, -1.060613, -2.776486, 0, 1, 0.572549, 1,
-0.2212061, 2.221812, -0.198166, 0, 1, 0.5803922, 1,
-0.2123764, 0.2664027, 0.117291, 0, 1, 0.5843138, 1,
-0.2114281, 0.3059031, 0.8257509, 0, 1, 0.5921569, 1,
-0.2109331, 0.5124743, 1.597632, 0, 1, 0.5960785, 1,
-0.202476, 0.08811363, -3.505065, 0, 1, 0.6039216, 1,
-0.201809, 0.6234356, -1.289926, 0, 1, 0.6117647, 1,
-0.1973137, -0.9400637, -3.633843, 0, 1, 0.6156863, 1,
-0.1939264, -0.7837924, -1.917308, 0, 1, 0.6235294, 1,
-0.190056, -1.176163, -3.670033, 0, 1, 0.627451, 1,
-0.1877723, -0.1694566, -1.203685, 0, 1, 0.6352941, 1,
-0.1855019, -0.352138, -1.729612, 0, 1, 0.6392157, 1,
-0.1849662, 1.11723, -0.1604423, 0, 1, 0.6470588, 1,
-0.183226, -0.7654748, -5.038764, 0, 1, 0.6509804, 1,
-0.1787363, -0.2712046, -2.254725, 0, 1, 0.6588235, 1,
-0.1726093, 0.4784456, 0.02762792, 0, 1, 0.6627451, 1,
-0.1652052, 0.4012092, 0.4059249, 0, 1, 0.6705883, 1,
-0.1646821, 0.07198322, -0.6906296, 0, 1, 0.6745098, 1,
-0.1645007, 0.4499121, -0.180629, 0, 1, 0.682353, 1,
-0.1641395, 0.7204392, -1.530278, 0, 1, 0.6862745, 1,
-0.1636402, -0.2697096, -1.786234, 0, 1, 0.6941177, 1,
-0.1625463, -0.1145353, -1.752753, 0, 1, 0.7019608, 1,
-0.1620982, 0.2132298, -1.202932, 0, 1, 0.7058824, 1,
-0.1618204, 1.59463, 0.3331904, 0, 1, 0.7137255, 1,
-0.1610004, -1.568739, -3.220423, 0, 1, 0.7176471, 1,
-0.1574016, -0.7479733, -2.320563, 0, 1, 0.7254902, 1,
-0.1570165, -1.181772, -4.291965, 0, 1, 0.7294118, 1,
-0.1566344, 1.860905, -0.4437296, 0, 1, 0.7372549, 1,
-0.1546299, 0.3121148, -1.019774, 0, 1, 0.7411765, 1,
-0.1528596, -0.7791255, -3.615748, 0, 1, 0.7490196, 1,
-0.1525588, 1.478756, 0.2306893, 0, 1, 0.7529412, 1,
-0.1501724, 1.231227, -1.272743, 0, 1, 0.7607843, 1,
-0.1454757, -0.3877349, -2.213448, 0, 1, 0.7647059, 1,
-0.1428532, -0.9818498, -2.990702, 0, 1, 0.772549, 1,
-0.1372677, 1.138377, -0.5684788, 0, 1, 0.7764706, 1,
-0.1356054, -0.1029464, -1.6216, 0, 1, 0.7843137, 1,
-0.128424, -1.976728, -1.467474, 0, 1, 0.7882353, 1,
-0.1280588, 1.31268, 0.1049133, 0, 1, 0.7960784, 1,
-0.1200515, 0.196016, -0.486076, 0, 1, 0.8039216, 1,
-0.1170689, -0.07845248, -1.528163, 0, 1, 0.8078431, 1,
-0.1169692, -0.1813539, -4.166002, 0, 1, 0.8156863, 1,
-0.1041623, -0.4436718, -2.902805, 0, 1, 0.8196079, 1,
-0.1012019, 0.5625314, -0.285551, 0, 1, 0.827451, 1,
-0.1011041, 0.4692352, -0.7838774, 0, 1, 0.8313726, 1,
-0.1004039, -1.59895, -3.537062, 0, 1, 0.8392157, 1,
-0.08633079, -0.7894763, -2.748166, 0, 1, 0.8431373, 1,
-0.08624455, 1.011301, 0.932669, 0, 1, 0.8509804, 1,
-0.08521467, 1.219472, 1.451546, 0, 1, 0.854902, 1,
-0.0783976, -1.768701, -3.169664, 0, 1, 0.8627451, 1,
-0.07832056, -0.0754087, -3.392942, 0, 1, 0.8666667, 1,
-0.07810209, -0.867631, -0.8603349, 0, 1, 0.8745098, 1,
-0.07687271, -0.05412073, -4.276722, 0, 1, 0.8784314, 1,
-0.0742967, -0.3499353, -2.368169, 0, 1, 0.8862745, 1,
-0.07301033, 1.15395, -1.723092, 0, 1, 0.8901961, 1,
-0.07280192, 0.662257, -0.3121764, 0, 1, 0.8980392, 1,
-0.06771497, -0.94458, -3.343857, 0, 1, 0.9058824, 1,
-0.06602407, 1.419343, 0.2225974, 0, 1, 0.9098039, 1,
-0.06490156, 1.079744, 2.12707, 0, 1, 0.9176471, 1,
-0.06357807, -0.4046776, -3.96813, 0, 1, 0.9215686, 1,
-0.06344361, 0.2921089, -0.9601878, 0, 1, 0.9294118, 1,
-0.06233147, 1.430636, -2.176892, 0, 1, 0.9333333, 1,
-0.06166806, 1.216102, -0.9072485, 0, 1, 0.9411765, 1,
-0.05525267, -1.305592, -2.664811, 0, 1, 0.945098, 1,
-0.05220396, 0.7119498, 0.2779461, 0, 1, 0.9529412, 1,
-0.05215422, -1.539855, -3.355434, 0, 1, 0.9568627, 1,
-0.05209491, 1.079674, -0.6227003, 0, 1, 0.9647059, 1,
-0.04562128, 0.9282702, 0.5855864, 0, 1, 0.9686275, 1,
-0.03538516, -0.4585609, -2.654173, 0, 1, 0.9764706, 1,
-0.03507171, -0.2576569, -2.349044, 0, 1, 0.9803922, 1,
-0.03185165, 0.5335373, 1.196819, 0, 1, 0.9882353, 1,
-0.03183347, -1.608629, -3.12226, 0, 1, 0.9921569, 1,
-0.03064576, 1.73646, -0.8907001, 0, 1, 1, 1,
-0.02901855, -0.6152077, -2.493367, 0, 0.9921569, 1, 1,
-0.02849505, -1.156324, -2.439902, 0, 0.9882353, 1, 1,
-0.02645191, 1.211599, -1.508516, 0, 0.9803922, 1, 1,
-0.02468899, 0.8636115, -0.6579975, 0, 0.9764706, 1, 1,
-0.02377399, 0.3601478, 0.5146242, 0, 0.9686275, 1, 1,
-0.02172217, -0.4871483, -3.996589, 0, 0.9647059, 1, 1,
-0.01086047, 0.1053175, 0.04745185, 0, 0.9568627, 1, 1,
-0.005474231, -0.6918537, -2.029559, 0, 0.9529412, 1, 1,
-0.004306203, -0.6000777, -2.711991, 0, 0.945098, 1, 1,
0.004742564, 0.5148898, 1.573271, 0, 0.9411765, 1, 1,
0.005481325, 0.2495215, -1.065915, 0, 0.9333333, 1, 1,
0.007042256, -0.07460063, 4.105762, 0, 0.9294118, 1, 1,
0.007203915, -0.1883272, 1.946723, 0, 0.9215686, 1, 1,
0.007941162, 0.8868966, -0.421998, 0, 0.9176471, 1, 1,
0.008972887, 1.24775, -1.135833, 0, 0.9098039, 1, 1,
0.01130524, -0.761144, 2.573314, 0, 0.9058824, 1, 1,
0.01178532, -1.42797, 2.542031, 0, 0.8980392, 1, 1,
0.01417505, 1.200657, 1.851736, 0, 0.8901961, 1, 1,
0.0153825, -0.06469779, 2.673101, 0, 0.8862745, 1, 1,
0.01938058, 0.5542062, -0.09993085, 0, 0.8784314, 1, 1,
0.01964681, 1.034571, -1.061835, 0, 0.8745098, 1, 1,
0.03727978, -1.258934, 2.963625, 0, 0.8666667, 1, 1,
0.04162738, -0.4480371, 3.465992, 0, 0.8627451, 1, 1,
0.0491217, 0.889632, 0.9583174, 0, 0.854902, 1, 1,
0.0659348, 1.142037, 0.1826597, 0, 0.8509804, 1, 1,
0.07004729, 1.264367, 1.047073, 0, 0.8431373, 1, 1,
0.07267164, -1.05344, 3.218346, 0, 0.8392157, 1, 1,
0.07639307, 0.3117589, -1.321777, 0, 0.8313726, 1, 1,
0.07806021, 0.6336884, -0.427633, 0, 0.827451, 1, 1,
0.07945056, 0.555896, -1.323799, 0, 0.8196079, 1, 1,
0.08065562, -2.423513, 1.638371, 0, 0.8156863, 1, 1,
0.08414026, 0.6738134, 0.6432592, 0, 0.8078431, 1, 1,
0.09308946, 1.446334, 0.6896049, 0, 0.8039216, 1, 1,
0.09393573, -0.9444979, 4.315321, 0, 0.7960784, 1, 1,
0.09543848, -0.3269341, 2.715887, 0, 0.7882353, 1, 1,
0.09881271, 0.9665534, -2.738494, 0, 0.7843137, 1, 1,
0.1026163, 0.3183033, 0.9539452, 0, 0.7764706, 1, 1,
0.1057009, -0.5002003, 2.046653, 0, 0.772549, 1, 1,
0.1106432, -1.208395, 2.459687, 0, 0.7647059, 1, 1,
0.1120621, -0.4650694, 3.060648, 0, 0.7607843, 1, 1,
0.1147565, -0.8317934, 2.190786, 0, 0.7529412, 1, 1,
0.1187765, 0.6183742, 1.760441, 0, 0.7490196, 1, 1,
0.1221045, 0.4053374, -0.3004306, 0, 0.7411765, 1, 1,
0.1306572, 1.099114, 1.378884, 0, 0.7372549, 1, 1,
0.1313738, 0.3420349, 1.373134, 0, 0.7294118, 1, 1,
0.1358911, -1.433918, 0.03002271, 0, 0.7254902, 1, 1,
0.1365804, -0.2364382, 2.911235, 0, 0.7176471, 1, 1,
0.1398736, -0.06004975, 0.403431, 0, 0.7137255, 1, 1,
0.1401278, 0.8148242, -0.2674402, 0, 0.7058824, 1, 1,
0.1406324, 0.985406, 0.2155487, 0, 0.6980392, 1, 1,
0.141485, -0.02209723, 1.183807, 0, 0.6941177, 1, 1,
0.1416805, -0.5811329, 2.443786, 0, 0.6862745, 1, 1,
0.1435399, -2.09623, 1.771868, 0, 0.682353, 1, 1,
0.144439, 2.020575, 0.4884111, 0, 0.6745098, 1, 1,
0.1510029, -0.8645801, 1.160926, 0, 0.6705883, 1, 1,
0.1523254, -0.04791695, 3.421946, 0, 0.6627451, 1, 1,
0.1599505, 1.361093, -1.438699, 0, 0.6588235, 1, 1,
0.1605106, -2.758584, 1.462786, 0, 0.6509804, 1, 1,
0.1615144, -0.7753022, 3.861008, 0, 0.6470588, 1, 1,
0.1617374, 1.124364, 1.074927, 0, 0.6392157, 1, 1,
0.1619266, 0.1992616, 0.9002377, 0, 0.6352941, 1, 1,
0.1623915, 1.251666, -0.4782374, 0, 0.627451, 1, 1,
0.1648545, -0.1691932, 1.857124, 0, 0.6235294, 1, 1,
0.1648884, 1.560925, 0.5920242, 0, 0.6156863, 1, 1,
0.1663733, -0.1861892, 2.594534, 0, 0.6117647, 1, 1,
0.1731862, -2.260421, 3.709594, 0, 0.6039216, 1, 1,
0.1737168, 2.121607, 2.554248, 0, 0.5960785, 1, 1,
0.1758671, -0.7118496, 4.086111, 0, 0.5921569, 1, 1,
0.1833159, -2.285034, 3.349996, 0, 0.5843138, 1, 1,
0.1885198, 1.090777, 1.00985, 0, 0.5803922, 1, 1,
0.1892318, -0.003804029, 3.749341, 0, 0.572549, 1, 1,
0.1915337, 1.204671, -0.1660159, 0, 0.5686275, 1, 1,
0.1945549, 0.1109161, 1.381703, 0, 0.5607843, 1, 1,
0.1972605, 0.5087085, -0.8271254, 0, 0.5568628, 1, 1,
0.1973009, -0.8209614, 1.859055, 0, 0.5490196, 1, 1,
0.1976676, -0.823295, 2.282374, 0, 0.5450981, 1, 1,
0.1977495, 0.4551541, 1.040247, 0, 0.5372549, 1, 1,
0.200113, -1.184733, 3.812944, 0, 0.5333334, 1, 1,
0.2088749, 0.6452656, 0.7622713, 0, 0.5254902, 1, 1,
0.2119323, -0.8183346, 3.900666, 0, 0.5215687, 1, 1,
0.2219507, 0.6382157, 1.166644, 0, 0.5137255, 1, 1,
0.2248345, -1.286136, 3.296224, 0, 0.509804, 1, 1,
0.2331731, 0.3056256, 0.02357404, 0, 0.5019608, 1, 1,
0.2339149, 0.228966, 1.470163, 0, 0.4941176, 1, 1,
0.234676, -0.9801124, 2.361688, 0, 0.4901961, 1, 1,
0.2373504, -0.4469263, 2.011748, 0, 0.4823529, 1, 1,
0.237921, 1.42753, 0.5667602, 0, 0.4784314, 1, 1,
0.2395476, -0.6545263, 3.13993, 0, 0.4705882, 1, 1,
0.2409137, -3.708139, 3.712368, 0, 0.4666667, 1, 1,
0.2423123, 1.169657, 1.174435, 0, 0.4588235, 1, 1,
0.2475238, 1.607114, -0.5431266, 0, 0.454902, 1, 1,
0.2481407, 0.321639, 0.541387, 0, 0.4470588, 1, 1,
0.2487838, -0.2119889, 2.153849, 0, 0.4431373, 1, 1,
0.2491699, -1.360097, 3.819463, 0, 0.4352941, 1, 1,
0.2555605, -0.5757446, 2.374846, 0, 0.4313726, 1, 1,
0.2567254, -0.4785686, 1.103147, 0, 0.4235294, 1, 1,
0.2647685, -0.08863918, 1.129643, 0, 0.4196078, 1, 1,
0.2657878, -0.2043981, 1.083172, 0, 0.4117647, 1, 1,
0.2666641, 1.378279, -1.039286, 0, 0.4078431, 1, 1,
0.2700959, -1.01727, 3.69724, 0, 0.4, 1, 1,
0.2717059, 1.01772, 0.4887941, 0, 0.3921569, 1, 1,
0.2733315, -1.711843, 2.58682, 0, 0.3882353, 1, 1,
0.2740298, -1.122578, 4.21, 0, 0.3803922, 1, 1,
0.2742898, -0.03472826, 2.17913, 0, 0.3764706, 1, 1,
0.27442, -1.249688, 2.789547, 0, 0.3686275, 1, 1,
0.2752939, -1.242446, 4.146567, 0, 0.3647059, 1, 1,
0.2755807, -2.082293, 4.212317, 0, 0.3568628, 1, 1,
0.2783131, 0.5905054, 0.6842077, 0, 0.3529412, 1, 1,
0.2810099, 1.01946, 0.7663199, 0, 0.345098, 1, 1,
0.2810238, 0.7034325, 1.988156, 0, 0.3411765, 1, 1,
0.2830311, 0.3301621, 0.1234422, 0, 0.3333333, 1, 1,
0.2844995, 0.2310961, -0.7017189, 0, 0.3294118, 1, 1,
0.2884043, -0.8522534, 3.986915, 0, 0.3215686, 1, 1,
0.2965117, -0.227594, 1.914288, 0, 0.3176471, 1, 1,
0.3005342, -1.374506, 0.4236923, 0, 0.3098039, 1, 1,
0.305633, -0.4690073, 2.795241, 0, 0.3058824, 1, 1,
0.3076989, -0.3417544, 2.2343, 0, 0.2980392, 1, 1,
0.3101048, 1.150061, 1.080346, 0, 0.2901961, 1, 1,
0.3147156, 0.2764447, 1.430061, 0, 0.2862745, 1, 1,
0.3163031, 0.1349556, 1.432933, 0, 0.2784314, 1, 1,
0.3198918, -0.624727, 1.668635, 0, 0.2745098, 1, 1,
0.3227616, -0.004423414, 0.4202585, 0, 0.2666667, 1, 1,
0.3286654, 1.772479, -0.07901422, 0, 0.2627451, 1, 1,
0.3321042, 0.1411564, 0.9081067, 0, 0.254902, 1, 1,
0.3471577, -0.651207, 5.59668, 0, 0.2509804, 1, 1,
0.3482091, 1.026385, -0.6997436, 0, 0.2431373, 1, 1,
0.3509756, 0.250289, 1.357271, 0, 0.2392157, 1, 1,
0.3530652, 0.202092, 1.434246, 0, 0.2313726, 1, 1,
0.3558775, -0.4257625, 2.020213, 0, 0.227451, 1, 1,
0.3559659, -1.206413, 2.613049, 0, 0.2196078, 1, 1,
0.3564517, 1.056421, 1.603264, 0, 0.2156863, 1, 1,
0.3568538, -0.585641, 4.971779, 0, 0.2078431, 1, 1,
0.3580264, -0.8023071, 2.656345, 0, 0.2039216, 1, 1,
0.3594405, -0.0516746, 2.428823, 0, 0.1960784, 1, 1,
0.359488, -2.06172, 2.197977, 0, 0.1882353, 1, 1,
0.3601091, 0.2995892, 3.022538, 0, 0.1843137, 1, 1,
0.3685921, 0.2252601, -0.9679589, 0, 0.1764706, 1, 1,
0.3698864, -0.9725168, 3.626888, 0, 0.172549, 1, 1,
0.3731597, -2.211535, 1.446366, 0, 0.1647059, 1, 1,
0.3757767, -2.41925, 2.877783, 0, 0.1607843, 1, 1,
0.3796286, 0.505948, -0.5475807, 0, 0.1529412, 1, 1,
0.3799712, -1.047744, 2.456188, 0, 0.1490196, 1, 1,
0.383452, 0.6351067, 0.5537415, 0, 0.1411765, 1, 1,
0.384457, 1.629611, 1.736439, 0, 0.1372549, 1, 1,
0.3870941, -0.8179685, 2.91819, 0, 0.1294118, 1, 1,
0.3913386, 2.878601, 0.8063799, 0, 0.1254902, 1, 1,
0.3945232, -1.179297, 4.107368, 0, 0.1176471, 1, 1,
0.3956264, 1.273634, 1.47447, 0, 0.1137255, 1, 1,
0.4007626, -0.3537312, 1.964256, 0, 0.1058824, 1, 1,
0.4043038, 0.1530269, 2.691817, 0, 0.09803922, 1, 1,
0.4072926, -0.4067836, 3.141944, 0, 0.09411765, 1, 1,
0.4073216, -0.8427696, 3.439574, 0, 0.08627451, 1, 1,
0.411009, 0.5259746, 0.06713329, 0, 0.08235294, 1, 1,
0.4111455, 1.193918, 1.50266, 0, 0.07450981, 1, 1,
0.4126465, -0.8480672, 1.133587, 0, 0.07058824, 1, 1,
0.4143366, -0.4877129, 2.485717, 0, 0.0627451, 1, 1,
0.4160557, 0.9767516, 0.4042947, 0, 0.05882353, 1, 1,
0.4174248, 2.178147, -0.8209009, 0, 0.05098039, 1, 1,
0.4207975, 0.502048, 0.6275616, 0, 0.04705882, 1, 1,
0.4281066, -1.637653, 4.341807, 0, 0.03921569, 1, 1,
0.4436215, -0.2557037, 1.36104, 0, 0.03529412, 1, 1,
0.445407, 0.3911756, 0.1983021, 0, 0.02745098, 1, 1,
0.4455738, -1.613762, 0.670101, 0, 0.02352941, 1, 1,
0.4480669, -0.8253679, 1.828789, 0, 0.01568628, 1, 1,
0.4487353, 1.279696, -0.9734879, 0, 0.01176471, 1, 1,
0.451928, -0.2619857, -0.0654882, 0, 0.003921569, 1, 1,
0.4547278, -1.014067, 3.136954, 0.003921569, 0, 1, 1,
0.4567188, 0.1796484, 0.9552082, 0.007843138, 0, 1, 1,
0.4691589, 0.1092246, 1.587126, 0.01568628, 0, 1, 1,
0.4695071, 0.7180786, 0.8594653, 0.01960784, 0, 1, 1,
0.4700683, -0.6978142, 3.170096, 0.02745098, 0, 1, 1,
0.4707274, -0.7907869, 3.340439, 0.03137255, 0, 1, 1,
0.4728282, -1.631297, 3.607615, 0.03921569, 0, 1, 1,
0.4761223, -0.875374, 0.353525, 0.04313726, 0, 1, 1,
0.4762301, -0.8019952, 3.166606, 0.05098039, 0, 1, 1,
0.4789125, 2.458312, 0.2192578, 0.05490196, 0, 1, 1,
0.4844955, 1.521168, 0.05219975, 0.0627451, 0, 1, 1,
0.4927392, 0.4237063, 1.061247, 0.06666667, 0, 1, 1,
0.4960208, 0.334365, 0.2567765, 0.07450981, 0, 1, 1,
0.4966991, -0.02073303, 2.215812, 0.07843138, 0, 1, 1,
0.4971579, -0.2041173, 1.65192, 0.08627451, 0, 1, 1,
0.498411, -0.9513249, 2.665398, 0.09019608, 0, 1, 1,
0.4987097, 0.7423376, 0.4365916, 0.09803922, 0, 1, 1,
0.5016826, -1.228517, 1.120048, 0.1058824, 0, 1, 1,
0.5041658, -0.621052, 2.5119, 0.1098039, 0, 1, 1,
0.5042802, -1.125515, 5.206786, 0.1176471, 0, 1, 1,
0.5043491, -1.467649, 2.993391, 0.1215686, 0, 1, 1,
0.5074319, -0.01012105, 1.144135, 0.1294118, 0, 1, 1,
0.5111876, -0.5866756, 2.727309, 0.1333333, 0, 1, 1,
0.514935, -0.526949, 1.165684, 0.1411765, 0, 1, 1,
0.5162005, 1.918655, 0.6117169, 0.145098, 0, 1, 1,
0.5162793, -3.012846, 3.835829, 0.1529412, 0, 1, 1,
0.5184851, -0.9487803, 3.370568, 0.1568628, 0, 1, 1,
0.5186217, -1.228191, 2.646984, 0.1647059, 0, 1, 1,
0.5199087, 0.734695, -0.4631233, 0.1686275, 0, 1, 1,
0.5215189, -1.328907, 2.924343, 0.1764706, 0, 1, 1,
0.5243377, 0.969191, -0.3981278, 0.1803922, 0, 1, 1,
0.5259156, -0.983107, 2.868131, 0.1882353, 0, 1, 1,
0.533442, 0.5738887, -0.5745428, 0.1921569, 0, 1, 1,
0.5371862, 0.6501199, 0.1689762, 0.2, 0, 1, 1,
0.5414305, -0.9370568, 2.798413, 0.2078431, 0, 1, 1,
0.5458879, -0.8082272, 1.997369, 0.2117647, 0, 1, 1,
0.5471258, -1.520113, 3.246172, 0.2196078, 0, 1, 1,
0.5503113, -1.107663, 3.283513, 0.2235294, 0, 1, 1,
0.555091, -1.207361, 3.242136, 0.2313726, 0, 1, 1,
0.5564709, -0.2266018, 2.046061, 0.2352941, 0, 1, 1,
0.5566888, 0.04639486, 4.402598, 0.2431373, 0, 1, 1,
0.556935, -0.9572535, 1.588713, 0.2470588, 0, 1, 1,
0.5587525, 0.1702703, -0.8980155, 0.254902, 0, 1, 1,
0.5609235, -2.160306, 3.521338, 0.2588235, 0, 1, 1,
0.561426, 0.217029, 3.374291, 0.2666667, 0, 1, 1,
0.5625994, 0.1014078, 1.499501, 0.2705882, 0, 1, 1,
0.5647159, -0.1160385, 1.511891, 0.2784314, 0, 1, 1,
0.5656265, -1.394587, 3.960624, 0.282353, 0, 1, 1,
0.5692828, -0.4530656, 2.622729, 0.2901961, 0, 1, 1,
0.5750085, 0.3680272, 1.042576, 0.2941177, 0, 1, 1,
0.5756006, 1.048207, 0.6152866, 0.3019608, 0, 1, 1,
0.5841615, 0.6554843, -0.4082435, 0.3098039, 0, 1, 1,
0.5845593, 1.154534, 0.5556585, 0.3137255, 0, 1, 1,
0.5855967, 1.151725, 0.7924526, 0.3215686, 0, 1, 1,
0.5889562, -0.4530427, 1.560826, 0.3254902, 0, 1, 1,
0.5890355, -0.6978121, 2.103297, 0.3333333, 0, 1, 1,
0.5911481, 0.3738101, 0.938474, 0.3372549, 0, 1, 1,
0.596513, 0.1839778, 0.5363563, 0.345098, 0, 1, 1,
0.6068038, -0.3485115, 1.155081, 0.3490196, 0, 1, 1,
0.6090678, 0.00530712, 1.710272, 0.3568628, 0, 1, 1,
0.613385, 0.8850063, 0.6345601, 0.3607843, 0, 1, 1,
0.6139961, -1.650787, 2.562323, 0.3686275, 0, 1, 1,
0.6143858, -0.5067137, 2.386127, 0.372549, 0, 1, 1,
0.6217513, -1.955434, 2.378565, 0.3803922, 0, 1, 1,
0.6316025, -0.2106969, 3.476174, 0.3843137, 0, 1, 1,
0.6317033, 1.609458, 0.3498449, 0.3921569, 0, 1, 1,
0.6341571, -1.450729, 3.543969, 0.3960784, 0, 1, 1,
0.6357047, 1.004735, -0.3454735, 0.4039216, 0, 1, 1,
0.639888, -0.5607086, 2.241958, 0.4117647, 0, 1, 1,
0.6431282, 0.6667618, 0.8292076, 0.4156863, 0, 1, 1,
0.6483155, -0.2309015, 1.320429, 0.4235294, 0, 1, 1,
0.6491446, -0.3490999, 2.260432, 0.427451, 0, 1, 1,
0.6499824, 0.1346378, 0.818159, 0.4352941, 0, 1, 1,
0.6520623, 2.673658, 2.144846, 0.4392157, 0, 1, 1,
0.652579, -0.1661278, 1.754078, 0.4470588, 0, 1, 1,
0.6568061, -0.2372232, 2.061253, 0.4509804, 0, 1, 1,
0.6598145, 0.4671978, 1.951963, 0.4588235, 0, 1, 1,
0.6695139, -0.6489203, 1.282208, 0.4627451, 0, 1, 1,
0.669648, -0.3809973, 2.658552, 0.4705882, 0, 1, 1,
0.6696963, 0.5989025, 1.653223, 0.4745098, 0, 1, 1,
0.6774594, -0.1827331, 2.71893, 0.4823529, 0, 1, 1,
0.6804174, 0.7932135, 0.1650112, 0.4862745, 0, 1, 1,
0.6870613, 0.7931855, 2.375564, 0.4941176, 0, 1, 1,
0.6891349, 0.4030632, 3.001949, 0.5019608, 0, 1, 1,
0.689999, -0.4370786, 3.063874, 0.5058824, 0, 1, 1,
0.6905289, 1.810443, 0.9514058, 0.5137255, 0, 1, 1,
0.7031168, 0.7348224, 0.1002892, 0.5176471, 0, 1, 1,
0.7031975, 0.8608534, -0.261793, 0.5254902, 0, 1, 1,
0.7034294, -1.008331, 3.703891, 0.5294118, 0, 1, 1,
0.7087767, 0.9182622, -0.7330106, 0.5372549, 0, 1, 1,
0.7121277, -0.4799192, 1.875314, 0.5411765, 0, 1, 1,
0.7161453, 0.2770905, 1.063801, 0.5490196, 0, 1, 1,
0.7307375, 2.255914, -0.2641131, 0.5529412, 0, 1, 1,
0.7332402, -1.074968, 4.353414, 0.5607843, 0, 1, 1,
0.736508, 1.257924, 1.965579, 0.5647059, 0, 1, 1,
0.7377141, 0.8334345, 0.1040133, 0.572549, 0, 1, 1,
0.7400156, -1.038862, 2.658458, 0.5764706, 0, 1, 1,
0.7447571, 1.408672, 2.549412, 0.5843138, 0, 1, 1,
0.7451965, 1.187044, 0.654952, 0.5882353, 0, 1, 1,
0.7477447, 0.3066002, 0.5140142, 0.5960785, 0, 1, 1,
0.7482158, 1.792445, -0.9274583, 0.6039216, 0, 1, 1,
0.7523816, -0.6079807, 2.10015, 0.6078432, 0, 1, 1,
0.7589737, -1.989414, 0.1582888, 0.6156863, 0, 1, 1,
0.761835, 1.610496, -0.04920927, 0.6196079, 0, 1, 1,
0.7624982, -0.2393036, 1.846139, 0.627451, 0, 1, 1,
0.7666151, 0.6238106, 2.211709, 0.6313726, 0, 1, 1,
0.7671089, 0.8898221, -0.5273851, 0.6392157, 0, 1, 1,
0.7700654, 1.196569, 1.290645, 0.6431373, 0, 1, 1,
0.7767475, 1.250261, 0.08199895, 0.6509804, 0, 1, 1,
0.7777712, -0.8623077, 1.511666, 0.654902, 0, 1, 1,
0.7814921, -0.4753387, 2.219188, 0.6627451, 0, 1, 1,
0.7923706, 1.212052, 0.1833453, 0.6666667, 0, 1, 1,
0.7953696, -0.1815552, 0.9967285, 0.6745098, 0, 1, 1,
0.8011379, -0.7577469, 1.527239, 0.6784314, 0, 1, 1,
0.8128669, -0.5986084, 0.5118152, 0.6862745, 0, 1, 1,
0.8147126, -1.241988, 3.628728, 0.6901961, 0, 1, 1,
0.8167403, 0.9092661, -1.706739, 0.6980392, 0, 1, 1,
0.8228981, -1.429414, 2.672001, 0.7058824, 0, 1, 1,
0.8243227, -1.199546, 1.660919, 0.7098039, 0, 1, 1,
0.8314953, 0.7289041, 0.345621, 0.7176471, 0, 1, 1,
0.8371161, 0.6102602, -0.3407902, 0.7215686, 0, 1, 1,
0.8384008, -0.3210243, 1.518083, 0.7294118, 0, 1, 1,
0.8423623, -0.6068425, 0.7562181, 0.7333333, 0, 1, 1,
0.8493274, 0.134604, 1.030853, 0.7411765, 0, 1, 1,
0.852911, 1.650848, -0.4850253, 0.7450981, 0, 1, 1,
0.8530435, 0.3380117, 0.5549635, 0.7529412, 0, 1, 1,
0.8533054, 0.9126089, 1.094106, 0.7568628, 0, 1, 1,
0.8600767, -0.4289397, 2.043216, 0.7647059, 0, 1, 1,
0.8616717, 0.228001, -0.02137065, 0.7686275, 0, 1, 1,
0.869574, -0.8651735, 1.888299, 0.7764706, 0, 1, 1,
0.8716173, -0.168547, 1.098521, 0.7803922, 0, 1, 1,
0.8755, -1.070839, 2.250635, 0.7882353, 0, 1, 1,
0.8757377, -0.214581, 2.606657, 0.7921569, 0, 1, 1,
0.8793976, -2.365102, 2.696294, 0.8, 0, 1, 1,
0.8820179, -0.7764416, 2.862302, 0.8078431, 0, 1, 1,
0.8834554, -0.04802713, 1.884795, 0.8117647, 0, 1, 1,
0.885749, -0.9817836, 1.199677, 0.8196079, 0, 1, 1,
0.8876134, 2.178811, 0.8328184, 0.8235294, 0, 1, 1,
0.8933517, -0.5038309, 1.785845, 0.8313726, 0, 1, 1,
0.8973605, -0.1037264, 2.455008, 0.8352941, 0, 1, 1,
0.899682, -0.5349319, 2.920161, 0.8431373, 0, 1, 1,
0.9010335, 0.4591128, 2.755368, 0.8470588, 0, 1, 1,
0.9013947, -1.451821, 1.833853, 0.854902, 0, 1, 1,
0.9023343, -0.0252382, 2.034299, 0.8588235, 0, 1, 1,
0.9087749, -1.45359, 2.534, 0.8666667, 0, 1, 1,
0.9125364, -2.175369, 1.848446, 0.8705882, 0, 1, 1,
0.9206213, 0.02067634, 3.179465, 0.8784314, 0, 1, 1,
0.9226781, -1.157544, 0.9132284, 0.8823529, 0, 1, 1,
0.9261523, 0.8835724, 1.661524, 0.8901961, 0, 1, 1,
0.9271465, -0.3499737, 0.591197, 0.8941177, 0, 1, 1,
0.929781, -0.6358503, -0.0421002, 0.9019608, 0, 1, 1,
0.9343279, 0.4216866, 0.9064736, 0.9098039, 0, 1, 1,
0.9417952, 2.068402, 1.376716, 0.9137255, 0, 1, 1,
0.9500315, 0.6768285, 1.603078, 0.9215686, 0, 1, 1,
0.953554, -1.104463, 2.178614, 0.9254902, 0, 1, 1,
0.9556577, 0.4048681, 1.398479, 0.9333333, 0, 1, 1,
0.9630755, 0.1443652, 1.893715, 0.9372549, 0, 1, 1,
0.9741976, -0.5180649, 1.914656, 0.945098, 0, 1, 1,
0.9749725, -1.443386, 3.055679, 0.9490196, 0, 1, 1,
0.9755059, -1.17199, 3.073857, 0.9568627, 0, 1, 1,
0.9804804, 0.5126275, 2.205687, 0.9607843, 0, 1, 1,
0.9840417, 0.4016913, 0.2912115, 0.9686275, 0, 1, 1,
0.9862217, -0.1917388, 0.2667765, 0.972549, 0, 1, 1,
0.9997926, 0.3067481, 0.4326786, 0.9803922, 0, 1, 1,
1.008092, -0.1520941, 2.235494, 0.9843137, 0, 1, 1,
1.009517, -0.3907971, 1.002914, 0.9921569, 0, 1, 1,
1.013042, -0.3050945, 0.8289099, 0.9960784, 0, 1, 1,
1.016688, 0.4383995, 2.340733, 1, 0, 0.9960784, 1,
1.01843, -0.9386843, 2.208332, 1, 0, 0.9882353, 1,
1.024495, -1.428196, 3.70598, 1, 0, 0.9843137, 1,
1.02517, 2.620184, -0.639543, 1, 0, 0.9764706, 1,
1.027912, 2.06734, 0.7871146, 1, 0, 0.972549, 1,
1.032128, 1.933819, -0.5576251, 1, 0, 0.9647059, 1,
1.033844, 0.05876837, 2.809236, 1, 0, 0.9607843, 1,
1.038516, -0.0008799685, 1.585904, 1, 0, 0.9529412, 1,
1.043714, 0.3077548, 0.8554272, 1, 0, 0.9490196, 1,
1.047082, 0.202288, -0.5531942, 1, 0, 0.9411765, 1,
1.050697, -0.2430426, 1.708925, 1, 0, 0.9372549, 1,
1.057281, 0.8071389, 1.850053, 1, 0, 0.9294118, 1,
1.058156, -0.05615706, 2.238534, 1, 0, 0.9254902, 1,
1.083084, -0.5819851, 2.741488, 1, 0, 0.9176471, 1,
1.102878, 0.6234596, 0.1962355, 1, 0, 0.9137255, 1,
1.104362, 0.4856994, 0.1632693, 1, 0, 0.9058824, 1,
1.104704, 0.3091267, 0.6256235, 1, 0, 0.9019608, 1,
1.105419, 0.2658965, 0.4745268, 1, 0, 0.8941177, 1,
1.108047, 1.144836, -1.637007, 1, 0, 0.8862745, 1,
1.122861, 0.2517757, 0.001336323, 1, 0, 0.8823529, 1,
1.125865, 1.412809, 0.7943085, 1, 0, 0.8745098, 1,
1.12691, -1.593364, 4.152432, 1, 0, 0.8705882, 1,
1.132794, 0.6750444, -0.3226611, 1, 0, 0.8627451, 1,
1.135733, 2.121243, -0.1477693, 1, 0, 0.8588235, 1,
1.135817, 0.989264, 1.311735, 1, 0, 0.8509804, 1,
1.136314, -0.6179105, 2.878068, 1, 0, 0.8470588, 1,
1.136402, 0.0967552, 2.049444, 1, 0, 0.8392157, 1,
1.140372, 1.294618, 1.6841, 1, 0, 0.8352941, 1,
1.141358, 0.04245025, 1.910309, 1, 0, 0.827451, 1,
1.151737, 0.3794835, 1.725888, 1, 0, 0.8235294, 1,
1.159201, -0.9479563, 1.113647, 1, 0, 0.8156863, 1,
1.160477, 1.525689, -0.7064905, 1, 0, 0.8117647, 1,
1.162753, 2.184262, 0.4353834, 1, 0, 0.8039216, 1,
1.164249, -0.6835817, 1.073314, 1, 0, 0.7960784, 1,
1.172982, 1.093427, -1.939352, 1, 0, 0.7921569, 1,
1.180442, 0.688949, 3.805998, 1, 0, 0.7843137, 1,
1.183338, 1.195634, 1.642195, 1, 0, 0.7803922, 1,
1.184536, 1.163029, 0.4021968, 1, 0, 0.772549, 1,
1.187908, 0.8844106, -0.2314957, 1, 0, 0.7686275, 1,
1.18987, -0.2304212, 2.04336, 1, 0, 0.7607843, 1,
1.191811, -1.06869, 1.181184, 1, 0, 0.7568628, 1,
1.192134, 0.3416422, 0.2251181, 1, 0, 0.7490196, 1,
1.195227, 0.4795539, -0.5010269, 1, 0, 0.7450981, 1,
1.200876, 0.2344884, -0.9368985, 1, 0, 0.7372549, 1,
1.212149, -2.412146, 3.270115, 1, 0, 0.7333333, 1,
1.21262, 1.543716, 2.87983, 1, 0, 0.7254902, 1,
1.215259, -0.6906512, 1.713216, 1, 0, 0.7215686, 1,
1.215564, 0.4169166, 1.578865, 1, 0, 0.7137255, 1,
1.218413, 0.262762, 2.660434, 1, 0, 0.7098039, 1,
1.222191, 0.07496498, 0.7274402, 1, 0, 0.7019608, 1,
1.23024, -2.149982, 2.719771, 1, 0, 0.6941177, 1,
1.246166, -0.9257476, 2.620864, 1, 0, 0.6901961, 1,
1.252763, 1.266063, -0.3570031, 1, 0, 0.682353, 1,
1.252767, 0.1531526, 1.293596, 1, 0, 0.6784314, 1,
1.260119, -0.2420571, 2.552606, 1, 0, 0.6705883, 1,
1.260345, -0.03958286, 1.96754, 1, 0, 0.6666667, 1,
1.263752, 0.7552018, 1.213249, 1, 0, 0.6588235, 1,
1.267802, -0.1896462, 2.003823, 1, 0, 0.654902, 1,
1.271939, -1.264228, 2.799024, 1, 0, 0.6470588, 1,
1.276872, -0.1232813, 2.470324, 1, 0, 0.6431373, 1,
1.277311, -0.116272, 0.4386981, 1, 0, 0.6352941, 1,
1.277376, 0.7649572, 2.066365, 1, 0, 0.6313726, 1,
1.292512, 0.7497105, 1.494323, 1, 0, 0.6235294, 1,
1.305656, -0.3017205, 2.14665, 1, 0, 0.6196079, 1,
1.314062, -0.07093947, 2.610135, 1, 0, 0.6117647, 1,
1.316812, -0.03124659, 0.08837035, 1, 0, 0.6078432, 1,
1.320762, 0.6207876, 2.516556, 1, 0, 0.6, 1,
1.321999, -1.067905, 1.332422, 1, 0, 0.5921569, 1,
1.331766, -0.2080777, 1.91714, 1, 0, 0.5882353, 1,
1.333216, 0.2371686, 0.9608514, 1, 0, 0.5803922, 1,
1.337385, 0.5600853, 0.2283177, 1, 0, 0.5764706, 1,
1.339806, 0.2985388, 2.228983, 1, 0, 0.5686275, 1,
1.341938, 0.8490685, 0.6183985, 1, 0, 0.5647059, 1,
1.353501, -0.8830836, 2.759523, 1, 0, 0.5568628, 1,
1.354897, -0.9525832, 2.039203, 1, 0, 0.5529412, 1,
1.355353, 0.8449232, 1.614063, 1, 0, 0.5450981, 1,
1.364184, -0.4120322, 0.3027722, 1, 0, 0.5411765, 1,
1.386467, 1.12528, 0.6640711, 1, 0, 0.5333334, 1,
1.397395, 0.9815605, 1.086155, 1, 0, 0.5294118, 1,
1.400528, 1.218444, 0.5153351, 1, 0, 0.5215687, 1,
1.403953, 0.5239757, 0.8646784, 1, 0, 0.5176471, 1,
1.409326, -2.848408, 1.172585, 1, 0, 0.509804, 1,
1.4155, 0.827572, -0.5360676, 1, 0, 0.5058824, 1,
1.425953, 1.153998, 1.816836, 1, 0, 0.4980392, 1,
1.429941, 0.5705397, 2.71819, 1, 0, 0.4901961, 1,
1.432895, 1.054694, -0.08548104, 1, 0, 0.4862745, 1,
1.458413, 0.4776906, 1.123505, 1, 0, 0.4784314, 1,
1.46402, 0.6883928, 1.413409, 1, 0, 0.4745098, 1,
1.465374, -0.6701149, 2.80868, 1, 0, 0.4666667, 1,
1.467592, -1.254581, 2.349877, 1, 0, 0.4627451, 1,
1.468692, 0.9714127, -0.08011187, 1, 0, 0.454902, 1,
1.489154, -0.1291398, 1.160526, 1, 0, 0.4509804, 1,
1.494476, 1.579912, 1.6992, 1, 0, 0.4431373, 1,
1.49772, -1.032857, 1.098294, 1, 0, 0.4392157, 1,
1.50052, -0.1810296, 0.8080677, 1, 0, 0.4313726, 1,
1.50319, -0.611725, 2.782118, 1, 0, 0.427451, 1,
1.506076, 0.2998004, 2.041252, 1, 0, 0.4196078, 1,
1.513438, -0.2615533, 2.497739, 1, 0, 0.4156863, 1,
1.530028, -0.3691263, 1.23039, 1, 0, 0.4078431, 1,
1.53946, 0.5456414, 2.535209, 1, 0, 0.4039216, 1,
1.557107, -0.3392314, 1.344905, 1, 0, 0.3960784, 1,
1.558683, 0.7828215, 0.6237494, 1, 0, 0.3882353, 1,
1.561912, 0.5087981, 2.008375, 1, 0, 0.3843137, 1,
1.565381, 1.273774, 1.872565, 1, 0, 0.3764706, 1,
1.566669, 1.149147, -0.06374596, 1, 0, 0.372549, 1,
1.57346, -0.1000346, -0.02348934, 1, 0, 0.3647059, 1,
1.578621, -0.01996943, 1.418554, 1, 0, 0.3607843, 1,
1.57947, 0.7736136, 0.5000443, 1, 0, 0.3529412, 1,
1.581415, -2.128416, 1.891473, 1, 0, 0.3490196, 1,
1.585472, 0.140501, 1.817957, 1, 0, 0.3411765, 1,
1.602506, 0.6739885, 0.9511583, 1, 0, 0.3372549, 1,
1.604329, 0.5883816, 1.591816, 1, 0, 0.3294118, 1,
1.608396, -1.396938, 1.240103, 1, 0, 0.3254902, 1,
1.611367, -1.112862, 2.342348, 1, 0, 0.3176471, 1,
1.61691, 1.205351, 2.014893, 1, 0, 0.3137255, 1,
1.621468, 0.0640928, 1.291243, 1, 0, 0.3058824, 1,
1.629548, -2.829535, 1.161888, 1, 0, 0.2980392, 1,
1.658664, 1.073251, 1.238158, 1, 0, 0.2941177, 1,
1.683587, -0.02165417, 1.782441, 1, 0, 0.2862745, 1,
1.685164, 1.837819, 0.7827194, 1, 0, 0.282353, 1,
1.701992, 1.01528, 0.6893332, 1, 0, 0.2745098, 1,
1.716368, -1.682092, 2.467514, 1, 0, 0.2705882, 1,
1.723022, -0.5988486, 3.368847, 1, 0, 0.2627451, 1,
1.739622, -0.0752243, 1.895222, 1, 0, 0.2588235, 1,
1.764315, -0.5643691, 2.760729, 1, 0, 0.2509804, 1,
1.764436, -1.151044, 2.037865, 1, 0, 0.2470588, 1,
1.782095, -0.438188, 0.415076, 1, 0, 0.2392157, 1,
1.783188, 0.5898712, 1.887745, 1, 0, 0.2352941, 1,
1.795706, -0.580735, 2.613789, 1, 0, 0.227451, 1,
1.805776, -0.1890884, 0.7993506, 1, 0, 0.2235294, 1,
1.818927, -0.2100689, 1.762436, 1, 0, 0.2156863, 1,
1.840813, 2.04523, 0.2433891, 1, 0, 0.2117647, 1,
1.857789, 0.2641378, 2.286704, 1, 0, 0.2039216, 1,
1.873436, -0.02091106, 3.099328, 1, 0, 0.1960784, 1,
1.885711, 1.184083, 1.064091, 1, 0, 0.1921569, 1,
1.885892, -0.413288, 1.209329, 1, 0, 0.1843137, 1,
1.929036, 0.4079897, 0.5583265, 1, 0, 0.1803922, 1,
1.94794, -0.5582053, 2.989384, 1, 0, 0.172549, 1,
1.983906, 1.357562, 1.045476, 1, 0, 0.1686275, 1,
1.98812, -0.8662521, 2.524431, 1, 0, 0.1607843, 1,
1.999532, 1.10408, 0.9136606, 1, 0, 0.1568628, 1,
2.001038, -1.024234, 2.800488, 1, 0, 0.1490196, 1,
2.01333, -1.336807, 2.550884, 1, 0, 0.145098, 1,
2.05736, -0.8379202, 3.338671, 1, 0, 0.1372549, 1,
2.070291, 0.6138387, 3.0438, 1, 0, 0.1333333, 1,
2.133862, 0.7687177, 0.4220435, 1, 0, 0.1254902, 1,
2.138184, 0.274513, 0.5987809, 1, 0, 0.1215686, 1,
2.145962, -1.947501, 1.81049, 1, 0, 0.1137255, 1,
2.153924, -1.402219, 3.342278, 1, 0, 0.1098039, 1,
2.199566, -1.155423, 4.275375, 1, 0, 0.1019608, 1,
2.241367, -0.1689775, 1.838737, 1, 0, 0.09411765, 1,
2.257735, 0.03444685, 1.909535, 1, 0, 0.09019608, 1,
2.272701, 0.7637517, 2.24134, 1, 0, 0.08235294, 1,
2.299731, 1.054193, 1.522432, 1, 0, 0.07843138, 1,
2.304076, 0.1754922, 0.6549543, 1, 0, 0.07058824, 1,
2.447537, 0.776363, 1.164438, 1, 0, 0.06666667, 1,
2.474409, -0.2830897, 1.970233, 1, 0, 0.05882353, 1,
2.477628, 1.455128, 1.135927, 1, 0, 0.05490196, 1,
2.534569, 0.5816355, 2.551343, 1, 0, 0.04705882, 1,
2.671301, 0.08334211, 3.463564, 1, 0, 0.04313726, 1,
2.693599, -1.708964, 2.040519, 1, 0, 0.03529412, 1,
2.710348, 1.103682, 1.775218, 1, 0, 0.03137255, 1,
2.912955, 0.09115265, 1.615791, 1, 0, 0.02352941, 1,
3.062492, -0.167833, 1.287964, 1, 0, 0.01960784, 1,
3.296609, 0.2645042, 2.478513, 1, 0, 0.01176471, 1,
3.461399, -1.073455, 1.454178, 1, 0, 0.007843138, 1
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
-0.09120107, -5.085411, -7.75701, 0, -0.5, 0.5, 0.5,
-0.09120107, -5.085411, -7.75701, 1, -0.5, 0.5, 0.5,
-0.09120107, -5.085411, -7.75701, 1, 1.5, 0.5, 0.5,
-0.09120107, -5.085411, -7.75701, 0, 1.5, 0.5, 0.5
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
-4.848133, 0.3546089, -7.75701, 0, -0.5, 0.5, 0.5,
-4.848133, 0.3546089, -7.75701, 1, -0.5, 0.5, 0.5,
-4.848133, 0.3546089, -7.75701, 1, 1.5, 0.5, 0.5,
-4.848133, 0.3546089, -7.75701, 0, 1.5, 0.5, 0.5
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
-4.848133, -5.085411, -0.1124649, 0, -0.5, 0.5, 0.5,
-4.848133, -5.085411, -0.1124649, 1, -0.5, 0.5, 0.5,
-4.848133, -5.085411, -0.1124649, 1, 1.5, 0.5, 0.5,
-4.848133, -5.085411, -0.1124649, 0, 1.5, 0.5, 0.5
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
-2, -3.830022, -5.992884,
2, -3.830022, -5.992884,
-2, -3.830022, -5.992884,
-2, -4.039253, -6.286905,
0, -3.830022, -5.992884,
0, -4.039253, -6.286905,
2, -3.830022, -5.992884,
2, -4.039253, -6.286905
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
"0",
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
-2, -4.457716, -6.874947, 0, -0.5, 0.5, 0.5,
-2, -4.457716, -6.874947, 1, -0.5, 0.5, 0.5,
-2, -4.457716, -6.874947, 1, 1.5, 0.5, 0.5,
-2, -4.457716, -6.874947, 0, 1.5, 0.5, 0.5,
0, -4.457716, -6.874947, 0, -0.5, 0.5, 0.5,
0, -4.457716, -6.874947, 1, -0.5, 0.5, 0.5,
0, -4.457716, -6.874947, 1, 1.5, 0.5, 0.5,
0, -4.457716, -6.874947, 0, 1.5, 0.5, 0.5,
2, -4.457716, -6.874947, 0, -0.5, 0.5, 0.5,
2, -4.457716, -6.874947, 1, -0.5, 0.5, 0.5,
2, -4.457716, -6.874947, 1, 1.5, 0.5, 0.5,
2, -4.457716, -6.874947, 0, 1.5, 0.5, 0.5
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
-3.750379, -2, -5.992884,
-3.750379, 4, -5.992884,
-3.750379, -2, -5.992884,
-3.933338, -2, -6.286905,
-3.750379, 0, -5.992884,
-3.933338, 0, -6.286905,
-3.750379, 2, -5.992884,
-3.933338, 2, -6.286905,
-3.750379, 4, -5.992884,
-3.933338, 4, -6.286905
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
"2",
"4"
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
-4.299256, -2, -6.874947, 0, -0.5, 0.5, 0.5,
-4.299256, -2, -6.874947, 1, -0.5, 0.5, 0.5,
-4.299256, -2, -6.874947, 1, 1.5, 0.5, 0.5,
-4.299256, -2, -6.874947, 0, 1.5, 0.5, 0.5,
-4.299256, 0, -6.874947, 0, -0.5, 0.5, 0.5,
-4.299256, 0, -6.874947, 1, -0.5, 0.5, 0.5,
-4.299256, 0, -6.874947, 1, 1.5, 0.5, 0.5,
-4.299256, 0, -6.874947, 0, 1.5, 0.5, 0.5,
-4.299256, 2, -6.874947, 0, -0.5, 0.5, 0.5,
-4.299256, 2, -6.874947, 1, -0.5, 0.5, 0.5,
-4.299256, 2, -6.874947, 1, 1.5, 0.5, 0.5,
-4.299256, 2, -6.874947, 0, 1.5, 0.5, 0.5,
-4.299256, 4, -6.874947, 0, -0.5, 0.5, 0.5,
-4.299256, 4, -6.874947, 1, -0.5, 0.5, 0.5,
-4.299256, 4, -6.874947, 1, 1.5, 0.5, 0.5,
-4.299256, 4, -6.874947, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.750379, -3.830022, -4,
-3.750379, -3.830022, 4,
-3.750379, -3.830022, -4,
-3.933338, -4.039253, -4,
-3.750379, -3.830022, -2,
-3.933338, -4.039253, -2,
-3.750379, -3.830022, 0,
-3.933338, -4.039253, 0,
-3.750379, -3.830022, 2,
-3.933338, -4.039253, 2,
-3.750379, -3.830022, 4,
-3.933338, -4.039253, 4
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
-4.299256, -4.457716, -4, 0, -0.5, 0.5, 0.5,
-4.299256, -4.457716, -4, 1, -0.5, 0.5, 0.5,
-4.299256, -4.457716, -4, 1, 1.5, 0.5, 0.5,
-4.299256, -4.457716, -4, 0, 1.5, 0.5, 0.5,
-4.299256, -4.457716, -2, 0, -0.5, 0.5, 0.5,
-4.299256, -4.457716, -2, 1, -0.5, 0.5, 0.5,
-4.299256, -4.457716, -2, 1, 1.5, 0.5, 0.5,
-4.299256, -4.457716, -2, 0, 1.5, 0.5, 0.5,
-4.299256, -4.457716, 0, 0, -0.5, 0.5, 0.5,
-4.299256, -4.457716, 0, 1, -0.5, 0.5, 0.5,
-4.299256, -4.457716, 0, 1, 1.5, 0.5, 0.5,
-4.299256, -4.457716, 0, 0, 1.5, 0.5, 0.5,
-4.299256, -4.457716, 2, 0, -0.5, 0.5, 0.5,
-4.299256, -4.457716, 2, 1, -0.5, 0.5, 0.5,
-4.299256, -4.457716, 2, 1, 1.5, 0.5, 0.5,
-4.299256, -4.457716, 2, 0, 1.5, 0.5, 0.5,
-4.299256, -4.457716, 4, 0, -0.5, 0.5, 0.5,
-4.299256, -4.457716, 4, 1, -0.5, 0.5, 0.5,
-4.299256, -4.457716, 4, 1, 1.5, 0.5, 0.5,
-4.299256, -4.457716, 4, 0, 1.5, 0.5, 0.5
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
-3.750379, -3.830022, -5.992884,
-3.750379, 4.539239, -5.992884,
-3.750379, -3.830022, 5.767954,
-3.750379, 4.539239, 5.767954,
-3.750379, -3.830022, -5.992884,
-3.750379, -3.830022, 5.767954,
-3.750379, 4.539239, -5.992884,
-3.750379, 4.539239, 5.767954,
-3.750379, -3.830022, -5.992884,
3.567977, -3.830022, -5.992884,
-3.750379, -3.830022, 5.767954,
3.567977, -3.830022, 5.767954,
-3.750379, 4.539239, -5.992884,
3.567977, 4.539239, -5.992884,
-3.750379, 4.539239, 5.767954,
3.567977, 4.539239, 5.767954,
3.567977, -3.830022, -5.992884,
3.567977, 4.539239, -5.992884,
3.567977, -3.830022, 5.767954,
3.567977, 4.539239, 5.767954,
3.567977, -3.830022, -5.992884,
3.567977, -3.830022, 5.767954,
3.567977, 4.539239, -5.992884,
3.567977, 4.539239, 5.767954
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
var radius = 8.641914;
var distance = 38.44885;
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
mvMatrix.translate( 0.09120107, -0.3546089, 0.1124649 );
mvMatrix.scale( 1.276763, 1.116444, 0.7944847 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -38.44885);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
diofenolan<-read.table("diofenolan.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-diofenolan$V2
```

```
## Error in eval(expr, envir, enclos): object 'diofenolan' not found
```

```r
y<-diofenolan$V3
```

```
## Error in eval(expr, envir, enclos): object 'diofenolan' not found
```

```r
z<-diofenolan$V4
```

```
## Error in eval(expr, envir, enclos): object 'diofenolan' not found
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
-3.643801, -0.1776099, -0.5381645, 0, 0, 1, 1, 1,
-2.98901, 1.275659, -1.417765, 1, 0, 0, 1, 1,
-2.82439, -1.234922, -3.908871, 1, 0, 0, 1, 1,
-2.789514, -0.002829011, 0.9766162, 1, 0, 0, 1, 1,
-2.782349, 0.4211705, -0.3737816, 1, 0, 0, 1, 1,
-2.742051, -0.2912048, -2.381563, 1, 0, 0, 1, 1,
-2.667492, -0.2292136, -1.422183, 0, 0, 0, 1, 1,
-2.624185, -1.592129, -2.14467, 0, 0, 0, 1, 1,
-2.518308, -0.8577638, -0.584475, 0, 0, 0, 1, 1,
-2.492613, -0.1512069, -1.250168, 0, 0, 0, 1, 1,
-2.427591, 0.9449276, -0.3374268, 0, 0, 0, 1, 1,
-2.39369, -0.6264877, -1.953618, 0, 0, 0, 1, 1,
-2.371336, 1.588763, 0.4843288, 0, 0, 0, 1, 1,
-2.338003, -1.12953, -2.510007, 1, 1, 1, 1, 1,
-2.284865, 1.82573, -2.800694, 1, 1, 1, 1, 1,
-2.191883, 0.3673581, 0.7527782, 1, 1, 1, 1, 1,
-2.182162, 1.54125, 0.3435309, 1, 1, 1, 1, 1,
-2.153067, 1.817976, -2.559504, 1, 1, 1, 1, 1,
-2.068264, 0.5250924, -1.405827, 1, 1, 1, 1, 1,
-2.065287, -2.045464, -2.767064, 1, 1, 1, 1, 1,
-2.059442, 0.9394981, -2.512929, 1, 1, 1, 1, 1,
-2.009967, -0.111072, -2.425135, 1, 1, 1, 1, 1,
-1.998447, 0.4123752, -0.903394, 1, 1, 1, 1, 1,
-1.989689, -0.5578224, -3.722744, 1, 1, 1, 1, 1,
-1.988427, -2.428206, -1.791913, 1, 1, 1, 1, 1,
-1.919657, 0.3066299, -1.541932, 1, 1, 1, 1, 1,
-1.862809, 0.4364168, -1.983397, 1, 1, 1, 1, 1,
-1.807783, -0.01874879, -2.258475, 1, 1, 1, 1, 1,
-1.7966, -0.6574367, -1.524931, 0, 0, 1, 1, 1,
-1.777568, 4.417357, 1.010204, 1, 0, 0, 1, 1,
-1.767311, -2.836309, -2.244777, 1, 0, 0, 1, 1,
-1.764481, 0.3602089, -0.5657079, 1, 0, 0, 1, 1,
-1.763246, 3.009707, -1.050204, 1, 0, 0, 1, 1,
-1.760573, -0.554087, -2.369841, 1, 0, 0, 1, 1,
-1.747622, 1.485681, -2.199559, 0, 0, 0, 1, 1,
-1.744349, -1.149205, -2.609206, 0, 0, 0, 1, 1,
-1.742148, -0.4235498, -3.693448, 0, 0, 0, 1, 1,
-1.724654, -1.291064, -2.686957, 0, 0, 0, 1, 1,
-1.722432, -0.3290871, -2.157574, 0, 0, 0, 1, 1,
-1.722388, 0.249556, -0.9965805, 0, 0, 0, 1, 1,
-1.719851, -0.6899567, -2.778251, 0, 0, 0, 1, 1,
-1.719014, -1.310032, -3.461539, 1, 1, 1, 1, 1,
-1.701347, -1.537708, -1.534446, 1, 1, 1, 1, 1,
-1.688604, 1.727402, 0.01263301, 1, 1, 1, 1, 1,
-1.686881, 0.4180591, -1.034049, 1, 1, 1, 1, 1,
-1.684517, -1.040801, -2.905851, 1, 1, 1, 1, 1,
-1.671562, 1.914243, -1.962971, 1, 1, 1, 1, 1,
-1.651429, 1.260908, -0.5680795, 1, 1, 1, 1, 1,
-1.641702, 0.5417337, -1.021291, 1, 1, 1, 1, 1,
-1.638431, -1.496564, -3.263825, 1, 1, 1, 1, 1,
-1.613164, -2.500116, -0.7741473, 1, 1, 1, 1, 1,
-1.608706, -0.1319993, -1.904308, 1, 1, 1, 1, 1,
-1.608583, -0.7537107, -2.1256, 1, 1, 1, 1, 1,
-1.597937, 1.111845, -2.462787, 1, 1, 1, 1, 1,
-1.559718, 0.3473975, -1.195747, 1, 1, 1, 1, 1,
-1.550486, 0.9506738, -2.339475, 1, 1, 1, 1, 1,
-1.546091, -1.11605, -2.060135, 0, 0, 1, 1, 1,
-1.545428, 1.290502, -0.1819763, 1, 0, 0, 1, 1,
-1.543686, 0.313199, -1.371631, 1, 0, 0, 1, 1,
-1.52291, 0.1260447, -2.575429, 1, 0, 0, 1, 1,
-1.519963, 0.4958612, -0.2588703, 1, 0, 0, 1, 1,
-1.504066, 0.1402768, -1.71655, 1, 0, 0, 1, 1,
-1.498564, -0.3213079, -2.037796, 0, 0, 0, 1, 1,
-1.491291, 0.1880541, 0.3313776, 0, 0, 0, 1, 1,
-1.490525, -1.497502, -0.6091052, 0, 0, 0, 1, 1,
-1.489054, 0.2044357, -2.178437, 0, 0, 0, 1, 1,
-1.476478, -2.008683, -3.585933, 0, 0, 0, 1, 1,
-1.462303, -2.061987, -2.540916, 0, 0, 0, 1, 1,
-1.461337, -1.184273, -3.304756, 0, 0, 0, 1, 1,
-1.460508, 0.4152571, -0.3109762, 1, 1, 1, 1, 1,
-1.457494, -0.5423198, -0.5179022, 1, 1, 1, 1, 1,
-1.452028, 0.2679524, -1.038087, 1, 1, 1, 1, 1,
-1.447899, 1.729033, -1.026098, 1, 1, 1, 1, 1,
-1.44196, 0.8461172, -0.2320949, 1, 1, 1, 1, 1,
-1.434684, 1.32277, -0.5104018, 1, 1, 1, 1, 1,
-1.428422, 0.5435105, -0.6863643, 1, 1, 1, 1, 1,
-1.40854, -1.412465, -1.950611, 1, 1, 1, 1, 1,
-1.388278, -0.4795961, -0.5632128, 1, 1, 1, 1, 1,
-1.364001, -0.7124503, -1.267541, 1, 1, 1, 1, 1,
-1.362077, 0.185735, 0.6881353, 1, 1, 1, 1, 1,
-1.352207, -0.3690748, -2.342654, 1, 1, 1, 1, 1,
-1.350414, 1.091155, -0.5350339, 1, 1, 1, 1, 1,
-1.346857, 0.5354276, -0.7169765, 1, 1, 1, 1, 1,
-1.339447, -0.3859289, -2.055678, 1, 1, 1, 1, 1,
-1.332846, -0.9938655, -0.6407356, 0, 0, 1, 1, 1,
-1.328025, 0.1614757, -2.527071, 1, 0, 0, 1, 1,
-1.318857, 1.40011, -0.776049, 1, 0, 0, 1, 1,
-1.318137, -0.006844524, -1.09367, 1, 0, 0, 1, 1,
-1.31392, -2.226273, -1.355654, 1, 0, 0, 1, 1,
-1.30027, -0.6773528, -1.143405, 1, 0, 0, 1, 1,
-1.298542, 0.3778708, -0.6652855, 0, 0, 0, 1, 1,
-1.293364, 0.1107146, -0.7030261, 0, 0, 0, 1, 1,
-1.291975, -0.7919915, -1.310456, 0, 0, 0, 1, 1,
-1.291065, 0.9579282, -1.318295, 0, 0, 0, 1, 1,
-1.28745, -0.5274097, -0.1842101, 0, 0, 0, 1, 1,
-1.287252, 0.4674842, -2.036947, 0, 0, 0, 1, 1,
-1.284757, -0.2498176, -1.471541, 0, 0, 0, 1, 1,
-1.273494, 0.6430389, -3.072822, 1, 1, 1, 1, 1,
-1.27106, 0.878062, -2.276104, 1, 1, 1, 1, 1,
-1.246968, 0.9155582, -1.299274, 1, 1, 1, 1, 1,
-1.23591, -0.4902102, -2.360176, 1, 1, 1, 1, 1,
-1.233898, 1.372441, 1.98722, 1, 1, 1, 1, 1,
-1.232258, -0.4034342, -2.68964, 1, 1, 1, 1, 1,
-1.226609, -0.2630164, -2.185347, 1, 1, 1, 1, 1,
-1.21314, 0.4040543, 0.4054416, 1, 1, 1, 1, 1,
-1.211004, -0.8063045, -2.711224, 1, 1, 1, 1, 1,
-1.209901, 0.7213885, -0.3012867, 1, 1, 1, 1, 1,
-1.209527, -0.6120147, 0.7821591, 1, 1, 1, 1, 1,
-1.198563, 1.22214, -0.6187475, 1, 1, 1, 1, 1,
-1.197932, -0.04483002, -0.3418581, 1, 1, 1, 1, 1,
-1.197166, -0.6416298, -1.601645, 1, 1, 1, 1, 1,
-1.196764, 0.7621727, -1.154283, 1, 1, 1, 1, 1,
-1.193107, 0.2704111, 0.2636931, 0, 0, 1, 1, 1,
-1.19231, -0.2713609, -1.674455, 1, 0, 0, 1, 1,
-1.192206, -1.697477, -2.138941, 1, 0, 0, 1, 1,
-1.182708, 1.582037, 0.2525177, 1, 0, 0, 1, 1,
-1.179094, -1.004787, -2.065387, 1, 0, 0, 1, 1,
-1.173604, -0.6154212, -2.297256, 1, 0, 0, 1, 1,
-1.161612, -0.3790483, -2.791708, 0, 0, 0, 1, 1,
-1.151395, -1.316828, 0.3465865, 0, 0, 0, 1, 1,
-1.146107, -0.5657708, -0.5991769, 0, 0, 0, 1, 1,
-1.139197, 0.8617113, -1.446391, 0, 0, 0, 1, 1,
-1.133394, 0.9929889, -0.2451844, 0, 0, 0, 1, 1,
-1.125121, -0.2103622, -1.993861, 0, 0, 0, 1, 1,
-1.119655, -0.2653638, -2.375465, 0, 0, 0, 1, 1,
-1.118346, -0.3175596, -3.076174, 1, 1, 1, 1, 1,
-1.096406, -0.5333325, -1.058887, 1, 1, 1, 1, 1,
-1.0925, 1.563985, -0.1657751, 1, 1, 1, 1, 1,
-1.079911, -0.09118497, 0.6026619, 1, 1, 1, 1, 1,
-1.079216, -0.08074284, -1.74523, 1, 1, 1, 1, 1,
-1.0764, 0.3612365, -1.344445, 1, 1, 1, 1, 1,
-1.074669, 0.5545957, -2.181877, 1, 1, 1, 1, 1,
-1.068495, -2.647257, -3.295427, 1, 1, 1, 1, 1,
-1.065562, -1.412938, -2.767163, 1, 1, 1, 1, 1,
-1.062599, 1.515077, -0.03817225, 1, 1, 1, 1, 1,
-1.056906, -0.7071916, -4.067818, 1, 1, 1, 1, 1,
-1.051571, -0.9095373, -2.786926, 1, 1, 1, 1, 1,
-1.049237, 1.442744, -1.3903, 1, 1, 1, 1, 1,
-1.043933, 1.06021, -0.8219864, 1, 1, 1, 1, 1,
-1.031748, 1.014145, -0.5321172, 1, 1, 1, 1, 1,
-1.024392, 0.8434615, -0.2144841, 0, 0, 1, 1, 1,
-1.019031, 0.3205653, -0.2183816, 1, 0, 0, 1, 1,
-1.011224, 0.2762838, -1.133277, 1, 0, 0, 1, 1,
-1.008837, 2.240496, -0.8004213, 1, 0, 0, 1, 1,
-1.005929, 0.2940911, -0.2989012, 1, 0, 0, 1, 1,
-1.005542, 0.07527518, -1.37768, 1, 0, 0, 1, 1,
-1.002072, 1.824815, -1.3929, 0, 0, 0, 1, 1,
-1.001993, 2.15686, 0.7961217, 0, 0, 0, 1, 1,
-1.001504, -1.49047, -0.6594204, 0, 0, 0, 1, 1,
-1.000782, -0.7521617, -0.325569, 0, 0, 0, 1, 1,
-0.9884344, 0.01084702, -1.021093, 0, 0, 0, 1, 1,
-0.984474, -0.7634906, -3.175241, 0, 0, 0, 1, 1,
-0.9737835, -1.148096, -2.625889, 0, 0, 0, 1, 1,
-0.9653842, 1.173335, -0.3206615, 1, 1, 1, 1, 1,
-0.9584371, 0.7166677, -0.9911392, 1, 1, 1, 1, 1,
-0.9557195, 0.1867995, -2.002651, 1, 1, 1, 1, 1,
-0.9486826, 0.05654842, -0.5063671, 1, 1, 1, 1, 1,
-0.9477744, 1.137685, -2.494097, 1, 1, 1, 1, 1,
-0.9444248, 1.917171, 0.6603526, 1, 1, 1, 1, 1,
-0.939777, 0.7587858, -0.1986507, 1, 1, 1, 1, 1,
-0.9382367, 0.1930143, -0.6065038, 1, 1, 1, 1, 1,
-0.9381719, 1.093184, -0.4530707, 1, 1, 1, 1, 1,
-0.9364024, -0.040275, -0.3565728, 1, 1, 1, 1, 1,
-0.9323473, 1.904177, 0.4844429, 1, 1, 1, 1, 1,
-0.9319904, 1.425834, -1.021907, 1, 1, 1, 1, 1,
-0.9286034, -0.4256141, -1.858244, 1, 1, 1, 1, 1,
-0.9241884, 0.8783247, -1.271214, 1, 1, 1, 1, 1,
-0.9219385, -0.01967815, -2.496323, 1, 1, 1, 1, 1,
-0.9211246, 0.09959993, -0.9522322, 0, 0, 1, 1, 1,
-0.9197485, -0.07996655, 0.1716854, 1, 0, 0, 1, 1,
-0.9191004, -0.1961077, -1.387877, 1, 0, 0, 1, 1,
-0.9102156, -2.1919, -2.270196, 1, 0, 0, 1, 1,
-0.9080908, -0.1703001, -1.095308, 1, 0, 0, 1, 1,
-0.902138, -0.2453131, -1.1701, 1, 0, 0, 1, 1,
-0.8947863, 0.3586631, -0.1397401, 0, 0, 0, 1, 1,
-0.8906698, 0.8118311, -2.169524, 0, 0, 0, 1, 1,
-0.889919, -0.7227301, -2.110667, 0, 0, 0, 1, 1,
-0.8885394, 2.924528, -0.8589131, 0, 0, 0, 1, 1,
-0.8882359, -0.9216169, -2.326592, 0, 0, 0, 1, 1,
-0.8836173, -0.001488845, -2.818191, 0, 0, 0, 1, 1,
-0.8805932, -0.02625725, -1.781288, 0, 0, 0, 1, 1,
-0.8795124, -0.9764275, -2.81145, 1, 1, 1, 1, 1,
-0.8790756, 1.491029, 0.8343005, 1, 1, 1, 1, 1,
-0.8730235, 0.9141572, 0.1288189, 1, 1, 1, 1, 1,
-0.8654357, 1.063355, 0.8896272, 1, 1, 1, 1, 1,
-0.8644149, 0.2636054, -2.312996, 1, 1, 1, 1, 1,
-0.8526558, 1.307857, -0.5265354, 1, 1, 1, 1, 1,
-0.8510833, -1.125812, -2.031534, 1, 1, 1, 1, 1,
-0.8480918, 0.5350494, -1.16783, 1, 1, 1, 1, 1,
-0.8479932, -0.4097043, -2.259835, 1, 1, 1, 1, 1,
-0.8466386, -0.5608583, -4.674469, 1, 1, 1, 1, 1,
-0.8438587, -1.820665, -3.525056, 1, 1, 1, 1, 1,
-0.8369192, -0.09277353, 0.4192528, 1, 1, 1, 1, 1,
-0.8355547, 0.8615305, 0.7996414, 1, 1, 1, 1, 1,
-0.8221012, 0.1849699, -1.475091, 1, 1, 1, 1, 1,
-0.8105828, 0.7394189, -0.2929863, 1, 1, 1, 1, 1,
-0.8077351, 0.5347459, -1.009216, 0, 0, 1, 1, 1,
-0.7990252, -1.726478, -1.869073, 1, 0, 0, 1, 1,
-0.7978388, 0.2686737, -0.7406258, 1, 0, 0, 1, 1,
-0.7953137, 1.773534, -0.1290783, 1, 0, 0, 1, 1,
-0.7926996, 0.9244709, -0.8002256, 1, 0, 0, 1, 1,
-0.7923709, 2.06567, 1.582962, 1, 0, 0, 1, 1,
-0.79032, 0.3690678, 0.1493306, 0, 0, 0, 1, 1,
-0.788875, -0.5503521, -0.7864522, 0, 0, 0, 1, 1,
-0.7884291, -0.4295177, -1.626367, 0, 0, 0, 1, 1,
-0.7738066, 0.4192947, -0.9865642, 0, 0, 0, 1, 1,
-0.7696981, 0.9770738, 0.1853882, 0, 0, 0, 1, 1,
-0.7662228, 1.17781, -0.571356, 0, 0, 0, 1, 1,
-0.7658177, 0.6930375, -1.265225, 0, 0, 0, 1, 1,
-0.7595592, 1.679562, -0.6761762, 1, 1, 1, 1, 1,
-0.7587325, 0.2407435, -0.3624929, 1, 1, 1, 1, 1,
-0.755154, -0.2484609, -2.232402, 1, 1, 1, 1, 1,
-0.7549328, 0.3859616, -1.682521, 1, 1, 1, 1, 1,
-0.7526214, 0.6343443, -1.009742, 1, 1, 1, 1, 1,
-0.750284, -1.721382, -3.130755, 1, 1, 1, 1, 1,
-0.7375216, 0.03853304, 0.5402699, 1, 1, 1, 1, 1,
-0.7315973, 0.8465989, -0.5101646, 1, 1, 1, 1, 1,
-0.7301648, -0.5337572, -0.7357302, 1, 1, 1, 1, 1,
-0.7275786, 1.254506, 0.2011276, 1, 1, 1, 1, 1,
-0.7191957, 0.6992306, 0.7071359, 1, 1, 1, 1, 1,
-0.7169947, 0.1509786, -0.5653098, 1, 1, 1, 1, 1,
-0.7151021, -0.0936856, -0.1769343, 1, 1, 1, 1, 1,
-0.7147089, 1.377038, -2.27364, 1, 1, 1, 1, 1,
-0.7110806, 0.3152659, -2.221623, 1, 1, 1, 1, 1,
-0.7090953, 0.2307137, 0.1219143, 0, 0, 1, 1, 1,
-0.7062224, -0.5743703, -2.322541, 1, 0, 0, 1, 1,
-0.7044415, 1.184732, -0.230919, 1, 0, 0, 1, 1,
-0.7040177, 0.3532304, -1.428087, 1, 0, 0, 1, 1,
-0.7003881, 0.9748992, -1.010588, 1, 0, 0, 1, 1,
-0.6981337, -1.487829, -3.503663, 1, 0, 0, 1, 1,
-0.6957949, -1.348876, -1.692946, 0, 0, 0, 1, 1,
-0.6878822, -0.6858314, -2.267555, 0, 0, 0, 1, 1,
-0.6868209, -0.1452607, -0.745873, 0, 0, 0, 1, 1,
-0.6819682, -0.4389848, -3.150308, 0, 0, 0, 1, 1,
-0.6816274, -1.318438, -2.405752, 0, 0, 0, 1, 1,
-0.6808127, 1.126915, -2.223569, 0, 0, 0, 1, 1,
-0.6801072, 0.04674908, -1.544704, 0, 0, 0, 1, 1,
-0.68009, 1.307669, -1.040098, 1, 1, 1, 1, 1,
-0.6796958, -1.002246, -3.584937, 1, 1, 1, 1, 1,
-0.6777367, 0.4755155, -2.141908, 1, 1, 1, 1, 1,
-0.6746153, 0.2151808, -2.173162, 1, 1, 1, 1, 1,
-0.6742435, -0.6294034, -3.270854, 1, 1, 1, 1, 1,
-0.6704397, 0.17873, -1.60842, 1, 1, 1, 1, 1,
-0.6689296, 0.2534091, -1.823508, 1, 1, 1, 1, 1,
-0.6678133, 1.030594, -1.283075, 1, 1, 1, 1, 1,
-0.6664627, -0.9383896, -2.465183, 1, 1, 1, 1, 1,
-0.6639487, 0.3412333, -3.703591, 1, 1, 1, 1, 1,
-0.6631267, 0.1570905, -1.363559, 1, 1, 1, 1, 1,
-0.6626593, 0.9243075, -1.8347, 1, 1, 1, 1, 1,
-0.6617239, -0.1544251, -0.9956574, 1, 1, 1, 1, 1,
-0.661209, -0.02502437, -0.6156571, 1, 1, 1, 1, 1,
-0.6585675, 0.7041271, 0.3904213, 1, 1, 1, 1, 1,
-0.6424755, -0.9555369, -0.5718792, 0, 0, 1, 1, 1,
-0.6339256, 0.4496647, -0.02451464, 1, 0, 0, 1, 1,
-0.633382, -0.7398717, -1.292083, 1, 0, 0, 1, 1,
-0.6315901, -1.043363, -1.009845, 1, 0, 0, 1, 1,
-0.6311037, -0.1221569, -2.699864, 1, 0, 0, 1, 1,
-0.6298856, -0.2974004, -2.243637, 1, 0, 0, 1, 1,
-0.6250857, -1.290521, -1.137269, 0, 0, 0, 1, 1,
-0.6241802, -0.3780976, -3.281757, 0, 0, 0, 1, 1,
-0.6215699, 0.4628949, -2.042218, 0, 0, 0, 1, 1,
-0.6191483, 0.01878104, -2.117394, 0, 0, 0, 1, 1,
-0.6179117, 0.3526945, 0.2079129, 0, 0, 0, 1, 1,
-0.6148062, 0.7123017, -0.1493963, 0, 0, 0, 1, 1,
-0.6127772, 0.8537354, 0.5636379, 0, 0, 0, 1, 1,
-0.6116108, 0.698932, -1.624965, 1, 1, 1, 1, 1,
-0.602227, -0.2709483, -1.71995, 1, 1, 1, 1, 1,
-0.598445, 0.4627696, 0.1605608, 1, 1, 1, 1, 1,
-0.5949591, 0.6366995, -0.7351002, 1, 1, 1, 1, 1,
-0.5903099, 1.066912, -0.3355756, 1, 1, 1, 1, 1,
-0.5897176, -0.1875406, -1.481812, 1, 1, 1, 1, 1,
-0.5882574, 0.2256129, -1.934704, 1, 1, 1, 1, 1,
-0.5858451, -0.1524158, -1.267822, 1, 1, 1, 1, 1,
-0.5838308, -1.836665, -3.119267, 1, 1, 1, 1, 1,
-0.5819257, 1.385396, -1.18275, 1, 1, 1, 1, 1,
-0.58161, -0.9545788, -2.726453, 1, 1, 1, 1, 1,
-0.5805245, 2.109043, -0.6257987, 1, 1, 1, 1, 1,
-0.5759061, 0.6767364, -1.991686, 1, 1, 1, 1, 1,
-0.5756343, -0.854075, -1.834854, 1, 1, 1, 1, 1,
-0.5746872, -2.625975, -4.107249, 1, 1, 1, 1, 1,
-0.5720785, -0.02025301, -2.65235, 0, 0, 1, 1, 1,
-0.5532203, 0.5767438, -0.529099, 1, 0, 0, 1, 1,
-0.5528686, -0.3225863, -3.199984, 1, 0, 0, 1, 1,
-0.5520043, 0.9715844, 0.1511589, 1, 0, 0, 1, 1,
-0.5509099, 1.889127, -0.1395078, 1, 0, 0, 1, 1,
-0.5502224, -0.05931571, -1.716581, 1, 0, 0, 1, 1,
-0.5448367, -0.9838603, -2.492004, 0, 0, 0, 1, 1,
-0.544512, -0.7777163, -4.726154, 0, 0, 0, 1, 1,
-0.5435587, 1.311376, 0.3462905, 0, 0, 0, 1, 1,
-0.5403278, -0.06375559, -1.671496, 0, 0, 0, 1, 1,
-0.5402316, 0.9275249, -0.3413825, 0, 0, 0, 1, 1,
-0.5399044, 0.3597465, -2.028609, 0, 0, 0, 1, 1,
-0.5359877, 0.1125886, -0.7368978, 0, 0, 0, 1, 1,
-0.5353433, 1.003566, 0.2106236, 1, 1, 1, 1, 1,
-0.5348574, -0.2459508, -1.79617, 1, 1, 1, 1, 1,
-0.5307124, -1.970871, -0.9615859, 1, 1, 1, 1, 1,
-0.52709, -1.548499, -2.860267, 1, 1, 1, 1, 1,
-0.5246844, 0.1936428, -1.974274, 1, 1, 1, 1, 1,
-0.5225716, -0.5735989, -0.891671, 1, 1, 1, 1, 1,
-0.5200721, 0.3678763, -0.5379612, 1, 1, 1, 1, 1,
-0.5168906, -0.6574454, -1.897915, 1, 1, 1, 1, 1,
-0.5161496, -2.136148, -3.774479, 1, 1, 1, 1, 1,
-0.5110719, -1.802907, -2.586057, 1, 1, 1, 1, 1,
-0.5106375, -1.490943, -3.166124, 1, 1, 1, 1, 1,
-0.5071638, 0.09243561, -1.876169, 1, 1, 1, 1, 1,
-0.5040456, -0.9368591, -0.7016732, 1, 1, 1, 1, 1,
-0.5035167, -0.8411422, -0.9927934, 1, 1, 1, 1, 1,
-0.5030417, 0.282198, -1.74523, 1, 1, 1, 1, 1,
-0.5010664, 1.304298, -0.6573156, 0, 0, 1, 1, 1,
-0.4973422, 1.234721, -0.3432899, 1, 0, 0, 1, 1,
-0.4967231, -0.5543697, -1.274349, 1, 0, 0, 1, 1,
-0.4933841, 0.271023, -1.242372, 1, 0, 0, 1, 1,
-0.4908729, -0.3399604, -1.938493, 1, 0, 0, 1, 1,
-0.4890679, 0.2660157, -1.512734, 1, 0, 0, 1, 1,
-0.4879789, 0.08186686, -0.801012, 0, 0, 0, 1, 1,
-0.4839228, 0.2836242, -2.66649, 0, 0, 0, 1, 1,
-0.4837996, -1.32893, -0.996369, 0, 0, 0, 1, 1,
-0.4837748, -1.731565, -1.508857, 0, 0, 0, 1, 1,
-0.483693, 0.1505151, -0.3235082, 0, 0, 0, 1, 1,
-0.4826508, -0.4470482, -0.9845214, 0, 0, 0, 1, 1,
-0.4778042, 0.4611499, -1.599918, 0, 0, 0, 1, 1,
-0.4773439, -0.1383416, -1.716297, 1, 1, 1, 1, 1,
-0.4763971, -0.6782286, -2.259145, 1, 1, 1, 1, 1,
-0.4732601, 0.4187253, -1.78095, 1, 1, 1, 1, 1,
-0.4703461, 0.518845, -1.292198, 1, 1, 1, 1, 1,
-0.4699991, -0.5408475, -3.864877, 1, 1, 1, 1, 1,
-0.4693994, -0.4944551, -1.078263, 1, 1, 1, 1, 1,
-0.467559, 0.5209286, -1.069564, 1, 1, 1, 1, 1,
-0.4673232, 0.4028698, -1.937405, 1, 1, 1, 1, 1,
-0.4668418, 0.5609059, -0.04487828, 1, 1, 1, 1, 1,
-0.4660556, 0.170633, -1.617062, 1, 1, 1, 1, 1,
-0.4643312, -0.6548576, -3.724407, 1, 1, 1, 1, 1,
-0.4602034, -0.810096, -2.635511, 1, 1, 1, 1, 1,
-0.4601288, -0.2983466, -2.486031, 1, 1, 1, 1, 1,
-0.454913, -0.8085517, -0.9078546, 1, 1, 1, 1, 1,
-0.4508739, -1.15881, -3.314371, 1, 1, 1, 1, 1,
-0.4480122, 0.4136354, -2.074236, 0, 0, 1, 1, 1,
-0.4471788, -0.3658091, -2.743528, 1, 0, 0, 1, 1,
-0.4463479, -0.8651032, -3.0982, 1, 0, 0, 1, 1,
-0.4463151, -0.8983747, -3.137905, 1, 0, 0, 1, 1,
-0.4454658, -0.145696, -0.4658685, 1, 0, 0, 1, 1,
-0.4454513, -0.7838342, -1.835036, 1, 0, 0, 1, 1,
-0.4422437, -0.4772633, -2.378615, 0, 0, 0, 1, 1,
-0.4402795, -0.7533283, -2.378476, 0, 0, 0, 1, 1,
-0.4384404, -0.857763, -3.091175, 0, 0, 0, 1, 1,
-0.438081, 0.6298024, 0.8778557, 0, 0, 0, 1, 1,
-0.4350135, 0.7584705, -0.4997592, 0, 0, 0, 1, 1,
-0.4316725, 0.9259347, -1.364215, 0, 0, 0, 1, 1,
-0.4301783, 1.876331, -0.7811908, 0, 0, 0, 1, 1,
-0.4212377, 0.1163976, -1.187388, 1, 1, 1, 1, 1,
-0.4199881, 2.046198, 0.7124003, 1, 1, 1, 1, 1,
-0.4174312, 0.2966433, -0.298865, 1, 1, 1, 1, 1,
-0.4168678, 0.6252508, 0.7399209, 1, 1, 1, 1, 1,
-0.4146924, 0.9050634, -0.5996374, 1, 1, 1, 1, 1,
-0.4112248, 0.398363, -1.356371, 1, 1, 1, 1, 1,
-0.4091128, 0.5684282, -0.1178155, 1, 1, 1, 1, 1,
-0.4051898, 0.2521029, -1.795646, 1, 1, 1, 1, 1,
-0.4010926, 0.8606578, -1.82547, 1, 1, 1, 1, 1,
-0.4008879, -1.565351, -3.198709, 1, 1, 1, 1, 1,
-0.3996304, 0.6243255, -0.8775738, 1, 1, 1, 1, 1,
-0.3977199, -1.080823, -3.7063, 1, 1, 1, 1, 1,
-0.3974563, -0.6230916, -3.306504, 1, 1, 1, 1, 1,
-0.3932964, 0.9660767, -1.502653, 1, 1, 1, 1, 1,
-0.3887923, 1.443321, -0.2921278, 1, 1, 1, 1, 1,
-0.3842954, 0.3286124, -0.647463, 0, 0, 1, 1, 1,
-0.3753109, 0.1696834, -2.500375, 1, 0, 0, 1, 1,
-0.3727011, -0.1049742, -1.293535, 1, 0, 0, 1, 1,
-0.371951, -0.1123228, -0.5371944, 1, 0, 0, 1, 1,
-0.3696074, -0.9333914, -2.434691, 1, 0, 0, 1, 1,
-0.3684646, 0.2861592, -0.4145985, 1, 0, 0, 1, 1,
-0.364338, 0.4210299, -0.875299, 0, 0, 0, 1, 1,
-0.3636955, 0.758356, 1.379027, 0, 0, 0, 1, 1,
-0.3607642, -0.4278793, -2.883254, 0, 0, 0, 1, 1,
-0.3605059, -0.5412749, -3.728742, 0, 0, 0, 1, 1,
-0.3599811, 0.8029078, -1.889605, 0, 0, 0, 1, 1,
-0.3592946, -0.4228642, -0.8106676, 0, 0, 0, 1, 1,
-0.3588813, -2.015494, -4.416376, 0, 0, 0, 1, 1,
-0.3585385, 0.2855598, -0.1501411, 1, 1, 1, 1, 1,
-0.3567971, -1.44663, -1.787174, 1, 1, 1, 1, 1,
-0.3560365, 1.958638, 0.8284529, 1, 1, 1, 1, 1,
-0.3521594, -1.120708, -2.992367, 1, 1, 1, 1, 1,
-0.351644, -1.006981, -5.82161, 1, 1, 1, 1, 1,
-0.3516091, 1.271327, -1.222469, 1, 1, 1, 1, 1,
-0.3463697, -0.487371, -3.393422, 1, 1, 1, 1, 1,
-0.3445899, 0.5817181, -0.2186806, 1, 1, 1, 1, 1,
-0.3406618, 0.09482569, -1.641933, 1, 1, 1, 1, 1,
-0.3381782, -0.2435529, -2.710671, 1, 1, 1, 1, 1,
-0.3328758, -0.01326728, -0.6992575, 1, 1, 1, 1, 1,
-0.325103, -0.5032592, -2.39066, 1, 1, 1, 1, 1,
-0.3227161, -0.574048, -3.449613, 1, 1, 1, 1, 1,
-0.3221718, -0.2001752, -2.588223, 1, 1, 1, 1, 1,
-0.3200534, 0.6238875, 0.3377787, 1, 1, 1, 1, 1,
-0.3197241, -1.328602, -2.864832, 0, 0, 1, 1, 1,
-0.3182458, -0.7618161, -2.675558, 1, 0, 0, 1, 1,
-0.3115623, -1.066276, -1.838989, 1, 0, 0, 1, 1,
-0.3098381, 0.214782, -0.399765, 1, 0, 0, 1, 1,
-0.3083355, 0.9224033, 1.828248, 1, 0, 0, 1, 1,
-0.3060084, 0.9160779, -1.156784, 1, 0, 0, 1, 1,
-0.3053021, -0.002648712, -1.174692, 0, 0, 0, 1, 1,
-0.3027541, 0.5809433, -0.1184435, 0, 0, 0, 1, 1,
-0.299531, 2.569687, -0.7166031, 0, 0, 0, 1, 1,
-0.2981896, 0.9591031, 2.669645, 0, 0, 0, 1, 1,
-0.2971963, 0.9052995, -1.430596, 0, 0, 0, 1, 1,
-0.2949886, -1.716467, -3.449665, 0, 0, 0, 1, 1,
-0.2931442, -0.06772647, -2.694151, 0, 0, 0, 1, 1,
-0.2890322, 0.07508729, -1.746589, 1, 1, 1, 1, 1,
-0.2871927, 1.549665, -0.174385, 1, 1, 1, 1, 1,
-0.2859516, 0.5046492, 0.4026851, 1, 1, 1, 1, 1,
-0.2820871, 0.4075765, -1.365847, 1, 1, 1, 1, 1,
-0.2813941, 0.2953699, -2.014589, 1, 1, 1, 1, 1,
-0.2812732, -0.291306, -1.280357, 1, 1, 1, 1, 1,
-0.2632932, 0.3823485, 1.59772, 1, 1, 1, 1, 1,
-0.2620447, -0.9118274, -3.62711, 1, 1, 1, 1, 1,
-0.261292, 0.5932987, 0.1293717, 1, 1, 1, 1, 1,
-0.2587995, -0.7285515, -1.901806, 1, 1, 1, 1, 1,
-0.2529546, 0.8697985, 1.518248, 1, 1, 1, 1, 1,
-0.2516052, -0.6881373, -3.104955, 1, 1, 1, 1, 1,
-0.2485754, -0.5347361, -2.406158, 1, 1, 1, 1, 1,
-0.2467448, 1.704447, 0.4827229, 1, 1, 1, 1, 1,
-0.2437224, 0.005299888, 0.6655907, 1, 1, 1, 1, 1,
-0.2410635, 0.3645844, -1.286696, 0, 0, 1, 1, 1,
-0.2396007, 0.02384788, -0.7590314, 1, 0, 0, 1, 1,
-0.2395393, -0.9835642, -3.396525, 1, 0, 0, 1, 1,
-0.2380539, 0.8068575, -0.08752363, 1, 0, 0, 1, 1,
-0.237635, 0.6908811, -1.241765, 1, 0, 0, 1, 1,
-0.237274, -0.3333307, -3.213663, 1, 0, 0, 1, 1,
-0.2321145, -0.428977, -4.362147, 0, 0, 0, 1, 1,
-0.2304755, -0.7945283, -1.729308, 0, 0, 0, 1, 1,
-0.2272661, -1.090053, -3.838538, 0, 0, 0, 1, 1,
-0.2241604, -1.060613, -2.776486, 0, 0, 0, 1, 1,
-0.2212061, 2.221812, -0.198166, 0, 0, 0, 1, 1,
-0.2123764, 0.2664027, 0.117291, 0, 0, 0, 1, 1,
-0.2114281, 0.3059031, 0.8257509, 0, 0, 0, 1, 1,
-0.2109331, 0.5124743, 1.597632, 1, 1, 1, 1, 1,
-0.202476, 0.08811363, -3.505065, 1, 1, 1, 1, 1,
-0.201809, 0.6234356, -1.289926, 1, 1, 1, 1, 1,
-0.1973137, -0.9400637, -3.633843, 1, 1, 1, 1, 1,
-0.1939264, -0.7837924, -1.917308, 1, 1, 1, 1, 1,
-0.190056, -1.176163, -3.670033, 1, 1, 1, 1, 1,
-0.1877723, -0.1694566, -1.203685, 1, 1, 1, 1, 1,
-0.1855019, -0.352138, -1.729612, 1, 1, 1, 1, 1,
-0.1849662, 1.11723, -0.1604423, 1, 1, 1, 1, 1,
-0.183226, -0.7654748, -5.038764, 1, 1, 1, 1, 1,
-0.1787363, -0.2712046, -2.254725, 1, 1, 1, 1, 1,
-0.1726093, 0.4784456, 0.02762792, 1, 1, 1, 1, 1,
-0.1652052, 0.4012092, 0.4059249, 1, 1, 1, 1, 1,
-0.1646821, 0.07198322, -0.6906296, 1, 1, 1, 1, 1,
-0.1645007, 0.4499121, -0.180629, 1, 1, 1, 1, 1,
-0.1641395, 0.7204392, -1.530278, 0, 0, 1, 1, 1,
-0.1636402, -0.2697096, -1.786234, 1, 0, 0, 1, 1,
-0.1625463, -0.1145353, -1.752753, 1, 0, 0, 1, 1,
-0.1620982, 0.2132298, -1.202932, 1, 0, 0, 1, 1,
-0.1618204, 1.59463, 0.3331904, 1, 0, 0, 1, 1,
-0.1610004, -1.568739, -3.220423, 1, 0, 0, 1, 1,
-0.1574016, -0.7479733, -2.320563, 0, 0, 0, 1, 1,
-0.1570165, -1.181772, -4.291965, 0, 0, 0, 1, 1,
-0.1566344, 1.860905, -0.4437296, 0, 0, 0, 1, 1,
-0.1546299, 0.3121148, -1.019774, 0, 0, 0, 1, 1,
-0.1528596, -0.7791255, -3.615748, 0, 0, 0, 1, 1,
-0.1525588, 1.478756, 0.2306893, 0, 0, 0, 1, 1,
-0.1501724, 1.231227, -1.272743, 0, 0, 0, 1, 1,
-0.1454757, -0.3877349, -2.213448, 1, 1, 1, 1, 1,
-0.1428532, -0.9818498, -2.990702, 1, 1, 1, 1, 1,
-0.1372677, 1.138377, -0.5684788, 1, 1, 1, 1, 1,
-0.1356054, -0.1029464, -1.6216, 1, 1, 1, 1, 1,
-0.128424, -1.976728, -1.467474, 1, 1, 1, 1, 1,
-0.1280588, 1.31268, 0.1049133, 1, 1, 1, 1, 1,
-0.1200515, 0.196016, -0.486076, 1, 1, 1, 1, 1,
-0.1170689, -0.07845248, -1.528163, 1, 1, 1, 1, 1,
-0.1169692, -0.1813539, -4.166002, 1, 1, 1, 1, 1,
-0.1041623, -0.4436718, -2.902805, 1, 1, 1, 1, 1,
-0.1012019, 0.5625314, -0.285551, 1, 1, 1, 1, 1,
-0.1011041, 0.4692352, -0.7838774, 1, 1, 1, 1, 1,
-0.1004039, -1.59895, -3.537062, 1, 1, 1, 1, 1,
-0.08633079, -0.7894763, -2.748166, 1, 1, 1, 1, 1,
-0.08624455, 1.011301, 0.932669, 1, 1, 1, 1, 1,
-0.08521467, 1.219472, 1.451546, 0, 0, 1, 1, 1,
-0.0783976, -1.768701, -3.169664, 1, 0, 0, 1, 1,
-0.07832056, -0.0754087, -3.392942, 1, 0, 0, 1, 1,
-0.07810209, -0.867631, -0.8603349, 1, 0, 0, 1, 1,
-0.07687271, -0.05412073, -4.276722, 1, 0, 0, 1, 1,
-0.0742967, -0.3499353, -2.368169, 1, 0, 0, 1, 1,
-0.07301033, 1.15395, -1.723092, 0, 0, 0, 1, 1,
-0.07280192, 0.662257, -0.3121764, 0, 0, 0, 1, 1,
-0.06771497, -0.94458, -3.343857, 0, 0, 0, 1, 1,
-0.06602407, 1.419343, 0.2225974, 0, 0, 0, 1, 1,
-0.06490156, 1.079744, 2.12707, 0, 0, 0, 1, 1,
-0.06357807, -0.4046776, -3.96813, 0, 0, 0, 1, 1,
-0.06344361, 0.2921089, -0.9601878, 0, 0, 0, 1, 1,
-0.06233147, 1.430636, -2.176892, 1, 1, 1, 1, 1,
-0.06166806, 1.216102, -0.9072485, 1, 1, 1, 1, 1,
-0.05525267, -1.305592, -2.664811, 1, 1, 1, 1, 1,
-0.05220396, 0.7119498, 0.2779461, 1, 1, 1, 1, 1,
-0.05215422, -1.539855, -3.355434, 1, 1, 1, 1, 1,
-0.05209491, 1.079674, -0.6227003, 1, 1, 1, 1, 1,
-0.04562128, 0.9282702, 0.5855864, 1, 1, 1, 1, 1,
-0.03538516, -0.4585609, -2.654173, 1, 1, 1, 1, 1,
-0.03507171, -0.2576569, -2.349044, 1, 1, 1, 1, 1,
-0.03185165, 0.5335373, 1.196819, 1, 1, 1, 1, 1,
-0.03183347, -1.608629, -3.12226, 1, 1, 1, 1, 1,
-0.03064576, 1.73646, -0.8907001, 1, 1, 1, 1, 1,
-0.02901855, -0.6152077, -2.493367, 1, 1, 1, 1, 1,
-0.02849505, -1.156324, -2.439902, 1, 1, 1, 1, 1,
-0.02645191, 1.211599, -1.508516, 1, 1, 1, 1, 1,
-0.02468899, 0.8636115, -0.6579975, 0, 0, 1, 1, 1,
-0.02377399, 0.3601478, 0.5146242, 1, 0, 0, 1, 1,
-0.02172217, -0.4871483, -3.996589, 1, 0, 0, 1, 1,
-0.01086047, 0.1053175, 0.04745185, 1, 0, 0, 1, 1,
-0.005474231, -0.6918537, -2.029559, 1, 0, 0, 1, 1,
-0.004306203, -0.6000777, -2.711991, 1, 0, 0, 1, 1,
0.004742564, 0.5148898, 1.573271, 0, 0, 0, 1, 1,
0.005481325, 0.2495215, -1.065915, 0, 0, 0, 1, 1,
0.007042256, -0.07460063, 4.105762, 0, 0, 0, 1, 1,
0.007203915, -0.1883272, 1.946723, 0, 0, 0, 1, 1,
0.007941162, 0.8868966, -0.421998, 0, 0, 0, 1, 1,
0.008972887, 1.24775, -1.135833, 0, 0, 0, 1, 1,
0.01130524, -0.761144, 2.573314, 0, 0, 0, 1, 1,
0.01178532, -1.42797, 2.542031, 1, 1, 1, 1, 1,
0.01417505, 1.200657, 1.851736, 1, 1, 1, 1, 1,
0.0153825, -0.06469779, 2.673101, 1, 1, 1, 1, 1,
0.01938058, 0.5542062, -0.09993085, 1, 1, 1, 1, 1,
0.01964681, 1.034571, -1.061835, 1, 1, 1, 1, 1,
0.03727978, -1.258934, 2.963625, 1, 1, 1, 1, 1,
0.04162738, -0.4480371, 3.465992, 1, 1, 1, 1, 1,
0.0491217, 0.889632, 0.9583174, 1, 1, 1, 1, 1,
0.0659348, 1.142037, 0.1826597, 1, 1, 1, 1, 1,
0.07004729, 1.264367, 1.047073, 1, 1, 1, 1, 1,
0.07267164, -1.05344, 3.218346, 1, 1, 1, 1, 1,
0.07639307, 0.3117589, -1.321777, 1, 1, 1, 1, 1,
0.07806021, 0.6336884, -0.427633, 1, 1, 1, 1, 1,
0.07945056, 0.555896, -1.323799, 1, 1, 1, 1, 1,
0.08065562, -2.423513, 1.638371, 1, 1, 1, 1, 1,
0.08414026, 0.6738134, 0.6432592, 0, 0, 1, 1, 1,
0.09308946, 1.446334, 0.6896049, 1, 0, 0, 1, 1,
0.09393573, -0.9444979, 4.315321, 1, 0, 0, 1, 1,
0.09543848, -0.3269341, 2.715887, 1, 0, 0, 1, 1,
0.09881271, 0.9665534, -2.738494, 1, 0, 0, 1, 1,
0.1026163, 0.3183033, 0.9539452, 1, 0, 0, 1, 1,
0.1057009, -0.5002003, 2.046653, 0, 0, 0, 1, 1,
0.1106432, -1.208395, 2.459687, 0, 0, 0, 1, 1,
0.1120621, -0.4650694, 3.060648, 0, 0, 0, 1, 1,
0.1147565, -0.8317934, 2.190786, 0, 0, 0, 1, 1,
0.1187765, 0.6183742, 1.760441, 0, 0, 0, 1, 1,
0.1221045, 0.4053374, -0.3004306, 0, 0, 0, 1, 1,
0.1306572, 1.099114, 1.378884, 0, 0, 0, 1, 1,
0.1313738, 0.3420349, 1.373134, 1, 1, 1, 1, 1,
0.1358911, -1.433918, 0.03002271, 1, 1, 1, 1, 1,
0.1365804, -0.2364382, 2.911235, 1, 1, 1, 1, 1,
0.1398736, -0.06004975, 0.403431, 1, 1, 1, 1, 1,
0.1401278, 0.8148242, -0.2674402, 1, 1, 1, 1, 1,
0.1406324, 0.985406, 0.2155487, 1, 1, 1, 1, 1,
0.141485, -0.02209723, 1.183807, 1, 1, 1, 1, 1,
0.1416805, -0.5811329, 2.443786, 1, 1, 1, 1, 1,
0.1435399, -2.09623, 1.771868, 1, 1, 1, 1, 1,
0.144439, 2.020575, 0.4884111, 1, 1, 1, 1, 1,
0.1510029, -0.8645801, 1.160926, 1, 1, 1, 1, 1,
0.1523254, -0.04791695, 3.421946, 1, 1, 1, 1, 1,
0.1599505, 1.361093, -1.438699, 1, 1, 1, 1, 1,
0.1605106, -2.758584, 1.462786, 1, 1, 1, 1, 1,
0.1615144, -0.7753022, 3.861008, 1, 1, 1, 1, 1,
0.1617374, 1.124364, 1.074927, 0, 0, 1, 1, 1,
0.1619266, 0.1992616, 0.9002377, 1, 0, 0, 1, 1,
0.1623915, 1.251666, -0.4782374, 1, 0, 0, 1, 1,
0.1648545, -0.1691932, 1.857124, 1, 0, 0, 1, 1,
0.1648884, 1.560925, 0.5920242, 1, 0, 0, 1, 1,
0.1663733, -0.1861892, 2.594534, 1, 0, 0, 1, 1,
0.1731862, -2.260421, 3.709594, 0, 0, 0, 1, 1,
0.1737168, 2.121607, 2.554248, 0, 0, 0, 1, 1,
0.1758671, -0.7118496, 4.086111, 0, 0, 0, 1, 1,
0.1833159, -2.285034, 3.349996, 0, 0, 0, 1, 1,
0.1885198, 1.090777, 1.00985, 0, 0, 0, 1, 1,
0.1892318, -0.003804029, 3.749341, 0, 0, 0, 1, 1,
0.1915337, 1.204671, -0.1660159, 0, 0, 0, 1, 1,
0.1945549, 0.1109161, 1.381703, 1, 1, 1, 1, 1,
0.1972605, 0.5087085, -0.8271254, 1, 1, 1, 1, 1,
0.1973009, -0.8209614, 1.859055, 1, 1, 1, 1, 1,
0.1976676, -0.823295, 2.282374, 1, 1, 1, 1, 1,
0.1977495, 0.4551541, 1.040247, 1, 1, 1, 1, 1,
0.200113, -1.184733, 3.812944, 1, 1, 1, 1, 1,
0.2088749, 0.6452656, 0.7622713, 1, 1, 1, 1, 1,
0.2119323, -0.8183346, 3.900666, 1, 1, 1, 1, 1,
0.2219507, 0.6382157, 1.166644, 1, 1, 1, 1, 1,
0.2248345, -1.286136, 3.296224, 1, 1, 1, 1, 1,
0.2331731, 0.3056256, 0.02357404, 1, 1, 1, 1, 1,
0.2339149, 0.228966, 1.470163, 1, 1, 1, 1, 1,
0.234676, -0.9801124, 2.361688, 1, 1, 1, 1, 1,
0.2373504, -0.4469263, 2.011748, 1, 1, 1, 1, 1,
0.237921, 1.42753, 0.5667602, 1, 1, 1, 1, 1,
0.2395476, -0.6545263, 3.13993, 0, 0, 1, 1, 1,
0.2409137, -3.708139, 3.712368, 1, 0, 0, 1, 1,
0.2423123, 1.169657, 1.174435, 1, 0, 0, 1, 1,
0.2475238, 1.607114, -0.5431266, 1, 0, 0, 1, 1,
0.2481407, 0.321639, 0.541387, 1, 0, 0, 1, 1,
0.2487838, -0.2119889, 2.153849, 1, 0, 0, 1, 1,
0.2491699, -1.360097, 3.819463, 0, 0, 0, 1, 1,
0.2555605, -0.5757446, 2.374846, 0, 0, 0, 1, 1,
0.2567254, -0.4785686, 1.103147, 0, 0, 0, 1, 1,
0.2647685, -0.08863918, 1.129643, 0, 0, 0, 1, 1,
0.2657878, -0.2043981, 1.083172, 0, 0, 0, 1, 1,
0.2666641, 1.378279, -1.039286, 0, 0, 0, 1, 1,
0.2700959, -1.01727, 3.69724, 0, 0, 0, 1, 1,
0.2717059, 1.01772, 0.4887941, 1, 1, 1, 1, 1,
0.2733315, -1.711843, 2.58682, 1, 1, 1, 1, 1,
0.2740298, -1.122578, 4.21, 1, 1, 1, 1, 1,
0.2742898, -0.03472826, 2.17913, 1, 1, 1, 1, 1,
0.27442, -1.249688, 2.789547, 1, 1, 1, 1, 1,
0.2752939, -1.242446, 4.146567, 1, 1, 1, 1, 1,
0.2755807, -2.082293, 4.212317, 1, 1, 1, 1, 1,
0.2783131, 0.5905054, 0.6842077, 1, 1, 1, 1, 1,
0.2810099, 1.01946, 0.7663199, 1, 1, 1, 1, 1,
0.2810238, 0.7034325, 1.988156, 1, 1, 1, 1, 1,
0.2830311, 0.3301621, 0.1234422, 1, 1, 1, 1, 1,
0.2844995, 0.2310961, -0.7017189, 1, 1, 1, 1, 1,
0.2884043, -0.8522534, 3.986915, 1, 1, 1, 1, 1,
0.2965117, -0.227594, 1.914288, 1, 1, 1, 1, 1,
0.3005342, -1.374506, 0.4236923, 1, 1, 1, 1, 1,
0.305633, -0.4690073, 2.795241, 0, 0, 1, 1, 1,
0.3076989, -0.3417544, 2.2343, 1, 0, 0, 1, 1,
0.3101048, 1.150061, 1.080346, 1, 0, 0, 1, 1,
0.3147156, 0.2764447, 1.430061, 1, 0, 0, 1, 1,
0.3163031, 0.1349556, 1.432933, 1, 0, 0, 1, 1,
0.3198918, -0.624727, 1.668635, 1, 0, 0, 1, 1,
0.3227616, -0.004423414, 0.4202585, 0, 0, 0, 1, 1,
0.3286654, 1.772479, -0.07901422, 0, 0, 0, 1, 1,
0.3321042, 0.1411564, 0.9081067, 0, 0, 0, 1, 1,
0.3471577, -0.651207, 5.59668, 0, 0, 0, 1, 1,
0.3482091, 1.026385, -0.6997436, 0, 0, 0, 1, 1,
0.3509756, 0.250289, 1.357271, 0, 0, 0, 1, 1,
0.3530652, 0.202092, 1.434246, 0, 0, 0, 1, 1,
0.3558775, -0.4257625, 2.020213, 1, 1, 1, 1, 1,
0.3559659, -1.206413, 2.613049, 1, 1, 1, 1, 1,
0.3564517, 1.056421, 1.603264, 1, 1, 1, 1, 1,
0.3568538, -0.585641, 4.971779, 1, 1, 1, 1, 1,
0.3580264, -0.8023071, 2.656345, 1, 1, 1, 1, 1,
0.3594405, -0.0516746, 2.428823, 1, 1, 1, 1, 1,
0.359488, -2.06172, 2.197977, 1, 1, 1, 1, 1,
0.3601091, 0.2995892, 3.022538, 1, 1, 1, 1, 1,
0.3685921, 0.2252601, -0.9679589, 1, 1, 1, 1, 1,
0.3698864, -0.9725168, 3.626888, 1, 1, 1, 1, 1,
0.3731597, -2.211535, 1.446366, 1, 1, 1, 1, 1,
0.3757767, -2.41925, 2.877783, 1, 1, 1, 1, 1,
0.3796286, 0.505948, -0.5475807, 1, 1, 1, 1, 1,
0.3799712, -1.047744, 2.456188, 1, 1, 1, 1, 1,
0.383452, 0.6351067, 0.5537415, 1, 1, 1, 1, 1,
0.384457, 1.629611, 1.736439, 0, 0, 1, 1, 1,
0.3870941, -0.8179685, 2.91819, 1, 0, 0, 1, 1,
0.3913386, 2.878601, 0.8063799, 1, 0, 0, 1, 1,
0.3945232, -1.179297, 4.107368, 1, 0, 0, 1, 1,
0.3956264, 1.273634, 1.47447, 1, 0, 0, 1, 1,
0.4007626, -0.3537312, 1.964256, 1, 0, 0, 1, 1,
0.4043038, 0.1530269, 2.691817, 0, 0, 0, 1, 1,
0.4072926, -0.4067836, 3.141944, 0, 0, 0, 1, 1,
0.4073216, -0.8427696, 3.439574, 0, 0, 0, 1, 1,
0.411009, 0.5259746, 0.06713329, 0, 0, 0, 1, 1,
0.4111455, 1.193918, 1.50266, 0, 0, 0, 1, 1,
0.4126465, -0.8480672, 1.133587, 0, 0, 0, 1, 1,
0.4143366, -0.4877129, 2.485717, 0, 0, 0, 1, 1,
0.4160557, 0.9767516, 0.4042947, 1, 1, 1, 1, 1,
0.4174248, 2.178147, -0.8209009, 1, 1, 1, 1, 1,
0.4207975, 0.502048, 0.6275616, 1, 1, 1, 1, 1,
0.4281066, -1.637653, 4.341807, 1, 1, 1, 1, 1,
0.4436215, -0.2557037, 1.36104, 1, 1, 1, 1, 1,
0.445407, 0.3911756, 0.1983021, 1, 1, 1, 1, 1,
0.4455738, -1.613762, 0.670101, 1, 1, 1, 1, 1,
0.4480669, -0.8253679, 1.828789, 1, 1, 1, 1, 1,
0.4487353, 1.279696, -0.9734879, 1, 1, 1, 1, 1,
0.451928, -0.2619857, -0.0654882, 1, 1, 1, 1, 1,
0.4547278, -1.014067, 3.136954, 1, 1, 1, 1, 1,
0.4567188, 0.1796484, 0.9552082, 1, 1, 1, 1, 1,
0.4691589, 0.1092246, 1.587126, 1, 1, 1, 1, 1,
0.4695071, 0.7180786, 0.8594653, 1, 1, 1, 1, 1,
0.4700683, -0.6978142, 3.170096, 1, 1, 1, 1, 1,
0.4707274, -0.7907869, 3.340439, 0, 0, 1, 1, 1,
0.4728282, -1.631297, 3.607615, 1, 0, 0, 1, 1,
0.4761223, -0.875374, 0.353525, 1, 0, 0, 1, 1,
0.4762301, -0.8019952, 3.166606, 1, 0, 0, 1, 1,
0.4789125, 2.458312, 0.2192578, 1, 0, 0, 1, 1,
0.4844955, 1.521168, 0.05219975, 1, 0, 0, 1, 1,
0.4927392, 0.4237063, 1.061247, 0, 0, 0, 1, 1,
0.4960208, 0.334365, 0.2567765, 0, 0, 0, 1, 1,
0.4966991, -0.02073303, 2.215812, 0, 0, 0, 1, 1,
0.4971579, -0.2041173, 1.65192, 0, 0, 0, 1, 1,
0.498411, -0.9513249, 2.665398, 0, 0, 0, 1, 1,
0.4987097, 0.7423376, 0.4365916, 0, 0, 0, 1, 1,
0.5016826, -1.228517, 1.120048, 0, 0, 0, 1, 1,
0.5041658, -0.621052, 2.5119, 1, 1, 1, 1, 1,
0.5042802, -1.125515, 5.206786, 1, 1, 1, 1, 1,
0.5043491, -1.467649, 2.993391, 1, 1, 1, 1, 1,
0.5074319, -0.01012105, 1.144135, 1, 1, 1, 1, 1,
0.5111876, -0.5866756, 2.727309, 1, 1, 1, 1, 1,
0.514935, -0.526949, 1.165684, 1, 1, 1, 1, 1,
0.5162005, 1.918655, 0.6117169, 1, 1, 1, 1, 1,
0.5162793, -3.012846, 3.835829, 1, 1, 1, 1, 1,
0.5184851, -0.9487803, 3.370568, 1, 1, 1, 1, 1,
0.5186217, -1.228191, 2.646984, 1, 1, 1, 1, 1,
0.5199087, 0.734695, -0.4631233, 1, 1, 1, 1, 1,
0.5215189, -1.328907, 2.924343, 1, 1, 1, 1, 1,
0.5243377, 0.969191, -0.3981278, 1, 1, 1, 1, 1,
0.5259156, -0.983107, 2.868131, 1, 1, 1, 1, 1,
0.533442, 0.5738887, -0.5745428, 1, 1, 1, 1, 1,
0.5371862, 0.6501199, 0.1689762, 0, 0, 1, 1, 1,
0.5414305, -0.9370568, 2.798413, 1, 0, 0, 1, 1,
0.5458879, -0.8082272, 1.997369, 1, 0, 0, 1, 1,
0.5471258, -1.520113, 3.246172, 1, 0, 0, 1, 1,
0.5503113, -1.107663, 3.283513, 1, 0, 0, 1, 1,
0.555091, -1.207361, 3.242136, 1, 0, 0, 1, 1,
0.5564709, -0.2266018, 2.046061, 0, 0, 0, 1, 1,
0.5566888, 0.04639486, 4.402598, 0, 0, 0, 1, 1,
0.556935, -0.9572535, 1.588713, 0, 0, 0, 1, 1,
0.5587525, 0.1702703, -0.8980155, 0, 0, 0, 1, 1,
0.5609235, -2.160306, 3.521338, 0, 0, 0, 1, 1,
0.561426, 0.217029, 3.374291, 0, 0, 0, 1, 1,
0.5625994, 0.1014078, 1.499501, 0, 0, 0, 1, 1,
0.5647159, -0.1160385, 1.511891, 1, 1, 1, 1, 1,
0.5656265, -1.394587, 3.960624, 1, 1, 1, 1, 1,
0.5692828, -0.4530656, 2.622729, 1, 1, 1, 1, 1,
0.5750085, 0.3680272, 1.042576, 1, 1, 1, 1, 1,
0.5756006, 1.048207, 0.6152866, 1, 1, 1, 1, 1,
0.5841615, 0.6554843, -0.4082435, 1, 1, 1, 1, 1,
0.5845593, 1.154534, 0.5556585, 1, 1, 1, 1, 1,
0.5855967, 1.151725, 0.7924526, 1, 1, 1, 1, 1,
0.5889562, -0.4530427, 1.560826, 1, 1, 1, 1, 1,
0.5890355, -0.6978121, 2.103297, 1, 1, 1, 1, 1,
0.5911481, 0.3738101, 0.938474, 1, 1, 1, 1, 1,
0.596513, 0.1839778, 0.5363563, 1, 1, 1, 1, 1,
0.6068038, -0.3485115, 1.155081, 1, 1, 1, 1, 1,
0.6090678, 0.00530712, 1.710272, 1, 1, 1, 1, 1,
0.613385, 0.8850063, 0.6345601, 1, 1, 1, 1, 1,
0.6139961, -1.650787, 2.562323, 0, 0, 1, 1, 1,
0.6143858, -0.5067137, 2.386127, 1, 0, 0, 1, 1,
0.6217513, -1.955434, 2.378565, 1, 0, 0, 1, 1,
0.6316025, -0.2106969, 3.476174, 1, 0, 0, 1, 1,
0.6317033, 1.609458, 0.3498449, 1, 0, 0, 1, 1,
0.6341571, -1.450729, 3.543969, 1, 0, 0, 1, 1,
0.6357047, 1.004735, -0.3454735, 0, 0, 0, 1, 1,
0.639888, -0.5607086, 2.241958, 0, 0, 0, 1, 1,
0.6431282, 0.6667618, 0.8292076, 0, 0, 0, 1, 1,
0.6483155, -0.2309015, 1.320429, 0, 0, 0, 1, 1,
0.6491446, -0.3490999, 2.260432, 0, 0, 0, 1, 1,
0.6499824, 0.1346378, 0.818159, 0, 0, 0, 1, 1,
0.6520623, 2.673658, 2.144846, 0, 0, 0, 1, 1,
0.652579, -0.1661278, 1.754078, 1, 1, 1, 1, 1,
0.6568061, -0.2372232, 2.061253, 1, 1, 1, 1, 1,
0.6598145, 0.4671978, 1.951963, 1, 1, 1, 1, 1,
0.6695139, -0.6489203, 1.282208, 1, 1, 1, 1, 1,
0.669648, -0.3809973, 2.658552, 1, 1, 1, 1, 1,
0.6696963, 0.5989025, 1.653223, 1, 1, 1, 1, 1,
0.6774594, -0.1827331, 2.71893, 1, 1, 1, 1, 1,
0.6804174, 0.7932135, 0.1650112, 1, 1, 1, 1, 1,
0.6870613, 0.7931855, 2.375564, 1, 1, 1, 1, 1,
0.6891349, 0.4030632, 3.001949, 1, 1, 1, 1, 1,
0.689999, -0.4370786, 3.063874, 1, 1, 1, 1, 1,
0.6905289, 1.810443, 0.9514058, 1, 1, 1, 1, 1,
0.7031168, 0.7348224, 0.1002892, 1, 1, 1, 1, 1,
0.7031975, 0.8608534, -0.261793, 1, 1, 1, 1, 1,
0.7034294, -1.008331, 3.703891, 1, 1, 1, 1, 1,
0.7087767, 0.9182622, -0.7330106, 0, 0, 1, 1, 1,
0.7121277, -0.4799192, 1.875314, 1, 0, 0, 1, 1,
0.7161453, 0.2770905, 1.063801, 1, 0, 0, 1, 1,
0.7307375, 2.255914, -0.2641131, 1, 0, 0, 1, 1,
0.7332402, -1.074968, 4.353414, 1, 0, 0, 1, 1,
0.736508, 1.257924, 1.965579, 1, 0, 0, 1, 1,
0.7377141, 0.8334345, 0.1040133, 0, 0, 0, 1, 1,
0.7400156, -1.038862, 2.658458, 0, 0, 0, 1, 1,
0.7447571, 1.408672, 2.549412, 0, 0, 0, 1, 1,
0.7451965, 1.187044, 0.654952, 0, 0, 0, 1, 1,
0.7477447, 0.3066002, 0.5140142, 0, 0, 0, 1, 1,
0.7482158, 1.792445, -0.9274583, 0, 0, 0, 1, 1,
0.7523816, -0.6079807, 2.10015, 0, 0, 0, 1, 1,
0.7589737, -1.989414, 0.1582888, 1, 1, 1, 1, 1,
0.761835, 1.610496, -0.04920927, 1, 1, 1, 1, 1,
0.7624982, -0.2393036, 1.846139, 1, 1, 1, 1, 1,
0.7666151, 0.6238106, 2.211709, 1, 1, 1, 1, 1,
0.7671089, 0.8898221, -0.5273851, 1, 1, 1, 1, 1,
0.7700654, 1.196569, 1.290645, 1, 1, 1, 1, 1,
0.7767475, 1.250261, 0.08199895, 1, 1, 1, 1, 1,
0.7777712, -0.8623077, 1.511666, 1, 1, 1, 1, 1,
0.7814921, -0.4753387, 2.219188, 1, 1, 1, 1, 1,
0.7923706, 1.212052, 0.1833453, 1, 1, 1, 1, 1,
0.7953696, -0.1815552, 0.9967285, 1, 1, 1, 1, 1,
0.8011379, -0.7577469, 1.527239, 1, 1, 1, 1, 1,
0.8128669, -0.5986084, 0.5118152, 1, 1, 1, 1, 1,
0.8147126, -1.241988, 3.628728, 1, 1, 1, 1, 1,
0.8167403, 0.9092661, -1.706739, 1, 1, 1, 1, 1,
0.8228981, -1.429414, 2.672001, 0, 0, 1, 1, 1,
0.8243227, -1.199546, 1.660919, 1, 0, 0, 1, 1,
0.8314953, 0.7289041, 0.345621, 1, 0, 0, 1, 1,
0.8371161, 0.6102602, -0.3407902, 1, 0, 0, 1, 1,
0.8384008, -0.3210243, 1.518083, 1, 0, 0, 1, 1,
0.8423623, -0.6068425, 0.7562181, 1, 0, 0, 1, 1,
0.8493274, 0.134604, 1.030853, 0, 0, 0, 1, 1,
0.852911, 1.650848, -0.4850253, 0, 0, 0, 1, 1,
0.8530435, 0.3380117, 0.5549635, 0, 0, 0, 1, 1,
0.8533054, 0.9126089, 1.094106, 0, 0, 0, 1, 1,
0.8600767, -0.4289397, 2.043216, 0, 0, 0, 1, 1,
0.8616717, 0.228001, -0.02137065, 0, 0, 0, 1, 1,
0.869574, -0.8651735, 1.888299, 0, 0, 0, 1, 1,
0.8716173, -0.168547, 1.098521, 1, 1, 1, 1, 1,
0.8755, -1.070839, 2.250635, 1, 1, 1, 1, 1,
0.8757377, -0.214581, 2.606657, 1, 1, 1, 1, 1,
0.8793976, -2.365102, 2.696294, 1, 1, 1, 1, 1,
0.8820179, -0.7764416, 2.862302, 1, 1, 1, 1, 1,
0.8834554, -0.04802713, 1.884795, 1, 1, 1, 1, 1,
0.885749, -0.9817836, 1.199677, 1, 1, 1, 1, 1,
0.8876134, 2.178811, 0.8328184, 1, 1, 1, 1, 1,
0.8933517, -0.5038309, 1.785845, 1, 1, 1, 1, 1,
0.8973605, -0.1037264, 2.455008, 1, 1, 1, 1, 1,
0.899682, -0.5349319, 2.920161, 1, 1, 1, 1, 1,
0.9010335, 0.4591128, 2.755368, 1, 1, 1, 1, 1,
0.9013947, -1.451821, 1.833853, 1, 1, 1, 1, 1,
0.9023343, -0.0252382, 2.034299, 1, 1, 1, 1, 1,
0.9087749, -1.45359, 2.534, 1, 1, 1, 1, 1,
0.9125364, -2.175369, 1.848446, 0, 0, 1, 1, 1,
0.9206213, 0.02067634, 3.179465, 1, 0, 0, 1, 1,
0.9226781, -1.157544, 0.9132284, 1, 0, 0, 1, 1,
0.9261523, 0.8835724, 1.661524, 1, 0, 0, 1, 1,
0.9271465, -0.3499737, 0.591197, 1, 0, 0, 1, 1,
0.929781, -0.6358503, -0.0421002, 1, 0, 0, 1, 1,
0.9343279, 0.4216866, 0.9064736, 0, 0, 0, 1, 1,
0.9417952, 2.068402, 1.376716, 0, 0, 0, 1, 1,
0.9500315, 0.6768285, 1.603078, 0, 0, 0, 1, 1,
0.953554, -1.104463, 2.178614, 0, 0, 0, 1, 1,
0.9556577, 0.4048681, 1.398479, 0, 0, 0, 1, 1,
0.9630755, 0.1443652, 1.893715, 0, 0, 0, 1, 1,
0.9741976, -0.5180649, 1.914656, 0, 0, 0, 1, 1,
0.9749725, -1.443386, 3.055679, 1, 1, 1, 1, 1,
0.9755059, -1.17199, 3.073857, 1, 1, 1, 1, 1,
0.9804804, 0.5126275, 2.205687, 1, 1, 1, 1, 1,
0.9840417, 0.4016913, 0.2912115, 1, 1, 1, 1, 1,
0.9862217, -0.1917388, 0.2667765, 1, 1, 1, 1, 1,
0.9997926, 0.3067481, 0.4326786, 1, 1, 1, 1, 1,
1.008092, -0.1520941, 2.235494, 1, 1, 1, 1, 1,
1.009517, -0.3907971, 1.002914, 1, 1, 1, 1, 1,
1.013042, -0.3050945, 0.8289099, 1, 1, 1, 1, 1,
1.016688, 0.4383995, 2.340733, 1, 1, 1, 1, 1,
1.01843, -0.9386843, 2.208332, 1, 1, 1, 1, 1,
1.024495, -1.428196, 3.70598, 1, 1, 1, 1, 1,
1.02517, 2.620184, -0.639543, 1, 1, 1, 1, 1,
1.027912, 2.06734, 0.7871146, 1, 1, 1, 1, 1,
1.032128, 1.933819, -0.5576251, 1, 1, 1, 1, 1,
1.033844, 0.05876837, 2.809236, 0, 0, 1, 1, 1,
1.038516, -0.0008799685, 1.585904, 1, 0, 0, 1, 1,
1.043714, 0.3077548, 0.8554272, 1, 0, 0, 1, 1,
1.047082, 0.202288, -0.5531942, 1, 0, 0, 1, 1,
1.050697, -0.2430426, 1.708925, 1, 0, 0, 1, 1,
1.057281, 0.8071389, 1.850053, 1, 0, 0, 1, 1,
1.058156, -0.05615706, 2.238534, 0, 0, 0, 1, 1,
1.083084, -0.5819851, 2.741488, 0, 0, 0, 1, 1,
1.102878, 0.6234596, 0.1962355, 0, 0, 0, 1, 1,
1.104362, 0.4856994, 0.1632693, 0, 0, 0, 1, 1,
1.104704, 0.3091267, 0.6256235, 0, 0, 0, 1, 1,
1.105419, 0.2658965, 0.4745268, 0, 0, 0, 1, 1,
1.108047, 1.144836, -1.637007, 0, 0, 0, 1, 1,
1.122861, 0.2517757, 0.001336323, 1, 1, 1, 1, 1,
1.125865, 1.412809, 0.7943085, 1, 1, 1, 1, 1,
1.12691, -1.593364, 4.152432, 1, 1, 1, 1, 1,
1.132794, 0.6750444, -0.3226611, 1, 1, 1, 1, 1,
1.135733, 2.121243, -0.1477693, 1, 1, 1, 1, 1,
1.135817, 0.989264, 1.311735, 1, 1, 1, 1, 1,
1.136314, -0.6179105, 2.878068, 1, 1, 1, 1, 1,
1.136402, 0.0967552, 2.049444, 1, 1, 1, 1, 1,
1.140372, 1.294618, 1.6841, 1, 1, 1, 1, 1,
1.141358, 0.04245025, 1.910309, 1, 1, 1, 1, 1,
1.151737, 0.3794835, 1.725888, 1, 1, 1, 1, 1,
1.159201, -0.9479563, 1.113647, 1, 1, 1, 1, 1,
1.160477, 1.525689, -0.7064905, 1, 1, 1, 1, 1,
1.162753, 2.184262, 0.4353834, 1, 1, 1, 1, 1,
1.164249, -0.6835817, 1.073314, 1, 1, 1, 1, 1,
1.172982, 1.093427, -1.939352, 0, 0, 1, 1, 1,
1.180442, 0.688949, 3.805998, 1, 0, 0, 1, 1,
1.183338, 1.195634, 1.642195, 1, 0, 0, 1, 1,
1.184536, 1.163029, 0.4021968, 1, 0, 0, 1, 1,
1.187908, 0.8844106, -0.2314957, 1, 0, 0, 1, 1,
1.18987, -0.2304212, 2.04336, 1, 0, 0, 1, 1,
1.191811, -1.06869, 1.181184, 0, 0, 0, 1, 1,
1.192134, 0.3416422, 0.2251181, 0, 0, 0, 1, 1,
1.195227, 0.4795539, -0.5010269, 0, 0, 0, 1, 1,
1.200876, 0.2344884, -0.9368985, 0, 0, 0, 1, 1,
1.212149, -2.412146, 3.270115, 0, 0, 0, 1, 1,
1.21262, 1.543716, 2.87983, 0, 0, 0, 1, 1,
1.215259, -0.6906512, 1.713216, 0, 0, 0, 1, 1,
1.215564, 0.4169166, 1.578865, 1, 1, 1, 1, 1,
1.218413, 0.262762, 2.660434, 1, 1, 1, 1, 1,
1.222191, 0.07496498, 0.7274402, 1, 1, 1, 1, 1,
1.23024, -2.149982, 2.719771, 1, 1, 1, 1, 1,
1.246166, -0.9257476, 2.620864, 1, 1, 1, 1, 1,
1.252763, 1.266063, -0.3570031, 1, 1, 1, 1, 1,
1.252767, 0.1531526, 1.293596, 1, 1, 1, 1, 1,
1.260119, -0.2420571, 2.552606, 1, 1, 1, 1, 1,
1.260345, -0.03958286, 1.96754, 1, 1, 1, 1, 1,
1.263752, 0.7552018, 1.213249, 1, 1, 1, 1, 1,
1.267802, -0.1896462, 2.003823, 1, 1, 1, 1, 1,
1.271939, -1.264228, 2.799024, 1, 1, 1, 1, 1,
1.276872, -0.1232813, 2.470324, 1, 1, 1, 1, 1,
1.277311, -0.116272, 0.4386981, 1, 1, 1, 1, 1,
1.277376, 0.7649572, 2.066365, 1, 1, 1, 1, 1,
1.292512, 0.7497105, 1.494323, 0, 0, 1, 1, 1,
1.305656, -0.3017205, 2.14665, 1, 0, 0, 1, 1,
1.314062, -0.07093947, 2.610135, 1, 0, 0, 1, 1,
1.316812, -0.03124659, 0.08837035, 1, 0, 0, 1, 1,
1.320762, 0.6207876, 2.516556, 1, 0, 0, 1, 1,
1.321999, -1.067905, 1.332422, 1, 0, 0, 1, 1,
1.331766, -0.2080777, 1.91714, 0, 0, 0, 1, 1,
1.333216, 0.2371686, 0.9608514, 0, 0, 0, 1, 1,
1.337385, 0.5600853, 0.2283177, 0, 0, 0, 1, 1,
1.339806, 0.2985388, 2.228983, 0, 0, 0, 1, 1,
1.341938, 0.8490685, 0.6183985, 0, 0, 0, 1, 1,
1.353501, -0.8830836, 2.759523, 0, 0, 0, 1, 1,
1.354897, -0.9525832, 2.039203, 0, 0, 0, 1, 1,
1.355353, 0.8449232, 1.614063, 1, 1, 1, 1, 1,
1.364184, -0.4120322, 0.3027722, 1, 1, 1, 1, 1,
1.386467, 1.12528, 0.6640711, 1, 1, 1, 1, 1,
1.397395, 0.9815605, 1.086155, 1, 1, 1, 1, 1,
1.400528, 1.218444, 0.5153351, 1, 1, 1, 1, 1,
1.403953, 0.5239757, 0.8646784, 1, 1, 1, 1, 1,
1.409326, -2.848408, 1.172585, 1, 1, 1, 1, 1,
1.4155, 0.827572, -0.5360676, 1, 1, 1, 1, 1,
1.425953, 1.153998, 1.816836, 1, 1, 1, 1, 1,
1.429941, 0.5705397, 2.71819, 1, 1, 1, 1, 1,
1.432895, 1.054694, -0.08548104, 1, 1, 1, 1, 1,
1.458413, 0.4776906, 1.123505, 1, 1, 1, 1, 1,
1.46402, 0.6883928, 1.413409, 1, 1, 1, 1, 1,
1.465374, -0.6701149, 2.80868, 1, 1, 1, 1, 1,
1.467592, -1.254581, 2.349877, 1, 1, 1, 1, 1,
1.468692, 0.9714127, -0.08011187, 0, 0, 1, 1, 1,
1.489154, -0.1291398, 1.160526, 1, 0, 0, 1, 1,
1.494476, 1.579912, 1.6992, 1, 0, 0, 1, 1,
1.49772, -1.032857, 1.098294, 1, 0, 0, 1, 1,
1.50052, -0.1810296, 0.8080677, 1, 0, 0, 1, 1,
1.50319, -0.611725, 2.782118, 1, 0, 0, 1, 1,
1.506076, 0.2998004, 2.041252, 0, 0, 0, 1, 1,
1.513438, -0.2615533, 2.497739, 0, 0, 0, 1, 1,
1.530028, -0.3691263, 1.23039, 0, 0, 0, 1, 1,
1.53946, 0.5456414, 2.535209, 0, 0, 0, 1, 1,
1.557107, -0.3392314, 1.344905, 0, 0, 0, 1, 1,
1.558683, 0.7828215, 0.6237494, 0, 0, 0, 1, 1,
1.561912, 0.5087981, 2.008375, 0, 0, 0, 1, 1,
1.565381, 1.273774, 1.872565, 1, 1, 1, 1, 1,
1.566669, 1.149147, -0.06374596, 1, 1, 1, 1, 1,
1.57346, -0.1000346, -0.02348934, 1, 1, 1, 1, 1,
1.578621, -0.01996943, 1.418554, 1, 1, 1, 1, 1,
1.57947, 0.7736136, 0.5000443, 1, 1, 1, 1, 1,
1.581415, -2.128416, 1.891473, 1, 1, 1, 1, 1,
1.585472, 0.140501, 1.817957, 1, 1, 1, 1, 1,
1.602506, 0.6739885, 0.9511583, 1, 1, 1, 1, 1,
1.604329, 0.5883816, 1.591816, 1, 1, 1, 1, 1,
1.608396, -1.396938, 1.240103, 1, 1, 1, 1, 1,
1.611367, -1.112862, 2.342348, 1, 1, 1, 1, 1,
1.61691, 1.205351, 2.014893, 1, 1, 1, 1, 1,
1.621468, 0.0640928, 1.291243, 1, 1, 1, 1, 1,
1.629548, -2.829535, 1.161888, 1, 1, 1, 1, 1,
1.658664, 1.073251, 1.238158, 1, 1, 1, 1, 1,
1.683587, -0.02165417, 1.782441, 0, 0, 1, 1, 1,
1.685164, 1.837819, 0.7827194, 1, 0, 0, 1, 1,
1.701992, 1.01528, 0.6893332, 1, 0, 0, 1, 1,
1.716368, -1.682092, 2.467514, 1, 0, 0, 1, 1,
1.723022, -0.5988486, 3.368847, 1, 0, 0, 1, 1,
1.739622, -0.0752243, 1.895222, 1, 0, 0, 1, 1,
1.764315, -0.5643691, 2.760729, 0, 0, 0, 1, 1,
1.764436, -1.151044, 2.037865, 0, 0, 0, 1, 1,
1.782095, -0.438188, 0.415076, 0, 0, 0, 1, 1,
1.783188, 0.5898712, 1.887745, 0, 0, 0, 1, 1,
1.795706, -0.580735, 2.613789, 0, 0, 0, 1, 1,
1.805776, -0.1890884, 0.7993506, 0, 0, 0, 1, 1,
1.818927, -0.2100689, 1.762436, 0, 0, 0, 1, 1,
1.840813, 2.04523, 0.2433891, 1, 1, 1, 1, 1,
1.857789, 0.2641378, 2.286704, 1, 1, 1, 1, 1,
1.873436, -0.02091106, 3.099328, 1, 1, 1, 1, 1,
1.885711, 1.184083, 1.064091, 1, 1, 1, 1, 1,
1.885892, -0.413288, 1.209329, 1, 1, 1, 1, 1,
1.929036, 0.4079897, 0.5583265, 1, 1, 1, 1, 1,
1.94794, -0.5582053, 2.989384, 1, 1, 1, 1, 1,
1.983906, 1.357562, 1.045476, 1, 1, 1, 1, 1,
1.98812, -0.8662521, 2.524431, 1, 1, 1, 1, 1,
1.999532, 1.10408, 0.9136606, 1, 1, 1, 1, 1,
2.001038, -1.024234, 2.800488, 1, 1, 1, 1, 1,
2.01333, -1.336807, 2.550884, 1, 1, 1, 1, 1,
2.05736, -0.8379202, 3.338671, 1, 1, 1, 1, 1,
2.070291, 0.6138387, 3.0438, 1, 1, 1, 1, 1,
2.133862, 0.7687177, 0.4220435, 1, 1, 1, 1, 1,
2.138184, 0.274513, 0.5987809, 0, 0, 1, 1, 1,
2.145962, -1.947501, 1.81049, 1, 0, 0, 1, 1,
2.153924, -1.402219, 3.342278, 1, 0, 0, 1, 1,
2.199566, -1.155423, 4.275375, 1, 0, 0, 1, 1,
2.241367, -0.1689775, 1.838737, 1, 0, 0, 1, 1,
2.257735, 0.03444685, 1.909535, 1, 0, 0, 1, 1,
2.272701, 0.7637517, 2.24134, 0, 0, 0, 1, 1,
2.299731, 1.054193, 1.522432, 0, 0, 0, 1, 1,
2.304076, 0.1754922, 0.6549543, 0, 0, 0, 1, 1,
2.447537, 0.776363, 1.164438, 0, 0, 0, 1, 1,
2.474409, -0.2830897, 1.970233, 0, 0, 0, 1, 1,
2.477628, 1.455128, 1.135927, 0, 0, 0, 1, 1,
2.534569, 0.5816355, 2.551343, 0, 0, 0, 1, 1,
2.671301, 0.08334211, 3.463564, 1, 1, 1, 1, 1,
2.693599, -1.708964, 2.040519, 1, 1, 1, 1, 1,
2.710348, 1.103682, 1.775218, 1, 1, 1, 1, 1,
2.912955, 0.09115265, 1.615791, 1, 1, 1, 1, 1,
3.062492, -0.167833, 1.287964, 1, 1, 1, 1, 1,
3.296609, 0.2645042, 2.478513, 1, 1, 1, 1, 1,
3.461399, -1.073455, 1.454178, 1, 1, 1, 1, 1
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
var radius = 10.51465;
var distance = 36.93228;
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
mvMatrix.translate( 0.09120107, -0.3546088, 0.1124649 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.93228);
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
