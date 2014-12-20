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
-3.624675, 0.3672027, -1.713163, 1, 0, 0, 1,
-3.02838, -0.4281851, -2.112114, 1, 0.007843138, 0, 1,
-2.584033, -0.02642197, -0.9667934, 1, 0.01176471, 0, 1,
-2.527951, -1.368252, -1.61555, 1, 0.01960784, 0, 1,
-2.518975, 0.1851573, -1.576297, 1, 0.02352941, 0, 1,
-2.511785, -0.2649784, -3.401822, 1, 0.03137255, 0, 1,
-2.367, 1.066821, -1.432791, 1, 0.03529412, 0, 1,
-2.322963, -1.234467, -0.5189307, 1, 0.04313726, 0, 1,
-2.226089, 0.4822384, -1.622263, 1, 0.04705882, 0, 1,
-2.190426, -2.077935, -2.313184, 1, 0.05490196, 0, 1,
-2.160205, 1.655549, -0.6749691, 1, 0.05882353, 0, 1,
-2.115494, -1.081649, -2.743048, 1, 0.06666667, 0, 1,
-2.068901, 0.2941115, -0.3553888, 1, 0.07058824, 0, 1,
-2.065015, 1.066433, -2.328744, 1, 0.07843138, 0, 1,
-2.043975, -0.5338452, -2.920377, 1, 0.08235294, 0, 1,
-2.021398, -0.01950494, -2.74011, 1, 0.09019608, 0, 1,
-2.012851, 0.2056947, -2.20402, 1, 0.09411765, 0, 1,
-1.976092, -0.3292691, -2.842633, 1, 0.1019608, 0, 1,
-1.964977, 0.9190241, -0.6177367, 1, 0.1098039, 0, 1,
-1.951913, 1.638965, -1.105301, 1, 0.1137255, 0, 1,
-1.885533, -1.362984, -1.332523, 1, 0.1215686, 0, 1,
-1.883084, -0.4998078, -2.357319, 1, 0.1254902, 0, 1,
-1.87414, 2.307795, -0.6969128, 1, 0.1333333, 0, 1,
-1.869872, 0.1464623, -0.7333704, 1, 0.1372549, 0, 1,
-1.857378, -0.3659201, -1.527535, 1, 0.145098, 0, 1,
-1.856012, 0.1694118, -1.417063, 1, 0.1490196, 0, 1,
-1.835135, 0.7670066, -2.273282, 1, 0.1568628, 0, 1,
-1.80058, -0.618427, -2.274873, 1, 0.1607843, 0, 1,
-1.795067, 0.07562342, -2.059345, 1, 0.1686275, 0, 1,
-1.775889, 1.086073, 0.3679202, 1, 0.172549, 0, 1,
-1.767087, 0.2471365, -1.517039, 1, 0.1803922, 0, 1,
-1.766163, 0.1796293, -3.205631, 1, 0.1843137, 0, 1,
-1.748835, 0.5889835, 0.8459615, 1, 0.1921569, 0, 1,
-1.741863, 1.738914, -1.148705, 1, 0.1960784, 0, 1,
-1.724499, -0.7290571, -2.141056, 1, 0.2039216, 0, 1,
-1.721971, 0.2671538, 1.155092, 1, 0.2117647, 0, 1,
-1.707575, -0.3045983, -2.475535, 1, 0.2156863, 0, 1,
-1.683955, -0.3150655, -0.4613266, 1, 0.2235294, 0, 1,
-1.681265, 0.7585902, -0.05669004, 1, 0.227451, 0, 1,
-1.649722, -0.3186952, -1.710509, 1, 0.2352941, 0, 1,
-1.647854, -0.7584774, -1.269753, 1, 0.2392157, 0, 1,
-1.643686, 1.631665, -0.01557714, 1, 0.2470588, 0, 1,
-1.637137, 1.020374, -1.5596, 1, 0.2509804, 0, 1,
-1.635613, -0.05523736, -1.740907, 1, 0.2588235, 0, 1,
-1.623054, -0.3024956, -1.173909, 1, 0.2627451, 0, 1,
-1.621529, -0.5496636, -0.7817165, 1, 0.2705882, 0, 1,
-1.602674, -1.00734, -3.663693, 1, 0.2745098, 0, 1,
-1.59357, 0.3811542, -3.077152, 1, 0.282353, 0, 1,
-1.592756, 0.02808113, -2.023803, 1, 0.2862745, 0, 1,
-1.565981, 1.089781, -1.765761, 1, 0.2941177, 0, 1,
-1.551907, 0.526922, -0.2014945, 1, 0.3019608, 0, 1,
-1.538477, 1.11232, 0.531481, 1, 0.3058824, 0, 1,
-1.536611, 0.4909507, -0.3244466, 1, 0.3137255, 0, 1,
-1.527233, 0.146184, -2.16257, 1, 0.3176471, 0, 1,
-1.516787, 1.602707, 0.1717592, 1, 0.3254902, 0, 1,
-1.512122, -0.1974442, -2.333026, 1, 0.3294118, 0, 1,
-1.508414, 0.09078979, -1.290059, 1, 0.3372549, 0, 1,
-1.490374, 0.2705244, -0.7553269, 1, 0.3411765, 0, 1,
-1.48934, 1.334925, 0.2496537, 1, 0.3490196, 0, 1,
-1.479905, 0.5717883, -4.567307, 1, 0.3529412, 0, 1,
-1.479652, -1.00015, -2.591598, 1, 0.3607843, 0, 1,
-1.4758, 0.8961476, -1.588587, 1, 0.3647059, 0, 1,
-1.470887, -0.7138032, -2.153387, 1, 0.372549, 0, 1,
-1.462902, 0.1029052, -2.149663, 1, 0.3764706, 0, 1,
-1.455342, 0.0779499, -1.096406, 1, 0.3843137, 0, 1,
-1.452478, -0.1117241, -1.744262, 1, 0.3882353, 0, 1,
-1.4389, -1.206296, -1.652421, 1, 0.3960784, 0, 1,
-1.416306, 0.5656421, -1.536433, 1, 0.4039216, 0, 1,
-1.412466, 0.9930744, -0.6755434, 1, 0.4078431, 0, 1,
-1.407912, -0.7123504, -2.347764, 1, 0.4156863, 0, 1,
-1.407662, -0.4097302, -3.417742, 1, 0.4196078, 0, 1,
-1.387501, -0.6249222, -2.079922, 1, 0.427451, 0, 1,
-1.36829, -0.5968527, -1.10729, 1, 0.4313726, 0, 1,
-1.364076, 2.305275, 0.1760753, 1, 0.4392157, 0, 1,
-1.361503, -0.7600681, -0.9350702, 1, 0.4431373, 0, 1,
-1.347793, -0.142268, -1.753253, 1, 0.4509804, 0, 1,
-1.346249, 0.7504371, -0.2319186, 1, 0.454902, 0, 1,
-1.342724, -2.324346, -3.475261, 1, 0.4627451, 0, 1,
-1.33986, 0.6669225, -1.341995, 1, 0.4666667, 0, 1,
-1.3316, -0.2739729, -1.707952, 1, 0.4745098, 0, 1,
-1.324454, -0.9842119, -2.609598, 1, 0.4784314, 0, 1,
-1.323714, -1.343188, -1.675447, 1, 0.4862745, 0, 1,
-1.308788, -1.667023, -3.713115, 1, 0.4901961, 0, 1,
-1.308561, 0.2155232, -0.3180842, 1, 0.4980392, 0, 1,
-1.30354, -2.278632, -2.581809, 1, 0.5058824, 0, 1,
-1.302605, -2.085901, -2.759708, 1, 0.509804, 0, 1,
-1.288273, 0.2281937, -1.520274, 1, 0.5176471, 0, 1,
-1.283844, 2.450136, -1.366213, 1, 0.5215687, 0, 1,
-1.281658, -0.6955627, -2.290425, 1, 0.5294118, 0, 1,
-1.279169, -1.086026, -2.257122, 1, 0.5333334, 0, 1,
-1.27366, 0.391856, -1.003779, 1, 0.5411765, 0, 1,
-1.271198, 0.9335871, -1.737819, 1, 0.5450981, 0, 1,
-1.262928, 1.281118, 0.530587, 1, 0.5529412, 0, 1,
-1.251861, -0.06265721, -0.4184224, 1, 0.5568628, 0, 1,
-1.250729, 0.09340329, -3.029672, 1, 0.5647059, 0, 1,
-1.249837, 0.5389632, -1.001767, 1, 0.5686275, 0, 1,
-1.247761, 2.055029, -2.374006, 1, 0.5764706, 0, 1,
-1.243319, -2.041348, -4.51461, 1, 0.5803922, 0, 1,
-1.243109, -0.7599797, -2.413605, 1, 0.5882353, 0, 1,
-1.239902, 0.4100054, -0.6362197, 1, 0.5921569, 0, 1,
-1.239129, -1.538452, -2.384784, 1, 0.6, 0, 1,
-1.237693, -1.03527, -1.615508, 1, 0.6078432, 0, 1,
-1.237147, -0.4371207, -4.060482, 1, 0.6117647, 0, 1,
-1.235869, 0.2000756, -2.310308, 1, 0.6196079, 0, 1,
-1.20577, 0.427196, -2.697596, 1, 0.6235294, 0, 1,
-1.20083, 0.7255998, -1.177929, 1, 0.6313726, 0, 1,
-1.200258, 1.093505, -0.3474469, 1, 0.6352941, 0, 1,
-1.19916, -0.9616081, -2.710604, 1, 0.6431373, 0, 1,
-1.194945, 0.214475, -0.02846529, 1, 0.6470588, 0, 1,
-1.186717, -0.6551633, -0.0391899, 1, 0.654902, 0, 1,
-1.182593, -0.8308652, -1.012391, 1, 0.6588235, 0, 1,
-1.178285, -0.693268, -0.8280413, 1, 0.6666667, 0, 1,
-1.172464, -0.5062026, -0.9974629, 1, 0.6705883, 0, 1,
-1.156803, 0.2310687, -1.071164, 1, 0.6784314, 0, 1,
-1.145833, 1.150571, -0.5567658, 1, 0.682353, 0, 1,
-1.144231, -0.1332829, -1.494118, 1, 0.6901961, 0, 1,
-1.143069, 1.068245, 1.386686, 1, 0.6941177, 0, 1,
-1.135768, 0.2932354, -1.159479, 1, 0.7019608, 0, 1,
-1.135403, -1.382505, -2.636748, 1, 0.7098039, 0, 1,
-1.132042, 0.7598345, -1.660811, 1, 0.7137255, 0, 1,
-1.131734, 1.055688, -1.732428, 1, 0.7215686, 0, 1,
-1.12885, -1.40886, -1.575768, 1, 0.7254902, 0, 1,
-1.117488, -0.8159572, -3.251559, 1, 0.7333333, 0, 1,
-1.114795, 1.017227, -2.398238, 1, 0.7372549, 0, 1,
-1.11421, -1.343882, -1.511336, 1, 0.7450981, 0, 1,
-1.109974, -0.3994996, -1.4281, 1, 0.7490196, 0, 1,
-1.105902, -1.049896, -2.713593, 1, 0.7568628, 0, 1,
-1.101032, 0.3781804, 0.5592765, 1, 0.7607843, 0, 1,
-1.10058, -0.0926112, -0.8172342, 1, 0.7686275, 0, 1,
-1.097544, -1.490291, -1.146705, 1, 0.772549, 0, 1,
-1.096463, -0.1167922, -0.0854345, 1, 0.7803922, 0, 1,
-1.079978, 0.6091979, -2.528847, 1, 0.7843137, 0, 1,
-1.0771, 0.4499437, 0.7566718, 1, 0.7921569, 0, 1,
-1.070562, 0.2678011, -1.382833, 1, 0.7960784, 0, 1,
-1.062411, -0.5902935, -2.149597, 1, 0.8039216, 0, 1,
-1.057042, -0.4896789, 0.4115526, 1, 0.8117647, 0, 1,
-1.053457, -0.3062932, -1.943202, 1, 0.8156863, 0, 1,
-1.047511, 0.4360505, -1.946581, 1, 0.8235294, 0, 1,
-1.044574, 0.8592588, 0.1558145, 1, 0.827451, 0, 1,
-1.044274, 0.9818729, -2.393704, 1, 0.8352941, 0, 1,
-1.043497, -1.425736, -1.434396, 1, 0.8392157, 0, 1,
-1.041571, -0.00965789, -0.5303613, 1, 0.8470588, 0, 1,
-1.039116, 0.4714442, -2.766332, 1, 0.8509804, 0, 1,
-1.035259, -0.07680735, -2.344633, 1, 0.8588235, 0, 1,
-1.030208, -0.5205874, -2.975701, 1, 0.8627451, 0, 1,
-1.02674, 1.304292, -0.2237844, 1, 0.8705882, 0, 1,
-1.01444, -0.4503135, -2.225202, 1, 0.8745098, 0, 1,
-1.008725, 0.4606703, -1.182665, 1, 0.8823529, 0, 1,
-1.004994, -0.5636999, -1.292022, 1, 0.8862745, 0, 1,
-0.9949536, -0.1197805, -2.709369, 1, 0.8941177, 0, 1,
-0.9935166, 1.665355, -1.025075, 1, 0.8980392, 0, 1,
-0.9918789, 0.05998809, -0.1941623, 1, 0.9058824, 0, 1,
-0.9875135, 0.6627542, 0.5852852, 1, 0.9137255, 0, 1,
-0.9869047, -0.003398077, -1.793871, 1, 0.9176471, 0, 1,
-0.9862831, 0.6800448, -0.9488893, 1, 0.9254902, 0, 1,
-0.9820815, -0.08585596, -0.3071543, 1, 0.9294118, 0, 1,
-0.9801663, -1.422207, -2.822853, 1, 0.9372549, 0, 1,
-0.9767792, 0.03357914, -2.678637, 1, 0.9411765, 0, 1,
-0.9723486, -0.8454693, -0.7669801, 1, 0.9490196, 0, 1,
-0.9681653, 0.5759556, 0.7432754, 1, 0.9529412, 0, 1,
-0.9643822, -0.4624115, -4.253875, 1, 0.9607843, 0, 1,
-0.9643475, 0.4421412, 0.5588881, 1, 0.9647059, 0, 1,
-0.9586283, -0.6029518, -2.89772, 1, 0.972549, 0, 1,
-0.9580782, 0.5233007, -0.8290878, 1, 0.9764706, 0, 1,
-0.9554215, 0.2611383, -2.200649, 1, 0.9843137, 0, 1,
-0.9518899, 0.01376109, -1.056924, 1, 0.9882353, 0, 1,
-0.9514703, 0.02412436, -1.375999, 1, 0.9960784, 0, 1,
-0.9501998, -0.1688592, -0.7802196, 0.9960784, 1, 0, 1,
-0.9470016, -0.03330338, -1.906889, 0.9921569, 1, 0, 1,
-0.942885, -0.9904894, -1.591779, 0.9843137, 1, 0, 1,
-0.9399744, 0.202477, -1.758306, 0.9803922, 1, 0, 1,
-0.9379108, -0.9658809, -1.910647, 0.972549, 1, 0, 1,
-0.937355, 0.6923881, -0.01061851, 0.9686275, 1, 0, 1,
-0.9344955, 1.408258, -0.4354148, 0.9607843, 1, 0, 1,
-0.9319749, 1.416832, -0.8954854, 0.9568627, 1, 0, 1,
-0.9306067, -1.566932, -3.589691, 0.9490196, 1, 0, 1,
-0.9298083, -0.6597734, -0.4113857, 0.945098, 1, 0, 1,
-0.9297542, -1.162681, -1.326603, 0.9372549, 1, 0, 1,
-0.9214216, 0.7279563, -2.805002, 0.9333333, 1, 0, 1,
-0.9207004, 0.9644216, -1.581275, 0.9254902, 1, 0, 1,
-0.9115905, 0.1169628, -2.047246, 0.9215686, 1, 0, 1,
-0.9093983, 0.5750309, -0.2912489, 0.9137255, 1, 0, 1,
-0.9086322, 0.4795182, -0.9485689, 0.9098039, 1, 0, 1,
-0.9072735, -0.8254642, -2.948719, 0.9019608, 1, 0, 1,
-0.90596, -0.4258232, -1.906405, 0.8941177, 1, 0, 1,
-0.9025538, 0.6770568, -2.731778, 0.8901961, 1, 0, 1,
-0.8839219, -0.711382, -1.466895, 0.8823529, 1, 0, 1,
-0.8803568, 2.019425, 0.4639566, 0.8784314, 1, 0, 1,
-0.870429, -2.164166, -1.438921, 0.8705882, 1, 0, 1,
-0.8694046, 1.464185, -0.5400723, 0.8666667, 1, 0, 1,
-0.8685464, -1.372862, -1.681343, 0.8588235, 1, 0, 1,
-0.8648083, -2.014831, -1.64991, 0.854902, 1, 0, 1,
-0.8553938, 1.225921, -0.9358411, 0.8470588, 1, 0, 1,
-0.8537987, 1.069754, -0.4372866, 0.8431373, 1, 0, 1,
-0.8531418, -1.334173, -2.853353, 0.8352941, 1, 0, 1,
-0.8528861, -0.3939915, -0.6109192, 0.8313726, 1, 0, 1,
-0.852865, -1.364004, -1.502802, 0.8235294, 1, 0, 1,
-0.8523667, 0.8516448, -0.03129797, 0.8196079, 1, 0, 1,
-0.8482985, -0.7067368, -2.008123, 0.8117647, 1, 0, 1,
-0.8451213, 0.1565069, -0.5744454, 0.8078431, 1, 0, 1,
-0.8444859, -0.9956165, 0.9424629, 0.8, 1, 0, 1,
-0.8380463, -0.1212457, -1.890727, 0.7921569, 1, 0, 1,
-0.8379412, -1.159845, -3.092665, 0.7882353, 1, 0, 1,
-0.8343867, 0.4829459, -1.423724, 0.7803922, 1, 0, 1,
-0.8341366, 0.02813543, -0.3113833, 0.7764706, 1, 0, 1,
-0.8339611, -0.8650283, -3.878818, 0.7686275, 1, 0, 1,
-0.8294254, 0.04627942, -3.076598, 0.7647059, 1, 0, 1,
-0.8265216, 2.718034, -0.6798538, 0.7568628, 1, 0, 1,
-0.8163841, -0.6066197, -1.499685, 0.7529412, 1, 0, 1,
-0.8143476, -0.7189826, -1.474247, 0.7450981, 1, 0, 1,
-0.8130804, 1.981648, -0.9303976, 0.7411765, 1, 0, 1,
-0.8120291, 0.3699413, -0.7915466, 0.7333333, 1, 0, 1,
-0.812004, -0.6394748, -1.213365, 0.7294118, 1, 0, 1,
-0.8058391, -0.5404682, -2.284787, 0.7215686, 1, 0, 1,
-0.8031006, -1.213459, -2.375195, 0.7176471, 1, 0, 1,
-0.8025173, -0.3585546, -1.506901, 0.7098039, 1, 0, 1,
-0.7901747, 1.645142, -2.161024, 0.7058824, 1, 0, 1,
-0.789982, -1.340363, -2.932029, 0.6980392, 1, 0, 1,
-0.7895094, 1.632478, 0.5415187, 0.6901961, 1, 0, 1,
-0.7815992, 0.5203411, -0.8412899, 0.6862745, 1, 0, 1,
-0.7717426, -2.295192, -3.813539, 0.6784314, 1, 0, 1,
-0.7667607, 0.3542023, 0.5731574, 0.6745098, 1, 0, 1,
-0.7662469, 0.4762329, -2.098628, 0.6666667, 1, 0, 1,
-0.7650816, -0.5327083, -0.8243601, 0.6627451, 1, 0, 1,
-0.7568454, -0.533332, -1.22534, 0.654902, 1, 0, 1,
-0.7530358, 1.211891, -0.7781009, 0.6509804, 1, 0, 1,
-0.7514617, -0.3680926, -0.4767844, 0.6431373, 1, 0, 1,
-0.7476808, -1.220571, -3.413587, 0.6392157, 1, 0, 1,
-0.7441398, -0.1878781, -3.044888, 0.6313726, 1, 0, 1,
-0.7420739, -0.4414518, -2.999804, 0.627451, 1, 0, 1,
-0.7383267, -0.1057271, -0.9508159, 0.6196079, 1, 0, 1,
-0.7379537, 0.3643802, -2.954748, 0.6156863, 1, 0, 1,
-0.7263973, -0.8429262, -1.725452, 0.6078432, 1, 0, 1,
-0.7150909, -1.884959, -1.965603, 0.6039216, 1, 0, 1,
-0.7133408, 1.511217, -1.527922, 0.5960785, 1, 0, 1,
-0.7115723, 1.48838, -1.825441, 0.5882353, 1, 0, 1,
-0.7105599, -1.423712, -4.002677, 0.5843138, 1, 0, 1,
-0.7098835, -0.1759899, -0.744074, 0.5764706, 1, 0, 1,
-0.6991681, 0.3692195, 0.002061773, 0.572549, 1, 0, 1,
-0.6826388, 0.196528, 0.639155, 0.5647059, 1, 0, 1,
-0.6784981, 2.29296, 0.3376348, 0.5607843, 1, 0, 1,
-0.6705034, -0.3553275, -1.062108, 0.5529412, 1, 0, 1,
-0.6682785, 0.4189675, -1.685633, 0.5490196, 1, 0, 1,
-0.6682065, -0.618086, -3.843812, 0.5411765, 1, 0, 1,
-0.6670716, -0.2112693, -1.90511, 0.5372549, 1, 0, 1,
-0.6621685, 2.061813, -0.6630923, 0.5294118, 1, 0, 1,
-0.6616136, 0.3884964, -0.5672317, 0.5254902, 1, 0, 1,
-0.6537517, -1.117588, -2.700325, 0.5176471, 1, 0, 1,
-0.6505249, -0.802368, -1.512774, 0.5137255, 1, 0, 1,
-0.6386306, -0.3164072, -2.109009, 0.5058824, 1, 0, 1,
-0.6373398, 0.02332694, -0.09937797, 0.5019608, 1, 0, 1,
-0.6357311, -1.171269, -4.902313, 0.4941176, 1, 0, 1,
-0.6305844, 1.967467, -0.8633727, 0.4862745, 1, 0, 1,
-0.6289437, 0.2667846, 1.193932, 0.4823529, 1, 0, 1,
-0.6244315, 0.7782383, -1.860908, 0.4745098, 1, 0, 1,
-0.6229291, -0.8333322, -2.540623, 0.4705882, 1, 0, 1,
-0.6217804, 1.201386, 0.0629051, 0.4627451, 1, 0, 1,
-0.6180112, -0.7690893, -3.373051, 0.4588235, 1, 0, 1,
-0.6158004, -0.2690996, -1.370147, 0.4509804, 1, 0, 1,
-0.6084098, -1.453125, -3.732177, 0.4470588, 1, 0, 1,
-0.6070995, 0.3810849, -0.5437921, 0.4392157, 1, 0, 1,
-0.603613, 0.6736629, -0.6991933, 0.4352941, 1, 0, 1,
-0.6009167, 1.049869, -0.07863851, 0.427451, 1, 0, 1,
-0.6007636, -0.4134074, -1.523365, 0.4235294, 1, 0, 1,
-0.5999068, 0.4856086, -1.083393, 0.4156863, 1, 0, 1,
-0.5959369, -1.513675, -2.213929, 0.4117647, 1, 0, 1,
-0.5955341, -0.8995556, -1.288152, 0.4039216, 1, 0, 1,
-0.5916744, -0.7056506, -1.729889, 0.3960784, 1, 0, 1,
-0.59071, 0.09616366, -0.9818679, 0.3921569, 1, 0, 1,
-0.5902719, -0.4162084, -1.639384, 0.3843137, 1, 0, 1,
-0.589238, -0.7436866, -3.259519, 0.3803922, 1, 0, 1,
-0.5887233, -1.412513, -2.434313, 0.372549, 1, 0, 1,
-0.5848671, 0.7112823, 0.4231201, 0.3686275, 1, 0, 1,
-0.5815731, -0.3830912, -3.212942, 0.3607843, 1, 0, 1,
-0.5809427, -0.204581, -0.9641721, 0.3568628, 1, 0, 1,
-0.5711677, -0.6426601, -1.395163, 0.3490196, 1, 0, 1,
-0.5582264, 0.03747638, -2.106282, 0.345098, 1, 0, 1,
-0.5575572, -0.8758606, -5.393117, 0.3372549, 1, 0, 1,
-0.5567966, 0.6180472, -0.02511736, 0.3333333, 1, 0, 1,
-0.5468405, -2.166776, -1.687714, 0.3254902, 1, 0, 1,
-0.5446459, -0.1025344, -2.264956, 0.3215686, 1, 0, 1,
-0.5417616, -0.2876671, -3.437088, 0.3137255, 1, 0, 1,
-0.540875, 1.202475, -0.5179432, 0.3098039, 1, 0, 1,
-0.5397812, 0.7575024, -2.767541, 0.3019608, 1, 0, 1,
-0.5357931, 0.4715099, -1.695066, 0.2941177, 1, 0, 1,
-0.5303457, -2.265215, -3.317314, 0.2901961, 1, 0, 1,
-0.5200534, -0.6970661, -2.383605, 0.282353, 1, 0, 1,
-0.5183717, 1.133484, 0.8898938, 0.2784314, 1, 0, 1,
-0.5167728, -1.476477, -3.394993, 0.2705882, 1, 0, 1,
-0.5124658, -0.8307192, -3.667198, 0.2666667, 1, 0, 1,
-0.5119303, 0.8203322, -1.004807, 0.2588235, 1, 0, 1,
-0.5105199, 1.192641, -0.6719419, 0.254902, 1, 0, 1,
-0.5065389, 0.7873956, -2.498732, 0.2470588, 1, 0, 1,
-0.5052078, -0.6080627, -3.749981, 0.2431373, 1, 0, 1,
-0.503618, -0.2364569, -2.918332, 0.2352941, 1, 0, 1,
-0.4983444, 0.6056786, -0.09730084, 0.2313726, 1, 0, 1,
-0.4905207, -3.474902, -2.276031, 0.2235294, 1, 0, 1,
-0.4888958, -0.9675068, -3.036707, 0.2196078, 1, 0, 1,
-0.4868812, 1.661507, -0.01287391, 0.2117647, 1, 0, 1,
-0.4858213, -0.4720695, -1.849747, 0.2078431, 1, 0, 1,
-0.4834334, -0.6248903, -2.787455, 0.2, 1, 0, 1,
-0.4809158, -1.102948, -2.28655, 0.1921569, 1, 0, 1,
-0.4798048, 1.236336, 0.6458798, 0.1882353, 1, 0, 1,
-0.4767474, -1.332006, -4.163099, 0.1803922, 1, 0, 1,
-0.4743092, 0.7458735, 0.122665, 0.1764706, 1, 0, 1,
-0.4730407, 1.055975, -1.96778, 0.1686275, 1, 0, 1,
-0.4712826, 0.8032756, -0.3773913, 0.1647059, 1, 0, 1,
-0.464891, 0.3770577, -3.345978, 0.1568628, 1, 0, 1,
-0.4610034, -0.6485127, -2.834404, 0.1529412, 1, 0, 1,
-0.4473158, 0.5994555, -0.6286204, 0.145098, 1, 0, 1,
-0.4419148, -2.111709, -3.256314, 0.1411765, 1, 0, 1,
-0.4394452, -0.5908416, -4.389904, 0.1333333, 1, 0, 1,
-0.4383276, -1.32664, -3.657872, 0.1294118, 1, 0, 1,
-0.437427, -0.8087817, -1.067705, 0.1215686, 1, 0, 1,
-0.4297466, -0.9526092, -2.818079, 0.1176471, 1, 0, 1,
-0.4278381, -0.6452429, -2.082329, 0.1098039, 1, 0, 1,
-0.424817, -1.42, -1.770564, 0.1058824, 1, 0, 1,
-0.423158, -0.8300561, -1.554329, 0.09803922, 1, 0, 1,
-0.420423, 2.307473, -0.8493714, 0.09019608, 1, 0, 1,
-0.4159206, 0.5161365, -0.4185622, 0.08627451, 1, 0, 1,
-0.4151343, 0.3756865, -0.2225649, 0.07843138, 1, 0, 1,
-0.4137553, 0.2287069, -0.00466291, 0.07450981, 1, 0, 1,
-0.4037146, -0.6710952, 0.6977112, 0.06666667, 1, 0, 1,
-0.4026188, -1.351865, -3.955188, 0.0627451, 1, 0, 1,
-0.4016547, -0.3852234, -0.8156496, 0.05490196, 1, 0, 1,
-0.4015783, -0.005696779, -1.020211, 0.05098039, 1, 0, 1,
-0.3997315, -1.089821, -1.851698, 0.04313726, 1, 0, 1,
-0.3989819, 0.4811141, -1.171984, 0.03921569, 1, 0, 1,
-0.3982377, -0.3644181, -3.637562, 0.03137255, 1, 0, 1,
-0.3965402, 0.5288984, -1.592924, 0.02745098, 1, 0, 1,
-0.3931113, 0.2783368, -0.6669859, 0.01960784, 1, 0, 1,
-0.3920871, 0.4364026, -0.05949644, 0.01568628, 1, 0, 1,
-0.3873846, -0.006827182, 2.101172, 0.007843138, 1, 0, 1,
-0.3861924, 0.9178963, 1.349198, 0.003921569, 1, 0, 1,
-0.3855186, -1.130396, -0.7557624, 0, 1, 0.003921569, 1,
-0.3831768, -0.5287164, -3.829634, 0, 1, 0.01176471, 1,
-0.3805833, 0.1495235, -1.775273, 0, 1, 0.01568628, 1,
-0.3795242, 0.04305818, -1.186861, 0, 1, 0.02352941, 1,
-0.3788846, -1.940744, -2.540214, 0, 1, 0.02745098, 1,
-0.3772127, 0.824603, 0.04871596, 0, 1, 0.03529412, 1,
-0.3767879, 0.1037536, 0.6076056, 0, 1, 0.03921569, 1,
-0.3760274, 1.094978, -0.257607, 0, 1, 0.04705882, 1,
-0.3759902, 0.4414154, -2.014024, 0, 1, 0.05098039, 1,
-0.3700474, 1.678679, -1.049364, 0, 1, 0.05882353, 1,
-0.3644564, 1.544787, 1.073331, 0, 1, 0.0627451, 1,
-0.3602125, 1.423891, -1.630102, 0, 1, 0.07058824, 1,
-0.359887, -0.4864616, -1.273509, 0, 1, 0.07450981, 1,
-0.3566127, 0.179732, -1.649493, 0, 1, 0.08235294, 1,
-0.356286, -0.1308237, -2.249348, 0, 1, 0.08627451, 1,
-0.3555819, 0.2825488, 0.02516509, 0, 1, 0.09411765, 1,
-0.3499521, -1.436054, -1.261135, 0, 1, 0.1019608, 1,
-0.3466578, -0.5723658, -2.505277, 0, 1, 0.1058824, 1,
-0.3457636, 1.585597, -1.291798, 0, 1, 0.1137255, 1,
-0.3403338, -0.37761, -2.039646, 0, 1, 0.1176471, 1,
-0.3395522, 0.6917588, -0.6461446, 0, 1, 0.1254902, 1,
-0.3390989, 1.628324, -0.09943262, 0, 1, 0.1294118, 1,
-0.3347611, -0.6924016, -1.752044, 0, 1, 0.1372549, 1,
-0.3324881, 0.8206124, -0.3985431, 0, 1, 0.1411765, 1,
-0.3310192, -1.340556, -0.6688564, 0, 1, 0.1490196, 1,
-0.3309078, 0.5800568, 0.2155251, 0, 1, 0.1529412, 1,
-0.3296846, -0.1930023, -2.030009, 0, 1, 0.1607843, 1,
-0.3280888, 0.8837771, -0.5403486, 0, 1, 0.1647059, 1,
-0.3247988, 0.2252265, -0.9063752, 0, 1, 0.172549, 1,
-0.3209394, -1.056926, -1.206672, 0, 1, 0.1764706, 1,
-0.3165554, -0.08286542, -1.649339, 0, 1, 0.1843137, 1,
-0.3138227, -0.7207985, -2.649671, 0, 1, 0.1882353, 1,
-0.3094195, -1.715325, -2.324253, 0, 1, 0.1960784, 1,
-0.3079517, -0.9395735, -2.251272, 0, 1, 0.2039216, 1,
-0.2981783, 0.2548034, -1.423928, 0, 1, 0.2078431, 1,
-0.2964089, -0.05340362, -3.381467, 0, 1, 0.2156863, 1,
-0.2935718, -1.075875, -5.274823, 0, 1, 0.2196078, 1,
-0.2877038, -1.759369, -3.664289, 0, 1, 0.227451, 1,
-0.2867236, -0.4465251, -3.216922, 0, 1, 0.2313726, 1,
-0.283932, -0.8886767, -1.414287, 0, 1, 0.2392157, 1,
-0.2826853, 0.3254859, -0.5622929, 0, 1, 0.2431373, 1,
-0.2824682, -1.147615, -2.187144, 0, 1, 0.2509804, 1,
-0.2794272, -0.4196766, -2.812862, 0, 1, 0.254902, 1,
-0.2771655, -0.2497642, -3.434959, 0, 1, 0.2627451, 1,
-0.2741999, 1.51832, 0.1776132, 0, 1, 0.2666667, 1,
-0.2718258, -0.5330016, -1.716435, 0, 1, 0.2745098, 1,
-0.271558, -1.062624, -4.738702, 0, 1, 0.2784314, 1,
-0.2684857, 0.196775, -0.3130724, 0, 1, 0.2862745, 1,
-0.2683164, 0.5370536, 0.4170102, 0, 1, 0.2901961, 1,
-0.2663026, 0.4708197, -0.7219812, 0, 1, 0.2980392, 1,
-0.2662809, -0.4136191, -4.633251, 0, 1, 0.3058824, 1,
-0.261296, 0.4762401, 0.4890893, 0, 1, 0.3098039, 1,
-0.2572133, 0.2090615, -1.252885, 0, 1, 0.3176471, 1,
-0.2531553, -0.1419908, -3.959506, 0, 1, 0.3215686, 1,
-0.2515703, -0.5631052, -1.650977, 0, 1, 0.3294118, 1,
-0.2506916, -0.2382636, -2.304369, 0, 1, 0.3333333, 1,
-0.2487842, 0.1014851, 0.1498129, 0, 1, 0.3411765, 1,
-0.2487601, 0.2119579, 0.7823956, 0, 1, 0.345098, 1,
-0.2478106, -0.1255724, -0.396448, 0, 1, 0.3529412, 1,
-0.2439949, -0.3968018, -1.787127, 0, 1, 0.3568628, 1,
-0.2405887, 0.09495127, -0.761222, 0, 1, 0.3647059, 1,
-0.2347838, 0.2256002, -1.289036, 0, 1, 0.3686275, 1,
-0.2347784, 0.5064917, -0.9155164, 0, 1, 0.3764706, 1,
-0.2328141, -0.7701072, -2.387785, 0, 1, 0.3803922, 1,
-0.2320494, -1.30795, -0.3815368, 0, 1, 0.3882353, 1,
-0.2227985, -0.4398443, -2.501173, 0, 1, 0.3921569, 1,
-0.2193526, -1.372869, -2.177871, 0, 1, 0.4, 1,
-0.21905, -0.3307242, -2.764187, 0, 1, 0.4078431, 1,
-0.211236, 0.3198666, -0.7023221, 0, 1, 0.4117647, 1,
-0.2088223, 0.9666179, 0.3323845, 0, 1, 0.4196078, 1,
-0.2081674, -0.4296887, -2.019586, 0, 1, 0.4235294, 1,
-0.2056485, -1.25088, -3.77227, 0, 1, 0.4313726, 1,
-0.2049972, 0.8052878, -2.493531, 0, 1, 0.4352941, 1,
-0.1999442, 0.2310981, -1.981549, 0, 1, 0.4431373, 1,
-0.1965786, 0.1256503, -0.02088757, 0, 1, 0.4470588, 1,
-0.195099, -0.4005798, -2.540311, 0, 1, 0.454902, 1,
-0.1891064, 0.3729292, -0.8018543, 0, 1, 0.4588235, 1,
-0.1829657, 0.2623837, -0.4405895, 0, 1, 0.4666667, 1,
-0.1803879, 0.4300102, 0.7387152, 0, 1, 0.4705882, 1,
-0.1752084, 0.9481412, -1.539868, 0, 1, 0.4784314, 1,
-0.1735816, 1.617895, -1.362302, 0, 1, 0.4823529, 1,
-0.1694488, 1.321579, -0.02937776, 0, 1, 0.4901961, 1,
-0.169319, -0.5246022, -3.369219, 0, 1, 0.4941176, 1,
-0.1688493, -0.4388075, -3.815674, 0, 1, 0.5019608, 1,
-0.168122, 1.086316, -0.8667282, 0, 1, 0.509804, 1,
-0.1667556, -0.9754207, -4.182311, 0, 1, 0.5137255, 1,
-0.1633394, 0.910351, -0.7290595, 0, 1, 0.5215687, 1,
-0.1625852, -1.134064, -2.592049, 0, 1, 0.5254902, 1,
-0.1605583, -0.06356429, -1.366007, 0, 1, 0.5333334, 1,
-0.1552797, -0.2635929, -2.491901, 0, 1, 0.5372549, 1,
-0.1542589, 2.183116, -0.1521305, 0, 1, 0.5450981, 1,
-0.1537897, -0.3277245, -3.313263, 0, 1, 0.5490196, 1,
-0.1514193, -0.1467593, -1.895788, 0, 1, 0.5568628, 1,
-0.1498053, -0.2208948, -1.43391, 0, 1, 0.5607843, 1,
-0.1479068, 2.309423, 0.2526156, 0, 1, 0.5686275, 1,
-0.1449208, 0.4168897, -2.096873, 0, 1, 0.572549, 1,
-0.141231, -0.9259256, -2.881673, 0, 1, 0.5803922, 1,
-0.1397357, 0.7707421, 0.6748843, 0, 1, 0.5843138, 1,
-0.1334379, 1.112905, -0.4918818, 0, 1, 0.5921569, 1,
-0.1318076, -0.0813401, -1.747659, 0, 1, 0.5960785, 1,
-0.1299428, -1.891714, -4.503525, 0, 1, 0.6039216, 1,
-0.1294821, -0.8102202, -1.750537, 0, 1, 0.6117647, 1,
-0.1206371, -0.2915015, -1.696938, 0, 1, 0.6156863, 1,
-0.1204213, 0.6420949, 0.06626679, 0, 1, 0.6235294, 1,
-0.1106073, -0.1560816, -2.493418, 0, 1, 0.627451, 1,
-0.1081694, -0.7602614, -3.143304, 0, 1, 0.6352941, 1,
-0.1076463, 1.692334, -1.303395, 0, 1, 0.6392157, 1,
-0.107215, 2.361847, 0.1107638, 0, 1, 0.6470588, 1,
-0.1024716, -1.777342, -3.55964, 0, 1, 0.6509804, 1,
-0.09683542, -1.196337, -5.081928, 0, 1, 0.6588235, 1,
-0.09443903, 1.540038, 1.09506, 0, 1, 0.6627451, 1,
-0.09337835, 0.4606135, -0.1629115, 0, 1, 0.6705883, 1,
-0.09303006, 0.5506223, -1.128759, 0, 1, 0.6745098, 1,
-0.09116781, 0.4192712, -0.4394776, 0, 1, 0.682353, 1,
-0.08757631, -0.2248804, -4.610209, 0, 1, 0.6862745, 1,
-0.08513058, 0.2319019, 0.1067928, 0, 1, 0.6941177, 1,
-0.08290691, 1.530284, 0.7555287, 0, 1, 0.7019608, 1,
-0.07900826, 0.08305984, -0.5891688, 0, 1, 0.7058824, 1,
-0.07659454, -0.8973633, -2.149616, 0, 1, 0.7137255, 1,
-0.07421181, 0.271699, -2.417353, 0, 1, 0.7176471, 1,
-0.07014243, -0.7337092, -3.667709, 0, 1, 0.7254902, 1,
-0.06631138, -1.553949, -1.525281, 0, 1, 0.7294118, 1,
-0.06599645, 2.446827, 0.377736, 0, 1, 0.7372549, 1,
-0.0592848, 1.146737, -0.4592507, 0, 1, 0.7411765, 1,
-0.05808214, 1.662678, 1.364651, 0, 1, 0.7490196, 1,
-0.05774818, 2.004842, -0.6514952, 0, 1, 0.7529412, 1,
-0.04320848, -1.577916, -3.776009, 0, 1, 0.7607843, 1,
-0.04295835, 0.2384277, -0.7890961, 0, 1, 0.7647059, 1,
-0.04110693, 0.7615823, -0.6341811, 0, 1, 0.772549, 1,
-0.04105961, 1.606853, 0.09631609, 0, 1, 0.7764706, 1,
-0.03644167, 0.2803086, -1.015789, 0, 1, 0.7843137, 1,
-0.03410232, 0.2578968, -0.7415803, 0, 1, 0.7882353, 1,
-0.02948393, 0.4612774, 0.1555714, 0, 1, 0.7960784, 1,
-0.02511356, 0.1987317, -1.145166, 0, 1, 0.8039216, 1,
-0.02181928, -0.6190289, -1.583309, 0, 1, 0.8078431, 1,
-0.0214233, -0.2517157, -3.550745, 0, 1, 0.8156863, 1,
-0.02122119, 0.9606416, -1.445813, 0, 1, 0.8196079, 1,
-0.02113865, 0.8421167, -1.150159, 0, 1, 0.827451, 1,
-0.02108633, 0.6668363, 1.495412, 0, 1, 0.8313726, 1,
-0.01875491, 0.2192087, -0.9156296, 0, 1, 0.8392157, 1,
-0.01765426, 0.7787938, -0.008265408, 0, 1, 0.8431373, 1,
-0.01385579, -0.6576777, -3.979018, 0, 1, 0.8509804, 1,
-0.01222347, 0.3868157, 0.1618016, 0, 1, 0.854902, 1,
-0.009383119, 0.1432368, -0.7138541, 0, 1, 0.8627451, 1,
-0.006377713, 1.129519, -1.801766, 0, 1, 0.8666667, 1,
-0.002886427, 1.132085, -0.1198182, 0, 1, 0.8745098, 1,
0.008394198, -0.8383493, 4.886024, 0, 1, 0.8784314, 1,
0.009113491, -0.009752052, 2.034114, 0, 1, 0.8862745, 1,
0.01107617, 0.1942331, -0.9764869, 0, 1, 0.8901961, 1,
0.0128607, 2.024473, 0.02052192, 0, 1, 0.8980392, 1,
0.01312714, -0.5416217, 2.870684, 0, 1, 0.9058824, 1,
0.01650895, 0.4960816, -0.7004731, 0, 1, 0.9098039, 1,
0.01685985, -0.6524231, 4.839812, 0, 1, 0.9176471, 1,
0.01788975, 0.6529167, -0.06406242, 0, 1, 0.9215686, 1,
0.02386527, -1.12987, 3.421458, 0, 1, 0.9294118, 1,
0.02570579, -1.455683, 2.785221, 0, 1, 0.9333333, 1,
0.03617208, -0.5741029, 4.414799, 0, 1, 0.9411765, 1,
0.03788428, -0.647889, 2.729299, 0, 1, 0.945098, 1,
0.03924806, 0.6244237, -1.13155, 0, 1, 0.9529412, 1,
0.03955767, 0.06970897, 0.1791709, 0, 1, 0.9568627, 1,
0.04621638, 0.05595426, 0.7699084, 0, 1, 0.9647059, 1,
0.05289946, -1.080181, 2.531105, 0, 1, 0.9686275, 1,
0.06129238, 0.358569, 1.476363, 0, 1, 0.9764706, 1,
0.0629928, -0.8684107, 1.678661, 0, 1, 0.9803922, 1,
0.06761499, 0.02834766, 0.793973, 0, 1, 0.9882353, 1,
0.07079356, -0.3794181, 3.946363, 0, 1, 0.9921569, 1,
0.07473004, -1.533879, 2.621289, 0, 1, 1, 1,
0.07630211, -0.2048196, 2.398174, 0, 0.9921569, 1, 1,
0.07830629, -0.5589165, 2.565703, 0, 0.9882353, 1, 1,
0.08014612, 0.8680441, -0.2413664, 0, 0.9803922, 1, 1,
0.08606211, 0.8909671, 1.348321, 0, 0.9764706, 1, 1,
0.08763132, 0.3031631, 2.613822, 0, 0.9686275, 1, 1,
0.0888368, 0.2872204, 0.9010822, 0, 0.9647059, 1, 1,
0.09016744, -0.897202, 1.621677, 0, 0.9568627, 1, 1,
0.09051704, -1.634331, 3.154066, 0, 0.9529412, 1, 1,
0.09252678, 1.928223, -0.03951146, 0, 0.945098, 1, 1,
0.09634069, 0.1235461, -0.5570573, 0, 0.9411765, 1, 1,
0.09999642, 0.9723336, -0.2520657, 0, 0.9333333, 1, 1,
0.1000018, -0.6675704, 3.120739, 0, 0.9294118, 1, 1,
0.1018972, -0.1110144, 0.8477386, 0, 0.9215686, 1, 1,
0.1033832, 0.1495817, 1.358075, 0, 0.9176471, 1, 1,
0.1036411, 0.4182619, -0.7073052, 0, 0.9098039, 1, 1,
0.1058345, 1.475373, 0.1274026, 0, 0.9058824, 1, 1,
0.1061509, 1.157998, -0.2018051, 0, 0.8980392, 1, 1,
0.1074456, 0.575581, -0.3295408, 0, 0.8901961, 1, 1,
0.1075928, -0.4563607, 2.962157, 0, 0.8862745, 1, 1,
0.1097636, -0.9046069, 2.91186, 0, 0.8784314, 1, 1,
0.1123108, -0.6810844, 4.36626, 0, 0.8745098, 1, 1,
0.1124255, -0.5288131, 2.804131, 0, 0.8666667, 1, 1,
0.115609, -0.09112234, 3.652353, 0, 0.8627451, 1, 1,
0.1185628, 0.8916754, -0.4251871, 0, 0.854902, 1, 1,
0.1213539, -1.191922, 3.170118, 0, 0.8509804, 1, 1,
0.1223652, -1.178321, 4.182991, 0, 0.8431373, 1, 1,
0.1231249, 1.225391, 1.826168, 0, 0.8392157, 1, 1,
0.1242218, 0.001447138, -0.0318928, 0, 0.8313726, 1, 1,
0.1255095, -0.7551485, 3.639111, 0, 0.827451, 1, 1,
0.1262251, 0.5973072, 1.366082, 0, 0.8196079, 1, 1,
0.1274154, -1.319951, 1.666447, 0, 0.8156863, 1, 1,
0.1307402, -0.7057084, 2.777151, 0, 0.8078431, 1, 1,
0.1311742, -1.249397, 4.014528, 0, 0.8039216, 1, 1,
0.1367256, -1.584475, 2.445144, 0, 0.7960784, 1, 1,
0.1401934, -0.7298942, 3.620732, 0, 0.7882353, 1, 1,
0.1413858, -0.9024207, 2.679777, 0, 0.7843137, 1, 1,
0.1478714, -0.5460412, 1.305689, 0, 0.7764706, 1, 1,
0.1523404, -0.1394902, 1.915849, 0, 0.772549, 1, 1,
0.1526669, 1.195642, 1.690587, 0, 0.7647059, 1, 1,
0.1548253, -0.4347537, 3.50615, 0, 0.7607843, 1, 1,
0.1608049, 1.422491, 1.741924, 0, 0.7529412, 1, 1,
0.1629653, -0.1297281, 1.769882, 0, 0.7490196, 1, 1,
0.1645665, -2.53195, 2.124588, 0, 0.7411765, 1, 1,
0.1670267, 0.152836, 0.7871443, 0, 0.7372549, 1, 1,
0.1723152, 1.105184, 1.919223, 0, 0.7294118, 1, 1,
0.1756435, 0.3253388, 0.9769722, 0, 0.7254902, 1, 1,
0.1828793, 1.368466, 0.4869618, 0, 0.7176471, 1, 1,
0.1844876, 0.278973, 1.017083, 0, 0.7137255, 1, 1,
0.1899981, -0.3503274, 3.71646, 0, 0.7058824, 1, 1,
0.1924374, 0.07103602, 0.7336485, 0, 0.6980392, 1, 1,
0.1924669, 0.00317928, 3.359048, 0, 0.6941177, 1, 1,
0.1931976, -0.8031163, 4.575329, 0, 0.6862745, 1, 1,
0.1946229, 0.04604527, -0.2612817, 0, 0.682353, 1, 1,
0.1955683, -1.200358, 3.749111, 0, 0.6745098, 1, 1,
0.1962683, 1.279252, 0.623441, 0, 0.6705883, 1, 1,
0.1970055, -1.357503, 2.68949, 0, 0.6627451, 1, 1,
0.1994148, -1.34919, 4.416751, 0, 0.6588235, 1, 1,
0.2062813, -0.5042592, 3.400205, 0, 0.6509804, 1, 1,
0.2071275, -0.5194312, 1.232189, 0, 0.6470588, 1, 1,
0.208833, -0.4310747, 1.195922, 0, 0.6392157, 1, 1,
0.2115917, -0.05807159, 2.689027, 0, 0.6352941, 1, 1,
0.2120169, 0.9408625, -0.1709606, 0, 0.627451, 1, 1,
0.2123812, -0.9938806, 0.3059316, 0, 0.6235294, 1, 1,
0.2127265, -0.03885955, 1.026379, 0, 0.6156863, 1, 1,
0.2139873, 0.971131, 0.5160043, 0, 0.6117647, 1, 1,
0.2140078, -2.351563, 3.120525, 0, 0.6039216, 1, 1,
0.2177286, -1.044936, 2.907226, 0, 0.5960785, 1, 1,
0.2207005, 1.482989, 0.9764025, 0, 0.5921569, 1, 1,
0.2208722, -1.707327, 2.572157, 0, 0.5843138, 1, 1,
0.2284738, 0.7619361, -0.6681327, 0, 0.5803922, 1, 1,
0.2307329, -0.4659153, 2.57843, 0, 0.572549, 1, 1,
0.2308578, -0.5489948, 2.181807, 0, 0.5686275, 1, 1,
0.2332286, 0.3146126, 1.851617, 0, 0.5607843, 1, 1,
0.2373028, -1.011806, 2.545211, 0, 0.5568628, 1, 1,
0.2400491, 1.731239, -0.3575515, 0, 0.5490196, 1, 1,
0.2440853, -0.5933136, 2.068488, 0, 0.5450981, 1, 1,
0.2463985, 1.130091, 1.057925, 0, 0.5372549, 1, 1,
0.2498395, -1.054102, 2.952034, 0, 0.5333334, 1, 1,
0.2505328, -0.8375419, 2.769855, 0, 0.5254902, 1, 1,
0.2507689, 0.9168469, -0.3526433, 0, 0.5215687, 1, 1,
0.25989, -1.907674, 4.065273, 0, 0.5137255, 1, 1,
0.2605174, -0.7115057, 2.256985, 0, 0.509804, 1, 1,
0.2611322, 0.7417478, 0.5214642, 0, 0.5019608, 1, 1,
0.2618535, 1.450029, -0.8320534, 0, 0.4941176, 1, 1,
0.2656421, -0.5765861, 4.682839, 0, 0.4901961, 1, 1,
0.2681377, -0.612952, 3.047304, 0, 0.4823529, 1, 1,
0.2708054, 0.5799811, -1.064994, 0, 0.4784314, 1, 1,
0.2732031, 0.6823817, -0.6213077, 0, 0.4705882, 1, 1,
0.2746767, -0.2616791, 2.222382, 0, 0.4666667, 1, 1,
0.2748358, 0.505444, 0.3307537, 0, 0.4588235, 1, 1,
0.2754146, 1.220608, 0.07533912, 0, 0.454902, 1, 1,
0.2763637, 0.3932608, 0.3815607, 0, 0.4470588, 1, 1,
0.2767923, 1.079917, 0.09070588, 0, 0.4431373, 1, 1,
0.2855544, 0.3232206, 0.00836571, 0, 0.4352941, 1, 1,
0.2863235, -2.662546, 4.771559, 0, 0.4313726, 1, 1,
0.2879775, 0.0610901, 1.940982, 0, 0.4235294, 1, 1,
0.2914112, -0.7777486, 2.878604, 0, 0.4196078, 1, 1,
0.2915184, -0.5710816, 2.802379, 0, 0.4117647, 1, 1,
0.2956416, 0.2187052, 1.192366, 0, 0.4078431, 1, 1,
0.2985827, 0.01099994, 1.965046, 0, 0.4, 1, 1,
0.3012105, 0.7188396, -2.50618, 0, 0.3921569, 1, 1,
0.3039497, -0.1485735, 3.16136, 0, 0.3882353, 1, 1,
0.3067574, 0.4170768, 1.100022, 0, 0.3803922, 1, 1,
0.3087309, 0.9253692, 0.2809598, 0, 0.3764706, 1, 1,
0.3119579, 0.3100887, 0.06177154, 0, 0.3686275, 1, 1,
0.312397, 1.221187, 1.414495, 0, 0.3647059, 1, 1,
0.3152309, -0.4448147, 0.3065159, 0, 0.3568628, 1, 1,
0.331624, -0.8497859, 3.792352, 0, 0.3529412, 1, 1,
0.3319084, -1.880515, 2.984081, 0, 0.345098, 1, 1,
0.3343803, 1.069791, -0.08426811, 0, 0.3411765, 1, 1,
0.3373775, 0.09623732, 2.282722, 0, 0.3333333, 1, 1,
0.3424884, 0.410917, 0.3162179, 0, 0.3294118, 1, 1,
0.3458044, -0.5798619, 1.381006, 0, 0.3215686, 1, 1,
0.346718, -0.8582418, 3.049163, 0, 0.3176471, 1, 1,
0.3468478, 0.3496771, 1.666601, 0, 0.3098039, 1, 1,
0.3480492, -1.46393, 3.401187, 0, 0.3058824, 1, 1,
0.3481018, 0.9459535, -0.08446495, 0, 0.2980392, 1, 1,
0.3497914, -0.559379, 3.677534, 0, 0.2901961, 1, 1,
0.3501467, -0.2845142, 2.847324, 0, 0.2862745, 1, 1,
0.3557781, 0.06049427, 2.03968, 0, 0.2784314, 1, 1,
0.3559693, -1.443723, 2.14543, 0, 0.2745098, 1, 1,
0.3631002, 1.062203, -0.1505293, 0, 0.2666667, 1, 1,
0.3643227, -1.309623, 3.963592, 0, 0.2627451, 1, 1,
0.366554, 0.399666, 2.060713, 0, 0.254902, 1, 1,
0.3673989, -0.9453599, 2.29615, 0, 0.2509804, 1, 1,
0.372029, -0.8189355, 1.633103, 0, 0.2431373, 1, 1,
0.3755265, 0.2116038, 3.195875, 0, 0.2392157, 1, 1,
0.3762975, 0.7116292, 0.2917138, 0, 0.2313726, 1, 1,
0.3768193, 1.267076, 1.434979, 0, 0.227451, 1, 1,
0.3783929, 1.030057, -2.375279, 0, 0.2196078, 1, 1,
0.3793878, 0.08141062, -0.1939062, 0, 0.2156863, 1, 1,
0.3799468, -1.710143, 1.917803, 0, 0.2078431, 1, 1,
0.3817969, 0.5800316, 1.752264, 0, 0.2039216, 1, 1,
0.3847412, 2.167406, 1.221546, 0, 0.1960784, 1, 1,
0.3872141, -0.5686181, 2.949207, 0, 0.1882353, 1, 1,
0.3877334, 1.191368, 0.4496109, 0, 0.1843137, 1, 1,
0.3884268, -0.7561022, 1.00379, 0, 0.1764706, 1, 1,
0.3903906, 1.749153, 1.453634, 0, 0.172549, 1, 1,
0.3918729, -0.2211954, 1.594877, 0, 0.1647059, 1, 1,
0.3964982, -0.226808, 1.814585, 0, 0.1607843, 1, 1,
0.3998066, 0.9144903, -1.333975, 0, 0.1529412, 1, 1,
0.4053021, 0.6194846, 0.7014941, 0, 0.1490196, 1, 1,
0.4054467, 1.13004, -0.2346822, 0, 0.1411765, 1, 1,
0.4135803, 0.5345186, 0.9225368, 0, 0.1372549, 1, 1,
0.4167939, -1.882462, 3.278967, 0, 0.1294118, 1, 1,
0.4196123, -0.9888441, 3.09317, 0, 0.1254902, 1, 1,
0.4211616, -0.08882674, 0.2136695, 0, 0.1176471, 1, 1,
0.423576, 0.02797006, 0.4876694, 0, 0.1137255, 1, 1,
0.4256396, -0.3622635, 2.521322, 0, 0.1058824, 1, 1,
0.428512, -0.2250819, 2.083955, 0, 0.09803922, 1, 1,
0.4294078, -1.43288, 2.329494, 0, 0.09411765, 1, 1,
0.4301567, 0.1534596, -0.3277725, 0, 0.08627451, 1, 1,
0.4304337, -1.053879, 0.1170107, 0, 0.08235294, 1, 1,
0.4312271, -0.4029649, 2.372357, 0, 0.07450981, 1, 1,
0.4319939, 1.299675, 0.02030322, 0, 0.07058824, 1, 1,
0.4338054, -2.087131, 2.670899, 0, 0.0627451, 1, 1,
0.4464566, 0.5486344, 1.102905, 0, 0.05882353, 1, 1,
0.4468494, -0.009260465, 1.19516, 0, 0.05098039, 1, 1,
0.4490665, -0.002163492, 1.574493, 0, 0.04705882, 1, 1,
0.4512799, 0.3800027, 1.388615, 0, 0.03921569, 1, 1,
0.4517055, 0.2255599, 2.333101, 0, 0.03529412, 1, 1,
0.4537281, 0.7054448, 1.635293, 0, 0.02745098, 1, 1,
0.455365, 0.2957256, -0.1369401, 0, 0.02352941, 1, 1,
0.4645613, -0.6380797, 1.84022, 0, 0.01568628, 1, 1,
0.4681702, -0.4996251, 3.473245, 0, 0.01176471, 1, 1,
0.4696918, -0.2854847, 0.5737616, 0, 0.003921569, 1, 1,
0.4700926, -0.3639702, 3.23417, 0.003921569, 0, 1, 1,
0.4701709, -1.955899, 5.797309, 0.007843138, 0, 1, 1,
0.4736426, 0.04085635, 1.500286, 0.01568628, 0, 1, 1,
0.4755931, 0.4989899, 0.2527568, 0.01960784, 0, 1, 1,
0.4771227, 0.7025952, 0.836852, 0.02745098, 0, 1, 1,
0.4833173, -0.06064758, 2.25248, 0.03137255, 0, 1, 1,
0.4851804, -1.44162, 2.879273, 0.03921569, 0, 1, 1,
0.4880603, 0.7310756, 0.4690037, 0.04313726, 0, 1, 1,
0.4884197, -0.8342449, 2.881299, 0.05098039, 0, 1, 1,
0.4886582, -0.9544672, 1.459394, 0.05490196, 0, 1, 1,
0.4887211, -1.945141, 3.665731, 0.0627451, 0, 1, 1,
0.4891547, 0.5686958, 0.7729518, 0.06666667, 0, 1, 1,
0.4923328, 0.1605827, 2.232841, 0.07450981, 0, 1, 1,
0.4924118, -1.922688, 1.585364, 0.07843138, 0, 1, 1,
0.4994639, 0.4746448, 1.515065, 0.08627451, 0, 1, 1,
0.5000916, -0.2392548, 0.689881, 0.09019608, 0, 1, 1,
0.5039507, -0.04413963, 1.683237, 0.09803922, 0, 1, 1,
0.5043961, -0.6626133, 0.5516317, 0.1058824, 0, 1, 1,
0.5052255, -0.8805554, 2.514133, 0.1098039, 0, 1, 1,
0.5055831, -0.7956792, 3.012454, 0.1176471, 0, 1, 1,
0.5068267, -0.3334898, 3.343626, 0.1215686, 0, 1, 1,
0.5213306, 0.5274092, -0.9570521, 0.1294118, 0, 1, 1,
0.5234523, -0.3732044, 2.306989, 0.1333333, 0, 1, 1,
0.5278179, 0.516031, 0.8551072, 0.1411765, 0, 1, 1,
0.5342725, -0.09818166, 1.444631, 0.145098, 0, 1, 1,
0.5351335, 1.581289, 0.1634361, 0.1529412, 0, 1, 1,
0.5384167, -0.1321342, 1.881893, 0.1568628, 0, 1, 1,
0.5389563, -0.05805793, 1.330104, 0.1647059, 0, 1, 1,
0.539714, -0.1845815, 3.531107, 0.1686275, 0, 1, 1,
0.5424309, 2.142123, 0.7236516, 0.1764706, 0, 1, 1,
0.551578, -2.897369, 2.339705, 0.1803922, 0, 1, 1,
0.5531152, 0.428981, 3.016527, 0.1882353, 0, 1, 1,
0.5681844, 0.08483671, 3.605824, 0.1921569, 0, 1, 1,
0.5731511, 1.342622, -0.012373, 0.2, 0, 1, 1,
0.57611, 0.3682249, -0.08599264, 0.2078431, 0, 1, 1,
0.57734, 1.077808, 1.321013, 0.2117647, 0, 1, 1,
0.5815898, 1.314056, -0.07242402, 0.2196078, 0, 1, 1,
0.5831349, 1.14733, 1.540552, 0.2235294, 0, 1, 1,
0.5838923, -0.8410844, 1.764062, 0.2313726, 0, 1, 1,
0.5840774, 0.223359, 3.344398, 0.2352941, 0, 1, 1,
0.5843608, -1.706877, 3.242077, 0.2431373, 0, 1, 1,
0.5903516, -0.309976, 1.400202, 0.2470588, 0, 1, 1,
0.5945702, -0.5386582, 0.9451213, 0.254902, 0, 1, 1,
0.5979109, -0.2100555, 2.733765, 0.2588235, 0, 1, 1,
0.5997657, -0.7701738, 3.351134, 0.2666667, 0, 1, 1,
0.6000024, -1.242957, 1.679637, 0.2705882, 0, 1, 1,
0.6004568, -1.23967, 2.965146, 0.2784314, 0, 1, 1,
0.6019466, -0.7861647, 0.182749, 0.282353, 0, 1, 1,
0.6022722, 0.4311686, 3.198578, 0.2901961, 0, 1, 1,
0.6029206, -0.02964993, 2.124584, 0.2941177, 0, 1, 1,
0.6074693, -2.266916, 2.480309, 0.3019608, 0, 1, 1,
0.6131153, -0.5064878, 2.094727, 0.3098039, 0, 1, 1,
0.6145942, 1.69621, -1.099383, 0.3137255, 0, 1, 1,
0.6167605, -1.10036, 2.816599, 0.3215686, 0, 1, 1,
0.6219921, -0.9879676, 0.7243428, 0.3254902, 0, 1, 1,
0.6238829, -0.1041594, 0.9984683, 0.3333333, 0, 1, 1,
0.6249475, 0.2701551, 0.8754067, 0.3372549, 0, 1, 1,
0.6322224, -1.709474, 2.009154, 0.345098, 0, 1, 1,
0.6340655, 1.498948, 0.2764053, 0.3490196, 0, 1, 1,
0.6393067, -0.1745338, 1.369503, 0.3568628, 0, 1, 1,
0.6445217, 1.47714, 0.5849935, 0.3607843, 0, 1, 1,
0.647891, 0.7457708, 1.160785, 0.3686275, 0, 1, 1,
0.6539664, -0.4710211, 1.938733, 0.372549, 0, 1, 1,
0.6542001, -0.1949226, 1.48818, 0.3803922, 0, 1, 1,
0.6556852, 0.9900557, -1.300335, 0.3843137, 0, 1, 1,
0.6576745, 0.2223529, 2.095306, 0.3921569, 0, 1, 1,
0.6601788, -0.03070832, 0.9664099, 0.3960784, 0, 1, 1,
0.668719, 1.157704, 0.2773181, 0.4039216, 0, 1, 1,
0.6687447, 0.3633946, 0.7877263, 0.4117647, 0, 1, 1,
0.6706283, 1.038805, 1.635654, 0.4156863, 0, 1, 1,
0.6716765, 1.345928, -0.1100533, 0.4235294, 0, 1, 1,
0.6780619, 0.1853223, 0.883813, 0.427451, 0, 1, 1,
0.6795112, -0.4357699, 0.9586767, 0.4352941, 0, 1, 1,
0.6849115, -1.085295, 1.750486, 0.4392157, 0, 1, 1,
0.6870418, 1.097243, -0.6330929, 0.4470588, 0, 1, 1,
0.6882596, -0.7466536, 1.600949, 0.4509804, 0, 1, 1,
0.6885585, 0.3213328, 1.74917, 0.4588235, 0, 1, 1,
0.6898941, 0.4916832, 2.172817, 0.4627451, 0, 1, 1,
0.6914313, -1.551432, 2.188144, 0.4705882, 0, 1, 1,
0.692389, 0.8118133, 1.146455, 0.4745098, 0, 1, 1,
0.6988606, -1.087055, 4.631532, 0.4823529, 0, 1, 1,
0.6991968, -1.310239, 2.4718, 0.4862745, 0, 1, 1,
0.7006345, -0.7974368, 1.194533, 0.4941176, 0, 1, 1,
0.7045376, -0.3917469, 3.187042, 0.5019608, 0, 1, 1,
0.7098454, 0.1092608, 0.8153091, 0.5058824, 0, 1, 1,
0.7104621, 0.1263325, 3.798922, 0.5137255, 0, 1, 1,
0.7109542, 0.7077622, 2.092685, 0.5176471, 0, 1, 1,
0.7209612, -1.258145, 1.585931, 0.5254902, 0, 1, 1,
0.7250492, 0.7728822, 1.336931, 0.5294118, 0, 1, 1,
0.73153, -1.735489, 2.321546, 0.5372549, 0, 1, 1,
0.7382622, 0.503785, 1.065522, 0.5411765, 0, 1, 1,
0.7490503, -0.4812075, 2.337757, 0.5490196, 0, 1, 1,
0.7498421, 0.9497851, 0.7228997, 0.5529412, 0, 1, 1,
0.7506975, -1.102243, 1.602593, 0.5607843, 0, 1, 1,
0.7549115, -0.8421962, 1.289884, 0.5647059, 0, 1, 1,
0.7590923, 0.1822294, 2.511255, 0.572549, 0, 1, 1,
0.7618445, 1.803653, 0.1023711, 0.5764706, 0, 1, 1,
0.76404, 1.092641, 0.6347716, 0.5843138, 0, 1, 1,
0.7646677, -0.1109612, 0.4858394, 0.5882353, 0, 1, 1,
0.7661131, -0.731262, 2.022995, 0.5960785, 0, 1, 1,
0.7683775, -1.136552, 2.578065, 0.6039216, 0, 1, 1,
0.7738166, 0.05537355, 1.04294, 0.6078432, 0, 1, 1,
0.7747141, 1.33805, 0.2711276, 0.6156863, 0, 1, 1,
0.779932, -0.742247, 4.443757, 0.6196079, 0, 1, 1,
0.7886147, 0.7965012, 0.06599178, 0.627451, 0, 1, 1,
0.7911546, -0.5396796, 2.00851, 0.6313726, 0, 1, 1,
0.7980577, -1.154198, 1.767615, 0.6392157, 0, 1, 1,
0.7983491, -0.9568266, 2.029316, 0.6431373, 0, 1, 1,
0.8012276, 0.01888259, 2.279082, 0.6509804, 0, 1, 1,
0.8058807, 1.398342, 0.3734645, 0.654902, 0, 1, 1,
0.8060924, -1.299873, 2.891281, 0.6627451, 0, 1, 1,
0.8065693, -0.7956855, 1.347969, 0.6666667, 0, 1, 1,
0.8148413, -0.3763843, 1.155886, 0.6745098, 0, 1, 1,
0.8155587, -0.2266343, 2.708899, 0.6784314, 0, 1, 1,
0.8164919, 0.9658383, 1.596658, 0.6862745, 0, 1, 1,
0.8183461, -1.039907, 3.256045, 0.6901961, 0, 1, 1,
0.8193056, 1.438388, -0.8021599, 0.6980392, 0, 1, 1,
0.8259327, 0.483126, 1.471557, 0.7058824, 0, 1, 1,
0.8260215, 1.347344, -0.5236661, 0.7098039, 0, 1, 1,
0.8317068, -1.001404, 3.538393, 0.7176471, 0, 1, 1,
0.8339555, 0.7166113, -1.234943, 0.7215686, 0, 1, 1,
0.8368204, 1.30444, 0.7700745, 0.7294118, 0, 1, 1,
0.8394049, -0.370176, 0.7251558, 0.7333333, 0, 1, 1,
0.8439052, 0.1289181, -0.3896993, 0.7411765, 0, 1, 1,
0.8485133, -1.471681, 0.6554385, 0.7450981, 0, 1, 1,
0.8533081, -0.2418123, 2.431236, 0.7529412, 0, 1, 1,
0.8565356, 1.68601, -0.2555389, 0.7568628, 0, 1, 1,
0.8675211, 0.6943281, 1.604825, 0.7647059, 0, 1, 1,
0.8764146, -1.083304, 1.994755, 0.7686275, 0, 1, 1,
0.8822909, -1.733389, 2.184983, 0.7764706, 0, 1, 1,
0.8829959, -0.09941301, 1.116471, 0.7803922, 0, 1, 1,
0.8848182, -0.2293405, 1.35687, 0.7882353, 0, 1, 1,
0.8864561, -0.3165922, 3.605702, 0.7921569, 0, 1, 1,
0.8878321, -0.2213144, 1.608123, 0.8, 0, 1, 1,
0.8899112, 0.6540735, 2.787862, 0.8078431, 0, 1, 1,
0.8922092, 1.466521, 2.504713, 0.8117647, 0, 1, 1,
0.8940471, 1.103471, 0.9558707, 0.8196079, 0, 1, 1,
0.8962008, -0.4597675, 2.302798, 0.8235294, 0, 1, 1,
0.8969236, 0.5083389, 0.1150842, 0.8313726, 0, 1, 1,
0.8973548, 0.04042765, 2.155257, 0.8352941, 0, 1, 1,
0.8990641, -1.2046, 4.985871, 0.8431373, 0, 1, 1,
0.9006196, 0.197997, 1.147835, 0.8470588, 0, 1, 1,
0.9015956, -0.1324942, 2.6948, 0.854902, 0, 1, 1,
0.9017416, 1.719067, -0.4538061, 0.8588235, 0, 1, 1,
0.9068179, 0.5327267, 1.96272, 0.8666667, 0, 1, 1,
0.9069707, -1.000983, 2.060447, 0.8705882, 0, 1, 1,
0.9087211, 1.169479, -1.487683, 0.8784314, 0, 1, 1,
0.9107752, 0.4774215, -0.4520139, 0.8823529, 0, 1, 1,
0.9143317, 0.1166631, 2.689908, 0.8901961, 0, 1, 1,
0.9160385, 0.06341533, 3.202717, 0.8941177, 0, 1, 1,
0.9336079, -1.320447, 1.822811, 0.9019608, 0, 1, 1,
0.9376288, 0.2339421, 2.809567, 0.9098039, 0, 1, 1,
0.9397816, -9.434613e-05, 2.105737, 0.9137255, 0, 1, 1,
0.9438654, -1.252391, 2.996135, 0.9215686, 0, 1, 1,
0.9510756, 0.4514889, 3.104112, 0.9254902, 0, 1, 1,
0.9539895, 0.3114005, 0.5675278, 0.9333333, 0, 1, 1,
0.9544326, 0.532149, 0.5845944, 0.9372549, 0, 1, 1,
0.9597831, 2.056988, -0.4387972, 0.945098, 0, 1, 1,
0.978867, 1.006191, 0.3621346, 0.9490196, 0, 1, 1,
0.9791089, -1.795649, 2.255395, 0.9568627, 0, 1, 1,
0.9827438, 1.258211, 0.5971835, 0.9607843, 0, 1, 1,
0.9842067, -0.2776938, 0.6741654, 0.9686275, 0, 1, 1,
0.9877663, -1.195316, 3.598925, 0.972549, 0, 1, 1,
0.9885303, 0.5012975, 1.767499, 0.9803922, 0, 1, 1,
0.9890249, 0.9197671, 0.1261478, 0.9843137, 0, 1, 1,
1.011999, 1.028067, 1.011474, 0.9921569, 0, 1, 1,
1.014718, -1.087769, 2.008679, 0.9960784, 0, 1, 1,
1.017046, -0.2754019, 1.854449, 1, 0, 0.9960784, 1,
1.018036, 1.211565, 1.027275, 1, 0, 0.9882353, 1,
1.021588, -0.7232816, 1.867489, 1, 0, 0.9843137, 1,
1.02395, -0.1179256, 3.511713, 1, 0, 0.9764706, 1,
1.029984, 0.3693988, 0.4204693, 1, 0, 0.972549, 1,
1.030349, 2.075429, 1.65618, 1, 0, 0.9647059, 1,
1.035545, 0.1320315, 0.7882067, 1, 0, 0.9607843, 1,
1.036154, 1.314771, 1.118963, 1, 0, 0.9529412, 1,
1.037684, -0.4096165, 0.6478426, 1, 0, 0.9490196, 1,
1.037701, -0.3309497, 0.1241509, 1, 0, 0.9411765, 1,
1.051715, -0.7838941, 1.867571, 1, 0, 0.9372549, 1,
1.065773, 0.6612996, 0.6553242, 1, 0, 0.9294118, 1,
1.06665, 1.894233, 2.999723, 1, 0, 0.9254902, 1,
1.07224, -0.04782017, 1.983981, 1, 0, 0.9176471, 1,
1.07256, 0.2475632, 0.4547893, 1, 0, 0.9137255, 1,
1.07867, -0.1748492, 1.75053, 1, 0, 0.9058824, 1,
1.086702, -0.1308087, 2.234232, 1, 0, 0.9019608, 1,
1.089922, -1.073867, 2.237857, 1, 0, 0.8941177, 1,
1.094467, 0.3746866, 2.218599, 1, 0, 0.8862745, 1,
1.096785, 0.6064775, 1.439773, 1, 0, 0.8823529, 1,
1.09882, 1.454089, -0.7602472, 1, 0, 0.8745098, 1,
1.100265, 0.1999936, 0.4495554, 1, 0, 0.8705882, 1,
1.100975, -0.7101632, 1.106007, 1, 0, 0.8627451, 1,
1.102842, 0.6805686, 1.515364, 1, 0, 0.8588235, 1,
1.104504, 1.150604, 2.430036, 1, 0, 0.8509804, 1,
1.10587, -0.949806, 3.502226, 1, 0, 0.8470588, 1,
1.1115, -0.2295663, 0.8662784, 1, 0, 0.8392157, 1,
1.113811, 0.3281549, 2.172841, 1, 0, 0.8352941, 1,
1.117554, -0.9789333, 2.652086, 1, 0, 0.827451, 1,
1.142572, -0.1383001, 0.4268652, 1, 0, 0.8235294, 1,
1.159393, 0.1327759, 2.126116, 1, 0, 0.8156863, 1,
1.159885, 0.1349368, 2.437011, 1, 0, 0.8117647, 1,
1.162703, 0.1889637, 1.938825, 1, 0, 0.8039216, 1,
1.165101, 0.1360168, 2.568616, 1, 0, 0.7960784, 1,
1.170267, 1.439988, -0.08946749, 1, 0, 0.7921569, 1,
1.176668, -0.2856641, 2.570545, 1, 0, 0.7843137, 1,
1.177719, -0.6760525, 2.380774, 1, 0, 0.7803922, 1,
1.183256, 0.03340509, 2.169121, 1, 0, 0.772549, 1,
1.184206, 1.186618, 1.433319, 1, 0, 0.7686275, 1,
1.194272, -0.06565348, 1.019894, 1, 0, 0.7607843, 1,
1.194351, -0.5131913, 2.403127, 1, 0, 0.7568628, 1,
1.194408, 2.265797, 0.3494649, 1, 0, 0.7490196, 1,
1.199059, -0.5908226, 2.332554, 1, 0, 0.7450981, 1,
1.199292, -0.6258633, 2.567088, 1, 0, 0.7372549, 1,
1.206576, 0.7364072, 2.669062, 1, 0, 0.7333333, 1,
1.20728, -0.4811623, 0.8720893, 1, 0, 0.7254902, 1,
1.212952, 1.390166, 2.15885, 1, 0, 0.7215686, 1,
1.223146, 1.859796, -0.3851098, 1, 0, 0.7137255, 1,
1.227856, 0.4671983, -0.07078105, 1, 0, 0.7098039, 1,
1.228354, 0.2649098, -0.7051867, 1, 0, 0.7019608, 1,
1.240517, 1.498792, 0.268886, 1, 0, 0.6941177, 1,
1.244156, 1.148466, 1.749927, 1, 0, 0.6901961, 1,
1.24555, -0.01300434, 3.279594, 1, 0, 0.682353, 1,
1.250905, 1.248231, 3.113815, 1, 0, 0.6784314, 1,
1.263308, -0.7134151, 1.023887, 1, 0, 0.6705883, 1,
1.264894, -0.7703187, 1.552337, 1, 0, 0.6666667, 1,
1.278196, 0.4163971, -1.375722, 1, 0, 0.6588235, 1,
1.284937, 0.2921716, 2.081872, 1, 0, 0.654902, 1,
1.285566, 0.4452136, 0.8821275, 1, 0, 0.6470588, 1,
1.304295, -0.4366767, 2.633703, 1, 0, 0.6431373, 1,
1.307308, -0.5051631, 3.196267, 1, 0, 0.6352941, 1,
1.309562, -0.6261946, 3.058685, 1, 0, 0.6313726, 1,
1.312299, 0.5168191, 2.303207, 1, 0, 0.6235294, 1,
1.326014, 0.06309494, 0.4237416, 1, 0, 0.6196079, 1,
1.328194, 0.5964416, 3.094026, 1, 0, 0.6117647, 1,
1.33104, 0.7647539, 0.2835572, 1, 0, 0.6078432, 1,
1.339843, -0.3116831, 2.853544, 1, 0, 0.6, 1,
1.340978, 0.5702221, -0.29377, 1, 0, 0.5921569, 1,
1.34158, -0.4895867, 1.878801, 1, 0, 0.5882353, 1,
1.342203, -2.73445, 2.119309, 1, 0, 0.5803922, 1,
1.351058, 0.5761455, -0.1794801, 1, 0, 0.5764706, 1,
1.359313, 0.08764451, 0.07013651, 1, 0, 0.5686275, 1,
1.375009, -0.5913047, 1.873538, 1, 0, 0.5647059, 1,
1.380785, -0.4448937, 1.511754, 1, 0, 0.5568628, 1,
1.396905, 1.950883, 1.977438, 1, 0, 0.5529412, 1,
1.396977, -1.544898, 1.713646, 1, 0, 0.5450981, 1,
1.398768, 2.865788, -0.07921117, 1, 0, 0.5411765, 1,
1.405266, -0.6803344, 2.003335, 1, 0, 0.5333334, 1,
1.410952, 1.698558, 0.9562472, 1, 0, 0.5294118, 1,
1.412285, -0.01896591, 2.985435, 1, 0, 0.5215687, 1,
1.413442, 1.579713, 1.55681, 1, 0, 0.5176471, 1,
1.414288, 0.5910119, 0.6631263, 1, 0, 0.509804, 1,
1.419255, -0.6475872, 1.801967, 1, 0, 0.5058824, 1,
1.432543, -1.304449, 0.2040659, 1, 0, 0.4980392, 1,
1.433403, 0.1183974, 3.220295, 1, 0, 0.4901961, 1,
1.434307, 1.517939, -0.5250756, 1, 0, 0.4862745, 1,
1.43945, 0.8039611, 0.6978742, 1, 0, 0.4784314, 1,
1.443891, 0.2931682, 2.281239, 1, 0, 0.4745098, 1,
1.449629, -0.5997558, 0.9942268, 1, 0, 0.4666667, 1,
1.451485, -0.6972716, 1.965901, 1, 0, 0.4627451, 1,
1.45355, -0.439468, 3.134255, 1, 0, 0.454902, 1,
1.459277, 0.4206744, 1.157559, 1, 0, 0.4509804, 1,
1.461985, 0.2997941, 1.479338, 1, 0, 0.4431373, 1,
1.464531, -0.05578677, 0.9038218, 1, 0, 0.4392157, 1,
1.498616, 1.368519, 1.483274, 1, 0, 0.4313726, 1,
1.512869, 1.937877, 1.502096, 1, 0, 0.427451, 1,
1.524135, -0.4000314, 3.805476, 1, 0, 0.4196078, 1,
1.526627, -0.6182005, 2.723418, 1, 0, 0.4156863, 1,
1.528478, -1.112204, 0.7183918, 1, 0, 0.4078431, 1,
1.530227, 0.7388998, -0.1835349, 1, 0, 0.4039216, 1,
1.541072, 1.478944, 1.76768, 1, 0, 0.3960784, 1,
1.543038, -1.165964, 2.263932, 1, 0, 0.3882353, 1,
1.547813, 0.08652326, 2.036471, 1, 0, 0.3843137, 1,
1.550524, 1.345135, 1.108648, 1, 0, 0.3764706, 1,
1.56049, 0.7363638, 0.5662692, 1, 0, 0.372549, 1,
1.567308, -0.1526758, 4.258795, 1, 0, 0.3647059, 1,
1.587307, 1.079566, 0.7267771, 1, 0, 0.3607843, 1,
1.595205, 1.115799, 1.274395, 1, 0, 0.3529412, 1,
1.604922, -0.3806615, 2.292035, 1, 0, 0.3490196, 1,
1.617395, -0.09854607, 2.309085, 1, 0, 0.3411765, 1,
1.618844, -1.31697, 2.241855, 1, 0, 0.3372549, 1,
1.625808, -1.080208, 1.167497, 1, 0, 0.3294118, 1,
1.627046, -0.9238614, 2.113559, 1, 0, 0.3254902, 1,
1.63701, -1.231844, 0.9440232, 1, 0, 0.3176471, 1,
1.637683, 0.2143349, 0.5275866, 1, 0, 0.3137255, 1,
1.638955, -1.27484, 2.596001, 1, 0, 0.3058824, 1,
1.641998, 1.746056, 0.04534617, 1, 0, 0.2980392, 1,
1.692545, -0.8575897, 2.995409, 1, 0, 0.2941177, 1,
1.727782, -0.8186871, 2.412695, 1, 0, 0.2862745, 1,
1.731384, -0.356974, 0.7079329, 1, 0, 0.282353, 1,
1.746351, -0.6737552, 1.41042, 1, 0, 0.2745098, 1,
1.74702, -0.4686194, 1.062307, 1, 0, 0.2705882, 1,
1.761344, -0.1170376, -0.3643637, 1, 0, 0.2627451, 1,
1.768027, -0.3209418, 1.372434, 1, 0, 0.2588235, 1,
1.790628, -0.157721, 1.037908, 1, 0, 0.2509804, 1,
1.792053, 0.4691851, 0.9093427, 1, 0, 0.2470588, 1,
1.834796, 1.712767, 1.363718, 1, 0, 0.2392157, 1,
1.848135, -1.081632, 0.5414467, 1, 0, 0.2352941, 1,
1.851027, 2.365446, 0.9847145, 1, 0, 0.227451, 1,
1.854164, 0.4544674, 0.2407785, 1, 0, 0.2235294, 1,
1.856818, -0.3453082, 2.124645, 1, 0, 0.2156863, 1,
1.88322, 1.029711, 1.372768, 1, 0, 0.2117647, 1,
1.901753, 0.3603778, 1.494476, 1, 0, 0.2039216, 1,
1.916391, 1.226326, 1.970988, 1, 0, 0.1960784, 1,
1.920155, -1.066937, 1.469872, 1, 0, 0.1921569, 1,
1.923229, -0.06819163, 0.731607, 1, 0, 0.1843137, 1,
1.927954, -0.4517724, 3.100206, 1, 0, 0.1803922, 1,
1.929274, -1.854801, 2.813136, 1, 0, 0.172549, 1,
1.936846, -1.437073, 2.57014, 1, 0, 0.1686275, 1,
1.937047, -0.4966961, 2.047774, 1, 0, 0.1607843, 1,
1.949151, 2.098337, 1.838358, 1, 0, 0.1568628, 1,
1.963273, 0.1045394, 2.385891, 1, 0, 0.1490196, 1,
1.963533, -0.1223899, 0.8433517, 1, 0, 0.145098, 1,
1.965033, -0.7426758, 2.875543, 1, 0, 0.1372549, 1,
1.98488, 0.05058799, 0.8797989, 1, 0, 0.1333333, 1,
1.985203, -0.95408, 1.233294, 1, 0, 0.1254902, 1,
1.989964, 0.8012409, 0.4279028, 1, 0, 0.1215686, 1,
2.002562, 0.6217955, 1.034676, 1, 0, 0.1137255, 1,
2.008146, -0.4141867, -0.1440741, 1, 0, 0.1098039, 1,
2.026221, -0.5403816, 2.365983, 1, 0, 0.1019608, 1,
2.079715, -0.6836887, 1.570029, 1, 0, 0.09411765, 1,
2.086738, 0.1408272, 1.477326, 1, 0, 0.09019608, 1,
2.105981, 1.468268, 1.145939, 1, 0, 0.08235294, 1,
2.218678, -1.026131, 1.434352, 1, 0, 0.07843138, 1,
2.241842, 0.1918733, 1.988752, 1, 0, 0.07058824, 1,
2.244043, 1.745066, 1.551648, 1, 0, 0.06666667, 1,
2.288672, -1.415776, 1.532857, 1, 0, 0.05882353, 1,
2.299498, 1.894931, 1.826927, 1, 0, 0.05490196, 1,
2.305503, 0.1003004, 3.191997, 1, 0, 0.04705882, 1,
2.32906, 0.6442615, 1.410436, 1, 0, 0.04313726, 1,
2.346678, 0.7036904, 2.112003, 1, 0, 0.03529412, 1,
2.567929, -0.4680746, 2.200915, 1, 0, 0.03137255, 1,
2.584639, -0.1256762, 0.9152073, 1, 0, 0.02352941, 1,
3.11935, 0.08023085, 1.611403, 1, 0, 0.01960784, 1,
3.253371, 0.4598703, 2.39752, 1, 0, 0.01176471, 1,
3.719883, 0.4692332, -0.02321889, 1, 0, 0.007843138, 1
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
0.04760444, -4.549649, -7.289895, 0, -0.5, 0.5, 0.5,
0.04760444, -4.549649, -7.289895, 1, -0.5, 0.5, 0.5,
0.04760444, -4.549649, -7.289895, 1, 1.5, 0.5, 0.5,
0.04760444, -4.549649, -7.289895, 0, 1.5, 0.5, 0.5
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
-4.869577, -0.3045572, -7.289895, 0, -0.5, 0.5, 0.5,
-4.869577, -0.3045572, -7.289895, 1, -0.5, 0.5, 0.5,
-4.869577, -0.3045572, -7.289895, 1, 1.5, 0.5, 0.5,
-4.869577, -0.3045572, -7.289895, 0, 1.5, 0.5, 0.5
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
-4.869577, -4.549649, 0.2020957, 0, -0.5, 0.5, 0.5,
-4.869577, -4.549649, 0.2020957, 1, -0.5, 0.5, 0.5,
-4.869577, -4.549649, 0.2020957, 1, 1.5, 0.5, 0.5,
-4.869577, -4.549649, 0.2020957, 0, 1.5, 0.5, 0.5
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
-2, -3.570013, -5.560974,
2, -3.570013, -5.560974,
-2, -3.570013, -5.560974,
-2, -3.733285, -5.849127,
0, -3.570013, -5.560974,
0, -3.733285, -5.849127,
2, -3.570013, -5.560974,
2, -3.733285, -5.849127
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
-2, -4.059831, -6.425434, 0, -0.5, 0.5, 0.5,
-2, -4.059831, -6.425434, 1, -0.5, 0.5, 0.5,
-2, -4.059831, -6.425434, 1, 1.5, 0.5, 0.5,
-2, -4.059831, -6.425434, 0, 1.5, 0.5, 0.5,
0, -4.059831, -6.425434, 0, -0.5, 0.5, 0.5,
0, -4.059831, -6.425434, 1, -0.5, 0.5, 0.5,
0, -4.059831, -6.425434, 1, 1.5, 0.5, 0.5,
0, -4.059831, -6.425434, 0, 1.5, 0.5, 0.5,
2, -4.059831, -6.425434, 0, -0.5, 0.5, 0.5,
2, -4.059831, -6.425434, 1, -0.5, 0.5, 0.5,
2, -4.059831, -6.425434, 1, 1.5, 0.5, 0.5,
2, -4.059831, -6.425434, 0, 1.5, 0.5, 0.5
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
-3.734843, -3, -5.560974,
-3.734843, 2, -5.560974,
-3.734843, -3, -5.560974,
-3.923965, -3, -5.849127,
-3.734843, -2, -5.560974,
-3.923965, -2, -5.849127,
-3.734843, -1, -5.560974,
-3.923965, -1, -5.849127,
-3.734843, 0, -5.560974,
-3.923965, 0, -5.849127,
-3.734843, 1, -5.560974,
-3.923965, 1, -5.849127,
-3.734843, 2, -5.560974,
-3.923965, 2, -5.849127
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
-4.30221, -3, -6.425434, 0, -0.5, 0.5, 0.5,
-4.30221, -3, -6.425434, 1, -0.5, 0.5, 0.5,
-4.30221, -3, -6.425434, 1, 1.5, 0.5, 0.5,
-4.30221, -3, -6.425434, 0, 1.5, 0.5, 0.5,
-4.30221, -2, -6.425434, 0, -0.5, 0.5, 0.5,
-4.30221, -2, -6.425434, 1, -0.5, 0.5, 0.5,
-4.30221, -2, -6.425434, 1, 1.5, 0.5, 0.5,
-4.30221, -2, -6.425434, 0, 1.5, 0.5, 0.5,
-4.30221, -1, -6.425434, 0, -0.5, 0.5, 0.5,
-4.30221, -1, -6.425434, 1, -0.5, 0.5, 0.5,
-4.30221, -1, -6.425434, 1, 1.5, 0.5, 0.5,
-4.30221, -1, -6.425434, 0, 1.5, 0.5, 0.5,
-4.30221, 0, -6.425434, 0, -0.5, 0.5, 0.5,
-4.30221, 0, -6.425434, 1, -0.5, 0.5, 0.5,
-4.30221, 0, -6.425434, 1, 1.5, 0.5, 0.5,
-4.30221, 0, -6.425434, 0, 1.5, 0.5, 0.5,
-4.30221, 1, -6.425434, 0, -0.5, 0.5, 0.5,
-4.30221, 1, -6.425434, 1, -0.5, 0.5, 0.5,
-4.30221, 1, -6.425434, 1, 1.5, 0.5, 0.5,
-4.30221, 1, -6.425434, 0, 1.5, 0.5, 0.5,
-4.30221, 2, -6.425434, 0, -0.5, 0.5, 0.5,
-4.30221, 2, -6.425434, 1, -0.5, 0.5, 0.5,
-4.30221, 2, -6.425434, 1, 1.5, 0.5, 0.5,
-4.30221, 2, -6.425434, 0, 1.5, 0.5, 0.5
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
-3.734843, -3.570013, -4,
-3.734843, -3.570013, 4,
-3.734843, -3.570013, -4,
-3.923965, -3.733285, -4,
-3.734843, -3.570013, -2,
-3.923965, -3.733285, -2,
-3.734843, -3.570013, 0,
-3.923965, -3.733285, 0,
-3.734843, -3.570013, 2,
-3.923965, -3.733285, 2,
-3.734843, -3.570013, 4,
-3.923965, -3.733285, 4
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
-4.30221, -4.059831, -4, 0, -0.5, 0.5, 0.5,
-4.30221, -4.059831, -4, 1, -0.5, 0.5, 0.5,
-4.30221, -4.059831, -4, 1, 1.5, 0.5, 0.5,
-4.30221, -4.059831, -4, 0, 1.5, 0.5, 0.5,
-4.30221, -4.059831, -2, 0, -0.5, 0.5, 0.5,
-4.30221, -4.059831, -2, 1, -0.5, 0.5, 0.5,
-4.30221, -4.059831, -2, 1, 1.5, 0.5, 0.5,
-4.30221, -4.059831, -2, 0, 1.5, 0.5, 0.5,
-4.30221, -4.059831, 0, 0, -0.5, 0.5, 0.5,
-4.30221, -4.059831, 0, 1, -0.5, 0.5, 0.5,
-4.30221, -4.059831, 0, 1, 1.5, 0.5, 0.5,
-4.30221, -4.059831, 0, 0, 1.5, 0.5, 0.5,
-4.30221, -4.059831, 2, 0, -0.5, 0.5, 0.5,
-4.30221, -4.059831, 2, 1, -0.5, 0.5, 0.5,
-4.30221, -4.059831, 2, 1, 1.5, 0.5, 0.5,
-4.30221, -4.059831, 2, 0, 1.5, 0.5, 0.5,
-4.30221, -4.059831, 4, 0, -0.5, 0.5, 0.5,
-4.30221, -4.059831, 4, 1, -0.5, 0.5, 0.5,
-4.30221, -4.059831, 4, 1, 1.5, 0.5, 0.5,
-4.30221, -4.059831, 4, 0, 1.5, 0.5, 0.5
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
-3.734843, -3.570013, -5.560974,
-3.734843, 2.960898, -5.560974,
-3.734843, -3.570013, 5.965165,
-3.734843, 2.960898, 5.965165,
-3.734843, -3.570013, -5.560974,
-3.734843, -3.570013, 5.965165,
-3.734843, 2.960898, -5.560974,
-3.734843, 2.960898, 5.965165,
-3.734843, -3.570013, -5.560974,
3.830052, -3.570013, -5.560974,
-3.734843, -3.570013, 5.965165,
3.830052, -3.570013, 5.965165,
-3.734843, 2.960898, -5.560974,
3.830052, 2.960898, -5.560974,
-3.734843, 2.960898, 5.965165,
3.830052, 2.960898, 5.965165,
3.830052, -3.570013, -5.560974,
3.830052, 2.960898, -5.560974,
3.830052, -3.570013, 5.965165,
3.830052, 2.960898, 5.965165,
3.830052, -3.570013, -5.560974,
3.830052, -3.570013, 5.965165,
3.830052, 2.960898, -5.560974,
3.830052, 2.960898, 5.965165
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
var radius = 8.146176;
var distance = 36.24326;
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
mvMatrix.translate( -0.04760444, 0.3045572, -0.2020957 );
mvMatrix.scale( 1.1643, 1.348634, 0.7641592 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.24326);
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
furalaxyl<-read.table("furalaxyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-furalaxyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'furalaxyl' not found
```

```r
y<-furalaxyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'furalaxyl' not found
```

```r
z<-furalaxyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'furalaxyl' not found
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
-3.624675, 0.3672027, -1.713163, 0, 0, 1, 1, 1,
-3.02838, -0.4281851, -2.112114, 1, 0, 0, 1, 1,
-2.584033, -0.02642197, -0.9667934, 1, 0, 0, 1, 1,
-2.527951, -1.368252, -1.61555, 1, 0, 0, 1, 1,
-2.518975, 0.1851573, -1.576297, 1, 0, 0, 1, 1,
-2.511785, -0.2649784, -3.401822, 1, 0, 0, 1, 1,
-2.367, 1.066821, -1.432791, 0, 0, 0, 1, 1,
-2.322963, -1.234467, -0.5189307, 0, 0, 0, 1, 1,
-2.226089, 0.4822384, -1.622263, 0, 0, 0, 1, 1,
-2.190426, -2.077935, -2.313184, 0, 0, 0, 1, 1,
-2.160205, 1.655549, -0.6749691, 0, 0, 0, 1, 1,
-2.115494, -1.081649, -2.743048, 0, 0, 0, 1, 1,
-2.068901, 0.2941115, -0.3553888, 0, 0, 0, 1, 1,
-2.065015, 1.066433, -2.328744, 1, 1, 1, 1, 1,
-2.043975, -0.5338452, -2.920377, 1, 1, 1, 1, 1,
-2.021398, -0.01950494, -2.74011, 1, 1, 1, 1, 1,
-2.012851, 0.2056947, -2.20402, 1, 1, 1, 1, 1,
-1.976092, -0.3292691, -2.842633, 1, 1, 1, 1, 1,
-1.964977, 0.9190241, -0.6177367, 1, 1, 1, 1, 1,
-1.951913, 1.638965, -1.105301, 1, 1, 1, 1, 1,
-1.885533, -1.362984, -1.332523, 1, 1, 1, 1, 1,
-1.883084, -0.4998078, -2.357319, 1, 1, 1, 1, 1,
-1.87414, 2.307795, -0.6969128, 1, 1, 1, 1, 1,
-1.869872, 0.1464623, -0.7333704, 1, 1, 1, 1, 1,
-1.857378, -0.3659201, -1.527535, 1, 1, 1, 1, 1,
-1.856012, 0.1694118, -1.417063, 1, 1, 1, 1, 1,
-1.835135, 0.7670066, -2.273282, 1, 1, 1, 1, 1,
-1.80058, -0.618427, -2.274873, 1, 1, 1, 1, 1,
-1.795067, 0.07562342, -2.059345, 0, 0, 1, 1, 1,
-1.775889, 1.086073, 0.3679202, 1, 0, 0, 1, 1,
-1.767087, 0.2471365, -1.517039, 1, 0, 0, 1, 1,
-1.766163, 0.1796293, -3.205631, 1, 0, 0, 1, 1,
-1.748835, 0.5889835, 0.8459615, 1, 0, 0, 1, 1,
-1.741863, 1.738914, -1.148705, 1, 0, 0, 1, 1,
-1.724499, -0.7290571, -2.141056, 0, 0, 0, 1, 1,
-1.721971, 0.2671538, 1.155092, 0, 0, 0, 1, 1,
-1.707575, -0.3045983, -2.475535, 0, 0, 0, 1, 1,
-1.683955, -0.3150655, -0.4613266, 0, 0, 0, 1, 1,
-1.681265, 0.7585902, -0.05669004, 0, 0, 0, 1, 1,
-1.649722, -0.3186952, -1.710509, 0, 0, 0, 1, 1,
-1.647854, -0.7584774, -1.269753, 0, 0, 0, 1, 1,
-1.643686, 1.631665, -0.01557714, 1, 1, 1, 1, 1,
-1.637137, 1.020374, -1.5596, 1, 1, 1, 1, 1,
-1.635613, -0.05523736, -1.740907, 1, 1, 1, 1, 1,
-1.623054, -0.3024956, -1.173909, 1, 1, 1, 1, 1,
-1.621529, -0.5496636, -0.7817165, 1, 1, 1, 1, 1,
-1.602674, -1.00734, -3.663693, 1, 1, 1, 1, 1,
-1.59357, 0.3811542, -3.077152, 1, 1, 1, 1, 1,
-1.592756, 0.02808113, -2.023803, 1, 1, 1, 1, 1,
-1.565981, 1.089781, -1.765761, 1, 1, 1, 1, 1,
-1.551907, 0.526922, -0.2014945, 1, 1, 1, 1, 1,
-1.538477, 1.11232, 0.531481, 1, 1, 1, 1, 1,
-1.536611, 0.4909507, -0.3244466, 1, 1, 1, 1, 1,
-1.527233, 0.146184, -2.16257, 1, 1, 1, 1, 1,
-1.516787, 1.602707, 0.1717592, 1, 1, 1, 1, 1,
-1.512122, -0.1974442, -2.333026, 1, 1, 1, 1, 1,
-1.508414, 0.09078979, -1.290059, 0, 0, 1, 1, 1,
-1.490374, 0.2705244, -0.7553269, 1, 0, 0, 1, 1,
-1.48934, 1.334925, 0.2496537, 1, 0, 0, 1, 1,
-1.479905, 0.5717883, -4.567307, 1, 0, 0, 1, 1,
-1.479652, -1.00015, -2.591598, 1, 0, 0, 1, 1,
-1.4758, 0.8961476, -1.588587, 1, 0, 0, 1, 1,
-1.470887, -0.7138032, -2.153387, 0, 0, 0, 1, 1,
-1.462902, 0.1029052, -2.149663, 0, 0, 0, 1, 1,
-1.455342, 0.0779499, -1.096406, 0, 0, 0, 1, 1,
-1.452478, -0.1117241, -1.744262, 0, 0, 0, 1, 1,
-1.4389, -1.206296, -1.652421, 0, 0, 0, 1, 1,
-1.416306, 0.5656421, -1.536433, 0, 0, 0, 1, 1,
-1.412466, 0.9930744, -0.6755434, 0, 0, 0, 1, 1,
-1.407912, -0.7123504, -2.347764, 1, 1, 1, 1, 1,
-1.407662, -0.4097302, -3.417742, 1, 1, 1, 1, 1,
-1.387501, -0.6249222, -2.079922, 1, 1, 1, 1, 1,
-1.36829, -0.5968527, -1.10729, 1, 1, 1, 1, 1,
-1.364076, 2.305275, 0.1760753, 1, 1, 1, 1, 1,
-1.361503, -0.7600681, -0.9350702, 1, 1, 1, 1, 1,
-1.347793, -0.142268, -1.753253, 1, 1, 1, 1, 1,
-1.346249, 0.7504371, -0.2319186, 1, 1, 1, 1, 1,
-1.342724, -2.324346, -3.475261, 1, 1, 1, 1, 1,
-1.33986, 0.6669225, -1.341995, 1, 1, 1, 1, 1,
-1.3316, -0.2739729, -1.707952, 1, 1, 1, 1, 1,
-1.324454, -0.9842119, -2.609598, 1, 1, 1, 1, 1,
-1.323714, -1.343188, -1.675447, 1, 1, 1, 1, 1,
-1.308788, -1.667023, -3.713115, 1, 1, 1, 1, 1,
-1.308561, 0.2155232, -0.3180842, 1, 1, 1, 1, 1,
-1.30354, -2.278632, -2.581809, 0, 0, 1, 1, 1,
-1.302605, -2.085901, -2.759708, 1, 0, 0, 1, 1,
-1.288273, 0.2281937, -1.520274, 1, 0, 0, 1, 1,
-1.283844, 2.450136, -1.366213, 1, 0, 0, 1, 1,
-1.281658, -0.6955627, -2.290425, 1, 0, 0, 1, 1,
-1.279169, -1.086026, -2.257122, 1, 0, 0, 1, 1,
-1.27366, 0.391856, -1.003779, 0, 0, 0, 1, 1,
-1.271198, 0.9335871, -1.737819, 0, 0, 0, 1, 1,
-1.262928, 1.281118, 0.530587, 0, 0, 0, 1, 1,
-1.251861, -0.06265721, -0.4184224, 0, 0, 0, 1, 1,
-1.250729, 0.09340329, -3.029672, 0, 0, 0, 1, 1,
-1.249837, 0.5389632, -1.001767, 0, 0, 0, 1, 1,
-1.247761, 2.055029, -2.374006, 0, 0, 0, 1, 1,
-1.243319, -2.041348, -4.51461, 1, 1, 1, 1, 1,
-1.243109, -0.7599797, -2.413605, 1, 1, 1, 1, 1,
-1.239902, 0.4100054, -0.6362197, 1, 1, 1, 1, 1,
-1.239129, -1.538452, -2.384784, 1, 1, 1, 1, 1,
-1.237693, -1.03527, -1.615508, 1, 1, 1, 1, 1,
-1.237147, -0.4371207, -4.060482, 1, 1, 1, 1, 1,
-1.235869, 0.2000756, -2.310308, 1, 1, 1, 1, 1,
-1.20577, 0.427196, -2.697596, 1, 1, 1, 1, 1,
-1.20083, 0.7255998, -1.177929, 1, 1, 1, 1, 1,
-1.200258, 1.093505, -0.3474469, 1, 1, 1, 1, 1,
-1.19916, -0.9616081, -2.710604, 1, 1, 1, 1, 1,
-1.194945, 0.214475, -0.02846529, 1, 1, 1, 1, 1,
-1.186717, -0.6551633, -0.0391899, 1, 1, 1, 1, 1,
-1.182593, -0.8308652, -1.012391, 1, 1, 1, 1, 1,
-1.178285, -0.693268, -0.8280413, 1, 1, 1, 1, 1,
-1.172464, -0.5062026, -0.9974629, 0, 0, 1, 1, 1,
-1.156803, 0.2310687, -1.071164, 1, 0, 0, 1, 1,
-1.145833, 1.150571, -0.5567658, 1, 0, 0, 1, 1,
-1.144231, -0.1332829, -1.494118, 1, 0, 0, 1, 1,
-1.143069, 1.068245, 1.386686, 1, 0, 0, 1, 1,
-1.135768, 0.2932354, -1.159479, 1, 0, 0, 1, 1,
-1.135403, -1.382505, -2.636748, 0, 0, 0, 1, 1,
-1.132042, 0.7598345, -1.660811, 0, 0, 0, 1, 1,
-1.131734, 1.055688, -1.732428, 0, 0, 0, 1, 1,
-1.12885, -1.40886, -1.575768, 0, 0, 0, 1, 1,
-1.117488, -0.8159572, -3.251559, 0, 0, 0, 1, 1,
-1.114795, 1.017227, -2.398238, 0, 0, 0, 1, 1,
-1.11421, -1.343882, -1.511336, 0, 0, 0, 1, 1,
-1.109974, -0.3994996, -1.4281, 1, 1, 1, 1, 1,
-1.105902, -1.049896, -2.713593, 1, 1, 1, 1, 1,
-1.101032, 0.3781804, 0.5592765, 1, 1, 1, 1, 1,
-1.10058, -0.0926112, -0.8172342, 1, 1, 1, 1, 1,
-1.097544, -1.490291, -1.146705, 1, 1, 1, 1, 1,
-1.096463, -0.1167922, -0.0854345, 1, 1, 1, 1, 1,
-1.079978, 0.6091979, -2.528847, 1, 1, 1, 1, 1,
-1.0771, 0.4499437, 0.7566718, 1, 1, 1, 1, 1,
-1.070562, 0.2678011, -1.382833, 1, 1, 1, 1, 1,
-1.062411, -0.5902935, -2.149597, 1, 1, 1, 1, 1,
-1.057042, -0.4896789, 0.4115526, 1, 1, 1, 1, 1,
-1.053457, -0.3062932, -1.943202, 1, 1, 1, 1, 1,
-1.047511, 0.4360505, -1.946581, 1, 1, 1, 1, 1,
-1.044574, 0.8592588, 0.1558145, 1, 1, 1, 1, 1,
-1.044274, 0.9818729, -2.393704, 1, 1, 1, 1, 1,
-1.043497, -1.425736, -1.434396, 0, 0, 1, 1, 1,
-1.041571, -0.00965789, -0.5303613, 1, 0, 0, 1, 1,
-1.039116, 0.4714442, -2.766332, 1, 0, 0, 1, 1,
-1.035259, -0.07680735, -2.344633, 1, 0, 0, 1, 1,
-1.030208, -0.5205874, -2.975701, 1, 0, 0, 1, 1,
-1.02674, 1.304292, -0.2237844, 1, 0, 0, 1, 1,
-1.01444, -0.4503135, -2.225202, 0, 0, 0, 1, 1,
-1.008725, 0.4606703, -1.182665, 0, 0, 0, 1, 1,
-1.004994, -0.5636999, -1.292022, 0, 0, 0, 1, 1,
-0.9949536, -0.1197805, -2.709369, 0, 0, 0, 1, 1,
-0.9935166, 1.665355, -1.025075, 0, 0, 0, 1, 1,
-0.9918789, 0.05998809, -0.1941623, 0, 0, 0, 1, 1,
-0.9875135, 0.6627542, 0.5852852, 0, 0, 0, 1, 1,
-0.9869047, -0.003398077, -1.793871, 1, 1, 1, 1, 1,
-0.9862831, 0.6800448, -0.9488893, 1, 1, 1, 1, 1,
-0.9820815, -0.08585596, -0.3071543, 1, 1, 1, 1, 1,
-0.9801663, -1.422207, -2.822853, 1, 1, 1, 1, 1,
-0.9767792, 0.03357914, -2.678637, 1, 1, 1, 1, 1,
-0.9723486, -0.8454693, -0.7669801, 1, 1, 1, 1, 1,
-0.9681653, 0.5759556, 0.7432754, 1, 1, 1, 1, 1,
-0.9643822, -0.4624115, -4.253875, 1, 1, 1, 1, 1,
-0.9643475, 0.4421412, 0.5588881, 1, 1, 1, 1, 1,
-0.9586283, -0.6029518, -2.89772, 1, 1, 1, 1, 1,
-0.9580782, 0.5233007, -0.8290878, 1, 1, 1, 1, 1,
-0.9554215, 0.2611383, -2.200649, 1, 1, 1, 1, 1,
-0.9518899, 0.01376109, -1.056924, 1, 1, 1, 1, 1,
-0.9514703, 0.02412436, -1.375999, 1, 1, 1, 1, 1,
-0.9501998, -0.1688592, -0.7802196, 1, 1, 1, 1, 1,
-0.9470016, -0.03330338, -1.906889, 0, 0, 1, 1, 1,
-0.942885, -0.9904894, -1.591779, 1, 0, 0, 1, 1,
-0.9399744, 0.202477, -1.758306, 1, 0, 0, 1, 1,
-0.9379108, -0.9658809, -1.910647, 1, 0, 0, 1, 1,
-0.937355, 0.6923881, -0.01061851, 1, 0, 0, 1, 1,
-0.9344955, 1.408258, -0.4354148, 1, 0, 0, 1, 1,
-0.9319749, 1.416832, -0.8954854, 0, 0, 0, 1, 1,
-0.9306067, -1.566932, -3.589691, 0, 0, 0, 1, 1,
-0.9298083, -0.6597734, -0.4113857, 0, 0, 0, 1, 1,
-0.9297542, -1.162681, -1.326603, 0, 0, 0, 1, 1,
-0.9214216, 0.7279563, -2.805002, 0, 0, 0, 1, 1,
-0.9207004, 0.9644216, -1.581275, 0, 0, 0, 1, 1,
-0.9115905, 0.1169628, -2.047246, 0, 0, 0, 1, 1,
-0.9093983, 0.5750309, -0.2912489, 1, 1, 1, 1, 1,
-0.9086322, 0.4795182, -0.9485689, 1, 1, 1, 1, 1,
-0.9072735, -0.8254642, -2.948719, 1, 1, 1, 1, 1,
-0.90596, -0.4258232, -1.906405, 1, 1, 1, 1, 1,
-0.9025538, 0.6770568, -2.731778, 1, 1, 1, 1, 1,
-0.8839219, -0.711382, -1.466895, 1, 1, 1, 1, 1,
-0.8803568, 2.019425, 0.4639566, 1, 1, 1, 1, 1,
-0.870429, -2.164166, -1.438921, 1, 1, 1, 1, 1,
-0.8694046, 1.464185, -0.5400723, 1, 1, 1, 1, 1,
-0.8685464, -1.372862, -1.681343, 1, 1, 1, 1, 1,
-0.8648083, -2.014831, -1.64991, 1, 1, 1, 1, 1,
-0.8553938, 1.225921, -0.9358411, 1, 1, 1, 1, 1,
-0.8537987, 1.069754, -0.4372866, 1, 1, 1, 1, 1,
-0.8531418, -1.334173, -2.853353, 1, 1, 1, 1, 1,
-0.8528861, -0.3939915, -0.6109192, 1, 1, 1, 1, 1,
-0.852865, -1.364004, -1.502802, 0, 0, 1, 1, 1,
-0.8523667, 0.8516448, -0.03129797, 1, 0, 0, 1, 1,
-0.8482985, -0.7067368, -2.008123, 1, 0, 0, 1, 1,
-0.8451213, 0.1565069, -0.5744454, 1, 0, 0, 1, 1,
-0.8444859, -0.9956165, 0.9424629, 1, 0, 0, 1, 1,
-0.8380463, -0.1212457, -1.890727, 1, 0, 0, 1, 1,
-0.8379412, -1.159845, -3.092665, 0, 0, 0, 1, 1,
-0.8343867, 0.4829459, -1.423724, 0, 0, 0, 1, 1,
-0.8341366, 0.02813543, -0.3113833, 0, 0, 0, 1, 1,
-0.8339611, -0.8650283, -3.878818, 0, 0, 0, 1, 1,
-0.8294254, 0.04627942, -3.076598, 0, 0, 0, 1, 1,
-0.8265216, 2.718034, -0.6798538, 0, 0, 0, 1, 1,
-0.8163841, -0.6066197, -1.499685, 0, 0, 0, 1, 1,
-0.8143476, -0.7189826, -1.474247, 1, 1, 1, 1, 1,
-0.8130804, 1.981648, -0.9303976, 1, 1, 1, 1, 1,
-0.8120291, 0.3699413, -0.7915466, 1, 1, 1, 1, 1,
-0.812004, -0.6394748, -1.213365, 1, 1, 1, 1, 1,
-0.8058391, -0.5404682, -2.284787, 1, 1, 1, 1, 1,
-0.8031006, -1.213459, -2.375195, 1, 1, 1, 1, 1,
-0.8025173, -0.3585546, -1.506901, 1, 1, 1, 1, 1,
-0.7901747, 1.645142, -2.161024, 1, 1, 1, 1, 1,
-0.789982, -1.340363, -2.932029, 1, 1, 1, 1, 1,
-0.7895094, 1.632478, 0.5415187, 1, 1, 1, 1, 1,
-0.7815992, 0.5203411, -0.8412899, 1, 1, 1, 1, 1,
-0.7717426, -2.295192, -3.813539, 1, 1, 1, 1, 1,
-0.7667607, 0.3542023, 0.5731574, 1, 1, 1, 1, 1,
-0.7662469, 0.4762329, -2.098628, 1, 1, 1, 1, 1,
-0.7650816, -0.5327083, -0.8243601, 1, 1, 1, 1, 1,
-0.7568454, -0.533332, -1.22534, 0, 0, 1, 1, 1,
-0.7530358, 1.211891, -0.7781009, 1, 0, 0, 1, 1,
-0.7514617, -0.3680926, -0.4767844, 1, 0, 0, 1, 1,
-0.7476808, -1.220571, -3.413587, 1, 0, 0, 1, 1,
-0.7441398, -0.1878781, -3.044888, 1, 0, 0, 1, 1,
-0.7420739, -0.4414518, -2.999804, 1, 0, 0, 1, 1,
-0.7383267, -0.1057271, -0.9508159, 0, 0, 0, 1, 1,
-0.7379537, 0.3643802, -2.954748, 0, 0, 0, 1, 1,
-0.7263973, -0.8429262, -1.725452, 0, 0, 0, 1, 1,
-0.7150909, -1.884959, -1.965603, 0, 0, 0, 1, 1,
-0.7133408, 1.511217, -1.527922, 0, 0, 0, 1, 1,
-0.7115723, 1.48838, -1.825441, 0, 0, 0, 1, 1,
-0.7105599, -1.423712, -4.002677, 0, 0, 0, 1, 1,
-0.7098835, -0.1759899, -0.744074, 1, 1, 1, 1, 1,
-0.6991681, 0.3692195, 0.002061773, 1, 1, 1, 1, 1,
-0.6826388, 0.196528, 0.639155, 1, 1, 1, 1, 1,
-0.6784981, 2.29296, 0.3376348, 1, 1, 1, 1, 1,
-0.6705034, -0.3553275, -1.062108, 1, 1, 1, 1, 1,
-0.6682785, 0.4189675, -1.685633, 1, 1, 1, 1, 1,
-0.6682065, -0.618086, -3.843812, 1, 1, 1, 1, 1,
-0.6670716, -0.2112693, -1.90511, 1, 1, 1, 1, 1,
-0.6621685, 2.061813, -0.6630923, 1, 1, 1, 1, 1,
-0.6616136, 0.3884964, -0.5672317, 1, 1, 1, 1, 1,
-0.6537517, -1.117588, -2.700325, 1, 1, 1, 1, 1,
-0.6505249, -0.802368, -1.512774, 1, 1, 1, 1, 1,
-0.6386306, -0.3164072, -2.109009, 1, 1, 1, 1, 1,
-0.6373398, 0.02332694, -0.09937797, 1, 1, 1, 1, 1,
-0.6357311, -1.171269, -4.902313, 1, 1, 1, 1, 1,
-0.6305844, 1.967467, -0.8633727, 0, 0, 1, 1, 1,
-0.6289437, 0.2667846, 1.193932, 1, 0, 0, 1, 1,
-0.6244315, 0.7782383, -1.860908, 1, 0, 0, 1, 1,
-0.6229291, -0.8333322, -2.540623, 1, 0, 0, 1, 1,
-0.6217804, 1.201386, 0.0629051, 1, 0, 0, 1, 1,
-0.6180112, -0.7690893, -3.373051, 1, 0, 0, 1, 1,
-0.6158004, -0.2690996, -1.370147, 0, 0, 0, 1, 1,
-0.6084098, -1.453125, -3.732177, 0, 0, 0, 1, 1,
-0.6070995, 0.3810849, -0.5437921, 0, 0, 0, 1, 1,
-0.603613, 0.6736629, -0.6991933, 0, 0, 0, 1, 1,
-0.6009167, 1.049869, -0.07863851, 0, 0, 0, 1, 1,
-0.6007636, -0.4134074, -1.523365, 0, 0, 0, 1, 1,
-0.5999068, 0.4856086, -1.083393, 0, 0, 0, 1, 1,
-0.5959369, -1.513675, -2.213929, 1, 1, 1, 1, 1,
-0.5955341, -0.8995556, -1.288152, 1, 1, 1, 1, 1,
-0.5916744, -0.7056506, -1.729889, 1, 1, 1, 1, 1,
-0.59071, 0.09616366, -0.9818679, 1, 1, 1, 1, 1,
-0.5902719, -0.4162084, -1.639384, 1, 1, 1, 1, 1,
-0.589238, -0.7436866, -3.259519, 1, 1, 1, 1, 1,
-0.5887233, -1.412513, -2.434313, 1, 1, 1, 1, 1,
-0.5848671, 0.7112823, 0.4231201, 1, 1, 1, 1, 1,
-0.5815731, -0.3830912, -3.212942, 1, 1, 1, 1, 1,
-0.5809427, -0.204581, -0.9641721, 1, 1, 1, 1, 1,
-0.5711677, -0.6426601, -1.395163, 1, 1, 1, 1, 1,
-0.5582264, 0.03747638, -2.106282, 1, 1, 1, 1, 1,
-0.5575572, -0.8758606, -5.393117, 1, 1, 1, 1, 1,
-0.5567966, 0.6180472, -0.02511736, 1, 1, 1, 1, 1,
-0.5468405, -2.166776, -1.687714, 1, 1, 1, 1, 1,
-0.5446459, -0.1025344, -2.264956, 0, 0, 1, 1, 1,
-0.5417616, -0.2876671, -3.437088, 1, 0, 0, 1, 1,
-0.540875, 1.202475, -0.5179432, 1, 0, 0, 1, 1,
-0.5397812, 0.7575024, -2.767541, 1, 0, 0, 1, 1,
-0.5357931, 0.4715099, -1.695066, 1, 0, 0, 1, 1,
-0.5303457, -2.265215, -3.317314, 1, 0, 0, 1, 1,
-0.5200534, -0.6970661, -2.383605, 0, 0, 0, 1, 1,
-0.5183717, 1.133484, 0.8898938, 0, 0, 0, 1, 1,
-0.5167728, -1.476477, -3.394993, 0, 0, 0, 1, 1,
-0.5124658, -0.8307192, -3.667198, 0, 0, 0, 1, 1,
-0.5119303, 0.8203322, -1.004807, 0, 0, 0, 1, 1,
-0.5105199, 1.192641, -0.6719419, 0, 0, 0, 1, 1,
-0.5065389, 0.7873956, -2.498732, 0, 0, 0, 1, 1,
-0.5052078, -0.6080627, -3.749981, 1, 1, 1, 1, 1,
-0.503618, -0.2364569, -2.918332, 1, 1, 1, 1, 1,
-0.4983444, 0.6056786, -0.09730084, 1, 1, 1, 1, 1,
-0.4905207, -3.474902, -2.276031, 1, 1, 1, 1, 1,
-0.4888958, -0.9675068, -3.036707, 1, 1, 1, 1, 1,
-0.4868812, 1.661507, -0.01287391, 1, 1, 1, 1, 1,
-0.4858213, -0.4720695, -1.849747, 1, 1, 1, 1, 1,
-0.4834334, -0.6248903, -2.787455, 1, 1, 1, 1, 1,
-0.4809158, -1.102948, -2.28655, 1, 1, 1, 1, 1,
-0.4798048, 1.236336, 0.6458798, 1, 1, 1, 1, 1,
-0.4767474, -1.332006, -4.163099, 1, 1, 1, 1, 1,
-0.4743092, 0.7458735, 0.122665, 1, 1, 1, 1, 1,
-0.4730407, 1.055975, -1.96778, 1, 1, 1, 1, 1,
-0.4712826, 0.8032756, -0.3773913, 1, 1, 1, 1, 1,
-0.464891, 0.3770577, -3.345978, 1, 1, 1, 1, 1,
-0.4610034, -0.6485127, -2.834404, 0, 0, 1, 1, 1,
-0.4473158, 0.5994555, -0.6286204, 1, 0, 0, 1, 1,
-0.4419148, -2.111709, -3.256314, 1, 0, 0, 1, 1,
-0.4394452, -0.5908416, -4.389904, 1, 0, 0, 1, 1,
-0.4383276, -1.32664, -3.657872, 1, 0, 0, 1, 1,
-0.437427, -0.8087817, -1.067705, 1, 0, 0, 1, 1,
-0.4297466, -0.9526092, -2.818079, 0, 0, 0, 1, 1,
-0.4278381, -0.6452429, -2.082329, 0, 0, 0, 1, 1,
-0.424817, -1.42, -1.770564, 0, 0, 0, 1, 1,
-0.423158, -0.8300561, -1.554329, 0, 0, 0, 1, 1,
-0.420423, 2.307473, -0.8493714, 0, 0, 0, 1, 1,
-0.4159206, 0.5161365, -0.4185622, 0, 0, 0, 1, 1,
-0.4151343, 0.3756865, -0.2225649, 0, 0, 0, 1, 1,
-0.4137553, 0.2287069, -0.00466291, 1, 1, 1, 1, 1,
-0.4037146, -0.6710952, 0.6977112, 1, 1, 1, 1, 1,
-0.4026188, -1.351865, -3.955188, 1, 1, 1, 1, 1,
-0.4016547, -0.3852234, -0.8156496, 1, 1, 1, 1, 1,
-0.4015783, -0.005696779, -1.020211, 1, 1, 1, 1, 1,
-0.3997315, -1.089821, -1.851698, 1, 1, 1, 1, 1,
-0.3989819, 0.4811141, -1.171984, 1, 1, 1, 1, 1,
-0.3982377, -0.3644181, -3.637562, 1, 1, 1, 1, 1,
-0.3965402, 0.5288984, -1.592924, 1, 1, 1, 1, 1,
-0.3931113, 0.2783368, -0.6669859, 1, 1, 1, 1, 1,
-0.3920871, 0.4364026, -0.05949644, 1, 1, 1, 1, 1,
-0.3873846, -0.006827182, 2.101172, 1, 1, 1, 1, 1,
-0.3861924, 0.9178963, 1.349198, 1, 1, 1, 1, 1,
-0.3855186, -1.130396, -0.7557624, 1, 1, 1, 1, 1,
-0.3831768, -0.5287164, -3.829634, 1, 1, 1, 1, 1,
-0.3805833, 0.1495235, -1.775273, 0, 0, 1, 1, 1,
-0.3795242, 0.04305818, -1.186861, 1, 0, 0, 1, 1,
-0.3788846, -1.940744, -2.540214, 1, 0, 0, 1, 1,
-0.3772127, 0.824603, 0.04871596, 1, 0, 0, 1, 1,
-0.3767879, 0.1037536, 0.6076056, 1, 0, 0, 1, 1,
-0.3760274, 1.094978, -0.257607, 1, 0, 0, 1, 1,
-0.3759902, 0.4414154, -2.014024, 0, 0, 0, 1, 1,
-0.3700474, 1.678679, -1.049364, 0, 0, 0, 1, 1,
-0.3644564, 1.544787, 1.073331, 0, 0, 0, 1, 1,
-0.3602125, 1.423891, -1.630102, 0, 0, 0, 1, 1,
-0.359887, -0.4864616, -1.273509, 0, 0, 0, 1, 1,
-0.3566127, 0.179732, -1.649493, 0, 0, 0, 1, 1,
-0.356286, -0.1308237, -2.249348, 0, 0, 0, 1, 1,
-0.3555819, 0.2825488, 0.02516509, 1, 1, 1, 1, 1,
-0.3499521, -1.436054, -1.261135, 1, 1, 1, 1, 1,
-0.3466578, -0.5723658, -2.505277, 1, 1, 1, 1, 1,
-0.3457636, 1.585597, -1.291798, 1, 1, 1, 1, 1,
-0.3403338, -0.37761, -2.039646, 1, 1, 1, 1, 1,
-0.3395522, 0.6917588, -0.6461446, 1, 1, 1, 1, 1,
-0.3390989, 1.628324, -0.09943262, 1, 1, 1, 1, 1,
-0.3347611, -0.6924016, -1.752044, 1, 1, 1, 1, 1,
-0.3324881, 0.8206124, -0.3985431, 1, 1, 1, 1, 1,
-0.3310192, -1.340556, -0.6688564, 1, 1, 1, 1, 1,
-0.3309078, 0.5800568, 0.2155251, 1, 1, 1, 1, 1,
-0.3296846, -0.1930023, -2.030009, 1, 1, 1, 1, 1,
-0.3280888, 0.8837771, -0.5403486, 1, 1, 1, 1, 1,
-0.3247988, 0.2252265, -0.9063752, 1, 1, 1, 1, 1,
-0.3209394, -1.056926, -1.206672, 1, 1, 1, 1, 1,
-0.3165554, -0.08286542, -1.649339, 0, 0, 1, 1, 1,
-0.3138227, -0.7207985, -2.649671, 1, 0, 0, 1, 1,
-0.3094195, -1.715325, -2.324253, 1, 0, 0, 1, 1,
-0.3079517, -0.9395735, -2.251272, 1, 0, 0, 1, 1,
-0.2981783, 0.2548034, -1.423928, 1, 0, 0, 1, 1,
-0.2964089, -0.05340362, -3.381467, 1, 0, 0, 1, 1,
-0.2935718, -1.075875, -5.274823, 0, 0, 0, 1, 1,
-0.2877038, -1.759369, -3.664289, 0, 0, 0, 1, 1,
-0.2867236, -0.4465251, -3.216922, 0, 0, 0, 1, 1,
-0.283932, -0.8886767, -1.414287, 0, 0, 0, 1, 1,
-0.2826853, 0.3254859, -0.5622929, 0, 0, 0, 1, 1,
-0.2824682, -1.147615, -2.187144, 0, 0, 0, 1, 1,
-0.2794272, -0.4196766, -2.812862, 0, 0, 0, 1, 1,
-0.2771655, -0.2497642, -3.434959, 1, 1, 1, 1, 1,
-0.2741999, 1.51832, 0.1776132, 1, 1, 1, 1, 1,
-0.2718258, -0.5330016, -1.716435, 1, 1, 1, 1, 1,
-0.271558, -1.062624, -4.738702, 1, 1, 1, 1, 1,
-0.2684857, 0.196775, -0.3130724, 1, 1, 1, 1, 1,
-0.2683164, 0.5370536, 0.4170102, 1, 1, 1, 1, 1,
-0.2663026, 0.4708197, -0.7219812, 1, 1, 1, 1, 1,
-0.2662809, -0.4136191, -4.633251, 1, 1, 1, 1, 1,
-0.261296, 0.4762401, 0.4890893, 1, 1, 1, 1, 1,
-0.2572133, 0.2090615, -1.252885, 1, 1, 1, 1, 1,
-0.2531553, -0.1419908, -3.959506, 1, 1, 1, 1, 1,
-0.2515703, -0.5631052, -1.650977, 1, 1, 1, 1, 1,
-0.2506916, -0.2382636, -2.304369, 1, 1, 1, 1, 1,
-0.2487842, 0.1014851, 0.1498129, 1, 1, 1, 1, 1,
-0.2487601, 0.2119579, 0.7823956, 1, 1, 1, 1, 1,
-0.2478106, -0.1255724, -0.396448, 0, 0, 1, 1, 1,
-0.2439949, -0.3968018, -1.787127, 1, 0, 0, 1, 1,
-0.2405887, 0.09495127, -0.761222, 1, 0, 0, 1, 1,
-0.2347838, 0.2256002, -1.289036, 1, 0, 0, 1, 1,
-0.2347784, 0.5064917, -0.9155164, 1, 0, 0, 1, 1,
-0.2328141, -0.7701072, -2.387785, 1, 0, 0, 1, 1,
-0.2320494, -1.30795, -0.3815368, 0, 0, 0, 1, 1,
-0.2227985, -0.4398443, -2.501173, 0, 0, 0, 1, 1,
-0.2193526, -1.372869, -2.177871, 0, 0, 0, 1, 1,
-0.21905, -0.3307242, -2.764187, 0, 0, 0, 1, 1,
-0.211236, 0.3198666, -0.7023221, 0, 0, 0, 1, 1,
-0.2088223, 0.9666179, 0.3323845, 0, 0, 0, 1, 1,
-0.2081674, -0.4296887, -2.019586, 0, 0, 0, 1, 1,
-0.2056485, -1.25088, -3.77227, 1, 1, 1, 1, 1,
-0.2049972, 0.8052878, -2.493531, 1, 1, 1, 1, 1,
-0.1999442, 0.2310981, -1.981549, 1, 1, 1, 1, 1,
-0.1965786, 0.1256503, -0.02088757, 1, 1, 1, 1, 1,
-0.195099, -0.4005798, -2.540311, 1, 1, 1, 1, 1,
-0.1891064, 0.3729292, -0.8018543, 1, 1, 1, 1, 1,
-0.1829657, 0.2623837, -0.4405895, 1, 1, 1, 1, 1,
-0.1803879, 0.4300102, 0.7387152, 1, 1, 1, 1, 1,
-0.1752084, 0.9481412, -1.539868, 1, 1, 1, 1, 1,
-0.1735816, 1.617895, -1.362302, 1, 1, 1, 1, 1,
-0.1694488, 1.321579, -0.02937776, 1, 1, 1, 1, 1,
-0.169319, -0.5246022, -3.369219, 1, 1, 1, 1, 1,
-0.1688493, -0.4388075, -3.815674, 1, 1, 1, 1, 1,
-0.168122, 1.086316, -0.8667282, 1, 1, 1, 1, 1,
-0.1667556, -0.9754207, -4.182311, 1, 1, 1, 1, 1,
-0.1633394, 0.910351, -0.7290595, 0, 0, 1, 1, 1,
-0.1625852, -1.134064, -2.592049, 1, 0, 0, 1, 1,
-0.1605583, -0.06356429, -1.366007, 1, 0, 0, 1, 1,
-0.1552797, -0.2635929, -2.491901, 1, 0, 0, 1, 1,
-0.1542589, 2.183116, -0.1521305, 1, 0, 0, 1, 1,
-0.1537897, -0.3277245, -3.313263, 1, 0, 0, 1, 1,
-0.1514193, -0.1467593, -1.895788, 0, 0, 0, 1, 1,
-0.1498053, -0.2208948, -1.43391, 0, 0, 0, 1, 1,
-0.1479068, 2.309423, 0.2526156, 0, 0, 0, 1, 1,
-0.1449208, 0.4168897, -2.096873, 0, 0, 0, 1, 1,
-0.141231, -0.9259256, -2.881673, 0, 0, 0, 1, 1,
-0.1397357, 0.7707421, 0.6748843, 0, 0, 0, 1, 1,
-0.1334379, 1.112905, -0.4918818, 0, 0, 0, 1, 1,
-0.1318076, -0.0813401, -1.747659, 1, 1, 1, 1, 1,
-0.1299428, -1.891714, -4.503525, 1, 1, 1, 1, 1,
-0.1294821, -0.8102202, -1.750537, 1, 1, 1, 1, 1,
-0.1206371, -0.2915015, -1.696938, 1, 1, 1, 1, 1,
-0.1204213, 0.6420949, 0.06626679, 1, 1, 1, 1, 1,
-0.1106073, -0.1560816, -2.493418, 1, 1, 1, 1, 1,
-0.1081694, -0.7602614, -3.143304, 1, 1, 1, 1, 1,
-0.1076463, 1.692334, -1.303395, 1, 1, 1, 1, 1,
-0.107215, 2.361847, 0.1107638, 1, 1, 1, 1, 1,
-0.1024716, -1.777342, -3.55964, 1, 1, 1, 1, 1,
-0.09683542, -1.196337, -5.081928, 1, 1, 1, 1, 1,
-0.09443903, 1.540038, 1.09506, 1, 1, 1, 1, 1,
-0.09337835, 0.4606135, -0.1629115, 1, 1, 1, 1, 1,
-0.09303006, 0.5506223, -1.128759, 1, 1, 1, 1, 1,
-0.09116781, 0.4192712, -0.4394776, 1, 1, 1, 1, 1,
-0.08757631, -0.2248804, -4.610209, 0, 0, 1, 1, 1,
-0.08513058, 0.2319019, 0.1067928, 1, 0, 0, 1, 1,
-0.08290691, 1.530284, 0.7555287, 1, 0, 0, 1, 1,
-0.07900826, 0.08305984, -0.5891688, 1, 0, 0, 1, 1,
-0.07659454, -0.8973633, -2.149616, 1, 0, 0, 1, 1,
-0.07421181, 0.271699, -2.417353, 1, 0, 0, 1, 1,
-0.07014243, -0.7337092, -3.667709, 0, 0, 0, 1, 1,
-0.06631138, -1.553949, -1.525281, 0, 0, 0, 1, 1,
-0.06599645, 2.446827, 0.377736, 0, 0, 0, 1, 1,
-0.0592848, 1.146737, -0.4592507, 0, 0, 0, 1, 1,
-0.05808214, 1.662678, 1.364651, 0, 0, 0, 1, 1,
-0.05774818, 2.004842, -0.6514952, 0, 0, 0, 1, 1,
-0.04320848, -1.577916, -3.776009, 0, 0, 0, 1, 1,
-0.04295835, 0.2384277, -0.7890961, 1, 1, 1, 1, 1,
-0.04110693, 0.7615823, -0.6341811, 1, 1, 1, 1, 1,
-0.04105961, 1.606853, 0.09631609, 1, 1, 1, 1, 1,
-0.03644167, 0.2803086, -1.015789, 1, 1, 1, 1, 1,
-0.03410232, 0.2578968, -0.7415803, 1, 1, 1, 1, 1,
-0.02948393, 0.4612774, 0.1555714, 1, 1, 1, 1, 1,
-0.02511356, 0.1987317, -1.145166, 1, 1, 1, 1, 1,
-0.02181928, -0.6190289, -1.583309, 1, 1, 1, 1, 1,
-0.0214233, -0.2517157, -3.550745, 1, 1, 1, 1, 1,
-0.02122119, 0.9606416, -1.445813, 1, 1, 1, 1, 1,
-0.02113865, 0.8421167, -1.150159, 1, 1, 1, 1, 1,
-0.02108633, 0.6668363, 1.495412, 1, 1, 1, 1, 1,
-0.01875491, 0.2192087, -0.9156296, 1, 1, 1, 1, 1,
-0.01765426, 0.7787938, -0.008265408, 1, 1, 1, 1, 1,
-0.01385579, -0.6576777, -3.979018, 1, 1, 1, 1, 1,
-0.01222347, 0.3868157, 0.1618016, 0, 0, 1, 1, 1,
-0.009383119, 0.1432368, -0.7138541, 1, 0, 0, 1, 1,
-0.006377713, 1.129519, -1.801766, 1, 0, 0, 1, 1,
-0.002886427, 1.132085, -0.1198182, 1, 0, 0, 1, 1,
0.008394198, -0.8383493, 4.886024, 1, 0, 0, 1, 1,
0.009113491, -0.009752052, 2.034114, 1, 0, 0, 1, 1,
0.01107617, 0.1942331, -0.9764869, 0, 0, 0, 1, 1,
0.0128607, 2.024473, 0.02052192, 0, 0, 0, 1, 1,
0.01312714, -0.5416217, 2.870684, 0, 0, 0, 1, 1,
0.01650895, 0.4960816, -0.7004731, 0, 0, 0, 1, 1,
0.01685985, -0.6524231, 4.839812, 0, 0, 0, 1, 1,
0.01788975, 0.6529167, -0.06406242, 0, 0, 0, 1, 1,
0.02386527, -1.12987, 3.421458, 0, 0, 0, 1, 1,
0.02570579, -1.455683, 2.785221, 1, 1, 1, 1, 1,
0.03617208, -0.5741029, 4.414799, 1, 1, 1, 1, 1,
0.03788428, -0.647889, 2.729299, 1, 1, 1, 1, 1,
0.03924806, 0.6244237, -1.13155, 1, 1, 1, 1, 1,
0.03955767, 0.06970897, 0.1791709, 1, 1, 1, 1, 1,
0.04621638, 0.05595426, 0.7699084, 1, 1, 1, 1, 1,
0.05289946, -1.080181, 2.531105, 1, 1, 1, 1, 1,
0.06129238, 0.358569, 1.476363, 1, 1, 1, 1, 1,
0.0629928, -0.8684107, 1.678661, 1, 1, 1, 1, 1,
0.06761499, 0.02834766, 0.793973, 1, 1, 1, 1, 1,
0.07079356, -0.3794181, 3.946363, 1, 1, 1, 1, 1,
0.07473004, -1.533879, 2.621289, 1, 1, 1, 1, 1,
0.07630211, -0.2048196, 2.398174, 1, 1, 1, 1, 1,
0.07830629, -0.5589165, 2.565703, 1, 1, 1, 1, 1,
0.08014612, 0.8680441, -0.2413664, 1, 1, 1, 1, 1,
0.08606211, 0.8909671, 1.348321, 0, 0, 1, 1, 1,
0.08763132, 0.3031631, 2.613822, 1, 0, 0, 1, 1,
0.0888368, 0.2872204, 0.9010822, 1, 0, 0, 1, 1,
0.09016744, -0.897202, 1.621677, 1, 0, 0, 1, 1,
0.09051704, -1.634331, 3.154066, 1, 0, 0, 1, 1,
0.09252678, 1.928223, -0.03951146, 1, 0, 0, 1, 1,
0.09634069, 0.1235461, -0.5570573, 0, 0, 0, 1, 1,
0.09999642, 0.9723336, -0.2520657, 0, 0, 0, 1, 1,
0.1000018, -0.6675704, 3.120739, 0, 0, 0, 1, 1,
0.1018972, -0.1110144, 0.8477386, 0, 0, 0, 1, 1,
0.1033832, 0.1495817, 1.358075, 0, 0, 0, 1, 1,
0.1036411, 0.4182619, -0.7073052, 0, 0, 0, 1, 1,
0.1058345, 1.475373, 0.1274026, 0, 0, 0, 1, 1,
0.1061509, 1.157998, -0.2018051, 1, 1, 1, 1, 1,
0.1074456, 0.575581, -0.3295408, 1, 1, 1, 1, 1,
0.1075928, -0.4563607, 2.962157, 1, 1, 1, 1, 1,
0.1097636, -0.9046069, 2.91186, 1, 1, 1, 1, 1,
0.1123108, -0.6810844, 4.36626, 1, 1, 1, 1, 1,
0.1124255, -0.5288131, 2.804131, 1, 1, 1, 1, 1,
0.115609, -0.09112234, 3.652353, 1, 1, 1, 1, 1,
0.1185628, 0.8916754, -0.4251871, 1, 1, 1, 1, 1,
0.1213539, -1.191922, 3.170118, 1, 1, 1, 1, 1,
0.1223652, -1.178321, 4.182991, 1, 1, 1, 1, 1,
0.1231249, 1.225391, 1.826168, 1, 1, 1, 1, 1,
0.1242218, 0.001447138, -0.0318928, 1, 1, 1, 1, 1,
0.1255095, -0.7551485, 3.639111, 1, 1, 1, 1, 1,
0.1262251, 0.5973072, 1.366082, 1, 1, 1, 1, 1,
0.1274154, -1.319951, 1.666447, 1, 1, 1, 1, 1,
0.1307402, -0.7057084, 2.777151, 0, 0, 1, 1, 1,
0.1311742, -1.249397, 4.014528, 1, 0, 0, 1, 1,
0.1367256, -1.584475, 2.445144, 1, 0, 0, 1, 1,
0.1401934, -0.7298942, 3.620732, 1, 0, 0, 1, 1,
0.1413858, -0.9024207, 2.679777, 1, 0, 0, 1, 1,
0.1478714, -0.5460412, 1.305689, 1, 0, 0, 1, 1,
0.1523404, -0.1394902, 1.915849, 0, 0, 0, 1, 1,
0.1526669, 1.195642, 1.690587, 0, 0, 0, 1, 1,
0.1548253, -0.4347537, 3.50615, 0, 0, 0, 1, 1,
0.1608049, 1.422491, 1.741924, 0, 0, 0, 1, 1,
0.1629653, -0.1297281, 1.769882, 0, 0, 0, 1, 1,
0.1645665, -2.53195, 2.124588, 0, 0, 0, 1, 1,
0.1670267, 0.152836, 0.7871443, 0, 0, 0, 1, 1,
0.1723152, 1.105184, 1.919223, 1, 1, 1, 1, 1,
0.1756435, 0.3253388, 0.9769722, 1, 1, 1, 1, 1,
0.1828793, 1.368466, 0.4869618, 1, 1, 1, 1, 1,
0.1844876, 0.278973, 1.017083, 1, 1, 1, 1, 1,
0.1899981, -0.3503274, 3.71646, 1, 1, 1, 1, 1,
0.1924374, 0.07103602, 0.7336485, 1, 1, 1, 1, 1,
0.1924669, 0.00317928, 3.359048, 1, 1, 1, 1, 1,
0.1931976, -0.8031163, 4.575329, 1, 1, 1, 1, 1,
0.1946229, 0.04604527, -0.2612817, 1, 1, 1, 1, 1,
0.1955683, -1.200358, 3.749111, 1, 1, 1, 1, 1,
0.1962683, 1.279252, 0.623441, 1, 1, 1, 1, 1,
0.1970055, -1.357503, 2.68949, 1, 1, 1, 1, 1,
0.1994148, -1.34919, 4.416751, 1, 1, 1, 1, 1,
0.2062813, -0.5042592, 3.400205, 1, 1, 1, 1, 1,
0.2071275, -0.5194312, 1.232189, 1, 1, 1, 1, 1,
0.208833, -0.4310747, 1.195922, 0, 0, 1, 1, 1,
0.2115917, -0.05807159, 2.689027, 1, 0, 0, 1, 1,
0.2120169, 0.9408625, -0.1709606, 1, 0, 0, 1, 1,
0.2123812, -0.9938806, 0.3059316, 1, 0, 0, 1, 1,
0.2127265, -0.03885955, 1.026379, 1, 0, 0, 1, 1,
0.2139873, 0.971131, 0.5160043, 1, 0, 0, 1, 1,
0.2140078, -2.351563, 3.120525, 0, 0, 0, 1, 1,
0.2177286, -1.044936, 2.907226, 0, 0, 0, 1, 1,
0.2207005, 1.482989, 0.9764025, 0, 0, 0, 1, 1,
0.2208722, -1.707327, 2.572157, 0, 0, 0, 1, 1,
0.2284738, 0.7619361, -0.6681327, 0, 0, 0, 1, 1,
0.2307329, -0.4659153, 2.57843, 0, 0, 0, 1, 1,
0.2308578, -0.5489948, 2.181807, 0, 0, 0, 1, 1,
0.2332286, 0.3146126, 1.851617, 1, 1, 1, 1, 1,
0.2373028, -1.011806, 2.545211, 1, 1, 1, 1, 1,
0.2400491, 1.731239, -0.3575515, 1, 1, 1, 1, 1,
0.2440853, -0.5933136, 2.068488, 1, 1, 1, 1, 1,
0.2463985, 1.130091, 1.057925, 1, 1, 1, 1, 1,
0.2498395, -1.054102, 2.952034, 1, 1, 1, 1, 1,
0.2505328, -0.8375419, 2.769855, 1, 1, 1, 1, 1,
0.2507689, 0.9168469, -0.3526433, 1, 1, 1, 1, 1,
0.25989, -1.907674, 4.065273, 1, 1, 1, 1, 1,
0.2605174, -0.7115057, 2.256985, 1, 1, 1, 1, 1,
0.2611322, 0.7417478, 0.5214642, 1, 1, 1, 1, 1,
0.2618535, 1.450029, -0.8320534, 1, 1, 1, 1, 1,
0.2656421, -0.5765861, 4.682839, 1, 1, 1, 1, 1,
0.2681377, -0.612952, 3.047304, 1, 1, 1, 1, 1,
0.2708054, 0.5799811, -1.064994, 1, 1, 1, 1, 1,
0.2732031, 0.6823817, -0.6213077, 0, 0, 1, 1, 1,
0.2746767, -0.2616791, 2.222382, 1, 0, 0, 1, 1,
0.2748358, 0.505444, 0.3307537, 1, 0, 0, 1, 1,
0.2754146, 1.220608, 0.07533912, 1, 0, 0, 1, 1,
0.2763637, 0.3932608, 0.3815607, 1, 0, 0, 1, 1,
0.2767923, 1.079917, 0.09070588, 1, 0, 0, 1, 1,
0.2855544, 0.3232206, 0.00836571, 0, 0, 0, 1, 1,
0.2863235, -2.662546, 4.771559, 0, 0, 0, 1, 1,
0.2879775, 0.0610901, 1.940982, 0, 0, 0, 1, 1,
0.2914112, -0.7777486, 2.878604, 0, 0, 0, 1, 1,
0.2915184, -0.5710816, 2.802379, 0, 0, 0, 1, 1,
0.2956416, 0.2187052, 1.192366, 0, 0, 0, 1, 1,
0.2985827, 0.01099994, 1.965046, 0, 0, 0, 1, 1,
0.3012105, 0.7188396, -2.50618, 1, 1, 1, 1, 1,
0.3039497, -0.1485735, 3.16136, 1, 1, 1, 1, 1,
0.3067574, 0.4170768, 1.100022, 1, 1, 1, 1, 1,
0.3087309, 0.9253692, 0.2809598, 1, 1, 1, 1, 1,
0.3119579, 0.3100887, 0.06177154, 1, 1, 1, 1, 1,
0.312397, 1.221187, 1.414495, 1, 1, 1, 1, 1,
0.3152309, -0.4448147, 0.3065159, 1, 1, 1, 1, 1,
0.331624, -0.8497859, 3.792352, 1, 1, 1, 1, 1,
0.3319084, -1.880515, 2.984081, 1, 1, 1, 1, 1,
0.3343803, 1.069791, -0.08426811, 1, 1, 1, 1, 1,
0.3373775, 0.09623732, 2.282722, 1, 1, 1, 1, 1,
0.3424884, 0.410917, 0.3162179, 1, 1, 1, 1, 1,
0.3458044, -0.5798619, 1.381006, 1, 1, 1, 1, 1,
0.346718, -0.8582418, 3.049163, 1, 1, 1, 1, 1,
0.3468478, 0.3496771, 1.666601, 1, 1, 1, 1, 1,
0.3480492, -1.46393, 3.401187, 0, 0, 1, 1, 1,
0.3481018, 0.9459535, -0.08446495, 1, 0, 0, 1, 1,
0.3497914, -0.559379, 3.677534, 1, 0, 0, 1, 1,
0.3501467, -0.2845142, 2.847324, 1, 0, 0, 1, 1,
0.3557781, 0.06049427, 2.03968, 1, 0, 0, 1, 1,
0.3559693, -1.443723, 2.14543, 1, 0, 0, 1, 1,
0.3631002, 1.062203, -0.1505293, 0, 0, 0, 1, 1,
0.3643227, -1.309623, 3.963592, 0, 0, 0, 1, 1,
0.366554, 0.399666, 2.060713, 0, 0, 0, 1, 1,
0.3673989, -0.9453599, 2.29615, 0, 0, 0, 1, 1,
0.372029, -0.8189355, 1.633103, 0, 0, 0, 1, 1,
0.3755265, 0.2116038, 3.195875, 0, 0, 0, 1, 1,
0.3762975, 0.7116292, 0.2917138, 0, 0, 0, 1, 1,
0.3768193, 1.267076, 1.434979, 1, 1, 1, 1, 1,
0.3783929, 1.030057, -2.375279, 1, 1, 1, 1, 1,
0.3793878, 0.08141062, -0.1939062, 1, 1, 1, 1, 1,
0.3799468, -1.710143, 1.917803, 1, 1, 1, 1, 1,
0.3817969, 0.5800316, 1.752264, 1, 1, 1, 1, 1,
0.3847412, 2.167406, 1.221546, 1, 1, 1, 1, 1,
0.3872141, -0.5686181, 2.949207, 1, 1, 1, 1, 1,
0.3877334, 1.191368, 0.4496109, 1, 1, 1, 1, 1,
0.3884268, -0.7561022, 1.00379, 1, 1, 1, 1, 1,
0.3903906, 1.749153, 1.453634, 1, 1, 1, 1, 1,
0.3918729, -0.2211954, 1.594877, 1, 1, 1, 1, 1,
0.3964982, -0.226808, 1.814585, 1, 1, 1, 1, 1,
0.3998066, 0.9144903, -1.333975, 1, 1, 1, 1, 1,
0.4053021, 0.6194846, 0.7014941, 1, 1, 1, 1, 1,
0.4054467, 1.13004, -0.2346822, 1, 1, 1, 1, 1,
0.4135803, 0.5345186, 0.9225368, 0, 0, 1, 1, 1,
0.4167939, -1.882462, 3.278967, 1, 0, 0, 1, 1,
0.4196123, -0.9888441, 3.09317, 1, 0, 0, 1, 1,
0.4211616, -0.08882674, 0.2136695, 1, 0, 0, 1, 1,
0.423576, 0.02797006, 0.4876694, 1, 0, 0, 1, 1,
0.4256396, -0.3622635, 2.521322, 1, 0, 0, 1, 1,
0.428512, -0.2250819, 2.083955, 0, 0, 0, 1, 1,
0.4294078, -1.43288, 2.329494, 0, 0, 0, 1, 1,
0.4301567, 0.1534596, -0.3277725, 0, 0, 0, 1, 1,
0.4304337, -1.053879, 0.1170107, 0, 0, 0, 1, 1,
0.4312271, -0.4029649, 2.372357, 0, 0, 0, 1, 1,
0.4319939, 1.299675, 0.02030322, 0, 0, 0, 1, 1,
0.4338054, -2.087131, 2.670899, 0, 0, 0, 1, 1,
0.4464566, 0.5486344, 1.102905, 1, 1, 1, 1, 1,
0.4468494, -0.009260465, 1.19516, 1, 1, 1, 1, 1,
0.4490665, -0.002163492, 1.574493, 1, 1, 1, 1, 1,
0.4512799, 0.3800027, 1.388615, 1, 1, 1, 1, 1,
0.4517055, 0.2255599, 2.333101, 1, 1, 1, 1, 1,
0.4537281, 0.7054448, 1.635293, 1, 1, 1, 1, 1,
0.455365, 0.2957256, -0.1369401, 1, 1, 1, 1, 1,
0.4645613, -0.6380797, 1.84022, 1, 1, 1, 1, 1,
0.4681702, -0.4996251, 3.473245, 1, 1, 1, 1, 1,
0.4696918, -0.2854847, 0.5737616, 1, 1, 1, 1, 1,
0.4700926, -0.3639702, 3.23417, 1, 1, 1, 1, 1,
0.4701709, -1.955899, 5.797309, 1, 1, 1, 1, 1,
0.4736426, 0.04085635, 1.500286, 1, 1, 1, 1, 1,
0.4755931, 0.4989899, 0.2527568, 1, 1, 1, 1, 1,
0.4771227, 0.7025952, 0.836852, 1, 1, 1, 1, 1,
0.4833173, -0.06064758, 2.25248, 0, 0, 1, 1, 1,
0.4851804, -1.44162, 2.879273, 1, 0, 0, 1, 1,
0.4880603, 0.7310756, 0.4690037, 1, 0, 0, 1, 1,
0.4884197, -0.8342449, 2.881299, 1, 0, 0, 1, 1,
0.4886582, -0.9544672, 1.459394, 1, 0, 0, 1, 1,
0.4887211, -1.945141, 3.665731, 1, 0, 0, 1, 1,
0.4891547, 0.5686958, 0.7729518, 0, 0, 0, 1, 1,
0.4923328, 0.1605827, 2.232841, 0, 0, 0, 1, 1,
0.4924118, -1.922688, 1.585364, 0, 0, 0, 1, 1,
0.4994639, 0.4746448, 1.515065, 0, 0, 0, 1, 1,
0.5000916, -0.2392548, 0.689881, 0, 0, 0, 1, 1,
0.5039507, -0.04413963, 1.683237, 0, 0, 0, 1, 1,
0.5043961, -0.6626133, 0.5516317, 0, 0, 0, 1, 1,
0.5052255, -0.8805554, 2.514133, 1, 1, 1, 1, 1,
0.5055831, -0.7956792, 3.012454, 1, 1, 1, 1, 1,
0.5068267, -0.3334898, 3.343626, 1, 1, 1, 1, 1,
0.5213306, 0.5274092, -0.9570521, 1, 1, 1, 1, 1,
0.5234523, -0.3732044, 2.306989, 1, 1, 1, 1, 1,
0.5278179, 0.516031, 0.8551072, 1, 1, 1, 1, 1,
0.5342725, -0.09818166, 1.444631, 1, 1, 1, 1, 1,
0.5351335, 1.581289, 0.1634361, 1, 1, 1, 1, 1,
0.5384167, -0.1321342, 1.881893, 1, 1, 1, 1, 1,
0.5389563, -0.05805793, 1.330104, 1, 1, 1, 1, 1,
0.539714, -0.1845815, 3.531107, 1, 1, 1, 1, 1,
0.5424309, 2.142123, 0.7236516, 1, 1, 1, 1, 1,
0.551578, -2.897369, 2.339705, 1, 1, 1, 1, 1,
0.5531152, 0.428981, 3.016527, 1, 1, 1, 1, 1,
0.5681844, 0.08483671, 3.605824, 1, 1, 1, 1, 1,
0.5731511, 1.342622, -0.012373, 0, 0, 1, 1, 1,
0.57611, 0.3682249, -0.08599264, 1, 0, 0, 1, 1,
0.57734, 1.077808, 1.321013, 1, 0, 0, 1, 1,
0.5815898, 1.314056, -0.07242402, 1, 0, 0, 1, 1,
0.5831349, 1.14733, 1.540552, 1, 0, 0, 1, 1,
0.5838923, -0.8410844, 1.764062, 1, 0, 0, 1, 1,
0.5840774, 0.223359, 3.344398, 0, 0, 0, 1, 1,
0.5843608, -1.706877, 3.242077, 0, 0, 0, 1, 1,
0.5903516, -0.309976, 1.400202, 0, 0, 0, 1, 1,
0.5945702, -0.5386582, 0.9451213, 0, 0, 0, 1, 1,
0.5979109, -0.2100555, 2.733765, 0, 0, 0, 1, 1,
0.5997657, -0.7701738, 3.351134, 0, 0, 0, 1, 1,
0.6000024, -1.242957, 1.679637, 0, 0, 0, 1, 1,
0.6004568, -1.23967, 2.965146, 1, 1, 1, 1, 1,
0.6019466, -0.7861647, 0.182749, 1, 1, 1, 1, 1,
0.6022722, 0.4311686, 3.198578, 1, 1, 1, 1, 1,
0.6029206, -0.02964993, 2.124584, 1, 1, 1, 1, 1,
0.6074693, -2.266916, 2.480309, 1, 1, 1, 1, 1,
0.6131153, -0.5064878, 2.094727, 1, 1, 1, 1, 1,
0.6145942, 1.69621, -1.099383, 1, 1, 1, 1, 1,
0.6167605, -1.10036, 2.816599, 1, 1, 1, 1, 1,
0.6219921, -0.9879676, 0.7243428, 1, 1, 1, 1, 1,
0.6238829, -0.1041594, 0.9984683, 1, 1, 1, 1, 1,
0.6249475, 0.2701551, 0.8754067, 1, 1, 1, 1, 1,
0.6322224, -1.709474, 2.009154, 1, 1, 1, 1, 1,
0.6340655, 1.498948, 0.2764053, 1, 1, 1, 1, 1,
0.6393067, -0.1745338, 1.369503, 1, 1, 1, 1, 1,
0.6445217, 1.47714, 0.5849935, 1, 1, 1, 1, 1,
0.647891, 0.7457708, 1.160785, 0, 0, 1, 1, 1,
0.6539664, -0.4710211, 1.938733, 1, 0, 0, 1, 1,
0.6542001, -0.1949226, 1.48818, 1, 0, 0, 1, 1,
0.6556852, 0.9900557, -1.300335, 1, 0, 0, 1, 1,
0.6576745, 0.2223529, 2.095306, 1, 0, 0, 1, 1,
0.6601788, -0.03070832, 0.9664099, 1, 0, 0, 1, 1,
0.668719, 1.157704, 0.2773181, 0, 0, 0, 1, 1,
0.6687447, 0.3633946, 0.7877263, 0, 0, 0, 1, 1,
0.6706283, 1.038805, 1.635654, 0, 0, 0, 1, 1,
0.6716765, 1.345928, -0.1100533, 0, 0, 0, 1, 1,
0.6780619, 0.1853223, 0.883813, 0, 0, 0, 1, 1,
0.6795112, -0.4357699, 0.9586767, 0, 0, 0, 1, 1,
0.6849115, -1.085295, 1.750486, 0, 0, 0, 1, 1,
0.6870418, 1.097243, -0.6330929, 1, 1, 1, 1, 1,
0.6882596, -0.7466536, 1.600949, 1, 1, 1, 1, 1,
0.6885585, 0.3213328, 1.74917, 1, 1, 1, 1, 1,
0.6898941, 0.4916832, 2.172817, 1, 1, 1, 1, 1,
0.6914313, -1.551432, 2.188144, 1, 1, 1, 1, 1,
0.692389, 0.8118133, 1.146455, 1, 1, 1, 1, 1,
0.6988606, -1.087055, 4.631532, 1, 1, 1, 1, 1,
0.6991968, -1.310239, 2.4718, 1, 1, 1, 1, 1,
0.7006345, -0.7974368, 1.194533, 1, 1, 1, 1, 1,
0.7045376, -0.3917469, 3.187042, 1, 1, 1, 1, 1,
0.7098454, 0.1092608, 0.8153091, 1, 1, 1, 1, 1,
0.7104621, 0.1263325, 3.798922, 1, 1, 1, 1, 1,
0.7109542, 0.7077622, 2.092685, 1, 1, 1, 1, 1,
0.7209612, -1.258145, 1.585931, 1, 1, 1, 1, 1,
0.7250492, 0.7728822, 1.336931, 1, 1, 1, 1, 1,
0.73153, -1.735489, 2.321546, 0, 0, 1, 1, 1,
0.7382622, 0.503785, 1.065522, 1, 0, 0, 1, 1,
0.7490503, -0.4812075, 2.337757, 1, 0, 0, 1, 1,
0.7498421, 0.9497851, 0.7228997, 1, 0, 0, 1, 1,
0.7506975, -1.102243, 1.602593, 1, 0, 0, 1, 1,
0.7549115, -0.8421962, 1.289884, 1, 0, 0, 1, 1,
0.7590923, 0.1822294, 2.511255, 0, 0, 0, 1, 1,
0.7618445, 1.803653, 0.1023711, 0, 0, 0, 1, 1,
0.76404, 1.092641, 0.6347716, 0, 0, 0, 1, 1,
0.7646677, -0.1109612, 0.4858394, 0, 0, 0, 1, 1,
0.7661131, -0.731262, 2.022995, 0, 0, 0, 1, 1,
0.7683775, -1.136552, 2.578065, 0, 0, 0, 1, 1,
0.7738166, 0.05537355, 1.04294, 0, 0, 0, 1, 1,
0.7747141, 1.33805, 0.2711276, 1, 1, 1, 1, 1,
0.779932, -0.742247, 4.443757, 1, 1, 1, 1, 1,
0.7886147, 0.7965012, 0.06599178, 1, 1, 1, 1, 1,
0.7911546, -0.5396796, 2.00851, 1, 1, 1, 1, 1,
0.7980577, -1.154198, 1.767615, 1, 1, 1, 1, 1,
0.7983491, -0.9568266, 2.029316, 1, 1, 1, 1, 1,
0.8012276, 0.01888259, 2.279082, 1, 1, 1, 1, 1,
0.8058807, 1.398342, 0.3734645, 1, 1, 1, 1, 1,
0.8060924, -1.299873, 2.891281, 1, 1, 1, 1, 1,
0.8065693, -0.7956855, 1.347969, 1, 1, 1, 1, 1,
0.8148413, -0.3763843, 1.155886, 1, 1, 1, 1, 1,
0.8155587, -0.2266343, 2.708899, 1, 1, 1, 1, 1,
0.8164919, 0.9658383, 1.596658, 1, 1, 1, 1, 1,
0.8183461, -1.039907, 3.256045, 1, 1, 1, 1, 1,
0.8193056, 1.438388, -0.8021599, 1, 1, 1, 1, 1,
0.8259327, 0.483126, 1.471557, 0, 0, 1, 1, 1,
0.8260215, 1.347344, -0.5236661, 1, 0, 0, 1, 1,
0.8317068, -1.001404, 3.538393, 1, 0, 0, 1, 1,
0.8339555, 0.7166113, -1.234943, 1, 0, 0, 1, 1,
0.8368204, 1.30444, 0.7700745, 1, 0, 0, 1, 1,
0.8394049, -0.370176, 0.7251558, 1, 0, 0, 1, 1,
0.8439052, 0.1289181, -0.3896993, 0, 0, 0, 1, 1,
0.8485133, -1.471681, 0.6554385, 0, 0, 0, 1, 1,
0.8533081, -0.2418123, 2.431236, 0, 0, 0, 1, 1,
0.8565356, 1.68601, -0.2555389, 0, 0, 0, 1, 1,
0.8675211, 0.6943281, 1.604825, 0, 0, 0, 1, 1,
0.8764146, -1.083304, 1.994755, 0, 0, 0, 1, 1,
0.8822909, -1.733389, 2.184983, 0, 0, 0, 1, 1,
0.8829959, -0.09941301, 1.116471, 1, 1, 1, 1, 1,
0.8848182, -0.2293405, 1.35687, 1, 1, 1, 1, 1,
0.8864561, -0.3165922, 3.605702, 1, 1, 1, 1, 1,
0.8878321, -0.2213144, 1.608123, 1, 1, 1, 1, 1,
0.8899112, 0.6540735, 2.787862, 1, 1, 1, 1, 1,
0.8922092, 1.466521, 2.504713, 1, 1, 1, 1, 1,
0.8940471, 1.103471, 0.9558707, 1, 1, 1, 1, 1,
0.8962008, -0.4597675, 2.302798, 1, 1, 1, 1, 1,
0.8969236, 0.5083389, 0.1150842, 1, 1, 1, 1, 1,
0.8973548, 0.04042765, 2.155257, 1, 1, 1, 1, 1,
0.8990641, -1.2046, 4.985871, 1, 1, 1, 1, 1,
0.9006196, 0.197997, 1.147835, 1, 1, 1, 1, 1,
0.9015956, -0.1324942, 2.6948, 1, 1, 1, 1, 1,
0.9017416, 1.719067, -0.4538061, 1, 1, 1, 1, 1,
0.9068179, 0.5327267, 1.96272, 1, 1, 1, 1, 1,
0.9069707, -1.000983, 2.060447, 0, 0, 1, 1, 1,
0.9087211, 1.169479, -1.487683, 1, 0, 0, 1, 1,
0.9107752, 0.4774215, -0.4520139, 1, 0, 0, 1, 1,
0.9143317, 0.1166631, 2.689908, 1, 0, 0, 1, 1,
0.9160385, 0.06341533, 3.202717, 1, 0, 0, 1, 1,
0.9336079, -1.320447, 1.822811, 1, 0, 0, 1, 1,
0.9376288, 0.2339421, 2.809567, 0, 0, 0, 1, 1,
0.9397816, -9.434613e-05, 2.105737, 0, 0, 0, 1, 1,
0.9438654, -1.252391, 2.996135, 0, 0, 0, 1, 1,
0.9510756, 0.4514889, 3.104112, 0, 0, 0, 1, 1,
0.9539895, 0.3114005, 0.5675278, 0, 0, 0, 1, 1,
0.9544326, 0.532149, 0.5845944, 0, 0, 0, 1, 1,
0.9597831, 2.056988, -0.4387972, 0, 0, 0, 1, 1,
0.978867, 1.006191, 0.3621346, 1, 1, 1, 1, 1,
0.9791089, -1.795649, 2.255395, 1, 1, 1, 1, 1,
0.9827438, 1.258211, 0.5971835, 1, 1, 1, 1, 1,
0.9842067, -0.2776938, 0.6741654, 1, 1, 1, 1, 1,
0.9877663, -1.195316, 3.598925, 1, 1, 1, 1, 1,
0.9885303, 0.5012975, 1.767499, 1, 1, 1, 1, 1,
0.9890249, 0.9197671, 0.1261478, 1, 1, 1, 1, 1,
1.011999, 1.028067, 1.011474, 1, 1, 1, 1, 1,
1.014718, -1.087769, 2.008679, 1, 1, 1, 1, 1,
1.017046, -0.2754019, 1.854449, 1, 1, 1, 1, 1,
1.018036, 1.211565, 1.027275, 1, 1, 1, 1, 1,
1.021588, -0.7232816, 1.867489, 1, 1, 1, 1, 1,
1.02395, -0.1179256, 3.511713, 1, 1, 1, 1, 1,
1.029984, 0.3693988, 0.4204693, 1, 1, 1, 1, 1,
1.030349, 2.075429, 1.65618, 1, 1, 1, 1, 1,
1.035545, 0.1320315, 0.7882067, 0, 0, 1, 1, 1,
1.036154, 1.314771, 1.118963, 1, 0, 0, 1, 1,
1.037684, -0.4096165, 0.6478426, 1, 0, 0, 1, 1,
1.037701, -0.3309497, 0.1241509, 1, 0, 0, 1, 1,
1.051715, -0.7838941, 1.867571, 1, 0, 0, 1, 1,
1.065773, 0.6612996, 0.6553242, 1, 0, 0, 1, 1,
1.06665, 1.894233, 2.999723, 0, 0, 0, 1, 1,
1.07224, -0.04782017, 1.983981, 0, 0, 0, 1, 1,
1.07256, 0.2475632, 0.4547893, 0, 0, 0, 1, 1,
1.07867, -0.1748492, 1.75053, 0, 0, 0, 1, 1,
1.086702, -0.1308087, 2.234232, 0, 0, 0, 1, 1,
1.089922, -1.073867, 2.237857, 0, 0, 0, 1, 1,
1.094467, 0.3746866, 2.218599, 0, 0, 0, 1, 1,
1.096785, 0.6064775, 1.439773, 1, 1, 1, 1, 1,
1.09882, 1.454089, -0.7602472, 1, 1, 1, 1, 1,
1.100265, 0.1999936, 0.4495554, 1, 1, 1, 1, 1,
1.100975, -0.7101632, 1.106007, 1, 1, 1, 1, 1,
1.102842, 0.6805686, 1.515364, 1, 1, 1, 1, 1,
1.104504, 1.150604, 2.430036, 1, 1, 1, 1, 1,
1.10587, -0.949806, 3.502226, 1, 1, 1, 1, 1,
1.1115, -0.2295663, 0.8662784, 1, 1, 1, 1, 1,
1.113811, 0.3281549, 2.172841, 1, 1, 1, 1, 1,
1.117554, -0.9789333, 2.652086, 1, 1, 1, 1, 1,
1.142572, -0.1383001, 0.4268652, 1, 1, 1, 1, 1,
1.159393, 0.1327759, 2.126116, 1, 1, 1, 1, 1,
1.159885, 0.1349368, 2.437011, 1, 1, 1, 1, 1,
1.162703, 0.1889637, 1.938825, 1, 1, 1, 1, 1,
1.165101, 0.1360168, 2.568616, 1, 1, 1, 1, 1,
1.170267, 1.439988, -0.08946749, 0, 0, 1, 1, 1,
1.176668, -0.2856641, 2.570545, 1, 0, 0, 1, 1,
1.177719, -0.6760525, 2.380774, 1, 0, 0, 1, 1,
1.183256, 0.03340509, 2.169121, 1, 0, 0, 1, 1,
1.184206, 1.186618, 1.433319, 1, 0, 0, 1, 1,
1.194272, -0.06565348, 1.019894, 1, 0, 0, 1, 1,
1.194351, -0.5131913, 2.403127, 0, 0, 0, 1, 1,
1.194408, 2.265797, 0.3494649, 0, 0, 0, 1, 1,
1.199059, -0.5908226, 2.332554, 0, 0, 0, 1, 1,
1.199292, -0.6258633, 2.567088, 0, 0, 0, 1, 1,
1.206576, 0.7364072, 2.669062, 0, 0, 0, 1, 1,
1.20728, -0.4811623, 0.8720893, 0, 0, 0, 1, 1,
1.212952, 1.390166, 2.15885, 0, 0, 0, 1, 1,
1.223146, 1.859796, -0.3851098, 1, 1, 1, 1, 1,
1.227856, 0.4671983, -0.07078105, 1, 1, 1, 1, 1,
1.228354, 0.2649098, -0.7051867, 1, 1, 1, 1, 1,
1.240517, 1.498792, 0.268886, 1, 1, 1, 1, 1,
1.244156, 1.148466, 1.749927, 1, 1, 1, 1, 1,
1.24555, -0.01300434, 3.279594, 1, 1, 1, 1, 1,
1.250905, 1.248231, 3.113815, 1, 1, 1, 1, 1,
1.263308, -0.7134151, 1.023887, 1, 1, 1, 1, 1,
1.264894, -0.7703187, 1.552337, 1, 1, 1, 1, 1,
1.278196, 0.4163971, -1.375722, 1, 1, 1, 1, 1,
1.284937, 0.2921716, 2.081872, 1, 1, 1, 1, 1,
1.285566, 0.4452136, 0.8821275, 1, 1, 1, 1, 1,
1.304295, -0.4366767, 2.633703, 1, 1, 1, 1, 1,
1.307308, -0.5051631, 3.196267, 1, 1, 1, 1, 1,
1.309562, -0.6261946, 3.058685, 1, 1, 1, 1, 1,
1.312299, 0.5168191, 2.303207, 0, 0, 1, 1, 1,
1.326014, 0.06309494, 0.4237416, 1, 0, 0, 1, 1,
1.328194, 0.5964416, 3.094026, 1, 0, 0, 1, 1,
1.33104, 0.7647539, 0.2835572, 1, 0, 0, 1, 1,
1.339843, -0.3116831, 2.853544, 1, 0, 0, 1, 1,
1.340978, 0.5702221, -0.29377, 1, 0, 0, 1, 1,
1.34158, -0.4895867, 1.878801, 0, 0, 0, 1, 1,
1.342203, -2.73445, 2.119309, 0, 0, 0, 1, 1,
1.351058, 0.5761455, -0.1794801, 0, 0, 0, 1, 1,
1.359313, 0.08764451, 0.07013651, 0, 0, 0, 1, 1,
1.375009, -0.5913047, 1.873538, 0, 0, 0, 1, 1,
1.380785, -0.4448937, 1.511754, 0, 0, 0, 1, 1,
1.396905, 1.950883, 1.977438, 0, 0, 0, 1, 1,
1.396977, -1.544898, 1.713646, 1, 1, 1, 1, 1,
1.398768, 2.865788, -0.07921117, 1, 1, 1, 1, 1,
1.405266, -0.6803344, 2.003335, 1, 1, 1, 1, 1,
1.410952, 1.698558, 0.9562472, 1, 1, 1, 1, 1,
1.412285, -0.01896591, 2.985435, 1, 1, 1, 1, 1,
1.413442, 1.579713, 1.55681, 1, 1, 1, 1, 1,
1.414288, 0.5910119, 0.6631263, 1, 1, 1, 1, 1,
1.419255, -0.6475872, 1.801967, 1, 1, 1, 1, 1,
1.432543, -1.304449, 0.2040659, 1, 1, 1, 1, 1,
1.433403, 0.1183974, 3.220295, 1, 1, 1, 1, 1,
1.434307, 1.517939, -0.5250756, 1, 1, 1, 1, 1,
1.43945, 0.8039611, 0.6978742, 1, 1, 1, 1, 1,
1.443891, 0.2931682, 2.281239, 1, 1, 1, 1, 1,
1.449629, -0.5997558, 0.9942268, 1, 1, 1, 1, 1,
1.451485, -0.6972716, 1.965901, 1, 1, 1, 1, 1,
1.45355, -0.439468, 3.134255, 0, 0, 1, 1, 1,
1.459277, 0.4206744, 1.157559, 1, 0, 0, 1, 1,
1.461985, 0.2997941, 1.479338, 1, 0, 0, 1, 1,
1.464531, -0.05578677, 0.9038218, 1, 0, 0, 1, 1,
1.498616, 1.368519, 1.483274, 1, 0, 0, 1, 1,
1.512869, 1.937877, 1.502096, 1, 0, 0, 1, 1,
1.524135, -0.4000314, 3.805476, 0, 0, 0, 1, 1,
1.526627, -0.6182005, 2.723418, 0, 0, 0, 1, 1,
1.528478, -1.112204, 0.7183918, 0, 0, 0, 1, 1,
1.530227, 0.7388998, -0.1835349, 0, 0, 0, 1, 1,
1.541072, 1.478944, 1.76768, 0, 0, 0, 1, 1,
1.543038, -1.165964, 2.263932, 0, 0, 0, 1, 1,
1.547813, 0.08652326, 2.036471, 0, 0, 0, 1, 1,
1.550524, 1.345135, 1.108648, 1, 1, 1, 1, 1,
1.56049, 0.7363638, 0.5662692, 1, 1, 1, 1, 1,
1.567308, -0.1526758, 4.258795, 1, 1, 1, 1, 1,
1.587307, 1.079566, 0.7267771, 1, 1, 1, 1, 1,
1.595205, 1.115799, 1.274395, 1, 1, 1, 1, 1,
1.604922, -0.3806615, 2.292035, 1, 1, 1, 1, 1,
1.617395, -0.09854607, 2.309085, 1, 1, 1, 1, 1,
1.618844, -1.31697, 2.241855, 1, 1, 1, 1, 1,
1.625808, -1.080208, 1.167497, 1, 1, 1, 1, 1,
1.627046, -0.9238614, 2.113559, 1, 1, 1, 1, 1,
1.63701, -1.231844, 0.9440232, 1, 1, 1, 1, 1,
1.637683, 0.2143349, 0.5275866, 1, 1, 1, 1, 1,
1.638955, -1.27484, 2.596001, 1, 1, 1, 1, 1,
1.641998, 1.746056, 0.04534617, 1, 1, 1, 1, 1,
1.692545, -0.8575897, 2.995409, 1, 1, 1, 1, 1,
1.727782, -0.8186871, 2.412695, 0, 0, 1, 1, 1,
1.731384, -0.356974, 0.7079329, 1, 0, 0, 1, 1,
1.746351, -0.6737552, 1.41042, 1, 0, 0, 1, 1,
1.74702, -0.4686194, 1.062307, 1, 0, 0, 1, 1,
1.761344, -0.1170376, -0.3643637, 1, 0, 0, 1, 1,
1.768027, -0.3209418, 1.372434, 1, 0, 0, 1, 1,
1.790628, -0.157721, 1.037908, 0, 0, 0, 1, 1,
1.792053, 0.4691851, 0.9093427, 0, 0, 0, 1, 1,
1.834796, 1.712767, 1.363718, 0, 0, 0, 1, 1,
1.848135, -1.081632, 0.5414467, 0, 0, 0, 1, 1,
1.851027, 2.365446, 0.9847145, 0, 0, 0, 1, 1,
1.854164, 0.4544674, 0.2407785, 0, 0, 0, 1, 1,
1.856818, -0.3453082, 2.124645, 0, 0, 0, 1, 1,
1.88322, 1.029711, 1.372768, 1, 1, 1, 1, 1,
1.901753, 0.3603778, 1.494476, 1, 1, 1, 1, 1,
1.916391, 1.226326, 1.970988, 1, 1, 1, 1, 1,
1.920155, -1.066937, 1.469872, 1, 1, 1, 1, 1,
1.923229, -0.06819163, 0.731607, 1, 1, 1, 1, 1,
1.927954, -0.4517724, 3.100206, 1, 1, 1, 1, 1,
1.929274, -1.854801, 2.813136, 1, 1, 1, 1, 1,
1.936846, -1.437073, 2.57014, 1, 1, 1, 1, 1,
1.937047, -0.4966961, 2.047774, 1, 1, 1, 1, 1,
1.949151, 2.098337, 1.838358, 1, 1, 1, 1, 1,
1.963273, 0.1045394, 2.385891, 1, 1, 1, 1, 1,
1.963533, -0.1223899, 0.8433517, 1, 1, 1, 1, 1,
1.965033, -0.7426758, 2.875543, 1, 1, 1, 1, 1,
1.98488, 0.05058799, 0.8797989, 1, 1, 1, 1, 1,
1.985203, -0.95408, 1.233294, 1, 1, 1, 1, 1,
1.989964, 0.8012409, 0.4279028, 0, 0, 1, 1, 1,
2.002562, 0.6217955, 1.034676, 1, 0, 0, 1, 1,
2.008146, -0.4141867, -0.1440741, 1, 0, 0, 1, 1,
2.026221, -0.5403816, 2.365983, 1, 0, 0, 1, 1,
2.079715, -0.6836887, 1.570029, 1, 0, 0, 1, 1,
2.086738, 0.1408272, 1.477326, 1, 0, 0, 1, 1,
2.105981, 1.468268, 1.145939, 0, 0, 0, 1, 1,
2.218678, -1.026131, 1.434352, 0, 0, 0, 1, 1,
2.241842, 0.1918733, 1.988752, 0, 0, 0, 1, 1,
2.244043, 1.745066, 1.551648, 0, 0, 0, 1, 1,
2.288672, -1.415776, 1.532857, 0, 0, 0, 1, 1,
2.299498, 1.894931, 1.826927, 0, 0, 0, 1, 1,
2.305503, 0.1003004, 3.191997, 0, 0, 0, 1, 1,
2.32906, 0.6442615, 1.410436, 1, 1, 1, 1, 1,
2.346678, 0.7036904, 2.112003, 1, 1, 1, 1, 1,
2.567929, -0.4680746, 2.200915, 1, 1, 1, 1, 1,
2.584639, -0.1256762, 0.9152073, 1, 1, 1, 1, 1,
3.11935, 0.08023085, 1.611403, 1, 1, 1, 1, 1,
3.253371, 0.4598703, 2.39752, 1, 1, 1, 1, 1,
3.719883, 0.4692332, -0.02321889, 1, 1, 1, 1, 1
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
var radius = 10.00449;
var distance = 35.14034;
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
mvMatrix.translate( -0.04760432, 0.3045571, -0.2020957 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.14034);
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
