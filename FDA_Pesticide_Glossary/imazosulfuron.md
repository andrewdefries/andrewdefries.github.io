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
-2.948411, 0.6430451, -1.273856, 1, 0, 0, 1,
-2.74286, -0.1965916, -1.985273, 1, 0.007843138, 0, 1,
-2.708723, 0.4302992, 0.9023277, 1, 0.01176471, 0, 1,
-2.598856, 1.122283, 1.15227, 1, 0.01960784, 0, 1,
-2.53913, 1.591305, -1.42241, 1, 0.02352941, 0, 1,
-2.48521, 2.242003, -0.1125631, 1, 0.03137255, 0, 1,
-2.378842, 2.025804, 0.2587619, 1, 0.03529412, 0, 1,
-2.300428, 1.812539, -3.135024, 1, 0.04313726, 0, 1,
-2.121575, -1.912308, -1.735435, 1, 0.04705882, 0, 1,
-2.099668, -0.3186535, -2.224225, 1, 0.05490196, 0, 1,
-2.061426, -1.181648, -3.352214, 1, 0.05882353, 0, 1,
-2.047611, 1.264074, -1.427145, 1, 0.06666667, 0, 1,
-2.024956, 0.5324481, -1.380487, 1, 0.07058824, 0, 1,
-2.008, -1.674986, -1.617548, 1, 0.07843138, 0, 1,
-1.984198, 0.3100533, -1.266666, 1, 0.08235294, 0, 1,
-1.967348, -1.698139, -3.141786, 1, 0.09019608, 0, 1,
-1.940795, -0.3986264, -4.058737, 1, 0.09411765, 0, 1,
-1.924246, -0.2355626, -1.518592, 1, 0.1019608, 0, 1,
-1.899923, 0.6759632, -0.8084688, 1, 0.1098039, 0, 1,
-1.89212, 0.3767593, -2.318653, 1, 0.1137255, 0, 1,
-1.872486, -0.02176009, -3.710171, 1, 0.1215686, 0, 1,
-1.863743, 0.5170872, -1.110456, 1, 0.1254902, 0, 1,
-1.854551, -0.3305027, -2.44684, 1, 0.1333333, 0, 1,
-1.846714, -0.09017365, -1.289268, 1, 0.1372549, 0, 1,
-1.822854, -1.484058, -1.751215, 1, 0.145098, 0, 1,
-1.821765, -0.3445844, -1.975107, 1, 0.1490196, 0, 1,
-1.774684, 0.1945904, -2.151813, 1, 0.1568628, 0, 1,
-1.741164, -1.081351, -2.255543, 1, 0.1607843, 0, 1,
-1.727553, -0.9254146, -3.514539, 1, 0.1686275, 0, 1,
-1.721877, 0.180798, -1.172382, 1, 0.172549, 0, 1,
-1.721505, 0.1388915, -2.006056, 1, 0.1803922, 0, 1,
-1.715259, -0.5905948, -3.369263, 1, 0.1843137, 0, 1,
-1.66234, 0.09278917, -1.99664, 1, 0.1921569, 0, 1,
-1.657151, 0.8834662, -1.489046, 1, 0.1960784, 0, 1,
-1.647976, 1.409457, -0.6763803, 1, 0.2039216, 0, 1,
-1.638229, 0.8381387, -0.800117, 1, 0.2117647, 0, 1,
-1.597997, -1.62149, -2.642041, 1, 0.2156863, 0, 1,
-1.594344, 1.44504, -0.7133321, 1, 0.2235294, 0, 1,
-1.582208, 1.347604, -1.25952, 1, 0.227451, 0, 1,
-1.567796, 1.014648, -1.530227, 1, 0.2352941, 0, 1,
-1.566082, 1.547652, -0.3531268, 1, 0.2392157, 0, 1,
-1.56441, -0.5727468, -1.18451, 1, 0.2470588, 0, 1,
-1.551167, 0.97286, -3.008783, 1, 0.2509804, 0, 1,
-1.546058, 0.09548315, -0.5321639, 1, 0.2588235, 0, 1,
-1.529381, 0.8858763, 0.1454726, 1, 0.2627451, 0, 1,
-1.520312, 0.06602877, -1.604503, 1, 0.2705882, 0, 1,
-1.519302, -1.425085, -1.771783, 1, 0.2745098, 0, 1,
-1.518524, 0.7242721, -0.4299208, 1, 0.282353, 0, 1,
-1.516977, 0.6249553, -0.05980348, 1, 0.2862745, 0, 1,
-1.515474, 1.085516, -1.828192, 1, 0.2941177, 0, 1,
-1.514884, 0.2137366, 0.1865459, 1, 0.3019608, 0, 1,
-1.502842, -0.7766003, -2.882851, 1, 0.3058824, 0, 1,
-1.500054, -0.9562958, -1.01974, 1, 0.3137255, 0, 1,
-1.499902, 0.8601462, -1.319971, 1, 0.3176471, 0, 1,
-1.479485, -0.6040582, -3.931562, 1, 0.3254902, 0, 1,
-1.472251, 0.9193928, -1.393743, 1, 0.3294118, 0, 1,
-1.47154, -2.335674, -2.31806, 1, 0.3372549, 0, 1,
-1.462808, -0.5242187, -1.346182, 1, 0.3411765, 0, 1,
-1.45223, 0.1344977, -1.386316, 1, 0.3490196, 0, 1,
-1.439109, 1.842345, -0.5110379, 1, 0.3529412, 0, 1,
-1.436697, -1.382759, -1.513938, 1, 0.3607843, 0, 1,
-1.43458, -0.1508893, -1.008113, 1, 0.3647059, 0, 1,
-1.43386, 0.7192118, 0.1916462, 1, 0.372549, 0, 1,
-1.425709, 0.1563466, -1.029285, 1, 0.3764706, 0, 1,
-1.423919, -1.773866, -1.580776, 1, 0.3843137, 0, 1,
-1.418853, -1.021136, -2.985557, 1, 0.3882353, 0, 1,
-1.412143, -0.1895991, -1.855756, 1, 0.3960784, 0, 1,
-1.410894, -0.5592918, -1.288352, 1, 0.4039216, 0, 1,
-1.407603, -0.4296976, -1.969531, 1, 0.4078431, 0, 1,
-1.403297, 0.2536557, -1.472781, 1, 0.4156863, 0, 1,
-1.394506, -2.060402, -1.721953, 1, 0.4196078, 0, 1,
-1.38353, -0.792946, -2.775402, 1, 0.427451, 0, 1,
-1.380464, -0.4246406, -3.554847, 1, 0.4313726, 0, 1,
-1.377503, 0.03226086, -1.578515, 1, 0.4392157, 0, 1,
-1.370881, 0.5161931, -1.426988, 1, 0.4431373, 0, 1,
-1.370367, -0.5502065, -2.877987, 1, 0.4509804, 0, 1,
-1.369717, 1.042298, -1.440674, 1, 0.454902, 0, 1,
-1.363998, -0.9465629, 0.7622232, 1, 0.4627451, 0, 1,
-1.353824, -0.2423868, -2.260376, 1, 0.4666667, 0, 1,
-1.349469, 0.0420317, -1.186911, 1, 0.4745098, 0, 1,
-1.347799, -0.3939551, -1.735983, 1, 0.4784314, 0, 1,
-1.347129, 0.07856649, -1.611971, 1, 0.4862745, 0, 1,
-1.344443, 0.2381139, -1.247493, 1, 0.4901961, 0, 1,
-1.342225, 0.4118852, -0.275261, 1, 0.4980392, 0, 1,
-1.340187, -1.40916, -3.210347, 1, 0.5058824, 0, 1,
-1.312622, -0.9455459, -3.344587, 1, 0.509804, 0, 1,
-1.295507, -1.241781, -3.44653, 1, 0.5176471, 0, 1,
-1.273998, -0.8201293, -3.034521, 1, 0.5215687, 0, 1,
-1.269537, 0.8434573, -0.2194874, 1, 0.5294118, 0, 1,
-1.267586, 0.7117315, -0.8476604, 1, 0.5333334, 0, 1,
-1.259838, -1.819494, -2.493125, 1, 0.5411765, 0, 1,
-1.257307, 2.56242, -0.2240712, 1, 0.5450981, 0, 1,
-1.251463, 0.1611173, -1.697324, 1, 0.5529412, 0, 1,
-1.237634, 0.01087182, -0.7712612, 1, 0.5568628, 0, 1,
-1.214305, 1.481844, -2.963491, 1, 0.5647059, 0, 1,
-1.211591, 2.135565, -0.4255048, 1, 0.5686275, 0, 1,
-1.211517, -0.9060932, -3.662237, 1, 0.5764706, 0, 1,
-1.210072, 0.9379817, -2.180261, 1, 0.5803922, 0, 1,
-1.204497, -1.813249, -1.919688, 1, 0.5882353, 0, 1,
-1.198745, 0.4620659, -1.115655, 1, 0.5921569, 0, 1,
-1.198624, 1.558159, -1.763102, 1, 0.6, 0, 1,
-1.197867, -1.99561, -2.058882, 1, 0.6078432, 0, 1,
-1.195158, -1.978839, -3.73524, 1, 0.6117647, 0, 1,
-1.191469, -1.698406, -2.516852, 1, 0.6196079, 0, 1,
-1.190316, 1.214542, -1.121444, 1, 0.6235294, 0, 1,
-1.181617, 0.3418561, -2.376556, 1, 0.6313726, 0, 1,
-1.181528, 0.04547169, -1.690662, 1, 0.6352941, 0, 1,
-1.152732, -1.230891, -2.138264, 1, 0.6431373, 0, 1,
-1.140928, -0.2978379, -2.530298, 1, 0.6470588, 0, 1,
-1.116148, -0.6662857, -1.481638, 1, 0.654902, 0, 1,
-1.111273, 0.6942943, -1.728751, 1, 0.6588235, 0, 1,
-1.11095, -0.01846351, -1.620343, 1, 0.6666667, 0, 1,
-1.109659, 1.231933, -0.7326961, 1, 0.6705883, 0, 1,
-1.102667, 0.2030988, -0.9152886, 1, 0.6784314, 0, 1,
-1.101651, 0.4337761, -1.364964, 1, 0.682353, 0, 1,
-1.093691, 2.002553, -0.2570907, 1, 0.6901961, 0, 1,
-1.090836, 0.4386501, -0.310648, 1, 0.6941177, 0, 1,
-1.08757, -0.764232, -2.931707, 1, 0.7019608, 0, 1,
-1.087298, 0.8700406, -2.176644, 1, 0.7098039, 0, 1,
-1.086428, 1.076263, -1.292375, 1, 0.7137255, 0, 1,
-1.086041, -1.172036, -2.235173, 1, 0.7215686, 0, 1,
-1.084798, 0.9732651, -0.4849237, 1, 0.7254902, 0, 1,
-1.079195, 0.4916449, -1.915189, 1, 0.7333333, 0, 1,
-1.076543, 0.4175803, 0.7475739, 1, 0.7372549, 0, 1,
-1.073146, -1.46562, 0.5092656, 1, 0.7450981, 0, 1,
-1.072939, -1.263324, -2.431434, 1, 0.7490196, 0, 1,
-1.069851, 0.8926719, -1.539111, 1, 0.7568628, 0, 1,
-1.066765, -0.1277718, -1.715673, 1, 0.7607843, 0, 1,
-1.06659, 0.1092062, -1.18621, 1, 0.7686275, 0, 1,
-1.061043, 1.071412, -0.3973168, 1, 0.772549, 0, 1,
-1.060967, -0.6711417, -4.582607, 1, 0.7803922, 0, 1,
-1.058252, -0.01961885, -1.126046, 1, 0.7843137, 0, 1,
-1.053226, 1.186988, -1.364307, 1, 0.7921569, 0, 1,
-1.053138, -0.4057762, -0.796971, 1, 0.7960784, 0, 1,
-1.044463, -1.083203, -4.16538, 1, 0.8039216, 0, 1,
-1.039458, -1.414524, -2.011425, 1, 0.8117647, 0, 1,
-1.033271, -0.7257233, -0.5222326, 1, 0.8156863, 0, 1,
-1.029097, 1.148942, -1.381311, 1, 0.8235294, 0, 1,
-1.027113, 0.8431469, -0.02688818, 1, 0.827451, 0, 1,
-1.024864, -0.3043501, -1.913664, 1, 0.8352941, 0, 1,
-1.024135, -0.2340069, -1.384652, 1, 0.8392157, 0, 1,
-1.018277, 1.787615, 0.3683778, 1, 0.8470588, 0, 1,
-1.017124, 0.05602127, -1.738174, 1, 0.8509804, 0, 1,
-1.016034, -0.2118917, -0.2362718, 1, 0.8588235, 0, 1,
-1.013668, 0.9249936, 0.5758415, 1, 0.8627451, 0, 1,
-1.012202, 1.577141, -1.353731, 1, 0.8705882, 0, 1,
-1.010271, -1.747759, -4.168206, 1, 0.8745098, 0, 1,
-1.002512, 0.1239241, -1.357503, 1, 0.8823529, 0, 1,
-0.9953928, -1.545568, -3.505999, 1, 0.8862745, 0, 1,
-0.9921775, -0.4561769, -1.447388, 1, 0.8941177, 0, 1,
-0.9911546, -0.3163238, -2.89517, 1, 0.8980392, 0, 1,
-0.9890408, -0.1027107, -2.789896, 1, 0.9058824, 0, 1,
-0.9881238, 0.4330973, -2.073527, 1, 0.9137255, 0, 1,
-0.9803025, 0.2376552, -3.078185, 1, 0.9176471, 0, 1,
-0.9664188, 0.1069041, -1.544342, 1, 0.9254902, 0, 1,
-0.963223, 0.3456393, -0.1550394, 1, 0.9294118, 0, 1,
-0.9582337, -0.2097388, -0.5546063, 1, 0.9372549, 0, 1,
-0.9553942, 0.1661473, -1.124302, 1, 0.9411765, 0, 1,
-0.9549679, -0.6670564, -4.051536, 1, 0.9490196, 0, 1,
-0.9461939, -0.9057262, -2.639187, 1, 0.9529412, 0, 1,
-0.9458139, -0.367674, -3.231228, 1, 0.9607843, 0, 1,
-0.9409693, -0.3204169, -1.53155, 1, 0.9647059, 0, 1,
-0.9356321, -0.2565897, -1.9336, 1, 0.972549, 0, 1,
-0.9270108, -0.1329519, -2.041047, 1, 0.9764706, 0, 1,
-0.9174173, 0.5816589, -0.791542, 1, 0.9843137, 0, 1,
-0.9166955, -0.8040681, -3.225122, 1, 0.9882353, 0, 1,
-0.91317, 0.7634963, -3.077825, 1, 0.9960784, 0, 1,
-0.9130562, 0.1235565, -3.369711, 0.9960784, 1, 0, 1,
-0.9122949, 0.9425924, -0.9932334, 0.9921569, 1, 0, 1,
-0.9118868, 0.4163631, -1.231457, 0.9843137, 1, 0, 1,
-0.911063, 0.2233678, -1.275228, 0.9803922, 1, 0, 1,
-0.909438, -0.7061667, -2.68363, 0.972549, 1, 0, 1,
-0.9084682, -0.9611709, -1.930839, 0.9686275, 1, 0, 1,
-0.9055746, 0.0244641, 0.8517754, 0.9607843, 1, 0, 1,
-0.9048483, 0.1204238, -1.110271, 0.9568627, 1, 0, 1,
-0.8945143, 0.07867229, -3.505301, 0.9490196, 1, 0, 1,
-0.8926402, -0.8779061, -4.516682, 0.945098, 1, 0, 1,
-0.8911054, 2.250345, -1.088002, 0.9372549, 1, 0, 1,
-0.8874389, -2.122034, -2.59094, 0.9333333, 1, 0, 1,
-0.8828669, 0.4607044, 0.7115746, 0.9254902, 1, 0, 1,
-0.8825257, 0.4124314, 0.07955273, 0.9215686, 1, 0, 1,
-0.8798676, 0.9615551, -1.52496, 0.9137255, 1, 0, 1,
-0.8746227, -0.1882938, -2.248663, 0.9098039, 1, 0, 1,
-0.8737947, 1.28017, -0.5680677, 0.9019608, 1, 0, 1,
-0.8691368, 0.3864798, -0.4012122, 0.8941177, 1, 0, 1,
-0.8667681, 0.5298108, -1.544894, 0.8901961, 1, 0, 1,
-0.8629723, 0.08062073, 0.1074218, 0.8823529, 1, 0, 1,
-0.8618941, 1.544607, -2.269948, 0.8784314, 1, 0, 1,
-0.8608478, -0.412878, -0.7689659, 0.8705882, 1, 0, 1,
-0.860368, 0.5797324, -0.03386824, 0.8666667, 1, 0, 1,
-0.8566711, 0.1245361, -1.465201, 0.8588235, 1, 0, 1,
-0.8408751, 0.818666, 0.7359731, 0.854902, 1, 0, 1,
-0.8319893, -1.307775, -2.29271, 0.8470588, 1, 0, 1,
-0.8315998, 2.467488, -0.8692964, 0.8431373, 1, 0, 1,
-0.8288903, 1.18322, -0.7869328, 0.8352941, 1, 0, 1,
-0.8176609, -0.8296632, -0.8703461, 0.8313726, 1, 0, 1,
-0.8150606, 0.7266242, -0.5949506, 0.8235294, 1, 0, 1,
-0.8145344, 1.936133, -2.193489, 0.8196079, 1, 0, 1,
-0.8108324, 0.7652625, -1.486367, 0.8117647, 1, 0, 1,
-0.8097635, 0.2177882, -0.3918818, 0.8078431, 1, 0, 1,
-0.8075478, -1.35197, -1.973284, 0.8, 1, 0, 1,
-0.8063208, -1.356607, -2.946196, 0.7921569, 1, 0, 1,
-0.8061607, 1.458908, -1.351635, 0.7882353, 1, 0, 1,
-0.8059136, -0.1737691, -2.305966, 0.7803922, 1, 0, 1,
-0.8044884, 0.8943978, -0.2892561, 0.7764706, 1, 0, 1,
-0.8024513, -0.9815044, -1.775707, 0.7686275, 1, 0, 1,
-0.7990017, 1.687461, 1.153372, 0.7647059, 1, 0, 1,
-0.7978068, -1.75359, -1.090457, 0.7568628, 1, 0, 1,
-0.797017, -1.140224, -1.237681, 0.7529412, 1, 0, 1,
-0.7935783, 1.081679, 0.9950622, 0.7450981, 1, 0, 1,
-0.7917042, 0.09049308, -1.778488, 0.7411765, 1, 0, 1,
-0.7909135, 0.6611103, 0.3384064, 0.7333333, 1, 0, 1,
-0.7865011, 0.6516423, 0.03321223, 0.7294118, 1, 0, 1,
-0.7833894, 0.6381364, -1.797381, 0.7215686, 1, 0, 1,
-0.781171, 0.07618561, -2.982092, 0.7176471, 1, 0, 1,
-0.7794992, 1.060375, -0.6957021, 0.7098039, 1, 0, 1,
-0.7785158, -1.298108, -2.677224, 0.7058824, 1, 0, 1,
-0.7772502, -0.9341357, -4.853418, 0.6980392, 1, 0, 1,
-0.773234, 0.6698665, -0.5656129, 0.6901961, 1, 0, 1,
-0.7611086, -0.650728, -1.649602, 0.6862745, 1, 0, 1,
-0.752189, -0.3927176, -3.655054, 0.6784314, 1, 0, 1,
-0.7521269, -0.03267335, -0.7103168, 0.6745098, 1, 0, 1,
-0.7515311, -0.3491115, -2.792457, 0.6666667, 1, 0, 1,
-0.7506992, 0.1706675, -1.652014, 0.6627451, 1, 0, 1,
-0.7462088, -0.863344, -3.257414, 0.654902, 1, 0, 1,
-0.7460903, 2.62302, 2.499244, 0.6509804, 1, 0, 1,
-0.7460144, 1.030383, 0.6593959, 0.6431373, 1, 0, 1,
-0.7414591, -0.4764514, -0.6008912, 0.6392157, 1, 0, 1,
-0.7401599, -0.4553158, -4.522506, 0.6313726, 1, 0, 1,
-0.7375798, -0.05166621, -4.047667, 0.627451, 1, 0, 1,
-0.7367279, 2.747859, 2.072747, 0.6196079, 1, 0, 1,
-0.736716, 0.7330993, -0.5082527, 0.6156863, 1, 0, 1,
-0.7358607, 1.446452, -1.716312, 0.6078432, 1, 0, 1,
-0.7350251, 3.145245, -1.114463, 0.6039216, 1, 0, 1,
-0.7339516, 1.303356, -0.8955531, 0.5960785, 1, 0, 1,
-0.7281215, -0.1339167, -0.4263014, 0.5882353, 1, 0, 1,
-0.721542, 1.074034, 1.581078, 0.5843138, 1, 0, 1,
-0.7172812, -0.9269127, -4.564534, 0.5764706, 1, 0, 1,
-0.7096342, -0.6562846, -0.8890698, 0.572549, 1, 0, 1,
-0.70136, 0.3184094, 0.03702856, 0.5647059, 1, 0, 1,
-0.6945144, -0.09862145, -2.940885, 0.5607843, 1, 0, 1,
-0.6904861, 0.08363037, -0.5911423, 0.5529412, 1, 0, 1,
-0.6869828, -1.25427, -2.682683, 0.5490196, 1, 0, 1,
-0.6810831, -0.09491014, -1.224184, 0.5411765, 1, 0, 1,
-0.6764292, -0.999738, -3.905576, 0.5372549, 1, 0, 1,
-0.6758446, -0.2884762, -3.099177, 0.5294118, 1, 0, 1,
-0.6746761, 0.5675263, -1.970319, 0.5254902, 1, 0, 1,
-0.6670221, -0.9524608, -3.036536, 0.5176471, 1, 0, 1,
-0.6659611, -1.877262, -2.730429, 0.5137255, 1, 0, 1,
-0.6576251, 0.09842201, -2.199837, 0.5058824, 1, 0, 1,
-0.6560525, 0.8620155, -1.755507, 0.5019608, 1, 0, 1,
-0.6552925, -0.4514376, -0.8720187, 0.4941176, 1, 0, 1,
-0.6491402, -0.9506304, -1.85138, 0.4862745, 1, 0, 1,
-0.6422928, -0.3531613, -2.477675, 0.4823529, 1, 0, 1,
-0.6386237, 0.88146, -2.491158, 0.4745098, 1, 0, 1,
-0.6350146, 0.91405, -1.610641, 0.4705882, 1, 0, 1,
-0.6334961, -0.09196272, -2.790956, 0.4627451, 1, 0, 1,
-0.630621, 0.4145475, -2.396943, 0.4588235, 1, 0, 1,
-0.6273677, 0.270519, -1.443534, 0.4509804, 1, 0, 1,
-0.6273488, 0.7809437, -1.0078, 0.4470588, 1, 0, 1,
-0.6227379, 0.003131499, -1.626313, 0.4392157, 1, 0, 1,
-0.6224708, -1.418693, -1.853875, 0.4352941, 1, 0, 1,
-0.6219994, 0.8160141, 0.3931825, 0.427451, 1, 0, 1,
-0.6198876, 0.3272226, -0.8843955, 0.4235294, 1, 0, 1,
-0.615811, 2.198677, 0.5726203, 0.4156863, 1, 0, 1,
-0.6128801, 0.9712707, -1.000836, 0.4117647, 1, 0, 1,
-0.6113168, 0.879427, 0.3395312, 0.4039216, 1, 0, 1,
-0.610715, -1.424331, -2.399297, 0.3960784, 1, 0, 1,
-0.6094991, -0.7890314, -2.918843, 0.3921569, 1, 0, 1,
-0.6051646, -2.598899, -4.210018, 0.3843137, 1, 0, 1,
-0.6038608, 2.567104, -0.8798332, 0.3803922, 1, 0, 1,
-0.6020426, 1.186454, 0.2972006, 0.372549, 1, 0, 1,
-0.6006027, 0.05606214, -1.679401, 0.3686275, 1, 0, 1,
-0.5963668, 1.71546, -1.498261, 0.3607843, 1, 0, 1,
-0.5934405, -0.07008698, -1.542337, 0.3568628, 1, 0, 1,
-0.582432, -1.167155, -4.722795, 0.3490196, 1, 0, 1,
-0.5822534, -0.4939858, -1.437832, 0.345098, 1, 0, 1,
-0.5795246, 1.622493, 0.8368968, 0.3372549, 1, 0, 1,
-0.5789343, -1.602528, -5.133277, 0.3333333, 1, 0, 1,
-0.5765254, 1.081902, 1.016841, 0.3254902, 1, 0, 1,
-0.5754502, -1.144113, -2.722254, 0.3215686, 1, 0, 1,
-0.57109, -0.944625, -3.002636, 0.3137255, 1, 0, 1,
-0.5699666, -0.2609359, -4.643888, 0.3098039, 1, 0, 1,
-0.5691554, 2.658495, -0.106323, 0.3019608, 1, 0, 1,
-0.5653734, 0.9176902, 0.5216268, 0.2941177, 1, 0, 1,
-0.5574088, -1.372922, -3.937135, 0.2901961, 1, 0, 1,
-0.5549439, 1.153814, 0.8715028, 0.282353, 1, 0, 1,
-0.5533664, 0.253153, -0.7434925, 0.2784314, 1, 0, 1,
-0.5504579, -0.7076952, -3.115475, 0.2705882, 1, 0, 1,
-0.5496734, -1.279891, -2.846804, 0.2666667, 1, 0, 1,
-0.5494847, 0.9413089, -2.000721, 0.2588235, 1, 0, 1,
-0.5469763, -0.3432331, -2.214317, 0.254902, 1, 0, 1,
-0.5469599, -0.7053245, -0.325247, 0.2470588, 1, 0, 1,
-0.5424486, 0.4501904, -0.9663459, 0.2431373, 1, 0, 1,
-0.5423819, 0.09284897, -0.5747005, 0.2352941, 1, 0, 1,
-0.5406995, -0.4119697, -2.897576, 0.2313726, 1, 0, 1,
-0.5378926, 1.458021, 0.8380906, 0.2235294, 1, 0, 1,
-0.5370319, 1.58741, 0.5559824, 0.2196078, 1, 0, 1,
-0.5359865, -0.9520928, -2.799477, 0.2117647, 1, 0, 1,
-0.5352546, 0.4775077, -2.538501, 0.2078431, 1, 0, 1,
-0.5341781, -0.6414518, -2.931185, 0.2, 1, 0, 1,
-0.5268487, 0.06361628, -1.046407, 0.1921569, 1, 0, 1,
-0.5244225, 1.54387, -0.6087191, 0.1882353, 1, 0, 1,
-0.5242217, -1.405486, -3.235804, 0.1803922, 1, 0, 1,
-0.5202729, 0.4920779, -1.831415, 0.1764706, 1, 0, 1,
-0.5194339, 1.570963, -0.9411401, 0.1686275, 1, 0, 1,
-0.5174613, -1.401151, -2.407464, 0.1647059, 1, 0, 1,
-0.5126788, -0.05276579, -2.374704, 0.1568628, 1, 0, 1,
-0.5099813, 1.101063, -0.4914215, 0.1529412, 1, 0, 1,
-0.5087147, 0.3564322, 0.7378585, 0.145098, 1, 0, 1,
-0.5077342, 0.126589, -1.232785, 0.1411765, 1, 0, 1,
-0.5073705, -0.1022521, -3.431928, 0.1333333, 1, 0, 1,
-0.5057534, -0.1889904, -1.353713, 0.1294118, 1, 0, 1,
-0.505724, 0.2739453, -0.976945, 0.1215686, 1, 0, 1,
-0.5035812, 1.811621, -0.5966177, 0.1176471, 1, 0, 1,
-0.5014201, 0.6646264, -1.155041, 0.1098039, 1, 0, 1,
-0.4946685, -0.3402383, -0.3607734, 0.1058824, 1, 0, 1,
-0.4927307, -0.5948085, -2.579689, 0.09803922, 1, 0, 1,
-0.4889084, 1.146055, -2.293557, 0.09019608, 1, 0, 1,
-0.4829445, 0.9012679, -1.395229, 0.08627451, 1, 0, 1,
-0.4779704, 2.151957, -0.08251931, 0.07843138, 1, 0, 1,
-0.4740434, -0.1924203, -1.493812, 0.07450981, 1, 0, 1,
-0.4728518, -0.9070735, -1.943878, 0.06666667, 1, 0, 1,
-0.4723459, 0.1946364, -0.4885899, 0.0627451, 1, 0, 1,
-0.4649079, -1.974624, -3.719222, 0.05490196, 1, 0, 1,
-0.4626024, 1.842994, -0.3619851, 0.05098039, 1, 0, 1,
-0.4605799, -0.2968769, -1.326491, 0.04313726, 1, 0, 1,
-0.456151, 0.5462176, -2.464022, 0.03921569, 1, 0, 1,
-0.455842, 0.2837134, -0.7330797, 0.03137255, 1, 0, 1,
-0.4524658, 1.471373, 0.1824103, 0.02745098, 1, 0, 1,
-0.4438447, -0.2108608, -1.693457, 0.01960784, 1, 0, 1,
-0.4419938, -0.2920034, -3.155178, 0.01568628, 1, 0, 1,
-0.4419272, -1.839273, -3.349773, 0.007843138, 1, 0, 1,
-0.4415727, -0.006385902, -1.448177, 0.003921569, 1, 0, 1,
-0.4412768, -0.9141328, -2.6401, 0, 1, 0.003921569, 1,
-0.4404153, 0.7751181, 0.1752416, 0, 1, 0.01176471, 1,
-0.4359501, 0.9883167, 0.3215996, 0, 1, 0.01568628, 1,
-0.4342697, 1.566438, -0.8603013, 0, 1, 0.02352941, 1,
-0.4338557, 0.9393976, 0.2938927, 0, 1, 0.02745098, 1,
-0.4336385, -0.4823929, -0.5855628, 0, 1, 0.03529412, 1,
-0.4313795, 1.793818, 1.494961, 0, 1, 0.03921569, 1,
-0.4313544, -1.157907, -4.402887, 0, 1, 0.04705882, 1,
-0.4296384, 2.002964, 1.104734, 0, 1, 0.05098039, 1,
-0.4260479, 0.4377624, -0.7970514, 0, 1, 0.05882353, 1,
-0.4250953, 0.7495799, 0.00765704, 0, 1, 0.0627451, 1,
-0.4249185, -0.1827061, -2.072911, 0, 1, 0.07058824, 1,
-0.4222707, -0.3034323, -3.414075, 0, 1, 0.07450981, 1,
-0.4187644, -0.782199, -3.186146, 0, 1, 0.08235294, 1,
-0.4159178, -1.056672, -2.685969, 0, 1, 0.08627451, 1,
-0.4140041, -1.101323, -4.933753, 0, 1, 0.09411765, 1,
-0.4116075, 0.2902888, -1.342051, 0, 1, 0.1019608, 1,
-0.4090119, 0.4657287, -0.0213245, 0, 1, 0.1058824, 1,
-0.4084686, 0.4942969, 1.083282, 0, 1, 0.1137255, 1,
-0.4022422, 2.003509, -0.6960767, 0, 1, 0.1176471, 1,
-0.399435, 0.5752968, -1.940634, 0, 1, 0.1254902, 1,
-0.3980335, -0.117068, -2.101127, 0, 1, 0.1294118, 1,
-0.3980166, -0.04818392, -2.039996, 0, 1, 0.1372549, 1,
-0.3930952, 0.8912855, 0.8899779, 0, 1, 0.1411765, 1,
-0.3877316, -0.2246485, -1.838607, 0, 1, 0.1490196, 1,
-0.3875565, 0.3096264, -0.5122738, 0, 1, 0.1529412, 1,
-0.3873041, -0.3829165, -2.931638, 0, 1, 0.1607843, 1,
-0.3869628, 0.6807989, 0.1863589, 0, 1, 0.1647059, 1,
-0.3836104, -1.895404, -3.357563, 0, 1, 0.172549, 1,
-0.3824554, 0.5088786, -2.301123, 0, 1, 0.1764706, 1,
-0.3769419, 0.6510015, 0.8202029, 0, 1, 0.1843137, 1,
-0.3751581, -1.227125, -1.708138, 0, 1, 0.1882353, 1,
-0.3743966, 0.003369881, -3.643125, 0, 1, 0.1960784, 1,
-0.3739272, -0.313619, -4.022594, 0, 1, 0.2039216, 1,
-0.3697375, -0.5979031, -3.7872, 0, 1, 0.2078431, 1,
-0.3695952, 2.798036, 0.1753773, 0, 1, 0.2156863, 1,
-0.3667812, 0.240226, -1.101896, 0, 1, 0.2196078, 1,
-0.366376, 0.09303404, -1.829856, 0, 1, 0.227451, 1,
-0.3566382, 2.454743, -1.170876, 0, 1, 0.2313726, 1,
-0.3553427, 1.953504, 1.401532, 0, 1, 0.2392157, 1,
-0.3539375, 2.593973, 0.1105878, 0, 1, 0.2431373, 1,
-0.3526216, 0.6112884, 1.029606, 0, 1, 0.2509804, 1,
-0.3515582, -0.8708426, -2.699324, 0, 1, 0.254902, 1,
-0.3503776, 2.137854, 0.9837817, 0, 1, 0.2627451, 1,
-0.3450555, -0.1838631, -1.39695, 0, 1, 0.2666667, 1,
-0.343757, 1.117516, -0.3706123, 0, 1, 0.2745098, 1,
-0.340698, -0.7922649, -1.005235, 0, 1, 0.2784314, 1,
-0.3367715, -0.8551004, -2.442076, 0, 1, 0.2862745, 1,
-0.336197, -0.0002963083, -1.437778, 0, 1, 0.2901961, 1,
-0.3348181, -0.3550792, -2.183716, 0, 1, 0.2980392, 1,
-0.3306292, -1.161255, -2.017946, 0, 1, 0.3058824, 1,
-0.3286748, 0.8607331, 0.5204816, 0, 1, 0.3098039, 1,
-0.3261054, -2.060742, -0.5464579, 0, 1, 0.3176471, 1,
-0.3250096, -0.2887015, -0.8676071, 0, 1, 0.3215686, 1,
-0.323454, -0.4760807, -3.21393, 0, 1, 0.3294118, 1,
-0.3205916, -0.2965108, -3.423013, 0, 1, 0.3333333, 1,
-0.3155247, -1.185033, -3.593421, 0, 1, 0.3411765, 1,
-0.3147877, -0.1371966, -4.923351, 0, 1, 0.345098, 1,
-0.3089891, 0.06614798, -1.679228, 0, 1, 0.3529412, 1,
-0.3086325, 0.7382302, -0.5706359, 0, 1, 0.3568628, 1,
-0.3053751, -1.400877, -4.488981, 0, 1, 0.3647059, 1,
-0.3051425, 0.9131298, -0.4834021, 0, 1, 0.3686275, 1,
-0.303881, 0.191109, -3.106587, 0, 1, 0.3764706, 1,
-0.3025234, 0.3154918, 1.226358, 0, 1, 0.3803922, 1,
-0.3003994, 0.1579791, -1.193408, 0, 1, 0.3882353, 1,
-0.2986678, -0.4904268, -2.474435, 0, 1, 0.3921569, 1,
-0.2950693, 1.14733, -0.4181508, 0, 1, 0.4, 1,
-0.2863299, 0.9884974, -0.3693972, 0, 1, 0.4078431, 1,
-0.2847238, -0.7464615, -1.543668, 0, 1, 0.4117647, 1,
-0.2817636, 1.66359, -0.3902352, 0, 1, 0.4196078, 1,
-0.2768047, 1.352992, 1.041169, 0, 1, 0.4235294, 1,
-0.274008, -0.6786914, -2.633158, 0, 1, 0.4313726, 1,
-0.2735626, -0.1080951, -1.675996, 0, 1, 0.4352941, 1,
-0.2723723, 0.5206633, -1.2327, 0, 1, 0.4431373, 1,
-0.2693633, 0.3075012, -0.2939908, 0, 1, 0.4470588, 1,
-0.2673008, -0.4400533, -1.957771, 0, 1, 0.454902, 1,
-0.2643068, 1.163379, 0.3428921, 0, 1, 0.4588235, 1,
-0.2610384, -0.4564876, -3.345575, 0, 1, 0.4666667, 1,
-0.2591209, 0.0273751, -0.5983675, 0, 1, 0.4705882, 1,
-0.2565924, 0.6759344, 0.02922891, 0, 1, 0.4784314, 1,
-0.2559026, -1.110374, -4.562046, 0, 1, 0.4823529, 1,
-0.2531997, 1.673299, 0.9130353, 0, 1, 0.4901961, 1,
-0.2526946, -0.05172971, -0.7944875, 0, 1, 0.4941176, 1,
-0.2523305, -0.2441917, -3.133019, 0, 1, 0.5019608, 1,
-0.2388808, -0.2686294, -1.899255, 0, 1, 0.509804, 1,
-0.2372015, 0.830955, -1.148393, 0, 1, 0.5137255, 1,
-0.2343742, 0.2824137, -0.4291019, 0, 1, 0.5215687, 1,
-0.231353, 1.050304, -0.8665925, 0, 1, 0.5254902, 1,
-0.2313088, -1.334931, -1.725677, 0, 1, 0.5333334, 1,
-0.2297723, -1.221303, -3.644944, 0, 1, 0.5372549, 1,
-0.2280072, 0.7001464, 0.9564939, 0, 1, 0.5450981, 1,
-0.2247618, -1.163784, -4.66451, 0, 1, 0.5490196, 1,
-0.2166269, 1.931456, -0.08524485, 0, 1, 0.5568628, 1,
-0.2092834, -0.2322211, -3.172061, 0, 1, 0.5607843, 1,
-0.2007418, -1.959971, -0.6260478, 0, 1, 0.5686275, 1,
-0.1987544, -0.9791738, -2.900374, 0, 1, 0.572549, 1,
-0.1965507, 0.4488078, 0.868104, 0, 1, 0.5803922, 1,
-0.1944497, -1.396531, -3.430286, 0, 1, 0.5843138, 1,
-0.1932956, 0.8120498, -0.3964738, 0, 1, 0.5921569, 1,
-0.1931237, 0.4309781, -1.370907, 0, 1, 0.5960785, 1,
-0.1892151, -2.063379, -2.661328, 0, 1, 0.6039216, 1,
-0.1846769, 0.1675778, -1.271892, 0, 1, 0.6117647, 1,
-0.1820112, 1.253272, -0.5465681, 0, 1, 0.6156863, 1,
-0.1791885, 1.135874, 2.088248, 0, 1, 0.6235294, 1,
-0.1780331, 0.1465624, -0.4933512, 0, 1, 0.627451, 1,
-0.1771887, -1.138478, -3.101093, 0, 1, 0.6352941, 1,
-0.1714387, 0.01300115, 0.6403932, 0, 1, 0.6392157, 1,
-0.1695181, 1.2603, 1.739917, 0, 1, 0.6470588, 1,
-0.1688482, 0.8100227, -1.956159, 0, 1, 0.6509804, 1,
-0.1631424, -2.110915, -3.440757, 0, 1, 0.6588235, 1,
-0.1628689, 0.1696822, -0.8139009, 0, 1, 0.6627451, 1,
-0.1628236, -1.902414, -4.225121, 0, 1, 0.6705883, 1,
-0.1624758, -0.8738051, -2.772578, 0, 1, 0.6745098, 1,
-0.1618985, -1.161467, -2.66245, 0, 1, 0.682353, 1,
-0.1606716, -0.3582041, -4.590479, 0, 1, 0.6862745, 1,
-0.1575363, 0.9526211, 1.722343, 0, 1, 0.6941177, 1,
-0.1515042, 1.415317, -0.3023172, 0, 1, 0.7019608, 1,
-0.1504206, -1.431207, -3.069044, 0, 1, 0.7058824, 1,
-0.1445822, -0.2336075, -2.615398, 0, 1, 0.7137255, 1,
-0.1432365, -1.452011, -2.434104, 0, 1, 0.7176471, 1,
-0.1368944, -0.04086783, -1.172328, 0, 1, 0.7254902, 1,
-0.1352192, -0.9271368, -2.107234, 0, 1, 0.7294118, 1,
-0.1351342, 1.826512, 2.076826, 0, 1, 0.7372549, 1,
-0.1329074, -0.3518839, -2.915731, 0, 1, 0.7411765, 1,
-0.131671, -0.5645404, -1.650885, 0, 1, 0.7490196, 1,
-0.1296036, -0.8388787, -2.999776, 0, 1, 0.7529412, 1,
-0.127831, -1.545165, -1.624807, 0, 1, 0.7607843, 1,
-0.1276854, 1.530804, -0.8458065, 0, 1, 0.7647059, 1,
-0.1254932, -0.2677161, -2.175053, 0, 1, 0.772549, 1,
-0.1251647, 0.2578031, -1.087866, 0, 1, 0.7764706, 1,
-0.123706, 0.6141358, 0.8872094, 0, 1, 0.7843137, 1,
-0.1201209, 1.612419, -1.862017, 0, 1, 0.7882353, 1,
-0.118401, 1.788129, -1.420045, 0, 1, 0.7960784, 1,
-0.1183945, 0.8652627, 1.082379, 0, 1, 0.8039216, 1,
-0.118139, -0.2625202, -3.68774, 0, 1, 0.8078431, 1,
-0.1155699, 0.5611846, 0.1232943, 0, 1, 0.8156863, 1,
-0.1142491, -0.8366848, -1.892907, 0, 1, 0.8196079, 1,
-0.1083405, 3.258849, 0.3493787, 0, 1, 0.827451, 1,
-0.1072347, -0.1180161, -1.184035, 0, 1, 0.8313726, 1,
-0.09850194, 0.5974195, 0.707114, 0, 1, 0.8392157, 1,
-0.09790316, -1.128141, -1.696202, 0, 1, 0.8431373, 1,
-0.09615634, -1.978072, -2.686543, 0, 1, 0.8509804, 1,
-0.09407344, 2.218799, -0.8637508, 0, 1, 0.854902, 1,
-0.09217382, 1.225927, -1.114196, 0, 1, 0.8627451, 1,
-0.09061744, 0.8701435, 0.3176756, 0, 1, 0.8666667, 1,
-0.08778527, 1.93403, 0.05003456, 0, 1, 0.8745098, 1,
-0.08387206, -0.9184913, -3.326668, 0, 1, 0.8784314, 1,
-0.07644144, 0.7800704, -0.08751294, 0, 1, 0.8862745, 1,
-0.07514235, 0.5410699, 0.6459286, 0, 1, 0.8901961, 1,
-0.06423751, 1.234105, -0.938574, 0, 1, 0.8980392, 1,
-0.06020018, 0.2040953, 1.327306, 0, 1, 0.9058824, 1,
-0.05973325, -0.6448717, -2.240311, 0, 1, 0.9098039, 1,
-0.05880965, 0.05350658, -2.147626, 0, 1, 0.9176471, 1,
-0.05752508, -0.582746, -1.731559, 0, 1, 0.9215686, 1,
-0.05542802, -1.819309, -3.056402, 0, 1, 0.9294118, 1,
-0.0530692, 0.7329944, 0.1138241, 0, 1, 0.9333333, 1,
-0.05078258, -1.160406, -5.152235, 0, 1, 0.9411765, 1,
-0.05034385, 0.3304547, -0.5853606, 0, 1, 0.945098, 1,
-0.05033934, -2.528255, -4.550358, 0, 1, 0.9529412, 1,
-0.04573812, -0.6311008, -1.544046, 0, 1, 0.9568627, 1,
-0.04473698, 1.201831, -0.2268572, 0, 1, 0.9647059, 1,
-0.03917931, -0.5952453, -2.192142, 0, 1, 0.9686275, 1,
-0.03753606, 0.775876, 0.3824462, 0, 1, 0.9764706, 1,
-0.03573905, -0.9090126, -2.775655, 0, 1, 0.9803922, 1,
-0.03472427, -0.785648, -3.89102, 0, 1, 0.9882353, 1,
-0.033973, 0.03515136, -0.9308383, 0, 1, 0.9921569, 1,
-0.03090285, 1.840624, -0.2113757, 0, 1, 1, 1,
-0.03029697, -0.8622995, -4.468088, 0, 0.9921569, 1, 1,
-0.029275, 0.39288, 1.550019, 0, 0.9882353, 1, 1,
-0.02243491, -2.444881, -2.043769, 0, 0.9803922, 1, 1,
-0.01953509, 0.2117037, -1.422116, 0, 0.9764706, 1, 1,
-0.01547379, 0.1959389, -0.2991941, 0, 0.9686275, 1, 1,
-0.0133785, 0.5608991, -0.9248409, 0, 0.9647059, 1, 1,
-0.01245308, -0.6358224, -2.834858, 0, 0.9568627, 1, 1,
-0.01175069, -0.2506023, -3.886015, 0, 0.9529412, 1, 1,
-0.01162874, 0.9236519, -0.08102253, 0, 0.945098, 1, 1,
-0.008399154, 0.2915021, -1.755616, 0, 0.9411765, 1, 1,
-0.003592564, -0.2200744, -4.456467, 0, 0.9333333, 1, 1,
0.001784984, 0.4376583, -1.482558, 0, 0.9294118, 1, 1,
0.004701118, 0.1595535, -0.7838033, 0, 0.9215686, 1, 1,
0.00786497, -0.1001817, 3.164631, 0, 0.9176471, 1, 1,
0.008320051, -0.1106517, 3.230582, 0, 0.9098039, 1, 1,
0.01094117, 1.164168, 1.339965, 0, 0.9058824, 1, 1,
0.01380339, -0.7830189, 3.516763, 0, 0.8980392, 1, 1,
0.0141637, 0.2496781, -1.802815, 0, 0.8901961, 1, 1,
0.01454238, 0.6382324, 0.7882305, 0, 0.8862745, 1, 1,
0.02183697, 0.8318683, 1.196137, 0, 0.8784314, 1, 1,
0.02404613, 0.3583312, 0.2041655, 0, 0.8745098, 1, 1,
0.02582229, 0.5420067, 0.8709716, 0, 0.8666667, 1, 1,
0.02593417, 0.8890107, 0.7900196, 0, 0.8627451, 1, 1,
0.03273764, -0.03775696, 2.024295, 0, 0.854902, 1, 1,
0.03573725, -0.2522696, 4.12403, 0, 0.8509804, 1, 1,
0.03590998, 0.6610494, 0.7944585, 0, 0.8431373, 1, 1,
0.03616324, -1.010756, 3.241363, 0, 0.8392157, 1, 1,
0.03759144, 0.859522, 1.057817, 0, 0.8313726, 1, 1,
0.03823317, 0.04528397, 1.986268, 0, 0.827451, 1, 1,
0.03838753, -0.1029632, 2.714519, 0, 0.8196079, 1, 1,
0.03892809, 0.4515426, -1.200539, 0, 0.8156863, 1, 1,
0.04555647, -0.05258854, 1.209415, 0, 0.8078431, 1, 1,
0.04610559, -0.116965, 2.878357, 0, 0.8039216, 1, 1,
0.04788401, 0.2719081, -0.5563179, 0, 0.7960784, 1, 1,
0.04801287, 2.159915, 0.361883, 0, 0.7882353, 1, 1,
0.05046904, 0.1318513, -0.5001101, 0, 0.7843137, 1, 1,
0.05055355, -0.9016982, 2.89374, 0, 0.7764706, 1, 1,
0.05117852, -0.4198763, 1.665524, 0, 0.772549, 1, 1,
0.05260385, -0.7250732, 2.561558, 0, 0.7647059, 1, 1,
0.05433144, -1.359707, 1.777644, 0, 0.7607843, 1, 1,
0.05524242, 0.009401436, 0.4868132, 0, 0.7529412, 1, 1,
0.05617548, -0.4596357, 2.441044, 0, 0.7490196, 1, 1,
0.05769736, 0.8507296, -0.07591783, 0, 0.7411765, 1, 1,
0.06435731, 0.4998237, -0.298546, 0, 0.7372549, 1, 1,
0.07130316, -0.07618653, 2.870557, 0, 0.7294118, 1, 1,
0.07302313, 0.295892, 0.05789725, 0, 0.7254902, 1, 1,
0.07341067, -0.7533922, 2.683717, 0, 0.7176471, 1, 1,
0.07433875, -0.6355714, 1.112358, 0, 0.7137255, 1, 1,
0.07669932, -0.02552044, 0.5716914, 0, 0.7058824, 1, 1,
0.07691094, -0.9294181, 5.117071, 0, 0.6980392, 1, 1,
0.07818209, 0.3611179, 1.282853, 0, 0.6941177, 1, 1,
0.07960255, -0.9955704, 4.187161, 0, 0.6862745, 1, 1,
0.08114865, -1.91318, 4.372579, 0, 0.682353, 1, 1,
0.08218754, -1.111584, 0.8962251, 0, 0.6745098, 1, 1,
0.08535706, -0.9559132, 3.223791, 0, 0.6705883, 1, 1,
0.09132128, 0.2810361, 0.8631276, 0, 0.6627451, 1, 1,
0.09270976, -0.02779165, 2.96675, 0, 0.6588235, 1, 1,
0.09346992, 0.382356, 0.6226534, 0, 0.6509804, 1, 1,
0.09359208, 1.726005, -0.4112177, 0, 0.6470588, 1, 1,
0.09833714, 0.06450663, 2.542975, 0, 0.6392157, 1, 1,
0.1009305, 0.6330604, 0.2493217, 0, 0.6352941, 1, 1,
0.1009768, 0.7469215, -0.2378032, 0, 0.627451, 1, 1,
0.1023144, -1.38816, 1.121076, 0, 0.6235294, 1, 1,
0.1048837, 0.02712386, 2.587366, 0, 0.6156863, 1, 1,
0.105545, -0.02356382, 3.056726, 0, 0.6117647, 1, 1,
0.1058635, -1.270012, 2.525868, 0, 0.6039216, 1, 1,
0.1077135, -0.6832527, 1.915483, 0, 0.5960785, 1, 1,
0.1094974, -0.2542253, 2.102177, 0, 0.5921569, 1, 1,
0.1171333, -0.3190425, 2.312347, 0, 0.5843138, 1, 1,
0.1178119, -0.4973367, 2.507889, 0, 0.5803922, 1, 1,
0.1186243, -0.3165207, 2.054952, 0, 0.572549, 1, 1,
0.1198799, -0.3550267, 1.053316, 0, 0.5686275, 1, 1,
0.1259619, 0.3940781, 2.301985, 0, 0.5607843, 1, 1,
0.1306603, 1.938544, -1.479565, 0, 0.5568628, 1, 1,
0.1347041, -1.868088, 1.299952, 0, 0.5490196, 1, 1,
0.1388437, -1.01792, 2.27798, 0, 0.5450981, 1, 1,
0.1390638, -1.25601, 2.426661, 0, 0.5372549, 1, 1,
0.1438202, -0.02656659, 1.464708, 0, 0.5333334, 1, 1,
0.1452306, -0.2306031, 2.566469, 0, 0.5254902, 1, 1,
0.1463505, -0.02366128, 0.807723, 0, 0.5215687, 1, 1,
0.1467121, 0.01441673, 2.499306, 0, 0.5137255, 1, 1,
0.148617, 0.3450793, 0.03390463, 0, 0.509804, 1, 1,
0.1492667, -0.587531, 3.461787, 0, 0.5019608, 1, 1,
0.1544352, -0.1995956, 2.48728, 0, 0.4941176, 1, 1,
0.1561243, 1.126711, -1.474521, 0, 0.4901961, 1, 1,
0.1587752, 0.01049243, 1.498736, 0, 0.4823529, 1, 1,
0.1608545, 1.175451, -0.6193426, 0, 0.4784314, 1, 1,
0.1618306, -0.7642124, 3.498677, 0, 0.4705882, 1, 1,
0.163312, -0.2480346, 1.770914, 0, 0.4666667, 1, 1,
0.1638079, -0.466601, 2.194186, 0, 0.4588235, 1, 1,
0.1684157, -1.028183, 0.9951911, 0, 0.454902, 1, 1,
0.1740105, -0.1548051, 1.321237, 0, 0.4470588, 1, 1,
0.1777612, 0.4342379, 1.173283, 0, 0.4431373, 1, 1,
0.1781776, -2.428773, 1.169669, 0, 0.4352941, 1, 1,
0.1786835, -0.525048, 4.079598, 0, 0.4313726, 1, 1,
0.1803995, -0.4229604, 2.882042, 0, 0.4235294, 1, 1,
0.1819431, -0.1840105, 1.464954, 0, 0.4196078, 1, 1,
0.1855086, -1.71607, 3.776731, 0, 0.4117647, 1, 1,
0.1856056, -1.825303, 2.974922, 0, 0.4078431, 1, 1,
0.1862603, 0.6754444, 0.5832199, 0, 0.4, 1, 1,
0.1879634, 1.991232, 0.2228677, 0, 0.3921569, 1, 1,
0.1892683, -0.2462725, 2.312169, 0, 0.3882353, 1, 1,
0.1980951, -1.178968, 2.345308, 0, 0.3803922, 1, 1,
0.1997696, 1.077259, -0.3014388, 0, 0.3764706, 1, 1,
0.1998617, 0.06467336, 1.001504, 0, 0.3686275, 1, 1,
0.2000051, -0.4930338, 4.006699, 0, 0.3647059, 1, 1,
0.2032106, -0.5748349, 1.107666, 0, 0.3568628, 1, 1,
0.2100014, -1.327462, 2.737825, 0, 0.3529412, 1, 1,
0.2113575, 1.227629, 0.04746493, 0, 0.345098, 1, 1,
0.2119343, 1.02138, -1.192699, 0, 0.3411765, 1, 1,
0.2119739, 0.8635868, 0.03486896, 0, 0.3333333, 1, 1,
0.2219118, 1.418193, 0.2578667, 0, 0.3294118, 1, 1,
0.2248945, -0.06254333, 0.5603679, 0, 0.3215686, 1, 1,
0.22778, 0.5062833, -0.1391708, 0, 0.3176471, 1, 1,
0.2278775, 0.03625991, 0.9336764, 0, 0.3098039, 1, 1,
0.2279122, 0.7990275, -0.09922507, 0, 0.3058824, 1, 1,
0.2285579, 0.5823336, -0.1051386, 0, 0.2980392, 1, 1,
0.2297417, -1.847986, 1.71395, 0, 0.2901961, 1, 1,
0.2308145, -0.01076225, 2.116921, 0, 0.2862745, 1, 1,
0.2381977, 0.7397929, -1.278948, 0, 0.2784314, 1, 1,
0.2412225, 0.2818689, -0.1363241, 0, 0.2745098, 1, 1,
0.2424248, 1.382041, -0.2902347, 0, 0.2666667, 1, 1,
0.2457992, 1.909564, 0.3956135, 0, 0.2627451, 1, 1,
0.2486093, -0.519262, 2.971712, 0, 0.254902, 1, 1,
0.2519788, -1.61986, 2.743929, 0, 0.2509804, 1, 1,
0.2585802, 1.048944, 1.188078, 0, 0.2431373, 1, 1,
0.2589188, -0.01328171, 1.395882, 0, 0.2392157, 1, 1,
0.2616758, -0.4451565, 2.218669, 0, 0.2313726, 1, 1,
0.2621495, -0.2877525, 2.968993, 0, 0.227451, 1, 1,
0.2626465, -0.8070043, 1.651909, 0, 0.2196078, 1, 1,
0.2657682, -0.6528366, 2.747194, 0, 0.2156863, 1, 1,
0.2727728, 0.6534896, -0.0672488, 0, 0.2078431, 1, 1,
0.2747779, 0.591365, 2.316077, 0, 0.2039216, 1, 1,
0.2758364, -1.319945, 4.084773, 0, 0.1960784, 1, 1,
0.2763295, 0.6742713, 0.3775789, 0, 0.1882353, 1, 1,
0.2770388, 0.6251193, 0.5536548, 0, 0.1843137, 1, 1,
0.2783217, 1.362903, -0.2282637, 0, 0.1764706, 1, 1,
0.2821091, 1.578744, -0.1728079, 0, 0.172549, 1, 1,
0.2861431, -0.4892688, 0.7305659, 0, 0.1647059, 1, 1,
0.2881132, -0.04427557, 1.005015, 0, 0.1607843, 1, 1,
0.2922619, 0.2494124, 1.457232, 0, 0.1529412, 1, 1,
0.2937285, 1.268626, 0.3535725, 0, 0.1490196, 1, 1,
0.2989929, -1.46769, 1.846513, 0, 0.1411765, 1, 1,
0.3000211, -0.6114449, 2.53006, 0, 0.1372549, 1, 1,
0.3001902, 1.036518, -0.9064357, 0, 0.1294118, 1, 1,
0.3060369, 1.070422, -0.02281971, 0, 0.1254902, 1, 1,
0.3071273, -0.6481071, 3.713796, 0, 0.1176471, 1, 1,
0.3115537, 1.193067, 0.7803688, 0, 0.1137255, 1, 1,
0.3203624, 0.3182824, 0.7146527, 0, 0.1058824, 1, 1,
0.3241497, 0.6681451, -0.4537419, 0, 0.09803922, 1, 1,
0.3248333, 0.6587104, 2.231871, 0, 0.09411765, 1, 1,
0.3289748, -0.3767533, 2.620892, 0, 0.08627451, 1, 1,
0.3301868, 0.8188573, 2.237702, 0, 0.08235294, 1, 1,
0.3381126, -1.061557, 2.138416, 0, 0.07450981, 1, 1,
0.3383015, 0.4096653, 1.773551, 0, 0.07058824, 1, 1,
0.3432258, -0.06468695, 1.413863, 0, 0.0627451, 1, 1,
0.3447579, 0.2892457, 1.167, 0, 0.05882353, 1, 1,
0.3463173, -0.1570784, 3.080115, 0, 0.05098039, 1, 1,
0.357742, 0.2529049, -0.6402999, 0, 0.04705882, 1, 1,
0.3677713, 0.09967042, 1.525022, 0, 0.03921569, 1, 1,
0.3680821, 0.7786269, 1.553133, 0, 0.03529412, 1, 1,
0.3724172, 0.2508689, 0.8766311, 0, 0.02745098, 1, 1,
0.3757261, 0.171259, 0.5600507, 0, 0.02352941, 1, 1,
0.3770685, -0.2150832, 3.359245, 0, 0.01568628, 1, 1,
0.3772649, -1.060915, 2.361365, 0, 0.01176471, 1, 1,
0.3791502, -1.230929, 3.87254, 0, 0.003921569, 1, 1,
0.3831051, 1.48239, 0.9966706, 0.003921569, 0, 1, 1,
0.3833743, -0.7751532, 2.352101, 0.007843138, 0, 1, 1,
0.3865396, -1.073254, 3.687715, 0.01568628, 0, 1, 1,
0.3868143, 0.1168187, 0.4456612, 0.01960784, 0, 1, 1,
0.3908839, 0.3789111, 1.388198, 0.02745098, 0, 1, 1,
0.3930773, -0.2836604, 2.825984, 0.03137255, 0, 1, 1,
0.3956254, 0.5099382, -0.06582961, 0.03921569, 0, 1, 1,
0.3978491, 0.3344407, 0.9811163, 0.04313726, 0, 1, 1,
0.40224, 1.8964, 1.180604, 0.05098039, 0, 1, 1,
0.4043111, -0.3432169, 2.549438, 0.05490196, 0, 1, 1,
0.4078924, -1.291921, 0.9444454, 0.0627451, 0, 1, 1,
0.4091651, 0.6139422, 1.215157, 0.06666667, 0, 1, 1,
0.4110201, -0.6781601, 1.461846, 0.07450981, 0, 1, 1,
0.4129, 1.49075, -1.914958, 0.07843138, 0, 1, 1,
0.4133453, 0.7300261, -1.043494, 0.08627451, 0, 1, 1,
0.413904, 0.3513611, 1.225924, 0.09019608, 0, 1, 1,
0.4165731, -0.6460282, 1.783056, 0.09803922, 0, 1, 1,
0.4227612, -0.0674455, 2.951224, 0.1058824, 0, 1, 1,
0.4250617, 1.626552, 0.5902777, 0.1098039, 0, 1, 1,
0.4315696, -0.1591073, 3.518595, 0.1176471, 0, 1, 1,
0.4345175, 0.2793153, -0.2023364, 0.1215686, 0, 1, 1,
0.4366213, 1.639013, -0.9731199, 0.1294118, 0, 1, 1,
0.4389017, 0.3343081, 1.199252, 0.1333333, 0, 1, 1,
0.4392211, -0.3275459, 1.276917, 0.1411765, 0, 1, 1,
0.4429139, -0.2467337, 0.992139, 0.145098, 0, 1, 1,
0.4441029, -0.3035494, 0.9126393, 0.1529412, 0, 1, 1,
0.4442763, -0.8026075, 3.157571, 0.1568628, 0, 1, 1,
0.4459291, -1.937696, 1.897524, 0.1647059, 0, 1, 1,
0.4478122, 0.5416794, -0.4079713, 0.1686275, 0, 1, 1,
0.4520711, -0.2449981, 2.124471, 0.1764706, 0, 1, 1,
0.4520999, 0.9562072, 0.3832034, 0.1803922, 0, 1, 1,
0.4581532, -0.4485592, 3.466477, 0.1882353, 0, 1, 1,
0.4605251, -2.477001, 2.38848, 0.1921569, 0, 1, 1,
0.4608986, 0.02914014, 1.022966, 0.2, 0, 1, 1,
0.4616187, 0.08246475, 1.554332, 0.2078431, 0, 1, 1,
0.4623653, 2.010419, 0.9494208, 0.2117647, 0, 1, 1,
0.4636169, 0.1444167, 0.01175799, 0.2196078, 0, 1, 1,
0.4645332, -0.6781161, 1.875723, 0.2235294, 0, 1, 1,
0.4659259, -2.189703, 1.964699, 0.2313726, 0, 1, 1,
0.4685544, 0.166866, 0.7877396, 0.2352941, 0, 1, 1,
0.4688176, -0.5844207, 3.412109, 0.2431373, 0, 1, 1,
0.4712445, -1.718579, 2.302217, 0.2470588, 0, 1, 1,
0.477137, 1.092396, 1.290608, 0.254902, 0, 1, 1,
0.4779764, 0.4583524, -0.1077255, 0.2588235, 0, 1, 1,
0.4819224, -1.474132, 2.160101, 0.2666667, 0, 1, 1,
0.484691, 1.044651, 0.7071007, 0.2705882, 0, 1, 1,
0.4854222, 1.234451, 1.466234, 0.2784314, 0, 1, 1,
0.4887613, 0.911679, 0.2179052, 0.282353, 0, 1, 1,
0.4944168, -0.105239, 2.161995, 0.2901961, 0, 1, 1,
0.4975129, 0.841949, 0.4395179, 0.2941177, 0, 1, 1,
0.4986205, 0.6583503, 0.8551992, 0.3019608, 0, 1, 1,
0.502461, 1.104999, 0.3031405, 0.3098039, 0, 1, 1,
0.504732, 0.5088227, 1.180435, 0.3137255, 0, 1, 1,
0.5083837, 0.5824056, 0.4569963, 0.3215686, 0, 1, 1,
0.5101302, -0.452824, 1.88218, 0.3254902, 0, 1, 1,
0.5119207, 0.03603271, 2.515492, 0.3333333, 0, 1, 1,
0.5148066, 1.882644, 1.436927, 0.3372549, 0, 1, 1,
0.5203887, 1.617521, 2.027932, 0.345098, 0, 1, 1,
0.5233119, -0.2928104, 3.080844, 0.3490196, 0, 1, 1,
0.5258995, -1.695836, 3.033373, 0.3568628, 0, 1, 1,
0.5259467, 0.5828983, 0.4243934, 0.3607843, 0, 1, 1,
0.5263593, -0.9061198, 3.786543, 0.3686275, 0, 1, 1,
0.5355363, 0.3323804, -0.4276252, 0.372549, 0, 1, 1,
0.5435742, 1.424752, -0.5345283, 0.3803922, 0, 1, 1,
0.5436596, -0.6707656, 2.661807, 0.3843137, 0, 1, 1,
0.5486268, 0.879301, -0.04599622, 0.3921569, 0, 1, 1,
0.5499276, 1.688446, -0.5747056, 0.3960784, 0, 1, 1,
0.5556442, -1.22145, 2.438836, 0.4039216, 0, 1, 1,
0.5607252, 1.266842, -0.05140984, 0.4117647, 0, 1, 1,
0.5694012, 0.2256036, 1.421013, 0.4156863, 0, 1, 1,
0.577243, 0.2755164, 2.274933, 0.4235294, 0, 1, 1,
0.5785984, -0.4036433, 0.2628276, 0.427451, 0, 1, 1,
0.5878733, 0.7442399, 1.286532, 0.4352941, 0, 1, 1,
0.5889366, -0.3092818, 1.411428, 0.4392157, 0, 1, 1,
0.5914276, 0.3216122, 1.830251, 0.4470588, 0, 1, 1,
0.594045, -0.254932, 2.650184, 0.4509804, 0, 1, 1,
0.5962018, -0.6705998, 3.150261, 0.4588235, 0, 1, 1,
0.5986883, -1.265393, 3.10115, 0.4627451, 0, 1, 1,
0.5991775, 1.578955, 0.7902233, 0.4705882, 0, 1, 1,
0.6018111, -0.4558172, 2.193566, 0.4745098, 0, 1, 1,
0.6023997, 0.3066081, 1.392266, 0.4823529, 0, 1, 1,
0.6072964, 1.626839, 0.5225396, 0.4862745, 0, 1, 1,
0.6129513, -1.509058, 2.25288, 0.4941176, 0, 1, 1,
0.6160286, -1.45966, 3.150485, 0.5019608, 0, 1, 1,
0.6194972, 1.980541, 1.552534, 0.5058824, 0, 1, 1,
0.6280953, 0.1522131, 0.6347228, 0.5137255, 0, 1, 1,
0.6296521, -1.659459, 4.217303, 0.5176471, 0, 1, 1,
0.6311287, -0.7487092, 1.01765, 0.5254902, 0, 1, 1,
0.6314234, 1.640288, -1.369979, 0.5294118, 0, 1, 1,
0.6335105, 0.07555905, 0.4475053, 0.5372549, 0, 1, 1,
0.63397, 0.1754079, 1.062491, 0.5411765, 0, 1, 1,
0.6340084, -0.9472865, 2.773165, 0.5490196, 0, 1, 1,
0.635444, -0.6646988, 4.364316, 0.5529412, 0, 1, 1,
0.6366512, -1.664351, 2.801179, 0.5607843, 0, 1, 1,
0.639953, 0.182963, 0.9852307, 0.5647059, 0, 1, 1,
0.6422378, 0.3462506, 2.385074, 0.572549, 0, 1, 1,
0.6496817, -1.094318, 2.158156, 0.5764706, 0, 1, 1,
0.6517425, -0.2775241, 1.386786, 0.5843138, 0, 1, 1,
0.65468, 0.04848015, 0.8093615, 0.5882353, 0, 1, 1,
0.6660821, 0.9698414, -0.668543, 0.5960785, 0, 1, 1,
0.6701151, -0.6393449, 2.695713, 0.6039216, 0, 1, 1,
0.6729895, 2.186098, 1.644428, 0.6078432, 0, 1, 1,
0.6736111, 1.219675, 0.9537715, 0.6156863, 0, 1, 1,
0.6738619, 1.775168, -0.249414, 0.6196079, 0, 1, 1,
0.6808971, 2.014966, 0.6666765, 0.627451, 0, 1, 1,
0.6832849, -1.153558, 3.347025, 0.6313726, 0, 1, 1,
0.6880004, 0.6618599, 0.4769015, 0.6392157, 0, 1, 1,
0.6886171, -0.07602526, 1.977585, 0.6431373, 0, 1, 1,
0.6929527, 1.597663, -0.2116354, 0.6509804, 0, 1, 1,
0.6937142, -0.1465286, 1.427402, 0.654902, 0, 1, 1,
0.7012746, 0.4066637, 2.096326, 0.6627451, 0, 1, 1,
0.7021587, -0.2177295, 3.198893, 0.6666667, 0, 1, 1,
0.7030886, 0.1497805, 1.274009, 0.6745098, 0, 1, 1,
0.7062253, 2.808781, -0.0536963, 0.6784314, 0, 1, 1,
0.7107639, -0.7115968, 2.86883, 0.6862745, 0, 1, 1,
0.7173477, -1.935264, 3.960036, 0.6901961, 0, 1, 1,
0.7174097, -0.04181276, 3.033604, 0.6980392, 0, 1, 1,
0.7229229, 1.418107, 0.8087418, 0.7058824, 0, 1, 1,
0.7268289, -1.096569, 2.676834, 0.7098039, 0, 1, 1,
0.7374194, 0.6359567, 0.285579, 0.7176471, 0, 1, 1,
0.7375033, -0.6662763, 0.1475862, 0.7215686, 0, 1, 1,
0.7375187, -0.2731061, 2.951134, 0.7294118, 0, 1, 1,
0.7386019, 0.7034419, 0.9808897, 0.7333333, 0, 1, 1,
0.7431829, -1.652772, 3.534679, 0.7411765, 0, 1, 1,
0.7476981, -0.928186, 1.171174, 0.7450981, 0, 1, 1,
0.751489, -0.1277063, 1.712854, 0.7529412, 0, 1, 1,
0.753108, 1.184895, 0.2607278, 0.7568628, 0, 1, 1,
0.7536502, 0.8874152, -0.06680013, 0.7647059, 0, 1, 1,
0.7559564, -0.5154323, 1.068316, 0.7686275, 0, 1, 1,
0.7565777, 0.7574679, 2.075817, 0.7764706, 0, 1, 1,
0.759786, -0.7074035, 3.301881, 0.7803922, 0, 1, 1,
0.7712523, 1.617938, 1.23564, 0.7882353, 0, 1, 1,
0.7725522, 0.8049399, 1.795393, 0.7921569, 0, 1, 1,
0.7757239, -1.451706, 4.355934, 0.8, 0, 1, 1,
0.7782299, -0.9090561, 2.05867, 0.8078431, 0, 1, 1,
0.7794891, -0.87168, 2.405171, 0.8117647, 0, 1, 1,
0.7798364, -1.185574, 2.295759, 0.8196079, 0, 1, 1,
0.7901028, -0.6717714, 3.219741, 0.8235294, 0, 1, 1,
0.7940198, -0.4516494, 0.8443521, 0.8313726, 0, 1, 1,
0.8080404, -0.1586587, 0.95111, 0.8352941, 0, 1, 1,
0.8081811, 0.6623371, 1.104758, 0.8431373, 0, 1, 1,
0.8092843, 0.1519977, 0.8162261, 0.8470588, 0, 1, 1,
0.8095151, -0.9720567, 3.667813, 0.854902, 0, 1, 1,
0.812025, 1.379009, 0.9208596, 0.8588235, 0, 1, 1,
0.8143501, 1.347727, -0.3096671, 0.8666667, 0, 1, 1,
0.8152285, -0.1056978, 1.630408, 0.8705882, 0, 1, 1,
0.8194165, 0.8411081, 1.47814, 0.8784314, 0, 1, 1,
0.8252214, 0.2210315, 1.880965, 0.8823529, 0, 1, 1,
0.8312451, -0.123028, 1.965543, 0.8901961, 0, 1, 1,
0.8321491, 0.3366515, 1.014325, 0.8941177, 0, 1, 1,
0.833854, 0.04505835, 1.815339, 0.9019608, 0, 1, 1,
0.8438748, -0.2246057, 1.210336, 0.9098039, 0, 1, 1,
0.856375, 0.7264218, 3.331365, 0.9137255, 0, 1, 1,
0.8581305, 1.514632, 0.6407484, 0.9215686, 0, 1, 1,
0.8611254, 0.6293948, 0.2024256, 0.9254902, 0, 1, 1,
0.8680813, -0.2445813, 1.26842, 0.9333333, 0, 1, 1,
0.8695868, 1.070191, 0.5532915, 0.9372549, 0, 1, 1,
0.8723679, -0.6200244, 1.124668, 0.945098, 0, 1, 1,
0.8747836, 0.4297484, -0.5659119, 0.9490196, 0, 1, 1,
0.8762929, 0.9388992, -0.05217895, 0.9568627, 0, 1, 1,
0.877457, 0.8735967, 0.6022683, 0.9607843, 0, 1, 1,
0.8855338, 0.7731274, 0.8208928, 0.9686275, 0, 1, 1,
0.8890461, -2.138046, 2.64612, 0.972549, 0, 1, 1,
0.8945383, -0.8152136, 2.896159, 0.9803922, 0, 1, 1,
0.8990731, 1.294595, 1.510918, 0.9843137, 0, 1, 1,
0.9011273, -0.7269912, 2.260033, 0.9921569, 0, 1, 1,
0.9022759, -1.400001, 2.240762, 0.9960784, 0, 1, 1,
0.9057153, 1.208081, 1.152104, 1, 0, 0.9960784, 1,
0.9078956, -0.1724763, 2.649477, 1, 0, 0.9882353, 1,
0.9099513, 0.8995996, -0.1336518, 1, 0, 0.9843137, 1,
0.9126226, -0.5754904, 1.049959, 1, 0, 0.9764706, 1,
0.9159686, -0.7875569, 3.576595, 1, 0, 0.972549, 1,
0.9170804, -0.4578171, 3.245182, 1, 0, 0.9647059, 1,
0.9234769, -0.1118501, 3.416067, 1, 0, 0.9607843, 1,
0.9368393, -1.740299, 2.881703, 1, 0, 0.9529412, 1,
0.9422349, 1.23671, -0.4039087, 1, 0, 0.9490196, 1,
0.9433008, 1.074757, -0.2981167, 1, 0, 0.9411765, 1,
0.9435249, 0.208795, 1.077383, 1, 0, 0.9372549, 1,
0.9448265, -0.8680451, 1.839826, 1, 0, 0.9294118, 1,
0.9456788, 0.04718421, 1.666547, 1, 0, 0.9254902, 1,
0.9471865, 1.682093, -0.6675854, 1, 0, 0.9176471, 1,
0.9479587, 0.6750706, -0.08992471, 1, 0, 0.9137255, 1,
0.954595, -1.0998, 3.472425, 1, 0, 0.9058824, 1,
0.9563848, 0.6852674, -0.8551528, 1, 0, 0.9019608, 1,
0.9657757, -1.704635, 3.268914, 1, 0, 0.8941177, 1,
0.966944, -0.1744266, 1.422709, 1, 0, 0.8862745, 1,
0.9715478, -0.6684644, -0.7703318, 1, 0, 0.8823529, 1,
0.9730859, 0.2083138, 0.4183462, 1, 0, 0.8745098, 1,
0.975018, 0.4391434, 1.056645, 1, 0, 0.8705882, 1,
0.9837149, -0.02781732, 1.960201, 1, 0, 0.8627451, 1,
0.9860602, 0.3396893, 1.523879, 1, 0, 0.8588235, 1,
0.9948079, 0.5189365, 2.677201, 1, 0, 0.8509804, 1,
0.9960781, 0.4496367, 1.923225, 1, 0, 0.8470588, 1,
1.000142, 0.4777023, 3.147101, 1, 0, 0.8392157, 1,
1.00617, 0.5226117, 2.94067, 1, 0, 0.8352941, 1,
1.008536, 1.320105, 2.045153, 1, 0, 0.827451, 1,
1.010038, 0.7806745, 1.237235, 1, 0, 0.8235294, 1,
1.011952, 0.4812413, 2.937067, 1, 0, 0.8156863, 1,
1.016139, 0.6353365, 0.275595, 1, 0, 0.8117647, 1,
1.019513, 0.8604184, 2.469787, 1, 0, 0.8039216, 1,
1.02294, -1.236758, 3.898768, 1, 0, 0.7960784, 1,
1.026371, 0.06327402, 1.948722, 1, 0, 0.7921569, 1,
1.03393, -0.2544072, 1.79416, 1, 0, 0.7843137, 1,
1.04797, 0.1787276, 0.4272112, 1, 0, 0.7803922, 1,
1.050176, 0.1351966, 1.396422, 1, 0, 0.772549, 1,
1.053805, -1.823782, 1.819779, 1, 0, 0.7686275, 1,
1.060827, 0.1590224, 1.626712, 1, 0, 0.7607843, 1,
1.063737, 0.3864456, 0.994666, 1, 0, 0.7568628, 1,
1.072535, 1.611991, -1.350963, 1, 0, 0.7490196, 1,
1.075003, -0.09675857, 1.596477, 1, 0, 0.7450981, 1,
1.085655, -0.3852559, 0.4530841, 1, 0, 0.7372549, 1,
1.099001, 0.309059, 1.741023, 1, 0, 0.7333333, 1,
1.101451, -0.2875272, 1.628027, 1, 0, 0.7254902, 1,
1.107913, -1.985716, 2.314883, 1, 0, 0.7215686, 1,
1.116424, 0.6423919, 2.367844, 1, 0, 0.7137255, 1,
1.127446, 0.7737673, 1.016066, 1, 0, 0.7098039, 1,
1.133002, -0.3012324, 1.688121, 1, 0, 0.7019608, 1,
1.133821, 0.6596971, 1.524853, 1, 0, 0.6941177, 1,
1.140118, -0.3343908, 1.941523, 1, 0, 0.6901961, 1,
1.153893, 0.4804842, 2.171515, 1, 0, 0.682353, 1,
1.162631, 0.03817642, 1.79898, 1, 0, 0.6784314, 1,
1.165379, 1.130116, 1.518783, 1, 0, 0.6705883, 1,
1.165417, -0.183967, 1.369646, 1, 0, 0.6666667, 1,
1.174391, 0.7198098, 1.01533, 1, 0, 0.6588235, 1,
1.18829, 0.5583292, 1.055449, 1, 0, 0.654902, 1,
1.194999, -0.5747945, 3.318668, 1, 0, 0.6470588, 1,
1.198952, 0.8382579, -2.089136, 1, 0, 0.6431373, 1,
1.206287, -0.8508343, 2.754719, 1, 0, 0.6352941, 1,
1.207153, -0.2649375, 0.2391248, 1, 0, 0.6313726, 1,
1.209487, -0.2775984, 2.478533, 1, 0, 0.6235294, 1,
1.210489, -0.1809636, 3.017761, 1, 0, 0.6196079, 1,
1.216152, -1.506034, 1.174443, 1, 0, 0.6117647, 1,
1.21712, 0.3934879, 0.2912053, 1, 0, 0.6078432, 1,
1.224168, -2.129874, -0.11384, 1, 0, 0.6, 1,
1.226159, 0.3905564, 1.857908, 1, 0, 0.5921569, 1,
1.226924, -1.420463, 4.087892, 1, 0, 0.5882353, 1,
1.236477, -1.188707, 2.439668, 1, 0, 0.5803922, 1,
1.236598, -0.1664466, 0.3802519, 1, 0, 0.5764706, 1,
1.255975, 0.1230571, 0.007249099, 1, 0, 0.5686275, 1,
1.257381, 0.07085191, 1.870126, 1, 0, 0.5647059, 1,
1.265026, -1.723011, 2.079144, 1, 0, 0.5568628, 1,
1.270462, -0.09288891, 3.019363, 1, 0, 0.5529412, 1,
1.274894, -1.154286, 3.249018, 1, 0, 0.5450981, 1,
1.28029, 0.9237404, -0.2139137, 1, 0, 0.5411765, 1,
1.286484, 1.695517, 1.375221, 1, 0, 0.5333334, 1,
1.286978, -1.396207, 2.19252, 1, 0, 0.5294118, 1,
1.291426, -0.8182331, 2.285529, 1, 0, 0.5215687, 1,
1.29194, 0.1669425, -0.3845194, 1, 0, 0.5176471, 1,
1.295881, 0.6624214, 0.09262042, 1, 0, 0.509804, 1,
1.298256, -0.4115735, 1.78128, 1, 0, 0.5058824, 1,
1.347284, -0.3979618, 0.9232794, 1, 0, 0.4980392, 1,
1.353523, 0.7453634, 0.7015826, 1, 0, 0.4901961, 1,
1.3569, -1.061714, 1.146896, 1, 0, 0.4862745, 1,
1.357748, -1.363516, 2.279517, 1, 0, 0.4784314, 1,
1.360794, 1.298705, 0.604403, 1, 0, 0.4745098, 1,
1.366897, 0.7585441, 0.06775297, 1, 0, 0.4666667, 1,
1.395411, -0.578933, 2.480222, 1, 0, 0.4627451, 1,
1.396413, -2.074969, 1.236578, 1, 0, 0.454902, 1,
1.404197, -1.871105, 2.51778, 1, 0, 0.4509804, 1,
1.406126, -0.5908028, 3.935999, 1, 0, 0.4431373, 1,
1.411881, -1.944047, 3.566639, 1, 0, 0.4392157, 1,
1.416012, 0.1026443, 2.769529, 1, 0, 0.4313726, 1,
1.420802, 0.655432, 0.8425882, 1, 0, 0.427451, 1,
1.436009, -1.012332, 2.739504, 1, 0, 0.4196078, 1,
1.452618, 0.3604012, 2.611329, 1, 0, 0.4156863, 1,
1.455075, -0.5034532, 1.925319, 1, 0, 0.4078431, 1,
1.456066, 0.2105085, 2.364958, 1, 0, 0.4039216, 1,
1.457927, -1.853359, 2.517831, 1, 0, 0.3960784, 1,
1.462509, -2.088274, 2.072277, 1, 0, 0.3882353, 1,
1.469285, 1.246636, -0.08286751, 1, 0, 0.3843137, 1,
1.516914, 0.365227, -0.6569909, 1, 0, 0.3764706, 1,
1.518808, 0.4919956, 0.9540492, 1, 0, 0.372549, 1,
1.541182, 0.1675615, -0.348581, 1, 0, 0.3647059, 1,
1.543793, 1.097581, 0.5986462, 1, 0, 0.3607843, 1,
1.564111, -0.5129932, 2.594756, 1, 0, 0.3529412, 1,
1.577087, 1.69126, 0.931021, 1, 0, 0.3490196, 1,
1.58117, 0.7116348, 0.3481765, 1, 0, 0.3411765, 1,
1.616444, -0.5535285, 3.229904, 1, 0, 0.3372549, 1,
1.635343, 0.1224059, 3.378599, 1, 0, 0.3294118, 1,
1.64039, 0.1460882, 1.136558, 1, 0, 0.3254902, 1,
1.66288, 0.5625821, 1.50759, 1, 0, 0.3176471, 1,
1.663462, 1.586965, 1.777025, 1, 0, 0.3137255, 1,
1.673713, 1.900156, 0.3318452, 1, 0, 0.3058824, 1,
1.691632, 0.2377999, 4.003565, 1, 0, 0.2980392, 1,
1.736006, 0.3818401, 0.6011233, 1, 0, 0.2941177, 1,
1.738419, -1.383286, 2.937047, 1, 0, 0.2862745, 1,
1.747096, -2.481639, 3.560877, 1, 0, 0.282353, 1,
1.748797, 0.770941, -0.05458544, 1, 0, 0.2745098, 1,
1.781205, 0.2025793, 2.452412, 1, 0, 0.2705882, 1,
1.782132, -0.2584081, 1.281269, 1, 0, 0.2627451, 1,
1.794824, -0.5963736, 1.712378, 1, 0, 0.2588235, 1,
1.810505, 0.2822721, 1.72257, 1, 0, 0.2509804, 1,
1.854766, 0.5393015, 1.388335, 1, 0, 0.2470588, 1,
1.869754, 0.3598221, 2.074125, 1, 0, 0.2392157, 1,
1.878291, 2.422055, 0.8693016, 1, 0, 0.2352941, 1,
1.879571, 2.469846, 0.7992847, 1, 0, 0.227451, 1,
1.881777, -1.657019, 2.968273, 1, 0, 0.2235294, 1,
1.888483, -0.9106943, 2.104636, 1, 0, 0.2156863, 1,
1.93224, -0.615163, 1.731842, 1, 0, 0.2117647, 1,
1.975234, -1.248184, 2.649263, 1, 0, 0.2039216, 1,
1.983846, 0.8111462, 1.046865, 1, 0, 0.1960784, 1,
1.989923, -0.1915697, -0.6920182, 1, 0, 0.1921569, 1,
2.050193, 0.3269544, 2.771699, 1, 0, 0.1843137, 1,
2.050525, 0.3252776, 1.562172, 1, 0, 0.1803922, 1,
2.063812, 0.2292513, 1.522839, 1, 0, 0.172549, 1,
2.078048, 0.376046, 1.830085, 1, 0, 0.1686275, 1,
2.09426, -1.992686, 3.426996, 1, 0, 0.1607843, 1,
2.131716, 1.336834, 1.382121, 1, 0, 0.1568628, 1,
2.13601, 1.437394, 0.7069983, 1, 0, 0.1490196, 1,
2.147544, 0.54263, 0.5226527, 1, 0, 0.145098, 1,
2.159553, -0.4517503, 1.638398, 1, 0, 0.1372549, 1,
2.168093, 1.543249, -0.019372, 1, 0, 0.1333333, 1,
2.170632, 0.7285671, 1.828523, 1, 0, 0.1254902, 1,
2.171727, 0.04107391, 0.9752062, 1, 0, 0.1215686, 1,
2.222948, -1.522652, 2.838166, 1, 0, 0.1137255, 1,
2.2276, -0.09822916, 1.648509, 1, 0, 0.1098039, 1,
2.244212, -1.500317, 0.875439, 1, 0, 0.1019608, 1,
2.252783, 2.006594, 1.610415, 1, 0, 0.09411765, 1,
2.264054, 0.2583737, 0.6148939, 1, 0, 0.09019608, 1,
2.305516, -0.6352087, 0.7108825, 1, 0, 0.08235294, 1,
2.355298, -0.7700011, 2.20328, 1, 0, 0.07843138, 1,
2.396389, 0.1343634, 1.712717, 1, 0, 0.07058824, 1,
2.414964, 1.092572, 3.009114, 1, 0, 0.06666667, 1,
2.486372, -3.152607, 3.686835, 1, 0, 0.05882353, 1,
2.574718, 0.6169011, 1.268809, 1, 0, 0.05490196, 1,
2.611285, -0.3411547, 2.268806, 1, 0, 0.04705882, 1,
2.629315, 1.294567, 2.508241, 1, 0, 0.04313726, 1,
2.632137, 1.780412, 0.8447574, 1, 0, 0.03529412, 1,
2.688399, -1.336797, 2.743026, 1, 0, 0.03137255, 1,
2.752192, 1.045292, -0.5275859, 1, 0, 0.02352941, 1,
2.76528, 0.9198629, 2.120321, 1, 0, 0.01960784, 1,
2.843937, -1.114519, 2.832954, 1, 0, 0.01176471, 1,
3.067508, 1.864705, 2.8775, 1, 0, 0.007843138, 1
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
0.05954862, -4.239349, -6.892882, 0, -0.5, 0.5, 0.5,
0.05954862, -4.239349, -6.892882, 1, -0.5, 0.5, 0.5,
0.05954862, -4.239349, -6.892882, 1, 1.5, 0.5, 0.5,
0.05954862, -4.239349, -6.892882, 0, 1.5, 0.5, 0.5
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
-3.968109, 0.05312073, -6.892882, 0, -0.5, 0.5, 0.5,
-3.968109, 0.05312073, -6.892882, 1, -0.5, 0.5, 0.5,
-3.968109, 0.05312073, -6.892882, 1, 1.5, 0.5, 0.5,
-3.968109, 0.05312073, -6.892882, 0, 1.5, 0.5, 0.5
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
-3.968109, -4.239349, -0.01758194, 0, -0.5, 0.5, 0.5,
-3.968109, -4.239349, -0.01758194, 1, -0.5, 0.5, 0.5,
-3.968109, -4.239349, -0.01758194, 1, 1.5, 0.5, 0.5,
-3.968109, -4.239349, -0.01758194, 0, 1.5, 0.5, 0.5
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
-2, -3.248779, -5.306274,
3, -3.248779, -5.306274,
-2, -3.248779, -5.306274,
-2, -3.413874, -5.570709,
-1, -3.248779, -5.306274,
-1, -3.413874, -5.570709,
0, -3.248779, -5.306274,
0, -3.413874, -5.570709,
1, -3.248779, -5.306274,
1, -3.413874, -5.570709,
2, -3.248779, -5.306274,
2, -3.413874, -5.570709,
3, -3.248779, -5.306274,
3, -3.413874, -5.570709
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
-2, -3.744064, -6.099578, 0, -0.5, 0.5, 0.5,
-2, -3.744064, -6.099578, 1, -0.5, 0.5, 0.5,
-2, -3.744064, -6.099578, 1, 1.5, 0.5, 0.5,
-2, -3.744064, -6.099578, 0, 1.5, 0.5, 0.5,
-1, -3.744064, -6.099578, 0, -0.5, 0.5, 0.5,
-1, -3.744064, -6.099578, 1, -0.5, 0.5, 0.5,
-1, -3.744064, -6.099578, 1, 1.5, 0.5, 0.5,
-1, -3.744064, -6.099578, 0, 1.5, 0.5, 0.5,
0, -3.744064, -6.099578, 0, -0.5, 0.5, 0.5,
0, -3.744064, -6.099578, 1, -0.5, 0.5, 0.5,
0, -3.744064, -6.099578, 1, 1.5, 0.5, 0.5,
0, -3.744064, -6.099578, 0, 1.5, 0.5, 0.5,
1, -3.744064, -6.099578, 0, -0.5, 0.5, 0.5,
1, -3.744064, -6.099578, 1, -0.5, 0.5, 0.5,
1, -3.744064, -6.099578, 1, 1.5, 0.5, 0.5,
1, -3.744064, -6.099578, 0, 1.5, 0.5, 0.5,
2, -3.744064, -6.099578, 0, -0.5, 0.5, 0.5,
2, -3.744064, -6.099578, 1, -0.5, 0.5, 0.5,
2, -3.744064, -6.099578, 1, 1.5, 0.5, 0.5,
2, -3.744064, -6.099578, 0, 1.5, 0.5, 0.5,
3, -3.744064, -6.099578, 0, -0.5, 0.5, 0.5,
3, -3.744064, -6.099578, 1, -0.5, 0.5, 0.5,
3, -3.744064, -6.099578, 1, 1.5, 0.5, 0.5,
3, -3.744064, -6.099578, 0, 1.5, 0.5, 0.5
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
-3.03865, -3, -5.306274,
-3.03865, 3, -5.306274,
-3.03865, -3, -5.306274,
-3.193559, -3, -5.570709,
-3.03865, -2, -5.306274,
-3.193559, -2, -5.570709,
-3.03865, -1, -5.306274,
-3.193559, -1, -5.570709,
-3.03865, 0, -5.306274,
-3.193559, 0, -5.570709,
-3.03865, 1, -5.306274,
-3.193559, 1, -5.570709,
-3.03865, 2, -5.306274,
-3.193559, 2, -5.570709,
-3.03865, 3, -5.306274,
-3.193559, 3, -5.570709
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
-3.503379, -3, -6.099578, 0, -0.5, 0.5, 0.5,
-3.503379, -3, -6.099578, 1, -0.5, 0.5, 0.5,
-3.503379, -3, -6.099578, 1, 1.5, 0.5, 0.5,
-3.503379, -3, -6.099578, 0, 1.5, 0.5, 0.5,
-3.503379, -2, -6.099578, 0, -0.5, 0.5, 0.5,
-3.503379, -2, -6.099578, 1, -0.5, 0.5, 0.5,
-3.503379, -2, -6.099578, 1, 1.5, 0.5, 0.5,
-3.503379, -2, -6.099578, 0, 1.5, 0.5, 0.5,
-3.503379, -1, -6.099578, 0, -0.5, 0.5, 0.5,
-3.503379, -1, -6.099578, 1, -0.5, 0.5, 0.5,
-3.503379, -1, -6.099578, 1, 1.5, 0.5, 0.5,
-3.503379, -1, -6.099578, 0, 1.5, 0.5, 0.5,
-3.503379, 0, -6.099578, 0, -0.5, 0.5, 0.5,
-3.503379, 0, -6.099578, 1, -0.5, 0.5, 0.5,
-3.503379, 0, -6.099578, 1, 1.5, 0.5, 0.5,
-3.503379, 0, -6.099578, 0, 1.5, 0.5, 0.5,
-3.503379, 1, -6.099578, 0, -0.5, 0.5, 0.5,
-3.503379, 1, -6.099578, 1, -0.5, 0.5, 0.5,
-3.503379, 1, -6.099578, 1, 1.5, 0.5, 0.5,
-3.503379, 1, -6.099578, 0, 1.5, 0.5, 0.5,
-3.503379, 2, -6.099578, 0, -0.5, 0.5, 0.5,
-3.503379, 2, -6.099578, 1, -0.5, 0.5, 0.5,
-3.503379, 2, -6.099578, 1, 1.5, 0.5, 0.5,
-3.503379, 2, -6.099578, 0, 1.5, 0.5, 0.5,
-3.503379, 3, -6.099578, 0, -0.5, 0.5, 0.5,
-3.503379, 3, -6.099578, 1, -0.5, 0.5, 0.5,
-3.503379, 3, -6.099578, 1, 1.5, 0.5, 0.5,
-3.503379, 3, -6.099578, 0, 1.5, 0.5, 0.5
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
-3.03865, -3.248779, -4,
-3.03865, -3.248779, 4,
-3.03865, -3.248779, -4,
-3.193559, -3.413874, -4,
-3.03865, -3.248779, -2,
-3.193559, -3.413874, -2,
-3.03865, -3.248779, 0,
-3.193559, -3.413874, 0,
-3.03865, -3.248779, 2,
-3.193559, -3.413874, 2,
-3.03865, -3.248779, 4,
-3.193559, -3.413874, 4
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
-3.503379, -3.744064, -4, 0, -0.5, 0.5, 0.5,
-3.503379, -3.744064, -4, 1, -0.5, 0.5, 0.5,
-3.503379, -3.744064, -4, 1, 1.5, 0.5, 0.5,
-3.503379, -3.744064, -4, 0, 1.5, 0.5, 0.5,
-3.503379, -3.744064, -2, 0, -0.5, 0.5, 0.5,
-3.503379, -3.744064, -2, 1, -0.5, 0.5, 0.5,
-3.503379, -3.744064, -2, 1, 1.5, 0.5, 0.5,
-3.503379, -3.744064, -2, 0, 1.5, 0.5, 0.5,
-3.503379, -3.744064, 0, 0, -0.5, 0.5, 0.5,
-3.503379, -3.744064, 0, 1, -0.5, 0.5, 0.5,
-3.503379, -3.744064, 0, 1, 1.5, 0.5, 0.5,
-3.503379, -3.744064, 0, 0, 1.5, 0.5, 0.5,
-3.503379, -3.744064, 2, 0, -0.5, 0.5, 0.5,
-3.503379, -3.744064, 2, 1, -0.5, 0.5, 0.5,
-3.503379, -3.744064, 2, 1, 1.5, 0.5, 0.5,
-3.503379, -3.744064, 2, 0, 1.5, 0.5, 0.5,
-3.503379, -3.744064, 4, 0, -0.5, 0.5, 0.5,
-3.503379, -3.744064, 4, 1, -0.5, 0.5, 0.5,
-3.503379, -3.744064, 4, 1, 1.5, 0.5, 0.5,
-3.503379, -3.744064, 4, 0, 1.5, 0.5, 0.5
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
-3.03865, -3.248779, -5.306274,
-3.03865, 3.355021, -5.306274,
-3.03865, -3.248779, 5.27111,
-3.03865, 3.355021, 5.27111,
-3.03865, -3.248779, -5.306274,
-3.03865, -3.248779, 5.27111,
-3.03865, 3.355021, -5.306274,
-3.03865, 3.355021, 5.27111,
-3.03865, -3.248779, -5.306274,
3.157747, -3.248779, -5.306274,
-3.03865, -3.248779, 5.27111,
3.157747, -3.248779, 5.27111,
-3.03865, 3.355021, -5.306274,
3.157747, 3.355021, -5.306274,
-3.03865, 3.355021, 5.27111,
3.157747, 3.355021, 5.27111,
3.157747, -3.248779, -5.306274,
3.157747, 3.355021, -5.306274,
3.157747, -3.248779, 5.27111,
3.157747, 3.355021, 5.27111,
3.157747, -3.248779, -5.306274,
3.157747, -3.248779, 5.27111,
3.157747, 3.355021, -5.306274,
3.157747, 3.355021, 5.27111
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
var radius = 7.435314;
var distance = 33.08055;
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
mvMatrix.translate( -0.05954862, -0.05312073, 0.01758194 );
mvMatrix.scale( 1.2974, 1.217361, 0.7600374 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.08055);
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
imazosulfuron<-read.table("imazosulfuron.xyz")
```

```
## Error in read.table("imazosulfuron.xyz"): no lines available in input
```

```r
x<-imazosulfuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'imazosulfuron' not found
```

```r
y<-imazosulfuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'imazosulfuron' not found
```

```r
z<-imazosulfuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'imazosulfuron' not found
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
-2.948411, 0.6430451, -1.273856, 0, 0, 1, 1, 1,
-2.74286, -0.1965916, -1.985273, 1, 0, 0, 1, 1,
-2.708723, 0.4302992, 0.9023277, 1, 0, 0, 1, 1,
-2.598856, 1.122283, 1.15227, 1, 0, 0, 1, 1,
-2.53913, 1.591305, -1.42241, 1, 0, 0, 1, 1,
-2.48521, 2.242003, -0.1125631, 1, 0, 0, 1, 1,
-2.378842, 2.025804, 0.2587619, 0, 0, 0, 1, 1,
-2.300428, 1.812539, -3.135024, 0, 0, 0, 1, 1,
-2.121575, -1.912308, -1.735435, 0, 0, 0, 1, 1,
-2.099668, -0.3186535, -2.224225, 0, 0, 0, 1, 1,
-2.061426, -1.181648, -3.352214, 0, 0, 0, 1, 1,
-2.047611, 1.264074, -1.427145, 0, 0, 0, 1, 1,
-2.024956, 0.5324481, -1.380487, 0, 0, 0, 1, 1,
-2.008, -1.674986, -1.617548, 1, 1, 1, 1, 1,
-1.984198, 0.3100533, -1.266666, 1, 1, 1, 1, 1,
-1.967348, -1.698139, -3.141786, 1, 1, 1, 1, 1,
-1.940795, -0.3986264, -4.058737, 1, 1, 1, 1, 1,
-1.924246, -0.2355626, -1.518592, 1, 1, 1, 1, 1,
-1.899923, 0.6759632, -0.8084688, 1, 1, 1, 1, 1,
-1.89212, 0.3767593, -2.318653, 1, 1, 1, 1, 1,
-1.872486, -0.02176009, -3.710171, 1, 1, 1, 1, 1,
-1.863743, 0.5170872, -1.110456, 1, 1, 1, 1, 1,
-1.854551, -0.3305027, -2.44684, 1, 1, 1, 1, 1,
-1.846714, -0.09017365, -1.289268, 1, 1, 1, 1, 1,
-1.822854, -1.484058, -1.751215, 1, 1, 1, 1, 1,
-1.821765, -0.3445844, -1.975107, 1, 1, 1, 1, 1,
-1.774684, 0.1945904, -2.151813, 1, 1, 1, 1, 1,
-1.741164, -1.081351, -2.255543, 1, 1, 1, 1, 1,
-1.727553, -0.9254146, -3.514539, 0, 0, 1, 1, 1,
-1.721877, 0.180798, -1.172382, 1, 0, 0, 1, 1,
-1.721505, 0.1388915, -2.006056, 1, 0, 0, 1, 1,
-1.715259, -0.5905948, -3.369263, 1, 0, 0, 1, 1,
-1.66234, 0.09278917, -1.99664, 1, 0, 0, 1, 1,
-1.657151, 0.8834662, -1.489046, 1, 0, 0, 1, 1,
-1.647976, 1.409457, -0.6763803, 0, 0, 0, 1, 1,
-1.638229, 0.8381387, -0.800117, 0, 0, 0, 1, 1,
-1.597997, -1.62149, -2.642041, 0, 0, 0, 1, 1,
-1.594344, 1.44504, -0.7133321, 0, 0, 0, 1, 1,
-1.582208, 1.347604, -1.25952, 0, 0, 0, 1, 1,
-1.567796, 1.014648, -1.530227, 0, 0, 0, 1, 1,
-1.566082, 1.547652, -0.3531268, 0, 0, 0, 1, 1,
-1.56441, -0.5727468, -1.18451, 1, 1, 1, 1, 1,
-1.551167, 0.97286, -3.008783, 1, 1, 1, 1, 1,
-1.546058, 0.09548315, -0.5321639, 1, 1, 1, 1, 1,
-1.529381, 0.8858763, 0.1454726, 1, 1, 1, 1, 1,
-1.520312, 0.06602877, -1.604503, 1, 1, 1, 1, 1,
-1.519302, -1.425085, -1.771783, 1, 1, 1, 1, 1,
-1.518524, 0.7242721, -0.4299208, 1, 1, 1, 1, 1,
-1.516977, 0.6249553, -0.05980348, 1, 1, 1, 1, 1,
-1.515474, 1.085516, -1.828192, 1, 1, 1, 1, 1,
-1.514884, 0.2137366, 0.1865459, 1, 1, 1, 1, 1,
-1.502842, -0.7766003, -2.882851, 1, 1, 1, 1, 1,
-1.500054, -0.9562958, -1.01974, 1, 1, 1, 1, 1,
-1.499902, 0.8601462, -1.319971, 1, 1, 1, 1, 1,
-1.479485, -0.6040582, -3.931562, 1, 1, 1, 1, 1,
-1.472251, 0.9193928, -1.393743, 1, 1, 1, 1, 1,
-1.47154, -2.335674, -2.31806, 0, 0, 1, 1, 1,
-1.462808, -0.5242187, -1.346182, 1, 0, 0, 1, 1,
-1.45223, 0.1344977, -1.386316, 1, 0, 0, 1, 1,
-1.439109, 1.842345, -0.5110379, 1, 0, 0, 1, 1,
-1.436697, -1.382759, -1.513938, 1, 0, 0, 1, 1,
-1.43458, -0.1508893, -1.008113, 1, 0, 0, 1, 1,
-1.43386, 0.7192118, 0.1916462, 0, 0, 0, 1, 1,
-1.425709, 0.1563466, -1.029285, 0, 0, 0, 1, 1,
-1.423919, -1.773866, -1.580776, 0, 0, 0, 1, 1,
-1.418853, -1.021136, -2.985557, 0, 0, 0, 1, 1,
-1.412143, -0.1895991, -1.855756, 0, 0, 0, 1, 1,
-1.410894, -0.5592918, -1.288352, 0, 0, 0, 1, 1,
-1.407603, -0.4296976, -1.969531, 0, 0, 0, 1, 1,
-1.403297, 0.2536557, -1.472781, 1, 1, 1, 1, 1,
-1.394506, -2.060402, -1.721953, 1, 1, 1, 1, 1,
-1.38353, -0.792946, -2.775402, 1, 1, 1, 1, 1,
-1.380464, -0.4246406, -3.554847, 1, 1, 1, 1, 1,
-1.377503, 0.03226086, -1.578515, 1, 1, 1, 1, 1,
-1.370881, 0.5161931, -1.426988, 1, 1, 1, 1, 1,
-1.370367, -0.5502065, -2.877987, 1, 1, 1, 1, 1,
-1.369717, 1.042298, -1.440674, 1, 1, 1, 1, 1,
-1.363998, -0.9465629, 0.7622232, 1, 1, 1, 1, 1,
-1.353824, -0.2423868, -2.260376, 1, 1, 1, 1, 1,
-1.349469, 0.0420317, -1.186911, 1, 1, 1, 1, 1,
-1.347799, -0.3939551, -1.735983, 1, 1, 1, 1, 1,
-1.347129, 0.07856649, -1.611971, 1, 1, 1, 1, 1,
-1.344443, 0.2381139, -1.247493, 1, 1, 1, 1, 1,
-1.342225, 0.4118852, -0.275261, 1, 1, 1, 1, 1,
-1.340187, -1.40916, -3.210347, 0, 0, 1, 1, 1,
-1.312622, -0.9455459, -3.344587, 1, 0, 0, 1, 1,
-1.295507, -1.241781, -3.44653, 1, 0, 0, 1, 1,
-1.273998, -0.8201293, -3.034521, 1, 0, 0, 1, 1,
-1.269537, 0.8434573, -0.2194874, 1, 0, 0, 1, 1,
-1.267586, 0.7117315, -0.8476604, 1, 0, 0, 1, 1,
-1.259838, -1.819494, -2.493125, 0, 0, 0, 1, 1,
-1.257307, 2.56242, -0.2240712, 0, 0, 0, 1, 1,
-1.251463, 0.1611173, -1.697324, 0, 0, 0, 1, 1,
-1.237634, 0.01087182, -0.7712612, 0, 0, 0, 1, 1,
-1.214305, 1.481844, -2.963491, 0, 0, 0, 1, 1,
-1.211591, 2.135565, -0.4255048, 0, 0, 0, 1, 1,
-1.211517, -0.9060932, -3.662237, 0, 0, 0, 1, 1,
-1.210072, 0.9379817, -2.180261, 1, 1, 1, 1, 1,
-1.204497, -1.813249, -1.919688, 1, 1, 1, 1, 1,
-1.198745, 0.4620659, -1.115655, 1, 1, 1, 1, 1,
-1.198624, 1.558159, -1.763102, 1, 1, 1, 1, 1,
-1.197867, -1.99561, -2.058882, 1, 1, 1, 1, 1,
-1.195158, -1.978839, -3.73524, 1, 1, 1, 1, 1,
-1.191469, -1.698406, -2.516852, 1, 1, 1, 1, 1,
-1.190316, 1.214542, -1.121444, 1, 1, 1, 1, 1,
-1.181617, 0.3418561, -2.376556, 1, 1, 1, 1, 1,
-1.181528, 0.04547169, -1.690662, 1, 1, 1, 1, 1,
-1.152732, -1.230891, -2.138264, 1, 1, 1, 1, 1,
-1.140928, -0.2978379, -2.530298, 1, 1, 1, 1, 1,
-1.116148, -0.6662857, -1.481638, 1, 1, 1, 1, 1,
-1.111273, 0.6942943, -1.728751, 1, 1, 1, 1, 1,
-1.11095, -0.01846351, -1.620343, 1, 1, 1, 1, 1,
-1.109659, 1.231933, -0.7326961, 0, 0, 1, 1, 1,
-1.102667, 0.2030988, -0.9152886, 1, 0, 0, 1, 1,
-1.101651, 0.4337761, -1.364964, 1, 0, 0, 1, 1,
-1.093691, 2.002553, -0.2570907, 1, 0, 0, 1, 1,
-1.090836, 0.4386501, -0.310648, 1, 0, 0, 1, 1,
-1.08757, -0.764232, -2.931707, 1, 0, 0, 1, 1,
-1.087298, 0.8700406, -2.176644, 0, 0, 0, 1, 1,
-1.086428, 1.076263, -1.292375, 0, 0, 0, 1, 1,
-1.086041, -1.172036, -2.235173, 0, 0, 0, 1, 1,
-1.084798, 0.9732651, -0.4849237, 0, 0, 0, 1, 1,
-1.079195, 0.4916449, -1.915189, 0, 0, 0, 1, 1,
-1.076543, 0.4175803, 0.7475739, 0, 0, 0, 1, 1,
-1.073146, -1.46562, 0.5092656, 0, 0, 0, 1, 1,
-1.072939, -1.263324, -2.431434, 1, 1, 1, 1, 1,
-1.069851, 0.8926719, -1.539111, 1, 1, 1, 1, 1,
-1.066765, -0.1277718, -1.715673, 1, 1, 1, 1, 1,
-1.06659, 0.1092062, -1.18621, 1, 1, 1, 1, 1,
-1.061043, 1.071412, -0.3973168, 1, 1, 1, 1, 1,
-1.060967, -0.6711417, -4.582607, 1, 1, 1, 1, 1,
-1.058252, -0.01961885, -1.126046, 1, 1, 1, 1, 1,
-1.053226, 1.186988, -1.364307, 1, 1, 1, 1, 1,
-1.053138, -0.4057762, -0.796971, 1, 1, 1, 1, 1,
-1.044463, -1.083203, -4.16538, 1, 1, 1, 1, 1,
-1.039458, -1.414524, -2.011425, 1, 1, 1, 1, 1,
-1.033271, -0.7257233, -0.5222326, 1, 1, 1, 1, 1,
-1.029097, 1.148942, -1.381311, 1, 1, 1, 1, 1,
-1.027113, 0.8431469, -0.02688818, 1, 1, 1, 1, 1,
-1.024864, -0.3043501, -1.913664, 1, 1, 1, 1, 1,
-1.024135, -0.2340069, -1.384652, 0, 0, 1, 1, 1,
-1.018277, 1.787615, 0.3683778, 1, 0, 0, 1, 1,
-1.017124, 0.05602127, -1.738174, 1, 0, 0, 1, 1,
-1.016034, -0.2118917, -0.2362718, 1, 0, 0, 1, 1,
-1.013668, 0.9249936, 0.5758415, 1, 0, 0, 1, 1,
-1.012202, 1.577141, -1.353731, 1, 0, 0, 1, 1,
-1.010271, -1.747759, -4.168206, 0, 0, 0, 1, 1,
-1.002512, 0.1239241, -1.357503, 0, 0, 0, 1, 1,
-0.9953928, -1.545568, -3.505999, 0, 0, 0, 1, 1,
-0.9921775, -0.4561769, -1.447388, 0, 0, 0, 1, 1,
-0.9911546, -0.3163238, -2.89517, 0, 0, 0, 1, 1,
-0.9890408, -0.1027107, -2.789896, 0, 0, 0, 1, 1,
-0.9881238, 0.4330973, -2.073527, 0, 0, 0, 1, 1,
-0.9803025, 0.2376552, -3.078185, 1, 1, 1, 1, 1,
-0.9664188, 0.1069041, -1.544342, 1, 1, 1, 1, 1,
-0.963223, 0.3456393, -0.1550394, 1, 1, 1, 1, 1,
-0.9582337, -0.2097388, -0.5546063, 1, 1, 1, 1, 1,
-0.9553942, 0.1661473, -1.124302, 1, 1, 1, 1, 1,
-0.9549679, -0.6670564, -4.051536, 1, 1, 1, 1, 1,
-0.9461939, -0.9057262, -2.639187, 1, 1, 1, 1, 1,
-0.9458139, -0.367674, -3.231228, 1, 1, 1, 1, 1,
-0.9409693, -0.3204169, -1.53155, 1, 1, 1, 1, 1,
-0.9356321, -0.2565897, -1.9336, 1, 1, 1, 1, 1,
-0.9270108, -0.1329519, -2.041047, 1, 1, 1, 1, 1,
-0.9174173, 0.5816589, -0.791542, 1, 1, 1, 1, 1,
-0.9166955, -0.8040681, -3.225122, 1, 1, 1, 1, 1,
-0.91317, 0.7634963, -3.077825, 1, 1, 1, 1, 1,
-0.9130562, 0.1235565, -3.369711, 1, 1, 1, 1, 1,
-0.9122949, 0.9425924, -0.9932334, 0, 0, 1, 1, 1,
-0.9118868, 0.4163631, -1.231457, 1, 0, 0, 1, 1,
-0.911063, 0.2233678, -1.275228, 1, 0, 0, 1, 1,
-0.909438, -0.7061667, -2.68363, 1, 0, 0, 1, 1,
-0.9084682, -0.9611709, -1.930839, 1, 0, 0, 1, 1,
-0.9055746, 0.0244641, 0.8517754, 1, 0, 0, 1, 1,
-0.9048483, 0.1204238, -1.110271, 0, 0, 0, 1, 1,
-0.8945143, 0.07867229, -3.505301, 0, 0, 0, 1, 1,
-0.8926402, -0.8779061, -4.516682, 0, 0, 0, 1, 1,
-0.8911054, 2.250345, -1.088002, 0, 0, 0, 1, 1,
-0.8874389, -2.122034, -2.59094, 0, 0, 0, 1, 1,
-0.8828669, 0.4607044, 0.7115746, 0, 0, 0, 1, 1,
-0.8825257, 0.4124314, 0.07955273, 0, 0, 0, 1, 1,
-0.8798676, 0.9615551, -1.52496, 1, 1, 1, 1, 1,
-0.8746227, -0.1882938, -2.248663, 1, 1, 1, 1, 1,
-0.8737947, 1.28017, -0.5680677, 1, 1, 1, 1, 1,
-0.8691368, 0.3864798, -0.4012122, 1, 1, 1, 1, 1,
-0.8667681, 0.5298108, -1.544894, 1, 1, 1, 1, 1,
-0.8629723, 0.08062073, 0.1074218, 1, 1, 1, 1, 1,
-0.8618941, 1.544607, -2.269948, 1, 1, 1, 1, 1,
-0.8608478, -0.412878, -0.7689659, 1, 1, 1, 1, 1,
-0.860368, 0.5797324, -0.03386824, 1, 1, 1, 1, 1,
-0.8566711, 0.1245361, -1.465201, 1, 1, 1, 1, 1,
-0.8408751, 0.818666, 0.7359731, 1, 1, 1, 1, 1,
-0.8319893, -1.307775, -2.29271, 1, 1, 1, 1, 1,
-0.8315998, 2.467488, -0.8692964, 1, 1, 1, 1, 1,
-0.8288903, 1.18322, -0.7869328, 1, 1, 1, 1, 1,
-0.8176609, -0.8296632, -0.8703461, 1, 1, 1, 1, 1,
-0.8150606, 0.7266242, -0.5949506, 0, 0, 1, 1, 1,
-0.8145344, 1.936133, -2.193489, 1, 0, 0, 1, 1,
-0.8108324, 0.7652625, -1.486367, 1, 0, 0, 1, 1,
-0.8097635, 0.2177882, -0.3918818, 1, 0, 0, 1, 1,
-0.8075478, -1.35197, -1.973284, 1, 0, 0, 1, 1,
-0.8063208, -1.356607, -2.946196, 1, 0, 0, 1, 1,
-0.8061607, 1.458908, -1.351635, 0, 0, 0, 1, 1,
-0.8059136, -0.1737691, -2.305966, 0, 0, 0, 1, 1,
-0.8044884, 0.8943978, -0.2892561, 0, 0, 0, 1, 1,
-0.8024513, -0.9815044, -1.775707, 0, 0, 0, 1, 1,
-0.7990017, 1.687461, 1.153372, 0, 0, 0, 1, 1,
-0.7978068, -1.75359, -1.090457, 0, 0, 0, 1, 1,
-0.797017, -1.140224, -1.237681, 0, 0, 0, 1, 1,
-0.7935783, 1.081679, 0.9950622, 1, 1, 1, 1, 1,
-0.7917042, 0.09049308, -1.778488, 1, 1, 1, 1, 1,
-0.7909135, 0.6611103, 0.3384064, 1, 1, 1, 1, 1,
-0.7865011, 0.6516423, 0.03321223, 1, 1, 1, 1, 1,
-0.7833894, 0.6381364, -1.797381, 1, 1, 1, 1, 1,
-0.781171, 0.07618561, -2.982092, 1, 1, 1, 1, 1,
-0.7794992, 1.060375, -0.6957021, 1, 1, 1, 1, 1,
-0.7785158, -1.298108, -2.677224, 1, 1, 1, 1, 1,
-0.7772502, -0.9341357, -4.853418, 1, 1, 1, 1, 1,
-0.773234, 0.6698665, -0.5656129, 1, 1, 1, 1, 1,
-0.7611086, -0.650728, -1.649602, 1, 1, 1, 1, 1,
-0.752189, -0.3927176, -3.655054, 1, 1, 1, 1, 1,
-0.7521269, -0.03267335, -0.7103168, 1, 1, 1, 1, 1,
-0.7515311, -0.3491115, -2.792457, 1, 1, 1, 1, 1,
-0.7506992, 0.1706675, -1.652014, 1, 1, 1, 1, 1,
-0.7462088, -0.863344, -3.257414, 0, 0, 1, 1, 1,
-0.7460903, 2.62302, 2.499244, 1, 0, 0, 1, 1,
-0.7460144, 1.030383, 0.6593959, 1, 0, 0, 1, 1,
-0.7414591, -0.4764514, -0.6008912, 1, 0, 0, 1, 1,
-0.7401599, -0.4553158, -4.522506, 1, 0, 0, 1, 1,
-0.7375798, -0.05166621, -4.047667, 1, 0, 0, 1, 1,
-0.7367279, 2.747859, 2.072747, 0, 0, 0, 1, 1,
-0.736716, 0.7330993, -0.5082527, 0, 0, 0, 1, 1,
-0.7358607, 1.446452, -1.716312, 0, 0, 0, 1, 1,
-0.7350251, 3.145245, -1.114463, 0, 0, 0, 1, 1,
-0.7339516, 1.303356, -0.8955531, 0, 0, 0, 1, 1,
-0.7281215, -0.1339167, -0.4263014, 0, 0, 0, 1, 1,
-0.721542, 1.074034, 1.581078, 0, 0, 0, 1, 1,
-0.7172812, -0.9269127, -4.564534, 1, 1, 1, 1, 1,
-0.7096342, -0.6562846, -0.8890698, 1, 1, 1, 1, 1,
-0.70136, 0.3184094, 0.03702856, 1, 1, 1, 1, 1,
-0.6945144, -0.09862145, -2.940885, 1, 1, 1, 1, 1,
-0.6904861, 0.08363037, -0.5911423, 1, 1, 1, 1, 1,
-0.6869828, -1.25427, -2.682683, 1, 1, 1, 1, 1,
-0.6810831, -0.09491014, -1.224184, 1, 1, 1, 1, 1,
-0.6764292, -0.999738, -3.905576, 1, 1, 1, 1, 1,
-0.6758446, -0.2884762, -3.099177, 1, 1, 1, 1, 1,
-0.6746761, 0.5675263, -1.970319, 1, 1, 1, 1, 1,
-0.6670221, -0.9524608, -3.036536, 1, 1, 1, 1, 1,
-0.6659611, -1.877262, -2.730429, 1, 1, 1, 1, 1,
-0.6576251, 0.09842201, -2.199837, 1, 1, 1, 1, 1,
-0.6560525, 0.8620155, -1.755507, 1, 1, 1, 1, 1,
-0.6552925, -0.4514376, -0.8720187, 1, 1, 1, 1, 1,
-0.6491402, -0.9506304, -1.85138, 0, 0, 1, 1, 1,
-0.6422928, -0.3531613, -2.477675, 1, 0, 0, 1, 1,
-0.6386237, 0.88146, -2.491158, 1, 0, 0, 1, 1,
-0.6350146, 0.91405, -1.610641, 1, 0, 0, 1, 1,
-0.6334961, -0.09196272, -2.790956, 1, 0, 0, 1, 1,
-0.630621, 0.4145475, -2.396943, 1, 0, 0, 1, 1,
-0.6273677, 0.270519, -1.443534, 0, 0, 0, 1, 1,
-0.6273488, 0.7809437, -1.0078, 0, 0, 0, 1, 1,
-0.6227379, 0.003131499, -1.626313, 0, 0, 0, 1, 1,
-0.6224708, -1.418693, -1.853875, 0, 0, 0, 1, 1,
-0.6219994, 0.8160141, 0.3931825, 0, 0, 0, 1, 1,
-0.6198876, 0.3272226, -0.8843955, 0, 0, 0, 1, 1,
-0.615811, 2.198677, 0.5726203, 0, 0, 0, 1, 1,
-0.6128801, 0.9712707, -1.000836, 1, 1, 1, 1, 1,
-0.6113168, 0.879427, 0.3395312, 1, 1, 1, 1, 1,
-0.610715, -1.424331, -2.399297, 1, 1, 1, 1, 1,
-0.6094991, -0.7890314, -2.918843, 1, 1, 1, 1, 1,
-0.6051646, -2.598899, -4.210018, 1, 1, 1, 1, 1,
-0.6038608, 2.567104, -0.8798332, 1, 1, 1, 1, 1,
-0.6020426, 1.186454, 0.2972006, 1, 1, 1, 1, 1,
-0.6006027, 0.05606214, -1.679401, 1, 1, 1, 1, 1,
-0.5963668, 1.71546, -1.498261, 1, 1, 1, 1, 1,
-0.5934405, -0.07008698, -1.542337, 1, 1, 1, 1, 1,
-0.582432, -1.167155, -4.722795, 1, 1, 1, 1, 1,
-0.5822534, -0.4939858, -1.437832, 1, 1, 1, 1, 1,
-0.5795246, 1.622493, 0.8368968, 1, 1, 1, 1, 1,
-0.5789343, -1.602528, -5.133277, 1, 1, 1, 1, 1,
-0.5765254, 1.081902, 1.016841, 1, 1, 1, 1, 1,
-0.5754502, -1.144113, -2.722254, 0, 0, 1, 1, 1,
-0.57109, -0.944625, -3.002636, 1, 0, 0, 1, 1,
-0.5699666, -0.2609359, -4.643888, 1, 0, 0, 1, 1,
-0.5691554, 2.658495, -0.106323, 1, 0, 0, 1, 1,
-0.5653734, 0.9176902, 0.5216268, 1, 0, 0, 1, 1,
-0.5574088, -1.372922, -3.937135, 1, 0, 0, 1, 1,
-0.5549439, 1.153814, 0.8715028, 0, 0, 0, 1, 1,
-0.5533664, 0.253153, -0.7434925, 0, 0, 0, 1, 1,
-0.5504579, -0.7076952, -3.115475, 0, 0, 0, 1, 1,
-0.5496734, -1.279891, -2.846804, 0, 0, 0, 1, 1,
-0.5494847, 0.9413089, -2.000721, 0, 0, 0, 1, 1,
-0.5469763, -0.3432331, -2.214317, 0, 0, 0, 1, 1,
-0.5469599, -0.7053245, -0.325247, 0, 0, 0, 1, 1,
-0.5424486, 0.4501904, -0.9663459, 1, 1, 1, 1, 1,
-0.5423819, 0.09284897, -0.5747005, 1, 1, 1, 1, 1,
-0.5406995, -0.4119697, -2.897576, 1, 1, 1, 1, 1,
-0.5378926, 1.458021, 0.8380906, 1, 1, 1, 1, 1,
-0.5370319, 1.58741, 0.5559824, 1, 1, 1, 1, 1,
-0.5359865, -0.9520928, -2.799477, 1, 1, 1, 1, 1,
-0.5352546, 0.4775077, -2.538501, 1, 1, 1, 1, 1,
-0.5341781, -0.6414518, -2.931185, 1, 1, 1, 1, 1,
-0.5268487, 0.06361628, -1.046407, 1, 1, 1, 1, 1,
-0.5244225, 1.54387, -0.6087191, 1, 1, 1, 1, 1,
-0.5242217, -1.405486, -3.235804, 1, 1, 1, 1, 1,
-0.5202729, 0.4920779, -1.831415, 1, 1, 1, 1, 1,
-0.5194339, 1.570963, -0.9411401, 1, 1, 1, 1, 1,
-0.5174613, -1.401151, -2.407464, 1, 1, 1, 1, 1,
-0.5126788, -0.05276579, -2.374704, 1, 1, 1, 1, 1,
-0.5099813, 1.101063, -0.4914215, 0, 0, 1, 1, 1,
-0.5087147, 0.3564322, 0.7378585, 1, 0, 0, 1, 1,
-0.5077342, 0.126589, -1.232785, 1, 0, 0, 1, 1,
-0.5073705, -0.1022521, -3.431928, 1, 0, 0, 1, 1,
-0.5057534, -0.1889904, -1.353713, 1, 0, 0, 1, 1,
-0.505724, 0.2739453, -0.976945, 1, 0, 0, 1, 1,
-0.5035812, 1.811621, -0.5966177, 0, 0, 0, 1, 1,
-0.5014201, 0.6646264, -1.155041, 0, 0, 0, 1, 1,
-0.4946685, -0.3402383, -0.3607734, 0, 0, 0, 1, 1,
-0.4927307, -0.5948085, -2.579689, 0, 0, 0, 1, 1,
-0.4889084, 1.146055, -2.293557, 0, 0, 0, 1, 1,
-0.4829445, 0.9012679, -1.395229, 0, 0, 0, 1, 1,
-0.4779704, 2.151957, -0.08251931, 0, 0, 0, 1, 1,
-0.4740434, -0.1924203, -1.493812, 1, 1, 1, 1, 1,
-0.4728518, -0.9070735, -1.943878, 1, 1, 1, 1, 1,
-0.4723459, 0.1946364, -0.4885899, 1, 1, 1, 1, 1,
-0.4649079, -1.974624, -3.719222, 1, 1, 1, 1, 1,
-0.4626024, 1.842994, -0.3619851, 1, 1, 1, 1, 1,
-0.4605799, -0.2968769, -1.326491, 1, 1, 1, 1, 1,
-0.456151, 0.5462176, -2.464022, 1, 1, 1, 1, 1,
-0.455842, 0.2837134, -0.7330797, 1, 1, 1, 1, 1,
-0.4524658, 1.471373, 0.1824103, 1, 1, 1, 1, 1,
-0.4438447, -0.2108608, -1.693457, 1, 1, 1, 1, 1,
-0.4419938, -0.2920034, -3.155178, 1, 1, 1, 1, 1,
-0.4419272, -1.839273, -3.349773, 1, 1, 1, 1, 1,
-0.4415727, -0.006385902, -1.448177, 1, 1, 1, 1, 1,
-0.4412768, -0.9141328, -2.6401, 1, 1, 1, 1, 1,
-0.4404153, 0.7751181, 0.1752416, 1, 1, 1, 1, 1,
-0.4359501, 0.9883167, 0.3215996, 0, 0, 1, 1, 1,
-0.4342697, 1.566438, -0.8603013, 1, 0, 0, 1, 1,
-0.4338557, 0.9393976, 0.2938927, 1, 0, 0, 1, 1,
-0.4336385, -0.4823929, -0.5855628, 1, 0, 0, 1, 1,
-0.4313795, 1.793818, 1.494961, 1, 0, 0, 1, 1,
-0.4313544, -1.157907, -4.402887, 1, 0, 0, 1, 1,
-0.4296384, 2.002964, 1.104734, 0, 0, 0, 1, 1,
-0.4260479, 0.4377624, -0.7970514, 0, 0, 0, 1, 1,
-0.4250953, 0.7495799, 0.00765704, 0, 0, 0, 1, 1,
-0.4249185, -0.1827061, -2.072911, 0, 0, 0, 1, 1,
-0.4222707, -0.3034323, -3.414075, 0, 0, 0, 1, 1,
-0.4187644, -0.782199, -3.186146, 0, 0, 0, 1, 1,
-0.4159178, -1.056672, -2.685969, 0, 0, 0, 1, 1,
-0.4140041, -1.101323, -4.933753, 1, 1, 1, 1, 1,
-0.4116075, 0.2902888, -1.342051, 1, 1, 1, 1, 1,
-0.4090119, 0.4657287, -0.0213245, 1, 1, 1, 1, 1,
-0.4084686, 0.4942969, 1.083282, 1, 1, 1, 1, 1,
-0.4022422, 2.003509, -0.6960767, 1, 1, 1, 1, 1,
-0.399435, 0.5752968, -1.940634, 1, 1, 1, 1, 1,
-0.3980335, -0.117068, -2.101127, 1, 1, 1, 1, 1,
-0.3980166, -0.04818392, -2.039996, 1, 1, 1, 1, 1,
-0.3930952, 0.8912855, 0.8899779, 1, 1, 1, 1, 1,
-0.3877316, -0.2246485, -1.838607, 1, 1, 1, 1, 1,
-0.3875565, 0.3096264, -0.5122738, 1, 1, 1, 1, 1,
-0.3873041, -0.3829165, -2.931638, 1, 1, 1, 1, 1,
-0.3869628, 0.6807989, 0.1863589, 1, 1, 1, 1, 1,
-0.3836104, -1.895404, -3.357563, 1, 1, 1, 1, 1,
-0.3824554, 0.5088786, -2.301123, 1, 1, 1, 1, 1,
-0.3769419, 0.6510015, 0.8202029, 0, 0, 1, 1, 1,
-0.3751581, -1.227125, -1.708138, 1, 0, 0, 1, 1,
-0.3743966, 0.003369881, -3.643125, 1, 0, 0, 1, 1,
-0.3739272, -0.313619, -4.022594, 1, 0, 0, 1, 1,
-0.3697375, -0.5979031, -3.7872, 1, 0, 0, 1, 1,
-0.3695952, 2.798036, 0.1753773, 1, 0, 0, 1, 1,
-0.3667812, 0.240226, -1.101896, 0, 0, 0, 1, 1,
-0.366376, 0.09303404, -1.829856, 0, 0, 0, 1, 1,
-0.3566382, 2.454743, -1.170876, 0, 0, 0, 1, 1,
-0.3553427, 1.953504, 1.401532, 0, 0, 0, 1, 1,
-0.3539375, 2.593973, 0.1105878, 0, 0, 0, 1, 1,
-0.3526216, 0.6112884, 1.029606, 0, 0, 0, 1, 1,
-0.3515582, -0.8708426, -2.699324, 0, 0, 0, 1, 1,
-0.3503776, 2.137854, 0.9837817, 1, 1, 1, 1, 1,
-0.3450555, -0.1838631, -1.39695, 1, 1, 1, 1, 1,
-0.343757, 1.117516, -0.3706123, 1, 1, 1, 1, 1,
-0.340698, -0.7922649, -1.005235, 1, 1, 1, 1, 1,
-0.3367715, -0.8551004, -2.442076, 1, 1, 1, 1, 1,
-0.336197, -0.0002963083, -1.437778, 1, 1, 1, 1, 1,
-0.3348181, -0.3550792, -2.183716, 1, 1, 1, 1, 1,
-0.3306292, -1.161255, -2.017946, 1, 1, 1, 1, 1,
-0.3286748, 0.8607331, 0.5204816, 1, 1, 1, 1, 1,
-0.3261054, -2.060742, -0.5464579, 1, 1, 1, 1, 1,
-0.3250096, -0.2887015, -0.8676071, 1, 1, 1, 1, 1,
-0.323454, -0.4760807, -3.21393, 1, 1, 1, 1, 1,
-0.3205916, -0.2965108, -3.423013, 1, 1, 1, 1, 1,
-0.3155247, -1.185033, -3.593421, 1, 1, 1, 1, 1,
-0.3147877, -0.1371966, -4.923351, 1, 1, 1, 1, 1,
-0.3089891, 0.06614798, -1.679228, 0, 0, 1, 1, 1,
-0.3086325, 0.7382302, -0.5706359, 1, 0, 0, 1, 1,
-0.3053751, -1.400877, -4.488981, 1, 0, 0, 1, 1,
-0.3051425, 0.9131298, -0.4834021, 1, 0, 0, 1, 1,
-0.303881, 0.191109, -3.106587, 1, 0, 0, 1, 1,
-0.3025234, 0.3154918, 1.226358, 1, 0, 0, 1, 1,
-0.3003994, 0.1579791, -1.193408, 0, 0, 0, 1, 1,
-0.2986678, -0.4904268, -2.474435, 0, 0, 0, 1, 1,
-0.2950693, 1.14733, -0.4181508, 0, 0, 0, 1, 1,
-0.2863299, 0.9884974, -0.3693972, 0, 0, 0, 1, 1,
-0.2847238, -0.7464615, -1.543668, 0, 0, 0, 1, 1,
-0.2817636, 1.66359, -0.3902352, 0, 0, 0, 1, 1,
-0.2768047, 1.352992, 1.041169, 0, 0, 0, 1, 1,
-0.274008, -0.6786914, -2.633158, 1, 1, 1, 1, 1,
-0.2735626, -0.1080951, -1.675996, 1, 1, 1, 1, 1,
-0.2723723, 0.5206633, -1.2327, 1, 1, 1, 1, 1,
-0.2693633, 0.3075012, -0.2939908, 1, 1, 1, 1, 1,
-0.2673008, -0.4400533, -1.957771, 1, 1, 1, 1, 1,
-0.2643068, 1.163379, 0.3428921, 1, 1, 1, 1, 1,
-0.2610384, -0.4564876, -3.345575, 1, 1, 1, 1, 1,
-0.2591209, 0.0273751, -0.5983675, 1, 1, 1, 1, 1,
-0.2565924, 0.6759344, 0.02922891, 1, 1, 1, 1, 1,
-0.2559026, -1.110374, -4.562046, 1, 1, 1, 1, 1,
-0.2531997, 1.673299, 0.9130353, 1, 1, 1, 1, 1,
-0.2526946, -0.05172971, -0.7944875, 1, 1, 1, 1, 1,
-0.2523305, -0.2441917, -3.133019, 1, 1, 1, 1, 1,
-0.2388808, -0.2686294, -1.899255, 1, 1, 1, 1, 1,
-0.2372015, 0.830955, -1.148393, 1, 1, 1, 1, 1,
-0.2343742, 0.2824137, -0.4291019, 0, 0, 1, 1, 1,
-0.231353, 1.050304, -0.8665925, 1, 0, 0, 1, 1,
-0.2313088, -1.334931, -1.725677, 1, 0, 0, 1, 1,
-0.2297723, -1.221303, -3.644944, 1, 0, 0, 1, 1,
-0.2280072, 0.7001464, 0.9564939, 1, 0, 0, 1, 1,
-0.2247618, -1.163784, -4.66451, 1, 0, 0, 1, 1,
-0.2166269, 1.931456, -0.08524485, 0, 0, 0, 1, 1,
-0.2092834, -0.2322211, -3.172061, 0, 0, 0, 1, 1,
-0.2007418, -1.959971, -0.6260478, 0, 0, 0, 1, 1,
-0.1987544, -0.9791738, -2.900374, 0, 0, 0, 1, 1,
-0.1965507, 0.4488078, 0.868104, 0, 0, 0, 1, 1,
-0.1944497, -1.396531, -3.430286, 0, 0, 0, 1, 1,
-0.1932956, 0.8120498, -0.3964738, 0, 0, 0, 1, 1,
-0.1931237, 0.4309781, -1.370907, 1, 1, 1, 1, 1,
-0.1892151, -2.063379, -2.661328, 1, 1, 1, 1, 1,
-0.1846769, 0.1675778, -1.271892, 1, 1, 1, 1, 1,
-0.1820112, 1.253272, -0.5465681, 1, 1, 1, 1, 1,
-0.1791885, 1.135874, 2.088248, 1, 1, 1, 1, 1,
-0.1780331, 0.1465624, -0.4933512, 1, 1, 1, 1, 1,
-0.1771887, -1.138478, -3.101093, 1, 1, 1, 1, 1,
-0.1714387, 0.01300115, 0.6403932, 1, 1, 1, 1, 1,
-0.1695181, 1.2603, 1.739917, 1, 1, 1, 1, 1,
-0.1688482, 0.8100227, -1.956159, 1, 1, 1, 1, 1,
-0.1631424, -2.110915, -3.440757, 1, 1, 1, 1, 1,
-0.1628689, 0.1696822, -0.8139009, 1, 1, 1, 1, 1,
-0.1628236, -1.902414, -4.225121, 1, 1, 1, 1, 1,
-0.1624758, -0.8738051, -2.772578, 1, 1, 1, 1, 1,
-0.1618985, -1.161467, -2.66245, 1, 1, 1, 1, 1,
-0.1606716, -0.3582041, -4.590479, 0, 0, 1, 1, 1,
-0.1575363, 0.9526211, 1.722343, 1, 0, 0, 1, 1,
-0.1515042, 1.415317, -0.3023172, 1, 0, 0, 1, 1,
-0.1504206, -1.431207, -3.069044, 1, 0, 0, 1, 1,
-0.1445822, -0.2336075, -2.615398, 1, 0, 0, 1, 1,
-0.1432365, -1.452011, -2.434104, 1, 0, 0, 1, 1,
-0.1368944, -0.04086783, -1.172328, 0, 0, 0, 1, 1,
-0.1352192, -0.9271368, -2.107234, 0, 0, 0, 1, 1,
-0.1351342, 1.826512, 2.076826, 0, 0, 0, 1, 1,
-0.1329074, -0.3518839, -2.915731, 0, 0, 0, 1, 1,
-0.131671, -0.5645404, -1.650885, 0, 0, 0, 1, 1,
-0.1296036, -0.8388787, -2.999776, 0, 0, 0, 1, 1,
-0.127831, -1.545165, -1.624807, 0, 0, 0, 1, 1,
-0.1276854, 1.530804, -0.8458065, 1, 1, 1, 1, 1,
-0.1254932, -0.2677161, -2.175053, 1, 1, 1, 1, 1,
-0.1251647, 0.2578031, -1.087866, 1, 1, 1, 1, 1,
-0.123706, 0.6141358, 0.8872094, 1, 1, 1, 1, 1,
-0.1201209, 1.612419, -1.862017, 1, 1, 1, 1, 1,
-0.118401, 1.788129, -1.420045, 1, 1, 1, 1, 1,
-0.1183945, 0.8652627, 1.082379, 1, 1, 1, 1, 1,
-0.118139, -0.2625202, -3.68774, 1, 1, 1, 1, 1,
-0.1155699, 0.5611846, 0.1232943, 1, 1, 1, 1, 1,
-0.1142491, -0.8366848, -1.892907, 1, 1, 1, 1, 1,
-0.1083405, 3.258849, 0.3493787, 1, 1, 1, 1, 1,
-0.1072347, -0.1180161, -1.184035, 1, 1, 1, 1, 1,
-0.09850194, 0.5974195, 0.707114, 1, 1, 1, 1, 1,
-0.09790316, -1.128141, -1.696202, 1, 1, 1, 1, 1,
-0.09615634, -1.978072, -2.686543, 1, 1, 1, 1, 1,
-0.09407344, 2.218799, -0.8637508, 0, 0, 1, 1, 1,
-0.09217382, 1.225927, -1.114196, 1, 0, 0, 1, 1,
-0.09061744, 0.8701435, 0.3176756, 1, 0, 0, 1, 1,
-0.08778527, 1.93403, 0.05003456, 1, 0, 0, 1, 1,
-0.08387206, -0.9184913, -3.326668, 1, 0, 0, 1, 1,
-0.07644144, 0.7800704, -0.08751294, 1, 0, 0, 1, 1,
-0.07514235, 0.5410699, 0.6459286, 0, 0, 0, 1, 1,
-0.06423751, 1.234105, -0.938574, 0, 0, 0, 1, 1,
-0.06020018, 0.2040953, 1.327306, 0, 0, 0, 1, 1,
-0.05973325, -0.6448717, -2.240311, 0, 0, 0, 1, 1,
-0.05880965, 0.05350658, -2.147626, 0, 0, 0, 1, 1,
-0.05752508, -0.582746, -1.731559, 0, 0, 0, 1, 1,
-0.05542802, -1.819309, -3.056402, 0, 0, 0, 1, 1,
-0.0530692, 0.7329944, 0.1138241, 1, 1, 1, 1, 1,
-0.05078258, -1.160406, -5.152235, 1, 1, 1, 1, 1,
-0.05034385, 0.3304547, -0.5853606, 1, 1, 1, 1, 1,
-0.05033934, -2.528255, -4.550358, 1, 1, 1, 1, 1,
-0.04573812, -0.6311008, -1.544046, 1, 1, 1, 1, 1,
-0.04473698, 1.201831, -0.2268572, 1, 1, 1, 1, 1,
-0.03917931, -0.5952453, -2.192142, 1, 1, 1, 1, 1,
-0.03753606, 0.775876, 0.3824462, 1, 1, 1, 1, 1,
-0.03573905, -0.9090126, -2.775655, 1, 1, 1, 1, 1,
-0.03472427, -0.785648, -3.89102, 1, 1, 1, 1, 1,
-0.033973, 0.03515136, -0.9308383, 1, 1, 1, 1, 1,
-0.03090285, 1.840624, -0.2113757, 1, 1, 1, 1, 1,
-0.03029697, -0.8622995, -4.468088, 1, 1, 1, 1, 1,
-0.029275, 0.39288, 1.550019, 1, 1, 1, 1, 1,
-0.02243491, -2.444881, -2.043769, 1, 1, 1, 1, 1,
-0.01953509, 0.2117037, -1.422116, 0, 0, 1, 1, 1,
-0.01547379, 0.1959389, -0.2991941, 1, 0, 0, 1, 1,
-0.0133785, 0.5608991, -0.9248409, 1, 0, 0, 1, 1,
-0.01245308, -0.6358224, -2.834858, 1, 0, 0, 1, 1,
-0.01175069, -0.2506023, -3.886015, 1, 0, 0, 1, 1,
-0.01162874, 0.9236519, -0.08102253, 1, 0, 0, 1, 1,
-0.008399154, 0.2915021, -1.755616, 0, 0, 0, 1, 1,
-0.003592564, -0.2200744, -4.456467, 0, 0, 0, 1, 1,
0.001784984, 0.4376583, -1.482558, 0, 0, 0, 1, 1,
0.004701118, 0.1595535, -0.7838033, 0, 0, 0, 1, 1,
0.00786497, -0.1001817, 3.164631, 0, 0, 0, 1, 1,
0.008320051, -0.1106517, 3.230582, 0, 0, 0, 1, 1,
0.01094117, 1.164168, 1.339965, 0, 0, 0, 1, 1,
0.01380339, -0.7830189, 3.516763, 1, 1, 1, 1, 1,
0.0141637, 0.2496781, -1.802815, 1, 1, 1, 1, 1,
0.01454238, 0.6382324, 0.7882305, 1, 1, 1, 1, 1,
0.02183697, 0.8318683, 1.196137, 1, 1, 1, 1, 1,
0.02404613, 0.3583312, 0.2041655, 1, 1, 1, 1, 1,
0.02582229, 0.5420067, 0.8709716, 1, 1, 1, 1, 1,
0.02593417, 0.8890107, 0.7900196, 1, 1, 1, 1, 1,
0.03273764, -0.03775696, 2.024295, 1, 1, 1, 1, 1,
0.03573725, -0.2522696, 4.12403, 1, 1, 1, 1, 1,
0.03590998, 0.6610494, 0.7944585, 1, 1, 1, 1, 1,
0.03616324, -1.010756, 3.241363, 1, 1, 1, 1, 1,
0.03759144, 0.859522, 1.057817, 1, 1, 1, 1, 1,
0.03823317, 0.04528397, 1.986268, 1, 1, 1, 1, 1,
0.03838753, -0.1029632, 2.714519, 1, 1, 1, 1, 1,
0.03892809, 0.4515426, -1.200539, 1, 1, 1, 1, 1,
0.04555647, -0.05258854, 1.209415, 0, 0, 1, 1, 1,
0.04610559, -0.116965, 2.878357, 1, 0, 0, 1, 1,
0.04788401, 0.2719081, -0.5563179, 1, 0, 0, 1, 1,
0.04801287, 2.159915, 0.361883, 1, 0, 0, 1, 1,
0.05046904, 0.1318513, -0.5001101, 1, 0, 0, 1, 1,
0.05055355, -0.9016982, 2.89374, 1, 0, 0, 1, 1,
0.05117852, -0.4198763, 1.665524, 0, 0, 0, 1, 1,
0.05260385, -0.7250732, 2.561558, 0, 0, 0, 1, 1,
0.05433144, -1.359707, 1.777644, 0, 0, 0, 1, 1,
0.05524242, 0.009401436, 0.4868132, 0, 0, 0, 1, 1,
0.05617548, -0.4596357, 2.441044, 0, 0, 0, 1, 1,
0.05769736, 0.8507296, -0.07591783, 0, 0, 0, 1, 1,
0.06435731, 0.4998237, -0.298546, 0, 0, 0, 1, 1,
0.07130316, -0.07618653, 2.870557, 1, 1, 1, 1, 1,
0.07302313, 0.295892, 0.05789725, 1, 1, 1, 1, 1,
0.07341067, -0.7533922, 2.683717, 1, 1, 1, 1, 1,
0.07433875, -0.6355714, 1.112358, 1, 1, 1, 1, 1,
0.07669932, -0.02552044, 0.5716914, 1, 1, 1, 1, 1,
0.07691094, -0.9294181, 5.117071, 1, 1, 1, 1, 1,
0.07818209, 0.3611179, 1.282853, 1, 1, 1, 1, 1,
0.07960255, -0.9955704, 4.187161, 1, 1, 1, 1, 1,
0.08114865, -1.91318, 4.372579, 1, 1, 1, 1, 1,
0.08218754, -1.111584, 0.8962251, 1, 1, 1, 1, 1,
0.08535706, -0.9559132, 3.223791, 1, 1, 1, 1, 1,
0.09132128, 0.2810361, 0.8631276, 1, 1, 1, 1, 1,
0.09270976, -0.02779165, 2.96675, 1, 1, 1, 1, 1,
0.09346992, 0.382356, 0.6226534, 1, 1, 1, 1, 1,
0.09359208, 1.726005, -0.4112177, 1, 1, 1, 1, 1,
0.09833714, 0.06450663, 2.542975, 0, 0, 1, 1, 1,
0.1009305, 0.6330604, 0.2493217, 1, 0, 0, 1, 1,
0.1009768, 0.7469215, -0.2378032, 1, 0, 0, 1, 1,
0.1023144, -1.38816, 1.121076, 1, 0, 0, 1, 1,
0.1048837, 0.02712386, 2.587366, 1, 0, 0, 1, 1,
0.105545, -0.02356382, 3.056726, 1, 0, 0, 1, 1,
0.1058635, -1.270012, 2.525868, 0, 0, 0, 1, 1,
0.1077135, -0.6832527, 1.915483, 0, 0, 0, 1, 1,
0.1094974, -0.2542253, 2.102177, 0, 0, 0, 1, 1,
0.1171333, -0.3190425, 2.312347, 0, 0, 0, 1, 1,
0.1178119, -0.4973367, 2.507889, 0, 0, 0, 1, 1,
0.1186243, -0.3165207, 2.054952, 0, 0, 0, 1, 1,
0.1198799, -0.3550267, 1.053316, 0, 0, 0, 1, 1,
0.1259619, 0.3940781, 2.301985, 1, 1, 1, 1, 1,
0.1306603, 1.938544, -1.479565, 1, 1, 1, 1, 1,
0.1347041, -1.868088, 1.299952, 1, 1, 1, 1, 1,
0.1388437, -1.01792, 2.27798, 1, 1, 1, 1, 1,
0.1390638, -1.25601, 2.426661, 1, 1, 1, 1, 1,
0.1438202, -0.02656659, 1.464708, 1, 1, 1, 1, 1,
0.1452306, -0.2306031, 2.566469, 1, 1, 1, 1, 1,
0.1463505, -0.02366128, 0.807723, 1, 1, 1, 1, 1,
0.1467121, 0.01441673, 2.499306, 1, 1, 1, 1, 1,
0.148617, 0.3450793, 0.03390463, 1, 1, 1, 1, 1,
0.1492667, -0.587531, 3.461787, 1, 1, 1, 1, 1,
0.1544352, -0.1995956, 2.48728, 1, 1, 1, 1, 1,
0.1561243, 1.126711, -1.474521, 1, 1, 1, 1, 1,
0.1587752, 0.01049243, 1.498736, 1, 1, 1, 1, 1,
0.1608545, 1.175451, -0.6193426, 1, 1, 1, 1, 1,
0.1618306, -0.7642124, 3.498677, 0, 0, 1, 1, 1,
0.163312, -0.2480346, 1.770914, 1, 0, 0, 1, 1,
0.1638079, -0.466601, 2.194186, 1, 0, 0, 1, 1,
0.1684157, -1.028183, 0.9951911, 1, 0, 0, 1, 1,
0.1740105, -0.1548051, 1.321237, 1, 0, 0, 1, 1,
0.1777612, 0.4342379, 1.173283, 1, 0, 0, 1, 1,
0.1781776, -2.428773, 1.169669, 0, 0, 0, 1, 1,
0.1786835, -0.525048, 4.079598, 0, 0, 0, 1, 1,
0.1803995, -0.4229604, 2.882042, 0, 0, 0, 1, 1,
0.1819431, -0.1840105, 1.464954, 0, 0, 0, 1, 1,
0.1855086, -1.71607, 3.776731, 0, 0, 0, 1, 1,
0.1856056, -1.825303, 2.974922, 0, 0, 0, 1, 1,
0.1862603, 0.6754444, 0.5832199, 0, 0, 0, 1, 1,
0.1879634, 1.991232, 0.2228677, 1, 1, 1, 1, 1,
0.1892683, -0.2462725, 2.312169, 1, 1, 1, 1, 1,
0.1980951, -1.178968, 2.345308, 1, 1, 1, 1, 1,
0.1997696, 1.077259, -0.3014388, 1, 1, 1, 1, 1,
0.1998617, 0.06467336, 1.001504, 1, 1, 1, 1, 1,
0.2000051, -0.4930338, 4.006699, 1, 1, 1, 1, 1,
0.2032106, -0.5748349, 1.107666, 1, 1, 1, 1, 1,
0.2100014, -1.327462, 2.737825, 1, 1, 1, 1, 1,
0.2113575, 1.227629, 0.04746493, 1, 1, 1, 1, 1,
0.2119343, 1.02138, -1.192699, 1, 1, 1, 1, 1,
0.2119739, 0.8635868, 0.03486896, 1, 1, 1, 1, 1,
0.2219118, 1.418193, 0.2578667, 1, 1, 1, 1, 1,
0.2248945, -0.06254333, 0.5603679, 1, 1, 1, 1, 1,
0.22778, 0.5062833, -0.1391708, 1, 1, 1, 1, 1,
0.2278775, 0.03625991, 0.9336764, 1, 1, 1, 1, 1,
0.2279122, 0.7990275, -0.09922507, 0, 0, 1, 1, 1,
0.2285579, 0.5823336, -0.1051386, 1, 0, 0, 1, 1,
0.2297417, -1.847986, 1.71395, 1, 0, 0, 1, 1,
0.2308145, -0.01076225, 2.116921, 1, 0, 0, 1, 1,
0.2381977, 0.7397929, -1.278948, 1, 0, 0, 1, 1,
0.2412225, 0.2818689, -0.1363241, 1, 0, 0, 1, 1,
0.2424248, 1.382041, -0.2902347, 0, 0, 0, 1, 1,
0.2457992, 1.909564, 0.3956135, 0, 0, 0, 1, 1,
0.2486093, -0.519262, 2.971712, 0, 0, 0, 1, 1,
0.2519788, -1.61986, 2.743929, 0, 0, 0, 1, 1,
0.2585802, 1.048944, 1.188078, 0, 0, 0, 1, 1,
0.2589188, -0.01328171, 1.395882, 0, 0, 0, 1, 1,
0.2616758, -0.4451565, 2.218669, 0, 0, 0, 1, 1,
0.2621495, -0.2877525, 2.968993, 1, 1, 1, 1, 1,
0.2626465, -0.8070043, 1.651909, 1, 1, 1, 1, 1,
0.2657682, -0.6528366, 2.747194, 1, 1, 1, 1, 1,
0.2727728, 0.6534896, -0.0672488, 1, 1, 1, 1, 1,
0.2747779, 0.591365, 2.316077, 1, 1, 1, 1, 1,
0.2758364, -1.319945, 4.084773, 1, 1, 1, 1, 1,
0.2763295, 0.6742713, 0.3775789, 1, 1, 1, 1, 1,
0.2770388, 0.6251193, 0.5536548, 1, 1, 1, 1, 1,
0.2783217, 1.362903, -0.2282637, 1, 1, 1, 1, 1,
0.2821091, 1.578744, -0.1728079, 1, 1, 1, 1, 1,
0.2861431, -0.4892688, 0.7305659, 1, 1, 1, 1, 1,
0.2881132, -0.04427557, 1.005015, 1, 1, 1, 1, 1,
0.2922619, 0.2494124, 1.457232, 1, 1, 1, 1, 1,
0.2937285, 1.268626, 0.3535725, 1, 1, 1, 1, 1,
0.2989929, -1.46769, 1.846513, 1, 1, 1, 1, 1,
0.3000211, -0.6114449, 2.53006, 0, 0, 1, 1, 1,
0.3001902, 1.036518, -0.9064357, 1, 0, 0, 1, 1,
0.3060369, 1.070422, -0.02281971, 1, 0, 0, 1, 1,
0.3071273, -0.6481071, 3.713796, 1, 0, 0, 1, 1,
0.3115537, 1.193067, 0.7803688, 1, 0, 0, 1, 1,
0.3203624, 0.3182824, 0.7146527, 1, 0, 0, 1, 1,
0.3241497, 0.6681451, -0.4537419, 0, 0, 0, 1, 1,
0.3248333, 0.6587104, 2.231871, 0, 0, 0, 1, 1,
0.3289748, -0.3767533, 2.620892, 0, 0, 0, 1, 1,
0.3301868, 0.8188573, 2.237702, 0, 0, 0, 1, 1,
0.3381126, -1.061557, 2.138416, 0, 0, 0, 1, 1,
0.3383015, 0.4096653, 1.773551, 0, 0, 0, 1, 1,
0.3432258, -0.06468695, 1.413863, 0, 0, 0, 1, 1,
0.3447579, 0.2892457, 1.167, 1, 1, 1, 1, 1,
0.3463173, -0.1570784, 3.080115, 1, 1, 1, 1, 1,
0.357742, 0.2529049, -0.6402999, 1, 1, 1, 1, 1,
0.3677713, 0.09967042, 1.525022, 1, 1, 1, 1, 1,
0.3680821, 0.7786269, 1.553133, 1, 1, 1, 1, 1,
0.3724172, 0.2508689, 0.8766311, 1, 1, 1, 1, 1,
0.3757261, 0.171259, 0.5600507, 1, 1, 1, 1, 1,
0.3770685, -0.2150832, 3.359245, 1, 1, 1, 1, 1,
0.3772649, -1.060915, 2.361365, 1, 1, 1, 1, 1,
0.3791502, -1.230929, 3.87254, 1, 1, 1, 1, 1,
0.3831051, 1.48239, 0.9966706, 1, 1, 1, 1, 1,
0.3833743, -0.7751532, 2.352101, 1, 1, 1, 1, 1,
0.3865396, -1.073254, 3.687715, 1, 1, 1, 1, 1,
0.3868143, 0.1168187, 0.4456612, 1, 1, 1, 1, 1,
0.3908839, 0.3789111, 1.388198, 1, 1, 1, 1, 1,
0.3930773, -0.2836604, 2.825984, 0, 0, 1, 1, 1,
0.3956254, 0.5099382, -0.06582961, 1, 0, 0, 1, 1,
0.3978491, 0.3344407, 0.9811163, 1, 0, 0, 1, 1,
0.40224, 1.8964, 1.180604, 1, 0, 0, 1, 1,
0.4043111, -0.3432169, 2.549438, 1, 0, 0, 1, 1,
0.4078924, -1.291921, 0.9444454, 1, 0, 0, 1, 1,
0.4091651, 0.6139422, 1.215157, 0, 0, 0, 1, 1,
0.4110201, -0.6781601, 1.461846, 0, 0, 0, 1, 1,
0.4129, 1.49075, -1.914958, 0, 0, 0, 1, 1,
0.4133453, 0.7300261, -1.043494, 0, 0, 0, 1, 1,
0.413904, 0.3513611, 1.225924, 0, 0, 0, 1, 1,
0.4165731, -0.6460282, 1.783056, 0, 0, 0, 1, 1,
0.4227612, -0.0674455, 2.951224, 0, 0, 0, 1, 1,
0.4250617, 1.626552, 0.5902777, 1, 1, 1, 1, 1,
0.4315696, -0.1591073, 3.518595, 1, 1, 1, 1, 1,
0.4345175, 0.2793153, -0.2023364, 1, 1, 1, 1, 1,
0.4366213, 1.639013, -0.9731199, 1, 1, 1, 1, 1,
0.4389017, 0.3343081, 1.199252, 1, 1, 1, 1, 1,
0.4392211, -0.3275459, 1.276917, 1, 1, 1, 1, 1,
0.4429139, -0.2467337, 0.992139, 1, 1, 1, 1, 1,
0.4441029, -0.3035494, 0.9126393, 1, 1, 1, 1, 1,
0.4442763, -0.8026075, 3.157571, 1, 1, 1, 1, 1,
0.4459291, -1.937696, 1.897524, 1, 1, 1, 1, 1,
0.4478122, 0.5416794, -0.4079713, 1, 1, 1, 1, 1,
0.4520711, -0.2449981, 2.124471, 1, 1, 1, 1, 1,
0.4520999, 0.9562072, 0.3832034, 1, 1, 1, 1, 1,
0.4581532, -0.4485592, 3.466477, 1, 1, 1, 1, 1,
0.4605251, -2.477001, 2.38848, 1, 1, 1, 1, 1,
0.4608986, 0.02914014, 1.022966, 0, 0, 1, 1, 1,
0.4616187, 0.08246475, 1.554332, 1, 0, 0, 1, 1,
0.4623653, 2.010419, 0.9494208, 1, 0, 0, 1, 1,
0.4636169, 0.1444167, 0.01175799, 1, 0, 0, 1, 1,
0.4645332, -0.6781161, 1.875723, 1, 0, 0, 1, 1,
0.4659259, -2.189703, 1.964699, 1, 0, 0, 1, 1,
0.4685544, 0.166866, 0.7877396, 0, 0, 0, 1, 1,
0.4688176, -0.5844207, 3.412109, 0, 0, 0, 1, 1,
0.4712445, -1.718579, 2.302217, 0, 0, 0, 1, 1,
0.477137, 1.092396, 1.290608, 0, 0, 0, 1, 1,
0.4779764, 0.4583524, -0.1077255, 0, 0, 0, 1, 1,
0.4819224, -1.474132, 2.160101, 0, 0, 0, 1, 1,
0.484691, 1.044651, 0.7071007, 0, 0, 0, 1, 1,
0.4854222, 1.234451, 1.466234, 1, 1, 1, 1, 1,
0.4887613, 0.911679, 0.2179052, 1, 1, 1, 1, 1,
0.4944168, -0.105239, 2.161995, 1, 1, 1, 1, 1,
0.4975129, 0.841949, 0.4395179, 1, 1, 1, 1, 1,
0.4986205, 0.6583503, 0.8551992, 1, 1, 1, 1, 1,
0.502461, 1.104999, 0.3031405, 1, 1, 1, 1, 1,
0.504732, 0.5088227, 1.180435, 1, 1, 1, 1, 1,
0.5083837, 0.5824056, 0.4569963, 1, 1, 1, 1, 1,
0.5101302, -0.452824, 1.88218, 1, 1, 1, 1, 1,
0.5119207, 0.03603271, 2.515492, 1, 1, 1, 1, 1,
0.5148066, 1.882644, 1.436927, 1, 1, 1, 1, 1,
0.5203887, 1.617521, 2.027932, 1, 1, 1, 1, 1,
0.5233119, -0.2928104, 3.080844, 1, 1, 1, 1, 1,
0.5258995, -1.695836, 3.033373, 1, 1, 1, 1, 1,
0.5259467, 0.5828983, 0.4243934, 1, 1, 1, 1, 1,
0.5263593, -0.9061198, 3.786543, 0, 0, 1, 1, 1,
0.5355363, 0.3323804, -0.4276252, 1, 0, 0, 1, 1,
0.5435742, 1.424752, -0.5345283, 1, 0, 0, 1, 1,
0.5436596, -0.6707656, 2.661807, 1, 0, 0, 1, 1,
0.5486268, 0.879301, -0.04599622, 1, 0, 0, 1, 1,
0.5499276, 1.688446, -0.5747056, 1, 0, 0, 1, 1,
0.5556442, -1.22145, 2.438836, 0, 0, 0, 1, 1,
0.5607252, 1.266842, -0.05140984, 0, 0, 0, 1, 1,
0.5694012, 0.2256036, 1.421013, 0, 0, 0, 1, 1,
0.577243, 0.2755164, 2.274933, 0, 0, 0, 1, 1,
0.5785984, -0.4036433, 0.2628276, 0, 0, 0, 1, 1,
0.5878733, 0.7442399, 1.286532, 0, 0, 0, 1, 1,
0.5889366, -0.3092818, 1.411428, 0, 0, 0, 1, 1,
0.5914276, 0.3216122, 1.830251, 1, 1, 1, 1, 1,
0.594045, -0.254932, 2.650184, 1, 1, 1, 1, 1,
0.5962018, -0.6705998, 3.150261, 1, 1, 1, 1, 1,
0.5986883, -1.265393, 3.10115, 1, 1, 1, 1, 1,
0.5991775, 1.578955, 0.7902233, 1, 1, 1, 1, 1,
0.6018111, -0.4558172, 2.193566, 1, 1, 1, 1, 1,
0.6023997, 0.3066081, 1.392266, 1, 1, 1, 1, 1,
0.6072964, 1.626839, 0.5225396, 1, 1, 1, 1, 1,
0.6129513, -1.509058, 2.25288, 1, 1, 1, 1, 1,
0.6160286, -1.45966, 3.150485, 1, 1, 1, 1, 1,
0.6194972, 1.980541, 1.552534, 1, 1, 1, 1, 1,
0.6280953, 0.1522131, 0.6347228, 1, 1, 1, 1, 1,
0.6296521, -1.659459, 4.217303, 1, 1, 1, 1, 1,
0.6311287, -0.7487092, 1.01765, 1, 1, 1, 1, 1,
0.6314234, 1.640288, -1.369979, 1, 1, 1, 1, 1,
0.6335105, 0.07555905, 0.4475053, 0, 0, 1, 1, 1,
0.63397, 0.1754079, 1.062491, 1, 0, 0, 1, 1,
0.6340084, -0.9472865, 2.773165, 1, 0, 0, 1, 1,
0.635444, -0.6646988, 4.364316, 1, 0, 0, 1, 1,
0.6366512, -1.664351, 2.801179, 1, 0, 0, 1, 1,
0.639953, 0.182963, 0.9852307, 1, 0, 0, 1, 1,
0.6422378, 0.3462506, 2.385074, 0, 0, 0, 1, 1,
0.6496817, -1.094318, 2.158156, 0, 0, 0, 1, 1,
0.6517425, -0.2775241, 1.386786, 0, 0, 0, 1, 1,
0.65468, 0.04848015, 0.8093615, 0, 0, 0, 1, 1,
0.6660821, 0.9698414, -0.668543, 0, 0, 0, 1, 1,
0.6701151, -0.6393449, 2.695713, 0, 0, 0, 1, 1,
0.6729895, 2.186098, 1.644428, 0, 0, 0, 1, 1,
0.6736111, 1.219675, 0.9537715, 1, 1, 1, 1, 1,
0.6738619, 1.775168, -0.249414, 1, 1, 1, 1, 1,
0.6808971, 2.014966, 0.6666765, 1, 1, 1, 1, 1,
0.6832849, -1.153558, 3.347025, 1, 1, 1, 1, 1,
0.6880004, 0.6618599, 0.4769015, 1, 1, 1, 1, 1,
0.6886171, -0.07602526, 1.977585, 1, 1, 1, 1, 1,
0.6929527, 1.597663, -0.2116354, 1, 1, 1, 1, 1,
0.6937142, -0.1465286, 1.427402, 1, 1, 1, 1, 1,
0.7012746, 0.4066637, 2.096326, 1, 1, 1, 1, 1,
0.7021587, -0.2177295, 3.198893, 1, 1, 1, 1, 1,
0.7030886, 0.1497805, 1.274009, 1, 1, 1, 1, 1,
0.7062253, 2.808781, -0.0536963, 1, 1, 1, 1, 1,
0.7107639, -0.7115968, 2.86883, 1, 1, 1, 1, 1,
0.7173477, -1.935264, 3.960036, 1, 1, 1, 1, 1,
0.7174097, -0.04181276, 3.033604, 1, 1, 1, 1, 1,
0.7229229, 1.418107, 0.8087418, 0, 0, 1, 1, 1,
0.7268289, -1.096569, 2.676834, 1, 0, 0, 1, 1,
0.7374194, 0.6359567, 0.285579, 1, 0, 0, 1, 1,
0.7375033, -0.6662763, 0.1475862, 1, 0, 0, 1, 1,
0.7375187, -0.2731061, 2.951134, 1, 0, 0, 1, 1,
0.7386019, 0.7034419, 0.9808897, 1, 0, 0, 1, 1,
0.7431829, -1.652772, 3.534679, 0, 0, 0, 1, 1,
0.7476981, -0.928186, 1.171174, 0, 0, 0, 1, 1,
0.751489, -0.1277063, 1.712854, 0, 0, 0, 1, 1,
0.753108, 1.184895, 0.2607278, 0, 0, 0, 1, 1,
0.7536502, 0.8874152, -0.06680013, 0, 0, 0, 1, 1,
0.7559564, -0.5154323, 1.068316, 0, 0, 0, 1, 1,
0.7565777, 0.7574679, 2.075817, 0, 0, 0, 1, 1,
0.759786, -0.7074035, 3.301881, 1, 1, 1, 1, 1,
0.7712523, 1.617938, 1.23564, 1, 1, 1, 1, 1,
0.7725522, 0.8049399, 1.795393, 1, 1, 1, 1, 1,
0.7757239, -1.451706, 4.355934, 1, 1, 1, 1, 1,
0.7782299, -0.9090561, 2.05867, 1, 1, 1, 1, 1,
0.7794891, -0.87168, 2.405171, 1, 1, 1, 1, 1,
0.7798364, -1.185574, 2.295759, 1, 1, 1, 1, 1,
0.7901028, -0.6717714, 3.219741, 1, 1, 1, 1, 1,
0.7940198, -0.4516494, 0.8443521, 1, 1, 1, 1, 1,
0.8080404, -0.1586587, 0.95111, 1, 1, 1, 1, 1,
0.8081811, 0.6623371, 1.104758, 1, 1, 1, 1, 1,
0.8092843, 0.1519977, 0.8162261, 1, 1, 1, 1, 1,
0.8095151, -0.9720567, 3.667813, 1, 1, 1, 1, 1,
0.812025, 1.379009, 0.9208596, 1, 1, 1, 1, 1,
0.8143501, 1.347727, -0.3096671, 1, 1, 1, 1, 1,
0.8152285, -0.1056978, 1.630408, 0, 0, 1, 1, 1,
0.8194165, 0.8411081, 1.47814, 1, 0, 0, 1, 1,
0.8252214, 0.2210315, 1.880965, 1, 0, 0, 1, 1,
0.8312451, -0.123028, 1.965543, 1, 0, 0, 1, 1,
0.8321491, 0.3366515, 1.014325, 1, 0, 0, 1, 1,
0.833854, 0.04505835, 1.815339, 1, 0, 0, 1, 1,
0.8438748, -0.2246057, 1.210336, 0, 0, 0, 1, 1,
0.856375, 0.7264218, 3.331365, 0, 0, 0, 1, 1,
0.8581305, 1.514632, 0.6407484, 0, 0, 0, 1, 1,
0.8611254, 0.6293948, 0.2024256, 0, 0, 0, 1, 1,
0.8680813, -0.2445813, 1.26842, 0, 0, 0, 1, 1,
0.8695868, 1.070191, 0.5532915, 0, 0, 0, 1, 1,
0.8723679, -0.6200244, 1.124668, 0, 0, 0, 1, 1,
0.8747836, 0.4297484, -0.5659119, 1, 1, 1, 1, 1,
0.8762929, 0.9388992, -0.05217895, 1, 1, 1, 1, 1,
0.877457, 0.8735967, 0.6022683, 1, 1, 1, 1, 1,
0.8855338, 0.7731274, 0.8208928, 1, 1, 1, 1, 1,
0.8890461, -2.138046, 2.64612, 1, 1, 1, 1, 1,
0.8945383, -0.8152136, 2.896159, 1, 1, 1, 1, 1,
0.8990731, 1.294595, 1.510918, 1, 1, 1, 1, 1,
0.9011273, -0.7269912, 2.260033, 1, 1, 1, 1, 1,
0.9022759, -1.400001, 2.240762, 1, 1, 1, 1, 1,
0.9057153, 1.208081, 1.152104, 1, 1, 1, 1, 1,
0.9078956, -0.1724763, 2.649477, 1, 1, 1, 1, 1,
0.9099513, 0.8995996, -0.1336518, 1, 1, 1, 1, 1,
0.9126226, -0.5754904, 1.049959, 1, 1, 1, 1, 1,
0.9159686, -0.7875569, 3.576595, 1, 1, 1, 1, 1,
0.9170804, -0.4578171, 3.245182, 1, 1, 1, 1, 1,
0.9234769, -0.1118501, 3.416067, 0, 0, 1, 1, 1,
0.9368393, -1.740299, 2.881703, 1, 0, 0, 1, 1,
0.9422349, 1.23671, -0.4039087, 1, 0, 0, 1, 1,
0.9433008, 1.074757, -0.2981167, 1, 0, 0, 1, 1,
0.9435249, 0.208795, 1.077383, 1, 0, 0, 1, 1,
0.9448265, -0.8680451, 1.839826, 1, 0, 0, 1, 1,
0.9456788, 0.04718421, 1.666547, 0, 0, 0, 1, 1,
0.9471865, 1.682093, -0.6675854, 0, 0, 0, 1, 1,
0.9479587, 0.6750706, -0.08992471, 0, 0, 0, 1, 1,
0.954595, -1.0998, 3.472425, 0, 0, 0, 1, 1,
0.9563848, 0.6852674, -0.8551528, 0, 0, 0, 1, 1,
0.9657757, -1.704635, 3.268914, 0, 0, 0, 1, 1,
0.966944, -0.1744266, 1.422709, 0, 0, 0, 1, 1,
0.9715478, -0.6684644, -0.7703318, 1, 1, 1, 1, 1,
0.9730859, 0.2083138, 0.4183462, 1, 1, 1, 1, 1,
0.975018, 0.4391434, 1.056645, 1, 1, 1, 1, 1,
0.9837149, -0.02781732, 1.960201, 1, 1, 1, 1, 1,
0.9860602, 0.3396893, 1.523879, 1, 1, 1, 1, 1,
0.9948079, 0.5189365, 2.677201, 1, 1, 1, 1, 1,
0.9960781, 0.4496367, 1.923225, 1, 1, 1, 1, 1,
1.000142, 0.4777023, 3.147101, 1, 1, 1, 1, 1,
1.00617, 0.5226117, 2.94067, 1, 1, 1, 1, 1,
1.008536, 1.320105, 2.045153, 1, 1, 1, 1, 1,
1.010038, 0.7806745, 1.237235, 1, 1, 1, 1, 1,
1.011952, 0.4812413, 2.937067, 1, 1, 1, 1, 1,
1.016139, 0.6353365, 0.275595, 1, 1, 1, 1, 1,
1.019513, 0.8604184, 2.469787, 1, 1, 1, 1, 1,
1.02294, -1.236758, 3.898768, 1, 1, 1, 1, 1,
1.026371, 0.06327402, 1.948722, 0, 0, 1, 1, 1,
1.03393, -0.2544072, 1.79416, 1, 0, 0, 1, 1,
1.04797, 0.1787276, 0.4272112, 1, 0, 0, 1, 1,
1.050176, 0.1351966, 1.396422, 1, 0, 0, 1, 1,
1.053805, -1.823782, 1.819779, 1, 0, 0, 1, 1,
1.060827, 0.1590224, 1.626712, 1, 0, 0, 1, 1,
1.063737, 0.3864456, 0.994666, 0, 0, 0, 1, 1,
1.072535, 1.611991, -1.350963, 0, 0, 0, 1, 1,
1.075003, -0.09675857, 1.596477, 0, 0, 0, 1, 1,
1.085655, -0.3852559, 0.4530841, 0, 0, 0, 1, 1,
1.099001, 0.309059, 1.741023, 0, 0, 0, 1, 1,
1.101451, -0.2875272, 1.628027, 0, 0, 0, 1, 1,
1.107913, -1.985716, 2.314883, 0, 0, 0, 1, 1,
1.116424, 0.6423919, 2.367844, 1, 1, 1, 1, 1,
1.127446, 0.7737673, 1.016066, 1, 1, 1, 1, 1,
1.133002, -0.3012324, 1.688121, 1, 1, 1, 1, 1,
1.133821, 0.6596971, 1.524853, 1, 1, 1, 1, 1,
1.140118, -0.3343908, 1.941523, 1, 1, 1, 1, 1,
1.153893, 0.4804842, 2.171515, 1, 1, 1, 1, 1,
1.162631, 0.03817642, 1.79898, 1, 1, 1, 1, 1,
1.165379, 1.130116, 1.518783, 1, 1, 1, 1, 1,
1.165417, -0.183967, 1.369646, 1, 1, 1, 1, 1,
1.174391, 0.7198098, 1.01533, 1, 1, 1, 1, 1,
1.18829, 0.5583292, 1.055449, 1, 1, 1, 1, 1,
1.194999, -0.5747945, 3.318668, 1, 1, 1, 1, 1,
1.198952, 0.8382579, -2.089136, 1, 1, 1, 1, 1,
1.206287, -0.8508343, 2.754719, 1, 1, 1, 1, 1,
1.207153, -0.2649375, 0.2391248, 1, 1, 1, 1, 1,
1.209487, -0.2775984, 2.478533, 0, 0, 1, 1, 1,
1.210489, -0.1809636, 3.017761, 1, 0, 0, 1, 1,
1.216152, -1.506034, 1.174443, 1, 0, 0, 1, 1,
1.21712, 0.3934879, 0.2912053, 1, 0, 0, 1, 1,
1.224168, -2.129874, -0.11384, 1, 0, 0, 1, 1,
1.226159, 0.3905564, 1.857908, 1, 0, 0, 1, 1,
1.226924, -1.420463, 4.087892, 0, 0, 0, 1, 1,
1.236477, -1.188707, 2.439668, 0, 0, 0, 1, 1,
1.236598, -0.1664466, 0.3802519, 0, 0, 0, 1, 1,
1.255975, 0.1230571, 0.007249099, 0, 0, 0, 1, 1,
1.257381, 0.07085191, 1.870126, 0, 0, 0, 1, 1,
1.265026, -1.723011, 2.079144, 0, 0, 0, 1, 1,
1.270462, -0.09288891, 3.019363, 0, 0, 0, 1, 1,
1.274894, -1.154286, 3.249018, 1, 1, 1, 1, 1,
1.28029, 0.9237404, -0.2139137, 1, 1, 1, 1, 1,
1.286484, 1.695517, 1.375221, 1, 1, 1, 1, 1,
1.286978, -1.396207, 2.19252, 1, 1, 1, 1, 1,
1.291426, -0.8182331, 2.285529, 1, 1, 1, 1, 1,
1.29194, 0.1669425, -0.3845194, 1, 1, 1, 1, 1,
1.295881, 0.6624214, 0.09262042, 1, 1, 1, 1, 1,
1.298256, -0.4115735, 1.78128, 1, 1, 1, 1, 1,
1.347284, -0.3979618, 0.9232794, 1, 1, 1, 1, 1,
1.353523, 0.7453634, 0.7015826, 1, 1, 1, 1, 1,
1.3569, -1.061714, 1.146896, 1, 1, 1, 1, 1,
1.357748, -1.363516, 2.279517, 1, 1, 1, 1, 1,
1.360794, 1.298705, 0.604403, 1, 1, 1, 1, 1,
1.366897, 0.7585441, 0.06775297, 1, 1, 1, 1, 1,
1.395411, -0.578933, 2.480222, 1, 1, 1, 1, 1,
1.396413, -2.074969, 1.236578, 0, 0, 1, 1, 1,
1.404197, -1.871105, 2.51778, 1, 0, 0, 1, 1,
1.406126, -0.5908028, 3.935999, 1, 0, 0, 1, 1,
1.411881, -1.944047, 3.566639, 1, 0, 0, 1, 1,
1.416012, 0.1026443, 2.769529, 1, 0, 0, 1, 1,
1.420802, 0.655432, 0.8425882, 1, 0, 0, 1, 1,
1.436009, -1.012332, 2.739504, 0, 0, 0, 1, 1,
1.452618, 0.3604012, 2.611329, 0, 0, 0, 1, 1,
1.455075, -0.5034532, 1.925319, 0, 0, 0, 1, 1,
1.456066, 0.2105085, 2.364958, 0, 0, 0, 1, 1,
1.457927, -1.853359, 2.517831, 0, 0, 0, 1, 1,
1.462509, -2.088274, 2.072277, 0, 0, 0, 1, 1,
1.469285, 1.246636, -0.08286751, 0, 0, 0, 1, 1,
1.516914, 0.365227, -0.6569909, 1, 1, 1, 1, 1,
1.518808, 0.4919956, 0.9540492, 1, 1, 1, 1, 1,
1.541182, 0.1675615, -0.348581, 1, 1, 1, 1, 1,
1.543793, 1.097581, 0.5986462, 1, 1, 1, 1, 1,
1.564111, -0.5129932, 2.594756, 1, 1, 1, 1, 1,
1.577087, 1.69126, 0.931021, 1, 1, 1, 1, 1,
1.58117, 0.7116348, 0.3481765, 1, 1, 1, 1, 1,
1.616444, -0.5535285, 3.229904, 1, 1, 1, 1, 1,
1.635343, 0.1224059, 3.378599, 1, 1, 1, 1, 1,
1.64039, 0.1460882, 1.136558, 1, 1, 1, 1, 1,
1.66288, 0.5625821, 1.50759, 1, 1, 1, 1, 1,
1.663462, 1.586965, 1.777025, 1, 1, 1, 1, 1,
1.673713, 1.900156, 0.3318452, 1, 1, 1, 1, 1,
1.691632, 0.2377999, 4.003565, 1, 1, 1, 1, 1,
1.736006, 0.3818401, 0.6011233, 1, 1, 1, 1, 1,
1.738419, -1.383286, 2.937047, 0, 0, 1, 1, 1,
1.747096, -2.481639, 3.560877, 1, 0, 0, 1, 1,
1.748797, 0.770941, -0.05458544, 1, 0, 0, 1, 1,
1.781205, 0.2025793, 2.452412, 1, 0, 0, 1, 1,
1.782132, -0.2584081, 1.281269, 1, 0, 0, 1, 1,
1.794824, -0.5963736, 1.712378, 1, 0, 0, 1, 1,
1.810505, 0.2822721, 1.72257, 0, 0, 0, 1, 1,
1.854766, 0.5393015, 1.388335, 0, 0, 0, 1, 1,
1.869754, 0.3598221, 2.074125, 0, 0, 0, 1, 1,
1.878291, 2.422055, 0.8693016, 0, 0, 0, 1, 1,
1.879571, 2.469846, 0.7992847, 0, 0, 0, 1, 1,
1.881777, -1.657019, 2.968273, 0, 0, 0, 1, 1,
1.888483, -0.9106943, 2.104636, 0, 0, 0, 1, 1,
1.93224, -0.615163, 1.731842, 1, 1, 1, 1, 1,
1.975234, -1.248184, 2.649263, 1, 1, 1, 1, 1,
1.983846, 0.8111462, 1.046865, 1, 1, 1, 1, 1,
1.989923, -0.1915697, -0.6920182, 1, 1, 1, 1, 1,
2.050193, 0.3269544, 2.771699, 1, 1, 1, 1, 1,
2.050525, 0.3252776, 1.562172, 1, 1, 1, 1, 1,
2.063812, 0.2292513, 1.522839, 1, 1, 1, 1, 1,
2.078048, 0.376046, 1.830085, 1, 1, 1, 1, 1,
2.09426, -1.992686, 3.426996, 1, 1, 1, 1, 1,
2.131716, 1.336834, 1.382121, 1, 1, 1, 1, 1,
2.13601, 1.437394, 0.7069983, 1, 1, 1, 1, 1,
2.147544, 0.54263, 0.5226527, 1, 1, 1, 1, 1,
2.159553, -0.4517503, 1.638398, 1, 1, 1, 1, 1,
2.168093, 1.543249, -0.019372, 1, 1, 1, 1, 1,
2.170632, 0.7285671, 1.828523, 1, 1, 1, 1, 1,
2.171727, 0.04107391, 0.9752062, 0, 0, 1, 1, 1,
2.222948, -1.522652, 2.838166, 1, 0, 0, 1, 1,
2.2276, -0.09822916, 1.648509, 1, 0, 0, 1, 1,
2.244212, -1.500317, 0.875439, 1, 0, 0, 1, 1,
2.252783, 2.006594, 1.610415, 1, 0, 0, 1, 1,
2.264054, 0.2583737, 0.6148939, 1, 0, 0, 1, 1,
2.305516, -0.6352087, 0.7108825, 0, 0, 0, 1, 1,
2.355298, -0.7700011, 2.20328, 0, 0, 0, 1, 1,
2.396389, 0.1343634, 1.712717, 0, 0, 0, 1, 1,
2.414964, 1.092572, 3.009114, 0, 0, 0, 1, 1,
2.486372, -3.152607, 3.686835, 0, 0, 0, 1, 1,
2.574718, 0.6169011, 1.268809, 0, 0, 0, 1, 1,
2.611285, -0.3411547, 2.268806, 0, 0, 0, 1, 1,
2.629315, 1.294567, 2.508241, 1, 1, 1, 1, 1,
2.632137, 1.780412, 0.8447574, 1, 1, 1, 1, 1,
2.688399, -1.336797, 2.743026, 1, 1, 1, 1, 1,
2.752192, 1.045292, -0.5275859, 1, 1, 1, 1, 1,
2.76528, 0.9198629, 2.120321, 1, 1, 1, 1, 1,
2.843937, -1.114519, 2.832954, 1, 1, 1, 1, 1,
3.067508, 1.864705, 2.8775, 1, 1, 1, 1, 1
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
var radius = 9.293916;
var distance = 32.64449;
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
mvMatrix.translate( -0.0595485, -0.05312085, 0.01758194 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.64449);
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
