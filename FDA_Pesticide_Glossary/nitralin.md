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
-2.938628, -1.005827, -1.020314, 1, 0, 0, 1,
-2.889233, 0.2666045, -0.6988326, 1, 0.007843138, 0, 1,
-2.873541, -0.3102154, -1.160678, 1, 0.01176471, 0, 1,
-2.83852, -0.2102464, -3.919731, 1, 0.01960784, 0, 1,
-2.702799, 0.1723611, -2.691055, 1, 0.02352941, 0, 1,
-2.596483, 1.075805, -0.3437334, 1, 0.03137255, 0, 1,
-2.557558, -0.1184249, -2.745642, 1, 0.03529412, 0, 1,
-2.500484, -0.613616, -3.168818, 1, 0.04313726, 0, 1,
-2.483627, -0.0001612017, -1.270223, 1, 0.04705882, 0, 1,
-2.442892, 2.020252, -1.328341, 1, 0.05490196, 0, 1,
-2.406485, 1.506988, 1.09328, 1, 0.05882353, 0, 1,
-2.350562, 0.698554, -1.53948, 1, 0.06666667, 0, 1,
-2.320687, -0.1144277, -1.683121, 1, 0.07058824, 0, 1,
-2.273277, -0.5417049, -1.912076, 1, 0.07843138, 0, 1,
-2.24866, -0.5528539, -3.103848, 1, 0.08235294, 0, 1,
-2.245455, -0.5623755, -0.1312043, 1, 0.09019608, 0, 1,
-2.215091, -1.718846, -3.265613, 1, 0.09411765, 0, 1,
-2.174041, -0.8568239, -1.583694, 1, 0.1019608, 0, 1,
-2.131026, 1.223823, -1.868313, 1, 0.1098039, 0, 1,
-2.128708, -0.2742794, -0.5721672, 1, 0.1137255, 0, 1,
-2.10485, 0.4128405, -2.167888, 1, 0.1215686, 0, 1,
-2.049176, -0.659347, -1.365212, 1, 0.1254902, 0, 1,
-2.042457, 0.7612607, -0.8824071, 1, 0.1333333, 0, 1,
-2.032182, 0.4342234, -1.419473, 1, 0.1372549, 0, 1,
-1.994419, -0.1671302, -1.547462, 1, 0.145098, 0, 1,
-1.988056, -0.06983056, -2.036849, 1, 0.1490196, 0, 1,
-1.971965, 0.3912216, -1.568677, 1, 0.1568628, 0, 1,
-1.96123, 0.88613, -0.3123335, 1, 0.1607843, 0, 1,
-1.946099, 0.4722278, -1.95631, 1, 0.1686275, 0, 1,
-1.918688, 1.222563, -0.6243532, 1, 0.172549, 0, 1,
-1.911833, 1.990091, 0.08010951, 1, 0.1803922, 0, 1,
-1.833404, 1.115785, -0.1049975, 1, 0.1843137, 0, 1,
-1.822118, 0.464623, -1.086249, 1, 0.1921569, 0, 1,
-1.821702, -1.334115, -2.454608, 1, 0.1960784, 0, 1,
-1.813871, 0.813179, -1.221168, 1, 0.2039216, 0, 1,
-1.792843, 0.9761632, -1.489682, 1, 0.2117647, 0, 1,
-1.786147, -0.6419073, -1.401265, 1, 0.2156863, 0, 1,
-1.778273, 1.088531, -2.178791, 1, 0.2235294, 0, 1,
-1.757101, -0.6088343, -2.143556, 1, 0.227451, 0, 1,
-1.741609, 0.7119716, -0.9806033, 1, 0.2352941, 0, 1,
-1.741558, 0.6903001, -0.23356, 1, 0.2392157, 0, 1,
-1.689935, 1.140003, -1.922691, 1, 0.2470588, 0, 1,
-1.67007, -0.5253135, -1.216544, 1, 0.2509804, 0, 1,
-1.666007, -0.5896777, -2.082102, 1, 0.2588235, 0, 1,
-1.631312, -0.2138604, -2.613405, 1, 0.2627451, 0, 1,
-1.62475, -0.01705431, -2.344297, 1, 0.2705882, 0, 1,
-1.616603, 0.5320729, -0.9039049, 1, 0.2745098, 0, 1,
-1.607456, 1.103591, 0.04381609, 1, 0.282353, 0, 1,
-1.60335, 0.4272594, -1.50225, 1, 0.2862745, 0, 1,
-1.599481, 1.409311, -0.3263879, 1, 0.2941177, 0, 1,
-1.59788, -0.1451073, -1.472118, 1, 0.3019608, 0, 1,
-1.587368, -0.5848978, -1.31241, 1, 0.3058824, 0, 1,
-1.586321, 0.5928632, -1.940869, 1, 0.3137255, 0, 1,
-1.583075, 1.805959, -0.7083428, 1, 0.3176471, 0, 1,
-1.569871, -1.198754, -3.294798, 1, 0.3254902, 0, 1,
-1.557021, -1.04006, -1.552659, 1, 0.3294118, 0, 1,
-1.541072, -1.290583, -1.217559, 1, 0.3372549, 0, 1,
-1.53943, -0.6705709, -0.4507681, 1, 0.3411765, 0, 1,
-1.53727, 0.8058925, -2.275873, 1, 0.3490196, 0, 1,
-1.528377, 0.8773826, -1.21802, 1, 0.3529412, 0, 1,
-1.515845, -0.4838253, -2.171041, 1, 0.3607843, 0, 1,
-1.488896, -0.643737, -1.197057, 1, 0.3647059, 0, 1,
-1.4843, -0.2151826, -1.741138, 1, 0.372549, 0, 1,
-1.480446, 0.9776588, -0.9032374, 1, 0.3764706, 0, 1,
-1.474188, 1.163799, -0.8009676, 1, 0.3843137, 0, 1,
-1.471071, -1.87915, -2.642034, 1, 0.3882353, 0, 1,
-1.458972, -0.4762104, -2.04329, 1, 0.3960784, 0, 1,
-1.454798, 0.703789, -1.435816, 1, 0.4039216, 0, 1,
-1.451834, 0.7500075, -1.197856, 1, 0.4078431, 0, 1,
-1.442857, -0.531144, -1.664245, 1, 0.4156863, 0, 1,
-1.436214, -1.359331, -2.130254, 1, 0.4196078, 0, 1,
-1.433652, 0.9304106, -0.06068872, 1, 0.427451, 0, 1,
-1.431152, -2.218762, -2.131433, 1, 0.4313726, 0, 1,
-1.427477, -0.9604423, -2.436129, 1, 0.4392157, 0, 1,
-1.409922, 2.015551, -1.953953, 1, 0.4431373, 0, 1,
-1.408325, -0.1998833, -1.693013, 1, 0.4509804, 0, 1,
-1.405925, -0.8406057, -0.8036785, 1, 0.454902, 0, 1,
-1.405667, -0.1685996, -1.468861, 1, 0.4627451, 0, 1,
-1.404322, 0.3128175, -3.379756, 1, 0.4666667, 0, 1,
-1.403577, 0.8489699, 0.2705911, 1, 0.4745098, 0, 1,
-1.389979, 0.3466108, 0.03199537, 1, 0.4784314, 0, 1,
-1.384566, 0.4567497, 0.7895855, 1, 0.4862745, 0, 1,
-1.377117, 2.064636, -2.461116, 1, 0.4901961, 0, 1,
-1.360309, 1.83597, -1.482374, 1, 0.4980392, 0, 1,
-1.356275, 1.015984, -0.04089467, 1, 0.5058824, 0, 1,
-1.34826, -0.3644163, -2.384892, 1, 0.509804, 0, 1,
-1.332609, 2.486506, -1.981661, 1, 0.5176471, 0, 1,
-1.331251, 1.157712, -0.6891183, 1, 0.5215687, 0, 1,
-1.325255, 2.158599, -1.378724, 1, 0.5294118, 0, 1,
-1.324899, -0.3538791, -1.262503, 1, 0.5333334, 0, 1,
-1.320845, 0.2698317, -1.326986, 1, 0.5411765, 0, 1,
-1.302963, 0.5437629, -0.9452024, 1, 0.5450981, 0, 1,
-1.302117, -1.37406, -0.2099355, 1, 0.5529412, 0, 1,
-1.30124, -0.1119759, -1.733491, 1, 0.5568628, 0, 1,
-1.296113, -0.1769954, -3.082813, 1, 0.5647059, 0, 1,
-1.292371, -0.1229239, -0.8254575, 1, 0.5686275, 0, 1,
-1.290728, -0.005843169, -0.2629057, 1, 0.5764706, 0, 1,
-1.284274, 1.042659, -2.505718, 1, 0.5803922, 0, 1,
-1.282236, 0.1151951, -1.862585, 1, 0.5882353, 0, 1,
-1.277346, -0.5810179, -2.049747, 1, 0.5921569, 0, 1,
-1.276592, -0.8073596, -2.104653, 1, 0.6, 0, 1,
-1.273759, -1.070259, -2.938689, 1, 0.6078432, 0, 1,
-1.272391, -1.691297, -1.341703, 1, 0.6117647, 0, 1,
-1.268642, 0.2057216, -1.24973, 1, 0.6196079, 0, 1,
-1.261425, 0.4821748, -0.9556708, 1, 0.6235294, 0, 1,
-1.260749, 1.288807, 0.4608721, 1, 0.6313726, 0, 1,
-1.257377, 0.4470734, -1.497249, 1, 0.6352941, 0, 1,
-1.255034, -0.9731301, -1.026823, 1, 0.6431373, 0, 1,
-1.252113, 1.968557, 0.9102471, 1, 0.6470588, 0, 1,
-1.252002, 1.007928, 0.09961268, 1, 0.654902, 0, 1,
-1.249362, 0.7587464, -1.800011, 1, 0.6588235, 0, 1,
-1.249084, -1.411044, -3.448164, 1, 0.6666667, 0, 1,
-1.248431, 0.2651619, -2.363785, 1, 0.6705883, 0, 1,
-1.246271, 1.014534, -0.9782324, 1, 0.6784314, 0, 1,
-1.243123, 0.4161548, -1.267921, 1, 0.682353, 0, 1,
-1.231811, 0.1553263, -1.369543, 1, 0.6901961, 0, 1,
-1.224267, -1.818796, -2.393982, 1, 0.6941177, 0, 1,
-1.217242, -1.503546, -2.927897, 1, 0.7019608, 0, 1,
-1.212855, -0.8728541, -0.9568014, 1, 0.7098039, 0, 1,
-1.20044, 1.449188, -1.704915, 1, 0.7137255, 0, 1,
-1.179939, 0.9925654, 0.3881814, 1, 0.7215686, 0, 1,
-1.178752, 1.025727, -1.389514, 1, 0.7254902, 0, 1,
-1.178239, -0.648122, -1.234144, 1, 0.7333333, 0, 1,
-1.169294, -1.537486, -2.149507, 1, 0.7372549, 0, 1,
-1.156115, -0.06052895, -1.149989, 1, 0.7450981, 0, 1,
-1.152728, -0.4255603, -3.092056, 1, 0.7490196, 0, 1,
-1.148497, -0.2434973, -2.846976, 1, 0.7568628, 0, 1,
-1.148145, 0.4368764, -0.3835143, 1, 0.7607843, 0, 1,
-1.144563, 1.021496, -2.808905, 1, 0.7686275, 0, 1,
-1.142882, 0.2076672, -0.6370897, 1, 0.772549, 0, 1,
-1.142251, -0.8030324, -0.6877702, 1, 0.7803922, 0, 1,
-1.138066, -0.283861, -3.012989, 1, 0.7843137, 0, 1,
-1.135452, 0.3427925, -2.13023, 1, 0.7921569, 0, 1,
-1.131651, 0.1537621, -1.149478, 1, 0.7960784, 0, 1,
-1.128295, 0.2712677, -0.5870115, 1, 0.8039216, 0, 1,
-1.127646, -0.9335158, -2.723606, 1, 0.8117647, 0, 1,
-1.12667, 1.029166, -0.2813029, 1, 0.8156863, 0, 1,
-1.12427, -0.2272412, -1.257223, 1, 0.8235294, 0, 1,
-1.123189, 1.202871, -3.120233, 1, 0.827451, 0, 1,
-1.121955, -0.6889326, -2.552705, 1, 0.8352941, 0, 1,
-1.12162, -1.857093, -2.306777, 1, 0.8392157, 0, 1,
-1.120852, -0.6164215, -1.441132, 1, 0.8470588, 0, 1,
-1.120301, -0.2172147, -1.224689, 1, 0.8509804, 0, 1,
-1.120028, -0.1434774, -2.003426, 1, 0.8588235, 0, 1,
-1.11749, -0.322602, -1.794916, 1, 0.8627451, 0, 1,
-1.117234, -0.9873455, -2.63907, 1, 0.8705882, 0, 1,
-1.11683, 0.03407396, -0.7776482, 1, 0.8745098, 0, 1,
-1.109299, -0.2593107, -1.188466, 1, 0.8823529, 0, 1,
-1.10122, 0.4014537, 0.06307288, 1, 0.8862745, 0, 1,
-1.093199, -0.5874605, -3.157585, 1, 0.8941177, 0, 1,
-1.077526, -0.7419431, -0.8808408, 1, 0.8980392, 0, 1,
-1.074088, 0.6747183, 0.4815548, 1, 0.9058824, 0, 1,
-1.073361, 0.4126115, -1.391397, 1, 0.9137255, 0, 1,
-1.073152, 0.2058143, -0.4437659, 1, 0.9176471, 0, 1,
-1.071632, 1.183387, -0.8605728, 1, 0.9254902, 0, 1,
-1.054896, 0.9608413, -0.3207189, 1, 0.9294118, 0, 1,
-1.051205, -0.6545642, -2.298386, 1, 0.9372549, 0, 1,
-1.046146, -1.952546, -2.86914, 1, 0.9411765, 0, 1,
-1.04497, 0.5089524, -1.488292, 1, 0.9490196, 0, 1,
-1.044025, 0.8613694, -2.136732, 1, 0.9529412, 0, 1,
-1.040004, 0.6175425, -0.4996334, 1, 0.9607843, 0, 1,
-1.035469, 0.197969, -1.494498, 1, 0.9647059, 0, 1,
-1.032213, 0.6941122, -2.571768, 1, 0.972549, 0, 1,
-1.030644, -1.129219, -2.125726, 1, 0.9764706, 0, 1,
-1.015133, 0.4211959, -2.753155, 1, 0.9843137, 0, 1,
-1.01435, -0.7410351, -3.442927, 1, 0.9882353, 0, 1,
-0.9983124, 0.321205, -2.132048, 1, 0.9960784, 0, 1,
-0.9965423, -0.1240676, -1.408381, 0.9960784, 1, 0, 1,
-0.9905868, -2.056406, -3.25634, 0.9921569, 1, 0, 1,
-0.9846327, -0.4789033, -1.915414, 0.9843137, 1, 0, 1,
-0.9842211, 1.072835, -1.819823, 0.9803922, 1, 0, 1,
-0.9833899, 0.1621903, -3.192864, 0.972549, 1, 0, 1,
-0.981788, -0.2103013, -0.1640879, 0.9686275, 1, 0, 1,
-0.976805, -0.4425582, -1.47908, 0.9607843, 1, 0, 1,
-0.9766026, 1.449464, -1.213306, 0.9568627, 1, 0, 1,
-0.9722689, -0.8759908, -1.035556, 0.9490196, 1, 0, 1,
-0.9719595, 0.4806191, 0.279895, 0.945098, 1, 0, 1,
-0.9703142, -0.06266595, 0.04934982, 0.9372549, 1, 0, 1,
-0.9675176, -0.3049113, -3.118062, 0.9333333, 1, 0, 1,
-0.9650598, 1.9184, -0.08714708, 0.9254902, 1, 0, 1,
-0.9640509, -1.892736, 0.6940693, 0.9215686, 1, 0, 1,
-0.9539505, 0.8502187, -1.517797, 0.9137255, 1, 0, 1,
-0.9458204, 0.6192626, 0.6807529, 0.9098039, 1, 0, 1,
-0.940374, 1.845737, -0.4358624, 0.9019608, 1, 0, 1,
-0.935655, -0.6214386, -1.536376, 0.8941177, 1, 0, 1,
-0.9333158, -0.4290341, -1.365415, 0.8901961, 1, 0, 1,
-0.9319288, 0.5998431, -0.6180304, 0.8823529, 1, 0, 1,
-0.9200951, -2.275895, -1.942547, 0.8784314, 1, 0, 1,
-0.9089791, -0.499939, -1.186148, 0.8705882, 1, 0, 1,
-0.9077737, -3.114979, -1.738293, 0.8666667, 1, 0, 1,
-0.9073837, -1.027863, -3.358541, 0.8588235, 1, 0, 1,
-0.9039554, 0.8525529, -0.3597785, 0.854902, 1, 0, 1,
-0.8932206, -1.94336, -1.855032, 0.8470588, 1, 0, 1,
-0.8920063, 0.9856939, -1.683497, 0.8431373, 1, 0, 1,
-0.8838668, -1.689656, -3.746773, 0.8352941, 1, 0, 1,
-0.88162, -2.09103, -3.368991, 0.8313726, 1, 0, 1,
-0.8758162, 0.6260257, -0.5923296, 0.8235294, 1, 0, 1,
-0.873438, 0.1355074, -0.2185174, 0.8196079, 1, 0, 1,
-0.8729111, -0.343154, -4.079345, 0.8117647, 1, 0, 1,
-0.8709332, 0.1203957, -1.691734, 0.8078431, 1, 0, 1,
-0.8563644, -0.8401753, -3.449019, 0.8, 1, 0, 1,
-0.8505707, 0.4892322, -0.7632977, 0.7921569, 1, 0, 1,
-0.8490893, 1.053124, -1.128105, 0.7882353, 1, 0, 1,
-0.8450267, 1.01654, -0.2588224, 0.7803922, 1, 0, 1,
-0.8347619, 1.109694, -2.192677, 0.7764706, 1, 0, 1,
-0.8325157, 1.420959, -2.373848, 0.7686275, 1, 0, 1,
-0.8320825, 1.263826, 0.005110501, 0.7647059, 1, 0, 1,
-0.8298572, -0.8150799, -2.639046, 0.7568628, 1, 0, 1,
-0.8287981, 0.6211801, -1.67649, 0.7529412, 1, 0, 1,
-0.8246787, -1.737509, -0.7409924, 0.7450981, 1, 0, 1,
-0.8234867, 0.4246925, -0.8871586, 0.7411765, 1, 0, 1,
-0.8213348, 1.246115, -1.092394, 0.7333333, 1, 0, 1,
-0.8137768, 1.672996, 0.9700301, 0.7294118, 1, 0, 1,
-0.8118041, -0.01271943, -1.781343, 0.7215686, 1, 0, 1,
-0.8109008, 1.119425, 0.01868201, 0.7176471, 1, 0, 1,
-0.8098505, -2.059295, -3.643401, 0.7098039, 1, 0, 1,
-0.8097161, 2.274038, -0.862125, 0.7058824, 1, 0, 1,
-0.7984875, -0.5683933, -3.232891, 0.6980392, 1, 0, 1,
-0.7967546, 1.217577, 0.2760354, 0.6901961, 1, 0, 1,
-0.7953121, -1.300042, -2.5247, 0.6862745, 1, 0, 1,
-0.7931226, -0.3243445, -3.122973, 0.6784314, 1, 0, 1,
-0.7832936, 1.258893, -1.541663, 0.6745098, 1, 0, 1,
-0.7786822, 0.1300329, 0.3464172, 0.6666667, 1, 0, 1,
-0.7783471, -0.2077895, -1.907583, 0.6627451, 1, 0, 1,
-0.7783101, -0.1988177, -2.854078, 0.654902, 1, 0, 1,
-0.7725434, -0.7635701, -2.636394, 0.6509804, 1, 0, 1,
-0.7722296, 0.7861548, -1.838085, 0.6431373, 1, 0, 1,
-0.7695451, 1.106959, -0.7074065, 0.6392157, 1, 0, 1,
-0.7655693, 0.4518423, -1.214723, 0.6313726, 1, 0, 1,
-0.7647306, 0.05300395, -0.3521134, 0.627451, 1, 0, 1,
-0.7638228, -0.3710997, -2.479319, 0.6196079, 1, 0, 1,
-0.7582614, -0.7207828, -2.169201, 0.6156863, 1, 0, 1,
-0.7522963, 0.5436641, -0.9879546, 0.6078432, 1, 0, 1,
-0.7444368, 2.031207, -2.57233, 0.6039216, 1, 0, 1,
-0.7444346, 0.368257, 0.09081182, 0.5960785, 1, 0, 1,
-0.7442507, -0.4127331, -2.604387, 0.5882353, 1, 0, 1,
-0.7406684, 0.6793519, -1.150094, 0.5843138, 1, 0, 1,
-0.7405915, 0.3750033, -1.564027, 0.5764706, 1, 0, 1,
-0.739712, -0.06746219, -4.169549, 0.572549, 1, 0, 1,
-0.7384546, -0.8341567, -2.777122, 0.5647059, 1, 0, 1,
-0.7338006, 1.221399, 0.6590581, 0.5607843, 1, 0, 1,
-0.7335929, 1.181008, -0.7942348, 0.5529412, 1, 0, 1,
-0.727818, -0.7898058, -2.544933, 0.5490196, 1, 0, 1,
-0.7277056, 1.193851, -1.76746, 0.5411765, 1, 0, 1,
-0.7203701, -0.6700071, -1.74116, 0.5372549, 1, 0, 1,
-0.7165127, -0.8946669, -2.191047, 0.5294118, 1, 0, 1,
-0.7143401, -0.144962, -2.089785, 0.5254902, 1, 0, 1,
-0.7121221, 1.155488, -0.5905033, 0.5176471, 1, 0, 1,
-0.7114927, -1.246161, -2.52589, 0.5137255, 1, 0, 1,
-0.7111536, 0.4628716, -1.239042, 0.5058824, 1, 0, 1,
-0.7092036, -0.2541795, -2.178109, 0.5019608, 1, 0, 1,
-0.7069368, -0.9794004, -4.098092, 0.4941176, 1, 0, 1,
-0.701745, -0.4857381, -2.870366, 0.4862745, 1, 0, 1,
-0.6982298, 0.1976033, -3.350894, 0.4823529, 1, 0, 1,
-0.6976185, -1.822967, -3.279163, 0.4745098, 1, 0, 1,
-0.6975135, 1.300852, -0.5108451, 0.4705882, 1, 0, 1,
-0.6967893, 0.9046915, -2.159145, 0.4627451, 1, 0, 1,
-0.6953657, -2.288926, -2.016787, 0.4588235, 1, 0, 1,
-0.6948774, -1.23541, -2.716543, 0.4509804, 1, 0, 1,
-0.6945782, 1.071151, -0.6026434, 0.4470588, 1, 0, 1,
-0.6878016, -1.583663, -3.103543, 0.4392157, 1, 0, 1,
-0.6801568, 0.06256461, -1.511447, 0.4352941, 1, 0, 1,
-0.6775979, -0.2628488, -1.304445, 0.427451, 1, 0, 1,
-0.6748211, 0.453673, -3.098404, 0.4235294, 1, 0, 1,
-0.6707867, 0.4380827, -1.141902, 0.4156863, 1, 0, 1,
-0.6700228, -2.315982, -2.102916, 0.4117647, 1, 0, 1,
-0.6691481, -0.3312619, -2.547778, 0.4039216, 1, 0, 1,
-0.6674569, -0.6509507, -3.360559, 0.3960784, 1, 0, 1,
-0.6632668, -0.7540712, -0.5853746, 0.3921569, 1, 0, 1,
-0.6617302, -1.979864, -3.78912, 0.3843137, 1, 0, 1,
-0.6587183, -0.8734382, -2.90294, 0.3803922, 1, 0, 1,
-0.6573527, -0.1288579, -1.281452, 0.372549, 1, 0, 1,
-0.6560619, 0.01094778, -0.933565, 0.3686275, 1, 0, 1,
-0.6558143, -0.7988129, -3.84126, 0.3607843, 1, 0, 1,
-0.6534917, -1.884812, -1.94686, 0.3568628, 1, 0, 1,
-0.6496489, 0.01285177, -3.132879, 0.3490196, 1, 0, 1,
-0.6480594, 0.1169893, -1.55137, 0.345098, 1, 0, 1,
-0.6472771, 0.2329687, -0.2655965, 0.3372549, 1, 0, 1,
-0.6462007, 0.5072623, -1.277963, 0.3333333, 1, 0, 1,
-0.6409183, 0.2584848, -2.181404, 0.3254902, 1, 0, 1,
-0.6375602, -0.8073465, -1.743141, 0.3215686, 1, 0, 1,
-0.6351761, 0.2060149, -2.033227, 0.3137255, 1, 0, 1,
-0.6236197, -0.7071562, -3.652282, 0.3098039, 1, 0, 1,
-0.6207906, -0.2014886, -0.9367434, 0.3019608, 1, 0, 1,
-0.6197985, -0.7848363, -2.865607, 0.2941177, 1, 0, 1,
-0.6121821, -0.6275769, -2.043121, 0.2901961, 1, 0, 1,
-0.6037878, -0.7137729, -1.91556, 0.282353, 1, 0, 1,
-0.5982093, 1.250022, -0.1242227, 0.2784314, 1, 0, 1,
-0.5953645, 0.7779642, -2.17924, 0.2705882, 1, 0, 1,
-0.5946585, -0.3876995, -2.9135, 0.2666667, 1, 0, 1,
-0.5943342, 1.184183, -0.7010711, 0.2588235, 1, 0, 1,
-0.5942586, -0.4548561, -3.244574, 0.254902, 1, 0, 1,
-0.594015, -1.142521, -3.025269, 0.2470588, 1, 0, 1,
-0.5882819, -2.678875, -2.292306, 0.2431373, 1, 0, 1,
-0.5856776, -0.9701132, -2.159311, 0.2352941, 1, 0, 1,
-0.5836661, -0.1641905, -2.053465, 0.2313726, 1, 0, 1,
-0.5825505, -0.313469, -1.014701, 0.2235294, 1, 0, 1,
-0.5802604, -1.712728, -3.896262, 0.2196078, 1, 0, 1,
-0.5799181, -0.00374353, -1.81165, 0.2117647, 1, 0, 1,
-0.5768208, -0.9054511, -2.886516, 0.2078431, 1, 0, 1,
-0.5758097, -0.5021467, -3.500492, 0.2, 1, 0, 1,
-0.5639597, 0.8393777, -0.7318838, 0.1921569, 1, 0, 1,
-0.5609156, 1.890426, 0.5099559, 0.1882353, 1, 0, 1,
-0.5552756, -0.6521612, -2.879897, 0.1803922, 1, 0, 1,
-0.5548512, -0.06323145, -1.681737, 0.1764706, 1, 0, 1,
-0.5541859, 0.4542442, 0.2798616, 0.1686275, 1, 0, 1,
-0.5366161, -0.6888233, -3.419098, 0.1647059, 1, 0, 1,
-0.5338736, 0.105029, 0.005961579, 0.1568628, 1, 0, 1,
-0.5302743, 1.640382, 1.258707, 0.1529412, 1, 0, 1,
-0.5299147, -0.8265079, -2.581202, 0.145098, 1, 0, 1,
-0.5297195, 2.81885, 0.03870459, 0.1411765, 1, 0, 1,
-0.5268973, 0.1995741, -1.567244, 0.1333333, 1, 0, 1,
-0.5228063, 1.1509, -1.022294, 0.1294118, 1, 0, 1,
-0.5216413, -0.5895306, -2.547548, 0.1215686, 1, 0, 1,
-0.5211878, 2.201478, -0.9998262, 0.1176471, 1, 0, 1,
-0.5099552, -0.3683363, -0.9502249, 0.1098039, 1, 0, 1,
-0.5049878, 0.8754169, -0.5625376, 0.1058824, 1, 0, 1,
-0.5015996, -0.8152933, -4.193984, 0.09803922, 1, 0, 1,
-0.4972352, -0.9987525, -1.517745, 0.09019608, 1, 0, 1,
-0.4968409, 0.1034861, -1.25275, 0.08627451, 1, 0, 1,
-0.4967375, -0.5977238, -2.197881, 0.07843138, 1, 0, 1,
-0.4959141, 0.3023222, -1.531711, 0.07450981, 1, 0, 1,
-0.4918873, 0.3425964, 0.5879046, 0.06666667, 1, 0, 1,
-0.4888225, -0.1878607, -0.1370719, 0.0627451, 1, 0, 1,
-0.4869596, -0.4285112, -2.415358, 0.05490196, 1, 0, 1,
-0.4842341, -0.6968472, -2.816113, 0.05098039, 1, 0, 1,
-0.4720966, 0.8801409, -1.282256, 0.04313726, 1, 0, 1,
-0.4676774, 1.213271, 1.10226, 0.03921569, 1, 0, 1,
-0.4676167, -0.9514641, -3.779481, 0.03137255, 1, 0, 1,
-0.4663025, 0.650472, -1.81725, 0.02745098, 1, 0, 1,
-0.4591779, -0.2736267, -3.506401, 0.01960784, 1, 0, 1,
-0.4586896, 1.113247, -1.358576, 0.01568628, 1, 0, 1,
-0.4582962, -2.265684, -4.135541, 0.007843138, 1, 0, 1,
-0.4566031, 0.6416646, -0.8856528, 0.003921569, 1, 0, 1,
-0.4547157, -0.1651502, -0.8306907, 0, 1, 0.003921569, 1,
-0.4533472, 0.20564, -0.8718047, 0, 1, 0.01176471, 1,
-0.4486051, -0.6770744, -1.747265, 0, 1, 0.01568628, 1,
-0.447358, 2.412874, -1.05596, 0, 1, 0.02352941, 1,
-0.4472119, -0.3176889, -4.097991, 0, 1, 0.02745098, 1,
-0.4433665, -1.515883, -1.753175, 0, 1, 0.03529412, 1,
-0.4414226, 0.06871192, -0.5786431, 0, 1, 0.03921569, 1,
-0.4410381, 0.3660157, -1.128183, 0, 1, 0.04705882, 1,
-0.4323499, 0.3353636, -2.835205, 0, 1, 0.05098039, 1,
-0.4314988, -0.2685073, -1.275958, 0, 1, 0.05882353, 1,
-0.4312609, 0.3908915, 0.3624193, 0, 1, 0.0627451, 1,
-0.431186, 0.4871144, -1.066809, 0, 1, 0.07058824, 1,
-0.4299015, -1.070771, -2.77186, 0, 1, 0.07450981, 1,
-0.4298666, 1.301424, 0.4439112, 0, 1, 0.08235294, 1,
-0.4243857, 0.8153535, -0.6409908, 0, 1, 0.08627451, 1,
-0.4203522, 0.5840915, 0.6080524, 0, 1, 0.09411765, 1,
-0.419701, -2.319968, -3.800184, 0, 1, 0.1019608, 1,
-0.4177932, 1.305867, -1.277466, 0, 1, 0.1058824, 1,
-0.4175363, 1.088477, -2.172118, 0, 1, 0.1137255, 1,
-0.412105, 1.724412, 1.288074, 0, 1, 0.1176471, 1,
-0.4118892, 0.4257795, -1.476307, 0, 1, 0.1254902, 1,
-0.4110694, 0.796988, 0.5130979, 0, 1, 0.1294118, 1,
-0.4094938, -1.07404, -4.324745, 0, 1, 0.1372549, 1,
-0.4016794, 0.2279018, -0.6306765, 0, 1, 0.1411765, 1,
-0.3982334, -1.233004, -1.416746, 0, 1, 0.1490196, 1,
-0.3919768, 2.183629, -0.1904591, 0, 1, 0.1529412, 1,
-0.390584, -1.682398, -2.697973, 0, 1, 0.1607843, 1,
-0.3884068, -0.6375883, -2.770953, 0, 1, 0.1647059, 1,
-0.386214, -0.07341585, -2.43613, 0, 1, 0.172549, 1,
-0.3845608, -1.234104, -3.07461, 0, 1, 0.1764706, 1,
-0.3834228, -0.8406086, -2.374792, 0, 1, 0.1843137, 1,
-0.3807305, -0.1705984, -2.985387, 0, 1, 0.1882353, 1,
-0.3765429, 0.05020097, -0.7057968, 0, 1, 0.1960784, 1,
-0.3755534, 1.133382, 0.07995925, 0, 1, 0.2039216, 1,
-0.3718725, 0.3759618, -0.1230413, 0, 1, 0.2078431, 1,
-0.3700329, -0.2787641, -2.000177, 0, 1, 0.2156863, 1,
-0.3670264, -0.8615024, -3.546836, 0, 1, 0.2196078, 1,
-0.3641156, 0.02875489, -2.163667, 0, 1, 0.227451, 1,
-0.3624561, -0.7105499, -3.864807, 0, 1, 0.2313726, 1,
-0.3623887, -1.934913, -2.66115, 0, 1, 0.2392157, 1,
-0.3562374, -0.690788, -0.8828537, 0, 1, 0.2431373, 1,
-0.3489268, -0.45758, -4.043871, 0, 1, 0.2509804, 1,
-0.3482543, -0.2027794, -1.823843, 0, 1, 0.254902, 1,
-0.3455077, -0.9275305, -3.893461, 0, 1, 0.2627451, 1,
-0.3399442, -0.376655, -2.092117, 0, 1, 0.2666667, 1,
-0.3309514, -0.1992263, -0.1854035, 0, 1, 0.2745098, 1,
-0.3296098, 0.02247735, -2.157593, 0, 1, 0.2784314, 1,
-0.3283793, -0.06137255, -2.625307, 0, 1, 0.2862745, 1,
-0.3283609, 0.7023802, -1.940886, 0, 1, 0.2901961, 1,
-0.3263372, 0.7189959, -1.858939, 0, 1, 0.2980392, 1,
-0.3237147, -0.7080823, -3.332796, 0, 1, 0.3058824, 1,
-0.3235161, -0.3436379, -1.842827, 0, 1, 0.3098039, 1,
-0.3218778, 1.102666, -1.099944, 0, 1, 0.3176471, 1,
-0.3215896, -0.8994334, -2.863693, 0, 1, 0.3215686, 1,
-0.3175772, -2.155857, -2.665659, 0, 1, 0.3294118, 1,
-0.3173723, 0.6267495, 0.8397701, 0, 1, 0.3333333, 1,
-0.316404, -1.071188, -1.948004, 0, 1, 0.3411765, 1,
-0.3150049, -0.9705124, -3.829512, 0, 1, 0.345098, 1,
-0.3141575, 0.4498744, -1.840785, 0, 1, 0.3529412, 1,
-0.3119505, 1.899449, -0.3453202, 0, 1, 0.3568628, 1,
-0.3090299, 1.139641, 0.008758286, 0, 1, 0.3647059, 1,
-0.3086796, -1.306144, -2.868701, 0, 1, 0.3686275, 1,
-0.3071211, -1.222301, -2.504265, 0, 1, 0.3764706, 1,
-0.3041959, 0.02313817, -1.927722, 0, 1, 0.3803922, 1,
-0.3041958, -1.399871, -3.487876, 0, 1, 0.3882353, 1,
-0.3032837, 1.009111, -0.5440672, 0, 1, 0.3921569, 1,
-0.3000278, 0.4843735, -0.8242047, 0, 1, 0.4, 1,
-0.2947082, 0.7230934, 0.8064449, 0, 1, 0.4078431, 1,
-0.2913984, 0.364572, -0.3705577, 0, 1, 0.4117647, 1,
-0.2913406, 0.1900436, -3.484136, 0, 1, 0.4196078, 1,
-0.2896761, -0.8901755, -3.450265, 0, 1, 0.4235294, 1,
-0.2892002, -1.486432, -3.421825, 0, 1, 0.4313726, 1,
-0.2830609, -0.3237308, -0.6618063, 0, 1, 0.4352941, 1,
-0.2814576, -0.1510501, -2.851037, 0, 1, 0.4431373, 1,
-0.2748648, 0.3819845, 0.1967786, 0, 1, 0.4470588, 1,
-0.2695914, 0.2214169, -0.7565298, 0, 1, 0.454902, 1,
-0.2656673, -0.9630546, -1.859197, 0, 1, 0.4588235, 1,
-0.2651152, -0.2692424, -2.142873, 0, 1, 0.4666667, 1,
-0.2645892, -1.043898, -2.59548, 0, 1, 0.4705882, 1,
-0.2644266, -1.219063, -3.238681, 0, 1, 0.4784314, 1,
-0.2614326, 0.8486704, -0.9291502, 0, 1, 0.4823529, 1,
-0.2546805, 0.06097536, -0.1931551, 0, 1, 0.4901961, 1,
-0.2533063, 1.708992, 1.763149, 0, 1, 0.4941176, 1,
-0.2485646, 1.79865, -0.9445227, 0, 1, 0.5019608, 1,
-0.2446924, -2.186941, -1.286712, 0, 1, 0.509804, 1,
-0.2388849, 1.38031, -0.7146885, 0, 1, 0.5137255, 1,
-0.2372996, 0.3729058, 0.2142615, 0, 1, 0.5215687, 1,
-0.2369122, -0.4379838, -3.635291, 0, 1, 0.5254902, 1,
-0.2339177, -0.7914155, -2.184726, 0, 1, 0.5333334, 1,
-0.2339151, 0.2247524, -0.7798767, 0, 1, 0.5372549, 1,
-0.2320674, -0.6968987, -2.673371, 0, 1, 0.5450981, 1,
-0.2313651, -0.6602871, -2.52675, 0, 1, 0.5490196, 1,
-0.2309772, 0.1318471, -2.277446, 0, 1, 0.5568628, 1,
-0.230754, 0.7287491, 0.1402592, 0, 1, 0.5607843, 1,
-0.2240146, 0.4146716, 0.1516469, 0, 1, 0.5686275, 1,
-0.2210856, -0.9180494, -2.747392, 0, 1, 0.572549, 1,
-0.2192629, -0.3776516, -2.158147, 0, 1, 0.5803922, 1,
-0.2188488, -0.2084553, -1.005547, 0, 1, 0.5843138, 1,
-0.2186502, 0.5071989, 0.1266384, 0, 1, 0.5921569, 1,
-0.2143002, 1.273359, -1.165518, 0, 1, 0.5960785, 1,
-0.2139688, -1.070392, -2.479244, 0, 1, 0.6039216, 1,
-0.2088635, -1.729396, -1.883431, 0, 1, 0.6117647, 1,
-0.2040237, 1.081521, -0.6757102, 0, 1, 0.6156863, 1,
-0.1997911, -1.153471, -2.090545, 0, 1, 0.6235294, 1,
-0.1984364, -0.3136201, -2.428164, 0, 1, 0.627451, 1,
-0.1974667, 0.4999034, 0.4330171, 0, 1, 0.6352941, 1,
-0.194108, 1.614973, -1.036537, 0, 1, 0.6392157, 1,
-0.1890532, -0.851019, -4.455711, 0, 1, 0.6470588, 1,
-0.1873206, -0.3568476, -4.638477, 0, 1, 0.6509804, 1,
-0.179128, -0.7139417, -2.861432, 0, 1, 0.6588235, 1,
-0.1787496, 0.4944681, -0.661195, 0, 1, 0.6627451, 1,
-0.1784955, -2.222401, -2.948331, 0, 1, 0.6705883, 1,
-0.1769115, -0.7098266, -1.970384, 0, 1, 0.6745098, 1,
-0.1735983, 0.6457198, -0.5751955, 0, 1, 0.682353, 1,
-0.1688657, -0.1829604, -2.380516, 0, 1, 0.6862745, 1,
-0.1653106, 0.7333941, -0.3594386, 0, 1, 0.6941177, 1,
-0.1557109, -0.9888768, -3.731858, 0, 1, 0.7019608, 1,
-0.1545527, -0.7013786, -3.495497, 0, 1, 0.7058824, 1,
-0.1541245, -0.01222053, -2.872912, 0, 1, 0.7137255, 1,
-0.1534614, 0.3803458, -0.6632524, 0, 1, 0.7176471, 1,
-0.1532271, 1.408018, 0.1430533, 0, 1, 0.7254902, 1,
-0.1499061, -0.7539662, -2.574498, 0, 1, 0.7294118, 1,
-0.1490235, -1.271954, -1.914804, 0, 1, 0.7372549, 1,
-0.1409866, -0.08168323, 0.1384781, 0, 1, 0.7411765, 1,
-0.1391765, 0.4957434, -1.891332, 0, 1, 0.7490196, 1,
-0.1353839, 1.070742, 0.1267712, 0, 1, 0.7529412, 1,
-0.1341172, 0.5701078, -0.1348624, 0, 1, 0.7607843, 1,
-0.1319584, 1.897224, -0.2798146, 0, 1, 0.7647059, 1,
-0.1319046, 0.4585615, 1.797591, 0, 1, 0.772549, 1,
-0.1316204, 1.135662, 0.0631726, 0, 1, 0.7764706, 1,
-0.1301143, -0.4898757, -2.342197, 0, 1, 0.7843137, 1,
-0.127298, 0.6538912, -0.9203713, 0, 1, 0.7882353, 1,
-0.1248512, 1.160679, 0.5508441, 0, 1, 0.7960784, 1,
-0.1220798, 0.1410924, -1.414769, 0, 1, 0.8039216, 1,
-0.1206807, 1.992689, -1.790153, 0, 1, 0.8078431, 1,
-0.1175461, 0.0830224, -1.086112, 0, 1, 0.8156863, 1,
-0.1160369, -0.08741083, -3.012231, 0, 1, 0.8196079, 1,
-0.1119128, -0.1614112, -3.261393, 0, 1, 0.827451, 1,
-0.1088464, -0.01412154, -2.528648, 0, 1, 0.8313726, 1,
-0.1063579, 1.805517, 0.3301053, 0, 1, 0.8392157, 1,
-0.1034248, -0.271698, -1.713215, 0, 1, 0.8431373, 1,
-0.1032292, 0.04057015, -0.9300167, 0, 1, 0.8509804, 1,
-0.1030966, 0.9132203, 0.2820143, 0, 1, 0.854902, 1,
-0.1024323, -1.588003, -0.4641986, 0, 1, 0.8627451, 1,
-0.09888841, 0.1062947, -0.6324397, 0, 1, 0.8666667, 1,
-0.09836298, -1.453789, -4.479547, 0, 1, 0.8745098, 1,
-0.09773789, 0.7516294, -0.7273348, 0, 1, 0.8784314, 1,
-0.0969969, -0.2767589, -3.72075, 0, 1, 0.8862745, 1,
-0.09120019, 1.06672, -0.9665466, 0, 1, 0.8901961, 1,
-0.08860736, 0.3097524, -0.5298381, 0, 1, 0.8980392, 1,
-0.08760303, 0.4856744, -0.5571768, 0, 1, 0.9058824, 1,
-0.08756754, 0.3946248, 2.298837, 0, 1, 0.9098039, 1,
-0.08570378, -0.662425, -4.314136, 0, 1, 0.9176471, 1,
-0.08504909, 1.429678, -1.604099, 0, 1, 0.9215686, 1,
-0.08452008, -0.8594865, -3.735169, 0, 1, 0.9294118, 1,
-0.08387212, -0.2034078, -2.556006, 0, 1, 0.9333333, 1,
-0.08307967, -0.8043551, -3.19476, 0, 1, 0.9411765, 1,
-0.07723241, 0.3939566, 0.1717211, 0, 1, 0.945098, 1,
-0.07531732, 2.330365, -1.87453, 0, 1, 0.9529412, 1,
-0.07511213, 0.3765949, 0.4895646, 0, 1, 0.9568627, 1,
-0.07408354, -0.252462, -3.123909, 0, 1, 0.9647059, 1,
-0.07177668, -0.0325744, -3.562693, 0, 1, 0.9686275, 1,
-0.06521397, 0.4778639, 0.6077137, 0, 1, 0.9764706, 1,
-0.06417804, -0.08838689, -2.463481, 0, 1, 0.9803922, 1,
-0.06404518, -0.04720326, -3.379293, 0, 1, 0.9882353, 1,
-0.06120968, 0.1058108, 0.8012671, 0, 1, 0.9921569, 1,
-0.05415181, -1.047594, -4.173809, 0, 1, 1, 1,
-0.05322383, -1.483119, -2.682953, 0, 0.9921569, 1, 1,
-0.05119881, -0.8149402, -4.19532, 0, 0.9882353, 1, 1,
-0.04977055, 2.071751, 1.256195, 0, 0.9803922, 1, 1,
-0.04849955, -0.6952859, -4.326944, 0, 0.9764706, 1, 1,
-0.04326635, 0.2216084, -0.8721502, 0, 0.9686275, 1, 1,
-0.03409434, 0.2786126, -0.08279115, 0, 0.9647059, 1, 1,
-0.03353437, 0.8386062, 0.6647688, 0, 0.9568627, 1, 1,
-0.03126981, -0.2805814, -2.893529, 0, 0.9529412, 1, 1,
-0.02867591, 0.9820838, 0.06459743, 0, 0.945098, 1, 1,
-0.02630046, 0.9990834, 0.8567918, 0, 0.9411765, 1, 1,
-0.02496368, -0.3948202, -1.103229, 0, 0.9333333, 1, 1,
-0.02064773, -1.133266, -3.553789, 0, 0.9294118, 1, 1,
-0.01831405, -0.690781, -4.949991, 0, 0.9215686, 1, 1,
-0.01011162, -0.3674671, -2.869204, 0, 0.9176471, 1, 1,
-0.008716914, 0.1928756, 1.584341, 0, 0.9098039, 1, 1,
-0.00666247, 0.6219531, -1.402736, 0, 0.9058824, 1, 1,
-0.002827492, 0.4454685, -0.1587725, 0, 0.8980392, 1, 1,
3.816773e-05, -0.8673924, 2.397045, 0, 0.8901961, 1, 1,
0.000226409, -1.331381, 2.732468, 0, 0.8862745, 1, 1,
0.006969926, 0.01834346, 0.04219452, 0, 0.8784314, 1, 1,
0.007712313, 0.5978237, 1.708402, 0, 0.8745098, 1, 1,
0.007935229, 1.117986, -1.128569, 0, 0.8666667, 1, 1,
0.009841857, 0.04454103, 0.1888605, 0, 0.8627451, 1, 1,
0.01326675, 2.551388, -1.688198, 0, 0.854902, 1, 1,
0.01556558, -0.2857412, 2.852929, 0, 0.8509804, 1, 1,
0.01676992, 0.01079997, 1.577108, 0, 0.8431373, 1, 1,
0.02250987, 2.052399, -0.5681862, 0, 0.8392157, 1, 1,
0.02296451, 0.6825859, -1.419656, 0, 0.8313726, 1, 1,
0.02431843, -1.285298, 2.087145, 0, 0.827451, 1, 1,
0.02703557, 0.03730205, 0.3932554, 0, 0.8196079, 1, 1,
0.02800084, 0.05541702, -1.457904, 0, 0.8156863, 1, 1,
0.03444143, 0.2055138, 0.3979786, 0, 0.8078431, 1, 1,
0.05060532, -1.52339, 3.893148, 0, 0.8039216, 1, 1,
0.05203959, 0.02105468, 0.4000407, 0, 0.7960784, 1, 1,
0.05388853, 0.7998013, 0.1290181, 0, 0.7882353, 1, 1,
0.05538052, -0.6972075, 2.612372, 0, 0.7843137, 1, 1,
0.05558125, -0.2217409, 2.545098, 0, 0.7764706, 1, 1,
0.06243393, 1.598094, 0.01571278, 0, 0.772549, 1, 1,
0.06362043, 0.08268426, -0.8296388, 0, 0.7647059, 1, 1,
0.06486335, -0.5852975, 2.799408, 0, 0.7607843, 1, 1,
0.06590989, 0.4502439, -1.047006, 0, 0.7529412, 1, 1,
0.0740464, -0.6908454, 5.250367, 0, 0.7490196, 1, 1,
0.07621769, -1.549199, 5.643691, 0, 0.7411765, 1, 1,
0.08193856, -0.6434721, 4.593709, 0, 0.7372549, 1, 1,
0.08503772, 0.9638549, 1.5193, 0, 0.7294118, 1, 1,
0.08528296, -0.9107233, 4.046302, 0, 0.7254902, 1, 1,
0.08615272, 1.253177, 0.1274098, 0, 0.7176471, 1, 1,
0.08686359, 1.665755, 0.2651163, 0, 0.7137255, 1, 1,
0.09652737, 0.838968, 0.1325204, 0, 0.7058824, 1, 1,
0.09935484, -1.582573, 3.675134, 0, 0.6980392, 1, 1,
0.1013418, 0.1476722, 2.100851, 0, 0.6941177, 1, 1,
0.1027854, -0.02356677, 3.016875, 0, 0.6862745, 1, 1,
0.1054089, -0.1570758, 1.836616, 0, 0.682353, 1, 1,
0.1061299, -1.64177, 2.313843, 0, 0.6745098, 1, 1,
0.1088083, 0.8759538, -0.4456187, 0, 0.6705883, 1, 1,
0.1121877, 0.7077849, -0.8191799, 0, 0.6627451, 1, 1,
0.1141624, -0.6865196, 3.634974, 0, 0.6588235, 1, 1,
0.1208488, 0.7495598, -0.1111976, 0, 0.6509804, 1, 1,
0.1209188, 0.6728496, 2.537115, 0, 0.6470588, 1, 1,
0.1243929, -0.9366659, 0.836507, 0, 0.6392157, 1, 1,
0.1251499, 1.564871, 0.7143503, 0, 0.6352941, 1, 1,
0.1273933, -0.2167136, 2.050298, 0, 0.627451, 1, 1,
0.129915, -0.1888667, 3.141716, 0, 0.6235294, 1, 1,
0.1326204, 1.29145, 1.054313, 0, 0.6156863, 1, 1,
0.1328008, 1.468248, -0.2816085, 0, 0.6117647, 1, 1,
0.1350712, 0.42715, 0.8021418, 0, 0.6039216, 1, 1,
0.1363313, 1.513813, 0.05501921, 0, 0.5960785, 1, 1,
0.1391264, 1.113344, -1.473261, 0, 0.5921569, 1, 1,
0.1420649, -0.4586625, 3.798619, 0, 0.5843138, 1, 1,
0.1458814, -0.3776841, 4.508235, 0, 0.5803922, 1, 1,
0.1501497, 0.6190673, 0.8524299, 0, 0.572549, 1, 1,
0.1526109, -0.6292743, 2.017549, 0, 0.5686275, 1, 1,
0.1537044, 0.6366355, 1.318718, 0, 0.5607843, 1, 1,
0.1542349, -0.1295763, 2.592216, 0, 0.5568628, 1, 1,
0.1570241, 0.1082215, 1.891687, 0, 0.5490196, 1, 1,
0.1581026, 0.04635089, 2.64942, 0, 0.5450981, 1, 1,
0.1583404, 1.990412, -0.5856886, 0, 0.5372549, 1, 1,
0.159561, -0.5561064, 2.506469, 0, 0.5333334, 1, 1,
0.1654521, -0.07651649, 1.991773, 0, 0.5254902, 1, 1,
0.1680591, -0.6616574, 3.668806, 0, 0.5215687, 1, 1,
0.1751156, 0.1470674, 0.4066657, 0, 0.5137255, 1, 1,
0.1809844, 0.4818654, -0.8508593, 0, 0.509804, 1, 1,
0.1902017, -1.33639, 2.90922, 0, 0.5019608, 1, 1,
0.1913362, 1.696805, 0.2362796, 0, 0.4941176, 1, 1,
0.1918626, 0.3873863, -1.015971, 0, 0.4901961, 1, 1,
0.1967723, -1.007452, 2.686994, 0, 0.4823529, 1, 1,
0.2022059, 0.5711808, -0.3590588, 0, 0.4784314, 1, 1,
0.2050866, -0.5390103, 4.471734, 0, 0.4705882, 1, 1,
0.2064909, 0.3235129, -0.9787543, 0, 0.4666667, 1, 1,
0.2073888, -0.9028851, 1.459825, 0, 0.4588235, 1, 1,
0.2074513, 1.017517, 0.03682508, 0, 0.454902, 1, 1,
0.2096571, 0.3613614, 0.1800894, 0, 0.4470588, 1, 1,
0.2103779, -0.7201918, 1.48081, 0, 0.4431373, 1, 1,
0.2105739, -0.4483644, 2.883624, 0, 0.4352941, 1, 1,
0.2108729, 0.4481128, 1.54089, 0, 0.4313726, 1, 1,
0.2146725, -0.5960402, 1.781732, 0, 0.4235294, 1, 1,
0.215326, -2.221563, 4.334102, 0, 0.4196078, 1, 1,
0.2166806, 0.05490905, -0.9234998, 0, 0.4117647, 1, 1,
0.2170336, -1.804798, 5.336699, 0, 0.4078431, 1, 1,
0.2174346, -0.6151326, 2.136793, 0, 0.4, 1, 1,
0.218338, 0.2466243, 1.793911, 0, 0.3921569, 1, 1,
0.2201252, 1.161963, -1.046783, 0, 0.3882353, 1, 1,
0.221516, 0.09606016, 1.412576, 0, 0.3803922, 1, 1,
0.2277317, -1.187128, 3.543883, 0, 0.3764706, 1, 1,
0.2286088, 1.035082, -0.09692152, 0, 0.3686275, 1, 1,
0.2304546, -0.8187284, 1.506946, 0, 0.3647059, 1, 1,
0.2310385, -0.3179888, 1.605356, 0, 0.3568628, 1, 1,
0.233415, -0.6567516, 2.705005, 0, 0.3529412, 1, 1,
0.2375229, 0.6267909, 1.190487, 0, 0.345098, 1, 1,
0.239566, 2.307104, 1.946463, 0, 0.3411765, 1, 1,
0.2405121, 1.554023, -0.4743672, 0, 0.3333333, 1, 1,
0.2419178, -0.8195149, 3.22335, 0, 0.3294118, 1, 1,
0.245112, 1.028932, -0.3542396, 0, 0.3215686, 1, 1,
0.2462982, -0.6755693, 1.931776, 0, 0.3176471, 1, 1,
0.2485873, 2.187114, 0.2485315, 0, 0.3098039, 1, 1,
0.2486742, -0.6638258, 3.419948, 0, 0.3058824, 1, 1,
0.2491034, -0.4201036, 3.635486, 0, 0.2980392, 1, 1,
0.2550594, -0.0388088, 1.655045, 0, 0.2901961, 1, 1,
0.2568435, -2.270607, 3.629977, 0, 0.2862745, 1, 1,
0.2599253, 1.693338, 0.7644214, 0, 0.2784314, 1, 1,
0.2603534, -0.4705407, 1.481642, 0, 0.2745098, 1, 1,
0.2621545, 0.220197, -0.299176, 0, 0.2666667, 1, 1,
0.2679196, 0.2055155, -0.7343531, 0, 0.2627451, 1, 1,
0.2691766, 0.3062011, 1.02782, 0, 0.254902, 1, 1,
0.2698649, -0.2017861, 1.242145, 0, 0.2509804, 1, 1,
0.2701328, -0.2059887, 2.368272, 0, 0.2431373, 1, 1,
0.271841, 0.2672881, 1.504879, 0, 0.2392157, 1, 1,
0.2719, -0.3589779, 0.4487817, 0, 0.2313726, 1, 1,
0.2728252, -1.507724, 3.503146, 0, 0.227451, 1, 1,
0.2732084, 1.230933, -0.9269062, 0, 0.2196078, 1, 1,
0.2734596, 0.4206281, -0.4571801, 0, 0.2156863, 1, 1,
0.2781084, 1.276961, 0.5393089, 0, 0.2078431, 1, 1,
0.2797954, -1.299201, 2.578214, 0, 0.2039216, 1, 1,
0.2843329, -2.103802, 3.25986, 0, 0.1960784, 1, 1,
0.2882864, -0.6890942, 1.077599, 0, 0.1882353, 1, 1,
0.2913664, 0.9265317, 0.9318269, 0, 0.1843137, 1, 1,
0.2919084, 0.5267933, -0.09777592, 0, 0.1764706, 1, 1,
0.2942014, 1.402804, -0.1885221, 0, 0.172549, 1, 1,
0.2975436, -0.8714339, 1.85863, 0, 0.1647059, 1, 1,
0.297711, -0.3606229, 2.218206, 0, 0.1607843, 1, 1,
0.298109, -0.153338, 2.908196, 0, 0.1529412, 1, 1,
0.2982896, 0.03972234, 1.050405, 0, 0.1490196, 1, 1,
0.3022654, 1.386188, 1.452413, 0, 0.1411765, 1, 1,
0.3024583, 0.05912634, 3.457027, 0, 0.1372549, 1, 1,
0.3093072, 2.603379, 0.701207, 0, 0.1294118, 1, 1,
0.3129834, -1.262584, 3.266281, 0, 0.1254902, 1, 1,
0.3142047, 0.1901797, -0.4068943, 0, 0.1176471, 1, 1,
0.3210504, -1.098475, 3.10503, 0, 0.1137255, 1, 1,
0.3244982, -0.3592976, 1.245694, 0, 0.1058824, 1, 1,
0.3285298, -0.588578, 5.309135, 0, 0.09803922, 1, 1,
0.3289267, -1.236987, 4.408579, 0, 0.09411765, 1, 1,
0.3303855, 0.2715245, 0.1095443, 0, 0.08627451, 1, 1,
0.3308954, -0.6313823, 2.027397, 0, 0.08235294, 1, 1,
0.3358446, 0.8659611, 0.1671798, 0, 0.07450981, 1, 1,
0.3411539, -1.440909, 4.040527, 0, 0.07058824, 1, 1,
0.3417619, 0.04138932, 1.081327, 0, 0.0627451, 1, 1,
0.3451538, 0.216199, 3.440912, 0, 0.05882353, 1, 1,
0.350472, -0.6215751, 4.042005, 0, 0.05098039, 1, 1,
0.3507618, -0.8983888, 3.177548, 0, 0.04705882, 1, 1,
0.352414, 0.7074345, 0.7369701, 0, 0.03921569, 1, 1,
0.3644308, -0.4663657, 4.379722, 0, 0.03529412, 1, 1,
0.3670711, 0.5849065, 0.7037639, 0, 0.02745098, 1, 1,
0.3679768, 0.3528229, 0.0377434, 0, 0.02352941, 1, 1,
0.3682192, 1.235741, 1.953435, 0, 0.01568628, 1, 1,
0.3702981, 1.685118, 0.9739776, 0, 0.01176471, 1, 1,
0.3740716, 0.5638471, 1.819725, 0, 0.003921569, 1, 1,
0.3753983, -0.4492829, 2.957273, 0.003921569, 0, 1, 1,
0.375615, 0.4766167, 0.6592865, 0.007843138, 0, 1, 1,
0.3773763, 0.5525784, 2.455352, 0.01568628, 0, 1, 1,
0.3775699, -0.5341094, 2.443313, 0.01960784, 0, 1, 1,
0.380144, 0.9295577, 0.3676253, 0.02745098, 0, 1, 1,
0.3804664, 1.022243, 0.4591979, 0.03137255, 0, 1, 1,
0.3836768, -0.6078869, 1.802824, 0.03921569, 0, 1, 1,
0.3887389, 0.1059914, 3.017396, 0.04313726, 0, 1, 1,
0.3895977, -1.868004, 3.04589, 0.05098039, 0, 1, 1,
0.3938104, 1.905727, 1.355717, 0.05490196, 0, 1, 1,
0.3946326, -0.07791892, 3.835774, 0.0627451, 0, 1, 1,
0.3953082, 1.324541, 1.496617, 0.06666667, 0, 1, 1,
0.4004132, -0.8069769, 2.541564, 0.07450981, 0, 1, 1,
0.4055749, -0.239608, 3.974864, 0.07843138, 0, 1, 1,
0.4078178, -1.742294, 3.653703, 0.08627451, 0, 1, 1,
0.4083361, -0.657012, 2.591034, 0.09019608, 0, 1, 1,
0.4142896, -0.9790624, 2.903214, 0.09803922, 0, 1, 1,
0.416803, -0.5097989, 2.099628, 0.1058824, 0, 1, 1,
0.4171971, -0.335247, 2.740777, 0.1098039, 0, 1, 1,
0.4193049, -0.4826129, 1.694524, 0.1176471, 0, 1, 1,
0.4199591, 1.032419, 1.87882, 0.1215686, 0, 1, 1,
0.4233341, -0.9703687, 3.895614, 0.1294118, 0, 1, 1,
0.4240069, 0.4002379, 0.7091675, 0.1333333, 0, 1, 1,
0.4256236, -0.3188678, 2.835715, 0.1411765, 0, 1, 1,
0.4266486, -0.3224849, 1.95942, 0.145098, 0, 1, 1,
0.4266503, -0.496151, 1.640251, 0.1529412, 0, 1, 1,
0.4302575, -1.401086, 3.598595, 0.1568628, 0, 1, 1,
0.4306409, 0.7860568, -1.078876, 0.1647059, 0, 1, 1,
0.4329539, -0.1787503, 2.782722, 0.1686275, 0, 1, 1,
0.4369409, -1.871398, 2.406228, 0.1764706, 0, 1, 1,
0.4377113, 0.7278246, 0.5469189, 0.1803922, 0, 1, 1,
0.4386841, 1.348514, -0.7161267, 0.1882353, 0, 1, 1,
0.4442104, -1.85778, 2.547873, 0.1921569, 0, 1, 1,
0.444348, -0.6945678, 3.486689, 0.2, 0, 1, 1,
0.4503609, 0.1562227, 0.174045, 0.2078431, 0, 1, 1,
0.4512245, -0.8584827, 3.508639, 0.2117647, 0, 1, 1,
0.4521897, -1.809193, 3.442707, 0.2196078, 0, 1, 1,
0.4547053, -0.5303637, 1.798573, 0.2235294, 0, 1, 1,
0.4597885, 0.6507807, -1.35764, 0.2313726, 0, 1, 1,
0.4601242, -1.063636, 4.871797, 0.2352941, 0, 1, 1,
0.4621234, -0.1121014, 2.292893, 0.2431373, 0, 1, 1,
0.4622333, -1.250145, 2.911419, 0.2470588, 0, 1, 1,
0.463433, 1.214638, -0.05632972, 0.254902, 0, 1, 1,
0.4662431, -0.8302748, 1.570957, 0.2588235, 0, 1, 1,
0.4702778, -0.1304494, 2.017094, 0.2666667, 0, 1, 1,
0.4702846, -0.8527663, 2.600892, 0.2705882, 0, 1, 1,
0.4706829, 0.07069188, 1.244181, 0.2784314, 0, 1, 1,
0.4709117, 1.03371, 2.76653, 0.282353, 0, 1, 1,
0.4732214, 0.7316915, 0.08184487, 0.2901961, 0, 1, 1,
0.4805611, -0.5953987, 3.502639, 0.2941177, 0, 1, 1,
0.482778, -1.017063, 3.116781, 0.3019608, 0, 1, 1,
0.4922345, -0.03703071, 0.3846186, 0.3098039, 0, 1, 1,
0.4975366, 1.104585, -0.7494844, 0.3137255, 0, 1, 1,
0.4983369, -0.6717762, 1.789019, 0.3215686, 0, 1, 1,
0.4993403, -0.9034148, 3.202544, 0.3254902, 0, 1, 1,
0.5003911, 0.02269391, 2.987078, 0.3333333, 0, 1, 1,
0.5042311, 0.4458481, 0.113373, 0.3372549, 0, 1, 1,
0.5052356, 1.304132, -0.02187055, 0.345098, 0, 1, 1,
0.5097124, 1.268651, 0.8459265, 0.3490196, 0, 1, 1,
0.5097458, -0.5470601, 1.034817, 0.3568628, 0, 1, 1,
0.5107585, -0.6424112, 2.725447, 0.3607843, 0, 1, 1,
0.5121544, -0.02919756, 1.807651, 0.3686275, 0, 1, 1,
0.5137616, 0.2267896, 1.204676, 0.372549, 0, 1, 1,
0.5165941, -1.828422, 3.695899, 0.3803922, 0, 1, 1,
0.5184488, -0.08732665, 0.5289817, 0.3843137, 0, 1, 1,
0.5197787, -0.01653424, 0.9216402, 0.3921569, 0, 1, 1,
0.5209038, 0.9888033, -0.7299938, 0.3960784, 0, 1, 1,
0.5219666, 0.06791598, 0.7821511, 0.4039216, 0, 1, 1,
0.5224137, 1.453784, 0.3063852, 0.4117647, 0, 1, 1,
0.5346881, 0.7941055, 1.042185, 0.4156863, 0, 1, 1,
0.543584, 2.480249, -3.099677, 0.4235294, 0, 1, 1,
0.545816, 0.6605552, 2.006306, 0.427451, 0, 1, 1,
0.547379, -0.2980773, 2.239897, 0.4352941, 0, 1, 1,
0.5506122, 1.050484, 0.6434333, 0.4392157, 0, 1, 1,
0.550631, 0.6618643, 0.8051144, 0.4470588, 0, 1, 1,
0.5561843, 1.593047, 2.040827, 0.4509804, 0, 1, 1,
0.5614201, -1.037869, 2.716953, 0.4588235, 0, 1, 1,
0.5666647, 0.2182568, 1.900333, 0.4627451, 0, 1, 1,
0.5699652, 0.07324412, 1.625523, 0.4705882, 0, 1, 1,
0.5701329, -1.008921, 4.217074, 0.4745098, 0, 1, 1,
0.5747889, 0.3121485, -0.07362267, 0.4823529, 0, 1, 1,
0.5794483, 1.47654, 0.9266145, 0.4862745, 0, 1, 1,
0.594173, 0.04308991, 1.893478, 0.4941176, 0, 1, 1,
0.5960003, 0.6551108, -1.553452, 0.5019608, 0, 1, 1,
0.6080478, 0.6975313, -1.250882, 0.5058824, 0, 1, 1,
0.6211684, -0.002226213, 1.381492, 0.5137255, 0, 1, 1,
0.6273776, 0.8162937, 0.4815152, 0.5176471, 0, 1, 1,
0.6282181, 0.7932766, -0.5644559, 0.5254902, 0, 1, 1,
0.628662, -0.2562409, 2.002043, 0.5294118, 0, 1, 1,
0.63557, 1.145852, -0.8855426, 0.5372549, 0, 1, 1,
0.6367736, 0.5536291, -0.5855494, 0.5411765, 0, 1, 1,
0.6393221, -1.129606, 0.9549195, 0.5490196, 0, 1, 1,
0.6416071, 2.286786, 1.154998, 0.5529412, 0, 1, 1,
0.6427323, 0.08416196, 2.004331, 0.5607843, 0, 1, 1,
0.6484663, 1.37878, -0.4094189, 0.5647059, 0, 1, 1,
0.6517361, 0.1926702, 0.8981982, 0.572549, 0, 1, 1,
0.6578925, 1.474001, 0.7262879, 0.5764706, 0, 1, 1,
0.6615587, -0.4879465, 4.029894, 0.5843138, 0, 1, 1,
0.6676605, 1.612491, 0.3672664, 0.5882353, 0, 1, 1,
0.6712958, 1.182766, 0.3912344, 0.5960785, 0, 1, 1,
0.6730521, -0.1133106, 0.7854022, 0.6039216, 0, 1, 1,
0.680491, -0.3164207, 2.202436, 0.6078432, 0, 1, 1,
0.6813499, 0.4823878, 0.3302413, 0.6156863, 0, 1, 1,
0.6829893, 0.6777639, 0.6794704, 0.6196079, 0, 1, 1,
0.6855677, -0.4303068, 2.416615, 0.627451, 0, 1, 1,
0.6872729, 0.08596614, 1.51088, 0.6313726, 0, 1, 1,
0.6955145, -0.5251028, 1.293837, 0.6392157, 0, 1, 1,
0.6996866, 0.01460822, 0.5696692, 0.6431373, 0, 1, 1,
0.7021988, -0.9606369, 2.065362, 0.6509804, 0, 1, 1,
0.7038236, -1.013394, 3.949821, 0.654902, 0, 1, 1,
0.7052609, 1.054941, -0.5249755, 0.6627451, 0, 1, 1,
0.7119156, -0.5759878, 1.498515, 0.6666667, 0, 1, 1,
0.7132617, 0.7573766, -0.9617996, 0.6745098, 0, 1, 1,
0.7156092, -0.5547168, 3.75382, 0.6784314, 0, 1, 1,
0.7226582, 1.070756, 0.111285, 0.6862745, 0, 1, 1,
0.7228109, 0.1235977, 0.07606555, 0.6901961, 0, 1, 1,
0.723283, 1.266463, 0.7191554, 0.6980392, 0, 1, 1,
0.7237214, -0.9505484, -0.3933388, 0.7058824, 0, 1, 1,
0.7255681, -0.1379247, 0.7163327, 0.7098039, 0, 1, 1,
0.7280399, 1.332851, 0.6646478, 0.7176471, 0, 1, 1,
0.730143, -0.2263262, 1.029274, 0.7215686, 0, 1, 1,
0.730213, 0.619813, 0.9501417, 0.7294118, 0, 1, 1,
0.7328535, -1.610985, 2.041945, 0.7333333, 0, 1, 1,
0.7336875, -0.7451089, 1.660685, 0.7411765, 0, 1, 1,
0.7376456, -2.110718, 2.089486, 0.7450981, 0, 1, 1,
0.7387229, -1.958982, 2.859836, 0.7529412, 0, 1, 1,
0.7488772, -0.4679154, 4.687818, 0.7568628, 0, 1, 1,
0.7534904, -0.5139741, 0.9125369, 0.7647059, 0, 1, 1,
0.7562506, 0.9319588, 1.237779, 0.7686275, 0, 1, 1,
0.7596676, -0.09354084, 1.00264, 0.7764706, 0, 1, 1,
0.76435, 1.198787, 0.777382, 0.7803922, 0, 1, 1,
0.7644033, -0.6452634, 5.060785, 0.7882353, 0, 1, 1,
0.7740173, 1.454894, 0.8614239, 0.7921569, 0, 1, 1,
0.7744955, 0.6182448, 0.1518737, 0.8, 0, 1, 1,
0.7745723, -0.4277005, 0.4326867, 0.8078431, 0, 1, 1,
0.775758, 0.2248789, 0.02487703, 0.8117647, 0, 1, 1,
0.777644, 0.8035231, -0.7852729, 0.8196079, 0, 1, 1,
0.7815447, -1.271681, 2.447466, 0.8235294, 0, 1, 1,
0.7822303, -0.0748312, 1.58855, 0.8313726, 0, 1, 1,
0.7855992, -0.08636972, 0.9592577, 0.8352941, 0, 1, 1,
0.795287, 0.8423156, 0.599646, 0.8431373, 0, 1, 1,
0.7989291, -1.610962, 2.88225, 0.8470588, 0, 1, 1,
0.8020006, 0.107268, 2.202247, 0.854902, 0, 1, 1,
0.8026409, 1.046114, 1.155579, 0.8588235, 0, 1, 1,
0.810599, -1.057912, 2.686923, 0.8666667, 0, 1, 1,
0.8112406, 0.02760243, 0.1771414, 0.8705882, 0, 1, 1,
0.8208188, 0.3228058, 1.297805, 0.8784314, 0, 1, 1,
0.822742, 1.021993, 0.7944542, 0.8823529, 0, 1, 1,
0.8271713, 0.9028904, 1.215725, 0.8901961, 0, 1, 1,
0.8279144, 1.821001, 1.536308, 0.8941177, 0, 1, 1,
0.8303881, 0.2641919, 1.497984, 0.9019608, 0, 1, 1,
0.8328786, 1.158358, -0.02403217, 0.9098039, 0, 1, 1,
0.8339643, 1.086177, -0.09279404, 0.9137255, 0, 1, 1,
0.8431604, 1.83861, 1.054098, 0.9215686, 0, 1, 1,
0.8468655, 1.61246, 1.05992, 0.9254902, 0, 1, 1,
0.8496482, -1.268963, 2.917774, 0.9333333, 0, 1, 1,
0.8508905, 0.5272059, 1.363786, 0.9372549, 0, 1, 1,
0.8528899, -0.5168347, 1.572449, 0.945098, 0, 1, 1,
0.8557463, 0.02645059, 1.998152, 0.9490196, 0, 1, 1,
0.858141, -0.8912872, 2.546878, 0.9568627, 0, 1, 1,
0.8612913, -1.614997, 1.141783, 0.9607843, 0, 1, 1,
0.8772297, 1.290433, 2.128485, 0.9686275, 0, 1, 1,
0.8855993, 0.7714766, 1.031672, 0.972549, 0, 1, 1,
0.8872191, -1.352929, 1.787211, 0.9803922, 0, 1, 1,
0.8874402, 0.04371954, 2.001336, 0.9843137, 0, 1, 1,
0.8919072, 1.814199, 0.7540432, 0.9921569, 0, 1, 1,
0.8960184, -1.876595, 3.315237, 0.9960784, 0, 1, 1,
0.8963889, -0.7345574, 2.417322, 1, 0, 0.9960784, 1,
0.8974547, -1.951179, 3.743386, 1, 0, 0.9882353, 1,
0.8991147, 0.3486371, 1.007843, 1, 0, 0.9843137, 1,
0.8999479, -0.566067, 2.659844, 1, 0, 0.9764706, 1,
0.9016507, -0.04247411, 1.725187, 1, 0, 0.972549, 1,
0.9026783, 1.037644, 1.774714, 1, 0, 0.9647059, 1,
0.9043694, -2.239151, 2.844646, 1, 0, 0.9607843, 1,
0.9072306, -1.179343, 1.481139, 1, 0, 0.9529412, 1,
0.9090359, 0.2940416, 0.374136, 1, 0, 0.9490196, 1,
0.9121836, -0.2563982, 3.976358, 1, 0, 0.9411765, 1,
0.912612, 0.1459849, 0.3898874, 1, 0, 0.9372549, 1,
0.916795, 0.926904, -0.05421531, 1, 0, 0.9294118, 1,
0.917183, -2.199968, 2.808015, 1, 0, 0.9254902, 1,
0.924509, -1.39961, 0.2349263, 1, 0, 0.9176471, 1,
0.9332127, -1.552553, 0.5976773, 1, 0, 0.9137255, 1,
0.9386368, 1.046814, 0.1986305, 1, 0, 0.9058824, 1,
0.9400872, 1.519253, 1.033011, 1, 0, 0.9019608, 1,
0.9415376, -0.01225316, 1.708114, 1, 0, 0.8941177, 1,
0.9481916, 1.067381, -0.3375261, 1, 0, 0.8862745, 1,
0.9673408, -0.9781773, 1.391722, 1, 0, 0.8823529, 1,
0.9690245, 0.7288954, 1.194556, 1, 0, 0.8745098, 1,
0.9712622, -1.195841, 1.37401, 1, 0, 0.8705882, 1,
0.9903134, -2.103803, 2.16358, 1, 0, 0.8627451, 1,
0.9931223, -1.122724, 3.129149, 1, 0, 0.8588235, 1,
0.994963, -0.7795933, 3.65104, 1, 0, 0.8509804, 1,
0.9982139, -0.6351363, 1.910375, 1, 0, 0.8470588, 1,
1.013569, 2.043868, -0.3730674, 1, 0, 0.8392157, 1,
1.015478, 0.9409615, -0.9916232, 1, 0, 0.8352941, 1,
1.024352, 1.195649, -0.3708071, 1, 0, 0.827451, 1,
1.025376, 0.8681444, 2.504655, 1, 0, 0.8235294, 1,
1.029537, 0.3032318, 1.534565, 1, 0, 0.8156863, 1,
1.054318, -1.876556, 1.983142, 1, 0, 0.8117647, 1,
1.055974, 2.878227, -0.5478382, 1, 0, 0.8039216, 1,
1.06251, 0.9681235, 1.605261, 1, 0, 0.7960784, 1,
1.065546, -0.9813445, 1.661392, 1, 0, 0.7921569, 1,
1.073359, -0.3152216, 3.20983, 1, 0, 0.7843137, 1,
1.075541, -0.4654486, 1.527364, 1, 0, 0.7803922, 1,
1.081561, 1.015359, 0.3251839, 1, 0, 0.772549, 1,
1.081827, -0.6260999, 1.478005, 1, 0, 0.7686275, 1,
1.09352, -0.8447433, 1.91654, 1, 0, 0.7607843, 1,
1.097516, -0.7513987, 2.205802, 1, 0, 0.7568628, 1,
1.099215, -0.9834043, 3.318562, 1, 0, 0.7490196, 1,
1.129469, 1.236135, -0.05804286, 1, 0, 0.7450981, 1,
1.129711, -1.483834, 1.985781, 1, 0, 0.7372549, 1,
1.130849, -1.921082, 4.339427, 1, 0, 0.7333333, 1,
1.141162, 1.047422, 0.2425022, 1, 0, 0.7254902, 1,
1.154851, -0.5506495, 2.897129, 1, 0, 0.7215686, 1,
1.165224, 1.185703, 1.882527, 1, 0, 0.7137255, 1,
1.177878, 0.4975534, 1.748143, 1, 0, 0.7098039, 1,
1.179338, -0.315126, 2.356205, 1, 0, 0.7019608, 1,
1.180903, -0.3970817, 2.635148, 1, 0, 0.6941177, 1,
1.184042, 0.363659, 2.117861, 1, 0, 0.6901961, 1,
1.188726, -0.636867, 2.738616, 1, 0, 0.682353, 1,
1.20441, -0.7419329, 2.307156, 1, 0, 0.6784314, 1,
1.211432, -0.9529276, 3.078549, 1, 0, 0.6705883, 1,
1.214273, -0.9967734, 1.611609, 1, 0, 0.6666667, 1,
1.218604, -0.1760891, 0.1723313, 1, 0, 0.6588235, 1,
1.219469, -0.4766746, 3.595304, 1, 0, 0.654902, 1,
1.238414, -0.384852, 1.891897, 1, 0, 0.6470588, 1,
1.241776, 1.477143, 1.973729, 1, 0, 0.6431373, 1,
1.244061, -0.5694046, 3.676955, 1, 0, 0.6352941, 1,
1.245481, -0.1691168, 0.2784626, 1, 0, 0.6313726, 1,
1.251485, -1.115009, 3.245433, 1, 0, 0.6235294, 1,
1.258846, 0.4140586, 0.859782, 1, 0, 0.6196079, 1,
1.26605, 1.285455, 0.7464119, 1, 0, 0.6117647, 1,
1.266168, 0.06787632, -0.1617865, 1, 0, 0.6078432, 1,
1.270121, -0.224921, 0.8070818, 1, 0, 0.6, 1,
1.270482, 0.7840078, 1.969284, 1, 0, 0.5921569, 1,
1.270599, 0.158572, 1.135452, 1, 0, 0.5882353, 1,
1.271557, 1.201598, 0.7538846, 1, 0, 0.5803922, 1,
1.272145, 2.155696, -0.3789912, 1, 0, 0.5764706, 1,
1.275429, 0.1472634, 1.58381, 1, 0, 0.5686275, 1,
1.292847, 0.1814896, 1.032463, 1, 0, 0.5647059, 1,
1.302397, -0.3366504, -0.08508086, 1, 0, 0.5568628, 1,
1.307204, 0.2905949, 0.4276281, 1, 0, 0.5529412, 1,
1.312066, 0.2498111, 0.4975203, 1, 0, 0.5450981, 1,
1.315145, 1.567746, 0.3546458, 1, 0, 0.5411765, 1,
1.317613, -0.8074984, 3.480347, 1, 0, 0.5333334, 1,
1.317968, -1.258022, 1.343455, 1, 0, 0.5294118, 1,
1.32342, 1.272325, 1.897614, 1, 0, 0.5215687, 1,
1.326076, -2.150053, 3.631471, 1, 0, 0.5176471, 1,
1.339552, -0.07310382, 2.508647, 1, 0, 0.509804, 1,
1.355188, -0.806555, 3.73016, 1, 0, 0.5058824, 1,
1.357483, -1.530607, 1.73371, 1, 0, 0.4980392, 1,
1.360781, 0.3750714, 0.7571158, 1, 0, 0.4901961, 1,
1.365254, 0.8956482, 3.115812, 1, 0, 0.4862745, 1,
1.367312, -0.6808267, 1.837819, 1, 0, 0.4784314, 1,
1.368332, -1.290844, 1.353881, 1, 0, 0.4745098, 1,
1.371662, 0.3364604, 2.839801, 1, 0, 0.4666667, 1,
1.381284, 1.024498, -0.01043245, 1, 0, 0.4627451, 1,
1.399004, -1.439906, 2.794578, 1, 0, 0.454902, 1,
1.407106, -0.05151347, 1.217257, 1, 0, 0.4509804, 1,
1.410975, -0.7489923, 2.822717, 1, 0, 0.4431373, 1,
1.412861, -0.1925728, 1.970037, 1, 0, 0.4392157, 1,
1.415624, 0.02985698, 2.510217, 1, 0, 0.4313726, 1,
1.41855, -0.01307546, 2.509117, 1, 0, 0.427451, 1,
1.419028, -0.241041, 1.181418, 1, 0, 0.4196078, 1,
1.421345, -1.31584, 0.2340561, 1, 0, 0.4156863, 1,
1.422044, 0.2429701, 2.467672, 1, 0, 0.4078431, 1,
1.428161, 0.8244078, 0.9456006, 1, 0, 0.4039216, 1,
1.432716, 0.9829611, 2.055518, 1, 0, 0.3960784, 1,
1.441648, 1.524793, -0.08244075, 1, 0, 0.3882353, 1,
1.448883, -0.4351978, 3.235389, 1, 0, 0.3843137, 1,
1.455354, -0.608674, 1.967065, 1, 0, 0.3764706, 1,
1.455391, 0.9501641, 0.03399555, 1, 0, 0.372549, 1,
1.455422, 0.11839, 1.73397, 1, 0, 0.3647059, 1,
1.47255, -0.01631806, 2.048113, 1, 0, 0.3607843, 1,
1.497799, 1.472222, 0.006730079, 1, 0, 0.3529412, 1,
1.498597, -0.3894073, 2.592777, 1, 0, 0.3490196, 1,
1.500029, -1.18844, 2.87373, 1, 0, 0.3411765, 1,
1.510219, -0.7758511, 2.046511, 1, 0, 0.3372549, 1,
1.518, -0.1582496, 1.460792, 1, 0, 0.3294118, 1,
1.525018, 0.07160497, 2.712847, 1, 0, 0.3254902, 1,
1.535804, 0.4809969, 0.4043129, 1, 0, 0.3176471, 1,
1.536498, -1.045208, 1.474868, 1, 0, 0.3137255, 1,
1.538304, -0.6924787, 1.84124, 1, 0, 0.3058824, 1,
1.570718, -0.8309065, 2.769287, 1, 0, 0.2980392, 1,
1.573651, -0.2739026, 0.2996034, 1, 0, 0.2941177, 1,
1.588623, -1.632699, 1.71394, 1, 0, 0.2862745, 1,
1.602501, -0.3606765, 2.858773, 1, 0, 0.282353, 1,
1.613782, 0.3497412, -0.3976644, 1, 0, 0.2745098, 1,
1.629893, -2.274056, 2.498567, 1, 0, 0.2705882, 1,
1.642779, 1.741555, -0.6231753, 1, 0, 0.2627451, 1,
1.66248, -1.539163, 2.403266, 1, 0, 0.2588235, 1,
1.709682, 1.352067, 2.334492, 1, 0, 0.2509804, 1,
1.725875, 1.683277, 0.02612498, 1, 0, 0.2470588, 1,
1.737404, -0.1416183, 1.473987, 1, 0, 0.2392157, 1,
1.782086, -1.315028, 1.57379, 1, 0, 0.2352941, 1,
1.790636, 1.503721, 1.995043, 1, 0, 0.227451, 1,
1.809099, -1.101817, 1.426391, 1, 0, 0.2235294, 1,
1.811722, 1.463686, 1.86363, 1, 0, 0.2156863, 1,
1.856102, 1.453674, 1.495178, 1, 0, 0.2117647, 1,
1.861583, -0.1466549, 0.9411113, 1, 0, 0.2039216, 1,
1.925077, 0.6621367, 1.058615, 1, 0, 0.1960784, 1,
1.932866, 0.08109727, 0.6460319, 1, 0, 0.1921569, 1,
1.936432, -0.4739638, 2.407416, 1, 0, 0.1843137, 1,
1.93785, 0.00523213, 0.841439, 1, 0, 0.1803922, 1,
1.939051, -2.025039, 2.822944, 1, 0, 0.172549, 1,
1.95675, -0.05267291, 1.061822, 1, 0, 0.1686275, 1,
1.971549, -0.02263809, 1.236991, 1, 0, 0.1607843, 1,
1.979266, 0.656839, 2.816185, 1, 0, 0.1568628, 1,
1.992545, 1.427799, -0.4121384, 1, 0, 0.1490196, 1,
2.009211, -0.4793196, 0.2170068, 1, 0, 0.145098, 1,
2.010672, -0.5209823, 1.502044, 1, 0, 0.1372549, 1,
2.072063, -0.6400933, 2.76921, 1, 0, 0.1333333, 1,
2.143614, 0.7588875, -0.1780298, 1, 0, 0.1254902, 1,
2.160759, -0.28092, 1.617637, 1, 0, 0.1215686, 1,
2.172622, -1.169215, 2.249649, 1, 0, 0.1137255, 1,
2.186074, 1.167228, -0.4399102, 1, 0, 0.1098039, 1,
2.262459, 0.5614353, 0.4221857, 1, 0, 0.1019608, 1,
2.287117, 0.3205082, 2.166813, 1, 0, 0.09411765, 1,
2.296541, -0.2111903, 2.15393, 1, 0, 0.09019608, 1,
2.321692, 2.997389, -0.3222286, 1, 0, 0.08235294, 1,
2.36858, 1.797431, 3.145049, 1, 0, 0.07843138, 1,
2.381136, 0.5763966, 1.076538, 1, 0, 0.07058824, 1,
2.381194, -0.2637083, 1.053614, 1, 0, 0.06666667, 1,
2.389455, 0.5743896, 2.720803, 1, 0, 0.05882353, 1,
2.423644, 1.14767, 1.043885, 1, 0, 0.05490196, 1,
2.473233, 0.02454553, 2.558649, 1, 0, 0.04705882, 1,
2.674416, 0.7517447, 0.03802188, 1, 0, 0.04313726, 1,
2.683434, -0.5485212, 1.712838, 1, 0, 0.03529412, 1,
2.756583, -0.8128611, 2.519421, 1, 0, 0.03137255, 1,
2.778368, 0.004340364, 1.685704, 1, 0, 0.02352941, 1,
2.786037, 0.1133253, 0.3912581, 1, 0, 0.01960784, 1,
2.802942, -0.1034619, 2.090369, 1, 0, 0.01176471, 1,
3.136425, -0.02008574, 1.961862, 1, 0, 0.007843138, 1
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
0.09889853, -4.151025, -6.74562, 0, -0.5, 0.5, 0.5,
0.09889853, -4.151025, -6.74562, 1, -0.5, 0.5, 0.5,
0.09889853, -4.151025, -6.74562, 1, 1.5, 0.5, 0.5,
0.09889853, -4.151025, -6.74562, 0, 1.5, 0.5, 0.5
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
-3.96835, -0.05879509, -6.74562, 0, -0.5, 0.5, 0.5,
-3.96835, -0.05879509, -6.74562, 1, -0.5, 0.5, 0.5,
-3.96835, -0.05879509, -6.74562, 1, 1.5, 0.5, 0.5,
-3.96835, -0.05879509, -6.74562, 0, 1.5, 0.5, 0.5
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
-3.96835, -4.151025, 0.3468499, 0, -0.5, 0.5, 0.5,
-3.96835, -4.151025, 0.3468499, 1, -0.5, 0.5, 0.5,
-3.96835, -4.151025, 0.3468499, 1, 1.5, 0.5, 0.5,
-3.96835, -4.151025, 0.3468499, 0, 1.5, 0.5, 0.5
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
-2, -3.206664, -5.108896,
3, -3.206664, -5.108896,
-2, -3.206664, -5.108896,
-2, -3.364058, -5.381683,
-1, -3.206664, -5.108896,
-1, -3.364058, -5.381683,
0, -3.206664, -5.108896,
0, -3.364058, -5.381683,
1, -3.206664, -5.108896,
1, -3.364058, -5.381683,
2, -3.206664, -5.108896,
2, -3.364058, -5.381683,
3, -3.206664, -5.108896,
3, -3.364058, -5.381683
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
-2, -3.678845, -5.927258, 0, -0.5, 0.5, 0.5,
-2, -3.678845, -5.927258, 1, -0.5, 0.5, 0.5,
-2, -3.678845, -5.927258, 1, 1.5, 0.5, 0.5,
-2, -3.678845, -5.927258, 0, 1.5, 0.5, 0.5,
-1, -3.678845, -5.927258, 0, -0.5, 0.5, 0.5,
-1, -3.678845, -5.927258, 1, -0.5, 0.5, 0.5,
-1, -3.678845, -5.927258, 1, 1.5, 0.5, 0.5,
-1, -3.678845, -5.927258, 0, 1.5, 0.5, 0.5,
0, -3.678845, -5.927258, 0, -0.5, 0.5, 0.5,
0, -3.678845, -5.927258, 1, -0.5, 0.5, 0.5,
0, -3.678845, -5.927258, 1, 1.5, 0.5, 0.5,
0, -3.678845, -5.927258, 0, 1.5, 0.5, 0.5,
1, -3.678845, -5.927258, 0, -0.5, 0.5, 0.5,
1, -3.678845, -5.927258, 1, -0.5, 0.5, 0.5,
1, -3.678845, -5.927258, 1, 1.5, 0.5, 0.5,
1, -3.678845, -5.927258, 0, 1.5, 0.5, 0.5,
2, -3.678845, -5.927258, 0, -0.5, 0.5, 0.5,
2, -3.678845, -5.927258, 1, -0.5, 0.5, 0.5,
2, -3.678845, -5.927258, 1, 1.5, 0.5, 0.5,
2, -3.678845, -5.927258, 0, 1.5, 0.5, 0.5,
3, -3.678845, -5.927258, 0, -0.5, 0.5, 0.5,
3, -3.678845, -5.927258, 1, -0.5, 0.5, 0.5,
3, -3.678845, -5.927258, 1, 1.5, 0.5, 0.5,
3, -3.678845, -5.927258, 0, 1.5, 0.5, 0.5
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
-3.029754, -3, -5.108896,
-3.029754, 2, -5.108896,
-3.029754, -3, -5.108896,
-3.186187, -3, -5.381683,
-3.029754, -2, -5.108896,
-3.186187, -2, -5.381683,
-3.029754, -1, -5.108896,
-3.186187, -1, -5.381683,
-3.029754, 0, -5.108896,
-3.186187, 0, -5.381683,
-3.029754, 1, -5.108896,
-3.186187, 1, -5.381683,
-3.029754, 2, -5.108896,
-3.186187, 2, -5.381683
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
-3.499052, -3, -5.927258, 0, -0.5, 0.5, 0.5,
-3.499052, -3, -5.927258, 1, -0.5, 0.5, 0.5,
-3.499052, -3, -5.927258, 1, 1.5, 0.5, 0.5,
-3.499052, -3, -5.927258, 0, 1.5, 0.5, 0.5,
-3.499052, -2, -5.927258, 0, -0.5, 0.5, 0.5,
-3.499052, -2, -5.927258, 1, -0.5, 0.5, 0.5,
-3.499052, -2, -5.927258, 1, 1.5, 0.5, 0.5,
-3.499052, -2, -5.927258, 0, 1.5, 0.5, 0.5,
-3.499052, -1, -5.927258, 0, -0.5, 0.5, 0.5,
-3.499052, -1, -5.927258, 1, -0.5, 0.5, 0.5,
-3.499052, -1, -5.927258, 1, 1.5, 0.5, 0.5,
-3.499052, -1, -5.927258, 0, 1.5, 0.5, 0.5,
-3.499052, 0, -5.927258, 0, -0.5, 0.5, 0.5,
-3.499052, 0, -5.927258, 1, -0.5, 0.5, 0.5,
-3.499052, 0, -5.927258, 1, 1.5, 0.5, 0.5,
-3.499052, 0, -5.927258, 0, 1.5, 0.5, 0.5,
-3.499052, 1, -5.927258, 0, -0.5, 0.5, 0.5,
-3.499052, 1, -5.927258, 1, -0.5, 0.5, 0.5,
-3.499052, 1, -5.927258, 1, 1.5, 0.5, 0.5,
-3.499052, 1, -5.927258, 0, 1.5, 0.5, 0.5,
-3.499052, 2, -5.927258, 0, -0.5, 0.5, 0.5,
-3.499052, 2, -5.927258, 1, -0.5, 0.5, 0.5,
-3.499052, 2, -5.927258, 1, 1.5, 0.5, 0.5,
-3.499052, 2, -5.927258, 0, 1.5, 0.5, 0.5
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
-3.029754, -3.206664, -4,
-3.029754, -3.206664, 4,
-3.029754, -3.206664, -4,
-3.186187, -3.364058, -4,
-3.029754, -3.206664, -2,
-3.186187, -3.364058, -2,
-3.029754, -3.206664, 0,
-3.186187, -3.364058, 0,
-3.029754, -3.206664, 2,
-3.186187, -3.364058, 2,
-3.029754, -3.206664, 4,
-3.186187, -3.364058, 4
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
-3.499052, -3.678845, -4, 0, -0.5, 0.5, 0.5,
-3.499052, -3.678845, -4, 1, -0.5, 0.5, 0.5,
-3.499052, -3.678845, -4, 1, 1.5, 0.5, 0.5,
-3.499052, -3.678845, -4, 0, 1.5, 0.5, 0.5,
-3.499052, -3.678845, -2, 0, -0.5, 0.5, 0.5,
-3.499052, -3.678845, -2, 1, -0.5, 0.5, 0.5,
-3.499052, -3.678845, -2, 1, 1.5, 0.5, 0.5,
-3.499052, -3.678845, -2, 0, 1.5, 0.5, 0.5,
-3.499052, -3.678845, 0, 0, -0.5, 0.5, 0.5,
-3.499052, -3.678845, 0, 1, -0.5, 0.5, 0.5,
-3.499052, -3.678845, 0, 1, 1.5, 0.5, 0.5,
-3.499052, -3.678845, 0, 0, 1.5, 0.5, 0.5,
-3.499052, -3.678845, 2, 0, -0.5, 0.5, 0.5,
-3.499052, -3.678845, 2, 1, -0.5, 0.5, 0.5,
-3.499052, -3.678845, 2, 1, 1.5, 0.5, 0.5,
-3.499052, -3.678845, 2, 0, 1.5, 0.5, 0.5,
-3.499052, -3.678845, 4, 0, -0.5, 0.5, 0.5,
-3.499052, -3.678845, 4, 1, -0.5, 0.5, 0.5,
-3.499052, -3.678845, 4, 1, 1.5, 0.5, 0.5,
-3.499052, -3.678845, 4, 0, 1.5, 0.5, 0.5
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
-3.029754, -3.206664, -5.108896,
-3.029754, 3.089074, -5.108896,
-3.029754, -3.206664, 5.802596,
-3.029754, 3.089074, 5.802596,
-3.029754, -3.206664, -5.108896,
-3.029754, -3.206664, 5.802596,
-3.029754, 3.089074, -5.108896,
-3.029754, 3.089074, 5.802596,
-3.029754, -3.206664, -5.108896,
3.227551, -3.206664, -5.108896,
-3.029754, -3.206664, 5.802596,
3.227551, -3.206664, 5.802596,
-3.029754, 3.089074, -5.108896,
3.227551, 3.089074, -5.108896,
-3.029754, 3.089074, 5.802596,
3.227551, 3.089074, 5.802596,
3.227551, -3.206664, -5.108896,
3.227551, 3.089074, -5.108896,
3.227551, -3.206664, 5.802596,
3.227551, 3.089074, 5.802596,
3.227551, -3.206664, -5.108896,
3.227551, -3.206664, 5.802596,
3.227551, 3.089074, -5.108896,
3.227551, 3.089074, 5.802596
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
var radius = 7.510942;
var distance = 33.41703;
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
mvMatrix.translate( -0.09889853, 0.05879509, -0.3468499 );
mvMatrix.scale( 1.297839, 1.289917, 0.7442592 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.41703);
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
nitralin<-read.table("nitralin.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-nitralin$V2
```

```
## Error in eval(expr, envir, enclos): object 'nitralin' not found
```

```r
y<-nitralin$V3
```

```
## Error in eval(expr, envir, enclos): object 'nitralin' not found
```

```r
z<-nitralin$V4
```

```
## Error in eval(expr, envir, enclos): object 'nitralin' not found
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
-2.938628, -1.005827, -1.020314, 0, 0, 1, 1, 1,
-2.889233, 0.2666045, -0.6988326, 1, 0, 0, 1, 1,
-2.873541, -0.3102154, -1.160678, 1, 0, 0, 1, 1,
-2.83852, -0.2102464, -3.919731, 1, 0, 0, 1, 1,
-2.702799, 0.1723611, -2.691055, 1, 0, 0, 1, 1,
-2.596483, 1.075805, -0.3437334, 1, 0, 0, 1, 1,
-2.557558, -0.1184249, -2.745642, 0, 0, 0, 1, 1,
-2.500484, -0.613616, -3.168818, 0, 0, 0, 1, 1,
-2.483627, -0.0001612017, -1.270223, 0, 0, 0, 1, 1,
-2.442892, 2.020252, -1.328341, 0, 0, 0, 1, 1,
-2.406485, 1.506988, 1.09328, 0, 0, 0, 1, 1,
-2.350562, 0.698554, -1.53948, 0, 0, 0, 1, 1,
-2.320687, -0.1144277, -1.683121, 0, 0, 0, 1, 1,
-2.273277, -0.5417049, -1.912076, 1, 1, 1, 1, 1,
-2.24866, -0.5528539, -3.103848, 1, 1, 1, 1, 1,
-2.245455, -0.5623755, -0.1312043, 1, 1, 1, 1, 1,
-2.215091, -1.718846, -3.265613, 1, 1, 1, 1, 1,
-2.174041, -0.8568239, -1.583694, 1, 1, 1, 1, 1,
-2.131026, 1.223823, -1.868313, 1, 1, 1, 1, 1,
-2.128708, -0.2742794, -0.5721672, 1, 1, 1, 1, 1,
-2.10485, 0.4128405, -2.167888, 1, 1, 1, 1, 1,
-2.049176, -0.659347, -1.365212, 1, 1, 1, 1, 1,
-2.042457, 0.7612607, -0.8824071, 1, 1, 1, 1, 1,
-2.032182, 0.4342234, -1.419473, 1, 1, 1, 1, 1,
-1.994419, -0.1671302, -1.547462, 1, 1, 1, 1, 1,
-1.988056, -0.06983056, -2.036849, 1, 1, 1, 1, 1,
-1.971965, 0.3912216, -1.568677, 1, 1, 1, 1, 1,
-1.96123, 0.88613, -0.3123335, 1, 1, 1, 1, 1,
-1.946099, 0.4722278, -1.95631, 0, 0, 1, 1, 1,
-1.918688, 1.222563, -0.6243532, 1, 0, 0, 1, 1,
-1.911833, 1.990091, 0.08010951, 1, 0, 0, 1, 1,
-1.833404, 1.115785, -0.1049975, 1, 0, 0, 1, 1,
-1.822118, 0.464623, -1.086249, 1, 0, 0, 1, 1,
-1.821702, -1.334115, -2.454608, 1, 0, 0, 1, 1,
-1.813871, 0.813179, -1.221168, 0, 0, 0, 1, 1,
-1.792843, 0.9761632, -1.489682, 0, 0, 0, 1, 1,
-1.786147, -0.6419073, -1.401265, 0, 0, 0, 1, 1,
-1.778273, 1.088531, -2.178791, 0, 0, 0, 1, 1,
-1.757101, -0.6088343, -2.143556, 0, 0, 0, 1, 1,
-1.741609, 0.7119716, -0.9806033, 0, 0, 0, 1, 1,
-1.741558, 0.6903001, -0.23356, 0, 0, 0, 1, 1,
-1.689935, 1.140003, -1.922691, 1, 1, 1, 1, 1,
-1.67007, -0.5253135, -1.216544, 1, 1, 1, 1, 1,
-1.666007, -0.5896777, -2.082102, 1, 1, 1, 1, 1,
-1.631312, -0.2138604, -2.613405, 1, 1, 1, 1, 1,
-1.62475, -0.01705431, -2.344297, 1, 1, 1, 1, 1,
-1.616603, 0.5320729, -0.9039049, 1, 1, 1, 1, 1,
-1.607456, 1.103591, 0.04381609, 1, 1, 1, 1, 1,
-1.60335, 0.4272594, -1.50225, 1, 1, 1, 1, 1,
-1.599481, 1.409311, -0.3263879, 1, 1, 1, 1, 1,
-1.59788, -0.1451073, -1.472118, 1, 1, 1, 1, 1,
-1.587368, -0.5848978, -1.31241, 1, 1, 1, 1, 1,
-1.586321, 0.5928632, -1.940869, 1, 1, 1, 1, 1,
-1.583075, 1.805959, -0.7083428, 1, 1, 1, 1, 1,
-1.569871, -1.198754, -3.294798, 1, 1, 1, 1, 1,
-1.557021, -1.04006, -1.552659, 1, 1, 1, 1, 1,
-1.541072, -1.290583, -1.217559, 0, 0, 1, 1, 1,
-1.53943, -0.6705709, -0.4507681, 1, 0, 0, 1, 1,
-1.53727, 0.8058925, -2.275873, 1, 0, 0, 1, 1,
-1.528377, 0.8773826, -1.21802, 1, 0, 0, 1, 1,
-1.515845, -0.4838253, -2.171041, 1, 0, 0, 1, 1,
-1.488896, -0.643737, -1.197057, 1, 0, 0, 1, 1,
-1.4843, -0.2151826, -1.741138, 0, 0, 0, 1, 1,
-1.480446, 0.9776588, -0.9032374, 0, 0, 0, 1, 1,
-1.474188, 1.163799, -0.8009676, 0, 0, 0, 1, 1,
-1.471071, -1.87915, -2.642034, 0, 0, 0, 1, 1,
-1.458972, -0.4762104, -2.04329, 0, 0, 0, 1, 1,
-1.454798, 0.703789, -1.435816, 0, 0, 0, 1, 1,
-1.451834, 0.7500075, -1.197856, 0, 0, 0, 1, 1,
-1.442857, -0.531144, -1.664245, 1, 1, 1, 1, 1,
-1.436214, -1.359331, -2.130254, 1, 1, 1, 1, 1,
-1.433652, 0.9304106, -0.06068872, 1, 1, 1, 1, 1,
-1.431152, -2.218762, -2.131433, 1, 1, 1, 1, 1,
-1.427477, -0.9604423, -2.436129, 1, 1, 1, 1, 1,
-1.409922, 2.015551, -1.953953, 1, 1, 1, 1, 1,
-1.408325, -0.1998833, -1.693013, 1, 1, 1, 1, 1,
-1.405925, -0.8406057, -0.8036785, 1, 1, 1, 1, 1,
-1.405667, -0.1685996, -1.468861, 1, 1, 1, 1, 1,
-1.404322, 0.3128175, -3.379756, 1, 1, 1, 1, 1,
-1.403577, 0.8489699, 0.2705911, 1, 1, 1, 1, 1,
-1.389979, 0.3466108, 0.03199537, 1, 1, 1, 1, 1,
-1.384566, 0.4567497, 0.7895855, 1, 1, 1, 1, 1,
-1.377117, 2.064636, -2.461116, 1, 1, 1, 1, 1,
-1.360309, 1.83597, -1.482374, 1, 1, 1, 1, 1,
-1.356275, 1.015984, -0.04089467, 0, 0, 1, 1, 1,
-1.34826, -0.3644163, -2.384892, 1, 0, 0, 1, 1,
-1.332609, 2.486506, -1.981661, 1, 0, 0, 1, 1,
-1.331251, 1.157712, -0.6891183, 1, 0, 0, 1, 1,
-1.325255, 2.158599, -1.378724, 1, 0, 0, 1, 1,
-1.324899, -0.3538791, -1.262503, 1, 0, 0, 1, 1,
-1.320845, 0.2698317, -1.326986, 0, 0, 0, 1, 1,
-1.302963, 0.5437629, -0.9452024, 0, 0, 0, 1, 1,
-1.302117, -1.37406, -0.2099355, 0, 0, 0, 1, 1,
-1.30124, -0.1119759, -1.733491, 0, 0, 0, 1, 1,
-1.296113, -0.1769954, -3.082813, 0, 0, 0, 1, 1,
-1.292371, -0.1229239, -0.8254575, 0, 0, 0, 1, 1,
-1.290728, -0.005843169, -0.2629057, 0, 0, 0, 1, 1,
-1.284274, 1.042659, -2.505718, 1, 1, 1, 1, 1,
-1.282236, 0.1151951, -1.862585, 1, 1, 1, 1, 1,
-1.277346, -0.5810179, -2.049747, 1, 1, 1, 1, 1,
-1.276592, -0.8073596, -2.104653, 1, 1, 1, 1, 1,
-1.273759, -1.070259, -2.938689, 1, 1, 1, 1, 1,
-1.272391, -1.691297, -1.341703, 1, 1, 1, 1, 1,
-1.268642, 0.2057216, -1.24973, 1, 1, 1, 1, 1,
-1.261425, 0.4821748, -0.9556708, 1, 1, 1, 1, 1,
-1.260749, 1.288807, 0.4608721, 1, 1, 1, 1, 1,
-1.257377, 0.4470734, -1.497249, 1, 1, 1, 1, 1,
-1.255034, -0.9731301, -1.026823, 1, 1, 1, 1, 1,
-1.252113, 1.968557, 0.9102471, 1, 1, 1, 1, 1,
-1.252002, 1.007928, 0.09961268, 1, 1, 1, 1, 1,
-1.249362, 0.7587464, -1.800011, 1, 1, 1, 1, 1,
-1.249084, -1.411044, -3.448164, 1, 1, 1, 1, 1,
-1.248431, 0.2651619, -2.363785, 0, 0, 1, 1, 1,
-1.246271, 1.014534, -0.9782324, 1, 0, 0, 1, 1,
-1.243123, 0.4161548, -1.267921, 1, 0, 0, 1, 1,
-1.231811, 0.1553263, -1.369543, 1, 0, 0, 1, 1,
-1.224267, -1.818796, -2.393982, 1, 0, 0, 1, 1,
-1.217242, -1.503546, -2.927897, 1, 0, 0, 1, 1,
-1.212855, -0.8728541, -0.9568014, 0, 0, 0, 1, 1,
-1.20044, 1.449188, -1.704915, 0, 0, 0, 1, 1,
-1.179939, 0.9925654, 0.3881814, 0, 0, 0, 1, 1,
-1.178752, 1.025727, -1.389514, 0, 0, 0, 1, 1,
-1.178239, -0.648122, -1.234144, 0, 0, 0, 1, 1,
-1.169294, -1.537486, -2.149507, 0, 0, 0, 1, 1,
-1.156115, -0.06052895, -1.149989, 0, 0, 0, 1, 1,
-1.152728, -0.4255603, -3.092056, 1, 1, 1, 1, 1,
-1.148497, -0.2434973, -2.846976, 1, 1, 1, 1, 1,
-1.148145, 0.4368764, -0.3835143, 1, 1, 1, 1, 1,
-1.144563, 1.021496, -2.808905, 1, 1, 1, 1, 1,
-1.142882, 0.2076672, -0.6370897, 1, 1, 1, 1, 1,
-1.142251, -0.8030324, -0.6877702, 1, 1, 1, 1, 1,
-1.138066, -0.283861, -3.012989, 1, 1, 1, 1, 1,
-1.135452, 0.3427925, -2.13023, 1, 1, 1, 1, 1,
-1.131651, 0.1537621, -1.149478, 1, 1, 1, 1, 1,
-1.128295, 0.2712677, -0.5870115, 1, 1, 1, 1, 1,
-1.127646, -0.9335158, -2.723606, 1, 1, 1, 1, 1,
-1.12667, 1.029166, -0.2813029, 1, 1, 1, 1, 1,
-1.12427, -0.2272412, -1.257223, 1, 1, 1, 1, 1,
-1.123189, 1.202871, -3.120233, 1, 1, 1, 1, 1,
-1.121955, -0.6889326, -2.552705, 1, 1, 1, 1, 1,
-1.12162, -1.857093, -2.306777, 0, 0, 1, 1, 1,
-1.120852, -0.6164215, -1.441132, 1, 0, 0, 1, 1,
-1.120301, -0.2172147, -1.224689, 1, 0, 0, 1, 1,
-1.120028, -0.1434774, -2.003426, 1, 0, 0, 1, 1,
-1.11749, -0.322602, -1.794916, 1, 0, 0, 1, 1,
-1.117234, -0.9873455, -2.63907, 1, 0, 0, 1, 1,
-1.11683, 0.03407396, -0.7776482, 0, 0, 0, 1, 1,
-1.109299, -0.2593107, -1.188466, 0, 0, 0, 1, 1,
-1.10122, 0.4014537, 0.06307288, 0, 0, 0, 1, 1,
-1.093199, -0.5874605, -3.157585, 0, 0, 0, 1, 1,
-1.077526, -0.7419431, -0.8808408, 0, 0, 0, 1, 1,
-1.074088, 0.6747183, 0.4815548, 0, 0, 0, 1, 1,
-1.073361, 0.4126115, -1.391397, 0, 0, 0, 1, 1,
-1.073152, 0.2058143, -0.4437659, 1, 1, 1, 1, 1,
-1.071632, 1.183387, -0.8605728, 1, 1, 1, 1, 1,
-1.054896, 0.9608413, -0.3207189, 1, 1, 1, 1, 1,
-1.051205, -0.6545642, -2.298386, 1, 1, 1, 1, 1,
-1.046146, -1.952546, -2.86914, 1, 1, 1, 1, 1,
-1.04497, 0.5089524, -1.488292, 1, 1, 1, 1, 1,
-1.044025, 0.8613694, -2.136732, 1, 1, 1, 1, 1,
-1.040004, 0.6175425, -0.4996334, 1, 1, 1, 1, 1,
-1.035469, 0.197969, -1.494498, 1, 1, 1, 1, 1,
-1.032213, 0.6941122, -2.571768, 1, 1, 1, 1, 1,
-1.030644, -1.129219, -2.125726, 1, 1, 1, 1, 1,
-1.015133, 0.4211959, -2.753155, 1, 1, 1, 1, 1,
-1.01435, -0.7410351, -3.442927, 1, 1, 1, 1, 1,
-0.9983124, 0.321205, -2.132048, 1, 1, 1, 1, 1,
-0.9965423, -0.1240676, -1.408381, 1, 1, 1, 1, 1,
-0.9905868, -2.056406, -3.25634, 0, 0, 1, 1, 1,
-0.9846327, -0.4789033, -1.915414, 1, 0, 0, 1, 1,
-0.9842211, 1.072835, -1.819823, 1, 0, 0, 1, 1,
-0.9833899, 0.1621903, -3.192864, 1, 0, 0, 1, 1,
-0.981788, -0.2103013, -0.1640879, 1, 0, 0, 1, 1,
-0.976805, -0.4425582, -1.47908, 1, 0, 0, 1, 1,
-0.9766026, 1.449464, -1.213306, 0, 0, 0, 1, 1,
-0.9722689, -0.8759908, -1.035556, 0, 0, 0, 1, 1,
-0.9719595, 0.4806191, 0.279895, 0, 0, 0, 1, 1,
-0.9703142, -0.06266595, 0.04934982, 0, 0, 0, 1, 1,
-0.9675176, -0.3049113, -3.118062, 0, 0, 0, 1, 1,
-0.9650598, 1.9184, -0.08714708, 0, 0, 0, 1, 1,
-0.9640509, -1.892736, 0.6940693, 0, 0, 0, 1, 1,
-0.9539505, 0.8502187, -1.517797, 1, 1, 1, 1, 1,
-0.9458204, 0.6192626, 0.6807529, 1, 1, 1, 1, 1,
-0.940374, 1.845737, -0.4358624, 1, 1, 1, 1, 1,
-0.935655, -0.6214386, -1.536376, 1, 1, 1, 1, 1,
-0.9333158, -0.4290341, -1.365415, 1, 1, 1, 1, 1,
-0.9319288, 0.5998431, -0.6180304, 1, 1, 1, 1, 1,
-0.9200951, -2.275895, -1.942547, 1, 1, 1, 1, 1,
-0.9089791, -0.499939, -1.186148, 1, 1, 1, 1, 1,
-0.9077737, -3.114979, -1.738293, 1, 1, 1, 1, 1,
-0.9073837, -1.027863, -3.358541, 1, 1, 1, 1, 1,
-0.9039554, 0.8525529, -0.3597785, 1, 1, 1, 1, 1,
-0.8932206, -1.94336, -1.855032, 1, 1, 1, 1, 1,
-0.8920063, 0.9856939, -1.683497, 1, 1, 1, 1, 1,
-0.8838668, -1.689656, -3.746773, 1, 1, 1, 1, 1,
-0.88162, -2.09103, -3.368991, 1, 1, 1, 1, 1,
-0.8758162, 0.6260257, -0.5923296, 0, 0, 1, 1, 1,
-0.873438, 0.1355074, -0.2185174, 1, 0, 0, 1, 1,
-0.8729111, -0.343154, -4.079345, 1, 0, 0, 1, 1,
-0.8709332, 0.1203957, -1.691734, 1, 0, 0, 1, 1,
-0.8563644, -0.8401753, -3.449019, 1, 0, 0, 1, 1,
-0.8505707, 0.4892322, -0.7632977, 1, 0, 0, 1, 1,
-0.8490893, 1.053124, -1.128105, 0, 0, 0, 1, 1,
-0.8450267, 1.01654, -0.2588224, 0, 0, 0, 1, 1,
-0.8347619, 1.109694, -2.192677, 0, 0, 0, 1, 1,
-0.8325157, 1.420959, -2.373848, 0, 0, 0, 1, 1,
-0.8320825, 1.263826, 0.005110501, 0, 0, 0, 1, 1,
-0.8298572, -0.8150799, -2.639046, 0, 0, 0, 1, 1,
-0.8287981, 0.6211801, -1.67649, 0, 0, 0, 1, 1,
-0.8246787, -1.737509, -0.7409924, 1, 1, 1, 1, 1,
-0.8234867, 0.4246925, -0.8871586, 1, 1, 1, 1, 1,
-0.8213348, 1.246115, -1.092394, 1, 1, 1, 1, 1,
-0.8137768, 1.672996, 0.9700301, 1, 1, 1, 1, 1,
-0.8118041, -0.01271943, -1.781343, 1, 1, 1, 1, 1,
-0.8109008, 1.119425, 0.01868201, 1, 1, 1, 1, 1,
-0.8098505, -2.059295, -3.643401, 1, 1, 1, 1, 1,
-0.8097161, 2.274038, -0.862125, 1, 1, 1, 1, 1,
-0.7984875, -0.5683933, -3.232891, 1, 1, 1, 1, 1,
-0.7967546, 1.217577, 0.2760354, 1, 1, 1, 1, 1,
-0.7953121, -1.300042, -2.5247, 1, 1, 1, 1, 1,
-0.7931226, -0.3243445, -3.122973, 1, 1, 1, 1, 1,
-0.7832936, 1.258893, -1.541663, 1, 1, 1, 1, 1,
-0.7786822, 0.1300329, 0.3464172, 1, 1, 1, 1, 1,
-0.7783471, -0.2077895, -1.907583, 1, 1, 1, 1, 1,
-0.7783101, -0.1988177, -2.854078, 0, 0, 1, 1, 1,
-0.7725434, -0.7635701, -2.636394, 1, 0, 0, 1, 1,
-0.7722296, 0.7861548, -1.838085, 1, 0, 0, 1, 1,
-0.7695451, 1.106959, -0.7074065, 1, 0, 0, 1, 1,
-0.7655693, 0.4518423, -1.214723, 1, 0, 0, 1, 1,
-0.7647306, 0.05300395, -0.3521134, 1, 0, 0, 1, 1,
-0.7638228, -0.3710997, -2.479319, 0, 0, 0, 1, 1,
-0.7582614, -0.7207828, -2.169201, 0, 0, 0, 1, 1,
-0.7522963, 0.5436641, -0.9879546, 0, 0, 0, 1, 1,
-0.7444368, 2.031207, -2.57233, 0, 0, 0, 1, 1,
-0.7444346, 0.368257, 0.09081182, 0, 0, 0, 1, 1,
-0.7442507, -0.4127331, -2.604387, 0, 0, 0, 1, 1,
-0.7406684, 0.6793519, -1.150094, 0, 0, 0, 1, 1,
-0.7405915, 0.3750033, -1.564027, 1, 1, 1, 1, 1,
-0.739712, -0.06746219, -4.169549, 1, 1, 1, 1, 1,
-0.7384546, -0.8341567, -2.777122, 1, 1, 1, 1, 1,
-0.7338006, 1.221399, 0.6590581, 1, 1, 1, 1, 1,
-0.7335929, 1.181008, -0.7942348, 1, 1, 1, 1, 1,
-0.727818, -0.7898058, -2.544933, 1, 1, 1, 1, 1,
-0.7277056, 1.193851, -1.76746, 1, 1, 1, 1, 1,
-0.7203701, -0.6700071, -1.74116, 1, 1, 1, 1, 1,
-0.7165127, -0.8946669, -2.191047, 1, 1, 1, 1, 1,
-0.7143401, -0.144962, -2.089785, 1, 1, 1, 1, 1,
-0.7121221, 1.155488, -0.5905033, 1, 1, 1, 1, 1,
-0.7114927, -1.246161, -2.52589, 1, 1, 1, 1, 1,
-0.7111536, 0.4628716, -1.239042, 1, 1, 1, 1, 1,
-0.7092036, -0.2541795, -2.178109, 1, 1, 1, 1, 1,
-0.7069368, -0.9794004, -4.098092, 1, 1, 1, 1, 1,
-0.701745, -0.4857381, -2.870366, 0, 0, 1, 1, 1,
-0.6982298, 0.1976033, -3.350894, 1, 0, 0, 1, 1,
-0.6976185, -1.822967, -3.279163, 1, 0, 0, 1, 1,
-0.6975135, 1.300852, -0.5108451, 1, 0, 0, 1, 1,
-0.6967893, 0.9046915, -2.159145, 1, 0, 0, 1, 1,
-0.6953657, -2.288926, -2.016787, 1, 0, 0, 1, 1,
-0.6948774, -1.23541, -2.716543, 0, 0, 0, 1, 1,
-0.6945782, 1.071151, -0.6026434, 0, 0, 0, 1, 1,
-0.6878016, -1.583663, -3.103543, 0, 0, 0, 1, 1,
-0.6801568, 0.06256461, -1.511447, 0, 0, 0, 1, 1,
-0.6775979, -0.2628488, -1.304445, 0, 0, 0, 1, 1,
-0.6748211, 0.453673, -3.098404, 0, 0, 0, 1, 1,
-0.6707867, 0.4380827, -1.141902, 0, 0, 0, 1, 1,
-0.6700228, -2.315982, -2.102916, 1, 1, 1, 1, 1,
-0.6691481, -0.3312619, -2.547778, 1, 1, 1, 1, 1,
-0.6674569, -0.6509507, -3.360559, 1, 1, 1, 1, 1,
-0.6632668, -0.7540712, -0.5853746, 1, 1, 1, 1, 1,
-0.6617302, -1.979864, -3.78912, 1, 1, 1, 1, 1,
-0.6587183, -0.8734382, -2.90294, 1, 1, 1, 1, 1,
-0.6573527, -0.1288579, -1.281452, 1, 1, 1, 1, 1,
-0.6560619, 0.01094778, -0.933565, 1, 1, 1, 1, 1,
-0.6558143, -0.7988129, -3.84126, 1, 1, 1, 1, 1,
-0.6534917, -1.884812, -1.94686, 1, 1, 1, 1, 1,
-0.6496489, 0.01285177, -3.132879, 1, 1, 1, 1, 1,
-0.6480594, 0.1169893, -1.55137, 1, 1, 1, 1, 1,
-0.6472771, 0.2329687, -0.2655965, 1, 1, 1, 1, 1,
-0.6462007, 0.5072623, -1.277963, 1, 1, 1, 1, 1,
-0.6409183, 0.2584848, -2.181404, 1, 1, 1, 1, 1,
-0.6375602, -0.8073465, -1.743141, 0, 0, 1, 1, 1,
-0.6351761, 0.2060149, -2.033227, 1, 0, 0, 1, 1,
-0.6236197, -0.7071562, -3.652282, 1, 0, 0, 1, 1,
-0.6207906, -0.2014886, -0.9367434, 1, 0, 0, 1, 1,
-0.6197985, -0.7848363, -2.865607, 1, 0, 0, 1, 1,
-0.6121821, -0.6275769, -2.043121, 1, 0, 0, 1, 1,
-0.6037878, -0.7137729, -1.91556, 0, 0, 0, 1, 1,
-0.5982093, 1.250022, -0.1242227, 0, 0, 0, 1, 1,
-0.5953645, 0.7779642, -2.17924, 0, 0, 0, 1, 1,
-0.5946585, -0.3876995, -2.9135, 0, 0, 0, 1, 1,
-0.5943342, 1.184183, -0.7010711, 0, 0, 0, 1, 1,
-0.5942586, -0.4548561, -3.244574, 0, 0, 0, 1, 1,
-0.594015, -1.142521, -3.025269, 0, 0, 0, 1, 1,
-0.5882819, -2.678875, -2.292306, 1, 1, 1, 1, 1,
-0.5856776, -0.9701132, -2.159311, 1, 1, 1, 1, 1,
-0.5836661, -0.1641905, -2.053465, 1, 1, 1, 1, 1,
-0.5825505, -0.313469, -1.014701, 1, 1, 1, 1, 1,
-0.5802604, -1.712728, -3.896262, 1, 1, 1, 1, 1,
-0.5799181, -0.00374353, -1.81165, 1, 1, 1, 1, 1,
-0.5768208, -0.9054511, -2.886516, 1, 1, 1, 1, 1,
-0.5758097, -0.5021467, -3.500492, 1, 1, 1, 1, 1,
-0.5639597, 0.8393777, -0.7318838, 1, 1, 1, 1, 1,
-0.5609156, 1.890426, 0.5099559, 1, 1, 1, 1, 1,
-0.5552756, -0.6521612, -2.879897, 1, 1, 1, 1, 1,
-0.5548512, -0.06323145, -1.681737, 1, 1, 1, 1, 1,
-0.5541859, 0.4542442, 0.2798616, 1, 1, 1, 1, 1,
-0.5366161, -0.6888233, -3.419098, 1, 1, 1, 1, 1,
-0.5338736, 0.105029, 0.005961579, 1, 1, 1, 1, 1,
-0.5302743, 1.640382, 1.258707, 0, 0, 1, 1, 1,
-0.5299147, -0.8265079, -2.581202, 1, 0, 0, 1, 1,
-0.5297195, 2.81885, 0.03870459, 1, 0, 0, 1, 1,
-0.5268973, 0.1995741, -1.567244, 1, 0, 0, 1, 1,
-0.5228063, 1.1509, -1.022294, 1, 0, 0, 1, 1,
-0.5216413, -0.5895306, -2.547548, 1, 0, 0, 1, 1,
-0.5211878, 2.201478, -0.9998262, 0, 0, 0, 1, 1,
-0.5099552, -0.3683363, -0.9502249, 0, 0, 0, 1, 1,
-0.5049878, 0.8754169, -0.5625376, 0, 0, 0, 1, 1,
-0.5015996, -0.8152933, -4.193984, 0, 0, 0, 1, 1,
-0.4972352, -0.9987525, -1.517745, 0, 0, 0, 1, 1,
-0.4968409, 0.1034861, -1.25275, 0, 0, 0, 1, 1,
-0.4967375, -0.5977238, -2.197881, 0, 0, 0, 1, 1,
-0.4959141, 0.3023222, -1.531711, 1, 1, 1, 1, 1,
-0.4918873, 0.3425964, 0.5879046, 1, 1, 1, 1, 1,
-0.4888225, -0.1878607, -0.1370719, 1, 1, 1, 1, 1,
-0.4869596, -0.4285112, -2.415358, 1, 1, 1, 1, 1,
-0.4842341, -0.6968472, -2.816113, 1, 1, 1, 1, 1,
-0.4720966, 0.8801409, -1.282256, 1, 1, 1, 1, 1,
-0.4676774, 1.213271, 1.10226, 1, 1, 1, 1, 1,
-0.4676167, -0.9514641, -3.779481, 1, 1, 1, 1, 1,
-0.4663025, 0.650472, -1.81725, 1, 1, 1, 1, 1,
-0.4591779, -0.2736267, -3.506401, 1, 1, 1, 1, 1,
-0.4586896, 1.113247, -1.358576, 1, 1, 1, 1, 1,
-0.4582962, -2.265684, -4.135541, 1, 1, 1, 1, 1,
-0.4566031, 0.6416646, -0.8856528, 1, 1, 1, 1, 1,
-0.4547157, -0.1651502, -0.8306907, 1, 1, 1, 1, 1,
-0.4533472, 0.20564, -0.8718047, 1, 1, 1, 1, 1,
-0.4486051, -0.6770744, -1.747265, 0, 0, 1, 1, 1,
-0.447358, 2.412874, -1.05596, 1, 0, 0, 1, 1,
-0.4472119, -0.3176889, -4.097991, 1, 0, 0, 1, 1,
-0.4433665, -1.515883, -1.753175, 1, 0, 0, 1, 1,
-0.4414226, 0.06871192, -0.5786431, 1, 0, 0, 1, 1,
-0.4410381, 0.3660157, -1.128183, 1, 0, 0, 1, 1,
-0.4323499, 0.3353636, -2.835205, 0, 0, 0, 1, 1,
-0.4314988, -0.2685073, -1.275958, 0, 0, 0, 1, 1,
-0.4312609, 0.3908915, 0.3624193, 0, 0, 0, 1, 1,
-0.431186, 0.4871144, -1.066809, 0, 0, 0, 1, 1,
-0.4299015, -1.070771, -2.77186, 0, 0, 0, 1, 1,
-0.4298666, 1.301424, 0.4439112, 0, 0, 0, 1, 1,
-0.4243857, 0.8153535, -0.6409908, 0, 0, 0, 1, 1,
-0.4203522, 0.5840915, 0.6080524, 1, 1, 1, 1, 1,
-0.419701, -2.319968, -3.800184, 1, 1, 1, 1, 1,
-0.4177932, 1.305867, -1.277466, 1, 1, 1, 1, 1,
-0.4175363, 1.088477, -2.172118, 1, 1, 1, 1, 1,
-0.412105, 1.724412, 1.288074, 1, 1, 1, 1, 1,
-0.4118892, 0.4257795, -1.476307, 1, 1, 1, 1, 1,
-0.4110694, 0.796988, 0.5130979, 1, 1, 1, 1, 1,
-0.4094938, -1.07404, -4.324745, 1, 1, 1, 1, 1,
-0.4016794, 0.2279018, -0.6306765, 1, 1, 1, 1, 1,
-0.3982334, -1.233004, -1.416746, 1, 1, 1, 1, 1,
-0.3919768, 2.183629, -0.1904591, 1, 1, 1, 1, 1,
-0.390584, -1.682398, -2.697973, 1, 1, 1, 1, 1,
-0.3884068, -0.6375883, -2.770953, 1, 1, 1, 1, 1,
-0.386214, -0.07341585, -2.43613, 1, 1, 1, 1, 1,
-0.3845608, -1.234104, -3.07461, 1, 1, 1, 1, 1,
-0.3834228, -0.8406086, -2.374792, 0, 0, 1, 1, 1,
-0.3807305, -0.1705984, -2.985387, 1, 0, 0, 1, 1,
-0.3765429, 0.05020097, -0.7057968, 1, 0, 0, 1, 1,
-0.3755534, 1.133382, 0.07995925, 1, 0, 0, 1, 1,
-0.3718725, 0.3759618, -0.1230413, 1, 0, 0, 1, 1,
-0.3700329, -0.2787641, -2.000177, 1, 0, 0, 1, 1,
-0.3670264, -0.8615024, -3.546836, 0, 0, 0, 1, 1,
-0.3641156, 0.02875489, -2.163667, 0, 0, 0, 1, 1,
-0.3624561, -0.7105499, -3.864807, 0, 0, 0, 1, 1,
-0.3623887, -1.934913, -2.66115, 0, 0, 0, 1, 1,
-0.3562374, -0.690788, -0.8828537, 0, 0, 0, 1, 1,
-0.3489268, -0.45758, -4.043871, 0, 0, 0, 1, 1,
-0.3482543, -0.2027794, -1.823843, 0, 0, 0, 1, 1,
-0.3455077, -0.9275305, -3.893461, 1, 1, 1, 1, 1,
-0.3399442, -0.376655, -2.092117, 1, 1, 1, 1, 1,
-0.3309514, -0.1992263, -0.1854035, 1, 1, 1, 1, 1,
-0.3296098, 0.02247735, -2.157593, 1, 1, 1, 1, 1,
-0.3283793, -0.06137255, -2.625307, 1, 1, 1, 1, 1,
-0.3283609, 0.7023802, -1.940886, 1, 1, 1, 1, 1,
-0.3263372, 0.7189959, -1.858939, 1, 1, 1, 1, 1,
-0.3237147, -0.7080823, -3.332796, 1, 1, 1, 1, 1,
-0.3235161, -0.3436379, -1.842827, 1, 1, 1, 1, 1,
-0.3218778, 1.102666, -1.099944, 1, 1, 1, 1, 1,
-0.3215896, -0.8994334, -2.863693, 1, 1, 1, 1, 1,
-0.3175772, -2.155857, -2.665659, 1, 1, 1, 1, 1,
-0.3173723, 0.6267495, 0.8397701, 1, 1, 1, 1, 1,
-0.316404, -1.071188, -1.948004, 1, 1, 1, 1, 1,
-0.3150049, -0.9705124, -3.829512, 1, 1, 1, 1, 1,
-0.3141575, 0.4498744, -1.840785, 0, 0, 1, 1, 1,
-0.3119505, 1.899449, -0.3453202, 1, 0, 0, 1, 1,
-0.3090299, 1.139641, 0.008758286, 1, 0, 0, 1, 1,
-0.3086796, -1.306144, -2.868701, 1, 0, 0, 1, 1,
-0.3071211, -1.222301, -2.504265, 1, 0, 0, 1, 1,
-0.3041959, 0.02313817, -1.927722, 1, 0, 0, 1, 1,
-0.3041958, -1.399871, -3.487876, 0, 0, 0, 1, 1,
-0.3032837, 1.009111, -0.5440672, 0, 0, 0, 1, 1,
-0.3000278, 0.4843735, -0.8242047, 0, 0, 0, 1, 1,
-0.2947082, 0.7230934, 0.8064449, 0, 0, 0, 1, 1,
-0.2913984, 0.364572, -0.3705577, 0, 0, 0, 1, 1,
-0.2913406, 0.1900436, -3.484136, 0, 0, 0, 1, 1,
-0.2896761, -0.8901755, -3.450265, 0, 0, 0, 1, 1,
-0.2892002, -1.486432, -3.421825, 1, 1, 1, 1, 1,
-0.2830609, -0.3237308, -0.6618063, 1, 1, 1, 1, 1,
-0.2814576, -0.1510501, -2.851037, 1, 1, 1, 1, 1,
-0.2748648, 0.3819845, 0.1967786, 1, 1, 1, 1, 1,
-0.2695914, 0.2214169, -0.7565298, 1, 1, 1, 1, 1,
-0.2656673, -0.9630546, -1.859197, 1, 1, 1, 1, 1,
-0.2651152, -0.2692424, -2.142873, 1, 1, 1, 1, 1,
-0.2645892, -1.043898, -2.59548, 1, 1, 1, 1, 1,
-0.2644266, -1.219063, -3.238681, 1, 1, 1, 1, 1,
-0.2614326, 0.8486704, -0.9291502, 1, 1, 1, 1, 1,
-0.2546805, 0.06097536, -0.1931551, 1, 1, 1, 1, 1,
-0.2533063, 1.708992, 1.763149, 1, 1, 1, 1, 1,
-0.2485646, 1.79865, -0.9445227, 1, 1, 1, 1, 1,
-0.2446924, -2.186941, -1.286712, 1, 1, 1, 1, 1,
-0.2388849, 1.38031, -0.7146885, 1, 1, 1, 1, 1,
-0.2372996, 0.3729058, 0.2142615, 0, 0, 1, 1, 1,
-0.2369122, -0.4379838, -3.635291, 1, 0, 0, 1, 1,
-0.2339177, -0.7914155, -2.184726, 1, 0, 0, 1, 1,
-0.2339151, 0.2247524, -0.7798767, 1, 0, 0, 1, 1,
-0.2320674, -0.6968987, -2.673371, 1, 0, 0, 1, 1,
-0.2313651, -0.6602871, -2.52675, 1, 0, 0, 1, 1,
-0.2309772, 0.1318471, -2.277446, 0, 0, 0, 1, 1,
-0.230754, 0.7287491, 0.1402592, 0, 0, 0, 1, 1,
-0.2240146, 0.4146716, 0.1516469, 0, 0, 0, 1, 1,
-0.2210856, -0.9180494, -2.747392, 0, 0, 0, 1, 1,
-0.2192629, -0.3776516, -2.158147, 0, 0, 0, 1, 1,
-0.2188488, -0.2084553, -1.005547, 0, 0, 0, 1, 1,
-0.2186502, 0.5071989, 0.1266384, 0, 0, 0, 1, 1,
-0.2143002, 1.273359, -1.165518, 1, 1, 1, 1, 1,
-0.2139688, -1.070392, -2.479244, 1, 1, 1, 1, 1,
-0.2088635, -1.729396, -1.883431, 1, 1, 1, 1, 1,
-0.2040237, 1.081521, -0.6757102, 1, 1, 1, 1, 1,
-0.1997911, -1.153471, -2.090545, 1, 1, 1, 1, 1,
-0.1984364, -0.3136201, -2.428164, 1, 1, 1, 1, 1,
-0.1974667, 0.4999034, 0.4330171, 1, 1, 1, 1, 1,
-0.194108, 1.614973, -1.036537, 1, 1, 1, 1, 1,
-0.1890532, -0.851019, -4.455711, 1, 1, 1, 1, 1,
-0.1873206, -0.3568476, -4.638477, 1, 1, 1, 1, 1,
-0.179128, -0.7139417, -2.861432, 1, 1, 1, 1, 1,
-0.1787496, 0.4944681, -0.661195, 1, 1, 1, 1, 1,
-0.1784955, -2.222401, -2.948331, 1, 1, 1, 1, 1,
-0.1769115, -0.7098266, -1.970384, 1, 1, 1, 1, 1,
-0.1735983, 0.6457198, -0.5751955, 1, 1, 1, 1, 1,
-0.1688657, -0.1829604, -2.380516, 0, 0, 1, 1, 1,
-0.1653106, 0.7333941, -0.3594386, 1, 0, 0, 1, 1,
-0.1557109, -0.9888768, -3.731858, 1, 0, 0, 1, 1,
-0.1545527, -0.7013786, -3.495497, 1, 0, 0, 1, 1,
-0.1541245, -0.01222053, -2.872912, 1, 0, 0, 1, 1,
-0.1534614, 0.3803458, -0.6632524, 1, 0, 0, 1, 1,
-0.1532271, 1.408018, 0.1430533, 0, 0, 0, 1, 1,
-0.1499061, -0.7539662, -2.574498, 0, 0, 0, 1, 1,
-0.1490235, -1.271954, -1.914804, 0, 0, 0, 1, 1,
-0.1409866, -0.08168323, 0.1384781, 0, 0, 0, 1, 1,
-0.1391765, 0.4957434, -1.891332, 0, 0, 0, 1, 1,
-0.1353839, 1.070742, 0.1267712, 0, 0, 0, 1, 1,
-0.1341172, 0.5701078, -0.1348624, 0, 0, 0, 1, 1,
-0.1319584, 1.897224, -0.2798146, 1, 1, 1, 1, 1,
-0.1319046, 0.4585615, 1.797591, 1, 1, 1, 1, 1,
-0.1316204, 1.135662, 0.0631726, 1, 1, 1, 1, 1,
-0.1301143, -0.4898757, -2.342197, 1, 1, 1, 1, 1,
-0.127298, 0.6538912, -0.9203713, 1, 1, 1, 1, 1,
-0.1248512, 1.160679, 0.5508441, 1, 1, 1, 1, 1,
-0.1220798, 0.1410924, -1.414769, 1, 1, 1, 1, 1,
-0.1206807, 1.992689, -1.790153, 1, 1, 1, 1, 1,
-0.1175461, 0.0830224, -1.086112, 1, 1, 1, 1, 1,
-0.1160369, -0.08741083, -3.012231, 1, 1, 1, 1, 1,
-0.1119128, -0.1614112, -3.261393, 1, 1, 1, 1, 1,
-0.1088464, -0.01412154, -2.528648, 1, 1, 1, 1, 1,
-0.1063579, 1.805517, 0.3301053, 1, 1, 1, 1, 1,
-0.1034248, -0.271698, -1.713215, 1, 1, 1, 1, 1,
-0.1032292, 0.04057015, -0.9300167, 1, 1, 1, 1, 1,
-0.1030966, 0.9132203, 0.2820143, 0, 0, 1, 1, 1,
-0.1024323, -1.588003, -0.4641986, 1, 0, 0, 1, 1,
-0.09888841, 0.1062947, -0.6324397, 1, 0, 0, 1, 1,
-0.09836298, -1.453789, -4.479547, 1, 0, 0, 1, 1,
-0.09773789, 0.7516294, -0.7273348, 1, 0, 0, 1, 1,
-0.0969969, -0.2767589, -3.72075, 1, 0, 0, 1, 1,
-0.09120019, 1.06672, -0.9665466, 0, 0, 0, 1, 1,
-0.08860736, 0.3097524, -0.5298381, 0, 0, 0, 1, 1,
-0.08760303, 0.4856744, -0.5571768, 0, 0, 0, 1, 1,
-0.08756754, 0.3946248, 2.298837, 0, 0, 0, 1, 1,
-0.08570378, -0.662425, -4.314136, 0, 0, 0, 1, 1,
-0.08504909, 1.429678, -1.604099, 0, 0, 0, 1, 1,
-0.08452008, -0.8594865, -3.735169, 0, 0, 0, 1, 1,
-0.08387212, -0.2034078, -2.556006, 1, 1, 1, 1, 1,
-0.08307967, -0.8043551, -3.19476, 1, 1, 1, 1, 1,
-0.07723241, 0.3939566, 0.1717211, 1, 1, 1, 1, 1,
-0.07531732, 2.330365, -1.87453, 1, 1, 1, 1, 1,
-0.07511213, 0.3765949, 0.4895646, 1, 1, 1, 1, 1,
-0.07408354, -0.252462, -3.123909, 1, 1, 1, 1, 1,
-0.07177668, -0.0325744, -3.562693, 1, 1, 1, 1, 1,
-0.06521397, 0.4778639, 0.6077137, 1, 1, 1, 1, 1,
-0.06417804, -0.08838689, -2.463481, 1, 1, 1, 1, 1,
-0.06404518, -0.04720326, -3.379293, 1, 1, 1, 1, 1,
-0.06120968, 0.1058108, 0.8012671, 1, 1, 1, 1, 1,
-0.05415181, -1.047594, -4.173809, 1, 1, 1, 1, 1,
-0.05322383, -1.483119, -2.682953, 1, 1, 1, 1, 1,
-0.05119881, -0.8149402, -4.19532, 1, 1, 1, 1, 1,
-0.04977055, 2.071751, 1.256195, 1, 1, 1, 1, 1,
-0.04849955, -0.6952859, -4.326944, 0, 0, 1, 1, 1,
-0.04326635, 0.2216084, -0.8721502, 1, 0, 0, 1, 1,
-0.03409434, 0.2786126, -0.08279115, 1, 0, 0, 1, 1,
-0.03353437, 0.8386062, 0.6647688, 1, 0, 0, 1, 1,
-0.03126981, -0.2805814, -2.893529, 1, 0, 0, 1, 1,
-0.02867591, 0.9820838, 0.06459743, 1, 0, 0, 1, 1,
-0.02630046, 0.9990834, 0.8567918, 0, 0, 0, 1, 1,
-0.02496368, -0.3948202, -1.103229, 0, 0, 0, 1, 1,
-0.02064773, -1.133266, -3.553789, 0, 0, 0, 1, 1,
-0.01831405, -0.690781, -4.949991, 0, 0, 0, 1, 1,
-0.01011162, -0.3674671, -2.869204, 0, 0, 0, 1, 1,
-0.008716914, 0.1928756, 1.584341, 0, 0, 0, 1, 1,
-0.00666247, 0.6219531, -1.402736, 0, 0, 0, 1, 1,
-0.002827492, 0.4454685, -0.1587725, 1, 1, 1, 1, 1,
3.816773e-05, -0.8673924, 2.397045, 1, 1, 1, 1, 1,
0.000226409, -1.331381, 2.732468, 1, 1, 1, 1, 1,
0.006969926, 0.01834346, 0.04219452, 1, 1, 1, 1, 1,
0.007712313, 0.5978237, 1.708402, 1, 1, 1, 1, 1,
0.007935229, 1.117986, -1.128569, 1, 1, 1, 1, 1,
0.009841857, 0.04454103, 0.1888605, 1, 1, 1, 1, 1,
0.01326675, 2.551388, -1.688198, 1, 1, 1, 1, 1,
0.01556558, -0.2857412, 2.852929, 1, 1, 1, 1, 1,
0.01676992, 0.01079997, 1.577108, 1, 1, 1, 1, 1,
0.02250987, 2.052399, -0.5681862, 1, 1, 1, 1, 1,
0.02296451, 0.6825859, -1.419656, 1, 1, 1, 1, 1,
0.02431843, -1.285298, 2.087145, 1, 1, 1, 1, 1,
0.02703557, 0.03730205, 0.3932554, 1, 1, 1, 1, 1,
0.02800084, 0.05541702, -1.457904, 1, 1, 1, 1, 1,
0.03444143, 0.2055138, 0.3979786, 0, 0, 1, 1, 1,
0.05060532, -1.52339, 3.893148, 1, 0, 0, 1, 1,
0.05203959, 0.02105468, 0.4000407, 1, 0, 0, 1, 1,
0.05388853, 0.7998013, 0.1290181, 1, 0, 0, 1, 1,
0.05538052, -0.6972075, 2.612372, 1, 0, 0, 1, 1,
0.05558125, -0.2217409, 2.545098, 1, 0, 0, 1, 1,
0.06243393, 1.598094, 0.01571278, 0, 0, 0, 1, 1,
0.06362043, 0.08268426, -0.8296388, 0, 0, 0, 1, 1,
0.06486335, -0.5852975, 2.799408, 0, 0, 0, 1, 1,
0.06590989, 0.4502439, -1.047006, 0, 0, 0, 1, 1,
0.0740464, -0.6908454, 5.250367, 0, 0, 0, 1, 1,
0.07621769, -1.549199, 5.643691, 0, 0, 0, 1, 1,
0.08193856, -0.6434721, 4.593709, 0, 0, 0, 1, 1,
0.08503772, 0.9638549, 1.5193, 1, 1, 1, 1, 1,
0.08528296, -0.9107233, 4.046302, 1, 1, 1, 1, 1,
0.08615272, 1.253177, 0.1274098, 1, 1, 1, 1, 1,
0.08686359, 1.665755, 0.2651163, 1, 1, 1, 1, 1,
0.09652737, 0.838968, 0.1325204, 1, 1, 1, 1, 1,
0.09935484, -1.582573, 3.675134, 1, 1, 1, 1, 1,
0.1013418, 0.1476722, 2.100851, 1, 1, 1, 1, 1,
0.1027854, -0.02356677, 3.016875, 1, 1, 1, 1, 1,
0.1054089, -0.1570758, 1.836616, 1, 1, 1, 1, 1,
0.1061299, -1.64177, 2.313843, 1, 1, 1, 1, 1,
0.1088083, 0.8759538, -0.4456187, 1, 1, 1, 1, 1,
0.1121877, 0.7077849, -0.8191799, 1, 1, 1, 1, 1,
0.1141624, -0.6865196, 3.634974, 1, 1, 1, 1, 1,
0.1208488, 0.7495598, -0.1111976, 1, 1, 1, 1, 1,
0.1209188, 0.6728496, 2.537115, 1, 1, 1, 1, 1,
0.1243929, -0.9366659, 0.836507, 0, 0, 1, 1, 1,
0.1251499, 1.564871, 0.7143503, 1, 0, 0, 1, 1,
0.1273933, -0.2167136, 2.050298, 1, 0, 0, 1, 1,
0.129915, -0.1888667, 3.141716, 1, 0, 0, 1, 1,
0.1326204, 1.29145, 1.054313, 1, 0, 0, 1, 1,
0.1328008, 1.468248, -0.2816085, 1, 0, 0, 1, 1,
0.1350712, 0.42715, 0.8021418, 0, 0, 0, 1, 1,
0.1363313, 1.513813, 0.05501921, 0, 0, 0, 1, 1,
0.1391264, 1.113344, -1.473261, 0, 0, 0, 1, 1,
0.1420649, -0.4586625, 3.798619, 0, 0, 0, 1, 1,
0.1458814, -0.3776841, 4.508235, 0, 0, 0, 1, 1,
0.1501497, 0.6190673, 0.8524299, 0, 0, 0, 1, 1,
0.1526109, -0.6292743, 2.017549, 0, 0, 0, 1, 1,
0.1537044, 0.6366355, 1.318718, 1, 1, 1, 1, 1,
0.1542349, -0.1295763, 2.592216, 1, 1, 1, 1, 1,
0.1570241, 0.1082215, 1.891687, 1, 1, 1, 1, 1,
0.1581026, 0.04635089, 2.64942, 1, 1, 1, 1, 1,
0.1583404, 1.990412, -0.5856886, 1, 1, 1, 1, 1,
0.159561, -0.5561064, 2.506469, 1, 1, 1, 1, 1,
0.1654521, -0.07651649, 1.991773, 1, 1, 1, 1, 1,
0.1680591, -0.6616574, 3.668806, 1, 1, 1, 1, 1,
0.1751156, 0.1470674, 0.4066657, 1, 1, 1, 1, 1,
0.1809844, 0.4818654, -0.8508593, 1, 1, 1, 1, 1,
0.1902017, -1.33639, 2.90922, 1, 1, 1, 1, 1,
0.1913362, 1.696805, 0.2362796, 1, 1, 1, 1, 1,
0.1918626, 0.3873863, -1.015971, 1, 1, 1, 1, 1,
0.1967723, -1.007452, 2.686994, 1, 1, 1, 1, 1,
0.2022059, 0.5711808, -0.3590588, 1, 1, 1, 1, 1,
0.2050866, -0.5390103, 4.471734, 0, 0, 1, 1, 1,
0.2064909, 0.3235129, -0.9787543, 1, 0, 0, 1, 1,
0.2073888, -0.9028851, 1.459825, 1, 0, 0, 1, 1,
0.2074513, 1.017517, 0.03682508, 1, 0, 0, 1, 1,
0.2096571, 0.3613614, 0.1800894, 1, 0, 0, 1, 1,
0.2103779, -0.7201918, 1.48081, 1, 0, 0, 1, 1,
0.2105739, -0.4483644, 2.883624, 0, 0, 0, 1, 1,
0.2108729, 0.4481128, 1.54089, 0, 0, 0, 1, 1,
0.2146725, -0.5960402, 1.781732, 0, 0, 0, 1, 1,
0.215326, -2.221563, 4.334102, 0, 0, 0, 1, 1,
0.2166806, 0.05490905, -0.9234998, 0, 0, 0, 1, 1,
0.2170336, -1.804798, 5.336699, 0, 0, 0, 1, 1,
0.2174346, -0.6151326, 2.136793, 0, 0, 0, 1, 1,
0.218338, 0.2466243, 1.793911, 1, 1, 1, 1, 1,
0.2201252, 1.161963, -1.046783, 1, 1, 1, 1, 1,
0.221516, 0.09606016, 1.412576, 1, 1, 1, 1, 1,
0.2277317, -1.187128, 3.543883, 1, 1, 1, 1, 1,
0.2286088, 1.035082, -0.09692152, 1, 1, 1, 1, 1,
0.2304546, -0.8187284, 1.506946, 1, 1, 1, 1, 1,
0.2310385, -0.3179888, 1.605356, 1, 1, 1, 1, 1,
0.233415, -0.6567516, 2.705005, 1, 1, 1, 1, 1,
0.2375229, 0.6267909, 1.190487, 1, 1, 1, 1, 1,
0.239566, 2.307104, 1.946463, 1, 1, 1, 1, 1,
0.2405121, 1.554023, -0.4743672, 1, 1, 1, 1, 1,
0.2419178, -0.8195149, 3.22335, 1, 1, 1, 1, 1,
0.245112, 1.028932, -0.3542396, 1, 1, 1, 1, 1,
0.2462982, -0.6755693, 1.931776, 1, 1, 1, 1, 1,
0.2485873, 2.187114, 0.2485315, 1, 1, 1, 1, 1,
0.2486742, -0.6638258, 3.419948, 0, 0, 1, 1, 1,
0.2491034, -0.4201036, 3.635486, 1, 0, 0, 1, 1,
0.2550594, -0.0388088, 1.655045, 1, 0, 0, 1, 1,
0.2568435, -2.270607, 3.629977, 1, 0, 0, 1, 1,
0.2599253, 1.693338, 0.7644214, 1, 0, 0, 1, 1,
0.2603534, -0.4705407, 1.481642, 1, 0, 0, 1, 1,
0.2621545, 0.220197, -0.299176, 0, 0, 0, 1, 1,
0.2679196, 0.2055155, -0.7343531, 0, 0, 0, 1, 1,
0.2691766, 0.3062011, 1.02782, 0, 0, 0, 1, 1,
0.2698649, -0.2017861, 1.242145, 0, 0, 0, 1, 1,
0.2701328, -0.2059887, 2.368272, 0, 0, 0, 1, 1,
0.271841, 0.2672881, 1.504879, 0, 0, 0, 1, 1,
0.2719, -0.3589779, 0.4487817, 0, 0, 0, 1, 1,
0.2728252, -1.507724, 3.503146, 1, 1, 1, 1, 1,
0.2732084, 1.230933, -0.9269062, 1, 1, 1, 1, 1,
0.2734596, 0.4206281, -0.4571801, 1, 1, 1, 1, 1,
0.2781084, 1.276961, 0.5393089, 1, 1, 1, 1, 1,
0.2797954, -1.299201, 2.578214, 1, 1, 1, 1, 1,
0.2843329, -2.103802, 3.25986, 1, 1, 1, 1, 1,
0.2882864, -0.6890942, 1.077599, 1, 1, 1, 1, 1,
0.2913664, 0.9265317, 0.9318269, 1, 1, 1, 1, 1,
0.2919084, 0.5267933, -0.09777592, 1, 1, 1, 1, 1,
0.2942014, 1.402804, -0.1885221, 1, 1, 1, 1, 1,
0.2975436, -0.8714339, 1.85863, 1, 1, 1, 1, 1,
0.297711, -0.3606229, 2.218206, 1, 1, 1, 1, 1,
0.298109, -0.153338, 2.908196, 1, 1, 1, 1, 1,
0.2982896, 0.03972234, 1.050405, 1, 1, 1, 1, 1,
0.3022654, 1.386188, 1.452413, 1, 1, 1, 1, 1,
0.3024583, 0.05912634, 3.457027, 0, 0, 1, 1, 1,
0.3093072, 2.603379, 0.701207, 1, 0, 0, 1, 1,
0.3129834, -1.262584, 3.266281, 1, 0, 0, 1, 1,
0.3142047, 0.1901797, -0.4068943, 1, 0, 0, 1, 1,
0.3210504, -1.098475, 3.10503, 1, 0, 0, 1, 1,
0.3244982, -0.3592976, 1.245694, 1, 0, 0, 1, 1,
0.3285298, -0.588578, 5.309135, 0, 0, 0, 1, 1,
0.3289267, -1.236987, 4.408579, 0, 0, 0, 1, 1,
0.3303855, 0.2715245, 0.1095443, 0, 0, 0, 1, 1,
0.3308954, -0.6313823, 2.027397, 0, 0, 0, 1, 1,
0.3358446, 0.8659611, 0.1671798, 0, 0, 0, 1, 1,
0.3411539, -1.440909, 4.040527, 0, 0, 0, 1, 1,
0.3417619, 0.04138932, 1.081327, 0, 0, 0, 1, 1,
0.3451538, 0.216199, 3.440912, 1, 1, 1, 1, 1,
0.350472, -0.6215751, 4.042005, 1, 1, 1, 1, 1,
0.3507618, -0.8983888, 3.177548, 1, 1, 1, 1, 1,
0.352414, 0.7074345, 0.7369701, 1, 1, 1, 1, 1,
0.3644308, -0.4663657, 4.379722, 1, 1, 1, 1, 1,
0.3670711, 0.5849065, 0.7037639, 1, 1, 1, 1, 1,
0.3679768, 0.3528229, 0.0377434, 1, 1, 1, 1, 1,
0.3682192, 1.235741, 1.953435, 1, 1, 1, 1, 1,
0.3702981, 1.685118, 0.9739776, 1, 1, 1, 1, 1,
0.3740716, 0.5638471, 1.819725, 1, 1, 1, 1, 1,
0.3753983, -0.4492829, 2.957273, 1, 1, 1, 1, 1,
0.375615, 0.4766167, 0.6592865, 1, 1, 1, 1, 1,
0.3773763, 0.5525784, 2.455352, 1, 1, 1, 1, 1,
0.3775699, -0.5341094, 2.443313, 1, 1, 1, 1, 1,
0.380144, 0.9295577, 0.3676253, 1, 1, 1, 1, 1,
0.3804664, 1.022243, 0.4591979, 0, 0, 1, 1, 1,
0.3836768, -0.6078869, 1.802824, 1, 0, 0, 1, 1,
0.3887389, 0.1059914, 3.017396, 1, 0, 0, 1, 1,
0.3895977, -1.868004, 3.04589, 1, 0, 0, 1, 1,
0.3938104, 1.905727, 1.355717, 1, 0, 0, 1, 1,
0.3946326, -0.07791892, 3.835774, 1, 0, 0, 1, 1,
0.3953082, 1.324541, 1.496617, 0, 0, 0, 1, 1,
0.4004132, -0.8069769, 2.541564, 0, 0, 0, 1, 1,
0.4055749, -0.239608, 3.974864, 0, 0, 0, 1, 1,
0.4078178, -1.742294, 3.653703, 0, 0, 0, 1, 1,
0.4083361, -0.657012, 2.591034, 0, 0, 0, 1, 1,
0.4142896, -0.9790624, 2.903214, 0, 0, 0, 1, 1,
0.416803, -0.5097989, 2.099628, 0, 0, 0, 1, 1,
0.4171971, -0.335247, 2.740777, 1, 1, 1, 1, 1,
0.4193049, -0.4826129, 1.694524, 1, 1, 1, 1, 1,
0.4199591, 1.032419, 1.87882, 1, 1, 1, 1, 1,
0.4233341, -0.9703687, 3.895614, 1, 1, 1, 1, 1,
0.4240069, 0.4002379, 0.7091675, 1, 1, 1, 1, 1,
0.4256236, -0.3188678, 2.835715, 1, 1, 1, 1, 1,
0.4266486, -0.3224849, 1.95942, 1, 1, 1, 1, 1,
0.4266503, -0.496151, 1.640251, 1, 1, 1, 1, 1,
0.4302575, -1.401086, 3.598595, 1, 1, 1, 1, 1,
0.4306409, 0.7860568, -1.078876, 1, 1, 1, 1, 1,
0.4329539, -0.1787503, 2.782722, 1, 1, 1, 1, 1,
0.4369409, -1.871398, 2.406228, 1, 1, 1, 1, 1,
0.4377113, 0.7278246, 0.5469189, 1, 1, 1, 1, 1,
0.4386841, 1.348514, -0.7161267, 1, 1, 1, 1, 1,
0.4442104, -1.85778, 2.547873, 1, 1, 1, 1, 1,
0.444348, -0.6945678, 3.486689, 0, 0, 1, 1, 1,
0.4503609, 0.1562227, 0.174045, 1, 0, 0, 1, 1,
0.4512245, -0.8584827, 3.508639, 1, 0, 0, 1, 1,
0.4521897, -1.809193, 3.442707, 1, 0, 0, 1, 1,
0.4547053, -0.5303637, 1.798573, 1, 0, 0, 1, 1,
0.4597885, 0.6507807, -1.35764, 1, 0, 0, 1, 1,
0.4601242, -1.063636, 4.871797, 0, 0, 0, 1, 1,
0.4621234, -0.1121014, 2.292893, 0, 0, 0, 1, 1,
0.4622333, -1.250145, 2.911419, 0, 0, 0, 1, 1,
0.463433, 1.214638, -0.05632972, 0, 0, 0, 1, 1,
0.4662431, -0.8302748, 1.570957, 0, 0, 0, 1, 1,
0.4702778, -0.1304494, 2.017094, 0, 0, 0, 1, 1,
0.4702846, -0.8527663, 2.600892, 0, 0, 0, 1, 1,
0.4706829, 0.07069188, 1.244181, 1, 1, 1, 1, 1,
0.4709117, 1.03371, 2.76653, 1, 1, 1, 1, 1,
0.4732214, 0.7316915, 0.08184487, 1, 1, 1, 1, 1,
0.4805611, -0.5953987, 3.502639, 1, 1, 1, 1, 1,
0.482778, -1.017063, 3.116781, 1, 1, 1, 1, 1,
0.4922345, -0.03703071, 0.3846186, 1, 1, 1, 1, 1,
0.4975366, 1.104585, -0.7494844, 1, 1, 1, 1, 1,
0.4983369, -0.6717762, 1.789019, 1, 1, 1, 1, 1,
0.4993403, -0.9034148, 3.202544, 1, 1, 1, 1, 1,
0.5003911, 0.02269391, 2.987078, 1, 1, 1, 1, 1,
0.5042311, 0.4458481, 0.113373, 1, 1, 1, 1, 1,
0.5052356, 1.304132, -0.02187055, 1, 1, 1, 1, 1,
0.5097124, 1.268651, 0.8459265, 1, 1, 1, 1, 1,
0.5097458, -0.5470601, 1.034817, 1, 1, 1, 1, 1,
0.5107585, -0.6424112, 2.725447, 1, 1, 1, 1, 1,
0.5121544, -0.02919756, 1.807651, 0, 0, 1, 1, 1,
0.5137616, 0.2267896, 1.204676, 1, 0, 0, 1, 1,
0.5165941, -1.828422, 3.695899, 1, 0, 0, 1, 1,
0.5184488, -0.08732665, 0.5289817, 1, 0, 0, 1, 1,
0.5197787, -0.01653424, 0.9216402, 1, 0, 0, 1, 1,
0.5209038, 0.9888033, -0.7299938, 1, 0, 0, 1, 1,
0.5219666, 0.06791598, 0.7821511, 0, 0, 0, 1, 1,
0.5224137, 1.453784, 0.3063852, 0, 0, 0, 1, 1,
0.5346881, 0.7941055, 1.042185, 0, 0, 0, 1, 1,
0.543584, 2.480249, -3.099677, 0, 0, 0, 1, 1,
0.545816, 0.6605552, 2.006306, 0, 0, 0, 1, 1,
0.547379, -0.2980773, 2.239897, 0, 0, 0, 1, 1,
0.5506122, 1.050484, 0.6434333, 0, 0, 0, 1, 1,
0.550631, 0.6618643, 0.8051144, 1, 1, 1, 1, 1,
0.5561843, 1.593047, 2.040827, 1, 1, 1, 1, 1,
0.5614201, -1.037869, 2.716953, 1, 1, 1, 1, 1,
0.5666647, 0.2182568, 1.900333, 1, 1, 1, 1, 1,
0.5699652, 0.07324412, 1.625523, 1, 1, 1, 1, 1,
0.5701329, -1.008921, 4.217074, 1, 1, 1, 1, 1,
0.5747889, 0.3121485, -0.07362267, 1, 1, 1, 1, 1,
0.5794483, 1.47654, 0.9266145, 1, 1, 1, 1, 1,
0.594173, 0.04308991, 1.893478, 1, 1, 1, 1, 1,
0.5960003, 0.6551108, -1.553452, 1, 1, 1, 1, 1,
0.6080478, 0.6975313, -1.250882, 1, 1, 1, 1, 1,
0.6211684, -0.002226213, 1.381492, 1, 1, 1, 1, 1,
0.6273776, 0.8162937, 0.4815152, 1, 1, 1, 1, 1,
0.6282181, 0.7932766, -0.5644559, 1, 1, 1, 1, 1,
0.628662, -0.2562409, 2.002043, 1, 1, 1, 1, 1,
0.63557, 1.145852, -0.8855426, 0, 0, 1, 1, 1,
0.6367736, 0.5536291, -0.5855494, 1, 0, 0, 1, 1,
0.6393221, -1.129606, 0.9549195, 1, 0, 0, 1, 1,
0.6416071, 2.286786, 1.154998, 1, 0, 0, 1, 1,
0.6427323, 0.08416196, 2.004331, 1, 0, 0, 1, 1,
0.6484663, 1.37878, -0.4094189, 1, 0, 0, 1, 1,
0.6517361, 0.1926702, 0.8981982, 0, 0, 0, 1, 1,
0.6578925, 1.474001, 0.7262879, 0, 0, 0, 1, 1,
0.6615587, -0.4879465, 4.029894, 0, 0, 0, 1, 1,
0.6676605, 1.612491, 0.3672664, 0, 0, 0, 1, 1,
0.6712958, 1.182766, 0.3912344, 0, 0, 0, 1, 1,
0.6730521, -0.1133106, 0.7854022, 0, 0, 0, 1, 1,
0.680491, -0.3164207, 2.202436, 0, 0, 0, 1, 1,
0.6813499, 0.4823878, 0.3302413, 1, 1, 1, 1, 1,
0.6829893, 0.6777639, 0.6794704, 1, 1, 1, 1, 1,
0.6855677, -0.4303068, 2.416615, 1, 1, 1, 1, 1,
0.6872729, 0.08596614, 1.51088, 1, 1, 1, 1, 1,
0.6955145, -0.5251028, 1.293837, 1, 1, 1, 1, 1,
0.6996866, 0.01460822, 0.5696692, 1, 1, 1, 1, 1,
0.7021988, -0.9606369, 2.065362, 1, 1, 1, 1, 1,
0.7038236, -1.013394, 3.949821, 1, 1, 1, 1, 1,
0.7052609, 1.054941, -0.5249755, 1, 1, 1, 1, 1,
0.7119156, -0.5759878, 1.498515, 1, 1, 1, 1, 1,
0.7132617, 0.7573766, -0.9617996, 1, 1, 1, 1, 1,
0.7156092, -0.5547168, 3.75382, 1, 1, 1, 1, 1,
0.7226582, 1.070756, 0.111285, 1, 1, 1, 1, 1,
0.7228109, 0.1235977, 0.07606555, 1, 1, 1, 1, 1,
0.723283, 1.266463, 0.7191554, 1, 1, 1, 1, 1,
0.7237214, -0.9505484, -0.3933388, 0, 0, 1, 1, 1,
0.7255681, -0.1379247, 0.7163327, 1, 0, 0, 1, 1,
0.7280399, 1.332851, 0.6646478, 1, 0, 0, 1, 1,
0.730143, -0.2263262, 1.029274, 1, 0, 0, 1, 1,
0.730213, 0.619813, 0.9501417, 1, 0, 0, 1, 1,
0.7328535, -1.610985, 2.041945, 1, 0, 0, 1, 1,
0.7336875, -0.7451089, 1.660685, 0, 0, 0, 1, 1,
0.7376456, -2.110718, 2.089486, 0, 0, 0, 1, 1,
0.7387229, -1.958982, 2.859836, 0, 0, 0, 1, 1,
0.7488772, -0.4679154, 4.687818, 0, 0, 0, 1, 1,
0.7534904, -0.5139741, 0.9125369, 0, 0, 0, 1, 1,
0.7562506, 0.9319588, 1.237779, 0, 0, 0, 1, 1,
0.7596676, -0.09354084, 1.00264, 0, 0, 0, 1, 1,
0.76435, 1.198787, 0.777382, 1, 1, 1, 1, 1,
0.7644033, -0.6452634, 5.060785, 1, 1, 1, 1, 1,
0.7740173, 1.454894, 0.8614239, 1, 1, 1, 1, 1,
0.7744955, 0.6182448, 0.1518737, 1, 1, 1, 1, 1,
0.7745723, -0.4277005, 0.4326867, 1, 1, 1, 1, 1,
0.775758, 0.2248789, 0.02487703, 1, 1, 1, 1, 1,
0.777644, 0.8035231, -0.7852729, 1, 1, 1, 1, 1,
0.7815447, -1.271681, 2.447466, 1, 1, 1, 1, 1,
0.7822303, -0.0748312, 1.58855, 1, 1, 1, 1, 1,
0.7855992, -0.08636972, 0.9592577, 1, 1, 1, 1, 1,
0.795287, 0.8423156, 0.599646, 1, 1, 1, 1, 1,
0.7989291, -1.610962, 2.88225, 1, 1, 1, 1, 1,
0.8020006, 0.107268, 2.202247, 1, 1, 1, 1, 1,
0.8026409, 1.046114, 1.155579, 1, 1, 1, 1, 1,
0.810599, -1.057912, 2.686923, 1, 1, 1, 1, 1,
0.8112406, 0.02760243, 0.1771414, 0, 0, 1, 1, 1,
0.8208188, 0.3228058, 1.297805, 1, 0, 0, 1, 1,
0.822742, 1.021993, 0.7944542, 1, 0, 0, 1, 1,
0.8271713, 0.9028904, 1.215725, 1, 0, 0, 1, 1,
0.8279144, 1.821001, 1.536308, 1, 0, 0, 1, 1,
0.8303881, 0.2641919, 1.497984, 1, 0, 0, 1, 1,
0.8328786, 1.158358, -0.02403217, 0, 0, 0, 1, 1,
0.8339643, 1.086177, -0.09279404, 0, 0, 0, 1, 1,
0.8431604, 1.83861, 1.054098, 0, 0, 0, 1, 1,
0.8468655, 1.61246, 1.05992, 0, 0, 0, 1, 1,
0.8496482, -1.268963, 2.917774, 0, 0, 0, 1, 1,
0.8508905, 0.5272059, 1.363786, 0, 0, 0, 1, 1,
0.8528899, -0.5168347, 1.572449, 0, 0, 0, 1, 1,
0.8557463, 0.02645059, 1.998152, 1, 1, 1, 1, 1,
0.858141, -0.8912872, 2.546878, 1, 1, 1, 1, 1,
0.8612913, -1.614997, 1.141783, 1, 1, 1, 1, 1,
0.8772297, 1.290433, 2.128485, 1, 1, 1, 1, 1,
0.8855993, 0.7714766, 1.031672, 1, 1, 1, 1, 1,
0.8872191, -1.352929, 1.787211, 1, 1, 1, 1, 1,
0.8874402, 0.04371954, 2.001336, 1, 1, 1, 1, 1,
0.8919072, 1.814199, 0.7540432, 1, 1, 1, 1, 1,
0.8960184, -1.876595, 3.315237, 1, 1, 1, 1, 1,
0.8963889, -0.7345574, 2.417322, 1, 1, 1, 1, 1,
0.8974547, -1.951179, 3.743386, 1, 1, 1, 1, 1,
0.8991147, 0.3486371, 1.007843, 1, 1, 1, 1, 1,
0.8999479, -0.566067, 2.659844, 1, 1, 1, 1, 1,
0.9016507, -0.04247411, 1.725187, 1, 1, 1, 1, 1,
0.9026783, 1.037644, 1.774714, 1, 1, 1, 1, 1,
0.9043694, -2.239151, 2.844646, 0, 0, 1, 1, 1,
0.9072306, -1.179343, 1.481139, 1, 0, 0, 1, 1,
0.9090359, 0.2940416, 0.374136, 1, 0, 0, 1, 1,
0.9121836, -0.2563982, 3.976358, 1, 0, 0, 1, 1,
0.912612, 0.1459849, 0.3898874, 1, 0, 0, 1, 1,
0.916795, 0.926904, -0.05421531, 1, 0, 0, 1, 1,
0.917183, -2.199968, 2.808015, 0, 0, 0, 1, 1,
0.924509, -1.39961, 0.2349263, 0, 0, 0, 1, 1,
0.9332127, -1.552553, 0.5976773, 0, 0, 0, 1, 1,
0.9386368, 1.046814, 0.1986305, 0, 0, 0, 1, 1,
0.9400872, 1.519253, 1.033011, 0, 0, 0, 1, 1,
0.9415376, -0.01225316, 1.708114, 0, 0, 0, 1, 1,
0.9481916, 1.067381, -0.3375261, 0, 0, 0, 1, 1,
0.9673408, -0.9781773, 1.391722, 1, 1, 1, 1, 1,
0.9690245, 0.7288954, 1.194556, 1, 1, 1, 1, 1,
0.9712622, -1.195841, 1.37401, 1, 1, 1, 1, 1,
0.9903134, -2.103803, 2.16358, 1, 1, 1, 1, 1,
0.9931223, -1.122724, 3.129149, 1, 1, 1, 1, 1,
0.994963, -0.7795933, 3.65104, 1, 1, 1, 1, 1,
0.9982139, -0.6351363, 1.910375, 1, 1, 1, 1, 1,
1.013569, 2.043868, -0.3730674, 1, 1, 1, 1, 1,
1.015478, 0.9409615, -0.9916232, 1, 1, 1, 1, 1,
1.024352, 1.195649, -0.3708071, 1, 1, 1, 1, 1,
1.025376, 0.8681444, 2.504655, 1, 1, 1, 1, 1,
1.029537, 0.3032318, 1.534565, 1, 1, 1, 1, 1,
1.054318, -1.876556, 1.983142, 1, 1, 1, 1, 1,
1.055974, 2.878227, -0.5478382, 1, 1, 1, 1, 1,
1.06251, 0.9681235, 1.605261, 1, 1, 1, 1, 1,
1.065546, -0.9813445, 1.661392, 0, 0, 1, 1, 1,
1.073359, -0.3152216, 3.20983, 1, 0, 0, 1, 1,
1.075541, -0.4654486, 1.527364, 1, 0, 0, 1, 1,
1.081561, 1.015359, 0.3251839, 1, 0, 0, 1, 1,
1.081827, -0.6260999, 1.478005, 1, 0, 0, 1, 1,
1.09352, -0.8447433, 1.91654, 1, 0, 0, 1, 1,
1.097516, -0.7513987, 2.205802, 0, 0, 0, 1, 1,
1.099215, -0.9834043, 3.318562, 0, 0, 0, 1, 1,
1.129469, 1.236135, -0.05804286, 0, 0, 0, 1, 1,
1.129711, -1.483834, 1.985781, 0, 0, 0, 1, 1,
1.130849, -1.921082, 4.339427, 0, 0, 0, 1, 1,
1.141162, 1.047422, 0.2425022, 0, 0, 0, 1, 1,
1.154851, -0.5506495, 2.897129, 0, 0, 0, 1, 1,
1.165224, 1.185703, 1.882527, 1, 1, 1, 1, 1,
1.177878, 0.4975534, 1.748143, 1, 1, 1, 1, 1,
1.179338, -0.315126, 2.356205, 1, 1, 1, 1, 1,
1.180903, -0.3970817, 2.635148, 1, 1, 1, 1, 1,
1.184042, 0.363659, 2.117861, 1, 1, 1, 1, 1,
1.188726, -0.636867, 2.738616, 1, 1, 1, 1, 1,
1.20441, -0.7419329, 2.307156, 1, 1, 1, 1, 1,
1.211432, -0.9529276, 3.078549, 1, 1, 1, 1, 1,
1.214273, -0.9967734, 1.611609, 1, 1, 1, 1, 1,
1.218604, -0.1760891, 0.1723313, 1, 1, 1, 1, 1,
1.219469, -0.4766746, 3.595304, 1, 1, 1, 1, 1,
1.238414, -0.384852, 1.891897, 1, 1, 1, 1, 1,
1.241776, 1.477143, 1.973729, 1, 1, 1, 1, 1,
1.244061, -0.5694046, 3.676955, 1, 1, 1, 1, 1,
1.245481, -0.1691168, 0.2784626, 1, 1, 1, 1, 1,
1.251485, -1.115009, 3.245433, 0, 0, 1, 1, 1,
1.258846, 0.4140586, 0.859782, 1, 0, 0, 1, 1,
1.26605, 1.285455, 0.7464119, 1, 0, 0, 1, 1,
1.266168, 0.06787632, -0.1617865, 1, 0, 0, 1, 1,
1.270121, -0.224921, 0.8070818, 1, 0, 0, 1, 1,
1.270482, 0.7840078, 1.969284, 1, 0, 0, 1, 1,
1.270599, 0.158572, 1.135452, 0, 0, 0, 1, 1,
1.271557, 1.201598, 0.7538846, 0, 0, 0, 1, 1,
1.272145, 2.155696, -0.3789912, 0, 0, 0, 1, 1,
1.275429, 0.1472634, 1.58381, 0, 0, 0, 1, 1,
1.292847, 0.1814896, 1.032463, 0, 0, 0, 1, 1,
1.302397, -0.3366504, -0.08508086, 0, 0, 0, 1, 1,
1.307204, 0.2905949, 0.4276281, 0, 0, 0, 1, 1,
1.312066, 0.2498111, 0.4975203, 1, 1, 1, 1, 1,
1.315145, 1.567746, 0.3546458, 1, 1, 1, 1, 1,
1.317613, -0.8074984, 3.480347, 1, 1, 1, 1, 1,
1.317968, -1.258022, 1.343455, 1, 1, 1, 1, 1,
1.32342, 1.272325, 1.897614, 1, 1, 1, 1, 1,
1.326076, -2.150053, 3.631471, 1, 1, 1, 1, 1,
1.339552, -0.07310382, 2.508647, 1, 1, 1, 1, 1,
1.355188, -0.806555, 3.73016, 1, 1, 1, 1, 1,
1.357483, -1.530607, 1.73371, 1, 1, 1, 1, 1,
1.360781, 0.3750714, 0.7571158, 1, 1, 1, 1, 1,
1.365254, 0.8956482, 3.115812, 1, 1, 1, 1, 1,
1.367312, -0.6808267, 1.837819, 1, 1, 1, 1, 1,
1.368332, -1.290844, 1.353881, 1, 1, 1, 1, 1,
1.371662, 0.3364604, 2.839801, 1, 1, 1, 1, 1,
1.381284, 1.024498, -0.01043245, 1, 1, 1, 1, 1,
1.399004, -1.439906, 2.794578, 0, 0, 1, 1, 1,
1.407106, -0.05151347, 1.217257, 1, 0, 0, 1, 1,
1.410975, -0.7489923, 2.822717, 1, 0, 0, 1, 1,
1.412861, -0.1925728, 1.970037, 1, 0, 0, 1, 1,
1.415624, 0.02985698, 2.510217, 1, 0, 0, 1, 1,
1.41855, -0.01307546, 2.509117, 1, 0, 0, 1, 1,
1.419028, -0.241041, 1.181418, 0, 0, 0, 1, 1,
1.421345, -1.31584, 0.2340561, 0, 0, 0, 1, 1,
1.422044, 0.2429701, 2.467672, 0, 0, 0, 1, 1,
1.428161, 0.8244078, 0.9456006, 0, 0, 0, 1, 1,
1.432716, 0.9829611, 2.055518, 0, 0, 0, 1, 1,
1.441648, 1.524793, -0.08244075, 0, 0, 0, 1, 1,
1.448883, -0.4351978, 3.235389, 0, 0, 0, 1, 1,
1.455354, -0.608674, 1.967065, 1, 1, 1, 1, 1,
1.455391, 0.9501641, 0.03399555, 1, 1, 1, 1, 1,
1.455422, 0.11839, 1.73397, 1, 1, 1, 1, 1,
1.47255, -0.01631806, 2.048113, 1, 1, 1, 1, 1,
1.497799, 1.472222, 0.006730079, 1, 1, 1, 1, 1,
1.498597, -0.3894073, 2.592777, 1, 1, 1, 1, 1,
1.500029, -1.18844, 2.87373, 1, 1, 1, 1, 1,
1.510219, -0.7758511, 2.046511, 1, 1, 1, 1, 1,
1.518, -0.1582496, 1.460792, 1, 1, 1, 1, 1,
1.525018, 0.07160497, 2.712847, 1, 1, 1, 1, 1,
1.535804, 0.4809969, 0.4043129, 1, 1, 1, 1, 1,
1.536498, -1.045208, 1.474868, 1, 1, 1, 1, 1,
1.538304, -0.6924787, 1.84124, 1, 1, 1, 1, 1,
1.570718, -0.8309065, 2.769287, 1, 1, 1, 1, 1,
1.573651, -0.2739026, 0.2996034, 1, 1, 1, 1, 1,
1.588623, -1.632699, 1.71394, 0, 0, 1, 1, 1,
1.602501, -0.3606765, 2.858773, 1, 0, 0, 1, 1,
1.613782, 0.3497412, -0.3976644, 1, 0, 0, 1, 1,
1.629893, -2.274056, 2.498567, 1, 0, 0, 1, 1,
1.642779, 1.741555, -0.6231753, 1, 0, 0, 1, 1,
1.66248, -1.539163, 2.403266, 1, 0, 0, 1, 1,
1.709682, 1.352067, 2.334492, 0, 0, 0, 1, 1,
1.725875, 1.683277, 0.02612498, 0, 0, 0, 1, 1,
1.737404, -0.1416183, 1.473987, 0, 0, 0, 1, 1,
1.782086, -1.315028, 1.57379, 0, 0, 0, 1, 1,
1.790636, 1.503721, 1.995043, 0, 0, 0, 1, 1,
1.809099, -1.101817, 1.426391, 0, 0, 0, 1, 1,
1.811722, 1.463686, 1.86363, 0, 0, 0, 1, 1,
1.856102, 1.453674, 1.495178, 1, 1, 1, 1, 1,
1.861583, -0.1466549, 0.9411113, 1, 1, 1, 1, 1,
1.925077, 0.6621367, 1.058615, 1, 1, 1, 1, 1,
1.932866, 0.08109727, 0.6460319, 1, 1, 1, 1, 1,
1.936432, -0.4739638, 2.407416, 1, 1, 1, 1, 1,
1.93785, 0.00523213, 0.841439, 1, 1, 1, 1, 1,
1.939051, -2.025039, 2.822944, 1, 1, 1, 1, 1,
1.95675, -0.05267291, 1.061822, 1, 1, 1, 1, 1,
1.971549, -0.02263809, 1.236991, 1, 1, 1, 1, 1,
1.979266, 0.656839, 2.816185, 1, 1, 1, 1, 1,
1.992545, 1.427799, -0.4121384, 1, 1, 1, 1, 1,
2.009211, -0.4793196, 0.2170068, 1, 1, 1, 1, 1,
2.010672, -0.5209823, 1.502044, 1, 1, 1, 1, 1,
2.072063, -0.6400933, 2.76921, 1, 1, 1, 1, 1,
2.143614, 0.7588875, -0.1780298, 1, 1, 1, 1, 1,
2.160759, -0.28092, 1.617637, 0, 0, 1, 1, 1,
2.172622, -1.169215, 2.249649, 1, 0, 0, 1, 1,
2.186074, 1.167228, -0.4399102, 1, 0, 0, 1, 1,
2.262459, 0.5614353, 0.4221857, 1, 0, 0, 1, 1,
2.287117, 0.3205082, 2.166813, 1, 0, 0, 1, 1,
2.296541, -0.2111903, 2.15393, 1, 0, 0, 1, 1,
2.321692, 2.997389, -0.3222286, 0, 0, 0, 1, 1,
2.36858, 1.797431, 3.145049, 0, 0, 0, 1, 1,
2.381136, 0.5763966, 1.076538, 0, 0, 0, 1, 1,
2.381194, -0.2637083, 1.053614, 0, 0, 0, 1, 1,
2.389455, 0.5743896, 2.720803, 0, 0, 0, 1, 1,
2.423644, 1.14767, 1.043885, 0, 0, 0, 1, 1,
2.473233, 0.02454553, 2.558649, 0, 0, 0, 1, 1,
2.674416, 0.7517447, 0.03802188, 1, 1, 1, 1, 1,
2.683434, -0.5485212, 1.712838, 1, 1, 1, 1, 1,
2.756583, -0.8128611, 2.519421, 1, 1, 1, 1, 1,
2.778368, 0.004340364, 1.685704, 1, 1, 1, 1, 1,
2.786037, 0.1133253, 0.3912581, 1, 1, 1, 1, 1,
2.802942, -0.1034619, 2.090369, 1, 1, 1, 1, 1,
3.136425, -0.02008574, 1.961862, 1, 1, 1, 1, 1
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
var radius = 9.359989;
var distance = 32.87656;
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
mvMatrix.translate( -0.09889853, 0.05879509, -0.3468499 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.87656);
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
