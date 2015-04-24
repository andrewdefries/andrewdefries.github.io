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
-3.868475, 1.2331, -0.9888939, 1, 0, 0, 1,
-3.748419, 1.897966, -2.205472, 1, 0.007843138, 0, 1,
-3.482296, -2.244503, -2.623898, 1, 0.01176471, 0, 1,
-3.276003, 0.4401336, -2.121954, 1, 0.01960784, 0, 1,
-2.926004, -0.5363181, -0.6449067, 1, 0.02352941, 0, 1,
-2.875811, 1.163367, -0.7786142, 1, 0.03137255, 0, 1,
-2.857413, 1.401822, -1.526162, 1, 0.03529412, 0, 1,
-2.81343, -0.01624328, -1.612192, 1, 0.04313726, 0, 1,
-2.795907, 0.900424, -1.109819, 1, 0.04705882, 0, 1,
-2.749036, -0.6041931, -0.6048005, 1, 0.05490196, 0, 1,
-2.556361, 0.008387649, -2.733305, 1, 0.05882353, 0, 1,
-2.553387, -2.01765, -2.304895, 1, 0.06666667, 0, 1,
-2.515055, 0.6491346, -2.148875, 1, 0.07058824, 0, 1,
-2.396373, -0.9170648, -1.199579, 1, 0.07843138, 0, 1,
-2.356675, -1.856881, -1.946769, 1, 0.08235294, 0, 1,
-2.355407, 1.323418, -2.486202, 1, 0.09019608, 0, 1,
-2.339727, 0.4108783, 0.4505473, 1, 0.09411765, 0, 1,
-2.246493, -1.544756, -1.130525, 1, 0.1019608, 0, 1,
-2.206899, -0.936255, -1.761086, 1, 0.1098039, 0, 1,
-2.187154, 0.5235115, -1.339921, 1, 0.1137255, 0, 1,
-2.178778, -0.588121, -1.505543, 1, 0.1215686, 0, 1,
-2.151876, 1.329931, -0.1663066, 1, 0.1254902, 0, 1,
-2.060263, 0.2457242, -2.42773, 1, 0.1333333, 0, 1,
-2.057625, -1.48484, -2.028316, 1, 0.1372549, 0, 1,
-2.045831, -0.214992, -1.503693, 1, 0.145098, 0, 1,
-2.026415, 0.6390109, -1.617124, 1, 0.1490196, 0, 1,
-2.023293, 1.355047, -2.420358, 1, 0.1568628, 0, 1,
-2.021152, -2.225364, -2.177665, 1, 0.1607843, 0, 1,
-2.007994, -1.802592, -1.849265, 1, 0.1686275, 0, 1,
-1.996904, -1.04813, -0.09019255, 1, 0.172549, 0, 1,
-1.995133, -1.430842, -2.029191, 1, 0.1803922, 0, 1,
-1.993714, 1.552716, -0.4318495, 1, 0.1843137, 0, 1,
-1.972246, -1.621969, -2.710837, 1, 0.1921569, 0, 1,
-1.945076, 0.46189, -1.966847, 1, 0.1960784, 0, 1,
-1.927821, -1.146111, -2.589093, 1, 0.2039216, 0, 1,
-1.924914, -1.268426, -3.577296, 1, 0.2117647, 0, 1,
-1.864318, -0.2204872, -1.910451, 1, 0.2156863, 0, 1,
-1.85923, 0.9903199, -0.6102577, 1, 0.2235294, 0, 1,
-1.836239, 0.06343621, -3.469256, 1, 0.227451, 0, 1,
-1.834548, -0.460744, -1.917338, 1, 0.2352941, 0, 1,
-1.812206, -0.2913573, -3.03006, 1, 0.2392157, 0, 1,
-1.811855, 0.2740012, -4.025719, 1, 0.2470588, 0, 1,
-1.797174, 2.562531, -0.7355418, 1, 0.2509804, 0, 1,
-1.77791, 1.986187, -1.153208, 1, 0.2588235, 0, 1,
-1.775097, -0.3175765, -2.766568, 1, 0.2627451, 0, 1,
-1.76242, -0.09839977, -1.470819, 1, 0.2705882, 0, 1,
-1.747671, -0.3215238, -1.576476, 1, 0.2745098, 0, 1,
-1.746133, -0.09609102, -2.337549, 1, 0.282353, 0, 1,
-1.744774, 1.649013, -1.832196, 1, 0.2862745, 0, 1,
-1.744149, 0.03125444, -2.037231, 1, 0.2941177, 0, 1,
-1.73229, 1.749341, -1.162334, 1, 0.3019608, 0, 1,
-1.729802, 0.5823377, 0.2183642, 1, 0.3058824, 0, 1,
-1.722648, -0.4659585, -2.487582, 1, 0.3137255, 0, 1,
-1.715716, -0.1171903, -1.615064, 1, 0.3176471, 0, 1,
-1.70939, -0.3476599, -1.288122, 1, 0.3254902, 0, 1,
-1.704824, -0.9664311, -2.0653, 1, 0.3294118, 0, 1,
-1.699493, 0.2440316, -1.755548, 1, 0.3372549, 0, 1,
-1.688874, 0.05731452, -2.245286, 1, 0.3411765, 0, 1,
-1.681677, -0.4287628, -0.6192989, 1, 0.3490196, 0, 1,
-1.677155, -0.3106958, -2.154059, 1, 0.3529412, 0, 1,
-1.676912, -0.6048244, -0.8722879, 1, 0.3607843, 0, 1,
-1.668004, 0.8427604, -1.075597, 1, 0.3647059, 0, 1,
-1.664743, -1.064299, -2.217768, 1, 0.372549, 0, 1,
-1.634055, -1.869956, -1.653942, 1, 0.3764706, 0, 1,
-1.632418, 1.162259, 0.2808267, 1, 0.3843137, 0, 1,
-1.625572, -0.1050926, -2.250931, 1, 0.3882353, 0, 1,
-1.597176, 0.4055595, 0.3343497, 1, 0.3960784, 0, 1,
-1.587517, -0.2825294, -2.690043, 1, 0.4039216, 0, 1,
-1.582899, 1.259998, -4.152005, 1, 0.4078431, 0, 1,
-1.579747, 1.72888, -1.209132, 1, 0.4156863, 0, 1,
-1.546755, 1.378972, -0.2330962, 1, 0.4196078, 0, 1,
-1.546573, 0.1213074, -1.72775, 1, 0.427451, 0, 1,
-1.54559, -0.9883264, -3.962755, 1, 0.4313726, 0, 1,
-1.545282, -0.0583865, -0.7419005, 1, 0.4392157, 0, 1,
-1.541873, -0.08107647, -1.279409, 1, 0.4431373, 0, 1,
-1.541115, -1.880757, -0.4763832, 1, 0.4509804, 0, 1,
-1.524421, -0.4679643, -1.934827, 1, 0.454902, 0, 1,
-1.523271, -0.4280005, -0.7484657, 1, 0.4627451, 0, 1,
-1.520567, 1.739588, -0.7595168, 1, 0.4666667, 0, 1,
-1.505022, 1.131049, -1.304171, 1, 0.4745098, 0, 1,
-1.503869, 0.6397455, -1.468758, 1, 0.4784314, 0, 1,
-1.502551, 0.7950708, -1.271754, 1, 0.4862745, 0, 1,
-1.477625, 1.583335, -0.7523612, 1, 0.4901961, 0, 1,
-1.472181, -0.4879479, -2.827735, 1, 0.4980392, 0, 1,
-1.468342, -1.051966, -2.308982, 1, 0.5058824, 0, 1,
-1.466139, -1.418612, -3.10406, 1, 0.509804, 0, 1,
-1.464412, -2.15888, -2.83045, 1, 0.5176471, 0, 1,
-1.461444, 1.087413, -1.512216, 1, 0.5215687, 0, 1,
-1.453675, 0.826773, 0.8773587, 1, 0.5294118, 0, 1,
-1.452405, -0.2521201, -2.081138, 1, 0.5333334, 0, 1,
-1.451422, 1.302456, -1.631015, 1, 0.5411765, 0, 1,
-1.4416, 0.9563146, -0.4830364, 1, 0.5450981, 0, 1,
-1.429645, 0.1055571, -1.139348, 1, 0.5529412, 0, 1,
-1.424513, -1.769755, -3.149995, 1, 0.5568628, 0, 1,
-1.417898, 0.234732, -0.9697389, 1, 0.5647059, 0, 1,
-1.412955, 0.2918726, -1.427656, 1, 0.5686275, 0, 1,
-1.409242, 0.2023645, -0.9706901, 1, 0.5764706, 0, 1,
-1.407646, -0.502072, -0.6785623, 1, 0.5803922, 0, 1,
-1.398829, 1.304063, 0.07066511, 1, 0.5882353, 0, 1,
-1.396601, -0.9686994, -1.076256, 1, 0.5921569, 0, 1,
-1.388096, -0.9972188, -1.178441, 1, 0.6, 0, 1,
-1.387245, -0.04123286, -1.028728, 1, 0.6078432, 0, 1,
-1.384213, -1.179519, -3.872251, 1, 0.6117647, 0, 1,
-1.381153, 1.07761, -1.562474, 1, 0.6196079, 0, 1,
-1.36382, -0.5770692, -1.511615, 1, 0.6235294, 0, 1,
-1.363311, 1.737, -1.842866, 1, 0.6313726, 0, 1,
-1.354475, -1.85804, -2.64133, 1, 0.6352941, 0, 1,
-1.353012, 1.01089, -0.9203836, 1, 0.6431373, 0, 1,
-1.349976, -1.42969, -2.337053, 1, 0.6470588, 0, 1,
-1.339278, -1.124326, -3.002648, 1, 0.654902, 0, 1,
-1.329129, -0.3303869, -2.263886, 1, 0.6588235, 0, 1,
-1.317876, 0.8490608, 0.2947153, 1, 0.6666667, 0, 1,
-1.312272, -1.431107, -2.39347, 1, 0.6705883, 0, 1,
-1.307987, -0.3725044, -0.5647645, 1, 0.6784314, 0, 1,
-1.294807, 0.2415212, -0.8132432, 1, 0.682353, 0, 1,
-1.294248, 1.683561, -1.824584, 1, 0.6901961, 0, 1,
-1.273065, 0.3148738, -2.365972, 1, 0.6941177, 0, 1,
-1.270828, 2.499398, 0.4090448, 1, 0.7019608, 0, 1,
-1.270811, -0.9696463, -1.446167, 1, 0.7098039, 0, 1,
-1.270184, 0.8453153, -0.7042875, 1, 0.7137255, 0, 1,
-1.253899, 0.6931857, -1.107841, 1, 0.7215686, 0, 1,
-1.250828, -1.250284, -1.050884, 1, 0.7254902, 0, 1,
-1.24645, 0.1245191, -3.326997, 1, 0.7333333, 0, 1,
-1.245038, -1.312544, -2.594817, 1, 0.7372549, 0, 1,
-1.244276, -1.302038, -2.901622, 1, 0.7450981, 0, 1,
-1.238772, 0.3300295, -0.4327309, 1, 0.7490196, 0, 1,
-1.231115, 1.180459, -1.040116, 1, 0.7568628, 0, 1,
-1.218969, -0.9639782, -1.37065, 1, 0.7607843, 0, 1,
-1.210716, -0.7725471, -1.876518, 1, 0.7686275, 0, 1,
-1.205973, 0.5631996, -0.2448998, 1, 0.772549, 0, 1,
-1.200873, 0.6592023, 0.9038967, 1, 0.7803922, 0, 1,
-1.195656, 0.561702, -1.030422, 1, 0.7843137, 0, 1,
-1.190901, 0.4774566, -1.551505, 1, 0.7921569, 0, 1,
-1.179404, 0.9133503, 0.00991195, 1, 0.7960784, 0, 1,
-1.177368, 0.6667648, 0.1299397, 1, 0.8039216, 0, 1,
-1.176613, -1.041252, -2.430331, 1, 0.8117647, 0, 1,
-1.174079, -1.033169, -3.62624, 1, 0.8156863, 0, 1,
-1.170893, 0.9240338, -0.7987268, 1, 0.8235294, 0, 1,
-1.170846, -0.5084926, -3.313234, 1, 0.827451, 0, 1,
-1.168206, -1.277331, -1.899987, 1, 0.8352941, 0, 1,
-1.161615, -1.846526, -2.712846, 1, 0.8392157, 0, 1,
-1.151853, -0.1020835, -0.2072556, 1, 0.8470588, 0, 1,
-1.139771, 0.2108641, -1.957602, 1, 0.8509804, 0, 1,
-1.135848, -0.961396, -3.81898, 1, 0.8588235, 0, 1,
-1.130967, 1.610296, -0.5768635, 1, 0.8627451, 0, 1,
-1.130439, -1.32297, -2.906684, 1, 0.8705882, 0, 1,
-1.129884, -0.4519954, -1.840672, 1, 0.8745098, 0, 1,
-1.119524, 0.9841543, -2.895952, 1, 0.8823529, 0, 1,
-1.118942, 0.6549049, 0.13886, 1, 0.8862745, 0, 1,
-1.11868, -0.4343409, -1.415298, 1, 0.8941177, 0, 1,
-1.111673, -0.9113837, -1.144279, 1, 0.8980392, 0, 1,
-1.110736, 2.266254, -0.7896733, 1, 0.9058824, 0, 1,
-1.109851, -0.5589948, -2.747218, 1, 0.9137255, 0, 1,
-1.10902, 0.2034939, -1.589144, 1, 0.9176471, 0, 1,
-1.082749, -0.4732258, -2.524834, 1, 0.9254902, 0, 1,
-1.077128, -0.4387812, -1.76271, 1, 0.9294118, 0, 1,
-1.073807, 1.067195, -1.554751, 1, 0.9372549, 0, 1,
-1.070751, 0.5201082, -1.571339, 1, 0.9411765, 0, 1,
-1.068441, -0.3617316, -2.883664, 1, 0.9490196, 0, 1,
-1.067547, -0.6204538, -1.697296, 1, 0.9529412, 0, 1,
-1.061089, -0.4485829, -2.519623, 1, 0.9607843, 0, 1,
-1.048375, -0.138564, 0.5775858, 1, 0.9647059, 0, 1,
-1.04691, 1.823059, -0.700781, 1, 0.972549, 0, 1,
-1.040909, -2.543284, -1.688929, 1, 0.9764706, 0, 1,
-1.040173, -0.8055642, -2.497747, 1, 0.9843137, 0, 1,
-1.022229, 0.1463319, -3.210106, 1, 0.9882353, 0, 1,
-1.015802, -1.026748, -1.195272, 1, 0.9960784, 0, 1,
-1.014662, 0.1392817, -0.9904335, 0.9960784, 1, 0, 1,
-1.009918, -0.3654871, -2.850738, 0.9921569, 1, 0, 1,
-1.008132, -0.2267888, 0.6030578, 0.9843137, 1, 0, 1,
-1.005334, -1.313905, -2.563527, 0.9803922, 1, 0, 1,
-1.004914, -1.74142, -2.359708, 0.972549, 1, 0, 1,
-0.9981686, -1.855853, -0.9610835, 0.9686275, 1, 0, 1,
-0.9978744, 1.641313, 1.196966, 0.9607843, 1, 0, 1,
-0.9974318, 0.1229172, -2.008012, 0.9568627, 1, 0, 1,
-0.9964053, -0.7211767, -3.077787, 0.9490196, 1, 0, 1,
-0.9846144, -0.6367135, -2.8792, 0.945098, 1, 0, 1,
-0.9817995, -0.9613359, -2.138127, 0.9372549, 1, 0, 1,
-0.9720066, 0.3435324, -2.785142, 0.9333333, 1, 0, 1,
-0.9484401, 0.6028045, -2.113037, 0.9254902, 1, 0, 1,
-0.9446875, 0.002160751, -2.3019, 0.9215686, 1, 0, 1,
-0.940456, 1.436457, -2.09325, 0.9137255, 1, 0, 1,
-0.9367049, -0.8016641, -2.751323, 0.9098039, 1, 0, 1,
-0.9344626, -0.08671718, -1.51609, 0.9019608, 1, 0, 1,
-0.9342269, -0.5991644, -0.2132474, 0.8941177, 1, 0, 1,
-0.9340763, 0.7620164, -0.6610793, 0.8901961, 1, 0, 1,
-0.9272703, -0.2008051, -1.688466, 0.8823529, 1, 0, 1,
-0.9248232, -1.112815, -2.11765, 0.8784314, 1, 0, 1,
-0.9128999, 1.851011, -1.673582, 0.8705882, 1, 0, 1,
-0.9062331, 0.4774912, 0.2359726, 0.8666667, 1, 0, 1,
-0.9057761, -2.103392, -3.937198, 0.8588235, 1, 0, 1,
-0.9051546, -0.07448145, -2.372779, 0.854902, 1, 0, 1,
-0.9048634, -1.252678, -3.647587, 0.8470588, 1, 0, 1,
-0.8986644, -2.144373, -3.377429, 0.8431373, 1, 0, 1,
-0.8939518, -2.563535, -5.051959, 0.8352941, 1, 0, 1,
-0.8934082, -0.7219413, -1.716034, 0.8313726, 1, 0, 1,
-0.888318, 1.554109, -0.6400366, 0.8235294, 1, 0, 1,
-0.882709, -0.1640521, -2.246638, 0.8196079, 1, 0, 1,
-0.8755444, 0.1684833, -1.495157, 0.8117647, 1, 0, 1,
-0.8689493, -0.5936288, -4.292761, 0.8078431, 1, 0, 1,
-0.8678282, -0.4800395, -2.028179, 0.8, 1, 0, 1,
-0.8632566, 0.06890499, -1.179621, 0.7921569, 1, 0, 1,
-0.8557424, -0.6423704, -2.126505, 0.7882353, 1, 0, 1,
-0.8503925, -0.007516101, -1.613904, 0.7803922, 1, 0, 1,
-0.8482168, -1.666818, -5.236401, 0.7764706, 1, 0, 1,
-0.8457741, 1.44038, -1.756575, 0.7686275, 1, 0, 1,
-0.8189156, 0.6253598, -0.2529189, 0.7647059, 1, 0, 1,
-0.8109024, 0.1914471, -1.633569, 0.7568628, 1, 0, 1,
-0.8069862, 0.2448749, -0.9206641, 0.7529412, 1, 0, 1,
-0.8023334, -1.528795, -2.954278, 0.7450981, 1, 0, 1,
-0.8020063, -1.034895, -0.7945214, 0.7411765, 1, 0, 1,
-0.8009194, -0.2586376, -1.71914, 0.7333333, 1, 0, 1,
-0.8003615, -0.6181455, -2.703528, 0.7294118, 1, 0, 1,
-0.7948765, 1.055796, -0.3319253, 0.7215686, 1, 0, 1,
-0.7931288, -1.666639, -3.309894, 0.7176471, 1, 0, 1,
-0.7904374, -0.8632267, -3.971574, 0.7098039, 1, 0, 1,
-0.790258, -1.122406, -1.577756, 0.7058824, 1, 0, 1,
-0.7890838, 1.169214, 0.2928932, 0.6980392, 1, 0, 1,
-0.7885042, 0.5314209, -1.542827, 0.6901961, 1, 0, 1,
-0.7875203, 0.2452693, 0.1977499, 0.6862745, 1, 0, 1,
-0.7843639, -0.137484, -0.9871678, 0.6784314, 1, 0, 1,
-0.7835535, -0.07707711, -1.670664, 0.6745098, 1, 0, 1,
-0.782317, -0.01122765, -3.796993, 0.6666667, 1, 0, 1,
-0.7768236, 0.3087756, -0.894679, 0.6627451, 1, 0, 1,
-0.7763757, -0.4920622, -1.938931, 0.654902, 1, 0, 1,
-0.7734261, 0.5674628, -1.965773, 0.6509804, 1, 0, 1,
-0.766484, -1.746776, -3.529236, 0.6431373, 1, 0, 1,
-0.7621247, 0.7999586, -1.058709, 0.6392157, 1, 0, 1,
-0.755296, 0.9246759, -0.680248, 0.6313726, 1, 0, 1,
-0.7541745, 0.01970397, -3.192829, 0.627451, 1, 0, 1,
-0.7524855, -0.4475828, -1.266663, 0.6196079, 1, 0, 1,
-0.7487001, -0.992631, -2.200788, 0.6156863, 1, 0, 1,
-0.7486784, 0.1616455, -1.880461, 0.6078432, 1, 0, 1,
-0.7485585, 1.458675, 1.036409, 0.6039216, 1, 0, 1,
-0.7414013, -1.214588, -0.2443448, 0.5960785, 1, 0, 1,
-0.7413843, 0.7265613, -2.556678, 0.5882353, 1, 0, 1,
-0.7323583, -0.9242477, -2.287751, 0.5843138, 1, 0, 1,
-0.7276334, -0.4781118, -1.770023, 0.5764706, 1, 0, 1,
-0.7211586, -1.106162, -3.652807, 0.572549, 1, 0, 1,
-0.7208855, -0.2196019, -1.985083, 0.5647059, 1, 0, 1,
-0.7171291, 1.880855, -0.2138666, 0.5607843, 1, 0, 1,
-0.7137802, -1.144085, -2.255548, 0.5529412, 1, 0, 1,
-0.7079692, -0.5273529, -0.4729753, 0.5490196, 1, 0, 1,
-0.7070311, 1.862168, -0.7680174, 0.5411765, 1, 0, 1,
-0.7061477, 0.2286484, -0.400898, 0.5372549, 1, 0, 1,
-0.7034227, -0.7456097, -3.577951, 0.5294118, 1, 0, 1,
-0.6993703, -0.7603552, -3.641375, 0.5254902, 1, 0, 1,
-0.6926271, -1.505495, -3.602244, 0.5176471, 1, 0, 1,
-0.6886828, 1.664164, 0.4608382, 0.5137255, 1, 0, 1,
-0.6844801, -0.2304936, -1.123225, 0.5058824, 1, 0, 1,
-0.6830313, 1.447326, -0.5142316, 0.5019608, 1, 0, 1,
-0.6778502, 0.2786013, -1.897478, 0.4941176, 1, 0, 1,
-0.6770331, 0.8093792, -0.8594748, 0.4862745, 1, 0, 1,
-0.677022, -1.546632, -1.627671, 0.4823529, 1, 0, 1,
-0.6696357, -0.42669, -3.594134, 0.4745098, 1, 0, 1,
-0.667222, -0.02532231, -1.434363, 0.4705882, 1, 0, 1,
-0.6636764, -0.3863598, -1.997509, 0.4627451, 1, 0, 1,
-0.662011, 0.2584106, -1.022638, 0.4588235, 1, 0, 1,
-0.6592802, 0.3876133, -0.8684655, 0.4509804, 1, 0, 1,
-0.6567039, 2.634988, -1.181055, 0.4470588, 1, 0, 1,
-0.6559627, 0.3480684, 0.1546088, 0.4392157, 1, 0, 1,
-0.6532782, -0.6419849, -3.560375, 0.4352941, 1, 0, 1,
-0.6388148, -0.257765, -0.6606204, 0.427451, 1, 0, 1,
-0.6385052, 0.2344815, -1.107746, 0.4235294, 1, 0, 1,
-0.636401, 0.6992984, -0.7061213, 0.4156863, 1, 0, 1,
-0.6277296, -1.838079, -2.595376, 0.4117647, 1, 0, 1,
-0.6253461, 0.8780634, -2.746819, 0.4039216, 1, 0, 1,
-0.6097488, -1.003085, -2.61292, 0.3960784, 1, 0, 1,
-0.6096244, -1.762522, -2.573835, 0.3921569, 1, 0, 1,
-0.606796, 0.6575236, -0.258793, 0.3843137, 1, 0, 1,
-0.6033329, -0.0759204, -2.863291, 0.3803922, 1, 0, 1,
-0.6030125, 1.52937, 1.688823, 0.372549, 1, 0, 1,
-0.5993005, -0.4910146, -1.646197, 0.3686275, 1, 0, 1,
-0.5976065, -0.777391, -1.952955, 0.3607843, 1, 0, 1,
-0.5969464, -1.434597, -3.212981, 0.3568628, 1, 0, 1,
-0.5964366, -1.240261, -3.487671, 0.3490196, 1, 0, 1,
-0.5961548, -0.1741815, -3.672103, 0.345098, 1, 0, 1,
-0.5959634, -0.4134445, -1.966426, 0.3372549, 1, 0, 1,
-0.5916838, 0.2263079, -0.7796891, 0.3333333, 1, 0, 1,
-0.5894257, -0.8679508, -3.491131, 0.3254902, 1, 0, 1,
-0.5884016, 0.1485904, -1.661511, 0.3215686, 1, 0, 1,
-0.5845795, 1.62782, -0.2386077, 0.3137255, 1, 0, 1,
-0.5824692, -0.4302578, -1.202109, 0.3098039, 1, 0, 1,
-0.5807894, -1.052228, -3.870263, 0.3019608, 1, 0, 1,
-0.5774006, -0.3147008, -0.7531493, 0.2941177, 1, 0, 1,
-0.5717668, -0.9993354, -2.879255, 0.2901961, 1, 0, 1,
-0.5661596, -0.3758814, -2.114584, 0.282353, 1, 0, 1,
-0.562515, 0.6359872, 0.5795022, 0.2784314, 1, 0, 1,
-0.5602767, -0.09984108, -1.45678, 0.2705882, 1, 0, 1,
-0.5528098, 0.2728025, 0.3212642, 0.2666667, 1, 0, 1,
-0.5490854, -0.09024772, -2.196701, 0.2588235, 1, 0, 1,
-0.534999, -0.4876636, -1.930679, 0.254902, 1, 0, 1,
-0.5347236, 0.7734979, -0.3801121, 0.2470588, 1, 0, 1,
-0.5303091, -0.5850734, -1.957467, 0.2431373, 1, 0, 1,
-0.5285416, 0.6864899, -0.9407256, 0.2352941, 1, 0, 1,
-0.5201825, 0.616492, -1.466217, 0.2313726, 1, 0, 1,
-0.5184189, -0.2392596, -0.8938283, 0.2235294, 1, 0, 1,
-0.5168034, 0.4633992, 1.46298, 0.2196078, 1, 0, 1,
-0.5167465, 1.456023, -0.1036838, 0.2117647, 1, 0, 1,
-0.5143961, -0.6097323, -3.245131, 0.2078431, 1, 0, 1,
-0.5141678, 1.759413, -0.9087492, 0.2, 1, 0, 1,
-0.5132669, -1.990022, -3.007728, 0.1921569, 1, 0, 1,
-0.5036428, -0.4707994, -1.647765, 0.1882353, 1, 0, 1,
-0.503334, 2.164809, 0.2327017, 0.1803922, 1, 0, 1,
-0.502681, -0.4722405, -1.371019, 0.1764706, 1, 0, 1,
-0.5020024, 2.161852, 0.2299166, 0.1686275, 1, 0, 1,
-0.4959924, -0.390074, -1.984282, 0.1647059, 1, 0, 1,
-0.4958622, -1.037227, -3.147355, 0.1568628, 1, 0, 1,
-0.4885115, -0.2952468, -0.9824783, 0.1529412, 1, 0, 1,
-0.4871966, -0.5333315, -3.494413, 0.145098, 1, 0, 1,
-0.4858931, -0.4293453, -2.377836, 0.1411765, 1, 0, 1,
-0.4789096, -1.256764, -2.874329, 0.1333333, 1, 0, 1,
-0.4773351, 0.7776106, -0.5803257, 0.1294118, 1, 0, 1,
-0.4682295, 1.202782, -0.9689588, 0.1215686, 1, 0, 1,
-0.4658199, 1.433851, -0.4775493, 0.1176471, 1, 0, 1,
-0.4611967, -1.029904, -2.478176, 0.1098039, 1, 0, 1,
-0.4611872, -1.218328, -3.386441, 0.1058824, 1, 0, 1,
-0.4557525, -0.07144415, -2.354725, 0.09803922, 1, 0, 1,
-0.4547232, 1.0836, -1.051281, 0.09019608, 1, 0, 1,
-0.4526481, 0.4619221, -0.2427702, 0.08627451, 1, 0, 1,
-0.4526392, 0.5572286, 0.6167954, 0.07843138, 1, 0, 1,
-0.44461, 0.852822, -1.096192, 0.07450981, 1, 0, 1,
-0.4441212, 0.02036185, -0.7794915, 0.06666667, 1, 0, 1,
-0.4430599, -0.1069969, -1.881561, 0.0627451, 1, 0, 1,
-0.4405516, -1.632361, -3.456211, 0.05490196, 1, 0, 1,
-0.4392802, 1.280349, 0.6581928, 0.05098039, 1, 0, 1,
-0.4365335, 1.073763, -0.7917989, 0.04313726, 1, 0, 1,
-0.4212148, 1.600971, -1.210892, 0.03921569, 1, 0, 1,
-0.4173224, -1.407379, -4.387757, 0.03137255, 1, 0, 1,
-0.416914, 0.2313714, -1.104799, 0.02745098, 1, 0, 1,
-0.4165671, 1.071107, -0.006615527, 0.01960784, 1, 0, 1,
-0.414468, 0.9801709, 0.4607195, 0.01568628, 1, 0, 1,
-0.4136485, -1.708716, -1.269285, 0.007843138, 1, 0, 1,
-0.413101, 0.6117067, 0.6053119, 0.003921569, 1, 0, 1,
-0.4121566, -0.1516241, -1.671732, 0, 1, 0.003921569, 1,
-0.4106494, 0.3899944, -0.8735993, 0, 1, 0.01176471, 1,
-0.4097129, -0.006855284, -0.5173373, 0, 1, 0.01568628, 1,
-0.4095492, -0.0257998, -3.160565, 0, 1, 0.02352941, 1,
-0.4080567, 0.3487276, -1.397386, 0, 1, 0.02745098, 1,
-0.4059317, 0.3759643, 0.6336114, 0, 1, 0.03529412, 1,
-0.4056367, -1.035146, -2.059842, 0, 1, 0.03921569, 1,
-0.4041675, 0.4928045, -0.2862889, 0, 1, 0.04705882, 1,
-0.3992892, -1.057447, -2.296454, 0, 1, 0.05098039, 1,
-0.3991223, 0.9653207, -0.3448521, 0, 1, 0.05882353, 1,
-0.3988603, 0.8603371, -1.526627, 0, 1, 0.0627451, 1,
-0.396883, -0.09750001, -0.6381496, 0, 1, 0.07058824, 1,
-0.3967973, 0.4829013, -2.011713, 0, 1, 0.07450981, 1,
-0.3928865, -0.4719396, -2.423931, 0, 1, 0.08235294, 1,
-0.392859, -1.111284, -1.768718, 0, 1, 0.08627451, 1,
-0.3910522, -0.5667509, -3.15856, 0, 1, 0.09411765, 1,
-0.3861148, 0.07061213, 0.8835614, 0, 1, 0.1019608, 1,
-0.3860525, -0.4234672, -2.998617, 0, 1, 0.1058824, 1,
-0.3833857, -1.171889, -2.965633, 0, 1, 0.1137255, 1,
-0.3820516, 0.1153789, 0.02852064, 0, 1, 0.1176471, 1,
-0.3805569, -0.6837581, -2.598224, 0, 1, 0.1254902, 1,
-0.376695, -2.293073, -2.596622, 0, 1, 0.1294118, 1,
-0.375223, -0.339656, -1.522662, 0, 1, 0.1372549, 1,
-0.3689891, 2.19538, -0.5410292, 0, 1, 0.1411765, 1,
-0.3651504, -2.110077, -4.711154, 0, 1, 0.1490196, 1,
-0.3632615, -0.3677818, -1.716056, 0, 1, 0.1529412, 1,
-0.3631212, 0.01245842, -0.9531765, 0, 1, 0.1607843, 1,
-0.3617161, -0.1400741, -2.499289, 0, 1, 0.1647059, 1,
-0.3594391, -0.2185062, -3.908014, 0, 1, 0.172549, 1,
-0.3550735, 0.5293179, -0.2499912, 0, 1, 0.1764706, 1,
-0.3525489, 0.8619304, -2.141271, 0, 1, 0.1843137, 1,
-0.3524238, -1.198561, -1.757157, 0, 1, 0.1882353, 1,
-0.3506893, -0.7617742, -2.830909, 0, 1, 0.1960784, 1,
-0.3493083, 0.3072214, -0.3210122, 0, 1, 0.2039216, 1,
-0.3463916, 0.6717746, -2.083149, 0, 1, 0.2078431, 1,
-0.3378924, 0.5724328, -0.2200012, 0, 1, 0.2156863, 1,
-0.3364696, -0.2916956, -2.397416, 0, 1, 0.2196078, 1,
-0.3359733, -0.6226222, -5.061889, 0, 1, 0.227451, 1,
-0.3318473, -0.8141974, -3.558986, 0, 1, 0.2313726, 1,
-0.3214726, 0.1460831, 0.9779875, 0, 1, 0.2392157, 1,
-0.3204758, -1.115875, -2.869726, 0, 1, 0.2431373, 1,
-0.3202111, 0.4281393, -0.8086826, 0, 1, 0.2509804, 1,
-0.314234, 0.2898236, -2.335907, 0, 1, 0.254902, 1,
-0.310686, 0.5551362, 0.175386, 0, 1, 0.2627451, 1,
-0.307158, -0.07887331, -3.402615, 0, 1, 0.2666667, 1,
-0.3051771, -1.126529, -3.706223, 0, 1, 0.2745098, 1,
-0.3035623, 0.489949, -0.7351783, 0, 1, 0.2784314, 1,
-0.295403, -0.3592035, -2.207022, 0, 1, 0.2862745, 1,
-0.2931623, -1.06682, -1.925264, 0, 1, 0.2901961, 1,
-0.2920738, 2.540474, 2.379725, 0, 1, 0.2980392, 1,
-0.2918329, -0.4350648, -2.076305, 0, 1, 0.3058824, 1,
-0.2852151, 0.6762724, -0.7152593, 0, 1, 0.3098039, 1,
-0.2847314, 0.8929306, -2.431137, 0, 1, 0.3176471, 1,
-0.283978, -0.6893314, -2.624614, 0, 1, 0.3215686, 1,
-0.2827945, -0.4817153, -3.720741, 0, 1, 0.3294118, 1,
-0.276296, -0.06510954, -2.660611, 0, 1, 0.3333333, 1,
-0.2725386, 0.4165782, 1.07888, 0, 1, 0.3411765, 1,
-0.2716627, -0.221484, -2.742137, 0, 1, 0.345098, 1,
-0.2710301, 0.4934871, 0.9165067, 0, 1, 0.3529412, 1,
-0.2687222, -1.93604, -3.867316, 0, 1, 0.3568628, 1,
-0.2672462, 1.697988, 0.3984949, 0, 1, 0.3647059, 1,
-0.2648706, -1.139643, -2.27995, 0, 1, 0.3686275, 1,
-0.2644998, 1.012037, -1.868561, 0, 1, 0.3764706, 1,
-0.2644354, -1.012932, -4.401447, 0, 1, 0.3803922, 1,
-0.2621491, 0.4453696, -0.755596, 0, 1, 0.3882353, 1,
-0.2619472, 0.7549692, 0.4898735, 0, 1, 0.3921569, 1,
-0.2598045, -1.121789, -2.469718, 0, 1, 0.4, 1,
-0.2592144, 0.8505187, -0.4579046, 0, 1, 0.4078431, 1,
-0.2551462, 0.2204313, -2.116654, 0, 1, 0.4117647, 1,
-0.2511641, -0.5294757, -1.666526, 0, 1, 0.4196078, 1,
-0.2410865, 0.131661, -0.7505015, 0, 1, 0.4235294, 1,
-0.2367324, -0.4791591, -2.797411, 0, 1, 0.4313726, 1,
-0.2360553, -0.9027283, -1.793478, 0, 1, 0.4352941, 1,
-0.2255147, 0.4807293, -1.208174, 0, 1, 0.4431373, 1,
-0.22419, 1.010098, -0.1162829, 0, 1, 0.4470588, 1,
-0.2231491, -2.046342, -4.6867, 0, 1, 0.454902, 1,
-0.2030274, 0.01878033, -0.8220472, 0, 1, 0.4588235, 1,
-0.2016491, -1.054715, -2.606392, 0, 1, 0.4666667, 1,
-0.2000898, 1.209665, -0.6057709, 0, 1, 0.4705882, 1,
-0.1996434, 0.6400753, 0.4174086, 0, 1, 0.4784314, 1,
-0.1939847, 1.956256, -0.4491127, 0, 1, 0.4823529, 1,
-0.1919271, -0.9538987, -3.071073, 0, 1, 0.4901961, 1,
-0.1916125, -1.196956, -2.815066, 0, 1, 0.4941176, 1,
-0.1906822, -0.2678071, -2.305903, 0, 1, 0.5019608, 1,
-0.1886019, 1.177585, -0.09344047, 0, 1, 0.509804, 1,
-0.1885494, 0.4886847, 0.5476065, 0, 1, 0.5137255, 1,
-0.183293, -0.9127668, -3.74834, 0, 1, 0.5215687, 1,
-0.1820789, 1.018925, -2.292304, 0, 1, 0.5254902, 1,
-0.1814815, -1.339522, -2.92556, 0, 1, 0.5333334, 1,
-0.1785575, 0.9776887, -1.024956, 0, 1, 0.5372549, 1,
-0.1771705, 0.9682564, -1.386031, 0, 1, 0.5450981, 1,
-0.1721046, 0.1588669, -0.8001274, 0, 1, 0.5490196, 1,
-0.1642503, 0.3701295, -1.823879, 0, 1, 0.5568628, 1,
-0.1592848, -0.121372, -1.002198, 0, 1, 0.5607843, 1,
-0.1521262, -1.399451, -3.896016, 0, 1, 0.5686275, 1,
-0.1460057, 0.7241319, -0.1102502, 0, 1, 0.572549, 1,
-0.1452741, 1.511044, -0.6054, 0, 1, 0.5803922, 1,
-0.1442076, -0.1780138, -2.335196, 0, 1, 0.5843138, 1,
-0.1430949, -0.7809759, -3.758157, 0, 1, 0.5921569, 1,
-0.1427564, 1.703094, -2.311645, 0, 1, 0.5960785, 1,
-0.1403842, -0.5952094, -4.175796, 0, 1, 0.6039216, 1,
-0.13727, 0.1660095, -2.345443, 0, 1, 0.6117647, 1,
-0.1345625, 0.9699719, 1.017139, 0, 1, 0.6156863, 1,
-0.1331933, 0.003008026, -0.8382038, 0, 1, 0.6235294, 1,
-0.1324566, 1.323272, -1.224947, 0, 1, 0.627451, 1,
-0.1279345, -0.2419668, -3.271058, 0, 1, 0.6352941, 1,
-0.1272908, 1.751432, 2.291517, 0, 1, 0.6392157, 1,
-0.1236881, 0.9268875, -0.05942169, 0, 1, 0.6470588, 1,
-0.1150941, 0.2011814, -0.6821519, 0, 1, 0.6509804, 1,
-0.1147676, -1.411988, -2.816763, 0, 1, 0.6588235, 1,
-0.1140772, -0.4666157, -3.526207, 0, 1, 0.6627451, 1,
-0.1116586, -0.4415041, -1.999942, 0, 1, 0.6705883, 1,
-0.1092131, -1.086769, -3.5903, 0, 1, 0.6745098, 1,
-0.1072997, -1.492719, -4.862053, 0, 1, 0.682353, 1,
-0.1068455, -1.933339, -1.752413, 0, 1, 0.6862745, 1,
-0.1064837, -0.4650823, -0.6071614, 0, 1, 0.6941177, 1,
-0.1034767, -1.647331, -1.414235, 0, 1, 0.7019608, 1,
-0.1023105, 0.0281104, -0.2437319, 0, 1, 0.7058824, 1,
-0.1002608, -0.5809465, -4.111754, 0, 1, 0.7137255, 1,
-0.09920277, -1.003149, -1.466329, 0, 1, 0.7176471, 1,
-0.0959708, -0.1571926, -2.599828, 0, 1, 0.7254902, 1,
-0.09154182, -0.1773037, -2.69706, 0, 1, 0.7294118, 1,
-0.08879945, 0.09310345, -1.234987, 0, 1, 0.7372549, 1,
-0.08801705, -1.81522, -3.277562, 0, 1, 0.7411765, 1,
-0.07965901, 0.5430628, -1.706489, 0, 1, 0.7490196, 1,
-0.07821058, 0.8697711, -0.7589787, 0, 1, 0.7529412, 1,
-0.07307003, -0.6295878, -2.733236, 0, 1, 0.7607843, 1,
-0.07250869, -0.706623, -3.254544, 0, 1, 0.7647059, 1,
-0.07164612, -0.5200505, -1.856779, 0, 1, 0.772549, 1,
-0.07066201, 0.1181477, -0.3985678, 0, 1, 0.7764706, 1,
-0.07058419, -1.575406, -2.985349, 0, 1, 0.7843137, 1,
-0.06863491, 1.342688, -1.25085, 0, 1, 0.7882353, 1,
-0.06498241, 0.5753437, 0.06709276, 0, 1, 0.7960784, 1,
-0.06135938, -1.195788, -2.353635, 0, 1, 0.8039216, 1,
-0.05510907, -2.421544, -2.606842, 0, 1, 0.8078431, 1,
-0.04825122, 0.7433157, -0.7024058, 0, 1, 0.8156863, 1,
-0.0411255, -0.6809014, -4.291332, 0, 1, 0.8196079, 1,
-0.03956736, -0.6810046, -1.406909, 0, 1, 0.827451, 1,
-0.035014, -1.086373, -2.944124, 0, 1, 0.8313726, 1,
-0.02978038, -0.4892013, -3.407742, 0, 1, 0.8392157, 1,
-0.02925351, 1.646765, 0.9125441, 0, 1, 0.8431373, 1,
-0.02876688, -0.1743949, -1.23971, 0, 1, 0.8509804, 1,
-0.02540115, -0.7298338, -2.946219, 0, 1, 0.854902, 1,
-0.02351831, 1.171497, 2.813308, 0, 1, 0.8627451, 1,
-0.01864464, -0.2309848, -3.699748, 0, 1, 0.8666667, 1,
-0.01735136, -0.02865457, -2.506955, 0, 1, 0.8745098, 1,
-0.01377701, -2.049018, -2.561429, 0, 1, 0.8784314, 1,
-0.007791781, -0.1096096, -3.106852, 0, 1, 0.8862745, 1,
-0.004034544, 0.5934756, 1.465984, 0, 1, 0.8901961, 1,
-0.003190183, -0.9633419, -1.162491, 0, 1, 0.8980392, 1,
-0.001093659, -0.7296081, -2.88434, 0, 1, 0.9058824, 1,
0.002283859, 0.8458357, 0.935722, 0, 1, 0.9098039, 1,
0.007627669, -0.02905018, 2.719331, 0, 1, 0.9176471, 1,
0.008809265, -0.4135204, 4.785064, 0, 1, 0.9215686, 1,
0.01461322, 0.9165741, 1.991544, 0, 1, 0.9294118, 1,
0.01929152, -0.9907754, 1.888495, 0, 1, 0.9333333, 1,
0.01938766, -1.435178, 5.478603, 0, 1, 0.9411765, 1,
0.02501084, -0.2983074, 4.167315, 0, 1, 0.945098, 1,
0.02618846, -1.18448, 2.895342, 0, 1, 0.9529412, 1,
0.02906753, -1.053671, 3.578199, 0, 1, 0.9568627, 1,
0.0294246, -0.280489, 2.736404, 0, 1, 0.9647059, 1,
0.03272864, 0.3252461, -0.01437654, 0, 1, 0.9686275, 1,
0.03578653, 0.363662, 0.6953579, 0, 1, 0.9764706, 1,
0.03759604, -0.4786674, 2.749499, 0, 1, 0.9803922, 1,
0.0467106, 1.431144, 1.976734, 0, 1, 0.9882353, 1,
0.05024873, 0.4442385, 1.606297, 0, 1, 0.9921569, 1,
0.051037, -0.03313921, 3.277393, 0, 1, 1, 1,
0.05350463, 1.093345, 0.5857808, 0, 0.9921569, 1, 1,
0.05810506, 1.271852, -0.08834406, 0, 0.9882353, 1, 1,
0.06016703, -0.4571339, 2.704465, 0, 0.9803922, 1, 1,
0.06052637, 0.402611, 0.08239059, 0, 0.9764706, 1, 1,
0.06231373, 0.04548757, 1.22556, 0, 0.9686275, 1, 1,
0.06384311, -0.1146881, 4.341703, 0, 0.9647059, 1, 1,
0.06456961, 0.2913659, 0.8698367, 0, 0.9568627, 1, 1,
0.06660016, 0.6187155, 1.278079, 0, 0.9529412, 1, 1,
0.07869928, 0.7410797, 1.868394, 0, 0.945098, 1, 1,
0.08249604, -0.02184305, 2.419761, 0, 0.9411765, 1, 1,
0.0866762, -0.9045328, 0.6765615, 0, 0.9333333, 1, 1,
0.09216619, -1.648297, 2.268422, 0, 0.9294118, 1, 1,
0.09434953, 0.1712148, -1.2973, 0, 0.9215686, 1, 1,
0.0969736, 0.6316162, 0.3641558, 0, 0.9176471, 1, 1,
0.09766299, 0.214316, -0.203884, 0, 0.9098039, 1, 1,
0.1027157, 1.509046, 1.246096, 0, 0.9058824, 1, 1,
0.10566, 1.450659, -1.196834, 0, 0.8980392, 1, 1,
0.1057698, 0.0820905, 1.363131, 0, 0.8901961, 1, 1,
0.111411, 1.049012, 0.4310662, 0, 0.8862745, 1, 1,
0.1118435, -0.6442644, 2.823217, 0, 0.8784314, 1, 1,
0.1142509, -0.9644434, 1.921405, 0, 0.8745098, 1, 1,
0.1144241, 1.097042, 0.2175647, 0, 0.8666667, 1, 1,
0.1189374, -0.6742744, 2.723444, 0, 0.8627451, 1, 1,
0.1191641, 0.6167128, 2.577281, 0, 0.854902, 1, 1,
0.1200481, -1.239589, 1.414359, 0, 0.8509804, 1, 1,
0.1201791, 0.5767426, -0.4657461, 0, 0.8431373, 1, 1,
0.1222796, -0.3239532, 2.386873, 0, 0.8392157, 1, 1,
0.1232418, 0.692738, 0.6633089, 0, 0.8313726, 1, 1,
0.1235501, 1.466463, 0.5555736, 0, 0.827451, 1, 1,
0.1279477, 0.07169101, 1.689614, 0, 0.8196079, 1, 1,
0.1286736, 0.2121074, 2.283356, 0, 0.8156863, 1, 1,
0.129433, 0.9218006, 0.2806252, 0, 0.8078431, 1, 1,
0.1315695, 0.3157264, 1.756495, 0, 0.8039216, 1, 1,
0.1324725, -0.3277196, 2.958616, 0, 0.7960784, 1, 1,
0.135367, 0.208317, 1.171709, 0, 0.7882353, 1, 1,
0.1394187, -0.310251, 1.318169, 0, 0.7843137, 1, 1,
0.1422624, 0.6353481, 1.576571, 0, 0.7764706, 1, 1,
0.1425312, -0.7978968, 1.519115, 0, 0.772549, 1, 1,
0.1430726, 0.2170125, -0.597141, 0, 0.7647059, 1, 1,
0.1478141, -0.7677104, 2.869143, 0, 0.7607843, 1, 1,
0.1480846, -0.8163089, 3.120797, 0, 0.7529412, 1, 1,
0.1489112, -0.2731059, 3.43451, 0, 0.7490196, 1, 1,
0.1495841, 0.1029538, 1.064987, 0, 0.7411765, 1, 1,
0.1535624, -1.169716, 2.465702, 0, 0.7372549, 1, 1,
0.15569, 1.027039, 0.6279193, 0, 0.7294118, 1, 1,
0.1569635, 0.3423935, 0.2107418, 0, 0.7254902, 1, 1,
0.1658309, -0.1299039, 0.5393649, 0, 0.7176471, 1, 1,
0.1724643, 0.3764583, 0.03136049, 0, 0.7137255, 1, 1,
0.1814272, 0.3946268, 0.7436092, 0, 0.7058824, 1, 1,
0.1853257, -0.4767242, 3.200573, 0, 0.6980392, 1, 1,
0.185709, 1.494041, 0.7853348, 0, 0.6941177, 1, 1,
0.1868062, 0.2968361, 2.836203, 0, 0.6862745, 1, 1,
0.1876195, -0.1907932, 0.5634114, 0, 0.682353, 1, 1,
0.1907351, -0.2776544, 1.700683, 0, 0.6745098, 1, 1,
0.1942953, 0.8110064, 0.5675802, 0, 0.6705883, 1, 1,
0.1965055, -0.3258039, 1.929983, 0, 0.6627451, 1, 1,
0.1965282, -0.3467071, 1.527645, 0, 0.6588235, 1, 1,
0.1971768, -0.5218779, 4.220373, 0, 0.6509804, 1, 1,
0.1977205, 0.3825564, -0.7727368, 0, 0.6470588, 1, 1,
0.2013364, -0.4489932, 0.6012875, 0, 0.6392157, 1, 1,
0.2038291, -1.118694, 2.118236, 0, 0.6352941, 1, 1,
0.206981, 0.4351205, 2.688837, 0, 0.627451, 1, 1,
0.2072271, -1.151889, 3.401653, 0, 0.6235294, 1, 1,
0.2084459, -0.3663158, 3.515865, 0, 0.6156863, 1, 1,
0.2097458, 0.5956073, 1.623433, 0, 0.6117647, 1, 1,
0.2130557, 0.5394154, -0.3514922, 0, 0.6039216, 1, 1,
0.2130699, -0.2028114, 0.6992754, 0, 0.5960785, 1, 1,
0.2148081, -0.5561222, 2.527642, 0, 0.5921569, 1, 1,
0.2154814, -0.2618509, 1.813721, 0, 0.5843138, 1, 1,
0.2170048, -1.047854, 1.790267, 0, 0.5803922, 1, 1,
0.2184658, -0.07147661, 0.725568, 0, 0.572549, 1, 1,
0.2195085, 0.4715261, 0.8350221, 0, 0.5686275, 1, 1,
0.219953, 0.5397064, 0.2356711, 0, 0.5607843, 1, 1,
0.2218899, -1.35411, 3.484062, 0, 0.5568628, 1, 1,
0.2230326, -1.211781, 3.708263, 0, 0.5490196, 1, 1,
0.2230973, 1.23906, 0.1911193, 0, 0.5450981, 1, 1,
0.2271078, -1.285662, 3.552012, 0, 0.5372549, 1, 1,
0.2284231, 0.1753427, 0.5133949, 0, 0.5333334, 1, 1,
0.2287005, -0.7300829, 3.435775, 0, 0.5254902, 1, 1,
0.2326332, 0.725181, 1.466106, 0, 0.5215687, 1, 1,
0.2332021, 1.970919, -0.01402237, 0, 0.5137255, 1, 1,
0.2357317, 0.4335117, -0.6590102, 0, 0.509804, 1, 1,
0.2406947, 1.322162, -1.168283, 0, 0.5019608, 1, 1,
0.2477344, 1.878829, 1.017187, 0, 0.4941176, 1, 1,
0.2481879, 0.6687854, 1.594972, 0, 0.4901961, 1, 1,
0.2495895, 1.231151, -0.2175955, 0, 0.4823529, 1, 1,
0.2518601, 1.343422, -0.2878527, 0, 0.4784314, 1, 1,
0.2524099, 0.4726145, 1.404933, 0, 0.4705882, 1, 1,
0.253936, 0.4769655, 1.188132, 0, 0.4666667, 1, 1,
0.2605706, -0.2845517, 2.357378, 0, 0.4588235, 1, 1,
0.2623725, 0.2167558, 1.639091, 0, 0.454902, 1, 1,
0.2660632, -0.4897836, 2.076419, 0, 0.4470588, 1, 1,
0.2680736, 1.187598, -0.8286097, 0, 0.4431373, 1, 1,
0.2690004, -0.7416467, 2.096298, 0, 0.4352941, 1, 1,
0.2697668, 0.3822667, 0.9955762, 0, 0.4313726, 1, 1,
0.2810233, -0.4763148, 2.906297, 0, 0.4235294, 1, 1,
0.2895222, -0.7711851, 2.703734, 0, 0.4196078, 1, 1,
0.2915204, -0.4517343, 2.560182, 0, 0.4117647, 1, 1,
0.2949976, 0.2030068, 1.629072, 0, 0.4078431, 1, 1,
0.2991922, -0.2036715, 1.952375, 0, 0.4, 1, 1,
0.2999623, -0.4461031, 4.179333, 0, 0.3921569, 1, 1,
0.3021773, 0.04376135, 1.429041, 0, 0.3882353, 1, 1,
0.3259802, -0.1144656, 3.017632, 0, 0.3803922, 1, 1,
0.325995, 0.1130698, 0.5830335, 0, 0.3764706, 1, 1,
0.3268594, 0.5961117, -0.09333926, 0, 0.3686275, 1, 1,
0.329659, 1.185779, 0.5529397, 0, 0.3647059, 1, 1,
0.3358368, -0.7716181, 2.810365, 0, 0.3568628, 1, 1,
0.3360958, 0.08152264, 3.042404, 0, 0.3529412, 1, 1,
0.3414892, -0.9026201, 2.693812, 0, 0.345098, 1, 1,
0.342181, -1.563406, 1.213183, 0, 0.3411765, 1, 1,
0.342779, 0.2667329, 0.5937614, 0, 0.3333333, 1, 1,
0.3443067, 0.4157513, 0.406298, 0, 0.3294118, 1, 1,
0.345739, -0.578998, 2.266098, 0, 0.3215686, 1, 1,
0.3493213, 1.790379, 0.6407626, 0, 0.3176471, 1, 1,
0.3516762, -0.7941294, 2.961413, 0, 0.3098039, 1, 1,
0.3525584, 1.906178, 0.5842075, 0, 0.3058824, 1, 1,
0.3534975, 0.306418, 1.373037, 0, 0.2980392, 1, 1,
0.3536224, 0.7724072, 0.3063039, 0, 0.2901961, 1, 1,
0.35379, 0.4015448, -1.027489, 0, 0.2862745, 1, 1,
0.3549155, 0.8053491, 0.1178027, 0, 0.2784314, 1, 1,
0.3620254, 0.618165, 0.2634511, 0, 0.2745098, 1, 1,
0.36203, 1.007475, 0.2383119, 0, 0.2666667, 1, 1,
0.3628853, 0.8488433, 1.009594, 0, 0.2627451, 1, 1,
0.3640414, 0.07252683, 1.160247, 0, 0.254902, 1, 1,
0.3641832, 1.644731, -0.8000361, 0, 0.2509804, 1, 1,
0.3704835, 0.865189, 0.7251134, 0, 0.2431373, 1, 1,
0.3729349, 1.858043, -1.175663, 0, 0.2392157, 1, 1,
0.3730037, -0.1386965, 3.930741, 0, 0.2313726, 1, 1,
0.3737365, -0.2861586, 1.872534, 0, 0.227451, 1, 1,
0.3810392, 0.3805809, 1.047365, 0, 0.2196078, 1, 1,
0.3867163, 0.1879982, 0.92606, 0, 0.2156863, 1, 1,
0.390588, -0.2449282, 0.8908011, 0, 0.2078431, 1, 1,
0.3922216, 0.6069484, 0.8534, 0, 0.2039216, 1, 1,
0.3922563, 0.6819427, 1.45964, 0, 0.1960784, 1, 1,
0.3959267, -0.03098184, 0.6208524, 0, 0.1882353, 1, 1,
0.4037105, 0.6422927, 1.448233, 0, 0.1843137, 1, 1,
0.4063184, 0.7091922, 0.5357441, 0, 0.1764706, 1, 1,
0.4102206, 1.568136, -1.079288, 0, 0.172549, 1, 1,
0.4135546, -0.859231, 3.043988, 0, 0.1647059, 1, 1,
0.4155726, 0.624723, -0.2277238, 0, 0.1607843, 1, 1,
0.4189915, 0.5182984, 0.7601659, 0, 0.1529412, 1, 1,
0.4216395, -0.003982122, 0.7553744, 0, 0.1490196, 1, 1,
0.4273227, -0.669805, 2.405547, 0, 0.1411765, 1, 1,
0.4304141, -0.1776259, 0.7937508, 0, 0.1372549, 1, 1,
0.434723, -0.4310007, 0.4453999, 0, 0.1294118, 1, 1,
0.4362853, 0.491796, 2.508814, 0, 0.1254902, 1, 1,
0.4409626, 0.9133889, -1.076694, 0, 0.1176471, 1, 1,
0.4415792, 0.9203588, 0.6400054, 0, 0.1137255, 1, 1,
0.442227, -1.359078, 0.671904, 0, 0.1058824, 1, 1,
0.4424893, 1.947604, 1.634264, 0, 0.09803922, 1, 1,
0.4452835, 0.2484868, 1.80376, 0, 0.09411765, 1, 1,
0.4514631, -0.7036304, 3.195282, 0, 0.08627451, 1, 1,
0.4517737, 0.2305887, 0.3335386, 0, 0.08235294, 1, 1,
0.4552897, 0.3863506, 2.5622, 0, 0.07450981, 1, 1,
0.4623131, 1.248024, 1.796424, 0, 0.07058824, 1, 1,
0.4628999, -0.2751175, 2.663057, 0, 0.0627451, 1, 1,
0.4688987, 1.39456, 1.018426, 0, 0.05882353, 1, 1,
0.473778, 1.415462, 2.531819, 0, 0.05098039, 1, 1,
0.4755369, -1.179199, 1.794371, 0, 0.04705882, 1, 1,
0.478294, -0.2189642, 2.119918, 0, 0.03921569, 1, 1,
0.480769, -1.19391, 1.30355, 0, 0.03529412, 1, 1,
0.4878613, 1.377724, -0.3337545, 0, 0.02745098, 1, 1,
0.4893471, 0.497641, 1.80235, 0, 0.02352941, 1, 1,
0.4909839, 0.844018, 1.06122, 0, 0.01568628, 1, 1,
0.4920658, -0.5897092, 5.133248, 0, 0.01176471, 1, 1,
0.4927949, 1.158941, -0.7302283, 0, 0.003921569, 1, 1,
0.4930159, -0.6386799, 3.410597, 0.003921569, 0, 1, 1,
0.4997087, 0.3959673, 0.4347453, 0.007843138, 0, 1, 1,
0.4997227, 0.9210445, 0.5732802, 0.01568628, 0, 1, 1,
0.5014753, -0.3318769, 2.438094, 0.01960784, 0, 1, 1,
0.5018148, -0.781995, 1.512206, 0.02745098, 0, 1, 1,
0.5020051, 0.6755829, 0.5756673, 0.03137255, 0, 1, 1,
0.504964, 0.9395937, 0.1754418, 0.03921569, 0, 1, 1,
0.5059044, -0.05285199, 1.241585, 0.04313726, 0, 1, 1,
0.5068002, -0.9003554, 1.804451, 0.05098039, 0, 1, 1,
0.5068272, -2.026424, 1.552067, 0.05490196, 0, 1, 1,
0.5104959, 0.7328795, 0.7237094, 0.0627451, 0, 1, 1,
0.5151101, -0.8798848, 3.569577, 0.06666667, 0, 1, 1,
0.5152892, -0.9049499, 2.279566, 0.07450981, 0, 1, 1,
0.5155376, 0.1267776, 2.601887, 0.07843138, 0, 1, 1,
0.516466, -1.182708, 2.396143, 0.08627451, 0, 1, 1,
0.5219682, -0.9993363, 0.8375998, 0.09019608, 0, 1, 1,
0.5266993, -0.550793, 3.364936, 0.09803922, 0, 1, 1,
0.5269185, -0.5188836, 2.455446, 0.1058824, 0, 1, 1,
0.5274595, 1.222272, 2.104551, 0.1098039, 0, 1, 1,
0.5313092, -0.7116386, 3.517623, 0.1176471, 0, 1, 1,
0.5328288, -0.3930633, 2.242547, 0.1215686, 0, 1, 1,
0.5366132, -0.4555283, 0.8933113, 0.1294118, 0, 1, 1,
0.5402926, -0.152851, 1.399706, 0.1333333, 0, 1, 1,
0.5407467, 0.127592, 0.8260699, 0.1411765, 0, 1, 1,
0.5416593, 0.1153374, 0.5528207, 0.145098, 0, 1, 1,
0.5419182, 0.1001115, 1.411603, 0.1529412, 0, 1, 1,
0.5492131, -0.615778, 3.136742, 0.1568628, 0, 1, 1,
0.5525451, 0.5498593, 1.20858, 0.1647059, 0, 1, 1,
0.5563871, 1.543605, -1.131522, 0.1686275, 0, 1, 1,
0.5614911, 0.6968002, 0.0223389, 0.1764706, 0, 1, 1,
0.5636539, -0.3100613, 1.505276, 0.1803922, 0, 1, 1,
0.5639384, 0.2199718, 2.007661, 0.1882353, 0, 1, 1,
0.5651076, -0.5025806, 3.147725, 0.1921569, 0, 1, 1,
0.5666379, 0.5256374, 2.381895, 0.2, 0, 1, 1,
0.5670927, 1.379166, -0.3806725, 0.2078431, 0, 1, 1,
0.5671893, -0.6645072, 0.606757, 0.2117647, 0, 1, 1,
0.567969, -0.4077722, 2.446522, 0.2196078, 0, 1, 1,
0.5687501, 0.6132882, 0.2197342, 0.2235294, 0, 1, 1,
0.5708442, 0.3495163, 0.218824, 0.2313726, 0, 1, 1,
0.5714371, 1.479326, 0.5187815, 0.2352941, 0, 1, 1,
0.5720313, -1.242943, 3.616672, 0.2431373, 0, 1, 1,
0.5724506, 1.308996, 0.7620242, 0.2470588, 0, 1, 1,
0.5751984, -0.5461688, 2.751848, 0.254902, 0, 1, 1,
0.576214, -0.4643083, 2.302212, 0.2588235, 0, 1, 1,
0.5773984, 2.258811, 0.7255974, 0.2666667, 0, 1, 1,
0.577753, 0.4836192, 2.292215, 0.2705882, 0, 1, 1,
0.5804162, -0.2441825, 3.262452, 0.2784314, 0, 1, 1,
0.5821099, 0.1642903, 0.5546949, 0.282353, 0, 1, 1,
0.5895074, 1.011422, -0.6659607, 0.2901961, 0, 1, 1,
0.5906527, -2.747724, 3.528227, 0.2941177, 0, 1, 1,
0.5919544, -1.226891, 2.842141, 0.3019608, 0, 1, 1,
0.5958432, 1.060313, -0.304669, 0.3098039, 0, 1, 1,
0.5977938, 1.404062, -1.160122, 0.3137255, 0, 1, 1,
0.6022307, -0.4932751, 3.281018, 0.3215686, 0, 1, 1,
0.6060346, -1.763294, 2.621206, 0.3254902, 0, 1, 1,
0.60685, 1.098004, -0.5073906, 0.3333333, 0, 1, 1,
0.6095142, 0.7380244, -0.6307508, 0.3372549, 0, 1, 1,
0.6102307, 0.1879905, -0.2993107, 0.345098, 0, 1, 1,
0.6221318, 0.9437534, 0.4605489, 0.3490196, 0, 1, 1,
0.6280543, 1.350893, 0.3877512, 0.3568628, 0, 1, 1,
0.6334608, -0.193839, 2.776054, 0.3607843, 0, 1, 1,
0.6470689, 0.7879431, 2.355197, 0.3686275, 0, 1, 1,
0.6505514, 0.4402898, 1.510861, 0.372549, 0, 1, 1,
0.6547917, -0.6826563, 0.1382619, 0.3803922, 0, 1, 1,
0.6554716, 0.1491347, 0.07780489, 0.3843137, 0, 1, 1,
0.657804, -0.03392426, 2.61004, 0.3921569, 0, 1, 1,
0.6638079, -0.7433295, 3.609689, 0.3960784, 0, 1, 1,
0.667618, -0.4622555, 1.750383, 0.4039216, 0, 1, 1,
0.6703178, -0.5133658, 0.04301509, 0.4117647, 0, 1, 1,
0.6741747, -0.2111141, 1.85371, 0.4156863, 0, 1, 1,
0.6793552, -0.266438, 3.599941, 0.4235294, 0, 1, 1,
0.6876903, 1.510559, -0.4204923, 0.427451, 0, 1, 1,
0.688915, 0.7507414, 2.601744, 0.4352941, 0, 1, 1,
0.6928841, 0.3431901, 0.1151385, 0.4392157, 0, 1, 1,
0.6950719, 0.03651969, 1.354878, 0.4470588, 0, 1, 1,
0.6994635, 0.365069, 3.041105, 0.4509804, 0, 1, 1,
0.705212, 0.7283653, 1.70554, 0.4588235, 0, 1, 1,
0.7073231, 0.4057749, 1.925465, 0.4627451, 0, 1, 1,
0.710705, -0.3738576, 2.72519, 0.4705882, 0, 1, 1,
0.7129425, 1.017685, -0.2284447, 0.4745098, 0, 1, 1,
0.7141327, -1.056257, 3.115903, 0.4823529, 0, 1, 1,
0.7169757, -1.11425, -0.7456164, 0.4862745, 0, 1, 1,
0.7177804, 1.044008, -1.378555, 0.4941176, 0, 1, 1,
0.7213266, 0.8020828, 1.689935, 0.5019608, 0, 1, 1,
0.725843, -0.722833, 1.86241, 0.5058824, 0, 1, 1,
0.7307655, -1.264912, 3.404209, 0.5137255, 0, 1, 1,
0.7320895, -0.6988582, 2.500951, 0.5176471, 0, 1, 1,
0.7353894, -0.9612884, 1.344125, 0.5254902, 0, 1, 1,
0.7381213, 0.5538296, 1.529358, 0.5294118, 0, 1, 1,
0.738124, -1.163605, 2.492677, 0.5372549, 0, 1, 1,
0.7385808, 1.769647, 0.4216866, 0.5411765, 0, 1, 1,
0.7392058, 0.6472307, 0.135033, 0.5490196, 0, 1, 1,
0.7397036, -0.8424012, 2.03435, 0.5529412, 0, 1, 1,
0.7438724, 0.7922904, 1.223323, 0.5607843, 0, 1, 1,
0.750425, -0.4788099, 2.832263, 0.5647059, 0, 1, 1,
0.7523249, 1.316587, 0.6119667, 0.572549, 0, 1, 1,
0.7535781, -0.1044026, 0.2418581, 0.5764706, 0, 1, 1,
0.7581244, -0.1038622, 1.156537, 0.5843138, 0, 1, 1,
0.7581499, -1.858513, 3.581448, 0.5882353, 0, 1, 1,
0.7658282, 0.5846918, 2.318727, 0.5960785, 0, 1, 1,
0.7667306, 0.1801245, 0.7073131, 0.6039216, 0, 1, 1,
0.7693985, -0.7633092, 3.27144, 0.6078432, 0, 1, 1,
0.7745596, -0.6834573, 2.775934, 0.6156863, 0, 1, 1,
0.7815443, 0.5321261, 1.323756, 0.6196079, 0, 1, 1,
0.783906, 0.8123183, 0.5595806, 0.627451, 0, 1, 1,
0.7901061, -0.803377, 1.130694, 0.6313726, 0, 1, 1,
0.792268, -0.2588312, 2.547632, 0.6392157, 0, 1, 1,
0.7927966, 1.173344, 1.828971, 0.6431373, 0, 1, 1,
0.7942894, -2.264416, 3.200427, 0.6509804, 0, 1, 1,
0.8097483, -1.019406, 2.553048, 0.654902, 0, 1, 1,
0.8100289, 0.8140901, -0.6582176, 0.6627451, 0, 1, 1,
0.8141353, -0.4486789, 1.480048, 0.6666667, 0, 1, 1,
0.8155816, -1.193327, 4.330811, 0.6745098, 0, 1, 1,
0.820779, -0.3216744, 2.451901, 0.6784314, 0, 1, 1,
0.8208795, -2.030696, 4.103456, 0.6862745, 0, 1, 1,
0.8224518, -0.1226957, 1.723993, 0.6901961, 0, 1, 1,
0.8231857, -0.3912904, 2.292349, 0.6980392, 0, 1, 1,
0.8341604, -1.261876, 4.4031, 0.7058824, 0, 1, 1,
0.8450077, -0.7997702, 2.879874, 0.7098039, 0, 1, 1,
0.8464639, 0.3800769, -1.273559, 0.7176471, 0, 1, 1,
0.8499904, -0.8603298, 3.99645, 0.7215686, 0, 1, 1,
0.8519394, 0.767926, 2.261987, 0.7294118, 0, 1, 1,
0.8622761, -0.9160915, 3.825532, 0.7333333, 0, 1, 1,
0.8674702, 0.7544542, 0.7514643, 0.7411765, 0, 1, 1,
0.869222, 0.9718889, 3.033588, 0.7450981, 0, 1, 1,
0.8753756, 1.401264, 1.601925, 0.7529412, 0, 1, 1,
0.8776003, 0.4790465, 0.9475322, 0.7568628, 0, 1, 1,
0.8791499, 0.5995826, -0.4559485, 0.7647059, 0, 1, 1,
0.8808485, 0.09961934, 1.986631, 0.7686275, 0, 1, 1,
0.8896163, 1.813976, -0.1575255, 0.7764706, 0, 1, 1,
0.9010971, -0.5053614, 0.9758658, 0.7803922, 0, 1, 1,
0.901129, 1.148973, 0.7543677, 0.7882353, 0, 1, 1,
0.902418, -0.4738941, 2.68878, 0.7921569, 0, 1, 1,
0.9025246, 0.6535899, 1.090791, 0.8, 0, 1, 1,
0.9026183, -1.475551, 2.839147, 0.8078431, 0, 1, 1,
0.9088758, -1.575501, 2.89355, 0.8117647, 0, 1, 1,
0.9116212, -0.7724134, 2.042286, 0.8196079, 0, 1, 1,
0.9119992, -0.3254904, 1.900708, 0.8235294, 0, 1, 1,
0.912266, -0.4788256, 2.97606, 0.8313726, 0, 1, 1,
0.9133278, -0.1170344, 1.228929, 0.8352941, 0, 1, 1,
0.9150497, -1.702803, 2.877794, 0.8431373, 0, 1, 1,
0.9151716, -0.3805154, 2.942589, 0.8470588, 0, 1, 1,
0.9164067, 0.281238, 0.7679933, 0.854902, 0, 1, 1,
0.9174636, 0.1859255, 0.7329103, 0.8588235, 0, 1, 1,
0.917661, 2.001025, 0.3884382, 0.8666667, 0, 1, 1,
0.9237002, 0.3970577, 2.369991, 0.8705882, 0, 1, 1,
0.9264832, -1.347677, 2.005603, 0.8784314, 0, 1, 1,
0.9276967, -0.7515273, 2.972913, 0.8823529, 0, 1, 1,
0.9278994, 0.3312455, 2.354167, 0.8901961, 0, 1, 1,
0.9305667, 0.0558174, -0.535668, 0.8941177, 0, 1, 1,
0.941315, 1.224358, -0.2103978, 0.9019608, 0, 1, 1,
0.9433628, 0.426956, -0.9440852, 0.9098039, 0, 1, 1,
0.943522, 0.03453099, -0.794763, 0.9137255, 0, 1, 1,
0.9436891, 0.1990036, 2.860842, 0.9215686, 0, 1, 1,
0.9446266, -0.6311625, 3.379689, 0.9254902, 0, 1, 1,
0.9449526, -1.095742, 2.159463, 0.9333333, 0, 1, 1,
0.9465136, 1.149248, 0.3234476, 0.9372549, 0, 1, 1,
0.9492298, -0.3244634, 1.258631, 0.945098, 0, 1, 1,
0.9539735, -0.7621735, 3.393309, 0.9490196, 0, 1, 1,
0.9583092, 0.4302124, 1.403561, 0.9568627, 0, 1, 1,
0.9616691, 0.5128617, 1.628511, 0.9607843, 0, 1, 1,
0.9708651, -1.715792, 3.227163, 0.9686275, 0, 1, 1,
0.9745511, -0.2963337, 2.734533, 0.972549, 0, 1, 1,
0.9764602, 0.2554607, 0.1749352, 0.9803922, 0, 1, 1,
0.9827085, 0.801695, 2.214114, 0.9843137, 0, 1, 1,
0.9865339, -0.277208, 1.730132, 0.9921569, 0, 1, 1,
0.9909833, -0.5128474, 1.184998, 0.9960784, 0, 1, 1,
1.004864, -0.004640342, -0.02279313, 1, 0, 0.9960784, 1,
1.00559, 0.05517337, 1.926459, 1, 0, 0.9882353, 1,
1.007109, 0.1321639, 1.98922, 1, 0, 0.9843137, 1,
1.009018, -0.4164682, 2.785685, 1, 0, 0.9764706, 1,
1.017378, 0.05164776, 0.06270822, 1, 0, 0.972549, 1,
1.018692, -0.1285598, 2.616357, 1, 0, 0.9647059, 1,
1.021801, -0.809471, 1.982415, 1, 0, 0.9607843, 1,
1.032655, -0.0285075, 2.806563, 1, 0, 0.9529412, 1,
1.042732, -0.2535712, 4.162747, 1, 0, 0.9490196, 1,
1.043575, -0.2000474, -1.027618, 1, 0, 0.9411765, 1,
1.046822, 0.8721309, 1.884792, 1, 0, 0.9372549, 1,
1.048817, 1.41414, 1.745138, 1, 0, 0.9294118, 1,
1.056316, 0.4709126, 0.9311265, 1, 0, 0.9254902, 1,
1.07534, -0.05494459, 2.64013, 1, 0, 0.9176471, 1,
1.076013, -1.001371, 3.433063, 1, 0, 0.9137255, 1,
1.079826, -1.675435, 2.710452, 1, 0, 0.9058824, 1,
1.080433, -1.615742, 2.108976, 1, 0, 0.9019608, 1,
1.094351, -0.771513, 3.367103, 1, 0, 0.8941177, 1,
1.094881, 0.08244365, 2.949773, 1, 0, 0.8862745, 1,
1.096394, -2.265326, 1.792433, 1, 0, 0.8823529, 1,
1.096551, -0.3452732, 1.461114, 1, 0, 0.8745098, 1,
1.103185, -0.6783147, 1.397075, 1, 0, 0.8705882, 1,
1.105684, 1.023309, 1.879678, 1, 0, 0.8627451, 1,
1.110039, -1.379542, 3.093867, 1, 0, 0.8588235, 1,
1.114268, 0.8817872, -0.1455092, 1, 0, 0.8509804, 1,
1.118358, 1.528425, 0.996764, 1, 0, 0.8470588, 1,
1.130616, -2.378345, 3.465535, 1, 0, 0.8392157, 1,
1.152936, 0.8510588, -1.306074, 1, 0, 0.8352941, 1,
1.161807, -1.438251, 4.054344, 1, 0, 0.827451, 1,
1.161928, -0.429379, 3.181483, 1, 0, 0.8235294, 1,
1.162354, -0.4630875, 2.820379, 1, 0, 0.8156863, 1,
1.164508, -1.377514, 2.885371, 1, 0, 0.8117647, 1,
1.170832, -0.04818736, 2.080296, 1, 0, 0.8039216, 1,
1.178208, 0.1305071, 1.718621, 1, 0, 0.7960784, 1,
1.183702, -0.9635437, 2.87854, 1, 0, 0.7921569, 1,
1.19098, -0.1591771, 0.7736104, 1, 0, 0.7843137, 1,
1.197869, 0.4515302, 1.578843, 1, 0, 0.7803922, 1,
1.201222, 2.766976, 0.8589894, 1, 0, 0.772549, 1,
1.202006, 1.388479, -0.004001541, 1, 0, 0.7686275, 1,
1.209957, -0.5315422, 1.970005, 1, 0, 0.7607843, 1,
1.21724, -0.3030098, 2.639764, 1, 0, 0.7568628, 1,
1.220529, -0.03185438, 1.572757, 1, 0, 0.7490196, 1,
1.221973, -0.3057132, 2.350381, 1, 0, 0.7450981, 1,
1.224288, 1.706033, 0.3179766, 1, 0, 0.7372549, 1,
1.230247, -0.6960142, 0.8462686, 1, 0, 0.7333333, 1,
1.232554, 1.245409, 2.560073, 1, 0, 0.7254902, 1,
1.238329, -0.7578846, 0.6788902, 1, 0, 0.7215686, 1,
1.239045, 0.6530007, -0.3323333, 1, 0, 0.7137255, 1,
1.240539, 0.0555739, 1.682898, 1, 0, 0.7098039, 1,
1.250502, -0.04622544, 1.085302, 1, 0, 0.7019608, 1,
1.251997, 1.619131, -0.1525348, 1, 0, 0.6941177, 1,
1.256029, -0.7526358, 2.144303, 1, 0, 0.6901961, 1,
1.257504, -0.6397045, 1.256595, 1, 0, 0.682353, 1,
1.258017, 1.112111, 1.847138, 1, 0, 0.6784314, 1,
1.265638, -0.09250094, -0.09599614, 1, 0, 0.6705883, 1,
1.266723, 0.3319382, 0.4637384, 1, 0, 0.6666667, 1,
1.268865, 0.1622616, 2.572347, 1, 0, 0.6588235, 1,
1.273011, -0.7412575, 2.191844, 1, 0, 0.654902, 1,
1.278599, -1.983709, 2.594719, 1, 0, 0.6470588, 1,
1.28119, 0.6152008, -0.6659417, 1, 0, 0.6431373, 1,
1.290285, -1.323314, 0.1019526, 1, 0, 0.6352941, 1,
1.300724, -1.230313, 1.349509, 1, 0, 0.6313726, 1,
1.306828, -0.4067944, 3.209788, 1, 0, 0.6235294, 1,
1.3134, -0.8476601, 2.109602, 1, 0, 0.6196079, 1,
1.321595, 0.8289903, 1.415333, 1, 0, 0.6117647, 1,
1.324056, 0.8024288, 2.50469, 1, 0, 0.6078432, 1,
1.32738, -1.378405, 2.392844, 1, 0, 0.6, 1,
1.336951, -0.1297399, 1.486343, 1, 0, 0.5921569, 1,
1.343178, 0.8749229, 0.007233011, 1, 0, 0.5882353, 1,
1.349733, 0.04111858, 0.7322587, 1, 0, 0.5803922, 1,
1.353075, 2.109624, 1.634139, 1, 0, 0.5764706, 1,
1.35582, -1.711948, 1.864381, 1, 0, 0.5686275, 1,
1.36649, 0.6253668, 0.7741875, 1, 0, 0.5647059, 1,
1.369886, -0.1936096, 1.753376, 1, 0, 0.5568628, 1,
1.372874, -0.622217, 2.085614, 1, 0, 0.5529412, 1,
1.38713, -0.601456, 4.84759, 1, 0, 0.5450981, 1,
1.394383, -0.7435177, 1.438661, 1, 0, 0.5411765, 1,
1.403671, -0.545119, 1.389937, 1, 0, 0.5333334, 1,
1.409147, -1.837038, 3.936651, 1, 0, 0.5294118, 1,
1.428455, -0.2050002, 3.717796, 1, 0, 0.5215687, 1,
1.436446, -1.108179, 2.049484, 1, 0, 0.5176471, 1,
1.441635, 0.5436774, 2.187064, 1, 0, 0.509804, 1,
1.4523, 0.741736, 2.306345, 1, 0, 0.5058824, 1,
1.455081, -0.1653292, 1.918464, 1, 0, 0.4980392, 1,
1.457661, -0.8929535, 4.719016, 1, 0, 0.4901961, 1,
1.469135, -0.6130606, 2.222133, 1, 0, 0.4862745, 1,
1.469783, -0.313034, 2.329396, 1, 0, 0.4784314, 1,
1.471097, 0.8898481, 2.573749, 1, 0, 0.4745098, 1,
1.504677, -0.4100187, 1.600644, 1, 0, 0.4666667, 1,
1.511649, 1.389813, 0.08650436, 1, 0, 0.4627451, 1,
1.515665, -0.7335558, 2.696341, 1, 0, 0.454902, 1,
1.518237, -0.7312099, 1.79125, 1, 0, 0.4509804, 1,
1.519407, 2.190413, -0.1313365, 1, 0, 0.4431373, 1,
1.521832, -1.304753, 2.823269, 1, 0, 0.4392157, 1,
1.523883, 0.288592, 1.484822, 1, 0, 0.4313726, 1,
1.535279, -0.6448081, 3.424405, 1, 0, 0.427451, 1,
1.543554, 0.3380775, 2.593314, 1, 0, 0.4196078, 1,
1.562657, 0.5935549, 3.012689, 1, 0, 0.4156863, 1,
1.570702, 0.5039302, 1.372009, 1, 0, 0.4078431, 1,
1.572981, 0.3510368, 2.02206, 1, 0, 0.4039216, 1,
1.577872, 3.372652, -0.4663452, 1, 0, 0.3960784, 1,
1.587332, 0.336568, 2.000114, 1, 0, 0.3882353, 1,
1.59391, 0.5674458, 1.76898, 1, 0, 0.3843137, 1,
1.594842, 0.3423863, 1.681476, 1, 0, 0.3764706, 1,
1.59607, 0.05092021, 1.546201, 1, 0, 0.372549, 1,
1.598718, -0.6956503, 2.939069, 1, 0, 0.3647059, 1,
1.612685, -0.5790635, 1.693325, 1, 0, 0.3607843, 1,
1.619135, 0.5412329, 2.053019, 1, 0, 0.3529412, 1,
1.630169, 1.047476, 0.3518125, 1, 0, 0.3490196, 1,
1.635796, -0.5109093, 1.898458, 1, 0, 0.3411765, 1,
1.6365, 0.1818551, 1.76343, 1, 0, 0.3372549, 1,
1.636625, 0.006001664, 2.194107, 1, 0, 0.3294118, 1,
1.637653, 1.084373, -0.5833908, 1, 0, 0.3254902, 1,
1.642685, 1.271028, -0.02926852, 1, 0, 0.3176471, 1,
1.643729, -0.204156, 2.717516, 1, 0, 0.3137255, 1,
1.683994, -1.456281, 1.38075, 1, 0, 0.3058824, 1,
1.694223, -1.826617, 1.288353, 1, 0, 0.2980392, 1,
1.699571, -0.2142577, 1.464817, 1, 0, 0.2941177, 1,
1.71681, -0.924486, 2.814244, 1, 0, 0.2862745, 1,
1.733889, 1.77198, 1.710625, 1, 0, 0.282353, 1,
1.737944, -0.4365943, 2.492748, 1, 0, 0.2745098, 1,
1.761414, 0.5736261, 1.208632, 1, 0, 0.2705882, 1,
1.76187, 1.978079, 0.204204, 1, 0, 0.2627451, 1,
1.781389, 0.5870039, 0.9655963, 1, 0, 0.2588235, 1,
1.794988, -1.236203, 1.737134, 1, 0, 0.2509804, 1,
1.795401, 0.1674343, -0.03840407, 1, 0, 0.2470588, 1,
1.81437, 0.2746688, 2.544936, 1, 0, 0.2392157, 1,
1.823243, -0.3701543, 1.422611, 1, 0, 0.2352941, 1,
1.835451, -0.8634847, 0.6071899, 1, 0, 0.227451, 1,
1.839549, -1.104274, -0.08387163, 1, 0, 0.2235294, 1,
1.842111, -0.6585017, 2.793661, 1, 0, 0.2156863, 1,
1.860534, -0.7870047, 0.8507136, 1, 0, 0.2117647, 1,
1.870111, -1.484241, 3.792534, 1, 0, 0.2039216, 1,
1.871472, -1.123092, 1.86958, 1, 0, 0.1960784, 1,
1.872831, -2.40851, 3.225091, 1, 0, 0.1921569, 1,
1.876842, 0.8178555, 1.404123, 1, 0, 0.1843137, 1,
1.886804, -0.877804, 1.560128, 1, 0, 0.1803922, 1,
1.89258, -0.9770844, 1.308176, 1, 0, 0.172549, 1,
1.913903, 0.4691286, 4.041573, 1, 0, 0.1686275, 1,
1.928462, -1.325789, 3.243634, 1, 0, 0.1607843, 1,
1.942699, 2.671093, 0.07624456, 1, 0, 0.1568628, 1,
1.946911, 0.4879174, 0.9947738, 1, 0, 0.1490196, 1,
1.95467, 0.4588466, 1.226369, 1, 0, 0.145098, 1,
1.969251, 0.4298997, 0.2891044, 1, 0, 0.1372549, 1,
1.971921, -0.4402663, 1.028897, 1, 0, 0.1333333, 1,
1.977792, -0.2725724, 0.3243019, 1, 0, 0.1254902, 1,
1.979254, 1.256873, 0.2664614, 1, 0, 0.1215686, 1,
2.002006, 0.002001153, 2.403955, 1, 0, 0.1137255, 1,
2.055863, 0.0346182, 1.239103, 1, 0, 0.1098039, 1,
2.066638, 0.009669087, 2.32009, 1, 0, 0.1019608, 1,
2.177727, -0.2642807, 1.820111, 1, 0, 0.09411765, 1,
2.215105, 0.0281997, 1.786855, 1, 0, 0.09019608, 1,
2.226568, 0.20314, 0.5559776, 1, 0, 0.08235294, 1,
2.244135, 1.370946, -1.038335, 1, 0, 0.07843138, 1,
2.348267, 0.2915726, 0.5713158, 1, 0, 0.07058824, 1,
2.349495, -1.335486, 2.549286, 1, 0, 0.06666667, 1,
2.406308, -0.07542024, 0.7014915, 1, 0, 0.05882353, 1,
2.48195, -0.0898626, 0.9582862, 1, 0, 0.05490196, 1,
2.513989, 1.901706, 0.8807225, 1, 0, 0.04705882, 1,
2.564712, -1.755068, 2.29526, 1, 0, 0.04313726, 1,
2.646051, 1.663139, 1.871908, 1, 0, 0.03529412, 1,
2.666842, -0.7628196, 1.156603, 1, 0, 0.03137255, 1,
2.757421, -0.5488106, 1.614065, 1, 0, 0.02352941, 1,
2.765522, -1.012821, 1.538012, 1, 0, 0.01960784, 1,
2.779313, 0.2568967, 2.586487, 1, 0, 0.01176471, 1,
3.269206, -0.4781678, 0.6550946, 1, 0, 0.007843138, 1
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
-0.2996347, -3.785128, -7.052594, 0, -0.5, 0.5, 0.5,
-0.2996347, -3.785128, -7.052594, 1, -0.5, 0.5, 0.5,
-0.2996347, -3.785128, -7.052594, 1, 1.5, 0.5, 0.5,
-0.2996347, -3.785128, -7.052594, 0, 1.5, 0.5, 0.5
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
-5.078312, 0.3124638, -7.052594, 0, -0.5, 0.5, 0.5,
-5.078312, 0.3124638, -7.052594, 1, -0.5, 0.5, 0.5,
-5.078312, 0.3124638, -7.052594, 1, 1.5, 0.5, 0.5,
-5.078312, 0.3124638, -7.052594, 0, 1.5, 0.5, 0.5
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
-5.078312, -3.785128, 0.1211009, 0, -0.5, 0.5, 0.5,
-5.078312, -3.785128, 0.1211009, 1, -0.5, 0.5, 0.5,
-5.078312, -3.785128, 0.1211009, 1, 1.5, 0.5, 0.5,
-5.078312, -3.785128, 0.1211009, 0, 1.5, 0.5, 0.5
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
-2, -2.83953, -5.397126,
2, -2.83953, -5.397126,
-2, -2.83953, -5.397126,
-2, -2.997129, -5.673038,
0, -2.83953, -5.397126,
0, -2.997129, -5.673038,
2, -2.83953, -5.397126,
2, -2.997129, -5.673038
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
-2, -3.312329, -6.22486, 0, -0.5, 0.5, 0.5,
-2, -3.312329, -6.22486, 1, -0.5, 0.5, 0.5,
-2, -3.312329, -6.22486, 1, 1.5, 0.5, 0.5,
-2, -3.312329, -6.22486, 0, 1.5, 0.5, 0.5,
0, -3.312329, -6.22486, 0, -0.5, 0.5, 0.5,
0, -3.312329, -6.22486, 1, -0.5, 0.5, 0.5,
0, -3.312329, -6.22486, 1, 1.5, 0.5, 0.5,
0, -3.312329, -6.22486, 0, 1.5, 0.5, 0.5,
2, -3.312329, -6.22486, 0, -0.5, 0.5, 0.5,
2, -3.312329, -6.22486, 1, -0.5, 0.5, 0.5,
2, -3.312329, -6.22486, 1, 1.5, 0.5, 0.5,
2, -3.312329, -6.22486, 0, 1.5, 0.5, 0.5
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
-3.97554, -2, -5.397126,
-3.97554, 3, -5.397126,
-3.97554, -2, -5.397126,
-4.159336, -2, -5.673038,
-3.97554, -1, -5.397126,
-4.159336, -1, -5.673038,
-3.97554, 0, -5.397126,
-4.159336, 0, -5.673038,
-3.97554, 1, -5.397126,
-4.159336, 1, -5.673038,
-3.97554, 2, -5.397126,
-4.159336, 2, -5.673038,
-3.97554, 3, -5.397126,
-4.159336, 3, -5.673038
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
-4.526926, -2, -6.22486, 0, -0.5, 0.5, 0.5,
-4.526926, -2, -6.22486, 1, -0.5, 0.5, 0.5,
-4.526926, -2, -6.22486, 1, 1.5, 0.5, 0.5,
-4.526926, -2, -6.22486, 0, 1.5, 0.5, 0.5,
-4.526926, -1, -6.22486, 0, -0.5, 0.5, 0.5,
-4.526926, -1, -6.22486, 1, -0.5, 0.5, 0.5,
-4.526926, -1, -6.22486, 1, 1.5, 0.5, 0.5,
-4.526926, -1, -6.22486, 0, 1.5, 0.5, 0.5,
-4.526926, 0, -6.22486, 0, -0.5, 0.5, 0.5,
-4.526926, 0, -6.22486, 1, -0.5, 0.5, 0.5,
-4.526926, 0, -6.22486, 1, 1.5, 0.5, 0.5,
-4.526926, 0, -6.22486, 0, 1.5, 0.5, 0.5,
-4.526926, 1, -6.22486, 0, -0.5, 0.5, 0.5,
-4.526926, 1, -6.22486, 1, -0.5, 0.5, 0.5,
-4.526926, 1, -6.22486, 1, 1.5, 0.5, 0.5,
-4.526926, 1, -6.22486, 0, 1.5, 0.5, 0.5,
-4.526926, 2, -6.22486, 0, -0.5, 0.5, 0.5,
-4.526926, 2, -6.22486, 1, -0.5, 0.5, 0.5,
-4.526926, 2, -6.22486, 1, 1.5, 0.5, 0.5,
-4.526926, 2, -6.22486, 0, 1.5, 0.5, 0.5,
-4.526926, 3, -6.22486, 0, -0.5, 0.5, 0.5,
-4.526926, 3, -6.22486, 1, -0.5, 0.5, 0.5,
-4.526926, 3, -6.22486, 1, 1.5, 0.5, 0.5,
-4.526926, 3, -6.22486, 0, 1.5, 0.5, 0.5
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
-3.97554, -2.83953, -4,
-3.97554, -2.83953, 4,
-3.97554, -2.83953, -4,
-4.159336, -2.997129, -4,
-3.97554, -2.83953, -2,
-4.159336, -2.997129, -2,
-3.97554, -2.83953, 0,
-4.159336, -2.997129, 0,
-3.97554, -2.83953, 2,
-4.159336, -2.997129, 2,
-3.97554, -2.83953, 4,
-4.159336, -2.997129, 4
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
-4.526926, -3.312329, -4, 0, -0.5, 0.5, 0.5,
-4.526926, -3.312329, -4, 1, -0.5, 0.5, 0.5,
-4.526926, -3.312329, -4, 1, 1.5, 0.5, 0.5,
-4.526926, -3.312329, -4, 0, 1.5, 0.5, 0.5,
-4.526926, -3.312329, -2, 0, -0.5, 0.5, 0.5,
-4.526926, -3.312329, -2, 1, -0.5, 0.5, 0.5,
-4.526926, -3.312329, -2, 1, 1.5, 0.5, 0.5,
-4.526926, -3.312329, -2, 0, 1.5, 0.5, 0.5,
-4.526926, -3.312329, 0, 0, -0.5, 0.5, 0.5,
-4.526926, -3.312329, 0, 1, -0.5, 0.5, 0.5,
-4.526926, -3.312329, 0, 1, 1.5, 0.5, 0.5,
-4.526926, -3.312329, 0, 0, 1.5, 0.5, 0.5,
-4.526926, -3.312329, 2, 0, -0.5, 0.5, 0.5,
-4.526926, -3.312329, 2, 1, -0.5, 0.5, 0.5,
-4.526926, -3.312329, 2, 1, 1.5, 0.5, 0.5,
-4.526926, -3.312329, 2, 0, 1.5, 0.5, 0.5,
-4.526926, -3.312329, 4, 0, -0.5, 0.5, 0.5,
-4.526926, -3.312329, 4, 1, -0.5, 0.5, 0.5,
-4.526926, -3.312329, 4, 1, 1.5, 0.5, 0.5,
-4.526926, -3.312329, 4, 0, 1.5, 0.5, 0.5
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
-3.97554, -2.83953, -5.397126,
-3.97554, 3.464457, -5.397126,
-3.97554, -2.83953, 5.639328,
-3.97554, 3.464457, 5.639328,
-3.97554, -2.83953, -5.397126,
-3.97554, -2.83953, 5.639328,
-3.97554, 3.464457, -5.397126,
-3.97554, 3.464457, 5.639328,
-3.97554, -2.83953, -5.397126,
3.376271, -2.83953, -5.397126,
-3.97554, -2.83953, 5.639328,
3.376271, -2.83953, 5.639328,
-3.97554, 3.464457, -5.397126,
3.376271, 3.464457, -5.397126,
-3.97554, 3.464457, 5.639328,
3.376271, 3.464457, 5.639328,
3.376271, -2.83953, -5.397126,
3.376271, 3.464457, -5.397126,
3.376271, -2.83953, 5.639328,
3.376271, 3.464457, 5.639328,
3.376271, -2.83953, -5.397126,
3.376271, -2.83953, 5.639328,
3.376271, 3.464457, -5.397126,
3.376271, 3.464457, 5.639328
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
var radius = 7.840477;
var distance = 34.88317;
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
mvMatrix.translate( 0.2996347, -0.3124638, -0.1211009 );
mvMatrix.scale( 1.153087, 1.344749, 0.7681161 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.88317);
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
hedonal<-read.table("hedonal.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-hedonal$V2
```

```
## Error in eval(expr, envir, enclos): object 'hedonal' not found
```

```r
y<-hedonal$V3
```

```
## Error in eval(expr, envir, enclos): object 'hedonal' not found
```

```r
z<-hedonal$V4
```

```
## Error in eval(expr, envir, enclos): object 'hedonal' not found
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
-3.868475, 1.2331, -0.9888939, 0, 0, 1, 1, 1,
-3.748419, 1.897966, -2.205472, 1, 0, 0, 1, 1,
-3.482296, -2.244503, -2.623898, 1, 0, 0, 1, 1,
-3.276003, 0.4401336, -2.121954, 1, 0, 0, 1, 1,
-2.926004, -0.5363181, -0.6449067, 1, 0, 0, 1, 1,
-2.875811, 1.163367, -0.7786142, 1, 0, 0, 1, 1,
-2.857413, 1.401822, -1.526162, 0, 0, 0, 1, 1,
-2.81343, -0.01624328, -1.612192, 0, 0, 0, 1, 1,
-2.795907, 0.900424, -1.109819, 0, 0, 0, 1, 1,
-2.749036, -0.6041931, -0.6048005, 0, 0, 0, 1, 1,
-2.556361, 0.008387649, -2.733305, 0, 0, 0, 1, 1,
-2.553387, -2.01765, -2.304895, 0, 0, 0, 1, 1,
-2.515055, 0.6491346, -2.148875, 0, 0, 0, 1, 1,
-2.396373, -0.9170648, -1.199579, 1, 1, 1, 1, 1,
-2.356675, -1.856881, -1.946769, 1, 1, 1, 1, 1,
-2.355407, 1.323418, -2.486202, 1, 1, 1, 1, 1,
-2.339727, 0.4108783, 0.4505473, 1, 1, 1, 1, 1,
-2.246493, -1.544756, -1.130525, 1, 1, 1, 1, 1,
-2.206899, -0.936255, -1.761086, 1, 1, 1, 1, 1,
-2.187154, 0.5235115, -1.339921, 1, 1, 1, 1, 1,
-2.178778, -0.588121, -1.505543, 1, 1, 1, 1, 1,
-2.151876, 1.329931, -0.1663066, 1, 1, 1, 1, 1,
-2.060263, 0.2457242, -2.42773, 1, 1, 1, 1, 1,
-2.057625, -1.48484, -2.028316, 1, 1, 1, 1, 1,
-2.045831, -0.214992, -1.503693, 1, 1, 1, 1, 1,
-2.026415, 0.6390109, -1.617124, 1, 1, 1, 1, 1,
-2.023293, 1.355047, -2.420358, 1, 1, 1, 1, 1,
-2.021152, -2.225364, -2.177665, 1, 1, 1, 1, 1,
-2.007994, -1.802592, -1.849265, 0, 0, 1, 1, 1,
-1.996904, -1.04813, -0.09019255, 1, 0, 0, 1, 1,
-1.995133, -1.430842, -2.029191, 1, 0, 0, 1, 1,
-1.993714, 1.552716, -0.4318495, 1, 0, 0, 1, 1,
-1.972246, -1.621969, -2.710837, 1, 0, 0, 1, 1,
-1.945076, 0.46189, -1.966847, 1, 0, 0, 1, 1,
-1.927821, -1.146111, -2.589093, 0, 0, 0, 1, 1,
-1.924914, -1.268426, -3.577296, 0, 0, 0, 1, 1,
-1.864318, -0.2204872, -1.910451, 0, 0, 0, 1, 1,
-1.85923, 0.9903199, -0.6102577, 0, 0, 0, 1, 1,
-1.836239, 0.06343621, -3.469256, 0, 0, 0, 1, 1,
-1.834548, -0.460744, -1.917338, 0, 0, 0, 1, 1,
-1.812206, -0.2913573, -3.03006, 0, 0, 0, 1, 1,
-1.811855, 0.2740012, -4.025719, 1, 1, 1, 1, 1,
-1.797174, 2.562531, -0.7355418, 1, 1, 1, 1, 1,
-1.77791, 1.986187, -1.153208, 1, 1, 1, 1, 1,
-1.775097, -0.3175765, -2.766568, 1, 1, 1, 1, 1,
-1.76242, -0.09839977, -1.470819, 1, 1, 1, 1, 1,
-1.747671, -0.3215238, -1.576476, 1, 1, 1, 1, 1,
-1.746133, -0.09609102, -2.337549, 1, 1, 1, 1, 1,
-1.744774, 1.649013, -1.832196, 1, 1, 1, 1, 1,
-1.744149, 0.03125444, -2.037231, 1, 1, 1, 1, 1,
-1.73229, 1.749341, -1.162334, 1, 1, 1, 1, 1,
-1.729802, 0.5823377, 0.2183642, 1, 1, 1, 1, 1,
-1.722648, -0.4659585, -2.487582, 1, 1, 1, 1, 1,
-1.715716, -0.1171903, -1.615064, 1, 1, 1, 1, 1,
-1.70939, -0.3476599, -1.288122, 1, 1, 1, 1, 1,
-1.704824, -0.9664311, -2.0653, 1, 1, 1, 1, 1,
-1.699493, 0.2440316, -1.755548, 0, 0, 1, 1, 1,
-1.688874, 0.05731452, -2.245286, 1, 0, 0, 1, 1,
-1.681677, -0.4287628, -0.6192989, 1, 0, 0, 1, 1,
-1.677155, -0.3106958, -2.154059, 1, 0, 0, 1, 1,
-1.676912, -0.6048244, -0.8722879, 1, 0, 0, 1, 1,
-1.668004, 0.8427604, -1.075597, 1, 0, 0, 1, 1,
-1.664743, -1.064299, -2.217768, 0, 0, 0, 1, 1,
-1.634055, -1.869956, -1.653942, 0, 0, 0, 1, 1,
-1.632418, 1.162259, 0.2808267, 0, 0, 0, 1, 1,
-1.625572, -0.1050926, -2.250931, 0, 0, 0, 1, 1,
-1.597176, 0.4055595, 0.3343497, 0, 0, 0, 1, 1,
-1.587517, -0.2825294, -2.690043, 0, 0, 0, 1, 1,
-1.582899, 1.259998, -4.152005, 0, 0, 0, 1, 1,
-1.579747, 1.72888, -1.209132, 1, 1, 1, 1, 1,
-1.546755, 1.378972, -0.2330962, 1, 1, 1, 1, 1,
-1.546573, 0.1213074, -1.72775, 1, 1, 1, 1, 1,
-1.54559, -0.9883264, -3.962755, 1, 1, 1, 1, 1,
-1.545282, -0.0583865, -0.7419005, 1, 1, 1, 1, 1,
-1.541873, -0.08107647, -1.279409, 1, 1, 1, 1, 1,
-1.541115, -1.880757, -0.4763832, 1, 1, 1, 1, 1,
-1.524421, -0.4679643, -1.934827, 1, 1, 1, 1, 1,
-1.523271, -0.4280005, -0.7484657, 1, 1, 1, 1, 1,
-1.520567, 1.739588, -0.7595168, 1, 1, 1, 1, 1,
-1.505022, 1.131049, -1.304171, 1, 1, 1, 1, 1,
-1.503869, 0.6397455, -1.468758, 1, 1, 1, 1, 1,
-1.502551, 0.7950708, -1.271754, 1, 1, 1, 1, 1,
-1.477625, 1.583335, -0.7523612, 1, 1, 1, 1, 1,
-1.472181, -0.4879479, -2.827735, 1, 1, 1, 1, 1,
-1.468342, -1.051966, -2.308982, 0, 0, 1, 1, 1,
-1.466139, -1.418612, -3.10406, 1, 0, 0, 1, 1,
-1.464412, -2.15888, -2.83045, 1, 0, 0, 1, 1,
-1.461444, 1.087413, -1.512216, 1, 0, 0, 1, 1,
-1.453675, 0.826773, 0.8773587, 1, 0, 0, 1, 1,
-1.452405, -0.2521201, -2.081138, 1, 0, 0, 1, 1,
-1.451422, 1.302456, -1.631015, 0, 0, 0, 1, 1,
-1.4416, 0.9563146, -0.4830364, 0, 0, 0, 1, 1,
-1.429645, 0.1055571, -1.139348, 0, 0, 0, 1, 1,
-1.424513, -1.769755, -3.149995, 0, 0, 0, 1, 1,
-1.417898, 0.234732, -0.9697389, 0, 0, 0, 1, 1,
-1.412955, 0.2918726, -1.427656, 0, 0, 0, 1, 1,
-1.409242, 0.2023645, -0.9706901, 0, 0, 0, 1, 1,
-1.407646, -0.502072, -0.6785623, 1, 1, 1, 1, 1,
-1.398829, 1.304063, 0.07066511, 1, 1, 1, 1, 1,
-1.396601, -0.9686994, -1.076256, 1, 1, 1, 1, 1,
-1.388096, -0.9972188, -1.178441, 1, 1, 1, 1, 1,
-1.387245, -0.04123286, -1.028728, 1, 1, 1, 1, 1,
-1.384213, -1.179519, -3.872251, 1, 1, 1, 1, 1,
-1.381153, 1.07761, -1.562474, 1, 1, 1, 1, 1,
-1.36382, -0.5770692, -1.511615, 1, 1, 1, 1, 1,
-1.363311, 1.737, -1.842866, 1, 1, 1, 1, 1,
-1.354475, -1.85804, -2.64133, 1, 1, 1, 1, 1,
-1.353012, 1.01089, -0.9203836, 1, 1, 1, 1, 1,
-1.349976, -1.42969, -2.337053, 1, 1, 1, 1, 1,
-1.339278, -1.124326, -3.002648, 1, 1, 1, 1, 1,
-1.329129, -0.3303869, -2.263886, 1, 1, 1, 1, 1,
-1.317876, 0.8490608, 0.2947153, 1, 1, 1, 1, 1,
-1.312272, -1.431107, -2.39347, 0, 0, 1, 1, 1,
-1.307987, -0.3725044, -0.5647645, 1, 0, 0, 1, 1,
-1.294807, 0.2415212, -0.8132432, 1, 0, 0, 1, 1,
-1.294248, 1.683561, -1.824584, 1, 0, 0, 1, 1,
-1.273065, 0.3148738, -2.365972, 1, 0, 0, 1, 1,
-1.270828, 2.499398, 0.4090448, 1, 0, 0, 1, 1,
-1.270811, -0.9696463, -1.446167, 0, 0, 0, 1, 1,
-1.270184, 0.8453153, -0.7042875, 0, 0, 0, 1, 1,
-1.253899, 0.6931857, -1.107841, 0, 0, 0, 1, 1,
-1.250828, -1.250284, -1.050884, 0, 0, 0, 1, 1,
-1.24645, 0.1245191, -3.326997, 0, 0, 0, 1, 1,
-1.245038, -1.312544, -2.594817, 0, 0, 0, 1, 1,
-1.244276, -1.302038, -2.901622, 0, 0, 0, 1, 1,
-1.238772, 0.3300295, -0.4327309, 1, 1, 1, 1, 1,
-1.231115, 1.180459, -1.040116, 1, 1, 1, 1, 1,
-1.218969, -0.9639782, -1.37065, 1, 1, 1, 1, 1,
-1.210716, -0.7725471, -1.876518, 1, 1, 1, 1, 1,
-1.205973, 0.5631996, -0.2448998, 1, 1, 1, 1, 1,
-1.200873, 0.6592023, 0.9038967, 1, 1, 1, 1, 1,
-1.195656, 0.561702, -1.030422, 1, 1, 1, 1, 1,
-1.190901, 0.4774566, -1.551505, 1, 1, 1, 1, 1,
-1.179404, 0.9133503, 0.00991195, 1, 1, 1, 1, 1,
-1.177368, 0.6667648, 0.1299397, 1, 1, 1, 1, 1,
-1.176613, -1.041252, -2.430331, 1, 1, 1, 1, 1,
-1.174079, -1.033169, -3.62624, 1, 1, 1, 1, 1,
-1.170893, 0.9240338, -0.7987268, 1, 1, 1, 1, 1,
-1.170846, -0.5084926, -3.313234, 1, 1, 1, 1, 1,
-1.168206, -1.277331, -1.899987, 1, 1, 1, 1, 1,
-1.161615, -1.846526, -2.712846, 0, 0, 1, 1, 1,
-1.151853, -0.1020835, -0.2072556, 1, 0, 0, 1, 1,
-1.139771, 0.2108641, -1.957602, 1, 0, 0, 1, 1,
-1.135848, -0.961396, -3.81898, 1, 0, 0, 1, 1,
-1.130967, 1.610296, -0.5768635, 1, 0, 0, 1, 1,
-1.130439, -1.32297, -2.906684, 1, 0, 0, 1, 1,
-1.129884, -0.4519954, -1.840672, 0, 0, 0, 1, 1,
-1.119524, 0.9841543, -2.895952, 0, 0, 0, 1, 1,
-1.118942, 0.6549049, 0.13886, 0, 0, 0, 1, 1,
-1.11868, -0.4343409, -1.415298, 0, 0, 0, 1, 1,
-1.111673, -0.9113837, -1.144279, 0, 0, 0, 1, 1,
-1.110736, 2.266254, -0.7896733, 0, 0, 0, 1, 1,
-1.109851, -0.5589948, -2.747218, 0, 0, 0, 1, 1,
-1.10902, 0.2034939, -1.589144, 1, 1, 1, 1, 1,
-1.082749, -0.4732258, -2.524834, 1, 1, 1, 1, 1,
-1.077128, -0.4387812, -1.76271, 1, 1, 1, 1, 1,
-1.073807, 1.067195, -1.554751, 1, 1, 1, 1, 1,
-1.070751, 0.5201082, -1.571339, 1, 1, 1, 1, 1,
-1.068441, -0.3617316, -2.883664, 1, 1, 1, 1, 1,
-1.067547, -0.6204538, -1.697296, 1, 1, 1, 1, 1,
-1.061089, -0.4485829, -2.519623, 1, 1, 1, 1, 1,
-1.048375, -0.138564, 0.5775858, 1, 1, 1, 1, 1,
-1.04691, 1.823059, -0.700781, 1, 1, 1, 1, 1,
-1.040909, -2.543284, -1.688929, 1, 1, 1, 1, 1,
-1.040173, -0.8055642, -2.497747, 1, 1, 1, 1, 1,
-1.022229, 0.1463319, -3.210106, 1, 1, 1, 1, 1,
-1.015802, -1.026748, -1.195272, 1, 1, 1, 1, 1,
-1.014662, 0.1392817, -0.9904335, 1, 1, 1, 1, 1,
-1.009918, -0.3654871, -2.850738, 0, 0, 1, 1, 1,
-1.008132, -0.2267888, 0.6030578, 1, 0, 0, 1, 1,
-1.005334, -1.313905, -2.563527, 1, 0, 0, 1, 1,
-1.004914, -1.74142, -2.359708, 1, 0, 0, 1, 1,
-0.9981686, -1.855853, -0.9610835, 1, 0, 0, 1, 1,
-0.9978744, 1.641313, 1.196966, 1, 0, 0, 1, 1,
-0.9974318, 0.1229172, -2.008012, 0, 0, 0, 1, 1,
-0.9964053, -0.7211767, -3.077787, 0, 0, 0, 1, 1,
-0.9846144, -0.6367135, -2.8792, 0, 0, 0, 1, 1,
-0.9817995, -0.9613359, -2.138127, 0, 0, 0, 1, 1,
-0.9720066, 0.3435324, -2.785142, 0, 0, 0, 1, 1,
-0.9484401, 0.6028045, -2.113037, 0, 0, 0, 1, 1,
-0.9446875, 0.002160751, -2.3019, 0, 0, 0, 1, 1,
-0.940456, 1.436457, -2.09325, 1, 1, 1, 1, 1,
-0.9367049, -0.8016641, -2.751323, 1, 1, 1, 1, 1,
-0.9344626, -0.08671718, -1.51609, 1, 1, 1, 1, 1,
-0.9342269, -0.5991644, -0.2132474, 1, 1, 1, 1, 1,
-0.9340763, 0.7620164, -0.6610793, 1, 1, 1, 1, 1,
-0.9272703, -0.2008051, -1.688466, 1, 1, 1, 1, 1,
-0.9248232, -1.112815, -2.11765, 1, 1, 1, 1, 1,
-0.9128999, 1.851011, -1.673582, 1, 1, 1, 1, 1,
-0.9062331, 0.4774912, 0.2359726, 1, 1, 1, 1, 1,
-0.9057761, -2.103392, -3.937198, 1, 1, 1, 1, 1,
-0.9051546, -0.07448145, -2.372779, 1, 1, 1, 1, 1,
-0.9048634, -1.252678, -3.647587, 1, 1, 1, 1, 1,
-0.8986644, -2.144373, -3.377429, 1, 1, 1, 1, 1,
-0.8939518, -2.563535, -5.051959, 1, 1, 1, 1, 1,
-0.8934082, -0.7219413, -1.716034, 1, 1, 1, 1, 1,
-0.888318, 1.554109, -0.6400366, 0, 0, 1, 1, 1,
-0.882709, -0.1640521, -2.246638, 1, 0, 0, 1, 1,
-0.8755444, 0.1684833, -1.495157, 1, 0, 0, 1, 1,
-0.8689493, -0.5936288, -4.292761, 1, 0, 0, 1, 1,
-0.8678282, -0.4800395, -2.028179, 1, 0, 0, 1, 1,
-0.8632566, 0.06890499, -1.179621, 1, 0, 0, 1, 1,
-0.8557424, -0.6423704, -2.126505, 0, 0, 0, 1, 1,
-0.8503925, -0.007516101, -1.613904, 0, 0, 0, 1, 1,
-0.8482168, -1.666818, -5.236401, 0, 0, 0, 1, 1,
-0.8457741, 1.44038, -1.756575, 0, 0, 0, 1, 1,
-0.8189156, 0.6253598, -0.2529189, 0, 0, 0, 1, 1,
-0.8109024, 0.1914471, -1.633569, 0, 0, 0, 1, 1,
-0.8069862, 0.2448749, -0.9206641, 0, 0, 0, 1, 1,
-0.8023334, -1.528795, -2.954278, 1, 1, 1, 1, 1,
-0.8020063, -1.034895, -0.7945214, 1, 1, 1, 1, 1,
-0.8009194, -0.2586376, -1.71914, 1, 1, 1, 1, 1,
-0.8003615, -0.6181455, -2.703528, 1, 1, 1, 1, 1,
-0.7948765, 1.055796, -0.3319253, 1, 1, 1, 1, 1,
-0.7931288, -1.666639, -3.309894, 1, 1, 1, 1, 1,
-0.7904374, -0.8632267, -3.971574, 1, 1, 1, 1, 1,
-0.790258, -1.122406, -1.577756, 1, 1, 1, 1, 1,
-0.7890838, 1.169214, 0.2928932, 1, 1, 1, 1, 1,
-0.7885042, 0.5314209, -1.542827, 1, 1, 1, 1, 1,
-0.7875203, 0.2452693, 0.1977499, 1, 1, 1, 1, 1,
-0.7843639, -0.137484, -0.9871678, 1, 1, 1, 1, 1,
-0.7835535, -0.07707711, -1.670664, 1, 1, 1, 1, 1,
-0.782317, -0.01122765, -3.796993, 1, 1, 1, 1, 1,
-0.7768236, 0.3087756, -0.894679, 1, 1, 1, 1, 1,
-0.7763757, -0.4920622, -1.938931, 0, 0, 1, 1, 1,
-0.7734261, 0.5674628, -1.965773, 1, 0, 0, 1, 1,
-0.766484, -1.746776, -3.529236, 1, 0, 0, 1, 1,
-0.7621247, 0.7999586, -1.058709, 1, 0, 0, 1, 1,
-0.755296, 0.9246759, -0.680248, 1, 0, 0, 1, 1,
-0.7541745, 0.01970397, -3.192829, 1, 0, 0, 1, 1,
-0.7524855, -0.4475828, -1.266663, 0, 0, 0, 1, 1,
-0.7487001, -0.992631, -2.200788, 0, 0, 0, 1, 1,
-0.7486784, 0.1616455, -1.880461, 0, 0, 0, 1, 1,
-0.7485585, 1.458675, 1.036409, 0, 0, 0, 1, 1,
-0.7414013, -1.214588, -0.2443448, 0, 0, 0, 1, 1,
-0.7413843, 0.7265613, -2.556678, 0, 0, 0, 1, 1,
-0.7323583, -0.9242477, -2.287751, 0, 0, 0, 1, 1,
-0.7276334, -0.4781118, -1.770023, 1, 1, 1, 1, 1,
-0.7211586, -1.106162, -3.652807, 1, 1, 1, 1, 1,
-0.7208855, -0.2196019, -1.985083, 1, 1, 1, 1, 1,
-0.7171291, 1.880855, -0.2138666, 1, 1, 1, 1, 1,
-0.7137802, -1.144085, -2.255548, 1, 1, 1, 1, 1,
-0.7079692, -0.5273529, -0.4729753, 1, 1, 1, 1, 1,
-0.7070311, 1.862168, -0.7680174, 1, 1, 1, 1, 1,
-0.7061477, 0.2286484, -0.400898, 1, 1, 1, 1, 1,
-0.7034227, -0.7456097, -3.577951, 1, 1, 1, 1, 1,
-0.6993703, -0.7603552, -3.641375, 1, 1, 1, 1, 1,
-0.6926271, -1.505495, -3.602244, 1, 1, 1, 1, 1,
-0.6886828, 1.664164, 0.4608382, 1, 1, 1, 1, 1,
-0.6844801, -0.2304936, -1.123225, 1, 1, 1, 1, 1,
-0.6830313, 1.447326, -0.5142316, 1, 1, 1, 1, 1,
-0.6778502, 0.2786013, -1.897478, 1, 1, 1, 1, 1,
-0.6770331, 0.8093792, -0.8594748, 0, 0, 1, 1, 1,
-0.677022, -1.546632, -1.627671, 1, 0, 0, 1, 1,
-0.6696357, -0.42669, -3.594134, 1, 0, 0, 1, 1,
-0.667222, -0.02532231, -1.434363, 1, 0, 0, 1, 1,
-0.6636764, -0.3863598, -1.997509, 1, 0, 0, 1, 1,
-0.662011, 0.2584106, -1.022638, 1, 0, 0, 1, 1,
-0.6592802, 0.3876133, -0.8684655, 0, 0, 0, 1, 1,
-0.6567039, 2.634988, -1.181055, 0, 0, 0, 1, 1,
-0.6559627, 0.3480684, 0.1546088, 0, 0, 0, 1, 1,
-0.6532782, -0.6419849, -3.560375, 0, 0, 0, 1, 1,
-0.6388148, -0.257765, -0.6606204, 0, 0, 0, 1, 1,
-0.6385052, 0.2344815, -1.107746, 0, 0, 0, 1, 1,
-0.636401, 0.6992984, -0.7061213, 0, 0, 0, 1, 1,
-0.6277296, -1.838079, -2.595376, 1, 1, 1, 1, 1,
-0.6253461, 0.8780634, -2.746819, 1, 1, 1, 1, 1,
-0.6097488, -1.003085, -2.61292, 1, 1, 1, 1, 1,
-0.6096244, -1.762522, -2.573835, 1, 1, 1, 1, 1,
-0.606796, 0.6575236, -0.258793, 1, 1, 1, 1, 1,
-0.6033329, -0.0759204, -2.863291, 1, 1, 1, 1, 1,
-0.6030125, 1.52937, 1.688823, 1, 1, 1, 1, 1,
-0.5993005, -0.4910146, -1.646197, 1, 1, 1, 1, 1,
-0.5976065, -0.777391, -1.952955, 1, 1, 1, 1, 1,
-0.5969464, -1.434597, -3.212981, 1, 1, 1, 1, 1,
-0.5964366, -1.240261, -3.487671, 1, 1, 1, 1, 1,
-0.5961548, -0.1741815, -3.672103, 1, 1, 1, 1, 1,
-0.5959634, -0.4134445, -1.966426, 1, 1, 1, 1, 1,
-0.5916838, 0.2263079, -0.7796891, 1, 1, 1, 1, 1,
-0.5894257, -0.8679508, -3.491131, 1, 1, 1, 1, 1,
-0.5884016, 0.1485904, -1.661511, 0, 0, 1, 1, 1,
-0.5845795, 1.62782, -0.2386077, 1, 0, 0, 1, 1,
-0.5824692, -0.4302578, -1.202109, 1, 0, 0, 1, 1,
-0.5807894, -1.052228, -3.870263, 1, 0, 0, 1, 1,
-0.5774006, -0.3147008, -0.7531493, 1, 0, 0, 1, 1,
-0.5717668, -0.9993354, -2.879255, 1, 0, 0, 1, 1,
-0.5661596, -0.3758814, -2.114584, 0, 0, 0, 1, 1,
-0.562515, 0.6359872, 0.5795022, 0, 0, 0, 1, 1,
-0.5602767, -0.09984108, -1.45678, 0, 0, 0, 1, 1,
-0.5528098, 0.2728025, 0.3212642, 0, 0, 0, 1, 1,
-0.5490854, -0.09024772, -2.196701, 0, 0, 0, 1, 1,
-0.534999, -0.4876636, -1.930679, 0, 0, 0, 1, 1,
-0.5347236, 0.7734979, -0.3801121, 0, 0, 0, 1, 1,
-0.5303091, -0.5850734, -1.957467, 1, 1, 1, 1, 1,
-0.5285416, 0.6864899, -0.9407256, 1, 1, 1, 1, 1,
-0.5201825, 0.616492, -1.466217, 1, 1, 1, 1, 1,
-0.5184189, -0.2392596, -0.8938283, 1, 1, 1, 1, 1,
-0.5168034, 0.4633992, 1.46298, 1, 1, 1, 1, 1,
-0.5167465, 1.456023, -0.1036838, 1, 1, 1, 1, 1,
-0.5143961, -0.6097323, -3.245131, 1, 1, 1, 1, 1,
-0.5141678, 1.759413, -0.9087492, 1, 1, 1, 1, 1,
-0.5132669, -1.990022, -3.007728, 1, 1, 1, 1, 1,
-0.5036428, -0.4707994, -1.647765, 1, 1, 1, 1, 1,
-0.503334, 2.164809, 0.2327017, 1, 1, 1, 1, 1,
-0.502681, -0.4722405, -1.371019, 1, 1, 1, 1, 1,
-0.5020024, 2.161852, 0.2299166, 1, 1, 1, 1, 1,
-0.4959924, -0.390074, -1.984282, 1, 1, 1, 1, 1,
-0.4958622, -1.037227, -3.147355, 1, 1, 1, 1, 1,
-0.4885115, -0.2952468, -0.9824783, 0, 0, 1, 1, 1,
-0.4871966, -0.5333315, -3.494413, 1, 0, 0, 1, 1,
-0.4858931, -0.4293453, -2.377836, 1, 0, 0, 1, 1,
-0.4789096, -1.256764, -2.874329, 1, 0, 0, 1, 1,
-0.4773351, 0.7776106, -0.5803257, 1, 0, 0, 1, 1,
-0.4682295, 1.202782, -0.9689588, 1, 0, 0, 1, 1,
-0.4658199, 1.433851, -0.4775493, 0, 0, 0, 1, 1,
-0.4611967, -1.029904, -2.478176, 0, 0, 0, 1, 1,
-0.4611872, -1.218328, -3.386441, 0, 0, 0, 1, 1,
-0.4557525, -0.07144415, -2.354725, 0, 0, 0, 1, 1,
-0.4547232, 1.0836, -1.051281, 0, 0, 0, 1, 1,
-0.4526481, 0.4619221, -0.2427702, 0, 0, 0, 1, 1,
-0.4526392, 0.5572286, 0.6167954, 0, 0, 0, 1, 1,
-0.44461, 0.852822, -1.096192, 1, 1, 1, 1, 1,
-0.4441212, 0.02036185, -0.7794915, 1, 1, 1, 1, 1,
-0.4430599, -0.1069969, -1.881561, 1, 1, 1, 1, 1,
-0.4405516, -1.632361, -3.456211, 1, 1, 1, 1, 1,
-0.4392802, 1.280349, 0.6581928, 1, 1, 1, 1, 1,
-0.4365335, 1.073763, -0.7917989, 1, 1, 1, 1, 1,
-0.4212148, 1.600971, -1.210892, 1, 1, 1, 1, 1,
-0.4173224, -1.407379, -4.387757, 1, 1, 1, 1, 1,
-0.416914, 0.2313714, -1.104799, 1, 1, 1, 1, 1,
-0.4165671, 1.071107, -0.006615527, 1, 1, 1, 1, 1,
-0.414468, 0.9801709, 0.4607195, 1, 1, 1, 1, 1,
-0.4136485, -1.708716, -1.269285, 1, 1, 1, 1, 1,
-0.413101, 0.6117067, 0.6053119, 1, 1, 1, 1, 1,
-0.4121566, -0.1516241, -1.671732, 1, 1, 1, 1, 1,
-0.4106494, 0.3899944, -0.8735993, 1, 1, 1, 1, 1,
-0.4097129, -0.006855284, -0.5173373, 0, 0, 1, 1, 1,
-0.4095492, -0.0257998, -3.160565, 1, 0, 0, 1, 1,
-0.4080567, 0.3487276, -1.397386, 1, 0, 0, 1, 1,
-0.4059317, 0.3759643, 0.6336114, 1, 0, 0, 1, 1,
-0.4056367, -1.035146, -2.059842, 1, 0, 0, 1, 1,
-0.4041675, 0.4928045, -0.2862889, 1, 0, 0, 1, 1,
-0.3992892, -1.057447, -2.296454, 0, 0, 0, 1, 1,
-0.3991223, 0.9653207, -0.3448521, 0, 0, 0, 1, 1,
-0.3988603, 0.8603371, -1.526627, 0, 0, 0, 1, 1,
-0.396883, -0.09750001, -0.6381496, 0, 0, 0, 1, 1,
-0.3967973, 0.4829013, -2.011713, 0, 0, 0, 1, 1,
-0.3928865, -0.4719396, -2.423931, 0, 0, 0, 1, 1,
-0.392859, -1.111284, -1.768718, 0, 0, 0, 1, 1,
-0.3910522, -0.5667509, -3.15856, 1, 1, 1, 1, 1,
-0.3861148, 0.07061213, 0.8835614, 1, 1, 1, 1, 1,
-0.3860525, -0.4234672, -2.998617, 1, 1, 1, 1, 1,
-0.3833857, -1.171889, -2.965633, 1, 1, 1, 1, 1,
-0.3820516, 0.1153789, 0.02852064, 1, 1, 1, 1, 1,
-0.3805569, -0.6837581, -2.598224, 1, 1, 1, 1, 1,
-0.376695, -2.293073, -2.596622, 1, 1, 1, 1, 1,
-0.375223, -0.339656, -1.522662, 1, 1, 1, 1, 1,
-0.3689891, 2.19538, -0.5410292, 1, 1, 1, 1, 1,
-0.3651504, -2.110077, -4.711154, 1, 1, 1, 1, 1,
-0.3632615, -0.3677818, -1.716056, 1, 1, 1, 1, 1,
-0.3631212, 0.01245842, -0.9531765, 1, 1, 1, 1, 1,
-0.3617161, -0.1400741, -2.499289, 1, 1, 1, 1, 1,
-0.3594391, -0.2185062, -3.908014, 1, 1, 1, 1, 1,
-0.3550735, 0.5293179, -0.2499912, 1, 1, 1, 1, 1,
-0.3525489, 0.8619304, -2.141271, 0, 0, 1, 1, 1,
-0.3524238, -1.198561, -1.757157, 1, 0, 0, 1, 1,
-0.3506893, -0.7617742, -2.830909, 1, 0, 0, 1, 1,
-0.3493083, 0.3072214, -0.3210122, 1, 0, 0, 1, 1,
-0.3463916, 0.6717746, -2.083149, 1, 0, 0, 1, 1,
-0.3378924, 0.5724328, -0.2200012, 1, 0, 0, 1, 1,
-0.3364696, -0.2916956, -2.397416, 0, 0, 0, 1, 1,
-0.3359733, -0.6226222, -5.061889, 0, 0, 0, 1, 1,
-0.3318473, -0.8141974, -3.558986, 0, 0, 0, 1, 1,
-0.3214726, 0.1460831, 0.9779875, 0, 0, 0, 1, 1,
-0.3204758, -1.115875, -2.869726, 0, 0, 0, 1, 1,
-0.3202111, 0.4281393, -0.8086826, 0, 0, 0, 1, 1,
-0.314234, 0.2898236, -2.335907, 0, 0, 0, 1, 1,
-0.310686, 0.5551362, 0.175386, 1, 1, 1, 1, 1,
-0.307158, -0.07887331, -3.402615, 1, 1, 1, 1, 1,
-0.3051771, -1.126529, -3.706223, 1, 1, 1, 1, 1,
-0.3035623, 0.489949, -0.7351783, 1, 1, 1, 1, 1,
-0.295403, -0.3592035, -2.207022, 1, 1, 1, 1, 1,
-0.2931623, -1.06682, -1.925264, 1, 1, 1, 1, 1,
-0.2920738, 2.540474, 2.379725, 1, 1, 1, 1, 1,
-0.2918329, -0.4350648, -2.076305, 1, 1, 1, 1, 1,
-0.2852151, 0.6762724, -0.7152593, 1, 1, 1, 1, 1,
-0.2847314, 0.8929306, -2.431137, 1, 1, 1, 1, 1,
-0.283978, -0.6893314, -2.624614, 1, 1, 1, 1, 1,
-0.2827945, -0.4817153, -3.720741, 1, 1, 1, 1, 1,
-0.276296, -0.06510954, -2.660611, 1, 1, 1, 1, 1,
-0.2725386, 0.4165782, 1.07888, 1, 1, 1, 1, 1,
-0.2716627, -0.221484, -2.742137, 1, 1, 1, 1, 1,
-0.2710301, 0.4934871, 0.9165067, 0, 0, 1, 1, 1,
-0.2687222, -1.93604, -3.867316, 1, 0, 0, 1, 1,
-0.2672462, 1.697988, 0.3984949, 1, 0, 0, 1, 1,
-0.2648706, -1.139643, -2.27995, 1, 0, 0, 1, 1,
-0.2644998, 1.012037, -1.868561, 1, 0, 0, 1, 1,
-0.2644354, -1.012932, -4.401447, 1, 0, 0, 1, 1,
-0.2621491, 0.4453696, -0.755596, 0, 0, 0, 1, 1,
-0.2619472, 0.7549692, 0.4898735, 0, 0, 0, 1, 1,
-0.2598045, -1.121789, -2.469718, 0, 0, 0, 1, 1,
-0.2592144, 0.8505187, -0.4579046, 0, 0, 0, 1, 1,
-0.2551462, 0.2204313, -2.116654, 0, 0, 0, 1, 1,
-0.2511641, -0.5294757, -1.666526, 0, 0, 0, 1, 1,
-0.2410865, 0.131661, -0.7505015, 0, 0, 0, 1, 1,
-0.2367324, -0.4791591, -2.797411, 1, 1, 1, 1, 1,
-0.2360553, -0.9027283, -1.793478, 1, 1, 1, 1, 1,
-0.2255147, 0.4807293, -1.208174, 1, 1, 1, 1, 1,
-0.22419, 1.010098, -0.1162829, 1, 1, 1, 1, 1,
-0.2231491, -2.046342, -4.6867, 1, 1, 1, 1, 1,
-0.2030274, 0.01878033, -0.8220472, 1, 1, 1, 1, 1,
-0.2016491, -1.054715, -2.606392, 1, 1, 1, 1, 1,
-0.2000898, 1.209665, -0.6057709, 1, 1, 1, 1, 1,
-0.1996434, 0.6400753, 0.4174086, 1, 1, 1, 1, 1,
-0.1939847, 1.956256, -0.4491127, 1, 1, 1, 1, 1,
-0.1919271, -0.9538987, -3.071073, 1, 1, 1, 1, 1,
-0.1916125, -1.196956, -2.815066, 1, 1, 1, 1, 1,
-0.1906822, -0.2678071, -2.305903, 1, 1, 1, 1, 1,
-0.1886019, 1.177585, -0.09344047, 1, 1, 1, 1, 1,
-0.1885494, 0.4886847, 0.5476065, 1, 1, 1, 1, 1,
-0.183293, -0.9127668, -3.74834, 0, 0, 1, 1, 1,
-0.1820789, 1.018925, -2.292304, 1, 0, 0, 1, 1,
-0.1814815, -1.339522, -2.92556, 1, 0, 0, 1, 1,
-0.1785575, 0.9776887, -1.024956, 1, 0, 0, 1, 1,
-0.1771705, 0.9682564, -1.386031, 1, 0, 0, 1, 1,
-0.1721046, 0.1588669, -0.8001274, 1, 0, 0, 1, 1,
-0.1642503, 0.3701295, -1.823879, 0, 0, 0, 1, 1,
-0.1592848, -0.121372, -1.002198, 0, 0, 0, 1, 1,
-0.1521262, -1.399451, -3.896016, 0, 0, 0, 1, 1,
-0.1460057, 0.7241319, -0.1102502, 0, 0, 0, 1, 1,
-0.1452741, 1.511044, -0.6054, 0, 0, 0, 1, 1,
-0.1442076, -0.1780138, -2.335196, 0, 0, 0, 1, 1,
-0.1430949, -0.7809759, -3.758157, 0, 0, 0, 1, 1,
-0.1427564, 1.703094, -2.311645, 1, 1, 1, 1, 1,
-0.1403842, -0.5952094, -4.175796, 1, 1, 1, 1, 1,
-0.13727, 0.1660095, -2.345443, 1, 1, 1, 1, 1,
-0.1345625, 0.9699719, 1.017139, 1, 1, 1, 1, 1,
-0.1331933, 0.003008026, -0.8382038, 1, 1, 1, 1, 1,
-0.1324566, 1.323272, -1.224947, 1, 1, 1, 1, 1,
-0.1279345, -0.2419668, -3.271058, 1, 1, 1, 1, 1,
-0.1272908, 1.751432, 2.291517, 1, 1, 1, 1, 1,
-0.1236881, 0.9268875, -0.05942169, 1, 1, 1, 1, 1,
-0.1150941, 0.2011814, -0.6821519, 1, 1, 1, 1, 1,
-0.1147676, -1.411988, -2.816763, 1, 1, 1, 1, 1,
-0.1140772, -0.4666157, -3.526207, 1, 1, 1, 1, 1,
-0.1116586, -0.4415041, -1.999942, 1, 1, 1, 1, 1,
-0.1092131, -1.086769, -3.5903, 1, 1, 1, 1, 1,
-0.1072997, -1.492719, -4.862053, 1, 1, 1, 1, 1,
-0.1068455, -1.933339, -1.752413, 0, 0, 1, 1, 1,
-0.1064837, -0.4650823, -0.6071614, 1, 0, 0, 1, 1,
-0.1034767, -1.647331, -1.414235, 1, 0, 0, 1, 1,
-0.1023105, 0.0281104, -0.2437319, 1, 0, 0, 1, 1,
-0.1002608, -0.5809465, -4.111754, 1, 0, 0, 1, 1,
-0.09920277, -1.003149, -1.466329, 1, 0, 0, 1, 1,
-0.0959708, -0.1571926, -2.599828, 0, 0, 0, 1, 1,
-0.09154182, -0.1773037, -2.69706, 0, 0, 0, 1, 1,
-0.08879945, 0.09310345, -1.234987, 0, 0, 0, 1, 1,
-0.08801705, -1.81522, -3.277562, 0, 0, 0, 1, 1,
-0.07965901, 0.5430628, -1.706489, 0, 0, 0, 1, 1,
-0.07821058, 0.8697711, -0.7589787, 0, 0, 0, 1, 1,
-0.07307003, -0.6295878, -2.733236, 0, 0, 0, 1, 1,
-0.07250869, -0.706623, -3.254544, 1, 1, 1, 1, 1,
-0.07164612, -0.5200505, -1.856779, 1, 1, 1, 1, 1,
-0.07066201, 0.1181477, -0.3985678, 1, 1, 1, 1, 1,
-0.07058419, -1.575406, -2.985349, 1, 1, 1, 1, 1,
-0.06863491, 1.342688, -1.25085, 1, 1, 1, 1, 1,
-0.06498241, 0.5753437, 0.06709276, 1, 1, 1, 1, 1,
-0.06135938, -1.195788, -2.353635, 1, 1, 1, 1, 1,
-0.05510907, -2.421544, -2.606842, 1, 1, 1, 1, 1,
-0.04825122, 0.7433157, -0.7024058, 1, 1, 1, 1, 1,
-0.0411255, -0.6809014, -4.291332, 1, 1, 1, 1, 1,
-0.03956736, -0.6810046, -1.406909, 1, 1, 1, 1, 1,
-0.035014, -1.086373, -2.944124, 1, 1, 1, 1, 1,
-0.02978038, -0.4892013, -3.407742, 1, 1, 1, 1, 1,
-0.02925351, 1.646765, 0.9125441, 1, 1, 1, 1, 1,
-0.02876688, -0.1743949, -1.23971, 1, 1, 1, 1, 1,
-0.02540115, -0.7298338, -2.946219, 0, 0, 1, 1, 1,
-0.02351831, 1.171497, 2.813308, 1, 0, 0, 1, 1,
-0.01864464, -0.2309848, -3.699748, 1, 0, 0, 1, 1,
-0.01735136, -0.02865457, -2.506955, 1, 0, 0, 1, 1,
-0.01377701, -2.049018, -2.561429, 1, 0, 0, 1, 1,
-0.007791781, -0.1096096, -3.106852, 1, 0, 0, 1, 1,
-0.004034544, 0.5934756, 1.465984, 0, 0, 0, 1, 1,
-0.003190183, -0.9633419, -1.162491, 0, 0, 0, 1, 1,
-0.001093659, -0.7296081, -2.88434, 0, 0, 0, 1, 1,
0.002283859, 0.8458357, 0.935722, 0, 0, 0, 1, 1,
0.007627669, -0.02905018, 2.719331, 0, 0, 0, 1, 1,
0.008809265, -0.4135204, 4.785064, 0, 0, 0, 1, 1,
0.01461322, 0.9165741, 1.991544, 0, 0, 0, 1, 1,
0.01929152, -0.9907754, 1.888495, 1, 1, 1, 1, 1,
0.01938766, -1.435178, 5.478603, 1, 1, 1, 1, 1,
0.02501084, -0.2983074, 4.167315, 1, 1, 1, 1, 1,
0.02618846, -1.18448, 2.895342, 1, 1, 1, 1, 1,
0.02906753, -1.053671, 3.578199, 1, 1, 1, 1, 1,
0.0294246, -0.280489, 2.736404, 1, 1, 1, 1, 1,
0.03272864, 0.3252461, -0.01437654, 1, 1, 1, 1, 1,
0.03578653, 0.363662, 0.6953579, 1, 1, 1, 1, 1,
0.03759604, -0.4786674, 2.749499, 1, 1, 1, 1, 1,
0.0467106, 1.431144, 1.976734, 1, 1, 1, 1, 1,
0.05024873, 0.4442385, 1.606297, 1, 1, 1, 1, 1,
0.051037, -0.03313921, 3.277393, 1, 1, 1, 1, 1,
0.05350463, 1.093345, 0.5857808, 1, 1, 1, 1, 1,
0.05810506, 1.271852, -0.08834406, 1, 1, 1, 1, 1,
0.06016703, -0.4571339, 2.704465, 1, 1, 1, 1, 1,
0.06052637, 0.402611, 0.08239059, 0, 0, 1, 1, 1,
0.06231373, 0.04548757, 1.22556, 1, 0, 0, 1, 1,
0.06384311, -0.1146881, 4.341703, 1, 0, 0, 1, 1,
0.06456961, 0.2913659, 0.8698367, 1, 0, 0, 1, 1,
0.06660016, 0.6187155, 1.278079, 1, 0, 0, 1, 1,
0.07869928, 0.7410797, 1.868394, 1, 0, 0, 1, 1,
0.08249604, -0.02184305, 2.419761, 0, 0, 0, 1, 1,
0.0866762, -0.9045328, 0.6765615, 0, 0, 0, 1, 1,
0.09216619, -1.648297, 2.268422, 0, 0, 0, 1, 1,
0.09434953, 0.1712148, -1.2973, 0, 0, 0, 1, 1,
0.0969736, 0.6316162, 0.3641558, 0, 0, 0, 1, 1,
0.09766299, 0.214316, -0.203884, 0, 0, 0, 1, 1,
0.1027157, 1.509046, 1.246096, 0, 0, 0, 1, 1,
0.10566, 1.450659, -1.196834, 1, 1, 1, 1, 1,
0.1057698, 0.0820905, 1.363131, 1, 1, 1, 1, 1,
0.111411, 1.049012, 0.4310662, 1, 1, 1, 1, 1,
0.1118435, -0.6442644, 2.823217, 1, 1, 1, 1, 1,
0.1142509, -0.9644434, 1.921405, 1, 1, 1, 1, 1,
0.1144241, 1.097042, 0.2175647, 1, 1, 1, 1, 1,
0.1189374, -0.6742744, 2.723444, 1, 1, 1, 1, 1,
0.1191641, 0.6167128, 2.577281, 1, 1, 1, 1, 1,
0.1200481, -1.239589, 1.414359, 1, 1, 1, 1, 1,
0.1201791, 0.5767426, -0.4657461, 1, 1, 1, 1, 1,
0.1222796, -0.3239532, 2.386873, 1, 1, 1, 1, 1,
0.1232418, 0.692738, 0.6633089, 1, 1, 1, 1, 1,
0.1235501, 1.466463, 0.5555736, 1, 1, 1, 1, 1,
0.1279477, 0.07169101, 1.689614, 1, 1, 1, 1, 1,
0.1286736, 0.2121074, 2.283356, 1, 1, 1, 1, 1,
0.129433, 0.9218006, 0.2806252, 0, 0, 1, 1, 1,
0.1315695, 0.3157264, 1.756495, 1, 0, 0, 1, 1,
0.1324725, -0.3277196, 2.958616, 1, 0, 0, 1, 1,
0.135367, 0.208317, 1.171709, 1, 0, 0, 1, 1,
0.1394187, -0.310251, 1.318169, 1, 0, 0, 1, 1,
0.1422624, 0.6353481, 1.576571, 1, 0, 0, 1, 1,
0.1425312, -0.7978968, 1.519115, 0, 0, 0, 1, 1,
0.1430726, 0.2170125, -0.597141, 0, 0, 0, 1, 1,
0.1478141, -0.7677104, 2.869143, 0, 0, 0, 1, 1,
0.1480846, -0.8163089, 3.120797, 0, 0, 0, 1, 1,
0.1489112, -0.2731059, 3.43451, 0, 0, 0, 1, 1,
0.1495841, 0.1029538, 1.064987, 0, 0, 0, 1, 1,
0.1535624, -1.169716, 2.465702, 0, 0, 0, 1, 1,
0.15569, 1.027039, 0.6279193, 1, 1, 1, 1, 1,
0.1569635, 0.3423935, 0.2107418, 1, 1, 1, 1, 1,
0.1658309, -0.1299039, 0.5393649, 1, 1, 1, 1, 1,
0.1724643, 0.3764583, 0.03136049, 1, 1, 1, 1, 1,
0.1814272, 0.3946268, 0.7436092, 1, 1, 1, 1, 1,
0.1853257, -0.4767242, 3.200573, 1, 1, 1, 1, 1,
0.185709, 1.494041, 0.7853348, 1, 1, 1, 1, 1,
0.1868062, 0.2968361, 2.836203, 1, 1, 1, 1, 1,
0.1876195, -0.1907932, 0.5634114, 1, 1, 1, 1, 1,
0.1907351, -0.2776544, 1.700683, 1, 1, 1, 1, 1,
0.1942953, 0.8110064, 0.5675802, 1, 1, 1, 1, 1,
0.1965055, -0.3258039, 1.929983, 1, 1, 1, 1, 1,
0.1965282, -0.3467071, 1.527645, 1, 1, 1, 1, 1,
0.1971768, -0.5218779, 4.220373, 1, 1, 1, 1, 1,
0.1977205, 0.3825564, -0.7727368, 1, 1, 1, 1, 1,
0.2013364, -0.4489932, 0.6012875, 0, 0, 1, 1, 1,
0.2038291, -1.118694, 2.118236, 1, 0, 0, 1, 1,
0.206981, 0.4351205, 2.688837, 1, 0, 0, 1, 1,
0.2072271, -1.151889, 3.401653, 1, 0, 0, 1, 1,
0.2084459, -0.3663158, 3.515865, 1, 0, 0, 1, 1,
0.2097458, 0.5956073, 1.623433, 1, 0, 0, 1, 1,
0.2130557, 0.5394154, -0.3514922, 0, 0, 0, 1, 1,
0.2130699, -0.2028114, 0.6992754, 0, 0, 0, 1, 1,
0.2148081, -0.5561222, 2.527642, 0, 0, 0, 1, 1,
0.2154814, -0.2618509, 1.813721, 0, 0, 0, 1, 1,
0.2170048, -1.047854, 1.790267, 0, 0, 0, 1, 1,
0.2184658, -0.07147661, 0.725568, 0, 0, 0, 1, 1,
0.2195085, 0.4715261, 0.8350221, 0, 0, 0, 1, 1,
0.219953, 0.5397064, 0.2356711, 1, 1, 1, 1, 1,
0.2218899, -1.35411, 3.484062, 1, 1, 1, 1, 1,
0.2230326, -1.211781, 3.708263, 1, 1, 1, 1, 1,
0.2230973, 1.23906, 0.1911193, 1, 1, 1, 1, 1,
0.2271078, -1.285662, 3.552012, 1, 1, 1, 1, 1,
0.2284231, 0.1753427, 0.5133949, 1, 1, 1, 1, 1,
0.2287005, -0.7300829, 3.435775, 1, 1, 1, 1, 1,
0.2326332, 0.725181, 1.466106, 1, 1, 1, 1, 1,
0.2332021, 1.970919, -0.01402237, 1, 1, 1, 1, 1,
0.2357317, 0.4335117, -0.6590102, 1, 1, 1, 1, 1,
0.2406947, 1.322162, -1.168283, 1, 1, 1, 1, 1,
0.2477344, 1.878829, 1.017187, 1, 1, 1, 1, 1,
0.2481879, 0.6687854, 1.594972, 1, 1, 1, 1, 1,
0.2495895, 1.231151, -0.2175955, 1, 1, 1, 1, 1,
0.2518601, 1.343422, -0.2878527, 1, 1, 1, 1, 1,
0.2524099, 0.4726145, 1.404933, 0, 0, 1, 1, 1,
0.253936, 0.4769655, 1.188132, 1, 0, 0, 1, 1,
0.2605706, -0.2845517, 2.357378, 1, 0, 0, 1, 1,
0.2623725, 0.2167558, 1.639091, 1, 0, 0, 1, 1,
0.2660632, -0.4897836, 2.076419, 1, 0, 0, 1, 1,
0.2680736, 1.187598, -0.8286097, 1, 0, 0, 1, 1,
0.2690004, -0.7416467, 2.096298, 0, 0, 0, 1, 1,
0.2697668, 0.3822667, 0.9955762, 0, 0, 0, 1, 1,
0.2810233, -0.4763148, 2.906297, 0, 0, 0, 1, 1,
0.2895222, -0.7711851, 2.703734, 0, 0, 0, 1, 1,
0.2915204, -0.4517343, 2.560182, 0, 0, 0, 1, 1,
0.2949976, 0.2030068, 1.629072, 0, 0, 0, 1, 1,
0.2991922, -0.2036715, 1.952375, 0, 0, 0, 1, 1,
0.2999623, -0.4461031, 4.179333, 1, 1, 1, 1, 1,
0.3021773, 0.04376135, 1.429041, 1, 1, 1, 1, 1,
0.3259802, -0.1144656, 3.017632, 1, 1, 1, 1, 1,
0.325995, 0.1130698, 0.5830335, 1, 1, 1, 1, 1,
0.3268594, 0.5961117, -0.09333926, 1, 1, 1, 1, 1,
0.329659, 1.185779, 0.5529397, 1, 1, 1, 1, 1,
0.3358368, -0.7716181, 2.810365, 1, 1, 1, 1, 1,
0.3360958, 0.08152264, 3.042404, 1, 1, 1, 1, 1,
0.3414892, -0.9026201, 2.693812, 1, 1, 1, 1, 1,
0.342181, -1.563406, 1.213183, 1, 1, 1, 1, 1,
0.342779, 0.2667329, 0.5937614, 1, 1, 1, 1, 1,
0.3443067, 0.4157513, 0.406298, 1, 1, 1, 1, 1,
0.345739, -0.578998, 2.266098, 1, 1, 1, 1, 1,
0.3493213, 1.790379, 0.6407626, 1, 1, 1, 1, 1,
0.3516762, -0.7941294, 2.961413, 1, 1, 1, 1, 1,
0.3525584, 1.906178, 0.5842075, 0, 0, 1, 1, 1,
0.3534975, 0.306418, 1.373037, 1, 0, 0, 1, 1,
0.3536224, 0.7724072, 0.3063039, 1, 0, 0, 1, 1,
0.35379, 0.4015448, -1.027489, 1, 0, 0, 1, 1,
0.3549155, 0.8053491, 0.1178027, 1, 0, 0, 1, 1,
0.3620254, 0.618165, 0.2634511, 1, 0, 0, 1, 1,
0.36203, 1.007475, 0.2383119, 0, 0, 0, 1, 1,
0.3628853, 0.8488433, 1.009594, 0, 0, 0, 1, 1,
0.3640414, 0.07252683, 1.160247, 0, 0, 0, 1, 1,
0.3641832, 1.644731, -0.8000361, 0, 0, 0, 1, 1,
0.3704835, 0.865189, 0.7251134, 0, 0, 0, 1, 1,
0.3729349, 1.858043, -1.175663, 0, 0, 0, 1, 1,
0.3730037, -0.1386965, 3.930741, 0, 0, 0, 1, 1,
0.3737365, -0.2861586, 1.872534, 1, 1, 1, 1, 1,
0.3810392, 0.3805809, 1.047365, 1, 1, 1, 1, 1,
0.3867163, 0.1879982, 0.92606, 1, 1, 1, 1, 1,
0.390588, -0.2449282, 0.8908011, 1, 1, 1, 1, 1,
0.3922216, 0.6069484, 0.8534, 1, 1, 1, 1, 1,
0.3922563, 0.6819427, 1.45964, 1, 1, 1, 1, 1,
0.3959267, -0.03098184, 0.6208524, 1, 1, 1, 1, 1,
0.4037105, 0.6422927, 1.448233, 1, 1, 1, 1, 1,
0.4063184, 0.7091922, 0.5357441, 1, 1, 1, 1, 1,
0.4102206, 1.568136, -1.079288, 1, 1, 1, 1, 1,
0.4135546, -0.859231, 3.043988, 1, 1, 1, 1, 1,
0.4155726, 0.624723, -0.2277238, 1, 1, 1, 1, 1,
0.4189915, 0.5182984, 0.7601659, 1, 1, 1, 1, 1,
0.4216395, -0.003982122, 0.7553744, 1, 1, 1, 1, 1,
0.4273227, -0.669805, 2.405547, 1, 1, 1, 1, 1,
0.4304141, -0.1776259, 0.7937508, 0, 0, 1, 1, 1,
0.434723, -0.4310007, 0.4453999, 1, 0, 0, 1, 1,
0.4362853, 0.491796, 2.508814, 1, 0, 0, 1, 1,
0.4409626, 0.9133889, -1.076694, 1, 0, 0, 1, 1,
0.4415792, 0.9203588, 0.6400054, 1, 0, 0, 1, 1,
0.442227, -1.359078, 0.671904, 1, 0, 0, 1, 1,
0.4424893, 1.947604, 1.634264, 0, 0, 0, 1, 1,
0.4452835, 0.2484868, 1.80376, 0, 0, 0, 1, 1,
0.4514631, -0.7036304, 3.195282, 0, 0, 0, 1, 1,
0.4517737, 0.2305887, 0.3335386, 0, 0, 0, 1, 1,
0.4552897, 0.3863506, 2.5622, 0, 0, 0, 1, 1,
0.4623131, 1.248024, 1.796424, 0, 0, 0, 1, 1,
0.4628999, -0.2751175, 2.663057, 0, 0, 0, 1, 1,
0.4688987, 1.39456, 1.018426, 1, 1, 1, 1, 1,
0.473778, 1.415462, 2.531819, 1, 1, 1, 1, 1,
0.4755369, -1.179199, 1.794371, 1, 1, 1, 1, 1,
0.478294, -0.2189642, 2.119918, 1, 1, 1, 1, 1,
0.480769, -1.19391, 1.30355, 1, 1, 1, 1, 1,
0.4878613, 1.377724, -0.3337545, 1, 1, 1, 1, 1,
0.4893471, 0.497641, 1.80235, 1, 1, 1, 1, 1,
0.4909839, 0.844018, 1.06122, 1, 1, 1, 1, 1,
0.4920658, -0.5897092, 5.133248, 1, 1, 1, 1, 1,
0.4927949, 1.158941, -0.7302283, 1, 1, 1, 1, 1,
0.4930159, -0.6386799, 3.410597, 1, 1, 1, 1, 1,
0.4997087, 0.3959673, 0.4347453, 1, 1, 1, 1, 1,
0.4997227, 0.9210445, 0.5732802, 1, 1, 1, 1, 1,
0.5014753, -0.3318769, 2.438094, 1, 1, 1, 1, 1,
0.5018148, -0.781995, 1.512206, 1, 1, 1, 1, 1,
0.5020051, 0.6755829, 0.5756673, 0, 0, 1, 1, 1,
0.504964, 0.9395937, 0.1754418, 1, 0, 0, 1, 1,
0.5059044, -0.05285199, 1.241585, 1, 0, 0, 1, 1,
0.5068002, -0.9003554, 1.804451, 1, 0, 0, 1, 1,
0.5068272, -2.026424, 1.552067, 1, 0, 0, 1, 1,
0.5104959, 0.7328795, 0.7237094, 1, 0, 0, 1, 1,
0.5151101, -0.8798848, 3.569577, 0, 0, 0, 1, 1,
0.5152892, -0.9049499, 2.279566, 0, 0, 0, 1, 1,
0.5155376, 0.1267776, 2.601887, 0, 0, 0, 1, 1,
0.516466, -1.182708, 2.396143, 0, 0, 0, 1, 1,
0.5219682, -0.9993363, 0.8375998, 0, 0, 0, 1, 1,
0.5266993, -0.550793, 3.364936, 0, 0, 0, 1, 1,
0.5269185, -0.5188836, 2.455446, 0, 0, 0, 1, 1,
0.5274595, 1.222272, 2.104551, 1, 1, 1, 1, 1,
0.5313092, -0.7116386, 3.517623, 1, 1, 1, 1, 1,
0.5328288, -0.3930633, 2.242547, 1, 1, 1, 1, 1,
0.5366132, -0.4555283, 0.8933113, 1, 1, 1, 1, 1,
0.5402926, -0.152851, 1.399706, 1, 1, 1, 1, 1,
0.5407467, 0.127592, 0.8260699, 1, 1, 1, 1, 1,
0.5416593, 0.1153374, 0.5528207, 1, 1, 1, 1, 1,
0.5419182, 0.1001115, 1.411603, 1, 1, 1, 1, 1,
0.5492131, -0.615778, 3.136742, 1, 1, 1, 1, 1,
0.5525451, 0.5498593, 1.20858, 1, 1, 1, 1, 1,
0.5563871, 1.543605, -1.131522, 1, 1, 1, 1, 1,
0.5614911, 0.6968002, 0.0223389, 1, 1, 1, 1, 1,
0.5636539, -0.3100613, 1.505276, 1, 1, 1, 1, 1,
0.5639384, 0.2199718, 2.007661, 1, 1, 1, 1, 1,
0.5651076, -0.5025806, 3.147725, 1, 1, 1, 1, 1,
0.5666379, 0.5256374, 2.381895, 0, 0, 1, 1, 1,
0.5670927, 1.379166, -0.3806725, 1, 0, 0, 1, 1,
0.5671893, -0.6645072, 0.606757, 1, 0, 0, 1, 1,
0.567969, -0.4077722, 2.446522, 1, 0, 0, 1, 1,
0.5687501, 0.6132882, 0.2197342, 1, 0, 0, 1, 1,
0.5708442, 0.3495163, 0.218824, 1, 0, 0, 1, 1,
0.5714371, 1.479326, 0.5187815, 0, 0, 0, 1, 1,
0.5720313, -1.242943, 3.616672, 0, 0, 0, 1, 1,
0.5724506, 1.308996, 0.7620242, 0, 0, 0, 1, 1,
0.5751984, -0.5461688, 2.751848, 0, 0, 0, 1, 1,
0.576214, -0.4643083, 2.302212, 0, 0, 0, 1, 1,
0.5773984, 2.258811, 0.7255974, 0, 0, 0, 1, 1,
0.577753, 0.4836192, 2.292215, 0, 0, 0, 1, 1,
0.5804162, -0.2441825, 3.262452, 1, 1, 1, 1, 1,
0.5821099, 0.1642903, 0.5546949, 1, 1, 1, 1, 1,
0.5895074, 1.011422, -0.6659607, 1, 1, 1, 1, 1,
0.5906527, -2.747724, 3.528227, 1, 1, 1, 1, 1,
0.5919544, -1.226891, 2.842141, 1, 1, 1, 1, 1,
0.5958432, 1.060313, -0.304669, 1, 1, 1, 1, 1,
0.5977938, 1.404062, -1.160122, 1, 1, 1, 1, 1,
0.6022307, -0.4932751, 3.281018, 1, 1, 1, 1, 1,
0.6060346, -1.763294, 2.621206, 1, 1, 1, 1, 1,
0.60685, 1.098004, -0.5073906, 1, 1, 1, 1, 1,
0.6095142, 0.7380244, -0.6307508, 1, 1, 1, 1, 1,
0.6102307, 0.1879905, -0.2993107, 1, 1, 1, 1, 1,
0.6221318, 0.9437534, 0.4605489, 1, 1, 1, 1, 1,
0.6280543, 1.350893, 0.3877512, 1, 1, 1, 1, 1,
0.6334608, -0.193839, 2.776054, 1, 1, 1, 1, 1,
0.6470689, 0.7879431, 2.355197, 0, 0, 1, 1, 1,
0.6505514, 0.4402898, 1.510861, 1, 0, 0, 1, 1,
0.6547917, -0.6826563, 0.1382619, 1, 0, 0, 1, 1,
0.6554716, 0.1491347, 0.07780489, 1, 0, 0, 1, 1,
0.657804, -0.03392426, 2.61004, 1, 0, 0, 1, 1,
0.6638079, -0.7433295, 3.609689, 1, 0, 0, 1, 1,
0.667618, -0.4622555, 1.750383, 0, 0, 0, 1, 1,
0.6703178, -0.5133658, 0.04301509, 0, 0, 0, 1, 1,
0.6741747, -0.2111141, 1.85371, 0, 0, 0, 1, 1,
0.6793552, -0.266438, 3.599941, 0, 0, 0, 1, 1,
0.6876903, 1.510559, -0.4204923, 0, 0, 0, 1, 1,
0.688915, 0.7507414, 2.601744, 0, 0, 0, 1, 1,
0.6928841, 0.3431901, 0.1151385, 0, 0, 0, 1, 1,
0.6950719, 0.03651969, 1.354878, 1, 1, 1, 1, 1,
0.6994635, 0.365069, 3.041105, 1, 1, 1, 1, 1,
0.705212, 0.7283653, 1.70554, 1, 1, 1, 1, 1,
0.7073231, 0.4057749, 1.925465, 1, 1, 1, 1, 1,
0.710705, -0.3738576, 2.72519, 1, 1, 1, 1, 1,
0.7129425, 1.017685, -0.2284447, 1, 1, 1, 1, 1,
0.7141327, -1.056257, 3.115903, 1, 1, 1, 1, 1,
0.7169757, -1.11425, -0.7456164, 1, 1, 1, 1, 1,
0.7177804, 1.044008, -1.378555, 1, 1, 1, 1, 1,
0.7213266, 0.8020828, 1.689935, 1, 1, 1, 1, 1,
0.725843, -0.722833, 1.86241, 1, 1, 1, 1, 1,
0.7307655, -1.264912, 3.404209, 1, 1, 1, 1, 1,
0.7320895, -0.6988582, 2.500951, 1, 1, 1, 1, 1,
0.7353894, -0.9612884, 1.344125, 1, 1, 1, 1, 1,
0.7381213, 0.5538296, 1.529358, 1, 1, 1, 1, 1,
0.738124, -1.163605, 2.492677, 0, 0, 1, 1, 1,
0.7385808, 1.769647, 0.4216866, 1, 0, 0, 1, 1,
0.7392058, 0.6472307, 0.135033, 1, 0, 0, 1, 1,
0.7397036, -0.8424012, 2.03435, 1, 0, 0, 1, 1,
0.7438724, 0.7922904, 1.223323, 1, 0, 0, 1, 1,
0.750425, -0.4788099, 2.832263, 1, 0, 0, 1, 1,
0.7523249, 1.316587, 0.6119667, 0, 0, 0, 1, 1,
0.7535781, -0.1044026, 0.2418581, 0, 0, 0, 1, 1,
0.7581244, -0.1038622, 1.156537, 0, 0, 0, 1, 1,
0.7581499, -1.858513, 3.581448, 0, 0, 0, 1, 1,
0.7658282, 0.5846918, 2.318727, 0, 0, 0, 1, 1,
0.7667306, 0.1801245, 0.7073131, 0, 0, 0, 1, 1,
0.7693985, -0.7633092, 3.27144, 0, 0, 0, 1, 1,
0.7745596, -0.6834573, 2.775934, 1, 1, 1, 1, 1,
0.7815443, 0.5321261, 1.323756, 1, 1, 1, 1, 1,
0.783906, 0.8123183, 0.5595806, 1, 1, 1, 1, 1,
0.7901061, -0.803377, 1.130694, 1, 1, 1, 1, 1,
0.792268, -0.2588312, 2.547632, 1, 1, 1, 1, 1,
0.7927966, 1.173344, 1.828971, 1, 1, 1, 1, 1,
0.7942894, -2.264416, 3.200427, 1, 1, 1, 1, 1,
0.8097483, -1.019406, 2.553048, 1, 1, 1, 1, 1,
0.8100289, 0.8140901, -0.6582176, 1, 1, 1, 1, 1,
0.8141353, -0.4486789, 1.480048, 1, 1, 1, 1, 1,
0.8155816, -1.193327, 4.330811, 1, 1, 1, 1, 1,
0.820779, -0.3216744, 2.451901, 1, 1, 1, 1, 1,
0.8208795, -2.030696, 4.103456, 1, 1, 1, 1, 1,
0.8224518, -0.1226957, 1.723993, 1, 1, 1, 1, 1,
0.8231857, -0.3912904, 2.292349, 1, 1, 1, 1, 1,
0.8341604, -1.261876, 4.4031, 0, 0, 1, 1, 1,
0.8450077, -0.7997702, 2.879874, 1, 0, 0, 1, 1,
0.8464639, 0.3800769, -1.273559, 1, 0, 0, 1, 1,
0.8499904, -0.8603298, 3.99645, 1, 0, 0, 1, 1,
0.8519394, 0.767926, 2.261987, 1, 0, 0, 1, 1,
0.8622761, -0.9160915, 3.825532, 1, 0, 0, 1, 1,
0.8674702, 0.7544542, 0.7514643, 0, 0, 0, 1, 1,
0.869222, 0.9718889, 3.033588, 0, 0, 0, 1, 1,
0.8753756, 1.401264, 1.601925, 0, 0, 0, 1, 1,
0.8776003, 0.4790465, 0.9475322, 0, 0, 0, 1, 1,
0.8791499, 0.5995826, -0.4559485, 0, 0, 0, 1, 1,
0.8808485, 0.09961934, 1.986631, 0, 0, 0, 1, 1,
0.8896163, 1.813976, -0.1575255, 0, 0, 0, 1, 1,
0.9010971, -0.5053614, 0.9758658, 1, 1, 1, 1, 1,
0.901129, 1.148973, 0.7543677, 1, 1, 1, 1, 1,
0.902418, -0.4738941, 2.68878, 1, 1, 1, 1, 1,
0.9025246, 0.6535899, 1.090791, 1, 1, 1, 1, 1,
0.9026183, -1.475551, 2.839147, 1, 1, 1, 1, 1,
0.9088758, -1.575501, 2.89355, 1, 1, 1, 1, 1,
0.9116212, -0.7724134, 2.042286, 1, 1, 1, 1, 1,
0.9119992, -0.3254904, 1.900708, 1, 1, 1, 1, 1,
0.912266, -0.4788256, 2.97606, 1, 1, 1, 1, 1,
0.9133278, -0.1170344, 1.228929, 1, 1, 1, 1, 1,
0.9150497, -1.702803, 2.877794, 1, 1, 1, 1, 1,
0.9151716, -0.3805154, 2.942589, 1, 1, 1, 1, 1,
0.9164067, 0.281238, 0.7679933, 1, 1, 1, 1, 1,
0.9174636, 0.1859255, 0.7329103, 1, 1, 1, 1, 1,
0.917661, 2.001025, 0.3884382, 1, 1, 1, 1, 1,
0.9237002, 0.3970577, 2.369991, 0, 0, 1, 1, 1,
0.9264832, -1.347677, 2.005603, 1, 0, 0, 1, 1,
0.9276967, -0.7515273, 2.972913, 1, 0, 0, 1, 1,
0.9278994, 0.3312455, 2.354167, 1, 0, 0, 1, 1,
0.9305667, 0.0558174, -0.535668, 1, 0, 0, 1, 1,
0.941315, 1.224358, -0.2103978, 1, 0, 0, 1, 1,
0.9433628, 0.426956, -0.9440852, 0, 0, 0, 1, 1,
0.943522, 0.03453099, -0.794763, 0, 0, 0, 1, 1,
0.9436891, 0.1990036, 2.860842, 0, 0, 0, 1, 1,
0.9446266, -0.6311625, 3.379689, 0, 0, 0, 1, 1,
0.9449526, -1.095742, 2.159463, 0, 0, 0, 1, 1,
0.9465136, 1.149248, 0.3234476, 0, 0, 0, 1, 1,
0.9492298, -0.3244634, 1.258631, 0, 0, 0, 1, 1,
0.9539735, -0.7621735, 3.393309, 1, 1, 1, 1, 1,
0.9583092, 0.4302124, 1.403561, 1, 1, 1, 1, 1,
0.9616691, 0.5128617, 1.628511, 1, 1, 1, 1, 1,
0.9708651, -1.715792, 3.227163, 1, 1, 1, 1, 1,
0.9745511, -0.2963337, 2.734533, 1, 1, 1, 1, 1,
0.9764602, 0.2554607, 0.1749352, 1, 1, 1, 1, 1,
0.9827085, 0.801695, 2.214114, 1, 1, 1, 1, 1,
0.9865339, -0.277208, 1.730132, 1, 1, 1, 1, 1,
0.9909833, -0.5128474, 1.184998, 1, 1, 1, 1, 1,
1.004864, -0.004640342, -0.02279313, 1, 1, 1, 1, 1,
1.00559, 0.05517337, 1.926459, 1, 1, 1, 1, 1,
1.007109, 0.1321639, 1.98922, 1, 1, 1, 1, 1,
1.009018, -0.4164682, 2.785685, 1, 1, 1, 1, 1,
1.017378, 0.05164776, 0.06270822, 1, 1, 1, 1, 1,
1.018692, -0.1285598, 2.616357, 1, 1, 1, 1, 1,
1.021801, -0.809471, 1.982415, 0, 0, 1, 1, 1,
1.032655, -0.0285075, 2.806563, 1, 0, 0, 1, 1,
1.042732, -0.2535712, 4.162747, 1, 0, 0, 1, 1,
1.043575, -0.2000474, -1.027618, 1, 0, 0, 1, 1,
1.046822, 0.8721309, 1.884792, 1, 0, 0, 1, 1,
1.048817, 1.41414, 1.745138, 1, 0, 0, 1, 1,
1.056316, 0.4709126, 0.9311265, 0, 0, 0, 1, 1,
1.07534, -0.05494459, 2.64013, 0, 0, 0, 1, 1,
1.076013, -1.001371, 3.433063, 0, 0, 0, 1, 1,
1.079826, -1.675435, 2.710452, 0, 0, 0, 1, 1,
1.080433, -1.615742, 2.108976, 0, 0, 0, 1, 1,
1.094351, -0.771513, 3.367103, 0, 0, 0, 1, 1,
1.094881, 0.08244365, 2.949773, 0, 0, 0, 1, 1,
1.096394, -2.265326, 1.792433, 1, 1, 1, 1, 1,
1.096551, -0.3452732, 1.461114, 1, 1, 1, 1, 1,
1.103185, -0.6783147, 1.397075, 1, 1, 1, 1, 1,
1.105684, 1.023309, 1.879678, 1, 1, 1, 1, 1,
1.110039, -1.379542, 3.093867, 1, 1, 1, 1, 1,
1.114268, 0.8817872, -0.1455092, 1, 1, 1, 1, 1,
1.118358, 1.528425, 0.996764, 1, 1, 1, 1, 1,
1.130616, -2.378345, 3.465535, 1, 1, 1, 1, 1,
1.152936, 0.8510588, -1.306074, 1, 1, 1, 1, 1,
1.161807, -1.438251, 4.054344, 1, 1, 1, 1, 1,
1.161928, -0.429379, 3.181483, 1, 1, 1, 1, 1,
1.162354, -0.4630875, 2.820379, 1, 1, 1, 1, 1,
1.164508, -1.377514, 2.885371, 1, 1, 1, 1, 1,
1.170832, -0.04818736, 2.080296, 1, 1, 1, 1, 1,
1.178208, 0.1305071, 1.718621, 1, 1, 1, 1, 1,
1.183702, -0.9635437, 2.87854, 0, 0, 1, 1, 1,
1.19098, -0.1591771, 0.7736104, 1, 0, 0, 1, 1,
1.197869, 0.4515302, 1.578843, 1, 0, 0, 1, 1,
1.201222, 2.766976, 0.8589894, 1, 0, 0, 1, 1,
1.202006, 1.388479, -0.004001541, 1, 0, 0, 1, 1,
1.209957, -0.5315422, 1.970005, 1, 0, 0, 1, 1,
1.21724, -0.3030098, 2.639764, 0, 0, 0, 1, 1,
1.220529, -0.03185438, 1.572757, 0, 0, 0, 1, 1,
1.221973, -0.3057132, 2.350381, 0, 0, 0, 1, 1,
1.224288, 1.706033, 0.3179766, 0, 0, 0, 1, 1,
1.230247, -0.6960142, 0.8462686, 0, 0, 0, 1, 1,
1.232554, 1.245409, 2.560073, 0, 0, 0, 1, 1,
1.238329, -0.7578846, 0.6788902, 0, 0, 0, 1, 1,
1.239045, 0.6530007, -0.3323333, 1, 1, 1, 1, 1,
1.240539, 0.0555739, 1.682898, 1, 1, 1, 1, 1,
1.250502, -0.04622544, 1.085302, 1, 1, 1, 1, 1,
1.251997, 1.619131, -0.1525348, 1, 1, 1, 1, 1,
1.256029, -0.7526358, 2.144303, 1, 1, 1, 1, 1,
1.257504, -0.6397045, 1.256595, 1, 1, 1, 1, 1,
1.258017, 1.112111, 1.847138, 1, 1, 1, 1, 1,
1.265638, -0.09250094, -0.09599614, 1, 1, 1, 1, 1,
1.266723, 0.3319382, 0.4637384, 1, 1, 1, 1, 1,
1.268865, 0.1622616, 2.572347, 1, 1, 1, 1, 1,
1.273011, -0.7412575, 2.191844, 1, 1, 1, 1, 1,
1.278599, -1.983709, 2.594719, 1, 1, 1, 1, 1,
1.28119, 0.6152008, -0.6659417, 1, 1, 1, 1, 1,
1.290285, -1.323314, 0.1019526, 1, 1, 1, 1, 1,
1.300724, -1.230313, 1.349509, 1, 1, 1, 1, 1,
1.306828, -0.4067944, 3.209788, 0, 0, 1, 1, 1,
1.3134, -0.8476601, 2.109602, 1, 0, 0, 1, 1,
1.321595, 0.8289903, 1.415333, 1, 0, 0, 1, 1,
1.324056, 0.8024288, 2.50469, 1, 0, 0, 1, 1,
1.32738, -1.378405, 2.392844, 1, 0, 0, 1, 1,
1.336951, -0.1297399, 1.486343, 1, 0, 0, 1, 1,
1.343178, 0.8749229, 0.007233011, 0, 0, 0, 1, 1,
1.349733, 0.04111858, 0.7322587, 0, 0, 0, 1, 1,
1.353075, 2.109624, 1.634139, 0, 0, 0, 1, 1,
1.35582, -1.711948, 1.864381, 0, 0, 0, 1, 1,
1.36649, 0.6253668, 0.7741875, 0, 0, 0, 1, 1,
1.369886, -0.1936096, 1.753376, 0, 0, 0, 1, 1,
1.372874, -0.622217, 2.085614, 0, 0, 0, 1, 1,
1.38713, -0.601456, 4.84759, 1, 1, 1, 1, 1,
1.394383, -0.7435177, 1.438661, 1, 1, 1, 1, 1,
1.403671, -0.545119, 1.389937, 1, 1, 1, 1, 1,
1.409147, -1.837038, 3.936651, 1, 1, 1, 1, 1,
1.428455, -0.2050002, 3.717796, 1, 1, 1, 1, 1,
1.436446, -1.108179, 2.049484, 1, 1, 1, 1, 1,
1.441635, 0.5436774, 2.187064, 1, 1, 1, 1, 1,
1.4523, 0.741736, 2.306345, 1, 1, 1, 1, 1,
1.455081, -0.1653292, 1.918464, 1, 1, 1, 1, 1,
1.457661, -0.8929535, 4.719016, 1, 1, 1, 1, 1,
1.469135, -0.6130606, 2.222133, 1, 1, 1, 1, 1,
1.469783, -0.313034, 2.329396, 1, 1, 1, 1, 1,
1.471097, 0.8898481, 2.573749, 1, 1, 1, 1, 1,
1.504677, -0.4100187, 1.600644, 1, 1, 1, 1, 1,
1.511649, 1.389813, 0.08650436, 1, 1, 1, 1, 1,
1.515665, -0.7335558, 2.696341, 0, 0, 1, 1, 1,
1.518237, -0.7312099, 1.79125, 1, 0, 0, 1, 1,
1.519407, 2.190413, -0.1313365, 1, 0, 0, 1, 1,
1.521832, -1.304753, 2.823269, 1, 0, 0, 1, 1,
1.523883, 0.288592, 1.484822, 1, 0, 0, 1, 1,
1.535279, -0.6448081, 3.424405, 1, 0, 0, 1, 1,
1.543554, 0.3380775, 2.593314, 0, 0, 0, 1, 1,
1.562657, 0.5935549, 3.012689, 0, 0, 0, 1, 1,
1.570702, 0.5039302, 1.372009, 0, 0, 0, 1, 1,
1.572981, 0.3510368, 2.02206, 0, 0, 0, 1, 1,
1.577872, 3.372652, -0.4663452, 0, 0, 0, 1, 1,
1.587332, 0.336568, 2.000114, 0, 0, 0, 1, 1,
1.59391, 0.5674458, 1.76898, 0, 0, 0, 1, 1,
1.594842, 0.3423863, 1.681476, 1, 1, 1, 1, 1,
1.59607, 0.05092021, 1.546201, 1, 1, 1, 1, 1,
1.598718, -0.6956503, 2.939069, 1, 1, 1, 1, 1,
1.612685, -0.5790635, 1.693325, 1, 1, 1, 1, 1,
1.619135, 0.5412329, 2.053019, 1, 1, 1, 1, 1,
1.630169, 1.047476, 0.3518125, 1, 1, 1, 1, 1,
1.635796, -0.5109093, 1.898458, 1, 1, 1, 1, 1,
1.6365, 0.1818551, 1.76343, 1, 1, 1, 1, 1,
1.636625, 0.006001664, 2.194107, 1, 1, 1, 1, 1,
1.637653, 1.084373, -0.5833908, 1, 1, 1, 1, 1,
1.642685, 1.271028, -0.02926852, 1, 1, 1, 1, 1,
1.643729, -0.204156, 2.717516, 1, 1, 1, 1, 1,
1.683994, -1.456281, 1.38075, 1, 1, 1, 1, 1,
1.694223, -1.826617, 1.288353, 1, 1, 1, 1, 1,
1.699571, -0.2142577, 1.464817, 1, 1, 1, 1, 1,
1.71681, -0.924486, 2.814244, 0, 0, 1, 1, 1,
1.733889, 1.77198, 1.710625, 1, 0, 0, 1, 1,
1.737944, -0.4365943, 2.492748, 1, 0, 0, 1, 1,
1.761414, 0.5736261, 1.208632, 1, 0, 0, 1, 1,
1.76187, 1.978079, 0.204204, 1, 0, 0, 1, 1,
1.781389, 0.5870039, 0.9655963, 1, 0, 0, 1, 1,
1.794988, -1.236203, 1.737134, 0, 0, 0, 1, 1,
1.795401, 0.1674343, -0.03840407, 0, 0, 0, 1, 1,
1.81437, 0.2746688, 2.544936, 0, 0, 0, 1, 1,
1.823243, -0.3701543, 1.422611, 0, 0, 0, 1, 1,
1.835451, -0.8634847, 0.6071899, 0, 0, 0, 1, 1,
1.839549, -1.104274, -0.08387163, 0, 0, 0, 1, 1,
1.842111, -0.6585017, 2.793661, 0, 0, 0, 1, 1,
1.860534, -0.7870047, 0.8507136, 1, 1, 1, 1, 1,
1.870111, -1.484241, 3.792534, 1, 1, 1, 1, 1,
1.871472, -1.123092, 1.86958, 1, 1, 1, 1, 1,
1.872831, -2.40851, 3.225091, 1, 1, 1, 1, 1,
1.876842, 0.8178555, 1.404123, 1, 1, 1, 1, 1,
1.886804, -0.877804, 1.560128, 1, 1, 1, 1, 1,
1.89258, -0.9770844, 1.308176, 1, 1, 1, 1, 1,
1.913903, 0.4691286, 4.041573, 1, 1, 1, 1, 1,
1.928462, -1.325789, 3.243634, 1, 1, 1, 1, 1,
1.942699, 2.671093, 0.07624456, 1, 1, 1, 1, 1,
1.946911, 0.4879174, 0.9947738, 1, 1, 1, 1, 1,
1.95467, 0.4588466, 1.226369, 1, 1, 1, 1, 1,
1.969251, 0.4298997, 0.2891044, 1, 1, 1, 1, 1,
1.971921, -0.4402663, 1.028897, 1, 1, 1, 1, 1,
1.977792, -0.2725724, 0.3243019, 1, 1, 1, 1, 1,
1.979254, 1.256873, 0.2664614, 0, 0, 1, 1, 1,
2.002006, 0.002001153, 2.403955, 1, 0, 0, 1, 1,
2.055863, 0.0346182, 1.239103, 1, 0, 0, 1, 1,
2.066638, 0.009669087, 2.32009, 1, 0, 0, 1, 1,
2.177727, -0.2642807, 1.820111, 1, 0, 0, 1, 1,
2.215105, 0.0281997, 1.786855, 1, 0, 0, 1, 1,
2.226568, 0.20314, 0.5559776, 0, 0, 0, 1, 1,
2.244135, 1.370946, -1.038335, 0, 0, 0, 1, 1,
2.348267, 0.2915726, 0.5713158, 0, 0, 0, 1, 1,
2.349495, -1.335486, 2.549286, 0, 0, 0, 1, 1,
2.406308, -0.07542024, 0.7014915, 0, 0, 0, 1, 1,
2.48195, -0.0898626, 0.9582862, 0, 0, 0, 1, 1,
2.513989, 1.901706, 0.8807225, 0, 0, 0, 1, 1,
2.564712, -1.755068, 2.29526, 1, 1, 1, 1, 1,
2.646051, 1.663139, 1.871908, 1, 1, 1, 1, 1,
2.666842, -0.7628196, 1.156603, 1, 1, 1, 1, 1,
2.757421, -0.5488106, 1.614065, 1, 1, 1, 1, 1,
2.765522, -1.012821, 1.538012, 1, 1, 1, 1, 1,
2.779313, 0.2568967, 2.586487, 1, 1, 1, 1, 1,
3.269206, -0.4781678, 0.6550946, 1, 1, 1, 1, 1
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
var radius = 9.701056;
var distance = 34.07455;
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
mvMatrix.translate( 0.2996345, -0.3124638, -0.1211009 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.07455);
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