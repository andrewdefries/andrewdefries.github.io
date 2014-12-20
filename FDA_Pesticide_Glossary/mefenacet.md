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
-3.404851, -0.4009304, 0.4691831, 1, 0, 0, 1,
-3.177706, 0.0972021, -1.363402, 1, 0.007843138, 0, 1,
-2.849716, -0.4003816, -2.597982, 1, 0.01176471, 0, 1,
-2.834006, 0.6257917, -1.931538, 1, 0.01960784, 0, 1,
-2.739772, 0.2546564, -2.604516, 1, 0.02352941, 0, 1,
-2.71066, 0.1436095, -1.886404, 1, 0.03137255, 0, 1,
-2.686385, -1.230899, -3.807466, 1, 0.03529412, 0, 1,
-2.662492, -1.728758, -1.039976, 1, 0.04313726, 0, 1,
-2.592398, 0.2889657, -1.332644, 1, 0.04705882, 0, 1,
-2.565092, 0.5466366, -0.9819858, 1, 0.05490196, 0, 1,
-2.453514, -1.077031, -0.2546075, 1, 0.05882353, 0, 1,
-2.378057, -1.313401, -0.113489, 1, 0.06666667, 0, 1,
-2.354538, 1.133155, -2.914944, 1, 0.07058824, 0, 1,
-2.341297, -1.047437, -1.384272, 1, 0.07843138, 0, 1,
-2.282549, -0.565409, -0.09402951, 1, 0.08235294, 0, 1,
-2.277483, 0.8599583, -1.8425, 1, 0.09019608, 0, 1,
-2.253463, 1.557886, -0.5215949, 1, 0.09411765, 0, 1,
-2.226958, 1.235015, -1.436938, 1, 0.1019608, 0, 1,
-2.177231, 0.6186585, -1.463222, 1, 0.1098039, 0, 1,
-2.166635, 1.561472, -1.303401, 1, 0.1137255, 0, 1,
-2.122633, 0.07526424, -1.302608, 1, 0.1215686, 0, 1,
-2.045137, -0.2546593, -1.410839, 1, 0.1254902, 0, 1,
-2.030071, -0.6256388, -1.570532, 1, 0.1333333, 0, 1,
-2.01351, 1.535243, -1.147197, 1, 0.1372549, 0, 1,
-2.009183, -0.2326424, -0.4716811, 1, 0.145098, 0, 1,
-1.989436, 0.9957125, -1.671255, 1, 0.1490196, 0, 1,
-1.982471, -0.07198732, -2.884675, 1, 0.1568628, 0, 1,
-1.973866, 0.1530453, -1.735088, 1, 0.1607843, 0, 1,
-1.963677, 0.1175798, -2.902814, 1, 0.1686275, 0, 1,
-1.953649, 0.5190905, -1.968011, 1, 0.172549, 0, 1,
-1.946084, -0.463654, -1.285017, 1, 0.1803922, 0, 1,
-1.862496, -1.274623, -1.338329, 1, 0.1843137, 0, 1,
-1.849977, 2.298711, -0.6394562, 1, 0.1921569, 0, 1,
-1.808009, 0.04665621, -3.832525, 1, 0.1960784, 0, 1,
-1.781651, -0.3494953, -2.054231, 1, 0.2039216, 0, 1,
-1.760483, -1.969087, -1.883223, 1, 0.2117647, 0, 1,
-1.734927, 0.3333242, -0.4245834, 1, 0.2156863, 0, 1,
-1.719474, -1.680805, -1.987023, 1, 0.2235294, 0, 1,
-1.710599, 1.088081, -0.8481193, 1, 0.227451, 0, 1,
-1.701866, -0.8335504, -4.253245, 1, 0.2352941, 0, 1,
-1.70015, 0.7575552, -2.724776, 1, 0.2392157, 0, 1,
-1.696428, 1.7002, -0.5201972, 1, 0.2470588, 0, 1,
-1.692943, 1.78464, -0.9916534, 1, 0.2509804, 0, 1,
-1.688517, -2.251775, -2.612046, 1, 0.2588235, 0, 1,
-1.684911, 0.1753346, -1.36436, 1, 0.2627451, 0, 1,
-1.683679, 0.001099416, -0.6352724, 1, 0.2705882, 0, 1,
-1.677689, -0.08304638, -0.3436107, 1, 0.2745098, 0, 1,
-1.674155, -0.2905528, -3.768084, 1, 0.282353, 0, 1,
-1.667867, -0.1923026, -0.9404611, 1, 0.2862745, 0, 1,
-1.660813, 0.006322368, -0.8108424, 1, 0.2941177, 0, 1,
-1.658683, 2.329756, -1.193659, 1, 0.3019608, 0, 1,
-1.64036, -0.2983667, -2.16225, 1, 0.3058824, 0, 1,
-1.632563, 0.4315789, -2.244301, 1, 0.3137255, 0, 1,
-1.627376, 0.1449053, -0.8719043, 1, 0.3176471, 0, 1,
-1.62303, 1.379323, -2.218782, 1, 0.3254902, 0, 1,
-1.601024, 0.8032768, -1.783921, 1, 0.3294118, 0, 1,
-1.60018, -1.665061, -2.071575, 1, 0.3372549, 0, 1,
-1.595285, -2.072075, -1.846202, 1, 0.3411765, 0, 1,
-1.592759, -0.03589189, -0.962566, 1, 0.3490196, 0, 1,
-1.578437, 0.0860157, -1.235998, 1, 0.3529412, 0, 1,
-1.569922, -0.9484103, -3.922021, 1, 0.3607843, 0, 1,
-1.565551, -2.192513, -3.5097, 1, 0.3647059, 0, 1,
-1.55978, -0.2363949, -0.6704634, 1, 0.372549, 0, 1,
-1.545409, -2.005692, -3.047028, 1, 0.3764706, 0, 1,
-1.541709, 0.1361873, 0.08499944, 1, 0.3843137, 0, 1,
-1.541551, 0.5587943, -0.2506475, 1, 0.3882353, 0, 1,
-1.519085, 0.7937698, -1.390025, 1, 0.3960784, 0, 1,
-1.504794, 0.3856218, -0.2194273, 1, 0.4039216, 0, 1,
-1.504321, 0.1865224, -0.09012476, 1, 0.4078431, 0, 1,
-1.489651, -0.8809556, -2.027256, 1, 0.4156863, 0, 1,
-1.48628, 0.4987117, -1.852008, 1, 0.4196078, 0, 1,
-1.486137, -1.344046, -1.472121, 1, 0.427451, 0, 1,
-1.465847, -1.711375, -2.05229, 1, 0.4313726, 0, 1,
-1.46546, -0.4506184, -3.154413, 1, 0.4392157, 0, 1,
-1.454426, 0.7315558, -0.9096476, 1, 0.4431373, 0, 1,
-1.437088, 1.355754, -0.9275531, 1, 0.4509804, 0, 1,
-1.432087, 1.119417, -1.036032, 1, 0.454902, 0, 1,
-1.423806, -0.3410693, -0.7186583, 1, 0.4627451, 0, 1,
-1.419797, -0.9536313, -2.308379, 1, 0.4666667, 0, 1,
-1.416314, -1.935274, -4.219415, 1, 0.4745098, 0, 1,
-1.414921, -0.7538632, -3.361605, 1, 0.4784314, 0, 1,
-1.410466, -1.027321, -3.155028, 1, 0.4862745, 0, 1,
-1.409326, 2.222116, -0.02511948, 1, 0.4901961, 0, 1,
-1.406728, 1.074173, -0.5472288, 1, 0.4980392, 0, 1,
-1.397893, -0.9160073, -1.465117, 1, 0.5058824, 0, 1,
-1.392844, -1.083674, -1.774323, 1, 0.509804, 0, 1,
-1.392303, -1.720092, -2.7041, 1, 0.5176471, 0, 1,
-1.378687, 0.6996751, 0.2687324, 1, 0.5215687, 0, 1,
-1.376185, -0.6624256, -3.896444, 1, 0.5294118, 0, 1,
-1.368935, -0.1107263, -2.54103, 1, 0.5333334, 0, 1,
-1.366609, -1.679155, -2.108628, 1, 0.5411765, 0, 1,
-1.363486, -0.6040729, -2.250217, 1, 0.5450981, 0, 1,
-1.361817, 0.06678957, -2.798498, 1, 0.5529412, 0, 1,
-1.360944, 1.93263, 0.6334939, 1, 0.5568628, 0, 1,
-1.35988, -0.8688793, -2.712095, 1, 0.5647059, 0, 1,
-1.346962, 0.8359773, -0.845188, 1, 0.5686275, 0, 1,
-1.346683, 0.5438597, -2.562548, 1, 0.5764706, 0, 1,
-1.341969, -1.703007, -3.211349, 1, 0.5803922, 0, 1,
-1.336923, -0.9916968, -3.127272, 1, 0.5882353, 0, 1,
-1.33664, -0.733978, -3.252985, 1, 0.5921569, 0, 1,
-1.326682, -0.362718, -1.744868, 1, 0.6, 0, 1,
-1.304952, 0.1020627, -0.8656455, 1, 0.6078432, 0, 1,
-1.304621, 0.1244828, -0.6220786, 1, 0.6117647, 0, 1,
-1.296322, 0.08156952, -1.335147, 1, 0.6196079, 0, 1,
-1.293569, -2.280754, -1.333444, 1, 0.6235294, 0, 1,
-1.287967, -0.98319, -1.674251, 1, 0.6313726, 0, 1,
-1.274405, -2.485206, -2.308258, 1, 0.6352941, 0, 1,
-1.271007, -0.6515831, -2.195305, 1, 0.6431373, 0, 1,
-1.262012, -0.949653, -2.957116, 1, 0.6470588, 0, 1,
-1.259827, -0.6875174, -2.519904, 1, 0.654902, 0, 1,
-1.256543, 0.4413546, -0.4052703, 1, 0.6588235, 0, 1,
-1.247669, 0.853416, 0.3086362, 1, 0.6666667, 0, 1,
-1.247279, -0.8719595, -2.328528, 1, 0.6705883, 0, 1,
-1.245712, -0.9158736, -1.469509, 1, 0.6784314, 0, 1,
-1.243968, -0.2254971, -1.34186, 1, 0.682353, 0, 1,
-1.237732, 0.9580122, -1.098397, 1, 0.6901961, 0, 1,
-1.235765, 1.510437, -0.8920565, 1, 0.6941177, 0, 1,
-1.233763, -0.1996137, -0.620954, 1, 0.7019608, 0, 1,
-1.223934, 0.9425957, -1.55141, 1, 0.7098039, 0, 1,
-1.197264, 0.5285614, -0.0863252, 1, 0.7137255, 0, 1,
-1.193723, 0.006554592, -0.8557714, 1, 0.7215686, 0, 1,
-1.193085, -1.007933, -1.264618, 1, 0.7254902, 0, 1,
-1.189714, 0.2267321, 0.2286902, 1, 0.7333333, 0, 1,
-1.18305, -0.07315438, -2.648059, 1, 0.7372549, 0, 1,
-1.182635, 1.314342, 1.13551, 1, 0.7450981, 0, 1,
-1.175749, -0.2454447, -1.015951, 1, 0.7490196, 0, 1,
-1.166085, 0.1271805, -2.568454, 1, 0.7568628, 0, 1,
-1.157552, -0.1399642, -2.74052, 1, 0.7607843, 0, 1,
-1.146236, 1.042897, 0.1389972, 1, 0.7686275, 0, 1,
-1.144377, -1.03128, -2.77125, 1, 0.772549, 0, 1,
-1.141737, -1.207636, -1.764795, 1, 0.7803922, 0, 1,
-1.125927, -0.1558666, -1.44375, 1, 0.7843137, 0, 1,
-1.124021, 1.098507, 1.297877, 1, 0.7921569, 0, 1,
-1.123306, 1.165366, -0.8594849, 1, 0.7960784, 0, 1,
-1.119888, -0.8977729, -1.386657, 1, 0.8039216, 0, 1,
-1.106539, -1.024388, -1.305403, 1, 0.8117647, 0, 1,
-1.106292, -0.4111884, -2.501584, 1, 0.8156863, 0, 1,
-1.105487, -0.6345414, -2.373351, 1, 0.8235294, 0, 1,
-1.102731, -0.03459446, -1.386204, 1, 0.827451, 0, 1,
-1.094175, -0.2619938, -1.659981, 1, 0.8352941, 0, 1,
-1.093806, -0.4562529, -1.094653, 1, 0.8392157, 0, 1,
-1.093675, 1.043292, 1.491506, 1, 0.8470588, 0, 1,
-1.089646, 1.160401, -0.4371611, 1, 0.8509804, 0, 1,
-1.089101, 0.9200588, -0.8848631, 1, 0.8588235, 0, 1,
-1.083899, 1.165603, 0.7625625, 1, 0.8627451, 0, 1,
-1.082736, -1.338801, -3.04602, 1, 0.8705882, 0, 1,
-1.068067, -2.02607, -2.854057, 1, 0.8745098, 0, 1,
-1.06413, 0.6459777, -0.08761484, 1, 0.8823529, 0, 1,
-1.063716, 2.158919, -1.448514, 1, 0.8862745, 0, 1,
-1.052049, -1.155973, -2.256549, 1, 0.8941177, 0, 1,
-1.047835, 2.297983, -2.984262, 1, 0.8980392, 0, 1,
-1.045806, -0.377584, 0.1896255, 1, 0.9058824, 0, 1,
-1.040856, -1.87592, -3.208956, 1, 0.9137255, 0, 1,
-1.032998, 0.529417, -1.261426, 1, 0.9176471, 0, 1,
-1.032153, -0.09464255, -1.145434, 1, 0.9254902, 0, 1,
-1.030231, -0.8543248, -0.7286317, 1, 0.9294118, 0, 1,
-1.026094, 0.5965648, -0.2432563, 1, 0.9372549, 0, 1,
-1.022047, -0.5597421, -1.980558, 1, 0.9411765, 0, 1,
-1.021089, 1.065516, -0.431134, 1, 0.9490196, 0, 1,
-1.020054, -0.6984786, -1.268577, 1, 0.9529412, 0, 1,
-0.9948335, -1.564844, -3.496189, 1, 0.9607843, 0, 1,
-0.9907589, 0.1624582, -1.065851, 1, 0.9647059, 0, 1,
-0.9889714, 0.01063609, -1.857247, 1, 0.972549, 0, 1,
-0.9866014, 0.2358773, 0.2172239, 1, 0.9764706, 0, 1,
-0.9862708, 1.74503, 0.07731856, 1, 0.9843137, 0, 1,
-0.9824491, -0.540866, -1.755727, 1, 0.9882353, 0, 1,
-0.9802142, 1.573901, -0.7129353, 1, 0.9960784, 0, 1,
-0.9745793, 1.29823, 0.9886143, 0.9960784, 1, 0, 1,
-0.973748, -0.1718848, -1.888753, 0.9921569, 1, 0, 1,
-0.9736663, -1.234726, -2.40505, 0.9843137, 1, 0, 1,
-0.9689787, -0.2235415, -0.6185123, 0.9803922, 1, 0, 1,
-0.968049, 0.2056708, -0.2900151, 0.972549, 1, 0, 1,
-0.9668388, -0.6555448, -0.8462988, 0.9686275, 1, 0, 1,
-0.958028, -0.4263405, -2.14414, 0.9607843, 1, 0, 1,
-0.957443, -1.275959, -1.738426, 0.9568627, 1, 0, 1,
-0.9565687, 0.09393643, -2.145186, 0.9490196, 1, 0, 1,
-0.9565296, -0.4063765, -4.225152, 0.945098, 1, 0, 1,
-0.9546087, 0.06593507, -1.485827, 0.9372549, 1, 0, 1,
-0.954243, -0.4375751, -1.289652, 0.9333333, 1, 0, 1,
-0.9462324, -1.204042, -1.408455, 0.9254902, 1, 0, 1,
-0.9392251, -1.451988, -1.388667, 0.9215686, 1, 0, 1,
-0.9341145, -0.1462224, -1.110593, 0.9137255, 1, 0, 1,
-0.9315007, -0.05751057, -2.006943, 0.9098039, 1, 0, 1,
-0.9312628, 0.8529587, -0.3572878, 0.9019608, 1, 0, 1,
-0.9283946, 0.3316181, -1.020496, 0.8941177, 1, 0, 1,
-0.9268516, 0.2607006, -2.947451, 0.8901961, 1, 0, 1,
-0.9259249, -1.795196, -2.399671, 0.8823529, 1, 0, 1,
-0.9229561, 0.1720399, -1.87765, 0.8784314, 1, 0, 1,
-0.9223673, 0.7442151, -1.630528, 0.8705882, 1, 0, 1,
-0.9208343, -0.1543721, -4.088759, 0.8666667, 1, 0, 1,
-0.919188, -1.505907, -1.928899, 0.8588235, 1, 0, 1,
-0.9186927, -1.951712, -3.01405, 0.854902, 1, 0, 1,
-0.8950514, 0.1932304, -1.466034, 0.8470588, 1, 0, 1,
-0.8933375, -0.3360678, -1.278643, 0.8431373, 1, 0, 1,
-0.8862379, -0.7976182, -4.12558, 0.8352941, 1, 0, 1,
-0.8840336, 0.07038395, -1.44244, 0.8313726, 1, 0, 1,
-0.8702415, -0.3272045, -1.956247, 0.8235294, 1, 0, 1,
-0.865759, -0.1907291, -3.210564, 0.8196079, 1, 0, 1,
-0.8623808, 0.7974828, 1.725523, 0.8117647, 1, 0, 1,
-0.8601415, 0.5815856, -1.237319, 0.8078431, 1, 0, 1,
-0.8575982, -0.01208437, -2.754764, 0.8, 1, 0, 1,
-0.8554064, -1.31647, -3.308538, 0.7921569, 1, 0, 1,
-0.8536462, -0.2812395, -1.508261, 0.7882353, 1, 0, 1,
-0.8534335, 1.690568, -1.482333, 0.7803922, 1, 0, 1,
-0.8522838, 0.8512526, 1.045635, 0.7764706, 1, 0, 1,
-0.842651, -0.1199357, -0.5153856, 0.7686275, 1, 0, 1,
-0.8416247, -0.225318, -3.031723, 0.7647059, 1, 0, 1,
-0.8348983, 0.5321662, -2.981866, 0.7568628, 1, 0, 1,
-0.8325436, -0.2362582, -1.633918, 0.7529412, 1, 0, 1,
-0.8322283, -0.7382479, -3.603324, 0.7450981, 1, 0, 1,
-0.8298087, -2.282422, -3.733185, 0.7411765, 1, 0, 1,
-0.8265305, -1.550911, -1.550167, 0.7333333, 1, 0, 1,
-0.8207214, 0.3495303, -1.230109, 0.7294118, 1, 0, 1,
-0.8142334, -1.770189, -3.547661, 0.7215686, 1, 0, 1,
-0.8067867, -0.8857676, -5.093976, 0.7176471, 1, 0, 1,
-0.797749, 1.556947, -0.3220676, 0.7098039, 1, 0, 1,
-0.7953064, -0.2145775, -1.524071, 0.7058824, 1, 0, 1,
-0.7937131, 0.09480464, -0.4584374, 0.6980392, 1, 0, 1,
-0.7906731, 1.27082, 0.9163894, 0.6901961, 1, 0, 1,
-0.7810297, -0.3671567, -1.38336, 0.6862745, 1, 0, 1,
-0.7786986, -1.440389, -2.886013, 0.6784314, 1, 0, 1,
-0.7780337, 0.8171335, 0.7605895, 0.6745098, 1, 0, 1,
-0.7711761, -0.650187, -1.803042, 0.6666667, 1, 0, 1,
-0.7696581, 0.9672186, -0.4714674, 0.6627451, 1, 0, 1,
-0.7691214, 0.9723515, 0.04723161, 0.654902, 1, 0, 1,
-0.7686905, 0.3289143, -1.679613, 0.6509804, 1, 0, 1,
-0.7640677, -0.1046881, -3.217002, 0.6431373, 1, 0, 1,
-0.7611786, -0.03342744, -0.8393659, 0.6392157, 1, 0, 1,
-0.7591518, 0.7145813, -1.419896, 0.6313726, 1, 0, 1,
-0.7566922, -0.4821003, -2.177436, 0.627451, 1, 0, 1,
-0.7498079, 1.217966, -0.3151495, 0.6196079, 1, 0, 1,
-0.7493948, -0.6350098, -3.416682, 0.6156863, 1, 0, 1,
-0.7474302, 0.8905529, -0.8940895, 0.6078432, 1, 0, 1,
-0.747304, 0.07513268, -2.884074, 0.6039216, 1, 0, 1,
-0.7409921, 0.4227338, -0.9168459, 0.5960785, 1, 0, 1,
-0.7401116, -0.7881688, -1.741348, 0.5882353, 1, 0, 1,
-0.7392451, -0.8799517, -2.041933, 0.5843138, 1, 0, 1,
-0.7371243, -0.1337933, -1.976909, 0.5764706, 1, 0, 1,
-0.7342376, 0.001665359, -1.047724, 0.572549, 1, 0, 1,
-0.7334617, 0.3872675, -1.177825, 0.5647059, 1, 0, 1,
-0.7331851, 0.4135623, -1.144048, 0.5607843, 1, 0, 1,
-0.7325622, -0.136067, -0.6717947, 0.5529412, 1, 0, 1,
-0.7225659, -0.102666, -2.150421, 0.5490196, 1, 0, 1,
-0.7205172, 0.9857801, -0.3930103, 0.5411765, 1, 0, 1,
-0.7147827, 0.2430878, -1.402856, 0.5372549, 1, 0, 1,
-0.7127749, -0.1273945, -2.111659, 0.5294118, 1, 0, 1,
-0.7124513, 0.07124048, -2.430262, 0.5254902, 1, 0, 1,
-0.6917689, -0.4203061, -2.599919, 0.5176471, 1, 0, 1,
-0.6871526, 0.2211886, -0.4106998, 0.5137255, 1, 0, 1,
-0.6838305, -0.01075802, -2.42433, 0.5058824, 1, 0, 1,
-0.6831565, 0.4510578, -0.6147572, 0.5019608, 1, 0, 1,
-0.6820005, 0.6678671, -0.4820445, 0.4941176, 1, 0, 1,
-0.6707876, -0.8443998, -1.479704, 0.4862745, 1, 0, 1,
-0.668911, -0.8081276, -3.191134, 0.4823529, 1, 0, 1,
-0.6688554, -1.535388, -1.758209, 0.4745098, 1, 0, 1,
-0.6639252, 1.096117, -1.916473, 0.4705882, 1, 0, 1,
-0.6556664, 1.346905, -0.2383174, 0.4627451, 1, 0, 1,
-0.6463891, 1.905198, -1.394058, 0.4588235, 1, 0, 1,
-0.6460508, 1.535094, -0.6896272, 0.4509804, 1, 0, 1,
-0.6433437, 0.08734662, -0.5757473, 0.4470588, 1, 0, 1,
-0.6400383, -0.5824904, -1.570574, 0.4392157, 1, 0, 1,
-0.626057, -1.14723, -2.756463, 0.4352941, 1, 0, 1,
-0.6255875, -0.005333633, -1.470215, 0.427451, 1, 0, 1,
-0.6230969, 0.01381947, -0.3086994, 0.4235294, 1, 0, 1,
-0.6223189, -0.6745454, -2.1464, 0.4156863, 1, 0, 1,
-0.619963, -1.062902, -2.291856, 0.4117647, 1, 0, 1,
-0.6193322, -1.494313, -1.758196, 0.4039216, 1, 0, 1,
-0.612736, -1.225077, -2.040443, 0.3960784, 1, 0, 1,
-0.6124101, 0.3670378, -2.30853, 0.3921569, 1, 0, 1,
-0.6038756, -0.5502941, -2.134174, 0.3843137, 1, 0, 1,
-0.6000804, 0.5420713, -0.2734656, 0.3803922, 1, 0, 1,
-0.599207, -1.978763, -3.630219, 0.372549, 1, 0, 1,
-0.5973545, 1.244952, -2.069126, 0.3686275, 1, 0, 1,
-0.5956462, -1.679795, -2.142916, 0.3607843, 1, 0, 1,
-0.5939389, -1.646211, -1.253863, 0.3568628, 1, 0, 1,
-0.5914025, 2.211225, -1.848512, 0.3490196, 1, 0, 1,
-0.5889974, 2.009884, -1.881866, 0.345098, 1, 0, 1,
-0.5886433, -0.5822865, -2.723914, 0.3372549, 1, 0, 1,
-0.583854, -0.2571552, -2.397752, 0.3333333, 1, 0, 1,
-0.5782661, 1.315894, -1.553063, 0.3254902, 1, 0, 1,
-0.5736896, 1.970005, 1.306177, 0.3215686, 1, 0, 1,
-0.5732383, 0.2183427, -1.585787, 0.3137255, 1, 0, 1,
-0.5650728, 0.7216188, -0.9424009, 0.3098039, 1, 0, 1,
-0.5623156, 0.1525951, -1.705983, 0.3019608, 1, 0, 1,
-0.5539707, -1.17908, -2.766833, 0.2941177, 1, 0, 1,
-0.5520391, -0.73469, -1.806939, 0.2901961, 1, 0, 1,
-0.5496095, 2.122993, -0.2506692, 0.282353, 1, 0, 1,
-0.5482731, 1.200354, -1.017772, 0.2784314, 1, 0, 1,
-0.5480344, 1.065991, -0.2648667, 0.2705882, 1, 0, 1,
-0.5425794, -0.1565285, -1.88798, 0.2666667, 1, 0, 1,
-0.5363794, -0.6789563, -3.505644, 0.2588235, 1, 0, 1,
-0.5352141, -0.9279312, -2.790981, 0.254902, 1, 0, 1,
-0.5189735, 1.648358, -0.1792088, 0.2470588, 1, 0, 1,
-0.5187181, -0.6548371, -1.296469, 0.2431373, 1, 0, 1,
-0.5131029, -1.509888, -3.438661, 0.2352941, 1, 0, 1,
-0.5121075, 0.1957257, -3.495615, 0.2313726, 1, 0, 1,
-0.5031131, -0.05613148, -3.329256, 0.2235294, 1, 0, 1,
-0.4965821, 1.100594, -0.9737855, 0.2196078, 1, 0, 1,
-0.493716, 0.7187572, 0.722017, 0.2117647, 1, 0, 1,
-0.4882098, 0.5184199, -1.087361, 0.2078431, 1, 0, 1,
-0.4855311, 1.303869, -0.6914191, 0.2, 1, 0, 1,
-0.4849878, -1.9177, 0.2220873, 0.1921569, 1, 0, 1,
-0.4709927, 0.1148858, 0.1434164, 0.1882353, 1, 0, 1,
-0.4704355, -0.9922785, -1.451759, 0.1803922, 1, 0, 1,
-0.4702139, 0.241942, -1.944538, 0.1764706, 1, 0, 1,
-0.4698982, 0.05999841, -2.091787, 0.1686275, 1, 0, 1,
-0.4654717, 0.3703488, 0.1576233, 0.1647059, 1, 0, 1,
-0.4644718, -0.6334676, -1.400089, 0.1568628, 1, 0, 1,
-0.463297, -1.354275, -2.987667, 0.1529412, 1, 0, 1,
-0.4626213, 0.6198824, 0.001838244, 0.145098, 1, 0, 1,
-0.4603044, 0.3117631, -1.708402, 0.1411765, 1, 0, 1,
-0.4560423, -0.2423775, -2.336904, 0.1333333, 1, 0, 1,
-0.4489449, -0.5807348, -1.830078, 0.1294118, 1, 0, 1,
-0.4477371, -0.6217654, -1.059103, 0.1215686, 1, 0, 1,
-0.4469132, -1.364218, -1.860263, 0.1176471, 1, 0, 1,
-0.4456362, -0.6725221, -2.796232, 0.1098039, 1, 0, 1,
-0.4399622, 0.551134, -1.313655, 0.1058824, 1, 0, 1,
-0.4393899, -1.348639, -2.036402, 0.09803922, 1, 0, 1,
-0.4391586, 0.227668, -3.431827, 0.09019608, 1, 0, 1,
-0.4384552, 0.5126957, -1.326535, 0.08627451, 1, 0, 1,
-0.4354882, 0.616392, -1.238196, 0.07843138, 1, 0, 1,
-0.4324826, -0.05121398, -3.271771, 0.07450981, 1, 0, 1,
-0.4291312, 0.7666994, 0.4690073, 0.06666667, 1, 0, 1,
-0.4277731, -0.7115567, -3.222358, 0.0627451, 1, 0, 1,
-0.4271757, 1.365702, -0.2233284, 0.05490196, 1, 0, 1,
-0.4192083, 0.9269374, -1.186199, 0.05098039, 1, 0, 1,
-0.4192035, -0.112129, -2.386814, 0.04313726, 1, 0, 1,
-0.4177957, 0.6473168, 0.4599631, 0.03921569, 1, 0, 1,
-0.4156578, -1.493597, -3.178769, 0.03137255, 1, 0, 1,
-0.4118717, -0.9308252, -1.158672, 0.02745098, 1, 0, 1,
-0.4104289, 0.3020499, -1.244616, 0.01960784, 1, 0, 1,
-0.4007323, 0.02826664, -0.84621, 0.01568628, 1, 0, 1,
-0.4005758, 1.044847, -0.3440491, 0.007843138, 1, 0, 1,
-0.3998994, 0.5566869, -1.544622, 0.003921569, 1, 0, 1,
-0.3989672, -0.4180326, -3.032203, 0, 1, 0.003921569, 1,
-0.3851314, 1.303182, 0.8547102, 0, 1, 0.01176471, 1,
-0.3830872, -0.1882134, -0.9066803, 0, 1, 0.01568628, 1,
-0.3805521, 1.807308, -0.2576073, 0, 1, 0.02352941, 1,
-0.3771274, 0.1431174, -2.039037, 0, 1, 0.02745098, 1,
-0.3763696, 0.07400266, -2.351112, 0, 1, 0.03529412, 1,
-0.3763669, 2.155126, 0.1987365, 0, 1, 0.03921569, 1,
-0.3752307, 0.4773511, -0.6856657, 0, 1, 0.04705882, 1,
-0.3720934, -0.6259706, -0.6903704, 0, 1, 0.05098039, 1,
-0.370981, 0.4219351, -2.742339, 0, 1, 0.05882353, 1,
-0.3704692, 0.3816565, -1.910127, 0, 1, 0.0627451, 1,
-0.3638606, -0.5791711, -0.7612696, 0, 1, 0.07058824, 1,
-0.3577662, 1.205561, 1.573434, 0, 1, 0.07450981, 1,
-0.3571694, 2.929112, -2.053185, 0, 1, 0.08235294, 1,
-0.3565896, -0.8312528, -2.755322, 0, 1, 0.08627451, 1,
-0.3522199, -0.3029855, -1.811491, 0, 1, 0.09411765, 1,
-0.3507729, -2.00293, -3.703451, 0, 1, 0.1019608, 1,
-0.3450886, -0.8945981, -4.362858, 0, 1, 0.1058824, 1,
-0.3447312, 0.9234942, -1.575793, 0, 1, 0.1137255, 1,
-0.3427688, -1.166306, -3.763065, 0, 1, 0.1176471, 1,
-0.3413329, -0.6369633, -0.1104059, 0, 1, 0.1254902, 1,
-0.3397541, 0.4466385, 0.1246406, 0, 1, 0.1294118, 1,
-0.3380376, -2.031751, -2.863913, 0, 1, 0.1372549, 1,
-0.3349712, -0.2033986, -1.552924, 0, 1, 0.1411765, 1,
-0.3344679, -0.6128094, -4.647103, 0, 1, 0.1490196, 1,
-0.3334932, -1.193048, -5.368232, 0, 1, 0.1529412, 1,
-0.3323911, 0.09952869, -1.698142, 0, 1, 0.1607843, 1,
-0.3304142, -1.36983, -2.964795, 0, 1, 0.1647059, 1,
-0.3293898, 0.8023359, -1.888217, 0, 1, 0.172549, 1,
-0.3252494, 0.06273282, -2.420218, 0, 1, 0.1764706, 1,
-0.3251762, 0.005216901, -0.3079378, 0, 1, 0.1843137, 1,
-0.3248568, -1.91402, -2.492361, 0, 1, 0.1882353, 1,
-0.3247671, -0.1003142, -2.271105, 0, 1, 0.1960784, 1,
-0.3240469, -1.854877, -2.337347, 0, 1, 0.2039216, 1,
-0.3235205, 0.2190483, -1.507879, 0, 1, 0.2078431, 1,
-0.3228405, -0.8751407, -0.4348764, 0, 1, 0.2156863, 1,
-0.3198012, -0.9699678, -3.411854, 0, 1, 0.2196078, 1,
-0.3170902, 0.4639474, 1.453479, 0, 1, 0.227451, 1,
-0.3153643, 1.542286, -1.359748, 0, 1, 0.2313726, 1,
-0.3152697, 1.376734, 0.3045105, 0, 1, 0.2392157, 1,
-0.3100111, -0.03977859, -4.548886, 0, 1, 0.2431373, 1,
-0.3066653, 1.203566, -0.7412399, 0, 1, 0.2509804, 1,
-0.3060175, 0.09859156, -1.050505, 0, 1, 0.254902, 1,
-0.3042198, -1.266713, -2.000852, 0, 1, 0.2627451, 1,
-0.3004526, 0.5242007, -1.229717, 0, 1, 0.2666667, 1,
-0.2943715, 0.1429218, -3.10259, 0, 1, 0.2745098, 1,
-0.2942684, 0.2350566, -1.36682, 0, 1, 0.2784314, 1,
-0.2937049, 0.06559425, -1.377411, 0, 1, 0.2862745, 1,
-0.2887944, 2.12642, -0.2171081, 0, 1, 0.2901961, 1,
-0.2881035, 0.850344, -0.5530553, 0, 1, 0.2980392, 1,
-0.2864285, 0.6800144, 1.358033, 0, 1, 0.3058824, 1,
-0.2850553, 0.08915868, -1.251487, 0, 1, 0.3098039, 1,
-0.2843433, 0.5549226, -0.137895, 0, 1, 0.3176471, 1,
-0.283734, 1.2761, 0.674812, 0, 1, 0.3215686, 1,
-0.280277, -0.2290597, -2.292406, 0, 1, 0.3294118, 1,
-0.2788608, 0.3318653, 0.6267303, 0, 1, 0.3333333, 1,
-0.2747037, -0.2668223, -2.844909, 0, 1, 0.3411765, 1,
-0.2746794, -0.5305896, -0.4562994, 0, 1, 0.345098, 1,
-0.2730618, 0.9792858, 0.1038348, 0, 1, 0.3529412, 1,
-0.2718398, -0.6569215, -2.599333, 0, 1, 0.3568628, 1,
-0.2643605, -2.408355, -2.81552, 0, 1, 0.3647059, 1,
-0.2611595, 0.8957522, -1.051111, 0, 1, 0.3686275, 1,
-0.2582839, -0.6498856, -2.494151, 0, 1, 0.3764706, 1,
-0.2551418, 2.193319, 0.3957645, 0, 1, 0.3803922, 1,
-0.2542886, 0.265456, -0.4787283, 0, 1, 0.3882353, 1,
-0.2452504, -0.2855869, -3.037383, 0, 1, 0.3921569, 1,
-0.2442564, 0.8768891, -0.04280573, 0, 1, 0.4, 1,
-0.2381729, 0.1937099, 1.144276, 0, 1, 0.4078431, 1,
-0.2380662, -0.4006819, -4.263357, 0, 1, 0.4117647, 1,
-0.2345441, -0.7838763, -4.390897, 0, 1, 0.4196078, 1,
-0.2291773, 0.2619703, -1.599996, 0, 1, 0.4235294, 1,
-0.2243557, 0.5909964, -0.2618462, 0, 1, 0.4313726, 1,
-0.2239706, 0.8774437, 0.08298676, 0, 1, 0.4352941, 1,
-0.2227231, -0.1765931, -3.09841, 0, 1, 0.4431373, 1,
-0.2200387, 0.9043405, -0.9696273, 0, 1, 0.4470588, 1,
-0.2166199, -0.6086839, -3.366392, 0, 1, 0.454902, 1,
-0.2134225, 0.1528678, -3.047876, 0, 1, 0.4588235, 1,
-0.2125968, 1.213324, -0.1693281, 0, 1, 0.4666667, 1,
-0.2047468, -1.030625, -4.250306, 0, 1, 0.4705882, 1,
-0.202598, 0.3533742, -1.689279, 0, 1, 0.4784314, 1,
-0.1907392, 1.017873, 0.2864144, 0, 1, 0.4823529, 1,
-0.1881619, -0.8010212, -0.78931, 0, 1, 0.4901961, 1,
-0.1862436, -0.8090668, -2.805831, 0, 1, 0.4941176, 1,
-0.1835752, 0.4041401, -0.3547896, 0, 1, 0.5019608, 1,
-0.1830856, -0.2743382, -3.836042, 0, 1, 0.509804, 1,
-0.1827876, -0.9790679, -3.066712, 0, 1, 0.5137255, 1,
-0.1827201, 0.8882367, 1.443699, 0, 1, 0.5215687, 1,
-0.1795696, -0.5786229, -4.784054, 0, 1, 0.5254902, 1,
-0.1791763, 0.709685, -1.190111, 0, 1, 0.5333334, 1,
-0.1779413, 0.5017129, -1.050573, 0, 1, 0.5372549, 1,
-0.1778907, 0.4601094, 0.9348344, 0, 1, 0.5450981, 1,
-0.168844, 0.1584006, -1.5657, 0, 1, 0.5490196, 1,
-0.1681279, -1.190915, -4.244, 0, 1, 0.5568628, 1,
-0.1667885, 0.9711854, 0.3213552, 0, 1, 0.5607843, 1,
-0.1658668, -1.025511, -2.760614, 0, 1, 0.5686275, 1,
-0.1632169, 1.027999, 0.6386378, 0, 1, 0.572549, 1,
-0.1627292, 1.183065, -0.04290097, 0, 1, 0.5803922, 1,
-0.1622604, 0.1759373, -0.107387, 0, 1, 0.5843138, 1,
-0.1621382, -1.897603, -2.849474, 0, 1, 0.5921569, 1,
-0.1619126, -0.05515582, -0.7798339, 0, 1, 0.5960785, 1,
-0.1605578, 0.1145111, -0.6524354, 0, 1, 0.6039216, 1,
-0.1568605, 0.03394426, -1.903787, 0, 1, 0.6117647, 1,
-0.1568401, 2.698511, 1.983567, 0, 1, 0.6156863, 1,
-0.1559194, -1.337667, -2.043431, 0, 1, 0.6235294, 1,
-0.1553286, 0.3615809, 2.356247, 0, 1, 0.627451, 1,
-0.1486755, 0.6163138, -2.171221, 0, 1, 0.6352941, 1,
-0.1453976, 0.08165916, -2.335878, 0, 1, 0.6392157, 1,
-0.1344482, -1.103621, -1.554415, 0, 1, 0.6470588, 1,
-0.1317508, -0.3634844, -3.749416, 0, 1, 0.6509804, 1,
-0.128731, -0.2902771, -2.692388, 0, 1, 0.6588235, 1,
-0.1240739, -2.195252, -2.260209, 0, 1, 0.6627451, 1,
-0.1223547, -0.4746847, -4.652503, 0, 1, 0.6705883, 1,
-0.1203631, -1.716376, -3.277311, 0, 1, 0.6745098, 1,
-0.1172555, 0.1126382, 1.225033, 0, 1, 0.682353, 1,
-0.1171266, 0.7193816, 0.2077482, 0, 1, 0.6862745, 1,
-0.1112041, -0.1451029, -4.307618, 0, 1, 0.6941177, 1,
-0.108351, 1.086195, -0.8328294, 0, 1, 0.7019608, 1,
-0.09967922, 2.826761, -0.1679966, 0, 1, 0.7058824, 1,
-0.09962226, -1.103884, -1.058519, 0, 1, 0.7137255, 1,
-0.09880113, 0.8572402, 1.091877, 0, 1, 0.7176471, 1,
-0.098782, 0.7566285, -0.1226408, 0, 1, 0.7254902, 1,
-0.09522281, 1.367248, 0.1192354, 0, 1, 0.7294118, 1,
-0.09515965, 0.06582095, -1.134904, 0, 1, 0.7372549, 1,
-0.09373281, -0.3161834, -2.379295, 0, 1, 0.7411765, 1,
-0.08604759, 1.831684, 0.1032438, 0, 1, 0.7490196, 1,
-0.08533578, 0.6541119, 1.058785, 0, 1, 0.7529412, 1,
-0.08138282, -1.341041, -4.295256, 0, 1, 0.7607843, 1,
-0.08027536, -1.301372, -2.320268, 0, 1, 0.7647059, 1,
-0.07974101, -0.4647366, -4.601227, 0, 1, 0.772549, 1,
-0.07763123, -0.03846222, -2.514915, 0, 1, 0.7764706, 1,
-0.07509384, -0.3048058, -4.044402, 0, 1, 0.7843137, 1,
-0.07475904, -0.6561652, -3.116256, 0, 1, 0.7882353, 1,
-0.06658885, 1.288424, 1.218516, 0, 1, 0.7960784, 1,
-0.06597908, -1.124065, -2.019554, 0, 1, 0.8039216, 1,
-0.06449924, 0.0640284, -0.870827, 0, 1, 0.8078431, 1,
-0.06178361, 0.6866293, -0.3063274, 0, 1, 0.8156863, 1,
-0.06135746, 1.155829, 0.2107331, 0, 1, 0.8196079, 1,
-0.05898692, 1.390558, -0.8273134, 0, 1, 0.827451, 1,
-0.05648598, 0.9465649, 1.198427, 0, 1, 0.8313726, 1,
-0.04756478, -0.02161909, -1.944936, 0, 1, 0.8392157, 1,
-0.04469779, -0.6559047, -1.505129, 0, 1, 0.8431373, 1,
-0.04281876, 2.281779, 1.016072, 0, 1, 0.8509804, 1,
-0.04239679, 0.7333509, -1.365623, 0, 1, 0.854902, 1,
-0.04197975, -0.6778876, -1.671847, 0, 1, 0.8627451, 1,
-0.041049, 1.254095, 1.208645, 0, 1, 0.8666667, 1,
-0.03913594, 0.3330237, -0.6465211, 0, 1, 0.8745098, 1,
-0.03716495, 0.3540837, 0.3451628, 0, 1, 0.8784314, 1,
-0.02261721, 0.06751078, 0.5078326, 0, 1, 0.8862745, 1,
-0.01009069, 0.2024944, 1.070054, 0, 1, 0.8901961, 1,
-0.008065269, -1.804763, -2.007769, 0, 1, 0.8980392, 1,
-0.003815261, 0.2073387, 1.520442, 0, 1, 0.9058824, 1,
0.004623386, 0.01237074, -2.840495, 0, 1, 0.9098039, 1,
0.01030318, 0.9234832, -0.3194745, 0, 1, 0.9176471, 1,
0.01081307, 0.3219362, 0.4020305, 0, 1, 0.9215686, 1,
0.01231974, 0.03525216, -0.2813933, 0, 1, 0.9294118, 1,
0.01472876, -2.149327, 3.579367, 0, 1, 0.9333333, 1,
0.01615915, -1.284333, 2.827209, 0, 1, 0.9411765, 1,
0.01836212, 1.82367, 1.004241, 0, 1, 0.945098, 1,
0.01880904, 1.044578, 0.6605008, 0, 1, 0.9529412, 1,
0.01941518, 0.2242719, -0.3766129, 0, 1, 0.9568627, 1,
0.02180611, -0.397259, 2.234469, 0, 1, 0.9647059, 1,
0.02760038, 2.796125, -0.8007215, 0, 1, 0.9686275, 1,
0.03248011, -0.1897583, 2.796443, 0, 1, 0.9764706, 1,
0.03421421, -0.08571432, 2.298402, 0, 1, 0.9803922, 1,
0.03538201, -1.105198, 2.91223, 0, 1, 0.9882353, 1,
0.0354958, -0.2784938, 2.609813, 0, 1, 0.9921569, 1,
0.03556893, 0.02947599, -0.9109917, 0, 1, 1, 1,
0.04255584, -0.9757394, 4.140843, 0, 0.9921569, 1, 1,
0.04373754, -0.1191768, 2.92995, 0, 0.9882353, 1, 1,
0.04446528, 1.962978, 0.9336529, 0, 0.9803922, 1, 1,
0.04535363, 0.7114029, -1.51658, 0, 0.9764706, 1, 1,
0.05080527, -0.08870747, 3.122314, 0, 0.9686275, 1, 1,
0.05737467, 1.086292, 1.185516, 0, 0.9647059, 1, 1,
0.06382561, -0.4657764, 2.66035, 0, 0.9568627, 1, 1,
0.06424265, 1.940557, -0.1793149, 0, 0.9529412, 1, 1,
0.06537452, -0.3004256, 3.427261, 0, 0.945098, 1, 1,
0.0657319, -0.1666221, 3.879206, 0, 0.9411765, 1, 1,
0.0661267, -0.6811104, 3.469837, 0, 0.9333333, 1, 1,
0.07066731, 0.1968052, 0.5083798, 0, 0.9294118, 1, 1,
0.07749875, 0.1598594, 1.17877, 0, 0.9215686, 1, 1,
0.07895576, 2.050792, 0.1889955, 0, 0.9176471, 1, 1,
0.08174077, 0.3471196, -0.3455094, 0, 0.9098039, 1, 1,
0.08336717, -1.425107, 3.358535, 0, 0.9058824, 1, 1,
0.08463117, -1.151858, 4.194429, 0, 0.8980392, 1, 1,
0.08494849, 0.9583505, -0.7048334, 0, 0.8901961, 1, 1,
0.0858295, 0.2929036, 1.623703, 0, 0.8862745, 1, 1,
0.08829514, 0.7508812, 2.360013, 0, 0.8784314, 1, 1,
0.09790935, -0.4815464, 2.994192, 0, 0.8745098, 1, 1,
0.09860157, -0.8714982, 2.732297, 0, 0.8666667, 1, 1,
0.09862059, 1.608803, 1.001101, 0, 0.8627451, 1, 1,
0.100336, -1.282897, 4.413716, 0, 0.854902, 1, 1,
0.1004474, 0.7826474, 0.3553424, 0, 0.8509804, 1, 1,
0.1013981, 0.7585492, -0.5469306, 0, 0.8431373, 1, 1,
0.1040634, -0.3039522, 1.01943, 0, 0.8392157, 1, 1,
0.1040892, -0.1474363, 3.872046, 0, 0.8313726, 1, 1,
0.1061803, 2.855474, -1.352004, 0, 0.827451, 1, 1,
0.1085178, -0.8534381, 4.317822, 0, 0.8196079, 1, 1,
0.1109104, -0.1185412, 3.166903, 0, 0.8156863, 1, 1,
0.1119613, 1.422897, 1.940799, 0, 0.8078431, 1, 1,
0.1132803, 0.6041821, -0.9439105, 0, 0.8039216, 1, 1,
0.1189135, -0.6930349, 1.292299, 0, 0.7960784, 1, 1,
0.1267943, -0.3092454, 3.260943, 0, 0.7882353, 1, 1,
0.1297368, -1.976415, 2.160539, 0, 0.7843137, 1, 1,
0.1307007, 0.2905053, 0.02688661, 0, 0.7764706, 1, 1,
0.1319274, -0.386755, 1.317365, 0, 0.772549, 1, 1,
0.138603, -0.6411943, 1.931095, 0, 0.7647059, 1, 1,
0.1397047, -0.06666229, 3.236285, 0, 0.7607843, 1, 1,
0.1407609, -0.5442067, 1.850818, 0, 0.7529412, 1, 1,
0.1455552, 0.9690082, 0.5735472, 0, 0.7490196, 1, 1,
0.1464401, 0.8646808, -0.5345959, 0, 0.7411765, 1, 1,
0.1485095, 0.7678647, 0.5321314, 0, 0.7372549, 1, 1,
0.149303, -1.041712, 4.965725, 0, 0.7294118, 1, 1,
0.150773, -1.179816, 1.842379, 0, 0.7254902, 1, 1,
0.1514972, 2.609201, 0.5424654, 0, 0.7176471, 1, 1,
0.1522742, 0.5196974, 1.62396, 0, 0.7137255, 1, 1,
0.1537831, 0.3162926, -1.640635, 0, 0.7058824, 1, 1,
0.1553868, 0.2972464, -0.05944602, 0, 0.6980392, 1, 1,
0.1603654, 1.517846, 0.5192274, 0, 0.6941177, 1, 1,
0.1627062, 0.4083246, 0.9705181, 0, 0.6862745, 1, 1,
0.1701154, -0.1018459, 3.96594, 0, 0.682353, 1, 1,
0.1768583, -0.0640802, 0.9912156, 0, 0.6745098, 1, 1,
0.1785302, -0.8390657, 1.493685, 0, 0.6705883, 1, 1,
0.1786903, -1.10708, 3.284432, 0, 0.6627451, 1, 1,
0.179831, 1.575287, -1.250652, 0, 0.6588235, 1, 1,
0.1822439, -0.6502354, 3.087216, 0, 0.6509804, 1, 1,
0.1894733, 1.897324, 1.640309, 0, 0.6470588, 1, 1,
0.1903054, 0.7318979, 1.250394, 0, 0.6392157, 1, 1,
0.1981365, 0.3546284, 0.8081799, 0, 0.6352941, 1, 1,
0.1984469, 0.01628372, 1.490375, 0, 0.627451, 1, 1,
0.2015979, -0.2957635, 2.374406, 0, 0.6235294, 1, 1,
0.2019515, -0.08187102, 1.868032, 0, 0.6156863, 1, 1,
0.202395, -1.24012, 2.86069, 0, 0.6117647, 1, 1,
0.2035506, -1.214827, 3.768217, 0, 0.6039216, 1, 1,
0.2065168, 0.7103945, 0.6748338, 0, 0.5960785, 1, 1,
0.2083407, -0.5793786, 2.498338, 0, 0.5921569, 1, 1,
0.2101036, -0.4226498, 1.758193, 0, 0.5843138, 1, 1,
0.2115536, -1.805344, 4.25468, 0, 0.5803922, 1, 1,
0.2134577, -0.9235592, 5.209697, 0, 0.572549, 1, 1,
0.2159947, -0.8558654, 4.613624, 0, 0.5686275, 1, 1,
0.2185598, 0.8419515, -0.4752493, 0, 0.5607843, 1, 1,
0.2204453, -1.585466, 2.598768, 0, 0.5568628, 1, 1,
0.2211812, -1.067048, 2.616287, 0, 0.5490196, 1, 1,
0.2221211, -0.01080136, 1.446195, 0, 0.5450981, 1, 1,
0.2269863, -1.130856, 3.285104, 0, 0.5372549, 1, 1,
0.2296837, -0.9523427, 3.711141, 0, 0.5333334, 1, 1,
0.2319897, 0.7885436, 0.7381548, 0, 0.5254902, 1, 1,
0.2345106, -1.161371, 4.580115, 0, 0.5215687, 1, 1,
0.2358895, 0.2021121, 0.5046142, 0, 0.5137255, 1, 1,
0.239017, 0.9647049, -0.2614777, 0, 0.509804, 1, 1,
0.2460755, -0.7109085, 3.348332, 0, 0.5019608, 1, 1,
0.2463326, -0.2150437, 3.319337, 0, 0.4941176, 1, 1,
0.2466785, -0.2552339, 1.173502, 0, 0.4901961, 1, 1,
0.2495693, 0.3956837, -1.126619, 0, 0.4823529, 1, 1,
0.2498029, 1.105564, -0.8097616, 0, 0.4784314, 1, 1,
0.2500496, 0.2220952, 1.050075, 0, 0.4705882, 1, 1,
0.2500913, -1.165837, 1.684233, 0, 0.4666667, 1, 1,
0.2527518, 0.0706927, 2.36828, 0, 0.4588235, 1, 1,
0.2600949, -0.2189975, 1.801703, 0, 0.454902, 1, 1,
0.2608606, -0.9083554, 2.568726, 0, 0.4470588, 1, 1,
0.2690142, 0.6057562, 0.2732821, 0, 0.4431373, 1, 1,
0.2690903, -0.2216877, 2.942554, 0, 0.4352941, 1, 1,
0.2739892, 2.31248, -0.4447208, 0, 0.4313726, 1, 1,
0.2793445, -0.4316491, 1.440402, 0, 0.4235294, 1, 1,
0.2807242, 0.3517939, -0.8503802, 0, 0.4196078, 1, 1,
0.2823372, 1.060998, -0.3480155, 0, 0.4117647, 1, 1,
0.284745, 0.6307884, 1.894768, 0, 0.4078431, 1, 1,
0.2894619, 0.7570958, 0.8364704, 0, 0.4, 1, 1,
0.2924656, -1.865509, 1.444252, 0, 0.3921569, 1, 1,
0.294195, -0.3380684, 2.607893, 0, 0.3882353, 1, 1,
0.2944991, -0.2602193, 2.437671, 0, 0.3803922, 1, 1,
0.2995526, 0.3989016, 0.1583799, 0, 0.3764706, 1, 1,
0.3015721, -1.839748, 4.069696, 0, 0.3686275, 1, 1,
0.3076634, 0.7190337, 0.1247839, 0, 0.3647059, 1, 1,
0.3104391, 1.364475, 0.2746967, 0, 0.3568628, 1, 1,
0.3130366, -0.3771919, 2.00051, 0, 0.3529412, 1, 1,
0.314206, -0.006303752, 2.93433, 0, 0.345098, 1, 1,
0.3230954, -0.2198751, 1.400843, 0, 0.3411765, 1, 1,
0.3251877, -1.515833, 3.957197, 0, 0.3333333, 1, 1,
0.3267161, -0.8973067, 2.847031, 0, 0.3294118, 1, 1,
0.3301408, -0.3296557, 2.170946, 0, 0.3215686, 1, 1,
0.3346776, -0.02122679, -0.03636135, 0, 0.3176471, 1, 1,
0.3363671, -0.05184998, 3.672645, 0, 0.3098039, 1, 1,
0.3386239, -0.6454153, 3.669066, 0, 0.3058824, 1, 1,
0.3427719, -0.2928888, 3.152321, 0, 0.2980392, 1, 1,
0.3444093, 1.207421, 0.06071284, 0, 0.2901961, 1, 1,
0.3488533, 0.08101751, 1.346348, 0, 0.2862745, 1, 1,
0.3491164, 1.234665, 1.206847, 0, 0.2784314, 1, 1,
0.3515943, 0.7599383, -0.0547121, 0, 0.2745098, 1, 1,
0.3566128, 0.686337, -0.24991, 0, 0.2666667, 1, 1,
0.3593754, 0.6498575, 0.2019859, 0, 0.2627451, 1, 1,
0.3603177, -1.981309, 3.368745, 0, 0.254902, 1, 1,
0.3620679, 1.327914, 0.01210228, 0, 0.2509804, 1, 1,
0.3626487, 1.334854, 0.5271912, 0, 0.2431373, 1, 1,
0.365096, -0.2908946, 2.327337, 0, 0.2392157, 1, 1,
0.3663097, -0.3077681, 2.371284, 0, 0.2313726, 1, 1,
0.3670906, 0.4589909, 0.1055658, 0, 0.227451, 1, 1,
0.3676835, 0.4778015, -0.7945765, 0, 0.2196078, 1, 1,
0.3679758, 0.2761885, 0.6942834, 0, 0.2156863, 1, 1,
0.3683185, 1.184755, 1.126059, 0, 0.2078431, 1, 1,
0.3700173, 2.590631, -1.94542, 0, 0.2039216, 1, 1,
0.3716264, -0.2402045, 2.257001, 0, 0.1960784, 1, 1,
0.3808804, 1.482734, -0.6651368, 0, 0.1882353, 1, 1,
0.3835237, 0.1285122, 1.704055, 0, 0.1843137, 1, 1,
0.3853053, -0.3674361, 1.97455, 0, 0.1764706, 1, 1,
0.386011, -0.5849971, 2.744758, 0, 0.172549, 1, 1,
0.3868532, 0.398927, 0.8435329, 0, 0.1647059, 1, 1,
0.3878107, -0.3877697, 2.254274, 0, 0.1607843, 1, 1,
0.3889881, -1.149082, 2.719379, 0, 0.1529412, 1, 1,
0.3968496, 0.5938215, 0.8405868, 0, 0.1490196, 1, 1,
0.4005393, 0.32067, 0.6616278, 0, 0.1411765, 1, 1,
0.4015838, 0.5142719, -0.3058683, 0, 0.1372549, 1, 1,
0.4072518, -1.481941, 2.233465, 0, 0.1294118, 1, 1,
0.4087311, 1.533343, -0.3043061, 0, 0.1254902, 1, 1,
0.4099532, 0.4135612, 2.710069, 0, 0.1176471, 1, 1,
0.4104968, 1.068919, 0.638997, 0, 0.1137255, 1, 1,
0.418409, 0.8633466, 2.017441, 0, 0.1058824, 1, 1,
0.4194172, 0.3189145, 0.6468353, 0, 0.09803922, 1, 1,
0.4275264, 0.2906564, 0.8009974, 0, 0.09411765, 1, 1,
0.4325936, 0.1934429, 2.100526, 0, 0.08627451, 1, 1,
0.4356867, 1.561275, 0.9085758, 0, 0.08235294, 1, 1,
0.4404346, 0.5457819, 0.9836835, 0, 0.07450981, 1, 1,
0.4440461, 1.970856, 1.98234, 0, 0.07058824, 1, 1,
0.4448935, 1.23796, -0.4814936, 0, 0.0627451, 1, 1,
0.4456827, -0.254018, 2.045083, 0, 0.05882353, 1, 1,
0.4464616, 0.1433552, 1.002676, 0, 0.05098039, 1, 1,
0.4511274, 1.348374, 1.351562, 0, 0.04705882, 1, 1,
0.4514281, -0.545407, 0.8753544, 0, 0.03921569, 1, 1,
0.4536452, 1.22138, 0.5278913, 0, 0.03529412, 1, 1,
0.4635485, 1.566941, 1.025755, 0, 0.02745098, 1, 1,
0.4657542, 0.4032258, 0.4597677, 0, 0.02352941, 1, 1,
0.4675498, 0.8362979, 1.714597, 0, 0.01568628, 1, 1,
0.4696087, 0.8937783, 2.085077, 0, 0.01176471, 1, 1,
0.4793213, -1.068979, 3.279976, 0, 0.003921569, 1, 1,
0.4823404, 0.2432421, 2.475195, 0.003921569, 0, 1, 1,
0.4833052, -2.411338, 4.309953, 0.007843138, 0, 1, 1,
0.4856603, -1.151109, 1.622833, 0.01568628, 0, 1, 1,
0.4859551, 1.231759, 0.3828952, 0.01960784, 0, 1, 1,
0.489075, -1.714394, 2.05916, 0.02745098, 0, 1, 1,
0.4976051, -0.6155675, 3.96858, 0.03137255, 0, 1, 1,
0.49904, 0.02723878, 1.861895, 0.03921569, 0, 1, 1,
0.5038418, 0.5747229, 0.6075016, 0.04313726, 0, 1, 1,
0.5039889, 0.4324261, -0.1813083, 0.05098039, 0, 1, 1,
0.505225, -1.10068, 1.653662, 0.05490196, 0, 1, 1,
0.5061073, -1.296626, 2.840162, 0.0627451, 0, 1, 1,
0.509725, 1.998522, 0.892249, 0.06666667, 0, 1, 1,
0.5101768, -1.325966, 3.059216, 0.07450981, 0, 1, 1,
0.5109475, 0.6729826, 1.392007, 0.07843138, 0, 1, 1,
0.5188231, 0.5649899, 1.230144, 0.08627451, 0, 1, 1,
0.5205395, -1.382299, 3.072783, 0.09019608, 0, 1, 1,
0.5255703, 0.1311672, -1.381772, 0.09803922, 0, 1, 1,
0.5268942, 1.574538, -0.3438085, 0.1058824, 0, 1, 1,
0.527169, 1.554013, 1.445055, 0.1098039, 0, 1, 1,
0.5277143, 0.757297, 0.04867335, 0.1176471, 0, 1, 1,
0.5309151, 0.3188976, 3.051918, 0.1215686, 0, 1, 1,
0.5316886, 0.06939098, 3.748246, 0.1294118, 0, 1, 1,
0.5331618, -2.988197, 2.326574, 0.1333333, 0, 1, 1,
0.5389107, -0.5957516, 3.882594, 0.1411765, 0, 1, 1,
0.5395889, -0.1906825, 3.490237, 0.145098, 0, 1, 1,
0.5478726, 0.3004916, 1.227773, 0.1529412, 0, 1, 1,
0.5487238, 1.323012, 1.181045, 0.1568628, 0, 1, 1,
0.551366, -1.061524, 3.157433, 0.1647059, 0, 1, 1,
0.5520859, 0.606774, 0.1176956, 0.1686275, 0, 1, 1,
0.5571522, 1.330538, 0.2322326, 0.1764706, 0, 1, 1,
0.5596436, 1.155997, 0.3363158, 0.1803922, 0, 1, 1,
0.5599172, 0.7801104, -0.5652923, 0.1882353, 0, 1, 1,
0.5612824, 1.348308, 2.321258, 0.1921569, 0, 1, 1,
0.5677528, -0.06969741, 1.141284, 0.2, 0, 1, 1,
0.5701395, 0.2897333, 0.710744, 0.2078431, 0, 1, 1,
0.5739827, -1.383815, 3.598346, 0.2117647, 0, 1, 1,
0.5742865, -0.1975865, 2.596047, 0.2196078, 0, 1, 1,
0.5760728, 0.5400569, 3.097493, 0.2235294, 0, 1, 1,
0.580004, 1.982312, 1.047473, 0.2313726, 0, 1, 1,
0.5809014, 0.9643007, 1.53558, 0.2352941, 0, 1, 1,
0.5817574, -0.398042, 3.844628, 0.2431373, 0, 1, 1,
0.582968, 0.9219931, 1.103584, 0.2470588, 0, 1, 1,
0.5848411, 0.5610412, -0.6903953, 0.254902, 0, 1, 1,
0.5879403, -2.020938, 3.433285, 0.2588235, 0, 1, 1,
0.5942654, 0.7620543, 1.986077, 0.2666667, 0, 1, 1,
0.5943098, 1.221977, 0.5341195, 0.2705882, 0, 1, 1,
0.5952064, -0.5160283, 1.725006, 0.2784314, 0, 1, 1,
0.5952786, 0.1582926, 0.9709002, 0.282353, 0, 1, 1,
0.5996119, -0.7965264, 2.453547, 0.2901961, 0, 1, 1,
0.6003506, -0.2465579, 2.047757, 0.2941177, 0, 1, 1,
0.601042, 0.8695253, -0.1777259, 0.3019608, 0, 1, 1,
0.6068143, -0.753691, 1.890305, 0.3098039, 0, 1, 1,
0.6128665, -0.05824851, 2.565875, 0.3137255, 0, 1, 1,
0.6132658, -0.6031269, 1.325854, 0.3215686, 0, 1, 1,
0.6173199, -0.1641875, 2.031889, 0.3254902, 0, 1, 1,
0.6182261, -0.2305996, 3.821904, 0.3333333, 0, 1, 1,
0.6252744, -0.08191846, 1.960279, 0.3372549, 0, 1, 1,
0.6315081, -2.115127, 1.428104, 0.345098, 0, 1, 1,
0.6315835, 2.033717, 1.721154, 0.3490196, 0, 1, 1,
0.6327357, 0.3269179, 1.7925, 0.3568628, 0, 1, 1,
0.6371338, 0.5239434, 1.348856, 0.3607843, 0, 1, 1,
0.6409676, -0.5832391, 2.066275, 0.3686275, 0, 1, 1,
0.646891, -0.1580975, 2.015329, 0.372549, 0, 1, 1,
0.6471061, 0.00444422, 1.70201, 0.3803922, 0, 1, 1,
0.6482594, -0.4704691, 4.524276, 0.3843137, 0, 1, 1,
0.657057, -0.861503, 4.217376, 0.3921569, 0, 1, 1,
0.6571949, 1.428413, 0.9103149, 0.3960784, 0, 1, 1,
0.6577666, 0.10348, 0.0836568, 0.4039216, 0, 1, 1,
0.658079, 1.063753, -0.07571185, 0.4117647, 0, 1, 1,
0.6614906, -0.1682846, 1.655886, 0.4156863, 0, 1, 1,
0.6640363, 0.25837, 0.002455997, 0.4235294, 0, 1, 1,
0.664398, 1.328955, 0.8319501, 0.427451, 0, 1, 1,
0.6709026, 1.371769, 0.7432762, 0.4352941, 0, 1, 1,
0.6745493, -0.1109724, 2.616043, 0.4392157, 0, 1, 1,
0.6769924, -2.312458, 1.512247, 0.4470588, 0, 1, 1,
0.6788986, 2.50466, 0.139592, 0.4509804, 0, 1, 1,
0.6792482, -0.2919724, 1.599865, 0.4588235, 0, 1, 1,
0.6829673, 0.7325978, 2.218889, 0.4627451, 0, 1, 1,
0.6871188, 1.858923, 0.5889876, 0.4705882, 0, 1, 1,
0.6981531, -1.478544, 1.551868, 0.4745098, 0, 1, 1,
0.7013468, 0.4511238, 0.4733559, 0.4823529, 0, 1, 1,
0.7031662, 1.861543, -0.2321333, 0.4862745, 0, 1, 1,
0.726235, -0.6192418, 2.597978, 0.4941176, 0, 1, 1,
0.7271791, 0.6874303, 1.804452, 0.5019608, 0, 1, 1,
0.7286415, 1.093517, 0.4878176, 0.5058824, 0, 1, 1,
0.7294763, -1.801606, 1.973933, 0.5137255, 0, 1, 1,
0.7305928, -0.2594776, 2.593545, 0.5176471, 0, 1, 1,
0.7338577, -0.3705764, 1.98675, 0.5254902, 0, 1, 1,
0.7344912, 2.27069, 0.7997795, 0.5294118, 0, 1, 1,
0.7441765, 1.104656, -1.230131, 0.5372549, 0, 1, 1,
0.7442928, 0.3053799, 2.216299, 0.5411765, 0, 1, 1,
0.7460978, 0.5646003, -0.7291319, 0.5490196, 0, 1, 1,
0.7515547, -1.000136, 2.237961, 0.5529412, 0, 1, 1,
0.752684, -1.581687, 3.149529, 0.5607843, 0, 1, 1,
0.7586618, -0.249236, 1.593569, 0.5647059, 0, 1, 1,
0.759073, -1.161694, 1.619713, 0.572549, 0, 1, 1,
0.7608009, -1.155258, 3.179024, 0.5764706, 0, 1, 1,
0.7626829, 1.840024, -0.3150021, 0.5843138, 0, 1, 1,
0.7644798, 0.588376, 2.130133, 0.5882353, 0, 1, 1,
0.7649616, -1.080168, 2.572079, 0.5960785, 0, 1, 1,
0.7651008, -0.130354, 3.344814, 0.6039216, 0, 1, 1,
0.7729347, -1.144377, 2.328401, 0.6078432, 0, 1, 1,
0.7778999, 0.3552485, -0.3775955, 0.6156863, 0, 1, 1,
0.7807686, 0.6373265, 0.185591, 0.6196079, 0, 1, 1,
0.7931834, -1.454813, 3.478357, 0.627451, 0, 1, 1,
0.7962772, -0.01086423, 2.93141, 0.6313726, 0, 1, 1,
0.7974265, 1.847633, 0.2551819, 0.6392157, 0, 1, 1,
0.8010488, 0.5509412, 0.2966747, 0.6431373, 0, 1, 1,
0.8040767, 0.521159, 1.399878, 0.6509804, 0, 1, 1,
0.805325, -3.042562, 1.944039, 0.654902, 0, 1, 1,
0.8085617, -1.652318, 3.887739, 0.6627451, 0, 1, 1,
0.8086158, 0.6294863, -0.5226362, 0.6666667, 0, 1, 1,
0.8264649, -1.496987, 2.046126, 0.6745098, 0, 1, 1,
0.8304681, 1.29387, 1.619004, 0.6784314, 0, 1, 1,
0.8374421, 0.6874388, 0.2058346, 0.6862745, 0, 1, 1,
0.8378001, -1.595021, 0.958806, 0.6901961, 0, 1, 1,
0.8385327, 0.4161811, -0.253171, 0.6980392, 0, 1, 1,
0.8547038, 0.1372157, 1.091344, 0.7058824, 0, 1, 1,
0.8556493, 0.04235604, 0.3601158, 0.7098039, 0, 1, 1,
0.857097, -0.2072483, 0.9109657, 0.7176471, 0, 1, 1,
0.8608385, -0.1199308, 2.11129, 0.7215686, 0, 1, 1,
0.8621545, -0.4129048, 1.470223, 0.7294118, 0, 1, 1,
0.866513, 0.4496753, 1.625465, 0.7333333, 0, 1, 1,
0.8667642, -0.1015487, 3.258044, 0.7411765, 0, 1, 1,
0.8687773, 0.4133352, 0.7095806, 0.7450981, 0, 1, 1,
0.8719626, -1.674175, 2.153248, 0.7529412, 0, 1, 1,
0.8761335, 0.6547284, 0.6711229, 0.7568628, 0, 1, 1,
0.87848, -0.6574529, 1.19767, 0.7647059, 0, 1, 1,
0.8886017, 0.2206813, 2.330665, 0.7686275, 0, 1, 1,
0.8962165, 0.3337047, -0.7618538, 0.7764706, 0, 1, 1,
0.8987243, -1.610358, 1.024574, 0.7803922, 0, 1, 1,
0.9044892, 0.3492524, 1.633319, 0.7882353, 0, 1, 1,
0.9077358, -1.384211, 3.684843, 0.7921569, 0, 1, 1,
0.9116212, -1.034034, 2.286, 0.8, 0, 1, 1,
0.9269054, -0.4804573, 3.485675, 0.8078431, 0, 1, 1,
0.9274725, -0.7484949, 1.941046, 0.8117647, 0, 1, 1,
0.9345298, 2.077902, 0.6465618, 0.8196079, 0, 1, 1,
0.9401377, 0.5716369, 1.930605, 0.8235294, 0, 1, 1,
0.9408109, 1.142813, -0.5057024, 0.8313726, 0, 1, 1,
0.9409891, 0.453632, 1.007837, 0.8352941, 0, 1, 1,
0.9441546, -0.9023478, 1.522108, 0.8431373, 0, 1, 1,
0.9462486, 1.138371, -0.4148348, 0.8470588, 0, 1, 1,
0.9493167, 1.648082, 0.2248284, 0.854902, 0, 1, 1,
0.9582985, -0.3498632, 0.4707551, 0.8588235, 0, 1, 1,
0.9655143, -0.5860721, 1.226507, 0.8666667, 0, 1, 1,
0.9660404, -0.8897545, 1.580342, 0.8705882, 0, 1, 1,
0.969043, 1.101802, 1.507718, 0.8784314, 0, 1, 1,
0.9765, 0.4961272, -0.5943294, 0.8823529, 0, 1, 1,
0.9863901, 1.827358, 1.436611, 0.8901961, 0, 1, 1,
0.9873208, -0.7012537, 1.78053, 0.8941177, 0, 1, 1,
0.9900798, 0.8868158, 0.07002895, 0.9019608, 0, 1, 1,
0.9938329, -0.481009, 1.081905, 0.9098039, 0, 1, 1,
0.9951595, -0.4064743, 3.091915, 0.9137255, 0, 1, 1,
0.9994613, 1.004804, -0.7515788, 0.9215686, 0, 1, 1,
1.008754, 1.761337, 0.24568, 0.9254902, 0, 1, 1,
1.008759, 0.9501747, 1.80978, 0.9333333, 0, 1, 1,
1.010413, -0.7811822, 1.645805, 0.9372549, 0, 1, 1,
1.010729, 1.242136, 0.2896017, 0.945098, 0, 1, 1,
1.011314, 0.3785083, 1.31828, 0.9490196, 0, 1, 1,
1.014251, -0.4222211, 0.3396218, 0.9568627, 0, 1, 1,
1.022806, 0.2100081, 0.2603517, 0.9607843, 0, 1, 1,
1.029584, 0.06655965, 1.916388, 0.9686275, 0, 1, 1,
1.031572, -0.02075029, 2.195928, 0.972549, 0, 1, 1,
1.033087, -0.8407919, 3.533105, 0.9803922, 0, 1, 1,
1.035692, 2.709362, -2.124839, 0.9843137, 0, 1, 1,
1.043632, -0.7636368, 2.56187, 0.9921569, 0, 1, 1,
1.043638, 0.3831969, 0.04930156, 0.9960784, 0, 1, 1,
1.044744, -2.254528, 2.469829, 1, 0, 0.9960784, 1,
1.046883, 0.4928419, -0.4243279, 1, 0, 0.9882353, 1,
1.048609, 0.2624083, 4.165257, 1, 0, 0.9843137, 1,
1.049589, -0.8837637, 2.660367, 1, 0, 0.9764706, 1,
1.052619, -1.20196, 1.659319, 1, 0, 0.972549, 1,
1.052935, 1.174765, 0.1589139, 1, 0, 0.9647059, 1,
1.059976, 0.005991125, 2.454061, 1, 0, 0.9607843, 1,
1.060766, -1.386119, 1.081691, 1, 0, 0.9529412, 1,
1.063786, -0.318965, 1.367255, 1, 0, 0.9490196, 1,
1.064637, 0.1725701, 1.456655, 1, 0, 0.9411765, 1,
1.067778, 0.05315813, 2.02069, 1, 0, 0.9372549, 1,
1.07034, -1.064203, 0.9043059, 1, 0, 0.9294118, 1,
1.074794, -1.892364, 2.804895, 1, 0, 0.9254902, 1,
1.078233, 0.474075, 2.247562, 1, 0, 0.9176471, 1,
1.086359, -0.7202595, 1.740374, 1, 0, 0.9137255, 1,
1.091837, 0.117425, 1.882224, 1, 0, 0.9058824, 1,
1.094738, -0.9520099, 2.412611, 1, 0, 0.9019608, 1,
1.103524, -1.415399, 0.01599931, 1, 0, 0.8941177, 1,
1.105489, -1.24973, 4.490274, 1, 0, 0.8862745, 1,
1.106747, 0.7730526, 1.974149, 1, 0, 0.8823529, 1,
1.110726, -0.244813, 2.995627, 1, 0, 0.8745098, 1,
1.111046, 1.724477, -0.1921431, 1, 0, 0.8705882, 1,
1.11264, -2.258106, 1.923301, 1, 0, 0.8627451, 1,
1.116572, 1.529832, 0.2911425, 1, 0, 0.8588235, 1,
1.122483, -0.01080776, 1.556061, 1, 0, 0.8509804, 1,
1.138546, 0.3100626, 1.568001, 1, 0, 0.8470588, 1,
1.140359, -1.000529, 3.884061, 1, 0, 0.8392157, 1,
1.147622, -0.1879592, 1.536237, 1, 0, 0.8352941, 1,
1.157027, -1.705552, 2.96144, 1, 0, 0.827451, 1,
1.157448, -2.254627, 2.335699, 1, 0, 0.8235294, 1,
1.158893, 2.215962, 1.236031, 1, 0, 0.8156863, 1,
1.166035, 0.8741241, 0.9709446, 1, 0, 0.8117647, 1,
1.167625, -1.476023, 3.047849, 1, 0, 0.8039216, 1,
1.176051, 0.6436515, 1.509172, 1, 0, 0.7960784, 1,
1.182536, 2.003443, 1.158059, 1, 0, 0.7921569, 1,
1.186436, -1.595291, 2.563513, 1, 0, 0.7843137, 1,
1.188118, -0.2243755, 1.439744, 1, 0, 0.7803922, 1,
1.189565, -0.1073019, 0.9298533, 1, 0, 0.772549, 1,
1.198505, -2.61502, 2.214398, 1, 0, 0.7686275, 1,
1.202284, 0.02436671, 1.133, 1, 0, 0.7607843, 1,
1.207589, 0.1277101, 1.408534, 1, 0, 0.7568628, 1,
1.211118, -2.230504, 1.189299, 1, 0, 0.7490196, 1,
1.219421, 0.07065029, 1.598325, 1, 0, 0.7450981, 1,
1.222481, 0.9988061, 1.761351, 1, 0, 0.7372549, 1,
1.231604, -0.8346923, 1.895458, 1, 0, 0.7333333, 1,
1.23225, 0.8173969, 1.65381, 1, 0, 0.7254902, 1,
1.239049, 1.081318, 1.280008, 1, 0, 0.7215686, 1,
1.242772, 0.3434388, 1.055212, 1, 0, 0.7137255, 1,
1.264232, 0.01338854, 2.090127, 1, 0, 0.7098039, 1,
1.268744, 1.615238, 0.5805337, 1, 0, 0.7019608, 1,
1.279469, 0.1517857, 3.296524, 1, 0, 0.6941177, 1,
1.283993, -0.6413435, 3.4233, 1, 0, 0.6901961, 1,
1.28472, 1.655893, 1.317132, 1, 0, 0.682353, 1,
1.29736, 0.3901391, 0.05466862, 1, 0, 0.6784314, 1,
1.298974, -1.75846, 2.548041, 1, 0, 0.6705883, 1,
1.307582, -1.558686, 1.830106, 1, 0, 0.6666667, 1,
1.321285, 1.454726, 1.541169, 1, 0, 0.6588235, 1,
1.322181, 0.4096175, 2.157907, 1, 0, 0.654902, 1,
1.335647, 0.02047476, 2.319098, 1, 0, 0.6470588, 1,
1.344812, -1.275774, 1.310195, 1, 0, 0.6431373, 1,
1.357025, 0.7621064, 0.579855, 1, 0, 0.6352941, 1,
1.362103, -0.7469253, 3.02754, 1, 0, 0.6313726, 1,
1.363552, 1.139937, 0.5092211, 1, 0, 0.6235294, 1,
1.374514, -0.6595061, 1.913147, 1, 0, 0.6196079, 1,
1.376642, 0.3951809, 0.6218221, 1, 0, 0.6117647, 1,
1.386448, 2.452106, 0.7664646, 1, 0, 0.6078432, 1,
1.389465, 0.9211273, -0.06432594, 1, 0, 0.6, 1,
1.390654, -0.258372, 2.938962, 1, 0, 0.5921569, 1,
1.394478, 0.6208086, 1.480886, 1, 0, 0.5882353, 1,
1.394652, -1.323111, 2.726363, 1, 0, 0.5803922, 1,
1.398895, 1.484619, 1.855711, 1, 0, 0.5764706, 1,
1.402659, -0.4522226, 3.107054, 1, 0, 0.5686275, 1,
1.426228, -1.750342, 1.475871, 1, 0, 0.5647059, 1,
1.432895, 1.028843, 3.004017, 1, 0, 0.5568628, 1,
1.434448, 0.02784129, 1.923373, 1, 0, 0.5529412, 1,
1.434984, -0.9190397, 4.415431, 1, 0, 0.5450981, 1,
1.435196, 1.802906, 1.086758, 1, 0, 0.5411765, 1,
1.437858, -1.173626, 2.087993, 1, 0, 0.5333334, 1,
1.449934, 0.3317436, 2.445326, 1, 0, 0.5294118, 1,
1.450471, -0.1770379, 2.406166, 1, 0, 0.5215687, 1,
1.45656, 0.3020534, 2.520792, 1, 0, 0.5176471, 1,
1.466219, 0.2585059, 0.4748068, 1, 0, 0.509804, 1,
1.466915, -0.6030999, 2.063541, 1, 0, 0.5058824, 1,
1.471221, 1.024708, -0.1855245, 1, 0, 0.4980392, 1,
1.474352, 2.761811, 1.668316, 1, 0, 0.4901961, 1,
1.47871, -0.8610859, 0.913187, 1, 0, 0.4862745, 1,
1.4827, -1.433692, 1.645907, 1, 0, 0.4784314, 1,
1.483889, 1.260258, 1.841709, 1, 0, 0.4745098, 1,
1.494654, 1.227042, -0.5000291, 1, 0, 0.4666667, 1,
1.495729, -0.1282531, 0.8630286, 1, 0, 0.4627451, 1,
1.500279, -1.230869, 2.630031, 1, 0, 0.454902, 1,
1.508678, 1.022665, 3.292928, 1, 0, 0.4509804, 1,
1.52322, -1.099023, 0.9871789, 1, 0, 0.4431373, 1,
1.52449, -1.144348, 1.689407, 1, 0, 0.4392157, 1,
1.531101, 1.317722, -0.4920513, 1, 0, 0.4313726, 1,
1.534482, -1.802187, 2.250447, 1, 0, 0.427451, 1,
1.537135, 0.1237206, 2.52774, 1, 0, 0.4196078, 1,
1.54138, 1.045736, 1.564607, 1, 0, 0.4156863, 1,
1.541782, -1.220713, 2.56348, 1, 0, 0.4078431, 1,
1.54472, -1.094397, 3.600366, 1, 0, 0.4039216, 1,
1.545899, -1.048751, 0.8258967, 1, 0, 0.3960784, 1,
1.546378, -1.168648, 0.9750388, 1, 0, 0.3882353, 1,
1.55533, 1.340747, 0.992672, 1, 0, 0.3843137, 1,
1.559823, -0.9437984, 3.576171, 1, 0, 0.3764706, 1,
1.566771, 0.6004453, 0.7526113, 1, 0, 0.372549, 1,
1.568179, 0.4193264, 0.7622052, 1, 0, 0.3647059, 1,
1.585684, 1.152386, 1.584087, 1, 0, 0.3607843, 1,
1.589901, 0.4996369, 1.168031, 1, 0, 0.3529412, 1,
1.594436, -0.4667157, 2.304744, 1, 0, 0.3490196, 1,
1.640625, -1.602518, 2.411713, 1, 0, 0.3411765, 1,
1.641821, 1.265262, 1.896232, 1, 0, 0.3372549, 1,
1.659452, 1.347425, 0.6599232, 1, 0, 0.3294118, 1,
1.664039, 1.128472, 1.400794, 1, 0, 0.3254902, 1,
1.688367, -0.6963783, 2.04248, 1, 0, 0.3176471, 1,
1.698874, 1.245275, 2.733752, 1, 0, 0.3137255, 1,
1.701763, 0.7586024, 0.9182079, 1, 0, 0.3058824, 1,
1.74195, 0.242336, 0.5309895, 1, 0, 0.2980392, 1,
1.760559, 2.072541, 1.716334, 1, 0, 0.2941177, 1,
1.761372, -0.8058049, 1.230735, 1, 0, 0.2862745, 1,
1.766992, -0.6633968, 1.950936, 1, 0, 0.282353, 1,
1.767961, -1.966295, 3.844596, 1, 0, 0.2745098, 1,
1.774422, -0.6696861, 1.517104, 1, 0, 0.2705882, 1,
1.804414, 0.9023271, 1.509663, 1, 0, 0.2627451, 1,
1.809148, 0.152638, 0.6225833, 1, 0, 0.2588235, 1,
1.809868, 0.1882323, 2.443035, 1, 0, 0.2509804, 1,
1.810797, -0.4550005, 1.031455, 1, 0, 0.2470588, 1,
1.817137, 0.6636051, 1.484835, 1, 0, 0.2392157, 1,
1.834113, 0.5202017, 1.939703, 1, 0, 0.2352941, 1,
1.84531, -0.6209649, 1.625892, 1, 0, 0.227451, 1,
1.849583, 0.7251328, 1.633075, 1, 0, 0.2235294, 1,
1.872489, 1.339617, 3.104139, 1, 0, 0.2156863, 1,
1.908968, 0.8911839, 1.175174, 1, 0, 0.2117647, 1,
1.913431, -0.4496807, 1.332804, 1, 0, 0.2039216, 1,
1.935315, 1.390095, 1.04451, 1, 0, 0.1960784, 1,
1.950391, -0.3777426, 0.7078204, 1, 0, 0.1921569, 1,
1.976495, 0.1508307, 0.503177, 1, 0, 0.1843137, 1,
1.986197, -0.06918599, 1.747142, 1, 0, 0.1803922, 1,
2.011965, 1.198763, 1.310097, 1, 0, 0.172549, 1,
2.025466, -0.1694973, 0.2455293, 1, 0, 0.1686275, 1,
2.044428, 0.2921723, 1.475857, 1, 0, 0.1607843, 1,
2.0632, 1.896325, 0.3479491, 1, 0, 0.1568628, 1,
2.070521, -2.705457, 2.863121, 1, 0, 0.1490196, 1,
2.109828, -0.7338068, 2.439421, 1, 0, 0.145098, 1,
2.110693, 0.6051965, 1.353187, 1, 0, 0.1372549, 1,
2.127346, -0.056373, 2.887229, 1, 0, 0.1333333, 1,
2.129481, 0.11071, 0.8693121, 1, 0, 0.1254902, 1,
2.131454, 0.1096665, 2.531132, 1, 0, 0.1215686, 1,
2.145248, 0.5234925, 0.7817504, 1, 0, 0.1137255, 1,
2.152186, -1.46645, 2.507412, 1, 0, 0.1098039, 1,
2.164139, -0.2229025, 1.210738, 1, 0, 0.1019608, 1,
2.210489, -1.329163, 3.096766, 1, 0, 0.09411765, 1,
2.217642, -2.074713, 1.133087, 1, 0, 0.09019608, 1,
2.229932, -0.2544515, 0.4847824, 1, 0, 0.08235294, 1,
2.233229, 0.5037989, 2.806546, 1, 0, 0.07843138, 1,
2.264123, 0.3615482, -0.6720217, 1, 0, 0.07058824, 1,
2.268668, -1.024051, 2.141991, 1, 0, 0.06666667, 1,
2.276901, -1.000488, 0.1323194, 1, 0, 0.05882353, 1,
2.288047, -1.511916, 1.902365, 1, 0, 0.05490196, 1,
2.315592, 1.09485, 1.562448, 1, 0, 0.04705882, 1,
2.509572, 1.518034, 1.656781, 1, 0, 0.04313726, 1,
2.527494, 0.04289849, 1.136052, 1, 0, 0.03529412, 1,
2.580535, 0.3680145, 2.115214, 1, 0, 0.03137255, 1,
2.664627, -0.9344164, 2.028131, 1, 0, 0.02352941, 1,
2.709077, 0.8152823, 2.251469, 1, 0, 0.01960784, 1,
2.738949, -2.129636, 3.498395, 1, 0, 0.01176471, 1,
3.141671, 0.7526835, -0.4829831, 1, 0, 0.007843138, 1
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
-0.13159, -4.05476, -7.161191, 0, -0.5, 0.5, 0.5,
-0.13159, -4.05476, -7.161191, 1, -0.5, 0.5, 0.5,
-0.13159, -4.05476, -7.161191, 1, 1.5, 0.5, 0.5,
-0.13159, -4.05476, -7.161191, 0, 1.5, 0.5, 0.5
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
-4.514486, -0.05672503, -7.161191, 0, -0.5, 0.5, 0.5,
-4.514486, -0.05672503, -7.161191, 1, -0.5, 0.5, 0.5,
-4.514486, -0.05672503, -7.161191, 1, 1.5, 0.5, 0.5,
-4.514486, -0.05672503, -7.161191, 0, 1.5, 0.5, 0.5
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
-4.514486, -4.05476, -0.0792675, 0, -0.5, 0.5, 0.5,
-4.514486, -4.05476, -0.0792675, 1, -0.5, 0.5, 0.5,
-4.514486, -4.05476, -0.0792675, 1, 1.5, 0.5, 0.5,
-4.514486, -4.05476, -0.0792675, 0, 1.5, 0.5, 0.5
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
-3, -3.132137, -5.526901,
3, -3.132137, -5.526901,
-3, -3.132137, -5.526901,
-3, -3.285908, -5.799283,
-2, -3.132137, -5.526901,
-2, -3.285908, -5.799283,
-1, -3.132137, -5.526901,
-1, -3.285908, -5.799283,
0, -3.132137, -5.526901,
0, -3.285908, -5.799283,
1, -3.132137, -5.526901,
1, -3.285908, -5.799283,
2, -3.132137, -5.526901,
2, -3.285908, -5.799283,
3, -3.132137, -5.526901,
3, -3.285908, -5.799283
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
-3, -3.593449, -6.344046, 0, -0.5, 0.5, 0.5,
-3, -3.593449, -6.344046, 1, -0.5, 0.5, 0.5,
-3, -3.593449, -6.344046, 1, 1.5, 0.5, 0.5,
-3, -3.593449, -6.344046, 0, 1.5, 0.5, 0.5,
-2, -3.593449, -6.344046, 0, -0.5, 0.5, 0.5,
-2, -3.593449, -6.344046, 1, -0.5, 0.5, 0.5,
-2, -3.593449, -6.344046, 1, 1.5, 0.5, 0.5,
-2, -3.593449, -6.344046, 0, 1.5, 0.5, 0.5,
-1, -3.593449, -6.344046, 0, -0.5, 0.5, 0.5,
-1, -3.593449, -6.344046, 1, -0.5, 0.5, 0.5,
-1, -3.593449, -6.344046, 1, 1.5, 0.5, 0.5,
-1, -3.593449, -6.344046, 0, 1.5, 0.5, 0.5,
0, -3.593449, -6.344046, 0, -0.5, 0.5, 0.5,
0, -3.593449, -6.344046, 1, -0.5, 0.5, 0.5,
0, -3.593449, -6.344046, 1, 1.5, 0.5, 0.5,
0, -3.593449, -6.344046, 0, 1.5, 0.5, 0.5,
1, -3.593449, -6.344046, 0, -0.5, 0.5, 0.5,
1, -3.593449, -6.344046, 1, -0.5, 0.5, 0.5,
1, -3.593449, -6.344046, 1, 1.5, 0.5, 0.5,
1, -3.593449, -6.344046, 0, 1.5, 0.5, 0.5,
2, -3.593449, -6.344046, 0, -0.5, 0.5, 0.5,
2, -3.593449, -6.344046, 1, -0.5, 0.5, 0.5,
2, -3.593449, -6.344046, 1, 1.5, 0.5, 0.5,
2, -3.593449, -6.344046, 0, 1.5, 0.5, 0.5,
3, -3.593449, -6.344046, 0, -0.5, 0.5, 0.5,
3, -3.593449, -6.344046, 1, -0.5, 0.5, 0.5,
3, -3.593449, -6.344046, 1, 1.5, 0.5, 0.5,
3, -3.593449, -6.344046, 0, 1.5, 0.5, 0.5
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
-3.503049, -3, -5.526901,
-3.503049, 2, -5.526901,
-3.503049, -3, -5.526901,
-3.671622, -3, -5.799283,
-3.503049, -2, -5.526901,
-3.671622, -2, -5.799283,
-3.503049, -1, -5.526901,
-3.671622, -1, -5.799283,
-3.503049, 0, -5.526901,
-3.671622, 0, -5.799283,
-3.503049, 1, -5.526901,
-3.671622, 1, -5.799283,
-3.503049, 2, -5.526901,
-3.671622, 2, -5.799283
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
-4.008768, -3, -6.344046, 0, -0.5, 0.5, 0.5,
-4.008768, -3, -6.344046, 1, -0.5, 0.5, 0.5,
-4.008768, -3, -6.344046, 1, 1.5, 0.5, 0.5,
-4.008768, -3, -6.344046, 0, 1.5, 0.5, 0.5,
-4.008768, -2, -6.344046, 0, -0.5, 0.5, 0.5,
-4.008768, -2, -6.344046, 1, -0.5, 0.5, 0.5,
-4.008768, -2, -6.344046, 1, 1.5, 0.5, 0.5,
-4.008768, -2, -6.344046, 0, 1.5, 0.5, 0.5,
-4.008768, -1, -6.344046, 0, -0.5, 0.5, 0.5,
-4.008768, -1, -6.344046, 1, -0.5, 0.5, 0.5,
-4.008768, -1, -6.344046, 1, 1.5, 0.5, 0.5,
-4.008768, -1, -6.344046, 0, 1.5, 0.5, 0.5,
-4.008768, 0, -6.344046, 0, -0.5, 0.5, 0.5,
-4.008768, 0, -6.344046, 1, -0.5, 0.5, 0.5,
-4.008768, 0, -6.344046, 1, 1.5, 0.5, 0.5,
-4.008768, 0, -6.344046, 0, 1.5, 0.5, 0.5,
-4.008768, 1, -6.344046, 0, -0.5, 0.5, 0.5,
-4.008768, 1, -6.344046, 1, -0.5, 0.5, 0.5,
-4.008768, 1, -6.344046, 1, 1.5, 0.5, 0.5,
-4.008768, 1, -6.344046, 0, 1.5, 0.5, 0.5,
-4.008768, 2, -6.344046, 0, -0.5, 0.5, 0.5,
-4.008768, 2, -6.344046, 1, -0.5, 0.5, 0.5,
-4.008768, 2, -6.344046, 1, 1.5, 0.5, 0.5,
-4.008768, 2, -6.344046, 0, 1.5, 0.5, 0.5
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
-3.503049, -3.132137, -4,
-3.503049, -3.132137, 4,
-3.503049, -3.132137, -4,
-3.671622, -3.285908, -4,
-3.503049, -3.132137, -2,
-3.671622, -3.285908, -2,
-3.503049, -3.132137, 0,
-3.671622, -3.285908, 0,
-3.503049, -3.132137, 2,
-3.671622, -3.285908, 2,
-3.503049, -3.132137, 4,
-3.671622, -3.285908, 4
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
-4.008768, -3.593449, -4, 0, -0.5, 0.5, 0.5,
-4.008768, -3.593449, -4, 1, -0.5, 0.5, 0.5,
-4.008768, -3.593449, -4, 1, 1.5, 0.5, 0.5,
-4.008768, -3.593449, -4, 0, 1.5, 0.5, 0.5,
-4.008768, -3.593449, -2, 0, -0.5, 0.5, 0.5,
-4.008768, -3.593449, -2, 1, -0.5, 0.5, 0.5,
-4.008768, -3.593449, -2, 1, 1.5, 0.5, 0.5,
-4.008768, -3.593449, -2, 0, 1.5, 0.5, 0.5,
-4.008768, -3.593449, 0, 0, -0.5, 0.5, 0.5,
-4.008768, -3.593449, 0, 1, -0.5, 0.5, 0.5,
-4.008768, -3.593449, 0, 1, 1.5, 0.5, 0.5,
-4.008768, -3.593449, 0, 0, 1.5, 0.5, 0.5,
-4.008768, -3.593449, 2, 0, -0.5, 0.5, 0.5,
-4.008768, -3.593449, 2, 1, -0.5, 0.5, 0.5,
-4.008768, -3.593449, 2, 1, 1.5, 0.5, 0.5,
-4.008768, -3.593449, 2, 0, 1.5, 0.5, 0.5,
-4.008768, -3.593449, 4, 0, -0.5, 0.5, 0.5,
-4.008768, -3.593449, 4, 1, -0.5, 0.5, 0.5,
-4.008768, -3.593449, 4, 1, 1.5, 0.5, 0.5,
-4.008768, -3.593449, 4, 0, 1.5, 0.5, 0.5
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
-3.503049, -3.132137, -5.526901,
-3.503049, 3.018687, -5.526901,
-3.503049, -3.132137, 5.368366,
-3.503049, 3.018687, 5.368366,
-3.503049, -3.132137, -5.526901,
-3.503049, -3.132137, 5.368366,
-3.503049, 3.018687, -5.526901,
-3.503049, 3.018687, 5.368366,
-3.503049, -3.132137, -5.526901,
3.239869, -3.132137, -5.526901,
-3.503049, -3.132137, 5.368366,
3.239869, -3.132137, 5.368366,
-3.503049, 3.018687, -5.526901,
3.239869, 3.018687, -5.526901,
-3.503049, 3.018687, 5.368366,
3.239869, 3.018687, 5.368366,
3.239869, -3.132137, -5.526901,
3.239869, 3.018687, -5.526901,
3.239869, -3.132137, 5.368366,
3.239869, 3.018687, 5.368366,
3.239869, -3.132137, -5.526901,
3.239869, -3.132137, 5.368366,
3.239869, 3.018687, -5.526901,
3.239869, 3.018687, 5.368366
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
var radius = 7.58941;
var distance = 33.76614;
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
mvMatrix.translate( 0.13159, 0.05672503, 0.0792675 );
mvMatrix.scale( 1.216954, 1.334101, 0.7531545 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.76614);
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
mefenacet<-read.table("mefenacet.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-mefenacet$V2
```

```
## Error in eval(expr, envir, enclos): object 'mefenacet' not found
```

```r
y<-mefenacet$V3
```

```
## Error in eval(expr, envir, enclos): object 'mefenacet' not found
```

```r
z<-mefenacet$V4
```

```
## Error in eval(expr, envir, enclos): object 'mefenacet' not found
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
-3.404851, -0.4009304, 0.4691831, 0, 0, 1, 1, 1,
-3.177706, 0.0972021, -1.363402, 1, 0, 0, 1, 1,
-2.849716, -0.4003816, -2.597982, 1, 0, 0, 1, 1,
-2.834006, 0.6257917, -1.931538, 1, 0, 0, 1, 1,
-2.739772, 0.2546564, -2.604516, 1, 0, 0, 1, 1,
-2.71066, 0.1436095, -1.886404, 1, 0, 0, 1, 1,
-2.686385, -1.230899, -3.807466, 0, 0, 0, 1, 1,
-2.662492, -1.728758, -1.039976, 0, 0, 0, 1, 1,
-2.592398, 0.2889657, -1.332644, 0, 0, 0, 1, 1,
-2.565092, 0.5466366, -0.9819858, 0, 0, 0, 1, 1,
-2.453514, -1.077031, -0.2546075, 0, 0, 0, 1, 1,
-2.378057, -1.313401, -0.113489, 0, 0, 0, 1, 1,
-2.354538, 1.133155, -2.914944, 0, 0, 0, 1, 1,
-2.341297, -1.047437, -1.384272, 1, 1, 1, 1, 1,
-2.282549, -0.565409, -0.09402951, 1, 1, 1, 1, 1,
-2.277483, 0.8599583, -1.8425, 1, 1, 1, 1, 1,
-2.253463, 1.557886, -0.5215949, 1, 1, 1, 1, 1,
-2.226958, 1.235015, -1.436938, 1, 1, 1, 1, 1,
-2.177231, 0.6186585, -1.463222, 1, 1, 1, 1, 1,
-2.166635, 1.561472, -1.303401, 1, 1, 1, 1, 1,
-2.122633, 0.07526424, -1.302608, 1, 1, 1, 1, 1,
-2.045137, -0.2546593, -1.410839, 1, 1, 1, 1, 1,
-2.030071, -0.6256388, -1.570532, 1, 1, 1, 1, 1,
-2.01351, 1.535243, -1.147197, 1, 1, 1, 1, 1,
-2.009183, -0.2326424, -0.4716811, 1, 1, 1, 1, 1,
-1.989436, 0.9957125, -1.671255, 1, 1, 1, 1, 1,
-1.982471, -0.07198732, -2.884675, 1, 1, 1, 1, 1,
-1.973866, 0.1530453, -1.735088, 1, 1, 1, 1, 1,
-1.963677, 0.1175798, -2.902814, 0, 0, 1, 1, 1,
-1.953649, 0.5190905, -1.968011, 1, 0, 0, 1, 1,
-1.946084, -0.463654, -1.285017, 1, 0, 0, 1, 1,
-1.862496, -1.274623, -1.338329, 1, 0, 0, 1, 1,
-1.849977, 2.298711, -0.6394562, 1, 0, 0, 1, 1,
-1.808009, 0.04665621, -3.832525, 1, 0, 0, 1, 1,
-1.781651, -0.3494953, -2.054231, 0, 0, 0, 1, 1,
-1.760483, -1.969087, -1.883223, 0, 0, 0, 1, 1,
-1.734927, 0.3333242, -0.4245834, 0, 0, 0, 1, 1,
-1.719474, -1.680805, -1.987023, 0, 0, 0, 1, 1,
-1.710599, 1.088081, -0.8481193, 0, 0, 0, 1, 1,
-1.701866, -0.8335504, -4.253245, 0, 0, 0, 1, 1,
-1.70015, 0.7575552, -2.724776, 0, 0, 0, 1, 1,
-1.696428, 1.7002, -0.5201972, 1, 1, 1, 1, 1,
-1.692943, 1.78464, -0.9916534, 1, 1, 1, 1, 1,
-1.688517, -2.251775, -2.612046, 1, 1, 1, 1, 1,
-1.684911, 0.1753346, -1.36436, 1, 1, 1, 1, 1,
-1.683679, 0.001099416, -0.6352724, 1, 1, 1, 1, 1,
-1.677689, -0.08304638, -0.3436107, 1, 1, 1, 1, 1,
-1.674155, -0.2905528, -3.768084, 1, 1, 1, 1, 1,
-1.667867, -0.1923026, -0.9404611, 1, 1, 1, 1, 1,
-1.660813, 0.006322368, -0.8108424, 1, 1, 1, 1, 1,
-1.658683, 2.329756, -1.193659, 1, 1, 1, 1, 1,
-1.64036, -0.2983667, -2.16225, 1, 1, 1, 1, 1,
-1.632563, 0.4315789, -2.244301, 1, 1, 1, 1, 1,
-1.627376, 0.1449053, -0.8719043, 1, 1, 1, 1, 1,
-1.62303, 1.379323, -2.218782, 1, 1, 1, 1, 1,
-1.601024, 0.8032768, -1.783921, 1, 1, 1, 1, 1,
-1.60018, -1.665061, -2.071575, 0, 0, 1, 1, 1,
-1.595285, -2.072075, -1.846202, 1, 0, 0, 1, 1,
-1.592759, -0.03589189, -0.962566, 1, 0, 0, 1, 1,
-1.578437, 0.0860157, -1.235998, 1, 0, 0, 1, 1,
-1.569922, -0.9484103, -3.922021, 1, 0, 0, 1, 1,
-1.565551, -2.192513, -3.5097, 1, 0, 0, 1, 1,
-1.55978, -0.2363949, -0.6704634, 0, 0, 0, 1, 1,
-1.545409, -2.005692, -3.047028, 0, 0, 0, 1, 1,
-1.541709, 0.1361873, 0.08499944, 0, 0, 0, 1, 1,
-1.541551, 0.5587943, -0.2506475, 0, 0, 0, 1, 1,
-1.519085, 0.7937698, -1.390025, 0, 0, 0, 1, 1,
-1.504794, 0.3856218, -0.2194273, 0, 0, 0, 1, 1,
-1.504321, 0.1865224, -0.09012476, 0, 0, 0, 1, 1,
-1.489651, -0.8809556, -2.027256, 1, 1, 1, 1, 1,
-1.48628, 0.4987117, -1.852008, 1, 1, 1, 1, 1,
-1.486137, -1.344046, -1.472121, 1, 1, 1, 1, 1,
-1.465847, -1.711375, -2.05229, 1, 1, 1, 1, 1,
-1.46546, -0.4506184, -3.154413, 1, 1, 1, 1, 1,
-1.454426, 0.7315558, -0.9096476, 1, 1, 1, 1, 1,
-1.437088, 1.355754, -0.9275531, 1, 1, 1, 1, 1,
-1.432087, 1.119417, -1.036032, 1, 1, 1, 1, 1,
-1.423806, -0.3410693, -0.7186583, 1, 1, 1, 1, 1,
-1.419797, -0.9536313, -2.308379, 1, 1, 1, 1, 1,
-1.416314, -1.935274, -4.219415, 1, 1, 1, 1, 1,
-1.414921, -0.7538632, -3.361605, 1, 1, 1, 1, 1,
-1.410466, -1.027321, -3.155028, 1, 1, 1, 1, 1,
-1.409326, 2.222116, -0.02511948, 1, 1, 1, 1, 1,
-1.406728, 1.074173, -0.5472288, 1, 1, 1, 1, 1,
-1.397893, -0.9160073, -1.465117, 0, 0, 1, 1, 1,
-1.392844, -1.083674, -1.774323, 1, 0, 0, 1, 1,
-1.392303, -1.720092, -2.7041, 1, 0, 0, 1, 1,
-1.378687, 0.6996751, 0.2687324, 1, 0, 0, 1, 1,
-1.376185, -0.6624256, -3.896444, 1, 0, 0, 1, 1,
-1.368935, -0.1107263, -2.54103, 1, 0, 0, 1, 1,
-1.366609, -1.679155, -2.108628, 0, 0, 0, 1, 1,
-1.363486, -0.6040729, -2.250217, 0, 0, 0, 1, 1,
-1.361817, 0.06678957, -2.798498, 0, 0, 0, 1, 1,
-1.360944, 1.93263, 0.6334939, 0, 0, 0, 1, 1,
-1.35988, -0.8688793, -2.712095, 0, 0, 0, 1, 1,
-1.346962, 0.8359773, -0.845188, 0, 0, 0, 1, 1,
-1.346683, 0.5438597, -2.562548, 0, 0, 0, 1, 1,
-1.341969, -1.703007, -3.211349, 1, 1, 1, 1, 1,
-1.336923, -0.9916968, -3.127272, 1, 1, 1, 1, 1,
-1.33664, -0.733978, -3.252985, 1, 1, 1, 1, 1,
-1.326682, -0.362718, -1.744868, 1, 1, 1, 1, 1,
-1.304952, 0.1020627, -0.8656455, 1, 1, 1, 1, 1,
-1.304621, 0.1244828, -0.6220786, 1, 1, 1, 1, 1,
-1.296322, 0.08156952, -1.335147, 1, 1, 1, 1, 1,
-1.293569, -2.280754, -1.333444, 1, 1, 1, 1, 1,
-1.287967, -0.98319, -1.674251, 1, 1, 1, 1, 1,
-1.274405, -2.485206, -2.308258, 1, 1, 1, 1, 1,
-1.271007, -0.6515831, -2.195305, 1, 1, 1, 1, 1,
-1.262012, -0.949653, -2.957116, 1, 1, 1, 1, 1,
-1.259827, -0.6875174, -2.519904, 1, 1, 1, 1, 1,
-1.256543, 0.4413546, -0.4052703, 1, 1, 1, 1, 1,
-1.247669, 0.853416, 0.3086362, 1, 1, 1, 1, 1,
-1.247279, -0.8719595, -2.328528, 0, 0, 1, 1, 1,
-1.245712, -0.9158736, -1.469509, 1, 0, 0, 1, 1,
-1.243968, -0.2254971, -1.34186, 1, 0, 0, 1, 1,
-1.237732, 0.9580122, -1.098397, 1, 0, 0, 1, 1,
-1.235765, 1.510437, -0.8920565, 1, 0, 0, 1, 1,
-1.233763, -0.1996137, -0.620954, 1, 0, 0, 1, 1,
-1.223934, 0.9425957, -1.55141, 0, 0, 0, 1, 1,
-1.197264, 0.5285614, -0.0863252, 0, 0, 0, 1, 1,
-1.193723, 0.006554592, -0.8557714, 0, 0, 0, 1, 1,
-1.193085, -1.007933, -1.264618, 0, 0, 0, 1, 1,
-1.189714, 0.2267321, 0.2286902, 0, 0, 0, 1, 1,
-1.18305, -0.07315438, -2.648059, 0, 0, 0, 1, 1,
-1.182635, 1.314342, 1.13551, 0, 0, 0, 1, 1,
-1.175749, -0.2454447, -1.015951, 1, 1, 1, 1, 1,
-1.166085, 0.1271805, -2.568454, 1, 1, 1, 1, 1,
-1.157552, -0.1399642, -2.74052, 1, 1, 1, 1, 1,
-1.146236, 1.042897, 0.1389972, 1, 1, 1, 1, 1,
-1.144377, -1.03128, -2.77125, 1, 1, 1, 1, 1,
-1.141737, -1.207636, -1.764795, 1, 1, 1, 1, 1,
-1.125927, -0.1558666, -1.44375, 1, 1, 1, 1, 1,
-1.124021, 1.098507, 1.297877, 1, 1, 1, 1, 1,
-1.123306, 1.165366, -0.8594849, 1, 1, 1, 1, 1,
-1.119888, -0.8977729, -1.386657, 1, 1, 1, 1, 1,
-1.106539, -1.024388, -1.305403, 1, 1, 1, 1, 1,
-1.106292, -0.4111884, -2.501584, 1, 1, 1, 1, 1,
-1.105487, -0.6345414, -2.373351, 1, 1, 1, 1, 1,
-1.102731, -0.03459446, -1.386204, 1, 1, 1, 1, 1,
-1.094175, -0.2619938, -1.659981, 1, 1, 1, 1, 1,
-1.093806, -0.4562529, -1.094653, 0, 0, 1, 1, 1,
-1.093675, 1.043292, 1.491506, 1, 0, 0, 1, 1,
-1.089646, 1.160401, -0.4371611, 1, 0, 0, 1, 1,
-1.089101, 0.9200588, -0.8848631, 1, 0, 0, 1, 1,
-1.083899, 1.165603, 0.7625625, 1, 0, 0, 1, 1,
-1.082736, -1.338801, -3.04602, 1, 0, 0, 1, 1,
-1.068067, -2.02607, -2.854057, 0, 0, 0, 1, 1,
-1.06413, 0.6459777, -0.08761484, 0, 0, 0, 1, 1,
-1.063716, 2.158919, -1.448514, 0, 0, 0, 1, 1,
-1.052049, -1.155973, -2.256549, 0, 0, 0, 1, 1,
-1.047835, 2.297983, -2.984262, 0, 0, 0, 1, 1,
-1.045806, -0.377584, 0.1896255, 0, 0, 0, 1, 1,
-1.040856, -1.87592, -3.208956, 0, 0, 0, 1, 1,
-1.032998, 0.529417, -1.261426, 1, 1, 1, 1, 1,
-1.032153, -0.09464255, -1.145434, 1, 1, 1, 1, 1,
-1.030231, -0.8543248, -0.7286317, 1, 1, 1, 1, 1,
-1.026094, 0.5965648, -0.2432563, 1, 1, 1, 1, 1,
-1.022047, -0.5597421, -1.980558, 1, 1, 1, 1, 1,
-1.021089, 1.065516, -0.431134, 1, 1, 1, 1, 1,
-1.020054, -0.6984786, -1.268577, 1, 1, 1, 1, 1,
-0.9948335, -1.564844, -3.496189, 1, 1, 1, 1, 1,
-0.9907589, 0.1624582, -1.065851, 1, 1, 1, 1, 1,
-0.9889714, 0.01063609, -1.857247, 1, 1, 1, 1, 1,
-0.9866014, 0.2358773, 0.2172239, 1, 1, 1, 1, 1,
-0.9862708, 1.74503, 0.07731856, 1, 1, 1, 1, 1,
-0.9824491, -0.540866, -1.755727, 1, 1, 1, 1, 1,
-0.9802142, 1.573901, -0.7129353, 1, 1, 1, 1, 1,
-0.9745793, 1.29823, 0.9886143, 1, 1, 1, 1, 1,
-0.973748, -0.1718848, -1.888753, 0, 0, 1, 1, 1,
-0.9736663, -1.234726, -2.40505, 1, 0, 0, 1, 1,
-0.9689787, -0.2235415, -0.6185123, 1, 0, 0, 1, 1,
-0.968049, 0.2056708, -0.2900151, 1, 0, 0, 1, 1,
-0.9668388, -0.6555448, -0.8462988, 1, 0, 0, 1, 1,
-0.958028, -0.4263405, -2.14414, 1, 0, 0, 1, 1,
-0.957443, -1.275959, -1.738426, 0, 0, 0, 1, 1,
-0.9565687, 0.09393643, -2.145186, 0, 0, 0, 1, 1,
-0.9565296, -0.4063765, -4.225152, 0, 0, 0, 1, 1,
-0.9546087, 0.06593507, -1.485827, 0, 0, 0, 1, 1,
-0.954243, -0.4375751, -1.289652, 0, 0, 0, 1, 1,
-0.9462324, -1.204042, -1.408455, 0, 0, 0, 1, 1,
-0.9392251, -1.451988, -1.388667, 0, 0, 0, 1, 1,
-0.9341145, -0.1462224, -1.110593, 1, 1, 1, 1, 1,
-0.9315007, -0.05751057, -2.006943, 1, 1, 1, 1, 1,
-0.9312628, 0.8529587, -0.3572878, 1, 1, 1, 1, 1,
-0.9283946, 0.3316181, -1.020496, 1, 1, 1, 1, 1,
-0.9268516, 0.2607006, -2.947451, 1, 1, 1, 1, 1,
-0.9259249, -1.795196, -2.399671, 1, 1, 1, 1, 1,
-0.9229561, 0.1720399, -1.87765, 1, 1, 1, 1, 1,
-0.9223673, 0.7442151, -1.630528, 1, 1, 1, 1, 1,
-0.9208343, -0.1543721, -4.088759, 1, 1, 1, 1, 1,
-0.919188, -1.505907, -1.928899, 1, 1, 1, 1, 1,
-0.9186927, -1.951712, -3.01405, 1, 1, 1, 1, 1,
-0.8950514, 0.1932304, -1.466034, 1, 1, 1, 1, 1,
-0.8933375, -0.3360678, -1.278643, 1, 1, 1, 1, 1,
-0.8862379, -0.7976182, -4.12558, 1, 1, 1, 1, 1,
-0.8840336, 0.07038395, -1.44244, 1, 1, 1, 1, 1,
-0.8702415, -0.3272045, -1.956247, 0, 0, 1, 1, 1,
-0.865759, -0.1907291, -3.210564, 1, 0, 0, 1, 1,
-0.8623808, 0.7974828, 1.725523, 1, 0, 0, 1, 1,
-0.8601415, 0.5815856, -1.237319, 1, 0, 0, 1, 1,
-0.8575982, -0.01208437, -2.754764, 1, 0, 0, 1, 1,
-0.8554064, -1.31647, -3.308538, 1, 0, 0, 1, 1,
-0.8536462, -0.2812395, -1.508261, 0, 0, 0, 1, 1,
-0.8534335, 1.690568, -1.482333, 0, 0, 0, 1, 1,
-0.8522838, 0.8512526, 1.045635, 0, 0, 0, 1, 1,
-0.842651, -0.1199357, -0.5153856, 0, 0, 0, 1, 1,
-0.8416247, -0.225318, -3.031723, 0, 0, 0, 1, 1,
-0.8348983, 0.5321662, -2.981866, 0, 0, 0, 1, 1,
-0.8325436, -0.2362582, -1.633918, 0, 0, 0, 1, 1,
-0.8322283, -0.7382479, -3.603324, 1, 1, 1, 1, 1,
-0.8298087, -2.282422, -3.733185, 1, 1, 1, 1, 1,
-0.8265305, -1.550911, -1.550167, 1, 1, 1, 1, 1,
-0.8207214, 0.3495303, -1.230109, 1, 1, 1, 1, 1,
-0.8142334, -1.770189, -3.547661, 1, 1, 1, 1, 1,
-0.8067867, -0.8857676, -5.093976, 1, 1, 1, 1, 1,
-0.797749, 1.556947, -0.3220676, 1, 1, 1, 1, 1,
-0.7953064, -0.2145775, -1.524071, 1, 1, 1, 1, 1,
-0.7937131, 0.09480464, -0.4584374, 1, 1, 1, 1, 1,
-0.7906731, 1.27082, 0.9163894, 1, 1, 1, 1, 1,
-0.7810297, -0.3671567, -1.38336, 1, 1, 1, 1, 1,
-0.7786986, -1.440389, -2.886013, 1, 1, 1, 1, 1,
-0.7780337, 0.8171335, 0.7605895, 1, 1, 1, 1, 1,
-0.7711761, -0.650187, -1.803042, 1, 1, 1, 1, 1,
-0.7696581, 0.9672186, -0.4714674, 1, 1, 1, 1, 1,
-0.7691214, 0.9723515, 0.04723161, 0, 0, 1, 1, 1,
-0.7686905, 0.3289143, -1.679613, 1, 0, 0, 1, 1,
-0.7640677, -0.1046881, -3.217002, 1, 0, 0, 1, 1,
-0.7611786, -0.03342744, -0.8393659, 1, 0, 0, 1, 1,
-0.7591518, 0.7145813, -1.419896, 1, 0, 0, 1, 1,
-0.7566922, -0.4821003, -2.177436, 1, 0, 0, 1, 1,
-0.7498079, 1.217966, -0.3151495, 0, 0, 0, 1, 1,
-0.7493948, -0.6350098, -3.416682, 0, 0, 0, 1, 1,
-0.7474302, 0.8905529, -0.8940895, 0, 0, 0, 1, 1,
-0.747304, 0.07513268, -2.884074, 0, 0, 0, 1, 1,
-0.7409921, 0.4227338, -0.9168459, 0, 0, 0, 1, 1,
-0.7401116, -0.7881688, -1.741348, 0, 0, 0, 1, 1,
-0.7392451, -0.8799517, -2.041933, 0, 0, 0, 1, 1,
-0.7371243, -0.1337933, -1.976909, 1, 1, 1, 1, 1,
-0.7342376, 0.001665359, -1.047724, 1, 1, 1, 1, 1,
-0.7334617, 0.3872675, -1.177825, 1, 1, 1, 1, 1,
-0.7331851, 0.4135623, -1.144048, 1, 1, 1, 1, 1,
-0.7325622, -0.136067, -0.6717947, 1, 1, 1, 1, 1,
-0.7225659, -0.102666, -2.150421, 1, 1, 1, 1, 1,
-0.7205172, 0.9857801, -0.3930103, 1, 1, 1, 1, 1,
-0.7147827, 0.2430878, -1.402856, 1, 1, 1, 1, 1,
-0.7127749, -0.1273945, -2.111659, 1, 1, 1, 1, 1,
-0.7124513, 0.07124048, -2.430262, 1, 1, 1, 1, 1,
-0.6917689, -0.4203061, -2.599919, 1, 1, 1, 1, 1,
-0.6871526, 0.2211886, -0.4106998, 1, 1, 1, 1, 1,
-0.6838305, -0.01075802, -2.42433, 1, 1, 1, 1, 1,
-0.6831565, 0.4510578, -0.6147572, 1, 1, 1, 1, 1,
-0.6820005, 0.6678671, -0.4820445, 1, 1, 1, 1, 1,
-0.6707876, -0.8443998, -1.479704, 0, 0, 1, 1, 1,
-0.668911, -0.8081276, -3.191134, 1, 0, 0, 1, 1,
-0.6688554, -1.535388, -1.758209, 1, 0, 0, 1, 1,
-0.6639252, 1.096117, -1.916473, 1, 0, 0, 1, 1,
-0.6556664, 1.346905, -0.2383174, 1, 0, 0, 1, 1,
-0.6463891, 1.905198, -1.394058, 1, 0, 0, 1, 1,
-0.6460508, 1.535094, -0.6896272, 0, 0, 0, 1, 1,
-0.6433437, 0.08734662, -0.5757473, 0, 0, 0, 1, 1,
-0.6400383, -0.5824904, -1.570574, 0, 0, 0, 1, 1,
-0.626057, -1.14723, -2.756463, 0, 0, 0, 1, 1,
-0.6255875, -0.005333633, -1.470215, 0, 0, 0, 1, 1,
-0.6230969, 0.01381947, -0.3086994, 0, 0, 0, 1, 1,
-0.6223189, -0.6745454, -2.1464, 0, 0, 0, 1, 1,
-0.619963, -1.062902, -2.291856, 1, 1, 1, 1, 1,
-0.6193322, -1.494313, -1.758196, 1, 1, 1, 1, 1,
-0.612736, -1.225077, -2.040443, 1, 1, 1, 1, 1,
-0.6124101, 0.3670378, -2.30853, 1, 1, 1, 1, 1,
-0.6038756, -0.5502941, -2.134174, 1, 1, 1, 1, 1,
-0.6000804, 0.5420713, -0.2734656, 1, 1, 1, 1, 1,
-0.599207, -1.978763, -3.630219, 1, 1, 1, 1, 1,
-0.5973545, 1.244952, -2.069126, 1, 1, 1, 1, 1,
-0.5956462, -1.679795, -2.142916, 1, 1, 1, 1, 1,
-0.5939389, -1.646211, -1.253863, 1, 1, 1, 1, 1,
-0.5914025, 2.211225, -1.848512, 1, 1, 1, 1, 1,
-0.5889974, 2.009884, -1.881866, 1, 1, 1, 1, 1,
-0.5886433, -0.5822865, -2.723914, 1, 1, 1, 1, 1,
-0.583854, -0.2571552, -2.397752, 1, 1, 1, 1, 1,
-0.5782661, 1.315894, -1.553063, 1, 1, 1, 1, 1,
-0.5736896, 1.970005, 1.306177, 0, 0, 1, 1, 1,
-0.5732383, 0.2183427, -1.585787, 1, 0, 0, 1, 1,
-0.5650728, 0.7216188, -0.9424009, 1, 0, 0, 1, 1,
-0.5623156, 0.1525951, -1.705983, 1, 0, 0, 1, 1,
-0.5539707, -1.17908, -2.766833, 1, 0, 0, 1, 1,
-0.5520391, -0.73469, -1.806939, 1, 0, 0, 1, 1,
-0.5496095, 2.122993, -0.2506692, 0, 0, 0, 1, 1,
-0.5482731, 1.200354, -1.017772, 0, 0, 0, 1, 1,
-0.5480344, 1.065991, -0.2648667, 0, 0, 0, 1, 1,
-0.5425794, -0.1565285, -1.88798, 0, 0, 0, 1, 1,
-0.5363794, -0.6789563, -3.505644, 0, 0, 0, 1, 1,
-0.5352141, -0.9279312, -2.790981, 0, 0, 0, 1, 1,
-0.5189735, 1.648358, -0.1792088, 0, 0, 0, 1, 1,
-0.5187181, -0.6548371, -1.296469, 1, 1, 1, 1, 1,
-0.5131029, -1.509888, -3.438661, 1, 1, 1, 1, 1,
-0.5121075, 0.1957257, -3.495615, 1, 1, 1, 1, 1,
-0.5031131, -0.05613148, -3.329256, 1, 1, 1, 1, 1,
-0.4965821, 1.100594, -0.9737855, 1, 1, 1, 1, 1,
-0.493716, 0.7187572, 0.722017, 1, 1, 1, 1, 1,
-0.4882098, 0.5184199, -1.087361, 1, 1, 1, 1, 1,
-0.4855311, 1.303869, -0.6914191, 1, 1, 1, 1, 1,
-0.4849878, -1.9177, 0.2220873, 1, 1, 1, 1, 1,
-0.4709927, 0.1148858, 0.1434164, 1, 1, 1, 1, 1,
-0.4704355, -0.9922785, -1.451759, 1, 1, 1, 1, 1,
-0.4702139, 0.241942, -1.944538, 1, 1, 1, 1, 1,
-0.4698982, 0.05999841, -2.091787, 1, 1, 1, 1, 1,
-0.4654717, 0.3703488, 0.1576233, 1, 1, 1, 1, 1,
-0.4644718, -0.6334676, -1.400089, 1, 1, 1, 1, 1,
-0.463297, -1.354275, -2.987667, 0, 0, 1, 1, 1,
-0.4626213, 0.6198824, 0.001838244, 1, 0, 0, 1, 1,
-0.4603044, 0.3117631, -1.708402, 1, 0, 0, 1, 1,
-0.4560423, -0.2423775, -2.336904, 1, 0, 0, 1, 1,
-0.4489449, -0.5807348, -1.830078, 1, 0, 0, 1, 1,
-0.4477371, -0.6217654, -1.059103, 1, 0, 0, 1, 1,
-0.4469132, -1.364218, -1.860263, 0, 0, 0, 1, 1,
-0.4456362, -0.6725221, -2.796232, 0, 0, 0, 1, 1,
-0.4399622, 0.551134, -1.313655, 0, 0, 0, 1, 1,
-0.4393899, -1.348639, -2.036402, 0, 0, 0, 1, 1,
-0.4391586, 0.227668, -3.431827, 0, 0, 0, 1, 1,
-0.4384552, 0.5126957, -1.326535, 0, 0, 0, 1, 1,
-0.4354882, 0.616392, -1.238196, 0, 0, 0, 1, 1,
-0.4324826, -0.05121398, -3.271771, 1, 1, 1, 1, 1,
-0.4291312, 0.7666994, 0.4690073, 1, 1, 1, 1, 1,
-0.4277731, -0.7115567, -3.222358, 1, 1, 1, 1, 1,
-0.4271757, 1.365702, -0.2233284, 1, 1, 1, 1, 1,
-0.4192083, 0.9269374, -1.186199, 1, 1, 1, 1, 1,
-0.4192035, -0.112129, -2.386814, 1, 1, 1, 1, 1,
-0.4177957, 0.6473168, 0.4599631, 1, 1, 1, 1, 1,
-0.4156578, -1.493597, -3.178769, 1, 1, 1, 1, 1,
-0.4118717, -0.9308252, -1.158672, 1, 1, 1, 1, 1,
-0.4104289, 0.3020499, -1.244616, 1, 1, 1, 1, 1,
-0.4007323, 0.02826664, -0.84621, 1, 1, 1, 1, 1,
-0.4005758, 1.044847, -0.3440491, 1, 1, 1, 1, 1,
-0.3998994, 0.5566869, -1.544622, 1, 1, 1, 1, 1,
-0.3989672, -0.4180326, -3.032203, 1, 1, 1, 1, 1,
-0.3851314, 1.303182, 0.8547102, 1, 1, 1, 1, 1,
-0.3830872, -0.1882134, -0.9066803, 0, 0, 1, 1, 1,
-0.3805521, 1.807308, -0.2576073, 1, 0, 0, 1, 1,
-0.3771274, 0.1431174, -2.039037, 1, 0, 0, 1, 1,
-0.3763696, 0.07400266, -2.351112, 1, 0, 0, 1, 1,
-0.3763669, 2.155126, 0.1987365, 1, 0, 0, 1, 1,
-0.3752307, 0.4773511, -0.6856657, 1, 0, 0, 1, 1,
-0.3720934, -0.6259706, -0.6903704, 0, 0, 0, 1, 1,
-0.370981, 0.4219351, -2.742339, 0, 0, 0, 1, 1,
-0.3704692, 0.3816565, -1.910127, 0, 0, 0, 1, 1,
-0.3638606, -0.5791711, -0.7612696, 0, 0, 0, 1, 1,
-0.3577662, 1.205561, 1.573434, 0, 0, 0, 1, 1,
-0.3571694, 2.929112, -2.053185, 0, 0, 0, 1, 1,
-0.3565896, -0.8312528, -2.755322, 0, 0, 0, 1, 1,
-0.3522199, -0.3029855, -1.811491, 1, 1, 1, 1, 1,
-0.3507729, -2.00293, -3.703451, 1, 1, 1, 1, 1,
-0.3450886, -0.8945981, -4.362858, 1, 1, 1, 1, 1,
-0.3447312, 0.9234942, -1.575793, 1, 1, 1, 1, 1,
-0.3427688, -1.166306, -3.763065, 1, 1, 1, 1, 1,
-0.3413329, -0.6369633, -0.1104059, 1, 1, 1, 1, 1,
-0.3397541, 0.4466385, 0.1246406, 1, 1, 1, 1, 1,
-0.3380376, -2.031751, -2.863913, 1, 1, 1, 1, 1,
-0.3349712, -0.2033986, -1.552924, 1, 1, 1, 1, 1,
-0.3344679, -0.6128094, -4.647103, 1, 1, 1, 1, 1,
-0.3334932, -1.193048, -5.368232, 1, 1, 1, 1, 1,
-0.3323911, 0.09952869, -1.698142, 1, 1, 1, 1, 1,
-0.3304142, -1.36983, -2.964795, 1, 1, 1, 1, 1,
-0.3293898, 0.8023359, -1.888217, 1, 1, 1, 1, 1,
-0.3252494, 0.06273282, -2.420218, 1, 1, 1, 1, 1,
-0.3251762, 0.005216901, -0.3079378, 0, 0, 1, 1, 1,
-0.3248568, -1.91402, -2.492361, 1, 0, 0, 1, 1,
-0.3247671, -0.1003142, -2.271105, 1, 0, 0, 1, 1,
-0.3240469, -1.854877, -2.337347, 1, 0, 0, 1, 1,
-0.3235205, 0.2190483, -1.507879, 1, 0, 0, 1, 1,
-0.3228405, -0.8751407, -0.4348764, 1, 0, 0, 1, 1,
-0.3198012, -0.9699678, -3.411854, 0, 0, 0, 1, 1,
-0.3170902, 0.4639474, 1.453479, 0, 0, 0, 1, 1,
-0.3153643, 1.542286, -1.359748, 0, 0, 0, 1, 1,
-0.3152697, 1.376734, 0.3045105, 0, 0, 0, 1, 1,
-0.3100111, -0.03977859, -4.548886, 0, 0, 0, 1, 1,
-0.3066653, 1.203566, -0.7412399, 0, 0, 0, 1, 1,
-0.3060175, 0.09859156, -1.050505, 0, 0, 0, 1, 1,
-0.3042198, -1.266713, -2.000852, 1, 1, 1, 1, 1,
-0.3004526, 0.5242007, -1.229717, 1, 1, 1, 1, 1,
-0.2943715, 0.1429218, -3.10259, 1, 1, 1, 1, 1,
-0.2942684, 0.2350566, -1.36682, 1, 1, 1, 1, 1,
-0.2937049, 0.06559425, -1.377411, 1, 1, 1, 1, 1,
-0.2887944, 2.12642, -0.2171081, 1, 1, 1, 1, 1,
-0.2881035, 0.850344, -0.5530553, 1, 1, 1, 1, 1,
-0.2864285, 0.6800144, 1.358033, 1, 1, 1, 1, 1,
-0.2850553, 0.08915868, -1.251487, 1, 1, 1, 1, 1,
-0.2843433, 0.5549226, -0.137895, 1, 1, 1, 1, 1,
-0.283734, 1.2761, 0.674812, 1, 1, 1, 1, 1,
-0.280277, -0.2290597, -2.292406, 1, 1, 1, 1, 1,
-0.2788608, 0.3318653, 0.6267303, 1, 1, 1, 1, 1,
-0.2747037, -0.2668223, -2.844909, 1, 1, 1, 1, 1,
-0.2746794, -0.5305896, -0.4562994, 1, 1, 1, 1, 1,
-0.2730618, 0.9792858, 0.1038348, 0, 0, 1, 1, 1,
-0.2718398, -0.6569215, -2.599333, 1, 0, 0, 1, 1,
-0.2643605, -2.408355, -2.81552, 1, 0, 0, 1, 1,
-0.2611595, 0.8957522, -1.051111, 1, 0, 0, 1, 1,
-0.2582839, -0.6498856, -2.494151, 1, 0, 0, 1, 1,
-0.2551418, 2.193319, 0.3957645, 1, 0, 0, 1, 1,
-0.2542886, 0.265456, -0.4787283, 0, 0, 0, 1, 1,
-0.2452504, -0.2855869, -3.037383, 0, 0, 0, 1, 1,
-0.2442564, 0.8768891, -0.04280573, 0, 0, 0, 1, 1,
-0.2381729, 0.1937099, 1.144276, 0, 0, 0, 1, 1,
-0.2380662, -0.4006819, -4.263357, 0, 0, 0, 1, 1,
-0.2345441, -0.7838763, -4.390897, 0, 0, 0, 1, 1,
-0.2291773, 0.2619703, -1.599996, 0, 0, 0, 1, 1,
-0.2243557, 0.5909964, -0.2618462, 1, 1, 1, 1, 1,
-0.2239706, 0.8774437, 0.08298676, 1, 1, 1, 1, 1,
-0.2227231, -0.1765931, -3.09841, 1, 1, 1, 1, 1,
-0.2200387, 0.9043405, -0.9696273, 1, 1, 1, 1, 1,
-0.2166199, -0.6086839, -3.366392, 1, 1, 1, 1, 1,
-0.2134225, 0.1528678, -3.047876, 1, 1, 1, 1, 1,
-0.2125968, 1.213324, -0.1693281, 1, 1, 1, 1, 1,
-0.2047468, -1.030625, -4.250306, 1, 1, 1, 1, 1,
-0.202598, 0.3533742, -1.689279, 1, 1, 1, 1, 1,
-0.1907392, 1.017873, 0.2864144, 1, 1, 1, 1, 1,
-0.1881619, -0.8010212, -0.78931, 1, 1, 1, 1, 1,
-0.1862436, -0.8090668, -2.805831, 1, 1, 1, 1, 1,
-0.1835752, 0.4041401, -0.3547896, 1, 1, 1, 1, 1,
-0.1830856, -0.2743382, -3.836042, 1, 1, 1, 1, 1,
-0.1827876, -0.9790679, -3.066712, 1, 1, 1, 1, 1,
-0.1827201, 0.8882367, 1.443699, 0, 0, 1, 1, 1,
-0.1795696, -0.5786229, -4.784054, 1, 0, 0, 1, 1,
-0.1791763, 0.709685, -1.190111, 1, 0, 0, 1, 1,
-0.1779413, 0.5017129, -1.050573, 1, 0, 0, 1, 1,
-0.1778907, 0.4601094, 0.9348344, 1, 0, 0, 1, 1,
-0.168844, 0.1584006, -1.5657, 1, 0, 0, 1, 1,
-0.1681279, -1.190915, -4.244, 0, 0, 0, 1, 1,
-0.1667885, 0.9711854, 0.3213552, 0, 0, 0, 1, 1,
-0.1658668, -1.025511, -2.760614, 0, 0, 0, 1, 1,
-0.1632169, 1.027999, 0.6386378, 0, 0, 0, 1, 1,
-0.1627292, 1.183065, -0.04290097, 0, 0, 0, 1, 1,
-0.1622604, 0.1759373, -0.107387, 0, 0, 0, 1, 1,
-0.1621382, -1.897603, -2.849474, 0, 0, 0, 1, 1,
-0.1619126, -0.05515582, -0.7798339, 1, 1, 1, 1, 1,
-0.1605578, 0.1145111, -0.6524354, 1, 1, 1, 1, 1,
-0.1568605, 0.03394426, -1.903787, 1, 1, 1, 1, 1,
-0.1568401, 2.698511, 1.983567, 1, 1, 1, 1, 1,
-0.1559194, -1.337667, -2.043431, 1, 1, 1, 1, 1,
-0.1553286, 0.3615809, 2.356247, 1, 1, 1, 1, 1,
-0.1486755, 0.6163138, -2.171221, 1, 1, 1, 1, 1,
-0.1453976, 0.08165916, -2.335878, 1, 1, 1, 1, 1,
-0.1344482, -1.103621, -1.554415, 1, 1, 1, 1, 1,
-0.1317508, -0.3634844, -3.749416, 1, 1, 1, 1, 1,
-0.128731, -0.2902771, -2.692388, 1, 1, 1, 1, 1,
-0.1240739, -2.195252, -2.260209, 1, 1, 1, 1, 1,
-0.1223547, -0.4746847, -4.652503, 1, 1, 1, 1, 1,
-0.1203631, -1.716376, -3.277311, 1, 1, 1, 1, 1,
-0.1172555, 0.1126382, 1.225033, 1, 1, 1, 1, 1,
-0.1171266, 0.7193816, 0.2077482, 0, 0, 1, 1, 1,
-0.1112041, -0.1451029, -4.307618, 1, 0, 0, 1, 1,
-0.108351, 1.086195, -0.8328294, 1, 0, 0, 1, 1,
-0.09967922, 2.826761, -0.1679966, 1, 0, 0, 1, 1,
-0.09962226, -1.103884, -1.058519, 1, 0, 0, 1, 1,
-0.09880113, 0.8572402, 1.091877, 1, 0, 0, 1, 1,
-0.098782, 0.7566285, -0.1226408, 0, 0, 0, 1, 1,
-0.09522281, 1.367248, 0.1192354, 0, 0, 0, 1, 1,
-0.09515965, 0.06582095, -1.134904, 0, 0, 0, 1, 1,
-0.09373281, -0.3161834, -2.379295, 0, 0, 0, 1, 1,
-0.08604759, 1.831684, 0.1032438, 0, 0, 0, 1, 1,
-0.08533578, 0.6541119, 1.058785, 0, 0, 0, 1, 1,
-0.08138282, -1.341041, -4.295256, 0, 0, 0, 1, 1,
-0.08027536, -1.301372, -2.320268, 1, 1, 1, 1, 1,
-0.07974101, -0.4647366, -4.601227, 1, 1, 1, 1, 1,
-0.07763123, -0.03846222, -2.514915, 1, 1, 1, 1, 1,
-0.07509384, -0.3048058, -4.044402, 1, 1, 1, 1, 1,
-0.07475904, -0.6561652, -3.116256, 1, 1, 1, 1, 1,
-0.06658885, 1.288424, 1.218516, 1, 1, 1, 1, 1,
-0.06597908, -1.124065, -2.019554, 1, 1, 1, 1, 1,
-0.06449924, 0.0640284, -0.870827, 1, 1, 1, 1, 1,
-0.06178361, 0.6866293, -0.3063274, 1, 1, 1, 1, 1,
-0.06135746, 1.155829, 0.2107331, 1, 1, 1, 1, 1,
-0.05898692, 1.390558, -0.8273134, 1, 1, 1, 1, 1,
-0.05648598, 0.9465649, 1.198427, 1, 1, 1, 1, 1,
-0.04756478, -0.02161909, -1.944936, 1, 1, 1, 1, 1,
-0.04469779, -0.6559047, -1.505129, 1, 1, 1, 1, 1,
-0.04281876, 2.281779, 1.016072, 1, 1, 1, 1, 1,
-0.04239679, 0.7333509, -1.365623, 0, 0, 1, 1, 1,
-0.04197975, -0.6778876, -1.671847, 1, 0, 0, 1, 1,
-0.041049, 1.254095, 1.208645, 1, 0, 0, 1, 1,
-0.03913594, 0.3330237, -0.6465211, 1, 0, 0, 1, 1,
-0.03716495, 0.3540837, 0.3451628, 1, 0, 0, 1, 1,
-0.02261721, 0.06751078, 0.5078326, 1, 0, 0, 1, 1,
-0.01009069, 0.2024944, 1.070054, 0, 0, 0, 1, 1,
-0.008065269, -1.804763, -2.007769, 0, 0, 0, 1, 1,
-0.003815261, 0.2073387, 1.520442, 0, 0, 0, 1, 1,
0.004623386, 0.01237074, -2.840495, 0, 0, 0, 1, 1,
0.01030318, 0.9234832, -0.3194745, 0, 0, 0, 1, 1,
0.01081307, 0.3219362, 0.4020305, 0, 0, 0, 1, 1,
0.01231974, 0.03525216, -0.2813933, 0, 0, 0, 1, 1,
0.01472876, -2.149327, 3.579367, 1, 1, 1, 1, 1,
0.01615915, -1.284333, 2.827209, 1, 1, 1, 1, 1,
0.01836212, 1.82367, 1.004241, 1, 1, 1, 1, 1,
0.01880904, 1.044578, 0.6605008, 1, 1, 1, 1, 1,
0.01941518, 0.2242719, -0.3766129, 1, 1, 1, 1, 1,
0.02180611, -0.397259, 2.234469, 1, 1, 1, 1, 1,
0.02760038, 2.796125, -0.8007215, 1, 1, 1, 1, 1,
0.03248011, -0.1897583, 2.796443, 1, 1, 1, 1, 1,
0.03421421, -0.08571432, 2.298402, 1, 1, 1, 1, 1,
0.03538201, -1.105198, 2.91223, 1, 1, 1, 1, 1,
0.0354958, -0.2784938, 2.609813, 1, 1, 1, 1, 1,
0.03556893, 0.02947599, -0.9109917, 1, 1, 1, 1, 1,
0.04255584, -0.9757394, 4.140843, 1, 1, 1, 1, 1,
0.04373754, -0.1191768, 2.92995, 1, 1, 1, 1, 1,
0.04446528, 1.962978, 0.9336529, 1, 1, 1, 1, 1,
0.04535363, 0.7114029, -1.51658, 0, 0, 1, 1, 1,
0.05080527, -0.08870747, 3.122314, 1, 0, 0, 1, 1,
0.05737467, 1.086292, 1.185516, 1, 0, 0, 1, 1,
0.06382561, -0.4657764, 2.66035, 1, 0, 0, 1, 1,
0.06424265, 1.940557, -0.1793149, 1, 0, 0, 1, 1,
0.06537452, -0.3004256, 3.427261, 1, 0, 0, 1, 1,
0.0657319, -0.1666221, 3.879206, 0, 0, 0, 1, 1,
0.0661267, -0.6811104, 3.469837, 0, 0, 0, 1, 1,
0.07066731, 0.1968052, 0.5083798, 0, 0, 0, 1, 1,
0.07749875, 0.1598594, 1.17877, 0, 0, 0, 1, 1,
0.07895576, 2.050792, 0.1889955, 0, 0, 0, 1, 1,
0.08174077, 0.3471196, -0.3455094, 0, 0, 0, 1, 1,
0.08336717, -1.425107, 3.358535, 0, 0, 0, 1, 1,
0.08463117, -1.151858, 4.194429, 1, 1, 1, 1, 1,
0.08494849, 0.9583505, -0.7048334, 1, 1, 1, 1, 1,
0.0858295, 0.2929036, 1.623703, 1, 1, 1, 1, 1,
0.08829514, 0.7508812, 2.360013, 1, 1, 1, 1, 1,
0.09790935, -0.4815464, 2.994192, 1, 1, 1, 1, 1,
0.09860157, -0.8714982, 2.732297, 1, 1, 1, 1, 1,
0.09862059, 1.608803, 1.001101, 1, 1, 1, 1, 1,
0.100336, -1.282897, 4.413716, 1, 1, 1, 1, 1,
0.1004474, 0.7826474, 0.3553424, 1, 1, 1, 1, 1,
0.1013981, 0.7585492, -0.5469306, 1, 1, 1, 1, 1,
0.1040634, -0.3039522, 1.01943, 1, 1, 1, 1, 1,
0.1040892, -0.1474363, 3.872046, 1, 1, 1, 1, 1,
0.1061803, 2.855474, -1.352004, 1, 1, 1, 1, 1,
0.1085178, -0.8534381, 4.317822, 1, 1, 1, 1, 1,
0.1109104, -0.1185412, 3.166903, 1, 1, 1, 1, 1,
0.1119613, 1.422897, 1.940799, 0, 0, 1, 1, 1,
0.1132803, 0.6041821, -0.9439105, 1, 0, 0, 1, 1,
0.1189135, -0.6930349, 1.292299, 1, 0, 0, 1, 1,
0.1267943, -0.3092454, 3.260943, 1, 0, 0, 1, 1,
0.1297368, -1.976415, 2.160539, 1, 0, 0, 1, 1,
0.1307007, 0.2905053, 0.02688661, 1, 0, 0, 1, 1,
0.1319274, -0.386755, 1.317365, 0, 0, 0, 1, 1,
0.138603, -0.6411943, 1.931095, 0, 0, 0, 1, 1,
0.1397047, -0.06666229, 3.236285, 0, 0, 0, 1, 1,
0.1407609, -0.5442067, 1.850818, 0, 0, 0, 1, 1,
0.1455552, 0.9690082, 0.5735472, 0, 0, 0, 1, 1,
0.1464401, 0.8646808, -0.5345959, 0, 0, 0, 1, 1,
0.1485095, 0.7678647, 0.5321314, 0, 0, 0, 1, 1,
0.149303, -1.041712, 4.965725, 1, 1, 1, 1, 1,
0.150773, -1.179816, 1.842379, 1, 1, 1, 1, 1,
0.1514972, 2.609201, 0.5424654, 1, 1, 1, 1, 1,
0.1522742, 0.5196974, 1.62396, 1, 1, 1, 1, 1,
0.1537831, 0.3162926, -1.640635, 1, 1, 1, 1, 1,
0.1553868, 0.2972464, -0.05944602, 1, 1, 1, 1, 1,
0.1603654, 1.517846, 0.5192274, 1, 1, 1, 1, 1,
0.1627062, 0.4083246, 0.9705181, 1, 1, 1, 1, 1,
0.1701154, -0.1018459, 3.96594, 1, 1, 1, 1, 1,
0.1768583, -0.0640802, 0.9912156, 1, 1, 1, 1, 1,
0.1785302, -0.8390657, 1.493685, 1, 1, 1, 1, 1,
0.1786903, -1.10708, 3.284432, 1, 1, 1, 1, 1,
0.179831, 1.575287, -1.250652, 1, 1, 1, 1, 1,
0.1822439, -0.6502354, 3.087216, 1, 1, 1, 1, 1,
0.1894733, 1.897324, 1.640309, 1, 1, 1, 1, 1,
0.1903054, 0.7318979, 1.250394, 0, 0, 1, 1, 1,
0.1981365, 0.3546284, 0.8081799, 1, 0, 0, 1, 1,
0.1984469, 0.01628372, 1.490375, 1, 0, 0, 1, 1,
0.2015979, -0.2957635, 2.374406, 1, 0, 0, 1, 1,
0.2019515, -0.08187102, 1.868032, 1, 0, 0, 1, 1,
0.202395, -1.24012, 2.86069, 1, 0, 0, 1, 1,
0.2035506, -1.214827, 3.768217, 0, 0, 0, 1, 1,
0.2065168, 0.7103945, 0.6748338, 0, 0, 0, 1, 1,
0.2083407, -0.5793786, 2.498338, 0, 0, 0, 1, 1,
0.2101036, -0.4226498, 1.758193, 0, 0, 0, 1, 1,
0.2115536, -1.805344, 4.25468, 0, 0, 0, 1, 1,
0.2134577, -0.9235592, 5.209697, 0, 0, 0, 1, 1,
0.2159947, -0.8558654, 4.613624, 0, 0, 0, 1, 1,
0.2185598, 0.8419515, -0.4752493, 1, 1, 1, 1, 1,
0.2204453, -1.585466, 2.598768, 1, 1, 1, 1, 1,
0.2211812, -1.067048, 2.616287, 1, 1, 1, 1, 1,
0.2221211, -0.01080136, 1.446195, 1, 1, 1, 1, 1,
0.2269863, -1.130856, 3.285104, 1, 1, 1, 1, 1,
0.2296837, -0.9523427, 3.711141, 1, 1, 1, 1, 1,
0.2319897, 0.7885436, 0.7381548, 1, 1, 1, 1, 1,
0.2345106, -1.161371, 4.580115, 1, 1, 1, 1, 1,
0.2358895, 0.2021121, 0.5046142, 1, 1, 1, 1, 1,
0.239017, 0.9647049, -0.2614777, 1, 1, 1, 1, 1,
0.2460755, -0.7109085, 3.348332, 1, 1, 1, 1, 1,
0.2463326, -0.2150437, 3.319337, 1, 1, 1, 1, 1,
0.2466785, -0.2552339, 1.173502, 1, 1, 1, 1, 1,
0.2495693, 0.3956837, -1.126619, 1, 1, 1, 1, 1,
0.2498029, 1.105564, -0.8097616, 1, 1, 1, 1, 1,
0.2500496, 0.2220952, 1.050075, 0, 0, 1, 1, 1,
0.2500913, -1.165837, 1.684233, 1, 0, 0, 1, 1,
0.2527518, 0.0706927, 2.36828, 1, 0, 0, 1, 1,
0.2600949, -0.2189975, 1.801703, 1, 0, 0, 1, 1,
0.2608606, -0.9083554, 2.568726, 1, 0, 0, 1, 1,
0.2690142, 0.6057562, 0.2732821, 1, 0, 0, 1, 1,
0.2690903, -0.2216877, 2.942554, 0, 0, 0, 1, 1,
0.2739892, 2.31248, -0.4447208, 0, 0, 0, 1, 1,
0.2793445, -0.4316491, 1.440402, 0, 0, 0, 1, 1,
0.2807242, 0.3517939, -0.8503802, 0, 0, 0, 1, 1,
0.2823372, 1.060998, -0.3480155, 0, 0, 0, 1, 1,
0.284745, 0.6307884, 1.894768, 0, 0, 0, 1, 1,
0.2894619, 0.7570958, 0.8364704, 0, 0, 0, 1, 1,
0.2924656, -1.865509, 1.444252, 1, 1, 1, 1, 1,
0.294195, -0.3380684, 2.607893, 1, 1, 1, 1, 1,
0.2944991, -0.2602193, 2.437671, 1, 1, 1, 1, 1,
0.2995526, 0.3989016, 0.1583799, 1, 1, 1, 1, 1,
0.3015721, -1.839748, 4.069696, 1, 1, 1, 1, 1,
0.3076634, 0.7190337, 0.1247839, 1, 1, 1, 1, 1,
0.3104391, 1.364475, 0.2746967, 1, 1, 1, 1, 1,
0.3130366, -0.3771919, 2.00051, 1, 1, 1, 1, 1,
0.314206, -0.006303752, 2.93433, 1, 1, 1, 1, 1,
0.3230954, -0.2198751, 1.400843, 1, 1, 1, 1, 1,
0.3251877, -1.515833, 3.957197, 1, 1, 1, 1, 1,
0.3267161, -0.8973067, 2.847031, 1, 1, 1, 1, 1,
0.3301408, -0.3296557, 2.170946, 1, 1, 1, 1, 1,
0.3346776, -0.02122679, -0.03636135, 1, 1, 1, 1, 1,
0.3363671, -0.05184998, 3.672645, 1, 1, 1, 1, 1,
0.3386239, -0.6454153, 3.669066, 0, 0, 1, 1, 1,
0.3427719, -0.2928888, 3.152321, 1, 0, 0, 1, 1,
0.3444093, 1.207421, 0.06071284, 1, 0, 0, 1, 1,
0.3488533, 0.08101751, 1.346348, 1, 0, 0, 1, 1,
0.3491164, 1.234665, 1.206847, 1, 0, 0, 1, 1,
0.3515943, 0.7599383, -0.0547121, 1, 0, 0, 1, 1,
0.3566128, 0.686337, -0.24991, 0, 0, 0, 1, 1,
0.3593754, 0.6498575, 0.2019859, 0, 0, 0, 1, 1,
0.3603177, -1.981309, 3.368745, 0, 0, 0, 1, 1,
0.3620679, 1.327914, 0.01210228, 0, 0, 0, 1, 1,
0.3626487, 1.334854, 0.5271912, 0, 0, 0, 1, 1,
0.365096, -0.2908946, 2.327337, 0, 0, 0, 1, 1,
0.3663097, -0.3077681, 2.371284, 0, 0, 0, 1, 1,
0.3670906, 0.4589909, 0.1055658, 1, 1, 1, 1, 1,
0.3676835, 0.4778015, -0.7945765, 1, 1, 1, 1, 1,
0.3679758, 0.2761885, 0.6942834, 1, 1, 1, 1, 1,
0.3683185, 1.184755, 1.126059, 1, 1, 1, 1, 1,
0.3700173, 2.590631, -1.94542, 1, 1, 1, 1, 1,
0.3716264, -0.2402045, 2.257001, 1, 1, 1, 1, 1,
0.3808804, 1.482734, -0.6651368, 1, 1, 1, 1, 1,
0.3835237, 0.1285122, 1.704055, 1, 1, 1, 1, 1,
0.3853053, -0.3674361, 1.97455, 1, 1, 1, 1, 1,
0.386011, -0.5849971, 2.744758, 1, 1, 1, 1, 1,
0.3868532, 0.398927, 0.8435329, 1, 1, 1, 1, 1,
0.3878107, -0.3877697, 2.254274, 1, 1, 1, 1, 1,
0.3889881, -1.149082, 2.719379, 1, 1, 1, 1, 1,
0.3968496, 0.5938215, 0.8405868, 1, 1, 1, 1, 1,
0.4005393, 0.32067, 0.6616278, 1, 1, 1, 1, 1,
0.4015838, 0.5142719, -0.3058683, 0, 0, 1, 1, 1,
0.4072518, -1.481941, 2.233465, 1, 0, 0, 1, 1,
0.4087311, 1.533343, -0.3043061, 1, 0, 0, 1, 1,
0.4099532, 0.4135612, 2.710069, 1, 0, 0, 1, 1,
0.4104968, 1.068919, 0.638997, 1, 0, 0, 1, 1,
0.418409, 0.8633466, 2.017441, 1, 0, 0, 1, 1,
0.4194172, 0.3189145, 0.6468353, 0, 0, 0, 1, 1,
0.4275264, 0.2906564, 0.8009974, 0, 0, 0, 1, 1,
0.4325936, 0.1934429, 2.100526, 0, 0, 0, 1, 1,
0.4356867, 1.561275, 0.9085758, 0, 0, 0, 1, 1,
0.4404346, 0.5457819, 0.9836835, 0, 0, 0, 1, 1,
0.4440461, 1.970856, 1.98234, 0, 0, 0, 1, 1,
0.4448935, 1.23796, -0.4814936, 0, 0, 0, 1, 1,
0.4456827, -0.254018, 2.045083, 1, 1, 1, 1, 1,
0.4464616, 0.1433552, 1.002676, 1, 1, 1, 1, 1,
0.4511274, 1.348374, 1.351562, 1, 1, 1, 1, 1,
0.4514281, -0.545407, 0.8753544, 1, 1, 1, 1, 1,
0.4536452, 1.22138, 0.5278913, 1, 1, 1, 1, 1,
0.4635485, 1.566941, 1.025755, 1, 1, 1, 1, 1,
0.4657542, 0.4032258, 0.4597677, 1, 1, 1, 1, 1,
0.4675498, 0.8362979, 1.714597, 1, 1, 1, 1, 1,
0.4696087, 0.8937783, 2.085077, 1, 1, 1, 1, 1,
0.4793213, -1.068979, 3.279976, 1, 1, 1, 1, 1,
0.4823404, 0.2432421, 2.475195, 1, 1, 1, 1, 1,
0.4833052, -2.411338, 4.309953, 1, 1, 1, 1, 1,
0.4856603, -1.151109, 1.622833, 1, 1, 1, 1, 1,
0.4859551, 1.231759, 0.3828952, 1, 1, 1, 1, 1,
0.489075, -1.714394, 2.05916, 1, 1, 1, 1, 1,
0.4976051, -0.6155675, 3.96858, 0, 0, 1, 1, 1,
0.49904, 0.02723878, 1.861895, 1, 0, 0, 1, 1,
0.5038418, 0.5747229, 0.6075016, 1, 0, 0, 1, 1,
0.5039889, 0.4324261, -0.1813083, 1, 0, 0, 1, 1,
0.505225, -1.10068, 1.653662, 1, 0, 0, 1, 1,
0.5061073, -1.296626, 2.840162, 1, 0, 0, 1, 1,
0.509725, 1.998522, 0.892249, 0, 0, 0, 1, 1,
0.5101768, -1.325966, 3.059216, 0, 0, 0, 1, 1,
0.5109475, 0.6729826, 1.392007, 0, 0, 0, 1, 1,
0.5188231, 0.5649899, 1.230144, 0, 0, 0, 1, 1,
0.5205395, -1.382299, 3.072783, 0, 0, 0, 1, 1,
0.5255703, 0.1311672, -1.381772, 0, 0, 0, 1, 1,
0.5268942, 1.574538, -0.3438085, 0, 0, 0, 1, 1,
0.527169, 1.554013, 1.445055, 1, 1, 1, 1, 1,
0.5277143, 0.757297, 0.04867335, 1, 1, 1, 1, 1,
0.5309151, 0.3188976, 3.051918, 1, 1, 1, 1, 1,
0.5316886, 0.06939098, 3.748246, 1, 1, 1, 1, 1,
0.5331618, -2.988197, 2.326574, 1, 1, 1, 1, 1,
0.5389107, -0.5957516, 3.882594, 1, 1, 1, 1, 1,
0.5395889, -0.1906825, 3.490237, 1, 1, 1, 1, 1,
0.5478726, 0.3004916, 1.227773, 1, 1, 1, 1, 1,
0.5487238, 1.323012, 1.181045, 1, 1, 1, 1, 1,
0.551366, -1.061524, 3.157433, 1, 1, 1, 1, 1,
0.5520859, 0.606774, 0.1176956, 1, 1, 1, 1, 1,
0.5571522, 1.330538, 0.2322326, 1, 1, 1, 1, 1,
0.5596436, 1.155997, 0.3363158, 1, 1, 1, 1, 1,
0.5599172, 0.7801104, -0.5652923, 1, 1, 1, 1, 1,
0.5612824, 1.348308, 2.321258, 1, 1, 1, 1, 1,
0.5677528, -0.06969741, 1.141284, 0, 0, 1, 1, 1,
0.5701395, 0.2897333, 0.710744, 1, 0, 0, 1, 1,
0.5739827, -1.383815, 3.598346, 1, 0, 0, 1, 1,
0.5742865, -0.1975865, 2.596047, 1, 0, 0, 1, 1,
0.5760728, 0.5400569, 3.097493, 1, 0, 0, 1, 1,
0.580004, 1.982312, 1.047473, 1, 0, 0, 1, 1,
0.5809014, 0.9643007, 1.53558, 0, 0, 0, 1, 1,
0.5817574, -0.398042, 3.844628, 0, 0, 0, 1, 1,
0.582968, 0.9219931, 1.103584, 0, 0, 0, 1, 1,
0.5848411, 0.5610412, -0.6903953, 0, 0, 0, 1, 1,
0.5879403, -2.020938, 3.433285, 0, 0, 0, 1, 1,
0.5942654, 0.7620543, 1.986077, 0, 0, 0, 1, 1,
0.5943098, 1.221977, 0.5341195, 0, 0, 0, 1, 1,
0.5952064, -0.5160283, 1.725006, 1, 1, 1, 1, 1,
0.5952786, 0.1582926, 0.9709002, 1, 1, 1, 1, 1,
0.5996119, -0.7965264, 2.453547, 1, 1, 1, 1, 1,
0.6003506, -0.2465579, 2.047757, 1, 1, 1, 1, 1,
0.601042, 0.8695253, -0.1777259, 1, 1, 1, 1, 1,
0.6068143, -0.753691, 1.890305, 1, 1, 1, 1, 1,
0.6128665, -0.05824851, 2.565875, 1, 1, 1, 1, 1,
0.6132658, -0.6031269, 1.325854, 1, 1, 1, 1, 1,
0.6173199, -0.1641875, 2.031889, 1, 1, 1, 1, 1,
0.6182261, -0.2305996, 3.821904, 1, 1, 1, 1, 1,
0.6252744, -0.08191846, 1.960279, 1, 1, 1, 1, 1,
0.6315081, -2.115127, 1.428104, 1, 1, 1, 1, 1,
0.6315835, 2.033717, 1.721154, 1, 1, 1, 1, 1,
0.6327357, 0.3269179, 1.7925, 1, 1, 1, 1, 1,
0.6371338, 0.5239434, 1.348856, 1, 1, 1, 1, 1,
0.6409676, -0.5832391, 2.066275, 0, 0, 1, 1, 1,
0.646891, -0.1580975, 2.015329, 1, 0, 0, 1, 1,
0.6471061, 0.00444422, 1.70201, 1, 0, 0, 1, 1,
0.6482594, -0.4704691, 4.524276, 1, 0, 0, 1, 1,
0.657057, -0.861503, 4.217376, 1, 0, 0, 1, 1,
0.6571949, 1.428413, 0.9103149, 1, 0, 0, 1, 1,
0.6577666, 0.10348, 0.0836568, 0, 0, 0, 1, 1,
0.658079, 1.063753, -0.07571185, 0, 0, 0, 1, 1,
0.6614906, -0.1682846, 1.655886, 0, 0, 0, 1, 1,
0.6640363, 0.25837, 0.002455997, 0, 0, 0, 1, 1,
0.664398, 1.328955, 0.8319501, 0, 0, 0, 1, 1,
0.6709026, 1.371769, 0.7432762, 0, 0, 0, 1, 1,
0.6745493, -0.1109724, 2.616043, 0, 0, 0, 1, 1,
0.6769924, -2.312458, 1.512247, 1, 1, 1, 1, 1,
0.6788986, 2.50466, 0.139592, 1, 1, 1, 1, 1,
0.6792482, -0.2919724, 1.599865, 1, 1, 1, 1, 1,
0.6829673, 0.7325978, 2.218889, 1, 1, 1, 1, 1,
0.6871188, 1.858923, 0.5889876, 1, 1, 1, 1, 1,
0.6981531, -1.478544, 1.551868, 1, 1, 1, 1, 1,
0.7013468, 0.4511238, 0.4733559, 1, 1, 1, 1, 1,
0.7031662, 1.861543, -0.2321333, 1, 1, 1, 1, 1,
0.726235, -0.6192418, 2.597978, 1, 1, 1, 1, 1,
0.7271791, 0.6874303, 1.804452, 1, 1, 1, 1, 1,
0.7286415, 1.093517, 0.4878176, 1, 1, 1, 1, 1,
0.7294763, -1.801606, 1.973933, 1, 1, 1, 1, 1,
0.7305928, -0.2594776, 2.593545, 1, 1, 1, 1, 1,
0.7338577, -0.3705764, 1.98675, 1, 1, 1, 1, 1,
0.7344912, 2.27069, 0.7997795, 1, 1, 1, 1, 1,
0.7441765, 1.104656, -1.230131, 0, 0, 1, 1, 1,
0.7442928, 0.3053799, 2.216299, 1, 0, 0, 1, 1,
0.7460978, 0.5646003, -0.7291319, 1, 0, 0, 1, 1,
0.7515547, -1.000136, 2.237961, 1, 0, 0, 1, 1,
0.752684, -1.581687, 3.149529, 1, 0, 0, 1, 1,
0.7586618, -0.249236, 1.593569, 1, 0, 0, 1, 1,
0.759073, -1.161694, 1.619713, 0, 0, 0, 1, 1,
0.7608009, -1.155258, 3.179024, 0, 0, 0, 1, 1,
0.7626829, 1.840024, -0.3150021, 0, 0, 0, 1, 1,
0.7644798, 0.588376, 2.130133, 0, 0, 0, 1, 1,
0.7649616, -1.080168, 2.572079, 0, 0, 0, 1, 1,
0.7651008, -0.130354, 3.344814, 0, 0, 0, 1, 1,
0.7729347, -1.144377, 2.328401, 0, 0, 0, 1, 1,
0.7778999, 0.3552485, -0.3775955, 1, 1, 1, 1, 1,
0.7807686, 0.6373265, 0.185591, 1, 1, 1, 1, 1,
0.7931834, -1.454813, 3.478357, 1, 1, 1, 1, 1,
0.7962772, -0.01086423, 2.93141, 1, 1, 1, 1, 1,
0.7974265, 1.847633, 0.2551819, 1, 1, 1, 1, 1,
0.8010488, 0.5509412, 0.2966747, 1, 1, 1, 1, 1,
0.8040767, 0.521159, 1.399878, 1, 1, 1, 1, 1,
0.805325, -3.042562, 1.944039, 1, 1, 1, 1, 1,
0.8085617, -1.652318, 3.887739, 1, 1, 1, 1, 1,
0.8086158, 0.6294863, -0.5226362, 1, 1, 1, 1, 1,
0.8264649, -1.496987, 2.046126, 1, 1, 1, 1, 1,
0.8304681, 1.29387, 1.619004, 1, 1, 1, 1, 1,
0.8374421, 0.6874388, 0.2058346, 1, 1, 1, 1, 1,
0.8378001, -1.595021, 0.958806, 1, 1, 1, 1, 1,
0.8385327, 0.4161811, -0.253171, 1, 1, 1, 1, 1,
0.8547038, 0.1372157, 1.091344, 0, 0, 1, 1, 1,
0.8556493, 0.04235604, 0.3601158, 1, 0, 0, 1, 1,
0.857097, -0.2072483, 0.9109657, 1, 0, 0, 1, 1,
0.8608385, -0.1199308, 2.11129, 1, 0, 0, 1, 1,
0.8621545, -0.4129048, 1.470223, 1, 0, 0, 1, 1,
0.866513, 0.4496753, 1.625465, 1, 0, 0, 1, 1,
0.8667642, -0.1015487, 3.258044, 0, 0, 0, 1, 1,
0.8687773, 0.4133352, 0.7095806, 0, 0, 0, 1, 1,
0.8719626, -1.674175, 2.153248, 0, 0, 0, 1, 1,
0.8761335, 0.6547284, 0.6711229, 0, 0, 0, 1, 1,
0.87848, -0.6574529, 1.19767, 0, 0, 0, 1, 1,
0.8886017, 0.2206813, 2.330665, 0, 0, 0, 1, 1,
0.8962165, 0.3337047, -0.7618538, 0, 0, 0, 1, 1,
0.8987243, -1.610358, 1.024574, 1, 1, 1, 1, 1,
0.9044892, 0.3492524, 1.633319, 1, 1, 1, 1, 1,
0.9077358, -1.384211, 3.684843, 1, 1, 1, 1, 1,
0.9116212, -1.034034, 2.286, 1, 1, 1, 1, 1,
0.9269054, -0.4804573, 3.485675, 1, 1, 1, 1, 1,
0.9274725, -0.7484949, 1.941046, 1, 1, 1, 1, 1,
0.9345298, 2.077902, 0.6465618, 1, 1, 1, 1, 1,
0.9401377, 0.5716369, 1.930605, 1, 1, 1, 1, 1,
0.9408109, 1.142813, -0.5057024, 1, 1, 1, 1, 1,
0.9409891, 0.453632, 1.007837, 1, 1, 1, 1, 1,
0.9441546, -0.9023478, 1.522108, 1, 1, 1, 1, 1,
0.9462486, 1.138371, -0.4148348, 1, 1, 1, 1, 1,
0.9493167, 1.648082, 0.2248284, 1, 1, 1, 1, 1,
0.9582985, -0.3498632, 0.4707551, 1, 1, 1, 1, 1,
0.9655143, -0.5860721, 1.226507, 1, 1, 1, 1, 1,
0.9660404, -0.8897545, 1.580342, 0, 0, 1, 1, 1,
0.969043, 1.101802, 1.507718, 1, 0, 0, 1, 1,
0.9765, 0.4961272, -0.5943294, 1, 0, 0, 1, 1,
0.9863901, 1.827358, 1.436611, 1, 0, 0, 1, 1,
0.9873208, -0.7012537, 1.78053, 1, 0, 0, 1, 1,
0.9900798, 0.8868158, 0.07002895, 1, 0, 0, 1, 1,
0.9938329, -0.481009, 1.081905, 0, 0, 0, 1, 1,
0.9951595, -0.4064743, 3.091915, 0, 0, 0, 1, 1,
0.9994613, 1.004804, -0.7515788, 0, 0, 0, 1, 1,
1.008754, 1.761337, 0.24568, 0, 0, 0, 1, 1,
1.008759, 0.9501747, 1.80978, 0, 0, 0, 1, 1,
1.010413, -0.7811822, 1.645805, 0, 0, 0, 1, 1,
1.010729, 1.242136, 0.2896017, 0, 0, 0, 1, 1,
1.011314, 0.3785083, 1.31828, 1, 1, 1, 1, 1,
1.014251, -0.4222211, 0.3396218, 1, 1, 1, 1, 1,
1.022806, 0.2100081, 0.2603517, 1, 1, 1, 1, 1,
1.029584, 0.06655965, 1.916388, 1, 1, 1, 1, 1,
1.031572, -0.02075029, 2.195928, 1, 1, 1, 1, 1,
1.033087, -0.8407919, 3.533105, 1, 1, 1, 1, 1,
1.035692, 2.709362, -2.124839, 1, 1, 1, 1, 1,
1.043632, -0.7636368, 2.56187, 1, 1, 1, 1, 1,
1.043638, 0.3831969, 0.04930156, 1, 1, 1, 1, 1,
1.044744, -2.254528, 2.469829, 1, 1, 1, 1, 1,
1.046883, 0.4928419, -0.4243279, 1, 1, 1, 1, 1,
1.048609, 0.2624083, 4.165257, 1, 1, 1, 1, 1,
1.049589, -0.8837637, 2.660367, 1, 1, 1, 1, 1,
1.052619, -1.20196, 1.659319, 1, 1, 1, 1, 1,
1.052935, 1.174765, 0.1589139, 1, 1, 1, 1, 1,
1.059976, 0.005991125, 2.454061, 0, 0, 1, 1, 1,
1.060766, -1.386119, 1.081691, 1, 0, 0, 1, 1,
1.063786, -0.318965, 1.367255, 1, 0, 0, 1, 1,
1.064637, 0.1725701, 1.456655, 1, 0, 0, 1, 1,
1.067778, 0.05315813, 2.02069, 1, 0, 0, 1, 1,
1.07034, -1.064203, 0.9043059, 1, 0, 0, 1, 1,
1.074794, -1.892364, 2.804895, 0, 0, 0, 1, 1,
1.078233, 0.474075, 2.247562, 0, 0, 0, 1, 1,
1.086359, -0.7202595, 1.740374, 0, 0, 0, 1, 1,
1.091837, 0.117425, 1.882224, 0, 0, 0, 1, 1,
1.094738, -0.9520099, 2.412611, 0, 0, 0, 1, 1,
1.103524, -1.415399, 0.01599931, 0, 0, 0, 1, 1,
1.105489, -1.24973, 4.490274, 0, 0, 0, 1, 1,
1.106747, 0.7730526, 1.974149, 1, 1, 1, 1, 1,
1.110726, -0.244813, 2.995627, 1, 1, 1, 1, 1,
1.111046, 1.724477, -0.1921431, 1, 1, 1, 1, 1,
1.11264, -2.258106, 1.923301, 1, 1, 1, 1, 1,
1.116572, 1.529832, 0.2911425, 1, 1, 1, 1, 1,
1.122483, -0.01080776, 1.556061, 1, 1, 1, 1, 1,
1.138546, 0.3100626, 1.568001, 1, 1, 1, 1, 1,
1.140359, -1.000529, 3.884061, 1, 1, 1, 1, 1,
1.147622, -0.1879592, 1.536237, 1, 1, 1, 1, 1,
1.157027, -1.705552, 2.96144, 1, 1, 1, 1, 1,
1.157448, -2.254627, 2.335699, 1, 1, 1, 1, 1,
1.158893, 2.215962, 1.236031, 1, 1, 1, 1, 1,
1.166035, 0.8741241, 0.9709446, 1, 1, 1, 1, 1,
1.167625, -1.476023, 3.047849, 1, 1, 1, 1, 1,
1.176051, 0.6436515, 1.509172, 1, 1, 1, 1, 1,
1.182536, 2.003443, 1.158059, 0, 0, 1, 1, 1,
1.186436, -1.595291, 2.563513, 1, 0, 0, 1, 1,
1.188118, -0.2243755, 1.439744, 1, 0, 0, 1, 1,
1.189565, -0.1073019, 0.9298533, 1, 0, 0, 1, 1,
1.198505, -2.61502, 2.214398, 1, 0, 0, 1, 1,
1.202284, 0.02436671, 1.133, 1, 0, 0, 1, 1,
1.207589, 0.1277101, 1.408534, 0, 0, 0, 1, 1,
1.211118, -2.230504, 1.189299, 0, 0, 0, 1, 1,
1.219421, 0.07065029, 1.598325, 0, 0, 0, 1, 1,
1.222481, 0.9988061, 1.761351, 0, 0, 0, 1, 1,
1.231604, -0.8346923, 1.895458, 0, 0, 0, 1, 1,
1.23225, 0.8173969, 1.65381, 0, 0, 0, 1, 1,
1.239049, 1.081318, 1.280008, 0, 0, 0, 1, 1,
1.242772, 0.3434388, 1.055212, 1, 1, 1, 1, 1,
1.264232, 0.01338854, 2.090127, 1, 1, 1, 1, 1,
1.268744, 1.615238, 0.5805337, 1, 1, 1, 1, 1,
1.279469, 0.1517857, 3.296524, 1, 1, 1, 1, 1,
1.283993, -0.6413435, 3.4233, 1, 1, 1, 1, 1,
1.28472, 1.655893, 1.317132, 1, 1, 1, 1, 1,
1.29736, 0.3901391, 0.05466862, 1, 1, 1, 1, 1,
1.298974, -1.75846, 2.548041, 1, 1, 1, 1, 1,
1.307582, -1.558686, 1.830106, 1, 1, 1, 1, 1,
1.321285, 1.454726, 1.541169, 1, 1, 1, 1, 1,
1.322181, 0.4096175, 2.157907, 1, 1, 1, 1, 1,
1.335647, 0.02047476, 2.319098, 1, 1, 1, 1, 1,
1.344812, -1.275774, 1.310195, 1, 1, 1, 1, 1,
1.357025, 0.7621064, 0.579855, 1, 1, 1, 1, 1,
1.362103, -0.7469253, 3.02754, 1, 1, 1, 1, 1,
1.363552, 1.139937, 0.5092211, 0, 0, 1, 1, 1,
1.374514, -0.6595061, 1.913147, 1, 0, 0, 1, 1,
1.376642, 0.3951809, 0.6218221, 1, 0, 0, 1, 1,
1.386448, 2.452106, 0.7664646, 1, 0, 0, 1, 1,
1.389465, 0.9211273, -0.06432594, 1, 0, 0, 1, 1,
1.390654, -0.258372, 2.938962, 1, 0, 0, 1, 1,
1.394478, 0.6208086, 1.480886, 0, 0, 0, 1, 1,
1.394652, -1.323111, 2.726363, 0, 0, 0, 1, 1,
1.398895, 1.484619, 1.855711, 0, 0, 0, 1, 1,
1.402659, -0.4522226, 3.107054, 0, 0, 0, 1, 1,
1.426228, -1.750342, 1.475871, 0, 0, 0, 1, 1,
1.432895, 1.028843, 3.004017, 0, 0, 0, 1, 1,
1.434448, 0.02784129, 1.923373, 0, 0, 0, 1, 1,
1.434984, -0.9190397, 4.415431, 1, 1, 1, 1, 1,
1.435196, 1.802906, 1.086758, 1, 1, 1, 1, 1,
1.437858, -1.173626, 2.087993, 1, 1, 1, 1, 1,
1.449934, 0.3317436, 2.445326, 1, 1, 1, 1, 1,
1.450471, -0.1770379, 2.406166, 1, 1, 1, 1, 1,
1.45656, 0.3020534, 2.520792, 1, 1, 1, 1, 1,
1.466219, 0.2585059, 0.4748068, 1, 1, 1, 1, 1,
1.466915, -0.6030999, 2.063541, 1, 1, 1, 1, 1,
1.471221, 1.024708, -0.1855245, 1, 1, 1, 1, 1,
1.474352, 2.761811, 1.668316, 1, 1, 1, 1, 1,
1.47871, -0.8610859, 0.913187, 1, 1, 1, 1, 1,
1.4827, -1.433692, 1.645907, 1, 1, 1, 1, 1,
1.483889, 1.260258, 1.841709, 1, 1, 1, 1, 1,
1.494654, 1.227042, -0.5000291, 1, 1, 1, 1, 1,
1.495729, -0.1282531, 0.8630286, 1, 1, 1, 1, 1,
1.500279, -1.230869, 2.630031, 0, 0, 1, 1, 1,
1.508678, 1.022665, 3.292928, 1, 0, 0, 1, 1,
1.52322, -1.099023, 0.9871789, 1, 0, 0, 1, 1,
1.52449, -1.144348, 1.689407, 1, 0, 0, 1, 1,
1.531101, 1.317722, -0.4920513, 1, 0, 0, 1, 1,
1.534482, -1.802187, 2.250447, 1, 0, 0, 1, 1,
1.537135, 0.1237206, 2.52774, 0, 0, 0, 1, 1,
1.54138, 1.045736, 1.564607, 0, 0, 0, 1, 1,
1.541782, -1.220713, 2.56348, 0, 0, 0, 1, 1,
1.54472, -1.094397, 3.600366, 0, 0, 0, 1, 1,
1.545899, -1.048751, 0.8258967, 0, 0, 0, 1, 1,
1.546378, -1.168648, 0.9750388, 0, 0, 0, 1, 1,
1.55533, 1.340747, 0.992672, 0, 0, 0, 1, 1,
1.559823, -0.9437984, 3.576171, 1, 1, 1, 1, 1,
1.566771, 0.6004453, 0.7526113, 1, 1, 1, 1, 1,
1.568179, 0.4193264, 0.7622052, 1, 1, 1, 1, 1,
1.585684, 1.152386, 1.584087, 1, 1, 1, 1, 1,
1.589901, 0.4996369, 1.168031, 1, 1, 1, 1, 1,
1.594436, -0.4667157, 2.304744, 1, 1, 1, 1, 1,
1.640625, -1.602518, 2.411713, 1, 1, 1, 1, 1,
1.641821, 1.265262, 1.896232, 1, 1, 1, 1, 1,
1.659452, 1.347425, 0.6599232, 1, 1, 1, 1, 1,
1.664039, 1.128472, 1.400794, 1, 1, 1, 1, 1,
1.688367, -0.6963783, 2.04248, 1, 1, 1, 1, 1,
1.698874, 1.245275, 2.733752, 1, 1, 1, 1, 1,
1.701763, 0.7586024, 0.9182079, 1, 1, 1, 1, 1,
1.74195, 0.242336, 0.5309895, 1, 1, 1, 1, 1,
1.760559, 2.072541, 1.716334, 1, 1, 1, 1, 1,
1.761372, -0.8058049, 1.230735, 0, 0, 1, 1, 1,
1.766992, -0.6633968, 1.950936, 1, 0, 0, 1, 1,
1.767961, -1.966295, 3.844596, 1, 0, 0, 1, 1,
1.774422, -0.6696861, 1.517104, 1, 0, 0, 1, 1,
1.804414, 0.9023271, 1.509663, 1, 0, 0, 1, 1,
1.809148, 0.152638, 0.6225833, 1, 0, 0, 1, 1,
1.809868, 0.1882323, 2.443035, 0, 0, 0, 1, 1,
1.810797, -0.4550005, 1.031455, 0, 0, 0, 1, 1,
1.817137, 0.6636051, 1.484835, 0, 0, 0, 1, 1,
1.834113, 0.5202017, 1.939703, 0, 0, 0, 1, 1,
1.84531, -0.6209649, 1.625892, 0, 0, 0, 1, 1,
1.849583, 0.7251328, 1.633075, 0, 0, 0, 1, 1,
1.872489, 1.339617, 3.104139, 0, 0, 0, 1, 1,
1.908968, 0.8911839, 1.175174, 1, 1, 1, 1, 1,
1.913431, -0.4496807, 1.332804, 1, 1, 1, 1, 1,
1.935315, 1.390095, 1.04451, 1, 1, 1, 1, 1,
1.950391, -0.3777426, 0.7078204, 1, 1, 1, 1, 1,
1.976495, 0.1508307, 0.503177, 1, 1, 1, 1, 1,
1.986197, -0.06918599, 1.747142, 1, 1, 1, 1, 1,
2.011965, 1.198763, 1.310097, 1, 1, 1, 1, 1,
2.025466, -0.1694973, 0.2455293, 1, 1, 1, 1, 1,
2.044428, 0.2921723, 1.475857, 1, 1, 1, 1, 1,
2.0632, 1.896325, 0.3479491, 1, 1, 1, 1, 1,
2.070521, -2.705457, 2.863121, 1, 1, 1, 1, 1,
2.109828, -0.7338068, 2.439421, 1, 1, 1, 1, 1,
2.110693, 0.6051965, 1.353187, 1, 1, 1, 1, 1,
2.127346, -0.056373, 2.887229, 1, 1, 1, 1, 1,
2.129481, 0.11071, 0.8693121, 1, 1, 1, 1, 1,
2.131454, 0.1096665, 2.531132, 0, 0, 1, 1, 1,
2.145248, 0.5234925, 0.7817504, 1, 0, 0, 1, 1,
2.152186, -1.46645, 2.507412, 1, 0, 0, 1, 1,
2.164139, -0.2229025, 1.210738, 1, 0, 0, 1, 1,
2.210489, -1.329163, 3.096766, 1, 0, 0, 1, 1,
2.217642, -2.074713, 1.133087, 1, 0, 0, 1, 1,
2.229932, -0.2544515, 0.4847824, 0, 0, 0, 1, 1,
2.233229, 0.5037989, 2.806546, 0, 0, 0, 1, 1,
2.264123, 0.3615482, -0.6720217, 0, 0, 0, 1, 1,
2.268668, -1.024051, 2.141991, 0, 0, 0, 1, 1,
2.276901, -1.000488, 0.1323194, 0, 0, 0, 1, 1,
2.288047, -1.511916, 1.902365, 0, 0, 0, 1, 1,
2.315592, 1.09485, 1.562448, 0, 0, 0, 1, 1,
2.509572, 1.518034, 1.656781, 1, 1, 1, 1, 1,
2.527494, 0.04289849, 1.136052, 1, 1, 1, 1, 1,
2.580535, 0.3680145, 2.115214, 1, 1, 1, 1, 1,
2.664627, -0.9344164, 2.028131, 1, 1, 1, 1, 1,
2.709077, 0.8152823, 2.251469, 1, 1, 1, 1, 1,
2.738949, -2.129636, 3.498395, 1, 1, 1, 1, 1,
3.141671, 0.7526835, -0.4829831, 1, 1, 1, 1, 1
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
var radius = 9.443276;
var distance = 33.16911;
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
mvMatrix.translate( 0.1315899, 0.05672491, 0.0792675 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.16911);
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
