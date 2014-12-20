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
-3.487823, -1.08762, -2.893574, 1, 0, 0, 1,
-2.941607, -1.693028, -2.588706, 1, 0.007843138, 0, 1,
-2.89479, 0.88533, -2.196702, 1, 0.01176471, 0, 1,
-2.84202, 1.978242, -0.523648, 1, 0.01960784, 0, 1,
-2.761256, 0.938997, -1.048811, 1, 0.02352941, 0, 1,
-2.707344, 0.7967663, -1.825059, 1, 0.03137255, 0, 1,
-2.706252, -1.338271, -2.152359, 1, 0.03529412, 0, 1,
-2.692254, -0.2376186, -2.493299, 1, 0.04313726, 0, 1,
-2.551012, -0.2434996, -1.461475, 1, 0.04705882, 0, 1,
-2.425663, 0.1045323, -1.879925, 1, 0.05490196, 0, 1,
-2.419715, 1.797965, -1.483543, 1, 0.05882353, 0, 1,
-2.390021, -0.9282521, -0.5521469, 1, 0.06666667, 0, 1,
-2.324944, 0.76309, -2.865396, 1, 0.07058824, 0, 1,
-2.231654, -0.2921531, -2.324935, 1, 0.07843138, 0, 1,
-2.19852, -0.446868, -0.515764, 1, 0.08235294, 0, 1,
-2.155777, -0.1598858, -0.2135917, 1, 0.09019608, 0, 1,
-2.116455, 0.3462752, -0.975784, 1, 0.09411765, 0, 1,
-2.098069, 0.9441362, -0.350084, 1, 0.1019608, 0, 1,
-2.080751, 1.597674, 0.5705665, 1, 0.1098039, 0, 1,
-2.063713, 0.5602145, -0.99258, 1, 0.1137255, 0, 1,
-2.054832, -0.00576485, -1.492568, 1, 0.1215686, 0, 1,
-2.031427, -1.382759, -3.303015, 1, 0.1254902, 0, 1,
-2.023072, 0.02430507, -1.848958, 1, 0.1333333, 0, 1,
-2.00613, 0.8926665, -1.63359, 1, 0.1372549, 0, 1,
-1.989188, -0.5126047, -2.649981, 1, 0.145098, 0, 1,
-1.935027, 1.251307, -2.414323, 1, 0.1490196, 0, 1,
-1.924981, -0.5471248, -3.288399, 1, 0.1568628, 0, 1,
-1.907066, -0.7476501, -2.980248, 1, 0.1607843, 0, 1,
-1.863866, -0.3894666, -2.235829, 1, 0.1686275, 0, 1,
-1.810621, -0.2926761, -1.840431, 1, 0.172549, 0, 1,
-1.810373, 0.1511542, -1.240842, 1, 0.1803922, 0, 1,
-1.799967, 0.7776029, -2.508251, 1, 0.1843137, 0, 1,
-1.798205, 1.839067, -0.3679639, 1, 0.1921569, 0, 1,
-1.791272, 0.8571766, -1.64183, 1, 0.1960784, 0, 1,
-1.781898, -1.535692, -1.452521, 1, 0.2039216, 0, 1,
-1.774404, -0.5561618, -0.8755957, 1, 0.2117647, 0, 1,
-1.7501, -0.9796634, -1.065118, 1, 0.2156863, 0, 1,
-1.741123, 0.3592753, -0.9795165, 1, 0.2235294, 0, 1,
-1.726862, -0.1523098, -1.240662, 1, 0.227451, 0, 1,
-1.7251, 0.3117048, -0.4702271, 1, 0.2352941, 0, 1,
-1.723086, 1.468136, -1.442658, 1, 0.2392157, 0, 1,
-1.703197, -0.008006154, -1.911989, 1, 0.2470588, 0, 1,
-1.695143, 1.721309, -2.798774, 1, 0.2509804, 0, 1,
-1.677301, -1.958445, -2.595966, 1, 0.2588235, 0, 1,
-1.647556, 0.07959942, -1.585591, 1, 0.2627451, 0, 1,
-1.646412, 1.491986, -2.024721, 1, 0.2705882, 0, 1,
-1.645286, -0.0469979, -1.436116, 1, 0.2745098, 0, 1,
-1.641706, -0.8413301, -1.636805, 1, 0.282353, 0, 1,
-1.619077, -0.4673876, -1.342629, 1, 0.2862745, 0, 1,
-1.615696, -1.060614, -1.567752, 1, 0.2941177, 0, 1,
-1.603085, 0.4388957, -3.419846, 1, 0.3019608, 0, 1,
-1.600761, 1.157914, -0.6915986, 1, 0.3058824, 0, 1,
-1.588802, 1.235984, 0.6388508, 1, 0.3137255, 0, 1,
-1.586493, 1.169541, -1.031802, 1, 0.3176471, 0, 1,
-1.562399, -0.8575574, -2.859293, 1, 0.3254902, 0, 1,
-1.542978, -0.1846013, -0.5036753, 1, 0.3294118, 0, 1,
-1.5382, 1.10249, -0.1112912, 1, 0.3372549, 0, 1,
-1.532514, -1.702696, -0.8807962, 1, 0.3411765, 0, 1,
-1.512192, 0.6309433, -1.133129, 1, 0.3490196, 0, 1,
-1.502276, 2.406343, -0.4292283, 1, 0.3529412, 0, 1,
-1.486367, -1.017506, -2.242208, 1, 0.3607843, 0, 1,
-1.486104, 0.002796246, -2.353602, 1, 0.3647059, 0, 1,
-1.480829, -0.07851887, -1.663458, 1, 0.372549, 0, 1,
-1.478588, 0.00774961, -0.8366289, 1, 0.3764706, 0, 1,
-1.47608, 1.008727, -1.911456, 1, 0.3843137, 0, 1,
-1.471823, -0.3057737, -1.138351, 1, 0.3882353, 0, 1,
-1.471075, 0.08625492, -0.6247041, 1, 0.3960784, 0, 1,
-1.461851, 0.07163243, -2.38965, 1, 0.4039216, 0, 1,
-1.460321, 1.224697, -0.9554457, 1, 0.4078431, 0, 1,
-1.455186, 0.6513894, -1.40989, 1, 0.4156863, 0, 1,
-1.447676, -0.2171478, -3.249996, 1, 0.4196078, 0, 1,
-1.437188, 0.4583134, -2.528761, 1, 0.427451, 0, 1,
-1.436711, 0.2652614, -4.142398, 1, 0.4313726, 0, 1,
-1.433279, 0.2787188, -2.288539, 1, 0.4392157, 0, 1,
-1.432591, -0.05623185, -1.617784, 1, 0.4431373, 0, 1,
-1.422627, 1.175121, -0.8538335, 1, 0.4509804, 0, 1,
-1.420126, 1.120927, -0.1996602, 1, 0.454902, 0, 1,
-1.413453, -1.309694, -2.110985, 1, 0.4627451, 0, 1,
-1.408636, -0.8508498, -3.035783, 1, 0.4666667, 0, 1,
-1.402549, -1.095234, -3.130046, 1, 0.4745098, 0, 1,
-1.387458, -1.229448, -3.043536, 1, 0.4784314, 0, 1,
-1.329986, -0.2860896, -1.139181, 1, 0.4862745, 0, 1,
-1.320856, -1.017809, -2.210681, 1, 0.4901961, 0, 1,
-1.3165, 1.606289, -0.6902704, 1, 0.4980392, 0, 1,
-1.315189, -1.374835, -1.334602, 1, 0.5058824, 0, 1,
-1.307784, 1.765477, -0.4096927, 1, 0.509804, 0, 1,
-1.294568, 0.3969219, -0.5003495, 1, 0.5176471, 0, 1,
-1.288704, -1.04003, -2.43385, 1, 0.5215687, 0, 1,
-1.28738, 2.250419, -0.3183354, 1, 0.5294118, 0, 1,
-1.284616, -1.257264, -1.634708, 1, 0.5333334, 0, 1,
-1.279504, -1.252966, -2.1906, 1, 0.5411765, 0, 1,
-1.270725, 0.483103, -1.808743, 1, 0.5450981, 0, 1,
-1.26405, -1.083364, -2.420135, 1, 0.5529412, 0, 1,
-1.264011, 0.3340754, -2.089984, 1, 0.5568628, 0, 1,
-1.258065, 0.3765369, -2.221852, 1, 0.5647059, 0, 1,
-1.249719, 0.4931564, -0.9202764, 1, 0.5686275, 0, 1,
-1.241342, 1.660288, -1.826438, 1, 0.5764706, 0, 1,
-1.23948, 0.1082352, -0.4018493, 1, 0.5803922, 0, 1,
-1.2265, -1.967385, -3.201209, 1, 0.5882353, 0, 1,
-1.225966, -0.3166596, -3.081216, 1, 0.5921569, 0, 1,
-1.222637, 0.2010993, -0.8228949, 1, 0.6, 0, 1,
-1.207934, 1.819606, -0.533244, 1, 0.6078432, 0, 1,
-1.205517, -0.0809355, -1.537733, 1, 0.6117647, 0, 1,
-1.198819, 0.1226888, -1.385383, 1, 0.6196079, 0, 1,
-1.198734, 0.904654, -0.9153818, 1, 0.6235294, 0, 1,
-1.19537, 1.223802, -0.457848, 1, 0.6313726, 0, 1,
-1.189724, -0.4824416, -1.275936, 1, 0.6352941, 0, 1,
-1.188877, 0.5193129, 0.1470129, 1, 0.6431373, 0, 1,
-1.186826, -1.641415, -4.243269, 1, 0.6470588, 0, 1,
-1.181832, 0.6414498, 0.4380865, 1, 0.654902, 0, 1,
-1.180027, -0.4841008, -0.09347101, 1, 0.6588235, 0, 1,
-1.179633, -0.3494056, -0.6957187, 1, 0.6666667, 0, 1,
-1.169702, 0.1738701, -1.310893, 1, 0.6705883, 0, 1,
-1.15965, -0.8697939, -2.474999, 1, 0.6784314, 0, 1,
-1.152944, 0.8702037, -0.5029805, 1, 0.682353, 0, 1,
-1.147207, -0.1152196, -2.290491, 1, 0.6901961, 0, 1,
-1.139626, 0.03974734, -3.449707, 1, 0.6941177, 0, 1,
-1.133936, -0.2902756, -0.1772464, 1, 0.7019608, 0, 1,
-1.119112, 0.5973453, -0.1478219, 1, 0.7098039, 0, 1,
-1.11568, -0.6033719, -3.506518, 1, 0.7137255, 0, 1,
-1.114957, 0.7187114, -0.7842502, 1, 0.7215686, 0, 1,
-1.114199, -1.788714, -1.961327, 1, 0.7254902, 0, 1,
-1.106513, -0.4093771, -0.710569, 1, 0.7333333, 0, 1,
-1.105943, -0.7282529, -0.4616028, 1, 0.7372549, 0, 1,
-1.101761, -0.7568889, -1.677566, 1, 0.7450981, 0, 1,
-1.101389, -0.5649697, -1.345055, 1, 0.7490196, 0, 1,
-1.099852, -0.4425588, -1.266639, 1, 0.7568628, 0, 1,
-1.097296, -2.153637, -2.707965, 1, 0.7607843, 0, 1,
-1.096769, -1.217171, -2.464874, 1, 0.7686275, 0, 1,
-1.089119, 0.7515519, -3.157619, 1, 0.772549, 0, 1,
-1.081637, 0.5469483, 0.178273, 1, 0.7803922, 0, 1,
-1.080619, 0.7615961, -0.3941574, 1, 0.7843137, 0, 1,
-1.076399, 2.013431, 0.2804207, 1, 0.7921569, 0, 1,
-1.074847, -0.460246, -0.5535533, 1, 0.7960784, 0, 1,
-1.072049, 0.1005238, -0.2426498, 1, 0.8039216, 0, 1,
-1.061765, 0.4420779, -1.695269, 1, 0.8117647, 0, 1,
-1.051758, -0.8273856, -0.6091865, 1, 0.8156863, 0, 1,
-1.051125, -1.058915, -1.921739, 1, 0.8235294, 0, 1,
-1.05021, -0.978008, -1.813453, 1, 0.827451, 0, 1,
-1.044702, 0.5609855, -1.92805, 1, 0.8352941, 0, 1,
-1.040996, -0.3295686, -2.661489, 1, 0.8392157, 0, 1,
-1.035434, -1.556215, -3.225031, 1, 0.8470588, 0, 1,
-1.031693, 1.705896, -1.103364, 1, 0.8509804, 0, 1,
-1.030057, -0.7052293, -3.056998, 1, 0.8588235, 0, 1,
-1.017642, -0.3643366, -2.261095, 1, 0.8627451, 0, 1,
-1.014711, 1.043539, -1.124661, 1, 0.8705882, 0, 1,
-1.01219, -1.867574, -2.439618, 1, 0.8745098, 0, 1,
-1.0076, 0.1469426, -0.774071, 1, 0.8823529, 0, 1,
-1.006639, 0.3724293, -0.65138, 1, 0.8862745, 0, 1,
-0.9987173, 1.721732, 1.465517, 1, 0.8941177, 0, 1,
-0.9977034, 0.9648196, 0.3471774, 1, 0.8980392, 0, 1,
-0.9935211, -1.068354, -2.839146, 1, 0.9058824, 0, 1,
-0.9913566, 0.4990383, 0.5231012, 1, 0.9137255, 0, 1,
-0.9829493, 1.022859, 1.245516, 1, 0.9176471, 0, 1,
-0.9827251, -0.3138204, -2.409932, 1, 0.9254902, 0, 1,
-0.9770804, -2.235366, -2.647807, 1, 0.9294118, 0, 1,
-0.9743378, 0.6434333, -0.9059462, 1, 0.9372549, 0, 1,
-0.9737293, -2.112306, -1.343767, 1, 0.9411765, 0, 1,
-0.9718986, 1.184994, -0.2002854, 1, 0.9490196, 0, 1,
-0.9716452, 0.4444278, -0.2059095, 1, 0.9529412, 0, 1,
-0.967241, -0.5800008, -4.984513, 1, 0.9607843, 0, 1,
-0.9654375, 2.059235, -1.119416, 1, 0.9647059, 0, 1,
-0.9637167, 1.314232, -1.00951, 1, 0.972549, 0, 1,
-0.9616236, -0.9408408, -2.31081, 1, 0.9764706, 0, 1,
-0.9538645, 0.4056419, -3.321248, 1, 0.9843137, 0, 1,
-0.9505074, -2.236256, -2.529695, 1, 0.9882353, 0, 1,
-0.9460507, 0.4178807, -2.051864, 1, 0.9960784, 0, 1,
-0.9438502, 0.9976883, 0.4385081, 0.9960784, 1, 0, 1,
-0.9430614, 0.7243732, -1.080947, 0.9921569, 1, 0, 1,
-0.9383217, 0.7943707, -0.4320151, 0.9843137, 1, 0, 1,
-0.9366628, 0.08658586, -3.531359, 0.9803922, 1, 0, 1,
-0.9313478, 1.667052, -1.146555, 0.972549, 1, 0, 1,
-0.925926, 1.053096, -0.4327627, 0.9686275, 1, 0, 1,
-0.9255146, 0.5859071, 0.302077, 0.9607843, 1, 0, 1,
-0.9214371, -0.559938, -2.024369, 0.9568627, 1, 0, 1,
-0.9212899, -0.9463346, -0.06889517, 0.9490196, 1, 0, 1,
-0.9209638, -0.746245, -3.377553, 0.945098, 1, 0, 1,
-0.9104546, -0.7525476, -2.928212, 0.9372549, 1, 0, 1,
-0.9090316, -0.9150877, -2.179475, 0.9333333, 1, 0, 1,
-0.9084888, -0.3157106, -0.7601674, 0.9254902, 1, 0, 1,
-0.9043918, 1.048921, -1.377743, 0.9215686, 1, 0, 1,
-0.9033322, 1.018654, -0.8469756, 0.9137255, 1, 0, 1,
-0.8993788, -1.257253, -2.63248, 0.9098039, 1, 0, 1,
-0.898103, 1.180279, -1.492115, 0.9019608, 1, 0, 1,
-0.8972824, -0.6500913, -3.607503, 0.8941177, 1, 0, 1,
-0.8897754, -0.01153849, -1.596742, 0.8901961, 1, 0, 1,
-0.885444, 0.4209829, -1.356774, 0.8823529, 1, 0, 1,
-0.8840382, -1.040274, -2.636375, 0.8784314, 1, 0, 1,
-0.8816023, -0.644085, -0.9715787, 0.8705882, 1, 0, 1,
-0.880652, 0.5139857, -0.7537768, 0.8666667, 1, 0, 1,
-0.87778, 0.4425484, 0.321993, 0.8588235, 1, 0, 1,
-0.8725244, -0.4239785, -1.204018, 0.854902, 1, 0, 1,
-0.8701777, -0.1185438, -0.7544315, 0.8470588, 1, 0, 1,
-0.8701279, 2.145404, 0.2941852, 0.8431373, 1, 0, 1,
-0.8679128, -0.1004256, -1.63766, 0.8352941, 1, 0, 1,
-0.8617295, -1.277966, -1.684906, 0.8313726, 1, 0, 1,
-0.8558385, 0.6154187, -1.251842, 0.8235294, 1, 0, 1,
-0.8548723, 1.375652, -0.9690716, 0.8196079, 1, 0, 1,
-0.8546349, -1.412451, -2.51962, 0.8117647, 1, 0, 1,
-0.8539232, 0.09625984, -0.90463, 0.8078431, 1, 0, 1,
-0.849049, -0.7601371, -3.310704, 0.8, 1, 0, 1,
-0.840304, -0.2358426, -2.204946, 0.7921569, 1, 0, 1,
-0.8305306, 1.270594, -1.333535, 0.7882353, 1, 0, 1,
-0.8282496, -0.024281, -2.65648, 0.7803922, 1, 0, 1,
-0.8226318, -1.330642, -2.789617, 0.7764706, 1, 0, 1,
-0.8196194, 0.4443057, -1.277839, 0.7686275, 1, 0, 1,
-0.8191206, 1.261231, 0.5136346, 0.7647059, 1, 0, 1,
-0.8165701, 0.6400306, -1.224586, 0.7568628, 1, 0, 1,
-0.813952, 0.9697958, -0.7154049, 0.7529412, 1, 0, 1,
-0.807084, -0.2485502, -2.004813, 0.7450981, 1, 0, 1,
-0.8034003, 0.3847216, -2.068318, 0.7411765, 1, 0, 1,
-0.802197, -1.376231, -2.822969, 0.7333333, 1, 0, 1,
-0.8014087, 0.5387039, -1.97544, 0.7294118, 1, 0, 1,
-0.8014035, -1.034217, -2.420713, 0.7215686, 1, 0, 1,
-0.8009475, 1.412436, -0.7391276, 0.7176471, 1, 0, 1,
-0.7982237, -0.5562068, -1.952485, 0.7098039, 1, 0, 1,
-0.7904473, 0.08218171, -1.128585, 0.7058824, 1, 0, 1,
-0.7892151, -0.285102, -0.7745527, 0.6980392, 1, 0, 1,
-0.7886102, -3.035641, -3.52714, 0.6901961, 1, 0, 1,
-0.7861677, -0.2774969, -1.523437, 0.6862745, 1, 0, 1,
-0.7838225, 0.1523615, -2.061527, 0.6784314, 1, 0, 1,
-0.78304, 0.2798189, -1.245132, 0.6745098, 1, 0, 1,
-0.7793117, -0.3859936, -1.922587, 0.6666667, 1, 0, 1,
-0.7747205, -0.6016132, -1.771886, 0.6627451, 1, 0, 1,
-0.7689539, 0.6956193, 0.7508415, 0.654902, 1, 0, 1,
-0.7686188, 0.8745695, -1.361536, 0.6509804, 1, 0, 1,
-0.7667838, -1.805374, -2.811007, 0.6431373, 1, 0, 1,
-0.7629945, 0.7383443, 0.2161222, 0.6392157, 1, 0, 1,
-0.7525318, 1.143066, -1.191447, 0.6313726, 1, 0, 1,
-0.7505504, -1.899395, -3.051994, 0.627451, 1, 0, 1,
-0.7491568, -1.07326, -5.0471, 0.6196079, 1, 0, 1,
-0.7325954, -0.3986313, -1.382314, 0.6156863, 1, 0, 1,
-0.7274467, -0.5144664, -1.39391, 0.6078432, 1, 0, 1,
-0.7260236, 1.093634, 1.579096, 0.6039216, 1, 0, 1,
-0.7220573, 0.4399735, -0.7273754, 0.5960785, 1, 0, 1,
-0.7174435, 0.06107625, -1.81703, 0.5882353, 1, 0, 1,
-0.7150642, 0.9448206, -0.8079814, 0.5843138, 1, 0, 1,
-0.7117094, -2.175822, -3.494032, 0.5764706, 1, 0, 1,
-0.7117001, 0.4672952, -0.322912, 0.572549, 1, 0, 1,
-0.7107891, 1.146039, -0.163223, 0.5647059, 1, 0, 1,
-0.7088897, 0.02212163, -3.17345, 0.5607843, 1, 0, 1,
-0.7017587, -2.056522, -2.498392, 0.5529412, 1, 0, 1,
-0.7008769, -1.511585, -1.259276, 0.5490196, 1, 0, 1,
-0.6949865, 1.721662, -0.7589057, 0.5411765, 1, 0, 1,
-0.6937603, 0.09831525, -1.781109, 0.5372549, 1, 0, 1,
-0.6923469, 0.4021914, -0.138433, 0.5294118, 1, 0, 1,
-0.6905712, -0.1222279, -2.4417, 0.5254902, 1, 0, 1,
-0.6877437, -1.974392, -2.331189, 0.5176471, 1, 0, 1,
-0.6871179, -0.2168291, -2.389678, 0.5137255, 1, 0, 1,
-0.6855729, -0.436256, -2.189957, 0.5058824, 1, 0, 1,
-0.6787516, 0.3030497, -0.7260938, 0.5019608, 1, 0, 1,
-0.6777996, -1.102223, -1.796502, 0.4941176, 1, 0, 1,
-0.6709507, 0.1648385, -0.8809724, 0.4862745, 1, 0, 1,
-0.6692821, 0.8293816, -1.351552, 0.4823529, 1, 0, 1,
-0.6676992, 0.1261041, 0.2558687, 0.4745098, 1, 0, 1,
-0.6676169, 0.01497628, -1.550284, 0.4705882, 1, 0, 1,
-0.6626015, -0.6579995, -2.635077, 0.4627451, 1, 0, 1,
-0.6581123, 1.181455, -0.4424689, 0.4588235, 1, 0, 1,
-0.6578315, 0.6842496, -1.795547, 0.4509804, 1, 0, 1,
-0.6541041, 0.2315428, -0.06211741, 0.4470588, 1, 0, 1,
-0.6532036, 0.1091341, -0.6625495, 0.4392157, 1, 0, 1,
-0.6493138, 0.957835, 0.8785305, 0.4352941, 1, 0, 1,
-0.6491951, -2.553436, -2.037861, 0.427451, 1, 0, 1,
-0.644164, -0.585787, -2.597767, 0.4235294, 1, 0, 1,
-0.6414289, -0.3257515, 0.2889453, 0.4156863, 1, 0, 1,
-0.6390816, 0.805892, -1.991889, 0.4117647, 1, 0, 1,
-0.6335775, -0.4747388, -2.76939, 0.4039216, 1, 0, 1,
-0.6276754, -0.7389444, -0.9472858, 0.3960784, 1, 0, 1,
-0.6235895, 1.840046, -0.4903356, 0.3921569, 1, 0, 1,
-0.6222665, 0.8804574, 0.4823729, 0.3843137, 1, 0, 1,
-0.6155837, 1.124991, -2.728044, 0.3803922, 1, 0, 1,
-0.6139986, 1.859466, 2.079853, 0.372549, 1, 0, 1,
-0.6136444, 0.5068353, -2.211827, 0.3686275, 1, 0, 1,
-0.6073794, 1.366159, 0.1036014, 0.3607843, 1, 0, 1,
-0.5966391, 1.116641, 0.3074431, 0.3568628, 1, 0, 1,
-0.5942174, 1.044326, -1.593493, 0.3490196, 1, 0, 1,
-0.5892131, -1.723085, -2.012213, 0.345098, 1, 0, 1,
-0.5891572, -0.839237, -3.227024, 0.3372549, 1, 0, 1,
-0.5819952, -0.6102573, -1.49597, 0.3333333, 1, 0, 1,
-0.5793225, -0.7294854, -3.672165, 0.3254902, 1, 0, 1,
-0.5744813, 1.576512, 0.9445734, 0.3215686, 1, 0, 1,
-0.5715716, 0.9684631, -1.990569, 0.3137255, 1, 0, 1,
-0.5666642, 0.1770125, -1.685021, 0.3098039, 1, 0, 1,
-0.5645211, -0.9562577, -2.159497, 0.3019608, 1, 0, 1,
-0.5627148, -1.155401, -2.922799, 0.2941177, 1, 0, 1,
-0.5614754, -0.309445, -2.242234, 0.2901961, 1, 0, 1,
-0.5600505, 0.5635662, -0.1214535, 0.282353, 1, 0, 1,
-0.5599081, 1.042582, -0.7370493, 0.2784314, 1, 0, 1,
-0.5539403, 0.5874785, -0.3440519, 0.2705882, 1, 0, 1,
-0.5477363, -1.305785, -1.331418, 0.2666667, 1, 0, 1,
-0.5471684, 1.720884, -1.226772, 0.2588235, 1, 0, 1,
-0.5466672, 2.084459, -0.3112084, 0.254902, 1, 0, 1,
-0.5460808, -0.07366768, -0.1939452, 0.2470588, 1, 0, 1,
-0.5448684, 3.282363, 0.7197176, 0.2431373, 1, 0, 1,
-0.5425771, 0.7441632, -1.113451, 0.2352941, 1, 0, 1,
-0.5295172, 1.178519, -0.3918422, 0.2313726, 1, 0, 1,
-0.5258797, 0.8336094, 0.5439755, 0.2235294, 1, 0, 1,
-0.5255865, 0.7562227, -0.3438858, 0.2196078, 1, 0, 1,
-0.5219641, 0.8859586, -0.2344625, 0.2117647, 1, 0, 1,
-0.5203478, 0.523702, -1.080742, 0.2078431, 1, 0, 1,
-0.5189331, 0.9779913, -0.1680285, 0.2, 1, 0, 1,
-0.5136609, 1.512902, 0.4498407, 0.1921569, 1, 0, 1,
-0.5134088, 0.2247867, -0.5149686, 0.1882353, 1, 0, 1,
-0.507386, 0.7567849, -1.217531, 0.1803922, 1, 0, 1,
-0.4979599, -1.716635, -2.394263, 0.1764706, 1, 0, 1,
-0.4966426, 0.1023265, -2.179043, 0.1686275, 1, 0, 1,
-0.4879714, -0.8357262, -4.858055, 0.1647059, 1, 0, 1,
-0.4871333, 1.306317, 0.3488459, 0.1568628, 1, 0, 1,
-0.486884, -0.5303211, -2.039354, 0.1529412, 1, 0, 1,
-0.4840494, 0.2991344, -0.94944, 0.145098, 1, 0, 1,
-0.4830876, -1.335532, -3.394998, 0.1411765, 1, 0, 1,
-0.483002, -0.1706921, -1.435338, 0.1333333, 1, 0, 1,
-0.4772092, -1.856152, -3.755261, 0.1294118, 1, 0, 1,
-0.4763326, -0.03231576, -1.701458, 0.1215686, 1, 0, 1,
-0.4729451, -0.3715521, -1.672959, 0.1176471, 1, 0, 1,
-0.4725251, 0.7457056, 0.9517878, 0.1098039, 1, 0, 1,
-0.4720172, 0.5010117, -2.768954, 0.1058824, 1, 0, 1,
-0.4696234, -0.1433626, -3.08454, 0.09803922, 1, 0, 1,
-0.4655783, 0.297344, 0.1849173, 0.09019608, 1, 0, 1,
-0.4600402, 0.933315, -0.9922976, 0.08627451, 1, 0, 1,
-0.4533807, 0.9077561, 1.041006, 0.07843138, 1, 0, 1,
-0.4508367, -0.07459028, -1.851279, 0.07450981, 1, 0, 1,
-0.4459904, 1.709407, -1.29756, 0.06666667, 1, 0, 1,
-0.444415, 0.2731915, 0.8802873, 0.0627451, 1, 0, 1,
-0.4396759, -0.6026959, -2.721895, 0.05490196, 1, 0, 1,
-0.4307513, -0.9266884, -2.805227, 0.05098039, 1, 0, 1,
-0.4294261, -0.6000971, -1.697478, 0.04313726, 1, 0, 1,
-0.4268952, 0.426798, -2.088143, 0.03921569, 1, 0, 1,
-0.4215859, -0.6932605, -1.455269, 0.03137255, 1, 0, 1,
-0.4196325, 0.6795738, 0.6762933, 0.02745098, 1, 0, 1,
-0.4157113, -1.409441, -4.156293, 0.01960784, 1, 0, 1,
-0.4137444, -0.04794873, -3.357501, 0.01568628, 1, 0, 1,
-0.406333, -0.6392606, -1.245455, 0.007843138, 1, 0, 1,
-0.4037738, -0.4915305, -2.425261, 0.003921569, 1, 0, 1,
-0.4033021, -1.443247, -4.693201, 0, 1, 0.003921569, 1,
-0.4023643, -1.276328, -2.476534, 0, 1, 0.01176471, 1,
-0.3985514, 0.09185739, -1.294107, 0, 1, 0.01568628, 1,
-0.3943242, 0.5290352, -0.5983436, 0, 1, 0.02352941, 1,
-0.3847844, 0.0431046, -2.102626, 0, 1, 0.02745098, 1,
-0.3787234, -0.6131558, -1.896278, 0, 1, 0.03529412, 1,
-0.3780845, -0.1694676, -1.633174, 0, 1, 0.03921569, 1,
-0.369004, -1.297869, -1.148555, 0, 1, 0.04705882, 1,
-0.36889, -0.1560482, -2.05397, 0, 1, 0.05098039, 1,
-0.3663559, -0.01829344, -3.413125, 0, 1, 0.05882353, 1,
-0.3629273, 0.1790735, -0.8363172, 0, 1, 0.0627451, 1,
-0.3626367, 0.2535796, -1.885411, 0, 1, 0.07058824, 1,
-0.3586012, -1.46989, -3.239036, 0, 1, 0.07450981, 1,
-0.3472693, 0.3623291, -2.107798, 0, 1, 0.08235294, 1,
-0.3470207, 1.729255, 1.080029, 0, 1, 0.08627451, 1,
-0.3435335, 0.3063095, -0.580792, 0, 1, 0.09411765, 1,
-0.3421948, 1.254437, 0.9353856, 0, 1, 0.1019608, 1,
-0.3416652, -1.80322, -3.803141, 0, 1, 0.1058824, 1,
-0.3401893, 0.6223905, 0.6673682, 0, 1, 0.1137255, 1,
-0.3399738, -0.299394, -3.017026, 0, 1, 0.1176471, 1,
-0.3326793, 1.353958, 0.3578913, 0, 1, 0.1254902, 1,
-0.3230692, 0.6196442, -0.343536, 0, 1, 0.1294118, 1,
-0.3191141, -1.197379, -5.928169, 0, 1, 0.1372549, 1,
-0.3186177, -1.481425, -2.730295, 0, 1, 0.1411765, 1,
-0.3183497, 1.23317, 1.860757, 0, 1, 0.1490196, 1,
-0.3177847, -0.8474824, -4.133183, 0, 1, 0.1529412, 1,
-0.3163228, 0.8751, -0.7480834, 0, 1, 0.1607843, 1,
-0.3152467, -1.048969, -1.884109, 0, 1, 0.1647059, 1,
-0.3127371, -0.4025441, -2.638289, 0, 1, 0.172549, 1,
-0.3102297, 0.8491278, 0.5215886, 0, 1, 0.1764706, 1,
-0.3036026, -0.4020809, -2.533275, 0, 1, 0.1843137, 1,
-0.3028439, 1.747829, 1.589006, 0, 1, 0.1882353, 1,
-0.3027683, 0.6611791, 0.539035, 0, 1, 0.1960784, 1,
-0.2983355, 0.9339616, 0.2778556, 0, 1, 0.2039216, 1,
-0.2977808, -1.211479, -1.237296, 0, 1, 0.2078431, 1,
-0.2940726, -0.2239255, -2.320089, 0, 1, 0.2156863, 1,
-0.2920583, 0.7893795, -0.6325425, 0, 1, 0.2196078, 1,
-0.2916365, -0.5571482, -2.032315, 0, 1, 0.227451, 1,
-0.2913076, -1.062932, -3.063933, 0, 1, 0.2313726, 1,
-0.2910409, -0.3840336, -3.418034, 0, 1, 0.2392157, 1,
-0.2901287, 1.782298, -0.3128808, 0, 1, 0.2431373, 1,
-0.2846723, -1.69981, -3.433624, 0, 1, 0.2509804, 1,
-0.2825947, 0.5443876, -0.1371977, 0, 1, 0.254902, 1,
-0.2769325, -1.110959, -2.970336, 0, 1, 0.2627451, 1,
-0.274767, -0.2142243, -2.300313, 0, 1, 0.2666667, 1,
-0.2747348, -1.925313, -1.836796, 0, 1, 0.2745098, 1,
-0.2690981, -1.486291, -3.589014, 0, 1, 0.2784314, 1,
-0.2664665, 0.2217617, -0.3018, 0, 1, 0.2862745, 1,
-0.2610168, -0.2503952, -2.622583, 0, 1, 0.2901961, 1,
-0.2610113, 0.9154377, 0.9592999, 0, 1, 0.2980392, 1,
-0.2575308, -1.549271, -3.170804, 0, 1, 0.3058824, 1,
-0.257249, 0.333482, -0.5569144, 0, 1, 0.3098039, 1,
-0.2562537, 0.8395572, 0.5523902, 0, 1, 0.3176471, 1,
-0.254695, 1.244142, -1.467756, 0, 1, 0.3215686, 1,
-0.2541629, -0.0420078, -3.886391, 0, 1, 0.3294118, 1,
-0.2524152, 0.4344813, -1.06937, 0, 1, 0.3333333, 1,
-0.2511623, 0.1082537, -1.290078, 0, 1, 0.3411765, 1,
-0.2494542, 0.8881748, -1.78512, 0, 1, 0.345098, 1,
-0.2493771, -0.04745587, -1.043957, 0, 1, 0.3529412, 1,
-0.2492274, -1.139915, -3.951554, 0, 1, 0.3568628, 1,
-0.2489009, 0.9707012, 1.440112, 0, 1, 0.3647059, 1,
-0.2486505, -2.00528, -3.271236, 0, 1, 0.3686275, 1,
-0.2476206, -0.5729271, -1.911567, 0, 1, 0.3764706, 1,
-0.2469386, 0.4875967, 0.3601625, 0, 1, 0.3803922, 1,
-0.2415773, 1.109017, -1.459487, 0, 1, 0.3882353, 1,
-0.2367813, -1.061625, -3.322373, 0, 1, 0.3921569, 1,
-0.2362076, -0.7805405, -2.347582, 0, 1, 0.4, 1,
-0.2241675, 0.5053452, 0.2081209, 0, 1, 0.4078431, 1,
-0.223561, 0.04137192, -3.504369, 0, 1, 0.4117647, 1,
-0.2186906, 0.897588, 0.6424494, 0, 1, 0.4196078, 1,
-0.2180427, -0.853357, -1.024344, 0, 1, 0.4235294, 1,
-0.2161745, -2.1786, -4.286409, 0, 1, 0.4313726, 1,
-0.2157504, -0.6738904, -2.995297, 0, 1, 0.4352941, 1,
-0.2129464, 0.6835929, -2.113792, 0, 1, 0.4431373, 1,
-0.2073687, 1.894546, 0.1095962, 0, 1, 0.4470588, 1,
-0.2072407, -0.396892, -4.481813, 0, 1, 0.454902, 1,
-0.2068566, -0.2899415, -3.337494, 0, 1, 0.4588235, 1,
-0.2068524, -0.2025595, -4.105485, 0, 1, 0.4666667, 1,
-0.2020332, -2.094942, -2.455394, 0, 1, 0.4705882, 1,
-0.1961333, 0.03739594, -0.8390706, 0, 1, 0.4784314, 1,
-0.1960876, -1.605253, -2.388815, 0, 1, 0.4823529, 1,
-0.1927292, -1.273218, -1.676194, 0, 1, 0.4901961, 1,
-0.1923162, -0.8954346, -3.764211, 0, 1, 0.4941176, 1,
-0.1922367, 2.813892, 0.4027016, 0, 1, 0.5019608, 1,
-0.1915541, 0.5417018, 0.5541475, 0, 1, 0.509804, 1,
-0.1882118, -0.2335363, -3.059916, 0, 1, 0.5137255, 1,
-0.1863444, -2.430263, -2.988413, 0, 1, 0.5215687, 1,
-0.1838866, -0.6371712, -3.169164, 0, 1, 0.5254902, 1,
-0.1746659, 0.3157504, 0.4084911, 0, 1, 0.5333334, 1,
-0.1722244, 0.2687262, 0.1390339, 0, 1, 0.5372549, 1,
-0.1710971, 0.02952851, -1.677369, 0, 1, 0.5450981, 1,
-0.1670143, -0.482114, -2.413313, 0, 1, 0.5490196, 1,
-0.1609825, -0.08364034, -3.802763, 0, 1, 0.5568628, 1,
-0.16077, 0.06248544, -2.680156, 0, 1, 0.5607843, 1,
-0.1597358, 1.304408, 2.70413, 0, 1, 0.5686275, 1,
-0.1583326, -0.993173, -3.598319, 0, 1, 0.572549, 1,
-0.1557703, -1.503138, -2.013288, 0, 1, 0.5803922, 1,
-0.1514872, -0.03514111, -1.191838, 0, 1, 0.5843138, 1,
-0.1469917, 0.02855247, -0.6424335, 0, 1, 0.5921569, 1,
-0.1452209, 1.258124, -0.2598976, 0, 1, 0.5960785, 1,
-0.143587, -1.311522, -1.470741, 0, 1, 0.6039216, 1,
-0.1390775, -2.208791, -3.383982, 0, 1, 0.6117647, 1,
-0.1353478, -0.01158614, -1.285874, 0, 1, 0.6156863, 1,
-0.1337503, -0.613369, -2.47739, 0, 1, 0.6235294, 1,
-0.1335649, 0.06692816, -2.566369, 0, 1, 0.627451, 1,
-0.1329972, -0.1052993, -3.62235, 0, 1, 0.6352941, 1,
-0.1320158, -0.1479943, -0.9109755, 0, 1, 0.6392157, 1,
-0.1318985, 0.09977859, -0.7983232, 0, 1, 0.6470588, 1,
-0.1297967, -1.141565, -4.644103, 0, 1, 0.6509804, 1,
-0.1290515, 0.5917027, 0.1424882, 0, 1, 0.6588235, 1,
-0.1281916, 0.7192219, -0.04889417, 0, 1, 0.6627451, 1,
-0.1277866, 0.9278644, 0.8784516, 0, 1, 0.6705883, 1,
-0.1244995, 1.343622, -1.46228, 0, 1, 0.6745098, 1,
-0.1214422, -1.614216, -3.064078, 0, 1, 0.682353, 1,
-0.1188374, -0.0745781, -2.461217, 0, 1, 0.6862745, 1,
-0.1167612, -0.6334798, -3.796257, 0, 1, 0.6941177, 1,
-0.1164617, 0.9013648, -1.5267, 0, 1, 0.7019608, 1,
-0.11537, -0.9891788, -4.498798, 0, 1, 0.7058824, 1,
-0.1147153, 0.4273951, 0.1966593, 0, 1, 0.7137255, 1,
-0.105327, 1.246182, -0.424353, 0, 1, 0.7176471, 1,
-0.1050154, -1.549403, -2.067722, 0, 1, 0.7254902, 1,
-0.1050105, 0.1900091, 1.53231, 0, 1, 0.7294118, 1,
-0.09918676, 1.997517, 0.2533526, 0, 1, 0.7372549, 1,
-0.09823675, 1.135684, -1.14571, 0, 1, 0.7411765, 1,
-0.09635442, 0.5915628, 0.374948, 0, 1, 0.7490196, 1,
-0.09181169, 0.8021007, -0.7681888, 0, 1, 0.7529412, 1,
-0.09091018, 0.4202656, 0.1809105, 0, 1, 0.7607843, 1,
-0.08783393, 0.1857285, -0.3971137, 0, 1, 0.7647059, 1,
-0.08673817, 0.6446877, 0.554278, 0, 1, 0.772549, 1,
-0.08499145, -1.116638, -3.017329, 0, 1, 0.7764706, 1,
-0.08461957, -2.331938, -3.201672, 0, 1, 0.7843137, 1,
-0.08178652, 0.5984167, -0.05317018, 0, 1, 0.7882353, 1,
-0.08039971, 0.5783607, -0.03913851, 0, 1, 0.7960784, 1,
-0.0800155, -0.7310864, -3.032901, 0, 1, 0.8039216, 1,
-0.07808265, 2.115117, 0.5954924, 0, 1, 0.8078431, 1,
-0.07744181, -1.028788, -2.907047, 0, 1, 0.8156863, 1,
-0.07488476, -0.3399202, -1.110402, 0, 1, 0.8196079, 1,
-0.0744739, 1.676272, 0.5921721, 0, 1, 0.827451, 1,
-0.07396638, -1.147573, -2.727041, 0, 1, 0.8313726, 1,
-0.07273725, -0.3322196, -1.739235, 0, 1, 0.8392157, 1,
-0.07251671, 0.1024398, -1.040935, 0, 1, 0.8431373, 1,
-0.07148591, -0.9088623, -2.829659, 0, 1, 0.8509804, 1,
-0.06458541, 0.5256349, -0.4685643, 0, 1, 0.854902, 1,
-0.06377659, 0.2072505, -1.114557, 0, 1, 0.8627451, 1,
-0.06280273, -0.8685651, -2.62185, 0, 1, 0.8666667, 1,
-0.06232771, 1.046276, 0.5230181, 0, 1, 0.8745098, 1,
-0.05850875, -0.8322165, -2.622868, 0, 1, 0.8784314, 1,
-0.05695414, -0.8812724, -3.177889, 0, 1, 0.8862745, 1,
-0.05232497, 0.08267509, -0.359434, 0, 1, 0.8901961, 1,
-0.04975517, 0.5040365, 1.036494, 0, 1, 0.8980392, 1,
-0.04384668, 1.569162, 0.1771279, 0, 1, 0.9058824, 1,
-0.0437505, -0.2065231, -3.898668, 0, 1, 0.9098039, 1,
-0.04027845, 0.2221673, 1.500915, 0, 1, 0.9176471, 1,
-0.02850103, 0.671882, -1.231702, 0, 1, 0.9215686, 1,
-0.02639866, -1.004857, -1.642323, 0, 1, 0.9294118, 1,
-0.02584785, 0.5307271, 0.418637, 0, 1, 0.9333333, 1,
-0.02451394, 2.868452, 0.8602703, 0, 1, 0.9411765, 1,
-0.02300476, 0.6737732, 0.7518933, 0, 1, 0.945098, 1,
-0.02173355, -2.763031, -3.963553, 0, 1, 0.9529412, 1,
-0.01833858, -0.3668187, -2.584801, 0, 1, 0.9568627, 1,
-0.01733636, -0.4140182, -2.462033, 0, 1, 0.9647059, 1,
-0.01123662, 1.103122, 0.2402238, 0, 1, 0.9686275, 1,
-0.009622092, -0.4829268, -3.733505, 0, 1, 0.9764706, 1,
-0.008275517, 0.3185382, -0.8866969, 0, 1, 0.9803922, 1,
-0.007727537, -0.845857, -4.223885, 0, 1, 0.9882353, 1,
-0.00267027, -0.0007878939, -2.536646, 0, 1, 0.9921569, 1,
-0.0006224848, 0.6660778, -0.1924923, 0, 1, 1, 1,
0.00288785, 0.8704787, -0.4622875, 0, 0.9921569, 1, 1,
0.003794382, 2.442827, -0.1943413, 0, 0.9882353, 1, 1,
0.009762498, -0.5261707, 2.914569, 0, 0.9803922, 1, 1,
0.01022389, -1.11613, 2.964001, 0, 0.9764706, 1, 1,
0.01521645, -1.242572, 3.868897, 0, 0.9686275, 1, 1,
0.01575848, -0.9444521, 3.266499, 0, 0.9647059, 1, 1,
0.01766954, 0.5815374, 1.423573, 0, 0.9568627, 1, 1,
0.01928784, -0.8344584, 3.246398, 0, 0.9529412, 1, 1,
0.01999759, 1.482955, 1.1225, 0, 0.945098, 1, 1,
0.02097979, -1.458624, 3.064882, 0, 0.9411765, 1, 1,
0.02216348, -0.3172815, 4.364769, 0, 0.9333333, 1, 1,
0.02232187, -1.250352, 4.089839, 0, 0.9294118, 1, 1,
0.022639, 1.028734, -1.398879, 0, 0.9215686, 1, 1,
0.02367535, 0.9581292, -0.3337031, 0, 0.9176471, 1, 1,
0.03004783, -0.02023765, 2.488329, 0, 0.9098039, 1, 1,
0.03112652, -0.4758356, 1.517274, 0, 0.9058824, 1, 1,
0.0321039, 0.9103882, 0.4271471, 0, 0.8980392, 1, 1,
0.03401206, 0.07988512, 0.418042, 0, 0.8901961, 1, 1,
0.03410453, -0.1845717, 5.473252, 0, 0.8862745, 1, 1,
0.03586343, -0.1343346, 2.636892, 0, 0.8784314, 1, 1,
0.03654777, 0.5873479, 0.3312227, 0, 0.8745098, 1, 1,
0.03859672, -0.07537541, 2.520047, 0, 0.8666667, 1, 1,
0.04532469, 0.4919059, 1.587744, 0, 0.8627451, 1, 1,
0.04563709, 0.7250944, -1.308464, 0, 0.854902, 1, 1,
0.04712031, -0.7749816, 3.287085, 0, 0.8509804, 1, 1,
0.05004141, -0.542833, 3.592472, 0, 0.8431373, 1, 1,
0.0523012, -1.044308, 3.570686, 0, 0.8392157, 1, 1,
0.05389218, 0.4119969, -1.949861, 0, 0.8313726, 1, 1,
0.05423583, -0.6137117, 1.983414, 0, 0.827451, 1, 1,
0.05804067, 0.1110708, 2.018529, 0, 0.8196079, 1, 1,
0.06463972, -1.216732, 2.168647, 0, 0.8156863, 1, 1,
0.06551789, 0.6705479, -2.367351, 0, 0.8078431, 1, 1,
0.07200745, 1.022879, -0.7518494, 0, 0.8039216, 1, 1,
0.0735243, 0.5326291, -1.700727, 0, 0.7960784, 1, 1,
0.07372525, -0.5723754, 3.20708, 0, 0.7882353, 1, 1,
0.07648002, 0.3908412, 2.539818, 0, 0.7843137, 1, 1,
0.07883016, 1.043989, 0.9593323, 0, 0.7764706, 1, 1,
0.07940808, 0.3752076, 1.638314, 0, 0.772549, 1, 1,
0.08282368, 0.04396471, 1.405984, 0, 0.7647059, 1, 1,
0.08411749, -1.029201, 2.93115, 0, 0.7607843, 1, 1,
0.08601926, -0.2330001, 2.758694, 0, 0.7529412, 1, 1,
0.08885874, 1.087395, 0.7593226, 0, 0.7490196, 1, 1,
0.09058356, 0.1959023, 1.36493, 0, 0.7411765, 1, 1,
0.09644318, 0.8888002, -0.01332352, 0, 0.7372549, 1, 1,
0.09759558, -0.4391958, 2.643573, 0, 0.7294118, 1, 1,
0.1023691, 0.09665678, 0.7563094, 0, 0.7254902, 1, 1,
0.1048493, 3.420876, 0.03154205, 0, 0.7176471, 1, 1,
0.1159718, 2.299458, 1.36243, 0, 0.7137255, 1, 1,
0.1165659, 0.3645475, 0.2212448, 0, 0.7058824, 1, 1,
0.1213443, -0.686843, 4.814023, 0, 0.6980392, 1, 1,
0.1251476, -0.3097011, 3.456203, 0, 0.6941177, 1, 1,
0.1269578, -2.676035, 3.784863, 0, 0.6862745, 1, 1,
0.1283431, -1.366432, 1.529047, 0, 0.682353, 1, 1,
0.1289879, -0.1953049, 1.410612, 0, 0.6745098, 1, 1,
0.129788, 1.034232, 0.08662707, 0, 0.6705883, 1, 1,
0.1345891, -0.305531, 2.455945, 0, 0.6627451, 1, 1,
0.1421266, -0.9032322, 1.778836, 0, 0.6588235, 1, 1,
0.1429327, 0.8530719, -0.2002711, 0, 0.6509804, 1, 1,
0.1429374, -1.373433, 4.566014, 0, 0.6470588, 1, 1,
0.1432214, 0.2225566, 0.6900331, 0, 0.6392157, 1, 1,
0.1449279, 0.8997648, 0.3781986, 0, 0.6352941, 1, 1,
0.1467911, 0.08056811, 0.1549082, 0, 0.627451, 1, 1,
0.1472678, -0.4137762, 3.786931, 0, 0.6235294, 1, 1,
0.1475487, 0.5575678, 0.8195989, 0, 0.6156863, 1, 1,
0.1501233, -1.601756, 3.939069, 0, 0.6117647, 1, 1,
0.1527974, -0.1054484, 2.655712, 0, 0.6039216, 1, 1,
0.155315, -0.07231927, 2.972461, 0, 0.5960785, 1, 1,
0.157763, -0.06313623, 1.097383, 0, 0.5921569, 1, 1,
0.1608915, 0.5096378, -0.02622982, 0, 0.5843138, 1, 1,
0.1624268, -1.847641, 3.447058, 0, 0.5803922, 1, 1,
0.1636815, 0.1291968, 0.618152, 0, 0.572549, 1, 1,
0.1665718, 0.2476982, 0.1231048, 0, 0.5686275, 1, 1,
0.1719162, -0.2839148, 3.621439, 0, 0.5607843, 1, 1,
0.1720187, -0.4841545, 4.441019, 0, 0.5568628, 1, 1,
0.1743671, -0.8440649, 2.966933, 0, 0.5490196, 1, 1,
0.1757854, 1.256342, 1.001115, 0, 0.5450981, 1, 1,
0.1776913, -2.333876, 1.673051, 0, 0.5372549, 1, 1,
0.1809745, 0.2100104, 0.2182016, 0, 0.5333334, 1, 1,
0.1822485, -0.4820681, 2.598264, 0, 0.5254902, 1, 1,
0.1844478, -0.8598033, 4.308368, 0, 0.5215687, 1, 1,
0.184894, 0.1111005, 0.6354268, 0, 0.5137255, 1, 1,
0.1871129, -0.1341498, 2.203194, 0, 0.509804, 1, 1,
0.1905543, 0.1841359, 2.005617, 0, 0.5019608, 1, 1,
0.1926709, 1.00047, -0.5837454, 0, 0.4941176, 1, 1,
0.1936579, 0.6535615, 2.87394, 0, 0.4901961, 1, 1,
0.1940601, -1.415341, 3.823319, 0, 0.4823529, 1, 1,
0.1962974, 2.517961, -0.2319777, 0, 0.4784314, 1, 1,
0.1964976, -1.71812, 3.965716, 0, 0.4705882, 1, 1,
0.1966871, 0.8156544, 0.7035457, 0, 0.4666667, 1, 1,
0.1989978, 0.1641955, 0.2868831, 0, 0.4588235, 1, 1,
0.2051652, -0.01651154, 1.095383, 0, 0.454902, 1, 1,
0.2052459, -0.9746025, 2.315256, 0, 0.4470588, 1, 1,
0.2082672, 0.8075813, 0.5874453, 0, 0.4431373, 1, 1,
0.2151879, -2.046134, 3.514882, 0, 0.4352941, 1, 1,
0.2183508, -0.5424322, 2.710089, 0, 0.4313726, 1, 1,
0.2209581, 2.286986, -1.826405, 0, 0.4235294, 1, 1,
0.2210454, 0.7736949, -0.5154705, 0, 0.4196078, 1, 1,
0.2231747, -0.8052314, 3.347027, 0, 0.4117647, 1, 1,
0.225754, -0.957527, 2.494117, 0, 0.4078431, 1, 1,
0.2264652, -0.5420365, 1.42451, 0, 0.4, 1, 1,
0.2265145, -0.5523738, 2.852817, 0, 0.3921569, 1, 1,
0.229063, -0.4574503, 1.750197, 0, 0.3882353, 1, 1,
0.2336796, 0.9647498, 0.04236882, 0, 0.3803922, 1, 1,
0.2374256, 1.398354, 1.012133, 0, 0.3764706, 1, 1,
0.2387468, 0.4921337, 0.9422137, 0, 0.3686275, 1, 1,
0.2393079, -0.1180832, 1.722206, 0, 0.3647059, 1, 1,
0.2425058, -0.3627467, 1.834932, 0, 0.3568628, 1, 1,
0.2432778, 0.1909313, -0.2305814, 0, 0.3529412, 1, 1,
0.2463846, 0.07824862, 0.6657761, 0, 0.345098, 1, 1,
0.2506358, 0.1637965, 1.765269, 0, 0.3411765, 1, 1,
0.257724, -1.393662, 1.317537, 0, 0.3333333, 1, 1,
0.2655723, -1.788429, 3.676714, 0, 0.3294118, 1, 1,
0.2666783, 1.172779, 0.2740658, 0, 0.3215686, 1, 1,
0.2668378, -0.6279296, 1.315089, 0, 0.3176471, 1, 1,
0.2671872, 0.6752698, 1.702757, 0, 0.3098039, 1, 1,
0.2681365, 0.0228331, 2.320825, 0, 0.3058824, 1, 1,
0.2688243, 0.6807256, 0.9350879, 0, 0.2980392, 1, 1,
0.280801, 1.662703, 2.580403, 0, 0.2901961, 1, 1,
0.2868696, 0.6966958, 2.1939, 0, 0.2862745, 1, 1,
0.2914414, 1.429223, -0.1031523, 0, 0.2784314, 1, 1,
0.2944842, -1.362185, 2.248824, 0, 0.2745098, 1, 1,
0.2955365, 0.680484, 1.134716, 0, 0.2666667, 1, 1,
0.2985501, -0.02118636, 1.6279, 0, 0.2627451, 1, 1,
0.3064835, -0.4147925, 3.191438, 0, 0.254902, 1, 1,
0.3098772, 1.031611, -0.6725811, 0, 0.2509804, 1, 1,
0.3113387, 1.247972, 0.6014568, 0, 0.2431373, 1, 1,
0.3116344, 0.8275279, 0.7230133, 0, 0.2392157, 1, 1,
0.31455, 1.715812, -1.169276, 0, 0.2313726, 1, 1,
0.3160711, -0.3535458, 2.629148, 0, 0.227451, 1, 1,
0.318983, -1.43811, 3.46633, 0, 0.2196078, 1, 1,
0.3204706, 0.3203815, 1.871385, 0, 0.2156863, 1, 1,
0.3239811, -0.4512789, 4.176632, 0, 0.2078431, 1, 1,
0.325376, 2.892789, 1.385355, 0, 0.2039216, 1, 1,
0.3300234, 0.1702441, 2.142417, 0, 0.1960784, 1, 1,
0.3427563, 0.3298285, 0.9133502, 0, 0.1882353, 1, 1,
0.344313, -0.1013794, 4.217793, 0, 0.1843137, 1, 1,
0.3527102, -0.6995466, 1.765328, 0, 0.1764706, 1, 1,
0.3535159, 0.919896, -0.4529776, 0, 0.172549, 1, 1,
0.3569633, -0.9214423, 0.9758595, 0, 0.1647059, 1, 1,
0.3571621, -1.258307, 3.588615, 0, 0.1607843, 1, 1,
0.3575947, 0.1785501, 1.465652, 0, 0.1529412, 1, 1,
0.3590593, 0.6158522, 1.801373, 0, 0.1490196, 1, 1,
0.3680629, 0.8812624, -0.3863002, 0, 0.1411765, 1, 1,
0.3707711, -1.09434, 0.5444142, 0, 0.1372549, 1, 1,
0.3754452, 1.191338, -1.323059, 0, 0.1294118, 1, 1,
0.376073, 0.6712296, 0.4998877, 0, 0.1254902, 1, 1,
0.3838362, 0.3318088, 0.3674827, 0, 0.1176471, 1, 1,
0.3864144, -0.7946265, 3.358899, 0, 0.1137255, 1, 1,
0.3888755, 0.8354689, 2.482156, 0, 0.1058824, 1, 1,
0.3990462, -2.384024, 3.799497, 0, 0.09803922, 1, 1,
0.4032423, 0.7150979, 0.02616239, 0, 0.09411765, 1, 1,
0.4065049, -2.022255, 3.55629, 0, 0.08627451, 1, 1,
0.4102731, 0.02681625, 1.374737, 0, 0.08235294, 1, 1,
0.4140621, -1.123703, 4.02168, 0, 0.07450981, 1, 1,
0.4156532, 0.3780303, 1.743955, 0, 0.07058824, 1, 1,
0.4223403, -1.027269, 3.344366, 0, 0.0627451, 1, 1,
0.4253908, 1.93762, 0.5684106, 0, 0.05882353, 1, 1,
0.4263623, -1.031116, 3.558266, 0, 0.05098039, 1, 1,
0.4268938, 0.004623943, 2.748217, 0, 0.04705882, 1, 1,
0.4304794, -1.108547, 1.717506, 0, 0.03921569, 1, 1,
0.4322952, -0.6226376, 2.907964, 0, 0.03529412, 1, 1,
0.4330299, 0.6000552, 0.8511753, 0, 0.02745098, 1, 1,
0.43565, -0.08136028, 2.684947, 0, 0.02352941, 1, 1,
0.4376029, 1.000664, 1.712863, 0, 0.01568628, 1, 1,
0.453849, 0.5266662, 1.028969, 0, 0.01176471, 1, 1,
0.455987, 0.005314037, 0.9445579, 0, 0.003921569, 1, 1,
0.4588737, 1.245412, 0.4079725, 0.003921569, 0, 1, 1,
0.4630173, -0.5721659, 2.951614, 0.007843138, 0, 1, 1,
0.4706247, 1.074537, 0.1138033, 0.01568628, 0, 1, 1,
0.4716652, 0.608427, -0.2781747, 0.01960784, 0, 1, 1,
0.4766128, 0.8174267, 1.897713, 0.02745098, 0, 1, 1,
0.4774027, 0.307707, 0.4085924, 0.03137255, 0, 1, 1,
0.477879, -0.3595021, 2.35088, 0.03921569, 0, 1, 1,
0.4798883, -0.2506563, 3.537581, 0.04313726, 0, 1, 1,
0.480588, -0.07037347, 0.4004925, 0.05098039, 0, 1, 1,
0.4821867, -0.08616495, 1.446428, 0.05490196, 0, 1, 1,
0.4826942, 0.5846827, 1.160471, 0.0627451, 0, 1, 1,
0.484719, 1.50934, 0.6656029, 0.06666667, 0, 1, 1,
0.4911232, 0.6826509, 0.9208608, 0.07450981, 0, 1, 1,
0.4931795, -1.797742, 2.251336, 0.07843138, 0, 1, 1,
0.493272, 0.7895495, 1.170654, 0.08627451, 0, 1, 1,
0.4949719, 1.668643, -0.4119292, 0.09019608, 0, 1, 1,
0.4981011, -0.4046848, 2.191045, 0.09803922, 0, 1, 1,
0.4987753, 0.2039163, 1.282127, 0.1058824, 0, 1, 1,
0.4998209, -1.075625, 3.067971, 0.1098039, 0, 1, 1,
0.5021303, -0.09487692, 2.324256, 0.1176471, 0, 1, 1,
0.5022085, 0.6977987, 0.9150996, 0.1215686, 0, 1, 1,
0.5026972, 0.1004967, 0.7197013, 0.1294118, 0, 1, 1,
0.5030051, -0.9175398, 1.904972, 0.1333333, 0, 1, 1,
0.5090526, 1.581346, -0.0683064, 0.1411765, 0, 1, 1,
0.5141005, -0.9562279, 4.791932, 0.145098, 0, 1, 1,
0.5213546, 0.2472513, 1.038542, 0.1529412, 0, 1, 1,
0.5246354, 0.995795, -0.001994526, 0.1568628, 0, 1, 1,
0.5250834, -0.7095462, 2.063564, 0.1647059, 0, 1, 1,
0.5253973, -0.8911231, 1.410337, 0.1686275, 0, 1, 1,
0.5280586, 1.176477, -0.1305219, 0.1764706, 0, 1, 1,
0.52899, 2.129956, 1.845008, 0.1803922, 0, 1, 1,
0.5296595, -0.5487595, 4.709175, 0.1882353, 0, 1, 1,
0.5303873, -0.4934148, 2.657164, 0.1921569, 0, 1, 1,
0.5323801, 0.336417, 0.8751097, 0.2, 0, 1, 1,
0.5334184, 0.6610075, -0.2622083, 0.2078431, 0, 1, 1,
0.5358979, -0.4381534, 1.931581, 0.2117647, 0, 1, 1,
0.5374495, -0.3589083, 2.487999, 0.2196078, 0, 1, 1,
0.5378102, 1.174243, 0.219981, 0.2235294, 0, 1, 1,
0.5380708, 0.241085, 1.628612, 0.2313726, 0, 1, 1,
0.5388703, 0.3461424, 2.319981, 0.2352941, 0, 1, 1,
0.5393666, 1.160932, -0.6983429, 0.2431373, 0, 1, 1,
0.5396144, 0.1341005, 2.613083, 0.2470588, 0, 1, 1,
0.5412661, -0.7974479, 1.739549, 0.254902, 0, 1, 1,
0.5415924, 1.152599, 2.127298, 0.2588235, 0, 1, 1,
0.5434818, 0.3854603, 1.557275, 0.2666667, 0, 1, 1,
0.5451277, 0.1729925, 1.844709, 0.2705882, 0, 1, 1,
0.5458693, -1.952345, 4.346419, 0.2784314, 0, 1, 1,
0.5461137, 0.7124165, 0.400427, 0.282353, 0, 1, 1,
0.5488757, -1.311642, 2.422057, 0.2901961, 0, 1, 1,
0.5502062, -1.18327, 3.692638, 0.2941177, 0, 1, 1,
0.553298, 0.8236428, 0.1716246, 0.3019608, 0, 1, 1,
0.5575736, -0.3219507, 2.044225, 0.3098039, 0, 1, 1,
0.5602175, -1.355499, 2.016683, 0.3137255, 0, 1, 1,
0.5615974, 0.6169577, -0.7422333, 0.3215686, 0, 1, 1,
0.5632843, -1.894974, 2.253661, 0.3254902, 0, 1, 1,
0.5645637, -0.7989518, 4.455964, 0.3333333, 0, 1, 1,
0.5680739, -1.286923, 2.743509, 0.3372549, 0, 1, 1,
0.5709299, -0.4688464, 2.743074, 0.345098, 0, 1, 1,
0.5736877, 0.2626635, 1.290537, 0.3490196, 0, 1, 1,
0.573918, 0.1606, 1.349052, 0.3568628, 0, 1, 1,
0.5755098, -1.620079, 2.581191, 0.3607843, 0, 1, 1,
0.5796295, 1.794375, 2.260741, 0.3686275, 0, 1, 1,
0.5859128, 0.262774, 1.111033, 0.372549, 0, 1, 1,
0.5948809, 0.710404, 0.05589391, 0.3803922, 0, 1, 1,
0.5963874, -0.1732166, 1.89351, 0.3843137, 0, 1, 1,
0.5997066, 0.9708287, -0.1327382, 0.3921569, 0, 1, 1,
0.6003012, 0.6928707, 0.0973954, 0.3960784, 0, 1, 1,
0.6003469, 0.1876664, 2.787518, 0.4039216, 0, 1, 1,
0.6031815, -0.7035829, 3.706992, 0.4117647, 0, 1, 1,
0.6051931, 2.019063, 0.1238403, 0.4156863, 0, 1, 1,
0.6065127, 1.667172, -0.9087319, 0.4235294, 0, 1, 1,
0.6065373, 0.2946941, -0.5794262, 0.427451, 0, 1, 1,
0.6068839, -0.008039476, 2.252805, 0.4352941, 0, 1, 1,
0.6167849, 0.1411055, 2.169775, 0.4392157, 0, 1, 1,
0.6178549, -0.4296848, 1.165414, 0.4470588, 0, 1, 1,
0.6180131, 1.540815, 0.08947522, 0.4509804, 0, 1, 1,
0.6180555, 1.441207, -1.218919, 0.4588235, 0, 1, 1,
0.6186911, -0.9579203, 3.233873, 0.4627451, 0, 1, 1,
0.6238663, -1.014216, 2.215294, 0.4705882, 0, 1, 1,
0.6321207, -0.9603175, 1.3884, 0.4745098, 0, 1, 1,
0.6328415, -1.185437, 0.7249368, 0.4823529, 0, 1, 1,
0.6389518, -0.2887655, 1.905279, 0.4862745, 0, 1, 1,
0.6407644, 0.3739838, 2.777736, 0.4941176, 0, 1, 1,
0.6450599, -0.972666, 3.190996, 0.5019608, 0, 1, 1,
0.6455696, 1.023464, -0.0518334, 0.5058824, 0, 1, 1,
0.6456024, 0.5031345, 0.4228224, 0.5137255, 0, 1, 1,
0.6531107, -1.233166, 3.488322, 0.5176471, 0, 1, 1,
0.6546448, -0.8816931, 2.481399, 0.5254902, 0, 1, 1,
0.6622792, -0.3576681, 2.683147, 0.5294118, 0, 1, 1,
0.66348, -1.147275, 3.325528, 0.5372549, 0, 1, 1,
0.6652306, 2.436477, 0.8494839, 0.5411765, 0, 1, 1,
0.6654749, 2.165144, 0.1825638, 0.5490196, 0, 1, 1,
0.6675063, -0.08037529, 0.6851665, 0.5529412, 0, 1, 1,
0.6760606, -0.5748364, 1.743247, 0.5607843, 0, 1, 1,
0.6799088, -2.097185, 3.50849, 0.5647059, 0, 1, 1,
0.683838, -0.04593134, 0.8391054, 0.572549, 0, 1, 1,
0.6856276, -0.2849995, 2.604753, 0.5764706, 0, 1, 1,
0.6886153, 1.04541, 0.6639467, 0.5843138, 0, 1, 1,
0.6966281, -0.508266, 3.773748, 0.5882353, 0, 1, 1,
0.7018351, -1.551751, 3.414561, 0.5960785, 0, 1, 1,
0.7041672, 0.7067924, 1.923088, 0.6039216, 0, 1, 1,
0.705707, 2.146744, 0.6071614, 0.6078432, 0, 1, 1,
0.7069621, 0.4929153, 1.807469, 0.6156863, 0, 1, 1,
0.708021, -0.806518, 3.064117, 0.6196079, 0, 1, 1,
0.7095656, -0.7542262, 3.343003, 0.627451, 0, 1, 1,
0.7099983, 0.2414612, 0.6707809, 0.6313726, 0, 1, 1,
0.7139276, 0.2847048, 1.815736, 0.6392157, 0, 1, 1,
0.7159302, 1.174417, 0.4678061, 0.6431373, 0, 1, 1,
0.7221872, -1.48276, 1.838995, 0.6509804, 0, 1, 1,
0.7233423, 1.688507, 1.671664, 0.654902, 0, 1, 1,
0.7424866, 1.772578, 0.8047309, 0.6627451, 0, 1, 1,
0.747583, -0.08841127, 2.675455, 0.6666667, 0, 1, 1,
0.7499277, 0.5919471, 1.059481, 0.6745098, 0, 1, 1,
0.7556708, 1.354357, 1.038592, 0.6784314, 0, 1, 1,
0.7718824, 1.04297, 1.258882, 0.6862745, 0, 1, 1,
0.7736166, -0.5923101, 2.469872, 0.6901961, 0, 1, 1,
0.7760748, -1.616033, 2.809945, 0.6980392, 0, 1, 1,
0.7766131, -1.903855, 3.909936, 0.7058824, 0, 1, 1,
0.779125, -0.8606976, 2.31743, 0.7098039, 0, 1, 1,
0.7796757, -2.039985, 2.698268, 0.7176471, 0, 1, 1,
0.7875908, 1.118372, 0.03914144, 0.7215686, 0, 1, 1,
0.7895138, -0.9539627, 4.287549, 0.7294118, 0, 1, 1,
0.7969586, -0.09939978, -0.03502058, 0.7333333, 0, 1, 1,
0.7999887, 1.094983, 1.20436, 0.7411765, 0, 1, 1,
0.8014219, -0.3936211, 1.495608, 0.7450981, 0, 1, 1,
0.8158692, -1.74519, 2.630938, 0.7529412, 0, 1, 1,
0.8162768, -0.7169836, 3.236002, 0.7568628, 0, 1, 1,
0.8227965, -0.7307112, -0.3358601, 0.7647059, 0, 1, 1,
0.8256727, 0.7566835, 1.055276, 0.7686275, 0, 1, 1,
0.8340849, 0.7646662, -0.0966289, 0.7764706, 0, 1, 1,
0.8362506, 0.4213845, 1.457847, 0.7803922, 0, 1, 1,
0.8378792, -0.8368817, 2.098783, 0.7882353, 0, 1, 1,
0.8389333, -0.9167736, 1.772531, 0.7921569, 0, 1, 1,
0.8397427, -1.366249, 1.096, 0.8, 0, 1, 1,
0.8461132, -1.126976, 2.940291, 0.8078431, 0, 1, 1,
0.8470823, 1.275386, 0.5104551, 0.8117647, 0, 1, 1,
0.847822, -1.188218, 2.666075, 0.8196079, 0, 1, 1,
0.8499666, 1.454672, 0.6037433, 0.8235294, 0, 1, 1,
0.8537953, -0.2455567, 0.9940262, 0.8313726, 0, 1, 1,
0.8566033, -1.307614, 1.897897, 0.8352941, 0, 1, 1,
0.8655605, 1.038531, 1.663055, 0.8431373, 0, 1, 1,
0.8674785, -1.8933, 2.334759, 0.8470588, 0, 1, 1,
0.8788451, 0.5578989, 1.634774, 0.854902, 0, 1, 1,
0.8832428, 1.974661, 0.4647378, 0.8588235, 0, 1, 1,
0.8916799, 0.4944802, 1.642817, 0.8666667, 0, 1, 1,
0.8961644, -0.3510565, 3.145096, 0.8705882, 0, 1, 1,
0.896632, 0.04320527, -0.1385144, 0.8784314, 0, 1, 1,
0.9004492, -0.3916621, 2.343191, 0.8823529, 0, 1, 1,
0.9049972, 0.0937388, 2.706173, 0.8901961, 0, 1, 1,
0.9057449, 0.2224215, 1.484108, 0.8941177, 0, 1, 1,
0.9078242, 0.7325083, 0.7759678, 0.9019608, 0, 1, 1,
0.9079385, 1.387022, 0.724981, 0.9098039, 0, 1, 1,
0.9103273, -0.1291757, 1.30196, 0.9137255, 0, 1, 1,
0.9184886, -0.1791099, 2.369096, 0.9215686, 0, 1, 1,
0.926486, 1.09818, 0.537813, 0.9254902, 0, 1, 1,
0.929027, 1.441008, 0.9005749, 0.9333333, 0, 1, 1,
0.9291216, -1.09719, 4.39973, 0.9372549, 0, 1, 1,
0.9366927, 0.4575291, -1.558209, 0.945098, 0, 1, 1,
0.9492116, 0.5154679, -0.5953088, 0.9490196, 0, 1, 1,
0.9520008, 0.4593687, 2.444218, 0.9568627, 0, 1, 1,
0.9597626, -1.667971, 1.212061, 0.9607843, 0, 1, 1,
0.9686955, 1.360268, 1.859149, 0.9686275, 0, 1, 1,
0.9763324, 1.3559, 0.2956637, 0.972549, 0, 1, 1,
0.9785836, -0.9797263, 1.447054, 0.9803922, 0, 1, 1,
0.9803294, 0.06821294, 1.399064, 0.9843137, 0, 1, 1,
0.98269, 0.5065685, 0.3349353, 0.9921569, 0, 1, 1,
0.9837756, -0.2926823, 1.485982, 0.9960784, 0, 1, 1,
0.9991359, -0.4403799, 0.7801487, 1, 0, 0.9960784, 1,
1.005555, -0.1153263, 2.428722, 1, 0, 0.9882353, 1,
1.010644, 0.06284156, 1.280929, 1, 0, 0.9843137, 1,
1.013443, 2.146184, 1.027814, 1, 0, 0.9764706, 1,
1.015871, -0.7072468, 3.374579, 1, 0, 0.972549, 1,
1.022126, 0.09125382, 1.836659, 1, 0, 0.9647059, 1,
1.022798, -0.581068, 0.6424839, 1, 0, 0.9607843, 1,
1.025479, -0.7884552, 2.091085, 1, 0, 0.9529412, 1,
1.027111, 0.1382013, 0.2906629, 1, 0, 0.9490196, 1,
1.033239, -2.035023, 1.466226, 1, 0, 0.9411765, 1,
1.034366, -1.592645, 0.7721118, 1, 0, 0.9372549, 1,
1.037394, -0.6907007, 1.788615, 1, 0, 0.9294118, 1,
1.039537, -0.1939294, 4.034342, 1, 0, 0.9254902, 1,
1.041063, -0.4318759, 3.024727, 1, 0, 0.9176471, 1,
1.041193, 1.178029, -0.2648664, 1, 0, 0.9137255, 1,
1.042, -0.4604622, 2.389628, 1, 0, 0.9058824, 1,
1.042019, 1.447964, -0.8201284, 1, 0, 0.9019608, 1,
1.043524, -0.656673, 1.752932, 1, 0, 0.8941177, 1,
1.044078, -0.6975307, 0.6028586, 1, 0, 0.8862745, 1,
1.044871, -0.1598881, 1.789693, 1, 0, 0.8823529, 1,
1.076476, 0.3037525, 1.237994, 1, 0, 0.8745098, 1,
1.083423, 0.5418692, 0.1009986, 1, 0, 0.8705882, 1,
1.08574, -0.2083253, 1.178728, 1, 0, 0.8627451, 1,
1.089857, -2.441298, 2.050197, 1, 0, 0.8588235, 1,
1.092766, -1.787692, 2.583065, 1, 0, 0.8509804, 1,
1.093599, 1.262843, 1.368729, 1, 0, 0.8470588, 1,
1.095049, 1.339584, 1.948079, 1, 0, 0.8392157, 1,
1.095527, 0.4657247, 2.351511, 1, 0, 0.8352941, 1,
1.103728, 0.4604852, 1.812827, 1, 0, 0.827451, 1,
1.109672, 0.05033888, 1.47814, 1, 0, 0.8235294, 1,
1.109922, 0.7046785, 0.006538672, 1, 0, 0.8156863, 1,
1.114313, 2.428142, 0.7560109, 1, 0, 0.8117647, 1,
1.123614, -0.8028669, 1.237539, 1, 0, 0.8039216, 1,
1.13439, -2.451312, 4.30053, 1, 0, 0.7960784, 1,
1.13669, 0.8677936, 0.5437129, 1, 0, 0.7921569, 1,
1.143338, 0.3237978, 0.6670377, 1, 0, 0.7843137, 1,
1.147663, 2.793719, 2.023992, 1, 0, 0.7803922, 1,
1.153707, -0.5516506, 1.732733, 1, 0, 0.772549, 1,
1.158883, -0.8727555, 1.788068, 1, 0, 0.7686275, 1,
1.167673, -1.829616, 2.45146, 1, 0, 0.7607843, 1,
1.181699, -2.157908, 1.098162, 1, 0, 0.7568628, 1,
1.190526, -2.276873, 2.057904, 1, 0, 0.7490196, 1,
1.193638, 1.457873, 0.656709, 1, 0, 0.7450981, 1,
1.198236, -0.3198481, 1.959223, 1, 0, 0.7372549, 1,
1.2141, 0.8235682, 0.6954233, 1, 0, 0.7333333, 1,
1.214103, -1.008803, 1.059313, 1, 0, 0.7254902, 1,
1.216016, -1.023685, 3.846752, 1, 0, 0.7215686, 1,
1.248681, 0.7715895, 0.2578591, 1, 0, 0.7137255, 1,
1.263845, 1.545256, 1.186585, 1, 0, 0.7098039, 1,
1.303587, 1.345446, -0.4813184, 1, 0, 0.7019608, 1,
1.306997, -0.0009047042, 1.203447, 1, 0, 0.6941177, 1,
1.307093, -1.045874, 1.772688, 1, 0, 0.6901961, 1,
1.308729, 0.7144296, -0.007575683, 1, 0, 0.682353, 1,
1.31153, -0.8263445, 1.740654, 1, 0, 0.6784314, 1,
1.313389, -0.2311133, 1.962158, 1, 0, 0.6705883, 1,
1.316158, 2.026739, 1.513615, 1, 0, 0.6666667, 1,
1.316351, -0.2749423, 4.70684, 1, 0, 0.6588235, 1,
1.318545, -0.7932796, 2.223706, 1, 0, 0.654902, 1,
1.334826, -1.179941, 1.164318, 1, 0, 0.6470588, 1,
1.336761, 0.1027335, 0.1325804, 1, 0, 0.6431373, 1,
1.341528, -1.534231, 1.671256, 1, 0, 0.6352941, 1,
1.347067, 0.2130319, -0.2730066, 1, 0, 0.6313726, 1,
1.350091, -0.2510984, 2.092319, 1, 0, 0.6235294, 1,
1.350401, 0.7191093, 1.833577, 1, 0, 0.6196079, 1,
1.358264, -0.4780101, 2.499557, 1, 0, 0.6117647, 1,
1.366423, 1.409183, 0.4807279, 1, 0, 0.6078432, 1,
1.369027, -1.353039, 2.292676, 1, 0, 0.6, 1,
1.369545, -0.4058396, 1.148711, 1, 0, 0.5921569, 1,
1.374806, -0.3465578, 1.880332, 1, 0, 0.5882353, 1,
1.374911, -0.5737121, 0.5663824, 1, 0, 0.5803922, 1,
1.378923, 0.3282345, 1.007966, 1, 0, 0.5764706, 1,
1.386936, -0.2138602, 3.069945, 1, 0, 0.5686275, 1,
1.395527, 0.47382, 1.133245, 1, 0, 0.5647059, 1,
1.397959, -0.2763526, 2.710599, 1, 0, 0.5568628, 1,
1.417006, -0.06592027, 0.5345153, 1, 0, 0.5529412, 1,
1.422755, -1.290552, 1.329547, 1, 0, 0.5450981, 1,
1.424605, 1.521402, 2.053386, 1, 0, 0.5411765, 1,
1.424966, -0.5019317, 0.1296843, 1, 0, 0.5333334, 1,
1.427556, 1.280565, 0.2875069, 1, 0, 0.5294118, 1,
1.445493, 0.2976179, 0.009541389, 1, 0, 0.5215687, 1,
1.461749, -0.7191898, 1.410451, 1, 0, 0.5176471, 1,
1.47024, -0.2995803, 1.532134, 1, 0, 0.509804, 1,
1.474985, 1.312424, 3.320243, 1, 0, 0.5058824, 1,
1.483531, -0.7794674, 2.521987, 1, 0, 0.4980392, 1,
1.487733, 0.6107907, -0.6447515, 1, 0, 0.4901961, 1,
1.490978, -0.4984963, 1.554942, 1, 0, 0.4862745, 1,
1.491955, 1.120587, 0.6135802, 1, 0, 0.4784314, 1,
1.501964, -1.907845, 3.038312, 1, 0, 0.4745098, 1,
1.504364, 0.4645678, 2.293035, 1, 0, 0.4666667, 1,
1.514239, 0.5788434, 2.732985, 1, 0, 0.4627451, 1,
1.542153, -0.5539572, 2.761221, 1, 0, 0.454902, 1,
1.558117, -0.6880617, 3.227908, 1, 0, 0.4509804, 1,
1.56406, 0.2835983, 1.147092, 1, 0, 0.4431373, 1,
1.571873, 1.018352, 1.503502, 1, 0, 0.4392157, 1,
1.572865, 0.001955219, -0.04471207, 1, 0, 0.4313726, 1,
1.583982, -0.661163, 2.392799, 1, 0, 0.427451, 1,
1.591314, 0.6061183, 2.213961, 1, 0, 0.4196078, 1,
1.593974, 0.5261646, 0.6927696, 1, 0, 0.4156863, 1,
1.603492, -1.847616, 2.320218, 1, 0, 0.4078431, 1,
1.613068, 0.5934947, 1.903826, 1, 0, 0.4039216, 1,
1.619444, -0.3112384, 2.1427, 1, 0, 0.3960784, 1,
1.620454, -0.8746867, 1.357869, 1, 0, 0.3882353, 1,
1.639794, -1.455671, 4.074315, 1, 0, 0.3843137, 1,
1.641816, 0.6689378, 2.116627, 1, 0, 0.3764706, 1,
1.646448, 0.8987079, 1.96363, 1, 0, 0.372549, 1,
1.648298, 0.8633838, 0.840537, 1, 0, 0.3647059, 1,
1.669653, 0.8694065, 0.4492502, 1, 0, 0.3607843, 1,
1.68154, -0.4337214, 1.552718, 1, 0, 0.3529412, 1,
1.682899, -0.3571402, 0.7105638, 1, 0, 0.3490196, 1,
1.683032, 0.402608, 2.15462, 1, 0, 0.3411765, 1,
1.702199, 1.189669, 0.3182994, 1, 0, 0.3372549, 1,
1.716874, -1.023507, 2.621922, 1, 0, 0.3294118, 1,
1.724855, -1.377192, 3.026172, 1, 0, 0.3254902, 1,
1.725475, -1.407142, 2.847804, 1, 0, 0.3176471, 1,
1.737962, 1.210904, 2.083147, 1, 0, 0.3137255, 1,
1.743459, 0.1932942, 1.973692, 1, 0, 0.3058824, 1,
1.7516, -1.445453, 2.197997, 1, 0, 0.2980392, 1,
1.755771, -0.2874186, 1.77072, 1, 0, 0.2941177, 1,
1.768113, 1.143777, 1.560059, 1, 0, 0.2862745, 1,
1.78295, 0.5109297, 0.8964155, 1, 0, 0.282353, 1,
1.788171, 0.6357682, 1.248345, 1, 0, 0.2745098, 1,
1.788683, 0.1364811, 1.786295, 1, 0, 0.2705882, 1,
1.794409, 2.096514, 2.049116, 1, 0, 0.2627451, 1,
1.796461, -0.03837955, 1.883073, 1, 0, 0.2588235, 1,
1.8138, 1.460791, 2.133693, 1, 0, 0.2509804, 1,
1.816656, 0.8945129, 1.332638, 1, 0, 0.2470588, 1,
1.823454, 1.187718, 0.2093134, 1, 0, 0.2392157, 1,
1.847697, -0.3895316, 2.485357, 1, 0, 0.2352941, 1,
1.856714, 0.5557188, 2.170666, 1, 0, 0.227451, 1,
1.869907, -1.957502, 3.214906, 1, 0, 0.2235294, 1,
1.883934, -0.1336897, 2.783367, 1, 0, 0.2156863, 1,
1.905039, -0.7672005, 2.711594, 1, 0, 0.2117647, 1,
1.917653, 0.4207147, 2.3324, 1, 0, 0.2039216, 1,
1.922486, 1.25716, 0.1569004, 1, 0, 0.1960784, 1,
1.930951, -1.068724, 1.45499, 1, 0, 0.1921569, 1,
1.938002, -1.72777, 2.369887, 1, 0, 0.1843137, 1,
1.955668, -1.120522, 0.7614905, 1, 0, 0.1803922, 1,
1.975495, 0.2285501, 0.3876127, 1, 0, 0.172549, 1,
1.984492, -0.07049385, 2.582573, 1, 0, 0.1686275, 1,
2.017382, -0.3273451, 3.013997, 1, 0, 0.1607843, 1,
2.021467, -1.151341, 0.5656446, 1, 0, 0.1568628, 1,
2.044474, -0.6522061, 0.8004305, 1, 0, 0.1490196, 1,
2.052248, 0.3244144, -0.3007882, 1, 0, 0.145098, 1,
2.060203, -0.04875494, 1.382944, 1, 0, 0.1372549, 1,
2.083209, -0.895852, 1.33092, 1, 0, 0.1333333, 1,
2.109274, 1.021301, -1.232776, 1, 0, 0.1254902, 1,
2.122934, 0.8227764, -0.3326859, 1, 0, 0.1215686, 1,
2.158521, 1.168736, 0.9993097, 1, 0, 0.1137255, 1,
2.165429, 0.6714826, 0.2880184, 1, 0, 0.1098039, 1,
2.17595, 0.7107934, 2.224189, 1, 0, 0.1019608, 1,
2.178639, -0.916212, 1.598078, 1, 0, 0.09411765, 1,
2.181597, -1.745867, 2.333457, 1, 0, 0.09019608, 1,
2.279207, -0.9645782, 2.703339, 1, 0, 0.08235294, 1,
2.280747, 0.5249807, 3.152923, 1, 0, 0.07843138, 1,
2.29621, -0.8407608, 2.762606, 1, 0, 0.07058824, 1,
2.300708, -3.725168, 1.83546, 1, 0, 0.06666667, 1,
2.375311, 0.4622462, 1.632121, 1, 0, 0.05882353, 1,
2.389505, -0.694392, 3.28807, 1, 0, 0.05490196, 1,
2.487003, 0.1242281, 2.762999, 1, 0, 0.04705882, 1,
2.501191, 0.5751175, 2.701897, 1, 0, 0.04313726, 1,
2.578534, 1.795584, 0.5288383, 1, 0, 0.03529412, 1,
2.708449, 1.374158, 3.205404, 1, 0, 0.03137255, 1,
2.72539, -2.047493, 1.827896, 1, 0, 0.02352941, 1,
2.747013, -0.02512623, 2.554791, 1, 0, 0.01960784, 1,
2.965466, -1.943785, 1.822674, 1, 0, 0.01176471, 1,
3.812299, 1.088324, 0.320739, 1, 0, 0.007843138, 1
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
0.1622378, -4.936423, -7.86071, 0, -0.5, 0.5, 0.5,
0.1622378, -4.936423, -7.86071, 1, -0.5, 0.5, 0.5,
0.1622378, -4.936423, -7.86071, 1, 1.5, 0.5, 0.5,
0.1622378, -4.936423, -7.86071, 0, 1.5, 0.5, 0.5
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
-4.725194, -0.1521461, -7.86071, 0, -0.5, 0.5, 0.5,
-4.725194, -0.1521461, -7.86071, 1, -0.5, 0.5, 0.5,
-4.725194, -0.1521461, -7.86071, 1, 1.5, 0.5, 0.5,
-4.725194, -0.1521461, -7.86071, 0, 1.5, 0.5, 0.5
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
-4.725194, -4.936423, -0.2274587, 0, -0.5, 0.5, 0.5,
-4.725194, -4.936423, -0.2274587, 1, -0.5, 0.5, 0.5,
-4.725194, -4.936423, -0.2274587, 1, 1.5, 0.5, 0.5,
-4.725194, -4.936423, -0.2274587, 0, 1.5, 0.5, 0.5
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
-2, -3.832359, -6.099191,
2, -3.832359, -6.099191,
-2, -3.832359, -6.099191,
-2, -4.01637, -6.392777,
0, -3.832359, -6.099191,
0, -4.01637, -6.392777,
2, -3.832359, -6.099191,
2, -4.01637, -6.392777
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
-2, -4.384391, -6.97995, 0, -0.5, 0.5, 0.5,
-2, -4.384391, -6.97995, 1, -0.5, 0.5, 0.5,
-2, -4.384391, -6.97995, 1, 1.5, 0.5, 0.5,
-2, -4.384391, -6.97995, 0, 1.5, 0.5, 0.5,
0, -4.384391, -6.97995, 0, -0.5, 0.5, 0.5,
0, -4.384391, -6.97995, 1, -0.5, 0.5, 0.5,
0, -4.384391, -6.97995, 1, 1.5, 0.5, 0.5,
0, -4.384391, -6.97995, 0, 1.5, 0.5, 0.5,
2, -4.384391, -6.97995, 0, -0.5, 0.5, 0.5,
2, -4.384391, -6.97995, 1, -0.5, 0.5, 0.5,
2, -4.384391, -6.97995, 1, 1.5, 0.5, 0.5,
2, -4.384391, -6.97995, 0, 1.5, 0.5, 0.5
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
-3.597325, -2, -6.099191,
-3.597325, 2, -6.099191,
-3.597325, -2, -6.099191,
-3.785303, -2, -6.392777,
-3.597325, 0, -6.099191,
-3.785303, 0, -6.392777,
-3.597325, 2, -6.099191,
-3.785303, 2, -6.392777
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
-4.16126, -2, -6.97995, 0, -0.5, 0.5, 0.5,
-4.16126, -2, -6.97995, 1, -0.5, 0.5, 0.5,
-4.16126, -2, -6.97995, 1, 1.5, 0.5, 0.5,
-4.16126, -2, -6.97995, 0, 1.5, 0.5, 0.5,
-4.16126, 0, -6.97995, 0, -0.5, 0.5, 0.5,
-4.16126, 0, -6.97995, 1, -0.5, 0.5, 0.5,
-4.16126, 0, -6.97995, 1, 1.5, 0.5, 0.5,
-4.16126, 0, -6.97995, 0, 1.5, 0.5, 0.5,
-4.16126, 2, -6.97995, 0, -0.5, 0.5, 0.5,
-4.16126, 2, -6.97995, 1, -0.5, 0.5, 0.5,
-4.16126, 2, -6.97995, 1, 1.5, 0.5, 0.5,
-4.16126, 2, -6.97995, 0, 1.5, 0.5, 0.5
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
-3.597325, -3.832359, -4,
-3.597325, -3.832359, 4,
-3.597325, -3.832359, -4,
-3.785303, -4.01637, -4,
-3.597325, -3.832359, -2,
-3.785303, -4.01637, -2,
-3.597325, -3.832359, 0,
-3.785303, -4.01637, 0,
-3.597325, -3.832359, 2,
-3.785303, -4.01637, 2,
-3.597325, -3.832359, 4,
-3.785303, -4.01637, 4
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
-4.16126, -4.384391, -4, 0, -0.5, 0.5, 0.5,
-4.16126, -4.384391, -4, 1, -0.5, 0.5, 0.5,
-4.16126, -4.384391, -4, 1, 1.5, 0.5, 0.5,
-4.16126, -4.384391, -4, 0, 1.5, 0.5, 0.5,
-4.16126, -4.384391, -2, 0, -0.5, 0.5, 0.5,
-4.16126, -4.384391, -2, 1, -0.5, 0.5, 0.5,
-4.16126, -4.384391, -2, 1, 1.5, 0.5, 0.5,
-4.16126, -4.384391, -2, 0, 1.5, 0.5, 0.5,
-4.16126, -4.384391, 0, 0, -0.5, 0.5, 0.5,
-4.16126, -4.384391, 0, 1, -0.5, 0.5, 0.5,
-4.16126, -4.384391, 0, 1, 1.5, 0.5, 0.5,
-4.16126, -4.384391, 0, 0, 1.5, 0.5, 0.5,
-4.16126, -4.384391, 2, 0, -0.5, 0.5, 0.5,
-4.16126, -4.384391, 2, 1, -0.5, 0.5, 0.5,
-4.16126, -4.384391, 2, 1, 1.5, 0.5, 0.5,
-4.16126, -4.384391, 2, 0, 1.5, 0.5, 0.5,
-4.16126, -4.384391, 4, 0, -0.5, 0.5, 0.5,
-4.16126, -4.384391, 4, 1, -0.5, 0.5, 0.5,
-4.16126, -4.384391, 4, 1, 1.5, 0.5, 0.5,
-4.16126, -4.384391, 4, 0, 1.5, 0.5, 0.5
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
-3.597325, -3.832359, -6.099191,
-3.597325, 3.528067, -6.099191,
-3.597325, -3.832359, 5.644273,
-3.597325, 3.528067, 5.644273,
-3.597325, -3.832359, -6.099191,
-3.597325, -3.832359, 5.644273,
-3.597325, 3.528067, -6.099191,
-3.597325, 3.528067, 5.644273,
-3.597325, -3.832359, -6.099191,
3.921801, -3.832359, -6.099191,
-3.597325, -3.832359, 5.644273,
3.921801, -3.832359, 5.644273,
-3.597325, 3.528067, -6.099191,
3.921801, 3.528067, -6.099191,
-3.597325, 3.528067, 5.644273,
3.921801, 3.528067, 5.644273,
3.921801, -3.832359, -6.099191,
3.921801, 3.528067, -6.099191,
3.921801, -3.832359, 5.644273,
3.921801, 3.528067, 5.644273,
3.921801, -3.832359, -6.099191,
3.921801, -3.832359, 5.644273,
3.921801, 3.528067, -6.099191,
3.921801, 3.528067, 5.644273
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
var radius = 8.419674;
var distance = 37.46008;
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
mvMatrix.translate( -0.1622378, 0.1521461, 0.2274587 );
mvMatrix.scale( 1.210715, 1.236819, 0.7751986 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.46008);
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
etrimfos<-read.table("etrimfos.xyz")
```

```
## Error in read.table("etrimfos.xyz"): no lines available in input
```

```r
x<-etrimfos$V2
```

```
## Error in eval(expr, envir, enclos): object 'etrimfos' not found
```

```r
y<-etrimfos$V3
```

```
## Error in eval(expr, envir, enclos): object 'etrimfos' not found
```

```r
z<-etrimfos$V4
```

```
## Error in eval(expr, envir, enclos): object 'etrimfos' not found
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
-3.487823, -1.08762, -2.893574, 0, 0, 1, 1, 1,
-2.941607, -1.693028, -2.588706, 1, 0, 0, 1, 1,
-2.89479, 0.88533, -2.196702, 1, 0, 0, 1, 1,
-2.84202, 1.978242, -0.523648, 1, 0, 0, 1, 1,
-2.761256, 0.938997, -1.048811, 1, 0, 0, 1, 1,
-2.707344, 0.7967663, -1.825059, 1, 0, 0, 1, 1,
-2.706252, -1.338271, -2.152359, 0, 0, 0, 1, 1,
-2.692254, -0.2376186, -2.493299, 0, 0, 0, 1, 1,
-2.551012, -0.2434996, -1.461475, 0, 0, 0, 1, 1,
-2.425663, 0.1045323, -1.879925, 0, 0, 0, 1, 1,
-2.419715, 1.797965, -1.483543, 0, 0, 0, 1, 1,
-2.390021, -0.9282521, -0.5521469, 0, 0, 0, 1, 1,
-2.324944, 0.76309, -2.865396, 0, 0, 0, 1, 1,
-2.231654, -0.2921531, -2.324935, 1, 1, 1, 1, 1,
-2.19852, -0.446868, -0.515764, 1, 1, 1, 1, 1,
-2.155777, -0.1598858, -0.2135917, 1, 1, 1, 1, 1,
-2.116455, 0.3462752, -0.975784, 1, 1, 1, 1, 1,
-2.098069, 0.9441362, -0.350084, 1, 1, 1, 1, 1,
-2.080751, 1.597674, 0.5705665, 1, 1, 1, 1, 1,
-2.063713, 0.5602145, -0.99258, 1, 1, 1, 1, 1,
-2.054832, -0.00576485, -1.492568, 1, 1, 1, 1, 1,
-2.031427, -1.382759, -3.303015, 1, 1, 1, 1, 1,
-2.023072, 0.02430507, -1.848958, 1, 1, 1, 1, 1,
-2.00613, 0.8926665, -1.63359, 1, 1, 1, 1, 1,
-1.989188, -0.5126047, -2.649981, 1, 1, 1, 1, 1,
-1.935027, 1.251307, -2.414323, 1, 1, 1, 1, 1,
-1.924981, -0.5471248, -3.288399, 1, 1, 1, 1, 1,
-1.907066, -0.7476501, -2.980248, 1, 1, 1, 1, 1,
-1.863866, -0.3894666, -2.235829, 0, 0, 1, 1, 1,
-1.810621, -0.2926761, -1.840431, 1, 0, 0, 1, 1,
-1.810373, 0.1511542, -1.240842, 1, 0, 0, 1, 1,
-1.799967, 0.7776029, -2.508251, 1, 0, 0, 1, 1,
-1.798205, 1.839067, -0.3679639, 1, 0, 0, 1, 1,
-1.791272, 0.8571766, -1.64183, 1, 0, 0, 1, 1,
-1.781898, -1.535692, -1.452521, 0, 0, 0, 1, 1,
-1.774404, -0.5561618, -0.8755957, 0, 0, 0, 1, 1,
-1.7501, -0.9796634, -1.065118, 0, 0, 0, 1, 1,
-1.741123, 0.3592753, -0.9795165, 0, 0, 0, 1, 1,
-1.726862, -0.1523098, -1.240662, 0, 0, 0, 1, 1,
-1.7251, 0.3117048, -0.4702271, 0, 0, 0, 1, 1,
-1.723086, 1.468136, -1.442658, 0, 0, 0, 1, 1,
-1.703197, -0.008006154, -1.911989, 1, 1, 1, 1, 1,
-1.695143, 1.721309, -2.798774, 1, 1, 1, 1, 1,
-1.677301, -1.958445, -2.595966, 1, 1, 1, 1, 1,
-1.647556, 0.07959942, -1.585591, 1, 1, 1, 1, 1,
-1.646412, 1.491986, -2.024721, 1, 1, 1, 1, 1,
-1.645286, -0.0469979, -1.436116, 1, 1, 1, 1, 1,
-1.641706, -0.8413301, -1.636805, 1, 1, 1, 1, 1,
-1.619077, -0.4673876, -1.342629, 1, 1, 1, 1, 1,
-1.615696, -1.060614, -1.567752, 1, 1, 1, 1, 1,
-1.603085, 0.4388957, -3.419846, 1, 1, 1, 1, 1,
-1.600761, 1.157914, -0.6915986, 1, 1, 1, 1, 1,
-1.588802, 1.235984, 0.6388508, 1, 1, 1, 1, 1,
-1.586493, 1.169541, -1.031802, 1, 1, 1, 1, 1,
-1.562399, -0.8575574, -2.859293, 1, 1, 1, 1, 1,
-1.542978, -0.1846013, -0.5036753, 1, 1, 1, 1, 1,
-1.5382, 1.10249, -0.1112912, 0, 0, 1, 1, 1,
-1.532514, -1.702696, -0.8807962, 1, 0, 0, 1, 1,
-1.512192, 0.6309433, -1.133129, 1, 0, 0, 1, 1,
-1.502276, 2.406343, -0.4292283, 1, 0, 0, 1, 1,
-1.486367, -1.017506, -2.242208, 1, 0, 0, 1, 1,
-1.486104, 0.002796246, -2.353602, 1, 0, 0, 1, 1,
-1.480829, -0.07851887, -1.663458, 0, 0, 0, 1, 1,
-1.478588, 0.00774961, -0.8366289, 0, 0, 0, 1, 1,
-1.47608, 1.008727, -1.911456, 0, 0, 0, 1, 1,
-1.471823, -0.3057737, -1.138351, 0, 0, 0, 1, 1,
-1.471075, 0.08625492, -0.6247041, 0, 0, 0, 1, 1,
-1.461851, 0.07163243, -2.38965, 0, 0, 0, 1, 1,
-1.460321, 1.224697, -0.9554457, 0, 0, 0, 1, 1,
-1.455186, 0.6513894, -1.40989, 1, 1, 1, 1, 1,
-1.447676, -0.2171478, -3.249996, 1, 1, 1, 1, 1,
-1.437188, 0.4583134, -2.528761, 1, 1, 1, 1, 1,
-1.436711, 0.2652614, -4.142398, 1, 1, 1, 1, 1,
-1.433279, 0.2787188, -2.288539, 1, 1, 1, 1, 1,
-1.432591, -0.05623185, -1.617784, 1, 1, 1, 1, 1,
-1.422627, 1.175121, -0.8538335, 1, 1, 1, 1, 1,
-1.420126, 1.120927, -0.1996602, 1, 1, 1, 1, 1,
-1.413453, -1.309694, -2.110985, 1, 1, 1, 1, 1,
-1.408636, -0.8508498, -3.035783, 1, 1, 1, 1, 1,
-1.402549, -1.095234, -3.130046, 1, 1, 1, 1, 1,
-1.387458, -1.229448, -3.043536, 1, 1, 1, 1, 1,
-1.329986, -0.2860896, -1.139181, 1, 1, 1, 1, 1,
-1.320856, -1.017809, -2.210681, 1, 1, 1, 1, 1,
-1.3165, 1.606289, -0.6902704, 1, 1, 1, 1, 1,
-1.315189, -1.374835, -1.334602, 0, 0, 1, 1, 1,
-1.307784, 1.765477, -0.4096927, 1, 0, 0, 1, 1,
-1.294568, 0.3969219, -0.5003495, 1, 0, 0, 1, 1,
-1.288704, -1.04003, -2.43385, 1, 0, 0, 1, 1,
-1.28738, 2.250419, -0.3183354, 1, 0, 0, 1, 1,
-1.284616, -1.257264, -1.634708, 1, 0, 0, 1, 1,
-1.279504, -1.252966, -2.1906, 0, 0, 0, 1, 1,
-1.270725, 0.483103, -1.808743, 0, 0, 0, 1, 1,
-1.26405, -1.083364, -2.420135, 0, 0, 0, 1, 1,
-1.264011, 0.3340754, -2.089984, 0, 0, 0, 1, 1,
-1.258065, 0.3765369, -2.221852, 0, 0, 0, 1, 1,
-1.249719, 0.4931564, -0.9202764, 0, 0, 0, 1, 1,
-1.241342, 1.660288, -1.826438, 0, 0, 0, 1, 1,
-1.23948, 0.1082352, -0.4018493, 1, 1, 1, 1, 1,
-1.2265, -1.967385, -3.201209, 1, 1, 1, 1, 1,
-1.225966, -0.3166596, -3.081216, 1, 1, 1, 1, 1,
-1.222637, 0.2010993, -0.8228949, 1, 1, 1, 1, 1,
-1.207934, 1.819606, -0.533244, 1, 1, 1, 1, 1,
-1.205517, -0.0809355, -1.537733, 1, 1, 1, 1, 1,
-1.198819, 0.1226888, -1.385383, 1, 1, 1, 1, 1,
-1.198734, 0.904654, -0.9153818, 1, 1, 1, 1, 1,
-1.19537, 1.223802, -0.457848, 1, 1, 1, 1, 1,
-1.189724, -0.4824416, -1.275936, 1, 1, 1, 1, 1,
-1.188877, 0.5193129, 0.1470129, 1, 1, 1, 1, 1,
-1.186826, -1.641415, -4.243269, 1, 1, 1, 1, 1,
-1.181832, 0.6414498, 0.4380865, 1, 1, 1, 1, 1,
-1.180027, -0.4841008, -0.09347101, 1, 1, 1, 1, 1,
-1.179633, -0.3494056, -0.6957187, 1, 1, 1, 1, 1,
-1.169702, 0.1738701, -1.310893, 0, 0, 1, 1, 1,
-1.15965, -0.8697939, -2.474999, 1, 0, 0, 1, 1,
-1.152944, 0.8702037, -0.5029805, 1, 0, 0, 1, 1,
-1.147207, -0.1152196, -2.290491, 1, 0, 0, 1, 1,
-1.139626, 0.03974734, -3.449707, 1, 0, 0, 1, 1,
-1.133936, -0.2902756, -0.1772464, 1, 0, 0, 1, 1,
-1.119112, 0.5973453, -0.1478219, 0, 0, 0, 1, 1,
-1.11568, -0.6033719, -3.506518, 0, 0, 0, 1, 1,
-1.114957, 0.7187114, -0.7842502, 0, 0, 0, 1, 1,
-1.114199, -1.788714, -1.961327, 0, 0, 0, 1, 1,
-1.106513, -0.4093771, -0.710569, 0, 0, 0, 1, 1,
-1.105943, -0.7282529, -0.4616028, 0, 0, 0, 1, 1,
-1.101761, -0.7568889, -1.677566, 0, 0, 0, 1, 1,
-1.101389, -0.5649697, -1.345055, 1, 1, 1, 1, 1,
-1.099852, -0.4425588, -1.266639, 1, 1, 1, 1, 1,
-1.097296, -2.153637, -2.707965, 1, 1, 1, 1, 1,
-1.096769, -1.217171, -2.464874, 1, 1, 1, 1, 1,
-1.089119, 0.7515519, -3.157619, 1, 1, 1, 1, 1,
-1.081637, 0.5469483, 0.178273, 1, 1, 1, 1, 1,
-1.080619, 0.7615961, -0.3941574, 1, 1, 1, 1, 1,
-1.076399, 2.013431, 0.2804207, 1, 1, 1, 1, 1,
-1.074847, -0.460246, -0.5535533, 1, 1, 1, 1, 1,
-1.072049, 0.1005238, -0.2426498, 1, 1, 1, 1, 1,
-1.061765, 0.4420779, -1.695269, 1, 1, 1, 1, 1,
-1.051758, -0.8273856, -0.6091865, 1, 1, 1, 1, 1,
-1.051125, -1.058915, -1.921739, 1, 1, 1, 1, 1,
-1.05021, -0.978008, -1.813453, 1, 1, 1, 1, 1,
-1.044702, 0.5609855, -1.92805, 1, 1, 1, 1, 1,
-1.040996, -0.3295686, -2.661489, 0, 0, 1, 1, 1,
-1.035434, -1.556215, -3.225031, 1, 0, 0, 1, 1,
-1.031693, 1.705896, -1.103364, 1, 0, 0, 1, 1,
-1.030057, -0.7052293, -3.056998, 1, 0, 0, 1, 1,
-1.017642, -0.3643366, -2.261095, 1, 0, 0, 1, 1,
-1.014711, 1.043539, -1.124661, 1, 0, 0, 1, 1,
-1.01219, -1.867574, -2.439618, 0, 0, 0, 1, 1,
-1.0076, 0.1469426, -0.774071, 0, 0, 0, 1, 1,
-1.006639, 0.3724293, -0.65138, 0, 0, 0, 1, 1,
-0.9987173, 1.721732, 1.465517, 0, 0, 0, 1, 1,
-0.9977034, 0.9648196, 0.3471774, 0, 0, 0, 1, 1,
-0.9935211, -1.068354, -2.839146, 0, 0, 0, 1, 1,
-0.9913566, 0.4990383, 0.5231012, 0, 0, 0, 1, 1,
-0.9829493, 1.022859, 1.245516, 1, 1, 1, 1, 1,
-0.9827251, -0.3138204, -2.409932, 1, 1, 1, 1, 1,
-0.9770804, -2.235366, -2.647807, 1, 1, 1, 1, 1,
-0.9743378, 0.6434333, -0.9059462, 1, 1, 1, 1, 1,
-0.9737293, -2.112306, -1.343767, 1, 1, 1, 1, 1,
-0.9718986, 1.184994, -0.2002854, 1, 1, 1, 1, 1,
-0.9716452, 0.4444278, -0.2059095, 1, 1, 1, 1, 1,
-0.967241, -0.5800008, -4.984513, 1, 1, 1, 1, 1,
-0.9654375, 2.059235, -1.119416, 1, 1, 1, 1, 1,
-0.9637167, 1.314232, -1.00951, 1, 1, 1, 1, 1,
-0.9616236, -0.9408408, -2.31081, 1, 1, 1, 1, 1,
-0.9538645, 0.4056419, -3.321248, 1, 1, 1, 1, 1,
-0.9505074, -2.236256, -2.529695, 1, 1, 1, 1, 1,
-0.9460507, 0.4178807, -2.051864, 1, 1, 1, 1, 1,
-0.9438502, 0.9976883, 0.4385081, 1, 1, 1, 1, 1,
-0.9430614, 0.7243732, -1.080947, 0, 0, 1, 1, 1,
-0.9383217, 0.7943707, -0.4320151, 1, 0, 0, 1, 1,
-0.9366628, 0.08658586, -3.531359, 1, 0, 0, 1, 1,
-0.9313478, 1.667052, -1.146555, 1, 0, 0, 1, 1,
-0.925926, 1.053096, -0.4327627, 1, 0, 0, 1, 1,
-0.9255146, 0.5859071, 0.302077, 1, 0, 0, 1, 1,
-0.9214371, -0.559938, -2.024369, 0, 0, 0, 1, 1,
-0.9212899, -0.9463346, -0.06889517, 0, 0, 0, 1, 1,
-0.9209638, -0.746245, -3.377553, 0, 0, 0, 1, 1,
-0.9104546, -0.7525476, -2.928212, 0, 0, 0, 1, 1,
-0.9090316, -0.9150877, -2.179475, 0, 0, 0, 1, 1,
-0.9084888, -0.3157106, -0.7601674, 0, 0, 0, 1, 1,
-0.9043918, 1.048921, -1.377743, 0, 0, 0, 1, 1,
-0.9033322, 1.018654, -0.8469756, 1, 1, 1, 1, 1,
-0.8993788, -1.257253, -2.63248, 1, 1, 1, 1, 1,
-0.898103, 1.180279, -1.492115, 1, 1, 1, 1, 1,
-0.8972824, -0.6500913, -3.607503, 1, 1, 1, 1, 1,
-0.8897754, -0.01153849, -1.596742, 1, 1, 1, 1, 1,
-0.885444, 0.4209829, -1.356774, 1, 1, 1, 1, 1,
-0.8840382, -1.040274, -2.636375, 1, 1, 1, 1, 1,
-0.8816023, -0.644085, -0.9715787, 1, 1, 1, 1, 1,
-0.880652, 0.5139857, -0.7537768, 1, 1, 1, 1, 1,
-0.87778, 0.4425484, 0.321993, 1, 1, 1, 1, 1,
-0.8725244, -0.4239785, -1.204018, 1, 1, 1, 1, 1,
-0.8701777, -0.1185438, -0.7544315, 1, 1, 1, 1, 1,
-0.8701279, 2.145404, 0.2941852, 1, 1, 1, 1, 1,
-0.8679128, -0.1004256, -1.63766, 1, 1, 1, 1, 1,
-0.8617295, -1.277966, -1.684906, 1, 1, 1, 1, 1,
-0.8558385, 0.6154187, -1.251842, 0, 0, 1, 1, 1,
-0.8548723, 1.375652, -0.9690716, 1, 0, 0, 1, 1,
-0.8546349, -1.412451, -2.51962, 1, 0, 0, 1, 1,
-0.8539232, 0.09625984, -0.90463, 1, 0, 0, 1, 1,
-0.849049, -0.7601371, -3.310704, 1, 0, 0, 1, 1,
-0.840304, -0.2358426, -2.204946, 1, 0, 0, 1, 1,
-0.8305306, 1.270594, -1.333535, 0, 0, 0, 1, 1,
-0.8282496, -0.024281, -2.65648, 0, 0, 0, 1, 1,
-0.8226318, -1.330642, -2.789617, 0, 0, 0, 1, 1,
-0.8196194, 0.4443057, -1.277839, 0, 0, 0, 1, 1,
-0.8191206, 1.261231, 0.5136346, 0, 0, 0, 1, 1,
-0.8165701, 0.6400306, -1.224586, 0, 0, 0, 1, 1,
-0.813952, 0.9697958, -0.7154049, 0, 0, 0, 1, 1,
-0.807084, -0.2485502, -2.004813, 1, 1, 1, 1, 1,
-0.8034003, 0.3847216, -2.068318, 1, 1, 1, 1, 1,
-0.802197, -1.376231, -2.822969, 1, 1, 1, 1, 1,
-0.8014087, 0.5387039, -1.97544, 1, 1, 1, 1, 1,
-0.8014035, -1.034217, -2.420713, 1, 1, 1, 1, 1,
-0.8009475, 1.412436, -0.7391276, 1, 1, 1, 1, 1,
-0.7982237, -0.5562068, -1.952485, 1, 1, 1, 1, 1,
-0.7904473, 0.08218171, -1.128585, 1, 1, 1, 1, 1,
-0.7892151, -0.285102, -0.7745527, 1, 1, 1, 1, 1,
-0.7886102, -3.035641, -3.52714, 1, 1, 1, 1, 1,
-0.7861677, -0.2774969, -1.523437, 1, 1, 1, 1, 1,
-0.7838225, 0.1523615, -2.061527, 1, 1, 1, 1, 1,
-0.78304, 0.2798189, -1.245132, 1, 1, 1, 1, 1,
-0.7793117, -0.3859936, -1.922587, 1, 1, 1, 1, 1,
-0.7747205, -0.6016132, -1.771886, 1, 1, 1, 1, 1,
-0.7689539, 0.6956193, 0.7508415, 0, 0, 1, 1, 1,
-0.7686188, 0.8745695, -1.361536, 1, 0, 0, 1, 1,
-0.7667838, -1.805374, -2.811007, 1, 0, 0, 1, 1,
-0.7629945, 0.7383443, 0.2161222, 1, 0, 0, 1, 1,
-0.7525318, 1.143066, -1.191447, 1, 0, 0, 1, 1,
-0.7505504, -1.899395, -3.051994, 1, 0, 0, 1, 1,
-0.7491568, -1.07326, -5.0471, 0, 0, 0, 1, 1,
-0.7325954, -0.3986313, -1.382314, 0, 0, 0, 1, 1,
-0.7274467, -0.5144664, -1.39391, 0, 0, 0, 1, 1,
-0.7260236, 1.093634, 1.579096, 0, 0, 0, 1, 1,
-0.7220573, 0.4399735, -0.7273754, 0, 0, 0, 1, 1,
-0.7174435, 0.06107625, -1.81703, 0, 0, 0, 1, 1,
-0.7150642, 0.9448206, -0.8079814, 0, 0, 0, 1, 1,
-0.7117094, -2.175822, -3.494032, 1, 1, 1, 1, 1,
-0.7117001, 0.4672952, -0.322912, 1, 1, 1, 1, 1,
-0.7107891, 1.146039, -0.163223, 1, 1, 1, 1, 1,
-0.7088897, 0.02212163, -3.17345, 1, 1, 1, 1, 1,
-0.7017587, -2.056522, -2.498392, 1, 1, 1, 1, 1,
-0.7008769, -1.511585, -1.259276, 1, 1, 1, 1, 1,
-0.6949865, 1.721662, -0.7589057, 1, 1, 1, 1, 1,
-0.6937603, 0.09831525, -1.781109, 1, 1, 1, 1, 1,
-0.6923469, 0.4021914, -0.138433, 1, 1, 1, 1, 1,
-0.6905712, -0.1222279, -2.4417, 1, 1, 1, 1, 1,
-0.6877437, -1.974392, -2.331189, 1, 1, 1, 1, 1,
-0.6871179, -0.2168291, -2.389678, 1, 1, 1, 1, 1,
-0.6855729, -0.436256, -2.189957, 1, 1, 1, 1, 1,
-0.6787516, 0.3030497, -0.7260938, 1, 1, 1, 1, 1,
-0.6777996, -1.102223, -1.796502, 1, 1, 1, 1, 1,
-0.6709507, 0.1648385, -0.8809724, 0, 0, 1, 1, 1,
-0.6692821, 0.8293816, -1.351552, 1, 0, 0, 1, 1,
-0.6676992, 0.1261041, 0.2558687, 1, 0, 0, 1, 1,
-0.6676169, 0.01497628, -1.550284, 1, 0, 0, 1, 1,
-0.6626015, -0.6579995, -2.635077, 1, 0, 0, 1, 1,
-0.6581123, 1.181455, -0.4424689, 1, 0, 0, 1, 1,
-0.6578315, 0.6842496, -1.795547, 0, 0, 0, 1, 1,
-0.6541041, 0.2315428, -0.06211741, 0, 0, 0, 1, 1,
-0.6532036, 0.1091341, -0.6625495, 0, 0, 0, 1, 1,
-0.6493138, 0.957835, 0.8785305, 0, 0, 0, 1, 1,
-0.6491951, -2.553436, -2.037861, 0, 0, 0, 1, 1,
-0.644164, -0.585787, -2.597767, 0, 0, 0, 1, 1,
-0.6414289, -0.3257515, 0.2889453, 0, 0, 0, 1, 1,
-0.6390816, 0.805892, -1.991889, 1, 1, 1, 1, 1,
-0.6335775, -0.4747388, -2.76939, 1, 1, 1, 1, 1,
-0.6276754, -0.7389444, -0.9472858, 1, 1, 1, 1, 1,
-0.6235895, 1.840046, -0.4903356, 1, 1, 1, 1, 1,
-0.6222665, 0.8804574, 0.4823729, 1, 1, 1, 1, 1,
-0.6155837, 1.124991, -2.728044, 1, 1, 1, 1, 1,
-0.6139986, 1.859466, 2.079853, 1, 1, 1, 1, 1,
-0.6136444, 0.5068353, -2.211827, 1, 1, 1, 1, 1,
-0.6073794, 1.366159, 0.1036014, 1, 1, 1, 1, 1,
-0.5966391, 1.116641, 0.3074431, 1, 1, 1, 1, 1,
-0.5942174, 1.044326, -1.593493, 1, 1, 1, 1, 1,
-0.5892131, -1.723085, -2.012213, 1, 1, 1, 1, 1,
-0.5891572, -0.839237, -3.227024, 1, 1, 1, 1, 1,
-0.5819952, -0.6102573, -1.49597, 1, 1, 1, 1, 1,
-0.5793225, -0.7294854, -3.672165, 1, 1, 1, 1, 1,
-0.5744813, 1.576512, 0.9445734, 0, 0, 1, 1, 1,
-0.5715716, 0.9684631, -1.990569, 1, 0, 0, 1, 1,
-0.5666642, 0.1770125, -1.685021, 1, 0, 0, 1, 1,
-0.5645211, -0.9562577, -2.159497, 1, 0, 0, 1, 1,
-0.5627148, -1.155401, -2.922799, 1, 0, 0, 1, 1,
-0.5614754, -0.309445, -2.242234, 1, 0, 0, 1, 1,
-0.5600505, 0.5635662, -0.1214535, 0, 0, 0, 1, 1,
-0.5599081, 1.042582, -0.7370493, 0, 0, 0, 1, 1,
-0.5539403, 0.5874785, -0.3440519, 0, 0, 0, 1, 1,
-0.5477363, -1.305785, -1.331418, 0, 0, 0, 1, 1,
-0.5471684, 1.720884, -1.226772, 0, 0, 0, 1, 1,
-0.5466672, 2.084459, -0.3112084, 0, 0, 0, 1, 1,
-0.5460808, -0.07366768, -0.1939452, 0, 0, 0, 1, 1,
-0.5448684, 3.282363, 0.7197176, 1, 1, 1, 1, 1,
-0.5425771, 0.7441632, -1.113451, 1, 1, 1, 1, 1,
-0.5295172, 1.178519, -0.3918422, 1, 1, 1, 1, 1,
-0.5258797, 0.8336094, 0.5439755, 1, 1, 1, 1, 1,
-0.5255865, 0.7562227, -0.3438858, 1, 1, 1, 1, 1,
-0.5219641, 0.8859586, -0.2344625, 1, 1, 1, 1, 1,
-0.5203478, 0.523702, -1.080742, 1, 1, 1, 1, 1,
-0.5189331, 0.9779913, -0.1680285, 1, 1, 1, 1, 1,
-0.5136609, 1.512902, 0.4498407, 1, 1, 1, 1, 1,
-0.5134088, 0.2247867, -0.5149686, 1, 1, 1, 1, 1,
-0.507386, 0.7567849, -1.217531, 1, 1, 1, 1, 1,
-0.4979599, -1.716635, -2.394263, 1, 1, 1, 1, 1,
-0.4966426, 0.1023265, -2.179043, 1, 1, 1, 1, 1,
-0.4879714, -0.8357262, -4.858055, 1, 1, 1, 1, 1,
-0.4871333, 1.306317, 0.3488459, 1, 1, 1, 1, 1,
-0.486884, -0.5303211, -2.039354, 0, 0, 1, 1, 1,
-0.4840494, 0.2991344, -0.94944, 1, 0, 0, 1, 1,
-0.4830876, -1.335532, -3.394998, 1, 0, 0, 1, 1,
-0.483002, -0.1706921, -1.435338, 1, 0, 0, 1, 1,
-0.4772092, -1.856152, -3.755261, 1, 0, 0, 1, 1,
-0.4763326, -0.03231576, -1.701458, 1, 0, 0, 1, 1,
-0.4729451, -0.3715521, -1.672959, 0, 0, 0, 1, 1,
-0.4725251, 0.7457056, 0.9517878, 0, 0, 0, 1, 1,
-0.4720172, 0.5010117, -2.768954, 0, 0, 0, 1, 1,
-0.4696234, -0.1433626, -3.08454, 0, 0, 0, 1, 1,
-0.4655783, 0.297344, 0.1849173, 0, 0, 0, 1, 1,
-0.4600402, 0.933315, -0.9922976, 0, 0, 0, 1, 1,
-0.4533807, 0.9077561, 1.041006, 0, 0, 0, 1, 1,
-0.4508367, -0.07459028, -1.851279, 1, 1, 1, 1, 1,
-0.4459904, 1.709407, -1.29756, 1, 1, 1, 1, 1,
-0.444415, 0.2731915, 0.8802873, 1, 1, 1, 1, 1,
-0.4396759, -0.6026959, -2.721895, 1, 1, 1, 1, 1,
-0.4307513, -0.9266884, -2.805227, 1, 1, 1, 1, 1,
-0.4294261, -0.6000971, -1.697478, 1, 1, 1, 1, 1,
-0.4268952, 0.426798, -2.088143, 1, 1, 1, 1, 1,
-0.4215859, -0.6932605, -1.455269, 1, 1, 1, 1, 1,
-0.4196325, 0.6795738, 0.6762933, 1, 1, 1, 1, 1,
-0.4157113, -1.409441, -4.156293, 1, 1, 1, 1, 1,
-0.4137444, -0.04794873, -3.357501, 1, 1, 1, 1, 1,
-0.406333, -0.6392606, -1.245455, 1, 1, 1, 1, 1,
-0.4037738, -0.4915305, -2.425261, 1, 1, 1, 1, 1,
-0.4033021, -1.443247, -4.693201, 1, 1, 1, 1, 1,
-0.4023643, -1.276328, -2.476534, 1, 1, 1, 1, 1,
-0.3985514, 0.09185739, -1.294107, 0, 0, 1, 1, 1,
-0.3943242, 0.5290352, -0.5983436, 1, 0, 0, 1, 1,
-0.3847844, 0.0431046, -2.102626, 1, 0, 0, 1, 1,
-0.3787234, -0.6131558, -1.896278, 1, 0, 0, 1, 1,
-0.3780845, -0.1694676, -1.633174, 1, 0, 0, 1, 1,
-0.369004, -1.297869, -1.148555, 1, 0, 0, 1, 1,
-0.36889, -0.1560482, -2.05397, 0, 0, 0, 1, 1,
-0.3663559, -0.01829344, -3.413125, 0, 0, 0, 1, 1,
-0.3629273, 0.1790735, -0.8363172, 0, 0, 0, 1, 1,
-0.3626367, 0.2535796, -1.885411, 0, 0, 0, 1, 1,
-0.3586012, -1.46989, -3.239036, 0, 0, 0, 1, 1,
-0.3472693, 0.3623291, -2.107798, 0, 0, 0, 1, 1,
-0.3470207, 1.729255, 1.080029, 0, 0, 0, 1, 1,
-0.3435335, 0.3063095, -0.580792, 1, 1, 1, 1, 1,
-0.3421948, 1.254437, 0.9353856, 1, 1, 1, 1, 1,
-0.3416652, -1.80322, -3.803141, 1, 1, 1, 1, 1,
-0.3401893, 0.6223905, 0.6673682, 1, 1, 1, 1, 1,
-0.3399738, -0.299394, -3.017026, 1, 1, 1, 1, 1,
-0.3326793, 1.353958, 0.3578913, 1, 1, 1, 1, 1,
-0.3230692, 0.6196442, -0.343536, 1, 1, 1, 1, 1,
-0.3191141, -1.197379, -5.928169, 1, 1, 1, 1, 1,
-0.3186177, -1.481425, -2.730295, 1, 1, 1, 1, 1,
-0.3183497, 1.23317, 1.860757, 1, 1, 1, 1, 1,
-0.3177847, -0.8474824, -4.133183, 1, 1, 1, 1, 1,
-0.3163228, 0.8751, -0.7480834, 1, 1, 1, 1, 1,
-0.3152467, -1.048969, -1.884109, 1, 1, 1, 1, 1,
-0.3127371, -0.4025441, -2.638289, 1, 1, 1, 1, 1,
-0.3102297, 0.8491278, 0.5215886, 1, 1, 1, 1, 1,
-0.3036026, -0.4020809, -2.533275, 0, 0, 1, 1, 1,
-0.3028439, 1.747829, 1.589006, 1, 0, 0, 1, 1,
-0.3027683, 0.6611791, 0.539035, 1, 0, 0, 1, 1,
-0.2983355, 0.9339616, 0.2778556, 1, 0, 0, 1, 1,
-0.2977808, -1.211479, -1.237296, 1, 0, 0, 1, 1,
-0.2940726, -0.2239255, -2.320089, 1, 0, 0, 1, 1,
-0.2920583, 0.7893795, -0.6325425, 0, 0, 0, 1, 1,
-0.2916365, -0.5571482, -2.032315, 0, 0, 0, 1, 1,
-0.2913076, -1.062932, -3.063933, 0, 0, 0, 1, 1,
-0.2910409, -0.3840336, -3.418034, 0, 0, 0, 1, 1,
-0.2901287, 1.782298, -0.3128808, 0, 0, 0, 1, 1,
-0.2846723, -1.69981, -3.433624, 0, 0, 0, 1, 1,
-0.2825947, 0.5443876, -0.1371977, 0, 0, 0, 1, 1,
-0.2769325, -1.110959, -2.970336, 1, 1, 1, 1, 1,
-0.274767, -0.2142243, -2.300313, 1, 1, 1, 1, 1,
-0.2747348, -1.925313, -1.836796, 1, 1, 1, 1, 1,
-0.2690981, -1.486291, -3.589014, 1, 1, 1, 1, 1,
-0.2664665, 0.2217617, -0.3018, 1, 1, 1, 1, 1,
-0.2610168, -0.2503952, -2.622583, 1, 1, 1, 1, 1,
-0.2610113, 0.9154377, 0.9592999, 1, 1, 1, 1, 1,
-0.2575308, -1.549271, -3.170804, 1, 1, 1, 1, 1,
-0.257249, 0.333482, -0.5569144, 1, 1, 1, 1, 1,
-0.2562537, 0.8395572, 0.5523902, 1, 1, 1, 1, 1,
-0.254695, 1.244142, -1.467756, 1, 1, 1, 1, 1,
-0.2541629, -0.0420078, -3.886391, 1, 1, 1, 1, 1,
-0.2524152, 0.4344813, -1.06937, 1, 1, 1, 1, 1,
-0.2511623, 0.1082537, -1.290078, 1, 1, 1, 1, 1,
-0.2494542, 0.8881748, -1.78512, 1, 1, 1, 1, 1,
-0.2493771, -0.04745587, -1.043957, 0, 0, 1, 1, 1,
-0.2492274, -1.139915, -3.951554, 1, 0, 0, 1, 1,
-0.2489009, 0.9707012, 1.440112, 1, 0, 0, 1, 1,
-0.2486505, -2.00528, -3.271236, 1, 0, 0, 1, 1,
-0.2476206, -0.5729271, -1.911567, 1, 0, 0, 1, 1,
-0.2469386, 0.4875967, 0.3601625, 1, 0, 0, 1, 1,
-0.2415773, 1.109017, -1.459487, 0, 0, 0, 1, 1,
-0.2367813, -1.061625, -3.322373, 0, 0, 0, 1, 1,
-0.2362076, -0.7805405, -2.347582, 0, 0, 0, 1, 1,
-0.2241675, 0.5053452, 0.2081209, 0, 0, 0, 1, 1,
-0.223561, 0.04137192, -3.504369, 0, 0, 0, 1, 1,
-0.2186906, 0.897588, 0.6424494, 0, 0, 0, 1, 1,
-0.2180427, -0.853357, -1.024344, 0, 0, 0, 1, 1,
-0.2161745, -2.1786, -4.286409, 1, 1, 1, 1, 1,
-0.2157504, -0.6738904, -2.995297, 1, 1, 1, 1, 1,
-0.2129464, 0.6835929, -2.113792, 1, 1, 1, 1, 1,
-0.2073687, 1.894546, 0.1095962, 1, 1, 1, 1, 1,
-0.2072407, -0.396892, -4.481813, 1, 1, 1, 1, 1,
-0.2068566, -0.2899415, -3.337494, 1, 1, 1, 1, 1,
-0.2068524, -0.2025595, -4.105485, 1, 1, 1, 1, 1,
-0.2020332, -2.094942, -2.455394, 1, 1, 1, 1, 1,
-0.1961333, 0.03739594, -0.8390706, 1, 1, 1, 1, 1,
-0.1960876, -1.605253, -2.388815, 1, 1, 1, 1, 1,
-0.1927292, -1.273218, -1.676194, 1, 1, 1, 1, 1,
-0.1923162, -0.8954346, -3.764211, 1, 1, 1, 1, 1,
-0.1922367, 2.813892, 0.4027016, 1, 1, 1, 1, 1,
-0.1915541, 0.5417018, 0.5541475, 1, 1, 1, 1, 1,
-0.1882118, -0.2335363, -3.059916, 1, 1, 1, 1, 1,
-0.1863444, -2.430263, -2.988413, 0, 0, 1, 1, 1,
-0.1838866, -0.6371712, -3.169164, 1, 0, 0, 1, 1,
-0.1746659, 0.3157504, 0.4084911, 1, 0, 0, 1, 1,
-0.1722244, 0.2687262, 0.1390339, 1, 0, 0, 1, 1,
-0.1710971, 0.02952851, -1.677369, 1, 0, 0, 1, 1,
-0.1670143, -0.482114, -2.413313, 1, 0, 0, 1, 1,
-0.1609825, -0.08364034, -3.802763, 0, 0, 0, 1, 1,
-0.16077, 0.06248544, -2.680156, 0, 0, 0, 1, 1,
-0.1597358, 1.304408, 2.70413, 0, 0, 0, 1, 1,
-0.1583326, -0.993173, -3.598319, 0, 0, 0, 1, 1,
-0.1557703, -1.503138, -2.013288, 0, 0, 0, 1, 1,
-0.1514872, -0.03514111, -1.191838, 0, 0, 0, 1, 1,
-0.1469917, 0.02855247, -0.6424335, 0, 0, 0, 1, 1,
-0.1452209, 1.258124, -0.2598976, 1, 1, 1, 1, 1,
-0.143587, -1.311522, -1.470741, 1, 1, 1, 1, 1,
-0.1390775, -2.208791, -3.383982, 1, 1, 1, 1, 1,
-0.1353478, -0.01158614, -1.285874, 1, 1, 1, 1, 1,
-0.1337503, -0.613369, -2.47739, 1, 1, 1, 1, 1,
-0.1335649, 0.06692816, -2.566369, 1, 1, 1, 1, 1,
-0.1329972, -0.1052993, -3.62235, 1, 1, 1, 1, 1,
-0.1320158, -0.1479943, -0.9109755, 1, 1, 1, 1, 1,
-0.1318985, 0.09977859, -0.7983232, 1, 1, 1, 1, 1,
-0.1297967, -1.141565, -4.644103, 1, 1, 1, 1, 1,
-0.1290515, 0.5917027, 0.1424882, 1, 1, 1, 1, 1,
-0.1281916, 0.7192219, -0.04889417, 1, 1, 1, 1, 1,
-0.1277866, 0.9278644, 0.8784516, 1, 1, 1, 1, 1,
-0.1244995, 1.343622, -1.46228, 1, 1, 1, 1, 1,
-0.1214422, -1.614216, -3.064078, 1, 1, 1, 1, 1,
-0.1188374, -0.0745781, -2.461217, 0, 0, 1, 1, 1,
-0.1167612, -0.6334798, -3.796257, 1, 0, 0, 1, 1,
-0.1164617, 0.9013648, -1.5267, 1, 0, 0, 1, 1,
-0.11537, -0.9891788, -4.498798, 1, 0, 0, 1, 1,
-0.1147153, 0.4273951, 0.1966593, 1, 0, 0, 1, 1,
-0.105327, 1.246182, -0.424353, 1, 0, 0, 1, 1,
-0.1050154, -1.549403, -2.067722, 0, 0, 0, 1, 1,
-0.1050105, 0.1900091, 1.53231, 0, 0, 0, 1, 1,
-0.09918676, 1.997517, 0.2533526, 0, 0, 0, 1, 1,
-0.09823675, 1.135684, -1.14571, 0, 0, 0, 1, 1,
-0.09635442, 0.5915628, 0.374948, 0, 0, 0, 1, 1,
-0.09181169, 0.8021007, -0.7681888, 0, 0, 0, 1, 1,
-0.09091018, 0.4202656, 0.1809105, 0, 0, 0, 1, 1,
-0.08783393, 0.1857285, -0.3971137, 1, 1, 1, 1, 1,
-0.08673817, 0.6446877, 0.554278, 1, 1, 1, 1, 1,
-0.08499145, -1.116638, -3.017329, 1, 1, 1, 1, 1,
-0.08461957, -2.331938, -3.201672, 1, 1, 1, 1, 1,
-0.08178652, 0.5984167, -0.05317018, 1, 1, 1, 1, 1,
-0.08039971, 0.5783607, -0.03913851, 1, 1, 1, 1, 1,
-0.0800155, -0.7310864, -3.032901, 1, 1, 1, 1, 1,
-0.07808265, 2.115117, 0.5954924, 1, 1, 1, 1, 1,
-0.07744181, -1.028788, -2.907047, 1, 1, 1, 1, 1,
-0.07488476, -0.3399202, -1.110402, 1, 1, 1, 1, 1,
-0.0744739, 1.676272, 0.5921721, 1, 1, 1, 1, 1,
-0.07396638, -1.147573, -2.727041, 1, 1, 1, 1, 1,
-0.07273725, -0.3322196, -1.739235, 1, 1, 1, 1, 1,
-0.07251671, 0.1024398, -1.040935, 1, 1, 1, 1, 1,
-0.07148591, -0.9088623, -2.829659, 1, 1, 1, 1, 1,
-0.06458541, 0.5256349, -0.4685643, 0, 0, 1, 1, 1,
-0.06377659, 0.2072505, -1.114557, 1, 0, 0, 1, 1,
-0.06280273, -0.8685651, -2.62185, 1, 0, 0, 1, 1,
-0.06232771, 1.046276, 0.5230181, 1, 0, 0, 1, 1,
-0.05850875, -0.8322165, -2.622868, 1, 0, 0, 1, 1,
-0.05695414, -0.8812724, -3.177889, 1, 0, 0, 1, 1,
-0.05232497, 0.08267509, -0.359434, 0, 0, 0, 1, 1,
-0.04975517, 0.5040365, 1.036494, 0, 0, 0, 1, 1,
-0.04384668, 1.569162, 0.1771279, 0, 0, 0, 1, 1,
-0.0437505, -0.2065231, -3.898668, 0, 0, 0, 1, 1,
-0.04027845, 0.2221673, 1.500915, 0, 0, 0, 1, 1,
-0.02850103, 0.671882, -1.231702, 0, 0, 0, 1, 1,
-0.02639866, -1.004857, -1.642323, 0, 0, 0, 1, 1,
-0.02584785, 0.5307271, 0.418637, 1, 1, 1, 1, 1,
-0.02451394, 2.868452, 0.8602703, 1, 1, 1, 1, 1,
-0.02300476, 0.6737732, 0.7518933, 1, 1, 1, 1, 1,
-0.02173355, -2.763031, -3.963553, 1, 1, 1, 1, 1,
-0.01833858, -0.3668187, -2.584801, 1, 1, 1, 1, 1,
-0.01733636, -0.4140182, -2.462033, 1, 1, 1, 1, 1,
-0.01123662, 1.103122, 0.2402238, 1, 1, 1, 1, 1,
-0.009622092, -0.4829268, -3.733505, 1, 1, 1, 1, 1,
-0.008275517, 0.3185382, -0.8866969, 1, 1, 1, 1, 1,
-0.007727537, -0.845857, -4.223885, 1, 1, 1, 1, 1,
-0.00267027, -0.0007878939, -2.536646, 1, 1, 1, 1, 1,
-0.0006224848, 0.6660778, -0.1924923, 1, 1, 1, 1, 1,
0.00288785, 0.8704787, -0.4622875, 1, 1, 1, 1, 1,
0.003794382, 2.442827, -0.1943413, 1, 1, 1, 1, 1,
0.009762498, -0.5261707, 2.914569, 1, 1, 1, 1, 1,
0.01022389, -1.11613, 2.964001, 0, 0, 1, 1, 1,
0.01521645, -1.242572, 3.868897, 1, 0, 0, 1, 1,
0.01575848, -0.9444521, 3.266499, 1, 0, 0, 1, 1,
0.01766954, 0.5815374, 1.423573, 1, 0, 0, 1, 1,
0.01928784, -0.8344584, 3.246398, 1, 0, 0, 1, 1,
0.01999759, 1.482955, 1.1225, 1, 0, 0, 1, 1,
0.02097979, -1.458624, 3.064882, 0, 0, 0, 1, 1,
0.02216348, -0.3172815, 4.364769, 0, 0, 0, 1, 1,
0.02232187, -1.250352, 4.089839, 0, 0, 0, 1, 1,
0.022639, 1.028734, -1.398879, 0, 0, 0, 1, 1,
0.02367535, 0.9581292, -0.3337031, 0, 0, 0, 1, 1,
0.03004783, -0.02023765, 2.488329, 0, 0, 0, 1, 1,
0.03112652, -0.4758356, 1.517274, 0, 0, 0, 1, 1,
0.0321039, 0.9103882, 0.4271471, 1, 1, 1, 1, 1,
0.03401206, 0.07988512, 0.418042, 1, 1, 1, 1, 1,
0.03410453, -0.1845717, 5.473252, 1, 1, 1, 1, 1,
0.03586343, -0.1343346, 2.636892, 1, 1, 1, 1, 1,
0.03654777, 0.5873479, 0.3312227, 1, 1, 1, 1, 1,
0.03859672, -0.07537541, 2.520047, 1, 1, 1, 1, 1,
0.04532469, 0.4919059, 1.587744, 1, 1, 1, 1, 1,
0.04563709, 0.7250944, -1.308464, 1, 1, 1, 1, 1,
0.04712031, -0.7749816, 3.287085, 1, 1, 1, 1, 1,
0.05004141, -0.542833, 3.592472, 1, 1, 1, 1, 1,
0.0523012, -1.044308, 3.570686, 1, 1, 1, 1, 1,
0.05389218, 0.4119969, -1.949861, 1, 1, 1, 1, 1,
0.05423583, -0.6137117, 1.983414, 1, 1, 1, 1, 1,
0.05804067, 0.1110708, 2.018529, 1, 1, 1, 1, 1,
0.06463972, -1.216732, 2.168647, 1, 1, 1, 1, 1,
0.06551789, 0.6705479, -2.367351, 0, 0, 1, 1, 1,
0.07200745, 1.022879, -0.7518494, 1, 0, 0, 1, 1,
0.0735243, 0.5326291, -1.700727, 1, 0, 0, 1, 1,
0.07372525, -0.5723754, 3.20708, 1, 0, 0, 1, 1,
0.07648002, 0.3908412, 2.539818, 1, 0, 0, 1, 1,
0.07883016, 1.043989, 0.9593323, 1, 0, 0, 1, 1,
0.07940808, 0.3752076, 1.638314, 0, 0, 0, 1, 1,
0.08282368, 0.04396471, 1.405984, 0, 0, 0, 1, 1,
0.08411749, -1.029201, 2.93115, 0, 0, 0, 1, 1,
0.08601926, -0.2330001, 2.758694, 0, 0, 0, 1, 1,
0.08885874, 1.087395, 0.7593226, 0, 0, 0, 1, 1,
0.09058356, 0.1959023, 1.36493, 0, 0, 0, 1, 1,
0.09644318, 0.8888002, -0.01332352, 0, 0, 0, 1, 1,
0.09759558, -0.4391958, 2.643573, 1, 1, 1, 1, 1,
0.1023691, 0.09665678, 0.7563094, 1, 1, 1, 1, 1,
0.1048493, 3.420876, 0.03154205, 1, 1, 1, 1, 1,
0.1159718, 2.299458, 1.36243, 1, 1, 1, 1, 1,
0.1165659, 0.3645475, 0.2212448, 1, 1, 1, 1, 1,
0.1213443, -0.686843, 4.814023, 1, 1, 1, 1, 1,
0.1251476, -0.3097011, 3.456203, 1, 1, 1, 1, 1,
0.1269578, -2.676035, 3.784863, 1, 1, 1, 1, 1,
0.1283431, -1.366432, 1.529047, 1, 1, 1, 1, 1,
0.1289879, -0.1953049, 1.410612, 1, 1, 1, 1, 1,
0.129788, 1.034232, 0.08662707, 1, 1, 1, 1, 1,
0.1345891, -0.305531, 2.455945, 1, 1, 1, 1, 1,
0.1421266, -0.9032322, 1.778836, 1, 1, 1, 1, 1,
0.1429327, 0.8530719, -0.2002711, 1, 1, 1, 1, 1,
0.1429374, -1.373433, 4.566014, 1, 1, 1, 1, 1,
0.1432214, 0.2225566, 0.6900331, 0, 0, 1, 1, 1,
0.1449279, 0.8997648, 0.3781986, 1, 0, 0, 1, 1,
0.1467911, 0.08056811, 0.1549082, 1, 0, 0, 1, 1,
0.1472678, -0.4137762, 3.786931, 1, 0, 0, 1, 1,
0.1475487, 0.5575678, 0.8195989, 1, 0, 0, 1, 1,
0.1501233, -1.601756, 3.939069, 1, 0, 0, 1, 1,
0.1527974, -0.1054484, 2.655712, 0, 0, 0, 1, 1,
0.155315, -0.07231927, 2.972461, 0, 0, 0, 1, 1,
0.157763, -0.06313623, 1.097383, 0, 0, 0, 1, 1,
0.1608915, 0.5096378, -0.02622982, 0, 0, 0, 1, 1,
0.1624268, -1.847641, 3.447058, 0, 0, 0, 1, 1,
0.1636815, 0.1291968, 0.618152, 0, 0, 0, 1, 1,
0.1665718, 0.2476982, 0.1231048, 0, 0, 0, 1, 1,
0.1719162, -0.2839148, 3.621439, 1, 1, 1, 1, 1,
0.1720187, -0.4841545, 4.441019, 1, 1, 1, 1, 1,
0.1743671, -0.8440649, 2.966933, 1, 1, 1, 1, 1,
0.1757854, 1.256342, 1.001115, 1, 1, 1, 1, 1,
0.1776913, -2.333876, 1.673051, 1, 1, 1, 1, 1,
0.1809745, 0.2100104, 0.2182016, 1, 1, 1, 1, 1,
0.1822485, -0.4820681, 2.598264, 1, 1, 1, 1, 1,
0.1844478, -0.8598033, 4.308368, 1, 1, 1, 1, 1,
0.184894, 0.1111005, 0.6354268, 1, 1, 1, 1, 1,
0.1871129, -0.1341498, 2.203194, 1, 1, 1, 1, 1,
0.1905543, 0.1841359, 2.005617, 1, 1, 1, 1, 1,
0.1926709, 1.00047, -0.5837454, 1, 1, 1, 1, 1,
0.1936579, 0.6535615, 2.87394, 1, 1, 1, 1, 1,
0.1940601, -1.415341, 3.823319, 1, 1, 1, 1, 1,
0.1962974, 2.517961, -0.2319777, 1, 1, 1, 1, 1,
0.1964976, -1.71812, 3.965716, 0, 0, 1, 1, 1,
0.1966871, 0.8156544, 0.7035457, 1, 0, 0, 1, 1,
0.1989978, 0.1641955, 0.2868831, 1, 0, 0, 1, 1,
0.2051652, -0.01651154, 1.095383, 1, 0, 0, 1, 1,
0.2052459, -0.9746025, 2.315256, 1, 0, 0, 1, 1,
0.2082672, 0.8075813, 0.5874453, 1, 0, 0, 1, 1,
0.2151879, -2.046134, 3.514882, 0, 0, 0, 1, 1,
0.2183508, -0.5424322, 2.710089, 0, 0, 0, 1, 1,
0.2209581, 2.286986, -1.826405, 0, 0, 0, 1, 1,
0.2210454, 0.7736949, -0.5154705, 0, 0, 0, 1, 1,
0.2231747, -0.8052314, 3.347027, 0, 0, 0, 1, 1,
0.225754, -0.957527, 2.494117, 0, 0, 0, 1, 1,
0.2264652, -0.5420365, 1.42451, 0, 0, 0, 1, 1,
0.2265145, -0.5523738, 2.852817, 1, 1, 1, 1, 1,
0.229063, -0.4574503, 1.750197, 1, 1, 1, 1, 1,
0.2336796, 0.9647498, 0.04236882, 1, 1, 1, 1, 1,
0.2374256, 1.398354, 1.012133, 1, 1, 1, 1, 1,
0.2387468, 0.4921337, 0.9422137, 1, 1, 1, 1, 1,
0.2393079, -0.1180832, 1.722206, 1, 1, 1, 1, 1,
0.2425058, -0.3627467, 1.834932, 1, 1, 1, 1, 1,
0.2432778, 0.1909313, -0.2305814, 1, 1, 1, 1, 1,
0.2463846, 0.07824862, 0.6657761, 1, 1, 1, 1, 1,
0.2506358, 0.1637965, 1.765269, 1, 1, 1, 1, 1,
0.257724, -1.393662, 1.317537, 1, 1, 1, 1, 1,
0.2655723, -1.788429, 3.676714, 1, 1, 1, 1, 1,
0.2666783, 1.172779, 0.2740658, 1, 1, 1, 1, 1,
0.2668378, -0.6279296, 1.315089, 1, 1, 1, 1, 1,
0.2671872, 0.6752698, 1.702757, 1, 1, 1, 1, 1,
0.2681365, 0.0228331, 2.320825, 0, 0, 1, 1, 1,
0.2688243, 0.6807256, 0.9350879, 1, 0, 0, 1, 1,
0.280801, 1.662703, 2.580403, 1, 0, 0, 1, 1,
0.2868696, 0.6966958, 2.1939, 1, 0, 0, 1, 1,
0.2914414, 1.429223, -0.1031523, 1, 0, 0, 1, 1,
0.2944842, -1.362185, 2.248824, 1, 0, 0, 1, 1,
0.2955365, 0.680484, 1.134716, 0, 0, 0, 1, 1,
0.2985501, -0.02118636, 1.6279, 0, 0, 0, 1, 1,
0.3064835, -0.4147925, 3.191438, 0, 0, 0, 1, 1,
0.3098772, 1.031611, -0.6725811, 0, 0, 0, 1, 1,
0.3113387, 1.247972, 0.6014568, 0, 0, 0, 1, 1,
0.3116344, 0.8275279, 0.7230133, 0, 0, 0, 1, 1,
0.31455, 1.715812, -1.169276, 0, 0, 0, 1, 1,
0.3160711, -0.3535458, 2.629148, 1, 1, 1, 1, 1,
0.318983, -1.43811, 3.46633, 1, 1, 1, 1, 1,
0.3204706, 0.3203815, 1.871385, 1, 1, 1, 1, 1,
0.3239811, -0.4512789, 4.176632, 1, 1, 1, 1, 1,
0.325376, 2.892789, 1.385355, 1, 1, 1, 1, 1,
0.3300234, 0.1702441, 2.142417, 1, 1, 1, 1, 1,
0.3427563, 0.3298285, 0.9133502, 1, 1, 1, 1, 1,
0.344313, -0.1013794, 4.217793, 1, 1, 1, 1, 1,
0.3527102, -0.6995466, 1.765328, 1, 1, 1, 1, 1,
0.3535159, 0.919896, -0.4529776, 1, 1, 1, 1, 1,
0.3569633, -0.9214423, 0.9758595, 1, 1, 1, 1, 1,
0.3571621, -1.258307, 3.588615, 1, 1, 1, 1, 1,
0.3575947, 0.1785501, 1.465652, 1, 1, 1, 1, 1,
0.3590593, 0.6158522, 1.801373, 1, 1, 1, 1, 1,
0.3680629, 0.8812624, -0.3863002, 1, 1, 1, 1, 1,
0.3707711, -1.09434, 0.5444142, 0, 0, 1, 1, 1,
0.3754452, 1.191338, -1.323059, 1, 0, 0, 1, 1,
0.376073, 0.6712296, 0.4998877, 1, 0, 0, 1, 1,
0.3838362, 0.3318088, 0.3674827, 1, 0, 0, 1, 1,
0.3864144, -0.7946265, 3.358899, 1, 0, 0, 1, 1,
0.3888755, 0.8354689, 2.482156, 1, 0, 0, 1, 1,
0.3990462, -2.384024, 3.799497, 0, 0, 0, 1, 1,
0.4032423, 0.7150979, 0.02616239, 0, 0, 0, 1, 1,
0.4065049, -2.022255, 3.55629, 0, 0, 0, 1, 1,
0.4102731, 0.02681625, 1.374737, 0, 0, 0, 1, 1,
0.4140621, -1.123703, 4.02168, 0, 0, 0, 1, 1,
0.4156532, 0.3780303, 1.743955, 0, 0, 0, 1, 1,
0.4223403, -1.027269, 3.344366, 0, 0, 0, 1, 1,
0.4253908, 1.93762, 0.5684106, 1, 1, 1, 1, 1,
0.4263623, -1.031116, 3.558266, 1, 1, 1, 1, 1,
0.4268938, 0.004623943, 2.748217, 1, 1, 1, 1, 1,
0.4304794, -1.108547, 1.717506, 1, 1, 1, 1, 1,
0.4322952, -0.6226376, 2.907964, 1, 1, 1, 1, 1,
0.4330299, 0.6000552, 0.8511753, 1, 1, 1, 1, 1,
0.43565, -0.08136028, 2.684947, 1, 1, 1, 1, 1,
0.4376029, 1.000664, 1.712863, 1, 1, 1, 1, 1,
0.453849, 0.5266662, 1.028969, 1, 1, 1, 1, 1,
0.455987, 0.005314037, 0.9445579, 1, 1, 1, 1, 1,
0.4588737, 1.245412, 0.4079725, 1, 1, 1, 1, 1,
0.4630173, -0.5721659, 2.951614, 1, 1, 1, 1, 1,
0.4706247, 1.074537, 0.1138033, 1, 1, 1, 1, 1,
0.4716652, 0.608427, -0.2781747, 1, 1, 1, 1, 1,
0.4766128, 0.8174267, 1.897713, 1, 1, 1, 1, 1,
0.4774027, 0.307707, 0.4085924, 0, 0, 1, 1, 1,
0.477879, -0.3595021, 2.35088, 1, 0, 0, 1, 1,
0.4798883, -0.2506563, 3.537581, 1, 0, 0, 1, 1,
0.480588, -0.07037347, 0.4004925, 1, 0, 0, 1, 1,
0.4821867, -0.08616495, 1.446428, 1, 0, 0, 1, 1,
0.4826942, 0.5846827, 1.160471, 1, 0, 0, 1, 1,
0.484719, 1.50934, 0.6656029, 0, 0, 0, 1, 1,
0.4911232, 0.6826509, 0.9208608, 0, 0, 0, 1, 1,
0.4931795, -1.797742, 2.251336, 0, 0, 0, 1, 1,
0.493272, 0.7895495, 1.170654, 0, 0, 0, 1, 1,
0.4949719, 1.668643, -0.4119292, 0, 0, 0, 1, 1,
0.4981011, -0.4046848, 2.191045, 0, 0, 0, 1, 1,
0.4987753, 0.2039163, 1.282127, 0, 0, 0, 1, 1,
0.4998209, -1.075625, 3.067971, 1, 1, 1, 1, 1,
0.5021303, -0.09487692, 2.324256, 1, 1, 1, 1, 1,
0.5022085, 0.6977987, 0.9150996, 1, 1, 1, 1, 1,
0.5026972, 0.1004967, 0.7197013, 1, 1, 1, 1, 1,
0.5030051, -0.9175398, 1.904972, 1, 1, 1, 1, 1,
0.5090526, 1.581346, -0.0683064, 1, 1, 1, 1, 1,
0.5141005, -0.9562279, 4.791932, 1, 1, 1, 1, 1,
0.5213546, 0.2472513, 1.038542, 1, 1, 1, 1, 1,
0.5246354, 0.995795, -0.001994526, 1, 1, 1, 1, 1,
0.5250834, -0.7095462, 2.063564, 1, 1, 1, 1, 1,
0.5253973, -0.8911231, 1.410337, 1, 1, 1, 1, 1,
0.5280586, 1.176477, -0.1305219, 1, 1, 1, 1, 1,
0.52899, 2.129956, 1.845008, 1, 1, 1, 1, 1,
0.5296595, -0.5487595, 4.709175, 1, 1, 1, 1, 1,
0.5303873, -0.4934148, 2.657164, 1, 1, 1, 1, 1,
0.5323801, 0.336417, 0.8751097, 0, 0, 1, 1, 1,
0.5334184, 0.6610075, -0.2622083, 1, 0, 0, 1, 1,
0.5358979, -0.4381534, 1.931581, 1, 0, 0, 1, 1,
0.5374495, -0.3589083, 2.487999, 1, 0, 0, 1, 1,
0.5378102, 1.174243, 0.219981, 1, 0, 0, 1, 1,
0.5380708, 0.241085, 1.628612, 1, 0, 0, 1, 1,
0.5388703, 0.3461424, 2.319981, 0, 0, 0, 1, 1,
0.5393666, 1.160932, -0.6983429, 0, 0, 0, 1, 1,
0.5396144, 0.1341005, 2.613083, 0, 0, 0, 1, 1,
0.5412661, -0.7974479, 1.739549, 0, 0, 0, 1, 1,
0.5415924, 1.152599, 2.127298, 0, 0, 0, 1, 1,
0.5434818, 0.3854603, 1.557275, 0, 0, 0, 1, 1,
0.5451277, 0.1729925, 1.844709, 0, 0, 0, 1, 1,
0.5458693, -1.952345, 4.346419, 1, 1, 1, 1, 1,
0.5461137, 0.7124165, 0.400427, 1, 1, 1, 1, 1,
0.5488757, -1.311642, 2.422057, 1, 1, 1, 1, 1,
0.5502062, -1.18327, 3.692638, 1, 1, 1, 1, 1,
0.553298, 0.8236428, 0.1716246, 1, 1, 1, 1, 1,
0.5575736, -0.3219507, 2.044225, 1, 1, 1, 1, 1,
0.5602175, -1.355499, 2.016683, 1, 1, 1, 1, 1,
0.5615974, 0.6169577, -0.7422333, 1, 1, 1, 1, 1,
0.5632843, -1.894974, 2.253661, 1, 1, 1, 1, 1,
0.5645637, -0.7989518, 4.455964, 1, 1, 1, 1, 1,
0.5680739, -1.286923, 2.743509, 1, 1, 1, 1, 1,
0.5709299, -0.4688464, 2.743074, 1, 1, 1, 1, 1,
0.5736877, 0.2626635, 1.290537, 1, 1, 1, 1, 1,
0.573918, 0.1606, 1.349052, 1, 1, 1, 1, 1,
0.5755098, -1.620079, 2.581191, 1, 1, 1, 1, 1,
0.5796295, 1.794375, 2.260741, 0, 0, 1, 1, 1,
0.5859128, 0.262774, 1.111033, 1, 0, 0, 1, 1,
0.5948809, 0.710404, 0.05589391, 1, 0, 0, 1, 1,
0.5963874, -0.1732166, 1.89351, 1, 0, 0, 1, 1,
0.5997066, 0.9708287, -0.1327382, 1, 0, 0, 1, 1,
0.6003012, 0.6928707, 0.0973954, 1, 0, 0, 1, 1,
0.6003469, 0.1876664, 2.787518, 0, 0, 0, 1, 1,
0.6031815, -0.7035829, 3.706992, 0, 0, 0, 1, 1,
0.6051931, 2.019063, 0.1238403, 0, 0, 0, 1, 1,
0.6065127, 1.667172, -0.9087319, 0, 0, 0, 1, 1,
0.6065373, 0.2946941, -0.5794262, 0, 0, 0, 1, 1,
0.6068839, -0.008039476, 2.252805, 0, 0, 0, 1, 1,
0.6167849, 0.1411055, 2.169775, 0, 0, 0, 1, 1,
0.6178549, -0.4296848, 1.165414, 1, 1, 1, 1, 1,
0.6180131, 1.540815, 0.08947522, 1, 1, 1, 1, 1,
0.6180555, 1.441207, -1.218919, 1, 1, 1, 1, 1,
0.6186911, -0.9579203, 3.233873, 1, 1, 1, 1, 1,
0.6238663, -1.014216, 2.215294, 1, 1, 1, 1, 1,
0.6321207, -0.9603175, 1.3884, 1, 1, 1, 1, 1,
0.6328415, -1.185437, 0.7249368, 1, 1, 1, 1, 1,
0.6389518, -0.2887655, 1.905279, 1, 1, 1, 1, 1,
0.6407644, 0.3739838, 2.777736, 1, 1, 1, 1, 1,
0.6450599, -0.972666, 3.190996, 1, 1, 1, 1, 1,
0.6455696, 1.023464, -0.0518334, 1, 1, 1, 1, 1,
0.6456024, 0.5031345, 0.4228224, 1, 1, 1, 1, 1,
0.6531107, -1.233166, 3.488322, 1, 1, 1, 1, 1,
0.6546448, -0.8816931, 2.481399, 1, 1, 1, 1, 1,
0.6622792, -0.3576681, 2.683147, 1, 1, 1, 1, 1,
0.66348, -1.147275, 3.325528, 0, 0, 1, 1, 1,
0.6652306, 2.436477, 0.8494839, 1, 0, 0, 1, 1,
0.6654749, 2.165144, 0.1825638, 1, 0, 0, 1, 1,
0.6675063, -0.08037529, 0.6851665, 1, 0, 0, 1, 1,
0.6760606, -0.5748364, 1.743247, 1, 0, 0, 1, 1,
0.6799088, -2.097185, 3.50849, 1, 0, 0, 1, 1,
0.683838, -0.04593134, 0.8391054, 0, 0, 0, 1, 1,
0.6856276, -0.2849995, 2.604753, 0, 0, 0, 1, 1,
0.6886153, 1.04541, 0.6639467, 0, 0, 0, 1, 1,
0.6966281, -0.508266, 3.773748, 0, 0, 0, 1, 1,
0.7018351, -1.551751, 3.414561, 0, 0, 0, 1, 1,
0.7041672, 0.7067924, 1.923088, 0, 0, 0, 1, 1,
0.705707, 2.146744, 0.6071614, 0, 0, 0, 1, 1,
0.7069621, 0.4929153, 1.807469, 1, 1, 1, 1, 1,
0.708021, -0.806518, 3.064117, 1, 1, 1, 1, 1,
0.7095656, -0.7542262, 3.343003, 1, 1, 1, 1, 1,
0.7099983, 0.2414612, 0.6707809, 1, 1, 1, 1, 1,
0.7139276, 0.2847048, 1.815736, 1, 1, 1, 1, 1,
0.7159302, 1.174417, 0.4678061, 1, 1, 1, 1, 1,
0.7221872, -1.48276, 1.838995, 1, 1, 1, 1, 1,
0.7233423, 1.688507, 1.671664, 1, 1, 1, 1, 1,
0.7424866, 1.772578, 0.8047309, 1, 1, 1, 1, 1,
0.747583, -0.08841127, 2.675455, 1, 1, 1, 1, 1,
0.7499277, 0.5919471, 1.059481, 1, 1, 1, 1, 1,
0.7556708, 1.354357, 1.038592, 1, 1, 1, 1, 1,
0.7718824, 1.04297, 1.258882, 1, 1, 1, 1, 1,
0.7736166, -0.5923101, 2.469872, 1, 1, 1, 1, 1,
0.7760748, -1.616033, 2.809945, 1, 1, 1, 1, 1,
0.7766131, -1.903855, 3.909936, 0, 0, 1, 1, 1,
0.779125, -0.8606976, 2.31743, 1, 0, 0, 1, 1,
0.7796757, -2.039985, 2.698268, 1, 0, 0, 1, 1,
0.7875908, 1.118372, 0.03914144, 1, 0, 0, 1, 1,
0.7895138, -0.9539627, 4.287549, 1, 0, 0, 1, 1,
0.7969586, -0.09939978, -0.03502058, 1, 0, 0, 1, 1,
0.7999887, 1.094983, 1.20436, 0, 0, 0, 1, 1,
0.8014219, -0.3936211, 1.495608, 0, 0, 0, 1, 1,
0.8158692, -1.74519, 2.630938, 0, 0, 0, 1, 1,
0.8162768, -0.7169836, 3.236002, 0, 0, 0, 1, 1,
0.8227965, -0.7307112, -0.3358601, 0, 0, 0, 1, 1,
0.8256727, 0.7566835, 1.055276, 0, 0, 0, 1, 1,
0.8340849, 0.7646662, -0.0966289, 0, 0, 0, 1, 1,
0.8362506, 0.4213845, 1.457847, 1, 1, 1, 1, 1,
0.8378792, -0.8368817, 2.098783, 1, 1, 1, 1, 1,
0.8389333, -0.9167736, 1.772531, 1, 1, 1, 1, 1,
0.8397427, -1.366249, 1.096, 1, 1, 1, 1, 1,
0.8461132, -1.126976, 2.940291, 1, 1, 1, 1, 1,
0.8470823, 1.275386, 0.5104551, 1, 1, 1, 1, 1,
0.847822, -1.188218, 2.666075, 1, 1, 1, 1, 1,
0.8499666, 1.454672, 0.6037433, 1, 1, 1, 1, 1,
0.8537953, -0.2455567, 0.9940262, 1, 1, 1, 1, 1,
0.8566033, -1.307614, 1.897897, 1, 1, 1, 1, 1,
0.8655605, 1.038531, 1.663055, 1, 1, 1, 1, 1,
0.8674785, -1.8933, 2.334759, 1, 1, 1, 1, 1,
0.8788451, 0.5578989, 1.634774, 1, 1, 1, 1, 1,
0.8832428, 1.974661, 0.4647378, 1, 1, 1, 1, 1,
0.8916799, 0.4944802, 1.642817, 1, 1, 1, 1, 1,
0.8961644, -0.3510565, 3.145096, 0, 0, 1, 1, 1,
0.896632, 0.04320527, -0.1385144, 1, 0, 0, 1, 1,
0.9004492, -0.3916621, 2.343191, 1, 0, 0, 1, 1,
0.9049972, 0.0937388, 2.706173, 1, 0, 0, 1, 1,
0.9057449, 0.2224215, 1.484108, 1, 0, 0, 1, 1,
0.9078242, 0.7325083, 0.7759678, 1, 0, 0, 1, 1,
0.9079385, 1.387022, 0.724981, 0, 0, 0, 1, 1,
0.9103273, -0.1291757, 1.30196, 0, 0, 0, 1, 1,
0.9184886, -0.1791099, 2.369096, 0, 0, 0, 1, 1,
0.926486, 1.09818, 0.537813, 0, 0, 0, 1, 1,
0.929027, 1.441008, 0.9005749, 0, 0, 0, 1, 1,
0.9291216, -1.09719, 4.39973, 0, 0, 0, 1, 1,
0.9366927, 0.4575291, -1.558209, 0, 0, 0, 1, 1,
0.9492116, 0.5154679, -0.5953088, 1, 1, 1, 1, 1,
0.9520008, 0.4593687, 2.444218, 1, 1, 1, 1, 1,
0.9597626, -1.667971, 1.212061, 1, 1, 1, 1, 1,
0.9686955, 1.360268, 1.859149, 1, 1, 1, 1, 1,
0.9763324, 1.3559, 0.2956637, 1, 1, 1, 1, 1,
0.9785836, -0.9797263, 1.447054, 1, 1, 1, 1, 1,
0.9803294, 0.06821294, 1.399064, 1, 1, 1, 1, 1,
0.98269, 0.5065685, 0.3349353, 1, 1, 1, 1, 1,
0.9837756, -0.2926823, 1.485982, 1, 1, 1, 1, 1,
0.9991359, -0.4403799, 0.7801487, 1, 1, 1, 1, 1,
1.005555, -0.1153263, 2.428722, 1, 1, 1, 1, 1,
1.010644, 0.06284156, 1.280929, 1, 1, 1, 1, 1,
1.013443, 2.146184, 1.027814, 1, 1, 1, 1, 1,
1.015871, -0.7072468, 3.374579, 1, 1, 1, 1, 1,
1.022126, 0.09125382, 1.836659, 1, 1, 1, 1, 1,
1.022798, -0.581068, 0.6424839, 0, 0, 1, 1, 1,
1.025479, -0.7884552, 2.091085, 1, 0, 0, 1, 1,
1.027111, 0.1382013, 0.2906629, 1, 0, 0, 1, 1,
1.033239, -2.035023, 1.466226, 1, 0, 0, 1, 1,
1.034366, -1.592645, 0.7721118, 1, 0, 0, 1, 1,
1.037394, -0.6907007, 1.788615, 1, 0, 0, 1, 1,
1.039537, -0.1939294, 4.034342, 0, 0, 0, 1, 1,
1.041063, -0.4318759, 3.024727, 0, 0, 0, 1, 1,
1.041193, 1.178029, -0.2648664, 0, 0, 0, 1, 1,
1.042, -0.4604622, 2.389628, 0, 0, 0, 1, 1,
1.042019, 1.447964, -0.8201284, 0, 0, 0, 1, 1,
1.043524, -0.656673, 1.752932, 0, 0, 0, 1, 1,
1.044078, -0.6975307, 0.6028586, 0, 0, 0, 1, 1,
1.044871, -0.1598881, 1.789693, 1, 1, 1, 1, 1,
1.076476, 0.3037525, 1.237994, 1, 1, 1, 1, 1,
1.083423, 0.5418692, 0.1009986, 1, 1, 1, 1, 1,
1.08574, -0.2083253, 1.178728, 1, 1, 1, 1, 1,
1.089857, -2.441298, 2.050197, 1, 1, 1, 1, 1,
1.092766, -1.787692, 2.583065, 1, 1, 1, 1, 1,
1.093599, 1.262843, 1.368729, 1, 1, 1, 1, 1,
1.095049, 1.339584, 1.948079, 1, 1, 1, 1, 1,
1.095527, 0.4657247, 2.351511, 1, 1, 1, 1, 1,
1.103728, 0.4604852, 1.812827, 1, 1, 1, 1, 1,
1.109672, 0.05033888, 1.47814, 1, 1, 1, 1, 1,
1.109922, 0.7046785, 0.006538672, 1, 1, 1, 1, 1,
1.114313, 2.428142, 0.7560109, 1, 1, 1, 1, 1,
1.123614, -0.8028669, 1.237539, 1, 1, 1, 1, 1,
1.13439, -2.451312, 4.30053, 1, 1, 1, 1, 1,
1.13669, 0.8677936, 0.5437129, 0, 0, 1, 1, 1,
1.143338, 0.3237978, 0.6670377, 1, 0, 0, 1, 1,
1.147663, 2.793719, 2.023992, 1, 0, 0, 1, 1,
1.153707, -0.5516506, 1.732733, 1, 0, 0, 1, 1,
1.158883, -0.8727555, 1.788068, 1, 0, 0, 1, 1,
1.167673, -1.829616, 2.45146, 1, 0, 0, 1, 1,
1.181699, -2.157908, 1.098162, 0, 0, 0, 1, 1,
1.190526, -2.276873, 2.057904, 0, 0, 0, 1, 1,
1.193638, 1.457873, 0.656709, 0, 0, 0, 1, 1,
1.198236, -0.3198481, 1.959223, 0, 0, 0, 1, 1,
1.2141, 0.8235682, 0.6954233, 0, 0, 0, 1, 1,
1.214103, -1.008803, 1.059313, 0, 0, 0, 1, 1,
1.216016, -1.023685, 3.846752, 0, 0, 0, 1, 1,
1.248681, 0.7715895, 0.2578591, 1, 1, 1, 1, 1,
1.263845, 1.545256, 1.186585, 1, 1, 1, 1, 1,
1.303587, 1.345446, -0.4813184, 1, 1, 1, 1, 1,
1.306997, -0.0009047042, 1.203447, 1, 1, 1, 1, 1,
1.307093, -1.045874, 1.772688, 1, 1, 1, 1, 1,
1.308729, 0.7144296, -0.007575683, 1, 1, 1, 1, 1,
1.31153, -0.8263445, 1.740654, 1, 1, 1, 1, 1,
1.313389, -0.2311133, 1.962158, 1, 1, 1, 1, 1,
1.316158, 2.026739, 1.513615, 1, 1, 1, 1, 1,
1.316351, -0.2749423, 4.70684, 1, 1, 1, 1, 1,
1.318545, -0.7932796, 2.223706, 1, 1, 1, 1, 1,
1.334826, -1.179941, 1.164318, 1, 1, 1, 1, 1,
1.336761, 0.1027335, 0.1325804, 1, 1, 1, 1, 1,
1.341528, -1.534231, 1.671256, 1, 1, 1, 1, 1,
1.347067, 0.2130319, -0.2730066, 1, 1, 1, 1, 1,
1.350091, -0.2510984, 2.092319, 0, 0, 1, 1, 1,
1.350401, 0.7191093, 1.833577, 1, 0, 0, 1, 1,
1.358264, -0.4780101, 2.499557, 1, 0, 0, 1, 1,
1.366423, 1.409183, 0.4807279, 1, 0, 0, 1, 1,
1.369027, -1.353039, 2.292676, 1, 0, 0, 1, 1,
1.369545, -0.4058396, 1.148711, 1, 0, 0, 1, 1,
1.374806, -0.3465578, 1.880332, 0, 0, 0, 1, 1,
1.374911, -0.5737121, 0.5663824, 0, 0, 0, 1, 1,
1.378923, 0.3282345, 1.007966, 0, 0, 0, 1, 1,
1.386936, -0.2138602, 3.069945, 0, 0, 0, 1, 1,
1.395527, 0.47382, 1.133245, 0, 0, 0, 1, 1,
1.397959, -0.2763526, 2.710599, 0, 0, 0, 1, 1,
1.417006, -0.06592027, 0.5345153, 0, 0, 0, 1, 1,
1.422755, -1.290552, 1.329547, 1, 1, 1, 1, 1,
1.424605, 1.521402, 2.053386, 1, 1, 1, 1, 1,
1.424966, -0.5019317, 0.1296843, 1, 1, 1, 1, 1,
1.427556, 1.280565, 0.2875069, 1, 1, 1, 1, 1,
1.445493, 0.2976179, 0.009541389, 1, 1, 1, 1, 1,
1.461749, -0.7191898, 1.410451, 1, 1, 1, 1, 1,
1.47024, -0.2995803, 1.532134, 1, 1, 1, 1, 1,
1.474985, 1.312424, 3.320243, 1, 1, 1, 1, 1,
1.483531, -0.7794674, 2.521987, 1, 1, 1, 1, 1,
1.487733, 0.6107907, -0.6447515, 1, 1, 1, 1, 1,
1.490978, -0.4984963, 1.554942, 1, 1, 1, 1, 1,
1.491955, 1.120587, 0.6135802, 1, 1, 1, 1, 1,
1.501964, -1.907845, 3.038312, 1, 1, 1, 1, 1,
1.504364, 0.4645678, 2.293035, 1, 1, 1, 1, 1,
1.514239, 0.5788434, 2.732985, 1, 1, 1, 1, 1,
1.542153, -0.5539572, 2.761221, 0, 0, 1, 1, 1,
1.558117, -0.6880617, 3.227908, 1, 0, 0, 1, 1,
1.56406, 0.2835983, 1.147092, 1, 0, 0, 1, 1,
1.571873, 1.018352, 1.503502, 1, 0, 0, 1, 1,
1.572865, 0.001955219, -0.04471207, 1, 0, 0, 1, 1,
1.583982, -0.661163, 2.392799, 1, 0, 0, 1, 1,
1.591314, 0.6061183, 2.213961, 0, 0, 0, 1, 1,
1.593974, 0.5261646, 0.6927696, 0, 0, 0, 1, 1,
1.603492, -1.847616, 2.320218, 0, 0, 0, 1, 1,
1.613068, 0.5934947, 1.903826, 0, 0, 0, 1, 1,
1.619444, -0.3112384, 2.1427, 0, 0, 0, 1, 1,
1.620454, -0.8746867, 1.357869, 0, 0, 0, 1, 1,
1.639794, -1.455671, 4.074315, 0, 0, 0, 1, 1,
1.641816, 0.6689378, 2.116627, 1, 1, 1, 1, 1,
1.646448, 0.8987079, 1.96363, 1, 1, 1, 1, 1,
1.648298, 0.8633838, 0.840537, 1, 1, 1, 1, 1,
1.669653, 0.8694065, 0.4492502, 1, 1, 1, 1, 1,
1.68154, -0.4337214, 1.552718, 1, 1, 1, 1, 1,
1.682899, -0.3571402, 0.7105638, 1, 1, 1, 1, 1,
1.683032, 0.402608, 2.15462, 1, 1, 1, 1, 1,
1.702199, 1.189669, 0.3182994, 1, 1, 1, 1, 1,
1.716874, -1.023507, 2.621922, 1, 1, 1, 1, 1,
1.724855, -1.377192, 3.026172, 1, 1, 1, 1, 1,
1.725475, -1.407142, 2.847804, 1, 1, 1, 1, 1,
1.737962, 1.210904, 2.083147, 1, 1, 1, 1, 1,
1.743459, 0.1932942, 1.973692, 1, 1, 1, 1, 1,
1.7516, -1.445453, 2.197997, 1, 1, 1, 1, 1,
1.755771, -0.2874186, 1.77072, 1, 1, 1, 1, 1,
1.768113, 1.143777, 1.560059, 0, 0, 1, 1, 1,
1.78295, 0.5109297, 0.8964155, 1, 0, 0, 1, 1,
1.788171, 0.6357682, 1.248345, 1, 0, 0, 1, 1,
1.788683, 0.1364811, 1.786295, 1, 0, 0, 1, 1,
1.794409, 2.096514, 2.049116, 1, 0, 0, 1, 1,
1.796461, -0.03837955, 1.883073, 1, 0, 0, 1, 1,
1.8138, 1.460791, 2.133693, 0, 0, 0, 1, 1,
1.816656, 0.8945129, 1.332638, 0, 0, 0, 1, 1,
1.823454, 1.187718, 0.2093134, 0, 0, 0, 1, 1,
1.847697, -0.3895316, 2.485357, 0, 0, 0, 1, 1,
1.856714, 0.5557188, 2.170666, 0, 0, 0, 1, 1,
1.869907, -1.957502, 3.214906, 0, 0, 0, 1, 1,
1.883934, -0.1336897, 2.783367, 0, 0, 0, 1, 1,
1.905039, -0.7672005, 2.711594, 1, 1, 1, 1, 1,
1.917653, 0.4207147, 2.3324, 1, 1, 1, 1, 1,
1.922486, 1.25716, 0.1569004, 1, 1, 1, 1, 1,
1.930951, -1.068724, 1.45499, 1, 1, 1, 1, 1,
1.938002, -1.72777, 2.369887, 1, 1, 1, 1, 1,
1.955668, -1.120522, 0.7614905, 1, 1, 1, 1, 1,
1.975495, 0.2285501, 0.3876127, 1, 1, 1, 1, 1,
1.984492, -0.07049385, 2.582573, 1, 1, 1, 1, 1,
2.017382, -0.3273451, 3.013997, 1, 1, 1, 1, 1,
2.021467, -1.151341, 0.5656446, 1, 1, 1, 1, 1,
2.044474, -0.6522061, 0.8004305, 1, 1, 1, 1, 1,
2.052248, 0.3244144, -0.3007882, 1, 1, 1, 1, 1,
2.060203, -0.04875494, 1.382944, 1, 1, 1, 1, 1,
2.083209, -0.895852, 1.33092, 1, 1, 1, 1, 1,
2.109274, 1.021301, -1.232776, 1, 1, 1, 1, 1,
2.122934, 0.8227764, -0.3326859, 0, 0, 1, 1, 1,
2.158521, 1.168736, 0.9993097, 1, 0, 0, 1, 1,
2.165429, 0.6714826, 0.2880184, 1, 0, 0, 1, 1,
2.17595, 0.7107934, 2.224189, 1, 0, 0, 1, 1,
2.178639, -0.916212, 1.598078, 1, 0, 0, 1, 1,
2.181597, -1.745867, 2.333457, 1, 0, 0, 1, 1,
2.279207, -0.9645782, 2.703339, 0, 0, 0, 1, 1,
2.280747, 0.5249807, 3.152923, 0, 0, 0, 1, 1,
2.29621, -0.8407608, 2.762606, 0, 0, 0, 1, 1,
2.300708, -3.725168, 1.83546, 0, 0, 0, 1, 1,
2.375311, 0.4622462, 1.632121, 0, 0, 0, 1, 1,
2.389505, -0.694392, 3.28807, 0, 0, 0, 1, 1,
2.487003, 0.1242281, 2.762999, 0, 0, 0, 1, 1,
2.501191, 0.5751175, 2.701897, 1, 1, 1, 1, 1,
2.578534, 1.795584, 0.5288383, 1, 1, 1, 1, 1,
2.708449, 1.374158, 3.205404, 1, 1, 1, 1, 1,
2.72539, -2.047493, 1.827896, 1, 1, 1, 1, 1,
2.747013, -0.02512623, 2.554791, 1, 1, 1, 1, 1,
2.965466, -1.943785, 1.822674, 1, 1, 1, 1, 1,
3.812299, 1.088324, 0.320739, 1, 1, 1, 1, 1
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
var radius = 10.28574;
var distance = 36.12823;
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
mvMatrix.translate( -0.1622376, 0.1521459, 0.2274587 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.12823);
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
