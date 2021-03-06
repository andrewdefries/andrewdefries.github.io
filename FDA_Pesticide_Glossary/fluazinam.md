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
-3.275332, 0.7561074, -1.113605, 1, 0, 0, 1,
-3.182445, 0.2951466, -2.397072, 1, 0.007843138, 0, 1,
-2.973938, 0.1410116, -0.6984546, 1, 0.01176471, 0, 1,
-2.924998, -0.6128553, -3.209513, 1, 0.01960784, 0, 1,
-2.820893, -1.034642, -4.156515, 1, 0.02352941, 0, 1,
-2.787219, 0.5318639, -0.8378533, 1, 0.03137255, 0, 1,
-2.550711, -1.934385, -3.54801, 1, 0.03529412, 0, 1,
-2.514437, -1.104327, -0.2148009, 1, 0.04313726, 0, 1,
-2.398967, -0.04818133, -2.575545, 1, 0.04705882, 0, 1,
-2.383764, 0.8892646, -0.5664946, 1, 0.05490196, 0, 1,
-2.358841, 0.3644122, -2.04697, 1, 0.05882353, 0, 1,
-2.337688, 1.551086, -3.22998, 1, 0.06666667, 0, 1,
-2.332271, -1.409923, -1.19112, 1, 0.07058824, 0, 1,
-2.234565, -0.0868538, -0.7409661, 1, 0.07843138, 0, 1,
-2.222376, 0.2927362, -1.230756, 1, 0.08235294, 0, 1,
-2.201696, 1.704602, 0.9976763, 1, 0.09019608, 0, 1,
-2.162359, -0.9652102, -1.508929, 1, 0.09411765, 0, 1,
-2.091816, 0.7427841, -0.1152809, 1, 0.1019608, 0, 1,
-2.084296, 2.370552, -1.003134, 1, 0.1098039, 0, 1,
-2.061223, -0.3447703, -2.41185, 1, 0.1137255, 0, 1,
-2.019921, 1.009498, -1.309355, 1, 0.1215686, 0, 1,
-2.008909, 0.1136881, -2.458281, 1, 0.1254902, 0, 1,
-1.998779, -0.3477969, 0.7812681, 1, 0.1333333, 0, 1,
-1.978967, 0.5258098, -3.853928, 1, 0.1372549, 0, 1,
-1.97712, -0.7962769, -2.537107, 1, 0.145098, 0, 1,
-1.92495, 0.2174656, 0.296808, 1, 0.1490196, 0, 1,
-1.917343, -1.744555, -2.822251, 1, 0.1568628, 0, 1,
-1.898255, 0.1114227, -0.9901278, 1, 0.1607843, 0, 1,
-1.882796, -0.2730669, -2.608902, 1, 0.1686275, 0, 1,
-1.87918, 0.5880694, -2.101928, 1, 0.172549, 0, 1,
-1.866367, -0.2222407, -1.35438, 1, 0.1803922, 0, 1,
-1.853265, -0.863588, -2.470938, 1, 0.1843137, 0, 1,
-1.829794, -1.029736, 0.5125045, 1, 0.1921569, 0, 1,
-1.824298, 0.3608014, -0.9530916, 1, 0.1960784, 0, 1,
-1.820711, -0.6008978, -2.120406, 1, 0.2039216, 0, 1,
-1.814805, 0.8493857, -2.827354, 1, 0.2117647, 0, 1,
-1.8141, 0.8858897, -1.395278, 1, 0.2156863, 0, 1,
-1.797505, 1.23347, -0.8149097, 1, 0.2235294, 0, 1,
-1.783861, -0.7167896, -2.458921, 1, 0.227451, 0, 1,
-1.778532, -0.4443453, -4.297828, 1, 0.2352941, 0, 1,
-1.773283, 1.376415, 0.1037893, 1, 0.2392157, 0, 1,
-1.737848, -0.7119519, -3.447359, 1, 0.2470588, 0, 1,
-1.737114, 0.3924056, -1.078107, 1, 0.2509804, 0, 1,
-1.722088, -0.05011604, -0.6636214, 1, 0.2588235, 0, 1,
-1.700052, 0.07236478, -3.82566, 1, 0.2627451, 0, 1,
-1.684671, 1.40984, 0.8799914, 1, 0.2705882, 0, 1,
-1.671816, 0.190051, -0.7519838, 1, 0.2745098, 0, 1,
-1.659134, 0.5982689, -1.499748, 1, 0.282353, 0, 1,
-1.652673, 0.2904654, -1.08808, 1, 0.2862745, 0, 1,
-1.652164, -1.239837, -0.7885287, 1, 0.2941177, 0, 1,
-1.646309, 0.1830976, -2.738915, 1, 0.3019608, 0, 1,
-1.637963, -0.6159754, -0.03358939, 1, 0.3058824, 0, 1,
-1.637558, -0.6708071, -2.783832, 1, 0.3137255, 0, 1,
-1.633811, -0.9016416, -2.342033, 1, 0.3176471, 0, 1,
-1.627926, 0.9287574, -1.936234, 1, 0.3254902, 0, 1,
-1.622472, 0.01818435, -0.7828339, 1, 0.3294118, 0, 1,
-1.604234, -0.4504326, -1.315566, 1, 0.3372549, 0, 1,
-1.593422, -0.6687071, -1.164742, 1, 0.3411765, 0, 1,
-1.592389, -0.5460413, -2.465867, 1, 0.3490196, 0, 1,
-1.58873, 0.2975419, -2.491776, 1, 0.3529412, 0, 1,
-1.582992, -0.968178, -1.642052, 1, 0.3607843, 0, 1,
-1.577397, 1.148638, -2.064249, 1, 0.3647059, 0, 1,
-1.558403, 0.2607615, -0.8804643, 1, 0.372549, 0, 1,
-1.541352, 0.07655597, -2.321604, 1, 0.3764706, 0, 1,
-1.516364, 1.560753, -0.5673797, 1, 0.3843137, 0, 1,
-1.51454, -2.165344, -2.617133, 1, 0.3882353, 0, 1,
-1.510631, -0.4018551, -1.712344, 1, 0.3960784, 0, 1,
-1.48842, -1.036211, -2.527381, 1, 0.4039216, 0, 1,
-1.488381, -0.194452, -1.564019, 1, 0.4078431, 0, 1,
-1.477983, -1.089997, -1.916774, 1, 0.4156863, 0, 1,
-1.470629, -0.5380734, -2.933095, 1, 0.4196078, 0, 1,
-1.469882, -0.6583258, -0.6811647, 1, 0.427451, 0, 1,
-1.467159, -0.1368194, -1.489876, 1, 0.4313726, 0, 1,
-1.466048, 0.1591954, -1.203251, 1, 0.4392157, 0, 1,
-1.452859, 0.1083903, -0.005654315, 1, 0.4431373, 0, 1,
-1.439732, -1.01306, -1.029086, 1, 0.4509804, 0, 1,
-1.420608, -0.5881335, -4.260936, 1, 0.454902, 0, 1,
-1.41732, -0.1743168, -0.4897531, 1, 0.4627451, 0, 1,
-1.402375, -0.9142492, -2.64223, 1, 0.4666667, 0, 1,
-1.39777, 0.8526709, -0.03268189, 1, 0.4745098, 0, 1,
-1.380486, 1.067564, -1.7133, 1, 0.4784314, 0, 1,
-1.376908, 1.552462, 1.181874, 1, 0.4862745, 0, 1,
-1.374917, -0.5025102, -0.5954531, 1, 0.4901961, 0, 1,
-1.372257, -0.9166018, -3.989314, 1, 0.4980392, 0, 1,
-1.369005, -1.160981, -2.349388, 1, 0.5058824, 0, 1,
-1.344644, -0.2137434, -3.290982, 1, 0.509804, 0, 1,
-1.342258, 0.515627, -0.7052293, 1, 0.5176471, 0, 1,
-1.331164, 0.4537387, -0.4866839, 1, 0.5215687, 0, 1,
-1.327124, -0.6030183, -4.588553, 1, 0.5294118, 0, 1,
-1.323064, 2.261814, -0.06012027, 1, 0.5333334, 0, 1,
-1.319332, 1.663208, -1.477723, 1, 0.5411765, 0, 1,
-1.315428, 0.8588389, -0.203496, 1, 0.5450981, 0, 1,
-1.308786, 0.4731999, -1.549894, 1, 0.5529412, 0, 1,
-1.306222, 2.191692, 0.8071973, 1, 0.5568628, 0, 1,
-1.291446, -0.7138354, -3.923832, 1, 0.5647059, 0, 1,
-1.286337, -1.08047, -1.438292, 1, 0.5686275, 0, 1,
-1.28501, -0.433435, -2.394726, 1, 0.5764706, 0, 1,
-1.283492, -1.427637, -0.8763033, 1, 0.5803922, 0, 1,
-1.272178, -0.1947186, -2.913412, 1, 0.5882353, 0, 1,
-1.270737, 0.8066188, -2.034628, 1, 0.5921569, 0, 1,
-1.260547, -0.9006579, -0.2922529, 1, 0.6, 0, 1,
-1.258218, -0.5933475, -1.45665, 1, 0.6078432, 0, 1,
-1.238507, -0.1164323, -4.056692, 1, 0.6117647, 0, 1,
-1.23411, 0.7782485, -1.705929, 1, 0.6196079, 0, 1,
-1.231623, -1.999159, -2.372206, 1, 0.6235294, 0, 1,
-1.221678, 0.3138566, 1.232393, 1, 0.6313726, 0, 1,
-1.220831, 1.266903, -0.9182097, 1, 0.6352941, 0, 1,
-1.204913, -0.579173, -1.98901, 1, 0.6431373, 0, 1,
-1.196851, -2.909677, -2.085598, 1, 0.6470588, 0, 1,
-1.190203, 0.9258329, -0.9145944, 1, 0.654902, 0, 1,
-1.177027, 0.9219019, -1.473786, 1, 0.6588235, 0, 1,
-1.17221, -0.201137, -1.53157, 1, 0.6666667, 0, 1,
-1.169221, -0.9491829, -3.256293, 1, 0.6705883, 0, 1,
-1.165754, -1.155737, -0.3286464, 1, 0.6784314, 0, 1,
-1.163063, -1.042675, -1.101678, 1, 0.682353, 0, 1,
-1.159666, 1.439123, -1.260015, 1, 0.6901961, 0, 1,
-1.159054, -1.022496, -1.621846, 1, 0.6941177, 0, 1,
-1.148478, -0.3339465, -2.609074, 1, 0.7019608, 0, 1,
-1.137724, 0.6267425, -2.061094, 1, 0.7098039, 0, 1,
-1.135495, 0.6779528, 0.5715741, 1, 0.7137255, 0, 1,
-1.130545, -1.221909, -1.460919, 1, 0.7215686, 0, 1,
-1.106696, -0.7650615, -1.961141, 1, 0.7254902, 0, 1,
-1.09802, 0.9693061, 1.424845, 1, 0.7333333, 0, 1,
-1.09607, 0.5233157, -1.818993, 1, 0.7372549, 0, 1,
-1.092092, -0.08677293, -1.346757, 1, 0.7450981, 0, 1,
-1.086551, -2.053371, -2.984922, 1, 0.7490196, 0, 1,
-1.081217, -1.181487, -2.318824, 1, 0.7568628, 0, 1,
-1.074723, -1.334625, -1.91748, 1, 0.7607843, 0, 1,
-1.071129, -0.7472285, -3.008764, 1, 0.7686275, 0, 1,
-1.067396, -1.44715, -2.137542, 1, 0.772549, 0, 1,
-1.065473, 0.3666527, -1.185488, 1, 0.7803922, 0, 1,
-1.064203, -1.817465, -1.570964, 1, 0.7843137, 0, 1,
-1.061678, -0.3416903, -1.83657, 1, 0.7921569, 0, 1,
-1.045617, 0.9525534, 0.2665425, 1, 0.7960784, 0, 1,
-1.044728, 2.178512, -0.4526367, 1, 0.8039216, 0, 1,
-1.04237, -1.051828, -2.871635, 1, 0.8117647, 0, 1,
-1.041436, 0.6819124, -1.031015, 1, 0.8156863, 0, 1,
-1.041401, -0.3060548, -2.671464, 1, 0.8235294, 0, 1,
-1.039788, -0.6745076, -1.578552, 1, 0.827451, 0, 1,
-1.036582, -1.096411, -2.05005, 1, 0.8352941, 0, 1,
-1.030182, 1.014667, -0.05149627, 1, 0.8392157, 0, 1,
-1.029747, 1.064873, -1.409412, 1, 0.8470588, 0, 1,
-1.021872, 0.267735, -1.264663, 1, 0.8509804, 0, 1,
-1.019931, -1.216133, -2.68826, 1, 0.8588235, 0, 1,
-1.019331, -0.6984369, -2.250462, 1, 0.8627451, 0, 1,
-1.016775, 2.367957, -0.2312797, 1, 0.8705882, 0, 1,
-0.9938943, -0.7644976, -0.9410606, 1, 0.8745098, 0, 1,
-0.985921, -0.01105893, -3.710013, 1, 0.8823529, 0, 1,
-0.980433, -0.04804218, -1.725705, 1, 0.8862745, 0, 1,
-0.9729142, -0.8383725, -2.845538, 1, 0.8941177, 0, 1,
-0.9713771, 0.1163948, -2.656696, 1, 0.8980392, 0, 1,
-0.9712501, 0.2610043, -0.4396809, 1, 0.9058824, 0, 1,
-0.9696053, -0.4520496, -2.484764, 1, 0.9137255, 0, 1,
-0.9692512, -0.05951654, -1.342536, 1, 0.9176471, 0, 1,
-0.9634355, 0.01359455, -1.455104, 1, 0.9254902, 0, 1,
-0.9632532, 1.428944, -2.072033, 1, 0.9294118, 0, 1,
-0.9524129, 0.2529391, -1.145644, 1, 0.9372549, 0, 1,
-0.9516935, 0.065863, -2.10204, 1, 0.9411765, 0, 1,
-0.9440106, -0.3963435, -1.325512, 1, 0.9490196, 0, 1,
-0.943791, -1.090809, -3.200413, 1, 0.9529412, 0, 1,
-0.9337912, 0.1300587, -2.473019, 1, 0.9607843, 0, 1,
-0.9334533, 0.4383648, -1.257647, 1, 0.9647059, 0, 1,
-0.925832, 1.242592, 0.8849086, 1, 0.972549, 0, 1,
-0.9194401, 0.2617765, -2.274043, 1, 0.9764706, 0, 1,
-0.9047204, 0.8480284, -1.072904, 1, 0.9843137, 0, 1,
-0.9039112, 0.1485367, -1.674273, 1, 0.9882353, 0, 1,
-0.9033032, 1.297747, -0.2878247, 1, 0.9960784, 0, 1,
-0.9023216, 0.2950415, -1.525877, 0.9960784, 1, 0, 1,
-0.9005458, 0.5059474, -0.5865874, 0.9921569, 1, 0, 1,
-0.8984156, 0.3780693, 0.04248922, 0.9843137, 1, 0, 1,
-0.8952444, -0.3005059, -2.165829, 0.9803922, 1, 0, 1,
-0.8910029, 0.8936938, -1.188691, 0.972549, 1, 0, 1,
-0.8879424, -0.4161121, -1.71308, 0.9686275, 1, 0, 1,
-0.8843535, 1.514361, -0.7905173, 0.9607843, 1, 0, 1,
-0.8747188, 0.7744055, -0.1477961, 0.9568627, 1, 0, 1,
-0.8695759, 1.110912, -0.6061716, 0.9490196, 1, 0, 1,
-0.8668976, 1.331032, -1.425757, 0.945098, 1, 0, 1,
-0.8657759, 0.3208753, -1.919957, 0.9372549, 1, 0, 1,
-0.864974, -0.5465316, -3.120557, 0.9333333, 1, 0, 1,
-0.8560356, 1.794906, 0.01864615, 0.9254902, 1, 0, 1,
-0.8557411, 1.017094, -2.036103, 0.9215686, 1, 0, 1,
-0.8552057, 0.148674, -1.662934, 0.9137255, 1, 0, 1,
-0.8538823, 0.4201542, -0.5495075, 0.9098039, 1, 0, 1,
-0.8522401, 0.3464037, -1.115301, 0.9019608, 1, 0, 1,
-0.8509161, -0.6487132, -3.527735, 0.8941177, 1, 0, 1,
-0.8504232, 1.800895, 0.5551264, 0.8901961, 1, 0, 1,
-0.848341, -0.1942849, -2.316198, 0.8823529, 1, 0, 1,
-0.8450544, -0.9274918, -3.271591, 0.8784314, 1, 0, 1,
-0.8439178, 0.5111755, -0.3732353, 0.8705882, 1, 0, 1,
-0.8421057, 0.8586905, -1.618826, 0.8666667, 1, 0, 1,
-0.8383333, -0.6500735, -1.886764, 0.8588235, 1, 0, 1,
-0.8361601, -0.2100243, -0.5723902, 0.854902, 1, 0, 1,
-0.8341169, -0.3259976, -2.12542, 0.8470588, 1, 0, 1,
-0.8283389, -0.6242948, -1.011843, 0.8431373, 1, 0, 1,
-0.8185995, -2.214363, -3.252167, 0.8352941, 1, 0, 1,
-0.8183281, -0.7763011, -2.088719, 0.8313726, 1, 0, 1,
-0.8145697, 1.981673, 0.678188, 0.8235294, 1, 0, 1,
-0.8091139, 0.3712621, -0.5041575, 0.8196079, 1, 0, 1,
-0.7948425, -0.2700032, -1.552424, 0.8117647, 1, 0, 1,
-0.7911975, 0.8053548, 0.6537546, 0.8078431, 1, 0, 1,
-0.7871923, 0.8773506, -1.341096, 0.8, 1, 0, 1,
-0.7776617, -1.359372, -1.563461, 0.7921569, 1, 0, 1,
-0.7747051, -1.24134, -2.279313, 0.7882353, 1, 0, 1,
-0.7726999, -1.035207, -1.839548, 0.7803922, 1, 0, 1,
-0.7721162, -0.1048504, -0.7479468, 0.7764706, 1, 0, 1,
-0.7698331, 0.296553, -0.7085751, 0.7686275, 1, 0, 1,
-0.7651948, -1.015357, -1.95729, 0.7647059, 1, 0, 1,
-0.757063, 1.298363, -0.1821422, 0.7568628, 1, 0, 1,
-0.7525538, -0.9433915, -1.772464, 0.7529412, 1, 0, 1,
-0.7525216, -0.7230112, -2.817473, 0.7450981, 1, 0, 1,
-0.7508299, 1.220728, 1.727005, 0.7411765, 1, 0, 1,
-0.7500026, -0.9617018, -3.233877, 0.7333333, 1, 0, 1,
-0.7438027, 0.5251411, -3.332409, 0.7294118, 1, 0, 1,
-0.740118, -1.836324, -2.853249, 0.7215686, 1, 0, 1,
-0.733634, 1.581443, -1.18626, 0.7176471, 1, 0, 1,
-0.7251843, -0.7935242, -2.676361, 0.7098039, 1, 0, 1,
-0.7234705, -0.7055418, -3.696544, 0.7058824, 1, 0, 1,
-0.722469, 0.2976129, -0.4511549, 0.6980392, 1, 0, 1,
-0.7180231, 2.890674, 1.214364, 0.6901961, 1, 0, 1,
-0.7173557, -1.255643, -2.65376, 0.6862745, 1, 0, 1,
-0.716405, 0.9295709, -1.804877, 0.6784314, 1, 0, 1,
-0.7091977, -0.9983388, -2.623427, 0.6745098, 1, 0, 1,
-0.7077891, -0.2761195, -1.193793, 0.6666667, 1, 0, 1,
-0.7066724, -1.83738, -3.976451, 0.6627451, 1, 0, 1,
-0.7037731, 1.590907, 1.324391, 0.654902, 1, 0, 1,
-0.7030129, 0.7643569, -1.054013, 0.6509804, 1, 0, 1,
-0.7026824, 0.5109009, 0.6697866, 0.6431373, 1, 0, 1,
-0.6920173, -0.3990064, -1.711551, 0.6392157, 1, 0, 1,
-0.6851196, 0.328399, -1.09317, 0.6313726, 1, 0, 1,
-0.6838654, -1.34621, -2.868605, 0.627451, 1, 0, 1,
-0.6831398, -0.5492508, -1.483783, 0.6196079, 1, 0, 1,
-0.6828848, 1.528262, -1.364757, 0.6156863, 1, 0, 1,
-0.6797345, -0.04101319, -0.8031789, 0.6078432, 1, 0, 1,
-0.6748832, -1.160159, -1.6177, 0.6039216, 1, 0, 1,
-0.6730638, 0.612839, 0.1026507, 0.5960785, 1, 0, 1,
-0.6723022, -1.028153, -3.366689, 0.5882353, 1, 0, 1,
-0.6668072, -1.489375, -2.502248, 0.5843138, 1, 0, 1,
-0.6646707, 0.09886729, -1.098252, 0.5764706, 1, 0, 1,
-0.6517445, -0.9056154, -2.951129, 0.572549, 1, 0, 1,
-0.646538, -0.2539158, -1.385406, 0.5647059, 1, 0, 1,
-0.6332045, 0.4456262, -2.069382, 0.5607843, 1, 0, 1,
-0.6231303, 0.3785074, -0.558378, 0.5529412, 1, 0, 1,
-0.6196803, 1.625606, -0.5306324, 0.5490196, 1, 0, 1,
-0.6195403, 0.05277212, -1.280417, 0.5411765, 1, 0, 1,
-0.6133943, -0.3942276, -2.947042, 0.5372549, 1, 0, 1,
-0.6103756, -0.1990798, -2.263104, 0.5294118, 1, 0, 1,
-0.6058506, 0.5225158, -0.7293651, 0.5254902, 1, 0, 1,
-0.6043907, -0.8079438, -0.9314555, 0.5176471, 1, 0, 1,
-0.6029192, 0.2806112, -1.179256, 0.5137255, 1, 0, 1,
-0.600031, -0.8320522, -1.252272, 0.5058824, 1, 0, 1,
-0.5991948, -1.65624, -2.407354, 0.5019608, 1, 0, 1,
-0.5979249, -1.20685, -1.275216, 0.4941176, 1, 0, 1,
-0.5962441, -1.627526, -2.456832, 0.4862745, 1, 0, 1,
-0.593103, -0.04529075, -1.364075, 0.4823529, 1, 0, 1,
-0.5926539, -2.326631, -4.085924, 0.4745098, 1, 0, 1,
-0.5918993, -1.017, -3.382215, 0.4705882, 1, 0, 1,
-0.589857, 0.4634172, -1.663081, 0.4627451, 1, 0, 1,
-0.5843474, 1.357724, -0.01986234, 0.4588235, 1, 0, 1,
-0.5832294, -0.06976046, 0.3117693, 0.4509804, 1, 0, 1,
-0.5792426, -0.9422061, -5.179981, 0.4470588, 1, 0, 1,
-0.574851, 0.1071785, -2.231112, 0.4392157, 1, 0, 1,
-0.5740027, 0.661218, -1.300608, 0.4352941, 1, 0, 1,
-0.5728931, -0.9171963, -2.168578, 0.427451, 1, 0, 1,
-0.5713031, -1.795661, -3.128965, 0.4235294, 1, 0, 1,
-0.5700912, -0.3821336, -3.899946, 0.4156863, 1, 0, 1,
-0.5643965, -0.3243786, -1.288501, 0.4117647, 1, 0, 1,
-0.5628065, -0.7598677, -2.793859, 0.4039216, 1, 0, 1,
-0.5604292, -1.290209, -3.046671, 0.3960784, 1, 0, 1,
-0.5524742, -0.6679539, -0.3215399, 0.3921569, 1, 0, 1,
-0.5499778, 0.8168805, -1.586857, 0.3843137, 1, 0, 1,
-0.54342, -0.6706762, -1.793632, 0.3803922, 1, 0, 1,
-0.5349212, -1.742167, -1.748703, 0.372549, 1, 0, 1,
-0.5340691, 0.2015144, -1.760856, 0.3686275, 1, 0, 1,
-0.5308208, 1.094165, -0.8252495, 0.3607843, 1, 0, 1,
-0.5172436, 1.081253, -0.732447, 0.3568628, 1, 0, 1,
-0.515835, -1.207032, -2.163419, 0.3490196, 1, 0, 1,
-0.5153649, 0.6238171, -0.8618658, 0.345098, 1, 0, 1,
-0.5140082, -1.591237, -2.680814, 0.3372549, 1, 0, 1,
-0.5129936, -0.1742016, -1.13811, 0.3333333, 1, 0, 1,
-0.5099494, 1.286497, -1.27188, 0.3254902, 1, 0, 1,
-0.5090905, -0.6153988, -2.038116, 0.3215686, 1, 0, 1,
-0.5038905, -0.7319751, -2.063433, 0.3137255, 1, 0, 1,
-0.5029629, 0.4718262, -0.9133164, 0.3098039, 1, 0, 1,
-0.5029415, -1.076064, -3.536278, 0.3019608, 1, 0, 1,
-0.4992653, -1.070275, -1.866763, 0.2941177, 1, 0, 1,
-0.4982488, -1.307543, -3.338282, 0.2901961, 1, 0, 1,
-0.4959577, 0.69056, -1.148321, 0.282353, 1, 0, 1,
-0.4954804, 0.6128069, -0.07045061, 0.2784314, 1, 0, 1,
-0.493283, -0.8013822, -3.931574, 0.2705882, 1, 0, 1,
-0.4931428, -0.1704229, -1.523255, 0.2666667, 1, 0, 1,
-0.485146, 0.7695487, 0.1453329, 0.2588235, 1, 0, 1,
-0.482147, 0.02122052, -0.7447298, 0.254902, 1, 0, 1,
-0.4811012, 0.04248246, -0.7242808, 0.2470588, 1, 0, 1,
-0.4806571, 1.022933, 1.203515, 0.2431373, 1, 0, 1,
-0.4797747, -1.522613, -3.418081, 0.2352941, 1, 0, 1,
-0.4761475, 0.6690507, -0.8842904, 0.2313726, 1, 0, 1,
-0.475053, 0.1530547, -1.160585, 0.2235294, 1, 0, 1,
-0.4741056, -0.3358186, -2.017503, 0.2196078, 1, 0, 1,
-0.4715644, -0.5379038, -1.293777, 0.2117647, 1, 0, 1,
-0.4712802, -0.4598311, -3.013185, 0.2078431, 1, 0, 1,
-0.4693437, -0.9798877, -3.219696, 0.2, 1, 0, 1,
-0.4662359, -0.4826274, -0.9632807, 0.1921569, 1, 0, 1,
-0.4659263, -1.151318, -2.649291, 0.1882353, 1, 0, 1,
-0.4651315, -0.9873577, -1.633116, 0.1803922, 1, 0, 1,
-0.4633893, -0.3471566, -1.996511, 0.1764706, 1, 0, 1,
-0.4626478, 0.8332606, -0.6592945, 0.1686275, 1, 0, 1,
-0.457563, -0.5472419, -2.179474, 0.1647059, 1, 0, 1,
-0.4561697, 0.3369893, -0.4950151, 0.1568628, 1, 0, 1,
-0.4549477, 0.4460454, 0.1768218, 0.1529412, 1, 0, 1,
-0.4543884, 3.090179, 1.875882, 0.145098, 1, 0, 1,
-0.4514559, -0.3055271, -0.85381, 0.1411765, 1, 0, 1,
-0.4507743, -1.013253, -0.5801293, 0.1333333, 1, 0, 1,
-0.4439375, 0.6686716, -0.09765658, 0.1294118, 1, 0, 1,
-0.4432133, -0.02531061, -1.338562, 0.1215686, 1, 0, 1,
-0.4373678, -0.8334481, -2.92539, 0.1176471, 1, 0, 1,
-0.4346867, -1.345404, -3.49441, 0.1098039, 1, 0, 1,
-0.4335973, 0.3293744, -0.0184629, 0.1058824, 1, 0, 1,
-0.4322704, 0.6645386, -1.129285, 0.09803922, 1, 0, 1,
-0.4278551, -1.493891, -2.891036, 0.09019608, 1, 0, 1,
-0.4212693, -0.8057488, -3.117792, 0.08627451, 1, 0, 1,
-0.4204859, -0.4792346, -2.240071, 0.07843138, 1, 0, 1,
-0.4192455, 1.405691, 0.9255255, 0.07450981, 1, 0, 1,
-0.4189581, 0.1001965, -1.737362, 0.06666667, 1, 0, 1,
-0.4189362, -0.5512513, -2.421445, 0.0627451, 1, 0, 1,
-0.4154605, 0.9527121, 0.5338548, 0.05490196, 1, 0, 1,
-0.4143015, 0.7886723, -1.024053, 0.05098039, 1, 0, 1,
-0.4130777, -0.1861475, -1.289872, 0.04313726, 1, 0, 1,
-0.4125725, -1.23557, -3.251548, 0.03921569, 1, 0, 1,
-0.4096245, -1.529495, -3.285595, 0.03137255, 1, 0, 1,
-0.4078927, 0.2241725, -3.930001, 0.02745098, 1, 0, 1,
-0.4033162, -0.5153875, -1.90804, 0.01960784, 1, 0, 1,
-0.4032724, 0.44559, -0.07127659, 0.01568628, 1, 0, 1,
-0.4024994, -0.4031005, -1.962022, 0.007843138, 1, 0, 1,
-0.3998502, -0.1450733, -1.592867, 0.003921569, 1, 0, 1,
-0.3976987, 0.02852307, -0.4462824, 0, 1, 0.003921569, 1,
-0.3956047, -0.5115861, -3.508617, 0, 1, 0.01176471, 1,
-0.387493, -0.3866213, -1.237416, 0, 1, 0.01568628, 1,
-0.385248, -1.549428, -1.87293, 0, 1, 0.02352941, 1,
-0.3788703, -1.909495, -4.878022, 0, 1, 0.02745098, 1,
-0.3779924, -0.1572683, -2.848886, 0, 1, 0.03529412, 1,
-0.3732183, 0.1250786, -1.98011, 0, 1, 0.03921569, 1,
-0.3724702, -0.1214502, -1.325763, 0, 1, 0.04705882, 1,
-0.3720582, 0.9296439, -2.519928, 0, 1, 0.05098039, 1,
-0.3713771, -0.8469744, -3.308508, 0, 1, 0.05882353, 1,
-0.3689187, 0.2391176, -0.7167671, 0, 1, 0.0627451, 1,
-0.3671075, -0.16738, -3.553167, 0, 1, 0.07058824, 1,
-0.3665246, 0.2902575, -1.312133, 0, 1, 0.07450981, 1,
-0.3662928, -0.830348, -2.023823, 0, 1, 0.08235294, 1,
-0.3610082, -0.2388585, -2.431953, 0, 1, 0.08627451, 1,
-0.3580376, -0.9592063, -4.049746, 0, 1, 0.09411765, 1,
-0.3573342, 1.349366, -0.1918271, 0, 1, 0.1019608, 1,
-0.3571938, -1.073318, -3.003922, 0, 1, 0.1058824, 1,
-0.3545994, 0.206275, -0.9001444, 0, 1, 0.1137255, 1,
-0.3523154, -1.591702, -3.949487, 0, 1, 0.1176471, 1,
-0.347136, -0.3165987, -3.035573, 0, 1, 0.1254902, 1,
-0.3445184, -1.185178, -3.906714, 0, 1, 0.1294118, 1,
-0.3428353, -0.5277933, -1.660105, 0, 1, 0.1372549, 1,
-0.3373374, -0.9119514, -3.022987, 0, 1, 0.1411765, 1,
-0.3355653, -0.02078005, -1.718906, 0, 1, 0.1490196, 1,
-0.3349373, -0.7071481, 0.2523055, 0, 1, 0.1529412, 1,
-0.3319989, 0.2416461, -0.2611011, 0, 1, 0.1607843, 1,
-0.3297375, -0.9484696, -3.82548, 0, 1, 0.1647059, 1,
-0.3295413, 0.06954876, -0.3649113, 0, 1, 0.172549, 1,
-0.3266175, -1.237707, -5.241063, 0, 1, 0.1764706, 1,
-0.3264856, -1.171358, -2.371236, 0, 1, 0.1843137, 1,
-0.3231576, 0.4798706, -2.233027, 0, 1, 0.1882353, 1,
-0.3209377, 0.7267674, -1.495789, 0, 1, 0.1960784, 1,
-0.3203962, -2.872521, -2.598421, 0, 1, 0.2039216, 1,
-0.316866, 0.1793645, -2.282349, 0, 1, 0.2078431, 1,
-0.3162313, -1.756485, -3.669622, 0, 1, 0.2156863, 1,
-0.3148258, 0.4606539, -0.9343174, 0, 1, 0.2196078, 1,
-0.3142538, 0.5072543, -0.051412, 0, 1, 0.227451, 1,
-0.3113804, -1.155184, -5.927424, 0, 1, 0.2313726, 1,
-0.3107487, -0.2006278, -2.907244, 0, 1, 0.2392157, 1,
-0.3103662, -1.422847, -3.226723, 0, 1, 0.2431373, 1,
-0.3085264, -0.6375088, -4.216852, 0, 1, 0.2509804, 1,
-0.3024507, 2.464791, -0.1891875, 0, 1, 0.254902, 1,
-0.3024395, 0.02481211, -0.8017885, 0, 1, 0.2627451, 1,
-0.2989213, -1.699824, -1.764993, 0, 1, 0.2666667, 1,
-0.2987321, 0.9147064, -0.4816205, 0, 1, 0.2745098, 1,
-0.2982354, 0.08849714, -1.883159, 0, 1, 0.2784314, 1,
-0.2943046, 0.2717456, -1.414261, 0, 1, 0.2862745, 1,
-0.2934629, -0.9478894, -2.731727, 0, 1, 0.2901961, 1,
-0.2921236, 1.093351, -2.185525, 0, 1, 0.2980392, 1,
-0.2913694, 0.02145802, -0.6876096, 0, 1, 0.3058824, 1,
-0.2905362, 1.219085, -0.6897866, 0, 1, 0.3098039, 1,
-0.2903771, 0.6526317, 0.3229088, 0, 1, 0.3176471, 1,
-0.285608, -1.126522, -2.85151, 0, 1, 0.3215686, 1,
-0.2844979, 0.9167265, -0.5748408, 0, 1, 0.3294118, 1,
-0.2837574, -0.05311618, -2.25699, 0, 1, 0.3333333, 1,
-0.281825, 1.436834, 0.7586706, 0, 1, 0.3411765, 1,
-0.2770392, 0.4567073, -1.722309, 0, 1, 0.345098, 1,
-0.2744547, 0.5582554, -2.401835, 0, 1, 0.3529412, 1,
-0.2722836, 0.8908027, 1.407058, 0, 1, 0.3568628, 1,
-0.2719383, -0.07200915, -1.760437, 0, 1, 0.3647059, 1,
-0.2718471, -0.8268824, -2.725674, 0, 1, 0.3686275, 1,
-0.2706835, 0.6120416, -0.1311236, 0, 1, 0.3764706, 1,
-0.2683193, -0.8607306, -2.977777, 0, 1, 0.3803922, 1,
-0.2653651, -0.3827612, -1.704451, 0, 1, 0.3882353, 1,
-0.2651753, -0.2967325, -3.309052, 0, 1, 0.3921569, 1,
-0.2639573, 0.3571624, -0.8643975, 0, 1, 0.4, 1,
-0.2625796, 0.5660303, 0.6613797, 0, 1, 0.4078431, 1,
-0.2610177, -0.9041309, -3.980322, 0, 1, 0.4117647, 1,
-0.2608082, 0.1709445, -1.642905, 0, 1, 0.4196078, 1,
-0.2576719, 0.5684334, 0.8964149, 0, 1, 0.4235294, 1,
-0.2559611, -0.8380789, -5.043342, 0, 1, 0.4313726, 1,
-0.254673, -0.3335996, -5.471011, 0, 1, 0.4352941, 1,
-0.2529355, 0.2417667, -1.18994, 0, 1, 0.4431373, 1,
-0.2505576, -1.070786, -2.12718, 0, 1, 0.4470588, 1,
-0.2469539, -0.05270331, -1.63448, 0, 1, 0.454902, 1,
-0.2460247, 1.078036, -0.8707386, 0, 1, 0.4588235, 1,
-0.2460095, 1.084142, 0.1684308, 0, 1, 0.4666667, 1,
-0.242233, -1.247058, -1.691719, 0, 1, 0.4705882, 1,
-0.2393616, 0.5737444, 1.575067, 0, 1, 0.4784314, 1,
-0.2391808, 1.79794, -0.8389704, 0, 1, 0.4823529, 1,
-0.2385655, 0.02820494, -1.886722, 0, 1, 0.4901961, 1,
-0.2370638, 0.5571087, -1.580203, 0, 1, 0.4941176, 1,
-0.2366189, 0.2525196, -0.1687854, 0, 1, 0.5019608, 1,
-0.2359801, -1.602497, -2.797472, 0, 1, 0.509804, 1,
-0.2317876, 0.1713213, -0.3959961, 0, 1, 0.5137255, 1,
-0.2280471, 0.7736603, -0.307023, 0, 1, 0.5215687, 1,
-0.2264936, 0.3119725, -1.222078, 0, 1, 0.5254902, 1,
-0.2221675, -0.9435917, -1.776696, 0, 1, 0.5333334, 1,
-0.2197095, 0.6466027, 0.4654252, 0, 1, 0.5372549, 1,
-0.2169438, -0.4088086, -2.550251, 0, 1, 0.5450981, 1,
-0.2133355, 1.54274, 0.6545272, 0, 1, 0.5490196, 1,
-0.2122581, 0.7603463, -0.8531362, 0, 1, 0.5568628, 1,
-0.2103622, -0.1085001, -3.963766, 0, 1, 0.5607843, 1,
-0.2082602, 1.7424, -1.979557, 0, 1, 0.5686275, 1,
-0.2015019, -0.01315174, -2.149153, 0, 1, 0.572549, 1,
-0.200762, 0.583442, 0.5505739, 0, 1, 0.5803922, 1,
-0.1995778, -0.4744243, -1.996927, 0, 1, 0.5843138, 1,
-0.1989692, 1.564849, -0.2633861, 0, 1, 0.5921569, 1,
-0.1963358, -0.2315512, -3.123636, 0, 1, 0.5960785, 1,
-0.1951638, -0.8886586, -2.310046, 0, 1, 0.6039216, 1,
-0.1887555, -0.1040435, -3.36526, 0, 1, 0.6117647, 1,
-0.1875369, 0.1554713, 1.450833, 0, 1, 0.6156863, 1,
-0.1815977, -0.06061296, -1.360534, 0, 1, 0.6235294, 1,
-0.1806505, 1.098718, -0.4759896, 0, 1, 0.627451, 1,
-0.170317, -3.047687, -2.752712, 0, 1, 0.6352941, 1,
-0.1702434, -1.308413, -3.451205, 0, 1, 0.6392157, 1,
-0.1670136, 0.8075247, 0.8563147, 0, 1, 0.6470588, 1,
-0.1666289, 0.7464959, -1.338012, 0, 1, 0.6509804, 1,
-0.1634145, -0.5696239, -1.710206, 0, 1, 0.6588235, 1,
-0.1626439, -0.1757468, -2.434163, 0, 1, 0.6627451, 1,
-0.1602648, -0.6659079, -3.150641, 0, 1, 0.6705883, 1,
-0.1564469, -3.003004, -4.1801, 0, 1, 0.6745098, 1,
-0.1540721, -0.9529067, -3.940902, 0, 1, 0.682353, 1,
-0.142562, 1.541356, 0.8423167, 0, 1, 0.6862745, 1,
-0.1422512, 1.635096, -0.02950166, 0, 1, 0.6941177, 1,
-0.1327617, 0.9996631, 0.9483831, 0, 1, 0.7019608, 1,
-0.1320251, 0.08495308, -0.6168918, 0, 1, 0.7058824, 1,
-0.1318473, 0.8647402, -0.2950364, 0, 1, 0.7137255, 1,
-0.1313558, -0.3589646, -0.6488157, 0, 1, 0.7176471, 1,
-0.1305229, -0.9096026, -2.301703, 0, 1, 0.7254902, 1,
-0.1277568, -0.2306161, -3.47037, 0, 1, 0.7294118, 1,
-0.1267607, 0.8616349, 0.4050629, 0, 1, 0.7372549, 1,
-0.1210905, -2.133068, -3.267707, 0, 1, 0.7411765, 1,
-0.116516, 0.2458692, -0.6180069, 0, 1, 0.7490196, 1,
-0.1096135, 0.4427653, 0.7208299, 0, 1, 0.7529412, 1,
-0.1085468, 0.1516197, -1.177182, 0, 1, 0.7607843, 1,
-0.1039777, 0.4890912, -0.2693022, 0, 1, 0.7647059, 1,
-0.1035318, -0.779586, -0.637831, 0, 1, 0.772549, 1,
-0.1034527, -0.7256468, -2.321468, 0, 1, 0.7764706, 1,
-0.1014603, -1.452432, -2.613599, 0, 1, 0.7843137, 1,
-0.1002889, -0.2650272, -3.745435, 0, 1, 0.7882353, 1,
-0.09948399, -0.2743526, -4.650965, 0, 1, 0.7960784, 1,
-0.09668625, 0.3979301, 0.2712885, 0, 1, 0.8039216, 1,
-0.09650434, -0.6313076, -3.5206, 0, 1, 0.8078431, 1,
-0.09637233, -1.285434, -4.5351, 0, 1, 0.8156863, 1,
-0.09521575, 0.2347044, -0.3481898, 0, 1, 0.8196079, 1,
-0.09390397, -0.7278576, -2.910566, 0, 1, 0.827451, 1,
-0.08856259, 2.600783, 0.1756092, 0, 1, 0.8313726, 1,
-0.08853682, 3.083166, -0.7584334, 0, 1, 0.8392157, 1,
-0.08166156, -1.324812, -2.763572, 0, 1, 0.8431373, 1,
-0.07695035, 0.03319088, -1.439131, 0, 1, 0.8509804, 1,
-0.07485932, -0.6570415, -3.962699, 0, 1, 0.854902, 1,
-0.07345093, -0.4827186, -2.526501, 0, 1, 0.8627451, 1,
-0.07166022, -0.8664961, -5.304955, 0, 1, 0.8666667, 1,
-0.0693276, 0.0005691915, -1.313434, 0, 1, 0.8745098, 1,
-0.06522399, 0.5474811, 1.503099, 0, 1, 0.8784314, 1,
-0.05906462, -0.3978869, -3.804025, 0, 1, 0.8862745, 1,
-0.05593458, 1.810793, 0.8659251, 0, 1, 0.8901961, 1,
-0.05364097, -0.2052643, -2.650324, 0, 1, 0.8980392, 1,
-0.04930857, 0.8174593, 0.9056523, 0, 1, 0.9058824, 1,
-0.04775592, -0.5304602, -4.607584, 0, 1, 0.9098039, 1,
-0.04712565, 0.5804287, -0.9482853, 0, 1, 0.9176471, 1,
-0.04583507, -0.8067628, -3.890414, 0, 1, 0.9215686, 1,
-0.03956515, 0.9668623, 1.443424, 0, 1, 0.9294118, 1,
-0.03474479, -0.6528164, -3.718463, 0, 1, 0.9333333, 1,
-0.03187243, -0.6819398, -2.144193, 0, 1, 0.9411765, 1,
-0.03007592, -0.4600125, -3.071411, 0, 1, 0.945098, 1,
-0.02862903, 0.003591349, -1.022752, 0, 1, 0.9529412, 1,
-0.02798905, 0.8074633, 0.9803719, 0, 1, 0.9568627, 1,
-0.02521328, 1.209618, 0.01825945, 0, 1, 0.9647059, 1,
-0.02030741, 0.1232091, 0.4549587, 0, 1, 0.9686275, 1,
-0.01921466, -0.4289072, -4.150502, 0, 1, 0.9764706, 1,
-0.01666457, 0.6448859, -0.6749902, 0, 1, 0.9803922, 1,
-0.01594184, 0.122715, 0.4219856, 0, 1, 0.9882353, 1,
-0.01448787, -0.5735161, -3.075214, 0, 1, 0.9921569, 1,
-0.01113994, -0.2540445, -4.110659, 0, 1, 1, 1,
-0.01029723, -0.6424348, -4.686157, 0, 0.9921569, 1, 1,
-0.007150902, -1.284519, -2.474702, 0, 0.9882353, 1, 1,
-0.006336419, 0.764779, 0.02478934, 0, 0.9803922, 1, 1,
-0.00565812, -0.8488905, -2.885911, 0, 0.9764706, 1, 1,
-0.003076435, -0.6154661, -1.968842, 0, 0.9686275, 1, 1,
-0.001373566, -1.274647, -3.680139, 0, 0.9647059, 1, 1,
-0.001238168, 0.1413998, 0.8534566, 0, 0.9568627, 1, 1,
0.001212728, -0.3460445, 2.895005, 0, 0.9529412, 1, 1,
0.01012759, 0.8713296, -0.9306248, 0, 0.945098, 1, 1,
0.01606247, -0.4045771, 3.794046, 0, 0.9411765, 1, 1,
0.01670429, 1.589968, -0.7182916, 0, 0.9333333, 1, 1,
0.01717343, -0.05679908, 3.472073, 0, 0.9294118, 1, 1,
0.01726238, -0.3286685, 4.609106, 0, 0.9215686, 1, 1,
0.0224802, 0.8181697, -0.7148153, 0, 0.9176471, 1, 1,
0.02493604, -1.728572, 2.480844, 0, 0.9098039, 1, 1,
0.02585712, -0.8757284, 0.9615645, 0, 0.9058824, 1, 1,
0.02816308, 1.090781, 0.7351437, 0, 0.8980392, 1, 1,
0.03284933, -1.742294, 5.463888, 0, 0.8901961, 1, 1,
0.03816741, -0.1983511, 2.550161, 0, 0.8862745, 1, 1,
0.0454083, 0.3054103, 1.367726, 0, 0.8784314, 1, 1,
0.0459436, 0.4637835, 0.9415121, 0, 0.8745098, 1, 1,
0.04751383, 1.142446, -0.7944204, 0, 0.8666667, 1, 1,
0.04768308, -0.1759674, 3.564008, 0, 0.8627451, 1, 1,
0.05468879, 1.365779, -0.5274884, 0, 0.854902, 1, 1,
0.05481255, -1.547813, 2.655296, 0, 0.8509804, 1, 1,
0.05565426, -1.30037, 2.284588, 0, 0.8431373, 1, 1,
0.05758036, -0.3691101, 3.624756, 0, 0.8392157, 1, 1,
0.05952831, 0.2459263, 0.3309836, 0, 0.8313726, 1, 1,
0.05954993, 0.5042437, 1.710748, 0, 0.827451, 1, 1,
0.06128105, 0.4353279, 0.5736513, 0, 0.8196079, 1, 1,
0.06290286, 1.52332, 1.071599, 0, 0.8156863, 1, 1,
0.06378245, -0.1030309, 2.482388, 0, 0.8078431, 1, 1,
0.06461614, 0.5698647, 0.8261504, 0, 0.8039216, 1, 1,
0.06633604, -0.9965764, 3.786057, 0, 0.7960784, 1, 1,
0.06960198, 0.4560605, 1.486447, 0, 0.7882353, 1, 1,
0.07115536, -0.8451114, 3.358373, 0, 0.7843137, 1, 1,
0.07220381, 0.1901682, 0.8007564, 0, 0.7764706, 1, 1,
0.0736443, -1.413661, 2.994287, 0, 0.772549, 1, 1,
0.0801477, 0.5064783, -0.4392038, 0, 0.7647059, 1, 1,
0.08055877, 0.9004729, -2.206651, 0, 0.7607843, 1, 1,
0.08246405, -1.708856, 2.774882, 0, 0.7529412, 1, 1,
0.08400518, 0.7467278, -0.2307322, 0, 0.7490196, 1, 1,
0.08408421, -0.8762809, 3.271497, 0, 0.7411765, 1, 1,
0.08643746, 0.8519058, -0.3342055, 0, 0.7372549, 1, 1,
0.08662003, 0.1263707, 1.673311, 0, 0.7294118, 1, 1,
0.08873294, -0.4793253, 2.599869, 0, 0.7254902, 1, 1,
0.09081857, 1.610703, -0.03495062, 0, 0.7176471, 1, 1,
0.09171702, 1.657535, -0.009646453, 0, 0.7137255, 1, 1,
0.09942395, 1.59785, -0.1574419, 0, 0.7058824, 1, 1,
0.09964192, -1.136088, 2.437295, 0, 0.6980392, 1, 1,
0.1002233, -1.316823, 2.484049, 0, 0.6941177, 1, 1,
0.1030323, -0.02973652, -0.4961341, 0, 0.6862745, 1, 1,
0.1036726, -0.7204967, 3.922646, 0, 0.682353, 1, 1,
0.1038175, -0.0814173, 1.406643, 0, 0.6745098, 1, 1,
0.1059835, 0.7354731, -2.012578, 0, 0.6705883, 1, 1,
0.1082514, 0.7108885, -0.1466659, 0, 0.6627451, 1, 1,
0.11599, 1.456997, 0.9633347, 0, 0.6588235, 1, 1,
0.1162146, -0.2475583, 3.103031, 0, 0.6509804, 1, 1,
0.1180326, 1.401864, 0.8515317, 0, 0.6470588, 1, 1,
0.1212042, -1.112939, 3.935749, 0, 0.6392157, 1, 1,
0.1223384, 0.2724586, 0.1372621, 0, 0.6352941, 1, 1,
0.1293146, -2.110833, 4.02346, 0, 0.627451, 1, 1,
0.1360064, -1.047142, 2.483526, 0, 0.6235294, 1, 1,
0.1387356, -1.100564, 3.689071, 0, 0.6156863, 1, 1,
0.1426491, -1.360357, 3.04172, 0, 0.6117647, 1, 1,
0.1491772, -0.9258301, 1.292284, 0, 0.6039216, 1, 1,
0.1498774, 0.3896816, 0.2614653, 0, 0.5960785, 1, 1,
0.1552, -0.2988653, 1.837588, 0, 0.5921569, 1, 1,
0.1588935, 0.1554682, 0.7416921, 0, 0.5843138, 1, 1,
0.1674078, -0.6265396, 2.829576, 0, 0.5803922, 1, 1,
0.1690937, -0.3515812, 3.054397, 0, 0.572549, 1, 1,
0.1697508, -0.7486957, 2.828046, 0, 0.5686275, 1, 1,
0.1705455, -1.604432, 3.204247, 0, 0.5607843, 1, 1,
0.1705672, -1.008532, 2.560814, 0, 0.5568628, 1, 1,
0.170893, 0.4693342, 1.148452, 0, 0.5490196, 1, 1,
0.1716001, -0.6342435, 2.577061, 0, 0.5450981, 1, 1,
0.1724035, -0.04161854, 1.384755, 0, 0.5372549, 1, 1,
0.1825939, -0.1706036, 1.854537, 0, 0.5333334, 1, 1,
0.183141, -1.550779, 2.293747, 0, 0.5254902, 1, 1,
0.183288, 0.3308998, 1.484996, 0, 0.5215687, 1, 1,
0.1871583, 0.7107455, -0.3996171, 0, 0.5137255, 1, 1,
0.18824, -0.0344794, 2.977932, 0, 0.509804, 1, 1,
0.1889735, -0.8355592, 3.26169, 0, 0.5019608, 1, 1,
0.1918469, -2.025478, 4.561848, 0, 0.4941176, 1, 1,
0.1918685, -1.009116, 5.043032, 0, 0.4901961, 1, 1,
0.1921384, -0.9390905, 2.265114, 0, 0.4823529, 1, 1,
0.1929986, 0.7832908, 1.354061, 0, 0.4784314, 1, 1,
0.1990999, -0.01222347, 2.472635, 0, 0.4705882, 1, 1,
0.2006539, -1.011877, 3.940574, 0, 0.4666667, 1, 1,
0.2014073, -1.19031, 3.410135, 0, 0.4588235, 1, 1,
0.2159738, -0.3530719, 2.073879, 0, 0.454902, 1, 1,
0.2177341, 0.41255, 1.103853, 0, 0.4470588, 1, 1,
0.2201071, -1.203469, 3.387756, 0, 0.4431373, 1, 1,
0.221005, -0.5305555, 3.344718, 0, 0.4352941, 1, 1,
0.2254298, 0.9731812, 0.9511129, 0, 0.4313726, 1, 1,
0.2260019, 0.6593139, 3.627333, 0, 0.4235294, 1, 1,
0.2280828, -0.2650731, 3.874389, 0, 0.4196078, 1, 1,
0.2347909, 2.050425, 0.7422639, 0, 0.4117647, 1, 1,
0.234982, 1.423857, 0.2067203, 0, 0.4078431, 1, 1,
0.2418521, 0.4907671, 0.1067379, 0, 0.4, 1, 1,
0.2419806, 0.4889615, 0.2214175, 0, 0.3921569, 1, 1,
0.2426377, -1.766455, 6.14709, 0, 0.3882353, 1, 1,
0.2458845, 0.1119366, 1.122422, 0, 0.3803922, 1, 1,
0.2464181, -1.4162, 3.264596, 0, 0.3764706, 1, 1,
0.2539777, 0.08992926, 2.347418, 0, 0.3686275, 1, 1,
0.2650301, -0.1209387, 3.180505, 0, 0.3647059, 1, 1,
0.2655322, -0.6405559, 4.606262, 0, 0.3568628, 1, 1,
0.2656988, -0.6918435, 3.798825, 0, 0.3529412, 1, 1,
0.267585, -1.412696, 4.59727, 0, 0.345098, 1, 1,
0.2686255, -0.02677001, 1.540992, 0, 0.3411765, 1, 1,
0.2740585, 1.423709, -0.3637833, 0, 0.3333333, 1, 1,
0.2752716, -0.558979, 2.615298, 0, 0.3294118, 1, 1,
0.2818538, 0.4552451, 0.3233123, 0, 0.3215686, 1, 1,
0.2881074, 0.1777707, 3.815974, 0, 0.3176471, 1, 1,
0.2898904, 1.52309, -0.4566881, 0, 0.3098039, 1, 1,
0.2918151, 1.492559, 0.5210253, 0, 0.3058824, 1, 1,
0.2927696, -0.918749, 1.969049, 0, 0.2980392, 1, 1,
0.3132247, -1.079406, 2.243072, 0, 0.2901961, 1, 1,
0.3143009, -0.2707898, 2.816585, 0, 0.2862745, 1, 1,
0.3244686, -1.025206, 4.053691, 0, 0.2784314, 1, 1,
0.3245878, 0.09831213, 2.127882, 0, 0.2745098, 1, 1,
0.3252548, -3.013361, 2.154796, 0, 0.2666667, 1, 1,
0.3279417, 1.340665, 0.4844853, 0, 0.2627451, 1, 1,
0.3301221, 0.4399324, -0.08071981, 0, 0.254902, 1, 1,
0.334704, 0.0175413, 1.547364, 0, 0.2509804, 1, 1,
0.3376013, -0.7406502, 2.137134, 0, 0.2431373, 1, 1,
0.3384668, -0.9842889, 3.702415, 0, 0.2392157, 1, 1,
0.3415532, -0.6198204, 3.043841, 0, 0.2313726, 1, 1,
0.3448534, -1.332597, 5.062963, 0, 0.227451, 1, 1,
0.3471493, -1.293012, 2.531807, 0, 0.2196078, 1, 1,
0.3474042, 0.0868967, 0.9013447, 0, 0.2156863, 1, 1,
0.3483365, -1.459417, 1.828525, 0, 0.2078431, 1, 1,
0.349077, -0.5068346, 2.400884, 0, 0.2039216, 1, 1,
0.3519028, 1.286277, 0.5756636, 0, 0.1960784, 1, 1,
0.3532229, 0.7362763, 1.768014, 0, 0.1882353, 1, 1,
0.3534369, -0.4699425, 2.597357, 0, 0.1843137, 1, 1,
0.3552726, 1.031481, 0.3735575, 0, 0.1764706, 1, 1,
0.3569888, -1.002123, 2.350288, 0, 0.172549, 1, 1,
0.365279, -1.739872, 1.983268, 0, 0.1647059, 1, 1,
0.36707, -1.9921, 5.144698, 0, 0.1607843, 1, 1,
0.369829, 1.716711, 0.2526852, 0, 0.1529412, 1, 1,
0.3711571, 0.5365896, 0.6284077, 0, 0.1490196, 1, 1,
0.3721303, -1.012735, 2.509936, 0, 0.1411765, 1, 1,
0.3743553, 0.1538887, 2.214612, 0, 0.1372549, 1, 1,
0.374678, -1.904987, 3.601867, 0, 0.1294118, 1, 1,
0.3758548, 0.5729433, 3.23364, 0, 0.1254902, 1, 1,
0.3762624, -0.8604618, 4.266379, 0, 0.1176471, 1, 1,
0.3786924, -1.944167, 4.182562, 0, 0.1137255, 1, 1,
0.3800506, 1.529377, -0.3596201, 0, 0.1058824, 1, 1,
0.3823368, 0.1370022, 1.388811, 0, 0.09803922, 1, 1,
0.3897592, -1.367468, 3.128899, 0, 0.09411765, 1, 1,
0.4002023, 0.987622, 1.097577, 0, 0.08627451, 1, 1,
0.4058867, -0.6790885, 2.59886, 0, 0.08235294, 1, 1,
0.4076706, 1.06616, 0.8646185, 0, 0.07450981, 1, 1,
0.4115713, -1.249529, 3.104865, 0, 0.07058824, 1, 1,
0.4133779, 2.220321, 0.9621245, 0, 0.0627451, 1, 1,
0.4231057, 0.02369719, 2.052867, 0, 0.05882353, 1, 1,
0.4265266, 0.7519371, 0.8849118, 0, 0.05098039, 1, 1,
0.4285523, -1.93101, 2.470665, 0, 0.04705882, 1, 1,
0.4298503, 0.3606842, 2.57655, 0, 0.03921569, 1, 1,
0.4304238, 1.248556, 1.514027, 0, 0.03529412, 1, 1,
0.4331274, 0.2109027, 1.847157, 0, 0.02745098, 1, 1,
0.4336204, 0.2778355, 0.2698304, 0, 0.02352941, 1, 1,
0.4382443, -0.4080805, 3.366914, 0, 0.01568628, 1, 1,
0.4395967, 1.091806, -0.7459324, 0, 0.01176471, 1, 1,
0.4404927, -0.2567104, 2.708059, 0, 0.003921569, 1, 1,
0.4425842, 1.872485, -0.2501379, 0.003921569, 0, 1, 1,
0.4445087, 0.3221429, 0.2738988, 0.007843138, 0, 1, 1,
0.4473099, 0.6294885, 0.7062065, 0.01568628, 0, 1, 1,
0.4482554, 0.8518325, 0.8858438, 0.01960784, 0, 1, 1,
0.4498722, -0.6533185, 2.751942, 0.02745098, 0, 1, 1,
0.4531569, 1.180546, 1.213623, 0.03137255, 0, 1, 1,
0.4545901, -0.4215119, 3.362931, 0.03921569, 0, 1, 1,
0.4559753, -0.1697717, 3.173465, 0.04313726, 0, 1, 1,
0.4589064, -0.06692065, 2.472457, 0.05098039, 0, 1, 1,
0.4625026, -0.6572458, 2.268793, 0.05490196, 0, 1, 1,
0.4627603, 0.3634398, 0.5448062, 0.0627451, 0, 1, 1,
0.4646704, 0.8900639, -1.084952, 0.06666667, 0, 1, 1,
0.4797578, 1.281904, 1.082774, 0.07450981, 0, 1, 1,
0.480817, 0.06045317, 0.4664751, 0.07843138, 0, 1, 1,
0.4842872, 0.3552992, 2.893157, 0.08627451, 0, 1, 1,
0.4871356, 0.6939359, -0.2200775, 0.09019608, 0, 1, 1,
0.487554, 0.9366629, 1.146885, 0.09803922, 0, 1, 1,
0.4876463, -2.728741, 3.567091, 0.1058824, 0, 1, 1,
0.4883325, 0.3996322, 0.1713903, 0.1098039, 0, 1, 1,
0.4914665, 0.2553261, 0.440421, 0.1176471, 0, 1, 1,
0.4981779, 1.842669, 0.5169287, 0.1215686, 0, 1, 1,
0.4984838, 1.243973, 1.296337, 0.1294118, 0, 1, 1,
0.50572, 0.9533738, 2.917085, 0.1333333, 0, 1, 1,
0.5062877, -1.031852, 2.202943, 0.1411765, 0, 1, 1,
0.5096362, -1.560153, 4.594824, 0.145098, 0, 1, 1,
0.5143036, 0.2271457, -1.222581, 0.1529412, 0, 1, 1,
0.5173477, 1.816219, 0.2953792, 0.1568628, 0, 1, 1,
0.5183595, 0.279537, -0.5924513, 0.1647059, 0, 1, 1,
0.5210202, -0.4299085, 2.89857, 0.1686275, 0, 1, 1,
0.5363094, 1.134085, -0.8931516, 0.1764706, 0, 1, 1,
0.5367349, 0.2349376, 1.111706, 0.1803922, 0, 1, 1,
0.5383987, 1.725749, 1.45078, 0.1882353, 0, 1, 1,
0.538949, -0.04510245, 2.924961, 0.1921569, 0, 1, 1,
0.5401323, 0.0339589, -1.083369, 0.2, 0, 1, 1,
0.5426314, 0.9282602, -0.7715982, 0.2078431, 0, 1, 1,
0.554629, -1.329232, 2.11704, 0.2117647, 0, 1, 1,
0.5546455, -0.8009064, 2.610754, 0.2196078, 0, 1, 1,
0.5598039, -2.132492, 1.987022, 0.2235294, 0, 1, 1,
0.5634399, -1.736197, 3.82491, 0.2313726, 0, 1, 1,
0.572557, -0.3496468, 3.366726, 0.2352941, 0, 1, 1,
0.5799955, 0.9145753, 1.247997, 0.2431373, 0, 1, 1,
0.5827846, 1.539072, 0.4573225, 0.2470588, 0, 1, 1,
0.5836695, 1.166654, 0.9339312, 0.254902, 0, 1, 1,
0.5886825, 0.7134902, 0.06022364, 0.2588235, 0, 1, 1,
0.5912434, 0.1883523, 0.1208023, 0.2666667, 0, 1, 1,
0.5916234, 0.8422785, -0.08675235, 0.2705882, 0, 1, 1,
0.6042465, 1.114022, 0.1190264, 0.2784314, 0, 1, 1,
0.6049796, -1.636621, 4.157207, 0.282353, 0, 1, 1,
0.6109679, 0.261694, 0.04014011, 0.2901961, 0, 1, 1,
0.6142609, 0.7880961, 2.671893, 0.2941177, 0, 1, 1,
0.6166948, 0.1983955, -1.135478, 0.3019608, 0, 1, 1,
0.6331537, -0.1650279, 3.19659, 0.3098039, 0, 1, 1,
0.6343759, 0.8788639, -0.7851333, 0.3137255, 0, 1, 1,
0.64022, -0.9429604, 3.117701, 0.3215686, 0, 1, 1,
0.640276, -1.635603, 1.460378, 0.3254902, 0, 1, 1,
0.6403206, -1.107066, 3.314154, 0.3333333, 0, 1, 1,
0.6503362, 1.236799, 1.521141, 0.3372549, 0, 1, 1,
0.6531234, 0.353611, 0.9082583, 0.345098, 0, 1, 1,
0.653384, 0.8493226, 0.635357, 0.3490196, 0, 1, 1,
0.6619989, -0.6984228, 1.593715, 0.3568628, 0, 1, 1,
0.6713629, -0.09933669, 0.7788379, 0.3607843, 0, 1, 1,
0.6725077, -0.1173408, 2.080796, 0.3686275, 0, 1, 1,
0.6801367, -1.971201, 2.071242, 0.372549, 0, 1, 1,
0.6802079, -0.5793471, 3.663009, 0.3803922, 0, 1, 1,
0.6842906, 0.4042933, 0.116848, 0.3843137, 0, 1, 1,
0.6874313, 0.2264387, 2.232064, 0.3921569, 0, 1, 1,
0.6910633, 0.3283862, 3.440545, 0.3960784, 0, 1, 1,
0.693931, 2.511674, 0.6099892, 0.4039216, 0, 1, 1,
0.6941709, -0.8538953, 1.268594, 0.4117647, 0, 1, 1,
0.6967744, -0.6351965, 1.370117, 0.4156863, 0, 1, 1,
0.6979054, 0.2449241, 3.685274, 0.4235294, 0, 1, 1,
0.7013847, 1.773232, 1.092556, 0.427451, 0, 1, 1,
0.7185501, -0.9089599, 1.732378, 0.4352941, 0, 1, 1,
0.7231416, 0.7502107, 1.356161, 0.4392157, 0, 1, 1,
0.7268938, 0.2514232, 1.292485, 0.4470588, 0, 1, 1,
0.7277123, -0.07122608, 2.13358, 0.4509804, 0, 1, 1,
0.7278668, -0.2277041, 2.123776, 0.4588235, 0, 1, 1,
0.7337106, -1.683403, 3.702854, 0.4627451, 0, 1, 1,
0.7415361, -0.02563074, 1.219967, 0.4705882, 0, 1, 1,
0.7430786, 1.206633, 0.482444, 0.4745098, 0, 1, 1,
0.7463505, -0.9254774, 1.826847, 0.4823529, 0, 1, 1,
0.750492, 0.4625985, 1.718837, 0.4862745, 0, 1, 1,
0.7597688, 0.4009529, 0.4480294, 0.4941176, 0, 1, 1,
0.7616657, -0.3891438, 3.206758, 0.5019608, 0, 1, 1,
0.7634653, 0.6188791, -0.4263493, 0.5058824, 0, 1, 1,
0.7637343, -0.9457387, 3.439057, 0.5137255, 0, 1, 1,
0.763957, -0.06633531, 3.17147, 0.5176471, 0, 1, 1,
0.7656749, 0.6895866, -0.06301545, 0.5254902, 0, 1, 1,
0.7661708, -0.672359, 2.220258, 0.5294118, 0, 1, 1,
0.7690799, -0.8897263, 4.423422, 0.5372549, 0, 1, 1,
0.7702387, 0.4322452, 1.311947, 0.5411765, 0, 1, 1,
0.7742575, -0.4191096, 1.25545, 0.5490196, 0, 1, 1,
0.7831308, -0.4143044, 2.473332, 0.5529412, 0, 1, 1,
0.7835368, 0.2151419, 2.4523, 0.5607843, 0, 1, 1,
0.7925713, 0.03640467, 1.827235, 0.5647059, 0, 1, 1,
0.7995707, 1.624809, -0.3481249, 0.572549, 0, 1, 1,
0.8085743, 0.5081301, 1.106977, 0.5764706, 0, 1, 1,
0.8088767, -1.160322, 0.2220942, 0.5843138, 0, 1, 1,
0.8108132, -0.2001356, 1.270344, 0.5882353, 0, 1, 1,
0.811335, 0.5542791, 2.210755, 0.5960785, 0, 1, 1,
0.8133327, -0.711238, 0.1456972, 0.6039216, 0, 1, 1,
0.8162106, -1.091504, 1.768203, 0.6078432, 0, 1, 1,
0.8162587, 0.334442, 1.500498, 0.6156863, 0, 1, 1,
0.8175631, -1.405808, 2.876343, 0.6196079, 0, 1, 1,
0.820475, 1.53443, 0.01728048, 0.627451, 0, 1, 1,
0.8212752, -0.3257518, 1.167211, 0.6313726, 0, 1, 1,
0.8222677, 0.07196638, 1.820104, 0.6392157, 0, 1, 1,
0.8271413, -1.894913, 3.260165, 0.6431373, 0, 1, 1,
0.8280401, -0.8230518, 3.395413, 0.6509804, 0, 1, 1,
0.8314689, 1.208997, 1.543253, 0.654902, 0, 1, 1,
0.8318346, -0.03718942, 2.015638, 0.6627451, 0, 1, 1,
0.8328806, -0.9867947, 2.581241, 0.6666667, 0, 1, 1,
0.8357638, 0.7650368, 0.5903912, 0.6745098, 0, 1, 1,
0.8363725, 0.7262387, 0.5995241, 0.6784314, 0, 1, 1,
0.8390996, 0.6403068, 0.3152623, 0.6862745, 0, 1, 1,
0.8520235, 0.4747783, 2.034742, 0.6901961, 0, 1, 1,
0.8537934, 1.78673, -0.5062187, 0.6980392, 0, 1, 1,
0.8552103, -2.297103, 2.778544, 0.7058824, 0, 1, 1,
0.8562832, -0.9418777, 2.471416, 0.7098039, 0, 1, 1,
0.8577899, 0.7713489, 0.6444813, 0.7176471, 0, 1, 1,
0.8654255, -0.7976915, 2.552751, 0.7215686, 0, 1, 1,
0.8672889, -0.4610588, 2.543201, 0.7294118, 0, 1, 1,
0.8759782, 1.550764, 0.2910148, 0.7333333, 0, 1, 1,
0.8762859, 0.9205113, 0.1022756, 0.7411765, 0, 1, 1,
0.8772178, -0.11617, 3.205617, 0.7450981, 0, 1, 1,
0.8834936, -0.81819, 1.6682, 0.7529412, 0, 1, 1,
0.8851425, -1.05311, 1.575364, 0.7568628, 0, 1, 1,
0.887702, 1.247026, 1.240519, 0.7647059, 0, 1, 1,
0.8899179, -0.3970675, 1.837296, 0.7686275, 0, 1, 1,
0.8912278, 0.4701069, 1.245327, 0.7764706, 0, 1, 1,
0.8933533, -0.7886216, 2.422992, 0.7803922, 0, 1, 1,
0.89407, 0.9155865, 1.094377, 0.7882353, 0, 1, 1,
0.9020752, -0.06368268, 2.06249, 0.7921569, 0, 1, 1,
0.9051511, 0.7665958, 1.915854, 0.8, 0, 1, 1,
0.9109474, 0.4583025, 1.425963, 0.8078431, 0, 1, 1,
0.9133222, 0.3993683, 0.3434377, 0.8117647, 0, 1, 1,
0.9133678, 1.269526, 0.1710596, 0.8196079, 0, 1, 1,
0.9180301, 0.9138671, 2.873577, 0.8235294, 0, 1, 1,
0.9185081, 0.0642802, 1.227026, 0.8313726, 0, 1, 1,
0.9185765, -1.107507, 2.651201, 0.8352941, 0, 1, 1,
0.9255101, 0.1474192, 1.846314, 0.8431373, 0, 1, 1,
0.9355797, 0.2045577, 3.125128, 0.8470588, 0, 1, 1,
0.9355972, -0.6247671, 2.164183, 0.854902, 0, 1, 1,
0.9398253, -0.7035312, 0.967862, 0.8588235, 0, 1, 1,
0.9424826, -0.1846382, 0.6942905, 0.8666667, 0, 1, 1,
0.9426649, -0.9538409, 2.538503, 0.8705882, 0, 1, 1,
0.9485735, 0.06828653, 2.663126, 0.8784314, 0, 1, 1,
0.9570726, -1.179926, 1.086663, 0.8823529, 0, 1, 1,
0.9570798, -0.3177788, 3.138956, 0.8901961, 0, 1, 1,
0.9647737, -0.2234609, 1.340615, 0.8941177, 0, 1, 1,
0.9650601, 0.7537338, 0.1003767, 0.9019608, 0, 1, 1,
0.9665599, -1.087567, 1.303328, 0.9098039, 0, 1, 1,
0.971709, 0.2020759, 2.301782, 0.9137255, 0, 1, 1,
0.9756544, 1.170583, 0.555529, 0.9215686, 0, 1, 1,
0.980675, -0.7875378, 1.588052, 0.9254902, 0, 1, 1,
0.9883041, -0.9017537, 3.335691, 0.9333333, 0, 1, 1,
0.9891639, -0.692693, 2.611869, 0.9372549, 0, 1, 1,
0.9910226, 0.003411035, 1.089332, 0.945098, 0, 1, 1,
0.9938375, -0.6395518, 3.143781, 0.9490196, 0, 1, 1,
0.9951363, -0.01046819, 0.5486124, 0.9568627, 0, 1, 1,
1.005084, -0.1499705, 2.31833, 0.9607843, 0, 1, 1,
1.020729, -0.3156034, 3.206812, 0.9686275, 0, 1, 1,
1.026953, 0.4917113, 2.028749, 0.972549, 0, 1, 1,
1.038467, 0.5665846, -0.4133545, 0.9803922, 0, 1, 1,
1.04546, 0.7038871, 0.7732459, 0.9843137, 0, 1, 1,
1.049785, 2.162259, 0.1608438, 0.9921569, 0, 1, 1,
1.049991, 3.156088, 0.6490462, 0.9960784, 0, 1, 1,
1.050744, 0.298559, 1.036501, 1, 0, 0.9960784, 1,
1.05142, -0.6190427, 1.747931, 1, 0, 0.9882353, 1,
1.054715, 0.2292332, 1.780534, 1, 0, 0.9843137, 1,
1.060012, -1.182492, 0.1191406, 1, 0, 0.9764706, 1,
1.062439, 0.2729748, 2.562302, 1, 0, 0.972549, 1,
1.064366, 0.9585446, 0.1333261, 1, 0, 0.9647059, 1,
1.065638, -0.1832228, 1.549646, 1, 0, 0.9607843, 1,
1.067139, -0.9217033, 1.991437, 1, 0, 0.9529412, 1,
1.069172, -0.4188486, 0.3139496, 1, 0, 0.9490196, 1,
1.076242, -0.3210023, 0.2098647, 1, 0, 0.9411765, 1,
1.083785, 0.5164192, 2.422553, 1, 0, 0.9372549, 1,
1.086985, -1.398574, 0.7911221, 1, 0, 0.9294118, 1,
1.087738, 0.9514627, -0.341384, 1, 0, 0.9254902, 1,
1.089925, -0.6750098, 2.107745, 1, 0, 0.9176471, 1,
1.090019, 0.6488889, 0.4353511, 1, 0, 0.9137255, 1,
1.091738, 0.5493845, 2.727445, 1, 0, 0.9058824, 1,
1.099063, 0.8720423, 0.2794019, 1, 0, 0.9019608, 1,
1.102235, 0.6152133, 1.526197, 1, 0, 0.8941177, 1,
1.102749, 0.7076738, 1.922737, 1, 0, 0.8862745, 1,
1.105728, -0.1333074, 0.2040451, 1, 0, 0.8823529, 1,
1.112769, -1.137378, 3.444346, 1, 0, 0.8745098, 1,
1.113749, -0.4276085, 3.127756, 1, 0, 0.8705882, 1,
1.118405, -0.3354608, 0.7522546, 1, 0, 0.8627451, 1,
1.128915, 0.9314648, 1.240057, 1, 0, 0.8588235, 1,
1.129801, -1.001192, 2.459229, 1, 0, 0.8509804, 1,
1.12982, -0.07582162, 2.440473, 1, 0, 0.8470588, 1,
1.134503, -1.78637, 2.984213, 1, 0, 0.8392157, 1,
1.140439, -0.7698951, 1.905704, 1, 0, 0.8352941, 1,
1.149657, -0.4254407, 2.043005, 1, 0, 0.827451, 1,
1.154197, -1.044243, 0.9249645, 1, 0, 0.8235294, 1,
1.156541, -1.235234, 2.55598, 1, 0, 0.8156863, 1,
1.159709, 0.1906557, -0.5405702, 1, 0, 0.8117647, 1,
1.164301, 1.303918, 1.970014, 1, 0, 0.8039216, 1,
1.165558, 0.2852308, 0.9860515, 1, 0, 0.7960784, 1,
1.168748, -0.6106533, -0.3205882, 1, 0, 0.7921569, 1,
1.169853, -1.118009, 3.23913, 1, 0, 0.7843137, 1,
1.170035, 0.3181635, 1.319313, 1, 0, 0.7803922, 1,
1.1702, -1.854777, 1.14035, 1, 0, 0.772549, 1,
1.172935, -1.971822, 0.655851, 1, 0, 0.7686275, 1,
1.177103, -1.367105, 1.249856, 1, 0, 0.7607843, 1,
1.181552, -2.038295, 1.460943, 1, 0, 0.7568628, 1,
1.192535, -0.8773161, 3.284876, 1, 0, 0.7490196, 1,
1.208298, -0.8289725, 1.331284, 1, 0, 0.7450981, 1,
1.214362, -1.092916, 2.624336, 1, 0, 0.7372549, 1,
1.217405, -0.2964997, 3.604376, 1, 0, 0.7333333, 1,
1.219553, 0.07954749, 1.078032, 1, 0, 0.7254902, 1,
1.220837, -0.577788, 2.848889, 1, 0, 0.7215686, 1,
1.223866, 0.4850295, 1.945719, 1, 0, 0.7137255, 1,
1.231186, 0.08457556, 2.404159, 1, 0, 0.7098039, 1,
1.240451, -1.284299, 1.638489, 1, 0, 0.7019608, 1,
1.243404, -0.9500718, 1.635886, 1, 0, 0.6941177, 1,
1.248304, 2.195131, 0.4629796, 1, 0, 0.6901961, 1,
1.25667, 0.2241852, 0.1942896, 1, 0, 0.682353, 1,
1.258999, -0.4556595, 5.149529, 1, 0, 0.6784314, 1,
1.264887, -0.9941073, 2.4913, 1, 0, 0.6705883, 1,
1.271351, -2.908385, 1.538054, 1, 0, 0.6666667, 1,
1.277841, -0.981131, 2.883862, 1, 0, 0.6588235, 1,
1.291102, 0.963371, 1.5462, 1, 0, 0.654902, 1,
1.291621, 0.8325611, 0.4398409, 1, 0, 0.6470588, 1,
1.309131, 0.8381825, -1.923762, 1, 0, 0.6431373, 1,
1.312993, 0.08952044, 1.784719, 1, 0, 0.6352941, 1,
1.314761, 0.8996645, 1.773509, 1, 0, 0.6313726, 1,
1.322023, 1.009106, 1.09685, 1, 0, 0.6235294, 1,
1.324319, 0.09976171, 0.6451802, 1, 0, 0.6196079, 1,
1.340506, -0.7096495, 1.948002, 1, 0, 0.6117647, 1,
1.342314, -0.9722965, 3.255929, 1, 0, 0.6078432, 1,
1.348103, 1.22447, -0.9119564, 1, 0, 0.6, 1,
1.351872, 0.04965424, 0.7361252, 1, 0, 0.5921569, 1,
1.352508, -0.4340805, 1.422254, 1, 0, 0.5882353, 1,
1.36167, 0.2834563, 2.600206, 1, 0, 0.5803922, 1,
1.379058, 1.434267, 0.896073, 1, 0, 0.5764706, 1,
1.383622, -0.9848121, 0.6916369, 1, 0, 0.5686275, 1,
1.383631, -1.311654, 1.93793, 1, 0, 0.5647059, 1,
1.385213, -0.6216547, 3.157029, 1, 0, 0.5568628, 1,
1.388772, -1.739833, 0.9518102, 1, 0, 0.5529412, 1,
1.391665, 0.3715777, 1.506115, 1, 0, 0.5450981, 1,
1.399486, -0.9062951, 1.881955, 1, 0, 0.5411765, 1,
1.407192, 0.2509279, 0.3983907, 1, 0, 0.5333334, 1,
1.422001, 0.1630126, 3.958079, 1, 0, 0.5294118, 1,
1.42792, 0.4642161, 1.38273, 1, 0, 0.5215687, 1,
1.44419, 0.3672536, 0.2867761, 1, 0, 0.5176471, 1,
1.447802, 2.203408, 1.913811, 1, 0, 0.509804, 1,
1.448474, -0.4368592, 2.506924, 1, 0, 0.5058824, 1,
1.453521, 0.3962377, 2.244985, 1, 0, 0.4980392, 1,
1.469841, 0.1892696, 2.835169, 1, 0, 0.4901961, 1,
1.47315, 0.8110036, 0.8196458, 1, 0, 0.4862745, 1,
1.483245, 0.2177992, 1.302172, 1, 0, 0.4784314, 1,
1.484697, 1.715598, -0.02831903, 1, 0, 0.4745098, 1,
1.486919, 0.01390935, 1.874784, 1, 0, 0.4666667, 1,
1.488016, -2.747046, 1.996606, 1, 0, 0.4627451, 1,
1.491334, 0.5226305, 2.028161, 1, 0, 0.454902, 1,
1.495238, -1.725803, 3.078263, 1, 0, 0.4509804, 1,
1.517473, -0.1446345, 0.8274618, 1, 0, 0.4431373, 1,
1.518063, -0.5572026, 2.557725, 1, 0, 0.4392157, 1,
1.518191, -0.4772734, 1.146919, 1, 0, 0.4313726, 1,
1.52713, 0.5424326, 3.145164, 1, 0, 0.427451, 1,
1.541399, 1.726482, 0.1956535, 1, 0, 0.4196078, 1,
1.543291, -1.476196, 2.621891, 1, 0, 0.4156863, 1,
1.55174, 0.6366486, 2.780076, 1, 0, 0.4078431, 1,
1.556027, -1.273025, 3.463856, 1, 0, 0.4039216, 1,
1.562564, 0.6285439, 0.5592496, 1, 0, 0.3960784, 1,
1.579119, -1.211807, 2.360506, 1, 0, 0.3882353, 1,
1.583771, 1.404287, 0.08756444, 1, 0, 0.3843137, 1,
1.58517, -0.1388399, 0.3590398, 1, 0, 0.3764706, 1,
1.594076, -1.695845, 0.9758618, 1, 0, 0.372549, 1,
1.599802, -0.1268453, 2.276637, 1, 0, 0.3647059, 1,
1.624402, 1.312627, 1.086768, 1, 0, 0.3607843, 1,
1.640196, -0.9365719, 1.427659, 1, 0, 0.3529412, 1,
1.649965, -2.21806, 1.73797, 1, 0, 0.3490196, 1,
1.651192, -0.5954316, 1.408858, 1, 0, 0.3411765, 1,
1.685671, 0.3360775, 0.04684024, 1, 0, 0.3372549, 1,
1.696014, -0.8594893, 0.6440685, 1, 0, 0.3294118, 1,
1.701764, 0.6687563, 2.050692, 1, 0, 0.3254902, 1,
1.711458, 0.3334507, 2.174587, 1, 0, 0.3176471, 1,
1.71505, -0.1856802, 1.105435, 1, 0, 0.3137255, 1,
1.721909, -1.212457, 1.636885, 1, 0, 0.3058824, 1,
1.730495, -1.317464, 1.498744, 1, 0, 0.2980392, 1,
1.736654, -1.526112, 2.753837, 1, 0, 0.2941177, 1,
1.740742, 1.179446, 1.916306, 1, 0, 0.2862745, 1,
1.76088, -1.275587, 1.37523, 1, 0, 0.282353, 1,
1.768645, 1.393809, -0.5986911, 1, 0, 0.2745098, 1,
1.770412, -0.5496902, 3.541328, 1, 0, 0.2705882, 1,
1.773801, -0.3295595, 2.411389, 1, 0, 0.2627451, 1,
1.790658, -0.8003455, 1.23104, 1, 0, 0.2588235, 1,
1.792706, 1.642214, 1.416238, 1, 0, 0.2509804, 1,
1.81805, 0.192121, -0.4072271, 1, 0, 0.2470588, 1,
1.825601, 1.630499, 1.357633, 1, 0, 0.2392157, 1,
1.826044, 0.7249713, 2.240688, 1, 0, 0.2352941, 1,
1.836967, -1.686843, 1.899961, 1, 0, 0.227451, 1,
1.860611, -1.253093, 2.547203, 1, 0, 0.2235294, 1,
1.88653, -0.8064011, 1.632641, 1, 0, 0.2156863, 1,
1.915069, 1.482301, 1.443722, 1, 0, 0.2117647, 1,
1.922704, -1.37492, 1.709396, 1, 0, 0.2039216, 1,
1.926434, -0.5053667, 2.585699, 1, 0, 0.1960784, 1,
1.933517, 1.580498, 1.306648, 1, 0, 0.1921569, 1,
1.95914, -0.2133989, 1.082872, 1, 0, 0.1843137, 1,
1.970291, 1.394921, 1.738664, 1, 0, 0.1803922, 1,
1.979866, 1.558036, 1.101921, 1, 0, 0.172549, 1,
1.991585, 0.4580019, 1.976614, 1, 0, 0.1686275, 1,
2.001688, -0.5156669, 1.127192, 1, 0, 0.1607843, 1,
2.009032, 0.2484044, -0.1476204, 1, 0, 0.1568628, 1,
2.015913, 0.4377427, 0.9316607, 1, 0, 0.1490196, 1,
2.068165, 1.024099, 0.7976767, 1, 0, 0.145098, 1,
2.072569, -1.148839, 3.240107, 1, 0, 0.1372549, 1,
2.083969, 1.234381, 1.805268, 1, 0, 0.1333333, 1,
2.115376, 1.281623, 2.208731, 1, 0, 0.1254902, 1,
2.119824, -1.086363, 0.5622999, 1, 0, 0.1215686, 1,
2.120807, 1.042711, 1.498357, 1, 0, 0.1137255, 1,
2.175654, -0.6012946, 3.044959, 1, 0, 0.1098039, 1,
2.191844, -1.723121, 2.76628, 1, 0, 0.1019608, 1,
2.203451, -1.410202, 3.661895, 1, 0, 0.09411765, 1,
2.241068, -0.4845808, 1.836956, 1, 0, 0.09019608, 1,
2.259739, -0.8975093, 1.163775, 1, 0, 0.08235294, 1,
2.285355, 0.9903512, 0.3909219, 1, 0, 0.07843138, 1,
2.285412, 0.0975419, -0.04072135, 1, 0, 0.07058824, 1,
2.304139, -0.6344134, 2.512419, 1, 0, 0.06666667, 1,
2.317649, 0.4738504, 1.591519, 1, 0, 0.05882353, 1,
2.394441, -1.581054, 2.426409, 1, 0, 0.05490196, 1,
2.438398, 0.3044852, 0.7542766, 1, 0, 0.04705882, 1,
2.48841, -1.011828, 2.140093, 1, 0, 0.04313726, 1,
2.507451, -0.5693827, 1.75602, 1, 0, 0.03529412, 1,
2.574498, 0.5219589, 1.975925, 1, 0, 0.03137255, 1,
2.600291, -0.9308161, 1.598022, 1, 0, 0.02352941, 1,
2.749296, 1.81946, 1.946763, 1, 0, 0.01960784, 1,
2.839049, -1.023445, 2.067029, 1, 0, 0.01176471, 1,
2.904787, 1.319513, 1.293615, 1, 0, 0.007843138, 1
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
-0.1852723, -4.099226, -7.974054, 0, -0.5, 0.5, 0.5,
-0.1852723, -4.099226, -7.974054, 1, -0.5, 0.5, 0.5,
-0.1852723, -4.099226, -7.974054, 1, 1.5, 0.5, 0.5,
-0.1852723, -4.099226, -7.974054, 0, 1.5, 0.5, 0.5
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
-4.322862, 0.05420065, -7.974054, 0, -0.5, 0.5, 0.5,
-4.322862, 0.05420065, -7.974054, 1, -0.5, 0.5, 0.5,
-4.322862, 0.05420065, -7.974054, 1, 1.5, 0.5, 0.5,
-4.322862, 0.05420065, -7.974054, 0, 1.5, 0.5, 0.5
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
-4.322862, -4.099226, 0.1098332, 0, -0.5, 0.5, 0.5,
-4.322862, -4.099226, 0.1098332, 1, -0.5, 0.5, 0.5,
-4.322862, -4.099226, 0.1098332, 1, 1.5, 0.5, 0.5,
-4.322862, -4.099226, 0.1098332, 0, 1.5, 0.5, 0.5
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
-3, -3.140743, -6.108541,
2, -3.140743, -6.108541,
-3, -3.140743, -6.108541,
-3, -3.30049, -6.41946,
-2, -3.140743, -6.108541,
-2, -3.30049, -6.41946,
-1, -3.140743, -6.108541,
-1, -3.30049, -6.41946,
0, -3.140743, -6.108541,
0, -3.30049, -6.41946,
1, -3.140743, -6.108541,
1, -3.30049, -6.41946,
2, -3.140743, -6.108541,
2, -3.30049, -6.41946
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
-3, -3.619985, -7.041298, 0, -0.5, 0.5, 0.5,
-3, -3.619985, -7.041298, 1, -0.5, 0.5, 0.5,
-3, -3.619985, -7.041298, 1, 1.5, 0.5, 0.5,
-3, -3.619985, -7.041298, 0, 1.5, 0.5, 0.5,
-2, -3.619985, -7.041298, 0, -0.5, 0.5, 0.5,
-2, -3.619985, -7.041298, 1, -0.5, 0.5, 0.5,
-2, -3.619985, -7.041298, 1, 1.5, 0.5, 0.5,
-2, -3.619985, -7.041298, 0, 1.5, 0.5, 0.5,
-1, -3.619985, -7.041298, 0, -0.5, 0.5, 0.5,
-1, -3.619985, -7.041298, 1, -0.5, 0.5, 0.5,
-1, -3.619985, -7.041298, 1, 1.5, 0.5, 0.5,
-1, -3.619985, -7.041298, 0, 1.5, 0.5, 0.5,
0, -3.619985, -7.041298, 0, -0.5, 0.5, 0.5,
0, -3.619985, -7.041298, 1, -0.5, 0.5, 0.5,
0, -3.619985, -7.041298, 1, 1.5, 0.5, 0.5,
0, -3.619985, -7.041298, 0, 1.5, 0.5, 0.5,
1, -3.619985, -7.041298, 0, -0.5, 0.5, 0.5,
1, -3.619985, -7.041298, 1, -0.5, 0.5, 0.5,
1, -3.619985, -7.041298, 1, 1.5, 0.5, 0.5,
1, -3.619985, -7.041298, 0, 1.5, 0.5, 0.5,
2, -3.619985, -7.041298, 0, -0.5, 0.5, 0.5,
2, -3.619985, -7.041298, 1, -0.5, 0.5, 0.5,
2, -3.619985, -7.041298, 1, 1.5, 0.5, 0.5,
2, -3.619985, -7.041298, 0, 1.5, 0.5, 0.5
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
-3.368033, -3, -6.108541,
-3.368033, 3, -6.108541,
-3.368033, -3, -6.108541,
-3.527172, -3, -6.41946,
-3.368033, -2, -6.108541,
-3.527172, -2, -6.41946,
-3.368033, -1, -6.108541,
-3.527172, -1, -6.41946,
-3.368033, 0, -6.108541,
-3.527172, 0, -6.41946,
-3.368033, 1, -6.108541,
-3.527172, 1, -6.41946,
-3.368033, 2, -6.108541,
-3.527172, 2, -6.41946,
-3.368033, 3, -6.108541,
-3.527172, 3, -6.41946
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
-3.845448, -3, -7.041298, 0, -0.5, 0.5, 0.5,
-3.845448, -3, -7.041298, 1, -0.5, 0.5, 0.5,
-3.845448, -3, -7.041298, 1, 1.5, 0.5, 0.5,
-3.845448, -3, -7.041298, 0, 1.5, 0.5, 0.5,
-3.845448, -2, -7.041298, 0, -0.5, 0.5, 0.5,
-3.845448, -2, -7.041298, 1, -0.5, 0.5, 0.5,
-3.845448, -2, -7.041298, 1, 1.5, 0.5, 0.5,
-3.845448, -2, -7.041298, 0, 1.5, 0.5, 0.5,
-3.845448, -1, -7.041298, 0, -0.5, 0.5, 0.5,
-3.845448, -1, -7.041298, 1, -0.5, 0.5, 0.5,
-3.845448, -1, -7.041298, 1, 1.5, 0.5, 0.5,
-3.845448, -1, -7.041298, 0, 1.5, 0.5, 0.5,
-3.845448, 0, -7.041298, 0, -0.5, 0.5, 0.5,
-3.845448, 0, -7.041298, 1, -0.5, 0.5, 0.5,
-3.845448, 0, -7.041298, 1, 1.5, 0.5, 0.5,
-3.845448, 0, -7.041298, 0, 1.5, 0.5, 0.5,
-3.845448, 1, -7.041298, 0, -0.5, 0.5, 0.5,
-3.845448, 1, -7.041298, 1, -0.5, 0.5, 0.5,
-3.845448, 1, -7.041298, 1, 1.5, 0.5, 0.5,
-3.845448, 1, -7.041298, 0, 1.5, 0.5, 0.5,
-3.845448, 2, -7.041298, 0, -0.5, 0.5, 0.5,
-3.845448, 2, -7.041298, 1, -0.5, 0.5, 0.5,
-3.845448, 2, -7.041298, 1, 1.5, 0.5, 0.5,
-3.845448, 2, -7.041298, 0, 1.5, 0.5, 0.5,
-3.845448, 3, -7.041298, 0, -0.5, 0.5, 0.5,
-3.845448, 3, -7.041298, 1, -0.5, 0.5, 0.5,
-3.845448, 3, -7.041298, 1, 1.5, 0.5, 0.5,
-3.845448, 3, -7.041298, 0, 1.5, 0.5, 0.5
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
-3.368033, -3.140743, -4,
-3.368033, -3.140743, 6,
-3.368033, -3.140743, -4,
-3.527172, -3.30049, -4,
-3.368033, -3.140743, -2,
-3.527172, -3.30049, -2,
-3.368033, -3.140743, 0,
-3.527172, -3.30049, 0,
-3.368033, -3.140743, 2,
-3.527172, -3.30049, 2,
-3.368033, -3.140743, 4,
-3.527172, -3.30049, 4,
-3.368033, -3.140743, 6,
-3.527172, -3.30049, 6
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
"4",
"6"
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
-3.845448, -3.619985, -4, 0, -0.5, 0.5, 0.5,
-3.845448, -3.619985, -4, 1, -0.5, 0.5, 0.5,
-3.845448, -3.619985, -4, 1, 1.5, 0.5, 0.5,
-3.845448, -3.619985, -4, 0, 1.5, 0.5, 0.5,
-3.845448, -3.619985, -2, 0, -0.5, 0.5, 0.5,
-3.845448, -3.619985, -2, 1, -0.5, 0.5, 0.5,
-3.845448, -3.619985, -2, 1, 1.5, 0.5, 0.5,
-3.845448, -3.619985, -2, 0, 1.5, 0.5, 0.5,
-3.845448, -3.619985, 0, 0, -0.5, 0.5, 0.5,
-3.845448, -3.619985, 0, 1, -0.5, 0.5, 0.5,
-3.845448, -3.619985, 0, 1, 1.5, 0.5, 0.5,
-3.845448, -3.619985, 0, 0, 1.5, 0.5, 0.5,
-3.845448, -3.619985, 2, 0, -0.5, 0.5, 0.5,
-3.845448, -3.619985, 2, 1, -0.5, 0.5, 0.5,
-3.845448, -3.619985, 2, 1, 1.5, 0.5, 0.5,
-3.845448, -3.619985, 2, 0, 1.5, 0.5, 0.5,
-3.845448, -3.619985, 4, 0, -0.5, 0.5, 0.5,
-3.845448, -3.619985, 4, 1, -0.5, 0.5, 0.5,
-3.845448, -3.619985, 4, 1, 1.5, 0.5, 0.5,
-3.845448, -3.619985, 4, 0, 1.5, 0.5, 0.5,
-3.845448, -3.619985, 6, 0, -0.5, 0.5, 0.5,
-3.845448, -3.619985, 6, 1, -0.5, 0.5, 0.5,
-3.845448, -3.619985, 6, 1, 1.5, 0.5, 0.5,
-3.845448, -3.619985, 6, 0, 1.5, 0.5, 0.5
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
-3.368033, -3.140743, -6.108541,
-3.368033, 3.249145, -6.108541,
-3.368033, -3.140743, 6.328208,
-3.368033, 3.249145, 6.328208,
-3.368033, -3.140743, -6.108541,
-3.368033, -3.140743, 6.328208,
-3.368033, 3.249145, -6.108541,
-3.368033, 3.249145, 6.328208,
-3.368033, -3.140743, -6.108541,
2.997489, -3.140743, -6.108541,
-3.368033, -3.140743, 6.328208,
2.997489, -3.140743, 6.328208,
-3.368033, 3.249145, -6.108541,
2.997489, 3.249145, -6.108541,
-3.368033, 3.249145, 6.328208,
2.997489, 3.249145, 6.328208,
2.997489, -3.140743, -6.108541,
2.997489, 3.249145, -6.108541,
2.997489, -3.140743, 6.328208,
2.997489, 3.249145, 6.328208,
2.997489, -3.140743, -6.108541,
2.997489, -3.140743, 6.328208,
2.997489, 3.249145, -6.108541,
2.997489, 3.249145, 6.328208
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
var radius = 8.20357;
var distance = 36.49861;
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
mvMatrix.translate( 0.1852723, -0.05420065, -0.1098332 );
mvMatrix.scale( 1.393422, 1.388109, 0.7131976 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.49861);
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
fluazinam<-read.table("fluazinam.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fluazinam$V2
```

```
## Error in eval(expr, envir, enclos): object 'fluazinam' not found
```

```r
y<-fluazinam$V3
```

```
## Error in eval(expr, envir, enclos): object 'fluazinam' not found
```

```r
z<-fluazinam$V4
```

```
## Error in eval(expr, envir, enclos): object 'fluazinam' not found
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
-3.275332, 0.7561074, -1.113605, 0, 0, 1, 1, 1,
-3.182445, 0.2951466, -2.397072, 1, 0, 0, 1, 1,
-2.973938, 0.1410116, -0.6984546, 1, 0, 0, 1, 1,
-2.924998, -0.6128553, -3.209513, 1, 0, 0, 1, 1,
-2.820893, -1.034642, -4.156515, 1, 0, 0, 1, 1,
-2.787219, 0.5318639, -0.8378533, 1, 0, 0, 1, 1,
-2.550711, -1.934385, -3.54801, 0, 0, 0, 1, 1,
-2.514437, -1.104327, -0.2148009, 0, 0, 0, 1, 1,
-2.398967, -0.04818133, -2.575545, 0, 0, 0, 1, 1,
-2.383764, 0.8892646, -0.5664946, 0, 0, 0, 1, 1,
-2.358841, 0.3644122, -2.04697, 0, 0, 0, 1, 1,
-2.337688, 1.551086, -3.22998, 0, 0, 0, 1, 1,
-2.332271, -1.409923, -1.19112, 0, 0, 0, 1, 1,
-2.234565, -0.0868538, -0.7409661, 1, 1, 1, 1, 1,
-2.222376, 0.2927362, -1.230756, 1, 1, 1, 1, 1,
-2.201696, 1.704602, 0.9976763, 1, 1, 1, 1, 1,
-2.162359, -0.9652102, -1.508929, 1, 1, 1, 1, 1,
-2.091816, 0.7427841, -0.1152809, 1, 1, 1, 1, 1,
-2.084296, 2.370552, -1.003134, 1, 1, 1, 1, 1,
-2.061223, -0.3447703, -2.41185, 1, 1, 1, 1, 1,
-2.019921, 1.009498, -1.309355, 1, 1, 1, 1, 1,
-2.008909, 0.1136881, -2.458281, 1, 1, 1, 1, 1,
-1.998779, -0.3477969, 0.7812681, 1, 1, 1, 1, 1,
-1.978967, 0.5258098, -3.853928, 1, 1, 1, 1, 1,
-1.97712, -0.7962769, -2.537107, 1, 1, 1, 1, 1,
-1.92495, 0.2174656, 0.296808, 1, 1, 1, 1, 1,
-1.917343, -1.744555, -2.822251, 1, 1, 1, 1, 1,
-1.898255, 0.1114227, -0.9901278, 1, 1, 1, 1, 1,
-1.882796, -0.2730669, -2.608902, 0, 0, 1, 1, 1,
-1.87918, 0.5880694, -2.101928, 1, 0, 0, 1, 1,
-1.866367, -0.2222407, -1.35438, 1, 0, 0, 1, 1,
-1.853265, -0.863588, -2.470938, 1, 0, 0, 1, 1,
-1.829794, -1.029736, 0.5125045, 1, 0, 0, 1, 1,
-1.824298, 0.3608014, -0.9530916, 1, 0, 0, 1, 1,
-1.820711, -0.6008978, -2.120406, 0, 0, 0, 1, 1,
-1.814805, 0.8493857, -2.827354, 0, 0, 0, 1, 1,
-1.8141, 0.8858897, -1.395278, 0, 0, 0, 1, 1,
-1.797505, 1.23347, -0.8149097, 0, 0, 0, 1, 1,
-1.783861, -0.7167896, -2.458921, 0, 0, 0, 1, 1,
-1.778532, -0.4443453, -4.297828, 0, 0, 0, 1, 1,
-1.773283, 1.376415, 0.1037893, 0, 0, 0, 1, 1,
-1.737848, -0.7119519, -3.447359, 1, 1, 1, 1, 1,
-1.737114, 0.3924056, -1.078107, 1, 1, 1, 1, 1,
-1.722088, -0.05011604, -0.6636214, 1, 1, 1, 1, 1,
-1.700052, 0.07236478, -3.82566, 1, 1, 1, 1, 1,
-1.684671, 1.40984, 0.8799914, 1, 1, 1, 1, 1,
-1.671816, 0.190051, -0.7519838, 1, 1, 1, 1, 1,
-1.659134, 0.5982689, -1.499748, 1, 1, 1, 1, 1,
-1.652673, 0.2904654, -1.08808, 1, 1, 1, 1, 1,
-1.652164, -1.239837, -0.7885287, 1, 1, 1, 1, 1,
-1.646309, 0.1830976, -2.738915, 1, 1, 1, 1, 1,
-1.637963, -0.6159754, -0.03358939, 1, 1, 1, 1, 1,
-1.637558, -0.6708071, -2.783832, 1, 1, 1, 1, 1,
-1.633811, -0.9016416, -2.342033, 1, 1, 1, 1, 1,
-1.627926, 0.9287574, -1.936234, 1, 1, 1, 1, 1,
-1.622472, 0.01818435, -0.7828339, 1, 1, 1, 1, 1,
-1.604234, -0.4504326, -1.315566, 0, 0, 1, 1, 1,
-1.593422, -0.6687071, -1.164742, 1, 0, 0, 1, 1,
-1.592389, -0.5460413, -2.465867, 1, 0, 0, 1, 1,
-1.58873, 0.2975419, -2.491776, 1, 0, 0, 1, 1,
-1.582992, -0.968178, -1.642052, 1, 0, 0, 1, 1,
-1.577397, 1.148638, -2.064249, 1, 0, 0, 1, 1,
-1.558403, 0.2607615, -0.8804643, 0, 0, 0, 1, 1,
-1.541352, 0.07655597, -2.321604, 0, 0, 0, 1, 1,
-1.516364, 1.560753, -0.5673797, 0, 0, 0, 1, 1,
-1.51454, -2.165344, -2.617133, 0, 0, 0, 1, 1,
-1.510631, -0.4018551, -1.712344, 0, 0, 0, 1, 1,
-1.48842, -1.036211, -2.527381, 0, 0, 0, 1, 1,
-1.488381, -0.194452, -1.564019, 0, 0, 0, 1, 1,
-1.477983, -1.089997, -1.916774, 1, 1, 1, 1, 1,
-1.470629, -0.5380734, -2.933095, 1, 1, 1, 1, 1,
-1.469882, -0.6583258, -0.6811647, 1, 1, 1, 1, 1,
-1.467159, -0.1368194, -1.489876, 1, 1, 1, 1, 1,
-1.466048, 0.1591954, -1.203251, 1, 1, 1, 1, 1,
-1.452859, 0.1083903, -0.005654315, 1, 1, 1, 1, 1,
-1.439732, -1.01306, -1.029086, 1, 1, 1, 1, 1,
-1.420608, -0.5881335, -4.260936, 1, 1, 1, 1, 1,
-1.41732, -0.1743168, -0.4897531, 1, 1, 1, 1, 1,
-1.402375, -0.9142492, -2.64223, 1, 1, 1, 1, 1,
-1.39777, 0.8526709, -0.03268189, 1, 1, 1, 1, 1,
-1.380486, 1.067564, -1.7133, 1, 1, 1, 1, 1,
-1.376908, 1.552462, 1.181874, 1, 1, 1, 1, 1,
-1.374917, -0.5025102, -0.5954531, 1, 1, 1, 1, 1,
-1.372257, -0.9166018, -3.989314, 1, 1, 1, 1, 1,
-1.369005, -1.160981, -2.349388, 0, 0, 1, 1, 1,
-1.344644, -0.2137434, -3.290982, 1, 0, 0, 1, 1,
-1.342258, 0.515627, -0.7052293, 1, 0, 0, 1, 1,
-1.331164, 0.4537387, -0.4866839, 1, 0, 0, 1, 1,
-1.327124, -0.6030183, -4.588553, 1, 0, 0, 1, 1,
-1.323064, 2.261814, -0.06012027, 1, 0, 0, 1, 1,
-1.319332, 1.663208, -1.477723, 0, 0, 0, 1, 1,
-1.315428, 0.8588389, -0.203496, 0, 0, 0, 1, 1,
-1.308786, 0.4731999, -1.549894, 0, 0, 0, 1, 1,
-1.306222, 2.191692, 0.8071973, 0, 0, 0, 1, 1,
-1.291446, -0.7138354, -3.923832, 0, 0, 0, 1, 1,
-1.286337, -1.08047, -1.438292, 0, 0, 0, 1, 1,
-1.28501, -0.433435, -2.394726, 0, 0, 0, 1, 1,
-1.283492, -1.427637, -0.8763033, 1, 1, 1, 1, 1,
-1.272178, -0.1947186, -2.913412, 1, 1, 1, 1, 1,
-1.270737, 0.8066188, -2.034628, 1, 1, 1, 1, 1,
-1.260547, -0.9006579, -0.2922529, 1, 1, 1, 1, 1,
-1.258218, -0.5933475, -1.45665, 1, 1, 1, 1, 1,
-1.238507, -0.1164323, -4.056692, 1, 1, 1, 1, 1,
-1.23411, 0.7782485, -1.705929, 1, 1, 1, 1, 1,
-1.231623, -1.999159, -2.372206, 1, 1, 1, 1, 1,
-1.221678, 0.3138566, 1.232393, 1, 1, 1, 1, 1,
-1.220831, 1.266903, -0.9182097, 1, 1, 1, 1, 1,
-1.204913, -0.579173, -1.98901, 1, 1, 1, 1, 1,
-1.196851, -2.909677, -2.085598, 1, 1, 1, 1, 1,
-1.190203, 0.9258329, -0.9145944, 1, 1, 1, 1, 1,
-1.177027, 0.9219019, -1.473786, 1, 1, 1, 1, 1,
-1.17221, -0.201137, -1.53157, 1, 1, 1, 1, 1,
-1.169221, -0.9491829, -3.256293, 0, 0, 1, 1, 1,
-1.165754, -1.155737, -0.3286464, 1, 0, 0, 1, 1,
-1.163063, -1.042675, -1.101678, 1, 0, 0, 1, 1,
-1.159666, 1.439123, -1.260015, 1, 0, 0, 1, 1,
-1.159054, -1.022496, -1.621846, 1, 0, 0, 1, 1,
-1.148478, -0.3339465, -2.609074, 1, 0, 0, 1, 1,
-1.137724, 0.6267425, -2.061094, 0, 0, 0, 1, 1,
-1.135495, 0.6779528, 0.5715741, 0, 0, 0, 1, 1,
-1.130545, -1.221909, -1.460919, 0, 0, 0, 1, 1,
-1.106696, -0.7650615, -1.961141, 0, 0, 0, 1, 1,
-1.09802, 0.9693061, 1.424845, 0, 0, 0, 1, 1,
-1.09607, 0.5233157, -1.818993, 0, 0, 0, 1, 1,
-1.092092, -0.08677293, -1.346757, 0, 0, 0, 1, 1,
-1.086551, -2.053371, -2.984922, 1, 1, 1, 1, 1,
-1.081217, -1.181487, -2.318824, 1, 1, 1, 1, 1,
-1.074723, -1.334625, -1.91748, 1, 1, 1, 1, 1,
-1.071129, -0.7472285, -3.008764, 1, 1, 1, 1, 1,
-1.067396, -1.44715, -2.137542, 1, 1, 1, 1, 1,
-1.065473, 0.3666527, -1.185488, 1, 1, 1, 1, 1,
-1.064203, -1.817465, -1.570964, 1, 1, 1, 1, 1,
-1.061678, -0.3416903, -1.83657, 1, 1, 1, 1, 1,
-1.045617, 0.9525534, 0.2665425, 1, 1, 1, 1, 1,
-1.044728, 2.178512, -0.4526367, 1, 1, 1, 1, 1,
-1.04237, -1.051828, -2.871635, 1, 1, 1, 1, 1,
-1.041436, 0.6819124, -1.031015, 1, 1, 1, 1, 1,
-1.041401, -0.3060548, -2.671464, 1, 1, 1, 1, 1,
-1.039788, -0.6745076, -1.578552, 1, 1, 1, 1, 1,
-1.036582, -1.096411, -2.05005, 1, 1, 1, 1, 1,
-1.030182, 1.014667, -0.05149627, 0, 0, 1, 1, 1,
-1.029747, 1.064873, -1.409412, 1, 0, 0, 1, 1,
-1.021872, 0.267735, -1.264663, 1, 0, 0, 1, 1,
-1.019931, -1.216133, -2.68826, 1, 0, 0, 1, 1,
-1.019331, -0.6984369, -2.250462, 1, 0, 0, 1, 1,
-1.016775, 2.367957, -0.2312797, 1, 0, 0, 1, 1,
-0.9938943, -0.7644976, -0.9410606, 0, 0, 0, 1, 1,
-0.985921, -0.01105893, -3.710013, 0, 0, 0, 1, 1,
-0.980433, -0.04804218, -1.725705, 0, 0, 0, 1, 1,
-0.9729142, -0.8383725, -2.845538, 0, 0, 0, 1, 1,
-0.9713771, 0.1163948, -2.656696, 0, 0, 0, 1, 1,
-0.9712501, 0.2610043, -0.4396809, 0, 0, 0, 1, 1,
-0.9696053, -0.4520496, -2.484764, 0, 0, 0, 1, 1,
-0.9692512, -0.05951654, -1.342536, 1, 1, 1, 1, 1,
-0.9634355, 0.01359455, -1.455104, 1, 1, 1, 1, 1,
-0.9632532, 1.428944, -2.072033, 1, 1, 1, 1, 1,
-0.9524129, 0.2529391, -1.145644, 1, 1, 1, 1, 1,
-0.9516935, 0.065863, -2.10204, 1, 1, 1, 1, 1,
-0.9440106, -0.3963435, -1.325512, 1, 1, 1, 1, 1,
-0.943791, -1.090809, -3.200413, 1, 1, 1, 1, 1,
-0.9337912, 0.1300587, -2.473019, 1, 1, 1, 1, 1,
-0.9334533, 0.4383648, -1.257647, 1, 1, 1, 1, 1,
-0.925832, 1.242592, 0.8849086, 1, 1, 1, 1, 1,
-0.9194401, 0.2617765, -2.274043, 1, 1, 1, 1, 1,
-0.9047204, 0.8480284, -1.072904, 1, 1, 1, 1, 1,
-0.9039112, 0.1485367, -1.674273, 1, 1, 1, 1, 1,
-0.9033032, 1.297747, -0.2878247, 1, 1, 1, 1, 1,
-0.9023216, 0.2950415, -1.525877, 1, 1, 1, 1, 1,
-0.9005458, 0.5059474, -0.5865874, 0, 0, 1, 1, 1,
-0.8984156, 0.3780693, 0.04248922, 1, 0, 0, 1, 1,
-0.8952444, -0.3005059, -2.165829, 1, 0, 0, 1, 1,
-0.8910029, 0.8936938, -1.188691, 1, 0, 0, 1, 1,
-0.8879424, -0.4161121, -1.71308, 1, 0, 0, 1, 1,
-0.8843535, 1.514361, -0.7905173, 1, 0, 0, 1, 1,
-0.8747188, 0.7744055, -0.1477961, 0, 0, 0, 1, 1,
-0.8695759, 1.110912, -0.6061716, 0, 0, 0, 1, 1,
-0.8668976, 1.331032, -1.425757, 0, 0, 0, 1, 1,
-0.8657759, 0.3208753, -1.919957, 0, 0, 0, 1, 1,
-0.864974, -0.5465316, -3.120557, 0, 0, 0, 1, 1,
-0.8560356, 1.794906, 0.01864615, 0, 0, 0, 1, 1,
-0.8557411, 1.017094, -2.036103, 0, 0, 0, 1, 1,
-0.8552057, 0.148674, -1.662934, 1, 1, 1, 1, 1,
-0.8538823, 0.4201542, -0.5495075, 1, 1, 1, 1, 1,
-0.8522401, 0.3464037, -1.115301, 1, 1, 1, 1, 1,
-0.8509161, -0.6487132, -3.527735, 1, 1, 1, 1, 1,
-0.8504232, 1.800895, 0.5551264, 1, 1, 1, 1, 1,
-0.848341, -0.1942849, -2.316198, 1, 1, 1, 1, 1,
-0.8450544, -0.9274918, -3.271591, 1, 1, 1, 1, 1,
-0.8439178, 0.5111755, -0.3732353, 1, 1, 1, 1, 1,
-0.8421057, 0.8586905, -1.618826, 1, 1, 1, 1, 1,
-0.8383333, -0.6500735, -1.886764, 1, 1, 1, 1, 1,
-0.8361601, -0.2100243, -0.5723902, 1, 1, 1, 1, 1,
-0.8341169, -0.3259976, -2.12542, 1, 1, 1, 1, 1,
-0.8283389, -0.6242948, -1.011843, 1, 1, 1, 1, 1,
-0.8185995, -2.214363, -3.252167, 1, 1, 1, 1, 1,
-0.8183281, -0.7763011, -2.088719, 1, 1, 1, 1, 1,
-0.8145697, 1.981673, 0.678188, 0, 0, 1, 1, 1,
-0.8091139, 0.3712621, -0.5041575, 1, 0, 0, 1, 1,
-0.7948425, -0.2700032, -1.552424, 1, 0, 0, 1, 1,
-0.7911975, 0.8053548, 0.6537546, 1, 0, 0, 1, 1,
-0.7871923, 0.8773506, -1.341096, 1, 0, 0, 1, 1,
-0.7776617, -1.359372, -1.563461, 1, 0, 0, 1, 1,
-0.7747051, -1.24134, -2.279313, 0, 0, 0, 1, 1,
-0.7726999, -1.035207, -1.839548, 0, 0, 0, 1, 1,
-0.7721162, -0.1048504, -0.7479468, 0, 0, 0, 1, 1,
-0.7698331, 0.296553, -0.7085751, 0, 0, 0, 1, 1,
-0.7651948, -1.015357, -1.95729, 0, 0, 0, 1, 1,
-0.757063, 1.298363, -0.1821422, 0, 0, 0, 1, 1,
-0.7525538, -0.9433915, -1.772464, 0, 0, 0, 1, 1,
-0.7525216, -0.7230112, -2.817473, 1, 1, 1, 1, 1,
-0.7508299, 1.220728, 1.727005, 1, 1, 1, 1, 1,
-0.7500026, -0.9617018, -3.233877, 1, 1, 1, 1, 1,
-0.7438027, 0.5251411, -3.332409, 1, 1, 1, 1, 1,
-0.740118, -1.836324, -2.853249, 1, 1, 1, 1, 1,
-0.733634, 1.581443, -1.18626, 1, 1, 1, 1, 1,
-0.7251843, -0.7935242, -2.676361, 1, 1, 1, 1, 1,
-0.7234705, -0.7055418, -3.696544, 1, 1, 1, 1, 1,
-0.722469, 0.2976129, -0.4511549, 1, 1, 1, 1, 1,
-0.7180231, 2.890674, 1.214364, 1, 1, 1, 1, 1,
-0.7173557, -1.255643, -2.65376, 1, 1, 1, 1, 1,
-0.716405, 0.9295709, -1.804877, 1, 1, 1, 1, 1,
-0.7091977, -0.9983388, -2.623427, 1, 1, 1, 1, 1,
-0.7077891, -0.2761195, -1.193793, 1, 1, 1, 1, 1,
-0.7066724, -1.83738, -3.976451, 1, 1, 1, 1, 1,
-0.7037731, 1.590907, 1.324391, 0, 0, 1, 1, 1,
-0.7030129, 0.7643569, -1.054013, 1, 0, 0, 1, 1,
-0.7026824, 0.5109009, 0.6697866, 1, 0, 0, 1, 1,
-0.6920173, -0.3990064, -1.711551, 1, 0, 0, 1, 1,
-0.6851196, 0.328399, -1.09317, 1, 0, 0, 1, 1,
-0.6838654, -1.34621, -2.868605, 1, 0, 0, 1, 1,
-0.6831398, -0.5492508, -1.483783, 0, 0, 0, 1, 1,
-0.6828848, 1.528262, -1.364757, 0, 0, 0, 1, 1,
-0.6797345, -0.04101319, -0.8031789, 0, 0, 0, 1, 1,
-0.6748832, -1.160159, -1.6177, 0, 0, 0, 1, 1,
-0.6730638, 0.612839, 0.1026507, 0, 0, 0, 1, 1,
-0.6723022, -1.028153, -3.366689, 0, 0, 0, 1, 1,
-0.6668072, -1.489375, -2.502248, 0, 0, 0, 1, 1,
-0.6646707, 0.09886729, -1.098252, 1, 1, 1, 1, 1,
-0.6517445, -0.9056154, -2.951129, 1, 1, 1, 1, 1,
-0.646538, -0.2539158, -1.385406, 1, 1, 1, 1, 1,
-0.6332045, 0.4456262, -2.069382, 1, 1, 1, 1, 1,
-0.6231303, 0.3785074, -0.558378, 1, 1, 1, 1, 1,
-0.6196803, 1.625606, -0.5306324, 1, 1, 1, 1, 1,
-0.6195403, 0.05277212, -1.280417, 1, 1, 1, 1, 1,
-0.6133943, -0.3942276, -2.947042, 1, 1, 1, 1, 1,
-0.6103756, -0.1990798, -2.263104, 1, 1, 1, 1, 1,
-0.6058506, 0.5225158, -0.7293651, 1, 1, 1, 1, 1,
-0.6043907, -0.8079438, -0.9314555, 1, 1, 1, 1, 1,
-0.6029192, 0.2806112, -1.179256, 1, 1, 1, 1, 1,
-0.600031, -0.8320522, -1.252272, 1, 1, 1, 1, 1,
-0.5991948, -1.65624, -2.407354, 1, 1, 1, 1, 1,
-0.5979249, -1.20685, -1.275216, 1, 1, 1, 1, 1,
-0.5962441, -1.627526, -2.456832, 0, 0, 1, 1, 1,
-0.593103, -0.04529075, -1.364075, 1, 0, 0, 1, 1,
-0.5926539, -2.326631, -4.085924, 1, 0, 0, 1, 1,
-0.5918993, -1.017, -3.382215, 1, 0, 0, 1, 1,
-0.589857, 0.4634172, -1.663081, 1, 0, 0, 1, 1,
-0.5843474, 1.357724, -0.01986234, 1, 0, 0, 1, 1,
-0.5832294, -0.06976046, 0.3117693, 0, 0, 0, 1, 1,
-0.5792426, -0.9422061, -5.179981, 0, 0, 0, 1, 1,
-0.574851, 0.1071785, -2.231112, 0, 0, 0, 1, 1,
-0.5740027, 0.661218, -1.300608, 0, 0, 0, 1, 1,
-0.5728931, -0.9171963, -2.168578, 0, 0, 0, 1, 1,
-0.5713031, -1.795661, -3.128965, 0, 0, 0, 1, 1,
-0.5700912, -0.3821336, -3.899946, 0, 0, 0, 1, 1,
-0.5643965, -0.3243786, -1.288501, 1, 1, 1, 1, 1,
-0.5628065, -0.7598677, -2.793859, 1, 1, 1, 1, 1,
-0.5604292, -1.290209, -3.046671, 1, 1, 1, 1, 1,
-0.5524742, -0.6679539, -0.3215399, 1, 1, 1, 1, 1,
-0.5499778, 0.8168805, -1.586857, 1, 1, 1, 1, 1,
-0.54342, -0.6706762, -1.793632, 1, 1, 1, 1, 1,
-0.5349212, -1.742167, -1.748703, 1, 1, 1, 1, 1,
-0.5340691, 0.2015144, -1.760856, 1, 1, 1, 1, 1,
-0.5308208, 1.094165, -0.8252495, 1, 1, 1, 1, 1,
-0.5172436, 1.081253, -0.732447, 1, 1, 1, 1, 1,
-0.515835, -1.207032, -2.163419, 1, 1, 1, 1, 1,
-0.5153649, 0.6238171, -0.8618658, 1, 1, 1, 1, 1,
-0.5140082, -1.591237, -2.680814, 1, 1, 1, 1, 1,
-0.5129936, -0.1742016, -1.13811, 1, 1, 1, 1, 1,
-0.5099494, 1.286497, -1.27188, 1, 1, 1, 1, 1,
-0.5090905, -0.6153988, -2.038116, 0, 0, 1, 1, 1,
-0.5038905, -0.7319751, -2.063433, 1, 0, 0, 1, 1,
-0.5029629, 0.4718262, -0.9133164, 1, 0, 0, 1, 1,
-0.5029415, -1.076064, -3.536278, 1, 0, 0, 1, 1,
-0.4992653, -1.070275, -1.866763, 1, 0, 0, 1, 1,
-0.4982488, -1.307543, -3.338282, 1, 0, 0, 1, 1,
-0.4959577, 0.69056, -1.148321, 0, 0, 0, 1, 1,
-0.4954804, 0.6128069, -0.07045061, 0, 0, 0, 1, 1,
-0.493283, -0.8013822, -3.931574, 0, 0, 0, 1, 1,
-0.4931428, -0.1704229, -1.523255, 0, 0, 0, 1, 1,
-0.485146, 0.7695487, 0.1453329, 0, 0, 0, 1, 1,
-0.482147, 0.02122052, -0.7447298, 0, 0, 0, 1, 1,
-0.4811012, 0.04248246, -0.7242808, 0, 0, 0, 1, 1,
-0.4806571, 1.022933, 1.203515, 1, 1, 1, 1, 1,
-0.4797747, -1.522613, -3.418081, 1, 1, 1, 1, 1,
-0.4761475, 0.6690507, -0.8842904, 1, 1, 1, 1, 1,
-0.475053, 0.1530547, -1.160585, 1, 1, 1, 1, 1,
-0.4741056, -0.3358186, -2.017503, 1, 1, 1, 1, 1,
-0.4715644, -0.5379038, -1.293777, 1, 1, 1, 1, 1,
-0.4712802, -0.4598311, -3.013185, 1, 1, 1, 1, 1,
-0.4693437, -0.9798877, -3.219696, 1, 1, 1, 1, 1,
-0.4662359, -0.4826274, -0.9632807, 1, 1, 1, 1, 1,
-0.4659263, -1.151318, -2.649291, 1, 1, 1, 1, 1,
-0.4651315, -0.9873577, -1.633116, 1, 1, 1, 1, 1,
-0.4633893, -0.3471566, -1.996511, 1, 1, 1, 1, 1,
-0.4626478, 0.8332606, -0.6592945, 1, 1, 1, 1, 1,
-0.457563, -0.5472419, -2.179474, 1, 1, 1, 1, 1,
-0.4561697, 0.3369893, -0.4950151, 1, 1, 1, 1, 1,
-0.4549477, 0.4460454, 0.1768218, 0, 0, 1, 1, 1,
-0.4543884, 3.090179, 1.875882, 1, 0, 0, 1, 1,
-0.4514559, -0.3055271, -0.85381, 1, 0, 0, 1, 1,
-0.4507743, -1.013253, -0.5801293, 1, 0, 0, 1, 1,
-0.4439375, 0.6686716, -0.09765658, 1, 0, 0, 1, 1,
-0.4432133, -0.02531061, -1.338562, 1, 0, 0, 1, 1,
-0.4373678, -0.8334481, -2.92539, 0, 0, 0, 1, 1,
-0.4346867, -1.345404, -3.49441, 0, 0, 0, 1, 1,
-0.4335973, 0.3293744, -0.0184629, 0, 0, 0, 1, 1,
-0.4322704, 0.6645386, -1.129285, 0, 0, 0, 1, 1,
-0.4278551, -1.493891, -2.891036, 0, 0, 0, 1, 1,
-0.4212693, -0.8057488, -3.117792, 0, 0, 0, 1, 1,
-0.4204859, -0.4792346, -2.240071, 0, 0, 0, 1, 1,
-0.4192455, 1.405691, 0.9255255, 1, 1, 1, 1, 1,
-0.4189581, 0.1001965, -1.737362, 1, 1, 1, 1, 1,
-0.4189362, -0.5512513, -2.421445, 1, 1, 1, 1, 1,
-0.4154605, 0.9527121, 0.5338548, 1, 1, 1, 1, 1,
-0.4143015, 0.7886723, -1.024053, 1, 1, 1, 1, 1,
-0.4130777, -0.1861475, -1.289872, 1, 1, 1, 1, 1,
-0.4125725, -1.23557, -3.251548, 1, 1, 1, 1, 1,
-0.4096245, -1.529495, -3.285595, 1, 1, 1, 1, 1,
-0.4078927, 0.2241725, -3.930001, 1, 1, 1, 1, 1,
-0.4033162, -0.5153875, -1.90804, 1, 1, 1, 1, 1,
-0.4032724, 0.44559, -0.07127659, 1, 1, 1, 1, 1,
-0.4024994, -0.4031005, -1.962022, 1, 1, 1, 1, 1,
-0.3998502, -0.1450733, -1.592867, 1, 1, 1, 1, 1,
-0.3976987, 0.02852307, -0.4462824, 1, 1, 1, 1, 1,
-0.3956047, -0.5115861, -3.508617, 1, 1, 1, 1, 1,
-0.387493, -0.3866213, -1.237416, 0, 0, 1, 1, 1,
-0.385248, -1.549428, -1.87293, 1, 0, 0, 1, 1,
-0.3788703, -1.909495, -4.878022, 1, 0, 0, 1, 1,
-0.3779924, -0.1572683, -2.848886, 1, 0, 0, 1, 1,
-0.3732183, 0.1250786, -1.98011, 1, 0, 0, 1, 1,
-0.3724702, -0.1214502, -1.325763, 1, 0, 0, 1, 1,
-0.3720582, 0.9296439, -2.519928, 0, 0, 0, 1, 1,
-0.3713771, -0.8469744, -3.308508, 0, 0, 0, 1, 1,
-0.3689187, 0.2391176, -0.7167671, 0, 0, 0, 1, 1,
-0.3671075, -0.16738, -3.553167, 0, 0, 0, 1, 1,
-0.3665246, 0.2902575, -1.312133, 0, 0, 0, 1, 1,
-0.3662928, -0.830348, -2.023823, 0, 0, 0, 1, 1,
-0.3610082, -0.2388585, -2.431953, 0, 0, 0, 1, 1,
-0.3580376, -0.9592063, -4.049746, 1, 1, 1, 1, 1,
-0.3573342, 1.349366, -0.1918271, 1, 1, 1, 1, 1,
-0.3571938, -1.073318, -3.003922, 1, 1, 1, 1, 1,
-0.3545994, 0.206275, -0.9001444, 1, 1, 1, 1, 1,
-0.3523154, -1.591702, -3.949487, 1, 1, 1, 1, 1,
-0.347136, -0.3165987, -3.035573, 1, 1, 1, 1, 1,
-0.3445184, -1.185178, -3.906714, 1, 1, 1, 1, 1,
-0.3428353, -0.5277933, -1.660105, 1, 1, 1, 1, 1,
-0.3373374, -0.9119514, -3.022987, 1, 1, 1, 1, 1,
-0.3355653, -0.02078005, -1.718906, 1, 1, 1, 1, 1,
-0.3349373, -0.7071481, 0.2523055, 1, 1, 1, 1, 1,
-0.3319989, 0.2416461, -0.2611011, 1, 1, 1, 1, 1,
-0.3297375, -0.9484696, -3.82548, 1, 1, 1, 1, 1,
-0.3295413, 0.06954876, -0.3649113, 1, 1, 1, 1, 1,
-0.3266175, -1.237707, -5.241063, 1, 1, 1, 1, 1,
-0.3264856, -1.171358, -2.371236, 0, 0, 1, 1, 1,
-0.3231576, 0.4798706, -2.233027, 1, 0, 0, 1, 1,
-0.3209377, 0.7267674, -1.495789, 1, 0, 0, 1, 1,
-0.3203962, -2.872521, -2.598421, 1, 0, 0, 1, 1,
-0.316866, 0.1793645, -2.282349, 1, 0, 0, 1, 1,
-0.3162313, -1.756485, -3.669622, 1, 0, 0, 1, 1,
-0.3148258, 0.4606539, -0.9343174, 0, 0, 0, 1, 1,
-0.3142538, 0.5072543, -0.051412, 0, 0, 0, 1, 1,
-0.3113804, -1.155184, -5.927424, 0, 0, 0, 1, 1,
-0.3107487, -0.2006278, -2.907244, 0, 0, 0, 1, 1,
-0.3103662, -1.422847, -3.226723, 0, 0, 0, 1, 1,
-0.3085264, -0.6375088, -4.216852, 0, 0, 0, 1, 1,
-0.3024507, 2.464791, -0.1891875, 0, 0, 0, 1, 1,
-0.3024395, 0.02481211, -0.8017885, 1, 1, 1, 1, 1,
-0.2989213, -1.699824, -1.764993, 1, 1, 1, 1, 1,
-0.2987321, 0.9147064, -0.4816205, 1, 1, 1, 1, 1,
-0.2982354, 0.08849714, -1.883159, 1, 1, 1, 1, 1,
-0.2943046, 0.2717456, -1.414261, 1, 1, 1, 1, 1,
-0.2934629, -0.9478894, -2.731727, 1, 1, 1, 1, 1,
-0.2921236, 1.093351, -2.185525, 1, 1, 1, 1, 1,
-0.2913694, 0.02145802, -0.6876096, 1, 1, 1, 1, 1,
-0.2905362, 1.219085, -0.6897866, 1, 1, 1, 1, 1,
-0.2903771, 0.6526317, 0.3229088, 1, 1, 1, 1, 1,
-0.285608, -1.126522, -2.85151, 1, 1, 1, 1, 1,
-0.2844979, 0.9167265, -0.5748408, 1, 1, 1, 1, 1,
-0.2837574, -0.05311618, -2.25699, 1, 1, 1, 1, 1,
-0.281825, 1.436834, 0.7586706, 1, 1, 1, 1, 1,
-0.2770392, 0.4567073, -1.722309, 1, 1, 1, 1, 1,
-0.2744547, 0.5582554, -2.401835, 0, 0, 1, 1, 1,
-0.2722836, 0.8908027, 1.407058, 1, 0, 0, 1, 1,
-0.2719383, -0.07200915, -1.760437, 1, 0, 0, 1, 1,
-0.2718471, -0.8268824, -2.725674, 1, 0, 0, 1, 1,
-0.2706835, 0.6120416, -0.1311236, 1, 0, 0, 1, 1,
-0.2683193, -0.8607306, -2.977777, 1, 0, 0, 1, 1,
-0.2653651, -0.3827612, -1.704451, 0, 0, 0, 1, 1,
-0.2651753, -0.2967325, -3.309052, 0, 0, 0, 1, 1,
-0.2639573, 0.3571624, -0.8643975, 0, 0, 0, 1, 1,
-0.2625796, 0.5660303, 0.6613797, 0, 0, 0, 1, 1,
-0.2610177, -0.9041309, -3.980322, 0, 0, 0, 1, 1,
-0.2608082, 0.1709445, -1.642905, 0, 0, 0, 1, 1,
-0.2576719, 0.5684334, 0.8964149, 0, 0, 0, 1, 1,
-0.2559611, -0.8380789, -5.043342, 1, 1, 1, 1, 1,
-0.254673, -0.3335996, -5.471011, 1, 1, 1, 1, 1,
-0.2529355, 0.2417667, -1.18994, 1, 1, 1, 1, 1,
-0.2505576, -1.070786, -2.12718, 1, 1, 1, 1, 1,
-0.2469539, -0.05270331, -1.63448, 1, 1, 1, 1, 1,
-0.2460247, 1.078036, -0.8707386, 1, 1, 1, 1, 1,
-0.2460095, 1.084142, 0.1684308, 1, 1, 1, 1, 1,
-0.242233, -1.247058, -1.691719, 1, 1, 1, 1, 1,
-0.2393616, 0.5737444, 1.575067, 1, 1, 1, 1, 1,
-0.2391808, 1.79794, -0.8389704, 1, 1, 1, 1, 1,
-0.2385655, 0.02820494, -1.886722, 1, 1, 1, 1, 1,
-0.2370638, 0.5571087, -1.580203, 1, 1, 1, 1, 1,
-0.2366189, 0.2525196, -0.1687854, 1, 1, 1, 1, 1,
-0.2359801, -1.602497, -2.797472, 1, 1, 1, 1, 1,
-0.2317876, 0.1713213, -0.3959961, 1, 1, 1, 1, 1,
-0.2280471, 0.7736603, -0.307023, 0, 0, 1, 1, 1,
-0.2264936, 0.3119725, -1.222078, 1, 0, 0, 1, 1,
-0.2221675, -0.9435917, -1.776696, 1, 0, 0, 1, 1,
-0.2197095, 0.6466027, 0.4654252, 1, 0, 0, 1, 1,
-0.2169438, -0.4088086, -2.550251, 1, 0, 0, 1, 1,
-0.2133355, 1.54274, 0.6545272, 1, 0, 0, 1, 1,
-0.2122581, 0.7603463, -0.8531362, 0, 0, 0, 1, 1,
-0.2103622, -0.1085001, -3.963766, 0, 0, 0, 1, 1,
-0.2082602, 1.7424, -1.979557, 0, 0, 0, 1, 1,
-0.2015019, -0.01315174, -2.149153, 0, 0, 0, 1, 1,
-0.200762, 0.583442, 0.5505739, 0, 0, 0, 1, 1,
-0.1995778, -0.4744243, -1.996927, 0, 0, 0, 1, 1,
-0.1989692, 1.564849, -0.2633861, 0, 0, 0, 1, 1,
-0.1963358, -0.2315512, -3.123636, 1, 1, 1, 1, 1,
-0.1951638, -0.8886586, -2.310046, 1, 1, 1, 1, 1,
-0.1887555, -0.1040435, -3.36526, 1, 1, 1, 1, 1,
-0.1875369, 0.1554713, 1.450833, 1, 1, 1, 1, 1,
-0.1815977, -0.06061296, -1.360534, 1, 1, 1, 1, 1,
-0.1806505, 1.098718, -0.4759896, 1, 1, 1, 1, 1,
-0.170317, -3.047687, -2.752712, 1, 1, 1, 1, 1,
-0.1702434, -1.308413, -3.451205, 1, 1, 1, 1, 1,
-0.1670136, 0.8075247, 0.8563147, 1, 1, 1, 1, 1,
-0.1666289, 0.7464959, -1.338012, 1, 1, 1, 1, 1,
-0.1634145, -0.5696239, -1.710206, 1, 1, 1, 1, 1,
-0.1626439, -0.1757468, -2.434163, 1, 1, 1, 1, 1,
-0.1602648, -0.6659079, -3.150641, 1, 1, 1, 1, 1,
-0.1564469, -3.003004, -4.1801, 1, 1, 1, 1, 1,
-0.1540721, -0.9529067, -3.940902, 1, 1, 1, 1, 1,
-0.142562, 1.541356, 0.8423167, 0, 0, 1, 1, 1,
-0.1422512, 1.635096, -0.02950166, 1, 0, 0, 1, 1,
-0.1327617, 0.9996631, 0.9483831, 1, 0, 0, 1, 1,
-0.1320251, 0.08495308, -0.6168918, 1, 0, 0, 1, 1,
-0.1318473, 0.8647402, -0.2950364, 1, 0, 0, 1, 1,
-0.1313558, -0.3589646, -0.6488157, 1, 0, 0, 1, 1,
-0.1305229, -0.9096026, -2.301703, 0, 0, 0, 1, 1,
-0.1277568, -0.2306161, -3.47037, 0, 0, 0, 1, 1,
-0.1267607, 0.8616349, 0.4050629, 0, 0, 0, 1, 1,
-0.1210905, -2.133068, -3.267707, 0, 0, 0, 1, 1,
-0.116516, 0.2458692, -0.6180069, 0, 0, 0, 1, 1,
-0.1096135, 0.4427653, 0.7208299, 0, 0, 0, 1, 1,
-0.1085468, 0.1516197, -1.177182, 0, 0, 0, 1, 1,
-0.1039777, 0.4890912, -0.2693022, 1, 1, 1, 1, 1,
-0.1035318, -0.779586, -0.637831, 1, 1, 1, 1, 1,
-0.1034527, -0.7256468, -2.321468, 1, 1, 1, 1, 1,
-0.1014603, -1.452432, -2.613599, 1, 1, 1, 1, 1,
-0.1002889, -0.2650272, -3.745435, 1, 1, 1, 1, 1,
-0.09948399, -0.2743526, -4.650965, 1, 1, 1, 1, 1,
-0.09668625, 0.3979301, 0.2712885, 1, 1, 1, 1, 1,
-0.09650434, -0.6313076, -3.5206, 1, 1, 1, 1, 1,
-0.09637233, -1.285434, -4.5351, 1, 1, 1, 1, 1,
-0.09521575, 0.2347044, -0.3481898, 1, 1, 1, 1, 1,
-0.09390397, -0.7278576, -2.910566, 1, 1, 1, 1, 1,
-0.08856259, 2.600783, 0.1756092, 1, 1, 1, 1, 1,
-0.08853682, 3.083166, -0.7584334, 1, 1, 1, 1, 1,
-0.08166156, -1.324812, -2.763572, 1, 1, 1, 1, 1,
-0.07695035, 0.03319088, -1.439131, 1, 1, 1, 1, 1,
-0.07485932, -0.6570415, -3.962699, 0, 0, 1, 1, 1,
-0.07345093, -0.4827186, -2.526501, 1, 0, 0, 1, 1,
-0.07166022, -0.8664961, -5.304955, 1, 0, 0, 1, 1,
-0.0693276, 0.0005691915, -1.313434, 1, 0, 0, 1, 1,
-0.06522399, 0.5474811, 1.503099, 1, 0, 0, 1, 1,
-0.05906462, -0.3978869, -3.804025, 1, 0, 0, 1, 1,
-0.05593458, 1.810793, 0.8659251, 0, 0, 0, 1, 1,
-0.05364097, -0.2052643, -2.650324, 0, 0, 0, 1, 1,
-0.04930857, 0.8174593, 0.9056523, 0, 0, 0, 1, 1,
-0.04775592, -0.5304602, -4.607584, 0, 0, 0, 1, 1,
-0.04712565, 0.5804287, -0.9482853, 0, 0, 0, 1, 1,
-0.04583507, -0.8067628, -3.890414, 0, 0, 0, 1, 1,
-0.03956515, 0.9668623, 1.443424, 0, 0, 0, 1, 1,
-0.03474479, -0.6528164, -3.718463, 1, 1, 1, 1, 1,
-0.03187243, -0.6819398, -2.144193, 1, 1, 1, 1, 1,
-0.03007592, -0.4600125, -3.071411, 1, 1, 1, 1, 1,
-0.02862903, 0.003591349, -1.022752, 1, 1, 1, 1, 1,
-0.02798905, 0.8074633, 0.9803719, 1, 1, 1, 1, 1,
-0.02521328, 1.209618, 0.01825945, 1, 1, 1, 1, 1,
-0.02030741, 0.1232091, 0.4549587, 1, 1, 1, 1, 1,
-0.01921466, -0.4289072, -4.150502, 1, 1, 1, 1, 1,
-0.01666457, 0.6448859, -0.6749902, 1, 1, 1, 1, 1,
-0.01594184, 0.122715, 0.4219856, 1, 1, 1, 1, 1,
-0.01448787, -0.5735161, -3.075214, 1, 1, 1, 1, 1,
-0.01113994, -0.2540445, -4.110659, 1, 1, 1, 1, 1,
-0.01029723, -0.6424348, -4.686157, 1, 1, 1, 1, 1,
-0.007150902, -1.284519, -2.474702, 1, 1, 1, 1, 1,
-0.006336419, 0.764779, 0.02478934, 1, 1, 1, 1, 1,
-0.00565812, -0.8488905, -2.885911, 0, 0, 1, 1, 1,
-0.003076435, -0.6154661, -1.968842, 1, 0, 0, 1, 1,
-0.001373566, -1.274647, -3.680139, 1, 0, 0, 1, 1,
-0.001238168, 0.1413998, 0.8534566, 1, 0, 0, 1, 1,
0.001212728, -0.3460445, 2.895005, 1, 0, 0, 1, 1,
0.01012759, 0.8713296, -0.9306248, 1, 0, 0, 1, 1,
0.01606247, -0.4045771, 3.794046, 0, 0, 0, 1, 1,
0.01670429, 1.589968, -0.7182916, 0, 0, 0, 1, 1,
0.01717343, -0.05679908, 3.472073, 0, 0, 0, 1, 1,
0.01726238, -0.3286685, 4.609106, 0, 0, 0, 1, 1,
0.0224802, 0.8181697, -0.7148153, 0, 0, 0, 1, 1,
0.02493604, -1.728572, 2.480844, 0, 0, 0, 1, 1,
0.02585712, -0.8757284, 0.9615645, 0, 0, 0, 1, 1,
0.02816308, 1.090781, 0.7351437, 1, 1, 1, 1, 1,
0.03284933, -1.742294, 5.463888, 1, 1, 1, 1, 1,
0.03816741, -0.1983511, 2.550161, 1, 1, 1, 1, 1,
0.0454083, 0.3054103, 1.367726, 1, 1, 1, 1, 1,
0.0459436, 0.4637835, 0.9415121, 1, 1, 1, 1, 1,
0.04751383, 1.142446, -0.7944204, 1, 1, 1, 1, 1,
0.04768308, -0.1759674, 3.564008, 1, 1, 1, 1, 1,
0.05468879, 1.365779, -0.5274884, 1, 1, 1, 1, 1,
0.05481255, -1.547813, 2.655296, 1, 1, 1, 1, 1,
0.05565426, -1.30037, 2.284588, 1, 1, 1, 1, 1,
0.05758036, -0.3691101, 3.624756, 1, 1, 1, 1, 1,
0.05952831, 0.2459263, 0.3309836, 1, 1, 1, 1, 1,
0.05954993, 0.5042437, 1.710748, 1, 1, 1, 1, 1,
0.06128105, 0.4353279, 0.5736513, 1, 1, 1, 1, 1,
0.06290286, 1.52332, 1.071599, 1, 1, 1, 1, 1,
0.06378245, -0.1030309, 2.482388, 0, 0, 1, 1, 1,
0.06461614, 0.5698647, 0.8261504, 1, 0, 0, 1, 1,
0.06633604, -0.9965764, 3.786057, 1, 0, 0, 1, 1,
0.06960198, 0.4560605, 1.486447, 1, 0, 0, 1, 1,
0.07115536, -0.8451114, 3.358373, 1, 0, 0, 1, 1,
0.07220381, 0.1901682, 0.8007564, 1, 0, 0, 1, 1,
0.0736443, -1.413661, 2.994287, 0, 0, 0, 1, 1,
0.0801477, 0.5064783, -0.4392038, 0, 0, 0, 1, 1,
0.08055877, 0.9004729, -2.206651, 0, 0, 0, 1, 1,
0.08246405, -1.708856, 2.774882, 0, 0, 0, 1, 1,
0.08400518, 0.7467278, -0.2307322, 0, 0, 0, 1, 1,
0.08408421, -0.8762809, 3.271497, 0, 0, 0, 1, 1,
0.08643746, 0.8519058, -0.3342055, 0, 0, 0, 1, 1,
0.08662003, 0.1263707, 1.673311, 1, 1, 1, 1, 1,
0.08873294, -0.4793253, 2.599869, 1, 1, 1, 1, 1,
0.09081857, 1.610703, -0.03495062, 1, 1, 1, 1, 1,
0.09171702, 1.657535, -0.009646453, 1, 1, 1, 1, 1,
0.09942395, 1.59785, -0.1574419, 1, 1, 1, 1, 1,
0.09964192, -1.136088, 2.437295, 1, 1, 1, 1, 1,
0.1002233, -1.316823, 2.484049, 1, 1, 1, 1, 1,
0.1030323, -0.02973652, -0.4961341, 1, 1, 1, 1, 1,
0.1036726, -0.7204967, 3.922646, 1, 1, 1, 1, 1,
0.1038175, -0.0814173, 1.406643, 1, 1, 1, 1, 1,
0.1059835, 0.7354731, -2.012578, 1, 1, 1, 1, 1,
0.1082514, 0.7108885, -0.1466659, 1, 1, 1, 1, 1,
0.11599, 1.456997, 0.9633347, 1, 1, 1, 1, 1,
0.1162146, -0.2475583, 3.103031, 1, 1, 1, 1, 1,
0.1180326, 1.401864, 0.8515317, 1, 1, 1, 1, 1,
0.1212042, -1.112939, 3.935749, 0, 0, 1, 1, 1,
0.1223384, 0.2724586, 0.1372621, 1, 0, 0, 1, 1,
0.1293146, -2.110833, 4.02346, 1, 0, 0, 1, 1,
0.1360064, -1.047142, 2.483526, 1, 0, 0, 1, 1,
0.1387356, -1.100564, 3.689071, 1, 0, 0, 1, 1,
0.1426491, -1.360357, 3.04172, 1, 0, 0, 1, 1,
0.1491772, -0.9258301, 1.292284, 0, 0, 0, 1, 1,
0.1498774, 0.3896816, 0.2614653, 0, 0, 0, 1, 1,
0.1552, -0.2988653, 1.837588, 0, 0, 0, 1, 1,
0.1588935, 0.1554682, 0.7416921, 0, 0, 0, 1, 1,
0.1674078, -0.6265396, 2.829576, 0, 0, 0, 1, 1,
0.1690937, -0.3515812, 3.054397, 0, 0, 0, 1, 1,
0.1697508, -0.7486957, 2.828046, 0, 0, 0, 1, 1,
0.1705455, -1.604432, 3.204247, 1, 1, 1, 1, 1,
0.1705672, -1.008532, 2.560814, 1, 1, 1, 1, 1,
0.170893, 0.4693342, 1.148452, 1, 1, 1, 1, 1,
0.1716001, -0.6342435, 2.577061, 1, 1, 1, 1, 1,
0.1724035, -0.04161854, 1.384755, 1, 1, 1, 1, 1,
0.1825939, -0.1706036, 1.854537, 1, 1, 1, 1, 1,
0.183141, -1.550779, 2.293747, 1, 1, 1, 1, 1,
0.183288, 0.3308998, 1.484996, 1, 1, 1, 1, 1,
0.1871583, 0.7107455, -0.3996171, 1, 1, 1, 1, 1,
0.18824, -0.0344794, 2.977932, 1, 1, 1, 1, 1,
0.1889735, -0.8355592, 3.26169, 1, 1, 1, 1, 1,
0.1918469, -2.025478, 4.561848, 1, 1, 1, 1, 1,
0.1918685, -1.009116, 5.043032, 1, 1, 1, 1, 1,
0.1921384, -0.9390905, 2.265114, 1, 1, 1, 1, 1,
0.1929986, 0.7832908, 1.354061, 1, 1, 1, 1, 1,
0.1990999, -0.01222347, 2.472635, 0, 0, 1, 1, 1,
0.2006539, -1.011877, 3.940574, 1, 0, 0, 1, 1,
0.2014073, -1.19031, 3.410135, 1, 0, 0, 1, 1,
0.2159738, -0.3530719, 2.073879, 1, 0, 0, 1, 1,
0.2177341, 0.41255, 1.103853, 1, 0, 0, 1, 1,
0.2201071, -1.203469, 3.387756, 1, 0, 0, 1, 1,
0.221005, -0.5305555, 3.344718, 0, 0, 0, 1, 1,
0.2254298, 0.9731812, 0.9511129, 0, 0, 0, 1, 1,
0.2260019, 0.6593139, 3.627333, 0, 0, 0, 1, 1,
0.2280828, -0.2650731, 3.874389, 0, 0, 0, 1, 1,
0.2347909, 2.050425, 0.7422639, 0, 0, 0, 1, 1,
0.234982, 1.423857, 0.2067203, 0, 0, 0, 1, 1,
0.2418521, 0.4907671, 0.1067379, 0, 0, 0, 1, 1,
0.2419806, 0.4889615, 0.2214175, 1, 1, 1, 1, 1,
0.2426377, -1.766455, 6.14709, 1, 1, 1, 1, 1,
0.2458845, 0.1119366, 1.122422, 1, 1, 1, 1, 1,
0.2464181, -1.4162, 3.264596, 1, 1, 1, 1, 1,
0.2539777, 0.08992926, 2.347418, 1, 1, 1, 1, 1,
0.2650301, -0.1209387, 3.180505, 1, 1, 1, 1, 1,
0.2655322, -0.6405559, 4.606262, 1, 1, 1, 1, 1,
0.2656988, -0.6918435, 3.798825, 1, 1, 1, 1, 1,
0.267585, -1.412696, 4.59727, 1, 1, 1, 1, 1,
0.2686255, -0.02677001, 1.540992, 1, 1, 1, 1, 1,
0.2740585, 1.423709, -0.3637833, 1, 1, 1, 1, 1,
0.2752716, -0.558979, 2.615298, 1, 1, 1, 1, 1,
0.2818538, 0.4552451, 0.3233123, 1, 1, 1, 1, 1,
0.2881074, 0.1777707, 3.815974, 1, 1, 1, 1, 1,
0.2898904, 1.52309, -0.4566881, 1, 1, 1, 1, 1,
0.2918151, 1.492559, 0.5210253, 0, 0, 1, 1, 1,
0.2927696, -0.918749, 1.969049, 1, 0, 0, 1, 1,
0.3132247, -1.079406, 2.243072, 1, 0, 0, 1, 1,
0.3143009, -0.2707898, 2.816585, 1, 0, 0, 1, 1,
0.3244686, -1.025206, 4.053691, 1, 0, 0, 1, 1,
0.3245878, 0.09831213, 2.127882, 1, 0, 0, 1, 1,
0.3252548, -3.013361, 2.154796, 0, 0, 0, 1, 1,
0.3279417, 1.340665, 0.4844853, 0, 0, 0, 1, 1,
0.3301221, 0.4399324, -0.08071981, 0, 0, 0, 1, 1,
0.334704, 0.0175413, 1.547364, 0, 0, 0, 1, 1,
0.3376013, -0.7406502, 2.137134, 0, 0, 0, 1, 1,
0.3384668, -0.9842889, 3.702415, 0, 0, 0, 1, 1,
0.3415532, -0.6198204, 3.043841, 0, 0, 0, 1, 1,
0.3448534, -1.332597, 5.062963, 1, 1, 1, 1, 1,
0.3471493, -1.293012, 2.531807, 1, 1, 1, 1, 1,
0.3474042, 0.0868967, 0.9013447, 1, 1, 1, 1, 1,
0.3483365, -1.459417, 1.828525, 1, 1, 1, 1, 1,
0.349077, -0.5068346, 2.400884, 1, 1, 1, 1, 1,
0.3519028, 1.286277, 0.5756636, 1, 1, 1, 1, 1,
0.3532229, 0.7362763, 1.768014, 1, 1, 1, 1, 1,
0.3534369, -0.4699425, 2.597357, 1, 1, 1, 1, 1,
0.3552726, 1.031481, 0.3735575, 1, 1, 1, 1, 1,
0.3569888, -1.002123, 2.350288, 1, 1, 1, 1, 1,
0.365279, -1.739872, 1.983268, 1, 1, 1, 1, 1,
0.36707, -1.9921, 5.144698, 1, 1, 1, 1, 1,
0.369829, 1.716711, 0.2526852, 1, 1, 1, 1, 1,
0.3711571, 0.5365896, 0.6284077, 1, 1, 1, 1, 1,
0.3721303, -1.012735, 2.509936, 1, 1, 1, 1, 1,
0.3743553, 0.1538887, 2.214612, 0, 0, 1, 1, 1,
0.374678, -1.904987, 3.601867, 1, 0, 0, 1, 1,
0.3758548, 0.5729433, 3.23364, 1, 0, 0, 1, 1,
0.3762624, -0.8604618, 4.266379, 1, 0, 0, 1, 1,
0.3786924, -1.944167, 4.182562, 1, 0, 0, 1, 1,
0.3800506, 1.529377, -0.3596201, 1, 0, 0, 1, 1,
0.3823368, 0.1370022, 1.388811, 0, 0, 0, 1, 1,
0.3897592, -1.367468, 3.128899, 0, 0, 0, 1, 1,
0.4002023, 0.987622, 1.097577, 0, 0, 0, 1, 1,
0.4058867, -0.6790885, 2.59886, 0, 0, 0, 1, 1,
0.4076706, 1.06616, 0.8646185, 0, 0, 0, 1, 1,
0.4115713, -1.249529, 3.104865, 0, 0, 0, 1, 1,
0.4133779, 2.220321, 0.9621245, 0, 0, 0, 1, 1,
0.4231057, 0.02369719, 2.052867, 1, 1, 1, 1, 1,
0.4265266, 0.7519371, 0.8849118, 1, 1, 1, 1, 1,
0.4285523, -1.93101, 2.470665, 1, 1, 1, 1, 1,
0.4298503, 0.3606842, 2.57655, 1, 1, 1, 1, 1,
0.4304238, 1.248556, 1.514027, 1, 1, 1, 1, 1,
0.4331274, 0.2109027, 1.847157, 1, 1, 1, 1, 1,
0.4336204, 0.2778355, 0.2698304, 1, 1, 1, 1, 1,
0.4382443, -0.4080805, 3.366914, 1, 1, 1, 1, 1,
0.4395967, 1.091806, -0.7459324, 1, 1, 1, 1, 1,
0.4404927, -0.2567104, 2.708059, 1, 1, 1, 1, 1,
0.4425842, 1.872485, -0.2501379, 1, 1, 1, 1, 1,
0.4445087, 0.3221429, 0.2738988, 1, 1, 1, 1, 1,
0.4473099, 0.6294885, 0.7062065, 1, 1, 1, 1, 1,
0.4482554, 0.8518325, 0.8858438, 1, 1, 1, 1, 1,
0.4498722, -0.6533185, 2.751942, 1, 1, 1, 1, 1,
0.4531569, 1.180546, 1.213623, 0, 0, 1, 1, 1,
0.4545901, -0.4215119, 3.362931, 1, 0, 0, 1, 1,
0.4559753, -0.1697717, 3.173465, 1, 0, 0, 1, 1,
0.4589064, -0.06692065, 2.472457, 1, 0, 0, 1, 1,
0.4625026, -0.6572458, 2.268793, 1, 0, 0, 1, 1,
0.4627603, 0.3634398, 0.5448062, 1, 0, 0, 1, 1,
0.4646704, 0.8900639, -1.084952, 0, 0, 0, 1, 1,
0.4797578, 1.281904, 1.082774, 0, 0, 0, 1, 1,
0.480817, 0.06045317, 0.4664751, 0, 0, 0, 1, 1,
0.4842872, 0.3552992, 2.893157, 0, 0, 0, 1, 1,
0.4871356, 0.6939359, -0.2200775, 0, 0, 0, 1, 1,
0.487554, 0.9366629, 1.146885, 0, 0, 0, 1, 1,
0.4876463, -2.728741, 3.567091, 0, 0, 0, 1, 1,
0.4883325, 0.3996322, 0.1713903, 1, 1, 1, 1, 1,
0.4914665, 0.2553261, 0.440421, 1, 1, 1, 1, 1,
0.4981779, 1.842669, 0.5169287, 1, 1, 1, 1, 1,
0.4984838, 1.243973, 1.296337, 1, 1, 1, 1, 1,
0.50572, 0.9533738, 2.917085, 1, 1, 1, 1, 1,
0.5062877, -1.031852, 2.202943, 1, 1, 1, 1, 1,
0.5096362, -1.560153, 4.594824, 1, 1, 1, 1, 1,
0.5143036, 0.2271457, -1.222581, 1, 1, 1, 1, 1,
0.5173477, 1.816219, 0.2953792, 1, 1, 1, 1, 1,
0.5183595, 0.279537, -0.5924513, 1, 1, 1, 1, 1,
0.5210202, -0.4299085, 2.89857, 1, 1, 1, 1, 1,
0.5363094, 1.134085, -0.8931516, 1, 1, 1, 1, 1,
0.5367349, 0.2349376, 1.111706, 1, 1, 1, 1, 1,
0.5383987, 1.725749, 1.45078, 1, 1, 1, 1, 1,
0.538949, -0.04510245, 2.924961, 1, 1, 1, 1, 1,
0.5401323, 0.0339589, -1.083369, 0, 0, 1, 1, 1,
0.5426314, 0.9282602, -0.7715982, 1, 0, 0, 1, 1,
0.554629, -1.329232, 2.11704, 1, 0, 0, 1, 1,
0.5546455, -0.8009064, 2.610754, 1, 0, 0, 1, 1,
0.5598039, -2.132492, 1.987022, 1, 0, 0, 1, 1,
0.5634399, -1.736197, 3.82491, 1, 0, 0, 1, 1,
0.572557, -0.3496468, 3.366726, 0, 0, 0, 1, 1,
0.5799955, 0.9145753, 1.247997, 0, 0, 0, 1, 1,
0.5827846, 1.539072, 0.4573225, 0, 0, 0, 1, 1,
0.5836695, 1.166654, 0.9339312, 0, 0, 0, 1, 1,
0.5886825, 0.7134902, 0.06022364, 0, 0, 0, 1, 1,
0.5912434, 0.1883523, 0.1208023, 0, 0, 0, 1, 1,
0.5916234, 0.8422785, -0.08675235, 0, 0, 0, 1, 1,
0.6042465, 1.114022, 0.1190264, 1, 1, 1, 1, 1,
0.6049796, -1.636621, 4.157207, 1, 1, 1, 1, 1,
0.6109679, 0.261694, 0.04014011, 1, 1, 1, 1, 1,
0.6142609, 0.7880961, 2.671893, 1, 1, 1, 1, 1,
0.6166948, 0.1983955, -1.135478, 1, 1, 1, 1, 1,
0.6331537, -0.1650279, 3.19659, 1, 1, 1, 1, 1,
0.6343759, 0.8788639, -0.7851333, 1, 1, 1, 1, 1,
0.64022, -0.9429604, 3.117701, 1, 1, 1, 1, 1,
0.640276, -1.635603, 1.460378, 1, 1, 1, 1, 1,
0.6403206, -1.107066, 3.314154, 1, 1, 1, 1, 1,
0.6503362, 1.236799, 1.521141, 1, 1, 1, 1, 1,
0.6531234, 0.353611, 0.9082583, 1, 1, 1, 1, 1,
0.653384, 0.8493226, 0.635357, 1, 1, 1, 1, 1,
0.6619989, -0.6984228, 1.593715, 1, 1, 1, 1, 1,
0.6713629, -0.09933669, 0.7788379, 1, 1, 1, 1, 1,
0.6725077, -0.1173408, 2.080796, 0, 0, 1, 1, 1,
0.6801367, -1.971201, 2.071242, 1, 0, 0, 1, 1,
0.6802079, -0.5793471, 3.663009, 1, 0, 0, 1, 1,
0.6842906, 0.4042933, 0.116848, 1, 0, 0, 1, 1,
0.6874313, 0.2264387, 2.232064, 1, 0, 0, 1, 1,
0.6910633, 0.3283862, 3.440545, 1, 0, 0, 1, 1,
0.693931, 2.511674, 0.6099892, 0, 0, 0, 1, 1,
0.6941709, -0.8538953, 1.268594, 0, 0, 0, 1, 1,
0.6967744, -0.6351965, 1.370117, 0, 0, 0, 1, 1,
0.6979054, 0.2449241, 3.685274, 0, 0, 0, 1, 1,
0.7013847, 1.773232, 1.092556, 0, 0, 0, 1, 1,
0.7185501, -0.9089599, 1.732378, 0, 0, 0, 1, 1,
0.7231416, 0.7502107, 1.356161, 0, 0, 0, 1, 1,
0.7268938, 0.2514232, 1.292485, 1, 1, 1, 1, 1,
0.7277123, -0.07122608, 2.13358, 1, 1, 1, 1, 1,
0.7278668, -0.2277041, 2.123776, 1, 1, 1, 1, 1,
0.7337106, -1.683403, 3.702854, 1, 1, 1, 1, 1,
0.7415361, -0.02563074, 1.219967, 1, 1, 1, 1, 1,
0.7430786, 1.206633, 0.482444, 1, 1, 1, 1, 1,
0.7463505, -0.9254774, 1.826847, 1, 1, 1, 1, 1,
0.750492, 0.4625985, 1.718837, 1, 1, 1, 1, 1,
0.7597688, 0.4009529, 0.4480294, 1, 1, 1, 1, 1,
0.7616657, -0.3891438, 3.206758, 1, 1, 1, 1, 1,
0.7634653, 0.6188791, -0.4263493, 1, 1, 1, 1, 1,
0.7637343, -0.9457387, 3.439057, 1, 1, 1, 1, 1,
0.763957, -0.06633531, 3.17147, 1, 1, 1, 1, 1,
0.7656749, 0.6895866, -0.06301545, 1, 1, 1, 1, 1,
0.7661708, -0.672359, 2.220258, 1, 1, 1, 1, 1,
0.7690799, -0.8897263, 4.423422, 0, 0, 1, 1, 1,
0.7702387, 0.4322452, 1.311947, 1, 0, 0, 1, 1,
0.7742575, -0.4191096, 1.25545, 1, 0, 0, 1, 1,
0.7831308, -0.4143044, 2.473332, 1, 0, 0, 1, 1,
0.7835368, 0.2151419, 2.4523, 1, 0, 0, 1, 1,
0.7925713, 0.03640467, 1.827235, 1, 0, 0, 1, 1,
0.7995707, 1.624809, -0.3481249, 0, 0, 0, 1, 1,
0.8085743, 0.5081301, 1.106977, 0, 0, 0, 1, 1,
0.8088767, -1.160322, 0.2220942, 0, 0, 0, 1, 1,
0.8108132, -0.2001356, 1.270344, 0, 0, 0, 1, 1,
0.811335, 0.5542791, 2.210755, 0, 0, 0, 1, 1,
0.8133327, -0.711238, 0.1456972, 0, 0, 0, 1, 1,
0.8162106, -1.091504, 1.768203, 0, 0, 0, 1, 1,
0.8162587, 0.334442, 1.500498, 1, 1, 1, 1, 1,
0.8175631, -1.405808, 2.876343, 1, 1, 1, 1, 1,
0.820475, 1.53443, 0.01728048, 1, 1, 1, 1, 1,
0.8212752, -0.3257518, 1.167211, 1, 1, 1, 1, 1,
0.8222677, 0.07196638, 1.820104, 1, 1, 1, 1, 1,
0.8271413, -1.894913, 3.260165, 1, 1, 1, 1, 1,
0.8280401, -0.8230518, 3.395413, 1, 1, 1, 1, 1,
0.8314689, 1.208997, 1.543253, 1, 1, 1, 1, 1,
0.8318346, -0.03718942, 2.015638, 1, 1, 1, 1, 1,
0.8328806, -0.9867947, 2.581241, 1, 1, 1, 1, 1,
0.8357638, 0.7650368, 0.5903912, 1, 1, 1, 1, 1,
0.8363725, 0.7262387, 0.5995241, 1, 1, 1, 1, 1,
0.8390996, 0.6403068, 0.3152623, 1, 1, 1, 1, 1,
0.8520235, 0.4747783, 2.034742, 1, 1, 1, 1, 1,
0.8537934, 1.78673, -0.5062187, 1, 1, 1, 1, 1,
0.8552103, -2.297103, 2.778544, 0, 0, 1, 1, 1,
0.8562832, -0.9418777, 2.471416, 1, 0, 0, 1, 1,
0.8577899, 0.7713489, 0.6444813, 1, 0, 0, 1, 1,
0.8654255, -0.7976915, 2.552751, 1, 0, 0, 1, 1,
0.8672889, -0.4610588, 2.543201, 1, 0, 0, 1, 1,
0.8759782, 1.550764, 0.2910148, 1, 0, 0, 1, 1,
0.8762859, 0.9205113, 0.1022756, 0, 0, 0, 1, 1,
0.8772178, -0.11617, 3.205617, 0, 0, 0, 1, 1,
0.8834936, -0.81819, 1.6682, 0, 0, 0, 1, 1,
0.8851425, -1.05311, 1.575364, 0, 0, 0, 1, 1,
0.887702, 1.247026, 1.240519, 0, 0, 0, 1, 1,
0.8899179, -0.3970675, 1.837296, 0, 0, 0, 1, 1,
0.8912278, 0.4701069, 1.245327, 0, 0, 0, 1, 1,
0.8933533, -0.7886216, 2.422992, 1, 1, 1, 1, 1,
0.89407, 0.9155865, 1.094377, 1, 1, 1, 1, 1,
0.9020752, -0.06368268, 2.06249, 1, 1, 1, 1, 1,
0.9051511, 0.7665958, 1.915854, 1, 1, 1, 1, 1,
0.9109474, 0.4583025, 1.425963, 1, 1, 1, 1, 1,
0.9133222, 0.3993683, 0.3434377, 1, 1, 1, 1, 1,
0.9133678, 1.269526, 0.1710596, 1, 1, 1, 1, 1,
0.9180301, 0.9138671, 2.873577, 1, 1, 1, 1, 1,
0.9185081, 0.0642802, 1.227026, 1, 1, 1, 1, 1,
0.9185765, -1.107507, 2.651201, 1, 1, 1, 1, 1,
0.9255101, 0.1474192, 1.846314, 1, 1, 1, 1, 1,
0.9355797, 0.2045577, 3.125128, 1, 1, 1, 1, 1,
0.9355972, -0.6247671, 2.164183, 1, 1, 1, 1, 1,
0.9398253, -0.7035312, 0.967862, 1, 1, 1, 1, 1,
0.9424826, -0.1846382, 0.6942905, 1, 1, 1, 1, 1,
0.9426649, -0.9538409, 2.538503, 0, 0, 1, 1, 1,
0.9485735, 0.06828653, 2.663126, 1, 0, 0, 1, 1,
0.9570726, -1.179926, 1.086663, 1, 0, 0, 1, 1,
0.9570798, -0.3177788, 3.138956, 1, 0, 0, 1, 1,
0.9647737, -0.2234609, 1.340615, 1, 0, 0, 1, 1,
0.9650601, 0.7537338, 0.1003767, 1, 0, 0, 1, 1,
0.9665599, -1.087567, 1.303328, 0, 0, 0, 1, 1,
0.971709, 0.2020759, 2.301782, 0, 0, 0, 1, 1,
0.9756544, 1.170583, 0.555529, 0, 0, 0, 1, 1,
0.980675, -0.7875378, 1.588052, 0, 0, 0, 1, 1,
0.9883041, -0.9017537, 3.335691, 0, 0, 0, 1, 1,
0.9891639, -0.692693, 2.611869, 0, 0, 0, 1, 1,
0.9910226, 0.003411035, 1.089332, 0, 0, 0, 1, 1,
0.9938375, -0.6395518, 3.143781, 1, 1, 1, 1, 1,
0.9951363, -0.01046819, 0.5486124, 1, 1, 1, 1, 1,
1.005084, -0.1499705, 2.31833, 1, 1, 1, 1, 1,
1.020729, -0.3156034, 3.206812, 1, 1, 1, 1, 1,
1.026953, 0.4917113, 2.028749, 1, 1, 1, 1, 1,
1.038467, 0.5665846, -0.4133545, 1, 1, 1, 1, 1,
1.04546, 0.7038871, 0.7732459, 1, 1, 1, 1, 1,
1.049785, 2.162259, 0.1608438, 1, 1, 1, 1, 1,
1.049991, 3.156088, 0.6490462, 1, 1, 1, 1, 1,
1.050744, 0.298559, 1.036501, 1, 1, 1, 1, 1,
1.05142, -0.6190427, 1.747931, 1, 1, 1, 1, 1,
1.054715, 0.2292332, 1.780534, 1, 1, 1, 1, 1,
1.060012, -1.182492, 0.1191406, 1, 1, 1, 1, 1,
1.062439, 0.2729748, 2.562302, 1, 1, 1, 1, 1,
1.064366, 0.9585446, 0.1333261, 1, 1, 1, 1, 1,
1.065638, -0.1832228, 1.549646, 0, 0, 1, 1, 1,
1.067139, -0.9217033, 1.991437, 1, 0, 0, 1, 1,
1.069172, -0.4188486, 0.3139496, 1, 0, 0, 1, 1,
1.076242, -0.3210023, 0.2098647, 1, 0, 0, 1, 1,
1.083785, 0.5164192, 2.422553, 1, 0, 0, 1, 1,
1.086985, -1.398574, 0.7911221, 1, 0, 0, 1, 1,
1.087738, 0.9514627, -0.341384, 0, 0, 0, 1, 1,
1.089925, -0.6750098, 2.107745, 0, 0, 0, 1, 1,
1.090019, 0.6488889, 0.4353511, 0, 0, 0, 1, 1,
1.091738, 0.5493845, 2.727445, 0, 0, 0, 1, 1,
1.099063, 0.8720423, 0.2794019, 0, 0, 0, 1, 1,
1.102235, 0.6152133, 1.526197, 0, 0, 0, 1, 1,
1.102749, 0.7076738, 1.922737, 0, 0, 0, 1, 1,
1.105728, -0.1333074, 0.2040451, 1, 1, 1, 1, 1,
1.112769, -1.137378, 3.444346, 1, 1, 1, 1, 1,
1.113749, -0.4276085, 3.127756, 1, 1, 1, 1, 1,
1.118405, -0.3354608, 0.7522546, 1, 1, 1, 1, 1,
1.128915, 0.9314648, 1.240057, 1, 1, 1, 1, 1,
1.129801, -1.001192, 2.459229, 1, 1, 1, 1, 1,
1.12982, -0.07582162, 2.440473, 1, 1, 1, 1, 1,
1.134503, -1.78637, 2.984213, 1, 1, 1, 1, 1,
1.140439, -0.7698951, 1.905704, 1, 1, 1, 1, 1,
1.149657, -0.4254407, 2.043005, 1, 1, 1, 1, 1,
1.154197, -1.044243, 0.9249645, 1, 1, 1, 1, 1,
1.156541, -1.235234, 2.55598, 1, 1, 1, 1, 1,
1.159709, 0.1906557, -0.5405702, 1, 1, 1, 1, 1,
1.164301, 1.303918, 1.970014, 1, 1, 1, 1, 1,
1.165558, 0.2852308, 0.9860515, 1, 1, 1, 1, 1,
1.168748, -0.6106533, -0.3205882, 0, 0, 1, 1, 1,
1.169853, -1.118009, 3.23913, 1, 0, 0, 1, 1,
1.170035, 0.3181635, 1.319313, 1, 0, 0, 1, 1,
1.1702, -1.854777, 1.14035, 1, 0, 0, 1, 1,
1.172935, -1.971822, 0.655851, 1, 0, 0, 1, 1,
1.177103, -1.367105, 1.249856, 1, 0, 0, 1, 1,
1.181552, -2.038295, 1.460943, 0, 0, 0, 1, 1,
1.192535, -0.8773161, 3.284876, 0, 0, 0, 1, 1,
1.208298, -0.8289725, 1.331284, 0, 0, 0, 1, 1,
1.214362, -1.092916, 2.624336, 0, 0, 0, 1, 1,
1.217405, -0.2964997, 3.604376, 0, 0, 0, 1, 1,
1.219553, 0.07954749, 1.078032, 0, 0, 0, 1, 1,
1.220837, -0.577788, 2.848889, 0, 0, 0, 1, 1,
1.223866, 0.4850295, 1.945719, 1, 1, 1, 1, 1,
1.231186, 0.08457556, 2.404159, 1, 1, 1, 1, 1,
1.240451, -1.284299, 1.638489, 1, 1, 1, 1, 1,
1.243404, -0.9500718, 1.635886, 1, 1, 1, 1, 1,
1.248304, 2.195131, 0.4629796, 1, 1, 1, 1, 1,
1.25667, 0.2241852, 0.1942896, 1, 1, 1, 1, 1,
1.258999, -0.4556595, 5.149529, 1, 1, 1, 1, 1,
1.264887, -0.9941073, 2.4913, 1, 1, 1, 1, 1,
1.271351, -2.908385, 1.538054, 1, 1, 1, 1, 1,
1.277841, -0.981131, 2.883862, 1, 1, 1, 1, 1,
1.291102, 0.963371, 1.5462, 1, 1, 1, 1, 1,
1.291621, 0.8325611, 0.4398409, 1, 1, 1, 1, 1,
1.309131, 0.8381825, -1.923762, 1, 1, 1, 1, 1,
1.312993, 0.08952044, 1.784719, 1, 1, 1, 1, 1,
1.314761, 0.8996645, 1.773509, 1, 1, 1, 1, 1,
1.322023, 1.009106, 1.09685, 0, 0, 1, 1, 1,
1.324319, 0.09976171, 0.6451802, 1, 0, 0, 1, 1,
1.340506, -0.7096495, 1.948002, 1, 0, 0, 1, 1,
1.342314, -0.9722965, 3.255929, 1, 0, 0, 1, 1,
1.348103, 1.22447, -0.9119564, 1, 0, 0, 1, 1,
1.351872, 0.04965424, 0.7361252, 1, 0, 0, 1, 1,
1.352508, -0.4340805, 1.422254, 0, 0, 0, 1, 1,
1.36167, 0.2834563, 2.600206, 0, 0, 0, 1, 1,
1.379058, 1.434267, 0.896073, 0, 0, 0, 1, 1,
1.383622, -0.9848121, 0.6916369, 0, 0, 0, 1, 1,
1.383631, -1.311654, 1.93793, 0, 0, 0, 1, 1,
1.385213, -0.6216547, 3.157029, 0, 0, 0, 1, 1,
1.388772, -1.739833, 0.9518102, 0, 0, 0, 1, 1,
1.391665, 0.3715777, 1.506115, 1, 1, 1, 1, 1,
1.399486, -0.9062951, 1.881955, 1, 1, 1, 1, 1,
1.407192, 0.2509279, 0.3983907, 1, 1, 1, 1, 1,
1.422001, 0.1630126, 3.958079, 1, 1, 1, 1, 1,
1.42792, 0.4642161, 1.38273, 1, 1, 1, 1, 1,
1.44419, 0.3672536, 0.2867761, 1, 1, 1, 1, 1,
1.447802, 2.203408, 1.913811, 1, 1, 1, 1, 1,
1.448474, -0.4368592, 2.506924, 1, 1, 1, 1, 1,
1.453521, 0.3962377, 2.244985, 1, 1, 1, 1, 1,
1.469841, 0.1892696, 2.835169, 1, 1, 1, 1, 1,
1.47315, 0.8110036, 0.8196458, 1, 1, 1, 1, 1,
1.483245, 0.2177992, 1.302172, 1, 1, 1, 1, 1,
1.484697, 1.715598, -0.02831903, 1, 1, 1, 1, 1,
1.486919, 0.01390935, 1.874784, 1, 1, 1, 1, 1,
1.488016, -2.747046, 1.996606, 1, 1, 1, 1, 1,
1.491334, 0.5226305, 2.028161, 0, 0, 1, 1, 1,
1.495238, -1.725803, 3.078263, 1, 0, 0, 1, 1,
1.517473, -0.1446345, 0.8274618, 1, 0, 0, 1, 1,
1.518063, -0.5572026, 2.557725, 1, 0, 0, 1, 1,
1.518191, -0.4772734, 1.146919, 1, 0, 0, 1, 1,
1.52713, 0.5424326, 3.145164, 1, 0, 0, 1, 1,
1.541399, 1.726482, 0.1956535, 0, 0, 0, 1, 1,
1.543291, -1.476196, 2.621891, 0, 0, 0, 1, 1,
1.55174, 0.6366486, 2.780076, 0, 0, 0, 1, 1,
1.556027, -1.273025, 3.463856, 0, 0, 0, 1, 1,
1.562564, 0.6285439, 0.5592496, 0, 0, 0, 1, 1,
1.579119, -1.211807, 2.360506, 0, 0, 0, 1, 1,
1.583771, 1.404287, 0.08756444, 0, 0, 0, 1, 1,
1.58517, -0.1388399, 0.3590398, 1, 1, 1, 1, 1,
1.594076, -1.695845, 0.9758618, 1, 1, 1, 1, 1,
1.599802, -0.1268453, 2.276637, 1, 1, 1, 1, 1,
1.624402, 1.312627, 1.086768, 1, 1, 1, 1, 1,
1.640196, -0.9365719, 1.427659, 1, 1, 1, 1, 1,
1.649965, -2.21806, 1.73797, 1, 1, 1, 1, 1,
1.651192, -0.5954316, 1.408858, 1, 1, 1, 1, 1,
1.685671, 0.3360775, 0.04684024, 1, 1, 1, 1, 1,
1.696014, -0.8594893, 0.6440685, 1, 1, 1, 1, 1,
1.701764, 0.6687563, 2.050692, 1, 1, 1, 1, 1,
1.711458, 0.3334507, 2.174587, 1, 1, 1, 1, 1,
1.71505, -0.1856802, 1.105435, 1, 1, 1, 1, 1,
1.721909, -1.212457, 1.636885, 1, 1, 1, 1, 1,
1.730495, -1.317464, 1.498744, 1, 1, 1, 1, 1,
1.736654, -1.526112, 2.753837, 1, 1, 1, 1, 1,
1.740742, 1.179446, 1.916306, 0, 0, 1, 1, 1,
1.76088, -1.275587, 1.37523, 1, 0, 0, 1, 1,
1.768645, 1.393809, -0.5986911, 1, 0, 0, 1, 1,
1.770412, -0.5496902, 3.541328, 1, 0, 0, 1, 1,
1.773801, -0.3295595, 2.411389, 1, 0, 0, 1, 1,
1.790658, -0.8003455, 1.23104, 1, 0, 0, 1, 1,
1.792706, 1.642214, 1.416238, 0, 0, 0, 1, 1,
1.81805, 0.192121, -0.4072271, 0, 0, 0, 1, 1,
1.825601, 1.630499, 1.357633, 0, 0, 0, 1, 1,
1.826044, 0.7249713, 2.240688, 0, 0, 0, 1, 1,
1.836967, -1.686843, 1.899961, 0, 0, 0, 1, 1,
1.860611, -1.253093, 2.547203, 0, 0, 0, 1, 1,
1.88653, -0.8064011, 1.632641, 0, 0, 0, 1, 1,
1.915069, 1.482301, 1.443722, 1, 1, 1, 1, 1,
1.922704, -1.37492, 1.709396, 1, 1, 1, 1, 1,
1.926434, -0.5053667, 2.585699, 1, 1, 1, 1, 1,
1.933517, 1.580498, 1.306648, 1, 1, 1, 1, 1,
1.95914, -0.2133989, 1.082872, 1, 1, 1, 1, 1,
1.970291, 1.394921, 1.738664, 1, 1, 1, 1, 1,
1.979866, 1.558036, 1.101921, 1, 1, 1, 1, 1,
1.991585, 0.4580019, 1.976614, 1, 1, 1, 1, 1,
2.001688, -0.5156669, 1.127192, 1, 1, 1, 1, 1,
2.009032, 0.2484044, -0.1476204, 1, 1, 1, 1, 1,
2.015913, 0.4377427, 0.9316607, 1, 1, 1, 1, 1,
2.068165, 1.024099, 0.7976767, 1, 1, 1, 1, 1,
2.072569, -1.148839, 3.240107, 1, 1, 1, 1, 1,
2.083969, 1.234381, 1.805268, 1, 1, 1, 1, 1,
2.115376, 1.281623, 2.208731, 1, 1, 1, 1, 1,
2.119824, -1.086363, 0.5622999, 0, 0, 1, 1, 1,
2.120807, 1.042711, 1.498357, 1, 0, 0, 1, 1,
2.175654, -0.6012946, 3.044959, 1, 0, 0, 1, 1,
2.191844, -1.723121, 2.76628, 1, 0, 0, 1, 1,
2.203451, -1.410202, 3.661895, 1, 0, 0, 1, 1,
2.241068, -0.4845808, 1.836956, 1, 0, 0, 1, 1,
2.259739, -0.8975093, 1.163775, 0, 0, 0, 1, 1,
2.285355, 0.9903512, 0.3909219, 0, 0, 0, 1, 1,
2.285412, 0.0975419, -0.04072135, 0, 0, 0, 1, 1,
2.304139, -0.6344134, 2.512419, 0, 0, 0, 1, 1,
2.317649, 0.4738504, 1.591519, 0, 0, 0, 1, 1,
2.394441, -1.581054, 2.426409, 0, 0, 0, 1, 1,
2.438398, 0.3044852, 0.7542766, 0, 0, 0, 1, 1,
2.48841, -1.011828, 2.140093, 1, 1, 1, 1, 1,
2.507451, -0.5693827, 1.75602, 1, 1, 1, 1, 1,
2.574498, 0.5219589, 1.975925, 1, 1, 1, 1, 1,
2.600291, -0.9308161, 1.598022, 1, 1, 1, 1, 1,
2.749296, 1.81946, 1.946763, 1, 1, 1, 1, 1,
2.839049, -1.023445, 2.067029, 1, 1, 1, 1, 1,
2.904787, 1.319513, 1.293615, 1, 1, 1, 1, 1
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
var radius = 10.02613;
var distance = 35.21635;
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
mvMatrix.translate( 0.1852722, -0.05420065, -0.1098332 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.21635);
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
