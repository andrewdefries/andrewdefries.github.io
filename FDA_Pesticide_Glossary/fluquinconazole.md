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
-3.542063, 0.07751081, -3.040903, 1, 0, 0, 1,
-3.17144, -0.1958982, -3.2897, 1, 0.007843138, 0, 1,
-3.103971, -1.011776, -2.48416, 1, 0.01176471, 0, 1,
-2.838407, -0.08224016, -1.246709, 1, 0.01960784, 0, 1,
-2.828794, 0.2089163, -2.017066, 1, 0.02352941, 0, 1,
-2.640172, -0.1420332, -1.596759, 1, 0.03137255, 0, 1,
-2.593509, -0.8038446, -1.468873, 1, 0.03529412, 0, 1,
-2.484101, -0.5017568, -1.445655, 1, 0.04313726, 0, 1,
-2.45844, -1.377767, -2.767743, 1, 0.04705882, 0, 1,
-2.408162, 0.1120824, -0.5294352, 1, 0.05490196, 0, 1,
-2.250748, 1.372577, -1.270657, 1, 0.05882353, 0, 1,
-2.228081, -1.076572, -0.00332849, 1, 0.06666667, 0, 1,
-2.208343, 1.468025, -1.328238, 1, 0.07058824, 0, 1,
-2.192028, 0.2896298, -3.011425, 1, 0.07843138, 0, 1,
-2.181394, -0.4745353, -1.702621, 1, 0.08235294, 0, 1,
-2.152667, -0.9496591, -0.9653358, 1, 0.09019608, 0, 1,
-2.136347, 1.195228, -1.479038, 1, 0.09411765, 0, 1,
-2.106323, -0.1323633, -1.970887, 1, 0.1019608, 0, 1,
-2.053355, 0.4648667, -2.21806, 1, 0.1098039, 0, 1,
-2.023471, -2.041529, -3.042802, 1, 0.1137255, 0, 1,
-2.007695, -1.123603, -1.930755, 1, 0.1215686, 0, 1,
-2.005959, -1.869539, -1.956201, 1, 0.1254902, 0, 1,
-1.974634, -0.9486813, -1.824849, 1, 0.1333333, 0, 1,
-1.973603, -0.4278436, -2.610563, 1, 0.1372549, 0, 1,
-1.96486, -0.8641393, -1.814029, 1, 0.145098, 0, 1,
-1.954276, 1.323735, -0.2341786, 1, 0.1490196, 0, 1,
-1.936027, 1.218245, -1.242408, 1, 0.1568628, 0, 1,
-1.928711, 0.7314286, -2.424051, 1, 0.1607843, 0, 1,
-1.912653, 0.2153914, -1.467785, 1, 0.1686275, 0, 1,
-1.895703, -0.2268903, -2.285904, 1, 0.172549, 0, 1,
-1.870326, 1.573766, -1.725643, 1, 0.1803922, 0, 1,
-1.863936, -0.1601869, -0.4335063, 1, 0.1843137, 0, 1,
-1.817831, 1.843316, -2.152671, 1, 0.1921569, 0, 1,
-1.804139, 0.7149025, -1.051572, 1, 0.1960784, 0, 1,
-1.793118, 0.3355913, -2.980783, 1, 0.2039216, 0, 1,
-1.78597, 0.3164496, -2.205184, 1, 0.2117647, 0, 1,
-1.780918, 1.400331, -1.046438, 1, 0.2156863, 0, 1,
-1.773856, 0.2193581, 0.08975517, 1, 0.2235294, 0, 1,
-1.772995, 0.03415775, -2.29701, 1, 0.227451, 0, 1,
-1.734369, 0.01730687, -2.571862, 1, 0.2352941, 0, 1,
-1.706875, -1.742539, -2.358896, 1, 0.2392157, 0, 1,
-1.703951, -1.371262, -1.674339, 1, 0.2470588, 0, 1,
-1.684938, -0.2095897, -2.684966, 1, 0.2509804, 0, 1,
-1.667899, 0.4391473, -0.3467804, 1, 0.2588235, 0, 1,
-1.662078, -0.5661163, -3.687505, 1, 0.2627451, 0, 1,
-1.662019, 0.4419545, -2.482183, 1, 0.2705882, 0, 1,
-1.658186, 0.1174428, -1.263399, 1, 0.2745098, 0, 1,
-1.655126, 1.488286, -1.305185, 1, 0.282353, 0, 1,
-1.625997, 0.3151737, -0.672825, 1, 0.2862745, 0, 1,
-1.612882, 0.6332276, -0.9020966, 1, 0.2941177, 0, 1,
-1.604106, -0.1573906, -1.713147, 1, 0.3019608, 0, 1,
-1.59323, -3.261015, -2.50983, 1, 0.3058824, 0, 1,
-1.581189, -0.7066209, -1.215814, 1, 0.3137255, 0, 1,
-1.57813, -0.1126671, -1.017081, 1, 0.3176471, 0, 1,
-1.572715, -0.2480665, -3.292535, 1, 0.3254902, 0, 1,
-1.56475, 1.514989, -0.4323734, 1, 0.3294118, 0, 1,
-1.560423, 0.5936738, -1.189038, 1, 0.3372549, 0, 1,
-1.552508, -0.9228514, -0.7294862, 1, 0.3411765, 0, 1,
-1.539145, 0.1778071, -1.684619, 1, 0.3490196, 0, 1,
-1.529612, 0.5389056, -0.3196014, 1, 0.3529412, 0, 1,
-1.525235, 0.6013389, -2.172776, 1, 0.3607843, 0, 1,
-1.52328, -0.3480335, -1.489151, 1, 0.3647059, 0, 1,
-1.512914, 1.001199, 0.05102352, 1, 0.372549, 0, 1,
-1.494883, 0.4063776, -1.729629, 1, 0.3764706, 0, 1,
-1.486139, 0.6775312, -1.414347, 1, 0.3843137, 0, 1,
-1.481931, -0.1217886, -1.291596, 1, 0.3882353, 0, 1,
-1.466754, -0.2221089, -2.584102, 1, 0.3960784, 0, 1,
-1.458643, -1.2632, -2.609282, 1, 0.4039216, 0, 1,
-1.452101, -0.2201861, -0.6142191, 1, 0.4078431, 0, 1,
-1.450128, 1.357722, -2.18989, 1, 0.4156863, 0, 1,
-1.440575, 0.1710906, -1.763726, 1, 0.4196078, 0, 1,
-1.434289, -1.422879, -2.787531, 1, 0.427451, 0, 1,
-1.412468, -0.5614923, -1.448244, 1, 0.4313726, 0, 1,
-1.411413, -1.377097, -0.6636561, 1, 0.4392157, 0, 1,
-1.408712, 0.1325853, -2.167538, 1, 0.4431373, 0, 1,
-1.401738, -0.6672363, -3.295419, 1, 0.4509804, 0, 1,
-1.401326, 1.251485, -1.09277, 1, 0.454902, 0, 1,
-1.39335, -1.000605, -3.36374, 1, 0.4627451, 0, 1,
-1.392474, -1.347834, -1.645976, 1, 0.4666667, 0, 1,
-1.389558, -0.5660878, -2.558986, 1, 0.4745098, 0, 1,
-1.386565, 0.9812694, 0.5834237, 1, 0.4784314, 0, 1,
-1.384322, -0.6864915, -1.541028, 1, 0.4862745, 0, 1,
-1.382588, 0.02639784, -2.268189, 1, 0.4901961, 0, 1,
-1.382508, -0.1867276, -2.77771, 1, 0.4980392, 0, 1,
-1.38167, 0.9248078, 0.8875613, 1, 0.5058824, 0, 1,
-1.381124, -0.5650227, -2.39635, 1, 0.509804, 0, 1,
-1.381111, 0.4314274, -0.810506, 1, 0.5176471, 0, 1,
-1.37828, -0.05380648, -2.344758, 1, 0.5215687, 0, 1,
-1.358898, 0.5358287, -2.037068, 1, 0.5294118, 0, 1,
-1.349324, -0.9252102, -2.529116, 1, 0.5333334, 0, 1,
-1.341923, 1.019272, -0.1783116, 1, 0.5411765, 0, 1,
-1.331622, 0.5975588, -1.433744, 1, 0.5450981, 0, 1,
-1.327864, 0.2174617, -1.560805, 1, 0.5529412, 0, 1,
-1.321972, -0.5849, -1.924559, 1, 0.5568628, 0, 1,
-1.31851, 1.104739, -1.213151, 1, 0.5647059, 0, 1,
-1.312971, 0.3532473, -2.214368, 1, 0.5686275, 0, 1,
-1.307817, 0.6018505, -1.160323, 1, 0.5764706, 0, 1,
-1.302551, -0.5265028, -1.307756, 1, 0.5803922, 0, 1,
-1.294329, -0.8307179, -3.601459, 1, 0.5882353, 0, 1,
-1.290774, -0.3228198, -1.3569, 1, 0.5921569, 0, 1,
-1.284957, 0.6242871, -3.830118, 1, 0.6, 0, 1,
-1.279088, 0.4471149, -0.5619297, 1, 0.6078432, 0, 1,
-1.278299, 0.6591876, -1.358621, 1, 0.6117647, 0, 1,
-1.278022, -0.08075609, -2.708299, 1, 0.6196079, 0, 1,
-1.277787, 1.401509, -1.089469, 1, 0.6235294, 0, 1,
-1.277431, -0.01107316, -0.8155143, 1, 0.6313726, 0, 1,
-1.275971, -1.780423, -4.005359, 1, 0.6352941, 0, 1,
-1.270411, -1.594276, -2.975864, 1, 0.6431373, 0, 1,
-1.265784, -1.207079, -3.088406, 1, 0.6470588, 0, 1,
-1.263295, -0.1498435, -2.023187, 1, 0.654902, 0, 1,
-1.262531, 0.6493086, -1.758066, 1, 0.6588235, 0, 1,
-1.257276, -2.537347, -2.101249, 1, 0.6666667, 0, 1,
-1.255343, -1.336443, -1.670874, 1, 0.6705883, 0, 1,
-1.241056, 0.3288339, -1.506742, 1, 0.6784314, 0, 1,
-1.239256, 1.69751, -0.6817557, 1, 0.682353, 0, 1,
-1.232075, 1.571796, -1.017603, 1, 0.6901961, 0, 1,
-1.223966, -1.217758, -3.407703, 1, 0.6941177, 0, 1,
-1.209038, -0.3034703, -1.531007, 1, 0.7019608, 0, 1,
-1.18875, 1.648939, -0.6692211, 1, 0.7098039, 0, 1,
-1.186329, 1.608879, -2.047859, 1, 0.7137255, 0, 1,
-1.181666, -2.550763, -3.035808, 1, 0.7215686, 0, 1,
-1.181172, -1.940079, -2.476561, 1, 0.7254902, 0, 1,
-1.174253, -1.464374, -3.469714, 1, 0.7333333, 0, 1,
-1.173286, 0.2466077, -2.181638, 1, 0.7372549, 0, 1,
-1.169366, -0.4863727, -2.415275, 1, 0.7450981, 0, 1,
-1.165999, -0.8716938, -2.466547, 1, 0.7490196, 0, 1,
-1.16129, 0.1179889, -0.7558652, 1, 0.7568628, 0, 1,
-1.160415, 0.8670933, -1.250663, 1, 0.7607843, 0, 1,
-1.159871, -0.2858837, -2.22863, 1, 0.7686275, 0, 1,
-1.158338, -0.4733717, -1.291097, 1, 0.772549, 0, 1,
-1.143986, -0.9835959, -2.79587, 1, 0.7803922, 0, 1,
-1.137293, 0.1046011, -1.774036, 1, 0.7843137, 0, 1,
-1.131902, -1.131336, -2.376367, 1, 0.7921569, 0, 1,
-1.127108, -1.098247, -2.092829, 1, 0.7960784, 0, 1,
-1.120354, -0.7420946, -1.118755, 1, 0.8039216, 0, 1,
-1.116854, 0.2772862, -2.092246, 1, 0.8117647, 0, 1,
-1.112225, 0.5811693, -0.7881233, 1, 0.8156863, 0, 1,
-1.11202, 0.3007055, -1.615685, 1, 0.8235294, 0, 1,
-1.106252, -0.3719725, -1.540465, 1, 0.827451, 0, 1,
-1.1053, -0.2199716, -1.395834, 1, 0.8352941, 0, 1,
-1.105186, 0.1757385, -2.10652, 1, 0.8392157, 0, 1,
-1.098009, 1.730669, -0.1970465, 1, 0.8470588, 0, 1,
-1.092884, -0.6506676, -0.3347236, 1, 0.8509804, 0, 1,
-1.089787, 1.705538, -0.3217426, 1, 0.8588235, 0, 1,
-1.070715, 0.9171031, -0.9091759, 1, 0.8627451, 0, 1,
-1.069809, 0.7720971, 1.139406, 1, 0.8705882, 0, 1,
-1.066465, -0.9006519, -1.717969, 1, 0.8745098, 0, 1,
-1.066421, -0.7657982, -0.5103719, 1, 0.8823529, 0, 1,
-1.062782, 1.237554, -1.806184, 1, 0.8862745, 0, 1,
-1.059756, 0.2384274, -1.646911, 1, 0.8941177, 0, 1,
-1.058801, 0.1190369, -2.075873, 1, 0.8980392, 0, 1,
-1.058754, -1.016093, -3.252378, 1, 0.9058824, 0, 1,
-1.055075, 0.340728, -1.492518, 1, 0.9137255, 0, 1,
-1.047324, 1.352334, -0.8529618, 1, 0.9176471, 0, 1,
-1.033423, 1.150889, 0.5485777, 1, 0.9254902, 0, 1,
-1.028924, 1.458318, 0.4207395, 1, 0.9294118, 0, 1,
-1.02588, 0.2292211, -0.2967331, 1, 0.9372549, 0, 1,
-1.022497, 0.2778619, -1.77317, 1, 0.9411765, 0, 1,
-1.022109, -1.269975, -1.961703, 1, 0.9490196, 0, 1,
-1.007884, -0.1312128, -1.715384, 1, 0.9529412, 0, 1,
-1.006967, 0.5662031, -1.587399, 1, 0.9607843, 0, 1,
-0.9950542, -0.8095449, -1.235451, 1, 0.9647059, 0, 1,
-0.994219, 0.718552, -1.426424, 1, 0.972549, 0, 1,
-0.9926092, -0.09275991, 0.3407403, 1, 0.9764706, 0, 1,
-0.9916584, -2.092638, -3.008641, 1, 0.9843137, 0, 1,
-0.985451, 1.238114, -0.3098879, 1, 0.9882353, 0, 1,
-0.982421, 1.050535, -2.657895, 1, 0.9960784, 0, 1,
-0.9819689, 0.2546282, -0.333183, 0.9960784, 1, 0, 1,
-0.9799274, 0.6550924, -2.695474, 0.9921569, 1, 0, 1,
-0.9750507, 0.5353384, -0.3182406, 0.9843137, 1, 0, 1,
-0.9738156, 0.6310629, 0.7679783, 0.9803922, 1, 0, 1,
-0.9675056, -0.1698105, -0.2776189, 0.972549, 1, 0, 1,
-0.963375, 1.268301, -1.373003, 0.9686275, 1, 0, 1,
-0.9629923, 2.300625, -1.243968, 0.9607843, 1, 0, 1,
-0.9558366, -1.420829, -2.646482, 0.9568627, 1, 0, 1,
-0.9507294, -1.434874, -2.618349, 0.9490196, 1, 0, 1,
-0.9341918, 0.9349861, 0.7619607, 0.945098, 1, 0, 1,
-0.933781, 0.916796, -0.7145824, 0.9372549, 1, 0, 1,
-0.924939, -0.619559, -3.360341, 0.9333333, 1, 0, 1,
-0.9006574, -0.382683, -3.808917, 0.9254902, 1, 0, 1,
-0.8977938, 0.1243327, -2.162449, 0.9215686, 1, 0, 1,
-0.8773541, -0.7700405, -1.508589, 0.9137255, 1, 0, 1,
-0.875808, -0.2447039, -3.065778, 0.9098039, 1, 0, 1,
-0.8710414, -0.1447536, -2.457533, 0.9019608, 1, 0, 1,
-0.8542902, -1.117798, -1.613054, 0.8941177, 1, 0, 1,
-0.8515472, -0.8628955, -2.959737, 0.8901961, 1, 0, 1,
-0.8437677, 0.6492709, 0.09054974, 0.8823529, 1, 0, 1,
-0.8434994, 0.6583853, -1.28415, 0.8784314, 1, 0, 1,
-0.8429693, 1.266412, -0.259713, 0.8705882, 1, 0, 1,
-0.8403322, 1.005347, -0.1380741, 0.8666667, 1, 0, 1,
-0.8401415, -0.85614, -0.4974615, 0.8588235, 1, 0, 1,
-0.8361166, -0.552479, -2.640013, 0.854902, 1, 0, 1,
-0.8335909, 0.7306546, -0.6689127, 0.8470588, 1, 0, 1,
-0.8330828, -0.03409988, -1.539757, 0.8431373, 1, 0, 1,
-0.832416, 0.4339947, 0.6109365, 0.8352941, 1, 0, 1,
-0.8186118, 0.560472, 0.4025825, 0.8313726, 1, 0, 1,
-0.8136687, 1.071919, -2.009392, 0.8235294, 1, 0, 1,
-0.8121513, -1.526571, -3.020269, 0.8196079, 1, 0, 1,
-0.8106715, -0.4313895, -0.6761243, 0.8117647, 1, 0, 1,
-0.8075841, -0.3019564, -3.045923, 0.8078431, 1, 0, 1,
-0.8069209, 0.05403513, -0.2896946, 0.8, 1, 0, 1,
-0.7889102, 0.2979224, -0.8076594, 0.7921569, 1, 0, 1,
-0.784599, 0.4550459, -0.793801, 0.7882353, 1, 0, 1,
-0.7837799, 1.164361, -0.444425, 0.7803922, 1, 0, 1,
-0.7788013, 0.3601044, -1.558972, 0.7764706, 1, 0, 1,
-0.7776209, -1.869927, -1.464236, 0.7686275, 1, 0, 1,
-0.7706221, -0.3600382, -0.6105831, 0.7647059, 1, 0, 1,
-0.7700946, -0.481077, -2.118173, 0.7568628, 1, 0, 1,
-0.7685289, -0.4904876, -3.007977, 0.7529412, 1, 0, 1,
-0.768249, -0.1411014, -0.7297226, 0.7450981, 1, 0, 1,
-0.7675142, 0.08654124, -1.78041, 0.7411765, 1, 0, 1,
-0.7667485, 0.06922131, -2.124742, 0.7333333, 1, 0, 1,
-0.764628, -0.5953987, -2.261934, 0.7294118, 1, 0, 1,
-0.763648, 0.4401771, -1.94399, 0.7215686, 1, 0, 1,
-0.7574975, 0.1209063, -0.3381149, 0.7176471, 1, 0, 1,
-0.7500558, -0.0260235, -1.971578, 0.7098039, 1, 0, 1,
-0.7468368, 0.009674471, -2.288186, 0.7058824, 1, 0, 1,
-0.7403316, 0.4596769, -0.5297412, 0.6980392, 1, 0, 1,
-0.7342755, -1.96463, -3.493838, 0.6901961, 1, 0, 1,
-0.731694, -0.04543229, -0.4721543, 0.6862745, 1, 0, 1,
-0.7310964, 0.2706172, -1.396572, 0.6784314, 1, 0, 1,
-0.729448, 0.3242249, -2.6942, 0.6745098, 1, 0, 1,
-0.7240834, 1.294719, -2.188854, 0.6666667, 1, 0, 1,
-0.7238318, -0.3272579, -1.625494, 0.6627451, 1, 0, 1,
-0.7205672, 0.01237349, -0.993197, 0.654902, 1, 0, 1,
-0.715973, 0.1774105, -1.211215, 0.6509804, 1, 0, 1,
-0.7104586, -2.054315, -2.369187, 0.6431373, 1, 0, 1,
-0.7014319, 1.144545, 2.074629, 0.6392157, 1, 0, 1,
-0.6969849, -1.080366, -2.294308, 0.6313726, 1, 0, 1,
-0.6943969, 0.1568746, -1.447821, 0.627451, 1, 0, 1,
-0.6887131, -0.05919289, 0.08121931, 0.6196079, 1, 0, 1,
-0.6861822, -0.2443944, -0.8835185, 0.6156863, 1, 0, 1,
-0.6853349, 0.009044924, -2.506704, 0.6078432, 1, 0, 1,
-0.6757978, -0.3758876, -0.596017, 0.6039216, 1, 0, 1,
-0.6676305, -0.1103923, -3.109682, 0.5960785, 1, 0, 1,
-0.6676071, 0.05379229, -2.526207, 0.5882353, 1, 0, 1,
-0.6615227, -1.463968, -2.868424, 0.5843138, 1, 0, 1,
-0.6554673, -1.064832, -1.169755, 0.5764706, 1, 0, 1,
-0.6489161, 0.9529332, 0.7768587, 0.572549, 1, 0, 1,
-0.6486636, 1.478131, 1.012242, 0.5647059, 1, 0, 1,
-0.6412414, -2.409661, -2.490362, 0.5607843, 1, 0, 1,
-0.6399575, 0.8630316, -0.7857713, 0.5529412, 1, 0, 1,
-0.6390345, 0.8761776, -1.742017, 0.5490196, 1, 0, 1,
-0.6327863, 0.407893, 1.012413, 0.5411765, 1, 0, 1,
-0.6326156, 1.107508, -0.3681372, 0.5372549, 1, 0, 1,
-0.6292185, -0.4029227, -0.2940615, 0.5294118, 1, 0, 1,
-0.6195169, -0.4729272, -4.66193, 0.5254902, 1, 0, 1,
-0.6192309, 0.4361885, 0.02332029, 0.5176471, 1, 0, 1,
-0.6077037, -1.863262, -3.721516, 0.5137255, 1, 0, 1,
-0.5947899, -1.613214, -2.526355, 0.5058824, 1, 0, 1,
-0.5927365, 0.5740786, 0.4901114, 0.5019608, 1, 0, 1,
-0.5876178, 0.6851457, -1.810906, 0.4941176, 1, 0, 1,
-0.5873975, 0.1215118, -3.215088, 0.4862745, 1, 0, 1,
-0.5812292, 0.7882411, 0.6654703, 0.4823529, 1, 0, 1,
-0.5771108, 0.1150797, -3.579369, 0.4745098, 1, 0, 1,
-0.5768066, -0.5221441, -3.44119, 0.4705882, 1, 0, 1,
-0.5676542, 0.05068316, -0.06498056, 0.4627451, 1, 0, 1,
-0.5675444, -0.226271, -2.751528, 0.4588235, 1, 0, 1,
-0.5670664, -0.875719, -1.464811, 0.4509804, 1, 0, 1,
-0.5656529, 0.1888765, -2.435105, 0.4470588, 1, 0, 1,
-0.5596157, 0.5353342, 0.7388864, 0.4392157, 1, 0, 1,
-0.5588549, -0.005952623, -0.6920232, 0.4352941, 1, 0, 1,
-0.5584027, 0.5458662, 0.6723142, 0.427451, 1, 0, 1,
-0.5578788, 0.1337525, -0.8854074, 0.4235294, 1, 0, 1,
-0.5573883, 0.2475751, 2.148502, 0.4156863, 1, 0, 1,
-0.5567792, 0.3328468, -1.375947, 0.4117647, 1, 0, 1,
-0.554084, -0.6821221, -3.450214, 0.4039216, 1, 0, 1,
-0.553459, -0.6956838, -2.011718, 0.3960784, 1, 0, 1,
-0.5523605, 1.536732, -0.51021, 0.3921569, 1, 0, 1,
-0.5521111, -0.6135412, -2.373405, 0.3843137, 1, 0, 1,
-0.5488654, -0.57415, -0.9977032, 0.3803922, 1, 0, 1,
-0.5461201, 0.3186024, -0.6263248, 0.372549, 1, 0, 1,
-0.5398535, 1.126181, -0.4429483, 0.3686275, 1, 0, 1,
-0.5391838, 0.5735358, -0.5578936, 0.3607843, 1, 0, 1,
-0.5347228, -0.6534165, -3.314111, 0.3568628, 1, 0, 1,
-0.5322171, -0.3772599, -2.40617, 0.3490196, 1, 0, 1,
-0.5309533, 0.3826538, -0.5913778, 0.345098, 1, 0, 1,
-0.5294679, -0.3778033, -2.207555, 0.3372549, 1, 0, 1,
-0.5274631, 1.361289, -0.09323113, 0.3333333, 1, 0, 1,
-0.5273442, 0.07801106, -2.331539, 0.3254902, 1, 0, 1,
-0.5253467, -0.6321984, -2.432733, 0.3215686, 1, 0, 1,
-0.5244362, -0.1350991, -1.213887, 0.3137255, 1, 0, 1,
-0.5235231, -1.036186, -2.96548, 0.3098039, 1, 0, 1,
-0.5221374, -0.7827289, -2.352011, 0.3019608, 1, 0, 1,
-0.5183596, 0.3693409, -0.6196786, 0.2941177, 1, 0, 1,
-0.5122936, -0.1439728, -2.776033, 0.2901961, 1, 0, 1,
-0.5116628, 0.03682715, -1.666308, 0.282353, 1, 0, 1,
-0.5009735, -0.02084153, -1.661554, 0.2784314, 1, 0, 1,
-0.4994839, -2.253972, -2.649666, 0.2705882, 1, 0, 1,
-0.4977343, 0.3447675, -1.228517, 0.2666667, 1, 0, 1,
-0.4968855, -1.422478, -4.774634, 0.2588235, 1, 0, 1,
-0.4895417, -0.3544951, -2.655981, 0.254902, 1, 0, 1,
-0.4830563, -0.4522121, -1.380079, 0.2470588, 1, 0, 1,
-0.481262, -1.133586, -1.414506, 0.2431373, 1, 0, 1,
-0.4799002, -0.4895132, -2.151768, 0.2352941, 1, 0, 1,
-0.4791632, 1.64523, -1.37229, 0.2313726, 1, 0, 1,
-0.4647516, -0.6854617, -2.711962, 0.2235294, 1, 0, 1,
-0.4596282, 0.6587889, -0.6806803, 0.2196078, 1, 0, 1,
-0.4589881, 1.171543, -0.8322474, 0.2117647, 1, 0, 1,
-0.4582656, 0.6495964, 0.7361022, 0.2078431, 1, 0, 1,
-0.4582285, 1.211831, -0.7380332, 0.2, 1, 0, 1,
-0.4546647, -0.7132352, -4.262187, 0.1921569, 1, 0, 1,
-0.4507904, -1.302524, -3.94575, 0.1882353, 1, 0, 1,
-0.4495992, 0.6376023, -0.1395836, 0.1803922, 1, 0, 1,
-0.4465393, 0.01778104, -0.8204656, 0.1764706, 1, 0, 1,
-0.4440303, 0.431478, -2.437684, 0.1686275, 1, 0, 1,
-0.436585, -0.7670606, -1.307815, 0.1647059, 1, 0, 1,
-0.431852, -0.1284049, -1.249163, 0.1568628, 1, 0, 1,
-0.429004, 0.7796668, -1.14634, 0.1529412, 1, 0, 1,
-0.428906, 0.8713484, 1.647326, 0.145098, 1, 0, 1,
-0.4281121, 0.8240031, -0.7003644, 0.1411765, 1, 0, 1,
-0.4277711, 0.5026284, -0.2717386, 0.1333333, 1, 0, 1,
-0.4263477, -0.04190559, -0.6016253, 0.1294118, 1, 0, 1,
-0.424245, 1.008717, 0.4362388, 0.1215686, 1, 0, 1,
-0.4242168, -0.1799959, -0.4857187, 0.1176471, 1, 0, 1,
-0.4209154, -0.006164669, -1.535334, 0.1098039, 1, 0, 1,
-0.4169212, -0.3987391, -0.3667196, 0.1058824, 1, 0, 1,
-0.4142671, -0.2650767, -1.679648, 0.09803922, 1, 0, 1,
-0.4134071, 1.319445, -1.016939, 0.09019608, 1, 0, 1,
-0.4099768, -0.9825436, -0.5097723, 0.08627451, 1, 0, 1,
-0.4064353, 1.629101, 0.3565074, 0.07843138, 1, 0, 1,
-0.4053882, -0.3162856, -1.08322, 0.07450981, 1, 0, 1,
-0.4023711, -0.5581349, -1.661436, 0.06666667, 1, 0, 1,
-0.3983141, 0.01882165, -1.275127, 0.0627451, 1, 0, 1,
-0.3974773, 0.05070159, -1.779723, 0.05490196, 1, 0, 1,
-0.3906496, 1.300659, -0.2005616, 0.05098039, 1, 0, 1,
-0.38085, 0.3391446, -0.04429282, 0.04313726, 1, 0, 1,
-0.3807448, 0.9990377, -1.815301, 0.03921569, 1, 0, 1,
-0.3804687, 0.2771998, 0.8818764, 0.03137255, 1, 0, 1,
-0.3795846, 0.2455257, -1.714536, 0.02745098, 1, 0, 1,
-0.3753015, 0.2590879, 1.217822, 0.01960784, 1, 0, 1,
-0.3710265, -0.3103181, -2.491012, 0.01568628, 1, 0, 1,
-0.357418, 0.142634, -1.007568, 0.007843138, 1, 0, 1,
-0.3540238, -0.2740888, -0.6928662, 0.003921569, 1, 0, 1,
-0.3479668, -0.6286983, -3.402399, 0, 1, 0.003921569, 1,
-0.3478758, 0.4384197, 0.1751237, 0, 1, 0.01176471, 1,
-0.3474081, -0.8167704, -2.777599, 0, 1, 0.01568628, 1,
-0.3398961, -0.4117886, -1.289252, 0, 1, 0.02352941, 1,
-0.3318671, -1.102676, -2.496207, 0, 1, 0.02745098, 1,
-0.3230743, 0.9576326, -1.879555, 0, 1, 0.03529412, 1,
-0.32139, -1.584312, -4.814261, 0, 1, 0.03921569, 1,
-0.3182454, 1.569365, -0.4231755, 0, 1, 0.04705882, 1,
-0.3180838, -0.236737, -1.335536, 0, 1, 0.05098039, 1,
-0.3174262, -0.651982, -2.588352, 0, 1, 0.05882353, 1,
-0.3148022, -0.5558857, -1.782204, 0, 1, 0.0627451, 1,
-0.3113047, -0.1585694, -2.364803, 0, 1, 0.07058824, 1,
-0.3075291, 2.492557, -1.045604, 0, 1, 0.07450981, 1,
-0.3066656, -0.6922365, -2.057527, 0, 1, 0.08235294, 1,
-0.3064439, -0.3841794, -3.106801, 0, 1, 0.08627451, 1,
-0.3047563, 0.5238848, 0.2513368, 0, 1, 0.09411765, 1,
-0.3026147, -0.5791795, -2.128106, 0, 1, 0.1019608, 1,
-0.2983982, -0.1132161, -0.3674378, 0, 1, 0.1058824, 1,
-0.296574, 1.522169, 0.6018555, 0, 1, 0.1137255, 1,
-0.2931311, 0.6645712, -0.2739466, 0, 1, 0.1176471, 1,
-0.289945, 0.03853147, -0.8247246, 0, 1, 0.1254902, 1,
-0.2882837, -0.5422606, -2.308058, 0, 1, 0.1294118, 1,
-0.284719, -0.3388358, -4.023194, 0, 1, 0.1372549, 1,
-0.282421, 0.162936, -2.935855, 0, 1, 0.1411765, 1,
-0.2814191, 0.6502818, -1.56731, 0, 1, 0.1490196, 1,
-0.2794003, 0.4730279, -1.401997, 0, 1, 0.1529412, 1,
-0.2770197, -2.601089, -1.442747, 0, 1, 0.1607843, 1,
-0.274589, -1.142295, -4.489801, 0, 1, 0.1647059, 1,
-0.2738721, 1.471579, -0.5749519, 0, 1, 0.172549, 1,
-0.2730206, -0.1859758, -2.11716, 0, 1, 0.1764706, 1,
-0.2705463, -0.4064539, -1.815237, 0, 1, 0.1843137, 1,
-0.2703165, 0.02870393, -1.899283, 0, 1, 0.1882353, 1,
-0.2701711, -0.134536, -1.373722, 0, 1, 0.1960784, 1,
-0.2696933, 1.063696, 0.3869115, 0, 1, 0.2039216, 1,
-0.2663615, -0.3171878, -1.538734, 0, 1, 0.2078431, 1,
-0.2639606, 0.8766048, 0.2635281, 0, 1, 0.2156863, 1,
-0.2635215, 0.1259037, -0.6586875, 0, 1, 0.2196078, 1,
-0.2632898, -0.7152752, -3.938323, 0, 1, 0.227451, 1,
-0.2613028, 0.8576512, -2.68745, 0, 1, 0.2313726, 1,
-0.2485443, -0.3383768, -1.818739, 0, 1, 0.2392157, 1,
-0.244645, 1.1208, -1.467871, 0, 1, 0.2431373, 1,
-0.2431875, 0.8877133, 0.7891971, 0, 1, 0.2509804, 1,
-0.2424728, -1.682203, -3.077602, 0, 1, 0.254902, 1,
-0.2416456, -0.7593333, -1.159123, 0, 1, 0.2627451, 1,
-0.2401467, -0.1177031, -1.412136, 0, 1, 0.2666667, 1,
-0.2382684, -0.8830997, -1.369166, 0, 1, 0.2745098, 1,
-0.2380062, 0.6437441, -1.179834, 0, 1, 0.2784314, 1,
-0.2341967, -0.6516197, -1.30493, 0, 1, 0.2862745, 1,
-0.2324544, -1.253129, -3.357261, 0, 1, 0.2901961, 1,
-0.230163, 0.7412988, -0.8994127, 0, 1, 0.2980392, 1,
-0.2281299, 1.31897, -0.4589155, 0, 1, 0.3058824, 1,
-0.2268416, -0.8357484, -1.77415, 0, 1, 0.3098039, 1,
-0.2260803, -0.2525738, -3.299935, 0, 1, 0.3176471, 1,
-0.2198222, -0.9748933, -1.725592, 0, 1, 0.3215686, 1,
-0.2166478, 0.3867117, 0.1802172, 0, 1, 0.3294118, 1,
-0.2143675, -0.5192108, -2.081644, 0, 1, 0.3333333, 1,
-0.2061869, -0.7024788, -3.669832, 0, 1, 0.3411765, 1,
-0.2056122, 1.399359, -0.7336944, 0, 1, 0.345098, 1,
-0.2031154, -0.9027719, -1.969347, 0, 1, 0.3529412, 1,
-0.1992702, -2.545783, -3.18884, 0, 1, 0.3568628, 1,
-0.1983797, -0.1839565, -2.698952, 0, 1, 0.3647059, 1,
-0.196726, -0.4113113, -3.006876, 0, 1, 0.3686275, 1,
-0.1961933, -0.07374879, -4.023222, 0, 1, 0.3764706, 1,
-0.1950297, -0.8538573, -3.664693, 0, 1, 0.3803922, 1,
-0.1915697, 1.286148, -0.5259233, 0, 1, 0.3882353, 1,
-0.1910901, 0.5794414, -0.3026112, 0, 1, 0.3921569, 1,
-0.1890523, -2.71753, -4.710258, 0, 1, 0.4, 1,
-0.1843675, -1.948152, -3.137396, 0, 1, 0.4078431, 1,
-0.1818714, 2.25129, 0.6196591, 0, 1, 0.4117647, 1,
-0.1801983, 0.7488977, 0.5632954, 0, 1, 0.4196078, 1,
-0.178457, 0.1037351, -3.248511, 0, 1, 0.4235294, 1,
-0.178336, -0.02798635, -3.676532, 0, 1, 0.4313726, 1,
-0.1768274, 0.02785978, -1.295112, 0, 1, 0.4352941, 1,
-0.172077, -1.186225, -2.649239, 0, 1, 0.4431373, 1,
-0.1693073, 0.7095178, 1.57928, 0, 1, 0.4470588, 1,
-0.1668414, 1.11343, -1.276562, 0, 1, 0.454902, 1,
-0.1622034, -0.6192912, -3.676129, 0, 1, 0.4588235, 1,
-0.1610903, -0.9148494, -2.894787, 0, 1, 0.4666667, 1,
-0.1610783, 1.029154, -0.3964589, 0, 1, 0.4705882, 1,
-0.1605609, -1.275944, -2.449394, 0, 1, 0.4784314, 1,
-0.1596088, -0.5215435, -2.682724, 0, 1, 0.4823529, 1,
-0.154506, 0.002718885, -2.891916, 0, 1, 0.4901961, 1,
-0.1544713, 0.2273783, -1.206531, 0, 1, 0.4941176, 1,
-0.1537814, 0.2344666, -0.3949835, 0, 1, 0.5019608, 1,
-0.1536752, 0.08910917, -0.7053444, 0, 1, 0.509804, 1,
-0.1525906, -0.7020231, -2.471044, 0, 1, 0.5137255, 1,
-0.1508071, 0.1249589, 1.073721, 0, 1, 0.5215687, 1,
-0.1506805, -0.7895606, -2.977725, 0, 1, 0.5254902, 1,
-0.1488192, 0.05228973, -0.4434552, 0, 1, 0.5333334, 1,
-0.148128, -1.974968, -1.631022, 0, 1, 0.5372549, 1,
-0.1439131, -0.2811161, -3.154866, 0, 1, 0.5450981, 1,
-0.1427209, -0.2037621, -2.644768, 0, 1, 0.5490196, 1,
-0.1427177, 0.3661291, 0.7769656, 0, 1, 0.5568628, 1,
-0.1355523, -0.494686, -3.084479, 0, 1, 0.5607843, 1,
-0.1339705, -0.1208678, -4.582655, 0, 1, 0.5686275, 1,
-0.1328073, -1.123515, -3.228053, 0, 1, 0.572549, 1,
-0.1307084, -1.669858, -3.752294, 0, 1, 0.5803922, 1,
-0.1271334, -1.461952, -1.509998, 0, 1, 0.5843138, 1,
-0.1245296, -0.5337986, -3.479057, 0, 1, 0.5921569, 1,
-0.1210269, -1.066224, -4.120309, 0, 1, 0.5960785, 1,
-0.1208473, -0.530059, -2.415983, 0, 1, 0.6039216, 1,
-0.1172729, -0.1057617, -0.478521, 0, 1, 0.6117647, 1,
-0.1160106, -0.6813716, -1.811825, 0, 1, 0.6156863, 1,
-0.1144197, -0.6272148, -3.526595, 0, 1, 0.6235294, 1,
-0.1140486, 0.8389099, 0.8735155, 0, 1, 0.627451, 1,
-0.1138329, 0.2017953, -1.021354, 0, 1, 0.6352941, 1,
-0.1125661, 0.02251185, -1.711766, 0, 1, 0.6392157, 1,
-0.1118327, -0.1295948, -1.982623, 0, 1, 0.6470588, 1,
-0.1054149, 0.5659516, 0.6052408, 0, 1, 0.6509804, 1,
-0.09781475, 0.4777719, 0.3581238, 0, 1, 0.6588235, 1,
-0.09625757, 0.8897298, 0.08406521, 0, 1, 0.6627451, 1,
-0.09301993, 0.3232568, -0.3987238, 0, 1, 0.6705883, 1,
-0.09059279, -0.2362206, -1.614704, 0, 1, 0.6745098, 1,
-0.09018185, 0.3687669, -0.3411807, 0, 1, 0.682353, 1,
-0.0850257, 0.285964, -0.4686332, 0, 1, 0.6862745, 1,
-0.08246373, -0.31273, -3.553466, 0, 1, 0.6941177, 1,
-0.08222403, -1.052697, -3.325337, 0, 1, 0.7019608, 1,
-0.0800238, -0.6157943, -2.555935, 0, 1, 0.7058824, 1,
-0.07957163, 1.51198, 0.2042423, 0, 1, 0.7137255, 1,
-0.07828145, 0.4040251, 0.9527357, 0, 1, 0.7176471, 1,
-0.07678942, -1.624741, -4.653699, 0, 1, 0.7254902, 1,
-0.07676256, 0.7121347, -1.062793, 0, 1, 0.7294118, 1,
-0.07459657, 1.289738, 0.8237168, 0, 1, 0.7372549, 1,
-0.07177453, -0.28016, -3.432969, 0, 1, 0.7411765, 1,
-0.0704121, 0.4746746, -1.474135, 0, 1, 0.7490196, 1,
-0.06853174, -0.2235803, -2.350888, 0, 1, 0.7529412, 1,
-0.06662184, 0.2686602, -0.6192831, 0, 1, 0.7607843, 1,
-0.06660639, -0.06421996, -1.490396, 0, 1, 0.7647059, 1,
-0.06619053, -0.2742482, -3.736854, 0, 1, 0.772549, 1,
-0.06576484, -1.312081, -2.687625, 0, 1, 0.7764706, 1,
-0.05999576, 0.9040164, 0.1228124, 0, 1, 0.7843137, 1,
-0.05855494, 0.9473062, 0.7428971, 0, 1, 0.7882353, 1,
-0.05490228, 0.2600016, 0.2273763, 0, 1, 0.7960784, 1,
-0.05248363, 1.68769, 1.584524, 0, 1, 0.8039216, 1,
-0.05179693, 0.3896336, -1.819837, 0, 1, 0.8078431, 1,
-0.04590862, 0.4243113, -0.8935096, 0, 1, 0.8156863, 1,
-0.03819606, -0.9786481, -3.267463, 0, 1, 0.8196079, 1,
-0.03613214, 1.180503, -1.41578, 0, 1, 0.827451, 1,
-0.03147636, -0.8489129, -3.98452, 0, 1, 0.8313726, 1,
-0.0309331, 0.8550879, 1.728392, 0, 1, 0.8392157, 1,
-0.03054951, 1.280509, -0.8453798, 0, 1, 0.8431373, 1,
-0.02995405, -1.62472, -2.780707, 0, 1, 0.8509804, 1,
-0.02091198, -0.4351006, -3.344639, 0, 1, 0.854902, 1,
-0.02040113, 1.825092, 0.4135204, 0, 1, 0.8627451, 1,
-0.01898044, 0.3940786, -1.204216, 0, 1, 0.8666667, 1,
-0.01757797, -1.488627, -2.643434, 0, 1, 0.8745098, 1,
-0.01728792, -0.4530305, -3.550439, 0, 1, 0.8784314, 1,
-0.01573902, -1.388449, -2.767556, 0, 1, 0.8862745, 1,
-0.01436065, 1.031273, 0.7737684, 0, 1, 0.8901961, 1,
-0.01400173, -2.239538, -2.765676, 0, 1, 0.8980392, 1,
-0.01346437, 0.4738726, -0.552173, 0, 1, 0.9058824, 1,
-0.01252785, -0.694071, -4.670013, 0, 1, 0.9098039, 1,
-0.01169333, -0.08111953, -1.340487, 0, 1, 0.9176471, 1,
0.007211421, -1.582886, 2.953803, 0, 1, 0.9215686, 1,
0.008372771, 1.381121, -1.3822, 0, 1, 0.9294118, 1,
0.009057567, -0.2847604, 4.222965, 0, 1, 0.9333333, 1,
0.0168708, -0.1524573, 4.611069, 0, 1, 0.9411765, 1,
0.01695637, 0.4106244, 0.3616213, 0, 1, 0.945098, 1,
0.0200383, -1.488166, 4.117795, 0, 1, 0.9529412, 1,
0.02357511, 1.92089, -0.4061613, 0, 1, 0.9568627, 1,
0.02902009, -0.4355088, 4.922121, 0, 1, 0.9647059, 1,
0.03254294, -0.6752717, 3.651828, 0, 1, 0.9686275, 1,
0.03937258, 0.2130896, -0.8096634, 0, 1, 0.9764706, 1,
0.03971616, -0.586266, 1.096489, 0, 1, 0.9803922, 1,
0.0398321, 2.690126, -0.1810811, 0, 1, 0.9882353, 1,
0.04459373, 0.4990547, 0.6005358, 0, 1, 0.9921569, 1,
0.0447838, -1.557705, 3.070848, 0, 1, 1, 1,
0.04490821, 0.6317813, -0.8409407, 0, 0.9921569, 1, 1,
0.04868402, -0.7148903, 1.664417, 0, 0.9882353, 1, 1,
0.05198801, 1.383251, -0.5836026, 0, 0.9803922, 1, 1,
0.052534, 1.881373, 1.042304, 0, 0.9764706, 1, 1,
0.05374279, 1.668627, -1.843121, 0, 0.9686275, 1, 1,
0.05841125, -0.3678374, 2.466881, 0, 0.9647059, 1, 1,
0.05896759, 0.6694313, 0.8465199, 0, 0.9568627, 1, 1,
0.0613891, -1.191509, 3.690034, 0, 0.9529412, 1, 1,
0.06293879, -1.663085, 1.250102, 0, 0.945098, 1, 1,
0.06457213, 0.7871016, 0.9301925, 0, 0.9411765, 1, 1,
0.06632391, -0.3470062, 3.196748, 0, 0.9333333, 1, 1,
0.07151132, -1.220047, 3.465398, 0, 0.9294118, 1, 1,
0.07786084, -2.344402, 3.675307, 0, 0.9215686, 1, 1,
0.07937705, 1.255268, 2.17075, 0, 0.9176471, 1, 1,
0.07976269, 1.323205, -2.047938, 0, 0.9098039, 1, 1,
0.0814193, -1.268996, 4.413352, 0, 0.9058824, 1, 1,
0.08512603, 2.129397, -0.155884, 0, 0.8980392, 1, 1,
0.09731405, -1.341251, 2.44586, 0, 0.8901961, 1, 1,
0.09852801, 0.7583237, -1.189768, 0, 0.8862745, 1, 1,
0.09979365, 1.278978, 0.5349247, 0, 0.8784314, 1, 1,
0.1021578, -0.1140585, 2.536438, 0, 0.8745098, 1, 1,
0.1032696, -1.046391, 3.128591, 0, 0.8666667, 1, 1,
0.1064712, -0.1839292, 3.613355, 0, 0.8627451, 1, 1,
0.1079972, -0.4596876, 1.722047, 0, 0.854902, 1, 1,
0.1080186, 0.4998889, 1.156451, 0, 0.8509804, 1, 1,
0.1117175, 1.130985, 0.01990831, 0, 0.8431373, 1, 1,
0.1130448, 1.748214, 0.5216849, 0, 0.8392157, 1, 1,
0.1258446, 1.730344, -1.523926, 0, 0.8313726, 1, 1,
0.1285801, -0.7422273, 3.177238, 0, 0.827451, 1, 1,
0.1297055, -0.1198839, 1.489452, 0, 0.8196079, 1, 1,
0.1331975, 0.639399, -0.3873478, 0, 0.8156863, 1, 1,
0.1334143, 1.67328, -0.6941482, 0, 0.8078431, 1, 1,
0.1403629, -2.39013, 2.711501, 0, 0.8039216, 1, 1,
0.1407928, 2.045794, 0.8273345, 0, 0.7960784, 1, 1,
0.1411043, -0.3314794, 3.018013, 0, 0.7882353, 1, 1,
0.1416802, -0.8815159, 2.743272, 0, 0.7843137, 1, 1,
0.1424528, -0.1439555, 2.574545, 0, 0.7764706, 1, 1,
0.1435529, -1.33045, 3.355212, 0, 0.772549, 1, 1,
0.1470025, -0.5155542, 1.463603, 0, 0.7647059, 1, 1,
0.1490781, 0.7470113, -0.08110563, 0, 0.7607843, 1, 1,
0.1499508, -0.9498525, 5.228118, 0, 0.7529412, 1, 1,
0.1507295, 1.016289, 1.133763, 0, 0.7490196, 1, 1,
0.1594497, -1.762952, 2.995561, 0, 0.7411765, 1, 1,
0.1595567, 0.05357298, 2.75222, 0, 0.7372549, 1, 1,
0.1634088, -0.3066067, 2.376764, 0, 0.7294118, 1, 1,
0.1651011, -0.2992539, 1.461721, 0, 0.7254902, 1, 1,
0.1651892, -0.2175508, -0.2181069, 0, 0.7176471, 1, 1,
0.1681132, 1.725474, 0.09088918, 0, 0.7137255, 1, 1,
0.1706844, -0.61876, 4.221516, 0, 0.7058824, 1, 1,
0.1757571, 0.0464191, 1.977586, 0, 0.6980392, 1, 1,
0.1788223, 0.5857998, -0.4753244, 0, 0.6941177, 1, 1,
0.1826434, -1.105269, 1.432696, 0, 0.6862745, 1, 1,
0.1836647, -1.792665, 2.848999, 0, 0.682353, 1, 1,
0.1839774, -0.89714, 2.62551, 0, 0.6745098, 1, 1,
0.1903685, 0.6193495, 0.4657386, 0, 0.6705883, 1, 1,
0.1915582, -0.1833641, 1.18737, 0, 0.6627451, 1, 1,
0.193483, -0.5187752, 3.901505, 0, 0.6588235, 1, 1,
0.1958961, -0.7914135, 4.358655, 0, 0.6509804, 1, 1,
0.1965267, 2.455112, 0.3005258, 0, 0.6470588, 1, 1,
0.2089796, 1.101268, 0.7582951, 0, 0.6392157, 1, 1,
0.2092599, -0.11957, 0.7546344, 0, 0.6352941, 1, 1,
0.2093235, -0.3438664, 3.950728, 0, 0.627451, 1, 1,
0.2096814, -0.5285282, 4.260942, 0, 0.6235294, 1, 1,
0.2104047, 0.224922, 0.959125, 0, 0.6156863, 1, 1,
0.2130289, -1.405359, 4.44735, 0, 0.6117647, 1, 1,
0.213494, -0.2640783, 0.9672447, 0, 0.6039216, 1, 1,
0.2141296, -0.01083919, 2.246714, 0, 0.5960785, 1, 1,
0.215238, -0.3790241, 2.92771, 0, 0.5921569, 1, 1,
0.2307015, -0.861087, 1.691761, 0, 0.5843138, 1, 1,
0.2309639, 1.217896, 1.377957, 0, 0.5803922, 1, 1,
0.2326989, 0.5418404, -1.037606, 0, 0.572549, 1, 1,
0.2360461, -0.5675274, 1.383653, 0, 0.5686275, 1, 1,
0.2396221, -0.2882025, 0.3684773, 0, 0.5607843, 1, 1,
0.2470169, 0.4375338, 3.157776, 0, 0.5568628, 1, 1,
0.247653, 1.13377, 1.746661, 0, 0.5490196, 1, 1,
0.251088, -1.055472, 1.963546, 0, 0.5450981, 1, 1,
0.2534998, 0.01204828, 1.789838, 0, 0.5372549, 1, 1,
0.2537615, -0.5079733, 4.42907, 0, 0.5333334, 1, 1,
0.2623694, 0.4752353, -0.09401006, 0, 0.5254902, 1, 1,
0.2627102, -0.135051, 2.214942, 0, 0.5215687, 1, 1,
0.2640054, -0.7529015, 1.966266, 0, 0.5137255, 1, 1,
0.2659042, 0.6986972, 1.442507, 0, 0.509804, 1, 1,
0.2667992, 0.2993172, 0.2873291, 0, 0.5019608, 1, 1,
0.267644, -0.5941572, 2.937627, 0, 0.4941176, 1, 1,
0.2683359, 0.9487485, 1.337424, 0, 0.4901961, 1, 1,
0.2688404, -0.7595804, 2.937977, 0, 0.4823529, 1, 1,
0.2702027, -1.591405, 1.730188, 0, 0.4784314, 1, 1,
0.2708531, 1.01918, -0.3144903, 0, 0.4705882, 1, 1,
0.2711057, 2.290462, -0.388976, 0, 0.4666667, 1, 1,
0.2711169, 0.6164385, 0.4370108, 0, 0.4588235, 1, 1,
0.2732601, 1.142316, 1.084973, 0, 0.454902, 1, 1,
0.2769228, 0.7744581, -1.044182, 0, 0.4470588, 1, 1,
0.2788321, 0.9792297, -0.9942217, 0, 0.4431373, 1, 1,
0.2816682, 0.1569326, -0.02935052, 0, 0.4352941, 1, 1,
0.2827077, -0.3483878, 2.367421, 0, 0.4313726, 1, 1,
0.2907257, -1.134797e-05, 1.371943, 0, 0.4235294, 1, 1,
0.2907744, -1.83389, 2.36274, 0, 0.4196078, 1, 1,
0.292763, -0.3252424, 2.063221, 0, 0.4117647, 1, 1,
0.2976592, -3.084333, 2.722901, 0, 0.4078431, 1, 1,
0.2990404, -1.530029, 3.196365, 0, 0.4, 1, 1,
0.3021042, 0.6642001, -1.363853, 0, 0.3921569, 1, 1,
0.3032656, -0.02328272, 1.683023, 0, 0.3882353, 1, 1,
0.3071336, -2.486979, 5.033096, 0, 0.3803922, 1, 1,
0.3101797, -0.6642347, 3.000305, 0, 0.3764706, 1, 1,
0.3104353, 1.250152, 2.305699, 0, 0.3686275, 1, 1,
0.3111421, -0.933333, 3.778366, 0, 0.3647059, 1, 1,
0.3124421, 0.1140851, 2.560226, 0, 0.3568628, 1, 1,
0.3142605, 2.074689, 1.3044, 0, 0.3529412, 1, 1,
0.315259, -0.9215084, 1.902033, 0, 0.345098, 1, 1,
0.3177317, 0.06352775, 1.642761, 0, 0.3411765, 1, 1,
0.3194215, -0.914584, 1.6389, 0, 0.3333333, 1, 1,
0.3207362, 1.978756, 0.557463, 0, 0.3294118, 1, 1,
0.3229353, -1.476881, 2.953094, 0, 0.3215686, 1, 1,
0.3257287, -0.166007, 1.121836, 0, 0.3176471, 1, 1,
0.326676, -0.8161328, 1.750521, 0, 0.3098039, 1, 1,
0.335095, 0.142343, 2.354446, 0, 0.3058824, 1, 1,
0.3365093, 1.208525, 2.843548, 0, 0.2980392, 1, 1,
0.3372362, 0.2808483, 0.5067498, 0, 0.2901961, 1, 1,
0.3375774, 1.032563, 0.6116572, 0, 0.2862745, 1, 1,
0.343681, -0.1221725, 2.222118, 0, 0.2784314, 1, 1,
0.344403, -2.002358, 2.940675, 0, 0.2745098, 1, 1,
0.3470999, -1.446227, 3.736975, 0, 0.2666667, 1, 1,
0.3489603, -0.7440662, 1.752349, 0, 0.2627451, 1, 1,
0.3515119, 0.4920658, 2.213453, 0, 0.254902, 1, 1,
0.3561194, -0.06006377, 2.614348, 0, 0.2509804, 1, 1,
0.3571017, 0.2900687, 3.124951, 0, 0.2431373, 1, 1,
0.3588088, -0.9439751, 2.037648, 0, 0.2392157, 1, 1,
0.359687, -0.6934773, 2.105329, 0, 0.2313726, 1, 1,
0.3661223, -0.1148542, 3.136829, 0, 0.227451, 1, 1,
0.3693971, -0.9436632, 2.813671, 0, 0.2196078, 1, 1,
0.3720566, -0.0223295, 0.6053478, 0, 0.2156863, 1, 1,
0.3735086, -0.755031, 2.426181, 0, 0.2078431, 1, 1,
0.3740598, -2.012299, 1.359484, 0, 0.2039216, 1, 1,
0.3746158, 0.05897016, 0.7575539, 0, 0.1960784, 1, 1,
0.3825811, -0.7524937, 1.531555, 0, 0.1882353, 1, 1,
0.3870429, -0.02168723, 0.2246407, 0, 0.1843137, 1, 1,
0.3879904, -1.608537, 3.904988, 0, 0.1764706, 1, 1,
0.3920843, 2.086985, 0.6802938, 0, 0.172549, 1, 1,
0.3938685, 0.6936218, 2.839314, 0, 0.1647059, 1, 1,
0.3941347, -0.3361697, 4.23998, 0, 0.1607843, 1, 1,
0.3961747, 0.980776, 1.372053, 0, 0.1529412, 1, 1,
0.3990131, -0.1636894, 2.336483, 0, 0.1490196, 1, 1,
0.3991153, -0.2154194, 1.959415, 0, 0.1411765, 1, 1,
0.3998412, -0.2413389, 3.271418, 0, 0.1372549, 1, 1,
0.4007939, -0.1141085, 1.258853, 0, 0.1294118, 1, 1,
0.4009288, 1.636015, 0.7110194, 0, 0.1254902, 1, 1,
0.4018806, -1.826972, 3.006657, 0, 0.1176471, 1, 1,
0.4038728, -0.7350793, 3.131152, 0, 0.1137255, 1, 1,
0.4086935, 2.199814, -1.141256, 0, 0.1058824, 1, 1,
0.4095795, 0.2287858, 1.9908, 0, 0.09803922, 1, 1,
0.4112296, 0.7122675, 1.817071, 0, 0.09411765, 1, 1,
0.4164892, -0.03297479, 1.632053, 0, 0.08627451, 1, 1,
0.4222314, -0.1786065, 4.010931, 0, 0.08235294, 1, 1,
0.4257633, 1.641621, 0.9581195, 0, 0.07450981, 1, 1,
0.4273258, 0.390329, 0.8504781, 0, 0.07058824, 1, 1,
0.4294029, 0.976765, 0.0976183, 0, 0.0627451, 1, 1,
0.4309761, -0.5704748, 2.188829, 0, 0.05882353, 1, 1,
0.4312847, 0.2748308, -0.3964196, 0, 0.05098039, 1, 1,
0.4327321, -0.3339547, 1.690766, 0, 0.04705882, 1, 1,
0.4433431, -0.8421553, 3.955394, 0, 0.03921569, 1, 1,
0.4637933, 0.7324706, 2.360136, 0, 0.03529412, 1, 1,
0.4725207, -0.9639616, 2.777376, 0, 0.02745098, 1, 1,
0.4729893, -0.184635, 2.123829, 0, 0.02352941, 1, 1,
0.4743661, -0.862008, 1.677996, 0, 0.01568628, 1, 1,
0.4745563, -0.8345211, 1.082818, 0, 0.01176471, 1, 1,
0.479122, -0.2738529, 2.692757, 0, 0.003921569, 1, 1,
0.4871537, -1.805855, 1.839889, 0.003921569, 0, 1, 1,
0.4874975, 1.00321, 0.4604226, 0.007843138, 0, 1, 1,
0.4883997, 0.5483009, 0.05652812, 0.01568628, 0, 1, 1,
0.4906975, -1.2919, 3.602785, 0.01960784, 0, 1, 1,
0.4940777, 0.9453453, -0.4531599, 0.02745098, 0, 1, 1,
0.494527, -0.4311738, 2.465148, 0.03137255, 0, 1, 1,
0.4964426, -1.27461, 1.935984, 0.03921569, 0, 1, 1,
0.4970631, -0.9218708, 2.926814, 0.04313726, 0, 1, 1,
0.4975701, 0.5677552, -0.03989406, 0.05098039, 0, 1, 1,
0.4998729, -0.0639423, 2.871634, 0.05490196, 0, 1, 1,
0.5025734, 0.8974575, 2.49294, 0.0627451, 0, 1, 1,
0.5147556, -0.4421723, 1.548901, 0.06666667, 0, 1, 1,
0.5156547, 0.2289462, 0.525369, 0.07450981, 0, 1, 1,
0.5174786, 1.075216, 1.4527, 0.07843138, 0, 1, 1,
0.5266313, -1.39131, 1.98767, 0.08627451, 0, 1, 1,
0.5268674, -0.1853434, 0.8932545, 0.09019608, 0, 1, 1,
0.5278757, 0.3808071, -0.1788931, 0.09803922, 0, 1, 1,
0.529185, -0.5264265, 0.9699681, 0.1058824, 0, 1, 1,
0.5297542, -0.6343548, 1.42512, 0.1098039, 0, 1, 1,
0.5305029, -0.166636, 2.503814, 0.1176471, 0, 1, 1,
0.5380959, -1.653813, 3.378484, 0.1215686, 0, 1, 1,
0.5397661, 2.179516, 0.5232092, 0.1294118, 0, 1, 1,
0.5399233, 0.7700658, 0.05261758, 0.1333333, 0, 1, 1,
0.5437397, 0.8054278, 0.3792304, 0.1411765, 0, 1, 1,
0.5437994, 2.123382, 0.5752978, 0.145098, 0, 1, 1,
0.5514926, -0.9774577, 2.307879, 0.1529412, 0, 1, 1,
0.5535206, 0.3610748, 0.9328567, 0.1568628, 0, 1, 1,
0.5538957, 1.153898, 1.104657, 0.1647059, 0, 1, 1,
0.5663205, -0.7075807, 1.746886, 0.1686275, 0, 1, 1,
0.5675481, 0.3908365, 0.1659252, 0.1764706, 0, 1, 1,
0.571537, -0.6983651, 3.189755, 0.1803922, 0, 1, 1,
0.5716029, -1.472706, 1.513111, 0.1882353, 0, 1, 1,
0.5741773, -1.678764, 2.435803, 0.1921569, 0, 1, 1,
0.5751111, 0.1297449, 2.025339, 0.2, 0, 1, 1,
0.5765753, 0.5388181, 1.040253, 0.2078431, 0, 1, 1,
0.5767614, -0.3384934, 1.449963, 0.2117647, 0, 1, 1,
0.5787938, -0.2202388, 3.225518, 0.2196078, 0, 1, 1,
0.5823101, -0.9158694, 0.5925393, 0.2235294, 0, 1, 1,
0.5862659, 1.050412, -0.3980341, 0.2313726, 0, 1, 1,
0.5876293, -1.634377, 2.214938, 0.2352941, 0, 1, 1,
0.5909731, -1.015633, 2.492511, 0.2431373, 0, 1, 1,
0.5918004, -1.336781, 2.54558, 0.2470588, 0, 1, 1,
0.5936332, 0.7424093, 1.697077, 0.254902, 0, 1, 1,
0.5962533, 0.01007711, 0.8183538, 0.2588235, 0, 1, 1,
0.6034771, -0.08920994, 1.048861, 0.2666667, 0, 1, 1,
0.6049, 1.740582, 0.3528501, 0.2705882, 0, 1, 1,
0.607586, -1.239985, 1.787269, 0.2784314, 0, 1, 1,
0.6085058, 0.5265545, 2.407943, 0.282353, 0, 1, 1,
0.6105661, 3.257093, 0.8906384, 0.2901961, 0, 1, 1,
0.6130689, 0.4650356, 0.3698852, 0.2941177, 0, 1, 1,
0.6157888, -0.9524615, 3.016629, 0.3019608, 0, 1, 1,
0.6161438, -0.4843098, 4.013648, 0.3098039, 0, 1, 1,
0.6219534, -0.7957795, 2.520394, 0.3137255, 0, 1, 1,
0.6274891, 2.394233, -0.2757602, 0.3215686, 0, 1, 1,
0.6283662, -0.7211981, 0.3777578, 0.3254902, 0, 1, 1,
0.632138, -1.415893, 3.395899, 0.3333333, 0, 1, 1,
0.6322232, 0.4827319, 1.954594, 0.3372549, 0, 1, 1,
0.6359128, 1.70521, -0.1773515, 0.345098, 0, 1, 1,
0.6401004, 0.7083409, 0.6748909, 0.3490196, 0, 1, 1,
0.6402031, -0.08580486, 2.951784, 0.3568628, 0, 1, 1,
0.642045, 1.079104, 0.2655295, 0.3607843, 0, 1, 1,
0.6562741, -0.8960771, 0.3185332, 0.3686275, 0, 1, 1,
0.6578252, -0.7164772, 2.862142, 0.372549, 0, 1, 1,
0.6586319, 1.914729, 0.1237763, 0.3803922, 0, 1, 1,
0.6598665, -0.325583, 2.979837, 0.3843137, 0, 1, 1,
0.6600021, -0.7774776, 0.4604787, 0.3921569, 0, 1, 1,
0.664831, 0.7890791, 0.5706409, 0.3960784, 0, 1, 1,
0.6651922, -0.1530964, 0.7641013, 0.4039216, 0, 1, 1,
0.6655399, 0.4004332, 1.869032, 0.4117647, 0, 1, 1,
0.6726562, 1.82122, 1.573437, 0.4156863, 0, 1, 1,
0.6752308, 1.150745, 1.345044, 0.4235294, 0, 1, 1,
0.6788718, -0.19367, 0.2876427, 0.427451, 0, 1, 1,
0.6831314, 1.498937, 1.466504, 0.4352941, 0, 1, 1,
0.6914386, -0.08149762, 2.163582, 0.4392157, 0, 1, 1,
0.6921239, -0.2470216, 3.278986, 0.4470588, 0, 1, 1,
0.6929004, 0.3326236, 1.099114, 0.4509804, 0, 1, 1,
0.6969174, -0.7480046, 3.139919, 0.4588235, 0, 1, 1,
0.6978499, -0.2924378, 0.08908888, 0.4627451, 0, 1, 1,
0.6998773, 0.2863064, 1.520893, 0.4705882, 0, 1, 1,
0.7018047, -0.6402825, 0.7599446, 0.4745098, 0, 1, 1,
0.7074437, -2.186302, 2.408121, 0.4823529, 0, 1, 1,
0.7175651, -0.3674885, 0.828556, 0.4862745, 0, 1, 1,
0.7183692, -0.03844176, 2.082436, 0.4941176, 0, 1, 1,
0.7190669, -1.597546, 2.718182, 0.5019608, 0, 1, 1,
0.7223873, 1.183385, 0.1711306, 0.5058824, 0, 1, 1,
0.7278847, -0.7698565, 2.173376, 0.5137255, 0, 1, 1,
0.7281492, 1.442277, -0.3064457, 0.5176471, 0, 1, 1,
0.7284014, -0.2855473, 1.235769, 0.5254902, 0, 1, 1,
0.7287604, -0.8255463, 4.169768, 0.5294118, 0, 1, 1,
0.7292099, 1.3726, -0.2789485, 0.5372549, 0, 1, 1,
0.7315908, 0.1451048, 2.321438, 0.5411765, 0, 1, 1,
0.7341273, -0.1064464, 2.042732, 0.5490196, 0, 1, 1,
0.7367203, 0.1843479, 1.484498, 0.5529412, 0, 1, 1,
0.7377508, 0.05311578, 0.8250242, 0.5607843, 0, 1, 1,
0.7388785, -1.860841, 3.753269, 0.5647059, 0, 1, 1,
0.7423208, 0.8671764, 0.4350984, 0.572549, 0, 1, 1,
0.7458829, -0.1099238, 3.463196, 0.5764706, 0, 1, 1,
0.7547356, 1.876671, 1.30164, 0.5843138, 0, 1, 1,
0.7553879, 0.9422429, 1.880263, 0.5882353, 0, 1, 1,
0.759436, -0.7834561, 2.424828, 0.5960785, 0, 1, 1,
0.7636992, 0.5991267, -0.5858545, 0.6039216, 0, 1, 1,
0.7646673, 0.7240394, 1.717998, 0.6078432, 0, 1, 1,
0.7676407, 0.6032771, 1.660815, 0.6156863, 0, 1, 1,
0.7689598, -0.6753101, 0.7238875, 0.6196079, 0, 1, 1,
0.7716576, 1.722833, 0.7654284, 0.627451, 0, 1, 1,
0.7744053, -0.1847688, 3.810021, 0.6313726, 0, 1, 1,
0.7768491, 0.9782023, 1.012907, 0.6392157, 0, 1, 1,
0.7824215, 0.872952, 1.628894, 0.6431373, 0, 1, 1,
0.7831581, 0.1575111, 3.105153, 0.6509804, 0, 1, 1,
0.7835542, 0.05296646, 1.003357, 0.654902, 0, 1, 1,
0.7837313, 0.132213, 2.172867, 0.6627451, 0, 1, 1,
0.7844744, 0.347977, -0.6837863, 0.6666667, 0, 1, 1,
0.786608, 0.05504231, 1.386423, 0.6745098, 0, 1, 1,
0.7900229, 0.02730655, 1.510588, 0.6784314, 0, 1, 1,
0.790478, -0.1651707, 3.006763, 0.6862745, 0, 1, 1,
0.7954378, 0.07513207, 0.9449161, 0.6901961, 0, 1, 1,
0.7976435, 0.4436231, 1.228016, 0.6980392, 0, 1, 1,
0.7997299, 0.2863239, 1.896354, 0.7058824, 0, 1, 1,
0.8024673, -0.7016375, 1.44112, 0.7098039, 0, 1, 1,
0.8038079, -0.1463696, 0.2992093, 0.7176471, 0, 1, 1,
0.8054251, -2.797198, 2.82995, 0.7215686, 0, 1, 1,
0.8101774, -1.306638, 2.678822, 0.7294118, 0, 1, 1,
0.8130587, -1.709834, 3.521236, 0.7333333, 0, 1, 1,
0.813173, -0.6250389, 2.003176, 0.7411765, 0, 1, 1,
0.813706, -0.8296193, 3.194666, 0.7450981, 0, 1, 1,
0.8183393, 0.2987933, 1.434823, 0.7529412, 0, 1, 1,
0.8204033, 0.2991629, 2.872581, 0.7568628, 0, 1, 1,
0.8262182, -0.8547496, 2.3834, 0.7647059, 0, 1, 1,
0.8262341, -1.408844, 1.701755, 0.7686275, 0, 1, 1,
0.8287441, 0.4034648, 0.07558607, 0.7764706, 0, 1, 1,
0.8334165, -1.021995, 2.892565, 0.7803922, 0, 1, 1,
0.840537, 0.6565143, -0.6065568, 0.7882353, 0, 1, 1,
0.8412551, -0.1882981, 0.7966751, 0.7921569, 0, 1, 1,
0.8458668, -0.3627154, 3.950745, 0.8, 0, 1, 1,
0.846193, -0.4147007, 1.985523, 0.8078431, 0, 1, 1,
0.8472524, 0.6589901, 2.394354, 0.8117647, 0, 1, 1,
0.855951, 0.5676349, -0.04438106, 0.8196079, 0, 1, 1,
0.8633932, -0.6269513, 2.847657, 0.8235294, 0, 1, 1,
0.8704652, -1.042387, 2.519683, 0.8313726, 0, 1, 1,
0.87103, -0.582821, 2.635349, 0.8352941, 0, 1, 1,
0.8722357, 0.2469971, 1.847428, 0.8431373, 0, 1, 1,
0.8790847, -1.844767, 1.350732, 0.8470588, 0, 1, 1,
0.8813469, -0.2485457, 2.340224, 0.854902, 0, 1, 1,
0.8868706, -0.08835039, 1.383568, 0.8588235, 0, 1, 1,
0.8908977, 0.4404243, 0.5725703, 0.8666667, 0, 1, 1,
0.8980787, -0.8110487, 1.938857, 0.8705882, 0, 1, 1,
0.8984903, 0.03187558, 2.77424, 0.8784314, 0, 1, 1,
0.8989794, 0.6926542, 1.210978, 0.8823529, 0, 1, 1,
0.9002509, 0.8976869, 3.008915, 0.8901961, 0, 1, 1,
0.9013646, -0.008745092, 2.487899, 0.8941177, 0, 1, 1,
0.9025736, -0.160023, 1.862537, 0.9019608, 0, 1, 1,
0.9046931, 0.5517816, 2.12906, 0.9098039, 0, 1, 1,
0.9057871, 0.4956237, 0.9182701, 0.9137255, 0, 1, 1,
0.9150044, 0.9789039, -0.6843625, 0.9215686, 0, 1, 1,
0.9220482, 1.35358, 1.174544, 0.9254902, 0, 1, 1,
0.9237235, 1.156134, 1.167049, 0.9333333, 0, 1, 1,
0.9266104, 0.8511822, -1.384361, 0.9372549, 0, 1, 1,
0.9327767, 1.917451, 0.1412864, 0.945098, 0, 1, 1,
0.9340688, -1.258215, 3.918179, 0.9490196, 0, 1, 1,
0.9343927, -0.8415025, 2.052555, 0.9568627, 0, 1, 1,
0.93505, 1.325122, 1.164542, 0.9607843, 0, 1, 1,
0.9352857, 1.765591, -0.6783938, 0.9686275, 0, 1, 1,
0.9492356, 1.576311, -0.3837556, 0.972549, 0, 1, 1,
0.9509109, 0.3802508, 0.6299038, 0.9803922, 0, 1, 1,
0.9510976, 0.3481244, 0.7465069, 0.9843137, 0, 1, 1,
0.9527001, -0.03595808, 0.3438493, 0.9921569, 0, 1, 1,
0.9572222, -0.6672237, 2.242469, 0.9960784, 0, 1, 1,
0.960642, 0.4863988, 1.257333, 1, 0, 0.9960784, 1,
0.963468, -0.4641105, 2.189794, 1, 0, 0.9882353, 1,
0.9661344, 0.7374178, 1.781174, 1, 0, 0.9843137, 1,
0.9723051, -0.02310598, 0.1232592, 1, 0, 0.9764706, 1,
0.974689, -1.776185, 2.184742, 1, 0, 0.972549, 1,
0.9882106, 0.8746297, -0.9828529, 1, 0, 0.9647059, 1,
0.9919872, 0.7018261, 2.086165, 1, 0, 0.9607843, 1,
0.993121, -0.1346189, 1.468945, 1, 0, 0.9529412, 1,
0.9947965, -0.6653395, 2.930794, 1, 0, 0.9490196, 1,
0.9948636, 1.920079, 0.3954859, 1, 0, 0.9411765, 1,
0.9957898, -0.8865951, 1.348859, 1, 0, 0.9372549, 1,
1.000121, 1.17062, -0.5937487, 1, 0, 0.9294118, 1,
1.00335, 0.4203097, 2.40961, 1, 0, 0.9254902, 1,
1.006457, 0.2051416, 2.674435, 1, 0, 0.9176471, 1,
1.009607, -0.8147828, 2.436689, 1, 0, 0.9137255, 1,
1.013758, 1.13009, 1.852825, 1, 0, 0.9058824, 1,
1.016779, 0.8510928, 3.431921, 1, 0, 0.9019608, 1,
1.017745, -0.3478026, 2.339595, 1, 0, 0.8941177, 1,
1.028033, -1.276191, 2.431124, 1, 0, 0.8862745, 1,
1.029606, -0.4253905, 4.82907, 1, 0, 0.8823529, 1,
1.03191, -0.1910495, 0.4580466, 1, 0, 0.8745098, 1,
1.032755, -0.07350856, 1.809737, 1, 0, 0.8705882, 1,
1.033911, -0.5606359, 3.431253, 1, 0, 0.8627451, 1,
1.034431, -0.7932181, 1.107211, 1, 0, 0.8588235, 1,
1.037733, 0.4801725, 1.563553, 1, 0, 0.8509804, 1,
1.048051, 0.5065061, 0.387213, 1, 0, 0.8470588, 1,
1.051369, -0.6670961, 2.234421, 1, 0, 0.8392157, 1,
1.05184, -2.08129, 2.724921, 1, 0, 0.8352941, 1,
1.057648, 1.815013, 0.3976777, 1, 0, 0.827451, 1,
1.057833, 0.4041541, -0.9592478, 1, 0, 0.8235294, 1,
1.069127, 2.77848, 0.3468468, 1, 0, 0.8156863, 1,
1.073053, -0.3977247, 2.662837, 1, 0, 0.8117647, 1,
1.074543, -0.4716029, 2.660751, 1, 0, 0.8039216, 1,
1.076195, -1.546116, 3.466395, 1, 0, 0.7960784, 1,
1.084745, 1.464566, 0.1606617, 1, 0, 0.7921569, 1,
1.102047, 0.7523291, 0.8582795, 1, 0, 0.7843137, 1,
1.11053, 0.3117483, 1.669426, 1, 0, 0.7803922, 1,
1.114344, 0.09203614, 1.728559, 1, 0, 0.772549, 1,
1.137951, -0.1977716, 3.155517, 1, 0, 0.7686275, 1,
1.13895, 1.346729, 1.614439, 1, 0, 0.7607843, 1,
1.152512, -1.386382, 1.224298, 1, 0, 0.7568628, 1,
1.156897, -1.470686, 0.3372008, 1, 0, 0.7490196, 1,
1.173622, -0.5520453, 1.48202, 1, 0, 0.7450981, 1,
1.186991, 0.4369315, 0.5912462, 1, 0, 0.7372549, 1,
1.19718, 0.9669539, 0.3373662, 1, 0, 0.7333333, 1,
1.197312, -0.720976, 2.325511, 1, 0, 0.7254902, 1,
1.206546, 0.2790984, 0.9717759, 1, 0, 0.7215686, 1,
1.208855, 0.7214786, 1.978112, 1, 0, 0.7137255, 1,
1.212352, 1.772175, 2.159891, 1, 0, 0.7098039, 1,
1.213205, -1.548964, 2.380378, 1, 0, 0.7019608, 1,
1.225318, 1.869841, -1.398453, 1, 0, 0.6941177, 1,
1.233272, 0.9197923, 0.3067837, 1, 0, 0.6901961, 1,
1.233831, 0.2154572, 2.543233, 1, 0, 0.682353, 1,
1.246744, -0.9959244, 0.3922603, 1, 0, 0.6784314, 1,
1.247102, -0.3096129, -0.1237739, 1, 0, 0.6705883, 1,
1.247942, 0.1576304, 0.4812211, 1, 0, 0.6666667, 1,
1.252686, 1.269607, -0.003865501, 1, 0, 0.6588235, 1,
1.253735, -0.7641479, 4.21888, 1, 0, 0.654902, 1,
1.254799, -0.919578, 2.182568, 1, 0, 0.6470588, 1,
1.257423, 1.619395, 1.049705, 1, 0, 0.6431373, 1,
1.260186, 0.6007059, -0.3744438, 1, 0, 0.6352941, 1,
1.268737, 0.4457696, 2.062283, 1, 0, 0.6313726, 1,
1.274602, 2.258622, -1.700669, 1, 0, 0.6235294, 1,
1.27587, 0.2165517, -0.07377788, 1, 0, 0.6196079, 1,
1.275937, 0.2517873, 1.62569, 1, 0, 0.6117647, 1,
1.277752, -0.07310576, 1.513267, 1, 0, 0.6078432, 1,
1.27794, 0.235568, 1.497275, 1, 0, 0.6, 1,
1.286436, 1.315963, 0.1171065, 1, 0, 0.5921569, 1,
1.292098, 0.6006989, -0.009328448, 1, 0, 0.5882353, 1,
1.306139, 1.703684, 0.8849761, 1, 0, 0.5803922, 1,
1.323124, 1.793059, 0.1091328, 1, 0, 0.5764706, 1,
1.330982, 0.3739646, 1.217975, 1, 0, 0.5686275, 1,
1.337501, 0.583728, 1.297863, 1, 0, 0.5647059, 1,
1.340621, 0.4375211, -0.1375054, 1, 0, 0.5568628, 1,
1.345092, 0.3620927, -0.804482, 1, 0, 0.5529412, 1,
1.350643, -0.4970611, 2.279644, 1, 0, 0.5450981, 1,
1.353484, 0.583093, 0.9206657, 1, 0, 0.5411765, 1,
1.373557, -0.5951252, 0.801955, 1, 0, 0.5333334, 1,
1.380125, 1.260736, 0.5101811, 1, 0, 0.5294118, 1,
1.388066, -0.05626357, 1.131043, 1, 0, 0.5215687, 1,
1.390178, -0.7391043, 1.82895, 1, 0, 0.5176471, 1,
1.392834, 1.053986, -1.150964, 1, 0, 0.509804, 1,
1.400177, -0.04639676, 1.223665, 1, 0, 0.5058824, 1,
1.401053, -0.6730893, 1.259477, 1, 0, 0.4980392, 1,
1.406417, 0.08311289, 0.8543361, 1, 0, 0.4901961, 1,
1.409401, -0.9682741, 2.693255, 1, 0, 0.4862745, 1,
1.415631, 0.493075, 1.538688, 1, 0, 0.4784314, 1,
1.419095, 1.216331, -1.188307, 1, 0, 0.4745098, 1,
1.425457, 0.9351223, 0.73186, 1, 0, 0.4666667, 1,
1.430735, -3.113722, 3.365559, 1, 0, 0.4627451, 1,
1.443733, 0.7500692, 2.595144, 1, 0, 0.454902, 1,
1.444472, 0.753856, 2.45487, 1, 0, 0.4509804, 1,
1.448612, 0.2898264, 1.358006, 1, 0, 0.4431373, 1,
1.476294, -0.4313107, 2.6393, 1, 0, 0.4392157, 1,
1.483445, -0.3733333, 2.25139, 1, 0, 0.4313726, 1,
1.48373, 0.2904394, 2.918987, 1, 0, 0.427451, 1,
1.485232, 1.299614, 0.4476172, 1, 0, 0.4196078, 1,
1.495251, -0.04236315, 2.849432, 1, 0, 0.4156863, 1,
1.515939, -1.603407, 1.145502, 1, 0, 0.4078431, 1,
1.520367, -0.9098724, 1.616206, 1, 0, 0.4039216, 1,
1.521814, -0.7350886, 2.483979, 1, 0, 0.3960784, 1,
1.5266, 0.6434173, 2.209492, 1, 0, 0.3882353, 1,
1.52754, -0.2408833, 1.641294, 1, 0, 0.3843137, 1,
1.529133, 2.180453, -0.1002768, 1, 0, 0.3764706, 1,
1.532186, -0.2578749, -0.5701391, 1, 0, 0.372549, 1,
1.543345, -1.568138, 3.210428, 1, 0, 0.3647059, 1,
1.559712, 1.601854, 1.64682, 1, 0, 0.3607843, 1,
1.561586, -0.8290807, 1.963033, 1, 0, 0.3529412, 1,
1.56233, 0.9719128, 0.695669, 1, 0, 0.3490196, 1,
1.577788, 1.595942, 1.607008, 1, 0, 0.3411765, 1,
1.595268, -0.3972052, 2.663654, 1, 0, 0.3372549, 1,
1.612634, 0.8773013, 0.0459566, 1, 0, 0.3294118, 1,
1.613344, -0.4314153, 0.6894022, 1, 0, 0.3254902, 1,
1.614305, -0.2010934, -0.713324, 1, 0, 0.3176471, 1,
1.614848, -0.3014206, 4.045012, 1, 0, 0.3137255, 1,
1.622835, -0.982083, 2.711018, 1, 0, 0.3058824, 1,
1.632679, -0.4083149, 0.8315568, 1, 0, 0.2980392, 1,
1.656827, 1.69908, 1.567276, 1, 0, 0.2941177, 1,
1.66792, -0.5024792, 2.126638, 1, 0, 0.2862745, 1,
1.690179, -1.173319, 2.071414, 1, 0, 0.282353, 1,
1.698877, -0.3135501, 2.727203, 1, 0, 0.2745098, 1,
1.706229, -1.097643, 4.018327, 1, 0, 0.2705882, 1,
1.715669, 1.740031, -0.5313872, 1, 0, 0.2627451, 1,
1.736519, 1.095405, 2.739738, 1, 0, 0.2588235, 1,
1.751737, -0.2891732, 1.621787, 1, 0, 0.2509804, 1,
1.755757, 1.022913, 1.477755, 1, 0, 0.2470588, 1,
1.763649, -0.5369082, 0.9574063, 1, 0, 0.2392157, 1,
1.76488, 0.4953309, 1.993453, 1, 0, 0.2352941, 1,
1.769224, -0.1904442, 1.175476, 1, 0, 0.227451, 1,
1.79129, -0.02775339, 1.711004, 1, 0, 0.2235294, 1,
1.791803, -1.157354, 1.598718, 1, 0, 0.2156863, 1,
1.802415, -0.1879312, 1.696188, 1, 0, 0.2117647, 1,
1.812139, -1.48756, 0.6334124, 1, 0, 0.2039216, 1,
1.826637, -0.07399947, 1.252847, 1, 0, 0.1960784, 1,
1.850901, 1.208452, 2.842304, 1, 0, 0.1921569, 1,
1.852107, -1.6057, 2.092909, 1, 0, 0.1843137, 1,
1.854612, 0.4665124, 0.7062554, 1, 0, 0.1803922, 1,
1.863732, 0.256966, 1.069884, 1, 0, 0.172549, 1,
1.865756, 0.637207, 1.925634, 1, 0, 0.1686275, 1,
1.88115, 1.90655, 0.7164527, 1, 0, 0.1607843, 1,
1.910179, -0.4606456, 0.9357271, 1, 0, 0.1568628, 1,
1.913962, 2.580407, -0.4188011, 1, 0, 0.1490196, 1,
1.923522, 0.6217064, 2.4058, 1, 0, 0.145098, 1,
1.932876, -1.64233, 3.021919, 1, 0, 0.1372549, 1,
1.935461, -1.269932, 3.809815, 1, 0, 0.1333333, 1,
1.96938, 0.493159, 1.652947, 1, 0, 0.1254902, 1,
1.972893, -2.198446, 3.933439, 1, 0, 0.1215686, 1,
2.052972, 0.9240951, 0.6722787, 1, 0, 0.1137255, 1,
2.058734, 1.349884, 1.083916, 1, 0, 0.1098039, 1,
2.100737, -1.168634, 2.092783, 1, 0, 0.1019608, 1,
2.13943, -0.5376858, 2.018551, 1, 0, 0.09411765, 1,
2.149039, -0.2332017, 0.2444548, 1, 0, 0.09019608, 1,
2.22369, -0.1787172, 0.5605671, 1, 0, 0.08235294, 1,
2.320964, -0.4665246, 1.984322, 1, 0, 0.07843138, 1,
2.359717, -0.921885, 4.101913, 1, 0, 0.07058824, 1,
2.384998, -1.237233, 0.1971073, 1, 0, 0.06666667, 1,
2.410811, -2.31673, -0.04430329, 1, 0, 0.05882353, 1,
2.434739, 0.2192897, 1.753542, 1, 0, 0.05490196, 1,
2.486322, -0.5146433, 2.983833, 1, 0, 0.04705882, 1,
2.524655, 1.313779, 0.8295466, 1, 0, 0.04313726, 1,
2.540505, 2.156374, 1.160531, 1, 0, 0.03529412, 1,
2.542127, 0.9599956, 1.859882, 1, 0, 0.03137255, 1,
2.560788, -0.9704638, 1.607017, 1, 0, 0.02352941, 1,
2.687721, 0.80854, 2.227501, 1, 0, 0.01960784, 1,
2.705956, 0.8249908, 1.011817, 1, 0, 0.01176471, 1,
2.853954, -1.353418, 1.968562, 1, 0, 0.007843138, 1
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
-0.3440545, -4.365834, -6.516445, 0, -0.5, 0.5, 0.5,
-0.3440545, -4.365834, -6.516445, 1, -0.5, 0.5, 0.5,
-0.3440545, -4.365834, -6.516445, 1, 1.5, 0.5, 0.5,
-0.3440545, -4.365834, -6.516445, 0, 1.5, 0.5, 0.5
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
-4.626188, -0.001961231, -6.516445, 0, -0.5, 0.5, 0.5,
-4.626188, -0.001961231, -6.516445, 1, -0.5, 0.5, 0.5,
-4.626188, -0.001961231, -6.516445, 1, 1.5, 0.5, 0.5,
-4.626188, -0.001961231, -6.516445, 0, 1.5, 0.5, 0.5
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
-4.626188, -4.365834, 0.2069285, 0, -0.5, 0.5, 0.5,
-4.626188, -4.365834, 0.2069285, 1, -0.5, 0.5, 0.5,
-4.626188, -4.365834, 0.2069285, 1, 1.5, 0.5, 0.5,
-4.626188, -4.365834, 0.2069285, 0, 1.5, 0.5, 0.5
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
-3, -3.358787, -4.964897,
2, -3.358787, -4.964897,
-3, -3.358787, -4.964897,
-3, -3.526628, -5.223488,
-2, -3.358787, -4.964897,
-2, -3.526628, -5.223488,
-1, -3.358787, -4.964897,
-1, -3.526628, -5.223488,
0, -3.358787, -4.964897,
0, -3.526628, -5.223488,
1, -3.358787, -4.964897,
1, -3.526628, -5.223488,
2, -3.358787, -4.964897,
2, -3.526628, -5.223488
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
-3, -3.862311, -5.740671, 0, -0.5, 0.5, 0.5,
-3, -3.862311, -5.740671, 1, -0.5, 0.5, 0.5,
-3, -3.862311, -5.740671, 1, 1.5, 0.5, 0.5,
-3, -3.862311, -5.740671, 0, 1.5, 0.5, 0.5,
-2, -3.862311, -5.740671, 0, -0.5, 0.5, 0.5,
-2, -3.862311, -5.740671, 1, -0.5, 0.5, 0.5,
-2, -3.862311, -5.740671, 1, 1.5, 0.5, 0.5,
-2, -3.862311, -5.740671, 0, 1.5, 0.5, 0.5,
-1, -3.862311, -5.740671, 0, -0.5, 0.5, 0.5,
-1, -3.862311, -5.740671, 1, -0.5, 0.5, 0.5,
-1, -3.862311, -5.740671, 1, 1.5, 0.5, 0.5,
-1, -3.862311, -5.740671, 0, 1.5, 0.5, 0.5,
0, -3.862311, -5.740671, 0, -0.5, 0.5, 0.5,
0, -3.862311, -5.740671, 1, -0.5, 0.5, 0.5,
0, -3.862311, -5.740671, 1, 1.5, 0.5, 0.5,
0, -3.862311, -5.740671, 0, 1.5, 0.5, 0.5,
1, -3.862311, -5.740671, 0, -0.5, 0.5, 0.5,
1, -3.862311, -5.740671, 1, -0.5, 0.5, 0.5,
1, -3.862311, -5.740671, 1, 1.5, 0.5, 0.5,
1, -3.862311, -5.740671, 0, 1.5, 0.5, 0.5,
2, -3.862311, -5.740671, 0, -0.5, 0.5, 0.5,
2, -3.862311, -5.740671, 1, -0.5, 0.5, 0.5,
2, -3.862311, -5.740671, 1, 1.5, 0.5, 0.5,
2, -3.862311, -5.740671, 0, 1.5, 0.5, 0.5
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
-3.638003, -3, -4.964897,
-3.638003, 3, -4.964897,
-3.638003, -3, -4.964897,
-3.802701, -3, -5.223488,
-3.638003, -2, -4.964897,
-3.802701, -2, -5.223488,
-3.638003, -1, -4.964897,
-3.802701, -1, -5.223488,
-3.638003, 0, -4.964897,
-3.802701, 0, -5.223488,
-3.638003, 1, -4.964897,
-3.802701, 1, -5.223488,
-3.638003, 2, -4.964897,
-3.802701, 2, -5.223488,
-3.638003, 3, -4.964897,
-3.802701, 3, -5.223488
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
-4.132095, -3, -5.740671, 0, -0.5, 0.5, 0.5,
-4.132095, -3, -5.740671, 1, -0.5, 0.5, 0.5,
-4.132095, -3, -5.740671, 1, 1.5, 0.5, 0.5,
-4.132095, -3, -5.740671, 0, 1.5, 0.5, 0.5,
-4.132095, -2, -5.740671, 0, -0.5, 0.5, 0.5,
-4.132095, -2, -5.740671, 1, -0.5, 0.5, 0.5,
-4.132095, -2, -5.740671, 1, 1.5, 0.5, 0.5,
-4.132095, -2, -5.740671, 0, 1.5, 0.5, 0.5,
-4.132095, -1, -5.740671, 0, -0.5, 0.5, 0.5,
-4.132095, -1, -5.740671, 1, -0.5, 0.5, 0.5,
-4.132095, -1, -5.740671, 1, 1.5, 0.5, 0.5,
-4.132095, -1, -5.740671, 0, 1.5, 0.5, 0.5,
-4.132095, 0, -5.740671, 0, -0.5, 0.5, 0.5,
-4.132095, 0, -5.740671, 1, -0.5, 0.5, 0.5,
-4.132095, 0, -5.740671, 1, 1.5, 0.5, 0.5,
-4.132095, 0, -5.740671, 0, 1.5, 0.5, 0.5,
-4.132095, 1, -5.740671, 0, -0.5, 0.5, 0.5,
-4.132095, 1, -5.740671, 1, -0.5, 0.5, 0.5,
-4.132095, 1, -5.740671, 1, 1.5, 0.5, 0.5,
-4.132095, 1, -5.740671, 0, 1.5, 0.5, 0.5,
-4.132095, 2, -5.740671, 0, -0.5, 0.5, 0.5,
-4.132095, 2, -5.740671, 1, -0.5, 0.5, 0.5,
-4.132095, 2, -5.740671, 1, 1.5, 0.5, 0.5,
-4.132095, 2, -5.740671, 0, 1.5, 0.5, 0.5,
-4.132095, 3, -5.740671, 0, -0.5, 0.5, 0.5,
-4.132095, 3, -5.740671, 1, -0.5, 0.5, 0.5,
-4.132095, 3, -5.740671, 1, 1.5, 0.5, 0.5,
-4.132095, 3, -5.740671, 0, 1.5, 0.5, 0.5
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
-3.638003, -3.358787, -4,
-3.638003, -3.358787, 4,
-3.638003, -3.358787, -4,
-3.802701, -3.526628, -4,
-3.638003, -3.358787, -2,
-3.802701, -3.526628, -2,
-3.638003, -3.358787, 0,
-3.802701, -3.526628, 0,
-3.638003, -3.358787, 2,
-3.802701, -3.526628, 2,
-3.638003, -3.358787, 4,
-3.802701, -3.526628, 4
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
-4.132095, -3.862311, -4, 0, -0.5, 0.5, 0.5,
-4.132095, -3.862311, -4, 1, -0.5, 0.5, 0.5,
-4.132095, -3.862311, -4, 1, 1.5, 0.5, 0.5,
-4.132095, -3.862311, -4, 0, 1.5, 0.5, 0.5,
-4.132095, -3.862311, -2, 0, -0.5, 0.5, 0.5,
-4.132095, -3.862311, -2, 1, -0.5, 0.5, 0.5,
-4.132095, -3.862311, -2, 1, 1.5, 0.5, 0.5,
-4.132095, -3.862311, -2, 0, 1.5, 0.5, 0.5,
-4.132095, -3.862311, 0, 0, -0.5, 0.5, 0.5,
-4.132095, -3.862311, 0, 1, -0.5, 0.5, 0.5,
-4.132095, -3.862311, 0, 1, 1.5, 0.5, 0.5,
-4.132095, -3.862311, 0, 0, 1.5, 0.5, 0.5,
-4.132095, -3.862311, 2, 0, -0.5, 0.5, 0.5,
-4.132095, -3.862311, 2, 1, -0.5, 0.5, 0.5,
-4.132095, -3.862311, 2, 1, 1.5, 0.5, 0.5,
-4.132095, -3.862311, 2, 0, 1.5, 0.5, 0.5,
-4.132095, -3.862311, 4, 0, -0.5, 0.5, 0.5,
-4.132095, -3.862311, 4, 1, -0.5, 0.5, 0.5,
-4.132095, -3.862311, 4, 1, 1.5, 0.5, 0.5,
-4.132095, -3.862311, 4, 0, 1.5, 0.5, 0.5
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
-3.638003, -3.358787, -4.964897,
-3.638003, 3.354864, -4.964897,
-3.638003, -3.358787, 5.378754,
-3.638003, 3.354864, 5.378754,
-3.638003, -3.358787, -4.964897,
-3.638003, -3.358787, 5.378754,
-3.638003, 3.354864, -4.964897,
-3.638003, 3.354864, 5.378754,
-3.638003, -3.358787, -4.964897,
2.949894, -3.358787, -4.964897,
-3.638003, -3.358787, 5.378754,
2.949894, -3.358787, 5.378754,
-3.638003, 3.354864, -4.964897,
2.949894, 3.354864, -4.964897,
-3.638003, 3.354864, 5.378754,
2.949894, 3.354864, 5.378754,
2.949894, -3.358787, -4.964897,
2.949894, 3.354864, -4.964897,
2.949894, -3.358787, 5.378754,
2.949894, 3.354864, 5.378754,
2.949894, -3.358787, -4.964897,
2.949894, -3.358787, 5.378754,
2.949894, 3.354864, -4.964897,
2.949894, 3.354864, 5.378754
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
var radius = 7.465511;
var distance = 33.2149;
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
mvMatrix.translate( 0.3440545, 0.001961231, -0.2069285 );
mvMatrix.scale( 1.225255, 1.202305, 0.7803683 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.2149);
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
fluquinconazole<-read.table("fluquinconazole.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fluquinconazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'fluquinconazole' not found
```

```r
y<-fluquinconazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'fluquinconazole' not found
```

```r
z<-fluquinconazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'fluquinconazole' not found
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
-3.542063, 0.07751081, -3.040903, 0, 0, 1, 1, 1,
-3.17144, -0.1958982, -3.2897, 1, 0, 0, 1, 1,
-3.103971, -1.011776, -2.48416, 1, 0, 0, 1, 1,
-2.838407, -0.08224016, -1.246709, 1, 0, 0, 1, 1,
-2.828794, 0.2089163, -2.017066, 1, 0, 0, 1, 1,
-2.640172, -0.1420332, -1.596759, 1, 0, 0, 1, 1,
-2.593509, -0.8038446, -1.468873, 0, 0, 0, 1, 1,
-2.484101, -0.5017568, -1.445655, 0, 0, 0, 1, 1,
-2.45844, -1.377767, -2.767743, 0, 0, 0, 1, 1,
-2.408162, 0.1120824, -0.5294352, 0, 0, 0, 1, 1,
-2.250748, 1.372577, -1.270657, 0, 0, 0, 1, 1,
-2.228081, -1.076572, -0.00332849, 0, 0, 0, 1, 1,
-2.208343, 1.468025, -1.328238, 0, 0, 0, 1, 1,
-2.192028, 0.2896298, -3.011425, 1, 1, 1, 1, 1,
-2.181394, -0.4745353, -1.702621, 1, 1, 1, 1, 1,
-2.152667, -0.9496591, -0.9653358, 1, 1, 1, 1, 1,
-2.136347, 1.195228, -1.479038, 1, 1, 1, 1, 1,
-2.106323, -0.1323633, -1.970887, 1, 1, 1, 1, 1,
-2.053355, 0.4648667, -2.21806, 1, 1, 1, 1, 1,
-2.023471, -2.041529, -3.042802, 1, 1, 1, 1, 1,
-2.007695, -1.123603, -1.930755, 1, 1, 1, 1, 1,
-2.005959, -1.869539, -1.956201, 1, 1, 1, 1, 1,
-1.974634, -0.9486813, -1.824849, 1, 1, 1, 1, 1,
-1.973603, -0.4278436, -2.610563, 1, 1, 1, 1, 1,
-1.96486, -0.8641393, -1.814029, 1, 1, 1, 1, 1,
-1.954276, 1.323735, -0.2341786, 1, 1, 1, 1, 1,
-1.936027, 1.218245, -1.242408, 1, 1, 1, 1, 1,
-1.928711, 0.7314286, -2.424051, 1, 1, 1, 1, 1,
-1.912653, 0.2153914, -1.467785, 0, 0, 1, 1, 1,
-1.895703, -0.2268903, -2.285904, 1, 0, 0, 1, 1,
-1.870326, 1.573766, -1.725643, 1, 0, 0, 1, 1,
-1.863936, -0.1601869, -0.4335063, 1, 0, 0, 1, 1,
-1.817831, 1.843316, -2.152671, 1, 0, 0, 1, 1,
-1.804139, 0.7149025, -1.051572, 1, 0, 0, 1, 1,
-1.793118, 0.3355913, -2.980783, 0, 0, 0, 1, 1,
-1.78597, 0.3164496, -2.205184, 0, 0, 0, 1, 1,
-1.780918, 1.400331, -1.046438, 0, 0, 0, 1, 1,
-1.773856, 0.2193581, 0.08975517, 0, 0, 0, 1, 1,
-1.772995, 0.03415775, -2.29701, 0, 0, 0, 1, 1,
-1.734369, 0.01730687, -2.571862, 0, 0, 0, 1, 1,
-1.706875, -1.742539, -2.358896, 0, 0, 0, 1, 1,
-1.703951, -1.371262, -1.674339, 1, 1, 1, 1, 1,
-1.684938, -0.2095897, -2.684966, 1, 1, 1, 1, 1,
-1.667899, 0.4391473, -0.3467804, 1, 1, 1, 1, 1,
-1.662078, -0.5661163, -3.687505, 1, 1, 1, 1, 1,
-1.662019, 0.4419545, -2.482183, 1, 1, 1, 1, 1,
-1.658186, 0.1174428, -1.263399, 1, 1, 1, 1, 1,
-1.655126, 1.488286, -1.305185, 1, 1, 1, 1, 1,
-1.625997, 0.3151737, -0.672825, 1, 1, 1, 1, 1,
-1.612882, 0.6332276, -0.9020966, 1, 1, 1, 1, 1,
-1.604106, -0.1573906, -1.713147, 1, 1, 1, 1, 1,
-1.59323, -3.261015, -2.50983, 1, 1, 1, 1, 1,
-1.581189, -0.7066209, -1.215814, 1, 1, 1, 1, 1,
-1.57813, -0.1126671, -1.017081, 1, 1, 1, 1, 1,
-1.572715, -0.2480665, -3.292535, 1, 1, 1, 1, 1,
-1.56475, 1.514989, -0.4323734, 1, 1, 1, 1, 1,
-1.560423, 0.5936738, -1.189038, 0, 0, 1, 1, 1,
-1.552508, -0.9228514, -0.7294862, 1, 0, 0, 1, 1,
-1.539145, 0.1778071, -1.684619, 1, 0, 0, 1, 1,
-1.529612, 0.5389056, -0.3196014, 1, 0, 0, 1, 1,
-1.525235, 0.6013389, -2.172776, 1, 0, 0, 1, 1,
-1.52328, -0.3480335, -1.489151, 1, 0, 0, 1, 1,
-1.512914, 1.001199, 0.05102352, 0, 0, 0, 1, 1,
-1.494883, 0.4063776, -1.729629, 0, 0, 0, 1, 1,
-1.486139, 0.6775312, -1.414347, 0, 0, 0, 1, 1,
-1.481931, -0.1217886, -1.291596, 0, 0, 0, 1, 1,
-1.466754, -0.2221089, -2.584102, 0, 0, 0, 1, 1,
-1.458643, -1.2632, -2.609282, 0, 0, 0, 1, 1,
-1.452101, -0.2201861, -0.6142191, 0, 0, 0, 1, 1,
-1.450128, 1.357722, -2.18989, 1, 1, 1, 1, 1,
-1.440575, 0.1710906, -1.763726, 1, 1, 1, 1, 1,
-1.434289, -1.422879, -2.787531, 1, 1, 1, 1, 1,
-1.412468, -0.5614923, -1.448244, 1, 1, 1, 1, 1,
-1.411413, -1.377097, -0.6636561, 1, 1, 1, 1, 1,
-1.408712, 0.1325853, -2.167538, 1, 1, 1, 1, 1,
-1.401738, -0.6672363, -3.295419, 1, 1, 1, 1, 1,
-1.401326, 1.251485, -1.09277, 1, 1, 1, 1, 1,
-1.39335, -1.000605, -3.36374, 1, 1, 1, 1, 1,
-1.392474, -1.347834, -1.645976, 1, 1, 1, 1, 1,
-1.389558, -0.5660878, -2.558986, 1, 1, 1, 1, 1,
-1.386565, 0.9812694, 0.5834237, 1, 1, 1, 1, 1,
-1.384322, -0.6864915, -1.541028, 1, 1, 1, 1, 1,
-1.382588, 0.02639784, -2.268189, 1, 1, 1, 1, 1,
-1.382508, -0.1867276, -2.77771, 1, 1, 1, 1, 1,
-1.38167, 0.9248078, 0.8875613, 0, 0, 1, 1, 1,
-1.381124, -0.5650227, -2.39635, 1, 0, 0, 1, 1,
-1.381111, 0.4314274, -0.810506, 1, 0, 0, 1, 1,
-1.37828, -0.05380648, -2.344758, 1, 0, 0, 1, 1,
-1.358898, 0.5358287, -2.037068, 1, 0, 0, 1, 1,
-1.349324, -0.9252102, -2.529116, 1, 0, 0, 1, 1,
-1.341923, 1.019272, -0.1783116, 0, 0, 0, 1, 1,
-1.331622, 0.5975588, -1.433744, 0, 0, 0, 1, 1,
-1.327864, 0.2174617, -1.560805, 0, 0, 0, 1, 1,
-1.321972, -0.5849, -1.924559, 0, 0, 0, 1, 1,
-1.31851, 1.104739, -1.213151, 0, 0, 0, 1, 1,
-1.312971, 0.3532473, -2.214368, 0, 0, 0, 1, 1,
-1.307817, 0.6018505, -1.160323, 0, 0, 0, 1, 1,
-1.302551, -0.5265028, -1.307756, 1, 1, 1, 1, 1,
-1.294329, -0.8307179, -3.601459, 1, 1, 1, 1, 1,
-1.290774, -0.3228198, -1.3569, 1, 1, 1, 1, 1,
-1.284957, 0.6242871, -3.830118, 1, 1, 1, 1, 1,
-1.279088, 0.4471149, -0.5619297, 1, 1, 1, 1, 1,
-1.278299, 0.6591876, -1.358621, 1, 1, 1, 1, 1,
-1.278022, -0.08075609, -2.708299, 1, 1, 1, 1, 1,
-1.277787, 1.401509, -1.089469, 1, 1, 1, 1, 1,
-1.277431, -0.01107316, -0.8155143, 1, 1, 1, 1, 1,
-1.275971, -1.780423, -4.005359, 1, 1, 1, 1, 1,
-1.270411, -1.594276, -2.975864, 1, 1, 1, 1, 1,
-1.265784, -1.207079, -3.088406, 1, 1, 1, 1, 1,
-1.263295, -0.1498435, -2.023187, 1, 1, 1, 1, 1,
-1.262531, 0.6493086, -1.758066, 1, 1, 1, 1, 1,
-1.257276, -2.537347, -2.101249, 1, 1, 1, 1, 1,
-1.255343, -1.336443, -1.670874, 0, 0, 1, 1, 1,
-1.241056, 0.3288339, -1.506742, 1, 0, 0, 1, 1,
-1.239256, 1.69751, -0.6817557, 1, 0, 0, 1, 1,
-1.232075, 1.571796, -1.017603, 1, 0, 0, 1, 1,
-1.223966, -1.217758, -3.407703, 1, 0, 0, 1, 1,
-1.209038, -0.3034703, -1.531007, 1, 0, 0, 1, 1,
-1.18875, 1.648939, -0.6692211, 0, 0, 0, 1, 1,
-1.186329, 1.608879, -2.047859, 0, 0, 0, 1, 1,
-1.181666, -2.550763, -3.035808, 0, 0, 0, 1, 1,
-1.181172, -1.940079, -2.476561, 0, 0, 0, 1, 1,
-1.174253, -1.464374, -3.469714, 0, 0, 0, 1, 1,
-1.173286, 0.2466077, -2.181638, 0, 0, 0, 1, 1,
-1.169366, -0.4863727, -2.415275, 0, 0, 0, 1, 1,
-1.165999, -0.8716938, -2.466547, 1, 1, 1, 1, 1,
-1.16129, 0.1179889, -0.7558652, 1, 1, 1, 1, 1,
-1.160415, 0.8670933, -1.250663, 1, 1, 1, 1, 1,
-1.159871, -0.2858837, -2.22863, 1, 1, 1, 1, 1,
-1.158338, -0.4733717, -1.291097, 1, 1, 1, 1, 1,
-1.143986, -0.9835959, -2.79587, 1, 1, 1, 1, 1,
-1.137293, 0.1046011, -1.774036, 1, 1, 1, 1, 1,
-1.131902, -1.131336, -2.376367, 1, 1, 1, 1, 1,
-1.127108, -1.098247, -2.092829, 1, 1, 1, 1, 1,
-1.120354, -0.7420946, -1.118755, 1, 1, 1, 1, 1,
-1.116854, 0.2772862, -2.092246, 1, 1, 1, 1, 1,
-1.112225, 0.5811693, -0.7881233, 1, 1, 1, 1, 1,
-1.11202, 0.3007055, -1.615685, 1, 1, 1, 1, 1,
-1.106252, -0.3719725, -1.540465, 1, 1, 1, 1, 1,
-1.1053, -0.2199716, -1.395834, 1, 1, 1, 1, 1,
-1.105186, 0.1757385, -2.10652, 0, 0, 1, 1, 1,
-1.098009, 1.730669, -0.1970465, 1, 0, 0, 1, 1,
-1.092884, -0.6506676, -0.3347236, 1, 0, 0, 1, 1,
-1.089787, 1.705538, -0.3217426, 1, 0, 0, 1, 1,
-1.070715, 0.9171031, -0.9091759, 1, 0, 0, 1, 1,
-1.069809, 0.7720971, 1.139406, 1, 0, 0, 1, 1,
-1.066465, -0.9006519, -1.717969, 0, 0, 0, 1, 1,
-1.066421, -0.7657982, -0.5103719, 0, 0, 0, 1, 1,
-1.062782, 1.237554, -1.806184, 0, 0, 0, 1, 1,
-1.059756, 0.2384274, -1.646911, 0, 0, 0, 1, 1,
-1.058801, 0.1190369, -2.075873, 0, 0, 0, 1, 1,
-1.058754, -1.016093, -3.252378, 0, 0, 0, 1, 1,
-1.055075, 0.340728, -1.492518, 0, 0, 0, 1, 1,
-1.047324, 1.352334, -0.8529618, 1, 1, 1, 1, 1,
-1.033423, 1.150889, 0.5485777, 1, 1, 1, 1, 1,
-1.028924, 1.458318, 0.4207395, 1, 1, 1, 1, 1,
-1.02588, 0.2292211, -0.2967331, 1, 1, 1, 1, 1,
-1.022497, 0.2778619, -1.77317, 1, 1, 1, 1, 1,
-1.022109, -1.269975, -1.961703, 1, 1, 1, 1, 1,
-1.007884, -0.1312128, -1.715384, 1, 1, 1, 1, 1,
-1.006967, 0.5662031, -1.587399, 1, 1, 1, 1, 1,
-0.9950542, -0.8095449, -1.235451, 1, 1, 1, 1, 1,
-0.994219, 0.718552, -1.426424, 1, 1, 1, 1, 1,
-0.9926092, -0.09275991, 0.3407403, 1, 1, 1, 1, 1,
-0.9916584, -2.092638, -3.008641, 1, 1, 1, 1, 1,
-0.985451, 1.238114, -0.3098879, 1, 1, 1, 1, 1,
-0.982421, 1.050535, -2.657895, 1, 1, 1, 1, 1,
-0.9819689, 0.2546282, -0.333183, 1, 1, 1, 1, 1,
-0.9799274, 0.6550924, -2.695474, 0, 0, 1, 1, 1,
-0.9750507, 0.5353384, -0.3182406, 1, 0, 0, 1, 1,
-0.9738156, 0.6310629, 0.7679783, 1, 0, 0, 1, 1,
-0.9675056, -0.1698105, -0.2776189, 1, 0, 0, 1, 1,
-0.963375, 1.268301, -1.373003, 1, 0, 0, 1, 1,
-0.9629923, 2.300625, -1.243968, 1, 0, 0, 1, 1,
-0.9558366, -1.420829, -2.646482, 0, 0, 0, 1, 1,
-0.9507294, -1.434874, -2.618349, 0, 0, 0, 1, 1,
-0.9341918, 0.9349861, 0.7619607, 0, 0, 0, 1, 1,
-0.933781, 0.916796, -0.7145824, 0, 0, 0, 1, 1,
-0.924939, -0.619559, -3.360341, 0, 0, 0, 1, 1,
-0.9006574, -0.382683, -3.808917, 0, 0, 0, 1, 1,
-0.8977938, 0.1243327, -2.162449, 0, 0, 0, 1, 1,
-0.8773541, -0.7700405, -1.508589, 1, 1, 1, 1, 1,
-0.875808, -0.2447039, -3.065778, 1, 1, 1, 1, 1,
-0.8710414, -0.1447536, -2.457533, 1, 1, 1, 1, 1,
-0.8542902, -1.117798, -1.613054, 1, 1, 1, 1, 1,
-0.8515472, -0.8628955, -2.959737, 1, 1, 1, 1, 1,
-0.8437677, 0.6492709, 0.09054974, 1, 1, 1, 1, 1,
-0.8434994, 0.6583853, -1.28415, 1, 1, 1, 1, 1,
-0.8429693, 1.266412, -0.259713, 1, 1, 1, 1, 1,
-0.8403322, 1.005347, -0.1380741, 1, 1, 1, 1, 1,
-0.8401415, -0.85614, -0.4974615, 1, 1, 1, 1, 1,
-0.8361166, -0.552479, -2.640013, 1, 1, 1, 1, 1,
-0.8335909, 0.7306546, -0.6689127, 1, 1, 1, 1, 1,
-0.8330828, -0.03409988, -1.539757, 1, 1, 1, 1, 1,
-0.832416, 0.4339947, 0.6109365, 1, 1, 1, 1, 1,
-0.8186118, 0.560472, 0.4025825, 1, 1, 1, 1, 1,
-0.8136687, 1.071919, -2.009392, 0, 0, 1, 1, 1,
-0.8121513, -1.526571, -3.020269, 1, 0, 0, 1, 1,
-0.8106715, -0.4313895, -0.6761243, 1, 0, 0, 1, 1,
-0.8075841, -0.3019564, -3.045923, 1, 0, 0, 1, 1,
-0.8069209, 0.05403513, -0.2896946, 1, 0, 0, 1, 1,
-0.7889102, 0.2979224, -0.8076594, 1, 0, 0, 1, 1,
-0.784599, 0.4550459, -0.793801, 0, 0, 0, 1, 1,
-0.7837799, 1.164361, -0.444425, 0, 0, 0, 1, 1,
-0.7788013, 0.3601044, -1.558972, 0, 0, 0, 1, 1,
-0.7776209, -1.869927, -1.464236, 0, 0, 0, 1, 1,
-0.7706221, -0.3600382, -0.6105831, 0, 0, 0, 1, 1,
-0.7700946, -0.481077, -2.118173, 0, 0, 0, 1, 1,
-0.7685289, -0.4904876, -3.007977, 0, 0, 0, 1, 1,
-0.768249, -0.1411014, -0.7297226, 1, 1, 1, 1, 1,
-0.7675142, 0.08654124, -1.78041, 1, 1, 1, 1, 1,
-0.7667485, 0.06922131, -2.124742, 1, 1, 1, 1, 1,
-0.764628, -0.5953987, -2.261934, 1, 1, 1, 1, 1,
-0.763648, 0.4401771, -1.94399, 1, 1, 1, 1, 1,
-0.7574975, 0.1209063, -0.3381149, 1, 1, 1, 1, 1,
-0.7500558, -0.0260235, -1.971578, 1, 1, 1, 1, 1,
-0.7468368, 0.009674471, -2.288186, 1, 1, 1, 1, 1,
-0.7403316, 0.4596769, -0.5297412, 1, 1, 1, 1, 1,
-0.7342755, -1.96463, -3.493838, 1, 1, 1, 1, 1,
-0.731694, -0.04543229, -0.4721543, 1, 1, 1, 1, 1,
-0.7310964, 0.2706172, -1.396572, 1, 1, 1, 1, 1,
-0.729448, 0.3242249, -2.6942, 1, 1, 1, 1, 1,
-0.7240834, 1.294719, -2.188854, 1, 1, 1, 1, 1,
-0.7238318, -0.3272579, -1.625494, 1, 1, 1, 1, 1,
-0.7205672, 0.01237349, -0.993197, 0, 0, 1, 1, 1,
-0.715973, 0.1774105, -1.211215, 1, 0, 0, 1, 1,
-0.7104586, -2.054315, -2.369187, 1, 0, 0, 1, 1,
-0.7014319, 1.144545, 2.074629, 1, 0, 0, 1, 1,
-0.6969849, -1.080366, -2.294308, 1, 0, 0, 1, 1,
-0.6943969, 0.1568746, -1.447821, 1, 0, 0, 1, 1,
-0.6887131, -0.05919289, 0.08121931, 0, 0, 0, 1, 1,
-0.6861822, -0.2443944, -0.8835185, 0, 0, 0, 1, 1,
-0.6853349, 0.009044924, -2.506704, 0, 0, 0, 1, 1,
-0.6757978, -0.3758876, -0.596017, 0, 0, 0, 1, 1,
-0.6676305, -0.1103923, -3.109682, 0, 0, 0, 1, 1,
-0.6676071, 0.05379229, -2.526207, 0, 0, 0, 1, 1,
-0.6615227, -1.463968, -2.868424, 0, 0, 0, 1, 1,
-0.6554673, -1.064832, -1.169755, 1, 1, 1, 1, 1,
-0.6489161, 0.9529332, 0.7768587, 1, 1, 1, 1, 1,
-0.6486636, 1.478131, 1.012242, 1, 1, 1, 1, 1,
-0.6412414, -2.409661, -2.490362, 1, 1, 1, 1, 1,
-0.6399575, 0.8630316, -0.7857713, 1, 1, 1, 1, 1,
-0.6390345, 0.8761776, -1.742017, 1, 1, 1, 1, 1,
-0.6327863, 0.407893, 1.012413, 1, 1, 1, 1, 1,
-0.6326156, 1.107508, -0.3681372, 1, 1, 1, 1, 1,
-0.6292185, -0.4029227, -0.2940615, 1, 1, 1, 1, 1,
-0.6195169, -0.4729272, -4.66193, 1, 1, 1, 1, 1,
-0.6192309, 0.4361885, 0.02332029, 1, 1, 1, 1, 1,
-0.6077037, -1.863262, -3.721516, 1, 1, 1, 1, 1,
-0.5947899, -1.613214, -2.526355, 1, 1, 1, 1, 1,
-0.5927365, 0.5740786, 0.4901114, 1, 1, 1, 1, 1,
-0.5876178, 0.6851457, -1.810906, 1, 1, 1, 1, 1,
-0.5873975, 0.1215118, -3.215088, 0, 0, 1, 1, 1,
-0.5812292, 0.7882411, 0.6654703, 1, 0, 0, 1, 1,
-0.5771108, 0.1150797, -3.579369, 1, 0, 0, 1, 1,
-0.5768066, -0.5221441, -3.44119, 1, 0, 0, 1, 1,
-0.5676542, 0.05068316, -0.06498056, 1, 0, 0, 1, 1,
-0.5675444, -0.226271, -2.751528, 1, 0, 0, 1, 1,
-0.5670664, -0.875719, -1.464811, 0, 0, 0, 1, 1,
-0.5656529, 0.1888765, -2.435105, 0, 0, 0, 1, 1,
-0.5596157, 0.5353342, 0.7388864, 0, 0, 0, 1, 1,
-0.5588549, -0.005952623, -0.6920232, 0, 0, 0, 1, 1,
-0.5584027, 0.5458662, 0.6723142, 0, 0, 0, 1, 1,
-0.5578788, 0.1337525, -0.8854074, 0, 0, 0, 1, 1,
-0.5573883, 0.2475751, 2.148502, 0, 0, 0, 1, 1,
-0.5567792, 0.3328468, -1.375947, 1, 1, 1, 1, 1,
-0.554084, -0.6821221, -3.450214, 1, 1, 1, 1, 1,
-0.553459, -0.6956838, -2.011718, 1, 1, 1, 1, 1,
-0.5523605, 1.536732, -0.51021, 1, 1, 1, 1, 1,
-0.5521111, -0.6135412, -2.373405, 1, 1, 1, 1, 1,
-0.5488654, -0.57415, -0.9977032, 1, 1, 1, 1, 1,
-0.5461201, 0.3186024, -0.6263248, 1, 1, 1, 1, 1,
-0.5398535, 1.126181, -0.4429483, 1, 1, 1, 1, 1,
-0.5391838, 0.5735358, -0.5578936, 1, 1, 1, 1, 1,
-0.5347228, -0.6534165, -3.314111, 1, 1, 1, 1, 1,
-0.5322171, -0.3772599, -2.40617, 1, 1, 1, 1, 1,
-0.5309533, 0.3826538, -0.5913778, 1, 1, 1, 1, 1,
-0.5294679, -0.3778033, -2.207555, 1, 1, 1, 1, 1,
-0.5274631, 1.361289, -0.09323113, 1, 1, 1, 1, 1,
-0.5273442, 0.07801106, -2.331539, 1, 1, 1, 1, 1,
-0.5253467, -0.6321984, -2.432733, 0, 0, 1, 1, 1,
-0.5244362, -0.1350991, -1.213887, 1, 0, 0, 1, 1,
-0.5235231, -1.036186, -2.96548, 1, 0, 0, 1, 1,
-0.5221374, -0.7827289, -2.352011, 1, 0, 0, 1, 1,
-0.5183596, 0.3693409, -0.6196786, 1, 0, 0, 1, 1,
-0.5122936, -0.1439728, -2.776033, 1, 0, 0, 1, 1,
-0.5116628, 0.03682715, -1.666308, 0, 0, 0, 1, 1,
-0.5009735, -0.02084153, -1.661554, 0, 0, 0, 1, 1,
-0.4994839, -2.253972, -2.649666, 0, 0, 0, 1, 1,
-0.4977343, 0.3447675, -1.228517, 0, 0, 0, 1, 1,
-0.4968855, -1.422478, -4.774634, 0, 0, 0, 1, 1,
-0.4895417, -0.3544951, -2.655981, 0, 0, 0, 1, 1,
-0.4830563, -0.4522121, -1.380079, 0, 0, 0, 1, 1,
-0.481262, -1.133586, -1.414506, 1, 1, 1, 1, 1,
-0.4799002, -0.4895132, -2.151768, 1, 1, 1, 1, 1,
-0.4791632, 1.64523, -1.37229, 1, 1, 1, 1, 1,
-0.4647516, -0.6854617, -2.711962, 1, 1, 1, 1, 1,
-0.4596282, 0.6587889, -0.6806803, 1, 1, 1, 1, 1,
-0.4589881, 1.171543, -0.8322474, 1, 1, 1, 1, 1,
-0.4582656, 0.6495964, 0.7361022, 1, 1, 1, 1, 1,
-0.4582285, 1.211831, -0.7380332, 1, 1, 1, 1, 1,
-0.4546647, -0.7132352, -4.262187, 1, 1, 1, 1, 1,
-0.4507904, -1.302524, -3.94575, 1, 1, 1, 1, 1,
-0.4495992, 0.6376023, -0.1395836, 1, 1, 1, 1, 1,
-0.4465393, 0.01778104, -0.8204656, 1, 1, 1, 1, 1,
-0.4440303, 0.431478, -2.437684, 1, 1, 1, 1, 1,
-0.436585, -0.7670606, -1.307815, 1, 1, 1, 1, 1,
-0.431852, -0.1284049, -1.249163, 1, 1, 1, 1, 1,
-0.429004, 0.7796668, -1.14634, 0, 0, 1, 1, 1,
-0.428906, 0.8713484, 1.647326, 1, 0, 0, 1, 1,
-0.4281121, 0.8240031, -0.7003644, 1, 0, 0, 1, 1,
-0.4277711, 0.5026284, -0.2717386, 1, 0, 0, 1, 1,
-0.4263477, -0.04190559, -0.6016253, 1, 0, 0, 1, 1,
-0.424245, 1.008717, 0.4362388, 1, 0, 0, 1, 1,
-0.4242168, -0.1799959, -0.4857187, 0, 0, 0, 1, 1,
-0.4209154, -0.006164669, -1.535334, 0, 0, 0, 1, 1,
-0.4169212, -0.3987391, -0.3667196, 0, 0, 0, 1, 1,
-0.4142671, -0.2650767, -1.679648, 0, 0, 0, 1, 1,
-0.4134071, 1.319445, -1.016939, 0, 0, 0, 1, 1,
-0.4099768, -0.9825436, -0.5097723, 0, 0, 0, 1, 1,
-0.4064353, 1.629101, 0.3565074, 0, 0, 0, 1, 1,
-0.4053882, -0.3162856, -1.08322, 1, 1, 1, 1, 1,
-0.4023711, -0.5581349, -1.661436, 1, 1, 1, 1, 1,
-0.3983141, 0.01882165, -1.275127, 1, 1, 1, 1, 1,
-0.3974773, 0.05070159, -1.779723, 1, 1, 1, 1, 1,
-0.3906496, 1.300659, -0.2005616, 1, 1, 1, 1, 1,
-0.38085, 0.3391446, -0.04429282, 1, 1, 1, 1, 1,
-0.3807448, 0.9990377, -1.815301, 1, 1, 1, 1, 1,
-0.3804687, 0.2771998, 0.8818764, 1, 1, 1, 1, 1,
-0.3795846, 0.2455257, -1.714536, 1, 1, 1, 1, 1,
-0.3753015, 0.2590879, 1.217822, 1, 1, 1, 1, 1,
-0.3710265, -0.3103181, -2.491012, 1, 1, 1, 1, 1,
-0.357418, 0.142634, -1.007568, 1, 1, 1, 1, 1,
-0.3540238, -0.2740888, -0.6928662, 1, 1, 1, 1, 1,
-0.3479668, -0.6286983, -3.402399, 1, 1, 1, 1, 1,
-0.3478758, 0.4384197, 0.1751237, 1, 1, 1, 1, 1,
-0.3474081, -0.8167704, -2.777599, 0, 0, 1, 1, 1,
-0.3398961, -0.4117886, -1.289252, 1, 0, 0, 1, 1,
-0.3318671, -1.102676, -2.496207, 1, 0, 0, 1, 1,
-0.3230743, 0.9576326, -1.879555, 1, 0, 0, 1, 1,
-0.32139, -1.584312, -4.814261, 1, 0, 0, 1, 1,
-0.3182454, 1.569365, -0.4231755, 1, 0, 0, 1, 1,
-0.3180838, -0.236737, -1.335536, 0, 0, 0, 1, 1,
-0.3174262, -0.651982, -2.588352, 0, 0, 0, 1, 1,
-0.3148022, -0.5558857, -1.782204, 0, 0, 0, 1, 1,
-0.3113047, -0.1585694, -2.364803, 0, 0, 0, 1, 1,
-0.3075291, 2.492557, -1.045604, 0, 0, 0, 1, 1,
-0.3066656, -0.6922365, -2.057527, 0, 0, 0, 1, 1,
-0.3064439, -0.3841794, -3.106801, 0, 0, 0, 1, 1,
-0.3047563, 0.5238848, 0.2513368, 1, 1, 1, 1, 1,
-0.3026147, -0.5791795, -2.128106, 1, 1, 1, 1, 1,
-0.2983982, -0.1132161, -0.3674378, 1, 1, 1, 1, 1,
-0.296574, 1.522169, 0.6018555, 1, 1, 1, 1, 1,
-0.2931311, 0.6645712, -0.2739466, 1, 1, 1, 1, 1,
-0.289945, 0.03853147, -0.8247246, 1, 1, 1, 1, 1,
-0.2882837, -0.5422606, -2.308058, 1, 1, 1, 1, 1,
-0.284719, -0.3388358, -4.023194, 1, 1, 1, 1, 1,
-0.282421, 0.162936, -2.935855, 1, 1, 1, 1, 1,
-0.2814191, 0.6502818, -1.56731, 1, 1, 1, 1, 1,
-0.2794003, 0.4730279, -1.401997, 1, 1, 1, 1, 1,
-0.2770197, -2.601089, -1.442747, 1, 1, 1, 1, 1,
-0.274589, -1.142295, -4.489801, 1, 1, 1, 1, 1,
-0.2738721, 1.471579, -0.5749519, 1, 1, 1, 1, 1,
-0.2730206, -0.1859758, -2.11716, 1, 1, 1, 1, 1,
-0.2705463, -0.4064539, -1.815237, 0, 0, 1, 1, 1,
-0.2703165, 0.02870393, -1.899283, 1, 0, 0, 1, 1,
-0.2701711, -0.134536, -1.373722, 1, 0, 0, 1, 1,
-0.2696933, 1.063696, 0.3869115, 1, 0, 0, 1, 1,
-0.2663615, -0.3171878, -1.538734, 1, 0, 0, 1, 1,
-0.2639606, 0.8766048, 0.2635281, 1, 0, 0, 1, 1,
-0.2635215, 0.1259037, -0.6586875, 0, 0, 0, 1, 1,
-0.2632898, -0.7152752, -3.938323, 0, 0, 0, 1, 1,
-0.2613028, 0.8576512, -2.68745, 0, 0, 0, 1, 1,
-0.2485443, -0.3383768, -1.818739, 0, 0, 0, 1, 1,
-0.244645, 1.1208, -1.467871, 0, 0, 0, 1, 1,
-0.2431875, 0.8877133, 0.7891971, 0, 0, 0, 1, 1,
-0.2424728, -1.682203, -3.077602, 0, 0, 0, 1, 1,
-0.2416456, -0.7593333, -1.159123, 1, 1, 1, 1, 1,
-0.2401467, -0.1177031, -1.412136, 1, 1, 1, 1, 1,
-0.2382684, -0.8830997, -1.369166, 1, 1, 1, 1, 1,
-0.2380062, 0.6437441, -1.179834, 1, 1, 1, 1, 1,
-0.2341967, -0.6516197, -1.30493, 1, 1, 1, 1, 1,
-0.2324544, -1.253129, -3.357261, 1, 1, 1, 1, 1,
-0.230163, 0.7412988, -0.8994127, 1, 1, 1, 1, 1,
-0.2281299, 1.31897, -0.4589155, 1, 1, 1, 1, 1,
-0.2268416, -0.8357484, -1.77415, 1, 1, 1, 1, 1,
-0.2260803, -0.2525738, -3.299935, 1, 1, 1, 1, 1,
-0.2198222, -0.9748933, -1.725592, 1, 1, 1, 1, 1,
-0.2166478, 0.3867117, 0.1802172, 1, 1, 1, 1, 1,
-0.2143675, -0.5192108, -2.081644, 1, 1, 1, 1, 1,
-0.2061869, -0.7024788, -3.669832, 1, 1, 1, 1, 1,
-0.2056122, 1.399359, -0.7336944, 1, 1, 1, 1, 1,
-0.2031154, -0.9027719, -1.969347, 0, 0, 1, 1, 1,
-0.1992702, -2.545783, -3.18884, 1, 0, 0, 1, 1,
-0.1983797, -0.1839565, -2.698952, 1, 0, 0, 1, 1,
-0.196726, -0.4113113, -3.006876, 1, 0, 0, 1, 1,
-0.1961933, -0.07374879, -4.023222, 1, 0, 0, 1, 1,
-0.1950297, -0.8538573, -3.664693, 1, 0, 0, 1, 1,
-0.1915697, 1.286148, -0.5259233, 0, 0, 0, 1, 1,
-0.1910901, 0.5794414, -0.3026112, 0, 0, 0, 1, 1,
-0.1890523, -2.71753, -4.710258, 0, 0, 0, 1, 1,
-0.1843675, -1.948152, -3.137396, 0, 0, 0, 1, 1,
-0.1818714, 2.25129, 0.6196591, 0, 0, 0, 1, 1,
-0.1801983, 0.7488977, 0.5632954, 0, 0, 0, 1, 1,
-0.178457, 0.1037351, -3.248511, 0, 0, 0, 1, 1,
-0.178336, -0.02798635, -3.676532, 1, 1, 1, 1, 1,
-0.1768274, 0.02785978, -1.295112, 1, 1, 1, 1, 1,
-0.172077, -1.186225, -2.649239, 1, 1, 1, 1, 1,
-0.1693073, 0.7095178, 1.57928, 1, 1, 1, 1, 1,
-0.1668414, 1.11343, -1.276562, 1, 1, 1, 1, 1,
-0.1622034, -0.6192912, -3.676129, 1, 1, 1, 1, 1,
-0.1610903, -0.9148494, -2.894787, 1, 1, 1, 1, 1,
-0.1610783, 1.029154, -0.3964589, 1, 1, 1, 1, 1,
-0.1605609, -1.275944, -2.449394, 1, 1, 1, 1, 1,
-0.1596088, -0.5215435, -2.682724, 1, 1, 1, 1, 1,
-0.154506, 0.002718885, -2.891916, 1, 1, 1, 1, 1,
-0.1544713, 0.2273783, -1.206531, 1, 1, 1, 1, 1,
-0.1537814, 0.2344666, -0.3949835, 1, 1, 1, 1, 1,
-0.1536752, 0.08910917, -0.7053444, 1, 1, 1, 1, 1,
-0.1525906, -0.7020231, -2.471044, 1, 1, 1, 1, 1,
-0.1508071, 0.1249589, 1.073721, 0, 0, 1, 1, 1,
-0.1506805, -0.7895606, -2.977725, 1, 0, 0, 1, 1,
-0.1488192, 0.05228973, -0.4434552, 1, 0, 0, 1, 1,
-0.148128, -1.974968, -1.631022, 1, 0, 0, 1, 1,
-0.1439131, -0.2811161, -3.154866, 1, 0, 0, 1, 1,
-0.1427209, -0.2037621, -2.644768, 1, 0, 0, 1, 1,
-0.1427177, 0.3661291, 0.7769656, 0, 0, 0, 1, 1,
-0.1355523, -0.494686, -3.084479, 0, 0, 0, 1, 1,
-0.1339705, -0.1208678, -4.582655, 0, 0, 0, 1, 1,
-0.1328073, -1.123515, -3.228053, 0, 0, 0, 1, 1,
-0.1307084, -1.669858, -3.752294, 0, 0, 0, 1, 1,
-0.1271334, -1.461952, -1.509998, 0, 0, 0, 1, 1,
-0.1245296, -0.5337986, -3.479057, 0, 0, 0, 1, 1,
-0.1210269, -1.066224, -4.120309, 1, 1, 1, 1, 1,
-0.1208473, -0.530059, -2.415983, 1, 1, 1, 1, 1,
-0.1172729, -0.1057617, -0.478521, 1, 1, 1, 1, 1,
-0.1160106, -0.6813716, -1.811825, 1, 1, 1, 1, 1,
-0.1144197, -0.6272148, -3.526595, 1, 1, 1, 1, 1,
-0.1140486, 0.8389099, 0.8735155, 1, 1, 1, 1, 1,
-0.1138329, 0.2017953, -1.021354, 1, 1, 1, 1, 1,
-0.1125661, 0.02251185, -1.711766, 1, 1, 1, 1, 1,
-0.1118327, -0.1295948, -1.982623, 1, 1, 1, 1, 1,
-0.1054149, 0.5659516, 0.6052408, 1, 1, 1, 1, 1,
-0.09781475, 0.4777719, 0.3581238, 1, 1, 1, 1, 1,
-0.09625757, 0.8897298, 0.08406521, 1, 1, 1, 1, 1,
-0.09301993, 0.3232568, -0.3987238, 1, 1, 1, 1, 1,
-0.09059279, -0.2362206, -1.614704, 1, 1, 1, 1, 1,
-0.09018185, 0.3687669, -0.3411807, 1, 1, 1, 1, 1,
-0.0850257, 0.285964, -0.4686332, 0, 0, 1, 1, 1,
-0.08246373, -0.31273, -3.553466, 1, 0, 0, 1, 1,
-0.08222403, -1.052697, -3.325337, 1, 0, 0, 1, 1,
-0.0800238, -0.6157943, -2.555935, 1, 0, 0, 1, 1,
-0.07957163, 1.51198, 0.2042423, 1, 0, 0, 1, 1,
-0.07828145, 0.4040251, 0.9527357, 1, 0, 0, 1, 1,
-0.07678942, -1.624741, -4.653699, 0, 0, 0, 1, 1,
-0.07676256, 0.7121347, -1.062793, 0, 0, 0, 1, 1,
-0.07459657, 1.289738, 0.8237168, 0, 0, 0, 1, 1,
-0.07177453, -0.28016, -3.432969, 0, 0, 0, 1, 1,
-0.0704121, 0.4746746, -1.474135, 0, 0, 0, 1, 1,
-0.06853174, -0.2235803, -2.350888, 0, 0, 0, 1, 1,
-0.06662184, 0.2686602, -0.6192831, 0, 0, 0, 1, 1,
-0.06660639, -0.06421996, -1.490396, 1, 1, 1, 1, 1,
-0.06619053, -0.2742482, -3.736854, 1, 1, 1, 1, 1,
-0.06576484, -1.312081, -2.687625, 1, 1, 1, 1, 1,
-0.05999576, 0.9040164, 0.1228124, 1, 1, 1, 1, 1,
-0.05855494, 0.9473062, 0.7428971, 1, 1, 1, 1, 1,
-0.05490228, 0.2600016, 0.2273763, 1, 1, 1, 1, 1,
-0.05248363, 1.68769, 1.584524, 1, 1, 1, 1, 1,
-0.05179693, 0.3896336, -1.819837, 1, 1, 1, 1, 1,
-0.04590862, 0.4243113, -0.8935096, 1, 1, 1, 1, 1,
-0.03819606, -0.9786481, -3.267463, 1, 1, 1, 1, 1,
-0.03613214, 1.180503, -1.41578, 1, 1, 1, 1, 1,
-0.03147636, -0.8489129, -3.98452, 1, 1, 1, 1, 1,
-0.0309331, 0.8550879, 1.728392, 1, 1, 1, 1, 1,
-0.03054951, 1.280509, -0.8453798, 1, 1, 1, 1, 1,
-0.02995405, -1.62472, -2.780707, 1, 1, 1, 1, 1,
-0.02091198, -0.4351006, -3.344639, 0, 0, 1, 1, 1,
-0.02040113, 1.825092, 0.4135204, 1, 0, 0, 1, 1,
-0.01898044, 0.3940786, -1.204216, 1, 0, 0, 1, 1,
-0.01757797, -1.488627, -2.643434, 1, 0, 0, 1, 1,
-0.01728792, -0.4530305, -3.550439, 1, 0, 0, 1, 1,
-0.01573902, -1.388449, -2.767556, 1, 0, 0, 1, 1,
-0.01436065, 1.031273, 0.7737684, 0, 0, 0, 1, 1,
-0.01400173, -2.239538, -2.765676, 0, 0, 0, 1, 1,
-0.01346437, 0.4738726, -0.552173, 0, 0, 0, 1, 1,
-0.01252785, -0.694071, -4.670013, 0, 0, 0, 1, 1,
-0.01169333, -0.08111953, -1.340487, 0, 0, 0, 1, 1,
0.007211421, -1.582886, 2.953803, 0, 0, 0, 1, 1,
0.008372771, 1.381121, -1.3822, 0, 0, 0, 1, 1,
0.009057567, -0.2847604, 4.222965, 1, 1, 1, 1, 1,
0.0168708, -0.1524573, 4.611069, 1, 1, 1, 1, 1,
0.01695637, 0.4106244, 0.3616213, 1, 1, 1, 1, 1,
0.0200383, -1.488166, 4.117795, 1, 1, 1, 1, 1,
0.02357511, 1.92089, -0.4061613, 1, 1, 1, 1, 1,
0.02902009, -0.4355088, 4.922121, 1, 1, 1, 1, 1,
0.03254294, -0.6752717, 3.651828, 1, 1, 1, 1, 1,
0.03937258, 0.2130896, -0.8096634, 1, 1, 1, 1, 1,
0.03971616, -0.586266, 1.096489, 1, 1, 1, 1, 1,
0.0398321, 2.690126, -0.1810811, 1, 1, 1, 1, 1,
0.04459373, 0.4990547, 0.6005358, 1, 1, 1, 1, 1,
0.0447838, -1.557705, 3.070848, 1, 1, 1, 1, 1,
0.04490821, 0.6317813, -0.8409407, 1, 1, 1, 1, 1,
0.04868402, -0.7148903, 1.664417, 1, 1, 1, 1, 1,
0.05198801, 1.383251, -0.5836026, 1, 1, 1, 1, 1,
0.052534, 1.881373, 1.042304, 0, 0, 1, 1, 1,
0.05374279, 1.668627, -1.843121, 1, 0, 0, 1, 1,
0.05841125, -0.3678374, 2.466881, 1, 0, 0, 1, 1,
0.05896759, 0.6694313, 0.8465199, 1, 0, 0, 1, 1,
0.0613891, -1.191509, 3.690034, 1, 0, 0, 1, 1,
0.06293879, -1.663085, 1.250102, 1, 0, 0, 1, 1,
0.06457213, 0.7871016, 0.9301925, 0, 0, 0, 1, 1,
0.06632391, -0.3470062, 3.196748, 0, 0, 0, 1, 1,
0.07151132, -1.220047, 3.465398, 0, 0, 0, 1, 1,
0.07786084, -2.344402, 3.675307, 0, 0, 0, 1, 1,
0.07937705, 1.255268, 2.17075, 0, 0, 0, 1, 1,
0.07976269, 1.323205, -2.047938, 0, 0, 0, 1, 1,
0.0814193, -1.268996, 4.413352, 0, 0, 0, 1, 1,
0.08512603, 2.129397, -0.155884, 1, 1, 1, 1, 1,
0.09731405, -1.341251, 2.44586, 1, 1, 1, 1, 1,
0.09852801, 0.7583237, -1.189768, 1, 1, 1, 1, 1,
0.09979365, 1.278978, 0.5349247, 1, 1, 1, 1, 1,
0.1021578, -0.1140585, 2.536438, 1, 1, 1, 1, 1,
0.1032696, -1.046391, 3.128591, 1, 1, 1, 1, 1,
0.1064712, -0.1839292, 3.613355, 1, 1, 1, 1, 1,
0.1079972, -0.4596876, 1.722047, 1, 1, 1, 1, 1,
0.1080186, 0.4998889, 1.156451, 1, 1, 1, 1, 1,
0.1117175, 1.130985, 0.01990831, 1, 1, 1, 1, 1,
0.1130448, 1.748214, 0.5216849, 1, 1, 1, 1, 1,
0.1258446, 1.730344, -1.523926, 1, 1, 1, 1, 1,
0.1285801, -0.7422273, 3.177238, 1, 1, 1, 1, 1,
0.1297055, -0.1198839, 1.489452, 1, 1, 1, 1, 1,
0.1331975, 0.639399, -0.3873478, 1, 1, 1, 1, 1,
0.1334143, 1.67328, -0.6941482, 0, 0, 1, 1, 1,
0.1403629, -2.39013, 2.711501, 1, 0, 0, 1, 1,
0.1407928, 2.045794, 0.8273345, 1, 0, 0, 1, 1,
0.1411043, -0.3314794, 3.018013, 1, 0, 0, 1, 1,
0.1416802, -0.8815159, 2.743272, 1, 0, 0, 1, 1,
0.1424528, -0.1439555, 2.574545, 1, 0, 0, 1, 1,
0.1435529, -1.33045, 3.355212, 0, 0, 0, 1, 1,
0.1470025, -0.5155542, 1.463603, 0, 0, 0, 1, 1,
0.1490781, 0.7470113, -0.08110563, 0, 0, 0, 1, 1,
0.1499508, -0.9498525, 5.228118, 0, 0, 0, 1, 1,
0.1507295, 1.016289, 1.133763, 0, 0, 0, 1, 1,
0.1594497, -1.762952, 2.995561, 0, 0, 0, 1, 1,
0.1595567, 0.05357298, 2.75222, 0, 0, 0, 1, 1,
0.1634088, -0.3066067, 2.376764, 1, 1, 1, 1, 1,
0.1651011, -0.2992539, 1.461721, 1, 1, 1, 1, 1,
0.1651892, -0.2175508, -0.2181069, 1, 1, 1, 1, 1,
0.1681132, 1.725474, 0.09088918, 1, 1, 1, 1, 1,
0.1706844, -0.61876, 4.221516, 1, 1, 1, 1, 1,
0.1757571, 0.0464191, 1.977586, 1, 1, 1, 1, 1,
0.1788223, 0.5857998, -0.4753244, 1, 1, 1, 1, 1,
0.1826434, -1.105269, 1.432696, 1, 1, 1, 1, 1,
0.1836647, -1.792665, 2.848999, 1, 1, 1, 1, 1,
0.1839774, -0.89714, 2.62551, 1, 1, 1, 1, 1,
0.1903685, 0.6193495, 0.4657386, 1, 1, 1, 1, 1,
0.1915582, -0.1833641, 1.18737, 1, 1, 1, 1, 1,
0.193483, -0.5187752, 3.901505, 1, 1, 1, 1, 1,
0.1958961, -0.7914135, 4.358655, 1, 1, 1, 1, 1,
0.1965267, 2.455112, 0.3005258, 1, 1, 1, 1, 1,
0.2089796, 1.101268, 0.7582951, 0, 0, 1, 1, 1,
0.2092599, -0.11957, 0.7546344, 1, 0, 0, 1, 1,
0.2093235, -0.3438664, 3.950728, 1, 0, 0, 1, 1,
0.2096814, -0.5285282, 4.260942, 1, 0, 0, 1, 1,
0.2104047, 0.224922, 0.959125, 1, 0, 0, 1, 1,
0.2130289, -1.405359, 4.44735, 1, 0, 0, 1, 1,
0.213494, -0.2640783, 0.9672447, 0, 0, 0, 1, 1,
0.2141296, -0.01083919, 2.246714, 0, 0, 0, 1, 1,
0.215238, -0.3790241, 2.92771, 0, 0, 0, 1, 1,
0.2307015, -0.861087, 1.691761, 0, 0, 0, 1, 1,
0.2309639, 1.217896, 1.377957, 0, 0, 0, 1, 1,
0.2326989, 0.5418404, -1.037606, 0, 0, 0, 1, 1,
0.2360461, -0.5675274, 1.383653, 0, 0, 0, 1, 1,
0.2396221, -0.2882025, 0.3684773, 1, 1, 1, 1, 1,
0.2470169, 0.4375338, 3.157776, 1, 1, 1, 1, 1,
0.247653, 1.13377, 1.746661, 1, 1, 1, 1, 1,
0.251088, -1.055472, 1.963546, 1, 1, 1, 1, 1,
0.2534998, 0.01204828, 1.789838, 1, 1, 1, 1, 1,
0.2537615, -0.5079733, 4.42907, 1, 1, 1, 1, 1,
0.2623694, 0.4752353, -0.09401006, 1, 1, 1, 1, 1,
0.2627102, -0.135051, 2.214942, 1, 1, 1, 1, 1,
0.2640054, -0.7529015, 1.966266, 1, 1, 1, 1, 1,
0.2659042, 0.6986972, 1.442507, 1, 1, 1, 1, 1,
0.2667992, 0.2993172, 0.2873291, 1, 1, 1, 1, 1,
0.267644, -0.5941572, 2.937627, 1, 1, 1, 1, 1,
0.2683359, 0.9487485, 1.337424, 1, 1, 1, 1, 1,
0.2688404, -0.7595804, 2.937977, 1, 1, 1, 1, 1,
0.2702027, -1.591405, 1.730188, 1, 1, 1, 1, 1,
0.2708531, 1.01918, -0.3144903, 0, 0, 1, 1, 1,
0.2711057, 2.290462, -0.388976, 1, 0, 0, 1, 1,
0.2711169, 0.6164385, 0.4370108, 1, 0, 0, 1, 1,
0.2732601, 1.142316, 1.084973, 1, 0, 0, 1, 1,
0.2769228, 0.7744581, -1.044182, 1, 0, 0, 1, 1,
0.2788321, 0.9792297, -0.9942217, 1, 0, 0, 1, 1,
0.2816682, 0.1569326, -0.02935052, 0, 0, 0, 1, 1,
0.2827077, -0.3483878, 2.367421, 0, 0, 0, 1, 1,
0.2907257, -1.134797e-05, 1.371943, 0, 0, 0, 1, 1,
0.2907744, -1.83389, 2.36274, 0, 0, 0, 1, 1,
0.292763, -0.3252424, 2.063221, 0, 0, 0, 1, 1,
0.2976592, -3.084333, 2.722901, 0, 0, 0, 1, 1,
0.2990404, -1.530029, 3.196365, 0, 0, 0, 1, 1,
0.3021042, 0.6642001, -1.363853, 1, 1, 1, 1, 1,
0.3032656, -0.02328272, 1.683023, 1, 1, 1, 1, 1,
0.3071336, -2.486979, 5.033096, 1, 1, 1, 1, 1,
0.3101797, -0.6642347, 3.000305, 1, 1, 1, 1, 1,
0.3104353, 1.250152, 2.305699, 1, 1, 1, 1, 1,
0.3111421, -0.933333, 3.778366, 1, 1, 1, 1, 1,
0.3124421, 0.1140851, 2.560226, 1, 1, 1, 1, 1,
0.3142605, 2.074689, 1.3044, 1, 1, 1, 1, 1,
0.315259, -0.9215084, 1.902033, 1, 1, 1, 1, 1,
0.3177317, 0.06352775, 1.642761, 1, 1, 1, 1, 1,
0.3194215, -0.914584, 1.6389, 1, 1, 1, 1, 1,
0.3207362, 1.978756, 0.557463, 1, 1, 1, 1, 1,
0.3229353, -1.476881, 2.953094, 1, 1, 1, 1, 1,
0.3257287, -0.166007, 1.121836, 1, 1, 1, 1, 1,
0.326676, -0.8161328, 1.750521, 1, 1, 1, 1, 1,
0.335095, 0.142343, 2.354446, 0, 0, 1, 1, 1,
0.3365093, 1.208525, 2.843548, 1, 0, 0, 1, 1,
0.3372362, 0.2808483, 0.5067498, 1, 0, 0, 1, 1,
0.3375774, 1.032563, 0.6116572, 1, 0, 0, 1, 1,
0.343681, -0.1221725, 2.222118, 1, 0, 0, 1, 1,
0.344403, -2.002358, 2.940675, 1, 0, 0, 1, 1,
0.3470999, -1.446227, 3.736975, 0, 0, 0, 1, 1,
0.3489603, -0.7440662, 1.752349, 0, 0, 0, 1, 1,
0.3515119, 0.4920658, 2.213453, 0, 0, 0, 1, 1,
0.3561194, -0.06006377, 2.614348, 0, 0, 0, 1, 1,
0.3571017, 0.2900687, 3.124951, 0, 0, 0, 1, 1,
0.3588088, -0.9439751, 2.037648, 0, 0, 0, 1, 1,
0.359687, -0.6934773, 2.105329, 0, 0, 0, 1, 1,
0.3661223, -0.1148542, 3.136829, 1, 1, 1, 1, 1,
0.3693971, -0.9436632, 2.813671, 1, 1, 1, 1, 1,
0.3720566, -0.0223295, 0.6053478, 1, 1, 1, 1, 1,
0.3735086, -0.755031, 2.426181, 1, 1, 1, 1, 1,
0.3740598, -2.012299, 1.359484, 1, 1, 1, 1, 1,
0.3746158, 0.05897016, 0.7575539, 1, 1, 1, 1, 1,
0.3825811, -0.7524937, 1.531555, 1, 1, 1, 1, 1,
0.3870429, -0.02168723, 0.2246407, 1, 1, 1, 1, 1,
0.3879904, -1.608537, 3.904988, 1, 1, 1, 1, 1,
0.3920843, 2.086985, 0.6802938, 1, 1, 1, 1, 1,
0.3938685, 0.6936218, 2.839314, 1, 1, 1, 1, 1,
0.3941347, -0.3361697, 4.23998, 1, 1, 1, 1, 1,
0.3961747, 0.980776, 1.372053, 1, 1, 1, 1, 1,
0.3990131, -0.1636894, 2.336483, 1, 1, 1, 1, 1,
0.3991153, -0.2154194, 1.959415, 1, 1, 1, 1, 1,
0.3998412, -0.2413389, 3.271418, 0, 0, 1, 1, 1,
0.4007939, -0.1141085, 1.258853, 1, 0, 0, 1, 1,
0.4009288, 1.636015, 0.7110194, 1, 0, 0, 1, 1,
0.4018806, -1.826972, 3.006657, 1, 0, 0, 1, 1,
0.4038728, -0.7350793, 3.131152, 1, 0, 0, 1, 1,
0.4086935, 2.199814, -1.141256, 1, 0, 0, 1, 1,
0.4095795, 0.2287858, 1.9908, 0, 0, 0, 1, 1,
0.4112296, 0.7122675, 1.817071, 0, 0, 0, 1, 1,
0.4164892, -0.03297479, 1.632053, 0, 0, 0, 1, 1,
0.4222314, -0.1786065, 4.010931, 0, 0, 0, 1, 1,
0.4257633, 1.641621, 0.9581195, 0, 0, 0, 1, 1,
0.4273258, 0.390329, 0.8504781, 0, 0, 0, 1, 1,
0.4294029, 0.976765, 0.0976183, 0, 0, 0, 1, 1,
0.4309761, -0.5704748, 2.188829, 1, 1, 1, 1, 1,
0.4312847, 0.2748308, -0.3964196, 1, 1, 1, 1, 1,
0.4327321, -0.3339547, 1.690766, 1, 1, 1, 1, 1,
0.4433431, -0.8421553, 3.955394, 1, 1, 1, 1, 1,
0.4637933, 0.7324706, 2.360136, 1, 1, 1, 1, 1,
0.4725207, -0.9639616, 2.777376, 1, 1, 1, 1, 1,
0.4729893, -0.184635, 2.123829, 1, 1, 1, 1, 1,
0.4743661, -0.862008, 1.677996, 1, 1, 1, 1, 1,
0.4745563, -0.8345211, 1.082818, 1, 1, 1, 1, 1,
0.479122, -0.2738529, 2.692757, 1, 1, 1, 1, 1,
0.4871537, -1.805855, 1.839889, 1, 1, 1, 1, 1,
0.4874975, 1.00321, 0.4604226, 1, 1, 1, 1, 1,
0.4883997, 0.5483009, 0.05652812, 1, 1, 1, 1, 1,
0.4906975, -1.2919, 3.602785, 1, 1, 1, 1, 1,
0.4940777, 0.9453453, -0.4531599, 1, 1, 1, 1, 1,
0.494527, -0.4311738, 2.465148, 0, 0, 1, 1, 1,
0.4964426, -1.27461, 1.935984, 1, 0, 0, 1, 1,
0.4970631, -0.9218708, 2.926814, 1, 0, 0, 1, 1,
0.4975701, 0.5677552, -0.03989406, 1, 0, 0, 1, 1,
0.4998729, -0.0639423, 2.871634, 1, 0, 0, 1, 1,
0.5025734, 0.8974575, 2.49294, 1, 0, 0, 1, 1,
0.5147556, -0.4421723, 1.548901, 0, 0, 0, 1, 1,
0.5156547, 0.2289462, 0.525369, 0, 0, 0, 1, 1,
0.5174786, 1.075216, 1.4527, 0, 0, 0, 1, 1,
0.5266313, -1.39131, 1.98767, 0, 0, 0, 1, 1,
0.5268674, -0.1853434, 0.8932545, 0, 0, 0, 1, 1,
0.5278757, 0.3808071, -0.1788931, 0, 0, 0, 1, 1,
0.529185, -0.5264265, 0.9699681, 0, 0, 0, 1, 1,
0.5297542, -0.6343548, 1.42512, 1, 1, 1, 1, 1,
0.5305029, -0.166636, 2.503814, 1, 1, 1, 1, 1,
0.5380959, -1.653813, 3.378484, 1, 1, 1, 1, 1,
0.5397661, 2.179516, 0.5232092, 1, 1, 1, 1, 1,
0.5399233, 0.7700658, 0.05261758, 1, 1, 1, 1, 1,
0.5437397, 0.8054278, 0.3792304, 1, 1, 1, 1, 1,
0.5437994, 2.123382, 0.5752978, 1, 1, 1, 1, 1,
0.5514926, -0.9774577, 2.307879, 1, 1, 1, 1, 1,
0.5535206, 0.3610748, 0.9328567, 1, 1, 1, 1, 1,
0.5538957, 1.153898, 1.104657, 1, 1, 1, 1, 1,
0.5663205, -0.7075807, 1.746886, 1, 1, 1, 1, 1,
0.5675481, 0.3908365, 0.1659252, 1, 1, 1, 1, 1,
0.571537, -0.6983651, 3.189755, 1, 1, 1, 1, 1,
0.5716029, -1.472706, 1.513111, 1, 1, 1, 1, 1,
0.5741773, -1.678764, 2.435803, 1, 1, 1, 1, 1,
0.5751111, 0.1297449, 2.025339, 0, 0, 1, 1, 1,
0.5765753, 0.5388181, 1.040253, 1, 0, 0, 1, 1,
0.5767614, -0.3384934, 1.449963, 1, 0, 0, 1, 1,
0.5787938, -0.2202388, 3.225518, 1, 0, 0, 1, 1,
0.5823101, -0.9158694, 0.5925393, 1, 0, 0, 1, 1,
0.5862659, 1.050412, -0.3980341, 1, 0, 0, 1, 1,
0.5876293, -1.634377, 2.214938, 0, 0, 0, 1, 1,
0.5909731, -1.015633, 2.492511, 0, 0, 0, 1, 1,
0.5918004, -1.336781, 2.54558, 0, 0, 0, 1, 1,
0.5936332, 0.7424093, 1.697077, 0, 0, 0, 1, 1,
0.5962533, 0.01007711, 0.8183538, 0, 0, 0, 1, 1,
0.6034771, -0.08920994, 1.048861, 0, 0, 0, 1, 1,
0.6049, 1.740582, 0.3528501, 0, 0, 0, 1, 1,
0.607586, -1.239985, 1.787269, 1, 1, 1, 1, 1,
0.6085058, 0.5265545, 2.407943, 1, 1, 1, 1, 1,
0.6105661, 3.257093, 0.8906384, 1, 1, 1, 1, 1,
0.6130689, 0.4650356, 0.3698852, 1, 1, 1, 1, 1,
0.6157888, -0.9524615, 3.016629, 1, 1, 1, 1, 1,
0.6161438, -0.4843098, 4.013648, 1, 1, 1, 1, 1,
0.6219534, -0.7957795, 2.520394, 1, 1, 1, 1, 1,
0.6274891, 2.394233, -0.2757602, 1, 1, 1, 1, 1,
0.6283662, -0.7211981, 0.3777578, 1, 1, 1, 1, 1,
0.632138, -1.415893, 3.395899, 1, 1, 1, 1, 1,
0.6322232, 0.4827319, 1.954594, 1, 1, 1, 1, 1,
0.6359128, 1.70521, -0.1773515, 1, 1, 1, 1, 1,
0.6401004, 0.7083409, 0.6748909, 1, 1, 1, 1, 1,
0.6402031, -0.08580486, 2.951784, 1, 1, 1, 1, 1,
0.642045, 1.079104, 0.2655295, 1, 1, 1, 1, 1,
0.6562741, -0.8960771, 0.3185332, 0, 0, 1, 1, 1,
0.6578252, -0.7164772, 2.862142, 1, 0, 0, 1, 1,
0.6586319, 1.914729, 0.1237763, 1, 0, 0, 1, 1,
0.6598665, -0.325583, 2.979837, 1, 0, 0, 1, 1,
0.6600021, -0.7774776, 0.4604787, 1, 0, 0, 1, 1,
0.664831, 0.7890791, 0.5706409, 1, 0, 0, 1, 1,
0.6651922, -0.1530964, 0.7641013, 0, 0, 0, 1, 1,
0.6655399, 0.4004332, 1.869032, 0, 0, 0, 1, 1,
0.6726562, 1.82122, 1.573437, 0, 0, 0, 1, 1,
0.6752308, 1.150745, 1.345044, 0, 0, 0, 1, 1,
0.6788718, -0.19367, 0.2876427, 0, 0, 0, 1, 1,
0.6831314, 1.498937, 1.466504, 0, 0, 0, 1, 1,
0.6914386, -0.08149762, 2.163582, 0, 0, 0, 1, 1,
0.6921239, -0.2470216, 3.278986, 1, 1, 1, 1, 1,
0.6929004, 0.3326236, 1.099114, 1, 1, 1, 1, 1,
0.6969174, -0.7480046, 3.139919, 1, 1, 1, 1, 1,
0.6978499, -0.2924378, 0.08908888, 1, 1, 1, 1, 1,
0.6998773, 0.2863064, 1.520893, 1, 1, 1, 1, 1,
0.7018047, -0.6402825, 0.7599446, 1, 1, 1, 1, 1,
0.7074437, -2.186302, 2.408121, 1, 1, 1, 1, 1,
0.7175651, -0.3674885, 0.828556, 1, 1, 1, 1, 1,
0.7183692, -0.03844176, 2.082436, 1, 1, 1, 1, 1,
0.7190669, -1.597546, 2.718182, 1, 1, 1, 1, 1,
0.7223873, 1.183385, 0.1711306, 1, 1, 1, 1, 1,
0.7278847, -0.7698565, 2.173376, 1, 1, 1, 1, 1,
0.7281492, 1.442277, -0.3064457, 1, 1, 1, 1, 1,
0.7284014, -0.2855473, 1.235769, 1, 1, 1, 1, 1,
0.7287604, -0.8255463, 4.169768, 1, 1, 1, 1, 1,
0.7292099, 1.3726, -0.2789485, 0, 0, 1, 1, 1,
0.7315908, 0.1451048, 2.321438, 1, 0, 0, 1, 1,
0.7341273, -0.1064464, 2.042732, 1, 0, 0, 1, 1,
0.7367203, 0.1843479, 1.484498, 1, 0, 0, 1, 1,
0.7377508, 0.05311578, 0.8250242, 1, 0, 0, 1, 1,
0.7388785, -1.860841, 3.753269, 1, 0, 0, 1, 1,
0.7423208, 0.8671764, 0.4350984, 0, 0, 0, 1, 1,
0.7458829, -0.1099238, 3.463196, 0, 0, 0, 1, 1,
0.7547356, 1.876671, 1.30164, 0, 0, 0, 1, 1,
0.7553879, 0.9422429, 1.880263, 0, 0, 0, 1, 1,
0.759436, -0.7834561, 2.424828, 0, 0, 0, 1, 1,
0.7636992, 0.5991267, -0.5858545, 0, 0, 0, 1, 1,
0.7646673, 0.7240394, 1.717998, 0, 0, 0, 1, 1,
0.7676407, 0.6032771, 1.660815, 1, 1, 1, 1, 1,
0.7689598, -0.6753101, 0.7238875, 1, 1, 1, 1, 1,
0.7716576, 1.722833, 0.7654284, 1, 1, 1, 1, 1,
0.7744053, -0.1847688, 3.810021, 1, 1, 1, 1, 1,
0.7768491, 0.9782023, 1.012907, 1, 1, 1, 1, 1,
0.7824215, 0.872952, 1.628894, 1, 1, 1, 1, 1,
0.7831581, 0.1575111, 3.105153, 1, 1, 1, 1, 1,
0.7835542, 0.05296646, 1.003357, 1, 1, 1, 1, 1,
0.7837313, 0.132213, 2.172867, 1, 1, 1, 1, 1,
0.7844744, 0.347977, -0.6837863, 1, 1, 1, 1, 1,
0.786608, 0.05504231, 1.386423, 1, 1, 1, 1, 1,
0.7900229, 0.02730655, 1.510588, 1, 1, 1, 1, 1,
0.790478, -0.1651707, 3.006763, 1, 1, 1, 1, 1,
0.7954378, 0.07513207, 0.9449161, 1, 1, 1, 1, 1,
0.7976435, 0.4436231, 1.228016, 1, 1, 1, 1, 1,
0.7997299, 0.2863239, 1.896354, 0, 0, 1, 1, 1,
0.8024673, -0.7016375, 1.44112, 1, 0, 0, 1, 1,
0.8038079, -0.1463696, 0.2992093, 1, 0, 0, 1, 1,
0.8054251, -2.797198, 2.82995, 1, 0, 0, 1, 1,
0.8101774, -1.306638, 2.678822, 1, 0, 0, 1, 1,
0.8130587, -1.709834, 3.521236, 1, 0, 0, 1, 1,
0.813173, -0.6250389, 2.003176, 0, 0, 0, 1, 1,
0.813706, -0.8296193, 3.194666, 0, 0, 0, 1, 1,
0.8183393, 0.2987933, 1.434823, 0, 0, 0, 1, 1,
0.8204033, 0.2991629, 2.872581, 0, 0, 0, 1, 1,
0.8262182, -0.8547496, 2.3834, 0, 0, 0, 1, 1,
0.8262341, -1.408844, 1.701755, 0, 0, 0, 1, 1,
0.8287441, 0.4034648, 0.07558607, 0, 0, 0, 1, 1,
0.8334165, -1.021995, 2.892565, 1, 1, 1, 1, 1,
0.840537, 0.6565143, -0.6065568, 1, 1, 1, 1, 1,
0.8412551, -0.1882981, 0.7966751, 1, 1, 1, 1, 1,
0.8458668, -0.3627154, 3.950745, 1, 1, 1, 1, 1,
0.846193, -0.4147007, 1.985523, 1, 1, 1, 1, 1,
0.8472524, 0.6589901, 2.394354, 1, 1, 1, 1, 1,
0.855951, 0.5676349, -0.04438106, 1, 1, 1, 1, 1,
0.8633932, -0.6269513, 2.847657, 1, 1, 1, 1, 1,
0.8704652, -1.042387, 2.519683, 1, 1, 1, 1, 1,
0.87103, -0.582821, 2.635349, 1, 1, 1, 1, 1,
0.8722357, 0.2469971, 1.847428, 1, 1, 1, 1, 1,
0.8790847, -1.844767, 1.350732, 1, 1, 1, 1, 1,
0.8813469, -0.2485457, 2.340224, 1, 1, 1, 1, 1,
0.8868706, -0.08835039, 1.383568, 1, 1, 1, 1, 1,
0.8908977, 0.4404243, 0.5725703, 1, 1, 1, 1, 1,
0.8980787, -0.8110487, 1.938857, 0, 0, 1, 1, 1,
0.8984903, 0.03187558, 2.77424, 1, 0, 0, 1, 1,
0.8989794, 0.6926542, 1.210978, 1, 0, 0, 1, 1,
0.9002509, 0.8976869, 3.008915, 1, 0, 0, 1, 1,
0.9013646, -0.008745092, 2.487899, 1, 0, 0, 1, 1,
0.9025736, -0.160023, 1.862537, 1, 0, 0, 1, 1,
0.9046931, 0.5517816, 2.12906, 0, 0, 0, 1, 1,
0.9057871, 0.4956237, 0.9182701, 0, 0, 0, 1, 1,
0.9150044, 0.9789039, -0.6843625, 0, 0, 0, 1, 1,
0.9220482, 1.35358, 1.174544, 0, 0, 0, 1, 1,
0.9237235, 1.156134, 1.167049, 0, 0, 0, 1, 1,
0.9266104, 0.8511822, -1.384361, 0, 0, 0, 1, 1,
0.9327767, 1.917451, 0.1412864, 0, 0, 0, 1, 1,
0.9340688, -1.258215, 3.918179, 1, 1, 1, 1, 1,
0.9343927, -0.8415025, 2.052555, 1, 1, 1, 1, 1,
0.93505, 1.325122, 1.164542, 1, 1, 1, 1, 1,
0.9352857, 1.765591, -0.6783938, 1, 1, 1, 1, 1,
0.9492356, 1.576311, -0.3837556, 1, 1, 1, 1, 1,
0.9509109, 0.3802508, 0.6299038, 1, 1, 1, 1, 1,
0.9510976, 0.3481244, 0.7465069, 1, 1, 1, 1, 1,
0.9527001, -0.03595808, 0.3438493, 1, 1, 1, 1, 1,
0.9572222, -0.6672237, 2.242469, 1, 1, 1, 1, 1,
0.960642, 0.4863988, 1.257333, 1, 1, 1, 1, 1,
0.963468, -0.4641105, 2.189794, 1, 1, 1, 1, 1,
0.9661344, 0.7374178, 1.781174, 1, 1, 1, 1, 1,
0.9723051, -0.02310598, 0.1232592, 1, 1, 1, 1, 1,
0.974689, -1.776185, 2.184742, 1, 1, 1, 1, 1,
0.9882106, 0.8746297, -0.9828529, 1, 1, 1, 1, 1,
0.9919872, 0.7018261, 2.086165, 0, 0, 1, 1, 1,
0.993121, -0.1346189, 1.468945, 1, 0, 0, 1, 1,
0.9947965, -0.6653395, 2.930794, 1, 0, 0, 1, 1,
0.9948636, 1.920079, 0.3954859, 1, 0, 0, 1, 1,
0.9957898, -0.8865951, 1.348859, 1, 0, 0, 1, 1,
1.000121, 1.17062, -0.5937487, 1, 0, 0, 1, 1,
1.00335, 0.4203097, 2.40961, 0, 0, 0, 1, 1,
1.006457, 0.2051416, 2.674435, 0, 0, 0, 1, 1,
1.009607, -0.8147828, 2.436689, 0, 0, 0, 1, 1,
1.013758, 1.13009, 1.852825, 0, 0, 0, 1, 1,
1.016779, 0.8510928, 3.431921, 0, 0, 0, 1, 1,
1.017745, -0.3478026, 2.339595, 0, 0, 0, 1, 1,
1.028033, -1.276191, 2.431124, 0, 0, 0, 1, 1,
1.029606, -0.4253905, 4.82907, 1, 1, 1, 1, 1,
1.03191, -0.1910495, 0.4580466, 1, 1, 1, 1, 1,
1.032755, -0.07350856, 1.809737, 1, 1, 1, 1, 1,
1.033911, -0.5606359, 3.431253, 1, 1, 1, 1, 1,
1.034431, -0.7932181, 1.107211, 1, 1, 1, 1, 1,
1.037733, 0.4801725, 1.563553, 1, 1, 1, 1, 1,
1.048051, 0.5065061, 0.387213, 1, 1, 1, 1, 1,
1.051369, -0.6670961, 2.234421, 1, 1, 1, 1, 1,
1.05184, -2.08129, 2.724921, 1, 1, 1, 1, 1,
1.057648, 1.815013, 0.3976777, 1, 1, 1, 1, 1,
1.057833, 0.4041541, -0.9592478, 1, 1, 1, 1, 1,
1.069127, 2.77848, 0.3468468, 1, 1, 1, 1, 1,
1.073053, -0.3977247, 2.662837, 1, 1, 1, 1, 1,
1.074543, -0.4716029, 2.660751, 1, 1, 1, 1, 1,
1.076195, -1.546116, 3.466395, 1, 1, 1, 1, 1,
1.084745, 1.464566, 0.1606617, 0, 0, 1, 1, 1,
1.102047, 0.7523291, 0.8582795, 1, 0, 0, 1, 1,
1.11053, 0.3117483, 1.669426, 1, 0, 0, 1, 1,
1.114344, 0.09203614, 1.728559, 1, 0, 0, 1, 1,
1.137951, -0.1977716, 3.155517, 1, 0, 0, 1, 1,
1.13895, 1.346729, 1.614439, 1, 0, 0, 1, 1,
1.152512, -1.386382, 1.224298, 0, 0, 0, 1, 1,
1.156897, -1.470686, 0.3372008, 0, 0, 0, 1, 1,
1.173622, -0.5520453, 1.48202, 0, 0, 0, 1, 1,
1.186991, 0.4369315, 0.5912462, 0, 0, 0, 1, 1,
1.19718, 0.9669539, 0.3373662, 0, 0, 0, 1, 1,
1.197312, -0.720976, 2.325511, 0, 0, 0, 1, 1,
1.206546, 0.2790984, 0.9717759, 0, 0, 0, 1, 1,
1.208855, 0.7214786, 1.978112, 1, 1, 1, 1, 1,
1.212352, 1.772175, 2.159891, 1, 1, 1, 1, 1,
1.213205, -1.548964, 2.380378, 1, 1, 1, 1, 1,
1.225318, 1.869841, -1.398453, 1, 1, 1, 1, 1,
1.233272, 0.9197923, 0.3067837, 1, 1, 1, 1, 1,
1.233831, 0.2154572, 2.543233, 1, 1, 1, 1, 1,
1.246744, -0.9959244, 0.3922603, 1, 1, 1, 1, 1,
1.247102, -0.3096129, -0.1237739, 1, 1, 1, 1, 1,
1.247942, 0.1576304, 0.4812211, 1, 1, 1, 1, 1,
1.252686, 1.269607, -0.003865501, 1, 1, 1, 1, 1,
1.253735, -0.7641479, 4.21888, 1, 1, 1, 1, 1,
1.254799, -0.919578, 2.182568, 1, 1, 1, 1, 1,
1.257423, 1.619395, 1.049705, 1, 1, 1, 1, 1,
1.260186, 0.6007059, -0.3744438, 1, 1, 1, 1, 1,
1.268737, 0.4457696, 2.062283, 1, 1, 1, 1, 1,
1.274602, 2.258622, -1.700669, 0, 0, 1, 1, 1,
1.27587, 0.2165517, -0.07377788, 1, 0, 0, 1, 1,
1.275937, 0.2517873, 1.62569, 1, 0, 0, 1, 1,
1.277752, -0.07310576, 1.513267, 1, 0, 0, 1, 1,
1.27794, 0.235568, 1.497275, 1, 0, 0, 1, 1,
1.286436, 1.315963, 0.1171065, 1, 0, 0, 1, 1,
1.292098, 0.6006989, -0.009328448, 0, 0, 0, 1, 1,
1.306139, 1.703684, 0.8849761, 0, 0, 0, 1, 1,
1.323124, 1.793059, 0.1091328, 0, 0, 0, 1, 1,
1.330982, 0.3739646, 1.217975, 0, 0, 0, 1, 1,
1.337501, 0.583728, 1.297863, 0, 0, 0, 1, 1,
1.340621, 0.4375211, -0.1375054, 0, 0, 0, 1, 1,
1.345092, 0.3620927, -0.804482, 0, 0, 0, 1, 1,
1.350643, -0.4970611, 2.279644, 1, 1, 1, 1, 1,
1.353484, 0.583093, 0.9206657, 1, 1, 1, 1, 1,
1.373557, -0.5951252, 0.801955, 1, 1, 1, 1, 1,
1.380125, 1.260736, 0.5101811, 1, 1, 1, 1, 1,
1.388066, -0.05626357, 1.131043, 1, 1, 1, 1, 1,
1.390178, -0.7391043, 1.82895, 1, 1, 1, 1, 1,
1.392834, 1.053986, -1.150964, 1, 1, 1, 1, 1,
1.400177, -0.04639676, 1.223665, 1, 1, 1, 1, 1,
1.401053, -0.6730893, 1.259477, 1, 1, 1, 1, 1,
1.406417, 0.08311289, 0.8543361, 1, 1, 1, 1, 1,
1.409401, -0.9682741, 2.693255, 1, 1, 1, 1, 1,
1.415631, 0.493075, 1.538688, 1, 1, 1, 1, 1,
1.419095, 1.216331, -1.188307, 1, 1, 1, 1, 1,
1.425457, 0.9351223, 0.73186, 1, 1, 1, 1, 1,
1.430735, -3.113722, 3.365559, 1, 1, 1, 1, 1,
1.443733, 0.7500692, 2.595144, 0, 0, 1, 1, 1,
1.444472, 0.753856, 2.45487, 1, 0, 0, 1, 1,
1.448612, 0.2898264, 1.358006, 1, 0, 0, 1, 1,
1.476294, -0.4313107, 2.6393, 1, 0, 0, 1, 1,
1.483445, -0.3733333, 2.25139, 1, 0, 0, 1, 1,
1.48373, 0.2904394, 2.918987, 1, 0, 0, 1, 1,
1.485232, 1.299614, 0.4476172, 0, 0, 0, 1, 1,
1.495251, -0.04236315, 2.849432, 0, 0, 0, 1, 1,
1.515939, -1.603407, 1.145502, 0, 0, 0, 1, 1,
1.520367, -0.9098724, 1.616206, 0, 0, 0, 1, 1,
1.521814, -0.7350886, 2.483979, 0, 0, 0, 1, 1,
1.5266, 0.6434173, 2.209492, 0, 0, 0, 1, 1,
1.52754, -0.2408833, 1.641294, 0, 0, 0, 1, 1,
1.529133, 2.180453, -0.1002768, 1, 1, 1, 1, 1,
1.532186, -0.2578749, -0.5701391, 1, 1, 1, 1, 1,
1.543345, -1.568138, 3.210428, 1, 1, 1, 1, 1,
1.559712, 1.601854, 1.64682, 1, 1, 1, 1, 1,
1.561586, -0.8290807, 1.963033, 1, 1, 1, 1, 1,
1.56233, 0.9719128, 0.695669, 1, 1, 1, 1, 1,
1.577788, 1.595942, 1.607008, 1, 1, 1, 1, 1,
1.595268, -0.3972052, 2.663654, 1, 1, 1, 1, 1,
1.612634, 0.8773013, 0.0459566, 1, 1, 1, 1, 1,
1.613344, -0.4314153, 0.6894022, 1, 1, 1, 1, 1,
1.614305, -0.2010934, -0.713324, 1, 1, 1, 1, 1,
1.614848, -0.3014206, 4.045012, 1, 1, 1, 1, 1,
1.622835, -0.982083, 2.711018, 1, 1, 1, 1, 1,
1.632679, -0.4083149, 0.8315568, 1, 1, 1, 1, 1,
1.656827, 1.69908, 1.567276, 1, 1, 1, 1, 1,
1.66792, -0.5024792, 2.126638, 0, 0, 1, 1, 1,
1.690179, -1.173319, 2.071414, 1, 0, 0, 1, 1,
1.698877, -0.3135501, 2.727203, 1, 0, 0, 1, 1,
1.706229, -1.097643, 4.018327, 1, 0, 0, 1, 1,
1.715669, 1.740031, -0.5313872, 1, 0, 0, 1, 1,
1.736519, 1.095405, 2.739738, 1, 0, 0, 1, 1,
1.751737, -0.2891732, 1.621787, 0, 0, 0, 1, 1,
1.755757, 1.022913, 1.477755, 0, 0, 0, 1, 1,
1.763649, -0.5369082, 0.9574063, 0, 0, 0, 1, 1,
1.76488, 0.4953309, 1.993453, 0, 0, 0, 1, 1,
1.769224, -0.1904442, 1.175476, 0, 0, 0, 1, 1,
1.79129, -0.02775339, 1.711004, 0, 0, 0, 1, 1,
1.791803, -1.157354, 1.598718, 0, 0, 0, 1, 1,
1.802415, -0.1879312, 1.696188, 1, 1, 1, 1, 1,
1.812139, -1.48756, 0.6334124, 1, 1, 1, 1, 1,
1.826637, -0.07399947, 1.252847, 1, 1, 1, 1, 1,
1.850901, 1.208452, 2.842304, 1, 1, 1, 1, 1,
1.852107, -1.6057, 2.092909, 1, 1, 1, 1, 1,
1.854612, 0.4665124, 0.7062554, 1, 1, 1, 1, 1,
1.863732, 0.256966, 1.069884, 1, 1, 1, 1, 1,
1.865756, 0.637207, 1.925634, 1, 1, 1, 1, 1,
1.88115, 1.90655, 0.7164527, 1, 1, 1, 1, 1,
1.910179, -0.4606456, 0.9357271, 1, 1, 1, 1, 1,
1.913962, 2.580407, -0.4188011, 1, 1, 1, 1, 1,
1.923522, 0.6217064, 2.4058, 1, 1, 1, 1, 1,
1.932876, -1.64233, 3.021919, 1, 1, 1, 1, 1,
1.935461, -1.269932, 3.809815, 1, 1, 1, 1, 1,
1.96938, 0.493159, 1.652947, 1, 1, 1, 1, 1,
1.972893, -2.198446, 3.933439, 0, 0, 1, 1, 1,
2.052972, 0.9240951, 0.6722787, 1, 0, 0, 1, 1,
2.058734, 1.349884, 1.083916, 1, 0, 0, 1, 1,
2.100737, -1.168634, 2.092783, 1, 0, 0, 1, 1,
2.13943, -0.5376858, 2.018551, 1, 0, 0, 1, 1,
2.149039, -0.2332017, 0.2444548, 1, 0, 0, 1, 1,
2.22369, -0.1787172, 0.5605671, 0, 0, 0, 1, 1,
2.320964, -0.4665246, 1.984322, 0, 0, 0, 1, 1,
2.359717, -0.921885, 4.101913, 0, 0, 0, 1, 1,
2.384998, -1.237233, 0.1971073, 0, 0, 0, 1, 1,
2.410811, -2.31673, -0.04430329, 0, 0, 0, 1, 1,
2.434739, 0.2192897, 1.753542, 0, 0, 0, 1, 1,
2.486322, -0.5146433, 2.983833, 0, 0, 0, 1, 1,
2.524655, 1.313779, 0.8295466, 1, 1, 1, 1, 1,
2.540505, 2.156374, 1.160531, 1, 1, 1, 1, 1,
2.542127, 0.9599956, 1.859882, 1, 1, 1, 1, 1,
2.560788, -0.9704638, 1.607017, 1, 1, 1, 1, 1,
2.687721, 0.80854, 2.227501, 1, 1, 1, 1, 1,
2.705956, 0.8249908, 1.011817, 1, 1, 1, 1, 1,
2.853954, -1.353418, 1.968562, 1, 1, 1, 1, 1
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
var radius = 9.334946;
var distance = 32.7886;
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
mvMatrix.translate( 0.3440543, 0.001961231, -0.2069285 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.7886);
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