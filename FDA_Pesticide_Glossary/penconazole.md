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
-3.425551, -1.095984, -1.941775, 1, 0, 0, 1,
-3.17736, 0.09861923, -2.503054, 1, 0.007843138, 0, 1,
-3.14411, -0.7701077, -0.8555321, 1, 0.01176471, 0, 1,
-3.003702, -1.112486, -2.062539, 1, 0.01960784, 0, 1,
-2.996027, -0.2847118, -3.029169, 1, 0.02352941, 0, 1,
-2.942735, 1.099586, -0.6983991, 1, 0.03137255, 0, 1,
-2.914243, -1.927777, -2.516836, 1, 0.03529412, 0, 1,
-2.816749, 0.3440863, -2.178441, 1, 0.04313726, 0, 1,
-2.801399, -0.2061585, -1.869735, 1, 0.04705882, 0, 1,
-2.348848, -0.1162935, -1.176151, 1, 0.05490196, 0, 1,
-2.319796, 0.5644225, -2.166435, 1, 0.05882353, 0, 1,
-2.269638, -0.0181595, -2.177098, 1, 0.06666667, 0, 1,
-2.196606, 0.06085096, -0.1219504, 1, 0.07058824, 0, 1,
-2.190694, -0.66824, -2.675874, 1, 0.07843138, 0, 1,
-2.189047, -0.6222864, -2.390174, 1, 0.08235294, 0, 1,
-2.186996, -0.3780998, -1.946812, 1, 0.09019608, 0, 1,
-2.122891, 0.5975928, 0.01984687, 1, 0.09411765, 0, 1,
-2.106243, 0.7984356, 0.4508187, 1, 0.1019608, 0, 1,
-2.079898, -1.195624, -2.51527, 1, 0.1098039, 0, 1,
-2.078341, -0.227467, -1.273795, 1, 0.1137255, 0, 1,
-2.050204, 1.780067, -0.9267548, 1, 0.1215686, 0, 1,
-1.960964, -0.03870913, -3.045765, 1, 0.1254902, 0, 1,
-1.944262, 0.5975611, 0.05996769, 1, 0.1333333, 0, 1,
-1.937178, 0.6632242, -1.93126, 1, 0.1372549, 0, 1,
-1.926363, 1.536856, 0.2326761, 1, 0.145098, 0, 1,
-1.923948, -0.6708936, -3.010809, 1, 0.1490196, 0, 1,
-1.909926, -1.112906, -2.900621, 1, 0.1568628, 0, 1,
-1.892349, 0.6699001, -1.819577, 1, 0.1607843, 0, 1,
-1.888179, -0.8991545, -1.713834, 1, 0.1686275, 0, 1,
-1.849766, -1.706553, -3.257703, 1, 0.172549, 0, 1,
-1.82856, 0.5006549, 0.02680594, 1, 0.1803922, 0, 1,
-1.807597, -0.4756739, -1.511459, 1, 0.1843137, 0, 1,
-1.800898, 0.2123202, -1.461877, 1, 0.1921569, 0, 1,
-1.800686, -0.301266, -1.082859, 1, 0.1960784, 0, 1,
-1.792132, 1.344729, -0.617386, 1, 0.2039216, 0, 1,
-1.791406, -0.05235204, -1.728605, 1, 0.2117647, 0, 1,
-1.763149, -0.2261579, -1.277175, 1, 0.2156863, 0, 1,
-1.762126, 2.253128, -1.549219, 1, 0.2235294, 0, 1,
-1.753377, 0.6516185, -2.619557, 1, 0.227451, 0, 1,
-1.751632, -0.301942, -0.5953339, 1, 0.2352941, 0, 1,
-1.740578, 0.1489003, -2.516653, 1, 0.2392157, 0, 1,
-1.734761, -1.021569, -1.547638, 1, 0.2470588, 0, 1,
-1.729537, 1.29054, -1.718079, 1, 0.2509804, 0, 1,
-1.729081, 0.5519641, -0.8168802, 1, 0.2588235, 0, 1,
-1.726902, 0.171273, -2.485297, 1, 0.2627451, 0, 1,
-1.700897, 1.6998, -1.043638, 1, 0.2705882, 0, 1,
-1.698191, -1.298482, -1.964599, 1, 0.2745098, 0, 1,
-1.696747, -0.2334509, -2.128034, 1, 0.282353, 0, 1,
-1.695223, -0.9099758, -1.277184, 1, 0.2862745, 0, 1,
-1.657067, -0.1529884, -1.05533, 1, 0.2941177, 0, 1,
-1.642982, 1.917138, -2.097795, 1, 0.3019608, 0, 1,
-1.632458, 1.026987, 0.5553011, 1, 0.3058824, 0, 1,
-1.630176, -1.556972, -2.344899, 1, 0.3137255, 0, 1,
-1.625503, -1.194827, -3.13007, 1, 0.3176471, 0, 1,
-1.614414, -0.4950158, -2.720268, 1, 0.3254902, 0, 1,
-1.609351, 1.771887, -1.326584, 1, 0.3294118, 0, 1,
-1.608669, 0.2159633, -2.772841, 1, 0.3372549, 0, 1,
-1.598256, -0.3719489, -2.343239, 1, 0.3411765, 0, 1,
-1.593442, -0.5846112, -0.3098587, 1, 0.3490196, 0, 1,
-1.579826, -1.93025, -2.142354, 1, 0.3529412, 0, 1,
-1.574457, -0.7413058, -3.072199, 1, 0.3607843, 0, 1,
-1.562712, -0.6073579, -2.098678, 1, 0.3647059, 0, 1,
-1.554416, -0.001775461, -1.433526, 1, 0.372549, 0, 1,
-1.547034, 1.859477, -0.2258843, 1, 0.3764706, 0, 1,
-1.530776, -0.9363908, -1.851316, 1, 0.3843137, 0, 1,
-1.528951, 0.2632718, -0.2878726, 1, 0.3882353, 0, 1,
-1.525621, -0.4906613, -1.843688, 1, 0.3960784, 0, 1,
-1.511469, 0.04904622, -2.695932, 1, 0.4039216, 0, 1,
-1.511045, -0.6908633, -3.260678, 1, 0.4078431, 0, 1,
-1.507913, -0.4741632, -1.000397, 1, 0.4156863, 0, 1,
-1.495674, 0.0859491, -2.215888, 1, 0.4196078, 0, 1,
-1.49042, 0.4660532, -0.6671922, 1, 0.427451, 0, 1,
-1.489803, 1.524566, -1.604568, 1, 0.4313726, 0, 1,
-1.482792, -0.8442065, -1.845604, 1, 0.4392157, 0, 1,
-1.470513, 0.5799721, -0.8601709, 1, 0.4431373, 0, 1,
-1.464568, -1.733056, -2.082122, 1, 0.4509804, 0, 1,
-1.458398, 1.004561, -2.205868, 1, 0.454902, 0, 1,
-1.455106, -1.385583, -0.3601204, 1, 0.4627451, 0, 1,
-1.454934, -0.5610425, -0.6553048, 1, 0.4666667, 0, 1,
-1.448349, 0.1118917, 0.2751469, 1, 0.4745098, 0, 1,
-1.440037, 0.948384, -0.9426193, 1, 0.4784314, 0, 1,
-1.431199, -0.5623801, -0.3031984, 1, 0.4862745, 0, 1,
-1.429997, 0.2058387, -1.336751, 1, 0.4901961, 0, 1,
-1.421613, 0.7857335, -0.3337734, 1, 0.4980392, 0, 1,
-1.419162, -0.08966332, -1.090616, 1, 0.5058824, 0, 1,
-1.418263, 0.9970556, 0.6990283, 1, 0.509804, 0, 1,
-1.411878, 0.6745584, 0.5848811, 1, 0.5176471, 0, 1,
-1.411735, 1.780286, -0.6348425, 1, 0.5215687, 0, 1,
-1.411363, -1.86215, -2.393588, 1, 0.5294118, 0, 1,
-1.410028, 0.2748789, -0.5163739, 1, 0.5333334, 0, 1,
-1.403599, -0.4665692, -1.689365, 1, 0.5411765, 0, 1,
-1.397938, 0.1341844, -0.1905142, 1, 0.5450981, 0, 1,
-1.397527, -1.569881, -2.02449, 1, 0.5529412, 0, 1,
-1.37982, -0.4100088, -0.546075, 1, 0.5568628, 0, 1,
-1.375192, -0.2253678, -0.890227, 1, 0.5647059, 0, 1,
-1.370535, 0.3272881, -4.232649, 1, 0.5686275, 0, 1,
-1.368822, 1.0027, -0.2668106, 1, 0.5764706, 0, 1,
-1.362556, -0.9641717, -0.8538028, 1, 0.5803922, 0, 1,
-1.360105, 0.2223451, -1.559871, 1, 0.5882353, 0, 1,
-1.344897, 0.5451564, -2.536441, 1, 0.5921569, 0, 1,
-1.340425, -0.08154014, -2.125834, 1, 0.6, 0, 1,
-1.338994, -0.2692026, -2.126732, 1, 0.6078432, 0, 1,
-1.335715, 0.3481455, -2.348826, 1, 0.6117647, 0, 1,
-1.334903, -1.670921, -2.578526, 1, 0.6196079, 0, 1,
-1.322635, -0.07510393, -2.7399, 1, 0.6235294, 0, 1,
-1.31852, -0.6579543, -2.671999, 1, 0.6313726, 0, 1,
-1.318241, 1.826682, -0.1933424, 1, 0.6352941, 0, 1,
-1.314929, -1.043498, -2.984972, 1, 0.6431373, 0, 1,
-1.311983, -0.9984804, -1.434183, 1, 0.6470588, 0, 1,
-1.307032, 0.4507374, -1.532947, 1, 0.654902, 0, 1,
-1.292591, -0.5494476, -2.903209, 1, 0.6588235, 0, 1,
-1.29145, 0.977295, -1.784184, 1, 0.6666667, 0, 1,
-1.272755, -0.630154, -3.502408, 1, 0.6705883, 0, 1,
-1.266891, 0.7312155, -1.621703, 1, 0.6784314, 0, 1,
-1.26045, 0.7949602, -1.223422, 1, 0.682353, 0, 1,
-1.251432, -0.2956635, -1.110739, 1, 0.6901961, 0, 1,
-1.245977, 0.375226, -1.080169, 1, 0.6941177, 0, 1,
-1.227206, -0.6652421, -3.122735, 1, 0.7019608, 0, 1,
-1.222716, 1.471501, -0.7693952, 1, 0.7098039, 0, 1,
-1.220806, 0.4308375, -1.548479, 1, 0.7137255, 0, 1,
-1.2187, -0.9454234, -1.350994, 1, 0.7215686, 0, 1,
-1.214147, 0.9834155, 1.036436, 1, 0.7254902, 0, 1,
-1.200514, 1.098493, -0.5318037, 1, 0.7333333, 0, 1,
-1.195571, -1.655453, -3.590012, 1, 0.7372549, 0, 1,
-1.194868, 0.6708234, -1.095107, 1, 0.7450981, 0, 1,
-1.193408, -0.5928153, -0.502926, 1, 0.7490196, 0, 1,
-1.188629, 1.351104, 1.046324, 1, 0.7568628, 0, 1,
-1.187923, 0.2887903, -1.545884, 1, 0.7607843, 0, 1,
-1.177294, 0.6394005, -2.919739, 1, 0.7686275, 0, 1,
-1.172453, -0.5083864, -1.43788, 1, 0.772549, 0, 1,
-1.172154, -1.029894, -2.455646, 1, 0.7803922, 0, 1,
-1.165466, -1.675814, -3.615289, 1, 0.7843137, 0, 1,
-1.16288, 0.2928437, -0.1523386, 1, 0.7921569, 0, 1,
-1.149797, 0.6225673, -0.8591369, 1, 0.7960784, 0, 1,
-1.149281, 1.882249, -0.8109199, 1, 0.8039216, 0, 1,
-1.144375, 0.8116785, -0.167007, 1, 0.8117647, 0, 1,
-1.126975, -1.001777, -1.276981, 1, 0.8156863, 0, 1,
-1.119804, 0.9479775, -1.09745, 1, 0.8235294, 0, 1,
-1.107227, -0.1690281, -2.304946, 1, 0.827451, 0, 1,
-1.10425, -1.468403, -1.511549, 1, 0.8352941, 0, 1,
-1.100198, -1.054384, -3.219324, 1, 0.8392157, 0, 1,
-1.095032, -0.6941884, -1.21827, 1, 0.8470588, 0, 1,
-1.093774, 0.01603307, -2.118108, 1, 0.8509804, 0, 1,
-1.088968, 0.4259578, -0.9360006, 1, 0.8588235, 0, 1,
-1.066882, -1.686704, -2.804329, 1, 0.8627451, 0, 1,
-1.06205, -0.2377845, -1.02535, 1, 0.8705882, 0, 1,
-1.061898, -1.586264, -2.106468, 1, 0.8745098, 0, 1,
-1.050704, -1.803787, -1.901224, 1, 0.8823529, 0, 1,
-1.050251, 0.5149958, -0.6902298, 1, 0.8862745, 0, 1,
-1.045014, 0.1922563, -1.512436, 1, 0.8941177, 0, 1,
-1.035247, 1.280338, 0.7837151, 1, 0.8980392, 0, 1,
-1.026285, -0.1554384, -1.939041, 1, 0.9058824, 0, 1,
-1.024329, -0.8327292, -0.4126019, 1, 0.9137255, 0, 1,
-1.024011, 9.618754e-06, -1.049194, 1, 0.9176471, 0, 1,
-1.021243, -0.8603169, -2.407745, 1, 0.9254902, 0, 1,
-1.020887, -0.8437583, -1.834711, 1, 0.9294118, 0, 1,
-1.01371, 0.2028214, -1.760522, 1, 0.9372549, 0, 1,
-1.01042, 1.003922, -1.402293, 1, 0.9411765, 0, 1,
-1.007466, 0.3397461, -1.303912, 1, 0.9490196, 0, 1,
-1.001823, -0.08821884, -3.214506, 1, 0.9529412, 0, 1,
-0.9947315, 1.274122, -1.655331, 1, 0.9607843, 0, 1,
-0.9902197, -0.8543628, -1.77174, 1, 0.9647059, 0, 1,
-0.990131, -0.07948646, -1.916095, 1, 0.972549, 0, 1,
-0.9868296, -0.1513339, -1.099761, 1, 0.9764706, 0, 1,
-0.9827343, 1.747162, -0.8674678, 1, 0.9843137, 0, 1,
-0.9788716, 0.520464, -2.743034, 1, 0.9882353, 0, 1,
-0.9758792, 1.322106, -1.273504, 1, 0.9960784, 0, 1,
-0.9740263, 1.793849, 0.77909, 0.9960784, 1, 0, 1,
-0.9729876, 0.2659344, -2.090761, 0.9921569, 1, 0, 1,
-0.9690443, 0.1548752, -2.500173, 0.9843137, 1, 0, 1,
-0.9682304, -0.9253768, -2.471323, 0.9803922, 1, 0, 1,
-0.9637361, 0.7732642, 0.6963098, 0.972549, 1, 0, 1,
-0.9622006, -0.05848642, -3.606347, 0.9686275, 1, 0, 1,
-0.9531432, 0.7489502, -0.6026337, 0.9607843, 1, 0, 1,
-0.9506876, 1.559769, -0.3593453, 0.9568627, 1, 0, 1,
-0.9506094, 0.3308261, 0.7553521, 0.9490196, 1, 0, 1,
-0.9476174, -0.9387406, -2.417798, 0.945098, 1, 0, 1,
-0.943739, -0.5676894, -1.966591, 0.9372549, 1, 0, 1,
-0.9428037, -1.095072, -0.8591136, 0.9333333, 1, 0, 1,
-0.941941, -1.338634, -1.868783, 0.9254902, 1, 0, 1,
-0.9350703, 0.9731451, -0.886592, 0.9215686, 1, 0, 1,
-0.929861, -1.768983, -3.177765, 0.9137255, 1, 0, 1,
-0.928035, -1.194835, -3.177599, 0.9098039, 1, 0, 1,
-0.9267934, 1.090006, -0.02225056, 0.9019608, 1, 0, 1,
-0.9206365, -2.16003, -4.157917, 0.8941177, 1, 0, 1,
-0.9196828, 2.424721, -0.1692528, 0.8901961, 1, 0, 1,
-0.9195923, -0.9008291, -2.109384, 0.8823529, 1, 0, 1,
-0.9073125, -0.4634355, -3.159491, 0.8784314, 1, 0, 1,
-0.902232, -0.1049393, -0.584475, 0.8705882, 1, 0, 1,
-0.8971794, 0.5339016, -0.7527765, 0.8666667, 1, 0, 1,
-0.8890103, -0.914299, -2.173289, 0.8588235, 1, 0, 1,
-0.8868233, 0.3595619, -0.2588121, 0.854902, 1, 0, 1,
-0.8816506, -1.595719, -4.222701, 0.8470588, 1, 0, 1,
-0.8760987, 0.6027406, -1.159528, 0.8431373, 1, 0, 1,
-0.867457, 0.4744034, -3.637336, 0.8352941, 1, 0, 1,
-0.8644793, 0.05374439, -2.05965, 0.8313726, 1, 0, 1,
-0.8634997, 1.579738, -0.7328629, 0.8235294, 1, 0, 1,
-0.8627541, 0.8508882, -2.445925, 0.8196079, 1, 0, 1,
-0.8605781, -1.962368, -1.71277, 0.8117647, 1, 0, 1,
-0.8524233, -0.5370336, -1.877639, 0.8078431, 1, 0, 1,
-0.8350619, 0.3288159, -2.349308, 0.8, 1, 0, 1,
-0.8325083, 1.070742, -2.708106, 0.7921569, 1, 0, 1,
-0.8248802, 1.19532, -1.401224, 0.7882353, 1, 0, 1,
-0.8235821, 1.738933, -0.7749125, 0.7803922, 1, 0, 1,
-0.8233331, -1.432655, -1.638769, 0.7764706, 1, 0, 1,
-0.8232905, -1.691978, -0.8945117, 0.7686275, 1, 0, 1,
-0.8165466, 1.445096, 0.5730923, 0.7647059, 1, 0, 1,
-0.8126819, 1.023204, 0.1884476, 0.7568628, 1, 0, 1,
-0.8092844, -0.3716551, -0.8022326, 0.7529412, 1, 0, 1,
-0.8011143, -0.328467, -1.359965, 0.7450981, 1, 0, 1,
-0.7972357, -1.558736, 0.264151, 0.7411765, 1, 0, 1,
-0.7952273, -0.8573606, -1.44821, 0.7333333, 1, 0, 1,
-0.7947032, 1.140154, 0.4028431, 0.7294118, 1, 0, 1,
-0.7925141, 1.625193, -0.6911802, 0.7215686, 1, 0, 1,
-0.792193, 0.8869332, -0.5820614, 0.7176471, 1, 0, 1,
-0.7861478, 1.141262, -0.4467385, 0.7098039, 1, 0, 1,
-0.7859278, -0.7737069, -2.830544, 0.7058824, 1, 0, 1,
-0.7842286, 1.687057, -1.498502, 0.6980392, 1, 0, 1,
-0.774178, 0.2564061, -0.4919582, 0.6901961, 1, 0, 1,
-0.7578449, -0.4784448, -1.932914, 0.6862745, 1, 0, 1,
-0.7429354, -1.206444, -2.606449, 0.6784314, 1, 0, 1,
-0.7401394, -1.25291, -2.321105, 0.6745098, 1, 0, 1,
-0.7400476, -0.501106, -3.445636, 0.6666667, 1, 0, 1,
-0.7381769, 0.2997257, -0.3528467, 0.6627451, 1, 0, 1,
-0.7374789, -1.974058, -2.161813, 0.654902, 1, 0, 1,
-0.7373129, -0.3104759, -3.6911, 0.6509804, 1, 0, 1,
-0.736998, 1.499828, -2.352782, 0.6431373, 1, 0, 1,
-0.7330325, -0.7561649, -3.783902, 0.6392157, 1, 0, 1,
-0.7322628, -0.1642386, -2.470094, 0.6313726, 1, 0, 1,
-0.7291664, 0.3700255, -0.3593491, 0.627451, 1, 0, 1,
-0.7248486, -0.5699501, -0.6290159, 0.6196079, 1, 0, 1,
-0.7242514, 0.003411096, -0.3616347, 0.6156863, 1, 0, 1,
-0.7171776, 1.215732, -1.318076, 0.6078432, 1, 0, 1,
-0.7157266, 0.03746411, -1.90216, 0.6039216, 1, 0, 1,
-0.7078606, -0.5703349, -4.617381, 0.5960785, 1, 0, 1,
-0.7072977, -0.08480012, -0.9549177, 0.5882353, 1, 0, 1,
-0.7052766, -1.141262, -1.708677, 0.5843138, 1, 0, 1,
-0.70423, -0.7378979, -2.099606, 0.5764706, 1, 0, 1,
-0.7033905, -1.338476, -1.925987, 0.572549, 1, 0, 1,
-0.7022925, 0.3779234, -1.900012, 0.5647059, 1, 0, 1,
-0.7012453, 1.037978, 0.3815888, 0.5607843, 1, 0, 1,
-0.696586, 0.3051343, -1.478375, 0.5529412, 1, 0, 1,
-0.6963159, -1.104227, -1.460358, 0.5490196, 1, 0, 1,
-0.694782, -1.04919, -2.856194, 0.5411765, 1, 0, 1,
-0.691415, -0.4397216, -1.70583, 0.5372549, 1, 0, 1,
-0.6814938, 0.3546994, -1.57148, 0.5294118, 1, 0, 1,
-0.6772625, -0.9575496, -1.346593, 0.5254902, 1, 0, 1,
-0.6755057, -1.081091, -2.489464, 0.5176471, 1, 0, 1,
-0.6688417, 0.50405, -0.9307166, 0.5137255, 1, 0, 1,
-0.6662344, 0.5453616, -1.855274, 0.5058824, 1, 0, 1,
-0.6652665, -0.7333319, -3.423021, 0.5019608, 1, 0, 1,
-0.6620231, 1.630385, 1.185674, 0.4941176, 1, 0, 1,
-0.6617625, -0.9073141, -1.872925, 0.4862745, 1, 0, 1,
-0.6567038, -0.04335862, -1.646466, 0.4823529, 1, 0, 1,
-0.6543993, -0.5686033, -1.28796, 0.4745098, 1, 0, 1,
-0.6506896, -0.157039, -2.480786, 0.4705882, 1, 0, 1,
-0.6447408, 0.798889, -2.353281, 0.4627451, 1, 0, 1,
-0.6382275, 0.1545254, -1.466412, 0.4588235, 1, 0, 1,
-0.6356094, 1.130235, -0.3146622, 0.4509804, 1, 0, 1,
-0.6304995, 0.07897601, -0.7022852, 0.4470588, 1, 0, 1,
-0.6302443, -0.7668918, -3.399479, 0.4392157, 1, 0, 1,
-0.6296298, -0.1066699, -0.6343479, 0.4352941, 1, 0, 1,
-0.6280138, -0.7999671, -2.780901, 0.427451, 1, 0, 1,
-0.6269607, -0.433133, -2.12534, 0.4235294, 1, 0, 1,
-0.6193587, 1.436047, 0.725709, 0.4156863, 1, 0, 1,
-0.6193476, 1.203068, -0.1759008, 0.4117647, 1, 0, 1,
-0.6181544, -0.7344615, -2.442708, 0.4039216, 1, 0, 1,
-0.6140499, 1.716279, -0.1142439, 0.3960784, 1, 0, 1,
-0.6095041, -1.001317, -2.833196, 0.3921569, 1, 0, 1,
-0.6069378, 0.001082993, -0.4854525, 0.3843137, 1, 0, 1,
-0.6017354, -1.074065, -2.467897, 0.3803922, 1, 0, 1,
-0.5958982, 0.1773726, -2.629913, 0.372549, 1, 0, 1,
-0.590792, 0.6046671, -0.3957532, 0.3686275, 1, 0, 1,
-0.5891176, -0.5586595, -2.267143, 0.3607843, 1, 0, 1,
-0.5887083, -0.323023, -2.661845, 0.3568628, 1, 0, 1,
-0.5857921, -1.594489, -3.057511, 0.3490196, 1, 0, 1,
-0.5856652, 0.9971175, -0.2745454, 0.345098, 1, 0, 1,
-0.5851699, -0.3920599, -2.273884, 0.3372549, 1, 0, 1,
-0.5791051, -0.09161579, -2.448964, 0.3333333, 1, 0, 1,
-0.5753781, 0.9396217, 1.507655, 0.3254902, 1, 0, 1,
-0.568637, -1.75287, -2.645055, 0.3215686, 1, 0, 1,
-0.5660212, 0.7272801, -0.5204381, 0.3137255, 1, 0, 1,
-0.5641037, 0.1573561, -1.915772, 0.3098039, 1, 0, 1,
-0.5559053, -0.6094137, -4.148509, 0.3019608, 1, 0, 1,
-0.5553893, 1.133337, -0.7577512, 0.2941177, 1, 0, 1,
-0.5547802, 0.8652384, 0.2024928, 0.2901961, 1, 0, 1,
-0.5519612, 0.4022939, -2.532845, 0.282353, 1, 0, 1,
-0.5483707, 0.1079356, -0.1248544, 0.2784314, 1, 0, 1,
-0.5409835, -0.3671151, -2.170183, 0.2705882, 1, 0, 1,
-0.5378733, 0.3945889, -2.291411, 0.2666667, 1, 0, 1,
-0.5359277, -1.195321, -2.146461, 0.2588235, 1, 0, 1,
-0.5354853, -0.8087512, -1.872886, 0.254902, 1, 0, 1,
-0.5292791, 0.4876785, -2.440523, 0.2470588, 1, 0, 1,
-0.5235913, -0.167414, -1.571059, 0.2431373, 1, 0, 1,
-0.5231112, -1.06068, -4.46355, 0.2352941, 1, 0, 1,
-0.5128425, -0.7724056, -3.371976, 0.2313726, 1, 0, 1,
-0.5094557, 0.6180886, -0.4773671, 0.2235294, 1, 0, 1,
-0.5068021, -0.08844724, -2.503085, 0.2196078, 1, 0, 1,
-0.505272, 0.1705473, -1.072962, 0.2117647, 1, 0, 1,
-0.5026989, -1.497542, -2.186132, 0.2078431, 1, 0, 1,
-0.499091, 1.140954, 0.7689936, 0.2, 1, 0, 1,
-0.4957358, 0.080117, -2.797408, 0.1921569, 1, 0, 1,
-0.4910143, 1.239423, -0.3995289, 0.1882353, 1, 0, 1,
-0.4909808, 1.300021, 0.6015049, 0.1803922, 1, 0, 1,
-0.4892957, 0.41048, -0.9973863, 0.1764706, 1, 0, 1,
-0.4764558, -0.2918667, -2.213306, 0.1686275, 1, 0, 1,
-0.4753745, -1.029961, -1.900146, 0.1647059, 1, 0, 1,
-0.4728041, 0.5967216, -0.6690241, 0.1568628, 1, 0, 1,
-0.4691367, 0.6314444, 0.5864719, 0.1529412, 1, 0, 1,
-0.4672185, 0.9756452, -0.9919876, 0.145098, 1, 0, 1,
-0.4649277, 0.0002850352, -3.742656, 0.1411765, 1, 0, 1,
-0.4621555, 0.6053543, 0.3984296, 0.1333333, 1, 0, 1,
-0.4619131, -1.291629, -4.480237, 0.1294118, 1, 0, 1,
-0.4487838, -1.190235, -3.010475, 0.1215686, 1, 0, 1,
-0.4476514, -0.1707226, -1.401213, 0.1176471, 1, 0, 1,
-0.4451997, -0.6217381, -3.595258, 0.1098039, 1, 0, 1,
-0.4430793, 0.6592624, -0.6827928, 0.1058824, 1, 0, 1,
-0.4417897, 0.4345196, -0.8833839, 0.09803922, 1, 0, 1,
-0.4413941, 1.287289, -1.01168, 0.09019608, 1, 0, 1,
-0.4403636, 0.5851077, -1.369718, 0.08627451, 1, 0, 1,
-0.438885, -0.2964552, -2.121026, 0.07843138, 1, 0, 1,
-0.4356585, -0.1412595, -3.124324, 0.07450981, 1, 0, 1,
-0.4312096, 0.7531123, -0.4909696, 0.06666667, 1, 0, 1,
-0.4270649, -0.4437749, -1.74745, 0.0627451, 1, 0, 1,
-0.4267883, 1.317873, 0.2303931, 0.05490196, 1, 0, 1,
-0.4238877, -1.054254, -1.944943, 0.05098039, 1, 0, 1,
-0.4182469, 0.2315139, -0.7865315, 0.04313726, 1, 0, 1,
-0.4168178, 0.5767387, -0.6797881, 0.03921569, 1, 0, 1,
-0.4132738, -0.658697, -1.527519, 0.03137255, 1, 0, 1,
-0.4125156, -1.011713, -2.690395, 0.02745098, 1, 0, 1,
-0.4112613, -1.734657, -3.938845, 0.01960784, 1, 0, 1,
-0.4102819, -0.2964594, -1.093205, 0.01568628, 1, 0, 1,
-0.4097591, -0.997724, -3.745133, 0.007843138, 1, 0, 1,
-0.4086218, -0.3836355, -1.534295, 0.003921569, 1, 0, 1,
-0.4085017, 0.2829458, -0.8581154, 0, 1, 0.003921569, 1,
-0.4073294, -0.2506276, -1.872157, 0, 1, 0.01176471, 1,
-0.4068853, 0.6334203, -1.482326, 0, 1, 0.01568628, 1,
-0.4049335, -1.963145, -3.756846, 0, 1, 0.02352941, 1,
-0.4046284, -0.7254614, -3.153889, 0, 1, 0.02745098, 1,
-0.4041111, -0.07110664, 0.1476546, 0, 1, 0.03529412, 1,
-0.3939488, 1.006812, -0.5843942, 0, 1, 0.03921569, 1,
-0.3874774, 0.7674775, 0.3285599, 0, 1, 0.04705882, 1,
-0.3853204, -1.721045, -2.385396, 0, 1, 0.05098039, 1,
-0.3809284, 0.4228246, 1.690725, 0, 1, 0.05882353, 1,
-0.3719062, -0.194386, -1.681136, 0, 1, 0.0627451, 1,
-0.3705477, 0.2901461, -0.2145228, 0, 1, 0.07058824, 1,
-0.3668018, 1.359621, 0.1015576, 0, 1, 0.07450981, 1,
-0.3663875, 0.0194477, -1.977856, 0, 1, 0.08235294, 1,
-0.3661695, 0.01138602, -1.2539, 0, 1, 0.08627451, 1,
-0.3637353, 0.1495068, -1.048695, 0, 1, 0.09411765, 1,
-0.3596692, -0.7823205, -4.055555, 0, 1, 0.1019608, 1,
-0.359378, 1.191568, 0.1467379, 0, 1, 0.1058824, 1,
-0.3592034, 1.279615, 1.415631, 0, 1, 0.1137255, 1,
-0.3568324, -2.049843, -2.899314, 0, 1, 0.1176471, 1,
-0.3553532, -0.5181789, -3.052402, 0, 1, 0.1254902, 1,
-0.3517947, -0.7285122, -2.701706, 0, 1, 0.1294118, 1,
-0.3505404, -1.425641, -2.259185, 0, 1, 0.1372549, 1,
-0.3490206, -1.088109, -3.892939, 0, 1, 0.1411765, 1,
-0.3411418, 1.509333, -0.2039869, 0, 1, 0.1490196, 1,
-0.3386222, -0.1794477, -2.671851, 0, 1, 0.1529412, 1,
-0.3319282, 0.785722, -2.07984, 0, 1, 0.1607843, 1,
-0.3307818, 1.183338, 1.001428, 0, 1, 0.1647059, 1,
-0.3285604, -0.4364587, -2.425352, 0, 1, 0.172549, 1,
-0.3262133, 0.3962096, -0.9138331, 0, 1, 0.1764706, 1,
-0.3260735, -0.6551443, -4.59922, 0, 1, 0.1843137, 1,
-0.3182681, -0.9430157, -1.517013, 0, 1, 0.1882353, 1,
-0.3143102, 1.285186, -1.892505, 0, 1, 0.1960784, 1,
-0.3138651, -1.312846, -3.069482, 0, 1, 0.2039216, 1,
-0.313855, 1.765855, -1.028064, 0, 1, 0.2078431, 1,
-0.3116676, 1.133333, -0.6244979, 0, 1, 0.2156863, 1,
-0.3106915, -0.02870493, -0.5703782, 0, 1, 0.2196078, 1,
-0.3076496, -0.8762613, -1.780841, 0, 1, 0.227451, 1,
-0.30494, -0.1645834, -2.306103, 0, 1, 0.2313726, 1,
-0.3032215, -1.004599, -2.141599, 0, 1, 0.2392157, 1,
-0.2979088, -1.099493, -4.631993, 0, 1, 0.2431373, 1,
-0.2978823, -0.6680639, -4.810361, 0, 1, 0.2509804, 1,
-0.2923984, 0.1462467, -0.9796664, 0, 1, 0.254902, 1,
-0.2902946, 0.3324001, -0.5920291, 0, 1, 0.2627451, 1,
-0.2890754, -0.2221601, -2.41543, 0, 1, 0.2666667, 1,
-0.2889224, -2.034953, -2.848524, 0, 1, 0.2745098, 1,
-0.2878211, -1.026176, -2.359718, 0, 1, 0.2784314, 1,
-0.2876646, 0.203116, -2.334991, 0, 1, 0.2862745, 1,
-0.2825599, 0.6386365, -0.3356282, 0, 1, 0.2901961, 1,
-0.2809302, -0.2160766, -2.875357, 0, 1, 0.2980392, 1,
-0.280433, -0.05297715, -1.126432, 0, 1, 0.3058824, 1,
-0.2731822, 0.02914618, -1.228053, 0, 1, 0.3098039, 1,
-0.2709124, -0.1749022, -0.6132128, 0, 1, 0.3176471, 1,
-0.2675509, 1.346384, -0.5635482, 0, 1, 0.3215686, 1,
-0.265369, 0.8698068, 1.245462, 0, 1, 0.3294118, 1,
-0.2647094, -0.7765175, -1.651632, 0, 1, 0.3333333, 1,
-0.2503631, -0.5395482, -3.684596, 0, 1, 0.3411765, 1,
-0.2462749, 0.8358713, -0.9296307, 0, 1, 0.345098, 1,
-0.245727, -0.305064, -3.390606, 0, 1, 0.3529412, 1,
-0.2430285, -0.5586637, -1.529472, 0, 1, 0.3568628, 1,
-0.2424878, -0.02192649, -1.282997, 0, 1, 0.3647059, 1,
-0.2385378, -0.09921373, -0.8696399, 0, 1, 0.3686275, 1,
-0.2376116, 0.7857266, 0.2507167, 0, 1, 0.3764706, 1,
-0.237609, 0.07940122, -2.122834, 0, 1, 0.3803922, 1,
-0.2364376, -1.100445, -3.805132, 0, 1, 0.3882353, 1,
-0.2360533, 2.143407, -0.468391, 0, 1, 0.3921569, 1,
-0.2356107, -0.1129667, -2.14375, 0, 1, 0.4, 1,
-0.23375, 0.5958672, 1.349208, 0, 1, 0.4078431, 1,
-0.2313183, 1.090774, -0.6588986, 0, 1, 0.4117647, 1,
-0.2271771, -0.1655685, -1.788702, 0, 1, 0.4196078, 1,
-0.217767, 0.1028757, -2.113539, 0, 1, 0.4235294, 1,
-0.2177047, 1.140038, 0.1021244, 0, 1, 0.4313726, 1,
-0.2125795, 0.7675313, -0.9597677, 0, 1, 0.4352941, 1,
-0.2077166, -0.5118482, -1.834874, 0, 1, 0.4431373, 1,
-0.2066327, -0.02408568, -0.794196, 0, 1, 0.4470588, 1,
-0.2046767, 1.927835, 0.7335962, 0, 1, 0.454902, 1,
-0.2027885, -0.4687621, -2.956086, 0, 1, 0.4588235, 1,
-0.2000718, 1.4402, 0.6635666, 0, 1, 0.4666667, 1,
-0.196803, -1.29962, -4.432264, 0, 1, 0.4705882, 1,
-0.1954311, 0.02720786, -0.9991128, 0, 1, 0.4784314, 1,
-0.1935661, -0.5647658, -1.59024, 0, 1, 0.4823529, 1,
-0.1914938, 0.6736386, -0.3453407, 0, 1, 0.4901961, 1,
-0.1852952, 0.3030098, -2.120378, 0, 1, 0.4941176, 1,
-0.1736561, 0.224973, 0.5496063, 0, 1, 0.5019608, 1,
-0.1688161, 1.920012, 0.6797413, 0, 1, 0.509804, 1,
-0.162346, 0.9600228, -3.358212, 0, 1, 0.5137255, 1,
-0.1523271, -1.150165, -3.864883, 0, 1, 0.5215687, 1,
-0.1517728, -0.9184104, -3.552624, 0, 1, 0.5254902, 1,
-0.1499122, -0.5847861, -2.828686, 0, 1, 0.5333334, 1,
-0.1496609, -0.188482, -2.102331, 0, 1, 0.5372549, 1,
-0.1489386, 0.4255791, -2.978014, 0, 1, 0.5450981, 1,
-0.145746, -0.5899692, -1.727621, 0, 1, 0.5490196, 1,
-0.1456931, -0.7180631, -2.215527, 0, 1, 0.5568628, 1,
-0.1399405, -1.068919, -3.234126, 0, 1, 0.5607843, 1,
-0.134624, -1.201935, -2.588474, 0, 1, 0.5686275, 1,
-0.1330136, 2.183144, 0.2212331, 0, 1, 0.572549, 1,
-0.1311312, -0.1144005, -2.956434, 0, 1, 0.5803922, 1,
-0.1236361, -0.2968481, -3.279171, 0, 1, 0.5843138, 1,
-0.1219729, -1.360163, -3.224298, 0, 1, 0.5921569, 1,
-0.1201524, 1.788343, -0.2651422, 0, 1, 0.5960785, 1,
-0.119952, -1.498559, -4.097973, 0, 1, 0.6039216, 1,
-0.1184022, 0.1769385, -0.694331, 0, 1, 0.6117647, 1,
-0.1175839, -1.367222, -3.253774, 0, 1, 0.6156863, 1,
-0.1154688, -0.4396335, -5.162944, 0, 1, 0.6235294, 1,
-0.1142555, -2.251324, -2.924323, 0, 1, 0.627451, 1,
-0.1121813, 0.1949569, -1.12866, 0, 1, 0.6352941, 1,
-0.1119899, 1.182465, 0.2725204, 0, 1, 0.6392157, 1,
-0.1118464, -0.6281934, -2.738517, 0, 1, 0.6470588, 1,
-0.1114065, 0.8003492, -1.019301, 0, 1, 0.6509804, 1,
-0.1113591, -0.3617338, -2.071246, 0, 1, 0.6588235, 1,
-0.1111793, 2.092884, -0.6596647, 0, 1, 0.6627451, 1,
-0.1109712, 0.1100618, 2.343103, 0, 1, 0.6705883, 1,
-0.1103356, -0.2901694, -2.454907, 0, 1, 0.6745098, 1,
-0.1101296, -1.495903, -3.10813, 0, 1, 0.682353, 1,
-0.1089569, 1.558543, 0.1764065, 0, 1, 0.6862745, 1,
-0.108932, 1.607918, 0.3759435, 0, 1, 0.6941177, 1,
-0.1061993, -1.591265, -4.95338, 0, 1, 0.7019608, 1,
-0.1043076, 1.059331, 1.950422, 0, 1, 0.7058824, 1,
-0.1035305, 0.4481136, 0.2572443, 0, 1, 0.7137255, 1,
-0.1025479, 0.03638063, -0.4718184, 0, 1, 0.7176471, 1,
-0.0923062, -0.2264964, -2.538424, 0, 1, 0.7254902, 1,
-0.08738577, -0.5613788, -3.103438, 0, 1, 0.7294118, 1,
-0.08578888, -0.2870938, -2.822426, 0, 1, 0.7372549, 1,
-0.0795393, 0.6900498, -1.116522, 0, 1, 0.7411765, 1,
-0.07622863, -0.181794, -1.432265, 0, 1, 0.7490196, 1,
-0.07275276, 0.2762827, -0.528771, 0, 1, 0.7529412, 1,
-0.06541169, -0.4621318, -1.110676, 0, 1, 0.7607843, 1,
-0.05904372, -0.6838443, -2.248984, 0, 1, 0.7647059, 1,
-0.05887, -1.204774, -4.204825, 0, 1, 0.772549, 1,
-0.05580322, -0.8863816, -3.531316, 0, 1, 0.7764706, 1,
-0.05466807, 2.09275, 0.2073758, 0, 1, 0.7843137, 1,
-0.05421119, 0.5546423, -0.2107571, 0, 1, 0.7882353, 1,
-0.05181111, -0.5396051, -3.754759, 0, 1, 0.7960784, 1,
-0.0512419, -1.543331, -1.87421, 0, 1, 0.8039216, 1,
-0.05017715, -0.230746, -5.175826, 0, 1, 0.8078431, 1,
-0.04687623, -0.3872569, -3.599267, 0, 1, 0.8156863, 1,
-0.04681731, -0.8331929, -3.227713, 0, 1, 0.8196079, 1,
-0.04031826, 1.383874, -1.028956, 0, 1, 0.827451, 1,
-0.0389588, -1.314129, -4.553805, 0, 1, 0.8313726, 1,
-0.03660681, 0.2475598, -0.007975642, 0, 1, 0.8392157, 1,
-0.03472739, 1.164562, 0.1626013, 0, 1, 0.8431373, 1,
-0.03105827, -0.7849028, -2.886631, 0, 1, 0.8509804, 1,
-0.03017061, 0.847379, 0.6211723, 0, 1, 0.854902, 1,
-0.02852957, -0.5778507, -3.124366, 0, 1, 0.8627451, 1,
-0.02828269, -0.4459228, -3.018088, 0, 1, 0.8666667, 1,
-0.02682386, 0.6423984, 1.413423, 0, 1, 0.8745098, 1,
-0.02621118, -0.6014995, -2.012719, 0, 1, 0.8784314, 1,
-0.02416016, 0.3835447, 0.2447817, 0, 1, 0.8862745, 1,
-0.02142649, -0.5152448, -2.834928, 0, 1, 0.8901961, 1,
-0.02011464, 0.825474, 0.03451799, 0, 1, 0.8980392, 1,
-0.01811544, 1.893479, 2.555783, 0, 1, 0.9058824, 1,
-0.01781009, -0.4611013, -2.29363, 0, 1, 0.9098039, 1,
-0.01528113, 0.7097467, -0.1776416, 0, 1, 0.9176471, 1,
-0.01468809, 0.5756327, 0.8934681, 0, 1, 0.9215686, 1,
-0.01376783, 1.488808, 1.236806, 0, 1, 0.9294118, 1,
-0.01330935, -0.05178253, -1.87779, 0, 1, 0.9333333, 1,
-0.007076832, 0.5068032, -0.9392874, 0, 1, 0.9411765, 1,
-0.006068616, -0.3731242, -3.366436, 0, 1, 0.945098, 1,
0.003925754, 1.022887, 1.690862, 0, 1, 0.9529412, 1,
0.007344622, 0.05685095, 2.164837, 0, 1, 0.9568627, 1,
0.01096002, -0.4229766, 4.211706, 0, 1, 0.9647059, 1,
0.0127792, 0.2090622, 0.5551465, 0, 1, 0.9686275, 1,
0.01486298, -0.5311378, 2.442624, 0, 1, 0.9764706, 1,
0.02000474, -0.5028185, 1.883006, 0, 1, 0.9803922, 1,
0.02577236, -1.267679, 3.118346, 0, 1, 0.9882353, 1,
0.02742695, 0.5032242, 0.6005192, 0, 1, 0.9921569, 1,
0.02970112, 0.0473453, 1.139228, 0, 1, 1, 1,
0.03169357, 0.4054902, 2.028359, 0, 0.9921569, 1, 1,
0.0333389, -1.146169, 1.032887, 0, 0.9882353, 1, 1,
0.03940046, 0.5668238, 0.9720941, 0, 0.9803922, 1, 1,
0.03965475, 0.3378762, 0.170188, 0, 0.9764706, 1, 1,
0.04371181, -0.940962, 3.839689, 0, 0.9686275, 1, 1,
0.04395263, 0.8672643, 0.3688231, 0, 0.9647059, 1, 1,
0.04515431, -0.1827491, 3.010937, 0, 0.9568627, 1, 1,
0.04961941, 1.532055, 0.8563223, 0, 0.9529412, 1, 1,
0.05071878, 0.7215967, 0.5080179, 0, 0.945098, 1, 1,
0.05200214, 0.05730455, 0.3430069, 0, 0.9411765, 1, 1,
0.0536726, -0.6430163, 3.849789, 0, 0.9333333, 1, 1,
0.05522792, 1.677531, 0.8458653, 0, 0.9294118, 1, 1,
0.06275895, 1.292511, -0.3157716, 0, 0.9215686, 1, 1,
0.06548706, 1.168613, 0.3647806, 0, 0.9176471, 1, 1,
0.06727929, -0.7796986, 4.309113, 0, 0.9098039, 1, 1,
0.06847057, -1.238619, 3.13593, 0, 0.9058824, 1, 1,
0.07305682, -1.526568, 3.700912, 0, 0.8980392, 1, 1,
0.07692333, 1.817503, 0.846615, 0, 0.8901961, 1, 1,
0.07840621, 1.696138, 0.1749479, 0, 0.8862745, 1, 1,
0.07960156, -0.9302906, 4.111033, 0, 0.8784314, 1, 1,
0.08021653, 0.3000084, -1.836407, 0, 0.8745098, 1, 1,
0.0881465, -0.3541224, 3.047276, 0, 0.8666667, 1, 1,
0.09159974, 2.319131, -0.1210119, 0, 0.8627451, 1, 1,
0.09295188, 0.2898213, 2.247828, 0, 0.854902, 1, 1,
0.09368234, -0.04383279, 2.165194, 0, 0.8509804, 1, 1,
0.09391532, 0.7207612, 0.2952522, 0, 0.8431373, 1, 1,
0.09457631, -1.080765, 1.532761, 0, 0.8392157, 1, 1,
0.09881055, 0.03316579, 1.822934, 0, 0.8313726, 1, 1,
0.100323, 0.7558807, 2.382559, 0, 0.827451, 1, 1,
0.1010353, -0.7368839, 2.815291, 0, 0.8196079, 1, 1,
0.1054241, -0.2015179, 1.862664, 0, 0.8156863, 1, 1,
0.1111983, 0.4284883, -0.8040808, 0, 0.8078431, 1, 1,
0.1116729, 1.238115, 0.8221356, 0, 0.8039216, 1, 1,
0.1137341, -0.9325143, 1.986945, 0, 0.7960784, 1, 1,
0.1158309, 0.903985, -0.5240685, 0, 0.7882353, 1, 1,
0.1174193, 0.7071716, -0.1475924, 0, 0.7843137, 1, 1,
0.1193484, 0.1356629, 2.604288, 0, 0.7764706, 1, 1,
0.1215599, -1.370507, 3.835684, 0, 0.772549, 1, 1,
0.1251431, 0.2196793, 0.6199954, 0, 0.7647059, 1, 1,
0.1288992, 0.5494277, -0.3396165, 0, 0.7607843, 1, 1,
0.1296074, -0.1150708, 3.171428, 0, 0.7529412, 1, 1,
0.1346261, -0.3519209, 3.301831, 0, 0.7490196, 1, 1,
0.1351796, -0.02504518, 1.82247, 0, 0.7411765, 1, 1,
0.1359134, 0.1939407, 0.6272219, 0, 0.7372549, 1, 1,
0.1366975, -0.1088778, 2.288256, 0, 0.7294118, 1, 1,
0.1379313, 1.098908, -1.228334, 0, 0.7254902, 1, 1,
0.1393782, -0.351773, 2.997721, 0, 0.7176471, 1, 1,
0.1406606, -0.3155637, 1.769983, 0, 0.7137255, 1, 1,
0.1414629, 0.06328473, 0.1324795, 0, 0.7058824, 1, 1,
0.1467893, -1.54751, 3.907613, 0, 0.6980392, 1, 1,
0.1473633, -0.2103859, 3.287976, 0, 0.6941177, 1, 1,
0.1486067, 0.1993957, 1.486356, 0, 0.6862745, 1, 1,
0.1513971, 0.2126831, -0.6641245, 0, 0.682353, 1, 1,
0.1528193, -0.424652, 2.58674, 0, 0.6745098, 1, 1,
0.1573128, 1.853558, 0.5083842, 0, 0.6705883, 1, 1,
0.1601999, 1.504589, -0.3924161, 0, 0.6627451, 1, 1,
0.1642481, -0.6082252, 3.575232, 0, 0.6588235, 1, 1,
0.1644578, -1.308186, 2.690727, 0, 0.6509804, 1, 1,
0.1699807, 0.07153513, 2.87471, 0, 0.6470588, 1, 1,
0.1713512, -0.4861218, 2.303155, 0, 0.6392157, 1, 1,
0.1721659, -0.6153615, 3.069085, 0, 0.6352941, 1, 1,
0.1826796, -0.4519796, 2.852194, 0, 0.627451, 1, 1,
0.1870054, -1.056005, 3.968513, 0, 0.6235294, 1, 1,
0.1870295, -0.992386, 3.190985, 0, 0.6156863, 1, 1,
0.1917131, 1.124349, -0.6441298, 0, 0.6117647, 1, 1,
0.1958707, 0.7152567, -0.1844668, 0, 0.6039216, 1, 1,
0.2001508, 1.408178, -0.2258279, 0, 0.5960785, 1, 1,
0.2010066, -0.7541263, 1.096421, 0, 0.5921569, 1, 1,
0.2011164, -0.7403695, 2.410424, 0, 0.5843138, 1, 1,
0.2011279, 0.9559808, 0.3472572, 0, 0.5803922, 1, 1,
0.2050355, 0.3144921, 0.2587014, 0, 0.572549, 1, 1,
0.2052198, 0.8435023, -0.1666785, 0, 0.5686275, 1, 1,
0.2054392, 0.1825491, 0.8588301, 0, 0.5607843, 1, 1,
0.2068426, 1.493189, 0.5811183, 0, 0.5568628, 1, 1,
0.208723, -0.7169544, 5.305292, 0, 0.5490196, 1, 1,
0.2087363, 1.380129, -1.431401, 0, 0.5450981, 1, 1,
0.2088035, -1.505866, 1.916267, 0, 0.5372549, 1, 1,
0.208966, -0.7122823, 2.426079, 0, 0.5333334, 1, 1,
0.2103541, -0.01340613, 1.718194, 0, 0.5254902, 1, 1,
0.2115153, -0.3655234, 4.712099, 0, 0.5215687, 1, 1,
0.2191084, -0.5442223, 2.914789, 0, 0.5137255, 1, 1,
0.2199493, 0.1111882, 0.9223423, 0, 0.509804, 1, 1,
0.2202428, -0.9653958, 3.176898, 0, 0.5019608, 1, 1,
0.2228812, -0.9937744, 1.581612, 0, 0.4941176, 1, 1,
0.2231672, 1.52931, -1.399358, 0, 0.4901961, 1, 1,
0.223194, 0.03573562, 0.6502381, 0, 0.4823529, 1, 1,
0.2266322, -0.2151176, 2.230489, 0, 0.4784314, 1, 1,
0.2281216, 1.456863, 1.438247, 0, 0.4705882, 1, 1,
0.2287767, -1.109883, 3.589902, 0, 0.4666667, 1, 1,
0.2313458, 0.5900486, 0.8068767, 0, 0.4588235, 1, 1,
0.2344011, 0.9390655, -0.3872824, 0, 0.454902, 1, 1,
0.2387827, -0.571306, 1.532176, 0, 0.4470588, 1, 1,
0.2396328, 0.1721824, 0.2792518, 0, 0.4431373, 1, 1,
0.2413821, -0.3477259, 3.069781, 0, 0.4352941, 1, 1,
0.2415727, 0.8741177, 0.004578257, 0, 0.4313726, 1, 1,
0.2426128, 0.4053232, 1.132007, 0, 0.4235294, 1, 1,
0.2428223, 0.3477128, 0.2428478, 0, 0.4196078, 1, 1,
0.2444303, 0.2177977, 0.2670717, 0, 0.4117647, 1, 1,
0.2461859, -0.2267534, 2.680943, 0, 0.4078431, 1, 1,
0.2505054, -0.1173336, 2.5032, 0, 0.4, 1, 1,
0.2513881, 1.13755, -0.4753305, 0, 0.3921569, 1, 1,
0.2629929, 0.7411807, 0.239587, 0, 0.3882353, 1, 1,
0.2652291, 0.1648853, 0.9182525, 0, 0.3803922, 1, 1,
0.2654484, 1.249861, -1.175597, 0, 0.3764706, 1, 1,
0.2691506, 0.6765797, -1.043466, 0, 0.3686275, 1, 1,
0.2720095, -0.4390968, 2.015496, 0, 0.3647059, 1, 1,
0.2808267, 1.599561, -0.3418651, 0, 0.3568628, 1, 1,
0.2827229, 1.634806, 1.001277, 0, 0.3529412, 1, 1,
0.2830897, 1.117283, -0.3904983, 0, 0.345098, 1, 1,
0.292843, -0.3105167, 1.427871, 0, 0.3411765, 1, 1,
0.2938541, -0.9727191, 1.945456, 0, 0.3333333, 1, 1,
0.298348, 0.6830485, 0.5032471, 0, 0.3294118, 1, 1,
0.3007848, 1.62089, 0.8709178, 0, 0.3215686, 1, 1,
0.3067816, -0.7320587, 3.919989, 0, 0.3176471, 1, 1,
0.3106855, -0.3878951, 0.4737884, 0, 0.3098039, 1, 1,
0.3128849, 0.3241291, 2.157125, 0, 0.3058824, 1, 1,
0.3135513, 0.01409733, 1.886316, 0, 0.2980392, 1, 1,
0.3192231, -1.769691, 4.800515, 0, 0.2901961, 1, 1,
0.3192731, -0.7762541, 1.858752, 0, 0.2862745, 1, 1,
0.3197497, 0.6118181, 0.9066734, 0, 0.2784314, 1, 1,
0.3292438, -0.1600695, 1.111682, 0, 0.2745098, 1, 1,
0.3301174, -2.067262, 1.918564, 0, 0.2666667, 1, 1,
0.3318759, -0.6504286, 3.865041, 0, 0.2627451, 1, 1,
0.3349766, 0.0149577, 2.398726, 0, 0.254902, 1, 1,
0.336006, 0.5974171, 2.548278, 0, 0.2509804, 1, 1,
0.3382582, -0.5919117, 2.978728, 0, 0.2431373, 1, 1,
0.3423135, -0.8850752, 2.147102, 0, 0.2392157, 1, 1,
0.3450695, -0.8130538, 2.00158, 0, 0.2313726, 1, 1,
0.3458802, -1.641059, 0.8187962, 0, 0.227451, 1, 1,
0.3466283, -1.614819, 1.900393, 0, 0.2196078, 1, 1,
0.3499327, -0.3455189, 3.652793, 0, 0.2156863, 1, 1,
0.3551831, 1.577859, -0.1262135, 0, 0.2078431, 1, 1,
0.3571458, 0.6031931, 0.1018434, 0, 0.2039216, 1, 1,
0.3581744, -0.5861785, 2.713984, 0, 0.1960784, 1, 1,
0.3587585, 0.6654335, 3.342182, 0, 0.1882353, 1, 1,
0.359369, 0.3553233, 1.535122, 0, 0.1843137, 1, 1,
0.3662463, 1.545905, -0.03115503, 0, 0.1764706, 1, 1,
0.3687691, -1.35867, 2.850278, 0, 0.172549, 1, 1,
0.3735951, -0.6859808, 3.909315, 0, 0.1647059, 1, 1,
0.378009, 0.01152323, 2.448456, 0, 0.1607843, 1, 1,
0.3833283, 0.4787191, 0.4260378, 0, 0.1529412, 1, 1,
0.3854417, -2.572772, 2.515322, 0, 0.1490196, 1, 1,
0.3862575, -1.932428, 1.622529, 0, 0.1411765, 1, 1,
0.3872204, 0.144938, -0.2556689, 0, 0.1372549, 1, 1,
0.3885446, 0.8991135, 0.9315705, 0, 0.1294118, 1, 1,
0.4000142, -0.1586299, 1.717995, 0, 0.1254902, 1, 1,
0.4003705, -1.000993, 1.850289, 0, 0.1176471, 1, 1,
0.4007414, -0.07320477, 1.447952, 0, 0.1137255, 1, 1,
0.4042451, -0.5840489, 0.9521868, 0, 0.1058824, 1, 1,
0.4053516, 1.216333, 1.9841, 0, 0.09803922, 1, 1,
0.406212, 0.05880353, 0.4800453, 0, 0.09411765, 1, 1,
0.4063037, -0.1325837, 1.898853, 0, 0.08627451, 1, 1,
0.4097852, -0.3972932, 3.633563, 0, 0.08235294, 1, 1,
0.4102473, -0.2115716, 2.382494, 0, 0.07450981, 1, 1,
0.4122224, 0.4364601, 0.5355244, 0, 0.07058824, 1, 1,
0.4155146, -0.5239251, 2.712921, 0, 0.0627451, 1, 1,
0.417653, 0.8279527, 1.802432, 0, 0.05882353, 1, 1,
0.4197994, 0.4786718, 0.871425, 0, 0.05098039, 1, 1,
0.4231187, 0.2432316, 1.464202, 0, 0.04705882, 1, 1,
0.4250607, -0.4680744, 1.639143, 0, 0.03921569, 1, 1,
0.4257903, -0.2701446, 2.390892, 0, 0.03529412, 1, 1,
0.4269494, -1.313515, 2.69564, 0, 0.02745098, 1, 1,
0.4272529, -0.03179926, 1.328235, 0, 0.02352941, 1, 1,
0.4297453, 0.8409751, -0.1748016, 0, 0.01568628, 1, 1,
0.4303925, 0.6497735, 1.181629, 0, 0.01176471, 1, 1,
0.43106, -0.4095277, 1.459321, 0, 0.003921569, 1, 1,
0.4320139, 0.9924273, -1.310484, 0.003921569, 0, 1, 1,
0.4349189, -2.281516, 1.360971, 0.007843138, 0, 1, 1,
0.435161, -0.05483754, 1.935545, 0.01568628, 0, 1, 1,
0.4357658, -1.185497, 2.179615, 0.01960784, 0, 1, 1,
0.4384133, -1.385646, 4.087045, 0.02745098, 0, 1, 1,
0.4425606, -0.7902352, 1.284162, 0.03137255, 0, 1, 1,
0.4432307, -0.6640816, 1.389154, 0.03921569, 0, 1, 1,
0.443981, 0.4510761, 2.020519, 0.04313726, 0, 1, 1,
0.4458609, -1.1747, 1.66182, 0.05098039, 0, 1, 1,
0.4475786, -0.124091, 4.115258, 0.05490196, 0, 1, 1,
0.4482086, -0.3937804, 3.641353, 0.0627451, 0, 1, 1,
0.44875, -0.9775147, 2.790831, 0.06666667, 0, 1, 1,
0.4489092, -0.591244, 4.949454, 0.07450981, 0, 1, 1,
0.4573374, -0.3199126, 2.449145, 0.07843138, 0, 1, 1,
0.4636601, 2.434278, 1.014409, 0.08627451, 0, 1, 1,
0.4657189, 1.585913, 1.818521, 0.09019608, 0, 1, 1,
0.4678464, 0.4462433, -0.5225171, 0.09803922, 0, 1, 1,
0.4682196, 1.368378, -0.8880724, 0.1058824, 0, 1, 1,
0.4722481, -0.7856215, 2.418904, 0.1098039, 0, 1, 1,
0.4812134, -0.03173706, 0.5840082, 0.1176471, 0, 1, 1,
0.4863968, -0.3912158, 2.16493, 0.1215686, 0, 1, 1,
0.492952, 1.019726, 1.006485, 0.1294118, 0, 1, 1,
0.4986102, -0.5507176, 3.55947, 0.1333333, 0, 1, 1,
0.4995182, -1.472306, 2.518194, 0.1411765, 0, 1, 1,
0.499776, 0.07977693, 0.8384884, 0.145098, 0, 1, 1,
0.5038424, -1.076072, 3.16921, 0.1529412, 0, 1, 1,
0.5043743, 1.767992, 0.3057877, 0.1568628, 0, 1, 1,
0.5072694, 0.610276, 1.566202, 0.1647059, 0, 1, 1,
0.5143202, 0.01028219, 2.413677, 0.1686275, 0, 1, 1,
0.5151439, 0.4717145, 0.5571524, 0.1764706, 0, 1, 1,
0.5190049, -0.2816838, 0.7742919, 0.1803922, 0, 1, 1,
0.5270315, 0.7184188, 0.8613356, 0.1882353, 0, 1, 1,
0.5273217, 0.9993134, -0.944039, 0.1921569, 0, 1, 1,
0.531729, -0.5642085, 1.843899, 0.2, 0, 1, 1,
0.5317532, -1.046188, 1.55087, 0.2078431, 0, 1, 1,
0.5347821, -1.091128, 2.125377, 0.2117647, 0, 1, 1,
0.5384648, -0.536833, 2.022199, 0.2196078, 0, 1, 1,
0.541867, 0.5044935, 1.567803, 0.2235294, 0, 1, 1,
0.5422319, 0.1288586, 1.430292, 0.2313726, 0, 1, 1,
0.5440354, 1.450337, 0.3587292, 0.2352941, 0, 1, 1,
0.5441018, 0.2146568, 1.84216, 0.2431373, 0, 1, 1,
0.5475946, 0.01579322, 1.695421, 0.2470588, 0, 1, 1,
0.5487061, -0.5906841, 3.800522, 0.254902, 0, 1, 1,
0.5525064, 0.7167949, 1.234818, 0.2588235, 0, 1, 1,
0.5556042, 0.257551, 1.841564, 0.2666667, 0, 1, 1,
0.5580741, 0.02345948, 2.830444, 0.2705882, 0, 1, 1,
0.5584752, 1.136246, -1.104528, 0.2784314, 0, 1, 1,
0.5731528, -0.8730153, 2.109765, 0.282353, 0, 1, 1,
0.5739306, -1.500278, 2.835808, 0.2901961, 0, 1, 1,
0.5749742, 0.5709022, 0.08428077, 0.2941177, 0, 1, 1,
0.5754123, -0.2981206, 1.287251, 0.3019608, 0, 1, 1,
0.5846469, 1.230986, 1.026985, 0.3098039, 0, 1, 1,
0.5847038, 1.527236, 0.819329, 0.3137255, 0, 1, 1,
0.5859573, -0.3350573, 1.70771, 0.3215686, 0, 1, 1,
0.5893484, 1.159931, -2.323853, 0.3254902, 0, 1, 1,
0.59205, 1.065886, 1.905122, 0.3333333, 0, 1, 1,
0.5939358, -1.02517, 1.929295, 0.3372549, 0, 1, 1,
0.5981051, 0.5850801, 0.326695, 0.345098, 0, 1, 1,
0.6002001, 0.5927838, 0.733229, 0.3490196, 0, 1, 1,
0.6081746, -1.918057, 0.4822942, 0.3568628, 0, 1, 1,
0.6128055, -0.3711386, 1.878903, 0.3607843, 0, 1, 1,
0.6186262, 0.9220936, 0.4048667, 0.3686275, 0, 1, 1,
0.6303686, 1.730477, -1.099474, 0.372549, 0, 1, 1,
0.6317114, 1.148781, 2.422033, 0.3803922, 0, 1, 1,
0.6372892, 0.3498108, 0.2012996, 0.3843137, 0, 1, 1,
0.6373923, -0.7424975, -0.0373205, 0.3921569, 0, 1, 1,
0.6411797, -0.8873886, 3.908621, 0.3960784, 0, 1, 1,
0.6418244, -2.136049, 2.431349, 0.4039216, 0, 1, 1,
0.6422259, 0.5258401, 0.8472175, 0.4117647, 0, 1, 1,
0.6441118, -0.9111869, 2.202215, 0.4156863, 0, 1, 1,
0.65043, -0.5500441, 4.122694, 0.4235294, 0, 1, 1,
0.6515266, -0.1573494, 2.419581, 0.427451, 0, 1, 1,
0.6520678, 0.02323288, 1.287135, 0.4352941, 0, 1, 1,
0.6552368, -0.7683998, 2.858247, 0.4392157, 0, 1, 1,
0.6620556, 1.310653, -0.1416374, 0.4470588, 0, 1, 1,
0.6625734, 0.5574595, 1.092773, 0.4509804, 0, 1, 1,
0.6675931, -0.7222794, 1.504243, 0.4588235, 0, 1, 1,
0.6772249, -0.8155566, 1.849248, 0.4627451, 0, 1, 1,
0.6808745, 1.034315, -0.3616894, 0.4705882, 0, 1, 1,
0.6861468, 3.389358, 0.9934998, 0.4745098, 0, 1, 1,
0.6924606, -0.4927472, 0.6942717, 0.4823529, 0, 1, 1,
0.6934067, 0.8066934, 3.037812, 0.4862745, 0, 1, 1,
0.6971689, -1.669855, 4.801799, 0.4941176, 0, 1, 1,
0.6973717, 0.1778304, 0.7918434, 0.5019608, 0, 1, 1,
0.6974561, -2.141787, 4.135402, 0.5058824, 0, 1, 1,
0.7043369, -0.8174015, 3.004796, 0.5137255, 0, 1, 1,
0.7065794, 0.9551727, 1.786075, 0.5176471, 0, 1, 1,
0.7136498, 0.5149823, 1.345089, 0.5254902, 0, 1, 1,
0.7194158, 0.2670713, 1.713064, 0.5294118, 0, 1, 1,
0.7225356, -0.8253939, 1.722151, 0.5372549, 0, 1, 1,
0.7233091, -0.2531352, 2.291057, 0.5411765, 0, 1, 1,
0.7243259, 0.1079985, 1.214703, 0.5490196, 0, 1, 1,
0.7288974, -0.4780971, 0.8281259, 0.5529412, 0, 1, 1,
0.7290902, -0.3931804, 2.822879, 0.5607843, 0, 1, 1,
0.7302207, 0.4323429, 0.4477958, 0.5647059, 0, 1, 1,
0.7316197, -1.023457, 2.267979, 0.572549, 0, 1, 1,
0.7342492, 0.417367, 0.7085528, 0.5764706, 0, 1, 1,
0.7370349, 0.4913776, 0.7178741, 0.5843138, 0, 1, 1,
0.7409192, -1.772166, 4.248276, 0.5882353, 0, 1, 1,
0.749199, 0.7320191, -0.4773188, 0.5960785, 0, 1, 1,
0.750666, -1.975334, 1.911454, 0.6039216, 0, 1, 1,
0.7507431, 0.5103219, 1.187935, 0.6078432, 0, 1, 1,
0.7601712, -1.789994, 1.232813, 0.6156863, 0, 1, 1,
0.7645566, 0.7617919, 0.9713393, 0.6196079, 0, 1, 1,
0.7650134, -0.2804334, 0.6337366, 0.627451, 0, 1, 1,
0.7655536, -1.805073, 2.039573, 0.6313726, 0, 1, 1,
0.7720609, 0.4198821, 0.3196772, 0.6392157, 0, 1, 1,
0.7728342, 0.9301116, 2.027569, 0.6431373, 0, 1, 1,
0.7777742, 0.04138485, 1.155788, 0.6509804, 0, 1, 1,
0.778307, 1.317689, 1.447404, 0.654902, 0, 1, 1,
0.7848028, 0.4656797, 2.037894, 0.6627451, 0, 1, 1,
0.7854177, 0.4270895, 1.222763, 0.6666667, 0, 1, 1,
0.7861143, -1.084258, 2.389405, 0.6745098, 0, 1, 1,
0.788973, 1.369198, -1.141372, 0.6784314, 0, 1, 1,
0.7975958, -1.614101, 2.472482, 0.6862745, 0, 1, 1,
0.7986001, 0.5000051, -0.7545201, 0.6901961, 0, 1, 1,
0.7996199, 0.7293566, -0.6548026, 0.6980392, 0, 1, 1,
0.7996759, 0.1891028, 0.6166419, 0.7058824, 0, 1, 1,
0.8015636, 0.633016, 0.3298195, 0.7098039, 0, 1, 1,
0.8021177, -0.8257277, 1.919562, 0.7176471, 0, 1, 1,
0.8035111, 0.3303787, 1.201042, 0.7215686, 0, 1, 1,
0.804621, -1.35426, 1.009861, 0.7294118, 0, 1, 1,
0.812361, -0.01473029, 0.7718444, 0.7333333, 0, 1, 1,
0.8127466, -0.7236684, 2.542122, 0.7411765, 0, 1, 1,
0.813504, -2.261682, 2.866589, 0.7450981, 0, 1, 1,
0.815088, -2.313667, 2.750824, 0.7529412, 0, 1, 1,
0.8216478, 0.9052737, 1.857928, 0.7568628, 0, 1, 1,
0.8245674, 0.5893699, 0.03249181, 0.7647059, 0, 1, 1,
0.8305793, -0.2130631, 2.61202, 0.7686275, 0, 1, 1,
0.8440126, -0.03547451, 0.2175043, 0.7764706, 0, 1, 1,
0.8443214, -0.9881793, 3.150135, 0.7803922, 0, 1, 1,
0.8525917, -0.2107485, 0.5046162, 0.7882353, 0, 1, 1,
0.855165, 1.852092, 0.5415702, 0.7921569, 0, 1, 1,
0.8606683, 0.737444, -1.016194, 0.8, 0, 1, 1,
0.8676448, 0.0740485, 0.9569384, 0.8078431, 0, 1, 1,
0.8700764, 1.532714, -0.4505879, 0.8117647, 0, 1, 1,
0.8736671, 0.7385669, 1.2256, 0.8196079, 0, 1, 1,
0.8758803, 0.2313315, 1.3547, 0.8235294, 0, 1, 1,
0.8815885, 0.01361535, 3.555713, 0.8313726, 0, 1, 1,
0.8904206, 0.1503842, 2.311973, 0.8352941, 0, 1, 1,
0.9008839, -0.1272032, 3.363036, 0.8431373, 0, 1, 1,
0.9047322, -0.2225738, 3.122605, 0.8470588, 0, 1, 1,
0.9076247, -1.117919, 1.589734, 0.854902, 0, 1, 1,
0.9109517, 0.3741658, 2.180372, 0.8588235, 0, 1, 1,
0.9154395, -0.4405018, 2.177554, 0.8666667, 0, 1, 1,
0.9155458, -1.753129, 2.67589, 0.8705882, 0, 1, 1,
0.9157711, -0.5163183, 1.874106, 0.8784314, 0, 1, 1,
0.9216453, 0.03891614, 3.248945, 0.8823529, 0, 1, 1,
0.9272266, 1.085097, 2.761371, 0.8901961, 0, 1, 1,
0.9326746, -0.410455, 2.162273, 0.8941177, 0, 1, 1,
0.9339635, 0.5190719, 0.2252501, 0.9019608, 0, 1, 1,
0.9359397, -0.1745725, 1.191913, 0.9098039, 0, 1, 1,
0.9368328, -0.184011, 1.57748, 0.9137255, 0, 1, 1,
0.9372746, -0.08247476, 1.355157, 0.9215686, 0, 1, 1,
0.9401965, 0.6405188, 1.737655, 0.9254902, 0, 1, 1,
0.9482548, -0.6889008, 2.671866, 0.9333333, 0, 1, 1,
0.9560295, 1.279371, 0.5025204, 0.9372549, 0, 1, 1,
0.9633668, -1.61975, 2.663898, 0.945098, 0, 1, 1,
0.9660294, 0.243389, 2.896426, 0.9490196, 0, 1, 1,
0.9664677, -0.1211031, 1.82925, 0.9568627, 0, 1, 1,
0.9668074, -0.3368092, 1.832191, 0.9607843, 0, 1, 1,
0.9742489, -0.07112823, 3.00548, 0.9686275, 0, 1, 1,
0.9783254, -0.3035257, 2.179623, 0.972549, 0, 1, 1,
0.9874395, 0.6465864, 0.3290819, 0.9803922, 0, 1, 1,
0.993867, -0.8801072, 1.771141, 0.9843137, 0, 1, 1,
0.9954099, -0.7471378, 3.387433, 0.9921569, 0, 1, 1,
0.9975667, 0.1197626, -0.2004431, 0.9960784, 0, 1, 1,
1.000435, 0.180179, 1.662214, 1, 0, 0.9960784, 1,
1.001223, -1.440093, 2.232364, 1, 0, 0.9882353, 1,
1.003919, 0.4332918, 0.8290593, 1, 0, 0.9843137, 1,
1.004381, 0.4690819, 1.298165, 1, 0, 0.9764706, 1,
1.007564, 0.06642795, 1.666971, 1, 0, 0.972549, 1,
1.011261, 1.58015, -0.6720199, 1, 0, 0.9647059, 1,
1.016763, -0.5628678, 3.324214, 1, 0, 0.9607843, 1,
1.028711, 0.1501801, 0.3621987, 1, 0, 0.9529412, 1,
1.032234, 0.2507004, 1.033777, 1, 0, 0.9490196, 1,
1.036257, -1.332436, 0.559696, 1, 0, 0.9411765, 1,
1.039214, 0.6806042, 1.52162, 1, 0, 0.9372549, 1,
1.039721, -1.403571, 1.560224, 1, 0, 0.9294118, 1,
1.04538, -0.1430738, 2.227623, 1, 0, 0.9254902, 1,
1.045586, 0.3300978, 1.814445, 1, 0, 0.9176471, 1,
1.048129, 0.3624353, 0.8198556, 1, 0, 0.9137255, 1,
1.048777, 1.140182, 1.941682, 1, 0, 0.9058824, 1,
1.05348, -0.6745958, 1.005004, 1, 0, 0.9019608, 1,
1.055981, -0.1328344, 1.2759, 1, 0, 0.8941177, 1,
1.06191, 0.1965727, 0.8869733, 1, 0, 0.8862745, 1,
1.066145, 2.259076, 1.716363, 1, 0, 0.8823529, 1,
1.067349, -0.232335, 2.583746, 1, 0, 0.8745098, 1,
1.070814, 0.272923, 3.402997, 1, 0, 0.8705882, 1,
1.075536, 0.5972946, 1.235254, 1, 0, 0.8627451, 1,
1.077454, -0.06412063, 2.157174, 1, 0, 0.8588235, 1,
1.078003, 0.3986311, 0.8334618, 1, 0, 0.8509804, 1,
1.078377, 0.09308178, 2.489429, 1, 0, 0.8470588, 1,
1.082057, -1.14646, 1.072101, 1, 0, 0.8392157, 1,
1.083906, 0.9172454, 0.1612799, 1, 0, 0.8352941, 1,
1.088974, 0.2581499, -1.594642, 1, 0, 0.827451, 1,
1.098687, -0.6828612, 3.59628, 1, 0, 0.8235294, 1,
1.099994, -1.311479, 1.00197, 1, 0, 0.8156863, 1,
1.105611, -1.138997, 2.918868, 1, 0, 0.8117647, 1,
1.106702, -0.5275658, 2.729609, 1, 0, 0.8039216, 1,
1.111146, 0.7827981, 1.226273, 1, 0, 0.7960784, 1,
1.1122, 0.4053708, 1.853929, 1, 0, 0.7921569, 1,
1.112427, 1.655903, 1.536057, 1, 0, 0.7843137, 1,
1.115299, 0.1987411, 1.430927, 1, 0, 0.7803922, 1,
1.119537, -1.88208, 2.692097, 1, 0, 0.772549, 1,
1.12188, -1.10175, 4.51912, 1, 0, 0.7686275, 1,
1.122415, 0.06325047, 1.216768, 1, 0, 0.7607843, 1,
1.123902, 0.7558576, 1.465459, 1, 0, 0.7568628, 1,
1.125703, 0.4832555, 0.4970736, 1, 0, 0.7490196, 1,
1.127749, 0.8650907, -0.06110849, 1, 0, 0.7450981, 1,
1.133562, -0.08975644, 2.530663, 1, 0, 0.7372549, 1,
1.14162, -1.211358, 2.840259, 1, 0, 0.7333333, 1,
1.142308, -0.0108395, 1.827163, 1, 0, 0.7254902, 1,
1.143623, 0.6962721, 2.399967, 1, 0, 0.7215686, 1,
1.15222, 1.772576, 0.2055699, 1, 0, 0.7137255, 1,
1.155532, -0.8725997, 1.309928, 1, 0, 0.7098039, 1,
1.157743, 1.297469, 0.2643118, 1, 0, 0.7019608, 1,
1.157843, -0.1684288, 1.580655, 1, 0, 0.6941177, 1,
1.1608, -0.9351428, 2.539321, 1, 0, 0.6901961, 1,
1.165668, -0.646984, 2.003656, 1, 0, 0.682353, 1,
1.167664, -0.04006624, 2.960994, 1, 0, 0.6784314, 1,
1.16802, -1.251942, 1.309517, 1, 0, 0.6705883, 1,
1.170618, -0.3058779, -1.033882, 1, 0, 0.6666667, 1,
1.178728, -0.3117274, 0.9252942, 1, 0, 0.6588235, 1,
1.186952, 1.567539, 0.006139705, 1, 0, 0.654902, 1,
1.187436, 0.8494274, 0.8131701, 1, 0, 0.6470588, 1,
1.197471, 0.6946198, 1.461303, 1, 0, 0.6431373, 1,
1.207126, 2.062493, -1.079749, 1, 0, 0.6352941, 1,
1.215093, 0.05487411, 1.279564, 1, 0, 0.6313726, 1,
1.237461, -0.8823872, 2.403927, 1, 0, 0.6235294, 1,
1.242884, -0.7483592, 1.280897, 1, 0, 0.6196079, 1,
1.247406, -0.2017121, 1.673627, 1, 0, 0.6117647, 1,
1.263984, 0.9544641, 0.4283279, 1, 0, 0.6078432, 1,
1.281625, 0.1451692, 2.808383, 1, 0, 0.6, 1,
1.297503, 0.1325696, 1.235663, 1, 0, 0.5921569, 1,
1.29777, 0.1259356, 2.238209, 1, 0, 0.5882353, 1,
1.309874, 1.291481, 1.630109, 1, 0, 0.5803922, 1,
1.319414, 0.4631106, -0.1545324, 1, 0, 0.5764706, 1,
1.336674, 1.515471, 1.145983, 1, 0, 0.5686275, 1,
1.346421, -1.09562, 1.476133, 1, 0, 0.5647059, 1,
1.349302, -0.3207784, 2.991112, 1, 0, 0.5568628, 1,
1.382303, -0.2497768, 1.466475, 1, 0, 0.5529412, 1,
1.383337, 0.9456816, -0.1618793, 1, 0, 0.5450981, 1,
1.383568, 0.9514994, -0.7070961, 1, 0, 0.5411765, 1,
1.388535, 0.2903947, 0.8748145, 1, 0, 0.5333334, 1,
1.388761, 0.170752, 0.5051796, 1, 0, 0.5294118, 1,
1.392704, -0.531638, 3.295124, 1, 0, 0.5215687, 1,
1.393566, -0.6902595, 3.013142, 1, 0, 0.5176471, 1,
1.395043, -0.8323823, 2.565485, 1, 0, 0.509804, 1,
1.413715, -0.7307143, 0.774377, 1, 0, 0.5058824, 1,
1.428104, -1.802759, 3.676517, 1, 0, 0.4980392, 1,
1.433147, -0.01522263, 1.770595, 1, 0, 0.4901961, 1,
1.444721, 0.9611962, 0.4700731, 1, 0, 0.4862745, 1,
1.448765, -1.820161, 1.807229, 1, 0, 0.4784314, 1,
1.456673, -0.004775019, 2.092199, 1, 0, 0.4745098, 1,
1.466497, 0.6017872, 1.001275, 1, 0, 0.4666667, 1,
1.470482, -0.5554001, 1.761138, 1, 0, 0.4627451, 1,
1.486341, 0.1107914, 2.228279, 1, 0, 0.454902, 1,
1.50527, 0.1815371, 0.7348554, 1, 0, 0.4509804, 1,
1.507874, -0.0200134, 0.7854341, 1, 0, 0.4431373, 1,
1.515018, -2.051438, 2.859952, 1, 0, 0.4392157, 1,
1.519241, 1.068689, 1.460568, 1, 0, 0.4313726, 1,
1.530184, 0.300355, 0.398854, 1, 0, 0.427451, 1,
1.553464, 1.210552, 1.285365, 1, 0, 0.4196078, 1,
1.556607, -0.826079, 2.681388, 1, 0, 0.4156863, 1,
1.575483, -0.9278151, 1.964441, 1, 0, 0.4078431, 1,
1.578162, 0.8094758, 2.551408, 1, 0, 0.4039216, 1,
1.584326, 1.339038, 1.802498, 1, 0, 0.3960784, 1,
1.596225, 0.474234, -1.180668, 1, 0, 0.3882353, 1,
1.604929, 2.486532, 0.08038861, 1, 0, 0.3843137, 1,
1.628687, 0.1928917, 0.8186486, 1, 0, 0.3764706, 1,
1.629082, -1.574714, 3.465293, 1, 0, 0.372549, 1,
1.633542, -0.4237269, 1.616689, 1, 0, 0.3647059, 1,
1.651739, 0.2011406, 0.5120326, 1, 0, 0.3607843, 1,
1.685981, -0.3205707, -1.852859, 1, 0, 0.3529412, 1,
1.693329, 0.1394728, 3.401746, 1, 0, 0.3490196, 1,
1.705297, -0.09974714, 0.3307268, 1, 0, 0.3411765, 1,
1.706418, -2.644279, 2.451888, 1, 0, 0.3372549, 1,
1.710716, 0.6135061, 3.945624, 1, 0, 0.3294118, 1,
1.713222, -1.859792, 2.119902, 1, 0, 0.3254902, 1,
1.716208, -0.8964082, 3.363162, 1, 0, 0.3176471, 1,
1.718473, -0.8038968, 3.324071, 1, 0, 0.3137255, 1,
1.729552, 0.5156469, 0.3427331, 1, 0, 0.3058824, 1,
1.730185, -1.800033, 3.700109, 1, 0, 0.2980392, 1,
1.740821, 1.388893, 1.884425, 1, 0, 0.2941177, 1,
1.742161, 1.135862, 0.7261568, 1, 0, 0.2862745, 1,
1.747228, 0.6154216, 1.182373, 1, 0, 0.282353, 1,
1.755418, 0.4591715, -0.1015174, 1, 0, 0.2745098, 1,
1.773201, -0.4069507, 1.759929, 1, 0, 0.2705882, 1,
1.813174, -0.5769339, 2.484833, 1, 0, 0.2627451, 1,
1.813282, -1.231786, 3.09929, 1, 0, 0.2588235, 1,
1.824137, 1.503685, 0.6618465, 1, 0, 0.2509804, 1,
1.844164, -0.2869706, 1.36334, 1, 0, 0.2470588, 1,
1.852852, -0.1653044, 3.117686, 1, 0, 0.2392157, 1,
1.870129, 0.4964162, 1.408369, 1, 0, 0.2352941, 1,
1.870983, -0.3842508, 2.168165, 1, 0, 0.227451, 1,
1.880883, 0.9185593, 3.667755, 1, 0, 0.2235294, 1,
1.905541, -0.4373401, 0.2679191, 1, 0, 0.2156863, 1,
1.916674, 0.4666182, -0.4553529, 1, 0, 0.2117647, 1,
1.92235, -0.2429309, 0.723184, 1, 0, 0.2039216, 1,
1.942145, 1.980785, 0.6583202, 1, 0, 0.1960784, 1,
1.961375, -1.18542, 3.854381, 1, 0, 0.1921569, 1,
1.968843, 0.4788587, 3.027491, 1, 0, 0.1843137, 1,
1.974791, 0.3703149, 0.6746243, 1, 0, 0.1803922, 1,
1.989384, -0.446699, 1.390636, 1, 0, 0.172549, 1,
1.992264, -2.032766, 2.67196, 1, 0, 0.1686275, 1,
2.00353, 0.7104426, 2.32122, 1, 0, 0.1607843, 1,
2.062761, 0.2447196, 1.68848, 1, 0, 0.1568628, 1,
2.070779, 0.185884, 0.3463234, 1, 0, 0.1490196, 1,
2.109521, 0.2999479, 2.487698, 1, 0, 0.145098, 1,
2.11402, 0.3595271, 2.29522, 1, 0, 0.1372549, 1,
2.150081, -1.707689, 4.052741, 1, 0, 0.1333333, 1,
2.199609, 0.6610923, 0.8566914, 1, 0, 0.1254902, 1,
2.212223, -3.437139, 2.287682, 1, 0, 0.1215686, 1,
2.256821, 1.048812, 0.4537192, 1, 0, 0.1137255, 1,
2.262576, -1.327108, -0.175834, 1, 0, 0.1098039, 1,
2.276028, 0.6471224, 2.889484, 1, 0, 0.1019608, 1,
2.277614, -0.4738666, 2.602212, 1, 0, 0.09411765, 1,
2.290779, -1.08292, 2.245509, 1, 0, 0.09019608, 1,
2.303022, -0.3896163, 0.4323789, 1, 0, 0.08235294, 1,
2.309791, 0.2977482, 2.181954, 1, 0, 0.07843138, 1,
2.352511, -0.5302026, 0.3823937, 1, 0, 0.07058824, 1,
2.433916, 0.08867564, 0.9014443, 1, 0, 0.06666667, 1,
2.489929, -0.7502089, 1.295558, 1, 0, 0.05882353, 1,
2.57947, 0.4903091, 1.059271, 1, 0, 0.05490196, 1,
2.579957, -1.141137, 3.733933, 1, 0, 0.04705882, 1,
2.597133, 0.7635451, 1.085729, 1, 0, 0.04313726, 1,
2.609202, 0.359595, 1.053679, 1, 0, 0.03529412, 1,
2.629781, -0.8182961, 1.744004, 1, 0, 0.03137255, 1,
2.749381, -0.2859777, 1.756743, 1, 0, 0.02352941, 1,
2.827099, -0.03145963, 1.498106, 1, 0, 0.01960784, 1,
2.907682, -0.9233389, 0.6414116, 1, 0, 0.01176471, 1,
3.486818, -0.6092123, 1.948673, 1, 0, 0.007843138, 1
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
0.03063357, -4.59423, -6.952375, 0, -0.5, 0.5, 0.5,
0.03063357, -4.59423, -6.952375, 1, -0.5, 0.5, 0.5,
0.03063357, -4.59423, -6.952375, 1, 1.5, 0.5, 0.5,
0.03063357, -4.59423, -6.952375, 0, 1.5, 0.5, 0.5
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
-4.597198, -0.02389061, -6.952375, 0, -0.5, 0.5, 0.5,
-4.597198, -0.02389061, -6.952375, 1, -0.5, 0.5, 0.5,
-4.597198, -0.02389061, -6.952375, 1, 1.5, 0.5, 0.5,
-4.597198, -0.02389061, -6.952375, 0, 1.5, 0.5, 0.5
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
-4.597198, -4.59423, 0.06473303, 0, -0.5, 0.5, 0.5,
-4.597198, -4.59423, 0.06473303, 1, -0.5, 0.5, 0.5,
-4.597198, -4.59423, 0.06473303, 1, 1.5, 0.5, 0.5,
-4.597198, -4.59423, 0.06473303, 0, 1.5, 0.5, 0.5
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
-3, -3.539536, -5.333043,
3, -3.539536, -5.333043,
-3, -3.539536, -5.333043,
-3, -3.715319, -5.602931,
-2, -3.539536, -5.333043,
-2, -3.715319, -5.602931,
-1, -3.539536, -5.333043,
-1, -3.715319, -5.602931,
0, -3.539536, -5.333043,
0, -3.715319, -5.602931,
1, -3.539536, -5.333043,
1, -3.715319, -5.602931,
2, -3.539536, -5.333043,
2, -3.715319, -5.602931,
3, -3.539536, -5.333043,
3, -3.715319, -5.602931
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
-3, -4.066884, -6.142709, 0, -0.5, 0.5, 0.5,
-3, -4.066884, -6.142709, 1, -0.5, 0.5, 0.5,
-3, -4.066884, -6.142709, 1, 1.5, 0.5, 0.5,
-3, -4.066884, -6.142709, 0, 1.5, 0.5, 0.5,
-2, -4.066884, -6.142709, 0, -0.5, 0.5, 0.5,
-2, -4.066884, -6.142709, 1, -0.5, 0.5, 0.5,
-2, -4.066884, -6.142709, 1, 1.5, 0.5, 0.5,
-2, -4.066884, -6.142709, 0, 1.5, 0.5, 0.5,
-1, -4.066884, -6.142709, 0, -0.5, 0.5, 0.5,
-1, -4.066884, -6.142709, 1, -0.5, 0.5, 0.5,
-1, -4.066884, -6.142709, 1, 1.5, 0.5, 0.5,
-1, -4.066884, -6.142709, 0, 1.5, 0.5, 0.5,
0, -4.066884, -6.142709, 0, -0.5, 0.5, 0.5,
0, -4.066884, -6.142709, 1, -0.5, 0.5, 0.5,
0, -4.066884, -6.142709, 1, 1.5, 0.5, 0.5,
0, -4.066884, -6.142709, 0, 1.5, 0.5, 0.5,
1, -4.066884, -6.142709, 0, -0.5, 0.5, 0.5,
1, -4.066884, -6.142709, 1, -0.5, 0.5, 0.5,
1, -4.066884, -6.142709, 1, 1.5, 0.5, 0.5,
1, -4.066884, -6.142709, 0, 1.5, 0.5, 0.5,
2, -4.066884, -6.142709, 0, -0.5, 0.5, 0.5,
2, -4.066884, -6.142709, 1, -0.5, 0.5, 0.5,
2, -4.066884, -6.142709, 1, 1.5, 0.5, 0.5,
2, -4.066884, -6.142709, 0, 1.5, 0.5, 0.5,
3, -4.066884, -6.142709, 0, -0.5, 0.5, 0.5,
3, -4.066884, -6.142709, 1, -0.5, 0.5, 0.5,
3, -4.066884, -6.142709, 1, 1.5, 0.5, 0.5,
3, -4.066884, -6.142709, 0, 1.5, 0.5, 0.5
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
-3.529237, -3, -5.333043,
-3.529237, 3, -5.333043,
-3.529237, -3, -5.333043,
-3.70723, -3, -5.602931,
-3.529237, -2, -5.333043,
-3.70723, -2, -5.602931,
-3.529237, -1, -5.333043,
-3.70723, -1, -5.602931,
-3.529237, 0, -5.333043,
-3.70723, 0, -5.602931,
-3.529237, 1, -5.333043,
-3.70723, 1, -5.602931,
-3.529237, 2, -5.333043,
-3.70723, 2, -5.602931,
-3.529237, 3, -5.333043,
-3.70723, 3, -5.602931
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
-4.063217, -3, -6.142709, 0, -0.5, 0.5, 0.5,
-4.063217, -3, -6.142709, 1, -0.5, 0.5, 0.5,
-4.063217, -3, -6.142709, 1, 1.5, 0.5, 0.5,
-4.063217, -3, -6.142709, 0, 1.5, 0.5, 0.5,
-4.063217, -2, -6.142709, 0, -0.5, 0.5, 0.5,
-4.063217, -2, -6.142709, 1, -0.5, 0.5, 0.5,
-4.063217, -2, -6.142709, 1, 1.5, 0.5, 0.5,
-4.063217, -2, -6.142709, 0, 1.5, 0.5, 0.5,
-4.063217, -1, -6.142709, 0, -0.5, 0.5, 0.5,
-4.063217, -1, -6.142709, 1, -0.5, 0.5, 0.5,
-4.063217, -1, -6.142709, 1, 1.5, 0.5, 0.5,
-4.063217, -1, -6.142709, 0, 1.5, 0.5, 0.5,
-4.063217, 0, -6.142709, 0, -0.5, 0.5, 0.5,
-4.063217, 0, -6.142709, 1, -0.5, 0.5, 0.5,
-4.063217, 0, -6.142709, 1, 1.5, 0.5, 0.5,
-4.063217, 0, -6.142709, 0, 1.5, 0.5, 0.5,
-4.063217, 1, -6.142709, 0, -0.5, 0.5, 0.5,
-4.063217, 1, -6.142709, 1, -0.5, 0.5, 0.5,
-4.063217, 1, -6.142709, 1, 1.5, 0.5, 0.5,
-4.063217, 1, -6.142709, 0, 1.5, 0.5, 0.5,
-4.063217, 2, -6.142709, 0, -0.5, 0.5, 0.5,
-4.063217, 2, -6.142709, 1, -0.5, 0.5, 0.5,
-4.063217, 2, -6.142709, 1, 1.5, 0.5, 0.5,
-4.063217, 2, -6.142709, 0, 1.5, 0.5, 0.5,
-4.063217, 3, -6.142709, 0, -0.5, 0.5, 0.5,
-4.063217, 3, -6.142709, 1, -0.5, 0.5, 0.5,
-4.063217, 3, -6.142709, 1, 1.5, 0.5, 0.5,
-4.063217, 3, -6.142709, 0, 1.5, 0.5, 0.5
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
-3.529237, -3.539536, -4,
-3.529237, -3.539536, 4,
-3.529237, -3.539536, -4,
-3.70723, -3.715319, -4,
-3.529237, -3.539536, -2,
-3.70723, -3.715319, -2,
-3.529237, -3.539536, 0,
-3.70723, -3.715319, 0,
-3.529237, -3.539536, 2,
-3.70723, -3.715319, 2,
-3.529237, -3.539536, 4,
-3.70723, -3.715319, 4
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
-4.063217, -4.066884, -4, 0, -0.5, 0.5, 0.5,
-4.063217, -4.066884, -4, 1, -0.5, 0.5, 0.5,
-4.063217, -4.066884, -4, 1, 1.5, 0.5, 0.5,
-4.063217, -4.066884, -4, 0, 1.5, 0.5, 0.5,
-4.063217, -4.066884, -2, 0, -0.5, 0.5, 0.5,
-4.063217, -4.066884, -2, 1, -0.5, 0.5, 0.5,
-4.063217, -4.066884, -2, 1, 1.5, 0.5, 0.5,
-4.063217, -4.066884, -2, 0, 1.5, 0.5, 0.5,
-4.063217, -4.066884, 0, 0, -0.5, 0.5, 0.5,
-4.063217, -4.066884, 0, 1, -0.5, 0.5, 0.5,
-4.063217, -4.066884, 0, 1, 1.5, 0.5, 0.5,
-4.063217, -4.066884, 0, 0, 1.5, 0.5, 0.5,
-4.063217, -4.066884, 2, 0, -0.5, 0.5, 0.5,
-4.063217, -4.066884, 2, 1, -0.5, 0.5, 0.5,
-4.063217, -4.066884, 2, 1, 1.5, 0.5, 0.5,
-4.063217, -4.066884, 2, 0, 1.5, 0.5, 0.5,
-4.063217, -4.066884, 4, 0, -0.5, 0.5, 0.5,
-4.063217, -4.066884, 4, 1, -0.5, 0.5, 0.5,
-4.063217, -4.066884, 4, 1, 1.5, 0.5, 0.5,
-4.063217, -4.066884, 4, 0, 1.5, 0.5, 0.5
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
-3.529237, -3.539536, -5.333043,
-3.529237, 3.491755, -5.333043,
-3.529237, -3.539536, 5.462509,
-3.529237, 3.491755, 5.462509,
-3.529237, -3.539536, -5.333043,
-3.529237, -3.539536, 5.462509,
-3.529237, 3.491755, -5.333043,
-3.529237, 3.491755, 5.462509,
-3.529237, -3.539536, -5.333043,
3.590504, -3.539536, -5.333043,
-3.529237, -3.539536, 5.462509,
3.590504, -3.539536, 5.462509,
-3.529237, 3.491755, -5.333043,
3.590504, 3.491755, -5.333043,
-3.529237, 3.491755, 5.462509,
3.590504, 3.491755, 5.462509,
3.590504, -3.539536, -5.333043,
3.590504, 3.491755, -5.333043,
3.590504, -3.539536, 5.462509,
3.590504, 3.491755, 5.462509,
3.590504, -3.539536, -5.333043,
3.590504, -3.539536, 5.462509,
3.590504, 3.491755, -5.333043,
3.590504, 3.491755, 5.462509
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
var radius = 7.860109;
var distance = 34.97051;
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
mvMatrix.translate( -0.03063357, 0.02389061, -0.06473303 );
mvMatrix.scale( 1.193654, 1.208669, 0.7872227 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.97051);
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
penconazole<-read.table("penconazole.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-penconazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'penconazole' not found
```

```r
y<-penconazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'penconazole' not found
```

```r
z<-penconazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'penconazole' not found
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
-3.425551, -1.095984, -1.941775, 0, 0, 1, 1, 1,
-3.17736, 0.09861923, -2.503054, 1, 0, 0, 1, 1,
-3.14411, -0.7701077, -0.8555321, 1, 0, 0, 1, 1,
-3.003702, -1.112486, -2.062539, 1, 0, 0, 1, 1,
-2.996027, -0.2847118, -3.029169, 1, 0, 0, 1, 1,
-2.942735, 1.099586, -0.6983991, 1, 0, 0, 1, 1,
-2.914243, -1.927777, -2.516836, 0, 0, 0, 1, 1,
-2.816749, 0.3440863, -2.178441, 0, 0, 0, 1, 1,
-2.801399, -0.2061585, -1.869735, 0, 0, 0, 1, 1,
-2.348848, -0.1162935, -1.176151, 0, 0, 0, 1, 1,
-2.319796, 0.5644225, -2.166435, 0, 0, 0, 1, 1,
-2.269638, -0.0181595, -2.177098, 0, 0, 0, 1, 1,
-2.196606, 0.06085096, -0.1219504, 0, 0, 0, 1, 1,
-2.190694, -0.66824, -2.675874, 1, 1, 1, 1, 1,
-2.189047, -0.6222864, -2.390174, 1, 1, 1, 1, 1,
-2.186996, -0.3780998, -1.946812, 1, 1, 1, 1, 1,
-2.122891, 0.5975928, 0.01984687, 1, 1, 1, 1, 1,
-2.106243, 0.7984356, 0.4508187, 1, 1, 1, 1, 1,
-2.079898, -1.195624, -2.51527, 1, 1, 1, 1, 1,
-2.078341, -0.227467, -1.273795, 1, 1, 1, 1, 1,
-2.050204, 1.780067, -0.9267548, 1, 1, 1, 1, 1,
-1.960964, -0.03870913, -3.045765, 1, 1, 1, 1, 1,
-1.944262, 0.5975611, 0.05996769, 1, 1, 1, 1, 1,
-1.937178, 0.6632242, -1.93126, 1, 1, 1, 1, 1,
-1.926363, 1.536856, 0.2326761, 1, 1, 1, 1, 1,
-1.923948, -0.6708936, -3.010809, 1, 1, 1, 1, 1,
-1.909926, -1.112906, -2.900621, 1, 1, 1, 1, 1,
-1.892349, 0.6699001, -1.819577, 1, 1, 1, 1, 1,
-1.888179, -0.8991545, -1.713834, 0, 0, 1, 1, 1,
-1.849766, -1.706553, -3.257703, 1, 0, 0, 1, 1,
-1.82856, 0.5006549, 0.02680594, 1, 0, 0, 1, 1,
-1.807597, -0.4756739, -1.511459, 1, 0, 0, 1, 1,
-1.800898, 0.2123202, -1.461877, 1, 0, 0, 1, 1,
-1.800686, -0.301266, -1.082859, 1, 0, 0, 1, 1,
-1.792132, 1.344729, -0.617386, 0, 0, 0, 1, 1,
-1.791406, -0.05235204, -1.728605, 0, 0, 0, 1, 1,
-1.763149, -0.2261579, -1.277175, 0, 0, 0, 1, 1,
-1.762126, 2.253128, -1.549219, 0, 0, 0, 1, 1,
-1.753377, 0.6516185, -2.619557, 0, 0, 0, 1, 1,
-1.751632, -0.301942, -0.5953339, 0, 0, 0, 1, 1,
-1.740578, 0.1489003, -2.516653, 0, 0, 0, 1, 1,
-1.734761, -1.021569, -1.547638, 1, 1, 1, 1, 1,
-1.729537, 1.29054, -1.718079, 1, 1, 1, 1, 1,
-1.729081, 0.5519641, -0.8168802, 1, 1, 1, 1, 1,
-1.726902, 0.171273, -2.485297, 1, 1, 1, 1, 1,
-1.700897, 1.6998, -1.043638, 1, 1, 1, 1, 1,
-1.698191, -1.298482, -1.964599, 1, 1, 1, 1, 1,
-1.696747, -0.2334509, -2.128034, 1, 1, 1, 1, 1,
-1.695223, -0.9099758, -1.277184, 1, 1, 1, 1, 1,
-1.657067, -0.1529884, -1.05533, 1, 1, 1, 1, 1,
-1.642982, 1.917138, -2.097795, 1, 1, 1, 1, 1,
-1.632458, 1.026987, 0.5553011, 1, 1, 1, 1, 1,
-1.630176, -1.556972, -2.344899, 1, 1, 1, 1, 1,
-1.625503, -1.194827, -3.13007, 1, 1, 1, 1, 1,
-1.614414, -0.4950158, -2.720268, 1, 1, 1, 1, 1,
-1.609351, 1.771887, -1.326584, 1, 1, 1, 1, 1,
-1.608669, 0.2159633, -2.772841, 0, 0, 1, 1, 1,
-1.598256, -0.3719489, -2.343239, 1, 0, 0, 1, 1,
-1.593442, -0.5846112, -0.3098587, 1, 0, 0, 1, 1,
-1.579826, -1.93025, -2.142354, 1, 0, 0, 1, 1,
-1.574457, -0.7413058, -3.072199, 1, 0, 0, 1, 1,
-1.562712, -0.6073579, -2.098678, 1, 0, 0, 1, 1,
-1.554416, -0.001775461, -1.433526, 0, 0, 0, 1, 1,
-1.547034, 1.859477, -0.2258843, 0, 0, 0, 1, 1,
-1.530776, -0.9363908, -1.851316, 0, 0, 0, 1, 1,
-1.528951, 0.2632718, -0.2878726, 0, 0, 0, 1, 1,
-1.525621, -0.4906613, -1.843688, 0, 0, 0, 1, 1,
-1.511469, 0.04904622, -2.695932, 0, 0, 0, 1, 1,
-1.511045, -0.6908633, -3.260678, 0, 0, 0, 1, 1,
-1.507913, -0.4741632, -1.000397, 1, 1, 1, 1, 1,
-1.495674, 0.0859491, -2.215888, 1, 1, 1, 1, 1,
-1.49042, 0.4660532, -0.6671922, 1, 1, 1, 1, 1,
-1.489803, 1.524566, -1.604568, 1, 1, 1, 1, 1,
-1.482792, -0.8442065, -1.845604, 1, 1, 1, 1, 1,
-1.470513, 0.5799721, -0.8601709, 1, 1, 1, 1, 1,
-1.464568, -1.733056, -2.082122, 1, 1, 1, 1, 1,
-1.458398, 1.004561, -2.205868, 1, 1, 1, 1, 1,
-1.455106, -1.385583, -0.3601204, 1, 1, 1, 1, 1,
-1.454934, -0.5610425, -0.6553048, 1, 1, 1, 1, 1,
-1.448349, 0.1118917, 0.2751469, 1, 1, 1, 1, 1,
-1.440037, 0.948384, -0.9426193, 1, 1, 1, 1, 1,
-1.431199, -0.5623801, -0.3031984, 1, 1, 1, 1, 1,
-1.429997, 0.2058387, -1.336751, 1, 1, 1, 1, 1,
-1.421613, 0.7857335, -0.3337734, 1, 1, 1, 1, 1,
-1.419162, -0.08966332, -1.090616, 0, 0, 1, 1, 1,
-1.418263, 0.9970556, 0.6990283, 1, 0, 0, 1, 1,
-1.411878, 0.6745584, 0.5848811, 1, 0, 0, 1, 1,
-1.411735, 1.780286, -0.6348425, 1, 0, 0, 1, 1,
-1.411363, -1.86215, -2.393588, 1, 0, 0, 1, 1,
-1.410028, 0.2748789, -0.5163739, 1, 0, 0, 1, 1,
-1.403599, -0.4665692, -1.689365, 0, 0, 0, 1, 1,
-1.397938, 0.1341844, -0.1905142, 0, 0, 0, 1, 1,
-1.397527, -1.569881, -2.02449, 0, 0, 0, 1, 1,
-1.37982, -0.4100088, -0.546075, 0, 0, 0, 1, 1,
-1.375192, -0.2253678, -0.890227, 0, 0, 0, 1, 1,
-1.370535, 0.3272881, -4.232649, 0, 0, 0, 1, 1,
-1.368822, 1.0027, -0.2668106, 0, 0, 0, 1, 1,
-1.362556, -0.9641717, -0.8538028, 1, 1, 1, 1, 1,
-1.360105, 0.2223451, -1.559871, 1, 1, 1, 1, 1,
-1.344897, 0.5451564, -2.536441, 1, 1, 1, 1, 1,
-1.340425, -0.08154014, -2.125834, 1, 1, 1, 1, 1,
-1.338994, -0.2692026, -2.126732, 1, 1, 1, 1, 1,
-1.335715, 0.3481455, -2.348826, 1, 1, 1, 1, 1,
-1.334903, -1.670921, -2.578526, 1, 1, 1, 1, 1,
-1.322635, -0.07510393, -2.7399, 1, 1, 1, 1, 1,
-1.31852, -0.6579543, -2.671999, 1, 1, 1, 1, 1,
-1.318241, 1.826682, -0.1933424, 1, 1, 1, 1, 1,
-1.314929, -1.043498, -2.984972, 1, 1, 1, 1, 1,
-1.311983, -0.9984804, -1.434183, 1, 1, 1, 1, 1,
-1.307032, 0.4507374, -1.532947, 1, 1, 1, 1, 1,
-1.292591, -0.5494476, -2.903209, 1, 1, 1, 1, 1,
-1.29145, 0.977295, -1.784184, 1, 1, 1, 1, 1,
-1.272755, -0.630154, -3.502408, 0, 0, 1, 1, 1,
-1.266891, 0.7312155, -1.621703, 1, 0, 0, 1, 1,
-1.26045, 0.7949602, -1.223422, 1, 0, 0, 1, 1,
-1.251432, -0.2956635, -1.110739, 1, 0, 0, 1, 1,
-1.245977, 0.375226, -1.080169, 1, 0, 0, 1, 1,
-1.227206, -0.6652421, -3.122735, 1, 0, 0, 1, 1,
-1.222716, 1.471501, -0.7693952, 0, 0, 0, 1, 1,
-1.220806, 0.4308375, -1.548479, 0, 0, 0, 1, 1,
-1.2187, -0.9454234, -1.350994, 0, 0, 0, 1, 1,
-1.214147, 0.9834155, 1.036436, 0, 0, 0, 1, 1,
-1.200514, 1.098493, -0.5318037, 0, 0, 0, 1, 1,
-1.195571, -1.655453, -3.590012, 0, 0, 0, 1, 1,
-1.194868, 0.6708234, -1.095107, 0, 0, 0, 1, 1,
-1.193408, -0.5928153, -0.502926, 1, 1, 1, 1, 1,
-1.188629, 1.351104, 1.046324, 1, 1, 1, 1, 1,
-1.187923, 0.2887903, -1.545884, 1, 1, 1, 1, 1,
-1.177294, 0.6394005, -2.919739, 1, 1, 1, 1, 1,
-1.172453, -0.5083864, -1.43788, 1, 1, 1, 1, 1,
-1.172154, -1.029894, -2.455646, 1, 1, 1, 1, 1,
-1.165466, -1.675814, -3.615289, 1, 1, 1, 1, 1,
-1.16288, 0.2928437, -0.1523386, 1, 1, 1, 1, 1,
-1.149797, 0.6225673, -0.8591369, 1, 1, 1, 1, 1,
-1.149281, 1.882249, -0.8109199, 1, 1, 1, 1, 1,
-1.144375, 0.8116785, -0.167007, 1, 1, 1, 1, 1,
-1.126975, -1.001777, -1.276981, 1, 1, 1, 1, 1,
-1.119804, 0.9479775, -1.09745, 1, 1, 1, 1, 1,
-1.107227, -0.1690281, -2.304946, 1, 1, 1, 1, 1,
-1.10425, -1.468403, -1.511549, 1, 1, 1, 1, 1,
-1.100198, -1.054384, -3.219324, 0, 0, 1, 1, 1,
-1.095032, -0.6941884, -1.21827, 1, 0, 0, 1, 1,
-1.093774, 0.01603307, -2.118108, 1, 0, 0, 1, 1,
-1.088968, 0.4259578, -0.9360006, 1, 0, 0, 1, 1,
-1.066882, -1.686704, -2.804329, 1, 0, 0, 1, 1,
-1.06205, -0.2377845, -1.02535, 1, 0, 0, 1, 1,
-1.061898, -1.586264, -2.106468, 0, 0, 0, 1, 1,
-1.050704, -1.803787, -1.901224, 0, 0, 0, 1, 1,
-1.050251, 0.5149958, -0.6902298, 0, 0, 0, 1, 1,
-1.045014, 0.1922563, -1.512436, 0, 0, 0, 1, 1,
-1.035247, 1.280338, 0.7837151, 0, 0, 0, 1, 1,
-1.026285, -0.1554384, -1.939041, 0, 0, 0, 1, 1,
-1.024329, -0.8327292, -0.4126019, 0, 0, 0, 1, 1,
-1.024011, 9.618754e-06, -1.049194, 1, 1, 1, 1, 1,
-1.021243, -0.8603169, -2.407745, 1, 1, 1, 1, 1,
-1.020887, -0.8437583, -1.834711, 1, 1, 1, 1, 1,
-1.01371, 0.2028214, -1.760522, 1, 1, 1, 1, 1,
-1.01042, 1.003922, -1.402293, 1, 1, 1, 1, 1,
-1.007466, 0.3397461, -1.303912, 1, 1, 1, 1, 1,
-1.001823, -0.08821884, -3.214506, 1, 1, 1, 1, 1,
-0.9947315, 1.274122, -1.655331, 1, 1, 1, 1, 1,
-0.9902197, -0.8543628, -1.77174, 1, 1, 1, 1, 1,
-0.990131, -0.07948646, -1.916095, 1, 1, 1, 1, 1,
-0.9868296, -0.1513339, -1.099761, 1, 1, 1, 1, 1,
-0.9827343, 1.747162, -0.8674678, 1, 1, 1, 1, 1,
-0.9788716, 0.520464, -2.743034, 1, 1, 1, 1, 1,
-0.9758792, 1.322106, -1.273504, 1, 1, 1, 1, 1,
-0.9740263, 1.793849, 0.77909, 1, 1, 1, 1, 1,
-0.9729876, 0.2659344, -2.090761, 0, 0, 1, 1, 1,
-0.9690443, 0.1548752, -2.500173, 1, 0, 0, 1, 1,
-0.9682304, -0.9253768, -2.471323, 1, 0, 0, 1, 1,
-0.9637361, 0.7732642, 0.6963098, 1, 0, 0, 1, 1,
-0.9622006, -0.05848642, -3.606347, 1, 0, 0, 1, 1,
-0.9531432, 0.7489502, -0.6026337, 1, 0, 0, 1, 1,
-0.9506876, 1.559769, -0.3593453, 0, 0, 0, 1, 1,
-0.9506094, 0.3308261, 0.7553521, 0, 0, 0, 1, 1,
-0.9476174, -0.9387406, -2.417798, 0, 0, 0, 1, 1,
-0.943739, -0.5676894, -1.966591, 0, 0, 0, 1, 1,
-0.9428037, -1.095072, -0.8591136, 0, 0, 0, 1, 1,
-0.941941, -1.338634, -1.868783, 0, 0, 0, 1, 1,
-0.9350703, 0.9731451, -0.886592, 0, 0, 0, 1, 1,
-0.929861, -1.768983, -3.177765, 1, 1, 1, 1, 1,
-0.928035, -1.194835, -3.177599, 1, 1, 1, 1, 1,
-0.9267934, 1.090006, -0.02225056, 1, 1, 1, 1, 1,
-0.9206365, -2.16003, -4.157917, 1, 1, 1, 1, 1,
-0.9196828, 2.424721, -0.1692528, 1, 1, 1, 1, 1,
-0.9195923, -0.9008291, -2.109384, 1, 1, 1, 1, 1,
-0.9073125, -0.4634355, -3.159491, 1, 1, 1, 1, 1,
-0.902232, -0.1049393, -0.584475, 1, 1, 1, 1, 1,
-0.8971794, 0.5339016, -0.7527765, 1, 1, 1, 1, 1,
-0.8890103, -0.914299, -2.173289, 1, 1, 1, 1, 1,
-0.8868233, 0.3595619, -0.2588121, 1, 1, 1, 1, 1,
-0.8816506, -1.595719, -4.222701, 1, 1, 1, 1, 1,
-0.8760987, 0.6027406, -1.159528, 1, 1, 1, 1, 1,
-0.867457, 0.4744034, -3.637336, 1, 1, 1, 1, 1,
-0.8644793, 0.05374439, -2.05965, 1, 1, 1, 1, 1,
-0.8634997, 1.579738, -0.7328629, 0, 0, 1, 1, 1,
-0.8627541, 0.8508882, -2.445925, 1, 0, 0, 1, 1,
-0.8605781, -1.962368, -1.71277, 1, 0, 0, 1, 1,
-0.8524233, -0.5370336, -1.877639, 1, 0, 0, 1, 1,
-0.8350619, 0.3288159, -2.349308, 1, 0, 0, 1, 1,
-0.8325083, 1.070742, -2.708106, 1, 0, 0, 1, 1,
-0.8248802, 1.19532, -1.401224, 0, 0, 0, 1, 1,
-0.8235821, 1.738933, -0.7749125, 0, 0, 0, 1, 1,
-0.8233331, -1.432655, -1.638769, 0, 0, 0, 1, 1,
-0.8232905, -1.691978, -0.8945117, 0, 0, 0, 1, 1,
-0.8165466, 1.445096, 0.5730923, 0, 0, 0, 1, 1,
-0.8126819, 1.023204, 0.1884476, 0, 0, 0, 1, 1,
-0.8092844, -0.3716551, -0.8022326, 0, 0, 0, 1, 1,
-0.8011143, -0.328467, -1.359965, 1, 1, 1, 1, 1,
-0.7972357, -1.558736, 0.264151, 1, 1, 1, 1, 1,
-0.7952273, -0.8573606, -1.44821, 1, 1, 1, 1, 1,
-0.7947032, 1.140154, 0.4028431, 1, 1, 1, 1, 1,
-0.7925141, 1.625193, -0.6911802, 1, 1, 1, 1, 1,
-0.792193, 0.8869332, -0.5820614, 1, 1, 1, 1, 1,
-0.7861478, 1.141262, -0.4467385, 1, 1, 1, 1, 1,
-0.7859278, -0.7737069, -2.830544, 1, 1, 1, 1, 1,
-0.7842286, 1.687057, -1.498502, 1, 1, 1, 1, 1,
-0.774178, 0.2564061, -0.4919582, 1, 1, 1, 1, 1,
-0.7578449, -0.4784448, -1.932914, 1, 1, 1, 1, 1,
-0.7429354, -1.206444, -2.606449, 1, 1, 1, 1, 1,
-0.7401394, -1.25291, -2.321105, 1, 1, 1, 1, 1,
-0.7400476, -0.501106, -3.445636, 1, 1, 1, 1, 1,
-0.7381769, 0.2997257, -0.3528467, 1, 1, 1, 1, 1,
-0.7374789, -1.974058, -2.161813, 0, 0, 1, 1, 1,
-0.7373129, -0.3104759, -3.6911, 1, 0, 0, 1, 1,
-0.736998, 1.499828, -2.352782, 1, 0, 0, 1, 1,
-0.7330325, -0.7561649, -3.783902, 1, 0, 0, 1, 1,
-0.7322628, -0.1642386, -2.470094, 1, 0, 0, 1, 1,
-0.7291664, 0.3700255, -0.3593491, 1, 0, 0, 1, 1,
-0.7248486, -0.5699501, -0.6290159, 0, 0, 0, 1, 1,
-0.7242514, 0.003411096, -0.3616347, 0, 0, 0, 1, 1,
-0.7171776, 1.215732, -1.318076, 0, 0, 0, 1, 1,
-0.7157266, 0.03746411, -1.90216, 0, 0, 0, 1, 1,
-0.7078606, -0.5703349, -4.617381, 0, 0, 0, 1, 1,
-0.7072977, -0.08480012, -0.9549177, 0, 0, 0, 1, 1,
-0.7052766, -1.141262, -1.708677, 0, 0, 0, 1, 1,
-0.70423, -0.7378979, -2.099606, 1, 1, 1, 1, 1,
-0.7033905, -1.338476, -1.925987, 1, 1, 1, 1, 1,
-0.7022925, 0.3779234, -1.900012, 1, 1, 1, 1, 1,
-0.7012453, 1.037978, 0.3815888, 1, 1, 1, 1, 1,
-0.696586, 0.3051343, -1.478375, 1, 1, 1, 1, 1,
-0.6963159, -1.104227, -1.460358, 1, 1, 1, 1, 1,
-0.694782, -1.04919, -2.856194, 1, 1, 1, 1, 1,
-0.691415, -0.4397216, -1.70583, 1, 1, 1, 1, 1,
-0.6814938, 0.3546994, -1.57148, 1, 1, 1, 1, 1,
-0.6772625, -0.9575496, -1.346593, 1, 1, 1, 1, 1,
-0.6755057, -1.081091, -2.489464, 1, 1, 1, 1, 1,
-0.6688417, 0.50405, -0.9307166, 1, 1, 1, 1, 1,
-0.6662344, 0.5453616, -1.855274, 1, 1, 1, 1, 1,
-0.6652665, -0.7333319, -3.423021, 1, 1, 1, 1, 1,
-0.6620231, 1.630385, 1.185674, 1, 1, 1, 1, 1,
-0.6617625, -0.9073141, -1.872925, 0, 0, 1, 1, 1,
-0.6567038, -0.04335862, -1.646466, 1, 0, 0, 1, 1,
-0.6543993, -0.5686033, -1.28796, 1, 0, 0, 1, 1,
-0.6506896, -0.157039, -2.480786, 1, 0, 0, 1, 1,
-0.6447408, 0.798889, -2.353281, 1, 0, 0, 1, 1,
-0.6382275, 0.1545254, -1.466412, 1, 0, 0, 1, 1,
-0.6356094, 1.130235, -0.3146622, 0, 0, 0, 1, 1,
-0.6304995, 0.07897601, -0.7022852, 0, 0, 0, 1, 1,
-0.6302443, -0.7668918, -3.399479, 0, 0, 0, 1, 1,
-0.6296298, -0.1066699, -0.6343479, 0, 0, 0, 1, 1,
-0.6280138, -0.7999671, -2.780901, 0, 0, 0, 1, 1,
-0.6269607, -0.433133, -2.12534, 0, 0, 0, 1, 1,
-0.6193587, 1.436047, 0.725709, 0, 0, 0, 1, 1,
-0.6193476, 1.203068, -0.1759008, 1, 1, 1, 1, 1,
-0.6181544, -0.7344615, -2.442708, 1, 1, 1, 1, 1,
-0.6140499, 1.716279, -0.1142439, 1, 1, 1, 1, 1,
-0.6095041, -1.001317, -2.833196, 1, 1, 1, 1, 1,
-0.6069378, 0.001082993, -0.4854525, 1, 1, 1, 1, 1,
-0.6017354, -1.074065, -2.467897, 1, 1, 1, 1, 1,
-0.5958982, 0.1773726, -2.629913, 1, 1, 1, 1, 1,
-0.590792, 0.6046671, -0.3957532, 1, 1, 1, 1, 1,
-0.5891176, -0.5586595, -2.267143, 1, 1, 1, 1, 1,
-0.5887083, -0.323023, -2.661845, 1, 1, 1, 1, 1,
-0.5857921, -1.594489, -3.057511, 1, 1, 1, 1, 1,
-0.5856652, 0.9971175, -0.2745454, 1, 1, 1, 1, 1,
-0.5851699, -0.3920599, -2.273884, 1, 1, 1, 1, 1,
-0.5791051, -0.09161579, -2.448964, 1, 1, 1, 1, 1,
-0.5753781, 0.9396217, 1.507655, 1, 1, 1, 1, 1,
-0.568637, -1.75287, -2.645055, 0, 0, 1, 1, 1,
-0.5660212, 0.7272801, -0.5204381, 1, 0, 0, 1, 1,
-0.5641037, 0.1573561, -1.915772, 1, 0, 0, 1, 1,
-0.5559053, -0.6094137, -4.148509, 1, 0, 0, 1, 1,
-0.5553893, 1.133337, -0.7577512, 1, 0, 0, 1, 1,
-0.5547802, 0.8652384, 0.2024928, 1, 0, 0, 1, 1,
-0.5519612, 0.4022939, -2.532845, 0, 0, 0, 1, 1,
-0.5483707, 0.1079356, -0.1248544, 0, 0, 0, 1, 1,
-0.5409835, -0.3671151, -2.170183, 0, 0, 0, 1, 1,
-0.5378733, 0.3945889, -2.291411, 0, 0, 0, 1, 1,
-0.5359277, -1.195321, -2.146461, 0, 0, 0, 1, 1,
-0.5354853, -0.8087512, -1.872886, 0, 0, 0, 1, 1,
-0.5292791, 0.4876785, -2.440523, 0, 0, 0, 1, 1,
-0.5235913, -0.167414, -1.571059, 1, 1, 1, 1, 1,
-0.5231112, -1.06068, -4.46355, 1, 1, 1, 1, 1,
-0.5128425, -0.7724056, -3.371976, 1, 1, 1, 1, 1,
-0.5094557, 0.6180886, -0.4773671, 1, 1, 1, 1, 1,
-0.5068021, -0.08844724, -2.503085, 1, 1, 1, 1, 1,
-0.505272, 0.1705473, -1.072962, 1, 1, 1, 1, 1,
-0.5026989, -1.497542, -2.186132, 1, 1, 1, 1, 1,
-0.499091, 1.140954, 0.7689936, 1, 1, 1, 1, 1,
-0.4957358, 0.080117, -2.797408, 1, 1, 1, 1, 1,
-0.4910143, 1.239423, -0.3995289, 1, 1, 1, 1, 1,
-0.4909808, 1.300021, 0.6015049, 1, 1, 1, 1, 1,
-0.4892957, 0.41048, -0.9973863, 1, 1, 1, 1, 1,
-0.4764558, -0.2918667, -2.213306, 1, 1, 1, 1, 1,
-0.4753745, -1.029961, -1.900146, 1, 1, 1, 1, 1,
-0.4728041, 0.5967216, -0.6690241, 1, 1, 1, 1, 1,
-0.4691367, 0.6314444, 0.5864719, 0, 0, 1, 1, 1,
-0.4672185, 0.9756452, -0.9919876, 1, 0, 0, 1, 1,
-0.4649277, 0.0002850352, -3.742656, 1, 0, 0, 1, 1,
-0.4621555, 0.6053543, 0.3984296, 1, 0, 0, 1, 1,
-0.4619131, -1.291629, -4.480237, 1, 0, 0, 1, 1,
-0.4487838, -1.190235, -3.010475, 1, 0, 0, 1, 1,
-0.4476514, -0.1707226, -1.401213, 0, 0, 0, 1, 1,
-0.4451997, -0.6217381, -3.595258, 0, 0, 0, 1, 1,
-0.4430793, 0.6592624, -0.6827928, 0, 0, 0, 1, 1,
-0.4417897, 0.4345196, -0.8833839, 0, 0, 0, 1, 1,
-0.4413941, 1.287289, -1.01168, 0, 0, 0, 1, 1,
-0.4403636, 0.5851077, -1.369718, 0, 0, 0, 1, 1,
-0.438885, -0.2964552, -2.121026, 0, 0, 0, 1, 1,
-0.4356585, -0.1412595, -3.124324, 1, 1, 1, 1, 1,
-0.4312096, 0.7531123, -0.4909696, 1, 1, 1, 1, 1,
-0.4270649, -0.4437749, -1.74745, 1, 1, 1, 1, 1,
-0.4267883, 1.317873, 0.2303931, 1, 1, 1, 1, 1,
-0.4238877, -1.054254, -1.944943, 1, 1, 1, 1, 1,
-0.4182469, 0.2315139, -0.7865315, 1, 1, 1, 1, 1,
-0.4168178, 0.5767387, -0.6797881, 1, 1, 1, 1, 1,
-0.4132738, -0.658697, -1.527519, 1, 1, 1, 1, 1,
-0.4125156, -1.011713, -2.690395, 1, 1, 1, 1, 1,
-0.4112613, -1.734657, -3.938845, 1, 1, 1, 1, 1,
-0.4102819, -0.2964594, -1.093205, 1, 1, 1, 1, 1,
-0.4097591, -0.997724, -3.745133, 1, 1, 1, 1, 1,
-0.4086218, -0.3836355, -1.534295, 1, 1, 1, 1, 1,
-0.4085017, 0.2829458, -0.8581154, 1, 1, 1, 1, 1,
-0.4073294, -0.2506276, -1.872157, 1, 1, 1, 1, 1,
-0.4068853, 0.6334203, -1.482326, 0, 0, 1, 1, 1,
-0.4049335, -1.963145, -3.756846, 1, 0, 0, 1, 1,
-0.4046284, -0.7254614, -3.153889, 1, 0, 0, 1, 1,
-0.4041111, -0.07110664, 0.1476546, 1, 0, 0, 1, 1,
-0.3939488, 1.006812, -0.5843942, 1, 0, 0, 1, 1,
-0.3874774, 0.7674775, 0.3285599, 1, 0, 0, 1, 1,
-0.3853204, -1.721045, -2.385396, 0, 0, 0, 1, 1,
-0.3809284, 0.4228246, 1.690725, 0, 0, 0, 1, 1,
-0.3719062, -0.194386, -1.681136, 0, 0, 0, 1, 1,
-0.3705477, 0.2901461, -0.2145228, 0, 0, 0, 1, 1,
-0.3668018, 1.359621, 0.1015576, 0, 0, 0, 1, 1,
-0.3663875, 0.0194477, -1.977856, 0, 0, 0, 1, 1,
-0.3661695, 0.01138602, -1.2539, 0, 0, 0, 1, 1,
-0.3637353, 0.1495068, -1.048695, 1, 1, 1, 1, 1,
-0.3596692, -0.7823205, -4.055555, 1, 1, 1, 1, 1,
-0.359378, 1.191568, 0.1467379, 1, 1, 1, 1, 1,
-0.3592034, 1.279615, 1.415631, 1, 1, 1, 1, 1,
-0.3568324, -2.049843, -2.899314, 1, 1, 1, 1, 1,
-0.3553532, -0.5181789, -3.052402, 1, 1, 1, 1, 1,
-0.3517947, -0.7285122, -2.701706, 1, 1, 1, 1, 1,
-0.3505404, -1.425641, -2.259185, 1, 1, 1, 1, 1,
-0.3490206, -1.088109, -3.892939, 1, 1, 1, 1, 1,
-0.3411418, 1.509333, -0.2039869, 1, 1, 1, 1, 1,
-0.3386222, -0.1794477, -2.671851, 1, 1, 1, 1, 1,
-0.3319282, 0.785722, -2.07984, 1, 1, 1, 1, 1,
-0.3307818, 1.183338, 1.001428, 1, 1, 1, 1, 1,
-0.3285604, -0.4364587, -2.425352, 1, 1, 1, 1, 1,
-0.3262133, 0.3962096, -0.9138331, 1, 1, 1, 1, 1,
-0.3260735, -0.6551443, -4.59922, 0, 0, 1, 1, 1,
-0.3182681, -0.9430157, -1.517013, 1, 0, 0, 1, 1,
-0.3143102, 1.285186, -1.892505, 1, 0, 0, 1, 1,
-0.3138651, -1.312846, -3.069482, 1, 0, 0, 1, 1,
-0.313855, 1.765855, -1.028064, 1, 0, 0, 1, 1,
-0.3116676, 1.133333, -0.6244979, 1, 0, 0, 1, 1,
-0.3106915, -0.02870493, -0.5703782, 0, 0, 0, 1, 1,
-0.3076496, -0.8762613, -1.780841, 0, 0, 0, 1, 1,
-0.30494, -0.1645834, -2.306103, 0, 0, 0, 1, 1,
-0.3032215, -1.004599, -2.141599, 0, 0, 0, 1, 1,
-0.2979088, -1.099493, -4.631993, 0, 0, 0, 1, 1,
-0.2978823, -0.6680639, -4.810361, 0, 0, 0, 1, 1,
-0.2923984, 0.1462467, -0.9796664, 0, 0, 0, 1, 1,
-0.2902946, 0.3324001, -0.5920291, 1, 1, 1, 1, 1,
-0.2890754, -0.2221601, -2.41543, 1, 1, 1, 1, 1,
-0.2889224, -2.034953, -2.848524, 1, 1, 1, 1, 1,
-0.2878211, -1.026176, -2.359718, 1, 1, 1, 1, 1,
-0.2876646, 0.203116, -2.334991, 1, 1, 1, 1, 1,
-0.2825599, 0.6386365, -0.3356282, 1, 1, 1, 1, 1,
-0.2809302, -0.2160766, -2.875357, 1, 1, 1, 1, 1,
-0.280433, -0.05297715, -1.126432, 1, 1, 1, 1, 1,
-0.2731822, 0.02914618, -1.228053, 1, 1, 1, 1, 1,
-0.2709124, -0.1749022, -0.6132128, 1, 1, 1, 1, 1,
-0.2675509, 1.346384, -0.5635482, 1, 1, 1, 1, 1,
-0.265369, 0.8698068, 1.245462, 1, 1, 1, 1, 1,
-0.2647094, -0.7765175, -1.651632, 1, 1, 1, 1, 1,
-0.2503631, -0.5395482, -3.684596, 1, 1, 1, 1, 1,
-0.2462749, 0.8358713, -0.9296307, 1, 1, 1, 1, 1,
-0.245727, -0.305064, -3.390606, 0, 0, 1, 1, 1,
-0.2430285, -0.5586637, -1.529472, 1, 0, 0, 1, 1,
-0.2424878, -0.02192649, -1.282997, 1, 0, 0, 1, 1,
-0.2385378, -0.09921373, -0.8696399, 1, 0, 0, 1, 1,
-0.2376116, 0.7857266, 0.2507167, 1, 0, 0, 1, 1,
-0.237609, 0.07940122, -2.122834, 1, 0, 0, 1, 1,
-0.2364376, -1.100445, -3.805132, 0, 0, 0, 1, 1,
-0.2360533, 2.143407, -0.468391, 0, 0, 0, 1, 1,
-0.2356107, -0.1129667, -2.14375, 0, 0, 0, 1, 1,
-0.23375, 0.5958672, 1.349208, 0, 0, 0, 1, 1,
-0.2313183, 1.090774, -0.6588986, 0, 0, 0, 1, 1,
-0.2271771, -0.1655685, -1.788702, 0, 0, 0, 1, 1,
-0.217767, 0.1028757, -2.113539, 0, 0, 0, 1, 1,
-0.2177047, 1.140038, 0.1021244, 1, 1, 1, 1, 1,
-0.2125795, 0.7675313, -0.9597677, 1, 1, 1, 1, 1,
-0.2077166, -0.5118482, -1.834874, 1, 1, 1, 1, 1,
-0.2066327, -0.02408568, -0.794196, 1, 1, 1, 1, 1,
-0.2046767, 1.927835, 0.7335962, 1, 1, 1, 1, 1,
-0.2027885, -0.4687621, -2.956086, 1, 1, 1, 1, 1,
-0.2000718, 1.4402, 0.6635666, 1, 1, 1, 1, 1,
-0.196803, -1.29962, -4.432264, 1, 1, 1, 1, 1,
-0.1954311, 0.02720786, -0.9991128, 1, 1, 1, 1, 1,
-0.1935661, -0.5647658, -1.59024, 1, 1, 1, 1, 1,
-0.1914938, 0.6736386, -0.3453407, 1, 1, 1, 1, 1,
-0.1852952, 0.3030098, -2.120378, 1, 1, 1, 1, 1,
-0.1736561, 0.224973, 0.5496063, 1, 1, 1, 1, 1,
-0.1688161, 1.920012, 0.6797413, 1, 1, 1, 1, 1,
-0.162346, 0.9600228, -3.358212, 1, 1, 1, 1, 1,
-0.1523271, -1.150165, -3.864883, 0, 0, 1, 1, 1,
-0.1517728, -0.9184104, -3.552624, 1, 0, 0, 1, 1,
-0.1499122, -0.5847861, -2.828686, 1, 0, 0, 1, 1,
-0.1496609, -0.188482, -2.102331, 1, 0, 0, 1, 1,
-0.1489386, 0.4255791, -2.978014, 1, 0, 0, 1, 1,
-0.145746, -0.5899692, -1.727621, 1, 0, 0, 1, 1,
-0.1456931, -0.7180631, -2.215527, 0, 0, 0, 1, 1,
-0.1399405, -1.068919, -3.234126, 0, 0, 0, 1, 1,
-0.134624, -1.201935, -2.588474, 0, 0, 0, 1, 1,
-0.1330136, 2.183144, 0.2212331, 0, 0, 0, 1, 1,
-0.1311312, -0.1144005, -2.956434, 0, 0, 0, 1, 1,
-0.1236361, -0.2968481, -3.279171, 0, 0, 0, 1, 1,
-0.1219729, -1.360163, -3.224298, 0, 0, 0, 1, 1,
-0.1201524, 1.788343, -0.2651422, 1, 1, 1, 1, 1,
-0.119952, -1.498559, -4.097973, 1, 1, 1, 1, 1,
-0.1184022, 0.1769385, -0.694331, 1, 1, 1, 1, 1,
-0.1175839, -1.367222, -3.253774, 1, 1, 1, 1, 1,
-0.1154688, -0.4396335, -5.162944, 1, 1, 1, 1, 1,
-0.1142555, -2.251324, -2.924323, 1, 1, 1, 1, 1,
-0.1121813, 0.1949569, -1.12866, 1, 1, 1, 1, 1,
-0.1119899, 1.182465, 0.2725204, 1, 1, 1, 1, 1,
-0.1118464, -0.6281934, -2.738517, 1, 1, 1, 1, 1,
-0.1114065, 0.8003492, -1.019301, 1, 1, 1, 1, 1,
-0.1113591, -0.3617338, -2.071246, 1, 1, 1, 1, 1,
-0.1111793, 2.092884, -0.6596647, 1, 1, 1, 1, 1,
-0.1109712, 0.1100618, 2.343103, 1, 1, 1, 1, 1,
-0.1103356, -0.2901694, -2.454907, 1, 1, 1, 1, 1,
-0.1101296, -1.495903, -3.10813, 1, 1, 1, 1, 1,
-0.1089569, 1.558543, 0.1764065, 0, 0, 1, 1, 1,
-0.108932, 1.607918, 0.3759435, 1, 0, 0, 1, 1,
-0.1061993, -1.591265, -4.95338, 1, 0, 0, 1, 1,
-0.1043076, 1.059331, 1.950422, 1, 0, 0, 1, 1,
-0.1035305, 0.4481136, 0.2572443, 1, 0, 0, 1, 1,
-0.1025479, 0.03638063, -0.4718184, 1, 0, 0, 1, 1,
-0.0923062, -0.2264964, -2.538424, 0, 0, 0, 1, 1,
-0.08738577, -0.5613788, -3.103438, 0, 0, 0, 1, 1,
-0.08578888, -0.2870938, -2.822426, 0, 0, 0, 1, 1,
-0.0795393, 0.6900498, -1.116522, 0, 0, 0, 1, 1,
-0.07622863, -0.181794, -1.432265, 0, 0, 0, 1, 1,
-0.07275276, 0.2762827, -0.528771, 0, 0, 0, 1, 1,
-0.06541169, -0.4621318, -1.110676, 0, 0, 0, 1, 1,
-0.05904372, -0.6838443, -2.248984, 1, 1, 1, 1, 1,
-0.05887, -1.204774, -4.204825, 1, 1, 1, 1, 1,
-0.05580322, -0.8863816, -3.531316, 1, 1, 1, 1, 1,
-0.05466807, 2.09275, 0.2073758, 1, 1, 1, 1, 1,
-0.05421119, 0.5546423, -0.2107571, 1, 1, 1, 1, 1,
-0.05181111, -0.5396051, -3.754759, 1, 1, 1, 1, 1,
-0.0512419, -1.543331, -1.87421, 1, 1, 1, 1, 1,
-0.05017715, -0.230746, -5.175826, 1, 1, 1, 1, 1,
-0.04687623, -0.3872569, -3.599267, 1, 1, 1, 1, 1,
-0.04681731, -0.8331929, -3.227713, 1, 1, 1, 1, 1,
-0.04031826, 1.383874, -1.028956, 1, 1, 1, 1, 1,
-0.0389588, -1.314129, -4.553805, 1, 1, 1, 1, 1,
-0.03660681, 0.2475598, -0.007975642, 1, 1, 1, 1, 1,
-0.03472739, 1.164562, 0.1626013, 1, 1, 1, 1, 1,
-0.03105827, -0.7849028, -2.886631, 1, 1, 1, 1, 1,
-0.03017061, 0.847379, 0.6211723, 0, 0, 1, 1, 1,
-0.02852957, -0.5778507, -3.124366, 1, 0, 0, 1, 1,
-0.02828269, -0.4459228, -3.018088, 1, 0, 0, 1, 1,
-0.02682386, 0.6423984, 1.413423, 1, 0, 0, 1, 1,
-0.02621118, -0.6014995, -2.012719, 1, 0, 0, 1, 1,
-0.02416016, 0.3835447, 0.2447817, 1, 0, 0, 1, 1,
-0.02142649, -0.5152448, -2.834928, 0, 0, 0, 1, 1,
-0.02011464, 0.825474, 0.03451799, 0, 0, 0, 1, 1,
-0.01811544, 1.893479, 2.555783, 0, 0, 0, 1, 1,
-0.01781009, -0.4611013, -2.29363, 0, 0, 0, 1, 1,
-0.01528113, 0.7097467, -0.1776416, 0, 0, 0, 1, 1,
-0.01468809, 0.5756327, 0.8934681, 0, 0, 0, 1, 1,
-0.01376783, 1.488808, 1.236806, 0, 0, 0, 1, 1,
-0.01330935, -0.05178253, -1.87779, 1, 1, 1, 1, 1,
-0.007076832, 0.5068032, -0.9392874, 1, 1, 1, 1, 1,
-0.006068616, -0.3731242, -3.366436, 1, 1, 1, 1, 1,
0.003925754, 1.022887, 1.690862, 1, 1, 1, 1, 1,
0.007344622, 0.05685095, 2.164837, 1, 1, 1, 1, 1,
0.01096002, -0.4229766, 4.211706, 1, 1, 1, 1, 1,
0.0127792, 0.2090622, 0.5551465, 1, 1, 1, 1, 1,
0.01486298, -0.5311378, 2.442624, 1, 1, 1, 1, 1,
0.02000474, -0.5028185, 1.883006, 1, 1, 1, 1, 1,
0.02577236, -1.267679, 3.118346, 1, 1, 1, 1, 1,
0.02742695, 0.5032242, 0.6005192, 1, 1, 1, 1, 1,
0.02970112, 0.0473453, 1.139228, 1, 1, 1, 1, 1,
0.03169357, 0.4054902, 2.028359, 1, 1, 1, 1, 1,
0.0333389, -1.146169, 1.032887, 1, 1, 1, 1, 1,
0.03940046, 0.5668238, 0.9720941, 1, 1, 1, 1, 1,
0.03965475, 0.3378762, 0.170188, 0, 0, 1, 1, 1,
0.04371181, -0.940962, 3.839689, 1, 0, 0, 1, 1,
0.04395263, 0.8672643, 0.3688231, 1, 0, 0, 1, 1,
0.04515431, -0.1827491, 3.010937, 1, 0, 0, 1, 1,
0.04961941, 1.532055, 0.8563223, 1, 0, 0, 1, 1,
0.05071878, 0.7215967, 0.5080179, 1, 0, 0, 1, 1,
0.05200214, 0.05730455, 0.3430069, 0, 0, 0, 1, 1,
0.0536726, -0.6430163, 3.849789, 0, 0, 0, 1, 1,
0.05522792, 1.677531, 0.8458653, 0, 0, 0, 1, 1,
0.06275895, 1.292511, -0.3157716, 0, 0, 0, 1, 1,
0.06548706, 1.168613, 0.3647806, 0, 0, 0, 1, 1,
0.06727929, -0.7796986, 4.309113, 0, 0, 0, 1, 1,
0.06847057, -1.238619, 3.13593, 0, 0, 0, 1, 1,
0.07305682, -1.526568, 3.700912, 1, 1, 1, 1, 1,
0.07692333, 1.817503, 0.846615, 1, 1, 1, 1, 1,
0.07840621, 1.696138, 0.1749479, 1, 1, 1, 1, 1,
0.07960156, -0.9302906, 4.111033, 1, 1, 1, 1, 1,
0.08021653, 0.3000084, -1.836407, 1, 1, 1, 1, 1,
0.0881465, -0.3541224, 3.047276, 1, 1, 1, 1, 1,
0.09159974, 2.319131, -0.1210119, 1, 1, 1, 1, 1,
0.09295188, 0.2898213, 2.247828, 1, 1, 1, 1, 1,
0.09368234, -0.04383279, 2.165194, 1, 1, 1, 1, 1,
0.09391532, 0.7207612, 0.2952522, 1, 1, 1, 1, 1,
0.09457631, -1.080765, 1.532761, 1, 1, 1, 1, 1,
0.09881055, 0.03316579, 1.822934, 1, 1, 1, 1, 1,
0.100323, 0.7558807, 2.382559, 1, 1, 1, 1, 1,
0.1010353, -0.7368839, 2.815291, 1, 1, 1, 1, 1,
0.1054241, -0.2015179, 1.862664, 1, 1, 1, 1, 1,
0.1111983, 0.4284883, -0.8040808, 0, 0, 1, 1, 1,
0.1116729, 1.238115, 0.8221356, 1, 0, 0, 1, 1,
0.1137341, -0.9325143, 1.986945, 1, 0, 0, 1, 1,
0.1158309, 0.903985, -0.5240685, 1, 0, 0, 1, 1,
0.1174193, 0.7071716, -0.1475924, 1, 0, 0, 1, 1,
0.1193484, 0.1356629, 2.604288, 1, 0, 0, 1, 1,
0.1215599, -1.370507, 3.835684, 0, 0, 0, 1, 1,
0.1251431, 0.2196793, 0.6199954, 0, 0, 0, 1, 1,
0.1288992, 0.5494277, -0.3396165, 0, 0, 0, 1, 1,
0.1296074, -0.1150708, 3.171428, 0, 0, 0, 1, 1,
0.1346261, -0.3519209, 3.301831, 0, 0, 0, 1, 1,
0.1351796, -0.02504518, 1.82247, 0, 0, 0, 1, 1,
0.1359134, 0.1939407, 0.6272219, 0, 0, 0, 1, 1,
0.1366975, -0.1088778, 2.288256, 1, 1, 1, 1, 1,
0.1379313, 1.098908, -1.228334, 1, 1, 1, 1, 1,
0.1393782, -0.351773, 2.997721, 1, 1, 1, 1, 1,
0.1406606, -0.3155637, 1.769983, 1, 1, 1, 1, 1,
0.1414629, 0.06328473, 0.1324795, 1, 1, 1, 1, 1,
0.1467893, -1.54751, 3.907613, 1, 1, 1, 1, 1,
0.1473633, -0.2103859, 3.287976, 1, 1, 1, 1, 1,
0.1486067, 0.1993957, 1.486356, 1, 1, 1, 1, 1,
0.1513971, 0.2126831, -0.6641245, 1, 1, 1, 1, 1,
0.1528193, -0.424652, 2.58674, 1, 1, 1, 1, 1,
0.1573128, 1.853558, 0.5083842, 1, 1, 1, 1, 1,
0.1601999, 1.504589, -0.3924161, 1, 1, 1, 1, 1,
0.1642481, -0.6082252, 3.575232, 1, 1, 1, 1, 1,
0.1644578, -1.308186, 2.690727, 1, 1, 1, 1, 1,
0.1699807, 0.07153513, 2.87471, 1, 1, 1, 1, 1,
0.1713512, -0.4861218, 2.303155, 0, 0, 1, 1, 1,
0.1721659, -0.6153615, 3.069085, 1, 0, 0, 1, 1,
0.1826796, -0.4519796, 2.852194, 1, 0, 0, 1, 1,
0.1870054, -1.056005, 3.968513, 1, 0, 0, 1, 1,
0.1870295, -0.992386, 3.190985, 1, 0, 0, 1, 1,
0.1917131, 1.124349, -0.6441298, 1, 0, 0, 1, 1,
0.1958707, 0.7152567, -0.1844668, 0, 0, 0, 1, 1,
0.2001508, 1.408178, -0.2258279, 0, 0, 0, 1, 1,
0.2010066, -0.7541263, 1.096421, 0, 0, 0, 1, 1,
0.2011164, -0.7403695, 2.410424, 0, 0, 0, 1, 1,
0.2011279, 0.9559808, 0.3472572, 0, 0, 0, 1, 1,
0.2050355, 0.3144921, 0.2587014, 0, 0, 0, 1, 1,
0.2052198, 0.8435023, -0.1666785, 0, 0, 0, 1, 1,
0.2054392, 0.1825491, 0.8588301, 1, 1, 1, 1, 1,
0.2068426, 1.493189, 0.5811183, 1, 1, 1, 1, 1,
0.208723, -0.7169544, 5.305292, 1, 1, 1, 1, 1,
0.2087363, 1.380129, -1.431401, 1, 1, 1, 1, 1,
0.2088035, -1.505866, 1.916267, 1, 1, 1, 1, 1,
0.208966, -0.7122823, 2.426079, 1, 1, 1, 1, 1,
0.2103541, -0.01340613, 1.718194, 1, 1, 1, 1, 1,
0.2115153, -0.3655234, 4.712099, 1, 1, 1, 1, 1,
0.2191084, -0.5442223, 2.914789, 1, 1, 1, 1, 1,
0.2199493, 0.1111882, 0.9223423, 1, 1, 1, 1, 1,
0.2202428, -0.9653958, 3.176898, 1, 1, 1, 1, 1,
0.2228812, -0.9937744, 1.581612, 1, 1, 1, 1, 1,
0.2231672, 1.52931, -1.399358, 1, 1, 1, 1, 1,
0.223194, 0.03573562, 0.6502381, 1, 1, 1, 1, 1,
0.2266322, -0.2151176, 2.230489, 1, 1, 1, 1, 1,
0.2281216, 1.456863, 1.438247, 0, 0, 1, 1, 1,
0.2287767, -1.109883, 3.589902, 1, 0, 0, 1, 1,
0.2313458, 0.5900486, 0.8068767, 1, 0, 0, 1, 1,
0.2344011, 0.9390655, -0.3872824, 1, 0, 0, 1, 1,
0.2387827, -0.571306, 1.532176, 1, 0, 0, 1, 1,
0.2396328, 0.1721824, 0.2792518, 1, 0, 0, 1, 1,
0.2413821, -0.3477259, 3.069781, 0, 0, 0, 1, 1,
0.2415727, 0.8741177, 0.004578257, 0, 0, 0, 1, 1,
0.2426128, 0.4053232, 1.132007, 0, 0, 0, 1, 1,
0.2428223, 0.3477128, 0.2428478, 0, 0, 0, 1, 1,
0.2444303, 0.2177977, 0.2670717, 0, 0, 0, 1, 1,
0.2461859, -0.2267534, 2.680943, 0, 0, 0, 1, 1,
0.2505054, -0.1173336, 2.5032, 0, 0, 0, 1, 1,
0.2513881, 1.13755, -0.4753305, 1, 1, 1, 1, 1,
0.2629929, 0.7411807, 0.239587, 1, 1, 1, 1, 1,
0.2652291, 0.1648853, 0.9182525, 1, 1, 1, 1, 1,
0.2654484, 1.249861, -1.175597, 1, 1, 1, 1, 1,
0.2691506, 0.6765797, -1.043466, 1, 1, 1, 1, 1,
0.2720095, -0.4390968, 2.015496, 1, 1, 1, 1, 1,
0.2808267, 1.599561, -0.3418651, 1, 1, 1, 1, 1,
0.2827229, 1.634806, 1.001277, 1, 1, 1, 1, 1,
0.2830897, 1.117283, -0.3904983, 1, 1, 1, 1, 1,
0.292843, -0.3105167, 1.427871, 1, 1, 1, 1, 1,
0.2938541, -0.9727191, 1.945456, 1, 1, 1, 1, 1,
0.298348, 0.6830485, 0.5032471, 1, 1, 1, 1, 1,
0.3007848, 1.62089, 0.8709178, 1, 1, 1, 1, 1,
0.3067816, -0.7320587, 3.919989, 1, 1, 1, 1, 1,
0.3106855, -0.3878951, 0.4737884, 1, 1, 1, 1, 1,
0.3128849, 0.3241291, 2.157125, 0, 0, 1, 1, 1,
0.3135513, 0.01409733, 1.886316, 1, 0, 0, 1, 1,
0.3192231, -1.769691, 4.800515, 1, 0, 0, 1, 1,
0.3192731, -0.7762541, 1.858752, 1, 0, 0, 1, 1,
0.3197497, 0.6118181, 0.9066734, 1, 0, 0, 1, 1,
0.3292438, -0.1600695, 1.111682, 1, 0, 0, 1, 1,
0.3301174, -2.067262, 1.918564, 0, 0, 0, 1, 1,
0.3318759, -0.6504286, 3.865041, 0, 0, 0, 1, 1,
0.3349766, 0.0149577, 2.398726, 0, 0, 0, 1, 1,
0.336006, 0.5974171, 2.548278, 0, 0, 0, 1, 1,
0.3382582, -0.5919117, 2.978728, 0, 0, 0, 1, 1,
0.3423135, -0.8850752, 2.147102, 0, 0, 0, 1, 1,
0.3450695, -0.8130538, 2.00158, 0, 0, 0, 1, 1,
0.3458802, -1.641059, 0.8187962, 1, 1, 1, 1, 1,
0.3466283, -1.614819, 1.900393, 1, 1, 1, 1, 1,
0.3499327, -0.3455189, 3.652793, 1, 1, 1, 1, 1,
0.3551831, 1.577859, -0.1262135, 1, 1, 1, 1, 1,
0.3571458, 0.6031931, 0.1018434, 1, 1, 1, 1, 1,
0.3581744, -0.5861785, 2.713984, 1, 1, 1, 1, 1,
0.3587585, 0.6654335, 3.342182, 1, 1, 1, 1, 1,
0.359369, 0.3553233, 1.535122, 1, 1, 1, 1, 1,
0.3662463, 1.545905, -0.03115503, 1, 1, 1, 1, 1,
0.3687691, -1.35867, 2.850278, 1, 1, 1, 1, 1,
0.3735951, -0.6859808, 3.909315, 1, 1, 1, 1, 1,
0.378009, 0.01152323, 2.448456, 1, 1, 1, 1, 1,
0.3833283, 0.4787191, 0.4260378, 1, 1, 1, 1, 1,
0.3854417, -2.572772, 2.515322, 1, 1, 1, 1, 1,
0.3862575, -1.932428, 1.622529, 1, 1, 1, 1, 1,
0.3872204, 0.144938, -0.2556689, 0, 0, 1, 1, 1,
0.3885446, 0.8991135, 0.9315705, 1, 0, 0, 1, 1,
0.4000142, -0.1586299, 1.717995, 1, 0, 0, 1, 1,
0.4003705, -1.000993, 1.850289, 1, 0, 0, 1, 1,
0.4007414, -0.07320477, 1.447952, 1, 0, 0, 1, 1,
0.4042451, -0.5840489, 0.9521868, 1, 0, 0, 1, 1,
0.4053516, 1.216333, 1.9841, 0, 0, 0, 1, 1,
0.406212, 0.05880353, 0.4800453, 0, 0, 0, 1, 1,
0.4063037, -0.1325837, 1.898853, 0, 0, 0, 1, 1,
0.4097852, -0.3972932, 3.633563, 0, 0, 0, 1, 1,
0.4102473, -0.2115716, 2.382494, 0, 0, 0, 1, 1,
0.4122224, 0.4364601, 0.5355244, 0, 0, 0, 1, 1,
0.4155146, -0.5239251, 2.712921, 0, 0, 0, 1, 1,
0.417653, 0.8279527, 1.802432, 1, 1, 1, 1, 1,
0.4197994, 0.4786718, 0.871425, 1, 1, 1, 1, 1,
0.4231187, 0.2432316, 1.464202, 1, 1, 1, 1, 1,
0.4250607, -0.4680744, 1.639143, 1, 1, 1, 1, 1,
0.4257903, -0.2701446, 2.390892, 1, 1, 1, 1, 1,
0.4269494, -1.313515, 2.69564, 1, 1, 1, 1, 1,
0.4272529, -0.03179926, 1.328235, 1, 1, 1, 1, 1,
0.4297453, 0.8409751, -0.1748016, 1, 1, 1, 1, 1,
0.4303925, 0.6497735, 1.181629, 1, 1, 1, 1, 1,
0.43106, -0.4095277, 1.459321, 1, 1, 1, 1, 1,
0.4320139, 0.9924273, -1.310484, 1, 1, 1, 1, 1,
0.4349189, -2.281516, 1.360971, 1, 1, 1, 1, 1,
0.435161, -0.05483754, 1.935545, 1, 1, 1, 1, 1,
0.4357658, -1.185497, 2.179615, 1, 1, 1, 1, 1,
0.4384133, -1.385646, 4.087045, 1, 1, 1, 1, 1,
0.4425606, -0.7902352, 1.284162, 0, 0, 1, 1, 1,
0.4432307, -0.6640816, 1.389154, 1, 0, 0, 1, 1,
0.443981, 0.4510761, 2.020519, 1, 0, 0, 1, 1,
0.4458609, -1.1747, 1.66182, 1, 0, 0, 1, 1,
0.4475786, -0.124091, 4.115258, 1, 0, 0, 1, 1,
0.4482086, -0.3937804, 3.641353, 1, 0, 0, 1, 1,
0.44875, -0.9775147, 2.790831, 0, 0, 0, 1, 1,
0.4489092, -0.591244, 4.949454, 0, 0, 0, 1, 1,
0.4573374, -0.3199126, 2.449145, 0, 0, 0, 1, 1,
0.4636601, 2.434278, 1.014409, 0, 0, 0, 1, 1,
0.4657189, 1.585913, 1.818521, 0, 0, 0, 1, 1,
0.4678464, 0.4462433, -0.5225171, 0, 0, 0, 1, 1,
0.4682196, 1.368378, -0.8880724, 0, 0, 0, 1, 1,
0.4722481, -0.7856215, 2.418904, 1, 1, 1, 1, 1,
0.4812134, -0.03173706, 0.5840082, 1, 1, 1, 1, 1,
0.4863968, -0.3912158, 2.16493, 1, 1, 1, 1, 1,
0.492952, 1.019726, 1.006485, 1, 1, 1, 1, 1,
0.4986102, -0.5507176, 3.55947, 1, 1, 1, 1, 1,
0.4995182, -1.472306, 2.518194, 1, 1, 1, 1, 1,
0.499776, 0.07977693, 0.8384884, 1, 1, 1, 1, 1,
0.5038424, -1.076072, 3.16921, 1, 1, 1, 1, 1,
0.5043743, 1.767992, 0.3057877, 1, 1, 1, 1, 1,
0.5072694, 0.610276, 1.566202, 1, 1, 1, 1, 1,
0.5143202, 0.01028219, 2.413677, 1, 1, 1, 1, 1,
0.5151439, 0.4717145, 0.5571524, 1, 1, 1, 1, 1,
0.5190049, -0.2816838, 0.7742919, 1, 1, 1, 1, 1,
0.5270315, 0.7184188, 0.8613356, 1, 1, 1, 1, 1,
0.5273217, 0.9993134, -0.944039, 1, 1, 1, 1, 1,
0.531729, -0.5642085, 1.843899, 0, 0, 1, 1, 1,
0.5317532, -1.046188, 1.55087, 1, 0, 0, 1, 1,
0.5347821, -1.091128, 2.125377, 1, 0, 0, 1, 1,
0.5384648, -0.536833, 2.022199, 1, 0, 0, 1, 1,
0.541867, 0.5044935, 1.567803, 1, 0, 0, 1, 1,
0.5422319, 0.1288586, 1.430292, 1, 0, 0, 1, 1,
0.5440354, 1.450337, 0.3587292, 0, 0, 0, 1, 1,
0.5441018, 0.2146568, 1.84216, 0, 0, 0, 1, 1,
0.5475946, 0.01579322, 1.695421, 0, 0, 0, 1, 1,
0.5487061, -0.5906841, 3.800522, 0, 0, 0, 1, 1,
0.5525064, 0.7167949, 1.234818, 0, 0, 0, 1, 1,
0.5556042, 0.257551, 1.841564, 0, 0, 0, 1, 1,
0.5580741, 0.02345948, 2.830444, 0, 0, 0, 1, 1,
0.5584752, 1.136246, -1.104528, 1, 1, 1, 1, 1,
0.5731528, -0.8730153, 2.109765, 1, 1, 1, 1, 1,
0.5739306, -1.500278, 2.835808, 1, 1, 1, 1, 1,
0.5749742, 0.5709022, 0.08428077, 1, 1, 1, 1, 1,
0.5754123, -0.2981206, 1.287251, 1, 1, 1, 1, 1,
0.5846469, 1.230986, 1.026985, 1, 1, 1, 1, 1,
0.5847038, 1.527236, 0.819329, 1, 1, 1, 1, 1,
0.5859573, -0.3350573, 1.70771, 1, 1, 1, 1, 1,
0.5893484, 1.159931, -2.323853, 1, 1, 1, 1, 1,
0.59205, 1.065886, 1.905122, 1, 1, 1, 1, 1,
0.5939358, -1.02517, 1.929295, 1, 1, 1, 1, 1,
0.5981051, 0.5850801, 0.326695, 1, 1, 1, 1, 1,
0.6002001, 0.5927838, 0.733229, 1, 1, 1, 1, 1,
0.6081746, -1.918057, 0.4822942, 1, 1, 1, 1, 1,
0.6128055, -0.3711386, 1.878903, 1, 1, 1, 1, 1,
0.6186262, 0.9220936, 0.4048667, 0, 0, 1, 1, 1,
0.6303686, 1.730477, -1.099474, 1, 0, 0, 1, 1,
0.6317114, 1.148781, 2.422033, 1, 0, 0, 1, 1,
0.6372892, 0.3498108, 0.2012996, 1, 0, 0, 1, 1,
0.6373923, -0.7424975, -0.0373205, 1, 0, 0, 1, 1,
0.6411797, -0.8873886, 3.908621, 1, 0, 0, 1, 1,
0.6418244, -2.136049, 2.431349, 0, 0, 0, 1, 1,
0.6422259, 0.5258401, 0.8472175, 0, 0, 0, 1, 1,
0.6441118, -0.9111869, 2.202215, 0, 0, 0, 1, 1,
0.65043, -0.5500441, 4.122694, 0, 0, 0, 1, 1,
0.6515266, -0.1573494, 2.419581, 0, 0, 0, 1, 1,
0.6520678, 0.02323288, 1.287135, 0, 0, 0, 1, 1,
0.6552368, -0.7683998, 2.858247, 0, 0, 0, 1, 1,
0.6620556, 1.310653, -0.1416374, 1, 1, 1, 1, 1,
0.6625734, 0.5574595, 1.092773, 1, 1, 1, 1, 1,
0.6675931, -0.7222794, 1.504243, 1, 1, 1, 1, 1,
0.6772249, -0.8155566, 1.849248, 1, 1, 1, 1, 1,
0.6808745, 1.034315, -0.3616894, 1, 1, 1, 1, 1,
0.6861468, 3.389358, 0.9934998, 1, 1, 1, 1, 1,
0.6924606, -0.4927472, 0.6942717, 1, 1, 1, 1, 1,
0.6934067, 0.8066934, 3.037812, 1, 1, 1, 1, 1,
0.6971689, -1.669855, 4.801799, 1, 1, 1, 1, 1,
0.6973717, 0.1778304, 0.7918434, 1, 1, 1, 1, 1,
0.6974561, -2.141787, 4.135402, 1, 1, 1, 1, 1,
0.7043369, -0.8174015, 3.004796, 1, 1, 1, 1, 1,
0.7065794, 0.9551727, 1.786075, 1, 1, 1, 1, 1,
0.7136498, 0.5149823, 1.345089, 1, 1, 1, 1, 1,
0.7194158, 0.2670713, 1.713064, 1, 1, 1, 1, 1,
0.7225356, -0.8253939, 1.722151, 0, 0, 1, 1, 1,
0.7233091, -0.2531352, 2.291057, 1, 0, 0, 1, 1,
0.7243259, 0.1079985, 1.214703, 1, 0, 0, 1, 1,
0.7288974, -0.4780971, 0.8281259, 1, 0, 0, 1, 1,
0.7290902, -0.3931804, 2.822879, 1, 0, 0, 1, 1,
0.7302207, 0.4323429, 0.4477958, 1, 0, 0, 1, 1,
0.7316197, -1.023457, 2.267979, 0, 0, 0, 1, 1,
0.7342492, 0.417367, 0.7085528, 0, 0, 0, 1, 1,
0.7370349, 0.4913776, 0.7178741, 0, 0, 0, 1, 1,
0.7409192, -1.772166, 4.248276, 0, 0, 0, 1, 1,
0.749199, 0.7320191, -0.4773188, 0, 0, 0, 1, 1,
0.750666, -1.975334, 1.911454, 0, 0, 0, 1, 1,
0.7507431, 0.5103219, 1.187935, 0, 0, 0, 1, 1,
0.7601712, -1.789994, 1.232813, 1, 1, 1, 1, 1,
0.7645566, 0.7617919, 0.9713393, 1, 1, 1, 1, 1,
0.7650134, -0.2804334, 0.6337366, 1, 1, 1, 1, 1,
0.7655536, -1.805073, 2.039573, 1, 1, 1, 1, 1,
0.7720609, 0.4198821, 0.3196772, 1, 1, 1, 1, 1,
0.7728342, 0.9301116, 2.027569, 1, 1, 1, 1, 1,
0.7777742, 0.04138485, 1.155788, 1, 1, 1, 1, 1,
0.778307, 1.317689, 1.447404, 1, 1, 1, 1, 1,
0.7848028, 0.4656797, 2.037894, 1, 1, 1, 1, 1,
0.7854177, 0.4270895, 1.222763, 1, 1, 1, 1, 1,
0.7861143, -1.084258, 2.389405, 1, 1, 1, 1, 1,
0.788973, 1.369198, -1.141372, 1, 1, 1, 1, 1,
0.7975958, -1.614101, 2.472482, 1, 1, 1, 1, 1,
0.7986001, 0.5000051, -0.7545201, 1, 1, 1, 1, 1,
0.7996199, 0.7293566, -0.6548026, 1, 1, 1, 1, 1,
0.7996759, 0.1891028, 0.6166419, 0, 0, 1, 1, 1,
0.8015636, 0.633016, 0.3298195, 1, 0, 0, 1, 1,
0.8021177, -0.8257277, 1.919562, 1, 0, 0, 1, 1,
0.8035111, 0.3303787, 1.201042, 1, 0, 0, 1, 1,
0.804621, -1.35426, 1.009861, 1, 0, 0, 1, 1,
0.812361, -0.01473029, 0.7718444, 1, 0, 0, 1, 1,
0.8127466, -0.7236684, 2.542122, 0, 0, 0, 1, 1,
0.813504, -2.261682, 2.866589, 0, 0, 0, 1, 1,
0.815088, -2.313667, 2.750824, 0, 0, 0, 1, 1,
0.8216478, 0.9052737, 1.857928, 0, 0, 0, 1, 1,
0.8245674, 0.5893699, 0.03249181, 0, 0, 0, 1, 1,
0.8305793, -0.2130631, 2.61202, 0, 0, 0, 1, 1,
0.8440126, -0.03547451, 0.2175043, 0, 0, 0, 1, 1,
0.8443214, -0.9881793, 3.150135, 1, 1, 1, 1, 1,
0.8525917, -0.2107485, 0.5046162, 1, 1, 1, 1, 1,
0.855165, 1.852092, 0.5415702, 1, 1, 1, 1, 1,
0.8606683, 0.737444, -1.016194, 1, 1, 1, 1, 1,
0.8676448, 0.0740485, 0.9569384, 1, 1, 1, 1, 1,
0.8700764, 1.532714, -0.4505879, 1, 1, 1, 1, 1,
0.8736671, 0.7385669, 1.2256, 1, 1, 1, 1, 1,
0.8758803, 0.2313315, 1.3547, 1, 1, 1, 1, 1,
0.8815885, 0.01361535, 3.555713, 1, 1, 1, 1, 1,
0.8904206, 0.1503842, 2.311973, 1, 1, 1, 1, 1,
0.9008839, -0.1272032, 3.363036, 1, 1, 1, 1, 1,
0.9047322, -0.2225738, 3.122605, 1, 1, 1, 1, 1,
0.9076247, -1.117919, 1.589734, 1, 1, 1, 1, 1,
0.9109517, 0.3741658, 2.180372, 1, 1, 1, 1, 1,
0.9154395, -0.4405018, 2.177554, 1, 1, 1, 1, 1,
0.9155458, -1.753129, 2.67589, 0, 0, 1, 1, 1,
0.9157711, -0.5163183, 1.874106, 1, 0, 0, 1, 1,
0.9216453, 0.03891614, 3.248945, 1, 0, 0, 1, 1,
0.9272266, 1.085097, 2.761371, 1, 0, 0, 1, 1,
0.9326746, -0.410455, 2.162273, 1, 0, 0, 1, 1,
0.9339635, 0.5190719, 0.2252501, 1, 0, 0, 1, 1,
0.9359397, -0.1745725, 1.191913, 0, 0, 0, 1, 1,
0.9368328, -0.184011, 1.57748, 0, 0, 0, 1, 1,
0.9372746, -0.08247476, 1.355157, 0, 0, 0, 1, 1,
0.9401965, 0.6405188, 1.737655, 0, 0, 0, 1, 1,
0.9482548, -0.6889008, 2.671866, 0, 0, 0, 1, 1,
0.9560295, 1.279371, 0.5025204, 0, 0, 0, 1, 1,
0.9633668, -1.61975, 2.663898, 0, 0, 0, 1, 1,
0.9660294, 0.243389, 2.896426, 1, 1, 1, 1, 1,
0.9664677, -0.1211031, 1.82925, 1, 1, 1, 1, 1,
0.9668074, -0.3368092, 1.832191, 1, 1, 1, 1, 1,
0.9742489, -0.07112823, 3.00548, 1, 1, 1, 1, 1,
0.9783254, -0.3035257, 2.179623, 1, 1, 1, 1, 1,
0.9874395, 0.6465864, 0.3290819, 1, 1, 1, 1, 1,
0.993867, -0.8801072, 1.771141, 1, 1, 1, 1, 1,
0.9954099, -0.7471378, 3.387433, 1, 1, 1, 1, 1,
0.9975667, 0.1197626, -0.2004431, 1, 1, 1, 1, 1,
1.000435, 0.180179, 1.662214, 1, 1, 1, 1, 1,
1.001223, -1.440093, 2.232364, 1, 1, 1, 1, 1,
1.003919, 0.4332918, 0.8290593, 1, 1, 1, 1, 1,
1.004381, 0.4690819, 1.298165, 1, 1, 1, 1, 1,
1.007564, 0.06642795, 1.666971, 1, 1, 1, 1, 1,
1.011261, 1.58015, -0.6720199, 1, 1, 1, 1, 1,
1.016763, -0.5628678, 3.324214, 0, 0, 1, 1, 1,
1.028711, 0.1501801, 0.3621987, 1, 0, 0, 1, 1,
1.032234, 0.2507004, 1.033777, 1, 0, 0, 1, 1,
1.036257, -1.332436, 0.559696, 1, 0, 0, 1, 1,
1.039214, 0.6806042, 1.52162, 1, 0, 0, 1, 1,
1.039721, -1.403571, 1.560224, 1, 0, 0, 1, 1,
1.04538, -0.1430738, 2.227623, 0, 0, 0, 1, 1,
1.045586, 0.3300978, 1.814445, 0, 0, 0, 1, 1,
1.048129, 0.3624353, 0.8198556, 0, 0, 0, 1, 1,
1.048777, 1.140182, 1.941682, 0, 0, 0, 1, 1,
1.05348, -0.6745958, 1.005004, 0, 0, 0, 1, 1,
1.055981, -0.1328344, 1.2759, 0, 0, 0, 1, 1,
1.06191, 0.1965727, 0.8869733, 0, 0, 0, 1, 1,
1.066145, 2.259076, 1.716363, 1, 1, 1, 1, 1,
1.067349, -0.232335, 2.583746, 1, 1, 1, 1, 1,
1.070814, 0.272923, 3.402997, 1, 1, 1, 1, 1,
1.075536, 0.5972946, 1.235254, 1, 1, 1, 1, 1,
1.077454, -0.06412063, 2.157174, 1, 1, 1, 1, 1,
1.078003, 0.3986311, 0.8334618, 1, 1, 1, 1, 1,
1.078377, 0.09308178, 2.489429, 1, 1, 1, 1, 1,
1.082057, -1.14646, 1.072101, 1, 1, 1, 1, 1,
1.083906, 0.9172454, 0.1612799, 1, 1, 1, 1, 1,
1.088974, 0.2581499, -1.594642, 1, 1, 1, 1, 1,
1.098687, -0.6828612, 3.59628, 1, 1, 1, 1, 1,
1.099994, -1.311479, 1.00197, 1, 1, 1, 1, 1,
1.105611, -1.138997, 2.918868, 1, 1, 1, 1, 1,
1.106702, -0.5275658, 2.729609, 1, 1, 1, 1, 1,
1.111146, 0.7827981, 1.226273, 1, 1, 1, 1, 1,
1.1122, 0.4053708, 1.853929, 0, 0, 1, 1, 1,
1.112427, 1.655903, 1.536057, 1, 0, 0, 1, 1,
1.115299, 0.1987411, 1.430927, 1, 0, 0, 1, 1,
1.119537, -1.88208, 2.692097, 1, 0, 0, 1, 1,
1.12188, -1.10175, 4.51912, 1, 0, 0, 1, 1,
1.122415, 0.06325047, 1.216768, 1, 0, 0, 1, 1,
1.123902, 0.7558576, 1.465459, 0, 0, 0, 1, 1,
1.125703, 0.4832555, 0.4970736, 0, 0, 0, 1, 1,
1.127749, 0.8650907, -0.06110849, 0, 0, 0, 1, 1,
1.133562, -0.08975644, 2.530663, 0, 0, 0, 1, 1,
1.14162, -1.211358, 2.840259, 0, 0, 0, 1, 1,
1.142308, -0.0108395, 1.827163, 0, 0, 0, 1, 1,
1.143623, 0.6962721, 2.399967, 0, 0, 0, 1, 1,
1.15222, 1.772576, 0.2055699, 1, 1, 1, 1, 1,
1.155532, -0.8725997, 1.309928, 1, 1, 1, 1, 1,
1.157743, 1.297469, 0.2643118, 1, 1, 1, 1, 1,
1.157843, -0.1684288, 1.580655, 1, 1, 1, 1, 1,
1.1608, -0.9351428, 2.539321, 1, 1, 1, 1, 1,
1.165668, -0.646984, 2.003656, 1, 1, 1, 1, 1,
1.167664, -0.04006624, 2.960994, 1, 1, 1, 1, 1,
1.16802, -1.251942, 1.309517, 1, 1, 1, 1, 1,
1.170618, -0.3058779, -1.033882, 1, 1, 1, 1, 1,
1.178728, -0.3117274, 0.9252942, 1, 1, 1, 1, 1,
1.186952, 1.567539, 0.006139705, 1, 1, 1, 1, 1,
1.187436, 0.8494274, 0.8131701, 1, 1, 1, 1, 1,
1.197471, 0.6946198, 1.461303, 1, 1, 1, 1, 1,
1.207126, 2.062493, -1.079749, 1, 1, 1, 1, 1,
1.215093, 0.05487411, 1.279564, 1, 1, 1, 1, 1,
1.237461, -0.8823872, 2.403927, 0, 0, 1, 1, 1,
1.242884, -0.7483592, 1.280897, 1, 0, 0, 1, 1,
1.247406, -0.2017121, 1.673627, 1, 0, 0, 1, 1,
1.263984, 0.9544641, 0.4283279, 1, 0, 0, 1, 1,
1.281625, 0.1451692, 2.808383, 1, 0, 0, 1, 1,
1.297503, 0.1325696, 1.235663, 1, 0, 0, 1, 1,
1.29777, 0.1259356, 2.238209, 0, 0, 0, 1, 1,
1.309874, 1.291481, 1.630109, 0, 0, 0, 1, 1,
1.319414, 0.4631106, -0.1545324, 0, 0, 0, 1, 1,
1.336674, 1.515471, 1.145983, 0, 0, 0, 1, 1,
1.346421, -1.09562, 1.476133, 0, 0, 0, 1, 1,
1.349302, -0.3207784, 2.991112, 0, 0, 0, 1, 1,
1.382303, -0.2497768, 1.466475, 0, 0, 0, 1, 1,
1.383337, 0.9456816, -0.1618793, 1, 1, 1, 1, 1,
1.383568, 0.9514994, -0.7070961, 1, 1, 1, 1, 1,
1.388535, 0.2903947, 0.8748145, 1, 1, 1, 1, 1,
1.388761, 0.170752, 0.5051796, 1, 1, 1, 1, 1,
1.392704, -0.531638, 3.295124, 1, 1, 1, 1, 1,
1.393566, -0.6902595, 3.013142, 1, 1, 1, 1, 1,
1.395043, -0.8323823, 2.565485, 1, 1, 1, 1, 1,
1.413715, -0.7307143, 0.774377, 1, 1, 1, 1, 1,
1.428104, -1.802759, 3.676517, 1, 1, 1, 1, 1,
1.433147, -0.01522263, 1.770595, 1, 1, 1, 1, 1,
1.444721, 0.9611962, 0.4700731, 1, 1, 1, 1, 1,
1.448765, -1.820161, 1.807229, 1, 1, 1, 1, 1,
1.456673, -0.004775019, 2.092199, 1, 1, 1, 1, 1,
1.466497, 0.6017872, 1.001275, 1, 1, 1, 1, 1,
1.470482, -0.5554001, 1.761138, 1, 1, 1, 1, 1,
1.486341, 0.1107914, 2.228279, 0, 0, 1, 1, 1,
1.50527, 0.1815371, 0.7348554, 1, 0, 0, 1, 1,
1.507874, -0.0200134, 0.7854341, 1, 0, 0, 1, 1,
1.515018, -2.051438, 2.859952, 1, 0, 0, 1, 1,
1.519241, 1.068689, 1.460568, 1, 0, 0, 1, 1,
1.530184, 0.300355, 0.398854, 1, 0, 0, 1, 1,
1.553464, 1.210552, 1.285365, 0, 0, 0, 1, 1,
1.556607, -0.826079, 2.681388, 0, 0, 0, 1, 1,
1.575483, -0.9278151, 1.964441, 0, 0, 0, 1, 1,
1.578162, 0.8094758, 2.551408, 0, 0, 0, 1, 1,
1.584326, 1.339038, 1.802498, 0, 0, 0, 1, 1,
1.596225, 0.474234, -1.180668, 0, 0, 0, 1, 1,
1.604929, 2.486532, 0.08038861, 0, 0, 0, 1, 1,
1.628687, 0.1928917, 0.8186486, 1, 1, 1, 1, 1,
1.629082, -1.574714, 3.465293, 1, 1, 1, 1, 1,
1.633542, -0.4237269, 1.616689, 1, 1, 1, 1, 1,
1.651739, 0.2011406, 0.5120326, 1, 1, 1, 1, 1,
1.685981, -0.3205707, -1.852859, 1, 1, 1, 1, 1,
1.693329, 0.1394728, 3.401746, 1, 1, 1, 1, 1,
1.705297, -0.09974714, 0.3307268, 1, 1, 1, 1, 1,
1.706418, -2.644279, 2.451888, 1, 1, 1, 1, 1,
1.710716, 0.6135061, 3.945624, 1, 1, 1, 1, 1,
1.713222, -1.859792, 2.119902, 1, 1, 1, 1, 1,
1.716208, -0.8964082, 3.363162, 1, 1, 1, 1, 1,
1.718473, -0.8038968, 3.324071, 1, 1, 1, 1, 1,
1.729552, 0.5156469, 0.3427331, 1, 1, 1, 1, 1,
1.730185, -1.800033, 3.700109, 1, 1, 1, 1, 1,
1.740821, 1.388893, 1.884425, 1, 1, 1, 1, 1,
1.742161, 1.135862, 0.7261568, 0, 0, 1, 1, 1,
1.747228, 0.6154216, 1.182373, 1, 0, 0, 1, 1,
1.755418, 0.4591715, -0.1015174, 1, 0, 0, 1, 1,
1.773201, -0.4069507, 1.759929, 1, 0, 0, 1, 1,
1.813174, -0.5769339, 2.484833, 1, 0, 0, 1, 1,
1.813282, -1.231786, 3.09929, 1, 0, 0, 1, 1,
1.824137, 1.503685, 0.6618465, 0, 0, 0, 1, 1,
1.844164, -0.2869706, 1.36334, 0, 0, 0, 1, 1,
1.852852, -0.1653044, 3.117686, 0, 0, 0, 1, 1,
1.870129, 0.4964162, 1.408369, 0, 0, 0, 1, 1,
1.870983, -0.3842508, 2.168165, 0, 0, 0, 1, 1,
1.880883, 0.9185593, 3.667755, 0, 0, 0, 1, 1,
1.905541, -0.4373401, 0.2679191, 0, 0, 0, 1, 1,
1.916674, 0.4666182, -0.4553529, 1, 1, 1, 1, 1,
1.92235, -0.2429309, 0.723184, 1, 1, 1, 1, 1,
1.942145, 1.980785, 0.6583202, 1, 1, 1, 1, 1,
1.961375, -1.18542, 3.854381, 1, 1, 1, 1, 1,
1.968843, 0.4788587, 3.027491, 1, 1, 1, 1, 1,
1.974791, 0.3703149, 0.6746243, 1, 1, 1, 1, 1,
1.989384, -0.446699, 1.390636, 1, 1, 1, 1, 1,
1.992264, -2.032766, 2.67196, 1, 1, 1, 1, 1,
2.00353, 0.7104426, 2.32122, 1, 1, 1, 1, 1,
2.062761, 0.2447196, 1.68848, 1, 1, 1, 1, 1,
2.070779, 0.185884, 0.3463234, 1, 1, 1, 1, 1,
2.109521, 0.2999479, 2.487698, 1, 1, 1, 1, 1,
2.11402, 0.3595271, 2.29522, 1, 1, 1, 1, 1,
2.150081, -1.707689, 4.052741, 1, 1, 1, 1, 1,
2.199609, 0.6610923, 0.8566914, 1, 1, 1, 1, 1,
2.212223, -3.437139, 2.287682, 0, 0, 1, 1, 1,
2.256821, 1.048812, 0.4537192, 1, 0, 0, 1, 1,
2.262576, -1.327108, -0.175834, 1, 0, 0, 1, 1,
2.276028, 0.6471224, 2.889484, 1, 0, 0, 1, 1,
2.277614, -0.4738666, 2.602212, 1, 0, 0, 1, 1,
2.290779, -1.08292, 2.245509, 1, 0, 0, 1, 1,
2.303022, -0.3896163, 0.4323789, 0, 0, 0, 1, 1,
2.309791, 0.2977482, 2.181954, 0, 0, 0, 1, 1,
2.352511, -0.5302026, 0.3823937, 0, 0, 0, 1, 1,
2.433916, 0.08867564, 0.9014443, 0, 0, 0, 1, 1,
2.489929, -0.7502089, 1.295558, 0, 0, 0, 1, 1,
2.57947, 0.4903091, 1.059271, 0, 0, 0, 1, 1,
2.579957, -1.141137, 3.733933, 0, 0, 0, 1, 1,
2.597133, 0.7635451, 1.085729, 1, 1, 1, 1, 1,
2.609202, 0.359595, 1.053679, 1, 1, 1, 1, 1,
2.629781, -0.8182961, 1.744004, 1, 1, 1, 1, 1,
2.749381, -0.2859777, 1.756743, 1, 1, 1, 1, 1,
2.827099, -0.03145963, 1.498106, 1, 1, 1, 1, 1,
2.907682, -0.9233389, 0.6414116, 1, 1, 1, 1, 1,
3.486818, -0.6092123, 1.948673, 1, 1, 1, 1, 1
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
var radius = 9.732291;
var distance = 34.18426;
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
mvMatrix.translate( -0.03063345, 0.02389073, -0.06473303 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.18426);
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
