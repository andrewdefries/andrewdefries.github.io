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
-3.19013, 0.2225585, -2.958196, 1, 0, 0, 1,
-2.52293, 0.5539142, -3.055439, 1, 0.007843138, 0, 1,
-2.475754, 1.455418, 0.426586, 1, 0.01176471, 0, 1,
-2.440628, -0.4801518, -1.476994, 1, 0.01960784, 0, 1,
-2.426765, 0.231366, -1.673086, 1, 0.02352941, 0, 1,
-2.383966, 0.1753988, -1.445398, 1, 0.03137255, 0, 1,
-2.291834, -0.4804185, -1.39359, 1, 0.03529412, 0, 1,
-2.268976, -1.582354, -2.515993, 1, 0.04313726, 0, 1,
-2.25905, 0.3951887, -2.493968, 1, 0.04705882, 0, 1,
-2.254012, -2.666221, -2.142706, 1, 0.05490196, 0, 1,
-2.235155, 1.413782, -2.70323, 1, 0.05882353, 0, 1,
-2.225806, 0.7858718, -0.2450875, 1, 0.06666667, 0, 1,
-2.206069, 0.7148497, -0.8250515, 1, 0.07058824, 0, 1,
-2.137061, -2.307275, -3.164667, 1, 0.07843138, 0, 1,
-2.11122, -1.072727, -2.018236, 1, 0.08235294, 0, 1,
-2.063347, 1.033015, -0.8403735, 1, 0.09019608, 0, 1,
-2.057588, -0.8840478, -3.302766, 1, 0.09411765, 0, 1,
-1.995287, -0.4389223, -0.9323206, 1, 0.1019608, 0, 1,
-1.991958, 2.103969, -0.1206964, 1, 0.1098039, 0, 1,
-1.940552, -1.268458, -3.050866, 1, 0.1137255, 0, 1,
-1.916289, 1.515055, -1.220228, 1, 0.1215686, 0, 1,
-1.909409, -0.8943498, -2.011574, 1, 0.1254902, 0, 1,
-1.9037, -0.6175064, -0.9919527, 1, 0.1333333, 0, 1,
-1.897085, -1.265058, -2.863613, 1, 0.1372549, 0, 1,
-1.889861, -2.431647, -4.127525, 1, 0.145098, 0, 1,
-1.886523, -0.2266115, -0.2176105, 1, 0.1490196, 0, 1,
-1.841649, 0.2179952, -3.500804, 1, 0.1568628, 0, 1,
-1.827395, -0.7665821, -1.281115, 1, 0.1607843, 0, 1,
-1.814562, -0.2508348, -3.394938, 1, 0.1686275, 0, 1,
-1.794338, 0.0421758, -0.8045042, 1, 0.172549, 0, 1,
-1.791213, -0.09301538, -2.650265, 1, 0.1803922, 0, 1,
-1.765583, -0.2520563, -2.786495, 1, 0.1843137, 0, 1,
-1.751916, -0.3531771, -0.7264302, 1, 0.1921569, 0, 1,
-1.741014, -0.2667806, -0.8713574, 1, 0.1960784, 0, 1,
-1.716576, -1.174231, -1.565242, 1, 0.2039216, 0, 1,
-1.698075, -0.7400298, -0.6212401, 1, 0.2117647, 0, 1,
-1.682374, -0.03060912, -0.3592644, 1, 0.2156863, 0, 1,
-1.680325, 0.06316496, -2.092893, 1, 0.2235294, 0, 1,
-1.655166, -0.1272304, -2.004279, 1, 0.227451, 0, 1,
-1.653523, 0.3848374, 0.1521673, 1, 0.2352941, 0, 1,
-1.648621, 0.06017561, -1.924042, 1, 0.2392157, 0, 1,
-1.645296, -0.8779968, -0.7725198, 1, 0.2470588, 0, 1,
-1.62652, 0.3179588, -1.015188, 1, 0.2509804, 0, 1,
-1.626121, 0.6042246, 0.2859675, 1, 0.2588235, 0, 1,
-1.623251, 0.629778, -1.623264, 1, 0.2627451, 0, 1,
-1.607399, 0.5012042, -1.494885, 1, 0.2705882, 0, 1,
-1.605889, 0.4338298, -1.360719, 1, 0.2745098, 0, 1,
-1.5887, -0.1478222, -2.032736, 1, 0.282353, 0, 1,
-1.586491, 0.199298, 0.008726083, 1, 0.2862745, 0, 1,
-1.57731, -0.8272821, -3.060905, 1, 0.2941177, 0, 1,
-1.575106, -1.527537, -1.808429, 1, 0.3019608, 0, 1,
-1.573526, -0.2921956, -1.390906, 1, 0.3058824, 0, 1,
-1.565908, -0.960193, -1.722641, 1, 0.3137255, 0, 1,
-1.565733, -0.4988402, -1.820154, 1, 0.3176471, 0, 1,
-1.551583, -0.4102146, -1.294885, 1, 0.3254902, 0, 1,
-1.543455, -0.5584114, -1.856221, 1, 0.3294118, 0, 1,
-1.530352, -0.3827895, -1.927051, 1, 0.3372549, 0, 1,
-1.504657, -0.2809624, -2.544075, 1, 0.3411765, 0, 1,
-1.498128, -1.252786, -1.57312, 1, 0.3490196, 0, 1,
-1.494655, -0.264355, 0.02012583, 1, 0.3529412, 0, 1,
-1.488557, -0.3750286, -1.272204, 1, 0.3607843, 0, 1,
-1.483432, 0.003347342, -0.9043144, 1, 0.3647059, 0, 1,
-1.473547, 1.689843, -2.393711, 1, 0.372549, 0, 1,
-1.460083, 1.577745, -1.284353, 1, 0.3764706, 0, 1,
-1.457316, 1.390632, 0.6530656, 1, 0.3843137, 0, 1,
-1.44898, 0.1291272, 0.06484746, 1, 0.3882353, 0, 1,
-1.445245, 1.543994, -0.6981196, 1, 0.3960784, 0, 1,
-1.424197, 1.202979, -0.3950385, 1, 0.4039216, 0, 1,
-1.415343, 1.314577, -0.7911817, 1, 0.4078431, 0, 1,
-1.414136, 0.6821255, -0.8205864, 1, 0.4156863, 0, 1,
-1.412424, 0.3011536, -2.284544, 1, 0.4196078, 0, 1,
-1.404607, -0.1948163, -1.680643, 1, 0.427451, 0, 1,
-1.403708, -0.7244677, -2.146698, 1, 0.4313726, 0, 1,
-1.400067, -0.5083972, -0.4197932, 1, 0.4392157, 0, 1,
-1.384952, 1.492293, -0.7569897, 1, 0.4431373, 0, 1,
-1.366008, -1.486526, -3.453313, 1, 0.4509804, 0, 1,
-1.362713, -0.430519, -3.128628, 1, 0.454902, 0, 1,
-1.356679, -0.9807226, -2.125698, 1, 0.4627451, 0, 1,
-1.350638, -1.953895, -3.303795, 1, 0.4666667, 0, 1,
-1.336503, 0.6683335, -0.3140362, 1, 0.4745098, 0, 1,
-1.328605, 1.517844, 0.2485213, 1, 0.4784314, 0, 1,
-1.307958, -0.4422851, -3.436026, 1, 0.4862745, 0, 1,
-1.303882, -0.2190177, -3.192315, 1, 0.4901961, 0, 1,
-1.300808, -0.1099382, 0.3656818, 1, 0.4980392, 0, 1,
-1.296334, 0.9072893, 0.2048528, 1, 0.5058824, 0, 1,
-1.291406, 1.211516, -1.743408, 1, 0.509804, 0, 1,
-1.283293, -0.2315537, -2.791941, 1, 0.5176471, 0, 1,
-1.276487, -0.9694711, -3.740143, 1, 0.5215687, 0, 1,
-1.254581, -1.157218, -2.488742, 1, 0.5294118, 0, 1,
-1.253947, 0.3664635, -1.749677, 1, 0.5333334, 0, 1,
-1.247066, 0.8038355, -2.0464, 1, 0.5411765, 0, 1,
-1.24613, 1.338909, -2.212453, 1, 0.5450981, 0, 1,
-1.234666, 0.1802658, -1.230857, 1, 0.5529412, 0, 1,
-1.228657, 1.46172, -0.7015529, 1, 0.5568628, 0, 1,
-1.222035, 0.4347844, -0.3204669, 1, 0.5647059, 0, 1,
-1.221709, 1.053154, 0.2412258, 1, 0.5686275, 0, 1,
-1.218267, 0.2105549, -2.832382, 1, 0.5764706, 0, 1,
-1.201217, 0.06050595, -1.191279, 1, 0.5803922, 0, 1,
-1.194894, -0.7044131, -2.609409, 1, 0.5882353, 0, 1,
-1.193201, -0.7861164, -1.983768, 1, 0.5921569, 0, 1,
-1.19104, 0.5847416, 0.6600479, 1, 0.6, 0, 1,
-1.190379, -1.424118, -2.347095, 1, 0.6078432, 0, 1,
-1.182513, 0.6692065, -1.903093, 1, 0.6117647, 0, 1,
-1.181481, 0.2250245, -3.368403, 1, 0.6196079, 0, 1,
-1.179665, -0.5085498, -1.631749, 1, 0.6235294, 0, 1,
-1.176363, -0.2242291, -0.4192568, 1, 0.6313726, 0, 1,
-1.175339, -0.4915133, -1.267716, 1, 0.6352941, 0, 1,
-1.171139, -0.218796, 0.06379156, 1, 0.6431373, 0, 1,
-1.17103, 0.4171, -1.449697, 1, 0.6470588, 0, 1,
-1.151343, -0.7415355, -1.318234, 1, 0.654902, 0, 1,
-1.146226, -0.8198212, -2.809948, 1, 0.6588235, 0, 1,
-1.145094, -0.4541372, -2.885801, 1, 0.6666667, 0, 1,
-1.137735, -1.082711, -3.191775, 1, 0.6705883, 0, 1,
-1.136323, 1.387258, -1.170374, 1, 0.6784314, 0, 1,
-1.132454, 2.753498, 0.3312036, 1, 0.682353, 0, 1,
-1.131487, 0.2027013, -2.781577, 1, 0.6901961, 0, 1,
-1.129885, -0.4418714, -1.543554, 1, 0.6941177, 0, 1,
-1.127604, 0.4411426, -2.244648, 1, 0.7019608, 0, 1,
-1.105527, 1.558793, -0.2872717, 1, 0.7098039, 0, 1,
-1.098757, -0.1143885, -1.414275, 1, 0.7137255, 0, 1,
-1.090618, -0.5195292, -2.11649, 1, 0.7215686, 0, 1,
-1.078321, -0.1185733, -1.606049, 1, 0.7254902, 0, 1,
-1.075904, 0.4926008, -1.015332, 1, 0.7333333, 0, 1,
-1.073139, 1.400526, -2.688077, 1, 0.7372549, 0, 1,
-1.071719, -0.03507661, -0.2814054, 1, 0.7450981, 0, 1,
-1.067441, 0.03839461, -1.167057, 1, 0.7490196, 0, 1,
-1.065893, -0.5695228, -3.15588, 1, 0.7568628, 0, 1,
-1.061509, -0.3854407, -1.090574, 1, 0.7607843, 0, 1,
-1.057666, -0.1653979, -0.6535162, 1, 0.7686275, 0, 1,
-1.056729, -0.5934156, -1.3564, 1, 0.772549, 0, 1,
-1.054555, -0.1788515, -1.660556, 1, 0.7803922, 0, 1,
-1.052601, 1.271944, -0.7692246, 1, 0.7843137, 0, 1,
-1.052586, -3.22162, -2.551859, 1, 0.7921569, 0, 1,
-1.051514, 0.4602828, -1.398313, 1, 0.7960784, 0, 1,
-1.045982, -0.662495, -0.4181217, 1, 0.8039216, 0, 1,
-1.028641, -0.9457346, -3.978766, 1, 0.8117647, 0, 1,
-1.026851, -0.08705992, -3.179794, 1, 0.8156863, 0, 1,
-1.025298, 2.404912, -2.104376, 1, 0.8235294, 0, 1,
-1.020448, -2.589046, -3.182598, 1, 0.827451, 0, 1,
-1.016553, 0.4057944, -1.388697, 1, 0.8352941, 0, 1,
-1.016321, -1.159698, -0.6195427, 1, 0.8392157, 0, 1,
-1.009335, -0.4150014, -1.554843, 1, 0.8470588, 0, 1,
-1.00545, 1.495594, -0.5072851, 1, 0.8509804, 0, 1,
-1.002877, 0.4216452, -0.8580327, 1, 0.8588235, 0, 1,
-1.002475, -0.9695269, -2.415199, 1, 0.8627451, 0, 1,
-0.995777, 1.25682, -0.4343852, 1, 0.8705882, 0, 1,
-0.9934635, -0.9265945, -1.94571, 1, 0.8745098, 0, 1,
-0.9878722, -1.666892, -3.953638, 1, 0.8823529, 0, 1,
-0.9802761, -0.4457837, -3.009615, 1, 0.8862745, 0, 1,
-0.975787, -0.5570574, -2.433148, 1, 0.8941177, 0, 1,
-0.9743541, -0.5331392, -0.2257997, 1, 0.8980392, 0, 1,
-0.9687553, -0.3824173, -1.486852, 1, 0.9058824, 0, 1,
-0.9684806, 0.3930629, -2.529895, 1, 0.9137255, 0, 1,
-0.9684049, 2.522361, -1.425789, 1, 0.9176471, 0, 1,
-0.9646546, -1.285849, -1.775294, 1, 0.9254902, 0, 1,
-0.9632919, -0.09121165, -4.04343, 1, 0.9294118, 0, 1,
-0.9612946, 1.296266, -0.6745759, 1, 0.9372549, 0, 1,
-0.9575408, -0.1630125, 1.422197, 1, 0.9411765, 0, 1,
-0.9532149, 0.4067945, -2.744804, 1, 0.9490196, 0, 1,
-0.9526054, -0.4666735, -2.57567, 1, 0.9529412, 0, 1,
-0.9501448, 0.9534257, -3.178996, 1, 0.9607843, 0, 1,
-0.9461155, 2.214923, -0.9826888, 1, 0.9647059, 0, 1,
-0.945864, -0.1759043, -2.392687, 1, 0.972549, 0, 1,
-0.942767, 1.070664, 0.5281831, 1, 0.9764706, 0, 1,
-0.9396826, 0.6765463, -2.408468, 1, 0.9843137, 0, 1,
-0.9343094, -0.1848251, -3.065435, 1, 0.9882353, 0, 1,
-0.9318999, -2.018732, -1.947092, 1, 0.9960784, 0, 1,
-0.915081, 1.173253, -2.409113, 0.9960784, 1, 0, 1,
-0.9109431, -0.8622826, -1.543119, 0.9921569, 1, 0, 1,
-0.9093196, -0.03581989, -2.573088, 0.9843137, 1, 0, 1,
-0.9092464, 1.13298, -2.27069, 0.9803922, 1, 0, 1,
-0.9070671, -0.4658232, -3.353341, 0.972549, 1, 0, 1,
-0.9023981, -1.518491, -3.26104, 0.9686275, 1, 0, 1,
-0.8974053, 0.7083574, 1.1616, 0.9607843, 1, 0, 1,
-0.8822179, -1.323765, -2.285774, 0.9568627, 1, 0, 1,
-0.8793454, 0.5957909, -1.675023, 0.9490196, 1, 0, 1,
-0.8790075, 1.277788, -0.3821318, 0.945098, 1, 0, 1,
-0.8773626, -0.08072066, -1.842242, 0.9372549, 1, 0, 1,
-0.8739301, 0.175486, -2.389076, 0.9333333, 1, 0, 1,
-0.8733269, 0.07030404, 0.9268759, 0.9254902, 1, 0, 1,
-0.8655399, -0.9049522, -2.895762, 0.9215686, 1, 0, 1,
-0.8562014, -1.025462, -2.372022, 0.9137255, 1, 0, 1,
-0.8521188, -2.397504, -2.656785, 0.9098039, 1, 0, 1,
-0.8498736, -0.1673283, -1.310799, 0.9019608, 1, 0, 1,
-0.8455307, -0.4873106, -1.93004, 0.8941177, 1, 0, 1,
-0.8413377, -0.4292701, -2.433337, 0.8901961, 1, 0, 1,
-0.8401431, -0.9381118, -2.203387, 0.8823529, 1, 0, 1,
-0.8376983, 0.4473315, -1.232069, 0.8784314, 1, 0, 1,
-0.835542, 0.7359377, -1.162824, 0.8705882, 1, 0, 1,
-0.8269967, 0.1742627, 1.146297, 0.8666667, 1, 0, 1,
-0.8259772, 0.9199815, -1.562979, 0.8588235, 1, 0, 1,
-0.823656, 1.721758, -0.9904552, 0.854902, 1, 0, 1,
-0.8221573, 1.072784, -1.547309, 0.8470588, 1, 0, 1,
-0.8186074, 0.9144107, 0.2890386, 0.8431373, 1, 0, 1,
-0.8165282, -0.4568819, -1.545718, 0.8352941, 1, 0, 1,
-0.8097188, -1.037302, -3.303542, 0.8313726, 1, 0, 1,
-0.8060858, 0.2009564, -1.554066, 0.8235294, 1, 0, 1,
-0.8058217, 0.3022883, -1.395608, 0.8196079, 1, 0, 1,
-0.8016304, -0.1314605, -2.029433, 0.8117647, 1, 0, 1,
-0.7922297, -0.2742791, -2.779512, 0.8078431, 1, 0, 1,
-0.7881426, 0.8553279, 0.06354587, 0.8, 1, 0, 1,
-0.7870467, 1.324658, -0.9167724, 0.7921569, 1, 0, 1,
-0.7745594, -0.03413444, -0.9639089, 0.7882353, 1, 0, 1,
-0.7740781, 1.429517, -1.57096, 0.7803922, 1, 0, 1,
-0.7719269, 1.372488, -1.098316, 0.7764706, 1, 0, 1,
-0.7676889, -0.3673029, -4.460297, 0.7686275, 1, 0, 1,
-0.767255, -0.5142891, -2.76829, 0.7647059, 1, 0, 1,
-0.7643211, 0.09821966, -2.015431, 0.7568628, 1, 0, 1,
-0.7619367, 0.1747165, -2.452709, 0.7529412, 1, 0, 1,
-0.7605018, 0.3341766, -0.1819554, 0.7450981, 1, 0, 1,
-0.738165, -0.5580609, -0.9910215, 0.7411765, 1, 0, 1,
-0.7360674, 1.410832, -2.363578, 0.7333333, 1, 0, 1,
-0.7358142, -0.9356974, -2.365722, 0.7294118, 1, 0, 1,
-0.7315834, -1.356471, -3.660347, 0.7215686, 1, 0, 1,
-0.7298336, 0.09801338, -2.764497, 0.7176471, 1, 0, 1,
-0.7205846, 1.082841, -0.9602756, 0.7098039, 1, 0, 1,
-0.7196571, -0.3695307, -2.145466, 0.7058824, 1, 0, 1,
-0.7196552, -0.7041452, -2.686329, 0.6980392, 1, 0, 1,
-0.7195891, 1.254407, -1.18231, 0.6901961, 1, 0, 1,
-0.717181, 0.173407, -1.212655, 0.6862745, 1, 0, 1,
-0.7162624, 0.6019903, -0.7553759, 0.6784314, 1, 0, 1,
-0.7142665, 0.6853364, -0.3005369, 0.6745098, 1, 0, 1,
-0.7110299, -0.5222265, -3.479077, 0.6666667, 1, 0, 1,
-0.7099444, 0.6414052, -0.891081, 0.6627451, 1, 0, 1,
-0.7075482, 1.660014, -0.8046038, 0.654902, 1, 0, 1,
-0.7048798, 0.7447261, -2.648985, 0.6509804, 1, 0, 1,
-0.7034057, -0.8072901, -2.085625, 0.6431373, 1, 0, 1,
-0.7015054, 2.106362, 0.03711251, 0.6392157, 1, 0, 1,
-0.6989162, -2.473235, -2.029582, 0.6313726, 1, 0, 1,
-0.6987419, 0.6038706, -0.4480907, 0.627451, 1, 0, 1,
-0.6962945, -0.583163, -1.953139, 0.6196079, 1, 0, 1,
-0.6955642, 0.1296378, -2.103783, 0.6156863, 1, 0, 1,
-0.6926908, 0.8991236, -0.6723557, 0.6078432, 1, 0, 1,
-0.6918, 1.145354, -0.1479466, 0.6039216, 1, 0, 1,
-0.6895648, 0.5377637, -1.397883, 0.5960785, 1, 0, 1,
-0.6872616, 1.785429, 0.3132437, 0.5882353, 1, 0, 1,
-0.6778617, 0.6807731, -0.7770697, 0.5843138, 1, 0, 1,
-0.6722406, -0.5015329, -2.194396, 0.5764706, 1, 0, 1,
-0.6653709, -0.07826602, -1.613444, 0.572549, 1, 0, 1,
-0.6610866, 0.1242993, -1.547752, 0.5647059, 1, 0, 1,
-0.6569611, 1.074971, 0.2097802, 0.5607843, 1, 0, 1,
-0.652445, -1.600474, -2.729909, 0.5529412, 1, 0, 1,
-0.6508311, -0.2338977, -3.688756, 0.5490196, 1, 0, 1,
-0.6488039, -0.5563565, -3.153489, 0.5411765, 1, 0, 1,
-0.6472096, 1.329351, -0.9647601, 0.5372549, 1, 0, 1,
-0.6457164, 0.7810883, -0.1595103, 0.5294118, 1, 0, 1,
-0.6442157, -2.060411, -3.313528, 0.5254902, 1, 0, 1,
-0.642538, 0.245231, -0.4651549, 0.5176471, 1, 0, 1,
-0.6420757, -1.037826, 0.3756968, 0.5137255, 1, 0, 1,
-0.6419939, -0.3925289, -1.213655, 0.5058824, 1, 0, 1,
-0.6404969, -0.9863682, -1.806038, 0.5019608, 1, 0, 1,
-0.6391152, -0.05642559, -3.000279, 0.4941176, 1, 0, 1,
-0.6272945, -1.157432, -1.556773, 0.4862745, 1, 0, 1,
-0.6249349, -0.4858345, -3.460264, 0.4823529, 1, 0, 1,
-0.6237413, 1.849216, -1.461816, 0.4745098, 1, 0, 1,
-0.6203096, -0.8811476, -3.125447, 0.4705882, 1, 0, 1,
-0.6180009, -0.143196, -2.531923, 0.4627451, 1, 0, 1,
-0.615783, 0.1421365, 0.4662763, 0.4588235, 1, 0, 1,
-0.5981516, -1.843991, -4.142451, 0.4509804, 1, 0, 1,
-0.5976481, 1.718656, 0.07734307, 0.4470588, 1, 0, 1,
-0.5973942, 0.6233776, -0.5629237, 0.4392157, 1, 0, 1,
-0.5920332, 1.245607, -1.534196, 0.4352941, 1, 0, 1,
-0.577788, 0.8302912, -0.7330352, 0.427451, 1, 0, 1,
-0.5689981, -1.513049, -1.576212, 0.4235294, 1, 0, 1,
-0.5666208, -0.2480737, -1.111832, 0.4156863, 1, 0, 1,
-0.5650664, -0.164495, 0.1557233, 0.4117647, 1, 0, 1,
-0.5641984, -0.0484832, 0.07272623, 0.4039216, 1, 0, 1,
-0.5627998, -0.507222, -3.078217, 0.3960784, 1, 0, 1,
-0.5567029, -2.194197, -2.858253, 0.3921569, 1, 0, 1,
-0.5540466, -0.8543616, -2.582228, 0.3843137, 1, 0, 1,
-0.549684, -0.3959082, -2.144751, 0.3803922, 1, 0, 1,
-0.545264, 0.8844705, 0.6976233, 0.372549, 1, 0, 1,
-0.545086, -0.6045189, -4.792124, 0.3686275, 1, 0, 1,
-0.5403653, -0.3521073, -4.194079, 0.3607843, 1, 0, 1,
-0.5398305, 0.3232861, 0.975573, 0.3568628, 1, 0, 1,
-0.5397682, 1.019911, -0.6387398, 0.3490196, 1, 0, 1,
-0.5338397, 0.2255539, -0.8344141, 0.345098, 1, 0, 1,
-0.5319378, -0.962587, -2.908685, 0.3372549, 1, 0, 1,
-0.5290457, -0.01838517, -2.68728, 0.3333333, 1, 0, 1,
-0.5288448, -0.7576091, -2.795637, 0.3254902, 1, 0, 1,
-0.5229676, -0.1697703, -0.7861229, 0.3215686, 1, 0, 1,
-0.5188887, 0.4966557, -1.119822, 0.3137255, 1, 0, 1,
-0.5182269, -0.2621585, -4.386896, 0.3098039, 1, 0, 1,
-0.51798, 0.2129234, 0.4713076, 0.3019608, 1, 0, 1,
-0.5177379, -1.010822, -4.280272, 0.2941177, 1, 0, 1,
-0.5145312, -0.1551339, -3.29086, 0.2901961, 1, 0, 1,
-0.5135178, -0.4718689, -0.5040895, 0.282353, 1, 0, 1,
-0.5122045, -1.268748, -4.696503, 0.2784314, 1, 0, 1,
-0.5109612, -1.003222, -4.017594, 0.2705882, 1, 0, 1,
-0.5087107, 0.4185747, -0.714318, 0.2666667, 1, 0, 1,
-0.5047314, -0.1155119, -2.955206, 0.2588235, 1, 0, 1,
-0.5034794, 0.3171783, -1.643627, 0.254902, 1, 0, 1,
-0.4973737, 1.801542, 0.7530096, 0.2470588, 1, 0, 1,
-0.4955446, 0.6657777, -2.946024, 0.2431373, 1, 0, 1,
-0.4919344, -0.5445177, -2.666799, 0.2352941, 1, 0, 1,
-0.486917, 0.649363, -2.423893, 0.2313726, 1, 0, 1,
-0.4846282, -1.003786, -3.444524, 0.2235294, 1, 0, 1,
-0.4835013, -0.7596572, -3.715646, 0.2196078, 1, 0, 1,
-0.4805238, 0.2079889, -0.3151855, 0.2117647, 1, 0, 1,
-0.4772967, 0.348522, -1.198477, 0.2078431, 1, 0, 1,
-0.4761406, 0.7874817, -1.009115, 0.2, 1, 0, 1,
-0.4704609, 0.04212237, -2.197121, 0.1921569, 1, 0, 1,
-0.4669333, 1.174384, -1.038576, 0.1882353, 1, 0, 1,
-0.4660737, 0.6977876, -2.710369, 0.1803922, 1, 0, 1,
-0.4634312, 0.7684706, -0.6699536, 0.1764706, 1, 0, 1,
-0.4608344, 0.1407339, -3.119251, 0.1686275, 1, 0, 1,
-0.4604461, 1.146261, 0.6069511, 0.1647059, 1, 0, 1,
-0.454557, 0.6666003, -0.3610264, 0.1568628, 1, 0, 1,
-0.4535634, 0.3063357, -0.8704805, 0.1529412, 1, 0, 1,
-0.4450533, -1.116931, -2.904059, 0.145098, 1, 0, 1,
-0.4383407, -0.7265716, -2.092299, 0.1411765, 1, 0, 1,
-0.4383195, 0.1817993, -0.6671188, 0.1333333, 1, 0, 1,
-0.4350367, 0.7951905, -1.149074, 0.1294118, 1, 0, 1,
-0.4321823, -1.783273, -3.172126, 0.1215686, 1, 0, 1,
-0.4297079, -0.04891354, -2.251899, 0.1176471, 1, 0, 1,
-0.4262648, 0.9123913, -0.8084837, 0.1098039, 1, 0, 1,
-0.4237722, -0.4762514, -3.242215, 0.1058824, 1, 0, 1,
-0.4186502, 0.6511829, -0.1066778, 0.09803922, 1, 0, 1,
-0.416755, -0.0388808, -1.835704, 0.09019608, 1, 0, 1,
-0.4144176, -1.071262, -3.71115, 0.08627451, 1, 0, 1,
-0.413805, -1.76082, -3.067011, 0.07843138, 1, 0, 1,
-0.4059779, -0.3181112, -3.458776, 0.07450981, 1, 0, 1,
-0.4050088, 0.115657, -1.306655, 0.06666667, 1, 0, 1,
-0.4040987, -1.996805, -1.174677, 0.0627451, 1, 0, 1,
-0.3988738, 0.1662089, 0.2504455, 0.05490196, 1, 0, 1,
-0.3967145, -0.01610223, -2.3109, 0.05098039, 1, 0, 1,
-0.3948273, -1.554175, -2.830804, 0.04313726, 1, 0, 1,
-0.3941976, 0.8878064, -1.274156, 0.03921569, 1, 0, 1,
-0.3852522, 1.130315, 0.9479249, 0.03137255, 1, 0, 1,
-0.3807204, -0.8316471, -3.01418, 0.02745098, 1, 0, 1,
-0.3795703, -0.3743689, -2.553011, 0.01960784, 1, 0, 1,
-0.3788241, 0.1725401, -0.6934676, 0.01568628, 1, 0, 1,
-0.3773529, 0.1141122, -1.838723, 0.007843138, 1, 0, 1,
-0.37556, 0.3395584, 0.3263281, 0.003921569, 1, 0, 1,
-0.3726529, 0.2841094, -0.731101, 0, 1, 0.003921569, 1,
-0.3581493, 0.6269797, -0.8856508, 0, 1, 0.01176471, 1,
-0.3569918, 0.8177731, -2.352231, 0, 1, 0.01568628, 1,
-0.349636, -0.425874, -1.640808, 0, 1, 0.02352941, 1,
-0.34925, 0.6014431, 1.303702, 0, 1, 0.02745098, 1,
-0.3451688, -0.8249363, -3.935754, 0, 1, 0.03529412, 1,
-0.3436006, -0.5427555, -2.758043, 0, 1, 0.03921569, 1,
-0.3412432, -0.7938887, -1.10484, 0, 1, 0.04705882, 1,
-0.3390015, 0.6673462, -2.241322, 0, 1, 0.05098039, 1,
-0.3380819, 0.0008187486, -1.185589, 0, 1, 0.05882353, 1,
-0.3337898, -1.471803, -1.870923, 0, 1, 0.0627451, 1,
-0.3333145, -0.7075948, -1.928125, 0, 1, 0.07058824, 1,
-0.3274783, -0.1451277, -1.235341, 0, 1, 0.07450981, 1,
-0.3243549, -1.571676, -4.56053, 0, 1, 0.08235294, 1,
-0.3223158, 0.05401724, -1.117291, 0, 1, 0.08627451, 1,
-0.3170438, 0.5129831, -0.1948772, 0, 1, 0.09411765, 1,
-0.3168557, 0.3314413, -0.4052817, 0, 1, 0.1019608, 1,
-0.3150155, -0.01602896, -1.722781, 0, 1, 0.1058824, 1,
-0.3131392, 1.161911, 0.5776065, 0, 1, 0.1137255, 1,
-0.3121092, 0.06930281, 0.08336563, 0, 1, 0.1176471, 1,
-0.3089167, -1.594118, -2.155723, 0, 1, 0.1254902, 1,
-0.3081473, 0.1298112, -0.3639291, 0, 1, 0.1294118, 1,
-0.3078615, -0.6416455, -2.541093, 0, 1, 0.1372549, 1,
-0.3025145, -0.01435367, -0.135113, 0, 1, 0.1411765, 1,
-0.3016412, -2.252503, -2.680534, 0, 1, 0.1490196, 1,
-0.2988572, 1.182129, 0.502073, 0, 1, 0.1529412, 1,
-0.2984333, -2.881716, -3.423379, 0, 1, 0.1607843, 1,
-0.2981326, 0.3566477, -1.526681, 0, 1, 0.1647059, 1,
-0.2950904, 0.2619632, -1.096053, 0, 1, 0.172549, 1,
-0.2942962, 0.9578075, 0.3180835, 0, 1, 0.1764706, 1,
-0.2910733, 0.4529121, -3.232299, 0, 1, 0.1843137, 1,
-0.291038, 0.1057329, 1.03586, 0, 1, 0.1882353, 1,
-0.2884069, -0.297805, -3.072564, 0, 1, 0.1960784, 1,
-0.2836736, -0.121132, -3.599764, 0, 1, 0.2039216, 1,
-0.2764052, -2.269001, -2.773714, 0, 1, 0.2078431, 1,
-0.2751174, -0.3123833, -1.441579, 0, 1, 0.2156863, 1,
-0.2749992, 0.3335624, -0.8384909, 0, 1, 0.2196078, 1,
-0.2747623, 0.142018, 0.8459095, 0, 1, 0.227451, 1,
-0.2745992, -0.342461, -2.353138, 0, 1, 0.2313726, 1,
-0.2718831, 1.554326, -0.7817628, 0, 1, 0.2392157, 1,
-0.2700893, -1.093747, -4.168672, 0, 1, 0.2431373, 1,
-0.2666439, -0.5339547, -3.074459, 0, 1, 0.2509804, 1,
-0.2605288, 0.8593441, -0.2898706, 0, 1, 0.254902, 1,
-0.2553505, -0.995248, -2.95029, 0, 1, 0.2627451, 1,
-0.2548577, -0.1099818, -2.002692, 0, 1, 0.2666667, 1,
-0.2531954, -0.3483427, -1.886829, 0, 1, 0.2745098, 1,
-0.2520712, -1.190241, -3.175481, 0, 1, 0.2784314, 1,
-0.2504396, -0.8448683, -1.682196, 0, 1, 0.2862745, 1,
-0.246372, 0.4895065, -1.386812, 0, 1, 0.2901961, 1,
-0.2405063, -0.4733295, -0.1941678, 0, 1, 0.2980392, 1,
-0.2356523, -0.6077282, -3.257903, 0, 1, 0.3058824, 1,
-0.2349526, -0.06850705, -3.35453, 0, 1, 0.3098039, 1,
-0.2340495, 0.8238543, -1.451916, 0, 1, 0.3176471, 1,
-0.2314389, -0.30969, -1.500747, 0, 1, 0.3215686, 1,
-0.2248818, -0.3582057, -2.967918, 0, 1, 0.3294118, 1,
-0.2207581, -1.043934, -2.737141, 0, 1, 0.3333333, 1,
-0.2206898, -0.0511114, -1.916745, 0, 1, 0.3411765, 1,
-0.2180073, -0.6906923, -4.319539, 0, 1, 0.345098, 1,
-0.2179988, 0.5177842, -0.6980645, 0, 1, 0.3529412, 1,
-0.2158834, -0.7452436, -2.92261, 0, 1, 0.3568628, 1,
-0.2157374, 0.03840623, -2.092962, 0, 1, 0.3647059, 1,
-0.2139785, -0.9921678, -2.150766, 0, 1, 0.3686275, 1,
-0.2135104, -0.007307493, -2.136711, 0, 1, 0.3764706, 1,
-0.2014666, 0.1209643, -1.913339, 0, 1, 0.3803922, 1,
-0.2013693, 1.110092, 1.74808, 0, 1, 0.3882353, 1,
-0.1991576, -0.5415189, -3.293214, 0, 1, 0.3921569, 1,
-0.1986848, -0.7356787, -3.896067, 0, 1, 0.4, 1,
-0.1980616, -0.6864311, -3.060487, 0, 1, 0.4078431, 1,
-0.1962266, -1.063923, -4.564074, 0, 1, 0.4117647, 1,
-0.1925603, -0.009885186, -0.9249193, 0, 1, 0.4196078, 1,
-0.1914782, -0.2136548, -2.286558, 0, 1, 0.4235294, 1,
-0.1912297, 0.7584331, 0.3521558, 0, 1, 0.4313726, 1,
-0.1910529, 0.09764603, -0.8333718, 0, 1, 0.4352941, 1,
-0.1798799, -0.7076393, -1.207033, 0, 1, 0.4431373, 1,
-0.1781123, -1.050579, -3.972161, 0, 1, 0.4470588, 1,
-0.1771551, 0.2238176, -0.8702039, 0, 1, 0.454902, 1,
-0.1770282, 0.8394768, -0.1725362, 0, 1, 0.4588235, 1,
-0.1765903, 1.184789, -0.1182267, 0, 1, 0.4666667, 1,
-0.1760148, -1.753047, -3.99025, 0, 1, 0.4705882, 1,
-0.1742037, 1.153235, 1.378805, 0, 1, 0.4784314, 1,
-0.169901, -0.2841923, -1.999632, 0, 1, 0.4823529, 1,
-0.1656372, 0.6643043, 0.4702249, 0, 1, 0.4901961, 1,
-0.1646755, 0.7570046, 0.4728975, 0, 1, 0.4941176, 1,
-0.1613904, -0.4312767, -2.874701, 0, 1, 0.5019608, 1,
-0.1596344, -0.7305983, -3.745597, 0, 1, 0.509804, 1,
-0.1562565, 0.1897195, -0.6794161, 0, 1, 0.5137255, 1,
-0.1550371, 1.81979, 0.0535137, 0, 1, 0.5215687, 1,
-0.1483333, 0.2050754, -0.753707, 0, 1, 0.5254902, 1,
-0.1482773, -0.08452778, -3.069488, 0, 1, 0.5333334, 1,
-0.1474534, 1.113202, 0.2707414, 0, 1, 0.5372549, 1,
-0.1458271, 0.1685704, -0.6345804, 0, 1, 0.5450981, 1,
-0.1432562, -1.000555, -2.728342, 0, 1, 0.5490196, 1,
-0.1424922, -0.2632982, -2.452324, 0, 1, 0.5568628, 1,
-0.1401142, -1.481777, -2.421883, 0, 1, 0.5607843, 1,
-0.1382232, 0.8339633, -0.9922149, 0, 1, 0.5686275, 1,
-0.1331818, -0.4743163, -2.363375, 0, 1, 0.572549, 1,
-0.1321155, 0.252205, -1.268117, 0, 1, 0.5803922, 1,
-0.1315002, 0.8846257, 0.03555506, 0, 1, 0.5843138, 1,
-0.1311188, 1.222989, 1.134133, 0, 1, 0.5921569, 1,
-0.1241423, 0.5213139, -0.9277949, 0, 1, 0.5960785, 1,
-0.121476, 1.092357, -1.475268, 0, 1, 0.6039216, 1,
-0.1182639, 1.009857, 0.1635427, 0, 1, 0.6117647, 1,
-0.1067164, 0.1630767, -1.139835, 0, 1, 0.6156863, 1,
-0.1062289, 0.675118, 0.5523297, 0, 1, 0.6235294, 1,
-0.103371, -0.9419745, -1.919353, 0, 1, 0.627451, 1,
-0.102633, 0.7715031, -0.0064827, 0, 1, 0.6352941, 1,
-0.1010758, 0.7500568, 0.7601477, 0, 1, 0.6392157, 1,
-0.1000736, -0.05844667, -3.901149, 0, 1, 0.6470588, 1,
-0.09962502, -0.3318805, -3.515841, 0, 1, 0.6509804, 1,
-0.09858395, 1.160642, -0.02834153, 0, 1, 0.6588235, 1,
-0.09791722, 0.4099204, 0.1694144, 0, 1, 0.6627451, 1,
-0.09648398, -0.7454261, -2.096547, 0, 1, 0.6705883, 1,
-0.09613457, 0.2274164, 0.3898853, 0, 1, 0.6745098, 1,
-0.09412376, 1.56301, -0.2204792, 0, 1, 0.682353, 1,
-0.09346467, -0.163369, -2.840382, 0, 1, 0.6862745, 1,
-0.09087326, -0.4827347, -1.984084, 0, 1, 0.6941177, 1,
-0.08998474, -1.375002, -2.445993, 0, 1, 0.7019608, 1,
-0.08823898, -0.1506469, -2.418845, 0, 1, 0.7058824, 1,
-0.08349698, 0.4806691, -0.148449, 0, 1, 0.7137255, 1,
-0.08247505, -0.6968708, -2.070396, 0, 1, 0.7176471, 1,
-0.08166017, 1.324196, 1.823318, 0, 1, 0.7254902, 1,
-0.08025108, 0.3974203, 0.9378222, 0, 1, 0.7294118, 1,
-0.07975994, -2.204961, -2.377765, 0, 1, 0.7372549, 1,
-0.07962164, 0.7385891, -0.3337555, 0, 1, 0.7411765, 1,
-0.07941696, 1.963926, -1.603047, 0, 1, 0.7490196, 1,
-0.07812899, -0.2632995, -2.866116, 0, 1, 0.7529412, 1,
-0.07683095, -0.329569, -3.768843, 0, 1, 0.7607843, 1,
-0.07556646, -0.7884917, -2.068231, 0, 1, 0.7647059, 1,
-0.07502322, 0.1499032, -0.7364191, 0, 1, 0.772549, 1,
-0.07416084, 0.2987759, -1.50459, 0, 1, 0.7764706, 1,
-0.07225114, -0.3518386, -1.947574, 0, 1, 0.7843137, 1,
-0.07029396, -1.468688, -2.386097, 0, 1, 0.7882353, 1,
-0.07002553, -0.8463866, -3.015172, 0, 1, 0.7960784, 1,
-0.06899711, -1.125827, -5.182246, 0, 1, 0.8039216, 1,
-0.06543474, 1.395855, -1.350983, 0, 1, 0.8078431, 1,
-0.06509547, -0.2283956, -1.948266, 0, 1, 0.8156863, 1,
-0.06485464, -0.1258937, -2.716096, 0, 1, 0.8196079, 1,
-0.06385705, 0.2682269, 1.396176, 0, 1, 0.827451, 1,
-0.0633267, 0.6210546, -0.8501311, 0, 1, 0.8313726, 1,
-0.0589498, 0.8324807, 1.695446, 0, 1, 0.8392157, 1,
-0.0566417, -0.1963137, -2.671151, 0, 1, 0.8431373, 1,
-0.05619758, -0.4932218, -2.922237, 0, 1, 0.8509804, 1,
-0.04928215, 0.8119936, -0.5169404, 0, 1, 0.854902, 1,
-0.04871789, -1.07446, -3.476114, 0, 1, 0.8627451, 1,
-0.04723663, -0.1498924, -3.426762, 0, 1, 0.8666667, 1,
-0.04328159, -0.0980253, -2.336216, 0, 1, 0.8745098, 1,
-0.04033997, 0.05606399, -0.2007227, 0, 1, 0.8784314, 1,
-0.03788301, -0.2856033, -3.33914, 0, 1, 0.8862745, 1,
-0.03169107, 1.356772, -1.678885, 0, 1, 0.8901961, 1,
-0.02773982, -2.345973, -3.658422, 0, 1, 0.8980392, 1,
-0.02767371, 0.4785332, 0.7514737, 0, 1, 0.9058824, 1,
-0.02739206, 0.9310648, -1.089217, 0, 1, 0.9098039, 1,
-0.02566945, -0.2963642, -3.88098, 0, 1, 0.9176471, 1,
-0.02232059, 1.472017, 0.718363, 0, 1, 0.9215686, 1,
-0.02123697, -0.054924, -1.637658, 0, 1, 0.9294118, 1,
-0.01740602, 0.07273217, -0.845463, 0, 1, 0.9333333, 1,
-0.01619275, -0.234353, -2.623025, 0, 1, 0.9411765, 1,
-0.01437737, 1.188069, -0.1426761, 0, 1, 0.945098, 1,
-0.0127777, 0.8814754, 0.3647367, 0, 1, 0.9529412, 1,
-0.01189172, -0.8202944, -3.688892, 0, 1, 0.9568627, 1,
-0.01002358, -0.2232039, -4.066319, 0, 1, 0.9647059, 1,
-0.006845669, 0.1092866, 1.326057, 0, 1, 0.9686275, 1,
-0.002685056, -0.5756249, -5.307193, 0, 1, 0.9764706, 1,
0.0003750202, -2.317708, 2.541834, 0, 1, 0.9803922, 1,
0.004986019, 1.353911, -0.3285226, 0, 1, 0.9882353, 1,
0.006728452, -0.6493186, 3.885893, 0, 1, 0.9921569, 1,
0.008972535, 0.08761891, 0.4565683, 0, 1, 1, 1,
0.01598918, 2.556019, -0.6496211, 0, 0.9921569, 1, 1,
0.01912438, 1.171212, 1.246628, 0, 0.9882353, 1, 1,
0.02058577, -0.760449, 2.994924, 0, 0.9803922, 1, 1,
0.02110916, 0.5584199, 1.131832, 0, 0.9764706, 1, 1,
0.02292975, 0.1768681, 1.795484, 0, 0.9686275, 1, 1,
0.02695751, -0.4716958, 3.341288, 0, 0.9647059, 1, 1,
0.02961556, 0.1004052, -0.5486574, 0, 0.9568627, 1, 1,
0.03196221, -1.152064, 1.53599, 0, 0.9529412, 1, 1,
0.03217928, -1.215821, 3.862781, 0, 0.945098, 1, 1,
0.03852276, 0.7262849, 0.09780053, 0, 0.9411765, 1, 1,
0.03870039, 0.729899, 0.2075428, 0, 0.9333333, 1, 1,
0.04023577, 2.012488, 0.2453096, 0, 0.9294118, 1, 1,
0.04362394, -0.2375191, 2.803384, 0, 0.9215686, 1, 1,
0.04585094, -0.7205976, 3.694312, 0, 0.9176471, 1, 1,
0.05715889, -0.6146187, 2.833704, 0, 0.9098039, 1, 1,
0.05811362, 0.5886816, -1.479091, 0, 0.9058824, 1, 1,
0.06512736, -0.09646834, 2.784122, 0, 0.8980392, 1, 1,
0.06741451, -0.1565663, 2.958633, 0, 0.8901961, 1, 1,
0.08339948, 2.286158, 1.522758, 0, 0.8862745, 1, 1,
0.0845874, -1.03913, 3.410942, 0, 0.8784314, 1, 1,
0.08504136, 0.1470622, -1.527935, 0, 0.8745098, 1, 1,
0.0871067, 0.1802051, 2.106442, 0, 0.8666667, 1, 1,
0.08946212, -0.3668095, 2.318186, 0, 0.8627451, 1, 1,
0.09035163, 0.8194085, 0.9314301, 0, 0.854902, 1, 1,
0.09718552, -0.7007135, 2.062282, 0, 0.8509804, 1, 1,
0.09785513, -0.1388205, 2.685198, 0, 0.8431373, 1, 1,
0.09816764, -1.184771, 4.169265, 0, 0.8392157, 1, 1,
0.09869464, 1.276152, 0.5019463, 0, 0.8313726, 1, 1,
0.1020066, -0.7634834, 1.028892, 0, 0.827451, 1, 1,
0.1034195, -1.609106, 2.462371, 0, 0.8196079, 1, 1,
0.1075958, -0.8005649, 2.70903, 0, 0.8156863, 1, 1,
0.1103418, 0.5272113, 2.671342, 0, 0.8078431, 1, 1,
0.1148665, 0.8336717, 1.129327, 0, 0.8039216, 1, 1,
0.1176735, -0.3610854, 3.332915, 0, 0.7960784, 1, 1,
0.124812, -0.2138142, 1.466538, 0, 0.7882353, 1, 1,
0.1251648, -0.6878247, 4.954834, 0, 0.7843137, 1, 1,
0.1255929, 1.144927, 2.058497, 0, 0.7764706, 1, 1,
0.1265149, -0.6228204, 3.403996, 0, 0.772549, 1, 1,
0.1334641, -0.3976219, 4.636366, 0, 0.7647059, 1, 1,
0.1373393, 0.1287749, 0.948942, 0, 0.7607843, 1, 1,
0.1431318, -1.231748, 4.754848, 0, 0.7529412, 1, 1,
0.1438414, -0.875179, 3.197469, 0, 0.7490196, 1, 1,
0.1443434, 0.1366135, 0.07589006, 0, 0.7411765, 1, 1,
0.1505795, 0.4255171, 0.3291034, 0, 0.7372549, 1, 1,
0.1549596, 0.9586985, -0.4341305, 0, 0.7294118, 1, 1,
0.1550508, -1.686041, 3.379254, 0, 0.7254902, 1, 1,
0.1561808, 1.326662, 0.9650987, 0, 0.7176471, 1, 1,
0.1577598, -0.5370548, 3.347849, 0, 0.7137255, 1, 1,
0.1631141, 0.5548692, -0.7028586, 0, 0.7058824, 1, 1,
0.1633424, 1.372677, 1.330749, 0, 0.6980392, 1, 1,
0.1663675, 0.7043369, 0.0745196, 0, 0.6941177, 1, 1,
0.1711057, 0.4065215, 1.546315, 0, 0.6862745, 1, 1,
0.1728308, 0.4471619, 0.7700059, 0, 0.682353, 1, 1,
0.1729836, -0.324414, 2.136734, 0, 0.6745098, 1, 1,
0.1738676, 0.2370657, 1.152998, 0, 0.6705883, 1, 1,
0.1783878, -0.2291937, 3.512757, 0, 0.6627451, 1, 1,
0.1804345, 0.8625666, 1.663571, 0, 0.6588235, 1, 1,
0.1821173, -0.7312645, 2.311844, 0, 0.6509804, 1, 1,
0.1830412, -0.474096, 3.54329, 0, 0.6470588, 1, 1,
0.1830859, 0.840699, 1.680779, 0, 0.6392157, 1, 1,
0.1833171, 0.5450393, 1.873322, 0, 0.6352941, 1, 1,
0.1848978, -0.185679, 3.95923, 0, 0.627451, 1, 1,
0.1852358, -0.08564854, 2.909482, 0, 0.6235294, 1, 1,
0.1855324, 0.4596581, 0.6878904, 0, 0.6156863, 1, 1,
0.2000874, -1.200436, 3.346206, 0, 0.6117647, 1, 1,
0.2017806, 0.4083452, 1.543708, 0, 0.6039216, 1, 1,
0.2025987, -0.7088054, 1.11776, 0, 0.5960785, 1, 1,
0.2030626, -0.7676006, 3.49704, 0, 0.5921569, 1, 1,
0.2140465, 1.241724, -0.4626265, 0, 0.5843138, 1, 1,
0.2144743, -1.746941, 3.625379, 0, 0.5803922, 1, 1,
0.2172489, 0.08046341, 0.3102185, 0, 0.572549, 1, 1,
0.2184637, 1.863028, -1.294154, 0, 0.5686275, 1, 1,
0.2198022, -0.05937165, 1.906041, 0, 0.5607843, 1, 1,
0.2255799, -0.3724592, 4.394777, 0, 0.5568628, 1, 1,
0.2286657, -0.6572478, 3.325606, 0, 0.5490196, 1, 1,
0.2315778, 0.5280163, 0.02929656, 0, 0.5450981, 1, 1,
0.236888, 1.271823, -0.01458474, 0, 0.5372549, 1, 1,
0.2392777, 0.7433364, 0.2009853, 0, 0.5333334, 1, 1,
0.2442306, 1.52505, -0.004826075, 0, 0.5254902, 1, 1,
0.2449407, -0.5366154, 1.543547, 0, 0.5215687, 1, 1,
0.247692, 0.2613143, -0.03041226, 0, 0.5137255, 1, 1,
0.2476997, 0.9975806, -0.3551929, 0, 0.509804, 1, 1,
0.2512368, -0.634637, 1.979908, 0, 0.5019608, 1, 1,
0.2516738, 1.376887, -1.298223, 0, 0.4941176, 1, 1,
0.2592726, -1.793402, 1.310091, 0, 0.4901961, 1, 1,
0.2673063, -0.2165148, 2.210099, 0, 0.4823529, 1, 1,
0.2710312, 0.8380026, 1.555704, 0, 0.4784314, 1, 1,
0.271651, 0.07677097, 1.662798, 0, 0.4705882, 1, 1,
0.2747153, -1.057158, 5.721681, 0, 0.4666667, 1, 1,
0.2762222, 1.048361, 0.2778446, 0, 0.4588235, 1, 1,
0.2790467, 1.151111, -0.07823736, 0, 0.454902, 1, 1,
0.2886294, 0.2600336, 0.9542022, 0, 0.4470588, 1, 1,
0.2899726, -0.624817, 2.962838, 0, 0.4431373, 1, 1,
0.290214, 0.7326402, 0.2608435, 0, 0.4352941, 1, 1,
0.2905041, 0.05453693, 0.9845908, 0, 0.4313726, 1, 1,
0.2925114, -0.4559172, 2.299481, 0, 0.4235294, 1, 1,
0.2938868, -0.8863876, 3.481743, 0, 0.4196078, 1, 1,
0.2950698, -0.7733926, 2.716507, 0, 0.4117647, 1, 1,
0.2974309, 1.623439, 0.7535678, 0, 0.4078431, 1, 1,
0.2977136, 0.7486857, -0.2466121, 0, 0.4, 1, 1,
0.2988667, -1.078423, 3.55962, 0, 0.3921569, 1, 1,
0.3017499, 0.5346017, 0.4293556, 0, 0.3882353, 1, 1,
0.305342, -1.003201, 3.62763, 0, 0.3803922, 1, 1,
0.3072903, 0.2067602, -0.4525365, 0, 0.3764706, 1, 1,
0.3105289, 1.235246, -0.6240602, 0, 0.3686275, 1, 1,
0.3131458, 0.1506939, 1.411076, 0, 0.3647059, 1, 1,
0.3172463, 0.08344611, 2.62798, 0, 0.3568628, 1, 1,
0.3182371, 0.9891068, -0.4171959, 0, 0.3529412, 1, 1,
0.3233026, 0.7685591, -0.597564, 0, 0.345098, 1, 1,
0.3269013, 0.324792, 1.567582, 0, 0.3411765, 1, 1,
0.3270988, 0.6006688, 2.5188, 0, 0.3333333, 1, 1,
0.3283262, 0.1592606, 0.9872448, 0, 0.3294118, 1, 1,
0.3289185, -0.9091846, 3.148942, 0, 0.3215686, 1, 1,
0.3300778, 0.222458, 1.962378, 0, 0.3176471, 1, 1,
0.33691, 1.250979, -0.2334867, 0, 0.3098039, 1, 1,
0.3408442, 0.05332805, 2.425692, 0, 0.3058824, 1, 1,
0.3429557, 1.043082, -0.7249343, 0, 0.2980392, 1, 1,
0.3443705, 0.4671788, 0.6031199, 0, 0.2901961, 1, 1,
0.3452639, 1.840569, 2.891569, 0, 0.2862745, 1, 1,
0.3465246, 0.3121427, -0.2674853, 0, 0.2784314, 1, 1,
0.3513329, 0.9596813, 0.5113502, 0, 0.2745098, 1, 1,
0.3515068, 0.2197403, -0.1233079, 0, 0.2666667, 1, 1,
0.3605548, -0.2500299, 2.240471, 0, 0.2627451, 1, 1,
0.362955, -0.5093493, 0.5725018, 0, 0.254902, 1, 1,
0.3630205, -1.807903, 3.146405, 0, 0.2509804, 1, 1,
0.3674792, 0.5514637, -1.847884, 0, 0.2431373, 1, 1,
0.3690641, -0.1516964, 1.739495, 0, 0.2392157, 1, 1,
0.3763628, -0.09339312, 2.509115, 0, 0.2313726, 1, 1,
0.3770757, 0.06907285, 1.131404, 0, 0.227451, 1, 1,
0.3818593, 0.001612641, 1.553621, 0, 0.2196078, 1, 1,
0.387171, 1.294942, -0.2776966, 0, 0.2156863, 1, 1,
0.3885228, 0.5873241, 0.7617694, 0, 0.2078431, 1, 1,
0.3886597, 1.168657, -0.7760066, 0, 0.2039216, 1, 1,
0.3895247, 0.992725, 0.1823524, 0, 0.1960784, 1, 1,
0.3912537, 0.04702442, 1.240516, 0, 0.1882353, 1, 1,
0.3915686, -0.4681242, 2.295668, 0, 0.1843137, 1, 1,
0.3940042, -1.133856, 4.119184, 0, 0.1764706, 1, 1,
0.3961868, 0.4109095, 1.090201, 0, 0.172549, 1, 1,
0.3971311, -0.1009042, 1.785243, 0, 0.1647059, 1, 1,
0.4007388, -0.587377, 1.629211, 0, 0.1607843, 1, 1,
0.4019829, 0.655501, -0.1342392, 0, 0.1529412, 1, 1,
0.4042286, 0.4211264, -0.3410378, 0, 0.1490196, 1, 1,
0.4071268, 0.2154821, 2.254941, 0, 0.1411765, 1, 1,
0.4079011, -0.2328302, 3.619166, 0, 0.1372549, 1, 1,
0.409665, -0.793902, 0.7633005, 0, 0.1294118, 1, 1,
0.4103796, -0.3095942, 1.844622, 0, 0.1254902, 1, 1,
0.4166479, -1.039324, 3.887079, 0, 0.1176471, 1, 1,
0.4177696, 0.8256317, 0.2954664, 0, 0.1137255, 1, 1,
0.4239482, -0.01382572, 0.9762291, 0, 0.1058824, 1, 1,
0.4311627, 1.130751, 1.685664, 0, 0.09803922, 1, 1,
0.4352688, 0.296828, 1.00131, 0, 0.09411765, 1, 1,
0.4359083, 0.2950107, -0.211579, 0, 0.08627451, 1, 1,
0.4377854, -0.3924544, 0.5078009, 0, 0.08235294, 1, 1,
0.4402831, -0.7929543, 2.310022, 0, 0.07450981, 1, 1,
0.4455912, 0.4379062, 1.011754, 0, 0.07058824, 1, 1,
0.4458952, -0.2929259, 3.142495, 0, 0.0627451, 1, 1,
0.4468565, 0.7493612, 2.562282, 0, 0.05882353, 1, 1,
0.4497582, -1.219115, 3.048011, 0, 0.05098039, 1, 1,
0.4528777, 0.1128505, 1.533427, 0, 0.04705882, 1, 1,
0.4535441, 0.1589027, -1.356756, 0, 0.03921569, 1, 1,
0.4569913, -0.182809, 3.23756, 0, 0.03529412, 1, 1,
0.4570521, 0.6468017, 0.6207651, 0, 0.02745098, 1, 1,
0.4575279, -0.6144514, 2.049539, 0, 0.02352941, 1, 1,
0.4576479, -0.8501797, 1.930868, 0, 0.01568628, 1, 1,
0.4580924, -0.1407685, 1.393516, 0, 0.01176471, 1, 1,
0.4596605, 1.424626, -0.1047812, 0, 0.003921569, 1, 1,
0.4598575, -0.03926117, 1.296208, 0.003921569, 0, 1, 1,
0.4616169, -1.341448, 3.372498, 0.007843138, 0, 1, 1,
0.4696159, 0.4117128, -1.055001, 0.01568628, 0, 1, 1,
0.4702753, 2.377163, 0.226285, 0.01960784, 0, 1, 1,
0.4713339, 0.8092167, -0.6871747, 0.02745098, 0, 1, 1,
0.4731073, -0.5277135, 3.643178, 0.03137255, 0, 1, 1,
0.4761043, 0.05270131, 0.4262282, 0.03921569, 0, 1, 1,
0.479097, -0.7308707, 3.479553, 0.04313726, 0, 1, 1,
0.4836756, 1.189713, -0.6128793, 0.05098039, 0, 1, 1,
0.483801, -0.267302, 1.222366, 0.05490196, 0, 1, 1,
0.4841116, 0.2138181, 1.637142, 0.0627451, 0, 1, 1,
0.4853967, 1.015397, 1.976482, 0.06666667, 0, 1, 1,
0.4860565, 0.8393471, -0.8605609, 0.07450981, 0, 1, 1,
0.4924818, -0.8821809, 4.709033, 0.07843138, 0, 1, 1,
0.493133, 0.4262865, 0.1256251, 0.08627451, 0, 1, 1,
0.4966402, 0.8537785, 0.2585929, 0.09019608, 0, 1, 1,
0.4994797, -1.092501, 0.4657939, 0.09803922, 0, 1, 1,
0.4999866, 1.046111, 0.3741708, 0.1058824, 0, 1, 1,
0.5047171, 1.114972, -0.2986412, 0.1098039, 0, 1, 1,
0.5053837, -0.05722912, 1.122324, 0.1176471, 0, 1, 1,
0.5056781, 0.3325579, 2.046, 0.1215686, 0, 1, 1,
0.5061224, 0.3573136, 2.181951, 0.1294118, 0, 1, 1,
0.507535, 0.2022779, 2.2087, 0.1333333, 0, 1, 1,
0.5115646, 0.1919011, 0.8006797, 0.1411765, 0, 1, 1,
0.512633, -0.8670027, 1.779983, 0.145098, 0, 1, 1,
0.5160775, 1.149261, -0.3201682, 0.1529412, 0, 1, 1,
0.5219771, 1.102231, -0.7798207, 0.1568628, 0, 1, 1,
0.5231995, -1.940919, 3.503996, 0.1647059, 0, 1, 1,
0.5264136, -0.6737259, 1.875834, 0.1686275, 0, 1, 1,
0.5304551, -0.8465636, 2.019482, 0.1764706, 0, 1, 1,
0.5305194, 2.587502, 1.467639, 0.1803922, 0, 1, 1,
0.5411833, -0.2558494, 2.464632, 0.1882353, 0, 1, 1,
0.5412337, 0.5125878, 0.3049646, 0.1921569, 0, 1, 1,
0.5421395, 0.7738884, -0.3781101, 0.2, 0, 1, 1,
0.5434868, -1.304224, 1.88201, 0.2078431, 0, 1, 1,
0.5455216, 0.959985, 0.2155897, 0.2117647, 0, 1, 1,
0.5491154, -0.3667357, 2.781368, 0.2196078, 0, 1, 1,
0.5503551, 0.1211245, 1.627742, 0.2235294, 0, 1, 1,
0.5541015, -0.2379902, 1.462341, 0.2313726, 0, 1, 1,
0.5552347, 0.3022544, 1.578443, 0.2352941, 0, 1, 1,
0.5555961, -1.234275, 3.128895, 0.2431373, 0, 1, 1,
0.5592833, -0.4152373, 4.840473, 0.2470588, 0, 1, 1,
0.5596012, -0.5939813, 0.7893129, 0.254902, 0, 1, 1,
0.5612409, -0.5203541, 1.98178, 0.2588235, 0, 1, 1,
0.5630262, -1.138471, 2.310592, 0.2666667, 0, 1, 1,
0.5684518, -0.1419001, 2.036654, 0.2705882, 0, 1, 1,
0.5686805, 0.666274, -0.7140452, 0.2784314, 0, 1, 1,
0.5723183, 1.373574, -0.1301359, 0.282353, 0, 1, 1,
0.583085, 0.7305639, 1.595734, 0.2901961, 0, 1, 1,
0.5846217, 0.9269066, 3.094353, 0.2941177, 0, 1, 1,
0.5869728, -0.1974241, 2.02675, 0.3019608, 0, 1, 1,
0.590892, -0.1269217, 1.829934, 0.3098039, 0, 1, 1,
0.5916913, 2.192223, 0.8653075, 0.3137255, 0, 1, 1,
0.5940736, 1.05198, 0.519223, 0.3215686, 0, 1, 1,
0.5984051, 0.4841535, 2.305987, 0.3254902, 0, 1, 1,
0.6037852, -0.0710533, 0.8843549, 0.3333333, 0, 1, 1,
0.6047537, 0.5014061, -0.9654211, 0.3372549, 0, 1, 1,
0.6072353, 1.116139, 1.686264, 0.345098, 0, 1, 1,
0.6072953, -0.1653016, 1.420231, 0.3490196, 0, 1, 1,
0.6096216, 2.837533, -1.803037, 0.3568628, 0, 1, 1,
0.6114555, 2.559673, 0.982199, 0.3607843, 0, 1, 1,
0.6123378, -1.197514, 3.342581, 0.3686275, 0, 1, 1,
0.6123976, 1.790118, 1.071892, 0.372549, 0, 1, 1,
0.6125925, 0.5133553, 1.849816, 0.3803922, 0, 1, 1,
0.6130078, -0.4339505, 1.97459, 0.3843137, 0, 1, 1,
0.6193954, -0.4513776, 1.632251, 0.3921569, 0, 1, 1,
0.6210739, -0.09242326, -0.7116277, 0.3960784, 0, 1, 1,
0.6228911, 0.3956622, 0.8414106, 0.4039216, 0, 1, 1,
0.6271734, -0.7669623, 1.736139, 0.4117647, 0, 1, 1,
0.6288168, -0.3295008, 1.393298, 0.4156863, 0, 1, 1,
0.6289403, 1.127406, 1.311094, 0.4235294, 0, 1, 1,
0.6297155, 0.8846921, 2.267623, 0.427451, 0, 1, 1,
0.6303482, 0.3116029, 1.089242, 0.4352941, 0, 1, 1,
0.6368836, -0.1455506, 1.598293, 0.4392157, 0, 1, 1,
0.6368979, 0.01110251, 0.2208155, 0.4470588, 0, 1, 1,
0.6402794, -0.9687953, 3.252237, 0.4509804, 0, 1, 1,
0.6440973, -0.02596012, 1.666645, 0.4588235, 0, 1, 1,
0.6443712, -0.06722485, 2.006589, 0.4627451, 0, 1, 1,
0.6447271, 0.7329885, 1.572655, 0.4705882, 0, 1, 1,
0.644877, -0.2542378, 2.742369, 0.4745098, 0, 1, 1,
0.6485187, 1.475947, 0.1706328, 0.4823529, 0, 1, 1,
0.6492078, 1.051599, 0.4512818, 0.4862745, 0, 1, 1,
0.6530842, 1.934118, 2.149412, 0.4941176, 0, 1, 1,
0.6644331, -0.4775832, 2.423155, 0.5019608, 0, 1, 1,
0.6674233, -0.8709581, 1.659178, 0.5058824, 0, 1, 1,
0.6791646, -0.4848356, 2.086981, 0.5137255, 0, 1, 1,
0.6817288, 0.5859069, -0.04126056, 0.5176471, 0, 1, 1,
0.6819239, -0.3678821, 1.8284, 0.5254902, 0, 1, 1,
0.6824533, -1.180002, 3.098953, 0.5294118, 0, 1, 1,
0.6832114, 1.429493, 2.335422, 0.5372549, 0, 1, 1,
0.6873462, -0.2460456, 2.130372, 0.5411765, 0, 1, 1,
0.6895516, -1.162293, 3.224402, 0.5490196, 0, 1, 1,
0.6931461, 1.328806, -0.6850094, 0.5529412, 0, 1, 1,
0.6961313, 0.2867896, 1.376461, 0.5607843, 0, 1, 1,
0.7025387, -2.132366, 1.718934, 0.5647059, 0, 1, 1,
0.705272, -0.6060743, 1.376549, 0.572549, 0, 1, 1,
0.7055689, 0.2220764, 3.214073, 0.5764706, 0, 1, 1,
0.7066596, 1.734833, 0.8065268, 0.5843138, 0, 1, 1,
0.7082722, -0.0169628, 0.7930225, 0.5882353, 0, 1, 1,
0.7099917, -0.5962698, 1.568177, 0.5960785, 0, 1, 1,
0.7119929, -0.6706058, 2.098751, 0.6039216, 0, 1, 1,
0.7127424, -0.3319643, 2.477116, 0.6078432, 0, 1, 1,
0.7139931, 0.8165047, 0.371893, 0.6156863, 0, 1, 1,
0.7158223, 0.1793403, 1.514456, 0.6196079, 0, 1, 1,
0.720666, 0.2294188, 1.189648, 0.627451, 0, 1, 1,
0.7216215, -0.7309799, 3.738472, 0.6313726, 0, 1, 1,
0.7275895, 0.3620709, 1.971649, 0.6392157, 0, 1, 1,
0.7336808, -1.396752, 4.664468, 0.6431373, 0, 1, 1,
0.7383825, 1.31549, 0.6462846, 0.6509804, 0, 1, 1,
0.7416971, -1.152453, 3.215439, 0.654902, 0, 1, 1,
0.7425477, 0.9973203, 0.3283767, 0.6627451, 0, 1, 1,
0.7465511, 1.711599, 0.8625758, 0.6666667, 0, 1, 1,
0.747795, -0.2929343, 2.412482, 0.6745098, 0, 1, 1,
0.7484298, -0.3925549, 2.062343, 0.6784314, 0, 1, 1,
0.7500029, -0.2369903, 0.4711719, 0.6862745, 0, 1, 1,
0.7594021, -0.7383775, 3.903454, 0.6901961, 0, 1, 1,
0.7605947, 0.1693399, 0.6614164, 0.6980392, 0, 1, 1,
0.7611535, 0.2532645, 2.402386, 0.7058824, 0, 1, 1,
0.763177, 0.2882016, 0.2197868, 0.7098039, 0, 1, 1,
0.7661849, -1.111628, 1.496871, 0.7176471, 0, 1, 1,
0.7672169, -0.3184854, 1.429587, 0.7215686, 0, 1, 1,
0.7763201, 0.8155633, -0.08366593, 0.7294118, 0, 1, 1,
0.7776093, 0.1880565, 1.004574, 0.7333333, 0, 1, 1,
0.7856756, 1.979426, 2.706577, 0.7411765, 0, 1, 1,
0.7892175, 0.6583789, 0.1508371, 0.7450981, 0, 1, 1,
0.790052, 0.8304704, 0.7142088, 0.7529412, 0, 1, 1,
0.7922454, -0.5863738, 2.219597, 0.7568628, 0, 1, 1,
0.7937875, 0.2083551, 0.3494844, 0.7647059, 0, 1, 1,
0.7941166, 1.064946, 2.642435, 0.7686275, 0, 1, 1,
0.7978042, 0.3365189, 0.4001953, 0.7764706, 0, 1, 1,
0.8050724, 0.9005346, -0.04883189, 0.7803922, 0, 1, 1,
0.8109551, -1.699554, 3.62924, 0.7882353, 0, 1, 1,
0.8113195, -1.639026, 1.860173, 0.7921569, 0, 1, 1,
0.8142548, -0.04160232, 2.538328, 0.8, 0, 1, 1,
0.8145902, 0.5057787, 0.1757272, 0.8078431, 0, 1, 1,
0.8182392, 1.480264, 1.745335, 0.8117647, 0, 1, 1,
0.8233424, -0.02668481, 0.69688, 0.8196079, 0, 1, 1,
0.8273208, 0.06183028, 0.3632732, 0.8235294, 0, 1, 1,
0.8275782, 1.186325, 1.807973, 0.8313726, 0, 1, 1,
0.8332039, -0.4848799, 3.386476, 0.8352941, 0, 1, 1,
0.8382973, 0.9471958, 0.7736281, 0.8431373, 0, 1, 1,
0.8393524, -0.1215196, 0.9306159, 0.8470588, 0, 1, 1,
0.840705, 2.506533, -1.350165, 0.854902, 0, 1, 1,
0.8410988, 0.2689607, 1.923353, 0.8588235, 0, 1, 1,
0.8465878, -0.2905998, 3.324112, 0.8666667, 0, 1, 1,
0.8469566, -0.7331134, 1.267695, 0.8705882, 0, 1, 1,
0.849819, 1.411148, 0.3805452, 0.8784314, 0, 1, 1,
0.8506631, -1.167649, 4.222454, 0.8823529, 0, 1, 1,
0.852699, 0.241466, 2.527517, 0.8901961, 0, 1, 1,
0.8622481, 0.9205272, 1.454448, 0.8941177, 0, 1, 1,
0.8653119, -0.07426235, 1.271077, 0.9019608, 0, 1, 1,
0.8669194, -0.6459993, 3.437542, 0.9098039, 0, 1, 1,
0.8712099, -0.6307571, 1.405124, 0.9137255, 0, 1, 1,
0.8718596, 0.1033325, 1.674385, 0.9215686, 0, 1, 1,
0.875202, -0.9446038, 1.804692, 0.9254902, 0, 1, 1,
0.8783407, -0.296458, -0.468029, 0.9333333, 0, 1, 1,
0.8813754, -0.8302129, 1.733418, 0.9372549, 0, 1, 1,
0.8863202, -0.4606035, 2.012949, 0.945098, 0, 1, 1,
0.8877446, -1.366411, 3.320313, 0.9490196, 0, 1, 1,
0.894659, -0.5804552, 3.276316, 0.9568627, 0, 1, 1,
0.8955989, 0.3968062, 0.1604328, 0.9607843, 0, 1, 1,
0.8962045, 0.3127017, 0.1029554, 0.9686275, 0, 1, 1,
0.9030401, 0.6851488, 0.5612516, 0.972549, 0, 1, 1,
0.9072954, -0.192079, 1.437698, 0.9803922, 0, 1, 1,
0.9150181, 0.2293742, 1.180071, 0.9843137, 0, 1, 1,
0.9216317, 0.5009973, 2.612035, 0.9921569, 0, 1, 1,
0.9238902, -0.1251001, 0.3906937, 0.9960784, 0, 1, 1,
0.9274895, 1.375203, 2.137867, 1, 0, 0.9960784, 1,
0.927561, 0.2363848, 0.8496464, 1, 0, 0.9882353, 1,
0.9305968, 1.825468, 0.4963852, 1, 0, 0.9843137, 1,
0.9318793, 0.3443188, 0.8617634, 1, 0, 0.9764706, 1,
0.9345509, 0.3800185, 0.4894201, 1, 0, 0.972549, 1,
0.9451209, -0.5686178, 2.723193, 1, 0, 0.9647059, 1,
0.9459406, -0.08966009, 2.140792, 1, 0, 0.9607843, 1,
0.9509474, -0.6760026, 1.399449, 1, 0, 0.9529412, 1,
0.9612378, 0.3966213, 0.1251775, 1, 0, 0.9490196, 1,
0.9634984, -0.01242048, 2.975709, 1, 0, 0.9411765, 1,
0.963615, -1.423754, 4.129607, 1, 0, 0.9372549, 1,
0.9646881, -1.361123, 2.10551, 1, 0, 0.9294118, 1,
0.9671569, 0.1283833, 1.152354, 1, 0, 0.9254902, 1,
0.9737902, 0.482329, 1.243932, 1, 0, 0.9176471, 1,
0.9738796, -0.2516957, 0.6379146, 1, 0, 0.9137255, 1,
0.9819402, 0.6072339, 0.7619113, 1, 0, 0.9058824, 1,
0.9823072, -0.3000259, 2.503538, 1, 0, 0.9019608, 1,
1.005296, -0.07879913, 3.615569, 1, 0, 0.8941177, 1,
1.007794, 0.6510831, 0.5118032, 1, 0, 0.8862745, 1,
1.010286, 1.342615, -0.2944161, 1, 0, 0.8823529, 1,
1.010433, -0.9408599, 2.184275, 1, 0, 0.8745098, 1,
1.011962, 0.3010311, 1.958883, 1, 0, 0.8705882, 1,
1.020072, 0.7558646, 0.8724045, 1, 0, 0.8627451, 1,
1.022909, -0.2592641, 1.284402, 1, 0, 0.8588235, 1,
1.023, -0.8879789, 1.101274, 1, 0, 0.8509804, 1,
1.025873, -1.616507, 2.568356, 1, 0, 0.8470588, 1,
1.026133, 0.2612926, 1.195624, 1, 0, 0.8392157, 1,
1.02809, -0.5105808, 0.9510738, 1, 0, 0.8352941, 1,
1.02977, -0.7778118, 2.0104, 1, 0, 0.827451, 1,
1.04342, -1.824116, 2.964128, 1, 0, 0.8235294, 1,
1.044192, 0.3943364, 0.9012761, 1, 0, 0.8156863, 1,
1.047761, -0.220769, 1.448088, 1, 0, 0.8117647, 1,
1.052392, -0.5541074, 1.815348, 1, 0, 0.8039216, 1,
1.060532, 0.8854616, 0.3197338, 1, 0, 0.7960784, 1,
1.07133, 0.7422758, 0.6010018, 1, 0, 0.7921569, 1,
1.071688, 0.2777427, -1.195242, 1, 0, 0.7843137, 1,
1.076266, -0.9736173, 1.322498, 1, 0, 0.7803922, 1,
1.078374, 0.5152985, 1.488685, 1, 0, 0.772549, 1,
1.078416, 0.5926715, 1.450107, 1, 0, 0.7686275, 1,
1.079829, 1.164507, 1.950535, 1, 0, 0.7607843, 1,
1.081601, -0.2712193, 2.754578, 1, 0, 0.7568628, 1,
1.085418, 0.776616, 1.77352, 1, 0, 0.7490196, 1,
1.086307, -2.218356, 2.772739, 1, 0, 0.7450981, 1,
1.087037, -1.424534, 3.360097, 1, 0, 0.7372549, 1,
1.087895, 2.124496, -0.6567026, 1, 0, 0.7333333, 1,
1.089431, 0.7512046, 1.876191, 1, 0, 0.7254902, 1,
1.109555, 0.6863834, 0.1084988, 1, 0, 0.7215686, 1,
1.119707, 0.2898075, 1.84796, 1, 0, 0.7137255, 1,
1.121858, 0.908844, 0.6892053, 1, 0, 0.7098039, 1,
1.132003, -1.274539, 2.048081, 1, 0, 0.7019608, 1,
1.141764, 0.975601, -1.265896, 1, 0, 0.6941177, 1,
1.144284, 0.2367354, 0.769765, 1, 0, 0.6901961, 1,
1.146357, -0.5444019, 2.318316, 1, 0, 0.682353, 1,
1.146621, -0.9771025, 1.629389, 1, 0, 0.6784314, 1,
1.150194, 0.02466043, 2.917195, 1, 0, 0.6705883, 1,
1.152936, -0.003144772, 1.215377, 1, 0, 0.6666667, 1,
1.153927, -0.5048609, 0.5282006, 1, 0, 0.6588235, 1,
1.154376, 0.09091204, 1.245156, 1, 0, 0.654902, 1,
1.159441, -0.5807838, 2.125726, 1, 0, 0.6470588, 1,
1.161909, 0.995093, 1.007498, 1, 0, 0.6431373, 1,
1.164995, 1.482618, 1.42011, 1, 0, 0.6352941, 1,
1.166716, -1.419554, 2.292233, 1, 0, 0.6313726, 1,
1.190388, -0.214263, 1.844198, 1, 0, 0.6235294, 1,
1.194842, -1.298221, 3.803136, 1, 0, 0.6196079, 1,
1.198429, 0.8871513, 0.7406251, 1, 0, 0.6117647, 1,
1.207489, -1.051733, 1.72415, 1, 0, 0.6078432, 1,
1.212087, -1.342984, 1.721178, 1, 0, 0.6, 1,
1.216316, 0.3038657, 1.194914, 1, 0, 0.5921569, 1,
1.217504, 1.111784, 1.530645, 1, 0, 0.5882353, 1,
1.226403, 0.3022092, 1.130975, 1, 0, 0.5803922, 1,
1.227216, 1.064628, 1.437783, 1, 0, 0.5764706, 1,
1.227305, -2.913327, 3.987905, 1, 0, 0.5686275, 1,
1.237236, 1.180617, 2.602948, 1, 0, 0.5647059, 1,
1.254525, -0.0199321, 1.90991, 1, 0, 0.5568628, 1,
1.258616, -0.5801721, 2.156737, 1, 0, 0.5529412, 1,
1.258895, -0.6472836, 2.628019, 1, 0, 0.5450981, 1,
1.259825, -0.6920215, 1.996811, 1, 0, 0.5411765, 1,
1.263648, 0.9280784, 0.3564996, 1, 0, 0.5333334, 1,
1.265451, 0.4133537, 1.876655, 1, 0, 0.5294118, 1,
1.271648, -0.05157426, 1.376921, 1, 0, 0.5215687, 1,
1.272651, 1.280248, -0.006103394, 1, 0, 0.5176471, 1,
1.283137, 0.2274261, 0.5440231, 1, 0, 0.509804, 1,
1.284802, 0.03647638, 0.06300431, 1, 0, 0.5058824, 1,
1.293707, 1.159296, -0.2853545, 1, 0, 0.4980392, 1,
1.294713, -0.4103525, 2.496905, 1, 0, 0.4901961, 1,
1.298982, 2.449435, -0.02714841, 1, 0, 0.4862745, 1,
1.30516, -1.167571, 3.284106, 1, 0, 0.4784314, 1,
1.318298, 1.354093, -1.126087, 1, 0, 0.4745098, 1,
1.321879, 0.9350027, -1.003744, 1, 0, 0.4666667, 1,
1.325176, 1.710951, -0.2920889, 1, 0, 0.4627451, 1,
1.328302, 1.755312, 1.221129, 1, 0, 0.454902, 1,
1.337993, -0.3665984, 1.034585, 1, 0, 0.4509804, 1,
1.338902, -0.6080948, 2.234314, 1, 0, 0.4431373, 1,
1.359117, -0.06533729, 1.958349, 1, 0, 0.4392157, 1,
1.360106, -0.5524319, 2.855331, 1, 0, 0.4313726, 1,
1.364043, 0.2277839, 0.4872784, 1, 0, 0.427451, 1,
1.36556, -0.06849502, 2.971979, 1, 0, 0.4196078, 1,
1.36608, -0.6839509, 4.223693, 1, 0, 0.4156863, 1,
1.375439, -0.03916408, 3.195592, 1, 0, 0.4078431, 1,
1.380612, -0.5862436, 0.5344104, 1, 0, 0.4039216, 1,
1.386932, -0.5927486, 1.27964, 1, 0, 0.3960784, 1,
1.405918, 0.9391465, 1.806025, 1, 0, 0.3882353, 1,
1.40786, 1.183133, 0.8889551, 1, 0, 0.3843137, 1,
1.435537, 0.3042502, 1.378521, 1, 0, 0.3764706, 1,
1.450801, 1.149179, 0.5810671, 1, 0, 0.372549, 1,
1.455432, -1.686408, 1.716372, 1, 0, 0.3647059, 1,
1.463183, -0.1430105, 1.822384, 1, 0, 0.3607843, 1,
1.482721, -1.035939, 0.931251, 1, 0, 0.3529412, 1,
1.490522, 0.06038269, -0.3525676, 1, 0, 0.3490196, 1,
1.490896, -1.279891, 0.7288411, 1, 0, 0.3411765, 1,
1.499061, 0.4064153, 2.23915, 1, 0, 0.3372549, 1,
1.501038, -0.3050761, 2.127926, 1, 0, 0.3294118, 1,
1.501949, 1.717905, 0.5834282, 1, 0, 0.3254902, 1,
1.503973, 0.3730771, 1.445594, 1, 0, 0.3176471, 1,
1.512659, 0.3848655, 2.37286, 1, 0, 0.3137255, 1,
1.520915, -0.4516107, 2.376767, 1, 0, 0.3058824, 1,
1.526383, -2.370394, 0.8029647, 1, 0, 0.2980392, 1,
1.533179, -0.961812, 1.891626, 1, 0, 0.2941177, 1,
1.539189, 0.3377028, 1.246725, 1, 0, 0.2862745, 1,
1.546325, 0.3478722, -0.4369655, 1, 0, 0.282353, 1,
1.570259, -0.5729038, 1.102095, 1, 0, 0.2745098, 1,
1.576146, -0.4873562, 1.721779, 1, 0, 0.2705882, 1,
1.587651, 0.03341591, 3.472989, 1, 0, 0.2627451, 1,
1.600334, -0.03397445, 3.337126, 1, 0, 0.2588235, 1,
1.627639, -2.146562, 3.987591, 1, 0, 0.2509804, 1,
1.639997, 0.355094, 3.092261, 1, 0, 0.2470588, 1,
1.648752, -0.199426, 1.231763, 1, 0, 0.2392157, 1,
1.661109, -0.5984719, 1.454098, 1, 0, 0.2352941, 1,
1.666047, -1.240007, 5.183424, 1, 0, 0.227451, 1,
1.678133, 0.8096115, 2.55685, 1, 0, 0.2235294, 1,
1.694269, -0.4350563, 0.799867, 1, 0, 0.2156863, 1,
1.705969, 0.4808118, 0.3231953, 1, 0, 0.2117647, 1,
1.720867, -1.257158, 2.377559, 1, 0, 0.2039216, 1,
1.723837, -0.431494, 1.941875, 1, 0, 0.1960784, 1,
1.725866, 2.130176, -1.131464, 1, 0, 0.1921569, 1,
1.729966, 0.9051452, 0.2760893, 1, 0, 0.1843137, 1,
1.748263, 1.594192, 0.404336, 1, 0, 0.1803922, 1,
1.750255, 1.109215, 0.9268525, 1, 0, 0.172549, 1,
1.785405, 0.6411127, 1.24756, 1, 0, 0.1686275, 1,
1.796388, -0.1182467, 1.721219, 1, 0, 0.1607843, 1,
1.818953, -0.677227, 1.586632, 1, 0, 0.1568628, 1,
1.84743, 3.022009, 1.49485, 1, 0, 0.1490196, 1,
1.848368, 0.2925317, -0.209066, 1, 0, 0.145098, 1,
1.854972, 0.6749718, -0.9115125, 1, 0, 0.1372549, 1,
1.862587, -0.5187039, 2.001081, 1, 0, 0.1333333, 1,
1.87435, -0.4374267, 0.4244937, 1, 0, 0.1254902, 1,
1.938024, -0.6638563, 0.4946278, 1, 0, 0.1215686, 1,
1.958887, -0.9600597, 2.47104, 1, 0, 0.1137255, 1,
1.980664, 0.7854663, 0.1817105, 1, 0, 0.1098039, 1,
1.995919, -0.2307642, 3.62851, 1, 0, 0.1019608, 1,
2.040613, -0.5734944, 2.485338, 1, 0, 0.09411765, 1,
2.04412, -0.9827483, 1.569747, 1, 0, 0.09019608, 1,
2.05531, -0.07733867, 2.158714, 1, 0, 0.08235294, 1,
2.066415, -0.7358061, 0.8420552, 1, 0, 0.07843138, 1,
2.068735, 2.046285, -0.04463482, 1, 0, 0.07058824, 1,
2.086077, 0.2417575, 2.955577, 1, 0, 0.06666667, 1,
2.16256, -0.1725343, 0.7159893, 1, 0, 0.05882353, 1,
2.185309, -1.013715, 2.666356, 1, 0, 0.05490196, 1,
2.331298, -1.108481, 0.9010707, 1, 0, 0.04705882, 1,
2.363962, 0.5821683, 2.195736, 1, 0, 0.04313726, 1,
2.412746, -0.1343433, 1.785661, 1, 0, 0.03529412, 1,
2.416081, -0.6463479, 1.187254, 1, 0, 0.03137255, 1,
2.953244, 0.3061912, -0.07689472, 1, 0, 0.02352941, 1,
2.982123, -0.2681823, 2.754087, 1, 0, 0.01960784, 1,
2.994653, -0.2384636, 0.5592369, 1, 0, 0.01176471, 1,
3.076073, -0.9188748, 1.271512, 1, 0, 0.007843138, 1
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
-0.05702889, -4.279915, -7.176588, 0, -0.5, 0.5, 0.5,
-0.05702889, -4.279915, -7.176588, 1, -0.5, 0.5, 0.5,
-0.05702889, -4.279915, -7.176588, 1, 1.5, 0.5, 0.5,
-0.05702889, -4.279915, -7.176588, 0, 1.5, 0.5, 0.5
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
-4.252252, -0.09980524, -7.176588, 0, -0.5, 0.5, 0.5,
-4.252252, -0.09980524, -7.176588, 1, -0.5, 0.5, 0.5,
-4.252252, -0.09980524, -7.176588, 1, 1.5, 0.5, 0.5,
-4.252252, -0.09980524, -7.176588, 0, 1.5, 0.5, 0.5
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
-4.252252, -4.279915, 0.2072439, 0, -0.5, 0.5, 0.5,
-4.252252, -4.279915, 0.2072439, 1, -0.5, 0.5, 0.5,
-4.252252, -4.279915, 0.2072439, 1, 1.5, 0.5, 0.5,
-4.252252, -4.279915, 0.2072439, 0, 1.5, 0.5, 0.5
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
-3, -3.315274, -5.472626,
3, -3.315274, -5.472626,
-3, -3.315274, -5.472626,
-3, -3.476048, -5.75662,
-2, -3.315274, -5.472626,
-2, -3.476048, -5.75662,
-1, -3.315274, -5.472626,
-1, -3.476048, -5.75662,
0, -3.315274, -5.472626,
0, -3.476048, -5.75662,
1, -3.315274, -5.472626,
1, -3.476048, -5.75662,
2, -3.315274, -5.472626,
2, -3.476048, -5.75662,
3, -3.315274, -5.472626,
3, -3.476048, -5.75662
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
-3, -3.797594, -6.324607, 0, -0.5, 0.5, 0.5,
-3, -3.797594, -6.324607, 1, -0.5, 0.5, 0.5,
-3, -3.797594, -6.324607, 1, 1.5, 0.5, 0.5,
-3, -3.797594, -6.324607, 0, 1.5, 0.5, 0.5,
-2, -3.797594, -6.324607, 0, -0.5, 0.5, 0.5,
-2, -3.797594, -6.324607, 1, -0.5, 0.5, 0.5,
-2, -3.797594, -6.324607, 1, 1.5, 0.5, 0.5,
-2, -3.797594, -6.324607, 0, 1.5, 0.5, 0.5,
-1, -3.797594, -6.324607, 0, -0.5, 0.5, 0.5,
-1, -3.797594, -6.324607, 1, -0.5, 0.5, 0.5,
-1, -3.797594, -6.324607, 1, 1.5, 0.5, 0.5,
-1, -3.797594, -6.324607, 0, 1.5, 0.5, 0.5,
0, -3.797594, -6.324607, 0, -0.5, 0.5, 0.5,
0, -3.797594, -6.324607, 1, -0.5, 0.5, 0.5,
0, -3.797594, -6.324607, 1, 1.5, 0.5, 0.5,
0, -3.797594, -6.324607, 0, 1.5, 0.5, 0.5,
1, -3.797594, -6.324607, 0, -0.5, 0.5, 0.5,
1, -3.797594, -6.324607, 1, -0.5, 0.5, 0.5,
1, -3.797594, -6.324607, 1, 1.5, 0.5, 0.5,
1, -3.797594, -6.324607, 0, 1.5, 0.5, 0.5,
2, -3.797594, -6.324607, 0, -0.5, 0.5, 0.5,
2, -3.797594, -6.324607, 1, -0.5, 0.5, 0.5,
2, -3.797594, -6.324607, 1, 1.5, 0.5, 0.5,
2, -3.797594, -6.324607, 0, 1.5, 0.5, 0.5,
3, -3.797594, -6.324607, 0, -0.5, 0.5, 0.5,
3, -3.797594, -6.324607, 1, -0.5, 0.5, 0.5,
3, -3.797594, -6.324607, 1, 1.5, 0.5, 0.5,
3, -3.797594, -6.324607, 0, 1.5, 0.5, 0.5
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
-3.284123, -3, -5.472626,
-3.284123, 3, -5.472626,
-3.284123, -3, -5.472626,
-3.445478, -3, -5.75662,
-3.284123, -2, -5.472626,
-3.445478, -2, -5.75662,
-3.284123, -1, -5.472626,
-3.445478, -1, -5.75662,
-3.284123, 0, -5.472626,
-3.445478, 0, -5.75662,
-3.284123, 1, -5.472626,
-3.445478, 1, -5.75662,
-3.284123, 2, -5.472626,
-3.445478, 2, -5.75662,
-3.284123, 3, -5.472626,
-3.445478, 3, -5.75662
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
-3.768188, -3, -6.324607, 0, -0.5, 0.5, 0.5,
-3.768188, -3, -6.324607, 1, -0.5, 0.5, 0.5,
-3.768188, -3, -6.324607, 1, 1.5, 0.5, 0.5,
-3.768188, -3, -6.324607, 0, 1.5, 0.5, 0.5,
-3.768188, -2, -6.324607, 0, -0.5, 0.5, 0.5,
-3.768188, -2, -6.324607, 1, -0.5, 0.5, 0.5,
-3.768188, -2, -6.324607, 1, 1.5, 0.5, 0.5,
-3.768188, -2, -6.324607, 0, 1.5, 0.5, 0.5,
-3.768188, -1, -6.324607, 0, -0.5, 0.5, 0.5,
-3.768188, -1, -6.324607, 1, -0.5, 0.5, 0.5,
-3.768188, -1, -6.324607, 1, 1.5, 0.5, 0.5,
-3.768188, -1, -6.324607, 0, 1.5, 0.5, 0.5,
-3.768188, 0, -6.324607, 0, -0.5, 0.5, 0.5,
-3.768188, 0, -6.324607, 1, -0.5, 0.5, 0.5,
-3.768188, 0, -6.324607, 1, 1.5, 0.5, 0.5,
-3.768188, 0, -6.324607, 0, 1.5, 0.5, 0.5,
-3.768188, 1, -6.324607, 0, -0.5, 0.5, 0.5,
-3.768188, 1, -6.324607, 1, -0.5, 0.5, 0.5,
-3.768188, 1, -6.324607, 1, 1.5, 0.5, 0.5,
-3.768188, 1, -6.324607, 0, 1.5, 0.5, 0.5,
-3.768188, 2, -6.324607, 0, -0.5, 0.5, 0.5,
-3.768188, 2, -6.324607, 1, -0.5, 0.5, 0.5,
-3.768188, 2, -6.324607, 1, 1.5, 0.5, 0.5,
-3.768188, 2, -6.324607, 0, 1.5, 0.5, 0.5,
-3.768188, 3, -6.324607, 0, -0.5, 0.5, 0.5,
-3.768188, 3, -6.324607, 1, -0.5, 0.5, 0.5,
-3.768188, 3, -6.324607, 1, 1.5, 0.5, 0.5,
-3.768188, 3, -6.324607, 0, 1.5, 0.5, 0.5
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
-3.284123, -3.315274, -4,
-3.284123, -3.315274, 4,
-3.284123, -3.315274, -4,
-3.445478, -3.476048, -4,
-3.284123, -3.315274, -2,
-3.445478, -3.476048, -2,
-3.284123, -3.315274, 0,
-3.445478, -3.476048, 0,
-3.284123, -3.315274, 2,
-3.445478, -3.476048, 2,
-3.284123, -3.315274, 4,
-3.445478, -3.476048, 4
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
-3.768188, -3.797594, -4, 0, -0.5, 0.5, 0.5,
-3.768188, -3.797594, -4, 1, -0.5, 0.5, 0.5,
-3.768188, -3.797594, -4, 1, 1.5, 0.5, 0.5,
-3.768188, -3.797594, -4, 0, 1.5, 0.5, 0.5,
-3.768188, -3.797594, -2, 0, -0.5, 0.5, 0.5,
-3.768188, -3.797594, -2, 1, -0.5, 0.5, 0.5,
-3.768188, -3.797594, -2, 1, 1.5, 0.5, 0.5,
-3.768188, -3.797594, -2, 0, 1.5, 0.5, 0.5,
-3.768188, -3.797594, 0, 0, -0.5, 0.5, 0.5,
-3.768188, -3.797594, 0, 1, -0.5, 0.5, 0.5,
-3.768188, -3.797594, 0, 1, 1.5, 0.5, 0.5,
-3.768188, -3.797594, 0, 0, 1.5, 0.5, 0.5,
-3.768188, -3.797594, 2, 0, -0.5, 0.5, 0.5,
-3.768188, -3.797594, 2, 1, -0.5, 0.5, 0.5,
-3.768188, -3.797594, 2, 1, 1.5, 0.5, 0.5,
-3.768188, -3.797594, 2, 0, 1.5, 0.5, 0.5,
-3.768188, -3.797594, 4, 0, -0.5, 0.5, 0.5,
-3.768188, -3.797594, 4, 1, -0.5, 0.5, 0.5,
-3.768188, -3.797594, 4, 1, 1.5, 0.5, 0.5,
-3.768188, -3.797594, 4, 0, 1.5, 0.5, 0.5
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
-3.284123, -3.315274, -5.472626,
-3.284123, 3.115664, -5.472626,
-3.284123, -3.315274, 5.887114,
-3.284123, 3.115664, 5.887114,
-3.284123, -3.315274, -5.472626,
-3.284123, -3.315274, 5.887114,
-3.284123, 3.115664, -5.472626,
-3.284123, 3.115664, 5.887114,
-3.284123, -3.315274, -5.472626,
3.170066, -3.315274, -5.472626,
-3.284123, -3.315274, 5.887114,
3.170066, -3.315274, 5.887114,
-3.284123, 3.115664, -5.472626,
3.170066, 3.115664, -5.472626,
-3.284123, 3.115664, 5.887114,
3.170066, 3.115664, 5.887114,
3.170066, -3.315274, -5.472626,
3.170066, 3.115664, -5.472626,
3.170066, -3.315274, 5.887114,
3.170066, 3.115664, 5.887114,
3.170066, -3.315274, -5.472626,
3.170066, -3.315274, 5.887114,
3.170066, 3.115664, -5.472626,
3.170066, 3.115664, 5.887114
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
var radius = 7.775924;
var distance = 34.59596;
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
mvMatrix.translate( 0.05702889, 0.09980524, -0.2072439 );
mvMatrix.scale( 1.302639, 1.307349, 0.7401121 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.59596);
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
methylarsonate<-read.table("methylarsonate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-methylarsonate$V2
```

```
## Error in eval(expr, envir, enclos): object 'methylarsonate' not found
```

```r
y<-methylarsonate$V3
```

```
## Error in eval(expr, envir, enclos): object 'methylarsonate' not found
```

```r
z<-methylarsonate$V4
```

```
## Error in eval(expr, envir, enclos): object 'methylarsonate' not found
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
-3.19013, 0.2225585, -2.958196, 0, 0, 1, 1, 1,
-2.52293, 0.5539142, -3.055439, 1, 0, 0, 1, 1,
-2.475754, 1.455418, 0.426586, 1, 0, 0, 1, 1,
-2.440628, -0.4801518, -1.476994, 1, 0, 0, 1, 1,
-2.426765, 0.231366, -1.673086, 1, 0, 0, 1, 1,
-2.383966, 0.1753988, -1.445398, 1, 0, 0, 1, 1,
-2.291834, -0.4804185, -1.39359, 0, 0, 0, 1, 1,
-2.268976, -1.582354, -2.515993, 0, 0, 0, 1, 1,
-2.25905, 0.3951887, -2.493968, 0, 0, 0, 1, 1,
-2.254012, -2.666221, -2.142706, 0, 0, 0, 1, 1,
-2.235155, 1.413782, -2.70323, 0, 0, 0, 1, 1,
-2.225806, 0.7858718, -0.2450875, 0, 0, 0, 1, 1,
-2.206069, 0.7148497, -0.8250515, 0, 0, 0, 1, 1,
-2.137061, -2.307275, -3.164667, 1, 1, 1, 1, 1,
-2.11122, -1.072727, -2.018236, 1, 1, 1, 1, 1,
-2.063347, 1.033015, -0.8403735, 1, 1, 1, 1, 1,
-2.057588, -0.8840478, -3.302766, 1, 1, 1, 1, 1,
-1.995287, -0.4389223, -0.9323206, 1, 1, 1, 1, 1,
-1.991958, 2.103969, -0.1206964, 1, 1, 1, 1, 1,
-1.940552, -1.268458, -3.050866, 1, 1, 1, 1, 1,
-1.916289, 1.515055, -1.220228, 1, 1, 1, 1, 1,
-1.909409, -0.8943498, -2.011574, 1, 1, 1, 1, 1,
-1.9037, -0.6175064, -0.9919527, 1, 1, 1, 1, 1,
-1.897085, -1.265058, -2.863613, 1, 1, 1, 1, 1,
-1.889861, -2.431647, -4.127525, 1, 1, 1, 1, 1,
-1.886523, -0.2266115, -0.2176105, 1, 1, 1, 1, 1,
-1.841649, 0.2179952, -3.500804, 1, 1, 1, 1, 1,
-1.827395, -0.7665821, -1.281115, 1, 1, 1, 1, 1,
-1.814562, -0.2508348, -3.394938, 0, 0, 1, 1, 1,
-1.794338, 0.0421758, -0.8045042, 1, 0, 0, 1, 1,
-1.791213, -0.09301538, -2.650265, 1, 0, 0, 1, 1,
-1.765583, -0.2520563, -2.786495, 1, 0, 0, 1, 1,
-1.751916, -0.3531771, -0.7264302, 1, 0, 0, 1, 1,
-1.741014, -0.2667806, -0.8713574, 1, 0, 0, 1, 1,
-1.716576, -1.174231, -1.565242, 0, 0, 0, 1, 1,
-1.698075, -0.7400298, -0.6212401, 0, 0, 0, 1, 1,
-1.682374, -0.03060912, -0.3592644, 0, 0, 0, 1, 1,
-1.680325, 0.06316496, -2.092893, 0, 0, 0, 1, 1,
-1.655166, -0.1272304, -2.004279, 0, 0, 0, 1, 1,
-1.653523, 0.3848374, 0.1521673, 0, 0, 0, 1, 1,
-1.648621, 0.06017561, -1.924042, 0, 0, 0, 1, 1,
-1.645296, -0.8779968, -0.7725198, 1, 1, 1, 1, 1,
-1.62652, 0.3179588, -1.015188, 1, 1, 1, 1, 1,
-1.626121, 0.6042246, 0.2859675, 1, 1, 1, 1, 1,
-1.623251, 0.629778, -1.623264, 1, 1, 1, 1, 1,
-1.607399, 0.5012042, -1.494885, 1, 1, 1, 1, 1,
-1.605889, 0.4338298, -1.360719, 1, 1, 1, 1, 1,
-1.5887, -0.1478222, -2.032736, 1, 1, 1, 1, 1,
-1.586491, 0.199298, 0.008726083, 1, 1, 1, 1, 1,
-1.57731, -0.8272821, -3.060905, 1, 1, 1, 1, 1,
-1.575106, -1.527537, -1.808429, 1, 1, 1, 1, 1,
-1.573526, -0.2921956, -1.390906, 1, 1, 1, 1, 1,
-1.565908, -0.960193, -1.722641, 1, 1, 1, 1, 1,
-1.565733, -0.4988402, -1.820154, 1, 1, 1, 1, 1,
-1.551583, -0.4102146, -1.294885, 1, 1, 1, 1, 1,
-1.543455, -0.5584114, -1.856221, 1, 1, 1, 1, 1,
-1.530352, -0.3827895, -1.927051, 0, 0, 1, 1, 1,
-1.504657, -0.2809624, -2.544075, 1, 0, 0, 1, 1,
-1.498128, -1.252786, -1.57312, 1, 0, 0, 1, 1,
-1.494655, -0.264355, 0.02012583, 1, 0, 0, 1, 1,
-1.488557, -0.3750286, -1.272204, 1, 0, 0, 1, 1,
-1.483432, 0.003347342, -0.9043144, 1, 0, 0, 1, 1,
-1.473547, 1.689843, -2.393711, 0, 0, 0, 1, 1,
-1.460083, 1.577745, -1.284353, 0, 0, 0, 1, 1,
-1.457316, 1.390632, 0.6530656, 0, 0, 0, 1, 1,
-1.44898, 0.1291272, 0.06484746, 0, 0, 0, 1, 1,
-1.445245, 1.543994, -0.6981196, 0, 0, 0, 1, 1,
-1.424197, 1.202979, -0.3950385, 0, 0, 0, 1, 1,
-1.415343, 1.314577, -0.7911817, 0, 0, 0, 1, 1,
-1.414136, 0.6821255, -0.8205864, 1, 1, 1, 1, 1,
-1.412424, 0.3011536, -2.284544, 1, 1, 1, 1, 1,
-1.404607, -0.1948163, -1.680643, 1, 1, 1, 1, 1,
-1.403708, -0.7244677, -2.146698, 1, 1, 1, 1, 1,
-1.400067, -0.5083972, -0.4197932, 1, 1, 1, 1, 1,
-1.384952, 1.492293, -0.7569897, 1, 1, 1, 1, 1,
-1.366008, -1.486526, -3.453313, 1, 1, 1, 1, 1,
-1.362713, -0.430519, -3.128628, 1, 1, 1, 1, 1,
-1.356679, -0.9807226, -2.125698, 1, 1, 1, 1, 1,
-1.350638, -1.953895, -3.303795, 1, 1, 1, 1, 1,
-1.336503, 0.6683335, -0.3140362, 1, 1, 1, 1, 1,
-1.328605, 1.517844, 0.2485213, 1, 1, 1, 1, 1,
-1.307958, -0.4422851, -3.436026, 1, 1, 1, 1, 1,
-1.303882, -0.2190177, -3.192315, 1, 1, 1, 1, 1,
-1.300808, -0.1099382, 0.3656818, 1, 1, 1, 1, 1,
-1.296334, 0.9072893, 0.2048528, 0, 0, 1, 1, 1,
-1.291406, 1.211516, -1.743408, 1, 0, 0, 1, 1,
-1.283293, -0.2315537, -2.791941, 1, 0, 0, 1, 1,
-1.276487, -0.9694711, -3.740143, 1, 0, 0, 1, 1,
-1.254581, -1.157218, -2.488742, 1, 0, 0, 1, 1,
-1.253947, 0.3664635, -1.749677, 1, 0, 0, 1, 1,
-1.247066, 0.8038355, -2.0464, 0, 0, 0, 1, 1,
-1.24613, 1.338909, -2.212453, 0, 0, 0, 1, 1,
-1.234666, 0.1802658, -1.230857, 0, 0, 0, 1, 1,
-1.228657, 1.46172, -0.7015529, 0, 0, 0, 1, 1,
-1.222035, 0.4347844, -0.3204669, 0, 0, 0, 1, 1,
-1.221709, 1.053154, 0.2412258, 0, 0, 0, 1, 1,
-1.218267, 0.2105549, -2.832382, 0, 0, 0, 1, 1,
-1.201217, 0.06050595, -1.191279, 1, 1, 1, 1, 1,
-1.194894, -0.7044131, -2.609409, 1, 1, 1, 1, 1,
-1.193201, -0.7861164, -1.983768, 1, 1, 1, 1, 1,
-1.19104, 0.5847416, 0.6600479, 1, 1, 1, 1, 1,
-1.190379, -1.424118, -2.347095, 1, 1, 1, 1, 1,
-1.182513, 0.6692065, -1.903093, 1, 1, 1, 1, 1,
-1.181481, 0.2250245, -3.368403, 1, 1, 1, 1, 1,
-1.179665, -0.5085498, -1.631749, 1, 1, 1, 1, 1,
-1.176363, -0.2242291, -0.4192568, 1, 1, 1, 1, 1,
-1.175339, -0.4915133, -1.267716, 1, 1, 1, 1, 1,
-1.171139, -0.218796, 0.06379156, 1, 1, 1, 1, 1,
-1.17103, 0.4171, -1.449697, 1, 1, 1, 1, 1,
-1.151343, -0.7415355, -1.318234, 1, 1, 1, 1, 1,
-1.146226, -0.8198212, -2.809948, 1, 1, 1, 1, 1,
-1.145094, -0.4541372, -2.885801, 1, 1, 1, 1, 1,
-1.137735, -1.082711, -3.191775, 0, 0, 1, 1, 1,
-1.136323, 1.387258, -1.170374, 1, 0, 0, 1, 1,
-1.132454, 2.753498, 0.3312036, 1, 0, 0, 1, 1,
-1.131487, 0.2027013, -2.781577, 1, 0, 0, 1, 1,
-1.129885, -0.4418714, -1.543554, 1, 0, 0, 1, 1,
-1.127604, 0.4411426, -2.244648, 1, 0, 0, 1, 1,
-1.105527, 1.558793, -0.2872717, 0, 0, 0, 1, 1,
-1.098757, -0.1143885, -1.414275, 0, 0, 0, 1, 1,
-1.090618, -0.5195292, -2.11649, 0, 0, 0, 1, 1,
-1.078321, -0.1185733, -1.606049, 0, 0, 0, 1, 1,
-1.075904, 0.4926008, -1.015332, 0, 0, 0, 1, 1,
-1.073139, 1.400526, -2.688077, 0, 0, 0, 1, 1,
-1.071719, -0.03507661, -0.2814054, 0, 0, 0, 1, 1,
-1.067441, 0.03839461, -1.167057, 1, 1, 1, 1, 1,
-1.065893, -0.5695228, -3.15588, 1, 1, 1, 1, 1,
-1.061509, -0.3854407, -1.090574, 1, 1, 1, 1, 1,
-1.057666, -0.1653979, -0.6535162, 1, 1, 1, 1, 1,
-1.056729, -0.5934156, -1.3564, 1, 1, 1, 1, 1,
-1.054555, -0.1788515, -1.660556, 1, 1, 1, 1, 1,
-1.052601, 1.271944, -0.7692246, 1, 1, 1, 1, 1,
-1.052586, -3.22162, -2.551859, 1, 1, 1, 1, 1,
-1.051514, 0.4602828, -1.398313, 1, 1, 1, 1, 1,
-1.045982, -0.662495, -0.4181217, 1, 1, 1, 1, 1,
-1.028641, -0.9457346, -3.978766, 1, 1, 1, 1, 1,
-1.026851, -0.08705992, -3.179794, 1, 1, 1, 1, 1,
-1.025298, 2.404912, -2.104376, 1, 1, 1, 1, 1,
-1.020448, -2.589046, -3.182598, 1, 1, 1, 1, 1,
-1.016553, 0.4057944, -1.388697, 1, 1, 1, 1, 1,
-1.016321, -1.159698, -0.6195427, 0, 0, 1, 1, 1,
-1.009335, -0.4150014, -1.554843, 1, 0, 0, 1, 1,
-1.00545, 1.495594, -0.5072851, 1, 0, 0, 1, 1,
-1.002877, 0.4216452, -0.8580327, 1, 0, 0, 1, 1,
-1.002475, -0.9695269, -2.415199, 1, 0, 0, 1, 1,
-0.995777, 1.25682, -0.4343852, 1, 0, 0, 1, 1,
-0.9934635, -0.9265945, -1.94571, 0, 0, 0, 1, 1,
-0.9878722, -1.666892, -3.953638, 0, 0, 0, 1, 1,
-0.9802761, -0.4457837, -3.009615, 0, 0, 0, 1, 1,
-0.975787, -0.5570574, -2.433148, 0, 0, 0, 1, 1,
-0.9743541, -0.5331392, -0.2257997, 0, 0, 0, 1, 1,
-0.9687553, -0.3824173, -1.486852, 0, 0, 0, 1, 1,
-0.9684806, 0.3930629, -2.529895, 0, 0, 0, 1, 1,
-0.9684049, 2.522361, -1.425789, 1, 1, 1, 1, 1,
-0.9646546, -1.285849, -1.775294, 1, 1, 1, 1, 1,
-0.9632919, -0.09121165, -4.04343, 1, 1, 1, 1, 1,
-0.9612946, 1.296266, -0.6745759, 1, 1, 1, 1, 1,
-0.9575408, -0.1630125, 1.422197, 1, 1, 1, 1, 1,
-0.9532149, 0.4067945, -2.744804, 1, 1, 1, 1, 1,
-0.9526054, -0.4666735, -2.57567, 1, 1, 1, 1, 1,
-0.9501448, 0.9534257, -3.178996, 1, 1, 1, 1, 1,
-0.9461155, 2.214923, -0.9826888, 1, 1, 1, 1, 1,
-0.945864, -0.1759043, -2.392687, 1, 1, 1, 1, 1,
-0.942767, 1.070664, 0.5281831, 1, 1, 1, 1, 1,
-0.9396826, 0.6765463, -2.408468, 1, 1, 1, 1, 1,
-0.9343094, -0.1848251, -3.065435, 1, 1, 1, 1, 1,
-0.9318999, -2.018732, -1.947092, 1, 1, 1, 1, 1,
-0.915081, 1.173253, -2.409113, 1, 1, 1, 1, 1,
-0.9109431, -0.8622826, -1.543119, 0, 0, 1, 1, 1,
-0.9093196, -0.03581989, -2.573088, 1, 0, 0, 1, 1,
-0.9092464, 1.13298, -2.27069, 1, 0, 0, 1, 1,
-0.9070671, -0.4658232, -3.353341, 1, 0, 0, 1, 1,
-0.9023981, -1.518491, -3.26104, 1, 0, 0, 1, 1,
-0.8974053, 0.7083574, 1.1616, 1, 0, 0, 1, 1,
-0.8822179, -1.323765, -2.285774, 0, 0, 0, 1, 1,
-0.8793454, 0.5957909, -1.675023, 0, 0, 0, 1, 1,
-0.8790075, 1.277788, -0.3821318, 0, 0, 0, 1, 1,
-0.8773626, -0.08072066, -1.842242, 0, 0, 0, 1, 1,
-0.8739301, 0.175486, -2.389076, 0, 0, 0, 1, 1,
-0.8733269, 0.07030404, 0.9268759, 0, 0, 0, 1, 1,
-0.8655399, -0.9049522, -2.895762, 0, 0, 0, 1, 1,
-0.8562014, -1.025462, -2.372022, 1, 1, 1, 1, 1,
-0.8521188, -2.397504, -2.656785, 1, 1, 1, 1, 1,
-0.8498736, -0.1673283, -1.310799, 1, 1, 1, 1, 1,
-0.8455307, -0.4873106, -1.93004, 1, 1, 1, 1, 1,
-0.8413377, -0.4292701, -2.433337, 1, 1, 1, 1, 1,
-0.8401431, -0.9381118, -2.203387, 1, 1, 1, 1, 1,
-0.8376983, 0.4473315, -1.232069, 1, 1, 1, 1, 1,
-0.835542, 0.7359377, -1.162824, 1, 1, 1, 1, 1,
-0.8269967, 0.1742627, 1.146297, 1, 1, 1, 1, 1,
-0.8259772, 0.9199815, -1.562979, 1, 1, 1, 1, 1,
-0.823656, 1.721758, -0.9904552, 1, 1, 1, 1, 1,
-0.8221573, 1.072784, -1.547309, 1, 1, 1, 1, 1,
-0.8186074, 0.9144107, 0.2890386, 1, 1, 1, 1, 1,
-0.8165282, -0.4568819, -1.545718, 1, 1, 1, 1, 1,
-0.8097188, -1.037302, -3.303542, 1, 1, 1, 1, 1,
-0.8060858, 0.2009564, -1.554066, 0, 0, 1, 1, 1,
-0.8058217, 0.3022883, -1.395608, 1, 0, 0, 1, 1,
-0.8016304, -0.1314605, -2.029433, 1, 0, 0, 1, 1,
-0.7922297, -0.2742791, -2.779512, 1, 0, 0, 1, 1,
-0.7881426, 0.8553279, 0.06354587, 1, 0, 0, 1, 1,
-0.7870467, 1.324658, -0.9167724, 1, 0, 0, 1, 1,
-0.7745594, -0.03413444, -0.9639089, 0, 0, 0, 1, 1,
-0.7740781, 1.429517, -1.57096, 0, 0, 0, 1, 1,
-0.7719269, 1.372488, -1.098316, 0, 0, 0, 1, 1,
-0.7676889, -0.3673029, -4.460297, 0, 0, 0, 1, 1,
-0.767255, -0.5142891, -2.76829, 0, 0, 0, 1, 1,
-0.7643211, 0.09821966, -2.015431, 0, 0, 0, 1, 1,
-0.7619367, 0.1747165, -2.452709, 0, 0, 0, 1, 1,
-0.7605018, 0.3341766, -0.1819554, 1, 1, 1, 1, 1,
-0.738165, -0.5580609, -0.9910215, 1, 1, 1, 1, 1,
-0.7360674, 1.410832, -2.363578, 1, 1, 1, 1, 1,
-0.7358142, -0.9356974, -2.365722, 1, 1, 1, 1, 1,
-0.7315834, -1.356471, -3.660347, 1, 1, 1, 1, 1,
-0.7298336, 0.09801338, -2.764497, 1, 1, 1, 1, 1,
-0.7205846, 1.082841, -0.9602756, 1, 1, 1, 1, 1,
-0.7196571, -0.3695307, -2.145466, 1, 1, 1, 1, 1,
-0.7196552, -0.7041452, -2.686329, 1, 1, 1, 1, 1,
-0.7195891, 1.254407, -1.18231, 1, 1, 1, 1, 1,
-0.717181, 0.173407, -1.212655, 1, 1, 1, 1, 1,
-0.7162624, 0.6019903, -0.7553759, 1, 1, 1, 1, 1,
-0.7142665, 0.6853364, -0.3005369, 1, 1, 1, 1, 1,
-0.7110299, -0.5222265, -3.479077, 1, 1, 1, 1, 1,
-0.7099444, 0.6414052, -0.891081, 1, 1, 1, 1, 1,
-0.7075482, 1.660014, -0.8046038, 0, 0, 1, 1, 1,
-0.7048798, 0.7447261, -2.648985, 1, 0, 0, 1, 1,
-0.7034057, -0.8072901, -2.085625, 1, 0, 0, 1, 1,
-0.7015054, 2.106362, 0.03711251, 1, 0, 0, 1, 1,
-0.6989162, -2.473235, -2.029582, 1, 0, 0, 1, 1,
-0.6987419, 0.6038706, -0.4480907, 1, 0, 0, 1, 1,
-0.6962945, -0.583163, -1.953139, 0, 0, 0, 1, 1,
-0.6955642, 0.1296378, -2.103783, 0, 0, 0, 1, 1,
-0.6926908, 0.8991236, -0.6723557, 0, 0, 0, 1, 1,
-0.6918, 1.145354, -0.1479466, 0, 0, 0, 1, 1,
-0.6895648, 0.5377637, -1.397883, 0, 0, 0, 1, 1,
-0.6872616, 1.785429, 0.3132437, 0, 0, 0, 1, 1,
-0.6778617, 0.6807731, -0.7770697, 0, 0, 0, 1, 1,
-0.6722406, -0.5015329, -2.194396, 1, 1, 1, 1, 1,
-0.6653709, -0.07826602, -1.613444, 1, 1, 1, 1, 1,
-0.6610866, 0.1242993, -1.547752, 1, 1, 1, 1, 1,
-0.6569611, 1.074971, 0.2097802, 1, 1, 1, 1, 1,
-0.652445, -1.600474, -2.729909, 1, 1, 1, 1, 1,
-0.6508311, -0.2338977, -3.688756, 1, 1, 1, 1, 1,
-0.6488039, -0.5563565, -3.153489, 1, 1, 1, 1, 1,
-0.6472096, 1.329351, -0.9647601, 1, 1, 1, 1, 1,
-0.6457164, 0.7810883, -0.1595103, 1, 1, 1, 1, 1,
-0.6442157, -2.060411, -3.313528, 1, 1, 1, 1, 1,
-0.642538, 0.245231, -0.4651549, 1, 1, 1, 1, 1,
-0.6420757, -1.037826, 0.3756968, 1, 1, 1, 1, 1,
-0.6419939, -0.3925289, -1.213655, 1, 1, 1, 1, 1,
-0.6404969, -0.9863682, -1.806038, 1, 1, 1, 1, 1,
-0.6391152, -0.05642559, -3.000279, 1, 1, 1, 1, 1,
-0.6272945, -1.157432, -1.556773, 0, 0, 1, 1, 1,
-0.6249349, -0.4858345, -3.460264, 1, 0, 0, 1, 1,
-0.6237413, 1.849216, -1.461816, 1, 0, 0, 1, 1,
-0.6203096, -0.8811476, -3.125447, 1, 0, 0, 1, 1,
-0.6180009, -0.143196, -2.531923, 1, 0, 0, 1, 1,
-0.615783, 0.1421365, 0.4662763, 1, 0, 0, 1, 1,
-0.5981516, -1.843991, -4.142451, 0, 0, 0, 1, 1,
-0.5976481, 1.718656, 0.07734307, 0, 0, 0, 1, 1,
-0.5973942, 0.6233776, -0.5629237, 0, 0, 0, 1, 1,
-0.5920332, 1.245607, -1.534196, 0, 0, 0, 1, 1,
-0.577788, 0.8302912, -0.7330352, 0, 0, 0, 1, 1,
-0.5689981, -1.513049, -1.576212, 0, 0, 0, 1, 1,
-0.5666208, -0.2480737, -1.111832, 0, 0, 0, 1, 1,
-0.5650664, -0.164495, 0.1557233, 1, 1, 1, 1, 1,
-0.5641984, -0.0484832, 0.07272623, 1, 1, 1, 1, 1,
-0.5627998, -0.507222, -3.078217, 1, 1, 1, 1, 1,
-0.5567029, -2.194197, -2.858253, 1, 1, 1, 1, 1,
-0.5540466, -0.8543616, -2.582228, 1, 1, 1, 1, 1,
-0.549684, -0.3959082, -2.144751, 1, 1, 1, 1, 1,
-0.545264, 0.8844705, 0.6976233, 1, 1, 1, 1, 1,
-0.545086, -0.6045189, -4.792124, 1, 1, 1, 1, 1,
-0.5403653, -0.3521073, -4.194079, 1, 1, 1, 1, 1,
-0.5398305, 0.3232861, 0.975573, 1, 1, 1, 1, 1,
-0.5397682, 1.019911, -0.6387398, 1, 1, 1, 1, 1,
-0.5338397, 0.2255539, -0.8344141, 1, 1, 1, 1, 1,
-0.5319378, -0.962587, -2.908685, 1, 1, 1, 1, 1,
-0.5290457, -0.01838517, -2.68728, 1, 1, 1, 1, 1,
-0.5288448, -0.7576091, -2.795637, 1, 1, 1, 1, 1,
-0.5229676, -0.1697703, -0.7861229, 0, 0, 1, 1, 1,
-0.5188887, 0.4966557, -1.119822, 1, 0, 0, 1, 1,
-0.5182269, -0.2621585, -4.386896, 1, 0, 0, 1, 1,
-0.51798, 0.2129234, 0.4713076, 1, 0, 0, 1, 1,
-0.5177379, -1.010822, -4.280272, 1, 0, 0, 1, 1,
-0.5145312, -0.1551339, -3.29086, 1, 0, 0, 1, 1,
-0.5135178, -0.4718689, -0.5040895, 0, 0, 0, 1, 1,
-0.5122045, -1.268748, -4.696503, 0, 0, 0, 1, 1,
-0.5109612, -1.003222, -4.017594, 0, 0, 0, 1, 1,
-0.5087107, 0.4185747, -0.714318, 0, 0, 0, 1, 1,
-0.5047314, -0.1155119, -2.955206, 0, 0, 0, 1, 1,
-0.5034794, 0.3171783, -1.643627, 0, 0, 0, 1, 1,
-0.4973737, 1.801542, 0.7530096, 0, 0, 0, 1, 1,
-0.4955446, 0.6657777, -2.946024, 1, 1, 1, 1, 1,
-0.4919344, -0.5445177, -2.666799, 1, 1, 1, 1, 1,
-0.486917, 0.649363, -2.423893, 1, 1, 1, 1, 1,
-0.4846282, -1.003786, -3.444524, 1, 1, 1, 1, 1,
-0.4835013, -0.7596572, -3.715646, 1, 1, 1, 1, 1,
-0.4805238, 0.2079889, -0.3151855, 1, 1, 1, 1, 1,
-0.4772967, 0.348522, -1.198477, 1, 1, 1, 1, 1,
-0.4761406, 0.7874817, -1.009115, 1, 1, 1, 1, 1,
-0.4704609, 0.04212237, -2.197121, 1, 1, 1, 1, 1,
-0.4669333, 1.174384, -1.038576, 1, 1, 1, 1, 1,
-0.4660737, 0.6977876, -2.710369, 1, 1, 1, 1, 1,
-0.4634312, 0.7684706, -0.6699536, 1, 1, 1, 1, 1,
-0.4608344, 0.1407339, -3.119251, 1, 1, 1, 1, 1,
-0.4604461, 1.146261, 0.6069511, 1, 1, 1, 1, 1,
-0.454557, 0.6666003, -0.3610264, 1, 1, 1, 1, 1,
-0.4535634, 0.3063357, -0.8704805, 0, 0, 1, 1, 1,
-0.4450533, -1.116931, -2.904059, 1, 0, 0, 1, 1,
-0.4383407, -0.7265716, -2.092299, 1, 0, 0, 1, 1,
-0.4383195, 0.1817993, -0.6671188, 1, 0, 0, 1, 1,
-0.4350367, 0.7951905, -1.149074, 1, 0, 0, 1, 1,
-0.4321823, -1.783273, -3.172126, 1, 0, 0, 1, 1,
-0.4297079, -0.04891354, -2.251899, 0, 0, 0, 1, 1,
-0.4262648, 0.9123913, -0.8084837, 0, 0, 0, 1, 1,
-0.4237722, -0.4762514, -3.242215, 0, 0, 0, 1, 1,
-0.4186502, 0.6511829, -0.1066778, 0, 0, 0, 1, 1,
-0.416755, -0.0388808, -1.835704, 0, 0, 0, 1, 1,
-0.4144176, -1.071262, -3.71115, 0, 0, 0, 1, 1,
-0.413805, -1.76082, -3.067011, 0, 0, 0, 1, 1,
-0.4059779, -0.3181112, -3.458776, 1, 1, 1, 1, 1,
-0.4050088, 0.115657, -1.306655, 1, 1, 1, 1, 1,
-0.4040987, -1.996805, -1.174677, 1, 1, 1, 1, 1,
-0.3988738, 0.1662089, 0.2504455, 1, 1, 1, 1, 1,
-0.3967145, -0.01610223, -2.3109, 1, 1, 1, 1, 1,
-0.3948273, -1.554175, -2.830804, 1, 1, 1, 1, 1,
-0.3941976, 0.8878064, -1.274156, 1, 1, 1, 1, 1,
-0.3852522, 1.130315, 0.9479249, 1, 1, 1, 1, 1,
-0.3807204, -0.8316471, -3.01418, 1, 1, 1, 1, 1,
-0.3795703, -0.3743689, -2.553011, 1, 1, 1, 1, 1,
-0.3788241, 0.1725401, -0.6934676, 1, 1, 1, 1, 1,
-0.3773529, 0.1141122, -1.838723, 1, 1, 1, 1, 1,
-0.37556, 0.3395584, 0.3263281, 1, 1, 1, 1, 1,
-0.3726529, 0.2841094, -0.731101, 1, 1, 1, 1, 1,
-0.3581493, 0.6269797, -0.8856508, 1, 1, 1, 1, 1,
-0.3569918, 0.8177731, -2.352231, 0, 0, 1, 1, 1,
-0.349636, -0.425874, -1.640808, 1, 0, 0, 1, 1,
-0.34925, 0.6014431, 1.303702, 1, 0, 0, 1, 1,
-0.3451688, -0.8249363, -3.935754, 1, 0, 0, 1, 1,
-0.3436006, -0.5427555, -2.758043, 1, 0, 0, 1, 1,
-0.3412432, -0.7938887, -1.10484, 1, 0, 0, 1, 1,
-0.3390015, 0.6673462, -2.241322, 0, 0, 0, 1, 1,
-0.3380819, 0.0008187486, -1.185589, 0, 0, 0, 1, 1,
-0.3337898, -1.471803, -1.870923, 0, 0, 0, 1, 1,
-0.3333145, -0.7075948, -1.928125, 0, 0, 0, 1, 1,
-0.3274783, -0.1451277, -1.235341, 0, 0, 0, 1, 1,
-0.3243549, -1.571676, -4.56053, 0, 0, 0, 1, 1,
-0.3223158, 0.05401724, -1.117291, 0, 0, 0, 1, 1,
-0.3170438, 0.5129831, -0.1948772, 1, 1, 1, 1, 1,
-0.3168557, 0.3314413, -0.4052817, 1, 1, 1, 1, 1,
-0.3150155, -0.01602896, -1.722781, 1, 1, 1, 1, 1,
-0.3131392, 1.161911, 0.5776065, 1, 1, 1, 1, 1,
-0.3121092, 0.06930281, 0.08336563, 1, 1, 1, 1, 1,
-0.3089167, -1.594118, -2.155723, 1, 1, 1, 1, 1,
-0.3081473, 0.1298112, -0.3639291, 1, 1, 1, 1, 1,
-0.3078615, -0.6416455, -2.541093, 1, 1, 1, 1, 1,
-0.3025145, -0.01435367, -0.135113, 1, 1, 1, 1, 1,
-0.3016412, -2.252503, -2.680534, 1, 1, 1, 1, 1,
-0.2988572, 1.182129, 0.502073, 1, 1, 1, 1, 1,
-0.2984333, -2.881716, -3.423379, 1, 1, 1, 1, 1,
-0.2981326, 0.3566477, -1.526681, 1, 1, 1, 1, 1,
-0.2950904, 0.2619632, -1.096053, 1, 1, 1, 1, 1,
-0.2942962, 0.9578075, 0.3180835, 1, 1, 1, 1, 1,
-0.2910733, 0.4529121, -3.232299, 0, 0, 1, 1, 1,
-0.291038, 0.1057329, 1.03586, 1, 0, 0, 1, 1,
-0.2884069, -0.297805, -3.072564, 1, 0, 0, 1, 1,
-0.2836736, -0.121132, -3.599764, 1, 0, 0, 1, 1,
-0.2764052, -2.269001, -2.773714, 1, 0, 0, 1, 1,
-0.2751174, -0.3123833, -1.441579, 1, 0, 0, 1, 1,
-0.2749992, 0.3335624, -0.8384909, 0, 0, 0, 1, 1,
-0.2747623, 0.142018, 0.8459095, 0, 0, 0, 1, 1,
-0.2745992, -0.342461, -2.353138, 0, 0, 0, 1, 1,
-0.2718831, 1.554326, -0.7817628, 0, 0, 0, 1, 1,
-0.2700893, -1.093747, -4.168672, 0, 0, 0, 1, 1,
-0.2666439, -0.5339547, -3.074459, 0, 0, 0, 1, 1,
-0.2605288, 0.8593441, -0.2898706, 0, 0, 0, 1, 1,
-0.2553505, -0.995248, -2.95029, 1, 1, 1, 1, 1,
-0.2548577, -0.1099818, -2.002692, 1, 1, 1, 1, 1,
-0.2531954, -0.3483427, -1.886829, 1, 1, 1, 1, 1,
-0.2520712, -1.190241, -3.175481, 1, 1, 1, 1, 1,
-0.2504396, -0.8448683, -1.682196, 1, 1, 1, 1, 1,
-0.246372, 0.4895065, -1.386812, 1, 1, 1, 1, 1,
-0.2405063, -0.4733295, -0.1941678, 1, 1, 1, 1, 1,
-0.2356523, -0.6077282, -3.257903, 1, 1, 1, 1, 1,
-0.2349526, -0.06850705, -3.35453, 1, 1, 1, 1, 1,
-0.2340495, 0.8238543, -1.451916, 1, 1, 1, 1, 1,
-0.2314389, -0.30969, -1.500747, 1, 1, 1, 1, 1,
-0.2248818, -0.3582057, -2.967918, 1, 1, 1, 1, 1,
-0.2207581, -1.043934, -2.737141, 1, 1, 1, 1, 1,
-0.2206898, -0.0511114, -1.916745, 1, 1, 1, 1, 1,
-0.2180073, -0.6906923, -4.319539, 1, 1, 1, 1, 1,
-0.2179988, 0.5177842, -0.6980645, 0, 0, 1, 1, 1,
-0.2158834, -0.7452436, -2.92261, 1, 0, 0, 1, 1,
-0.2157374, 0.03840623, -2.092962, 1, 0, 0, 1, 1,
-0.2139785, -0.9921678, -2.150766, 1, 0, 0, 1, 1,
-0.2135104, -0.007307493, -2.136711, 1, 0, 0, 1, 1,
-0.2014666, 0.1209643, -1.913339, 1, 0, 0, 1, 1,
-0.2013693, 1.110092, 1.74808, 0, 0, 0, 1, 1,
-0.1991576, -0.5415189, -3.293214, 0, 0, 0, 1, 1,
-0.1986848, -0.7356787, -3.896067, 0, 0, 0, 1, 1,
-0.1980616, -0.6864311, -3.060487, 0, 0, 0, 1, 1,
-0.1962266, -1.063923, -4.564074, 0, 0, 0, 1, 1,
-0.1925603, -0.009885186, -0.9249193, 0, 0, 0, 1, 1,
-0.1914782, -0.2136548, -2.286558, 0, 0, 0, 1, 1,
-0.1912297, 0.7584331, 0.3521558, 1, 1, 1, 1, 1,
-0.1910529, 0.09764603, -0.8333718, 1, 1, 1, 1, 1,
-0.1798799, -0.7076393, -1.207033, 1, 1, 1, 1, 1,
-0.1781123, -1.050579, -3.972161, 1, 1, 1, 1, 1,
-0.1771551, 0.2238176, -0.8702039, 1, 1, 1, 1, 1,
-0.1770282, 0.8394768, -0.1725362, 1, 1, 1, 1, 1,
-0.1765903, 1.184789, -0.1182267, 1, 1, 1, 1, 1,
-0.1760148, -1.753047, -3.99025, 1, 1, 1, 1, 1,
-0.1742037, 1.153235, 1.378805, 1, 1, 1, 1, 1,
-0.169901, -0.2841923, -1.999632, 1, 1, 1, 1, 1,
-0.1656372, 0.6643043, 0.4702249, 1, 1, 1, 1, 1,
-0.1646755, 0.7570046, 0.4728975, 1, 1, 1, 1, 1,
-0.1613904, -0.4312767, -2.874701, 1, 1, 1, 1, 1,
-0.1596344, -0.7305983, -3.745597, 1, 1, 1, 1, 1,
-0.1562565, 0.1897195, -0.6794161, 1, 1, 1, 1, 1,
-0.1550371, 1.81979, 0.0535137, 0, 0, 1, 1, 1,
-0.1483333, 0.2050754, -0.753707, 1, 0, 0, 1, 1,
-0.1482773, -0.08452778, -3.069488, 1, 0, 0, 1, 1,
-0.1474534, 1.113202, 0.2707414, 1, 0, 0, 1, 1,
-0.1458271, 0.1685704, -0.6345804, 1, 0, 0, 1, 1,
-0.1432562, -1.000555, -2.728342, 1, 0, 0, 1, 1,
-0.1424922, -0.2632982, -2.452324, 0, 0, 0, 1, 1,
-0.1401142, -1.481777, -2.421883, 0, 0, 0, 1, 1,
-0.1382232, 0.8339633, -0.9922149, 0, 0, 0, 1, 1,
-0.1331818, -0.4743163, -2.363375, 0, 0, 0, 1, 1,
-0.1321155, 0.252205, -1.268117, 0, 0, 0, 1, 1,
-0.1315002, 0.8846257, 0.03555506, 0, 0, 0, 1, 1,
-0.1311188, 1.222989, 1.134133, 0, 0, 0, 1, 1,
-0.1241423, 0.5213139, -0.9277949, 1, 1, 1, 1, 1,
-0.121476, 1.092357, -1.475268, 1, 1, 1, 1, 1,
-0.1182639, 1.009857, 0.1635427, 1, 1, 1, 1, 1,
-0.1067164, 0.1630767, -1.139835, 1, 1, 1, 1, 1,
-0.1062289, 0.675118, 0.5523297, 1, 1, 1, 1, 1,
-0.103371, -0.9419745, -1.919353, 1, 1, 1, 1, 1,
-0.102633, 0.7715031, -0.0064827, 1, 1, 1, 1, 1,
-0.1010758, 0.7500568, 0.7601477, 1, 1, 1, 1, 1,
-0.1000736, -0.05844667, -3.901149, 1, 1, 1, 1, 1,
-0.09962502, -0.3318805, -3.515841, 1, 1, 1, 1, 1,
-0.09858395, 1.160642, -0.02834153, 1, 1, 1, 1, 1,
-0.09791722, 0.4099204, 0.1694144, 1, 1, 1, 1, 1,
-0.09648398, -0.7454261, -2.096547, 1, 1, 1, 1, 1,
-0.09613457, 0.2274164, 0.3898853, 1, 1, 1, 1, 1,
-0.09412376, 1.56301, -0.2204792, 1, 1, 1, 1, 1,
-0.09346467, -0.163369, -2.840382, 0, 0, 1, 1, 1,
-0.09087326, -0.4827347, -1.984084, 1, 0, 0, 1, 1,
-0.08998474, -1.375002, -2.445993, 1, 0, 0, 1, 1,
-0.08823898, -0.1506469, -2.418845, 1, 0, 0, 1, 1,
-0.08349698, 0.4806691, -0.148449, 1, 0, 0, 1, 1,
-0.08247505, -0.6968708, -2.070396, 1, 0, 0, 1, 1,
-0.08166017, 1.324196, 1.823318, 0, 0, 0, 1, 1,
-0.08025108, 0.3974203, 0.9378222, 0, 0, 0, 1, 1,
-0.07975994, -2.204961, -2.377765, 0, 0, 0, 1, 1,
-0.07962164, 0.7385891, -0.3337555, 0, 0, 0, 1, 1,
-0.07941696, 1.963926, -1.603047, 0, 0, 0, 1, 1,
-0.07812899, -0.2632995, -2.866116, 0, 0, 0, 1, 1,
-0.07683095, -0.329569, -3.768843, 0, 0, 0, 1, 1,
-0.07556646, -0.7884917, -2.068231, 1, 1, 1, 1, 1,
-0.07502322, 0.1499032, -0.7364191, 1, 1, 1, 1, 1,
-0.07416084, 0.2987759, -1.50459, 1, 1, 1, 1, 1,
-0.07225114, -0.3518386, -1.947574, 1, 1, 1, 1, 1,
-0.07029396, -1.468688, -2.386097, 1, 1, 1, 1, 1,
-0.07002553, -0.8463866, -3.015172, 1, 1, 1, 1, 1,
-0.06899711, -1.125827, -5.182246, 1, 1, 1, 1, 1,
-0.06543474, 1.395855, -1.350983, 1, 1, 1, 1, 1,
-0.06509547, -0.2283956, -1.948266, 1, 1, 1, 1, 1,
-0.06485464, -0.1258937, -2.716096, 1, 1, 1, 1, 1,
-0.06385705, 0.2682269, 1.396176, 1, 1, 1, 1, 1,
-0.0633267, 0.6210546, -0.8501311, 1, 1, 1, 1, 1,
-0.0589498, 0.8324807, 1.695446, 1, 1, 1, 1, 1,
-0.0566417, -0.1963137, -2.671151, 1, 1, 1, 1, 1,
-0.05619758, -0.4932218, -2.922237, 1, 1, 1, 1, 1,
-0.04928215, 0.8119936, -0.5169404, 0, 0, 1, 1, 1,
-0.04871789, -1.07446, -3.476114, 1, 0, 0, 1, 1,
-0.04723663, -0.1498924, -3.426762, 1, 0, 0, 1, 1,
-0.04328159, -0.0980253, -2.336216, 1, 0, 0, 1, 1,
-0.04033997, 0.05606399, -0.2007227, 1, 0, 0, 1, 1,
-0.03788301, -0.2856033, -3.33914, 1, 0, 0, 1, 1,
-0.03169107, 1.356772, -1.678885, 0, 0, 0, 1, 1,
-0.02773982, -2.345973, -3.658422, 0, 0, 0, 1, 1,
-0.02767371, 0.4785332, 0.7514737, 0, 0, 0, 1, 1,
-0.02739206, 0.9310648, -1.089217, 0, 0, 0, 1, 1,
-0.02566945, -0.2963642, -3.88098, 0, 0, 0, 1, 1,
-0.02232059, 1.472017, 0.718363, 0, 0, 0, 1, 1,
-0.02123697, -0.054924, -1.637658, 0, 0, 0, 1, 1,
-0.01740602, 0.07273217, -0.845463, 1, 1, 1, 1, 1,
-0.01619275, -0.234353, -2.623025, 1, 1, 1, 1, 1,
-0.01437737, 1.188069, -0.1426761, 1, 1, 1, 1, 1,
-0.0127777, 0.8814754, 0.3647367, 1, 1, 1, 1, 1,
-0.01189172, -0.8202944, -3.688892, 1, 1, 1, 1, 1,
-0.01002358, -0.2232039, -4.066319, 1, 1, 1, 1, 1,
-0.006845669, 0.1092866, 1.326057, 1, 1, 1, 1, 1,
-0.002685056, -0.5756249, -5.307193, 1, 1, 1, 1, 1,
0.0003750202, -2.317708, 2.541834, 1, 1, 1, 1, 1,
0.004986019, 1.353911, -0.3285226, 1, 1, 1, 1, 1,
0.006728452, -0.6493186, 3.885893, 1, 1, 1, 1, 1,
0.008972535, 0.08761891, 0.4565683, 1, 1, 1, 1, 1,
0.01598918, 2.556019, -0.6496211, 1, 1, 1, 1, 1,
0.01912438, 1.171212, 1.246628, 1, 1, 1, 1, 1,
0.02058577, -0.760449, 2.994924, 1, 1, 1, 1, 1,
0.02110916, 0.5584199, 1.131832, 0, 0, 1, 1, 1,
0.02292975, 0.1768681, 1.795484, 1, 0, 0, 1, 1,
0.02695751, -0.4716958, 3.341288, 1, 0, 0, 1, 1,
0.02961556, 0.1004052, -0.5486574, 1, 0, 0, 1, 1,
0.03196221, -1.152064, 1.53599, 1, 0, 0, 1, 1,
0.03217928, -1.215821, 3.862781, 1, 0, 0, 1, 1,
0.03852276, 0.7262849, 0.09780053, 0, 0, 0, 1, 1,
0.03870039, 0.729899, 0.2075428, 0, 0, 0, 1, 1,
0.04023577, 2.012488, 0.2453096, 0, 0, 0, 1, 1,
0.04362394, -0.2375191, 2.803384, 0, 0, 0, 1, 1,
0.04585094, -0.7205976, 3.694312, 0, 0, 0, 1, 1,
0.05715889, -0.6146187, 2.833704, 0, 0, 0, 1, 1,
0.05811362, 0.5886816, -1.479091, 0, 0, 0, 1, 1,
0.06512736, -0.09646834, 2.784122, 1, 1, 1, 1, 1,
0.06741451, -0.1565663, 2.958633, 1, 1, 1, 1, 1,
0.08339948, 2.286158, 1.522758, 1, 1, 1, 1, 1,
0.0845874, -1.03913, 3.410942, 1, 1, 1, 1, 1,
0.08504136, 0.1470622, -1.527935, 1, 1, 1, 1, 1,
0.0871067, 0.1802051, 2.106442, 1, 1, 1, 1, 1,
0.08946212, -0.3668095, 2.318186, 1, 1, 1, 1, 1,
0.09035163, 0.8194085, 0.9314301, 1, 1, 1, 1, 1,
0.09718552, -0.7007135, 2.062282, 1, 1, 1, 1, 1,
0.09785513, -0.1388205, 2.685198, 1, 1, 1, 1, 1,
0.09816764, -1.184771, 4.169265, 1, 1, 1, 1, 1,
0.09869464, 1.276152, 0.5019463, 1, 1, 1, 1, 1,
0.1020066, -0.7634834, 1.028892, 1, 1, 1, 1, 1,
0.1034195, -1.609106, 2.462371, 1, 1, 1, 1, 1,
0.1075958, -0.8005649, 2.70903, 1, 1, 1, 1, 1,
0.1103418, 0.5272113, 2.671342, 0, 0, 1, 1, 1,
0.1148665, 0.8336717, 1.129327, 1, 0, 0, 1, 1,
0.1176735, -0.3610854, 3.332915, 1, 0, 0, 1, 1,
0.124812, -0.2138142, 1.466538, 1, 0, 0, 1, 1,
0.1251648, -0.6878247, 4.954834, 1, 0, 0, 1, 1,
0.1255929, 1.144927, 2.058497, 1, 0, 0, 1, 1,
0.1265149, -0.6228204, 3.403996, 0, 0, 0, 1, 1,
0.1334641, -0.3976219, 4.636366, 0, 0, 0, 1, 1,
0.1373393, 0.1287749, 0.948942, 0, 0, 0, 1, 1,
0.1431318, -1.231748, 4.754848, 0, 0, 0, 1, 1,
0.1438414, -0.875179, 3.197469, 0, 0, 0, 1, 1,
0.1443434, 0.1366135, 0.07589006, 0, 0, 0, 1, 1,
0.1505795, 0.4255171, 0.3291034, 0, 0, 0, 1, 1,
0.1549596, 0.9586985, -0.4341305, 1, 1, 1, 1, 1,
0.1550508, -1.686041, 3.379254, 1, 1, 1, 1, 1,
0.1561808, 1.326662, 0.9650987, 1, 1, 1, 1, 1,
0.1577598, -0.5370548, 3.347849, 1, 1, 1, 1, 1,
0.1631141, 0.5548692, -0.7028586, 1, 1, 1, 1, 1,
0.1633424, 1.372677, 1.330749, 1, 1, 1, 1, 1,
0.1663675, 0.7043369, 0.0745196, 1, 1, 1, 1, 1,
0.1711057, 0.4065215, 1.546315, 1, 1, 1, 1, 1,
0.1728308, 0.4471619, 0.7700059, 1, 1, 1, 1, 1,
0.1729836, -0.324414, 2.136734, 1, 1, 1, 1, 1,
0.1738676, 0.2370657, 1.152998, 1, 1, 1, 1, 1,
0.1783878, -0.2291937, 3.512757, 1, 1, 1, 1, 1,
0.1804345, 0.8625666, 1.663571, 1, 1, 1, 1, 1,
0.1821173, -0.7312645, 2.311844, 1, 1, 1, 1, 1,
0.1830412, -0.474096, 3.54329, 1, 1, 1, 1, 1,
0.1830859, 0.840699, 1.680779, 0, 0, 1, 1, 1,
0.1833171, 0.5450393, 1.873322, 1, 0, 0, 1, 1,
0.1848978, -0.185679, 3.95923, 1, 0, 0, 1, 1,
0.1852358, -0.08564854, 2.909482, 1, 0, 0, 1, 1,
0.1855324, 0.4596581, 0.6878904, 1, 0, 0, 1, 1,
0.2000874, -1.200436, 3.346206, 1, 0, 0, 1, 1,
0.2017806, 0.4083452, 1.543708, 0, 0, 0, 1, 1,
0.2025987, -0.7088054, 1.11776, 0, 0, 0, 1, 1,
0.2030626, -0.7676006, 3.49704, 0, 0, 0, 1, 1,
0.2140465, 1.241724, -0.4626265, 0, 0, 0, 1, 1,
0.2144743, -1.746941, 3.625379, 0, 0, 0, 1, 1,
0.2172489, 0.08046341, 0.3102185, 0, 0, 0, 1, 1,
0.2184637, 1.863028, -1.294154, 0, 0, 0, 1, 1,
0.2198022, -0.05937165, 1.906041, 1, 1, 1, 1, 1,
0.2255799, -0.3724592, 4.394777, 1, 1, 1, 1, 1,
0.2286657, -0.6572478, 3.325606, 1, 1, 1, 1, 1,
0.2315778, 0.5280163, 0.02929656, 1, 1, 1, 1, 1,
0.236888, 1.271823, -0.01458474, 1, 1, 1, 1, 1,
0.2392777, 0.7433364, 0.2009853, 1, 1, 1, 1, 1,
0.2442306, 1.52505, -0.004826075, 1, 1, 1, 1, 1,
0.2449407, -0.5366154, 1.543547, 1, 1, 1, 1, 1,
0.247692, 0.2613143, -0.03041226, 1, 1, 1, 1, 1,
0.2476997, 0.9975806, -0.3551929, 1, 1, 1, 1, 1,
0.2512368, -0.634637, 1.979908, 1, 1, 1, 1, 1,
0.2516738, 1.376887, -1.298223, 1, 1, 1, 1, 1,
0.2592726, -1.793402, 1.310091, 1, 1, 1, 1, 1,
0.2673063, -0.2165148, 2.210099, 1, 1, 1, 1, 1,
0.2710312, 0.8380026, 1.555704, 1, 1, 1, 1, 1,
0.271651, 0.07677097, 1.662798, 0, 0, 1, 1, 1,
0.2747153, -1.057158, 5.721681, 1, 0, 0, 1, 1,
0.2762222, 1.048361, 0.2778446, 1, 0, 0, 1, 1,
0.2790467, 1.151111, -0.07823736, 1, 0, 0, 1, 1,
0.2886294, 0.2600336, 0.9542022, 1, 0, 0, 1, 1,
0.2899726, -0.624817, 2.962838, 1, 0, 0, 1, 1,
0.290214, 0.7326402, 0.2608435, 0, 0, 0, 1, 1,
0.2905041, 0.05453693, 0.9845908, 0, 0, 0, 1, 1,
0.2925114, -0.4559172, 2.299481, 0, 0, 0, 1, 1,
0.2938868, -0.8863876, 3.481743, 0, 0, 0, 1, 1,
0.2950698, -0.7733926, 2.716507, 0, 0, 0, 1, 1,
0.2974309, 1.623439, 0.7535678, 0, 0, 0, 1, 1,
0.2977136, 0.7486857, -0.2466121, 0, 0, 0, 1, 1,
0.2988667, -1.078423, 3.55962, 1, 1, 1, 1, 1,
0.3017499, 0.5346017, 0.4293556, 1, 1, 1, 1, 1,
0.305342, -1.003201, 3.62763, 1, 1, 1, 1, 1,
0.3072903, 0.2067602, -0.4525365, 1, 1, 1, 1, 1,
0.3105289, 1.235246, -0.6240602, 1, 1, 1, 1, 1,
0.3131458, 0.1506939, 1.411076, 1, 1, 1, 1, 1,
0.3172463, 0.08344611, 2.62798, 1, 1, 1, 1, 1,
0.3182371, 0.9891068, -0.4171959, 1, 1, 1, 1, 1,
0.3233026, 0.7685591, -0.597564, 1, 1, 1, 1, 1,
0.3269013, 0.324792, 1.567582, 1, 1, 1, 1, 1,
0.3270988, 0.6006688, 2.5188, 1, 1, 1, 1, 1,
0.3283262, 0.1592606, 0.9872448, 1, 1, 1, 1, 1,
0.3289185, -0.9091846, 3.148942, 1, 1, 1, 1, 1,
0.3300778, 0.222458, 1.962378, 1, 1, 1, 1, 1,
0.33691, 1.250979, -0.2334867, 1, 1, 1, 1, 1,
0.3408442, 0.05332805, 2.425692, 0, 0, 1, 1, 1,
0.3429557, 1.043082, -0.7249343, 1, 0, 0, 1, 1,
0.3443705, 0.4671788, 0.6031199, 1, 0, 0, 1, 1,
0.3452639, 1.840569, 2.891569, 1, 0, 0, 1, 1,
0.3465246, 0.3121427, -0.2674853, 1, 0, 0, 1, 1,
0.3513329, 0.9596813, 0.5113502, 1, 0, 0, 1, 1,
0.3515068, 0.2197403, -0.1233079, 0, 0, 0, 1, 1,
0.3605548, -0.2500299, 2.240471, 0, 0, 0, 1, 1,
0.362955, -0.5093493, 0.5725018, 0, 0, 0, 1, 1,
0.3630205, -1.807903, 3.146405, 0, 0, 0, 1, 1,
0.3674792, 0.5514637, -1.847884, 0, 0, 0, 1, 1,
0.3690641, -0.1516964, 1.739495, 0, 0, 0, 1, 1,
0.3763628, -0.09339312, 2.509115, 0, 0, 0, 1, 1,
0.3770757, 0.06907285, 1.131404, 1, 1, 1, 1, 1,
0.3818593, 0.001612641, 1.553621, 1, 1, 1, 1, 1,
0.387171, 1.294942, -0.2776966, 1, 1, 1, 1, 1,
0.3885228, 0.5873241, 0.7617694, 1, 1, 1, 1, 1,
0.3886597, 1.168657, -0.7760066, 1, 1, 1, 1, 1,
0.3895247, 0.992725, 0.1823524, 1, 1, 1, 1, 1,
0.3912537, 0.04702442, 1.240516, 1, 1, 1, 1, 1,
0.3915686, -0.4681242, 2.295668, 1, 1, 1, 1, 1,
0.3940042, -1.133856, 4.119184, 1, 1, 1, 1, 1,
0.3961868, 0.4109095, 1.090201, 1, 1, 1, 1, 1,
0.3971311, -0.1009042, 1.785243, 1, 1, 1, 1, 1,
0.4007388, -0.587377, 1.629211, 1, 1, 1, 1, 1,
0.4019829, 0.655501, -0.1342392, 1, 1, 1, 1, 1,
0.4042286, 0.4211264, -0.3410378, 1, 1, 1, 1, 1,
0.4071268, 0.2154821, 2.254941, 1, 1, 1, 1, 1,
0.4079011, -0.2328302, 3.619166, 0, 0, 1, 1, 1,
0.409665, -0.793902, 0.7633005, 1, 0, 0, 1, 1,
0.4103796, -0.3095942, 1.844622, 1, 0, 0, 1, 1,
0.4166479, -1.039324, 3.887079, 1, 0, 0, 1, 1,
0.4177696, 0.8256317, 0.2954664, 1, 0, 0, 1, 1,
0.4239482, -0.01382572, 0.9762291, 1, 0, 0, 1, 1,
0.4311627, 1.130751, 1.685664, 0, 0, 0, 1, 1,
0.4352688, 0.296828, 1.00131, 0, 0, 0, 1, 1,
0.4359083, 0.2950107, -0.211579, 0, 0, 0, 1, 1,
0.4377854, -0.3924544, 0.5078009, 0, 0, 0, 1, 1,
0.4402831, -0.7929543, 2.310022, 0, 0, 0, 1, 1,
0.4455912, 0.4379062, 1.011754, 0, 0, 0, 1, 1,
0.4458952, -0.2929259, 3.142495, 0, 0, 0, 1, 1,
0.4468565, 0.7493612, 2.562282, 1, 1, 1, 1, 1,
0.4497582, -1.219115, 3.048011, 1, 1, 1, 1, 1,
0.4528777, 0.1128505, 1.533427, 1, 1, 1, 1, 1,
0.4535441, 0.1589027, -1.356756, 1, 1, 1, 1, 1,
0.4569913, -0.182809, 3.23756, 1, 1, 1, 1, 1,
0.4570521, 0.6468017, 0.6207651, 1, 1, 1, 1, 1,
0.4575279, -0.6144514, 2.049539, 1, 1, 1, 1, 1,
0.4576479, -0.8501797, 1.930868, 1, 1, 1, 1, 1,
0.4580924, -0.1407685, 1.393516, 1, 1, 1, 1, 1,
0.4596605, 1.424626, -0.1047812, 1, 1, 1, 1, 1,
0.4598575, -0.03926117, 1.296208, 1, 1, 1, 1, 1,
0.4616169, -1.341448, 3.372498, 1, 1, 1, 1, 1,
0.4696159, 0.4117128, -1.055001, 1, 1, 1, 1, 1,
0.4702753, 2.377163, 0.226285, 1, 1, 1, 1, 1,
0.4713339, 0.8092167, -0.6871747, 1, 1, 1, 1, 1,
0.4731073, -0.5277135, 3.643178, 0, 0, 1, 1, 1,
0.4761043, 0.05270131, 0.4262282, 1, 0, 0, 1, 1,
0.479097, -0.7308707, 3.479553, 1, 0, 0, 1, 1,
0.4836756, 1.189713, -0.6128793, 1, 0, 0, 1, 1,
0.483801, -0.267302, 1.222366, 1, 0, 0, 1, 1,
0.4841116, 0.2138181, 1.637142, 1, 0, 0, 1, 1,
0.4853967, 1.015397, 1.976482, 0, 0, 0, 1, 1,
0.4860565, 0.8393471, -0.8605609, 0, 0, 0, 1, 1,
0.4924818, -0.8821809, 4.709033, 0, 0, 0, 1, 1,
0.493133, 0.4262865, 0.1256251, 0, 0, 0, 1, 1,
0.4966402, 0.8537785, 0.2585929, 0, 0, 0, 1, 1,
0.4994797, -1.092501, 0.4657939, 0, 0, 0, 1, 1,
0.4999866, 1.046111, 0.3741708, 0, 0, 0, 1, 1,
0.5047171, 1.114972, -0.2986412, 1, 1, 1, 1, 1,
0.5053837, -0.05722912, 1.122324, 1, 1, 1, 1, 1,
0.5056781, 0.3325579, 2.046, 1, 1, 1, 1, 1,
0.5061224, 0.3573136, 2.181951, 1, 1, 1, 1, 1,
0.507535, 0.2022779, 2.2087, 1, 1, 1, 1, 1,
0.5115646, 0.1919011, 0.8006797, 1, 1, 1, 1, 1,
0.512633, -0.8670027, 1.779983, 1, 1, 1, 1, 1,
0.5160775, 1.149261, -0.3201682, 1, 1, 1, 1, 1,
0.5219771, 1.102231, -0.7798207, 1, 1, 1, 1, 1,
0.5231995, -1.940919, 3.503996, 1, 1, 1, 1, 1,
0.5264136, -0.6737259, 1.875834, 1, 1, 1, 1, 1,
0.5304551, -0.8465636, 2.019482, 1, 1, 1, 1, 1,
0.5305194, 2.587502, 1.467639, 1, 1, 1, 1, 1,
0.5411833, -0.2558494, 2.464632, 1, 1, 1, 1, 1,
0.5412337, 0.5125878, 0.3049646, 1, 1, 1, 1, 1,
0.5421395, 0.7738884, -0.3781101, 0, 0, 1, 1, 1,
0.5434868, -1.304224, 1.88201, 1, 0, 0, 1, 1,
0.5455216, 0.959985, 0.2155897, 1, 0, 0, 1, 1,
0.5491154, -0.3667357, 2.781368, 1, 0, 0, 1, 1,
0.5503551, 0.1211245, 1.627742, 1, 0, 0, 1, 1,
0.5541015, -0.2379902, 1.462341, 1, 0, 0, 1, 1,
0.5552347, 0.3022544, 1.578443, 0, 0, 0, 1, 1,
0.5555961, -1.234275, 3.128895, 0, 0, 0, 1, 1,
0.5592833, -0.4152373, 4.840473, 0, 0, 0, 1, 1,
0.5596012, -0.5939813, 0.7893129, 0, 0, 0, 1, 1,
0.5612409, -0.5203541, 1.98178, 0, 0, 0, 1, 1,
0.5630262, -1.138471, 2.310592, 0, 0, 0, 1, 1,
0.5684518, -0.1419001, 2.036654, 0, 0, 0, 1, 1,
0.5686805, 0.666274, -0.7140452, 1, 1, 1, 1, 1,
0.5723183, 1.373574, -0.1301359, 1, 1, 1, 1, 1,
0.583085, 0.7305639, 1.595734, 1, 1, 1, 1, 1,
0.5846217, 0.9269066, 3.094353, 1, 1, 1, 1, 1,
0.5869728, -0.1974241, 2.02675, 1, 1, 1, 1, 1,
0.590892, -0.1269217, 1.829934, 1, 1, 1, 1, 1,
0.5916913, 2.192223, 0.8653075, 1, 1, 1, 1, 1,
0.5940736, 1.05198, 0.519223, 1, 1, 1, 1, 1,
0.5984051, 0.4841535, 2.305987, 1, 1, 1, 1, 1,
0.6037852, -0.0710533, 0.8843549, 1, 1, 1, 1, 1,
0.6047537, 0.5014061, -0.9654211, 1, 1, 1, 1, 1,
0.6072353, 1.116139, 1.686264, 1, 1, 1, 1, 1,
0.6072953, -0.1653016, 1.420231, 1, 1, 1, 1, 1,
0.6096216, 2.837533, -1.803037, 1, 1, 1, 1, 1,
0.6114555, 2.559673, 0.982199, 1, 1, 1, 1, 1,
0.6123378, -1.197514, 3.342581, 0, 0, 1, 1, 1,
0.6123976, 1.790118, 1.071892, 1, 0, 0, 1, 1,
0.6125925, 0.5133553, 1.849816, 1, 0, 0, 1, 1,
0.6130078, -0.4339505, 1.97459, 1, 0, 0, 1, 1,
0.6193954, -0.4513776, 1.632251, 1, 0, 0, 1, 1,
0.6210739, -0.09242326, -0.7116277, 1, 0, 0, 1, 1,
0.6228911, 0.3956622, 0.8414106, 0, 0, 0, 1, 1,
0.6271734, -0.7669623, 1.736139, 0, 0, 0, 1, 1,
0.6288168, -0.3295008, 1.393298, 0, 0, 0, 1, 1,
0.6289403, 1.127406, 1.311094, 0, 0, 0, 1, 1,
0.6297155, 0.8846921, 2.267623, 0, 0, 0, 1, 1,
0.6303482, 0.3116029, 1.089242, 0, 0, 0, 1, 1,
0.6368836, -0.1455506, 1.598293, 0, 0, 0, 1, 1,
0.6368979, 0.01110251, 0.2208155, 1, 1, 1, 1, 1,
0.6402794, -0.9687953, 3.252237, 1, 1, 1, 1, 1,
0.6440973, -0.02596012, 1.666645, 1, 1, 1, 1, 1,
0.6443712, -0.06722485, 2.006589, 1, 1, 1, 1, 1,
0.6447271, 0.7329885, 1.572655, 1, 1, 1, 1, 1,
0.644877, -0.2542378, 2.742369, 1, 1, 1, 1, 1,
0.6485187, 1.475947, 0.1706328, 1, 1, 1, 1, 1,
0.6492078, 1.051599, 0.4512818, 1, 1, 1, 1, 1,
0.6530842, 1.934118, 2.149412, 1, 1, 1, 1, 1,
0.6644331, -0.4775832, 2.423155, 1, 1, 1, 1, 1,
0.6674233, -0.8709581, 1.659178, 1, 1, 1, 1, 1,
0.6791646, -0.4848356, 2.086981, 1, 1, 1, 1, 1,
0.6817288, 0.5859069, -0.04126056, 1, 1, 1, 1, 1,
0.6819239, -0.3678821, 1.8284, 1, 1, 1, 1, 1,
0.6824533, -1.180002, 3.098953, 1, 1, 1, 1, 1,
0.6832114, 1.429493, 2.335422, 0, 0, 1, 1, 1,
0.6873462, -0.2460456, 2.130372, 1, 0, 0, 1, 1,
0.6895516, -1.162293, 3.224402, 1, 0, 0, 1, 1,
0.6931461, 1.328806, -0.6850094, 1, 0, 0, 1, 1,
0.6961313, 0.2867896, 1.376461, 1, 0, 0, 1, 1,
0.7025387, -2.132366, 1.718934, 1, 0, 0, 1, 1,
0.705272, -0.6060743, 1.376549, 0, 0, 0, 1, 1,
0.7055689, 0.2220764, 3.214073, 0, 0, 0, 1, 1,
0.7066596, 1.734833, 0.8065268, 0, 0, 0, 1, 1,
0.7082722, -0.0169628, 0.7930225, 0, 0, 0, 1, 1,
0.7099917, -0.5962698, 1.568177, 0, 0, 0, 1, 1,
0.7119929, -0.6706058, 2.098751, 0, 0, 0, 1, 1,
0.7127424, -0.3319643, 2.477116, 0, 0, 0, 1, 1,
0.7139931, 0.8165047, 0.371893, 1, 1, 1, 1, 1,
0.7158223, 0.1793403, 1.514456, 1, 1, 1, 1, 1,
0.720666, 0.2294188, 1.189648, 1, 1, 1, 1, 1,
0.7216215, -0.7309799, 3.738472, 1, 1, 1, 1, 1,
0.7275895, 0.3620709, 1.971649, 1, 1, 1, 1, 1,
0.7336808, -1.396752, 4.664468, 1, 1, 1, 1, 1,
0.7383825, 1.31549, 0.6462846, 1, 1, 1, 1, 1,
0.7416971, -1.152453, 3.215439, 1, 1, 1, 1, 1,
0.7425477, 0.9973203, 0.3283767, 1, 1, 1, 1, 1,
0.7465511, 1.711599, 0.8625758, 1, 1, 1, 1, 1,
0.747795, -0.2929343, 2.412482, 1, 1, 1, 1, 1,
0.7484298, -0.3925549, 2.062343, 1, 1, 1, 1, 1,
0.7500029, -0.2369903, 0.4711719, 1, 1, 1, 1, 1,
0.7594021, -0.7383775, 3.903454, 1, 1, 1, 1, 1,
0.7605947, 0.1693399, 0.6614164, 1, 1, 1, 1, 1,
0.7611535, 0.2532645, 2.402386, 0, 0, 1, 1, 1,
0.763177, 0.2882016, 0.2197868, 1, 0, 0, 1, 1,
0.7661849, -1.111628, 1.496871, 1, 0, 0, 1, 1,
0.7672169, -0.3184854, 1.429587, 1, 0, 0, 1, 1,
0.7763201, 0.8155633, -0.08366593, 1, 0, 0, 1, 1,
0.7776093, 0.1880565, 1.004574, 1, 0, 0, 1, 1,
0.7856756, 1.979426, 2.706577, 0, 0, 0, 1, 1,
0.7892175, 0.6583789, 0.1508371, 0, 0, 0, 1, 1,
0.790052, 0.8304704, 0.7142088, 0, 0, 0, 1, 1,
0.7922454, -0.5863738, 2.219597, 0, 0, 0, 1, 1,
0.7937875, 0.2083551, 0.3494844, 0, 0, 0, 1, 1,
0.7941166, 1.064946, 2.642435, 0, 0, 0, 1, 1,
0.7978042, 0.3365189, 0.4001953, 0, 0, 0, 1, 1,
0.8050724, 0.9005346, -0.04883189, 1, 1, 1, 1, 1,
0.8109551, -1.699554, 3.62924, 1, 1, 1, 1, 1,
0.8113195, -1.639026, 1.860173, 1, 1, 1, 1, 1,
0.8142548, -0.04160232, 2.538328, 1, 1, 1, 1, 1,
0.8145902, 0.5057787, 0.1757272, 1, 1, 1, 1, 1,
0.8182392, 1.480264, 1.745335, 1, 1, 1, 1, 1,
0.8233424, -0.02668481, 0.69688, 1, 1, 1, 1, 1,
0.8273208, 0.06183028, 0.3632732, 1, 1, 1, 1, 1,
0.8275782, 1.186325, 1.807973, 1, 1, 1, 1, 1,
0.8332039, -0.4848799, 3.386476, 1, 1, 1, 1, 1,
0.8382973, 0.9471958, 0.7736281, 1, 1, 1, 1, 1,
0.8393524, -0.1215196, 0.9306159, 1, 1, 1, 1, 1,
0.840705, 2.506533, -1.350165, 1, 1, 1, 1, 1,
0.8410988, 0.2689607, 1.923353, 1, 1, 1, 1, 1,
0.8465878, -0.2905998, 3.324112, 1, 1, 1, 1, 1,
0.8469566, -0.7331134, 1.267695, 0, 0, 1, 1, 1,
0.849819, 1.411148, 0.3805452, 1, 0, 0, 1, 1,
0.8506631, -1.167649, 4.222454, 1, 0, 0, 1, 1,
0.852699, 0.241466, 2.527517, 1, 0, 0, 1, 1,
0.8622481, 0.9205272, 1.454448, 1, 0, 0, 1, 1,
0.8653119, -0.07426235, 1.271077, 1, 0, 0, 1, 1,
0.8669194, -0.6459993, 3.437542, 0, 0, 0, 1, 1,
0.8712099, -0.6307571, 1.405124, 0, 0, 0, 1, 1,
0.8718596, 0.1033325, 1.674385, 0, 0, 0, 1, 1,
0.875202, -0.9446038, 1.804692, 0, 0, 0, 1, 1,
0.8783407, -0.296458, -0.468029, 0, 0, 0, 1, 1,
0.8813754, -0.8302129, 1.733418, 0, 0, 0, 1, 1,
0.8863202, -0.4606035, 2.012949, 0, 0, 0, 1, 1,
0.8877446, -1.366411, 3.320313, 1, 1, 1, 1, 1,
0.894659, -0.5804552, 3.276316, 1, 1, 1, 1, 1,
0.8955989, 0.3968062, 0.1604328, 1, 1, 1, 1, 1,
0.8962045, 0.3127017, 0.1029554, 1, 1, 1, 1, 1,
0.9030401, 0.6851488, 0.5612516, 1, 1, 1, 1, 1,
0.9072954, -0.192079, 1.437698, 1, 1, 1, 1, 1,
0.9150181, 0.2293742, 1.180071, 1, 1, 1, 1, 1,
0.9216317, 0.5009973, 2.612035, 1, 1, 1, 1, 1,
0.9238902, -0.1251001, 0.3906937, 1, 1, 1, 1, 1,
0.9274895, 1.375203, 2.137867, 1, 1, 1, 1, 1,
0.927561, 0.2363848, 0.8496464, 1, 1, 1, 1, 1,
0.9305968, 1.825468, 0.4963852, 1, 1, 1, 1, 1,
0.9318793, 0.3443188, 0.8617634, 1, 1, 1, 1, 1,
0.9345509, 0.3800185, 0.4894201, 1, 1, 1, 1, 1,
0.9451209, -0.5686178, 2.723193, 1, 1, 1, 1, 1,
0.9459406, -0.08966009, 2.140792, 0, 0, 1, 1, 1,
0.9509474, -0.6760026, 1.399449, 1, 0, 0, 1, 1,
0.9612378, 0.3966213, 0.1251775, 1, 0, 0, 1, 1,
0.9634984, -0.01242048, 2.975709, 1, 0, 0, 1, 1,
0.963615, -1.423754, 4.129607, 1, 0, 0, 1, 1,
0.9646881, -1.361123, 2.10551, 1, 0, 0, 1, 1,
0.9671569, 0.1283833, 1.152354, 0, 0, 0, 1, 1,
0.9737902, 0.482329, 1.243932, 0, 0, 0, 1, 1,
0.9738796, -0.2516957, 0.6379146, 0, 0, 0, 1, 1,
0.9819402, 0.6072339, 0.7619113, 0, 0, 0, 1, 1,
0.9823072, -0.3000259, 2.503538, 0, 0, 0, 1, 1,
1.005296, -0.07879913, 3.615569, 0, 0, 0, 1, 1,
1.007794, 0.6510831, 0.5118032, 0, 0, 0, 1, 1,
1.010286, 1.342615, -0.2944161, 1, 1, 1, 1, 1,
1.010433, -0.9408599, 2.184275, 1, 1, 1, 1, 1,
1.011962, 0.3010311, 1.958883, 1, 1, 1, 1, 1,
1.020072, 0.7558646, 0.8724045, 1, 1, 1, 1, 1,
1.022909, -0.2592641, 1.284402, 1, 1, 1, 1, 1,
1.023, -0.8879789, 1.101274, 1, 1, 1, 1, 1,
1.025873, -1.616507, 2.568356, 1, 1, 1, 1, 1,
1.026133, 0.2612926, 1.195624, 1, 1, 1, 1, 1,
1.02809, -0.5105808, 0.9510738, 1, 1, 1, 1, 1,
1.02977, -0.7778118, 2.0104, 1, 1, 1, 1, 1,
1.04342, -1.824116, 2.964128, 1, 1, 1, 1, 1,
1.044192, 0.3943364, 0.9012761, 1, 1, 1, 1, 1,
1.047761, -0.220769, 1.448088, 1, 1, 1, 1, 1,
1.052392, -0.5541074, 1.815348, 1, 1, 1, 1, 1,
1.060532, 0.8854616, 0.3197338, 1, 1, 1, 1, 1,
1.07133, 0.7422758, 0.6010018, 0, 0, 1, 1, 1,
1.071688, 0.2777427, -1.195242, 1, 0, 0, 1, 1,
1.076266, -0.9736173, 1.322498, 1, 0, 0, 1, 1,
1.078374, 0.5152985, 1.488685, 1, 0, 0, 1, 1,
1.078416, 0.5926715, 1.450107, 1, 0, 0, 1, 1,
1.079829, 1.164507, 1.950535, 1, 0, 0, 1, 1,
1.081601, -0.2712193, 2.754578, 0, 0, 0, 1, 1,
1.085418, 0.776616, 1.77352, 0, 0, 0, 1, 1,
1.086307, -2.218356, 2.772739, 0, 0, 0, 1, 1,
1.087037, -1.424534, 3.360097, 0, 0, 0, 1, 1,
1.087895, 2.124496, -0.6567026, 0, 0, 0, 1, 1,
1.089431, 0.7512046, 1.876191, 0, 0, 0, 1, 1,
1.109555, 0.6863834, 0.1084988, 0, 0, 0, 1, 1,
1.119707, 0.2898075, 1.84796, 1, 1, 1, 1, 1,
1.121858, 0.908844, 0.6892053, 1, 1, 1, 1, 1,
1.132003, -1.274539, 2.048081, 1, 1, 1, 1, 1,
1.141764, 0.975601, -1.265896, 1, 1, 1, 1, 1,
1.144284, 0.2367354, 0.769765, 1, 1, 1, 1, 1,
1.146357, -0.5444019, 2.318316, 1, 1, 1, 1, 1,
1.146621, -0.9771025, 1.629389, 1, 1, 1, 1, 1,
1.150194, 0.02466043, 2.917195, 1, 1, 1, 1, 1,
1.152936, -0.003144772, 1.215377, 1, 1, 1, 1, 1,
1.153927, -0.5048609, 0.5282006, 1, 1, 1, 1, 1,
1.154376, 0.09091204, 1.245156, 1, 1, 1, 1, 1,
1.159441, -0.5807838, 2.125726, 1, 1, 1, 1, 1,
1.161909, 0.995093, 1.007498, 1, 1, 1, 1, 1,
1.164995, 1.482618, 1.42011, 1, 1, 1, 1, 1,
1.166716, -1.419554, 2.292233, 1, 1, 1, 1, 1,
1.190388, -0.214263, 1.844198, 0, 0, 1, 1, 1,
1.194842, -1.298221, 3.803136, 1, 0, 0, 1, 1,
1.198429, 0.8871513, 0.7406251, 1, 0, 0, 1, 1,
1.207489, -1.051733, 1.72415, 1, 0, 0, 1, 1,
1.212087, -1.342984, 1.721178, 1, 0, 0, 1, 1,
1.216316, 0.3038657, 1.194914, 1, 0, 0, 1, 1,
1.217504, 1.111784, 1.530645, 0, 0, 0, 1, 1,
1.226403, 0.3022092, 1.130975, 0, 0, 0, 1, 1,
1.227216, 1.064628, 1.437783, 0, 0, 0, 1, 1,
1.227305, -2.913327, 3.987905, 0, 0, 0, 1, 1,
1.237236, 1.180617, 2.602948, 0, 0, 0, 1, 1,
1.254525, -0.0199321, 1.90991, 0, 0, 0, 1, 1,
1.258616, -0.5801721, 2.156737, 0, 0, 0, 1, 1,
1.258895, -0.6472836, 2.628019, 1, 1, 1, 1, 1,
1.259825, -0.6920215, 1.996811, 1, 1, 1, 1, 1,
1.263648, 0.9280784, 0.3564996, 1, 1, 1, 1, 1,
1.265451, 0.4133537, 1.876655, 1, 1, 1, 1, 1,
1.271648, -0.05157426, 1.376921, 1, 1, 1, 1, 1,
1.272651, 1.280248, -0.006103394, 1, 1, 1, 1, 1,
1.283137, 0.2274261, 0.5440231, 1, 1, 1, 1, 1,
1.284802, 0.03647638, 0.06300431, 1, 1, 1, 1, 1,
1.293707, 1.159296, -0.2853545, 1, 1, 1, 1, 1,
1.294713, -0.4103525, 2.496905, 1, 1, 1, 1, 1,
1.298982, 2.449435, -0.02714841, 1, 1, 1, 1, 1,
1.30516, -1.167571, 3.284106, 1, 1, 1, 1, 1,
1.318298, 1.354093, -1.126087, 1, 1, 1, 1, 1,
1.321879, 0.9350027, -1.003744, 1, 1, 1, 1, 1,
1.325176, 1.710951, -0.2920889, 1, 1, 1, 1, 1,
1.328302, 1.755312, 1.221129, 0, 0, 1, 1, 1,
1.337993, -0.3665984, 1.034585, 1, 0, 0, 1, 1,
1.338902, -0.6080948, 2.234314, 1, 0, 0, 1, 1,
1.359117, -0.06533729, 1.958349, 1, 0, 0, 1, 1,
1.360106, -0.5524319, 2.855331, 1, 0, 0, 1, 1,
1.364043, 0.2277839, 0.4872784, 1, 0, 0, 1, 1,
1.36556, -0.06849502, 2.971979, 0, 0, 0, 1, 1,
1.36608, -0.6839509, 4.223693, 0, 0, 0, 1, 1,
1.375439, -0.03916408, 3.195592, 0, 0, 0, 1, 1,
1.380612, -0.5862436, 0.5344104, 0, 0, 0, 1, 1,
1.386932, -0.5927486, 1.27964, 0, 0, 0, 1, 1,
1.405918, 0.9391465, 1.806025, 0, 0, 0, 1, 1,
1.40786, 1.183133, 0.8889551, 0, 0, 0, 1, 1,
1.435537, 0.3042502, 1.378521, 1, 1, 1, 1, 1,
1.450801, 1.149179, 0.5810671, 1, 1, 1, 1, 1,
1.455432, -1.686408, 1.716372, 1, 1, 1, 1, 1,
1.463183, -0.1430105, 1.822384, 1, 1, 1, 1, 1,
1.482721, -1.035939, 0.931251, 1, 1, 1, 1, 1,
1.490522, 0.06038269, -0.3525676, 1, 1, 1, 1, 1,
1.490896, -1.279891, 0.7288411, 1, 1, 1, 1, 1,
1.499061, 0.4064153, 2.23915, 1, 1, 1, 1, 1,
1.501038, -0.3050761, 2.127926, 1, 1, 1, 1, 1,
1.501949, 1.717905, 0.5834282, 1, 1, 1, 1, 1,
1.503973, 0.3730771, 1.445594, 1, 1, 1, 1, 1,
1.512659, 0.3848655, 2.37286, 1, 1, 1, 1, 1,
1.520915, -0.4516107, 2.376767, 1, 1, 1, 1, 1,
1.526383, -2.370394, 0.8029647, 1, 1, 1, 1, 1,
1.533179, -0.961812, 1.891626, 1, 1, 1, 1, 1,
1.539189, 0.3377028, 1.246725, 0, 0, 1, 1, 1,
1.546325, 0.3478722, -0.4369655, 1, 0, 0, 1, 1,
1.570259, -0.5729038, 1.102095, 1, 0, 0, 1, 1,
1.576146, -0.4873562, 1.721779, 1, 0, 0, 1, 1,
1.587651, 0.03341591, 3.472989, 1, 0, 0, 1, 1,
1.600334, -0.03397445, 3.337126, 1, 0, 0, 1, 1,
1.627639, -2.146562, 3.987591, 0, 0, 0, 1, 1,
1.639997, 0.355094, 3.092261, 0, 0, 0, 1, 1,
1.648752, -0.199426, 1.231763, 0, 0, 0, 1, 1,
1.661109, -0.5984719, 1.454098, 0, 0, 0, 1, 1,
1.666047, -1.240007, 5.183424, 0, 0, 0, 1, 1,
1.678133, 0.8096115, 2.55685, 0, 0, 0, 1, 1,
1.694269, -0.4350563, 0.799867, 0, 0, 0, 1, 1,
1.705969, 0.4808118, 0.3231953, 1, 1, 1, 1, 1,
1.720867, -1.257158, 2.377559, 1, 1, 1, 1, 1,
1.723837, -0.431494, 1.941875, 1, 1, 1, 1, 1,
1.725866, 2.130176, -1.131464, 1, 1, 1, 1, 1,
1.729966, 0.9051452, 0.2760893, 1, 1, 1, 1, 1,
1.748263, 1.594192, 0.404336, 1, 1, 1, 1, 1,
1.750255, 1.109215, 0.9268525, 1, 1, 1, 1, 1,
1.785405, 0.6411127, 1.24756, 1, 1, 1, 1, 1,
1.796388, -0.1182467, 1.721219, 1, 1, 1, 1, 1,
1.818953, -0.677227, 1.586632, 1, 1, 1, 1, 1,
1.84743, 3.022009, 1.49485, 1, 1, 1, 1, 1,
1.848368, 0.2925317, -0.209066, 1, 1, 1, 1, 1,
1.854972, 0.6749718, -0.9115125, 1, 1, 1, 1, 1,
1.862587, -0.5187039, 2.001081, 1, 1, 1, 1, 1,
1.87435, -0.4374267, 0.4244937, 1, 1, 1, 1, 1,
1.938024, -0.6638563, 0.4946278, 0, 0, 1, 1, 1,
1.958887, -0.9600597, 2.47104, 1, 0, 0, 1, 1,
1.980664, 0.7854663, 0.1817105, 1, 0, 0, 1, 1,
1.995919, -0.2307642, 3.62851, 1, 0, 0, 1, 1,
2.040613, -0.5734944, 2.485338, 1, 0, 0, 1, 1,
2.04412, -0.9827483, 1.569747, 1, 0, 0, 1, 1,
2.05531, -0.07733867, 2.158714, 0, 0, 0, 1, 1,
2.066415, -0.7358061, 0.8420552, 0, 0, 0, 1, 1,
2.068735, 2.046285, -0.04463482, 0, 0, 0, 1, 1,
2.086077, 0.2417575, 2.955577, 0, 0, 0, 1, 1,
2.16256, -0.1725343, 0.7159893, 0, 0, 0, 1, 1,
2.185309, -1.013715, 2.666356, 0, 0, 0, 1, 1,
2.331298, -1.108481, 0.9010707, 0, 0, 0, 1, 1,
2.363962, 0.5821683, 2.195736, 1, 1, 1, 1, 1,
2.412746, -0.1343433, 1.785661, 1, 1, 1, 1, 1,
2.416081, -0.6463479, 1.187254, 1, 1, 1, 1, 1,
2.953244, 0.3061912, -0.07689472, 1, 1, 1, 1, 1,
2.982123, -0.2681823, 2.754087, 1, 1, 1, 1, 1,
2.994653, -0.2384636, 0.5592369, 1, 1, 1, 1, 1,
3.076073, -0.9188748, 1.271512, 1, 1, 1, 1, 1
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
var radius = 9.621685;
var distance = 33.79576;
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
mvMatrix.translate( 0.05702877, 0.09980536, -0.2072439 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.79576);
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
