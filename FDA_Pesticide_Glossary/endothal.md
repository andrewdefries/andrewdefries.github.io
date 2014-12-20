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
-3.372496, -1.542496, -3.457992, 1, 0, 0, 1,
-2.695547, 0.9812427, -0.5117157, 1, 0.007843138, 0, 1,
-2.587012, -0.2878649, -2.556108, 1, 0.01176471, 0, 1,
-2.548883, 0.2591237, -1.84753, 1, 0.01960784, 0, 1,
-2.529778, 0.3667456, 0.4730589, 1, 0.02352941, 0, 1,
-2.442922, 0.523717, 0.400511, 1, 0.03137255, 0, 1,
-2.415774, -0.4597479, -0.9951998, 1, 0.03529412, 0, 1,
-2.403972, -0.1153961, -1.205867, 1, 0.04313726, 0, 1,
-2.399397, -0.7277601, -2.286013, 1, 0.04705882, 0, 1,
-2.373137, -0.2787729, -1.670906, 1, 0.05490196, 0, 1,
-2.323263, -1.32074, -3.140351, 1, 0.05882353, 0, 1,
-2.307783, 2.030849, -0.9406006, 1, 0.06666667, 0, 1,
-2.281987, 0.7822232, -1.35433, 1, 0.07058824, 0, 1,
-2.204569, 1.372726, -0.03131645, 1, 0.07843138, 0, 1,
-2.193724, -0.7470782, -1.514763, 1, 0.08235294, 0, 1,
-2.129433, -0.2883224, -1.420638, 1, 0.09019608, 0, 1,
-2.106619, -0.8503423, -2.347324, 1, 0.09411765, 0, 1,
-2.08704, -0.02673261, -0.9342664, 1, 0.1019608, 0, 1,
-2.086749, -1.362324, -0.2680612, 1, 0.1098039, 0, 1,
-2.079286, 1.923218, -1.011706, 1, 0.1137255, 0, 1,
-2.072367, 0.5966894, 0.05000759, 1, 0.1215686, 0, 1,
-2.052134, -1.535839, -3.850345, 1, 0.1254902, 0, 1,
-2.050166, 1.732518, -0.9336614, 1, 0.1333333, 0, 1,
-2.036063, -0.8723611, -1.383745, 1, 0.1372549, 0, 1,
-1.998468, -0.4259559, -2.934117, 1, 0.145098, 0, 1,
-1.993838, -0.8471252, -1.759214, 1, 0.1490196, 0, 1,
-1.984413, 0.6523723, -0.8061036, 1, 0.1568628, 0, 1,
-1.982498, 0.4477607, -0.1718394, 1, 0.1607843, 0, 1,
-1.975761, 1.402666, -0.4874044, 1, 0.1686275, 0, 1,
-1.972019, -1.429283, -3.317447, 1, 0.172549, 0, 1,
-1.943579, -1.09545, -1.928428, 1, 0.1803922, 0, 1,
-1.942801, -1.554411, -0.4066488, 1, 0.1843137, 0, 1,
-1.93294, 0.2606983, -1.656753, 1, 0.1921569, 0, 1,
-1.932864, -0.8426156, -2.583266, 1, 0.1960784, 0, 1,
-1.910378, -0.7374845, -3.594215, 1, 0.2039216, 0, 1,
-1.897896, -1.605305, -2.815123, 1, 0.2117647, 0, 1,
-1.863072, 1.010762, -0.7989545, 1, 0.2156863, 0, 1,
-1.860816, -0.7283183, -3.410815, 1, 0.2235294, 0, 1,
-1.832018, -0.7880449, -1.968964, 1, 0.227451, 0, 1,
-1.80854, 0.6965109, -1.834222, 1, 0.2352941, 0, 1,
-1.805574, -0.6479712, -1.700234, 1, 0.2392157, 0, 1,
-1.783921, 0.1051145, -0.05286848, 1, 0.2470588, 0, 1,
-1.769844, -0.5248494, -1.081289, 1, 0.2509804, 0, 1,
-1.76835, -2.854732, -3.008461, 1, 0.2588235, 0, 1,
-1.765978, 1.041017, -0.9849743, 1, 0.2627451, 0, 1,
-1.758697, -0.2352896, -2.540424, 1, 0.2705882, 0, 1,
-1.756901, 0.2527318, -2.521594, 1, 0.2745098, 0, 1,
-1.756161, -1.020638, -0.3710651, 1, 0.282353, 0, 1,
-1.755116, -0.646965, -1.794576, 1, 0.2862745, 0, 1,
-1.754505, 1.081601, -0.6917362, 1, 0.2941177, 0, 1,
-1.751693, 0.7319978, -2.368594, 1, 0.3019608, 0, 1,
-1.744835, 0.7356854, -2.188357, 1, 0.3058824, 0, 1,
-1.731871, -1.362062, -1.878947, 1, 0.3137255, 0, 1,
-1.731296, 0.0681304, -0.03408659, 1, 0.3176471, 0, 1,
-1.718, -1.085095, -3.905103, 1, 0.3254902, 0, 1,
-1.715017, 0.04706685, -1.715968, 1, 0.3294118, 0, 1,
-1.710703, 0.6479403, -2.301912, 1, 0.3372549, 0, 1,
-1.70774, 0.2580131, -2.065952, 1, 0.3411765, 0, 1,
-1.670041, 0.1848445, 0.3977354, 1, 0.3490196, 0, 1,
-1.666928, 0.2444603, -1.028423, 1, 0.3529412, 0, 1,
-1.663042, -1.138121, -3.19221, 1, 0.3607843, 0, 1,
-1.647534, -0.527475, -0.3705161, 1, 0.3647059, 0, 1,
-1.639392, 0.1045431, 0.03303826, 1, 0.372549, 0, 1,
-1.630657, 0.5247987, -1.64391, 1, 0.3764706, 0, 1,
-1.62238, -0.1229819, -2.650927, 1, 0.3843137, 0, 1,
-1.618698, 0.06167948, -0.3412021, 1, 0.3882353, 0, 1,
-1.613317, -0.1284607, 1.33364, 1, 0.3960784, 0, 1,
-1.608376, -0.5467971, -3.13775, 1, 0.4039216, 0, 1,
-1.602066, 0.167338, -1.645252, 1, 0.4078431, 0, 1,
-1.600826, 2.369063, -1.27932, 1, 0.4156863, 0, 1,
-1.591025, -1.482056, -2.410652, 1, 0.4196078, 0, 1,
-1.579482, 0.1868282, -1.065095, 1, 0.427451, 0, 1,
-1.560175, -0.5642125, -0.8142751, 1, 0.4313726, 0, 1,
-1.555762, 1.14097, 0.03305991, 1, 0.4392157, 0, 1,
-1.540925, -0.8021293, -1.097949, 1, 0.4431373, 0, 1,
-1.539908, -1.153479, -2.828106, 1, 0.4509804, 0, 1,
-1.516414, -0.01748544, -1.367815, 1, 0.454902, 0, 1,
-1.499886, -1.570959, -1.511979, 1, 0.4627451, 0, 1,
-1.49486, 0.1797819, -0.7819452, 1, 0.4666667, 0, 1,
-1.471601, 1.656458, -0.9585099, 1, 0.4745098, 0, 1,
-1.464993, -0.1828862, -2.62351, 1, 0.4784314, 0, 1,
-1.450895, -0.3081323, -2.112541, 1, 0.4862745, 0, 1,
-1.442261, -0.830023, -2.679629, 1, 0.4901961, 0, 1,
-1.439593, 2.095478, -1.451199, 1, 0.4980392, 0, 1,
-1.436271, 1.286319, -0.121725, 1, 0.5058824, 0, 1,
-1.435754, -2.140408, -2.896335, 1, 0.509804, 0, 1,
-1.431046, -0.1836868, -1.344848, 1, 0.5176471, 0, 1,
-1.430209, -0.63966, -0.8985673, 1, 0.5215687, 0, 1,
-1.425759, -0.4464321, -2.880925, 1, 0.5294118, 0, 1,
-1.422975, -1.265962, -2.580852, 1, 0.5333334, 0, 1,
-1.413599, 1.09287, 0.3791502, 1, 0.5411765, 0, 1,
-1.413577, 0.798299, -1.711753, 1, 0.5450981, 0, 1,
-1.412565, -2.00468, -1.993939, 1, 0.5529412, 0, 1,
-1.401856, -0.7407303, -1.513249, 1, 0.5568628, 0, 1,
-1.398516, 0.008428492, -1.166162, 1, 0.5647059, 0, 1,
-1.38009, 0.5726594, -0.1552649, 1, 0.5686275, 0, 1,
-1.367749, -0.4171908, -1.372401, 1, 0.5764706, 0, 1,
-1.353143, 0.9106872, -3.195537, 1, 0.5803922, 0, 1,
-1.346156, 0.8733912, -1.402965, 1, 0.5882353, 0, 1,
-1.345215, 0.7518684, 0.7634201, 1, 0.5921569, 0, 1,
-1.343987, 1.466094, -0.4642155, 1, 0.6, 0, 1,
-1.337998, 0.6304576, -0.5159794, 1, 0.6078432, 0, 1,
-1.335467, 0.368159, -2.415922, 1, 0.6117647, 0, 1,
-1.324539, 0.7755492, -1.318936, 1, 0.6196079, 0, 1,
-1.322653, -0.757304, -2.975431, 1, 0.6235294, 0, 1,
-1.308443, 0.6557906, -0.8345293, 1, 0.6313726, 0, 1,
-1.303828, 1.023958, -0.807642, 1, 0.6352941, 0, 1,
-1.275949, 1.454804, -2.523948, 1, 0.6431373, 0, 1,
-1.266459, 0.1689155, 0.309812, 1, 0.6470588, 0, 1,
-1.263933, -1.179725, -1.69468, 1, 0.654902, 0, 1,
-1.258071, 1.082224, -1.91333, 1, 0.6588235, 0, 1,
-1.255717, -0.8178308, -0.1425602, 1, 0.6666667, 0, 1,
-1.255163, -1.33695, -2.286026, 1, 0.6705883, 0, 1,
-1.251731, -0.7232278, -1.758022, 1, 0.6784314, 0, 1,
-1.247948, 0.6875367, -1.167495, 1, 0.682353, 0, 1,
-1.247044, 0.638481, -1.005519, 1, 0.6901961, 0, 1,
-1.246151, 0.2160273, -1.698612, 1, 0.6941177, 0, 1,
-1.242239, -0.1048789, -2.457482, 1, 0.7019608, 0, 1,
-1.237945, 0.2912883, -0.1760164, 1, 0.7098039, 0, 1,
-1.237909, -1.113498, -2.255685, 1, 0.7137255, 0, 1,
-1.232619, 1.452323, -0.4131101, 1, 0.7215686, 0, 1,
-1.22933, 0.01434099, -2.07936, 1, 0.7254902, 0, 1,
-1.225666, 0.2826548, -1.267703, 1, 0.7333333, 0, 1,
-1.223053, -1.287277, -1.031091, 1, 0.7372549, 0, 1,
-1.217764, 1.169168, -1.545735, 1, 0.7450981, 0, 1,
-1.217715, 0.8318399, -2.022105, 1, 0.7490196, 0, 1,
-1.215179, -1.726972, -0.2741742, 1, 0.7568628, 0, 1,
-1.202031, 0.570515, -1.914194, 1, 0.7607843, 0, 1,
-1.189789, -0.1399451, -2.677813, 1, 0.7686275, 0, 1,
-1.187646, -0.545359, -3.998619, 1, 0.772549, 0, 1,
-1.185384, -0.8119968, -3.65536, 1, 0.7803922, 0, 1,
-1.167201, 1.200761, -0.4363369, 1, 0.7843137, 0, 1,
-1.165071, 1.037158, -2.165817, 1, 0.7921569, 0, 1,
-1.164139, -1.358254, -3.277512, 1, 0.7960784, 0, 1,
-1.163894, -1.222456, -2.811306, 1, 0.8039216, 0, 1,
-1.159096, 1.054482, -0.6645086, 1, 0.8117647, 0, 1,
-1.152132, -1.449885, -3.103953, 1, 0.8156863, 0, 1,
-1.139994, 1.819293, 0.1158633, 1, 0.8235294, 0, 1,
-1.136942, -0.5338476, -3.323886, 1, 0.827451, 0, 1,
-1.135174, -0.5563831, -2.825817, 1, 0.8352941, 0, 1,
-1.12613, 0.3116286, -0.4991654, 1, 0.8392157, 0, 1,
-1.125089, -1.063468, -1.769958, 1, 0.8470588, 0, 1,
-1.113545, -1.328773, -3.406184, 1, 0.8509804, 0, 1,
-1.109052, -1.020292, -1.648951, 1, 0.8588235, 0, 1,
-1.108082, 0.3973645, -1.174684, 1, 0.8627451, 0, 1,
-1.104194, 0.07291905, -2.286758, 1, 0.8705882, 0, 1,
-1.102824, 1.61657, 0.605377, 1, 0.8745098, 0, 1,
-1.101554, -0.7152864, -3.227748, 1, 0.8823529, 0, 1,
-1.100571, 0.5434958, -0.7121853, 1, 0.8862745, 0, 1,
-1.090924, 0.4734519, -2.520699, 1, 0.8941177, 0, 1,
-1.090914, 0.1628957, 0.3658236, 1, 0.8980392, 0, 1,
-1.088909, -0.3213909, -0.4893747, 1, 0.9058824, 0, 1,
-1.068867, -0.3045902, -1.176543, 1, 0.9137255, 0, 1,
-1.064373, 0.195991, 0.2827807, 1, 0.9176471, 0, 1,
-1.060655, 0.8121561, -0.8805147, 1, 0.9254902, 0, 1,
-1.051799, 0.7249437, -0.7229316, 1, 0.9294118, 0, 1,
-1.048587, -0.1064524, -1.504738, 1, 0.9372549, 0, 1,
-1.04679, -0.4918323, 0.09614792, 1, 0.9411765, 0, 1,
-1.046543, 0.4532529, -1.732052, 1, 0.9490196, 0, 1,
-1.043925, 1.046527, -1.674632, 1, 0.9529412, 0, 1,
-1.042593, 0.1247113, -0.301666, 1, 0.9607843, 0, 1,
-1.040035, 1.504249, 0.09823065, 1, 0.9647059, 0, 1,
-1.037109, 0.4921164, -0.3012739, 1, 0.972549, 0, 1,
-1.033405, 0.2441452, -0.8179182, 1, 0.9764706, 0, 1,
-1.027459, 0.004494731, -1.234192, 1, 0.9843137, 0, 1,
-1.026767, 0.0005352605, -1.994236, 1, 0.9882353, 0, 1,
-1.026569, 2.023359, -0.5595853, 1, 0.9960784, 0, 1,
-1.025548, 0.7782977, -0.08339571, 0.9960784, 1, 0, 1,
-1.024774, 0.4481606, -0.9454258, 0.9921569, 1, 0, 1,
-1.021064, 0.1807293, -1.521254, 0.9843137, 1, 0, 1,
-1.017171, -0.933054, -1.460773, 0.9803922, 1, 0, 1,
-1.013129, -0.220188, -1.200626, 0.972549, 1, 0, 1,
-1.007195, 0.8582095, -1.805148, 0.9686275, 1, 0, 1,
-1.007132, 0.3199122, -3.406881, 0.9607843, 1, 0, 1,
-1.004121, -0.1340468, -2.273746, 0.9568627, 1, 0, 1,
-1.000172, -1.191469, -1.146451, 0.9490196, 1, 0, 1,
-0.9995657, 1.677419, -1.121721, 0.945098, 1, 0, 1,
-0.9975266, 1.415302, -0.2867388, 0.9372549, 1, 0, 1,
-0.9959322, 2.87107, 2.779395, 0.9333333, 1, 0, 1,
-0.9933578, -1.190691, -3.82878, 0.9254902, 1, 0, 1,
-0.9928223, 0.6326653, -2.638848, 0.9215686, 1, 0, 1,
-0.991611, 0.8175148, -0.1941997, 0.9137255, 1, 0, 1,
-0.9836817, 0.8977623, -0.2231169, 0.9098039, 1, 0, 1,
-0.9474308, 2.295003, -0.1814807, 0.9019608, 1, 0, 1,
-0.944999, 1.114824, -1.860829, 0.8941177, 1, 0, 1,
-0.9424216, -0.1516894, -2.256027, 0.8901961, 1, 0, 1,
-0.9375891, -0.7076451, -1.248599, 0.8823529, 1, 0, 1,
-0.9374694, -0.9722192, -1.555325, 0.8784314, 1, 0, 1,
-0.9202131, -0.4052854, -3.929586, 0.8705882, 1, 0, 1,
-0.9159067, -0.4190127, -0.4360728, 0.8666667, 1, 0, 1,
-0.9073375, 0.9935641, -1.940335, 0.8588235, 1, 0, 1,
-0.9020478, -2.029264, -3.471174, 0.854902, 1, 0, 1,
-0.8907068, -1.000115, -0.2922281, 0.8470588, 1, 0, 1,
-0.8881896, 1.546765, 1.04273, 0.8431373, 1, 0, 1,
-0.8865612, 1.220573, 0.1886103, 0.8352941, 1, 0, 1,
-0.8858137, -1.136664, -3.754053, 0.8313726, 1, 0, 1,
-0.8798632, 1.458028, -0.3548014, 0.8235294, 1, 0, 1,
-0.8775492, 0.4271004, -0.02065646, 0.8196079, 1, 0, 1,
-0.8747609, -0.6036786, -0.8251238, 0.8117647, 1, 0, 1,
-0.874304, 3.001695, -0.8409228, 0.8078431, 1, 0, 1,
-0.8712478, 1.938023, -0.1497985, 0.8, 1, 0, 1,
-0.8687698, 0.7389625, -0.428192, 0.7921569, 1, 0, 1,
-0.8648012, -0.6812544, -0.5167403, 0.7882353, 1, 0, 1,
-0.8639269, -0.8577151, -0.8028925, 0.7803922, 1, 0, 1,
-0.8627557, -0.7714399, -1.173179, 0.7764706, 1, 0, 1,
-0.8581429, -1.072596, -3.484092, 0.7686275, 1, 0, 1,
-0.8509053, -0.002391636, -1.960881, 0.7647059, 1, 0, 1,
-0.8505793, 0.468587, -1.812595, 0.7568628, 1, 0, 1,
-0.8478341, -0.0868514, -2.425367, 0.7529412, 1, 0, 1,
-0.8458701, -1.110409, -2.363362, 0.7450981, 1, 0, 1,
-0.8409327, 0.4760175, -1.337772, 0.7411765, 1, 0, 1,
-0.8392445, 1.043738, 0.1503313, 0.7333333, 1, 0, 1,
-0.8379481, 1.889544, 0.5188313, 0.7294118, 1, 0, 1,
-0.8374579, -0.507731, -1.803586, 0.7215686, 1, 0, 1,
-0.8296036, -0.07704394, -2.279005, 0.7176471, 1, 0, 1,
-0.8231905, 0.6244888, -0.3755776, 0.7098039, 1, 0, 1,
-0.8209345, -0.6230749, -2.527962, 0.7058824, 1, 0, 1,
-0.8074961, 0.8292977, -2.371588, 0.6980392, 1, 0, 1,
-0.8059598, 1.298684, 0.3086788, 0.6901961, 1, 0, 1,
-0.7929503, -0.0204867, -2.489534, 0.6862745, 1, 0, 1,
-0.7874847, -1.234121, -3.722045, 0.6784314, 1, 0, 1,
-0.7864519, -0.1951367, -0.1143685, 0.6745098, 1, 0, 1,
-0.7826647, 1.710103, -0.8472234, 0.6666667, 1, 0, 1,
-0.7794491, 0.1927194, -0.4362547, 0.6627451, 1, 0, 1,
-0.7637497, 0.7023839, -0.8662042, 0.654902, 1, 0, 1,
-0.7631678, 0.2239879, -1.499905, 0.6509804, 1, 0, 1,
-0.7543149, -0.08399244, -1.364801, 0.6431373, 1, 0, 1,
-0.7524264, 0.9134741, -0.6735348, 0.6392157, 1, 0, 1,
-0.7434737, 0.414103, -2.183604, 0.6313726, 1, 0, 1,
-0.743277, 1.261325, 0.8785994, 0.627451, 1, 0, 1,
-0.7429903, -0.3205779, -1.345751, 0.6196079, 1, 0, 1,
-0.7410429, -0.9822739, -2.173893, 0.6156863, 1, 0, 1,
-0.7241754, -0.2257997, -2.583081, 0.6078432, 1, 0, 1,
-0.7219571, -1.508702, -1.367155, 0.6039216, 1, 0, 1,
-0.7213322, -0.8609591, -2.482543, 0.5960785, 1, 0, 1,
-0.7138609, -0.5495507, -1.949377, 0.5882353, 1, 0, 1,
-0.7106812, 0.3852656, -3.815867, 0.5843138, 1, 0, 1,
-0.7055075, 1.173064, -1.739384, 0.5764706, 1, 0, 1,
-0.7052466, -0.6762542, -2.154589, 0.572549, 1, 0, 1,
-0.7046624, -0.2369086, -3.199785, 0.5647059, 1, 0, 1,
-0.7008938, -0.4297352, -1.621928, 0.5607843, 1, 0, 1,
-0.6948903, -0.339529, -1.99053, 0.5529412, 1, 0, 1,
-0.6907214, -0.2960744, -1.344306, 0.5490196, 1, 0, 1,
-0.6868467, 0.6591594, -1.954948, 0.5411765, 1, 0, 1,
-0.6850783, 0.9667663, 0.989551, 0.5372549, 1, 0, 1,
-0.6845864, 3.021906, -1.731235, 0.5294118, 1, 0, 1,
-0.6838447, -0.6406051, -2.139642, 0.5254902, 1, 0, 1,
-0.6773515, 0.9069732, -0.6537508, 0.5176471, 1, 0, 1,
-0.6759594, -0.7053053, -1.895484, 0.5137255, 1, 0, 1,
-0.6757786, 1.849451, 1.368773, 0.5058824, 1, 0, 1,
-0.6737842, -0.3592903, -2.569239, 0.5019608, 1, 0, 1,
-0.6659983, 0.3809342, -0.4520204, 0.4941176, 1, 0, 1,
-0.6625969, -1.439199, -2.492635, 0.4862745, 1, 0, 1,
-0.6611264, 0.9189301, -1.705237, 0.4823529, 1, 0, 1,
-0.6576822, 1.673029, -0.4470143, 0.4745098, 1, 0, 1,
-0.6558184, -1.883455, -3.212193, 0.4705882, 1, 0, 1,
-0.6506617, -0.7220323, -0.189946, 0.4627451, 1, 0, 1,
-0.6480829, 1.411879, -2.476125, 0.4588235, 1, 0, 1,
-0.6446217, -0.8118877, -3.024472, 0.4509804, 1, 0, 1,
-0.6410826, -0.2002915, -1.743933, 0.4470588, 1, 0, 1,
-0.6397858, 0.2426715, -1.875046, 0.4392157, 1, 0, 1,
-0.6362797, -1.043688, -3.62935, 0.4352941, 1, 0, 1,
-0.6361616, 0.7265567, -1.362643, 0.427451, 1, 0, 1,
-0.6344802, 0.3691339, -1.152246, 0.4235294, 1, 0, 1,
-0.6299579, 1.316505, -0.06199125, 0.4156863, 1, 0, 1,
-0.6279063, -0.4276791, -3.169349, 0.4117647, 1, 0, 1,
-0.6256433, -0.6200822, -3.558849, 0.4039216, 1, 0, 1,
-0.6234627, 0.6704834, -0.263438, 0.3960784, 1, 0, 1,
-0.6139405, -1.00667, -1.756668, 0.3921569, 1, 0, 1,
-0.6138613, -0.6275749, -3.097031, 0.3843137, 1, 0, 1,
-0.6127274, -0.02973286, -1.523256, 0.3803922, 1, 0, 1,
-0.6109871, -0.5144501, -3.688604, 0.372549, 1, 0, 1,
-0.6076963, -0.4363666, -2.040641, 0.3686275, 1, 0, 1,
-0.6071491, 0.263557, -1.411609, 0.3607843, 1, 0, 1,
-0.6030329, 1.298972, 0.799839, 0.3568628, 1, 0, 1,
-0.6018488, 0.4178967, -1.189074, 0.3490196, 1, 0, 1,
-0.6017088, 0.5857113, -0.8299695, 0.345098, 1, 0, 1,
-0.6013557, -1.108753, -3.280881, 0.3372549, 1, 0, 1,
-0.6002611, 0.2849162, -1.318831, 0.3333333, 1, 0, 1,
-0.59525, 1.02723, -2.367526, 0.3254902, 1, 0, 1,
-0.5918105, -2.083811, -3.0066, 0.3215686, 1, 0, 1,
-0.5872422, 0.473991, -1.024954, 0.3137255, 1, 0, 1,
-0.5811236, -0.3712781, -1.984949, 0.3098039, 1, 0, 1,
-0.5746862, 0.660482, -1.334317, 0.3019608, 1, 0, 1,
-0.5709181, -0.4953059, -2.450006, 0.2941177, 1, 0, 1,
-0.5707994, 1.521288, 0.1931899, 0.2901961, 1, 0, 1,
-0.5670117, -0.7341784, -2.971391, 0.282353, 1, 0, 1,
-0.5654883, 0.2761807, -1.883433, 0.2784314, 1, 0, 1,
-0.5600304, 0.3690614, -0.04614034, 0.2705882, 1, 0, 1,
-0.5463247, -0.8013238, -1.84902, 0.2666667, 1, 0, 1,
-0.5434409, 0.01411866, -1.228848, 0.2588235, 1, 0, 1,
-0.5245633, 0.4007478, -2.70481, 0.254902, 1, 0, 1,
-0.5235347, 1.861772, -0.8960263, 0.2470588, 1, 0, 1,
-0.5174879, 2.020314, -0.008525728, 0.2431373, 1, 0, 1,
-0.5171811, -0.5681404, -1.201447, 0.2352941, 1, 0, 1,
-0.5121731, -1.980895, -2.917709, 0.2313726, 1, 0, 1,
-0.5067641, -1.391098, -3.146326, 0.2235294, 1, 0, 1,
-0.5038172, 0.7910554, -1.906552, 0.2196078, 1, 0, 1,
-0.5030575, 1.73139, -0.355436, 0.2117647, 1, 0, 1,
-0.5029151, -0.4971547, -0.8959856, 0.2078431, 1, 0, 1,
-0.4974323, -0.3615274, -0.6841995, 0.2, 1, 0, 1,
-0.4966071, -0.2524102, -2.205982, 0.1921569, 1, 0, 1,
-0.4953736, 0.9635103, -1.36025, 0.1882353, 1, 0, 1,
-0.4950623, -0.1781882, -2.683663, 0.1803922, 1, 0, 1,
-0.4914357, 0.6486534, 1.916775, 0.1764706, 1, 0, 1,
-0.4905184, 0.970079, 0.6323351, 0.1686275, 1, 0, 1,
-0.4872551, -0.03974113, -1.422542, 0.1647059, 1, 0, 1,
-0.4869143, -0.2700045, -3.417688, 0.1568628, 1, 0, 1,
-0.4861532, 0.3178176, -1.280105, 0.1529412, 1, 0, 1,
-0.4831687, -2.471135, -3.454849, 0.145098, 1, 0, 1,
-0.4810627, 0.6239131, 0.2260931, 0.1411765, 1, 0, 1,
-0.4806322, -1.815089, -2.777867, 0.1333333, 1, 0, 1,
-0.4789659, 1.975334, -1.066182, 0.1294118, 1, 0, 1,
-0.4732741, -0.1915998, -0.05660647, 0.1215686, 1, 0, 1,
-0.4619114, 0.404398, -1.655009, 0.1176471, 1, 0, 1,
-0.4608195, -0.7178796, -3.354847, 0.1098039, 1, 0, 1,
-0.4596061, 1.127142, -0.4967182, 0.1058824, 1, 0, 1,
-0.4568195, -0.7014107, -2.897625, 0.09803922, 1, 0, 1,
-0.4516224, -0.333, -2.520385, 0.09019608, 1, 0, 1,
-0.4476967, 1.20818, -2.673601, 0.08627451, 1, 0, 1,
-0.4445523, -0.6795828, -2.405078, 0.07843138, 1, 0, 1,
-0.4443676, 0.1581482, -1.712045, 0.07450981, 1, 0, 1,
-0.4431039, 0.02362148, -2.230199, 0.06666667, 1, 0, 1,
-0.4398733, -0.4147973, -2.641701, 0.0627451, 1, 0, 1,
-0.4397886, 0.7804884, 0.0785497, 0.05490196, 1, 0, 1,
-0.4372911, -0.3743024, -1.87605, 0.05098039, 1, 0, 1,
-0.4261868, -0.6649976, -3.255192, 0.04313726, 1, 0, 1,
-0.4238792, -0.05276436, -1.965534, 0.03921569, 1, 0, 1,
-0.4233144, -0.5209019, -3.316743, 0.03137255, 1, 0, 1,
-0.4197003, -1.102138, -2.136402, 0.02745098, 1, 0, 1,
-0.4158156, -0.8583563, -2.565961, 0.01960784, 1, 0, 1,
-0.415051, -0.2614032, -1.834626, 0.01568628, 1, 0, 1,
-0.4108954, 1.468776, -0.4197271, 0.007843138, 1, 0, 1,
-0.4075335, 0.09216332, -1.124828, 0.003921569, 1, 0, 1,
-0.406883, -0.3169063, -1.8868, 0, 1, 0.003921569, 1,
-0.4062459, -0.01714929, -1.712199, 0, 1, 0.01176471, 1,
-0.4019682, 1.025742, -1.11303, 0, 1, 0.01568628, 1,
-0.3997423, -0.8837715, -2.754239, 0, 1, 0.02352941, 1,
-0.3985261, -0.3799067, -4.360086, 0, 1, 0.02745098, 1,
-0.3953665, -0.5871982, -1.813787, 0, 1, 0.03529412, 1,
-0.395159, 0.8614601, -1.04389, 0, 1, 0.03921569, 1,
-0.3946574, 1.263982, 1.631131, 0, 1, 0.04705882, 1,
-0.3939574, -2.756451, -3.892208, 0, 1, 0.05098039, 1,
-0.3923903, 0.8841032, -0.001895153, 0, 1, 0.05882353, 1,
-0.389057, -0.6613089, -3.308539, 0, 1, 0.0627451, 1,
-0.3881835, -0.8398964, -0.6653477, 0, 1, 0.07058824, 1,
-0.3841839, 0.223124, -1.728021, 0, 1, 0.07450981, 1,
-0.3809827, 0.3780983, -1.32132, 0, 1, 0.08235294, 1,
-0.3782353, 1.505668, -1.886327, 0, 1, 0.08627451, 1,
-0.3741924, 1.55939, 0.6717296, 0, 1, 0.09411765, 1,
-0.3741466, -0.2517295, -0.2604764, 0, 1, 0.1019608, 1,
-0.3732416, -0.9774199, -2.006954, 0, 1, 0.1058824, 1,
-0.3657503, 0.2869283, -1.076724, 0, 1, 0.1137255, 1,
-0.3632719, 1.074087, -0.2708417, 0, 1, 0.1176471, 1,
-0.3609719, 2.613853, 0.2907243, 0, 1, 0.1254902, 1,
-0.3582099, -1.135003, -3.90997, 0, 1, 0.1294118, 1,
-0.348139, -0.8163469, -3.451786, 0, 1, 0.1372549, 1,
-0.3475953, -0.3185592, -3.755463, 0, 1, 0.1411765, 1,
-0.3472977, 1.30801, 0.8349425, 0, 1, 0.1490196, 1,
-0.3448568, 0.2589537, -1.467279, 0, 1, 0.1529412, 1,
-0.3438419, 0.7084815, 1.663095, 0, 1, 0.1607843, 1,
-0.3402134, 1.613844, -1.019934, 0, 1, 0.1647059, 1,
-0.3367703, 0.4099816, -0.569213, 0, 1, 0.172549, 1,
-0.3321791, 0.09711906, -1.86439, 0, 1, 0.1764706, 1,
-0.3320557, -0.02631273, -0.1995507, 0, 1, 0.1843137, 1,
-0.3280036, 0.5064216, 0.1197031, 0, 1, 0.1882353, 1,
-0.3276523, -2.398907, -3.574796, 0, 1, 0.1960784, 1,
-0.3274475, -1.020879, -3.488014, 0, 1, 0.2039216, 1,
-0.3257174, 0.4818869, 0.4897998, 0, 1, 0.2078431, 1,
-0.3230151, -1.358509, -1.745092, 0, 1, 0.2156863, 1,
-0.3229805, 0.5101102, -0.5055628, 0, 1, 0.2196078, 1,
-0.3150197, -0.094166, -2.813776, 0, 1, 0.227451, 1,
-0.3123263, -2.070179, -3.511681, 0, 1, 0.2313726, 1,
-0.3095096, 1.089921, -0.684076, 0, 1, 0.2392157, 1,
-0.3056732, -1.846911, -3.631834, 0, 1, 0.2431373, 1,
-0.3017733, -0.2746232, -1.085661, 0, 1, 0.2509804, 1,
-0.2905128, 0.8189014, -0.6575971, 0, 1, 0.254902, 1,
-0.2891342, 0.3947445, -1.007401, 0, 1, 0.2627451, 1,
-0.2860463, 0.6856111, 0.3036543, 0, 1, 0.2666667, 1,
-0.2839578, -1.239483, -3.632296, 0, 1, 0.2745098, 1,
-0.2793554, -1.457266, -1.188953, 0, 1, 0.2784314, 1,
-0.2787598, 2.554765, -1.029672, 0, 1, 0.2862745, 1,
-0.2778207, 0.2481424, 0.495006, 0, 1, 0.2901961, 1,
-0.2738411, -0.3722933, -1.48134, 0, 1, 0.2980392, 1,
-0.2715053, 0.7787539, 1.287733, 0, 1, 0.3058824, 1,
-0.2708423, -0.8229005, -4.44666, 0, 1, 0.3098039, 1,
-0.2684431, -0.1198939, -3.915371, 0, 1, 0.3176471, 1,
-0.2676217, -1.800964, -3.049983, 0, 1, 0.3215686, 1,
-0.259741, 0.3230979, -3.18658, 0, 1, 0.3294118, 1,
-0.2596285, 0.8282592, -2.731331, 0, 1, 0.3333333, 1,
-0.2594834, 1.377148, -1.461892, 0, 1, 0.3411765, 1,
-0.2580423, -0.8313136, -2.883828, 0, 1, 0.345098, 1,
-0.2580062, 2.085822, -2.392896, 0, 1, 0.3529412, 1,
-0.2558454, -1.085562, -2.563534, 0, 1, 0.3568628, 1,
-0.2548397, -0.3928871, -2.372974, 0, 1, 0.3647059, 1,
-0.2537174, -0.3899703, -2.115564, 0, 1, 0.3686275, 1,
-0.2532059, -1.132305, -1.231845, 0, 1, 0.3764706, 1,
-0.2518153, -0.8010129, -2.713408, 0, 1, 0.3803922, 1,
-0.2485643, 0.6036544, 0.4223259, 0, 1, 0.3882353, 1,
-0.2434477, 2.305339, -0.3739104, 0, 1, 0.3921569, 1,
-0.2417732, 0.8710554, 0.8210298, 0, 1, 0.4, 1,
-0.2404539, 2.198985, 0.0497707, 0, 1, 0.4078431, 1,
-0.2316124, -0.09435551, -1.521739, 0, 1, 0.4117647, 1,
-0.2274148, -1.298711, -3.704907, 0, 1, 0.4196078, 1,
-0.2262076, 0.2011035, -1.423864, 0, 1, 0.4235294, 1,
-0.2260001, -1.265043, -3.659886, 0, 1, 0.4313726, 1,
-0.2226255, -0.4004097, -2.428588, 0, 1, 0.4352941, 1,
-0.2189754, 0.7038349, -0.515406, 0, 1, 0.4431373, 1,
-0.2185308, 1.377594, -1.268319, 0, 1, 0.4470588, 1,
-0.2178254, 0.3226456, 0.01352319, 0, 1, 0.454902, 1,
-0.2175953, -0.1531575, -1.355652, 0, 1, 0.4588235, 1,
-0.2173297, -0.3952072, -2.444705, 0, 1, 0.4666667, 1,
-0.215138, -0.3651369, -2.607727, 0, 1, 0.4705882, 1,
-0.2147543, -1.760145, -3.182237, 0, 1, 0.4784314, 1,
-0.212883, 1.973085, 0.9278266, 0, 1, 0.4823529, 1,
-0.2124063, -0.8796199, -3.961432, 0, 1, 0.4901961, 1,
-0.2054401, 0.3718855, 0.177875, 0, 1, 0.4941176, 1,
-0.2032943, 0.8711599, -0.9769186, 0, 1, 0.5019608, 1,
-0.2004992, 0.462524, -0.8423165, 0, 1, 0.509804, 1,
-0.1998397, 0.1897628, -1.051578, 0, 1, 0.5137255, 1,
-0.1995325, 0.7949789, -0.2158934, 0, 1, 0.5215687, 1,
-0.1961931, 0.1901962, -2.333073, 0, 1, 0.5254902, 1,
-0.1957137, 1.902166, -0.7787272, 0, 1, 0.5333334, 1,
-0.1949964, -0.7553359, -4.76434, 0, 1, 0.5372549, 1,
-0.1939533, -0.7050306, -4.434161, 0, 1, 0.5450981, 1,
-0.1927197, -0.4441549, -5.114061, 0, 1, 0.5490196, 1,
-0.1886402, 1.456557, 0.1914439, 0, 1, 0.5568628, 1,
-0.1856274, -0.09045357, -1.388148, 0, 1, 0.5607843, 1,
-0.1834334, 0.6949446, 0.4818605, 0, 1, 0.5686275, 1,
-0.1824501, -1.468872, -4.579519, 0, 1, 0.572549, 1,
-0.1815667, -0.4182549, -1.458435, 0, 1, 0.5803922, 1,
-0.1809323, 3.179308, 0.5814782, 0, 1, 0.5843138, 1,
-0.1806116, -0.1322373, -0.816581, 0, 1, 0.5921569, 1,
-0.1781987, -1.358715, -2.067285, 0, 1, 0.5960785, 1,
-0.1768997, 0.4680733, 0.3935675, 0, 1, 0.6039216, 1,
-0.1747603, 0.7856095, 0.1123587, 0, 1, 0.6117647, 1,
-0.1742715, -0.4872982, -2.393647, 0, 1, 0.6156863, 1,
-0.1714573, 0.8287057, -0.2276297, 0, 1, 0.6235294, 1,
-0.1686539, -1.289621, -4.660408, 0, 1, 0.627451, 1,
-0.1672594, -0.06721435, -0.4003565, 0, 1, 0.6352941, 1,
-0.1641603, 0.644246, -0.09524567, 0, 1, 0.6392157, 1,
-0.161226, 1.095202, -2.287181, 0, 1, 0.6470588, 1,
-0.1571169, -2.593296, -2.796288, 0, 1, 0.6509804, 1,
-0.1517847, 0.1196515, -0.815122, 0, 1, 0.6588235, 1,
-0.1504997, 0.291198, -2.145317, 0, 1, 0.6627451, 1,
-0.1487087, 1.007865, -1.195011, 0, 1, 0.6705883, 1,
-0.14699, 0.7948122, 0.1460422, 0, 1, 0.6745098, 1,
-0.1405067, 0.7101155, 0.856688, 0, 1, 0.682353, 1,
-0.1404995, 1.056075, 0.4709556, 0, 1, 0.6862745, 1,
-0.1373416, -1.044695, -2.700037, 0, 1, 0.6941177, 1,
-0.1332101, -1.140461, -3.636725, 0, 1, 0.7019608, 1,
-0.1271939, 0.2735426, -0.1715471, 0, 1, 0.7058824, 1,
-0.1249345, -0.05607635, -1.886291, 0, 1, 0.7137255, 1,
-0.1233501, -0.7622605, -2.711452, 0, 1, 0.7176471, 1,
-0.1211721, 0.5050924, -0.5801638, 0, 1, 0.7254902, 1,
-0.1170511, -0.2216727, -2.382908, 0, 1, 0.7294118, 1,
-0.1164925, 1.431848, 0.02069774, 0, 1, 0.7372549, 1,
-0.1102696, -0.7585903, -2.939989, 0, 1, 0.7411765, 1,
-0.1056853, -0.4284499, -2.403429, 0, 1, 0.7490196, 1,
-0.1056197, -1.855468, -0.7303651, 0, 1, 0.7529412, 1,
-0.1029388, -0.5722831, -2.519067, 0, 1, 0.7607843, 1,
-0.1020885, 1.09242, 1.176156, 0, 1, 0.7647059, 1,
-0.1015704, 0.9734544, -1.647514, 0, 1, 0.772549, 1,
-0.09708703, 0.2286337, -0.3843726, 0, 1, 0.7764706, 1,
-0.09290178, 0.07794897, -1.916497, 0, 1, 0.7843137, 1,
-0.08919872, -0.01667242, -0.01668906, 0, 1, 0.7882353, 1,
-0.08767705, -0.5775302, -2.97041, 0, 1, 0.7960784, 1,
-0.08754978, -0.5778173, -3.926727, 0, 1, 0.8039216, 1,
-0.08265892, -1.272536, -2.98093, 0, 1, 0.8078431, 1,
-0.08222386, -0.220664, -3.42401, 0, 1, 0.8156863, 1,
-0.08158328, -0.7768034, -2.4088, 0, 1, 0.8196079, 1,
-0.07920271, -0.512502, -1.61013, 0, 1, 0.827451, 1,
-0.07744057, -1.26239, -2.624991, 0, 1, 0.8313726, 1,
-0.07633533, -1.043047, -2.936368, 0, 1, 0.8392157, 1,
-0.07581346, -0.5321386, -3.739987, 0, 1, 0.8431373, 1,
-0.07015674, -0.7354985, -2.813041, 0, 1, 0.8509804, 1,
-0.06699922, -1.589582, -2.494124, 0, 1, 0.854902, 1,
-0.06150673, -0.6223266, -2.588426, 0, 1, 0.8627451, 1,
-0.05919312, 1.811981, 1.427689, 0, 1, 0.8666667, 1,
-0.05415328, -1.495362, -2.974428, 0, 1, 0.8745098, 1,
-0.05219736, -0.7822449, -4.042617, 0, 1, 0.8784314, 1,
-0.05038849, 0.1055778, 0.1270704, 0, 1, 0.8862745, 1,
-0.05008544, 0.487824, 0.8166973, 0, 1, 0.8901961, 1,
-0.04756844, -0.6980159, -2.948022, 0, 1, 0.8980392, 1,
-0.04463806, 0.625955, 0.4633196, 0, 1, 0.9058824, 1,
-0.04434079, 0.8459024, -0.6222935, 0, 1, 0.9098039, 1,
-0.04278095, 0.5046983, 0.4243105, 0, 1, 0.9176471, 1,
-0.04228039, 0.3736045, 0.4821272, 0, 1, 0.9215686, 1,
-0.03973105, 0.9268329, -0.4835826, 0, 1, 0.9294118, 1,
-0.03549366, -0.7411834, -2.083662, 0, 1, 0.9333333, 1,
-0.03486306, -0.4249749, -2.593182, 0, 1, 0.9411765, 1,
-0.03120666, 0.07108033, 0.5125366, 0, 1, 0.945098, 1,
-0.02718493, -1.238913, -4.392886, 0, 1, 0.9529412, 1,
-0.02493326, 0.3686606, -0.5217676, 0, 1, 0.9568627, 1,
-0.02355414, 0.3668732, 0.1186011, 0, 1, 0.9647059, 1,
-0.02125626, -0.5119603, -5.409698, 0, 1, 0.9686275, 1,
-0.01820628, -0.1456968, -1.215606, 0, 1, 0.9764706, 1,
-0.01589447, 0.4016001, 2.006074, 0, 1, 0.9803922, 1,
-0.01533419, -0.5539343, -2.859925, 0, 1, 0.9882353, 1,
-0.01269208, -0.4416299, -3.263529, 0, 1, 0.9921569, 1,
-0.012105, 0.4658548, 1.128965, 0, 1, 1, 1,
-0.009094677, 1.337139, -0.3595811, 0, 0.9921569, 1, 1,
-0.0008899447, -0.6921281, -3.259916, 0, 0.9882353, 1, 1,
-0.0006847317, 0.5086231, 0.3758593, 0, 0.9803922, 1, 1,
0.0002041739, -0.7253233, 4.728566, 0, 0.9764706, 1, 1,
0.005288731, -0.2624791, 2.867028, 0, 0.9686275, 1, 1,
0.005503089, 0.9476172, -0.9326465, 0, 0.9647059, 1, 1,
0.006588202, 0.07923837, 0.04532697, 0, 0.9568627, 1, 1,
0.007185615, 0.3240872, 1.721237, 0, 0.9529412, 1, 1,
0.008534363, 0.02701786, 2.455939, 0, 0.945098, 1, 1,
0.01001937, 0.9525943, 0.405641, 0, 0.9411765, 1, 1,
0.01541738, 0.4166975, 0.4294291, 0, 0.9333333, 1, 1,
0.01806622, 0.6692052, 1.05956, 0, 0.9294118, 1, 1,
0.01993014, -0.758698, 3.31661, 0, 0.9215686, 1, 1,
0.02392901, -0.1345198, 2.732531, 0, 0.9176471, 1, 1,
0.03612469, 0.7640184, -0.6399364, 0, 0.9098039, 1, 1,
0.03756526, 0.6275008, 0.1298268, 0, 0.9058824, 1, 1,
0.03832305, -1.04221, 2.286393, 0, 0.8980392, 1, 1,
0.03920332, 0.8610787, 0.9416655, 0, 0.8901961, 1, 1,
0.04030445, -1.545972, 2.167892, 0, 0.8862745, 1, 1,
0.04314879, 0.8966699, 0.6457552, 0, 0.8784314, 1, 1,
0.04522912, 0.1152192, 2.576012, 0, 0.8745098, 1, 1,
0.04798457, -1.568167, 3.422414, 0, 0.8666667, 1, 1,
0.04809216, 2.298407, 1.91673, 0, 0.8627451, 1, 1,
0.04902256, 1.775623, -2.700091, 0, 0.854902, 1, 1,
0.0494307, -0.9375284, 3.120581, 0, 0.8509804, 1, 1,
0.05364818, 0.5300364, -0.03006957, 0, 0.8431373, 1, 1,
0.05407248, -1.236216, 3.176984, 0, 0.8392157, 1, 1,
0.05463145, -0.7879434, 1.914974, 0, 0.8313726, 1, 1,
0.05484379, -0.1169294, 2.542573, 0, 0.827451, 1, 1,
0.05835764, -1.210825, 3.025677, 0, 0.8196079, 1, 1,
0.05932949, -0.73417, 4.064792, 0, 0.8156863, 1, 1,
0.05960513, -1.861754, 3.844992, 0, 0.8078431, 1, 1,
0.0652812, 0.7644847, -0.9088573, 0, 0.8039216, 1, 1,
0.06834326, 0.7950048, 0.08692917, 0, 0.7960784, 1, 1,
0.07201678, -0.06532677, 3.421411, 0, 0.7882353, 1, 1,
0.07305165, 0.1827603, 0.9312334, 0, 0.7843137, 1, 1,
0.07558104, -0.5578572, 3.778374, 0, 0.7764706, 1, 1,
0.08415187, -1.043369, 3.60532, 0, 0.772549, 1, 1,
0.08790137, 0.9680446, -0.1867638, 0, 0.7647059, 1, 1,
0.08884555, 0.4629492, 1.135185, 0, 0.7607843, 1, 1,
0.09051555, 0.8037273, -0.8190585, 0, 0.7529412, 1, 1,
0.09132744, 0.07981729, 1.011362, 0, 0.7490196, 1, 1,
0.1011085, -0.09664377, 1.303695, 0, 0.7411765, 1, 1,
0.1064758, -1.464117, 3.757662, 0, 0.7372549, 1, 1,
0.1068336, -0.02906597, 2.340832, 0, 0.7294118, 1, 1,
0.1083553, -0.6276513, 3.48207, 0, 0.7254902, 1, 1,
0.1094834, -1.297814, 4.374538, 0, 0.7176471, 1, 1,
0.1115608, 0.9911781, -1.121265, 0, 0.7137255, 1, 1,
0.1160684, 1.27501, 1.688684, 0, 0.7058824, 1, 1,
0.118256, -0.09263802, 3.614846, 0, 0.6980392, 1, 1,
0.1217915, 0.147433, 0.8102407, 0, 0.6941177, 1, 1,
0.1225431, -0.8398377, 3.744, 0, 0.6862745, 1, 1,
0.1256714, -0.2373124, 1.961898, 0, 0.682353, 1, 1,
0.1260384, -0.918695, 2.74736, 0, 0.6745098, 1, 1,
0.1302989, 0.6169575, 2.066084, 0, 0.6705883, 1, 1,
0.1320676, -1.044157, 2.467041, 0, 0.6627451, 1, 1,
0.1339928, 0.6529005, 0.2758223, 0, 0.6588235, 1, 1,
0.1340731, -0.70644, 2.117317, 0, 0.6509804, 1, 1,
0.1375296, 1.316731, 0.3928809, 0, 0.6470588, 1, 1,
0.1449448, -0.3980297, 3.621037, 0, 0.6392157, 1, 1,
0.1474749, 0.9812895, 0.6341602, 0, 0.6352941, 1, 1,
0.1506851, 0.7550051, 0.6890621, 0, 0.627451, 1, 1,
0.151203, -0.09326413, 2.569834, 0, 0.6235294, 1, 1,
0.153553, 1.068915, -0.6670555, 0, 0.6156863, 1, 1,
0.1564822, 0.3653071, -0.5661956, 0, 0.6117647, 1, 1,
0.1590172, -0.3825261, 1.407625, 0, 0.6039216, 1, 1,
0.1604594, 0.4402309, 1.797029, 0, 0.5960785, 1, 1,
0.1615047, -2.348766, 1.959443, 0, 0.5921569, 1, 1,
0.1663826, 0.2715905, 1.504152, 0, 0.5843138, 1, 1,
0.1670016, 0.1209819, -0.4736827, 0, 0.5803922, 1, 1,
0.1685137, 0.7553838, 0.008753362, 0, 0.572549, 1, 1,
0.1722647, 0.8333695, 1.65666, 0, 0.5686275, 1, 1,
0.1727135, 1.070568, -0.1228623, 0, 0.5607843, 1, 1,
0.174081, 0.9150236, 1.819703, 0, 0.5568628, 1, 1,
0.1755846, 0.5362758, 2.23086, 0, 0.5490196, 1, 1,
0.1762567, 0.4939858, 1.363575, 0, 0.5450981, 1, 1,
0.1778604, -0.1117878, 2.917468, 0, 0.5372549, 1, 1,
0.1861653, 0.2753895, 1.75697, 0, 0.5333334, 1, 1,
0.1926288, 1.478735, -0.3793768, 0, 0.5254902, 1, 1,
0.196699, -1.13245, 3.096003, 0, 0.5215687, 1, 1,
0.1969768, -0.7965993, 2.26964, 0, 0.5137255, 1, 1,
0.1979056, 0.08221839, 2.29478, 0, 0.509804, 1, 1,
0.2019465, 1.073775, 1.481053, 0, 0.5019608, 1, 1,
0.2147917, -1.391085, 4.007968, 0, 0.4941176, 1, 1,
0.2172191, 0.2301684, 0.1564151, 0, 0.4901961, 1, 1,
0.2184175, -1.179988, 2.495984, 0, 0.4823529, 1, 1,
0.2186654, -1.168878, 1.917849, 0, 0.4784314, 1, 1,
0.2235983, 0.4578981, -0.06416833, 0, 0.4705882, 1, 1,
0.231858, 1.529588, 0.9179409, 0, 0.4666667, 1, 1,
0.2328838, -0.3562074, 2.663452, 0, 0.4588235, 1, 1,
0.2347506, -0.2521919, 2.118428, 0, 0.454902, 1, 1,
0.2385038, 0.9402672, -0.8664994, 0, 0.4470588, 1, 1,
0.2393087, 0.06238932, 0.5178919, 0, 0.4431373, 1, 1,
0.2442765, 0.9563653, 0.7080805, 0, 0.4352941, 1, 1,
0.2468131, 0.3695094, -0.1967597, 0, 0.4313726, 1, 1,
0.2478441, 1.237365, 2.136818, 0, 0.4235294, 1, 1,
0.2488718, 0.7853609, 0.1769316, 0, 0.4196078, 1, 1,
0.2502267, -0.5353044, 4.491225, 0, 0.4117647, 1, 1,
0.2515835, 0.4191277, 1.118208, 0, 0.4078431, 1, 1,
0.2534077, 0.4018187, 1.253247, 0, 0.4, 1, 1,
0.2534453, 0.7525311, -0.9341546, 0, 0.3921569, 1, 1,
0.255643, -0.5296301, 2.623657, 0, 0.3882353, 1, 1,
0.2559475, 0.816345, 2.127676, 0, 0.3803922, 1, 1,
0.2560835, -0.7369873, 3.446629, 0, 0.3764706, 1, 1,
0.2609769, -0.6647325, 2.411363, 0, 0.3686275, 1, 1,
0.2641545, 0.09257996, 1.534702, 0, 0.3647059, 1, 1,
0.2664649, -0.6574885, 1.939758, 0, 0.3568628, 1, 1,
0.268156, -0.02929767, 2.354936, 0, 0.3529412, 1, 1,
0.2691807, -1.358971, 1.405617, 0, 0.345098, 1, 1,
0.270076, -1.037321, 3.279209, 0, 0.3411765, 1, 1,
0.2705103, 0.4743728, -0.5057102, 0, 0.3333333, 1, 1,
0.2718151, 0.9273701, 2.012013, 0, 0.3294118, 1, 1,
0.2754317, -1.130342, 3.830394, 0, 0.3215686, 1, 1,
0.2760237, -1.221642, 4.979495, 0, 0.3176471, 1, 1,
0.2762849, -0.07274213, 2.468777, 0, 0.3098039, 1, 1,
0.2777366, 1.062388, 0.4556034, 0, 0.3058824, 1, 1,
0.2779134, -1.282928, 3.720509, 0, 0.2980392, 1, 1,
0.2791287, -2.582495, 2.884046, 0, 0.2901961, 1, 1,
0.2796966, -0.3788819, 3.031488, 0, 0.2862745, 1, 1,
0.2827044, -1.620266, 4.464139, 0, 0.2784314, 1, 1,
0.2852355, -1.015625, 2.097221, 0, 0.2745098, 1, 1,
0.2903291, 1.488268, -0.8859584, 0, 0.2666667, 1, 1,
0.2905586, -2.045268, 2.033066, 0, 0.2627451, 1, 1,
0.2915819, 0.2210474, 0.008608615, 0, 0.254902, 1, 1,
0.2963259, 0.1465657, 0.4909143, 0, 0.2509804, 1, 1,
0.310178, 0.3820512, 2.640206, 0, 0.2431373, 1, 1,
0.3108497, -1.546271, 3.727417, 0, 0.2392157, 1, 1,
0.313522, -2.206286, 1.93941, 0, 0.2313726, 1, 1,
0.3141575, -1.126354, 3.405256, 0, 0.227451, 1, 1,
0.3147776, 0.6399971, 1.698705, 0, 0.2196078, 1, 1,
0.3162015, -0.754599, 3.936064, 0, 0.2156863, 1, 1,
0.3175952, 1.242309, 0.06896096, 0, 0.2078431, 1, 1,
0.3192496, 0.1991497, 0.2014241, 0, 0.2039216, 1, 1,
0.3205654, -0.7219281, 3.386347, 0, 0.1960784, 1, 1,
0.3218171, 1.074555, -1.005125, 0, 0.1882353, 1, 1,
0.3227911, -1.531504, 2.73218, 0, 0.1843137, 1, 1,
0.3254286, -0.2514581, 4.732851, 0, 0.1764706, 1, 1,
0.3260196, 0.06636558, 2.765177, 0, 0.172549, 1, 1,
0.3274447, -0.4744794, 3.902801, 0, 0.1647059, 1, 1,
0.328357, -0.9436779, 2.956226, 0, 0.1607843, 1, 1,
0.3333437, -0.2694201, 3.573696, 0, 0.1529412, 1, 1,
0.3367524, -0.1541138, 1.665492, 0, 0.1490196, 1, 1,
0.3372479, -0.0677001, 2.842069, 0, 0.1411765, 1, 1,
0.3403826, -1.385154, 4.520831, 0, 0.1372549, 1, 1,
0.3476888, -2.256417, 2.967604, 0, 0.1294118, 1, 1,
0.348457, 0.2513717, 1.084083, 0, 0.1254902, 1, 1,
0.3485598, -1.339848, 4.27906, 0, 0.1176471, 1, 1,
0.3495423, 1.989956, -0.5862705, 0, 0.1137255, 1, 1,
0.3537819, 0.4150939, 2.131634, 0, 0.1058824, 1, 1,
0.3666719, 0.2652425, 2.161086, 0, 0.09803922, 1, 1,
0.3707844, 0.2013936, 0.8137566, 0, 0.09411765, 1, 1,
0.3773477, -0.1595767, 2.912504, 0, 0.08627451, 1, 1,
0.3785461, -1.312227, 2.538066, 0, 0.08235294, 1, 1,
0.3893358, 0.5948696, 1.274117, 0, 0.07450981, 1, 1,
0.3897175, -0.7945667, 2.494289, 0, 0.07058824, 1, 1,
0.3905941, 1.485461, 1.26461, 0, 0.0627451, 1, 1,
0.3907387, -1.168266, 3.726377, 0, 0.05882353, 1, 1,
0.3978379, -1.039789, 2.935585, 0, 0.05098039, 1, 1,
0.4000774, 0.1297033, 2.400893, 0, 0.04705882, 1, 1,
0.4042534, 0.404019, 2.192147, 0, 0.03921569, 1, 1,
0.4063597, -0.02764858, 2.173447, 0, 0.03529412, 1, 1,
0.4067962, -2.029861, 4.734384, 0, 0.02745098, 1, 1,
0.4083622, 0.980101, 1.16539, 0, 0.02352941, 1, 1,
0.4132288, 1.177632, 0.8330411, 0, 0.01568628, 1, 1,
0.4154755, 1.135291, -0.4048907, 0, 0.01176471, 1, 1,
0.4170713, 0.0935313, 1.529459, 0, 0.003921569, 1, 1,
0.4177763, -0.949816, 2.971779, 0.003921569, 0, 1, 1,
0.4185483, 0.1702553, 0.5267288, 0.007843138, 0, 1, 1,
0.4204417, -0.5866005, 0.6426329, 0.01568628, 0, 1, 1,
0.4230987, 1.171641, -0.399711, 0.01960784, 0, 1, 1,
0.4235227, 0.9430677, 1.622389, 0.02745098, 0, 1, 1,
0.423579, 0.458957, -0.0584716, 0.03137255, 0, 1, 1,
0.4255001, 1.783079, 0.2929129, 0.03921569, 0, 1, 1,
0.4280385, 0.8534124, -0.0308671, 0.04313726, 0, 1, 1,
0.4354814, 0.9010106, -0.5682126, 0.05098039, 0, 1, 1,
0.4362674, 0.9151277, 1.480055, 0.05490196, 0, 1, 1,
0.4442205, 0.7128148, 0.9381546, 0.0627451, 0, 1, 1,
0.4485326, 1.062247, 0.7531015, 0.06666667, 0, 1, 1,
0.4568464, 0.06641904, 1.303163, 0.07450981, 0, 1, 1,
0.4573649, 1.128227, -1.557192, 0.07843138, 0, 1, 1,
0.4620383, -0.09609327, 1.245713, 0.08627451, 0, 1, 1,
0.4624656, -0.2640152, 2.274243, 0.09019608, 0, 1, 1,
0.4655922, -0.576314, 1.613163, 0.09803922, 0, 1, 1,
0.4665284, -0.4661564, 2.528277, 0.1058824, 0, 1, 1,
0.4676085, 0.2608368, -0.4999378, 0.1098039, 0, 1, 1,
0.4757236, 0.0556339, 1.727417, 0.1176471, 0, 1, 1,
0.4774135, -1.591334, 1.930641, 0.1215686, 0, 1, 1,
0.4790747, 1.057347, -0.8844979, 0.1294118, 0, 1, 1,
0.4811246, 0.3828951, 0.0844077, 0.1333333, 0, 1, 1,
0.487881, -1.110669, 2.78947, 0.1411765, 0, 1, 1,
0.4892439, 0.4237337, 0.1858268, 0.145098, 0, 1, 1,
0.4902489, -0.4599505, 2.251885, 0.1529412, 0, 1, 1,
0.4912038, 0.8937807, 1.798675, 0.1568628, 0, 1, 1,
0.4943646, -0.1569402, 1.23992, 0.1647059, 0, 1, 1,
0.4965715, 0.5318264, 1.518871, 0.1686275, 0, 1, 1,
0.4971164, -0.2780362, 1.665652, 0.1764706, 0, 1, 1,
0.5002106, -0.5590563, 1.880051, 0.1803922, 0, 1, 1,
0.5004461, -2.062679, 2.750163, 0.1882353, 0, 1, 1,
0.5055404, -0.2665444, 1.146358, 0.1921569, 0, 1, 1,
0.5075265, -0.8776355, 1.376365, 0.2, 0, 1, 1,
0.5112659, 1.05512, -0.9052615, 0.2078431, 0, 1, 1,
0.5150733, -1.267279, 4.400521, 0.2117647, 0, 1, 1,
0.5157319, -0.88389, 2.03873, 0.2196078, 0, 1, 1,
0.5173042, 0.401399, 1.018195, 0.2235294, 0, 1, 1,
0.5253613, -1.263627, 4.175889, 0.2313726, 0, 1, 1,
0.5258595, 0.8549902, -0.196509, 0.2352941, 0, 1, 1,
0.5268849, -1.330145, 2.562485, 0.2431373, 0, 1, 1,
0.5281444, -0.8940379, 2.636432, 0.2470588, 0, 1, 1,
0.531761, 0.6239214, 0.9138648, 0.254902, 0, 1, 1,
0.5386088, -0.1677847, 2.160943, 0.2588235, 0, 1, 1,
0.5396941, 0.3256973, -0.02376091, 0.2666667, 0, 1, 1,
0.5416132, 1.576864, -0.1271739, 0.2705882, 0, 1, 1,
0.547274, 0.1173105, 1.844507, 0.2784314, 0, 1, 1,
0.548876, 0.389382, 1.061216, 0.282353, 0, 1, 1,
0.5523316, 0.9338784, 0.4479436, 0.2901961, 0, 1, 1,
0.5540121, 0.4437606, 0.9456658, 0.2941177, 0, 1, 1,
0.5633388, 1.386416, 1.076926, 0.3019608, 0, 1, 1,
0.5726556, 0.2491256, 2.793532, 0.3098039, 0, 1, 1,
0.5727175, -0.6737575, 1.627051, 0.3137255, 0, 1, 1,
0.5754172, 0.02650211, 0.6686851, 0.3215686, 0, 1, 1,
0.5761182, 0.5931756, 0.4413443, 0.3254902, 0, 1, 1,
0.5768294, 0.3418429, 2.107859, 0.3333333, 0, 1, 1,
0.5835024, -1.743281, 4.396015, 0.3372549, 0, 1, 1,
0.5934926, 0.615571, 1.977164, 0.345098, 0, 1, 1,
0.593895, -1.208977, 2.169517, 0.3490196, 0, 1, 1,
0.5973374, -0.3021744, 2.275026, 0.3568628, 0, 1, 1,
0.5973527, 0.1604068, 2.186109, 0.3607843, 0, 1, 1,
0.5999184, -0.9800431, 1.040457, 0.3686275, 0, 1, 1,
0.6116749, 0.9452876, -0.01539678, 0.372549, 0, 1, 1,
0.6167001, -0.03281657, 1.22553, 0.3803922, 0, 1, 1,
0.6181174, -1.879548, 4.19591, 0.3843137, 0, 1, 1,
0.6193231, -0.6845876, 3.712374, 0.3921569, 0, 1, 1,
0.6280573, -0.4352404, 1.766889, 0.3960784, 0, 1, 1,
0.6291444, -0.131447, 1.84073, 0.4039216, 0, 1, 1,
0.6297302, -0.2024346, 3.360457, 0.4117647, 0, 1, 1,
0.6305461, -1.727156, 1.331044, 0.4156863, 0, 1, 1,
0.6348896, 0.4070402, -0.3525414, 0.4235294, 0, 1, 1,
0.6352106, 0.00679202, 1.072385, 0.427451, 0, 1, 1,
0.6353081, 2.248241, -0.2663334, 0.4352941, 0, 1, 1,
0.6440024, -0.9540635, 3.311079, 0.4392157, 0, 1, 1,
0.6453659, -0.1598475, 1.661317, 0.4470588, 0, 1, 1,
0.6501446, 0.8311654, 0.839091, 0.4509804, 0, 1, 1,
0.6507748, -1.052298, 3.922239, 0.4588235, 0, 1, 1,
0.6510303, 0.1209343, 1.947775, 0.4627451, 0, 1, 1,
0.6573486, -1.027404, 3.948724, 0.4705882, 0, 1, 1,
0.6585323, -1.001398, 1.797364, 0.4745098, 0, 1, 1,
0.6615276, 0.3429547, 3.033064, 0.4823529, 0, 1, 1,
0.6656366, -0.08047163, 1.481686, 0.4862745, 0, 1, 1,
0.6711642, 0.6019827, 0.9211665, 0.4941176, 0, 1, 1,
0.671333, -0.1633314, 2.893706, 0.5019608, 0, 1, 1,
0.6724998, -1.462804, 2.590697, 0.5058824, 0, 1, 1,
0.6730711, 0.6037174, 0.243043, 0.5137255, 0, 1, 1,
0.6768409, 0.4217124, 0.4400102, 0.5176471, 0, 1, 1,
0.6796548, -1.317343, 2.759684, 0.5254902, 0, 1, 1,
0.6845478, -0.9305876, 1.812832, 0.5294118, 0, 1, 1,
0.6850101, -1.303376, 2.123803, 0.5372549, 0, 1, 1,
0.6859125, -0.4766754, 3.076898, 0.5411765, 0, 1, 1,
0.6968908, 0.6977875, -0.0742643, 0.5490196, 0, 1, 1,
0.6991273, 0.4578144, 2.543618, 0.5529412, 0, 1, 1,
0.7027805, -0.0429321, 1.515506, 0.5607843, 0, 1, 1,
0.7042262, -0.09848561, 1.344949, 0.5647059, 0, 1, 1,
0.7050516, 0.01109457, 1.254829, 0.572549, 0, 1, 1,
0.7066259, -0.3895979, 2.899242, 0.5764706, 0, 1, 1,
0.7073414, -0.2499883, 3.071315, 0.5843138, 0, 1, 1,
0.7078071, 0.03141684, 0.3794062, 0.5882353, 0, 1, 1,
0.7094053, -0.1163387, 1.728666, 0.5960785, 0, 1, 1,
0.709554, 0.7991456, 1.402183, 0.6039216, 0, 1, 1,
0.714272, -0.7510329, 1.013394, 0.6078432, 0, 1, 1,
0.7225812, -1.384716, 2.721821, 0.6156863, 0, 1, 1,
0.7313837, -1.443077, 2.111302, 0.6196079, 0, 1, 1,
0.7335926, 0.1125347, 0.9366461, 0.627451, 0, 1, 1,
0.7408178, -0.4113525, 0.8441215, 0.6313726, 0, 1, 1,
0.7448487, -0.6614671, 1.448563, 0.6392157, 0, 1, 1,
0.7466784, 1.04204, 0.06543685, 0.6431373, 0, 1, 1,
0.747097, 1.430923, 0.2324457, 0.6509804, 0, 1, 1,
0.7472264, -1.463176, 2.560266, 0.654902, 0, 1, 1,
0.7481576, -1.580832, 1.357418, 0.6627451, 0, 1, 1,
0.7500142, -0.2388781, 1.426157, 0.6666667, 0, 1, 1,
0.7529637, 0.3056228, 3.291565, 0.6745098, 0, 1, 1,
0.7538507, 1.80336, 0.9710153, 0.6784314, 0, 1, 1,
0.753957, -0.4810654, 2.274023, 0.6862745, 0, 1, 1,
0.761026, -0.09152085, 2.788983, 0.6901961, 0, 1, 1,
0.7623225, -0.6002246, 0.3660585, 0.6980392, 0, 1, 1,
0.7664583, -1.09997, 1.266934, 0.7058824, 0, 1, 1,
0.7668785, -0.6964255, -0.06374219, 0.7098039, 0, 1, 1,
0.7678933, 1.237018, 0.4647171, 0.7176471, 0, 1, 1,
0.7685503, 0.01316894, 2.692863, 0.7215686, 0, 1, 1,
0.7706593, 1.599848, 0.8207332, 0.7294118, 0, 1, 1,
0.7709693, 0.2505479, -0.5454463, 0.7333333, 0, 1, 1,
0.7787481, -0.02766109, 1.079632, 0.7411765, 0, 1, 1,
0.792316, -1.249396, 2.955302, 0.7450981, 0, 1, 1,
0.8035858, 0.63525, 0.8788562, 0.7529412, 0, 1, 1,
0.8036586, -0.6562312, 0.6979383, 0.7568628, 0, 1, 1,
0.8097668, -1.434549, 1.654278, 0.7647059, 0, 1, 1,
0.8125748, -0.4664335, 3.865847, 0.7686275, 0, 1, 1,
0.8169151, -0.6002885, 2.40572, 0.7764706, 0, 1, 1,
0.8196652, 2.63379, 0.81439, 0.7803922, 0, 1, 1,
0.8212479, 0.5949003, 0.3802395, 0.7882353, 0, 1, 1,
0.8221018, -0.06216514, 1.423404, 0.7921569, 0, 1, 1,
0.8286423, 1.659033, -0.8564684, 0.8, 0, 1, 1,
0.8303549, -0.2078076, 2.603641, 0.8078431, 0, 1, 1,
0.8305704, 2.935725, -1.41297, 0.8117647, 0, 1, 1,
0.8370296, 0.4915483, -0.6878861, 0.8196079, 0, 1, 1,
0.8372496, 1.54839, 1.16168, 0.8235294, 0, 1, 1,
0.8380299, -0.6785576, 1.352185, 0.8313726, 0, 1, 1,
0.8384783, -1.185173, 2.159532, 0.8352941, 0, 1, 1,
0.8389174, -0.7021911, 2.758279, 0.8431373, 0, 1, 1,
0.8402965, -1.237751, 4.071499, 0.8470588, 0, 1, 1,
0.8429666, -0.1152049, 1.310362, 0.854902, 0, 1, 1,
0.8446975, -0.2759282, 0.4277515, 0.8588235, 0, 1, 1,
0.8453611, 0.7347303, 0.655176, 0.8666667, 0, 1, 1,
0.8536686, 1.272937, 0.272244, 0.8705882, 0, 1, 1,
0.8564665, 0.119711, 4.1306, 0.8784314, 0, 1, 1,
0.8614081, 2.120126, 1.257397, 0.8823529, 0, 1, 1,
0.8631158, -1.057212, 2.634959, 0.8901961, 0, 1, 1,
0.871042, 0.357067, 2.161951, 0.8941177, 0, 1, 1,
0.8713123, -0.2891518, 1.099635, 0.9019608, 0, 1, 1,
0.8730698, -1.997314, 4.075886, 0.9098039, 0, 1, 1,
0.8739873, 0.7687176, 3.290207, 0.9137255, 0, 1, 1,
0.8807929, -1.315605, 1.318684, 0.9215686, 0, 1, 1,
0.8953158, 1.176027, 2.069058, 0.9254902, 0, 1, 1,
0.8964072, -0.1933428, 0.4302264, 0.9333333, 0, 1, 1,
0.8976297, -0.05779795, 3.41249, 0.9372549, 0, 1, 1,
0.9002435, -1.196279, 3.458173, 0.945098, 0, 1, 1,
0.916709, -0.7048742, 1.642796, 0.9490196, 0, 1, 1,
0.9171256, 0.923974, 1.711412, 0.9568627, 0, 1, 1,
0.9202422, 0.2936743, 1.7052, 0.9607843, 0, 1, 1,
0.9404419, 1.290985, -0.4387162, 0.9686275, 0, 1, 1,
0.9514465, 1.795133, 0.8627916, 0.972549, 0, 1, 1,
0.952389, -1.415406, 1.283111, 0.9803922, 0, 1, 1,
0.959828, -0.1989187, 1.949333, 0.9843137, 0, 1, 1,
0.9662963, 0.2515857, 1.240645, 0.9921569, 0, 1, 1,
0.9740816, -0.116937, 1.199726, 0.9960784, 0, 1, 1,
0.9747368, -0.6407207, 1.056013, 1, 0, 0.9960784, 1,
0.9938591, -1.589238, 1.066422, 1, 0, 0.9882353, 1,
0.9984371, -1.163157, 2.002675, 1, 0, 0.9843137, 1,
1.008039, -0.812983, 4.058163, 1, 0, 0.9764706, 1,
1.016319, -0.9235733, 2.455106, 1, 0, 0.972549, 1,
1.019027, -0.3954066, 3.088156, 1, 0, 0.9647059, 1,
1.022856, -0.4924886, -0.1317603, 1, 0, 0.9607843, 1,
1.023824, 1.08763, 0.5379325, 1, 0, 0.9529412, 1,
1.031426, 1.07424, 1.740619, 1, 0, 0.9490196, 1,
1.034548, -0.04404426, 2.025495, 1, 0, 0.9411765, 1,
1.041938, 0.758462, 0.05280979, 1, 0, 0.9372549, 1,
1.04199, -0.0007172671, 1.830084, 1, 0, 0.9294118, 1,
1.045653, 0.8252212, -0.01363025, 1, 0, 0.9254902, 1,
1.049653, -0.5451586, 1.418571, 1, 0, 0.9176471, 1,
1.05683, -1.653431, 3.819997, 1, 0, 0.9137255, 1,
1.058867, -0.7754258, 0.7237235, 1, 0, 0.9058824, 1,
1.076993, -1.632605, 2.413215, 1, 0, 0.9019608, 1,
1.081055, -0.7270283, 2.820637, 1, 0, 0.8941177, 1,
1.091522, 0.5152943, 2.643942, 1, 0, 0.8862745, 1,
1.091906, 0.9620737, 0.463994, 1, 0, 0.8823529, 1,
1.093145, 0.520177, -0.2183311, 1, 0, 0.8745098, 1,
1.096352, 1.178209, -0.9490855, 1, 0, 0.8705882, 1,
1.097574, -1.793065, 3.058893, 1, 0, 0.8627451, 1,
1.100255, 1.39454, 0.1065088, 1, 0, 0.8588235, 1,
1.101597, 0.7400545, -0.3847493, 1, 0, 0.8509804, 1,
1.1079, -0.6602594, 1.584657, 1, 0, 0.8470588, 1,
1.110402, 0.4150691, 2.395182, 1, 0, 0.8392157, 1,
1.114337, -2.339571, 2.400173, 1, 0, 0.8352941, 1,
1.116517, 0.6016479, 1.088848, 1, 0, 0.827451, 1,
1.122128, -1.245338, 1.608738, 1, 0, 0.8235294, 1,
1.123684, -0.4753268, 1.356741, 1, 0, 0.8156863, 1,
1.129197, -1.0872, 2.587056, 1, 0, 0.8117647, 1,
1.142906, -0.2552674, 1.814947, 1, 0, 0.8039216, 1,
1.149627, 1.365591, 2.470615, 1, 0, 0.7960784, 1,
1.156993, -1.594096, 2.157262, 1, 0, 0.7921569, 1,
1.159099, -2.893158, 4.721907, 1, 0, 0.7843137, 1,
1.167113, -0.4962406, 3.034607, 1, 0, 0.7803922, 1,
1.177629, -2.509188, 3.38119, 1, 0, 0.772549, 1,
1.193261, 0.7218189, 2.227703, 1, 0, 0.7686275, 1,
1.198297, -0.1993222, 1.890269, 1, 0, 0.7607843, 1,
1.200252, 1.122086, -0.4467658, 1, 0, 0.7568628, 1,
1.20442, -1.360357, 3.050339, 1, 0, 0.7490196, 1,
1.205509, -0.7391156, 2.062824, 1, 0, 0.7450981, 1,
1.205796, 0.09916049, 2.463102, 1, 0, 0.7372549, 1,
1.20957, 0.5813084, 0.8863387, 1, 0, 0.7333333, 1,
1.211274, -0.795654, 1.465181, 1, 0, 0.7254902, 1,
1.212767, -1.511325, 1.960946, 1, 0, 0.7215686, 1,
1.213523, 1.249773, 0.9096656, 1, 0, 0.7137255, 1,
1.214071, 0.1117019, 1.717315, 1, 0, 0.7098039, 1,
1.215317, -0.01908891, 1.354476, 1, 0, 0.7019608, 1,
1.217537, 0.8700055, 0.1909057, 1, 0, 0.6941177, 1,
1.226962, -0.2402263, 0.014275, 1, 0, 0.6901961, 1,
1.230015, -1.163992, 0.8989344, 1, 0, 0.682353, 1,
1.237933, 1.381433, -0.2177761, 1, 0, 0.6784314, 1,
1.238112, -0.4995416, 2.007229, 1, 0, 0.6705883, 1,
1.243105, 0.2878076, 1.265265, 1, 0, 0.6666667, 1,
1.243137, 2.567146, -0.5673266, 1, 0, 0.6588235, 1,
1.247711, -1.087066, 0.484857, 1, 0, 0.654902, 1,
1.255521, 0.2523172, 1.186763, 1, 0, 0.6470588, 1,
1.260628, 1.28397, -0.6033967, 1, 0, 0.6431373, 1,
1.265592, 1.041597, 0.2698992, 1, 0, 0.6352941, 1,
1.278131, -1.072073, 0.5897412, 1, 0, 0.6313726, 1,
1.280317, 0.6017139, 1.472446, 1, 0, 0.6235294, 1,
1.28349, -1.284333, 1.890214, 1, 0, 0.6196079, 1,
1.283494, -0.07063743, 0.6602622, 1, 0, 0.6117647, 1,
1.288214, 0.680971, 1.979269, 1, 0, 0.6078432, 1,
1.288922, 0.2109741, 1.003032, 1, 0, 0.6, 1,
1.290918, -0.5526341, 1.249496, 1, 0, 0.5921569, 1,
1.294653, -0.9736674, 2.007557, 1, 0, 0.5882353, 1,
1.295341, 0.9743397, 1.42209, 1, 0, 0.5803922, 1,
1.295469, 0.3484244, 2.646381, 1, 0, 0.5764706, 1,
1.298939, 1.933739, 0.2816395, 1, 0, 0.5686275, 1,
1.299098, 0.06606194, 1.304418, 1, 0, 0.5647059, 1,
1.302882, 1.498568, 0.2793926, 1, 0, 0.5568628, 1,
1.321356, -1.96708, 1.587469, 1, 0, 0.5529412, 1,
1.324024, -0.4892557, 1.928655, 1, 0, 0.5450981, 1,
1.32427, 1.433504, -0.08670501, 1, 0, 0.5411765, 1,
1.331394, 0.5759842, 2.730313, 1, 0, 0.5333334, 1,
1.338398, -0.6577436, 0.7856017, 1, 0, 0.5294118, 1,
1.343019, 2.514927, 2.056065, 1, 0, 0.5215687, 1,
1.348918, 1.448177, 2.246876, 1, 0, 0.5176471, 1,
1.353853, 1.785048, -0.1471308, 1, 0, 0.509804, 1,
1.356391, 0.9289513, 0.7446589, 1, 0, 0.5058824, 1,
1.35916, 2.353292, 1.276802, 1, 0, 0.4980392, 1,
1.359598, 0.1594311, 0.6228587, 1, 0, 0.4901961, 1,
1.372134, 0.03214643, 0.683991, 1, 0, 0.4862745, 1,
1.374473, -0.3010306, 2.294654, 1, 0, 0.4784314, 1,
1.409043, 0.9421275, 2.013389, 1, 0, 0.4745098, 1,
1.411516, 0.193994, 1.716745, 1, 0, 0.4666667, 1,
1.416773, 1.460437, 0.06783488, 1, 0, 0.4627451, 1,
1.425396, 0.3470709, 0.4468225, 1, 0, 0.454902, 1,
1.427889, -0.4653557, 2.175546, 1, 0, 0.4509804, 1,
1.433273, -0.8212235, 2.184355, 1, 0, 0.4431373, 1,
1.454733, -1.156379, 2.329518, 1, 0, 0.4392157, 1,
1.456402, -0.3659211, 0.8928784, 1, 0, 0.4313726, 1,
1.456947, -0.2424745, 2.477705, 1, 0, 0.427451, 1,
1.461682, 0.7895238, 1.124043, 1, 0, 0.4196078, 1,
1.471112, 0.6711573, 0.4631669, 1, 0, 0.4156863, 1,
1.472871, -0.2141124, 2.151239, 1, 0, 0.4078431, 1,
1.47918, -1.593544, 1.827839, 1, 0, 0.4039216, 1,
1.483522, 0.1474414, 0.319961, 1, 0, 0.3960784, 1,
1.493131, -0.8060574, 1.461605, 1, 0, 0.3882353, 1,
1.498682, 0.1243061, 1.400242, 1, 0, 0.3843137, 1,
1.505954, -2.319044, 1.745691, 1, 0, 0.3764706, 1,
1.52553, 0.00684068, 3.966957, 1, 0, 0.372549, 1,
1.528148, 0.7058888, 2.058117, 1, 0, 0.3647059, 1,
1.528852, -1.408826, 0.9630752, 1, 0, 0.3607843, 1,
1.533747, -0.08150131, 1.572761, 1, 0, 0.3529412, 1,
1.540519, -1.014169, 3.156511, 1, 0, 0.3490196, 1,
1.55979, -1.175304, 3.338363, 1, 0, 0.3411765, 1,
1.56767, -1.414644, 2.29792, 1, 0, 0.3372549, 1,
1.575171, -0.03652993, 2.643827, 1, 0, 0.3294118, 1,
1.589813, 0.43939, 1.111178, 1, 0, 0.3254902, 1,
1.596205, -0.9739249, 4.568586, 1, 0, 0.3176471, 1,
1.598786, -1.54293, 2.05924, 1, 0, 0.3137255, 1,
1.601179, -0.8698449, 1.894627, 1, 0, 0.3058824, 1,
1.601233, 0.06640727, 1.960408, 1, 0, 0.2980392, 1,
1.602022, -0.1322574, -0.1424827, 1, 0, 0.2941177, 1,
1.603376, -0.4606933, 0.5448387, 1, 0, 0.2862745, 1,
1.631283, 0.7519177, 0.1888173, 1, 0, 0.282353, 1,
1.64053, 1.604166, 1.061553, 1, 0, 0.2745098, 1,
1.660861, -0.5628438, 2.248092, 1, 0, 0.2705882, 1,
1.673748, 2.488059, 0.9860593, 1, 0, 0.2627451, 1,
1.674185, -0.4513369, 2.667088, 1, 0, 0.2588235, 1,
1.689008, 0.7294793, 2.457129, 1, 0, 0.2509804, 1,
1.696951, -0.02512539, -0.04425975, 1, 0, 0.2470588, 1,
1.704252, -0.1180957, 1.652016, 1, 0, 0.2392157, 1,
1.712247, -0.2528632, 2.322711, 1, 0, 0.2352941, 1,
1.74007, 0.3385178, 1.971064, 1, 0, 0.227451, 1,
1.77359, 0.8882271, 2.026662, 1, 0, 0.2235294, 1,
1.77722, -1.886616, 2.752489, 1, 0, 0.2156863, 1,
1.777795, 2.119956, 3.180548, 1, 0, 0.2117647, 1,
1.778262, 1.390121, -0.02275105, 1, 0, 0.2039216, 1,
1.803594, 1.41468, -0.3438276, 1, 0, 0.1960784, 1,
1.80576, 0.9163008, 0.8856772, 1, 0, 0.1921569, 1,
1.830657, 1.274979, 0.768151, 1, 0, 0.1843137, 1,
1.839622, -0.7541584, 3.313094, 1, 0, 0.1803922, 1,
1.848598, -0.002048257, 0.6750597, 1, 0, 0.172549, 1,
1.856815, -0.7586699, 3.79994, 1, 0, 0.1686275, 1,
1.897064, -0.7295098, 1.609661, 1, 0, 0.1607843, 1,
1.903921, -1.409536, 0.5191121, 1, 0, 0.1568628, 1,
1.923507, -0.2112251, 1.807451, 1, 0, 0.1490196, 1,
1.92461, -0.2496376, 2.678464, 1, 0, 0.145098, 1,
1.95053, 0.150832, 1.252797, 1, 0, 0.1372549, 1,
1.980237, 1.712511, 0.878228, 1, 0, 0.1333333, 1,
1.986094, 0.2816296, -0.2424679, 1, 0, 0.1254902, 1,
2.009486, 0.3504339, 2.225038, 1, 0, 0.1215686, 1,
2.019072, -0.09799547, 1.465618, 1, 0, 0.1137255, 1,
2.06041, 1.025525, 1.45051, 1, 0, 0.1098039, 1,
2.064931, 1.065464, 1.373467, 1, 0, 0.1019608, 1,
2.082971, 0.3254569, 2.089409, 1, 0, 0.09411765, 1,
2.092136, -0.2447921, 0.1469094, 1, 0, 0.09019608, 1,
2.092283, -1.210619, 0.6466433, 1, 0, 0.08235294, 1,
2.116248, -0.8117878, 2.117824, 1, 0, 0.07843138, 1,
2.150308, -0.1959447, 3.15139, 1, 0, 0.07058824, 1,
2.169616, 0.8095086, 1.009933, 1, 0, 0.06666667, 1,
2.197402, 0.6117632, 1.208663, 1, 0, 0.05882353, 1,
2.251518, -0.7108039, 3.091966, 1, 0, 0.05490196, 1,
2.32523, -1.179043, 3.578168, 1, 0, 0.04705882, 1,
2.365143, 0.4468119, 2.477381, 1, 0, 0.04313726, 1,
2.513976, 0.1916388, 2.481878, 1, 0, 0.03529412, 1,
2.538112, -0.3978369, 4.384656, 1, 0, 0.03137255, 1,
2.55252, -1.163154, 4.12, 1, 0, 0.02352941, 1,
2.812271, 1.519011, 0.2304333, 1, 0, 0.01960784, 1,
2.929752, -0.7356506, 1.598166, 1, 0, 0.01176471, 1,
3.147187, -0.2811567, -0.2648481, 1, 0, 0.007843138, 1
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
-0.1126543, -3.922441, -7.170666, 0, -0.5, 0.5, 0.5,
-0.1126543, -3.922441, -7.170666, 1, -0.5, 0.5, 0.5,
-0.1126543, -3.922441, -7.170666, 1, 1.5, 0.5, 0.5,
-0.1126543, -3.922441, -7.170666, 0, 1.5, 0.5, 0.5
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
-4.477582, 0.1430746, -7.170666, 0, -0.5, 0.5, 0.5,
-4.477582, 0.1430746, -7.170666, 1, -0.5, 0.5, 0.5,
-4.477582, 0.1430746, -7.170666, 1, 1.5, 0.5, 0.5,
-4.477582, 0.1430746, -7.170666, 0, 1.5, 0.5, 0.5
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
-4.477582, -3.922441, -0.2151015, 0, -0.5, 0.5, 0.5,
-4.477582, -3.922441, -0.2151015, 1, -0.5, 0.5, 0.5,
-4.477582, -3.922441, -0.2151015, 1, 1.5, 0.5, 0.5,
-4.477582, -3.922441, -0.2151015, 0, 1.5, 0.5, 0.5
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
-3, -2.984246, -5.565536,
3, -2.984246, -5.565536,
-3, -2.984246, -5.565536,
-3, -3.140611, -5.833057,
-2, -2.984246, -5.565536,
-2, -3.140611, -5.833057,
-1, -2.984246, -5.565536,
-1, -3.140611, -5.833057,
0, -2.984246, -5.565536,
0, -3.140611, -5.833057,
1, -2.984246, -5.565536,
1, -3.140611, -5.833057,
2, -2.984246, -5.565536,
2, -3.140611, -5.833057,
3, -2.984246, -5.565536,
3, -3.140611, -5.833057
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
-3, -3.453343, -6.368101, 0, -0.5, 0.5, 0.5,
-3, -3.453343, -6.368101, 1, -0.5, 0.5, 0.5,
-3, -3.453343, -6.368101, 1, 1.5, 0.5, 0.5,
-3, -3.453343, -6.368101, 0, 1.5, 0.5, 0.5,
-2, -3.453343, -6.368101, 0, -0.5, 0.5, 0.5,
-2, -3.453343, -6.368101, 1, -0.5, 0.5, 0.5,
-2, -3.453343, -6.368101, 1, 1.5, 0.5, 0.5,
-2, -3.453343, -6.368101, 0, 1.5, 0.5, 0.5,
-1, -3.453343, -6.368101, 0, -0.5, 0.5, 0.5,
-1, -3.453343, -6.368101, 1, -0.5, 0.5, 0.5,
-1, -3.453343, -6.368101, 1, 1.5, 0.5, 0.5,
-1, -3.453343, -6.368101, 0, 1.5, 0.5, 0.5,
0, -3.453343, -6.368101, 0, -0.5, 0.5, 0.5,
0, -3.453343, -6.368101, 1, -0.5, 0.5, 0.5,
0, -3.453343, -6.368101, 1, 1.5, 0.5, 0.5,
0, -3.453343, -6.368101, 0, 1.5, 0.5, 0.5,
1, -3.453343, -6.368101, 0, -0.5, 0.5, 0.5,
1, -3.453343, -6.368101, 1, -0.5, 0.5, 0.5,
1, -3.453343, -6.368101, 1, 1.5, 0.5, 0.5,
1, -3.453343, -6.368101, 0, 1.5, 0.5, 0.5,
2, -3.453343, -6.368101, 0, -0.5, 0.5, 0.5,
2, -3.453343, -6.368101, 1, -0.5, 0.5, 0.5,
2, -3.453343, -6.368101, 1, 1.5, 0.5, 0.5,
2, -3.453343, -6.368101, 0, 1.5, 0.5, 0.5,
3, -3.453343, -6.368101, 0, -0.5, 0.5, 0.5,
3, -3.453343, -6.368101, 1, -0.5, 0.5, 0.5,
3, -3.453343, -6.368101, 1, 1.5, 0.5, 0.5,
3, -3.453343, -6.368101, 0, 1.5, 0.5, 0.5
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
-3.470291, -2, -5.565536,
-3.470291, 3, -5.565536,
-3.470291, -2, -5.565536,
-3.638173, -2, -5.833057,
-3.470291, -1, -5.565536,
-3.638173, -1, -5.833057,
-3.470291, 0, -5.565536,
-3.638173, 0, -5.833057,
-3.470291, 1, -5.565536,
-3.638173, 1, -5.833057,
-3.470291, 2, -5.565536,
-3.638173, 2, -5.833057,
-3.470291, 3, -5.565536,
-3.638173, 3, -5.833057
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
-3.973937, -2, -6.368101, 0, -0.5, 0.5, 0.5,
-3.973937, -2, -6.368101, 1, -0.5, 0.5, 0.5,
-3.973937, -2, -6.368101, 1, 1.5, 0.5, 0.5,
-3.973937, -2, -6.368101, 0, 1.5, 0.5, 0.5,
-3.973937, -1, -6.368101, 0, -0.5, 0.5, 0.5,
-3.973937, -1, -6.368101, 1, -0.5, 0.5, 0.5,
-3.973937, -1, -6.368101, 1, 1.5, 0.5, 0.5,
-3.973937, -1, -6.368101, 0, 1.5, 0.5, 0.5,
-3.973937, 0, -6.368101, 0, -0.5, 0.5, 0.5,
-3.973937, 0, -6.368101, 1, -0.5, 0.5, 0.5,
-3.973937, 0, -6.368101, 1, 1.5, 0.5, 0.5,
-3.973937, 0, -6.368101, 0, 1.5, 0.5, 0.5,
-3.973937, 1, -6.368101, 0, -0.5, 0.5, 0.5,
-3.973937, 1, -6.368101, 1, -0.5, 0.5, 0.5,
-3.973937, 1, -6.368101, 1, 1.5, 0.5, 0.5,
-3.973937, 1, -6.368101, 0, 1.5, 0.5, 0.5,
-3.973937, 2, -6.368101, 0, -0.5, 0.5, 0.5,
-3.973937, 2, -6.368101, 1, -0.5, 0.5, 0.5,
-3.973937, 2, -6.368101, 1, 1.5, 0.5, 0.5,
-3.973937, 2, -6.368101, 0, 1.5, 0.5, 0.5,
-3.973937, 3, -6.368101, 0, -0.5, 0.5, 0.5,
-3.973937, 3, -6.368101, 1, -0.5, 0.5, 0.5,
-3.973937, 3, -6.368101, 1, 1.5, 0.5, 0.5,
-3.973937, 3, -6.368101, 0, 1.5, 0.5, 0.5
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
-3.470291, -2.984246, -4,
-3.470291, -2.984246, 4,
-3.470291, -2.984246, -4,
-3.638173, -3.140611, -4,
-3.470291, -2.984246, -2,
-3.638173, -3.140611, -2,
-3.470291, -2.984246, 0,
-3.638173, -3.140611, 0,
-3.470291, -2.984246, 2,
-3.638173, -3.140611, 2,
-3.470291, -2.984246, 4,
-3.638173, -3.140611, 4
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
-3.973937, -3.453343, -4, 0, -0.5, 0.5, 0.5,
-3.973937, -3.453343, -4, 1, -0.5, 0.5, 0.5,
-3.973937, -3.453343, -4, 1, 1.5, 0.5, 0.5,
-3.973937, -3.453343, -4, 0, 1.5, 0.5, 0.5,
-3.973937, -3.453343, -2, 0, -0.5, 0.5, 0.5,
-3.973937, -3.453343, -2, 1, -0.5, 0.5, 0.5,
-3.973937, -3.453343, -2, 1, 1.5, 0.5, 0.5,
-3.973937, -3.453343, -2, 0, 1.5, 0.5, 0.5,
-3.973937, -3.453343, 0, 0, -0.5, 0.5, 0.5,
-3.973937, -3.453343, 0, 1, -0.5, 0.5, 0.5,
-3.973937, -3.453343, 0, 1, 1.5, 0.5, 0.5,
-3.973937, -3.453343, 0, 0, 1.5, 0.5, 0.5,
-3.973937, -3.453343, 2, 0, -0.5, 0.5, 0.5,
-3.973937, -3.453343, 2, 1, -0.5, 0.5, 0.5,
-3.973937, -3.453343, 2, 1, 1.5, 0.5, 0.5,
-3.973937, -3.453343, 2, 0, 1.5, 0.5, 0.5,
-3.973937, -3.453343, 4, 0, -0.5, 0.5, 0.5,
-3.973937, -3.453343, 4, 1, -0.5, 0.5, 0.5,
-3.973937, -3.453343, 4, 1, 1.5, 0.5, 0.5,
-3.973937, -3.453343, 4, 0, 1.5, 0.5, 0.5
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
-3.470291, -2.984246, -5.565536,
-3.470291, 3.270395, -5.565536,
-3.470291, -2.984246, 5.135333,
-3.470291, 3.270395, 5.135333,
-3.470291, -2.984246, -5.565536,
-3.470291, -2.984246, 5.135333,
-3.470291, 3.270395, -5.565536,
-3.470291, 3.270395, 5.135333,
-3.470291, -2.984246, -5.565536,
3.244983, -2.984246, -5.565536,
-3.470291, -2.984246, 5.135333,
3.244983, -2.984246, 5.135333,
-3.470291, 3.270395, -5.565536,
3.244983, 3.270395, -5.565536,
-3.470291, 3.270395, 5.135333,
3.244983, 3.270395, 5.135333,
3.244983, -2.984246, -5.565536,
3.244983, 3.270395, -5.565536,
3.244983, -2.984246, 5.135333,
3.244983, 3.270395, 5.135333,
3.244983, -2.984246, -5.565536,
3.244983, -2.984246, 5.135333,
3.244983, 3.270395, -5.565536,
3.244983, 3.270395, 5.135333
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
var radius = 7.527498;
var distance = 33.49069;
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
mvMatrix.translate( 0.1126543, -0.1430746, 0.2151015 );
mvMatrix.scale( 1.211995, 1.301255, 0.7605811 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.49069);
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
endothal<-read.table("endothal.xyz")
```

```
## Error in read.table("endothal.xyz"): no lines available in input
```

```r
x<-endothal$V2
```

```
## Error in eval(expr, envir, enclos): object 'endothal' not found
```

```r
y<-endothal$V3
```

```
## Error in eval(expr, envir, enclos): object 'endothal' not found
```

```r
z<-endothal$V4
```

```
## Error in eval(expr, envir, enclos): object 'endothal' not found
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
-3.372496, -1.542496, -3.457992, 0, 0, 1, 1, 1,
-2.695547, 0.9812427, -0.5117157, 1, 0, 0, 1, 1,
-2.587012, -0.2878649, -2.556108, 1, 0, 0, 1, 1,
-2.548883, 0.2591237, -1.84753, 1, 0, 0, 1, 1,
-2.529778, 0.3667456, 0.4730589, 1, 0, 0, 1, 1,
-2.442922, 0.523717, 0.400511, 1, 0, 0, 1, 1,
-2.415774, -0.4597479, -0.9951998, 0, 0, 0, 1, 1,
-2.403972, -0.1153961, -1.205867, 0, 0, 0, 1, 1,
-2.399397, -0.7277601, -2.286013, 0, 0, 0, 1, 1,
-2.373137, -0.2787729, -1.670906, 0, 0, 0, 1, 1,
-2.323263, -1.32074, -3.140351, 0, 0, 0, 1, 1,
-2.307783, 2.030849, -0.9406006, 0, 0, 0, 1, 1,
-2.281987, 0.7822232, -1.35433, 0, 0, 0, 1, 1,
-2.204569, 1.372726, -0.03131645, 1, 1, 1, 1, 1,
-2.193724, -0.7470782, -1.514763, 1, 1, 1, 1, 1,
-2.129433, -0.2883224, -1.420638, 1, 1, 1, 1, 1,
-2.106619, -0.8503423, -2.347324, 1, 1, 1, 1, 1,
-2.08704, -0.02673261, -0.9342664, 1, 1, 1, 1, 1,
-2.086749, -1.362324, -0.2680612, 1, 1, 1, 1, 1,
-2.079286, 1.923218, -1.011706, 1, 1, 1, 1, 1,
-2.072367, 0.5966894, 0.05000759, 1, 1, 1, 1, 1,
-2.052134, -1.535839, -3.850345, 1, 1, 1, 1, 1,
-2.050166, 1.732518, -0.9336614, 1, 1, 1, 1, 1,
-2.036063, -0.8723611, -1.383745, 1, 1, 1, 1, 1,
-1.998468, -0.4259559, -2.934117, 1, 1, 1, 1, 1,
-1.993838, -0.8471252, -1.759214, 1, 1, 1, 1, 1,
-1.984413, 0.6523723, -0.8061036, 1, 1, 1, 1, 1,
-1.982498, 0.4477607, -0.1718394, 1, 1, 1, 1, 1,
-1.975761, 1.402666, -0.4874044, 0, 0, 1, 1, 1,
-1.972019, -1.429283, -3.317447, 1, 0, 0, 1, 1,
-1.943579, -1.09545, -1.928428, 1, 0, 0, 1, 1,
-1.942801, -1.554411, -0.4066488, 1, 0, 0, 1, 1,
-1.93294, 0.2606983, -1.656753, 1, 0, 0, 1, 1,
-1.932864, -0.8426156, -2.583266, 1, 0, 0, 1, 1,
-1.910378, -0.7374845, -3.594215, 0, 0, 0, 1, 1,
-1.897896, -1.605305, -2.815123, 0, 0, 0, 1, 1,
-1.863072, 1.010762, -0.7989545, 0, 0, 0, 1, 1,
-1.860816, -0.7283183, -3.410815, 0, 0, 0, 1, 1,
-1.832018, -0.7880449, -1.968964, 0, 0, 0, 1, 1,
-1.80854, 0.6965109, -1.834222, 0, 0, 0, 1, 1,
-1.805574, -0.6479712, -1.700234, 0, 0, 0, 1, 1,
-1.783921, 0.1051145, -0.05286848, 1, 1, 1, 1, 1,
-1.769844, -0.5248494, -1.081289, 1, 1, 1, 1, 1,
-1.76835, -2.854732, -3.008461, 1, 1, 1, 1, 1,
-1.765978, 1.041017, -0.9849743, 1, 1, 1, 1, 1,
-1.758697, -0.2352896, -2.540424, 1, 1, 1, 1, 1,
-1.756901, 0.2527318, -2.521594, 1, 1, 1, 1, 1,
-1.756161, -1.020638, -0.3710651, 1, 1, 1, 1, 1,
-1.755116, -0.646965, -1.794576, 1, 1, 1, 1, 1,
-1.754505, 1.081601, -0.6917362, 1, 1, 1, 1, 1,
-1.751693, 0.7319978, -2.368594, 1, 1, 1, 1, 1,
-1.744835, 0.7356854, -2.188357, 1, 1, 1, 1, 1,
-1.731871, -1.362062, -1.878947, 1, 1, 1, 1, 1,
-1.731296, 0.0681304, -0.03408659, 1, 1, 1, 1, 1,
-1.718, -1.085095, -3.905103, 1, 1, 1, 1, 1,
-1.715017, 0.04706685, -1.715968, 1, 1, 1, 1, 1,
-1.710703, 0.6479403, -2.301912, 0, 0, 1, 1, 1,
-1.70774, 0.2580131, -2.065952, 1, 0, 0, 1, 1,
-1.670041, 0.1848445, 0.3977354, 1, 0, 0, 1, 1,
-1.666928, 0.2444603, -1.028423, 1, 0, 0, 1, 1,
-1.663042, -1.138121, -3.19221, 1, 0, 0, 1, 1,
-1.647534, -0.527475, -0.3705161, 1, 0, 0, 1, 1,
-1.639392, 0.1045431, 0.03303826, 0, 0, 0, 1, 1,
-1.630657, 0.5247987, -1.64391, 0, 0, 0, 1, 1,
-1.62238, -0.1229819, -2.650927, 0, 0, 0, 1, 1,
-1.618698, 0.06167948, -0.3412021, 0, 0, 0, 1, 1,
-1.613317, -0.1284607, 1.33364, 0, 0, 0, 1, 1,
-1.608376, -0.5467971, -3.13775, 0, 0, 0, 1, 1,
-1.602066, 0.167338, -1.645252, 0, 0, 0, 1, 1,
-1.600826, 2.369063, -1.27932, 1, 1, 1, 1, 1,
-1.591025, -1.482056, -2.410652, 1, 1, 1, 1, 1,
-1.579482, 0.1868282, -1.065095, 1, 1, 1, 1, 1,
-1.560175, -0.5642125, -0.8142751, 1, 1, 1, 1, 1,
-1.555762, 1.14097, 0.03305991, 1, 1, 1, 1, 1,
-1.540925, -0.8021293, -1.097949, 1, 1, 1, 1, 1,
-1.539908, -1.153479, -2.828106, 1, 1, 1, 1, 1,
-1.516414, -0.01748544, -1.367815, 1, 1, 1, 1, 1,
-1.499886, -1.570959, -1.511979, 1, 1, 1, 1, 1,
-1.49486, 0.1797819, -0.7819452, 1, 1, 1, 1, 1,
-1.471601, 1.656458, -0.9585099, 1, 1, 1, 1, 1,
-1.464993, -0.1828862, -2.62351, 1, 1, 1, 1, 1,
-1.450895, -0.3081323, -2.112541, 1, 1, 1, 1, 1,
-1.442261, -0.830023, -2.679629, 1, 1, 1, 1, 1,
-1.439593, 2.095478, -1.451199, 1, 1, 1, 1, 1,
-1.436271, 1.286319, -0.121725, 0, 0, 1, 1, 1,
-1.435754, -2.140408, -2.896335, 1, 0, 0, 1, 1,
-1.431046, -0.1836868, -1.344848, 1, 0, 0, 1, 1,
-1.430209, -0.63966, -0.8985673, 1, 0, 0, 1, 1,
-1.425759, -0.4464321, -2.880925, 1, 0, 0, 1, 1,
-1.422975, -1.265962, -2.580852, 1, 0, 0, 1, 1,
-1.413599, 1.09287, 0.3791502, 0, 0, 0, 1, 1,
-1.413577, 0.798299, -1.711753, 0, 0, 0, 1, 1,
-1.412565, -2.00468, -1.993939, 0, 0, 0, 1, 1,
-1.401856, -0.7407303, -1.513249, 0, 0, 0, 1, 1,
-1.398516, 0.008428492, -1.166162, 0, 0, 0, 1, 1,
-1.38009, 0.5726594, -0.1552649, 0, 0, 0, 1, 1,
-1.367749, -0.4171908, -1.372401, 0, 0, 0, 1, 1,
-1.353143, 0.9106872, -3.195537, 1, 1, 1, 1, 1,
-1.346156, 0.8733912, -1.402965, 1, 1, 1, 1, 1,
-1.345215, 0.7518684, 0.7634201, 1, 1, 1, 1, 1,
-1.343987, 1.466094, -0.4642155, 1, 1, 1, 1, 1,
-1.337998, 0.6304576, -0.5159794, 1, 1, 1, 1, 1,
-1.335467, 0.368159, -2.415922, 1, 1, 1, 1, 1,
-1.324539, 0.7755492, -1.318936, 1, 1, 1, 1, 1,
-1.322653, -0.757304, -2.975431, 1, 1, 1, 1, 1,
-1.308443, 0.6557906, -0.8345293, 1, 1, 1, 1, 1,
-1.303828, 1.023958, -0.807642, 1, 1, 1, 1, 1,
-1.275949, 1.454804, -2.523948, 1, 1, 1, 1, 1,
-1.266459, 0.1689155, 0.309812, 1, 1, 1, 1, 1,
-1.263933, -1.179725, -1.69468, 1, 1, 1, 1, 1,
-1.258071, 1.082224, -1.91333, 1, 1, 1, 1, 1,
-1.255717, -0.8178308, -0.1425602, 1, 1, 1, 1, 1,
-1.255163, -1.33695, -2.286026, 0, 0, 1, 1, 1,
-1.251731, -0.7232278, -1.758022, 1, 0, 0, 1, 1,
-1.247948, 0.6875367, -1.167495, 1, 0, 0, 1, 1,
-1.247044, 0.638481, -1.005519, 1, 0, 0, 1, 1,
-1.246151, 0.2160273, -1.698612, 1, 0, 0, 1, 1,
-1.242239, -0.1048789, -2.457482, 1, 0, 0, 1, 1,
-1.237945, 0.2912883, -0.1760164, 0, 0, 0, 1, 1,
-1.237909, -1.113498, -2.255685, 0, 0, 0, 1, 1,
-1.232619, 1.452323, -0.4131101, 0, 0, 0, 1, 1,
-1.22933, 0.01434099, -2.07936, 0, 0, 0, 1, 1,
-1.225666, 0.2826548, -1.267703, 0, 0, 0, 1, 1,
-1.223053, -1.287277, -1.031091, 0, 0, 0, 1, 1,
-1.217764, 1.169168, -1.545735, 0, 0, 0, 1, 1,
-1.217715, 0.8318399, -2.022105, 1, 1, 1, 1, 1,
-1.215179, -1.726972, -0.2741742, 1, 1, 1, 1, 1,
-1.202031, 0.570515, -1.914194, 1, 1, 1, 1, 1,
-1.189789, -0.1399451, -2.677813, 1, 1, 1, 1, 1,
-1.187646, -0.545359, -3.998619, 1, 1, 1, 1, 1,
-1.185384, -0.8119968, -3.65536, 1, 1, 1, 1, 1,
-1.167201, 1.200761, -0.4363369, 1, 1, 1, 1, 1,
-1.165071, 1.037158, -2.165817, 1, 1, 1, 1, 1,
-1.164139, -1.358254, -3.277512, 1, 1, 1, 1, 1,
-1.163894, -1.222456, -2.811306, 1, 1, 1, 1, 1,
-1.159096, 1.054482, -0.6645086, 1, 1, 1, 1, 1,
-1.152132, -1.449885, -3.103953, 1, 1, 1, 1, 1,
-1.139994, 1.819293, 0.1158633, 1, 1, 1, 1, 1,
-1.136942, -0.5338476, -3.323886, 1, 1, 1, 1, 1,
-1.135174, -0.5563831, -2.825817, 1, 1, 1, 1, 1,
-1.12613, 0.3116286, -0.4991654, 0, 0, 1, 1, 1,
-1.125089, -1.063468, -1.769958, 1, 0, 0, 1, 1,
-1.113545, -1.328773, -3.406184, 1, 0, 0, 1, 1,
-1.109052, -1.020292, -1.648951, 1, 0, 0, 1, 1,
-1.108082, 0.3973645, -1.174684, 1, 0, 0, 1, 1,
-1.104194, 0.07291905, -2.286758, 1, 0, 0, 1, 1,
-1.102824, 1.61657, 0.605377, 0, 0, 0, 1, 1,
-1.101554, -0.7152864, -3.227748, 0, 0, 0, 1, 1,
-1.100571, 0.5434958, -0.7121853, 0, 0, 0, 1, 1,
-1.090924, 0.4734519, -2.520699, 0, 0, 0, 1, 1,
-1.090914, 0.1628957, 0.3658236, 0, 0, 0, 1, 1,
-1.088909, -0.3213909, -0.4893747, 0, 0, 0, 1, 1,
-1.068867, -0.3045902, -1.176543, 0, 0, 0, 1, 1,
-1.064373, 0.195991, 0.2827807, 1, 1, 1, 1, 1,
-1.060655, 0.8121561, -0.8805147, 1, 1, 1, 1, 1,
-1.051799, 0.7249437, -0.7229316, 1, 1, 1, 1, 1,
-1.048587, -0.1064524, -1.504738, 1, 1, 1, 1, 1,
-1.04679, -0.4918323, 0.09614792, 1, 1, 1, 1, 1,
-1.046543, 0.4532529, -1.732052, 1, 1, 1, 1, 1,
-1.043925, 1.046527, -1.674632, 1, 1, 1, 1, 1,
-1.042593, 0.1247113, -0.301666, 1, 1, 1, 1, 1,
-1.040035, 1.504249, 0.09823065, 1, 1, 1, 1, 1,
-1.037109, 0.4921164, -0.3012739, 1, 1, 1, 1, 1,
-1.033405, 0.2441452, -0.8179182, 1, 1, 1, 1, 1,
-1.027459, 0.004494731, -1.234192, 1, 1, 1, 1, 1,
-1.026767, 0.0005352605, -1.994236, 1, 1, 1, 1, 1,
-1.026569, 2.023359, -0.5595853, 1, 1, 1, 1, 1,
-1.025548, 0.7782977, -0.08339571, 1, 1, 1, 1, 1,
-1.024774, 0.4481606, -0.9454258, 0, 0, 1, 1, 1,
-1.021064, 0.1807293, -1.521254, 1, 0, 0, 1, 1,
-1.017171, -0.933054, -1.460773, 1, 0, 0, 1, 1,
-1.013129, -0.220188, -1.200626, 1, 0, 0, 1, 1,
-1.007195, 0.8582095, -1.805148, 1, 0, 0, 1, 1,
-1.007132, 0.3199122, -3.406881, 1, 0, 0, 1, 1,
-1.004121, -0.1340468, -2.273746, 0, 0, 0, 1, 1,
-1.000172, -1.191469, -1.146451, 0, 0, 0, 1, 1,
-0.9995657, 1.677419, -1.121721, 0, 0, 0, 1, 1,
-0.9975266, 1.415302, -0.2867388, 0, 0, 0, 1, 1,
-0.9959322, 2.87107, 2.779395, 0, 0, 0, 1, 1,
-0.9933578, -1.190691, -3.82878, 0, 0, 0, 1, 1,
-0.9928223, 0.6326653, -2.638848, 0, 0, 0, 1, 1,
-0.991611, 0.8175148, -0.1941997, 1, 1, 1, 1, 1,
-0.9836817, 0.8977623, -0.2231169, 1, 1, 1, 1, 1,
-0.9474308, 2.295003, -0.1814807, 1, 1, 1, 1, 1,
-0.944999, 1.114824, -1.860829, 1, 1, 1, 1, 1,
-0.9424216, -0.1516894, -2.256027, 1, 1, 1, 1, 1,
-0.9375891, -0.7076451, -1.248599, 1, 1, 1, 1, 1,
-0.9374694, -0.9722192, -1.555325, 1, 1, 1, 1, 1,
-0.9202131, -0.4052854, -3.929586, 1, 1, 1, 1, 1,
-0.9159067, -0.4190127, -0.4360728, 1, 1, 1, 1, 1,
-0.9073375, 0.9935641, -1.940335, 1, 1, 1, 1, 1,
-0.9020478, -2.029264, -3.471174, 1, 1, 1, 1, 1,
-0.8907068, -1.000115, -0.2922281, 1, 1, 1, 1, 1,
-0.8881896, 1.546765, 1.04273, 1, 1, 1, 1, 1,
-0.8865612, 1.220573, 0.1886103, 1, 1, 1, 1, 1,
-0.8858137, -1.136664, -3.754053, 1, 1, 1, 1, 1,
-0.8798632, 1.458028, -0.3548014, 0, 0, 1, 1, 1,
-0.8775492, 0.4271004, -0.02065646, 1, 0, 0, 1, 1,
-0.8747609, -0.6036786, -0.8251238, 1, 0, 0, 1, 1,
-0.874304, 3.001695, -0.8409228, 1, 0, 0, 1, 1,
-0.8712478, 1.938023, -0.1497985, 1, 0, 0, 1, 1,
-0.8687698, 0.7389625, -0.428192, 1, 0, 0, 1, 1,
-0.8648012, -0.6812544, -0.5167403, 0, 0, 0, 1, 1,
-0.8639269, -0.8577151, -0.8028925, 0, 0, 0, 1, 1,
-0.8627557, -0.7714399, -1.173179, 0, 0, 0, 1, 1,
-0.8581429, -1.072596, -3.484092, 0, 0, 0, 1, 1,
-0.8509053, -0.002391636, -1.960881, 0, 0, 0, 1, 1,
-0.8505793, 0.468587, -1.812595, 0, 0, 0, 1, 1,
-0.8478341, -0.0868514, -2.425367, 0, 0, 0, 1, 1,
-0.8458701, -1.110409, -2.363362, 1, 1, 1, 1, 1,
-0.8409327, 0.4760175, -1.337772, 1, 1, 1, 1, 1,
-0.8392445, 1.043738, 0.1503313, 1, 1, 1, 1, 1,
-0.8379481, 1.889544, 0.5188313, 1, 1, 1, 1, 1,
-0.8374579, -0.507731, -1.803586, 1, 1, 1, 1, 1,
-0.8296036, -0.07704394, -2.279005, 1, 1, 1, 1, 1,
-0.8231905, 0.6244888, -0.3755776, 1, 1, 1, 1, 1,
-0.8209345, -0.6230749, -2.527962, 1, 1, 1, 1, 1,
-0.8074961, 0.8292977, -2.371588, 1, 1, 1, 1, 1,
-0.8059598, 1.298684, 0.3086788, 1, 1, 1, 1, 1,
-0.7929503, -0.0204867, -2.489534, 1, 1, 1, 1, 1,
-0.7874847, -1.234121, -3.722045, 1, 1, 1, 1, 1,
-0.7864519, -0.1951367, -0.1143685, 1, 1, 1, 1, 1,
-0.7826647, 1.710103, -0.8472234, 1, 1, 1, 1, 1,
-0.7794491, 0.1927194, -0.4362547, 1, 1, 1, 1, 1,
-0.7637497, 0.7023839, -0.8662042, 0, 0, 1, 1, 1,
-0.7631678, 0.2239879, -1.499905, 1, 0, 0, 1, 1,
-0.7543149, -0.08399244, -1.364801, 1, 0, 0, 1, 1,
-0.7524264, 0.9134741, -0.6735348, 1, 0, 0, 1, 1,
-0.7434737, 0.414103, -2.183604, 1, 0, 0, 1, 1,
-0.743277, 1.261325, 0.8785994, 1, 0, 0, 1, 1,
-0.7429903, -0.3205779, -1.345751, 0, 0, 0, 1, 1,
-0.7410429, -0.9822739, -2.173893, 0, 0, 0, 1, 1,
-0.7241754, -0.2257997, -2.583081, 0, 0, 0, 1, 1,
-0.7219571, -1.508702, -1.367155, 0, 0, 0, 1, 1,
-0.7213322, -0.8609591, -2.482543, 0, 0, 0, 1, 1,
-0.7138609, -0.5495507, -1.949377, 0, 0, 0, 1, 1,
-0.7106812, 0.3852656, -3.815867, 0, 0, 0, 1, 1,
-0.7055075, 1.173064, -1.739384, 1, 1, 1, 1, 1,
-0.7052466, -0.6762542, -2.154589, 1, 1, 1, 1, 1,
-0.7046624, -0.2369086, -3.199785, 1, 1, 1, 1, 1,
-0.7008938, -0.4297352, -1.621928, 1, 1, 1, 1, 1,
-0.6948903, -0.339529, -1.99053, 1, 1, 1, 1, 1,
-0.6907214, -0.2960744, -1.344306, 1, 1, 1, 1, 1,
-0.6868467, 0.6591594, -1.954948, 1, 1, 1, 1, 1,
-0.6850783, 0.9667663, 0.989551, 1, 1, 1, 1, 1,
-0.6845864, 3.021906, -1.731235, 1, 1, 1, 1, 1,
-0.6838447, -0.6406051, -2.139642, 1, 1, 1, 1, 1,
-0.6773515, 0.9069732, -0.6537508, 1, 1, 1, 1, 1,
-0.6759594, -0.7053053, -1.895484, 1, 1, 1, 1, 1,
-0.6757786, 1.849451, 1.368773, 1, 1, 1, 1, 1,
-0.6737842, -0.3592903, -2.569239, 1, 1, 1, 1, 1,
-0.6659983, 0.3809342, -0.4520204, 1, 1, 1, 1, 1,
-0.6625969, -1.439199, -2.492635, 0, 0, 1, 1, 1,
-0.6611264, 0.9189301, -1.705237, 1, 0, 0, 1, 1,
-0.6576822, 1.673029, -0.4470143, 1, 0, 0, 1, 1,
-0.6558184, -1.883455, -3.212193, 1, 0, 0, 1, 1,
-0.6506617, -0.7220323, -0.189946, 1, 0, 0, 1, 1,
-0.6480829, 1.411879, -2.476125, 1, 0, 0, 1, 1,
-0.6446217, -0.8118877, -3.024472, 0, 0, 0, 1, 1,
-0.6410826, -0.2002915, -1.743933, 0, 0, 0, 1, 1,
-0.6397858, 0.2426715, -1.875046, 0, 0, 0, 1, 1,
-0.6362797, -1.043688, -3.62935, 0, 0, 0, 1, 1,
-0.6361616, 0.7265567, -1.362643, 0, 0, 0, 1, 1,
-0.6344802, 0.3691339, -1.152246, 0, 0, 0, 1, 1,
-0.6299579, 1.316505, -0.06199125, 0, 0, 0, 1, 1,
-0.6279063, -0.4276791, -3.169349, 1, 1, 1, 1, 1,
-0.6256433, -0.6200822, -3.558849, 1, 1, 1, 1, 1,
-0.6234627, 0.6704834, -0.263438, 1, 1, 1, 1, 1,
-0.6139405, -1.00667, -1.756668, 1, 1, 1, 1, 1,
-0.6138613, -0.6275749, -3.097031, 1, 1, 1, 1, 1,
-0.6127274, -0.02973286, -1.523256, 1, 1, 1, 1, 1,
-0.6109871, -0.5144501, -3.688604, 1, 1, 1, 1, 1,
-0.6076963, -0.4363666, -2.040641, 1, 1, 1, 1, 1,
-0.6071491, 0.263557, -1.411609, 1, 1, 1, 1, 1,
-0.6030329, 1.298972, 0.799839, 1, 1, 1, 1, 1,
-0.6018488, 0.4178967, -1.189074, 1, 1, 1, 1, 1,
-0.6017088, 0.5857113, -0.8299695, 1, 1, 1, 1, 1,
-0.6013557, -1.108753, -3.280881, 1, 1, 1, 1, 1,
-0.6002611, 0.2849162, -1.318831, 1, 1, 1, 1, 1,
-0.59525, 1.02723, -2.367526, 1, 1, 1, 1, 1,
-0.5918105, -2.083811, -3.0066, 0, 0, 1, 1, 1,
-0.5872422, 0.473991, -1.024954, 1, 0, 0, 1, 1,
-0.5811236, -0.3712781, -1.984949, 1, 0, 0, 1, 1,
-0.5746862, 0.660482, -1.334317, 1, 0, 0, 1, 1,
-0.5709181, -0.4953059, -2.450006, 1, 0, 0, 1, 1,
-0.5707994, 1.521288, 0.1931899, 1, 0, 0, 1, 1,
-0.5670117, -0.7341784, -2.971391, 0, 0, 0, 1, 1,
-0.5654883, 0.2761807, -1.883433, 0, 0, 0, 1, 1,
-0.5600304, 0.3690614, -0.04614034, 0, 0, 0, 1, 1,
-0.5463247, -0.8013238, -1.84902, 0, 0, 0, 1, 1,
-0.5434409, 0.01411866, -1.228848, 0, 0, 0, 1, 1,
-0.5245633, 0.4007478, -2.70481, 0, 0, 0, 1, 1,
-0.5235347, 1.861772, -0.8960263, 0, 0, 0, 1, 1,
-0.5174879, 2.020314, -0.008525728, 1, 1, 1, 1, 1,
-0.5171811, -0.5681404, -1.201447, 1, 1, 1, 1, 1,
-0.5121731, -1.980895, -2.917709, 1, 1, 1, 1, 1,
-0.5067641, -1.391098, -3.146326, 1, 1, 1, 1, 1,
-0.5038172, 0.7910554, -1.906552, 1, 1, 1, 1, 1,
-0.5030575, 1.73139, -0.355436, 1, 1, 1, 1, 1,
-0.5029151, -0.4971547, -0.8959856, 1, 1, 1, 1, 1,
-0.4974323, -0.3615274, -0.6841995, 1, 1, 1, 1, 1,
-0.4966071, -0.2524102, -2.205982, 1, 1, 1, 1, 1,
-0.4953736, 0.9635103, -1.36025, 1, 1, 1, 1, 1,
-0.4950623, -0.1781882, -2.683663, 1, 1, 1, 1, 1,
-0.4914357, 0.6486534, 1.916775, 1, 1, 1, 1, 1,
-0.4905184, 0.970079, 0.6323351, 1, 1, 1, 1, 1,
-0.4872551, -0.03974113, -1.422542, 1, 1, 1, 1, 1,
-0.4869143, -0.2700045, -3.417688, 1, 1, 1, 1, 1,
-0.4861532, 0.3178176, -1.280105, 0, 0, 1, 1, 1,
-0.4831687, -2.471135, -3.454849, 1, 0, 0, 1, 1,
-0.4810627, 0.6239131, 0.2260931, 1, 0, 0, 1, 1,
-0.4806322, -1.815089, -2.777867, 1, 0, 0, 1, 1,
-0.4789659, 1.975334, -1.066182, 1, 0, 0, 1, 1,
-0.4732741, -0.1915998, -0.05660647, 1, 0, 0, 1, 1,
-0.4619114, 0.404398, -1.655009, 0, 0, 0, 1, 1,
-0.4608195, -0.7178796, -3.354847, 0, 0, 0, 1, 1,
-0.4596061, 1.127142, -0.4967182, 0, 0, 0, 1, 1,
-0.4568195, -0.7014107, -2.897625, 0, 0, 0, 1, 1,
-0.4516224, -0.333, -2.520385, 0, 0, 0, 1, 1,
-0.4476967, 1.20818, -2.673601, 0, 0, 0, 1, 1,
-0.4445523, -0.6795828, -2.405078, 0, 0, 0, 1, 1,
-0.4443676, 0.1581482, -1.712045, 1, 1, 1, 1, 1,
-0.4431039, 0.02362148, -2.230199, 1, 1, 1, 1, 1,
-0.4398733, -0.4147973, -2.641701, 1, 1, 1, 1, 1,
-0.4397886, 0.7804884, 0.0785497, 1, 1, 1, 1, 1,
-0.4372911, -0.3743024, -1.87605, 1, 1, 1, 1, 1,
-0.4261868, -0.6649976, -3.255192, 1, 1, 1, 1, 1,
-0.4238792, -0.05276436, -1.965534, 1, 1, 1, 1, 1,
-0.4233144, -0.5209019, -3.316743, 1, 1, 1, 1, 1,
-0.4197003, -1.102138, -2.136402, 1, 1, 1, 1, 1,
-0.4158156, -0.8583563, -2.565961, 1, 1, 1, 1, 1,
-0.415051, -0.2614032, -1.834626, 1, 1, 1, 1, 1,
-0.4108954, 1.468776, -0.4197271, 1, 1, 1, 1, 1,
-0.4075335, 0.09216332, -1.124828, 1, 1, 1, 1, 1,
-0.406883, -0.3169063, -1.8868, 1, 1, 1, 1, 1,
-0.4062459, -0.01714929, -1.712199, 1, 1, 1, 1, 1,
-0.4019682, 1.025742, -1.11303, 0, 0, 1, 1, 1,
-0.3997423, -0.8837715, -2.754239, 1, 0, 0, 1, 1,
-0.3985261, -0.3799067, -4.360086, 1, 0, 0, 1, 1,
-0.3953665, -0.5871982, -1.813787, 1, 0, 0, 1, 1,
-0.395159, 0.8614601, -1.04389, 1, 0, 0, 1, 1,
-0.3946574, 1.263982, 1.631131, 1, 0, 0, 1, 1,
-0.3939574, -2.756451, -3.892208, 0, 0, 0, 1, 1,
-0.3923903, 0.8841032, -0.001895153, 0, 0, 0, 1, 1,
-0.389057, -0.6613089, -3.308539, 0, 0, 0, 1, 1,
-0.3881835, -0.8398964, -0.6653477, 0, 0, 0, 1, 1,
-0.3841839, 0.223124, -1.728021, 0, 0, 0, 1, 1,
-0.3809827, 0.3780983, -1.32132, 0, 0, 0, 1, 1,
-0.3782353, 1.505668, -1.886327, 0, 0, 0, 1, 1,
-0.3741924, 1.55939, 0.6717296, 1, 1, 1, 1, 1,
-0.3741466, -0.2517295, -0.2604764, 1, 1, 1, 1, 1,
-0.3732416, -0.9774199, -2.006954, 1, 1, 1, 1, 1,
-0.3657503, 0.2869283, -1.076724, 1, 1, 1, 1, 1,
-0.3632719, 1.074087, -0.2708417, 1, 1, 1, 1, 1,
-0.3609719, 2.613853, 0.2907243, 1, 1, 1, 1, 1,
-0.3582099, -1.135003, -3.90997, 1, 1, 1, 1, 1,
-0.348139, -0.8163469, -3.451786, 1, 1, 1, 1, 1,
-0.3475953, -0.3185592, -3.755463, 1, 1, 1, 1, 1,
-0.3472977, 1.30801, 0.8349425, 1, 1, 1, 1, 1,
-0.3448568, 0.2589537, -1.467279, 1, 1, 1, 1, 1,
-0.3438419, 0.7084815, 1.663095, 1, 1, 1, 1, 1,
-0.3402134, 1.613844, -1.019934, 1, 1, 1, 1, 1,
-0.3367703, 0.4099816, -0.569213, 1, 1, 1, 1, 1,
-0.3321791, 0.09711906, -1.86439, 1, 1, 1, 1, 1,
-0.3320557, -0.02631273, -0.1995507, 0, 0, 1, 1, 1,
-0.3280036, 0.5064216, 0.1197031, 1, 0, 0, 1, 1,
-0.3276523, -2.398907, -3.574796, 1, 0, 0, 1, 1,
-0.3274475, -1.020879, -3.488014, 1, 0, 0, 1, 1,
-0.3257174, 0.4818869, 0.4897998, 1, 0, 0, 1, 1,
-0.3230151, -1.358509, -1.745092, 1, 0, 0, 1, 1,
-0.3229805, 0.5101102, -0.5055628, 0, 0, 0, 1, 1,
-0.3150197, -0.094166, -2.813776, 0, 0, 0, 1, 1,
-0.3123263, -2.070179, -3.511681, 0, 0, 0, 1, 1,
-0.3095096, 1.089921, -0.684076, 0, 0, 0, 1, 1,
-0.3056732, -1.846911, -3.631834, 0, 0, 0, 1, 1,
-0.3017733, -0.2746232, -1.085661, 0, 0, 0, 1, 1,
-0.2905128, 0.8189014, -0.6575971, 0, 0, 0, 1, 1,
-0.2891342, 0.3947445, -1.007401, 1, 1, 1, 1, 1,
-0.2860463, 0.6856111, 0.3036543, 1, 1, 1, 1, 1,
-0.2839578, -1.239483, -3.632296, 1, 1, 1, 1, 1,
-0.2793554, -1.457266, -1.188953, 1, 1, 1, 1, 1,
-0.2787598, 2.554765, -1.029672, 1, 1, 1, 1, 1,
-0.2778207, 0.2481424, 0.495006, 1, 1, 1, 1, 1,
-0.2738411, -0.3722933, -1.48134, 1, 1, 1, 1, 1,
-0.2715053, 0.7787539, 1.287733, 1, 1, 1, 1, 1,
-0.2708423, -0.8229005, -4.44666, 1, 1, 1, 1, 1,
-0.2684431, -0.1198939, -3.915371, 1, 1, 1, 1, 1,
-0.2676217, -1.800964, -3.049983, 1, 1, 1, 1, 1,
-0.259741, 0.3230979, -3.18658, 1, 1, 1, 1, 1,
-0.2596285, 0.8282592, -2.731331, 1, 1, 1, 1, 1,
-0.2594834, 1.377148, -1.461892, 1, 1, 1, 1, 1,
-0.2580423, -0.8313136, -2.883828, 1, 1, 1, 1, 1,
-0.2580062, 2.085822, -2.392896, 0, 0, 1, 1, 1,
-0.2558454, -1.085562, -2.563534, 1, 0, 0, 1, 1,
-0.2548397, -0.3928871, -2.372974, 1, 0, 0, 1, 1,
-0.2537174, -0.3899703, -2.115564, 1, 0, 0, 1, 1,
-0.2532059, -1.132305, -1.231845, 1, 0, 0, 1, 1,
-0.2518153, -0.8010129, -2.713408, 1, 0, 0, 1, 1,
-0.2485643, 0.6036544, 0.4223259, 0, 0, 0, 1, 1,
-0.2434477, 2.305339, -0.3739104, 0, 0, 0, 1, 1,
-0.2417732, 0.8710554, 0.8210298, 0, 0, 0, 1, 1,
-0.2404539, 2.198985, 0.0497707, 0, 0, 0, 1, 1,
-0.2316124, -0.09435551, -1.521739, 0, 0, 0, 1, 1,
-0.2274148, -1.298711, -3.704907, 0, 0, 0, 1, 1,
-0.2262076, 0.2011035, -1.423864, 0, 0, 0, 1, 1,
-0.2260001, -1.265043, -3.659886, 1, 1, 1, 1, 1,
-0.2226255, -0.4004097, -2.428588, 1, 1, 1, 1, 1,
-0.2189754, 0.7038349, -0.515406, 1, 1, 1, 1, 1,
-0.2185308, 1.377594, -1.268319, 1, 1, 1, 1, 1,
-0.2178254, 0.3226456, 0.01352319, 1, 1, 1, 1, 1,
-0.2175953, -0.1531575, -1.355652, 1, 1, 1, 1, 1,
-0.2173297, -0.3952072, -2.444705, 1, 1, 1, 1, 1,
-0.215138, -0.3651369, -2.607727, 1, 1, 1, 1, 1,
-0.2147543, -1.760145, -3.182237, 1, 1, 1, 1, 1,
-0.212883, 1.973085, 0.9278266, 1, 1, 1, 1, 1,
-0.2124063, -0.8796199, -3.961432, 1, 1, 1, 1, 1,
-0.2054401, 0.3718855, 0.177875, 1, 1, 1, 1, 1,
-0.2032943, 0.8711599, -0.9769186, 1, 1, 1, 1, 1,
-0.2004992, 0.462524, -0.8423165, 1, 1, 1, 1, 1,
-0.1998397, 0.1897628, -1.051578, 1, 1, 1, 1, 1,
-0.1995325, 0.7949789, -0.2158934, 0, 0, 1, 1, 1,
-0.1961931, 0.1901962, -2.333073, 1, 0, 0, 1, 1,
-0.1957137, 1.902166, -0.7787272, 1, 0, 0, 1, 1,
-0.1949964, -0.7553359, -4.76434, 1, 0, 0, 1, 1,
-0.1939533, -0.7050306, -4.434161, 1, 0, 0, 1, 1,
-0.1927197, -0.4441549, -5.114061, 1, 0, 0, 1, 1,
-0.1886402, 1.456557, 0.1914439, 0, 0, 0, 1, 1,
-0.1856274, -0.09045357, -1.388148, 0, 0, 0, 1, 1,
-0.1834334, 0.6949446, 0.4818605, 0, 0, 0, 1, 1,
-0.1824501, -1.468872, -4.579519, 0, 0, 0, 1, 1,
-0.1815667, -0.4182549, -1.458435, 0, 0, 0, 1, 1,
-0.1809323, 3.179308, 0.5814782, 0, 0, 0, 1, 1,
-0.1806116, -0.1322373, -0.816581, 0, 0, 0, 1, 1,
-0.1781987, -1.358715, -2.067285, 1, 1, 1, 1, 1,
-0.1768997, 0.4680733, 0.3935675, 1, 1, 1, 1, 1,
-0.1747603, 0.7856095, 0.1123587, 1, 1, 1, 1, 1,
-0.1742715, -0.4872982, -2.393647, 1, 1, 1, 1, 1,
-0.1714573, 0.8287057, -0.2276297, 1, 1, 1, 1, 1,
-0.1686539, -1.289621, -4.660408, 1, 1, 1, 1, 1,
-0.1672594, -0.06721435, -0.4003565, 1, 1, 1, 1, 1,
-0.1641603, 0.644246, -0.09524567, 1, 1, 1, 1, 1,
-0.161226, 1.095202, -2.287181, 1, 1, 1, 1, 1,
-0.1571169, -2.593296, -2.796288, 1, 1, 1, 1, 1,
-0.1517847, 0.1196515, -0.815122, 1, 1, 1, 1, 1,
-0.1504997, 0.291198, -2.145317, 1, 1, 1, 1, 1,
-0.1487087, 1.007865, -1.195011, 1, 1, 1, 1, 1,
-0.14699, 0.7948122, 0.1460422, 1, 1, 1, 1, 1,
-0.1405067, 0.7101155, 0.856688, 1, 1, 1, 1, 1,
-0.1404995, 1.056075, 0.4709556, 0, 0, 1, 1, 1,
-0.1373416, -1.044695, -2.700037, 1, 0, 0, 1, 1,
-0.1332101, -1.140461, -3.636725, 1, 0, 0, 1, 1,
-0.1271939, 0.2735426, -0.1715471, 1, 0, 0, 1, 1,
-0.1249345, -0.05607635, -1.886291, 1, 0, 0, 1, 1,
-0.1233501, -0.7622605, -2.711452, 1, 0, 0, 1, 1,
-0.1211721, 0.5050924, -0.5801638, 0, 0, 0, 1, 1,
-0.1170511, -0.2216727, -2.382908, 0, 0, 0, 1, 1,
-0.1164925, 1.431848, 0.02069774, 0, 0, 0, 1, 1,
-0.1102696, -0.7585903, -2.939989, 0, 0, 0, 1, 1,
-0.1056853, -0.4284499, -2.403429, 0, 0, 0, 1, 1,
-0.1056197, -1.855468, -0.7303651, 0, 0, 0, 1, 1,
-0.1029388, -0.5722831, -2.519067, 0, 0, 0, 1, 1,
-0.1020885, 1.09242, 1.176156, 1, 1, 1, 1, 1,
-0.1015704, 0.9734544, -1.647514, 1, 1, 1, 1, 1,
-0.09708703, 0.2286337, -0.3843726, 1, 1, 1, 1, 1,
-0.09290178, 0.07794897, -1.916497, 1, 1, 1, 1, 1,
-0.08919872, -0.01667242, -0.01668906, 1, 1, 1, 1, 1,
-0.08767705, -0.5775302, -2.97041, 1, 1, 1, 1, 1,
-0.08754978, -0.5778173, -3.926727, 1, 1, 1, 1, 1,
-0.08265892, -1.272536, -2.98093, 1, 1, 1, 1, 1,
-0.08222386, -0.220664, -3.42401, 1, 1, 1, 1, 1,
-0.08158328, -0.7768034, -2.4088, 1, 1, 1, 1, 1,
-0.07920271, -0.512502, -1.61013, 1, 1, 1, 1, 1,
-0.07744057, -1.26239, -2.624991, 1, 1, 1, 1, 1,
-0.07633533, -1.043047, -2.936368, 1, 1, 1, 1, 1,
-0.07581346, -0.5321386, -3.739987, 1, 1, 1, 1, 1,
-0.07015674, -0.7354985, -2.813041, 1, 1, 1, 1, 1,
-0.06699922, -1.589582, -2.494124, 0, 0, 1, 1, 1,
-0.06150673, -0.6223266, -2.588426, 1, 0, 0, 1, 1,
-0.05919312, 1.811981, 1.427689, 1, 0, 0, 1, 1,
-0.05415328, -1.495362, -2.974428, 1, 0, 0, 1, 1,
-0.05219736, -0.7822449, -4.042617, 1, 0, 0, 1, 1,
-0.05038849, 0.1055778, 0.1270704, 1, 0, 0, 1, 1,
-0.05008544, 0.487824, 0.8166973, 0, 0, 0, 1, 1,
-0.04756844, -0.6980159, -2.948022, 0, 0, 0, 1, 1,
-0.04463806, 0.625955, 0.4633196, 0, 0, 0, 1, 1,
-0.04434079, 0.8459024, -0.6222935, 0, 0, 0, 1, 1,
-0.04278095, 0.5046983, 0.4243105, 0, 0, 0, 1, 1,
-0.04228039, 0.3736045, 0.4821272, 0, 0, 0, 1, 1,
-0.03973105, 0.9268329, -0.4835826, 0, 0, 0, 1, 1,
-0.03549366, -0.7411834, -2.083662, 1, 1, 1, 1, 1,
-0.03486306, -0.4249749, -2.593182, 1, 1, 1, 1, 1,
-0.03120666, 0.07108033, 0.5125366, 1, 1, 1, 1, 1,
-0.02718493, -1.238913, -4.392886, 1, 1, 1, 1, 1,
-0.02493326, 0.3686606, -0.5217676, 1, 1, 1, 1, 1,
-0.02355414, 0.3668732, 0.1186011, 1, 1, 1, 1, 1,
-0.02125626, -0.5119603, -5.409698, 1, 1, 1, 1, 1,
-0.01820628, -0.1456968, -1.215606, 1, 1, 1, 1, 1,
-0.01589447, 0.4016001, 2.006074, 1, 1, 1, 1, 1,
-0.01533419, -0.5539343, -2.859925, 1, 1, 1, 1, 1,
-0.01269208, -0.4416299, -3.263529, 1, 1, 1, 1, 1,
-0.012105, 0.4658548, 1.128965, 1, 1, 1, 1, 1,
-0.009094677, 1.337139, -0.3595811, 1, 1, 1, 1, 1,
-0.0008899447, -0.6921281, -3.259916, 1, 1, 1, 1, 1,
-0.0006847317, 0.5086231, 0.3758593, 1, 1, 1, 1, 1,
0.0002041739, -0.7253233, 4.728566, 0, 0, 1, 1, 1,
0.005288731, -0.2624791, 2.867028, 1, 0, 0, 1, 1,
0.005503089, 0.9476172, -0.9326465, 1, 0, 0, 1, 1,
0.006588202, 0.07923837, 0.04532697, 1, 0, 0, 1, 1,
0.007185615, 0.3240872, 1.721237, 1, 0, 0, 1, 1,
0.008534363, 0.02701786, 2.455939, 1, 0, 0, 1, 1,
0.01001937, 0.9525943, 0.405641, 0, 0, 0, 1, 1,
0.01541738, 0.4166975, 0.4294291, 0, 0, 0, 1, 1,
0.01806622, 0.6692052, 1.05956, 0, 0, 0, 1, 1,
0.01993014, -0.758698, 3.31661, 0, 0, 0, 1, 1,
0.02392901, -0.1345198, 2.732531, 0, 0, 0, 1, 1,
0.03612469, 0.7640184, -0.6399364, 0, 0, 0, 1, 1,
0.03756526, 0.6275008, 0.1298268, 0, 0, 0, 1, 1,
0.03832305, -1.04221, 2.286393, 1, 1, 1, 1, 1,
0.03920332, 0.8610787, 0.9416655, 1, 1, 1, 1, 1,
0.04030445, -1.545972, 2.167892, 1, 1, 1, 1, 1,
0.04314879, 0.8966699, 0.6457552, 1, 1, 1, 1, 1,
0.04522912, 0.1152192, 2.576012, 1, 1, 1, 1, 1,
0.04798457, -1.568167, 3.422414, 1, 1, 1, 1, 1,
0.04809216, 2.298407, 1.91673, 1, 1, 1, 1, 1,
0.04902256, 1.775623, -2.700091, 1, 1, 1, 1, 1,
0.0494307, -0.9375284, 3.120581, 1, 1, 1, 1, 1,
0.05364818, 0.5300364, -0.03006957, 1, 1, 1, 1, 1,
0.05407248, -1.236216, 3.176984, 1, 1, 1, 1, 1,
0.05463145, -0.7879434, 1.914974, 1, 1, 1, 1, 1,
0.05484379, -0.1169294, 2.542573, 1, 1, 1, 1, 1,
0.05835764, -1.210825, 3.025677, 1, 1, 1, 1, 1,
0.05932949, -0.73417, 4.064792, 1, 1, 1, 1, 1,
0.05960513, -1.861754, 3.844992, 0, 0, 1, 1, 1,
0.0652812, 0.7644847, -0.9088573, 1, 0, 0, 1, 1,
0.06834326, 0.7950048, 0.08692917, 1, 0, 0, 1, 1,
0.07201678, -0.06532677, 3.421411, 1, 0, 0, 1, 1,
0.07305165, 0.1827603, 0.9312334, 1, 0, 0, 1, 1,
0.07558104, -0.5578572, 3.778374, 1, 0, 0, 1, 1,
0.08415187, -1.043369, 3.60532, 0, 0, 0, 1, 1,
0.08790137, 0.9680446, -0.1867638, 0, 0, 0, 1, 1,
0.08884555, 0.4629492, 1.135185, 0, 0, 0, 1, 1,
0.09051555, 0.8037273, -0.8190585, 0, 0, 0, 1, 1,
0.09132744, 0.07981729, 1.011362, 0, 0, 0, 1, 1,
0.1011085, -0.09664377, 1.303695, 0, 0, 0, 1, 1,
0.1064758, -1.464117, 3.757662, 0, 0, 0, 1, 1,
0.1068336, -0.02906597, 2.340832, 1, 1, 1, 1, 1,
0.1083553, -0.6276513, 3.48207, 1, 1, 1, 1, 1,
0.1094834, -1.297814, 4.374538, 1, 1, 1, 1, 1,
0.1115608, 0.9911781, -1.121265, 1, 1, 1, 1, 1,
0.1160684, 1.27501, 1.688684, 1, 1, 1, 1, 1,
0.118256, -0.09263802, 3.614846, 1, 1, 1, 1, 1,
0.1217915, 0.147433, 0.8102407, 1, 1, 1, 1, 1,
0.1225431, -0.8398377, 3.744, 1, 1, 1, 1, 1,
0.1256714, -0.2373124, 1.961898, 1, 1, 1, 1, 1,
0.1260384, -0.918695, 2.74736, 1, 1, 1, 1, 1,
0.1302989, 0.6169575, 2.066084, 1, 1, 1, 1, 1,
0.1320676, -1.044157, 2.467041, 1, 1, 1, 1, 1,
0.1339928, 0.6529005, 0.2758223, 1, 1, 1, 1, 1,
0.1340731, -0.70644, 2.117317, 1, 1, 1, 1, 1,
0.1375296, 1.316731, 0.3928809, 1, 1, 1, 1, 1,
0.1449448, -0.3980297, 3.621037, 0, 0, 1, 1, 1,
0.1474749, 0.9812895, 0.6341602, 1, 0, 0, 1, 1,
0.1506851, 0.7550051, 0.6890621, 1, 0, 0, 1, 1,
0.151203, -0.09326413, 2.569834, 1, 0, 0, 1, 1,
0.153553, 1.068915, -0.6670555, 1, 0, 0, 1, 1,
0.1564822, 0.3653071, -0.5661956, 1, 0, 0, 1, 1,
0.1590172, -0.3825261, 1.407625, 0, 0, 0, 1, 1,
0.1604594, 0.4402309, 1.797029, 0, 0, 0, 1, 1,
0.1615047, -2.348766, 1.959443, 0, 0, 0, 1, 1,
0.1663826, 0.2715905, 1.504152, 0, 0, 0, 1, 1,
0.1670016, 0.1209819, -0.4736827, 0, 0, 0, 1, 1,
0.1685137, 0.7553838, 0.008753362, 0, 0, 0, 1, 1,
0.1722647, 0.8333695, 1.65666, 0, 0, 0, 1, 1,
0.1727135, 1.070568, -0.1228623, 1, 1, 1, 1, 1,
0.174081, 0.9150236, 1.819703, 1, 1, 1, 1, 1,
0.1755846, 0.5362758, 2.23086, 1, 1, 1, 1, 1,
0.1762567, 0.4939858, 1.363575, 1, 1, 1, 1, 1,
0.1778604, -0.1117878, 2.917468, 1, 1, 1, 1, 1,
0.1861653, 0.2753895, 1.75697, 1, 1, 1, 1, 1,
0.1926288, 1.478735, -0.3793768, 1, 1, 1, 1, 1,
0.196699, -1.13245, 3.096003, 1, 1, 1, 1, 1,
0.1969768, -0.7965993, 2.26964, 1, 1, 1, 1, 1,
0.1979056, 0.08221839, 2.29478, 1, 1, 1, 1, 1,
0.2019465, 1.073775, 1.481053, 1, 1, 1, 1, 1,
0.2147917, -1.391085, 4.007968, 1, 1, 1, 1, 1,
0.2172191, 0.2301684, 0.1564151, 1, 1, 1, 1, 1,
0.2184175, -1.179988, 2.495984, 1, 1, 1, 1, 1,
0.2186654, -1.168878, 1.917849, 1, 1, 1, 1, 1,
0.2235983, 0.4578981, -0.06416833, 0, 0, 1, 1, 1,
0.231858, 1.529588, 0.9179409, 1, 0, 0, 1, 1,
0.2328838, -0.3562074, 2.663452, 1, 0, 0, 1, 1,
0.2347506, -0.2521919, 2.118428, 1, 0, 0, 1, 1,
0.2385038, 0.9402672, -0.8664994, 1, 0, 0, 1, 1,
0.2393087, 0.06238932, 0.5178919, 1, 0, 0, 1, 1,
0.2442765, 0.9563653, 0.7080805, 0, 0, 0, 1, 1,
0.2468131, 0.3695094, -0.1967597, 0, 0, 0, 1, 1,
0.2478441, 1.237365, 2.136818, 0, 0, 0, 1, 1,
0.2488718, 0.7853609, 0.1769316, 0, 0, 0, 1, 1,
0.2502267, -0.5353044, 4.491225, 0, 0, 0, 1, 1,
0.2515835, 0.4191277, 1.118208, 0, 0, 0, 1, 1,
0.2534077, 0.4018187, 1.253247, 0, 0, 0, 1, 1,
0.2534453, 0.7525311, -0.9341546, 1, 1, 1, 1, 1,
0.255643, -0.5296301, 2.623657, 1, 1, 1, 1, 1,
0.2559475, 0.816345, 2.127676, 1, 1, 1, 1, 1,
0.2560835, -0.7369873, 3.446629, 1, 1, 1, 1, 1,
0.2609769, -0.6647325, 2.411363, 1, 1, 1, 1, 1,
0.2641545, 0.09257996, 1.534702, 1, 1, 1, 1, 1,
0.2664649, -0.6574885, 1.939758, 1, 1, 1, 1, 1,
0.268156, -0.02929767, 2.354936, 1, 1, 1, 1, 1,
0.2691807, -1.358971, 1.405617, 1, 1, 1, 1, 1,
0.270076, -1.037321, 3.279209, 1, 1, 1, 1, 1,
0.2705103, 0.4743728, -0.5057102, 1, 1, 1, 1, 1,
0.2718151, 0.9273701, 2.012013, 1, 1, 1, 1, 1,
0.2754317, -1.130342, 3.830394, 1, 1, 1, 1, 1,
0.2760237, -1.221642, 4.979495, 1, 1, 1, 1, 1,
0.2762849, -0.07274213, 2.468777, 1, 1, 1, 1, 1,
0.2777366, 1.062388, 0.4556034, 0, 0, 1, 1, 1,
0.2779134, -1.282928, 3.720509, 1, 0, 0, 1, 1,
0.2791287, -2.582495, 2.884046, 1, 0, 0, 1, 1,
0.2796966, -0.3788819, 3.031488, 1, 0, 0, 1, 1,
0.2827044, -1.620266, 4.464139, 1, 0, 0, 1, 1,
0.2852355, -1.015625, 2.097221, 1, 0, 0, 1, 1,
0.2903291, 1.488268, -0.8859584, 0, 0, 0, 1, 1,
0.2905586, -2.045268, 2.033066, 0, 0, 0, 1, 1,
0.2915819, 0.2210474, 0.008608615, 0, 0, 0, 1, 1,
0.2963259, 0.1465657, 0.4909143, 0, 0, 0, 1, 1,
0.310178, 0.3820512, 2.640206, 0, 0, 0, 1, 1,
0.3108497, -1.546271, 3.727417, 0, 0, 0, 1, 1,
0.313522, -2.206286, 1.93941, 0, 0, 0, 1, 1,
0.3141575, -1.126354, 3.405256, 1, 1, 1, 1, 1,
0.3147776, 0.6399971, 1.698705, 1, 1, 1, 1, 1,
0.3162015, -0.754599, 3.936064, 1, 1, 1, 1, 1,
0.3175952, 1.242309, 0.06896096, 1, 1, 1, 1, 1,
0.3192496, 0.1991497, 0.2014241, 1, 1, 1, 1, 1,
0.3205654, -0.7219281, 3.386347, 1, 1, 1, 1, 1,
0.3218171, 1.074555, -1.005125, 1, 1, 1, 1, 1,
0.3227911, -1.531504, 2.73218, 1, 1, 1, 1, 1,
0.3254286, -0.2514581, 4.732851, 1, 1, 1, 1, 1,
0.3260196, 0.06636558, 2.765177, 1, 1, 1, 1, 1,
0.3274447, -0.4744794, 3.902801, 1, 1, 1, 1, 1,
0.328357, -0.9436779, 2.956226, 1, 1, 1, 1, 1,
0.3333437, -0.2694201, 3.573696, 1, 1, 1, 1, 1,
0.3367524, -0.1541138, 1.665492, 1, 1, 1, 1, 1,
0.3372479, -0.0677001, 2.842069, 1, 1, 1, 1, 1,
0.3403826, -1.385154, 4.520831, 0, 0, 1, 1, 1,
0.3476888, -2.256417, 2.967604, 1, 0, 0, 1, 1,
0.348457, 0.2513717, 1.084083, 1, 0, 0, 1, 1,
0.3485598, -1.339848, 4.27906, 1, 0, 0, 1, 1,
0.3495423, 1.989956, -0.5862705, 1, 0, 0, 1, 1,
0.3537819, 0.4150939, 2.131634, 1, 0, 0, 1, 1,
0.3666719, 0.2652425, 2.161086, 0, 0, 0, 1, 1,
0.3707844, 0.2013936, 0.8137566, 0, 0, 0, 1, 1,
0.3773477, -0.1595767, 2.912504, 0, 0, 0, 1, 1,
0.3785461, -1.312227, 2.538066, 0, 0, 0, 1, 1,
0.3893358, 0.5948696, 1.274117, 0, 0, 0, 1, 1,
0.3897175, -0.7945667, 2.494289, 0, 0, 0, 1, 1,
0.3905941, 1.485461, 1.26461, 0, 0, 0, 1, 1,
0.3907387, -1.168266, 3.726377, 1, 1, 1, 1, 1,
0.3978379, -1.039789, 2.935585, 1, 1, 1, 1, 1,
0.4000774, 0.1297033, 2.400893, 1, 1, 1, 1, 1,
0.4042534, 0.404019, 2.192147, 1, 1, 1, 1, 1,
0.4063597, -0.02764858, 2.173447, 1, 1, 1, 1, 1,
0.4067962, -2.029861, 4.734384, 1, 1, 1, 1, 1,
0.4083622, 0.980101, 1.16539, 1, 1, 1, 1, 1,
0.4132288, 1.177632, 0.8330411, 1, 1, 1, 1, 1,
0.4154755, 1.135291, -0.4048907, 1, 1, 1, 1, 1,
0.4170713, 0.0935313, 1.529459, 1, 1, 1, 1, 1,
0.4177763, -0.949816, 2.971779, 1, 1, 1, 1, 1,
0.4185483, 0.1702553, 0.5267288, 1, 1, 1, 1, 1,
0.4204417, -0.5866005, 0.6426329, 1, 1, 1, 1, 1,
0.4230987, 1.171641, -0.399711, 1, 1, 1, 1, 1,
0.4235227, 0.9430677, 1.622389, 1, 1, 1, 1, 1,
0.423579, 0.458957, -0.0584716, 0, 0, 1, 1, 1,
0.4255001, 1.783079, 0.2929129, 1, 0, 0, 1, 1,
0.4280385, 0.8534124, -0.0308671, 1, 0, 0, 1, 1,
0.4354814, 0.9010106, -0.5682126, 1, 0, 0, 1, 1,
0.4362674, 0.9151277, 1.480055, 1, 0, 0, 1, 1,
0.4442205, 0.7128148, 0.9381546, 1, 0, 0, 1, 1,
0.4485326, 1.062247, 0.7531015, 0, 0, 0, 1, 1,
0.4568464, 0.06641904, 1.303163, 0, 0, 0, 1, 1,
0.4573649, 1.128227, -1.557192, 0, 0, 0, 1, 1,
0.4620383, -0.09609327, 1.245713, 0, 0, 0, 1, 1,
0.4624656, -0.2640152, 2.274243, 0, 0, 0, 1, 1,
0.4655922, -0.576314, 1.613163, 0, 0, 0, 1, 1,
0.4665284, -0.4661564, 2.528277, 0, 0, 0, 1, 1,
0.4676085, 0.2608368, -0.4999378, 1, 1, 1, 1, 1,
0.4757236, 0.0556339, 1.727417, 1, 1, 1, 1, 1,
0.4774135, -1.591334, 1.930641, 1, 1, 1, 1, 1,
0.4790747, 1.057347, -0.8844979, 1, 1, 1, 1, 1,
0.4811246, 0.3828951, 0.0844077, 1, 1, 1, 1, 1,
0.487881, -1.110669, 2.78947, 1, 1, 1, 1, 1,
0.4892439, 0.4237337, 0.1858268, 1, 1, 1, 1, 1,
0.4902489, -0.4599505, 2.251885, 1, 1, 1, 1, 1,
0.4912038, 0.8937807, 1.798675, 1, 1, 1, 1, 1,
0.4943646, -0.1569402, 1.23992, 1, 1, 1, 1, 1,
0.4965715, 0.5318264, 1.518871, 1, 1, 1, 1, 1,
0.4971164, -0.2780362, 1.665652, 1, 1, 1, 1, 1,
0.5002106, -0.5590563, 1.880051, 1, 1, 1, 1, 1,
0.5004461, -2.062679, 2.750163, 1, 1, 1, 1, 1,
0.5055404, -0.2665444, 1.146358, 1, 1, 1, 1, 1,
0.5075265, -0.8776355, 1.376365, 0, 0, 1, 1, 1,
0.5112659, 1.05512, -0.9052615, 1, 0, 0, 1, 1,
0.5150733, -1.267279, 4.400521, 1, 0, 0, 1, 1,
0.5157319, -0.88389, 2.03873, 1, 0, 0, 1, 1,
0.5173042, 0.401399, 1.018195, 1, 0, 0, 1, 1,
0.5253613, -1.263627, 4.175889, 1, 0, 0, 1, 1,
0.5258595, 0.8549902, -0.196509, 0, 0, 0, 1, 1,
0.5268849, -1.330145, 2.562485, 0, 0, 0, 1, 1,
0.5281444, -0.8940379, 2.636432, 0, 0, 0, 1, 1,
0.531761, 0.6239214, 0.9138648, 0, 0, 0, 1, 1,
0.5386088, -0.1677847, 2.160943, 0, 0, 0, 1, 1,
0.5396941, 0.3256973, -0.02376091, 0, 0, 0, 1, 1,
0.5416132, 1.576864, -0.1271739, 0, 0, 0, 1, 1,
0.547274, 0.1173105, 1.844507, 1, 1, 1, 1, 1,
0.548876, 0.389382, 1.061216, 1, 1, 1, 1, 1,
0.5523316, 0.9338784, 0.4479436, 1, 1, 1, 1, 1,
0.5540121, 0.4437606, 0.9456658, 1, 1, 1, 1, 1,
0.5633388, 1.386416, 1.076926, 1, 1, 1, 1, 1,
0.5726556, 0.2491256, 2.793532, 1, 1, 1, 1, 1,
0.5727175, -0.6737575, 1.627051, 1, 1, 1, 1, 1,
0.5754172, 0.02650211, 0.6686851, 1, 1, 1, 1, 1,
0.5761182, 0.5931756, 0.4413443, 1, 1, 1, 1, 1,
0.5768294, 0.3418429, 2.107859, 1, 1, 1, 1, 1,
0.5835024, -1.743281, 4.396015, 1, 1, 1, 1, 1,
0.5934926, 0.615571, 1.977164, 1, 1, 1, 1, 1,
0.593895, -1.208977, 2.169517, 1, 1, 1, 1, 1,
0.5973374, -0.3021744, 2.275026, 1, 1, 1, 1, 1,
0.5973527, 0.1604068, 2.186109, 1, 1, 1, 1, 1,
0.5999184, -0.9800431, 1.040457, 0, 0, 1, 1, 1,
0.6116749, 0.9452876, -0.01539678, 1, 0, 0, 1, 1,
0.6167001, -0.03281657, 1.22553, 1, 0, 0, 1, 1,
0.6181174, -1.879548, 4.19591, 1, 0, 0, 1, 1,
0.6193231, -0.6845876, 3.712374, 1, 0, 0, 1, 1,
0.6280573, -0.4352404, 1.766889, 1, 0, 0, 1, 1,
0.6291444, -0.131447, 1.84073, 0, 0, 0, 1, 1,
0.6297302, -0.2024346, 3.360457, 0, 0, 0, 1, 1,
0.6305461, -1.727156, 1.331044, 0, 0, 0, 1, 1,
0.6348896, 0.4070402, -0.3525414, 0, 0, 0, 1, 1,
0.6352106, 0.00679202, 1.072385, 0, 0, 0, 1, 1,
0.6353081, 2.248241, -0.2663334, 0, 0, 0, 1, 1,
0.6440024, -0.9540635, 3.311079, 0, 0, 0, 1, 1,
0.6453659, -0.1598475, 1.661317, 1, 1, 1, 1, 1,
0.6501446, 0.8311654, 0.839091, 1, 1, 1, 1, 1,
0.6507748, -1.052298, 3.922239, 1, 1, 1, 1, 1,
0.6510303, 0.1209343, 1.947775, 1, 1, 1, 1, 1,
0.6573486, -1.027404, 3.948724, 1, 1, 1, 1, 1,
0.6585323, -1.001398, 1.797364, 1, 1, 1, 1, 1,
0.6615276, 0.3429547, 3.033064, 1, 1, 1, 1, 1,
0.6656366, -0.08047163, 1.481686, 1, 1, 1, 1, 1,
0.6711642, 0.6019827, 0.9211665, 1, 1, 1, 1, 1,
0.671333, -0.1633314, 2.893706, 1, 1, 1, 1, 1,
0.6724998, -1.462804, 2.590697, 1, 1, 1, 1, 1,
0.6730711, 0.6037174, 0.243043, 1, 1, 1, 1, 1,
0.6768409, 0.4217124, 0.4400102, 1, 1, 1, 1, 1,
0.6796548, -1.317343, 2.759684, 1, 1, 1, 1, 1,
0.6845478, -0.9305876, 1.812832, 1, 1, 1, 1, 1,
0.6850101, -1.303376, 2.123803, 0, 0, 1, 1, 1,
0.6859125, -0.4766754, 3.076898, 1, 0, 0, 1, 1,
0.6968908, 0.6977875, -0.0742643, 1, 0, 0, 1, 1,
0.6991273, 0.4578144, 2.543618, 1, 0, 0, 1, 1,
0.7027805, -0.0429321, 1.515506, 1, 0, 0, 1, 1,
0.7042262, -0.09848561, 1.344949, 1, 0, 0, 1, 1,
0.7050516, 0.01109457, 1.254829, 0, 0, 0, 1, 1,
0.7066259, -0.3895979, 2.899242, 0, 0, 0, 1, 1,
0.7073414, -0.2499883, 3.071315, 0, 0, 0, 1, 1,
0.7078071, 0.03141684, 0.3794062, 0, 0, 0, 1, 1,
0.7094053, -0.1163387, 1.728666, 0, 0, 0, 1, 1,
0.709554, 0.7991456, 1.402183, 0, 0, 0, 1, 1,
0.714272, -0.7510329, 1.013394, 0, 0, 0, 1, 1,
0.7225812, -1.384716, 2.721821, 1, 1, 1, 1, 1,
0.7313837, -1.443077, 2.111302, 1, 1, 1, 1, 1,
0.7335926, 0.1125347, 0.9366461, 1, 1, 1, 1, 1,
0.7408178, -0.4113525, 0.8441215, 1, 1, 1, 1, 1,
0.7448487, -0.6614671, 1.448563, 1, 1, 1, 1, 1,
0.7466784, 1.04204, 0.06543685, 1, 1, 1, 1, 1,
0.747097, 1.430923, 0.2324457, 1, 1, 1, 1, 1,
0.7472264, -1.463176, 2.560266, 1, 1, 1, 1, 1,
0.7481576, -1.580832, 1.357418, 1, 1, 1, 1, 1,
0.7500142, -0.2388781, 1.426157, 1, 1, 1, 1, 1,
0.7529637, 0.3056228, 3.291565, 1, 1, 1, 1, 1,
0.7538507, 1.80336, 0.9710153, 1, 1, 1, 1, 1,
0.753957, -0.4810654, 2.274023, 1, 1, 1, 1, 1,
0.761026, -0.09152085, 2.788983, 1, 1, 1, 1, 1,
0.7623225, -0.6002246, 0.3660585, 1, 1, 1, 1, 1,
0.7664583, -1.09997, 1.266934, 0, 0, 1, 1, 1,
0.7668785, -0.6964255, -0.06374219, 1, 0, 0, 1, 1,
0.7678933, 1.237018, 0.4647171, 1, 0, 0, 1, 1,
0.7685503, 0.01316894, 2.692863, 1, 0, 0, 1, 1,
0.7706593, 1.599848, 0.8207332, 1, 0, 0, 1, 1,
0.7709693, 0.2505479, -0.5454463, 1, 0, 0, 1, 1,
0.7787481, -0.02766109, 1.079632, 0, 0, 0, 1, 1,
0.792316, -1.249396, 2.955302, 0, 0, 0, 1, 1,
0.8035858, 0.63525, 0.8788562, 0, 0, 0, 1, 1,
0.8036586, -0.6562312, 0.6979383, 0, 0, 0, 1, 1,
0.8097668, -1.434549, 1.654278, 0, 0, 0, 1, 1,
0.8125748, -0.4664335, 3.865847, 0, 0, 0, 1, 1,
0.8169151, -0.6002885, 2.40572, 0, 0, 0, 1, 1,
0.8196652, 2.63379, 0.81439, 1, 1, 1, 1, 1,
0.8212479, 0.5949003, 0.3802395, 1, 1, 1, 1, 1,
0.8221018, -0.06216514, 1.423404, 1, 1, 1, 1, 1,
0.8286423, 1.659033, -0.8564684, 1, 1, 1, 1, 1,
0.8303549, -0.2078076, 2.603641, 1, 1, 1, 1, 1,
0.8305704, 2.935725, -1.41297, 1, 1, 1, 1, 1,
0.8370296, 0.4915483, -0.6878861, 1, 1, 1, 1, 1,
0.8372496, 1.54839, 1.16168, 1, 1, 1, 1, 1,
0.8380299, -0.6785576, 1.352185, 1, 1, 1, 1, 1,
0.8384783, -1.185173, 2.159532, 1, 1, 1, 1, 1,
0.8389174, -0.7021911, 2.758279, 1, 1, 1, 1, 1,
0.8402965, -1.237751, 4.071499, 1, 1, 1, 1, 1,
0.8429666, -0.1152049, 1.310362, 1, 1, 1, 1, 1,
0.8446975, -0.2759282, 0.4277515, 1, 1, 1, 1, 1,
0.8453611, 0.7347303, 0.655176, 1, 1, 1, 1, 1,
0.8536686, 1.272937, 0.272244, 0, 0, 1, 1, 1,
0.8564665, 0.119711, 4.1306, 1, 0, 0, 1, 1,
0.8614081, 2.120126, 1.257397, 1, 0, 0, 1, 1,
0.8631158, -1.057212, 2.634959, 1, 0, 0, 1, 1,
0.871042, 0.357067, 2.161951, 1, 0, 0, 1, 1,
0.8713123, -0.2891518, 1.099635, 1, 0, 0, 1, 1,
0.8730698, -1.997314, 4.075886, 0, 0, 0, 1, 1,
0.8739873, 0.7687176, 3.290207, 0, 0, 0, 1, 1,
0.8807929, -1.315605, 1.318684, 0, 0, 0, 1, 1,
0.8953158, 1.176027, 2.069058, 0, 0, 0, 1, 1,
0.8964072, -0.1933428, 0.4302264, 0, 0, 0, 1, 1,
0.8976297, -0.05779795, 3.41249, 0, 0, 0, 1, 1,
0.9002435, -1.196279, 3.458173, 0, 0, 0, 1, 1,
0.916709, -0.7048742, 1.642796, 1, 1, 1, 1, 1,
0.9171256, 0.923974, 1.711412, 1, 1, 1, 1, 1,
0.9202422, 0.2936743, 1.7052, 1, 1, 1, 1, 1,
0.9404419, 1.290985, -0.4387162, 1, 1, 1, 1, 1,
0.9514465, 1.795133, 0.8627916, 1, 1, 1, 1, 1,
0.952389, -1.415406, 1.283111, 1, 1, 1, 1, 1,
0.959828, -0.1989187, 1.949333, 1, 1, 1, 1, 1,
0.9662963, 0.2515857, 1.240645, 1, 1, 1, 1, 1,
0.9740816, -0.116937, 1.199726, 1, 1, 1, 1, 1,
0.9747368, -0.6407207, 1.056013, 1, 1, 1, 1, 1,
0.9938591, -1.589238, 1.066422, 1, 1, 1, 1, 1,
0.9984371, -1.163157, 2.002675, 1, 1, 1, 1, 1,
1.008039, -0.812983, 4.058163, 1, 1, 1, 1, 1,
1.016319, -0.9235733, 2.455106, 1, 1, 1, 1, 1,
1.019027, -0.3954066, 3.088156, 1, 1, 1, 1, 1,
1.022856, -0.4924886, -0.1317603, 0, 0, 1, 1, 1,
1.023824, 1.08763, 0.5379325, 1, 0, 0, 1, 1,
1.031426, 1.07424, 1.740619, 1, 0, 0, 1, 1,
1.034548, -0.04404426, 2.025495, 1, 0, 0, 1, 1,
1.041938, 0.758462, 0.05280979, 1, 0, 0, 1, 1,
1.04199, -0.0007172671, 1.830084, 1, 0, 0, 1, 1,
1.045653, 0.8252212, -0.01363025, 0, 0, 0, 1, 1,
1.049653, -0.5451586, 1.418571, 0, 0, 0, 1, 1,
1.05683, -1.653431, 3.819997, 0, 0, 0, 1, 1,
1.058867, -0.7754258, 0.7237235, 0, 0, 0, 1, 1,
1.076993, -1.632605, 2.413215, 0, 0, 0, 1, 1,
1.081055, -0.7270283, 2.820637, 0, 0, 0, 1, 1,
1.091522, 0.5152943, 2.643942, 0, 0, 0, 1, 1,
1.091906, 0.9620737, 0.463994, 1, 1, 1, 1, 1,
1.093145, 0.520177, -0.2183311, 1, 1, 1, 1, 1,
1.096352, 1.178209, -0.9490855, 1, 1, 1, 1, 1,
1.097574, -1.793065, 3.058893, 1, 1, 1, 1, 1,
1.100255, 1.39454, 0.1065088, 1, 1, 1, 1, 1,
1.101597, 0.7400545, -0.3847493, 1, 1, 1, 1, 1,
1.1079, -0.6602594, 1.584657, 1, 1, 1, 1, 1,
1.110402, 0.4150691, 2.395182, 1, 1, 1, 1, 1,
1.114337, -2.339571, 2.400173, 1, 1, 1, 1, 1,
1.116517, 0.6016479, 1.088848, 1, 1, 1, 1, 1,
1.122128, -1.245338, 1.608738, 1, 1, 1, 1, 1,
1.123684, -0.4753268, 1.356741, 1, 1, 1, 1, 1,
1.129197, -1.0872, 2.587056, 1, 1, 1, 1, 1,
1.142906, -0.2552674, 1.814947, 1, 1, 1, 1, 1,
1.149627, 1.365591, 2.470615, 1, 1, 1, 1, 1,
1.156993, -1.594096, 2.157262, 0, 0, 1, 1, 1,
1.159099, -2.893158, 4.721907, 1, 0, 0, 1, 1,
1.167113, -0.4962406, 3.034607, 1, 0, 0, 1, 1,
1.177629, -2.509188, 3.38119, 1, 0, 0, 1, 1,
1.193261, 0.7218189, 2.227703, 1, 0, 0, 1, 1,
1.198297, -0.1993222, 1.890269, 1, 0, 0, 1, 1,
1.200252, 1.122086, -0.4467658, 0, 0, 0, 1, 1,
1.20442, -1.360357, 3.050339, 0, 0, 0, 1, 1,
1.205509, -0.7391156, 2.062824, 0, 0, 0, 1, 1,
1.205796, 0.09916049, 2.463102, 0, 0, 0, 1, 1,
1.20957, 0.5813084, 0.8863387, 0, 0, 0, 1, 1,
1.211274, -0.795654, 1.465181, 0, 0, 0, 1, 1,
1.212767, -1.511325, 1.960946, 0, 0, 0, 1, 1,
1.213523, 1.249773, 0.9096656, 1, 1, 1, 1, 1,
1.214071, 0.1117019, 1.717315, 1, 1, 1, 1, 1,
1.215317, -0.01908891, 1.354476, 1, 1, 1, 1, 1,
1.217537, 0.8700055, 0.1909057, 1, 1, 1, 1, 1,
1.226962, -0.2402263, 0.014275, 1, 1, 1, 1, 1,
1.230015, -1.163992, 0.8989344, 1, 1, 1, 1, 1,
1.237933, 1.381433, -0.2177761, 1, 1, 1, 1, 1,
1.238112, -0.4995416, 2.007229, 1, 1, 1, 1, 1,
1.243105, 0.2878076, 1.265265, 1, 1, 1, 1, 1,
1.243137, 2.567146, -0.5673266, 1, 1, 1, 1, 1,
1.247711, -1.087066, 0.484857, 1, 1, 1, 1, 1,
1.255521, 0.2523172, 1.186763, 1, 1, 1, 1, 1,
1.260628, 1.28397, -0.6033967, 1, 1, 1, 1, 1,
1.265592, 1.041597, 0.2698992, 1, 1, 1, 1, 1,
1.278131, -1.072073, 0.5897412, 1, 1, 1, 1, 1,
1.280317, 0.6017139, 1.472446, 0, 0, 1, 1, 1,
1.28349, -1.284333, 1.890214, 1, 0, 0, 1, 1,
1.283494, -0.07063743, 0.6602622, 1, 0, 0, 1, 1,
1.288214, 0.680971, 1.979269, 1, 0, 0, 1, 1,
1.288922, 0.2109741, 1.003032, 1, 0, 0, 1, 1,
1.290918, -0.5526341, 1.249496, 1, 0, 0, 1, 1,
1.294653, -0.9736674, 2.007557, 0, 0, 0, 1, 1,
1.295341, 0.9743397, 1.42209, 0, 0, 0, 1, 1,
1.295469, 0.3484244, 2.646381, 0, 0, 0, 1, 1,
1.298939, 1.933739, 0.2816395, 0, 0, 0, 1, 1,
1.299098, 0.06606194, 1.304418, 0, 0, 0, 1, 1,
1.302882, 1.498568, 0.2793926, 0, 0, 0, 1, 1,
1.321356, -1.96708, 1.587469, 0, 0, 0, 1, 1,
1.324024, -0.4892557, 1.928655, 1, 1, 1, 1, 1,
1.32427, 1.433504, -0.08670501, 1, 1, 1, 1, 1,
1.331394, 0.5759842, 2.730313, 1, 1, 1, 1, 1,
1.338398, -0.6577436, 0.7856017, 1, 1, 1, 1, 1,
1.343019, 2.514927, 2.056065, 1, 1, 1, 1, 1,
1.348918, 1.448177, 2.246876, 1, 1, 1, 1, 1,
1.353853, 1.785048, -0.1471308, 1, 1, 1, 1, 1,
1.356391, 0.9289513, 0.7446589, 1, 1, 1, 1, 1,
1.35916, 2.353292, 1.276802, 1, 1, 1, 1, 1,
1.359598, 0.1594311, 0.6228587, 1, 1, 1, 1, 1,
1.372134, 0.03214643, 0.683991, 1, 1, 1, 1, 1,
1.374473, -0.3010306, 2.294654, 1, 1, 1, 1, 1,
1.409043, 0.9421275, 2.013389, 1, 1, 1, 1, 1,
1.411516, 0.193994, 1.716745, 1, 1, 1, 1, 1,
1.416773, 1.460437, 0.06783488, 1, 1, 1, 1, 1,
1.425396, 0.3470709, 0.4468225, 0, 0, 1, 1, 1,
1.427889, -0.4653557, 2.175546, 1, 0, 0, 1, 1,
1.433273, -0.8212235, 2.184355, 1, 0, 0, 1, 1,
1.454733, -1.156379, 2.329518, 1, 0, 0, 1, 1,
1.456402, -0.3659211, 0.8928784, 1, 0, 0, 1, 1,
1.456947, -0.2424745, 2.477705, 1, 0, 0, 1, 1,
1.461682, 0.7895238, 1.124043, 0, 0, 0, 1, 1,
1.471112, 0.6711573, 0.4631669, 0, 0, 0, 1, 1,
1.472871, -0.2141124, 2.151239, 0, 0, 0, 1, 1,
1.47918, -1.593544, 1.827839, 0, 0, 0, 1, 1,
1.483522, 0.1474414, 0.319961, 0, 0, 0, 1, 1,
1.493131, -0.8060574, 1.461605, 0, 0, 0, 1, 1,
1.498682, 0.1243061, 1.400242, 0, 0, 0, 1, 1,
1.505954, -2.319044, 1.745691, 1, 1, 1, 1, 1,
1.52553, 0.00684068, 3.966957, 1, 1, 1, 1, 1,
1.528148, 0.7058888, 2.058117, 1, 1, 1, 1, 1,
1.528852, -1.408826, 0.9630752, 1, 1, 1, 1, 1,
1.533747, -0.08150131, 1.572761, 1, 1, 1, 1, 1,
1.540519, -1.014169, 3.156511, 1, 1, 1, 1, 1,
1.55979, -1.175304, 3.338363, 1, 1, 1, 1, 1,
1.56767, -1.414644, 2.29792, 1, 1, 1, 1, 1,
1.575171, -0.03652993, 2.643827, 1, 1, 1, 1, 1,
1.589813, 0.43939, 1.111178, 1, 1, 1, 1, 1,
1.596205, -0.9739249, 4.568586, 1, 1, 1, 1, 1,
1.598786, -1.54293, 2.05924, 1, 1, 1, 1, 1,
1.601179, -0.8698449, 1.894627, 1, 1, 1, 1, 1,
1.601233, 0.06640727, 1.960408, 1, 1, 1, 1, 1,
1.602022, -0.1322574, -0.1424827, 1, 1, 1, 1, 1,
1.603376, -0.4606933, 0.5448387, 0, 0, 1, 1, 1,
1.631283, 0.7519177, 0.1888173, 1, 0, 0, 1, 1,
1.64053, 1.604166, 1.061553, 1, 0, 0, 1, 1,
1.660861, -0.5628438, 2.248092, 1, 0, 0, 1, 1,
1.673748, 2.488059, 0.9860593, 1, 0, 0, 1, 1,
1.674185, -0.4513369, 2.667088, 1, 0, 0, 1, 1,
1.689008, 0.7294793, 2.457129, 0, 0, 0, 1, 1,
1.696951, -0.02512539, -0.04425975, 0, 0, 0, 1, 1,
1.704252, -0.1180957, 1.652016, 0, 0, 0, 1, 1,
1.712247, -0.2528632, 2.322711, 0, 0, 0, 1, 1,
1.74007, 0.3385178, 1.971064, 0, 0, 0, 1, 1,
1.77359, 0.8882271, 2.026662, 0, 0, 0, 1, 1,
1.77722, -1.886616, 2.752489, 0, 0, 0, 1, 1,
1.777795, 2.119956, 3.180548, 1, 1, 1, 1, 1,
1.778262, 1.390121, -0.02275105, 1, 1, 1, 1, 1,
1.803594, 1.41468, -0.3438276, 1, 1, 1, 1, 1,
1.80576, 0.9163008, 0.8856772, 1, 1, 1, 1, 1,
1.830657, 1.274979, 0.768151, 1, 1, 1, 1, 1,
1.839622, -0.7541584, 3.313094, 1, 1, 1, 1, 1,
1.848598, -0.002048257, 0.6750597, 1, 1, 1, 1, 1,
1.856815, -0.7586699, 3.79994, 1, 1, 1, 1, 1,
1.897064, -0.7295098, 1.609661, 1, 1, 1, 1, 1,
1.903921, -1.409536, 0.5191121, 1, 1, 1, 1, 1,
1.923507, -0.2112251, 1.807451, 1, 1, 1, 1, 1,
1.92461, -0.2496376, 2.678464, 1, 1, 1, 1, 1,
1.95053, 0.150832, 1.252797, 1, 1, 1, 1, 1,
1.980237, 1.712511, 0.878228, 1, 1, 1, 1, 1,
1.986094, 0.2816296, -0.2424679, 1, 1, 1, 1, 1,
2.009486, 0.3504339, 2.225038, 0, 0, 1, 1, 1,
2.019072, -0.09799547, 1.465618, 1, 0, 0, 1, 1,
2.06041, 1.025525, 1.45051, 1, 0, 0, 1, 1,
2.064931, 1.065464, 1.373467, 1, 0, 0, 1, 1,
2.082971, 0.3254569, 2.089409, 1, 0, 0, 1, 1,
2.092136, -0.2447921, 0.1469094, 1, 0, 0, 1, 1,
2.092283, -1.210619, 0.6466433, 0, 0, 0, 1, 1,
2.116248, -0.8117878, 2.117824, 0, 0, 0, 1, 1,
2.150308, -0.1959447, 3.15139, 0, 0, 0, 1, 1,
2.169616, 0.8095086, 1.009933, 0, 0, 0, 1, 1,
2.197402, 0.6117632, 1.208663, 0, 0, 0, 1, 1,
2.251518, -0.7108039, 3.091966, 0, 0, 0, 1, 1,
2.32523, -1.179043, 3.578168, 0, 0, 0, 1, 1,
2.365143, 0.4468119, 2.477381, 1, 1, 1, 1, 1,
2.513976, 0.1916388, 2.481878, 1, 1, 1, 1, 1,
2.538112, -0.3978369, 4.384656, 1, 1, 1, 1, 1,
2.55252, -1.163154, 4.12, 1, 1, 1, 1, 1,
2.812271, 1.519011, 0.2304333, 1, 1, 1, 1, 1,
2.929752, -0.7356506, 1.598166, 1, 1, 1, 1, 1,
3.147187, -0.2811567, -0.2648481, 1, 1, 1, 1, 1
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
var radius = 9.386195;
var distance = 32.96861;
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
mvMatrix.translate( 0.1126544, -0.1430748, 0.2151015 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.96861);
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
