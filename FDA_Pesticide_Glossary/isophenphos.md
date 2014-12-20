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
-2.973996, 0.8039598, -0.2493195, 1, 0, 0, 1,
-2.922383, -0.7626581, -0.8454936, 1, 0.007843138, 0, 1,
-2.69781, 0.1925723, -1.613008, 1, 0.01176471, 0, 1,
-2.665148, 0.5798233, -1.450315, 1, 0.01960784, 0, 1,
-2.547439, -0.9944416, -2.742112, 1, 0.02352941, 0, 1,
-2.469886, 0.7097661, -0.8718747, 1, 0.03137255, 0, 1,
-2.423877, 1.657446, -2.854881, 1, 0.03529412, 0, 1,
-2.309069, -0.1049623, -1.109993, 1, 0.04313726, 0, 1,
-2.283149, -1.269406, -2.051945, 1, 0.04705882, 0, 1,
-2.27516, 0.1761279, -0.4787051, 1, 0.05490196, 0, 1,
-2.24866, -3.162375, -1.032362, 1, 0.05882353, 0, 1,
-2.23034, -0.1345761, -3.536993, 1, 0.06666667, 0, 1,
-2.224347, -1.783359, -0.680217, 1, 0.07058824, 0, 1,
-2.180317, -1.000677, -2.785729, 1, 0.07843138, 0, 1,
-2.115666, -0.03927445, -0.1395015, 1, 0.08235294, 0, 1,
-2.075916, 0.7873477, -2.202588, 1, 0.09019608, 0, 1,
-2.070968, -0.2626852, -3.735713, 1, 0.09411765, 0, 1,
-2.040938, -0.4143251, -0.08888551, 1, 0.1019608, 0, 1,
-2.018271, -0.9945862, -2.015296, 1, 0.1098039, 0, 1,
-2.0129, -0.5491395, -4.329265, 1, 0.1137255, 0, 1,
-1.969249, 0.08599768, -2.68891, 1, 0.1215686, 0, 1,
-1.959116, -1.197252, -1.101347, 1, 0.1254902, 0, 1,
-1.921017, 0.2280012, -2.80892, 1, 0.1333333, 0, 1,
-1.902102, -0.04841224, -2.889422, 1, 0.1372549, 0, 1,
-1.874464, -0.6172053, -3.996669, 1, 0.145098, 0, 1,
-1.859329, -0.907277, -1.618673, 1, 0.1490196, 0, 1,
-1.847912, 0.2451481, -3.013733, 1, 0.1568628, 0, 1,
-1.824413, -0.4742278, -2.671991, 1, 0.1607843, 0, 1,
-1.819409, -0.8061138, -2.363902, 1, 0.1686275, 0, 1,
-1.817577, 0.515793, -0.02207092, 1, 0.172549, 0, 1,
-1.793564, 0.358016, -1.236961, 1, 0.1803922, 0, 1,
-1.790528, 0.1335609, -1.233949, 1, 0.1843137, 0, 1,
-1.789134, 0.2015802, -1.105026, 1, 0.1921569, 0, 1,
-1.786492, -1.017794, -2.319825, 1, 0.1960784, 0, 1,
-1.783285, 1.45454, -1.753289, 1, 0.2039216, 0, 1,
-1.781783, -1.28507, -2.11431, 1, 0.2117647, 0, 1,
-1.746636, 1.026206, -1.779259, 1, 0.2156863, 0, 1,
-1.74188, 0.8909262, -0.7895303, 1, 0.2235294, 0, 1,
-1.732447, 0.836458, -0.1724775, 1, 0.227451, 0, 1,
-1.730912, -0.09112107, -1.613637, 1, 0.2352941, 0, 1,
-1.709748, 1.291579, -1.294886, 1, 0.2392157, 0, 1,
-1.707824, -1.265059, -1.653983, 1, 0.2470588, 0, 1,
-1.702545, 0.10604, -1.621324, 1, 0.2509804, 0, 1,
-1.698801, -2.02084, -2.091412, 1, 0.2588235, 0, 1,
-1.676126, 0.7489707, -2.292196, 1, 0.2627451, 0, 1,
-1.675848, 1.297536, 0.3978378, 1, 0.2705882, 0, 1,
-1.664316, -0.6433443, 0.2377669, 1, 0.2745098, 0, 1,
-1.653917, -0.7978357, -3.070713, 1, 0.282353, 0, 1,
-1.650451, -0.8855633, -1.136977, 1, 0.2862745, 0, 1,
-1.647069, -2.246246, -2.708122, 1, 0.2941177, 0, 1,
-1.641387, -0.4273254, -2.570422, 1, 0.3019608, 0, 1,
-1.634689, 1.458521, 0.5338975, 1, 0.3058824, 0, 1,
-1.633331, 0.7709908, -0.3104696, 1, 0.3137255, 0, 1,
-1.630456, 1.377001, -0.6646249, 1, 0.3176471, 0, 1,
-1.626127, -0.01012516, -1.309461, 1, 0.3254902, 0, 1,
-1.611842, 1.953701, -0.4255062, 1, 0.3294118, 0, 1,
-1.603386, -1.109122, -2.291629, 1, 0.3372549, 0, 1,
-1.601332, 0.9202297, -0.8970553, 1, 0.3411765, 0, 1,
-1.601103, -0.6218429, 0.9919893, 1, 0.3490196, 0, 1,
-1.584163, 1.566697, -2.05758, 1, 0.3529412, 0, 1,
-1.581826, 1.21084, -0.9235328, 1, 0.3607843, 0, 1,
-1.575769, 2.286445, -2.065035, 1, 0.3647059, 0, 1,
-1.571173, 0.05041965, -0.6962262, 1, 0.372549, 0, 1,
-1.569188, 0.943813, -0.008478352, 1, 0.3764706, 0, 1,
-1.558066, 0.4922039, 0.06070075, 1, 0.3843137, 0, 1,
-1.549935, -1.102108, -2.278715, 1, 0.3882353, 0, 1,
-1.548947, -0.3614293, -1.313781, 1, 0.3960784, 0, 1,
-1.548806, 1.469487, -0.4524859, 1, 0.4039216, 0, 1,
-1.535412, -0.4227324, -2.333256, 1, 0.4078431, 0, 1,
-1.533126, -1.389197, 0.6338329, 1, 0.4156863, 0, 1,
-1.527475, -1.690835, -2.607264, 1, 0.4196078, 0, 1,
-1.520725, -1.31817, -2.251078, 1, 0.427451, 0, 1,
-1.509254, -1.211686, -3.079444, 1, 0.4313726, 0, 1,
-1.497879, -0.6242661, -0.8158911, 1, 0.4392157, 0, 1,
-1.486536, -0.5192716, -1.998458, 1, 0.4431373, 0, 1,
-1.485343, -0.1186478, -1.791028, 1, 0.4509804, 0, 1,
-1.481578, 0.7246675, -1.331968, 1, 0.454902, 0, 1,
-1.472344, -0.3771544, -1.766083, 1, 0.4627451, 0, 1,
-1.471866, -0.5646283, -2.653561, 1, 0.4666667, 0, 1,
-1.469725, -1.118991, -1.94688, 1, 0.4745098, 0, 1,
-1.453667, 0.8138983, -0.2368918, 1, 0.4784314, 0, 1,
-1.437891, 0.7644896, -0.4937704, 1, 0.4862745, 0, 1,
-1.416151, -0.2137341, -0.8144671, 1, 0.4901961, 0, 1,
-1.409153, -0.3454111, -1.560223, 1, 0.4980392, 0, 1,
-1.406373, -1.143495, -1.780537, 1, 0.5058824, 0, 1,
-1.394754, 0.1440361, -1.085595, 1, 0.509804, 0, 1,
-1.383141, 1.058692, -1.990589, 1, 0.5176471, 0, 1,
-1.381846, -0.2510638, -1.809688, 1, 0.5215687, 0, 1,
-1.380411, -0.2354133, -0.4536065, 1, 0.5294118, 0, 1,
-1.37163, 0.5091271, -1.758016, 1, 0.5333334, 0, 1,
-1.368598, -0.1247999, -2.042253, 1, 0.5411765, 0, 1,
-1.366216, 0.686187, -2.087478, 1, 0.5450981, 0, 1,
-1.356243, 1.276626, -0.7741654, 1, 0.5529412, 0, 1,
-1.352085, -0.3820596, 1.175343, 1, 0.5568628, 0, 1,
-1.34894, -0.4524271, -2.663261, 1, 0.5647059, 0, 1,
-1.321834, -1.50785, -3.581493, 1, 0.5686275, 0, 1,
-1.321362, -1.250584, -1.308103, 1, 0.5764706, 0, 1,
-1.295647, 1.552447, -2.377805, 1, 0.5803922, 0, 1,
-1.293584, 0.5509523, -1.981377, 1, 0.5882353, 0, 1,
-1.289159, 1.097028, -2.508537, 1, 0.5921569, 0, 1,
-1.281749, 0.3451551, -0.1173517, 1, 0.6, 0, 1,
-1.276941, 0.7571014, -1.866162, 1, 0.6078432, 0, 1,
-1.276306, 1.578271, -0.3018344, 1, 0.6117647, 0, 1,
-1.275796, -0.8699365, -1.546158, 1, 0.6196079, 0, 1,
-1.262054, 0.6787021, -2.335423, 1, 0.6235294, 0, 1,
-1.252557, -0.9919248, -1.025728, 1, 0.6313726, 0, 1,
-1.246497, 0.7979328, -0.5372975, 1, 0.6352941, 0, 1,
-1.243465, -0.609455, -2.370522, 1, 0.6431373, 0, 1,
-1.237169, -0.8655869, -0.4185205, 1, 0.6470588, 0, 1,
-1.233968, -0.3313499, -3.25114, 1, 0.654902, 0, 1,
-1.220299, -0.4327269, -1.707404, 1, 0.6588235, 0, 1,
-1.217608, 0.0803826, -1.121599, 1, 0.6666667, 0, 1,
-1.214948, 0.8212369, 0.5029917, 1, 0.6705883, 0, 1,
-1.214651, 0.6495956, -0.4570962, 1, 0.6784314, 0, 1,
-1.203253, -0.6120442, -1.24913, 1, 0.682353, 0, 1,
-1.195531, -1.667319, -1.49032, 1, 0.6901961, 0, 1,
-1.193929, 0.06375849, -0.9776083, 1, 0.6941177, 0, 1,
-1.19378, 2.072445, -0.9862963, 1, 0.7019608, 0, 1,
-1.188599, 0.3987601, -1.052996, 1, 0.7098039, 0, 1,
-1.185125, -0.5139591, -2.80297, 1, 0.7137255, 0, 1,
-1.184917, -0.2839558, -2.281565, 1, 0.7215686, 0, 1,
-1.162433, 0.6081749, -2.660789, 1, 0.7254902, 0, 1,
-1.155946, -0.09113231, -2.125916, 1, 0.7333333, 0, 1,
-1.149974, -0.2115708, -2.559362, 1, 0.7372549, 0, 1,
-1.149868, -0.8647373, -1.119984, 1, 0.7450981, 0, 1,
-1.148855, -0.734482, -2.000893, 1, 0.7490196, 0, 1,
-1.129578, -0.02614366, -1.204382, 1, 0.7568628, 0, 1,
-1.12784, -1.590677, -1.944447, 1, 0.7607843, 0, 1,
-1.11917, -1.645625, -2.21628, 1, 0.7686275, 0, 1,
-1.117103, -0.7444794, -0.3725673, 1, 0.772549, 0, 1,
-1.114416, 0.5515879, -2.067833, 1, 0.7803922, 0, 1,
-1.113155, 0.1065137, -0.7085308, 1, 0.7843137, 0, 1,
-1.111297, -0.5917206, -0.3746257, 1, 0.7921569, 0, 1,
-1.106867, 0.5388663, 0.9910264, 1, 0.7960784, 0, 1,
-1.105903, 0.3272491, 0.3445163, 1, 0.8039216, 0, 1,
-1.099498, 1.225401, -0.9994742, 1, 0.8117647, 0, 1,
-1.097471, 0.05555217, -1.155642, 1, 0.8156863, 0, 1,
-1.093335, 0.9990081, -1.495201, 1, 0.8235294, 0, 1,
-1.08004, -0.1879526, -2.927448, 1, 0.827451, 0, 1,
-1.077289, 0.3008927, -2.536176, 1, 0.8352941, 0, 1,
-1.073499, -2.579412, -2.279754, 1, 0.8392157, 0, 1,
-1.065963, -0.2125261, -0.666017, 1, 0.8470588, 0, 1,
-1.065182, -0.1419331, -0.6181326, 1, 0.8509804, 0, 1,
-1.064442, -1.249936, -2.229133, 1, 0.8588235, 0, 1,
-1.063641, -0.03652154, 0.4792571, 1, 0.8627451, 0, 1,
-1.057216, 0.4232533, -1.491614, 1, 0.8705882, 0, 1,
-1.054157, 1.1717, 0.2338566, 1, 0.8745098, 0, 1,
-1.04264, -1.862954, -1.761253, 1, 0.8823529, 0, 1,
-1.03905, -0.4149802, -1.723517, 1, 0.8862745, 0, 1,
-1.038895, -0.5890415, -2.373791, 1, 0.8941177, 0, 1,
-1.034238, -1.41211, -2.598926, 1, 0.8980392, 0, 1,
-1.032204, -0.5918733, -3.105997, 1, 0.9058824, 0, 1,
-1.030994, -0.4449752, -0.7670621, 1, 0.9137255, 0, 1,
-1.027355, 0.4476624, -2.886613, 1, 0.9176471, 0, 1,
-1.02107, -0.1408928, -2.424421, 1, 0.9254902, 0, 1,
-1.020049, 0.7168425, -0.2967908, 1, 0.9294118, 0, 1,
-1.017706, -1.012001, -2.52959, 1, 0.9372549, 0, 1,
-1.015433, -1.112874, -1.060384, 1, 0.9411765, 0, 1,
-1.010572, 0.3389417, -1.177759, 1, 0.9490196, 0, 1,
-1.006748, 0.4871409, -0.7892528, 1, 0.9529412, 0, 1,
-1.001474, -1.319462, -2.811878, 1, 0.9607843, 0, 1,
-0.9999841, -0.07094508, -1.75418, 1, 0.9647059, 0, 1,
-0.9955263, -0.1159552, -1.228766, 1, 0.972549, 0, 1,
-0.9889975, 1.512601, -1.266946, 1, 0.9764706, 0, 1,
-0.9881033, 1.259752, 0.0503962, 1, 0.9843137, 0, 1,
-0.985779, -1.018969, -2.995473, 1, 0.9882353, 0, 1,
-0.9803718, -1.586882, -3.095922, 1, 0.9960784, 0, 1,
-0.9795179, -0.4276676, -0.2309603, 0.9960784, 1, 0, 1,
-0.9746054, 1.035762, -0.01910605, 0.9921569, 1, 0, 1,
-0.9733017, 0.8315945, -1.647483, 0.9843137, 1, 0, 1,
-0.9711505, 0.682593, -0.3323174, 0.9803922, 1, 0, 1,
-0.9711298, 1.807521, -1.447174, 0.972549, 1, 0, 1,
-0.967923, -0.5303158, -2.875328, 0.9686275, 1, 0, 1,
-0.9619021, -1.412472, -2.691452, 0.9607843, 1, 0, 1,
-0.9616163, 0.8506283, -1.212391, 0.9568627, 1, 0, 1,
-0.9548566, 0.3117723, -2.683916, 0.9490196, 1, 0, 1,
-0.951873, 0.7289896, -2.399371, 0.945098, 1, 0, 1,
-0.9494085, 0.1086657, -1.225829, 0.9372549, 1, 0, 1,
-0.9478528, -1.339622, -0.7448977, 0.9333333, 1, 0, 1,
-0.9436713, 1.107358, -2.929384, 0.9254902, 1, 0, 1,
-0.9433972, -0.1968594, -2.873882, 0.9215686, 1, 0, 1,
-0.9354469, 1.250231, -1.193428, 0.9137255, 1, 0, 1,
-0.9305483, -0.4137216, -1.312597, 0.9098039, 1, 0, 1,
-0.9289696, 1.211326, 0.9001558, 0.9019608, 1, 0, 1,
-0.9279311, 0.4127213, 0.2994931, 0.8941177, 1, 0, 1,
-0.9123794, 0.1284634, -0.6499211, 0.8901961, 1, 0, 1,
-0.9105035, 1.376797, -1.011958, 0.8823529, 1, 0, 1,
-0.9066817, 1.340324, -0.131644, 0.8784314, 1, 0, 1,
-0.902968, 0.3791456, 0.2062486, 0.8705882, 1, 0, 1,
-0.8985741, -0.9624535, -0.7967365, 0.8666667, 1, 0, 1,
-0.8898719, 0.5152435, -0.2848689, 0.8588235, 1, 0, 1,
-0.8894987, 1.416862, 0.8887896, 0.854902, 1, 0, 1,
-0.8833668, -0.5144564, -2.443282, 0.8470588, 1, 0, 1,
-0.8828311, -1.564124, -0.8940825, 0.8431373, 1, 0, 1,
-0.8815898, -2.374794, -3.039613, 0.8352941, 1, 0, 1,
-0.8800468, -0.8145066, -2.641328, 0.8313726, 1, 0, 1,
-0.875367, -0.3925575, -1.569635, 0.8235294, 1, 0, 1,
-0.8705689, -0.4139025, -2.606161, 0.8196079, 1, 0, 1,
-0.8672235, 0.1482841, 1.059597, 0.8117647, 1, 0, 1,
-0.8666476, 1.163829, -0.1993156, 0.8078431, 1, 0, 1,
-0.8642549, -1.028884, -3.309448, 0.8, 1, 0, 1,
-0.8580899, -0.3379448, -0.7574713, 0.7921569, 1, 0, 1,
-0.8545676, -0.1273218, -1.557075, 0.7882353, 1, 0, 1,
-0.8514727, -1.342008, -2.616662, 0.7803922, 1, 0, 1,
-0.8504215, -2.184448, -3.151817, 0.7764706, 1, 0, 1,
-0.8458, -0.7101446, -2.797036, 0.7686275, 1, 0, 1,
-0.8455317, -0.7956049, -3.185955, 0.7647059, 1, 0, 1,
-0.8346995, 0.4577201, -1.062853, 0.7568628, 1, 0, 1,
-0.8336784, 1.394529, 0.7132024, 0.7529412, 1, 0, 1,
-0.8325759, -0.9629172, -0.992173, 0.7450981, 1, 0, 1,
-0.8323124, 0.6041651, -2.37648, 0.7411765, 1, 0, 1,
-0.8302414, 1.524121, -0.7413476, 0.7333333, 1, 0, 1,
-0.8244353, -0.5664437, -2.218936, 0.7294118, 1, 0, 1,
-0.8124764, -1.783982, -2.961774, 0.7215686, 1, 0, 1,
-0.7996021, -0.9838712, -2.838248, 0.7176471, 1, 0, 1,
-0.796014, -2.980163, -2.915374, 0.7098039, 1, 0, 1,
-0.7929975, 1.486438, 1.147011, 0.7058824, 1, 0, 1,
-0.7886647, 0.9397905, 0.6689166, 0.6980392, 1, 0, 1,
-0.7842981, 0.2450285, 0.5320278, 0.6901961, 1, 0, 1,
-0.7837286, 0.9644934, -0.5092782, 0.6862745, 1, 0, 1,
-0.7835141, -0.1564423, -0.04881792, 0.6784314, 1, 0, 1,
-0.7780319, -0.9898633, -1.489941, 0.6745098, 1, 0, 1,
-0.7747026, 2.794979, -0.3339461, 0.6666667, 1, 0, 1,
-0.7733828, -1.420091, -1.601843, 0.6627451, 1, 0, 1,
-0.7654935, -0.2210993, -0.3010387, 0.654902, 1, 0, 1,
-0.7633194, 2.063012, 1.177342, 0.6509804, 1, 0, 1,
-0.7602314, -0.6460758, -2.770637, 0.6431373, 1, 0, 1,
-0.7582, -0.04909698, -1.156533, 0.6392157, 1, 0, 1,
-0.7521262, -0.8194849, -1.78299, 0.6313726, 1, 0, 1,
-0.750986, 0.7493879, -3.115784, 0.627451, 1, 0, 1,
-0.7427635, -0.6275331, -3.947849, 0.6196079, 1, 0, 1,
-0.74119, -1.277321, -1.757979, 0.6156863, 1, 0, 1,
-0.740158, 0.9775662, -1.902165, 0.6078432, 1, 0, 1,
-0.7384344, 0.1520471, -2.424909, 0.6039216, 1, 0, 1,
-0.7373777, -1.428961, -4.705336, 0.5960785, 1, 0, 1,
-0.7348674, 0.1199923, -1.81868, 0.5882353, 1, 0, 1,
-0.7346787, 0.2980661, -3.186143, 0.5843138, 1, 0, 1,
-0.7331578, 2.572829, -0.09639899, 0.5764706, 1, 0, 1,
-0.7315384, 1.272511, -2.730151, 0.572549, 1, 0, 1,
-0.7307912, 0.1952519, -0.9874012, 0.5647059, 1, 0, 1,
-0.7302161, 0.4203639, -1.169928, 0.5607843, 1, 0, 1,
-0.7300798, -0.763242, -1.835184, 0.5529412, 1, 0, 1,
-0.728692, -1.315381, -3.890454, 0.5490196, 1, 0, 1,
-0.7264955, -0.07656697, -1.515707, 0.5411765, 1, 0, 1,
-0.7256611, 1.232858, -0.4253354, 0.5372549, 1, 0, 1,
-0.7256173, 1.215571, -1.647931, 0.5294118, 1, 0, 1,
-0.7255713, 0.6164014, -0.9726919, 0.5254902, 1, 0, 1,
-0.7252118, 1.124334, 0.696501, 0.5176471, 1, 0, 1,
-0.7249558, -1.087232, -2.880811, 0.5137255, 1, 0, 1,
-0.7231976, 0.07736266, -1.722701, 0.5058824, 1, 0, 1,
-0.7229692, -0.1779827, -1.145274, 0.5019608, 1, 0, 1,
-0.7229242, 1.028057, 0.8398937, 0.4941176, 1, 0, 1,
-0.7189321, 0.964909, 0.4836167, 0.4862745, 1, 0, 1,
-0.7158772, -1.394007, -1.402113, 0.4823529, 1, 0, 1,
-0.7122236, 0.20941, -1.607228, 0.4745098, 1, 0, 1,
-0.711516, -2.288018, -3.233269, 0.4705882, 1, 0, 1,
-0.7057799, 0.7196503, -0.6423592, 0.4627451, 1, 0, 1,
-0.6993815, -0.1827823, -1.654058, 0.4588235, 1, 0, 1,
-0.6970347, 0.4020989, -0.8350966, 0.4509804, 1, 0, 1,
-0.68549, -0.6151718, -1.667051, 0.4470588, 1, 0, 1,
-0.6832268, 0.7524043, -0.7677677, 0.4392157, 1, 0, 1,
-0.6790389, 0.8520195, -0.4859481, 0.4352941, 1, 0, 1,
-0.6755361, 0.549314, 0.1478352, 0.427451, 1, 0, 1,
-0.6725038, -0.8437932, -3.185178, 0.4235294, 1, 0, 1,
-0.6707191, -0.9657174, -4.426832, 0.4156863, 1, 0, 1,
-0.6557792, 0.6221555, -0.2997866, 0.4117647, 1, 0, 1,
-0.6554068, 1.435926, -2.203917, 0.4039216, 1, 0, 1,
-0.6526574, 1.130873, -0.4897744, 0.3960784, 1, 0, 1,
-0.6508825, 0.02388767, -1.950498, 0.3921569, 1, 0, 1,
-0.6505412, 0.7873178, -0.343971, 0.3843137, 1, 0, 1,
-0.6483605, 0.3297099, -2.040648, 0.3803922, 1, 0, 1,
-0.6435386, -1.287229, -3.683005, 0.372549, 1, 0, 1,
-0.6410111, -0.3791263, -1.126132, 0.3686275, 1, 0, 1,
-0.6377382, 0.3460047, -1.891459, 0.3607843, 1, 0, 1,
-0.6373105, -0.07206246, -1.297454, 0.3568628, 1, 0, 1,
-0.6348782, 0.2873527, -0.9594026, 0.3490196, 1, 0, 1,
-0.6291813, -1.150183, -2.987037, 0.345098, 1, 0, 1,
-0.6275542, 2.800469, -2.020533, 0.3372549, 1, 0, 1,
-0.6259983, -0.2513249, -1.077309, 0.3333333, 1, 0, 1,
-0.6259895, -1.252692, -3.734176, 0.3254902, 1, 0, 1,
-0.6235257, 0.6728835, -0.4169793, 0.3215686, 1, 0, 1,
-0.6220534, 1.548134, -1.168099, 0.3137255, 1, 0, 1,
-0.6088206, 0.008674698, -1.044283, 0.3098039, 1, 0, 1,
-0.6000657, 0.07565606, -0.2725472, 0.3019608, 1, 0, 1,
-0.5990825, -0.05840943, -1.555367, 0.2941177, 1, 0, 1,
-0.5969718, -1.022942, -1.750814, 0.2901961, 1, 0, 1,
-0.594084, -1.635475, -2.762426, 0.282353, 1, 0, 1,
-0.5932128, -0.01479767, -1.263273, 0.2784314, 1, 0, 1,
-0.5909888, -1.356115, -3.638265, 0.2705882, 1, 0, 1,
-0.5903167, -1.501082, -1.540506, 0.2666667, 1, 0, 1,
-0.5889784, 1.090634, -1.404558, 0.2588235, 1, 0, 1,
-0.5877404, -0.8237945, -2.649673, 0.254902, 1, 0, 1,
-0.5848755, -0.05691494, -1.31567, 0.2470588, 1, 0, 1,
-0.5846046, -1.083083, -3.631119, 0.2431373, 1, 0, 1,
-0.5726058, 0.7604241, 0.316886, 0.2352941, 1, 0, 1,
-0.5705369, 0.2603622, -1.720547, 0.2313726, 1, 0, 1,
-0.570439, -1.450464, -1.951463, 0.2235294, 1, 0, 1,
-0.5689046, -0.7910158, -3.959063, 0.2196078, 1, 0, 1,
-0.5633751, -0.1471238, -0.5051513, 0.2117647, 1, 0, 1,
-0.562493, -1.370773, -3.096426, 0.2078431, 1, 0, 1,
-0.5587645, -0.2015227, -3.500696, 0.2, 1, 0, 1,
-0.5582729, -1.433496, -3.074462, 0.1921569, 1, 0, 1,
-0.5524542, 1.373082, -0.08329364, 0.1882353, 1, 0, 1,
-0.5512838, 0.6142442, -0.8277829, 0.1803922, 1, 0, 1,
-0.5423188, 0.1280057, -2.056761, 0.1764706, 1, 0, 1,
-0.5414512, 2.111949, -0.908809, 0.1686275, 1, 0, 1,
-0.5406475, 1.364509, -1.681677, 0.1647059, 1, 0, 1,
-0.5366852, -0.9670371, -1.693086, 0.1568628, 1, 0, 1,
-0.5302615, 0.5554361, -2.684765, 0.1529412, 1, 0, 1,
-0.5174736, 0.4597009, -1.060649, 0.145098, 1, 0, 1,
-0.5152377, -0.3591081, -1.773678, 0.1411765, 1, 0, 1,
-0.5148399, 0.9375065, -0.3889169, 0.1333333, 1, 0, 1,
-0.5082173, 1.040959, -0.4429168, 0.1294118, 1, 0, 1,
-0.5059157, 0.682274, 0.09682462, 0.1215686, 1, 0, 1,
-0.5048081, -0.3148962, -3.962061, 0.1176471, 1, 0, 1,
-0.5026687, -1.098376, -2.578846, 0.1098039, 1, 0, 1,
-0.5015351, 0.3153075, 0.1306062, 0.1058824, 1, 0, 1,
-0.5005798, -1.007887, -2.430771, 0.09803922, 1, 0, 1,
-0.4999096, 0.9416237, -2.274017, 0.09019608, 1, 0, 1,
-0.4934433, -0.7437437, -3.344878, 0.08627451, 1, 0, 1,
-0.4864475, -0.494119, -1.760627, 0.07843138, 1, 0, 1,
-0.4859771, 1.813592, -0.1654809, 0.07450981, 1, 0, 1,
-0.4847949, -0.7797647, -3.441925, 0.06666667, 1, 0, 1,
-0.4780406, 0.6998338, -1.978336, 0.0627451, 1, 0, 1,
-0.4778661, -0.0436735, -2.74757, 0.05490196, 1, 0, 1,
-0.4776027, 1.497949, 0.4928395, 0.05098039, 1, 0, 1,
-0.477421, -2.164288, -3.851661, 0.04313726, 1, 0, 1,
-0.471698, -0.4994185, -3.201926, 0.03921569, 1, 0, 1,
-0.463318, 1.019023, 0.9682048, 0.03137255, 1, 0, 1,
-0.4629508, -0.3399529, -1.989586, 0.02745098, 1, 0, 1,
-0.4624898, 1.077568, -2.19383, 0.01960784, 1, 0, 1,
-0.4615607, -0.6522592, 0.01049183, 0.01568628, 1, 0, 1,
-0.4605182, 1.455682, 0.4008171, 0.007843138, 1, 0, 1,
-0.4601051, 0.7959976, 0.3900942, 0.003921569, 1, 0, 1,
-0.4584259, -0.4708791, -0.6837716, 0, 1, 0.003921569, 1,
-0.4552237, 1.132003, 0.7550208, 0, 1, 0.01176471, 1,
-0.4537529, 1.228426, -1.486361, 0, 1, 0.01568628, 1,
-0.4489403, -0.9041258, -1.878039, 0, 1, 0.02352941, 1,
-0.4464864, 0.22467, -1.170859, 0, 1, 0.02745098, 1,
-0.4450523, -0.8417075, -2.990515, 0, 1, 0.03529412, 1,
-0.4428059, -1.029672, -1.359472, 0, 1, 0.03921569, 1,
-0.4427918, -1.575614, -3.208951, 0, 1, 0.04705882, 1,
-0.4382503, 1.154969, -1.365438, 0, 1, 0.05098039, 1,
-0.4371642, -1.375904, -3.897841, 0, 1, 0.05882353, 1,
-0.4369462, -1.162521, -1.021722, 0, 1, 0.0627451, 1,
-0.434743, 0.7589159, -0.3563006, 0, 1, 0.07058824, 1,
-0.432072, -0.8704701, -3.383951, 0, 1, 0.07450981, 1,
-0.4290941, 0.3548056, -2.061578, 0, 1, 0.08235294, 1,
-0.4278271, 0.8848258, 0.638775, 0, 1, 0.08627451, 1,
-0.4277463, -0.1027703, -1.824729, 0, 1, 0.09411765, 1,
-0.4231737, 0.4346967, -0.8172248, 0, 1, 0.1019608, 1,
-0.4178006, 0.2459034, -2.376672, 0, 1, 0.1058824, 1,
-0.4123076, -1.865366, -1.78827, 0, 1, 0.1137255, 1,
-0.4106351, 0.6512193, -0.9793788, 0, 1, 0.1176471, 1,
-0.4065349, 0.4276915, -0.6141601, 0, 1, 0.1254902, 1,
-0.40646, 0.006165669, -2.00211, 0, 1, 0.1294118, 1,
-0.4053999, 0.7749006, -2.110946, 0, 1, 0.1372549, 1,
-0.4021317, 0.9804726, 0.1182871, 0, 1, 0.1411765, 1,
-0.3966578, 0.2009719, 0.2541921, 0, 1, 0.1490196, 1,
-0.3944773, 0.6505468, -1.015466, 0, 1, 0.1529412, 1,
-0.3937752, 0.3599822, -1.457026, 0, 1, 0.1607843, 1,
-0.3924695, -1.305042, -2.664605, 0, 1, 0.1647059, 1,
-0.3903399, 1.507908, -0.5493605, 0, 1, 0.172549, 1,
-0.3868724, 1.183548, 0.4593924, 0, 1, 0.1764706, 1,
-0.3840638, 2.205007, 0.9184031, 0, 1, 0.1843137, 1,
-0.3835725, 0.9656642, 0.4056244, 0, 1, 0.1882353, 1,
-0.3798277, 0.09132872, -1.602129, 0, 1, 0.1960784, 1,
-0.3768936, -1.408473, -3.44098, 0, 1, 0.2039216, 1,
-0.3762348, 1.411565, -0.9555672, 0, 1, 0.2078431, 1,
-0.3706006, -0.001275758, -2.205115, 0, 1, 0.2156863, 1,
-0.3697215, -1.016945, -3.445318, 0, 1, 0.2196078, 1,
-0.3691527, 0.2548868, -1.807613, 0, 1, 0.227451, 1,
-0.3608275, 0.3255476, -0.1801358, 0, 1, 0.2313726, 1,
-0.3546518, -0.1089219, -2.480489, 0, 1, 0.2392157, 1,
-0.3523335, -0.9173892, -3.168492, 0, 1, 0.2431373, 1,
-0.3440562, 0.09832638, -2.724375, 0, 1, 0.2509804, 1,
-0.3393621, -1.07508, -2.374667, 0, 1, 0.254902, 1,
-0.335227, -0.9551021, -4.314859, 0, 1, 0.2627451, 1,
-0.3316903, 0.7417715, 0.7432271, 0, 1, 0.2666667, 1,
-0.3304342, 1.659297, -0.5772386, 0, 1, 0.2745098, 1,
-0.3280055, -0.2009181, -3.265302, 0, 1, 0.2784314, 1,
-0.3245516, -0.006048101, -3.290663, 0, 1, 0.2862745, 1,
-0.3242552, -1.697675, -3.997587, 0, 1, 0.2901961, 1,
-0.3236425, 1.608476, -0.744991, 0, 1, 0.2980392, 1,
-0.3214551, 0.3608346, -0.3023371, 0, 1, 0.3058824, 1,
-0.3207698, -0.3869113, -2.186986, 0, 1, 0.3098039, 1,
-0.3189308, 0.4440326, -0.2734054, 0, 1, 0.3176471, 1,
-0.3188246, 1.134902, 0.7521278, 0, 1, 0.3215686, 1,
-0.3187701, -1.295419, -3.553371, 0, 1, 0.3294118, 1,
-0.3127336, 0.3981467, -1.204266, 0, 1, 0.3333333, 1,
-0.3076451, -2.062512, -2.085876, 0, 1, 0.3411765, 1,
-0.3068812, 0.6831272, -0.2268761, 0, 1, 0.345098, 1,
-0.3011542, 1.14723, -1.176733, 0, 1, 0.3529412, 1,
-0.3004392, 1.461514, 0.5385273, 0, 1, 0.3568628, 1,
-0.2984118, 1.622935, 0.8982484, 0, 1, 0.3647059, 1,
-0.2968169, 0.3169869, 0.781804, 0, 1, 0.3686275, 1,
-0.2923616, -0.8227655, -4.886927, 0, 1, 0.3764706, 1,
-0.2905508, -0.02083005, -2.4855, 0, 1, 0.3803922, 1,
-0.2904341, 1.065316, -2.127554, 0, 1, 0.3882353, 1,
-0.2870896, 1.021871, -1.21846, 0, 1, 0.3921569, 1,
-0.2870598, 0.1352832, -1.360767, 0, 1, 0.4, 1,
-0.2841684, -0.4363562, -5.187465, 0, 1, 0.4078431, 1,
-0.2828822, 0.02832014, -2.169075, 0, 1, 0.4117647, 1,
-0.2796812, 0.4418437, -1.221246, 0, 1, 0.4196078, 1,
-0.2720458, 0.3293113, -0.3114212, 0, 1, 0.4235294, 1,
-0.2703241, 0.4960559, 1.728258, 0, 1, 0.4313726, 1,
-0.2656458, 0.2053225, -1.799973, 0, 1, 0.4352941, 1,
-0.2630793, 0.9390399, -1.204649, 0, 1, 0.4431373, 1,
-0.2594732, 1.362197, 0.9252517, 0, 1, 0.4470588, 1,
-0.2535483, -1.635369, -2.815174, 0, 1, 0.454902, 1,
-0.2492197, -0.9541013, -3.218129, 0, 1, 0.4588235, 1,
-0.2491538, 0.4304013, -1.747339, 0, 1, 0.4666667, 1,
-0.2446912, 0.811332, -0.6054684, 0, 1, 0.4705882, 1,
-0.2412172, 1.948503, 1.331803, 0, 1, 0.4784314, 1,
-0.2409782, -0.1734323, -2.374677, 0, 1, 0.4823529, 1,
-0.2400752, 1.651913, 0.551991, 0, 1, 0.4901961, 1,
-0.2385936, 0.02010189, -1.171677, 0, 1, 0.4941176, 1,
-0.2363851, 1.020202, -2.282391, 0, 1, 0.5019608, 1,
-0.2339351, 1.231118, -2.114492, 0, 1, 0.509804, 1,
-0.2336358, 1.922975, -0.06381942, 0, 1, 0.5137255, 1,
-0.2321334, 0.5770502, 0.9706313, 0, 1, 0.5215687, 1,
-0.2258772, 0.2541474, -2.263098, 0, 1, 0.5254902, 1,
-0.2241415, -0.8337917, -2.617213, 0, 1, 0.5333334, 1,
-0.2225317, -0.6240966, -2.983634, 0, 1, 0.5372549, 1,
-0.2203515, 1.031454, -0.6335339, 0, 1, 0.5450981, 1,
-0.2200422, 1.340436, -1.66718, 0, 1, 0.5490196, 1,
-0.2192293, -1.0045, -3.732387, 0, 1, 0.5568628, 1,
-0.2183478, -0.008026266, -0.4767094, 0, 1, 0.5607843, 1,
-0.2138995, -0.7727014, -2.638003, 0, 1, 0.5686275, 1,
-0.2051197, 0.4424323, -0.8900237, 0, 1, 0.572549, 1,
-0.2033969, -1.717222, -4.220485, 0, 1, 0.5803922, 1,
-0.1985477, -0.3236932, -3.475124, 0, 1, 0.5843138, 1,
-0.1972281, -0.2349545, -1.603189, 0, 1, 0.5921569, 1,
-0.1955469, -0.3101345, -1.194811, 0, 1, 0.5960785, 1,
-0.1951076, -0.07701563, -2.794542, 0, 1, 0.6039216, 1,
-0.1867842, -0.9915676, -4.536316, 0, 1, 0.6117647, 1,
-0.1824463, 0.8669226, 0.9091408, 0, 1, 0.6156863, 1,
-0.17509, -0.3323684, -4.623493, 0, 1, 0.6235294, 1,
-0.1722219, 0.4791925, -0.4533367, 0, 1, 0.627451, 1,
-0.1699445, -1.678091, -3.922236, 0, 1, 0.6352941, 1,
-0.1621141, -1.01472, -2.491132, 0, 1, 0.6392157, 1,
-0.1593509, 0.2620291, 0.8866891, 0, 1, 0.6470588, 1,
-0.1526961, -0.9745376, -3.5096, 0, 1, 0.6509804, 1,
-0.1525937, 0.3939442, -1.413302, 0, 1, 0.6588235, 1,
-0.1493982, 1.653235, 0.1024388, 0, 1, 0.6627451, 1,
-0.1482708, 0.2227525, -0.3826023, 0, 1, 0.6705883, 1,
-0.1419986, 0.2369856, 0.1624433, 0, 1, 0.6745098, 1,
-0.1413352, -0.5933024, -2.575582, 0, 1, 0.682353, 1,
-0.1379829, 0.1529053, -2.001093, 0, 1, 0.6862745, 1,
-0.1358443, 0.1374422, -2.218348, 0, 1, 0.6941177, 1,
-0.1344881, -0.5717698, -3.462583, 0, 1, 0.7019608, 1,
-0.1343397, -0.6256557, -3.568943, 0, 1, 0.7058824, 1,
-0.130665, -0.415046, -3.722959, 0, 1, 0.7137255, 1,
-0.1296557, 1.691851, -1.063801, 0, 1, 0.7176471, 1,
-0.1264714, 0.4277353, -1.481992, 0, 1, 0.7254902, 1,
-0.1238313, -0.8748433, -1.705767, 0, 1, 0.7294118, 1,
-0.1175983, 0.6607606, 0.3565797, 0, 1, 0.7372549, 1,
-0.1154322, -0.006227524, -1.412994, 0, 1, 0.7411765, 1,
-0.1130246, 1.165089, -0.4388649, 0, 1, 0.7490196, 1,
-0.1102232, -2.148744, -3.11942, 0, 1, 0.7529412, 1,
-0.1092758, 0.6556802, -0.2133978, 0, 1, 0.7607843, 1,
-0.1041382, 0.240997, 0.6185339, 0, 1, 0.7647059, 1,
-0.1000538, -0.9723465, -2.559961, 0, 1, 0.772549, 1,
-0.0982184, -0.6571828, -4.188224, 0, 1, 0.7764706, 1,
-0.09646875, -2.870713, -1.390645, 0, 1, 0.7843137, 1,
-0.09562255, 0.1878692, -0.4904836, 0, 1, 0.7882353, 1,
-0.09440388, -0.2595947, -2.295502, 0, 1, 0.7960784, 1,
-0.0920945, 0.2861889, -1.827114, 0, 1, 0.8039216, 1,
-0.09114785, 0.5673556, 1.329089, 0, 1, 0.8078431, 1,
-0.0900363, 0.1817833, -0.5200503, 0, 1, 0.8156863, 1,
-0.08899049, 1.239157, -0.03868684, 0, 1, 0.8196079, 1,
-0.08664735, -0.4850785, -4.266074, 0, 1, 0.827451, 1,
-0.08468326, -0.3492859, -2.534439, 0, 1, 0.8313726, 1,
-0.08448823, 0.9876084, 0.8303681, 0, 1, 0.8392157, 1,
-0.08253518, 1.082548, -0.210227, 0, 1, 0.8431373, 1,
-0.07820059, 1.31212, 0.112297, 0, 1, 0.8509804, 1,
-0.07622883, 0.1641513, -0.588002, 0, 1, 0.854902, 1,
-0.0746251, -0.8499016, -3.895485, 0, 1, 0.8627451, 1,
-0.07257401, -0.34503, -3.429353, 0, 1, 0.8666667, 1,
-0.0718438, 1.278352, -0.5849195, 0, 1, 0.8745098, 1,
-0.0683576, 0.8671131, 0.6878076, 0, 1, 0.8784314, 1,
-0.06682938, 0.5279152, -1.963449, 0, 1, 0.8862745, 1,
-0.06363931, -0.6542951, -4.219445, 0, 1, 0.8901961, 1,
-0.05768706, -0.8675229, -4.93507, 0, 1, 0.8980392, 1,
-0.05499182, 1.52423, -0.9571625, 0, 1, 0.9058824, 1,
-0.05095049, 0.2652245, -1.278734, 0, 1, 0.9098039, 1,
-0.04813744, -0.6298816, -2.878255, 0, 1, 0.9176471, 1,
-0.04453857, -0.04631523, -0.08565902, 0, 1, 0.9215686, 1,
-0.03382714, 1.574683, -0.3522229, 0, 1, 0.9294118, 1,
-0.02920113, 0.1687276, -0.0329611, 0, 1, 0.9333333, 1,
-0.02378186, -0.1610959, -2.202521, 0, 1, 0.9411765, 1,
-0.02258196, 1.2131, -0.9598387, 0, 1, 0.945098, 1,
-0.01996879, 1.82714, 1.255461, 0, 1, 0.9529412, 1,
-0.01778865, -1.326422, -4.428676, 0, 1, 0.9568627, 1,
-0.01774571, -0.8890061, -3.640589, 0, 1, 0.9647059, 1,
-0.01467092, 0.6777614, 1.733711, 0, 1, 0.9686275, 1,
-0.01152847, -0.8614947, -3.435865, 0, 1, 0.9764706, 1,
-0.00670928, 0.8515275, 0.3410852, 0, 1, 0.9803922, 1,
-0.001177901, 2.375953, -0.0388108, 0, 1, 0.9882353, 1,
0.001071685, 0.1856285, 0.8154575, 0, 1, 0.9921569, 1,
0.002146848, -2.059574, 3.45348, 0, 1, 1, 1,
0.00392342, 0.1250817, 0.7981699, 0, 0.9921569, 1, 1,
0.005682528, -1.039374, 3.291739, 0, 0.9882353, 1, 1,
0.00982317, 0.301454, 1.533651, 0, 0.9803922, 1, 1,
0.01069032, 1.086363, -0.7006494, 0, 0.9764706, 1, 1,
0.01169408, -2.99791, 1.792263, 0, 0.9686275, 1, 1,
0.01474911, 0.333426, -0.1240885, 0, 0.9647059, 1, 1,
0.01624126, 0.06582433, -0.4762367, 0, 0.9568627, 1, 1,
0.01927795, -0.1879782, 3.369512, 0, 0.9529412, 1, 1,
0.02053459, 0.04324804, 0.8196814, 0, 0.945098, 1, 1,
0.02812575, 0.2237345, 1.188732, 0, 0.9411765, 1, 1,
0.02841635, -3.071105, 2.358523, 0, 0.9333333, 1, 1,
0.03035483, -0.6399505, 1.764677, 0, 0.9294118, 1, 1,
0.03053634, -1.380333, 4.225504, 0, 0.9215686, 1, 1,
0.04080273, 0.5110334, -0.02325286, 0, 0.9176471, 1, 1,
0.04439764, 1.370854, 0.3520553, 0, 0.9098039, 1, 1,
0.04847654, 0.2883624, 0.4735793, 0, 0.9058824, 1, 1,
0.04883567, 1.719209, 0.4994182, 0, 0.8980392, 1, 1,
0.05155127, 0.3146655, 0.9944743, 0, 0.8901961, 1, 1,
0.05389765, 0.9783916, 1.674296, 0, 0.8862745, 1, 1,
0.05557943, 0.2463976, -0.9697646, 0, 0.8784314, 1, 1,
0.05692781, -0.02994578, 1.631445, 0, 0.8745098, 1, 1,
0.06093358, 0.1115098, 1.515764, 0, 0.8666667, 1, 1,
0.06127084, 1.78078, 0.6018661, 0, 0.8627451, 1, 1,
0.07073033, -0.3089862, 2.385363, 0, 0.854902, 1, 1,
0.07230458, 1.464589, 0.4559183, 0, 0.8509804, 1, 1,
0.07514223, -1.930589, 2.566938, 0, 0.8431373, 1, 1,
0.07572629, 2.289856, -0.3025714, 0, 0.8392157, 1, 1,
0.07618123, 0.7491783, -0.04490614, 0, 0.8313726, 1, 1,
0.07900875, 0.2749854, 2.481402, 0, 0.827451, 1, 1,
0.08111346, -0.9114196, 3.879721, 0, 0.8196079, 1, 1,
0.08287574, 0.798582, -0.3856855, 0, 0.8156863, 1, 1,
0.08992707, -0.08211147, 2.826674, 0, 0.8078431, 1, 1,
0.09170302, 0.4442529, -0.5637425, 0, 0.8039216, 1, 1,
0.09447876, 0.7911838, 1.044866, 0, 0.7960784, 1, 1,
0.09454836, 1.498422, -1.438124, 0, 0.7882353, 1, 1,
0.1058295, -1.254297, 3.680627, 0, 0.7843137, 1, 1,
0.1058609, -1.00323, 4.686429, 0, 0.7764706, 1, 1,
0.1096495, -1.094244, 3.243448, 0, 0.772549, 1, 1,
0.1115182, -0.3657268, 2.416836, 0, 0.7647059, 1, 1,
0.1127333, 1.575143, -2.540633, 0, 0.7607843, 1, 1,
0.1202165, 0.4662653, 0.4344091, 0, 0.7529412, 1, 1,
0.1206914, -0.1946247, 1.439829, 0, 0.7490196, 1, 1,
0.1227512, 0.4842534, 1.174276, 0, 0.7411765, 1, 1,
0.1272066, -0.5115782, 2.04585, 0, 0.7372549, 1, 1,
0.1322067, -0.7862234, 3.604437, 0, 0.7294118, 1, 1,
0.134392, 0.3137164, 1.30142, 0, 0.7254902, 1, 1,
0.1349284, 1.033798, -0.9960437, 0, 0.7176471, 1, 1,
0.1351735, 0.07216711, 0.9015789, 0, 0.7137255, 1, 1,
0.1402837, -0.1704539, 2.14078, 0, 0.7058824, 1, 1,
0.1445607, -0.373616, 3.426017, 0, 0.6980392, 1, 1,
0.1450294, -1.917877, 4.756493, 0, 0.6941177, 1, 1,
0.145331, 0.5618673, -0.9013855, 0, 0.6862745, 1, 1,
0.1530844, -0.08382369, -0.07859304, 0, 0.682353, 1, 1,
0.1536585, -0.846522, 3.668391, 0, 0.6745098, 1, 1,
0.1566335, 0.5617141, 1.013478, 0, 0.6705883, 1, 1,
0.1587659, 0.487231, 1.511246, 0, 0.6627451, 1, 1,
0.1602987, -1.46388, 1.724411, 0, 0.6588235, 1, 1,
0.1621543, -0.4574535, 1.268886, 0, 0.6509804, 1, 1,
0.1645204, 0.1376005, 1.528175, 0, 0.6470588, 1, 1,
0.1655793, -0.02211223, 1.422702, 0, 0.6392157, 1, 1,
0.1686995, -1.203173, 2.76798, 0, 0.6352941, 1, 1,
0.1690882, 0.7209504, 1.593371, 0, 0.627451, 1, 1,
0.1704709, -0.09243214, 1.395849, 0, 0.6235294, 1, 1,
0.1721371, 0.9460667, 1.476549, 0, 0.6156863, 1, 1,
0.1742599, -0.5806491, 5.336206, 0, 0.6117647, 1, 1,
0.1750757, 0.1102044, 1.296115, 0, 0.6039216, 1, 1,
0.1785273, -0.7757881, 1.803538, 0, 0.5960785, 1, 1,
0.1794714, 1.842678, 1.077502, 0, 0.5921569, 1, 1,
0.1809713, 1.212364, 0.3185089, 0, 0.5843138, 1, 1,
0.1888073, 0.6357322, 0.4395783, 0, 0.5803922, 1, 1,
0.1920592, -1.800212, 4.925317, 0, 0.572549, 1, 1,
0.192704, 0.2434396, 1.569492, 0, 0.5686275, 1, 1,
0.1950475, 0.455809, -0.6630525, 0, 0.5607843, 1, 1,
0.1997238, 1.421276, -0.4024136, 0, 0.5568628, 1, 1,
0.2007323, 1.367326, 0.7657361, 0, 0.5490196, 1, 1,
0.2020983, -2.094419, 2.535072, 0, 0.5450981, 1, 1,
0.2026389, -1.246164, 3.102485, 0, 0.5372549, 1, 1,
0.2069629, 0.6298228, -0.4337718, 0, 0.5333334, 1, 1,
0.2079239, 1.306957, -0.04371309, 0, 0.5254902, 1, 1,
0.210488, -0.4365275, -0.5478581, 0, 0.5215687, 1, 1,
0.2125339, 0.5472577, -0.3739945, 0, 0.5137255, 1, 1,
0.2186233, 1.21031, 1.107803, 0, 0.509804, 1, 1,
0.2203395, 0.3809283, 0.9244109, 0, 0.5019608, 1, 1,
0.2238617, 0.8206959, -0.5802826, 0, 0.4941176, 1, 1,
0.224744, 2.042267, -0.1545156, 0, 0.4901961, 1, 1,
0.2281834, 1.181429, -1.74704, 0, 0.4823529, 1, 1,
0.2297761, -1.608189, 3.410286, 0, 0.4784314, 1, 1,
0.2322093, 0.07993249, 2.789675, 0, 0.4705882, 1, 1,
0.241996, -1.452516, 2.781446, 0, 0.4666667, 1, 1,
0.2494441, 1.503557, -0.09155755, 0, 0.4588235, 1, 1,
0.2507301, 0.04162682, 2.591123, 0, 0.454902, 1, 1,
0.2521205, -0.1531888, 0.4422083, 0, 0.4470588, 1, 1,
0.255691, -0.8054435, 2.829922, 0, 0.4431373, 1, 1,
0.2564296, -0.1269865, 3.963544, 0, 0.4352941, 1, 1,
0.2564611, -0.03667924, 1.156387, 0, 0.4313726, 1, 1,
0.2613901, -0.007125071, 0.955849, 0, 0.4235294, 1, 1,
0.2675117, 0.4746907, 0.1594411, 0, 0.4196078, 1, 1,
0.2691216, -0.5702158, 2.087272, 0, 0.4117647, 1, 1,
0.2691684, -1.117393, 1.943473, 0, 0.4078431, 1, 1,
0.2705632, -0.9770986, 3.662859, 0, 0.4, 1, 1,
0.270835, -0.7288049, 2.839005, 0, 0.3921569, 1, 1,
0.2709265, 0.4386706, -0.3924133, 0, 0.3882353, 1, 1,
0.2769834, -1.533374, 2.865131, 0, 0.3803922, 1, 1,
0.278484, -0.5536854, 1.414267, 0, 0.3764706, 1, 1,
0.2785558, 2.0489, -0.1648003, 0, 0.3686275, 1, 1,
0.2854487, -0.5377991, 1.637345, 0, 0.3647059, 1, 1,
0.2855191, -0.6479312, 2.299275, 0, 0.3568628, 1, 1,
0.2870067, -1.248346, 3.471969, 0, 0.3529412, 1, 1,
0.2928788, -1.639429, 2.573056, 0, 0.345098, 1, 1,
0.2938119, -1.685368, 4.207554, 0, 0.3411765, 1, 1,
0.2971948, -0.256868, 2.436095, 0, 0.3333333, 1, 1,
0.3023373, -0.6610074, 2.530209, 0, 0.3294118, 1, 1,
0.3113986, 0.7592881, 0.4137855, 0, 0.3215686, 1, 1,
0.314768, 1.047412, -0.5621462, 0, 0.3176471, 1, 1,
0.3166535, -0.8742178, 3.059132, 0, 0.3098039, 1, 1,
0.3198704, -2.176782, 2.423515, 0, 0.3058824, 1, 1,
0.3200313, 0.3697201, 0.4421751, 0, 0.2980392, 1, 1,
0.3249085, 0.1416933, -0.9333274, 0, 0.2901961, 1, 1,
0.3272948, -0.6601923, 3.308546, 0, 0.2862745, 1, 1,
0.3312649, -0.6730543, 3.250195, 0, 0.2784314, 1, 1,
0.3314656, -2.187534, 2.53838, 0, 0.2745098, 1, 1,
0.3316749, -0.3249134, 3.33801, 0, 0.2666667, 1, 1,
0.3331583, -1.375275, 4.415274, 0, 0.2627451, 1, 1,
0.3338778, -0.4441886, 2.608931, 0, 0.254902, 1, 1,
0.3344057, 0.3832539, 0.5290197, 0, 0.2509804, 1, 1,
0.3366726, 0.2993907, -0.9559388, 0, 0.2431373, 1, 1,
0.3409233, 1.325444, 0.8713909, 0, 0.2392157, 1, 1,
0.3424056, -0.47345, 3.595114, 0, 0.2313726, 1, 1,
0.3433316, -0.4251464, -0.5923702, 0, 0.227451, 1, 1,
0.3472593, -0.09722056, 2.683298, 0, 0.2196078, 1, 1,
0.3485302, -1.189787, 2.565353, 0, 0.2156863, 1, 1,
0.3494942, -1.692859, 3.373787, 0, 0.2078431, 1, 1,
0.3543966, 1.274871, 1.442143, 0, 0.2039216, 1, 1,
0.3607079, -0.2750873, 2.697822, 0, 0.1960784, 1, 1,
0.361216, 0.08402236, 1.988839, 0, 0.1882353, 1, 1,
0.3633798, -1.45828, 1.237128, 0, 0.1843137, 1, 1,
0.3669497, 1.212753, 0.01041702, 0, 0.1764706, 1, 1,
0.3687252, -0.1009439, 0.9071293, 0, 0.172549, 1, 1,
0.373073, -0.07316134, 2.678268, 0, 0.1647059, 1, 1,
0.3770473, 0.6523194, -0.6035042, 0, 0.1607843, 1, 1,
0.3792537, -2.189109, 4.071693, 0, 0.1529412, 1, 1,
0.3809168, -2.041097, 2.644059, 0, 0.1490196, 1, 1,
0.3830226, 1.416718, -0.7948213, 0, 0.1411765, 1, 1,
0.3831446, 0.1996496, 2.100087, 0, 0.1372549, 1, 1,
0.3915644, 0.332132, 0.7648759, 0, 0.1294118, 1, 1,
0.3917893, -0.1320943, 2.952515, 0, 0.1254902, 1, 1,
0.4003902, 1.777849, 0.7163523, 0, 0.1176471, 1, 1,
0.4008761, -1.528905, 3.441357, 0, 0.1137255, 1, 1,
0.4011867, -1.412827, 1.050476, 0, 0.1058824, 1, 1,
0.4022847, 0.05035662, 2.354335, 0, 0.09803922, 1, 1,
0.4036676, 0.2543227, 1.315293, 0, 0.09411765, 1, 1,
0.4063855, -0.4050691, 2.96672, 0, 0.08627451, 1, 1,
0.40836, -1.10192, 3.137686, 0, 0.08235294, 1, 1,
0.4103326, 0.3808035, 1.251294, 0, 0.07450981, 1, 1,
0.4188028, -0.5136423, 3.366336, 0, 0.07058824, 1, 1,
0.4214675, -0.4539986, 2.135337, 0, 0.0627451, 1, 1,
0.4219795, 0.7441651, -0.133078, 0, 0.05882353, 1, 1,
0.4240631, 1.291812, -0.6743143, 0, 0.05098039, 1, 1,
0.4255862, -0.3932819, 2.089833, 0, 0.04705882, 1, 1,
0.4407933, 1.299613, 0.9007425, 0, 0.03921569, 1, 1,
0.4490334, -1.40574, 1.758142, 0, 0.03529412, 1, 1,
0.450029, 2.165471, -0.4950672, 0, 0.02745098, 1, 1,
0.4518209, 1.788655, 0.9575779, 0, 0.02352941, 1, 1,
0.4547907, 0.2934373, 1.306271, 0, 0.01568628, 1, 1,
0.4563703, 0.1657505, 1.468398, 0, 0.01176471, 1, 1,
0.4568006, 1.182036, 0.4730878, 0, 0.003921569, 1, 1,
0.4629469, 0.5927921, 0.6920488, 0.003921569, 0, 1, 1,
0.4642301, -0.8089885, 3.378967, 0.007843138, 0, 1, 1,
0.4643239, 0.3053034, -0.02877425, 0.01568628, 0, 1, 1,
0.4646382, -0.0593562, 1.769511, 0.01960784, 0, 1, 1,
0.4707792, 0.007326826, 0.9099013, 0.02745098, 0, 1, 1,
0.4720587, 1.552253, -0.3671932, 0.03137255, 0, 1, 1,
0.4731592, 0.4724386, -1.126515, 0.03921569, 0, 1, 1,
0.4763519, 1.659515, 0.2928626, 0.04313726, 0, 1, 1,
0.478261, -2.473921, 3.354709, 0.05098039, 0, 1, 1,
0.4792882, -0.6897852, 2.881402, 0.05490196, 0, 1, 1,
0.4845738, -1.55578, 1.401745, 0.0627451, 0, 1, 1,
0.491098, -1.592146, 3.432878, 0.06666667, 0, 1, 1,
0.4991741, -0.03382911, 2.024526, 0.07450981, 0, 1, 1,
0.5005851, 0.1101954, 2.262663, 0.07843138, 0, 1, 1,
0.5012196, 0.4117408, 1.203778, 0.08627451, 0, 1, 1,
0.5041456, 0.1049352, 1.360156, 0.09019608, 0, 1, 1,
0.5074464, -0.3881789, 1.327334, 0.09803922, 0, 1, 1,
0.5094075, -0.6598153, 3.149639, 0.1058824, 0, 1, 1,
0.5113809, -1.423976, 3.125888, 0.1098039, 0, 1, 1,
0.5184151, 0.1555268, 1.858263, 0.1176471, 0, 1, 1,
0.5195961, -2.047795, 3.502067, 0.1215686, 0, 1, 1,
0.5252982, -1.380355, 2.936008, 0.1294118, 0, 1, 1,
0.5291339, -0.2719927, 2.540904, 0.1333333, 0, 1, 1,
0.537025, 0.9105482, -1.137556, 0.1411765, 0, 1, 1,
0.5371454, -1.130661, 2.246296, 0.145098, 0, 1, 1,
0.5437655, 1.84174, 1.534191, 0.1529412, 0, 1, 1,
0.5441568, -0.1295666, 0.9138561, 0.1568628, 0, 1, 1,
0.544831, -1.88112, 3.985067, 0.1647059, 0, 1, 1,
0.5478816, -1.6996, 1.194921, 0.1686275, 0, 1, 1,
0.5487669, -1.000888, 2.544602, 0.1764706, 0, 1, 1,
0.5537286, -0.241526, 2.082602, 0.1803922, 0, 1, 1,
0.5545694, -1.702775, 1.048576, 0.1882353, 0, 1, 1,
0.5550771, -0.9067258, -0.237229, 0.1921569, 0, 1, 1,
0.5587865, -0.5629208, 2.168247, 0.2, 0, 1, 1,
0.5601286, -0.4252026, 0.8298871, 0.2078431, 0, 1, 1,
0.5606692, 0.6558006, 1.604537, 0.2117647, 0, 1, 1,
0.565378, 2.448396, 0.7297839, 0.2196078, 0, 1, 1,
0.5713814, -1.016332, 1.88355, 0.2235294, 0, 1, 1,
0.5724714, 0.8226718, 0.847813, 0.2313726, 0, 1, 1,
0.575847, -1.842672, 2.261515, 0.2352941, 0, 1, 1,
0.5776296, -0.0241317, 2.980631, 0.2431373, 0, 1, 1,
0.5807794, -0.301647, 2.236461, 0.2470588, 0, 1, 1,
0.5855874, 0.8966968, 0.882253, 0.254902, 0, 1, 1,
0.5858091, -1.070961, 2.814872, 0.2588235, 0, 1, 1,
0.5918322, -1.240367, 4.114673, 0.2666667, 0, 1, 1,
0.5933546, 0.5425233, 0.828048, 0.2705882, 0, 1, 1,
0.5964711, -0.4590262, 2.665094, 0.2784314, 0, 1, 1,
0.5970863, -0.6771577, 3.723598, 0.282353, 0, 1, 1,
0.5976174, 1.251459, -0.7612503, 0.2901961, 0, 1, 1,
0.5988284, 1.563587, 1.632592, 0.2941177, 0, 1, 1,
0.599034, -0.9470425, 2.643375, 0.3019608, 0, 1, 1,
0.5994039, -0.4511421, 3.171235, 0.3098039, 0, 1, 1,
0.6155302, 1.166809, 1.385124, 0.3137255, 0, 1, 1,
0.6155885, -0.1190238, 0.9736259, 0.3215686, 0, 1, 1,
0.6167591, 0.6088108, 0.6842858, 0.3254902, 0, 1, 1,
0.6195864, -1.119299, 2.364109, 0.3333333, 0, 1, 1,
0.6215996, -1.515087, 3.41708, 0.3372549, 0, 1, 1,
0.6278322, 0.775991, 0.5858516, 0.345098, 0, 1, 1,
0.630533, -0.03591483, -1.357691, 0.3490196, 0, 1, 1,
0.6329529, 0.6980215, -0.3457772, 0.3568628, 0, 1, 1,
0.6379388, 0.2360931, 0.8792772, 0.3607843, 0, 1, 1,
0.6409448, 1.291955, 1.2374, 0.3686275, 0, 1, 1,
0.6436168, 0.2717567, 2.103795, 0.372549, 0, 1, 1,
0.6448414, -0.4043228, 0.6783552, 0.3803922, 0, 1, 1,
0.6450766, 0.002999855, 1.05964, 0.3843137, 0, 1, 1,
0.6454671, 1.493296, 0.3293314, 0.3921569, 0, 1, 1,
0.6508284, 0.2392463, 2.537126, 0.3960784, 0, 1, 1,
0.6556096, 0.5178953, 1.654266, 0.4039216, 0, 1, 1,
0.6574548, -0.6547198, 1.408383, 0.4117647, 0, 1, 1,
0.6589377, 1.651118, 0.1456287, 0.4156863, 0, 1, 1,
0.6604639, 0.9022727, 0.6861296, 0.4235294, 0, 1, 1,
0.6655082, -0.8367597, 1.869383, 0.427451, 0, 1, 1,
0.6682371, 0.5823604, 0.318121, 0.4352941, 0, 1, 1,
0.6686265, 0.07256273, 1.180123, 0.4392157, 0, 1, 1,
0.6705276, -0.7985033, 3.90519, 0.4470588, 0, 1, 1,
0.6722205, 0.5228751, 1.211661, 0.4509804, 0, 1, 1,
0.6772112, -0.382462, 2.045446, 0.4588235, 0, 1, 1,
0.6816249, -0.7871021, 2.966623, 0.4627451, 0, 1, 1,
0.6886473, 0.03984105, 2.860234, 0.4705882, 0, 1, 1,
0.6895407, -0.3509776, 2.180433, 0.4745098, 0, 1, 1,
0.6921132, 1.232485, 2.333153, 0.4823529, 0, 1, 1,
0.6947623, -0.9465327, 2.873162, 0.4862745, 0, 1, 1,
0.6965929, 0.5630739, 0.4430645, 0.4941176, 0, 1, 1,
0.7027013, -0.02941461, 2.731994, 0.5019608, 0, 1, 1,
0.7038467, -1.832914, 2.097586, 0.5058824, 0, 1, 1,
0.7076148, 1.705982, 0.5743234, 0.5137255, 0, 1, 1,
0.7138658, -0.2519954, 0.1862332, 0.5176471, 0, 1, 1,
0.7155997, 0.1178597, 2.508958, 0.5254902, 0, 1, 1,
0.7208955, -0.5505424, 2.169906, 0.5294118, 0, 1, 1,
0.7251862, -0.3531622, 1.070169, 0.5372549, 0, 1, 1,
0.7296976, 1.670774, 0.4322511, 0.5411765, 0, 1, 1,
0.7338813, -1.497563, 4.002644, 0.5490196, 0, 1, 1,
0.7340301, -0.1827888, 1.359529, 0.5529412, 0, 1, 1,
0.7364347, 0.7290412, 0.4787849, 0.5607843, 0, 1, 1,
0.7368222, -0.1116693, 2.278878, 0.5647059, 0, 1, 1,
0.7437533, -0.6842665, 3.40834, 0.572549, 0, 1, 1,
0.744045, 0.4010246, 2.223783, 0.5764706, 0, 1, 1,
0.7557589, -0.001610741, 1.467339, 0.5843138, 0, 1, 1,
0.7575135, 1.041906, -0.806329, 0.5882353, 0, 1, 1,
0.7594768, -1.032604, 2.398767, 0.5960785, 0, 1, 1,
0.7639832, -0.01223352, 1.23757, 0.6039216, 0, 1, 1,
0.7724458, 0.5009459, 0.4020197, 0.6078432, 0, 1, 1,
0.7756203, -1.120734, 3.459489, 0.6156863, 0, 1, 1,
0.7796221, -0.02969877, 2.033695, 0.6196079, 0, 1, 1,
0.7839241, 0.5383102, 0.9499076, 0.627451, 0, 1, 1,
0.7890986, -0.3464382, 1.80093, 0.6313726, 0, 1, 1,
0.7998716, -0.5602113, 1.125285, 0.6392157, 0, 1, 1,
0.800583, -0.02742775, 1.79428, 0.6431373, 0, 1, 1,
0.8065855, -0.351736, 1.485535, 0.6509804, 0, 1, 1,
0.8074394, 0.2248363, 0.213972, 0.654902, 0, 1, 1,
0.8107598, -1.211108, 3.764636, 0.6627451, 0, 1, 1,
0.8166879, 0.6120175, 1.531028, 0.6666667, 0, 1, 1,
0.8168067, -0.1597086, 0.5169526, 0.6745098, 0, 1, 1,
0.8175492, -0.127197, 2.72821, 0.6784314, 0, 1, 1,
0.8204811, -2.299337, 1.521714, 0.6862745, 0, 1, 1,
0.8243396, -1.092151, 2.833572, 0.6901961, 0, 1, 1,
0.8324, -0.9506921, 2.294327, 0.6980392, 0, 1, 1,
0.8444531, 0.4177373, 1.812562, 0.7058824, 0, 1, 1,
0.8478434, 1.692453, -0.08066796, 0.7098039, 0, 1, 1,
0.8536807, -2.004993, 2.121864, 0.7176471, 0, 1, 1,
0.8538377, 0.7349768, 0.3766983, 0.7215686, 0, 1, 1,
0.8560501, -1.331339, 2.775599, 0.7294118, 0, 1, 1,
0.8585399, -0.1908445, 1.959608, 0.7333333, 0, 1, 1,
0.8634816, 2.045896, -0.475079, 0.7411765, 0, 1, 1,
0.8650686, -0.02652242, 1.472063, 0.7450981, 0, 1, 1,
0.8674983, 0.4091444, 2.282144, 0.7529412, 0, 1, 1,
0.872065, -0.1371176, 2.382347, 0.7568628, 0, 1, 1,
0.8720902, 0.9246255, 1.840114, 0.7647059, 0, 1, 1,
0.8735766, -0.1520496, 1.712821, 0.7686275, 0, 1, 1,
0.877876, 1.87606, 0.07932144, 0.7764706, 0, 1, 1,
0.8810337, -0.4605307, 0.7843566, 0.7803922, 0, 1, 1,
0.8854803, -0.8356042, 2.716874, 0.7882353, 0, 1, 1,
0.8875024, 0.1246224, 2.969179, 0.7921569, 0, 1, 1,
0.9024716, 0.03352181, 1.286083, 0.8, 0, 1, 1,
0.9031175, -0.4791646, 0.8054852, 0.8078431, 0, 1, 1,
0.9056427, 0.4805675, 1.528014, 0.8117647, 0, 1, 1,
0.9099978, -0.7917965, 2.411685, 0.8196079, 0, 1, 1,
0.9105764, 0.2694011, 2.05836, 0.8235294, 0, 1, 1,
0.9226764, -0.07342557, 0.9904627, 0.8313726, 0, 1, 1,
0.929021, 0.7854055, 0.8341447, 0.8352941, 0, 1, 1,
0.9384031, -1.675676, 3.239892, 0.8431373, 0, 1, 1,
0.9439595, 0.6223757, 1.802648, 0.8470588, 0, 1, 1,
0.9470413, -0.3558681, 1.404017, 0.854902, 0, 1, 1,
0.948299, -0.474579, -1.10305, 0.8588235, 0, 1, 1,
0.9503831, -1.1825, 1.799343, 0.8666667, 0, 1, 1,
0.9528867, 0.2628295, 1.688081, 0.8705882, 0, 1, 1,
0.9534191, -0.1099009, 2.093707, 0.8784314, 0, 1, 1,
0.959477, 0.1261222, 2.118211, 0.8823529, 0, 1, 1,
0.9701219, -0.6011963, 2.235498, 0.8901961, 0, 1, 1,
0.9735866, 0.3197489, 0.7968895, 0.8941177, 0, 1, 1,
0.9739625, -0.1153536, 0.7534823, 0.9019608, 0, 1, 1,
0.9759958, -1.737635, 3.430948, 0.9098039, 0, 1, 1,
0.9791834, 1.88387, -0.649484, 0.9137255, 0, 1, 1,
0.9814475, -1.469911, 2.455325, 0.9215686, 0, 1, 1,
0.984106, 1.373027, 2.617306, 0.9254902, 0, 1, 1,
0.9928545, 0.1899007, 1.784111, 0.9333333, 0, 1, 1,
0.9930229, 1.075084, 1.028742, 0.9372549, 0, 1, 1,
0.994715, -0.3567092, 3.400306, 0.945098, 0, 1, 1,
0.9986075, 0.7683045, 0.5424092, 0.9490196, 0, 1, 1,
1.010138, 0.2505826, 2.740578, 0.9568627, 0, 1, 1,
1.011528, -0.9678981, 3.769302, 0.9607843, 0, 1, 1,
1.013437, 1.121222, 0.9474893, 0.9686275, 0, 1, 1,
1.022573, -0.05666156, 0.6073776, 0.972549, 0, 1, 1,
1.023614, -1.201384, 1.088683, 0.9803922, 0, 1, 1,
1.031333, 1.135007, 0.4436477, 0.9843137, 0, 1, 1,
1.03665, -0.7547444, 1.151634, 0.9921569, 0, 1, 1,
1.041805, -0.0129528, 2.88035, 0.9960784, 0, 1, 1,
1.043317, 0.8628496, 0.2456336, 1, 0, 0.9960784, 1,
1.045193, -1.353566, 2.38702, 1, 0, 0.9882353, 1,
1.045438, 0.6066004, 0.6334159, 1, 0, 0.9843137, 1,
1.049304, -0.4906247, 0.9357243, 1, 0, 0.9764706, 1,
1.052046, -2.280741, 3.216345, 1, 0, 0.972549, 1,
1.052223, -0.4035744, 2.301857, 1, 0, 0.9647059, 1,
1.05617, 1.330354, 0.1727456, 1, 0, 0.9607843, 1,
1.06433, 0.2118257, 2.2511, 1, 0, 0.9529412, 1,
1.065194, -0.0816895, 0.350197, 1, 0, 0.9490196, 1,
1.065355, -0.8378755, 0.9741035, 1, 0, 0.9411765, 1,
1.065426, -0.6705987, 2.824636, 1, 0, 0.9372549, 1,
1.066213, -2.49052, 4.894493, 1, 0, 0.9294118, 1,
1.068846, 0.06542537, 1.808693, 1, 0, 0.9254902, 1,
1.07176, 0.3358324, 2.119622, 1, 0, 0.9176471, 1,
1.084369, 0.2792884, 1.292123, 1, 0, 0.9137255, 1,
1.089459, -0.2592072, 1.863475, 1, 0, 0.9058824, 1,
1.098428, -1.012206, 3.546499, 1, 0, 0.9019608, 1,
1.100497, 0.2609784, 2.353565, 1, 0, 0.8941177, 1,
1.103833, -1.732143, 2.886156, 1, 0, 0.8862745, 1,
1.104987, -1.56204, 3.236214, 1, 0, 0.8823529, 1,
1.107235, 1.006489, 1.119502, 1, 0, 0.8745098, 1,
1.108693, 0.8317074, -0.88397, 1, 0, 0.8705882, 1,
1.109124, -0.9460362, 3.780112, 1, 0, 0.8627451, 1,
1.113127, 2.552088, -1.263583, 1, 0, 0.8588235, 1,
1.115607, -1.046338, 3.41246, 1, 0, 0.8509804, 1,
1.115785, -0.364246, 2.715542, 1, 0, 0.8470588, 1,
1.120609, -0.7702278, 2.275015, 1, 0, 0.8392157, 1,
1.122638, -1.198178, 0.6876476, 1, 0, 0.8352941, 1,
1.123148, 0.4367022, 2.497787, 1, 0, 0.827451, 1,
1.126271, -0.5615014, 0.4899332, 1, 0, 0.8235294, 1,
1.142002, 0.2476811, 0.6370941, 1, 0, 0.8156863, 1,
1.144522, 2.22179, -1.103134, 1, 0, 0.8117647, 1,
1.145638, 0.2251339, 1.157339, 1, 0, 0.8039216, 1,
1.153175, 0.5084691, 2.319948, 1, 0, 0.7960784, 1,
1.154202, -1.001327, 1.514223, 1, 0, 0.7921569, 1,
1.154872, -0.4685619, 2.645966, 1, 0, 0.7843137, 1,
1.162523, -0.1201998, -0.02894883, 1, 0, 0.7803922, 1,
1.162807, -1.089093, 1.79023, 1, 0, 0.772549, 1,
1.163905, 1.26567, 1.588502, 1, 0, 0.7686275, 1,
1.172217, 0.04377395, 1.776812, 1, 0, 0.7607843, 1,
1.17694, -0.2945892, 1.798253, 1, 0, 0.7568628, 1,
1.177704, -0.865084, 2.798966, 1, 0, 0.7490196, 1,
1.191067, 0.04811158, 0.4291175, 1, 0, 0.7450981, 1,
1.214498, 1.015731, 2.268119, 1, 0, 0.7372549, 1,
1.219154, -0.9020005, 3.509531, 1, 0, 0.7333333, 1,
1.222969, -0.4630934, 3.236617, 1, 0, 0.7254902, 1,
1.224469, 1.202692, -0.3537007, 1, 0, 0.7215686, 1,
1.225446, 1.025979, -0.2865483, 1, 0, 0.7137255, 1,
1.227037, 1.064832, -0.9003227, 1, 0, 0.7098039, 1,
1.229843, -1.164734, 2.215031, 1, 0, 0.7019608, 1,
1.233605, -1.057897, 2.791623, 1, 0, 0.6941177, 1,
1.239696, -1.097199, 3.496388, 1, 0, 0.6901961, 1,
1.245722, 0.5469413, 1.067805, 1, 0, 0.682353, 1,
1.248087, 0.8541136, -0.1976186, 1, 0, 0.6784314, 1,
1.248749, -0.4376825, 3.079689, 1, 0, 0.6705883, 1,
1.249424, 0.472783, -0.4426589, 1, 0, 0.6666667, 1,
1.251579, 0.06227842, 1.64666, 1, 0, 0.6588235, 1,
1.254736, -0.697411, 2.89399, 1, 0, 0.654902, 1,
1.262566, 1.560548, -0.191549, 1, 0, 0.6470588, 1,
1.27032, -0.1646442, 1.427209, 1, 0, 0.6431373, 1,
1.271676, 0.6430316, 0.1652783, 1, 0, 0.6352941, 1,
1.274362, -0.7533846, 2.35095, 1, 0, 0.6313726, 1,
1.276099, -1.053772, 3.009086, 1, 0, 0.6235294, 1,
1.287853, 1.39515, 0.2685772, 1, 0, 0.6196079, 1,
1.293517, 1.693885, 0.9761078, 1, 0, 0.6117647, 1,
1.293877, 0.8012056, 2.692154, 1, 0, 0.6078432, 1,
1.29691, -1.619228, 2.16112, 1, 0, 0.6, 1,
1.300269, 0.002739781, 2.251956, 1, 0, 0.5921569, 1,
1.300683, -0.5759912, 2.610785, 1, 0, 0.5882353, 1,
1.302347, -0.4595683, 1.032261, 1, 0, 0.5803922, 1,
1.30663, -0.4754827, 3.004521, 1, 0, 0.5764706, 1,
1.307561, 0.3494004, 2.022959, 1, 0, 0.5686275, 1,
1.307766, 0.9201294, 0.4966348, 1, 0, 0.5647059, 1,
1.307876, -0.4335455, 1.807398, 1, 0, 0.5568628, 1,
1.312551, 1.209669, 2.633366, 1, 0, 0.5529412, 1,
1.315204, -0.5211318, 1.145253, 1, 0, 0.5450981, 1,
1.316587, 0.7051514, 2.799059, 1, 0, 0.5411765, 1,
1.316791, -0.6491318, 2.119074, 1, 0, 0.5333334, 1,
1.317878, 0.79105, 1.326309, 1, 0, 0.5294118, 1,
1.320662, -0.09260146, 0.3612036, 1, 0, 0.5215687, 1,
1.322533, 0.3720075, 1.625738, 1, 0, 0.5176471, 1,
1.334022, -0.5300827, 2.400738, 1, 0, 0.509804, 1,
1.338286, 0.2764947, 1.520235, 1, 0, 0.5058824, 1,
1.341806, 1.082116, 1.224425, 1, 0, 0.4980392, 1,
1.342108, -1.661364, 1.858609, 1, 0, 0.4901961, 1,
1.345142, -0.8826202, 2.079717, 1, 0, 0.4862745, 1,
1.355927, -1.218292, 1.055434, 1, 0, 0.4784314, 1,
1.362831, 0.8572708, 0.3893391, 1, 0, 0.4745098, 1,
1.366065, 1.678823, 0.5165722, 1, 0, 0.4666667, 1,
1.369767, 0.01248045, -0.4688048, 1, 0, 0.4627451, 1,
1.372126, -1.67478, 4.462991, 1, 0, 0.454902, 1,
1.373129, -0.5986805, 1.49685, 1, 0, 0.4509804, 1,
1.392882, -1.756881, 2.884065, 1, 0, 0.4431373, 1,
1.400101, -1.711673, 2.71932, 1, 0, 0.4392157, 1,
1.409273, -0.2272907, 1.10957, 1, 0, 0.4313726, 1,
1.413413, -0.6247365, 0.6163429, 1, 0, 0.427451, 1,
1.41537, 1.170381, 1.901454, 1, 0, 0.4196078, 1,
1.430682, -1.823007, 2.802994, 1, 0, 0.4156863, 1,
1.435367, -0.4243992, 0.2512964, 1, 0, 0.4078431, 1,
1.436081, 0.3027304, 3.124862, 1, 0, 0.4039216, 1,
1.438943, -1.625829, 1.958945, 1, 0, 0.3960784, 1,
1.439265, -0.7279973, 4.184805, 1, 0, 0.3882353, 1,
1.44304, -1.950632, 1.135104, 1, 0, 0.3843137, 1,
1.450179, -1.382456, 1.045596, 1, 0, 0.3764706, 1,
1.45081, 0.0007823167, 1.357422, 1, 0, 0.372549, 1,
1.459743, 0.4001219, 1.823537, 1, 0, 0.3647059, 1,
1.469747, 0.984589, 0.1664966, 1, 0, 0.3607843, 1,
1.475911, -1.007395, 3.266974, 1, 0, 0.3529412, 1,
1.477344, -0.5670885, 3.096167, 1, 0, 0.3490196, 1,
1.492637, 0.01501976, 1.835579, 1, 0, 0.3411765, 1,
1.494685, -0.6720969, 1.397751, 1, 0, 0.3372549, 1,
1.530757, -1.123645, 1.118885, 1, 0, 0.3294118, 1,
1.531651, -0.4238793, 1.409965, 1, 0, 0.3254902, 1,
1.553518, 0.3118113, 0.8074952, 1, 0, 0.3176471, 1,
1.562217, 2.245008, 1.262218, 1, 0, 0.3137255, 1,
1.57839, -0.2924188, 3.194911, 1, 0, 0.3058824, 1,
1.590432, 0.4713067, 1.660881, 1, 0, 0.2980392, 1,
1.59301, 0.465875, 1.357933, 1, 0, 0.2941177, 1,
1.597953, -0.9315655, 1.542965, 1, 0, 0.2862745, 1,
1.60428, -1.169976, 0.9565178, 1, 0, 0.282353, 1,
1.609763, 1.451822, 0.3318912, 1, 0, 0.2745098, 1,
1.651399, -0.1712439, 3.67279, 1, 0, 0.2705882, 1,
1.663723, -0.2995491, 1.156539, 1, 0, 0.2627451, 1,
1.673311, 0.3108587, -0.2807319, 1, 0, 0.2588235, 1,
1.683621, 0.9026023, -0.6819965, 1, 0, 0.2509804, 1,
1.686603, 0.186417, 4.030551, 1, 0, 0.2470588, 1,
1.699791, -1.321695, 2.483026, 1, 0, 0.2392157, 1,
1.720233, -1.28571, 1.829222, 1, 0, 0.2352941, 1,
1.76858, -0.08082894, 3.070932, 1, 0, 0.227451, 1,
1.780096, 0.5115988, 1.405731, 1, 0, 0.2235294, 1,
1.798522, 0.9094921, 0.4203957, 1, 0, 0.2156863, 1,
1.802576, 0.1945828, 4.100754, 1, 0, 0.2117647, 1,
1.805677, -0.8574179, 1.647238, 1, 0, 0.2039216, 1,
1.812466, -0.5783302, 3.449179, 1, 0, 0.1960784, 1,
1.813213, -0.8821506, 2.355353, 1, 0, 0.1921569, 1,
1.820882, -0.5679263, 1.81803, 1, 0, 0.1843137, 1,
1.829431, 0.2515532, 0.2448768, 1, 0, 0.1803922, 1,
1.867403, -0.1207806, 0.3684171, 1, 0, 0.172549, 1,
1.976093, 1.101349, 0.4075417, 1, 0, 0.1686275, 1,
1.979222, 1.262564, -1.489008, 1, 0, 0.1607843, 1,
1.989995, -2.465261, 2.019531, 1, 0, 0.1568628, 1,
2.005744, -1.372815, 4.621796, 1, 0, 0.1490196, 1,
2.035282, -1.629397, 1.898889, 1, 0, 0.145098, 1,
2.072795, 1.025264, 1.554874, 1, 0, 0.1372549, 1,
2.086015, -0.4616945, 1.217356, 1, 0, 0.1333333, 1,
2.087318, 1.335919, 0.5848326, 1, 0, 0.1254902, 1,
2.115471, 0.8127509, 1.700502, 1, 0, 0.1215686, 1,
2.120186, -1.252876, 2.019808, 1, 0, 0.1137255, 1,
2.128778, -0.5347426, 0.4330304, 1, 0, 0.1098039, 1,
2.152447, 0.05440022, 1.700875, 1, 0, 0.1019608, 1,
2.159005, 0.1502377, 1.26724, 1, 0, 0.09411765, 1,
2.195495, -0.9661028, 0.6226104, 1, 0, 0.09019608, 1,
2.205765, 0.849018, 1.84671, 1, 0, 0.08235294, 1,
2.210168, -0.3371745, 1.863105, 1, 0, 0.07843138, 1,
2.320922, 0.9600368, 1.16581, 1, 0, 0.07058824, 1,
2.333509, -0.6404436, 2.408202, 1, 0, 0.06666667, 1,
2.342818, -0.9452264, 2.068052, 1, 0, 0.05882353, 1,
2.354256, 1.007038, 1.326923, 1, 0, 0.05490196, 1,
2.52247, 2.867845, 2.206041, 1, 0, 0.04705882, 1,
2.576741, 0.5277247, 1.537458, 1, 0, 0.04313726, 1,
2.704594, 0.9459665, 2.074792, 1, 0, 0.03529412, 1,
2.724499, 1.365242, 1.890023, 1, 0, 0.03137255, 1,
2.788145, 1.584032, 3.290771, 1, 0, 0.02352941, 1,
2.957, -1.058598, 4.489637, 1, 0, 0.01960784, 1,
3.002246, -1.117317, 0.6390412, 1, 0, 0.01176471, 1,
3.139503, 0.8517499, 0.7770919, 1, 0, 0.007843138, 1
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
0.08275342, -4.184498, -6.971227, 0, -0.5, 0.5, 0.5,
0.08275342, -4.184498, -6.971227, 1, -0.5, 0.5, 0.5,
0.08275342, -4.184498, -6.971227, 1, 1.5, 0.5, 0.5,
0.08275342, -4.184498, -6.971227, 0, 1.5, 0.5, 0.5
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
-4.010234, -0.1472651, -6.971227, 0, -0.5, 0.5, 0.5,
-4.010234, -0.1472651, -6.971227, 1, -0.5, 0.5, 0.5,
-4.010234, -0.1472651, -6.971227, 1, 1.5, 0.5, 0.5,
-4.010234, -0.1472651, -6.971227, 0, 1.5, 0.5, 0.5
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
-4.010234, -4.184498, 0.07437086, 0, -0.5, 0.5, 0.5,
-4.010234, -4.184498, 0.07437086, 1, -0.5, 0.5, 0.5,
-4.010234, -4.184498, 0.07437086, 1, 1.5, 0.5, 0.5,
-4.010234, -4.184498, 0.07437086, 0, 1.5, 0.5, 0.5
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
-2, -3.252829, -5.34532,
3, -3.252829, -5.34532,
-2, -3.252829, -5.34532,
-2, -3.408107, -5.616304,
-1, -3.252829, -5.34532,
-1, -3.408107, -5.616304,
0, -3.252829, -5.34532,
0, -3.408107, -5.616304,
1, -3.252829, -5.34532,
1, -3.408107, -5.616304,
2, -3.252829, -5.34532,
2, -3.408107, -5.616304,
3, -3.252829, -5.34532,
3, -3.408107, -5.616304
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
-2, -3.718663, -6.158273, 0, -0.5, 0.5, 0.5,
-2, -3.718663, -6.158273, 1, -0.5, 0.5, 0.5,
-2, -3.718663, -6.158273, 1, 1.5, 0.5, 0.5,
-2, -3.718663, -6.158273, 0, 1.5, 0.5, 0.5,
-1, -3.718663, -6.158273, 0, -0.5, 0.5, 0.5,
-1, -3.718663, -6.158273, 1, -0.5, 0.5, 0.5,
-1, -3.718663, -6.158273, 1, 1.5, 0.5, 0.5,
-1, -3.718663, -6.158273, 0, 1.5, 0.5, 0.5,
0, -3.718663, -6.158273, 0, -0.5, 0.5, 0.5,
0, -3.718663, -6.158273, 1, -0.5, 0.5, 0.5,
0, -3.718663, -6.158273, 1, 1.5, 0.5, 0.5,
0, -3.718663, -6.158273, 0, 1.5, 0.5, 0.5,
1, -3.718663, -6.158273, 0, -0.5, 0.5, 0.5,
1, -3.718663, -6.158273, 1, -0.5, 0.5, 0.5,
1, -3.718663, -6.158273, 1, 1.5, 0.5, 0.5,
1, -3.718663, -6.158273, 0, 1.5, 0.5, 0.5,
2, -3.718663, -6.158273, 0, -0.5, 0.5, 0.5,
2, -3.718663, -6.158273, 1, -0.5, 0.5, 0.5,
2, -3.718663, -6.158273, 1, 1.5, 0.5, 0.5,
2, -3.718663, -6.158273, 0, 1.5, 0.5, 0.5,
3, -3.718663, -6.158273, 0, -0.5, 0.5, 0.5,
3, -3.718663, -6.158273, 1, -0.5, 0.5, 0.5,
3, -3.718663, -6.158273, 1, 1.5, 0.5, 0.5,
3, -3.718663, -6.158273, 0, 1.5, 0.5, 0.5
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
-3.065698, -3, -5.34532,
-3.065698, 2, -5.34532,
-3.065698, -3, -5.34532,
-3.223121, -3, -5.616304,
-3.065698, -2, -5.34532,
-3.223121, -2, -5.616304,
-3.065698, -1, -5.34532,
-3.223121, -1, -5.616304,
-3.065698, 0, -5.34532,
-3.223121, 0, -5.616304,
-3.065698, 1, -5.34532,
-3.223121, 1, -5.616304,
-3.065698, 2, -5.34532,
-3.223121, 2, -5.616304
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
-3.537966, -3, -6.158273, 0, -0.5, 0.5, 0.5,
-3.537966, -3, -6.158273, 1, -0.5, 0.5, 0.5,
-3.537966, -3, -6.158273, 1, 1.5, 0.5, 0.5,
-3.537966, -3, -6.158273, 0, 1.5, 0.5, 0.5,
-3.537966, -2, -6.158273, 0, -0.5, 0.5, 0.5,
-3.537966, -2, -6.158273, 1, -0.5, 0.5, 0.5,
-3.537966, -2, -6.158273, 1, 1.5, 0.5, 0.5,
-3.537966, -2, -6.158273, 0, 1.5, 0.5, 0.5,
-3.537966, -1, -6.158273, 0, -0.5, 0.5, 0.5,
-3.537966, -1, -6.158273, 1, -0.5, 0.5, 0.5,
-3.537966, -1, -6.158273, 1, 1.5, 0.5, 0.5,
-3.537966, -1, -6.158273, 0, 1.5, 0.5, 0.5,
-3.537966, 0, -6.158273, 0, -0.5, 0.5, 0.5,
-3.537966, 0, -6.158273, 1, -0.5, 0.5, 0.5,
-3.537966, 0, -6.158273, 1, 1.5, 0.5, 0.5,
-3.537966, 0, -6.158273, 0, 1.5, 0.5, 0.5,
-3.537966, 1, -6.158273, 0, -0.5, 0.5, 0.5,
-3.537966, 1, -6.158273, 1, -0.5, 0.5, 0.5,
-3.537966, 1, -6.158273, 1, 1.5, 0.5, 0.5,
-3.537966, 1, -6.158273, 0, 1.5, 0.5, 0.5,
-3.537966, 2, -6.158273, 0, -0.5, 0.5, 0.5,
-3.537966, 2, -6.158273, 1, -0.5, 0.5, 0.5,
-3.537966, 2, -6.158273, 1, 1.5, 0.5, 0.5,
-3.537966, 2, -6.158273, 0, 1.5, 0.5, 0.5
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
-3.065698, -3.252829, -4,
-3.065698, -3.252829, 4,
-3.065698, -3.252829, -4,
-3.223121, -3.408107, -4,
-3.065698, -3.252829, -2,
-3.223121, -3.408107, -2,
-3.065698, -3.252829, 0,
-3.223121, -3.408107, 0,
-3.065698, -3.252829, 2,
-3.223121, -3.408107, 2,
-3.065698, -3.252829, 4,
-3.223121, -3.408107, 4
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
-3.537966, -3.718663, -4, 0, -0.5, 0.5, 0.5,
-3.537966, -3.718663, -4, 1, -0.5, 0.5, 0.5,
-3.537966, -3.718663, -4, 1, 1.5, 0.5, 0.5,
-3.537966, -3.718663, -4, 0, 1.5, 0.5, 0.5,
-3.537966, -3.718663, -2, 0, -0.5, 0.5, 0.5,
-3.537966, -3.718663, -2, 1, -0.5, 0.5, 0.5,
-3.537966, -3.718663, -2, 1, 1.5, 0.5, 0.5,
-3.537966, -3.718663, -2, 0, 1.5, 0.5, 0.5,
-3.537966, -3.718663, 0, 0, -0.5, 0.5, 0.5,
-3.537966, -3.718663, 0, 1, -0.5, 0.5, 0.5,
-3.537966, -3.718663, 0, 1, 1.5, 0.5, 0.5,
-3.537966, -3.718663, 0, 0, 1.5, 0.5, 0.5,
-3.537966, -3.718663, 2, 0, -0.5, 0.5, 0.5,
-3.537966, -3.718663, 2, 1, -0.5, 0.5, 0.5,
-3.537966, -3.718663, 2, 1, 1.5, 0.5, 0.5,
-3.537966, -3.718663, 2, 0, 1.5, 0.5, 0.5,
-3.537966, -3.718663, 4, 0, -0.5, 0.5, 0.5,
-3.537966, -3.718663, 4, 1, -0.5, 0.5, 0.5,
-3.537966, -3.718663, 4, 1, 1.5, 0.5, 0.5,
-3.537966, -3.718663, 4, 0, 1.5, 0.5, 0.5
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
-3.065698, -3.252829, -5.34532,
-3.065698, 2.958299, -5.34532,
-3.065698, -3.252829, 5.494061,
-3.065698, 2.958299, 5.494061,
-3.065698, -3.252829, -5.34532,
-3.065698, -3.252829, 5.494061,
-3.065698, 2.958299, -5.34532,
-3.065698, 2.958299, 5.494061,
-3.065698, -3.252829, -5.34532,
3.231205, -3.252829, -5.34532,
-3.065698, -3.252829, 5.494061,
3.231205, -3.252829, 5.494061,
-3.065698, 2.958299, -5.34532,
3.231205, 2.958299, -5.34532,
-3.065698, 2.958299, 5.494061,
3.231205, 2.958299, 5.494061,
3.231205, -3.252829, -5.34532,
3.231205, 2.958299, -5.34532,
3.231205, -3.252829, 5.494061,
3.231205, 2.958299, 5.494061,
3.231205, -3.252829, -5.34532,
3.231205, -3.252829, 5.494061,
3.231205, 2.958299, -5.34532,
3.231205, 2.958299, 5.494061
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
var radius = 7.470411;
var distance = 33.2367;
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
mvMatrix.translate( -0.08275342, 0.1472651, -0.07437086 );
mvMatrix.scale( 1.282719, 1.300433, 0.7451675 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.2367);
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
isophenphos<-read.table("isophenphos.xyz")
```

```
## Error in read.table("isophenphos.xyz"): no lines available in input
```

```r
x<-isophenphos$V2
```

```
## Error in eval(expr, envir, enclos): object 'isophenphos' not found
```

```r
y<-isophenphos$V3
```

```
## Error in eval(expr, envir, enclos): object 'isophenphos' not found
```

```r
z<-isophenphos$V4
```

```
## Error in eval(expr, envir, enclos): object 'isophenphos' not found
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
-2.973996, 0.8039598, -0.2493195, 0, 0, 1, 1, 1,
-2.922383, -0.7626581, -0.8454936, 1, 0, 0, 1, 1,
-2.69781, 0.1925723, -1.613008, 1, 0, 0, 1, 1,
-2.665148, 0.5798233, -1.450315, 1, 0, 0, 1, 1,
-2.547439, -0.9944416, -2.742112, 1, 0, 0, 1, 1,
-2.469886, 0.7097661, -0.8718747, 1, 0, 0, 1, 1,
-2.423877, 1.657446, -2.854881, 0, 0, 0, 1, 1,
-2.309069, -0.1049623, -1.109993, 0, 0, 0, 1, 1,
-2.283149, -1.269406, -2.051945, 0, 0, 0, 1, 1,
-2.27516, 0.1761279, -0.4787051, 0, 0, 0, 1, 1,
-2.24866, -3.162375, -1.032362, 0, 0, 0, 1, 1,
-2.23034, -0.1345761, -3.536993, 0, 0, 0, 1, 1,
-2.224347, -1.783359, -0.680217, 0, 0, 0, 1, 1,
-2.180317, -1.000677, -2.785729, 1, 1, 1, 1, 1,
-2.115666, -0.03927445, -0.1395015, 1, 1, 1, 1, 1,
-2.075916, 0.7873477, -2.202588, 1, 1, 1, 1, 1,
-2.070968, -0.2626852, -3.735713, 1, 1, 1, 1, 1,
-2.040938, -0.4143251, -0.08888551, 1, 1, 1, 1, 1,
-2.018271, -0.9945862, -2.015296, 1, 1, 1, 1, 1,
-2.0129, -0.5491395, -4.329265, 1, 1, 1, 1, 1,
-1.969249, 0.08599768, -2.68891, 1, 1, 1, 1, 1,
-1.959116, -1.197252, -1.101347, 1, 1, 1, 1, 1,
-1.921017, 0.2280012, -2.80892, 1, 1, 1, 1, 1,
-1.902102, -0.04841224, -2.889422, 1, 1, 1, 1, 1,
-1.874464, -0.6172053, -3.996669, 1, 1, 1, 1, 1,
-1.859329, -0.907277, -1.618673, 1, 1, 1, 1, 1,
-1.847912, 0.2451481, -3.013733, 1, 1, 1, 1, 1,
-1.824413, -0.4742278, -2.671991, 1, 1, 1, 1, 1,
-1.819409, -0.8061138, -2.363902, 0, 0, 1, 1, 1,
-1.817577, 0.515793, -0.02207092, 1, 0, 0, 1, 1,
-1.793564, 0.358016, -1.236961, 1, 0, 0, 1, 1,
-1.790528, 0.1335609, -1.233949, 1, 0, 0, 1, 1,
-1.789134, 0.2015802, -1.105026, 1, 0, 0, 1, 1,
-1.786492, -1.017794, -2.319825, 1, 0, 0, 1, 1,
-1.783285, 1.45454, -1.753289, 0, 0, 0, 1, 1,
-1.781783, -1.28507, -2.11431, 0, 0, 0, 1, 1,
-1.746636, 1.026206, -1.779259, 0, 0, 0, 1, 1,
-1.74188, 0.8909262, -0.7895303, 0, 0, 0, 1, 1,
-1.732447, 0.836458, -0.1724775, 0, 0, 0, 1, 1,
-1.730912, -0.09112107, -1.613637, 0, 0, 0, 1, 1,
-1.709748, 1.291579, -1.294886, 0, 0, 0, 1, 1,
-1.707824, -1.265059, -1.653983, 1, 1, 1, 1, 1,
-1.702545, 0.10604, -1.621324, 1, 1, 1, 1, 1,
-1.698801, -2.02084, -2.091412, 1, 1, 1, 1, 1,
-1.676126, 0.7489707, -2.292196, 1, 1, 1, 1, 1,
-1.675848, 1.297536, 0.3978378, 1, 1, 1, 1, 1,
-1.664316, -0.6433443, 0.2377669, 1, 1, 1, 1, 1,
-1.653917, -0.7978357, -3.070713, 1, 1, 1, 1, 1,
-1.650451, -0.8855633, -1.136977, 1, 1, 1, 1, 1,
-1.647069, -2.246246, -2.708122, 1, 1, 1, 1, 1,
-1.641387, -0.4273254, -2.570422, 1, 1, 1, 1, 1,
-1.634689, 1.458521, 0.5338975, 1, 1, 1, 1, 1,
-1.633331, 0.7709908, -0.3104696, 1, 1, 1, 1, 1,
-1.630456, 1.377001, -0.6646249, 1, 1, 1, 1, 1,
-1.626127, -0.01012516, -1.309461, 1, 1, 1, 1, 1,
-1.611842, 1.953701, -0.4255062, 1, 1, 1, 1, 1,
-1.603386, -1.109122, -2.291629, 0, 0, 1, 1, 1,
-1.601332, 0.9202297, -0.8970553, 1, 0, 0, 1, 1,
-1.601103, -0.6218429, 0.9919893, 1, 0, 0, 1, 1,
-1.584163, 1.566697, -2.05758, 1, 0, 0, 1, 1,
-1.581826, 1.21084, -0.9235328, 1, 0, 0, 1, 1,
-1.575769, 2.286445, -2.065035, 1, 0, 0, 1, 1,
-1.571173, 0.05041965, -0.6962262, 0, 0, 0, 1, 1,
-1.569188, 0.943813, -0.008478352, 0, 0, 0, 1, 1,
-1.558066, 0.4922039, 0.06070075, 0, 0, 0, 1, 1,
-1.549935, -1.102108, -2.278715, 0, 0, 0, 1, 1,
-1.548947, -0.3614293, -1.313781, 0, 0, 0, 1, 1,
-1.548806, 1.469487, -0.4524859, 0, 0, 0, 1, 1,
-1.535412, -0.4227324, -2.333256, 0, 0, 0, 1, 1,
-1.533126, -1.389197, 0.6338329, 1, 1, 1, 1, 1,
-1.527475, -1.690835, -2.607264, 1, 1, 1, 1, 1,
-1.520725, -1.31817, -2.251078, 1, 1, 1, 1, 1,
-1.509254, -1.211686, -3.079444, 1, 1, 1, 1, 1,
-1.497879, -0.6242661, -0.8158911, 1, 1, 1, 1, 1,
-1.486536, -0.5192716, -1.998458, 1, 1, 1, 1, 1,
-1.485343, -0.1186478, -1.791028, 1, 1, 1, 1, 1,
-1.481578, 0.7246675, -1.331968, 1, 1, 1, 1, 1,
-1.472344, -0.3771544, -1.766083, 1, 1, 1, 1, 1,
-1.471866, -0.5646283, -2.653561, 1, 1, 1, 1, 1,
-1.469725, -1.118991, -1.94688, 1, 1, 1, 1, 1,
-1.453667, 0.8138983, -0.2368918, 1, 1, 1, 1, 1,
-1.437891, 0.7644896, -0.4937704, 1, 1, 1, 1, 1,
-1.416151, -0.2137341, -0.8144671, 1, 1, 1, 1, 1,
-1.409153, -0.3454111, -1.560223, 1, 1, 1, 1, 1,
-1.406373, -1.143495, -1.780537, 0, 0, 1, 1, 1,
-1.394754, 0.1440361, -1.085595, 1, 0, 0, 1, 1,
-1.383141, 1.058692, -1.990589, 1, 0, 0, 1, 1,
-1.381846, -0.2510638, -1.809688, 1, 0, 0, 1, 1,
-1.380411, -0.2354133, -0.4536065, 1, 0, 0, 1, 1,
-1.37163, 0.5091271, -1.758016, 1, 0, 0, 1, 1,
-1.368598, -0.1247999, -2.042253, 0, 0, 0, 1, 1,
-1.366216, 0.686187, -2.087478, 0, 0, 0, 1, 1,
-1.356243, 1.276626, -0.7741654, 0, 0, 0, 1, 1,
-1.352085, -0.3820596, 1.175343, 0, 0, 0, 1, 1,
-1.34894, -0.4524271, -2.663261, 0, 0, 0, 1, 1,
-1.321834, -1.50785, -3.581493, 0, 0, 0, 1, 1,
-1.321362, -1.250584, -1.308103, 0, 0, 0, 1, 1,
-1.295647, 1.552447, -2.377805, 1, 1, 1, 1, 1,
-1.293584, 0.5509523, -1.981377, 1, 1, 1, 1, 1,
-1.289159, 1.097028, -2.508537, 1, 1, 1, 1, 1,
-1.281749, 0.3451551, -0.1173517, 1, 1, 1, 1, 1,
-1.276941, 0.7571014, -1.866162, 1, 1, 1, 1, 1,
-1.276306, 1.578271, -0.3018344, 1, 1, 1, 1, 1,
-1.275796, -0.8699365, -1.546158, 1, 1, 1, 1, 1,
-1.262054, 0.6787021, -2.335423, 1, 1, 1, 1, 1,
-1.252557, -0.9919248, -1.025728, 1, 1, 1, 1, 1,
-1.246497, 0.7979328, -0.5372975, 1, 1, 1, 1, 1,
-1.243465, -0.609455, -2.370522, 1, 1, 1, 1, 1,
-1.237169, -0.8655869, -0.4185205, 1, 1, 1, 1, 1,
-1.233968, -0.3313499, -3.25114, 1, 1, 1, 1, 1,
-1.220299, -0.4327269, -1.707404, 1, 1, 1, 1, 1,
-1.217608, 0.0803826, -1.121599, 1, 1, 1, 1, 1,
-1.214948, 0.8212369, 0.5029917, 0, 0, 1, 1, 1,
-1.214651, 0.6495956, -0.4570962, 1, 0, 0, 1, 1,
-1.203253, -0.6120442, -1.24913, 1, 0, 0, 1, 1,
-1.195531, -1.667319, -1.49032, 1, 0, 0, 1, 1,
-1.193929, 0.06375849, -0.9776083, 1, 0, 0, 1, 1,
-1.19378, 2.072445, -0.9862963, 1, 0, 0, 1, 1,
-1.188599, 0.3987601, -1.052996, 0, 0, 0, 1, 1,
-1.185125, -0.5139591, -2.80297, 0, 0, 0, 1, 1,
-1.184917, -0.2839558, -2.281565, 0, 0, 0, 1, 1,
-1.162433, 0.6081749, -2.660789, 0, 0, 0, 1, 1,
-1.155946, -0.09113231, -2.125916, 0, 0, 0, 1, 1,
-1.149974, -0.2115708, -2.559362, 0, 0, 0, 1, 1,
-1.149868, -0.8647373, -1.119984, 0, 0, 0, 1, 1,
-1.148855, -0.734482, -2.000893, 1, 1, 1, 1, 1,
-1.129578, -0.02614366, -1.204382, 1, 1, 1, 1, 1,
-1.12784, -1.590677, -1.944447, 1, 1, 1, 1, 1,
-1.11917, -1.645625, -2.21628, 1, 1, 1, 1, 1,
-1.117103, -0.7444794, -0.3725673, 1, 1, 1, 1, 1,
-1.114416, 0.5515879, -2.067833, 1, 1, 1, 1, 1,
-1.113155, 0.1065137, -0.7085308, 1, 1, 1, 1, 1,
-1.111297, -0.5917206, -0.3746257, 1, 1, 1, 1, 1,
-1.106867, 0.5388663, 0.9910264, 1, 1, 1, 1, 1,
-1.105903, 0.3272491, 0.3445163, 1, 1, 1, 1, 1,
-1.099498, 1.225401, -0.9994742, 1, 1, 1, 1, 1,
-1.097471, 0.05555217, -1.155642, 1, 1, 1, 1, 1,
-1.093335, 0.9990081, -1.495201, 1, 1, 1, 1, 1,
-1.08004, -0.1879526, -2.927448, 1, 1, 1, 1, 1,
-1.077289, 0.3008927, -2.536176, 1, 1, 1, 1, 1,
-1.073499, -2.579412, -2.279754, 0, 0, 1, 1, 1,
-1.065963, -0.2125261, -0.666017, 1, 0, 0, 1, 1,
-1.065182, -0.1419331, -0.6181326, 1, 0, 0, 1, 1,
-1.064442, -1.249936, -2.229133, 1, 0, 0, 1, 1,
-1.063641, -0.03652154, 0.4792571, 1, 0, 0, 1, 1,
-1.057216, 0.4232533, -1.491614, 1, 0, 0, 1, 1,
-1.054157, 1.1717, 0.2338566, 0, 0, 0, 1, 1,
-1.04264, -1.862954, -1.761253, 0, 0, 0, 1, 1,
-1.03905, -0.4149802, -1.723517, 0, 0, 0, 1, 1,
-1.038895, -0.5890415, -2.373791, 0, 0, 0, 1, 1,
-1.034238, -1.41211, -2.598926, 0, 0, 0, 1, 1,
-1.032204, -0.5918733, -3.105997, 0, 0, 0, 1, 1,
-1.030994, -0.4449752, -0.7670621, 0, 0, 0, 1, 1,
-1.027355, 0.4476624, -2.886613, 1, 1, 1, 1, 1,
-1.02107, -0.1408928, -2.424421, 1, 1, 1, 1, 1,
-1.020049, 0.7168425, -0.2967908, 1, 1, 1, 1, 1,
-1.017706, -1.012001, -2.52959, 1, 1, 1, 1, 1,
-1.015433, -1.112874, -1.060384, 1, 1, 1, 1, 1,
-1.010572, 0.3389417, -1.177759, 1, 1, 1, 1, 1,
-1.006748, 0.4871409, -0.7892528, 1, 1, 1, 1, 1,
-1.001474, -1.319462, -2.811878, 1, 1, 1, 1, 1,
-0.9999841, -0.07094508, -1.75418, 1, 1, 1, 1, 1,
-0.9955263, -0.1159552, -1.228766, 1, 1, 1, 1, 1,
-0.9889975, 1.512601, -1.266946, 1, 1, 1, 1, 1,
-0.9881033, 1.259752, 0.0503962, 1, 1, 1, 1, 1,
-0.985779, -1.018969, -2.995473, 1, 1, 1, 1, 1,
-0.9803718, -1.586882, -3.095922, 1, 1, 1, 1, 1,
-0.9795179, -0.4276676, -0.2309603, 1, 1, 1, 1, 1,
-0.9746054, 1.035762, -0.01910605, 0, 0, 1, 1, 1,
-0.9733017, 0.8315945, -1.647483, 1, 0, 0, 1, 1,
-0.9711505, 0.682593, -0.3323174, 1, 0, 0, 1, 1,
-0.9711298, 1.807521, -1.447174, 1, 0, 0, 1, 1,
-0.967923, -0.5303158, -2.875328, 1, 0, 0, 1, 1,
-0.9619021, -1.412472, -2.691452, 1, 0, 0, 1, 1,
-0.9616163, 0.8506283, -1.212391, 0, 0, 0, 1, 1,
-0.9548566, 0.3117723, -2.683916, 0, 0, 0, 1, 1,
-0.951873, 0.7289896, -2.399371, 0, 0, 0, 1, 1,
-0.9494085, 0.1086657, -1.225829, 0, 0, 0, 1, 1,
-0.9478528, -1.339622, -0.7448977, 0, 0, 0, 1, 1,
-0.9436713, 1.107358, -2.929384, 0, 0, 0, 1, 1,
-0.9433972, -0.1968594, -2.873882, 0, 0, 0, 1, 1,
-0.9354469, 1.250231, -1.193428, 1, 1, 1, 1, 1,
-0.9305483, -0.4137216, -1.312597, 1, 1, 1, 1, 1,
-0.9289696, 1.211326, 0.9001558, 1, 1, 1, 1, 1,
-0.9279311, 0.4127213, 0.2994931, 1, 1, 1, 1, 1,
-0.9123794, 0.1284634, -0.6499211, 1, 1, 1, 1, 1,
-0.9105035, 1.376797, -1.011958, 1, 1, 1, 1, 1,
-0.9066817, 1.340324, -0.131644, 1, 1, 1, 1, 1,
-0.902968, 0.3791456, 0.2062486, 1, 1, 1, 1, 1,
-0.8985741, -0.9624535, -0.7967365, 1, 1, 1, 1, 1,
-0.8898719, 0.5152435, -0.2848689, 1, 1, 1, 1, 1,
-0.8894987, 1.416862, 0.8887896, 1, 1, 1, 1, 1,
-0.8833668, -0.5144564, -2.443282, 1, 1, 1, 1, 1,
-0.8828311, -1.564124, -0.8940825, 1, 1, 1, 1, 1,
-0.8815898, -2.374794, -3.039613, 1, 1, 1, 1, 1,
-0.8800468, -0.8145066, -2.641328, 1, 1, 1, 1, 1,
-0.875367, -0.3925575, -1.569635, 0, 0, 1, 1, 1,
-0.8705689, -0.4139025, -2.606161, 1, 0, 0, 1, 1,
-0.8672235, 0.1482841, 1.059597, 1, 0, 0, 1, 1,
-0.8666476, 1.163829, -0.1993156, 1, 0, 0, 1, 1,
-0.8642549, -1.028884, -3.309448, 1, 0, 0, 1, 1,
-0.8580899, -0.3379448, -0.7574713, 1, 0, 0, 1, 1,
-0.8545676, -0.1273218, -1.557075, 0, 0, 0, 1, 1,
-0.8514727, -1.342008, -2.616662, 0, 0, 0, 1, 1,
-0.8504215, -2.184448, -3.151817, 0, 0, 0, 1, 1,
-0.8458, -0.7101446, -2.797036, 0, 0, 0, 1, 1,
-0.8455317, -0.7956049, -3.185955, 0, 0, 0, 1, 1,
-0.8346995, 0.4577201, -1.062853, 0, 0, 0, 1, 1,
-0.8336784, 1.394529, 0.7132024, 0, 0, 0, 1, 1,
-0.8325759, -0.9629172, -0.992173, 1, 1, 1, 1, 1,
-0.8323124, 0.6041651, -2.37648, 1, 1, 1, 1, 1,
-0.8302414, 1.524121, -0.7413476, 1, 1, 1, 1, 1,
-0.8244353, -0.5664437, -2.218936, 1, 1, 1, 1, 1,
-0.8124764, -1.783982, -2.961774, 1, 1, 1, 1, 1,
-0.7996021, -0.9838712, -2.838248, 1, 1, 1, 1, 1,
-0.796014, -2.980163, -2.915374, 1, 1, 1, 1, 1,
-0.7929975, 1.486438, 1.147011, 1, 1, 1, 1, 1,
-0.7886647, 0.9397905, 0.6689166, 1, 1, 1, 1, 1,
-0.7842981, 0.2450285, 0.5320278, 1, 1, 1, 1, 1,
-0.7837286, 0.9644934, -0.5092782, 1, 1, 1, 1, 1,
-0.7835141, -0.1564423, -0.04881792, 1, 1, 1, 1, 1,
-0.7780319, -0.9898633, -1.489941, 1, 1, 1, 1, 1,
-0.7747026, 2.794979, -0.3339461, 1, 1, 1, 1, 1,
-0.7733828, -1.420091, -1.601843, 1, 1, 1, 1, 1,
-0.7654935, -0.2210993, -0.3010387, 0, 0, 1, 1, 1,
-0.7633194, 2.063012, 1.177342, 1, 0, 0, 1, 1,
-0.7602314, -0.6460758, -2.770637, 1, 0, 0, 1, 1,
-0.7582, -0.04909698, -1.156533, 1, 0, 0, 1, 1,
-0.7521262, -0.8194849, -1.78299, 1, 0, 0, 1, 1,
-0.750986, 0.7493879, -3.115784, 1, 0, 0, 1, 1,
-0.7427635, -0.6275331, -3.947849, 0, 0, 0, 1, 1,
-0.74119, -1.277321, -1.757979, 0, 0, 0, 1, 1,
-0.740158, 0.9775662, -1.902165, 0, 0, 0, 1, 1,
-0.7384344, 0.1520471, -2.424909, 0, 0, 0, 1, 1,
-0.7373777, -1.428961, -4.705336, 0, 0, 0, 1, 1,
-0.7348674, 0.1199923, -1.81868, 0, 0, 0, 1, 1,
-0.7346787, 0.2980661, -3.186143, 0, 0, 0, 1, 1,
-0.7331578, 2.572829, -0.09639899, 1, 1, 1, 1, 1,
-0.7315384, 1.272511, -2.730151, 1, 1, 1, 1, 1,
-0.7307912, 0.1952519, -0.9874012, 1, 1, 1, 1, 1,
-0.7302161, 0.4203639, -1.169928, 1, 1, 1, 1, 1,
-0.7300798, -0.763242, -1.835184, 1, 1, 1, 1, 1,
-0.728692, -1.315381, -3.890454, 1, 1, 1, 1, 1,
-0.7264955, -0.07656697, -1.515707, 1, 1, 1, 1, 1,
-0.7256611, 1.232858, -0.4253354, 1, 1, 1, 1, 1,
-0.7256173, 1.215571, -1.647931, 1, 1, 1, 1, 1,
-0.7255713, 0.6164014, -0.9726919, 1, 1, 1, 1, 1,
-0.7252118, 1.124334, 0.696501, 1, 1, 1, 1, 1,
-0.7249558, -1.087232, -2.880811, 1, 1, 1, 1, 1,
-0.7231976, 0.07736266, -1.722701, 1, 1, 1, 1, 1,
-0.7229692, -0.1779827, -1.145274, 1, 1, 1, 1, 1,
-0.7229242, 1.028057, 0.8398937, 1, 1, 1, 1, 1,
-0.7189321, 0.964909, 0.4836167, 0, 0, 1, 1, 1,
-0.7158772, -1.394007, -1.402113, 1, 0, 0, 1, 1,
-0.7122236, 0.20941, -1.607228, 1, 0, 0, 1, 1,
-0.711516, -2.288018, -3.233269, 1, 0, 0, 1, 1,
-0.7057799, 0.7196503, -0.6423592, 1, 0, 0, 1, 1,
-0.6993815, -0.1827823, -1.654058, 1, 0, 0, 1, 1,
-0.6970347, 0.4020989, -0.8350966, 0, 0, 0, 1, 1,
-0.68549, -0.6151718, -1.667051, 0, 0, 0, 1, 1,
-0.6832268, 0.7524043, -0.7677677, 0, 0, 0, 1, 1,
-0.6790389, 0.8520195, -0.4859481, 0, 0, 0, 1, 1,
-0.6755361, 0.549314, 0.1478352, 0, 0, 0, 1, 1,
-0.6725038, -0.8437932, -3.185178, 0, 0, 0, 1, 1,
-0.6707191, -0.9657174, -4.426832, 0, 0, 0, 1, 1,
-0.6557792, 0.6221555, -0.2997866, 1, 1, 1, 1, 1,
-0.6554068, 1.435926, -2.203917, 1, 1, 1, 1, 1,
-0.6526574, 1.130873, -0.4897744, 1, 1, 1, 1, 1,
-0.6508825, 0.02388767, -1.950498, 1, 1, 1, 1, 1,
-0.6505412, 0.7873178, -0.343971, 1, 1, 1, 1, 1,
-0.6483605, 0.3297099, -2.040648, 1, 1, 1, 1, 1,
-0.6435386, -1.287229, -3.683005, 1, 1, 1, 1, 1,
-0.6410111, -0.3791263, -1.126132, 1, 1, 1, 1, 1,
-0.6377382, 0.3460047, -1.891459, 1, 1, 1, 1, 1,
-0.6373105, -0.07206246, -1.297454, 1, 1, 1, 1, 1,
-0.6348782, 0.2873527, -0.9594026, 1, 1, 1, 1, 1,
-0.6291813, -1.150183, -2.987037, 1, 1, 1, 1, 1,
-0.6275542, 2.800469, -2.020533, 1, 1, 1, 1, 1,
-0.6259983, -0.2513249, -1.077309, 1, 1, 1, 1, 1,
-0.6259895, -1.252692, -3.734176, 1, 1, 1, 1, 1,
-0.6235257, 0.6728835, -0.4169793, 0, 0, 1, 1, 1,
-0.6220534, 1.548134, -1.168099, 1, 0, 0, 1, 1,
-0.6088206, 0.008674698, -1.044283, 1, 0, 0, 1, 1,
-0.6000657, 0.07565606, -0.2725472, 1, 0, 0, 1, 1,
-0.5990825, -0.05840943, -1.555367, 1, 0, 0, 1, 1,
-0.5969718, -1.022942, -1.750814, 1, 0, 0, 1, 1,
-0.594084, -1.635475, -2.762426, 0, 0, 0, 1, 1,
-0.5932128, -0.01479767, -1.263273, 0, 0, 0, 1, 1,
-0.5909888, -1.356115, -3.638265, 0, 0, 0, 1, 1,
-0.5903167, -1.501082, -1.540506, 0, 0, 0, 1, 1,
-0.5889784, 1.090634, -1.404558, 0, 0, 0, 1, 1,
-0.5877404, -0.8237945, -2.649673, 0, 0, 0, 1, 1,
-0.5848755, -0.05691494, -1.31567, 0, 0, 0, 1, 1,
-0.5846046, -1.083083, -3.631119, 1, 1, 1, 1, 1,
-0.5726058, 0.7604241, 0.316886, 1, 1, 1, 1, 1,
-0.5705369, 0.2603622, -1.720547, 1, 1, 1, 1, 1,
-0.570439, -1.450464, -1.951463, 1, 1, 1, 1, 1,
-0.5689046, -0.7910158, -3.959063, 1, 1, 1, 1, 1,
-0.5633751, -0.1471238, -0.5051513, 1, 1, 1, 1, 1,
-0.562493, -1.370773, -3.096426, 1, 1, 1, 1, 1,
-0.5587645, -0.2015227, -3.500696, 1, 1, 1, 1, 1,
-0.5582729, -1.433496, -3.074462, 1, 1, 1, 1, 1,
-0.5524542, 1.373082, -0.08329364, 1, 1, 1, 1, 1,
-0.5512838, 0.6142442, -0.8277829, 1, 1, 1, 1, 1,
-0.5423188, 0.1280057, -2.056761, 1, 1, 1, 1, 1,
-0.5414512, 2.111949, -0.908809, 1, 1, 1, 1, 1,
-0.5406475, 1.364509, -1.681677, 1, 1, 1, 1, 1,
-0.5366852, -0.9670371, -1.693086, 1, 1, 1, 1, 1,
-0.5302615, 0.5554361, -2.684765, 0, 0, 1, 1, 1,
-0.5174736, 0.4597009, -1.060649, 1, 0, 0, 1, 1,
-0.5152377, -0.3591081, -1.773678, 1, 0, 0, 1, 1,
-0.5148399, 0.9375065, -0.3889169, 1, 0, 0, 1, 1,
-0.5082173, 1.040959, -0.4429168, 1, 0, 0, 1, 1,
-0.5059157, 0.682274, 0.09682462, 1, 0, 0, 1, 1,
-0.5048081, -0.3148962, -3.962061, 0, 0, 0, 1, 1,
-0.5026687, -1.098376, -2.578846, 0, 0, 0, 1, 1,
-0.5015351, 0.3153075, 0.1306062, 0, 0, 0, 1, 1,
-0.5005798, -1.007887, -2.430771, 0, 0, 0, 1, 1,
-0.4999096, 0.9416237, -2.274017, 0, 0, 0, 1, 1,
-0.4934433, -0.7437437, -3.344878, 0, 0, 0, 1, 1,
-0.4864475, -0.494119, -1.760627, 0, 0, 0, 1, 1,
-0.4859771, 1.813592, -0.1654809, 1, 1, 1, 1, 1,
-0.4847949, -0.7797647, -3.441925, 1, 1, 1, 1, 1,
-0.4780406, 0.6998338, -1.978336, 1, 1, 1, 1, 1,
-0.4778661, -0.0436735, -2.74757, 1, 1, 1, 1, 1,
-0.4776027, 1.497949, 0.4928395, 1, 1, 1, 1, 1,
-0.477421, -2.164288, -3.851661, 1, 1, 1, 1, 1,
-0.471698, -0.4994185, -3.201926, 1, 1, 1, 1, 1,
-0.463318, 1.019023, 0.9682048, 1, 1, 1, 1, 1,
-0.4629508, -0.3399529, -1.989586, 1, 1, 1, 1, 1,
-0.4624898, 1.077568, -2.19383, 1, 1, 1, 1, 1,
-0.4615607, -0.6522592, 0.01049183, 1, 1, 1, 1, 1,
-0.4605182, 1.455682, 0.4008171, 1, 1, 1, 1, 1,
-0.4601051, 0.7959976, 0.3900942, 1, 1, 1, 1, 1,
-0.4584259, -0.4708791, -0.6837716, 1, 1, 1, 1, 1,
-0.4552237, 1.132003, 0.7550208, 1, 1, 1, 1, 1,
-0.4537529, 1.228426, -1.486361, 0, 0, 1, 1, 1,
-0.4489403, -0.9041258, -1.878039, 1, 0, 0, 1, 1,
-0.4464864, 0.22467, -1.170859, 1, 0, 0, 1, 1,
-0.4450523, -0.8417075, -2.990515, 1, 0, 0, 1, 1,
-0.4428059, -1.029672, -1.359472, 1, 0, 0, 1, 1,
-0.4427918, -1.575614, -3.208951, 1, 0, 0, 1, 1,
-0.4382503, 1.154969, -1.365438, 0, 0, 0, 1, 1,
-0.4371642, -1.375904, -3.897841, 0, 0, 0, 1, 1,
-0.4369462, -1.162521, -1.021722, 0, 0, 0, 1, 1,
-0.434743, 0.7589159, -0.3563006, 0, 0, 0, 1, 1,
-0.432072, -0.8704701, -3.383951, 0, 0, 0, 1, 1,
-0.4290941, 0.3548056, -2.061578, 0, 0, 0, 1, 1,
-0.4278271, 0.8848258, 0.638775, 0, 0, 0, 1, 1,
-0.4277463, -0.1027703, -1.824729, 1, 1, 1, 1, 1,
-0.4231737, 0.4346967, -0.8172248, 1, 1, 1, 1, 1,
-0.4178006, 0.2459034, -2.376672, 1, 1, 1, 1, 1,
-0.4123076, -1.865366, -1.78827, 1, 1, 1, 1, 1,
-0.4106351, 0.6512193, -0.9793788, 1, 1, 1, 1, 1,
-0.4065349, 0.4276915, -0.6141601, 1, 1, 1, 1, 1,
-0.40646, 0.006165669, -2.00211, 1, 1, 1, 1, 1,
-0.4053999, 0.7749006, -2.110946, 1, 1, 1, 1, 1,
-0.4021317, 0.9804726, 0.1182871, 1, 1, 1, 1, 1,
-0.3966578, 0.2009719, 0.2541921, 1, 1, 1, 1, 1,
-0.3944773, 0.6505468, -1.015466, 1, 1, 1, 1, 1,
-0.3937752, 0.3599822, -1.457026, 1, 1, 1, 1, 1,
-0.3924695, -1.305042, -2.664605, 1, 1, 1, 1, 1,
-0.3903399, 1.507908, -0.5493605, 1, 1, 1, 1, 1,
-0.3868724, 1.183548, 0.4593924, 1, 1, 1, 1, 1,
-0.3840638, 2.205007, 0.9184031, 0, 0, 1, 1, 1,
-0.3835725, 0.9656642, 0.4056244, 1, 0, 0, 1, 1,
-0.3798277, 0.09132872, -1.602129, 1, 0, 0, 1, 1,
-0.3768936, -1.408473, -3.44098, 1, 0, 0, 1, 1,
-0.3762348, 1.411565, -0.9555672, 1, 0, 0, 1, 1,
-0.3706006, -0.001275758, -2.205115, 1, 0, 0, 1, 1,
-0.3697215, -1.016945, -3.445318, 0, 0, 0, 1, 1,
-0.3691527, 0.2548868, -1.807613, 0, 0, 0, 1, 1,
-0.3608275, 0.3255476, -0.1801358, 0, 0, 0, 1, 1,
-0.3546518, -0.1089219, -2.480489, 0, 0, 0, 1, 1,
-0.3523335, -0.9173892, -3.168492, 0, 0, 0, 1, 1,
-0.3440562, 0.09832638, -2.724375, 0, 0, 0, 1, 1,
-0.3393621, -1.07508, -2.374667, 0, 0, 0, 1, 1,
-0.335227, -0.9551021, -4.314859, 1, 1, 1, 1, 1,
-0.3316903, 0.7417715, 0.7432271, 1, 1, 1, 1, 1,
-0.3304342, 1.659297, -0.5772386, 1, 1, 1, 1, 1,
-0.3280055, -0.2009181, -3.265302, 1, 1, 1, 1, 1,
-0.3245516, -0.006048101, -3.290663, 1, 1, 1, 1, 1,
-0.3242552, -1.697675, -3.997587, 1, 1, 1, 1, 1,
-0.3236425, 1.608476, -0.744991, 1, 1, 1, 1, 1,
-0.3214551, 0.3608346, -0.3023371, 1, 1, 1, 1, 1,
-0.3207698, -0.3869113, -2.186986, 1, 1, 1, 1, 1,
-0.3189308, 0.4440326, -0.2734054, 1, 1, 1, 1, 1,
-0.3188246, 1.134902, 0.7521278, 1, 1, 1, 1, 1,
-0.3187701, -1.295419, -3.553371, 1, 1, 1, 1, 1,
-0.3127336, 0.3981467, -1.204266, 1, 1, 1, 1, 1,
-0.3076451, -2.062512, -2.085876, 1, 1, 1, 1, 1,
-0.3068812, 0.6831272, -0.2268761, 1, 1, 1, 1, 1,
-0.3011542, 1.14723, -1.176733, 0, 0, 1, 1, 1,
-0.3004392, 1.461514, 0.5385273, 1, 0, 0, 1, 1,
-0.2984118, 1.622935, 0.8982484, 1, 0, 0, 1, 1,
-0.2968169, 0.3169869, 0.781804, 1, 0, 0, 1, 1,
-0.2923616, -0.8227655, -4.886927, 1, 0, 0, 1, 1,
-0.2905508, -0.02083005, -2.4855, 1, 0, 0, 1, 1,
-0.2904341, 1.065316, -2.127554, 0, 0, 0, 1, 1,
-0.2870896, 1.021871, -1.21846, 0, 0, 0, 1, 1,
-0.2870598, 0.1352832, -1.360767, 0, 0, 0, 1, 1,
-0.2841684, -0.4363562, -5.187465, 0, 0, 0, 1, 1,
-0.2828822, 0.02832014, -2.169075, 0, 0, 0, 1, 1,
-0.2796812, 0.4418437, -1.221246, 0, 0, 0, 1, 1,
-0.2720458, 0.3293113, -0.3114212, 0, 0, 0, 1, 1,
-0.2703241, 0.4960559, 1.728258, 1, 1, 1, 1, 1,
-0.2656458, 0.2053225, -1.799973, 1, 1, 1, 1, 1,
-0.2630793, 0.9390399, -1.204649, 1, 1, 1, 1, 1,
-0.2594732, 1.362197, 0.9252517, 1, 1, 1, 1, 1,
-0.2535483, -1.635369, -2.815174, 1, 1, 1, 1, 1,
-0.2492197, -0.9541013, -3.218129, 1, 1, 1, 1, 1,
-0.2491538, 0.4304013, -1.747339, 1, 1, 1, 1, 1,
-0.2446912, 0.811332, -0.6054684, 1, 1, 1, 1, 1,
-0.2412172, 1.948503, 1.331803, 1, 1, 1, 1, 1,
-0.2409782, -0.1734323, -2.374677, 1, 1, 1, 1, 1,
-0.2400752, 1.651913, 0.551991, 1, 1, 1, 1, 1,
-0.2385936, 0.02010189, -1.171677, 1, 1, 1, 1, 1,
-0.2363851, 1.020202, -2.282391, 1, 1, 1, 1, 1,
-0.2339351, 1.231118, -2.114492, 1, 1, 1, 1, 1,
-0.2336358, 1.922975, -0.06381942, 1, 1, 1, 1, 1,
-0.2321334, 0.5770502, 0.9706313, 0, 0, 1, 1, 1,
-0.2258772, 0.2541474, -2.263098, 1, 0, 0, 1, 1,
-0.2241415, -0.8337917, -2.617213, 1, 0, 0, 1, 1,
-0.2225317, -0.6240966, -2.983634, 1, 0, 0, 1, 1,
-0.2203515, 1.031454, -0.6335339, 1, 0, 0, 1, 1,
-0.2200422, 1.340436, -1.66718, 1, 0, 0, 1, 1,
-0.2192293, -1.0045, -3.732387, 0, 0, 0, 1, 1,
-0.2183478, -0.008026266, -0.4767094, 0, 0, 0, 1, 1,
-0.2138995, -0.7727014, -2.638003, 0, 0, 0, 1, 1,
-0.2051197, 0.4424323, -0.8900237, 0, 0, 0, 1, 1,
-0.2033969, -1.717222, -4.220485, 0, 0, 0, 1, 1,
-0.1985477, -0.3236932, -3.475124, 0, 0, 0, 1, 1,
-0.1972281, -0.2349545, -1.603189, 0, 0, 0, 1, 1,
-0.1955469, -0.3101345, -1.194811, 1, 1, 1, 1, 1,
-0.1951076, -0.07701563, -2.794542, 1, 1, 1, 1, 1,
-0.1867842, -0.9915676, -4.536316, 1, 1, 1, 1, 1,
-0.1824463, 0.8669226, 0.9091408, 1, 1, 1, 1, 1,
-0.17509, -0.3323684, -4.623493, 1, 1, 1, 1, 1,
-0.1722219, 0.4791925, -0.4533367, 1, 1, 1, 1, 1,
-0.1699445, -1.678091, -3.922236, 1, 1, 1, 1, 1,
-0.1621141, -1.01472, -2.491132, 1, 1, 1, 1, 1,
-0.1593509, 0.2620291, 0.8866891, 1, 1, 1, 1, 1,
-0.1526961, -0.9745376, -3.5096, 1, 1, 1, 1, 1,
-0.1525937, 0.3939442, -1.413302, 1, 1, 1, 1, 1,
-0.1493982, 1.653235, 0.1024388, 1, 1, 1, 1, 1,
-0.1482708, 0.2227525, -0.3826023, 1, 1, 1, 1, 1,
-0.1419986, 0.2369856, 0.1624433, 1, 1, 1, 1, 1,
-0.1413352, -0.5933024, -2.575582, 1, 1, 1, 1, 1,
-0.1379829, 0.1529053, -2.001093, 0, 0, 1, 1, 1,
-0.1358443, 0.1374422, -2.218348, 1, 0, 0, 1, 1,
-0.1344881, -0.5717698, -3.462583, 1, 0, 0, 1, 1,
-0.1343397, -0.6256557, -3.568943, 1, 0, 0, 1, 1,
-0.130665, -0.415046, -3.722959, 1, 0, 0, 1, 1,
-0.1296557, 1.691851, -1.063801, 1, 0, 0, 1, 1,
-0.1264714, 0.4277353, -1.481992, 0, 0, 0, 1, 1,
-0.1238313, -0.8748433, -1.705767, 0, 0, 0, 1, 1,
-0.1175983, 0.6607606, 0.3565797, 0, 0, 0, 1, 1,
-0.1154322, -0.006227524, -1.412994, 0, 0, 0, 1, 1,
-0.1130246, 1.165089, -0.4388649, 0, 0, 0, 1, 1,
-0.1102232, -2.148744, -3.11942, 0, 0, 0, 1, 1,
-0.1092758, 0.6556802, -0.2133978, 0, 0, 0, 1, 1,
-0.1041382, 0.240997, 0.6185339, 1, 1, 1, 1, 1,
-0.1000538, -0.9723465, -2.559961, 1, 1, 1, 1, 1,
-0.0982184, -0.6571828, -4.188224, 1, 1, 1, 1, 1,
-0.09646875, -2.870713, -1.390645, 1, 1, 1, 1, 1,
-0.09562255, 0.1878692, -0.4904836, 1, 1, 1, 1, 1,
-0.09440388, -0.2595947, -2.295502, 1, 1, 1, 1, 1,
-0.0920945, 0.2861889, -1.827114, 1, 1, 1, 1, 1,
-0.09114785, 0.5673556, 1.329089, 1, 1, 1, 1, 1,
-0.0900363, 0.1817833, -0.5200503, 1, 1, 1, 1, 1,
-0.08899049, 1.239157, -0.03868684, 1, 1, 1, 1, 1,
-0.08664735, -0.4850785, -4.266074, 1, 1, 1, 1, 1,
-0.08468326, -0.3492859, -2.534439, 1, 1, 1, 1, 1,
-0.08448823, 0.9876084, 0.8303681, 1, 1, 1, 1, 1,
-0.08253518, 1.082548, -0.210227, 1, 1, 1, 1, 1,
-0.07820059, 1.31212, 0.112297, 1, 1, 1, 1, 1,
-0.07622883, 0.1641513, -0.588002, 0, 0, 1, 1, 1,
-0.0746251, -0.8499016, -3.895485, 1, 0, 0, 1, 1,
-0.07257401, -0.34503, -3.429353, 1, 0, 0, 1, 1,
-0.0718438, 1.278352, -0.5849195, 1, 0, 0, 1, 1,
-0.0683576, 0.8671131, 0.6878076, 1, 0, 0, 1, 1,
-0.06682938, 0.5279152, -1.963449, 1, 0, 0, 1, 1,
-0.06363931, -0.6542951, -4.219445, 0, 0, 0, 1, 1,
-0.05768706, -0.8675229, -4.93507, 0, 0, 0, 1, 1,
-0.05499182, 1.52423, -0.9571625, 0, 0, 0, 1, 1,
-0.05095049, 0.2652245, -1.278734, 0, 0, 0, 1, 1,
-0.04813744, -0.6298816, -2.878255, 0, 0, 0, 1, 1,
-0.04453857, -0.04631523, -0.08565902, 0, 0, 0, 1, 1,
-0.03382714, 1.574683, -0.3522229, 0, 0, 0, 1, 1,
-0.02920113, 0.1687276, -0.0329611, 1, 1, 1, 1, 1,
-0.02378186, -0.1610959, -2.202521, 1, 1, 1, 1, 1,
-0.02258196, 1.2131, -0.9598387, 1, 1, 1, 1, 1,
-0.01996879, 1.82714, 1.255461, 1, 1, 1, 1, 1,
-0.01778865, -1.326422, -4.428676, 1, 1, 1, 1, 1,
-0.01774571, -0.8890061, -3.640589, 1, 1, 1, 1, 1,
-0.01467092, 0.6777614, 1.733711, 1, 1, 1, 1, 1,
-0.01152847, -0.8614947, -3.435865, 1, 1, 1, 1, 1,
-0.00670928, 0.8515275, 0.3410852, 1, 1, 1, 1, 1,
-0.001177901, 2.375953, -0.0388108, 1, 1, 1, 1, 1,
0.001071685, 0.1856285, 0.8154575, 1, 1, 1, 1, 1,
0.002146848, -2.059574, 3.45348, 1, 1, 1, 1, 1,
0.00392342, 0.1250817, 0.7981699, 1, 1, 1, 1, 1,
0.005682528, -1.039374, 3.291739, 1, 1, 1, 1, 1,
0.00982317, 0.301454, 1.533651, 1, 1, 1, 1, 1,
0.01069032, 1.086363, -0.7006494, 0, 0, 1, 1, 1,
0.01169408, -2.99791, 1.792263, 1, 0, 0, 1, 1,
0.01474911, 0.333426, -0.1240885, 1, 0, 0, 1, 1,
0.01624126, 0.06582433, -0.4762367, 1, 0, 0, 1, 1,
0.01927795, -0.1879782, 3.369512, 1, 0, 0, 1, 1,
0.02053459, 0.04324804, 0.8196814, 1, 0, 0, 1, 1,
0.02812575, 0.2237345, 1.188732, 0, 0, 0, 1, 1,
0.02841635, -3.071105, 2.358523, 0, 0, 0, 1, 1,
0.03035483, -0.6399505, 1.764677, 0, 0, 0, 1, 1,
0.03053634, -1.380333, 4.225504, 0, 0, 0, 1, 1,
0.04080273, 0.5110334, -0.02325286, 0, 0, 0, 1, 1,
0.04439764, 1.370854, 0.3520553, 0, 0, 0, 1, 1,
0.04847654, 0.2883624, 0.4735793, 0, 0, 0, 1, 1,
0.04883567, 1.719209, 0.4994182, 1, 1, 1, 1, 1,
0.05155127, 0.3146655, 0.9944743, 1, 1, 1, 1, 1,
0.05389765, 0.9783916, 1.674296, 1, 1, 1, 1, 1,
0.05557943, 0.2463976, -0.9697646, 1, 1, 1, 1, 1,
0.05692781, -0.02994578, 1.631445, 1, 1, 1, 1, 1,
0.06093358, 0.1115098, 1.515764, 1, 1, 1, 1, 1,
0.06127084, 1.78078, 0.6018661, 1, 1, 1, 1, 1,
0.07073033, -0.3089862, 2.385363, 1, 1, 1, 1, 1,
0.07230458, 1.464589, 0.4559183, 1, 1, 1, 1, 1,
0.07514223, -1.930589, 2.566938, 1, 1, 1, 1, 1,
0.07572629, 2.289856, -0.3025714, 1, 1, 1, 1, 1,
0.07618123, 0.7491783, -0.04490614, 1, 1, 1, 1, 1,
0.07900875, 0.2749854, 2.481402, 1, 1, 1, 1, 1,
0.08111346, -0.9114196, 3.879721, 1, 1, 1, 1, 1,
0.08287574, 0.798582, -0.3856855, 1, 1, 1, 1, 1,
0.08992707, -0.08211147, 2.826674, 0, 0, 1, 1, 1,
0.09170302, 0.4442529, -0.5637425, 1, 0, 0, 1, 1,
0.09447876, 0.7911838, 1.044866, 1, 0, 0, 1, 1,
0.09454836, 1.498422, -1.438124, 1, 0, 0, 1, 1,
0.1058295, -1.254297, 3.680627, 1, 0, 0, 1, 1,
0.1058609, -1.00323, 4.686429, 1, 0, 0, 1, 1,
0.1096495, -1.094244, 3.243448, 0, 0, 0, 1, 1,
0.1115182, -0.3657268, 2.416836, 0, 0, 0, 1, 1,
0.1127333, 1.575143, -2.540633, 0, 0, 0, 1, 1,
0.1202165, 0.4662653, 0.4344091, 0, 0, 0, 1, 1,
0.1206914, -0.1946247, 1.439829, 0, 0, 0, 1, 1,
0.1227512, 0.4842534, 1.174276, 0, 0, 0, 1, 1,
0.1272066, -0.5115782, 2.04585, 0, 0, 0, 1, 1,
0.1322067, -0.7862234, 3.604437, 1, 1, 1, 1, 1,
0.134392, 0.3137164, 1.30142, 1, 1, 1, 1, 1,
0.1349284, 1.033798, -0.9960437, 1, 1, 1, 1, 1,
0.1351735, 0.07216711, 0.9015789, 1, 1, 1, 1, 1,
0.1402837, -0.1704539, 2.14078, 1, 1, 1, 1, 1,
0.1445607, -0.373616, 3.426017, 1, 1, 1, 1, 1,
0.1450294, -1.917877, 4.756493, 1, 1, 1, 1, 1,
0.145331, 0.5618673, -0.9013855, 1, 1, 1, 1, 1,
0.1530844, -0.08382369, -0.07859304, 1, 1, 1, 1, 1,
0.1536585, -0.846522, 3.668391, 1, 1, 1, 1, 1,
0.1566335, 0.5617141, 1.013478, 1, 1, 1, 1, 1,
0.1587659, 0.487231, 1.511246, 1, 1, 1, 1, 1,
0.1602987, -1.46388, 1.724411, 1, 1, 1, 1, 1,
0.1621543, -0.4574535, 1.268886, 1, 1, 1, 1, 1,
0.1645204, 0.1376005, 1.528175, 1, 1, 1, 1, 1,
0.1655793, -0.02211223, 1.422702, 0, 0, 1, 1, 1,
0.1686995, -1.203173, 2.76798, 1, 0, 0, 1, 1,
0.1690882, 0.7209504, 1.593371, 1, 0, 0, 1, 1,
0.1704709, -0.09243214, 1.395849, 1, 0, 0, 1, 1,
0.1721371, 0.9460667, 1.476549, 1, 0, 0, 1, 1,
0.1742599, -0.5806491, 5.336206, 1, 0, 0, 1, 1,
0.1750757, 0.1102044, 1.296115, 0, 0, 0, 1, 1,
0.1785273, -0.7757881, 1.803538, 0, 0, 0, 1, 1,
0.1794714, 1.842678, 1.077502, 0, 0, 0, 1, 1,
0.1809713, 1.212364, 0.3185089, 0, 0, 0, 1, 1,
0.1888073, 0.6357322, 0.4395783, 0, 0, 0, 1, 1,
0.1920592, -1.800212, 4.925317, 0, 0, 0, 1, 1,
0.192704, 0.2434396, 1.569492, 0, 0, 0, 1, 1,
0.1950475, 0.455809, -0.6630525, 1, 1, 1, 1, 1,
0.1997238, 1.421276, -0.4024136, 1, 1, 1, 1, 1,
0.2007323, 1.367326, 0.7657361, 1, 1, 1, 1, 1,
0.2020983, -2.094419, 2.535072, 1, 1, 1, 1, 1,
0.2026389, -1.246164, 3.102485, 1, 1, 1, 1, 1,
0.2069629, 0.6298228, -0.4337718, 1, 1, 1, 1, 1,
0.2079239, 1.306957, -0.04371309, 1, 1, 1, 1, 1,
0.210488, -0.4365275, -0.5478581, 1, 1, 1, 1, 1,
0.2125339, 0.5472577, -0.3739945, 1, 1, 1, 1, 1,
0.2186233, 1.21031, 1.107803, 1, 1, 1, 1, 1,
0.2203395, 0.3809283, 0.9244109, 1, 1, 1, 1, 1,
0.2238617, 0.8206959, -0.5802826, 1, 1, 1, 1, 1,
0.224744, 2.042267, -0.1545156, 1, 1, 1, 1, 1,
0.2281834, 1.181429, -1.74704, 1, 1, 1, 1, 1,
0.2297761, -1.608189, 3.410286, 1, 1, 1, 1, 1,
0.2322093, 0.07993249, 2.789675, 0, 0, 1, 1, 1,
0.241996, -1.452516, 2.781446, 1, 0, 0, 1, 1,
0.2494441, 1.503557, -0.09155755, 1, 0, 0, 1, 1,
0.2507301, 0.04162682, 2.591123, 1, 0, 0, 1, 1,
0.2521205, -0.1531888, 0.4422083, 1, 0, 0, 1, 1,
0.255691, -0.8054435, 2.829922, 1, 0, 0, 1, 1,
0.2564296, -0.1269865, 3.963544, 0, 0, 0, 1, 1,
0.2564611, -0.03667924, 1.156387, 0, 0, 0, 1, 1,
0.2613901, -0.007125071, 0.955849, 0, 0, 0, 1, 1,
0.2675117, 0.4746907, 0.1594411, 0, 0, 0, 1, 1,
0.2691216, -0.5702158, 2.087272, 0, 0, 0, 1, 1,
0.2691684, -1.117393, 1.943473, 0, 0, 0, 1, 1,
0.2705632, -0.9770986, 3.662859, 0, 0, 0, 1, 1,
0.270835, -0.7288049, 2.839005, 1, 1, 1, 1, 1,
0.2709265, 0.4386706, -0.3924133, 1, 1, 1, 1, 1,
0.2769834, -1.533374, 2.865131, 1, 1, 1, 1, 1,
0.278484, -0.5536854, 1.414267, 1, 1, 1, 1, 1,
0.2785558, 2.0489, -0.1648003, 1, 1, 1, 1, 1,
0.2854487, -0.5377991, 1.637345, 1, 1, 1, 1, 1,
0.2855191, -0.6479312, 2.299275, 1, 1, 1, 1, 1,
0.2870067, -1.248346, 3.471969, 1, 1, 1, 1, 1,
0.2928788, -1.639429, 2.573056, 1, 1, 1, 1, 1,
0.2938119, -1.685368, 4.207554, 1, 1, 1, 1, 1,
0.2971948, -0.256868, 2.436095, 1, 1, 1, 1, 1,
0.3023373, -0.6610074, 2.530209, 1, 1, 1, 1, 1,
0.3113986, 0.7592881, 0.4137855, 1, 1, 1, 1, 1,
0.314768, 1.047412, -0.5621462, 1, 1, 1, 1, 1,
0.3166535, -0.8742178, 3.059132, 1, 1, 1, 1, 1,
0.3198704, -2.176782, 2.423515, 0, 0, 1, 1, 1,
0.3200313, 0.3697201, 0.4421751, 1, 0, 0, 1, 1,
0.3249085, 0.1416933, -0.9333274, 1, 0, 0, 1, 1,
0.3272948, -0.6601923, 3.308546, 1, 0, 0, 1, 1,
0.3312649, -0.6730543, 3.250195, 1, 0, 0, 1, 1,
0.3314656, -2.187534, 2.53838, 1, 0, 0, 1, 1,
0.3316749, -0.3249134, 3.33801, 0, 0, 0, 1, 1,
0.3331583, -1.375275, 4.415274, 0, 0, 0, 1, 1,
0.3338778, -0.4441886, 2.608931, 0, 0, 0, 1, 1,
0.3344057, 0.3832539, 0.5290197, 0, 0, 0, 1, 1,
0.3366726, 0.2993907, -0.9559388, 0, 0, 0, 1, 1,
0.3409233, 1.325444, 0.8713909, 0, 0, 0, 1, 1,
0.3424056, -0.47345, 3.595114, 0, 0, 0, 1, 1,
0.3433316, -0.4251464, -0.5923702, 1, 1, 1, 1, 1,
0.3472593, -0.09722056, 2.683298, 1, 1, 1, 1, 1,
0.3485302, -1.189787, 2.565353, 1, 1, 1, 1, 1,
0.3494942, -1.692859, 3.373787, 1, 1, 1, 1, 1,
0.3543966, 1.274871, 1.442143, 1, 1, 1, 1, 1,
0.3607079, -0.2750873, 2.697822, 1, 1, 1, 1, 1,
0.361216, 0.08402236, 1.988839, 1, 1, 1, 1, 1,
0.3633798, -1.45828, 1.237128, 1, 1, 1, 1, 1,
0.3669497, 1.212753, 0.01041702, 1, 1, 1, 1, 1,
0.3687252, -0.1009439, 0.9071293, 1, 1, 1, 1, 1,
0.373073, -0.07316134, 2.678268, 1, 1, 1, 1, 1,
0.3770473, 0.6523194, -0.6035042, 1, 1, 1, 1, 1,
0.3792537, -2.189109, 4.071693, 1, 1, 1, 1, 1,
0.3809168, -2.041097, 2.644059, 1, 1, 1, 1, 1,
0.3830226, 1.416718, -0.7948213, 1, 1, 1, 1, 1,
0.3831446, 0.1996496, 2.100087, 0, 0, 1, 1, 1,
0.3915644, 0.332132, 0.7648759, 1, 0, 0, 1, 1,
0.3917893, -0.1320943, 2.952515, 1, 0, 0, 1, 1,
0.4003902, 1.777849, 0.7163523, 1, 0, 0, 1, 1,
0.4008761, -1.528905, 3.441357, 1, 0, 0, 1, 1,
0.4011867, -1.412827, 1.050476, 1, 0, 0, 1, 1,
0.4022847, 0.05035662, 2.354335, 0, 0, 0, 1, 1,
0.4036676, 0.2543227, 1.315293, 0, 0, 0, 1, 1,
0.4063855, -0.4050691, 2.96672, 0, 0, 0, 1, 1,
0.40836, -1.10192, 3.137686, 0, 0, 0, 1, 1,
0.4103326, 0.3808035, 1.251294, 0, 0, 0, 1, 1,
0.4188028, -0.5136423, 3.366336, 0, 0, 0, 1, 1,
0.4214675, -0.4539986, 2.135337, 0, 0, 0, 1, 1,
0.4219795, 0.7441651, -0.133078, 1, 1, 1, 1, 1,
0.4240631, 1.291812, -0.6743143, 1, 1, 1, 1, 1,
0.4255862, -0.3932819, 2.089833, 1, 1, 1, 1, 1,
0.4407933, 1.299613, 0.9007425, 1, 1, 1, 1, 1,
0.4490334, -1.40574, 1.758142, 1, 1, 1, 1, 1,
0.450029, 2.165471, -0.4950672, 1, 1, 1, 1, 1,
0.4518209, 1.788655, 0.9575779, 1, 1, 1, 1, 1,
0.4547907, 0.2934373, 1.306271, 1, 1, 1, 1, 1,
0.4563703, 0.1657505, 1.468398, 1, 1, 1, 1, 1,
0.4568006, 1.182036, 0.4730878, 1, 1, 1, 1, 1,
0.4629469, 0.5927921, 0.6920488, 1, 1, 1, 1, 1,
0.4642301, -0.8089885, 3.378967, 1, 1, 1, 1, 1,
0.4643239, 0.3053034, -0.02877425, 1, 1, 1, 1, 1,
0.4646382, -0.0593562, 1.769511, 1, 1, 1, 1, 1,
0.4707792, 0.007326826, 0.9099013, 1, 1, 1, 1, 1,
0.4720587, 1.552253, -0.3671932, 0, 0, 1, 1, 1,
0.4731592, 0.4724386, -1.126515, 1, 0, 0, 1, 1,
0.4763519, 1.659515, 0.2928626, 1, 0, 0, 1, 1,
0.478261, -2.473921, 3.354709, 1, 0, 0, 1, 1,
0.4792882, -0.6897852, 2.881402, 1, 0, 0, 1, 1,
0.4845738, -1.55578, 1.401745, 1, 0, 0, 1, 1,
0.491098, -1.592146, 3.432878, 0, 0, 0, 1, 1,
0.4991741, -0.03382911, 2.024526, 0, 0, 0, 1, 1,
0.5005851, 0.1101954, 2.262663, 0, 0, 0, 1, 1,
0.5012196, 0.4117408, 1.203778, 0, 0, 0, 1, 1,
0.5041456, 0.1049352, 1.360156, 0, 0, 0, 1, 1,
0.5074464, -0.3881789, 1.327334, 0, 0, 0, 1, 1,
0.5094075, -0.6598153, 3.149639, 0, 0, 0, 1, 1,
0.5113809, -1.423976, 3.125888, 1, 1, 1, 1, 1,
0.5184151, 0.1555268, 1.858263, 1, 1, 1, 1, 1,
0.5195961, -2.047795, 3.502067, 1, 1, 1, 1, 1,
0.5252982, -1.380355, 2.936008, 1, 1, 1, 1, 1,
0.5291339, -0.2719927, 2.540904, 1, 1, 1, 1, 1,
0.537025, 0.9105482, -1.137556, 1, 1, 1, 1, 1,
0.5371454, -1.130661, 2.246296, 1, 1, 1, 1, 1,
0.5437655, 1.84174, 1.534191, 1, 1, 1, 1, 1,
0.5441568, -0.1295666, 0.9138561, 1, 1, 1, 1, 1,
0.544831, -1.88112, 3.985067, 1, 1, 1, 1, 1,
0.5478816, -1.6996, 1.194921, 1, 1, 1, 1, 1,
0.5487669, -1.000888, 2.544602, 1, 1, 1, 1, 1,
0.5537286, -0.241526, 2.082602, 1, 1, 1, 1, 1,
0.5545694, -1.702775, 1.048576, 1, 1, 1, 1, 1,
0.5550771, -0.9067258, -0.237229, 1, 1, 1, 1, 1,
0.5587865, -0.5629208, 2.168247, 0, 0, 1, 1, 1,
0.5601286, -0.4252026, 0.8298871, 1, 0, 0, 1, 1,
0.5606692, 0.6558006, 1.604537, 1, 0, 0, 1, 1,
0.565378, 2.448396, 0.7297839, 1, 0, 0, 1, 1,
0.5713814, -1.016332, 1.88355, 1, 0, 0, 1, 1,
0.5724714, 0.8226718, 0.847813, 1, 0, 0, 1, 1,
0.575847, -1.842672, 2.261515, 0, 0, 0, 1, 1,
0.5776296, -0.0241317, 2.980631, 0, 0, 0, 1, 1,
0.5807794, -0.301647, 2.236461, 0, 0, 0, 1, 1,
0.5855874, 0.8966968, 0.882253, 0, 0, 0, 1, 1,
0.5858091, -1.070961, 2.814872, 0, 0, 0, 1, 1,
0.5918322, -1.240367, 4.114673, 0, 0, 0, 1, 1,
0.5933546, 0.5425233, 0.828048, 0, 0, 0, 1, 1,
0.5964711, -0.4590262, 2.665094, 1, 1, 1, 1, 1,
0.5970863, -0.6771577, 3.723598, 1, 1, 1, 1, 1,
0.5976174, 1.251459, -0.7612503, 1, 1, 1, 1, 1,
0.5988284, 1.563587, 1.632592, 1, 1, 1, 1, 1,
0.599034, -0.9470425, 2.643375, 1, 1, 1, 1, 1,
0.5994039, -0.4511421, 3.171235, 1, 1, 1, 1, 1,
0.6155302, 1.166809, 1.385124, 1, 1, 1, 1, 1,
0.6155885, -0.1190238, 0.9736259, 1, 1, 1, 1, 1,
0.6167591, 0.6088108, 0.6842858, 1, 1, 1, 1, 1,
0.6195864, -1.119299, 2.364109, 1, 1, 1, 1, 1,
0.6215996, -1.515087, 3.41708, 1, 1, 1, 1, 1,
0.6278322, 0.775991, 0.5858516, 1, 1, 1, 1, 1,
0.630533, -0.03591483, -1.357691, 1, 1, 1, 1, 1,
0.6329529, 0.6980215, -0.3457772, 1, 1, 1, 1, 1,
0.6379388, 0.2360931, 0.8792772, 1, 1, 1, 1, 1,
0.6409448, 1.291955, 1.2374, 0, 0, 1, 1, 1,
0.6436168, 0.2717567, 2.103795, 1, 0, 0, 1, 1,
0.6448414, -0.4043228, 0.6783552, 1, 0, 0, 1, 1,
0.6450766, 0.002999855, 1.05964, 1, 0, 0, 1, 1,
0.6454671, 1.493296, 0.3293314, 1, 0, 0, 1, 1,
0.6508284, 0.2392463, 2.537126, 1, 0, 0, 1, 1,
0.6556096, 0.5178953, 1.654266, 0, 0, 0, 1, 1,
0.6574548, -0.6547198, 1.408383, 0, 0, 0, 1, 1,
0.6589377, 1.651118, 0.1456287, 0, 0, 0, 1, 1,
0.6604639, 0.9022727, 0.6861296, 0, 0, 0, 1, 1,
0.6655082, -0.8367597, 1.869383, 0, 0, 0, 1, 1,
0.6682371, 0.5823604, 0.318121, 0, 0, 0, 1, 1,
0.6686265, 0.07256273, 1.180123, 0, 0, 0, 1, 1,
0.6705276, -0.7985033, 3.90519, 1, 1, 1, 1, 1,
0.6722205, 0.5228751, 1.211661, 1, 1, 1, 1, 1,
0.6772112, -0.382462, 2.045446, 1, 1, 1, 1, 1,
0.6816249, -0.7871021, 2.966623, 1, 1, 1, 1, 1,
0.6886473, 0.03984105, 2.860234, 1, 1, 1, 1, 1,
0.6895407, -0.3509776, 2.180433, 1, 1, 1, 1, 1,
0.6921132, 1.232485, 2.333153, 1, 1, 1, 1, 1,
0.6947623, -0.9465327, 2.873162, 1, 1, 1, 1, 1,
0.6965929, 0.5630739, 0.4430645, 1, 1, 1, 1, 1,
0.7027013, -0.02941461, 2.731994, 1, 1, 1, 1, 1,
0.7038467, -1.832914, 2.097586, 1, 1, 1, 1, 1,
0.7076148, 1.705982, 0.5743234, 1, 1, 1, 1, 1,
0.7138658, -0.2519954, 0.1862332, 1, 1, 1, 1, 1,
0.7155997, 0.1178597, 2.508958, 1, 1, 1, 1, 1,
0.7208955, -0.5505424, 2.169906, 1, 1, 1, 1, 1,
0.7251862, -0.3531622, 1.070169, 0, 0, 1, 1, 1,
0.7296976, 1.670774, 0.4322511, 1, 0, 0, 1, 1,
0.7338813, -1.497563, 4.002644, 1, 0, 0, 1, 1,
0.7340301, -0.1827888, 1.359529, 1, 0, 0, 1, 1,
0.7364347, 0.7290412, 0.4787849, 1, 0, 0, 1, 1,
0.7368222, -0.1116693, 2.278878, 1, 0, 0, 1, 1,
0.7437533, -0.6842665, 3.40834, 0, 0, 0, 1, 1,
0.744045, 0.4010246, 2.223783, 0, 0, 0, 1, 1,
0.7557589, -0.001610741, 1.467339, 0, 0, 0, 1, 1,
0.7575135, 1.041906, -0.806329, 0, 0, 0, 1, 1,
0.7594768, -1.032604, 2.398767, 0, 0, 0, 1, 1,
0.7639832, -0.01223352, 1.23757, 0, 0, 0, 1, 1,
0.7724458, 0.5009459, 0.4020197, 0, 0, 0, 1, 1,
0.7756203, -1.120734, 3.459489, 1, 1, 1, 1, 1,
0.7796221, -0.02969877, 2.033695, 1, 1, 1, 1, 1,
0.7839241, 0.5383102, 0.9499076, 1, 1, 1, 1, 1,
0.7890986, -0.3464382, 1.80093, 1, 1, 1, 1, 1,
0.7998716, -0.5602113, 1.125285, 1, 1, 1, 1, 1,
0.800583, -0.02742775, 1.79428, 1, 1, 1, 1, 1,
0.8065855, -0.351736, 1.485535, 1, 1, 1, 1, 1,
0.8074394, 0.2248363, 0.213972, 1, 1, 1, 1, 1,
0.8107598, -1.211108, 3.764636, 1, 1, 1, 1, 1,
0.8166879, 0.6120175, 1.531028, 1, 1, 1, 1, 1,
0.8168067, -0.1597086, 0.5169526, 1, 1, 1, 1, 1,
0.8175492, -0.127197, 2.72821, 1, 1, 1, 1, 1,
0.8204811, -2.299337, 1.521714, 1, 1, 1, 1, 1,
0.8243396, -1.092151, 2.833572, 1, 1, 1, 1, 1,
0.8324, -0.9506921, 2.294327, 1, 1, 1, 1, 1,
0.8444531, 0.4177373, 1.812562, 0, 0, 1, 1, 1,
0.8478434, 1.692453, -0.08066796, 1, 0, 0, 1, 1,
0.8536807, -2.004993, 2.121864, 1, 0, 0, 1, 1,
0.8538377, 0.7349768, 0.3766983, 1, 0, 0, 1, 1,
0.8560501, -1.331339, 2.775599, 1, 0, 0, 1, 1,
0.8585399, -0.1908445, 1.959608, 1, 0, 0, 1, 1,
0.8634816, 2.045896, -0.475079, 0, 0, 0, 1, 1,
0.8650686, -0.02652242, 1.472063, 0, 0, 0, 1, 1,
0.8674983, 0.4091444, 2.282144, 0, 0, 0, 1, 1,
0.872065, -0.1371176, 2.382347, 0, 0, 0, 1, 1,
0.8720902, 0.9246255, 1.840114, 0, 0, 0, 1, 1,
0.8735766, -0.1520496, 1.712821, 0, 0, 0, 1, 1,
0.877876, 1.87606, 0.07932144, 0, 0, 0, 1, 1,
0.8810337, -0.4605307, 0.7843566, 1, 1, 1, 1, 1,
0.8854803, -0.8356042, 2.716874, 1, 1, 1, 1, 1,
0.8875024, 0.1246224, 2.969179, 1, 1, 1, 1, 1,
0.9024716, 0.03352181, 1.286083, 1, 1, 1, 1, 1,
0.9031175, -0.4791646, 0.8054852, 1, 1, 1, 1, 1,
0.9056427, 0.4805675, 1.528014, 1, 1, 1, 1, 1,
0.9099978, -0.7917965, 2.411685, 1, 1, 1, 1, 1,
0.9105764, 0.2694011, 2.05836, 1, 1, 1, 1, 1,
0.9226764, -0.07342557, 0.9904627, 1, 1, 1, 1, 1,
0.929021, 0.7854055, 0.8341447, 1, 1, 1, 1, 1,
0.9384031, -1.675676, 3.239892, 1, 1, 1, 1, 1,
0.9439595, 0.6223757, 1.802648, 1, 1, 1, 1, 1,
0.9470413, -0.3558681, 1.404017, 1, 1, 1, 1, 1,
0.948299, -0.474579, -1.10305, 1, 1, 1, 1, 1,
0.9503831, -1.1825, 1.799343, 1, 1, 1, 1, 1,
0.9528867, 0.2628295, 1.688081, 0, 0, 1, 1, 1,
0.9534191, -0.1099009, 2.093707, 1, 0, 0, 1, 1,
0.959477, 0.1261222, 2.118211, 1, 0, 0, 1, 1,
0.9701219, -0.6011963, 2.235498, 1, 0, 0, 1, 1,
0.9735866, 0.3197489, 0.7968895, 1, 0, 0, 1, 1,
0.9739625, -0.1153536, 0.7534823, 1, 0, 0, 1, 1,
0.9759958, -1.737635, 3.430948, 0, 0, 0, 1, 1,
0.9791834, 1.88387, -0.649484, 0, 0, 0, 1, 1,
0.9814475, -1.469911, 2.455325, 0, 0, 0, 1, 1,
0.984106, 1.373027, 2.617306, 0, 0, 0, 1, 1,
0.9928545, 0.1899007, 1.784111, 0, 0, 0, 1, 1,
0.9930229, 1.075084, 1.028742, 0, 0, 0, 1, 1,
0.994715, -0.3567092, 3.400306, 0, 0, 0, 1, 1,
0.9986075, 0.7683045, 0.5424092, 1, 1, 1, 1, 1,
1.010138, 0.2505826, 2.740578, 1, 1, 1, 1, 1,
1.011528, -0.9678981, 3.769302, 1, 1, 1, 1, 1,
1.013437, 1.121222, 0.9474893, 1, 1, 1, 1, 1,
1.022573, -0.05666156, 0.6073776, 1, 1, 1, 1, 1,
1.023614, -1.201384, 1.088683, 1, 1, 1, 1, 1,
1.031333, 1.135007, 0.4436477, 1, 1, 1, 1, 1,
1.03665, -0.7547444, 1.151634, 1, 1, 1, 1, 1,
1.041805, -0.0129528, 2.88035, 1, 1, 1, 1, 1,
1.043317, 0.8628496, 0.2456336, 1, 1, 1, 1, 1,
1.045193, -1.353566, 2.38702, 1, 1, 1, 1, 1,
1.045438, 0.6066004, 0.6334159, 1, 1, 1, 1, 1,
1.049304, -0.4906247, 0.9357243, 1, 1, 1, 1, 1,
1.052046, -2.280741, 3.216345, 1, 1, 1, 1, 1,
1.052223, -0.4035744, 2.301857, 1, 1, 1, 1, 1,
1.05617, 1.330354, 0.1727456, 0, 0, 1, 1, 1,
1.06433, 0.2118257, 2.2511, 1, 0, 0, 1, 1,
1.065194, -0.0816895, 0.350197, 1, 0, 0, 1, 1,
1.065355, -0.8378755, 0.9741035, 1, 0, 0, 1, 1,
1.065426, -0.6705987, 2.824636, 1, 0, 0, 1, 1,
1.066213, -2.49052, 4.894493, 1, 0, 0, 1, 1,
1.068846, 0.06542537, 1.808693, 0, 0, 0, 1, 1,
1.07176, 0.3358324, 2.119622, 0, 0, 0, 1, 1,
1.084369, 0.2792884, 1.292123, 0, 0, 0, 1, 1,
1.089459, -0.2592072, 1.863475, 0, 0, 0, 1, 1,
1.098428, -1.012206, 3.546499, 0, 0, 0, 1, 1,
1.100497, 0.2609784, 2.353565, 0, 0, 0, 1, 1,
1.103833, -1.732143, 2.886156, 0, 0, 0, 1, 1,
1.104987, -1.56204, 3.236214, 1, 1, 1, 1, 1,
1.107235, 1.006489, 1.119502, 1, 1, 1, 1, 1,
1.108693, 0.8317074, -0.88397, 1, 1, 1, 1, 1,
1.109124, -0.9460362, 3.780112, 1, 1, 1, 1, 1,
1.113127, 2.552088, -1.263583, 1, 1, 1, 1, 1,
1.115607, -1.046338, 3.41246, 1, 1, 1, 1, 1,
1.115785, -0.364246, 2.715542, 1, 1, 1, 1, 1,
1.120609, -0.7702278, 2.275015, 1, 1, 1, 1, 1,
1.122638, -1.198178, 0.6876476, 1, 1, 1, 1, 1,
1.123148, 0.4367022, 2.497787, 1, 1, 1, 1, 1,
1.126271, -0.5615014, 0.4899332, 1, 1, 1, 1, 1,
1.142002, 0.2476811, 0.6370941, 1, 1, 1, 1, 1,
1.144522, 2.22179, -1.103134, 1, 1, 1, 1, 1,
1.145638, 0.2251339, 1.157339, 1, 1, 1, 1, 1,
1.153175, 0.5084691, 2.319948, 1, 1, 1, 1, 1,
1.154202, -1.001327, 1.514223, 0, 0, 1, 1, 1,
1.154872, -0.4685619, 2.645966, 1, 0, 0, 1, 1,
1.162523, -0.1201998, -0.02894883, 1, 0, 0, 1, 1,
1.162807, -1.089093, 1.79023, 1, 0, 0, 1, 1,
1.163905, 1.26567, 1.588502, 1, 0, 0, 1, 1,
1.172217, 0.04377395, 1.776812, 1, 0, 0, 1, 1,
1.17694, -0.2945892, 1.798253, 0, 0, 0, 1, 1,
1.177704, -0.865084, 2.798966, 0, 0, 0, 1, 1,
1.191067, 0.04811158, 0.4291175, 0, 0, 0, 1, 1,
1.214498, 1.015731, 2.268119, 0, 0, 0, 1, 1,
1.219154, -0.9020005, 3.509531, 0, 0, 0, 1, 1,
1.222969, -0.4630934, 3.236617, 0, 0, 0, 1, 1,
1.224469, 1.202692, -0.3537007, 0, 0, 0, 1, 1,
1.225446, 1.025979, -0.2865483, 1, 1, 1, 1, 1,
1.227037, 1.064832, -0.9003227, 1, 1, 1, 1, 1,
1.229843, -1.164734, 2.215031, 1, 1, 1, 1, 1,
1.233605, -1.057897, 2.791623, 1, 1, 1, 1, 1,
1.239696, -1.097199, 3.496388, 1, 1, 1, 1, 1,
1.245722, 0.5469413, 1.067805, 1, 1, 1, 1, 1,
1.248087, 0.8541136, -0.1976186, 1, 1, 1, 1, 1,
1.248749, -0.4376825, 3.079689, 1, 1, 1, 1, 1,
1.249424, 0.472783, -0.4426589, 1, 1, 1, 1, 1,
1.251579, 0.06227842, 1.64666, 1, 1, 1, 1, 1,
1.254736, -0.697411, 2.89399, 1, 1, 1, 1, 1,
1.262566, 1.560548, -0.191549, 1, 1, 1, 1, 1,
1.27032, -0.1646442, 1.427209, 1, 1, 1, 1, 1,
1.271676, 0.6430316, 0.1652783, 1, 1, 1, 1, 1,
1.274362, -0.7533846, 2.35095, 1, 1, 1, 1, 1,
1.276099, -1.053772, 3.009086, 0, 0, 1, 1, 1,
1.287853, 1.39515, 0.2685772, 1, 0, 0, 1, 1,
1.293517, 1.693885, 0.9761078, 1, 0, 0, 1, 1,
1.293877, 0.8012056, 2.692154, 1, 0, 0, 1, 1,
1.29691, -1.619228, 2.16112, 1, 0, 0, 1, 1,
1.300269, 0.002739781, 2.251956, 1, 0, 0, 1, 1,
1.300683, -0.5759912, 2.610785, 0, 0, 0, 1, 1,
1.302347, -0.4595683, 1.032261, 0, 0, 0, 1, 1,
1.30663, -0.4754827, 3.004521, 0, 0, 0, 1, 1,
1.307561, 0.3494004, 2.022959, 0, 0, 0, 1, 1,
1.307766, 0.9201294, 0.4966348, 0, 0, 0, 1, 1,
1.307876, -0.4335455, 1.807398, 0, 0, 0, 1, 1,
1.312551, 1.209669, 2.633366, 0, 0, 0, 1, 1,
1.315204, -0.5211318, 1.145253, 1, 1, 1, 1, 1,
1.316587, 0.7051514, 2.799059, 1, 1, 1, 1, 1,
1.316791, -0.6491318, 2.119074, 1, 1, 1, 1, 1,
1.317878, 0.79105, 1.326309, 1, 1, 1, 1, 1,
1.320662, -0.09260146, 0.3612036, 1, 1, 1, 1, 1,
1.322533, 0.3720075, 1.625738, 1, 1, 1, 1, 1,
1.334022, -0.5300827, 2.400738, 1, 1, 1, 1, 1,
1.338286, 0.2764947, 1.520235, 1, 1, 1, 1, 1,
1.341806, 1.082116, 1.224425, 1, 1, 1, 1, 1,
1.342108, -1.661364, 1.858609, 1, 1, 1, 1, 1,
1.345142, -0.8826202, 2.079717, 1, 1, 1, 1, 1,
1.355927, -1.218292, 1.055434, 1, 1, 1, 1, 1,
1.362831, 0.8572708, 0.3893391, 1, 1, 1, 1, 1,
1.366065, 1.678823, 0.5165722, 1, 1, 1, 1, 1,
1.369767, 0.01248045, -0.4688048, 1, 1, 1, 1, 1,
1.372126, -1.67478, 4.462991, 0, 0, 1, 1, 1,
1.373129, -0.5986805, 1.49685, 1, 0, 0, 1, 1,
1.392882, -1.756881, 2.884065, 1, 0, 0, 1, 1,
1.400101, -1.711673, 2.71932, 1, 0, 0, 1, 1,
1.409273, -0.2272907, 1.10957, 1, 0, 0, 1, 1,
1.413413, -0.6247365, 0.6163429, 1, 0, 0, 1, 1,
1.41537, 1.170381, 1.901454, 0, 0, 0, 1, 1,
1.430682, -1.823007, 2.802994, 0, 0, 0, 1, 1,
1.435367, -0.4243992, 0.2512964, 0, 0, 0, 1, 1,
1.436081, 0.3027304, 3.124862, 0, 0, 0, 1, 1,
1.438943, -1.625829, 1.958945, 0, 0, 0, 1, 1,
1.439265, -0.7279973, 4.184805, 0, 0, 0, 1, 1,
1.44304, -1.950632, 1.135104, 0, 0, 0, 1, 1,
1.450179, -1.382456, 1.045596, 1, 1, 1, 1, 1,
1.45081, 0.0007823167, 1.357422, 1, 1, 1, 1, 1,
1.459743, 0.4001219, 1.823537, 1, 1, 1, 1, 1,
1.469747, 0.984589, 0.1664966, 1, 1, 1, 1, 1,
1.475911, -1.007395, 3.266974, 1, 1, 1, 1, 1,
1.477344, -0.5670885, 3.096167, 1, 1, 1, 1, 1,
1.492637, 0.01501976, 1.835579, 1, 1, 1, 1, 1,
1.494685, -0.6720969, 1.397751, 1, 1, 1, 1, 1,
1.530757, -1.123645, 1.118885, 1, 1, 1, 1, 1,
1.531651, -0.4238793, 1.409965, 1, 1, 1, 1, 1,
1.553518, 0.3118113, 0.8074952, 1, 1, 1, 1, 1,
1.562217, 2.245008, 1.262218, 1, 1, 1, 1, 1,
1.57839, -0.2924188, 3.194911, 1, 1, 1, 1, 1,
1.590432, 0.4713067, 1.660881, 1, 1, 1, 1, 1,
1.59301, 0.465875, 1.357933, 1, 1, 1, 1, 1,
1.597953, -0.9315655, 1.542965, 0, 0, 1, 1, 1,
1.60428, -1.169976, 0.9565178, 1, 0, 0, 1, 1,
1.609763, 1.451822, 0.3318912, 1, 0, 0, 1, 1,
1.651399, -0.1712439, 3.67279, 1, 0, 0, 1, 1,
1.663723, -0.2995491, 1.156539, 1, 0, 0, 1, 1,
1.673311, 0.3108587, -0.2807319, 1, 0, 0, 1, 1,
1.683621, 0.9026023, -0.6819965, 0, 0, 0, 1, 1,
1.686603, 0.186417, 4.030551, 0, 0, 0, 1, 1,
1.699791, -1.321695, 2.483026, 0, 0, 0, 1, 1,
1.720233, -1.28571, 1.829222, 0, 0, 0, 1, 1,
1.76858, -0.08082894, 3.070932, 0, 0, 0, 1, 1,
1.780096, 0.5115988, 1.405731, 0, 0, 0, 1, 1,
1.798522, 0.9094921, 0.4203957, 0, 0, 0, 1, 1,
1.802576, 0.1945828, 4.100754, 1, 1, 1, 1, 1,
1.805677, -0.8574179, 1.647238, 1, 1, 1, 1, 1,
1.812466, -0.5783302, 3.449179, 1, 1, 1, 1, 1,
1.813213, -0.8821506, 2.355353, 1, 1, 1, 1, 1,
1.820882, -0.5679263, 1.81803, 1, 1, 1, 1, 1,
1.829431, 0.2515532, 0.2448768, 1, 1, 1, 1, 1,
1.867403, -0.1207806, 0.3684171, 1, 1, 1, 1, 1,
1.976093, 1.101349, 0.4075417, 1, 1, 1, 1, 1,
1.979222, 1.262564, -1.489008, 1, 1, 1, 1, 1,
1.989995, -2.465261, 2.019531, 1, 1, 1, 1, 1,
2.005744, -1.372815, 4.621796, 1, 1, 1, 1, 1,
2.035282, -1.629397, 1.898889, 1, 1, 1, 1, 1,
2.072795, 1.025264, 1.554874, 1, 1, 1, 1, 1,
2.086015, -0.4616945, 1.217356, 1, 1, 1, 1, 1,
2.087318, 1.335919, 0.5848326, 1, 1, 1, 1, 1,
2.115471, 0.8127509, 1.700502, 0, 0, 1, 1, 1,
2.120186, -1.252876, 2.019808, 1, 0, 0, 1, 1,
2.128778, -0.5347426, 0.4330304, 1, 0, 0, 1, 1,
2.152447, 0.05440022, 1.700875, 1, 0, 0, 1, 1,
2.159005, 0.1502377, 1.26724, 1, 0, 0, 1, 1,
2.195495, -0.9661028, 0.6226104, 1, 0, 0, 1, 1,
2.205765, 0.849018, 1.84671, 0, 0, 0, 1, 1,
2.210168, -0.3371745, 1.863105, 0, 0, 0, 1, 1,
2.320922, 0.9600368, 1.16581, 0, 0, 0, 1, 1,
2.333509, -0.6404436, 2.408202, 0, 0, 0, 1, 1,
2.342818, -0.9452264, 2.068052, 0, 0, 0, 1, 1,
2.354256, 1.007038, 1.326923, 0, 0, 0, 1, 1,
2.52247, 2.867845, 2.206041, 0, 0, 0, 1, 1,
2.576741, 0.5277247, 1.537458, 1, 1, 1, 1, 1,
2.704594, 0.9459665, 2.074792, 1, 1, 1, 1, 1,
2.724499, 1.365242, 1.890023, 1, 1, 1, 1, 1,
2.788145, 1.584032, 3.290771, 1, 1, 1, 1, 1,
2.957, -1.058598, 4.489637, 1, 1, 1, 1, 1,
3.002246, -1.117317, 0.6390412, 1, 1, 1, 1, 1,
3.139503, 0.8517499, 0.7770919, 1, 1, 1, 1, 1
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
var radius = 9.320117;
var distance = 32.73652;
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
mvMatrix.translate( -0.0827533, 0.1472651, -0.07437086 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.73652);
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
