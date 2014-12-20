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
-3.713874, 1.17742, -0.7184462, 1, 0, 0, 1,
-3.028464, -0.2913724, -1.950133, 1, 0.007843138, 0, 1,
-2.855187, 1.599711, -1.010398, 1, 0.01176471, 0, 1,
-2.611033, 1.268694, -1.748296, 1, 0.01960784, 0, 1,
-2.534729, 0.8831137, 0.01354117, 1, 0.02352941, 0, 1,
-2.456136, 0.0778048, -1.089557, 1, 0.03137255, 0, 1,
-2.384739, 0.6448753, -0.9507353, 1, 0.03529412, 0, 1,
-2.380026, 0.3427087, -1.218713, 1, 0.04313726, 0, 1,
-2.329817, 1.856472, -1.702168, 1, 0.04705882, 0, 1,
-2.30686, 0.4052945, -1.141175, 1, 0.05490196, 0, 1,
-2.298044, 1.740903, -2.227098, 1, 0.05882353, 0, 1,
-2.282284, 0.206543, -2.559199, 1, 0.06666667, 0, 1,
-2.271829, 0.5631335, -0.9673755, 1, 0.07058824, 0, 1,
-2.258102, -0.02270816, -1.646756, 1, 0.07843138, 0, 1,
-2.228537, -0.3148419, -1.958777, 1, 0.08235294, 0, 1,
-2.220001, -0.1459714, -1.107897, 1, 0.09019608, 0, 1,
-2.189615, -0.822035, -2.432661, 1, 0.09411765, 0, 1,
-2.185151, 0.5082664, -1.98672, 1, 0.1019608, 0, 1,
-2.177703, 0.01054969, -2.624857, 1, 0.1098039, 0, 1,
-2.172239, -0.2939068, -1.469165, 1, 0.1137255, 0, 1,
-2.136954, 1.080037, 0.02677547, 1, 0.1215686, 0, 1,
-2.086797, 0.7626584, -1.622249, 1, 0.1254902, 0, 1,
-2.081216, -0.6819708, -0.4458151, 1, 0.1333333, 0, 1,
-2.069977, -0.8368872, -0.7538626, 1, 0.1372549, 0, 1,
-2.061151, -0.3177418, -0.3680106, 1, 0.145098, 0, 1,
-2.055001, 1.357013, -0.9752307, 1, 0.1490196, 0, 1,
-2.035969, 0.1872556, -0.8171424, 1, 0.1568628, 0, 1,
-2.024833, 0.3113129, -1.000132, 1, 0.1607843, 0, 1,
-1.993779, 0.3556981, -0.3176057, 1, 0.1686275, 0, 1,
-1.99366, 0.6564122, -0.4479118, 1, 0.172549, 0, 1,
-1.989449, 1.326994, -2.309996, 1, 0.1803922, 0, 1,
-1.978861, 0.2280868, 0.7216414, 1, 0.1843137, 0, 1,
-1.937302, -0.4365229, -1.588991, 1, 0.1921569, 0, 1,
-1.912372, 1.069233, -1.571535, 1, 0.1960784, 0, 1,
-1.908053, -1.512199, -2.861181, 1, 0.2039216, 0, 1,
-1.831024, 1.020838, -1.355848, 1, 0.2117647, 0, 1,
-1.821469, -0.6298657, -2.373407, 1, 0.2156863, 0, 1,
-1.818686, -0.3576356, -1.016289, 1, 0.2235294, 0, 1,
-1.806245, 1.060525, 0.2226192, 1, 0.227451, 0, 1,
-1.800563, -0.9475369, -1.076108, 1, 0.2352941, 0, 1,
-1.798136, -0.6266328, -2.482787, 1, 0.2392157, 0, 1,
-1.794522, 2.586931, -1.356889, 1, 0.2470588, 0, 1,
-1.785699, -0.4501905, -2.434855, 1, 0.2509804, 0, 1,
-1.731517, 0.05754125, -1.181239, 1, 0.2588235, 0, 1,
-1.729407, 0.7428091, -1.207059, 1, 0.2627451, 0, 1,
-1.721797, 1.046737, -1.071929, 1, 0.2705882, 0, 1,
-1.719368, 1.308697, 0.01244437, 1, 0.2745098, 0, 1,
-1.691715, -0.06838488, -1.865029, 1, 0.282353, 0, 1,
-1.681617, 0.7769451, -0.9638054, 1, 0.2862745, 0, 1,
-1.680386, 1.67643, -1.270391, 1, 0.2941177, 0, 1,
-1.672737, -0.8963861, -1.375841, 1, 0.3019608, 0, 1,
-1.661699, -0.4585085, -2.105888, 1, 0.3058824, 0, 1,
-1.65143, -0.8392242, -2.307288, 1, 0.3137255, 0, 1,
-1.643101, 1.65422, -0.7000351, 1, 0.3176471, 0, 1,
-1.640354, 0.07978394, -3.693395, 1, 0.3254902, 0, 1,
-1.634714, 0.3219354, -1.002111, 1, 0.3294118, 0, 1,
-1.628985, -1.065645, -2.650835, 1, 0.3372549, 0, 1,
-1.603602, 0.702879, -1.831294, 1, 0.3411765, 0, 1,
-1.581634, 2.068416, -0.6611471, 1, 0.3490196, 0, 1,
-1.5681, 0.6738489, 0.04953044, 1, 0.3529412, 0, 1,
-1.560089, -0.2353428, -2.136666, 1, 0.3607843, 0, 1,
-1.538874, -0.06064872, 0.04518977, 1, 0.3647059, 0, 1,
-1.527986, -0.7060313, -1.789416, 1, 0.372549, 0, 1,
-1.52535, 2.260431, 0.8106456, 1, 0.3764706, 0, 1,
-1.525066, -1.590015, -1.615192, 1, 0.3843137, 0, 1,
-1.51934, 0.7350894, -0.7391626, 1, 0.3882353, 0, 1,
-1.511335, -0.2197755, -1.568645, 1, 0.3960784, 0, 1,
-1.500271, 0.6182845, -0.2895308, 1, 0.4039216, 0, 1,
-1.496047, 1.180034, -0.4839849, 1, 0.4078431, 0, 1,
-1.492716, -0.9590095, -1.27124, 1, 0.4156863, 0, 1,
-1.48641, 0.6973298, -0.3552417, 1, 0.4196078, 0, 1,
-1.484603, 0.5193478, 0.1003474, 1, 0.427451, 0, 1,
-1.482704, -0.6117342, -1.475824, 1, 0.4313726, 0, 1,
-1.475376, 1.223835, -2.327842, 1, 0.4392157, 0, 1,
-1.47425, 1.861362, -0.1205167, 1, 0.4431373, 0, 1,
-1.470759, 0.8043478, -0.969365, 1, 0.4509804, 0, 1,
-1.462418, 0.5941985, -0.925738, 1, 0.454902, 0, 1,
-1.460761, 0.6169501, -2.860206, 1, 0.4627451, 0, 1,
-1.443631, -0.2451181, -0.8793365, 1, 0.4666667, 0, 1,
-1.436643, 0.3748102, -1.409044, 1, 0.4745098, 0, 1,
-1.434991, -0.3451908, -0.8132189, 1, 0.4784314, 0, 1,
-1.425446, 0.141627, -2.643167, 1, 0.4862745, 0, 1,
-1.424737, 0.8474534, -1.360256, 1, 0.4901961, 0, 1,
-1.413685, -1.460352, -2.008221, 1, 0.4980392, 0, 1,
-1.401393, -0.651817, -3.053946, 1, 0.5058824, 0, 1,
-1.399782, 0.7689615, -1.535633, 1, 0.509804, 0, 1,
-1.398938, 0.3338646, 0.3523434, 1, 0.5176471, 0, 1,
-1.395483, -0.7548838, -1.858941, 1, 0.5215687, 0, 1,
-1.393738, 1.683576, -1.116281, 1, 0.5294118, 0, 1,
-1.371404, -0.2194942, -2.894495, 1, 0.5333334, 0, 1,
-1.364455, 0.8498613, -1.71808, 1, 0.5411765, 0, 1,
-1.351685, 1.591377, -2.16262, 1, 0.5450981, 0, 1,
-1.345743, -1.985934, -3.416188, 1, 0.5529412, 0, 1,
-1.343891, -0.09857186, 1.115473, 1, 0.5568628, 0, 1,
-1.339476, 0.5784786, 0.2103629, 1, 0.5647059, 0, 1,
-1.338596, -1.208056, -0.755812, 1, 0.5686275, 0, 1,
-1.337943, -0.412139, -1.944565, 1, 0.5764706, 0, 1,
-1.322602, 0.9686256, -1.26318, 1, 0.5803922, 0, 1,
-1.314555, -0.8092922, -1.572863, 1, 0.5882353, 0, 1,
-1.306471, -0.6084806, -2.366396, 1, 0.5921569, 0, 1,
-1.303885, 0.8077058, -0.6348702, 1, 0.6, 0, 1,
-1.300358, 0.7925812, -1.331101, 1, 0.6078432, 0, 1,
-1.292949, 1.683669, 1.93627, 1, 0.6117647, 0, 1,
-1.29256, 0.4356808, -1.858638, 1, 0.6196079, 0, 1,
-1.289641, -0.9453187, -2.499088, 1, 0.6235294, 0, 1,
-1.285033, -0.9190109, -2.395264, 1, 0.6313726, 0, 1,
-1.280611, -0.2871436, -1.933609, 1, 0.6352941, 0, 1,
-1.27819, 0.7102243, -1.891722, 1, 0.6431373, 0, 1,
-1.269276, 0.8205624, -1.65338, 1, 0.6470588, 0, 1,
-1.265119, -0.5016037, -1.898175, 1, 0.654902, 0, 1,
-1.25846, 0.1105304, -0.1200105, 1, 0.6588235, 0, 1,
-1.252864, 3.230221, -0.3759825, 1, 0.6666667, 0, 1,
-1.247414, 0.2082498, -0.4370694, 1, 0.6705883, 0, 1,
-1.246846, -1.285043, -1.97385, 1, 0.6784314, 0, 1,
-1.245053, -0.5362862, -2.794898, 1, 0.682353, 0, 1,
-1.239541, 0.04200105, -2.908381, 1, 0.6901961, 0, 1,
-1.238082, -0.1793139, -1.355757, 1, 0.6941177, 0, 1,
-1.235687, 1.568374, -1.141186, 1, 0.7019608, 0, 1,
-1.226578, -0.08994829, 1.225477, 1, 0.7098039, 0, 1,
-1.225291, 1.549842, -2.299896, 1, 0.7137255, 0, 1,
-1.222141, -1.079479, -1.01877, 1, 0.7215686, 0, 1,
-1.215856, 0.6723836, -0.9732054, 1, 0.7254902, 0, 1,
-1.213937, -0.4589496, -1.147388, 1, 0.7333333, 0, 1,
-1.211083, 0.2689913, -1.861353, 1, 0.7372549, 0, 1,
-1.207491, -0.5570198, -2.075097, 1, 0.7450981, 0, 1,
-1.194871, -2.847035, -2.220042, 1, 0.7490196, 0, 1,
-1.189099, -0.00937842, -1.35614, 1, 0.7568628, 0, 1,
-1.176771, -0.5483402, -1.507723, 1, 0.7607843, 0, 1,
-1.170209, 2.233732, -0.4548339, 1, 0.7686275, 0, 1,
-1.164463, 2.399043, -0.6003069, 1, 0.772549, 0, 1,
-1.1642, 0.2517748, -1.917296, 1, 0.7803922, 0, 1,
-1.157131, 0.08197394, -1.027486, 1, 0.7843137, 0, 1,
-1.156998, 1.52769, 0.3928839, 1, 0.7921569, 0, 1,
-1.152768, 0.4765313, -0.6061035, 1, 0.7960784, 0, 1,
-1.144276, 2.805846, -0.1095224, 1, 0.8039216, 0, 1,
-1.143135, 0.5504449, -1.06387, 1, 0.8117647, 0, 1,
-1.143069, -0.1886782, -3.498896, 1, 0.8156863, 0, 1,
-1.138128, -1.126064, -1.713955, 1, 0.8235294, 0, 1,
-1.13128, 0.7085896, -1.301367, 1, 0.827451, 0, 1,
-1.123676, -1.361439, -1.578808, 1, 0.8352941, 0, 1,
-1.123526, -0.06175067, -1.000434, 1, 0.8392157, 0, 1,
-1.119755, 0.8955199, 0.1823828, 1, 0.8470588, 0, 1,
-1.118342, -0.2946802, -1.795355, 1, 0.8509804, 0, 1,
-1.111792, 0.8170468, -1.674353, 1, 0.8588235, 0, 1,
-1.10977, -0.06182573, -3.891808, 1, 0.8627451, 0, 1,
-1.104779, 0.3017825, -3.246476, 1, 0.8705882, 0, 1,
-1.099129, -0.7883031, -2.786352, 1, 0.8745098, 0, 1,
-1.091894, 0.5261173, -1.627627, 1, 0.8823529, 0, 1,
-1.089547, 0.03408585, -3.500983, 1, 0.8862745, 0, 1,
-1.086682, -0.502193, -1.895828, 1, 0.8941177, 0, 1,
-1.085758, -0.05569138, -0.7364628, 1, 0.8980392, 0, 1,
-1.084458, -1.658836, -4.083589, 1, 0.9058824, 0, 1,
-1.080552, -1.597445, -4.676072, 1, 0.9137255, 0, 1,
-1.079324, -0.3692635, -2.08746, 1, 0.9176471, 0, 1,
-1.077796, 0.6219456, -0.4035096, 1, 0.9254902, 0, 1,
-1.07514, 1.004725, -2.834556, 1, 0.9294118, 0, 1,
-1.073933, 1.712586, 0.445281, 1, 0.9372549, 0, 1,
-1.066961, -0.3009986, 0.3151192, 1, 0.9411765, 0, 1,
-1.061082, -0.00804237, -0.1316494, 1, 0.9490196, 0, 1,
-1.06105, -0.3404531, -3.690199, 1, 0.9529412, 0, 1,
-1.059493, 0.7179015, -1.205997, 1, 0.9607843, 0, 1,
-1.041193, -0.6667605, -2.728001, 1, 0.9647059, 0, 1,
-1.039345, -0.442264, -2.084804, 1, 0.972549, 0, 1,
-1.039343, -1.206681, -2.006345, 1, 0.9764706, 0, 1,
-1.033877, 1.122069, 0.8045123, 1, 0.9843137, 0, 1,
-1.033283, 1.277923, -1.323744, 1, 0.9882353, 0, 1,
-1.020219, -0.2936625, -1.122802, 1, 0.9960784, 0, 1,
-1.01323, 1.244892, -1.463949, 0.9960784, 1, 0, 1,
-0.9999598, 0.2377261, -1.222908, 0.9921569, 1, 0, 1,
-0.9989495, -1.736396, -4.310718, 0.9843137, 1, 0, 1,
-0.997297, 0.6576843, -1.977819, 0.9803922, 1, 0, 1,
-0.9834929, -0.2675529, -3.312098, 0.972549, 1, 0, 1,
-0.974429, 1.341758, -1.816014, 0.9686275, 1, 0, 1,
-0.9707707, 0.241449, -1.332702, 0.9607843, 1, 0, 1,
-0.9704056, -1.026053, -3.427092, 0.9568627, 1, 0, 1,
-0.9698825, -1.022814, -2.592382, 0.9490196, 1, 0, 1,
-0.9617295, 0.7733989, -0.6072064, 0.945098, 1, 0, 1,
-0.9542479, -0.3104879, -1.406426, 0.9372549, 1, 0, 1,
-0.9492902, -1.134132, -1.510249, 0.9333333, 1, 0, 1,
-0.9467856, 0.7063146, -0.9613517, 0.9254902, 1, 0, 1,
-0.9431572, -0.9766432, -2.263, 0.9215686, 1, 0, 1,
-0.9410916, 0.4059176, -0.3769996, 0.9137255, 1, 0, 1,
-0.9400511, 1.671266, 0.3661197, 0.9098039, 1, 0, 1,
-0.9399536, -0.9627739, -1.072698, 0.9019608, 1, 0, 1,
-0.9363371, -0.4785503, -2.118762, 0.8941177, 1, 0, 1,
-0.9308389, -0.05066332, -1.447362, 0.8901961, 1, 0, 1,
-0.9173998, 1.271048, -1.205708, 0.8823529, 1, 0, 1,
-0.9144189, 1.562824, -0.602438, 0.8784314, 1, 0, 1,
-0.9124206, -1.686816, -2.97261, 0.8705882, 1, 0, 1,
-0.9110802, 1.24154, 0.5264702, 0.8666667, 1, 0, 1,
-0.909104, -1.089786, -1.659662, 0.8588235, 1, 0, 1,
-0.9047419, 0.6857054, 2.111605, 0.854902, 1, 0, 1,
-0.901652, 0.2203346, -1.823381, 0.8470588, 1, 0, 1,
-0.9003355, -0.2522095, -2.799072, 0.8431373, 1, 0, 1,
-0.8993638, -2.103719, -3.335063, 0.8352941, 1, 0, 1,
-0.8987034, 1.548062, -2.390616, 0.8313726, 1, 0, 1,
-0.8940719, 0.3509894, -0.6929515, 0.8235294, 1, 0, 1,
-0.8933726, 0.4670678, 0.02589466, 0.8196079, 1, 0, 1,
-0.8847473, -1.899141, -1.709028, 0.8117647, 1, 0, 1,
-0.884513, 0.7970095, -0.4498751, 0.8078431, 1, 0, 1,
-0.8837374, 0.09071673, -2.119344, 0.8, 1, 0, 1,
-0.8836792, 0.01152782, -2.692751, 0.7921569, 1, 0, 1,
-0.8835733, -0.354699, -1.658501, 0.7882353, 1, 0, 1,
-0.8826686, -0.7628239, -2.254392, 0.7803922, 1, 0, 1,
-0.882341, -0.5589271, -4.671334, 0.7764706, 1, 0, 1,
-0.8769085, 1.118037, -0.1407751, 0.7686275, 1, 0, 1,
-0.8725449, 0.8673918, -0.5774614, 0.7647059, 1, 0, 1,
-0.8692298, 0.2189865, 0.1174657, 0.7568628, 1, 0, 1,
-0.8616134, 0.8478378, -0.8108409, 0.7529412, 1, 0, 1,
-0.8461294, 1.205325, -1.983353, 0.7450981, 1, 0, 1,
-0.8403697, 0.3323387, -0.9683779, 0.7411765, 1, 0, 1,
-0.8358057, -0.8933703, -2.98136, 0.7333333, 1, 0, 1,
-0.8336413, 0.4866135, -0.4657975, 0.7294118, 1, 0, 1,
-0.8318282, 0.221948, -1.649265, 0.7215686, 1, 0, 1,
-0.8267641, 0.7838497, -0.3021642, 0.7176471, 1, 0, 1,
-0.8249274, -0.2309481, -0.8489866, 0.7098039, 1, 0, 1,
-0.8240113, 0.2516285, -1.918395, 0.7058824, 1, 0, 1,
-0.8236411, 1.169778, -1.732296, 0.6980392, 1, 0, 1,
-0.8139622, -0.4263201, -2.20092, 0.6901961, 1, 0, 1,
-0.8129097, -0.06944279, -1.256431, 0.6862745, 1, 0, 1,
-0.8083145, -1.052885, -2.470288, 0.6784314, 1, 0, 1,
-0.8081406, 0.262295, -2.407436, 0.6745098, 1, 0, 1,
-0.8073493, 0.4014085, -2.727453, 0.6666667, 1, 0, 1,
-0.7979611, -0.2265862, -2.552022, 0.6627451, 1, 0, 1,
-0.7962134, 1.901722, -0.5250819, 0.654902, 1, 0, 1,
-0.7900402, -0.4906905, -1.287675, 0.6509804, 1, 0, 1,
-0.7822183, -0.9987442, -3.609364, 0.6431373, 1, 0, 1,
-0.7811629, -0.9283722, -4.523996, 0.6392157, 1, 0, 1,
-0.7792404, -0.8317412, -3.11935, 0.6313726, 1, 0, 1,
-0.7743026, -1.090188, -3.139787, 0.627451, 1, 0, 1,
-0.7680128, -0.1650868, -1.589986, 0.6196079, 1, 0, 1,
-0.7671897, -1.617119, -1.572188, 0.6156863, 1, 0, 1,
-0.7670588, 0.7946479, -1.255809, 0.6078432, 1, 0, 1,
-0.7545796, 0.3648292, -2.498432, 0.6039216, 1, 0, 1,
-0.7515271, 0.06248445, -0.8342699, 0.5960785, 1, 0, 1,
-0.7459612, 0.9968486, -2.668514, 0.5882353, 1, 0, 1,
-0.7457739, 0.4577203, -1.651597, 0.5843138, 1, 0, 1,
-0.7410598, -1.736877, -5.158845, 0.5764706, 1, 0, 1,
-0.7357479, 0.3949455, -0.8646637, 0.572549, 1, 0, 1,
-0.7356027, 0.5637912, -0.9878812, 0.5647059, 1, 0, 1,
-0.7316232, 1.064556, -0.6076819, 0.5607843, 1, 0, 1,
-0.726941, -0.1719311, -1.275634, 0.5529412, 1, 0, 1,
-0.7219627, -0.4339187, -2.655029, 0.5490196, 1, 0, 1,
-0.7214738, -1.243939, -2.184325, 0.5411765, 1, 0, 1,
-0.7201781, -0.650519, -1.175037, 0.5372549, 1, 0, 1,
-0.7181519, -0.07416142, -0.4892163, 0.5294118, 1, 0, 1,
-0.7177653, 0.3348227, -1.663467, 0.5254902, 1, 0, 1,
-0.7136242, 2.190475, 0.7606506, 0.5176471, 1, 0, 1,
-0.7074766, -2.002115, -3.129541, 0.5137255, 1, 0, 1,
-0.7023926, -0.9498771, -1.878226, 0.5058824, 1, 0, 1,
-0.6951036, 0.1462412, -0.6047015, 0.5019608, 1, 0, 1,
-0.6911333, -0.3568475, -1.303313, 0.4941176, 1, 0, 1,
-0.688217, 0.02384829, -1.848771, 0.4862745, 1, 0, 1,
-0.6856275, 0.9323664, -1.500605, 0.4823529, 1, 0, 1,
-0.6777133, 0.3836716, -0.7933229, 0.4745098, 1, 0, 1,
-0.6766086, -1.0146, -4.387802, 0.4705882, 1, 0, 1,
-0.676559, -1.306582, -2.888844, 0.4627451, 1, 0, 1,
-0.6635793, -0.8299995, -2.370516, 0.4588235, 1, 0, 1,
-0.6613231, -0.8738464, -1.888483, 0.4509804, 1, 0, 1,
-0.6609058, -1.186361, -1.631217, 0.4470588, 1, 0, 1,
-0.6588923, -0.544579, -1.793107, 0.4392157, 1, 0, 1,
-0.6545978, -0.5786507, -1.714614, 0.4352941, 1, 0, 1,
-0.6543327, 0.3782424, 0.07945862, 0.427451, 1, 0, 1,
-0.6517712, -0.1581489, -2.196257, 0.4235294, 1, 0, 1,
-0.6509339, -1.47832, -3.343291, 0.4156863, 1, 0, 1,
-0.649761, 0.3240682, -2.1777, 0.4117647, 1, 0, 1,
-0.6430356, -1.81707, -1.663401, 0.4039216, 1, 0, 1,
-0.6426094, 1.173452, -0.4805253, 0.3960784, 1, 0, 1,
-0.6370676, 1.258875, 0.2499164, 0.3921569, 1, 0, 1,
-0.6347515, 0.6560048, -2.563797, 0.3843137, 1, 0, 1,
-0.6322682, -1.753343, -2.46817, 0.3803922, 1, 0, 1,
-0.6315013, -0.04049592, -0.7356046, 0.372549, 1, 0, 1,
-0.6306003, -1.044318, -3.541386, 0.3686275, 1, 0, 1,
-0.6298957, 0.9611209, -0.2216636, 0.3607843, 1, 0, 1,
-0.624518, 0.793897, -0.4675917, 0.3568628, 1, 0, 1,
-0.621692, -0.669628, -2.218041, 0.3490196, 1, 0, 1,
-0.6216268, 0.2744488, 0.4465671, 0.345098, 1, 0, 1,
-0.6209186, 1.490527, -1.284457, 0.3372549, 1, 0, 1,
-0.6208089, -0.4393484, -2.923686, 0.3333333, 1, 0, 1,
-0.6193322, -1.19523, -2.005277, 0.3254902, 1, 0, 1,
-0.6134295, 0.8184917, 0.8480764, 0.3215686, 1, 0, 1,
-0.6134012, 0.161819, -1.352209, 0.3137255, 1, 0, 1,
-0.6058429, -0.1716089, -1.510497, 0.3098039, 1, 0, 1,
-0.6057403, -2.112075, -4.193406, 0.3019608, 1, 0, 1,
-0.6050617, 0.9121462, -0.4449583, 0.2941177, 1, 0, 1,
-0.6017015, -1.193902, -2.852069, 0.2901961, 1, 0, 1,
-0.6007384, 1.718897, -0.9162663, 0.282353, 1, 0, 1,
-0.5971941, 0.9536719, 0.1830281, 0.2784314, 1, 0, 1,
-0.5918117, -1.063109, -3.249713, 0.2705882, 1, 0, 1,
-0.5884384, 0.283424, -1.035228, 0.2666667, 1, 0, 1,
-0.5826066, 0.2654469, -1.540951, 0.2588235, 1, 0, 1,
-0.5822244, -0.9758345, -2.121187, 0.254902, 1, 0, 1,
-0.5816991, -0.2682254, -2.712689, 0.2470588, 1, 0, 1,
-0.575628, -0.3292356, -0.3417421, 0.2431373, 1, 0, 1,
-0.5730038, 0.7416435, 0.1125662, 0.2352941, 1, 0, 1,
-0.5655811, 0.173467, -1.762455, 0.2313726, 1, 0, 1,
-0.5476883, 0.6658627, 0.953613, 0.2235294, 1, 0, 1,
-0.545647, -1.016435, -2.308879, 0.2196078, 1, 0, 1,
-0.5421693, 0.6880642, -0.3506989, 0.2117647, 1, 0, 1,
-0.541427, 1.081257, -1.677442, 0.2078431, 1, 0, 1,
-0.5412367, -1.782492, -3.252472, 0.2, 1, 0, 1,
-0.5407422, -0.9947861, -2.14908, 0.1921569, 1, 0, 1,
-0.5407414, -1.171645, -2.46729, 0.1882353, 1, 0, 1,
-0.5387664, -1.568848, -2.335411, 0.1803922, 1, 0, 1,
-0.5377801, 0.8878374, -0.8303319, 0.1764706, 1, 0, 1,
-0.5359847, -1.782402, -3.871262, 0.1686275, 1, 0, 1,
-0.533918, 0.1682629, -1.532586, 0.1647059, 1, 0, 1,
-0.5331787, -0.3432463, -3.197903, 0.1568628, 1, 0, 1,
-0.5315814, -1.407769, -2.00647, 0.1529412, 1, 0, 1,
-0.5314899, 0.1497188, -1.530997, 0.145098, 1, 0, 1,
-0.5289718, -0.6056967, -1.950714, 0.1411765, 1, 0, 1,
-0.5266911, 0.824633, 1.526723, 0.1333333, 1, 0, 1,
-0.5254031, -0.6914066, -2.232534, 0.1294118, 1, 0, 1,
-0.5227355, 0.5689775, -0.4883283, 0.1215686, 1, 0, 1,
-0.5164378, 0.1903918, -0.2833798, 0.1176471, 1, 0, 1,
-0.5162087, -0.2313262, -3.254441, 0.1098039, 1, 0, 1,
-0.5157922, 1.141174, -0.3366151, 0.1058824, 1, 0, 1,
-0.5111686, -1.007041, -3.531232, 0.09803922, 1, 0, 1,
-0.509074, -0.09861036, -1.253631, 0.09019608, 1, 0, 1,
-0.5070663, -0.1232189, -1.382912, 0.08627451, 1, 0, 1,
-0.5005695, -1.098701, -1.606254, 0.07843138, 1, 0, 1,
-0.5001326, -0.6790726, -3.010532, 0.07450981, 1, 0, 1,
-0.496379, 1.221107, -1.821328, 0.06666667, 1, 0, 1,
-0.490924, 0.9017154, -0.9583099, 0.0627451, 1, 0, 1,
-0.4875347, 0.1679453, -2.26776, 0.05490196, 1, 0, 1,
-0.4834373, -1.228672, -4.510297, 0.05098039, 1, 0, 1,
-0.4819098, 0.9854574, -2.387064, 0.04313726, 1, 0, 1,
-0.4780395, -1.613062, -0.8477684, 0.03921569, 1, 0, 1,
-0.4762844, -0.388386, -2.04722, 0.03137255, 1, 0, 1,
-0.4742038, -0.8386519, -3.612764, 0.02745098, 1, 0, 1,
-0.4727685, -0.9376755, -1.696228, 0.01960784, 1, 0, 1,
-0.4727392, 0.8524171, 0.1751319, 0.01568628, 1, 0, 1,
-0.4705293, -0.1110287, -2.825682, 0.007843138, 1, 0, 1,
-0.4703154, 1.693873, 0.5054258, 0.003921569, 1, 0, 1,
-0.4698096, -1.559298, -4.524165, 0, 1, 0.003921569, 1,
-0.4682709, 1.138801, 0.1253276, 0, 1, 0.01176471, 1,
-0.4619899, -1.024081, -1.483103, 0, 1, 0.01568628, 1,
-0.458509, -0.3764989, -1.765042, 0, 1, 0.02352941, 1,
-0.4558838, -0.7479623, -3.203836, 0, 1, 0.02745098, 1,
-0.4537805, 0.4813898, -0.9801809, 0, 1, 0.03529412, 1,
-0.4534299, -2.208732, -2.750108, 0, 1, 0.03921569, 1,
-0.4525399, -0.01546901, -2.699373, 0, 1, 0.04705882, 1,
-0.4492315, 2.059021, 0.6382968, 0, 1, 0.05098039, 1,
-0.4450535, -0.2966421, -2.522171, 0, 1, 0.05882353, 1,
-0.4392905, 0.4692163, -1.727602, 0, 1, 0.0627451, 1,
-0.4381289, 0.0850731, -2.550379, 0, 1, 0.07058824, 1,
-0.4299999, -0.4166739, -1.945868, 0, 1, 0.07450981, 1,
-0.4268431, -2.000834, -2.191687, 0, 1, 0.08235294, 1,
-0.4257809, -0.1001914, -1.235762, 0, 1, 0.08627451, 1,
-0.4238489, -0.3501012, 0.06478773, 0, 1, 0.09411765, 1,
-0.4236813, -0.3373361, -1.82888, 0, 1, 0.1019608, 1,
-0.4211038, 0.1182542, -1.601555, 0, 1, 0.1058824, 1,
-0.418674, -1.065839, -1.676105, 0, 1, 0.1137255, 1,
-0.4166205, -1.072343, -2.894494, 0, 1, 0.1176471, 1,
-0.4153758, -0.3425672, -0.7696511, 0, 1, 0.1254902, 1,
-0.4119992, -0.973716, -2.300735, 0, 1, 0.1294118, 1,
-0.4092504, -0.4044048, -3.448042, 0, 1, 0.1372549, 1,
-0.3997632, -0.5121695, -2.784458, 0, 1, 0.1411765, 1,
-0.3929394, 0.08904418, -0.8994942, 0, 1, 0.1490196, 1,
-0.3896509, 0.0806223, -2.203818, 0, 1, 0.1529412, 1,
-0.3861177, 0.4498103, -1.482581, 0, 1, 0.1607843, 1,
-0.3857882, 0.6570476, -1.683689, 0, 1, 0.1647059, 1,
-0.3852095, -1.053221, -1.689971, 0, 1, 0.172549, 1,
-0.3789723, -0.6625546, -2.623171, 0, 1, 0.1764706, 1,
-0.3747042, 0.4932703, 0.8179864, 0, 1, 0.1843137, 1,
-0.3738014, 0.7842181, -1.16813, 0, 1, 0.1882353, 1,
-0.3693256, -0.6012317, -2.657961, 0, 1, 0.1960784, 1,
-0.3661807, 0.2828671, -2.509996, 0, 1, 0.2039216, 1,
-0.3521727, -0.5059927, -1.014773, 0, 1, 0.2078431, 1,
-0.3517315, 0.343931, 1.627709, 0, 1, 0.2156863, 1,
-0.3504845, -0.704697, -3.537112, 0, 1, 0.2196078, 1,
-0.3476843, 0.1572113, 0.9758738, 0, 1, 0.227451, 1,
-0.3458698, -0.1774011, -2.550363, 0, 1, 0.2313726, 1,
-0.3455659, -1.021714, -2.334944, 0, 1, 0.2392157, 1,
-0.3452857, -0.1390573, -1.612247, 0, 1, 0.2431373, 1,
-0.3388163, -0.3418913, -1.840654, 0, 1, 0.2509804, 1,
-0.3381954, 1.077655, 0.132212, 0, 1, 0.254902, 1,
-0.335298, 0.3657044, -1.61249, 0, 1, 0.2627451, 1,
-0.3347874, 0.2796294, 0.2074939, 0, 1, 0.2666667, 1,
-0.333525, -0.7956331, -2.476702, 0, 1, 0.2745098, 1,
-0.330596, 2.792475, 1.310658, 0, 1, 0.2784314, 1,
-0.3303455, -0.5153731, -3.009001, 0, 1, 0.2862745, 1,
-0.3302078, -0.6844645, -4.293488, 0, 1, 0.2901961, 1,
-0.3259671, -0.8598572, -2.072931, 0, 1, 0.2980392, 1,
-0.3200866, 0.004643868, -2.121136, 0, 1, 0.3058824, 1,
-0.3163689, 1.522217, 0.8790047, 0, 1, 0.3098039, 1,
-0.3159439, -0.6016101, -5.10633, 0, 1, 0.3176471, 1,
-0.311911, -1.668007, -3.027914, 0, 1, 0.3215686, 1,
-0.310437, -0.008430107, -0.8925363, 0, 1, 0.3294118, 1,
-0.3085824, 0.4005306, -0.3405193, 0, 1, 0.3333333, 1,
-0.3068173, -0.2493036, -3.670765, 0, 1, 0.3411765, 1,
-0.3059026, 2.446906, -0.01811987, 0, 1, 0.345098, 1,
-0.3001824, 1.155834, 0.02962505, 0, 1, 0.3529412, 1,
-0.2999043, -1.529909, -3.670765, 0, 1, 0.3568628, 1,
-0.2970954, 0.7442955, -0.7965686, 0, 1, 0.3647059, 1,
-0.2955098, 1.356316, -0.3869087, 0, 1, 0.3686275, 1,
-0.2921685, 0.5555493, -0.07280815, 0, 1, 0.3764706, 1,
-0.2912536, 0.7835433, -0.08493616, 0, 1, 0.3803922, 1,
-0.2904647, -1.896116, -2.607559, 0, 1, 0.3882353, 1,
-0.290387, 0.0405265, -1.314279, 0, 1, 0.3921569, 1,
-0.290081, 0.1359688, -0.6656063, 0, 1, 0.4, 1,
-0.2803652, -0.5121664, -2.257954, 0, 1, 0.4078431, 1,
-0.2792981, 1.169215, -2.680454, 0, 1, 0.4117647, 1,
-0.2776057, 1.846436, -0.9817669, 0, 1, 0.4196078, 1,
-0.2761812, 0.8067945, -0.7996255, 0, 1, 0.4235294, 1,
-0.2752301, -1.792537, -2.734877, 0, 1, 0.4313726, 1,
-0.2698952, 0.2194642, -0.7803551, 0, 1, 0.4352941, 1,
-0.2691609, 0.6662115, -0.6957892, 0, 1, 0.4431373, 1,
-0.265836, -0.2762095, -4.026852, 0, 1, 0.4470588, 1,
-0.2646571, 0.09056084, -2.546774, 0, 1, 0.454902, 1,
-0.2637654, -0.1816858, -2.038127, 0, 1, 0.4588235, 1,
-0.2635582, -0.8333143, -1.679385, 0, 1, 0.4666667, 1,
-0.2632964, -0.641332, -3.329793, 0, 1, 0.4705882, 1,
-0.2632003, 0.8201905, -2.176648, 0, 1, 0.4784314, 1,
-0.2591394, 0.2239967, -0.4521173, 0, 1, 0.4823529, 1,
-0.2549061, -2.048883, -3.42693, 0, 1, 0.4901961, 1,
-0.2544363, -0.9090255, -1.135518, 0, 1, 0.4941176, 1,
-0.2478528, -0.2437969, -3.430861, 0, 1, 0.5019608, 1,
-0.2469019, 0.2475548, 0.7341689, 0, 1, 0.509804, 1,
-0.2366603, 0.6465164, -1.275914, 0, 1, 0.5137255, 1,
-0.2364984, -0.5185943, -0.8625161, 0, 1, 0.5215687, 1,
-0.2354648, -0.5863469, -2.64473, 0, 1, 0.5254902, 1,
-0.2339789, 0.486353, 1.10899, 0, 1, 0.5333334, 1,
-0.2283209, 0.7931346, 1.176424, 0, 1, 0.5372549, 1,
-0.2280963, 1.231884, 0.6656484, 0, 1, 0.5450981, 1,
-0.2205503, -0.7911851, -3.062222, 0, 1, 0.5490196, 1,
-0.2140602, -1.685926, -3.160459, 0, 1, 0.5568628, 1,
-0.2085719, 1.002518, -0.463042, 0, 1, 0.5607843, 1,
-0.2081162, 1.742487, -1.827094, 0, 1, 0.5686275, 1,
-0.2058488, 0.3367061, -0.1328802, 0, 1, 0.572549, 1,
-0.1948173, -1.692806, -3.347883, 0, 1, 0.5803922, 1,
-0.1934898, -0.4947506, -2.841978, 0, 1, 0.5843138, 1,
-0.1891575, 2.532332, -0.4155094, 0, 1, 0.5921569, 1,
-0.1888518, 0.4348396, 0.2920063, 0, 1, 0.5960785, 1,
-0.1840358, 1.109443, 0.7817712, 0, 1, 0.6039216, 1,
-0.1834219, -0.3427011, -2.196612, 0, 1, 0.6117647, 1,
-0.1819674, -1.142681, -3.184369, 0, 1, 0.6156863, 1,
-0.1813649, -0.5103509, -2.24818, 0, 1, 0.6235294, 1,
-0.1788292, 0.3239782, -2.050021, 0, 1, 0.627451, 1,
-0.1768278, 1.266179, -0.07160155, 0, 1, 0.6352941, 1,
-0.1727047, 0.8818576, -0.6570223, 0, 1, 0.6392157, 1,
-0.1683389, 0.0919394, -2.01993, 0, 1, 0.6470588, 1,
-0.161673, 0.5479699, 0.2208718, 0, 1, 0.6509804, 1,
-0.1610552, -0.6230745, -2.880899, 0, 1, 0.6588235, 1,
-0.1587284, 0.5125934, -0.7271183, 0, 1, 0.6627451, 1,
-0.1581981, 0.06468033, -1.315607, 0, 1, 0.6705883, 1,
-0.1576598, -1.703597, -2.376226, 0, 1, 0.6745098, 1,
-0.148348, -0.7625797, -4.285707, 0, 1, 0.682353, 1,
-0.1454863, 0.9005045, -1.155341, 0, 1, 0.6862745, 1,
-0.1432987, 0.04041096, -0.9204986, 0, 1, 0.6941177, 1,
-0.1401989, 0.03928553, -0.1989005, 0, 1, 0.7019608, 1,
-0.1349906, -0.536364, -3.623479, 0, 1, 0.7058824, 1,
-0.1340581, 0.7549804, -0.7663063, 0, 1, 0.7137255, 1,
-0.1292823, -1.146804, -1.999514, 0, 1, 0.7176471, 1,
-0.1257342, 1.014126, -0.8191088, 0, 1, 0.7254902, 1,
-0.1235792, 0.6731117, 0.05863633, 0, 1, 0.7294118, 1,
-0.1227022, -0.1482035, -2.489017, 0, 1, 0.7372549, 1,
-0.1215518, 0.6226265, -1.567676, 0, 1, 0.7411765, 1,
-0.1177044, -0.2765536, -3.435233, 0, 1, 0.7490196, 1,
-0.1161915, 0.7255846, 0.4883596, 0, 1, 0.7529412, 1,
-0.1129675, -0.3147116, -2.077484, 0, 1, 0.7607843, 1,
-0.111836, -0.2277651, -2.691294, 0, 1, 0.7647059, 1,
-0.110838, -0.2786539, -4.74719, 0, 1, 0.772549, 1,
-0.1063689, 1.205126, 1.173165, 0, 1, 0.7764706, 1,
-0.1026247, -0.08830392, -1.684078, 0, 1, 0.7843137, 1,
-0.09782893, -0.8998468, -1.562254, 0, 1, 0.7882353, 1,
-0.09748692, -1.220549, -2.244767, 0, 1, 0.7960784, 1,
-0.09595606, -0.8614826, -2.365406, 0, 1, 0.8039216, 1,
-0.09573588, 1.247643, -1.773066, 0, 1, 0.8078431, 1,
-0.09543166, -0.2693429, -2.269656, 0, 1, 0.8156863, 1,
-0.09441707, -1.027208, -2.808125, 0, 1, 0.8196079, 1,
-0.09414826, -0.1368348, -0.9179633, 0, 1, 0.827451, 1,
-0.0905697, 0.6834347, 0.1030885, 0, 1, 0.8313726, 1,
-0.08298453, -0.5951913, -4.538027, 0, 1, 0.8392157, 1,
-0.07861664, 0.3369688, -1.149376, 0, 1, 0.8431373, 1,
-0.07203588, -0.4156575, -1.775985, 0, 1, 0.8509804, 1,
-0.06973815, 0.9429057, 1.245029, 0, 1, 0.854902, 1,
-0.06904019, 0.6335605, -0.1465591, 0, 1, 0.8627451, 1,
-0.06835134, -1.245855, -2.761937, 0, 1, 0.8666667, 1,
-0.06812441, -1.472555, -0.8388714, 0, 1, 0.8745098, 1,
-0.06126933, 0.1407849, -1.343579, 0, 1, 0.8784314, 1,
-0.05854267, -0.1205496, -3.494828, 0, 1, 0.8862745, 1,
-0.05785771, 0.4869635, 0.40775, 0, 1, 0.8901961, 1,
-0.05657024, 1.323369, -1.506957, 0, 1, 0.8980392, 1,
-0.05576102, 0.4258127, 1.370691, 0, 1, 0.9058824, 1,
-0.05323213, -0.6053964, -2.160733, 0, 1, 0.9098039, 1,
-0.05010328, -0.4770336, -3.311245, 0, 1, 0.9176471, 1,
-0.04963809, -1.457152, -3.401196, 0, 1, 0.9215686, 1,
-0.048956, 0.4700559, -1.591151, 0, 1, 0.9294118, 1,
-0.04788302, 1.743471, 1.215365, 0, 1, 0.9333333, 1,
-0.04678474, 0.2751132, 0.424338, 0, 1, 0.9411765, 1,
-0.04584278, -1.59575, -1.85699, 0, 1, 0.945098, 1,
-0.04564133, -1.537243, -3.975201, 0, 1, 0.9529412, 1,
-0.04467607, -1.399602, -3.748168, 0, 1, 0.9568627, 1,
-0.04245419, 0.8239189, -0.8549944, 0, 1, 0.9647059, 1,
-0.03723727, -1.089072, -2.53666, 0, 1, 0.9686275, 1,
-0.02956711, 0.9162443, 0.3214391, 0, 1, 0.9764706, 1,
-0.02608936, 1.725399, -0.3948247, 0, 1, 0.9803922, 1,
-0.02406471, -0.2007876, -2.061331, 0, 1, 0.9882353, 1,
-0.01849357, 0.421652, -0.6466239, 0, 1, 0.9921569, 1,
-0.01793553, 0.1711914, 1.410188, 0, 1, 1, 1,
-0.0173336, -2.072504, -2.32067, 0, 0.9921569, 1, 1,
-0.007449878, 0.005794479, -0.7185416, 0, 0.9882353, 1, 1,
-0.007032912, 0.1786167, -1.866929, 0, 0.9803922, 1, 1,
-0.00664386, -1.988276, -3.464529, 0, 0.9764706, 1, 1,
0.001946227, -1.505468, 2.308308, 0, 0.9686275, 1, 1,
0.002041857, -1.031924, 2.75264, 0, 0.9647059, 1, 1,
0.006815346, 1.576797, -0.02962014, 0, 0.9568627, 1, 1,
0.007396044, -1.050743, 2.531134, 0, 0.9529412, 1, 1,
0.007929813, 0.6704174, 1.356719, 0, 0.945098, 1, 1,
0.009514909, 2.027607, 0.6333076, 0, 0.9411765, 1, 1,
0.01066018, 2.037587, 0.06151944, 0, 0.9333333, 1, 1,
0.01856481, 0.5796854, 0.3617618, 0, 0.9294118, 1, 1,
0.01868835, 1.234915, 2.051459, 0, 0.9215686, 1, 1,
0.02280635, -1.320373, 3.566496, 0, 0.9176471, 1, 1,
0.02554438, -1.191558, 3.580331, 0, 0.9098039, 1, 1,
0.02884081, -0.04373297, 2.896739, 0, 0.9058824, 1, 1,
0.02946449, 0.3584094, -0.1943469, 0, 0.8980392, 1, 1,
0.03272495, 0.2383441, 0.9417126, 0, 0.8901961, 1, 1,
0.03441531, -0.2636899, 3.158248, 0, 0.8862745, 1, 1,
0.03683008, 0.5148534, 1.298938, 0, 0.8784314, 1, 1,
0.0395206, -0.8906253, 2.522088, 0, 0.8745098, 1, 1,
0.03994518, 1.002763, 1.883337, 0, 0.8666667, 1, 1,
0.040556, 0.397916, 0.3640473, 0, 0.8627451, 1, 1,
0.04265766, -0.8768352, 4.122977, 0, 0.854902, 1, 1,
0.04580368, -0.22709, 2.696056, 0, 0.8509804, 1, 1,
0.04892908, -0.2037401, 2.724963, 0, 0.8431373, 1, 1,
0.05152473, 1.249766, -0.2444463, 0, 0.8392157, 1, 1,
0.05379312, -0.7492374, 2.683358, 0, 0.8313726, 1, 1,
0.05543315, -0.2911757, 3.816438, 0, 0.827451, 1, 1,
0.05932984, -0.04051409, 1.460871, 0, 0.8196079, 1, 1,
0.05947296, 0.2736331, 0.7051122, 0, 0.8156863, 1, 1,
0.06119259, 0.2259098, 0.9014319, 0, 0.8078431, 1, 1,
0.06545987, -0.2761329, 4.602918, 0, 0.8039216, 1, 1,
0.0677001, -0.2048988, 3.527822, 0, 0.7960784, 1, 1,
0.07049648, 1.164881, 0.2446146, 0, 0.7882353, 1, 1,
0.07452889, -0.7344552, 2.447242, 0, 0.7843137, 1, 1,
0.07480833, -6.5457e-05, 0.8717389, 0, 0.7764706, 1, 1,
0.07481305, -1.388078, 2.85993, 0, 0.772549, 1, 1,
0.07540345, 1.316091, 0.6619157, 0, 0.7647059, 1, 1,
0.07920591, 0.4962073, 0.613892, 0, 0.7607843, 1, 1,
0.08007455, 0.1926456, -0.227984, 0, 0.7529412, 1, 1,
0.08066586, 0.9464291, -1.75925, 0, 0.7490196, 1, 1,
0.08095275, -0.4027591, 2.435133, 0, 0.7411765, 1, 1,
0.08309005, 0.9725753, -0.7993447, 0, 0.7372549, 1, 1,
0.08435691, -1.553586, 3.138995, 0, 0.7294118, 1, 1,
0.08478764, 0.7283019, 0.8463641, 0, 0.7254902, 1, 1,
0.08634322, 0.6570146, -0.2080416, 0, 0.7176471, 1, 1,
0.09099758, -1.936844, 1.995798, 0, 0.7137255, 1, 1,
0.09287751, 1.023534, 0.4898955, 0, 0.7058824, 1, 1,
0.09593513, -0.3322471, 0.8466848, 0, 0.6980392, 1, 1,
0.09596148, 0.5481427, -1.583056, 0, 0.6941177, 1, 1,
0.1016179, -1.948874, 0.6669807, 0, 0.6862745, 1, 1,
0.1036219, -1.07066, 3.681577, 0, 0.682353, 1, 1,
0.1056201, 1.984264, 1.73268, 0, 0.6745098, 1, 1,
0.1101356, 0.7298445, -0.2484918, 0, 0.6705883, 1, 1,
0.1131082, 0.1283466, 1.974386, 0, 0.6627451, 1, 1,
0.1149129, 0.4714839, 0.05887225, 0, 0.6588235, 1, 1,
0.117574, -1.203152, 2.776332, 0, 0.6509804, 1, 1,
0.1186691, 1.18762, 0.3367319, 0, 0.6470588, 1, 1,
0.1238718, 0.4734551, -0.2421111, 0, 0.6392157, 1, 1,
0.1264609, 0.3516572, 2.287134, 0, 0.6352941, 1, 1,
0.130775, 0.1439642, 0.8964825, 0, 0.627451, 1, 1,
0.1337164, 0.3463733, 0.3752804, 0, 0.6235294, 1, 1,
0.1378183, 0.4137779, 1.204365, 0, 0.6156863, 1, 1,
0.1381036, -0.6441358, 2.940901, 0, 0.6117647, 1, 1,
0.138774, 0.2598083, 1.208721, 0, 0.6039216, 1, 1,
0.1406631, -0.4623127, 1.313534, 0, 0.5960785, 1, 1,
0.1411073, -0.4720069, 2.393707, 0, 0.5921569, 1, 1,
0.1423328, 0.6704177, -0.1297873, 0, 0.5843138, 1, 1,
0.1456679, 0.6550739, -1.231836, 0, 0.5803922, 1, 1,
0.1463892, 0.3237602, 0.6951425, 0, 0.572549, 1, 1,
0.1492391, 0.1342797, -0.08677283, 0, 0.5686275, 1, 1,
0.1506839, 0.5219848, -0.8536301, 0, 0.5607843, 1, 1,
0.1520682, 0.8972952, 0.7587031, 0, 0.5568628, 1, 1,
0.1528587, -0.2913611, 2.589515, 0, 0.5490196, 1, 1,
0.1535653, -1.136292, 1.002851, 0, 0.5450981, 1, 1,
0.1556462, -0.8317634, 2.657561, 0, 0.5372549, 1, 1,
0.1570847, -2.775708, 0.9924429, 0, 0.5333334, 1, 1,
0.1576281, -0.5631297, 3.851504, 0, 0.5254902, 1, 1,
0.1599447, 1.867043, -1.886408, 0, 0.5215687, 1, 1,
0.1624668, -0.8603389, 1.833229, 0, 0.5137255, 1, 1,
0.1631109, -1.349362, 4.108644, 0, 0.509804, 1, 1,
0.1644052, 0.9673203, -1.124278, 0, 0.5019608, 1, 1,
0.1705817, 0.1985275, 0.4905908, 0, 0.4941176, 1, 1,
0.17339, -0.8086279, 0.9467296, 0, 0.4901961, 1, 1,
0.1752213, -0.709231, 2.031213, 0, 0.4823529, 1, 1,
0.1783618, 1.365739, -1.102095, 0, 0.4784314, 1, 1,
0.1784554, -1.755539, 2.310877, 0, 0.4705882, 1, 1,
0.1813099, -1.52756, 2.544362, 0, 0.4666667, 1, 1,
0.1823463, 0.9074925, 1.760612, 0, 0.4588235, 1, 1,
0.1887721, 1.02119, 0.1860049, 0, 0.454902, 1, 1,
0.189371, -1.164998, 3.553741, 0, 0.4470588, 1, 1,
0.1904216, 0.07849148, -0.1896906, 0, 0.4431373, 1, 1,
0.1910532, -0.6208996, 2.868479, 0, 0.4352941, 1, 1,
0.1929211, 0.3244761, 0.6147938, 0, 0.4313726, 1, 1,
0.1948702, 0.4472349, 0.3837859, 0, 0.4235294, 1, 1,
0.1992968, 0.2090292, 0.07279363, 0, 0.4196078, 1, 1,
0.199937, 2.489361, -0.4068603, 0, 0.4117647, 1, 1,
0.2046454, 0.1703653, 1.352497, 0, 0.4078431, 1, 1,
0.205332, 2.59668, -0.537287, 0, 0.4, 1, 1,
0.2060791, -0.7421441, 2.944857, 0, 0.3921569, 1, 1,
0.2093216, -2.28209, 2.619451, 0, 0.3882353, 1, 1,
0.2141601, 0.7208034, 1.549852, 0, 0.3803922, 1, 1,
0.21418, -0.4589664, 2.258847, 0, 0.3764706, 1, 1,
0.215973, 2.570792, -0.8008242, 0, 0.3686275, 1, 1,
0.2163595, -0.537852, 2.004184, 0, 0.3647059, 1, 1,
0.2185787, 0.6040524, 1.019256, 0, 0.3568628, 1, 1,
0.2199944, -1.720498, 1.467004, 0, 0.3529412, 1, 1,
0.2266767, -0.5277984, 2.606947, 0, 0.345098, 1, 1,
0.2277749, 0.532397, -0.6141684, 0, 0.3411765, 1, 1,
0.2306906, -0.5473086, 1.634025, 0, 0.3333333, 1, 1,
0.231725, 1.69407, 0.04403873, 0, 0.3294118, 1, 1,
0.2372018, 1.188273, 1.455589, 0, 0.3215686, 1, 1,
0.2377891, 1.279505, 0.6009216, 0, 0.3176471, 1, 1,
0.2389862, -1.231623, 1.998825, 0, 0.3098039, 1, 1,
0.2433935, -0.2702355, 1.320114, 0, 0.3058824, 1, 1,
0.2436191, 0.1849554, 1.516446, 0, 0.2980392, 1, 1,
0.2447283, 0.8814674, -1.602606, 0, 0.2901961, 1, 1,
0.2456901, -0.4432682, 3.045192, 0, 0.2862745, 1, 1,
0.2457665, -0.9427227, 2.862828, 0, 0.2784314, 1, 1,
0.2475084, 0.2290374, 2.969073, 0, 0.2745098, 1, 1,
0.2491087, -0.7227234, 4.14712, 0, 0.2666667, 1, 1,
0.252235, 1.610751, 0.2928731, 0, 0.2627451, 1, 1,
0.2556462, 0.7245825, 0.7053902, 0, 0.254902, 1, 1,
0.2605823, 0.6883342, 1.194333, 0, 0.2509804, 1, 1,
0.2660304, -0.5794864, 2.890308, 0, 0.2431373, 1, 1,
0.2663617, -0.6859429, 2.172216, 0, 0.2392157, 1, 1,
0.2714182, 0.8394462, -0.1532048, 0, 0.2313726, 1, 1,
0.283128, -1.498621, 2.940954, 0, 0.227451, 1, 1,
0.287592, -0.3255821, 3.40355, 0, 0.2196078, 1, 1,
0.2898194, 0.2264311, 0.7461737, 0, 0.2156863, 1, 1,
0.2900581, 0.5789937, -0.318366, 0, 0.2078431, 1, 1,
0.2948888, -0.6126055, 2.205832, 0, 0.2039216, 1, 1,
0.2950418, 1.661648, -0.5448353, 0, 0.1960784, 1, 1,
0.3001955, 0.9933647, -0.7100378, 0, 0.1882353, 1, 1,
0.3030034, 0.8001636, 2.092668, 0, 0.1843137, 1, 1,
0.3044171, 0.8863756, 0.6405538, 0, 0.1764706, 1, 1,
0.3069911, 1.152113, 2.457598, 0, 0.172549, 1, 1,
0.3192852, -3.68991, 2.119694, 0, 0.1647059, 1, 1,
0.3205836, -1.746403, 4.061973, 0, 0.1607843, 1, 1,
0.3297395, 0.9099096, 0.7517613, 0, 0.1529412, 1, 1,
0.3315437, -0.7835059, 2.416775, 0, 0.1490196, 1, 1,
0.3328569, 1.955007, 0.9378054, 0, 0.1411765, 1, 1,
0.3366611, -0.3110163, 1.55886, 0, 0.1372549, 1, 1,
0.3367848, -0.4516727, 4.340376, 0, 0.1294118, 1, 1,
0.3437667, -0.06577209, 0.2947227, 0, 0.1254902, 1, 1,
0.3474546, -0.7711293, 2.384748, 0, 0.1176471, 1, 1,
0.3503339, -0.8048911, 2.132008, 0, 0.1137255, 1, 1,
0.3542732, 0.6176715, 0.2473472, 0, 0.1058824, 1, 1,
0.3565288, 0.8801389, 0.2920697, 0, 0.09803922, 1, 1,
0.3571622, 1.505514, -0.7644591, 0, 0.09411765, 1, 1,
0.35803, -0.1597557, 0.9600679, 0, 0.08627451, 1, 1,
0.3580705, 1.77499, -0.06616675, 0, 0.08235294, 1, 1,
0.3594294, -1.185038, 0.3401838, 0, 0.07450981, 1, 1,
0.3598233, 1.600896, -0.1871563, 0, 0.07058824, 1, 1,
0.3601122, 0.8763663, 1.257515, 0, 0.0627451, 1, 1,
0.362483, -0.4476989, 0.7115477, 0, 0.05882353, 1, 1,
0.3743578, -0.303964, 2.266557, 0, 0.05098039, 1, 1,
0.3755543, -1.240335, 1.813005, 0, 0.04705882, 1, 1,
0.3767209, 1.07343, -0.2069226, 0, 0.03921569, 1, 1,
0.3857785, 0.472349, 0.3293642, 0, 0.03529412, 1, 1,
0.3888314, 0.672309, 0.4879015, 0, 0.02745098, 1, 1,
0.3973629, -0.5208403, 2.438725, 0, 0.02352941, 1, 1,
0.3982899, -0.839159, 1.947215, 0, 0.01568628, 1, 1,
0.4055152, -1.179365, 2.001754, 0, 0.01176471, 1, 1,
0.408474, -0.9680562, 1.203271, 0, 0.003921569, 1, 1,
0.4151345, -0.7324916, 2.708625, 0.003921569, 0, 1, 1,
0.4162099, -0.0498264, -0.4573818, 0.007843138, 0, 1, 1,
0.4217774, -1.363602, 3.448686, 0.01568628, 0, 1, 1,
0.4225111, 0.1268807, 3.260185, 0.01960784, 0, 1, 1,
0.4240317, 2.070168, 2.023025, 0.02745098, 0, 1, 1,
0.4291501, -2.658346, 3.513339, 0.03137255, 0, 1, 1,
0.4320071, 2.585402, 0.6987755, 0.03921569, 0, 1, 1,
0.435505, -0.598627, 3.334183, 0.04313726, 0, 1, 1,
0.4374918, -0.1081451, 1.259467, 0.05098039, 0, 1, 1,
0.4415109, -1.511034, 1.942899, 0.05490196, 0, 1, 1,
0.4415121, 2.20037, -0.1649247, 0.0627451, 0, 1, 1,
0.4461766, 0.7403351, 0.8061875, 0.06666667, 0, 1, 1,
0.4508053, -0.7573165, 3.755719, 0.07450981, 0, 1, 1,
0.4525846, -0.6666591, 4.670126, 0.07843138, 0, 1, 1,
0.4536574, 0.22897, 0.9194669, 0.08627451, 0, 1, 1,
0.4541525, -1.487942, 2.781501, 0.09019608, 0, 1, 1,
0.458165, 0.4132423, 1.505268, 0.09803922, 0, 1, 1,
0.460994, -0.02922741, 1.721422, 0.1058824, 0, 1, 1,
0.4622492, 0.2470855, -0.08681303, 0.1098039, 0, 1, 1,
0.4679594, -0.7408615, 1.353522, 0.1176471, 0, 1, 1,
0.4680058, 0.2771387, -2.417793, 0.1215686, 0, 1, 1,
0.4709621, 1.26815, 1.270116, 0.1294118, 0, 1, 1,
0.4729564, -2.621122, 2.729029, 0.1333333, 0, 1, 1,
0.4752855, 0.4199998, 1.071112, 0.1411765, 0, 1, 1,
0.4757569, 1.793051, 0.1588364, 0.145098, 0, 1, 1,
0.4759636, -0.5977663, 2.089883, 0.1529412, 0, 1, 1,
0.4776681, -0.3459319, 3.705494, 0.1568628, 0, 1, 1,
0.4777339, -0.2244597, 2.459246, 0.1647059, 0, 1, 1,
0.4872378, -1.526469, 4.06699, 0.1686275, 0, 1, 1,
0.4893944, -0.2874284, 3.761939, 0.1764706, 0, 1, 1,
0.4900016, -1.072833, 1.745369, 0.1803922, 0, 1, 1,
0.4951308, 0.762915, 1.179241, 0.1882353, 0, 1, 1,
0.4973275, -1.74147, 2.196982, 0.1921569, 0, 1, 1,
0.499666, -1.838722, 2.934268, 0.2, 0, 1, 1,
0.499902, 0.1178409, 0.82187, 0.2078431, 0, 1, 1,
0.4999183, -1.959293, 3.229988, 0.2117647, 0, 1, 1,
0.5011912, -0.3417798, 3.527642, 0.2196078, 0, 1, 1,
0.5029712, 2.292577, 1.106933, 0.2235294, 0, 1, 1,
0.5036023, -0.6888332, 3.390754, 0.2313726, 0, 1, 1,
0.5078149, 0.1273495, 1.022414, 0.2352941, 0, 1, 1,
0.5097652, 0.4858057, 1.323233, 0.2431373, 0, 1, 1,
0.5121616, 1.068823, 0.3027518, 0.2470588, 0, 1, 1,
0.5121651, 1.456706, 0.397138, 0.254902, 0, 1, 1,
0.5129554, 1.18351, 0.7795232, 0.2588235, 0, 1, 1,
0.5136153, 0.4791766, 1.343333, 0.2666667, 0, 1, 1,
0.5141742, 0.590439, 2.434143, 0.2705882, 0, 1, 1,
0.5209711, 0.2487569, -0.09765032, 0.2784314, 0, 1, 1,
0.5228457, 1.430081, 0.3502951, 0.282353, 0, 1, 1,
0.5317273, 1.738008, 0.2394277, 0.2901961, 0, 1, 1,
0.532626, 0.6288323, -0.1259263, 0.2941177, 0, 1, 1,
0.5347655, 1.15195, -0.09199266, 0.3019608, 0, 1, 1,
0.5358954, 1.726135, 0.7295727, 0.3098039, 0, 1, 1,
0.5380059, -2.035375, 4.479205, 0.3137255, 0, 1, 1,
0.5403536, 0.4483185, 0.4419781, 0.3215686, 0, 1, 1,
0.5441375, -0.376476, 1.747198, 0.3254902, 0, 1, 1,
0.5442771, -0.0109187, 0.7748297, 0.3333333, 0, 1, 1,
0.5481704, 0.3902638, 0.7970101, 0.3372549, 0, 1, 1,
0.5517212, -0.8105033, 2.309231, 0.345098, 0, 1, 1,
0.5529596, 0.7075021, 0.9685153, 0.3490196, 0, 1, 1,
0.5546362, -0.3507601, 2.589397, 0.3568628, 0, 1, 1,
0.5566915, 0.1143048, 4.926136, 0.3607843, 0, 1, 1,
0.5585053, 0.235482, 2.184008, 0.3686275, 0, 1, 1,
0.5611398, 0.5101753, 0.6337836, 0.372549, 0, 1, 1,
0.5633391, 0.2247956, 0.9000126, 0.3803922, 0, 1, 1,
0.5638179, -0.4687465, 2.060311, 0.3843137, 0, 1, 1,
0.5688066, -0.7444581, 3.646663, 0.3921569, 0, 1, 1,
0.5703626, 0.4958005, 1.842942, 0.3960784, 0, 1, 1,
0.5730552, -1.497016, 1.43499, 0.4039216, 0, 1, 1,
0.5732332, -0.3671498, 1.898547, 0.4117647, 0, 1, 1,
0.5776536, 2.842063, -0.1597123, 0.4156863, 0, 1, 1,
0.5806909, 1.674458, 0.1608281, 0.4235294, 0, 1, 1,
0.5824341, 1.674479, 1.711156, 0.427451, 0, 1, 1,
0.5827793, -0.2533139, 3.044468, 0.4352941, 0, 1, 1,
0.5863816, -0.7840285, 2.437169, 0.4392157, 0, 1, 1,
0.5874746, 0.08504259, 1.061764, 0.4470588, 0, 1, 1,
0.5881557, 1.070832, 1.693182, 0.4509804, 0, 1, 1,
0.5891225, 1.065738, 2.053157, 0.4588235, 0, 1, 1,
0.5981215, 2.583815, 2.063319, 0.4627451, 0, 1, 1,
0.5992234, 0.1690907, -0.02601035, 0.4705882, 0, 1, 1,
0.6053429, 1.43118, 1.069172, 0.4745098, 0, 1, 1,
0.6099741, -0.07787342, 1.489545, 0.4823529, 0, 1, 1,
0.6149019, 1.549302, -1.235994, 0.4862745, 0, 1, 1,
0.6188951, 0.7598481, 0.4821221, 0.4941176, 0, 1, 1,
0.6233414, 0.09194406, 1.258986, 0.5019608, 0, 1, 1,
0.6321782, -0.7246651, 1.51252, 0.5058824, 0, 1, 1,
0.6387698, 1.177051, 0.9904166, 0.5137255, 0, 1, 1,
0.6429058, 1.322594, -1.089748, 0.5176471, 0, 1, 1,
0.6461557, -0.1276929, 1.189147, 0.5254902, 0, 1, 1,
0.6477131, 0.3978197, 0.2868761, 0.5294118, 0, 1, 1,
0.6629421, 0.5428061, -0.3608668, 0.5372549, 0, 1, 1,
0.6637642, -0.592714, 1.360122, 0.5411765, 0, 1, 1,
0.6664968, -0.2804273, 2.851246, 0.5490196, 0, 1, 1,
0.676221, -0.7836864, 1.011532, 0.5529412, 0, 1, 1,
0.6824251, -0.8340535, 0.3022205, 0.5607843, 0, 1, 1,
0.6826068, 0.1164756, 2.042279, 0.5647059, 0, 1, 1,
0.6836476, 0.3944722, 0.3582339, 0.572549, 0, 1, 1,
0.6854007, 0.9739266, 0.2625608, 0.5764706, 0, 1, 1,
0.686415, 0.5223815, 0.9464825, 0.5843138, 0, 1, 1,
0.6884817, 1.789842, 1.126993, 0.5882353, 0, 1, 1,
0.6960657, 1.409536, -0.1540963, 0.5960785, 0, 1, 1,
0.6991302, -1.093762, 2.134518, 0.6039216, 0, 1, 1,
0.7056192, -0.20015, 1.452043, 0.6078432, 0, 1, 1,
0.7059087, 0.8478778, 2.923285, 0.6156863, 0, 1, 1,
0.7135121, 1.76917, 2.267411, 0.6196079, 0, 1, 1,
0.7149859, -2.33398, 3.550113, 0.627451, 0, 1, 1,
0.716269, -1.058317, 3.422181, 0.6313726, 0, 1, 1,
0.7195396, 0.09070364, 1.032158, 0.6392157, 0, 1, 1,
0.7289814, 0.7376887, 1.419023, 0.6431373, 0, 1, 1,
0.7301458, -1.001911, 2.087539, 0.6509804, 0, 1, 1,
0.7309613, 1.185166, 0.8958807, 0.654902, 0, 1, 1,
0.7312005, -1.349951, 1.850273, 0.6627451, 0, 1, 1,
0.7348796, -1.505214, 3.307021, 0.6666667, 0, 1, 1,
0.7365746, 1.38354, 0.6596385, 0.6745098, 0, 1, 1,
0.7371551, 0.3543901, 1.093803, 0.6784314, 0, 1, 1,
0.738976, -0.8514428, 4.010879, 0.6862745, 0, 1, 1,
0.7425047, 0.3419997, 1.925554, 0.6901961, 0, 1, 1,
0.7481267, -0.713979, 3.061496, 0.6980392, 0, 1, 1,
0.7565797, 0.3532555, 2.284317, 0.7058824, 0, 1, 1,
0.7694225, 1.161957, 0.2569514, 0.7098039, 0, 1, 1,
0.7723289, 0.7714878, 1.207935, 0.7176471, 0, 1, 1,
0.773028, -1.436807, 2.201775, 0.7215686, 0, 1, 1,
0.7751687, -0.2109679, 1.072862, 0.7294118, 0, 1, 1,
0.7776813, -0.178848, 2.97451, 0.7333333, 0, 1, 1,
0.7811664, -0.2578044, 2.144103, 0.7411765, 0, 1, 1,
0.7859163, 1.76894, 0.5725157, 0.7450981, 0, 1, 1,
0.7864957, 1.258612, 0.7464547, 0.7529412, 0, 1, 1,
0.7874069, 1.104939, 2.152755, 0.7568628, 0, 1, 1,
0.7902697, 0.2651536, 1.531034, 0.7647059, 0, 1, 1,
0.7966085, -1.429365, 3.826305, 0.7686275, 0, 1, 1,
0.7981016, 0.2742586, 2.212316, 0.7764706, 0, 1, 1,
0.7987239, -0.4757255, 3.105327, 0.7803922, 0, 1, 1,
0.8011116, -1.167779, 2.947804, 0.7882353, 0, 1, 1,
0.8093947, 0.08853326, 2.938316, 0.7921569, 0, 1, 1,
0.8094998, 0.7857312, 1.314259, 0.8, 0, 1, 1,
0.8120353, -1.099466, 2.62487, 0.8078431, 0, 1, 1,
0.8252059, 0.7893919, 1.800693, 0.8117647, 0, 1, 1,
0.8289878, 1.078817, 0.5451984, 0.8196079, 0, 1, 1,
0.8294466, 0.2638886, 1.324281, 0.8235294, 0, 1, 1,
0.8340592, -1.019875, 2.287462, 0.8313726, 0, 1, 1,
0.8423663, 0.5691265, -0.1652877, 0.8352941, 0, 1, 1,
0.8455229, 0.8615518, 1.162466, 0.8431373, 0, 1, 1,
0.8469421, 0.4061569, 0.2026533, 0.8470588, 0, 1, 1,
0.8485546, -0.3007681, 0.475636, 0.854902, 0, 1, 1,
0.8552259, -0.7151831, 4.449689, 0.8588235, 0, 1, 1,
0.8561279, -0.1602988, 3.067761, 0.8666667, 0, 1, 1,
0.8571709, -0.1348129, 1.6808, 0.8705882, 0, 1, 1,
0.8703837, 0.5088792, 0.8185291, 0.8784314, 0, 1, 1,
0.870594, 1.741084, -0.7993084, 0.8823529, 0, 1, 1,
0.8722441, 0.3532531, 1.298652, 0.8901961, 0, 1, 1,
0.8741557, -0.9862161, 3.58798, 0.8941177, 0, 1, 1,
0.8818147, -0.086711, 1.861937, 0.9019608, 0, 1, 1,
0.8847838, -1.866279, 2.719554, 0.9098039, 0, 1, 1,
0.8855423, -0.240306, 2.653886, 0.9137255, 0, 1, 1,
0.8875641, 0.9646383, 0.3659812, 0.9215686, 0, 1, 1,
0.8902774, -1.594042, 3.475631, 0.9254902, 0, 1, 1,
0.894042, 0.06817102, 1.93554, 0.9333333, 0, 1, 1,
0.8995075, 0.8507267, 1.267245, 0.9372549, 0, 1, 1,
0.9022935, -0.5744948, 2.621117, 0.945098, 0, 1, 1,
0.9064549, 0.3709736, 2.38969, 0.9490196, 0, 1, 1,
0.9116913, -1.430773, 2.731099, 0.9568627, 0, 1, 1,
0.9183231, 0.1692434, 2.712688, 0.9607843, 0, 1, 1,
0.9183569, -1.819367, 2.743127, 0.9686275, 0, 1, 1,
0.9220249, 0.2571844, 2.744897, 0.972549, 0, 1, 1,
0.9256712, -0.1437296, 0.7756403, 0.9803922, 0, 1, 1,
0.9273412, 0.3717256, 2.547435, 0.9843137, 0, 1, 1,
0.9342695, 1.009818, 0.8884642, 0.9921569, 0, 1, 1,
0.9471732, 0.722274, 0.6517649, 0.9960784, 0, 1, 1,
0.9487013, 1.030116, 2.968813, 1, 0, 0.9960784, 1,
0.9592115, -0.09996122, 0.2921063, 1, 0, 0.9882353, 1,
0.962634, 0.0748415, 0.1227594, 1, 0, 0.9843137, 1,
0.9639663, 0.3946236, 2.829075, 1, 0, 0.9764706, 1,
0.9646822, -0.02855074, 2.937349, 1, 0, 0.972549, 1,
0.9770041, 0.3862671, 1.222463, 1, 0, 0.9647059, 1,
0.9774798, 0.8892789, 0.6891681, 1, 0, 0.9607843, 1,
0.9793239, 0.6797337, 1.970269, 1, 0, 0.9529412, 1,
0.9817865, -0.05426701, 2.200581, 1, 0, 0.9490196, 1,
0.9853973, 0.8595262, 0.7534754, 1, 0, 0.9411765, 1,
0.987673, -0.8193352, 2.41404, 1, 0, 0.9372549, 1,
0.9890976, -0.2371697, 2.180901, 1, 0, 0.9294118, 1,
0.9935026, -0.5093315, 2.128201, 1, 0, 0.9254902, 1,
0.997104, 2.263879, 1.355436, 1, 0, 0.9176471, 1,
0.9983205, 1.432705, 1.30563, 1, 0, 0.9137255, 1,
1.000925, 1.01953, -0.5072531, 1, 0, 0.9058824, 1,
1.013938, -0.8880762, 2.731323, 1, 0, 0.9019608, 1,
1.014896, -0.5870822, 1.256188, 1, 0, 0.8941177, 1,
1.018404, 0.04804946, 2.834932, 1, 0, 0.8862745, 1,
1.019094, -0.658992, -0.4139445, 1, 0, 0.8823529, 1,
1.026365, 0.0005326531, 1.030619, 1, 0, 0.8745098, 1,
1.035102, 1.503644, 2.329116, 1, 0, 0.8705882, 1,
1.039562, -0.4909118, 1.804383, 1, 0, 0.8627451, 1,
1.055943, -0.1110419, 1.72021, 1, 0, 0.8588235, 1,
1.058569, -0.9379145, -0.06968644, 1, 0, 0.8509804, 1,
1.061238, 0.1152824, 1.765598, 1, 0, 0.8470588, 1,
1.063325, -0.03676566, 1.022222, 1, 0, 0.8392157, 1,
1.071042, 0.4430416, 2.10048, 1, 0, 0.8352941, 1,
1.071409, -1.447579, 3.589896, 1, 0, 0.827451, 1,
1.082827, -0.6908333, 2.307784, 1, 0, 0.8235294, 1,
1.083198, -0.7612591, 1.973453, 1, 0, 0.8156863, 1,
1.085841, -1.2642, 0.8667281, 1, 0, 0.8117647, 1,
1.093285, 1.182177, 0.7533823, 1, 0, 0.8039216, 1,
1.093699, -0.631441, 1.845819, 1, 0, 0.7960784, 1,
1.096997, -0.977146, 1.23862, 1, 0, 0.7921569, 1,
1.099639, 1.653835, 1.096283, 1, 0, 0.7843137, 1,
1.102907, 2.346817, 1.376472, 1, 0, 0.7803922, 1,
1.108295, 0.8856759, 0.6985209, 1, 0, 0.772549, 1,
1.109076, 0.1129334, 0.407174, 1, 0, 0.7686275, 1,
1.11486, -0.05492463, 2.000301, 1, 0, 0.7607843, 1,
1.116392, -0.5079495, 3.630348, 1, 0, 0.7568628, 1,
1.130669, -1.102516, 2.262505, 1, 0, 0.7490196, 1,
1.137113, -0.1479388, 1.457484, 1, 0, 0.7450981, 1,
1.143072, -2.177773, 2.735621, 1, 0, 0.7372549, 1,
1.146569, -1.275338, 2.567522, 1, 0, 0.7333333, 1,
1.147487, 0.837927, -0.3404605, 1, 0, 0.7254902, 1,
1.151966, 0.353064, 1.698367, 1, 0, 0.7215686, 1,
1.161405, -0.725863, 1.859061, 1, 0, 0.7137255, 1,
1.162979, 0.5603455, 1.698631, 1, 0, 0.7098039, 1,
1.163005, -0.08858982, 1.458114, 1, 0, 0.7019608, 1,
1.166241, -0.6855232, 1.755866, 1, 0, 0.6941177, 1,
1.167116, 0.9792539, 1.718829, 1, 0, 0.6901961, 1,
1.172069, -0.5664784, 2.063161, 1, 0, 0.682353, 1,
1.172143, -0.7624771, 2.454731, 1, 0, 0.6784314, 1,
1.181219, -1.121435, 0.9146175, 1, 0, 0.6705883, 1,
1.18878, 1.400628, 0.1039992, 1, 0, 0.6666667, 1,
1.200883, 2.007106, 0.4223544, 1, 0, 0.6588235, 1,
1.203257, 0.9194704, 1.97938, 1, 0, 0.654902, 1,
1.204095, 0.08753156, 0.1861693, 1, 0, 0.6470588, 1,
1.211122, 1.071772, 0.9396726, 1, 0, 0.6431373, 1,
1.213938, -0.8542942, 1.779868, 1, 0, 0.6352941, 1,
1.216376, -1.453977, 2.388302, 1, 0, 0.6313726, 1,
1.216702, -0.3401255, 1.306495, 1, 0, 0.6235294, 1,
1.218897, 0.6583952, 2.802217, 1, 0, 0.6196079, 1,
1.225544, -1.407764, 2.600801, 1, 0, 0.6117647, 1,
1.231005, -2.003798, 2.537884, 1, 0, 0.6078432, 1,
1.243893, 1.128204, 0.3363824, 1, 0, 0.6, 1,
1.258186, 1.940291, -0.9996156, 1, 0, 0.5921569, 1,
1.264018, -0.5929357, 1.068947, 1, 0, 0.5882353, 1,
1.265828, -0.2665596, 1.029077, 1, 0, 0.5803922, 1,
1.268532, -0.7737999, 1.920249, 1, 0, 0.5764706, 1,
1.271505, -0.4194835, 2.319661, 1, 0, 0.5686275, 1,
1.28094, -0.4677721, 0.8169373, 1, 0, 0.5647059, 1,
1.284643, -0.9828127, 1.664549, 1, 0, 0.5568628, 1,
1.288623, -1.949281, 3.21077, 1, 0, 0.5529412, 1,
1.293863, -0.240993, 0.1450456, 1, 0, 0.5450981, 1,
1.312577, -0.8325692, 2.323996, 1, 0, 0.5411765, 1,
1.319481, 0.3333551, 0.6698564, 1, 0, 0.5333334, 1,
1.334163, -1.91013, 2.946651, 1, 0, 0.5294118, 1,
1.345979, 0.8872657, 0.7258348, 1, 0, 0.5215687, 1,
1.346722, 0.8088145, 2.48528, 1, 0, 0.5176471, 1,
1.373329, -0.1378388, 2.398702, 1, 0, 0.509804, 1,
1.384788, 1.183603, 0.8323306, 1, 0, 0.5058824, 1,
1.403072, 0.1892617, 1.107764, 1, 0, 0.4980392, 1,
1.415129, -0.08160458, 1.877591, 1, 0, 0.4901961, 1,
1.440265, 0.8006154, 0.6847972, 1, 0, 0.4862745, 1,
1.446284, -1.073269, 0.7334345, 1, 0, 0.4784314, 1,
1.469626, -1.131616, 3.318268, 1, 0, 0.4745098, 1,
1.473831, -1.570688, 1.309911, 1, 0, 0.4666667, 1,
1.482517, 0.1573049, 2.219441, 1, 0, 0.4627451, 1,
1.488943, -0.7785937, 3.348863, 1, 0, 0.454902, 1,
1.489634, 2.595696, 0.9614998, 1, 0, 0.4509804, 1,
1.496636, 0.7219948, 2.48561, 1, 0, 0.4431373, 1,
1.51293, -0.4449289, 1.290668, 1, 0, 0.4392157, 1,
1.514002, 1.989441, 1.138839, 1, 0, 0.4313726, 1,
1.514056, 0.1238559, 0.2596103, 1, 0, 0.427451, 1,
1.516124, -0.2411878, 1.494887, 1, 0, 0.4196078, 1,
1.540769, 0.1889033, 1.993753, 1, 0, 0.4156863, 1,
1.553011, -0.1534096, 1.441511, 1, 0, 0.4078431, 1,
1.55519, -0.9281949, 3.491239, 1, 0, 0.4039216, 1,
1.559934, -0.5678262, 3.096234, 1, 0, 0.3960784, 1,
1.565772, 0.9187421, 1.609182, 1, 0, 0.3882353, 1,
1.573867, -0.5466419, 2.738555, 1, 0, 0.3843137, 1,
1.574998, 0.09193373, 0.9820526, 1, 0, 0.3764706, 1,
1.578807, 1.230378, 1.912202, 1, 0, 0.372549, 1,
1.5858, -0.3434882, 1.695021, 1, 0, 0.3647059, 1,
1.593764, 0.3065804, 2.045174, 1, 0, 0.3607843, 1,
1.594873, -1.261614, 1.894593, 1, 0, 0.3529412, 1,
1.603954, -0.6778803, 1.455039, 1, 0, 0.3490196, 1,
1.605673, 0.8192968, 2.288678, 1, 0, 0.3411765, 1,
1.617608, -0.007677789, 0.4900909, 1, 0, 0.3372549, 1,
1.625927, 1.433753, 2.411452, 1, 0, 0.3294118, 1,
1.628372, 1.350957, 0.8024613, 1, 0, 0.3254902, 1,
1.634077, 0.5770388, 0.9005315, 1, 0, 0.3176471, 1,
1.660121, 0.06896572, 2.648504, 1, 0, 0.3137255, 1,
1.681266, -0.0202117, 0.9342546, 1, 0, 0.3058824, 1,
1.688864, 1.497136, 0.7851923, 1, 0, 0.2980392, 1,
1.707906, -0.6428207, 0.6233173, 1, 0, 0.2941177, 1,
1.72272, 0.3404217, 1.24224, 1, 0, 0.2862745, 1,
1.728279, 0.4368724, 1.594916, 1, 0, 0.282353, 1,
1.744137, -0.8142018, 2.051645, 1, 0, 0.2745098, 1,
1.754084, -0.7311837, 1.24867, 1, 0, 0.2705882, 1,
1.781672, -0.1527741, 1.281126, 1, 0, 0.2627451, 1,
1.786808, -0.08197494, 2.683109, 1, 0, 0.2588235, 1,
1.804448, 1.047592, -0.2847359, 1, 0, 0.2509804, 1,
1.804779, 0.6431097, 0.2347975, 1, 0, 0.2470588, 1,
1.808416, -0.7166391, 3.040426, 1, 0, 0.2392157, 1,
1.810974, 1.174994, -0.4249495, 1, 0, 0.2352941, 1,
1.819438, -0.3088588, 3.135182, 1, 0, 0.227451, 1,
1.834022, 2.452362, 0.3403247, 1, 0, 0.2235294, 1,
1.849228, 0.5027589, 1.305807, 1, 0, 0.2156863, 1,
1.864987, -0.5225357, 3.498746, 1, 0, 0.2117647, 1,
1.893633, 0.7972408, 2.566753, 1, 0, 0.2039216, 1,
1.901502, -1.227072, 2.461171, 1, 0, 0.1960784, 1,
1.91405, 0.1705154, 0.617379, 1, 0, 0.1921569, 1,
1.918682, 1.383911, 2.784799, 1, 0, 0.1843137, 1,
1.93047, -0.648204, 1.76449, 1, 0, 0.1803922, 1,
1.942212, -0.8885321, 0.3870025, 1, 0, 0.172549, 1,
1.953765, -1.728652, 2.53481, 1, 0, 0.1686275, 1,
1.962478, -0.2508157, 0.7772851, 1, 0, 0.1607843, 1,
1.975288, -0.824076, 3.5763, 1, 0, 0.1568628, 1,
1.989045, -0.3078563, 1.273309, 1, 0, 0.1490196, 1,
2.034785, 0.123881, 1.842601, 1, 0, 0.145098, 1,
2.049315, 1.327057, -0.663658, 1, 0, 0.1372549, 1,
2.065608, -1.171412, 1.838984, 1, 0, 0.1333333, 1,
2.068174, -0.5960844, 1.712046, 1, 0, 0.1254902, 1,
2.076782, -1.725267, 2.493251, 1, 0, 0.1215686, 1,
2.12634, -1.549316, 2.599774, 1, 0, 0.1137255, 1,
2.171165, -0.917719, 1.363289, 1, 0, 0.1098039, 1,
2.182327, 0.2334452, 0.08282838, 1, 0, 0.1019608, 1,
2.184573, -0.3711466, -0.8374312, 1, 0, 0.09411765, 1,
2.21233, -0.9417234, 2.266357, 1, 0, 0.09019608, 1,
2.228772, 0.614724, 1.276598, 1, 0, 0.08235294, 1,
2.24352, -0.7810189, 2.482965, 1, 0, 0.07843138, 1,
2.244211, -0.05076693, 0.6587335, 1, 0, 0.07058824, 1,
2.282761, 0.291356, -0.3804584, 1, 0, 0.06666667, 1,
2.29212, -1.566334, 3.274799, 1, 0, 0.05882353, 1,
2.31646, -1.109912, 4.00705, 1, 0, 0.05490196, 1,
2.321191, -0.7125381, 2.007331, 1, 0, 0.04705882, 1,
2.36134, 1.100348, 1.502916, 1, 0, 0.04313726, 1,
2.373803, 0.1755649, 1.611501, 1, 0, 0.03529412, 1,
2.385448, 0.3009294, 2.528127, 1, 0, 0.03137255, 1,
2.426637, 1.007055, 0.7766241, 1, 0, 0.02352941, 1,
2.486099, -1.071644, 0.9792697, 1, 0, 0.01960784, 1,
2.495167, 1.416284, 3.726835, 1, 0, 0.01176471, 1,
2.865468, -1.685191, 1.72189, 1, 0, 0.007843138, 1
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
-0.4242029, -4.862872, -6.868249, 0, -0.5, 0.5, 0.5,
-0.4242029, -4.862872, -6.868249, 1, -0.5, 0.5, 0.5,
-0.4242029, -4.862872, -6.868249, 1, 1.5, 0.5, 0.5,
-0.4242029, -4.862872, -6.868249, 0, 1.5, 0.5, 0.5
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
-4.829072, -0.2298445, -6.868249, 0, -0.5, 0.5, 0.5,
-4.829072, -0.2298445, -6.868249, 1, -0.5, 0.5, 0.5,
-4.829072, -0.2298445, -6.868249, 1, 1.5, 0.5, 0.5,
-4.829072, -0.2298445, -6.868249, 0, 1.5, 0.5, 0.5
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
-4.829072, -4.862872, -0.1163545, 0, -0.5, 0.5, 0.5,
-4.829072, -4.862872, -0.1163545, 1, -0.5, 0.5, 0.5,
-4.829072, -4.862872, -0.1163545, 1, 1.5, 0.5, 0.5,
-4.829072, -4.862872, -0.1163545, 0, 1.5, 0.5, 0.5
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
-3, -3.793712, -5.31012,
2, -3.793712, -5.31012,
-3, -3.793712, -5.31012,
-3, -3.971905, -5.569808,
-2, -3.793712, -5.31012,
-2, -3.971905, -5.569808,
-1, -3.793712, -5.31012,
-1, -3.971905, -5.569808,
0, -3.793712, -5.31012,
0, -3.971905, -5.569808,
1, -3.793712, -5.31012,
1, -3.971905, -5.569808,
2, -3.793712, -5.31012,
2, -3.971905, -5.569808
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
-3, -4.328292, -6.089184, 0, -0.5, 0.5, 0.5,
-3, -4.328292, -6.089184, 1, -0.5, 0.5, 0.5,
-3, -4.328292, -6.089184, 1, 1.5, 0.5, 0.5,
-3, -4.328292, -6.089184, 0, 1.5, 0.5, 0.5,
-2, -4.328292, -6.089184, 0, -0.5, 0.5, 0.5,
-2, -4.328292, -6.089184, 1, -0.5, 0.5, 0.5,
-2, -4.328292, -6.089184, 1, 1.5, 0.5, 0.5,
-2, -4.328292, -6.089184, 0, 1.5, 0.5, 0.5,
-1, -4.328292, -6.089184, 0, -0.5, 0.5, 0.5,
-1, -4.328292, -6.089184, 1, -0.5, 0.5, 0.5,
-1, -4.328292, -6.089184, 1, 1.5, 0.5, 0.5,
-1, -4.328292, -6.089184, 0, 1.5, 0.5, 0.5,
0, -4.328292, -6.089184, 0, -0.5, 0.5, 0.5,
0, -4.328292, -6.089184, 1, -0.5, 0.5, 0.5,
0, -4.328292, -6.089184, 1, 1.5, 0.5, 0.5,
0, -4.328292, -6.089184, 0, 1.5, 0.5, 0.5,
1, -4.328292, -6.089184, 0, -0.5, 0.5, 0.5,
1, -4.328292, -6.089184, 1, -0.5, 0.5, 0.5,
1, -4.328292, -6.089184, 1, 1.5, 0.5, 0.5,
1, -4.328292, -6.089184, 0, 1.5, 0.5, 0.5,
2, -4.328292, -6.089184, 0, -0.5, 0.5, 0.5,
2, -4.328292, -6.089184, 1, -0.5, 0.5, 0.5,
2, -4.328292, -6.089184, 1, 1.5, 0.5, 0.5,
2, -4.328292, -6.089184, 0, 1.5, 0.5, 0.5
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
-3.812564, -3, -5.31012,
-3.812564, 3, -5.31012,
-3.812564, -3, -5.31012,
-3.981982, -3, -5.569808,
-3.812564, -2, -5.31012,
-3.981982, -2, -5.569808,
-3.812564, -1, -5.31012,
-3.981982, -1, -5.569808,
-3.812564, 0, -5.31012,
-3.981982, 0, -5.569808,
-3.812564, 1, -5.31012,
-3.981982, 1, -5.569808,
-3.812564, 2, -5.31012,
-3.981982, 2, -5.569808,
-3.812564, 3, -5.31012,
-3.981982, 3, -5.569808
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
-4.320818, -3, -6.089184, 0, -0.5, 0.5, 0.5,
-4.320818, -3, -6.089184, 1, -0.5, 0.5, 0.5,
-4.320818, -3, -6.089184, 1, 1.5, 0.5, 0.5,
-4.320818, -3, -6.089184, 0, 1.5, 0.5, 0.5,
-4.320818, -2, -6.089184, 0, -0.5, 0.5, 0.5,
-4.320818, -2, -6.089184, 1, -0.5, 0.5, 0.5,
-4.320818, -2, -6.089184, 1, 1.5, 0.5, 0.5,
-4.320818, -2, -6.089184, 0, 1.5, 0.5, 0.5,
-4.320818, -1, -6.089184, 0, -0.5, 0.5, 0.5,
-4.320818, -1, -6.089184, 1, -0.5, 0.5, 0.5,
-4.320818, -1, -6.089184, 1, 1.5, 0.5, 0.5,
-4.320818, -1, -6.089184, 0, 1.5, 0.5, 0.5,
-4.320818, 0, -6.089184, 0, -0.5, 0.5, 0.5,
-4.320818, 0, -6.089184, 1, -0.5, 0.5, 0.5,
-4.320818, 0, -6.089184, 1, 1.5, 0.5, 0.5,
-4.320818, 0, -6.089184, 0, 1.5, 0.5, 0.5,
-4.320818, 1, -6.089184, 0, -0.5, 0.5, 0.5,
-4.320818, 1, -6.089184, 1, -0.5, 0.5, 0.5,
-4.320818, 1, -6.089184, 1, 1.5, 0.5, 0.5,
-4.320818, 1, -6.089184, 0, 1.5, 0.5, 0.5,
-4.320818, 2, -6.089184, 0, -0.5, 0.5, 0.5,
-4.320818, 2, -6.089184, 1, -0.5, 0.5, 0.5,
-4.320818, 2, -6.089184, 1, 1.5, 0.5, 0.5,
-4.320818, 2, -6.089184, 0, 1.5, 0.5, 0.5,
-4.320818, 3, -6.089184, 0, -0.5, 0.5, 0.5,
-4.320818, 3, -6.089184, 1, -0.5, 0.5, 0.5,
-4.320818, 3, -6.089184, 1, 1.5, 0.5, 0.5,
-4.320818, 3, -6.089184, 0, 1.5, 0.5, 0.5
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
-3.812564, -3.793712, -4,
-3.812564, -3.793712, 4,
-3.812564, -3.793712, -4,
-3.981982, -3.971905, -4,
-3.812564, -3.793712, -2,
-3.981982, -3.971905, -2,
-3.812564, -3.793712, 0,
-3.981982, -3.971905, 0,
-3.812564, -3.793712, 2,
-3.981982, -3.971905, 2,
-3.812564, -3.793712, 4,
-3.981982, -3.971905, 4
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
-4.320818, -4.328292, -4, 0, -0.5, 0.5, 0.5,
-4.320818, -4.328292, -4, 1, -0.5, 0.5, 0.5,
-4.320818, -4.328292, -4, 1, 1.5, 0.5, 0.5,
-4.320818, -4.328292, -4, 0, 1.5, 0.5, 0.5,
-4.320818, -4.328292, -2, 0, -0.5, 0.5, 0.5,
-4.320818, -4.328292, -2, 1, -0.5, 0.5, 0.5,
-4.320818, -4.328292, -2, 1, 1.5, 0.5, 0.5,
-4.320818, -4.328292, -2, 0, 1.5, 0.5, 0.5,
-4.320818, -4.328292, 0, 0, -0.5, 0.5, 0.5,
-4.320818, -4.328292, 0, 1, -0.5, 0.5, 0.5,
-4.320818, -4.328292, 0, 1, 1.5, 0.5, 0.5,
-4.320818, -4.328292, 0, 0, 1.5, 0.5, 0.5,
-4.320818, -4.328292, 2, 0, -0.5, 0.5, 0.5,
-4.320818, -4.328292, 2, 1, -0.5, 0.5, 0.5,
-4.320818, -4.328292, 2, 1, 1.5, 0.5, 0.5,
-4.320818, -4.328292, 2, 0, 1.5, 0.5, 0.5,
-4.320818, -4.328292, 4, 0, -0.5, 0.5, 0.5,
-4.320818, -4.328292, 4, 1, -0.5, 0.5, 0.5,
-4.320818, -4.328292, 4, 1, 1.5, 0.5, 0.5,
-4.320818, -4.328292, 4, 0, 1.5, 0.5, 0.5
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
-3.812564, -3.793712, -5.31012,
-3.812564, 3.334023, -5.31012,
-3.812564, -3.793712, 5.077411,
-3.812564, 3.334023, 5.077411,
-3.812564, -3.793712, -5.31012,
-3.812564, -3.793712, 5.077411,
-3.812564, 3.334023, -5.31012,
-3.812564, 3.334023, 5.077411,
-3.812564, -3.793712, -5.31012,
2.964158, -3.793712, -5.31012,
-3.812564, -3.793712, 5.077411,
2.964158, -3.793712, 5.077411,
-3.812564, 3.334023, -5.31012,
2.964158, 3.334023, -5.31012,
-3.812564, 3.334023, 5.077411,
2.964158, 3.334023, 5.077411,
2.964158, -3.793712, -5.31012,
2.964158, 3.334023, -5.31012,
2.964158, -3.793712, 5.077411,
2.964158, 3.334023, 5.077411,
2.964158, -3.793712, -5.31012,
2.964158, -3.793712, 5.077411,
2.964158, 3.334023, -5.31012,
2.964158, 3.334023, 5.077411
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
var radius = 7.638524;
var distance = 33.98465;
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
mvMatrix.translate( 0.4242029, 0.2298445, 0.1163545 );
mvMatrix.scale( 1.218719, 1.158702, 0.7950804 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.98465);
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
fenpiclonil<-read.table("fenpiclonil.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fenpiclonil$V2
```

```
## Error in eval(expr, envir, enclos): object 'fenpiclonil' not found
```

```r
y<-fenpiclonil$V3
```

```
## Error in eval(expr, envir, enclos): object 'fenpiclonil' not found
```

```r
z<-fenpiclonil$V4
```

```
## Error in eval(expr, envir, enclos): object 'fenpiclonil' not found
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
-3.713874, 1.17742, -0.7184462, 0, 0, 1, 1, 1,
-3.028464, -0.2913724, -1.950133, 1, 0, 0, 1, 1,
-2.855187, 1.599711, -1.010398, 1, 0, 0, 1, 1,
-2.611033, 1.268694, -1.748296, 1, 0, 0, 1, 1,
-2.534729, 0.8831137, 0.01354117, 1, 0, 0, 1, 1,
-2.456136, 0.0778048, -1.089557, 1, 0, 0, 1, 1,
-2.384739, 0.6448753, -0.9507353, 0, 0, 0, 1, 1,
-2.380026, 0.3427087, -1.218713, 0, 0, 0, 1, 1,
-2.329817, 1.856472, -1.702168, 0, 0, 0, 1, 1,
-2.30686, 0.4052945, -1.141175, 0, 0, 0, 1, 1,
-2.298044, 1.740903, -2.227098, 0, 0, 0, 1, 1,
-2.282284, 0.206543, -2.559199, 0, 0, 0, 1, 1,
-2.271829, 0.5631335, -0.9673755, 0, 0, 0, 1, 1,
-2.258102, -0.02270816, -1.646756, 1, 1, 1, 1, 1,
-2.228537, -0.3148419, -1.958777, 1, 1, 1, 1, 1,
-2.220001, -0.1459714, -1.107897, 1, 1, 1, 1, 1,
-2.189615, -0.822035, -2.432661, 1, 1, 1, 1, 1,
-2.185151, 0.5082664, -1.98672, 1, 1, 1, 1, 1,
-2.177703, 0.01054969, -2.624857, 1, 1, 1, 1, 1,
-2.172239, -0.2939068, -1.469165, 1, 1, 1, 1, 1,
-2.136954, 1.080037, 0.02677547, 1, 1, 1, 1, 1,
-2.086797, 0.7626584, -1.622249, 1, 1, 1, 1, 1,
-2.081216, -0.6819708, -0.4458151, 1, 1, 1, 1, 1,
-2.069977, -0.8368872, -0.7538626, 1, 1, 1, 1, 1,
-2.061151, -0.3177418, -0.3680106, 1, 1, 1, 1, 1,
-2.055001, 1.357013, -0.9752307, 1, 1, 1, 1, 1,
-2.035969, 0.1872556, -0.8171424, 1, 1, 1, 1, 1,
-2.024833, 0.3113129, -1.000132, 1, 1, 1, 1, 1,
-1.993779, 0.3556981, -0.3176057, 0, 0, 1, 1, 1,
-1.99366, 0.6564122, -0.4479118, 1, 0, 0, 1, 1,
-1.989449, 1.326994, -2.309996, 1, 0, 0, 1, 1,
-1.978861, 0.2280868, 0.7216414, 1, 0, 0, 1, 1,
-1.937302, -0.4365229, -1.588991, 1, 0, 0, 1, 1,
-1.912372, 1.069233, -1.571535, 1, 0, 0, 1, 1,
-1.908053, -1.512199, -2.861181, 0, 0, 0, 1, 1,
-1.831024, 1.020838, -1.355848, 0, 0, 0, 1, 1,
-1.821469, -0.6298657, -2.373407, 0, 0, 0, 1, 1,
-1.818686, -0.3576356, -1.016289, 0, 0, 0, 1, 1,
-1.806245, 1.060525, 0.2226192, 0, 0, 0, 1, 1,
-1.800563, -0.9475369, -1.076108, 0, 0, 0, 1, 1,
-1.798136, -0.6266328, -2.482787, 0, 0, 0, 1, 1,
-1.794522, 2.586931, -1.356889, 1, 1, 1, 1, 1,
-1.785699, -0.4501905, -2.434855, 1, 1, 1, 1, 1,
-1.731517, 0.05754125, -1.181239, 1, 1, 1, 1, 1,
-1.729407, 0.7428091, -1.207059, 1, 1, 1, 1, 1,
-1.721797, 1.046737, -1.071929, 1, 1, 1, 1, 1,
-1.719368, 1.308697, 0.01244437, 1, 1, 1, 1, 1,
-1.691715, -0.06838488, -1.865029, 1, 1, 1, 1, 1,
-1.681617, 0.7769451, -0.9638054, 1, 1, 1, 1, 1,
-1.680386, 1.67643, -1.270391, 1, 1, 1, 1, 1,
-1.672737, -0.8963861, -1.375841, 1, 1, 1, 1, 1,
-1.661699, -0.4585085, -2.105888, 1, 1, 1, 1, 1,
-1.65143, -0.8392242, -2.307288, 1, 1, 1, 1, 1,
-1.643101, 1.65422, -0.7000351, 1, 1, 1, 1, 1,
-1.640354, 0.07978394, -3.693395, 1, 1, 1, 1, 1,
-1.634714, 0.3219354, -1.002111, 1, 1, 1, 1, 1,
-1.628985, -1.065645, -2.650835, 0, 0, 1, 1, 1,
-1.603602, 0.702879, -1.831294, 1, 0, 0, 1, 1,
-1.581634, 2.068416, -0.6611471, 1, 0, 0, 1, 1,
-1.5681, 0.6738489, 0.04953044, 1, 0, 0, 1, 1,
-1.560089, -0.2353428, -2.136666, 1, 0, 0, 1, 1,
-1.538874, -0.06064872, 0.04518977, 1, 0, 0, 1, 1,
-1.527986, -0.7060313, -1.789416, 0, 0, 0, 1, 1,
-1.52535, 2.260431, 0.8106456, 0, 0, 0, 1, 1,
-1.525066, -1.590015, -1.615192, 0, 0, 0, 1, 1,
-1.51934, 0.7350894, -0.7391626, 0, 0, 0, 1, 1,
-1.511335, -0.2197755, -1.568645, 0, 0, 0, 1, 1,
-1.500271, 0.6182845, -0.2895308, 0, 0, 0, 1, 1,
-1.496047, 1.180034, -0.4839849, 0, 0, 0, 1, 1,
-1.492716, -0.9590095, -1.27124, 1, 1, 1, 1, 1,
-1.48641, 0.6973298, -0.3552417, 1, 1, 1, 1, 1,
-1.484603, 0.5193478, 0.1003474, 1, 1, 1, 1, 1,
-1.482704, -0.6117342, -1.475824, 1, 1, 1, 1, 1,
-1.475376, 1.223835, -2.327842, 1, 1, 1, 1, 1,
-1.47425, 1.861362, -0.1205167, 1, 1, 1, 1, 1,
-1.470759, 0.8043478, -0.969365, 1, 1, 1, 1, 1,
-1.462418, 0.5941985, -0.925738, 1, 1, 1, 1, 1,
-1.460761, 0.6169501, -2.860206, 1, 1, 1, 1, 1,
-1.443631, -0.2451181, -0.8793365, 1, 1, 1, 1, 1,
-1.436643, 0.3748102, -1.409044, 1, 1, 1, 1, 1,
-1.434991, -0.3451908, -0.8132189, 1, 1, 1, 1, 1,
-1.425446, 0.141627, -2.643167, 1, 1, 1, 1, 1,
-1.424737, 0.8474534, -1.360256, 1, 1, 1, 1, 1,
-1.413685, -1.460352, -2.008221, 1, 1, 1, 1, 1,
-1.401393, -0.651817, -3.053946, 0, 0, 1, 1, 1,
-1.399782, 0.7689615, -1.535633, 1, 0, 0, 1, 1,
-1.398938, 0.3338646, 0.3523434, 1, 0, 0, 1, 1,
-1.395483, -0.7548838, -1.858941, 1, 0, 0, 1, 1,
-1.393738, 1.683576, -1.116281, 1, 0, 0, 1, 1,
-1.371404, -0.2194942, -2.894495, 1, 0, 0, 1, 1,
-1.364455, 0.8498613, -1.71808, 0, 0, 0, 1, 1,
-1.351685, 1.591377, -2.16262, 0, 0, 0, 1, 1,
-1.345743, -1.985934, -3.416188, 0, 0, 0, 1, 1,
-1.343891, -0.09857186, 1.115473, 0, 0, 0, 1, 1,
-1.339476, 0.5784786, 0.2103629, 0, 0, 0, 1, 1,
-1.338596, -1.208056, -0.755812, 0, 0, 0, 1, 1,
-1.337943, -0.412139, -1.944565, 0, 0, 0, 1, 1,
-1.322602, 0.9686256, -1.26318, 1, 1, 1, 1, 1,
-1.314555, -0.8092922, -1.572863, 1, 1, 1, 1, 1,
-1.306471, -0.6084806, -2.366396, 1, 1, 1, 1, 1,
-1.303885, 0.8077058, -0.6348702, 1, 1, 1, 1, 1,
-1.300358, 0.7925812, -1.331101, 1, 1, 1, 1, 1,
-1.292949, 1.683669, 1.93627, 1, 1, 1, 1, 1,
-1.29256, 0.4356808, -1.858638, 1, 1, 1, 1, 1,
-1.289641, -0.9453187, -2.499088, 1, 1, 1, 1, 1,
-1.285033, -0.9190109, -2.395264, 1, 1, 1, 1, 1,
-1.280611, -0.2871436, -1.933609, 1, 1, 1, 1, 1,
-1.27819, 0.7102243, -1.891722, 1, 1, 1, 1, 1,
-1.269276, 0.8205624, -1.65338, 1, 1, 1, 1, 1,
-1.265119, -0.5016037, -1.898175, 1, 1, 1, 1, 1,
-1.25846, 0.1105304, -0.1200105, 1, 1, 1, 1, 1,
-1.252864, 3.230221, -0.3759825, 1, 1, 1, 1, 1,
-1.247414, 0.2082498, -0.4370694, 0, 0, 1, 1, 1,
-1.246846, -1.285043, -1.97385, 1, 0, 0, 1, 1,
-1.245053, -0.5362862, -2.794898, 1, 0, 0, 1, 1,
-1.239541, 0.04200105, -2.908381, 1, 0, 0, 1, 1,
-1.238082, -0.1793139, -1.355757, 1, 0, 0, 1, 1,
-1.235687, 1.568374, -1.141186, 1, 0, 0, 1, 1,
-1.226578, -0.08994829, 1.225477, 0, 0, 0, 1, 1,
-1.225291, 1.549842, -2.299896, 0, 0, 0, 1, 1,
-1.222141, -1.079479, -1.01877, 0, 0, 0, 1, 1,
-1.215856, 0.6723836, -0.9732054, 0, 0, 0, 1, 1,
-1.213937, -0.4589496, -1.147388, 0, 0, 0, 1, 1,
-1.211083, 0.2689913, -1.861353, 0, 0, 0, 1, 1,
-1.207491, -0.5570198, -2.075097, 0, 0, 0, 1, 1,
-1.194871, -2.847035, -2.220042, 1, 1, 1, 1, 1,
-1.189099, -0.00937842, -1.35614, 1, 1, 1, 1, 1,
-1.176771, -0.5483402, -1.507723, 1, 1, 1, 1, 1,
-1.170209, 2.233732, -0.4548339, 1, 1, 1, 1, 1,
-1.164463, 2.399043, -0.6003069, 1, 1, 1, 1, 1,
-1.1642, 0.2517748, -1.917296, 1, 1, 1, 1, 1,
-1.157131, 0.08197394, -1.027486, 1, 1, 1, 1, 1,
-1.156998, 1.52769, 0.3928839, 1, 1, 1, 1, 1,
-1.152768, 0.4765313, -0.6061035, 1, 1, 1, 1, 1,
-1.144276, 2.805846, -0.1095224, 1, 1, 1, 1, 1,
-1.143135, 0.5504449, -1.06387, 1, 1, 1, 1, 1,
-1.143069, -0.1886782, -3.498896, 1, 1, 1, 1, 1,
-1.138128, -1.126064, -1.713955, 1, 1, 1, 1, 1,
-1.13128, 0.7085896, -1.301367, 1, 1, 1, 1, 1,
-1.123676, -1.361439, -1.578808, 1, 1, 1, 1, 1,
-1.123526, -0.06175067, -1.000434, 0, 0, 1, 1, 1,
-1.119755, 0.8955199, 0.1823828, 1, 0, 0, 1, 1,
-1.118342, -0.2946802, -1.795355, 1, 0, 0, 1, 1,
-1.111792, 0.8170468, -1.674353, 1, 0, 0, 1, 1,
-1.10977, -0.06182573, -3.891808, 1, 0, 0, 1, 1,
-1.104779, 0.3017825, -3.246476, 1, 0, 0, 1, 1,
-1.099129, -0.7883031, -2.786352, 0, 0, 0, 1, 1,
-1.091894, 0.5261173, -1.627627, 0, 0, 0, 1, 1,
-1.089547, 0.03408585, -3.500983, 0, 0, 0, 1, 1,
-1.086682, -0.502193, -1.895828, 0, 0, 0, 1, 1,
-1.085758, -0.05569138, -0.7364628, 0, 0, 0, 1, 1,
-1.084458, -1.658836, -4.083589, 0, 0, 0, 1, 1,
-1.080552, -1.597445, -4.676072, 0, 0, 0, 1, 1,
-1.079324, -0.3692635, -2.08746, 1, 1, 1, 1, 1,
-1.077796, 0.6219456, -0.4035096, 1, 1, 1, 1, 1,
-1.07514, 1.004725, -2.834556, 1, 1, 1, 1, 1,
-1.073933, 1.712586, 0.445281, 1, 1, 1, 1, 1,
-1.066961, -0.3009986, 0.3151192, 1, 1, 1, 1, 1,
-1.061082, -0.00804237, -0.1316494, 1, 1, 1, 1, 1,
-1.06105, -0.3404531, -3.690199, 1, 1, 1, 1, 1,
-1.059493, 0.7179015, -1.205997, 1, 1, 1, 1, 1,
-1.041193, -0.6667605, -2.728001, 1, 1, 1, 1, 1,
-1.039345, -0.442264, -2.084804, 1, 1, 1, 1, 1,
-1.039343, -1.206681, -2.006345, 1, 1, 1, 1, 1,
-1.033877, 1.122069, 0.8045123, 1, 1, 1, 1, 1,
-1.033283, 1.277923, -1.323744, 1, 1, 1, 1, 1,
-1.020219, -0.2936625, -1.122802, 1, 1, 1, 1, 1,
-1.01323, 1.244892, -1.463949, 1, 1, 1, 1, 1,
-0.9999598, 0.2377261, -1.222908, 0, 0, 1, 1, 1,
-0.9989495, -1.736396, -4.310718, 1, 0, 0, 1, 1,
-0.997297, 0.6576843, -1.977819, 1, 0, 0, 1, 1,
-0.9834929, -0.2675529, -3.312098, 1, 0, 0, 1, 1,
-0.974429, 1.341758, -1.816014, 1, 0, 0, 1, 1,
-0.9707707, 0.241449, -1.332702, 1, 0, 0, 1, 1,
-0.9704056, -1.026053, -3.427092, 0, 0, 0, 1, 1,
-0.9698825, -1.022814, -2.592382, 0, 0, 0, 1, 1,
-0.9617295, 0.7733989, -0.6072064, 0, 0, 0, 1, 1,
-0.9542479, -0.3104879, -1.406426, 0, 0, 0, 1, 1,
-0.9492902, -1.134132, -1.510249, 0, 0, 0, 1, 1,
-0.9467856, 0.7063146, -0.9613517, 0, 0, 0, 1, 1,
-0.9431572, -0.9766432, -2.263, 0, 0, 0, 1, 1,
-0.9410916, 0.4059176, -0.3769996, 1, 1, 1, 1, 1,
-0.9400511, 1.671266, 0.3661197, 1, 1, 1, 1, 1,
-0.9399536, -0.9627739, -1.072698, 1, 1, 1, 1, 1,
-0.9363371, -0.4785503, -2.118762, 1, 1, 1, 1, 1,
-0.9308389, -0.05066332, -1.447362, 1, 1, 1, 1, 1,
-0.9173998, 1.271048, -1.205708, 1, 1, 1, 1, 1,
-0.9144189, 1.562824, -0.602438, 1, 1, 1, 1, 1,
-0.9124206, -1.686816, -2.97261, 1, 1, 1, 1, 1,
-0.9110802, 1.24154, 0.5264702, 1, 1, 1, 1, 1,
-0.909104, -1.089786, -1.659662, 1, 1, 1, 1, 1,
-0.9047419, 0.6857054, 2.111605, 1, 1, 1, 1, 1,
-0.901652, 0.2203346, -1.823381, 1, 1, 1, 1, 1,
-0.9003355, -0.2522095, -2.799072, 1, 1, 1, 1, 1,
-0.8993638, -2.103719, -3.335063, 1, 1, 1, 1, 1,
-0.8987034, 1.548062, -2.390616, 1, 1, 1, 1, 1,
-0.8940719, 0.3509894, -0.6929515, 0, 0, 1, 1, 1,
-0.8933726, 0.4670678, 0.02589466, 1, 0, 0, 1, 1,
-0.8847473, -1.899141, -1.709028, 1, 0, 0, 1, 1,
-0.884513, 0.7970095, -0.4498751, 1, 0, 0, 1, 1,
-0.8837374, 0.09071673, -2.119344, 1, 0, 0, 1, 1,
-0.8836792, 0.01152782, -2.692751, 1, 0, 0, 1, 1,
-0.8835733, -0.354699, -1.658501, 0, 0, 0, 1, 1,
-0.8826686, -0.7628239, -2.254392, 0, 0, 0, 1, 1,
-0.882341, -0.5589271, -4.671334, 0, 0, 0, 1, 1,
-0.8769085, 1.118037, -0.1407751, 0, 0, 0, 1, 1,
-0.8725449, 0.8673918, -0.5774614, 0, 0, 0, 1, 1,
-0.8692298, 0.2189865, 0.1174657, 0, 0, 0, 1, 1,
-0.8616134, 0.8478378, -0.8108409, 0, 0, 0, 1, 1,
-0.8461294, 1.205325, -1.983353, 1, 1, 1, 1, 1,
-0.8403697, 0.3323387, -0.9683779, 1, 1, 1, 1, 1,
-0.8358057, -0.8933703, -2.98136, 1, 1, 1, 1, 1,
-0.8336413, 0.4866135, -0.4657975, 1, 1, 1, 1, 1,
-0.8318282, 0.221948, -1.649265, 1, 1, 1, 1, 1,
-0.8267641, 0.7838497, -0.3021642, 1, 1, 1, 1, 1,
-0.8249274, -0.2309481, -0.8489866, 1, 1, 1, 1, 1,
-0.8240113, 0.2516285, -1.918395, 1, 1, 1, 1, 1,
-0.8236411, 1.169778, -1.732296, 1, 1, 1, 1, 1,
-0.8139622, -0.4263201, -2.20092, 1, 1, 1, 1, 1,
-0.8129097, -0.06944279, -1.256431, 1, 1, 1, 1, 1,
-0.8083145, -1.052885, -2.470288, 1, 1, 1, 1, 1,
-0.8081406, 0.262295, -2.407436, 1, 1, 1, 1, 1,
-0.8073493, 0.4014085, -2.727453, 1, 1, 1, 1, 1,
-0.7979611, -0.2265862, -2.552022, 1, 1, 1, 1, 1,
-0.7962134, 1.901722, -0.5250819, 0, 0, 1, 1, 1,
-0.7900402, -0.4906905, -1.287675, 1, 0, 0, 1, 1,
-0.7822183, -0.9987442, -3.609364, 1, 0, 0, 1, 1,
-0.7811629, -0.9283722, -4.523996, 1, 0, 0, 1, 1,
-0.7792404, -0.8317412, -3.11935, 1, 0, 0, 1, 1,
-0.7743026, -1.090188, -3.139787, 1, 0, 0, 1, 1,
-0.7680128, -0.1650868, -1.589986, 0, 0, 0, 1, 1,
-0.7671897, -1.617119, -1.572188, 0, 0, 0, 1, 1,
-0.7670588, 0.7946479, -1.255809, 0, 0, 0, 1, 1,
-0.7545796, 0.3648292, -2.498432, 0, 0, 0, 1, 1,
-0.7515271, 0.06248445, -0.8342699, 0, 0, 0, 1, 1,
-0.7459612, 0.9968486, -2.668514, 0, 0, 0, 1, 1,
-0.7457739, 0.4577203, -1.651597, 0, 0, 0, 1, 1,
-0.7410598, -1.736877, -5.158845, 1, 1, 1, 1, 1,
-0.7357479, 0.3949455, -0.8646637, 1, 1, 1, 1, 1,
-0.7356027, 0.5637912, -0.9878812, 1, 1, 1, 1, 1,
-0.7316232, 1.064556, -0.6076819, 1, 1, 1, 1, 1,
-0.726941, -0.1719311, -1.275634, 1, 1, 1, 1, 1,
-0.7219627, -0.4339187, -2.655029, 1, 1, 1, 1, 1,
-0.7214738, -1.243939, -2.184325, 1, 1, 1, 1, 1,
-0.7201781, -0.650519, -1.175037, 1, 1, 1, 1, 1,
-0.7181519, -0.07416142, -0.4892163, 1, 1, 1, 1, 1,
-0.7177653, 0.3348227, -1.663467, 1, 1, 1, 1, 1,
-0.7136242, 2.190475, 0.7606506, 1, 1, 1, 1, 1,
-0.7074766, -2.002115, -3.129541, 1, 1, 1, 1, 1,
-0.7023926, -0.9498771, -1.878226, 1, 1, 1, 1, 1,
-0.6951036, 0.1462412, -0.6047015, 1, 1, 1, 1, 1,
-0.6911333, -0.3568475, -1.303313, 1, 1, 1, 1, 1,
-0.688217, 0.02384829, -1.848771, 0, 0, 1, 1, 1,
-0.6856275, 0.9323664, -1.500605, 1, 0, 0, 1, 1,
-0.6777133, 0.3836716, -0.7933229, 1, 0, 0, 1, 1,
-0.6766086, -1.0146, -4.387802, 1, 0, 0, 1, 1,
-0.676559, -1.306582, -2.888844, 1, 0, 0, 1, 1,
-0.6635793, -0.8299995, -2.370516, 1, 0, 0, 1, 1,
-0.6613231, -0.8738464, -1.888483, 0, 0, 0, 1, 1,
-0.6609058, -1.186361, -1.631217, 0, 0, 0, 1, 1,
-0.6588923, -0.544579, -1.793107, 0, 0, 0, 1, 1,
-0.6545978, -0.5786507, -1.714614, 0, 0, 0, 1, 1,
-0.6543327, 0.3782424, 0.07945862, 0, 0, 0, 1, 1,
-0.6517712, -0.1581489, -2.196257, 0, 0, 0, 1, 1,
-0.6509339, -1.47832, -3.343291, 0, 0, 0, 1, 1,
-0.649761, 0.3240682, -2.1777, 1, 1, 1, 1, 1,
-0.6430356, -1.81707, -1.663401, 1, 1, 1, 1, 1,
-0.6426094, 1.173452, -0.4805253, 1, 1, 1, 1, 1,
-0.6370676, 1.258875, 0.2499164, 1, 1, 1, 1, 1,
-0.6347515, 0.6560048, -2.563797, 1, 1, 1, 1, 1,
-0.6322682, -1.753343, -2.46817, 1, 1, 1, 1, 1,
-0.6315013, -0.04049592, -0.7356046, 1, 1, 1, 1, 1,
-0.6306003, -1.044318, -3.541386, 1, 1, 1, 1, 1,
-0.6298957, 0.9611209, -0.2216636, 1, 1, 1, 1, 1,
-0.624518, 0.793897, -0.4675917, 1, 1, 1, 1, 1,
-0.621692, -0.669628, -2.218041, 1, 1, 1, 1, 1,
-0.6216268, 0.2744488, 0.4465671, 1, 1, 1, 1, 1,
-0.6209186, 1.490527, -1.284457, 1, 1, 1, 1, 1,
-0.6208089, -0.4393484, -2.923686, 1, 1, 1, 1, 1,
-0.6193322, -1.19523, -2.005277, 1, 1, 1, 1, 1,
-0.6134295, 0.8184917, 0.8480764, 0, 0, 1, 1, 1,
-0.6134012, 0.161819, -1.352209, 1, 0, 0, 1, 1,
-0.6058429, -0.1716089, -1.510497, 1, 0, 0, 1, 1,
-0.6057403, -2.112075, -4.193406, 1, 0, 0, 1, 1,
-0.6050617, 0.9121462, -0.4449583, 1, 0, 0, 1, 1,
-0.6017015, -1.193902, -2.852069, 1, 0, 0, 1, 1,
-0.6007384, 1.718897, -0.9162663, 0, 0, 0, 1, 1,
-0.5971941, 0.9536719, 0.1830281, 0, 0, 0, 1, 1,
-0.5918117, -1.063109, -3.249713, 0, 0, 0, 1, 1,
-0.5884384, 0.283424, -1.035228, 0, 0, 0, 1, 1,
-0.5826066, 0.2654469, -1.540951, 0, 0, 0, 1, 1,
-0.5822244, -0.9758345, -2.121187, 0, 0, 0, 1, 1,
-0.5816991, -0.2682254, -2.712689, 0, 0, 0, 1, 1,
-0.575628, -0.3292356, -0.3417421, 1, 1, 1, 1, 1,
-0.5730038, 0.7416435, 0.1125662, 1, 1, 1, 1, 1,
-0.5655811, 0.173467, -1.762455, 1, 1, 1, 1, 1,
-0.5476883, 0.6658627, 0.953613, 1, 1, 1, 1, 1,
-0.545647, -1.016435, -2.308879, 1, 1, 1, 1, 1,
-0.5421693, 0.6880642, -0.3506989, 1, 1, 1, 1, 1,
-0.541427, 1.081257, -1.677442, 1, 1, 1, 1, 1,
-0.5412367, -1.782492, -3.252472, 1, 1, 1, 1, 1,
-0.5407422, -0.9947861, -2.14908, 1, 1, 1, 1, 1,
-0.5407414, -1.171645, -2.46729, 1, 1, 1, 1, 1,
-0.5387664, -1.568848, -2.335411, 1, 1, 1, 1, 1,
-0.5377801, 0.8878374, -0.8303319, 1, 1, 1, 1, 1,
-0.5359847, -1.782402, -3.871262, 1, 1, 1, 1, 1,
-0.533918, 0.1682629, -1.532586, 1, 1, 1, 1, 1,
-0.5331787, -0.3432463, -3.197903, 1, 1, 1, 1, 1,
-0.5315814, -1.407769, -2.00647, 0, 0, 1, 1, 1,
-0.5314899, 0.1497188, -1.530997, 1, 0, 0, 1, 1,
-0.5289718, -0.6056967, -1.950714, 1, 0, 0, 1, 1,
-0.5266911, 0.824633, 1.526723, 1, 0, 0, 1, 1,
-0.5254031, -0.6914066, -2.232534, 1, 0, 0, 1, 1,
-0.5227355, 0.5689775, -0.4883283, 1, 0, 0, 1, 1,
-0.5164378, 0.1903918, -0.2833798, 0, 0, 0, 1, 1,
-0.5162087, -0.2313262, -3.254441, 0, 0, 0, 1, 1,
-0.5157922, 1.141174, -0.3366151, 0, 0, 0, 1, 1,
-0.5111686, -1.007041, -3.531232, 0, 0, 0, 1, 1,
-0.509074, -0.09861036, -1.253631, 0, 0, 0, 1, 1,
-0.5070663, -0.1232189, -1.382912, 0, 0, 0, 1, 1,
-0.5005695, -1.098701, -1.606254, 0, 0, 0, 1, 1,
-0.5001326, -0.6790726, -3.010532, 1, 1, 1, 1, 1,
-0.496379, 1.221107, -1.821328, 1, 1, 1, 1, 1,
-0.490924, 0.9017154, -0.9583099, 1, 1, 1, 1, 1,
-0.4875347, 0.1679453, -2.26776, 1, 1, 1, 1, 1,
-0.4834373, -1.228672, -4.510297, 1, 1, 1, 1, 1,
-0.4819098, 0.9854574, -2.387064, 1, 1, 1, 1, 1,
-0.4780395, -1.613062, -0.8477684, 1, 1, 1, 1, 1,
-0.4762844, -0.388386, -2.04722, 1, 1, 1, 1, 1,
-0.4742038, -0.8386519, -3.612764, 1, 1, 1, 1, 1,
-0.4727685, -0.9376755, -1.696228, 1, 1, 1, 1, 1,
-0.4727392, 0.8524171, 0.1751319, 1, 1, 1, 1, 1,
-0.4705293, -0.1110287, -2.825682, 1, 1, 1, 1, 1,
-0.4703154, 1.693873, 0.5054258, 1, 1, 1, 1, 1,
-0.4698096, -1.559298, -4.524165, 1, 1, 1, 1, 1,
-0.4682709, 1.138801, 0.1253276, 1, 1, 1, 1, 1,
-0.4619899, -1.024081, -1.483103, 0, 0, 1, 1, 1,
-0.458509, -0.3764989, -1.765042, 1, 0, 0, 1, 1,
-0.4558838, -0.7479623, -3.203836, 1, 0, 0, 1, 1,
-0.4537805, 0.4813898, -0.9801809, 1, 0, 0, 1, 1,
-0.4534299, -2.208732, -2.750108, 1, 0, 0, 1, 1,
-0.4525399, -0.01546901, -2.699373, 1, 0, 0, 1, 1,
-0.4492315, 2.059021, 0.6382968, 0, 0, 0, 1, 1,
-0.4450535, -0.2966421, -2.522171, 0, 0, 0, 1, 1,
-0.4392905, 0.4692163, -1.727602, 0, 0, 0, 1, 1,
-0.4381289, 0.0850731, -2.550379, 0, 0, 0, 1, 1,
-0.4299999, -0.4166739, -1.945868, 0, 0, 0, 1, 1,
-0.4268431, -2.000834, -2.191687, 0, 0, 0, 1, 1,
-0.4257809, -0.1001914, -1.235762, 0, 0, 0, 1, 1,
-0.4238489, -0.3501012, 0.06478773, 1, 1, 1, 1, 1,
-0.4236813, -0.3373361, -1.82888, 1, 1, 1, 1, 1,
-0.4211038, 0.1182542, -1.601555, 1, 1, 1, 1, 1,
-0.418674, -1.065839, -1.676105, 1, 1, 1, 1, 1,
-0.4166205, -1.072343, -2.894494, 1, 1, 1, 1, 1,
-0.4153758, -0.3425672, -0.7696511, 1, 1, 1, 1, 1,
-0.4119992, -0.973716, -2.300735, 1, 1, 1, 1, 1,
-0.4092504, -0.4044048, -3.448042, 1, 1, 1, 1, 1,
-0.3997632, -0.5121695, -2.784458, 1, 1, 1, 1, 1,
-0.3929394, 0.08904418, -0.8994942, 1, 1, 1, 1, 1,
-0.3896509, 0.0806223, -2.203818, 1, 1, 1, 1, 1,
-0.3861177, 0.4498103, -1.482581, 1, 1, 1, 1, 1,
-0.3857882, 0.6570476, -1.683689, 1, 1, 1, 1, 1,
-0.3852095, -1.053221, -1.689971, 1, 1, 1, 1, 1,
-0.3789723, -0.6625546, -2.623171, 1, 1, 1, 1, 1,
-0.3747042, 0.4932703, 0.8179864, 0, 0, 1, 1, 1,
-0.3738014, 0.7842181, -1.16813, 1, 0, 0, 1, 1,
-0.3693256, -0.6012317, -2.657961, 1, 0, 0, 1, 1,
-0.3661807, 0.2828671, -2.509996, 1, 0, 0, 1, 1,
-0.3521727, -0.5059927, -1.014773, 1, 0, 0, 1, 1,
-0.3517315, 0.343931, 1.627709, 1, 0, 0, 1, 1,
-0.3504845, -0.704697, -3.537112, 0, 0, 0, 1, 1,
-0.3476843, 0.1572113, 0.9758738, 0, 0, 0, 1, 1,
-0.3458698, -0.1774011, -2.550363, 0, 0, 0, 1, 1,
-0.3455659, -1.021714, -2.334944, 0, 0, 0, 1, 1,
-0.3452857, -0.1390573, -1.612247, 0, 0, 0, 1, 1,
-0.3388163, -0.3418913, -1.840654, 0, 0, 0, 1, 1,
-0.3381954, 1.077655, 0.132212, 0, 0, 0, 1, 1,
-0.335298, 0.3657044, -1.61249, 1, 1, 1, 1, 1,
-0.3347874, 0.2796294, 0.2074939, 1, 1, 1, 1, 1,
-0.333525, -0.7956331, -2.476702, 1, 1, 1, 1, 1,
-0.330596, 2.792475, 1.310658, 1, 1, 1, 1, 1,
-0.3303455, -0.5153731, -3.009001, 1, 1, 1, 1, 1,
-0.3302078, -0.6844645, -4.293488, 1, 1, 1, 1, 1,
-0.3259671, -0.8598572, -2.072931, 1, 1, 1, 1, 1,
-0.3200866, 0.004643868, -2.121136, 1, 1, 1, 1, 1,
-0.3163689, 1.522217, 0.8790047, 1, 1, 1, 1, 1,
-0.3159439, -0.6016101, -5.10633, 1, 1, 1, 1, 1,
-0.311911, -1.668007, -3.027914, 1, 1, 1, 1, 1,
-0.310437, -0.008430107, -0.8925363, 1, 1, 1, 1, 1,
-0.3085824, 0.4005306, -0.3405193, 1, 1, 1, 1, 1,
-0.3068173, -0.2493036, -3.670765, 1, 1, 1, 1, 1,
-0.3059026, 2.446906, -0.01811987, 1, 1, 1, 1, 1,
-0.3001824, 1.155834, 0.02962505, 0, 0, 1, 1, 1,
-0.2999043, -1.529909, -3.670765, 1, 0, 0, 1, 1,
-0.2970954, 0.7442955, -0.7965686, 1, 0, 0, 1, 1,
-0.2955098, 1.356316, -0.3869087, 1, 0, 0, 1, 1,
-0.2921685, 0.5555493, -0.07280815, 1, 0, 0, 1, 1,
-0.2912536, 0.7835433, -0.08493616, 1, 0, 0, 1, 1,
-0.2904647, -1.896116, -2.607559, 0, 0, 0, 1, 1,
-0.290387, 0.0405265, -1.314279, 0, 0, 0, 1, 1,
-0.290081, 0.1359688, -0.6656063, 0, 0, 0, 1, 1,
-0.2803652, -0.5121664, -2.257954, 0, 0, 0, 1, 1,
-0.2792981, 1.169215, -2.680454, 0, 0, 0, 1, 1,
-0.2776057, 1.846436, -0.9817669, 0, 0, 0, 1, 1,
-0.2761812, 0.8067945, -0.7996255, 0, 0, 0, 1, 1,
-0.2752301, -1.792537, -2.734877, 1, 1, 1, 1, 1,
-0.2698952, 0.2194642, -0.7803551, 1, 1, 1, 1, 1,
-0.2691609, 0.6662115, -0.6957892, 1, 1, 1, 1, 1,
-0.265836, -0.2762095, -4.026852, 1, 1, 1, 1, 1,
-0.2646571, 0.09056084, -2.546774, 1, 1, 1, 1, 1,
-0.2637654, -0.1816858, -2.038127, 1, 1, 1, 1, 1,
-0.2635582, -0.8333143, -1.679385, 1, 1, 1, 1, 1,
-0.2632964, -0.641332, -3.329793, 1, 1, 1, 1, 1,
-0.2632003, 0.8201905, -2.176648, 1, 1, 1, 1, 1,
-0.2591394, 0.2239967, -0.4521173, 1, 1, 1, 1, 1,
-0.2549061, -2.048883, -3.42693, 1, 1, 1, 1, 1,
-0.2544363, -0.9090255, -1.135518, 1, 1, 1, 1, 1,
-0.2478528, -0.2437969, -3.430861, 1, 1, 1, 1, 1,
-0.2469019, 0.2475548, 0.7341689, 1, 1, 1, 1, 1,
-0.2366603, 0.6465164, -1.275914, 1, 1, 1, 1, 1,
-0.2364984, -0.5185943, -0.8625161, 0, 0, 1, 1, 1,
-0.2354648, -0.5863469, -2.64473, 1, 0, 0, 1, 1,
-0.2339789, 0.486353, 1.10899, 1, 0, 0, 1, 1,
-0.2283209, 0.7931346, 1.176424, 1, 0, 0, 1, 1,
-0.2280963, 1.231884, 0.6656484, 1, 0, 0, 1, 1,
-0.2205503, -0.7911851, -3.062222, 1, 0, 0, 1, 1,
-0.2140602, -1.685926, -3.160459, 0, 0, 0, 1, 1,
-0.2085719, 1.002518, -0.463042, 0, 0, 0, 1, 1,
-0.2081162, 1.742487, -1.827094, 0, 0, 0, 1, 1,
-0.2058488, 0.3367061, -0.1328802, 0, 0, 0, 1, 1,
-0.1948173, -1.692806, -3.347883, 0, 0, 0, 1, 1,
-0.1934898, -0.4947506, -2.841978, 0, 0, 0, 1, 1,
-0.1891575, 2.532332, -0.4155094, 0, 0, 0, 1, 1,
-0.1888518, 0.4348396, 0.2920063, 1, 1, 1, 1, 1,
-0.1840358, 1.109443, 0.7817712, 1, 1, 1, 1, 1,
-0.1834219, -0.3427011, -2.196612, 1, 1, 1, 1, 1,
-0.1819674, -1.142681, -3.184369, 1, 1, 1, 1, 1,
-0.1813649, -0.5103509, -2.24818, 1, 1, 1, 1, 1,
-0.1788292, 0.3239782, -2.050021, 1, 1, 1, 1, 1,
-0.1768278, 1.266179, -0.07160155, 1, 1, 1, 1, 1,
-0.1727047, 0.8818576, -0.6570223, 1, 1, 1, 1, 1,
-0.1683389, 0.0919394, -2.01993, 1, 1, 1, 1, 1,
-0.161673, 0.5479699, 0.2208718, 1, 1, 1, 1, 1,
-0.1610552, -0.6230745, -2.880899, 1, 1, 1, 1, 1,
-0.1587284, 0.5125934, -0.7271183, 1, 1, 1, 1, 1,
-0.1581981, 0.06468033, -1.315607, 1, 1, 1, 1, 1,
-0.1576598, -1.703597, -2.376226, 1, 1, 1, 1, 1,
-0.148348, -0.7625797, -4.285707, 1, 1, 1, 1, 1,
-0.1454863, 0.9005045, -1.155341, 0, 0, 1, 1, 1,
-0.1432987, 0.04041096, -0.9204986, 1, 0, 0, 1, 1,
-0.1401989, 0.03928553, -0.1989005, 1, 0, 0, 1, 1,
-0.1349906, -0.536364, -3.623479, 1, 0, 0, 1, 1,
-0.1340581, 0.7549804, -0.7663063, 1, 0, 0, 1, 1,
-0.1292823, -1.146804, -1.999514, 1, 0, 0, 1, 1,
-0.1257342, 1.014126, -0.8191088, 0, 0, 0, 1, 1,
-0.1235792, 0.6731117, 0.05863633, 0, 0, 0, 1, 1,
-0.1227022, -0.1482035, -2.489017, 0, 0, 0, 1, 1,
-0.1215518, 0.6226265, -1.567676, 0, 0, 0, 1, 1,
-0.1177044, -0.2765536, -3.435233, 0, 0, 0, 1, 1,
-0.1161915, 0.7255846, 0.4883596, 0, 0, 0, 1, 1,
-0.1129675, -0.3147116, -2.077484, 0, 0, 0, 1, 1,
-0.111836, -0.2277651, -2.691294, 1, 1, 1, 1, 1,
-0.110838, -0.2786539, -4.74719, 1, 1, 1, 1, 1,
-0.1063689, 1.205126, 1.173165, 1, 1, 1, 1, 1,
-0.1026247, -0.08830392, -1.684078, 1, 1, 1, 1, 1,
-0.09782893, -0.8998468, -1.562254, 1, 1, 1, 1, 1,
-0.09748692, -1.220549, -2.244767, 1, 1, 1, 1, 1,
-0.09595606, -0.8614826, -2.365406, 1, 1, 1, 1, 1,
-0.09573588, 1.247643, -1.773066, 1, 1, 1, 1, 1,
-0.09543166, -0.2693429, -2.269656, 1, 1, 1, 1, 1,
-0.09441707, -1.027208, -2.808125, 1, 1, 1, 1, 1,
-0.09414826, -0.1368348, -0.9179633, 1, 1, 1, 1, 1,
-0.0905697, 0.6834347, 0.1030885, 1, 1, 1, 1, 1,
-0.08298453, -0.5951913, -4.538027, 1, 1, 1, 1, 1,
-0.07861664, 0.3369688, -1.149376, 1, 1, 1, 1, 1,
-0.07203588, -0.4156575, -1.775985, 1, 1, 1, 1, 1,
-0.06973815, 0.9429057, 1.245029, 0, 0, 1, 1, 1,
-0.06904019, 0.6335605, -0.1465591, 1, 0, 0, 1, 1,
-0.06835134, -1.245855, -2.761937, 1, 0, 0, 1, 1,
-0.06812441, -1.472555, -0.8388714, 1, 0, 0, 1, 1,
-0.06126933, 0.1407849, -1.343579, 1, 0, 0, 1, 1,
-0.05854267, -0.1205496, -3.494828, 1, 0, 0, 1, 1,
-0.05785771, 0.4869635, 0.40775, 0, 0, 0, 1, 1,
-0.05657024, 1.323369, -1.506957, 0, 0, 0, 1, 1,
-0.05576102, 0.4258127, 1.370691, 0, 0, 0, 1, 1,
-0.05323213, -0.6053964, -2.160733, 0, 0, 0, 1, 1,
-0.05010328, -0.4770336, -3.311245, 0, 0, 0, 1, 1,
-0.04963809, -1.457152, -3.401196, 0, 0, 0, 1, 1,
-0.048956, 0.4700559, -1.591151, 0, 0, 0, 1, 1,
-0.04788302, 1.743471, 1.215365, 1, 1, 1, 1, 1,
-0.04678474, 0.2751132, 0.424338, 1, 1, 1, 1, 1,
-0.04584278, -1.59575, -1.85699, 1, 1, 1, 1, 1,
-0.04564133, -1.537243, -3.975201, 1, 1, 1, 1, 1,
-0.04467607, -1.399602, -3.748168, 1, 1, 1, 1, 1,
-0.04245419, 0.8239189, -0.8549944, 1, 1, 1, 1, 1,
-0.03723727, -1.089072, -2.53666, 1, 1, 1, 1, 1,
-0.02956711, 0.9162443, 0.3214391, 1, 1, 1, 1, 1,
-0.02608936, 1.725399, -0.3948247, 1, 1, 1, 1, 1,
-0.02406471, -0.2007876, -2.061331, 1, 1, 1, 1, 1,
-0.01849357, 0.421652, -0.6466239, 1, 1, 1, 1, 1,
-0.01793553, 0.1711914, 1.410188, 1, 1, 1, 1, 1,
-0.0173336, -2.072504, -2.32067, 1, 1, 1, 1, 1,
-0.007449878, 0.005794479, -0.7185416, 1, 1, 1, 1, 1,
-0.007032912, 0.1786167, -1.866929, 1, 1, 1, 1, 1,
-0.00664386, -1.988276, -3.464529, 0, 0, 1, 1, 1,
0.001946227, -1.505468, 2.308308, 1, 0, 0, 1, 1,
0.002041857, -1.031924, 2.75264, 1, 0, 0, 1, 1,
0.006815346, 1.576797, -0.02962014, 1, 0, 0, 1, 1,
0.007396044, -1.050743, 2.531134, 1, 0, 0, 1, 1,
0.007929813, 0.6704174, 1.356719, 1, 0, 0, 1, 1,
0.009514909, 2.027607, 0.6333076, 0, 0, 0, 1, 1,
0.01066018, 2.037587, 0.06151944, 0, 0, 0, 1, 1,
0.01856481, 0.5796854, 0.3617618, 0, 0, 0, 1, 1,
0.01868835, 1.234915, 2.051459, 0, 0, 0, 1, 1,
0.02280635, -1.320373, 3.566496, 0, 0, 0, 1, 1,
0.02554438, -1.191558, 3.580331, 0, 0, 0, 1, 1,
0.02884081, -0.04373297, 2.896739, 0, 0, 0, 1, 1,
0.02946449, 0.3584094, -0.1943469, 1, 1, 1, 1, 1,
0.03272495, 0.2383441, 0.9417126, 1, 1, 1, 1, 1,
0.03441531, -0.2636899, 3.158248, 1, 1, 1, 1, 1,
0.03683008, 0.5148534, 1.298938, 1, 1, 1, 1, 1,
0.0395206, -0.8906253, 2.522088, 1, 1, 1, 1, 1,
0.03994518, 1.002763, 1.883337, 1, 1, 1, 1, 1,
0.040556, 0.397916, 0.3640473, 1, 1, 1, 1, 1,
0.04265766, -0.8768352, 4.122977, 1, 1, 1, 1, 1,
0.04580368, -0.22709, 2.696056, 1, 1, 1, 1, 1,
0.04892908, -0.2037401, 2.724963, 1, 1, 1, 1, 1,
0.05152473, 1.249766, -0.2444463, 1, 1, 1, 1, 1,
0.05379312, -0.7492374, 2.683358, 1, 1, 1, 1, 1,
0.05543315, -0.2911757, 3.816438, 1, 1, 1, 1, 1,
0.05932984, -0.04051409, 1.460871, 1, 1, 1, 1, 1,
0.05947296, 0.2736331, 0.7051122, 1, 1, 1, 1, 1,
0.06119259, 0.2259098, 0.9014319, 0, 0, 1, 1, 1,
0.06545987, -0.2761329, 4.602918, 1, 0, 0, 1, 1,
0.0677001, -0.2048988, 3.527822, 1, 0, 0, 1, 1,
0.07049648, 1.164881, 0.2446146, 1, 0, 0, 1, 1,
0.07452889, -0.7344552, 2.447242, 1, 0, 0, 1, 1,
0.07480833, -6.5457e-05, 0.8717389, 1, 0, 0, 1, 1,
0.07481305, -1.388078, 2.85993, 0, 0, 0, 1, 1,
0.07540345, 1.316091, 0.6619157, 0, 0, 0, 1, 1,
0.07920591, 0.4962073, 0.613892, 0, 0, 0, 1, 1,
0.08007455, 0.1926456, -0.227984, 0, 0, 0, 1, 1,
0.08066586, 0.9464291, -1.75925, 0, 0, 0, 1, 1,
0.08095275, -0.4027591, 2.435133, 0, 0, 0, 1, 1,
0.08309005, 0.9725753, -0.7993447, 0, 0, 0, 1, 1,
0.08435691, -1.553586, 3.138995, 1, 1, 1, 1, 1,
0.08478764, 0.7283019, 0.8463641, 1, 1, 1, 1, 1,
0.08634322, 0.6570146, -0.2080416, 1, 1, 1, 1, 1,
0.09099758, -1.936844, 1.995798, 1, 1, 1, 1, 1,
0.09287751, 1.023534, 0.4898955, 1, 1, 1, 1, 1,
0.09593513, -0.3322471, 0.8466848, 1, 1, 1, 1, 1,
0.09596148, 0.5481427, -1.583056, 1, 1, 1, 1, 1,
0.1016179, -1.948874, 0.6669807, 1, 1, 1, 1, 1,
0.1036219, -1.07066, 3.681577, 1, 1, 1, 1, 1,
0.1056201, 1.984264, 1.73268, 1, 1, 1, 1, 1,
0.1101356, 0.7298445, -0.2484918, 1, 1, 1, 1, 1,
0.1131082, 0.1283466, 1.974386, 1, 1, 1, 1, 1,
0.1149129, 0.4714839, 0.05887225, 1, 1, 1, 1, 1,
0.117574, -1.203152, 2.776332, 1, 1, 1, 1, 1,
0.1186691, 1.18762, 0.3367319, 1, 1, 1, 1, 1,
0.1238718, 0.4734551, -0.2421111, 0, 0, 1, 1, 1,
0.1264609, 0.3516572, 2.287134, 1, 0, 0, 1, 1,
0.130775, 0.1439642, 0.8964825, 1, 0, 0, 1, 1,
0.1337164, 0.3463733, 0.3752804, 1, 0, 0, 1, 1,
0.1378183, 0.4137779, 1.204365, 1, 0, 0, 1, 1,
0.1381036, -0.6441358, 2.940901, 1, 0, 0, 1, 1,
0.138774, 0.2598083, 1.208721, 0, 0, 0, 1, 1,
0.1406631, -0.4623127, 1.313534, 0, 0, 0, 1, 1,
0.1411073, -0.4720069, 2.393707, 0, 0, 0, 1, 1,
0.1423328, 0.6704177, -0.1297873, 0, 0, 0, 1, 1,
0.1456679, 0.6550739, -1.231836, 0, 0, 0, 1, 1,
0.1463892, 0.3237602, 0.6951425, 0, 0, 0, 1, 1,
0.1492391, 0.1342797, -0.08677283, 0, 0, 0, 1, 1,
0.1506839, 0.5219848, -0.8536301, 1, 1, 1, 1, 1,
0.1520682, 0.8972952, 0.7587031, 1, 1, 1, 1, 1,
0.1528587, -0.2913611, 2.589515, 1, 1, 1, 1, 1,
0.1535653, -1.136292, 1.002851, 1, 1, 1, 1, 1,
0.1556462, -0.8317634, 2.657561, 1, 1, 1, 1, 1,
0.1570847, -2.775708, 0.9924429, 1, 1, 1, 1, 1,
0.1576281, -0.5631297, 3.851504, 1, 1, 1, 1, 1,
0.1599447, 1.867043, -1.886408, 1, 1, 1, 1, 1,
0.1624668, -0.8603389, 1.833229, 1, 1, 1, 1, 1,
0.1631109, -1.349362, 4.108644, 1, 1, 1, 1, 1,
0.1644052, 0.9673203, -1.124278, 1, 1, 1, 1, 1,
0.1705817, 0.1985275, 0.4905908, 1, 1, 1, 1, 1,
0.17339, -0.8086279, 0.9467296, 1, 1, 1, 1, 1,
0.1752213, -0.709231, 2.031213, 1, 1, 1, 1, 1,
0.1783618, 1.365739, -1.102095, 1, 1, 1, 1, 1,
0.1784554, -1.755539, 2.310877, 0, 0, 1, 1, 1,
0.1813099, -1.52756, 2.544362, 1, 0, 0, 1, 1,
0.1823463, 0.9074925, 1.760612, 1, 0, 0, 1, 1,
0.1887721, 1.02119, 0.1860049, 1, 0, 0, 1, 1,
0.189371, -1.164998, 3.553741, 1, 0, 0, 1, 1,
0.1904216, 0.07849148, -0.1896906, 1, 0, 0, 1, 1,
0.1910532, -0.6208996, 2.868479, 0, 0, 0, 1, 1,
0.1929211, 0.3244761, 0.6147938, 0, 0, 0, 1, 1,
0.1948702, 0.4472349, 0.3837859, 0, 0, 0, 1, 1,
0.1992968, 0.2090292, 0.07279363, 0, 0, 0, 1, 1,
0.199937, 2.489361, -0.4068603, 0, 0, 0, 1, 1,
0.2046454, 0.1703653, 1.352497, 0, 0, 0, 1, 1,
0.205332, 2.59668, -0.537287, 0, 0, 0, 1, 1,
0.2060791, -0.7421441, 2.944857, 1, 1, 1, 1, 1,
0.2093216, -2.28209, 2.619451, 1, 1, 1, 1, 1,
0.2141601, 0.7208034, 1.549852, 1, 1, 1, 1, 1,
0.21418, -0.4589664, 2.258847, 1, 1, 1, 1, 1,
0.215973, 2.570792, -0.8008242, 1, 1, 1, 1, 1,
0.2163595, -0.537852, 2.004184, 1, 1, 1, 1, 1,
0.2185787, 0.6040524, 1.019256, 1, 1, 1, 1, 1,
0.2199944, -1.720498, 1.467004, 1, 1, 1, 1, 1,
0.2266767, -0.5277984, 2.606947, 1, 1, 1, 1, 1,
0.2277749, 0.532397, -0.6141684, 1, 1, 1, 1, 1,
0.2306906, -0.5473086, 1.634025, 1, 1, 1, 1, 1,
0.231725, 1.69407, 0.04403873, 1, 1, 1, 1, 1,
0.2372018, 1.188273, 1.455589, 1, 1, 1, 1, 1,
0.2377891, 1.279505, 0.6009216, 1, 1, 1, 1, 1,
0.2389862, -1.231623, 1.998825, 1, 1, 1, 1, 1,
0.2433935, -0.2702355, 1.320114, 0, 0, 1, 1, 1,
0.2436191, 0.1849554, 1.516446, 1, 0, 0, 1, 1,
0.2447283, 0.8814674, -1.602606, 1, 0, 0, 1, 1,
0.2456901, -0.4432682, 3.045192, 1, 0, 0, 1, 1,
0.2457665, -0.9427227, 2.862828, 1, 0, 0, 1, 1,
0.2475084, 0.2290374, 2.969073, 1, 0, 0, 1, 1,
0.2491087, -0.7227234, 4.14712, 0, 0, 0, 1, 1,
0.252235, 1.610751, 0.2928731, 0, 0, 0, 1, 1,
0.2556462, 0.7245825, 0.7053902, 0, 0, 0, 1, 1,
0.2605823, 0.6883342, 1.194333, 0, 0, 0, 1, 1,
0.2660304, -0.5794864, 2.890308, 0, 0, 0, 1, 1,
0.2663617, -0.6859429, 2.172216, 0, 0, 0, 1, 1,
0.2714182, 0.8394462, -0.1532048, 0, 0, 0, 1, 1,
0.283128, -1.498621, 2.940954, 1, 1, 1, 1, 1,
0.287592, -0.3255821, 3.40355, 1, 1, 1, 1, 1,
0.2898194, 0.2264311, 0.7461737, 1, 1, 1, 1, 1,
0.2900581, 0.5789937, -0.318366, 1, 1, 1, 1, 1,
0.2948888, -0.6126055, 2.205832, 1, 1, 1, 1, 1,
0.2950418, 1.661648, -0.5448353, 1, 1, 1, 1, 1,
0.3001955, 0.9933647, -0.7100378, 1, 1, 1, 1, 1,
0.3030034, 0.8001636, 2.092668, 1, 1, 1, 1, 1,
0.3044171, 0.8863756, 0.6405538, 1, 1, 1, 1, 1,
0.3069911, 1.152113, 2.457598, 1, 1, 1, 1, 1,
0.3192852, -3.68991, 2.119694, 1, 1, 1, 1, 1,
0.3205836, -1.746403, 4.061973, 1, 1, 1, 1, 1,
0.3297395, 0.9099096, 0.7517613, 1, 1, 1, 1, 1,
0.3315437, -0.7835059, 2.416775, 1, 1, 1, 1, 1,
0.3328569, 1.955007, 0.9378054, 1, 1, 1, 1, 1,
0.3366611, -0.3110163, 1.55886, 0, 0, 1, 1, 1,
0.3367848, -0.4516727, 4.340376, 1, 0, 0, 1, 1,
0.3437667, -0.06577209, 0.2947227, 1, 0, 0, 1, 1,
0.3474546, -0.7711293, 2.384748, 1, 0, 0, 1, 1,
0.3503339, -0.8048911, 2.132008, 1, 0, 0, 1, 1,
0.3542732, 0.6176715, 0.2473472, 1, 0, 0, 1, 1,
0.3565288, 0.8801389, 0.2920697, 0, 0, 0, 1, 1,
0.3571622, 1.505514, -0.7644591, 0, 0, 0, 1, 1,
0.35803, -0.1597557, 0.9600679, 0, 0, 0, 1, 1,
0.3580705, 1.77499, -0.06616675, 0, 0, 0, 1, 1,
0.3594294, -1.185038, 0.3401838, 0, 0, 0, 1, 1,
0.3598233, 1.600896, -0.1871563, 0, 0, 0, 1, 1,
0.3601122, 0.8763663, 1.257515, 0, 0, 0, 1, 1,
0.362483, -0.4476989, 0.7115477, 1, 1, 1, 1, 1,
0.3743578, -0.303964, 2.266557, 1, 1, 1, 1, 1,
0.3755543, -1.240335, 1.813005, 1, 1, 1, 1, 1,
0.3767209, 1.07343, -0.2069226, 1, 1, 1, 1, 1,
0.3857785, 0.472349, 0.3293642, 1, 1, 1, 1, 1,
0.3888314, 0.672309, 0.4879015, 1, 1, 1, 1, 1,
0.3973629, -0.5208403, 2.438725, 1, 1, 1, 1, 1,
0.3982899, -0.839159, 1.947215, 1, 1, 1, 1, 1,
0.4055152, -1.179365, 2.001754, 1, 1, 1, 1, 1,
0.408474, -0.9680562, 1.203271, 1, 1, 1, 1, 1,
0.4151345, -0.7324916, 2.708625, 1, 1, 1, 1, 1,
0.4162099, -0.0498264, -0.4573818, 1, 1, 1, 1, 1,
0.4217774, -1.363602, 3.448686, 1, 1, 1, 1, 1,
0.4225111, 0.1268807, 3.260185, 1, 1, 1, 1, 1,
0.4240317, 2.070168, 2.023025, 1, 1, 1, 1, 1,
0.4291501, -2.658346, 3.513339, 0, 0, 1, 1, 1,
0.4320071, 2.585402, 0.6987755, 1, 0, 0, 1, 1,
0.435505, -0.598627, 3.334183, 1, 0, 0, 1, 1,
0.4374918, -0.1081451, 1.259467, 1, 0, 0, 1, 1,
0.4415109, -1.511034, 1.942899, 1, 0, 0, 1, 1,
0.4415121, 2.20037, -0.1649247, 1, 0, 0, 1, 1,
0.4461766, 0.7403351, 0.8061875, 0, 0, 0, 1, 1,
0.4508053, -0.7573165, 3.755719, 0, 0, 0, 1, 1,
0.4525846, -0.6666591, 4.670126, 0, 0, 0, 1, 1,
0.4536574, 0.22897, 0.9194669, 0, 0, 0, 1, 1,
0.4541525, -1.487942, 2.781501, 0, 0, 0, 1, 1,
0.458165, 0.4132423, 1.505268, 0, 0, 0, 1, 1,
0.460994, -0.02922741, 1.721422, 0, 0, 0, 1, 1,
0.4622492, 0.2470855, -0.08681303, 1, 1, 1, 1, 1,
0.4679594, -0.7408615, 1.353522, 1, 1, 1, 1, 1,
0.4680058, 0.2771387, -2.417793, 1, 1, 1, 1, 1,
0.4709621, 1.26815, 1.270116, 1, 1, 1, 1, 1,
0.4729564, -2.621122, 2.729029, 1, 1, 1, 1, 1,
0.4752855, 0.4199998, 1.071112, 1, 1, 1, 1, 1,
0.4757569, 1.793051, 0.1588364, 1, 1, 1, 1, 1,
0.4759636, -0.5977663, 2.089883, 1, 1, 1, 1, 1,
0.4776681, -0.3459319, 3.705494, 1, 1, 1, 1, 1,
0.4777339, -0.2244597, 2.459246, 1, 1, 1, 1, 1,
0.4872378, -1.526469, 4.06699, 1, 1, 1, 1, 1,
0.4893944, -0.2874284, 3.761939, 1, 1, 1, 1, 1,
0.4900016, -1.072833, 1.745369, 1, 1, 1, 1, 1,
0.4951308, 0.762915, 1.179241, 1, 1, 1, 1, 1,
0.4973275, -1.74147, 2.196982, 1, 1, 1, 1, 1,
0.499666, -1.838722, 2.934268, 0, 0, 1, 1, 1,
0.499902, 0.1178409, 0.82187, 1, 0, 0, 1, 1,
0.4999183, -1.959293, 3.229988, 1, 0, 0, 1, 1,
0.5011912, -0.3417798, 3.527642, 1, 0, 0, 1, 1,
0.5029712, 2.292577, 1.106933, 1, 0, 0, 1, 1,
0.5036023, -0.6888332, 3.390754, 1, 0, 0, 1, 1,
0.5078149, 0.1273495, 1.022414, 0, 0, 0, 1, 1,
0.5097652, 0.4858057, 1.323233, 0, 0, 0, 1, 1,
0.5121616, 1.068823, 0.3027518, 0, 0, 0, 1, 1,
0.5121651, 1.456706, 0.397138, 0, 0, 0, 1, 1,
0.5129554, 1.18351, 0.7795232, 0, 0, 0, 1, 1,
0.5136153, 0.4791766, 1.343333, 0, 0, 0, 1, 1,
0.5141742, 0.590439, 2.434143, 0, 0, 0, 1, 1,
0.5209711, 0.2487569, -0.09765032, 1, 1, 1, 1, 1,
0.5228457, 1.430081, 0.3502951, 1, 1, 1, 1, 1,
0.5317273, 1.738008, 0.2394277, 1, 1, 1, 1, 1,
0.532626, 0.6288323, -0.1259263, 1, 1, 1, 1, 1,
0.5347655, 1.15195, -0.09199266, 1, 1, 1, 1, 1,
0.5358954, 1.726135, 0.7295727, 1, 1, 1, 1, 1,
0.5380059, -2.035375, 4.479205, 1, 1, 1, 1, 1,
0.5403536, 0.4483185, 0.4419781, 1, 1, 1, 1, 1,
0.5441375, -0.376476, 1.747198, 1, 1, 1, 1, 1,
0.5442771, -0.0109187, 0.7748297, 1, 1, 1, 1, 1,
0.5481704, 0.3902638, 0.7970101, 1, 1, 1, 1, 1,
0.5517212, -0.8105033, 2.309231, 1, 1, 1, 1, 1,
0.5529596, 0.7075021, 0.9685153, 1, 1, 1, 1, 1,
0.5546362, -0.3507601, 2.589397, 1, 1, 1, 1, 1,
0.5566915, 0.1143048, 4.926136, 1, 1, 1, 1, 1,
0.5585053, 0.235482, 2.184008, 0, 0, 1, 1, 1,
0.5611398, 0.5101753, 0.6337836, 1, 0, 0, 1, 1,
0.5633391, 0.2247956, 0.9000126, 1, 0, 0, 1, 1,
0.5638179, -0.4687465, 2.060311, 1, 0, 0, 1, 1,
0.5688066, -0.7444581, 3.646663, 1, 0, 0, 1, 1,
0.5703626, 0.4958005, 1.842942, 1, 0, 0, 1, 1,
0.5730552, -1.497016, 1.43499, 0, 0, 0, 1, 1,
0.5732332, -0.3671498, 1.898547, 0, 0, 0, 1, 1,
0.5776536, 2.842063, -0.1597123, 0, 0, 0, 1, 1,
0.5806909, 1.674458, 0.1608281, 0, 0, 0, 1, 1,
0.5824341, 1.674479, 1.711156, 0, 0, 0, 1, 1,
0.5827793, -0.2533139, 3.044468, 0, 0, 0, 1, 1,
0.5863816, -0.7840285, 2.437169, 0, 0, 0, 1, 1,
0.5874746, 0.08504259, 1.061764, 1, 1, 1, 1, 1,
0.5881557, 1.070832, 1.693182, 1, 1, 1, 1, 1,
0.5891225, 1.065738, 2.053157, 1, 1, 1, 1, 1,
0.5981215, 2.583815, 2.063319, 1, 1, 1, 1, 1,
0.5992234, 0.1690907, -0.02601035, 1, 1, 1, 1, 1,
0.6053429, 1.43118, 1.069172, 1, 1, 1, 1, 1,
0.6099741, -0.07787342, 1.489545, 1, 1, 1, 1, 1,
0.6149019, 1.549302, -1.235994, 1, 1, 1, 1, 1,
0.6188951, 0.7598481, 0.4821221, 1, 1, 1, 1, 1,
0.6233414, 0.09194406, 1.258986, 1, 1, 1, 1, 1,
0.6321782, -0.7246651, 1.51252, 1, 1, 1, 1, 1,
0.6387698, 1.177051, 0.9904166, 1, 1, 1, 1, 1,
0.6429058, 1.322594, -1.089748, 1, 1, 1, 1, 1,
0.6461557, -0.1276929, 1.189147, 1, 1, 1, 1, 1,
0.6477131, 0.3978197, 0.2868761, 1, 1, 1, 1, 1,
0.6629421, 0.5428061, -0.3608668, 0, 0, 1, 1, 1,
0.6637642, -0.592714, 1.360122, 1, 0, 0, 1, 1,
0.6664968, -0.2804273, 2.851246, 1, 0, 0, 1, 1,
0.676221, -0.7836864, 1.011532, 1, 0, 0, 1, 1,
0.6824251, -0.8340535, 0.3022205, 1, 0, 0, 1, 1,
0.6826068, 0.1164756, 2.042279, 1, 0, 0, 1, 1,
0.6836476, 0.3944722, 0.3582339, 0, 0, 0, 1, 1,
0.6854007, 0.9739266, 0.2625608, 0, 0, 0, 1, 1,
0.686415, 0.5223815, 0.9464825, 0, 0, 0, 1, 1,
0.6884817, 1.789842, 1.126993, 0, 0, 0, 1, 1,
0.6960657, 1.409536, -0.1540963, 0, 0, 0, 1, 1,
0.6991302, -1.093762, 2.134518, 0, 0, 0, 1, 1,
0.7056192, -0.20015, 1.452043, 0, 0, 0, 1, 1,
0.7059087, 0.8478778, 2.923285, 1, 1, 1, 1, 1,
0.7135121, 1.76917, 2.267411, 1, 1, 1, 1, 1,
0.7149859, -2.33398, 3.550113, 1, 1, 1, 1, 1,
0.716269, -1.058317, 3.422181, 1, 1, 1, 1, 1,
0.7195396, 0.09070364, 1.032158, 1, 1, 1, 1, 1,
0.7289814, 0.7376887, 1.419023, 1, 1, 1, 1, 1,
0.7301458, -1.001911, 2.087539, 1, 1, 1, 1, 1,
0.7309613, 1.185166, 0.8958807, 1, 1, 1, 1, 1,
0.7312005, -1.349951, 1.850273, 1, 1, 1, 1, 1,
0.7348796, -1.505214, 3.307021, 1, 1, 1, 1, 1,
0.7365746, 1.38354, 0.6596385, 1, 1, 1, 1, 1,
0.7371551, 0.3543901, 1.093803, 1, 1, 1, 1, 1,
0.738976, -0.8514428, 4.010879, 1, 1, 1, 1, 1,
0.7425047, 0.3419997, 1.925554, 1, 1, 1, 1, 1,
0.7481267, -0.713979, 3.061496, 1, 1, 1, 1, 1,
0.7565797, 0.3532555, 2.284317, 0, 0, 1, 1, 1,
0.7694225, 1.161957, 0.2569514, 1, 0, 0, 1, 1,
0.7723289, 0.7714878, 1.207935, 1, 0, 0, 1, 1,
0.773028, -1.436807, 2.201775, 1, 0, 0, 1, 1,
0.7751687, -0.2109679, 1.072862, 1, 0, 0, 1, 1,
0.7776813, -0.178848, 2.97451, 1, 0, 0, 1, 1,
0.7811664, -0.2578044, 2.144103, 0, 0, 0, 1, 1,
0.7859163, 1.76894, 0.5725157, 0, 0, 0, 1, 1,
0.7864957, 1.258612, 0.7464547, 0, 0, 0, 1, 1,
0.7874069, 1.104939, 2.152755, 0, 0, 0, 1, 1,
0.7902697, 0.2651536, 1.531034, 0, 0, 0, 1, 1,
0.7966085, -1.429365, 3.826305, 0, 0, 0, 1, 1,
0.7981016, 0.2742586, 2.212316, 0, 0, 0, 1, 1,
0.7987239, -0.4757255, 3.105327, 1, 1, 1, 1, 1,
0.8011116, -1.167779, 2.947804, 1, 1, 1, 1, 1,
0.8093947, 0.08853326, 2.938316, 1, 1, 1, 1, 1,
0.8094998, 0.7857312, 1.314259, 1, 1, 1, 1, 1,
0.8120353, -1.099466, 2.62487, 1, 1, 1, 1, 1,
0.8252059, 0.7893919, 1.800693, 1, 1, 1, 1, 1,
0.8289878, 1.078817, 0.5451984, 1, 1, 1, 1, 1,
0.8294466, 0.2638886, 1.324281, 1, 1, 1, 1, 1,
0.8340592, -1.019875, 2.287462, 1, 1, 1, 1, 1,
0.8423663, 0.5691265, -0.1652877, 1, 1, 1, 1, 1,
0.8455229, 0.8615518, 1.162466, 1, 1, 1, 1, 1,
0.8469421, 0.4061569, 0.2026533, 1, 1, 1, 1, 1,
0.8485546, -0.3007681, 0.475636, 1, 1, 1, 1, 1,
0.8552259, -0.7151831, 4.449689, 1, 1, 1, 1, 1,
0.8561279, -0.1602988, 3.067761, 1, 1, 1, 1, 1,
0.8571709, -0.1348129, 1.6808, 0, 0, 1, 1, 1,
0.8703837, 0.5088792, 0.8185291, 1, 0, 0, 1, 1,
0.870594, 1.741084, -0.7993084, 1, 0, 0, 1, 1,
0.8722441, 0.3532531, 1.298652, 1, 0, 0, 1, 1,
0.8741557, -0.9862161, 3.58798, 1, 0, 0, 1, 1,
0.8818147, -0.086711, 1.861937, 1, 0, 0, 1, 1,
0.8847838, -1.866279, 2.719554, 0, 0, 0, 1, 1,
0.8855423, -0.240306, 2.653886, 0, 0, 0, 1, 1,
0.8875641, 0.9646383, 0.3659812, 0, 0, 0, 1, 1,
0.8902774, -1.594042, 3.475631, 0, 0, 0, 1, 1,
0.894042, 0.06817102, 1.93554, 0, 0, 0, 1, 1,
0.8995075, 0.8507267, 1.267245, 0, 0, 0, 1, 1,
0.9022935, -0.5744948, 2.621117, 0, 0, 0, 1, 1,
0.9064549, 0.3709736, 2.38969, 1, 1, 1, 1, 1,
0.9116913, -1.430773, 2.731099, 1, 1, 1, 1, 1,
0.9183231, 0.1692434, 2.712688, 1, 1, 1, 1, 1,
0.9183569, -1.819367, 2.743127, 1, 1, 1, 1, 1,
0.9220249, 0.2571844, 2.744897, 1, 1, 1, 1, 1,
0.9256712, -0.1437296, 0.7756403, 1, 1, 1, 1, 1,
0.9273412, 0.3717256, 2.547435, 1, 1, 1, 1, 1,
0.9342695, 1.009818, 0.8884642, 1, 1, 1, 1, 1,
0.9471732, 0.722274, 0.6517649, 1, 1, 1, 1, 1,
0.9487013, 1.030116, 2.968813, 1, 1, 1, 1, 1,
0.9592115, -0.09996122, 0.2921063, 1, 1, 1, 1, 1,
0.962634, 0.0748415, 0.1227594, 1, 1, 1, 1, 1,
0.9639663, 0.3946236, 2.829075, 1, 1, 1, 1, 1,
0.9646822, -0.02855074, 2.937349, 1, 1, 1, 1, 1,
0.9770041, 0.3862671, 1.222463, 1, 1, 1, 1, 1,
0.9774798, 0.8892789, 0.6891681, 0, 0, 1, 1, 1,
0.9793239, 0.6797337, 1.970269, 1, 0, 0, 1, 1,
0.9817865, -0.05426701, 2.200581, 1, 0, 0, 1, 1,
0.9853973, 0.8595262, 0.7534754, 1, 0, 0, 1, 1,
0.987673, -0.8193352, 2.41404, 1, 0, 0, 1, 1,
0.9890976, -0.2371697, 2.180901, 1, 0, 0, 1, 1,
0.9935026, -0.5093315, 2.128201, 0, 0, 0, 1, 1,
0.997104, 2.263879, 1.355436, 0, 0, 0, 1, 1,
0.9983205, 1.432705, 1.30563, 0, 0, 0, 1, 1,
1.000925, 1.01953, -0.5072531, 0, 0, 0, 1, 1,
1.013938, -0.8880762, 2.731323, 0, 0, 0, 1, 1,
1.014896, -0.5870822, 1.256188, 0, 0, 0, 1, 1,
1.018404, 0.04804946, 2.834932, 0, 0, 0, 1, 1,
1.019094, -0.658992, -0.4139445, 1, 1, 1, 1, 1,
1.026365, 0.0005326531, 1.030619, 1, 1, 1, 1, 1,
1.035102, 1.503644, 2.329116, 1, 1, 1, 1, 1,
1.039562, -0.4909118, 1.804383, 1, 1, 1, 1, 1,
1.055943, -0.1110419, 1.72021, 1, 1, 1, 1, 1,
1.058569, -0.9379145, -0.06968644, 1, 1, 1, 1, 1,
1.061238, 0.1152824, 1.765598, 1, 1, 1, 1, 1,
1.063325, -0.03676566, 1.022222, 1, 1, 1, 1, 1,
1.071042, 0.4430416, 2.10048, 1, 1, 1, 1, 1,
1.071409, -1.447579, 3.589896, 1, 1, 1, 1, 1,
1.082827, -0.6908333, 2.307784, 1, 1, 1, 1, 1,
1.083198, -0.7612591, 1.973453, 1, 1, 1, 1, 1,
1.085841, -1.2642, 0.8667281, 1, 1, 1, 1, 1,
1.093285, 1.182177, 0.7533823, 1, 1, 1, 1, 1,
1.093699, -0.631441, 1.845819, 1, 1, 1, 1, 1,
1.096997, -0.977146, 1.23862, 0, 0, 1, 1, 1,
1.099639, 1.653835, 1.096283, 1, 0, 0, 1, 1,
1.102907, 2.346817, 1.376472, 1, 0, 0, 1, 1,
1.108295, 0.8856759, 0.6985209, 1, 0, 0, 1, 1,
1.109076, 0.1129334, 0.407174, 1, 0, 0, 1, 1,
1.11486, -0.05492463, 2.000301, 1, 0, 0, 1, 1,
1.116392, -0.5079495, 3.630348, 0, 0, 0, 1, 1,
1.130669, -1.102516, 2.262505, 0, 0, 0, 1, 1,
1.137113, -0.1479388, 1.457484, 0, 0, 0, 1, 1,
1.143072, -2.177773, 2.735621, 0, 0, 0, 1, 1,
1.146569, -1.275338, 2.567522, 0, 0, 0, 1, 1,
1.147487, 0.837927, -0.3404605, 0, 0, 0, 1, 1,
1.151966, 0.353064, 1.698367, 0, 0, 0, 1, 1,
1.161405, -0.725863, 1.859061, 1, 1, 1, 1, 1,
1.162979, 0.5603455, 1.698631, 1, 1, 1, 1, 1,
1.163005, -0.08858982, 1.458114, 1, 1, 1, 1, 1,
1.166241, -0.6855232, 1.755866, 1, 1, 1, 1, 1,
1.167116, 0.9792539, 1.718829, 1, 1, 1, 1, 1,
1.172069, -0.5664784, 2.063161, 1, 1, 1, 1, 1,
1.172143, -0.7624771, 2.454731, 1, 1, 1, 1, 1,
1.181219, -1.121435, 0.9146175, 1, 1, 1, 1, 1,
1.18878, 1.400628, 0.1039992, 1, 1, 1, 1, 1,
1.200883, 2.007106, 0.4223544, 1, 1, 1, 1, 1,
1.203257, 0.9194704, 1.97938, 1, 1, 1, 1, 1,
1.204095, 0.08753156, 0.1861693, 1, 1, 1, 1, 1,
1.211122, 1.071772, 0.9396726, 1, 1, 1, 1, 1,
1.213938, -0.8542942, 1.779868, 1, 1, 1, 1, 1,
1.216376, -1.453977, 2.388302, 1, 1, 1, 1, 1,
1.216702, -0.3401255, 1.306495, 0, 0, 1, 1, 1,
1.218897, 0.6583952, 2.802217, 1, 0, 0, 1, 1,
1.225544, -1.407764, 2.600801, 1, 0, 0, 1, 1,
1.231005, -2.003798, 2.537884, 1, 0, 0, 1, 1,
1.243893, 1.128204, 0.3363824, 1, 0, 0, 1, 1,
1.258186, 1.940291, -0.9996156, 1, 0, 0, 1, 1,
1.264018, -0.5929357, 1.068947, 0, 0, 0, 1, 1,
1.265828, -0.2665596, 1.029077, 0, 0, 0, 1, 1,
1.268532, -0.7737999, 1.920249, 0, 0, 0, 1, 1,
1.271505, -0.4194835, 2.319661, 0, 0, 0, 1, 1,
1.28094, -0.4677721, 0.8169373, 0, 0, 0, 1, 1,
1.284643, -0.9828127, 1.664549, 0, 0, 0, 1, 1,
1.288623, -1.949281, 3.21077, 0, 0, 0, 1, 1,
1.293863, -0.240993, 0.1450456, 1, 1, 1, 1, 1,
1.312577, -0.8325692, 2.323996, 1, 1, 1, 1, 1,
1.319481, 0.3333551, 0.6698564, 1, 1, 1, 1, 1,
1.334163, -1.91013, 2.946651, 1, 1, 1, 1, 1,
1.345979, 0.8872657, 0.7258348, 1, 1, 1, 1, 1,
1.346722, 0.8088145, 2.48528, 1, 1, 1, 1, 1,
1.373329, -0.1378388, 2.398702, 1, 1, 1, 1, 1,
1.384788, 1.183603, 0.8323306, 1, 1, 1, 1, 1,
1.403072, 0.1892617, 1.107764, 1, 1, 1, 1, 1,
1.415129, -0.08160458, 1.877591, 1, 1, 1, 1, 1,
1.440265, 0.8006154, 0.6847972, 1, 1, 1, 1, 1,
1.446284, -1.073269, 0.7334345, 1, 1, 1, 1, 1,
1.469626, -1.131616, 3.318268, 1, 1, 1, 1, 1,
1.473831, -1.570688, 1.309911, 1, 1, 1, 1, 1,
1.482517, 0.1573049, 2.219441, 1, 1, 1, 1, 1,
1.488943, -0.7785937, 3.348863, 0, 0, 1, 1, 1,
1.489634, 2.595696, 0.9614998, 1, 0, 0, 1, 1,
1.496636, 0.7219948, 2.48561, 1, 0, 0, 1, 1,
1.51293, -0.4449289, 1.290668, 1, 0, 0, 1, 1,
1.514002, 1.989441, 1.138839, 1, 0, 0, 1, 1,
1.514056, 0.1238559, 0.2596103, 1, 0, 0, 1, 1,
1.516124, -0.2411878, 1.494887, 0, 0, 0, 1, 1,
1.540769, 0.1889033, 1.993753, 0, 0, 0, 1, 1,
1.553011, -0.1534096, 1.441511, 0, 0, 0, 1, 1,
1.55519, -0.9281949, 3.491239, 0, 0, 0, 1, 1,
1.559934, -0.5678262, 3.096234, 0, 0, 0, 1, 1,
1.565772, 0.9187421, 1.609182, 0, 0, 0, 1, 1,
1.573867, -0.5466419, 2.738555, 0, 0, 0, 1, 1,
1.574998, 0.09193373, 0.9820526, 1, 1, 1, 1, 1,
1.578807, 1.230378, 1.912202, 1, 1, 1, 1, 1,
1.5858, -0.3434882, 1.695021, 1, 1, 1, 1, 1,
1.593764, 0.3065804, 2.045174, 1, 1, 1, 1, 1,
1.594873, -1.261614, 1.894593, 1, 1, 1, 1, 1,
1.603954, -0.6778803, 1.455039, 1, 1, 1, 1, 1,
1.605673, 0.8192968, 2.288678, 1, 1, 1, 1, 1,
1.617608, -0.007677789, 0.4900909, 1, 1, 1, 1, 1,
1.625927, 1.433753, 2.411452, 1, 1, 1, 1, 1,
1.628372, 1.350957, 0.8024613, 1, 1, 1, 1, 1,
1.634077, 0.5770388, 0.9005315, 1, 1, 1, 1, 1,
1.660121, 0.06896572, 2.648504, 1, 1, 1, 1, 1,
1.681266, -0.0202117, 0.9342546, 1, 1, 1, 1, 1,
1.688864, 1.497136, 0.7851923, 1, 1, 1, 1, 1,
1.707906, -0.6428207, 0.6233173, 1, 1, 1, 1, 1,
1.72272, 0.3404217, 1.24224, 0, 0, 1, 1, 1,
1.728279, 0.4368724, 1.594916, 1, 0, 0, 1, 1,
1.744137, -0.8142018, 2.051645, 1, 0, 0, 1, 1,
1.754084, -0.7311837, 1.24867, 1, 0, 0, 1, 1,
1.781672, -0.1527741, 1.281126, 1, 0, 0, 1, 1,
1.786808, -0.08197494, 2.683109, 1, 0, 0, 1, 1,
1.804448, 1.047592, -0.2847359, 0, 0, 0, 1, 1,
1.804779, 0.6431097, 0.2347975, 0, 0, 0, 1, 1,
1.808416, -0.7166391, 3.040426, 0, 0, 0, 1, 1,
1.810974, 1.174994, -0.4249495, 0, 0, 0, 1, 1,
1.819438, -0.3088588, 3.135182, 0, 0, 0, 1, 1,
1.834022, 2.452362, 0.3403247, 0, 0, 0, 1, 1,
1.849228, 0.5027589, 1.305807, 0, 0, 0, 1, 1,
1.864987, -0.5225357, 3.498746, 1, 1, 1, 1, 1,
1.893633, 0.7972408, 2.566753, 1, 1, 1, 1, 1,
1.901502, -1.227072, 2.461171, 1, 1, 1, 1, 1,
1.91405, 0.1705154, 0.617379, 1, 1, 1, 1, 1,
1.918682, 1.383911, 2.784799, 1, 1, 1, 1, 1,
1.93047, -0.648204, 1.76449, 1, 1, 1, 1, 1,
1.942212, -0.8885321, 0.3870025, 1, 1, 1, 1, 1,
1.953765, -1.728652, 2.53481, 1, 1, 1, 1, 1,
1.962478, -0.2508157, 0.7772851, 1, 1, 1, 1, 1,
1.975288, -0.824076, 3.5763, 1, 1, 1, 1, 1,
1.989045, -0.3078563, 1.273309, 1, 1, 1, 1, 1,
2.034785, 0.123881, 1.842601, 1, 1, 1, 1, 1,
2.049315, 1.327057, -0.663658, 1, 1, 1, 1, 1,
2.065608, -1.171412, 1.838984, 1, 1, 1, 1, 1,
2.068174, -0.5960844, 1.712046, 1, 1, 1, 1, 1,
2.076782, -1.725267, 2.493251, 0, 0, 1, 1, 1,
2.12634, -1.549316, 2.599774, 1, 0, 0, 1, 1,
2.171165, -0.917719, 1.363289, 1, 0, 0, 1, 1,
2.182327, 0.2334452, 0.08282838, 1, 0, 0, 1, 1,
2.184573, -0.3711466, -0.8374312, 1, 0, 0, 1, 1,
2.21233, -0.9417234, 2.266357, 1, 0, 0, 1, 1,
2.228772, 0.614724, 1.276598, 0, 0, 0, 1, 1,
2.24352, -0.7810189, 2.482965, 0, 0, 0, 1, 1,
2.244211, -0.05076693, 0.6587335, 0, 0, 0, 1, 1,
2.282761, 0.291356, -0.3804584, 0, 0, 0, 1, 1,
2.29212, -1.566334, 3.274799, 0, 0, 0, 1, 1,
2.31646, -1.109912, 4.00705, 0, 0, 0, 1, 1,
2.321191, -0.7125381, 2.007331, 0, 0, 0, 1, 1,
2.36134, 1.100348, 1.502916, 1, 1, 1, 1, 1,
2.373803, 0.1755649, 1.611501, 1, 1, 1, 1, 1,
2.385448, 0.3009294, 2.528127, 1, 1, 1, 1, 1,
2.426637, 1.007055, 0.7766241, 1, 1, 1, 1, 1,
2.486099, -1.071644, 0.9792697, 1, 1, 1, 1, 1,
2.495167, 1.416284, 3.726835, 1, 1, 1, 1, 1,
2.865468, -1.685191, 1.72189, 1, 1, 1, 1, 1
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
var radius = 9.513897;
var distance = 33.41716;
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
mvMatrix.translate( 0.4242028, 0.2298446, 0.1163545 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.41716);
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
