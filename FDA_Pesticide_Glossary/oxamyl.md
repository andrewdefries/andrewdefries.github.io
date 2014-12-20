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
-2.86388, 0.4546112, -2.422214, 1, 0, 0, 1,
-2.85615, -0.8039191, -2.652273, 1, 0.007843138, 0, 1,
-2.72843, -0.7344959, 0.006000025, 1, 0.01176471, 0, 1,
-2.568527, -0.4443309, -0.8823158, 1, 0.01960784, 0, 1,
-2.469224, 0.2394248, -0.5409926, 1, 0.02352941, 0, 1,
-2.441332, -0.8299633, -1.076788, 1, 0.03137255, 0, 1,
-2.422508, -0.3345788, -3.05103, 1, 0.03529412, 0, 1,
-2.394941, -0.8401907, -1.26082, 1, 0.04313726, 0, 1,
-2.37172, -0.3987285, -0.9884749, 1, 0.04705882, 0, 1,
-2.366972, 0.8570087, -1.220719, 1, 0.05490196, 0, 1,
-2.341463, 0.6947939, -0.3930928, 1, 0.05882353, 0, 1,
-2.319808, 0.854817, -1.766409, 1, 0.06666667, 0, 1,
-2.303954, -0.6190857, -2.789725, 1, 0.07058824, 0, 1,
-2.261879, 1.012328, -2.790319, 1, 0.07843138, 0, 1,
-2.21257, -0.6195964, -2.226348, 1, 0.08235294, 0, 1,
-2.209714, 1.416061, 0.2535508, 1, 0.09019608, 0, 1,
-2.193004, 1.252773, -1.26918, 1, 0.09411765, 0, 1,
-2.142529, 0.4367898, -2.674409, 1, 0.1019608, 0, 1,
-2.136941, 0.855051, -1.779597, 1, 0.1098039, 0, 1,
-2.131252, 1.12383, -2.157703, 1, 0.1137255, 0, 1,
-2.112095, -0.6229765, -3.215809, 1, 0.1215686, 0, 1,
-2.11083, -0.7792529, -3.135755, 1, 0.1254902, 0, 1,
-2.102951, -0.550383, -1.237037, 1, 0.1333333, 0, 1,
-2.07743, -1.957877, -2.643293, 1, 0.1372549, 0, 1,
-2.062892, 2.500746, -1.528745, 1, 0.145098, 0, 1,
-2.057082, 0.4297085, -2.34225, 1, 0.1490196, 0, 1,
-2.05414, -0.3710199, -1.645608, 1, 0.1568628, 0, 1,
-2.023011, -0.4914312, -1.807291, 1, 0.1607843, 0, 1,
-2.02158, -2.167533, -3.427843, 1, 0.1686275, 0, 1,
-1.988525, -0.01114367, 0.9737446, 1, 0.172549, 0, 1,
-1.985317, -0.906751, -2.007697, 1, 0.1803922, 0, 1,
-1.975815, 0.0173001, -1.620543, 1, 0.1843137, 0, 1,
-1.971045, -0.7033311, -2.355095, 1, 0.1921569, 0, 1,
-1.949533, -2.235301, -2.168023, 1, 0.1960784, 0, 1,
-1.942152, -1.23021, -2.533611, 1, 0.2039216, 0, 1,
-1.938523, -0.461122, -1.839524, 1, 0.2117647, 0, 1,
-1.919511, -0.3228975, -2.350616, 1, 0.2156863, 0, 1,
-1.893558, 1.386792, -0.6808845, 1, 0.2235294, 0, 1,
-1.882129, -0.06472424, -2.724742, 1, 0.227451, 0, 1,
-1.864438, -0.08339182, -0.9241741, 1, 0.2352941, 0, 1,
-1.851188, 0.1613113, -2.06292, 1, 0.2392157, 0, 1,
-1.836653, -0.865029, -3.946219, 1, 0.2470588, 0, 1,
-1.822458, 0.5442738, -2.038622, 1, 0.2509804, 0, 1,
-1.822234, 1.454838, -0.2116894, 1, 0.2588235, 0, 1,
-1.81955, 0.4341706, -3.188451, 1, 0.2627451, 0, 1,
-1.81702, 1.370994, 0.7701282, 1, 0.2705882, 0, 1,
-1.813069, 0.01611515, -2.610724, 1, 0.2745098, 0, 1,
-1.790608, -0.6078562, -0.7296226, 1, 0.282353, 0, 1,
-1.790407, 1.590077, -0.6000984, 1, 0.2862745, 0, 1,
-1.765039, -0.5671394, -1.665244, 1, 0.2941177, 0, 1,
-1.756558, -0.6067323, -0.8991417, 1, 0.3019608, 0, 1,
-1.751488, 0.8376586, -1.920381, 1, 0.3058824, 0, 1,
-1.74704, -0.7473758, -1.555501, 1, 0.3137255, 0, 1,
-1.744457, -1.268127, -3.740236, 1, 0.3176471, 0, 1,
-1.733591, -1.65289, -1.110306, 1, 0.3254902, 0, 1,
-1.732347, 0.5944945, -0.8525052, 1, 0.3294118, 0, 1,
-1.704464, 1.51, -1.149099, 1, 0.3372549, 0, 1,
-1.696001, 1.601867, -1.98608, 1, 0.3411765, 0, 1,
-1.685381, -1.08639, -3.874432, 1, 0.3490196, 0, 1,
-1.683445, 1.323537, -0.002113559, 1, 0.3529412, 0, 1,
-1.672533, -0.3441687, -0.541923, 1, 0.3607843, 0, 1,
-1.655185, -0.867754, -0.6068274, 1, 0.3647059, 0, 1,
-1.644556, -0.9724203, -1.874667, 1, 0.372549, 0, 1,
-1.609291, 0.5537377, -1.791857, 1, 0.3764706, 0, 1,
-1.58902, 0.9464692, -3.504255, 1, 0.3843137, 0, 1,
-1.575686, -1.093375, -2.956081, 1, 0.3882353, 0, 1,
-1.570985, -0.1612843, -2.134099, 1, 0.3960784, 0, 1,
-1.570577, -0.3697466, -1.997247, 1, 0.4039216, 0, 1,
-1.56455, 0.9798059, -1.704481, 1, 0.4078431, 0, 1,
-1.544137, -0.52511, -2.41829, 1, 0.4156863, 0, 1,
-1.539952, -0.4754408, -1.123279, 1, 0.4196078, 0, 1,
-1.538923, -0.1475577, -1.137828, 1, 0.427451, 0, 1,
-1.538361, -0.572862, -0.9233775, 1, 0.4313726, 0, 1,
-1.537044, 0.1345144, -2.104229, 1, 0.4392157, 0, 1,
-1.534319, 0.8177169, -1.59407, 1, 0.4431373, 0, 1,
-1.523153, 0.638541, -1.088923, 1, 0.4509804, 0, 1,
-1.500292, -0.5283241, -0.7525088, 1, 0.454902, 0, 1,
-1.497316, 0.307214, -2.68925, 1, 0.4627451, 0, 1,
-1.497155, -1.283042, -0.4258802, 1, 0.4666667, 0, 1,
-1.481805, 0.9128761, -2.402951, 1, 0.4745098, 0, 1,
-1.477027, 0.1523365, -0.9781987, 1, 0.4784314, 0, 1,
-1.47661, -0.2577451, -0.4700588, 1, 0.4862745, 0, 1,
-1.47548, -0.8738502, -1.837168, 1, 0.4901961, 0, 1,
-1.473788, 0.602952, -1.39916, 1, 0.4980392, 0, 1,
-1.463244, 0.5118375, -1.850765, 1, 0.5058824, 0, 1,
-1.448085, 0.4000894, -2.815121, 1, 0.509804, 0, 1,
-1.446681, -0.3214834, -1.349649, 1, 0.5176471, 0, 1,
-1.445007, -0.1930791, -0.4339538, 1, 0.5215687, 0, 1,
-1.444203, -0.7867189, -3.406919, 1, 0.5294118, 0, 1,
-1.441161, 0.6159695, -1.326484, 1, 0.5333334, 0, 1,
-1.428296, 0.2598838, -3.172602, 1, 0.5411765, 0, 1,
-1.42504, -0.6981229, -1.142529, 1, 0.5450981, 0, 1,
-1.423196, 0.3352646, -1.22324, 1, 0.5529412, 0, 1,
-1.421721, 1.070303, -0.7642967, 1, 0.5568628, 0, 1,
-1.410515, 0.7362117, 0.6286775, 1, 0.5647059, 0, 1,
-1.401282, 0.9569016, -0.6432454, 1, 0.5686275, 0, 1,
-1.394128, 1.417551, 0.3996355, 1, 0.5764706, 0, 1,
-1.386259, -0.01562972, -1.692683, 1, 0.5803922, 0, 1,
-1.385592, 0.2165455, -1.412352, 1, 0.5882353, 0, 1,
-1.358693, 0.7589866, -0.3386025, 1, 0.5921569, 0, 1,
-1.350476, 0.3013478, -2.155347, 1, 0.6, 0, 1,
-1.341085, 0.2571271, -1.945185, 1, 0.6078432, 0, 1,
-1.339106, 1.58702, -1.777696, 1, 0.6117647, 0, 1,
-1.328396, -0.8524067, -2.866142, 1, 0.6196079, 0, 1,
-1.317836, -0.4115214, -3.578125, 1, 0.6235294, 0, 1,
-1.314683, 0.7634789, 1.049393, 1, 0.6313726, 0, 1,
-1.302105, 0.5239863, -0.9228416, 1, 0.6352941, 0, 1,
-1.301852, -0.3735121, -2.681915, 1, 0.6431373, 0, 1,
-1.293872, -0.3501607, -0.6701998, 1, 0.6470588, 0, 1,
-1.292172, -0.5887166, -1.538711, 1, 0.654902, 0, 1,
-1.287897, -0.1175181, -1.902892, 1, 0.6588235, 0, 1,
-1.283981, -1.514367, -2.747865, 1, 0.6666667, 0, 1,
-1.283334, -1.045105, -1.668518, 1, 0.6705883, 0, 1,
-1.280404, -0.3526118, -2.106989, 1, 0.6784314, 0, 1,
-1.277469, 2.259178, 0.1177025, 1, 0.682353, 0, 1,
-1.277394, 1.068587, 0.06643425, 1, 0.6901961, 0, 1,
-1.253063, -0.3564315, -2.437843, 1, 0.6941177, 0, 1,
-1.251026, -0.1499911, -2.639091, 1, 0.7019608, 0, 1,
-1.247875, 0.2878314, 0.9246721, 1, 0.7098039, 0, 1,
-1.247615, 1.463476, 0.2943188, 1, 0.7137255, 0, 1,
-1.233711, -0.6000484, -0.7099407, 1, 0.7215686, 0, 1,
-1.230164, 0.2281161, -1.273183, 1, 0.7254902, 0, 1,
-1.226254, 0.3701536, -0.9399529, 1, 0.7333333, 0, 1,
-1.219543, 1.206022, 1.414543, 1, 0.7372549, 0, 1,
-1.212256, 1.226449, 0.3582831, 1, 0.7450981, 0, 1,
-1.184643, -0.1447254, -2.620396, 1, 0.7490196, 0, 1,
-1.178394, 1.191886, -1.024211, 1, 0.7568628, 0, 1,
-1.155946, 1.016398, 0.1420034, 1, 0.7607843, 0, 1,
-1.153704, -0.3107379, -2.63499, 1, 0.7686275, 0, 1,
-1.150244, -0.3741409, -1.612989, 1, 0.772549, 0, 1,
-1.145471, -0.1385152, -1.945046, 1, 0.7803922, 0, 1,
-1.143368, 0.522387, 1.302291, 1, 0.7843137, 0, 1,
-1.141086, -1.463392, 0.268501, 1, 0.7921569, 0, 1,
-1.140138, 1.555553, -1.053244, 1, 0.7960784, 0, 1,
-1.136463, -1.080521, -1.988451, 1, 0.8039216, 0, 1,
-1.128072, 0.885438, -0.2217119, 1, 0.8117647, 0, 1,
-1.122998, 0.6144244, -1.242031, 1, 0.8156863, 0, 1,
-1.119636, -0.1924102, -2.393303, 1, 0.8235294, 0, 1,
-1.113988, -0.5269583, -2.513436, 1, 0.827451, 0, 1,
-1.107745, -0.2857881, -1.251655, 1, 0.8352941, 0, 1,
-1.107489, 1.684858, -1.210117, 1, 0.8392157, 0, 1,
-1.100747, -0.6883973, -2.998276, 1, 0.8470588, 0, 1,
-1.099468, -0.6834946, -1.796659, 1, 0.8509804, 0, 1,
-1.095583, -0.0121673, 0.02235406, 1, 0.8588235, 0, 1,
-1.092206, 0.1044426, -1.943636, 1, 0.8627451, 0, 1,
-1.09183, -0.5204992, -2.699957, 1, 0.8705882, 0, 1,
-1.083505, 0.7298906, -1.808959, 1, 0.8745098, 0, 1,
-1.070049, 1.382354, -1.676004, 1, 0.8823529, 0, 1,
-1.063093, 0.6638525, -2.055716, 1, 0.8862745, 0, 1,
-1.05908, -0.278878, -2.753605, 1, 0.8941177, 0, 1,
-1.052896, 0.4157867, -1.220014, 1, 0.8980392, 0, 1,
-1.038849, 0.3041756, -0.3786104, 1, 0.9058824, 0, 1,
-1.03272, -0.888116, -2.640205, 1, 0.9137255, 0, 1,
-1.029509, -0.328603, -2.041835, 1, 0.9176471, 0, 1,
-1.019523, -0.4643309, -1.237529, 1, 0.9254902, 0, 1,
-1.019024, -0.7784072, -1.581118, 1, 0.9294118, 0, 1,
-1.011249, 1.473352, -2.5623, 1, 0.9372549, 0, 1,
-0.9996845, -0.05933906, -0.941555, 1, 0.9411765, 0, 1,
-0.990294, 0.4851474, -1.801517, 1, 0.9490196, 0, 1,
-0.9898204, 0.4987954, -1.870488, 1, 0.9529412, 0, 1,
-0.9783949, -0.04661155, -1.085269, 1, 0.9607843, 0, 1,
-0.9783818, -0.1583468, -1.400536, 1, 0.9647059, 0, 1,
-0.9761289, 0.3784985, -1.244145, 1, 0.972549, 0, 1,
-0.9760084, -2.067521, -4.851242, 1, 0.9764706, 0, 1,
-0.9702195, 0.2291922, 0.4497417, 1, 0.9843137, 0, 1,
-0.9689323, -1.072572, -0.7812484, 1, 0.9882353, 0, 1,
-0.9674038, -0.6221073, -1.705374, 1, 0.9960784, 0, 1,
-0.9655392, -0.420691, -1.444565, 0.9960784, 1, 0, 1,
-0.9578148, -0.6327549, -2.149681, 0.9921569, 1, 0, 1,
-0.9576257, 1.521552, -0.8184826, 0.9843137, 1, 0, 1,
-0.9527609, -1.106286, -1.862478, 0.9803922, 1, 0, 1,
-0.9511319, -0.7725085, -2.50561, 0.972549, 1, 0, 1,
-0.9483464, 1.158693, -1.334738, 0.9686275, 1, 0, 1,
-0.9460251, -1.957462, -1.699642, 0.9607843, 1, 0, 1,
-0.9441972, 1.026412, 0.6789344, 0.9568627, 1, 0, 1,
-0.93513, 0.7401627, 0.2340247, 0.9490196, 1, 0, 1,
-0.9336094, 1.800117, -1.594341, 0.945098, 1, 0, 1,
-0.9295485, 0.2853588, -0.2329848, 0.9372549, 1, 0, 1,
-0.9255458, 0.3867364, -0.8647546, 0.9333333, 1, 0, 1,
-0.9151704, -0.03646862, -0.1190937, 0.9254902, 1, 0, 1,
-0.9149308, 0.1766464, -0.9216004, 0.9215686, 1, 0, 1,
-0.9145439, -1.107085, -2.275687, 0.9137255, 1, 0, 1,
-0.9020734, -0.2725861, -0.9619019, 0.9098039, 1, 0, 1,
-0.8949358, -0.1900911, -1.746846, 0.9019608, 1, 0, 1,
-0.8929831, 0.3590682, -2.394279, 0.8941177, 1, 0, 1,
-0.8852502, -0.3310936, -3.862594, 0.8901961, 1, 0, 1,
-0.8846425, -1.279357, -1.777082, 0.8823529, 1, 0, 1,
-0.8741164, 1.345028, -1.487335, 0.8784314, 1, 0, 1,
-0.8705881, 0.2482298, -1.561494, 0.8705882, 1, 0, 1,
-0.8704949, -0.678584, -2.194299, 0.8666667, 1, 0, 1,
-0.8638052, -0.9718392, -2.622605, 0.8588235, 1, 0, 1,
-0.8615215, 0.6340917, -1.09463, 0.854902, 1, 0, 1,
-0.8605396, 0.977304, 0.7092221, 0.8470588, 1, 0, 1,
-0.8509104, -0.5975516, -1.949833, 0.8431373, 1, 0, 1,
-0.8475502, -1.308544, -2.724342, 0.8352941, 1, 0, 1,
-0.8465298, -0.6632419, -2.285509, 0.8313726, 1, 0, 1,
-0.8463079, -0.07153693, -1.815415, 0.8235294, 1, 0, 1,
-0.8457022, -0.294614, -2.866823, 0.8196079, 1, 0, 1,
-0.840175, -1.065849, -2.174329, 0.8117647, 1, 0, 1,
-0.8400487, 0.1496994, -0.2493318, 0.8078431, 1, 0, 1,
-0.8387495, -0.02450255, -2.502713, 0.8, 1, 0, 1,
-0.8385934, -0.7992213, -3.479641, 0.7921569, 1, 0, 1,
-0.8317049, 0.8464961, -1.873178, 0.7882353, 1, 0, 1,
-0.8307338, 0.45428, 1.742802, 0.7803922, 1, 0, 1,
-0.8277209, 0.1218213, -2.294844, 0.7764706, 1, 0, 1,
-0.8239044, 1.239154, -0.5487698, 0.7686275, 1, 0, 1,
-0.8225153, 0.9043553, 1.018415, 0.7647059, 1, 0, 1,
-0.8209882, -1.707181, -4.149517, 0.7568628, 1, 0, 1,
-0.7907947, 0.3116856, -1.254177, 0.7529412, 1, 0, 1,
-0.7825803, 0.1843856, -0.1184859, 0.7450981, 1, 0, 1,
-0.7787648, 0.4581555, -2.67017, 0.7411765, 1, 0, 1,
-0.7731909, 0.8256128, 1.380239, 0.7333333, 1, 0, 1,
-0.7727248, -0.8899626, -2.292145, 0.7294118, 1, 0, 1,
-0.77194, 0.6536987, -1.400749, 0.7215686, 1, 0, 1,
-0.7708284, -1.190129, -1.51503, 0.7176471, 1, 0, 1,
-0.7637544, -0.1840747, -0.6541358, 0.7098039, 1, 0, 1,
-0.7632729, -1.603339, -2.492516, 0.7058824, 1, 0, 1,
-0.7619582, -0.6320634, -1.299746, 0.6980392, 1, 0, 1,
-0.758099, -1.557173, -0.96874, 0.6901961, 1, 0, 1,
-0.7568848, 0.9006611, -0.1069647, 0.6862745, 1, 0, 1,
-0.7510691, 0.1016975, -2.119355, 0.6784314, 1, 0, 1,
-0.7478556, 1.343904, -1.229689, 0.6745098, 1, 0, 1,
-0.7463247, -0.297775, -1.777677, 0.6666667, 1, 0, 1,
-0.7421154, 1.471524, 0.9614455, 0.6627451, 1, 0, 1,
-0.7405049, 0.174606, 0.3927792, 0.654902, 1, 0, 1,
-0.7357133, -0.6130818, -1.371231, 0.6509804, 1, 0, 1,
-0.7278113, -1.607754, -3.525501, 0.6431373, 1, 0, 1,
-0.7201476, 0.08214702, -0.3146471, 0.6392157, 1, 0, 1,
-0.7196922, 0.9346861, -1.818789, 0.6313726, 1, 0, 1,
-0.719471, -0.6754013, -2.354215, 0.627451, 1, 0, 1,
-0.718559, 0.6508299, -1.154712, 0.6196079, 1, 0, 1,
-0.7162478, 0.7458758, -1.574466, 0.6156863, 1, 0, 1,
-0.713075, 0.984897, -0.7322959, 0.6078432, 1, 0, 1,
-0.7107303, 2.168828, -0.6612918, 0.6039216, 1, 0, 1,
-0.7092058, -0.6907741, -3.443415, 0.5960785, 1, 0, 1,
-0.7069545, 0.7212112, 0.4713089, 0.5882353, 1, 0, 1,
-0.7032459, -1.515457, -2.842395, 0.5843138, 1, 0, 1,
-0.7018785, 0.3721505, 0.1170309, 0.5764706, 1, 0, 1,
-0.6969202, 0.9358926, 0.1675961, 0.572549, 1, 0, 1,
-0.6926322, -1.032116, -1.374769, 0.5647059, 1, 0, 1,
-0.6882038, 0.8208302, -1.824336, 0.5607843, 1, 0, 1,
-0.681103, -0.961353, -2.156916, 0.5529412, 1, 0, 1,
-0.6788902, -0.1167542, -2.578822, 0.5490196, 1, 0, 1,
-0.6739375, 0.3962902, -1.122226, 0.5411765, 1, 0, 1,
-0.6724932, -1.046234, -0.09982086, 0.5372549, 1, 0, 1,
-0.6704299, 0.4469985, 0.8670903, 0.5294118, 1, 0, 1,
-0.6684226, -0.4278565, -2.229388, 0.5254902, 1, 0, 1,
-0.6673321, -0.8159549, -2.72449, 0.5176471, 1, 0, 1,
-0.6638537, -0.8758048, -3.061969, 0.5137255, 1, 0, 1,
-0.6621495, 0.568781, -0.5323354, 0.5058824, 1, 0, 1,
-0.6610746, -0.8588797, -1.174284, 0.5019608, 1, 0, 1,
-0.6600708, -0.03709816, -1.759656, 0.4941176, 1, 0, 1,
-0.6595876, -0.9552104, -2.741419, 0.4862745, 1, 0, 1,
-0.6542355, 0.4137748, -2.759527, 0.4823529, 1, 0, 1,
-0.6538404, -0.8917247, -1.39286, 0.4745098, 1, 0, 1,
-0.6486763, 1.112342, -0.7900071, 0.4705882, 1, 0, 1,
-0.6458719, 0.1481955, -2.131469, 0.4627451, 1, 0, 1,
-0.6427409, 1.33669, -1.558575, 0.4588235, 1, 0, 1,
-0.6418509, 0.883708, -0.2993652, 0.4509804, 1, 0, 1,
-0.6390975, 0.5621035, 0.3300128, 0.4470588, 1, 0, 1,
-0.63748, 0.5803469, -1.50084, 0.4392157, 1, 0, 1,
-0.636131, -1.270004, -1.610575, 0.4352941, 1, 0, 1,
-0.6280178, -0.1459061, -3.24739, 0.427451, 1, 0, 1,
-0.6218674, -0.1028615, -2.736092, 0.4235294, 1, 0, 1,
-0.6207, 0.9793819, -0.3928871, 0.4156863, 1, 0, 1,
-0.6198434, 2.239917, -0.5986497, 0.4117647, 1, 0, 1,
-0.6173517, 0.2671194, -2.554052, 0.4039216, 1, 0, 1,
-0.614812, 0.2159549, 0.2313006, 0.3960784, 1, 0, 1,
-0.6134617, -1.670236, -3.04683, 0.3921569, 1, 0, 1,
-0.6128609, 0.1756386, -2.428051, 0.3843137, 1, 0, 1,
-0.6093886, 1.452034, -1.031198, 0.3803922, 1, 0, 1,
-0.6027797, -1.231213, -4.14211, 0.372549, 1, 0, 1,
-0.6011853, 1.302252, -0.4090711, 0.3686275, 1, 0, 1,
-0.5968497, -3.980656, -1.972716, 0.3607843, 1, 0, 1,
-0.5962202, -0.5480238, -1.434968, 0.3568628, 1, 0, 1,
-0.5957413, 1.427447, -0.04047908, 0.3490196, 1, 0, 1,
-0.5919976, -1.578822, -3.472278, 0.345098, 1, 0, 1,
-0.591651, -2.101447, -2.602564, 0.3372549, 1, 0, 1,
-0.588485, 0.279572, -1.74198, 0.3333333, 1, 0, 1,
-0.5863723, 0.6904173, -1.112375, 0.3254902, 1, 0, 1,
-0.578782, 0.06854983, 0.4503543, 0.3215686, 1, 0, 1,
-0.5699251, 2.939177, -1.180248, 0.3137255, 1, 0, 1,
-0.568675, -0.5727845, -3.083748, 0.3098039, 1, 0, 1,
-0.5671952, -0.15477, -4.067972, 0.3019608, 1, 0, 1,
-0.5619385, -0.3116453, -1.796578, 0.2941177, 1, 0, 1,
-0.5506586, -1.364426, -2.020962, 0.2901961, 1, 0, 1,
-0.5489802, 0.6434985, -2.859265, 0.282353, 1, 0, 1,
-0.5480969, 0.973802, -0.7566394, 0.2784314, 1, 0, 1,
-0.5464318, 0.1164928, 1.740246, 0.2705882, 1, 0, 1,
-0.5404868, -0.4888615, -0.7984821, 0.2666667, 1, 0, 1,
-0.5392689, 1.062321, -0.5916793, 0.2588235, 1, 0, 1,
-0.5377195, -0.2638422, -1.479217, 0.254902, 1, 0, 1,
-0.5360608, -0.05310097, -2.671031, 0.2470588, 1, 0, 1,
-0.5297177, -0.1001861, 0.4279183, 0.2431373, 1, 0, 1,
-0.5282074, -0.2255349, -2.19749, 0.2352941, 1, 0, 1,
-0.5271937, -0.4807544, -2.258626, 0.2313726, 1, 0, 1,
-0.5231255, 1.076379, 0.2462908, 0.2235294, 1, 0, 1,
-0.5225286, 1.326732, -1.040248, 0.2196078, 1, 0, 1,
-0.5181209, 0.4139312, -0.9441081, 0.2117647, 1, 0, 1,
-0.5177012, -0.3236387, -2.983995, 0.2078431, 1, 0, 1,
-0.5166043, -1.003372, -3.232421, 0.2, 1, 0, 1,
-0.5112143, 1.089144, -0.63728, 0.1921569, 1, 0, 1,
-0.5101272, -1.496259, -2.345493, 0.1882353, 1, 0, 1,
-0.5083009, -0.4554839, -3.185575, 0.1803922, 1, 0, 1,
-0.5080358, 0.7529813, -1.890643, 0.1764706, 1, 0, 1,
-0.5080171, -0.4818798, -2.979466, 0.1686275, 1, 0, 1,
-0.5066904, -0.6244765, -3.144342, 0.1647059, 1, 0, 1,
-0.506106, 1.197677, -0.06511044, 0.1568628, 1, 0, 1,
-0.5004867, 0.6153994, -1.479808, 0.1529412, 1, 0, 1,
-0.5000646, -1.207908, -2.12618, 0.145098, 1, 0, 1,
-0.4999983, 0.4189788, 0.02428796, 0.1411765, 1, 0, 1,
-0.4989509, 0.1305605, -1.3905, 0.1333333, 1, 0, 1,
-0.4926904, 1.262118, 1.622543, 0.1294118, 1, 0, 1,
-0.4900633, -1.658872, -2.827749, 0.1215686, 1, 0, 1,
-0.4842409, -0.1429918, -0.9658965, 0.1176471, 1, 0, 1,
-0.4808012, 1.547211, -0.2509273, 0.1098039, 1, 0, 1,
-0.4787753, 0.1153165, -0.3574645, 0.1058824, 1, 0, 1,
-0.4780407, 1.708172, -0.3151017, 0.09803922, 1, 0, 1,
-0.4765563, 0.4280743, -3.77172, 0.09019608, 1, 0, 1,
-0.4757835, -0.01960149, -3.532942, 0.08627451, 1, 0, 1,
-0.4704303, -0.04818111, -0.223116, 0.07843138, 1, 0, 1,
-0.4700709, 0.03292371, -0.9431102, 0.07450981, 1, 0, 1,
-0.4699337, 0.6363922, 0.1271448, 0.06666667, 1, 0, 1,
-0.4685753, -0.4021779, -4.013721, 0.0627451, 1, 0, 1,
-0.4644434, 0.3287253, -1.96817, 0.05490196, 1, 0, 1,
-0.4590278, -1.197784, -3.734654, 0.05098039, 1, 0, 1,
-0.4540732, -0.9269813, -2.538941, 0.04313726, 1, 0, 1,
-0.4492257, 0.6145728, 0.1695124, 0.03921569, 1, 0, 1,
-0.4459447, -0.8403482, -0.9868432, 0.03137255, 1, 0, 1,
-0.4416465, -0.7143707, -1.493826, 0.02745098, 1, 0, 1,
-0.4320239, -1.561059, -2.749461, 0.01960784, 1, 0, 1,
-0.4291833, 0.1543236, -1.784614, 0.01568628, 1, 0, 1,
-0.4277084, -0.4623795, -1.238515, 0.007843138, 1, 0, 1,
-0.4225076, -0.01128879, -1.534153, 0.003921569, 1, 0, 1,
-0.4217159, -0.1275158, -3.249623, 0, 1, 0.003921569, 1,
-0.4169284, 0.687503, 0.69953, 0, 1, 0.01176471, 1,
-0.4139493, 1.29693, 0.4870025, 0, 1, 0.01568628, 1,
-0.4105565, -0.9941605, -1.74862, 0, 1, 0.02352941, 1,
-0.4082647, -1.841786, -2.545699, 0, 1, 0.02745098, 1,
-0.4051972, -0.8930272, -3.544949, 0, 1, 0.03529412, 1,
-0.4004115, 0.2631635, -1.468563, 0, 1, 0.03921569, 1,
-0.398471, -0.675091, -3.649771, 0, 1, 0.04705882, 1,
-0.3962122, 1.065595, -0.6109871, 0, 1, 0.05098039, 1,
-0.395756, -1.251704, -2.798965, 0, 1, 0.05882353, 1,
-0.3949033, -0.3624368, -2.544564, 0, 1, 0.0627451, 1,
-0.394085, -0.1545792, -1.843504, 0, 1, 0.07058824, 1,
-0.3927251, 1.504118, -1.167265, 0, 1, 0.07450981, 1,
-0.3925911, 0.1441009, -0.8091855, 0, 1, 0.08235294, 1,
-0.3903381, 0.2535023, -2.398066, 0, 1, 0.08627451, 1,
-0.3873698, -1.12582, -3.267626, 0, 1, 0.09411765, 1,
-0.3845885, -0.2105255, -3.353126, 0, 1, 0.1019608, 1,
-0.3844618, -0.2685613, -3.072789, 0, 1, 0.1058824, 1,
-0.3824027, 0.5116271, -1.492011, 0, 1, 0.1137255, 1,
-0.3750993, -0.7568785, -3.008898, 0, 1, 0.1176471, 1,
-0.3747038, 1.032941, -1.837943, 0, 1, 0.1254902, 1,
-0.3738418, -0.1994744, -1.986637, 0, 1, 0.1294118, 1,
-0.3736845, 1.614813, -0.7618356, 0, 1, 0.1372549, 1,
-0.3628872, -0.5435547, -2.628265, 0, 1, 0.1411765, 1,
-0.3627101, 0.01852274, -0.7622055, 0, 1, 0.1490196, 1,
-0.3620606, -0.03376396, -1.086781, 0, 1, 0.1529412, 1,
-0.3610025, 1.418104, 0.2857228, 0, 1, 0.1607843, 1,
-0.3608654, 0.5977568, 0.3005265, 0, 1, 0.1647059, 1,
-0.3597371, -1.085149, -2.117025, 0, 1, 0.172549, 1,
-0.3593332, -1.800258, -4.29888, 0, 1, 0.1764706, 1,
-0.353893, -1.406072, -4.19281, 0, 1, 0.1843137, 1,
-0.3525987, 1.95022, -0.466486, 0, 1, 0.1882353, 1,
-0.3479862, 0.3541377, 1.175618, 0, 1, 0.1960784, 1,
-0.3452862, 1.188126, -1.560175, 0, 1, 0.2039216, 1,
-0.3435964, 0.9106122, 0.4238805, 0, 1, 0.2078431, 1,
-0.3427337, 0.4470829, -0.3829544, 0, 1, 0.2156863, 1,
-0.340419, -0.143921, -1.358296, 0, 1, 0.2196078, 1,
-0.3345305, 0.4820748, -0.314648, 0, 1, 0.227451, 1,
-0.3340551, -0.3795494, -3.200295, 0, 1, 0.2313726, 1,
-0.3324792, 0.8358378, -0.3274084, 0, 1, 0.2392157, 1,
-0.330361, -0.7916589, -4.68811, 0, 1, 0.2431373, 1,
-0.32897, -0.9533446, -2.921106, 0, 1, 0.2509804, 1,
-0.3256652, -0.09280603, -0.7758067, 0, 1, 0.254902, 1,
-0.3229297, -0.3306229, -2.080848, 0, 1, 0.2627451, 1,
-0.3225268, -0.2359186, -2.555446, 0, 1, 0.2666667, 1,
-0.3187958, -0.2613832, -1.188496, 0, 1, 0.2745098, 1,
-0.3180518, -0.9146723, -3.53695, 0, 1, 0.2784314, 1,
-0.3123157, -0.08843486, 0.1028664, 0, 1, 0.2862745, 1,
-0.3005955, -1.090078, 0.00844714, 0, 1, 0.2901961, 1,
-0.3004823, -0.2348321, -0.9696388, 0, 1, 0.2980392, 1,
-0.3002196, -1.079347, -2.446605, 0, 1, 0.3058824, 1,
-0.2982701, 1.229862, 0.6092404, 0, 1, 0.3098039, 1,
-0.2925989, 0.5109497, -1.181029, 0, 1, 0.3176471, 1,
-0.2920955, -1.485595, -4.140678, 0, 1, 0.3215686, 1,
-0.2905502, 0.8971264, -0.7317477, 0, 1, 0.3294118, 1,
-0.2883169, 1.266182, 0.2234818, 0, 1, 0.3333333, 1,
-0.2876743, -0.6593867, -2.55233, 0, 1, 0.3411765, 1,
-0.2808591, 1.210301, 0.5136656, 0, 1, 0.345098, 1,
-0.280856, 0.5000112, -0.9912374, 0, 1, 0.3529412, 1,
-0.2759016, -0.3535392, -2.244092, 0, 1, 0.3568628, 1,
-0.2747252, 0.055636, -0.7688232, 0, 1, 0.3647059, 1,
-0.2730768, 1.610719, -3.080342, 0, 1, 0.3686275, 1,
-0.2706167, -0.07435266, 0.04517492, 0, 1, 0.3764706, 1,
-0.2654863, 0.3734372, -0.3160134, 0, 1, 0.3803922, 1,
-0.2645533, 1.920825, -1.363866, 0, 1, 0.3882353, 1,
-0.2632449, 0.7312082, -0.264758, 0, 1, 0.3921569, 1,
-0.2630245, -1.492338, -5.164998, 0, 1, 0.4, 1,
-0.2620484, 1.018489, -1.023828, 0, 1, 0.4078431, 1,
-0.2616742, 0.5225937, -0.6498541, 0, 1, 0.4117647, 1,
-0.2612606, -0.6721699, -3.421178, 0, 1, 0.4196078, 1,
-0.2609229, -0.5442119, -3.603024, 0, 1, 0.4235294, 1,
-0.2574413, -1.924377, -1.900161, 0, 1, 0.4313726, 1,
-0.2560034, 1.908522, 1.546376, 0, 1, 0.4352941, 1,
-0.2554713, -1.868835, -2.62246, 0, 1, 0.4431373, 1,
-0.2501756, 0.7612972, -1.606363, 0, 1, 0.4470588, 1,
-0.2461835, 1.168255, -0.3429652, 0, 1, 0.454902, 1,
-0.2447847, -0.8248981, -3.190011, 0, 1, 0.4588235, 1,
-0.2419166, -1.262423, -2.977919, 0, 1, 0.4666667, 1,
-0.2418548, -0.6209342, -2.915037, 0, 1, 0.4705882, 1,
-0.2410814, -0.508446, -2.391618, 0, 1, 0.4784314, 1,
-0.2408099, -0.1250606, -0.703779, 0, 1, 0.4823529, 1,
-0.2392696, 0.9674201, -0.8645945, 0, 1, 0.4901961, 1,
-0.2241407, 0.02017242, -1.707619, 0, 1, 0.4941176, 1,
-0.2236272, 0.7216592, -3.696383, 0, 1, 0.5019608, 1,
-0.2189648, 2.593419, -0.337667, 0, 1, 0.509804, 1,
-0.2172725, -0.6543478, -3.93105, 0, 1, 0.5137255, 1,
-0.2088691, 0.4916228, -0.7392405, 0, 1, 0.5215687, 1,
-0.2074123, 0.4331776, 0.8415853, 0, 1, 0.5254902, 1,
-0.2060096, -1.039175, -3.292233, 0, 1, 0.5333334, 1,
-0.2036662, -1.771435, -2.773296, 0, 1, 0.5372549, 1,
-0.2020552, -1.892497, -3.75777, 0, 1, 0.5450981, 1,
-0.1978898, -0.5560669, -1.727088, 0, 1, 0.5490196, 1,
-0.1975742, -0.9805428, -0.7867789, 0, 1, 0.5568628, 1,
-0.1932804, -0.8598589, -2.801367, 0, 1, 0.5607843, 1,
-0.1932148, -0.02851676, -2.108561, 0, 1, 0.5686275, 1,
-0.1922871, -2.067474, -2.227489, 0, 1, 0.572549, 1,
-0.1909081, 0.771113, -0.05280162, 0, 1, 0.5803922, 1,
-0.1897887, -0.858827, -1.184359, 0, 1, 0.5843138, 1,
-0.1883448, -2.365471, -2.22277, 0, 1, 0.5921569, 1,
-0.1850348, 0.3266726, 0.6358294, 0, 1, 0.5960785, 1,
-0.1846326, 0.6177257, -0.9290068, 0, 1, 0.6039216, 1,
-0.178144, -1.081177, -2.949003, 0, 1, 0.6117647, 1,
-0.1747695, 0.541096, 0.6772168, 0, 1, 0.6156863, 1,
-0.1734103, 0.7926155, -2.082786, 0, 1, 0.6235294, 1,
-0.1692065, -1.128399, -2.830857, 0, 1, 0.627451, 1,
-0.1590374, 0.06763943, -2.429718, 0, 1, 0.6352941, 1,
-0.1549277, -0.7917947, -3.505602, 0, 1, 0.6392157, 1,
-0.1548675, 1.326235, 2.312874, 0, 1, 0.6470588, 1,
-0.154161, -0.3810952, -1.463839, 0, 1, 0.6509804, 1,
-0.1529159, 0.3811884, 2.370806, 0, 1, 0.6588235, 1,
-0.1527186, -0.07113653, -2.050682, 0, 1, 0.6627451, 1,
-0.1446168, -0.5568694, -3.243996, 0, 1, 0.6705883, 1,
-0.144039, 1.036362, 1.590981, 0, 1, 0.6745098, 1,
-0.1439318, 1.73771, 0.8796808, 0, 1, 0.682353, 1,
-0.1401853, 1.100552, 0.704994, 0, 1, 0.6862745, 1,
-0.1362491, -0.346775, -3.009951, 0, 1, 0.6941177, 1,
-0.1308824, -0.9491125, -3.810902, 0, 1, 0.7019608, 1,
-0.1304258, -1.552284, -4.163964, 0, 1, 0.7058824, 1,
-0.1264846, -0.8559568, -3.953463, 0, 1, 0.7137255, 1,
-0.1262275, -1.722304, -2.790187, 0, 1, 0.7176471, 1,
-0.1241441, 0.2540133, 1.008962, 0, 1, 0.7254902, 1,
-0.1229001, -0.4801688, -3.036092, 0, 1, 0.7294118, 1,
-0.1212221, 0.2025913, -0.5912557, 0, 1, 0.7372549, 1,
-0.1206307, 0.2961499, 0.5263251, 0, 1, 0.7411765, 1,
-0.1182892, 1.818743, -2.159405, 0, 1, 0.7490196, 1,
-0.1155278, -0.4702403, -1.687797, 0, 1, 0.7529412, 1,
-0.1139026, -1.601759, -5.09956, 0, 1, 0.7607843, 1,
-0.1114793, -0.9522294, -2.49245, 0, 1, 0.7647059, 1,
-0.1092226, 0.4450278, 1.389717, 0, 1, 0.772549, 1,
-0.109078, 0.2421769, 1.085546, 0, 1, 0.7764706, 1,
-0.106824, 1.310229, -1.138626, 0, 1, 0.7843137, 1,
-0.1060175, 0.905297, 0.8790045, 0, 1, 0.7882353, 1,
-0.1046321, 0.3764434, -0.01216996, 0, 1, 0.7960784, 1,
-0.09885034, 0.01729524, -2.127754, 0, 1, 0.8039216, 1,
-0.09846954, 0.08972025, -0.01801505, 0, 1, 0.8078431, 1,
-0.09785174, 0.1747067, -0.9059051, 0, 1, 0.8156863, 1,
-0.09590139, 0.06056274, -0.09960632, 0, 1, 0.8196079, 1,
-0.09223308, 0.2795165, 0.6611462, 0, 1, 0.827451, 1,
-0.09138689, 1.115959, 0.3893825, 0, 1, 0.8313726, 1,
-0.09137984, -1.622665, -3.604607, 0, 1, 0.8392157, 1,
-0.08885364, -1.981302, -2.404371, 0, 1, 0.8431373, 1,
-0.08783396, 0.6042556, -0.457099, 0, 1, 0.8509804, 1,
-0.08537629, -0.9119547, -2.092853, 0, 1, 0.854902, 1,
-0.08469094, 1.272076, 1.148237, 0, 1, 0.8627451, 1,
-0.08428149, 0.04708639, -2.459998, 0, 1, 0.8666667, 1,
-0.08379149, -0.8746423, -2.848686, 0, 1, 0.8745098, 1,
-0.08368403, -1.779776, -3.598864, 0, 1, 0.8784314, 1,
-0.07900904, 0.566876, -1.022579, 0, 1, 0.8862745, 1,
-0.07870843, 2.139296, -1.958851, 0, 1, 0.8901961, 1,
-0.07632612, -0.6838594, -4.46284, 0, 1, 0.8980392, 1,
-0.07472315, -0.3786244, -2.814182, 0, 1, 0.9058824, 1,
-0.07196931, 1.074126, -1.055608, 0, 1, 0.9098039, 1,
-0.06959324, 1.076383, -1.198904, 0, 1, 0.9176471, 1,
-0.06780452, 0.5707907, 1.413045, 0, 1, 0.9215686, 1,
-0.05673536, -0.03217141, -2.792264, 0, 1, 0.9294118, 1,
-0.05179894, -1.660869, -2.414269, 0, 1, 0.9333333, 1,
-0.04654766, 1.182717, 2.09884, 0, 1, 0.9411765, 1,
-0.03672967, 1.107614, -0.06325759, 0, 1, 0.945098, 1,
-0.03541759, 1.095215, -2.539226, 0, 1, 0.9529412, 1,
-0.03274009, -0.3640228, -4.139276, 0, 1, 0.9568627, 1,
-0.01912303, -0.6450938, -2.164598, 0, 1, 0.9647059, 1,
-0.01664446, -1.489907, -3.043032, 0, 1, 0.9686275, 1,
-0.01117094, 0.4417392, 0.05219297, 0, 1, 0.9764706, 1,
-0.009008865, 0.9942915, 0.364439, 0, 1, 0.9803922, 1,
-0.007465113, 1.230475, 1.724344, 0, 1, 0.9882353, 1,
-0.006361224, -0.9563626, -3.845176, 0, 1, 0.9921569, 1,
-0.004188403, 0.3751919, 1.043256, 0, 1, 1, 1,
-0.002591014, -1.856154, -3.211967, 0, 0.9921569, 1, 1,
-0.0002446876, 0.1807186, -1.24641, 0, 0.9882353, 1, 1,
0.004423062, 1.416332, 0.809509, 0, 0.9803922, 1, 1,
0.004690503, -0.1733216, 3.09735, 0, 0.9764706, 1, 1,
0.00534405, -0.2987061, 2.86556, 0, 0.9686275, 1, 1,
0.01023623, -1.56092, 1.413879, 0, 0.9647059, 1, 1,
0.01025471, 0.1108791, 0.3151428, 0, 0.9568627, 1, 1,
0.01028432, -1.91186, 2.641321, 0, 0.9529412, 1, 1,
0.01265022, 0.3039247, 1.249475, 0, 0.945098, 1, 1,
0.01564897, -1.261887, 2.494619, 0, 0.9411765, 1, 1,
0.01894474, 0.5586609, 0.5938586, 0, 0.9333333, 1, 1,
0.02263957, 0.4350338, -0.2588914, 0, 0.9294118, 1, 1,
0.02692151, -0.1968832, 3.863427, 0, 0.9215686, 1, 1,
0.03246079, 0.5113717, 0.09964509, 0, 0.9176471, 1, 1,
0.03694473, 0.5638646, -0.1089804, 0, 0.9098039, 1, 1,
0.04170915, 0.7056353, 0.6986282, 0, 0.9058824, 1, 1,
0.04533744, 1.269233, 0.02515974, 0, 0.8980392, 1, 1,
0.04836823, 1.726416, -0.05398885, 0, 0.8901961, 1, 1,
0.05703527, -0.9943398, 1.992107, 0, 0.8862745, 1, 1,
0.06107658, 1.345801, 0.4835107, 0, 0.8784314, 1, 1,
0.0613102, 2.298855, -0.8822785, 0, 0.8745098, 1, 1,
0.06487494, -1.295865, 2.92199, 0, 0.8666667, 1, 1,
0.06616727, 0.05762536, 0.5756373, 0, 0.8627451, 1, 1,
0.07326166, 1.677861, 0.0840567, 0, 0.854902, 1, 1,
0.07392405, 0.06792532, -0.02612136, 0, 0.8509804, 1, 1,
0.0740907, -1.19596, 3.467391, 0, 0.8431373, 1, 1,
0.07895425, -1.200349, 3.46573, 0, 0.8392157, 1, 1,
0.07899656, -1.576057, 4.758278, 0, 0.8313726, 1, 1,
0.08893601, 0.03827142, 1.827504, 0, 0.827451, 1, 1,
0.08918799, 0.9963768, -0.7332429, 0, 0.8196079, 1, 1,
0.0902868, 1.568341, 0.02953822, 0, 0.8156863, 1, 1,
0.09071355, 0.4124676, 2.857472, 0, 0.8078431, 1, 1,
0.09126441, -0.1334098, 3.013645, 0, 0.8039216, 1, 1,
0.09331282, 0.3094167, -0.5207862, 0, 0.7960784, 1, 1,
0.09392409, 0.04756578, 0.8365566, 0, 0.7882353, 1, 1,
0.1013532, 0.7077376, -1.763765, 0, 0.7843137, 1, 1,
0.1017786, 0.7473112, 1.455006, 0, 0.7764706, 1, 1,
0.1049658, -0.01671212, 1.498281, 0, 0.772549, 1, 1,
0.1125162, 2.755338, 0.08431797, 0, 0.7647059, 1, 1,
0.1126568, -1.272212, 3.848912, 0, 0.7607843, 1, 1,
0.1141921, -0.1614586, 2.579744, 0, 0.7529412, 1, 1,
0.114503, -0.6436675, 2.817566, 0, 0.7490196, 1, 1,
0.1154151, -1.689845, 2.857779, 0, 0.7411765, 1, 1,
0.1200496, -0.9467881, 4.589564, 0, 0.7372549, 1, 1,
0.1220434, 0.9403113, 0.7122685, 0, 0.7294118, 1, 1,
0.1222705, -0.06187622, 2.284183, 0, 0.7254902, 1, 1,
0.1226784, 0.7736883, 1.508075, 0, 0.7176471, 1, 1,
0.1249538, 0.4914147, 0.2478119, 0, 0.7137255, 1, 1,
0.1256687, 0.9421811, 0.5558765, 0, 0.7058824, 1, 1,
0.1291997, 0.4463803, 0.6130142, 0, 0.6980392, 1, 1,
0.1408094, 0.8629503, 0.5134451, 0, 0.6941177, 1, 1,
0.1428302, -1.52012, 0.4448959, 0, 0.6862745, 1, 1,
0.144412, -0.1129394, -0.3340347, 0, 0.682353, 1, 1,
0.1475188, 0.9589828, -1.571159, 0, 0.6745098, 1, 1,
0.1530201, -1.693422, 4.917995, 0, 0.6705883, 1, 1,
0.1551321, 0.8883497, 0.08525563, 0, 0.6627451, 1, 1,
0.1565392, 0.9845497, 0.9383826, 0, 0.6588235, 1, 1,
0.1571196, -1.856449, 2.951315, 0, 0.6509804, 1, 1,
0.1591955, -1.561514, 3.431831, 0, 0.6470588, 1, 1,
0.160509, 1.325103, 0.7516209, 0, 0.6392157, 1, 1,
0.1617594, 0.6982301, 0.2828954, 0, 0.6352941, 1, 1,
0.1618307, 1.426326, 0.6454079, 0, 0.627451, 1, 1,
0.1637657, -0.8301481, 2.831099, 0, 0.6235294, 1, 1,
0.165941, -1.119632, 2.833478, 0, 0.6156863, 1, 1,
0.1665502, 1.838143, -1.146086, 0, 0.6117647, 1, 1,
0.167026, 0.3468905, 1.025334, 0, 0.6039216, 1, 1,
0.1747923, 0.8882504, -1.048025, 0, 0.5960785, 1, 1,
0.1766335, 0.437999, 0.002199321, 0, 0.5921569, 1, 1,
0.1772753, 0.5858546, 2.196711, 0, 0.5843138, 1, 1,
0.1778378, 1.205347, 0.6456245, 0, 0.5803922, 1, 1,
0.1810148, 0.715396, -0.1458542, 0, 0.572549, 1, 1,
0.1916912, 1.046252, -1.343516, 0, 0.5686275, 1, 1,
0.1961849, 0.04926516, 1.686911, 0, 0.5607843, 1, 1,
0.1980844, -0.6430692, 3.06027, 0, 0.5568628, 1, 1,
0.1984879, -1.50629, 4.861007, 0, 0.5490196, 1, 1,
0.1994461, -1.052276, 1.25061, 0, 0.5450981, 1, 1,
0.2029594, -0.1556589, 3.127863, 0, 0.5372549, 1, 1,
0.2034811, 1.367222, -0.3756666, 0, 0.5333334, 1, 1,
0.2066248, 0.8838675, 0.0798478, 0, 0.5254902, 1, 1,
0.2122789, 1.115252, -0.4000651, 0, 0.5215687, 1, 1,
0.2143372, 0.9349269, -0.3732772, 0, 0.5137255, 1, 1,
0.2189612, -0.6128964, 2.701835, 0, 0.509804, 1, 1,
0.2257073, -1.054145, 1.325114, 0, 0.5019608, 1, 1,
0.2261172, 1.182293, -1.180537, 0, 0.4941176, 1, 1,
0.2354443, -0.01491665, 1.931453, 0, 0.4901961, 1, 1,
0.2367153, 0.1827449, 2.264526, 0, 0.4823529, 1, 1,
0.238236, -0.6809757, 2.235837, 0, 0.4784314, 1, 1,
0.2388553, -0.02393554, 1.525247, 0, 0.4705882, 1, 1,
0.2411138, -0.07553371, 2.398485, 0, 0.4666667, 1, 1,
0.2452485, -0.09344169, 2.959134, 0, 0.4588235, 1, 1,
0.2486097, 0.2148951, 0.273891, 0, 0.454902, 1, 1,
0.250279, -0.1563333, 0.9743186, 0, 0.4470588, 1, 1,
0.2505123, -0.8798978, 4.93458, 0, 0.4431373, 1, 1,
0.2509073, 0.5497206, 1.277506, 0, 0.4352941, 1, 1,
0.2531744, -0.7624928, 2.744909, 0, 0.4313726, 1, 1,
0.256281, -0.9259613, 2.215482, 0, 0.4235294, 1, 1,
0.2566932, -1.026179, 3.12942, 0, 0.4196078, 1, 1,
0.2610138, -1.589947, 0.5466312, 0, 0.4117647, 1, 1,
0.2682596, 0.8511565, 1.731215, 0, 0.4078431, 1, 1,
0.2716926, -0.2113902, 3.380805, 0, 0.4, 1, 1,
0.2731254, 0.7020534, -0.4661201, 0, 0.3921569, 1, 1,
0.27387, 0.3241881, 0.7654378, 0, 0.3882353, 1, 1,
0.2758846, 0.2080353, 2.028793, 0, 0.3803922, 1, 1,
0.2805111, 0.7249954, -1.176588, 0, 0.3764706, 1, 1,
0.2858754, -0.2031157, 1.346931, 0, 0.3686275, 1, 1,
0.2867, -0.6794084, 2.859085, 0, 0.3647059, 1, 1,
0.290788, 1.727771, 0.0616927, 0, 0.3568628, 1, 1,
0.2943428, 1.486149, 0.8586537, 0, 0.3529412, 1, 1,
0.3041603, 1.441251, 0.424781, 0, 0.345098, 1, 1,
0.304267, 0.5058894, 0.9419928, 0, 0.3411765, 1, 1,
0.3054259, 0.8027959, -0.7282892, 0, 0.3333333, 1, 1,
0.3089779, -0.4295307, 0.8902802, 0, 0.3294118, 1, 1,
0.3134445, -0.7028998, 4.015577, 0, 0.3215686, 1, 1,
0.3148591, 0.2338555, 0.6244294, 0, 0.3176471, 1, 1,
0.3165896, 1.390995, -0.7710233, 0, 0.3098039, 1, 1,
0.3178204, 1.312529, 0.2003825, 0, 0.3058824, 1, 1,
0.3190781, 1.215074, -1.399118, 0, 0.2980392, 1, 1,
0.3218604, 1.054161, -0.4638196, 0, 0.2901961, 1, 1,
0.3249453, 0.4603619, 0.2777044, 0, 0.2862745, 1, 1,
0.325706, 0.23378, 1.732959, 0, 0.2784314, 1, 1,
0.3297124, -1.126258, 1.835908, 0, 0.2745098, 1, 1,
0.3299626, -0.7117121, 3.951931, 0, 0.2666667, 1, 1,
0.3378671, 0.9019006, 0.8467865, 0, 0.2627451, 1, 1,
0.3409933, 0.4195907, 0.6897767, 0, 0.254902, 1, 1,
0.3421631, 0.7663432, 1.577547, 0, 0.2509804, 1, 1,
0.3504346, -2.48819, 1.806993, 0, 0.2431373, 1, 1,
0.3585663, 1.596581, -0.4175803, 0, 0.2392157, 1, 1,
0.3597438, 0.3657611, 0.5212185, 0, 0.2313726, 1, 1,
0.3602232, 1.136177, -0.1251574, 0, 0.227451, 1, 1,
0.3670946, 0.8387818, 1.223846, 0, 0.2196078, 1, 1,
0.3719091, -1.064616, 2.773019, 0, 0.2156863, 1, 1,
0.3726162, -0.433439, 3.41423, 0, 0.2078431, 1, 1,
0.3726366, -0.4600681, 3.971806, 0, 0.2039216, 1, 1,
0.3732929, 0.5816009, 0.6035463, 0, 0.1960784, 1, 1,
0.3776704, -2.169209, 3.225241, 0, 0.1882353, 1, 1,
0.3791426, 1.501236, -0.1698373, 0, 0.1843137, 1, 1,
0.3827839, -0.5266454, 2.967585, 0, 0.1764706, 1, 1,
0.3876885, 0.8032086, 0.9200727, 0, 0.172549, 1, 1,
0.3884062, 1.863127, -0.9128025, 0, 0.1647059, 1, 1,
0.3955351, -1.352294, 4.080745, 0, 0.1607843, 1, 1,
0.3961957, -0.5097803, 1.896899, 0, 0.1529412, 1, 1,
0.4028037, 0.4467728, 1.568529, 0, 0.1490196, 1, 1,
0.4054361, 0.7120517, 1.781044, 0, 0.1411765, 1, 1,
0.4066435, -1.152466, 1.986773, 0, 0.1372549, 1, 1,
0.4111644, 0.8710157, -0.05140193, 0, 0.1294118, 1, 1,
0.4120824, 0.7651342, 0.1841682, 0, 0.1254902, 1, 1,
0.4126056, -0.8974156, 2.703945, 0, 0.1176471, 1, 1,
0.4147474, 1.800384, -1.467213, 0, 0.1137255, 1, 1,
0.4168701, -0.7223547, 3.986428, 0, 0.1058824, 1, 1,
0.4212089, 1.062627, 1.016094, 0, 0.09803922, 1, 1,
0.4220328, 0.453454, 2.364129, 0, 0.09411765, 1, 1,
0.4238932, 0.5265657, 1.062453, 0, 0.08627451, 1, 1,
0.4274668, 1.415014, 2.41852, 0, 0.08235294, 1, 1,
0.4291444, 0.7980765, 0.8123515, 0, 0.07450981, 1, 1,
0.4313474, -0.8090714, 2.075966, 0, 0.07058824, 1, 1,
0.431598, -0.3391465, 3.48913, 0, 0.0627451, 1, 1,
0.4341887, 0.5416358, 2.189423, 0, 0.05882353, 1, 1,
0.4377168, -0.9888813, 1.978434, 0, 0.05098039, 1, 1,
0.4394839, 0.5754015, -1.218931, 0, 0.04705882, 1, 1,
0.4418833, 1.240297, 0.63857, 0, 0.03921569, 1, 1,
0.4453859, 0.6212854, 2.401908, 0, 0.03529412, 1, 1,
0.4479955, 1.078472, 0.8311161, 0, 0.02745098, 1, 1,
0.4506266, 0.8419142, 2.47905, 0, 0.02352941, 1, 1,
0.453575, -0.5528715, 1.902095, 0, 0.01568628, 1, 1,
0.4538316, 2.037219, 0.7597364, 0, 0.01176471, 1, 1,
0.4587882, -0.01687124, 2.896525, 0, 0.003921569, 1, 1,
0.4597929, -0.7739361, 1.787962, 0.003921569, 0, 1, 1,
0.4640754, -1.104823, 3.038286, 0.007843138, 0, 1, 1,
0.4711523, 0.1105066, 1.586998, 0.01568628, 0, 1, 1,
0.4717614, 0.6542243, 2.472889, 0.01960784, 0, 1, 1,
0.4768407, 0.04125256, -0.07217577, 0.02745098, 0, 1, 1,
0.4806642, 0.9030122, 1.542699, 0.03137255, 0, 1, 1,
0.4843211, -1.034008, 3.584758, 0.03921569, 0, 1, 1,
0.4849644, -1.080499, 1.862447, 0.04313726, 0, 1, 1,
0.4872525, 0.859745, -0.3050413, 0.05098039, 0, 1, 1,
0.4941643, -0.4439762, 3.222759, 0.05490196, 0, 1, 1,
0.495939, -0.3069424, 1.511786, 0.0627451, 0, 1, 1,
0.4992267, -0.3839787, 3.835686, 0.06666667, 0, 1, 1,
0.5013215, -1.09616, 3.147214, 0.07450981, 0, 1, 1,
0.5043041, -1.756235, 3.576832, 0.07843138, 0, 1, 1,
0.5081102, -0.2979073, 0.470182, 0.08627451, 0, 1, 1,
0.5116375, -0.9197972, 2.465785, 0.09019608, 0, 1, 1,
0.5120369, -1.583923, 2.996219, 0.09803922, 0, 1, 1,
0.5140972, 0.3839002, -0.3711499, 0.1058824, 0, 1, 1,
0.5159884, -0.1488085, 3.108842, 0.1098039, 0, 1, 1,
0.5308479, -1.699753, 3.684172, 0.1176471, 0, 1, 1,
0.5312615, -1.416312, 2.998788, 0.1215686, 0, 1, 1,
0.5449786, -0.002553242, 1.231131, 0.1294118, 0, 1, 1,
0.5451449, 0.2142828, 1.509995, 0.1333333, 0, 1, 1,
0.5474333, 0.06992759, 4.087099, 0.1411765, 0, 1, 1,
0.5507939, -0.5054212, 1.508215, 0.145098, 0, 1, 1,
0.5532171, -1.294243, 2.897305, 0.1529412, 0, 1, 1,
0.555865, -1.406969, 4.697134, 0.1568628, 0, 1, 1,
0.5586933, -2.6245, 1.889391, 0.1647059, 0, 1, 1,
0.5627614, 0.6252242, 0.9321476, 0.1686275, 0, 1, 1,
0.5686866, 0.8966405, -0.8178226, 0.1764706, 0, 1, 1,
0.5776107, -0.1676914, 1.167798, 0.1803922, 0, 1, 1,
0.5776361, 0.2433694, 0.5332774, 0.1882353, 0, 1, 1,
0.582588, -1.311867, 2.617181, 0.1921569, 0, 1, 1,
0.5847924, 0.4200963, 1.4339, 0.2, 0, 1, 1,
0.5894477, 0.402827, 0.5522012, 0.2078431, 0, 1, 1,
0.5897185, 1.632295, 0.001189506, 0.2117647, 0, 1, 1,
0.59064, -1.077523, 4.481112, 0.2196078, 0, 1, 1,
0.5935371, -0.5335238, 1.546757, 0.2235294, 0, 1, 1,
0.6009076, 0.7869452, 0.1701101, 0.2313726, 0, 1, 1,
0.6051109, -0.820125, 1.864709, 0.2352941, 0, 1, 1,
0.6064761, -2.273952, 1.573204, 0.2431373, 0, 1, 1,
0.6080896, -0.8092693, 4.802598, 0.2470588, 0, 1, 1,
0.6097192, 0.5494733, 0.5282861, 0.254902, 0, 1, 1,
0.6154673, -1.675248, 2.750318, 0.2588235, 0, 1, 1,
0.6158247, 1.618736, -1.042714, 0.2666667, 0, 1, 1,
0.6174321, 0.3228122, 0.3793497, 0.2705882, 0, 1, 1,
0.619137, 0.2228203, 1.102132, 0.2784314, 0, 1, 1,
0.6218568, 0.04595467, 2.729215, 0.282353, 0, 1, 1,
0.6274934, -0.6267458, 4.142914, 0.2901961, 0, 1, 1,
0.6278356, -0.86762, 2.585818, 0.2941177, 0, 1, 1,
0.6311165, -0.8831779, 5.512239, 0.3019608, 0, 1, 1,
0.6330645, -1.273056, 2.32506, 0.3098039, 0, 1, 1,
0.638074, -0.4541856, 2.014762, 0.3137255, 0, 1, 1,
0.6386681, -1.505578, 2.772406, 0.3215686, 0, 1, 1,
0.6417734, 0.7829377, 1.714184, 0.3254902, 0, 1, 1,
0.6436321, -0.5689407, 0.174902, 0.3333333, 0, 1, 1,
0.6455466, 0.9007453, 1.503661, 0.3372549, 0, 1, 1,
0.6458592, 1.030165, -0.3972692, 0.345098, 0, 1, 1,
0.6467486, -0.9711949, 3.196945, 0.3490196, 0, 1, 1,
0.6472962, -0.3409261, 0.9245293, 0.3568628, 0, 1, 1,
0.6474575, -0.6133021, 1.545659, 0.3607843, 0, 1, 1,
0.6491184, -0.7094288, 1.355716, 0.3686275, 0, 1, 1,
0.650254, -0.7926233, 3.09479, 0.372549, 0, 1, 1,
0.6515174, -0.2937101, 2.538485, 0.3803922, 0, 1, 1,
0.6539177, 0.886188, 1.525704, 0.3843137, 0, 1, 1,
0.6651524, -0.8713918, 2.462912, 0.3921569, 0, 1, 1,
0.6654252, 0.580111, 2.016592, 0.3960784, 0, 1, 1,
0.6709726, -0.03536407, 1.946488, 0.4039216, 0, 1, 1,
0.6745775, 0.2548835, -0.2357416, 0.4117647, 0, 1, 1,
0.6780151, 0.3614659, -0.3587811, 0.4156863, 0, 1, 1,
0.6790841, 0.05103713, 2.424622, 0.4235294, 0, 1, 1,
0.6799453, -0.3362443, 0.5802612, 0.427451, 0, 1, 1,
0.6859012, -0.6999082, 2.197601, 0.4352941, 0, 1, 1,
0.6860727, -0.3425437, 2.891338, 0.4392157, 0, 1, 1,
0.6894383, 0.7666332, 0.04809847, 0.4470588, 0, 1, 1,
0.7033594, 0.6657479, 1.461788, 0.4509804, 0, 1, 1,
0.7077302, -0.2022211, 1.388324, 0.4588235, 0, 1, 1,
0.7102844, 1.518638, 0.1558823, 0.4627451, 0, 1, 1,
0.7128831, -1.213007, 1.582875, 0.4705882, 0, 1, 1,
0.7129617, 1.071403, 1.129766, 0.4745098, 0, 1, 1,
0.7146043, 0.6590047, 0.6124952, 0.4823529, 0, 1, 1,
0.7157863, 0.3570746, 1.050419, 0.4862745, 0, 1, 1,
0.7168159, 0.5808456, -0.1006658, 0.4941176, 0, 1, 1,
0.7169433, 0.1356643, 1.521097, 0.5019608, 0, 1, 1,
0.7182539, 0.1930703, 0.6127163, 0.5058824, 0, 1, 1,
0.7239779, 0.4218566, 1.929156, 0.5137255, 0, 1, 1,
0.7246968, 1.278767, 1.915449, 0.5176471, 0, 1, 1,
0.7329929, -0.41441, 1.256686, 0.5254902, 0, 1, 1,
0.7346561, 1.671085, 1.265701, 0.5294118, 0, 1, 1,
0.7364863, -0.9271122, 2.144794, 0.5372549, 0, 1, 1,
0.7404023, 1.471642, 1.203989, 0.5411765, 0, 1, 1,
0.7415407, -2.10142, 1.625813, 0.5490196, 0, 1, 1,
0.7441753, 0.8692256, -0.09516315, 0.5529412, 0, 1, 1,
0.7496238, 0.9087201, 1.930744, 0.5607843, 0, 1, 1,
0.7501939, -1.004328, 2.922522, 0.5647059, 0, 1, 1,
0.7522026, 1.192663, 1.611264, 0.572549, 0, 1, 1,
0.752394, 0.8623047, 1.152418, 0.5764706, 0, 1, 1,
0.755051, -1.978699, 1.011537, 0.5843138, 0, 1, 1,
0.7555225, 0.5905185, 1.394363, 0.5882353, 0, 1, 1,
0.7589365, 0.7642274, 1.304547, 0.5960785, 0, 1, 1,
0.7601531, -0.8244184, 0.8285735, 0.6039216, 0, 1, 1,
0.76183, -1.464768, 2.195508, 0.6078432, 0, 1, 1,
0.7648028, 1.757142, 1.196107, 0.6156863, 0, 1, 1,
0.7656617, -1.246462, 3.894723, 0.6196079, 0, 1, 1,
0.765697, -0.8746302, 1.106232, 0.627451, 0, 1, 1,
0.7695056, -0.8685789, 0.5627461, 0.6313726, 0, 1, 1,
0.7753164, -0.5114904, 1.560904, 0.6392157, 0, 1, 1,
0.7755236, -0.1496941, 1.973285, 0.6431373, 0, 1, 1,
0.7771631, 0.2014607, 2.161909, 0.6509804, 0, 1, 1,
0.7797682, -0.733938, 2.123948, 0.654902, 0, 1, 1,
0.783693, -0.367245, 2.317487, 0.6627451, 0, 1, 1,
0.7841672, 1.228711, 2.368185, 0.6666667, 0, 1, 1,
0.79372, -0.7410748, 2.077729, 0.6745098, 0, 1, 1,
0.8020291, -0.4691723, 3.614046, 0.6784314, 0, 1, 1,
0.8049712, -0.479751, 2.663766, 0.6862745, 0, 1, 1,
0.8052911, -0.1796161, -0.3093867, 0.6901961, 0, 1, 1,
0.8082979, -0.2594723, 2.026351, 0.6980392, 0, 1, 1,
0.8091733, 1.204104, 0.833232, 0.7058824, 0, 1, 1,
0.8097494, 0.0440056, 4.392878, 0.7098039, 0, 1, 1,
0.8219518, -0.9602051, 1.412337, 0.7176471, 0, 1, 1,
0.8234433, 0.6986098, 1.419734, 0.7215686, 0, 1, 1,
0.8248297, 0.8020689, 0.7950715, 0.7294118, 0, 1, 1,
0.8345348, 0.2681921, 0.8503391, 0.7333333, 0, 1, 1,
0.8351448, -1.410084, 2.93503, 0.7411765, 0, 1, 1,
0.8449925, -0.72616, 1.667605, 0.7450981, 0, 1, 1,
0.8478695, -0.7949359, 3.434825, 0.7529412, 0, 1, 1,
0.8480054, -0.4515536, 0.8687378, 0.7568628, 0, 1, 1,
0.849469, -0.09167685, 0.471313, 0.7647059, 0, 1, 1,
0.8523731, -0.9326391, 2.069054, 0.7686275, 0, 1, 1,
0.8526007, 0.9359729, 0.2805347, 0.7764706, 0, 1, 1,
0.858523, 0.8775311, 2.80004, 0.7803922, 0, 1, 1,
0.8621938, 0.3592012, 1.009233, 0.7882353, 0, 1, 1,
0.8648299, 2.020237, 1.057795, 0.7921569, 0, 1, 1,
0.8655061, 0.4761519, 0.2906171, 0.8, 0, 1, 1,
0.8714256, -0.7738116, 2.161179, 0.8078431, 0, 1, 1,
0.8731796, -0.2959617, 2.982265, 0.8117647, 0, 1, 1,
0.883588, 0.5897976, 0.8602898, 0.8196079, 0, 1, 1,
0.8875769, 1.144259, 0.06454275, 0.8235294, 0, 1, 1,
0.8917652, -1.053473, 1.145021, 0.8313726, 0, 1, 1,
0.8941444, -0.3567636, 2.344831, 0.8352941, 0, 1, 1,
0.898357, 0.7485458, 1.397634, 0.8431373, 0, 1, 1,
0.8985563, -1.659, 1.843064, 0.8470588, 0, 1, 1,
0.9003568, -0.9517763, 3.265023, 0.854902, 0, 1, 1,
0.9023486, -1.472971, 1.261048, 0.8588235, 0, 1, 1,
0.9098814, 0.004174368, 1.900856, 0.8666667, 0, 1, 1,
0.9102731, -0.1733059, 2.191056, 0.8705882, 0, 1, 1,
0.9113563, 1.082151, 1.250812, 0.8784314, 0, 1, 1,
0.9177824, 0.4767777, 0.9821478, 0.8823529, 0, 1, 1,
0.9185047, -2.241697, 2.84669, 0.8901961, 0, 1, 1,
0.9207494, 1.501194, 0.4949848, 0.8941177, 0, 1, 1,
0.9216787, 0.4672369, 0.6867287, 0.9019608, 0, 1, 1,
0.924183, 2.881382, 0.5813084, 0.9098039, 0, 1, 1,
0.9276281, -1.804764, 2.112875, 0.9137255, 0, 1, 1,
0.9299387, -0.6684991, 3.402406, 0.9215686, 0, 1, 1,
0.9331163, -1.555585, 1.939414, 0.9254902, 0, 1, 1,
0.9335868, 0.2803137, 2.965899, 0.9333333, 0, 1, 1,
0.9354385, -2.360998, 0.884095, 0.9372549, 0, 1, 1,
0.9365886, 1.240351, -0.8993858, 0.945098, 0, 1, 1,
0.938459, 0.6860232, 1.122442, 0.9490196, 0, 1, 1,
0.9386477, 1.388884, 0.07895211, 0.9568627, 0, 1, 1,
0.9435859, -0.05182985, -1.431963, 0.9607843, 0, 1, 1,
0.950834, 0.4463104, 0.120659, 0.9686275, 0, 1, 1,
0.9545127, 0.4871841, 0.7074903, 0.972549, 0, 1, 1,
0.9580601, -0.4080404, 2.238303, 0.9803922, 0, 1, 1,
0.9630738, -0.7103591, 1.880708, 0.9843137, 0, 1, 1,
0.9713591, 0.4699559, 1.501386, 0.9921569, 0, 1, 1,
0.9722703, 1.557557, -0.5486621, 0.9960784, 0, 1, 1,
0.9735391, 2.096653, 0.202788, 1, 0, 0.9960784, 1,
0.9786872, 0.02826482, 3.553477, 1, 0, 0.9882353, 1,
0.992318, -0.7350857, 1.344104, 1, 0, 0.9843137, 1,
0.9945166, 0.2010849, -1.739179, 1, 0, 0.9764706, 1,
0.9955004, 0.4767544, -0.2327031, 1, 0, 0.972549, 1,
0.9956039, 0.4008501, 1.016391, 1, 0, 0.9647059, 1,
0.99765, 0.8297001, 0.09743, 1, 0, 0.9607843, 1,
0.9983766, -1.843403, 2.13137, 1, 0, 0.9529412, 1,
0.9991851, -0.814389, 1.568342, 1, 0, 0.9490196, 1,
1.000823, 1.074422, 0.2394696, 1, 0, 0.9411765, 1,
1.00256, -1.05628, 3.763566, 1, 0, 0.9372549, 1,
1.004261, 0.4409742, -0.5252854, 1, 0, 0.9294118, 1,
1.004657, 0.7167227, 1.461664, 1, 0, 0.9254902, 1,
1.010245, 0.01845862, -0.7653968, 1, 0, 0.9176471, 1,
1.011498, -0.3448303, 1.568141, 1, 0, 0.9137255, 1,
1.012, 0.5078241, 1.225827, 1, 0, 0.9058824, 1,
1.014277, 1.307676, 1.389668, 1, 0, 0.9019608, 1,
1.018609, 0.3221532, 2.43518, 1, 0, 0.8941177, 1,
1.021243, 0.1724613, 1.073504, 1, 0, 0.8862745, 1,
1.027294, 0.3414124, 3.18531, 1, 0, 0.8823529, 1,
1.028275, 1.537056, 0.49046, 1, 0, 0.8745098, 1,
1.029998, -1.812279, 1.518161, 1, 0, 0.8705882, 1,
1.030034, 1.421495, -0.2942574, 1, 0, 0.8627451, 1,
1.033811, 0.01053032, 1.535336, 1, 0, 0.8588235, 1,
1.041203, 1.107328, 0.9967217, 1, 0, 0.8509804, 1,
1.068824, 1.317744, -0.2843288, 1, 0, 0.8470588, 1,
1.081894, -0.9514472, 3.227917, 1, 0, 0.8392157, 1,
1.083159, 0.9223563, 1.313213, 1, 0, 0.8352941, 1,
1.087567, 1.824728, 2.444583, 1, 0, 0.827451, 1,
1.088062, -0.7894343, 3.166773, 1, 0, 0.8235294, 1,
1.088416, 0.315263, 1.53239, 1, 0, 0.8156863, 1,
1.093626, 1.577008, -0.4874691, 1, 0, 0.8117647, 1,
1.102265, -0.2430787, 0.9508193, 1, 0, 0.8039216, 1,
1.105646, -0.01523544, 0.7085376, 1, 0, 0.7960784, 1,
1.106853, -1.879775, 4.159788, 1, 0, 0.7921569, 1,
1.107626, 0.3542797, 1.03924, 1, 0, 0.7843137, 1,
1.107743, -0.6446726, 2.890758, 1, 0, 0.7803922, 1,
1.109262, 0.5623344, 0.3691735, 1, 0, 0.772549, 1,
1.115762, -1.057216, 0.7185388, 1, 0, 0.7686275, 1,
1.123792, -0.6954711, 3.222089, 1, 0, 0.7607843, 1,
1.124833, -0.2647346, 1.303952, 1, 0, 0.7568628, 1,
1.134659, 0.4197681, 1.569944, 1, 0, 0.7490196, 1,
1.138097, 1.466232, 0.4044288, 1, 0, 0.7450981, 1,
1.140329, -1.040903, 2.293786, 1, 0, 0.7372549, 1,
1.140594, -0.1426466, 2.147079, 1, 0, 0.7333333, 1,
1.141791, 0.721499, -0.367482, 1, 0, 0.7254902, 1,
1.144944, 0.571983, 1.782816, 1, 0, 0.7215686, 1,
1.183065, 0.9904566, 0.7298046, 1, 0, 0.7137255, 1,
1.184258, -0.8179159, 1.451566, 1, 0, 0.7098039, 1,
1.184931, 1.546684, -0.6528942, 1, 0, 0.7019608, 1,
1.18582, 0.4523079, 2.123554, 1, 0, 0.6941177, 1,
1.189992, 0.05933826, 0.7614009, 1, 0, 0.6901961, 1,
1.190107, -0.8502314, 3.16517, 1, 0, 0.682353, 1,
1.192546, -0.5502008, 4.740978, 1, 0, 0.6784314, 1,
1.194463, -0.4811414, 0.8138771, 1, 0, 0.6705883, 1,
1.20475, 2.815671, -1.275156, 1, 0, 0.6666667, 1,
1.208672, -1.601154, 4.743981, 1, 0, 0.6588235, 1,
1.208863, -1.467068, 1.158675, 1, 0, 0.654902, 1,
1.216777, 0.179144, 3.330824, 1, 0, 0.6470588, 1,
1.219253, -2.031861, 1.783683, 1, 0, 0.6431373, 1,
1.219304, -2.752393, 1.691503, 1, 0, 0.6352941, 1,
1.230439, -0.648458, 3.316959, 1, 0, 0.6313726, 1,
1.234485, 0.3928045, 0.8496987, 1, 0, 0.6235294, 1,
1.235958, 1.150456, 1.487027, 1, 0, 0.6196079, 1,
1.239639, 0.3146503, 0.4344167, 1, 0, 0.6117647, 1,
1.240873, 2.085257, -1.357223, 1, 0, 0.6078432, 1,
1.244311, 1.301981, 0.6389409, 1, 0, 0.6, 1,
1.251153, -1.376414, 2.586699, 1, 0, 0.5921569, 1,
1.263129, 0.7616667, 2.619712, 1, 0, 0.5882353, 1,
1.264589, 1.553424, 1.713691, 1, 0, 0.5803922, 1,
1.267018, 0.5037168, 0.2295651, 1, 0, 0.5764706, 1,
1.276488, 0.1394877, 0.3674584, 1, 0, 0.5686275, 1,
1.285185, 0.0002566884, 2.029715, 1, 0, 0.5647059, 1,
1.297453, 0.2815171, 3.433329, 1, 0, 0.5568628, 1,
1.311386, -0.4475613, 2.783265, 1, 0, 0.5529412, 1,
1.319037, 1.144857, -0.2484084, 1, 0, 0.5450981, 1,
1.326273, -1.936355, 3.044725, 1, 0, 0.5411765, 1,
1.343201, -0.8045119, -0.532447, 1, 0, 0.5333334, 1,
1.345335, 0.2654617, 1.523963, 1, 0, 0.5294118, 1,
1.348612, 0.04876276, 1.125263, 1, 0, 0.5215687, 1,
1.370294, 0.4865059, 1.798516, 1, 0, 0.5176471, 1,
1.374692, -0.4479492, 2.74195, 1, 0, 0.509804, 1,
1.377278, -0.9452588, 1.021984, 1, 0, 0.5058824, 1,
1.378101, 1.280491, 1.116662, 1, 0, 0.4980392, 1,
1.386958, -0.5648681, 1.604098, 1, 0, 0.4901961, 1,
1.391498, 0.6522424, 1.683743, 1, 0, 0.4862745, 1,
1.411514, 0.2414925, 1.767593, 1, 0, 0.4784314, 1,
1.415276, 0.5239713, 1.056671, 1, 0, 0.4745098, 1,
1.419777, -0.4343163, 0.3378184, 1, 0, 0.4666667, 1,
1.421985, 1.258456, 0.4248539, 1, 0, 0.4627451, 1,
1.455073, -1.416129, 1.525292, 1, 0, 0.454902, 1,
1.460772, 0.383861, 1.569536, 1, 0, 0.4509804, 1,
1.466992, -0.7055241, 2.700811, 1, 0, 0.4431373, 1,
1.470447, -1.106463, 3.855656, 1, 0, 0.4392157, 1,
1.476469, 1.283422, 1.427331, 1, 0, 0.4313726, 1,
1.479679, 0.9274314, 1.582875, 1, 0, 0.427451, 1,
1.501964, -1.157911, 1.542207, 1, 0, 0.4196078, 1,
1.508658, 0.2143976, 1.062577, 1, 0, 0.4156863, 1,
1.511017, 0.08834359, 0.8508354, 1, 0, 0.4078431, 1,
1.511403, -0.009638743, 3.344162, 1, 0, 0.4039216, 1,
1.520876, -1.945571, 0.1163904, 1, 0, 0.3960784, 1,
1.526607, -0.8921145, 4.513294, 1, 0, 0.3882353, 1,
1.528955, 1.606471, 0.6778699, 1, 0, 0.3843137, 1,
1.530297, -1.51683, 1.770036, 1, 0, 0.3764706, 1,
1.530517, -0.2264481, -0.9395909, 1, 0, 0.372549, 1,
1.534904, 0.4230307, 2.808954, 1, 0, 0.3647059, 1,
1.559456, 0.5125263, 2.183317, 1, 0, 0.3607843, 1,
1.572163, -1.810195, 3.660837, 1, 0, 0.3529412, 1,
1.572422, 1.717651, 0.7213734, 1, 0, 0.3490196, 1,
1.584956, 1.458448, -1.326562, 1, 0, 0.3411765, 1,
1.592427, 0.8029304, 1.342214, 1, 0, 0.3372549, 1,
1.600578, 1.438352, 0.07022001, 1, 0, 0.3294118, 1,
1.600886, -0.9287323, 0.2698637, 1, 0, 0.3254902, 1,
1.606053, 0.410882, 2.060162, 1, 0, 0.3176471, 1,
1.607607, -1.025697, 2.132767, 1, 0, 0.3137255, 1,
1.612153, -0.1724704, 1.040481, 1, 0, 0.3058824, 1,
1.618192, 0.60394, 1.745487, 1, 0, 0.2980392, 1,
1.620214, -2.168089, 2.087968, 1, 0, 0.2941177, 1,
1.631956, 0.7057892, 3.726623, 1, 0, 0.2862745, 1,
1.675367, 0.501435, 2.193722, 1, 0, 0.282353, 1,
1.693058, 0.641252, 2.130123, 1, 0, 0.2745098, 1,
1.696044, 0.04295528, 2.908751, 1, 0, 0.2705882, 1,
1.73415, 1.26129, 0.2857456, 1, 0, 0.2627451, 1,
1.735932, 0.795214, 1.137729, 1, 0, 0.2588235, 1,
1.740268, 0.009195313, 2.843793, 1, 0, 0.2509804, 1,
1.748214, -0.9664754, 2.227069, 1, 0, 0.2470588, 1,
1.764291, -0.1619116, 0.290747, 1, 0, 0.2392157, 1,
1.777226, 0.3981098, 0.5247045, 1, 0, 0.2352941, 1,
1.792255, 0.1101786, 1.620585, 1, 0, 0.227451, 1,
1.797559, -2.535992, 2.450244, 1, 0, 0.2235294, 1,
1.80456, 1.097019, 1.733916, 1, 0, 0.2156863, 1,
1.806383, -0.1363943, 0.2157949, 1, 0, 0.2117647, 1,
1.824427, 0.238048, 3.576754, 1, 0, 0.2039216, 1,
1.849742, 0.5098292, 0.366338, 1, 0, 0.1960784, 1,
1.85594, -0.451156, 3.011178, 1, 0, 0.1921569, 1,
1.874292, -0.7284629, 3.339246, 1, 0, 0.1843137, 1,
1.878078, -1.682359, 1.793512, 1, 0, 0.1803922, 1,
1.896697, 1.7777, 0.165865, 1, 0, 0.172549, 1,
1.900227, 0.9328846, 0.9768862, 1, 0, 0.1686275, 1,
1.963107, -1.686955, 1.247534, 1, 0, 0.1607843, 1,
1.970036, -0.02436365, 1.713351, 1, 0, 0.1568628, 1,
1.977975, -0.7261114, 2.434812, 1, 0, 0.1490196, 1,
2.01809, -0.4679434, 1.076953, 1, 0, 0.145098, 1,
2.019166, 0.113882, 0.9476489, 1, 0, 0.1372549, 1,
2.022408, 0.7980692, 1.918888, 1, 0, 0.1333333, 1,
2.072636, -0.2628728, 2.704322, 1, 0, 0.1254902, 1,
2.110755, -0.3434547, 2.843793, 1, 0, 0.1215686, 1,
2.115444, 0.1658707, 1.820499, 1, 0, 0.1137255, 1,
2.132264, 0.8139074, 1.063948, 1, 0, 0.1098039, 1,
2.176304, 0.8300031, 0.1631075, 1, 0, 0.1019608, 1,
2.195472, -0.4857893, 1.498434, 1, 0, 0.09411765, 1,
2.199663, 0.1365172, 1.943615, 1, 0, 0.09019608, 1,
2.231721, 1.250574, 2.182725, 1, 0, 0.08235294, 1,
2.30626, -0.2292991, 0.8685674, 1, 0, 0.07843138, 1,
2.312626, 0.02407787, 2.00926, 1, 0, 0.07058824, 1,
2.317773, -0.01081751, 1.134349, 1, 0, 0.06666667, 1,
2.331069, 1.601841, 0.5755137, 1, 0, 0.05882353, 1,
2.335974, 0.08970563, -0.1569316, 1, 0, 0.05490196, 1,
2.363843, 0.3639376, 0.9596282, 1, 0, 0.04705882, 1,
2.364523, 0.7822788, 1.777184, 1, 0, 0.04313726, 1,
2.391646, 1.025879, 1.652887, 1, 0, 0.03529412, 1,
2.39581, 0.3855726, 0.1928842, 1, 0, 0.03137255, 1,
2.413694, 1.992512, 0.5625353, 1, 0, 0.02352941, 1,
2.778059, 0.1153915, 0.7705515, 1, 0, 0.01960784, 1,
2.834574, 1.571682, 1.083622, 1, 0, 0.01176471, 1,
3.414596, -0.5312994, 0.5212329, 1, 0, 0.007843138, 1
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
0.2753581, -5.153567, -6.974789, 0, -0.5, 0.5, 0.5,
0.2753581, -5.153567, -6.974789, 1, -0.5, 0.5, 0.5,
0.2753581, -5.153567, -6.974789, 1, 1.5, 0.5, 0.5,
0.2753581, -5.153567, -6.974789, 0, 1.5, 0.5, 0.5
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
-3.928082, -0.5207394, -6.974789, 0, -0.5, 0.5, 0.5,
-3.928082, -0.5207394, -6.974789, 1, -0.5, 0.5, 0.5,
-3.928082, -0.5207394, -6.974789, 1, 1.5, 0.5, 0.5,
-3.928082, -0.5207394, -6.974789, 0, 1.5, 0.5, 0.5
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
-3.928082, -5.153567, 0.1736205, 0, -0.5, 0.5, 0.5,
-3.928082, -5.153567, 0.1736205, 1, -0.5, 0.5, 0.5,
-3.928082, -5.153567, 0.1736205, 1, 1.5, 0.5, 0.5,
-3.928082, -5.153567, 0.1736205, 0, 1.5, 0.5, 0.5
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
-2, -4.084453, -5.325156,
3, -4.084453, -5.325156,
-2, -4.084453, -5.325156,
-2, -4.262639, -5.600095,
-1, -4.084453, -5.325156,
-1, -4.262639, -5.600095,
0, -4.084453, -5.325156,
0, -4.262639, -5.600095,
1, -4.084453, -5.325156,
1, -4.262639, -5.600095,
2, -4.084453, -5.325156,
2, -4.262639, -5.600095,
3, -4.084453, -5.325156,
3, -4.262639, -5.600095
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
-2, -4.61901, -6.149972, 0, -0.5, 0.5, 0.5,
-2, -4.61901, -6.149972, 1, -0.5, 0.5, 0.5,
-2, -4.61901, -6.149972, 1, 1.5, 0.5, 0.5,
-2, -4.61901, -6.149972, 0, 1.5, 0.5, 0.5,
-1, -4.61901, -6.149972, 0, -0.5, 0.5, 0.5,
-1, -4.61901, -6.149972, 1, -0.5, 0.5, 0.5,
-1, -4.61901, -6.149972, 1, 1.5, 0.5, 0.5,
-1, -4.61901, -6.149972, 0, 1.5, 0.5, 0.5,
0, -4.61901, -6.149972, 0, -0.5, 0.5, 0.5,
0, -4.61901, -6.149972, 1, -0.5, 0.5, 0.5,
0, -4.61901, -6.149972, 1, 1.5, 0.5, 0.5,
0, -4.61901, -6.149972, 0, 1.5, 0.5, 0.5,
1, -4.61901, -6.149972, 0, -0.5, 0.5, 0.5,
1, -4.61901, -6.149972, 1, -0.5, 0.5, 0.5,
1, -4.61901, -6.149972, 1, 1.5, 0.5, 0.5,
1, -4.61901, -6.149972, 0, 1.5, 0.5, 0.5,
2, -4.61901, -6.149972, 0, -0.5, 0.5, 0.5,
2, -4.61901, -6.149972, 1, -0.5, 0.5, 0.5,
2, -4.61901, -6.149972, 1, 1.5, 0.5, 0.5,
2, -4.61901, -6.149972, 0, 1.5, 0.5, 0.5,
3, -4.61901, -6.149972, 0, -0.5, 0.5, 0.5,
3, -4.61901, -6.149972, 1, -0.5, 0.5, 0.5,
3, -4.61901, -6.149972, 1, 1.5, 0.5, 0.5,
3, -4.61901, -6.149972, 0, 1.5, 0.5, 0.5
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
-2.958057, -3, -5.325156,
-2.958057, 2, -5.325156,
-2.958057, -3, -5.325156,
-3.119728, -3, -5.600095,
-2.958057, -2, -5.325156,
-3.119728, -2, -5.600095,
-2.958057, -1, -5.325156,
-3.119728, -1, -5.600095,
-2.958057, 0, -5.325156,
-3.119728, 0, -5.600095,
-2.958057, 1, -5.325156,
-3.119728, 1, -5.600095,
-2.958057, 2, -5.325156,
-3.119728, 2, -5.600095
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
-3.443069, -3, -6.149972, 0, -0.5, 0.5, 0.5,
-3.443069, -3, -6.149972, 1, -0.5, 0.5, 0.5,
-3.443069, -3, -6.149972, 1, 1.5, 0.5, 0.5,
-3.443069, -3, -6.149972, 0, 1.5, 0.5, 0.5,
-3.443069, -2, -6.149972, 0, -0.5, 0.5, 0.5,
-3.443069, -2, -6.149972, 1, -0.5, 0.5, 0.5,
-3.443069, -2, -6.149972, 1, 1.5, 0.5, 0.5,
-3.443069, -2, -6.149972, 0, 1.5, 0.5, 0.5,
-3.443069, -1, -6.149972, 0, -0.5, 0.5, 0.5,
-3.443069, -1, -6.149972, 1, -0.5, 0.5, 0.5,
-3.443069, -1, -6.149972, 1, 1.5, 0.5, 0.5,
-3.443069, -1, -6.149972, 0, 1.5, 0.5, 0.5,
-3.443069, 0, -6.149972, 0, -0.5, 0.5, 0.5,
-3.443069, 0, -6.149972, 1, -0.5, 0.5, 0.5,
-3.443069, 0, -6.149972, 1, 1.5, 0.5, 0.5,
-3.443069, 0, -6.149972, 0, 1.5, 0.5, 0.5,
-3.443069, 1, -6.149972, 0, -0.5, 0.5, 0.5,
-3.443069, 1, -6.149972, 1, -0.5, 0.5, 0.5,
-3.443069, 1, -6.149972, 1, 1.5, 0.5, 0.5,
-3.443069, 1, -6.149972, 0, 1.5, 0.5, 0.5,
-3.443069, 2, -6.149972, 0, -0.5, 0.5, 0.5,
-3.443069, 2, -6.149972, 1, -0.5, 0.5, 0.5,
-3.443069, 2, -6.149972, 1, 1.5, 0.5, 0.5,
-3.443069, 2, -6.149972, 0, 1.5, 0.5, 0.5
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
-2.958057, -4.084453, -4,
-2.958057, -4.084453, 4,
-2.958057, -4.084453, -4,
-3.119728, -4.262639, -4,
-2.958057, -4.084453, -2,
-3.119728, -4.262639, -2,
-2.958057, -4.084453, 0,
-3.119728, -4.262639, 0,
-2.958057, -4.084453, 2,
-3.119728, -4.262639, 2,
-2.958057, -4.084453, 4,
-3.119728, -4.262639, 4
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
-3.443069, -4.61901, -4, 0, -0.5, 0.5, 0.5,
-3.443069, -4.61901, -4, 1, -0.5, 0.5, 0.5,
-3.443069, -4.61901, -4, 1, 1.5, 0.5, 0.5,
-3.443069, -4.61901, -4, 0, 1.5, 0.5, 0.5,
-3.443069, -4.61901, -2, 0, -0.5, 0.5, 0.5,
-3.443069, -4.61901, -2, 1, -0.5, 0.5, 0.5,
-3.443069, -4.61901, -2, 1, 1.5, 0.5, 0.5,
-3.443069, -4.61901, -2, 0, 1.5, 0.5, 0.5,
-3.443069, -4.61901, 0, 0, -0.5, 0.5, 0.5,
-3.443069, -4.61901, 0, 1, -0.5, 0.5, 0.5,
-3.443069, -4.61901, 0, 1, 1.5, 0.5, 0.5,
-3.443069, -4.61901, 0, 0, 1.5, 0.5, 0.5,
-3.443069, -4.61901, 2, 0, -0.5, 0.5, 0.5,
-3.443069, -4.61901, 2, 1, -0.5, 0.5, 0.5,
-3.443069, -4.61901, 2, 1, 1.5, 0.5, 0.5,
-3.443069, -4.61901, 2, 0, 1.5, 0.5, 0.5,
-3.443069, -4.61901, 4, 0, -0.5, 0.5, 0.5,
-3.443069, -4.61901, 4, 1, -0.5, 0.5, 0.5,
-3.443069, -4.61901, 4, 1, 1.5, 0.5, 0.5,
-3.443069, -4.61901, 4, 0, 1.5, 0.5, 0.5
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
-2.958057, -4.084453, -5.325156,
-2.958057, 3.042974, -5.325156,
-2.958057, -4.084453, 5.672397,
-2.958057, 3.042974, 5.672397,
-2.958057, -4.084453, -5.325156,
-2.958057, -4.084453, 5.672397,
-2.958057, 3.042974, -5.325156,
-2.958057, 3.042974, 5.672397,
-2.958057, -4.084453, -5.325156,
3.508773, -4.084453, -5.325156,
-2.958057, -4.084453, 5.672397,
3.508773, -4.084453, 5.672397,
-2.958057, 3.042974, -5.325156,
3.508773, 3.042974, -5.325156,
-2.958057, 3.042974, 5.672397,
3.508773, 3.042974, 5.672397,
3.508773, -4.084453, -5.325156,
3.508773, 3.042974, -5.325156,
3.508773, -4.084453, 5.672397,
3.508773, 3.042974, 5.672397,
3.508773, -4.084453, -5.325156,
3.508773, -4.084453, 5.672397,
3.508773, 3.042974, -5.325156,
3.508773, 3.042974, 5.672397
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
var radius = 7.803543;
var distance = 34.71885;
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
mvMatrix.translate( -0.2753581, 0.5207394, -0.1736205 );
mvMatrix.scale( 1.304711, 1.183785, 0.7672019 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.71885);
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
oxamyl<-read.table("oxamyl.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-oxamyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'oxamyl' not found
```

```r
y<-oxamyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'oxamyl' not found
```

```r
z<-oxamyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'oxamyl' not found
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
-2.86388, 0.4546112, -2.422214, 0, 0, 1, 1, 1,
-2.85615, -0.8039191, -2.652273, 1, 0, 0, 1, 1,
-2.72843, -0.7344959, 0.006000025, 1, 0, 0, 1, 1,
-2.568527, -0.4443309, -0.8823158, 1, 0, 0, 1, 1,
-2.469224, 0.2394248, -0.5409926, 1, 0, 0, 1, 1,
-2.441332, -0.8299633, -1.076788, 1, 0, 0, 1, 1,
-2.422508, -0.3345788, -3.05103, 0, 0, 0, 1, 1,
-2.394941, -0.8401907, -1.26082, 0, 0, 0, 1, 1,
-2.37172, -0.3987285, -0.9884749, 0, 0, 0, 1, 1,
-2.366972, 0.8570087, -1.220719, 0, 0, 0, 1, 1,
-2.341463, 0.6947939, -0.3930928, 0, 0, 0, 1, 1,
-2.319808, 0.854817, -1.766409, 0, 0, 0, 1, 1,
-2.303954, -0.6190857, -2.789725, 0, 0, 0, 1, 1,
-2.261879, 1.012328, -2.790319, 1, 1, 1, 1, 1,
-2.21257, -0.6195964, -2.226348, 1, 1, 1, 1, 1,
-2.209714, 1.416061, 0.2535508, 1, 1, 1, 1, 1,
-2.193004, 1.252773, -1.26918, 1, 1, 1, 1, 1,
-2.142529, 0.4367898, -2.674409, 1, 1, 1, 1, 1,
-2.136941, 0.855051, -1.779597, 1, 1, 1, 1, 1,
-2.131252, 1.12383, -2.157703, 1, 1, 1, 1, 1,
-2.112095, -0.6229765, -3.215809, 1, 1, 1, 1, 1,
-2.11083, -0.7792529, -3.135755, 1, 1, 1, 1, 1,
-2.102951, -0.550383, -1.237037, 1, 1, 1, 1, 1,
-2.07743, -1.957877, -2.643293, 1, 1, 1, 1, 1,
-2.062892, 2.500746, -1.528745, 1, 1, 1, 1, 1,
-2.057082, 0.4297085, -2.34225, 1, 1, 1, 1, 1,
-2.05414, -0.3710199, -1.645608, 1, 1, 1, 1, 1,
-2.023011, -0.4914312, -1.807291, 1, 1, 1, 1, 1,
-2.02158, -2.167533, -3.427843, 0, 0, 1, 1, 1,
-1.988525, -0.01114367, 0.9737446, 1, 0, 0, 1, 1,
-1.985317, -0.906751, -2.007697, 1, 0, 0, 1, 1,
-1.975815, 0.0173001, -1.620543, 1, 0, 0, 1, 1,
-1.971045, -0.7033311, -2.355095, 1, 0, 0, 1, 1,
-1.949533, -2.235301, -2.168023, 1, 0, 0, 1, 1,
-1.942152, -1.23021, -2.533611, 0, 0, 0, 1, 1,
-1.938523, -0.461122, -1.839524, 0, 0, 0, 1, 1,
-1.919511, -0.3228975, -2.350616, 0, 0, 0, 1, 1,
-1.893558, 1.386792, -0.6808845, 0, 0, 0, 1, 1,
-1.882129, -0.06472424, -2.724742, 0, 0, 0, 1, 1,
-1.864438, -0.08339182, -0.9241741, 0, 0, 0, 1, 1,
-1.851188, 0.1613113, -2.06292, 0, 0, 0, 1, 1,
-1.836653, -0.865029, -3.946219, 1, 1, 1, 1, 1,
-1.822458, 0.5442738, -2.038622, 1, 1, 1, 1, 1,
-1.822234, 1.454838, -0.2116894, 1, 1, 1, 1, 1,
-1.81955, 0.4341706, -3.188451, 1, 1, 1, 1, 1,
-1.81702, 1.370994, 0.7701282, 1, 1, 1, 1, 1,
-1.813069, 0.01611515, -2.610724, 1, 1, 1, 1, 1,
-1.790608, -0.6078562, -0.7296226, 1, 1, 1, 1, 1,
-1.790407, 1.590077, -0.6000984, 1, 1, 1, 1, 1,
-1.765039, -0.5671394, -1.665244, 1, 1, 1, 1, 1,
-1.756558, -0.6067323, -0.8991417, 1, 1, 1, 1, 1,
-1.751488, 0.8376586, -1.920381, 1, 1, 1, 1, 1,
-1.74704, -0.7473758, -1.555501, 1, 1, 1, 1, 1,
-1.744457, -1.268127, -3.740236, 1, 1, 1, 1, 1,
-1.733591, -1.65289, -1.110306, 1, 1, 1, 1, 1,
-1.732347, 0.5944945, -0.8525052, 1, 1, 1, 1, 1,
-1.704464, 1.51, -1.149099, 0, 0, 1, 1, 1,
-1.696001, 1.601867, -1.98608, 1, 0, 0, 1, 1,
-1.685381, -1.08639, -3.874432, 1, 0, 0, 1, 1,
-1.683445, 1.323537, -0.002113559, 1, 0, 0, 1, 1,
-1.672533, -0.3441687, -0.541923, 1, 0, 0, 1, 1,
-1.655185, -0.867754, -0.6068274, 1, 0, 0, 1, 1,
-1.644556, -0.9724203, -1.874667, 0, 0, 0, 1, 1,
-1.609291, 0.5537377, -1.791857, 0, 0, 0, 1, 1,
-1.58902, 0.9464692, -3.504255, 0, 0, 0, 1, 1,
-1.575686, -1.093375, -2.956081, 0, 0, 0, 1, 1,
-1.570985, -0.1612843, -2.134099, 0, 0, 0, 1, 1,
-1.570577, -0.3697466, -1.997247, 0, 0, 0, 1, 1,
-1.56455, 0.9798059, -1.704481, 0, 0, 0, 1, 1,
-1.544137, -0.52511, -2.41829, 1, 1, 1, 1, 1,
-1.539952, -0.4754408, -1.123279, 1, 1, 1, 1, 1,
-1.538923, -0.1475577, -1.137828, 1, 1, 1, 1, 1,
-1.538361, -0.572862, -0.9233775, 1, 1, 1, 1, 1,
-1.537044, 0.1345144, -2.104229, 1, 1, 1, 1, 1,
-1.534319, 0.8177169, -1.59407, 1, 1, 1, 1, 1,
-1.523153, 0.638541, -1.088923, 1, 1, 1, 1, 1,
-1.500292, -0.5283241, -0.7525088, 1, 1, 1, 1, 1,
-1.497316, 0.307214, -2.68925, 1, 1, 1, 1, 1,
-1.497155, -1.283042, -0.4258802, 1, 1, 1, 1, 1,
-1.481805, 0.9128761, -2.402951, 1, 1, 1, 1, 1,
-1.477027, 0.1523365, -0.9781987, 1, 1, 1, 1, 1,
-1.47661, -0.2577451, -0.4700588, 1, 1, 1, 1, 1,
-1.47548, -0.8738502, -1.837168, 1, 1, 1, 1, 1,
-1.473788, 0.602952, -1.39916, 1, 1, 1, 1, 1,
-1.463244, 0.5118375, -1.850765, 0, 0, 1, 1, 1,
-1.448085, 0.4000894, -2.815121, 1, 0, 0, 1, 1,
-1.446681, -0.3214834, -1.349649, 1, 0, 0, 1, 1,
-1.445007, -0.1930791, -0.4339538, 1, 0, 0, 1, 1,
-1.444203, -0.7867189, -3.406919, 1, 0, 0, 1, 1,
-1.441161, 0.6159695, -1.326484, 1, 0, 0, 1, 1,
-1.428296, 0.2598838, -3.172602, 0, 0, 0, 1, 1,
-1.42504, -0.6981229, -1.142529, 0, 0, 0, 1, 1,
-1.423196, 0.3352646, -1.22324, 0, 0, 0, 1, 1,
-1.421721, 1.070303, -0.7642967, 0, 0, 0, 1, 1,
-1.410515, 0.7362117, 0.6286775, 0, 0, 0, 1, 1,
-1.401282, 0.9569016, -0.6432454, 0, 0, 0, 1, 1,
-1.394128, 1.417551, 0.3996355, 0, 0, 0, 1, 1,
-1.386259, -0.01562972, -1.692683, 1, 1, 1, 1, 1,
-1.385592, 0.2165455, -1.412352, 1, 1, 1, 1, 1,
-1.358693, 0.7589866, -0.3386025, 1, 1, 1, 1, 1,
-1.350476, 0.3013478, -2.155347, 1, 1, 1, 1, 1,
-1.341085, 0.2571271, -1.945185, 1, 1, 1, 1, 1,
-1.339106, 1.58702, -1.777696, 1, 1, 1, 1, 1,
-1.328396, -0.8524067, -2.866142, 1, 1, 1, 1, 1,
-1.317836, -0.4115214, -3.578125, 1, 1, 1, 1, 1,
-1.314683, 0.7634789, 1.049393, 1, 1, 1, 1, 1,
-1.302105, 0.5239863, -0.9228416, 1, 1, 1, 1, 1,
-1.301852, -0.3735121, -2.681915, 1, 1, 1, 1, 1,
-1.293872, -0.3501607, -0.6701998, 1, 1, 1, 1, 1,
-1.292172, -0.5887166, -1.538711, 1, 1, 1, 1, 1,
-1.287897, -0.1175181, -1.902892, 1, 1, 1, 1, 1,
-1.283981, -1.514367, -2.747865, 1, 1, 1, 1, 1,
-1.283334, -1.045105, -1.668518, 0, 0, 1, 1, 1,
-1.280404, -0.3526118, -2.106989, 1, 0, 0, 1, 1,
-1.277469, 2.259178, 0.1177025, 1, 0, 0, 1, 1,
-1.277394, 1.068587, 0.06643425, 1, 0, 0, 1, 1,
-1.253063, -0.3564315, -2.437843, 1, 0, 0, 1, 1,
-1.251026, -0.1499911, -2.639091, 1, 0, 0, 1, 1,
-1.247875, 0.2878314, 0.9246721, 0, 0, 0, 1, 1,
-1.247615, 1.463476, 0.2943188, 0, 0, 0, 1, 1,
-1.233711, -0.6000484, -0.7099407, 0, 0, 0, 1, 1,
-1.230164, 0.2281161, -1.273183, 0, 0, 0, 1, 1,
-1.226254, 0.3701536, -0.9399529, 0, 0, 0, 1, 1,
-1.219543, 1.206022, 1.414543, 0, 0, 0, 1, 1,
-1.212256, 1.226449, 0.3582831, 0, 0, 0, 1, 1,
-1.184643, -0.1447254, -2.620396, 1, 1, 1, 1, 1,
-1.178394, 1.191886, -1.024211, 1, 1, 1, 1, 1,
-1.155946, 1.016398, 0.1420034, 1, 1, 1, 1, 1,
-1.153704, -0.3107379, -2.63499, 1, 1, 1, 1, 1,
-1.150244, -0.3741409, -1.612989, 1, 1, 1, 1, 1,
-1.145471, -0.1385152, -1.945046, 1, 1, 1, 1, 1,
-1.143368, 0.522387, 1.302291, 1, 1, 1, 1, 1,
-1.141086, -1.463392, 0.268501, 1, 1, 1, 1, 1,
-1.140138, 1.555553, -1.053244, 1, 1, 1, 1, 1,
-1.136463, -1.080521, -1.988451, 1, 1, 1, 1, 1,
-1.128072, 0.885438, -0.2217119, 1, 1, 1, 1, 1,
-1.122998, 0.6144244, -1.242031, 1, 1, 1, 1, 1,
-1.119636, -0.1924102, -2.393303, 1, 1, 1, 1, 1,
-1.113988, -0.5269583, -2.513436, 1, 1, 1, 1, 1,
-1.107745, -0.2857881, -1.251655, 1, 1, 1, 1, 1,
-1.107489, 1.684858, -1.210117, 0, 0, 1, 1, 1,
-1.100747, -0.6883973, -2.998276, 1, 0, 0, 1, 1,
-1.099468, -0.6834946, -1.796659, 1, 0, 0, 1, 1,
-1.095583, -0.0121673, 0.02235406, 1, 0, 0, 1, 1,
-1.092206, 0.1044426, -1.943636, 1, 0, 0, 1, 1,
-1.09183, -0.5204992, -2.699957, 1, 0, 0, 1, 1,
-1.083505, 0.7298906, -1.808959, 0, 0, 0, 1, 1,
-1.070049, 1.382354, -1.676004, 0, 0, 0, 1, 1,
-1.063093, 0.6638525, -2.055716, 0, 0, 0, 1, 1,
-1.05908, -0.278878, -2.753605, 0, 0, 0, 1, 1,
-1.052896, 0.4157867, -1.220014, 0, 0, 0, 1, 1,
-1.038849, 0.3041756, -0.3786104, 0, 0, 0, 1, 1,
-1.03272, -0.888116, -2.640205, 0, 0, 0, 1, 1,
-1.029509, -0.328603, -2.041835, 1, 1, 1, 1, 1,
-1.019523, -0.4643309, -1.237529, 1, 1, 1, 1, 1,
-1.019024, -0.7784072, -1.581118, 1, 1, 1, 1, 1,
-1.011249, 1.473352, -2.5623, 1, 1, 1, 1, 1,
-0.9996845, -0.05933906, -0.941555, 1, 1, 1, 1, 1,
-0.990294, 0.4851474, -1.801517, 1, 1, 1, 1, 1,
-0.9898204, 0.4987954, -1.870488, 1, 1, 1, 1, 1,
-0.9783949, -0.04661155, -1.085269, 1, 1, 1, 1, 1,
-0.9783818, -0.1583468, -1.400536, 1, 1, 1, 1, 1,
-0.9761289, 0.3784985, -1.244145, 1, 1, 1, 1, 1,
-0.9760084, -2.067521, -4.851242, 1, 1, 1, 1, 1,
-0.9702195, 0.2291922, 0.4497417, 1, 1, 1, 1, 1,
-0.9689323, -1.072572, -0.7812484, 1, 1, 1, 1, 1,
-0.9674038, -0.6221073, -1.705374, 1, 1, 1, 1, 1,
-0.9655392, -0.420691, -1.444565, 1, 1, 1, 1, 1,
-0.9578148, -0.6327549, -2.149681, 0, 0, 1, 1, 1,
-0.9576257, 1.521552, -0.8184826, 1, 0, 0, 1, 1,
-0.9527609, -1.106286, -1.862478, 1, 0, 0, 1, 1,
-0.9511319, -0.7725085, -2.50561, 1, 0, 0, 1, 1,
-0.9483464, 1.158693, -1.334738, 1, 0, 0, 1, 1,
-0.9460251, -1.957462, -1.699642, 1, 0, 0, 1, 1,
-0.9441972, 1.026412, 0.6789344, 0, 0, 0, 1, 1,
-0.93513, 0.7401627, 0.2340247, 0, 0, 0, 1, 1,
-0.9336094, 1.800117, -1.594341, 0, 0, 0, 1, 1,
-0.9295485, 0.2853588, -0.2329848, 0, 0, 0, 1, 1,
-0.9255458, 0.3867364, -0.8647546, 0, 0, 0, 1, 1,
-0.9151704, -0.03646862, -0.1190937, 0, 0, 0, 1, 1,
-0.9149308, 0.1766464, -0.9216004, 0, 0, 0, 1, 1,
-0.9145439, -1.107085, -2.275687, 1, 1, 1, 1, 1,
-0.9020734, -0.2725861, -0.9619019, 1, 1, 1, 1, 1,
-0.8949358, -0.1900911, -1.746846, 1, 1, 1, 1, 1,
-0.8929831, 0.3590682, -2.394279, 1, 1, 1, 1, 1,
-0.8852502, -0.3310936, -3.862594, 1, 1, 1, 1, 1,
-0.8846425, -1.279357, -1.777082, 1, 1, 1, 1, 1,
-0.8741164, 1.345028, -1.487335, 1, 1, 1, 1, 1,
-0.8705881, 0.2482298, -1.561494, 1, 1, 1, 1, 1,
-0.8704949, -0.678584, -2.194299, 1, 1, 1, 1, 1,
-0.8638052, -0.9718392, -2.622605, 1, 1, 1, 1, 1,
-0.8615215, 0.6340917, -1.09463, 1, 1, 1, 1, 1,
-0.8605396, 0.977304, 0.7092221, 1, 1, 1, 1, 1,
-0.8509104, -0.5975516, -1.949833, 1, 1, 1, 1, 1,
-0.8475502, -1.308544, -2.724342, 1, 1, 1, 1, 1,
-0.8465298, -0.6632419, -2.285509, 1, 1, 1, 1, 1,
-0.8463079, -0.07153693, -1.815415, 0, 0, 1, 1, 1,
-0.8457022, -0.294614, -2.866823, 1, 0, 0, 1, 1,
-0.840175, -1.065849, -2.174329, 1, 0, 0, 1, 1,
-0.8400487, 0.1496994, -0.2493318, 1, 0, 0, 1, 1,
-0.8387495, -0.02450255, -2.502713, 1, 0, 0, 1, 1,
-0.8385934, -0.7992213, -3.479641, 1, 0, 0, 1, 1,
-0.8317049, 0.8464961, -1.873178, 0, 0, 0, 1, 1,
-0.8307338, 0.45428, 1.742802, 0, 0, 0, 1, 1,
-0.8277209, 0.1218213, -2.294844, 0, 0, 0, 1, 1,
-0.8239044, 1.239154, -0.5487698, 0, 0, 0, 1, 1,
-0.8225153, 0.9043553, 1.018415, 0, 0, 0, 1, 1,
-0.8209882, -1.707181, -4.149517, 0, 0, 0, 1, 1,
-0.7907947, 0.3116856, -1.254177, 0, 0, 0, 1, 1,
-0.7825803, 0.1843856, -0.1184859, 1, 1, 1, 1, 1,
-0.7787648, 0.4581555, -2.67017, 1, 1, 1, 1, 1,
-0.7731909, 0.8256128, 1.380239, 1, 1, 1, 1, 1,
-0.7727248, -0.8899626, -2.292145, 1, 1, 1, 1, 1,
-0.77194, 0.6536987, -1.400749, 1, 1, 1, 1, 1,
-0.7708284, -1.190129, -1.51503, 1, 1, 1, 1, 1,
-0.7637544, -0.1840747, -0.6541358, 1, 1, 1, 1, 1,
-0.7632729, -1.603339, -2.492516, 1, 1, 1, 1, 1,
-0.7619582, -0.6320634, -1.299746, 1, 1, 1, 1, 1,
-0.758099, -1.557173, -0.96874, 1, 1, 1, 1, 1,
-0.7568848, 0.9006611, -0.1069647, 1, 1, 1, 1, 1,
-0.7510691, 0.1016975, -2.119355, 1, 1, 1, 1, 1,
-0.7478556, 1.343904, -1.229689, 1, 1, 1, 1, 1,
-0.7463247, -0.297775, -1.777677, 1, 1, 1, 1, 1,
-0.7421154, 1.471524, 0.9614455, 1, 1, 1, 1, 1,
-0.7405049, 0.174606, 0.3927792, 0, 0, 1, 1, 1,
-0.7357133, -0.6130818, -1.371231, 1, 0, 0, 1, 1,
-0.7278113, -1.607754, -3.525501, 1, 0, 0, 1, 1,
-0.7201476, 0.08214702, -0.3146471, 1, 0, 0, 1, 1,
-0.7196922, 0.9346861, -1.818789, 1, 0, 0, 1, 1,
-0.719471, -0.6754013, -2.354215, 1, 0, 0, 1, 1,
-0.718559, 0.6508299, -1.154712, 0, 0, 0, 1, 1,
-0.7162478, 0.7458758, -1.574466, 0, 0, 0, 1, 1,
-0.713075, 0.984897, -0.7322959, 0, 0, 0, 1, 1,
-0.7107303, 2.168828, -0.6612918, 0, 0, 0, 1, 1,
-0.7092058, -0.6907741, -3.443415, 0, 0, 0, 1, 1,
-0.7069545, 0.7212112, 0.4713089, 0, 0, 0, 1, 1,
-0.7032459, -1.515457, -2.842395, 0, 0, 0, 1, 1,
-0.7018785, 0.3721505, 0.1170309, 1, 1, 1, 1, 1,
-0.6969202, 0.9358926, 0.1675961, 1, 1, 1, 1, 1,
-0.6926322, -1.032116, -1.374769, 1, 1, 1, 1, 1,
-0.6882038, 0.8208302, -1.824336, 1, 1, 1, 1, 1,
-0.681103, -0.961353, -2.156916, 1, 1, 1, 1, 1,
-0.6788902, -0.1167542, -2.578822, 1, 1, 1, 1, 1,
-0.6739375, 0.3962902, -1.122226, 1, 1, 1, 1, 1,
-0.6724932, -1.046234, -0.09982086, 1, 1, 1, 1, 1,
-0.6704299, 0.4469985, 0.8670903, 1, 1, 1, 1, 1,
-0.6684226, -0.4278565, -2.229388, 1, 1, 1, 1, 1,
-0.6673321, -0.8159549, -2.72449, 1, 1, 1, 1, 1,
-0.6638537, -0.8758048, -3.061969, 1, 1, 1, 1, 1,
-0.6621495, 0.568781, -0.5323354, 1, 1, 1, 1, 1,
-0.6610746, -0.8588797, -1.174284, 1, 1, 1, 1, 1,
-0.6600708, -0.03709816, -1.759656, 1, 1, 1, 1, 1,
-0.6595876, -0.9552104, -2.741419, 0, 0, 1, 1, 1,
-0.6542355, 0.4137748, -2.759527, 1, 0, 0, 1, 1,
-0.6538404, -0.8917247, -1.39286, 1, 0, 0, 1, 1,
-0.6486763, 1.112342, -0.7900071, 1, 0, 0, 1, 1,
-0.6458719, 0.1481955, -2.131469, 1, 0, 0, 1, 1,
-0.6427409, 1.33669, -1.558575, 1, 0, 0, 1, 1,
-0.6418509, 0.883708, -0.2993652, 0, 0, 0, 1, 1,
-0.6390975, 0.5621035, 0.3300128, 0, 0, 0, 1, 1,
-0.63748, 0.5803469, -1.50084, 0, 0, 0, 1, 1,
-0.636131, -1.270004, -1.610575, 0, 0, 0, 1, 1,
-0.6280178, -0.1459061, -3.24739, 0, 0, 0, 1, 1,
-0.6218674, -0.1028615, -2.736092, 0, 0, 0, 1, 1,
-0.6207, 0.9793819, -0.3928871, 0, 0, 0, 1, 1,
-0.6198434, 2.239917, -0.5986497, 1, 1, 1, 1, 1,
-0.6173517, 0.2671194, -2.554052, 1, 1, 1, 1, 1,
-0.614812, 0.2159549, 0.2313006, 1, 1, 1, 1, 1,
-0.6134617, -1.670236, -3.04683, 1, 1, 1, 1, 1,
-0.6128609, 0.1756386, -2.428051, 1, 1, 1, 1, 1,
-0.6093886, 1.452034, -1.031198, 1, 1, 1, 1, 1,
-0.6027797, -1.231213, -4.14211, 1, 1, 1, 1, 1,
-0.6011853, 1.302252, -0.4090711, 1, 1, 1, 1, 1,
-0.5968497, -3.980656, -1.972716, 1, 1, 1, 1, 1,
-0.5962202, -0.5480238, -1.434968, 1, 1, 1, 1, 1,
-0.5957413, 1.427447, -0.04047908, 1, 1, 1, 1, 1,
-0.5919976, -1.578822, -3.472278, 1, 1, 1, 1, 1,
-0.591651, -2.101447, -2.602564, 1, 1, 1, 1, 1,
-0.588485, 0.279572, -1.74198, 1, 1, 1, 1, 1,
-0.5863723, 0.6904173, -1.112375, 1, 1, 1, 1, 1,
-0.578782, 0.06854983, 0.4503543, 0, 0, 1, 1, 1,
-0.5699251, 2.939177, -1.180248, 1, 0, 0, 1, 1,
-0.568675, -0.5727845, -3.083748, 1, 0, 0, 1, 1,
-0.5671952, -0.15477, -4.067972, 1, 0, 0, 1, 1,
-0.5619385, -0.3116453, -1.796578, 1, 0, 0, 1, 1,
-0.5506586, -1.364426, -2.020962, 1, 0, 0, 1, 1,
-0.5489802, 0.6434985, -2.859265, 0, 0, 0, 1, 1,
-0.5480969, 0.973802, -0.7566394, 0, 0, 0, 1, 1,
-0.5464318, 0.1164928, 1.740246, 0, 0, 0, 1, 1,
-0.5404868, -0.4888615, -0.7984821, 0, 0, 0, 1, 1,
-0.5392689, 1.062321, -0.5916793, 0, 0, 0, 1, 1,
-0.5377195, -0.2638422, -1.479217, 0, 0, 0, 1, 1,
-0.5360608, -0.05310097, -2.671031, 0, 0, 0, 1, 1,
-0.5297177, -0.1001861, 0.4279183, 1, 1, 1, 1, 1,
-0.5282074, -0.2255349, -2.19749, 1, 1, 1, 1, 1,
-0.5271937, -0.4807544, -2.258626, 1, 1, 1, 1, 1,
-0.5231255, 1.076379, 0.2462908, 1, 1, 1, 1, 1,
-0.5225286, 1.326732, -1.040248, 1, 1, 1, 1, 1,
-0.5181209, 0.4139312, -0.9441081, 1, 1, 1, 1, 1,
-0.5177012, -0.3236387, -2.983995, 1, 1, 1, 1, 1,
-0.5166043, -1.003372, -3.232421, 1, 1, 1, 1, 1,
-0.5112143, 1.089144, -0.63728, 1, 1, 1, 1, 1,
-0.5101272, -1.496259, -2.345493, 1, 1, 1, 1, 1,
-0.5083009, -0.4554839, -3.185575, 1, 1, 1, 1, 1,
-0.5080358, 0.7529813, -1.890643, 1, 1, 1, 1, 1,
-0.5080171, -0.4818798, -2.979466, 1, 1, 1, 1, 1,
-0.5066904, -0.6244765, -3.144342, 1, 1, 1, 1, 1,
-0.506106, 1.197677, -0.06511044, 1, 1, 1, 1, 1,
-0.5004867, 0.6153994, -1.479808, 0, 0, 1, 1, 1,
-0.5000646, -1.207908, -2.12618, 1, 0, 0, 1, 1,
-0.4999983, 0.4189788, 0.02428796, 1, 0, 0, 1, 1,
-0.4989509, 0.1305605, -1.3905, 1, 0, 0, 1, 1,
-0.4926904, 1.262118, 1.622543, 1, 0, 0, 1, 1,
-0.4900633, -1.658872, -2.827749, 1, 0, 0, 1, 1,
-0.4842409, -0.1429918, -0.9658965, 0, 0, 0, 1, 1,
-0.4808012, 1.547211, -0.2509273, 0, 0, 0, 1, 1,
-0.4787753, 0.1153165, -0.3574645, 0, 0, 0, 1, 1,
-0.4780407, 1.708172, -0.3151017, 0, 0, 0, 1, 1,
-0.4765563, 0.4280743, -3.77172, 0, 0, 0, 1, 1,
-0.4757835, -0.01960149, -3.532942, 0, 0, 0, 1, 1,
-0.4704303, -0.04818111, -0.223116, 0, 0, 0, 1, 1,
-0.4700709, 0.03292371, -0.9431102, 1, 1, 1, 1, 1,
-0.4699337, 0.6363922, 0.1271448, 1, 1, 1, 1, 1,
-0.4685753, -0.4021779, -4.013721, 1, 1, 1, 1, 1,
-0.4644434, 0.3287253, -1.96817, 1, 1, 1, 1, 1,
-0.4590278, -1.197784, -3.734654, 1, 1, 1, 1, 1,
-0.4540732, -0.9269813, -2.538941, 1, 1, 1, 1, 1,
-0.4492257, 0.6145728, 0.1695124, 1, 1, 1, 1, 1,
-0.4459447, -0.8403482, -0.9868432, 1, 1, 1, 1, 1,
-0.4416465, -0.7143707, -1.493826, 1, 1, 1, 1, 1,
-0.4320239, -1.561059, -2.749461, 1, 1, 1, 1, 1,
-0.4291833, 0.1543236, -1.784614, 1, 1, 1, 1, 1,
-0.4277084, -0.4623795, -1.238515, 1, 1, 1, 1, 1,
-0.4225076, -0.01128879, -1.534153, 1, 1, 1, 1, 1,
-0.4217159, -0.1275158, -3.249623, 1, 1, 1, 1, 1,
-0.4169284, 0.687503, 0.69953, 1, 1, 1, 1, 1,
-0.4139493, 1.29693, 0.4870025, 0, 0, 1, 1, 1,
-0.4105565, -0.9941605, -1.74862, 1, 0, 0, 1, 1,
-0.4082647, -1.841786, -2.545699, 1, 0, 0, 1, 1,
-0.4051972, -0.8930272, -3.544949, 1, 0, 0, 1, 1,
-0.4004115, 0.2631635, -1.468563, 1, 0, 0, 1, 1,
-0.398471, -0.675091, -3.649771, 1, 0, 0, 1, 1,
-0.3962122, 1.065595, -0.6109871, 0, 0, 0, 1, 1,
-0.395756, -1.251704, -2.798965, 0, 0, 0, 1, 1,
-0.3949033, -0.3624368, -2.544564, 0, 0, 0, 1, 1,
-0.394085, -0.1545792, -1.843504, 0, 0, 0, 1, 1,
-0.3927251, 1.504118, -1.167265, 0, 0, 0, 1, 1,
-0.3925911, 0.1441009, -0.8091855, 0, 0, 0, 1, 1,
-0.3903381, 0.2535023, -2.398066, 0, 0, 0, 1, 1,
-0.3873698, -1.12582, -3.267626, 1, 1, 1, 1, 1,
-0.3845885, -0.2105255, -3.353126, 1, 1, 1, 1, 1,
-0.3844618, -0.2685613, -3.072789, 1, 1, 1, 1, 1,
-0.3824027, 0.5116271, -1.492011, 1, 1, 1, 1, 1,
-0.3750993, -0.7568785, -3.008898, 1, 1, 1, 1, 1,
-0.3747038, 1.032941, -1.837943, 1, 1, 1, 1, 1,
-0.3738418, -0.1994744, -1.986637, 1, 1, 1, 1, 1,
-0.3736845, 1.614813, -0.7618356, 1, 1, 1, 1, 1,
-0.3628872, -0.5435547, -2.628265, 1, 1, 1, 1, 1,
-0.3627101, 0.01852274, -0.7622055, 1, 1, 1, 1, 1,
-0.3620606, -0.03376396, -1.086781, 1, 1, 1, 1, 1,
-0.3610025, 1.418104, 0.2857228, 1, 1, 1, 1, 1,
-0.3608654, 0.5977568, 0.3005265, 1, 1, 1, 1, 1,
-0.3597371, -1.085149, -2.117025, 1, 1, 1, 1, 1,
-0.3593332, -1.800258, -4.29888, 1, 1, 1, 1, 1,
-0.353893, -1.406072, -4.19281, 0, 0, 1, 1, 1,
-0.3525987, 1.95022, -0.466486, 1, 0, 0, 1, 1,
-0.3479862, 0.3541377, 1.175618, 1, 0, 0, 1, 1,
-0.3452862, 1.188126, -1.560175, 1, 0, 0, 1, 1,
-0.3435964, 0.9106122, 0.4238805, 1, 0, 0, 1, 1,
-0.3427337, 0.4470829, -0.3829544, 1, 0, 0, 1, 1,
-0.340419, -0.143921, -1.358296, 0, 0, 0, 1, 1,
-0.3345305, 0.4820748, -0.314648, 0, 0, 0, 1, 1,
-0.3340551, -0.3795494, -3.200295, 0, 0, 0, 1, 1,
-0.3324792, 0.8358378, -0.3274084, 0, 0, 0, 1, 1,
-0.330361, -0.7916589, -4.68811, 0, 0, 0, 1, 1,
-0.32897, -0.9533446, -2.921106, 0, 0, 0, 1, 1,
-0.3256652, -0.09280603, -0.7758067, 0, 0, 0, 1, 1,
-0.3229297, -0.3306229, -2.080848, 1, 1, 1, 1, 1,
-0.3225268, -0.2359186, -2.555446, 1, 1, 1, 1, 1,
-0.3187958, -0.2613832, -1.188496, 1, 1, 1, 1, 1,
-0.3180518, -0.9146723, -3.53695, 1, 1, 1, 1, 1,
-0.3123157, -0.08843486, 0.1028664, 1, 1, 1, 1, 1,
-0.3005955, -1.090078, 0.00844714, 1, 1, 1, 1, 1,
-0.3004823, -0.2348321, -0.9696388, 1, 1, 1, 1, 1,
-0.3002196, -1.079347, -2.446605, 1, 1, 1, 1, 1,
-0.2982701, 1.229862, 0.6092404, 1, 1, 1, 1, 1,
-0.2925989, 0.5109497, -1.181029, 1, 1, 1, 1, 1,
-0.2920955, -1.485595, -4.140678, 1, 1, 1, 1, 1,
-0.2905502, 0.8971264, -0.7317477, 1, 1, 1, 1, 1,
-0.2883169, 1.266182, 0.2234818, 1, 1, 1, 1, 1,
-0.2876743, -0.6593867, -2.55233, 1, 1, 1, 1, 1,
-0.2808591, 1.210301, 0.5136656, 1, 1, 1, 1, 1,
-0.280856, 0.5000112, -0.9912374, 0, 0, 1, 1, 1,
-0.2759016, -0.3535392, -2.244092, 1, 0, 0, 1, 1,
-0.2747252, 0.055636, -0.7688232, 1, 0, 0, 1, 1,
-0.2730768, 1.610719, -3.080342, 1, 0, 0, 1, 1,
-0.2706167, -0.07435266, 0.04517492, 1, 0, 0, 1, 1,
-0.2654863, 0.3734372, -0.3160134, 1, 0, 0, 1, 1,
-0.2645533, 1.920825, -1.363866, 0, 0, 0, 1, 1,
-0.2632449, 0.7312082, -0.264758, 0, 0, 0, 1, 1,
-0.2630245, -1.492338, -5.164998, 0, 0, 0, 1, 1,
-0.2620484, 1.018489, -1.023828, 0, 0, 0, 1, 1,
-0.2616742, 0.5225937, -0.6498541, 0, 0, 0, 1, 1,
-0.2612606, -0.6721699, -3.421178, 0, 0, 0, 1, 1,
-0.2609229, -0.5442119, -3.603024, 0, 0, 0, 1, 1,
-0.2574413, -1.924377, -1.900161, 1, 1, 1, 1, 1,
-0.2560034, 1.908522, 1.546376, 1, 1, 1, 1, 1,
-0.2554713, -1.868835, -2.62246, 1, 1, 1, 1, 1,
-0.2501756, 0.7612972, -1.606363, 1, 1, 1, 1, 1,
-0.2461835, 1.168255, -0.3429652, 1, 1, 1, 1, 1,
-0.2447847, -0.8248981, -3.190011, 1, 1, 1, 1, 1,
-0.2419166, -1.262423, -2.977919, 1, 1, 1, 1, 1,
-0.2418548, -0.6209342, -2.915037, 1, 1, 1, 1, 1,
-0.2410814, -0.508446, -2.391618, 1, 1, 1, 1, 1,
-0.2408099, -0.1250606, -0.703779, 1, 1, 1, 1, 1,
-0.2392696, 0.9674201, -0.8645945, 1, 1, 1, 1, 1,
-0.2241407, 0.02017242, -1.707619, 1, 1, 1, 1, 1,
-0.2236272, 0.7216592, -3.696383, 1, 1, 1, 1, 1,
-0.2189648, 2.593419, -0.337667, 1, 1, 1, 1, 1,
-0.2172725, -0.6543478, -3.93105, 1, 1, 1, 1, 1,
-0.2088691, 0.4916228, -0.7392405, 0, 0, 1, 1, 1,
-0.2074123, 0.4331776, 0.8415853, 1, 0, 0, 1, 1,
-0.2060096, -1.039175, -3.292233, 1, 0, 0, 1, 1,
-0.2036662, -1.771435, -2.773296, 1, 0, 0, 1, 1,
-0.2020552, -1.892497, -3.75777, 1, 0, 0, 1, 1,
-0.1978898, -0.5560669, -1.727088, 1, 0, 0, 1, 1,
-0.1975742, -0.9805428, -0.7867789, 0, 0, 0, 1, 1,
-0.1932804, -0.8598589, -2.801367, 0, 0, 0, 1, 1,
-0.1932148, -0.02851676, -2.108561, 0, 0, 0, 1, 1,
-0.1922871, -2.067474, -2.227489, 0, 0, 0, 1, 1,
-0.1909081, 0.771113, -0.05280162, 0, 0, 0, 1, 1,
-0.1897887, -0.858827, -1.184359, 0, 0, 0, 1, 1,
-0.1883448, -2.365471, -2.22277, 0, 0, 0, 1, 1,
-0.1850348, 0.3266726, 0.6358294, 1, 1, 1, 1, 1,
-0.1846326, 0.6177257, -0.9290068, 1, 1, 1, 1, 1,
-0.178144, -1.081177, -2.949003, 1, 1, 1, 1, 1,
-0.1747695, 0.541096, 0.6772168, 1, 1, 1, 1, 1,
-0.1734103, 0.7926155, -2.082786, 1, 1, 1, 1, 1,
-0.1692065, -1.128399, -2.830857, 1, 1, 1, 1, 1,
-0.1590374, 0.06763943, -2.429718, 1, 1, 1, 1, 1,
-0.1549277, -0.7917947, -3.505602, 1, 1, 1, 1, 1,
-0.1548675, 1.326235, 2.312874, 1, 1, 1, 1, 1,
-0.154161, -0.3810952, -1.463839, 1, 1, 1, 1, 1,
-0.1529159, 0.3811884, 2.370806, 1, 1, 1, 1, 1,
-0.1527186, -0.07113653, -2.050682, 1, 1, 1, 1, 1,
-0.1446168, -0.5568694, -3.243996, 1, 1, 1, 1, 1,
-0.144039, 1.036362, 1.590981, 1, 1, 1, 1, 1,
-0.1439318, 1.73771, 0.8796808, 1, 1, 1, 1, 1,
-0.1401853, 1.100552, 0.704994, 0, 0, 1, 1, 1,
-0.1362491, -0.346775, -3.009951, 1, 0, 0, 1, 1,
-0.1308824, -0.9491125, -3.810902, 1, 0, 0, 1, 1,
-0.1304258, -1.552284, -4.163964, 1, 0, 0, 1, 1,
-0.1264846, -0.8559568, -3.953463, 1, 0, 0, 1, 1,
-0.1262275, -1.722304, -2.790187, 1, 0, 0, 1, 1,
-0.1241441, 0.2540133, 1.008962, 0, 0, 0, 1, 1,
-0.1229001, -0.4801688, -3.036092, 0, 0, 0, 1, 1,
-0.1212221, 0.2025913, -0.5912557, 0, 0, 0, 1, 1,
-0.1206307, 0.2961499, 0.5263251, 0, 0, 0, 1, 1,
-0.1182892, 1.818743, -2.159405, 0, 0, 0, 1, 1,
-0.1155278, -0.4702403, -1.687797, 0, 0, 0, 1, 1,
-0.1139026, -1.601759, -5.09956, 0, 0, 0, 1, 1,
-0.1114793, -0.9522294, -2.49245, 1, 1, 1, 1, 1,
-0.1092226, 0.4450278, 1.389717, 1, 1, 1, 1, 1,
-0.109078, 0.2421769, 1.085546, 1, 1, 1, 1, 1,
-0.106824, 1.310229, -1.138626, 1, 1, 1, 1, 1,
-0.1060175, 0.905297, 0.8790045, 1, 1, 1, 1, 1,
-0.1046321, 0.3764434, -0.01216996, 1, 1, 1, 1, 1,
-0.09885034, 0.01729524, -2.127754, 1, 1, 1, 1, 1,
-0.09846954, 0.08972025, -0.01801505, 1, 1, 1, 1, 1,
-0.09785174, 0.1747067, -0.9059051, 1, 1, 1, 1, 1,
-0.09590139, 0.06056274, -0.09960632, 1, 1, 1, 1, 1,
-0.09223308, 0.2795165, 0.6611462, 1, 1, 1, 1, 1,
-0.09138689, 1.115959, 0.3893825, 1, 1, 1, 1, 1,
-0.09137984, -1.622665, -3.604607, 1, 1, 1, 1, 1,
-0.08885364, -1.981302, -2.404371, 1, 1, 1, 1, 1,
-0.08783396, 0.6042556, -0.457099, 1, 1, 1, 1, 1,
-0.08537629, -0.9119547, -2.092853, 0, 0, 1, 1, 1,
-0.08469094, 1.272076, 1.148237, 1, 0, 0, 1, 1,
-0.08428149, 0.04708639, -2.459998, 1, 0, 0, 1, 1,
-0.08379149, -0.8746423, -2.848686, 1, 0, 0, 1, 1,
-0.08368403, -1.779776, -3.598864, 1, 0, 0, 1, 1,
-0.07900904, 0.566876, -1.022579, 1, 0, 0, 1, 1,
-0.07870843, 2.139296, -1.958851, 0, 0, 0, 1, 1,
-0.07632612, -0.6838594, -4.46284, 0, 0, 0, 1, 1,
-0.07472315, -0.3786244, -2.814182, 0, 0, 0, 1, 1,
-0.07196931, 1.074126, -1.055608, 0, 0, 0, 1, 1,
-0.06959324, 1.076383, -1.198904, 0, 0, 0, 1, 1,
-0.06780452, 0.5707907, 1.413045, 0, 0, 0, 1, 1,
-0.05673536, -0.03217141, -2.792264, 0, 0, 0, 1, 1,
-0.05179894, -1.660869, -2.414269, 1, 1, 1, 1, 1,
-0.04654766, 1.182717, 2.09884, 1, 1, 1, 1, 1,
-0.03672967, 1.107614, -0.06325759, 1, 1, 1, 1, 1,
-0.03541759, 1.095215, -2.539226, 1, 1, 1, 1, 1,
-0.03274009, -0.3640228, -4.139276, 1, 1, 1, 1, 1,
-0.01912303, -0.6450938, -2.164598, 1, 1, 1, 1, 1,
-0.01664446, -1.489907, -3.043032, 1, 1, 1, 1, 1,
-0.01117094, 0.4417392, 0.05219297, 1, 1, 1, 1, 1,
-0.009008865, 0.9942915, 0.364439, 1, 1, 1, 1, 1,
-0.007465113, 1.230475, 1.724344, 1, 1, 1, 1, 1,
-0.006361224, -0.9563626, -3.845176, 1, 1, 1, 1, 1,
-0.004188403, 0.3751919, 1.043256, 1, 1, 1, 1, 1,
-0.002591014, -1.856154, -3.211967, 1, 1, 1, 1, 1,
-0.0002446876, 0.1807186, -1.24641, 1, 1, 1, 1, 1,
0.004423062, 1.416332, 0.809509, 1, 1, 1, 1, 1,
0.004690503, -0.1733216, 3.09735, 0, 0, 1, 1, 1,
0.00534405, -0.2987061, 2.86556, 1, 0, 0, 1, 1,
0.01023623, -1.56092, 1.413879, 1, 0, 0, 1, 1,
0.01025471, 0.1108791, 0.3151428, 1, 0, 0, 1, 1,
0.01028432, -1.91186, 2.641321, 1, 0, 0, 1, 1,
0.01265022, 0.3039247, 1.249475, 1, 0, 0, 1, 1,
0.01564897, -1.261887, 2.494619, 0, 0, 0, 1, 1,
0.01894474, 0.5586609, 0.5938586, 0, 0, 0, 1, 1,
0.02263957, 0.4350338, -0.2588914, 0, 0, 0, 1, 1,
0.02692151, -0.1968832, 3.863427, 0, 0, 0, 1, 1,
0.03246079, 0.5113717, 0.09964509, 0, 0, 0, 1, 1,
0.03694473, 0.5638646, -0.1089804, 0, 0, 0, 1, 1,
0.04170915, 0.7056353, 0.6986282, 0, 0, 0, 1, 1,
0.04533744, 1.269233, 0.02515974, 1, 1, 1, 1, 1,
0.04836823, 1.726416, -0.05398885, 1, 1, 1, 1, 1,
0.05703527, -0.9943398, 1.992107, 1, 1, 1, 1, 1,
0.06107658, 1.345801, 0.4835107, 1, 1, 1, 1, 1,
0.0613102, 2.298855, -0.8822785, 1, 1, 1, 1, 1,
0.06487494, -1.295865, 2.92199, 1, 1, 1, 1, 1,
0.06616727, 0.05762536, 0.5756373, 1, 1, 1, 1, 1,
0.07326166, 1.677861, 0.0840567, 1, 1, 1, 1, 1,
0.07392405, 0.06792532, -0.02612136, 1, 1, 1, 1, 1,
0.0740907, -1.19596, 3.467391, 1, 1, 1, 1, 1,
0.07895425, -1.200349, 3.46573, 1, 1, 1, 1, 1,
0.07899656, -1.576057, 4.758278, 1, 1, 1, 1, 1,
0.08893601, 0.03827142, 1.827504, 1, 1, 1, 1, 1,
0.08918799, 0.9963768, -0.7332429, 1, 1, 1, 1, 1,
0.0902868, 1.568341, 0.02953822, 1, 1, 1, 1, 1,
0.09071355, 0.4124676, 2.857472, 0, 0, 1, 1, 1,
0.09126441, -0.1334098, 3.013645, 1, 0, 0, 1, 1,
0.09331282, 0.3094167, -0.5207862, 1, 0, 0, 1, 1,
0.09392409, 0.04756578, 0.8365566, 1, 0, 0, 1, 1,
0.1013532, 0.7077376, -1.763765, 1, 0, 0, 1, 1,
0.1017786, 0.7473112, 1.455006, 1, 0, 0, 1, 1,
0.1049658, -0.01671212, 1.498281, 0, 0, 0, 1, 1,
0.1125162, 2.755338, 0.08431797, 0, 0, 0, 1, 1,
0.1126568, -1.272212, 3.848912, 0, 0, 0, 1, 1,
0.1141921, -0.1614586, 2.579744, 0, 0, 0, 1, 1,
0.114503, -0.6436675, 2.817566, 0, 0, 0, 1, 1,
0.1154151, -1.689845, 2.857779, 0, 0, 0, 1, 1,
0.1200496, -0.9467881, 4.589564, 0, 0, 0, 1, 1,
0.1220434, 0.9403113, 0.7122685, 1, 1, 1, 1, 1,
0.1222705, -0.06187622, 2.284183, 1, 1, 1, 1, 1,
0.1226784, 0.7736883, 1.508075, 1, 1, 1, 1, 1,
0.1249538, 0.4914147, 0.2478119, 1, 1, 1, 1, 1,
0.1256687, 0.9421811, 0.5558765, 1, 1, 1, 1, 1,
0.1291997, 0.4463803, 0.6130142, 1, 1, 1, 1, 1,
0.1408094, 0.8629503, 0.5134451, 1, 1, 1, 1, 1,
0.1428302, -1.52012, 0.4448959, 1, 1, 1, 1, 1,
0.144412, -0.1129394, -0.3340347, 1, 1, 1, 1, 1,
0.1475188, 0.9589828, -1.571159, 1, 1, 1, 1, 1,
0.1530201, -1.693422, 4.917995, 1, 1, 1, 1, 1,
0.1551321, 0.8883497, 0.08525563, 1, 1, 1, 1, 1,
0.1565392, 0.9845497, 0.9383826, 1, 1, 1, 1, 1,
0.1571196, -1.856449, 2.951315, 1, 1, 1, 1, 1,
0.1591955, -1.561514, 3.431831, 1, 1, 1, 1, 1,
0.160509, 1.325103, 0.7516209, 0, 0, 1, 1, 1,
0.1617594, 0.6982301, 0.2828954, 1, 0, 0, 1, 1,
0.1618307, 1.426326, 0.6454079, 1, 0, 0, 1, 1,
0.1637657, -0.8301481, 2.831099, 1, 0, 0, 1, 1,
0.165941, -1.119632, 2.833478, 1, 0, 0, 1, 1,
0.1665502, 1.838143, -1.146086, 1, 0, 0, 1, 1,
0.167026, 0.3468905, 1.025334, 0, 0, 0, 1, 1,
0.1747923, 0.8882504, -1.048025, 0, 0, 0, 1, 1,
0.1766335, 0.437999, 0.002199321, 0, 0, 0, 1, 1,
0.1772753, 0.5858546, 2.196711, 0, 0, 0, 1, 1,
0.1778378, 1.205347, 0.6456245, 0, 0, 0, 1, 1,
0.1810148, 0.715396, -0.1458542, 0, 0, 0, 1, 1,
0.1916912, 1.046252, -1.343516, 0, 0, 0, 1, 1,
0.1961849, 0.04926516, 1.686911, 1, 1, 1, 1, 1,
0.1980844, -0.6430692, 3.06027, 1, 1, 1, 1, 1,
0.1984879, -1.50629, 4.861007, 1, 1, 1, 1, 1,
0.1994461, -1.052276, 1.25061, 1, 1, 1, 1, 1,
0.2029594, -0.1556589, 3.127863, 1, 1, 1, 1, 1,
0.2034811, 1.367222, -0.3756666, 1, 1, 1, 1, 1,
0.2066248, 0.8838675, 0.0798478, 1, 1, 1, 1, 1,
0.2122789, 1.115252, -0.4000651, 1, 1, 1, 1, 1,
0.2143372, 0.9349269, -0.3732772, 1, 1, 1, 1, 1,
0.2189612, -0.6128964, 2.701835, 1, 1, 1, 1, 1,
0.2257073, -1.054145, 1.325114, 1, 1, 1, 1, 1,
0.2261172, 1.182293, -1.180537, 1, 1, 1, 1, 1,
0.2354443, -0.01491665, 1.931453, 1, 1, 1, 1, 1,
0.2367153, 0.1827449, 2.264526, 1, 1, 1, 1, 1,
0.238236, -0.6809757, 2.235837, 1, 1, 1, 1, 1,
0.2388553, -0.02393554, 1.525247, 0, 0, 1, 1, 1,
0.2411138, -0.07553371, 2.398485, 1, 0, 0, 1, 1,
0.2452485, -0.09344169, 2.959134, 1, 0, 0, 1, 1,
0.2486097, 0.2148951, 0.273891, 1, 0, 0, 1, 1,
0.250279, -0.1563333, 0.9743186, 1, 0, 0, 1, 1,
0.2505123, -0.8798978, 4.93458, 1, 0, 0, 1, 1,
0.2509073, 0.5497206, 1.277506, 0, 0, 0, 1, 1,
0.2531744, -0.7624928, 2.744909, 0, 0, 0, 1, 1,
0.256281, -0.9259613, 2.215482, 0, 0, 0, 1, 1,
0.2566932, -1.026179, 3.12942, 0, 0, 0, 1, 1,
0.2610138, -1.589947, 0.5466312, 0, 0, 0, 1, 1,
0.2682596, 0.8511565, 1.731215, 0, 0, 0, 1, 1,
0.2716926, -0.2113902, 3.380805, 0, 0, 0, 1, 1,
0.2731254, 0.7020534, -0.4661201, 1, 1, 1, 1, 1,
0.27387, 0.3241881, 0.7654378, 1, 1, 1, 1, 1,
0.2758846, 0.2080353, 2.028793, 1, 1, 1, 1, 1,
0.2805111, 0.7249954, -1.176588, 1, 1, 1, 1, 1,
0.2858754, -0.2031157, 1.346931, 1, 1, 1, 1, 1,
0.2867, -0.6794084, 2.859085, 1, 1, 1, 1, 1,
0.290788, 1.727771, 0.0616927, 1, 1, 1, 1, 1,
0.2943428, 1.486149, 0.8586537, 1, 1, 1, 1, 1,
0.3041603, 1.441251, 0.424781, 1, 1, 1, 1, 1,
0.304267, 0.5058894, 0.9419928, 1, 1, 1, 1, 1,
0.3054259, 0.8027959, -0.7282892, 1, 1, 1, 1, 1,
0.3089779, -0.4295307, 0.8902802, 1, 1, 1, 1, 1,
0.3134445, -0.7028998, 4.015577, 1, 1, 1, 1, 1,
0.3148591, 0.2338555, 0.6244294, 1, 1, 1, 1, 1,
0.3165896, 1.390995, -0.7710233, 1, 1, 1, 1, 1,
0.3178204, 1.312529, 0.2003825, 0, 0, 1, 1, 1,
0.3190781, 1.215074, -1.399118, 1, 0, 0, 1, 1,
0.3218604, 1.054161, -0.4638196, 1, 0, 0, 1, 1,
0.3249453, 0.4603619, 0.2777044, 1, 0, 0, 1, 1,
0.325706, 0.23378, 1.732959, 1, 0, 0, 1, 1,
0.3297124, -1.126258, 1.835908, 1, 0, 0, 1, 1,
0.3299626, -0.7117121, 3.951931, 0, 0, 0, 1, 1,
0.3378671, 0.9019006, 0.8467865, 0, 0, 0, 1, 1,
0.3409933, 0.4195907, 0.6897767, 0, 0, 0, 1, 1,
0.3421631, 0.7663432, 1.577547, 0, 0, 0, 1, 1,
0.3504346, -2.48819, 1.806993, 0, 0, 0, 1, 1,
0.3585663, 1.596581, -0.4175803, 0, 0, 0, 1, 1,
0.3597438, 0.3657611, 0.5212185, 0, 0, 0, 1, 1,
0.3602232, 1.136177, -0.1251574, 1, 1, 1, 1, 1,
0.3670946, 0.8387818, 1.223846, 1, 1, 1, 1, 1,
0.3719091, -1.064616, 2.773019, 1, 1, 1, 1, 1,
0.3726162, -0.433439, 3.41423, 1, 1, 1, 1, 1,
0.3726366, -0.4600681, 3.971806, 1, 1, 1, 1, 1,
0.3732929, 0.5816009, 0.6035463, 1, 1, 1, 1, 1,
0.3776704, -2.169209, 3.225241, 1, 1, 1, 1, 1,
0.3791426, 1.501236, -0.1698373, 1, 1, 1, 1, 1,
0.3827839, -0.5266454, 2.967585, 1, 1, 1, 1, 1,
0.3876885, 0.8032086, 0.9200727, 1, 1, 1, 1, 1,
0.3884062, 1.863127, -0.9128025, 1, 1, 1, 1, 1,
0.3955351, -1.352294, 4.080745, 1, 1, 1, 1, 1,
0.3961957, -0.5097803, 1.896899, 1, 1, 1, 1, 1,
0.4028037, 0.4467728, 1.568529, 1, 1, 1, 1, 1,
0.4054361, 0.7120517, 1.781044, 1, 1, 1, 1, 1,
0.4066435, -1.152466, 1.986773, 0, 0, 1, 1, 1,
0.4111644, 0.8710157, -0.05140193, 1, 0, 0, 1, 1,
0.4120824, 0.7651342, 0.1841682, 1, 0, 0, 1, 1,
0.4126056, -0.8974156, 2.703945, 1, 0, 0, 1, 1,
0.4147474, 1.800384, -1.467213, 1, 0, 0, 1, 1,
0.4168701, -0.7223547, 3.986428, 1, 0, 0, 1, 1,
0.4212089, 1.062627, 1.016094, 0, 0, 0, 1, 1,
0.4220328, 0.453454, 2.364129, 0, 0, 0, 1, 1,
0.4238932, 0.5265657, 1.062453, 0, 0, 0, 1, 1,
0.4274668, 1.415014, 2.41852, 0, 0, 0, 1, 1,
0.4291444, 0.7980765, 0.8123515, 0, 0, 0, 1, 1,
0.4313474, -0.8090714, 2.075966, 0, 0, 0, 1, 1,
0.431598, -0.3391465, 3.48913, 0, 0, 0, 1, 1,
0.4341887, 0.5416358, 2.189423, 1, 1, 1, 1, 1,
0.4377168, -0.9888813, 1.978434, 1, 1, 1, 1, 1,
0.4394839, 0.5754015, -1.218931, 1, 1, 1, 1, 1,
0.4418833, 1.240297, 0.63857, 1, 1, 1, 1, 1,
0.4453859, 0.6212854, 2.401908, 1, 1, 1, 1, 1,
0.4479955, 1.078472, 0.8311161, 1, 1, 1, 1, 1,
0.4506266, 0.8419142, 2.47905, 1, 1, 1, 1, 1,
0.453575, -0.5528715, 1.902095, 1, 1, 1, 1, 1,
0.4538316, 2.037219, 0.7597364, 1, 1, 1, 1, 1,
0.4587882, -0.01687124, 2.896525, 1, 1, 1, 1, 1,
0.4597929, -0.7739361, 1.787962, 1, 1, 1, 1, 1,
0.4640754, -1.104823, 3.038286, 1, 1, 1, 1, 1,
0.4711523, 0.1105066, 1.586998, 1, 1, 1, 1, 1,
0.4717614, 0.6542243, 2.472889, 1, 1, 1, 1, 1,
0.4768407, 0.04125256, -0.07217577, 1, 1, 1, 1, 1,
0.4806642, 0.9030122, 1.542699, 0, 0, 1, 1, 1,
0.4843211, -1.034008, 3.584758, 1, 0, 0, 1, 1,
0.4849644, -1.080499, 1.862447, 1, 0, 0, 1, 1,
0.4872525, 0.859745, -0.3050413, 1, 0, 0, 1, 1,
0.4941643, -0.4439762, 3.222759, 1, 0, 0, 1, 1,
0.495939, -0.3069424, 1.511786, 1, 0, 0, 1, 1,
0.4992267, -0.3839787, 3.835686, 0, 0, 0, 1, 1,
0.5013215, -1.09616, 3.147214, 0, 0, 0, 1, 1,
0.5043041, -1.756235, 3.576832, 0, 0, 0, 1, 1,
0.5081102, -0.2979073, 0.470182, 0, 0, 0, 1, 1,
0.5116375, -0.9197972, 2.465785, 0, 0, 0, 1, 1,
0.5120369, -1.583923, 2.996219, 0, 0, 0, 1, 1,
0.5140972, 0.3839002, -0.3711499, 0, 0, 0, 1, 1,
0.5159884, -0.1488085, 3.108842, 1, 1, 1, 1, 1,
0.5308479, -1.699753, 3.684172, 1, 1, 1, 1, 1,
0.5312615, -1.416312, 2.998788, 1, 1, 1, 1, 1,
0.5449786, -0.002553242, 1.231131, 1, 1, 1, 1, 1,
0.5451449, 0.2142828, 1.509995, 1, 1, 1, 1, 1,
0.5474333, 0.06992759, 4.087099, 1, 1, 1, 1, 1,
0.5507939, -0.5054212, 1.508215, 1, 1, 1, 1, 1,
0.5532171, -1.294243, 2.897305, 1, 1, 1, 1, 1,
0.555865, -1.406969, 4.697134, 1, 1, 1, 1, 1,
0.5586933, -2.6245, 1.889391, 1, 1, 1, 1, 1,
0.5627614, 0.6252242, 0.9321476, 1, 1, 1, 1, 1,
0.5686866, 0.8966405, -0.8178226, 1, 1, 1, 1, 1,
0.5776107, -0.1676914, 1.167798, 1, 1, 1, 1, 1,
0.5776361, 0.2433694, 0.5332774, 1, 1, 1, 1, 1,
0.582588, -1.311867, 2.617181, 1, 1, 1, 1, 1,
0.5847924, 0.4200963, 1.4339, 0, 0, 1, 1, 1,
0.5894477, 0.402827, 0.5522012, 1, 0, 0, 1, 1,
0.5897185, 1.632295, 0.001189506, 1, 0, 0, 1, 1,
0.59064, -1.077523, 4.481112, 1, 0, 0, 1, 1,
0.5935371, -0.5335238, 1.546757, 1, 0, 0, 1, 1,
0.6009076, 0.7869452, 0.1701101, 1, 0, 0, 1, 1,
0.6051109, -0.820125, 1.864709, 0, 0, 0, 1, 1,
0.6064761, -2.273952, 1.573204, 0, 0, 0, 1, 1,
0.6080896, -0.8092693, 4.802598, 0, 0, 0, 1, 1,
0.6097192, 0.5494733, 0.5282861, 0, 0, 0, 1, 1,
0.6154673, -1.675248, 2.750318, 0, 0, 0, 1, 1,
0.6158247, 1.618736, -1.042714, 0, 0, 0, 1, 1,
0.6174321, 0.3228122, 0.3793497, 0, 0, 0, 1, 1,
0.619137, 0.2228203, 1.102132, 1, 1, 1, 1, 1,
0.6218568, 0.04595467, 2.729215, 1, 1, 1, 1, 1,
0.6274934, -0.6267458, 4.142914, 1, 1, 1, 1, 1,
0.6278356, -0.86762, 2.585818, 1, 1, 1, 1, 1,
0.6311165, -0.8831779, 5.512239, 1, 1, 1, 1, 1,
0.6330645, -1.273056, 2.32506, 1, 1, 1, 1, 1,
0.638074, -0.4541856, 2.014762, 1, 1, 1, 1, 1,
0.6386681, -1.505578, 2.772406, 1, 1, 1, 1, 1,
0.6417734, 0.7829377, 1.714184, 1, 1, 1, 1, 1,
0.6436321, -0.5689407, 0.174902, 1, 1, 1, 1, 1,
0.6455466, 0.9007453, 1.503661, 1, 1, 1, 1, 1,
0.6458592, 1.030165, -0.3972692, 1, 1, 1, 1, 1,
0.6467486, -0.9711949, 3.196945, 1, 1, 1, 1, 1,
0.6472962, -0.3409261, 0.9245293, 1, 1, 1, 1, 1,
0.6474575, -0.6133021, 1.545659, 1, 1, 1, 1, 1,
0.6491184, -0.7094288, 1.355716, 0, 0, 1, 1, 1,
0.650254, -0.7926233, 3.09479, 1, 0, 0, 1, 1,
0.6515174, -0.2937101, 2.538485, 1, 0, 0, 1, 1,
0.6539177, 0.886188, 1.525704, 1, 0, 0, 1, 1,
0.6651524, -0.8713918, 2.462912, 1, 0, 0, 1, 1,
0.6654252, 0.580111, 2.016592, 1, 0, 0, 1, 1,
0.6709726, -0.03536407, 1.946488, 0, 0, 0, 1, 1,
0.6745775, 0.2548835, -0.2357416, 0, 0, 0, 1, 1,
0.6780151, 0.3614659, -0.3587811, 0, 0, 0, 1, 1,
0.6790841, 0.05103713, 2.424622, 0, 0, 0, 1, 1,
0.6799453, -0.3362443, 0.5802612, 0, 0, 0, 1, 1,
0.6859012, -0.6999082, 2.197601, 0, 0, 0, 1, 1,
0.6860727, -0.3425437, 2.891338, 0, 0, 0, 1, 1,
0.6894383, 0.7666332, 0.04809847, 1, 1, 1, 1, 1,
0.7033594, 0.6657479, 1.461788, 1, 1, 1, 1, 1,
0.7077302, -0.2022211, 1.388324, 1, 1, 1, 1, 1,
0.7102844, 1.518638, 0.1558823, 1, 1, 1, 1, 1,
0.7128831, -1.213007, 1.582875, 1, 1, 1, 1, 1,
0.7129617, 1.071403, 1.129766, 1, 1, 1, 1, 1,
0.7146043, 0.6590047, 0.6124952, 1, 1, 1, 1, 1,
0.7157863, 0.3570746, 1.050419, 1, 1, 1, 1, 1,
0.7168159, 0.5808456, -0.1006658, 1, 1, 1, 1, 1,
0.7169433, 0.1356643, 1.521097, 1, 1, 1, 1, 1,
0.7182539, 0.1930703, 0.6127163, 1, 1, 1, 1, 1,
0.7239779, 0.4218566, 1.929156, 1, 1, 1, 1, 1,
0.7246968, 1.278767, 1.915449, 1, 1, 1, 1, 1,
0.7329929, -0.41441, 1.256686, 1, 1, 1, 1, 1,
0.7346561, 1.671085, 1.265701, 1, 1, 1, 1, 1,
0.7364863, -0.9271122, 2.144794, 0, 0, 1, 1, 1,
0.7404023, 1.471642, 1.203989, 1, 0, 0, 1, 1,
0.7415407, -2.10142, 1.625813, 1, 0, 0, 1, 1,
0.7441753, 0.8692256, -0.09516315, 1, 0, 0, 1, 1,
0.7496238, 0.9087201, 1.930744, 1, 0, 0, 1, 1,
0.7501939, -1.004328, 2.922522, 1, 0, 0, 1, 1,
0.7522026, 1.192663, 1.611264, 0, 0, 0, 1, 1,
0.752394, 0.8623047, 1.152418, 0, 0, 0, 1, 1,
0.755051, -1.978699, 1.011537, 0, 0, 0, 1, 1,
0.7555225, 0.5905185, 1.394363, 0, 0, 0, 1, 1,
0.7589365, 0.7642274, 1.304547, 0, 0, 0, 1, 1,
0.7601531, -0.8244184, 0.8285735, 0, 0, 0, 1, 1,
0.76183, -1.464768, 2.195508, 0, 0, 0, 1, 1,
0.7648028, 1.757142, 1.196107, 1, 1, 1, 1, 1,
0.7656617, -1.246462, 3.894723, 1, 1, 1, 1, 1,
0.765697, -0.8746302, 1.106232, 1, 1, 1, 1, 1,
0.7695056, -0.8685789, 0.5627461, 1, 1, 1, 1, 1,
0.7753164, -0.5114904, 1.560904, 1, 1, 1, 1, 1,
0.7755236, -0.1496941, 1.973285, 1, 1, 1, 1, 1,
0.7771631, 0.2014607, 2.161909, 1, 1, 1, 1, 1,
0.7797682, -0.733938, 2.123948, 1, 1, 1, 1, 1,
0.783693, -0.367245, 2.317487, 1, 1, 1, 1, 1,
0.7841672, 1.228711, 2.368185, 1, 1, 1, 1, 1,
0.79372, -0.7410748, 2.077729, 1, 1, 1, 1, 1,
0.8020291, -0.4691723, 3.614046, 1, 1, 1, 1, 1,
0.8049712, -0.479751, 2.663766, 1, 1, 1, 1, 1,
0.8052911, -0.1796161, -0.3093867, 1, 1, 1, 1, 1,
0.8082979, -0.2594723, 2.026351, 1, 1, 1, 1, 1,
0.8091733, 1.204104, 0.833232, 0, 0, 1, 1, 1,
0.8097494, 0.0440056, 4.392878, 1, 0, 0, 1, 1,
0.8219518, -0.9602051, 1.412337, 1, 0, 0, 1, 1,
0.8234433, 0.6986098, 1.419734, 1, 0, 0, 1, 1,
0.8248297, 0.8020689, 0.7950715, 1, 0, 0, 1, 1,
0.8345348, 0.2681921, 0.8503391, 1, 0, 0, 1, 1,
0.8351448, -1.410084, 2.93503, 0, 0, 0, 1, 1,
0.8449925, -0.72616, 1.667605, 0, 0, 0, 1, 1,
0.8478695, -0.7949359, 3.434825, 0, 0, 0, 1, 1,
0.8480054, -0.4515536, 0.8687378, 0, 0, 0, 1, 1,
0.849469, -0.09167685, 0.471313, 0, 0, 0, 1, 1,
0.8523731, -0.9326391, 2.069054, 0, 0, 0, 1, 1,
0.8526007, 0.9359729, 0.2805347, 0, 0, 0, 1, 1,
0.858523, 0.8775311, 2.80004, 1, 1, 1, 1, 1,
0.8621938, 0.3592012, 1.009233, 1, 1, 1, 1, 1,
0.8648299, 2.020237, 1.057795, 1, 1, 1, 1, 1,
0.8655061, 0.4761519, 0.2906171, 1, 1, 1, 1, 1,
0.8714256, -0.7738116, 2.161179, 1, 1, 1, 1, 1,
0.8731796, -0.2959617, 2.982265, 1, 1, 1, 1, 1,
0.883588, 0.5897976, 0.8602898, 1, 1, 1, 1, 1,
0.8875769, 1.144259, 0.06454275, 1, 1, 1, 1, 1,
0.8917652, -1.053473, 1.145021, 1, 1, 1, 1, 1,
0.8941444, -0.3567636, 2.344831, 1, 1, 1, 1, 1,
0.898357, 0.7485458, 1.397634, 1, 1, 1, 1, 1,
0.8985563, -1.659, 1.843064, 1, 1, 1, 1, 1,
0.9003568, -0.9517763, 3.265023, 1, 1, 1, 1, 1,
0.9023486, -1.472971, 1.261048, 1, 1, 1, 1, 1,
0.9098814, 0.004174368, 1.900856, 1, 1, 1, 1, 1,
0.9102731, -0.1733059, 2.191056, 0, 0, 1, 1, 1,
0.9113563, 1.082151, 1.250812, 1, 0, 0, 1, 1,
0.9177824, 0.4767777, 0.9821478, 1, 0, 0, 1, 1,
0.9185047, -2.241697, 2.84669, 1, 0, 0, 1, 1,
0.9207494, 1.501194, 0.4949848, 1, 0, 0, 1, 1,
0.9216787, 0.4672369, 0.6867287, 1, 0, 0, 1, 1,
0.924183, 2.881382, 0.5813084, 0, 0, 0, 1, 1,
0.9276281, -1.804764, 2.112875, 0, 0, 0, 1, 1,
0.9299387, -0.6684991, 3.402406, 0, 0, 0, 1, 1,
0.9331163, -1.555585, 1.939414, 0, 0, 0, 1, 1,
0.9335868, 0.2803137, 2.965899, 0, 0, 0, 1, 1,
0.9354385, -2.360998, 0.884095, 0, 0, 0, 1, 1,
0.9365886, 1.240351, -0.8993858, 0, 0, 0, 1, 1,
0.938459, 0.6860232, 1.122442, 1, 1, 1, 1, 1,
0.9386477, 1.388884, 0.07895211, 1, 1, 1, 1, 1,
0.9435859, -0.05182985, -1.431963, 1, 1, 1, 1, 1,
0.950834, 0.4463104, 0.120659, 1, 1, 1, 1, 1,
0.9545127, 0.4871841, 0.7074903, 1, 1, 1, 1, 1,
0.9580601, -0.4080404, 2.238303, 1, 1, 1, 1, 1,
0.9630738, -0.7103591, 1.880708, 1, 1, 1, 1, 1,
0.9713591, 0.4699559, 1.501386, 1, 1, 1, 1, 1,
0.9722703, 1.557557, -0.5486621, 1, 1, 1, 1, 1,
0.9735391, 2.096653, 0.202788, 1, 1, 1, 1, 1,
0.9786872, 0.02826482, 3.553477, 1, 1, 1, 1, 1,
0.992318, -0.7350857, 1.344104, 1, 1, 1, 1, 1,
0.9945166, 0.2010849, -1.739179, 1, 1, 1, 1, 1,
0.9955004, 0.4767544, -0.2327031, 1, 1, 1, 1, 1,
0.9956039, 0.4008501, 1.016391, 1, 1, 1, 1, 1,
0.99765, 0.8297001, 0.09743, 0, 0, 1, 1, 1,
0.9983766, -1.843403, 2.13137, 1, 0, 0, 1, 1,
0.9991851, -0.814389, 1.568342, 1, 0, 0, 1, 1,
1.000823, 1.074422, 0.2394696, 1, 0, 0, 1, 1,
1.00256, -1.05628, 3.763566, 1, 0, 0, 1, 1,
1.004261, 0.4409742, -0.5252854, 1, 0, 0, 1, 1,
1.004657, 0.7167227, 1.461664, 0, 0, 0, 1, 1,
1.010245, 0.01845862, -0.7653968, 0, 0, 0, 1, 1,
1.011498, -0.3448303, 1.568141, 0, 0, 0, 1, 1,
1.012, 0.5078241, 1.225827, 0, 0, 0, 1, 1,
1.014277, 1.307676, 1.389668, 0, 0, 0, 1, 1,
1.018609, 0.3221532, 2.43518, 0, 0, 0, 1, 1,
1.021243, 0.1724613, 1.073504, 0, 0, 0, 1, 1,
1.027294, 0.3414124, 3.18531, 1, 1, 1, 1, 1,
1.028275, 1.537056, 0.49046, 1, 1, 1, 1, 1,
1.029998, -1.812279, 1.518161, 1, 1, 1, 1, 1,
1.030034, 1.421495, -0.2942574, 1, 1, 1, 1, 1,
1.033811, 0.01053032, 1.535336, 1, 1, 1, 1, 1,
1.041203, 1.107328, 0.9967217, 1, 1, 1, 1, 1,
1.068824, 1.317744, -0.2843288, 1, 1, 1, 1, 1,
1.081894, -0.9514472, 3.227917, 1, 1, 1, 1, 1,
1.083159, 0.9223563, 1.313213, 1, 1, 1, 1, 1,
1.087567, 1.824728, 2.444583, 1, 1, 1, 1, 1,
1.088062, -0.7894343, 3.166773, 1, 1, 1, 1, 1,
1.088416, 0.315263, 1.53239, 1, 1, 1, 1, 1,
1.093626, 1.577008, -0.4874691, 1, 1, 1, 1, 1,
1.102265, -0.2430787, 0.9508193, 1, 1, 1, 1, 1,
1.105646, -0.01523544, 0.7085376, 1, 1, 1, 1, 1,
1.106853, -1.879775, 4.159788, 0, 0, 1, 1, 1,
1.107626, 0.3542797, 1.03924, 1, 0, 0, 1, 1,
1.107743, -0.6446726, 2.890758, 1, 0, 0, 1, 1,
1.109262, 0.5623344, 0.3691735, 1, 0, 0, 1, 1,
1.115762, -1.057216, 0.7185388, 1, 0, 0, 1, 1,
1.123792, -0.6954711, 3.222089, 1, 0, 0, 1, 1,
1.124833, -0.2647346, 1.303952, 0, 0, 0, 1, 1,
1.134659, 0.4197681, 1.569944, 0, 0, 0, 1, 1,
1.138097, 1.466232, 0.4044288, 0, 0, 0, 1, 1,
1.140329, -1.040903, 2.293786, 0, 0, 0, 1, 1,
1.140594, -0.1426466, 2.147079, 0, 0, 0, 1, 1,
1.141791, 0.721499, -0.367482, 0, 0, 0, 1, 1,
1.144944, 0.571983, 1.782816, 0, 0, 0, 1, 1,
1.183065, 0.9904566, 0.7298046, 1, 1, 1, 1, 1,
1.184258, -0.8179159, 1.451566, 1, 1, 1, 1, 1,
1.184931, 1.546684, -0.6528942, 1, 1, 1, 1, 1,
1.18582, 0.4523079, 2.123554, 1, 1, 1, 1, 1,
1.189992, 0.05933826, 0.7614009, 1, 1, 1, 1, 1,
1.190107, -0.8502314, 3.16517, 1, 1, 1, 1, 1,
1.192546, -0.5502008, 4.740978, 1, 1, 1, 1, 1,
1.194463, -0.4811414, 0.8138771, 1, 1, 1, 1, 1,
1.20475, 2.815671, -1.275156, 1, 1, 1, 1, 1,
1.208672, -1.601154, 4.743981, 1, 1, 1, 1, 1,
1.208863, -1.467068, 1.158675, 1, 1, 1, 1, 1,
1.216777, 0.179144, 3.330824, 1, 1, 1, 1, 1,
1.219253, -2.031861, 1.783683, 1, 1, 1, 1, 1,
1.219304, -2.752393, 1.691503, 1, 1, 1, 1, 1,
1.230439, -0.648458, 3.316959, 1, 1, 1, 1, 1,
1.234485, 0.3928045, 0.8496987, 0, 0, 1, 1, 1,
1.235958, 1.150456, 1.487027, 1, 0, 0, 1, 1,
1.239639, 0.3146503, 0.4344167, 1, 0, 0, 1, 1,
1.240873, 2.085257, -1.357223, 1, 0, 0, 1, 1,
1.244311, 1.301981, 0.6389409, 1, 0, 0, 1, 1,
1.251153, -1.376414, 2.586699, 1, 0, 0, 1, 1,
1.263129, 0.7616667, 2.619712, 0, 0, 0, 1, 1,
1.264589, 1.553424, 1.713691, 0, 0, 0, 1, 1,
1.267018, 0.5037168, 0.2295651, 0, 0, 0, 1, 1,
1.276488, 0.1394877, 0.3674584, 0, 0, 0, 1, 1,
1.285185, 0.0002566884, 2.029715, 0, 0, 0, 1, 1,
1.297453, 0.2815171, 3.433329, 0, 0, 0, 1, 1,
1.311386, -0.4475613, 2.783265, 0, 0, 0, 1, 1,
1.319037, 1.144857, -0.2484084, 1, 1, 1, 1, 1,
1.326273, -1.936355, 3.044725, 1, 1, 1, 1, 1,
1.343201, -0.8045119, -0.532447, 1, 1, 1, 1, 1,
1.345335, 0.2654617, 1.523963, 1, 1, 1, 1, 1,
1.348612, 0.04876276, 1.125263, 1, 1, 1, 1, 1,
1.370294, 0.4865059, 1.798516, 1, 1, 1, 1, 1,
1.374692, -0.4479492, 2.74195, 1, 1, 1, 1, 1,
1.377278, -0.9452588, 1.021984, 1, 1, 1, 1, 1,
1.378101, 1.280491, 1.116662, 1, 1, 1, 1, 1,
1.386958, -0.5648681, 1.604098, 1, 1, 1, 1, 1,
1.391498, 0.6522424, 1.683743, 1, 1, 1, 1, 1,
1.411514, 0.2414925, 1.767593, 1, 1, 1, 1, 1,
1.415276, 0.5239713, 1.056671, 1, 1, 1, 1, 1,
1.419777, -0.4343163, 0.3378184, 1, 1, 1, 1, 1,
1.421985, 1.258456, 0.4248539, 1, 1, 1, 1, 1,
1.455073, -1.416129, 1.525292, 0, 0, 1, 1, 1,
1.460772, 0.383861, 1.569536, 1, 0, 0, 1, 1,
1.466992, -0.7055241, 2.700811, 1, 0, 0, 1, 1,
1.470447, -1.106463, 3.855656, 1, 0, 0, 1, 1,
1.476469, 1.283422, 1.427331, 1, 0, 0, 1, 1,
1.479679, 0.9274314, 1.582875, 1, 0, 0, 1, 1,
1.501964, -1.157911, 1.542207, 0, 0, 0, 1, 1,
1.508658, 0.2143976, 1.062577, 0, 0, 0, 1, 1,
1.511017, 0.08834359, 0.8508354, 0, 0, 0, 1, 1,
1.511403, -0.009638743, 3.344162, 0, 0, 0, 1, 1,
1.520876, -1.945571, 0.1163904, 0, 0, 0, 1, 1,
1.526607, -0.8921145, 4.513294, 0, 0, 0, 1, 1,
1.528955, 1.606471, 0.6778699, 0, 0, 0, 1, 1,
1.530297, -1.51683, 1.770036, 1, 1, 1, 1, 1,
1.530517, -0.2264481, -0.9395909, 1, 1, 1, 1, 1,
1.534904, 0.4230307, 2.808954, 1, 1, 1, 1, 1,
1.559456, 0.5125263, 2.183317, 1, 1, 1, 1, 1,
1.572163, -1.810195, 3.660837, 1, 1, 1, 1, 1,
1.572422, 1.717651, 0.7213734, 1, 1, 1, 1, 1,
1.584956, 1.458448, -1.326562, 1, 1, 1, 1, 1,
1.592427, 0.8029304, 1.342214, 1, 1, 1, 1, 1,
1.600578, 1.438352, 0.07022001, 1, 1, 1, 1, 1,
1.600886, -0.9287323, 0.2698637, 1, 1, 1, 1, 1,
1.606053, 0.410882, 2.060162, 1, 1, 1, 1, 1,
1.607607, -1.025697, 2.132767, 1, 1, 1, 1, 1,
1.612153, -0.1724704, 1.040481, 1, 1, 1, 1, 1,
1.618192, 0.60394, 1.745487, 1, 1, 1, 1, 1,
1.620214, -2.168089, 2.087968, 1, 1, 1, 1, 1,
1.631956, 0.7057892, 3.726623, 0, 0, 1, 1, 1,
1.675367, 0.501435, 2.193722, 1, 0, 0, 1, 1,
1.693058, 0.641252, 2.130123, 1, 0, 0, 1, 1,
1.696044, 0.04295528, 2.908751, 1, 0, 0, 1, 1,
1.73415, 1.26129, 0.2857456, 1, 0, 0, 1, 1,
1.735932, 0.795214, 1.137729, 1, 0, 0, 1, 1,
1.740268, 0.009195313, 2.843793, 0, 0, 0, 1, 1,
1.748214, -0.9664754, 2.227069, 0, 0, 0, 1, 1,
1.764291, -0.1619116, 0.290747, 0, 0, 0, 1, 1,
1.777226, 0.3981098, 0.5247045, 0, 0, 0, 1, 1,
1.792255, 0.1101786, 1.620585, 0, 0, 0, 1, 1,
1.797559, -2.535992, 2.450244, 0, 0, 0, 1, 1,
1.80456, 1.097019, 1.733916, 0, 0, 0, 1, 1,
1.806383, -0.1363943, 0.2157949, 1, 1, 1, 1, 1,
1.824427, 0.238048, 3.576754, 1, 1, 1, 1, 1,
1.849742, 0.5098292, 0.366338, 1, 1, 1, 1, 1,
1.85594, -0.451156, 3.011178, 1, 1, 1, 1, 1,
1.874292, -0.7284629, 3.339246, 1, 1, 1, 1, 1,
1.878078, -1.682359, 1.793512, 1, 1, 1, 1, 1,
1.896697, 1.7777, 0.165865, 1, 1, 1, 1, 1,
1.900227, 0.9328846, 0.9768862, 1, 1, 1, 1, 1,
1.963107, -1.686955, 1.247534, 1, 1, 1, 1, 1,
1.970036, -0.02436365, 1.713351, 1, 1, 1, 1, 1,
1.977975, -0.7261114, 2.434812, 1, 1, 1, 1, 1,
2.01809, -0.4679434, 1.076953, 1, 1, 1, 1, 1,
2.019166, 0.113882, 0.9476489, 1, 1, 1, 1, 1,
2.022408, 0.7980692, 1.918888, 1, 1, 1, 1, 1,
2.072636, -0.2628728, 2.704322, 1, 1, 1, 1, 1,
2.110755, -0.3434547, 2.843793, 0, 0, 1, 1, 1,
2.115444, 0.1658707, 1.820499, 1, 0, 0, 1, 1,
2.132264, 0.8139074, 1.063948, 1, 0, 0, 1, 1,
2.176304, 0.8300031, 0.1631075, 1, 0, 0, 1, 1,
2.195472, -0.4857893, 1.498434, 1, 0, 0, 1, 1,
2.199663, 0.1365172, 1.943615, 1, 0, 0, 1, 1,
2.231721, 1.250574, 2.182725, 0, 0, 0, 1, 1,
2.30626, -0.2292991, 0.8685674, 0, 0, 0, 1, 1,
2.312626, 0.02407787, 2.00926, 0, 0, 0, 1, 1,
2.317773, -0.01081751, 1.134349, 0, 0, 0, 1, 1,
2.331069, 1.601841, 0.5755137, 0, 0, 0, 1, 1,
2.335974, 0.08970563, -0.1569316, 0, 0, 0, 1, 1,
2.363843, 0.3639376, 0.9596282, 0, 0, 0, 1, 1,
2.364523, 0.7822788, 1.777184, 1, 1, 1, 1, 1,
2.391646, 1.025879, 1.652887, 1, 1, 1, 1, 1,
2.39581, 0.3855726, 0.1928842, 1, 1, 1, 1, 1,
2.413694, 1.992512, 0.5625353, 1, 1, 1, 1, 1,
2.778059, 0.1153915, 0.7705515, 1, 1, 1, 1, 1,
2.834574, 1.571682, 1.083622, 1, 1, 1, 1, 1,
3.414596, -0.5312994, 0.5212329, 1, 1, 1, 1, 1
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
var radius = 9.665127;
var distance = 33.94835;
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
mvMatrix.translate( -0.2753581, 0.5207394, -0.1736205 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.94835);
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
