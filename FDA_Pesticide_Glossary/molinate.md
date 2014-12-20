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
-3.099211, -1.854648, 0.03809268, 1, 0, 0, 1,
-2.974865, 0.09379467, -0.6993392, 1, 0.007843138, 0, 1,
-2.959844, -1.310442, -1.566814, 1, 0.01176471, 0, 1,
-2.915941, 0.9858623, -0.4616896, 1, 0.01960784, 0, 1,
-2.828154, -0.4163798, -2.007873, 1, 0.02352941, 0, 1,
-2.595706, -1.278169, -0.7007822, 1, 0.03137255, 0, 1,
-2.304518, 1.303771, -0.0909656, 1, 0.03529412, 0, 1,
-2.269471, -1.419483, -2.751357, 1, 0.04313726, 0, 1,
-2.263481, 1.334804, 0.2719215, 1, 0.04705882, 0, 1,
-2.261078, 0.7252176, -1.284415, 1, 0.05490196, 0, 1,
-2.250877, 0.6898398, 0.1997554, 1, 0.05882353, 0, 1,
-2.20946, 1.252003, -2.391056, 1, 0.06666667, 0, 1,
-2.164358, 0.3967982, -1.80379, 1, 0.07058824, 0, 1,
-2.144324, 0.616441, -1.523749, 1, 0.07843138, 0, 1,
-2.097667, 1.947941, -1.792967, 1, 0.08235294, 0, 1,
-2.082967, 1.22984, -2.136019, 1, 0.09019608, 0, 1,
-2.080761, 1.28545, -1.166461, 1, 0.09411765, 0, 1,
-2.062134, -2.848269, -2.679465, 1, 0.1019608, 0, 1,
-2.056017, -0.8644913, -4.295798, 1, 0.1098039, 0, 1,
-2.052018, 0.5171424, -1.608562, 1, 0.1137255, 0, 1,
-2.049961, -1.127111, -1.5127, 1, 0.1215686, 0, 1,
-2.041296, -0.1114783, -2.028888, 1, 0.1254902, 0, 1,
-2.032494, 0.1754371, -0.582583, 1, 0.1333333, 0, 1,
-2.006753, -0.7520671, -2.438941, 1, 0.1372549, 0, 1,
-1.998379, 0.4605781, -0.2968823, 1, 0.145098, 0, 1,
-1.997321, 0.5395207, 0.1577512, 1, 0.1490196, 0, 1,
-1.995105, 0.195576, -1.180687, 1, 0.1568628, 0, 1,
-1.967161, -0.03314981, -0.6658235, 1, 0.1607843, 0, 1,
-1.95582, -0.4615245, -1.202405, 1, 0.1686275, 0, 1,
-1.943778, -2.416561, -2.918878, 1, 0.172549, 0, 1,
-1.937139, 0.2769771, -1.426809, 1, 0.1803922, 0, 1,
-1.925777, -1.070817, -2.025008, 1, 0.1843137, 0, 1,
-1.924879, 0.680261, -0.5866718, 1, 0.1921569, 0, 1,
-1.919225, -0.1896025, -1.322081, 1, 0.1960784, 0, 1,
-1.913995, -1.414252, -2.65255, 1, 0.2039216, 0, 1,
-1.872507, -0.3486659, -1.350969, 1, 0.2117647, 0, 1,
-1.862682, -1.398424, -2.816939, 1, 0.2156863, 0, 1,
-1.858069, 1.257659, 1.146476, 1, 0.2235294, 0, 1,
-1.856733, 0.8205566, -1.2533, 1, 0.227451, 0, 1,
-1.816975, 1.279613, -1.017317, 1, 0.2352941, 0, 1,
-1.769959, 0.3548417, -0.5592839, 1, 0.2392157, 0, 1,
-1.763104, 2.998926, -0.2027408, 1, 0.2470588, 0, 1,
-1.744209, 0.9678583, -0.06944676, 1, 0.2509804, 0, 1,
-1.741025, 2.736774, -1.560579, 1, 0.2588235, 0, 1,
-1.733652, 0.8918325, -1.714197, 1, 0.2627451, 0, 1,
-1.733087, -0.6247566, -1.829238, 1, 0.2705882, 0, 1,
-1.728933, -0.4226964, -1.109232, 1, 0.2745098, 0, 1,
-1.714872, 2.101223, -0.2059155, 1, 0.282353, 0, 1,
-1.711842, -0.9686705, -3.592598, 1, 0.2862745, 0, 1,
-1.703016, -0.04149668, 0.06861735, 1, 0.2941177, 0, 1,
-1.700655, 0.3721606, -1.55728, 1, 0.3019608, 0, 1,
-1.690054, -0.5995632, -2.188273, 1, 0.3058824, 0, 1,
-1.688717, 1.262912, -0.4099413, 1, 0.3137255, 0, 1,
-1.686278, -0.04528758, -2.523713, 1, 0.3176471, 0, 1,
-1.673212, 0.5852592, -1.686576, 1, 0.3254902, 0, 1,
-1.66255, -0.2547874, -2.463, 1, 0.3294118, 0, 1,
-1.660299, 0.3112408, -0.8349131, 1, 0.3372549, 0, 1,
-1.64626, -0.5868469, -3.387491, 1, 0.3411765, 0, 1,
-1.642732, -0.3671617, -1.522227, 1, 0.3490196, 0, 1,
-1.640815, -0.7013333, -1.46354, 1, 0.3529412, 0, 1,
-1.635355, -0.3708223, -3.560731, 1, 0.3607843, 0, 1,
-1.635173, -1.157914, -2.336011, 1, 0.3647059, 0, 1,
-1.626522, -0.3032248, -1.552266, 1, 0.372549, 0, 1,
-1.610648, 0.9134336, -1.701029, 1, 0.3764706, 0, 1,
-1.599102, -0.3291043, -0.3508181, 1, 0.3843137, 0, 1,
-1.596792, 0.1420925, -1.72214, 1, 0.3882353, 0, 1,
-1.587442, 0.6363174, -0.09072622, 1, 0.3960784, 0, 1,
-1.582261, 2.414356, -1.11669, 1, 0.4039216, 0, 1,
-1.578888, 0.357, -1.224901, 1, 0.4078431, 0, 1,
-1.572955, -1.000542, -2.417295, 1, 0.4156863, 0, 1,
-1.571284, -0.313148, -1.183998, 1, 0.4196078, 0, 1,
-1.552684, 0.8409785, 0.70969, 1, 0.427451, 0, 1,
-1.546401, -1.471705, -2.15318, 1, 0.4313726, 0, 1,
-1.543702, -0.5245876, -0.8113661, 1, 0.4392157, 0, 1,
-1.533649, -0.7292012, -1.809078, 1, 0.4431373, 0, 1,
-1.532127, 0.8653009, -1.157283, 1, 0.4509804, 0, 1,
-1.50091, 0.3777929, 0.8126553, 1, 0.454902, 0, 1,
-1.494038, -1.211029, -3.008739, 1, 0.4627451, 0, 1,
-1.488955, 0.4708835, -0.6519719, 1, 0.4666667, 0, 1,
-1.484302, -1.044546, -1.801066, 1, 0.4745098, 0, 1,
-1.483537, -1.845023, -1.935532, 1, 0.4784314, 0, 1,
-1.478629, -0.4261605, -2.399884, 1, 0.4862745, 0, 1,
-1.438697, 2.615367, 1.188617, 1, 0.4901961, 0, 1,
-1.437801, -1.338248, -1.569057, 1, 0.4980392, 0, 1,
-1.436857, 1.191905, 1.176778, 1, 0.5058824, 0, 1,
-1.424424, -0.3600875, -2.410082, 1, 0.509804, 0, 1,
-1.415383, 1.5857, 0.6646267, 1, 0.5176471, 0, 1,
-1.410201, -0.3078196, -1.868953, 1, 0.5215687, 0, 1,
-1.409294, 0.197922, -1.328268, 1, 0.5294118, 0, 1,
-1.403066, -0.2159709, -0.2156839, 1, 0.5333334, 0, 1,
-1.396847, 2.030014, -1.376788, 1, 0.5411765, 0, 1,
-1.39568, -1.753325, -2.708702, 1, 0.5450981, 0, 1,
-1.385799, -0.7628796, -1.322917, 1, 0.5529412, 0, 1,
-1.377203, 0.7612002, -1.971073, 1, 0.5568628, 0, 1,
-1.372845, 1.268045, -0.08773901, 1, 0.5647059, 0, 1,
-1.372589, -0.1399163, -2.224386, 1, 0.5686275, 0, 1,
-1.362237, 0.4946229, 0.2877302, 1, 0.5764706, 0, 1,
-1.356133, -0.6369236, -1.748734, 1, 0.5803922, 0, 1,
-1.354742, -1.087151, -2.402661, 1, 0.5882353, 0, 1,
-1.351567, -0.7786309, -1.534772, 1, 0.5921569, 0, 1,
-1.33807, 0.570088, 0.06281909, 1, 0.6, 0, 1,
-1.331789, -0.5307904, -1.934392, 1, 0.6078432, 0, 1,
-1.322943, -0.4473303, -3.160972, 1, 0.6117647, 0, 1,
-1.310442, 0.7154707, -1.011578, 1, 0.6196079, 0, 1,
-1.295192, -0.533554, -1.769102, 1, 0.6235294, 0, 1,
-1.284087, 1.086838, -0.7763337, 1, 0.6313726, 0, 1,
-1.280158, 0.701087, -1.157231, 1, 0.6352941, 0, 1,
-1.273434, -0.765887, -0.3265793, 1, 0.6431373, 0, 1,
-1.270844, -1.402748, -1.831496, 1, 0.6470588, 0, 1,
-1.268329, 1.126138, -2.156074, 1, 0.654902, 0, 1,
-1.267923, 0.1068132, -1.47168, 1, 0.6588235, 0, 1,
-1.2673, 0.01579703, -2.399248, 1, 0.6666667, 0, 1,
-1.253703, -1.246986, -3.436339, 1, 0.6705883, 0, 1,
-1.252414, -1.809336, -3.858889, 1, 0.6784314, 0, 1,
-1.250234, 0.436101, -2.169883, 1, 0.682353, 0, 1,
-1.24948, -1.028637, -2.093934, 1, 0.6901961, 0, 1,
-1.248021, -0.8267179, -2.887643, 1, 0.6941177, 0, 1,
-1.240871, 0.1027551, -2.848171, 1, 0.7019608, 0, 1,
-1.24081, -0.1122277, 0.6521751, 1, 0.7098039, 0, 1,
-1.235618, 1.394763, -1.937759, 1, 0.7137255, 0, 1,
-1.230246, -0.2745711, -3.756277, 1, 0.7215686, 0, 1,
-1.228595, -1.005759, -2.637561, 1, 0.7254902, 0, 1,
-1.21498, 0.2246623, -2.20511, 1, 0.7333333, 0, 1,
-1.214368, -1.298782, -2.679387, 1, 0.7372549, 0, 1,
-1.211271, -0.4946735, -2.160327, 1, 0.7450981, 0, 1,
-1.210872, 0.7879223, -0.4369162, 1, 0.7490196, 0, 1,
-1.209679, 1.007809, 0.02578686, 1, 0.7568628, 0, 1,
-1.206689, 0.2092896, -1.272064, 1, 0.7607843, 0, 1,
-1.188522, 1.602724, -3.765116, 1, 0.7686275, 0, 1,
-1.173696, -0.4513779, -1.455498, 1, 0.772549, 0, 1,
-1.169511, -1.156481, -2.478188, 1, 0.7803922, 0, 1,
-1.167097, -1.143117, -2.311278, 1, 0.7843137, 0, 1,
-1.163944, 1.23557, -2.001467, 1, 0.7921569, 0, 1,
-1.162709, -1.179417, -1.311225, 1, 0.7960784, 0, 1,
-1.16215, -0.7283292, -1.039107, 1, 0.8039216, 0, 1,
-1.161287, -1.516241, -1.604985, 1, 0.8117647, 0, 1,
-1.15652, -1.238245, -2.813412, 1, 0.8156863, 0, 1,
-1.151526, 0.5792271, -0.3549628, 1, 0.8235294, 0, 1,
-1.1444, -0.3876168, -0.565189, 1, 0.827451, 0, 1,
-1.13953, -0.03432085, -2.176238, 1, 0.8352941, 0, 1,
-1.13933, 1.248607, 0.2864551, 1, 0.8392157, 0, 1,
-1.136638, -1.011416, -1.352462, 1, 0.8470588, 0, 1,
-1.131676, 0.7382358, -0.7662054, 1, 0.8509804, 0, 1,
-1.131063, 0.3290264, -3.063492, 1, 0.8588235, 0, 1,
-1.130733, 0.6667565, 0.8412973, 1, 0.8627451, 0, 1,
-1.12927, 0.2277359, -2.488766, 1, 0.8705882, 0, 1,
-1.124959, -0.4298975, -3.017257, 1, 0.8745098, 0, 1,
-1.118356, -0.05472979, -2.310668, 1, 0.8823529, 0, 1,
-1.110995, -1.734982, -3.566956, 1, 0.8862745, 0, 1,
-1.104128, -0.4194533, -1.355438, 1, 0.8941177, 0, 1,
-1.101957, 0.1206138, -0.4906, 1, 0.8980392, 0, 1,
-1.101146, -0.09462647, -1.317364, 1, 0.9058824, 0, 1,
-1.092307, 0.6183954, -1.561609, 1, 0.9137255, 0, 1,
-1.084972, -1.337346, -3.268456, 1, 0.9176471, 0, 1,
-1.082891, -0.01961805, -1.9522, 1, 0.9254902, 0, 1,
-1.068906, 2.149715, 0.6643301, 1, 0.9294118, 0, 1,
-1.065153, -1.241793, -2.50948, 1, 0.9372549, 0, 1,
-1.064136, 0.700683, -0.7834376, 1, 0.9411765, 0, 1,
-1.055402, 0.3308653, -0.7530461, 1, 0.9490196, 0, 1,
-1.05499, 0.7560194, -1.809534, 1, 0.9529412, 0, 1,
-1.049509, 0.0252587, -2.597777, 1, 0.9607843, 0, 1,
-1.045439, 0.7543178, 0.305078, 1, 0.9647059, 0, 1,
-1.043076, -0.6819456, -2.374804, 1, 0.972549, 0, 1,
-1.042372, -0.8723447, -1.197842, 1, 0.9764706, 0, 1,
-1.039046, -1.788374, -0.788352, 1, 0.9843137, 0, 1,
-1.038844, -0.3423956, -2.428512, 1, 0.9882353, 0, 1,
-1.037173, 1.93874, 2.27038, 1, 0.9960784, 0, 1,
-1.03591, 0.1339942, -1.136848, 0.9960784, 1, 0, 1,
-1.035762, 0.1262742, -1.622083, 0.9921569, 1, 0, 1,
-1.034255, -0.3479663, -2.238197, 0.9843137, 1, 0, 1,
-1.033281, -1.122716, -1.74728, 0.9803922, 1, 0, 1,
-1.032956, -1.178849, -1.689424, 0.972549, 1, 0, 1,
-1.031228, -2.159466, -4.283792, 0.9686275, 1, 0, 1,
-1.024513, 1.546402, -1.485489, 0.9607843, 1, 0, 1,
-1.007789, -0.5717736, 0.780961, 0.9568627, 1, 0, 1,
-1.004622, 0.1688361, -1.166757, 0.9490196, 1, 0, 1,
-1.004086, 1.707197, -2.716752, 0.945098, 1, 0, 1,
-1.003718, 0.8107129, -0.8063141, 0.9372549, 1, 0, 1,
-0.9894443, -0.4516318, -3.03827, 0.9333333, 1, 0, 1,
-0.9864463, 0.7700098, -0.9842842, 0.9254902, 1, 0, 1,
-0.9843532, 0.6751965, -0.1090226, 0.9215686, 1, 0, 1,
-0.9807683, -0.4740752, -2.575592, 0.9137255, 1, 0, 1,
-0.9805223, 0.8618703, -1.954491, 0.9098039, 1, 0, 1,
-0.9722296, 0.1887388, -2.020147, 0.9019608, 1, 0, 1,
-0.9595665, 1.001906, -2.209679, 0.8941177, 1, 0, 1,
-0.9589261, -0.2497217, -0.3392406, 0.8901961, 1, 0, 1,
-0.9426503, 0.7467415, -1.788167, 0.8823529, 1, 0, 1,
-0.9388224, -1.805276, -2.576537, 0.8784314, 1, 0, 1,
-0.9370058, 0.5507925, -0.1275645, 0.8705882, 1, 0, 1,
-0.9364377, 0.1412656, -1.628665, 0.8666667, 1, 0, 1,
-0.9313722, -0.01081288, -1.93395, 0.8588235, 1, 0, 1,
-0.9313009, 0.3628553, -1.412252, 0.854902, 1, 0, 1,
-0.9312091, -0.5329561, -0.5585502, 0.8470588, 1, 0, 1,
-0.9305487, 0.167124, -0.2520062, 0.8431373, 1, 0, 1,
-0.93003, -0.2351643, -1.9781, 0.8352941, 1, 0, 1,
-0.9277294, 0.435831, -1.303963, 0.8313726, 1, 0, 1,
-0.9219543, -0.3082275, -0.3052001, 0.8235294, 1, 0, 1,
-0.9218502, -1.753158, -2.1982, 0.8196079, 1, 0, 1,
-0.9192823, -0.02379267, -1.72018, 0.8117647, 1, 0, 1,
-0.9175253, -0.4944896, -1.763876, 0.8078431, 1, 0, 1,
-0.9170932, -0.9877945, -1.226925, 0.8, 1, 0, 1,
-0.9170493, -1.979143, -4.810759, 0.7921569, 1, 0, 1,
-0.9144611, 0.1353948, 0.2655895, 0.7882353, 1, 0, 1,
-0.9111297, -0.8091596, -3.218915, 0.7803922, 1, 0, 1,
-0.9097329, 0.6423764, -3.174711, 0.7764706, 1, 0, 1,
-0.90177, 0.4561028, -0.7931703, 0.7686275, 1, 0, 1,
-0.8981329, -0.2449595, -2.52866, 0.7647059, 1, 0, 1,
-0.8957354, -0.2530484, -0.6247356, 0.7568628, 1, 0, 1,
-0.8913312, 0.3063942, -1.271284, 0.7529412, 1, 0, 1,
-0.8844477, -0.8972936, -0.8356146, 0.7450981, 1, 0, 1,
-0.8806496, -0.3005745, -1.54598, 0.7411765, 1, 0, 1,
-0.8766254, -0.3362893, -2.674567, 0.7333333, 1, 0, 1,
-0.8744518, -0.03957552, -1.74692, 0.7294118, 1, 0, 1,
-0.8690075, -1.144677, -3.003561, 0.7215686, 1, 0, 1,
-0.8677562, -1.082624, -0.4251895, 0.7176471, 1, 0, 1,
-0.858209, 0.1345443, -0.3594604, 0.7098039, 1, 0, 1,
-0.8508062, 0.6797625, -2.210436, 0.7058824, 1, 0, 1,
-0.8506199, 0.414046, -1.612758, 0.6980392, 1, 0, 1,
-0.845304, -1.759796, -3.444782, 0.6901961, 1, 0, 1,
-0.8438189, 0.2148959, -3.383235, 0.6862745, 1, 0, 1,
-0.8429021, -0.8674823, -0.795946, 0.6784314, 1, 0, 1,
-0.8425674, -0.01801914, -2.898836, 0.6745098, 1, 0, 1,
-0.8414461, 0.02800429, -1.13228, 0.6666667, 1, 0, 1,
-0.827467, 1.049716, -1.391092, 0.6627451, 1, 0, 1,
-0.8272696, -1.721849, -1.79902, 0.654902, 1, 0, 1,
-0.8265558, 0.4883318, -1.119331, 0.6509804, 1, 0, 1,
-0.823276, -1.75493, -4.42608, 0.6431373, 1, 0, 1,
-0.8185809, 0.8695564, -1.478613, 0.6392157, 1, 0, 1,
-0.8173297, -0.8460388, -3.56754, 0.6313726, 1, 0, 1,
-0.8169663, -0.7517418, -1.031421, 0.627451, 1, 0, 1,
-0.8167161, -0.7378374, -2.211102, 0.6196079, 1, 0, 1,
-0.8139659, -0.4852903, -1.475428, 0.6156863, 1, 0, 1,
-0.813077, 0.8653749, -0.8471522, 0.6078432, 1, 0, 1,
-0.8010164, 0.06746633, -2.67661, 0.6039216, 1, 0, 1,
-0.7971213, 0.7682225, -1.849098, 0.5960785, 1, 0, 1,
-0.7960684, -0.2614857, -1.289377, 0.5882353, 1, 0, 1,
-0.7940591, -0.9863462, -1.13639, 0.5843138, 1, 0, 1,
-0.7938683, -0.9209923, -1.93163, 0.5764706, 1, 0, 1,
-0.7923451, 0.3323696, 0.4055991, 0.572549, 1, 0, 1,
-0.7856939, -1.302726, -2.208132, 0.5647059, 1, 0, 1,
-0.7847633, 0.9799902, -1.512439, 0.5607843, 1, 0, 1,
-0.7838583, -2.394264, -3.488399, 0.5529412, 1, 0, 1,
-0.783446, -1.070288, -3.073866, 0.5490196, 1, 0, 1,
-0.7773741, -1.269131, -3.076771, 0.5411765, 1, 0, 1,
-0.758966, 1.003445, -0.9651638, 0.5372549, 1, 0, 1,
-0.7582886, -1.045525, -2.253096, 0.5294118, 1, 0, 1,
-0.7554613, 0.5769991, -1.384005, 0.5254902, 1, 0, 1,
-0.7519059, 0.6533989, -1.726854, 0.5176471, 1, 0, 1,
-0.7499759, 0.4972908, -0.7900661, 0.5137255, 1, 0, 1,
-0.7438962, 0.1685747, 0.7640166, 0.5058824, 1, 0, 1,
-0.7329667, 0.1527637, -1.112106, 0.5019608, 1, 0, 1,
-0.7315199, -0.03932322, -2.141522, 0.4941176, 1, 0, 1,
-0.7307949, -0.3748743, -1.234038, 0.4862745, 1, 0, 1,
-0.730565, -0.86704, -4.002037, 0.4823529, 1, 0, 1,
-0.7261343, -0.6195015, -2.847805, 0.4745098, 1, 0, 1,
-0.7173874, -3.520707, -3.446342, 0.4705882, 1, 0, 1,
-0.7168816, -0.4024048, -1.506678, 0.4627451, 1, 0, 1,
-0.7097495, 0.9847404, -0.3029309, 0.4588235, 1, 0, 1,
-0.7088756, -0.3200651, -3.942593, 0.4509804, 1, 0, 1,
-0.7053453, 0.08525299, -1.858062, 0.4470588, 1, 0, 1,
-0.6983508, -0.9528286, -2.692478, 0.4392157, 1, 0, 1,
-0.6982046, -1.091377, -1.437408, 0.4352941, 1, 0, 1,
-0.6976694, -0.1638634, -4.507223, 0.427451, 1, 0, 1,
-0.6962646, -0.5263688, -0.9399469, 0.4235294, 1, 0, 1,
-0.6914474, -1.232752, -4.259522, 0.4156863, 1, 0, 1,
-0.6862603, -0.9830558, -3.011269, 0.4117647, 1, 0, 1,
-0.673706, 0.8777453, 0.4806531, 0.4039216, 1, 0, 1,
-0.6699976, 0.1798396, -3.197354, 0.3960784, 1, 0, 1,
-0.6622326, 0.1502828, -2.982975, 0.3921569, 1, 0, 1,
-0.6530256, 0.3185176, -0.7876456, 0.3843137, 1, 0, 1,
-0.6495444, -0.7562355, 0.3391672, 0.3803922, 1, 0, 1,
-0.6470088, 0.2949684, -1.729997, 0.372549, 1, 0, 1,
-0.6469538, 0.6503486, -1.208925, 0.3686275, 1, 0, 1,
-0.644607, -1.598026, -0.6219976, 0.3607843, 1, 0, 1,
-0.6405379, 0.6970893, -0.5594919, 0.3568628, 1, 0, 1,
-0.6368791, -1.518851, -3.681497, 0.3490196, 1, 0, 1,
-0.6345279, -0.6180638, -1.937983, 0.345098, 1, 0, 1,
-0.6322352, 0.3125089, -0.4338685, 0.3372549, 1, 0, 1,
-0.6298049, 0.6153244, 0.387378, 0.3333333, 1, 0, 1,
-0.6257214, -0.7644655, -1.210341, 0.3254902, 1, 0, 1,
-0.6211801, 0.3003404, -2.700341, 0.3215686, 1, 0, 1,
-0.6191368, -1.599445, -1.935787, 0.3137255, 1, 0, 1,
-0.6184233, -2.062645, -1.301621, 0.3098039, 1, 0, 1,
-0.6155068, 0.4763953, -1.092716, 0.3019608, 1, 0, 1,
-0.6132413, -1.248794, -3.413125, 0.2941177, 1, 0, 1,
-0.6097881, 0.7197673, -1.036162, 0.2901961, 1, 0, 1,
-0.6095016, -1.670917, -2.975373, 0.282353, 1, 0, 1,
-0.6015453, -0.1039524, -4.518757, 0.2784314, 1, 0, 1,
-0.5985113, 0.5318397, -0.3580956, 0.2705882, 1, 0, 1,
-0.5974447, -0.01512121, -1.054387, 0.2666667, 1, 0, 1,
-0.5956067, 1.088785, -1.539699, 0.2588235, 1, 0, 1,
-0.5945325, 0.358865, -0.8451306, 0.254902, 1, 0, 1,
-0.589606, -0.06342036, -1.525234, 0.2470588, 1, 0, 1,
-0.5895031, 0.5437537, -0.6770788, 0.2431373, 1, 0, 1,
-0.5822757, -0.1482061, -1.559444, 0.2352941, 1, 0, 1,
-0.5805624, -2.189141, -4.385285, 0.2313726, 1, 0, 1,
-0.575645, -0.2743734, -2.254666, 0.2235294, 1, 0, 1,
-0.5726184, 0.668613, -0.08929006, 0.2196078, 1, 0, 1,
-0.5666481, 0.3860683, -0.2789929, 0.2117647, 1, 0, 1,
-0.5661394, 0.8119276, -1.472228, 0.2078431, 1, 0, 1,
-0.5551465, 0.1853316, -1.787402, 0.2, 1, 0, 1,
-0.5547587, -2.014669, -2.982298, 0.1921569, 1, 0, 1,
-0.5520807, 0.1247049, -1.818742, 0.1882353, 1, 0, 1,
-0.5500693, -1.047349, -2.201089, 0.1803922, 1, 0, 1,
-0.5487531, 0.765062, 0.1032775, 0.1764706, 1, 0, 1,
-0.5480737, 0.9811084, -0.4154523, 0.1686275, 1, 0, 1,
-0.5406747, -1.918961, -1.434883, 0.1647059, 1, 0, 1,
-0.5400834, 0.1339866, -1.495116, 0.1568628, 1, 0, 1,
-0.5375862, 0.5010318, -1.139123, 0.1529412, 1, 0, 1,
-0.5363414, 2.187371, -0.7646058, 0.145098, 1, 0, 1,
-0.534168, -0.4545042, -3.427576, 0.1411765, 1, 0, 1,
-0.5339699, -0.6239789, -2.301315, 0.1333333, 1, 0, 1,
-0.5318634, 0.4607218, -1.185623, 0.1294118, 1, 0, 1,
-0.5310121, 0.5270776, -1.216305, 0.1215686, 1, 0, 1,
-0.5265685, 0.07479344, -0.7175698, 0.1176471, 1, 0, 1,
-0.5224944, 1.645138, -2.382641, 0.1098039, 1, 0, 1,
-0.5130739, 0.2493417, -0.1521062, 0.1058824, 1, 0, 1,
-0.5046278, -0.9357128, -4.463745, 0.09803922, 1, 0, 1,
-0.5018039, 0.8821254, -0.5747332, 0.09019608, 1, 0, 1,
-0.4984123, 0.3027917, 0.92523, 0.08627451, 1, 0, 1,
-0.4941048, -0.09004375, -0.2751342, 0.07843138, 1, 0, 1,
-0.4918883, -0.5963187, -2.865255, 0.07450981, 1, 0, 1,
-0.4858502, -1.162799, -4.611141, 0.06666667, 1, 0, 1,
-0.4824136, 1.355537, 0.03998802, 0.0627451, 1, 0, 1,
-0.4803804, -0.1040536, -1.412879, 0.05490196, 1, 0, 1,
-0.4738876, -0.1750896, -4.385781, 0.05098039, 1, 0, 1,
-0.472254, 2.311016, -0.8782198, 0.04313726, 1, 0, 1,
-0.4709848, -1.199795, -0.7804495, 0.03921569, 1, 0, 1,
-0.468436, -0.7400026, -2.498452, 0.03137255, 1, 0, 1,
-0.456311, 0.4183011, 1.312468, 0.02745098, 1, 0, 1,
-0.452551, 1.293454, -0.04135066, 0.01960784, 1, 0, 1,
-0.4510843, -0.8769209, -2.298947, 0.01568628, 1, 0, 1,
-0.4471399, 1.447229, 1.304134, 0.007843138, 1, 0, 1,
-0.4465886, -0.4742767, -2.406021, 0.003921569, 1, 0, 1,
-0.4454939, 0.2343562, -1.327006, 0, 1, 0.003921569, 1,
-0.4426917, -0.4622662, -1.945935, 0, 1, 0.01176471, 1,
-0.4397205, -2.038589, -2.333669, 0, 1, 0.01568628, 1,
-0.4363124, 0.2670768, 0.05032276, 0, 1, 0.02352941, 1,
-0.435969, -0.7064037, -1.438708, 0, 1, 0.02745098, 1,
-0.4347655, -0.7278174, -1.987791, 0, 1, 0.03529412, 1,
-0.4287201, -0.2502153, -1.495476, 0, 1, 0.03921569, 1,
-0.4258678, -0.08188134, -1.7598, 0, 1, 0.04705882, 1,
-0.4188398, 0.3965559, 0.6647178, 0, 1, 0.05098039, 1,
-0.4144631, -0.1051487, -4.035794, 0, 1, 0.05882353, 1,
-0.4142981, -0.7434367, -1.258261, 0, 1, 0.0627451, 1,
-0.4135146, -0.4060188, -3.175978, 0, 1, 0.07058824, 1,
-0.4115704, 0.416104, -0.9389696, 0, 1, 0.07450981, 1,
-0.4082239, 0.6377224, -0.5418457, 0, 1, 0.08235294, 1,
-0.4042078, -0.214768, -3.25707, 0, 1, 0.08627451, 1,
-0.4007299, 1.886388, -2.189868, 0, 1, 0.09411765, 1,
-0.3989797, -0.2712533, -1.741506, 0, 1, 0.1019608, 1,
-0.3935191, -0.4580327, -2.674643, 0, 1, 0.1058824, 1,
-0.3926246, -0.9441807, -1.808324, 0, 1, 0.1137255, 1,
-0.3917226, -0.8732832, -1.979809, 0, 1, 0.1176471, 1,
-0.390727, -1.469439, -2.547737, 0, 1, 0.1254902, 1,
-0.389312, -0.459456, -4.025194, 0, 1, 0.1294118, 1,
-0.3891797, -0.2862626, -3.179526, 0, 1, 0.1372549, 1,
-0.3889228, 0.2057401, -0.9601786, 0, 1, 0.1411765, 1,
-0.3852037, -0.9728277, -3.605881, 0, 1, 0.1490196, 1,
-0.3811049, 0.6068344, -1.800548, 0, 1, 0.1529412, 1,
-0.3719089, 0.9199313, 0.4660023, 0, 1, 0.1607843, 1,
-0.3683161, -1.559976, -2.403851, 0, 1, 0.1647059, 1,
-0.3662601, 1.292938, -1.08833, 0, 1, 0.172549, 1,
-0.3641216, -0.5256498, -0.9215869, 0, 1, 0.1764706, 1,
-0.360756, 0.5534641, 0.1708556, 0, 1, 0.1843137, 1,
-0.3601795, -0.5914333, -4.228584, 0, 1, 0.1882353, 1,
-0.3599423, 1.9118, -1.471942, 0, 1, 0.1960784, 1,
-0.3596239, -1.724522, -2.233691, 0, 1, 0.2039216, 1,
-0.3590301, 0.5996292, 0.4433187, 0, 1, 0.2078431, 1,
-0.3583179, -0.2640351, -1.734056, 0, 1, 0.2156863, 1,
-0.3543471, -1.817077, -3.594669, 0, 1, 0.2196078, 1,
-0.3524502, 1.250893, -1.266559, 0, 1, 0.227451, 1,
-0.3486165, -0.9438936, -3.116503, 0, 1, 0.2313726, 1,
-0.3427755, -0.2544309, -1.652605, 0, 1, 0.2392157, 1,
-0.3413778, 0.7165352, -1.135936, 0, 1, 0.2431373, 1,
-0.3402166, -0.1336271, -2.522493, 0, 1, 0.2509804, 1,
-0.3382021, -0.2945951, -1.707804, 0, 1, 0.254902, 1,
-0.3341835, -0.2167686, -3.154387, 0, 1, 0.2627451, 1,
-0.3319118, 1.219822, -0.751462, 0, 1, 0.2666667, 1,
-0.3293846, -0.5453807, -3.777677, 0, 1, 0.2745098, 1,
-0.3273907, 0.07223208, -0.5719405, 0, 1, 0.2784314, 1,
-0.3224213, -2.059418, 0.4130527, 0, 1, 0.2862745, 1,
-0.318647, -0.9634342, -2.957279, 0, 1, 0.2901961, 1,
-0.3183697, -1.18448, -4.366534, 0, 1, 0.2980392, 1,
-0.3162923, -0.9362058, -4.247844, 0, 1, 0.3058824, 1,
-0.3151655, 1.152996, -0.6795644, 0, 1, 0.3098039, 1,
-0.3127894, 0.2133957, -0.7549866, 0, 1, 0.3176471, 1,
-0.311416, 0.4242334, -2.09743, 0, 1, 0.3215686, 1,
-0.3106484, -1.54, -3.702132, 0, 1, 0.3294118, 1,
-0.3091105, 0.3873327, -0.5876341, 0, 1, 0.3333333, 1,
-0.3050137, 0.3167922, -0.7567233, 0, 1, 0.3411765, 1,
-0.2969434, 0.395735, 0.04115163, 0, 1, 0.345098, 1,
-0.294507, -0.9910502, -2.434733, 0, 1, 0.3529412, 1,
-0.2939365, -1.437217, -2.372308, 0, 1, 0.3568628, 1,
-0.2914479, 0.9530613, -1.267498, 0, 1, 0.3647059, 1,
-0.291149, -0.8047078, -2.200912, 0, 1, 0.3686275, 1,
-0.289841, 0.3412346, -1.881644, 0, 1, 0.3764706, 1,
-0.2869027, -0.9992616, -3.115108, 0, 1, 0.3803922, 1,
-0.2852852, 0.8866561, 0.05816958, 0, 1, 0.3882353, 1,
-0.2821485, 1.61684, 1.256255, 0, 1, 0.3921569, 1,
-0.2817953, -0.3898976, -2.833401, 0, 1, 0.4, 1,
-0.2795878, 0.3174698, -1.283906, 0, 1, 0.4078431, 1,
-0.2785061, 1.56591, 0.1036884, 0, 1, 0.4117647, 1,
-0.2744184, -0.4253617, -2.703572, 0, 1, 0.4196078, 1,
-0.269112, 0.9952936, 1.893159, 0, 1, 0.4235294, 1,
-0.2670074, -0.8130964, -3.631058, 0, 1, 0.4313726, 1,
-0.2611381, -0.8772637, -1.96953, 0, 1, 0.4352941, 1,
-0.2596404, -2.8635, -1.909389, 0, 1, 0.4431373, 1,
-0.257459, -1.233548, -1.9226, 0, 1, 0.4470588, 1,
-0.2566696, -1.511042, -4.292583, 0, 1, 0.454902, 1,
-0.2558745, -0.9717728, -3.243244, 0, 1, 0.4588235, 1,
-0.251819, -0.8846795, -4.206208, 0, 1, 0.4666667, 1,
-0.2477849, -1.747995, -3.587146, 0, 1, 0.4705882, 1,
-0.2476914, 0.5020641, 0.688283, 0, 1, 0.4784314, 1,
-0.2476226, 0.2374151, 1.903155, 0, 1, 0.4823529, 1,
-0.2441472, -1.621102, -3.896978, 0, 1, 0.4901961, 1,
-0.2409629, -0.3135284, -3.003571, 0, 1, 0.4941176, 1,
-0.2404592, -0.7601836, -3.963582, 0, 1, 0.5019608, 1,
-0.2384911, -1.52856, -5.109426, 0, 1, 0.509804, 1,
-0.2339553, -1.719636, -4.735714, 0, 1, 0.5137255, 1,
-0.232835, 0.5974374, 0.442741, 0, 1, 0.5215687, 1,
-0.2299865, 0.3183265, -0.2443805, 0, 1, 0.5254902, 1,
-0.2285649, -0.2357265, -2.164163, 0, 1, 0.5333334, 1,
-0.2216282, 0.7603837, -0.402754, 0, 1, 0.5372549, 1,
-0.2159174, 0.5320523, -0.6520232, 0, 1, 0.5450981, 1,
-0.2129158, -1.009981, -2.1964, 0, 1, 0.5490196, 1,
-0.2117226, -0.4592541, -3.132238, 0, 1, 0.5568628, 1,
-0.2112868, 1.223426, -0.1105727, 0, 1, 0.5607843, 1,
-0.2043063, 1.031747, 0.3013872, 0, 1, 0.5686275, 1,
-0.2031005, -0.1287887, -2.63322, 0, 1, 0.572549, 1,
-0.201729, 0.06016545, -2.306171, 0, 1, 0.5803922, 1,
-0.2006261, 2.004753, 0.1550186, 0, 1, 0.5843138, 1,
-0.2003876, -1.177116, -3.487833, 0, 1, 0.5921569, 1,
-0.2001416, -0.3143807, -1.446396, 0, 1, 0.5960785, 1,
-0.1946335, 0.3021784, -1.448799, 0, 1, 0.6039216, 1,
-0.1930384, 0.283319, 0.4176858, 0, 1, 0.6117647, 1,
-0.1903283, -0.6030354, -3.625587, 0, 1, 0.6156863, 1,
-0.1890807, -0.04917071, -1.17961, 0, 1, 0.6235294, 1,
-0.1830111, 0.326248, -0.8132753, 0, 1, 0.627451, 1,
-0.1771006, -0.1804716, -1.46499, 0, 1, 0.6352941, 1,
-0.174115, -0.2289992, -2.95655, 0, 1, 0.6392157, 1,
-0.1725715, -0.5913763, -5.207336, 0, 1, 0.6470588, 1,
-0.1659855, -1.197928, -2.377381, 0, 1, 0.6509804, 1,
-0.1652975, 0.4126901, -1.267546, 0, 1, 0.6588235, 1,
-0.1650826, 0.4581994, -0.7913266, 0, 1, 0.6627451, 1,
-0.1646836, -0.6453668, -2.466141, 0, 1, 0.6705883, 1,
-0.1595735, 1.257197, 0.08707783, 0, 1, 0.6745098, 1,
-0.1571519, 0.04235026, -1.006184, 0, 1, 0.682353, 1,
-0.1532063, 0.04682935, -1.820843, 0, 1, 0.6862745, 1,
-0.1511457, -0.1966818, -3.357829, 0, 1, 0.6941177, 1,
-0.1490249, -0.4369923, -1.014039, 0, 1, 0.7019608, 1,
-0.1489358, -0.6264809, -3.118675, 0, 1, 0.7058824, 1,
-0.1432969, 0.4448177, -0.03999433, 0, 1, 0.7137255, 1,
-0.1403224, -0.168698, -1.134457, 0, 1, 0.7176471, 1,
-0.1386705, -0.3516784, -3.157267, 0, 1, 0.7254902, 1,
-0.1383114, -0.3813464, -3.155205, 0, 1, 0.7294118, 1,
-0.1324987, 0.3583098, -0.6054233, 0, 1, 0.7372549, 1,
-0.1309737, 0.4522691, 0.5518842, 0, 1, 0.7411765, 1,
-0.1301251, -3.216905, -1.703024, 0, 1, 0.7490196, 1,
-0.1282487, 2.159779, 0.6866222, 0, 1, 0.7529412, 1,
-0.1280534, -0.9371589, -1.75977, 0, 1, 0.7607843, 1,
-0.1239179, -0.3918794, -1.760649, 0, 1, 0.7647059, 1,
-0.1235878, 2.695417, -0.006817792, 0, 1, 0.772549, 1,
-0.1230729, 1.169644, -0.1772483, 0, 1, 0.7764706, 1,
-0.1190543, -0.1621535, -1.626514, 0, 1, 0.7843137, 1,
-0.1169655, 1.590091, -1.136734, 0, 1, 0.7882353, 1,
-0.112637, 0.2594675, -1.101158, 0, 1, 0.7960784, 1,
-0.1114739, 0.3955145, -0.415149, 0, 1, 0.8039216, 1,
-0.1110655, -1.988199, -4.144304, 0, 1, 0.8078431, 1,
-0.1071945, -0.7206362, -2.252658, 0, 1, 0.8156863, 1,
-0.1027826, -0.1879779, -2.539629, 0, 1, 0.8196079, 1,
-0.1023496, 0.6612294, -0.1021293, 0, 1, 0.827451, 1,
-0.1023059, 1.246072, 0.1685411, 0, 1, 0.8313726, 1,
-0.1017051, 0.9515112, 1.360177, 0, 1, 0.8392157, 1,
-0.100473, -0.2811515, -2.2269, 0, 1, 0.8431373, 1,
-0.0968829, -0.3978823, -2.036756, 0, 1, 0.8509804, 1,
-0.09145485, -0.298717, -1.79068, 0, 1, 0.854902, 1,
-0.08911258, 2.174903, -0.9101635, 0, 1, 0.8627451, 1,
-0.08892228, -0.2840163, -3.783752, 0, 1, 0.8666667, 1,
-0.08846403, -0.6262238, -3.364838, 0, 1, 0.8745098, 1,
-0.08462021, 0.5999036, -0.2715199, 0, 1, 0.8784314, 1,
-0.08354534, 0.52019, -0.6217558, 0, 1, 0.8862745, 1,
-0.08260851, -0.1892526, -3.04122, 0, 1, 0.8901961, 1,
-0.08032724, 0.2489351, -0.2265426, 0, 1, 0.8980392, 1,
-0.07436599, -0.1703711, -4.695947, 0, 1, 0.9058824, 1,
-0.07021861, 1.052819, -0.9851316, 0, 1, 0.9098039, 1,
-0.06784115, 0.3670702, -0.4506071, 0, 1, 0.9176471, 1,
-0.0656053, 0.02734398, -1.560171, 0, 1, 0.9215686, 1,
-0.06494216, 1.513923, -0.5522447, 0, 1, 0.9294118, 1,
-0.05760603, -0.3681004, -0.3028804, 0, 1, 0.9333333, 1,
-0.05384946, 0.2443212, -0.8169042, 0, 1, 0.9411765, 1,
-0.05277139, -2.476145, -3.944971, 0, 1, 0.945098, 1,
-0.05241124, -0.2243335, -2.762911, 0, 1, 0.9529412, 1,
-0.05230211, -0.8907591, -0.1857273, 0, 1, 0.9568627, 1,
-0.05067641, -0.3487521, -1.73872, 0, 1, 0.9647059, 1,
-0.04645644, -0.2066477, -1.738568, 0, 1, 0.9686275, 1,
-0.04514609, 0.4565205, -2.573391, 0, 1, 0.9764706, 1,
-0.04412619, 0.5270934, -0.8959493, 0, 1, 0.9803922, 1,
-0.04394945, -1.057177, -3.945043, 0, 1, 0.9882353, 1,
-0.03847818, 2.100415, 0.3546028, 0, 1, 0.9921569, 1,
-0.03813209, -1.639632, -3.665591, 0, 1, 1, 1,
-0.03631901, -1.246059, -4.105014, 0, 0.9921569, 1, 1,
-0.0343306, -1.335643, -2.378299, 0, 0.9882353, 1, 1,
-0.02959693, -1.121393, -3.387538, 0, 0.9803922, 1, 1,
-0.02805452, -2.667712, -4.080582, 0, 0.9764706, 1, 1,
-0.02402413, 0.3576467, -0.4275133, 0, 0.9686275, 1, 1,
-0.02131332, -0.9225456, -3.524088, 0, 0.9647059, 1, 1,
-0.01202223, 0.7676283, 0.9930601, 0, 0.9568627, 1, 1,
-0.007848802, 1.73957, -1.605389, 0, 0.9529412, 1, 1,
-0.006559576, 0.2904983, -0.8183216, 0, 0.945098, 1, 1,
-0.006521332, 0.8177555, -0.7847555, 0, 0.9411765, 1, 1,
-0.003019447, -0.2665944, -2.327175, 0, 0.9333333, 1, 1,
0.01489476, 1.309629, -0.5139722, 0, 0.9294118, 1, 1,
0.01747792, -0.2322215, 0.5225917, 0, 0.9215686, 1, 1,
0.01767583, 1.3838, -0.07764728, 0, 0.9176471, 1, 1,
0.02029494, -1.842491, 2.240744, 0, 0.9098039, 1, 1,
0.0213342, -0.4632168, 2.282367, 0, 0.9058824, 1, 1,
0.02169298, -0.2022444, 2.659564, 0, 0.8980392, 1, 1,
0.02470195, 0.2827509, 1.047952, 0, 0.8901961, 1, 1,
0.02712855, 0.07221211, 0.01170095, 0, 0.8862745, 1, 1,
0.02893552, 0.3049099, 0.6082103, 0, 0.8784314, 1, 1,
0.03452287, -0.7291694, 2.043812, 0, 0.8745098, 1, 1,
0.03849059, -2.18599, 2.863309, 0, 0.8666667, 1, 1,
0.03869969, -0.08457355, 1.053095, 0, 0.8627451, 1, 1,
0.03980928, -0.0880326, 3.319892, 0, 0.854902, 1, 1,
0.04102725, -0.7574588, 2.491612, 0, 0.8509804, 1, 1,
0.04801892, 0.2406141, 0.3451487, 0, 0.8431373, 1, 1,
0.04971359, -0.4597131, 2.672094, 0, 0.8392157, 1, 1,
0.05256409, -0.8716488, 1.454258, 0, 0.8313726, 1, 1,
0.06218852, 0.4087809, -1.607906, 0, 0.827451, 1, 1,
0.06685448, 0.5320166, 0.6827409, 0, 0.8196079, 1, 1,
0.07149113, -0.6156684, 2.780671, 0, 0.8156863, 1, 1,
0.07180884, 0.871817, 1.744733, 0, 0.8078431, 1, 1,
0.07289216, -0.05891042, 2.178341, 0, 0.8039216, 1, 1,
0.07654135, 0.5255275, -0.853986, 0, 0.7960784, 1, 1,
0.08418335, 0.5463021, -0.1337543, 0, 0.7882353, 1, 1,
0.09018801, -0.1001248, 0.7986017, 0, 0.7843137, 1, 1,
0.09133712, 1.175125, -0.2112776, 0, 0.7764706, 1, 1,
0.0936774, 1.949101, 0.7773924, 0, 0.772549, 1, 1,
0.0991409, 0.9553981, -1.544629, 0, 0.7647059, 1, 1,
0.1008809, -2.429242, 1.91985, 0, 0.7607843, 1, 1,
0.1029508, 1.179693, -0.9153059, 0, 0.7529412, 1, 1,
0.1035918, 1.028123, 0.5194036, 0, 0.7490196, 1, 1,
0.1068808, 0.9382029, -0.3544601, 0, 0.7411765, 1, 1,
0.1071621, -0.5975479, 2.497485, 0, 0.7372549, 1, 1,
0.1092039, 0.7102351, 0.5841444, 0, 0.7294118, 1, 1,
0.1178562, 0.2370244, 1.159628, 0, 0.7254902, 1, 1,
0.1190298, 0.1679248, 0.3648798, 0, 0.7176471, 1, 1,
0.1244157, -1.10026, 1.86597, 0, 0.7137255, 1, 1,
0.1247316, 2.25563, 1.213045, 0, 0.7058824, 1, 1,
0.1250978, 0.5124074, 1.171697, 0, 0.6980392, 1, 1,
0.1253455, -0.636735, 3.944801, 0, 0.6941177, 1, 1,
0.1278186, -0.3180695, 2.953832, 0, 0.6862745, 1, 1,
0.13112, 0.2028143, 0.2762695, 0, 0.682353, 1, 1,
0.1314434, 0.4529115, 1.990189, 0, 0.6745098, 1, 1,
0.1338264, -0.9138656, 2.211913, 0, 0.6705883, 1, 1,
0.1343041, -0.116863, 0.2468608, 0, 0.6627451, 1, 1,
0.1354224, 1.829087, 0.1607287, 0, 0.6588235, 1, 1,
0.1376435, 0.8958812, 0.5771018, 0, 0.6509804, 1, 1,
0.1435279, -0.593653, 3.155448, 0, 0.6470588, 1, 1,
0.1454067, 0.4619657, 0.5973849, 0, 0.6392157, 1, 1,
0.1461433, 0.2155498, 3.116787, 0, 0.6352941, 1, 1,
0.147056, 1.167843, 0.6023718, 0, 0.627451, 1, 1,
0.1527246, 0.7693483, 0.1620928, 0, 0.6235294, 1, 1,
0.1610106, 0.9127296, -2.142793, 0, 0.6156863, 1, 1,
0.1695167, 0.6746876, 1.652189, 0, 0.6117647, 1, 1,
0.171682, 0.579956, -1.044947, 0, 0.6039216, 1, 1,
0.1726123, 1.06653, 0.1883408, 0, 0.5960785, 1, 1,
0.1751909, -0.2943483, 1.696037, 0, 0.5921569, 1, 1,
0.1757419, -0.4923676, 3.149573, 0, 0.5843138, 1, 1,
0.1757424, 0.4659879, 0.4418864, 0, 0.5803922, 1, 1,
0.1757883, -0.449293, 2.537778, 0, 0.572549, 1, 1,
0.1792348, 1.193625, 0.6314303, 0, 0.5686275, 1, 1,
0.1796272, 1.10425, 0.4535663, 0, 0.5607843, 1, 1,
0.1823605, 1.016075, 0.4615234, 0, 0.5568628, 1, 1,
0.1829331, -0.4034679, 2.853256, 0, 0.5490196, 1, 1,
0.1845348, -0.4452591, 1.291872, 0, 0.5450981, 1, 1,
0.1857523, -0.8946049, 2.566916, 0, 0.5372549, 1, 1,
0.1908574, 0.5603136, 0.8747485, 0, 0.5333334, 1, 1,
0.190964, 0.645631, 0.2878255, 0, 0.5254902, 1, 1,
0.1926768, 0.4137765, 1.438162, 0, 0.5215687, 1, 1,
0.1936008, -0.06413596, 1.441869, 0, 0.5137255, 1, 1,
0.1991055, 0.6456956, 2.186142, 0, 0.509804, 1, 1,
0.2035168, 0.5149925, 0.05211603, 0, 0.5019608, 1, 1,
0.2043596, -0.9886724, 2.781663, 0, 0.4941176, 1, 1,
0.2059683, 1.218374, -0.5387784, 0, 0.4901961, 1, 1,
0.2069077, -1.216239, 3.156715, 0, 0.4823529, 1, 1,
0.2083122, -1.217368, 1.938587, 0, 0.4784314, 1, 1,
0.2125396, -0.8720749, 0.5700453, 0, 0.4705882, 1, 1,
0.215337, 0.3337719, -0.4863611, 0, 0.4666667, 1, 1,
0.2242614, -0.8188925, 2.252873, 0, 0.4588235, 1, 1,
0.2268239, 1.086776, -0.02874114, 0, 0.454902, 1, 1,
0.2277849, 1.037712, -0.5979925, 0, 0.4470588, 1, 1,
0.2310697, 1.204158, -0.172175, 0, 0.4431373, 1, 1,
0.2335422, -0.1590275, 0.1640958, 0, 0.4352941, 1, 1,
0.2353157, -1.294613, 3.352615, 0, 0.4313726, 1, 1,
0.2355655, -0.5176883, 1.603384, 0, 0.4235294, 1, 1,
0.2355658, 0.9594744, 1.374313, 0, 0.4196078, 1, 1,
0.2365394, 0.7472082, 0.3764769, 0, 0.4117647, 1, 1,
0.237273, 0.9463044, 1.450898, 0, 0.4078431, 1, 1,
0.2420475, -0.2388499, 2.61996, 0, 0.4, 1, 1,
0.2422896, 0.8668854, 0.8685505, 0, 0.3921569, 1, 1,
0.2434155, -0.5140464, 3.006596, 0, 0.3882353, 1, 1,
0.243915, 0.7326331, -1.079251, 0, 0.3803922, 1, 1,
0.2448473, -1.837585, 2.128916, 0, 0.3764706, 1, 1,
0.2454582, 0.9519794, -0.05351381, 0, 0.3686275, 1, 1,
0.251565, -0.7240781, 1.687703, 0, 0.3647059, 1, 1,
0.2553183, 0.2622492, 0.6156875, 0, 0.3568628, 1, 1,
0.2580158, -0.8711722, 2.747383, 0, 0.3529412, 1, 1,
0.2588345, 1.237713, 0.3885855, 0, 0.345098, 1, 1,
0.2665114, 0.0785623, 1.426714, 0, 0.3411765, 1, 1,
0.267247, 0.03645634, 1.297823, 0, 0.3333333, 1, 1,
0.2708555, 0.213202, 1.821987, 0, 0.3294118, 1, 1,
0.2714499, -2.153449, 1.061709, 0, 0.3215686, 1, 1,
0.27263, -1.746205, 2.287754, 0, 0.3176471, 1, 1,
0.2806729, -0.6501848, 3.233733, 0, 0.3098039, 1, 1,
0.288423, 1.974994, -0.06749979, 0, 0.3058824, 1, 1,
0.2885415, 1.347582, 1.275957, 0, 0.2980392, 1, 1,
0.2886392, 0.1089708, 1.268199, 0, 0.2901961, 1, 1,
0.2898283, 0.4616129, 1.303459, 0, 0.2862745, 1, 1,
0.2907006, -1.801654, 4.159747, 0, 0.2784314, 1, 1,
0.2945611, 0.2487515, 1.376455, 0, 0.2745098, 1, 1,
0.3002502, -2.720778, 1.367803, 0, 0.2666667, 1, 1,
0.3013057, 0.04196206, 2.968796, 0, 0.2627451, 1, 1,
0.3015856, -0.109591, 1.32616, 0, 0.254902, 1, 1,
0.3022391, 0.1347445, 1.089057, 0, 0.2509804, 1, 1,
0.3026532, 1.566635, 1.596137, 0, 0.2431373, 1, 1,
0.3093481, -1.290917, 4.66318, 0, 0.2392157, 1, 1,
0.3122488, -0.1769219, 2.389743, 0, 0.2313726, 1, 1,
0.3129861, -0.2902569, -0.4862013, 0, 0.227451, 1, 1,
0.3175659, -0.2943376, 3.693614, 0, 0.2196078, 1, 1,
0.3198052, -0.9768668, 3.590396, 0, 0.2156863, 1, 1,
0.3199731, -0.2322641, 3.554657, 0, 0.2078431, 1, 1,
0.320385, 1.068502, 1.547444, 0, 0.2039216, 1, 1,
0.323628, 0.6044903, 0.3561499, 0, 0.1960784, 1, 1,
0.3249418, -0.959901, 2.553167, 0, 0.1882353, 1, 1,
0.3256027, 1.572471, -0.1955623, 0, 0.1843137, 1, 1,
0.3287095, -0.9113997, 2.792327, 0, 0.1764706, 1, 1,
0.3291486, -1.455898, 4.00302, 0, 0.172549, 1, 1,
0.3291669, -1.328871, 1.258977, 0, 0.1647059, 1, 1,
0.32951, 1.218734, 0.2390282, 0, 0.1607843, 1, 1,
0.3321937, 1.222548, 0.8446222, 0, 0.1529412, 1, 1,
0.335706, -0.05204948, 2.40554, 0, 0.1490196, 1, 1,
0.3423682, 0.6961755, 0.5739207, 0, 0.1411765, 1, 1,
0.343285, -0.8569097, 2.316831, 0, 0.1372549, 1, 1,
0.3453899, -1.249002, 2.938687, 0, 0.1294118, 1, 1,
0.3467087, -2.110495, 2.659915, 0, 0.1254902, 1, 1,
0.3471912, -0.8901581, 2.012733, 0, 0.1176471, 1, 1,
0.34874, -0.8174857, 2.802783, 0, 0.1137255, 1, 1,
0.3500975, -0.2439466, 1.664985, 0, 0.1058824, 1, 1,
0.3538423, -0.6101561, 0.4727751, 0, 0.09803922, 1, 1,
0.3555906, -0.335511, 1.931232, 0, 0.09411765, 1, 1,
0.3600212, -1.022574, 3.407815, 0, 0.08627451, 1, 1,
0.3618462, 0.7579762, -0.4097209, 0, 0.08235294, 1, 1,
0.3720693, -0.8474723, 3.341546, 0, 0.07450981, 1, 1,
0.3721628, 0.5989544, 0.09879266, 0, 0.07058824, 1, 1,
0.3725439, 0.2743591, 2.46623, 0, 0.0627451, 1, 1,
0.3729454, -0.321559, -0.2181809, 0, 0.05882353, 1, 1,
0.3767953, -0.5520793, 2.386204, 0, 0.05098039, 1, 1,
0.3829333, -0.3303183, 2.90636, 0, 0.04705882, 1, 1,
0.3850206, 0.4294976, -0.06431819, 0, 0.03921569, 1, 1,
0.3878058, 1.171659, -1.399227, 0, 0.03529412, 1, 1,
0.3934782, 0.1273707, 1.958147, 0, 0.02745098, 1, 1,
0.3936612, 0.06395778, 0.6765964, 0, 0.02352941, 1, 1,
0.3982753, -0.5333332, 0.4491227, 0, 0.01568628, 1, 1,
0.4075866, 0.09356897, 1.291613, 0, 0.01176471, 1, 1,
0.4081299, 0.1507125, 0.8026045, 0, 0.003921569, 1, 1,
0.4185914, -0.3255313, -0.04958006, 0.003921569, 0, 1, 1,
0.4191804, -0.5849321, 2.873691, 0.007843138, 0, 1, 1,
0.424897, 0.8207341, 1.529803, 0.01568628, 0, 1, 1,
0.425028, -0.7081672, 0.835051, 0.01960784, 0, 1, 1,
0.4264745, 0.2373239, 0.3706078, 0.02745098, 0, 1, 1,
0.4266588, -1.159464, 4.289575, 0.03137255, 0, 1, 1,
0.4269603, 2.452538, 0.4486116, 0.03921569, 0, 1, 1,
0.4282828, -0.653559, 2.79437, 0.04313726, 0, 1, 1,
0.432975, 0.5315537, 0.03746014, 0.05098039, 0, 1, 1,
0.4356926, -0.7733423, 3.781355, 0.05490196, 0, 1, 1,
0.435769, 0.9363701, 0.5393794, 0.0627451, 0, 1, 1,
0.4364125, -0.6209706, 2.822626, 0.06666667, 0, 1, 1,
0.4379792, 0.08278205, 0.3519855, 0.07450981, 0, 1, 1,
0.4390409, 0.7377666, -0.7556139, 0.07843138, 0, 1, 1,
0.4391636, 0.4953052, 1.416597, 0.08627451, 0, 1, 1,
0.4393734, -1.862636, 2.266979, 0.09019608, 0, 1, 1,
0.4442988, 0.5497887, 1.40234, 0.09803922, 0, 1, 1,
0.446017, -0.2331235, 1.727493, 0.1058824, 0, 1, 1,
0.4460797, 0.6476948, 2.691307, 0.1098039, 0, 1, 1,
0.447261, 0.9619811, 1.25656, 0.1176471, 0, 1, 1,
0.4476489, -1.991039, 2.162414, 0.1215686, 0, 1, 1,
0.4508324, -0.8928323, 1.862284, 0.1294118, 0, 1, 1,
0.4536847, 0.574236, 0.6125852, 0.1333333, 0, 1, 1,
0.4594722, 0.2191992, 1.519235, 0.1411765, 0, 1, 1,
0.4633471, -1.246847, 3.211163, 0.145098, 0, 1, 1,
0.463396, -1.296089, 2.199134, 0.1529412, 0, 1, 1,
0.4681658, 0.326074, 0.9147679, 0.1568628, 0, 1, 1,
0.4714655, 1.330559, 0.7169803, 0.1647059, 0, 1, 1,
0.4719587, 1.280711, 0.2115909, 0.1686275, 0, 1, 1,
0.4801698, 0.6365811, 2.699223, 0.1764706, 0, 1, 1,
0.488469, -0.6888697, 2.363291, 0.1803922, 0, 1, 1,
0.4962305, -0.8907489, 3.85443, 0.1882353, 0, 1, 1,
0.4996563, -1.053913, 2.898066, 0.1921569, 0, 1, 1,
0.5035877, 0.4363454, 1.208355, 0.2, 0, 1, 1,
0.5085021, -0.3924532, 3.414825, 0.2078431, 0, 1, 1,
0.5143023, -0.4689767, 1.274049, 0.2117647, 0, 1, 1,
0.5169119, 1.168767, -0.7683493, 0.2196078, 0, 1, 1,
0.5196992, -0.4431356, 1.449413, 0.2235294, 0, 1, 1,
0.5230281, -0.6039312, 2.874904, 0.2313726, 0, 1, 1,
0.5265077, -0.1462849, 2.841464, 0.2352941, 0, 1, 1,
0.526613, 1.666964, 1.443894, 0.2431373, 0, 1, 1,
0.5268534, -0.1108094, 1.289114, 0.2470588, 0, 1, 1,
0.5333488, -0.5208228, 2.329112, 0.254902, 0, 1, 1,
0.5422152, -0.8614347, 2.657833, 0.2588235, 0, 1, 1,
0.5451383, -1.64534, 3.403051, 0.2666667, 0, 1, 1,
0.5457896, -0.7931271, 1.792634, 0.2705882, 0, 1, 1,
0.5477252, -1.229154, 1.292196, 0.2784314, 0, 1, 1,
0.5496683, -0.723155, 1.525668, 0.282353, 0, 1, 1,
0.5522562, -0.325826, 0.05950184, 0.2901961, 0, 1, 1,
0.5543367, 0.6230511, 1.084199, 0.2941177, 0, 1, 1,
0.5569769, 0.6753604, 2.148984, 0.3019608, 0, 1, 1,
0.5594144, 0.3119648, 1.148847, 0.3098039, 0, 1, 1,
0.5661312, -0.566452, 1.609415, 0.3137255, 0, 1, 1,
0.5709255, -0.9196051, 0.6911997, 0.3215686, 0, 1, 1,
0.5712998, -0.6046183, 1.816262, 0.3254902, 0, 1, 1,
0.5721912, -0.9545991, 1.775558, 0.3333333, 0, 1, 1,
0.5767652, -0.3538698, 3.202858, 0.3372549, 0, 1, 1,
0.5788214, 1.275285, 0.4464791, 0.345098, 0, 1, 1,
0.5802684, -0.7071258, 2.296196, 0.3490196, 0, 1, 1,
0.5809149, 0.02150157, 3.311822, 0.3568628, 0, 1, 1,
0.5833689, 0.02941243, 2.091917, 0.3607843, 0, 1, 1,
0.5888149, -1.666931, 4.390782, 0.3686275, 0, 1, 1,
0.5914089, -0.6871871, 3.377072, 0.372549, 0, 1, 1,
0.5938622, 1.53744, -0.5513139, 0.3803922, 0, 1, 1,
0.5977317, 0.8732277, 1.476984, 0.3843137, 0, 1, 1,
0.6074658, -1.912007, 1.786671, 0.3921569, 0, 1, 1,
0.6300676, 0.4609086, 2.536221, 0.3960784, 0, 1, 1,
0.6330938, -0.8641317, 0.5798759, 0.4039216, 0, 1, 1,
0.6341923, 1.341571, 0.2908376, 0.4117647, 0, 1, 1,
0.6358588, -0.8135104, 2.850404, 0.4156863, 0, 1, 1,
0.6394407, 0.3148451, -0.2800434, 0.4235294, 0, 1, 1,
0.6406429, -0.2785915, 3.14429, 0.427451, 0, 1, 1,
0.648365, 0.5630387, 1.510467, 0.4352941, 0, 1, 1,
0.6485615, -0.248217, 2.339638, 0.4392157, 0, 1, 1,
0.6507888, 1.148735, 0.3627443, 0.4470588, 0, 1, 1,
0.6508986, 0.02168814, 1.057197, 0.4509804, 0, 1, 1,
0.6527774, 1.76314, -1.174042, 0.4588235, 0, 1, 1,
0.6548432, 0.5384079, -0.1117228, 0.4627451, 0, 1, 1,
0.6573067, -1.858641, 2.820683, 0.4705882, 0, 1, 1,
0.6586816, -0.08004881, 2.274144, 0.4745098, 0, 1, 1,
0.662519, 1.809566, 0.5510297, 0.4823529, 0, 1, 1,
0.6641999, -0.3135489, 4.276693, 0.4862745, 0, 1, 1,
0.6668176, -0.1070448, 2.45015, 0.4941176, 0, 1, 1,
0.6684578, 0.8240783, 1.307653, 0.5019608, 0, 1, 1,
0.6718062, 0.05974836, 2.413637, 0.5058824, 0, 1, 1,
0.6738485, 0.1357574, 0.4156134, 0.5137255, 0, 1, 1,
0.6755617, 0.1811463, 0.6791815, 0.5176471, 0, 1, 1,
0.6891895, -0.1869409, 0.4644734, 0.5254902, 0, 1, 1,
0.6991099, -0.2980772, 3.010912, 0.5294118, 0, 1, 1,
0.6995522, -2.08056, 5.174689, 0.5372549, 0, 1, 1,
0.7046909, 0.7659754, 1.816259, 0.5411765, 0, 1, 1,
0.7055685, -1.045189, 2.213726, 0.5490196, 0, 1, 1,
0.7064005, 1.129347, -0.6233585, 0.5529412, 0, 1, 1,
0.7084862, 0.5910931, 2.382642, 0.5607843, 0, 1, 1,
0.7119705, 1.888139, -0.4393075, 0.5647059, 0, 1, 1,
0.7121078, 0.22712, 2.18216, 0.572549, 0, 1, 1,
0.7131161, -0.41839, 1.745399, 0.5764706, 0, 1, 1,
0.715914, 0.4900311, 1.338569, 0.5843138, 0, 1, 1,
0.7191887, 0.7533084, 0.5710708, 0.5882353, 0, 1, 1,
0.7200503, -0.7885253, 3.387766, 0.5960785, 0, 1, 1,
0.723369, -1.530164, 2.675784, 0.6039216, 0, 1, 1,
0.7305471, 0.2012052, 1.189907, 0.6078432, 0, 1, 1,
0.7308468, 0.9685062, 1.652194, 0.6156863, 0, 1, 1,
0.7328668, 0.1759402, 1.001148, 0.6196079, 0, 1, 1,
0.744879, -2.687562, 3.584211, 0.627451, 0, 1, 1,
0.7481842, -0.6134291, 3.794606, 0.6313726, 0, 1, 1,
0.7559117, -0.6783658, 1.293722, 0.6392157, 0, 1, 1,
0.7572005, 0.4501243, 1.460814, 0.6431373, 0, 1, 1,
0.7600561, 0.1186743, 1.879978, 0.6509804, 0, 1, 1,
0.7647636, -3.020325, 1.36588, 0.654902, 0, 1, 1,
0.7655488, 0.395296, 1.155802, 0.6627451, 0, 1, 1,
0.7675994, 0.2912942, 0.7758718, 0.6666667, 0, 1, 1,
0.7684214, -1.081212, 1.442115, 0.6745098, 0, 1, 1,
0.7723604, -0.1840325, 2.47399, 0.6784314, 0, 1, 1,
0.7736755, -0.6640695, 2.460515, 0.6862745, 0, 1, 1,
0.7770835, -0.5759887, 3.883347, 0.6901961, 0, 1, 1,
0.7780321, -0.4952902, 2.858688, 0.6980392, 0, 1, 1,
0.7828702, -1.738058, 2.804572, 0.7058824, 0, 1, 1,
0.7863807, 1.751985, 0.417169, 0.7098039, 0, 1, 1,
0.7879552, 0.06588493, 1.652836, 0.7176471, 0, 1, 1,
0.7970704, -0.700335, 2.809251, 0.7215686, 0, 1, 1,
0.8064439, -0.3704793, 2.696027, 0.7294118, 0, 1, 1,
0.8074599, -0.5442899, 2.043064, 0.7333333, 0, 1, 1,
0.8141282, -0.09439933, 0.7863725, 0.7411765, 0, 1, 1,
0.8257822, 0.4851511, 2.426925, 0.7450981, 0, 1, 1,
0.8289593, -0.223894, 1.915893, 0.7529412, 0, 1, 1,
0.8298962, -1.645864, 3.796623, 0.7568628, 0, 1, 1,
0.8320819, 0.8773082, 1.665752, 0.7647059, 0, 1, 1,
0.8338445, 0.8590639, 1.555584, 0.7686275, 0, 1, 1,
0.8416135, -0.2786299, 3.327704, 0.7764706, 0, 1, 1,
0.8465009, -0.9594933, 2.648638, 0.7803922, 0, 1, 1,
0.8545511, 0.4135075, -0.2260489, 0.7882353, 0, 1, 1,
0.8634409, -0.4435475, 1.761008, 0.7921569, 0, 1, 1,
0.8656579, -0.8588905, 3.85984, 0.8, 0, 1, 1,
0.868467, -1.723059, 3.236423, 0.8078431, 0, 1, 1,
0.8727468, -1.638371, 3.957511, 0.8117647, 0, 1, 1,
0.8749061, 1.0676, 0.6986081, 0.8196079, 0, 1, 1,
0.8758416, -0.09264363, 2.6615, 0.8235294, 0, 1, 1,
0.8764064, -1.053826, 2.805274, 0.8313726, 0, 1, 1,
0.8766317, 1.778103, 0.1340816, 0.8352941, 0, 1, 1,
0.8861352, -1.28797, 2.14011, 0.8431373, 0, 1, 1,
0.8871492, 1.043513, 1.648873, 0.8470588, 0, 1, 1,
0.8890885, -0.042491, 0.1051352, 0.854902, 0, 1, 1,
0.8895246, 0.7324767, 0.3381032, 0.8588235, 0, 1, 1,
0.8934298, 0.0780059, 1.857969, 0.8666667, 0, 1, 1,
0.8936197, -0.2717057, 3.458145, 0.8705882, 0, 1, 1,
0.9011276, 0.4552816, 0.9166206, 0.8784314, 0, 1, 1,
0.9025437, 1.973196, 0.1557231, 0.8823529, 0, 1, 1,
0.9072871, 1.400891, 1.534489, 0.8901961, 0, 1, 1,
0.9077075, -1.695288, 1.878081, 0.8941177, 0, 1, 1,
0.9107257, -1.27826, 1.313873, 0.9019608, 0, 1, 1,
0.9115871, 1.011703, -0.8740302, 0.9098039, 0, 1, 1,
0.9259552, 0.5829393, -0.2133531, 0.9137255, 0, 1, 1,
0.9270583, 0.3679723, 1.385833, 0.9215686, 0, 1, 1,
0.9309831, -0.1278941, 3.080188, 0.9254902, 0, 1, 1,
0.9405105, 0.923635, 0.6536723, 0.9333333, 0, 1, 1,
0.9538166, -0.04581399, 1.082235, 0.9372549, 0, 1, 1,
0.9544979, 0.5895407, 1.338819, 0.945098, 0, 1, 1,
0.9561543, -0.5917885, 1.625319, 0.9490196, 0, 1, 1,
0.9591832, 1.128155, 1.526644, 0.9568627, 0, 1, 1,
0.9611104, -0.6451614, 2.1058, 0.9607843, 0, 1, 1,
0.9653797, 0.4616081, 0.171965, 0.9686275, 0, 1, 1,
0.9697959, -3.13029, 2.270528, 0.972549, 0, 1, 1,
0.9747022, 0.05979539, 1.868001, 0.9803922, 0, 1, 1,
0.9846255, 1.60171, 0.7055171, 0.9843137, 0, 1, 1,
0.991232, -0.9025376, 2.688436, 0.9921569, 0, 1, 1,
1.006753, -1.521126, 2.963593, 0.9960784, 0, 1, 1,
1.009228, -0.03597244, 1.488693, 1, 0, 0.9960784, 1,
1.016806, -0.6760657, 3.130588, 1, 0, 0.9882353, 1,
1.022329, -0.4417336, 1.947878, 1, 0, 0.9843137, 1,
1.029138, 0.9008043, 2.201092, 1, 0, 0.9764706, 1,
1.031709, -1.955513, 2.428943, 1, 0, 0.972549, 1,
1.036809, -0.8033445, 2.943142, 1, 0, 0.9647059, 1,
1.038084, -0.311409, 4.625877, 1, 0, 0.9607843, 1,
1.041058, -0.9611434, 2.360714, 1, 0, 0.9529412, 1,
1.044635, -0.4967132, 0.5295222, 1, 0, 0.9490196, 1,
1.051347, 0.1539118, 2.33408, 1, 0, 0.9411765, 1,
1.051654, 2.193443, 0.4426364, 1, 0, 0.9372549, 1,
1.058701, 0.6272717, 2.985137, 1, 0, 0.9294118, 1,
1.061478, -0.1621986, 1.412557, 1, 0, 0.9254902, 1,
1.069117, -0.7885522, 1.721128, 1, 0, 0.9176471, 1,
1.069371, -0.9128687, 1.971376, 1, 0, 0.9137255, 1,
1.07173, 0.6769123, 1.97161, 1, 0, 0.9058824, 1,
1.07363, 0.2185708, 0.3437096, 1, 0, 0.9019608, 1,
1.076807, -1.472738, 3.047168, 1, 0, 0.8941177, 1,
1.081787, -0.917847, 3.615685, 1, 0, 0.8862745, 1,
1.089208, 0.8778926, 0.2766761, 1, 0, 0.8823529, 1,
1.090054, -0.8787212, 1.426556, 1, 0, 0.8745098, 1,
1.091346, -0.3739825, 2.411993, 1, 0, 0.8705882, 1,
1.096198, -1.195136, 3.957797, 1, 0, 0.8627451, 1,
1.096311, -1.285499, 3.096343, 1, 0, 0.8588235, 1,
1.097121, 0.1489007, 2.119397, 1, 0, 0.8509804, 1,
1.097325, 1.699266, 0.7449708, 1, 0, 0.8470588, 1,
1.101811, 0.3208455, 1.877724, 1, 0, 0.8392157, 1,
1.107138, -1.262913, 1.409935, 1, 0, 0.8352941, 1,
1.109668, 0.6564795, 0.366573, 1, 0, 0.827451, 1,
1.114853, -0.9819706, 1.172599, 1, 0, 0.8235294, 1,
1.117269, 0.4432611, 1.3525, 1, 0, 0.8156863, 1,
1.127009, 0.2673633, 3.357635, 1, 0, 0.8117647, 1,
1.130878, 0.6036527, 1.725088, 1, 0, 0.8039216, 1,
1.136289, 0.3128495, 2.388477, 1, 0, 0.7960784, 1,
1.137577, 0.2565857, -0.336109, 1, 0, 0.7921569, 1,
1.140915, -0.2517565, 2.030082, 1, 0, 0.7843137, 1,
1.161163, 0.328499, -0.1639843, 1, 0, 0.7803922, 1,
1.165049, -0.6793184, 2.229751, 1, 0, 0.772549, 1,
1.170725, -0.03085409, 2.044286, 1, 0, 0.7686275, 1,
1.179907, -0.3032768, 1.741727, 1, 0, 0.7607843, 1,
1.184446, -2.699247, 2.631446, 1, 0, 0.7568628, 1,
1.185889, 0.1779775, 1.231344, 1, 0, 0.7490196, 1,
1.189139, 1.658095, 0.4784655, 1, 0, 0.7450981, 1,
1.192854, 0.3232778, 1.02318, 1, 0, 0.7372549, 1,
1.193506, 0.6828057, 1.073739, 1, 0, 0.7333333, 1,
1.197429, -0.7318345, 1.14436, 1, 0, 0.7254902, 1,
1.202532, 1.339417, 0.6711043, 1, 0, 0.7215686, 1,
1.212245, 0.02224461, 2.161528, 1, 0, 0.7137255, 1,
1.217236, 0.2160976, 1.885386, 1, 0, 0.7098039, 1,
1.217771, 3.229602, 0.3669746, 1, 0, 0.7019608, 1,
1.2244, -1.163511, 2.200516, 1, 0, 0.6941177, 1,
1.225229, 0.1389287, 1.455979, 1, 0, 0.6901961, 1,
1.225909, 0.4246571, -0.4810269, 1, 0, 0.682353, 1,
1.226063, 0.8395315, 0.8024269, 1, 0, 0.6784314, 1,
1.228962, -0.5902779, 2.288182, 1, 0, 0.6705883, 1,
1.230301, 0.7015647, 1.79767, 1, 0, 0.6666667, 1,
1.231981, 0.3185569, 0.5215668, 1, 0, 0.6588235, 1,
1.244887, -0.312743, 1.624422, 1, 0, 0.654902, 1,
1.247959, 0.5775602, 0.5278568, 1, 0, 0.6470588, 1,
1.250471, -1.038983, 1.608616, 1, 0, 0.6431373, 1,
1.251652, -0.1761278, 1.284655, 1, 0, 0.6352941, 1,
1.253959, 0.02596758, 2.744294, 1, 0, 0.6313726, 1,
1.257874, -0.297355, 3.289607, 1, 0, 0.6235294, 1,
1.270978, 0.1034765, 0.07767732, 1, 0, 0.6196079, 1,
1.271792, 1.442166, 0.3306528, 1, 0, 0.6117647, 1,
1.274082, -0.3348522, 0.8826485, 1, 0, 0.6078432, 1,
1.281851, -0.4696981, 2.290055, 1, 0, 0.6, 1,
1.286393, 0.9585047, 0.6418237, 1, 0, 0.5921569, 1,
1.29158, -0.6138009, 2.67904, 1, 0, 0.5882353, 1,
1.294712, 0.7486044, 1.635216, 1, 0, 0.5803922, 1,
1.299255, 1.418828, 1.586901, 1, 0, 0.5764706, 1,
1.308604, 0.8868341, -1.071602, 1, 0, 0.5686275, 1,
1.311792, 0.2449067, 1.963727, 1, 0, 0.5647059, 1,
1.315733, 0.08078848, 2.698496, 1, 0, 0.5568628, 1,
1.32158, 0.7260438, 0.6014023, 1, 0, 0.5529412, 1,
1.332742, -0.4295896, 4.230818, 1, 0, 0.5450981, 1,
1.345934, 0.2547657, 0.857853, 1, 0, 0.5411765, 1,
1.349167, -1.199573, 2.766623, 1, 0, 0.5333334, 1,
1.351735, -0.1495353, 1.51728, 1, 0, 0.5294118, 1,
1.357803, -0.7691903, 0.4509951, 1, 0, 0.5215687, 1,
1.366489, 0.427465, -0.2068394, 1, 0, 0.5176471, 1,
1.370924, -1.171657, 3.016768, 1, 0, 0.509804, 1,
1.379502, 0.4366947, -0.08391165, 1, 0, 0.5058824, 1,
1.406821, -2.407655, 1.964408, 1, 0, 0.4980392, 1,
1.409548, 0.9722772, 1.487392, 1, 0, 0.4901961, 1,
1.42541, 2.226136, 1.917548, 1, 0, 0.4862745, 1,
1.425518, 0.2567745, 2.663761, 1, 0, 0.4784314, 1,
1.436391, 0.1737277, 2.683663, 1, 0, 0.4745098, 1,
1.437158, 1.693768, 0.530166, 1, 0, 0.4666667, 1,
1.439716, -0.5982463, -0.09745096, 1, 0, 0.4627451, 1,
1.459183, -0.5482251, 3.17836, 1, 0, 0.454902, 1,
1.460138, -0.1427519, 1.387746, 1, 0, 0.4509804, 1,
1.465287, -0.01981068, 1.127106, 1, 0, 0.4431373, 1,
1.47657, 0.6166303, 0.1344065, 1, 0, 0.4392157, 1,
1.480434, -0.2640276, 1.523834, 1, 0, 0.4313726, 1,
1.481477, -0.7794768, 3.921175, 1, 0, 0.427451, 1,
1.482556, -0.3966991, 0.771508, 1, 0, 0.4196078, 1,
1.484606, -1.280897, 3.186552, 1, 0, 0.4156863, 1,
1.521239, 0.6335307, -0.6837053, 1, 0, 0.4078431, 1,
1.527849, -0.4119835, 0.1884474, 1, 0, 0.4039216, 1,
1.563496, -1.31594, 4.971846, 1, 0, 0.3960784, 1,
1.578321, -0.7508413, 1.147966, 1, 0, 0.3882353, 1,
1.581201, 0.7663206, 1.190943, 1, 0, 0.3843137, 1,
1.594106, -0.3720518, 2.398786, 1, 0, 0.3764706, 1,
1.594223, -0.2911606, 1.163861, 1, 0, 0.372549, 1,
1.595214, -0.2732311, 1.342405, 1, 0, 0.3647059, 1,
1.596223, -2.45624, 1.881287, 1, 0, 0.3607843, 1,
1.611125, 0.09405237, 0.3813368, 1, 0, 0.3529412, 1,
1.611949, 1.286092, 1.486051, 1, 0, 0.3490196, 1,
1.626479, 0.5189072, 2.630568, 1, 0, 0.3411765, 1,
1.626598, -0.2561333, 2.686904, 1, 0, 0.3372549, 1,
1.637983, -2.164092, 2.095396, 1, 0, 0.3294118, 1,
1.642445, 0.1616638, 1.931375, 1, 0, 0.3254902, 1,
1.646467, 1.87674, 2.624234, 1, 0, 0.3176471, 1,
1.652486, 2.264702, 2.399464, 1, 0, 0.3137255, 1,
1.658151, -1.198644, 1.637448, 1, 0, 0.3058824, 1,
1.658898, -0.06527207, 3.973331, 1, 0, 0.2980392, 1,
1.665956, -0.03459289, 2.316026, 1, 0, 0.2941177, 1,
1.675201, -0.3888105, 0.6209858, 1, 0, 0.2862745, 1,
1.681745, -0.4045348, 2.679605, 1, 0, 0.282353, 1,
1.695866, -0.669982, 3.263368, 1, 0, 0.2745098, 1,
1.699889, 1.174067, 0.1901396, 1, 0, 0.2705882, 1,
1.726436, -1.223197, 2.1566, 1, 0, 0.2627451, 1,
1.727959, -0.1595693, 3.021391, 1, 0, 0.2588235, 1,
1.739764, 0.6629964, 3.267967, 1, 0, 0.2509804, 1,
1.762039, 0.09905047, 2.131015, 1, 0, 0.2470588, 1,
1.767809, 0.2379469, 3.266964, 1, 0, 0.2392157, 1,
1.772063, 0.09499843, 0.9656806, 1, 0, 0.2352941, 1,
1.800856, -0.1779997, 2.507121, 1, 0, 0.227451, 1,
1.82235, -0.9900827, 1.54795, 1, 0, 0.2235294, 1,
1.829779, -2.43689, 2.055597, 1, 0, 0.2156863, 1,
1.835974, 0.8446523, 2.125237, 1, 0, 0.2117647, 1,
1.843014, -0.05052439, 2.263643, 1, 0, 0.2039216, 1,
1.855613, 0.6100091, 2.679193, 1, 0, 0.1960784, 1,
1.87147, 1.048173, -1.077511, 1, 0, 0.1921569, 1,
1.872405, -0.1383417, 1.900949, 1, 0, 0.1843137, 1,
1.872797, -0.8073547, 2.171526, 1, 0, 0.1803922, 1,
1.89096, -0.7876163, 1.084496, 1, 0, 0.172549, 1,
1.892162, -1.700706, 1.619385, 1, 0, 0.1686275, 1,
1.894963, 0.5046847, 1.739378, 1, 0, 0.1607843, 1,
1.913562, -0.315196, 3.155719, 1, 0, 0.1568628, 1,
1.931885, 0.9170336, -0.06972344, 1, 0, 0.1490196, 1,
1.980174, 0.3775754, 0.1145465, 1, 0, 0.145098, 1,
1.991184, 0.6013932, 0.6502038, 1, 0, 0.1372549, 1,
1.992532, -0.06556187, 1.623223, 1, 0, 0.1333333, 1,
2.005871, -0.4954021, 4.456756, 1, 0, 0.1254902, 1,
2.01351, -1.07076, 4.895068, 1, 0, 0.1215686, 1,
2.099795, 0.6631172, 1.652097, 1, 0, 0.1137255, 1,
2.130524, -0.940176, 1.001228, 1, 0, 0.1098039, 1,
2.134497, -1.197522, 3.885364, 1, 0, 0.1019608, 1,
2.138087, 0.001915152, 2.402403, 1, 0, 0.09411765, 1,
2.140636, 1.670282, -0.4515433, 1, 0, 0.09019608, 1,
2.168676, -0.184447, 0.1814741, 1, 0, 0.08235294, 1,
2.172136, -0.1049955, 1.328237, 1, 0, 0.07843138, 1,
2.179633, 0.3645292, 1.285477, 1, 0, 0.07058824, 1,
2.202272, -0.07637829, 1.728439, 1, 0, 0.06666667, 1,
2.214327, 0.07080972, 0.1623209, 1, 0, 0.05882353, 1,
2.293778, -1.513186, 3.899858, 1, 0, 0.05490196, 1,
2.333736, 0.8333426, 1.065925, 1, 0, 0.04705882, 1,
2.363072, -0.009390589, 1.313827, 1, 0, 0.04313726, 1,
2.404607, 0.8945531, 0.984827, 1, 0, 0.03529412, 1,
2.4321, 1.106732, 0.433879, 1, 0, 0.03137255, 1,
2.632381, -0.5703776, 0.3672843, 1, 0, 0.02352941, 1,
2.712005, -0.3733793, 1.946909, 1, 0, 0.01960784, 1,
2.976896, -1.198431, 0.8139589, 1, 0, 0.01176471, 1,
3.122259, 1.683279, 2.196268, 1, 0, 0.007843138, 1
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
0.01152396, -4.664885, -6.96709, 0, -0.5, 0.5, 0.5,
0.01152396, -4.664885, -6.96709, 1, -0.5, 0.5, 0.5,
0.01152396, -4.664885, -6.96709, 1, 1.5, 0.5, 0.5,
0.01152396, -4.664885, -6.96709, 0, 1.5, 0.5, 0.5
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
-4.153751, -0.1455525, -6.96709, 0, -0.5, 0.5, 0.5,
-4.153751, -0.1455525, -6.96709, 1, -0.5, 0.5, 0.5,
-4.153751, -0.1455525, -6.96709, 1, 1.5, 0.5, 0.5,
-4.153751, -0.1455525, -6.96709, 0, 1.5, 0.5, 0.5
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
-4.153751, -4.664885, -0.0163238, 0, -0.5, 0.5, 0.5,
-4.153751, -4.664885, -0.0163238, 1, -0.5, 0.5, 0.5,
-4.153751, -4.664885, -0.0163238, 1, 1.5, 0.5, 0.5,
-4.153751, -4.664885, -0.0163238, 0, 1.5, 0.5, 0.5
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
-3, -3.621962, -5.363067,
3, -3.621962, -5.363067,
-3, -3.621962, -5.363067,
-3, -3.795783, -5.630404,
-2, -3.621962, -5.363067,
-2, -3.795783, -5.630404,
-1, -3.621962, -5.363067,
-1, -3.795783, -5.630404,
0, -3.621962, -5.363067,
0, -3.795783, -5.630404,
1, -3.621962, -5.363067,
1, -3.795783, -5.630404,
2, -3.621962, -5.363067,
2, -3.795783, -5.630404,
3, -3.621962, -5.363067,
3, -3.795783, -5.630404
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
-3, -4.143424, -6.165078, 0, -0.5, 0.5, 0.5,
-3, -4.143424, -6.165078, 1, -0.5, 0.5, 0.5,
-3, -4.143424, -6.165078, 1, 1.5, 0.5, 0.5,
-3, -4.143424, -6.165078, 0, 1.5, 0.5, 0.5,
-2, -4.143424, -6.165078, 0, -0.5, 0.5, 0.5,
-2, -4.143424, -6.165078, 1, -0.5, 0.5, 0.5,
-2, -4.143424, -6.165078, 1, 1.5, 0.5, 0.5,
-2, -4.143424, -6.165078, 0, 1.5, 0.5, 0.5,
-1, -4.143424, -6.165078, 0, -0.5, 0.5, 0.5,
-1, -4.143424, -6.165078, 1, -0.5, 0.5, 0.5,
-1, -4.143424, -6.165078, 1, 1.5, 0.5, 0.5,
-1, -4.143424, -6.165078, 0, 1.5, 0.5, 0.5,
0, -4.143424, -6.165078, 0, -0.5, 0.5, 0.5,
0, -4.143424, -6.165078, 1, -0.5, 0.5, 0.5,
0, -4.143424, -6.165078, 1, 1.5, 0.5, 0.5,
0, -4.143424, -6.165078, 0, 1.5, 0.5, 0.5,
1, -4.143424, -6.165078, 0, -0.5, 0.5, 0.5,
1, -4.143424, -6.165078, 1, -0.5, 0.5, 0.5,
1, -4.143424, -6.165078, 1, 1.5, 0.5, 0.5,
1, -4.143424, -6.165078, 0, 1.5, 0.5, 0.5,
2, -4.143424, -6.165078, 0, -0.5, 0.5, 0.5,
2, -4.143424, -6.165078, 1, -0.5, 0.5, 0.5,
2, -4.143424, -6.165078, 1, 1.5, 0.5, 0.5,
2, -4.143424, -6.165078, 0, 1.5, 0.5, 0.5,
3, -4.143424, -6.165078, 0, -0.5, 0.5, 0.5,
3, -4.143424, -6.165078, 1, -0.5, 0.5, 0.5,
3, -4.143424, -6.165078, 1, 1.5, 0.5, 0.5,
3, -4.143424, -6.165078, 0, 1.5, 0.5, 0.5
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
-3.192533, -3, -5.363067,
-3.192533, 3, -5.363067,
-3.192533, -3, -5.363067,
-3.352736, -3, -5.630404,
-3.192533, -2, -5.363067,
-3.352736, -2, -5.630404,
-3.192533, -1, -5.363067,
-3.352736, -1, -5.630404,
-3.192533, 0, -5.363067,
-3.352736, 0, -5.630404,
-3.192533, 1, -5.363067,
-3.352736, 1, -5.630404,
-3.192533, 2, -5.363067,
-3.352736, 2, -5.630404,
-3.192533, 3, -5.363067,
-3.352736, 3, -5.630404
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
-3.673142, -3, -6.165078, 0, -0.5, 0.5, 0.5,
-3.673142, -3, -6.165078, 1, -0.5, 0.5, 0.5,
-3.673142, -3, -6.165078, 1, 1.5, 0.5, 0.5,
-3.673142, -3, -6.165078, 0, 1.5, 0.5, 0.5,
-3.673142, -2, -6.165078, 0, -0.5, 0.5, 0.5,
-3.673142, -2, -6.165078, 1, -0.5, 0.5, 0.5,
-3.673142, -2, -6.165078, 1, 1.5, 0.5, 0.5,
-3.673142, -2, -6.165078, 0, 1.5, 0.5, 0.5,
-3.673142, -1, -6.165078, 0, -0.5, 0.5, 0.5,
-3.673142, -1, -6.165078, 1, -0.5, 0.5, 0.5,
-3.673142, -1, -6.165078, 1, 1.5, 0.5, 0.5,
-3.673142, -1, -6.165078, 0, 1.5, 0.5, 0.5,
-3.673142, 0, -6.165078, 0, -0.5, 0.5, 0.5,
-3.673142, 0, -6.165078, 1, -0.5, 0.5, 0.5,
-3.673142, 0, -6.165078, 1, 1.5, 0.5, 0.5,
-3.673142, 0, -6.165078, 0, 1.5, 0.5, 0.5,
-3.673142, 1, -6.165078, 0, -0.5, 0.5, 0.5,
-3.673142, 1, -6.165078, 1, -0.5, 0.5, 0.5,
-3.673142, 1, -6.165078, 1, 1.5, 0.5, 0.5,
-3.673142, 1, -6.165078, 0, 1.5, 0.5, 0.5,
-3.673142, 2, -6.165078, 0, -0.5, 0.5, 0.5,
-3.673142, 2, -6.165078, 1, -0.5, 0.5, 0.5,
-3.673142, 2, -6.165078, 1, 1.5, 0.5, 0.5,
-3.673142, 2, -6.165078, 0, 1.5, 0.5, 0.5,
-3.673142, 3, -6.165078, 0, -0.5, 0.5, 0.5,
-3.673142, 3, -6.165078, 1, -0.5, 0.5, 0.5,
-3.673142, 3, -6.165078, 1, 1.5, 0.5, 0.5,
-3.673142, 3, -6.165078, 0, 1.5, 0.5, 0.5
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
-3.192533, -3.621962, -4,
-3.192533, -3.621962, 4,
-3.192533, -3.621962, -4,
-3.352736, -3.795783, -4,
-3.192533, -3.621962, -2,
-3.352736, -3.795783, -2,
-3.192533, -3.621962, 0,
-3.352736, -3.795783, 0,
-3.192533, -3.621962, 2,
-3.352736, -3.795783, 2,
-3.192533, -3.621962, 4,
-3.352736, -3.795783, 4
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
-3.673142, -4.143424, -4, 0, -0.5, 0.5, 0.5,
-3.673142, -4.143424, -4, 1, -0.5, 0.5, 0.5,
-3.673142, -4.143424, -4, 1, 1.5, 0.5, 0.5,
-3.673142, -4.143424, -4, 0, 1.5, 0.5, 0.5,
-3.673142, -4.143424, -2, 0, -0.5, 0.5, 0.5,
-3.673142, -4.143424, -2, 1, -0.5, 0.5, 0.5,
-3.673142, -4.143424, -2, 1, 1.5, 0.5, 0.5,
-3.673142, -4.143424, -2, 0, 1.5, 0.5, 0.5,
-3.673142, -4.143424, 0, 0, -0.5, 0.5, 0.5,
-3.673142, -4.143424, 0, 1, -0.5, 0.5, 0.5,
-3.673142, -4.143424, 0, 1, 1.5, 0.5, 0.5,
-3.673142, -4.143424, 0, 0, 1.5, 0.5, 0.5,
-3.673142, -4.143424, 2, 0, -0.5, 0.5, 0.5,
-3.673142, -4.143424, 2, 1, -0.5, 0.5, 0.5,
-3.673142, -4.143424, 2, 1, 1.5, 0.5, 0.5,
-3.673142, -4.143424, 2, 0, 1.5, 0.5, 0.5,
-3.673142, -4.143424, 4, 0, -0.5, 0.5, 0.5,
-3.673142, -4.143424, 4, 1, -0.5, 0.5, 0.5,
-3.673142, -4.143424, 4, 1, 1.5, 0.5, 0.5,
-3.673142, -4.143424, 4, 0, 1.5, 0.5, 0.5
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
-3.192533, -3.621962, -5.363067,
-3.192533, 3.330857, -5.363067,
-3.192533, -3.621962, 5.330419,
-3.192533, 3.330857, 5.330419,
-3.192533, -3.621962, -5.363067,
-3.192533, -3.621962, 5.330419,
-3.192533, 3.330857, -5.363067,
-3.192533, 3.330857, 5.330419,
-3.192533, -3.621962, -5.363067,
3.215581, -3.621962, -5.363067,
-3.192533, -3.621962, 5.330419,
3.215581, -3.621962, 5.330419,
-3.192533, 3.330857, -5.363067,
3.215581, 3.330857, -5.363067,
-3.192533, 3.330857, 5.330419,
3.215581, 3.330857, 5.330419,
3.215581, -3.621962, -5.363067,
3.215581, 3.330857, -5.363067,
3.215581, -3.621962, 5.330419,
3.215581, 3.330857, 5.330419,
3.215581, -3.621962, -5.363067,
3.215581, -3.621962, 5.330419,
3.215581, 3.330857, -5.363067,
3.215581, 3.330857, 5.330419
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
var radius = 7.622211;
var distance = 33.91208;
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
mvMatrix.translate( -0.01152396, 0.1455525, 0.0163238 );
mvMatrix.scale( 1.28607, 1.185315, 0.7706826 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.91208);
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
molinate<-read.table("molinate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-molinate$V2
```

```
## Error in eval(expr, envir, enclos): object 'molinate' not found
```

```r
y<-molinate$V3
```

```
## Error in eval(expr, envir, enclos): object 'molinate' not found
```

```r
z<-molinate$V4
```

```
## Error in eval(expr, envir, enclos): object 'molinate' not found
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
-3.099211, -1.854648, 0.03809268, 0, 0, 1, 1, 1,
-2.974865, 0.09379467, -0.6993392, 1, 0, 0, 1, 1,
-2.959844, -1.310442, -1.566814, 1, 0, 0, 1, 1,
-2.915941, 0.9858623, -0.4616896, 1, 0, 0, 1, 1,
-2.828154, -0.4163798, -2.007873, 1, 0, 0, 1, 1,
-2.595706, -1.278169, -0.7007822, 1, 0, 0, 1, 1,
-2.304518, 1.303771, -0.0909656, 0, 0, 0, 1, 1,
-2.269471, -1.419483, -2.751357, 0, 0, 0, 1, 1,
-2.263481, 1.334804, 0.2719215, 0, 0, 0, 1, 1,
-2.261078, 0.7252176, -1.284415, 0, 0, 0, 1, 1,
-2.250877, 0.6898398, 0.1997554, 0, 0, 0, 1, 1,
-2.20946, 1.252003, -2.391056, 0, 0, 0, 1, 1,
-2.164358, 0.3967982, -1.80379, 0, 0, 0, 1, 1,
-2.144324, 0.616441, -1.523749, 1, 1, 1, 1, 1,
-2.097667, 1.947941, -1.792967, 1, 1, 1, 1, 1,
-2.082967, 1.22984, -2.136019, 1, 1, 1, 1, 1,
-2.080761, 1.28545, -1.166461, 1, 1, 1, 1, 1,
-2.062134, -2.848269, -2.679465, 1, 1, 1, 1, 1,
-2.056017, -0.8644913, -4.295798, 1, 1, 1, 1, 1,
-2.052018, 0.5171424, -1.608562, 1, 1, 1, 1, 1,
-2.049961, -1.127111, -1.5127, 1, 1, 1, 1, 1,
-2.041296, -0.1114783, -2.028888, 1, 1, 1, 1, 1,
-2.032494, 0.1754371, -0.582583, 1, 1, 1, 1, 1,
-2.006753, -0.7520671, -2.438941, 1, 1, 1, 1, 1,
-1.998379, 0.4605781, -0.2968823, 1, 1, 1, 1, 1,
-1.997321, 0.5395207, 0.1577512, 1, 1, 1, 1, 1,
-1.995105, 0.195576, -1.180687, 1, 1, 1, 1, 1,
-1.967161, -0.03314981, -0.6658235, 1, 1, 1, 1, 1,
-1.95582, -0.4615245, -1.202405, 0, 0, 1, 1, 1,
-1.943778, -2.416561, -2.918878, 1, 0, 0, 1, 1,
-1.937139, 0.2769771, -1.426809, 1, 0, 0, 1, 1,
-1.925777, -1.070817, -2.025008, 1, 0, 0, 1, 1,
-1.924879, 0.680261, -0.5866718, 1, 0, 0, 1, 1,
-1.919225, -0.1896025, -1.322081, 1, 0, 0, 1, 1,
-1.913995, -1.414252, -2.65255, 0, 0, 0, 1, 1,
-1.872507, -0.3486659, -1.350969, 0, 0, 0, 1, 1,
-1.862682, -1.398424, -2.816939, 0, 0, 0, 1, 1,
-1.858069, 1.257659, 1.146476, 0, 0, 0, 1, 1,
-1.856733, 0.8205566, -1.2533, 0, 0, 0, 1, 1,
-1.816975, 1.279613, -1.017317, 0, 0, 0, 1, 1,
-1.769959, 0.3548417, -0.5592839, 0, 0, 0, 1, 1,
-1.763104, 2.998926, -0.2027408, 1, 1, 1, 1, 1,
-1.744209, 0.9678583, -0.06944676, 1, 1, 1, 1, 1,
-1.741025, 2.736774, -1.560579, 1, 1, 1, 1, 1,
-1.733652, 0.8918325, -1.714197, 1, 1, 1, 1, 1,
-1.733087, -0.6247566, -1.829238, 1, 1, 1, 1, 1,
-1.728933, -0.4226964, -1.109232, 1, 1, 1, 1, 1,
-1.714872, 2.101223, -0.2059155, 1, 1, 1, 1, 1,
-1.711842, -0.9686705, -3.592598, 1, 1, 1, 1, 1,
-1.703016, -0.04149668, 0.06861735, 1, 1, 1, 1, 1,
-1.700655, 0.3721606, -1.55728, 1, 1, 1, 1, 1,
-1.690054, -0.5995632, -2.188273, 1, 1, 1, 1, 1,
-1.688717, 1.262912, -0.4099413, 1, 1, 1, 1, 1,
-1.686278, -0.04528758, -2.523713, 1, 1, 1, 1, 1,
-1.673212, 0.5852592, -1.686576, 1, 1, 1, 1, 1,
-1.66255, -0.2547874, -2.463, 1, 1, 1, 1, 1,
-1.660299, 0.3112408, -0.8349131, 0, 0, 1, 1, 1,
-1.64626, -0.5868469, -3.387491, 1, 0, 0, 1, 1,
-1.642732, -0.3671617, -1.522227, 1, 0, 0, 1, 1,
-1.640815, -0.7013333, -1.46354, 1, 0, 0, 1, 1,
-1.635355, -0.3708223, -3.560731, 1, 0, 0, 1, 1,
-1.635173, -1.157914, -2.336011, 1, 0, 0, 1, 1,
-1.626522, -0.3032248, -1.552266, 0, 0, 0, 1, 1,
-1.610648, 0.9134336, -1.701029, 0, 0, 0, 1, 1,
-1.599102, -0.3291043, -0.3508181, 0, 0, 0, 1, 1,
-1.596792, 0.1420925, -1.72214, 0, 0, 0, 1, 1,
-1.587442, 0.6363174, -0.09072622, 0, 0, 0, 1, 1,
-1.582261, 2.414356, -1.11669, 0, 0, 0, 1, 1,
-1.578888, 0.357, -1.224901, 0, 0, 0, 1, 1,
-1.572955, -1.000542, -2.417295, 1, 1, 1, 1, 1,
-1.571284, -0.313148, -1.183998, 1, 1, 1, 1, 1,
-1.552684, 0.8409785, 0.70969, 1, 1, 1, 1, 1,
-1.546401, -1.471705, -2.15318, 1, 1, 1, 1, 1,
-1.543702, -0.5245876, -0.8113661, 1, 1, 1, 1, 1,
-1.533649, -0.7292012, -1.809078, 1, 1, 1, 1, 1,
-1.532127, 0.8653009, -1.157283, 1, 1, 1, 1, 1,
-1.50091, 0.3777929, 0.8126553, 1, 1, 1, 1, 1,
-1.494038, -1.211029, -3.008739, 1, 1, 1, 1, 1,
-1.488955, 0.4708835, -0.6519719, 1, 1, 1, 1, 1,
-1.484302, -1.044546, -1.801066, 1, 1, 1, 1, 1,
-1.483537, -1.845023, -1.935532, 1, 1, 1, 1, 1,
-1.478629, -0.4261605, -2.399884, 1, 1, 1, 1, 1,
-1.438697, 2.615367, 1.188617, 1, 1, 1, 1, 1,
-1.437801, -1.338248, -1.569057, 1, 1, 1, 1, 1,
-1.436857, 1.191905, 1.176778, 0, 0, 1, 1, 1,
-1.424424, -0.3600875, -2.410082, 1, 0, 0, 1, 1,
-1.415383, 1.5857, 0.6646267, 1, 0, 0, 1, 1,
-1.410201, -0.3078196, -1.868953, 1, 0, 0, 1, 1,
-1.409294, 0.197922, -1.328268, 1, 0, 0, 1, 1,
-1.403066, -0.2159709, -0.2156839, 1, 0, 0, 1, 1,
-1.396847, 2.030014, -1.376788, 0, 0, 0, 1, 1,
-1.39568, -1.753325, -2.708702, 0, 0, 0, 1, 1,
-1.385799, -0.7628796, -1.322917, 0, 0, 0, 1, 1,
-1.377203, 0.7612002, -1.971073, 0, 0, 0, 1, 1,
-1.372845, 1.268045, -0.08773901, 0, 0, 0, 1, 1,
-1.372589, -0.1399163, -2.224386, 0, 0, 0, 1, 1,
-1.362237, 0.4946229, 0.2877302, 0, 0, 0, 1, 1,
-1.356133, -0.6369236, -1.748734, 1, 1, 1, 1, 1,
-1.354742, -1.087151, -2.402661, 1, 1, 1, 1, 1,
-1.351567, -0.7786309, -1.534772, 1, 1, 1, 1, 1,
-1.33807, 0.570088, 0.06281909, 1, 1, 1, 1, 1,
-1.331789, -0.5307904, -1.934392, 1, 1, 1, 1, 1,
-1.322943, -0.4473303, -3.160972, 1, 1, 1, 1, 1,
-1.310442, 0.7154707, -1.011578, 1, 1, 1, 1, 1,
-1.295192, -0.533554, -1.769102, 1, 1, 1, 1, 1,
-1.284087, 1.086838, -0.7763337, 1, 1, 1, 1, 1,
-1.280158, 0.701087, -1.157231, 1, 1, 1, 1, 1,
-1.273434, -0.765887, -0.3265793, 1, 1, 1, 1, 1,
-1.270844, -1.402748, -1.831496, 1, 1, 1, 1, 1,
-1.268329, 1.126138, -2.156074, 1, 1, 1, 1, 1,
-1.267923, 0.1068132, -1.47168, 1, 1, 1, 1, 1,
-1.2673, 0.01579703, -2.399248, 1, 1, 1, 1, 1,
-1.253703, -1.246986, -3.436339, 0, 0, 1, 1, 1,
-1.252414, -1.809336, -3.858889, 1, 0, 0, 1, 1,
-1.250234, 0.436101, -2.169883, 1, 0, 0, 1, 1,
-1.24948, -1.028637, -2.093934, 1, 0, 0, 1, 1,
-1.248021, -0.8267179, -2.887643, 1, 0, 0, 1, 1,
-1.240871, 0.1027551, -2.848171, 1, 0, 0, 1, 1,
-1.24081, -0.1122277, 0.6521751, 0, 0, 0, 1, 1,
-1.235618, 1.394763, -1.937759, 0, 0, 0, 1, 1,
-1.230246, -0.2745711, -3.756277, 0, 0, 0, 1, 1,
-1.228595, -1.005759, -2.637561, 0, 0, 0, 1, 1,
-1.21498, 0.2246623, -2.20511, 0, 0, 0, 1, 1,
-1.214368, -1.298782, -2.679387, 0, 0, 0, 1, 1,
-1.211271, -0.4946735, -2.160327, 0, 0, 0, 1, 1,
-1.210872, 0.7879223, -0.4369162, 1, 1, 1, 1, 1,
-1.209679, 1.007809, 0.02578686, 1, 1, 1, 1, 1,
-1.206689, 0.2092896, -1.272064, 1, 1, 1, 1, 1,
-1.188522, 1.602724, -3.765116, 1, 1, 1, 1, 1,
-1.173696, -0.4513779, -1.455498, 1, 1, 1, 1, 1,
-1.169511, -1.156481, -2.478188, 1, 1, 1, 1, 1,
-1.167097, -1.143117, -2.311278, 1, 1, 1, 1, 1,
-1.163944, 1.23557, -2.001467, 1, 1, 1, 1, 1,
-1.162709, -1.179417, -1.311225, 1, 1, 1, 1, 1,
-1.16215, -0.7283292, -1.039107, 1, 1, 1, 1, 1,
-1.161287, -1.516241, -1.604985, 1, 1, 1, 1, 1,
-1.15652, -1.238245, -2.813412, 1, 1, 1, 1, 1,
-1.151526, 0.5792271, -0.3549628, 1, 1, 1, 1, 1,
-1.1444, -0.3876168, -0.565189, 1, 1, 1, 1, 1,
-1.13953, -0.03432085, -2.176238, 1, 1, 1, 1, 1,
-1.13933, 1.248607, 0.2864551, 0, 0, 1, 1, 1,
-1.136638, -1.011416, -1.352462, 1, 0, 0, 1, 1,
-1.131676, 0.7382358, -0.7662054, 1, 0, 0, 1, 1,
-1.131063, 0.3290264, -3.063492, 1, 0, 0, 1, 1,
-1.130733, 0.6667565, 0.8412973, 1, 0, 0, 1, 1,
-1.12927, 0.2277359, -2.488766, 1, 0, 0, 1, 1,
-1.124959, -0.4298975, -3.017257, 0, 0, 0, 1, 1,
-1.118356, -0.05472979, -2.310668, 0, 0, 0, 1, 1,
-1.110995, -1.734982, -3.566956, 0, 0, 0, 1, 1,
-1.104128, -0.4194533, -1.355438, 0, 0, 0, 1, 1,
-1.101957, 0.1206138, -0.4906, 0, 0, 0, 1, 1,
-1.101146, -0.09462647, -1.317364, 0, 0, 0, 1, 1,
-1.092307, 0.6183954, -1.561609, 0, 0, 0, 1, 1,
-1.084972, -1.337346, -3.268456, 1, 1, 1, 1, 1,
-1.082891, -0.01961805, -1.9522, 1, 1, 1, 1, 1,
-1.068906, 2.149715, 0.6643301, 1, 1, 1, 1, 1,
-1.065153, -1.241793, -2.50948, 1, 1, 1, 1, 1,
-1.064136, 0.700683, -0.7834376, 1, 1, 1, 1, 1,
-1.055402, 0.3308653, -0.7530461, 1, 1, 1, 1, 1,
-1.05499, 0.7560194, -1.809534, 1, 1, 1, 1, 1,
-1.049509, 0.0252587, -2.597777, 1, 1, 1, 1, 1,
-1.045439, 0.7543178, 0.305078, 1, 1, 1, 1, 1,
-1.043076, -0.6819456, -2.374804, 1, 1, 1, 1, 1,
-1.042372, -0.8723447, -1.197842, 1, 1, 1, 1, 1,
-1.039046, -1.788374, -0.788352, 1, 1, 1, 1, 1,
-1.038844, -0.3423956, -2.428512, 1, 1, 1, 1, 1,
-1.037173, 1.93874, 2.27038, 1, 1, 1, 1, 1,
-1.03591, 0.1339942, -1.136848, 1, 1, 1, 1, 1,
-1.035762, 0.1262742, -1.622083, 0, 0, 1, 1, 1,
-1.034255, -0.3479663, -2.238197, 1, 0, 0, 1, 1,
-1.033281, -1.122716, -1.74728, 1, 0, 0, 1, 1,
-1.032956, -1.178849, -1.689424, 1, 0, 0, 1, 1,
-1.031228, -2.159466, -4.283792, 1, 0, 0, 1, 1,
-1.024513, 1.546402, -1.485489, 1, 0, 0, 1, 1,
-1.007789, -0.5717736, 0.780961, 0, 0, 0, 1, 1,
-1.004622, 0.1688361, -1.166757, 0, 0, 0, 1, 1,
-1.004086, 1.707197, -2.716752, 0, 0, 0, 1, 1,
-1.003718, 0.8107129, -0.8063141, 0, 0, 0, 1, 1,
-0.9894443, -0.4516318, -3.03827, 0, 0, 0, 1, 1,
-0.9864463, 0.7700098, -0.9842842, 0, 0, 0, 1, 1,
-0.9843532, 0.6751965, -0.1090226, 0, 0, 0, 1, 1,
-0.9807683, -0.4740752, -2.575592, 1, 1, 1, 1, 1,
-0.9805223, 0.8618703, -1.954491, 1, 1, 1, 1, 1,
-0.9722296, 0.1887388, -2.020147, 1, 1, 1, 1, 1,
-0.9595665, 1.001906, -2.209679, 1, 1, 1, 1, 1,
-0.9589261, -0.2497217, -0.3392406, 1, 1, 1, 1, 1,
-0.9426503, 0.7467415, -1.788167, 1, 1, 1, 1, 1,
-0.9388224, -1.805276, -2.576537, 1, 1, 1, 1, 1,
-0.9370058, 0.5507925, -0.1275645, 1, 1, 1, 1, 1,
-0.9364377, 0.1412656, -1.628665, 1, 1, 1, 1, 1,
-0.9313722, -0.01081288, -1.93395, 1, 1, 1, 1, 1,
-0.9313009, 0.3628553, -1.412252, 1, 1, 1, 1, 1,
-0.9312091, -0.5329561, -0.5585502, 1, 1, 1, 1, 1,
-0.9305487, 0.167124, -0.2520062, 1, 1, 1, 1, 1,
-0.93003, -0.2351643, -1.9781, 1, 1, 1, 1, 1,
-0.9277294, 0.435831, -1.303963, 1, 1, 1, 1, 1,
-0.9219543, -0.3082275, -0.3052001, 0, 0, 1, 1, 1,
-0.9218502, -1.753158, -2.1982, 1, 0, 0, 1, 1,
-0.9192823, -0.02379267, -1.72018, 1, 0, 0, 1, 1,
-0.9175253, -0.4944896, -1.763876, 1, 0, 0, 1, 1,
-0.9170932, -0.9877945, -1.226925, 1, 0, 0, 1, 1,
-0.9170493, -1.979143, -4.810759, 1, 0, 0, 1, 1,
-0.9144611, 0.1353948, 0.2655895, 0, 0, 0, 1, 1,
-0.9111297, -0.8091596, -3.218915, 0, 0, 0, 1, 1,
-0.9097329, 0.6423764, -3.174711, 0, 0, 0, 1, 1,
-0.90177, 0.4561028, -0.7931703, 0, 0, 0, 1, 1,
-0.8981329, -0.2449595, -2.52866, 0, 0, 0, 1, 1,
-0.8957354, -0.2530484, -0.6247356, 0, 0, 0, 1, 1,
-0.8913312, 0.3063942, -1.271284, 0, 0, 0, 1, 1,
-0.8844477, -0.8972936, -0.8356146, 1, 1, 1, 1, 1,
-0.8806496, -0.3005745, -1.54598, 1, 1, 1, 1, 1,
-0.8766254, -0.3362893, -2.674567, 1, 1, 1, 1, 1,
-0.8744518, -0.03957552, -1.74692, 1, 1, 1, 1, 1,
-0.8690075, -1.144677, -3.003561, 1, 1, 1, 1, 1,
-0.8677562, -1.082624, -0.4251895, 1, 1, 1, 1, 1,
-0.858209, 0.1345443, -0.3594604, 1, 1, 1, 1, 1,
-0.8508062, 0.6797625, -2.210436, 1, 1, 1, 1, 1,
-0.8506199, 0.414046, -1.612758, 1, 1, 1, 1, 1,
-0.845304, -1.759796, -3.444782, 1, 1, 1, 1, 1,
-0.8438189, 0.2148959, -3.383235, 1, 1, 1, 1, 1,
-0.8429021, -0.8674823, -0.795946, 1, 1, 1, 1, 1,
-0.8425674, -0.01801914, -2.898836, 1, 1, 1, 1, 1,
-0.8414461, 0.02800429, -1.13228, 1, 1, 1, 1, 1,
-0.827467, 1.049716, -1.391092, 1, 1, 1, 1, 1,
-0.8272696, -1.721849, -1.79902, 0, 0, 1, 1, 1,
-0.8265558, 0.4883318, -1.119331, 1, 0, 0, 1, 1,
-0.823276, -1.75493, -4.42608, 1, 0, 0, 1, 1,
-0.8185809, 0.8695564, -1.478613, 1, 0, 0, 1, 1,
-0.8173297, -0.8460388, -3.56754, 1, 0, 0, 1, 1,
-0.8169663, -0.7517418, -1.031421, 1, 0, 0, 1, 1,
-0.8167161, -0.7378374, -2.211102, 0, 0, 0, 1, 1,
-0.8139659, -0.4852903, -1.475428, 0, 0, 0, 1, 1,
-0.813077, 0.8653749, -0.8471522, 0, 0, 0, 1, 1,
-0.8010164, 0.06746633, -2.67661, 0, 0, 0, 1, 1,
-0.7971213, 0.7682225, -1.849098, 0, 0, 0, 1, 1,
-0.7960684, -0.2614857, -1.289377, 0, 0, 0, 1, 1,
-0.7940591, -0.9863462, -1.13639, 0, 0, 0, 1, 1,
-0.7938683, -0.9209923, -1.93163, 1, 1, 1, 1, 1,
-0.7923451, 0.3323696, 0.4055991, 1, 1, 1, 1, 1,
-0.7856939, -1.302726, -2.208132, 1, 1, 1, 1, 1,
-0.7847633, 0.9799902, -1.512439, 1, 1, 1, 1, 1,
-0.7838583, -2.394264, -3.488399, 1, 1, 1, 1, 1,
-0.783446, -1.070288, -3.073866, 1, 1, 1, 1, 1,
-0.7773741, -1.269131, -3.076771, 1, 1, 1, 1, 1,
-0.758966, 1.003445, -0.9651638, 1, 1, 1, 1, 1,
-0.7582886, -1.045525, -2.253096, 1, 1, 1, 1, 1,
-0.7554613, 0.5769991, -1.384005, 1, 1, 1, 1, 1,
-0.7519059, 0.6533989, -1.726854, 1, 1, 1, 1, 1,
-0.7499759, 0.4972908, -0.7900661, 1, 1, 1, 1, 1,
-0.7438962, 0.1685747, 0.7640166, 1, 1, 1, 1, 1,
-0.7329667, 0.1527637, -1.112106, 1, 1, 1, 1, 1,
-0.7315199, -0.03932322, -2.141522, 1, 1, 1, 1, 1,
-0.7307949, -0.3748743, -1.234038, 0, 0, 1, 1, 1,
-0.730565, -0.86704, -4.002037, 1, 0, 0, 1, 1,
-0.7261343, -0.6195015, -2.847805, 1, 0, 0, 1, 1,
-0.7173874, -3.520707, -3.446342, 1, 0, 0, 1, 1,
-0.7168816, -0.4024048, -1.506678, 1, 0, 0, 1, 1,
-0.7097495, 0.9847404, -0.3029309, 1, 0, 0, 1, 1,
-0.7088756, -0.3200651, -3.942593, 0, 0, 0, 1, 1,
-0.7053453, 0.08525299, -1.858062, 0, 0, 0, 1, 1,
-0.6983508, -0.9528286, -2.692478, 0, 0, 0, 1, 1,
-0.6982046, -1.091377, -1.437408, 0, 0, 0, 1, 1,
-0.6976694, -0.1638634, -4.507223, 0, 0, 0, 1, 1,
-0.6962646, -0.5263688, -0.9399469, 0, 0, 0, 1, 1,
-0.6914474, -1.232752, -4.259522, 0, 0, 0, 1, 1,
-0.6862603, -0.9830558, -3.011269, 1, 1, 1, 1, 1,
-0.673706, 0.8777453, 0.4806531, 1, 1, 1, 1, 1,
-0.6699976, 0.1798396, -3.197354, 1, 1, 1, 1, 1,
-0.6622326, 0.1502828, -2.982975, 1, 1, 1, 1, 1,
-0.6530256, 0.3185176, -0.7876456, 1, 1, 1, 1, 1,
-0.6495444, -0.7562355, 0.3391672, 1, 1, 1, 1, 1,
-0.6470088, 0.2949684, -1.729997, 1, 1, 1, 1, 1,
-0.6469538, 0.6503486, -1.208925, 1, 1, 1, 1, 1,
-0.644607, -1.598026, -0.6219976, 1, 1, 1, 1, 1,
-0.6405379, 0.6970893, -0.5594919, 1, 1, 1, 1, 1,
-0.6368791, -1.518851, -3.681497, 1, 1, 1, 1, 1,
-0.6345279, -0.6180638, -1.937983, 1, 1, 1, 1, 1,
-0.6322352, 0.3125089, -0.4338685, 1, 1, 1, 1, 1,
-0.6298049, 0.6153244, 0.387378, 1, 1, 1, 1, 1,
-0.6257214, -0.7644655, -1.210341, 1, 1, 1, 1, 1,
-0.6211801, 0.3003404, -2.700341, 0, 0, 1, 1, 1,
-0.6191368, -1.599445, -1.935787, 1, 0, 0, 1, 1,
-0.6184233, -2.062645, -1.301621, 1, 0, 0, 1, 1,
-0.6155068, 0.4763953, -1.092716, 1, 0, 0, 1, 1,
-0.6132413, -1.248794, -3.413125, 1, 0, 0, 1, 1,
-0.6097881, 0.7197673, -1.036162, 1, 0, 0, 1, 1,
-0.6095016, -1.670917, -2.975373, 0, 0, 0, 1, 1,
-0.6015453, -0.1039524, -4.518757, 0, 0, 0, 1, 1,
-0.5985113, 0.5318397, -0.3580956, 0, 0, 0, 1, 1,
-0.5974447, -0.01512121, -1.054387, 0, 0, 0, 1, 1,
-0.5956067, 1.088785, -1.539699, 0, 0, 0, 1, 1,
-0.5945325, 0.358865, -0.8451306, 0, 0, 0, 1, 1,
-0.589606, -0.06342036, -1.525234, 0, 0, 0, 1, 1,
-0.5895031, 0.5437537, -0.6770788, 1, 1, 1, 1, 1,
-0.5822757, -0.1482061, -1.559444, 1, 1, 1, 1, 1,
-0.5805624, -2.189141, -4.385285, 1, 1, 1, 1, 1,
-0.575645, -0.2743734, -2.254666, 1, 1, 1, 1, 1,
-0.5726184, 0.668613, -0.08929006, 1, 1, 1, 1, 1,
-0.5666481, 0.3860683, -0.2789929, 1, 1, 1, 1, 1,
-0.5661394, 0.8119276, -1.472228, 1, 1, 1, 1, 1,
-0.5551465, 0.1853316, -1.787402, 1, 1, 1, 1, 1,
-0.5547587, -2.014669, -2.982298, 1, 1, 1, 1, 1,
-0.5520807, 0.1247049, -1.818742, 1, 1, 1, 1, 1,
-0.5500693, -1.047349, -2.201089, 1, 1, 1, 1, 1,
-0.5487531, 0.765062, 0.1032775, 1, 1, 1, 1, 1,
-0.5480737, 0.9811084, -0.4154523, 1, 1, 1, 1, 1,
-0.5406747, -1.918961, -1.434883, 1, 1, 1, 1, 1,
-0.5400834, 0.1339866, -1.495116, 1, 1, 1, 1, 1,
-0.5375862, 0.5010318, -1.139123, 0, 0, 1, 1, 1,
-0.5363414, 2.187371, -0.7646058, 1, 0, 0, 1, 1,
-0.534168, -0.4545042, -3.427576, 1, 0, 0, 1, 1,
-0.5339699, -0.6239789, -2.301315, 1, 0, 0, 1, 1,
-0.5318634, 0.4607218, -1.185623, 1, 0, 0, 1, 1,
-0.5310121, 0.5270776, -1.216305, 1, 0, 0, 1, 1,
-0.5265685, 0.07479344, -0.7175698, 0, 0, 0, 1, 1,
-0.5224944, 1.645138, -2.382641, 0, 0, 0, 1, 1,
-0.5130739, 0.2493417, -0.1521062, 0, 0, 0, 1, 1,
-0.5046278, -0.9357128, -4.463745, 0, 0, 0, 1, 1,
-0.5018039, 0.8821254, -0.5747332, 0, 0, 0, 1, 1,
-0.4984123, 0.3027917, 0.92523, 0, 0, 0, 1, 1,
-0.4941048, -0.09004375, -0.2751342, 0, 0, 0, 1, 1,
-0.4918883, -0.5963187, -2.865255, 1, 1, 1, 1, 1,
-0.4858502, -1.162799, -4.611141, 1, 1, 1, 1, 1,
-0.4824136, 1.355537, 0.03998802, 1, 1, 1, 1, 1,
-0.4803804, -0.1040536, -1.412879, 1, 1, 1, 1, 1,
-0.4738876, -0.1750896, -4.385781, 1, 1, 1, 1, 1,
-0.472254, 2.311016, -0.8782198, 1, 1, 1, 1, 1,
-0.4709848, -1.199795, -0.7804495, 1, 1, 1, 1, 1,
-0.468436, -0.7400026, -2.498452, 1, 1, 1, 1, 1,
-0.456311, 0.4183011, 1.312468, 1, 1, 1, 1, 1,
-0.452551, 1.293454, -0.04135066, 1, 1, 1, 1, 1,
-0.4510843, -0.8769209, -2.298947, 1, 1, 1, 1, 1,
-0.4471399, 1.447229, 1.304134, 1, 1, 1, 1, 1,
-0.4465886, -0.4742767, -2.406021, 1, 1, 1, 1, 1,
-0.4454939, 0.2343562, -1.327006, 1, 1, 1, 1, 1,
-0.4426917, -0.4622662, -1.945935, 1, 1, 1, 1, 1,
-0.4397205, -2.038589, -2.333669, 0, 0, 1, 1, 1,
-0.4363124, 0.2670768, 0.05032276, 1, 0, 0, 1, 1,
-0.435969, -0.7064037, -1.438708, 1, 0, 0, 1, 1,
-0.4347655, -0.7278174, -1.987791, 1, 0, 0, 1, 1,
-0.4287201, -0.2502153, -1.495476, 1, 0, 0, 1, 1,
-0.4258678, -0.08188134, -1.7598, 1, 0, 0, 1, 1,
-0.4188398, 0.3965559, 0.6647178, 0, 0, 0, 1, 1,
-0.4144631, -0.1051487, -4.035794, 0, 0, 0, 1, 1,
-0.4142981, -0.7434367, -1.258261, 0, 0, 0, 1, 1,
-0.4135146, -0.4060188, -3.175978, 0, 0, 0, 1, 1,
-0.4115704, 0.416104, -0.9389696, 0, 0, 0, 1, 1,
-0.4082239, 0.6377224, -0.5418457, 0, 0, 0, 1, 1,
-0.4042078, -0.214768, -3.25707, 0, 0, 0, 1, 1,
-0.4007299, 1.886388, -2.189868, 1, 1, 1, 1, 1,
-0.3989797, -0.2712533, -1.741506, 1, 1, 1, 1, 1,
-0.3935191, -0.4580327, -2.674643, 1, 1, 1, 1, 1,
-0.3926246, -0.9441807, -1.808324, 1, 1, 1, 1, 1,
-0.3917226, -0.8732832, -1.979809, 1, 1, 1, 1, 1,
-0.390727, -1.469439, -2.547737, 1, 1, 1, 1, 1,
-0.389312, -0.459456, -4.025194, 1, 1, 1, 1, 1,
-0.3891797, -0.2862626, -3.179526, 1, 1, 1, 1, 1,
-0.3889228, 0.2057401, -0.9601786, 1, 1, 1, 1, 1,
-0.3852037, -0.9728277, -3.605881, 1, 1, 1, 1, 1,
-0.3811049, 0.6068344, -1.800548, 1, 1, 1, 1, 1,
-0.3719089, 0.9199313, 0.4660023, 1, 1, 1, 1, 1,
-0.3683161, -1.559976, -2.403851, 1, 1, 1, 1, 1,
-0.3662601, 1.292938, -1.08833, 1, 1, 1, 1, 1,
-0.3641216, -0.5256498, -0.9215869, 1, 1, 1, 1, 1,
-0.360756, 0.5534641, 0.1708556, 0, 0, 1, 1, 1,
-0.3601795, -0.5914333, -4.228584, 1, 0, 0, 1, 1,
-0.3599423, 1.9118, -1.471942, 1, 0, 0, 1, 1,
-0.3596239, -1.724522, -2.233691, 1, 0, 0, 1, 1,
-0.3590301, 0.5996292, 0.4433187, 1, 0, 0, 1, 1,
-0.3583179, -0.2640351, -1.734056, 1, 0, 0, 1, 1,
-0.3543471, -1.817077, -3.594669, 0, 0, 0, 1, 1,
-0.3524502, 1.250893, -1.266559, 0, 0, 0, 1, 1,
-0.3486165, -0.9438936, -3.116503, 0, 0, 0, 1, 1,
-0.3427755, -0.2544309, -1.652605, 0, 0, 0, 1, 1,
-0.3413778, 0.7165352, -1.135936, 0, 0, 0, 1, 1,
-0.3402166, -0.1336271, -2.522493, 0, 0, 0, 1, 1,
-0.3382021, -0.2945951, -1.707804, 0, 0, 0, 1, 1,
-0.3341835, -0.2167686, -3.154387, 1, 1, 1, 1, 1,
-0.3319118, 1.219822, -0.751462, 1, 1, 1, 1, 1,
-0.3293846, -0.5453807, -3.777677, 1, 1, 1, 1, 1,
-0.3273907, 0.07223208, -0.5719405, 1, 1, 1, 1, 1,
-0.3224213, -2.059418, 0.4130527, 1, 1, 1, 1, 1,
-0.318647, -0.9634342, -2.957279, 1, 1, 1, 1, 1,
-0.3183697, -1.18448, -4.366534, 1, 1, 1, 1, 1,
-0.3162923, -0.9362058, -4.247844, 1, 1, 1, 1, 1,
-0.3151655, 1.152996, -0.6795644, 1, 1, 1, 1, 1,
-0.3127894, 0.2133957, -0.7549866, 1, 1, 1, 1, 1,
-0.311416, 0.4242334, -2.09743, 1, 1, 1, 1, 1,
-0.3106484, -1.54, -3.702132, 1, 1, 1, 1, 1,
-0.3091105, 0.3873327, -0.5876341, 1, 1, 1, 1, 1,
-0.3050137, 0.3167922, -0.7567233, 1, 1, 1, 1, 1,
-0.2969434, 0.395735, 0.04115163, 1, 1, 1, 1, 1,
-0.294507, -0.9910502, -2.434733, 0, 0, 1, 1, 1,
-0.2939365, -1.437217, -2.372308, 1, 0, 0, 1, 1,
-0.2914479, 0.9530613, -1.267498, 1, 0, 0, 1, 1,
-0.291149, -0.8047078, -2.200912, 1, 0, 0, 1, 1,
-0.289841, 0.3412346, -1.881644, 1, 0, 0, 1, 1,
-0.2869027, -0.9992616, -3.115108, 1, 0, 0, 1, 1,
-0.2852852, 0.8866561, 0.05816958, 0, 0, 0, 1, 1,
-0.2821485, 1.61684, 1.256255, 0, 0, 0, 1, 1,
-0.2817953, -0.3898976, -2.833401, 0, 0, 0, 1, 1,
-0.2795878, 0.3174698, -1.283906, 0, 0, 0, 1, 1,
-0.2785061, 1.56591, 0.1036884, 0, 0, 0, 1, 1,
-0.2744184, -0.4253617, -2.703572, 0, 0, 0, 1, 1,
-0.269112, 0.9952936, 1.893159, 0, 0, 0, 1, 1,
-0.2670074, -0.8130964, -3.631058, 1, 1, 1, 1, 1,
-0.2611381, -0.8772637, -1.96953, 1, 1, 1, 1, 1,
-0.2596404, -2.8635, -1.909389, 1, 1, 1, 1, 1,
-0.257459, -1.233548, -1.9226, 1, 1, 1, 1, 1,
-0.2566696, -1.511042, -4.292583, 1, 1, 1, 1, 1,
-0.2558745, -0.9717728, -3.243244, 1, 1, 1, 1, 1,
-0.251819, -0.8846795, -4.206208, 1, 1, 1, 1, 1,
-0.2477849, -1.747995, -3.587146, 1, 1, 1, 1, 1,
-0.2476914, 0.5020641, 0.688283, 1, 1, 1, 1, 1,
-0.2476226, 0.2374151, 1.903155, 1, 1, 1, 1, 1,
-0.2441472, -1.621102, -3.896978, 1, 1, 1, 1, 1,
-0.2409629, -0.3135284, -3.003571, 1, 1, 1, 1, 1,
-0.2404592, -0.7601836, -3.963582, 1, 1, 1, 1, 1,
-0.2384911, -1.52856, -5.109426, 1, 1, 1, 1, 1,
-0.2339553, -1.719636, -4.735714, 1, 1, 1, 1, 1,
-0.232835, 0.5974374, 0.442741, 0, 0, 1, 1, 1,
-0.2299865, 0.3183265, -0.2443805, 1, 0, 0, 1, 1,
-0.2285649, -0.2357265, -2.164163, 1, 0, 0, 1, 1,
-0.2216282, 0.7603837, -0.402754, 1, 0, 0, 1, 1,
-0.2159174, 0.5320523, -0.6520232, 1, 0, 0, 1, 1,
-0.2129158, -1.009981, -2.1964, 1, 0, 0, 1, 1,
-0.2117226, -0.4592541, -3.132238, 0, 0, 0, 1, 1,
-0.2112868, 1.223426, -0.1105727, 0, 0, 0, 1, 1,
-0.2043063, 1.031747, 0.3013872, 0, 0, 0, 1, 1,
-0.2031005, -0.1287887, -2.63322, 0, 0, 0, 1, 1,
-0.201729, 0.06016545, -2.306171, 0, 0, 0, 1, 1,
-0.2006261, 2.004753, 0.1550186, 0, 0, 0, 1, 1,
-0.2003876, -1.177116, -3.487833, 0, 0, 0, 1, 1,
-0.2001416, -0.3143807, -1.446396, 1, 1, 1, 1, 1,
-0.1946335, 0.3021784, -1.448799, 1, 1, 1, 1, 1,
-0.1930384, 0.283319, 0.4176858, 1, 1, 1, 1, 1,
-0.1903283, -0.6030354, -3.625587, 1, 1, 1, 1, 1,
-0.1890807, -0.04917071, -1.17961, 1, 1, 1, 1, 1,
-0.1830111, 0.326248, -0.8132753, 1, 1, 1, 1, 1,
-0.1771006, -0.1804716, -1.46499, 1, 1, 1, 1, 1,
-0.174115, -0.2289992, -2.95655, 1, 1, 1, 1, 1,
-0.1725715, -0.5913763, -5.207336, 1, 1, 1, 1, 1,
-0.1659855, -1.197928, -2.377381, 1, 1, 1, 1, 1,
-0.1652975, 0.4126901, -1.267546, 1, 1, 1, 1, 1,
-0.1650826, 0.4581994, -0.7913266, 1, 1, 1, 1, 1,
-0.1646836, -0.6453668, -2.466141, 1, 1, 1, 1, 1,
-0.1595735, 1.257197, 0.08707783, 1, 1, 1, 1, 1,
-0.1571519, 0.04235026, -1.006184, 1, 1, 1, 1, 1,
-0.1532063, 0.04682935, -1.820843, 0, 0, 1, 1, 1,
-0.1511457, -0.1966818, -3.357829, 1, 0, 0, 1, 1,
-0.1490249, -0.4369923, -1.014039, 1, 0, 0, 1, 1,
-0.1489358, -0.6264809, -3.118675, 1, 0, 0, 1, 1,
-0.1432969, 0.4448177, -0.03999433, 1, 0, 0, 1, 1,
-0.1403224, -0.168698, -1.134457, 1, 0, 0, 1, 1,
-0.1386705, -0.3516784, -3.157267, 0, 0, 0, 1, 1,
-0.1383114, -0.3813464, -3.155205, 0, 0, 0, 1, 1,
-0.1324987, 0.3583098, -0.6054233, 0, 0, 0, 1, 1,
-0.1309737, 0.4522691, 0.5518842, 0, 0, 0, 1, 1,
-0.1301251, -3.216905, -1.703024, 0, 0, 0, 1, 1,
-0.1282487, 2.159779, 0.6866222, 0, 0, 0, 1, 1,
-0.1280534, -0.9371589, -1.75977, 0, 0, 0, 1, 1,
-0.1239179, -0.3918794, -1.760649, 1, 1, 1, 1, 1,
-0.1235878, 2.695417, -0.006817792, 1, 1, 1, 1, 1,
-0.1230729, 1.169644, -0.1772483, 1, 1, 1, 1, 1,
-0.1190543, -0.1621535, -1.626514, 1, 1, 1, 1, 1,
-0.1169655, 1.590091, -1.136734, 1, 1, 1, 1, 1,
-0.112637, 0.2594675, -1.101158, 1, 1, 1, 1, 1,
-0.1114739, 0.3955145, -0.415149, 1, 1, 1, 1, 1,
-0.1110655, -1.988199, -4.144304, 1, 1, 1, 1, 1,
-0.1071945, -0.7206362, -2.252658, 1, 1, 1, 1, 1,
-0.1027826, -0.1879779, -2.539629, 1, 1, 1, 1, 1,
-0.1023496, 0.6612294, -0.1021293, 1, 1, 1, 1, 1,
-0.1023059, 1.246072, 0.1685411, 1, 1, 1, 1, 1,
-0.1017051, 0.9515112, 1.360177, 1, 1, 1, 1, 1,
-0.100473, -0.2811515, -2.2269, 1, 1, 1, 1, 1,
-0.0968829, -0.3978823, -2.036756, 1, 1, 1, 1, 1,
-0.09145485, -0.298717, -1.79068, 0, 0, 1, 1, 1,
-0.08911258, 2.174903, -0.9101635, 1, 0, 0, 1, 1,
-0.08892228, -0.2840163, -3.783752, 1, 0, 0, 1, 1,
-0.08846403, -0.6262238, -3.364838, 1, 0, 0, 1, 1,
-0.08462021, 0.5999036, -0.2715199, 1, 0, 0, 1, 1,
-0.08354534, 0.52019, -0.6217558, 1, 0, 0, 1, 1,
-0.08260851, -0.1892526, -3.04122, 0, 0, 0, 1, 1,
-0.08032724, 0.2489351, -0.2265426, 0, 0, 0, 1, 1,
-0.07436599, -0.1703711, -4.695947, 0, 0, 0, 1, 1,
-0.07021861, 1.052819, -0.9851316, 0, 0, 0, 1, 1,
-0.06784115, 0.3670702, -0.4506071, 0, 0, 0, 1, 1,
-0.0656053, 0.02734398, -1.560171, 0, 0, 0, 1, 1,
-0.06494216, 1.513923, -0.5522447, 0, 0, 0, 1, 1,
-0.05760603, -0.3681004, -0.3028804, 1, 1, 1, 1, 1,
-0.05384946, 0.2443212, -0.8169042, 1, 1, 1, 1, 1,
-0.05277139, -2.476145, -3.944971, 1, 1, 1, 1, 1,
-0.05241124, -0.2243335, -2.762911, 1, 1, 1, 1, 1,
-0.05230211, -0.8907591, -0.1857273, 1, 1, 1, 1, 1,
-0.05067641, -0.3487521, -1.73872, 1, 1, 1, 1, 1,
-0.04645644, -0.2066477, -1.738568, 1, 1, 1, 1, 1,
-0.04514609, 0.4565205, -2.573391, 1, 1, 1, 1, 1,
-0.04412619, 0.5270934, -0.8959493, 1, 1, 1, 1, 1,
-0.04394945, -1.057177, -3.945043, 1, 1, 1, 1, 1,
-0.03847818, 2.100415, 0.3546028, 1, 1, 1, 1, 1,
-0.03813209, -1.639632, -3.665591, 1, 1, 1, 1, 1,
-0.03631901, -1.246059, -4.105014, 1, 1, 1, 1, 1,
-0.0343306, -1.335643, -2.378299, 1, 1, 1, 1, 1,
-0.02959693, -1.121393, -3.387538, 1, 1, 1, 1, 1,
-0.02805452, -2.667712, -4.080582, 0, 0, 1, 1, 1,
-0.02402413, 0.3576467, -0.4275133, 1, 0, 0, 1, 1,
-0.02131332, -0.9225456, -3.524088, 1, 0, 0, 1, 1,
-0.01202223, 0.7676283, 0.9930601, 1, 0, 0, 1, 1,
-0.007848802, 1.73957, -1.605389, 1, 0, 0, 1, 1,
-0.006559576, 0.2904983, -0.8183216, 1, 0, 0, 1, 1,
-0.006521332, 0.8177555, -0.7847555, 0, 0, 0, 1, 1,
-0.003019447, -0.2665944, -2.327175, 0, 0, 0, 1, 1,
0.01489476, 1.309629, -0.5139722, 0, 0, 0, 1, 1,
0.01747792, -0.2322215, 0.5225917, 0, 0, 0, 1, 1,
0.01767583, 1.3838, -0.07764728, 0, 0, 0, 1, 1,
0.02029494, -1.842491, 2.240744, 0, 0, 0, 1, 1,
0.0213342, -0.4632168, 2.282367, 0, 0, 0, 1, 1,
0.02169298, -0.2022444, 2.659564, 1, 1, 1, 1, 1,
0.02470195, 0.2827509, 1.047952, 1, 1, 1, 1, 1,
0.02712855, 0.07221211, 0.01170095, 1, 1, 1, 1, 1,
0.02893552, 0.3049099, 0.6082103, 1, 1, 1, 1, 1,
0.03452287, -0.7291694, 2.043812, 1, 1, 1, 1, 1,
0.03849059, -2.18599, 2.863309, 1, 1, 1, 1, 1,
0.03869969, -0.08457355, 1.053095, 1, 1, 1, 1, 1,
0.03980928, -0.0880326, 3.319892, 1, 1, 1, 1, 1,
0.04102725, -0.7574588, 2.491612, 1, 1, 1, 1, 1,
0.04801892, 0.2406141, 0.3451487, 1, 1, 1, 1, 1,
0.04971359, -0.4597131, 2.672094, 1, 1, 1, 1, 1,
0.05256409, -0.8716488, 1.454258, 1, 1, 1, 1, 1,
0.06218852, 0.4087809, -1.607906, 1, 1, 1, 1, 1,
0.06685448, 0.5320166, 0.6827409, 1, 1, 1, 1, 1,
0.07149113, -0.6156684, 2.780671, 1, 1, 1, 1, 1,
0.07180884, 0.871817, 1.744733, 0, 0, 1, 1, 1,
0.07289216, -0.05891042, 2.178341, 1, 0, 0, 1, 1,
0.07654135, 0.5255275, -0.853986, 1, 0, 0, 1, 1,
0.08418335, 0.5463021, -0.1337543, 1, 0, 0, 1, 1,
0.09018801, -0.1001248, 0.7986017, 1, 0, 0, 1, 1,
0.09133712, 1.175125, -0.2112776, 1, 0, 0, 1, 1,
0.0936774, 1.949101, 0.7773924, 0, 0, 0, 1, 1,
0.0991409, 0.9553981, -1.544629, 0, 0, 0, 1, 1,
0.1008809, -2.429242, 1.91985, 0, 0, 0, 1, 1,
0.1029508, 1.179693, -0.9153059, 0, 0, 0, 1, 1,
0.1035918, 1.028123, 0.5194036, 0, 0, 0, 1, 1,
0.1068808, 0.9382029, -0.3544601, 0, 0, 0, 1, 1,
0.1071621, -0.5975479, 2.497485, 0, 0, 0, 1, 1,
0.1092039, 0.7102351, 0.5841444, 1, 1, 1, 1, 1,
0.1178562, 0.2370244, 1.159628, 1, 1, 1, 1, 1,
0.1190298, 0.1679248, 0.3648798, 1, 1, 1, 1, 1,
0.1244157, -1.10026, 1.86597, 1, 1, 1, 1, 1,
0.1247316, 2.25563, 1.213045, 1, 1, 1, 1, 1,
0.1250978, 0.5124074, 1.171697, 1, 1, 1, 1, 1,
0.1253455, -0.636735, 3.944801, 1, 1, 1, 1, 1,
0.1278186, -0.3180695, 2.953832, 1, 1, 1, 1, 1,
0.13112, 0.2028143, 0.2762695, 1, 1, 1, 1, 1,
0.1314434, 0.4529115, 1.990189, 1, 1, 1, 1, 1,
0.1338264, -0.9138656, 2.211913, 1, 1, 1, 1, 1,
0.1343041, -0.116863, 0.2468608, 1, 1, 1, 1, 1,
0.1354224, 1.829087, 0.1607287, 1, 1, 1, 1, 1,
0.1376435, 0.8958812, 0.5771018, 1, 1, 1, 1, 1,
0.1435279, -0.593653, 3.155448, 1, 1, 1, 1, 1,
0.1454067, 0.4619657, 0.5973849, 0, 0, 1, 1, 1,
0.1461433, 0.2155498, 3.116787, 1, 0, 0, 1, 1,
0.147056, 1.167843, 0.6023718, 1, 0, 0, 1, 1,
0.1527246, 0.7693483, 0.1620928, 1, 0, 0, 1, 1,
0.1610106, 0.9127296, -2.142793, 1, 0, 0, 1, 1,
0.1695167, 0.6746876, 1.652189, 1, 0, 0, 1, 1,
0.171682, 0.579956, -1.044947, 0, 0, 0, 1, 1,
0.1726123, 1.06653, 0.1883408, 0, 0, 0, 1, 1,
0.1751909, -0.2943483, 1.696037, 0, 0, 0, 1, 1,
0.1757419, -0.4923676, 3.149573, 0, 0, 0, 1, 1,
0.1757424, 0.4659879, 0.4418864, 0, 0, 0, 1, 1,
0.1757883, -0.449293, 2.537778, 0, 0, 0, 1, 1,
0.1792348, 1.193625, 0.6314303, 0, 0, 0, 1, 1,
0.1796272, 1.10425, 0.4535663, 1, 1, 1, 1, 1,
0.1823605, 1.016075, 0.4615234, 1, 1, 1, 1, 1,
0.1829331, -0.4034679, 2.853256, 1, 1, 1, 1, 1,
0.1845348, -0.4452591, 1.291872, 1, 1, 1, 1, 1,
0.1857523, -0.8946049, 2.566916, 1, 1, 1, 1, 1,
0.1908574, 0.5603136, 0.8747485, 1, 1, 1, 1, 1,
0.190964, 0.645631, 0.2878255, 1, 1, 1, 1, 1,
0.1926768, 0.4137765, 1.438162, 1, 1, 1, 1, 1,
0.1936008, -0.06413596, 1.441869, 1, 1, 1, 1, 1,
0.1991055, 0.6456956, 2.186142, 1, 1, 1, 1, 1,
0.2035168, 0.5149925, 0.05211603, 1, 1, 1, 1, 1,
0.2043596, -0.9886724, 2.781663, 1, 1, 1, 1, 1,
0.2059683, 1.218374, -0.5387784, 1, 1, 1, 1, 1,
0.2069077, -1.216239, 3.156715, 1, 1, 1, 1, 1,
0.2083122, -1.217368, 1.938587, 1, 1, 1, 1, 1,
0.2125396, -0.8720749, 0.5700453, 0, 0, 1, 1, 1,
0.215337, 0.3337719, -0.4863611, 1, 0, 0, 1, 1,
0.2242614, -0.8188925, 2.252873, 1, 0, 0, 1, 1,
0.2268239, 1.086776, -0.02874114, 1, 0, 0, 1, 1,
0.2277849, 1.037712, -0.5979925, 1, 0, 0, 1, 1,
0.2310697, 1.204158, -0.172175, 1, 0, 0, 1, 1,
0.2335422, -0.1590275, 0.1640958, 0, 0, 0, 1, 1,
0.2353157, -1.294613, 3.352615, 0, 0, 0, 1, 1,
0.2355655, -0.5176883, 1.603384, 0, 0, 0, 1, 1,
0.2355658, 0.9594744, 1.374313, 0, 0, 0, 1, 1,
0.2365394, 0.7472082, 0.3764769, 0, 0, 0, 1, 1,
0.237273, 0.9463044, 1.450898, 0, 0, 0, 1, 1,
0.2420475, -0.2388499, 2.61996, 0, 0, 0, 1, 1,
0.2422896, 0.8668854, 0.8685505, 1, 1, 1, 1, 1,
0.2434155, -0.5140464, 3.006596, 1, 1, 1, 1, 1,
0.243915, 0.7326331, -1.079251, 1, 1, 1, 1, 1,
0.2448473, -1.837585, 2.128916, 1, 1, 1, 1, 1,
0.2454582, 0.9519794, -0.05351381, 1, 1, 1, 1, 1,
0.251565, -0.7240781, 1.687703, 1, 1, 1, 1, 1,
0.2553183, 0.2622492, 0.6156875, 1, 1, 1, 1, 1,
0.2580158, -0.8711722, 2.747383, 1, 1, 1, 1, 1,
0.2588345, 1.237713, 0.3885855, 1, 1, 1, 1, 1,
0.2665114, 0.0785623, 1.426714, 1, 1, 1, 1, 1,
0.267247, 0.03645634, 1.297823, 1, 1, 1, 1, 1,
0.2708555, 0.213202, 1.821987, 1, 1, 1, 1, 1,
0.2714499, -2.153449, 1.061709, 1, 1, 1, 1, 1,
0.27263, -1.746205, 2.287754, 1, 1, 1, 1, 1,
0.2806729, -0.6501848, 3.233733, 1, 1, 1, 1, 1,
0.288423, 1.974994, -0.06749979, 0, 0, 1, 1, 1,
0.2885415, 1.347582, 1.275957, 1, 0, 0, 1, 1,
0.2886392, 0.1089708, 1.268199, 1, 0, 0, 1, 1,
0.2898283, 0.4616129, 1.303459, 1, 0, 0, 1, 1,
0.2907006, -1.801654, 4.159747, 1, 0, 0, 1, 1,
0.2945611, 0.2487515, 1.376455, 1, 0, 0, 1, 1,
0.3002502, -2.720778, 1.367803, 0, 0, 0, 1, 1,
0.3013057, 0.04196206, 2.968796, 0, 0, 0, 1, 1,
0.3015856, -0.109591, 1.32616, 0, 0, 0, 1, 1,
0.3022391, 0.1347445, 1.089057, 0, 0, 0, 1, 1,
0.3026532, 1.566635, 1.596137, 0, 0, 0, 1, 1,
0.3093481, -1.290917, 4.66318, 0, 0, 0, 1, 1,
0.3122488, -0.1769219, 2.389743, 0, 0, 0, 1, 1,
0.3129861, -0.2902569, -0.4862013, 1, 1, 1, 1, 1,
0.3175659, -0.2943376, 3.693614, 1, 1, 1, 1, 1,
0.3198052, -0.9768668, 3.590396, 1, 1, 1, 1, 1,
0.3199731, -0.2322641, 3.554657, 1, 1, 1, 1, 1,
0.320385, 1.068502, 1.547444, 1, 1, 1, 1, 1,
0.323628, 0.6044903, 0.3561499, 1, 1, 1, 1, 1,
0.3249418, -0.959901, 2.553167, 1, 1, 1, 1, 1,
0.3256027, 1.572471, -0.1955623, 1, 1, 1, 1, 1,
0.3287095, -0.9113997, 2.792327, 1, 1, 1, 1, 1,
0.3291486, -1.455898, 4.00302, 1, 1, 1, 1, 1,
0.3291669, -1.328871, 1.258977, 1, 1, 1, 1, 1,
0.32951, 1.218734, 0.2390282, 1, 1, 1, 1, 1,
0.3321937, 1.222548, 0.8446222, 1, 1, 1, 1, 1,
0.335706, -0.05204948, 2.40554, 1, 1, 1, 1, 1,
0.3423682, 0.6961755, 0.5739207, 1, 1, 1, 1, 1,
0.343285, -0.8569097, 2.316831, 0, 0, 1, 1, 1,
0.3453899, -1.249002, 2.938687, 1, 0, 0, 1, 1,
0.3467087, -2.110495, 2.659915, 1, 0, 0, 1, 1,
0.3471912, -0.8901581, 2.012733, 1, 0, 0, 1, 1,
0.34874, -0.8174857, 2.802783, 1, 0, 0, 1, 1,
0.3500975, -0.2439466, 1.664985, 1, 0, 0, 1, 1,
0.3538423, -0.6101561, 0.4727751, 0, 0, 0, 1, 1,
0.3555906, -0.335511, 1.931232, 0, 0, 0, 1, 1,
0.3600212, -1.022574, 3.407815, 0, 0, 0, 1, 1,
0.3618462, 0.7579762, -0.4097209, 0, 0, 0, 1, 1,
0.3720693, -0.8474723, 3.341546, 0, 0, 0, 1, 1,
0.3721628, 0.5989544, 0.09879266, 0, 0, 0, 1, 1,
0.3725439, 0.2743591, 2.46623, 0, 0, 0, 1, 1,
0.3729454, -0.321559, -0.2181809, 1, 1, 1, 1, 1,
0.3767953, -0.5520793, 2.386204, 1, 1, 1, 1, 1,
0.3829333, -0.3303183, 2.90636, 1, 1, 1, 1, 1,
0.3850206, 0.4294976, -0.06431819, 1, 1, 1, 1, 1,
0.3878058, 1.171659, -1.399227, 1, 1, 1, 1, 1,
0.3934782, 0.1273707, 1.958147, 1, 1, 1, 1, 1,
0.3936612, 0.06395778, 0.6765964, 1, 1, 1, 1, 1,
0.3982753, -0.5333332, 0.4491227, 1, 1, 1, 1, 1,
0.4075866, 0.09356897, 1.291613, 1, 1, 1, 1, 1,
0.4081299, 0.1507125, 0.8026045, 1, 1, 1, 1, 1,
0.4185914, -0.3255313, -0.04958006, 1, 1, 1, 1, 1,
0.4191804, -0.5849321, 2.873691, 1, 1, 1, 1, 1,
0.424897, 0.8207341, 1.529803, 1, 1, 1, 1, 1,
0.425028, -0.7081672, 0.835051, 1, 1, 1, 1, 1,
0.4264745, 0.2373239, 0.3706078, 1, 1, 1, 1, 1,
0.4266588, -1.159464, 4.289575, 0, 0, 1, 1, 1,
0.4269603, 2.452538, 0.4486116, 1, 0, 0, 1, 1,
0.4282828, -0.653559, 2.79437, 1, 0, 0, 1, 1,
0.432975, 0.5315537, 0.03746014, 1, 0, 0, 1, 1,
0.4356926, -0.7733423, 3.781355, 1, 0, 0, 1, 1,
0.435769, 0.9363701, 0.5393794, 1, 0, 0, 1, 1,
0.4364125, -0.6209706, 2.822626, 0, 0, 0, 1, 1,
0.4379792, 0.08278205, 0.3519855, 0, 0, 0, 1, 1,
0.4390409, 0.7377666, -0.7556139, 0, 0, 0, 1, 1,
0.4391636, 0.4953052, 1.416597, 0, 0, 0, 1, 1,
0.4393734, -1.862636, 2.266979, 0, 0, 0, 1, 1,
0.4442988, 0.5497887, 1.40234, 0, 0, 0, 1, 1,
0.446017, -0.2331235, 1.727493, 0, 0, 0, 1, 1,
0.4460797, 0.6476948, 2.691307, 1, 1, 1, 1, 1,
0.447261, 0.9619811, 1.25656, 1, 1, 1, 1, 1,
0.4476489, -1.991039, 2.162414, 1, 1, 1, 1, 1,
0.4508324, -0.8928323, 1.862284, 1, 1, 1, 1, 1,
0.4536847, 0.574236, 0.6125852, 1, 1, 1, 1, 1,
0.4594722, 0.2191992, 1.519235, 1, 1, 1, 1, 1,
0.4633471, -1.246847, 3.211163, 1, 1, 1, 1, 1,
0.463396, -1.296089, 2.199134, 1, 1, 1, 1, 1,
0.4681658, 0.326074, 0.9147679, 1, 1, 1, 1, 1,
0.4714655, 1.330559, 0.7169803, 1, 1, 1, 1, 1,
0.4719587, 1.280711, 0.2115909, 1, 1, 1, 1, 1,
0.4801698, 0.6365811, 2.699223, 1, 1, 1, 1, 1,
0.488469, -0.6888697, 2.363291, 1, 1, 1, 1, 1,
0.4962305, -0.8907489, 3.85443, 1, 1, 1, 1, 1,
0.4996563, -1.053913, 2.898066, 1, 1, 1, 1, 1,
0.5035877, 0.4363454, 1.208355, 0, 0, 1, 1, 1,
0.5085021, -0.3924532, 3.414825, 1, 0, 0, 1, 1,
0.5143023, -0.4689767, 1.274049, 1, 0, 0, 1, 1,
0.5169119, 1.168767, -0.7683493, 1, 0, 0, 1, 1,
0.5196992, -0.4431356, 1.449413, 1, 0, 0, 1, 1,
0.5230281, -0.6039312, 2.874904, 1, 0, 0, 1, 1,
0.5265077, -0.1462849, 2.841464, 0, 0, 0, 1, 1,
0.526613, 1.666964, 1.443894, 0, 0, 0, 1, 1,
0.5268534, -0.1108094, 1.289114, 0, 0, 0, 1, 1,
0.5333488, -0.5208228, 2.329112, 0, 0, 0, 1, 1,
0.5422152, -0.8614347, 2.657833, 0, 0, 0, 1, 1,
0.5451383, -1.64534, 3.403051, 0, 0, 0, 1, 1,
0.5457896, -0.7931271, 1.792634, 0, 0, 0, 1, 1,
0.5477252, -1.229154, 1.292196, 1, 1, 1, 1, 1,
0.5496683, -0.723155, 1.525668, 1, 1, 1, 1, 1,
0.5522562, -0.325826, 0.05950184, 1, 1, 1, 1, 1,
0.5543367, 0.6230511, 1.084199, 1, 1, 1, 1, 1,
0.5569769, 0.6753604, 2.148984, 1, 1, 1, 1, 1,
0.5594144, 0.3119648, 1.148847, 1, 1, 1, 1, 1,
0.5661312, -0.566452, 1.609415, 1, 1, 1, 1, 1,
0.5709255, -0.9196051, 0.6911997, 1, 1, 1, 1, 1,
0.5712998, -0.6046183, 1.816262, 1, 1, 1, 1, 1,
0.5721912, -0.9545991, 1.775558, 1, 1, 1, 1, 1,
0.5767652, -0.3538698, 3.202858, 1, 1, 1, 1, 1,
0.5788214, 1.275285, 0.4464791, 1, 1, 1, 1, 1,
0.5802684, -0.7071258, 2.296196, 1, 1, 1, 1, 1,
0.5809149, 0.02150157, 3.311822, 1, 1, 1, 1, 1,
0.5833689, 0.02941243, 2.091917, 1, 1, 1, 1, 1,
0.5888149, -1.666931, 4.390782, 0, 0, 1, 1, 1,
0.5914089, -0.6871871, 3.377072, 1, 0, 0, 1, 1,
0.5938622, 1.53744, -0.5513139, 1, 0, 0, 1, 1,
0.5977317, 0.8732277, 1.476984, 1, 0, 0, 1, 1,
0.6074658, -1.912007, 1.786671, 1, 0, 0, 1, 1,
0.6300676, 0.4609086, 2.536221, 1, 0, 0, 1, 1,
0.6330938, -0.8641317, 0.5798759, 0, 0, 0, 1, 1,
0.6341923, 1.341571, 0.2908376, 0, 0, 0, 1, 1,
0.6358588, -0.8135104, 2.850404, 0, 0, 0, 1, 1,
0.6394407, 0.3148451, -0.2800434, 0, 0, 0, 1, 1,
0.6406429, -0.2785915, 3.14429, 0, 0, 0, 1, 1,
0.648365, 0.5630387, 1.510467, 0, 0, 0, 1, 1,
0.6485615, -0.248217, 2.339638, 0, 0, 0, 1, 1,
0.6507888, 1.148735, 0.3627443, 1, 1, 1, 1, 1,
0.6508986, 0.02168814, 1.057197, 1, 1, 1, 1, 1,
0.6527774, 1.76314, -1.174042, 1, 1, 1, 1, 1,
0.6548432, 0.5384079, -0.1117228, 1, 1, 1, 1, 1,
0.6573067, -1.858641, 2.820683, 1, 1, 1, 1, 1,
0.6586816, -0.08004881, 2.274144, 1, 1, 1, 1, 1,
0.662519, 1.809566, 0.5510297, 1, 1, 1, 1, 1,
0.6641999, -0.3135489, 4.276693, 1, 1, 1, 1, 1,
0.6668176, -0.1070448, 2.45015, 1, 1, 1, 1, 1,
0.6684578, 0.8240783, 1.307653, 1, 1, 1, 1, 1,
0.6718062, 0.05974836, 2.413637, 1, 1, 1, 1, 1,
0.6738485, 0.1357574, 0.4156134, 1, 1, 1, 1, 1,
0.6755617, 0.1811463, 0.6791815, 1, 1, 1, 1, 1,
0.6891895, -0.1869409, 0.4644734, 1, 1, 1, 1, 1,
0.6991099, -0.2980772, 3.010912, 1, 1, 1, 1, 1,
0.6995522, -2.08056, 5.174689, 0, 0, 1, 1, 1,
0.7046909, 0.7659754, 1.816259, 1, 0, 0, 1, 1,
0.7055685, -1.045189, 2.213726, 1, 0, 0, 1, 1,
0.7064005, 1.129347, -0.6233585, 1, 0, 0, 1, 1,
0.7084862, 0.5910931, 2.382642, 1, 0, 0, 1, 1,
0.7119705, 1.888139, -0.4393075, 1, 0, 0, 1, 1,
0.7121078, 0.22712, 2.18216, 0, 0, 0, 1, 1,
0.7131161, -0.41839, 1.745399, 0, 0, 0, 1, 1,
0.715914, 0.4900311, 1.338569, 0, 0, 0, 1, 1,
0.7191887, 0.7533084, 0.5710708, 0, 0, 0, 1, 1,
0.7200503, -0.7885253, 3.387766, 0, 0, 0, 1, 1,
0.723369, -1.530164, 2.675784, 0, 0, 0, 1, 1,
0.7305471, 0.2012052, 1.189907, 0, 0, 0, 1, 1,
0.7308468, 0.9685062, 1.652194, 1, 1, 1, 1, 1,
0.7328668, 0.1759402, 1.001148, 1, 1, 1, 1, 1,
0.744879, -2.687562, 3.584211, 1, 1, 1, 1, 1,
0.7481842, -0.6134291, 3.794606, 1, 1, 1, 1, 1,
0.7559117, -0.6783658, 1.293722, 1, 1, 1, 1, 1,
0.7572005, 0.4501243, 1.460814, 1, 1, 1, 1, 1,
0.7600561, 0.1186743, 1.879978, 1, 1, 1, 1, 1,
0.7647636, -3.020325, 1.36588, 1, 1, 1, 1, 1,
0.7655488, 0.395296, 1.155802, 1, 1, 1, 1, 1,
0.7675994, 0.2912942, 0.7758718, 1, 1, 1, 1, 1,
0.7684214, -1.081212, 1.442115, 1, 1, 1, 1, 1,
0.7723604, -0.1840325, 2.47399, 1, 1, 1, 1, 1,
0.7736755, -0.6640695, 2.460515, 1, 1, 1, 1, 1,
0.7770835, -0.5759887, 3.883347, 1, 1, 1, 1, 1,
0.7780321, -0.4952902, 2.858688, 1, 1, 1, 1, 1,
0.7828702, -1.738058, 2.804572, 0, 0, 1, 1, 1,
0.7863807, 1.751985, 0.417169, 1, 0, 0, 1, 1,
0.7879552, 0.06588493, 1.652836, 1, 0, 0, 1, 1,
0.7970704, -0.700335, 2.809251, 1, 0, 0, 1, 1,
0.8064439, -0.3704793, 2.696027, 1, 0, 0, 1, 1,
0.8074599, -0.5442899, 2.043064, 1, 0, 0, 1, 1,
0.8141282, -0.09439933, 0.7863725, 0, 0, 0, 1, 1,
0.8257822, 0.4851511, 2.426925, 0, 0, 0, 1, 1,
0.8289593, -0.223894, 1.915893, 0, 0, 0, 1, 1,
0.8298962, -1.645864, 3.796623, 0, 0, 0, 1, 1,
0.8320819, 0.8773082, 1.665752, 0, 0, 0, 1, 1,
0.8338445, 0.8590639, 1.555584, 0, 0, 0, 1, 1,
0.8416135, -0.2786299, 3.327704, 0, 0, 0, 1, 1,
0.8465009, -0.9594933, 2.648638, 1, 1, 1, 1, 1,
0.8545511, 0.4135075, -0.2260489, 1, 1, 1, 1, 1,
0.8634409, -0.4435475, 1.761008, 1, 1, 1, 1, 1,
0.8656579, -0.8588905, 3.85984, 1, 1, 1, 1, 1,
0.868467, -1.723059, 3.236423, 1, 1, 1, 1, 1,
0.8727468, -1.638371, 3.957511, 1, 1, 1, 1, 1,
0.8749061, 1.0676, 0.6986081, 1, 1, 1, 1, 1,
0.8758416, -0.09264363, 2.6615, 1, 1, 1, 1, 1,
0.8764064, -1.053826, 2.805274, 1, 1, 1, 1, 1,
0.8766317, 1.778103, 0.1340816, 1, 1, 1, 1, 1,
0.8861352, -1.28797, 2.14011, 1, 1, 1, 1, 1,
0.8871492, 1.043513, 1.648873, 1, 1, 1, 1, 1,
0.8890885, -0.042491, 0.1051352, 1, 1, 1, 1, 1,
0.8895246, 0.7324767, 0.3381032, 1, 1, 1, 1, 1,
0.8934298, 0.0780059, 1.857969, 1, 1, 1, 1, 1,
0.8936197, -0.2717057, 3.458145, 0, 0, 1, 1, 1,
0.9011276, 0.4552816, 0.9166206, 1, 0, 0, 1, 1,
0.9025437, 1.973196, 0.1557231, 1, 0, 0, 1, 1,
0.9072871, 1.400891, 1.534489, 1, 0, 0, 1, 1,
0.9077075, -1.695288, 1.878081, 1, 0, 0, 1, 1,
0.9107257, -1.27826, 1.313873, 1, 0, 0, 1, 1,
0.9115871, 1.011703, -0.8740302, 0, 0, 0, 1, 1,
0.9259552, 0.5829393, -0.2133531, 0, 0, 0, 1, 1,
0.9270583, 0.3679723, 1.385833, 0, 0, 0, 1, 1,
0.9309831, -0.1278941, 3.080188, 0, 0, 0, 1, 1,
0.9405105, 0.923635, 0.6536723, 0, 0, 0, 1, 1,
0.9538166, -0.04581399, 1.082235, 0, 0, 0, 1, 1,
0.9544979, 0.5895407, 1.338819, 0, 0, 0, 1, 1,
0.9561543, -0.5917885, 1.625319, 1, 1, 1, 1, 1,
0.9591832, 1.128155, 1.526644, 1, 1, 1, 1, 1,
0.9611104, -0.6451614, 2.1058, 1, 1, 1, 1, 1,
0.9653797, 0.4616081, 0.171965, 1, 1, 1, 1, 1,
0.9697959, -3.13029, 2.270528, 1, 1, 1, 1, 1,
0.9747022, 0.05979539, 1.868001, 1, 1, 1, 1, 1,
0.9846255, 1.60171, 0.7055171, 1, 1, 1, 1, 1,
0.991232, -0.9025376, 2.688436, 1, 1, 1, 1, 1,
1.006753, -1.521126, 2.963593, 1, 1, 1, 1, 1,
1.009228, -0.03597244, 1.488693, 1, 1, 1, 1, 1,
1.016806, -0.6760657, 3.130588, 1, 1, 1, 1, 1,
1.022329, -0.4417336, 1.947878, 1, 1, 1, 1, 1,
1.029138, 0.9008043, 2.201092, 1, 1, 1, 1, 1,
1.031709, -1.955513, 2.428943, 1, 1, 1, 1, 1,
1.036809, -0.8033445, 2.943142, 1, 1, 1, 1, 1,
1.038084, -0.311409, 4.625877, 0, 0, 1, 1, 1,
1.041058, -0.9611434, 2.360714, 1, 0, 0, 1, 1,
1.044635, -0.4967132, 0.5295222, 1, 0, 0, 1, 1,
1.051347, 0.1539118, 2.33408, 1, 0, 0, 1, 1,
1.051654, 2.193443, 0.4426364, 1, 0, 0, 1, 1,
1.058701, 0.6272717, 2.985137, 1, 0, 0, 1, 1,
1.061478, -0.1621986, 1.412557, 0, 0, 0, 1, 1,
1.069117, -0.7885522, 1.721128, 0, 0, 0, 1, 1,
1.069371, -0.9128687, 1.971376, 0, 0, 0, 1, 1,
1.07173, 0.6769123, 1.97161, 0, 0, 0, 1, 1,
1.07363, 0.2185708, 0.3437096, 0, 0, 0, 1, 1,
1.076807, -1.472738, 3.047168, 0, 0, 0, 1, 1,
1.081787, -0.917847, 3.615685, 0, 0, 0, 1, 1,
1.089208, 0.8778926, 0.2766761, 1, 1, 1, 1, 1,
1.090054, -0.8787212, 1.426556, 1, 1, 1, 1, 1,
1.091346, -0.3739825, 2.411993, 1, 1, 1, 1, 1,
1.096198, -1.195136, 3.957797, 1, 1, 1, 1, 1,
1.096311, -1.285499, 3.096343, 1, 1, 1, 1, 1,
1.097121, 0.1489007, 2.119397, 1, 1, 1, 1, 1,
1.097325, 1.699266, 0.7449708, 1, 1, 1, 1, 1,
1.101811, 0.3208455, 1.877724, 1, 1, 1, 1, 1,
1.107138, -1.262913, 1.409935, 1, 1, 1, 1, 1,
1.109668, 0.6564795, 0.366573, 1, 1, 1, 1, 1,
1.114853, -0.9819706, 1.172599, 1, 1, 1, 1, 1,
1.117269, 0.4432611, 1.3525, 1, 1, 1, 1, 1,
1.127009, 0.2673633, 3.357635, 1, 1, 1, 1, 1,
1.130878, 0.6036527, 1.725088, 1, 1, 1, 1, 1,
1.136289, 0.3128495, 2.388477, 1, 1, 1, 1, 1,
1.137577, 0.2565857, -0.336109, 0, 0, 1, 1, 1,
1.140915, -0.2517565, 2.030082, 1, 0, 0, 1, 1,
1.161163, 0.328499, -0.1639843, 1, 0, 0, 1, 1,
1.165049, -0.6793184, 2.229751, 1, 0, 0, 1, 1,
1.170725, -0.03085409, 2.044286, 1, 0, 0, 1, 1,
1.179907, -0.3032768, 1.741727, 1, 0, 0, 1, 1,
1.184446, -2.699247, 2.631446, 0, 0, 0, 1, 1,
1.185889, 0.1779775, 1.231344, 0, 0, 0, 1, 1,
1.189139, 1.658095, 0.4784655, 0, 0, 0, 1, 1,
1.192854, 0.3232778, 1.02318, 0, 0, 0, 1, 1,
1.193506, 0.6828057, 1.073739, 0, 0, 0, 1, 1,
1.197429, -0.7318345, 1.14436, 0, 0, 0, 1, 1,
1.202532, 1.339417, 0.6711043, 0, 0, 0, 1, 1,
1.212245, 0.02224461, 2.161528, 1, 1, 1, 1, 1,
1.217236, 0.2160976, 1.885386, 1, 1, 1, 1, 1,
1.217771, 3.229602, 0.3669746, 1, 1, 1, 1, 1,
1.2244, -1.163511, 2.200516, 1, 1, 1, 1, 1,
1.225229, 0.1389287, 1.455979, 1, 1, 1, 1, 1,
1.225909, 0.4246571, -0.4810269, 1, 1, 1, 1, 1,
1.226063, 0.8395315, 0.8024269, 1, 1, 1, 1, 1,
1.228962, -0.5902779, 2.288182, 1, 1, 1, 1, 1,
1.230301, 0.7015647, 1.79767, 1, 1, 1, 1, 1,
1.231981, 0.3185569, 0.5215668, 1, 1, 1, 1, 1,
1.244887, -0.312743, 1.624422, 1, 1, 1, 1, 1,
1.247959, 0.5775602, 0.5278568, 1, 1, 1, 1, 1,
1.250471, -1.038983, 1.608616, 1, 1, 1, 1, 1,
1.251652, -0.1761278, 1.284655, 1, 1, 1, 1, 1,
1.253959, 0.02596758, 2.744294, 1, 1, 1, 1, 1,
1.257874, -0.297355, 3.289607, 0, 0, 1, 1, 1,
1.270978, 0.1034765, 0.07767732, 1, 0, 0, 1, 1,
1.271792, 1.442166, 0.3306528, 1, 0, 0, 1, 1,
1.274082, -0.3348522, 0.8826485, 1, 0, 0, 1, 1,
1.281851, -0.4696981, 2.290055, 1, 0, 0, 1, 1,
1.286393, 0.9585047, 0.6418237, 1, 0, 0, 1, 1,
1.29158, -0.6138009, 2.67904, 0, 0, 0, 1, 1,
1.294712, 0.7486044, 1.635216, 0, 0, 0, 1, 1,
1.299255, 1.418828, 1.586901, 0, 0, 0, 1, 1,
1.308604, 0.8868341, -1.071602, 0, 0, 0, 1, 1,
1.311792, 0.2449067, 1.963727, 0, 0, 0, 1, 1,
1.315733, 0.08078848, 2.698496, 0, 0, 0, 1, 1,
1.32158, 0.7260438, 0.6014023, 0, 0, 0, 1, 1,
1.332742, -0.4295896, 4.230818, 1, 1, 1, 1, 1,
1.345934, 0.2547657, 0.857853, 1, 1, 1, 1, 1,
1.349167, -1.199573, 2.766623, 1, 1, 1, 1, 1,
1.351735, -0.1495353, 1.51728, 1, 1, 1, 1, 1,
1.357803, -0.7691903, 0.4509951, 1, 1, 1, 1, 1,
1.366489, 0.427465, -0.2068394, 1, 1, 1, 1, 1,
1.370924, -1.171657, 3.016768, 1, 1, 1, 1, 1,
1.379502, 0.4366947, -0.08391165, 1, 1, 1, 1, 1,
1.406821, -2.407655, 1.964408, 1, 1, 1, 1, 1,
1.409548, 0.9722772, 1.487392, 1, 1, 1, 1, 1,
1.42541, 2.226136, 1.917548, 1, 1, 1, 1, 1,
1.425518, 0.2567745, 2.663761, 1, 1, 1, 1, 1,
1.436391, 0.1737277, 2.683663, 1, 1, 1, 1, 1,
1.437158, 1.693768, 0.530166, 1, 1, 1, 1, 1,
1.439716, -0.5982463, -0.09745096, 1, 1, 1, 1, 1,
1.459183, -0.5482251, 3.17836, 0, 0, 1, 1, 1,
1.460138, -0.1427519, 1.387746, 1, 0, 0, 1, 1,
1.465287, -0.01981068, 1.127106, 1, 0, 0, 1, 1,
1.47657, 0.6166303, 0.1344065, 1, 0, 0, 1, 1,
1.480434, -0.2640276, 1.523834, 1, 0, 0, 1, 1,
1.481477, -0.7794768, 3.921175, 1, 0, 0, 1, 1,
1.482556, -0.3966991, 0.771508, 0, 0, 0, 1, 1,
1.484606, -1.280897, 3.186552, 0, 0, 0, 1, 1,
1.521239, 0.6335307, -0.6837053, 0, 0, 0, 1, 1,
1.527849, -0.4119835, 0.1884474, 0, 0, 0, 1, 1,
1.563496, -1.31594, 4.971846, 0, 0, 0, 1, 1,
1.578321, -0.7508413, 1.147966, 0, 0, 0, 1, 1,
1.581201, 0.7663206, 1.190943, 0, 0, 0, 1, 1,
1.594106, -0.3720518, 2.398786, 1, 1, 1, 1, 1,
1.594223, -0.2911606, 1.163861, 1, 1, 1, 1, 1,
1.595214, -0.2732311, 1.342405, 1, 1, 1, 1, 1,
1.596223, -2.45624, 1.881287, 1, 1, 1, 1, 1,
1.611125, 0.09405237, 0.3813368, 1, 1, 1, 1, 1,
1.611949, 1.286092, 1.486051, 1, 1, 1, 1, 1,
1.626479, 0.5189072, 2.630568, 1, 1, 1, 1, 1,
1.626598, -0.2561333, 2.686904, 1, 1, 1, 1, 1,
1.637983, -2.164092, 2.095396, 1, 1, 1, 1, 1,
1.642445, 0.1616638, 1.931375, 1, 1, 1, 1, 1,
1.646467, 1.87674, 2.624234, 1, 1, 1, 1, 1,
1.652486, 2.264702, 2.399464, 1, 1, 1, 1, 1,
1.658151, -1.198644, 1.637448, 1, 1, 1, 1, 1,
1.658898, -0.06527207, 3.973331, 1, 1, 1, 1, 1,
1.665956, -0.03459289, 2.316026, 1, 1, 1, 1, 1,
1.675201, -0.3888105, 0.6209858, 0, 0, 1, 1, 1,
1.681745, -0.4045348, 2.679605, 1, 0, 0, 1, 1,
1.695866, -0.669982, 3.263368, 1, 0, 0, 1, 1,
1.699889, 1.174067, 0.1901396, 1, 0, 0, 1, 1,
1.726436, -1.223197, 2.1566, 1, 0, 0, 1, 1,
1.727959, -0.1595693, 3.021391, 1, 0, 0, 1, 1,
1.739764, 0.6629964, 3.267967, 0, 0, 0, 1, 1,
1.762039, 0.09905047, 2.131015, 0, 0, 0, 1, 1,
1.767809, 0.2379469, 3.266964, 0, 0, 0, 1, 1,
1.772063, 0.09499843, 0.9656806, 0, 0, 0, 1, 1,
1.800856, -0.1779997, 2.507121, 0, 0, 0, 1, 1,
1.82235, -0.9900827, 1.54795, 0, 0, 0, 1, 1,
1.829779, -2.43689, 2.055597, 0, 0, 0, 1, 1,
1.835974, 0.8446523, 2.125237, 1, 1, 1, 1, 1,
1.843014, -0.05052439, 2.263643, 1, 1, 1, 1, 1,
1.855613, 0.6100091, 2.679193, 1, 1, 1, 1, 1,
1.87147, 1.048173, -1.077511, 1, 1, 1, 1, 1,
1.872405, -0.1383417, 1.900949, 1, 1, 1, 1, 1,
1.872797, -0.8073547, 2.171526, 1, 1, 1, 1, 1,
1.89096, -0.7876163, 1.084496, 1, 1, 1, 1, 1,
1.892162, -1.700706, 1.619385, 1, 1, 1, 1, 1,
1.894963, 0.5046847, 1.739378, 1, 1, 1, 1, 1,
1.913562, -0.315196, 3.155719, 1, 1, 1, 1, 1,
1.931885, 0.9170336, -0.06972344, 1, 1, 1, 1, 1,
1.980174, 0.3775754, 0.1145465, 1, 1, 1, 1, 1,
1.991184, 0.6013932, 0.6502038, 1, 1, 1, 1, 1,
1.992532, -0.06556187, 1.623223, 1, 1, 1, 1, 1,
2.005871, -0.4954021, 4.456756, 1, 1, 1, 1, 1,
2.01351, -1.07076, 4.895068, 0, 0, 1, 1, 1,
2.099795, 0.6631172, 1.652097, 1, 0, 0, 1, 1,
2.130524, -0.940176, 1.001228, 1, 0, 0, 1, 1,
2.134497, -1.197522, 3.885364, 1, 0, 0, 1, 1,
2.138087, 0.001915152, 2.402403, 1, 0, 0, 1, 1,
2.140636, 1.670282, -0.4515433, 1, 0, 0, 1, 1,
2.168676, -0.184447, 0.1814741, 0, 0, 0, 1, 1,
2.172136, -0.1049955, 1.328237, 0, 0, 0, 1, 1,
2.179633, 0.3645292, 1.285477, 0, 0, 0, 1, 1,
2.202272, -0.07637829, 1.728439, 0, 0, 0, 1, 1,
2.214327, 0.07080972, 0.1623209, 0, 0, 0, 1, 1,
2.293778, -1.513186, 3.899858, 0, 0, 0, 1, 1,
2.333736, 0.8333426, 1.065925, 0, 0, 0, 1, 1,
2.363072, -0.009390589, 1.313827, 1, 1, 1, 1, 1,
2.404607, 0.8945531, 0.984827, 1, 1, 1, 1, 1,
2.4321, 1.106732, 0.433879, 1, 1, 1, 1, 1,
2.632381, -0.5703776, 0.3672843, 1, 1, 1, 1, 1,
2.712005, -0.3733793, 1.946909, 1, 1, 1, 1, 1,
2.976896, -1.198431, 0.8139589, 1, 1, 1, 1, 1,
3.122259, 1.683279, 2.196268, 1, 1, 1, 1, 1
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
var radius = 9.486106;
var distance = 33.31955;
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
mvMatrix.translate( -0.01152372, 0.1455524, 0.0163238 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.31955);
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
