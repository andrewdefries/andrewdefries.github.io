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
-3.14212, 0.2889434, -2.059125, 1, 0, 0, 1,
-2.925501, -0.06165788, -0.5744553, 1, 0.007843138, 0, 1,
-2.781412, 0.836478, -0.1074681, 1, 0.01176471, 0, 1,
-2.727215, -0.1699004, -1.377934, 1, 0.01960784, 0, 1,
-2.688579, -1.011181, -2.179454, 1, 0.02352941, 0, 1,
-2.567318, 0.2310106, -3.689706, 1, 0.03137255, 0, 1,
-2.542825, -1.8, -2.843795, 1, 0.03529412, 0, 1,
-2.507599, -0.5537407, -0.1326171, 1, 0.04313726, 0, 1,
-2.500286, -0.1741834, -0.6108599, 1, 0.04705882, 0, 1,
-2.441625, 0.8442724, -1.021821, 1, 0.05490196, 0, 1,
-2.381899, -1.335523, -2.372708, 1, 0.05882353, 0, 1,
-2.335879, 1.849486, 0.07467471, 1, 0.06666667, 0, 1,
-2.251201, 0.9613598, -1.151298, 1, 0.07058824, 0, 1,
-2.233989, -0.4300212, -2.247965, 1, 0.07843138, 0, 1,
-2.194614, 0.4534173, -0.5917436, 1, 0.08235294, 0, 1,
-2.181044, -0.06456026, -2.442868, 1, 0.09019608, 0, 1,
-2.163301, 1.110255, 0.6147808, 1, 0.09411765, 0, 1,
-2.160528, -0.3031318, -1.942377, 1, 0.1019608, 0, 1,
-2.137546, -0.4697367, -2.937572, 1, 0.1098039, 0, 1,
-2.125729, -2.852658, -3.54421, 1, 0.1137255, 0, 1,
-2.10882, 0.163086, -2.004488, 1, 0.1215686, 0, 1,
-2.089861, 1.776621, 0.09847145, 1, 0.1254902, 0, 1,
-2.060792, 0.5086931, -0.68061, 1, 0.1333333, 0, 1,
-2.045141, -0.4284818, -4.529236, 1, 0.1372549, 0, 1,
-2.018151, 0.2521622, -1.171446, 1, 0.145098, 0, 1,
-2.000468, 0.2858354, -1.74717, 1, 0.1490196, 0, 1,
-2.000432, -1.395635, -1.714289, 1, 0.1568628, 0, 1,
-1.989105, 0.8867798, -0.3279453, 1, 0.1607843, 0, 1,
-1.963977, -1.110391, -2.68436, 1, 0.1686275, 0, 1,
-1.960762, -1.954633, -2.440874, 1, 0.172549, 0, 1,
-1.957376, -0.2499831, -1.630004, 1, 0.1803922, 0, 1,
-1.955621, -0.7159743, -1.287569, 1, 0.1843137, 0, 1,
-1.940015, -0.7994281, -0.6910841, 1, 0.1921569, 0, 1,
-1.937923, 1.076018, -1.569955, 1, 0.1960784, 0, 1,
-1.914277, 1.400295, -1.186386, 1, 0.2039216, 0, 1,
-1.913242, -0.4563603, -2.616731, 1, 0.2117647, 0, 1,
-1.912515, 0.7791048, -0.5765469, 1, 0.2156863, 0, 1,
-1.911815, 0.5082422, -0.2617091, 1, 0.2235294, 0, 1,
-1.897875, -0.744386, -1.796523, 1, 0.227451, 0, 1,
-1.864261, 0.5337743, -2.848982, 1, 0.2352941, 0, 1,
-1.861036, -0.2815321, -2.011446, 1, 0.2392157, 0, 1,
-1.847843, 0.3060417, -0.6637887, 1, 0.2470588, 0, 1,
-1.831948, 0.9733381, -0.8909892, 1, 0.2509804, 0, 1,
-1.784147, -0.3155794, -2.151487, 1, 0.2588235, 0, 1,
-1.748009, 0.05322599, -2.224073, 1, 0.2627451, 0, 1,
-1.734416, -0.1231059, -0.8840434, 1, 0.2705882, 0, 1,
-1.7328, -0.289606, -1.544659, 1, 0.2745098, 0, 1,
-1.722556, -0.3868958, -2.476768, 1, 0.282353, 0, 1,
-1.689278, -0.4153486, -2.845603, 1, 0.2862745, 0, 1,
-1.680393, 0.9195002, -1.062013, 1, 0.2941177, 0, 1,
-1.675438, -0.251068, -0.4799149, 1, 0.3019608, 0, 1,
-1.675131, 0.2082639, -2.34536, 1, 0.3058824, 0, 1,
-1.655382, -0.1701906, -1.576924, 1, 0.3137255, 0, 1,
-1.648562, -1.022502, -2.225976, 1, 0.3176471, 0, 1,
-1.644525, -0.7763118, -1.55533, 1, 0.3254902, 0, 1,
-1.619272, 0.5059877, -0.810523, 1, 0.3294118, 0, 1,
-1.618185, 0.01947443, -1.191775, 1, 0.3372549, 0, 1,
-1.599199, 2.95945, -0.1842874, 1, 0.3411765, 0, 1,
-1.592966, 0.8111371, -1.269012, 1, 0.3490196, 0, 1,
-1.581749, -0.4694094, -1.411894, 1, 0.3529412, 0, 1,
-1.580513, -0.591391, -1.196566, 1, 0.3607843, 0, 1,
-1.577387, -0.3342855, -1.157032, 1, 0.3647059, 0, 1,
-1.575349, -0.3491242, -1.517678, 1, 0.372549, 0, 1,
-1.57017, -1.0453, -3.467765, 1, 0.3764706, 0, 1,
-1.565252, -0.3866771, -2.518162, 1, 0.3843137, 0, 1,
-1.563048, 0.7317504, -1.379462, 1, 0.3882353, 0, 1,
-1.558832, 0.07190734, -2.511808, 1, 0.3960784, 0, 1,
-1.529745, -0.9877927, -1.120221, 1, 0.4039216, 0, 1,
-1.509272, 0.9871403, -0.7679513, 1, 0.4078431, 0, 1,
-1.499328, 0.9717585, -2.169317, 1, 0.4156863, 0, 1,
-1.484864, -0.4381888, -0.6070672, 1, 0.4196078, 0, 1,
-1.482967, 1.168143, -1.365589, 1, 0.427451, 0, 1,
-1.462806, 0.067791, -1.099618, 1, 0.4313726, 0, 1,
-1.461759, 0.4479816, -0.6507139, 1, 0.4392157, 0, 1,
-1.459247, -1.125412, -1.146994, 1, 0.4431373, 0, 1,
-1.456221, 0.8363154, -0.2671225, 1, 0.4509804, 0, 1,
-1.455076, 1.278132, -2.4765, 1, 0.454902, 0, 1,
-1.453649, -0.3080462, -1.976454, 1, 0.4627451, 0, 1,
-1.441305, 0.02323053, -0.01841907, 1, 0.4666667, 0, 1,
-1.435979, 0.9876034, 0.8058685, 1, 0.4745098, 0, 1,
-1.431936, 1.09515, 0.06692322, 1, 0.4784314, 0, 1,
-1.430478, 1.693934, -1.307985, 1, 0.4862745, 0, 1,
-1.429193, -1.209347, -0.2172944, 1, 0.4901961, 0, 1,
-1.418884, 1.571356, -1.457415, 1, 0.4980392, 0, 1,
-1.417887, 1.967359, -0.6418858, 1, 0.5058824, 0, 1,
-1.416493, 0.5499649, -0.2846534, 1, 0.509804, 0, 1,
-1.416112, 0.06511512, -1.560506, 1, 0.5176471, 0, 1,
-1.400365, 1.712345, -2.218135, 1, 0.5215687, 0, 1,
-1.398375, 0.06812077, 0.1854141, 1, 0.5294118, 0, 1,
-1.39738, -0.7243574, -2.967108, 1, 0.5333334, 0, 1,
-1.384856, 1.362528, -0.008014834, 1, 0.5411765, 0, 1,
-1.382999, 1.247855, -1.598936, 1, 0.5450981, 0, 1,
-1.376338, -0.9270051, -1.546301, 1, 0.5529412, 0, 1,
-1.375245, 1.467771, -1.588398, 1, 0.5568628, 0, 1,
-1.373567, 1.247037, -0.1722199, 1, 0.5647059, 0, 1,
-1.361214, 0.4657225, -0.8140109, 1, 0.5686275, 0, 1,
-1.359246, -1.390123, -1.970862, 1, 0.5764706, 0, 1,
-1.355132, 0.9444088, -2.634986, 1, 0.5803922, 0, 1,
-1.352788, -0.390367, -1.804394, 1, 0.5882353, 0, 1,
-1.351322, 0.3656267, -0.8376819, 1, 0.5921569, 0, 1,
-1.346029, 0.7873239, -0.5659204, 1, 0.6, 0, 1,
-1.33965, -0.3485511, -3.916504, 1, 0.6078432, 0, 1,
-1.33733, -0.7013406, -1.828547, 1, 0.6117647, 0, 1,
-1.326672, -0.4612115, -2.100501, 1, 0.6196079, 0, 1,
-1.32519, -1.090067, -0.3232959, 1, 0.6235294, 0, 1,
-1.321269, -0.4040476, -2.333273, 1, 0.6313726, 0, 1,
-1.313442, -0.7487078, -1.727805, 1, 0.6352941, 0, 1,
-1.308123, 1.712877, -0.9952183, 1, 0.6431373, 0, 1,
-1.29731, 0.2603255, -1.682164, 1, 0.6470588, 0, 1,
-1.289293, -0.8052735, -2.114752, 1, 0.654902, 0, 1,
-1.288092, -1.772684, -2.621423, 1, 0.6588235, 0, 1,
-1.284627, 1.24861, 0.7675141, 1, 0.6666667, 0, 1,
-1.269771, 0.4196857, -1.494737, 1, 0.6705883, 0, 1,
-1.265369, 2.10615, -1.334788, 1, 0.6784314, 0, 1,
-1.261952, -1.027437, -0.6748879, 1, 0.682353, 0, 1,
-1.258098, 1.919114, 0.8847412, 1, 0.6901961, 0, 1,
-1.256359, -0.8639479, -2.196429, 1, 0.6941177, 0, 1,
-1.244654, 0.07335749, 0.09273116, 1, 0.7019608, 0, 1,
-1.243759, -0.977713, -0.4128459, 1, 0.7098039, 0, 1,
-1.232911, 0.9234005, -1.496325, 1, 0.7137255, 0, 1,
-1.231461, -1.175691, -3.413031, 1, 0.7215686, 0, 1,
-1.228523, 0.7095738, -1.562026, 1, 0.7254902, 0, 1,
-1.227631, 1.306311, -3.035175, 1, 0.7333333, 0, 1,
-1.226747, -0.5727766, -1.60279, 1, 0.7372549, 0, 1,
-1.223482, 0.2254078, -1.361526, 1, 0.7450981, 0, 1,
-1.219608, 1.735851, 0.2659405, 1, 0.7490196, 0, 1,
-1.209163, -0.8358838, -1.268381, 1, 0.7568628, 0, 1,
-1.204954, 0.9634483, 0.6669286, 1, 0.7607843, 0, 1,
-1.198681, -1.103893, -2.871028, 1, 0.7686275, 0, 1,
-1.197905, 0.7774737, -1.040529, 1, 0.772549, 0, 1,
-1.186031, -0.3445449, -1.741285, 1, 0.7803922, 0, 1,
-1.185488, 0.9217733, 0.9992754, 1, 0.7843137, 0, 1,
-1.183122, 0.6185517, 0.4190696, 1, 0.7921569, 0, 1,
-1.173455, 1.100627, -1.067667, 1, 0.7960784, 0, 1,
-1.165956, 0.776429, -1.810419, 1, 0.8039216, 0, 1,
-1.153546, -0.6924924, -2.841847, 1, 0.8117647, 0, 1,
-1.117294, -1.127589, -1.658087, 1, 0.8156863, 0, 1,
-1.103915, -0.06776018, -1.708732, 1, 0.8235294, 0, 1,
-1.101912, 0.4620898, -0.6511563, 1, 0.827451, 0, 1,
-1.10058, -2.169143, -2.98855, 1, 0.8352941, 0, 1,
-1.100533, 1.392129, 1.620296, 1, 0.8392157, 0, 1,
-1.099136, 0.8101154, -1.865263, 1, 0.8470588, 0, 1,
-1.095918, 0.3557583, -0.5275481, 1, 0.8509804, 0, 1,
-1.089795, -0.5723361, -2.251534, 1, 0.8588235, 0, 1,
-1.089046, -0.5984675, -2.946358, 1, 0.8627451, 0, 1,
-1.072131, -1.961239, -3.640433, 1, 0.8705882, 0, 1,
-1.070197, -0.2907847, -2.745175, 1, 0.8745098, 0, 1,
-1.067398, 2.209667, -0.6334857, 1, 0.8823529, 0, 1,
-1.06628, -0.4523759, -0.69981, 1, 0.8862745, 0, 1,
-1.065655, -1.387102, -3.673574, 1, 0.8941177, 0, 1,
-1.059644, 2.102618, -1.042907, 1, 0.8980392, 0, 1,
-1.058101, -0.8690431, -2.66739, 1, 0.9058824, 0, 1,
-1.052665, 0.6794113, -1.327219, 1, 0.9137255, 0, 1,
-1.050717, -0.1725604, -1.948291, 1, 0.9176471, 0, 1,
-1.047617, -0.7388715, -2.04906, 1, 0.9254902, 0, 1,
-1.04367, -0.6617948, -0.8191817, 1, 0.9294118, 0, 1,
-1.041105, 0.8563273, -3.053524, 1, 0.9372549, 0, 1,
-1.032135, -1.005068, -2.024337, 1, 0.9411765, 0, 1,
-1.02679, 1.755834, 0.3918259, 1, 0.9490196, 0, 1,
-1.013275, -0.3351332, -2.080693, 1, 0.9529412, 0, 1,
-1.011508, 0.9352071, -1.347839, 1, 0.9607843, 0, 1,
-0.9967213, 0.4328777, -0.508639, 1, 0.9647059, 0, 1,
-0.9954383, -1.000408, -2.399113, 1, 0.972549, 0, 1,
-0.9933252, 0.757402, -0.3552336, 1, 0.9764706, 0, 1,
-0.9922021, -1.024957, -2.361699, 1, 0.9843137, 0, 1,
-0.9864759, -0.2623495, -1.719256, 1, 0.9882353, 0, 1,
-0.9842219, 1.239441, -0.151609, 1, 0.9960784, 0, 1,
-0.9820212, 0.2784192, -1.101478, 0.9960784, 1, 0, 1,
-0.9801672, 0.2294888, -2.467737, 0.9921569, 1, 0, 1,
-0.9703255, -2.480592, -1.470773, 0.9843137, 1, 0, 1,
-0.9669056, -0.7375797, -1.958032, 0.9803922, 1, 0, 1,
-0.9523886, 0.4286788, 0.1178795, 0.972549, 1, 0, 1,
-0.9508687, -1.002042, -2.397727, 0.9686275, 1, 0, 1,
-0.9439673, 0.2778613, -0.685766, 0.9607843, 1, 0, 1,
-0.9414833, 0.5856949, -0.5107418, 0.9568627, 1, 0, 1,
-0.9413261, 0.3142256, -1.68477, 0.9490196, 1, 0, 1,
-0.9409908, -0.06314919, -0.2446615, 0.945098, 1, 0, 1,
-0.9379376, -0.4269513, -0.9028372, 0.9372549, 1, 0, 1,
-0.9365038, -0.8735163, -1.871495, 0.9333333, 1, 0, 1,
-0.936034, -0.03612623, -1.470455, 0.9254902, 1, 0, 1,
-0.9342977, 0.1558864, -2.991551, 0.9215686, 1, 0, 1,
-0.9336475, 1.971732, -1.924784, 0.9137255, 1, 0, 1,
-0.9323029, 1.850252, 0.002586792, 0.9098039, 1, 0, 1,
-0.9280483, 0.9468488, -0.3844864, 0.9019608, 1, 0, 1,
-0.9271737, -1.274213, -2.051086, 0.8941177, 1, 0, 1,
-0.9263272, -0.05892018, -2.552049, 0.8901961, 1, 0, 1,
-0.9241337, -0.987152, -0.2740879, 0.8823529, 1, 0, 1,
-0.9161125, -1.244538, -2.86351, 0.8784314, 1, 0, 1,
-0.9142973, -0.346738, -2.481667, 0.8705882, 1, 0, 1,
-0.9141617, 1.47493, -0.03487225, 0.8666667, 1, 0, 1,
-0.9139395, -0.4065781, -1.482996, 0.8588235, 1, 0, 1,
-0.9131954, -1.318453, -2.948792, 0.854902, 1, 0, 1,
-0.9117337, 1.371836, -1.106456, 0.8470588, 1, 0, 1,
-0.9111373, 0.3294932, -0.1794983, 0.8431373, 1, 0, 1,
-0.9066874, 1.190774, -1.720845, 0.8352941, 1, 0, 1,
-0.90347, -0.06301998, -0.5374364, 0.8313726, 1, 0, 1,
-0.9031272, 0.1232424, -0.7344605, 0.8235294, 1, 0, 1,
-0.9013683, -0.05171725, -0.8918805, 0.8196079, 1, 0, 1,
-0.8991665, 0.8652411, -1.161203, 0.8117647, 1, 0, 1,
-0.8941535, 0.5299065, -1.028309, 0.8078431, 1, 0, 1,
-0.8897503, 0.9746107, -0.7479458, 0.8, 1, 0, 1,
-0.8892703, -0.7528771, -2.475834, 0.7921569, 1, 0, 1,
-0.888065, -0.4983391, -2.281625, 0.7882353, 1, 0, 1,
-0.8860101, 0.0167765, -1.583728, 0.7803922, 1, 0, 1,
-0.8851981, 0.9832295, 0.3495804, 0.7764706, 1, 0, 1,
-0.8828247, 0.4835365, 0.01553564, 0.7686275, 1, 0, 1,
-0.8828154, 0.5717586, -0.8950698, 0.7647059, 1, 0, 1,
-0.8786416, -1.204345, -2.303875, 0.7568628, 1, 0, 1,
-0.8718538, 1.833428, 0.6625716, 0.7529412, 1, 0, 1,
-0.8711935, -2.039646, -3.379151, 0.7450981, 1, 0, 1,
-0.8667578, 0.907667, -0.4493659, 0.7411765, 1, 0, 1,
-0.8629111, 0.7852204, -0.08119632, 0.7333333, 1, 0, 1,
-0.8572809, -0.3281113, -1.368388, 0.7294118, 1, 0, 1,
-0.8565578, 0.1839943, -1.329082, 0.7215686, 1, 0, 1,
-0.8517563, -1.523105, -2.418504, 0.7176471, 1, 0, 1,
-0.8498257, 0.2368905, -0.1790483, 0.7098039, 1, 0, 1,
-0.8492494, -0.9673365, -0.3928696, 0.7058824, 1, 0, 1,
-0.846787, -0.5266256, -2.548257, 0.6980392, 1, 0, 1,
-0.8354984, -2.388613, -3.178796, 0.6901961, 1, 0, 1,
-0.8265136, -0.7799904, -1.464005, 0.6862745, 1, 0, 1,
-0.8239223, 1.235751, -1.011246, 0.6784314, 1, 0, 1,
-0.8219625, -0.9535077, -0.9067699, 0.6745098, 1, 0, 1,
-0.8172346, -0.4180822, -1.196723, 0.6666667, 1, 0, 1,
-0.8156027, 0.3474999, -1.832584, 0.6627451, 1, 0, 1,
-0.814142, 0.9128574, 0.4509329, 0.654902, 1, 0, 1,
-0.8067761, -0.08607829, -1.035911, 0.6509804, 1, 0, 1,
-0.804566, 0.2474929, -0.8556358, 0.6431373, 1, 0, 1,
-0.7992931, 1.295128, 0.8044562, 0.6392157, 1, 0, 1,
-0.792341, -0.9243535, -1.791186, 0.6313726, 1, 0, 1,
-0.7915598, -1.084046, -3.58262, 0.627451, 1, 0, 1,
-0.7915179, 0.5454745, 0.009941812, 0.6196079, 1, 0, 1,
-0.7874714, -0.6738237, -2.367181, 0.6156863, 1, 0, 1,
-0.7860069, 1.456115, -0.4467172, 0.6078432, 1, 0, 1,
-0.7854118, 0.8673496, -1.402047, 0.6039216, 1, 0, 1,
-0.7788649, -0.9935738, -1.841868, 0.5960785, 1, 0, 1,
-0.7781173, 2.234876, -0.7021811, 0.5882353, 1, 0, 1,
-0.7774789, 1.51273, 0.9914556, 0.5843138, 1, 0, 1,
-0.7749442, 0.993511, -0.5622427, 0.5764706, 1, 0, 1,
-0.7741792, 0.313482, -2.246186, 0.572549, 1, 0, 1,
-0.7721125, -1.418507, -3.108111, 0.5647059, 1, 0, 1,
-0.7715961, -0.5724878, -2.52031, 0.5607843, 1, 0, 1,
-0.7698571, 1.078574, -1.37765, 0.5529412, 1, 0, 1,
-0.7653719, -0.1921453, -2.453637, 0.5490196, 1, 0, 1,
-0.7635276, -1.024854, -1.17014, 0.5411765, 1, 0, 1,
-0.7630668, -0.7232206, -2.393123, 0.5372549, 1, 0, 1,
-0.762773, 0.6724963, -2.913428, 0.5294118, 1, 0, 1,
-0.7589433, -0.08682515, -1.088204, 0.5254902, 1, 0, 1,
-0.7519964, -0.3030294, -1.773176, 0.5176471, 1, 0, 1,
-0.7475865, 0.767305, -0.4745763, 0.5137255, 1, 0, 1,
-0.7474986, -0.2584061, -3.278755, 0.5058824, 1, 0, 1,
-0.7465168, -0.50458, -2.015698, 0.5019608, 1, 0, 1,
-0.742595, -0.04988854, -2.487797, 0.4941176, 1, 0, 1,
-0.7388933, -0.1046586, -3.777651, 0.4862745, 1, 0, 1,
-0.7358174, 0.203486, -0.74944, 0.4823529, 1, 0, 1,
-0.7222361, -0.05523429, -2.075047, 0.4745098, 1, 0, 1,
-0.7216538, -0.3585759, -2.765705, 0.4705882, 1, 0, 1,
-0.7173573, 0.9187478, -2.237733, 0.4627451, 1, 0, 1,
-0.714731, 0.5326456, -1.796551, 0.4588235, 1, 0, 1,
-0.7082963, -0.08946974, -3.666651, 0.4509804, 1, 0, 1,
-0.7055473, 2.013628, 0.2107831, 0.4470588, 1, 0, 1,
-0.6996701, 0.6117058, -0.9093563, 0.4392157, 1, 0, 1,
-0.6927543, 1.030178, -0.338146, 0.4352941, 1, 0, 1,
-0.6904262, 0.120325, -1.049292, 0.427451, 1, 0, 1,
-0.6902618, -0.9595422, -2.538998, 0.4235294, 1, 0, 1,
-0.686807, -0.9991482, -1.902668, 0.4156863, 1, 0, 1,
-0.6844714, -0.69032, -3.202481, 0.4117647, 1, 0, 1,
-0.679903, -1.104423, -3.414417, 0.4039216, 1, 0, 1,
-0.6781902, 0.6445131, 1.07349, 0.3960784, 1, 0, 1,
-0.676017, 0.06230049, -1.272493, 0.3921569, 1, 0, 1,
-0.6755742, 0.02239806, -0.1734115, 0.3843137, 1, 0, 1,
-0.6734938, 0.8145679, 0.5282645, 0.3803922, 1, 0, 1,
-0.6708356, 1.334948, -2.031988, 0.372549, 1, 0, 1,
-0.6689469, 1.169268, -0.8223658, 0.3686275, 1, 0, 1,
-0.6633946, -0.6600729, -2.772656, 0.3607843, 1, 0, 1,
-0.6629891, 1.575566, -1.060696, 0.3568628, 1, 0, 1,
-0.6623054, -0.9365383, -2.844481, 0.3490196, 1, 0, 1,
-0.6584188, 0.1475964, -2.164612, 0.345098, 1, 0, 1,
-0.6573446, 0.3528351, -1.778863, 0.3372549, 1, 0, 1,
-0.65171, -0.5746921, -2.65046, 0.3333333, 1, 0, 1,
-0.6497884, 0.8715584, 0.3305736, 0.3254902, 1, 0, 1,
-0.6475976, -1.085757, -1.131708, 0.3215686, 1, 0, 1,
-0.6461378, 0.09067496, -0.7453882, 0.3137255, 1, 0, 1,
-0.6437656, 0.7583963, -0.4643348, 0.3098039, 1, 0, 1,
-0.6396089, 1.290696, 0.5013794, 0.3019608, 1, 0, 1,
-0.6393245, -1.196067, -1.991703, 0.2941177, 1, 0, 1,
-0.6366944, -1.069086, -0.84969, 0.2901961, 1, 0, 1,
-0.6356698, 0.4669975, -2.235776, 0.282353, 1, 0, 1,
-0.6352657, -0.594538, -2.504675, 0.2784314, 1, 0, 1,
-0.6326151, 1.688569, 0.8119848, 0.2705882, 1, 0, 1,
-0.6287377, 1.321295, -1.007382, 0.2666667, 1, 0, 1,
-0.6284044, -1.047555, -1.371664, 0.2588235, 1, 0, 1,
-0.6277086, 0.1498487, 0.7812175, 0.254902, 1, 0, 1,
-0.6269336, 1.208988, 0.2336525, 0.2470588, 1, 0, 1,
-0.6199703, -2.155078, -4.002007, 0.2431373, 1, 0, 1,
-0.6186171, -1.044924, -3.767238, 0.2352941, 1, 0, 1,
-0.6080241, 0.7109302, 0.1762663, 0.2313726, 1, 0, 1,
-0.6078039, 1.4164, -0.92494, 0.2235294, 1, 0, 1,
-0.6058264, 0.100684, -1.744711, 0.2196078, 1, 0, 1,
-0.6051679, 0.6821408, -0.3509168, 0.2117647, 1, 0, 1,
-0.5899141, -0.179384, -2.79831, 0.2078431, 1, 0, 1,
-0.5882901, -1.179343, -2.235733, 0.2, 1, 0, 1,
-0.5879955, -0.3721033, -2.31587, 0.1921569, 1, 0, 1,
-0.5874816, 0.23563, -0.0631547, 0.1882353, 1, 0, 1,
-0.5852374, -1.484305, -4.501779, 0.1803922, 1, 0, 1,
-0.5843765, 0.5609014, 0.06402821, 0.1764706, 1, 0, 1,
-0.5764297, 1.704068, 0.313834, 0.1686275, 1, 0, 1,
-0.5761102, -1.15467, -1.68593, 0.1647059, 1, 0, 1,
-0.5718769, 1.095741, 0.3094287, 0.1568628, 1, 0, 1,
-0.5691455, -0.8973657, -3.534007, 0.1529412, 1, 0, 1,
-0.5680712, 0.9426317, -0.233561, 0.145098, 1, 0, 1,
-0.5666144, -0.9370105, -1.304138, 0.1411765, 1, 0, 1,
-0.5651937, -1.310531, -3.38068, 0.1333333, 1, 0, 1,
-0.5646838, -0.1053888, -2.77569, 0.1294118, 1, 0, 1,
-0.5607496, -1.220583, -2.367836, 0.1215686, 1, 0, 1,
-0.5590287, 0.5569533, -0.4574433, 0.1176471, 1, 0, 1,
-0.5561838, 2.061398, -0.3446479, 0.1098039, 1, 0, 1,
-0.5489398, -0.1079869, -0.7820104, 0.1058824, 1, 0, 1,
-0.5470691, -0.08963185, -1.422141, 0.09803922, 1, 0, 1,
-0.5433425, 1.582966, -0.04759074, 0.09019608, 1, 0, 1,
-0.542808, 0.7848479, -1.782314, 0.08627451, 1, 0, 1,
-0.5427862, 1.572794, -0.6035734, 0.07843138, 1, 0, 1,
-0.5361654, -0.4868833, -2.875057, 0.07450981, 1, 0, 1,
-0.5339941, 0.5240808, 0.6350147, 0.06666667, 1, 0, 1,
-0.5329598, 1.30261, -1.19198, 0.0627451, 1, 0, 1,
-0.5217652, 0.5015875, -0.8124595, 0.05490196, 1, 0, 1,
-0.521596, -0.6555324, -0.2096368, 0.05098039, 1, 0, 1,
-0.5214284, -0.1272388, -1.832054, 0.04313726, 1, 0, 1,
-0.5210266, -0.4825649, -1.765382, 0.03921569, 1, 0, 1,
-0.5051284, -1.345812, -2.562004, 0.03137255, 1, 0, 1,
-0.5046495, 0.5488995, -0.5799994, 0.02745098, 1, 0, 1,
-0.4997122, -0.3314997, -0.628427, 0.01960784, 1, 0, 1,
-0.4972627, -1.166821, -3.24415, 0.01568628, 1, 0, 1,
-0.4924529, 0.2116217, 0.1730084, 0.007843138, 1, 0, 1,
-0.4921712, -1.54486, -2.912692, 0.003921569, 1, 0, 1,
-0.4910342, -0.2882699, -1.657384, 0, 1, 0.003921569, 1,
-0.4884804, -0.562229, -1.967685, 0, 1, 0.01176471, 1,
-0.4869732, 1.292217, -3.051291, 0, 1, 0.01568628, 1,
-0.4866166, -0.9611515, -3.713102, 0, 1, 0.02352941, 1,
-0.4812831, 0.7239647, 1.558579, 0, 1, 0.02745098, 1,
-0.4799168, 0.9274776, -0.5752176, 0, 1, 0.03529412, 1,
-0.4793678, -0.9606061, -2.790587, 0, 1, 0.03921569, 1,
-0.4790244, 0.1297509, -2.041795, 0, 1, 0.04705882, 1,
-0.4780443, -1.165377, -2.248678, 0, 1, 0.05098039, 1,
-0.472803, -0.9267839, -1.379575, 0, 1, 0.05882353, 1,
-0.4677069, 0.03088605, -2.16208, 0, 1, 0.0627451, 1,
-0.4670646, 1.195045, -1.834977, 0, 1, 0.07058824, 1,
-0.4637809, -1.72296, -3.071839, 0, 1, 0.07450981, 1,
-0.4630165, -0.2373195, -4.51772, 0, 1, 0.08235294, 1,
-0.4583047, 0.459193, -1.114088, 0, 1, 0.08627451, 1,
-0.456817, 0.002136213, 0.156838, 0, 1, 0.09411765, 1,
-0.4565495, 1.724091, -0.4604517, 0, 1, 0.1019608, 1,
-0.4535748, 0.8259383, 0.2901302, 0, 1, 0.1058824, 1,
-0.4531327, -1.87953, -3.613074, 0, 1, 0.1137255, 1,
-0.4515447, -0.5799385, -0.9488805, 0, 1, 0.1176471, 1,
-0.449412, 0.8152269, -1.24624, 0, 1, 0.1254902, 1,
-0.4423903, 0.7026764, -0.2123024, 0, 1, 0.1294118, 1,
-0.4421736, 0.1453585, -1.666204, 0, 1, 0.1372549, 1,
-0.4385187, 0.9385745, -0.8555303, 0, 1, 0.1411765, 1,
-0.4347485, 0.2673668, -0.9209929, 0, 1, 0.1490196, 1,
-0.4343526, -0.258867, -2.040598, 0, 1, 0.1529412, 1,
-0.431432, 0.1738372, -1.317669, 0, 1, 0.1607843, 1,
-0.4289654, -0.09147242, -1.7655, 0, 1, 0.1647059, 1,
-0.4173713, -1.448421, -4.104625, 0, 1, 0.172549, 1,
-0.4171903, -0.2371337, -4.440057, 0, 1, 0.1764706, 1,
-0.408219, 0.9366255, -1.756473, 0, 1, 0.1843137, 1,
-0.40389, -0.482498, -2.208129, 0, 1, 0.1882353, 1,
-0.4028254, 0.1507118, 1.05302, 0, 1, 0.1960784, 1,
-0.3973536, 1.261647, 1.362566, 0, 1, 0.2039216, 1,
-0.3952667, -0.8239041, -2.129224, 0, 1, 0.2078431, 1,
-0.3948196, -2.090417, -2.920064, 0, 1, 0.2156863, 1,
-0.389371, 0.2151681, -0.1657354, 0, 1, 0.2196078, 1,
-0.3885694, 0.4187253, 0.2310728, 0, 1, 0.227451, 1,
-0.3838415, 1.683355, -2.531656, 0, 1, 0.2313726, 1,
-0.3818444, 0.9000844, -0.9849828, 0, 1, 0.2392157, 1,
-0.3793604, 0.246832, -1.853031, 0, 1, 0.2431373, 1,
-0.3666075, 1.652282, 0.1027699, 0, 1, 0.2509804, 1,
-0.3660647, -1.166866, -1.730055, 0, 1, 0.254902, 1,
-0.3642362, -0.6940355, -3.241986, 0, 1, 0.2627451, 1,
-0.3618385, -0.9954847, -2.849369, 0, 1, 0.2666667, 1,
-0.3572299, 0.5753205, 0.5329835, 0, 1, 0.2745098, 1,
-0.3545099, -0.7824265, -3.210028, 0, 1, 0.2784314, 1,
-0.352845, 1.34612, -1.020566, 0, 1, 0.2862745, 1,
-0.352415, -0.004462541, -1.211348, 0, 1, 0.2901961, 1,
-0.3505329, 1.163256, -1.615945, 0, 1, 0.2980392, 1,
-0.3502483, -0.3232389, -2.548898, 0, 1, 0.3058824, 1,
-0.3445414, -0.4455945, -3.342491, 0, 1, 0.3098039, 1,
-0.3430951, -1.923956, -2.867627, 0, 1, 0.3176471, 1,
-0.3414544, 0.147132, -1.93508, 0, 1, 0.3215686, 1,
-0.3399611, -0.1819804, -2.412511, 0, 1, 0.3294118, 1,
-0.3345765, 1.533855, -0.08756379, 0, 1, 0.3333333, 1,
-0.3308956, 1.944358, 0.4297324, 0, 1, 0.3411765, 1,
-0.3273389, -0.4495261, -1.441051, 0, 1, 0.345098, 1,
-0.3259289, -1.695062, -2.865061, 0, 1, 0.3529412, 1,
-0.3242149, 1.411893, -2.560256, 0, 1, 0.3568628, 1,
-0.3193254, -0.2131496, -3.034645, 0, 1, 0.3647059, 1,
-0.3124852, 0.3449631, -1.035368, 0, 1, 0.3686275, 1,
-0.3094747, -2.301485, -3.475728, 0, 1, 0.3764706, 1,
-0.3053201, 1.767537, -1.06757, 0, 1, 0.3803922, 1,
-0.2993114, 1.37485, -0.7158833, 0, 1, 0.3882353, 1,
-0.297964, -0.1654761, -1.006221, 0, 1, 0.3921569, 1,
-0.2941275, 0.6100262, -0.655459, 0, 1, 0.4, 1,
-0.2934271, -0.6165922, -2.379327, 0, 1, 0.4078431, 1,
-0.2931835, 1.113298, -1.214851, 0, 1, 0.4117647, 1,
-0.2862238, -0.3546638, -3.962749, 0, 1, 0.4196078, 1,
-0.2837987, -1.585871, -2.173865, 0, 1, 0.4235294, 1,
-0.2721018, -0.2844262, -2.391212, 0, 1, 0.4313726, 1,
-0.2692589, -0.4833093, -2.547355, 0, 1, 0.4352941, 1,
-0.2683342, -0.1174989, -1.275722, 0, 1, 0.4431373, 1,
-0.2676347, 1.333661, 0.06089449, 0, 1, 0.4470588, 1,
-0.2670331, 0.1629461, -0.8712008, 0, 1, 0.454902, 1,
-0.2663229, -2.012494, -1.84725, 0, 1, 0.4588235, 1,
-0.2617023, 0.662897, -0.2052877, 0, 1, 0.4666667, 1,
-0.2609863, -0.7475979, -2.122199, 0, 1, 0.4705882, 1,
-0.2593625, 0.4521105, -0.8093601, 0, 1, 0.4784314, 1,
-0.2581355, 0.09215738, -0.4524639, 0, 1, 0.4823529, 1,
-0.2554029, -1.002232, -3.836074, 0, 1, 0.4901961, 1,
-0.2553955, -1.238837, -3.943788, 0, 1, 0.4941176, 1,
-0.2545048, -0.7070559, -2.364528, 0, 1, 0.5019608, 1,
-0.2538669, -0.8634655, -4.558748, 0, 1, 0.509804, 1,
-0.2536345, -0.4248935, -2.425673, 0, 1, 0.5137255, 1,
-0.2495596, -0.6401584, -2.612053, 0, 1, 0.5215687, 1,
-0.2495173, -0.9045664, -2.606532, 0, 1, 0.5254902, 1,
-0.2481833, -0.1373953, -2.736488, 0, 1, 0.5333334, 1,
-0.2459803, -0.832147, -2.734471, 0, 1, 0.5372549, 1,
-0.2409868, -0.6493825, -3.459942, 0, 1, 0.5450981, 1,
-0.2401482, 0.818022, -1.32989, 0, 1, 0.5490196, 1,
-0.2399159, -0.3515818, -3.528108, 0, 1, 0.5568628, 1,
-0.2392476, -0.4004879, -3.44074, 0, 1, 0.5607843, 1,
-0.2346747, 1.144236, 0.2799012, 0, 1, 0.5686275, 1,
-0.2340843, 1.475557, -0.1916618, 0, 1, 0.572549, 1,
-0.2340557, -2.094795, -1.935462, 0, 1, 0.5803922, 1,
-0.2323596, 0.4311195, -2.34745, 0, 1, 0.5843138, 1,
-0.2304121, -0.3175863, -2.538212, 0, 1, 0.5921569, 1,
-0.2294783, 1.096248, -0.4278655, 0, 1, 0.5960785, 1,
-0.2261761, -0.2448268, -2.241184, 0, 1, 0.6039216, 1,
-0.2203258, 2.110581, -1.019045, 0, 1, 0.6117647, 1,
-0.2201976, 0.7961266, -0.04237368, 0, 1, 0.6156863, 1,
-0.219767, 1.033323, -1.063526, 0, 1, 0.6235294, 1,
-0.2186432, 1.617132, -0.6717051, 0, 1, 0.627451, 1,
-0.2181491, -0.5790699, -3.320003, 0, 1, 0.6352941, 1,
-0.2178437, 1.628927, 0.08950622, 0, 1, 0.6392157, 1,
-0.21463, -0.1003994, -1.684607, 0, 1, 0.6470588, 1,
-0.214626, 0.5656618, -0.7817543, 0, 1, 0.6509804, 1,
-0.2084265, -0.4595453, -2.696205, 0, 1, 0.6588235, 1,
-0.2082543, -1.09026, -3.353344, 0, 1, 0.6627451, 1,
-0.2058116, -0.1573581, -0.7716213, 0, 1, 0.6705883, 1,
-0.2055548, 0.8708208, 1.257235, 0, 1, 0.6745098, 1,
-0.2049257, 0.5473537, 0.08051588, 0, 1, 0.682353, 1,
-0.2049181, -0.315309, -2.724425, 0, 1, 0.6862745, 1,
-0.2015027, -0.8462088, -2.977268, 0, 1, 0.6941177, 1,
-0.1949043, 0.1520432, -2.287012, 0, 1, 0.7019608, 1,
-0.1937087, -1.173893, -2.884511, 0, 1, 0.7058824, 1,
-0.1908522, 0.1369199, -0.03882627, 0, 1, 0.7137255, 1,
-0.1886138, 1.172011, -0.9059299, 0, 1, 0.7176471, 1,
-0.1821447, 1.523525, 0.1880246, 0, 1, 0.7254902, 1,
-0.1814578, -0.02130615, -0.6344174, 0, 1, 0.7294118, 1,
-0.1799673, 0.5205885, -0.7411991, 0, 1, 0.7372549, 1,
-0.1646132, -0.9932112, -4.511715, 0, 1, 0.7411765, 1,
-0.1638742, 0.851352, -0.4890121, 0, 1, 0.7490196, 1,
-0.1638048, 0.1197458, -0.8201062, 0, 1, 0.7529412, 1,
-0.1621089, 0.4415798, 1.994476, 0, 1, 0.7607843, 1,
-0.1588981, -0.5556329, -2.877266, 0, 1, 0.7647059, 1,
-0.1567361, -1.806055, -2.662846, 0, 1, 0.772549, 1,
-0.1537738, 0.816801, -0.7872183, 0, 1, 0.7764706, 1,
-0.1534938, 0.5707084, -0.6908211, 0, 1, 0.7843137, 1,
-0.151414, -0.318227, -2.141503, 0, 1, 0.7882353, 1,
-0.1506084, 1.048464, 0.09470099, 0, 1, 0.7960784, 1,
-0.1476227, 0.2792492, -2.501333, 0, 1, 0.8039216, 1,
-0.1468465, 0.6416684, -0.8173147, 0, 1, 0.8078431, 1,
-0.1422278, -1.676198, -3.87841, 0, 1, 0.8156863, 1,
-0.1421255, -0.1924646, -2.217302, 0, 1, 0.8196079, 1,
-0.1417418, 0.3108338, 0.1342264, 0, 1, 0.827451, 1,
-0.1334714, 0.2574473, -0.3568547, 0, 1, 0.8313726, 1,
-0.1312791, 0.9337261, -0.1292656, 0, 1, 0.8392157, 1,
-0.1311467, 1.738999, 0.5312657, 0, 1, 0.8431373, 1,
-0.1200861, -0.2639288, -3.458184, 0, 1, 0.8509804, 1,
-0.1200009, -0.158291, -3.70367, 0, 1, 0.854902, 1,
-0.1166148, 0.6602102, 1.22218, 0, 1, 0.8627451, 1,
-0.1163309, 1.060361, -1.164571, 0, 1, 0.8666667, 1,
-0.1147225, 0.242221, 0.4615431, 0, 1, 0.8745098, 1,
-0.1140719, 0.047508, -2.145081, 0, 1, 0.8784314, 1,
-0.1126977, 0.5230846, 0.4502541, 0, 1, 0.8862745, 1,
-0.111166, 0.2533413, 0.4651515, 0, 1, 0.8901961, 1,
-0.1099156, 0.40788, -0.8526023, 0, 1, 0.8980392, 1,
-0.1028469, 0.3637795, -0.7964196, 0, 1, 0.9058824, 1,
-0.09681373, -0.1145458, -1.198649, 0, 1, 0.9098039, 1,
-0.09676223, -0.6499597, -2.609887, 0, 1, 0.9176471, 1,
-0.09632754, 0.6786091, -1.026626, 0, 1, 0.9215686, 1,
-0.09412421, 2.49364, -0.4122213, 0, 1, 0.9294118, 1,
-0.09017666, -0.3232782, -1.98282, 0, 1, 0.9333333, 1,
-0.08553825, 0.5207372, 0.6168001, 0, 1, 0.9411765, 1,
-0.08500066, 1.042535, -0.1300513, 0, 1, 0.945098, 1,
-0.0801499, -0.9073814, -1.521128, 0, 1, 0.9529412, 1,
-0.07953964, -0.5394555, -4.246418, 0, 1, 0.9568627, 1,
-0.07905377, 0.4029694, -0.9816357, 0, 1, 0.9647059, 1,
-0.07600318, 0.5810043, -0.852834, 0, 1, 0.9686275, 1,
-0.07232811, -0.6217921, -2.0013, 0, 1, 0.9764706, 1,
-0.06600241, 0.4116242, -0.3531868, 0, 1, 0.9803922, 1,
-0.06259754, 0.1925294, 0.0888762, 0, 1, 0.9882353, 1,
-0.061544, 1.148444, -0.06052846, 0, 1, 0.9921569, 1,
-0.06119768, -1.298753, -0.7742566, 0, 1, 1, 1,
-0.06041326, 0.3469939, 0.8304325, 0, 0.9921569, 1, 1,
-0.05530482, -0.4430879, -2.823079, 0, 0.9882353, 1, 1,
-0.05301525, 0.3757005, -0.4219565, 0, 0.9803922, 1, 1,
-0.05211479, -2.862571, -3.242552, 0, 0.9764706, 1, 1,
-0.05013132, 0.8535218, -1.61657, 0, 0.9686275, 1, 1,
-0.04922727, 0.2441956, 0.8379868, 0, 0.9647059, 1, 1,
-0.04607445, 0.4264582, 0.6768384, 0, 0.9568627, 1, 1,
-0.04543672, 0.3112565, -0.01625713, 0, 0.9529412, 1, 1,
-0.04381526, 0.4895964, -1.670976, 0, 0.945098, 1, 1,
-0.04374519, -0.6100335, -1.623286, 0, 0.9411765, 1, 1,
-0.04301463, 0.1848385, -0.009783532, 0, 0.9333333, 1, 1,
-0.04262343, 1.237425, -1.527153, 0, 0.9294118, 1, 1,
-0.0402732, 0.4869522, -0.5486269, 0, 0.9215686, 1, 1,
-0.03201158, -0.3631091, -4.69748, 0, 0.9176471, 1, 1,
-0.02631591, -0.5127923, -2.265609, 0, 0.9098039, 1, 1,
-0.01903255, -2.087602, -2.360497, 0, 0.9058824, 1, 1,
-0.0185477, -0.7436848, -3.972653, 0, 0.8980392, 1, 1,
-0.01768923, 0.2160414, -0.5637081, 0, 0.8901961, 1, 1,
-0.0137461, 0.9372048, -0.286615, 0, 0.8862745, 1, 1,
-0.0128517, 0.8575143, -0.580524, 0, 0.8784314, 1, 1,
-0.007622112, -0.4438862, -3.696828, 0, 0.8745098, 1, 1,
-0.007305123, -0.925029, -3.060379, 0, 0.8666667, 1, 1,
-0.003510553, 0.0779154, 1.305746, 0, 0.8627451, 1, 1,
0.000891049, 0.03809653, -0.4089962, 0, 0.854902, 1, 1,
0.00705034, -0.8616992, 5.488043, 0, 0.8509804, 1, 1,
0.009044571, -1.409378, 2.024627, 0, 0.8431373, 1, 1,
0.01001181, 0.07562862, -1.737839, 0, 0.8392157, 1, 1,
0.0158235, -0.5649623, 2.846915, 0, 0.8313726, 1, 1,
0.01601774, 0.1079087, 0.3195351, 0, 0.827451, 1, 1,
0.01991116, 1.109107, 0.9725518, 0, 0.8196079, 1, 1,
0.02145204, 0.7048777, 0.6365452, 0, 0.8156863, 1, 1,
0.02358341, 1.513897, 0.8029785, 0, 0.8078431, 1, 1,
0.02468278, 0.1957988, -1.22007, 0, 0.8039216, 1, 1,
0.03197685, -1.130586, 4.637219, 0, 0.7960784, 1, 1,
0.03338008, -1.724551, 1.365712, 0, 0.7882353, 1, 1,
0.04265346, 0.3074046, -0.1658279, 0, 0.7843137, 1, 1,
0.04415584, 0.603193, 0.3548894, 0, 0.7764706, 1, 1,
0.04543123, 0.9125086, 0.2487331, 0, 0.772549, 1, 1,
0.04578789, 0.3335378, 0.5188499, 0, 0.7647059, 1, 1,
0.05096645, -0.077315, 1.28381, 0, 0.7607843, 1, 1,
0.05301132, -0.4412461, 3.568601, 0, 0.7529412, 1, 1,
0.05439714, 1.023777, 0.7053599, 0, 0.7490196, 1, 1,
0.05802274, 1.851938, 1.304396, 0, 0.7411765, 1, 1,
0.07266301, -0.1844109, 1.779593, 0, 0.7372549, 1, 1,
0.07479465, 0.457871, 1.362287, 0, 0.7294118, 1, 1,
0.07510832, -0.407327, 2.91267, 0, 0.7254902, 1, 1,
0.07532229, 1.745455, -0.4878036, 0, 0.7176471, 1, 1,
0.07912162, -0.407408, 3.135614, 0, 0.7137255, 1, 1,
0.07942843, 1.801356, -0.008615855, 0, 0.7058824, 1, 1,
0.08451644, -2.170765, 4.039305, 0, 0.6980392, 1, 1,
0.08594215, 0.6778201, 1.923476, 0, 0.6941177, 1, 1,
0.08975484, -0.2755265, 3.934557, 0, 0.6862745, 1, 1,
0.09076107, 0.7908782, 0.03839221, 0, 0.682353, 1, 1,
0.09179799, 1.158283, -0.2625009, 0, 0.6745098, 1, 1,
0.09265403, -0.8512533, 1.133595, 0, 0.6705883, 1, 1,
0.09438881, -0.04394581, 0.5225338, 0, 0.6627451, 1, 1,
0.09537054, 1.036974, 1.34645, 0, 0.6588235, 1, 1,
0.09779796, -0.529901, 2.991244, 0, 0.6509804, 1, 1,
0.09800842, 1.711773, -1.336387, 0, 0.6470588, 1, 1,
0.1002607, -0.1131763, 2.32607, 0, 0.6392157, 1, 1,
0.1003802, -1.689396, 2.126223, 0, 0.6352941, 1, 1,
0.102313, -0.7648792, 3.153111, 0, 0.627451, 1, 1,
0.1031139, 1.669226, 0.5229294, 0, 0.6235294, 1, 1,
0.1066265, -0.1622629, 3.159535, 0, 0.6156863, 1, 1,
0.1101016, 1.718035, -0.2563285, 0, 0.6117647, 1, 1,
0.1104125, 0.3036835, -0.5895065, 0, 0.6039216, 1, 1,
0.1144717, -0.6525483, 2.576114, 0, 0.5960785, 1, 1,
0.1176349, 0.4216543, 0.8116905, 0, 0.5921569, 1, 1,
0.1191221, -0.1220436, 3.20838, 0, 0.5843138, 1, 1,
0.1225178, 0.5356115, -0.1304751, 0, 0.5803922, 1, 1,
0.1358357, -1.238371, 1.877844, 0, 0.572549, 1, 1,
0.1363489, 1.799912, -2.83496, 0, 0.5686275, 1, 1,
0.1373528, -0.9186686, 3.584088, 0, 0.5607843, 1, 1,
0.1391462, -1.746832, 2.469088, 0, 0.5568628, 1, 1,
0.143055, 0.2520075, -2.257681, 0, 0.5490196, 1, 1,
0.1445001, -0.1055134, 3.026316, 0, 0.5450981, 1, 1,
0.1475862, 0.3923663, -0.3809442, 0, 0.5372549, 1, 1,
0.1529721, -0.02673478, 0.7146151, 0, 0.5333334, 1, 1,
0.1565979, 0.4893845, -0.9786562, 0, 0.5254902, 1, 1,
0.1585109, 0.1754153, -1.779961, 0, 0.5215687, 1, 1,
0.1586738, -3.006938, 2.248636, 0, 0.5137255, 1, 1,
0.1705829, -1.099873, 4.970851, 0, 0.509804, 1, 1,
0.1706981, -0.7895303, 3.15222, 0, 0.5019608, 1, 1,
0.1723785, 0.3195429, -0.7801683, 0, 0.4941176, 1, 1,
0.1748117, -0.5805632, 2.657144, 0, 0.4901961, 1, 1,
0.1761064, -0.8879421, 2.590523, 0, 0.4823529, 1, 1,
0.1772583, 1.107513, -0.8602682, 0, 0.4784314, 1, 1,
0.1785049, -0.1462615, 1.043667, 0, 0.4705882, 1, 1,
0.183235, 0.02908465, 0.5461068, 0, 0.4666667, 1, 1,
0.1868742, -0.2400541, 1.229525, 0, 0.4588235, 1, 1,
0.1893784, -1.07197, 3.498412, 0, 0.454902, 1, 1,
0.1897268, 0.4069735, 0.4333894, 0, 0.4470588, 1, 1,
0.1900359, 1.602012, 0.5209514, 0, 0.4431373, 1, 1,
0.1901046, -1.514093, 2.71629, 0, 0.4352941, 1, 1,
0.1978095, -0.2786273, 3.424837, 0, 0.4313726, 1, 1,
0.1983258, 0.1840194, 0.6109488, 0, 0.4235294, 1, 1,
0.1985881, -0.1694949, 1.828278, 0, 0.4196078, 1, 1,
0.1987769, 1.068965, -1.081521, 0, 0.4117647, 1, 1,
0.1988755, 0.4162925, 0.9419436, 0, 0.4078431, 1, 1,
0.1998949, -0.09544412, 1.951217, 0, 0.4, 1, 1,
0.2033006, 1.122978, -1.17268, 0, 0.3921569, 1, 1,
0.2069658, -0.01464802, 0.8614454, 0, 0.3882353, 1, 1,
0.2129522, 1.172549, -0.1943333, 0, 0.3803922, 1, 1,
0.2132869, 0.5601634, -1.196643, 0, 0.3764706, 1, 1,
0.2144022, -0.3070548, 2.803044, 0, 0.3686275, 1, 1,
0.2184462, -0.4374945, 2.802421, 0, 0.3647059, 1, 1,
0.2201052, -1.822319, 3.489773, 0, 0.3568628, 1, 1,
0.2223725, 0.05898902, 0.4015372, 0, 0.3529412, 1, 1,
0.2226828, -0.2718362, 3.830043, 0, 0.345098, 1, 1,
0.2257558, -0.4313507, 1.946742, 0, 0.3411765, 1, 1,
0.229505, 0.3759957, 0.3302638, 0, 0.3333333, 1, 1,
0.2314911, -0.2643637, 1.378543, 0, 0.3294118, 1, 1,
0.2322613, 0.1562293, 0.7990564, 0, 0.3215686, 1, 1,
0.23447, 1.964011, -0.1803421, 0, 0.3176471, 1, 1,
0.2345621, -0.885183, 5.284767, 0, 0.3098039, 1, 1,
0.2393647, -0.002103975, 1.733356, 0, 0.3058824, 1, 1,
0.2450921, 0.3885479, -0.7917608, 0, 0.2980392, 1, 1,
0.2476525, -0.8555867, 3.984185, 0, 0.2901961, 1, 1,
0.2484598, 1.348568, 1.371624, 0, 0.2862745, 1, 1,
0.2497324, 0.1008163, -0.7338656, 0, 0.2784314, 1, 1,
0.2520868, -0.4547438, 3.297348, 0, 0.2745098, 1, 1,
0.2538652, -1.081407, 3.379178, 0, 0.2666667, 1, 1,
0.257868, 0.0582759, 0.879519, 0, 0.2627451, 1, 1,
0.2591414, -1.415814, 2.543696, 0, 0.254902, 1, 1,
0.2623657, -0.5622879, 4.780155, 0, 0.2509804, 1, 1,
0.2642409, -1.2517, 1.488247, 0, 0.2431373, 1, 1,
0.2669773, -0.5365769, 3.013463, 0, 0.2392157, 1, 1,
0.2683942, 0.5141855, -0.1237704, 0, 0.2313726, 1, 1,
0.2762267, 1.196024, 0.1229561, 0, 0.227451, 1, 1,
0.2810994, 0.741613, -0.2399398, 0, 0.2196078, 1, 1,
0.2857907, -0.1737221, 1.543137, 0, 0.2156863, 1, 1,
0.2892915, 1.226992, -2.485956, 0, 0.2078431, 1, 1,
0.2914362, 0.9640164, 0.7532341, 0, 0.2039216, 1, 1,
0.2921971, -0.7129084, 2.950195, 0, 0.1960784, 1, 1,
0.2937927, 0.09252318, 1.063968, 0, 0.1882353, 1, 1,
0.2950889, -2.007813, 3.942217, 0, 0.1843137, 1, 1,
0.3059383, -0.9309769, 3.442696, 0, 0.1764706, 1, 1,
0.3067845, -0.7059505, 4.517726, 0, 0.172549, 1, 1,
0.3080296, 0.4567381, 0.4032639, 0, 0.1647059, 1, 1,
0.3125001, 0.4607711, -0.2597608, 0, 0.1607843, 1, 1,
0.3128779, -0.3176114, 3.375686, 0, 0.1529412, 1, 1,
0.3189048, -1.361638, 1.099071, 0, 0.1490196, 1, 1,
0.3204149, 0.5127431, -0.8461179, 0, 0.1411765, 1, 1,
0.3231913, -0.4096348, 0.3339288, 0, 0.1372549, 1, 1,
0.3237544, 0.1009462, 1.824181, 0, 0.1294118, 1, 1,
0.3244595, 1.331426, -0.3468203, 0, 0.1254902, 1, 1,
0.3274233, -1.143918, 3.122204, 0, 0.1176471, 1, 1,
0.3341508, 1.009962, 1.566575, 0, 0.1137255, 1, 1,
0.3342902, 1.182244, -0.6169325, 0, 0.1058824, 1, 1,
0.3353261, 1.381013, -0.8065122, 0, 0.09803922, 1, 1,
0.3376759, 0.1795585, 1.603898, 0, 0.09411765, 1, 1,
0.3397233, -0.6008307, 2.55858, 0, 0.08627451, 1, 1,
0.3463748, -0.05257042, 1.616763, 0, 0.08235294, 1, 1,
0.3527859, 0.302669, 2.729652, 0, 0.07450981, 1, 1,
0.356289, 1.162365, 1.711289, 0, 0.07058824, 1, 1,
0.3592305, 1.260025, 1.482814, 0, 0.0627451, 1, 1,
0.3602775, -0.3429055, 1.528211, 0, 0.05882353, 1, 1,
0.3606375, 0.6360365, -0.546311, 0, 0.05098039, 1, 1,
0.3631902, 0.5603462, 0.6295354, 0, 0.04705882, 1, 1,
0.3670024, 2.011884, 1.221581, 0, 0.03921569, 1, 1,
0.3764248, 2.188803, -0.9974512, 0, 0.03529412, 1, 1,
0.3764719, -0.4775214, 3.557454, 0, 0.02745098, 1, 1,
0.3767153, 1.106961, 1.840112, 0, 0.02352941, 1, 1,
0.3771601, 0.002060633, 1.763185, 0, 0.01568628, 1, 1,
0.3811758, 0.9793299, 1.713738, 0, 0.01176471, 1, 1,
0.3811952, 1.926047, -1.516056, 0, 0.003921569, 1, 1,
0.3818592, -0.07942127, 1.614868, 0.003921569, 0, 1, 1,
0.3837333, 0.3314148, -0.0596464, 0.007843138, 0, 1, 1,
0.3847231, -0.8514108, 4.683209, 0.01568628, 0, 1, 1,
0.3878067, 0.6019622, 0.5369033, 0.01960784, 0, 1, 1,
0.3883373, 0.6950294, 1.212451, 0.02745098, 0, 1, 1,
0.3885592, 1.195195, 0.3937509, 0.03137255, 0, 1, 1,
0.3889807, -0.1454105, 1.67621, 0.03921569, 0, 1, 1,
0.3894756, -0.1142714, 1.871221, 0.04313726, 0, 1, 1,
0.3911354, -0.8297852, 1.953776, 0.05098039, 0, 1, 1,
0.394323, -0.3282401, 2.643919, 0.05490196, 0, 1, 1,
0.3971676, -0.3334993, 2.190699, 0.0627451, 0, 1, 1,
0.4018516, -0.5945415, 3.287944, 0.06666667, 0, 1, 1,
0.404415, 0.007943186, 0.6727786, 0.07450981, 0, 1, 1,
0.4048817, -0.689588, 2.905357, 0.07843138, 0, 1, 1,
0.4059272, 0.8575822, 1.433723, 0.08627451, 0, 1, 1,
0.4072683, -0.519793, 1.715751, 0.09019608, 0, 1, 1,
0.4072702, -0.02434442, 1.881209, 0.09803922, 0, 1, 1,
0.4077571, -0.2840991, 1.831251, 0.1058824, 0, 1, 1,
0.4078119, 2.292462, 0.6234442, 0.1098039, 0, 1, 1,
0.4114225, -1.621386, 4.069845, 0.1176471, 0, 1, 1,
0.4139369, 0.1855605, 1.540967, 0.1215686, 0, 1, 1,
0.4227921, 0.662707, 0.02586703, 0.1294118, 0, 1, 1,
0.4248026, 1.028224, 0.6800336, 0.1333333, 0, 1, 1,
0.4261251, -0.7312314, 3.767893, 0.1411765, 0, 1, 1,
0.4271852, -0.8816355, 3.843056, 0.145098, 0, 1, 1,
0.4296058, 1.238198, 0.8967174, 0.1529412, 0, 1, 1,
0.4353177, 0.01897143, 3.327149, 0.1568628, 0, 1, 1,
0.4375447, 0.0004593848, 2.020856, 0.1647059, 0, 1, 1,
0.4375572, 1.62717, -0.5218161, 0.1686275, 0, 1, 1,
0.4391683, 1.168645, 0.3123008, 0.1764706, 0, 1, 1,
0.444205, 0.1305186, 1.723842, 0.1803922, 0, 1, 1,
0.4472813, 0.1946767, 0.6514302, 0.1882353, 0, 1, 1,
0.4534678, -0.4273434, 2.116442, 0.1921569, 0, 1, 1,
0.4568557, 0.1230754, 0.1885947, 0.2, 0, 1, 1,
0.4578963, -0.3940057, 2.782025, 0.2078431, 0, 1, 1,
0.4601443, 0.6706073, 1.705117, 0.2117647, 0, 1, 1,
0.4642081, 0.8430165, 1.279288, 0.2196078, 0, 1, 1,
0.4718326, -0.02893302, 0.9581784, 0.2235294, 0, 1, 1,
0.4737869, 1.573783, 1.919237, 0.2313726, 0, 1, 1,
0.4796922, 0.6627421, 1.244337, 0.2352941, 0, 1, 1,
0.4855423, 0.6423422, 0.05875384, 0.2431373, 0, 1, 1,
0.4902203, 1.044418, 0.2015911, 0.2470588, 0, 1, 1,
0.4949909, 1.225502, 1.42823, 0.254902, 0, 1, 1,
0.5021464, -0.230251, 0.7147722, 0.2588235, 0, 1, 1,
0.5033695, -0.4424775, 1.597627, 0.2666667, 0, 1, 1,
0.5048763, 0.0602137, 2.812891, 0.2705882, 0, 1, 1,
0.5120028, -1.005571, 2.886927, 0.2784314, 0, 1, 1,
0.515138, 1.32933, -0.2380719, 0.282353, 0, 1, 1,
0.5158122, -1.117462, 2.266988, 0.2901961, 0, 1, 1,
0.5195317, 0.1662899, 1.090325, 0.2941177, 0, 1, 1,
0.5212362, -1.15353, 3.959631, 0.3019608, 0, 1, 1,
0.5230449, 1.054464, 1.074179, 0.3098039, 0, 1, 1,
0.5249389, -1.087609, 1.589908, 0.3137255, 0, 1, 1,
0.5340374, 1.179404, -0.3284113, 0.3215686, 0, 1, 1,
0.5401018, 3.60489, 0.2141032, 0.3254902, 0, 1, 1,
0.5417833, -1.812338, 3.096859, 0.3333333, 0, 1, 1,
0.5468349, -0.3314892, 1.374805, 0.3372549, 0, 1, 1,
0.5534189, 0.3153833, 0.5601912, 0.345098, 0, 1, 1,
0.5573222, -0.4412038, 2.335691, 0.3490196, 0, 1, 1,
0.5579105, 0.7399781, -1.445616, 0.3568628, 0, 1, 1,
0.5618697, -0.2841456, 1.120136, 0.3607843, 0, 1, 1,
0.5625533, 1.037816, -0.2905909, 0.3686275, 0, 1, 1,
0.5639869, 1.111279, -0.1190245, 0.372549, 0, 1, 1,
0.5649154, -0.6691492, 3.48589, 0.3803922, 0, 1, 1,
0.5694197, 0.8578539, 1.790248, 0.3843137, 0, 1, 1,
0.5731093, 0.7476119, 1.462708, 0.3921569, 0, 1, 1,
0.5753527, 0.3655028, 0.7513299, 0.3960784, 0, 1, 1,
0.5797834, -0.1577801, 1.947356, 0.4039216, 0, 1, 1,
0.5871544, -0.576587, 2.334886, 0.4117647, 0, 1, 1,
0.5889323, -0.2687162, 1.579645, 0.4156863, 0, 1, 1,
0.5935474, -0.8455, 2.849493, 0.4235294, 0, 1, 1,
0.5950243, 0.9460688, -0.1161096, 0.427451, 0, 1, 1,
0.6023219, 1.362747, 0.3219347, 0.4352941, 0, 1, 1,
0.605166, 0.6931403, -0.4745824, 0.4392157, 0, 1, 1,
0.6096468, -1.201374, 2.147174, 0.4470588, 0, 1, 1,
0.6101995, 0.7046242, 0.5568711, 0.4509804, 0, 1, 1,
0.6103451, -0.7129908, 2.119828, 0.4588235, 0, 1, 1,
0.614292, -0.8051933, 3.532655, 0.4627451, 0, 1, 1,
0.6188474, 0.6277478, 0.5440831, 0.4705882, 0, 1, 1,
0.6195719, 0.1503009, 1.845579, 0.4745098, 0, 1, 1,
0.6211003, -0.491043, 2.299643, 0.4823529, 0, 1, 1,
0.6212931, -1.536071, 1.714775, 0.4862745, 0, 1, 1,
0.6314963, 0.2783988, 1.120602, 0.4941176, 0, 1, 1,
0.6319572, 0.7337962, 1.457896, 0.5019608, 0, 1, 1,
0.6342598, 1.294929, 0.1066171, 0.5058824, 0, 1, 1,
0.635757, -1.662388, 2.015556, 0.5137255, 0, 1, 1,
0.6386172, 0.06452266, 1.702298, 0.5176471, 0, 1, 1,
0.6393054, -0.445261, 2.350821, 0.5254902, 0, 1, 1,
0.6409888, -1.041658, 3.170012, 0.5294118, 0, 1, 1,
0.6424381, 1.534573, -0.5430415, 0.5372549, 0, 1, 1,
0.6435652, -0.08009398, 1.120321, 0.5411765, 0, 1, 1,
0.6438895, -0.04686537, 1.170312, 0.5490196, 0, 1, 1,
0.6455141, -0.783469, 3.476158, 0.5529412, 0, 1, 1,
0.650447, 0.321843, 1.682486, 0.5607843, 0, 1, 1,
0.6688242, 0.02079577, 1.9843, 0.5647059, 0, 1, 1,
0.6700797, -0.8612575, 3.180583, 0.572549, 0, 1, 1,
0.6718315, -0.9921094, 1.118601, 0.5764706, 0, 1, 1,
0.6737116, -0.4260236, 3.458201, 0.5843138, 0, 1, 1,
0.673965, -0.5479837, 0.4983923, 0.5882353, 0, 1, 1,
0.6742854, 0.2341409, 0.6393553, 0.5960785, 0, 1, 1,
0.6743983, -0.6691264, 2.711744, 0.6039216, 0, 1, 1,
0.6761373, -0.6223578, 3.777531, 0.6078432, 0, 1, 1,
0.6774674, -1.326902, 2.510615, 0.6156863, 0, 1, 1,
0.6798713, 0.8258207, 1.532011, 0.6196079, 0, 1, 1,
0.6799561, 0.06676839, 2.141785, 0.627451, 0, 1, 1,
0.6863957, 0.8019422, 0.8166488, 0.6313726, 0, 1, 1,
0.6866657, 0.2091128, 2.53425, 0.6392157, 0, 1, 1,
0.6944605, 0.6882916, 1.499158, 0.6431373, 0, 1, 1,
0.7014877, -2.011682, 3.756304, 0.6509804, 0, 1, 1,
0.7070432, 1.142592, 0.859017, 0.654902, 0, 1, 1,
0.7082434, 0.5763663, 1.891068, 0.6627451, 0, 1, 1,
0.7093152, 1.343904, -0.1299389, 0.6666667, 0, 1, 1,
0.710626, 1.164372, 0.5156037, 0.6745098, 0, 1, 1,
0.7115096, -0.6690149, 1.951037, 0.6784314, 0, 1, 1,
0.7314482, 0.1553108, 0.376065, 0.6862745, 0, 1, 1,
0.7381336, 0.3962054, 1.144704, 0.6901961, 0, 1, 1,
0.7387877, -0.4304448, 3.307744, 0.6980392, 0, 1, 1,
0.7495486, -0.2382813, 1.57398, 0.7058824, 0, 1, 1,
0.7579553, 0.715103, -1.549509, 0.7098039, 0, 1, 1,
0.7600411, -0.3012027, 1.35978, 0.7176471, 0, 1, 1,
0.7615346, 0.703088, -0.1294255, 0.7215686, 0, 1, 1,
0.7619892, 1.078868, 3.083878, 0.7294118, 0, 1, 1,
0.7681417, -0.5111506, 0.718579, 0.7333333, 0, 1, 1,
0.7705039, 0.2818064, 0.1816112, 0.7411765, 0, 1, 1,
0.7706451, -0.5243873, 1.885401, 0.7450981, 0, 1, 1,
0.7739714, -0.5995004, 1.669764, 0.7529412, 0, 1, 1,
0.7756445, -0.8863156, 1.858037, 0.7568628, 0, 1, 1,
0.7860297, 0.478159, 0.0909081, 0.7647059, 0, 1, 1,
0.7900367, 1.626368, -0.4754913, 0.7686275, 0, 1, 1,
0.8187383, 0.1919693, 1.43011, 0.7764706, 0, 1, 1,
0.83893, -0.4097706, 4.143228, 0.7803922, 0, 1, 1,
0.8406866, 0.7454816, 1.097748, 0.7882353, 0, 1, 1,
0.843748, 1.223631, -2.180981, 0.7921569, 0, 1, 1,
0.8490002, -0.1469478, -0.03485123, 0.8, 0, 1, 1,
0.8496538, -0.2591575, 1.155609, 0.8078431, 0, 1, 1,
0.85418, 0.2503646, 1.80742, 0.8117647, 0, 1, 1,
0.8546739, 0.3679157, 1.067755, 0.8196079, 0, 1, 1,
0.8549116, -0.3962631, 2.684523, 0.8235294, 0, 1, 1,
0.856773, -0.2236563, 2.478649, 0.8313726, 0, 1, 1,
0.8593187, -0.2519828, 2.361928, 0.8352941, 0, 1, 1,
0.8656017, -1.964212, 3.898265, 0.8431373, 0, 1, 1,
0.8769674, 0.1885106, 0.6223164, 0.8470588, 0, 1, 1,
0.8811177, 0.5004913, 0.2040385, 0.854902, 0, 1, 1,
0.8896393, 0.1727979, 0.9113767, 0.8588235, 0, 1, 1,
0.9041598, 0.2230966, -0.3667966, 0.8666667, 0, 1, 1,
0.9092661, 0.5703798, 0.5532744, 0.8705882, 0, 1, 1,
0.9126967, 0.4075295, 1.471596, 0.8784314, 0, 1, 1,
0.9140768, 1.294186, -0.3509367, 0.8823529, 0, 1, 1,
0.9154124, 0.7773969, 1.405479, 0.8901961, 0, 1, 1,
0.920369, 0.3333654, 1.918248, 0.8941177, 0, 1, 1,
0.9236127, 1.158412, 0.9109835, 0.9019608, 0, 1, 1,
0.9269083, -1.215446, 3.317863, 0.9098039, 0, 1, 1,
0.9293262, 0.9783522, 2.406995, 0.9137255, 0, 1, 1,
0.9296641, 0.6386932, 1.051542, 0.9215686, 0, 1, 1,
0.9374339, 0.1813247, 0.8244884, 0.9254902, 0, 1, 1,
0.9425415, 0.06849091, 1.30975, 0.9333333, 0, 1, 1,
0.9428217, -0.3151012, 2.583678, 0.9372549, 0, 1, 1,
0.9488779, 1.620779, -0.1311275, 0.945098, 0, 1, 1,
0.9531834, 1.540189, 1.05938, 0.9490196, 0, 1, 1,
0.9576287, -0.4814456, 3.489042, 0.9568627, 0, 1, 1,
0.9602702, -1.568039, 2.303298, 0.9607843, 0, 1, 1,
0.9674024, 0.1884869, 2.499348, 0.9686275, 0, 1, 1,
0.9726059, -0.9662158, 1.660202, 0.972549, 0, 1, 1,
0.9778259, -0.6859702, 1.255437, 0.9803922, 0, 1, 1,
0.9785286, -0.2309342, 2.269044, 0.9843137, 0, 1, 1,
0.9844278, 1.668126, 1.46504, 0.9921569, 0, 1, 1,
0.9865081, 1.205661, -0.3124247, 0.9960784, 0, 1, 1,
0.9937303, -0.04029, 1.874164, 1, 0, 0.9960784, 1,
0.9946021, -1.008686, 1.418961, 1, 0, 0.9882353, 1,
0.9986333, 0.5597525, 0.296103, 1, 0, 0.9843137, 1,
1.001179, 0.8741766, 0.666411, 1, 0, 0.9764706, 1,
1.011831, 0.3358698, 0.8022096, 1, 0, 0.972549, 1,
1.012675, 1.082528, 0.6418859, 1, 0, 0.9647059, 1,
1.0149, -0.01176225, 1.894852, 1, 0, 0.9607843, 1,
1.016554, -0.01293093, 2.26766, 1, 0, 0.9529412, 1,
1.022903, 0.3413398, 0.505125, 1, 0, 0.9490196, 1,
1.023605, 0.6213764, 2.273492, 1, 0, 0.9411765, 1,
1.025846, 0.7586762, 0.9732307, 1, 0, 0.9372549, 1,
1.031423, -1.999597, 3.071387, 1, 0, 0.9294118, 1,
1.037505, -0.8988637, 5.331635, 1, 0, 0.9254902, 1,
1.040201, -1.279992, 2.373005, 1, 0, 0.9176471, 1,
1.041354, -1.228185, 3.818545, 1, 0, 0.9137255, 1,
1.062551, -1.011634, 1.517997, 1, 0, 0.9058824, 1,
1.063029, 1.756639, 1.211133, 1, 0, 0.9019608, 1,
1.067551, 0.5169182, 2.163055, 1, 0, 0.8941177, 1,
1.072918, 1.425143, 1.671303, 1, 0, 0.8862745, 1,
1.075486, -0.02683559, 0.9725153, 1, 0, 0.8823529, 1,
1.076489, 0.9705024, 1.436547, 1, 0, 0.8745098, 1,
1.078132, 1.382152, 0.5105222, 1, 0, 0.8705882, 1,
1.085222, -0.8168276, 2.813866, 1, 0, 0.8627451, 1,
1.092088, -0.8708556, 1.400707, 1, 0, 0.8588235, 1,
1.092621, -0.6736259, 3.240886, 1, 0, 0.8509804, 1,
1.096782, -0.6201494, 2.957508, 1, 0, 0.8470588, 1,
1.098978, 0.7000842, 2.010404, 1, 0, 0.8392157, 1,
1.099308, -0.1770576, 1.758099, 1, 0, 0.8352941, 1,
1.101578, 1.493421, -0.01790115, 1, 0, 0.827451, 1,
1.11031, 0.7260008, 2.27872, 1, 0, 0.8235294, 1,
1.113174, -1.239311, 2.767084, 1, 0, 0.8156863, 1,
1.114525, 0.2437467, 1.648438, 1, 0, 0.8117647, 1,
1.114959, -0.3457866, 2.885921, 1, 0, 0.8039216, 1,
1.119726, 1.127164, 0.3384702, 1, 0, 0.7960784, 1,
1.123262, -1.184925, 4.318919, 1, 0, 0.7921569, 1,
1.124689, -2.288646, 2.116404, 1, 0, 0.7843137, 1,
1.140656, 0.0922096, 2.213973, 1, 0, 0.7803922, 1,
1.148527, -0.9701753, 2.40826, 1, 0, 0.772549, 1,
1.162242, 2.862149, 0.1445632, 1, 0, 0.7686275, 1,
1.162984, -0.5002488, 1.637169, 1, 0, 0.7607843, 1,
1.167607, 0.01732307, 3.470501, 1, 0, 0.7568628, 1,
1.180995, 1.225551, 2.503336, 1, 0, 0.7490196, 1,
1.193899, 1.465703, 2.128374, 1, 0, 0.7450981, 1,
1.194984, 0.4215495, 0.8054954, 1, 0, 0.7372549, 1,
1.204038, -0.007027902, 2.385751, 1, 0, 0.7333333, 1,
1.210902, -0.1029302, 2.040087, 1, 0, 0.7254902, 1,
1.214101, -0.2978796, 2.074559, 1, 0, 0.7215686, 1,
1.217046, 0.8824663, 2.673414, 1, 0, 0.7137255, 1,
1.228174, -1.195943, 2.115053, 1, 0, 0.7098039, 1,
1.241559, -0.4004532, 1.581978, 1, 0, 0.7019608, 1,
1.24888, 0.1792824, 1.082883, 1, 0, 0.6941177, 1,
1.258507, 0.9906175, 0.7020926, 1, 0, 0.6901961, 1,
1.261628, -0.9259935, 2.036743, 1, 0, 0.682353, 1,
1.26299, 0.7784541, 0.3780024, 1, 0, 0.6784314, 1,
1.267995, 0.9441486, -0.2150589, 1, 0, 0.6705883, 1,
1.272448, -1.48918, 2.091587, 1, 0, 0.6666667, 1,
1.276162, -0.9669533, 2.823052, 1, 0, 0.6588235, 1,
1.287525, 0.3938797, 2.04512, 1, 0, 0.654902, 1,
1.287662, 0.1106798, 1.639384, 1, 0, 0.6470588, 1,
1.2919, 1.329489, -0.6833508, 1, 0, 0.6431373, 1,
1.296815, -0.815723, 0.8765064, 1, 0, 0.6352941, 1,
1.315376, -0.2674394, 2.208054, 1, 0, 0.6313726, 1,
1.332182, -0.7792618, 3.484118, 1, 0, 0.6235294, 1,
1.333342, -0.8769154, 2.844997, 1, 0, 0.6196079, 1,
1.339553, -0.583864, 0.4591211, 1, 0, 0.6117647, 1,
1.344709, 0.1960861, 1.873971, 1, 0, 0.6078432, 1,
1.348093, 0.1753014, 1.329475, 1, 0, 0.6, 1,
1.353767, 0.8639146, 1.526937, 1, 0, 0.5921569, 1,
1.354843, 2.479404, 0.232989, 1, 0, 0.5882353, 1,
1.355898, -0.4936453, 0.9035619, 1, 0, 0.5803922, 1,
1.358084, -0.3505858, 2.743662, 1, 0, 0.5764706, 1,
1.371331, 0.8911086, 1.067335, 1, 0, 0.5686275, 1,
1.395543, -0.1881861, 2.717249, 1, 0, 0.5647059, 1,
1.397094, -0.4993782, 2.828809, 1, 0, 0.5568628, 1,
1.401397, -0.3709798, 2.282339, 1, 0, 0.5529412, 1,
1.406967, -0.04753296, 4.00002, 1, 0, 0.5450981, 1,
1.424738, 0.08740532, 2.518944, 1, 0, 0.5411765, 1,
1.427026, 0.9666992, -0.4621947, 1, 0, 0.5333334, 1,
1.429792, -0.1169782, 1.402908, 1, 0, 0.5294118, 1,
1.433057, -0.4178579, 2.606645, 1, 0, 0.5215687, 1,
1.437902, 1.242762, 1.398589, 1, 0, 0.5176471, 1,
1.442678, 0.2737295, 1.681256, 1, 0, 0.509804, 1,
1.445895, 1.368965, 1.372172, 1, 0, 0.5058824, 1,
1.447201, 0.8121527, 0.9473596, 1, 0, 0.4980392, 1,
1.448505, -0.8166195, 2.235315, 1, 0, 0.4901961, 1,
1.45431, -0.5431311, 2.486829, 1, 0, 0.4862745, 1,
1.455403, 1.384531, 1.753886, 1, 0, 0.4784314, 1,
1.467712, -0.03206602, 1.203282, 1, 0, 0.4745098, 1,
1.471526, 1.27638, -0.02191238, 1, 0, 0.4666667, 1,
1.499024, -1.385238, 1.915518, 1, 0, 0.4627451, 1,
1.506671, 0.9559996, -0.8917664, 1, 0, 0.454902, 1,
1.511098, 0.09402943, 0.5365012, 1, 0, 0.4509804, 1,
1.51454, -1.238677, 1.312702, 1, 0, 0.4431373, 1,
1.523088, -1.762545, 2.050009, 1, 0, 0.4392157, 1,
1.537031, 1.375026, -0.9706787, 1, 0, 0.4313726, 1,
1.547713, 0.8960679, 1.286378, 1, 0, 0.427451, 1,
1.548534, 0.03039266, 0.1025997, 1, 0, 0.4196078, 1,
1.565563, -0.08052777, 3.179722, 1, 0, 0.4156863, 1,
1.587688, -0.5759297, 1.444538, 1, 0, 0.4078431, 1,
1.626683, 1.70374, 0.9223724, 1, 0, 0.4039216, 1,
1.631347, 1.81644, 1.77174, 1, 0, 0.3960784, 1,
1.640754, -1.86056, 1.175109, 1, 0, 0.3882353, 1,
1.66094, -1.643524, 2.874067, 1, 0, 0.3843137, 1,
1.662846, 0.7679874, 1.02058, 1, 0, 0.3764706, 1,
1.662893, 0.7103716, 1.501686, 1, 0, 0.372549, 1,
1.66537, 0.7675089, -0.4749513, 1, 0, 0.3647059, 1,
1.686782, 0.003026158, 1.371743, 1, 0, 0.3607843, 1,
1.695966, 0.163042, 1.475366, 1, 0, 0.3529412, 1,
1.716431, -1.081055, -0.0682249, 1, 0, 0.3490196, 1,
1.723421, -0.2882816, 1.103126, 1, 0, 0.3411765, 1,
1.724501, -0.2942523, 1.824551, 1, 0, 0.3372549, 1,
1.736019, -0.9203137, 2.357726, 1, 0, 0.3294118, 1,
1.741764, 0.4209415, 1.080096, 1, 0, 0.3254902, 1,
1.751144, 0.1416454, 2.122802, 1, 0, 0.3176471, 1,
1.754215, -0.05027219, 0.7438587, 1, 0, 0.3137255, 1,
1.780029, -0.8379018, 0.1639181, 1, 0, 0.3058824, 1,
1.782902, -0.4159303, 0.1206588, 1, 0, 0.2980392, 1,
1.79279, 1.772172, -0.9195492, 1, 0, 0.2941177, 1,
1.796365, 1.03424, 0.1462743, 1, 0, 0.2862745, 1,
1.813708, 0.1609666, 2.680427, 1, 0, 0.282353, 1,
1.835205, -0.3179563, 1.312658, 1, 0, 0.2745098, 1,
1.842827, 1.432131, 0.5082667, 1, 0, 0.2705882, 1,
1.851177, -1.376126, 1.04347, 1, 0, 0.2627451, 1,
1.856084, 0.528724, 1.314292, 1, 0, 0.2588235, 1,
1.863398, -1.393249, 1.392388, 1, 0, 0.2509804, 1,
1.872754, 0.3425586, 1.160396, 1, 0, 0.2470588, 1,
1.883884, 2.403393, 1.950571, 1, 0, 0.2392157, 1,
1.893024, 0.1874518, 1.062304, 1, 0, 0.2352941, 1,
1.933408, -0.6137239, 2.08303, 1, 0, 0.227451, 1,
1.934703, -1.66922, 2.995791, 1, 0, 0.2235294, 1,
1.949896, -0.006596264, 1.031384, 1, 0, 0.2156863, 1,
2.006786, -0.4992698, 2.159477, 1, 0, 0.2117647, 1,
2.024947, 0.7054595, -0.1659566, 1, 0, 0.2039216, 1,
2.027393, 1.701924, 1.211867, 1, 0, 0.1960784, 1,
2.035911, -0.6607112, 1.608929, 1, 0, 0.1921569, 1,
2.090682, 0.8811274, 2.613664, 1, 0, 0.1843137, 1,
2.120337, -0.0616409, 0.3082866, 1, 0, 0.1803922, 1,
2.147766, 0.149873, 1.553921, 1, 0, 0.172549, 1,
2.149471, -0.4629064, 1.533339, 1, 0, 0.1686275, 1,
2.207876, -0.2545822, 2.35265, 1, 0, 0.1607843, 1,
2.214303, 0.8082526, 0.4207952, 1, 0, 0.1568628, 1,
2.217702, -0.1711631, 2.724047, 1, 0, 0.1490196, 1,
2.239051, -0.8829064, 1.787778, 1, 0, 0.145098, 1,
2.248804, -1.013012, 2.479866, 1, 0, 0.1372549, 1,
2.279356, 0.02888081, 2.565159, 1, 0, 0.1333333, 1,
2.325848, 0.04058682, 1.096399, 1, 0, 0.1254902, 1,
2.334988, 1.501126, 0.3558147, 1, 0, 0.1215686, 1,
2.370353, 1.569478, -1.678515, 1, 0, 0.1137255, 1,
2.373147, 0.09156161, 0.4057055, 1, 0, 0.1098039, 1,
2.378793, -0.1521138, 2.201864, 1, 0, 0.1019608, 1,
2.397832, 0.3015119, 1.446928, 1, 0, 0.09411765, 1,
2.403693, 0.3680314, -0.1925219, 1, 0, 0.09019608, 1,
2.410507, 0.08317398, 0.9371412, 1, 0, 0.08235294, 1,
2.419276, -0.8111303, 1.673121, 1, 0, 0.07843138, 1,
2.462487, 0.4655619, 0.06770235, 1, 0, 0.07058824, 1,
2.484452, -1.25388, 2.17522, 1, 0, 0.06666667, 1,
2.508928, 1.789706, 1.158941, 1, 0, 0.05882353, 1,
2.520284, 1.96421, 1.7294, 1, 0, 0.05490196, 1,
2.54682, -0.9840569, 2.009033, 1, 0, 0.04705882, 1,
2.575663, -0.981076, 1.929198, 1, 0, 0.04313726, 1,
2.595149, -1.474651, 2.248973, 1, 0, 0.03529412, 1,
2.698926, -0.1727521, 1.818786, 1, 0, 0.03137255, 1,
2.839116, -0.438902, 0.9178919, 1, 0, 0.02352941, 1,
2.884289, 0.8359514, 2.129514, 1, 0, 0.01960784, 1,
2.914092, 0.4323204, 2.151226, 1, 0, 0.01176471, 1,
3.055927, -2.638191, 4.548686, 1, 0, 0.007843138, 1
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
-0.04309642, -4.127643, -6.423926, 0, -0.5, 0.5, 0.5,
-0.04309642, -4.127643, -6.423926, 1, -0.5, 0.5, 0.5,
-0.04309642, -4.127643, -6.423926, 1, 1.5, 0.5, 0.5,
-0.04309642, -4.127643, -6.423926, 0, 1.5, 0.5, 0.5
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
-4.192689, 0.2989759, -6.423926, 0, -0.5, 0.5, 0.5,
-4.192689, 0.2989759, -6.423926, 1, -0.5, 0.5, 0.5,
-4.192689, 0.2989759, -6.423926, 1, 1.5, 0.5, 0.5,
-4.192689, 0.2989759, -6.423926, 0, 1.5, 0.5, 0.5
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
-4.192689, -4.127643, 0.3952813, 0, -0.5, 0.5, 0.5,
-4.192689, -4.127643, 0.3952813, 1, -0.5, 0.5, 0.5,
-4.192689, -4.127643, 0.3952813, 1, 1.5, 0.5, 0.5,
-4.192689, -4.127643, 0.3952813, 0, 1.5, 0.5, 0.5
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
-3, -3.106115, -4.850263,
3, -3.106115, -4.850263,
-3, -3.106115, -4.850263,
-3, -3.27637, -5.11254,
-2, -3.106115, -4.850263,
-2, -3.27637, -5.11254,
-1, -3.106115, -4.850263,
-1, -3.27637, -5.11254,
0, -3.106115, -4.850263,
0, -3.27637, -5.11254,
1, -3.106115, -4.850263,
1, -3.27637, -5.11254,
2, -3.106115, -4.850263,
2, -3.27637, -5.11254,
3, -3.106115, -4.850263,
3, -3.27637, -5.11254
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
-3, -3.616879, -5.637094, 0, -0.5, 0.5, 0.5,
-3, -3.616879, -5.637094, 1, -0.5, 0.5, 0.5,
-3, -3.616879, -5.637094, 1, 1.5, 0.5, 0.5,
-3, -3.616879, -5.637094, 0, 1.5, 0.5, 0.5,
-2, -3.616879, -5.637094, 0, -0.5, 0.5, 0.5,
-2, -3.616879, -5.637094, 1, -0.5, 0.5, 0.5,
-2, -3.616879, -5.637094, 1, 1.5, 0.5, 0.5,
-2, -3.616879, -5.637094, 0, 1.5, 0.5, 0.5,
-1, -3.616879, -5.637094, 0, -0.5, 0.5, 0.5,
-1, -3.616879, -5.637094, 1, -0.5, 0.5, 0.5,
-1, -3.616879, -5.637094, 1, 1.5, 0.5, 0.5,
-1, -3.616879, -5.637094, 0, 1.5, 0.5, 0.5,
0, -3.616879, -5.637094, 0, -0.5, 0.5, 0.5,
0, -3.616879, -5.637094, 1, -0.5, 0.5, 0.5,
0, -3.616879, -5.637094, 1, 1.5, 0.5, 0.5,
0, -3.616879, -5.637094, 0, 1.5, 0.5, 0.5,
1, -3.616879, -5.637094, 0, -0.5, 0.5, 0.5,
1, -3.616879, -5.637094, 1, -0.5, 0.5, 0.5,
1, -3.616879, -5.637094, 1, 1.5, 0.5, 0.5,
1, -3.616879, -5.637094, 0, 1.5, 0.5, 0.5,
2, -3.616879, -5.637094, 0, -0.5, 0.5, 0.5,
2, -3.616879, -5.637094, 1, -0.5, 0.5, 0.5,
2, -3.616879, -5.637094, 1, 1.5, 0.5, 0.5,
2, -3.616879, -5.637094, 0, 1.5, 0.5, 0.5,
3, -3.616879, -5.637094, 0, -0.5, 0.5, 0.5,
3, -3.616879, -5.637094, 1, -0.5, 0.5, 0.5,
3, -3.616879, -5.637094, 1, 1.5, 0.5, 0.5,
3, -3.616879, -5.637094, 0, 1.5, 0.5, 0.5
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
-3.23509, -3, -4.850263,
-3.23509, 3, -4.850263,
-3.23509, -3, -4.850263,
-3.39469, -3, -5.11254,
-3.23509, -2, -4.850263,
-3.39469, -2, -5.11254,
-3.23509, -1, -4.850263,
-3.39469, -1, -5.11254,
-3.23509, 0, -4.850263,
-3.39469, 0, -5.11254,
-3.23509, 1, -4.850263,
-3.39469, 1, -5.11254,
-3.23509, 2, -4.850263,
-3.39469, 2, -5.11254,
-3.23509, 3, -4.850263,
-3.39469, 3, -5.11254
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
-3.71389, -3, -5.637094, 0, -0.5, 0.5, 0.5,
-3.71389, -3, -5.637094, 1, -0.5, 0.5, 0.5,
-3.71389, -3, -5.637094, 1, 1.5, 0.5, 0.5,
-3.71389, -3, -5.637094, 0, 1.5, 0.5, 0.5,
-3.71389, -2, -5.637094, 0, -0.5, 0.5, 0.5,
-3.71389, -2, -5.637094, 1, -0.5, 0.5, 0.5,
-3.71389, -2, -5.637094, 1, 1.5, 0.5, 0.5,
-3.71389, -2, -5.637094, 0, 1.5, 0.5, 0.5,
-3.71389, -1, -5.637094, 0, -0.5, 0.5, 0.5,
-3.71389, -1, -5.637094, 1, -0.5, 0.5, 0.5,
-3.71389, -1, -5.637094, 1, 1.5, 0.5, 0.5,
-3.71389, -1, -5.637094, 0, 1.5, 0.5, 0.5,
-3.71389, 0, -5.637094, 0, -0.5, 0.5, 0.5,
-3.71389, 0, -5.637094, 1, -0.5, 0.5, 0.5,
-3.71389, 0, -5.637094, 1, 1.5, 0.5, 0.5,
-3.71389, 0, -5.637094, 0, 1.5, 0.5, 0.5,
-3.71389, 1, -5.637094, 0, -0.5, 0.5, 0.5,
-3.71389, 1, -5.637094, 1, -0.5, 0.5, 0.5,
-3.71389, 1, -5.637094, 1, 1.5, 0.5, 0.5,
-3.71389, 1, -5.637094, 0, 1.5, 0.5, 0.5,
-3.71389, 2, -5.637094, 0, -0.5, 0.5, 0.5,
-3.71389, 2, -5.637094, 1, -0.5, 0.5, 0.5,
-3.71389, 2, -5.637094, 1, 1.5, 0.5, 0.5,
-3.71389, 2, -5.637094, 0, 1.5, 0.5, 0.5,
-3.71389, 3, -5.637094, 0, -0.5, 0.5, 0.5,
-3.71389, 3, -5.637094, 1, -0.5, 0.5, 0.5,
-3.71389, 3, -5.637094, 1, 1.5, 0.5, 0.5,
-3.71389, 3, -5.637094, 0, 1.5, 0.5, 0.5
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
-3.23509, -3.106115, -4,
-3.23509, -3.106115, 4,
-3.23509, -3.106115, -4,
-3.39469, -3.27637, -4,
-3.23509, -3.106115, -2,
-3.39469, -3.27637, -2,
-3.23509, -3.106115, 0,
-3.39469, -3.27637, 0,
-3.23509, -3.106115, 2,
-3.39469, -3.27637, 2,
-3.23509, -3.106115, 4,
-3.39469, -3.27637, 4
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
-3.71389, -3.616879, -4, 0, -0.5, 0.5, 0.5,
-3.71389, -3.616879, -4, 1, -0.5, 0.5, 0.5,
-3.71389, -3.616879, -4, 1, 1.5, 0.5, 0.5,
-3.71389, -3.616879, -4, 0, 1.5, 0.5, 0.5,
-3.71389, -3.616879, -2, 0, -0.5, 0.5, 0.5,
-3.71389, -3.616879, -2, 1, -0.5, 0.5, 0.5,
-3.71389, -3.616879, -2, 1, 1.5, 0.5, 0.5,
-3.71389, -3.616879, -2, 0, 1.5, 0.5, 0.5,
-3.71389, -3.616879, 0, 0, -0.5, 0.5, 0.5,
-3.71389, -3.616879, 0, 1, -0.5, 0.5, 0.5,
-3.71389, -3.616879, 0, 1, 1.5, 0.5, 0.5,
-3.71389, -3.616879, 0, 0, 1.5, 0.5, 0.5,
-3.71389, -3.616879, 2, 0, -0.5, 0.5, 0.5,
-3.71389, -3.616879, 2, 1, -0.5, 0.5, 0.5,
-3.71389, -3.616879, 2, 1, 1.5, 0.5, 0.5,
-3.71389, -3.616879, 2, 0, 1.5, 0.5, 0.5,
-3.71389, -3.616879, 4, 0, -0.5, 0.5, 0.5,
-3.71389, -3.616879, 4, 1, -0.5, 0.5, 0.5,
-3.71389, -3.616879, 4, 1, 1.5, 0.5, 0.5,
-3.71389, -3.616879, 4, 0, 1.5, 0.5, 0.5
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
-3.23509, -3.106115, -4.850263,
-3.23509, 3.704067, -4.850263,
-3.23509, -3.106115, 5.640826,
-3.23509, 3.704067, 5.640826,
-3.23509, -3.106115, -4.850263,
-3.23509, -3.106115, 5.640826,
-3.23509, 3.704067, -4.850263,
-3.23509, 3.704067, 5.640826,
-3.23509, -3.106115, -4.850263,
3.148898, -3.106115, -4.850263,
-3.23509, -3.106115, 5.640826,
3.148898, -3.106115, 5.640826,
-3.23509, 3.704067, -4.850263,
3.148898, 3.704067, -4.850263,
-3.23509, 3.704067, 5.640826,
3.148898, 3.704067, 5.640826,
3.148898, -3.106115, -4.850263,
3.148898, 3.704067, -4.850263,
3.148898, -3.106115, 5.640826,
3.148898, 3.704067, 5.640826,
3.148898, -3.106115, -4.850263,
3.148898, -3.106115, 5.640826,
3.148898, 3.704067, -4.850263,
3.148898, 3.704067, 5.640826
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
var radius = 7.498518;
var distance = 33.36175;
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
mvMatrix.translate( 0.04309642, -0.2989759, -0.3952813 );
mvMatrix.scale( 1.269981, 1.190503, 0.7728029 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.36175);
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
isoxazolidinone<-read.table("isoxazolidinone.xyz")
```

```
## Error in read.table("isoxazolidinone.xyz"): no lines available in input
```

```r
x<-isoxazolidinone$V2
```

```
## Error in eval(expr, envir, enclos): object 'isoxazolidinone' not found
```

```r
y<-isoxazolidinone$V3
```

```
## Error in eval(expr, envir, enclos): object 'isoxazolidinone' not found
```

```r
z<-isoxazolidinone$V4
```

```
## Error in eval(expr, envir, enclos): object 'isoxazolidinone' not found
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
-3.14212, 0.2889434, -2.059125, 0, 0, 1, 1, 1,
-2.925501, -0.06165788, -0.5744553, 1, 0, 0, 1, 1,
-2.781412, 0.836478, -0.1074681, 1, 0, 0, 1, 1,
-2.727215, -0.1699004, -1.377934, 1, 0, 0, 1, 1,
-2.688579, -1.011181, -2.179454, 1, 0, 0, 1, 1,
-2.567318, 0.2310106, -3.689706, 1, 0, 0, 1, 1,
-2.542825, -1.8, -2.843795, 0, 0, 0, 1, 1,
-2.507599, -0.5537407, -0.1326171, 0, 0, 0, 1, 1,
-2.500286, -0.1741834, -0.6108599, 0, 0, 0, 1, 1,
-2.441625, 0.8442724, -1.021821, 0, 0, 0, 1, 1,
-2.381899, -1.335523, -2.372708, 0, 0, 0, 1, 1,
-2.335879, 1.849486, 0.07467471, 0, 0, 0, 1, 1,
-2.251201, 0.9613598, -1.151298, 0, 0, 0, 1, 1,
-2.233989, -0.4300212, -2.247965, 1, 1, 1, 1, 1,
-2.194614, 0.4534173, -0.5917436, 1, 1, 1, 1, 1,
-2.181044, -0.06456026, -2.442868, 1, 1, 1, 1, 1,
-2.163301, 1.110255, 0.6147808, 1, 1, 1, 1, 1,
-2.160528, -0.3031318, -1.942377, 1, 1, 1, 1, 1,
-2.137546, -0.4697367, -2.937572, 1, 1, 1, 1, 1,
-2.125729, -2.852658, -3.54421, 1, 1, 1, 1, 1,
-2.10882, 0.163086, -2.004488, 1, 1, 1, 1, 1,
-2.089861, 1.776621, 0.09847145, 1, 1, 1, 1, 1,
-2.060792, 0.5086931, -0.68061, 1, 1, 1, 1, 1,
-2.045141, -0.4284818, -4.529236, 1, 1, 1, 1, 1,
-2.018151, 0.2521622, -1.171446, 1, 1, 1, 1, 1,
-2.000468, 0.2858354, -1.74717, 1, 1, 1, 1, 1,
-2.000432, -1.395635, -1.714289, 1, 1, 1, 1, 1,
-1.989105, 0.8867798, -0.3279453, 1, 1, 1, 1, 1,
-1.963977, -1.110391, -2.68436, 0, 0, 1, 1, 1,
-1.960762, -1.954633, -2.440874, 1, 0, 0, 1, 1,
-1.957376, -0.2499831, -1.630004, 1, 0, 0, 1, 1,
-1.955621, -0.7159743, -1.287569, 1, 0, 0, 1, 1,
-1.940015, -0.7994281, -0.6910841, 1, 0, 0, 1, 1,
-1.937923, 1.076018, -1.569955, 1, 0, 0, 1, 1,
-1.914277, 1.400295, -1.186386, 0, 0, 0, 1, 1,
-1.913242, -0.4563603, -2.616731, 0, 0, 0, 1, 1,
-1.912515, 0.7791048, -0.5765469, 0, 0, 0, 1, 1,
-1.911815, 0.5082422, -0.2617091, 0, 0, 0, 1, 1,
-1.897875, -0.744386, -1.796523, 0, 0, 0, 1, 1,
-1.864261, 0.5337743, -2.848982, 0, 0, 0, 1, 1,
-1.861036, -0.2815321, -2.011446, 0, 0, 0, 1, 1,
-1.847843, 0.3060417, -0.6637887, 1, 1, 1, 1, 1,
-1.831948, 0.9733381, -0.8909892, 1, 1, 1, 1, 1,
-1.784147, -0.3155794, -2.151487, 1, 1, 1, 1, 1,
-1.748009, 0.05322599, -2.224073, 1, 1, 1, 1, 1,
-1.734416, -0.1231059, -0.8840434, 1, 1, 1, 1, 1,
-1.7328, -0.289606, -1.544659, 1, 1, 1, 1, 1,
-1.722556, -0.3868958, -2.476768, 1, 1, 1, 1, 1,
-1.689278, -0.4153486, -2.845603, 1, 1, 1, 1, 1,
-1.680393, 0.9195002, -1.062013, 1, 1, 1, 1, 1,
-1.675438, -0.251068, -0.4799149, 1, 1, 1, 1, 1,
-1.675131, 0.2082639, -2.34536, 1, 1, 1, 1, 1,
-1.655382, -0.1701906, -1.576924, 1, 1, 1, 1, 1,
-1.648562, -1.022502, -2.225976, 1, 1, 1, 1, 1,
-1.644525, -0.7763118, -1.55533, 1, 1, 1, 1, 1,
-1.619272, 0.5059877, -0.810523, 1, 1, 1, 1, 1,
-1.618185, 0.01947443, -1.191775, 0, 0, 1, 1, 1,
-1.599199, 2.95945, -0.1842874, 1, 0, 0, 1, 1,
-1.592966, 0.8111371, -1.269012, 1, 0, 0, 1, 1,
-1.581749, -0.4694094, -1.411894, 1, 0, 0, 1, 1,
-1.580513, -0.591391, -1.196566, 1, 0, 0, 1, 1,
-1.577387, -0.3342855, -1.157032, 1, 0, 0, 1, 1,
-1.575349, -0.3491242, -1.517678, 0, 0, 0, 1, 1,
-1.57017, -1.0453, -3.467765, 0, 0, 0, 1, 1,
-1.565252, -0.3866771, -2.518162, 0, 0, 0, 1, 1,
-1.563048, 0.7317504, -1.379462, 0, 0, 0, 1, 1,
-1.558832, 0.07190734, -2.511808, 0, 0, 0, 1, 1,
-1.529745, -0.9877927, -1.120221, 0, 0, 0, 1, 1,
-1.509272, 0.9871403, -0.7679513, 0, 0, 0, 1, 1,
-1.499328, 0.9717585, -2.169317, 1, 1, 1, 1, 1,
-1.484864, -0.4381888, -0.6070672, 1, 1, 1, 1, 1,
-1.482967, 1.168143, -1.365589, 1, 1, 1, 1, 1,
-1.462806, 0.067791, -1.099618, 1, 1, 1, 1, 1,
-1.461759, 0.4479816, -0.6507139, 1, 1, 1, 1, 1,
-1.459247, -1.125412, -1.146994, 1, 1, 1, 1, 1,
-1.456221, 0.8363154, -0.2671225, 1, 1, 1, 1, 1,
-1.455076, 1.278132, -2.4765, 1, 1, 1, 1, 1,
-1.453649, -0.3080462, -1.976454, 1, 1, 1, 1, 1,
-1.441305, 0.02323053, -0.01841907, 1, 1, 1, 1, 1,
-1.435979, 0.9876034, 0.8058685, 1, 1, 1, 1, 1,
-1.431936, 1.09515, 0.06692322, 1, 1, 1, 1, 1,
-1.430478, 1.693934, -1.307985, 1, 1, 1, 1, 1,
-1.429193, -1.209347, -0.2172944, 1, 1, 1, 1, 1,
-1.418884, 1.571356, -1.457415, 1, 1, 1, 1, 1,
-1.417887, 1.967359, -0.6418858, 0, 0, 1, 1, 1,
-1.416493, 0.5499649, -0.2846534, 1, 0, 0, 1, 1,
-1.416112, 0.06511512, -1.560506, 1, 0, 0, 1, 1,
-1.400365, 1.712345, -2.218135, 1, 0, 0, 1, 1,
-1.398375, 0.06812077, 0.1854141, 1, 0, 0, 1, 1,
-1.39738, -0.7243574, -2.967108, 1, 0, 0, 1, 1,
-1.384856, 1.362528, -0.008014834, 0, 0, 0, 1, 1,
-1.382999, 1.247855, -1.598936, 0, 0, 0, 1, 1,
-1.376338, -0.9270051, -1.546301, 0, 0, 0, 1, 1,
-1.375245, 1.467771, -1.588398, 0, 0, 0, 1, 1,
-1.373567, 1.247037, -0.1722199, 0, 0, 0, 1, 1,
-1.361214, 0.4657225, -0.8140109, 0, 0, 0, 1, 1,
-1.359246, -1.390123, -1.970862, 0, 0, 0, 1, 1,
-1.355132, 0.9444088, -2.634986, 1, 1, 1, 1, 1,
-1.352788, -0.390367, -1.804394, 1, 1, 1, 1, 1,
-1.351322, 0.3656267, -0.8376819, 1, 1, 1, 1, 1,
-1.346029, 0.7873239, -0.5659204, 1, 1, 1, 1, 1,
-1.33965, -0.3485511, -3.916504, 1, 1, 1, 1, 1,
-1.33733, -0.7013406, -1.828547, 1, 1, 1, 1, 1,
-1.326672, -0.4612115, -2.100501, 1, 1, 1, 1, 1,
-1.32519, -1.090067, -0.3232959, 1, 1, 1, 1, 1,
-1.321269, -0.4040476, -2.333273, 1, 1, 1, 1, 1,
-1.313442, -0.7487078, -1.727805, 1, 1, 1, 1, 1,
-1.308123, 1.712877, -0.9952183, 1, 1, 1, 1, 1,
-1.29731, 0.2603255, -1.682164, 1, 1, 1, 1, 1,
-1.289293, -0.8052735, -2.114752, 1, 1, 1, 1, 1,
-1.288092, -1.772684, -2.621423, 1, 1, 1, 1, 1,
-1.284627, 1.24861, 0.7675141, 1, 1, 1, 1, 1,
-1.269771, 0.4196857, -1.494737, 0, 0, 1, 1, 1,
-1.265369, 2.10615, -1.334788, 1, 0, 0, 1, 1,
-1.261952, -1.027437, -0.6748879, 1, 0, 0, 1, 1,
-1.258098, 1.919114, 0.8847412, 1, 0, 0, 1, 1,
-1.256359, -0.8639479, -2.196429, 1, 0, 0, 1, 1,
-1.244654, 0.07335749, 0.09273116, 1, 0, 0, 1, 1,
-1.243759, -0.977713, -0.4128459, 0, 0, 0, 1, 1,
-1.232911, 0.9234005, -1.496325, 0, 0, 0, 1, 1,
-1.231461, -1.175691, -3.413031, 0, 0, 0, 1, 1,
-1.228523, 0.7095738, -1.562026, 0, 0, 0, 1, 1,
-1.227631, 1.306311, -3.035175, 0, 0, 0, 1, 1,
-1.226747, -0.5727766, -1.60279, 0, 0, 0, 1, 1,
-1.223482, 0.2254078, -1.361526, 0, 0, 0, 1, 1,
-1.219608, 1.735851, 0.2659405, 1, 1, 1, 1, 1,
-1.209163, -0.8358838, -1.268381, 1, 1, 1, 1, 1,
-1.204954, 0.9634483, 0.6669286, 1, 1, 1, 1, 1,
-1.198681, -1.103893, -2.871028, 1, 1, 1, 1, 1,
-1.197905, 0.7774737, -1.040529, 1, 1, 1, 1, 1,
-1.186031, -0.3445449, -1.741285, 1, 1, 1, 1, 1,
-1.185488, 0.9217733, 0.9992754, 1, 1, 1, 1, 1,
-1.183122, 0.6185517, 0.4190696, 1, 1, 1, 1, 1,
-1.173455, 1.100627, -1.067667, 1, 1, 1, 1, 1,
-1.165956, 0.776429, -1.810419, 1, 1, 1, 1, 1,
-1.153546, -0.6924924, -2.841847, 1, 1, 1, 1, 1,
-1.117294, -1.127589, -1.658087, 1, 1, 1, 1, 1,
-1.103915, -0.06776018, -1.708732, 1, 1, 1, 1, 1,
-1.101912, 0.4620898, -0.6511563, 1, 1, 1, 1, 1,
-1.10058, -2.169143, -2.98855, 1, 1, 1, 1, 1,
-1.100533, 1.392129, 1.620296, 0, 0, 1, 1, 1,
-1.099136, 0.8101154, -1.865263, 1, 0, 0, 1, 1,
-1.095918, 0.3557583, -0.5275481, 1, 0, 0, 1, 1,
-1.089795, -0.5723361, -2.251534, 1, 0, 0, 1, 1,
-1.089046, -0.5984675, -2.946358, 1, 0, 0, 1, 1,
-1.072131, -1.961239, -3.640433, 1, 0, 0, 1, 1,
-1.070197, -0.2907847, -2.745175, 0, 0, 0, 1, 1,
-1.067398, 2.209667, -0.6334857, 0, 0, 0, 1, 1,
-1.06628, -0.4523759, -0.69981, 0, 0, 0, 1, 1,
-1.065655, -1.387102, -3.673574, 0, 0, 0, 1, 1,
-1.059644, 2.102618, -1.042907, 0, 0, 0, 1, 1,
-1.058101, -0.8690431, -2.66739, 0, 0, 0, 1, 1,
-1.052665, 0.6794113, -1.327219, 0, 0, 0, 1, 1,
-1.050717, -0.1725604, -1.948291, 1, 1, 1, 1, 1,
-1.047617, -0.7388715, -2.04906, 1, 1, 1, 1, 1,
-1.04367, -0.6617948, -0.8191817, 1, 1, 1, 1, 1,
-1.041105, 0.8563273, -3.053524, 1, 1, 1, 1, 1,
-1.032135, -1.005068, -2.024337, 1, 1, 1, 1, 1,
-1.02679, 1.755834, 0.3918259, 1, 1, 1, 1, 1,
-1.013275, -0.3351332, -2.080693, 1, 1, 1, 1, 1,
-1.011508, 0.9352071, -1.347839, 1, 1, 1, 1, 1,
-0.9967213, 0.4328777, -0.508639, 1, 1, 1, 1, 1,
-0.9954383, -1.000408, -2.399113, 1, 1, 1, 1, 1,
-0.9933252, 0.757402, -0.3552336, 1, 1, 1, 1, 1,
-0.9922021, -1.024957, -2.361699, 1, 1, 1, 1, 1,
-0.9864759, -0.2623495, -1.719256, 1, 1, 1, 1, 1,
-0.9842219, 1.239441, -0.151609, 1, 1, 1, 1, 1,
-0.9820212, 0.2784192, -1.101478, 1, 1, 1, 1, 1,
-0.9801672, 0.2294888, -2.467737, 0, 0, 1, 1, 1,
-0.9703255, -2.480592, -1.470773, 1, 0, 0, 1, 1,
-0.9669056, -0.7375797, -1.958032, 1, 0, 0, 1, 1,
-0.9523886, 0.4286788, 0.1178795, 1, 0, 0, 1, 1,
-0.9508687, -1.002042, -2.397727, 1, 0, 0, 1, 1,
-0.9439673, 0.2778613, -0.685766, 1, 0, 0, 1, 1,
-0.9414833, 0.5856949, -0.5107418, 0, 0, 0, 1, 1,
-0.9413261, 0.3142256, -1.68477, 0, 0, 0, 1, 1,
-0.9409908, -0.06314919, -0.2446615, 0, 0, 0, 1, 1,
-0.9379376, -0.4269513, -0.9028372, 0, 0, 0, 1, 1,
-0.9365038, -0.8735163, -1.871495, 0, 0, 0, 1, 1,
-0.936034, -0.03612623, -1.470455, 0, 0, 0, 1, 1,
-0.9342977, 0.1558864, -2.991551, 0, 0, 0, 1, 1,
-0.9336475, 1.971732, -1.924784, 1, 1, 1, 1, 1,
-0.9323029, 1.850252, 0.002586792, 1, 1, 1, 1, 1,
-0.9280483, 0.9468488, -0.3844864, 1, 1, 1, 1, 1,
-0.9271737, -1.274213, -2.051086, 1, 1, 1, 1, 1,
-0.9263272, -0.05892018, -2.552049, 1, 1, 1, 1, 1,
-0.9241337, -0.987152, -0.2740879, 1, 1, 1, 1, 1,
-0.9161125, -1.244538, -2.86351, 1, 1, 1, 1, 1,
-0.9142973, -0.346738, -2.481667, 1, 1, 1, 1, 1,
-0.9141617, 1.47493, -0.03487225, 1, 1, 1, 1, 1,
-0.9139395, -0.4065781, -1.482996, 1, 1, 1, 1, 1,
-0.9131954, -1.318453, -2.948792, 1, 1, 1, 1, 1,
-0.9117337, 1.371836, -1.106456, 1, 1, 1, 1, 1,
-0.9111373, 0.3294932, -0.1794983, 1, 1, 1, 1, 1,
-0.9066874, 1.190774, -1.720845, 1, 1, 1, 1, 1,
-0.90347, -0.06301998, -0.5374364, 1, 1, 1, 1, 1,
-0.9031272, 0.1232424, -0.7344605, 0, 0, 1, 1, 1,
-0.9013683, -0.05171725, -0.8918805, 1, 0, 0, 1, 1,
-0.8991665, 0.8652411, -1.161203, 1, 0, 0, 1, 1,
-0.8941535, 0.5299065, -1.028309, 1, 0, 0, 1, 1,
-0.8897503, 0.9746107, -0.7479458, 1, 0, 0, 1, 1,
-0.8892703, -0.7528771, -2.475834, 1, 0, 0, 1, 1,
-0.888065, -0.4983391, -2.281625, 0, 0, 0, 1, 1,
-0.8860101, 0.0167765, -1.583728, 0, 0, 0, 1, 1,
-0.8851981, 0.9832295, 0.3495804, 0, 0, 0, 1, 1,
-0.8828247, 0.4835365, 0.01553564, 0, 0, 0, 1, 1,
-0.8828154, 0.5717586, -0.8950698, 0, 0, 0, 1, 1,
-0.8786416, -1.204345, -2.303875, 0, 0, 0, 1, 1,
-0.8718538, 1.833428, 0.6625716, 0, 0, 0, 1, 1,
-0.8711935, -2.039646, -3.379151, 1, 1, 1, 1, 1,
-0.8667578, 0.907667, -0.4493659, 1, 1, 1, 1, 1,
-0.8629111, 0.7852204, -0.08119632, 1, 1, 1, 1, 1,
-0.8572809, -0.3281113, -1.368388, 1, 1, 1, 1, 1,
-0.8565578, 0.1839943, -1.329082, 1, 1, 1, 1, 1,
-0.8517563, -1.523105, -2.418504, 1, 1, 1, 1, 1,
-0.8498257, 0.2368905, -0.1790483, 1, 1, 1, 1, 1,
-0.8492494, -0.9673365, -0.3928696, 1, 1, 1, 1, 1,
-0.846787, -0.5266256, -2.548257, 1, 1, 1, 1, 1,
-0.8354984, -2.388613, -3.178796, 1, 1, 1, 1, 1,
-0.8265136, -0.7799904, -1.464005, 1, 1, 1, 1, 1,
-0.8239223, 1.235751, -1.011246, 1, 1, 1, 1, 1,
-0.8219625, -0.9535077, -0.9067699, 1, 1, 1, 1, 1,
-0.8172346, -0.4180822, -1.196723, 1, 1, 1, 1, 1,
-0.8156027, 0.3474999, -1.832584, 1, 1, 1, 1, 1,
-0.814142, 0.9128574, 0.4509329, 0, 0, 1, 1, 1,
-0.8067761, -0.08607829, -1.035911, 1, 0, 0, 1, 1,
-0.804566, 0.2474929, -0.8556358, 1, 0, 0, 1, 1,
-0.7992931, 1.295128, 0.8044562, 1, 0, 0, 1, 1,
-0.792341, -0.9243535, -1.791186, 1, 0, 0, 1, 1,
-0.7915598, -1.084046, -3.58262, 1, 0, 0, 1, 1,
-0.7915179, 0.5454745, 0.009941812, 0, 0, 0, 1, 1,
-0.7874714, -0.6738237, -2.367181, 0, 0, 0, 1, 1,
-0.7860069, 1.456115, -0.4467172, 0, 0, 0, 1, 1,
-0.7854118, 0.8673496, -1.402047, 0, 0, 0, 1, 1,
-0.7788649, -0.9935738, -1.841868, 0, 0, 0, 1, 1,
-0.7781173, 2.234876, -0.7021811, 0, 0, 0, 1, 1,
-0.7774789, 1.51273, 0.9914556, 0, 0, 0, 1, 1,
-0.7749442, 0.993511, -0.5622427, 1, 1, 1, 1, 1,
-0.7741792, 0.313482, -2.246186, 1, 1, 1, 1, 1,
-0.7721125, -1.418507, -3.108111, 1, 1, 1, 1, 1,
-0.7715961, -0.5724878, -2.52031, 1, 1, 1, 1, 1,
-0.7698571, 1.078574, -1.37765, 1, 1, 1, 1, 1,
-0.7653719, -0.1921453, -2.453637, 1, 1, 1, 1, 1,
-0.7635276, -1.024854, -1.17014, 1, 1, 1, 1, 1,
-0.7630668, -0.7232206, -2.393123, 1, 1, 1, 1, 1,
-0.762773, 0.6724963, -2.913428, 1, 1, 1, 1, 1,
-0.7589433, -0.08682515, -1.088204, 1, 1, 1, 1, 1,
-0.7519964, -0.3030294, -1.773176, 1, 1, 1, 1, 1,
-0.7475865, 0.767305, -0.4745763, 1, 1, 1, 1, 1,
-0.7474986, -0.2584061, -3.278755, 1, 1, 1, 1, 1,
-0.7465168, -0.50458, -2.015698, 1, 1, 1, 1, 1,
-0.742595, -0.04988854, -2.487797, 1, 1, 1, 1, 1,
-0.7388933, -0.1046586, -3.777651, 0, 0, 1, 1, 1,
-0.7358174, 0.203486, -0.74944, 1, 0, 0, 1, 1,
-0.7222361, -0.05523429, -2.075047, 1, 0, 0, 1, 1,
-0.7216538, -0.3585759, -2.765705, 1, 0, 0, 1, 1,
-0.7173573, 0.9187478, -2.237733, 1, 0, 0, 1, 1,
-0.714731, 0.5326456, -1.796551, 1, 0, 0, 1, 1,
-0.7082963, -0.08946974, -3.666651, 0, 0, 0, 1, 1,
-0.7055473, 2.013628, 0.2107831, 0, 0, 0, 1, 1,
-0.6996701, 0.6117058, -0.9093563, 0, 0, 0, 1, 1,
-0.6927543, 1.030178, -0.338146, 0, 0, 0, 1, 1,
-0.6904262, 0.120325, -1.049292, 0, 0, 0, 1, 1,
-0.6902618, -0.9595422, -2.538998, 0, 0, 0, 1, 1,
-0.686807, -0.9991482, -1.902668, 0, 0, 0, 1, 1,
-0.6844714, -0.69032, -3.202481, 1, 1, 1, 1, 1,
-0.679903, -1.104423, -3.414417, 1, 1, 1, 1, 1,
-0.6781902, 0.6445131, 1.07349, 1, 1, 1, 1, 1,
-0.676017, 0.06230049, -1.272493, 1, 1, 1, 1, 1,
-0.6755742, 0.02239806, -0.1734115, 1, 1, 1, 1, 1,
-0.6734938, 0.8145679, 0.5282645, 1, 1, 1, 1, 1,
-0.6708356, 1.334948, -2.031988, 1, 1, 1, 1, 1,
-0.6689469, 1.169268, -0.8223658, 1, 1, 1, 1, 1,
-0.6633946, -0.6600729, -2.772656, 1, 1, 1, 1, 1,
-0.6629891, 1.575566, -1.060696, 1, 1, 1, 1, 1,
-0.6623054, -0.9365383, -2.844481, 1, 1, 1, 1, 1,
-0.6584188, 0.1475964, -2.164612, 1, 1, 1, 1, 1,
-0.6573446, 0.3528351, -1.778863, 1, 1, 1, 1, 1,
-0.65171, -0.5746921, -2.65046, 1, 1, 1, 1, 1,
-0.6497884, 0.8715584, 0.3305736, 1, 1, 1, 1, 1,
-0.6475976, -1.085757, -1.131708, 0, 0, 1, 1, 1,
-0.6461378, 0.09067496, -0.7453882, 1, 0, 0, 1, 1,
-0.6437656, 0.7583963, -0.4643348, 1, 0, 0, 1, 1,
-0.6396089, 1.290696, 0.5013794, 1, 0, 0, 1, 1,
-0.6393245, -1.196067, -1.991703, 1, 0, 0, 1, 1,
-0.6366944, -1.069086, -0.84969, 1, 0, 0, 1, 1,
-0.6356698, 0.4669975, -2.235776, 0, 0, 0, 1, 1,
-0.6352657, -0.594538, -2.504675, 0, 0, 0, 1, 1,
-0.6326151, 1.688569, 0.8119848, 0, 0, 0, 1, 1,
-0.6287377, 1.321295, -1.007382, 0, 0, 0, 1, 1,
-0.6284044, -1.047555, -1.371664, 0, 0, 0, 1, 1,
-0.6277086, 0.1498487, 0.7812175, 0, 0, 0, 1, 1,
-0.6269336, 1.208988, 0.2336525, 0, 0, 0, 1, 1,
-0.6199703, -2.155078, -4.002007, 1, 1, 1, 1, 1,
-0.6186171, -1.044924, -3.767238, 1, 1, 1, 1, 1,
-0.6080241, 0.7109302, 0.1762663, 1, 1, 1, 1, 1,
-0.6078039, 1.4164, -0.92494, 1, 1, 1, 1, 1,
-0.6058264, 0.100684, -1.744711, 1, 1, 1, 1, 1,
-0.6051679, 0.6821408, -0.3509168, 1, 1, 1, 1, 1,
-0.5899141, -0.179384, -2.79831, 1, 1, 1, 1, 1,
-0.5882901, -1.179343, -2.235733, 1, 1, 1, 1, 1,
-0.5879955, -0.3721033, -2.31587, 1, 1, 1, 1, 1,
-0.5874816, 0.23563, -0.0631547, 1, 1, 1, 1, 1,
-0.5852374, -1.484305, -4.501779, 1, 1, 1, 1, 1,
-0.5843765, 0.5609014, 0.06402821, 1, 1, 1, 1, 1,
-0.5764297, 1.704068, 0.313834, 1, 1, 1, 1, 1,
-0.5761102, -1.15467, -1.68593, 1, 1, 1, 1, 1,
-0.5718769, 1.095741, 0.3094287, 1, 1, 1, 1, 1,
-0.5691455, -0.8973657, -3.534007, 0, 0, 1, 1, 1,
-0.5680712, 0.9426317, -0.233561, 1, 0, 0, 1, 1,
-0.5666144, -0.9370105, -1.304138, 1, 0, 0, 1, 1,
-0.5651937, -1.310531, -3.38068, 1, 0, 0, 1, 1,
-0.5646838, -0.1053888, -2.77569, 1, 0, 0, 1, 1,
-0.5607496, -1.220583, -2.367836, 1, 0, 0, 1, 1,
-0.5590287, 0.5569533, -0.4574433, 0, 0, 0, 1, 1,
-0.5561838, 2.061398, -0.3446479, 0, 0, 0, 1, 1,
-0.5489398, -0.1079869, -0.7820104, 0, 0, 0, 1, 1,
-0.5470691, -0.08963185, -1.422141, 0, 0, 0, 1, 1,
-0.5433425, 1.582966, -0.04759074, 0, 0, 0, 1, 1,
-0.542808, 0.7848479, -1.782314, 0, 0, 0, 1, 1,
-0.5427862, 1.572794, -0.6035734, 0, 0, 0, 1, 1,
-0.5361654, -0.4868833, -2.875057, 1, 1, 1, 1, 1,
-0.5339941, 0.5240808, 0.6350147, 1, 1, 1, 1, 1,
-0.5329598, 1.30261, -1.19198, 1, 1, 1, 1, 1,
-0.5217652, 0.5015875, -0.8124595, 1, 1, 1, 1, 1,
-0.521596, -0.6555324, -0.2096368, 1, 1, 1, 1, 1,
-0.5214284, -0.1272388, -1.832054, 1, 1, 1, 1, 1,
-0.5210266, -0.4825649, -1.765382, 1, 1, 1, 1, 1,
-0.5051284, -1.345812, -2.562004, 1, 1, 1, 1, 1,
-0.5046495, 0.5488995, -0.5799994, 1, 1, 1, 1, 1,
-0.4997122, -0.3314997, -0.628427, 1, 1, 1, 1, 1,
-0.4972627, -1.166821, -3.24415, 1, 1, 1, 1, 1,
-0.4924529, 0.2116217, 0.1730084, 1, 1, 1, 1, 1,
-0.4921712, -1.54486, -2.912692, 1, 1, 1, 1, 1,
-0.4910342, -0.2882699, -1.657384, 1, 1, 1, 1, 1,
-0.4884804, -0.562229, -1.967685, 1, 1, 1, 1, 1,
-0.4869732, 1.292217, -3.051291, 0, 0, 1, 1, 1,
-0.4866166, -0.9611515, -3.713102, 1, 0, 0, 1, 1,
-0.4812831, 0.7239647, 1.558579, 1, 0, 0, 1, 1,
-0.4799168, 0.9274776, -0.5752176, 1, 0, 0, 1, 1,
-0.4793678, -0.9606061, -2.790587, 1, 0, 0, 1, 1,
-0.4790244, 0.1297509, -2.041795, 1, 0, 0, 1, 1,
-0.4780443, -1.165377, -2.248678, 0, 0, 0, 1, 1,
-0.472803, -0.9267839, -1.379575, 0, 0, 0, 1, 1,
-0.4677069, 0.03088605, -2.16208, 0, 0, 0, 1, 1,
-0.4670646, 1.195045, -1.834977, 0, 0, 0, 1, 1,
-0.4637809, -1.72296, -3.071839, 0, 0, 0, 1, 1,
-0.4630165, -0.2373195, -4.51772, 0, 0, 0, 1, 1,
-0.4583047, 0.459193, -1.114088, 0, 0, 0, 1, 1,
-0.456817, 0.002136213, 0.156838, 1, 1, 1, 1, 1,
-0.4565495, 1.724091, -0.4604517, 1, 1, 1, 1, 1,
-0.4535748, 0.8259383, 0.2901302, 1, 1, 1, 1, 1,
-0.4531327, -1.87953, -3.613074, 1, 1, 1, 1, 1,
-0.4515447, -0.5799385, -0.9488805, 1, 1, 1, 1, 1,
-0.449412, 0.8152269, -1.24624, 1, 1, 1, 1, 1,
-0.4423903, 0.7026764, -0.2123024, 1, 1, 1, 1, 1,
-0.4421736, 0.1453585, -1.666204, 1, 1, 1, 1, 1,
-0.4385187, 0.9385745, -0.8555303, 1, 1, 1, 1, 1,
-0.4347485, 0.2673668, -0.9209929, 1, 1, 1, 1, 1,
-0.4343526, -0.258867, -2.040598, 1, 1, 1, 1, 1,
-0.431432, 0.1738372, -1.317669, 1, 1, 1, 1, 1,
-0.4289654, -0.09147242, -1.7655, 1, 1, 1, 1, 1,
-0.4173713, -1.448421, -4.104625, 1, 1, 1, 1, 1,
-0.4171903, -0.2371337, -4.440057, 1, 1, 1, 1, 1,
-0.408219, 0.9366255, -1.756473, 0, 0, 1, 1, 1,
-0.40389, -0.482498, -2.208129, 1, 0, 0, 1, 1,
-0.4028254, 0.1507118, 1.05302, 1, 0, 0, 1, 1,
-0.3973536, 1.261647, 1.362566, 1, 0, 0, 1, 1,
-0.3952667, -0.8239041, -2.129224, 1, 0, 0, 1, 1,
-0.3948196, -2.090417, -2.920064, 1, 0, 0, 1, 1,
-0.389371, 0.2151681, -0.1657354, 0, 0, 0, 1, 1,
-0.3885694, 0.4187253, 0.2310728, 0, 0, 0, 1, 1,
-0.3838415, 1.683355, -2.531656, 0, 0, 0, 1, 1,
-0.3818444, 0.9000844, -0.9849828, 0, 0, 0, 1, 1,
-0.3793604, 0.246832, -1.853031, 0, 0, 0, 1, 1,
-0.3666075, 1.652282, 0.1027699, 0, 0, 0, 1, 1,
-0.3660647, -1.166866, -1.730055, 0, 0, 0, 1, 1,
-0.3642362, -0.6940355, -3.241986, 1, 1, 1, 1, 1,
-0.3618385, -0.9954847, -2.849369, 1, 1, 1, 1, 1,
-0.3572299, 0.5753205, 0.5329835, 1, 1, 1, 1, 1,
-0.3545099, -0.7824265, -3.210028, 1, 1, 1, 1, 1,
-0.352845, 1.34612, -1.020566, 1, 1, 1, 1, 1,
-0.352415, -0.004462541, -1.211348, 1, 1, 1, 1, 1,
-0.3505329, 1.163256, -1.615945, 1, 1, 1, 1, 1,
-0.3502483, -0.3232389, -2.548898, 1, 1, 1, 1, 1,
-0.3445414, -0.4455945, -3.342491, 1, 1, 1, 1, 1,
-0.3430951, -1.923956, -2.867627, 1, 1, 1, 1, 1,
-0.3414544, 0.147132, -1.93508, 1, 1, 1, 1, 1,
-0.3399611, -0.1819804, -2.412511, 1, 1, 1, 1, 1,
-0.3345765, 1.533855, -0.08756379, 1, 1, 1, 1, 1,
-0.3308956, 1.944358, 0.4297324, 1, 1, 1, 1, 1,
-0.3273389, -0.4495261, -1.441051, 1, 1, 1, 1, 1,
-0.3259289, -1.695062, -2.865061, 0, 0, 1, 1, 1,
-0.3242149, 1.411893, -2.560256, 1, 0, 0, 1, 1,
-0.3193254, -0.2131496, -3.034645, 1, 0, 0, 1, 1,
-0.3124852, 0.3449631, -1.035368, 1, 0, 0, 1, 1,
-0.3094747, -2.301485, -3.475728, 1, 0, 0, 1, 1,
-0.3053201, 1.767537, -1.06757, 1, 0, 0, 1, 1,
-0.2993114, 1.37485, -0.7158833, 0, 0, 0, 1, 1,
-0.297964, -0.1654761, -1.006221, 0, 0, 0, 1, 1,
-0.2941275, 0.6100262, -0.655459, 0, 0, 0, 1, 1,
-0.2934271, -0.6165922, -2.379327, 0, 0, 0, 1, 1,
-0.2931835, 1.113298, -1.214851, 0, 0, 0, 1, 1,
-0.2862238, -0.3546638, -3.962749, 0, 0, 0, 1, 1,
-0.2837987, -1.585871, -2.173865, 0, 0, 0, 1, 1,
-0.2721018, -0.2844262, -2.391212, 1, 1, 1, 1, 1,
-0.2692589, -0.4833093, -2.547355, 1, 1, 1, 1, 1,
-0.2683342, -0.1174989, -1.275722, 1, 1, 1, 1, 1,
-0.2676347, 1.333661, 0.06089449, 1, 1, 1, 1, 1,
-0.2670331, 0.1629461, -0.8712008, 1, 1, 1, 1, 1,
-0.2663229, -2.012494, -1.84725, 1, 1, 1, 1, 1,
-0.2617023, 0.662897, -0.2052877, 1, 1, 1, 1, 1,
-0.2609863, -0.7475979, -2.122199, 1, 1, 1, 1, 1,
-0.2593625, 0.4521105, -0.8093601, 1, 1, 1, 1, 1,
-0.2581355, 0.09215738, -0.4524639, 1, 1, 1, 1, 1,
-0.2554029, -1.002232, -3.836074, 1, 1, 1, 1, 1,
-0.2553955, -1.238837, -3.943788, 1, 1, 1, 1, 1,
-0.2545048, -0.7070559, -2.364528, 1, 1, 1, 1, 1,
-0.2538669, -0.8634655, -4.558748, 1, 1, 1, 1, 1,
-0.2536345, -0.4248935, -2.425673, 1, 1, 1, 1, 1,
-0.2495596, -0.6401584, -2.612053, 0, 0, 1, 1, 1,
-0.2495173, -0.9045664, -2.606532, 1, 0, 0, 1, 1,
-0.2481833, -0.1373953, -2.736488, 1, 0, 0, 1, 1,
-0.2459803, -0.832147, -2.734471, 1, 0, 0, 1, 1,
-0.2409868, -0.6493825, -3.459942, 1, 0, 0, 1, 1,
-0.2401482, 0.818022, -1.32989, 1, 0, 0, 1, 1,
-0.2399159, -0.3515818, -3.528108, 0, 0, 0, 1, 1,
-0.2392476, -0.4004879, -3.44074, 0, 0, 0, 1, 1,
-0.2346747, 1.144236, 0.2799012, 0, 0, 0, 1, 1,
-0.2340843, 1.475557, -0.1916618, 0, 0, 0, 1, 1,
-0.2340557, -2.094795, -1.935462, 0, 0, 0, 1, 1,
-0.2323596, 0.4311195, -2.34745, 0, 0, 0, 1, 1,
-0.2304121, -0.3175863, -2.538212, 0, 0, 0, 1, 1,
-0.2294783, 1.096248, -0.4278655, 1, 1, 1, 1, 1,
-0.2261761, -0.2448268, -2.241184, 1, 1, 1, 1, 1,
-0.2203258, 2.110581, -1.019045, 1, 1, 1, 1, 1,
-0.2201976, 0.7961266, -0.04237368, 1, 1, 1, 1, 1,
-0.219767, 1.033323, -1.063526, 1, 1, 1, 1, 1,
-0.2186432, 1.617132, -0.6717051, 1, 1, 1, 1, 1,
-0.2181491, -0.5790699, -3.320003, 1, 1, 1, 1, 1,
-0.2178437, 1.628927, 0.08950622, 1, 1, 1, 1, 1,
-0.21463, -0.1003994, -1.684607, 1, 1, 1, 1, 1,
-0.214626, 0.5656618, -0.7817543, 1, 1, 1, 1, 1,
-0.2084265, -0.4595453, -2.696205, 1, 1, 1, 1, 1,
-0.2082543, -1.09026, -3.353344, 1, 1, 1, 1, 1,
-0.2058116, -0.1573581, -0.7716213, 1, 1, 1, 1, 1,
-0.2055548, 0.8708208, 1.257235, 1, 1, 1, 1, 1,
-0.2049257, 0.5473537, 0.08051588, 1, 1, 1, 1, 1,
-0.2049181, -0.315309, -2.724425, 0, 0, 1, 1, 1,
-0.2015027, -0.8462088, -2.977268, 1, 0, 0, 1, 1,
-0.1949043, 0.1520432, -2.287012, 1, 0, 0, 1, 1,
-0.1937087, -1.173893, -2.884511, 1, 0, 0, 1, 1,
-0.1908522, 0.1369199, -0.03882627, 1, 0, 0, 1, 1,
-0.1886138, 1.172011, -0.9059299, 1, 0, 0, 1, 1,
-0.1821447, 1.523525, 0.1880246, 0, 0, 0, 1, 1,
-0.1814578, -0.02130615, -0.6344174, 0, 0, 0, 1, 1,
-0.1799673, 0.5205885, -0.7411991, 0, 0, 0, 1, 1,
-0.1646132, -0.9932112, -4.511715, 0, 0, 0, 1, 1,
-0.1638742, 0.851352, -0.4890121, 0, 0, 0, 1, 1,
-0.1638048, 0.1197458, -0.8201062, 0, 0, 0, 1, 1,
-0.1621089, 0.4415798, 1.994476, 0, 0, 0, 1, 1,
-0.1588981, -0.5556329, -2.877266, 1, 1, 1, 1, 1,
-0.1567361, -1.806055, -2.662846, 1, 1, 1, 1, 1,
-0.1537738, 0.816801, -0.7872183, 1, 1, 1, 1, 1,
-0.1534938, 0.5707084, -0.6908211, 1, 1, 1, 1, 1,
-0.151414, -0.318227, -2.141503, 1, 1, 1, 1, 1,
-0.1506084, 1.048464, 0.09470099, 1, 1, 1, 1, 1,
-0.1476227, 0.2792492, -2.501333, 1, 1, 1, 1, 1,
-0.1468465, 0.6416684, -0.8173147, 1, 1, 1, 1, 1,
-0.1422278, -1.676198, -3.87841, 1, 1, 1, 1, 1,
-0.1421255, -0.1924646, -2.217302, 1, 1, 1, 1, 1,
-0.1417418, 0.3108338, 0.1342264, 1, 1, 1, 1, 1,
-0.1334714, 0.2574473, -0.3568547, 1, 1, 1, 1, 1,
-0.1312791, 0.9337261, -0.1292656, 1, 1, 1, 1, 1,
-0.1311467, 1.738999, 0.5312657, 1, 1, 1, 1, 1,
-0.1200861, -0.2639288, -3.458184, 1, 1, 1, 1, 1,
-0.1200009, -0.158291, -3.70367, 0, 0, 1, 1, 1,
-0.1166148, 0.6602102, 1.22218, 1, 0, 0, 1, 1,
-0.1163309, 1.060361, -1.164571, 1, 0, 0, 1, 1,
-0.1147225, 0.242221, 0.4615431, 1, 0, 0, 1, 1,
-0.1140719, 0.047508, -2.145081, 1, 0, 0, 1, 1,
-0.1126977, 0.5230846, 0.4502541, 1, 0, 0, 1, 1,
-0.111166, 0.2533413, 0.4651515, 0, 0, 0, 1, 1,
-0.1099156, 0.40788, -0.8526023, 0, 0, 0, 1, 1,
-0.1028469, 0.3637795, -0.7964196, 0, 0, 0, 1, 1,
-0.09681373, -0.1145458, -1.198649, 0, 0, 0, 1, 1,
-0.09676223, -0.6499597, -2.609887, 0, 0, 0, 1, 1,
-0.09632754, 0.6786091, -1.026626, 0, 0, 0, 1, 1,
-0.09412421, 2.49364, -0.4122213, 0, 0, 0, 1, 1,
-0.09017666, -0.3232782, -1.98282, 1, 1, 1, 1, 1,
-0.08553825, 0.5207372, 0.6168001, 1, 1, 1, 1, 1,
-0.08500066, 1.042535, -0.1300513, 1, 1, 1, 1, 1,
-0.0801499, -0.9073814, -1.521128, 1, 1, 1, 1, 1,
-0.07953964, -0.5394555, -4.246418, 1, 1, 1, 1, 1,
-0.07905377, 0.4029694, -0.9816357, 1, 1, 1, 1, 1,
-0.07600318, 0.5810043, -0.852834, 1, 1, 1, 1, 1,
-0.07232811, -0.6217921, -2.0013, 1, 1, 1, 1, 1,
-0.06600241, 0.4116242, -0.3531868, 1, 1, 1, 1, 1,
-0.06259754, 0.1925294, 0.0888762, 1, 1, 1, 1, 1,
-0.061544, 1.148444, -0.06052846, 1, 1, 1, 1, 1,
-0.06119768, -1.298753, -0.7742566, 1, 1, 1, 1, 1,
-0.06041326, 0.3469939, 0.8304325, 1, 1, 1, 1, 1,
-0.05530482, -0.4430879, -2.823079, 1, 1, 1, 1, 1,
-0.05301525, 0.3757005, -0.4219565, 1, 1, 1, 1, 1,
-0.05211479, -2.862571, -3.242552, 0, 0, 1, 1, 1,
-0.05013132, 0.8535218, -1.61657, 1, 0, 0, 1, 1,
-0.04922727, 0.2441956, 0.8379868, 1, 0, 0, 1, 1,
-0.04607445, 0.4264582, 0.6768384, 1, 0, 0, 1, 1,
-0.04543672, 0.3112565, -0.01625713, 1, 0, 0, 1, 1,
-0.04381526, 0.4895964, -1.670976, 1, 0, 0, 1, 1,
-0.04374519, -0.6100335, -1.623286, 0, 0, 0, 1, 1,
-0.04301463, 0.1848385, -0.009783532, 0, 0, 0, 1, 1,
-0.04262343, 1.237425, -1.527153, 0, 0, 0, 1, 1,
-0.0402732, 0.4869522, -0.5486269, 0, 0, 0, 1, 1,
-0.03201158, -0.3631091, -4.69748, 0, 0, 0, 1, 1,
-0.02631591, -0.5127923, -2.265609, 0, 0, 0, 1, 1,
-0.01903255, -2.087602, -2.360497, 0, 0, 0, 1, 1,
-0.0185477, -0.7436848, -3.972653, 1, 1, 1, 1, 1,
-0.01768923, 0.2160414, -0.5637081, 1, 1, 1, 1, 1,
-0.0137461, 0.9372048, -0.286615, 1, 1, 1, 1, 1,
-0.0128517, 0.8575143, -0.580524, 1, 1, 1, 1, 1,
-0.007622112, -0.4438862, -3.696828, 1, 1, 1, 1, 1,
-0.007305123, -0.925029, -3.060379, 1, 1, 1, 1, 1,
-0.003510553, 0.0779154, 1.305746, 1, 1, 1, 1, 1,
0.000891049, 0.03809653, -0.4089962, 1, 1, 1, 1, 1,
0.00705034, -0.8616992, 5.488043, 1, 1, 1, 1, 1,
0.009044571, -1.409378, 2.024627, 1, 1, 1, 1, 1,
0.01001181, 0.07562862, -1.737839, 1, 1, 1, 1, 1,
0.0158235, -0.5649623, 2.846915, 1, 1, 1, 1, 1,
0.01601774, 0.1079087, 0.3195351, 1, 1, 1, 1, 1,
0.01991116, 1.109107, 0.9725518, 1, 1, 1, 1, 1,
0.02145204, 0.7048777, 0.6365452, 1, 1, 1, 1, 1,
0.02358341, 1.513897, 0.8029785, 0, 0, 1, 1, 1,
0.02468278, 0.1957988, -1.22007, 1, 0, 0, 1, 1,
0.03197685, -1.130586, 4.637219, 1, 0, 0, 1, 1,
0.03338008, -1.724551, 1.365712, 1, 0, 0, 1, 1,
0.04265346, 0.3074046, -0.1658279, 1, 0, 0, 1, 1,
0.04415584, 0.603193, 0.3548894, 1, 0, 0, 1, 1,
0.04543123, 0.9125086, 0.2487331, 0, 0, 0, 1, 1,
0.04578789, 0.3335378, 0.5188499, 0, 0, 0, 1, 1,
0.05096645, -0.077315, 1.28381, 0, 0, 0, 1, 1,
0.05301132, -0.4412461, 3.568601, 0, 0, 0, 1, 1,
0.05439714, 1.023777, 0.7053599, 0, 0, 0, 1, 1,
0.05802274, 1.851938, 1.304396, 0, 0, 0, 1, 1,
0.07266301, -0.1844109, 1.779593, 0, 0, 0, 1, 1,
0.07479465, 0.457871, 1.362287, 1, 1, 1, 1, 1,
0.07510832, -0.407327, 2.91267, 1, 1, 1, 1, 1,
0.07532229, 1.745455, -0.4878036, 1, 1, 1, 1, 1,
0.07912162, -0.407408, 3.135614, 1, 1, 1, 1, 1,
0.07942843, 1.801356, -0.008615855, 1, 1, 1, 1, 1,
0.08451644, -2.170765, 4.039305, 1, 1, 1, 1, 1,
0.08594215, 0.6778201, 1.923476, 1, 1, 1, 1, 1,
0.08975484, -0.2755265, 3.934557, 1, 1, 1, 1, 1,
0.09076107, 0.7908782, 0.03839221, 1, 1, 1, 1, 1,
0.09179799, 1.158283, -0.2625009, 1, 1, 1, 1, 1,
0.09265403, -0.8512533, 1.133595, 1, 1, 1, 1, 1,
0.09438881, -0.04394581, 0.5225338, 1, 1, 1, 1, 1,
0.09537054, 1.036974, 1.34645, 1, 1, 1, 1, 1,
0.09779796, -0.529901, 2.991244, 1, 1, 1, 1, 1,
0.09800842, 1.711773, -1.336387, 1, 1, 1, 1, 1,
0.1002607, -0.1131763, 2.32607, 0, 0, 1, 1, 1,
0.1003802, -1.689396, 2.126223, 1, 0, 0, 1, 1,
0.102313, -0.7648792, 3.153111, 1, 0, 0, 1, 1,
0.1031139, 1.669226, 0.5229294, 1, 0, 0, 1, 1,
0.1066265, -0.1622629, 3.159535, 1, 0, 0, 1, 1,
0.1101016, 1.718035, -0.2563285, 1, 0, 0, 1, 1,
0.1104125, 0.3036835, -0.5895065, 0, 0, 0, 1, 1,
0.1144717, -0.6525483, 2.576114, 0, 0, 0, 1, 1,
0.1176349, 0.4216543, 0.8116905, 0, 0, 0, 1, 1,
0.1191221, -0.1220436, 3.20838, 0, 0, 0, 1, 1,
0.1225178, 0.5356115, -0.1304751, 0, 0, 0, 1, 1,
0.1358357, -1.238371, 1.877844, 0, 0, 0, 1, 1,
0.1363489, 1.799912, -2.83496, 0, 0, 0, 1, 1,
0.1373528, -0.9186686, 3.584088, 1, 1, 1, 1, 1,
0.1391462, -1.746832, 2.469088, 1, 1, 1, 1, 1,
0.143055, 0.2520075, -2.257681, 1, 1, 1, 1, 1,
0.1445001, -0.1055134, 3.026316, 1, 1, 1, 1, 1,
0.1475862, 0.3923663, -0.3809442, 1, 1, 1, 1, 1,
0.1529721, -0.02673478, 0.7146151, 1, 1, 1, 1, 1,
0.1565979, 0.4893845, -0.9786562, 1, 1, 1, 1, 1,
0.1585109, 0.1754153, -1.779961, 1, 1, 1, 1, 1,
0.1586738, -3.006938, 2.248636, 1, 1, 1, 1, 1,
0.1705829, -1.099873, 4.970851, 1, 1, 1, 1, 1,
0.1706981, -0.7895303, 3.15222, 1, 1, 1, 1, 1,
0.1723785, 0.3195429, -0.7801683, 1, 1, 1, 1, 1,
0.1748117, -0.5805632, 2.657144, 1, 1, 1, 1, 1,
0.1761064, -0.8879421, 2.590523, 1, 1, 1, 1, 1,
0.1772583, 1.107513, -0.8602682, 1, 1, 1, 1, 1,
0.1785049, -0.1462615, 1.043667, 0, 0, 1, 1, 1,
0.183235, 0.02908465, 0.5461068, 1, 0, 0, 1, 1,
0.1868742, -0.2400541, 1.229525, 1, 0, 0, 1, 1,
0.1893784, -1.07197, 3.498412, 1, 0, 0, 1, 1,
0.1897268, 0.4069735, 0.4333894, 1, 0, 0, 1, 1,
0.1900359, 1.602012, 0.5209514, 1, 0, 0, 1, 1,
0.1901046, -1.514093, 2.71629, 0, 0, 0, 1, 1,
0.1978095, -0.2786273, 3.424837, 0, 0, 0, 1, 1,
0.1983258, 0.1840194, 0.6109488, 0, 0, 0, 1, 1,
0.1985881, -0.1694949, 1.828278, 0, 0, 0, 1, 1,
0.1987769, 1.068965, -1.081521, 0, 0, 0, 1, 1,
0.1988755, 0.4162925, 0.9419436, 0, 0, 0, 1, 1,
0.1998949, -0.09544412, 1.951217, 0, 0, 0, 1, 1,
0.2033006, 1.122978, -1.17268, 1, 1, 1, 1, 1,
0.2069658, -0.01464802, 0.8614454, 1, 1, 1, 1, 1,
0.2129522, 1.172549, -0.1943333, 1, 1, 1, 1, 1,
0.2132869, 0.5601634, -1.196643, 1, 1, 1, 1, 1,
0.2144022, -0.3070548, 2.803044, 1, 1, 1, 1, 1,
0.2184462, -0.4374945, 2.802421, 1, 1, 1, 1, 1,
0.2201052, -1.822319, 3.489773, 1, 1, 1, 1, 1,
0.2223725, 0.05898902, 0.4015372, 1, 1, 1, 1, 1,
0.2226828, -0.2718362, 3.830043, 1, 1, 1, 1, 1,
0.2257558, -0.4313507, 1.946742, 1, 1, 1, 1, 1,
0.229505, 0.3759957, 0.3302638, 1, 1, 1, 1, 1,
0.2314911, -0.2643637, 1.378543, 1, 1, 1, 1, 1,
0.2322613, 0.1562293, 0.7990564, 1, 1, 1, 1, 1,
0.23447, 1.964011, -0.1803421, 1, 1, 1, 1, 1,
0.2345621, -0.885183, 5.284767, 1, 1, 1, 1, 1,
0.2393647, -0.002103975, 1.733356, 0, 0, 1, 1, 1,
0.2450921, 0.3885479, -0.7917608, 1, 0, 0, 1, 1,
0.2476525, -0.8555867, 3.984185, 1, 0, 0, 1, 1,
0.2484598, 1.348568, 1.371624, 1, 0, 0, 1, 1,
0.2497324, 0.1008163, -0.7338656, 1, 0, 0, 1, 1,
0.2520868, -0.4547438, 3.297348, 1, 0, 0, 1, 1,
0.2538652, -1.081407, 3.379178, 0, 0, 0, 1, 1,
0.257868, 0.0582759, 0.879519, 0, 0, 0, 1, 1,
0.2591414, -1.415814, 2.543696, 0, 0, 0, 1, 1,
0.2623657, -0.5622879, 4.780155, 0, 0, 0, 1, 1,
0.2642409, -1.2517, 1.488247, 0, 0, 0, 1, 1,
0.2669773, -0.5365769, 3.013463, 0, 0, 0, 1, 1,
0.2683942, 0.5141855, -0.1237704, 0, 0, 0, 1, 1,
0.2762267, 1.196024, 0.1229561, 1, 1, 1, 1, 1,
0.2810994, 0.741613, -0.2399398, 1, 1, 1, 1, 1,
0.2857907, -0.1737221, 1.543137, 1, 1, 1, 1, 1,
0.2892915, 1.226992, -2.485956, 1, 1, 1, 1, 1,
0.2914362, 0.9640164, 0.7532341, 1, 1, 1, 1, 1,
0.2921971, -0.7129084, 2.950195, 1, 1, 1, 1, 1,
0.2937927, 0.09252318, 1.063968, 1, 1, 1, 1, 1,
0.2950889, -2.007813, 3.942217, 1, 1, 1, 1, 1,
0.3059383, -0.9309769, 3.442696, 1, 1, 1, 1, 1,
0.3067845, -0.7059505, 4.517726, 1, 1, 1, 1, 1,
0.3080296, 0.4567381, 0.4032639, 1, 1, 1, 1, 1,
0.3125001, 0.4607711, -0.2597608, 1, 1, 1, 1, 1,
0.3128779, -0.3176114, 3.375686, 1, 1, 1, 1, 1,
0.3189048, -1.361638, 1.099071, 1, 1, 1, 1, 1,
0.3204149, 0.5127431, -0.8461179, 1, 1, 1, 1, 1,
0.3231913, -0.4096348, 0.3339288, 0, 0, 1, 1, 1,
0.3237544, 0.1009462, 1.824181, 1, 0, 0, 1, 1,
0.3244595, 1.331426, -0.3468203, 1, 0, 0, 1, 1,
0.3274233, -1.143918, 3.122204, 1, 0, 0, 1, 1,
0.3341508, 1.009962, 1.566575, 1, 0, 0, 1, 1,
0.3342902, 1.182244, -0.6169325, 1, 0, 0, 1, 1,
0.3353261, 1.381013, -0.8065122, 0, 0, 0, 1, 1,
0.3376759, 0.1795585, 1.603898, 0, 0, 0, 1, 1,
0.3397233, -0.6008307, 2.55858, 0, 0, 0, 1, 1,
0.3463748, -0.05257042, 1.616763, 0, 0, 0, 1, 1,
0.3527859, 0.302669, 2.729652, 0, 0, 0, 1, 1,
0.356289, 1.162365, 1.711289, 0, 0, 0, 1, 1,
0.3592305, 1.260025, 1.482814, 0, 0, 0, 1, 1,
0.3602775, -0.3429055, 1.528211, 1, 1, 1, 1, 1,
0.3606375, 0.6360365, -0.546311, 1, 1, 1, 1, 1,
0.3631902, 0.5603462, 0.6295354, 1, 1, 1, 1, 1,
0.3670024, 2.011884, 1.221581, 1, 1, 1, 1, 1,
0.3764248, 2.188803, -0.9974512, 1, 1, 1, 1, 1,
0.3764719, -0.4775214, 3.557454, 1, 1, 1, 1, 1,
0.3767153, 1.106961, 1.840112, 1, 1, 1, 1, 1,
0.3771601, 0.002060633, 1.763185, 1, 1, 1, 1, 1,
0.3811758, 0.9793299, 1.713738, 1, 1, 1, 1, 1,
0.3811952, 1.926047, -1.516056, 1, 1, 1, 1, 1,
0.3818592, -0.07942127, 1.614868, 1, 1, 1, 1, 1,
0.3837333, 0.3314148, -0.0596464, 1, 1, 1, 1, 1,
0.3847231, -0.8514108, 4.683209, 1, 1, 1, 1, 1,
0.3878067, 0.6019622, 0.5369033, 1, 1, 1, 1, 1,
0.3883373, 0.6950294, 1.212451, 1, 1, 1, 1, 1,
0.3885592, 1.195195, 0.3937509, 0, 0, 1, 1, 1,
0.3889807, -0.1454105, 1.67621, 1, 0, 0, 1, 1,
0.3894756, -0.1142714, 1.871221, 1, 0, 0, 1, 1,
0.3911354, -0.8297852, 1.953776, 1, 0, 0, 1, 1,
0.394323, -0.3282401, 2.643919, 1, 0, 0, 1, 1,
0.3971676, -0.3334993, 2.190699, 1, 0, 0, 1, 1,
0.4018516, -0.5945415, 3.287944, 0, 0, 0, 1, 1,
0.404415, 0.007943186, 0.6727786, 0, 0, 0, 1, 1,
0.4048817, -0.689588, 2.905357, 0, 0, 0, 1, 1,
0.4059272, 0.8575822, 1.433723, 0, 0, 0, 1, 1,
0.4072683, -0.519793, 1.715751, 0, 0, 0, 1, 1,
0.4072702, -0.02434442, 1.881209, 0, 0, 0, 1, 1,
0.4077571, -0.2840991, 1.831251, 0, 0, 0, 1, 1,
0.4078119, 2.292462, 0.6234442, 1, 1, 1, 1, 1,
0.4114225, -1.621386, 4.069845, 1, 1, 1, 1, 1,
0.4139369, 0.1855605, 1.540967, 1, 1, 1, 1, 1,
0.4227921, 0.662707, 0.02586703, 1, 1, 1, 1, 1,
0.4248026, 1.028224, 0.6800336, 1, 1, 1, 1, 1,
0.4261251, -0.7312314, 3.767893, 1, 1, 1, 1, 1,
0.4271852, -0.8816355, 3.843056, 1, 1, 1, 1, 1,
0.4296058, 1.238198, 0.8967174, 1, 1, 1, 1, 1,
0.4353177, 0.01897143, 3.327149, 1, 1, 1, 1, 1,
0.4375447, 0.0004593848, 2.020856, 1, 1, 1, 1, 1,
0.4375572, 1.62717, -0.5218161, 1, 1, 1, 1, 1,
0.4391683, 1.168645, 0.3123008, 1, 1, 1, 1, 1,
0.444205, 0.1305186, 1.723842, 1, 1, 1, 1, 1,
0.4472813, 0.1946767, 0.6514302, 1, 1, 1, 1, 1,
0.4534678, -0.4273434, 2.116442, 1, 1, 1, 1, 1,
0.4568557, 0.1230754, 0.1885947, 0, 0, 1, 1, 1,
0.4578963, -0.3940057, 2.782025, 1, 0, 0, 1, 1,
0.4601443, 0.6706073, 1.705117, 1, 0, 0, 1, 1,
0.4642081, 0.8430165, 1.279288, 1, 0, 0, 1, 1,
0.4718326, -0.02893302, 0.9581784, 1, 0, 0, 1, 1,
0.4737869, 1.573783, 1.919237, 1, 0, 0, 1, 1,
0.4796922, 0.6627421, 1.244337, 0, 0, 0, 1, 1,
0.4855423, 0.6423422, 0.05875384, 0, 0, 0, 1, 1,
0.4902203, 1.044418, 0.2015911, 0, 0, 0, 1, 1,
0.4949909, 1.225502, 1.42823, 0, 0, 0, 1, 1,
0.5021464, -0.230251, 0.7147722, 0, 0, 0, 1, 1,
0.5033695, -0.4424775, 1.597627, 0, 0, 0, 1, 1,
0.5048763, 0.0602137, 2.812891, 0, 0, 0, 1, 1,
0.5120028, -1.005571, 2.886927, 1, 1, 1, 1, 1,
0.515138, 1.32933, -0.2380719, 1, 1, 1, 1, 1,
0.5158122, -1.117462, 2.266988, 1, 1, 1, 1, 1,
0.5195317, 0.1662899, 1.090325, 1, 1, 1, 1, 1,
0.5212362, -1.15353, 3.959631, 1, 1, 1, 1, 1,
0.5230449, 1.054464, 1.074179, 1, 1, 1, 1, 1,
0.5249389, -1.087609, 1.589908, 1, 1, 1, 1, 1,
0.5340374, 1.179404, -0.3284113, 1, 1, 1, 1, 1,
0.5401018, 3.60489, 0.2141032, 1, 1, 1, 1, 1,
0.5417833, -1.812338, 3.096859, 1, 1, 1, 1, 1,
0.5468349, -0.3314892, 1.374805, 1, 1, 1, 1, 1,
0.5534189, 0.3153833, 0.5601912, 1, 1, 1, 1, 1,
0.5573222, -0.4412038, 2.335691, 1, 1, 1, 1, 1,
0.5579105, 0.7399781, -1.445616, 1, 1, 1, 1, 1,
0.5618697, -0.2841456, 1.120136, 1, 1, 1, 1, 1,
0.5625533, 1.037816, -0.2905909, 0, 0, 1, 1, 1,
0.5639869, 1.111279, -0.1190245, 1, 0, 0, 1, 1,
0.5649154, -0.6691492, 3.48589, 1, 0, 0, 1, 1,
0.5694197, 0.8578539, 1.790248, 1, 0, 0, 1, 1,
0.5731093, 0.7476119, 1.462708, 1, 0, 0, 1, 1,
0.5753527, 0.3655028, 0.7513299, 1, 0, 0, 1, 1,
0.5797834, -0.1577801, 1.947356, 0, 0, 0, 1, 1,
0.5871544, -0.576587, 2.334886, 0, 0, 0, 1, 1,
0.5889323, -0.2687162, 1.579645, 0, 0, 0, 1, 1,
0.5935474, -0.8455, 2.849493, 0, 0, 0, 1, 1,
0.5950243, 0.9460688, -0.1161096, 0, 0, 0, 1, 1,
0.6023219, 1.362747, 0.3219347, 0, 0, 0, 1, 1,
0.605166, 0.6931403, -0.4745824, 0, 0, 0, 1, 1,
0.6096468, -1.201374, 2.147174, 1, 1, 1, 1, 1,
0.6101995, 0.7046242, 0.5568711, 1, 1, 1, 1, 1,
0.6103451, -0.7129908, 2.119828, 1, 1, 1, 1, 1,
0.614292, -0.8051933, 3.532655, 1, 1, 1, 1, 1,
0.6188474, 0.6277478, 0.5440831, 1, 1, 1, 1, 1,
0.6195719, 0.1503009, 1.845579, 1, 1, 1, 1, 1,
0.6211003, -0.491043, 2.299643, 1, 1, 1, 1, 1,
0.6212931, -1.536071, 1.714775, 1, 1, 1, 1, 1,
0.6314963, 0.2783988, 1.120602, 1, 1, 1, 1, 1,
0.6319572, 0.7337962, 1.457896, 1, 1, 1, 1, 1,
0.6342598, 1.294929, 0.1066171, 1, 1, 1, 1, 1,
0.635757, -1.662388, 2.015556, 1, 1, 1, 1, 1,
0.6386172, 0.06452266, 1.702298, 1, 1, 1, 1, 1,
0.6393054, -0.445261, 2.350821, 1, 1, 1, 1, 1,
0.6409888, -1.041658, 3.170012, 1, 1, 1, 1, 1,
0.6424381, 1.534573, -0.5430415, 0, 0, 1, 1, 1,
0.6435652, -0.08009398, 1.120321, 1, 0, 0, 1, 1,
0.6438895, -0.04686537, 1.170312, 1, 0, 0, 1, 1,
0.6455141, -0.783469, 3.476158, 1, 0, 0, 1, 1,
0.650447, 0.321843, 1.682486, 1, 0, 0, 1, 1,
0.6688242, 0.02079577, 1.9843, 1, 0, 0, 1, 1,
0.6700797, -0.8612575, 3.180583, 0, 0, 0, 1, 1,
0.6718315, -0.9921094, 1.118601, 0, 0, 0, 1, 1,
0.6737116, -0.4260236, 3.458201, 0, 0, 0, 1, 1,
0.673965, -0.5479837, 0.4983923, 0, 0, 0, 1, 1,
0.6742854, 0.2341409, 0.6393553, 0, 0, 0, 1, 1,
0.6743983, -0.6691264, 2.711744, 0, 0, 0, 1, 1,
0.6761373, -0.6223578, 3.777531, 0, 0, 0, 1, 1,
0.6774674, -1.326902, 2.510615, 1, 1, 1, 1, 1,
0.6798713, 0.8258207, 1.532011, 1, 1, 1, 1, 1,
0.6799561, 0.06676839, 2.141785, 1, 1, 1, 1, 1,
0.6863957, 0.8019422, 0.8166488, 1, 1, 1, 1, 1,
0.6866657, 0.2091128, 2.53425, 1, 1, 1, 1, 1,
0.6944605, 0.6882916, 1.499158, 1, 1, 1, 1, 1,
0.7014877, -2.011682, 3.756304, 1, 1, 1, 1, 1,
0.7070432, 1.142592, 0.859017, 1, 1, 1, 1, 1,
0.7082434, 0.5763663, 1.891068, 1, 1, 1, 1, 1,
0.7093152, 1.343904, -0.1299389, 1, 1, 1, 1, 1,
0.710626, 1.164372, 0.5156037, 1, 1, 1, 1, 1,
0.7115096, -0.6690149, 1.951037, 1, 1, 1, 1, 1,
0.7314482, 0.1553108, 0.376065, 1, 1, 1, 1, 1,
0.7381336, 0.3962054, 1.144704, 1, 1, 1, 1, 1,
0.7387877, -0.4304448, 3.307744, 1, 1, 1, 1, 1,
0.7495486, -0.2382813, 1.57398, 0, 0, 1, 1, 1,
0.7579553, 0.715103, -1.549509, 1, 0, 0, 1, 1,
0.7600411, -0.3012027, 1.35978, 1, 0, 0, 1, 1,
0.7615346, 0.703088, -0.1294255, 1, 0, 0, 1, 1,
0.7619892, 1.078868, 3.083878, 1, 0, 0, 1, 1,
0.7681417, -0.5111506, 0.718579, 1, 0, 0, 1, 1,
0.7705039, 0.2818064, 0.1816112, 0, 0, 0, 1, 1,
0.7706451, -0.5243873, 1.885401, 0, 0, 0, 1, 1,
0.7739714, -0.5995004, 1.669764, 0, 0, 0, 1, 1,
0.7756445, -0.8863156, 1.858037, 0, 0, 0, 1, 1,
0.7860297, 0.478159, 0.0909081, 0, 0, 0, 1, 1,
0.7900367, 1.626368, -0.4754913, 0, 0, 0, 1, 1,
0.8187383, 0.1919693, 1.43011, 0, 0, 0, 1, 1,
0.83893, -0.4097706, 4.143228, 1, 1, 1, 1, 1,
0.8406866, 0.7454816, 1.097748, 1, 1, 1, 1, 1,
0.843748, 1.223631, -2.180981, 1, 1, 1, 1, 1,
0.8490002, -0.1469478, -0.03485123, 1, 1, 1, 1, 1,
0.8496538, -0.2591575, 1.155609, 1, 1, 1, 1, 1,
0.85418, 0.2503646, 1.80742, 1, 1, 1, 1, 1,
0.8546739, 0.3679157, 1.067755, 1, 1, 1, 1, 1,
0.8549116, -0.3962631, 2.684523, 1, 1, 1, 1, 1,
0.856773, -0.2236563, 2.478649, 1, 1, 1, 1, 1,
0.8593187, -0.2519828, 2.361928, 1, 1, 1, 1, 1,
0.8656017, -1.964212, 3.898265, 1, 1, 1, 1, 1,
0.8769674, 0.1885106, 0.6223164, 1, 1, 1, 1, 1,
0.8811177, 0.5004913, 0.2040385, 1, 1, 1, 1, 1,
0.8896393, 0.1727979, 0.9113767, 1, 1, 1, 1, 1,
0.9041598, 0.2230966, -0.3667966, 1, 1, 1, 1, 1,
0.9092661, 0.5703798, 0.5532744, 0, 0, 1, 1, 1,
0.9126967, 0.4075295, 1.471596, 1, 0, 0, 1, 1,
0.9140768, 1.294186, -0.3509367, 1, 0, 0, 1, 1,
0.9154124, 0.7773969, 1.405479, 1, 0, 0, 1, 1,
0.920369, 0.3333654, 1.918248, 1, 0, 0, 1, 1,
0.9236127, 1.158412, 0.9109835, 1, 0, 0, 1, 1,
0.9269083, -1.215446, 3.317863, 0, 0, 0, 1, 1,
0.9293262, 0.9783522, 2.406995, 0, 0, 0, 1, 1,
0.9296641, 0.6386932, 1.051542, 0, 0, 0, 1, 1,
0.9374339, 0.1813247, 0.8244884, 0, 0, 0, 1, 1,
0.9425415, 0.06849091, 1.30975, 0, 0, 0, 1, 1,
0.9428217, -0.3151012, 2.583678, 0, 0, 0, 1, 1,
0.9488779, 1.620779, -0.1311275, 0, 0, 0, 1, 1,
0.9531834, 1.540189, 1.05938, 1, 1, 1, 1, 1,
0.9576287, -0.4814456, 3.489042, 1, 1, 1, 1, 1,
0.9602702, -1.568039, 2.303298, 1, 1, 1, 1, 1,
0.9674024, 0.1884869, 2.499348, 1, 1, 1, 1, 1,
0.9726059, -0.9662158, 1.660202, 1, 1, 1, 1, 1,
0.9778259, -0.6859702, 1.255437, 1, 1, 1, 1, 1,
0.9785286, -0.2309342, 2.269044, 1, 1, 1, 1, 1,
0.9844278, 1.668126, 1.46504, 1, 1, 1, 1, 1,
0.9865081, 1.205661, -0.3124247, 1, 1, 1, 1, 1,
0.9937303, -0.04029, 1.874164, 1, 1, 1, 1, 1,
0.9946021, -1.008686, 1.418961, 1, 1, 1, 1, 1,
0.9986333, 0.5597525, 0.296103, 1, 1, 1, 1, 1,
1.001179, 0.8741766, 0.666411, 1, 1, 1, 1, 1,
1.011831, 0.3358698, 0.8022096, 1, 1, 1, 1, 1,
1.012675, 1.082528, 0.6418859, 1, 1, 1, 1, 1,
1.0149, -0.01176225, 1.894852, 0, 0, 1, 1, 1,
1.016554, -0.01293093, 2.26766, 1, 0, 0, 1, 1,
1.022903, 0.3413398, 0.505125, 1, 0, 0, 1, 1,
1.023605, 0.6213764, 2.273492, 1, 0, 0, 1, 1,
1.025846, 0.7586762, 0.9732307, 1, 0, 0, 1, 1,
1.031423, -1.999597, 3.071387, 1, 0, 0, 1, 1,
1.037505, -0.8988637, 5.331635, 0, 0, 0, 1, 1,
1.040201, -1.279992, 2.373005, 0, 0, 0, 1, 1,
1.041354, -1.228185, 3.818545, 0, 0, 0, 1, 1,
1.062551, -1.011634, 1.517997, 0, 0, 0, 1, 1,
1.063029, 1.756639, 1.211133, 0, 0, 0, 1, 1,
1.067551, 0.5169182, 2.163055, 0, 0, 0, 1, 1,
1.072918, 1.425143, 1.671303, 0, 0, 0, 1, 1,
1.075486, -0.02683559, 0.9725153, 1, 1, 1, 1, 1,
1.076489, 0.9705024, 1.436547, 1, 1, 1, 1, 1,
1.078132, 1.382152, 0.5105222, 1, 1, 1, 1, 1,
1.085222, -0.8168276, 2.813866, 1, 1, 1, 1, 1,
1.092088, -0.8708556, 1.400707, 1, 1, 1, 1, 1,
1.092621, -0.6736259, 3.240886, 1, 1, 1, 1, 1,
1.096782, -0.6201494, 2.957508, 1, 1, 1, 1, 1,
1.098978, 0.7000842, 2.010404, 1, 1, 1, 1, 1,
1.099308, -0.1770576, 1.758099, 1, 1, 1, 1, 1,
1.101578, 1.493421, -0.01790115, 1, 1, 1, 1, 1,
1.11031, 0.7260008, 2.27872, 1, 1, 1, 1, 1,
1.113174, -1.239311, 2.767084, 1, 1, 1, 1, 1,
1.114525, 0.2437467, 1.648438, 1, 1, 1, 1, 1,
1.114959, -0.3457866, 2.885921, 1, 1, 1, 1, 1,
1.119726, 1.127164, 0.3384702, 1, 1, 1, 1, 1,
1.123262, -1.184925, 4.318919, 0, 0, 1, 1, 1,
1.124689, -2.288646, 2.116404, 1, 0, 0, 1, 1,
1.140656, 0.0922096, 2.213973, 1, 0, 0, 1, 1,
1.148527, -0.9701753, 2.40826, 1, 0, 0, 1, 1,
1.162242, 2.862149, 0.1445632, 1, 0, 0, 1, 1,
1.162984, -0.5002488, 1.637169, 1, 0, 0, 1, 1,
1.167607, 0.01732307, 3.470501, 0, 0, 0, 1, 1,
1.180995, 1.225551, 2.503336, 0, 0, 0, 1, 1,
1.193899, 1.465703, 2.128374, 0, 0, 0, 1, 1,
1.194984, 0.4215495, 0.8054954, 0, 0, 0, 1, 1,
1.204038, -0.007027902, 2.385751, 0, 0, 0, 1, 1,
1.210902, -0.1029302, 2.040087, 0, 0, 0, 1, 1,
1.214101, -0.2978796, 2.074559, 0, 0, 0, 1, 1,
1.217046, 0.8824663, 2.673414, 1, 1, 1, 1, 1,
1.228174, -1.195943, 2.115053, 1, 1, 1, 1, 1,
1.241559, -0.4004532, 1.581978, 1, 1, 1, 1, 1,
1.24888, 0.1792824, 1.082883, 1, 1, 1, 1, 1,
1.258507, 0.9906175, 0.7020926, 1, 1, 1, 1, 1,
1.261628, -0.9259935, 2.036743, 1, 1, 1, 1, 1,
1.26299, 0.7784541, 0.3780024, 1, 1, 1, 1, 1,
1.267995, 0.9441486, -0.2150589, 1, 1, 1, 1, 1,
1.272448, -1.48918, 2.091587, 1, 1, 1, 1, 1,
1.276162, -0.9669533, 2.823052, 1, 1, 1, 1, 1,
1.287525, 0.3938797, 2.04512, 1, 1, 1, 1, 1,
1.287662, 0.1106798, 1.639384, 1, 1, 1, 1, 1,
1.2919, 1.329489, -0.6833508, 1, 1, 1, 1, 1,
1.296815, -0.815723, 0.8765064, 1, 1, 1, 1, 1,
1.315376, -0.2674394, 2.208054, 1, 1, 1, 1, 1,
1.332182, -0.7792618, 3.484118, 0, 0, 1, 1, 1,
1.333342, -0.8769154, 2.844997, 1, 0, 0, 1, 1,
1.339553, -0.583864, 0.4591211, 1, 0, 0, 1, 1,
1.344709, 0.1960861, 1.873971, 1, 0, 0, 1, 1,
1.348093, 0.1753014, 1.329475, 1, 0, 0, 1, 1,
1.353767, 0.8639146, 1.526937, 1, 0, 0, 1, 1,
1.354843, 2.479404, 0.232989, 0, 0, 0, 1, 1,
1.355898, -0.4936453, 0.9035619, 0, 0, 0, 1, 1,
1.358084, -0.3505858, 2.743662, 0, 0, 0, 1, 1,
1.371331, 0.8911086, 1.067335, 0, 0, 0, 1, 1,
1.395543, -0.1881861, 2.717249, 0, 0, 0, 1, 1,
1.397094, -0.4993782, 2.828809, 0, 0, 0, 1, 1,
1.401397, -0.3709798, 2.282339, 0, 0, 0, 1, 1,
1.406967, -0.04753296, 4.00002, 1, 1, 1, 1, 1,
1.424738, 0.08740532, 2.518944, 1, 1, 1, 1, 1,
1.427026, 0.9666992, -0.4621947, 1, 1, 1, 1, 1,
1.429792, -0.1169782, 1.402908, 1, 1, 1, 1, 1,
1.433057, -0.4178579, 2.606645, 1, 1, 1, 1, 1,
1.437902, 1.242762, 1.398589, 1, 1, 1, 1, 1,
1.442678, 0.2737295, 1.681256, 1, 1, 1, 1, 1,
1.445895, 1.368965, 1.372172, 1, 1, 1, 1, 1,
1.447201, 0.8121527, 0.9473596, 1, 1, 1, 1, 1,
1.448505, -0.8166195, 2.235315, 1, 1, 1, 1, 1,
1.45431, -0.5431311, 2.486829, 1, 1, 1, 1, 1,
1.455403, 1.384531, 1.753886, 1, 1, 1, 1, 1,
1.467712, -0.03206602, 1.203282, 1, 1, 1, 1, 1,
1.471526, 1.27638, -0.02191238, 1, 1, 1, 1, 1,
1.499024, -1.385238, 1.915518, 1, 1, 1, 1, 1,
1.506671, 0.9559996, -0.8917664, 0, 0, 1, 1, 1,
1.511098, 0.09402943, 0.5365012, 1, 0, 0, 1, 1,
1.51454, -1.238677, 1.312702, 1, 0, 0, 1, 1,
1.523088, -1.762545, 2.050009, 1, 0, 0, 1, 1,
1.537031, 1.375026, -0.9706787, 1, 0, 0, 1, 1,
1.547713, 0.8960679, 1.286378, 1, 0, 0, 1, 1,
1.548534, 0.03039266, 0.1025997, 0, 0, 0, 1, 1,
1.565563, -0.08052777, 3.179722, 0, 0, 0, 1, 1,
1.587688, -0.5759297, 1.444538, 0, 0, 0, 1, 1,
1.626683, 1.70374, 0.9223724, 0, 0, 0, 1, 1,
1.631347, 1.81644, 1.77174, 0, 0, 0, 1, 1,
1.640754, -1.86056, 1.175109, 0, 0, 0, 1, 1,
1.66094, -1.643524, 2.874067, 0, 0, 0, 1, 1,
1.662846, 0.7679874, 1.02058, 1, 1, 1, 1, 1,
1.662893, 0.7103716, 1.501686, 1, 1, 1, 1, 1,
1.66537, 0.7675089, -0.4749513, 1, 1, 1, 1, 1,
1.686782, 0.003026158, 1.371743, 1, 1, 1, 1, 1,
1.695966, 0.163042, 1.475366, 1, 1, 1, 1, 1,
1.716431, -1.081055, -0.0682249, 1, 1, 1, 1, 1,
1.723421, -0.2882816, 1.103126, 1, 1, 1, 1, 1,
1.724501, -0.2942523, 1.824551, 1, 1, 1, 1, 1,
1.736019, -0.9203137, 2.357726, 1, 1, 1, 1, 1,
1.741764, 0.4209415, 1.080096, 1, 1, 1, 1, 1,
1.751144, 0.1416454, 2.122802, 1, 1, 1, 1, 1,
1.754215, -0.05027219, 0.7438587, 1, 1, 1, 1, 1,
1.780029, -0.8379018, 0.1639181, 1, 1, 1, 1, 1,
1.782902, -0.4159303, 0.1206588, 1, 1, 1, 1, 1,
1.79279, 1.772172, -0.9195492, 1, 1, 1, 1, 1,
1.796365, 1.03424, 0.1462743, 0, 0, 1, 1, 1,
1.813708, 0.1609666, 2.680427, 1, 0, 0, 1, 1,
1.835205, -0.3179563, 1.312658, 1, 0, 0, 1, 1,
1.842827, 1.432131, 0.5082667, 1, 0, 0, 1, 1,
1.851177, -1.376126, 1.04347, 1, 0, 0, 1, 1,
1.856084, 0.528724, 1.314292, 1, 0, 0, 1, 1,
1.863398, -1.393249, 1.392388, 0, 0, 0, 1, 1,
1.872754, 0.3425586, 1.160396, 0, 0, 0, 1, 1,
1.883884, 2.403393, 1.950571, 0, 0, 0, 1, 1,
1.893024, 0.1874518, 1.062304, 0, 0, 0, 1, 1,
1.933408, -0.6137239, 2.08303, 0, 0, 0, 1, 1,
1.934703, -1.66922, 2.995791, 0, 0, 0, 1, 1,
1.949896, -0.006596264, 1.031384, 0, 0, 0, 1, 1,
2.006786, -0.4992698, 2.159477, 1, 1, 1, 1, 1,
2.024947, 0.7054595, -0.1659566, 1, 1, 1, 1, 1,
2.027393, 1.701924, 1.211867, 1, 1, 1, 1, 1,
2.035911, -0.6607112, 1.608929, 1, 1, 1, 1, 1,
2.090682, 0.8811274, 2.613664, 1, 1, 1, 1, 1,
2.120337, -0.0616409, 0.3082866, 1, 1, 1, 1, 1,
2.147766, 0.149873, 1.553921, 1, 1, 1, 1, 1,
2.149471, -0.4629064, 1.533339, 1, 1, 1, 1, 1,
2.207876, -0.2545822, 2.35265, 1, 1, 1, 1, 1,
2.214303, 0.8082526, 0.4207952, 1, 1, 1, 1, 1,
2.217702, -0.1711631, 2.724047, 1, 1, 1, 1, 1,
2.239051, -0.8829064, 1.787778, 1, 1, 1, 1, 1,
2.248804, -1.013012, 2.479866, 1, 1, 1, 1, 1,
2.279356, 0.02888081, 2.565159, 1, 1, 1, 1, 1,
2.325848, 0.04058682, 1.096399, 1, 1, 1, 1, 1,
2.334988, 1.501126, 0.3558147, 0, 0, 1, 1, 1,
2.370353, 1.569478, -1.678515, 1, 0, 0, 1, 1,
2.373147, 0.09156161, 0.4057055, 1, 0, 0, 1, 1,
2.378793, -0.1521138, 2.201864, 1, 0, 0, 1, 1,
2.397832, 0.3015119, 1.446928, 1, 0, 0, 1, 1,
2.403693, 0.3680314, -0.1925219, 1, 0, 0, 1, 1,
2.410507, 0.08317398, 0.9371412, 0, 0, 0, 1, 1,
2.419276, -0.8111303, 1.673121, 0, 0, 0, 1, 1,
2.462487, 0.4655619, 0.06770235, 0, 0, 0, 1, 1,
2.484452, -1.25388, 2.17522, 0, 0, 0, 1, 1,
2.508928, 1.789706, 1.158941, 0, 0, 0, 1, 1,
2.520284, 1.96421, 1.7294, 0, 0, 0, 1, 1,
2.54682, -0.9840569, 2.009033, 0, 0, 0, 1, 1,
2.575663, -0.981076, 1.929198, 1, 1, 1, 1, 1,
2.595149, -1.474651, 2.248973, 1, 1, 1, 1, 1,
2.698926, -0.1727521, 1.818786, 1, 1, 1, 1, 1,
2.839116, -0.438902, 0.9178919, 1, 1, 1, 1, 1,
2.884289, 0.8359514, 2.129514, 1, 1, 1, 1, 1,
2.914092, 0.4323204, 2.151226, 1, 1, 1, 1, 1,
3.055927, -2.638191, 4.548686, 1, 1, 1, 1, 1
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
var radius = 9.363878;
var distance = 32.89022;
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
mvMatrix.translate( 0.0430963, -0.2989759, -0.3952813 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.89022);
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
