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
-3.244057, -0.6181747, -1.375596, 1, 0, 0, 1,
-2.953721, -1.687449, -1.932552, 1, 0.007843138, 0, 1,
-2.80798, -0.5315161, -1.780938, 1, 0.01176471, 0, 1,
-2.703416, 0.8777901, -0.285985, 1, 0.01960784, 0, 1,
-2.643582, 1.177302, -1.264253, 1, 0.02352941, 0, 1,
-2.514936, -0.8621061, -1.34212, 1, 0.03137255, 0, 1,
-2.437255, -2.362177, -5.527121, 1, 0.03529412, 0, 1,
-2.37626, -1.200712, -2.742982, 1, 0.04313726, 0, 1,
-2.354744, 0.747175, -1.348112, 1, 0.04705882, 0, 1,
-2.347308, 0.7120114, -1.146752, 1, 0.05490196, 0, 1,
-2.318616, 0.5034233, -1.150422, 1, 0.05882353, 0, 1,
-2.317756, -0.0881825, -1.033096, 1, 0.06666667, 0, 1,
-2.311687, 0.5528085, -3.838356, 1, 0.07058824, 0, 1,
-2.298004, 1.679061, 0.1245615, 1, 0.07843138, 0, 1,
-2.297255, 0.6373088, -1.213408, 1, 0.08235294, 0, 1,
-2.239071, 1.803378, -1.332643, 1, 0.09019608, 0, 1,
-2.221235, -1.588243, -1.983137, 1, 0.09411765, 0, 1,
-2.201442, -0.7538279, -1.4264, 1, 0.1019608, 0, 1,
-2.127106, 0.2523964, -2.22957, 1, 0.1098039, 0, 1,
-2.116749, -1.038395, -1.470748, 1, 0.1137255, 0, 1,
-2.093164, -1.158109, -1.44745, 1, 0.1215686, 0, 1,
-2.084659, -1.509534, -1.055229, 1, 0.1254902, 0, 1,
-2.080064, -0.5927654, -2.346976, 1, 0.1333333, 0, 1,
-2.038138, -2.218968, -1.367634, 1, 0.1372549, 0, 1,
-2.02063, -2.647978, -1.907159, 1, 0.145098, 0, 1,
-1.9763, -0.3794997, -2.517459, 1, 0.1490196, 0, 1,
-1.970757, -0.1083938, -1.51071, 1, 0.1568628, 0, 1,
-1.970338, -1.61965, -1.746127, 1, 0.1607843, 0, 1,
-1.938426, -1.119939, -1.484676, 1, 0.1686275, 0, 1,
-1.938423, -0.863542, -2.991964, 1, 0.172549, 0, 1,
-1.934805, 1.158377, 0.3336183, 1, 0.1803922, 0, 1,
-1.930932, 0.7387983, 0.4022188, 1, 0.1843137, 0, 1,
-1.924071, 1.122648, 0.4137383, 1, 0.1921569, 0, 1,
-1.888296, 0.2203094, -0.1227343, 1, 0.1960784, 0, 1,
-1.886641, -1.654715, -3.22869, 1, 0.2039216, 0, 1,
-1.878225, 1.223008, -2.714046, 1, 0.2117647, 0, 1,
-1.870906, -0.4918068, -1.255778, 1, 0.2156863, 0, 1,
-1.870056, 0.5710438, -2.29494, 1, 0.2235294, 0, 1,
-1.868686, 0.7220531, -0.2907298, 1, 0.227451, 0, 1,
-1.845458, -0.3131704, -3.585511, 1, 0.2352941, 0, 1,
-1.84199, 0.00124965, -2.472703, 1, 0.2392157, 0, 1,
-1.830728, -0.1658566, -1.136831, 1, 0.2470588, 0, 1,
-1.821602, 0.5657345, -2.803848, 1, 0.2509804, 0, 1,
-1.796524, -0.8056507, -0.7731063, 1, 0.2588235, 0, 1,
-1.796427, -0.2640488, -1.80023, 1, 0.2627451, 0, 1,
-1.784123, -1.462463, -1.124294, 1, 0.2705882, 0, 1,
-1.780705, -1.133278, -2.000807, 1, 0.2745098, 0, 1,
-1.778132, -0.8296968, -2.712064, 1, 0.282353, 0, 1,
-1.758718, -1.051517, -1.287076, 1, 0.2862745, 0, 1,
-1.752084, -0.6923729, -1.522964, 1, 0.2941177, 0, 1,
-1.671798, 0.4214638, -2.441741, 1, 0.3019608, 0, 1,
-1.654768, 0.5838124, -0.002251568, 1, 0.3058824, 0, 1,
-1.637059, -0.2139399, -1.225492, 1, 0.3137255, 0, 1,
-1.63701, 0.5200936, -2.380855, 1, 0.3176471, 0, 1,
-1.624787, 0.9245019, -1.202448, 1, 0.3254902, 0, 1,
-1.620315, -0.03624388, -0.9672362, 1, 0.3294118, 0, 1,
-1.617227, 1.428246, -1.144351, 1, 0.3372549, 0, 1,
-1.612496, -0.7809535, -2.274433, 1, 0.3411765, 0, 1,
-1.607861, -0.9058229, -1.615175, 1, 0.3490196, 0, 1,
-1.593653, 0.07510364, -2.383747, 1, 0.3529412, 0, 1,
-1.59307, 0.006792756, -2.516141, 1, 0.3607843, 0, 1,
-1.588776, 0.6205561, -2.365826, 1, 0.3647059, 0, 1,
-1.581525, 1.200368, 0.4469891, 1, 0.372549, 0, 1,
-1.569052, -0.6049747, -1.642341, 1, 0.3764706, 0, 1,
-1.565343, -1.841486, -1.756815, 1, 0.3843137, 0, 1,
-1.553595, 0.8667252, -0.1283089, 1, 0.3882353, 0, 1,
-1.551041, 0.3758934, -0.8741438, 1, 0.3960784, 0, 1,
-1.550764, -0.3337339, -2.473242, 1, 0.4039216, 0, 1,
-1.541077, 0.06683458, 0.09906282, 1, 0.4078431, 0, 1,
-1.54013, 0.585396, -0.9489244, 1, 0.4156863, 0, 1,
-1.534027, 0.3968062, -1.920869, 1, 0.4196078, 0, 1,
-1.531238, 0.5759552, 0.7234401, 1, 0.427451, 0, 1,
-1.528593, 0.5208761, 0.04302187, 1, 0.4313726, 0, 1,
-1.526976, -0.6777301, -0.598595, 1, 0.4392157, 0, 1,
-1.505395, 0.1986547, -3.325379, 1, 0.4431373, 0, 1,
-1.481701, -0.6744822, -2.341355, 1, 0.4509804, 0, 1,
-1.464891, 1.52415, 0.02937901, 1, 0.454902, 0, 1,
-1.463788, 1.259466, -0.1087912, 1, 0.4627451, 0, 1,
-1.452409, -0.8068312, -2.00719, 1, 0.4666667, 0, 1,
-1.451888, -0.8144124, 0.5652504, 1, 0.4745098, 0, 1,
-1.446518, 0.1717078, -1.428953, 1, 0.4784314, 0, 1,
-1.443535, 0.4603118, -2.691051, 1, 0.4862745, 0, 1,
-1.432205, -0.3277062, -0.7522092, 1, 0.4901961, 0, 1,
-1.425002, 0.2622295, -1.595243, 1, 0.4980392, 0, 1,
-1.409384, 0.3404315, -1.165044, 1, 0.5058824, 0, 1,
-1.4043, -0.7019098, -3.29071, 1, 0.509804, 0, 1,
-1.403944, -1.795949, -3.013792, 1, 0.5176471, 0, 1,
-1.396289, 1.643593, -0.6098786, 1, 0.5215687, 0, 1,
-1.396187, -0.2703781, -1.597552, 1, 0.5294118, 0, 1,
-1.395464, 1.010961, 0.6066461, 1, 0.5333334, 0, 1,
-1.392645, 0.9964561, -0.5222639, 1, 0.5411765, 0, 1,
-1.36752, -0.7219749, -2.22943, 1, 0.5450981, 0, 1,
-1.350178, 1.287201, -0.8248034, 1, 0.5529412, 0, 1,
-1.347102, -0.3143211, -1.019714, 1, 0.5568628, 0, 1,
-1.335659, -0.679638, -2.040951, 1, 0.5647059, 0, 1,
-1.335499, -0.5046767, -4.140419, 1, 0.5686275, 0, 1,
-1.328645, -0.1503934, -3.110464, 1, 0.5764706, 0, 1,
-1.32839, -1.013107, -3.194092, 1, 0.5803922, 0, 1,
-1.310303, -2.095776, -1.923391, 1, 0.5882353, 0, 1,
-1.309392, -0.1127467, -1.575371, 1, 0.5921569, 0, 1,
-1.308175, 0.9465294, -0.3012742, 1, 0.6, 0, 1,
-1.306148, -0.35306, -2.127383, 1, 0.6078432, 0, 1,
-1.302231, -1.25415, -4.338231, 1, 0.6117647, 0, 1,
-1.290998, -0.299814, -2.155819, 1, 0.6196079, 0, 1,
-1.277399, 0.9372002, -1.408229, 1, 0.6235294, 0, 1,
-1.274786, 0.1498634, -1.585402, 1, 0.6313726, 0, 1,
-1.274628, 1.192157, -0.154695, 1, 0.6352941, 0, 1,
-1.263443, -1.404843, -0.2931816, 1, 0.6431373, 0, 1,
-1.260863, -1.385502, -2.159725, 1, 0.6470588, 0, 1,
-1.259669, 1.456192, 0.2559627, 1, 0.654902, 0, 1,
-1.25518, 0.1793455, -2.458667, 1, 0.6588235, 0, 1,
-1.25343, 0.2622312, -0.1687371, 1, 0.6666667, 0, 1,
-1.235297, 0.2532471, -2.831478, 1, 0.6705883, 0, 1,
-1.233487, 2.082595, -0.7099727, 1, 0.6784314, 0, 1,
-1.221814, 0.5615998, -0.8917987, 1, 0.682353, 0, 1,
-1.21209, -0.4948606, -3.281564, 1, 0.6901961, 0, 1,
-1.211708, -0.4576972, -2.30099, 1, 0.6941177, 0, 1,
-1.210077, -0.2947856, -2.686016, 1, 0.7019608, 0, 1,
-1.204253, 1.004268, 0.7180192, 1, 0.7098039, 0, 1,
-1.204193, -0.2699348, -1.334262, 1, 0.7137255, 0, 1,
-1.199054, 1.581724, -1.199834, 1, 0.7215686, 0, 1,
-1.196861, 0.2214156, 0.7981651, 1, 0.7254902, 0, 1,
-1.195763, 0.1570223, -0.9391568, 1, 0.7333333, 0, 1,
-1.194516, -0.4502186, -0.5996534, 1, 0.7372549, 0, 1,
-1.194173, -0.3662751, -2.018297, 1, 0.7450981, 0, 1,
-1.193608, -1.177167, -2.992864, 1, 0.7490196, 0, 1,
-1.182507, -0.5143276, -2.236739, 1, 0.7568628, 0, 1,
-1.180399, 0.4795727, -0.1465114, 1, 0.7607843, 0, 1,
-1.176563, -1.515162, -2.989788, 1, 0.7686275, 0, 1,
-1.174777, 0.6279984, -0.01772804, 1, 0.772549, 0, 1,
-1.170572, -0.4810273, -2.055973, 1, 0.7803922, 0, 1,
-1.165797, 0.04697122, -2.296541, 1, 0.7843137, 0, 1,
-1.158969, -0.5032212, -2.848382, 1, 0.7921569, 0, 1,
-1.157715, -0.551756, -2.537641, 1, 0.7960784, 0, 1,
-1.150676, 1.267038, -1.335659, 1, 0.8039216, 0, 1,
-1.148853, -0.2330411, -1.005758, 1, 0.8117647, 0, 1,
-1.148731, 0.9162005, -1.574994, 1, 0.8156863, 0, 1,
-1.148238, -0.4643023, -2.523509, 1, 0.8235294, 0, 1,
-1.146328, 0.7557513, -0.303572, 1, 0.827451, 0, 1,
-1.142639, -0.4598781, -1.604509, 1, 0.8352941, 0, 1,
-1.141307, 0.6162872, -1.408164, 1, 0.8392157, 0, 1,
-1.126172, -2.28318, -2.074962, 1, 0.8470588, 0, 1,
-1.124866, 0.9669924, -1.419135, 1, 0.8509804, 0, 1,
-1.122357, 0.6514781, -1.781087, 1, 0.8588235, 0, 1,
-1.121468, 3.200241, -0.856286, 1, 0.8627451, 0, 1,
-1.119488, -0.1402403, -0.2336488, 1, 0.8705882, 0, 1,
-1.115448, 0.8117702, -2.787091, 1, 0.8745098, 0, 1,
-1.111814, 1.466119, -0.5507367, 1, 0.8823529, 0, 1,
-1.105895, -1.769703, -1.510996, 1, 0.8862745, 0, 1,
-1.105727, 0.6455052, -0.5818635, 1, 0.8941177, 0, 1,
-1.097205, 0.4141901, -1.807773, 1, 0.8980392, 0, 1,
-1.090854, -0.1472913, -1.597141, 1, 0.9058824, 0, 1,
-1.085756, 1.089762, -1.54933, 1, 0.9137255, 0, 1,
-1.082901, -0.1312963, -2.849841, 1, 0.9176471, 0, 1,
-1.08106, 0.5022565, -0.4921959, 1, 0.9254902, 0, 1,
-1.078139, -0.4974718, -4.93902, 1, 0.9294118, 0, 1,
-1.077822, -0.1055763, -2.057925, 1, 0.9372549, 0, 1,
-1.071709, -1.75727, -0.8629656, 1, 0.9411765, 0, 1,
-1.070557, -0.375859, -1.8837, 1, 0.9490196, 0, 1,
-1.069682, 0.3364384, -2.595934, 1, 0.9529412, 0, 1,
-1.063576, -0.8401935, -0.1123855, 1, 0.9607843, 0, 1,
-1.052035, 0.5052785, -0.08434583, 1, 0.9647059, 0, 1,
-1.044815, 0.3895717, -0.2834677, 1, 0.972549, 0, 1,
-1.040532, 0.3241469, -1.356755, 1, 0.9764706, 0, 1,
-1.036929, 0.7694489, -0.9983422, 1, 0.9843137, 0, 1,
-1.035979, -1.152721, -1.517181, 1, 0.9882353, 0, 1,
-1.035523, -1.565023, -2.213065, 1, 0.9960784, 0, 1,
-1.022471, -0.6884831, -2.534581, 0.9960784, 1, 0, 1,
-1.021131, -0.5049484, -3.149769, 0.9921569, 1, 0, 1,
-1.019489, -0.7508439, -1.418641, 0.9843137, 1, 0, 1,
-1.018373, -0.4374981, -3.036764, 0.9803922, 1, 0, 1,
-1.015991, -1.882986, -2.496001, 0.972549, 1, 0, 1,
-1.011847, -1.056232, -2.314764, 0.9686275, 1, 0, 1,
-1.011743, -1.486002, -3.845476, 0.9607843, 1, 0, 1,
-1.009989, 0.737613, -0.08237217, 0.9568627, 1, 0, 1,
-1.007139, 1.191778, -2.161354, 0.9490196, 1, 0, 1,
-1.003217, -0.3342043, -1.843177, 0.945098, 1, 0, 1,
-1.003098, -0.8962539, -0.5443573, 0.9372549, 1, 0, 1,
-1.000078, -0.379698, -3.502536, 0.9333333, 1, 0, 1,
-0.9935646, 0.5286794, -1.445585, 0.9254902, 1, 0, 1,
-0.9931793, 0.01263845, -1.939916, 0.9215686, 1, 0, 1,
-0.9930651, -0.392612, -1.599023, 0.9137255, 1, 0, 1,
-0.9898182, -0.4896778, -2.391279, 0.9098039, 1, 0, 1,
-0.9888372, 0.9284935, 0.9564704, 0.9019608, 1, 0, 1,
-0.98549, 0.7702168, -1.1549, 0.8941177, 1, 0, 1,
-0.9834087, 0.9232021, 1.447993, 0.8901961, 1, 0, 1,
-0.9833416, 0.2284503, -2.300039, 0.8823529, 1, 0, 1,
-0.9788069, 0.5298946, 0.269828, 0.8784314, 1, 0, 1,
-0.9755936, 0.02035739, -1.236828, 0.8705882, 1, 0, 1,
-0.9689562, 0.08081496, -0.1572626, 0.8666667, 1, 0, 1,
-0.9623554, 0.2999338, -1.271302, 0.8588235, 1, 0, 1,
-0.9567593, 0.644384, 0.2842877, 0.854902, 1, 0, 1,
-0.9511917, 2.817019, 1.310776, 0.8470588, 1, 0, 1,
-0.9453844, 1.254643, -0.6159545, 0.8431373, 1, 0, 1,
-0.9361289, -0.9604254, -2.940508, 0.8352941, 1, 0, 1,
-0.9341781, -0.7342413, -0.6462528, 0.8313726, 1, 0, 1,
-0.9325981, -0.134433, -1.19573, 0.8235294, 1, 0, 1,
-0.9280681, -1.848971, -1.472753, 0.8196079, 1, 0, 1,
-0.925794, -1.354289, -1.831879, 0.8117647, 1, 0, 1,
-0.9238597, -1.513805, -2.651459, 0.8078431, 1, 0, 1,
-0.9229028, 0.224232, -0.8463469, 0.8, 1, 0, 1,
-0.9214702, 0.1719219, -1.287408, 0.7921569, 1, 0, 1,
-0.9206009, 1.288952, -1.456396, 0.7882353, 1, 0, 1,
-0.9158532, -1.016809, -2.289834, 0.7803922, 1, 0, 1,
-0.9077958, -0.2441433, -0.5827326, 0.7764706, 1, 0, 1,
-0.9068955, -0.004602519, -1.885412, 0.7686275, 1, 0, 1,
-0.8994635, -0.28933, -2.18025, 0.7647059, 1, 0, 1,
-0.8938321, -0.5325784, -1.405693, 0.7568628, 1, 0, 1,
-0.8936719, -2.177596, -1.143534, 0.7529412, 1, 0, 1,
-0.8899853, -0.5703136, -1.160398, 0.7450981, 1, 0, 1,
-0.8834056, 0.1561046, -1.346725, 0.7411765, 1, 0, 1,
-0.8797473, 0.1915679, -1.156211, 0.7333333, 1, 0, 1,
-0.878337, -2.019048, -3.299075, 0.7294118, 1, 0, 1,
-0.873721, 0.3764732, -1.721805, 0.7215686, 1, 0, 1,
-0.8728107, 0.7854401, -2.149636, 0.7176471, 1, 0, 1,
-0.8694007, -0.8984414, -2.033087, 0.7098039, 1, 0, 1,
-0.8563796, -0.966432, -3.788129, 0.7058824, 1, 0, 1,
-0.8529231, 0.09784119, -3.14886, 0.6980392, 1, 0, 1,
-0.8495722, 0.5256446, -1.500184, 0.6901961, 1, 0, 1,
-0.8454784, 0.475846, -1.712173, 0.6862745, 1, 0, 1,
-0.8447826, 0.4810919, 1.655154, 0.6784314, 1, 0, 1,
-0.8434473, -1.460194, -2.372303, 0.6745098, 1, 0, 1,
-0.8323087, -0.7658441, -2.748318, 0.6666667, 1, 0, 1,
-0.8322536, -1.246508, -3.17754, 0.6627451, 1, 0, 1,
-0.8305328, -1.290119, -2.046331, 0.654902, 1, 0, 1,
-0.8287497, 0.7612652, 0.5369155, 0.6509804, 1, 0, 1,
-0.8285533, -1.633885, -5.812735, 0.6431373, 1, 0, 1,
-0.8229641, 0.2667257, -0.1235081, 0.6392157, 1, 0, 1,
-0.8198661, -0.6295947, -2.160367, 0.6313726, 1, 0, 1,
-0.8186288, -0.8847688, -4.049025, 0.627451, 1, 0, 1,
-0.8147223, 0.5702677, -1.893461, 0.6196079, 1, 0, 1,
-0.8136505, 0.2771801, -1.787987, 0.6156863, 1, 0, 1,
-0.8127683, 0.08098656, -2.363749, 0.6078432, 1, 0, 1,
-0.8015018, 0.06890939, -2.186212, 0.6039216, 1, 0, 1,
-0.80066, 1.618604, -2.038384, 0.5960785, 1, 0, 1,
-0.7971225, -0.457336, -2.748381, 0.5882353, 1, 0, 1,
-0.7967143, 0.3324919, -0.9556254, 0.5843138, 1, 0, 1,
-0.7960235, -0.6545954, -1.427109, 0.5764706, 1, 0, 1,
-0.7959639, 0.7584758, 0.2810296, 0.572549, 1, 0, 1,
-0.7942564, 1.251907, -0.1057914, 0.5647059, 1, 0, 1,
-0.7924483, 1.163764, 0.4039659, 0.5607843, 1, 0, 1,
-0.785055, -0.852169, -4.317521, 0.5529412, 1, 0, 1,
-0.7808369, 1.195332, -3.075032, 0.5490196, 1, 0, 1,
-0.7775692, -1.345892, -3.929242, 0.5411765, 1, 0, 1,
-0.7762272, -0.5617646, -2.56569, 0.5372549, 1, 0, 1,
-0.7692377, -0.06671369, -2.263463, 0.5294118, 1, 0, 1,
-0.7663965, 0.2167068, -0.5970812, 0.5254902, 1, 0, 1,
-0.7653998, -1.142752, -2.849701, 0.5176471, 1, 0, 1,
-0.7642263, -0.0813948, -1.433506, 0.5137255, 1, 0, 1,
-0.7593245, -0.2321104, -0.331427, 0.5058824, 1, 0, 1,
-0.7495033, 0.7018993, -1.973235, 0.5019608, 1, 0, 1,
-0.7469849, -0.9010685, -2.689633, 0.4941176, 1, 0, 1,
-0.7371376, 0.1822492, -0.06114396, 0.4862745, 1, 0, 1,
-0.7285421, -0.4696613, -2.477111, 0.4823529, 1, 0, 1,
-0.72737, 1.360647, 0.09302207, 0.4745098, 1, 0, 1,
-0.7255645, 1.065682, -0.2676414, 0.4705882, 1, 0, 1,
-0.7241331, -0.9925738, -2.755764, 0.4627451, 1, 0, 1,
-0.721825, 0.1067848, -1.950129, 0.4588235, 1, 0, 1,
-0.7206154, 0.02142704, -1.361985, 0.4509804, 1, 0, 1,
-0.7115685, 0.9118155, -2.257929, 0.4470588, 1, 0, 1,
-0.7106358, -0.3155055, -3.188728, 0.4392157, 1, 0, 1,
-0.7088367, 0.4547289, -1.044112, 0.4352941, 1, 0, 1,
-0.7075085, 0.0331113, -3.32758, 0.427451, 1, 0, 1,
-0.7067704, 0.1521372, -3.099661, 0.4235294, 1, 0, 1,
-0.7053438, -0.8065283, -3.154957, 0.4156863, 1, 0, 1,
-0.7041676, -0.1763527, -2.246601, 0.4117647, 1, 0, 1,
-0.6943942, -0.243502, -1.831717, 0.4039216, 1, 0, 1,
-0.6925271, 0.305587, -1.401473, 0.3960784, 1, 0, 1,
-0.6878286, 0.7736802, -0.8167345, 0.3921569, 1, 0, 1,
-0.68637, -1.369207, 0.4772575, 0.3843137, 1, 0, 1,
-0.6822344, -1.304127, -1.671551, 0.3803922, 1, 0, 1,
-0.6781901, 1.419273, -1.33168, 0.372549, 1, 0, 1,
-0.6769567, 0.2151429, -1.564922, 0.3686275, 1, 0, 1,
-0.6769382, 1.601021, 0.781528, 0.3607843, 1, 0, 1,
-0.673836, 0.07563988, -1.386277, 0.3568628, 1, 0, 1,
-0.6732445, -0.6529395, -3.194335, 0.3490196, 1, 0, 1,
-0.6724876, 0.1436898, -1.525537, 0.345098, 1, 0, 1,
-0.6654283, 0.01914789, -0.1934186, 0.3372549, 1, 0, 1,
-0.6640408, -1.270661, -2.308125, 0.3333333, 1, 0, 1,
-0.6633287, -1.875018, -3.14892, 0.3254902, 1, 0, 1,
-0.6548781, -0.3850203, -1.586275, 0.3215686, 1, 0, 1,
-0.6504266, 0.6890401, 1.79582, 0.3137255, 1, 0, 1,
-0.648376, 1.051702, -1.35525, 0.3098039, 1, 0, 1,
-0.6453406, -1.90124, -2.496119, 0.3019608, 1, 0, 1,
-0.6428754, -0.1320126, -4.083524, 0.2941177, 1, 0, 1,
-0.6379394, -0.1378587, -3.464061, 0.2901961, 1, 0, 1,
-0.6337532, -1.112591, -3.80377, 0.282353, 1, 0, 1,
-0.6289948, 1.979817, 1.313994, 0.2784314, 1, 0, 1,
-0.6256558, 0.7428482, -0.0452081, 0.2705882, 1, 0, 1,
-0.6234076, -1.815562, -3.688718, 0.2666667, 1, 0, 1,
-0.6227812, -0.1226789, -1.324273, 0.2588235, 1, 0, 1,
-0.6122456, -0.472687, -1.607449, 0.254902, 1, 0, 1,
-0.5900435, -0.9048822, -0.6513309, 0.2470588, 1, 0, 1,
-0.5842188, 0.4572509, -0.3690874, 0.2431373, 1, 0, 1,
-0.5764818, -1.780304, -2.201064, 0.2352941, 1, 0, 1,
-0.573453, 1.719235, -0.884208, 0.2313726, 1, 0, 1,
-0.5719832, 1.129003, -1.447093, 0.2235294, 1, 0, 1,
-0.5660986, -1.138988, -2.676959, 0.2196078, 1, 0, 1,
-0.5637005, -1.154106, -2.950848, 0.2117647, 1, 0, 1,
-0.562958, -1.079849, -4.745677, 0.2078431, 1, 0, 1,
-0.5618213, 0.4958507, -0.5109997, 0.2, 1, 0, 1,
-0.5578114, -0.7780656, -4.703923, 0.1921569, 1, 0, 1,
-0.5560066, -2.001227, -2.79045, 0.1882353, 1, 0, 1,
-0.5541846, 3.160942, -0.06500852, 0.1803922, 1, 0, 1,
-0.5521554, -0.413832, -0.1585243, 0.1764706, 1, 0, 1,
-0.5508099, 0.1146227, -1.622148, 0.1686275, 1, 0, 1,
-0.5488712, 1.14059, 0.5370731, 0.1647059, 1, 0, 1,
-0.5425151, 0.3075423, -1.673118, 0.1568628, 1, 0, 1,
-0.5309357, 0.7492632, -2.093496, 0.1529412, 1, 0, 1,
-0.5287423, 1.013586, 0.148795, 0.145098, 1, 0, 1,
-0.5284849, 0.04645306, -0.0475852, 0.1411765, 1, 0, 1,
-0.5281324, 0.7869447, 0.8600099, 0.1333333, 1, 0, 1,
-0.5258914, -0.2939173, -3.4351, 0.1294118, 1, 0, 1,
-0.5240247, -0.7479668, -3.891782, 0.1215686, 1, 0, 1,
-0.5225519, -0.7483779, -1.976103, 0.1176471, 1, 0, 1,
-0.5225092, -1.650282, -4.129038, 0.1098039, 1, 0, 1,
-0.5214817, 0.06518726, -2.232446, 0.1058824, 1, 0, 1,
-0.5213866, -0.8650643, -4.268275, 0.09803922, 1, 0, 1,
-0.5196115, -0.5737584, -1.259554, 0.09019608, 1, 0, 1,
-0.5190884, -0.1446765, -2.110961, 0.08627451, 1, 0, 1,
-0.5183474, 0.7889956, 0.5701419, 0.07843138, 1, 0, 1,
-0.5153227, 1.246396, 0.9777691, 0.07450981, 1, 0, 1,
-0.5125042, -0.2355854, -2.546838, 0.06666667, 1, 0, 1,
-0.5121785, 0.4678992, -0.698057, 0.0627451, 1, 0, 1,
-0.5118304, 0.3078791, -1.413814, 0.05490196, 1, 0, 1,
-0.507052, -0.4662215, -0.736827, 0.05098039, 1, 0, 1,
-0.5055414, -1.675256, -2.254546, 0.04313726, 1, 0, 1,
-0.5027868, 0.05727929, -2.089871, 0.03921569, 1, 0, 1,
-0.4979457, 0.4183237, 0.7778294, 0.03137255, 1, 0, 1,
-0.4967871, -0.5210238, -3.673233, 0.02745098, 1, 0, 1,
-0.4954671, -1.039127, -4.951564, 0.01960784, 1, 0, 1,
-0.4819659, 1.469412, -1.868225, 0.01568628, 1, 0, 1,
-0.4758247, -0.02115467, -0.8876686, 0.007843138, 1, 0, 1,
-0.4706959, -2.039772, -3.305087, 0.003921569, 1, 0, 1,
-0.4691671, 0.3674408, -1.282681, 0, 1, 0.003921569, 1,
-0.4689703, 1.267352, -0.4625221, 0, 1, 0.01176471, 1,
-0.4617763, -0.06838863, -0.1811127, 0, 1, 0.01568628, 1,
-0.4613008, -0.6258227, -2.687432, 0, 1, 0.02352941, 1,
-0.4533522, 0.198513, -1.247298, 0, 1, 0.02745098, 1,
-0.45175, -2.002044, -2.198237, 0, 1, 0.03529412, 1,
-0.4508429, -0.7502913, -3.721901, 0, 1, 0.03921569, 1,
-0.4503652, -0.5543042, -3.125262, 0, 1, 0.04705882, 1,
-0.4477816, -0.6081728, -4.019622, 0, 1, 0.05098039, 1,
-0.4440663, -0.9745212, -2.632553, 0, 1, 0.05882353, 1,
-0.4409244, -0.8825909, -3.028506, 0, 1, 0.0627451, 1,
-0.4345967, -0.3187673, -0.6013002, 0, 1, 0.07058824, 1,
-0.4337029, 1.037572, 0.151477, 0, 1, 0.07450981, 1,
-0.4291405, -0.1515336, -1.730536, 0, 1, 0.08235294, 1,
-0.4287384, 1.313038, -0.7384665, 0, 1, 0.08627451, 1,
-0.418179, 0.9975234, -0.4264108, 0, 1, 0.09411765, 1,
-0.4173015, 0.284044, -0.9767472, 0, 1, 0.1019608, 1,
-0.4068957, -0.3428781, -3.165342, 0, 1, 0.1058824, 1,
-0.4061301, 1.33661, -0.3739564, 0, 1, 0.1137255, 1,
-0.4033268, -2.183213, -2.998739, 0, 1, 0.1176471, 1,
-0.4022413, 2.002465, 0.8645576, 0, 1, 0.1254902, 1,
-0.397006, 0.3475566, -0.5807595, 0, 1, 0.1294118, 1,
-0.3957762, -0.7423072, -3.394323, 0, 1, 0.1372549, 1,
-0.3949485, -0.8659638, -4.04513, 0, 1, 0.1411765, 1,
-0.3848614, -1.261426, -3.275276, 0, 1, 0.1490196, 1,
-0.3797777, 1.094394, -1.960971, 0, 1, 0.1529412, 1,
-0.3725261, -0.4846117, -1.451975, 0, 1, 0.1607843, 1,
-0.3719614, 0.5033674, -1.34264, 0, 1, 0.1647059, 1,
-0.3713381, 0.03280124, -2.689246, 0, 1, 0.172549, 1,
-0.363465, 1.122308, 1.313078, 0, 1, 0.1764706, 1,
-0.3624448, -0.7612497, -2.492114, 0, 1, 0.1843137, 1,
-0.3618835, 0.9150085, 0.05895958, 0, 1, 0.1882353, 1,
-0.3614801, -0.09132171, -2.643843, 0, 1, 0.1960784, 1,
-0.3611782, 1.578558, -0.3089566, 0, 1, 0.2039216, 1,
-0.3609467, -0.03562298, -2.643095, 0, 1, 0.2078431, 1,
-0.3574067, -0.4586283, -0.8223125, 0, 1, 0.2156863, 1,
-0.3540885, 0.511796, -1.346693, 0, 1, 0.2196078, 1,
-0.3480252, -1.216675, -2.133488, 0, 1, 0.227451, 1,
-0.3457653, -1.39627, -2.641374, 0, 1, 0.2313726, 1,
-0.3419677, 1.539498, -1.388975, 0, 1, 0.2392157, 1,
-0.341475, 0.8252109, 0.1711889, 0, 1, 0.2431373, 1,
-0.3407779, 1.426049, -0.1701769, 0, 1, 0.2509804, 1,
-0.3400968, 0.3225742, 0.3074968, 0, 1, 0.254902, 1,
-0.3398059, -0.780852, -2.606696, 0, 1, 0.2627451, 1,
-0.3364582, -0.6998498, -2.147364, 0, 1, 0.2666667, 1,
-0.3299037, 0.8971744, 0.1390975, 0, 1, 0.2745098, 1,
-0.3286085, -0.03498537, -1.68545, 0, 1, 0.2784314, 1,
-0.3207007, -0.6437373, -3.005013, 0, 1, 0.2862745, 1,
-0.3193766, -0.2687542, -3.202005, 0, 1, 0.2901961, 1,
-0.3178655, -0.2231984, -1.058695, 0, 1, 0.2980392, 1,
-0.3169585, -1.142648, -1.973025, 0, 1, 0.3058824, 1,
-0.3150368, -0.4253578, -3.326339, 0, 1, 0.3098039, 1,
-0.3134198, 1.384733, -0.4826268, 0, 1, 0.3176471, 1,
-0.3029687, -0.457658, -4.391509, 0, 1, 0.3215686, 1,
-0.2999276, -0.3001724, -3.924087, 0, 1, 0.3294118, 1,
-0.2937135, -1.088036, -3.332122, 0, 1, 0.3333333, 1,
-0.2879661, -1.670296, -2.902625, 0, 1, 0.3411765, 1,
-0.2871858, -0.4864233, -1.094366, 0, 1, 0.345098, 1,
-0.2871442, -0.4060855, -2.118486, 0, 1, 0.3529412, 1,
-0.2808374, 0.3810245, -1.125923, 0, 1, 0.3568628, 1,
-0.2806805, 0.7071339, -0.2245472, 0, 1, 0.3647059, 1,
-0.27794, -0.621038, -2.060966, 0, 1, 0.3686275, 1,
-0.2768572, 0.03170362, -1.322171, 0, 1, 0.3764706, 1,
-0.2763249, -1.696886, -2.374268, 0, 1, 0.3803922, 1,
-0.2746864, 0.09562045, -0.8395872, 0, 1, 0.3882353, 1,
-0.2723834, -0.7515865, -2.792367, 0, 1, 0.3921569, 1,
-0.2719936, 0.05211313, -1.659838, 0, 1, 0.4, 1,
-0.271481, 2.249208, -0.9929982, 0, 1, 0.4078431, 1,
-0.2695589, 1.560794, -1.572592, 0, 1, 0.4117647, 1,
-0.268573, -0.03781171, -2.24348, 0, 1, 0.4196078, 1,
-0.2685215, -0.8284717, -3.681278, 0, 1, 0.4235294, 1,
-0.2658477, -0.6764781, -2.688681, 0, 1, 0.4313726, 1,
-0.2597292, 1.544786, 0.9126236, 0, 1, 0.4352941, 1,
-0.2564242, 0.6003788, -1.846986, 0, 1, 0.4431373, 1,
-0.2524746, -0.4312785, -2.160908, 0, 1, 0.4470588, 1,
-0.2513372, -0.2232262, -2.572581, 0, 1, 0.454902, 1,
-0.2483745, -0.02031336, -1.340905, 0, 1, 0.4588235, 1,
-0.2480171, -0.2124236, -3.506802, 0, 1, 0.4666667, 1,
-0.2476928, 0.7428539, 2.231116, 0, 1, 0.4705882, 1,
-0.2467951, 0.8573457, -0.6251866, 0, 1, 0.4784314, 1,
-0.2439818, 0.7392219, -1.483467, 0, 1, 0.4823529, 1,
-0.2417837, -0.6499953, -3.458394, 0, 1, 0.4901961, 1,
-0.2415251, -0.6899717, -2.096354, 0, 1, 0.4941176, 1,
-0.2411389, -0.5491499, -1.122434, 0, 1, 0.5019608, 1,
-0.2399873, 2.098856, -1.634346, 0, 1, 0.509804, 1,
-0.2370968, 0.5116134, -0.5178888, 0, 1, 0.5137255, 1,
-0.2348482, 0.2159963, -1.348913, 0, 1, 0.5215687, 1,
-0.2296127, 0.1773006, -0.953369, 0, 1, 0.5254902, 1,
-0.229187, -1.021378, -3.192189, 0, 1, 0.5333334, 1,
-0.2289184, 1.471256, -0.03055573, 0, 1, 0.5372549, 1,
-0.2288149, 1.046599, 1.564491, 0, 1, 0.5450981, 1,
-0.2253537, -1.42001, -3.646474, 0, 1, 0.5490196, 1,
-0.2248959, -1.760976, -2.444159, 0, 1, 0.5568628, 1,
-0.2235271, -1.057682, -0.5764793, 0, 1, 0.5607843, 1,
-0.219572, -0.8337941, -1.808787, 0, 1, 0.5686275, 1,
-0.2184071, 0.8696244, -1.219267, 0, 1, 0.572549, 1,
-0.2177447, 1.278291, -0.7585838, 0, 1, 0.5803922, 1,
-0.2152162, -0.003682846, -1.267799, 0, 1, 0.5843138, 1,
-0.2151744, -0.3483417, -4.87626, 0, 1, 0.5921569, 1,
-0.2145858, 1.384523, -1.241197, 0, 1, 0.5960785, 1,
-0.213682, -1.082812, -3.877155, 0, 1, 0.6039216, 1,
-0.2102752, -1.959562, -3.034992, 0, 1, 0.6117647, 1,
-0.2037915, -0.9114196, -2.472872, 0, 1, 0.6156863, 1,
-0.1971048, 0.541167, -0.3162935, 0, 1, 0.6235294, 1,
-0.1961583, 0.6515709, -0.8451835, 0, 1, 0.627451, 1,
-0.1865272, 0.7189643, 1.082992, 0, 1, 0.6352941, 1,
-0.1845709, 0.536895, 1.66968, 0, 1, 0.6392157, 1,
-0.1840487, -1.501969, -1.76512, 0, 1, 0.6470588, 1,
-0.1813536, -0.5044324, -3.604191, 0, 1, 0.6509804, 1,
-0.177371, 0.4970878, -0.06733248, 0, 1, 0.6588235, 1,
-0.1739869, -0.9128832, -4.758331, 0, 1, 0.6627451, 1,
-0.1697551, 0.2860277, -1.590758, 0, 1, 0.6705883, 1,
-0.1638091, 0.6890876, -0.3407634, 0, 1, 0.6745098, 1,
-0.1560232, -0.6908934, -1.09406, 0, 1, 0.682353, 1,
-0.154523, -0.8291661, -1.328139, 0, 1, 0.6862745, 1,
-0.1535703, 0.7212871, -0.5849229, 0, 1, 0.6941177, 1,
-0.1507856, 0.04522643, -0.607972, 0, 1, 0.7019608, 1,
-0.1507792, -0.5078006, -2.25099, 0, 1, 0.7058824, 1,
-0.1506019, 1.006958, -0.9179928, 0, 1, 0.7137255, 1,
-0.1470124, -0.5443661, -1.273928, 0, 1, 0.7176471, 1,
-0.1422174, 0.7742873, 1.371227, 0, 1, 0.7254902, 1,
-0.1410639, 1.648919, -0.1785543, 0, 1, 0.7294118, 1,
-0.1395149, -1.336217, -1.96827, 0, 1, 0.7372549, 1,
-0.1364882, -0.591094, -2.719658, 0, 1, 0.7411765, 1,
-0.1304959, -0.2281056, -4.707236, 0, 1, 0.7490196, 1,
-0.1285822, 0.01941008, -0.5436144, 0, 1, 0.7529412, 1,
-0.1236487, -0.7652279, -1.747878, 0, 1, 0.7607843, 1,
-0.1216, 0.2246521, -1.817024, 0, 1, 0.7647059, 1,
-0.1212998, -0.6329938, -3.247557, 0, 1, 0.772549, 1,
-0.120628, -0.644949, -2.145696, 0, 1, 0.7764706, 1,
-0.1204097, 1.042036, -0.5169103, 0, 1, 0.7843137, 1,
-0.1167428, -1.241008, -3.022049, 0, 1, 0.7882353, 1,
-0.1158958, 0.01068758, -2.682137, 0, 1, 0.7960784, 1,
-0.114846, 1.226661, -1.267154, 0, 1, 0.8039216, 1,
-0.1084063, -1.882644, -1.949437, 0, 1, 0.8078431, 1,
-0.107076, 0.5097306, 1.101122, 0, 1, 0.8156863, 1,
-0.1047298, 0.4138318, -0.7074085, 0, 1, 0.8196079, 1,
-0.1019038, 0.8112833, -0.5657015, 0, 1, 0.827451, 1,
-0.1012172, -0.3683525, -2.501029, 0, 1, 0.8313726, 1,
-0.0965855, 1.324982, 0.3480384, 0, 1, 0.8392157, 1,
-0.09637687, -1.3661, -3.116517, 0, 1, 0.8431373, 1,
-0.08732786, -1.73608, -2.96889, 0, 1, 0.8509804, 1,
-0.08509002, 1.375975, -1.360471, 0, 1, 0.854902, 1,
-0.08321913, -0.02443409, -2.182068, 0, 1, 0.8627451, 1,
-0.08066659, -0.7620066, -2.494959, 0, 1, 0.8666667, 1,
-0.07842052, -1.350142, -4.207375, 0, 1, 0.8745098, 1,
-0.07838399, 0.454849, 1.396905, 0, 1, 0.8784314, 1,
-0.07150391, -1.37934, -1.4327, 0, 1, 0.8862745, 1,
-0.07088488, 0.1525362, -0.6270513, 0, 1, 0.8901961, 1,
-0.06604453, 0.5609317, -0.2072967, 0, 1, 0.8980392, 1,
-0.05806599, 1.148522, -0.4813341, 0, 1, 0.9058824, 1,
-0.05773065, -0.02932361, -1.954778, 0, 1, 0.9098039, 1,
-0.05739447, -0.1943653, -3.376551, 0, 1, 0.9176471, 1,
-0.05490642, 0.6842391, 0.6818834, 0, 1, 0.9215686, 1,
-0.05133177, -0.6083708, -4.654177, 0, 1, 0.9294118, 1,
-0.05084875, 0.06142924, -1.040437, 0, 1, 0.9333333, 1,
-0.04888018, -0.7287342, -0.5941883, 0, 1, 0.9411765, 1,
-0.046119, 0.2765239, -1.136316, 0, 1, 0.945098, 1,
-0.04529084, -1.382939, -2.11119, 0, 1, 0.9529412, 1,
-0.04528174, -0.1572487, -4.154529, 0, 1, 0.9568627, 1,
-0.04520673, -1.884196, -3.651752, 0, 1, 0.9647059, 1,
-0.04473229, 0.5288588, 0.2638051, 0, 1, 0.9686275, 1,
-0.04410129, 0.3916436, -0.03581389, 0, 1, 0.9764706, 1,
-0.04325219, 1.151244, 0.323848, 0, 1, 0.9803922, 1,
-0.03833563, 0.549057, 0.6323185, 0, 1, 0.9882353, 1,
-0.03622883, 2.012935, -0.9852208, 0, 1, 0.9921569, 1,
-0.03044942, 0.1880139, 0.005371632, 0, 1, 1, 1,
-0.02335767, 0.9406613, -0.7720628, 0, 0.9921569, 1, 1,
-0.02275031, -0.1986562, -3.026773, 0, 0.9882353, 1, 1,
-0.02266137, -0.9880154, -2.679762, 0, 0.9803922, 1, 1,
-0.01588095, -0.09108528, -1.894411, 0, 0.9764706, 1, 1,
-0.01299546, -0.6423909, -3.342997, 0, 0.9686275, 1, 1,
-0.008542889, -0.3202834, -3.807456, 0, 0.9647059, 1, 1,
-0.007385733, 1.048185, 0.1056595, 0, 0.9568627, 1, 1,
-0.006063221, 1.117158, -0.2685121, 0, 0.9529412, 1, 1,
-0.004862804, -0.01756498, -2.799121, 0, 0.945098, 1, 1,
-0.004503511, 0.4153949, -0.02190139, 0, 0.9411765, 1, 1,
-0.003177614, 0.9230933, 0.07480388, 0, 0.9333333, 1, 1,
-0.003161945, 0.3669258, 1.253424, 0, 0.9294118, 1, 1,
0.0007354014, 1.078786, -0.1281152, 0, 0.9215686, 1, 1,
0.003793305, 1.435055, -0.01434075, 0, 0.9176471, 1, 1,
0.008838369, 1.014163, -0.9005237, 0, 0.9098039, 1, 1,
0.01078111, -0.5353461, 4.960401, 0, 0.9058824, 1, 1,
0.01411576, 1.190824, -0.2909928, 0, 0.8980392, 1, 1,
0.01528094, 0.5138032, 2.582867, 0, 0.8901961, 1, 1,
0.01544723, 1.015465, 1.498786, 0, 0.8862745, 1, 1,
0.01613672, 0.9769731, -0.4824388, 0, 0.8784314, 1, 1,
0.01793489, -0.1595688, 2.872838, 0, 0.8745098, 1, 1,
0.01957801, -1.160082, 3.887293, 0, 0.8666667, 1, 1,
0.02044847, -0.7123523, 3.145321, 0, 0.8627451, 1, 1,
0.02236877, 0.8688632, 0.369139, 0, 0.854902, 1, 1,
0.02396796, -2.044787, 0.7365741, 0, 0.8509804, 1, 1,
0.02487054, -0.04680732, 1.778582, 0, 0.8431373, 1, 1,
0.02537378, -0.5223581, 1.379469, 0, 0.8392157, 1, 1,
0.02748504, -0.7745737, 3.563421, 0, 0.8313726, 1, 1,
0.02892088, 1.45262, 1.563191, 0, 0.827451, 1, 1,
0.03289615, 0.0110573, 1.018226, 0, 0.8196079, 1, 1,
0.03513403, -0.3371568, 3.471322, 0, 0.8156863, 1, 1,
0.0352357, 0.3974054, 0.4650861, 0, 0.8078431, 1, 1,
0.03584432, 0.6470433, -0.8884184, 0, 0.8039216, 1, 1,
0.04105901, -1.491518, 3.152658, 0, 0.7960784, 1, 1,
0.04162724, 0.7472266, -1.228557, 0, 0.7882353, 1, 1,
0.04330795, 1.433405, -0.472919, 0, 0.7843137, 1, 1,
0.04906484, 0.9794121, 1.67487, 0, 0.7764706, 1, 1,
0.0493433, -1.37114, 2.231652, 0, 0.772549, 1, 1,
0.04981757, 0.3365059, -0.105744, 0, 0.7647059, 1, 1,
0.05569962, 0.2036656, 1.339568, 0, 0.7607843, 1, 1,
0.05616977, -0.9129424, 4.03084, 0, 0.7529412, 1, 1,
0.0610437, 1.348098, 1.086061, 0, 0.7490196, 1, 1,
0.06330652, 0.1539505, 0.5254118, 0, 0.7411765, 1, 1,
0.06715687, -0.6208947, 2.494193, 0, 0.7372549, 1, 1,
0.06984586, -0.6858519, 3.227093, 0, 0.7294118, 1, 1,
0.08667751, 0.01309797, 1.002288, 0, 0.7254902, 1, 1,
0.088287, 1.088034, 0.003769177, 0, 0.7176471, 1, 1,
0.08865596, 1.242947, -0.6818699, 0, 0.7137255, 1, 1,
0.09190125, 0.9841915, -0.7486024, 0, 0.7058824, 1, 1,
0.09191504, 1.982613, -0.04694601, 0, 0.6980392, 1, 1,
0.09613507, 1.281179, 0.5028707, 0, 0.6941177, 1, 1,
0.1045556, 0.02743871, 0.8212731, 0, 0.6862745, 1, 1,
0.1074596, -0.6567014, 4.794305, 0, 0.682353, 1, 1,
0.1094731, -1.49635, 3.591976, 0, 0.6745098, 1, 1,
0.1097709, -1.781083, 1.246825, 0, 0.6705883, 1, 1,
0.1099176, 0.4178053, 0.1882987, 0, 0.6627451, 1, 1,
0.113236, -0.08098307, 1.736934, 0, 0.6588235, 1, 1,
0.1155003, -0.140264, 4.371579, 0, 0.6509804, 1, 1,
0.1170088, 0.395315, -0.8033429, 0, 0.6470588, 1, 1,
0.1170351, -1.341302, 2.323961, 0, 0.6392157, 1, 1,
0.1199825, -1.399252, 3.340039, 0, 0.6352941, 1, 1,
0.1204399, 0.6929898, -1.824863, 0, 0.627451, 1, 1,
0.1222117, 2.29502, 0.4007906, 0, 0.6235294, 1, 1,
0.1240064, -0.369162, 2.369249, 0, 0.6156863, 1, 1,
0.1266347, -0.01349678, 2.347752, 0, 0.6117647, 1, 1,
0.1318913, 0.3759113, 0.1720156, 0, 0.6039216, 1, 1,
0.1320673, 0.1137765, 1.828586, 0, 0.5960785, 1, 1,
0.1323133, -0.8600666, 2.12269, 0, 0.5921569, 1, 1,
0.1380786, -0.979202, 2.425522, 0, 0.5843138, 1, 1,
0.1393999, 0.6709584, -1.131247, 0, 0.5803922, 1, 1,
0.1427509, 1.344137, -0.3930887, 0, 0.572549, 1, 1,
0.1469489, 0.907228, 0.3820582, 0, 0.5686275, 1, 1,
0.1494091, -0.4153068, 2.826868, 0, 0.5607843, 1, 1,
0.1499463, 0.4945808, 0.9732598, 0, 0.5568628, 1, 1,
0.1543046, 0.5362791, 0.1500802, 0, 0.5490196, 1, 1,
0.1550959, -1.872404, 1.89086, 0, 0.5450981, 1, 1,
0.1553037, 0.4073277, 0.7876353, 0, 0.5372549, 1, 1,
0.1604709, 0.343206, 0.7870992, 0, 0.5333334, 1, 1,
0.1652337, 0.6569098, -0.4581089, 0, 0.5254902, 1, 1,
0.1693408, 1.021177, -0.2839914, 0, 0.5215687, 1, 1,
0.1695334, -0.8609636, 2.559624, 0, 0.5137255, 1, 1,
0.1702134, -0.3156631, 3.39284, 0, 0.509804, 1, 1,
0.1714312, 0.05040433, 3.903156, 0, 0.5019608, 1, 1,
0.1717438, 1.293137, 0.9172909, 0, 0.4941176, 1, 1,
0.173089, -0.3182837, 1.160326, 0, 0.4901961, 1, 1,
0.1783182, -0.1601946, 3.629556, 0, 0.4823529, 1, 1,
0.1827989, 1.946744, 0.4883712, 0, 0.4784314, 1, 1,
0.1829037, 0.8930022, -0.04637249, 0, 0.4705882, 1, 1,
0.1831238, -0.7557922, 3.426685, 0, 0.4666667, 1, 1,
0.1863904, 0.1270502, 1.085602, 0, 0.4588235, 1, 1,
0.1886971, 1.070609, 0.9610301, 0, 0.454902, 1, 1,
0.1904604, -0.5401403, 0.3675365, 0, 0.4470588, 1, 1,
0.1908779, -0.2379472, 3.937402, 0, 0.4431373, 1, 1,
0.1942939, 0.3049145, 0.04954958, 0, 0.4352941, 1, 1,
0.2010951, -0.1096131, 1.893346, 0, 0.4313726, 1, 1,
0.2033937, 0.8183889, -0.4992551, 0, 0.4235294, 1, 1,
0.2076335, 1.038474, 0.96543, 0, 0.4196078, 1, 1,
0.2076717, 1.413115, 0.4395346, 0, 0.4117647, 1, 1,
0.208191, -1.087554, 3.538149, 0, 0.4078431, 1, 1,
0.2092094, 0.557233, 0.8049734, 0, 0.4, 1, 1,
0.210917, 1.481812, 1.295576, 0, 0.3921569, 1, 1,
0.2117439, 0.7086202, -0.50408, 0, 0.3882353, 1, 1,
0.2134185, 1.625363, 1.205846, 0, 0.3803922, 1, 1,
0.2211196, 0.3875539, -0.2708375, 0, 0.3764706, 1, 1,
0.2256627, 1.090975, -0.9313623, 0, 0.3686275, 1, 1,
0.2294989, -0.3349991, 0.9994622, 0, 0.3647059, 1, 1,
0.2300387, -0.8104271, 1.993892, 0, 0.3568628, 1, 1,
0.2308984, -0.09871514, 1.626807, 0, 0.3529412, 1, 1,
0.2337233, 1.109941, 0.9302665, 0, 0.345098, 1, 1,
0.2351104, -2.355563, 3.607811, 0, 0.3411765, 1, 1,
0.2365603, 1.60867, -0.8077255, 0, 0.3333333, 1, 1,
0.237497, -2.4999, 3.032283, 0, 0.3294118, 1, 1,
0.2388102, 0.7189652, -0.04842715, 0, 0.3215686, 1, 1,
0.2456566, 0.4624098, 0.2351018, 0, 0.3176471, 1, 1,
0.2460517, -0.2577741, 3.127708, 0, 0.3098039, 1, 1,
0.2468655, 2.117668, -0.01796563, 0, 0.3058824, 1, 1,
0.249296, 1.544449, 1.96358, 0, 0.2980392, 1, 1,
0.2537405, -0.5405248, 2.661539, 0, 0.2901961, 1, 1,
0.2546619, -1.159655, 2.996644, 0, 0.2862745, 1, 1,
0.2547266, -0.1339556, 1.79495, 0, 0.2784314, 1, 1,
0.2588251, -0.7090675, 4.725985, 0, 0.2745098, 1, 1,
0.2624733, 0.6660118, 0.6572783, 0, 0.2666667, 1, 1,
0.2651724, 1.929933, -0.8443355, 0, 0.2627451, 1, 1,
0.2670249, 1.39976, -1.102567, 0, 0.254902, 1, 1,
0.271678, -0.5206028, 3.344164, 0, 0.2509804, 1, 1,
0.2733639, 0.003533066, 3.837068, 0, 0.2431373, 1, 1,
0.2734101, -1.543431, 2.407471, 0, 0.2392157, 1, 1,
0.2802446, -1.938035, 2.659588, 0, 0.2313726, 1, 1,
0.2804112, -0.4992275, 2.583753, 0, 0.227451, 1, 1,
0.287438, -1.113536, 1.862623, 0, 0.2196078, 1, 1,
0.2876119, 1.740069, 1.491266, 0, 0.2156863, 1, 1,
0.2893876, 0.208938, 1.627448, 0, 0.2078431, 1, 1,
0.2944235, 1.110246, 0.03949943, 0, 0.2039216, 1, 1,
0.2959539, -1.091052, 3.158065, 0, 0.1960784, 1, 1,
0.2962512, -0.3073703, 0.4117075, 0, 0.1882353, 1, 1,
0.2978744, 0.2787067, -0.405952, 0, 0.1843137, 1, 1,
0.2987866, -2.729844, 3.850183, 0, 0.1764706, 1, 1,
0.3001696, -0.04765286, 0.9972519, 0, 0.172549, 1, 1,
0.3016132, -0.4962241, 2.77997, 0, 0.1647059, 1, 1,
0.3021784, -1.16578, 3.352489, 0, 0.1607843, 1, 1,
0.3030709, -1.374675, 4.638481, 0, 0.1529412, 1, 1,
0.3050538, 2.665565, 1.789375, 0, 0.1490196, 1, 1,
0.3054688, -0.04297571, 1.613848, 0, 0.1411765, 1, 1,
0.3055865, 0.4987039, 1.486968, 0, 0.1372549, 1, 1,
0.3094487, -0.4115682, 3.676613, 0, 0.1294118, 1, 1,
0.32815, -0.1859277, 2.777483, 0, 0.1254902, 1, 1,
0.3286911, 0.3868462, 1.06728, 0, 0.1176471, 1, 1,
0.334599, 0.1381616, 0.9322882, 0, 0.1137255, 1, 1,
0.3356167, -1.726493, 3.563627, 0, 0.1058824, 1, 1,
0.3363881, 0.7022053, 1.647428, 0, 0.09803922, 1, 1,
0.3401389, 0.9127411, 1.180821, 0, 0.09411765, 1, 1,
0.3406834, 0.7582263, 2.958324, 0, 0.08627451, 1, 1,
0.340787, 1.896824, -1.316487, 0, 0.08235294, 1, 1,
0.3411144, 0.07030117, 2.518889, 0, 0.07450981, 1, 1,
0.3438866, -1.19674, 3.005487, 0, 0.07058824, 1, 1,
0.3464903, 1.492854, 0.1515055, 0, 0.0627451, 1, 1,
0.3523592, 0.4098265, 1.617769, 0, 0.05882353, 1, 1,
0.3572099, -1.827162, 4.025826, 0, 0.05098039, 1, 1,
0.3642256, 0.08024127, 1.820446, 0, 0.04705882, 1, 1,
0.364533, -0.8859932, 4.416587, 0, 0.03921569, 1, 1,
0.3654712, -0.7338094, 1.403684, 0, 0.03529412, 1, 1,
0.3666202, -1.210913, 3.604836, 0, 0.02745098, 1, 1,
0.3670062, -0.3761303, 3.564784, 0, 0.02352941, 1, 1,
0.3695663, 1.30325, 1.713743, 0, 0.01568628, 1, 1,
0.3725702, 1.704212, 0.2477727, 0, 0.01176471, 1, 1,
0.3738316, 0.6875944, 0.4062271, 0, 0.003921569, 1, 1,
0.3751678, -0.4019118, 3.94634, 0.003921569, 0, 1, 1,
0.3757183, 0.8027034, -1.258507, 0.007843138, 0, 1, 1,
0.377723, 0.7663368, 0.7407065, 0.01568628, 0, 1, 1,
0.3785329, -0.6192027, 1.906996, 0.01960784, 0, 1, 1,
0.3801808, 0.2082054, 0.3841449, 0.02745098, 0, 1, 1,
0.3922189, 0.3674158, 1.37223, 0.03137255, 0, 1, 1,
0.3930304, -0.3491472, 2.755823, 0.03921569, 0, 1, 1,
0.3984786, -0.1421469, 2.014423, 0.04313726, 0, 1, 1,
0.3997896, 0.1923999, 1.152518, 0.05098039, 0, 1, 1,
0.4020488, -1.904651, 1.553587, 0.05490196, 0, 1, 1,
0.4051216, 0.7515839, 1.061012, 0.0627451, 0, 1, 1,
0.4125617, 0.6983536, 1.119008, 0.06666667, 0, 1, 1,
0.4128283, 0.3498656, 0.9034446, 0.07450981, 0, 1, 1,
0.4154323, 1.407818, -1.610573, 0.07843138, 0, 1, 1,
0.4157681, 0.7059121, 1.739516, 0.08627451, 0, 1, 1,
0.4207104, -0.3342917, 2.954226, 0.09019608, 0, 1, 1,
0.4230907, 0.6492618, 1.04244, 0.09803922, 0, 1, 1,
0.4256801, 0.1161204, 0.7171369, 0.1058824, 0, 1, 1,
0.4266446, -0.784465, 3.317624, 0.1098039, 0, 1, 1,
0.4285132, -0.4714153, 2.903952, 0.1176471, 0, 1, 1,
0.4331668, -0.960731, 3.422748, 0.1215686, 0, 1, 1,
0.433995, 0.8366536, 0.3724312, 0.1294118, 0, 1, 1,
0.4381392, 0.5360393, 0.2463135, 0.1333333, 0, 1, 1,
0.4413089, 0.294139, 2.327752, 0.1411765, 0, 1, 1,
0.4419601, 0.6188397, 2.772332, 0.145098, 0, 1, 1,
0.4438947, 0.02197288, 0.4196781, 0.1529412, 0, 1, 1,
0.4459122, 0.02600257, 1.600014, 0.1568628, 0, 1, 1,
0.4526417, -0.07004296, 0.8292952, 0.1647059, 0, 1, 1,
0.4540555, -0.3361464, 2.45886, 0.1686275, 0, 1, 1,
0.4544802, 0.4576966, 2.065962, 0.1764706, 0, 1, 1,
0.4553873, -0.2009195, 2.856512, 0.1803922, 0, 1, 1,
0.4557951, 0.6728953, -0.8845107, 0.1882353, 0, 1, 1,
0.4565234, -0.9235646, 3.950351, 0.1921569, 0, 1, 1,
0.4623235, 0.8385926, 1.497703, 0.2, 0, 1, 1,
0.4678127, -0.6309806, 2.737096, 0.2078431, 0, 1, 1,
0.4695008, -2.197403, 2.782198, 0.2117647, 0, 1, 1,
0.474049, 0.07097535, 2.163015, 0.2196078, 0, 1, 1,
0.4794603, -0.5906596, 2.555211, 0.2235294, 0, 1, 1,
0.4853195, -0.03314662, 2.572911, 0.2313726, 0, 1, 1,
0.4867777, -0.4859355, 1.548535, 0.2352941, 0, 1, 1,
0.4870602, -0.7862221, 4.284027, 0.2431373, 0, 1, 1,
0.493325, 0.8321212, 1.073072, 0.2470588, 0, 1, 1,
0.4948095, 0.02037162, -0.5150725, 0.254902, 0, 1, 1,
0.498891, -1.569164, 3.127802, 0.2588235, 0, 1, 1,
0.5006824, 0.2159452, 1.898638, 0.2666667, 0, 1, 1,
0.5014964, 0.191557, 1.611823, 0.2705882, 0, 1, 1,
0.5023118, 1.143625, 1.059308, 0.2784314, 0, 1, 1,
0.5032459, 0.8500608, 0.7553625, 0.282353, 0, 1, 1,
0.5052022, -0.9780661, 3.64819, 0.2901961, 0, 1, 1,
0.5064725, 1.16389, 1.388662, 0.2941177, 0, 1, 1,
0.5131788, -0.4872163, 1.500466, 0.3019608, 0, 1, 1,
0.5271176, 0.505103, 0.6949617, 0.3098039, 0, 1, 1,
0.528956, -0.5736646, 2.190155, 0.3137255, 0, 1, 1,
0.5332657, 0.02404021, -0.001614425, 0.3215686, 0, 1, 1,
0.5344283, 0.8137217, 2.89761, 0.3254902, 0, 1, 1,
0.5440294, -0.4179945, 0.6553751, 0.3333333, 0, 1, 1,
0.5449663, 1.257743, 0.1130063, 0.3372549, 0, 1, 1,
0.5458391, 2.880298, 0.8234509, 0.345098, 0, 1, 1,
0.5462434, -1.287605, 3.849149, 0.3490196, 0, 1, 1,
0.5489861, -0.8236801, 2.842877, 0.3568628, 0, 1, 1,
0.5519789, -0.1203164, 1.479587, 0.3607843, 0, 1, 1,
0.5529264, -1.351794, 3.069899, 0.3686275, 0, 1, 1,
0.5530796, -0.2866559, 2.358209, 0.372549, 0, 1, 1,
0.553284, -0.6765168, 1.115587, 0.3803922, 0, 1, 1,
0.5598952, -0.8590651, 2.446307, 0.3843137, 0, 1, 1,
0.5664237, -2.207428, 2.550211, 0.3921569, 0, 1, 1,
0.5671363, 1.115435, -0.3541757, 0.3960784, 0, 1, 1,
0.5694562, 0.1204204, 2.722991, 0.4039216, 0, 1, 1,
0.57696, -0.943398, 3.334462, 0.4117647, 0, 1, 1,
0.577795, -1.303226, 2.533645, 0.4156863, 0, 1, 1,
0.578551, 0.5585076, 2.233851, 0.4235294, 0, 1, 1,
0.5813423, 2.658088, 1.627503, 0.427451, 0, 1, 1,
0.581882, 3.497513, -1.249387, 0.4352941, 0, 1, 1,
0.583107, 0.06965463, 1.436091, 0.4392157, 0, 1, 1,
0.5840755, 1.767112, -1.077183, 0.4470588, 0, 1, 1,
0.5888665, 0.7635145, -0.6648179, 0.4509804, 0, 1, 1,
0.5986805, 0.5109119, -1.227406, 0.4588235, 0, 1, 1,
0.6028029, 0.6597562, 1.322505, 0.4627451, 0, 1, 1,
0.6042838, -0.5606477, 3.147146, 0.4705882, 0, 1, 1,
0.6048664, 0.6149734, 0.2428131, 0.4745098, 0, 1, 1,
0.6055645, 0.3220782, 0.8915514, 0.4823529, 0, 1, 1,
0.6145874, -1.03479, 1.243407, 0.4862745, 0, 1, 1,
0.6151589, -0.7062316, 1.561409, 0.4941176, 0, 1, 1,
0.6186963, -0.6593289, 2.233554, 0.5019608, 0, 1, 1,
0.6207182, -0.1775073, 1.017773, 0.5058824, 0, 1, 1,
0.625043, 0.4069585, 0.1649477, 0.5137255, 0, 1, 1,
0.6261021, 1.730285, -0.2292466, 0.5176471, 0, 1, 1,
0.6307414, 1.187487, 0.4095628, 0.5254902, 0, 1, 1,
0.6347945, -0.756272, 1.724831, 0.5294118, 0, 1, 1,
0.6349831, 0.8747233, 1.050919, 0.5372549, 0, 1, 1,
0.6376178, -0.5131517, 2.488283, 0.5411765, 0, 1, 1,
0.6415287, 0.9312936, 1.211883, 0.5490196, 0, 1, 1,
0.6435713, 0.8582355, -0.3390592, 0.5529412, 0, 1, 1,
0.6439958, 0.2222486, 1.635869, 0.5607843, 0, 1, 1,
0.6453558, -1.619089, 2.736646, 0.5647059, 0, 1, 1,
0.6480109, -1.115073, 1.041212, 0.572549, 0, 1, 1,
0.6499987, -1.645106, 2.458684, 0.5764706, 0, 1, 1,
0.6525269, 0.5883466, 0.1877284, 0.5843138, 0, 1, 1,
0.6571378, -1.168106, 1.868377, 0.5882353, 0, 1, 1,
0.6651577, 0.9222127, 1.801777, 0.5960785, 0, 1, 1,
0.6658495, -1.092994, 1.669473, 0.6039216, 0, 1, 1,
0.6668901, 0.3415511, 1.507891, 0.6078432, 0, 1, 1,
0.6696852, -1.229295, 2.166403, 0.6156863, 0, 1, 1,
0.6700611, -0.178738, 3.768692, 0.6196079, 0, 1, 1,
0.6730905, -0.387246, 2.99487, 0.627451, 0, 1, 1,
0.6735377, -0.05586495, 3.458767, 0.6313726, 0, 1, 1,
0.6744065, -0.2796247, 2.468735, 0.6392157, 0, 1, 1,
0.6751275, -2.044976, 2.985568, 0.6431373, 0, 1, 1,
0.6753608, 0.9480004, 0.5636265, 0.6509804, 0, 1, 1,
0.6828634, -0.4741297, 3.376306, 0.654902, 0, 1, 1,
0.6829684, -1.21185, 3.441085, 0.6627451, 0, 1, 1,
0.6843255, 2.332542, -0.5263947, 0.6666667, 0, 1, 1,
0.6970106, -0.5772294, 3.448106, 0.6745098, 0, 1, 1,
0.6984877, -1.0962, 2.966199, 0.6784314, 0, 1, 1,
0.6997644, -0.8789993, 2.409332, 0.6862745, 0, 1, 1,
0.6999376, 0.1746235, 1.686062, 0.6901961, 0, 1, 1,
0.7233713, -0.1670377, 3.416429, 0.6980392, 0, 1, 1,
0.7235686, 0.1434415, 3.002062, 0.7058824, 0, 1, 1,
0.7254925, -1.89839, 2.872095, 0.7098039, 0, 1, 1,
0.727179, -3.190522, 2.759773, 0.7176471, 0, 1, 1,
0.7337329, 0.8040944, 1.288977, 0.7215686, 0, 1, 1,
0.7349446, -0.09832788, 2.381462, 0.7294118, 0, 1, 1,
0.7358792, 1.777128, 3.00745, 0.7333333, 0, 1, 1,
0.738235, 0.482273, -0.06091598, 0.7411765, 0, 1, 1,
0.7405275, -0.6976326, 1.590479, 0.7450981, 0, 1, 1,
0.7413502, 0.3010725, 0.1462688, 0.7529412, 0, 1, 1,
0.7453223, -1.254748, 1.298, 0.7568628, 0, 1, 1,
0.7561616, -0.8595496, 4.515122, 0.7647059, 0, 1, 1,
0.7562129, -0.3965, 2.262962, 0.7686275, 0, 1, 1,
0.7571247, -1.255919, 3.745228, 0.7764706, 0, 1, 1,
0.7580243, 0.3957215, 1.744493, 0.7803922, 0, 1, 1,
0.7584136, 0.1970505, 1.513834, 0.7882353, 0, 1, 1,
0.7591484, 0.6653261, 1.321597, 0.7921569, 0, 1, 1,
0.7601524, 0.03253336, 0.5187792, 0.8, 0, 1, 1,
0.7672028, -0.7607163, 2.471459, 0.8078431, 0, 1, 1,
0.771807, 0.1715845, 1.71898, 0.8117647, 0, 1, 1,
0.7744783, 0.3819978, 2.024308, 0.8196079, 0, 1, 1,
0.775771, 0.91311, 1.833879, 0.8235294, 0, 1, 1,
0.7799522, 0.3082781, 0.3657149, 0.8313726, 0, 1, 1,
0.7818813, -0.6629313, 2.952473, 0.8352941, 0, 1, 1,
0.78491, -0.7559935, 0.7076523, 0.8431373, 0, 1, 1,
0.790839, -0.2627428, 2.816324, 0.8470588, 0, 1, 1,
0.7950541, 2.129007, 0.5841694, 0.854902, 0, 1, 1,
0.7990221, 0.4281531, -0.8370649, 0.8588235, 0, 1, 1,
0.8011394, -0.3550802, 1.153823, 0.8666667, 0, 1, 1,
0.8040959, -0.1348617, 3.836897, 0.8705882, 0, 1, 1,
0.8066589, 0.763422, -0.9498592, 0.8784314, 0, 1, 1,
0.8067361, -0.2759911, 1.55351, 0.8823529, 0, 1, 1,
0.8071966, -0.2045656, 3.088764, 0.8901961, 0, 1, 1,
0.8085118, 1.16849, 2.268002, 0.8941177, 0, 1, 1,
0.8089685, -0.07186984, 2.369274, 0.9019608, 0, 1, 1,
0.8123319, -0.7581384, 2.292942, 0.9098039, 0, 1, 1,
0.8126223, 0.2990411, 1.207594, 0.9137255, 0, 1, 1,
0.8131637, -0.9548504, 4.350331, 0.9215686, 0, 1, 1,
0.8136253, -1.174314, -0.03126429, 0.9254902, 0, 1, 1,
0.8236118, 1.631126, 0.7112757, 0.9333333, 0, 1, 1,
0.8248508, 1.000186, 2.299067, 0.9372549, 0, 1, 1,
0.8265603, -1.072851, 1.536633, 0.945098, 0, 1, 1,
0.835936, 0.003265149, 2.425225, 0.9490196, 0, 1, 1,
0.8382559, -0.468223, 1.930327, 0.9568627, 0, 1, 1,
0.8402606, 0.1015286, 1.056493, 0.9607843, 0, 1, 1,
0.8441006, -0.3146193, 1.038075, 0.9686275, 0, 1, 1,
0.8442887, 0.6679121, 0.4207827, 0.972549, 0, 1, 1,
0.8443369, 0.9172239, -0.350174, 0.9803922, 0, 1, 1,
0.8445489, 1.297257, 1.073893, 0.9843137, 0, 1, 1,
0.8447831, -0.9679599, 2.053071, 0.9921569, 0, 1, 1,
0.8501598, -1.448787, 4.009578, 0.9960784, 0, 1, 1,
0.8511074, -0.1644064, 3.499442, 1, 0, 0.9960784, 1,
0.8549914, -0.4530085, 2.529403, 1, 0, 0.9882353, 1,
0.8571026, -1.003666, 2.611425, 1, 0, 0.9843137, 1,
0.8654683, -2.255803, 3.145307, 1, 0, 0.9764706, 1,
0.867256, 1.251784, 0.7334558, 1, 0, 0.972549, 1,
0.8708483, -0.09430113, 2.604117, 1, 0, 0.9647059, 1,
0.8761773, 0.2303756, 1.614746, 1, 0, 0.9607843, 1,
0.8767221, -0.1326574, 1.522413, 1, 0, 0.9529412, 1,
0.8774312, -1.323536, 2.803812, 1, 0, 0.9490196, 1,
0.8784325, 2.722042, 1.956456, 1, 0, 0.9411765, 1,
0.8835742, 1.09988, 0.4174868, 1, 0, 0.9372549, 1,
0.8852867, -0.8121848, 1.429446, 1, 0, 0.9294118, 1,
0.9001405, -1.583373, 1.401511, 1, 0, 0.9254902, 1,
0.9003123, 1.839227, -0.4841988, 1, 0, 0.9176471, 1,
0.9043146, 0.1909387, 0.0623164, 1, 0, 0.9137255, 1,
0.9104879, 0.1229832, 2.17536, 1, 0, 0.9058824, 1,
0.9280601, 0.9849908, 0.6547546, 1, 0, 0.9019608, 1,
0.9372538, 1.401206, 0.7916132, 1, 0, 0.8941177, 1,
0.9391757, -1.292989, 2.353862, 1, 0, 0.8862745, 1,
0.9398732, 0.2146558, 0.05134279, 1, 0, 0.8823529, 1,
0.9435014, -0.8617017, 1.749528, 1, 0, 0.8745098, 1,
0.9469362, -0.6814456, 1.078224, 1, 0, 0.8705882, 1,
0.9488887, 0.8238608, 1.249042, 1, 0, 0.8627451, 1,
0.9578484, -1.019976, 3.909044, 1, 0, 0.8588235, 1,
0.9714708, 1.388114, -0.516361, 1, 0, 0.8509804, 1,
0.9807646, -0.3625258, 2.462152, 1, 0, 0.8470588, 1,
0.9833882, -2.309954, 1.801052, 1, 0, 0.8392157, 1,
0.983803, 0.2970755, 0.5138448, 1, 0, 0.8352941, 1,
0.9866096, -1.319798, 2.649404, 1, 0, 0.827451, 1,
0.992136, -0.5346761, 2.715948, 1, 0, 0.8235294, 1,
0.9932508, 0.9236633, 0.719834, 1, 0, 0.8156863, 1,
0.9941457, 1.163449, 0.05918968, 1, 0, 0.8117647, 1,
0.9962941, -0.8560047, 2.551191, 1, 0, 0.8039216, 1,
1.003646, -0.5533797, 0.1608946, 1, 0, 0.7960784, 1,
1.003996, 0.05494351, 1.760765, 1, 0, 0.7921569, 1,
1.005276, 0.04650756, 1.407777, 1, 0, 0.7843137, 1,
1.00583, -0.3428783, 1.231783, 1, 0, 0.7803922, 1,
1.024939, -0.3574927, 2.854901, 1, 0, 0.772549, 1,
1.030886, -1.662376, 2.240022, 1, 0, 0.7686275, 1,
1.035778, 1.444153, 0.4490268, 1, 0, 0.7607843, 1,
1.05045, 0.5702152, 0.8880711, 1, 0, 0.7568628, 1,
1.051358, 1.089861, 1.061936, 1, 0, 0.7490196, 1,
1.052251, -0.07309874, 1.207626, 1, 0, 0.7450981, 1,
1.05266, -0.3866287, 3.332683, 1, 0, 0.7372549, 1,
1.057916, -0.6699789, 1.078076, 1, 0, 0.7333333, 1,
1.05929, -1.791829, 2.862762, 1, 0, 0.7254902, 1,
1.062171, -0.2847884, 3.030576, 1, 0, 0.7215686, 1,
1.071329, 0.3537916, 2.093978, 1, 0, 0.7137255, 1,
1.077474, -1.447127, 1.510539, 1, 0, 0.7098039, 1,
1.099465, 0.6018928, 1.540699, 1, 0, 0.7019608, 1,
1.103415, 1.689707, -1.569004, 1, 0, 0.6941177, 1,
1.10679, -1.20366, 3.788182, 1, 0, 0.6901961, 1,
1.109138, 0.8534307, 0.3305777, 1, 0, 0.682353, 1,
1.111289, -0.3866068, 2.255667, 1, 0, 0.6784314, 1,
1.117905, -0.6963963, 2.905797, 1, 0, 0.6705883, 1,
1.13103, -0.885187, 2.73812, 1, 0, 0.6666667, 1,
1.134363, -1.919978, 2.613146, 1, 0, 0.6588235, 1,
1.135884, -0.4267127, 2.686288, 1, 0, 0.654902, 1,
1.149781, 0.5472951, 1.75702, 1, 0, 0.6470588, 1,
1.152829, 1.021949, 0.0980233, 1, 0, 0.6431373, 1,
1.154615, 0.2110458, 1.31792, 1, 0, 0.6352941, 1,
1.161562, 0.1188931, 1.222565, 1, 0, 0.6313726, 1,
1.167612, 0.71513, 0.6604641, 1, 0, 0.6235294, 1,
1.169094, 0.3768152, 2.086992, 1, 0, 0.6196079, 1,
1.171535, 0.1893229, 0.8606021, 1, 0, 0.6117647, 1,
1.191633, 0.5885204, 3.619921, 1, 0, 0.6078432, 1,
1.2008, 0.1031944, 2.336436, 1, 0, 0.6, 1,
1.202344, -0.1151169, 1.546435, 1, 0, 0.5921569, 1,
1.218961, 0.6854219, -1.20952, 1, 0, 0.5882353, 1,
1.220059, 0.2623132, -0.8027105, 1, 0, 0.5803922, 1,
1.226579, -0.9850184, 2.414243, 1, 0, 0.5764706, 1,
1.228301, 0.8736853, 0.4747878, 1, 0, 0.5686275, 1,
1.235876, -0.03948974, 0.1052766, 1, 0, 0.5647059, 1,
1.241718, 0.5732345, 0.7944756, 1, 0, 0.5568628, 1,
1.249936, 0.9274633, 1.648, 1, 0, 0.5529412, 1,
1.253724, -0.6278633, 1.858973, 1, 0, 0.5450981, 1,
1.266214, 1.651951, 1.32099, 1, 0, 0.5411765, 1,
1.271577, -0.7687134, 1.669158, 1, 0, 0.5333334, 1,
1.275016, -0.6284522, 1.69896, 1, 0, 0.5294118, 1,
1.285881, 1.936012, 0.2966352, 1, 0, 0.5215687, 1,
1.288055, -0.007429861, 1.56205, 1, 0, 0.5176471, 1,
1.289655, 1.111881, 1.55544, 1, 0, 0.509804, 1,
1.299563, -1.328571, 2.245891, 1, 0, 0.5058824, 1,
1.300519, 1.551483, 0.822656, 1, 0, 0.4980392, 1,
1.30555, -0.1260172, -0.3554835, 1, 0, 0.4901961, 1,
1.309814, 0.5037943, 3.029495, 1, 0, 0.4862745, 1,
1.310788, -0.111882, 0.1662513, 1, 0, 0.4784314, 1,
1.334319, 0.5524605, 1.187736, 1, 0, 0.4745098, 1,
1.341577, 0.2340152, 0.00166123, 1, 0, 0.4666667, 1,
1.342847, 1.487417, 2.242649, 1, 0, 0.4627451, 1,
1.349961, -0.5936769, 1.080767, 1, 0, 0.454902, 1,
1.360644, -0.3698699, 1.824853, 1, 0, 0.4509804, 1,
1.371095, -0.9449112, -0.07301932, 1, 0, 0.4431373, 1,
1.375022, 1.403871, -0.1829802, 1, 0, 0.4392157, 1,
1.381657, 0.7984085, 1.429018, 1, 0, 0.4313726, 1,
1.384109, -1.327567, 0.7986672, 1, 0, 0.427451, 1,
1.397455, 1.016553, 1.252477, 1, 0, 0.4196078, 1,
1.408418, -0.6052404, 2.090214, 1, 0, 0.4156863, 1,
1.412181, 0.3132375, 2.228864, 1, 0, 0.4078431, 1,
1.412466, 1.083418, -0.7800378, 1, 0, 0.4039216, 1,
1.418711, -0.4639325, 0.6491564, 1, 0, 0.3960784, 1,
1.428213, 0.2080662, -0.3540147, 1, 0, 0.3882353, 1,
1.439142, -0.6273717, 1.396469, 1, 0, 0.3843137, 1,
1.471222, 0.2173484, 0.8853092, 1, 0, 0.3764706, 1,
1.489263, -1.933573, 2.664692, 1, 0, 0.372549, 1,
1.510354, 0.1204009, 1.003548, 1, 0, 0.3647059, 1,
1.513444, -0.1383909, 2.500489, 1, 0, 0.3607843, 1,
1.51597, -0.897294, 2.853807, 1, 0, 0.3529412, 1,
1.522655, 0.7741119, 2.128035, 1, 0, 0.3490196, 1,
1.549447, 0.4964349, 1.031084, 1, 0, 0.3411765, 1,
1.551614, 0.7967678, 1.009213, 1, 0, 0.3372549, 1,
1.557244, -2.166316, 3.462685, 1, 0, 0.3294118, 1,
1.565701, 1.418317, 1.0304, 1, 0, 0.3254902, 1,
1.586559, -1.485198, 1.676917, 1, 0, 0.3176471, 1,
1.617775, -1.313851, 4.014443, 1, 0, 0.3137255, 1,
1.628902, -0.6603535, -0.1950883, 1, 0, 0.3058824, 1,
1.630948, 1.626496, 2.465435, 1, 0, 0.2980392, 1,
1.645542, -0.2922933, 1.994207, 1, 0, 0.2941177, 1,
1.647842, 1.479341, 1.149007, 1, 0, 0.2862745, 1,
1.6627, -0.6406104, 3.41599, 1, 0, 0.282353, 1,
1.663395, 1.199727, 0.1147666, 1, 0, 0.2745098, 1,
1.664224, -0.03329899, 2.098785, 1, 0, 0.2705882, 1,
1.671762, 0.4318695, 2.406147, 1, 0, 0.2627451, 1,
1.710799, -0.362276, 0.4235914, 1, 0, 0.2588235, 1,
1.717575, -2.105242, 3.679024, 1, 0, 0.2509804, 1,
1.720221, 0.2988904, 0.8803176, 1, 0, 0.2470588, 1,
1.722515, 0.2127135, 1.233477, 1, 0, 0.2392157, 1,
1.753687, -0.7612467, 0.08398461, 1, 0, 0.2352941, 1,
1.769401, -0.5496756, 2.7506, 1, 0, 0.227451, 1,
1.770115, 0.07607476, 2.510218, 1, 0, 0.2235294, 1,
1.802772, 0.9331539, 1.100577, 1, 0, 0.2156863, 1,
1.822889, -2.011844, 2.203907, 1, 0, 0.2117647, 1,
1.835952, 0.3927359, -0.844574, 1, 0, 0.2039216, 1,
1.84128, -0.5677056, 2.281973, 1, 0, 0.1960784, 1,
1.865899, 1.339813, -0.6891996, 1, 0, 0.1921569, 1,
1.901756, -0.5156109, 1.942078, 1, 0, 0.1843137, 1,
1.928141, 0.6167895, 1.524453, 1, 0, 0.1803922, 1,
1.941946, -0.863621, 2.355474, 1, 0, 0.172549, 1,
1.942986, 0.6298814, 0.5155425, 1, 0, 0.1686275, 1,
1.962364, 0.1481448, 3.192425, 1, 0, 0.1607843, 1,
1.963412, -1.348513, 2.439765, 1, 0, 0.1568628, 1,
1.978649, 0.5407888, 0.4623574, 1, 0, 0.1490196, 1,
1.983069, -0.9926889, 1.016599, 1, 0, 0.145098, 1,
2.00817, 0.7508029, 4.250662, 1, 0, 0.1372549, 1,
2.009495, -0.9138054, 2.561315, 1, 0, 0.1333333, 1,
2.025454, -0.8835857, 1.824157, 1, 0, 0.1254902, 1,
2.038125, 0.297317, 0.05103765, 1, 0, 0.1215686, 1,
2.062543, -0.1324577, 0.7314668, 1, 0, 0.1137255, 1,
2.063628, -0.2808231, 1.723627, 1, 0, 0.1098039, 1,
2.072881, -0.457742, 2.165909, 1, 0, 0.1019608, 1,
2.081338, -0.1710023, 2.82057, 1, 0, 0.09411765, 1,
2.115285, -0.9790323, 2.629241, 1, 0, 0.09019608, 1,
2.118285, 1.222481, 4.436713, 1, 0, 0.08235294, 1,
2.143788, -0.700439, 1.008614, 1, 0, 0.07843138, 1,
2.162188, 0.907459, 0.5831696, 1, 0, 0.07058824, 1,
2.165419, 0.8032526, 0.3417931, 1, 0, 0.06666667, 1,
2.198644, -0.6540893, 1.635453, 1, 0, 0.05882353, 1,
2.209091, -0.7277297, 0.05164679, 1, 0, 0.05490196, 1,
2.25297, 1.560156, 2.473472, 1, 0, 0.04705882, 1,
2.265656, 1.464291, 0.06220628, 1, 0, 0.04313726, 1,
2.269013, 0.2129974, 2.176697, 1, 0, 0.03529412, 1,
2.376822, -0.02412176, 2.175037, 1, 0, 0.03137255, 1,
2.390618, 1.883078, 1.69479, 1, 0, 0.02352941, 1,
2.471012, 0.4349899, 2.653665, 1, 0, 0.01960784, 1,
2.5093, 0.107594, 1.490972, 1, 0, 0.01176471, 1,
2.93607, 0.02106435, 0.68807, 1, 0, 0.007843138, 1
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
-0.1539934, -4.324144, -7.638781, 0, -0.5, 0.5, 0.5,
-0.1539934, -4.324144, -7.638781, 1, -0.5, 0.5, 0.5,
-0.1539934, -4.324144, -7.638781, 1, 1.5, 0.5, 0.5,
-0.1539934, -4.324144, -7.638781, 0, 1.5, 0.5, 0.5
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
-4.291588, 0.1534952, -7.638781, 0, -0.5, 0.5, 0.5,
-4.291588, 0.1534952, -7.638781, 1, -0.5, 0.5, 0.5,
-4.291588, 0.1534952, -7.638781, 1, 1.5, 0.5, 0.5,
-4.291588, 0.1534952, -7.638781, 0, 1.5, 0.5, 0.5
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
-4.291588, -4.324144, -0.4261668, 0, -0.5, 0.5, 0.5,
-4.291588, -4.324144, -0.4261668, 1, -0.5, 0.5, 0.5,
-4.291588, -4.324144, -0.4261668, 1, 1.5, 0.5, 0.5,
-4.291588, -4.324144, -0.4261668, 0, 1.5, 0.5, 0.5
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
-3, -3.290843, -5.974332,
2, -3.290843, -5.974332,
-3, -3.290843, -5.974332,
-3, -3.46306, -6.25174,
-2, -3.290843, -5.974332,
-2, -3.46306, -6.25174,
-1, -3.290843, -5.974332,
-1, -3.46306, -6.25174,
0, -3.290843, -5.974332,
0, -3.46306, -6.25174,
1, -3.290843, -5.974332,
1, -3.46306, -6.25174,
2, -3.290843, -5.974332,
2, -3.46306, -6.25174
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
-3, -3.807494, -6.806556, 0, -0.5, 0.5, 0.5,
-3, -3.807494, -6.806556, 1, -0.5, 0.5, 0.5,
-3, -3.807494, -6.806556, 1, 1.5, 0.5, 0.5,
-3, -3.807494, -6.806556, 0, 1.5, 0.5, 0.5,
-2, -3.807494, -6.806556, 0, -0.5, 0.5, 0.5,
-2, -3.807494, -6.806556, 1, -0.5, 0.5, 0.5,
-2, -3.807494, -6.806556, 1, 1.5, 0.5, 0.5,
-2, -3.807494, -6.806556, 0, 1.5, 0.5, 0.5,
-1, -3.807494, -6.806556, 0, -0.5, 0.5, 0.5,
-1, -3.807494, -6.806556, 1, -0.5, 0.5, 0.5,
-1, -3.807494, -6.806556, 1, 1.5, 0.5, 0.5,
-1, -3.807494, -6.806556, 0, 1.5, 0.5, 0.5,
0, -3.807494, -6.806556, 0, -0.5, 0.5, 0.5,
0, -3.807494, -6.806556, 1, -0.5, 0.5, 0.5,
0, -3.807494, -6.806556, 1, 1.5, 0.5, 0.5,
0, -3.807494, -6.806556, 0, 1.5, 0.5, 0.5,
1, -3.807494, -6.806556, 0, -0.5, 0.5, 0.5,
1, -3.807494, -6.806556, 1, -0.5, 0.5, 0.5,
1, -3.807494, -6.806556, 1, 1.5, 0.5, 0.5,
1, -3.807494, -6.806556, 0, 1.5, 0.5, 0.5,
2, -3.807494, -6.806556, 0, -0.5, 0.5, 0.5,
2, -3.807494, -6.806556, 1, -0.5, 0.5, 0.5,
2, -3.807494, -6.806556, 1, 1.5, 0.5, 0.5,
2, -3.807494, -6.806556, 0, 1.5, 0.5, 0.5
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
-3.336759, -3, -5.974332,
-3.336759, 3, -5.974332,
-3.336759, -3, -5.974332,
-3.495897, -3, -6.25174,
-3.336759, -2, -5.974332,
-3.495897, -2, -6.25174,
-3.336759, -1, -5.974332,
-3.495897, -1, -6.25174,
-3.336759, 0, -5.974332,
-3.495897, 0, -6.25174,
-3.336759, 1, -5.974332,
-3.495897, 1, -6.25174,
-3.336759, 2, -5.974332,
-3.495897, 2, -6.25174,
-3.336759, 3, -5.974332,
-3.495897, 3, -6.25174
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
-3.814174, -3, -6.806556, 0, -0.5, 0.5, 0.5,
-3.814174, -3, -6.806556, 1, -0.5, 0.5, 0.5,
-3.814174, -3, -6.806556, 1, 1.5, 0.5, 0.5,
-3.814174, -3, -6.806556, 0, 1.5, 0.5, 0.5,
-3.814174, -2, -6.806556, 0, -0.5, 0.5, 0.5,
-3.814174, -2, -6.806556, 1, -0.5, 0.5, 0.5,
-3.814174, -2, -6.806556, 1, 1.5, 0.5, 0.5,
-3.814174, -2, -6.806556, 0, 1.5, 0.5, 0.5,
-3.814174, -1, -6.806556, 0, -0.5, 0.5, 0.5,
-3.814174, -1, -6.806556, 1, -0.5, 0.5, 0.5,
-3.814174, -1, -6.806556, 1, 1.5, 0.5, 0.5,
-3.814174, -1, -6.806556, 0, 1.5, 0.5, 0.5,
-3.814174, 0, -6.806556, 0, -0.5, 0.5, 0.5,
-3.814174, 0, -6.806556, 1, -0.5, 0.5, 0.5,
-3.814174, 0, -6.806556, 1, 1.5, 0.5, 0.5,
-3.814174, 0, -6.806556, 0, 1.5, 0.5, 0.5,
-3.814174, 1, -6.806556, 0, -0.5, 0.5, 0.5,
-3.814174, 1, -6.806556, 1, -0.5, 0.5, 0.5,
-3.814174, 1, -6.806556, 1, 1.5, 0.5, 0.5,
-3.814174, 1, -6.806556, 0, 1.5, 0.5, 0.5,
-3.814174, 2, -6.806556, 0, -0.5, 0.5, 0.5,
-3.814174, 2, -6.806556, 1, -0.5, 0.5, 0.5,
-3.814174, 2, -6.806556, 1, 1.5, 0.5, 0.5,
-3.814174, 2, -6.806556, 0, 1.5, 0.5, 0.5,
-3.814174, 3, -6.806556, 0, -0.5, 0.5, 0.5,
-3.814174, 3, -6.806556, 1, -0.5, 0.5, 0.5,
-3.814174, 3, -6.806556, 1, 1.5, 0.5, 0.5,
-3.814174, 3, -6.806556, 0, 1.5, 0.5, 0.5
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
-3.336759, -3.290843, -4,
-3.336759, -3.290843, 4,
-3.336759, -3.290843, -4,
-3.495897, -3.46306, -4,
-3.336759, -3.290843, -2,
-3.495897, -3.46306, -2,
-3.336759, -3.290843, 0,
-3.495897, -3.46306, 0,
-3.336759, -3.290843, 2,
-3.495897, -3.46306, 2,
-3.336759, -3.290843, 4,
-3.495897, -3.46306, 4
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
-3.814174, -3.807494, -4, 0, -0.5, 0.5, 0.5,
-3.814174, -3.807494, -4, 1, -0.5, 0.5, 0.5,
-3.814174, -3.807494, -4, 1, 1.5, 0.5, 0.5,
-3.814174, -3.807494, -4, 0, 1.5, 0.5, 0.5,
-3.814174, -3.807494, -2, 0, -0.5, 0.5, 0.5,
-3.814174, -3.807494, -2, 1, -0.5, 0.5, 0.5,
-3.814174, -3.807494, -2, 1, 1.5, 0.5, 0.5,
-3.814174, -3.807494, -2, 0, 1.5, 0.5, 0.5,
-3.814174, -3.807494, 0, 0, -0.5, 0.5, 0.5,
-3.814174, -3.807494, 0, 1, -0.5, 0.5, 0.5,
-3.814174, -3.807494, 0, 1, 1.5, 0.5, 0.5,
-3.814174, -3.807494, 0, 0, 1.5, 0.5, 0.5,
-3.814174, -3.807494, 2, 0, -0.5, 0.5, 0.5,
-3.814174, -3.807494, 2, 1, -0.5, 0.5, 0.5,
-3.814174, -3.807494, 2, 1, 1.5, 0.5, 0.5,
-3.814174, -3.807494, 2, 0, 1.5, 0.5, 0.5,
-3.814174, -3.807494, 4, 0, -0.5, 0.5, 0.5,
-3.814174, -3.807494, 4, 1, -0.5, 0.5, 0.5,
-3.814174, -3.807494, 4, 1, 1.5, 0.5, 0.5,
-3.814174, -3.807494, 4, 0, 1.5, 0.5, 0.5
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
-3.336759, -3.290843, -5.974332,
-3.336759, 3.597833, -5.974332,
-3.336759, -3.290843, 5.121998,
-3.336759, 3.597833, 5.121998,
-3.336759, -3.290843, -5.974332,
-3.336759, -3.290843, 5.121998,
-3.336759, 3.597833, -5.974332,
-3.336759, 3.597833, 5.121998,
-3.336759, -3.290843, -5.974332,
3.028772, -3.290843, -5.974332,
-3.336759, -3.290843, 5.121998,
3.028772, -3.290843, 5.121998,
-3.336759, 3.597833, -5.974332,
3.028772, 3.597833, -5.974332,
-3.336759, 3.597833, 5.121998,
3.028772, 3.597833, 5.121998,
3.028772, -3.290843, -5.974332,
3.028772, 3.597833, -5.974332,
3.028772, -3.290843, 5.121998,
3.028772, 3.597833, 5.121998,
3.028772, -3.290843, -5.974332,
3.028772, -3.290843, 5.121998,
3.028772, 3.597833, -5.974332,
3.028772, 3.597833, 5.121998
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
var radius = 7.758398;
var distance = 34.51799;
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
mvMatrix.translate( 0.1539934, -0.1534952, 0.4261668 );
mvMatrix.scale( 1.317805, 1.217728, 0.7559735 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.51799);
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
methoprene<-read.table("methoprene.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-methoprene$V2
```

```
## Error in eval(expr, envir, enclos): object 'methoprene' not found
```

```r
y<-methoprene$V3
```

```
## Error in eval(expr, envir, enclos): object 'methoprene' not found
```

```r
z<-methoprene$V4
```

```
## Error in eval(expr, envir, enclos): object 'methoprene' not found
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
-3.244057, -0.6181747, -1.375596, 0, 0, 1, 1, 1,
-2.953721, -1.687449, -1.932552, 1, 0, 0, 1, 1,
-2.80798, -0.5315161, -1.780938, 1, 0, 0, 1, 1,
-2.703416, 0.8777901, -0.285985, 1, 0, 0, 1, 1,
-2.643582, 1.177302, -1.264253, 1, 0, 0, 1, 1,
-2.514936, -0.8621061, -1.34212, 1, 0, 0, 1, 1,
-2.437255, -2.362177, -5.527121, 0, 0, 0, 1, 1,
-2.37626, -1.200712, -2.742982, 0, 0, 0, 1, 1,
-2.354744, 0.747175, -1.348112, 0, 0, 0, 1, 1,
-2.347308, 0.7120114, -1.146752, 0, 0, 0, 1, 1,
-2.318616, 0.5034233, -1.150422, 0, 0, 0, 1, 1,
-2.317756, -0.0881825, -1.033096, 0, 0, 0, 1, 1,
-2.311687, 0.5528085, -3.838356, 0, 0, 0, 1, 1,
-2.298004, 1.679061, 0.1245615, 1, 1, 1, 1, 1,
-2.297255, 0.6373088, -1.213408, 1, 1, 1, 1, 1,
-2.239071, 1.803378, -1.332643, 1, 1, 1, 1, 1,
-2.221235, -1.588243, -1.983137, 1, 1, 1, 1, 1,
-2.201442, -0.7538279, -1.4264, 1, 1, 1, 1, 1,
-2.127106, 0.2523964, -2.22957, 1, 1, 1, 1, 1,
-2.116749, -1.038395, -1.470748, 1, 1, 1, 1, 1,
-2.093164, -1.158109, -1.44745, 1, 1, 1, 1, 1,
-2.084659, -1.509534, -1.055229, 1, 1, 1, 1, 1,
-2.080064, -0.5927654, -2.346976, 1, 1, 1, 1, 1,
-2.038138, -2.218968, -1.367634, 1, 1, 1, 1, 1,
-2.02063, -2.647978, -1.907159, 1, 1, 1, 1, 1,
-1.9763, -0.3794997, -2.517459, 1, 1, 1, 1, 1,
-1.970757, -0.1083938, -1.51071, 1, 1, 1, 1, 1,
-1.970338, -1.61965, -1.746127, 1, 1, 1, 1, 1,
-1.938426, -1.119939, -1.484676, 0, 0, 1, 1, 1,
-1.938423, -0.863542, -2.991964, 1, 0, 0, 1, 1,
-1.934805, 1.158377, 0.3336183, 1, 0, 0, 1, 1,
-1.930932, 0.7387983, 0.4022188, 1, 0, 0, 1, 1,
-1.924071, 1.122648, 0.4137383, 1, 0, 0, 1, 1,
-1.888296, 0.2203094, -0.1227343, 1, 0, 0, 1, 1,
-1.886641, -1.654715, -3.22869, 0, 0, 0, 1, 1,
-1.878225, 1.223008, -2.714046, 0, 0, 0, 1, 1,
-1.870906, -0.4918068, -1.255778, 0, 0, 0, 1, 1,
-1.870056, 0.5710438, -2.29494, 0, 0, 0, 1, 1,
-1.868686, 0.7220531, -0.2907298, 0, 0, 0, 1, 1,
-1.845458, -0.3131704, -3.585511, 0, 0, 0, 1, 1,
-1.84199, 0.00124965, -2.472703, 0, 0, 0, 1, 1,
-1.830728, -0.1658566, -1.136831, 1, 1, 1, 1, 1,
-1.821602, 0.5657345, -2.803848, 1, 1, 1, 1, 1,
-1.796524, -0.8056507, -0.7731063, 1, 1, 1, 1, 1,
-1.796427, -0.2640488, -1.80023, 1, 1, 1, 1, 1,
-1.784123, -1.462463, -1.124294, 1, 1, 1, 1, 1,
-1.780705, -1.133278, -2.000807, 1, 1, 1, 1, 1,
-1.778132, -0.8296968, -2.712064, 1, 1, 1, 1, 1,
-1.758718, -1.051517, -1.287076, 1, 1, 1, 1, 1,
-1.752084, -0.6923729, -1.522964, 1, 1, 1, 1, 1,
-1.671798, 0.4214638, -2.441741, 1, 1, 1, 1, 1,
-1.654768, 0.5838124, -0.002251568, 1, 1, 1, 1, 1,
-1.637059, -0.2139399, -1.225492, 1, 1, 1, 1, 1,
-1.63701, 0.5200936, -2.380855, 1, 1, 1, 1, 1,
-1.624787, 0.9245019, -1.202448, 1, 1, 1, 1, 1,
-1.620315, -0.03624388, -0.9672362, 1, 1, 1, 1, 1,
-1.617227, 1.428246, -1.144351, 0, 0, 1, 1, 1,
-1.612496, -0.7809535, -2.274433, 1, 0, 0, 1, 1,
-1.607861, -0.9058229, -1.615175, 1, 0, 0, 1, 1,
-1.593653, 0.07510364, -2.383747, 1, 0, 0, 1, 1,
-1.59307, 0.006792756, -2.516141, 1, 0, 0, 1, 1,
-1.588776, 0.6205561, -2.365826, 1, 0, 0, 1, 1,
-1.581525, 1.200368, 0.4469891, 0, 0, 0, 1, 1,
-1.569052, -0.6049747, -1.642341, 0, 0, 0, 1, 1,
-1.565343, -1.841486, -1.756815, 0, 0, 0, 1, 1,
-1.553595, 0.8667252, -0.1283089, 0, 0, 0, 1, 1,
-1.551041, 0.3758934, -0.8741438, 0, 0, 0, 1, 1,
-1.550764, -0.3337339, -2.473242, 0, 0, 0, 1, 1,
-1.541077, 0.06683458, 0.09906282, 0, 0, 0, 1, 1,
-1.54013, 0.585396, -0.9489244, 1, 1, 1, 1, 1,
-1.534027, 0.3968062, -1.920869, 1, 1, 1, 1, 1,
-1.531238, 0.5759552, 0.7234401, 1, 1, 1, 1, 1,
-1.528593, 0.5208761, 0.04302187, 1, 1, 1, 1, 1,
-1.526976, -0.6777301, -0.598595, 1, 1, 1, 1, 1,
-1.505395, 0.1986547, -3.325379, 1, 1, 1, 1, 1,
-1.481701, -0.6744822, -2.341355, 1, 1, 1, 1, 1,
-1.464891, 1.52415, 0.02937901, 1, 1, 1, 1, 1,
-1.463788, 1.259466, -0.1087912, 1, 1, 1, 1, 1,
-1.452409, -0.8068312, -2.00719, 1, 1, 1, 1, 1,
-1.451888, -0.8144124, 0.5652504, 1, 1, 1, 1, 1,
-1.446518, 0.1717078, -1.428953, 1, 1, 1, 1, 1,
-1.443535, 0.4603118, -2.691051, 1, 1, 1, 1, 1,
-1.432205, -0.3277062, -0.7522092, 1, 1, 1, 1, 1,
-1.425002, 0.2622295, -1.595243, 1, 1, 1, 1, 1,
-1.409384, 0.3404315, -1.165044, 0, 0, 1, 1, 1,
-1.4043, -0.7019098, -3.29071, 1, 0, 0, 1, 1,
-1.403944, -1.795949, -3.013792, 1, 0, 0, 1, 1,
-1.396289, 1.643593, -0.6098786, 1, 0, 0, 1, 1,
-1.396187, -0.2703781, -1.597552, 1, 0, 0, 1, 1,
-1.395464, 1.010961, 0.6066461, 1, 0, 0, 1, 1,
-1.392645, 0.9964561, -0.5222639, 0, 0, 0, 1, 1,
-1.36752, -0.7219749, -2.22943, 0, 0, 0, 1, 1,
-1.350178, 1.287201, -0.8248034, 0, 0, 0, 1, 1,
-1.347102, -0.3143211, -1.019714, 0, 0, 0, 1, 1,
-1.335659, -0.679638, -2.040951, 0, 0, 0, 1, 1,
-1.335499, -0.5046767, -4.140419, 0, 0, 0, 1, 1,
-1.328645, -0.1503934, -3.110464, 0, 0, 0, 1, 1,
-1.32839, -1.013107, -3.194092, 1, 1, 1, 1, 1,
-1.310303, -2.095776, -1.923391, 1, 1, 1, 1, 1,
-1.309392, -0.1127467, -1.575371, 1, 1, 1, 1, 1,
-1.308175, 0.9465294, -0.3012742, 1, 1, 1, 1, 1,
-1.306148, -0.35306, -2.127383, 1, 1, 1, 1, 1,
-1.302231, -1.25415, -4.338231, 1, 1, 1, 1, 1,
-1.290998, -0.299814, -2.155819, 1, 1, 1, 1, 1,
-1.277399, 0.9372002, -1.408229, 1, 1, 1, 1, 1,
-1.274786, 0.1498634, -1.585402, 1, 1, 1, 1, 1,
-1.274628, 1.192157, -0.154695, 1, 1, 1, 1, 1,
-1.263443, -1.404843, -0.2931816, 1, 1, 1, 1, 1,
-1.260863, -1.385502, -2.159725, 1, 1, 1, 1, 1,
-1.259669, 1.456192, 0.2559627, 1, 1, 1, 1, 1,
-1.25518, 0.1793455, -2.458667, 1, 1, 1, 1, 1,
-1.25343, 0.2622312, -0.1687371, 1, 1, 1, 1, 1,
-1.235297, 0.2532471, -2.831478, 0, 0, 1, 1, 1,
-1.233487, 2.082595, -0.7099727, 1, 0, 0, 1, 1,
-1.221814, 0.5615998, -0.8917987, 1, 0, 0, 1, 1,
-1.21209, -0.4948606, -3.281564, 1, 0, 0, 1, 1,
-1.211708, -0.4576972, -2.30099, 1, 0, 0, 1, 1,
-1.210077, -0.2947856, -2.686016, 1, 0, 0, 1, 1,
-1.204253, 1.004268, 0.7180192, 0, 0, 0, 1, 1,
-1.204193, -0.2699348, -1.334262, 0, 0, 0, 1, 1,
-1.199054, 1.581724, -1.199834, 0, 0, 0, 1, 1,
-1.196861, 0.2214156, 0.7981651, 0, 0, 0, 1, 1,
-1.195763, 0.1570223, -0.9391568, 0, 0, 0, 1, 1,
-1.194516, -0.4502186, -0.5996534, 0, 0, 0, 1, 1,
-1.194173, -0.3662751, -2.018297, 0, 0, 0, 1, 1,
-1.193608, -1.177167, -2.992864, 1, 1, 1, 1, 1,
-1.182507, -0.5143276, -2.236739, 1, 1, 1, 1, 1,
-1.180399, 0.4795727, -0.1465114, 1, 1, 1, 1, 1,
-1.176563, -1.515162, -2.989788, 1, 1, 1, 1, 1,
-1.174777, 0.6279984, -0.01772804, 1, 1, 1, 1, 1,
-1.170572, -0.4810273, -2.055973, 1, 1, 1, 1, 1,
-1.165797, 0.04697122, -2.296541, 1, 1, 1, 1, 1,
-1.158969, -0.5032212, -2.848382, 1, 1, 1, 1, 1,
-1.157715, -0.551756, -2.537641, 1, 1, 1, 1, 1,
-1.150676, 1.267038, -1.335659, 1, 1, 1, 1, 1,
-1.148853, -0.2330411, -1.005758, 1, 1, 1, 1, 1,
-1.148731, 0.9162005, -1.574994, 1, 1, 1, 1, 1,
-1.148238, -0.4643023, -2.523509, 1, 1, 1, 1, 1,
-1.146328, 0.7557513, -0.303572, 1, 1, 1, 1, 1,
-1.142639, -0.4598781, -1.604509, 1, 1, 1, 1, 1,
-1.141307, 0.6162872, -1.408164, 0, 0, 1, 1, 1,
-1.126172, -2.28318, -2.074962, 1, 0, 0, 1, 1,
-1.124866, 0.9669924, -1.419135, 1, 0, 0, 1, 1,
-1.122357, 0.6514781, -1.781087, 1, 0, 0, 1, 1,
-1.121468, 3.200241, -0.856286, 1, 0, 0, 1, 1,
-1.119488, -0.1402403, -0.2336488, 1, 0, 0, 1, 1,
-1.115448, 0.8117702, -2.787091, 0, 0, 0, 1, 1,
-1.111814, 1.466119, -0.5507367, 0, 0, 0, 1, 1,
-1.105895, -1.769703, -1.510996, 0, 0, 0, 1, 1,
-1.105727, 0.6455052, -0.5818635, 0, 0, 0, 1, 1,
-1.097205, 0.4141901, -1.807773, 0, 0, 0, 1, 1,
-1.090854, -0.1472913, -1.597141, 0, 0, 0, 1, 1,
-1.085756, 1.089762, -1.54933, 0, 0, 0, 1, 1,
-1.082901, -0.1312963, -2.849841, 1, 1, 1, 1, 1,
-1.08106, 0.5022565, -0.4921959, 1, 1, 1, 1, 1,
-1.078139, -0.4974718, -4.93902, 1, 1, 1, 1, 1,
-1.077822, -0.1055763, -2.057925, 1, 1, 1, 1, 1,
-1.071709, -1.75727, -0.8629656, 1, 1, 1, 1, 1,
-1.070557, -0.375859, -1.8837, 1, 1, 1, 1, 1,
-1.069682, 0.3364384, -2.595934, 1, 1, 1, 1, 1,
-1.063576, -0.8401935, -0.1123855, 1, 1, 1, 1, 1,
-1.052035, 0.5052785, -0.08434583, 1, 1, 1, 1, 1,
-1.044815, 0.3895717, -0.2834677, 1, 1, 1, 1, 1,
-1.040532, 0.3241469, -1.356755, 1, 1, 1, 1, 1,
-1.036929, 0.7694489, -0.9983422, 1, 1, 1, 1, 1,
-1.035979, -1.152721, -1.517181, 1, 1, 1, 1, 1,
-1.035523, -1.565023, -2.213065, 1, 1, 1, 1, 1,
-1.022471, -0.6884831, -2.534581, 1, 1, 1, 1, 1,
-1.021131, -0.5049484, -3.149769, 0, 0, 1, 1, 1,
-1.019489, -0.7508439, -1.418641, 1, 0, 0, 1, 1,
-1.018373, -0.4374981, -3.036764, 1, 0, 0, 1, 1,
-1.015991, -1.882986, -2.496001, 1, 0, 0, 1, 1,
-1.011847, -1.056232, -2.314764, 1, 0, 0, 1, 1,
-1.011743, -1.486002, -3.845476, 1, 0, 0, 1, 1,
-1.009989, 0.737613, -0.08237217, 0, 0, 0, 1, 1,
-1.007139, 1.191778, -2.161354, 0, 0, 0, 1, 1,
-1.003217, -0.3342043, -1.843177, 0, 0, 0, 1, 1,
-1.003098, -0.8962539, -0.5443573, 0, 0, 0, 1, 1,
-1.000078, -0.379698, -3.502536, 0, 0, 0, 1, 1,
-0.9935646, 0.5286794, -1.445585, 0, 0, 0, 1, 1,
-0.9931793, 0.01263845, -1.939916, 0, 0, 0, 1, 1,
-0.9930651, -0.392612, -1.599023, 1, 1, 1, 1, 1,
-0.9898182, -0.4896778, -2.391279, 1, 1, 1, 1, 1,
-0.9888372, 0.9284935, 0.9564704, 1, 1, 1, 1, 1,
-0.98549, 0.7702168, -1.1549, 1, 1, 1, 1, 1,
-0.9834087, 0.9232021, 1.447993, 1, 1, 1, 1, 1,
-0.9833416, 0.2284503, -2.300039, 1, 1, 1, 1, 1,
-0.9788069, 0.5298946, 0.269828, 1, 1, 1, 1, 1,
-0.9755936, 0.02035739, -1.236828, 1, 1, 1, 1, 1,
-0.9689562, 0.08081496, -0.1572626, 1, 1, 1, 1, 1,
-0.9623554, 0.2999338, -1.271302, 1, 1, 1, 1, 1,
-0.9567593, 0.644384, 0.2842877, 1, 1, 1, 1, 1,
-0.9511917, 2.817019, 1.310776, 1, 1, 1, 1, 1,
-0.9453844, 1.254643, -0.6159545, 1, 1, 1, 1, 1,
-0.9361289, -0.9604254, -2.940508, 1, 1, 1, 1, 1,
-0.9341781, -0.7342413, -0.6462528, 1, 1, 1, 1, 1,
-0.9325981, -0.134433, -1.19573, 0, 0, 1, 1, 1,
-0.9280681, -1.848971, -1.472753, 1, 0, 0, 1, 1,
-0.925794, -1.354289, -1.831879, 1, 0, 0, 1, 1,
-0.9238597, -1.513805, -2.651459, 1, 0, 0, 1, 1,
-0.9229028, 0.224232, -0.8463469, 1, 0, 0, 1, 1,
-0.9214702, 0.1719219, -1.287408, 1, 0, 0, 1, 1,
-0.9206009, 1.288952, -1.456396, 0, 0, 0, 1, 1,
-0.9158532, -1.016809, -2.289834, 0, 0, 0, 1, 1,
-0.9077958, -0.2441433, -0.5827326, 0, 0, 0, 1, 1,
-0.9068955, -0.004602519, -1.885412, 0, 0, 0, 1, 1,
-0.8994635, -0.28933, -2.18025, 0, 0, 0, 1, 1,
-0.8938321, -0.5325784, -1.405693, 0, 0, 0, 1, 1,
-0.8936719, -2.177596, -1.143534, 0, 0, 0, 1, 1,
-0.8899853, -0.5703136, -1.160398, 1, 1, 1, 1, 1,
-0.8834056, 0.1561046, -1.346725, 1, 1, 1, 1, 1,
-0.8797473, 0.1915679, -1.156211, 1, 1, 1, 1, 1,
-0.878337, -2.019048, -3.299075, 1, 1, 1, 1, 1,
-0.873721, 0.3764732, -1.721805, 1, 1, 1, 1, 1,
-0.8728107, 0.7854401, -2.149636, 1, 1, 1, 1, 1,
-0.8694007, -0.8984414, -2.033087, 1, 1, 1, 1, 1,
-0.8563796, -0.966432, -3.788129, 1, 1, 1, 1, 1,
-0.8529231, 0.09784119, -3.14886, 1, 1, 1, 1, 1,
-0.8495722, 0.5256446, -1.500184, 1, 1, 1, 1, 1,
-0.8454784, 0.475846, -1.712173, 1, 1, 1, 1, 1,
-0.8447826, 0.4810919, 1.655154, 1, 1, 1, 1, 1,
-0.8434473, -1.460194, -2.372303, 1, 1, 1, 1, 1,
-0.8323087, -0.7658441, -2.748318, 1, 1, 1, 1, 1,
-0.8322536, -1.246508, -3.17754, 1, 1, 1, 1, 1,
-0.8305328, -1.290119, -2.046331, 0, 0, 1, 1, 1,
-0.8287497, 0.7612652, 0.5369155, 1, 0, 0, 1, 1,
-0.8285533, -1.633885, -5.812735, 1, 0, 0, 1, 1,
-0.8229641, 0.2667257, -0.1235081, 1, 0, 0, 1, 1,
-0.8198661, -0.6295947, -2.160367, 1, 0, 0, 1, 1,
-0.8186288, -0.8847688, -4.049025, 1, 0, 0, 1, 1,
-0.8147223, 0.5702677, -1.893461, 0, 0, 0, 1, 1,
-0.8136505, 0.2771801, -1.787987, 0, 0, 0, 1, 1,
-0.8127683, 0.08098656, -2.363749, 0, 0, 0, 1, 1,
-0.8015018, 0.06890939, -2.186212, 0, 0, 0, 1, 1,
-0.80066, 1.618604, -2.038384, 0, 0, 0, 1, 1,
-0.7971225, -0.457336, -2.748381, 0, 0, 0, 1, 1,
-0.7967143, 0.3324919, -0.9556254, 0, 0, 0, 1, 1,
-0.7960235, -0.6545954, -1.427109, 1, 1, 1, 1, 1,
-0.7959639, 0.7584758, 0.2810296, 1, 1, 1, 1, 1,
-0.7942564, 1.251907, -0.1057914, 1, 1, 1, 1, 1,
-0.7924483, 1.163764, 0.4039659, 1, 1, 1, 1, 1,
-0.785055, -0.852169, -4.317521, 1, 1, 1, 1, 1,
-0.7808369, 1.195332, -3.075032, 1, 1, 1, 1, 1,
-0.7775692, -1.345892, -3.929242, 1, 1, 1, 1, 1,
-0.7762272, -0.5617646, -2.56569, 1, 1, 1, 1, 1,
-0.7692377, -0.06671369, -2.263463, 1, 1, 1, 1, 1,
-0.7663965, 0.2167068, -0.5970812, 1, 1, 1, 1, 1,
-0.7653998, -1.142752, -2.849701, 1, 1, 1, 1, 1,
-0.7642263, -0.0813948, -1.433506, 1, 1, 1, 1, 1,
-0.7593245, -0.2321104, -0.331427, 1, 1, 1, 1, 1,
-0.7495033, 0.7018993, -1.973235, 1, 1, 1, 1, 1,
-0.7469849, -0.9010685, -2.689633, 1, 1, 1, 1, 1,
-0.7371376, 0.1822492, -0.06114396, 0, 0, 1, 1, 1,
-0.7285421, -0.4696613, -2.477111, 1, 0, 0, 1, 1,
-0.72737, 1.360647, 0.09302207, 1, 0, 0, 1, 1,
-0.7255645, 1.065682, -0.2676414, 1, 0, 0, 1, 1,
-0.7241331, -0.9925738, -2.755764, 1, 0, 0, 1, 1,
-0.721825, 0.1067848, -1.950129, 1, 0, 0, 1, 1,
-0.7206154, 0.02142704, -1.361985, 0, 0, 0, 1, 1,
-0.7115685, 0.9118155, -2.257929, 0, 0, 0, 1, 1,
-0.7106358, -0.3155055, -3.188728, 0, 0, 0, 1, 1,
-0.7088367, 0.4547289, -1.044112, 0, 0, 0, 1, 1,
-0.7075085, 0.0331113, -3.32758, 0, 0, 0, 1, 1,
-0.7067704, 0.1521372, -3.099661, 0, 0, 0, 1, 1,
-0.7053438, -0.8065283, -3.154957, 0, 0, 0, 1, 1,
-0.7041676, -0.1763527, -2.246601, 1, 1, 1, 1, 1,
-0.6943942, -0.243502, -1.831717, 1, 1, 1, 1, 1,
-0.6925271, 0.305587, -1.401473, 1, 1, 1, 1, 1,
-0.6878286, 0.7736802, -0.8167345, 1, 1, 1, 1, 1,
-0.68637, -1.369207, 0.4772575, 1, 1, 1, 1, 1,
-0.6822344, -1.304127, -1.671551, 1, 1, 1, 1, 1,
-0.6781901, 1.419273, -1.33168, 1, 1, 1, 1, 1,
-0.6769567, 0.2151429, -1.564922, 1, 1, 1, 1, 1,
-0.6769382, 1.601021, 0.781528, 1, 1, 1, 1, 1,
-0.673836, 0.07563988, -1.386277, 1, 1, 1, 1, 1,
-0.6732445, -0.6529395, -3.194335, 1, 1, 1, 1, 1,
-0.6724876, 0.1436898, -1.525537, 1, 1, 1, 1, 1,
-0.6654283, 0.01914789, -0.1934186, 1, 1, 1, 1, 1,
-0.6640408, -1.270661, -2.308125, 1, 1, 1, 1, 1,
-0.6633287, -1.875018, -3.14892, 1, 1, 1, 1, 1,
-0.6548781, -0.3850203, -1.586275, 0, 0, 1, 1, 1,
-0.6504266, 0.6890401, 1.79582, 1, 0, 0, 1, 1,
-0.648376, 1.051702, -1.35525, 1, 0, 0, 1, 1,
-0.6453406, -1.90124, -2.496119, 1, 0, 0, 1, 1,
-0.6428754, -0.1320126, -4.083524, 1, 0, 0, 1, 1,
-0.6379394, -0.1378587, -3.464061, 1, 0, 0, 1, 1,
-0.6337532, -1.112591, -3.80377, 0, 0, 0, 1, 1,
-0.6289948, 1.979817, 1.313994, 0, 0, 0, 1, 1,
-0.6256558, 0.7428482, -0.0452081, 0, 0, 0, 1, 1,
-0.6234076, -1.815562, -3.688718, 0, 0, 0, 1, 1,
-0.6227812, -0.1226789, -1.324273, 0, 0, 0, 1, 1,
-0.6122456, -0.472687, -1.607449, 0, 0, 0, 1, 1,
-0.5900435, -0.9048822, -0.6513309, 0, 0, 0, 1, 1,
-0.5842188, 0.4572509, -0.3690874, 1, 1, 1, 1, 1,
-0.5764818, -1.780304, -2.201064, 1, 1, 1, 1, 1,
-0.573453, 1.719235, -0.884208, 1, 1, 1, 1, 1,
-0.5719832, 1.129003, -1.447093, 1, 1, 1, 1, 1,
-0.5660986, -1.138988, -2.676959, 1, 1, 1, 1, 1,
-0.5637005, -1.154106, -2.950848, 1, 1, 1, 1, 1,
-0.562958, -1.079849, -4.745677, 1, 1, 1, 1, 1,
-0.5618213, 0.4958507, -0.5109997, 1, 1, 1, 1, 1,
-0.5578114, -0.7780656, -4.703923, 1, 1, 1, 1, 1,
-0.5560066, -2.001227, -2.79045, 1, 1, 1, 1, 1,
-0.5541846, 3.160942, -0.06500852, 1, 1, 1, 1, 1,
-0.5521554, -0.413832, -0.1585243, 1, 1, 1, 1, 1,
-0.5508099, 0.1146227, -1.622148, 1, 1, 1, 1, 1,
-0.5488712, 1.14059, 0.5370731, 1, 1, 1, 1, 1,
-0.5425151, 0.3075423, -1.673118, 1, 1, 1, 1, 1,
-0.5309357, 0.7492632, -2.093496, 0, 0, 1, 1, 1,
-0.5287423, 1.013586, 0.148795, 1, 0, 0, 1, 1,
-0.5284849, 0.04645306, -0.0475852, 1, 0, 0, 1, 1,
-0.5281324, 0.7869447, 0.8600099, 1, 0, 0, 1, 1,
-0.5258914, -0.2939173, -3.4351, 1, 0, 0, 1, 1,
-0.5240247, -0.7479668, -3.891782, 1, 0, 0, 1, 1,
-0.5225519, -0.7483779, -1.976103, 0, 0, 0, 1, 1,
-0.5225092, -1.650282, -4.129038, 0, 0, 0, 1, 1,
-0.5214817, 0.06518726, -2.232446, 0, 0, 0, 1, 1,
-0.5213866, -0.8650643, -4.268275, 0, 0, 0, 1, 1,
-0.5196115, -0.5737584, -1.259554, 0, 0, 0, 1, 1,
-0.5190884, -0.1446765, -2.110961, 0, 0, 0, 1, 1,
-0.5183474, 0.7889956, 0.5701419, 0, 0, 0, 1, 1,
-0.5153227, 1.246396, 0.9777691, 1, 1, 1, 1, 1,
-0.5125042, -0.2355854, -2.546838, 1, 1, 1, 1, 1,
-0.5121785, 0.4678992, -0.698057, 1, 1, 1, 1, 1,
-0.5118304, 0.3078791, -1.413814, 1, 1, 1, 1, 1,
-0.507052, -0.4662215, -0.736827, 1, 1, 1, 1, 1,
-0.5055414, -1.675256, -2.254546, 1, 1, 1, 1, 1,
-0.5027868, 0.05727929, -2.089871, 1, 1, 1, 1, 1,
-0.4979457, 0.4183237, 0.7778294, 1, 1, 1, 1, 1,
-0.4967871, -0.5210238, -3.673233, 1, 1, 1, 1, 1,
-0.4954671, -1.039127, -4.951564, 1, 1, 1, 1, 1,
-0.4819659, 1.469412, -1.868225, 1, 1, 1, 1, 1,
-0.4758247, -0.02115467, -0.8876686, 1, 1, 1, 1, 1,
-0.4706959, -2.039772, -3.305087, 1, 1, 1, 1, 1,
-0.4691671, 0.3674408, -1.282681, 1, 1, 1, 1, 1,
-0.4689703, 1.267352, -0.4625221, 1, 1, 1, 1, 1,
-0.4617763, -0.06838863, -0.1811127, 0, 0, 1, 1, 1,
-0.4613008, -0.6258227, -2.687432, 1, 0, 0, 1, 1,
-0.4533522, 0.198513, -1.247298, 1, 0, 0, 1, 1,
-0.45175, -2.002044, -2.198237, 1, 0, 0, 1, 1,
-0.4508429, -0.7502913, -3.721901, 1, 0, 0, 1, 1,
-0.4503652, -0.5543042, -3.125262, 1, 0, 0, 1, 1,
-0.4477816, -0.6081728, -4.019622, 0, 0, 0, 1, 1,
-0.4440663, -0.9745212, -2.632553, 0, 0, 0, 1, 1,
-0.4409244, -0.8825909, -3.028506, 0, 0, 0, 1, 1,
-0.4345967, -0.3187673, -0.6013002, 0, 0, 0, 1, 1,
-0.4337029, 1.037572, 0.151477, 0, 0, 0, 1, 1,
-0.4291405, -0.1515336, -1.730536, 0, 0, 0, 1, 1,
-0.4287384, 1.313038, -0.7384665, 0, 0, 0, 1, 1,
-0.418179, 0.9975234, -0.4264108, 1, 1, 1, 1, 1,
-0.4173015, 0.284044, -0.9767472, 1, 1, 1, 1, 1,
-0.4068957, -0.3428781, -3.165342, 1, 1, 1, 1, 1,
-0.4061301, 1.33661, -0.3739564, 1, 1, 1, 1, 1,
-0.4033268, -2.183213, -2.998739, 1, 1, 1, 1, 1,
-0.4022413, 2.002465, 0.8645576, 1, 1, 1, 1, 1,
-0.397006, 0.3475566, -0.5807595, 1, 1, 1, 1, 1,
-0.3957762, -0.7423072, -3.394323, 1, 1, 1, 1, 1,
-0.3949485, -0.8659638, -4.04513, 1, 1, 1, 1, 1,
-0.3848614, -1.261426, -3.275276, 1, 1, 1, 1, 1,
-0.3797777, 1.094394, -1.960971, 1, 1, 1, 1, 1,
-0.3725261, -0.4846117, -1.451975, 1, 1, 1, 1, 1,
-0.3719614, 0.5033674, -1.34264, 1, 1, 1, 1, 1,
-0.3713381, 0.03280124, -2.689246, 1, 1, 1, 1, 1,
-0.363465, 1.122308, 1.313078, 1, 1, 1, 1, 1,
-0.3624448, -0.7612497, -2.492114, 0, 0, 1, 1, 1,
-0.3618835, 0.9150085, 0.05895958, 1, 0, 0, 1, 1,
-0.3614801, -0.09132171, -2.643843, 1, 0, 0, 1, 1,
-0.3611782, 1.578558, -0.3089566, 1, 0, 0, 1, 1,
-0.3609467, -0.03562298, -2.643095, 1, 0, 0, 1, 1,
-0.3574067, -0.4586283, -0.8223125, 1, 0, 0, 1, 1,
-0.3540885, 0.511796, -1.346693, 0, 0, 0, 1, 1,
-0.3480252, -1.216675, -2.133488, 0, 0, 0, 1, 1,
-0.3457653, -1.39627, -2.641374, 0, 0, 0, 1, 1,
-0.3419677, 1.539498, -1.388975, 0, 0, 0, 1, 1,
-0.341475, 0.8252109, 0.1711889, 0, 0, 0, 1, 1,
-0.3407779, 1.426049, -0.1701769, 0, 0, 0, 1, 1,
-0.3400968, 0.3225742, 0.3074968, 0, 0, 0, 1, 1,
-0.3398059, -0.780852, -2.606696, 1, 1, 1, 1, 1,
-0.3364582, -0.6998498, -2.147364, 1, 1, 1, 1, 1,
-0.3299037, 0.8971744, 0.1390975, 1, 1, 1, 1, 1,
-0.3286085, -0.03498537, -1.68545, 1, 1, 1, 1, 1,
-0.3207007, -0.6437373, -3.005013, 1, 1, 1, 1, 1,
-0.3193766, -0.2687542, -3.202005, 1, 1, 1, 1, 1,
-0.3178655, -0.2231984, -1.058695, 1, 1, 1, 1, 1,
-0.3169585, -1.142648, -1.973025, 1, 1, 1, 1, 1,
-0.3150368, -0.4253578, -3.326339, 1, 1, 1, 1, 1,
-0.3134198, 1.384733, -0.4826268, 1, 1, 1, 1, 1,
-0.3029687, -0.457658, -4.391509, 1, 1, 1, 1, 1,
-0.2999276, -0.3001724, -3.924087, 1, 1, 1, 1, 1,
-0.2937135, -1.088036, -3.332122, 1, 1, 1, 1, 1,
-0.2879661, -1.670296, -2.902625, 1, 1, 1, 1, 1,
-0.2871858, -0.4864233, -1.094366, 1, 1, 1, 1, 1,
-0.2871442, -0.4060855, -2.118486, 0, 0, 1, 1, 1,
-0.2808374, 0.3810245, -1.125923, 1, 0, 0, 1, 1,
-0.2806805, 0.7071339, -0.2245472, 1, 0, 0, 1, 1,
-0.27794, -0.621038, -2.060966, 1, 0, 0, 1, 1,
-0.2768572, 0.03170362, -1.322171, 1, 0, 0, 1, 1,
-0.2763249, -1.696886, -2.374268, 1, 0, 0, 1, 1,
-0.2746864, 0.09562045, -0.8395872, 0, 0, 0, 1, 1,
-0.2723834, -0.7515865, -2.792367, 0, 0, 0, 1, 1,
-0.2719936, 0.05211313, -1.659838, 0, 0, 0, 1, 1,
-0.271481, 2.249208, -0.9929982, 0, 0, 0, 1, 1,
-0.2695589, 1.560794, -1.572592, 0, 0, 0, 1, 1,
-0.268573, -0.03781171, -2.24348, 0, 0, 0, 1, 1,
-0.2685215, -0.8284717, -3.681278, 0, 0, 0, 1, 1,
-0.2658477, -0.6764781, -2.688681, 1, 1, 1, 1, 1,
-0.2597292, 1.544786, 0.9126236, 1, 1, 1, 1, 1,
-0.2564242, 0.6003788, -1.846986, 1, 1, 1, 1, 1,
-0.2524746, -0.4312785, -2.160908, 1, 1, 1, 1, 1,
-0.2513372, -0.2232262, -2.572581, 1, 1, 1, 1, 1,
-0.2483745, -0.02031336, -1.340905, 1, 1, 1, 1, 1,
-0.2480171, -0.2124236, -3.506802, 1, 1, 1, 1, 1,
-0.2476928, 0.7428539, 2.231116, 1, 1, 1, 1, 1,
-0.2467951, 0.8573457, -0.6251866, 1, 1, 1, 1, 1,
-0.2439818, 0.7392219, -1.483467, 1, 1, 1, 1, 1,
-0.2417837, -0.6499953, -3.458394, 1, 1, 1, 1, 1,
-0.2415251, -0.6899717, -2.096354, 1, 1, 1, 1, 1,
-0.2411389, -0.5491499, -1.122434, 1, 1, 1, 1, 1,
-0.2399873, 2.098856, -1.634346, 1, 1, 1, 1, 1,
-0.2370968, 0.5116134, -0.5178888, 1, 1, 1, 1, 1,
-0.2348482, 0.2159963, -1.348913, 0, 0, 1, 1, 1,
-0.2296127, 0.1773006, -0.953369, 1, 0, 0, 1, 1,
-0.229187, -1.021378, -3.192189, 1, 0, 0, 1, 1,
-0.2289184, 1.471256, -0.03055573, 1, 0, 0, 1, 1,
-0.2288149, 1.046599, 1.564491, 1, 0, 0, 1, 1,
-0.2253537, -1.42001, -3.646474, 1, 0, 0, 1, 1,
-0.2248959, -1.760976, -2.444159, 0, 0, 0, 1, 1,
-0.2235271, -1.057682, -0.5764793, 0, 0, 0, 1, 1,
-0.219572, -0.8337941, -1.808787, 0, 0, 0, 1, 1,
-0.2184071, 0.8696244, -1.219267, 0, 0, 0, 1, 1,
-0.2177447, 1.278291, -0.7585838, 0, 0, 0, 1, 1,
-0.2152162, -0.003682846, -1.267799, 0, 0, 0, 1, 1,
-0.2151744, -0.3483417, -4.87626, 0, 0, 0, 1, 1,
-0.2145858, 1.384523, -1.241197, 1, 1, 1, 1, 1,
-0.213682, -1.082812, -3.877155, 1, 1, 1, 1, 1,
-0.2102752, -1.959562, -3.034992, 1, 1, 1, 1, 1,
-0.2037915, -0.9114196, -2.472872, 1, 1, 1, 1, 1,
-0.1971048, 0.541167, -0.3162935, 1, 1, 1, 1, 1,
-0.1961583, 0.6515709, -0.8451835, 1, 1, 1, 1, 1,
-0.1865272, 0.7189643, 1.082992, 1, 1, 1, 1, 1,
-0.1845709, 0.536895, 1.66968, 1, 1, 1, 1, 1,
-0.1840487, -1.501969, -1.76512, 1, 1, 1, 1, 1,
-0.1813536, -0.5044324, -3.604191, 1, 1, 1, 1, 1,
-0.177371, 0.4970878, -0.06733248, 1, 1, 1, 1, 1,
-0.1739869, -0.9128832, -4.758331, 1, 1, 1, 1, 1,
-0.1697551, 0.2860277, -1.590758, 1, 1, 1, 1, 1,
-0.1638091, 0.6890876, -0.3407634, 1, 1, 1, 1, 1,
-0.1560232, -0.6908934, -1.09406, 1, 1, 1, 1, 1,
-0.154523, -0.8291661, -1.328139, 0, 0, 1, 1, 1,
-0.1535703, 0.7212871, -0.5849229, 1, 0, 0, 1, 1,
-0.1507856, 0.04522643, -0.607972, 1, 0, 0, 1, 1,
-0.1507792, -0.5078006, -2.25099, 1, 0, 0, 1, 1,
-0.1506019, 1.006958, -0.9179928, 1, 0, 0, 1, 1,
-0.1470124, -0.5443661, -1.273928, 1, 0, 0, 1, 1,
-0.1422174, 0.7742873, 1.371227, 0, 0, 0, 1, 1,
-0.1410639, 1.648919, -0.1785543, 0, 0, 0, 1, 1,
-0.1395149, -1.336217, -1.96827, 0, 0, 0, 1, 1,
-0.1364882, -0.591094, -2.719658, 0, 0, 0, 1, 1,
-0.1304959, -0.2281056, -4.707236, 0, 0, 0, 1, 1,
-0.1285822, 0.01941008, -0.5436144, 0, 0, 0, 1, 1,
-0.1236487, -0.7652279, -1.747878, 0, 0, 0, 1, 1,
-0.1216, 0.2246521, -1.817024, 1, 1, 1, 1, 1,
-0.1212998, -0.6329938, -3.247557, 1, 1, 1, 1, 1,
-0.120628, -0.644949, -2.145696, 1, 1, 1, 1, 1,
-0.1204097, 1.042036, -0.5169103, 1, 1, 1, 1, 1,
-0.1167428, -1.241008, -3.022049, 1, 1, 1, 1, 1,
-0.1158958, 0.01068758, -2.682137, 1, 1, 1, 1, 1,
-0.114846, 1.226661, -1.267154, 1, 1, 1, 1, 1,
-0.1084063, -1.882644, -1.949437, 1, 1, 1, 1, 1,
-0.107076, 0.5097306, 1.101122, 1, 1, 1, 1, 1,
-0.1047298, 0.4138318, -0.7074085, 1, 1, 1, 1, 1,
-0.1019038, 0.8112833, -0.5657015, 1, 1, 1, 1, 1,
-0.1012172, -0.3683525, -2.501029, 1, 1, 1, 1, 1,
-0.0965855, 1.324982, 0.3480384, 1, 1, 1, 1, 1,
-0.09637687, -1.3661, -3.116517, 1, 1, 1, 1, 1,
-0.08732786, -1.73608, -2.96889, 1, 1, 1, 1, 1,
-0.08509002, 1.375975, -1.360471, 0, 0, 1, 1, 1,
-0.08321913, -0.02443409, -2.182068, 1, 0, 0, 1, 1,
-0.08066659, -0.7620066, -2.494959, 1, 0, 0, 1, 1,
-0.07842052, -1.350142, -4.207375, 1, 0, 0, 1, 1,
-0.07838399, 0.454849, 1.396905, 1, 0, 0, 1, 1,
-0.07150391, -1.37934, -1.4327, 1, 0, 0, 1, 1,
-0.07088488, 0.1525362, -0.6270513, 0, 0, 0, 1, 1,
-0.06604453, 0.5609317, -0.2072967, 0, 0, 0, 1, 1,
-0.05806599, 1.148522, -0.4813341, 0, 0, 0, 1, 1,
-0.05773065, -0.02932361, -1.954778, 0, 0, 0, 1, 1,
-0.05739447, -0.1943653, -3.376551, 0, 0, 0, 1, 1,
-0.05490642, 0.6842391, 0.6818834, 0, 0, 0, 1, 1,
-0.05133177, -0.6083708, -4.654177, 0, 0, 0, 1, 1,
-0.05084875, 0.06142924, -1.040437, 1, 1, 1, 1, 1,
-0.04888018, -0.7287342, -0.5941883, 1, 1, 1, 1, 1,
-0.046119, 0.2765239, -1.136316, 1, 1, 1, 1, 1,
-0.04529084, -1.382939, -2.11119, 1, 1, 1, 1, 1,
-0.04528174, -0.1572487, -4.154529, 1, 1, 1, 1, 1,
-0.04520673, -1.884196, -3.651752, 1, 1, 1, 1, 1,
-0.04473229, 0.5288588, 0.2638051, 1, 1, 1, 1, 1,
-0.04410129, 0.3916436, -0.03581389, 1, 1, 1, 1, 1,
-0.04325219, 1.151244, 0.323848, 1, 1, 1, 1, 1,
-0.03833563, 0.549057, 0.6323185, 1, 1, 1, 1, 1,
-0.03622883, 2.012935, -0.9852208, 1, 1, 1, 1, 1,
-0.03044942, 0.1880139, 0.005371632, 1, 1, 1, 1, 1,
-0.02335767, 0.9406613, -0.7720628, 1, 1, 1, 1, 1,
-0.02275031, -0.1986562, -3.026773, 1, 1, 1, 1, 1,
-0.02266137, -0.9880154, -2.679762, 1, 1, 1, 1, 1,
-0.01588095, -0.09108528, -1.894411, 0, 0, 1, 1, 1,
-0.01299546, -0.6423909, -3.342997, 1, 0, 0, 1, 1,
-0.008542889, -0.3202834, -3.807456, 1, 0, 0, 1, 1,
-0.007385733, 1.048185, 0.1056595, 1, 0, 0, 1, 1,
-0.006063221, 1.117158, -0.2685121, 1, 0, 0, 1, 1,
-0.004862804, -0.01756498, -2.799121, 1, 0, 0, 1, 1,
-0.004503511, 0.4153949, -0.02190139, 0, 0, 0, 1, 1,
-0.003177614, 0.9230933, 0.07480388, 0, 0, 0, 1, 1,
-0.003161945, 0.3669258, 1.253424, 0, 0, 0, 1, 1,
0.0007354014, 1.078786, -0.1281152, 0, 0, 0, 1, 1,
0.003793305, 1.435055, -0.01434075, 0, 0, 0, 1, 1,
0.008838369, 1.014163, -0.9005237, 0, 0, 0, 1, 1,
0.01078111, -0.5353461, 4.960401, 0, 0, 0, 1, 1,
0.01411576, 1.190824, -0.2909928, 1, 1, 1, 1, 1,
0.01528094, 0.5138032, 2.582867, 1, 1, 1, 1, 1,
0.01544723, 1.015465, 1.498786, 1, 1, 1, 1, 1,
0.01613672, 0.9769731, -0.4824388, 1, 1, 1, 1, 1,
0.01793489, -0.1595688, 2.872838, 1, 1, 1, 1, 1,
0.01957801, -1.160082, 3.887293, 1, 1, 1, 1, 1,
0.02044847, -0.7123523, 3.145321, 1, 1, 1, 1, 1,
0.02236877, 0.8688632, 0.369139, 1, 1, 1, 1, 1,
0.02396796, -2.044787, 0.7365741, 1, 1, 1, 1, 1,
0.02487054, -0.04680732, 1.778582, 1, 1, 1, 1, 1,
0.02537378, -0.5223581, 1.379469, 1, 1, 1, 1, 1,
0.02748504, -0.7745737, 3.563421, 1, 1, 1, 1, 1,
0.02892088, 1.45262, 1.563191, 1, 1, 1, 1, 1,
0.03289615, 0.0110573, 1.018226, 1, 1, 1, 1, 1,
0.03513403, -0.3371568, 3.471322, 1, 1, 1, 1, 1,
0.0352357, 0.3974054, 0.4650861, 0, 0, 1, 1, 1,
0.03584432, 0.6470433, -0.8884184, 1, 0, 0, 1, 1,
0.04105901, -1.491518, 3.152658, 1, 0, 0, 1, 1,
0.04162724, 0.7472266, -1.228557, 1, 0, 0, 1, 1,
0.04330795, 1.433405, -0.472919, 1, 0, 0, 1, 1,
0.04906484, 0.9794121, 1.67487, 1, 0, 0, 1, 1,
0.0493433, -1.37114, 2.231652, 0, 0, 0, 1, 1,
0.04981757, 0.3365059, -0.105744, 0, 0, 0, 1, 1,
0.05569962, 0.2036656, 1.339568, 0, 0, 0, 1, 1,
0.05616977, -0.9129424, 4.03084, 0, 0, 0, 1, 1,
0.0610437, 1.348098, 1.086061, 0, 0, 0, 1, 1,
0.06330652, 0.1539505, 0.5254118, 0, 0, 0, 1, 1,
0.06715687, -0.6208947, 2.494193, 0, 0, 0, 1, 1,
0.06984586, -0.6858519, 3.227093, 1, 1, 1, 1, 1,
0.08667751, 0.01309797, 1.002288, 1, 1, 1, 1, 1,
0.088287, 1.088034, 0.003769177, 1, 1, 1, 1, 1,
0.08865596, 1.242947, -0.6818699, 1, 1, 1, 1, 1,
0.09190125, 0.9841915, -0.7486024, 1, 1, 1, 1, 1,
0.09191504, 1.982613, -0.04694601, 1, 1, 1, 1, 1,
0.09613507, 1.281179, 0.5028707, 1, 1, 1, 1, 1,
0.1045556, 0.02743871, 0.8212731, 1, 1, 1, 1, 1,
0.1074596, -0.6567014, 4.794305, 1, 1, 1, 1, 1,
0.1094731, -1.49635, 3.591976, 1, 1, 1, 1, 1,
0.1097709, -1.781083, 1.246825, 1, 1, 1, 1, 1,
0.1099176, 0.4178053, 0.1882987, 1, 1, 1, 1, 1,
0.113236, -0.08098307, 1.736934, 1, 1, 1, 1, 1,
0.1155003, -0.140264, 4.371579, 1, 1, 1, 1, 1,
0.1170088, 0.395315, -0.8033429, 1, 1, 1, 1, 1,
0.1170351, -1.341302, 2.323961, 0, 0, 1, 1, 1,
0.1199825, -1.399252, 3.340039, 1, 0, 0, 1, 1,
0.1204399, 0.6929898, -1.824863, 1, 0, 0, 1, 1,
0.1222117, 2.29502, 0.4007906, 1, 0, 0, 1, 1,
0.1240064, -0.369162, 2.369249, 1, 0, 0, 1, 1,
0.1266347, -0.01349678, 2.347752, 1, 0, 0, 1, 1,
0.1318913, 0.3759113, 0.1720156, 0, 0, 0, 1, 1,
0.1320673, 0.1137765, 1.828586, 0, 0, 0, 1, 1,
0.1323133, -0.8600666, 2.12269, 0, 0, 0, 1, 1,
0.1380786, -0.979202, 2.425522, 0, 0, 0, 1, 1,
0.1393999, 0.6709584, -1.131247, 0, 0, 0, 1, 1,
0.1427509, 1.344137, -0.3930887, 0, 0, 0, 1, 1,
0.1469489, 0.907228, 0.3820582, 0, 0, 0, 1, 1,
0.1494091, -0.4153068, 2.826868, 1, 1, 1, 1, 1,
0.1499463, 0.4945808, 0.9732598, 1, 1, 1, 1, 1,
0.1543046, 0.5362791, 0.1500802, 1, 1, 1, 1, 1,
0.1550959, -1.872404, 1.89086, 1, 1, 1, 1, 1,
0.1553037, 0.4073277, 0.7876353, 1, 1, 1, 1, 1,
0.1604709, 0.343206, 0.7870992, 1, 1, 1, 1, 1,
0.1652337, 0.6569098, -0.4581089, 1, 1, 1, 1, 1,
0.1693408, 1.021177, -0.2839914, 1, 1, 1, 1, 1,
0.1695334, -0.8609636, 2.559624, 1, 1, 1, 1, 1,
0.1702134, -0.3156631, 3.39284, 1, 1, 1, 1, 1,
0.1714312, 0.05040433, 3.903156, 1, 1, 1, 1, 1,
0.1717438, 1.293137, 0.9172909, 1, 1, 1, 1, 1,
0.173089, -0.3182837, 1.160326, 1, 1, 1, 1, 1,
0.1783182, -0.1601946, 3.629556, 1, 1, 1, 1, 1,
0.1827989, 1.946744, 0.4883712, 1, 1, 1, 1, 1,
0.1829037, 0.8930022, -0.04637249, 0, 0, 1, 1, 1,
0.1831238, -0.7557922, 3.426685, 1, 0, 0, 1, 1,
0.1863904, 0.1270502, 1.085602, 1, 0, 0, 1, 1,
0.1886971, 1.070609, 0.9610301, 1, 0, 0, 1, 1,
0.1904604, -0.5401403, 0.3675365, 1, 0, 0, 1, 1,
0.1908779, -0.2379472, 3.937402, 1, 0, 0, 1, 1,
0.1942939, 0.3049145, 0.04954958, 0, 0, 0, 1, 1,
0.2010951, -0.1096131, 1.893346, 0, 0, 0, 1, 1,
0.2033937, 0.8183889, -0.4992551, 0, 0, 0, 1, 1,
0.2076335, 1.038474, 0.96543, 0, 0, 0, 1, 1,
0.2076717, 1.413115, 0.4395346, 0, 0, 0, 1, 1,
0.208191, -1.087554, 3.538149, 0, 0, 0, 1, 1,
0.2092094, 0.557233, 0.8049734, 0, 0, 0, 1, 1,
0.210917, 1.481812, 1.295576, 1, 1, 1, 1, 1,
0.2117439, 0.7086202, -0.50408, 1, 1, 1, 1, 1,
0.2134185, 1.625363, 1.205846, 1, 1, 1, 1, 1,
0.2211196, 0.3875539, -0.2708375, 1, 1, 1, 1, 1,
0.2256627, 1.090975, -0.9313623, 1, 1, 1, 1, 1,
0.2294989, -0.3349991, 0.9994622, 1, 1, 1, 1, 1,
0.2300387, -0.8104271, 1.993892, 1, 1, 1, 1, 1,
0.2308984, -0.09871514, 1.626807, 1, 1, 1, 1, 1,
0.2337233, 1.109941, 0.9302665, 1, 1, 1, 1, 1,
0.2351104, -2.355563, 3.607811, 1, 1, 1, 1, 1,
0.2365603, 1.60867, -0.8077255, 1, 1, 1, 1, 1,
0.237497, -2.4999, 3.032283, 1, 1, 1, 1, 1,
0.2388102, 0.7189652, -0.04842715, 1, 1, 1, 1, 1,
0.2456566, 0.4624098, 0.2351018, 1, 1, 1, 1, 1,
0.2460517, -0.2577741, 3.127708, 1, 1, 1, 1, 1,
0.2468655, 2.117668, -0.01796563, 0, 0, 1, 1, 1,
0.249296, 1.544449, 1.96358, 1, 0, 0, 1, 1,
0.2537405, -0.5405248, 2.661539, 1, 0, 0, 1, 1,
0.2546619, -1.159655, 2.996644, 1, 0, 0, 1, 1,
0.2547266, -0.1339556, 1.79495, 1, 0, 0, 1, 1,
0.2588251, -0.7090675, 4.725985, 1, 0, 0, 1, 1,
0.2624733, 0.6660118, 0.6572783, 0, 0, 0, 1, 1,
0.2651724, 1.929933, -0.8443355, 0, 0, 0, 1, 1,
0.2670249, 1.39976, -1.102567, 0, 0, 0, 1, 1,
0.271678, -0.5206028, 3.344164, 0, 0, 0, 1, 1,
0.2733639, 0.003533066, 3.837068, 0, 0, 0, 1, 1,
0.2734101, -1.543431, 2.407471, 0, 0, 0, 1, 1,
0.2802446, -1.938035, 2.659588, 0, 0, 0, 1, 1,
0.2804112, -0.4992275, 2.583753, 1, 1, 1, 1, 1,
0.287438, -1.113536, 1.862623, 1, 1, 1, 1, 1,
0.2876119, 1.740069, 1.491266, 1, 1, 1, 1, 1,
0.2893876, 0.208938, 1.627448, 1, 1, 1, 1, 1,
0.2944235, 1.110246, 0.03949943, 1, 1, 1, 1, 1,
0.2959539, -1.091052, 3.158065, 1, 1, 1, 1, 1,
0.2962512, -0.3073703, 0.4117075, 1, 1, 1, 1, 1,
0.2978744, 0.2787067, -0.405952, 1, 1, 1, 1, 1,
0.2987866, -2.729844, 3.850183, 1, 1, 1, 1, 1,
0.3001696, -0.04765286, 0.9972519, 1, 1, 1, 1, 1,
0.3016132, -0.4962241, 2.77997, 1, 1, 1, 1, 1,
0.3021784, -1.16578, 3.352489, 1, 1, 1, 1, 1,
0.3030709, -1.374675, 4.638481, 1, 1, 1, 1, 1,
0.3050538, 2.665565, 1.789375, 1, 1, 1, 1, 1,
0.3054688, -0.04297571, 1.613848, 1, 1, 1, 1, 1,
0.3055865, 0.4987039, 1.486968, 0, 0, 1, 1, 1,
0.3094487, -0.4115682, 3.676613, 1, 0, 0, 1, 1,
0.32815, -0.1859277, 2.777483, 1, 0, 0, 1, 1,
0.3286911, 0.3868462, 1.06728, 1, 0, 0, 1, 1,
0.334599, 0.1381616, 0.9322882, 1, 0, 0, 1, 1,
0.3356167, -1.726493, 3.563627, 1, 0, 0, 1, 1,
0.3363881, 0.7022053, 1.647428, 0, 0, 0, 1, 1,
0.3401389, 0.9127411, 1.180821, 0, 0, 0, 1, 1,
0.3406834, 0.7582263, 2.958324, 0, 0, 0, 1, 1,
0.340787, 1.896824, -1.316487, 0, 0, 0, 1, 1,
0.3411144, 0.07030117, 2.518889, 0, 0, 0, 1, 1,
0.3438866, -1.19674, 3.005487, 0, 0, 0, 1, 1,
0.3464903, 1.492854, 0.1515055, 0, 0, 0, 1, 1,
0.3523592, 0.4098265, 1.617769, 1, 1, 1, 1, 1,
0.3572099, -1.827162, 4.025826, 1, 1, 1, 1, 1,
0.3642256, 0.08024127, 1.820446, 1, 1, 1, 1, 1,
0.364533, -0.8859932, 4.416587, 1, 1, 1, 1, 1,
0.3654712, -0.7338094, 1.403684, 1, 1, 1, 1, 1,
0.3666202, -1.210913, 3.604836, 1, 1, 1, 1, 1,
0.3670062, -0.3761303, 3.564784, 1, 1, 1, 1, 1,
0.3695663, 1.30325, 1.713743, 1, 1, 1, 1, 1,
0.3725702, 1.704212, 0.2477727, 1, 1, 1, 1, 1,
0.3738316, 0.6875944, 0.4062271, 1, 1, 1, 1, 1,
0.3751678, -0.4019118, 3.94634, 1, 1, 1, 1, 1,
0.3757183, 0.8027034, -1.258507, 1, 1, 1, 1, 1,
0.377723, 0.7663368, 0.7407065, 1, 1, 1, 1, 1,
0.3785329, -0.6192027, 1.906996, 1, 1, 1, 1, 1,
0.3801808, 0.2082054, 0.3841449, 1, 1, 1, 1, 1,
0.3922189, 0.3674158, 1.37223, 0, 0, 1, 1, 1,
0.3930304, -0.3491472, 2.755823, 1, 0, 0, 1, 1,
0.3984786, -0.1421469, 2.014423, 1, 0, 0, 1, 1,
0.3997896, 0.1923999, 1.152518, 1, 0, 0, 1, 1,
0.4020488, -1.904651, 1.553587, 1, 0, 0, 1, 1,
0.4051216, 0.7515839, 1.061012, 1, 0, 0, 1, 1,
0.4125617, 0.6983536, 1.119008, 0, 0, 0, 1, 1,
0.4128283, 0.3498656, 0.9034446, 0, 0, 0, 1, 1,
0.4154323, 1.407818, -1.610573, 0, 0, 0, 1, 1,
0.4157681, 0.7059121, 1.739516, 0, 0, 0, 1, 1,
0.4207104, -0.3342917, 2.954226, 0, 0, 0, 1, 1,
0.4230907, 0.6492618, 1.04244, 0, 0, 0, 1, 1,
0.4256801, 0.1161204, 0.7171369, 0, 0, 0, 1, 1,
0.4266446, -0.784465, 3.317624, 1, 1, 1, 1, 1,
0.4285132, -0.4714153, 2.903952, 1, 1, 1, 1, 1,
0.4331668, -0.960731, 3.422748, 1, 1, 1, 1, 1,
0.433995, 0.8366536, 0.3724312, 1, 1, 1, 1, 1,
0.4381392, 0.5360393, 0.2463135, 1, 1, 1, 1, 1,
0.4413089, 0.294139, 2.327752, 1, 1, 1, 1, 1,
0.4419601, 0.6188397, 2.772332, 1, 1, 1, 1, 1,
0.4438947, 0.02197288, 0.4196781, 1, 1, 1, 1, 1,
0.4459122, 0.02600257, 1.600014, 1, 1, 1, 1, 1,
0.4526417, -0.07004296, 0.8292952, 1, 1, 1, 1, 1,
0.4540555, -0.3361464, 2.45886, 1, 1, 1, 1, 1,
0.4544802, 0.4576966, 2.065962, 1, 1, 1, 1, 1,
0.4553873, -0.2009195, 2.856512, 1, 1, 1, 1, 1,
0.4557951, 0.6728953, -0.8845107, 1, 1, 1, 1, 1,
0.4565234, -0.9235646, 3.950351, 1, 1, 1, 1, 1,
0.4623235, 0.8385926, 1.497703, 0, 0, 1, 1, 1,
0.4678127, -0.6309806, 2.737096, 1, 0, 0, 1, 1,
0.4695008, -2.197403, 2.782198, 1, 0, 0, 1, 1,
0.474049, 0.07097535, 2.163015, 1, 0, 0, 1, 1,
0.4794603, -0.5906596, 2.555211, 1, 0, 0, 1, 1,
0.4853195, -0.03314662, 2.572911, 1, 0, 0, 1, 1,
0.4867777, -0.4859355, 1.548535, 0, 0, 0, 1, 1,
0.4870602, -0.7862221, 4.284027, 0, 0, 0, 1, 1,
0.493325, 0.8321212, 1.073072, 0, 0, 0, 1, 1,
0.4948095, 0.02037162, -0.5150725, 0, 0, 0, 1, 1,
0.498891, -1.569164, 3.127802, 0, 0, 0, 1, 1,
0.5006824, 0.2159452, 1.898638, 0, 0, 0, 1, 1,
0.5014964, 0.191557, 1.611823, 0, 0, 0, 1, 1,
0.5023118, 1.143625, 1.059308, 1, 1, 1, 1, 1,
0.5032459, 0.8500608, 0.7553625, 1, 1, 1, 1, 1,
0.5052022, -0.9780661, 3.64819, 1, 1, 1, 1, 1,
0.5064725, 1.16389, 1.388662, 1, 1, 1, 1, 1,
0.5131788, -0.4872163, 1.500466, 1, 1, 1, 1, 1,
0.5271176, 0.505103, 0.6949617, 1, 1, 1, 1, 1,
0.528956, -0.5736646, 2.190155, 1, 1, 1, 1, 1,
0.5332657, 0.02404021, -0.001614425, 1, 1, 1, 1, 1,
0.5344283, 0.8137217, 2.89761, 1, 1, 1, 1, 1,
0.5440294, -0.4179945, 0.6553751, 1, 1, 1, 1, 1,
0.5449663, 1.257743, 0.1130063, 1, 1, 1, 1, 1,
0.5458391, 2.880298, 0.8234509, 1, 1, 1, 1, 1,
0.5462434, -1.287605, 3.849149, 1, 1, 1, 1, 1,
0.5489861, -0.8236801, 2.842877, 1, 1, 1, 1, 1,
0.5519789, -0.1203164, 1.479587, 1, 1, 1, 1, 1,
0.5529264, -1.351794, 3.069899, 0, 0, 1, 1, 1,
0.5530796, -0.2866559, 2.358209, 1, 0, 0, 1, 1,
0.553284, -0.6765168, 1.115587, 1, 0, 0, 1, 1,
0.5598952, -0.8590651, 2.446307, 1, 0, 0, 1, 1,
0.5664237, -2.207428, 2.550211, 1, 0, 0, 1, 1,
0.5671363, 1.115435, -0.3541757, 1, 0, 0, 1, 1,
0.5694562, 0.1204204, 2.722991, 0, 0, 0, 1, 1,
0.57696, -0.943398, 3.334462, 0, 0, 0, 1, 1,
0.577795, -1.303226, 2.533645, 0, 0, 0, 1, 1,
0.578551, 0.5585076, 2.233851, 0, 0, 0, 1, 1,
0.5813423, 2.658088, 1.627503, 0, 0, 0, 1, 1,
0.581882, 3.497513, -1.249387, 0, 0, 0, 1, 1,
0.583107, 0.06965463, 1.436091, 0, 0, 0, 1, 1,
0.5840755, 1.767112, -1.077183, 1, 1, 1, 1, 1,
0.5888665, 0.7635145, -0.6648179, 1, 1, 1, 1, 1,
0.5986805, 0.5109119, -1.227406, 1, 1, 1, 1, 1,
0.6028029, 0.6597562, 1.322505, 1, 1, 1, 1, 1,
0.6042838, -0.5606477, 3.147146, 1, 1, 1, 1, 1,
0.6048664, 0.6149734, 0.2428131, 1, 1, 1, 1, 1,
0.6055645, 0.3220782, 0.8915514, 1, 1, 1, 1, 1,
0.6145874, -1.03479, 1.243407, 1, 1, 1, 1, 1,
0.6151589, -0.7062316, 1.561409, 1, 1, 1, 1, 1,
0.6186963, -0.6593289, 2.233554, 1, 1, 1, 1, 1,
0.6207182, -0.1775073, 1.017773, 1, 1, 1, 1, 1,
0.625043, 0.4069585, 0.1649477, 1, 1, 1, 1, 1,
0.6261021, 1.730285, -0.2292466, 1, 1, 1, 1, 1,
0.6307414, 1.187487, 0.4095628, 1, 1, 1, 1, 1,
0.6347945, -0.756272, 1.724831, 1, 1, 1, 1, 1,
0.6349831, 0.8747233, 1.050919, 0, 0, 1, 1, 1,
0.6376178, -0.5131517, 2.488283, 1, 0, 0, 1, 1,
0.6415287, 0.9312936, 1.211883, 1, 0, 0, 1, 1,
0.6435713, 0.8582355, -0.3390592, 1, 0, 0, 1, 1,
0.6439958, 0.2222486, 1.635869, 1, 0, 0, 1, 1,
0.6453558, -1.619089, 2.736646, 1, 0, 0, 1, 1,
0.6480109, -1.115073, 1.041212, 0, 0, 0, 1, 1,
0.6499987, -1.645106, 2.458684, 0, 0, 0, 1, 1,
0.6525269, 0.5883466, 0.1877284, 0, 0, 0, 1, 1,
0.6571378, -1.168106, 1.868377, 0, 0, 0, 1, 1,
0.6651577, 0.9222127, 1.801777, 0, 0, 0, 1, 1,
0.6658495, -1.092994, 1.669473, 0, 0, 0, 1, 1,
0.6668901, 0.3415511, 1.507891, 0, 0, 0, 1, 1,
0.6696852, -1.229295, 2.166403, 1, 1, 1, 1, 1,
0.6700611, -0.178738, 3.768692, 1, 1, 1, 1, 1,
0.6730905, -0.387246, 2.99487, 1, 1, 1, 1, 1,
0.6735377, -0.05586495, 3.458767, 1, 1, 1, 1, 1,
0.6744065, -0.2796247, 2.468735, 1, 1, 1, 1, 1,
0.6751275, -2.044976, 2.985568, 1, 1, 1, 1, 1,
0.6753608, 0.9480004, 0.5636265, 1, 1, 1, 1, 1,
0.6828634, -0.4741297, 3.376306, 1, 1, 1, 1, 1,
0.6829684, -1.21185, 3.441085, 1, 1, 1, 1, 1,
0.6843255, 2.332542, -0.5263947, 1, 1, 1, 1, 1,
0.6970106, -0.5772294, 3.448106, 1, 1, 1, 1, 1,
0.6984877, -1.0962, 2.966199, 1, 1, 1, 1, 1,
0.6997644, -0.8789993, 2.409332, 1, 1, 1, 1, 1,
0.6999376, 0.1746235, 1.686062, 1, 1, 1, 1, 1,
0.7233713, -0.1670377, 3.416429, 1, 1, 1, 1, 1,
0.7235686, 0.1434415, 3.002062, 0, 0, 1, 1, 1,
0.7254925, -1.89839, 2.872095, 1, 0, 0, 1, 1,
0.727179, -3.190522, 2.759773, 1, 0, 0, 1, 1,
0.7337329, 0.8040944, 1.288977, 1, 0, 0, 1, 1,
0.7349446, -0.09832788, 2.381462, 1, 0, 0, 1, 1,
0.7358792, 1.777128, 3.00745, 1, 0, 0, 1, 1,
0.738235, 0.482273, -0.06091598, 0, 0, 0, 1, 1,
0.7405275, -0.6976326, 1.590479, 0, 0, 0, 1, 1,
0.7413502, 0.3010725, 0.1462688, 0, 0, 0, 1, 1,
0.7453223, -1.254748, 1.298, 0, 0, 0, 1, 1,
0.7561616, -0.8595496, 4.515122, 0, 0, 0, 1, 1,
0.7562129, -0.3965, 2.262962, 0, 0, 0, 1, 1,
0.7571247, -1.255919, 3.745228, 0, 0, 0, 1, 1,
0.7580243, 0.3957215, 1.744493, 1, 1, 1, 1, 1,
0.7584136, 0.1970505, 1.513834, 1, 1, 1, 1, 1,
0.7591484, 0.6653261, 1.321597, 1, 1, 1, 1, 1,
0.7601524, 0.03253336, 0.5187792, 1, 1, 1, 1, 1,
0.7672028, -0.7607163, 2.471459, 1, 1, 1, 1, 1,
0.771807, 0.1715845, 1.71898, 1, 1, 1, 1, 1,
0.7744783, 0.3819978, 2.024308, 1, 1, 1, 1, 1,
0.775771, 0.91311, 1.833879, 1, 1, 1, 1, 1,
0.7799522, 0.3082781, 0.3657149, 1, 1, 1, 1, 1,
0.7818813, -0.6629313, 2.952473, 1, 1, 1, 1, 1,
0.78491, -0.7559935, 0.7076523, 1, 1, 1, 1, 1,
0.790839, -0.2627428, 2.816324, 1, 1, 1, 1, 1,
0.7950541, 2.129007, 0.5841694, 1, 1, 1, 1, 1,
0.7990221, 0.4281531, -0.8370649, 1, 1, 1, 1, 1,
0.8011394, -0.3550802, 1.153823, 1, 1, 1, 1, 1,
0.8040959, -0.1348617, 3.836897, 0, 0, 1, 1, 1,
0.8066589, 0.763422, -0.9498592, 1, 0, 0, 1, 1,
0.8067361, -0.2759911, 1.55351, 1, 0, 0, 1, 1,
0.8071966, -0.2045656, 3.088764, 1, 0, 0, 1, 1,
0.8085118, 1.16849, 2.268002, 1, 0, 0, 1, 1,
0.8089685, -0.07186984, 2.369274, 1, 0, 0, 1, 1,
0.8123319, -0.7581384, 2.292942, 0, 0, 0, 1, 1,
0.8126223, 0.2990411, 1.207594, 0, 0, 0, 1, 1,
0.8131637, -0.9548504, 4.350331, 0, 0, 0, 1, 1,
0.8136253, -1.174314, -0.03126429, 0, 0, 0, 1, 1,
0.8236118, 1.631126, 0.7112757, 0, 0, 0, 1, 1,
0.8248508, 1.000186, 2.299067, 0, 0, 0, 1, 1,
0.8265603, -1.072851, 1.536633, 0, 0, 0, 1, 1,
0.835936, 0.003265149, 2.425225, 1, 1, 1, 1, 1,
0.8382559, -0.468223, 1.930327, 1, 1, 1, 1, 1,
0.8402606, 0.1015286, 1.056493, 1, 1, 1, 1, 1,
0.8441006, -0.3146193, 1.038075, 1, 1, 1, 1, 1,
0.8442887, 0.6679121, 0.4207827, 1, 1, 1, 1, 1,
0.8443369, 0.9172239, -0.350174, 1, 1, 1, 1, 1,
0.8445489, 1.297257, 1.073893, 1, 1, 1, 1, 1,
0.8447831, -0.9679599, 2.053071, 1, 1, 1, 1, 1,
0.8501598, -1.448787, 4.009578, 1, 1, 1, 1, 1,
0.8511074, -0.1644064, 3.499442, 1, 1, 1, 1, 1,
0.8549914, -0.4530085, 2.529403, 1, 1, 1, 1, 1,
0.8571026, -1.003666, 2.611425, 1, 1, 1, 1, 1,
0.8654683, -2.255803, 3.145307, 1, 1, 1, 1, 1,
0.867256, 1.251784, 0.7334558, 1, 1, 1, 1, 1,
0.8708483, -0.09430113, 2.604117, 1, 1, 1, 1, 1,
0.8761773, 0.2303756, 1.614746, 0, 0, 1, 1, 1,
0.8767221, -0.1326574, 1.522413, 1, 0, 0, 1, 1,
0.8774312, -1.323536, 2.803812, 1, 0, 0, 1, 1,
0.8784325, 2.722042, 1.956456, 1, 0, 0, 1, 1,
0.8835742, 1.09988, 0.4174868, 1, 0, 0, 1, 1,
0.8852867, -0.8121848, 1.429446, 1, 0, 0, 1, 1,
0.9001405, -1.583373, 1.401511, 0, 0, 0, 1, 1,
0.9003123, 1.839227, -0.4841988, 0, 0, 0, 1, 1,
0.9043146, 0.1909387, 0.0623164, 0, 0, 0, 1, 1,
0.9104879, 0.1229832, 2.17536, 0, 0, 0, 1, 1,
0.9280601, 0.9849908, 0.6547546, 0, 0, 0, 1, 1,
0.9372538, 1.401206, 0.7916132, 0, 0, 0, 1, 1,
0.9391757, -1.292989, 2.353862, 0, 0, 0, 1, 1,
0.9398732, 0.2146558, 0.05134279, 1, 1, 1, 1, 1,
0.9435014, -0.8617017, 1.749528, 1, 1, 1, 1, 1,
0.9469362, -0.6814456, 1.078224, 1, 1, 1, 1, 1,
0.9488887, 0.8238608, 1.249042, 1, 1, 1, 1, 1,
0.9578484, -1.019976, 3.909044, 1, 1, 1, 1, 1,
0.9714708, 1.388114, -0.516361, 1, 1, 1, 1, 1,
0.9807646, -0.3625258, 2.462152, 1, 1, 1, 1, 1,
0.9833882, -2.309954, 1.801052, 1, 1, 1, 1, 1,
0.983803, 0.2970755, 0.5138448, 1, 1, 1, 1, 1,
0.9866096, -1.319798, 2.649404, 1, 1, 1, 1, 1,
0.992136, -0.5346761, 2.715948, 1, 1, 1, 1, 1,
0.9932508, 0.9236633, 0.719834, 1, 1, 1, 1, 1,
0.9941457, 1.163449, 0.05918968, 1, 1, 1, 1, 1,
0.9962941, -0.8560047, 2.551191, 1, 1, 1, 1, 1,
1.003646, -0.5533797, 0.1608946, 1, 1, 1, 1, 1,
1.003996, 0.05494351, 1.760765, 0, 0, 1, 1, 1,
1.005276, 0.04650756, 1.407777, 1, 0, 0, 1, 1,
1.00583, -0.3428783, 1.231783, 1, 0, 0, 1, 1,
1.024939, -0.3574927, 2.854901, 1, 0, 0, 1, 1,
1.030886, -1.662376, 2.240022, 1, 0, 0, 1, 1,
1.035778, 1.444153, 0.4490268, 1, 0, 0, 1, 1,
1.05045, 0.5702152, 0.8880711, 0, 0, 0, 1, 1,
1.051358, 1.089861, 1.061936, 0, 0, 0, 1, 1,
1.052251, -0.07309874, 1.207626, 0, 0, 0, 1, 1,
1.05266, -0.3866287, 3.332683, 0, 0, 0, 1, 1,
1.057916, -0.6699789, 1.078076, 0, 0, 0, 1, 1,
1.05929, -1.791829, 2.862762, 0, 0, 0, 1, 1,
1.062171, -0.2847884, 3.030576, 0, 0, 0, 1, 1,
1.071329, 0.3537916, 2.093978, 1, 1, 1, 1, 1,
1.077474, -1.447127, 1.510539, 1, 1, 1, 1, 1,
1.099465, 0.6018928, 1.540699, 1, 1, 1, 1, 1,
1.103415, 1.689707, -1.569004, 1, 1, 1, 1, 1,
1.10679, -1.20366, 3.788182, 1, 1, 1, 1, 1,
1.109138, 0.8534307, 0.3305777, 1, 1, 1, 1, 1,
1.111289, -0.3866068, 2.255667, 1, 1, 1, 1, 1,
1.117905, -0.6963963, 2.905797, 1, 1, 1, 1, 1,
1.13103, -0.885187, 2.73812, 1, 1, 1, 1, 1,
1.134363, -1.919978, 2.613146, 1, 1, 1, 1, 1,
1.135884, -0.4267127, 2.686288, 1, 1, 1, 1, 1,
1.149781, 0.5472951, 1.75702, 1, 1, 1, 1, 1,
1.152829, 1.021949, 0.0980233, 1, 1, 1, 1, 1,
1.154615, 0.2110458, 1.31792, 1, 1, 1, 1, 1,
1.161562, 0.1188931, 1.222565, 1, 1, 1, 1, 1,
1.167612, 0.71513, 0.6604641, 0, 0, 1, 1, 1,
1.169094, 0.3768152, 2.086992, 1, 0, 0, 1, 1,
1.171535, 0.1893229, 0.8606021, 1, 0, 0, 1, 1,
1.191633, 0.5885204, 3.619921, 1, 0, 0, 1, 1,
1.2008, 0.1031944, 2.336436, 1, 0, 0, 1, 1,
1.202344, -0.1151169, 1.546435, 1, 0, 0, 1, 1,
1.218961, 0.6854219, -1.20952, 0, 0, 0, 1, 1,
1.220059, 0.2623132, -0.8027105, 0, 0, 0, 1, 1,
1.226579, -0.9850184, 2.414243, 0, 0, 0, 1, 1,
1.228301, 0.8736853, 0.4747878, 0, 0, 0, 1, 1,
1.235876, -0.03948974, 0.1052766, 0, 0, 0, 1, 1,
1.241718, 0.5732345, 0.7944756, 0, 0, 0, 1, 1,
1.249936, 0.9274633, 1.648, 0, 0, 0, 1, 1,
1.253724, -0.6278633, 1.858973, 1, 1, 1, 1, 1,
1.266214, 1.651951, 1.32099, 1, 1, 1, 1, 1,
1.271577, -0.7687134, 1.669158, 1, 1, 1, 1, 1,
1.275016, -0.6284522, 1.69896, 1, 1, 1, 1, 1,
1.285881, 1.936012, 0.2966352, 1, 1, 1, 1, 1,
1.288055, -0.007429861, 1.56205, 1, 1, 1, 1, 1,
1.289655, 1.111881, 1.55544, 1, 1, 1, 1, 1,
1.299563, -1.328571, 2.245891, 1, 1, 1, 1, 1,
1.300519, 1.551483, 0.822656, 1, 1, 1, 1, 1,
1.30555, -0.1260172, -0.3554835, 1, 1, 1, 1, 1,
1.309814, 0.5037943, 3.029495, 1, 1, 1, 1, 1,
1.310788, -0.111882, 0.1662513, 1, 1, 1, 1, 1,
1.334319, 0.5524605, 1.187736, 1, 1, 1, 1, 1,
1.341577, 0.2340152, 0.00166123, 1, 1, 1, 1, 1,
1.342847, 1.487417, 2.242649, 1, 1, 1, 1, 1,
1.349961, -0.5936769, 1.080767, 0, 0, 1, 1, 1,
1.360644, -0.3698699, 1.824853, 1, 0, 0, 1, 1,
1.371095, -0.9449112, -0.07301932, 1, 0, 0, 1, 1,
1.375022, 1.403871, -0.1829802, 1, 0, 0, 1, 1,
1.381657, 0.7984085, 1.429018, 1, 0, 0, 1, 1,
1.384109, -1.327567, 0.7986672, 1, 0, 0, 1, 1,
1.397455, 1.016553, 1.252477, 0, 0, 0, 1, 1,
1.408418, -0.6052404, 2.090214, 0, 0, 0, 1, 1,
1.412181, 0.3132375, 2.228864, 0, 0, 0, 1, 1,
1.412466, 1.083418, -0.7800378, 0, 0, 0, 1, 1,
1.418711, -0.4639325, 0.6491564, 0, 0, 0, 1, 1,
1.428213, 0.2080662, -0.3540147, 0, 0, 0, 1, 1,
1.439142, -0.6273717, 1.396469, 0, 0, 0, 1, 1,
1.471222, 0.2173484, 0.8853092, 1, 1, 1, 1, 1,
1.489263, -1.933573, 2.664692, 1, 1, 1, 1, 1,
1.510354, 0.1204009, 1.003548, 1, 1, 1, 1, 1,
1.513444, -0.1383909, 2.500489, 1, 1, 1, 1, 1,
1.51597, -0.897294, 2.853807, 1, 1, 1, 1, 1,
1.522655, 0.7741119, 2.128035, 1, 1, 1, 1, 1,
1.549447, 0.4964349, 1.031084, 1, 1, 1, 1, 1,
1.551614, 0.7967678, 1.009213, 1, 1, 1, 1, 1,
1.557244, -2.166316, 3.462685, 1, 1, 1, 1, 1,
1.565701, 1.418317, 1.0304, 1, 1, 1, 1, 1,
1.586559, -1.485198, 1.676917, 1, 1, 1, 1, 1,
1.617775, -1.313851, 4.014443, 1, 1, 1, 1, 1,
1.628902, -0.6603535, -0.1950883, 1, 1, 1, 1, 1,
1.630948, 1.626496, 2.465435, 1, 1, 1, 1, 1,
1.645542, -0.2922933, 1.994207, 1, 1, 1, 1, 1,
1.647842, 1.479341, 1.149007, 0, 0, 1, 1, 1,
1.6627, -0.6406104, 3.41599, 1, 0, 0, 1, 1,
1.663395, 1.199727, 0.1147666, 1, 0, 0, 1, 1,
1.664224, -0.03329899, 2.098785, 1, 0, 0, 1, 1,
1.671762, 0.4318695, 2.406147, 1, 0, 0, 1, 1,
1.710799, -0.362276, 0.4235914, 1, 0, 0, 1, 1,
1.717575, -2.105242, 3.679024, 0, 0, 0, 1, 1,
1.720221, 0.2988904, 0.8803176, 0, 0, 0, 1, 1,
1.722515, 0.2127135, 1.233477, 0, 0, 0, 1, 1,
1.753687, -0.7612467, 0.08398461, 0, 0, 0, 1, 1,
1.769401, -0.5496756, 2.7506, 0, 0, 0, 1, 1,
1.770115, 0.07607476, 2.510218, 0, 0, 0, 1, 1,
1.802772, 0.9331539, 1.100577, 0, 0, 0, 1, 1,
1.822889, -2.011844, 2.203907, 1, 1, 1, 1, 1,
1.835952, 0.3927359, -0.844574, 1, 1, 1, 1, 1,
1.84128, -0.5677056, 2.281973, 1, 1, 1, 1, 1,
1.865899, 1.339813, -0.6891996, 1, 1, 1, 1, 1,
1.901756, -0.5156109, 1.942078, 1, 1, 1, 1, 1,
1.928141, 0.6167895, 1.524453, 1, 1, 1, 1, 1,
1.941946, -0.863621, 2.355474, 1, 1, 1, 1, 1,
1.942986, 0.6298814, 0.5155425, 1, 1, 1, 1, 1,
1.962364, 0.1481448, 3.192425, 1, 1, 1, 1, 1,
1.963412, -1.348513, 2.439765, 1, 1, 1, 1, 1,
1.978649, 0.5407888, 0.4623574, 1, 1, 1, 1, 1,
1.983069, -0.9926889, 1.016599, 1, 1, 1, 1, 1,
2.00817, 0.7508029, 4.250662, 1, 1, 1, 1, 1,
2.009495, -0.9138054, 2.561315, 1, 1, 1, 1, 1,
2.025454, -0.8835857, 1.824157, 1, 1, 1, 1, 1,
2.038125, 0.297317, 0.05103765, 0, 0, 1, 1, 1,
2.062543, -0.1324577, 0.7314668, 1, 0, 0, 1, 1,
2.063628, -0.2808231, 1.723627, 1, 0, 0, 1, 1,
2.072881, -0.457742, 2.165909, 1, 0, 0, 1, 1,
2.081338, -0.1710023, 2.82057, 1, 0, 0, 1, 1,
2.115285, -0.9790323, 2.629241, 1, 0, 0, 1, 1,
2.118285, 1.222481, 4.436713, 0, 0, 0, 1, 1,
2.143788, -0.700439, 1.008614, 0, 0, 0, 1, 1,
2.162188, 0.907459, 0.5831696, 0, 0, 0, 1, 1,
2.165419, 0.8032526, 0.3417931, 0, 0, 0, 1, 1,
2.198644, -0.6540893, 1.635453, 0, 0, 0, 1, 1,
2.209091, -0.7277297, 0.05164679, 0, 0, 0, 1, 1,
2.25297, 1.560156, 2.473472, 0, 0, 0, 1, 1,
2.265656, 1.464291, 0.06220628, 1, 1, 1, 1, 1,
2.269013, 0.2129974, 2.176697, 1, 1, 1, 1, 1,
2.376822, -0.02412176, 2.175037, 1, 1, 1, 1, 1,
2.390618, 1.883078, 1.69479, 1, 1, 1, 1, 1,
2.471012, 0.4349899, 2.653665, 1, 1, 1, 1, 1,
2.5093, 0.107594, 1.490972, 1, 1, 1, 1, 1,
2.93607, 0.02106435, 0.68807, 1, 1, 1, 1, 1
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
var radius = 9.613985;
var distance = 33.76871;
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
mvMatrix.translate( 0.1539932, -0.1534953, 0.4261668 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.76871);
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
