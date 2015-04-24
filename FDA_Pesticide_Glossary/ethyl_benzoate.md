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
-3.297288, -1.431811, -0.6448807, 1, 0, 0, 1,
-2.829714, -0.1655124, -1.654783, 1, 0.007843138, 0, 1,
-2.543509, 1.753794, -1.166973, 1, 0.01176471, 0, 1,
-2.472188, -1.413768, -2.227076, 1, 0.01960784, 0, 1,
-2.351547, 1.595031, -2.043247, 1, 0.02352941, 0, 1,
-2.325497, -0.07224235, -3.303862, 1, 0.03137255, 0, 1,
-2.247711, -0.6253267, -0.610953, 1, 0.03529412, 0, 1,
-2.223342, 0.7606139, -1.170665, 1, 0.04313726, 0, 1,
-2.205144, 0.7086663, -2.224134, 1, 0.04705882, 0, 1,
-2.203083, -1.001638, -1.629846, 1, 0.05490196, 0, 1,
-2.190431, -0.1428835, -4.821732, 1, 0.05882353, 0, 1,
-2.181055, 0.7658905, -0.1729756, 1, 0.06666667, 0, 1,
-2.160868, 0.6889058, -0.7088294, 1, 0.07058824, 0, 1,
-2.15833, -1.228199, -1.138513, 1, 0.07843138, 0, 1,
-2.122945, -0.07411095, -1.724629, 1, 0.08235294, 0, 1,
-2.098211, 0.5308169, -1.641916, 1, 0.09019608, 0, 1,
-2.079306, -0.04514152, -2.091208, 1, 0.09411765, 0, 1,
-2.078731, 0.4073216, -0.6183357, 1, 0.1019608, 0, 1,
-2.056175, -1.142359, -2.878871, 1, 0.1098039, 0, 1,
-2.05494, 0.5518307, -1.563988, 1, 0.1137255, 0, 1,
-2.054446, 1.160872, -1.549337, 1, 0.1215686, 0, 1,
-2.039306, 0.05182557, -0.4291097, 1, 0.1254902, 0, 1,
-2.038313, 0.2346942, -1.794174, 1, 0.1333333, 0, 1,
-2.011635, -2.71806, -2.693292, 1, 0.1372549, 0, 1,
-2.002739, -0.6757675, -3.200263, 1, 0.145098, 0, 1,
-1.962076, -0.173654, -1.028615, 1, 0.1490196, 0, 1,
-1.928658, 0.2045012, -1.791871, 1, 0.1568628, 0, 1,
-1.926451, -1.150921, -2.582346, 1, 0.1607843, 0, 1,
-1.925871, -0.9417346, -3.39967, 1, 0.1686275, 0, 1,
-1.919889, -1.481672, -2.446864, 1, 0.172549, 0, 1,
-1.912058, 0.9555372, -1.840438, 1, 0.1803922, 0, 1,
-1.906515, -0.2250661, -0.6148754, 1, 0.1843137, 0, 1,
-1.871987, 0.143639, -0.6665, 1, 0.1921569, 0, 1,
-1.835971, -2.057977, -6.174079, 1, 0.1960784, 0, 1,
-1.825802, 0.1956378, -2.565825, 1, 0.2039216, 0, 1,
-1.819071, -1.860889, -2.726043, 1, 0.2117647, 0, 1,
-1.808726, -0.4212963, -1.416104, 1, 0.2156863, 0, 1,
-1.808567, 1.687826, 0.02129699, 1, 0.2235294, 0, 1,
-1.805007, 0.8410259, 0.6619811, 1, 0.227451, 0, 1,
-1.756963, -1.028601, -0.5383376, 1, 0.2352941, 0, 1,
-1.751407, -0.5889675, -0.9193441, 1, 0.2392157, 0, 1,
-1.744938, -1.232219, -2.812731, 1, 0.2470588, 0, 1,
-1.738929, 0.6555659, -0.03243164, 1, 0.2509804, 0, 1,
-1.712268, 1.392049, -1.827713, 1, 0.2588235, 0, 1,
-1.709871, -0.02711624, -0.7787604, 1, 0.2627451, 0, 1,
-1.690802, 0.3820074, -2.43914, 1, 0.2705882, 0, 1,
-1.676037, 1.242903, -2.77387, 1, 0.2745098, 0, 1,
-1.672055, -1.119723, -2.864031, 1, 0.282353, 0, 1,
-1.629266, -0.5483397, -1.650365, 1, 0.2862745, 0, 1,
-1.626881, -1.024681, -0.6218759, 1, 0.2941177, 0, 1,
-1.621857, -1.025231, -0.9195362, 1, 0.3019608, 0, 1,
-1.606039, 0.07163418, -1.55651, 1, 0.3058824, 0, 1,
-1.600882, -0.05276516, -1.801996, 1, 0.3137255, 0, 1,
-1.597105, -0.9614044, -1.526432, 1, 0.3176471, 0, 1,
-1.592059, -0.1439167, -1.138517, 1, 0.3254902, 0, 1,
-1.574561, 1.939931, -0.4177202, 1, 0.3294118, 0, 1,
-1.571643, -1.498383, -2.147627, 1, 0.3372549, 0, 1,
-1.558763, -0.9072171, -1.979811, 1, 0.3411765, 0, 1,
-1.548384, 0.2834855, -2.672893, 1, 0.3490196, 0, 1,
-1.538552, 0.7082185, -0.3300265, 1, 0.3529412, 0, 1,
-1.536815, 1.317023, -1.464186, 1, 0.3607843, 0, 1,
-1.536333, 0.88595, -1.946487, 1, 0.3647059, 0, 1,
-1.53563, 0.1331515, 0.6896298, 1, 0.372549, 0, 1,
-1.531867, 0.2023912, -3.011912, 1, 0.3764706, 0, 1,
-1.529752, -0.5312102, -2.236526, 1, 0.3843137, 0, 1,
-1.523167, 0.1056582, -2.356068, 1, 0.3882353, 0, 1,
-1.522129, 1.457717, -0.3929367, 1, 0.3960784, 0, 1,
-1.50753, -0.116366, -2.680266, 1, 0.4039216, 0, 1,
-1.503184, 0.8428178, -0.5820039, 1, 0.4078431, 0, 1,
-1.501164, -1.200031, -1.41772, 1, 0.4156863, 0, 1,
-1.497283, 0.7444184, -1.405804, 1, 0.4196078, 0, 1,
-1.495435, -1.495176, -1.865176, 1, 0.427451, 0, 1,
-1.492509, 0.09660227, 0.02905534, 1, 0.4313726, 0, 1,
-1.481643, 0.2727806, -2.913322, 1, 0.4392157, 0, 1,
-1.473515, 0.3634892, 0.2180203, 1, 0.4431373, 0, 1,
-1.473485, 0.1149693, -0.8632328, 1, 0.4509804, 0, 1,
-1.446707, 1.26171, 0.1652064, 1, 0.454902, 0, 1,
-1.444246, -0.7021678, -2.133437, 1, 0.4627451, 0, 1,
-1.424165, -1.440076, -2.260955, 1, 0.4666667, 0, 1,
-1.403139, 0.198097, -2.222814, 1, 0.4745098, 0, 1,
-1.402917, -1.311101, -3.28323, 1, 0.4784314, 0, 1,
-1.399537, -0.934983, -2.801766, 1, 0.4862745, 0, 1,
-1.390671, 0.4214813, -1.522513, 1, 0.4901961, 0, 1,
-1.385542, 1.185712, -0.758171, 1, 0.4980392, 0, 1,
-1.380083, 0.4057702, -1.220755, 1, 0.5058824, 0, 1,
-1.375747, -0.4080771, -0.539257, 1, 0.509804, 0, 1,
-1.371177, 1.050003, -0.7332996, 1, 0.5176471, 0, 1,
-1.370548, -0.2743741, -1.44041, 1, 0.5215687, 0, 1,
-1.358179, 2.828092, 1.489694, 1, 0.5294118, 0, 1,
-1.349404, 0.8601831, -0.3513058, 1, 0.5333334, 0, 1,
-1.348627, 0.3289442, -2.019443, 1, 0.5411765, 0, 1,
-1.345121, -0.8017365, -2.692563, 1, 0.5450981, 0, 1,
-1.343436, -0.4968989, -1.66569, 1, 0.5529412, 0, 1,
-1.329688, -0.2089138, -1.879758, 1, 0.5568628, 0, 1,
-1.327795, -0.3494994, -2.50126, 1, 0.5647059, 0, 1,
-1.325024, 1.446731, -0.6501803, 1, 0.5686275, 0, 1,
-1.299974, 0.8395146, -0.2377296, 1, 0.5764706, 0, 1,
-1.291738, -0.9413134, -2.678573, 1, 0.5803922, 0, 1,
-1.291724, -0.03646168, -1.355454, 1, 0.5882353, 0, 1,
-1.281606, 1.811708, -0.2831354, 1, 0.5921569, 0, 1,
-1.275264, -0.7239687, -1.908151, 1, 0.6, 0, 1,
-1.269903, 0.4358789, 0.04511863, 1, 0.6078432, 0, 1,
-1.268731, -0.9321084, -3.281551, 1, 0.6117647, 0, 1,
-1.264501, -2.30389, -0.7833079, 1, 0.6196079, 0, 1,
-1.257774, 0.04627179, 1.156965, 1, 0.6235294, 0, 1,
-1.254692, 0.05781518, -1.852201, 1, 0.6313726, 0, 1,
-1.251203, 1.178462, -1.045323, 1, 0.6352941, 0, 1,
-1.251056, -0.01257235, -1.278633, 1, 0.6431373, 0, 1,
-1.250622, 1.04888, -0.9323701, 1, 0.6470588, 0, 1,
-1.243459, 0.941365, 0.4797538, 1, 0.654902, 0, 1,
-1.24174, -1.449924, -2.508133, 1, 0.6588235, 0, 1,
-1.236616, -0.9925554, -1.689398, 1, 0.6666667, 0, 1,
-1.233366, 0.08745628, -0.8048128, 1, 0.6705883, 0, 1,
-1.231452, 0.8933367, -0.5541773, 1, 0.6784314, 0, 1,
-1.231349, -0.6948869, -1.420563, 1, 0.682353, 0, 1,
-1.21291, -1.222027, -2.082411, 1, 0.6901961, 0, 1,
-1.206962, -1.372, -1.419747, 1, 0.6941177, 0, 1,
-1.198892, -1.42584, -0.6027406, 1, 0.7019608, 0, 1,
-1.196354, -1.725485, -2.372937, 1, 0.7098039, 0, 1,
-1.195725, 0.2225926, -0.8430347, 1, 0.7137255, 0, 1,
-1.193031, -0.2164843, -2.28923, 1, 0.7215686, 0, 1,
-1.190471, 0.5006154, -0.5799981, 1, 0.7254902, 0, 1,
-1.189599, 0.1937514, -0.4655434, 1, 0.7333333, 0, 1,
-1.187976, -1.188597, -2.430133, 1, 0.7372549, 0, 1,
-1.187724, 0.0395998, -2.237959, 1, 0.7450981, 0, 1,
-1.179238, 0.8837696, -1.090437, 1, 0.7490196, 0, 1,
-1.176165, -1.432582, -2.966228, 1, 0.7568628, 0, 1,
-1.175717, 0.8789911, 0.1008888, 1, 0.7607843, 0, 1,
-1.17381, 1.309131, -1.72134, 1, 0.7686275, 0, 1,
-1.172958, 1.285626, -1.568698, 1, 0.772549, 0, 1,
-1.172433, -0.08478409, -1.70041, 1, 0.7803922, 0, 1,
-1.171396, -1.12209, -2.34629, 1, 0.7843137, 0, 1,
-1.170274, -2.876657, -1.51283, 1, 0.7921569, 0, 1,
-1.167014, -1.863324, -3.812199, 1, 0.7960784, 0, 1,
-1.164415, -0.3051853, -0.008806284, 1, 0.8039216, 0, 1,
-1.161913, 0.2954141, -0.8110089, 1, 0.8117647, 0, 1,
-1.158947, -0.5213358, -2.798926, 1, 0.8156863, 0, 1,
-1.154676, 0.3371415, -2.469525, 1, 0.8235294, 0, 1,
-1.152233, 3.690591, -0.7010636, 1, 0.827451, 0, 1,
-1.145156, -0.2651395, -0.9482561, 1, 0.8352941, 0, 1,
-1.135343, -1.254245, -1.330401, 1, 0.8392157, 0, 1,
-1.134748, 1.21429, -1.627802, 1, 0.8470588, 0, 1,
-1.127593, 0.6121202, 0.3640263, 1, 0.8509804, 0, 1,
-1.113092, -2.073315, -2.430994, 1, 0.8588235, 0, 1,
-1.110567, 1.065085, -0.6346669, 1, 0.8627451, 0, 1,
-1.10647, 0.4642066, -1.459265, 1, 0.8705882, 0, 1,
-1.097438, -0.4535423, -2.193445, 1, 0.8745098, 0, 1,
-1.086085, -0.6065586, -2.860485, 1, 0.8823529, 0, 1,
-1.085966, -0.1642825, -1.335916, 1, 0.8862745, 0, 1,
-1.084717, 0.7886598, -1.148057, 1, 0.8941177, 0, 1,
-1.083957, -1.093136, -1.836614, 1, 0.8980392, 0, 1,
-1.0816, 1.09411, -0.6039373, 1, 0.9058824, 0, 1,
-1.078506, 0.516211, -1.515591, 1, 0.9137255, 0, 1,
-1.076956, -0.3310086, -2.146363, 1, 0.9176471, 0, 1,
-1.076254, 1.958022, -0.3205052, 1, 0.9254902, 0, 1,
-1.072464, 0.8043269, -0.531218, 1, 0.9294118, 0, 1,
-1.071009, -0.04404408, -1.638187, 1, 0.9372549, 0, 1,
-1.066488, 1.611348, -0.7813888, 1, 0.9411765, 0, 1,
-1.065892, -0.1603626, -2.668747, 1, 0.9490196, 0, 1,
-1.065807, 0.2824942, -1.065434, 1, 0.9529412, 0, 1,
-1.061596, 0.06982975, -1.35004, 1, 0.9607843, 0, 1,
-1.041694, -0.9627433, -1.661618, 1, 0.9647059, 0, 1,
-1.039948, 1.46085, -2.1559, 1, 0.972549, 0, 1,
-1.036915, -0.6120649, -1.609297, 1, 0.9764706, 0, 1,
-1.033928, -1.107294, -2.851565, 1, 0.9843137, 0, 1,
-1.030765, -0.4327061, -2.903389, 1, 0.9882353, 0, 1,
-1.029367, 1.792533, 0.5403895, 1, 0.9960784, 0, 1,
-1.028001, 1.801557, -1.872594, 0.9960784, 1, 0, 1,
-1.02659, 0.2421794, -1.399031, 0.9921569, 1, 0, 1,
-1.022381, -0.9318095, -3.629629, 0.9843137, 1, 0, 1,
-1.020442, 0.07134107, -1.021496, 0.9803922, 1, 0, 1,
-1.01713, -0.5987411, -2.864864, 0.972549, 1, 0, 1,
-1.011432, 2.773363, -0.04349463, 0.9686275, 1, 0, 1,
-1.008955, -0.9767653, -0.8414133, 0.9607843, 1, 0, 1,
-1.007253, 0.8070766, -0.9680542, 0.9568627, 1, 0, 1,
-1.006646, 2.1793, -3.199854, 0.9490196, 1, 0, 1,
-0.9968133, 0.146193, -2.206834, 0.945098, 1, 0, 1,
-0.994092, 2.120027, 0.1272262, 0.9372549, 1, 0, 1,
-0.9851449, 0.8370417, -1.878381, 0.9333333, 1, 0, 1,
-0.981701, -2.17586, -2.751125, 0.9254902, 1, 0, 1,
-0.9736353, -0.6530375, -1.729122, 0.9215686, 1, 0, 1,
-0.9703614, 0.1321285, -1.397445, 0.9137255, 1, 0, 1,
-0.961979, 0.8548023, -0.9916059, 0.9098039, 1, 0, 1,
-0.9599627, 0.1196114, -2.529921, 0.9019608, 1, 0, 1,
-0.9556133, -1.217589, -2.783518, 0.8941177, 1, 0, 1,
-0.9546831, 0.7302499, -3.536603, 0.8901961, 1, 0, 1,
-0.9505038, 0.5650015, 1.671583, 0.8823529, 1, 0, 1,
-0.9475296, -1.37035, -1.06137, 0.8784314, 1, 0, 1,
-0.9473487, 0.233801, -1.046523, 0.8705882, 1, 0, 1,
-0.9454124, 0.6421419, 0.2898599, 0.8666667, 1, 0, 1,
-0.936385, -0.04064617, -0.8181516, 0.8588235, 1, 0, 1,
-0.931501, -1.812798, -2.451208, 0.854902, 1, 0, 1,
-0.9313098, -0.01465969, -1.915341, 0.8470588, 1, 0, 1,
-0.9288044, -1.22825, -3.408281, 0.8431373, 1, 0, 1,
-0.9276872, -0.9281575, -2.454311, 0.8352941, 1, 0, 1,
-0.9264829, 1.816436, -0.9237665, 0.8313726, 1, 0, 1,
-0.9185066, -1.912163, -3.415635, 0.8235294, 1, 0, 1,
-0.9110621, -1.228287, -3.591235, 0.8196079, 1, 0, 1,
-0.8936633, 0.1247933, -1.581515, 0.8117647, 1, 0, 1,
-0.8846614, -0.5800353, -3.125032, 0.8078431, 1, 0, 1,
-0.8803271, 0.389175, -2.022537, 0.8, 1, 0, 1,
-0.8683235, -0.06539128, -0.5098723, 0.7921569, 1, 0, 1,
-0.8668414, -0.2903199, -2.301585, 0.7882353, 1, 0, 1,
-0.8667627, -0.05429986, -1.380677, 0.7803922, 1, 0, 1,
-0.8601362, -1.413531, -2.66259, 0.7764706, 1, 0, 1,
-0.853937, -1.102005, -2.576773, 0.7686275, 1, 0, 1,
-0.843876, 0.07157428, -1.6602, 0.7647059, 1, 0, 1,
-0.8385988, -0.3387638, -3.652378, 0.7568628, 1, 0, 1,
-0.8380485, 1.241218, 0.06486369, 0.7529412, 1, 0, 1,
-0.834076, -0.7278582, -3.13484, 0.7450981, 1, 0, 1,
-0.8340222, -0.606248, -2.485708, 0.7411765, 1, 0, 1,
-0.8323069, -0.3266353, -1.872907, 0.7333333, 1, 0, 1,
-0.8312405, -0.1073713, -2.555252, 0.7294118, 1, 0, 1,
-0.8231714, 0.1789783, -2.051603, 0.7215686, 1, 0, 1,
-0.8187749, 1.440912, -0.666649, 0.7176471, 1, 0, 1,
-0.8146635, 1.491594, 0.4837909, 0.7098039, 1, 0, 1,
-0.8118293, -0.4642026, -2.215254, 0.7058824, 1, 0, 1,
-0.8080291, 2.365573, 2.437874, 0.6980392, 1, 0, 1,
-0.80678, -0.6998349, -3.350163, 0.6901961, 1, 0, 1,
-0.8039262, -0.04372032, -2.619795, 0.6862745, 1, 0, 1,
-0.8010906, -1.129383, -0.902658, 0.6784314, 1, 0, 1,
-0.7984908, 1.729051, -2.927624, 0.6745098, 1, 0, 1,
-0.7980853, 0.5994324, -0.5656406, 0.6666667, 1, 0, 1,
-0.7946625, 0.390305, -1.698997, 0.6627451, 1, 0, 1,
-0.7898082, 1.988643, 0.1556885, 0.654902, 1, 0, 1,
-0.7866599, -2.962422, -2.523264, 0.6509804, 1, 0, 1,
-0.7845258, -0.906669, -2.958906, 0.6431373, 1, 0, 1,
-0.7830762, -0.1808718, -1.171322, 0.6392157, 1, 0, 1,
-0.7829614, 0.02681242, -0.2073924, 0.6313726, 1, 0, 1,
-0.7819423, -0.9436263, -2.406282, 0.627451, 1, 0, 1,
-0.7788085, -0.9557511, -0.454748, 0.6196079, 1, 0, 1,
-0.7746883, -0.9938033, -1.2967, 0.6156863, 1, 0, 1,
-0.771777, 0.6911556, -0.7324981, 0.6078432, 1, 0, 1,
-0.7675974, -1.072294, -2.421746, 0.6039216, 1, 0, 1,
-0.7672117, -0.5872551, -3.343877, 0.5960785, 1, 0, 1,
-0.7609858, 0.1998547, -2.141784, 0.5882353, 1, 0, 1,
-0.759986, 0.8347247, -1.005674, 0.5843138, 1, 0, 1,
-0.7575356, -0.3598604, -4.075704, 0.5764706, 1, 0, 1,
-0.7534848, -1.270026, -2.937827, 0.572549, 1, 0, 1,
-0.7491139, 1.085652, -0.1272949, 0.5647059, 1, 0, 1,
-0.749064, 1.107615, -1.023797, 0.5607843, 1, 0, 1,
-0.7429933, 2.085277, -1.767295, 0.5529412, 1, 0, 1,
-0.7407041, -0.4087988, -2.845923, 0.5490196, 1, 0, 1,
-0.740205, 0.9576213, -0.184857, 0.5411765, 1, 0, 1,
-0.7398455, 2.211841, 0.3046317, 0.5372549, 1, 0, 1,
-0.7330647, -0.8402582, -1.913741, 0.5294118, 1, 0, 1,
-0.7229449, 1.044112, -0.6834318, 0.5254902, 1, 0, 1,
-0.7205803, 0.7142916, -1.265086, 0.5176471, 1, 0, 1,
-0.7191618, -1.563296, -0.6262244, 0.5137255, 1, 0, 1,
-0.7183422, 1.87865, -0.3280617, 0.5058824, 1, 0, 1,
-0.7180302, 0.5827116, -0.2576883, 0.5019608, 1, 0, 1,
-0.7140744, -2.542307, -2.444279, 0.4941176, 1, 0, 1,
-0.7024188, 0.6962882, -0.7377259, 0.4862745, 1, 0, 1,
-0.7021567, 1.098008, -2.516624, 0.4823529, 1, 0, 1,
-0.6988131, -0.02153616, -0.9016358, 0.4745098, 1, 0, 1,
-0.6957781, -0.1258775, 0.5265081, 0.4705882, 1, 0, 1,
-0.6952059, 0.5690122, 0.6727652, 0.4627451, 1, 0, 1,
-0.6906475, -0.8616997, -3.059517, 0.4588235, 1, 0, 1,
-0.6850315, -0.6312191, -4.012436, 0.4509804, 1, 0, 1,
-0.6839318, -0.1342576, -1.39748, 0.4470588, 1, 0, 1,
-0.6758357, -2.579264, -2.619832, 0.4392157, 1, 0, 1,
-0.6757557, 0.8685205, -0.7165547, 0.4352941, 1, 0, 1,
-0.6741353, 0.9347492, -0.8718402, 0.427451, 1, 0, 1,
-0.670237, 0.606083, 0.7835984, 0.4235294, 1, 0, 1,
-0.66837, -0.9770613, -5.958354, 0.4156863, 1, 0, 1,
-0.6681085, -0.4817241, -1.077756, 0.4117647, 1, 0, 1,
-0.6663185, -0.7927767, -3.24116, 0.4039216, 1, 0, 1,
-0.6617035, 0.6885901, -0.7560768, 0.3960784, 1, 0, 1,
-0.6591613, -0.2439126, -1.314608, 0.3921569, 1, 0, 1,
-0.6587167, 0.08115575, -1.664562, 0.3843137, 1, 0, 1,
-0.6573973, 0.8774093, -0.1469676, 0.3803922, 1, 0, 1,
-0.6484239, 0.1628218, -2.374746, 0.372549, 1, 0, 1,
-0.6367207, 0.2246046, -1.315777, 0.3686275, 1, 0, 1,
-0.625725, -0.3089318, -3.010771, 0.3607843, 1, 0, 1,
-0.623448, -0.1255043, -0.9182459, 0.3568628, 1, 0, 1,
-0.6230722, 0.2311957, -1.402508, 0.3490196, 1, 0, 1,
-0.621426, -0.723043, -2.738458, 0.345098, 1, 0, 1,
-0.6203015, 1.478861, 0.587558, 0.3372549, 1, 0, 1,
-0.618566, 0.4712747, -2.715232, 0.3333333, 1, 0, 1,
-0.6179147, -0.8713663, -3.131071, 0.3254902, 1, 0, 1,
-0.6176274, -0.2590586, -3.353682, 0.3215686, 1, 0, 1,
-0.6165789, 0.1009729, -1.867257, 0.3137255, 1, 0, 1,
-0.6150321, -0.01436238, -2.257229, 0.3098039, 1, 0, 1,
-0.6109635, -2.142739, -4.038281, 0.3019608, 1, 0, 1,
-0.609634, 1.157971, -1.928622, 0.2941177, 1, 0, 1,
-0.6068195, -1.005059, -3.859462, 0.2901961, 1, 0, 1,
-0.6037664, -1.851591, -4.507581, 0.282353, 1, 0, 1,
-0.5986336, -0.427597, -0.9082395, 0.2784314, 1, 0, 1,
-0.5977139, -1.28976, -2.872369, 0.2705882, 1, 0, 1,
-0.592158, -1.691523, -2.624712, 0.2666667, 1, 0, 1,
-0.5921095, 0.2343169, -2.246381, 0.2588235, 1, 0, 1,
-0.591626, 1.182377, -0.7449405, 0.254902, 1, 0, 1,
-0.5904727, 0.04596679, -2.483836, 0.2470588, 1, 0, 1,
-0.588662, -0.182117, -2.41248, 0.2431373, 1, 0, 1,
-0.58858, -0.9305953, -2.734896, 0.2352941, 1, 0, 1,
-0.5822335, -0.3454666, -1.341272, 0.2313726, 1, 0, 1,
-0.5801511, -0.747246, -1.452966, 0.2235294, 1, 0, 1,
-0.5738451, 1.832107, -0.9011937, 0.2196078, 1, 0, 1,
-0.5726161, -0.1808976, -2.72605, 0.2117647, 1, 0, 1,
-0.5655507, 0.2898114, -2.732224, 0.2078431, 1, 0, 1,
-0.5623113, 0.4909103, -0.5633001, 0.2, 1, 0, 1,
-0.5570146, 0.6885195, -1.063303, 0.1921569, 1, 0, 1,
-0.5543274, 1.754649, -0.8791475, 0.1882353, 1, 0, 1,
-0.5516493, 0.7916486, 0.4354549, 0.1803922, 1, 0, 1,
-0.5464422, 0.03535786, -1.431899, 0.1764706, 1, 0, 1,
-0.5451911, -0.9979483, -2.07188, 0.1686275, 1, 0, 1,
-0.5443782, -1.921193, -3.279408, 0.1647059, 1, 0, 1,
-0.5426695, 0.9134521, 0.5192846, 0.1568628, 1, 0, 1,
-0.5420249, 0.3824886, -1.240015, 0.1529412, 1, 0, 1,
-0.5387912, 0.2035985, -1.988082, 0.145098, 1, 0, 1,
-0.5381724, -0.1873874, -1.709829, 0.1411765, 1, 0, 1,
-0.5277885, -0.2094588, -4.638758, 0.1333333, 1, 0, 1,
-0.5277357, -1.741167, -2.4026, 0.1294118, 1, 0, 1,
-0.5078328, 0.09235578, -0.6012847, 0.1215686, 1, 0, 1,
-0.5061983, 0.3680738, -1.953898, 0.1176471, 1, 0, 1,
-0.5045914, 0.4191972, -0.1024419, 0.1098039, 1, 0, 1,
-0.5011624, 0.3342556, -0.9607724, 0.1058824, 1, 0, 1,
-0.4920066, 0.6370742, 0.9304637, 0.09803922, 1, 0, 1,
-0.4876285, -1.191907, -2.788243, 0.09019608, 1, 0, 1,
-0.4861636, 0.9535866, -0.8671321, 0.08627451, 1, 0, 1,
-0.4817618, 0.7462072, -1.590385, 0.07843138, 1, 0, 1,
-0.479862, -0.2750252, -0.9493043, 0.07450981, 1, 0, 1,
-0.4769126, 0.3592864, -0.4750024, 0.06666667, 1, 0, 1,
-0.4742382, 1.556212, 0.949456, 0.0627451, 1, 0, 1,
-0.4720568, 0.6947461, 0.1133737, 0.05490196, 1, 0, 1,
-0.4695348, 0.007177293, -1.655649, 0.05098039, 1, 0, 1,
-0.4657184, -0.1972105, -0.2477857, 0.04313726, 1, 0, 1,
-0.4643973, -1.825618, -2.264461, 0.03921569, 1, 0, 1,
-0.4616557, -0.6629073, -1.773019, 0.03137255, 1, 0, 1,
-0.4612389, 0.9865264, -0.9048946, 0.02745098, 1, 0, 1,
-0.459449, 0.4034674, -2.093875, 0.01960784, 1, 0, 1,
-0.4559421, -0.8415093, -3.705572, 0.01568628, 1, 0, 1,
-0.4553127, -0.8716721, -3.157935, 0.007843138, 1, 0, 1,
-0.4528689, 0.5960333, -1.448876, 0.003921569, 1, 0, 1,
-0.4525273, -1.201321, -3.802428, 0, 1, 0.003921569, 1,
-0.451307, 1.191052, 0.2525415, 0, 1, 0.01176471, 1,
-0.4509537, -0.2589526, -2.137821, 0, 1, 0.01568628, 1,
-0.4479994, -0.4712282, -3.099169, 0, 1, 0.02352941, 1,
-0.4465536, 0.06981403, -0.9886557, 0, 1, 0.02745098, 1,
-0.4390163, -0.08903652, -3.481051, 0, 1, 0.03529412, 1,
-0.4358924, -1.128853, -1.716462, 0, 1, 0.03921569, 1,
-0.4344156, -1.280833, -2.184759, 0, 1, 0.04705882, 1,
-0.4335693, 0.3405541, -1.04279, 0, 1, 0.05098039, 1,
-0.4288016, 0.8112311, -1.675511, 0, 1, 0.05882353, 1,
-0.4212315, 0.9110187, -0.1086644, 0, 1, 0.0627451, 1,
-0.4197571, 0.9737757, -1.347726, 0, 1, 0.07058824, 1,
-0.4191863, 0.1585802, 0.1816078, 0, 1, 0.07450981, 1,
-0.4159934, 1.068213, -0.8941559, 0, 1, 0.08235294, 1,
-0.4140837, 0.3584948, -1.673638, 0, 1, 0.08627451, 1,
-0.4109415, -0.6722218, -2.834627, 0, 1, 0.09411765, 1,
-0.4066211, -1.170634, -2.301637, 0, 1, 0.1019608, 1,
-0.4047047, -1.985737, -3.765677, 0, 1, 0.1058824, 1,
-0.4026637, 0.05355237, -0.888216, 0, 1, 0.1137255, 1,
-0.4002365, 0.1245403, -1.380544, 0, 1, 0.1176471, 1,
-0.3992119, -0.09052342, -1.175197, 0, 1, 0.1254902, 1,
-0.3891752, 1.883781, -0.473367, 0, 1, 0.1294118, 1,
-0.3835562, 0.1814683, -2.451012, 0, 1, 0.1372549, 1,
-0.3833445, 1.178728, -1.720257, 0, 1, 0.1411765, 1,
-0.3797604, -0.2467935, -2.688134, 0, 1, 0.1490196, 1,
-0.3794338, -0.006853772, -2.30343, 0, 1, 0.1529412, 1,
-0.3772369, -0.1515411, 0.0009775687, 0, 1, 0.1607843, 1,
-0.3687298, -1.553725, -3.0933, 0, 1, 0.1647059, 1,
-0.3656054, 1.763864, -1.787363, 0, 1, 0.172549, 1,
-0.3652281, -0.7126393, -0.9053748, 0, 1, 0.1764706, 1,
-0.3597571, -0.3800598, -0.7088384, 0, 1, 0.1843137, 1,
-0.3562564, 1.142032, -0.3276256, 0, 1, 0.1882353, 1,
-0.3555008, -0.4968599, -1.329407, 0, 1, 0.1960784, 1,
-0.3527997, 1.05215, -0.3397626, 0, 1, 0.2039216, 1,
-0.3492509, -1.018827, -2.712908, 0, 1, 0.2078431, 1,
-0.3483303, 0.4713589, -1.625868, 0, 1, 0.2156863, 1,
-0.3470436, 1.861105, -0.275153, 0, 1, 0.2196078, 1,
-0.3420531, -0.06733467, -0.7780485, 0, 1, 0.227451, 1,
-0.3372987, 0.4498233, -0.7419021, 0, 1, 0.2313726, 1,
-0.335251, -0.4113183, -1.890099, 0, 1, 0.2392157, 1,
-0.3310815, 0.1549191, -2.138833, 0, 1, 0.2431373, 1,
-0.329429, 0.3631259, -2.185348, 0, 1, 0.2509804, 1,
-0.3284036, 0.2713589, -0.4224293, 0, 1, 0.254902, 1,
-0.3274004, 1.725152, 0.9532694, 0, 1, 0.2627451, 1,
-0.3219095, -0.7330453, -1.622987, 0, 1, 0.2666667, 1,
-0.3195865, 0.1772602, -1.950286, 0, 1, 0.2745098, 1,
-0.312608, 0.6233574, 0.1376179, 0, 1, 0.2784314, 1,
-0.3096114, 0.8277424, 0.002915632, 0, 1, 0.2862745, 1,
-0.3055241, 0.2057634, -0.6936153, 0, 1, 0.2901961, 1,
-0.3051553, 0.6005214, -1.89595, 0, 1, 0.2980392, 1,
-0.3032568, -0.7055625, -4.545503, 0, 1, 0.3058824, 1,
-0.3009793, 0.7093191, -0.6062, 0, 1, 0.3098039, 1,
-0.3005014, 0.4690081, 0.2965608, 0, 1, 0.3176471, 1,
-0.2999874, 0.5226976, -0.4577218, 0, 1, 0.3215686, 1,
-0.2992932, 0.6175787, 0.103825, 0, 1, 0.3294118, 1,
-0.2948842, 0.7377633, -1.193613, 0, 1, 0.3333333, 1,
-0.2920053, -0.8385139, -1.491941, 0, 1, 0.3411765, 1,
-0.2888595, -0.6690835, -2.266804, 0, 1, 0.345098, 1,
-0.2871314, -0.3310565, -1.817295, 0, 1, 0.3529412, 1,
-0.2860036, 1.817966, -1.243334, 0, 1, 0.3568628, 1,
-0.2801867, -1.506609, -2.910671, 0, 1, 0.3647059, 1,
-0.2753455, -0.4849321, -2.657795, 0, 1, 0.3686275, 1,
-0.2709886, 0.5616279, -2.241644, 0, 1, 0.3764706, 1,
-0.2611632, 0.07232005, -3.903466, 0, 1, 0.3803922, 1,
-0.260083, -0.3638609, -3.372113, 0, 1, 0.3882353, 1,
-0.2494186, 0.9518346, -1.301137, 0, 1, 0.3921569, 1,
-0.2493636, -0.835231, -3.556617, 0, 1, 0.4, 1,
-0.248039, 0.2551704, -1.034248, 0, 1, 0.4078431, 1,
-0.2457899, -0.6555452, -4.074218, 0, 1, 0.4117647, 1,
-0.245368, -0.08792242, -2.299574, 0, 1, 0.4196078, 1,
-0.2439407, 0.5596494, -1.200593, 0, 1, 0.4235294, 1,
-0.2369762, -1.141875, -4.46091, 0, 1, 0.4313726, 1,
-0.2347552, -0.6849071, -2.993398, 0, 1, 0.4352941, 1,
-0.2312009, -1.070696, -2.433632, 0, 1, 0.4431373, 1,
-0.2310731, -0.5393646, -2.845784, 0, 1, 0.4470588, 1,
-0.2293356, -1.838565, -4.290801, 0, 1, 0.454902, 1,
-0.2279713, -0.2148603, -3.198523, 0, 1, 0.4588235, 1,
-0.2275696, 1.341445, 0.08113346, 0, 1, 0.4666667, 1,
-0.2254232, 0.8604283, 0.3455519, 0, 1, 0.4705882, 1,
-0.2247948, -0.9118516, -2.343628, 0, 1, 0.4784314, 1,
-0.2244737, -0.8172974, -2.755972, 0, 1, 0.4823529, 1,
-0.223473, -0.2352602, -2.198311, 0, 1, 0.4901961, 1,
-0.2171981, 1.083502, 0.6393634, 0, 1, 0.4941176, 1,
-0.215791, -0.04940572, -1.905022, 0, 1, 0.5019608, 1,
-0.2147628, -1.228014, -3.013728, 0, 1, 0.509804, 1,
-0.202466, 1.330675, -0.6122353, 0, 1, 0.5137255, 1,
-0.2015938, -1.682391, -3.382294, 0, 1, 0.5215687, 1,
-0.198879, 0.7233456, -1.114407, 0, 1, 0.5254902, 1,
-0.1985427, 0.8378291, -1.504601, 0, 1, 0.5333334, 1,
-0.1913858, 0.8216929, 0.7502997, 0, 1, 0.5372549, 1,
-0.1903242, -1.215423, -1.552466, 0, 1, 0.5450981, 1,
-0.1892753, -1.818825, -4.032228, 0, 1, 0.5490196, 1,
-0.1891399, 0.7814956, -1.105765, 0, 1, 0.5568628, 1,
-0.1889709, 0.165944, -0.1667747, 0, 1, 0.5607843, 1,
-0.188156, 1.385526, -0.3387232, 0, 1, 0.5686275, 1,
-0.1874602, 2.246743, 0.3330568, 0, 1, 0.572549, 1,
-0.1857919, -1.431922, -3.063948, 0, 1, 0.5803922, 1,
-0.1848174, -0.559011, -2.342975, 0, 1, 0.5843138, 1,
-0.1807395, 0.1156734, -2.434802, 0, 1, 0.5921569, 1,
-0.1794493, -0.1919293, -1.12252, 0, 1, 0.5960785, 1,
-0.1789029, 1.915418, 0.3769339, 0, 1, 0.6039216, 1,
-0.1777681, -1.525942, -0.1330935, 0, 1, 0.6117647, 1,
-0.1710816, -0.944976, -2.414519, 0, 1, 0.6156863, 1,
-0.1709585, -0.01732667, -1.817187, 0, 1, 0.6235294, 1,
-0.1658783, 1.402569, 0.7934971, 0, 1, 0.627451, 1,
-0.1649238, -0.1007394, -0.3959311, 0, 1, 0.6352941, 1,
-0.1644778, 1.520406, 0.4752839, 0, 1, 0.6392157, 1,
-0.1589173, -0.3260685, -3.805648, 0, 1, 0.6470588, 1,
-0.1585554, 0.7323971, 1.410482, 0, 1, 0.6509804, 1,
-0.1545797, -2.244436, -3.972571, 0, 1, 0.6588235, 1,
-0.1533402, -1.121708, -1.698977, 0, 1, 0.6627451, 1,
-0.1528423, -0.099352, -3.182817, 0, 1, 0.6705883, 1,
-0.1519353, 0.4962596, 0.2882613, 0, 1, 0.6745098, 1,
-0.1506676, -2.06025, -3.949952, 0, 1, 0.682353, 1,
-0.1489656, -0.6593773, -2.967919, 0, 1, 0.6862745, 1,
-0.1477792, -1.515969, -3.513884, 0, 1, 0.6941177, 1,
-0.1450831, -0.9724842, -2.615689, 0, 1, 0.7019608, 1,
-0.1396035, 0.1757485, -2.935804, 0, 1, 0.7058824, 1,
-0.1334043, 0.7818694, -1.077942, 0, 1, 0.7137255, 1,
-0.1332519, -0.2671806, -2.57074, 0, 1, 0.7176471, 1,
-0.1328552, -1.322739, -3.516853, 0, 1, 0.7254902, 1,
-0.1307084, -0.3663272, -4.329615, 0, 1, 0.7294118, 1,
-0.1298762, -0.8867283, -3.7614, 0, 1, 0.7372549, 1,
-0.1291832, 0.265468, 0.04870043, 0, 1, 0.7411765, 1,
-0.1278792, -0.608938, -1.374798, 0, 1, 0.7490196, 1,
-0.1245195, 0.9097617, -1.705929, 0, 1, 0.7529412, 1,
-0.1235161, -0.3753914, -2.538287, 0, 1, 0.7607843, 1,
-0.1177687, 0.03852049, -1.900758, 0, 1, 0.7647059, 1,
-0.1175779, -2.610254, -1.845137, 0, 1, 0.772549, 1,
-0.1160864, 0.1182586, 1.181002, 0, 1, 0.7764706, 1,
-0.1141386, -1.704761, -2.756489, 0, 1, 0.7843137, 1,
-0.109246, 0.5334272, -0.5622031, 0, 1, 0.7882353, 1,
-0.107874, -1.03525, -0.5705884, 0, 1, 0.7960784, 1,
-0.1032682, 0.6656414, 0.3547801, 0, 1, 0.8039216, 1,
-0.09816611, -0.3599754, -3.261235, 0, 1, 0.8078431, 1,
-0.09734584, -0.7543251, -2.440091, 0, 1, 0.8156863, 1,
-0.0951769, -1.504427, -2.205777, 0, 1, 0.8196079, 1,
-0.09428276, 1.475866, 0.1760048, 0, 1, 0.827451, 1,
-0.09361158, 1.381476, 1.545304, 0, 1, 0.8313726, 1,
-0.0927145, -1.502142, -2.151423, 0, 1, 0.8392157, 1,
-0.09071883, 0.246545, -0.9475132, 0, 1, 0.8431373, 1,
-0.08821556, -0.9915831, -2.716433, 0, 1, 0.8509804, 1,
-0.08677538, -1.709105, -2.698333, 0, 1, 0.854902, 1,
-0.08221748, 0.1567306, 0.05179864, 0, 1, 0.8627451, 1,
-0.08070961, 0.02554564, -1.845261, 0, 1, 0.8666667, 1,
-0.07973632, -0.776618, -2.613018, 0, 1, 0.8745098, 1,
-0.07930715, -0.2669198, -2.389525, 0, 1, 0.8784314, 1,
-0.07858499, -0.7278526, -2.263236, 0, 1, 0.8862745, 1,
-0.07787778, -1.114531, -2.485529, 0, 1, 0.8901961, 1,
-0.07521728, -0.2347818, -2.549999, 0, 1, 0.8980392, 1,
-0.07298401, -0.06152439, -4.088339, 0, 1, 0.9058824, 1,
-0.0726428, 0.4744341, -0.1586635, 0, 1, 0.9098039, 1,
-0.07010274, 1.216889, 0.4197069, 0, 1, 0.9176471, 1,
-0.06796052, -0.3999423, -3.180722, 0, 1, 0.9215686, 1,
-0.06756924, -0.8374215, -2.472551, 0, 1, 0.9294118, 1,
-0.05777948, 1.024719, -0.8983511, 0, 1, 0.9333333, 1,
-0.04525913, -1.64027, -3.485242, 0, 1, 0.9411765, 1,
-0.04160606, 0.7289515, -1.579215, 0, 1, 0.945098, 1,
-0.0395477, -0.2211847, -2.896796, 0, 1, 0.9529412, 1,
-0.03859724, -0.4691567, -2.062151, 0, 1, 0.9568627, 1,
-0.03795883, -0.04826643, -3.071877, 0, 1, 0.9647059, 1,
-0.03440476, 1.320441, 0.4789824, 0, 1, 0.9686275, 1,
-0.03093121, 0.8110324, -1.364851, 0, 1, 0.9764706, 1,
-0.02852177, 1.291425, -0.2307526, 0, 1, 0.9803922, 1,
-0.02836049, 0.04329238, -1.51727, 0, 1, 0.9882353, 1,
-0.02313239, -1.216362, -4.509022, 0, 1, 0.9921569, 1,
-0.02128474, 2.000024, 0.1301798, 0, 1, 1, 1,
-0.01994283, -0.1349117, -2.859944, 0, 0.9921569, 1, 1,
-0.01651401, -0.6464502, -3.826779, 0, 0.9882353, 1, 1,
-0.01594882, 0.7045507, -0.5909103, 0, 0.9803922, 1, 1,
-0.01259714, -0.6127363, -3.216389, 0, 0.9764706, 1, 1,
0.003467284, -0.002572903, 1.867212, 0, 0.9686275, 1, 1,
0.00444725, -1.286321, 3.124533, 0, 0.9647059, 1, 1,
0.004638608, 1.04967, 0.8586088, 0, 0.9568627, 1, 1,
0.007931264, -0.7386974, 3.128894, 0, 0.9529412, 1, 1,
0.01204228, -1.300656, 3.52508, 0, 0.945098, 1, 1,
0.01207615, 0.492847, -0.1030242, 0, 0.9411765, 1, 1,
0.02140096, 1.09395, 0.3917442, 0, 0.9333333, 1, 1,
0.02328838, -1.290743, 3.297953, 0, 0.9294118, 1, 1,
0.02363445, 0.7461447, 0.06639705, 0, 0.9215686, 1, 1,
0.02553916, 0.5846864, -0.09784095, 0, 0.9176471, 1, 1,
0.02607629, 2.005641, -0.9826747, 0, 0.9098039, 1, 1,
0.02656372, 0.7401228, -0.4897594, 0, 0.9058824, 1, 1,
0.03048737, -0.007152414, -0.5329373, 0, 0.8980392, 1, 1,
0.03162094, -1.311573, 3.05297, 0, 0.8901961, 1, 1,
0.03353653, -0.3283814, 1.536642, 0, 0.8862745, 1, 1,
0.03601998, 1.229884, -0.3133918, 0, 0.8784314, 1, 1,
0.03938413, -1.360754, 1.793204, 0, 0.8745098, 1, 1,
0.03941647, -0.4647464, 3.195342, 0, 0.8666667, 1, 1,
0.04115166, 0.6947627, -2.779179, 0, 0.8627451, 1, 1,
0.04281057, -0.3175854, 1.114033, 0, 0.854902, 1, 1,
0.04637859, -0.01190208, 1.66277, 0, 0.8509804, 1, 1,
0.050397, -0.223729, 2.250069, 0, 0.8431373, 1, 1,
0.05349605, -2.407442, 2.073116, 0, 0.8392157, 1, 1,
0.05599576, -0.1436274, 3.267464, 0, 0.8313726, 1, 1,
0.05774869, -1.272864, 3.033309, 0, 0.827451, 1, 1,
0.06131053, -0.2664833, 3.683995, 0, 0.8196079, 1, 1,
0.06147392, -1.283537, 1.433497, 0, 0.8156863, 1, 1,
0.06162253, 0.7681719, 0.3146442, 0, 0.8078431, 1, 1,
0.07017967, -0.1302533, 1.929047, 0, 0.8039216, 1, 1,
0.07164184, 0.6357569, 1.024162, 0, 0.7960784, 1, 1,
0.07655092, -0.2475057, 5.22595, 0, 0.7882353, 1, 1,
0.07662626, 1.757487, -0.4271659, 0, 0.7843137, 1, 1,
0.07668683, -1.784731, 2.076827, 0, 0.7764706, 1, 1,
0.07742286, -0.7236115, 2.801259, 0, 0.772549, 1, 1,
0.07758097, -0.3087341, 2.177023, 0, 0.7647059, 1, 1,
0.07874127, -1.163632, 3.379489, 0, 0.7607843, 1, 1,
0.0789772, 0.892921, -1.136259, 0, 0.7529412, 1, 1,
0.08028774, -0.1256351, 3.020052, 0, 0.7490196, 1, 1,
0.08100143, 0.3962675, 1.095193, 0, 0.7411765, 1, 1,
0.08142043, -0.4755212, 1.911341, 0, 0.7372549, 1, 1,
0.08618072, 0.7976276, 1.073886, 0, 0.7294118, 1, 1,
0.08715146, 0.09799001, 0.8478314, 0, 0.7254902, 1, 1,
0.08946164, -0.8971298, 2.3318, 0, 0.7176471, 1, 1,
0.09064244, 0.08024652, 0.653998, 0, 0.7137255, 1, 1,
0.0919552, 0.8470423, 0.1898751, 0, 0.7058824, 1, 1,
0.09358798, 0.6101466, 1.026326, 0, 0.6980392, 1, 1,
0.09473675, 0.3216681, 0.7106772, 0, 0.6941177, 1, 1,
0.0978284, 0.2681348, -1.125574, 0, 0.6862745, 1, 1,
0.1044484, -0.875393, 3.097321, 0, 0.682353, 1, 1,
0.1060706, 0.04837158, 2.90845, 0, 0.6745098, 1, 1,
0.1084578, -0.5595583, 3.05277, 0, 0.6705883, 1, 1,
0.1091646, -1.065069, 3.843841, 0, 0.6627451, 1, 1,
0.1121657, 0.7140027, 0.5117672, 0, 0.6588235, 1, 1,
0.1131617, 0.1192174, 0.7595109, 0, 0.6509804, 1, 1,
0.1180213, -0.2282401, 3.425326, 0, 0.6470588, 1, 1,
0.11803, -1.964052, 3.226428, 0, 0.6392157, 1, 1,
0.1214499, -0.3512557, 2.46174, 0, 0.6352941, 1, 1,
0.1223489, -0.9861636, 2.970673, 0, 0.627451, 1, 1,
0.1276102, 0.921478, -1.218271, 0, 0.6235294, 1, 1,
0.1283575, 0.09658463, 0.8178464, 0, 0.6156863, 1, 1,
0.1298213, 0.732991, 0.2063054, 0, 0.6117647, 1, 1,
0.1299677, 0.5797948, 0.5640395, 0, 0.6039216, 1, 1,
0.1325919, -1.201434, 2.814324, 0, 0.5960785, 1, 1,
0.1335879, -0.2593113, 3.956116, 0, 0.5921569, 1, 1,
0.1349774, -0.9781652, 3.856291, 0, 0.5843138, 1, 1,
0.135697, 0.6723832, 0.4591861, 0, 0.5803922, 1, 1,
0.1380185, -1.255807, 4.437988, 0, 0.572549, 1, 1,
0.138962, -0.8517385, 3.337727, 0, 0.5686275, 1, 1,
0.140066, -0.1374365, 1.737954, 0, 0.5607843, 1, 1,
0.1414959, 0.7365954, 1.225742, 0, 0.5568628, 1, 1,
0.1441511, 0.4617071, -1.576344, 0, 0.5490196, 1, 1,
0.1471871, -0.5313051, 2.370381, 0, 0.5450981, 1, 1,
0.1477816, -1.159685, 5.195201, 0, 0.5372549, 1, 1,
0.1493785, 0.7818831, 0.733127, 0, 0.5333334, 1, 1,
0.1531189, 0.9977007, -0.5870559, 0, 0.5254902, 1, 1,
0.1538268, -0.4306361, 3.094392, 0, 0.5215687, 1, 1,
0.1564985, -1.073809, 3.62064, 0, 0.5137255, 1, 1,
0.1570022, 0.9811838, 0.8275818, 0, 0.509804, 1, 1,
0.1573573, -0.4189169, 2.506163, 0, 0.5019608, 1, 1,
0.1635327, -0.5872833, 2.569821, 0, 0.4941176, 1, 1,
0.1635642, 0.1246212, 0.972881, 0, 0.4901961, 1, 1,
0.1767839, 0.01704093, 1.843568, 0, 0.4823529, 1, 1,
0.1775231, -0.1015019, 1.360748, 0, 0.4784314, 1, 1,
0.1820872, 1.303729, 1.607092, 0, 0.4705882, 1, 1,
0.1861364, 0.07268395, 0.2612907, 0, 0.4666667, 1, 1,
0.1872671, 0.03544698, 1.160083, 0, 0.4588235, 1, 1,
0.1883431, -0.04847145, 0.7458525, 0, 0.454902, 1, 1,
0.1921073, -0.7785424, 3.801375, 0, 0.4470588, 1, 1,
0.1927025, 0.07962573, 1.160427, 0, 0.4431373, 1, 1,
0.1975534, -0.8068419, 5.006263, 0, 0.4352941, 1, 1,
0.1976784, -1.991059, 3.942026, 0, 0.4313726, 1, 1,
0.1985592, -0.4317334, 2.647368, 0, 0.4235294, 1, 1,
0.201778, -0.7848952, 4.118267, 0, 0.4196078, 1, 1,
0.2032631, 1.195583, 0.2083492, 0, 0.4117647, 1, 1,
0.2077732, -0.855495, 1.658757, 0, 0.4078431, 1, 1,
0.2085044, -0.2421668, 2.435526, 0, 0.4, 1, 1,
0.2113138, 1.110905, -0.6818718, 0, 0.3921569, 1, 1,
0.2152202, -0.4549446, 3.072072, 0, 0.3882353, 1, 1,
0.2162592, 0.1823565, 1.042318, 0, 0.3803922, 1, 1,
0.2175439, -0.8548581, 2.156381, 0, 0.3764706, 1, 1,
0.2183894, 0.5577091, 0.9452781, 0, 0.3686275, 1, 1,
0.2201284, -1.236754, 5.151577, 0, 0.3647059, 1, 1,
0.2208742, -0.05460931, 2.522194, 0, 0.3568628, 1, 1,
0.2231473, 0.1801431, -0.1484136, 0, 0.3529412, 1, 1,
0.2279298, -0.04606096, 1.930063, 0, 0.345098, 1, 1,
0.2315249, -1.455336, 1.620143, 0, 0.3411765, 1, 1,
0.2324869, -0.7917467, 1.184242, 0, 0.3333333, 1, 1,
0.2350201, 2.090462, -0.7691301, 0, 0.3294118, 1, 1,
0.2362738, 0.4433407, 1.256591, 0, 0.3215686, 1, 1,
0.2446505, -0.396811, 3.003913, 0, 0.3176471, 1, 1,
0.2447781, -1.456252, 1.697229, 0, 0.3098039, 1, 1,
0.2452688, -0.8187881, 2.143554, 0, 0.3058824, 1, 1,
0.249151, -0.1613949, 1.629153, 0, 0.2980392, 1, 1,
0.250155, 0.3365521, -1.344309, 0, 0.2901961, 1, 1,
0.2502576, 1.534656, -0.5774199, 0, 0.2862745, 1, 1,
0.252738, -0.3503701, 1.336737, 0, 0.2784314, 1, 1,
0.2547343, -1.540946, 3.831446, 0, 0.2745098, 1, 1,
0.2549011, -0.008261044, -0.2309884, 0, 0.2666667, 1, 1,
0.2582361, -0.1206627, 1.065121, 0, 0.2627451, 1, 1,
0.2601407, 0.1524218, -0.1028853, 0, 0.254902, 1, 1,
0.2643704, -0.8040344, 2.859047, 0, 0.2509804, 1, 1,
0.264389, -0.9090464, 2.824748, 0, 0.2431373, 1, 1,
0.2646116, -0.5630687, 1.367869, 0, 0.2392157, 1, 1,
0.2649101, 1.017693, -0.9469296, 0, 0.2313726, 1, 1,
0.2767167, 1.355851, 0.3997942, 0, 0.227451, 1, 1,
0.2777347, -0.7618895, 4.181015, 0, 0.2196078, 1, 1,
0.2780626, -0.3474599, 1.891101, 0, 0.2156863, 1, 1,
0.2784641, 0.8909071, 0.2039944, 0, 0.2078431, 1, 1,
0.2801325, 0.4703365, 0.8931287, 0, 0.2039216, 1, 1,
0.2804302, 0.2670435, 0.4382555, 0, 0.1960784, 1, 1,
0.2855975, 1.217887, 1.331101, 0, 0.1882353, 1, 1,
0.2922871, -0.9883602, 2.364637, 0, 0.1843137, 1, 1,
0.2969056, 0.5762104, 0.173315, 0, 0.1764706, 1, 1,
0.2969897, 1.086931, 1.246975, 0, 0.172549, 1, 1,
0.3013553, -0.1458776, -0.3306824, 0, 0.1647059, 1, 1,
0.3022828, -0.1993741, 1.384919, 0, 0.1607843, 1, 1,
0.3040586, 0.2248535, 1.346112, 0, 0.1529412, 1, 1,
0.3067129, -0.6914077, 3.12233, 0, 0.1490196, 1, 1,
0.311253, -2.035895, 3.151515, 0, 0.1411765, 1, 1,
0.3141268, 0.2085448, 0.7792305, 0, 0.1372549, 1, 1,
0.3158843, -1.399694, 3.696426, 0, 0.1294118, 1, 1,
0.3205844, -1.237416, 3.521883, 0, 0.1254902, 1, 1,
0.3269966, 0.8378766, 2.07634, 0, 0.1176471, 1, 1,
0.3303817, -0.6760154, 2.125797, 0, 0.1137255, 1, 1,
0.337468, 0.3136313, 1.584851, 0, 0.1058824, 1, 1,
0.3395034, 0.2196344, 0.3248892, 0, 0.09803922, 1, 1,
0.3433953, -1.455642, 3.050866, 0, 0.09411765, 1, 1,
0.3478306, 0.2261398, 1.947891, 0, 0.08627451, 1, 1,
0.3484844, 0.4397402, 1.765694, 0, 0.08235294, 1, 1,
0.3499061, -0.4959944, 2.696394, 0, 0.07450981, 1, 1,
0.3543632, -1.241732, 3.908759, 0, 0.07058824, 1, 1,
0.3546228, 0.3550456, -0.442534, 0, 0.0627451, 1, 1,
0.3550257, -0.1617733, 2.503006, 0, 0.05882353, 1, 1,
0.3584442, 1.270913, 0.501761, 0, 0.05098039, 1, 1,
0.3585259, -0.1376741, 2.046704, 0, 0.04705882, 1, 1,
0.359005, 0.1037671, 1.645762, 0, 0.03921569, 1, 1,
0.3696618, 1.541004, -0.5959781, 0, 0.03529412, 1, 1,
0.3722503, -1.705778, 4.912064, 0, 0.02745098, 1, 1,
0.3758763, 0.1432409, 1.028975, 0, 0.02352941, 1, 1,
0.3777139, 0.6362381, -0.04525989, 0, 0.01568628, 1, 1,
0.37929, 1.441327, -0.2083787, 0, 0.01176471, 1, 1,
0.3807523, -1.270096, 3.84548, 0, 0.003921569, 1, 1,
0.38178, -0.2253302, 2.531528, 0.003921569, 0, 1, 1,
0.382954, 0.4235277, 0.59378, 0.007843138, 0, 1, 1,
0.3855438, -1.628506, 2.93146, 0.01568628, 0, 1, 1,
0.3915275, 0.4306258, 0.8763023, 0.01960784, 0, 1, 1,
0.3926498, 0.2581753, -0.3576655, 0.02745098, 0, 1, 1,
0.3945395, -0.1443939, 1.645758, 0.03137255, 0, 1, 1,
0.3965211, -0.2804098, 0.6434773, 0.03921569, 0, 1, 1,
0.3991138, 0.09177518, 1.869377, 0.04313726, 0, 1, 1,
0.399169, -0.1700802, 2.829607, 0.05098039, 0, 1, 1,
0.4005175, -1.235191, 3.902052, 0.05490196, 0, 1, 1,
0.4022758, -1.010692, 4.227155, 0.0627451, 0, 1, 1,
0.406472, 0.5482168, 0.8948355, 0.06666667, 0, 1, 1,
0.4083233, 0.1779371, 2.019046, 0.07450981, 0, 1, 1,
0.4108893, -0.5108861, 1.477399, 0.07843138, 0, 1, 1,
0.4110147, -0.03447203, -0.8452459, 0.08627451, 0, 1, 1,
0.4126576, -0.8605698, 4.43207, 0.09019608, 0, 1, 1,
0.4126899, -2.914092, 3.401906, 0.09803922, 0, 1, 1,
0.4165012, -0.6116467, 1.793807, 0.1058824, 0, 1, 1,
0.4223064, -1.19088, 1.536688, 0.1098039, 0, 1, 1,
0.423125, -0.1124611, 1.967471, 0.1176471, 0, 1, 1,
0.4242099, 0.3208036, 3.05706, 0.1215686, 0, 1, 1,
0.4276412, -1.270064, 3.841077, 0.1294118, 0, 1, 1,
0.4313318, -0.4925202, 1.281299, 0.1333333, 0, 1, 1,
0.4333929, -0.3252125, 3.311389, 0.1411765, 0, 1, 1,
0.4345703, 0.01409259, -0.2511103, 0.145098, 0, 1, 1,
0.4352536, -0.7520198, 2.413395, 0.1529412, 0, 1, 1,
0.4368735, -0.5471456, 2.281635, 0.1568628, 0, 1, 1,
0.4371381, 0.434416, 2.628999, 0.1647059, 0, 1, 1,
0.4403687, 1.389156, 0.6951599, 0.1686275, 0, 1, 1,
0.446657, 0.9877993, 0.86224, 0.1764706, 0, 1, 1,
0.4469825, -1.020179, 2.519181, 0.1803922, 0, 1, 1,
0.4515103, -1.454193, 2.47907, 0.1882353, 0, 1, 1,
0.4529077, -0.4346861, 2.405206, 0.1921569, 0, 1, 1,
0.4530914, 0.9973906, 1.868088, 0.2, 0, 1, 1,
0.4554548, -0.4107015, 3.594324, 0.2078431, 0, 1, 1,
0.4589344, 0.4358938, -0.7870839, 0.2117647, 0, 1, 1,
0.4603468, 0.5055181, 0.3062074, 0.2196078, 0, 1, 1,
0.4623566, 0.4104386, 2.632674, 0.2235294, 0, 1, 1,
0.4646471, 0.4566624, 1.245904, 0.2313726, 0, 1, 1,
0.4716059, 0.9397135, 0.4832404, 0.2352941, 0, 1, 1,
0.4717865, 1.019096, 0.5899938, 0.2431373, 0, 1, 1,
0.4747016, -0.2315286, 2.537309, 0.2470588, 0, 1, 1,
0.477934, -0.7754172, 2.792857, 0.254902, 0, 1, 1,
0.4812462, 0.2589244, 1.461163, 0.2588235, 0, 1, 1,
0.4859783, -0.4524023, 4.267163, 0.2666667, 0, 1, 1,
0.4870854, 0.7617532, -0.07387086, 0.2705882, 0, 1, 1,
0.4889436, -0.9318127, 1.919676, 0.2784314, 0, 1, 1,
0.4911223, 1.639894, -1.990427, 0.282353, 0, 1, 1,
0.4949181, 1.142835, 0.1409265, 0.2901961, 0, 1, 1,
0.5028146, 1.332282, 0.7076418, 0.2941177, 0, 1, 1,
0.5086148, -0.001873929, 1.794153, 0.3019608, 0, 1, 1,
0.510325, 1.338251, -0.4043303, 0.3098039, 0, 1, 1,
0.511422, -0.9038575, 3.593498, 0.3137255, 0, 1, 1,
0.5142881, -0.5699683, 3.598983, 0.3215686, 0, 1, 1,
0.5148677, 0.378342, -0.1218614, 0.3254902, 0, 1, 1,
0.5190873, 0.4631211, 1.397364, 0.3333333, 0, 1, 1,
0.5249473, 1.109411, 1.478563, 0.3372549, 0, 1, 1,
0.5252763, -0.2164483, 2.076195, 0.345098, 0, 1, 1,
0.5263166, -0.07551356, 1.120708, 0.3490196, 0, 1, 1,
0.530046, -0.5201861, 2.644813, 0.3568628, 0, 1, 1,
0.5345784, 0.9973713, 2.048397, 0.3607843, 0, 1, 1,
0.535327, 0.5269805, 1.568659, 0.3686275, 0, 1, 1,
0.5392929, -1.005418, 1.087668, 0.372549, 0, 1, 1,
0.5476405, 1.690678, 0.3452302, 0.3803922, 0, 1, 1,
0.5536519, 0.8600324, 0.4734817, 0.3843137, 0, 1, 1,
0.5541458, 0.9019181, -0.71069, 0.3921569, 0, 1, 1,
0.5591402, -1.213554, 3.499964, 0.3960784, 0, 1, 1,
0.5597522, 0.09406294, 2.52722, 0.4039216, 0, 1, 1,
0.5625132, -1.327138, 3.479407, 0.4117647, 0, 1, 1,
0.5643129, -0.4782886, 2.456335, 0.4156863, 0, 1, 1,
0.5671754, 0.3772354, 2.990773, 0.4235294, 0, 1, 1,
0.5720252, 1.005711, 0.6356596, 0.427451, 0, 1, 1,
0.5855455, -0.334639, 2.598048, 0.4352941, 0, 1, 1,
0.5873369, -0.9299764, 4.139609, 0.4392157, 0, 1, 1,
0.5901569, -0.8703862, 2.197834, 0.4470588, 0, 1, 1,
0.5937263, 0.4118499, 0.9755714, 0.4509804, 0, 1, 1,
0.5974554, -0.5004202, 4.225902, 0.4588235, 0, 1, 1,
0.6043321, 1.381288, -0.3848319, 0.4627451, 0, 1, 1,
0.6044157, 0.4322347, 0.8180672, 0.4705882, 0, 1, 1,
0.6050884, -0.8820651, 1.980852, 0.4745098, 0, 1, 1,
0.6053256, -0.5783091, 1.847783, 0.4823529, 0, 1, 1,
0.6054811, -0.5020127, 2.738911, 0.4862745, 0, 1, 1,
0.6106696, 0.7446197, 0.007759871, 0.4941176, 0, 1, 1,
0.6112115, 0.360179, 0.9509307, 0.5019608, 0, 1, 1,
0.6114245, 0.8264458, -0.9973873, 0.5058824, 0, 1, 1,
0.6118198, 0.1347884, 1.403386, 0.5137255, 0, 1, 1,
0.6134304, -0.7643669, 2.965587, 0.5176471, 0, 1, 1,
0.6135673, 1.075628, 1.426481, 0.5254902, 0, 1, 1,
0.6141164, -1.298162, 1.711913, 0.5294118, 0, 1, 1,
0.6184725, -0.5142428, 3.323876, 0.5372549, 0, 1, 1,
0.6207102, 1.331878, 1.363497, 0.5411765, 0, 1, 1,
0.6222647, 0.9486399, 0.9879595, 0.5490196, 0, 1, 1,
0.624303, -0.3166594, 1.899307, 0.5529412, 0, 1, 1,
0.6253935, 0.5383417, 1.156584, 0.5607843, 0, 1, 1,
0.627188, 0.05813232, 0.4173972, 0.5647059, 0, 1, 1,
0.6274087, -1.013539, 0.8431774, 0.572549, 0, 1, 1,
0.6288573, 0.9591278, -0.1446136, 0.5764706, 0, 1, 1,
0.6295174, -1.236229, 3.023719, 0.5843138, 0, 1, 1,
0.6417098, 2.237979, -0.4541359, 0.5882353, 0, 1, 1,
0.6555321, 0.9734061, 0.9636663, 0.5960785, 0, 1, 1,
0.6560531, -0.7149087, 3.669444, 0.6039216, 0, 1, 1,
0.6566408, 0.5233249, 0.6271532, 0.6078432, 0, 1, 1,
0.6591725, -1.211649, 4.116637, 0.6156863, 0, 1, 1,
0.6604773, 1.150363, 1.636492, 0.6196079, 0, 1, 1,
0.6609656, 2.091297, -0.171354, 0.627451, 0, 1, 1,
0.6628571, 1.135774, 2.712989, 0.6313726, 0, 1, 1,
0.6707201, 0.7258246, 0.9025804, 0.6392157, 0, 1, 1,
0.6740212, -0.7476204, 2.82035, 0.6431373, 0, 1, 1,
0.675845, 0.1286037, 2.795604, 0.6509804, 0, 1, 1,
0.6791562, -0.07506011, 1.546497, 0.654902, 0, 1, 1,
0.6796051, -0.1397991, 0.2866842, 0.6627451, 0, 1, 1,
0.6796445, -0.06892267, 0.580206, 0.6666667, 0, 1, 1,
0.6798345, -0.4458316, 0.5422139, 0.6745098, 0, 1, 1,
0.6825205, 0.7232016, 2.422926, 0.6784314, 0, 1, 1,
0.6836296, -1.1309, 3.644751, 0.6862745, 0, 1, 1,
0.6859815, 1.713227, 0.5970505, 0.6901961, 0, 1, 1,
0.6863207, 1.389718, -0.8858948, 0.6980392, 0, 1, 1,
0.6876742, 0.4765319, 0.1587244, 0.7058824, 0, 1, 1,
0.6900128, -0.5071106, 1.801265, 0.7098039, 0, 1, 1,
0.6965029, 0.0896605, -0.9029154, 0.7176471, 0, 1, 1,
0.6969464, -0.573643, 2.421071, 0.7215686, 0, 1, 1,
0.6988436, 1.366055, 0.215973, 0.7294118, 0, 1, 1,
0.6990839, -1.22421, 4.240293, 0.7333333, 0, 1, 1,
0.6991335, -0.3096314, 0.9684607, 0.7411765, 0, 1, 1,
0.703669, 0.6743277, 0.6504797, 0.7450981, 0, 1, 1,
0.7161739, -1.405627, 3.02942, 0.7529412, 0, 1, 1,
0.7248154, 0.5759608, 0.0477882, 0.7568628, 0, 1, 1,
0.728851, -0.07666349, 1.246199, 0.7647059, 0, 1, 1,
0.7290043, -1.822268, 2.130919, 0.7686275, 0, 1, 1,
0.7292528, -0.3161686, 3.836444, 0.7764706, 0, 1, 1,
0.7338684, 0.7186315, -0.01523517, 0.7803922, 0, 1, 1,
0.7391461, -1.420027, 2.686093, 0.7882353, 0, 1, 1,
0.7399396, -0.3793705, 2.967956, 0.7921569, 0, 1, 1,
0.7419586, -1.020743, 1.855758, 0.8, 0, 1, 1,
0.7427159, 0.1216069, 1.157251, 0.8078431, 0, 1, 1,
0.7469074, 0.0300185, 2.245675, 0.8117647, 0, 1, 1,
0.7561018, 0.6553121, 1.097215, 0.8196079, 0, 1, 1,
0.7562504, 0.01207802, 2.48762, 0.8235294, 0, 1, 1,
0.7600687, 0.3113796, -0.490961, 0.8313726, 0, 1, 1,
0.7629693, -1.106567, 1.876886, 0.8352941, 0, 1, 1,
0.7710581, 1.130134, 0.726094, 0.8431373, 0, 1, 1,
0.7741186, -1.071434, 2.51355, 0.8470588, 0, 1, 1,
0.7798321, -0.6764324, 2.420095, 0.854902, 0, 1, 1,
0.7827231, 0.9305049, -0.2586583, 0.8588235, 0, 1, 1,
0.7917759, 1.361596, 0.5054768, 0.8666667, 0, 1, 1,
0.7962099, 0.3402785, -0.5606563, 0.8705882, 0, 1, 1,
0.7995906, 2.231928, 0.695757, 0.8784314, 0, 1, 1,
0.8069995, -0.7357346, 1.630774, 0.8823529, 0, 1, 1,
0.8168555, -0.3006888, 2.929977, 0.8901961, 0, 1, 1,
0.8233504, -1.225236, 2.217815, 0.8941177, 0, 1, 1,
0.825143, -1.417007, 2.91537, 0.9019608, 0, 1, 1,
0.8258913, 0.5877982, -0.4987207, 0.9098039, 0, 1, 1,
0.8302568, 1.382668, 0.3743249, 0.9137255, 0, 1, 1,
0.8318358, -0.8144727, 1.756327, 0.9215686, 0, 1, 1,
0.8388923, 1.680308, 1.409686, 0.9254902, 0, 1, 1,
0.840685, 0.857459, 1.526501, 0.9333333, 0, 1, 1,
0.8410332, 0.5551696, 1.979825, 0.9372549, 0, 1, 1,
0.8432277, -0.04545321, 1.858451, 0.945098, 0, 1, 1,
0.8509849, 0.1258154, 1.934579, 0.9490196, 0, 1, 1,
0.86567, -0.1262006, 1.55377, 0.9568627, 0, 1, 1,
0.8673227, 0.1725507, 3.178995, 0.9607843, 0, 1, 1,
0.8719597, 1.005352, 1.291393, 0.9686275, 0, 1, 1,
0.8721451, -1.608778, 2.964744, 0.972549, 0, 1, 1,
0.8757849, -0.8810051, 2.537432, 0.9803922, 0, 1, 1,
0.8848412, -0.4129418, 3.280044, 0.9843137, 0, 1, 1,
0.8871045, 0.3770497, 1.429171, 0.9921569, 0, 1, 1,
0.8874827, 0.04122798, 3.35212, 0.9960784, 0, 1, 1,
0.9000469, 0.7660697, 0.4491829, 1, 0, 0.9960784, 1,
0.9009167, 0.1742571, 0.7842544, 1, 0, 0.9882353, 1,
0.9020212, -1.248186, 2.549978, 1, 0, 0.9843137, 1,
0.9055675, 0.7546306, 0.7058498, 1, 0, 0.9764706, 1,
0.9099219, -0.9921791, 4.037666, 1, 0, 0.972549, 1,
0.9205983, -0.8689691, 4.753917, 1, 0, 0.9647059, 1,
0.9252689, 1.185771, -0.4720694, 1, 0, 0.9607843, 1,
0.9298034, -0.3475519, 1.88883, 1, 0, 0.9529412, 1,
0.9302236, -1.90479, 2.586071, 1, 0, 0.9490196, 1,
0.9325374, -0.6663062, 1.624714, 1, 0, 0.9411765, 1,
0.9379901, 0.6190858, 2.566751, 1, 0, 0.9372549, 1,
0.9512819, 0.9079092, 1.228876, 1, 0, 0.9294118, 1,
0.9513249, 0.02054371, 1.74028, 1, 0, 0.9254902, 1,
0.9542288, -0.568128, 3.722112, 1, 0, 0.9176471, 1,
0.9607168, -0.02416376, 2.580624, 1, 0, 0.9137255, 1,
0.9740881, -0.4111519, 1.638904, 1, 0, 0.9058824, 1,
0.9765168, -0.01625228, 2.767776, 1, 0, 0.9019608, 1,
0.9825813, -0.7113657, 1.635243, 1, 0, 0.8941177, 1,
0.9842597, 1.549558, 0.5610906, 1, 0, 0.8862745, 1,
0.9950876, -0.7277471, 0.1518397, 1, 0, 0.8823529, 1,
0.9955971, -0.6529029, 2.338353, 1, 0, 0.8745098, 1,
0.9988869, 1.495355, 0.1808539, 1, 0, 0.8705882, 1,
1.001388, -0.4657039, 2.477012, 1, 0, 0.8627451, 1,
1.002558, -0.4029519, 1.330292, 1, 0, 0.8588235, 1,
1.003547, 1.713892, 0.2574184, 1, 0, 0.8509804, 1,
1.014107, -0.5338421, 1.24368, 1, 0, 0.8470588, 1,
1.017368, -1.701644, 1.238481, 1, 0, 0.8392157, 1,
1.035635, 0.8849669, 1.547358, 1, 0, 0.8352941, 1,
1.038035, -2.192221, 3.681324, 1, 0, 0.827451, 1,
1.040304, -1.3941, 3.364119, 1, 0, 0.8235294, 1,
1.048521, -0.2491789, 3.12174, 1, 0, 0.8156863, 1,
1.049686, -0.7563118, 2.266117, 1, 0, 0.8117647, 1,
1.049837, -1.165469, 1.831088, 1, 0, 0.8039216, 1,
1.054513, 0.8247811, 2.380601, 1, 0, 0.7960784, 1,
1.062973, -0.8023014, 2.597438, 1, 0, 0.7921569, 1,
1.067195, -0.6581975, 3.3277, 1, 0, 0.7843137, 1,
1.079666, 0.8639565, 0.9886096, 1, 0, 0.7803922, 1,
1.082963, 0.2911702, 3.275913, 1, 0, 0.772549, 1,
1.084515, 1.322204, 1.668263, 1, 0, 0.7686275, 1,
1.09373, -2.516194, 2.170501, 1, 0, 0.7607843, 1,
1.106271, 0.1476195, 2.351511, 1, 0, 0.7568628, 1,
1.110175, 0.4713903, 1.729014, 1, 0, 0.7490196, 1,
1.11553, -0.1670593, 0.4189651, 1, 0, 0.7450981, 1,
1.121799, -0.07309862, 0.2403415, 1, 0, 0.7372549, 1,
1.1239, -1.73374, 2.872331, 1, 0, 0.7333333, 1,
1.133751, -0.8381273, 2.808174, 1, 0, 0.7254902, 1,
1.135894, 0.185898, 1.811168, 1, 0, 0.7215686, 1,
1.136683, 0.9025581, 1.962471, 1, 0, 0.7137255, 1,
1.137571, 0.482694, 1.421145, 1, 0, 0.7098039, 1,
1.142509, -1.313177, 3.134794, 1, 0, 0.7019608, 1,
1.149751, -1.137315, 1.790931, 1, 0, 0.6941177, 1,
1.16747, 0.06890486, 0.5532516, 1, 0, 0.6901961, 1,
1.168214, 0.6343417, 0.2332097, 1, 0, 0.682353, 1,
1.169657, -0.4214027, 1.568089, 1, 0, 0.6784314, 1,
1.1876, -0.6415793, 2.403426, 1, 0, 0.6705883, 1,
1.188602, 0.08327367, 0.5093103, 1, 0, 0.6666667, 1,
1.191649, 0.02581171, -0.6511987, 1, 0, 0.6588235, 1,
1.198025, -1.544954, 1.71215, 1, 0, 0.654902, 1,
1.212872, -0.4488245, 2.096463, 1, 0, 0.6470588, 1,
1.216318, 0.1492862, 0.8139355, 1, 0, 0.6431373, 1,
1.220969, -0.8449385, 1.440465, 1, 0, 0.6352941, 1,
1.222786, 1.642034, 0.4414372, 1, 0, 0.6313726, 1,
1.227557, -0.1879176, 1.782674, 1, 0, 0.6235294, 1,
1.227795, 1.074631, 0.5149937, 1, 0, 0.6196079, 1,
1.228778, 1.377552, 1.957496, 1, 0, 0.6117647, 1,
1.239422, -1.545657, 0.5650904, 1, 0, 0.6078432, 1,
1.243783, -1.124613, 2.838528, 1, 0, 0.6, 1,
1.244313, 0.6000564, 0.442632, 1, 0, 0.5921569, 1,
1.247929, -0.7144777, 1.351317, 1, 0, 0.5882353, 1,
1.251442, -0.1721716, 3.320038, 1, 0, 0.5803922, 1,
1.251789, 0.2152909, 1.106112, 1, 0, 0.5764706, 1,
1.252827, 0.5103458, 1.351402, 1, 0, 0.5686275, 1,
1.25946, 1.343117, 0.3893386, 1, 0, 0.5647059, 1,
1.264335, -0.2725124, 2.448788, 1, 0, 0.5568628, 1,
1.270674, 0.03266969, 0.9978628, 1, 0, 0.5529412, 1,
1.27443, -0.1331544, 0.4769192, 1, 0, 0.5450981, 1,
1.283266, -2.027948, 2.076618, 1, 0, 0.5411765, 1,
1.287003, 2.236353, -1.098783, 1, 0, 0.5333334, 1,
1.288014, -0.3178065, 3.487736, 1, 0, 0.5294118, 1,
1.288876, 1.563751, 1.12357, 1, 0, 0.5215687, 1,
1.292275, -1.28405, 1.840089, 1, 0, 0.5176471, 1,
1.296144, 0.3181379, 0.9986714, 1, 0, 0.509804, 1,
1.298181, 0.7169244, 2.146682, 1, 0, 0.5058824, 1,
1.32335, -2.053571, 2.848456, 1, 0, 0.4980392, 1,
1.333466, -0.7066602, 2.574002, 1, 0, 0.4901961, 1,
1.338515, 1.854053, 0.3733198, 1, 0, 0.4862745, 1,
1.338998, 1.004268, 1.241466, 1, 0, 0.4784314, 1,
1.344886, -0.8218609, 3.05668, 1, 0, 0.4745098, 1,
1.345199, -1.010694, 1.288476, 1, 0, 0.4666667, 1,
1.374951, 0.01248677, 1.417601, 1, 0, 0.4627451, 1,
1.382829, -0.8797775, 3.486205, 1, 0, 0.454902, 1,
1.391736, 0.623419, 0.2433791, 1, 0, 0.4509804, 1,
1.395928, 0.06067066, 0.7889428, 1, 0, 0.4431373, 1,
1.396493, 0.5531898, 2.365556, 1, 0, 0.4392157, 1,
1.404763, -0.7262428, 3.357174, 1, 0, 0.4313726, 1,
1.410733, 0.1781162, 0.1934381, 1, 0, 0.427451, 1,
1.412347, 0.4569592, 1.585818, 1, 0, 0.4196078, 1,
1.416711, 0.244407, 1.68963, 1, 0, 0.4156863, 1,
1.420918, -1.769864, 2.725528, 1, 0, 0.4078431, 1,
1.424708, -1.166383, 2.478602, 1, 0, 0.4039216, 1,
1.433747, 0.3243831, 1.405686, 1, 0, 0.3960784, 1,
1.436311, 2.0123, 0.6475307, 1, 0, 0.3882353, 1,
1.450356, 0.6244864, 0.203264, 1, 0, 0.3843137, 1,
1.466125, 0.8966665, 1.255281, 1, 0, 0.3764706, 1,
1.468425, -1.265636, 2.445166, 1, 0, 0.372549, 1,
1.469506, -0.4807736, 2.297487, 1, 0, 0.3647059, 1,
1.479815, 1.074217, 1.145003, 1, 0, 0.3607843, 1,
1.486144, -0.2615941, 1.670545, 1, 0, 0.3529412, 1,
1.50751, 0.1772359, 0.484164, 1, 0, 0.3490196, 1,
1.511961, -0.2382215, 1.968989, 1, 0, 0.3411765, 1,
1.528111, -1.075256, 1.828703, 1, 0, 0.3372549, 1,
1.539014, -0.466922, 1.066925, 1, 0, 0.3294118, 1,
1.545184, -1.302991, 3.025715, 1, 0, 0.3254902, 1,
1.568611, 0.4778959, 2.542078, 1, 0, 0.3176471, 1,
1.569768, -0.07218812, 0.1830056, 1, 0, 0.3137255, 1,
1.576058, -0.7308984, 1.184508, 1, 0, 0.3058824, 1,
1.583497, -0.3050064, 1.876418, 1, 0, 0.2980392, 1,
1.591304, -0.4747702, 1.146212, 1, 0, 0.2941177, 1,
1.591492, -0.1182567, 2.863763, 1, 0, 0.2862745, 1,
1.601212, -0.2361806, 2.190236, 1, 0, 0.282353, 1,
1.607399, -0.6952215, 0.1041225, 1, 0, 0.2745098, 1,
1.613281, -0.8201876, 1.597896, 1, 0, 0.2705882, 1,
1.614999, -0.0555433, 2.718183, 1, 0, 0.2627451, 1,
1.620533, 2.14566, 0.7089205, 1, 0, 0.2588235, 1,
1.621506, 0.4330485, 0.8177381, 1, 0, 0.2509804, 1,
1.623601, 0.5985427, -1.169648, 1, 0, 0.2470588, 1,
1.625288, 1.255931, 1.398604, 1, 0, 0.2392157, 1,
1.665073, 2.052273, 2.221397, 1, 0, 0.2352941, 1,
1.668087, -1.521661, 4.347147, 1, 0, 0.227451, 1,
1.681563, -0.6485327, 2.380934, 1, 0, 0.2235294, 1,
1.683423, 0.3762856, -0.1619341, 1, 0, 0.2156863, 1,
1.710222, -0.5463752, 3.489183, 1, 0, 0.2117647, 1,
1.71864, 0.1785512, 1.787042, 1, 0, 0.2039216, 1,
1.720026, 0.1444668, 0.7635431, 1, 0, 0.1960784, 1,
1.724954, -0.8457901, 2.753354, 1, 0, 0.1921569, 1,
1.801895, 0.6883191, -0.4736871, 1, 0, 0.1843137, 1,
1.815479, -1.057431, 1.720928, 1, 0, 0.1803922, 1,
1.82884, 0.8023218, -0.2298522, 1, 0, 0.172549, 1,
1.834915, 0.8550099, 1.389549, 1, 0, 0.1686275, 1,
1.845931, 1.086534, 0.6827339, 1, 0, 0.1607843, 1,
1.852185, 1.920281, -0.5356678, 1, 0, 0.1568628, 1,
1.85226, 0.9714142, 2.649837, 1, 0, 0.1490196, 1,
1.879488, -0.5698699, 3.405448, 1, 0, 0.145098, 1,
1.921946, -0.7576566, 2.593102, 1, 0, 0.1372549, 1,
1.934331, -0.6704676, 0.632831, 1, 0, 0.1333333, 1,
1.948333, -0.7393385, 0.9332465, 1, 0, 0.1254902, 1,
1.953734, 0.1900024, -0.1074523, 1, 0, 0.1215686, 1,
1.997668, 0.2749899, 1.400882, 1, 0, 0.1137255, 1,
1.998737, -0.09318756, 3.27928, 1, 0, 0.1098039, 1,
2.03507, 0.4942553, 0.6176473, 1, 0, 0.1019608, 1,
2.067681, 0.4083099, 0.6367726, 1, 0, 0.09411765, 1,
2.070115, 1.707548, 0.7463105, 1, 0, 0.09019608, 1,
2.103434, -0.9416867, 2.650147, 1, 0, 0.08235294, 1,
2.108735, -1.393502, 4.102773, 1, 0, 0.07843138, 1,
2.141216, 1.502808, 0.6969963, 1, 0, 0.07058824, 1,
2.230752, -0.6150249, 1.87204, 1, 0, 0.06666667, 1,
2.239141, -1.099109, 1.37945, 1, 0, 0.05882353, 1,
2.276341, -0.4797802, 1.0971, 1, 0, 0.05490196, 1,
2.306432, -0.006353533, 0.4203229, 1, 0, 0.04705882, 1,
2.367536, -0.4272532, 1.707911, 1, 0, 0.04313726, 1,
2.430562, -1.383661, 3.435125, 1, 0, 0.03529412, 1,
2.776034, 0.333213, 1.193786, 1, 0, 0.03137255, 1,
3.007045, -0.09355338, 0.496708, 1, 0, 0.02352941, 1,
3.201141, -0.2024818, 1.428372, 1, 0, 0.01960784, 1,
3.290719, -1.003826, 0.9536652, 1, 0, 0.01176471, 1,
3.464059, -1.880895, 1.803501, 1, 0, 0.007843138, 1
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
0.08338535, -4.090108, -8.106384, 0, -0.5, 0.5, 0.5,
0.08338535, -4.090108, -8.106384, 1, -0.5, 0.5, 0.5,
0.08338535, -4.090108, -8.106384, 1, 1.5, 0.5, 0.5,
0.08338535, -4.090108, -8.106384, 0, 1.5, 0.5, 0.5
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
-4.443336, 0.3640845, -8.106384, 0, -0.5, 0.5, 0.5,
-4.443336, 0.3640845, -8.106384, 1, -0.5, 0.5, 0.5,
-4.443336, 0.3640845, -8.106384, 1, 1.5, 0.5, 0.5,
-4.443336, 0.3640845, -8.106384, 0, 1.5, 0.5, 0.5
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
-4.443336, -4.090108, -0.4740646, 0, -0.5, 0.5, 0.5,
-4.443336, -4.090108, -0.4740646, 1, -0.5, 0.5, 0.5,
-4.443336, -4.090108, -0.4740646, 1, 1.5, 0.5, 0.5,
-4.443336, -4.090108, -0.4740646, 0, 1.5, 0.5, 0.5
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
-3, -3.062217, -6.34508,
3, -3.062217, -6.34508,
-3, -3.062217, -6.34508,
-3, -3.233533, -6.63863,
-2, -3.062217, -6.34508,
-2, -3.233533, -6.63863,
-1, -3.062217, -6.34508,
-1, -3.233533, -6.63863,
0, -3.062217, -6.34508,
0, -3.233533, -6.63863,
1, -3.062217, -6.34508,
1, -3.233533, -6.63863,
2, -3.062217, -6.34508,
2, -3.233533, -6.63863,
3, -3.062217, -6.34508,
3, -3.233533, -6.63863
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
-3, -3.576163, -7.225732, 0, -0.5, 0.5, 0.5,
-3, -3.576163, -7.225732, 1, -0.5, 0.5, 0.5,
-3, -3.576163, -7.225732, 1, 1.5, 0.5, 0.5,
-3, -3.576163, -7.225732, 0, 1.5, 0.5, 0.5,
-2, -3.576163, -7.225732, 0, -0.5, 0.5, 0.5,
-2, -3.576163, -7.225732, 1, -0.5, 0.5, 0.5,
-2, -3.576163, -7.225732, 1, 1.5, 0.5, 0.5,
-2, -3.576163, -7.225732, 0, 1.5, 0.5, 0.5,
-1, -3.576163, -7.225732, 0, -0.5, 0.5, 0.5,
-1, -3.576163, -7.225732, 1, -0.5, 0.5, 0.5,
-1, -3.576163, -7.225732, 1, 1.5, 0.5, 0.5,
-1, -3.576163, -7.225732, 0, 1.5, 0.5, 0.5,
0, -3.576163, -7.225732, 0, -0.5, 0.5, 0.5,
0, -3.576163, -7.225732, 1, -0.5, 0.5, 0.5,
0, -3.576163, -7.225732, 1, 1.5, 0.5, 0.5,
0, -3.576163, -7.225732, 0, 1.5, 0.5, 0.5,
1, -3.576163, -7.225732, 0, -0.5, 0.5, 0.5,
1, -3.576163, -7.225732, 1, -0.5, 0.5, 0.5,
1, -3.576163, -7.225732, 1, 1.5, 0.5, 0.5,
1, -3.576163, -7.225732, 0, 1.5, 0.5, 0.5,
2, -3.576163, -7.225732, 0, -0.5, 0.5, 0.5,
2, -3.576163, -7.225732, 1, -0.5, 0.5, 0.5,
2, -3.576163, -7.225732, 1, 1.5, 0.5, 0.5,
2, -3.576163, -7.225732, 0, 1.5, 0.5, 0.5,
3, -3.576163, -7.225732, 0, -0.5, 0.5, 0.5,
3, -3.576163, -7.225732, 1, -0.5, 0.5, 0.5,
3, -3.576163, -7.225732, 1, 1.5, 0.5, 0.5,
3, -3.576163, -7.225732, 0, 1.5, 0.5, 0.5
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
-3.398708, -2, -6.34508,
-3.398708, 3, -6.34508,
-3.398708, -2, -6.34508,
-3.572813, -2, -6.63863,
-3.398708, -1, -6.34508,
-3.572813, -1, -6.63863,
-3.398708, 0, -6.34508,
-3.572813, 0, -6.63863,
-3.398708, 1, -6.34508,
-3.572813, 1, -6.63863,
-3.398708, 2, -6.34508,
-3.572813, 2, -6.63863,
-3.398708, 3, -6.34508,
-3.572813, 3, -6.63863
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
-3.921022, -2, -7.225732, 0, -0.5, 0.5, 0.5,
-3.921022, -2, -7.225732, 1, -0.5, 0.5, 0.5,
-3.921022, -2, -7.225732, 1, 1.5, 0.5, 0.5,
-3.921022, -2, -7.225732, 0, 1.5, 0.5, 0.5,
-3.921022, -1, -7.225732, 0, -0.5, 0.5, 0.5,
-3.921022, -1, -7.225732, 1, -0.5, 0.5, 0.5,
-3.921022, -1, -7.225732, 1, 1.5, 0.5, 0.5,
-3.921022, -1, -7.225732, 0, 1.5, 0.5, 0.5,
-3.921022, 0, -7.225732, 0, -0.5, 0.5, 0.5,
-3.921022, 0, -7.225732, 1, -0.5, 0.5, 0.5,
-3.921022, 0, -7.225732, 1, 1.5, 0.5, 0.5,
-3.921022, 0, -7.225732, 0, 1.5, 0.5, 0.5,
-3.921022, 1, -7.225732, 0, -0.5, 0.5, 0.5,
-3.921022, 1, -7.225732, 1, -0.5, 0.5, 0.5,
-3.921022, 1, -7.225732, 1, 1.5, 0.5, 0.5,
-3.921022, 1, -7.225732, 0, 1.5, 0.5, 0.5,
-3.921022, 2, -7.225732, 0, -0.5, 0.5, 0.5,
-3.921022, 2, -7.225732, 1, -0.5, 0.5, 0.5,
-3.921022, 2, -7.225732, 1, 1.5, 0.5, 0.5,
-3.921022, 2, -7.225732, 0, 1.5, 0.5, 0.5,
-3.921022, 3, -7.225732, 0, -0.5, 0.5, 0.5,
-3.921022, 3, -7.225732, 1, -0.5, 0.5, 0.5,
-3.921022, 3, -7.225732, 1, 1.5, 0.5, 0.5,
-3.921022, 3, -7.225732, 0, 1.5, 0.5, 0.5
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
-3.398708, -3.062217, -6,
-3.398708, -3.062217, 4,
-3.398708, -3.062217, -6,
-3.572813, -3.233533, -6,
-3.398708, -3.062217, -4,
-3.572813, -3.233533, -4,
-3.398708, -3.062217, -2,
-3.572813, -3.233533, -2,
-3.398708, -3.062217, 0,
-3.572813, -3.233533, 0,
-3.398708, -3.062217, 2,
-3.572813, -3.233533, 2,
-3.398708, -3.062217, 4,
-3.572813, -3.233533, 4
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
"-6",
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
-3.921022, -3.576163, -6, 0, -0.5, 0.5, 0.5,
-3.921022, -3.576163, -6, 1, -0.5, 0.5, 0.5,
-3.921022, -3.576163, -6, 1, 1.5, 0.5, 0.5,
-3.921022, -3.576163, -6, 0, 1.5, 0.5, 0.5,
-3.921022, -3.576163, -4, 0, -0.5, 0.5, 0.5,
-3.921022, -3.576163, -4, 1, -0.5, 0.5, 0.5,
-3.921022, -3.576163, -4, 1, 1.5, 0.5, 0.5,
-3.921022, -3.576163, -4, 0, 1.5, 0.5, 0.5,
-3.921022, -3.576163, -2, 0, -0.5, 0.5, 0.5,
-3.921022, -3.576163, -2, 1, -0.5, 0.5, 0.5,
-3.921022, -3.576163, -2, 1, 1.5, 0.5, 0.5,
-3.921022, -3.576163, -2, 0, 1.5, 0.5, 0.5,
-3.921022, -3.576163, 0, 0, -0.5, 0.5, 0.5,
-3.921022, -3.576163, 0, 1, -0.5, 0.5, 0.5,
-3.921022, -3.576163, 0, 1, 1.5, 0.5, 0.5,
-3.921022, -3.576163, 0, 0, 1.5, 0.5, 0.5,
-3.921022, -3.576163, 2, 0, -0.5, 0.5, 0.5,
-3.921022, -3.576163, 2, 1, -0.5, 0.5, 0.5,
-3.921022, -3.576163, 2, 1, 1.5, 0.5, 0.5,
-3.921022, -3.576163, 2, 0, 1.5, 0.5, 0.5,
-3.921022, -3.576163, 4, 0, -0.5, 0.5, 0.5,
-3.921022, -3.576163, 4, 1, -0.5, 0.5, 0.5,
-3.921022, -3.576163, 4, 1, 1.5, 0.5, 0.5,
-3.921022, -3.576163, 4, 0, 1.5, 0.5, 0.5
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
-3.398708, -3.062217, -6.34508,
-3.398708, 3.790386, -6.34508,
-3.398708, -3.062217, 5.396951,
-3.398708, 3.790386, 5.396951,
-3.398708, -3.062217, -6.34508,
-3.398708, -3.062217, 5.396951,
-3.398708, 3.790386, -6.34508,
-3.398708, 3.790386, 5.396951,
-3.398708, -3.062217, -6.34508,
3.565479, -3.062217, -6.34508,
-3.398708, -3.062217, 5.396951,
3.565479, -3.062217, 5.396951,
-3.398708, 3.790386, -6.34508,
3.565479, 3.790386, -6.34508,
-3.398708, 3.790386, 5.396951,
3.565479, 3.790386, 5.396951,
3.565479, -3.062217, -6.34508,
3.565479, 3.790386, -6.34508,
3.565479, -3.062217, 5.396951,
3.565479, 3.790386, 5.396951,
3.565479, -3.062217, -6.34508,
3.565479, -3.062217, 5.396951,
3.565479, 3.790386, -6.34508,
3.565479, 3.790386, 5.396951
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
var radius = 8.156689;
var distance = 36.29003;
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
mvMatrix.translate( -0.08338535, -0.3640845, 0.4740646 );
mvMatrix.scale( 1.266361, 1.286981, 0.7510772 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.29003);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
ethyl_benzoate<-read.table("ethyl_benzoate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ethyl_benzoate$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethyl_benzoate' not found
```

```r
y<-ethyl_benzoate$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethyl_benzoate' not found
```

```r
z<-ethyl_benzoate$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethyl_benzoate' not found
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
-3.297288, -1.431811, -0.6448807, 0, 0, 1, 1, 1,
-2.829714, -0.1655124, -1.654783, 1, 0, 0, 1, 1,
-2.543509, 1.753794, -1.166973, 1, 0, 0, 1, 1,
-2.472188, -1.413768, -2.227076, 1, 0, 0, 1, 1,
-2.351547, 1.595031, -2.043247, 1, 0, 0, 1, 1,
-2.325497, -0.07224235, -3.303862, 1, 0, 0, 1, 1,
-2.247711, -0.6253267, -0.610953, 0, 0, 0, 1, 1,
-2.223342, 0.7606139, -1.170665, 0, 0, 0, 1, 1,
-2.205144, 0.7086663, -2.224134, 0, 0, 0, 1, 1,
-2.203083, -1.001638, -1.629846, 0, 0, 0, 1, 1,
-2.190431, -0.1428835, -4.821732, 0, 0, 0, 1, 1,
-2.181055, 0.7658905, -0.1729756, 0, 0, 0, 1, 1,
-2.160868, 0.6889058, -0.7088294, 0, 0, 0, 1, 1,
-2.15833, -1.228199, -1.138513, 1, 1, 1, 1, 1,
-2.122945, -0.07411095, -1.724629, 1, 1, 1, 1, 1,
-2.098211, 0.5308169, -1.641916, 1, 1, 1, 1, 1,
-2.079306, -0.04514152, -2.091208, 1, 1, 1, 1, 1,
-2.078731, 0.4073216, -0.6183357, 1, 1, 1, 1, 1,
-2.056175, -1.142359, -2.878871, 1, 1, 1, 1, 1,
-2.05494, 0.5518307, -1.563988, 1, 1, 1, 1, 1,
-2.054446, 1.160872, -1.549337, 1, 1, 1, 1, 1,
-2.039306, 0.05182557, -0.4291097, 1, 1, 1, 1, 1,
-2.038313, 0.2346942, -1.794174, 1, 1, 1, 1, 1,
-2.011635, -2.71806, -2.693292, 1, 1, 1, 1, 1,
-2.002739, -0.6757675, -3.200263, 1, 1, 1, 1, 1,
-1.962076, -0.173654, -1.028615, 1, 1, 1, 1, 1,
-1.928658, 0.2045012, -1.791871, 1, 1, 1, 1, 1,
-1.926451, -1.150921, -2.582346, 1, 1, 1, 1, 1,
-1.925871, -0.9417346, -3.39967, 0, 0, 1, 1, 1,
-1.919889, -1.481672, -2.446864, 1, 0, 0, 1, 1,
-1.912058, 0.9555372, -1.840438, 1, 0, 0, 1, 1,
-1.906515, -0.2250661, -0.6148754, 1, 0, 0, 1, 1,
-1.871987, 0.143639, -0.6665, 1, 0, 0, 1, 1,
-1.835971, -2.057977, -6.174079, 1, 0, 0, 1, 1,
-1.825802, 0.1956378, -2.565825, 0, 0, 0, 1, 1,
-1.819071, -1.860889, -2.726043, 0, 0, 0, 1, 1,
-1.808726, -0.4212963, -1.416104, 0, 0, 0, 1, 1,
-1.808567, 1.687826, 0.02129699, 0, 0, 0, 1, 1,
-1.805007, 0.8410259, 0.6619811, 0, 0, 0, 1, 1,
-1.756963, -1.028601, -0.5383376, 0, 0, 0, 1, 1,
-1.751407, -0.5889675, -0.9193441, 0, 0, 0, 1, 1,
-1.744938, -1.232219, -2.812731, 1, 1, 1, 1, 1,
-1.738929, 0.6555659, -0.03243164, 1, 1, 1, 1, 1,
-1.712268, 1.392049, -1.827713, 1, 1, 1, 1, 1,
-1.709871, -0.02711624, -0.7787604, 1, 1, 1, 1, 1,
-1.690802, 0.3820074, -2.43914, 1, 1, 1, 1, 1,
-1.676037, 1.242903, -2.77387, 1, 1, 1, 1, 1,
-1.672055, -1.119723, -2.864031, 1, 1, 1, 1, 1,
-1.629266, -0.5483397, -1.650365, 1, 1, 1, 1, 1,
-1.626881, -1.024681, -0.6218759, 1, 1, 1, 1, 1,
-1.621857, -1.025231, -0.9195362, 1, 1, 1, 1, 1,
-1.606039, 0.07163418, -1.55651, 1, 1, 1, 1, 1,
-1.600882, -0.05276516, -1.801996, 1, 1, 1, 1, 1,
-1.597105, -0.9614044, -1.526432, 1, 1, 1, 1, 1,
-1.592059, -0.1439167, -1.138517, 1, 1, 1, 1, 1,
-1.574561, 1.939931, -0.4177202, 1, 1, 1, 1, 1,
-1.571643, -1.498383, -2.147627, 0, 0, 1, 1, 1,
-1.558763, -0.9072171, -1.979811, 1, 0, 0, 1, 1,
-1.548384, 0.2834855, -2.672893, 1, 0, 0, 1, 1,
-1.538552, 0.7082185, -0.3300265, 1, 0, 0, 1, 1,
-1.536815, 1.317023, -1.464186, 1, 0, 0, 1, 1,
-1.536333, 0.88595, -1.946487, 1, 0, 0, 1, 1,
-1.53563, 0.1331515, 0.6896298, 0, 0, 0, 1, 1,
-1.531867, 0.2023912, -3.011912, 0, 0, 0, 1, 1,
-1.529752, -0.5312102, -2.236526, 0, 0, 0, 1, 1,
-1.523167, 0.1056582, -2.356068, 0, 0, 0, 1, 1,
-1.522129, 1.457717, -0.3929367, 0, 0, 0, 1, 1,
-1.50753, -0.116366, -2.680266, 0, 0, 0, 1, 1,
-1.503184, 0.8428178, -0.5820039, 0, 0, 0, 1, 1,
-1.501164, -1.200031, -1.41772, 1, 1, 1, 1, 1,
-1.497283, 0.7444184, -1.405804, 1, 1, 1, 1, 1,
-1.495435, -1.495176, -1.865176, 1, 1, 1, 1, 1,
-1.492509, 0.09660227, 0.02905534, 1, 1, 1, 1, 1,
-1.481643, 0.2727806, -2.913322, 1, 1, 1, 1, 1,
-1.473515, 0.3634892, 0.2180203, 1, 1, 1, 1, 1,
-1.473485, 0.1149693, -0.8632328, 1, 1, 1, 1, 1,
-1.446707, 1.26171, 0.1652064, 1, 1, 1, 1, 1,
-1.444246, -0.7021678, -2.133437, 1, 1, 1, 1, 1,
-1.424165, -1.440076, -2.260955, 1, 1, 1, 1, 1,
-1.403139, 0.198097, -2.222814, 1, 1, 1, 1, 1,
-1.402917, -1.311101, -3.28323, 1, 1, 1, 1, 1,
-1.399537, -0.934983, -2.801766, 1, 1, 1, 1, 1,
-1.390671, 0.4214813, -1.522513, 1, 1, 1, 1, 1,
-1.385542, 1.185712, -0.758171, 1, 1, 1, 1, 1,
-1.380083, 0.4057702, -1.220755, 0, 0, 1, 1, 1,
-1.375747, -0.4080771, -0.539257, 1, 0, 0, 1, 1,
-1.371177, 1.050003, -0.7332996, 1, 0, 0, 1, 1,
-1.370548, -0.2743741, -1.44041, 1, 0, 0, 1, 1,
-1.358179, 2.828092, 1.489694, 1, 0, 0, 1, 1,
-1.349404, 0.8601831, -0.3513058, 1, 0, 0, 1, 1,
-1.348627, 0.3289442, -2.019443, 0, 0, 0, 1, 1,
-1.345121, -0.8017365, -2.692563, 0, 0, 0, 1, 1,
-1.343436, -0.4968989, -1.66569, 0, 0, 0, 1, 1,
-1.329688, -0.2089138, -1.879758, 0, 0, 0, 1, 1,
-1.327795, -0.3494994, -2.50126, 0, 0, 0, 1, 1,
-1.325024, 1.446731, -0.6501803, 0, 0, 0, 1, 1,
-1.299974, 0.8395146, -0.2377296, 0, 0, 0, 1, 1,
-1.291738, -0.9413134, -2.678573, 1, 1, 1, 1, 1,
-1.291724, -0.03646168, -1.355454, 1, 1, 1, 1, 1,
-1.281606, 1.811708, -0.2831354, 1, 1, 1, 1, 1,
-1.275264, -0.7239687, -1.908151, 1, 1, 1, 1, 1,
-1.269903, 0.4358789, 0.04511863, 1, 1, 1, 1, 1,
-1.268731, -0.9321084, -3.281551, 1, 1, 1, 1, 1,
-1.264501, -2.30389, -0.7833079, 1, 1, 1, 1, 1,
-1.257774, 0.04627179, 1.156965, 1, 1, 1, 1, 1,
-1.254692, 0.05781518, -1.852201, 1, 1, 1, 1, 1,
-1.251203, 1.178462, -1.045323, 1, 1, 1, 1, 1,
-1.251056, -0.01257235, -1.278633, 1, 1, 1, 1, 1,
-1.250622, 1.04888, -0.9323701, 1, 1, 1, 1, 1,
-1.243459, 0.941365, 0.4797538, 1, 1, 1, 1, 1,
-1.24174, -1.449924, -2.508133, 1, 1, 1, 1, 1,
-1.236616, -0.9925554, -1.689398, 1, 1, 1, 1, 1,
-1.233366, 0.08745628, -0.8048128, 0, 0, 1, 1, 1,
-1.231452, 0.8933367, -0.5541773, 1, 0, 0, 1, 1,
-1.231349, -0.6948869, -1.420563, 1, 0, 0, 1, 1,
-1.21291, -1.222027, -2.082411, 1, 0, 0, 1, 1,
-1.206962, -1.372, -1.419747, 1, 0, 0, 1, 1,
-1.198892, -1.42584, -0.6027406, 1, 0, 0, 1, 1,
-1.196354, -1.725485, -2.372937, 0, 0, 0, 1, 1,
-1.195725, 0.2225926, -0.8430347, 0, 0, 0, 1, 1,
-1.193031, -0.2164843, -2.28923, 0, 0, 0, 1, 1,
-1.190471, 0.5006154, -0.5799981, 0, 0, 0, 1, 1,
-1.189599, 0.1937514, -0.4655434, 0, 0, 0, 1, 1,
-1.187976, -1.188597, -2.430133, 0, 0, 0, 1, 1,
-1.187724, 0.0395998, -2.237959, 0, 0, 0, 1, 1,
-1.179238, 0.8837696, -1.090437, 1, 1, 1, 1, 1,
-1.176165, -1.432582, -2.966228, 1, 1, 1, 1, 1,
-1.175717, 0.8789911, 0.1008888, 1, 1, 1, 1, 1,
-1.17381, 1.309131, -1.72134, 1, 1, 1, 1, 1,
-1.172958, 1.285626, -1.568698, 1, 1, 1, 1, 1,
-1.172433, -0.08478409, -1.70041, 1, 1, 1, 1, 1,
-1.171396, -1.12209, -2.34629, 1, 1, 1, 1, 1,
-1.170274, -2.876657, -1.51283, 1, 1, 1, 1, 1,
-1.167014, -1.863324, -3.812199, 1, 1, 1, 1, 1,
-1.164415, -0.3051853, -0.008806284, 1, 1, 1, 1, 1,
-1.161913, 0.2954141, -0.8110089, 1, 1, 1, 1, 1,
-1.158947, -0.5213358, -2.798926, 1, 1, 1, 1, 1,
-1.154676, 0.3371415, -2.469525, 1, 1, 1, 1, 1,
-1.152233, 3.690591, -0.7010636, 1, 1, 1, 1, 1,
-1.145156, -0.2651395, -0.9482561, 1, 1, 1, 1, 1,
-1.135343, -1.254245, -1.330401, 0, 0, 1, 1, 1,
-1.134748, 1.21429, -1.627802, 1, 0, 0, 1, 1,
-1.127593, 0.6121202, 0.3640263, 1, 0, 0, 1, 1,
-1.113092, -2.073315, -2.430994, 1, 0, 0, 1, 1,
-1.110567, 1.065085, -0.6346669, 1, 0, 0, 1, 1,
-1.10647, 0.4642066, -1.459265, 1, 0, 0, 1, 1,
-1.097438, -0.4535423, -2.193445, 0, 0, 0, 1, 1,
-1.086085, -0.6065586, -2.860485, 0, 0, 0, 1, 1,
-1.085966, -0.1642825, -1.335916, 0, 0, 0, 1, 1,
-1.084717, 0.7886598, -1.148057, 0, 0, 0, 1, 1,
-1.083957, -1.093136, -1.836614, 0, 0, 0, 1, 1,
-1.0816, 1.09411, -0.6039373, 0, 0, 0, 1, 1,
-1.078506, 0.516211, -1.515591, 0, 0, 0, 1, 1,
-1.076956, -0.3310086, -2.146363, 1, 1, 1, 1, 1,
-1.076254, 1.958022, -0.3205052, 1, 1, 1, 1, 1,
-1.072464, 0.8043269, -0.531218, 1, 1, 1, 1, 1,
-1.071009, -0.04404408, -1.638187, 1, 1, 1, 1, 1,
-1.066488, 1.611348, -0.7813888, 1, 1, 1, 1, 1,
-1.065892, -0.1603626, -2.668747, 1, 1, 1, 1, 1,
-1.065807, 0.2824942, -1.065434, 1, 1, 1, 1, 1,
-1.061596, 0.06982975, -1.35004, 1, 1, 1, 1, 1,
-1.041694, -0.9627433, -1.661618, 1, 1, 1, 1, 1,
-1.039948, 1.46085, -2.1559, 1, 1, 1, 1, 1,
-1.036915, -0.6120649, -1.609297, 1, 1, 1, 1, 1,
-1.033928, -1.107294, -2.851565, 1, 1, 1, 1, 1,
-1.030765, -0.4327061, -2.903389, 1, 1, 1, 1, 1,
-1.029367, 1.792533, 0.5403895, 1, 1, 1, 1, 1,
-1.028001, 1.801557, -1.872594, 1, 1, 1, 1, 1,
-1.02659, 0.2421794, -1.399031, 0, 0, 1, 1, 1,
-1.022381, -0.9318095, -3.629629, 1, 0, 0, 1, 1,
-1.020442, 0.07134107, -1.021496, 1, 0, 0, 1, 1,
-1.01713, -0.5987411, -2.864864, 1, 0, 0, 1, 1,
-1.011432, 2.773363, -0.04349463, 1, 0, 0, 1, 1,
-1.008955, -0.9767653, -0.8414133, 1, 0, 0, 1, 1,
-1.007253, 0.8070766, -0.9680542, 0, 0, 0, 1, 1,
-1.006646, 2.1793, -3.199854, 0, 0, 0, 1, 1,
-0.9968133, 0.146193, -2.206834, 0, 0, 0, 1, 1,
-0.994092, 2.120027, 0.1272262, 0, 0, 0, 1, 1,
-0.9851449, 0.8370417, -1.878381, 0, 0, 0, 1, 1,
-0.981701, -2.17586, -2.751125, 0, 0, 0, 1, 1,
-0.9736353, -0.6530375, -1.729122, 0, 0, 0, 1, 1,
-0.9703614, 0.1321285, -1.397445, 1, 1, 1, 1, 1,
-0.961979, 0.8548023, -0.9916059, 1, 1, 1, 1, 1,
-0.9599627, 0.1196114, -2.529921, 1, 1, 1, 1, 1,
-0.9556133, -1.217589, -2.783518, 1, 1, 1, 1, 1,
-0.9546831, 0.7302499, -3.536603, 1, 1, 1, 1, 1,
-0.9505038, 0.5650015, 1.671583, 1, 1, 1, 1, 1,
-0.9475296, -1.37035, -1.06137, 1, 1, 1, 1, 1,
-0.9473487, 0.233801, -1.046523, 1, 1, 1, 1, 1,
-0.9454124, 0.6421419, 0.2898599, 1, 1, 1, 1, 1,
-0.936385, -0.04064617, -0.8181516, 1, 1, 1, 1, 1,
-0.931501, -1.812798, -2.451208, 1, 1, 1, 1, 1,
-0.9313098, -0.01465969, -1.915341, 1, 1, 1, 1, 1,
-0.9288044, -1.22825, -3.408281, 1, 1, 1, 1, 1,
-0.9276872, -0.9281575, -2.454311, 1, 1, 1, 1, 1,
-0.9264829, 1.816436, -0.9237665, 1, 1, 1, 1, 1,
-0.9185066, -1.912163, -3.415635, 0, 0, 1, 1, 1,
-0.9110621, -1.228287, -3.591235, 1, 0, 0, 1, 1,
-0.8936633, 0.1247933, -1.581515, 1, 0, 0, 1, 1,
-0.8846614, -0.5800353, -3.125032, 1, 0, 0, 1, 1,
-0.8803271, 0.389175, -2.022537, 1, 0, 0, 1, 1,
-0.8683235, -0.06539128, -0.5098723, 1, 0, 0, 1, 1,
-0.8668414, -0.2903199, -2.301585, 0, 0, 0, 1, 1,
-0.8667627, -0.05429986, -1.380677, 0, 0, 0, 1, 1,
-0.8601362, -1.413531, -2.66259, 0, 0, 0, 1, 1,
-0.853937, -1.102005, -2.576773, 0, 0, 0, 1, 1,
-0.843876, 0.07157428, -1.6602, 0, 0, 0, 1, 1,
-0.8385988, -0.3387638, -3.652378, 0, 0, 0, 1, 1,
-0.8380485, 1.241218, 0.06486369, 0, 0, 0, 1, 1,
-0.834076, -0.7278582, -3.13484, 1, 1, 1, 1, 1,
-0.8340222, -0.606248, -2.485708, 1, 1, 1, 1, 1,
-0.8323069, -0.3266353, -1.872907, 1, 1, 1, 1, 1,
-0.8312405, -0.1073713, -2.555252, 1, 1, 1, 1, 1,
-0.8231714, 0.1789783, -2.051603, 1, 1, 1, 1, 1,
-0.8187749, 1.440912, -0.666649, 1, 1, 1, 1, 1,
-0.8146635, 1.491594, 0.4837909, 1, 1, 1, 1, 1,
-0.8118293, -0.4642026, -2.215254, 1, 1, 1, 1, 1,
-0.8080291, 2.365573, 2.437874, 1, 1, 1, 1, 1,
-0.80678, -0.6998349, -3.350163, 1, 1, 1, 1, 1,
-0.8039262, -0.04372032, -2.619795, 1, 1, 1, 1, 1,
-0.8010906, -1.129383, -0.902658, 1, 1, 1, 1, 1,
-0.7984908, 1.729051, -2.927624, 1, 1, 1, 1, 1,
-0.7980853, 0.5994324, -0.5656406, 1, 1, 1, 1, 1,
-0.7946625, 0.390305, -1.698997, 1, 1, 1, 1, 1,
-0.7898082, 1.988643, 0.1556885, 0, 0, 1, 1, 1,
-0.7866599, -2.962422, -2.523264, 1, 0, 0, 1, 1,
-0.7845258, -0.906669, -2.958906, 1, 0, 0, 1, 1,
-0.7830762, -0.1808718, -1.171322, 1, 0, 0, 1, 1,
-0.7829614, 0.02681242, -0.2073924, 1, 0, 0, 1, 1,
-0.7819423, -0.9436263, -2.406282, 1, 0, 0, 1, 1,
-0.7788085, -0.9557511, -0.454748, 0, 0, 0, 1, 1,
-0.7746883, -0.9938033, -1.2967, 0, 0, 0, 1, 1,
-0.771777, 0.6911556, -0.7324981, 0, 0, 0, 1, 1,
-0.7675974, -1.072294, -2.421746, 0, 0, 0, 1, 1,
-0.7672117, -0.5872551, -3.343877, 0, 0, 0, 1, 1,
-0.7609858, 0.1998547, -2.141784, 0, 0, 0, 1, 1,
-0.759986, 0.8347247, -1.005674, 0, 0, 0, 1, 1,
-0.7575356, -0.3598604, -4.075704, 1, 1, 1, 1, 1,
-0.7534848, -1.270026, -2.937827, 1, 1, 1, 1, 1,
-0.7491139, 1.085652, -0.1272949, 1, 1, 1, 1, 1,
-0.749064, 1.107615, -1.023797, 1, 1, 1, 1, 1,
-0.7429933, 2.085277, -1.767295, 1, 1, 1, 1, 1,
-0.7407041, -0.4087988, -2.845923, 1, 1, 1, 1, 1,
-0.740205, 0.9576213, -0.184857, 1, 1, 1, 1, 1,
-0.7398455, 2.211841, 0.3046317, 1, 1, 1, 1, 1,
-0.7330647, -0.8402582, -1.913741, 1, 1, 1, 1, 1,
-0.7229449, 1.044112, -0.6834318, 1, 1, 1, 1, 1,
-0.7205803, 0.7142916, -1.265086, 1, 1, 1, 1, 1,
-0.7191618, -1.563296, -0.6262244, 1, 1, 1, 1, 1,
-0.7183422, 1.87865, -0.3280617, 1, 1, 1, 1, 1,
-0.7180302, 0.5827116, -0.2576883, 1, 1, 1, 1, 1,
-0.7140744, -2.542307, -2.444279, 1, 1, 1, 1, 1,
-0.7024188, 0.6962882, -0.7377259, 0, 0, 1, 1, 1,
-0.7021567, 1.098008, -2.516624, 1, 0, 0, 1, 1,
-0.6988131, -0.02153616, -0.9016358, 1, 0, 0, 1, 1,
-0.6957781, -0.1258775, 0.5265081, 1, 0, 0, 1, 1,
-0.6952059, 0.5690122, 0.6727652, 1, 0, 0, 1, 1,
-0.6906475, -0.8616997, -3.059517, 1, 0, 0, 1, 1,
-0.6850315, -0.6312191, -4.012436, 0, 0, 0, 1, 1,
-0.6839318, -0.1342576, -1.39748, 0, 0, 0, 1, 1,
-0.6758357, -2.579264, -2.619832, 0, 0, 0, 1, 1,
-0.6757557, 0.8685205, -0.7165547, 0, 0, 0, 1, 1,
-0.6741353, 0.9347492, -0.8718402, 0, 0, 0, 1, 1,
-0.670237, 0.606083, 0.7835984, 0, 0, 0, 1, 1,
-0.66837, -0.9770613, -5.958354, 0, 0, 0, 1, 1,
-0.6681085, -0.4817241, -1.077756, 1, 1, 1, 1, 1,
-0.6663185, -0.7927767, -3.24116, 1, 1, 1, 1, 1,
-0.6617035, 0.6885901, -0.7560768, 1, 1, 1, 1, 1,
-0.6591613, -0.2439126, -1.314608, 1, 1, 1, 1, 1,
-0.6587167, 0.08115575, -1.664562, 1, 1, 1, 1, 1,
-0.6573973, 0.8774093, -0.1469676, 1, 1, 1, 1, 1,
-0.6484239, 0.1628218, -2.374746, 1, 1, 1, 1, 1,
-0.6367207, 0.2246046, -1.315777, 1, 1, 1, 1, 1,
-0.625725, -0.3089318, -3.010771, 1, 1, 1, 1, 1,
-0.623448, -0.1255043, -0.9182459, 1, 1, 1, 1, 1,
-0.6230722, 0.2311957, -1.402508, 1, 1, 1, 1, 1,
-0.621426, -0.723043, -2.738458, 1, 1, 1, 1, 1,
-0.6203015, 1.478861, 0.587558, 1, 1, 1, 1, 1,
-0.618566, 0.4712747, -2.715232, 1, 1, 1, 1, 1,
-0.6179147, -0.8713663, -3.131071, 1, 1, 1, 1, 1,
-0.6176274, -0.2590586, -3.353682, 0, 0, 1, 1, 1,
-0.6165789, 0.1009729, -1.867257, 1, 0, 0, 1, 1,
-0.6150321, -0.01436238, -2.257229, 1, 0, 0, 1, 1,
-0.6109635, -2.142739, -4.038281, 1, 0, 0, 1, 1,
-0.609634, 1.157971, -1.928622, 1, 0, 0, 1, 1,
-0.6068195, -1.005059, -3.859462, 1, 0, 0, 1, 1,
-0.6037664, -1.851591, -4.507581, 0, 0, 0, 1, 1,
-0.5986336, -0.427597, -0.9082395, 0, 0, 0, 1, 1,
-0.5977139, -1.28976, -2.872369, 0, 0, 0, 1, 1,
-0.592158, -1.691523, -2.624712, 0, 0, 0, 1, 1,
-0.5921095, 0.2343169, -2.246381, 0, 0, 0, 1, 1,
-0.591626, 1.182377, -0.7449405, 0, 0, 0, 1, 1,
-0.5904727, 0.04596679, -2.483836, 0, 0, 0, 1, 1,
-0.588662, -0.182117, -2.41248, 1, 1, 1, 1, 1,
-0.58858, -0.9305953, -2.734896, 1, 1, 1, 1, 1,
-0.5822335, -0.3454666, -1.341272, 1, 1, 1, 1, 1,
-0.5801511, -0.747246, -1.452966, 1, 1, 1, 1, 1,
-0.5738451, 1.832107, -0.9011937, 1, 1, 1, 1, 1,
-0.5726161, -0.1808976, -2.72605, 1, 1, 1, 1, 1,
-0.5655507, 0.2898114, -2.732224, 1, 1, 1, 1, 1,
-0.5623113, 0.4909103, -0.5633001, 1, 1, 1, 1, 1,
-0.5570146, 0.6885195, -1.063303, 1, 1, 1, 1, 1,
-0.5543274, 1.754649, -0.8791475, 1, 1, 1, 1, 1,
-0.5516493, 0.7916486, 0.4354549, 1, 1, 1, 1, 1,
-0.5464422, 0.03535786, -1.431899, 1, 1, 1, 1, 1,
-0.5451911, -0.9979483, -2.07188, 1, 1, 1, 1, 1,
-0.5443782, -1.921193, -3.279408, 1, 1, 1, 1, 1,
-0.5426695, 0.9134521, 0.5192846, 1, 1, 1, 1, 1,
-0.5420249, 0.3824886, -1.240015, 0, 0, 1, 1, 1,
-0.5387912, 0.2035985, -1.988082, 1, 0, 0, 1, 1,
-0.5381724, -0.1873874, -1.709829, 1, 0, 0, 1, 1,
-0.5277885, -0.2094588, -4.638758, 1, 0, 0, 1, 1,
-0.5277357, -1.741167, -2.4026, 1, 0, 0, 1, 1,
-0.5078328, 0.09235578, -0.6012847, 1, 0, 0, 1, 1,
-0.5061983, 0.3680738, -1.953898, 0, 0, 0, 1, 1,
-0.5045914, 0.4191972, -0.1024419, 0, 0, 0, 1, 1,
-0.5011624, 0.3342556, -0.9607724, 0, 0, 0, 1, 1,
-0.4920066, 0.6370742, 0.9304637, 0, 0, 0, 1, 1,
-0.4876285, -1.191907, -2.788243, 0, 0, 0, 1, 1,
-0.4861636, 0.9535866, -0.8671321, 0, 0, 0, 1, 1,
-0.4817618, 0.7462072, -1.590385, 0, 0, 0, 1, 1,
-0.479862, -0.2750252, -0.9493043, 1, 1, 1, 1, 1,
-0.4769126, 0.3592864, -0.4750024, 1, 1, 1, 1, 1,
-0.4742382, 1.556212, 0.949456, 1, 1, 1, 1, 1,
-0.4720568, 0.6947461, 0.1133737, 1, 1, 1, 1, 1,
-0.4695348, 0.007177293, -1.655649, 1, 1, 1, 1, 1,
-0.4657184, -0.1972105, -0.2477857, 1, 1, 1, 1, 1,
-0.4643973, -1.825618, -2.264461, 1, 1, 1, 1, 1,
-0.4616557, -0.6629073, -1.773019, 1, 1, 1, 1, 1,
-0.4612389, 0.9865264, -0.9048946, 1, 1, 1, 1, 1,
-0.459449, 0.4034674, -2.093875, 1, 1, 1, 1, 1,
-0.4559421, -0.8415093, -3.705572, 1, 1, 1, 1, 1,
-0.4553127, -0.8716721, -3.157935, 1, 1, 1, 1, 1,
-0.4528689, 0.5960333, -1.448876, 1, 1, 1, 1, 1,
-0.4525273, -1.201321, -3.802428, 1, 1, 1, 1, 1,
-0.451307, 1.191052, 0.2525415, 1, 1, 1, 1, 1,
-0.4509537, -0.2589526, -2.137821, 0, 0, 1, 1, 1,
-0.4479994, -0.4712282, -3.099169, 1, 0, 0, 1, 1,
-0.4465536, 0.06981403, -0.9886557, 1, 0, 0, 1, 1,
-0.4390163, -0.08903652, -3.481051, 1, 0, 0, 1, 1,
-0.4358924, -1.128853, -1.716462, 1, 0, 0, 1, 1,
-0.4344156, -1.280833, -2.184759, 1, 0, 0, 1, 1,
-0.4335693, 0.3405541, -1.04279, 0, 0, 0, 1, 1,
-0.4288016, 0.8112311, -1.675511, 0, 0, 0, 1, 1,
-0.4212315, 0.9110187, -0.1086644, 0, 0, 0, 1, 1,
-0.4197571, 0.9737757, -1.347726, 0, 0, 0, 1, 1,
-0.4191863, 0.1585802, 0.1816078, 0, 0, 0, 1, 1,
-0.4159934, 1.068213, -0.8941559, 0, 0, 0, 1, 1,
-0.4140837, 0.3584948, -1.673638, 0, 0, 0, 1, 1,
-0.4109415, -0.6722218, -2.834627, 1, 1, 1, 1, 1,
-0.4066211, -1.170634, -2.301637, 1, 1, 1, 1, 1,
-0.4047047, -1.985737, -3.765677, 1, 1, 1, 1, 1,
-0.4026637, 0.05355237, -0.888216, 1, 1, 1, 1, 1,
-0.4002365, 0.1245403, -1.380544, 1, 1, 1, 1, 1,
-0.3992119, -0.09052342, -1.175197, 1, 1, 1, 1, 1,
-0.3891752, 1.883781, -0.473367, 1, 1, 1, 1, 1,
-0.3835562, 0.1814683, -2.451012, 1, 1, 1, 1, 1,
-0.3833445, 1.178728, -1.720257, 1, 1, 1, 1, 1,
-0.3797604, -0.2467935, -2.688134, 1, 1, 1, 1, 1,
-0.3794338, -0.006853772, -2.30343, 1, 1, 1, 1, 1,
-0.3772369, -0.1515411, 0.0009775687, 1, 1, 1, 1, 1,
-0.3687298, -1.553725, -3.0933, 1, 1, 1, 1, 1,
-0.3656054, 1.763864, -1.787363, 1, 1, 1, 1, 1,
-0.3652281, -0.7126393, -0.9053748, 1, 1, 1, 1, 1,
-0.3597571, -0.3800598, -0.7088384, 0, 0, 1, 1, 1,
-0.3562564, 1.142032, -0.3276256, 1, 0, 0, 1, 1,
-0.3555008, -0.4968599, -1.329407, 1, 0, 0, 1, 1,
-0.3527997, 1.05215, -0.3397626, 1, 0, 0, 1, 1,
-0.3492509, -1.018827, -2.712908, 1, 0, 0, 1, 1,
-0.3483303, 0.4713589, -1.625868, 1, 0, 0, 1, 1,
-0.3470436, 1.861105, -0.275153, 0, 0, 0, 1, 1,
-0.3420531, -0.06733467, -0.7780485, 0, 0, 0, 1, 1,
-0.3372987, 0.4498233, -0.7419021, 0, 0, 0, 1, 1,
-0.335251, -0.4113183, -1.890099, 0, 0, 0, 1, 1,
-0.3310815, 0.1549191, -2.138833, 0, 0, 0, 1, 1,
-0.329429, 0.3631259, -2.185348, 0, 0, 0, 1, 1,
-0.3284036, 0.2713589, -0.4224293, 0, 0, 0, 1, 1,
-0.3274004, 1.725152, 0.9532694, 1, 1, 1, 1, 1,
-0.3219095, -0.7330453, -1.622987, 1, 1, 1, 1, 1,
-0.3195865, 0.1772602, -1.950286, 1, 1, 1, 1, 1,
-0.312608, 0.6233574, 0.1376179, 1, 1, 1, 1, 1,
-0.3096114, 0.8277424, 0.002915632, 1, 1, 1, 1, 1,
-0.3055241, 0.2057634, -0.6936153, 1, 1, 1, 1, 1,
-0.3051553, 0.6005214, -1.89595, 1, 1, 1, 1, 1,
-0.3032568, -0.7055625, -4.545503, 1, 1, 1, 1, 1,
-0.3009793, 0.7093191, -0.6062, 1, 1, 1, 1, 1,
-0.3005014, 0.4690081, 0.2965608, 1, 1, 1, 1, 1,
-0.2999874, 0.5226976, -0.4577218, 1, 1, 1, 1, 1,
-0.2992932, 0.6175787, 0.103825, 1, 1, 1, 1, 1,
-0.2948842, 0.7377633, -1.193613, 1, 1, 1, 1, 1,
-0.2920053, -0.8385139, -1.491941, 1, 1, 1, 1, 1,
-0.2888595, -0.6690835, -2.266804, 1, 1, 1, 1, 1,
-0.2871314, -0.3310565, -1.817295, 0, 0, 1, 1, 1,
-0.2860036, 1.817966, -1.243334, 1, 0, 0, 1, 1,
-0.2801867, -1.506609, -2.910671, 1, 0, 0, 1, 1,
-0.2753455, -0.4849321, -2.657795, 1, 0, 0, 1, 1,
-0.2709886, 0.5616279, -2.241644, 1, 0, 0, 1, 1,
-0.2611632, 0.07232005, -3.903466, 1, 0, 0, 1, 1,
-0.260083, -0.3638609, -3.372113, 0, 0, 0, 1, 1,
-0.2494186, 0.9518346, -1.301137, 0, 0, 0, 1, 1,
-0.2493636, -0.835231, -3.556617, 0, 0, 0, 1, 1,
-0.248039, 0.2551704, -1.034248, 0, 0, 0, 1, 1,
-0.2457899, -0.6555452, -4.074218, 0, 0, 0, 1, 1,
-0.245368, -0.08792242, -2.299574, 0, 0, 0, 1, 1,
-0.2439407, 0.5596494, -1.200593, 0, 0, 0, 1, 1,
-0.2369762, -1.141875, -4.46091, 1, 1, 1, 1, 1,
-0.2347552, -0.6849071, -2.993398, 1, 1, 1, 1, 1,
-0.2312009, -1.070696, -2.433632, 1, 1, 1, 1, 1,
-0.2310731, -0.5393646, -2.845784, 1, 1, 1, 1, 1,
-0.2293356, -1.838565, -4.290801, 1, 1, 1, 1, 1,
-0.2279713, -0.2148603, -3.198523, 1, 1, 1, 1, 1,
-0.2275696, 1.341445, 0.08113346, 1, 1, 1, 1, 1,
-0.2254232, 0.8604283, 0.3455519, 1, 1, 1, 1, 1,
-0.2247948, -0.9118516, -2.343628, 1, 1, 1, 1, 1,
-0.2244737, -0.8172974, -2.755972, 1, 1, 1, 1, 1,
-0.223473, -0.2352602, -2.198311, 1, 1, 1, 1, 1,
-0.2171981, 1.083502, 0.6393634, 1, 1, 1, 1, 1,
-0.215791, -0.04940572, -1.905022, 1, 1, 1, 1, 1,
-0.2147628, -1.228014, -3.013728, 1, 1, 1, 1, 1,
-0.202466, 1.330675, -0.6122353, 1, 1, 1, 1, 1,
-0.2015938, -1.682391, -3.382294, 0, 0, 1, 1, 1,
-0.198879, 0.7233456, -1.114407, 1, 0, 0, 1, 1,
-0.1985427, 0.8378291, -1.504601, 1, 0, 0, 1, 1,
-0.1913858, 0.8216929, 0.7502997, 1, 0, 0, 1, 1,
-0.1903242, -1.215423, -1.552466, 1, 0, 0, 1, 1,
-0.1892753, -1.818825, -4.032228, 1, 0, 0, 1, 1,
-0.1891399, 0.7814956, -1.105765, 0, 0, 0, 1, 1,
-0.1889709, 0.165944, -0.1667747, 0, 0, 0, 1, 1,
-0.188156, 1.385526, -0.3387232, 0, 0, 0, 1, 1,
-0.1874602, 2.246743, 0.3330568, 0, 0, 0, 1, 1,
-0.1857919, -1.431922, -3.063948, 0, 0, 0, 1, 1,
-0.1848174, -0.559011, -2.342975, 0, 0, 0, 1, 1,
-0.1807395, 0.1156734, -2.434802, 0, 0, 0, 1, 1,
-0.1794493, -0.1919293, -1.12252, 1, 1, 1, 1, 1,
-0.1789029, 1.915418, 0.3769339, 1, 1, 1, 1, 1,
-0.1777681, -1.525942, -0.1330935, 1, 1, 1, 1, 1,
-0.1710816, -0.944976, -2.414519, 1, 1, 1, 1, 1,
-0.1709585, -0.01732667, -1.817187, 1, 1, 1, 1, 1,
-0.1658783, 1.402569, 0.7934971, 1, 1, 1, 1, 1,
-0.1649238, -0.1007394, -0.3959311, 1, 1, 1, 1, 1,
-0.1644778, 1.520406, 0.4752839, 1, 1, 1, 1, 1,
-0.1589173, -0.3260685, -3.805648, 1, 1, 1, 1, 1,
-0.1585554, 0.7323971, 1.410482, 1, 1, 1, 1, 1,
-0.1545797, -2.244436, -3.972571, 1, 1, 1, 1, 1,
-0.1533402, -1.121708, -1.698977, 1, 1, 1, 1, 1,
-0.1528423, -0.099352, -3.182817, 1, 1, 1, 1, 1,
-0.1519353, 0.4962596, 0.2882613, 1, 1, 1, 1, 1,
-0.1506676, -2.06025, -3.949952, 1, 1, 1, 1, 1,
-0.1489656, -0.6593773, -2.967919, 0, 0, 1, 1, 1,
-0.1477792, -1.515969, -3.513884, 1, 0, 0, 1, 1,
-0.1450831, -0.9724842, -2.615689, 1, 0, 0, 1, 1,
-0.1396035, 0.1757485, -2.935804, 1, 0, 0, 1, 1,
-0.1334043, 0.7818694, -1.077942, 1, 0, 0, 1, 1,
-0.1332519, -0.2671806, -2.57074, 1, 0, 0, 1, 1,
-0.1328552, -1.322739, -3.516853, 0, 0, 0, 1, 1,
-0.1307084, -0.3663272, -4.329615, 0, 0, 0, 1, 1,
-0.1298762, -0.8867283, -3.7614, 0, 0, 0, 1, 1,
-0.1291832, 0.265468, 0.04870043, 0, 0, 0, 1, 1,
-0.1278792, -0.608938, -1.374798, 0, 0, 0, 1, 1,
-0.1245195, 0.9097617, -1.705929, 0, 0, 0, 1, 1,
-0.1235161, -0.3753914, -2.538287, 0, 0, 0, 1, 1,
-0.1177687, 0.03852049, -1.900758, 1, 1, 1, 1, 1,
-0.1175779, -2.610254, -1.845137, 1, 1, 1, 1, 1,
-0.1160864, 0.1182586, 1.181002, 1, 1, 1, 1, 1,
-0.1141386, -1.704761, -2.756489, 1, 1, 1, 1, 1,
-0.109246, 0.5334272, -0.5622031, 1, 1, 1, 1, 1,
-0.107874, -1.03525, -0.5705884, 1, 1, 1, 1, 1,
-0.1032682, 0.6656414, 0.3547801, 1, 1, 1, 1, 1,
-0.09816611, -0.3599754, -3.261235, 1, 1, 1, 1, 1,
-0.09734584, -0.7543251, -2.440091, 1, 1, 1, 1, 1,
-0.0951769, -1.504427, -2.205777, 1, 1, 1, 1, 1,
-0.09428276, 1.475866, 0.1760048, 1, 1, 1, 1, 1,
-0.09361158, 1.381476, 1.545304, 1, 1, 1, 1, 1,
-0.0927145, -1.502142, -2.151423, 1, 1, 1, 1, 1,
-0.09071883, 0.246545, -0.9475132, 1, 1, 1, 1, 1,
-0.08821556, -0.9915831, -2.716433, 1, 1, 1, 1, 1,
-0.08677538, -1.709105, -2.698333, 0, 0, 1, 1, 1,
-0.08221748, 0.1567306, 0.05179864, 1, 0, 0, 1, 1,
-0.08070961, 0.02554564, -1.845261, 1, 0, 0, 1, 1,
-0.07973632, -0.776618, -2.613018, 1, 0, 0, 1, 1,
-0.07930715, -0.2669198, -2.389525, 1, 0, 0, 1, 1,
-0.07858499, -0.7278526, -2.263236, 1, 0, 0, 1, 1,
-0.07787778, -1.114531, -2.485529, 0, 0, 0, 1, 1,
-0.07521728, -0.2347818, -2.549999, 0, 0, 0, 1, 1,
-0.07298401, -0.06152439, -4.088339, 0, 0, 0, 1, 1,
-0.0726428, 0.4744341, -0.1586635, 0, 0, 0, 1, 1,
-0.07010274, 1.216889, 0.4197069, 0, 0, 0, 1, 1,
-0.06796052, -0.3999423, -3.180722, 0, 0, 0, 1, 1,
-0.06756924, -0.8374215, -2.472551, 0, 0, 0, 1, 1,
-0.05777948, 1.024719, -0.8983511, 1, 1, 1, 1, 1,
-0.04525913, -1.64027, -3.485242, 1, 1, 1, 1, 1,
-0.04160606, 0.7289515, -1.579215, 1, 1, 1, 1, 1,
-0.0395477, -0.2211847, -2.896796, 1, 1, 1, 1, 1,
-0.03859724, -0.4691567, -2.062151, 1, 1, 1, 1, 1,
-0.03795883, -0.04826643, -3.071877, 1, 1, 1, 1, 1,
-0.03440476, 1.320441, 0.4789824, 1, 1, 1, 1, 1,
-0.03093121, 0.8110324, -1.364851, 1, 1, 1, 1, 1,
-0.02852177, 1.291425, -0.2307526, 1, 1, 1, 1, 1,
-0.02836049, 0.04329238, -1.51727, 1, 1, 1, 1, 1,
-0.02313239, -1.216362, -4.509022, 1, 1, 1, 1, 1,
-0.02128474, 2.000024, 0.1301798, 1, 1, 1, 1, 1,
-0.01994283, -0.1349117, -2.859944, 1, 1, 1, 1, 1,
-0.01651401, -0.6464502, -3.826779, 1, 1, 1, 1, 1,
-0.01594882, 0.7045507, -0.5909103, 1, 1, 1, 1, 1,
-0.01259714, -0.6127363, -3.216389, 0, 0, 1, 1, 1,
0.003467284, -0.002572903, 1.867212, 1, 0, 0, 1, 1,
0.00444725, -1.286321, 3.124533, 1, 0, 0, 1, 1,
0.004638608, 1.04967, 0.8586088, 1, 0, 0, 1, 1,
0.007931264, -0.7386974, 3.128894, 1, 0, 0, 1, 1,
0.01204228, -1.300656, 3.52508, 1, 0, 0, 1, 1,
0.01207615, 0.492847, -0.1030242, 0, 0, 0, 1, 1,
0.02140096, 1.09395, 0.3917442, 0, 0, 0, 1, 1,
0.02328838, -1.290743, 3.297953, 0, 0, 0, 1, 1,
0.02363445, 0.7461447, 0.06639705, 0, 0, 0, 1, 1,
0.02553916, 0.5846864, -0.09784095, 0, 0, 0, 1, 1,
0.02607629, 2.005641, -0.9826747, 0, 0, 0, 1, 1,
0.02656372, 0.7401228, -0.4897594, 0, 0, 0, 1, 1,
0.03048737, -0.007152414, -0.5329373, 1, 1, 1, 1, 1,
0.03162094, -1.311573, 3.05297, 1, 1, 1, 1, 1,
0.03353653, -0.3283814, 1.536642, 1, 1, 1, 1, 1,
0.03601998, 1.229884, -0.3133918, 1, 1, 1, 1, 1,
0.03938413, -1.360754, 1.793204, 1, 1, 1, 1, 1,
0.03941647, -0.4647464, 3.195342, 1, 1, 1, 1, 1,
0.04115166, 0.6947627, -2.779179, 1, 1, 1, 1, 1,
0.04281057, -0.3175854, 1.114033, 1, 1, 1, 1, 1,
0.04637859, -0.01190208, 1.66277, 1, 1, 1, 1, 1,
0.050397, -0.223729, 2.250069, 1, 1, 1, 1, 1,
0.05349605, -2.407442, 2.073116, 1, 1, 1, 1, 1,
0.05599576, -0.1436274, 3.267464, 1, 1, 1, 1, 1,
0.05774869, -1.272864, 3.033309, 1, 1, 1, 1, 1,
0.06131053, -0.2664833, 3.683995, 1, 1, 1, 1, 1,
0.06147392, -1.283537, 1.433497, 1, 1, 1, 1, 1,
0.06162253, 0.7681719, 0.3146442, 0, 0, 1, 1, 1,
0.07017967, -0.1302533, 1.929047, 1, 0, 0, 1, 1,
0.07164184, 0.6357569, 1.024162, 1, 0, 0, 1, 1,
0.07655092, -0.2475057, 5.22595, 1, 0, 0, 1, 1,
0.07662626, 1.757487, -0.4271659, 1, 0, 0, 1, 1,
0.07668683, -1.784731, 2.076827, 1, 0, 0, 1, 1,
0.07742286, -0.7236115, 2.801259, 0, 0, 0, 1, 1,
0.07758097, -0.3087341, 2.177023, 0, 0, 0, 1, 1,
0.07874127, -1.163632, 3.379489, 0, 0, 0, 1, 1,
0.0789772, 0.892921, -1.136259, 0, 0, 0, 1, 1,
0.08028774, -0.1256351, 3.020052, 0, 0, 0, 1, 1,
0.08100143, 0.3962675, 1.095193, 0, 0, 0, 1, 1,
0.08142043, -0.4755212, 1.911341, 0, 0, 0, 1, 1,
0.08618072, 0.7976276, 1.073886, 1, 1, 1, 1, 1,
0.08715146, 0.09799001, 0.8478314, 1, 1, 1, 1, 1,
0.08946164, -0.8971298, 2.3318, 1, 1, 1, 1, 1,
0.09064244, 0.08024652, 0.653998, 1, 1, 1, 1, 1,
0.0919552, 0.8470423, 0.1898751, 1, 1, 1, 1, 1,
0.09358798, 0.6101466, 1.026326, 1, 1, 1, 1, 1,
0.09473675, 0.3216681, 0.7106772, 1, 1, 1, 1, 1,
0.0978284, 0.2681348, -1.125574, 1, 1, 1, 1, 1,
0.1044484, -0.875393, 3.097321, 1, 1, 1, 1, 1,
0.1060706, 0.04837158, 2.90845, 1, 1, 1, 1, 1,
0.1084578, -0.5595583, 3.05277, 1, 1, 1, 1, 1,
0.1091646, -1.065069, 3.843841, 1, 1, 1, 1, 1,
0.1121657, 0.7140027, 0.5117672, 1, 1, 1, 1, 1,
0.1131617, 0.1192174, 0.7595109, 1, 1, 1, 1, 1,
0.1180213, -0.2282401, 3.425326, 1, 1, 1, 1, 1,
0.11803, -1.964052, 3.226428, 0, 0, 1, 1, 1,
0.1214499, -0.3512557, 2.46174, 1, 0, 0, 1, 1,
0.1223489, -0.9861636, 2.970673, 1, 0, 0, 1, 1,
0.1276102, 0.921478, -1.218271, 1, 0, 0, 1, 1,
0.1283575, 0.09658463, 0.8178464, 1, 0, 0, 1, 1,
0.1298213, 0.732991, 0.2063054, 1, 0, 0, 1, 1,
0.1299677, 0.5797948, 0.5640395, 0, 0, 0, 1, 1,
0.1325919, -1.201434, 2.814324, 0, 0, 0, 1, 1,
0.1335879, -0.2593113, 3.956116, 0, 0, 0, 1, 1,
0.1349774, -0.9781652, 3.856291, 0, 0, 0, 1, 1,
0.135697, 0.6723832, 0.4591861, 0, 0, 0, 1, 1,
0.1380185, -1.255807, 4.437988, 0, 0, 0, 1, 1,
0.138962, -0.8517385, 3.337727, 0, 0, 0, 1, 1,
0.140066, -0.1374365, 1.737954, 1, 1, 1, 1, 1,
0.1414959, 0.7365954, 1.225742, 1, 1, 1, 1, 1,
0.1441511, 0.4617071, -1.576344, 1, 1, 1, 1, 1,
0.1471871, -0.5313051, 2.370381, 1, 1, 1, 1, 1,
0.1477816, -1.159685, 5.195201, 1, 1, 1, 1, 1,
0.1493785, 0.7818831, 0.733127, 1, 1, 1, 1, 1,
0.1531189, 0.9977007, -0.5870559, 1, 1, 1, 1, 1,
0.1538268, -0.4306361, 3.094392, 1, 1, 1, 1, 1,
0.1564985, -1.073809, 3.62064, 1, 1, 1, 1, 1,
0.1570022, 0.9811838, 0.8275818, 1, 1, 1, 1, 1,
0.1573573, -0.4189169, 2.506163, 1, 1, 1, 1, 1,
0.1635327, -0.5872833, 2.569821, 1, 1, 1, 1, 1,
0.1635642, 0.1246212, 0.972881, 1, 1, 1, 1, 1,
0.1767839, 0.01704093, 1.843568, 1, 1, 1, 1, 1,
0.1775231, -0.1015019, 1.360748, 1, 1, 1, 1, 1,
0.1820872, 1.303729, 1.607092, 0, 0, 1, 1, 1,
0.1861364, 0.07268395, 0.2612907, 1, 0, 0, 1, 1,
0.1872671, 0.03544698, 1.160083, 1, 0, 0, 1, 1,
0.1883431, -0.04847145, 0.7458525, 1, 0, 0, 1, 1,
0.1921073, -0.7785424, 3.801375, 1, 0, 0, 1, 1,
0.1927025, 0.07962573, 1.160427, 1, 0, 0, 1, 1,
0.1975534, -0.8068419, 5.006263, 0, 0, 0, 1, 1,
0.1976784, -1.991059, 3.942026, 0, 0, 0, 1, 1,
0.1985592, -0.4317334, 2.647368, 0, 0, 0, 1, 1,
0.201778, -0.7848952, 4.118267, 0, 0, 0, 1, 1,
0.2032631, 1.195583, 0.2083492, 0, 0, 0, 1, 1,
0.2077732, -0.855495, 1.658757, 0, 0, 0, 1, 1,
0.2085044, -0.2421668, 2.435526, 0, 0, 0, 1, 1,
0.2113138, 1.110905, -0.6818718, 1, 1, 1, 1, 1,
0.2152202, -0.4549446, 3.072072, 1, 1, 1, 1, 1,
0.2162592, 0.1823565, 1.042318, 1, 1, 1, 1, 1,
0.2175439, -0.8548581, 2.156381, 1, 1, 1, 1, 1,
0.2183894, 0.5577091, 0.9452781, 1, 1, 1, 1, 1,
0.2201284, -1.236754, 5.151577, 1, 1, 1, 1, 1,
0.2208742, -0.05460931, 2.522194, 1, 1, 1, 1, 1,
0.2231473, 0.1801431, -0.1484136, 1, 1, 1, 1, 1,
0.2279298, -0.04606096, 1.930063, 1, 1, 1, 1, 1,
0.2315249, -1.455336, 1.620143, 1, 1, 1, 1, 1,
0.2324869, -0.7917467, 1.184242, 1, 1, 1, 1, 1,
0.2350201, 2.090462, -0.7691301, 1, 1, 1, 1, 1,
0.2362738, 0.4433407, 1.256591, 1, 1, 1, 1, 1,
0.2446505, -0.396811, 3.003913, 1, 1, 1, 1, 1,
0.2447781, -1.456252, 1.697229, 1, 1, 1, 1, 1,
0.2452688, -0.8187881, 2.143554, 0, 0, 1, 1, 1,
0.249151, -0.1613949, 1.629153, 1, 0, 0, 1, 1,
0.250155, 0.3365521, -1.344309, 1, 0, 0, 1, 1,
0.2502576, 1.534656, -0.5774199, 1, 0, 0, 1, 1,
0.252738, -0.3503701, 1.336737, 1, 0, 0, 1, 1,
0.2547343, -1.540946, 3.831446, 1, 0, 0, 1, 1,
0.2549011, -0.008261044, -0.2309884, 0, 0, 0, 1, 1,
0.2582361, -0.1206627, 1.065121, 0, 0, 0, 1, 1,
0.2601407, 0.1524218, -0.1028853, 0, 0, 0, 1, 1,
0.2643704, -0.8040344, 2.859047, 0, 0, 0, 1, 1,
0.264389, -0.9090464, 2.824748, 0, 0, 0, 1, 1,
0.2646116, -0.5630687, 1.367869, 0, 0, 0, 1, 1,
0.2649101, 1.017693, -0.9469296, 0, 0, 0, 1, 1,
0.2767167, 1.355851, 0.3997942, 1, 1, 1, 1, 1,
0.2777347, -0.7618895, 4.181015, 1, 1, 1, 1, 1,
0.2780626, -0.3474599, 1.891101, 1, 1, 1, 1, 1,
0.2784641, 0.8909071, 0.2039944, 1, 1, 1, 1, 1,
0.2801325, 0.4703365, 0.8931287, 1, 1, 1, 1, 1,
0.2804302, 0.2670435, 0.4382555, 1, 1, 1, 1, 1,
0.2855975, 1.217887, 1.331101, 1, 1, 1, 1, 1,
0.2922871, -0.9883602, 2.364637, 1, 1, 1, 1, 1,
0.2969056, 0.5762104, 0.173315, 1, 1, 1, 1, 1,
0.2969897, 1.086931, 1.246975, 1, 1, 1, 1, 1,
0.3013553, -0.1458776, -0.3306824, 1, 1, 1, 1, 1,
0.3022828, -0.1993741, 1.384919, 1, 1, 1, 1, 1,
0.3040586, 0.2248535, 1.346112, 1, 1, 1, 1, 1,
0.3067129, -0.6914077, 3.12233, 1, 1, 1, 1, 1,
0.311253, -2.035895, 3.151515, 1, 1, 1, 1, 1,
0.3141268, 0.2085448, 0.7792305, 0, 0, 1, 1, 1,
0.3158843, -1.399694, 3.696426, 1, 0, 0, 1, 1,
0.3205844, -1.237416, 3.521883, 1, 0, 0, 1, 1,
0.3269966, 0.8378766, 2.07634, 1, 0, 0, 1, 1,
0.3303817, -0.6760154, 2.125797, 1, 0, 0, 1, 1,
0.337468, 0.3136313, 1.584851, 1, 0, 0, 1, 1,
0.3395034, 0.2196344, 0.3248892, 0, 0, 0, 1, 1,
0.3433953, -1.455642, 3.050866, 0, 0, 0, 1, 1,
0.3478306, 0.2261398, 1.947891, 0, 0, 0, 1, 1,
0.3484844, 0.4397402, 1.765694, 0, 0, 0, 1, 1,
0.3499061, -0.4959944, 2.696394, 0, 0, 0, 1, 1,
0.3543632, -1.241732, 3.908759, 0, 0, 0, 1, 1,
0.3546228, 0.3550456, -0.442534, 0, 0, 0, 1, 1,
0.3550257, -0.1617733, 2.503006, 1, 1, 1, 1, 1,
0.3584442, 1.270913, 0.501761, 1, 1, 1, 1, 1,
0.3585259, -0.1376741, 2.046704, 1, 1, 1, 1, 1,
0.359005, 0.1037671, 1.645762, 1, 1, 1, 1, 1,
0.3696618, 1.541004, -0.5959781, 1, 1, 1, 1, 1,
0.3722503, -1.705778, 4.912064, 1, 1, 1, 1, 1,
0.3758763, 0.1432409, 1.028975, 1, 1, 1, 1, 1,
0.3777139, 0.6362381, -0.04525989, 1, 1, 1, 1, 1,
0.37929, 1.441327, -0.2083787, 1, 1, 1, 1, 1,
0.3807523, -1.270096, 3.84548, 1, 1, 1, 1, 1,
0.38178, -0.2253302, 2.531528, 1, 1, 1, 1, 1,
0.382954, 0.4235277, 0.59378, 1, 1, 1, 1, 1,
0.3855438, -1.628506, 2.93146, 1, 1, 1, 1, 1,
0.3915275, 0.4306258, 0.8763023, 1, 1, 1, 1, 1,
0.3926498, 0.2581753, -0.3576655, 1, 1, 1, 1, 1,
0.3945395, -0.1443939, 1.645758, 0, 0, 1, 1, 1,
0.3965211, -0.2804098, 0.6434773, 1, 0, 0, 1, 1,
0.3991138, 0.09177518, 1.869377, 1, 0, 0, 1, 1,
0.399169, -0.1700802, 2.829607, 1, 0, 0, 1, 1,
0.4005175, -1.235191, 3.902052, 1, 0, 0, 1, 1,
0.4022758, -1.010692, 4.227155, 1, 0, 0, 1, 1,
0.406472, 0.5482168, 0.8948355, 0, 0, 0, 1, 1,
0.4083233, 0.1779371, 2.019046, 0, 0, 0, 1, 1,
0.4108893, -0.5108861, 1.477399, 0, 0, 0, 1, 1,
0.4110147, -0.03447203, -0.8452459, 0, 0, 0, 1, 1,
0.4126576, -0.8605698, 4.43207, 0, 0, 0, 1, 1,
0.4126899, -2.914092, 3.401906, 0, 0, 0, 1, 1,
0.4165012, -0.6116467, 1.793807, 0, 0, 0, 1, 1,
0.4223064, -1.19088, 1.536688, 1, 1, 1, 1, 1,
0.423125, -0.1124611, 1.967471, 1, 1, 1, 1, 1,
0.4242099, 0.3208036, 3.05706, 1, 1, 1, 1, 1,
0.4276412, -1.270064, 3.841077, 1, 1, 1, 1, 1,
0.4313318, -0.4925202, 1.281299, 1, 1, 1, 1, 1,
0.4333929, -0.3252125, 3.311389, 1, 1, 1, 1, 1,
0.4345703, 0.01409259, -0.2511103, 1, 1, 1, 1, 1,
0.4352536, -0.7520198, 2.413395, 1, 1, 1, 1, 1,
0.4368735, -0.5471456, 2.281635, 1, 1, 1, 1, 1,
0.4371381, 0.434416, 2.628999, 1, 1, 1, 1, 1,
0.4403687, 1.389156, 0.6951599, 1, 1, 1, 1, 1,
0.446657, 0.9877993, 0.86224, 1, 1, 1, 1, 1,
0.4469825, -1.020179, 2.519181, 1, 1, 1, 1, 1,
0.4515103, -1.454193, 2.47907, 1, 1, 1, 1, 1,
0.4529077, -0.4346861, 2.405206, 1, 1, 1, 1, 1,
0.4530914, 0.9973906, 1.868088, 0, 0, 1, 1, 1,
0.4554548, -0.4107015, 3.594324, 1, 0, 0, 1, 1,
0.4589344, 0.4358938, -0.7870839, 1, 0, 0, 1, 1,
0.4603468, 0.5055181, 0.3062074, 1, 0, 0, 1, 1,
0.4623566, 0.4104386, 2.632674, 1, 0, 0, 1, 1,
0.4646471, 0.4566624, 1.245904, 1, 0, 0, 1, 1,
0.4716059, 0.9397135, 0.4832404, 0, 0, 0, 1, 1,
0.4717865, 1.019096, 0.5899938, 0, 0, 0, 1, 1,
0.4747016, -0.2315286, 2.537309, 0, 0, 0, 1, 1,
0.477934, -0.7754172, 2.792857, 0, 0, 0, 1, 1,
0.4812462, 0.2589244, 1.461163, 0, 0, 0, 1, 1,
0.4859783, -0.4524023, 4.267163, 0, 0, 0, 1, 1,
0.4870854, 0.7617532, -0.07387086, 0, 0, 0, 1, 1,
0.4889436, -0.9318127, 1.919676, 1, 1, 1, 1, 1,
0.4911223, 1.639894, -1.990427, 1, 1, 1, 1, 1,
0.4949181, 1.142835, 0.1409265, 1, 1, 1, 1, 1,
0.5028146, 1.332282, 0.7076418, 1, 1, 1, 1, 1,
0.5086148, -0.001873929, 1.794153, 1, 1, 1, 1, 1,
0.510325, 1.338251, -0.4043303, 1, 1, 1, 1, 1,
0.511422, -0.9038575, 3.593498, 1, 1, 1, 1, 1,
0.5142881, -0.5699683, 3.598983, 1, 1, 1, 1, 1,
0.5148677, 0.378342, -0.1218614, 1, 1, 1, 1, 1,
0.5190873, 0.4631211, 1.397364, 1, 1, 1, 1, 1,
0.5249473, 1.109411, 1.478563, 1, 1, 1, 1, 1,
0.5252763, -0.2164483, 2.076195, 1, 1, 1, 1, 1,
0.5263166, -0.07551356, 1.120708, 1, 1, 1, 1, 1,
0.530046, -0.5201861, 2.644813, 1, 1, 1, 1, 1,
0.5345784, 0.9973713, 2.048397, 1, 1, 1, 1, 1,
0.535327, 0.5269805, 1.568659, 0, 0, 1, 1, 1,
0.5392929, -1.005418, 1.087668, 1, 0, 0, 1, 1,
0.5476405, 1.690678, 0.3452302, 1, 0, 0, 1, 1,
0.5536519, 0.8600324, 0.4734817, 1, 0, 0, 1, 1,
0.5541458, 0.9019181, -0.71069, 1, 0, 0, 1, 1,
0.5591402, -1.213554, 3.499964, 1, 0, 0, 1, 1,
0.5597522, 0.09406294, 2.52722, 0, 0, 0, 1, 1,
0.5625132, -1.327138, 3.479407, 0, 0, 0, 1, 1,
0.5643129, -0.4782886, 2.456335, 0, 0, 0, 1, 1,
0.5671754, 0.3772354, 2.990773, 0, 0, 0, 1, 1,
0.5720252, 1.005711, 0.6356596, 0, 0, 0, 1, 1,
0.5855455, -0.334639, 2.598048, 0, 0, 0, 1, 1,
0.5873369, -0.9299764, 4.139609, 0, 0, 0, 1, 1,
0.5901569, -0.8703862, 2.197834, 1, 1, 1, 1, 1,
0.5937263, 0.4118499, 0.9755714, 1, 1, 1, 1, 1,
0.5974554, -0.5004202, 4.225902, 1, 1, 1, 1, 1,
0.6043321, 1.381288, -0.3848319, 1, 1, 1, 1, 1,
0.6044157, 0.4322347, 0.8180672, 1, 1, 1, 1, 1,
0.6050884, -0.8820651, 1.980852, 1, 1, 1, 1, 1,
0.6053256, -0.5783091, 1.847783, 1, 1, 1, 1, 1,
0.6054811, -0.5020127, 2.738911, 1, 1, 1, 1, 1,
0.6106696, 0.7446197, 0.007759871, 1, 1, 1, 1, 1,
0.6112115, 0.360179, 0.9509307, 1, 1, 1, 1, 1,
0.6114245, 0.8264458, -0.9973873, 1, 1, 1, 1, 1,
0.6118198, 0.1347884, 1.403386, 1, 1, 1, 1, 1,
0.6134304, -0.7643669, 2.965587, 1, 1, 1, 1, 1,
0.6135673, 1.075628, 1.426481, 1, 1, 1, 1, 1,
0.6141164, -1.298162, 1.711913, 1, 1, 1, 1, 1,
0.6184725, -0.5142428, 3.323876, 0, 0, 1, 1, 1,
0.6207102, 1.331878, 1.363497, 1, 0, 0, 1, 1,
0.6222647, 0.9486399, 0.9879595, 1, 0, 0, 1, 1,
0.624303, -0.3166594, 1.899307, 1, 0, 0, 1, 1,
0.6253935, 0.5383417, 1.156584, 1, 0, 0, 1, 1,
0.627188, 0.05813232, 0.4173972, 1, 0, 0, 1, 1,
0.6274087, -1.013539, 0.8431774, 0, 0, 0, 1, 1,
0.6288573, 0.9591278, -0.1446136, 0, 0, 0, 1, 1,
0.6295174, -1.236229, 3.023719, 0, 0, 0, 1, 1,
0.6417098, 2.237979, -0.4541359, 0, 0, 0, 1, 1,
0.6555321, 0.9734061, 0.9636663, 0, 0, 0, 1, 1,
0.6560531, -0.7149087, 3.669444, 0, 0, 0, 1, 1,
0.6566408, 0.5233249, 0.6271532, 0, 0, 0, 1, 1,
0.6591725, -1.211649, 4.116637, 1, 1, 1, 1, 1,
0.6604773, 1.150363, 1.636492, 1, 1, 1, 1, 1,
0.6609656, 2.091297, -0.171354, 1, 1, 1, 1, 1,
0.6628571, 1.135774, 2.712989, 1, 1, 1, 1, 1,
0.6707201, 0.7258246, 0.9025804, 1, 1, 1, 1, 1,
0.6740212, -0.7476204, 2.82035, 1, 1, 1, 1, 1,
0.675845, 0.1286037, 2.795604, 1, 1, 1, 1, 1,
0.6791562, -0.07506011, 1.546497, 1, 1, 1, 1, 1,
0.6796051, -0.1397991, 0.2866842, 1, 1, 1, 1, 1,
0.6796445, -0.06892267, 0.580206, 1, 1, 1, 1, 1,
0.6798345, -0.4458316, 0.5422139, 1, 1, 1, 1, 1,
0.6825205, 0.7232016, 2.422926, 1, 1, 1, 1, 1,
0.6836296, -1.1309, 3.644751, 1, 1, 1, 1, 1,
0.6859815, 1.713227, 0.5970505, 1, 1, 1, 1, 1,
0.6863207, 1.389718, -0.8858948, 1, 1, 1, 1, 1,
0.6876742, 0.4765319, 0.1587244, 0, 0, 1, 1, 1,
0.6900128, -0.5071106, 1.801265, 1, 0, 0, 1, 1,
0.6965029, 0.0896605, -0.9029154, 1, 0, 0, 1, 1,
0.6969464, -0.573643, 2.421071, 1, 0, 0, 1, 1,
0.6988436, 1.366055, 0.215973, 1, 0, 0, 1, 1,
0.6990839, -1.22421, 4.240293, 1, 0, 0, 1, 1,
0.6991335, -0.3096314, 0.9684607, 0, 0, 0, 1, 1,
0.703669, 0.6743277, 0.6504797, 0, 0, 0, 1, 1,
0.7161739, -1.405627, 3.02942, 0, 0, 0, 1, 1,
0.7248154, 0.5759608, 0.0477882, 0, 0, 0, 1, 1,
0.728851, -0.07666349, 1.246199, 0, 0, 0, 1, 1,
0.7290043, -1.822268, 2.130919, 0, 0, 0, 1, 1,
0.7292528, -0.3161686, 3.836444, 0, 0, 0, 1, 1,
0.7338684, 0.7186315, -0.01523517, 1, 1, 1, 1, 1,
0.7391461, -1.420027, 2.686093, 1, 1, 1, 1, 1,
0.7399396, -0.3793705, 2.967956, 1, 1, 1, 1, 1,
0.7419586, -1.020743, 1.855758, 1, 1, 1, 1, 1,
0.7427159, 0.1216069, 1.157251, 1, 1, 1, 1, 1,
0.7469074, 0.0300185, 2.245675, 1, 1, 1, 1, 1,
0.7561018, 0.6553121, 1.097215, 1, 1, 1, 1, 1,
0.7562504, 0.01207802, 2.48762, 1, 1, 1, 1, 1,
0.7600687, 0.3113796, -0.490961, 1, 1, 1, 1, 1,
0.7629693, -1.106567, 1.876886, 1, 1, 1, 1, 1,
0.7710581, 1.130134, 0.726094, 1, 1, 1, 1, 1,
0.7741186, -1.071434, 2.51355, 1, 1, 1, 1, 1,
0.7798321, -0.6764324, 2.420095, 1, 1, 1, 1, 1,
0.7827231, 0.9305049, -0.2586583, 1, 1, 1, 1, 1,
0.7917759, 1.361596, 0.5054768, 1, 1, 1, 1, 1,
0.7962099, 0.3402785, -0.5606563, 0, 0, 1, 1, 1,
0.7995906, 2.231928, 0.695757, 1, 0, 0, 1, 1,
0.8069995, -0.7357346, 1.630774, 1, 0, 0, 1, 1,
0.8168555, -0.3006888, 2.929977, 1, 0, 0, 1, 1,
0.8233504, -1.225236, 2.217815, 1, 0, 0, 1, 1,
0.825143, -1.417007, 2.91537, 1, 0, 0, 1, 1,
0.8258913, 0.5877982, -0.4987207, 0, 0, 0, 1, 1,
0.8302568, 1.382668, 0.3743249, 0, 0, 0, 1, 1,
0.8318358, -0.8144727, 1.756327, 0, 0, 0, 1, 1,
0.8388923, 1.680308, 1.409686, 0, 0, 0, 1, 1,
0.840685, 0.857459, 1.526501, 0, 0, 0, 1, 1,
0.8410332, 0.5551696, 1.979825, 0, 0, 0, 1, 1,
0.8432277, -0.04545321, 1.858451, 0, 0, 0, 1, 1,
0.8509849, 0.1258154, 1.934579, 1, 1, 1, 1, 1,
0.86567, -0.1262006, 1.55377, 1, 1, 1, 1, 1,
0.8673227, 0.1725507, 3.178995, 1, 1, 1, 1, 1,
0.8719597, 1.005352, 1.291393, 1, 1, 1, 1, 1,
0.8721451, -1.608778, 2.964744, 1, 1, 1, 1, 1,
0.8757849, -0.8810051, 2.537432, 1, 1, 1, 1, 1,
0.8848412, -0.4129418, 3.280044, 1, 1, 1, 1, 1,
0.8871045, 0.3770497, 1.429171, 1, 1, 1, 1, 1,
0.8874827, 0.04122798, 3.35212, 1, 1, 1, 1, 1,
0.9000469, 0.7660697, 0.4491829, 1, 1, 1, 1, 1,
0.9009167, 0.1742571, 0.7842544, 1, 1, 1, 1, 1,
0.9020212, -1.248186, 2.549978, 1, 1, 1, 1, 1,
0.9055675, 0.7546306, 0.7058498, 1, 1, 1, 1, 1,
0.9099219, -0.9921791, 4.037666, 1, 1, 1, 1, 1,
0.9205983, -0.8689691, 4.753917, 1, 1, 1, 1, 1,
0.9252689, 1.185771, -0.4720694, 0, 0, 1, 1, 1,
0.9298034, -0.3475519, 1.88883, 1, 0, 0, 1, 1,
0.9302236, -1.90479, 2.586071, 1, 0, 0, 1, 1,
0.9325374, -0.6663062, 1.624714, 1, 0, 0, 1, 1,
0.9379901, 0.6190858, 2.566751, 1, 0, 0, 1, 1,
0.9512819, 0.9079092, 1.228876, 1, 0, 0, 1, 1,
0.9513249, 0.02054371, 1.74028, 0, 0, 0, 1, 1,
0.9542288, -0.568128, 3.722112, 0, 0, 0, 1, 1,
0.9607168, -0.02416376, 2.580624, 0, 0, 0, 1, 1,
0.9740881, -0.4111519, 1.638904, 0, 0, 0, 1, 1,
0.9765168, -0.01625228, 2.767776, 0, 0, 0, 1, 1,
0.9825813, -0.7113657, 1.635243, 0, 0, 0, 1, 1,
0.9842597, 1.549558, 0.5610906, 0, 0, 0, 1, 1,
0.9950876, -0.7277471, 0.1518397, 1, 1, 1, 1, 1,
0.9955971, -0.6529029, 2.338353, 1, 1, 1, 1, 1,
0.9988869, 1.495355, 0.1808539, 1, 1, 1, 1, 1,
1.001388, -0.4657039, 2.477012, 1, 1, 1, 1, 1,
1.002558, -0.4029519, 1.330292, 1, 1, 1, 1, 1,
1.003547, 1.713892, 0.2574184, 1, 1, 1, 1, 1,
1.014107, -0.5338421, 1.24368, 1, 1, 1, 1, 1,
1.017368, -1.701644, 1.238481, 1, 1, 1, 1, 1,
1.035635, 0.8849669, 1.547358, 1, 1, 1, 1, 1,
1.038035, -2.192221, 3.681324, 1, 1, 1, 1, 1,
1.040304, -1.3941, 3.364119, 1, 1, 1, 1, 1,
1.048521, -0.2491789, 3.12174, 1, 1, 1, 1, 1,
1.049686, -0.7563118, 2.266117, 1, 1, 1, 1, 1,
1.049837, -1.165469, 1.831088, 1, 1, 1, 1, 1,
1.054513, 0.8247811, 2.380601, 1, 1, 1, 1, 1,
1.062973, -0.8023014, 2.597438, 0, 0, 1, 1, 1,
1.067195, -0.6581975, 3.3277, 1, 0, 0, 1, 1,
1.079666, 0.8639565, 0.9886096, 1, 0, 0, 1, 1,
1.082963, 0.2911702, 3.275913, 1, 0, 0, 1, 1,
1.084515, 1.322204, 1.668263, 1, 0, 0, 1, 1,
1.09373, -2.516194, 2.170501, 1, 0, 0, 1, 1,
1.106271, 0.1476195, 2.351511, 0, 0, 0, 1, 1,
1.110175, 0.4713903, 1.729014, 0, 0, 0, 1, 1,
1.11553, -0.1670593, 0.4189651, 0, 0, 0, 1, 1,
1.121799, -0.07309862, 0.2403415, 0, 0, 0, 1, 1,
1.1239, -1.73374, 2.872331, 0, 0, 0, 1, 1,
1.133751, -0.8381273, 2.808174, 0, 0, 0, 1, 1,
1.135894, 0.185898, 1.811168, 0, 0, 0, 1, 1,
1.136683, 0.9025581, 1.962471, 1, 1, 1, 1, 1,
1.137571, 0.482694, 1.421145, 1, 1, 1, 1, 1,
1.142509, -1.313177, 3.134794, 1, 1, 1, 1, 1,
1.149751, -1.137315, 1.790931, 1, 1, 1, 1, 1,
1.16747, 0.06890486, 0.5532516, 1, 1, 1, 1, 1,
1.168214, 0.6343417, 0.2332097, 1, 1, 1, 1, 1,
1.169657, -0.4214027, 1.568089, 1, 1, 1, 1, 1,
1.1876, -0.6415793, 2.403426, 1, 1, 1, 1, 1,
1.188602, 0.08327367, 0.5093103, 1, 1, 1, 1, 1,
1.191649, 0.02581171, -0.6511987, 1, 1, 1, 1, 1,
1.198025, -1.544954, 1.71215, 1, 1, 1, 1, 1,
1.212872, -0.4488245, 2.096463, 1, 1, 1, 1, 1,
1.216318, 0.1492862, 0.8139355, 1, 1, 1, 1, 1,
1.220969, -0.8449385, 1.440465, 1, 1, 1, 1, 1,
1.222786, 1.642034, 0.4414372, 1, 1, 1, 1, 1,
1.227557, -0.1879176, 1.782674, 0, 0, 1, 1, 1,
1.227795, 1.074631, 0.5149937, 1, 0, 0, 1, 1,
1.228778, 1.377552, 1.957496, 1, 0, 0, 1, 1,
1.239422, -1.545657, 0.5650904, 1, 0, 0, 1, 1,
1.243783, -1.124613, 2.838528, 1, 0, 0, 1, 1,
1.244313, 0.6000564, 0.442632, 1, 0, 0, 1, 1,
1.247929, -0.7144777, 1.351317, 0, 0, 0, 1, 1,
1.251442, -0.1721716, 3.320038, 0, 0, 0, 1, 1,
1.251789, 0.2152909, 1.106112, 0, 0, 0, 1, 1,
1.252827, 0.5103458, 1.351402, 0, 0, 0, 1, 1,
1.25946, 1.343117, 0.3893386, 0, 0, 0, 1, 1,
1.264335, -0.2725124, 2.448788, 0, 0, 0, 1, 1,
1.270674, 0.03266969, 0.9978628, 0, 0, 0, 1, 1,
1.27443, -0.1331544, 0.4769192, 1, 1, 1, 1, 1,
1.283266, -2.027948, 2.076618, 1, 1, 1, 1, 1,
1.287003, 2.236353, -1.098783, 1, 1, 1, 1, 1,
1.288014, -0.3178065, 3.487736, 1, 1, 1, 1, 1,
1.288876, 1.563751, 1.12357, 1, 1, 1, 1, 1,
1.292275, -1.28405, 1.840089, 1, 1, 1, 1, 1,
1.296144, 0.3181379, 0.9986714, 1, 1, 1, 1, 1,
1.298181, 0.7169244, 2.146682, 1, 1, 1, 1, 1,
1.32335, -2.053571, 2.848456, 1, 1, 1, 1, 1,
1.333466, -0.7066602, 2.574002, 1, 1, 1, 1, 1,
1.338515, 1.854053, 0.3733198, 1, 1, 1, 1, 1,
1.338998, 1.004268, 1.241466, 1, 1, 1, 1, 1,
1.344886, -0.8218609, 3.05668, 1, 1, 1, 1, 1,
1.345199, -1.010694, 1.288476, 1, 1, 1, 1, 1,
1.374951, 0.01248677, 1.417601, 1, 1, 1, 1, 1,
1.382829, -0.8797775, 3.486205, 0, 0, 1, 1, 1,
1.391736, 0.623419, 0.2433791, 1, 0, 0, 1, 1,
1.395928, 0.06067066, 0.7889428, 1, 0, 0, 1, 1,
1.396493, 0.5531898, 2.365556, 1, 0, 0, 1, 1,
1.404763, -0.7262428, 3.357174, 1, 0, 0, 1, 1,
1.410733, 0.1781162, 0.1934381, 1, 0, 0, 1, 1,
1.412347, 0.4569592, 1.585818, 0, 0, 0, 1, 1,
1.416711, 0.244407, 1.68963, 0, 0, 0, 1, 1,
1.420918, -1.769864, 2.725528, 0, 0, 0, 1, 1,
1.424708, -1.166383, 2.478602, 0, 0, 0, 1, 1,
1.433747, 0.3243831, 1.405686, 0, 0, 0, 1, 1,
1.436311, 2.0123, 0.6475307, 0, 0, 0, 1, 1,
1.450356, 0.6244864, 0.203264, 0, 0, 0, 1, 1,
1.466125, 0.8966665, 1.255281, 1, 1, 1, 1, 1,
1.468425, -1.265636, 2.445166, 1, 1, 1, 1, 1,
1.469506, -0.4807736, 2.297487, 1, 1, 1, 1, 1,
1.479815, 1.074217, 1.145003, 1, 1, 1, 1, 1,
1.486144, -0.2615941, 1.670545, 1, 1, 1, 1, 1,
1.50751, 0.1772359, 0.484164, 1, 1, 1, 1, 1,
1.511961, -0.2382215, 1.968989, 1, 1, 1, 1, 1,
1.528111, -1.075256, 1.828703, 1, 1, 1, 1, 1,
1.539014, -0.466922, 1.066925, 1, 1, 1, 1, 1,
1.545184, -1.302991, 3.025715, 1, 1, 1, 1, 1,
1.568611, 0.4778959, 2.542078, 1, 1, 1, 1, 1,
1.569768, -0.07218812, 0.1830056, 1, 1, 1, 1, 1,
1.576058, -0.7308984, 1.184508, 1, 1, 1, 1, 1,
1.583497, -0.3050064, 1.876418, 1, 1, 1, 1, 1,
1.591304, -0.4747702, 1.146212, 1, 1, 1, 1, 1,
1.591492, -0.1182567, 2.863763, 0, 0, 1, 1, 1,
1.601212, -0.2361806, 2.190236, 1, 0, 0, 1, 1,
1.607399, -0.6952215, 0.1041225, 1, 0, 0, 1, 1,
1.613281, -0.8201876, 1.597896, 1, 0, 0, 1, 1,
1.614999, -0.0555433, 2.718183, 1, 0, 0, 1, 1,
1.620533, 2.14566, 0.7089205, 1, 0, 0, 1, 1,
1.621506, 0.4330485, 0.8177381, 0, 0, 0, 1, 1,
1.623601, 0.5985427, -1.169648, 0, 0, 0, 1, 1,
1.625288, 1.255931, 1.398604, 0, 0, 0, 1, 1,
1.665073, 2.052273, 2.221397, 0, 0, 0, 1, 1,
1.668087, -1.521661, 4.347147, 0, 0, 0, 1, 1,
1.681563, -0.6485327, 2.380934, 0, 0, 0, 1, 1,
1.683423, 0.3762856, -0.1619341, 0, 0, 0, 1, 1,
1.710222, -0.5463752, 3.489183, 1, 1, 1, 1, 1,
1.71864, 0.1785512, 1.787042, 1, 1, 1, 1, 1,
1.720026, 0.1444668, 0.7635431, 1, 1, 1, 1, 1,
1.724954, -0.8457901, 2.753354, 1, 1, 1, 1, 1,
1.801895, 0.6883191, -0.4736871, 1, 1, 1, 1, 1,
1.815479, -1.057431, 1.720928, 1, 1, 1, 1, 1,
1.82884, 0.8023218, -0.2298522, 1, 1, 1, 1, 1,
1.834915, 0.8550099, 1.389549, 1, 1, 1, 1, 1,
1.845931, 1.086534, 0.6827339, 1, 1, 1, 1, 1,
1.852185, 1.920281, -0.5356678, 1, 1, 1, 1, 1,
1.85226, 0.9714142, 2.649837, 1, 1, 1, 1, 1,
1.879488, -0.5698699, 3.405448, 1, 1, 1, 1, 1,
1.921946, -0.7576566, 2.593102, 1, 1, 1, 1, 1,
1.934331, -0.6704676, 0.632831, 1, 1, 1, 1, 1,
1.948333, -0.7393385, 0.9332465, 1, 1, 1, 1, 1,
1.953734, 0.1900024, -0.1074523, 0, 0, 1, 1, 1,
1.997668, 0.2749899, 1.400882, 1, 0, 0, 1, 1,
1.998737, -0.09318756, 3.27928, 1, 0, 0, 1, 1,
2.03507, 0.4942553, 0.6176473, 1, 0, 0, 1, 1,
2.067681, 0.4083099, 0.6367726, 1, 0, 0, 1, 1,
2.070115, 1.707548, 0.7463105, 1, 0, 0, 1, 1,
2.103434, -0.9416867, 2.650147, 0, 0, 0, 1, 1,
2.108735, -1.393502, 4.102773, 0, 0, 0, 1, 1,
2.141216, 1.502808, 0.6969963, 0, 0, 0, 1, 1,
2.230752, -0.6150249, 1.87204, 0, 0, 0, 1, 1,
2.239141, -1.099109, 1.37945, 0, 0, 0, 1, 1,
2.276341, -0.4797802, 1.0971, 0, 0, 0, 1, 1,
2.306432, -0.006353533, 0.4203229, 0, 0, 0, 1, 1,
2.367536, -0.4272532, 1.707911, 1, 1, 1, 1, 1,
2.430562, -1.383661, 3.435125, 1, 1, 1, 1, 1,
2.776034, 0.333213, 1.193786, 1, 1, 1, 1, 1,
3.007045, -0.09355338, 0.496708, 1, 1, 1, 1, 1,
3.201141, -0.2024818, 1.428372, 1, 1, 1, 1, 1,
3.290719, -1.003826, 0.9536652, 1, 1, 1, 1, 1,
3.464059, -1.880895, 1.803501, 1, 1, 1, 1, 1
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
var radius = 10.00934;
var distance = 35.1574;
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
mvMatrix.translate( -0.08338547, -0.3640845, 0.4740646 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.1574);
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