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
-2.903917, -0.5149378, -2.151788, 1, 0, 0, 1,
-2.800476, -1.327588, -2.17126, 1, 0.007843138, 0, 1,
-2.726629, -0.8021089, -2.602876, 1, 0.01176471, 0, 1,
-2.679232, 0.858332, -0.01615667, 1, 0.01960784, 0, 1,
-2.678964, 1.538965, -1.028868, 1, 0.02352941, 0, 1,
-2.547655, -0.867408, -2.166812, 1, 0.03137255, 0, 1,
-2.299324, -1.210086, -1.291227, 1, 0.03529412, 0, 1,
-2.274554, -0.8681042, -1.846738, 1, 0.04313726, 0, 1,
-2.271812, -1.056738, -2.385113, 1, 0.04705882, 0, 1,
-2.20911, -0.8410327, -2.66271, 1, 0.05490196, 0, 1,
-2.170357, 1.473575, -1.543031, 1, 0.05882353, 0, 1,
-2.163326, 0.4086031, -1.260841, 1, 0.06666667, 0, 1,
-2.145114, -0.3415618, -1.90928, 1, 0.07058824, 0, 1,
-2.137516, -0.7382534, -1.557185, 1, 0.07843138, 0, 1,
-2.134364, 0.05920347, -0.885329, 1, 0.08235294, 0, 1,
-2.132479, -2.084665, -2.827835, 1, 0.09019608, 0, 1,
-2.116323, 0.08606154, -0.7625623, 1, 0.09411765, 0, 1,
-2.096879, -1.104853, -2.822183, 1, 0.1019608, 0, 1,
-2.093924, -0.3016298, -2.028416, 1, 0.1098039, 0, 1,
-2.067251, -0.5522849, -2.133712, 1, 0.1137255, 0, 1,
-2.062845, -0.7031552, -2.828156, 1, 0.1215686, 0, 1,
-2.000244, 1.8843, -0.8882506, 1, 0.1254902, 0, 1,
-1.996906, 1.585588, 1.844702, 1, 0.1333333, 0, 1,
-1.97078, -0.1835166, 0.1376662, 1, 0.1372549, 0, 1,
-1.960548, -0.5877898, -1.294221, 1, 0.145098, 0, 1,
-1.946288, 0.4472588, -3.446596, 1, 0.1490196, 0, 1,
-1.929521, -0.4875029, -1.971225, 1, 0.1568628, 0, 1,
-1.91158, -0.4823414, -0.2839478, 1, 0.1607843, 0, 1,
-1.907559, -0.3792274, -2.050324, 1, 0.1686275, 0, 1,
-1.907271, 1.199245, -1.36862, 1, 0.172549, 0, 1,
-1.903298, -1.111796, -0.9887897, 1, 0.1803922, 0, 1,
-1.890619, -0.01413057, -1.854308, 1, 0.1843137, 0, 1,
-1.881191, 0.2730182, -1.935475, 1, 0.1921569, 0, 1,
-1.86182, 1.848975, -1.372668, 1, 0.1960784, 0, 1,
-1.843571, -1.965818, -2.22989, 1, 0.2039216, 0, 1,
-1.836106, -0.3966557, -2.675322, 1, 0.2117647, 0, 1,
-1.833706, 0.4970088, 0.05644001, 1, 0.2156863, 0, 1,
-1.799309, 1.719262, -2.795525, 1, 0.2235294, 0, 1,
-1.797028, -0.7711989, -2.839421, 1, 0.227451, 0, 1,
-1.788939, 0.8580344, -3.016334, 1, 0.2352941, 0, 1,
-1.772505, -1.611915, -3.551179, 1, 0.2392157, 0, 1,
-1.743218, -0.3025985, -1.952857, 1, 0.2470588, 0, 1,
-1.737903, -0.2283088, -1.62107, 1, 0.2509804, 0, 1,
-1.731335, -0.9254078, -1.193784, 1, 0.2588235, 0, 1,
-1.730567, 0.6207349, -0.9581507, 1, 0.2627451, 0, 1,
-1.72543, -0.06552676, -1.715048, 1, 0.2705882, 0, 1,
-1.721562, -0.9554641, -2.739269, 1, 0.2745098, 0, 1,
-1.718514, 0.3374633, -0.428044, 1, 0.282353, 0, 1,
-1.701669, 0.9526186, -0.593286, 1, 0.2862745, 0, 1,
-1.693113, 0.4474398, -1.856578, 1, 0.2941177, 0, 1,
-1.669875, 0.6925682, -0.5703364, 1, 0.3019608, 0, 1,
-1.651768, -2.345717, -2.000312, 1, 0.3058824, 0, 1,
-1.632055, 0.5435746, -0.372406, 1, 0.3137255, 0, 1,
-1.62662, -0.5033829, -1.34883, 1, 0.3176471, 0, 1,
-1.623073, -1.457402, -0.132247, 1, 0.3254902, 0, 1,
-1.599381, 1.082193, -3.346158, 1, 0.3294118, 0, 1,
-1.598964, 1.432089, -2.742884, 1, 0.3372549, 0, 1,
-1.596165, 0.427163, -1.7293, 1, 0.3411765, 0, 1,
-1.592006, 1.486851, 0.9276738, 1, 0.3490196, 0, 1,
-1.584693, -0.4636683, -2.95282, 1, 0.3529412, 0, 1,
-1.584161, 1.247234, -2.561521, 1, 0.3607843, 0, 1,
-1.571609, -0.497368, -3.007215, 1, 0.3647059, 0, 1,
-1.567009, 0.9994894, -2.712522, 1, 0.372549, 0, 1,
-1.545244, 0.08121502, -1.204812, 1, 0.3764706, 0, 1,
-1.534779, 0.9784617, -1.806747, 1, 0.3843137, 0, 1,
-1.534054, 2.29589, -0.5152856, 1, 0.3882353, 0, 1,
-1.523395, 1.467063, -2.239454, 1, 0.3960784, 0, 1,
-1.514198, 0.7147086, -1.327336, 1, 0.4039216, 0, 1,
-1.509535, -1.048685, -1.436839, 1, 0.4078431, 0, 1,
-1.505754, 0.1257113, -1.274217, 1, 0.4156863, 0, 1,
-1.500339, -1.143243, -1.85811, 1, 0.4196078, 0, 1,
-1.488502, -0.8639801, -2.123797, 1, 0.427451, 0, 1,
-1.471032, -0.09732714, -1.717525, 1, 0.4313726, 0, 1,
-1.464314, -1.646058, -5.031924, 1, 0.4392157, 0, 1,
-1.44124, 0.1071857, -0.9117697, 1, 0.4431373, 0, 1,
-1.440794, -0.0804205, -1.755576, 1, 0.4509804, 0, 1,
-1.440649, 1.282515, -0.2995438, 1, 0.454902, 0, 1,
-1.432616, -0.3218459, -4.696904, 1, 0.4627451, 0, 1,
-1.42982, 0.1328816, -1.39376, 1, 0.4666667, 0, 1,
-1.426891, -0.02194145, -1.451078, 1, 0.4745098, 0, 1,
-1.425207, 0.6242298, -1.499635, 1, 0.4784314, 0, 1,
-1.423102, -0.1779467, -2.227318, 1, 0.4862745, 0, 1,
-1.409123, -0.9144696, -3.204012, 1, 0.4901961, 0, 1,
-1.405108, -0.7093866, 0.6172621, 1, 0.4980392, 0, 1,
-1.403037, 0.4267078, -2.29896, 1, 0.5058824, 0, 1,
-1.39278, -0.1960734, -3.5082, 1, 0.509804, 0, 1,
-1.383932, -2.109115, -2.502579, 1, 0.5176471, 0, 1,
-1.383634, 0.05883213, -2.093302, 1, 0.5215687, 0, 1,
-1.360859, 0.4883552, -0.8480717, 1, 0.5294118, 0, 1,
-1.359136, -1.024688, -2.681161, 1, 0.5333334, 0, 1,
-1.353742, -0.9683751, -2.690007, 1, 0.5411765, 0, 1,
-1.351106, -0.4925469, -0.519572, 1, 0.5450981, 0, 1,
-1.349576, -0.08135865, -1.655902, 1, 0.5529412, 0, 1,
-1.347087, -1.603204, -4.268544, 1, 0.5568628, 0, 1,
-1.344405, 1.305922, 1.28458, 1, 0.5647059, 0, 1,
-1.343686, -0.4524296, -1.26686, 1, 0.5686275, 0, 1,
-1.342269, 0.2387058, -1.529856, 1, 0.5764706, 0, 1,
-1.342192, 1.323646, -0.5317566, 1, 0.5803922, 0, 1,
-1.34199, -0.6260518, -0.8740197, 1, 0.5882353, 0, 1,
-1.334213, -1.800376, -2.076622, 1, 0.5921569, 0, 1,
-1.332721, 0.01777619, 0.7858096, 1, 0.6, 0, 1,
-1.327125, 1.343448, -0.1938335, 1, 0.6078432, 0, 1,
-1.325518, 0.5381529, -0.7332393, 1, 0.6117647, 0, 1,
-1.317612, 1.058538, -1.940195, 1, 0.6196079, 0, 1,
-1.317566, -0.8274087, -2.027035, 1, 0.6235294, 0, 1,
-1.314678, 0.7560496, -0.3924667, 1, 0.6313726, 0, 1,
-1.310126, -0.403938, -2.199563, 1, 0.6352941, 0, 1,
-1.309253, -0.633064, -1.82964, 1, 0.6431373, 0, 1,
-1.299013, 0.9325346, -0.6609682, 1, 0.6470588, 0, 1,
-1.289352, 0.4683565, -1.643603, 1, 0.654902, 0, 1,
-1.268967, -0.03864469, -2.340719, 1, 0.6588235, 0, 1,
-1.262458, 0.4367357, 1.014614, 1, 0.6666667, 0, 1,
-1.246367, -0.553165, -0.6356136, 1, 0.6705883, 0, 1,
-1.246056, -0.6389429, -3.571246, 1, 0.6784314, 0, 1,
-1.244526, -1.567532, -3.774299, 1, 0.682353, 0, 1,
-1.234895, -0.8318764, -2.071845, 1, 0.6901961, 0, 1,
-1.234886, 0.8188495, -1.718777, 1, 0.6941177, 0, 1,
-1.233815, -0.2802081, -2.099298, 1, 0.7019608, 0, 1,
-1.23254, 0.7635296, -0.6019762, 1, 0.7098039, 0, 1,
-1.231042, 0.5287337, -2.011822, 1, 0.7137255, 0, 1,
-1.230965, -0.3347073, -4.621751, 1, 0.7215686, 0, 1,
-1.230441, -0.3535347, -3.261739, 1, 0.7254902, 0, 1,
-1.224242, 0.3516742, -1.750181, 1, 0.7333333, 0, 1,
-1.222763, 0.8413322, -2.009346, 1, 0.7372549, 0, 1,
-1.221403, 0.2612417, -0.2825373, 1, 0.7450981, 0, 1,
-1.21786, 1.76329, -1.572001, 1, 0.7490196, 0, 1,
-1.216093, 0.9118711, -1.471291, 1, 0.7568628, 0, 1,
-1.213158, -0.9152008, -1.960792, 1, 0.7607843, 0, 1,
-1.211457, -1.369125, -1.858262, 1, 0.7686275, 0, 1,
-1.208745, -0.5274262, -2.311112, 1, 0.772549, 0, 1,
-1.201201, 0.3598728, -0.7335165, 1, 0.7803922, 0, 1,
-1.199918, 0.4777523, -0.1155525, 1, 0.7843137, 0, 1,
-1.192176, -0.965158, -0.2995035, 1, 0.7921569, 0, 1,
-1.190403, 1.785116, -0.6748813, 1, 0.7960784, 0, 1,
-1.183784, 0.3467921, -2.867388, 1, 0.8039216, 0, 1,
-1.183146, -0.05389076, -3.397332, 1, 0.8117647, 0, 1,
-1.183024, 0.153522, -1.301486, 1, 0.8156863, 0, 1,
-1.1783, -0.5810169, -3.264467, 1, 0.8235294, 0, 1,
-1.173706, 0.7075288, -1.921176, 1, 0.827451, 0, 1,
-1.167815, 0.9964285, -1.947029, 1, 0.8352941, 0, 1,
-1.154848, 0.4819192, -1.602761, 1, 0.8392157, 0, 1,
-1.154629, 0.3737503, -0.9200673, 1, 0.8470588, 0, 1,
-1.150468, 1.031615, -1.426088, 1, 0.8509804, 0, 1,
-1.147631, -2.100402, -2.366156, 1, 0.8588235, 0, 1,
-1.132845, -0.5341414, -1.556607, 1, 0.8627451, 0, 1,
-1.132609, -0.8232114, -3.962147, 1, 0.8705882, 0, 1,
-1.129111, 1.071467, 0.8030894, 1, 0.8745098, 0, 1,
-1.12604, -1.876088, -2.29789, 1, 0.8823529, 0, 1,
-1.122764, -1.327502, -1.174892, 1, 0.8862745, 0, 1,
-1.117191, 0.9689353, -2.458536, 1, 0.8941177, 0, 1,
-1.116955, -0.5356476, -2.897174, 1, 0.8980392, 0, 1,
-1.114546, 0.34517, -3.015213, 1, 0.9058824, 0, 1,
-1.106822, -1.153851, -1.522048, 1, 0.9137255, 0, 1,
-1.098755, 0.02390044, -1.355059, 1, 0.9176471, 0, 1,
-1.095544, -0.07153276, -1.784706, 1, 0.9254902, 0, 1,
-1.086539, -0.947503, -2.258951, 1, 0.9294118, 0, 1,
-1.084152, 0.4060267, -0.1312912, 1, 0.9372549, 0, 1,
-1.083406, -1.025159, -1.262784, 1, 0.9411765, 0, 1,
-1.068836, 0.7903277, -1.457706, 1, 0.9490196, 0, 1,
-1.064622, 1.502069, -0.3526842, 1, 0.9529412, 0, 1,
-1.060556, 0.8636607, -2.077996, 1, 0.9607843, 0, 1,
-1.049977, -0.7742118, -0.206028, 1, 0.9647059, 0, 1,
-1.043361, 0.05936759, -0.5948134, 1, 0.972549, 0, 1,
-1.024773, -0.4553014, -2.694177, 1, 0.9764706, 0, 1,
-1.023518, 0.5550653, 0.2141277, 1, 0.9843137, 0, 1,
-1.021443, 1.113128, -1.860577, 1, 0.9882353, 0, 1,
-1.019338, 1.189608, -2.517678, 1, 0.9960784, 0, 1,
-1.01804, 0.2965593, -1.347817, 0.9960784, 1, 0, 1,
-1.016543, 0.118606, -2.717716, 0.9921569, 1, 0, 1,
-1.008647, -1.618924, -2.309839, 0.9843137, 1, 0, 1,
-0.9940026, -0.9481263, -2.686034, 0.9803922, 1, 0, 1,
-0.9931512, 0.4988142, 0.01643735, 0.972549, 1, 0, 1,
-0.9914457, 0.02893393, -2.53394, 0.9686275, 1, 0, 1,
-0.9904799, -0.9134158, -1.75593, 0.9607843, 1, 0, 1,
-0.9864837, -0.4920002, -2.696717, 0.9568627, 1, 0, 1,
-0.9847298, -1.964163, -1.809443, 0.9490196, 1, 0, 1,
-0.9821386, -1.815439, -1.705672, 0.945098, 1, 0, 1,
-0.9800519, -0.1242554, -3.274196, 0.9372549, 1, 0, 1,
-0.9682691, 0.2468939, -1.92707, 0.9333333, 1, 0, 1,
-0.9679374, 0.8363363, -1.219308, 0.9254902, 1, 0, 1,
-0.9662325, -1.089798, -3.922593, 0.9215686, 1, 0, 1,
-0.9656009, 1.569851, -0.4986519, 0.9137255, 1, 0, 1,
-0.9646495, 0.3468601, -0.4057888, 0.9098039, 1, 0, 1,
-0.9596086, 1.364899, -0.9300011, 0.9019608, 1, 0, 1,
-0.9511795, 0.9858294, -1.758608, 0.8941177, 1, 0, 1,
-0.9450926, 0.469906, 0.846808, 0.8901961, 1, 0, 1,
-0.9340752, -0.8340803, -1.846169, 0.8823529, 1, 0, 1,
-0.9325427, -1.063987, -3.001669, 0.8784314, 1, 0, 1,
-0.9325422, 0.328337, -2.906396, 0.8705882, 1, 0, 1,
-0.9288448, -0.4399378, -4.668031, 0.8666667, 1, 0, 1,
-0.9159024, -0.007077567, -3.989453, 0.8588235, 1, 0, 1,
-0.9158314, -0.2329994, -1.135293, 0.854902, 1, 0, 1,
-0.9157025, -0.9382053, -2.589802, 0.8470588, 1, 0, 1,
-0.9115444, 0.4480959, -0.9588441, 0.8431373, 1, 0, 1,
-0.9114493, -0.1082165, -2.734392, 0.8352941, 1, 0, 1,
-0.9094143, 0.2071086, -1.2533, 0.8313726, 1, 0, 1,
-0.9071201, 1.06382, -1.264132, 0.8235294, 1, 0, 1,
-0.8942468, 0.8205467, -0.7307647, 0.8196079, 1, 0, 1,
-0.8917351, 0.812548, -2.205482, 0.8117647, 1, 0, 1,
-0.8908086, 0.3188708, 1.892632, 0.8078431, 1, 0, 1,
-0.8898638, 1.728046, -0.05683853, 0.8, 1, 0, 1,
-0.8834972, 1.51032, -0.1425912, 0.7921569, 1, 0, 1,
-0.8826415, -0.8303497, -1.750833, 0.7882353, 1, 0, 1,
-0.8783299, 1.318751, -0.8011577, 0.7803922, 1, 0, 1,
-0.8751052, 0.5570892, -0.4236131, 0.7764706, 1, 0, 1,
-0.8719544, -0.9332881, -4.269131, 0.7686275, 1, 0, 1,
-0.8717755, 1.780045, -0.5791528, 0.7647059, 1, 0, 1,
-0.8698197, -1.664456, -1.529694, 0.7568628, 1, 0, 1,
-0.8686181, 0.1052731, -1.826746, 0.7529412, 1, 0, 1,
-0.8656942, -0.8522781, -1.056604, 0.7450981, 1, 0, 1,
-0.858384, -0.9806421, -1.50587, 0.7411765, 1, 0, 1,
-0.8552296, -0.4827927, -0.2644927, 0.7333333, 1, 0, 1,
-0.850913, 1.192762, -0.1393779, 0.7294118, 1, 0, 1,
-0.8503984, -0.5420399, -2.001496, 0.7215686, 1, 0, 1,
-0.8356211, -0.5666258, -1.28131, 0.7176471, 1, 0, 1,
-0.8331099, -1.579553, -2.843707, 0.7098039, 1, 0, 1,
-0.8321363, 0.9481283, -0.5544822, 0.7058824, 1, 0, 1,
-0.8317069, 1.425212, -1.309253, 0.6980392, 1, 0, 1,
-0.8287308, -0.369568, -1.350444, 0.6901961, 1, 0, 1,
-0.8277151, -1.43265, -1.11094, 0.6862745, 1, 0, 1,
-0.8245158, -0.704575, -1.639475, 0.6784314, 1, 0, 1,
-0.8232764, -0.4197341, -3.387727, 0.6745098, 1, 0, 1,
-0.8228748, -0.7631369, -1.990695, 0.6666667, 1, 0, 1,
-0.8168001, -0.4483861, -3.28441, 0.6627451, 1, 0, 1,
-0.8154625, -0.07682505, -0.8284557, 0.654902, 1, 0, 1,
-0.8133947, -0.4324888, -0.6750994, 0.6509804, 1, 0, 1,
-0.8100862, 0.1137282, 0.3310049, 0.6431373, 1, 0, 1,
-0.8065093, 0.1066508, -0.8542662, 0.6392157, 1, 0, 1,
-0.8044688, 0.5801796, -0.7653656, 0.6313726, 1, 0, 1,
-0.8035699, -1.16071, -1.527254, 0.627451, 1, 0, 1,
-0.8011272, 0.2663491, -1.43161, 0.6196079, 1, 0, 1,
-0.7991031, 0.2531738, -1.691727, 0.6156863, 1, 0, 1,
-0.7909098, 0.4584889, -0.7551636, 0.6078432, 1, 0, 1,
-0.7877999, -0.2022721, -3.969025, 0.6039216, 1, 0, 1,
-0.7826215, -0.06887397, -0.5991125, 0.5960785, 1, 0, 1,
-0.7786801, -0.8016661, -3.089422, 0.5882353, 1, 0, 1,
-0.7759477, -0.3299426, -1.053489, 0.5843138, 1, 0, 1,
-0.7754276, 1.161677, -1.39581, 0.5764706, 1, 0, 1,
-0.7748353, -1.342076, -2.653452, 0.572549, 1, 0, 1,
-0.7636024, -0.6249909, -2.349739, 0.5647059, 1, 0, 1,
-0.762332, 2.073622, -0.7979757, 0.5607843, 1, 0, 1,
-0.7614912, -0.8770267, -1.683533, 0.5529412, 1, 0, 1,
-0.7582058, 0.8590285, -1.093394, 0.5490196, 1, 0, 1,
-0.7503764, -0.3009872, -0.97755, 0.5411765, 1, 0, 1,
-0.7493661, -0.652753, -1.761, 0.5372549, 1, 0, 1,
-0.748687, -1.605688, -2.710898, 0.5294118, 1, 0, 1,
-0.7476104, -0.5354013, -2.356863, 0.5254902, 1, 0, 1,
-0.7473747, 0.2535588, -2.642269, 0.5176471, 1, 0, 1,
-0.7439106, -0.5817981, -1.234967, 0.5137255, 1, 0, 1,
-0.7425424, 1.796447, -1.208238, 0.5058824, 1, 0, 1,
-0.7401518, -2.130992, -2.554214, 0.5019608, 1, 0, 1,
-0.7398677, -1.109656, -2.516744, 0.4941176, 1, 0, 1,
-0.7396634, 0.5347511, 0.5504805, 0.4862745, 1, 0, 1,
-0.7300439, -1.993516, -4.771435, 0.4823529, 1, 0, 1,
-0.7298119, 1.192478, 1.519592, 0.4745098, 1, 0, 1,
-0.7296684, -1.204394, -2.604553, 0.4705882, 1, 0, 1,
-0.7288651, -0.8099784, -3.242184, 0.4627451, 1, 0, 1,
-0.7276307, -0.8376659, -1.198917, 0.4588235, 1, 0, 1,
-0.7275817, 0.8030089, -0.2467156, 0.4509804, 1, 0, 1,
-0.7238856, -0.3910728, -3.731521, 0.4470588, 1, 0, 1,
-0.7143015, 0.07993064, -2.574425, 0.4392157, 1, 0, 1,
-0.714147, 0.09520616, -2.595234, 0.4352941, 1, 0, 1,
-0.7124555, -0.6413316, -1.311353, 0.427451, 1, 0, 1,
-0.7075179, 0.3509064, 0.07613783, 0.4235294, 1, 0, 1,
-0.7046603, -1.28533, -0.9675449, 0.4156863, 1, 0, 1,
-0.7016561, 1.203964, -1.816741, 0.4117647, 1, 0, 1,
-0.6966972, -1.631792, -1.050243, 0.4039216, 1, 0, 1,
-0.6949769, 0.1609063, -1.448291, 0.3960784, 1, 0, 1,
-0.6888982, -1.907104, -3.2877, 0.3921569, 1, 0, 1,
-0.6881449, 1.365608, -0.02384733, 0.3843137, 1, 0, 1,
-0.6871517, 1.5273, -0.08327533, 0.3803922, 1, 0, 1,
-0.6868173, 0.2653794, -0.2487076, 0.372549, 1, 0, 1,
-0.6847479, -0.5558602, -2.048728, 0.3686275, 1, 0, 1,
-0.6751882, 0.6676114, -1.882869, 0.3607843, 1, 0, 1,
-0.6737052, -0.8606774, -3.536149, 0.3568628, 1, 0, 1,
-0.673353, -0.8744544, -1.463344, 0.3490196, 1, 0, 1,
-0.6690778, -0.4531433, -2.795187, 0.345098, 1, 0, 1,
-0.6673419, 0.5648367, -1.563988, 0.3372549, 1, 0, 1,
-0.6662241, 0.05907346, -0.680626, 0.3333333, 1, 0, 1,
-0.6646748, 1.376687, 0.1819261, 0.3254902, 1, 0, 1,
-0.6646001, -0.2138384, -3.356716, 0.3215686, 1, 0, 1,
-0.6620449, -0.6038545, -2.951038, 0.3137255, 1, 0, 1,
-0.6618567, -0.6389059, -1.484502, 0.3098039, 1, 0, 1,
-0.6561453, 0.3521978, -1.324237, 0.3019608, 1, 0, 1,
-0.6470876, 0.589086, -2.002166, 0.2941177, 1, 0, 1,
-0.6444389, 0.6137981, -0.3941106, 0.2901961, 1, 0, 1,
-0.6422294, -0.8694438, -2.336041, 0.282353, 1, 0, 1,
-0.6372384, 1.290767, -2.290111, 0.2784314, 1, 0, 1,
-0.6366115, -0.780879, -2.347111, 0.2705882, 1, 0, 1,
-0.6365377, 0.359385, -1.387996, 0.2666667, 1, 0, 1,
-0.6345178, 2.039361, 0.6152699, 0.2588235, 1, 0, 1,
-0.6331372, 1.665088, 0.5962629, 0.254902, 1, 0, 1,
-0.6254486, -0.6774302, -1.997257, 0.2470588, 1, 0, 1,
-0.6240472, 0.6964172, 0.1517352, 0.2431373, 1, 0, 1,
-0.6214009, 0.6056179, -1.544708, 0.2352941, 1, 0, 1,
-0.6176906, -0.01087624, -3.52465, 0.2313726, 1, 0, 1,
-0.6132859, 0.3597381, -2.995933, 0.2235294, 1, 0, 1,
-0.6075632, -1.361171, -2.989715, 0.2196078, 1, 0, 1,
-0.6002989, -0.8709995, -1.654264, 0.2117647, 1, 0, 1,
-0.5970971, -0.857555, -2.017109, 0.2078431, 1, 0, 1,
-0.5964237, 0.7562488, 0.8960393, 0.2, 1, 0, 1,
-0.5960097, -0.7771116, -2.850263, 0.1921569, 1, 0, 1,
-0.5936376, -0.3449554, -2.838822, 0.1882353, 1, 0, 1,
-0.5917211, -1.135906, -1.309635, 0.1803922, 1, 0, 1,
-0.5890017, 0.1213029, -0.3555681, 0.1764706, 1, 0, 1,
-0.5853602, -0.7521347, -3.369933, 0.1686275, 1, 0, 1,
-0.5811492, 0.1941697, -0.3096566, 0.1647059, 1, 0, 1,
-0.5801038, 0.03023627, 0.06496775, 0.1568628, 1, 0, 1,
-0.5792673, 1.503189, -1.338265, 0.1529412, 1, 0, 1,
-0.5747122, -0.5940903, -3.105732, 0.145098, 1, 0, 1,
-0.5741056, 0.3208785, -1.578894, 0.1411765, 1, 0, 1,
-0.5704173, -0.3554372, -0.7665287, 0.1333333, 1, 0, 1,
-0.5674513, 0.2783087, -2.66087, 0.1294118, 1, 0, 1,
-0.5657164, 0.6526785, 0.9616289, 0.1215686, 1, 0, 1,
-0.5649012, 1.404769, -0.4257607, 0.1176471, 1, 0, 1,
-0.564428, 1.680287, 1.035002, 0.1098039, 1, 0, 1,
-0.555939, 0.6014971, 0.2351291, 0.1058824, 1, 0, 1,
-0.5532115, -1.900567, -2.827957, 0.09803922, 1, 0, 1,
-0.5514241, -1.129284, -3.762628, 0.09019608, 1, 0, 1,
-0.5500138, -1.603954, -0.951759, 0.08627451, 1, 0, 1,
-0.5472589, 1.280128, 0.3339502, 0.07843138, 1, 0, 1,
-0.5461259, 0.7173766, -1.692459, 0.07450981, 1, 0, 1,
-0.5442268, -1.036024, -2.239476, 0.06666667, 1, 0, 1,
-0.5356976, -0.4480043, -1.854363, 0.0627451, 1, 0, 1,
-0.5331451, 0.0880875, -1.302958, 0.05490196, 1, 0, 1,
-0.5211474, -0.7213657, -2.748627, 0.05098039, 1, 0, 1,
-0.5205756, -0.4372453, -2.220135, 0.04313726, 1, 0, 1,
-0.5186947, 0.5196726, -1.028963, 0.03921569, 1, 0, 1,
-0.5167816, 0.8518951, -2.213888, 0.03137255, 1, 0, 1,
-0.5070673, -0.1892882, -2.52873, 0.02745098, 1, 0, 1,
-0.5065756, 0.07958379, -3.073491, 0.01960784, 1, 0, 1,
-0.5058469, 0.4404306, 1.584786, 0.01568628, 1, 0, 1,
-0.5024028, 0.1378315, -0.02735021, 0.007843138, 1, 0, 1,
-0.5018852, 0.3026596, -1.074954, 0.003921569, 1, 0, 1,
-0.4823437, 0.9688014, 0.4707166, 0, 1, 0.003921569, 1,
-0.4743647, -1.563374, -0.6609609, 0, 1, 0.01176471, 1,
-0.4718882, -1.36249, -2.455009, 0, 1, 0.01568628, 1,
-0.4698035, -1.659505, -4.431757, 0, 1, 0.02352941, 1,
-0.4678484, 1.25406, -1.362357, 0, 1, 0.02745098, 1,
-0.4662999, 0.2159948, -2.086599, 0, 1, 0.03529412, 1,
-0.4659668, 0.1372315, -2.300895, 0, 1, 0.03921569, 1,
-0.4616137, -2.084042, -2.786243, 0, 1, 0.04705882, 1,
-0.4612564, -0.646858, -2.223091, 0, 1, 0.05098039, 1,
-0.4573581, 0.2968951, -1.607662, 0, 1, 0.05882353, 1,
-0.4560195, -0.5406294, -1.602097, 0, 1, 0.0627451, 1,
-0.4452706, -0.6865881, -0.4772955, 0, 1, 0.07058824, 1,
-0.4449334, -0.2258226, -3.534168, 0, 1, 0.07450981, 1,
-0.4439579, 0.876964, -0.1756465, 0, 1, 0.08235294, 1,
-0.4428583, -1.307677, -3.53671, 0, 1, 0.08627451, 1,
-0.441874, 2.240143, 0.6501891, 0, 1, 0.09411765, 1,
-0.4405465, 0.7629074, -0.6054612, 0, 1, 0.1019608, 1,
-0.4401362, -0.01186005, -1.261614, 0, 1, 0.1058824, 1,
-0.4401186, -0.06640039, -3.099832, 0, 1, 0.1137255, 1,
-0.4386559, -1.354684, -3.216851, 0, 1, 0.1176471, 1,
-0.4369355, 2.776876, -0.9756459, 0, 1, 0.1254902, 1,
-0.436566, -0.3209469, -2.483103, 0, 1, 0.1294118, 1,
-0.4363646, 0.2287681, -0.494658, 0, 1, 0.1372549, 1,
-0.4336103, -0.259936, -1.476616, 0, 1, 0.1411765, 1,
-0.4319405, -1.244934, -1.492514, 0, 1, 0.1490196, 1,
-0.4305694, -0.7802166, -3.0753, 0, 1, 0.1529412, 1,
-0.4286483, 0.4344163, -1.385687, 0, 1, 0.1607843, 1,
-0.4242295, 0.6328231, -0.3335461, 0, 1, 0.1647059, 1,
-0.4235252, -0.4638765, -2.005296, 0, 1, 0.172549, 1,
-0.4209662, 1.440093, -0.9065105, 0, 1, 0.1764706, 1,
-0.4208668, 1.08814, -1.02407, 0, 1, 0.1843137, 1,
-0.4169994, 0.5688187, 0.08271294, 0, 1, 0.1882353, 1,
-0.4156715, -0.9532791, -2.690412, 0, 1, 0.1960784, 1,
-0.4145589, -1.147431, -2.401063, 0, 1, 0.2039216, 1,
-0.4099436, -0.6661158, -1.74654, 0, 1, 0.2078431, 1,
-0.4092214, 0.1297072, -2.241402, 0, 1, 0.2156863, 1,
-0.4084245, -0.2275444, -2.632031, 0, 1, 0.2196078, 1,
-0.4042327, -0.7172927, -1.132649, 0, 1, 0.227451, 1,
-0.4039379, -0.3454395, -0.306047, 0, 1, 0.2313726, 1,
-0.4022222, -0.1471948, -3.337855, 0, 1, 0.2392157, 1,
-0.4007086, -0.4968742, -2.854773, 0, 1, 0.2431373, 1,
-0.3972825, -0.5381856, -4.447505, 0, 1, 0.2509804, 1,
-0.3972332, -0.6248759, -2.082623, 0, 1, 0.254902, 1,
-0.3965054, 0.5003937, 1.252173, 0, 1, 0.2627451, 1,
-0.3948424, -0.3347427, -2.033058, 0, 1, 0.2666667, 1,
-0.3942765, 0.8212811, -0.6852849, 0, 1, 0.2745098, 1,
-0.3899548, -0.6050957, -3.871877, 0, 1, 0.2784314, 1,
-0.3892873, -0.4627835, -2.108458, 0, 1, 0.2862745, 1,
-0.3806673, 0.1643262, 0.07733737, 0, 1, 0.2901961, 1,
-0.3803219, 1.461343, 0.6559607, 0, 1, 0.2980392, 1,
-0.3798495, -0.2384618, -2.511699, 0, 1, 0.3058824, 1,
-0.3733151, 2.385802, -1.184551, 0, 1, 0.3098039, 1,
-0.367872, -1.27309, -2.620936, 0, 1, 0.3176471, 1,
-0.3645451, 0.3611818, -0.8249143, 0, 1, 0.3215686, 1,
-0.3608837, 0.0337836, -1.539008, 0, 1, 0.3294118, 1,
-0.3571463, -1.039306, -3.072509, 0, 1, 0.3333333, 1,
-0.3546654, -0.06401941, 1.32904, 0, 1, 0.3411765, 1,
-0.3546606, 0.00631767, -1.896009, 0, 1, 0.345098, 1,
-0.3511315, -0.6782088, -1.66509, 0, 1, 0.3529412, 1,
-0.3495799, 1.303743, -1.061647, 0, 1, 0.3568628, 1,
-0.3381471, -0.07674572, -0.9922912, 0, 1, 0.3647059, 1,
-0.3364244, 1.652816, -0.6052476, 0, 1, 0.3686275, 1,
-0.3349622, -0.6712766, -1.615904, 0, 1, 0.3764706, 1,
-0.3336017, 2.214153, -1.497873, 0, 1, 0.3803922, 1,
-0.3328687, 0.0398034, -1.961477, 0, 1, 0.3882353, 1,
-0.3321601, -0.3122769, -1.7767, 0, 1, 0.3921569, 1,
-0.3311004, -0.4194885, -2.449753, 0, 1, 0.4, 1,
-0.3232101, 0.01658251, -1.844013, 0, 1, 0.4078431, 1,
-0.3211996, 0.3023627, -1.523182, 0, 1, 0.4117647, 1,
-0.3169872, -0.5079306, -1.208331, 0, 1, 0.4196078, 1,
-0.315723, -0.3518103, -2.206603, 0, 1, 0.4235294, 1,
-0.31241, 1.917422, -0.730747, 0, 1, 0.4313726, 1,
-0.311316, -0.7093767, -2.478642, 0, 1, 0.4352941, 1,
-0.3108887, -1.583244, -1.779341, 0, 1, 0.4431373, 1,
-0.3095044, 0.9899583, -1.229498, 0, 1, 0.4470588, 1,
-0.3084162, 0.1064856, -1.264042, 0, 1, 0.454902, 1,
-0.3001448, 0.5735795, -1.852192, 0, 1, 0.4588235, 1,
-0.2964317, -1.631925, -2.403749, 0, 1, 0.4666667, 1,
-0.2925592, 1.476565, -0.2630577, 0, 1, 0.4705882, 1,
-0.2914427, 1.425921, -0.3338696, 0, 1, 0.4784314, 1,
-0.2896592, 1.22551, -0.6572435, 0, 1, 0.4823529, 1,
-0.2857119, -0.6475444, -3.358131, 0, 1, 0.4901961, 1,
-0.2842898, 0.05741984, -1.55984, 0, 1, 0.4941176, 1,
-0.284269, 2.088287, 0.8930637, 0, 1, 0.5019608, 1,
-0.2813643, 0.2792324, -0.316129, 0, 1, 0.509804, 1,
-0.2811586, -0.5755985, -2.957402, 0, 1, 0.5137255, 1,
-0.2765604, 0.7533564, -0.7661288, 0, 1, 0.5215687, 1,
-0.2735161, -0.4658279, -1.969348, 0, 1, 0.5254902, 1,
-0.2690968, -0.09571332, -0.9005372, 0, 1, 0.5333334, 1,
-0.2643537, -0.006105799, -1.976383, 0, 1, 0.5372549, 1,
-0.2634432, -0.3298591, -3.211207, 0, 1, 0.5450981, 1,
-0.2602976, 0.6212571, -1.165152, 0, 1, 0.5490196, 1,
-0.2588777, -0.02346439, -0.1372807, 0, 1, 0.5568628, 1,
-0.2581539, -1.660929, -4.577373, 0, 1, 0.5607843, 1,
-0.2559257, 0.2896006, -1.870692, 0, 1, 0.5686275, 1,
-0.2523311, -0.3623976, -1.089324, 0, 1, 0.572549, 1,
-0.2452745, -0.5080043, -4.359981, 0, 1, 0.5803922, 1,
-0.2422108, -0.03953879, -2.63627, 0, 1, 0.5843138, 1,
-0.23914, -1.631225, -3.147617, 0, 1, 0.5921569, 1,
-0.2389786, 0.006352577, -0.6310306, 0, 1, 0.5960785, 1,
-0.2364706, 0.06195458, -0.3989516, 0, 1, 0.6039216, 1,
-0.2306977, 1.082005, 1.879837, 0, 1, 0.6117647, 1,
-0.2303222, 1.22025, -1.948389, 0, 1, 0.6156863, 1,
-0.2245063, -0.3942416, -3.078337, 0, 1, 0.6235294, 1,
-0.2237771, -1.338377, -5.151199, 0, 1, 0.627451, 1,
-0.2227648, 0.3332047, 0.4934261, 0, 1, 0.6352941, 1,
-0.2218955, -0.1209282, -2.299519, 0, 1, 0.6392157, 1,
-0.2138149, -1.411363, -2.336555, 0, 1, 0.6470588, 1,
-0.2127946, -2.827101, -3.930835, 0, 1, 0.6509804, 1,
-0.2107293, 0.747897, 1.193378, 0, 1, 0.6588235, 1,
-0.2084763, -1.840011, -4.150951, 0, 1, 0.6627451, 1,
-0.2035693, -0.677728, -1.364828, 0, 1, 0.6705883, 1,
-0.2025268, -0.4095949, -2.624535, 0, 1, 0.6745098, 1,
-0.1994763, 2.037834, -0.4850774, 0, 1, 0.682353, 1,
-0.1941192, -0.217281, -0.4965821, 0, 1, 0.6862745, 1,
-0.1912577, -0.3965888, -1.806131, 0, 1, 0.6941177, 1,
-0.1872123, -1.217086, -2.420052, 0, 1, 0.7019608, 1,
-0.1866119, 0.9676772, 0.7662444, 0, 1, 0.7058824, 1,
-0.1798159, 1.019372, 1.29713, 0, 1, 0.7137255, 1,
-0.1796305, -0.8153027, -3.515978, 0, 1, 0.7176471, 1,
-0.1741856, -0.7359453, -5.087474, 0, 1, 0.7254902, 1,
-0.1735244, -0.7086452, -1.823256, 0, 1, 0.7294118, 1,
-0.1731683, -0.2358652, -2.237889, 0, 1, 0.7372549, 1,
-0.1710322, -1.735919, -4.47889, 0, 1, 0.7411765, 1,
-0.1708907, 2.454365, 0.8188914, 0, 1, 0.7490196, 1,
-0.1669369, 0.5266361, -1.6314, 0, 1, 0.7529412, 1,
-0.163219, -1.540947, -3.952516, 0, 1, 0.7607843, 1,
-0.1588768, -0.09605265, -0.4690697, 0, 1, 0.7647059, 1,
-0.1582175, -0.8641054, -3.780489, 0, 1, 0.772549, 1,
-0.1557218, 0.6484071, 1.613457, 0, 1, 0.7764706, 1,
-0.1556458, 1.125574, 1.096009, 0, 1, 0.7843137, 1,
-0.1527444, 1.221996, 0.1722309, 0, 1, 0.7882353, 1,
-0.1524809, -0.3174751, -4.008913, 0, 1, 0.7960784, 1,
-0.146664, 1.331866, 1.22041, 0, 1, 0.8039216, 1,
-0.129318, 1.390375, 0.3359568, 0, 1, 0.8078431, 1,
-0.1292072, -0.009007231, -1.155552, 0, 1, 0.8156863, 1,
-0.1234873, 1.777869, 0.06743167, 0, 1, 0.8196079, 1,
-0.1230378, 1.048341, 1.358918, 0, 1, 0.827451, 1,
-0.1218652, 1.185935, -0.3938532, 0, 1, 0.8313726, 1,
-0.119283, 0.1130133, -0.3691793, 0, 1, 0.8392157, 1,
-0.1186488, 0.7351784, -0.3802186, 0, 1, 0.8431373, 1,
-0.1180841, 0.8210534, -1.757752, 0, 1, 0.8509804, 1,
-0.1179472, 1.443415, -0.08679242, 0, 1, 0.854902, 1,
-0.1149301, 0.5422292, 1.162204, 0, 1, 0.8627451, 1,
-0.1141663, -1.133279, -2.174045, 0, 1, 0.8666667, 1,
-0.1119712, -0.6173452, -2.703532, 0, 1, 0.8745098, 1,
-0.1094625, 0.1589395, -0.3019683, 0, 1, 0.8784314, 1,
-0.109435, 0.6720751, -0.006733309, 0, 1, 0.8862745, 1,
-0.1036293, 1.133411, -1.354047, 0, 1, 0.8901961, 1,
-0.1020148, 2.448949, 0.02480699, 0, 1, 0.8980392, 1,
-0.1019775, 1.668981, -0.6972836, 0, 1, 0.9058824, 1,
-0.09907345, 0.4920551, -1.211952, 0, 1, 0.9098039, 1,
-0.09483677, -0.3372861, -2.607854, 0, 1, 0.9176471, 1,
-0.09396843, 0.1396566, 1.145775, 0, 1, 0.9215686, 1,
-0.09380924, -1.417055, -3.770121, 0, 1, 0.9294118, 1,
-0.09355899, -0.3323959, -0.6379034, 0, 1, 0.9333333, 1,
-0.09290975, -1.640965, -2.781022, 0, 1, 0.9411765, 1,
-0.09028107, -1.148803, -2.371204, 0, 1, 0.945098, 1,
-0.08944919, -0.7567305, -2.962609, 0, 1, 0.9529412, 1,
-0.08871569, -2.409831, -1.426661, 0, 1, 0.9568627, 1,
-0.08627352, -2.971693, -5.830578, 0, 1, 0.9647059, 1,
-0.0839265, 0.9664994, 0.2550425, 0, 1, 0.9686275, 1,
-0.0798132, 1.606962, -0.6210614, 0, 1, 0.9764706, 1,
-0.07815457, -2.215682, -2.349702, 0, 1, 0.9803922, 1,
-0.07355651, -1.449071, -3.059095, 0, 1, 0.9882353, 1,
-0.07329998, -0.2707223, -3.72588, 0, 1, 0.9921569, 1,
-0.06994337, 0.1157023, 0.3576963, 0, 1, 1, 1,
-0.06943734, 0.9359536, 1.249513, 0, 0.9921569, 1, 1,
-0.06622415, 0.5340179, -0.3008494, 0, 0.9882353, 1, 1,
-0.06284825, -0.2783785, -3.879675, 0, 0.9803922, 1, 1,
-0.06132996, -2.124444, -3.927184, 0, 0.9764706, 1, 1,
-0.06076338, 0.6864105, -0.3041875, 0, 0.9686275, 1, 1,
-0.06042667, -0.2329437, -2.556193, 0, 0.9647059, 1, 1,
-0.05540352, 0.138965, -0.2347009, 0, 0.9568627, 1, 1,
-0.05535875, -0.7238129, -2.291415, 0, 0.9529412, 1, 1,
-0.05386231, 1.535975, -0.0257299, 0, 0.945098, 1, 1,
-0.05243483, 0.822715, 0.08487432, 0, 0.9411765, 1, 1,
-0.05216915, 0.7943032, -0.2886369, 0, 0.9333333, 1, 1,
-0.052087, 0.02505976, -1.080253, 0, 0.9294118, 1, 1,
-0.04896554, -0.8577003, -0.5483952, 0, 0.9215686, 1, 1,
-0.0442907, -0.07427295, -1.770112, 0, 0.9176471, 1, 1,
-0.04030857, -0.03124953, -3.146637, 0, 0.9098039, 1, 1,
-0.0369335, -0.51805, -2.264174, 0, 0.9058824, 1, 1,
-0.03588836, 1.170501, 0.9037862, 0, 0.8980392, 1, 1,
-0.03113032, -0.07123497, -2.789602, 0, 0.8901961, 1, 1,
-0.02388745, -0.2059716, -2.55467, 0, 0.8862745, 1, 1,
-0.02329304, 0.3883612, 1.060316, 0, 0.8784314, 1, 1,
-0.02084794, -1.879869, -5.186858, 0, 0.8745098, 1, 1,
-0.01872401, -0.04084592, -1.896537, 0, 0.8666667, 1, 1,
-0.0150625, -0.4231465, -3.392182, 0, 0.8627451, 1, 1,
-0.01504353, 1.135578, 0.1231171, 0, 0.854902, 1, 1,
-0.01486063, 0.03100301, -1.195731, 0, 0.8509804, 1, 1,
-0.01192154, -1.319616, -4.564154, 0, 0.8431373, 1, 1,
-0.01148633, 0.738351, -1.300847, 0, 0.8392157, 1, 1,
-0.002018257, 0.05067334, -2.101458, 0, 0.8313726, 1, 1,
-0.001310425, -0.4821059, -2.66112, 0, 0.827451, 1, 1,
0.001234736, 0.1113658, -0.7954267, 0, 0.8196079, 1, 1,
0.003067479, -0.6175247, 2.519619, 0, 0.8156863, 1, 1,
0.01022673, 1.918424, -1.423722, 0, 0.8078431, 1, 1,
0.01426368, 1.508227, -0.7911268, 0, 0.8039216, 1, 1,
0.01897055, 0.4550753, 0.8044541, 0, 0.7960784, 1, 1,
0.0203886, 0.7952482, -0.3518125, 0, 0.7882353, 1, 1,
0.02496974, 0.9162399, 0.745868, 0, 0.7843137, 1, 1,
0.02551088, -0.5412194, 3.681106, 0, 0.7764706, 1, 1,
0.02594617, -1.210649, 2.207577, 0, 0.772549, 1, 1,
0.03229281, 0.1009014, 0.302131, 0, 0.7647059, 1, 1,
0.03940505, 0.3069479, 0.4737606, 0, 0.7607843, 1, 1,
0.03959797, 1.380188, 1.452011, 0, 0.7529412, 1, 1,
0.04096471, 0.1201714, -0.1476275, 0, 0.7490196, 1, 1,
0.04109508, 0.6155515, -1.928614, 0, 0.7411765, 1, 1,
0.04427157, 1.492663, 0.6634709, 0, 0.7372549, 1, 1,
0.04463129, -0.686753, 2.781452, 0, 0.7294118, 1, 1,
0.0539403, -0.02874543, 1.121348, 0, 0.7254902, 1, 1,
0.05920158, 2.043694, 1.19322, 0, 0.7176471, 1, 1,
0.0611089, -0.4750205, 0.08248715, 0, 0.7137255, 1, 1,
0.06224093, 0.1692683, -0.7604727, 0, 0.7058824, 1, 1,
0.06488456, -0.08792453, 3.288172, 0, 0.6980392, 1, 1,
0.0704462, 1.313477, -1.891671, 0, 0.6941177, 1, 1,
0.07356296, -0.3303497, 3.67188, 0, 0.6862745, 1, 1,
0.07438816, 0.8137155, 0.5460981, 0, 0.682353, 1, 1,
0.07455353, -0.5205869, 2.467796, 0, 0.6745098, 1, 1,
0.07608086, -1.933104, 3.16609, 0, 0.6705883, 1, 1,
0.07695973, 0.7187449, 1.149481, 0, 0.6627451, 1, 1,
0.07855901, 0.2393284, 0.9597749, 0, 0.6588235, 1, 1,
0.08458292, -0.7220412, 1.90981, 0, 0.6509804, 1, 1,
0.08710744, 1.020238, -0.1019432, 0, 0.6470588, 1, 1,
0.08777055, -1.88768, 2.850487, 0, 0.6392157, 1, 1,
0.09317109, 1.201627, -0.4287911, 0, 0.6352941, 1, 1,
0.09566478, -0.2004343, 2.527065, 0, 0.627451, 1, 1,
0.09667877, 0.5753617, 0.5777348, 0, 0.6235294, 1, 1,
0.106529, -0.8628832, 0.7254773, 0, 0.6156863, 1, 1,
0.1087871, 0.2139196, 0.4465855, 0, 0.6117647, 1, 1,
0.1112841, -0.8209149, 2.048278, 0, 0.6039216, 1, 1,
0.1213067, -2.23519, 4.871121, 0, 0.5960785, 1, 1,
0.1230956, -1.311101, 2.974173, 0, 0.5921569, 1, 1,
0.1286303, -0.003843444, 0.3872754, 0, 0.5843138, 1, 1,
0.1290319, -1.072529, 2.791874, 0, 0.5803922, 1, 1,
0.1310277, 1.103304, -1.006031, 0, 0.572549, 1, 1,
0.1366173, 0.5855314, -0.1496192, 0, 0.5686275, 1, 1,
0.1371496, -0.2794404, 0.3552068, 0, 0.5607843, 1, 1,
0.143425, -1.479839, 2.176482, 0, 0.5568628, 1, 1,
0.1481032, 1.710581, -0.2049962, 0, 0.5490196, 1, 1,
0.153533, 1.665993, -1.412457, 0, 0.5450981, 1, 1,
0.1576418, -0.2985418, 2.236095, 0, 0.5372549, 1, 1,
0.1601734, 0.1930919, 0.2484927, 0, 0.5333334, 1, 1,
0.1616042, 2.035365, 0.03755007, 0, 0.5254902, 1, 1,
0.1641375, 1.0433, -1.288049, 0, 0.5215687, 1, 1,
0.1678881, -2.622862, 3.257305, 0, 0.5137255, 1, 1,
0.1692351, 1.506045, 0.3169857, 0, 0.509804, 1, 1,
0.1697052, -1.283962, 2.356425, 0, 0.5019608, 1, 1,
0.1752389, 0.6735016, 2.370238, 0, 0.4941176, 1, 1,
0.1782559, 0.5485596, -0.4895123, 0, 0.4901961, 1, 1,
0.1868455, -0.1693894, 2.403539, 0, 0.4823529, 1, 1,
0.1927004, 0.5668785, -0.8543416, 0, 0.4784314, 1, 1,
0.1942361, 1.987911, 0.5714411, 0, 0.4705882, 1, 1,
0.2030369, -1.444045, 3.613129, 0, 0.4666667, 1, 1,
0.2048784, 0.8139912, 0.3182661, 0, 0.4588235, 1, 1,
0.2097243, 0.8939995, 2.122545, 0, 0.454902, 1, 1,
0.2204011, -0.6489475, 2.453464, 0, 0.4470588, 1, 1,
0.2227489, -0.829946, 2.98542, 0, 0.4431373, 1, 1,
0.2302305, 1.708675, 1.033827, 0, 0.4352941, 1, 1,
0.2340322, 2.065392, 0.9624711, 0, 0.4313726, 1, 1,
0.2356355, 1.82443, -0.8664021, 0, 0.4235294, 1, 1,
0.2383161, -0.9148241, 2.742949, 0, 0.4196078, 1, 1,
0.2415985, 0.2348444, 1.076231, 0, 0.4117647, 1, 1,
0.2428758, 0.1923034, 2.858124, 0, 0.4078431, 1, 1,
0.2431322, -1.313899, 4.185348, 0, 0.4, 1, 1,
0.2461133, -0.9817563, 3.975576, 0, 0.3921569, 1, 1,
0.2461343, -0.1388811, 3.278631, 0, 0.3882353, 1, 1,
0.2467891, -0.8680893, 3.71113, 0, 0.3803922, 1, 1,
0.2554868, -1.786018, 4.157084, 0, 0.3764706, 1, 1,
0.2560963, -0.688448, 3.005685, 0, 0.3686275, 1, 1,
0.2588109, 0.02419026, 2.053041, 0, 0.3647059, 1, 1,
0.2600922, 0.05575749, 2.61937, 0, 0.3568628, 1, 1,
0.2636417, 0.3150352, 1.535277, 0, 0.3529412, 1, 1,
0.2643667, 0.6673865, 1.009961, 0, 0.345098, 1, 1,
0.266145, 1.515097, -0.30688, 0, 0.3411765, 1, 1,
0.2671544, 0.3935581, 1.312622, 0, 0.3333333, 1, 1,
0.2681677, 0.7495306, -0.2390342, 0, 0.3294118, 1, 1,
0.2693674, 1.184211, -0.1659243, 0, 0.3215686, 1, 1,
0.2694672, 0.1019645, 0.2938478, 0, 0.3176471, 1, 1,
0.2745458, -0.6564416, 2.655404, 0, 0.3098039, 1, 1,
0.2755599, 0.5165332, -1.61117, 0, 0.3058824, 1, 1,
0.2785961, 0.553089, -1.625823, 0, 0.2980392, 1, 1,
0.2789944, 0.1540335, -0.3931298, 0, 0.2901961, 1, 1,
0.281698, -0.876204, 1.811947, 0, 0.2862745, 1, 1,
0.2844342, -0.9194568, 2.594405, 0, 0.2784314, 1, 1,
0.2866066, -0.7694245, 3.167188, 0, 0.2745098, 1, 1,
0.2872288, -0.8394868, 3.943732, 0, 0.2666667, 1, 1,
0.2905165, 0.3394633, 0.07360143, 0, 0.2627451, 1, 1,
0.2934117, -0.6572082, 3.485129, 0, 0.254902, 1, 1,
0.2965598, -0.324364, 0.6526284, 0, 0.2509804, 1, 1,
0.2981406, -1.314386, 3.647872, 0, 0.2431373, 1, 1,
0.2990887, -0.8410794, 2.497087, 0, 0.2392157, 1, 1,
0.3034007, -1.634134, 2.965786, 0, 0.2313726, 1, 1,
0.304824, 0.09967885, 0.3793059, 0, 0.227451, 1, 1,
0.3104717, -0.3710659, 1.627124, 0, 0.2196078, 1, 1,
0.3132575, -2.014121, 5.007755, 0, 0.2156863, 1, 1,
0.3185219, 0.3200571, 0.4097932, 0, 0.2078431, 1, 1,
0.3272308, -0.5556685, 3.078664, 0, 0.2039216, 1, 1,
0.3295211, 0.9687957, 0.901135, 0, 0.1960784, 1, 1,
0.3328093, 0.7151983, 1.366739, 0, 0.1882353, 1, 1,
0.3375805, -0.1342648, 3.292749, 0, 0.1843137, 1, 1,
0.3502494, 1.896684, -0.3599229, 0, 0.1764706, 1, 1,
0.3509554, 0.1881105, 0.2551985, 0, 0.172549, 1, 1,
0.3514827, -0.1825461, 1.987267, 0, 0.1647059, 1, 1,
0.3575299, 1.952548, 1.404767, 0, 0.1607843, 1, 1,
0.3584945, 0.8343683, -0.9980017, 0, 0.1529412, 1, 1,
0.362023, -0.0018766, 1.042404, 0, 0.1490196, 1, 1,
0.3660254, -0.315955, 2.920574, 0, 0.1411765, 1, 1,
0.3685481, -0.1247499, 1.860794, 0, 0.1372549, 1, 1,
0.3754151, -0.03570183, 2.699246, 0, 0.1294118, 1, 1,
0.3766131, 1.184424, 0.3874632, 0, 0.1254902, 1, 1,
0.3823346, 0.4687983, 2.756829, 0, 0.1176471, 1, 1,
0.3850646, -0.3629827, 2.094674, 0, 0.1137255, 1, 1,
0.3853616, -1.544522, 1.471865, 0, 0.1058824, 1, 1,
0.3860122, 0.3638192, 0.9969137, 0, 0.09803922, 1, 1,
0.3879911, 1.603757, -0.4903778, 0, 0.09411765, 1, 1,
0.3887042, -1.010107, 3.15987, 0, 0.08627451, 1, 1,
0.3890151, 0.2462828, 1.579261, 0, 0.08235294, 1, 1,
0.3976517, 0.002764141, 0.6927789, 0, 0.07450981, 1, 1,
0.39772, -1.84842, 4.898242, 0, 0.07058824, 1, 1,
0.3981726, 0.4894429, 0.6009042, 0, 0.0627451, 1, 1,
0.3992166, 0.9325348, -0.006505845, 0, 0.05882353, 1, 1,
0.4094272, 0.6451231, -0.2394901, 0, 0.05098039, 1, 1,
0.4095947, 0.6067733, -0.5285385, 0, 0.04705882, 1, 1,
0.4118796, 0.374096, 0.9998147, 0, 0.03921569, 1, 1,
0.4126095, 1.673143, 0.6344078, 0, 0.03529412, 1, 1,
0.4164119, 0.5145294, 1.584936, 0, 0.02745098, 1, 1,
0.4205587, 0.3360108, 1.076888, 0, 0.02352941, 1, 1,
0.4207113, 0.72623, -0.3484086, 0, 0.01568628, 1, 1,
0.4213044, -1.361228, 2.269281, 0, 0.01176471, 1, 1,
0.4216057, -1.695405, 2.272666, 0, 0.003921569, 1, 1,
0.4298375, 0.2115607, 2.352342, 0.003921569, 0, 1, 1,
0.4378885, -0.6302091, 1.941292, 0.007843138, 0, 1, 1,
0.4394932, -1.233467, 3.9856, 0.01568628, 0, 1, 1,
0.4432654, 1.019896, 0.9246348, 0.01960784, 0, 1, 1,
0.4446858, 0.6099964, 0.4531842, 0.02745098, 0, 1, 1,
0.4481575, -0.4480246, 2.982596, 0.03137255, 0, 1, 1,
0.4494063, 0.6858579, -0.2099978, 0.03921569, 0, 1, 1,
0.4495002, -0.4004975, 1.022166, 0.04313726, 0, 1, 1,
0.4501036, 1.190779, 0.09367401, 0.05098039, 0, 1, 1,
0.4504944, -0.2870161, 1.287431, 0.05490196, 0, 1, 1,
0.4521614, -0.3671785, 3.585344, 0.0627451, 0, 1, 1,
0.4575677, 0.9177366, -1.071617, 0.06666667, 0, 1, 1,
0.464248, -2.553323, 4.036497, 0.07450981, 0, 1, 1,
0.464431, 0.6453002, -0.7753401, 0.07843138, 0, 1, 1,
0.4645932, -0.6426045, 4.231276, 0.08627451, 0, 1, 1,
0.4646895, 0.09693944, 2.067818, 0.09019608, 0, 1, 1,
0.4684584, -1.437501, 3.303106, 0.09803922, 0, 1, 1,
0.471309, 0.421748, 0.3250509, 0.1058824, 0, 1, 1,
0.4792965, -0.5764101, 2.536281, 0.1098039, 0, 1, 1,
0.4811334, -1.397556, 3.908534, 0.1176471, 0, 1, 1,
0.4873107, 2.384059, 2.143187, 0.1215686, 0, 1, 1,
0.4890054, 0.3484248, 0.1342232, 0.1294118, 0, 1, 1,
0.5002556, 0.650976, 0.4638143, 0.1333333, 0, 1, 1,
0.5016319, -0.6290495, 1.212725, 0.1411765, 0, 1, 1,
0.5017164, 0.1258031, 1.877462, 0.145098, 0, 1, 1,
0.5020366, -0.7901707, 2.277504, 0.1529412, 0, 1, 1,
0.5036628, 1.146843, 0.4633583, 0.1568628, 0, 1, 1,
0.5052181, -1.38856, 2.170185, 0.1647059, 0, 1, 1,
0.5100944, 0.2640474, 1.36338, 0.1686275, 0, 1, 1,
0.5170161, -0.8525854, 2.355468, 0.1764706, 0, 1, 1,
0.5222581, -0.383613, 2.436514, 0.1803922, 0, 1, 1,
0.5222785, -0.8759528, 3.197954, 0.1882353, 0, 1, 1,
0.5225673, -0.08805947, 1.266378, 0.1921569, 0, 1, 1,
0.5228285, -1.17362, 3.750617, 0.2, 0, 1, 1,
0.5252583, -0.3470643, 3.498096, 0.2078431, 0, 1, 1,
0.5265096, -0.4769441, 1.784377, 0.2117647, 0, 1, 1,
0.5303646, -2.494878, 2.525127, 0.2196078, 0, 1, 1,
0.5309783, -0.3123096, 1.242804, 0.2235294, 0, 1, 1,
0.5361313, -1.369498, 3.506585, 0.2313726, 0, 1, 1,
0.5363464, 2.030581, 0.294629, 0.2352941, 0, 1, 1,
0.5376647, 0.5315142, -2.159646, 0.2431373, 0, 1, 1,
0.5380774, 0.5993325, 1.943446, 0.2470588, 0, 1, 1,
0.5408621, -0.7438401, 3.423951, 0.254902, 0, 1, 1,
0.543119, -0.156519, 2.206644, 0.2588235, 0, 1, 1,
0.5563872, -0.3562784, 0.5441684, 0.2666667, 0, 1, 1,
0.5564708, 0.1289815, 0.9851183, 0.2705882, 0, 1, 1,
0.5604029, -0.6583913, 2.819001, 0.2784314, 0, 1, 1,
0.5661411, -1.094127, 2.875278, 0.282353, 0, 1, 1,
0.5664694, -1.852617, 0.508239, 0.2901961, 0, 1, 1,
0.5674639, -1.339635, 3.798477, 0.2941177, 0, 1, 1,
0.5686179, -0.3283025, 2.061458, 0.3019608, 0, 1, 1,
0.5767984, -0.5923644, 3.005162, 0.3098039, 0, 1, 1,
0.5783758, -0.5448317, 2.902462, 0.3137255, 0, 1, 1,
0.5828881, -0.1301196, 2.370514, 0.3215686, 0, 1, 1,
0.5837624, 0.06021521, 3.042063, 0.3254902, 0, 1, 1,
0.6003799, -0.2033755, 2.086349, 0.3333333, 0, 1, 1,
0.6008384, 0.3393179, 2.435129, 0.3372549, 0, 1, 1,
0.60284, 1.009925, 0.2770255, 0.345098, 0, 1, 1,
0.604084, 1.204912, 1.69287, 0.3490196, 0, 1, 1,
0.6099247, -0.3773015, 1.537094, 0.3568628, 0, 1, 1,
0.6111778, -0.2799332, 3.212071, 0.3607843, 0, 1, 1,
0.6115639, 0.3057496, 0.5968635, 0.3686275, 0, 1, 1,
0.6127827, -2.049899, 3.456115, 0.372549, 0, 1, 1,
0.6159838, -0.7981095, 3.944452, 0.3803922, 0, 1, 1,
0.6205185, -0.180948, 1.684685, 0.3843137, 0, 1, 1,
0.6229174, -0.7687276, 1.664333, 0.3921569, 0, 1, 1,
0.6232412, 1.678166, -0.0249251, 0.3960784, 0, 1, 1,
0.6233038, 1.377961, 0.4214216, 0.4039216, 0, 1, 1,
0.6251732, -0.03177826, 1.712795, 0.4117647, 0, 1, 1,
0.6269009, -1.717584, 1.343031, 0.4156863, 0, 1, 1,
0.6366456, 2.563932, 0.1613992, 0.4235294, 0, 1, 1,
0.6397886, 2.180218, 0.1807824, 0.427451, 0, 1, 1,
0.6402009, 1.310695, -0.05770243, 0.4352941, 0, 1, 1,
0.6406776, 0.8002562, 1.038786, 0.4392157, 0, 1, 1,
0.6444899, 0.3623168, 0.8189003, 0.4470588, 0, 1, 1,
0.6455445, -1.501954, 2.910676, 0.4509804, 0, 1, 1,
0.6498791, 0.2797271, 1.132452, 0.4588235, 0, 1, 1,
0.6508704, 1.241191, -0.8392743, 0.4627451, 0, 1, 1,
0.6571781, 0.01583604, 3.360741, 0.4705882, 0, 1, 1,
0.6594663, -1.135398, 1.759433, 0.4745098, 0, 1, 1,
0.6628871, 0.1294627, 2.705325, 0.4823529, 0, 1, 1,
0.6699809, 0.7653639, 2.511717, 0.4862745, 0, 1, 1,
0.670715, 0.4744759, 0.1209397, 0.4941176, 0, 1, 1,
0.671782, 0.2868116, 0.3058504, 0.5019608, 0, 1, 1,
0.68583, 0.3066729, 0.1987767, 0.5058824, 0, 1, 1,
0.6881216, -0.4046075, 0.5813586, 0.5137255, 0, 1, 1,
0.6934946, -0.9560838, 4.996723, 0.5176471, 0, 1, 1,
0.6951089, -0.955146, 2.505382, 0.5254902, 0, 1, 1,
0.6995023, -0.6669763, 0.8506224, 0.5294118, 0, 1, 1,
0.700057, -0.9845959, 0.702253, 0.5372549, 0, 1, 1,
0.7012963, -0.5065641, 0.9288159, 0.5411765, 0, 1, 1,
0.7031568, -0.5324102, 1.944321, 0.5490196, 0, 1, 1,
0.7073478, -0.2009599, 1.629476, 0.5529412, 0, 1, 1,
0.7168011, 1.367201, 1.066498, 0.5607843, 0, 1, 1,
0.7177147, 0.137576, -0.1745253, 0.5647059, 0, 1, 1,
0.721224, 1.82194, 0.259975, 0.572549, 0, 1, 1,
0.7227959, 0.6451144, 1.001183, 0.5764706, 0, 1, 1,
0.7253982, -0.2696228, 2.368746, 0.5843138, 0, 1, 1,
0.7338285, -0.08838326, 0.1898683, 0.5882353, 0, 1, 1,
0.7440962, -0.4952368, 1.072083, 0.5960785, 0, 1, 1,
0.7468484, 0.5438966, 0.3499112, 0.6039216, 0, 1, 1,
0.7472245, -1.606757, 3.678295, 0.6078432, 0, 1, 1,
0.7564274, -0.04825339, 1.402951, 0.6156863, 0, 1, 1,
0.7566725, -0.0554522, 2.071174, 0.6196079, 0, 1, 1,
0.7575356, 0.5234805, 2.076372, 0.627451, 0, 1, 1,
0.7639433, 0.1645381, 1.436242, 0.6313726, 0, 1, 1,
0.7778212, -0.205988, 1.006445, 0.6392157, 0, 1, 1,
0.7807145, 0.7332856, 0.2839241, 0.6431373, 0, 1, 1,
0.7931767, 0.1509036, 2.347502, 0.6509804, 0, 1, 1,
0.7959858, -0.3020768, 2.177913, 0.654902, 0, 1, 1,
0.7993307, 1.49695, 0.02053631, 0.6627451, 0, 1, 1,
0.8001219, 0.6568365, 0.2670811, 0.6666667, 0, 1, 1,
0.8001896, -0.01171646, -1.15555, 0.6745098, 0, 1, 1,
0.8035823, 1.117196, 0.3441169, 0.6784314, 0, 1, 1,
0.8038726, -1.085168, 2.131346, 0.6862745, 0, 1, 1,
0.8055147, -0.04163465, 2.2052, 0.6901961, 0, 1, 1,
0.8085783, -0.7878687, 1.616671, 0.6980392, 0, 1, 1,
0.8126686, -0.3008709, 2.107533, 0.7058824, 0, 1, 1,
0.8159384, 0.3180213, 2.417019, 0.7098039, 0, 1, 1,
0.8196614, 0.5502602, 0.8708016, 0.7176471, 0, 1, 1,
0.820354, 2.235989, -0.2321456, 0.7215686, 0, 1, 1,
0.8252918, 1.562381, 1.690576, 0.7294118, 0, 1, 1,
0.82968, 1.315199, -1.778966, 0.7333333, 0, 1, 1,
0.8318387, 0.3214996, -1.925234, 0.7411765, 0, 1, 1,
0.8421586, 0.3073051, 1.131789, 0.7450981, 0, 1, 1,
0.8574761, -0.3971615, 2.664045, 0.7529412, 0, 1, 1,
0.8702371, -0.1650401, 2.026727, 0.7568628, 0, 1, 1,
0.872496, 1.06124, 0.1874199, 0.7647059, 0, 1, 1,
0.8726037, 1.820594, 1.024195, 0.7686275, 0, 1, 1,
0.8850419, -0.09235642, -0.09491604, 0.7764706, 0, 1, 1,
0.8914292, -1.325805, 1.755596, 0.7803922, 0, 1, 1,
0.8916926, 0.9225288, 1.385102, 0.7882353, 0, 1, 1,
0.8917647, 2.324868, -2.704838, 0.7921569, 0, 1, 1,
0.9009831, 0.1251643, 2.364644, 0.8, 0, 1, 1,
0.9030375, -0.8833955, 3.888678, 0.8078431, 0, 1, 1,
0.90342, -0.02770581, 0.7835605, 0.8117647, 0, 1, 1,
0.9078946, -1.673001, 4.750987, 0.8196079, 0, 1, 1,
0.9094822, -0.7622034, 0.8524629, 0.8235294, 0, 1, 1,
0.9138148, 0.1535133, 0.5415493, 0.8313726, 0, 1, 1,
0.9228486, 0.1751674, 1.99357, 0.8352941, 0, 1, 1,
0.9233628, -0.4003634, 2.610691, 0.8431373, 0, 1, 1,
0.931044, -1.270218, 3.071393, 0.8470588, 0, 1, 1,
0.931342, 1.109198, 1.808193, 0.854902, 0, 1, 1,
0.9341317, -0.4175306, 3.194081, 0.8588235, 0, 1, 1,
0.9351217, 1.486806, 1.041833, 0.8666667, 0, 1, 1,
0.9366174, 0.9029727, -0.9497237, 0.8705882, 0, 1, 1,
0.9393868, 2.730751, 1.744513, 0.8784314, 0, 1, 1,
0.9399244, -1.509384, 3.588571, 0.8823529, 0, 1, 1,
0.9405295, -0.9806095, 3.105168, 0.8901961, 0, 1, 1,
0.9461917, 0.4079558, 5.39208, 0.8941177, 0, 1, 1,
0.9533434, 0.4368718, 2.209773, 0.9019608, 0, 1, 1,
0.955615, -0.5702693, 1.706611, 0.9098039, 0, 1, 1,
0.9630969, 0.6685365, 1.377585, 0.9137255, 0, 1, 1,
0.9651658, 0.312137, 0.2245571, 0.9215686, 0, 1, 1,
0.9694284, 0.8163833, 2.273714, 0.9254902, 0, 1, 1,
0.9724834, -2.948563, 1.865512, 0.9333333, 0, 1, 1,
0.9730608, -1.244719, 2.958507, 0.9372549, 0, 1, 1,
0.9797831, 0.231718, 2.442217, 0.945098, 0, 1, 1,
0.9820561, -0.6688553, 0.6000508, 0.9490196, 0, 1, 1,
0.9926565, -0.3173698, 2.564162, 0.9568627, 0, 1, 1,
0.9964039, -0.6076027, 2.699997, 0.9607843, 0, 1, 1,
0.9966313, 1.200196, -0.5276034, 0.9686275, 0, 1, 1,
1.005624, 0.1246075, 1.97308, 0.972549, 0, 1, 1,
1.006184, -0.9917923, 3.396772, 0.9803922, 0, 1, 1,
1.008659, -0.9688755, 2.791914, 0.9843137, 0, 1, 1,
1.011199, 0.8502703, 2.110734, 0.9921569, 0, 1, 1,
1.012701, 0.5183929, 1.468316, 0.9960784, 0, 1, 1,
1.016307, 0.005750814, 0.7862735, 1, 0, 0.9960784, 1,
1.020092, -0.3975123, 2.913587, 1, 0, 0.9882353, 1,
1.023381, -0.9183087, 3.065216, 1, 0, 0.9843137, 1,
1.024987, -0.44834, 3.678679, 1, 0, 0.9764706, 1,
1.02673, -0.2326341, 1.507558, 1, 0, 0.972549, 1,
1.027486, 1.132426, 0.5722912, 1, 0, 0.9647059, 1,
1.028772, -0.1286714, 2.975344, 1, 0, 0.9607843, 1,
1.035853, -1.109478, 2.052742, 1, 0, 0.9529412, 1,
1.043804, -0.1707574, 2.588975, 1, 0, 0.9490196, 1,
1.044556, -0.1214458, 1.895946, 1, 0, 0.9411765, 1,
1.047588, -1.158787, 2.823385, 1, 0, 0.9372549, 1,
1.048217, -0.9230389, 2.842322, 1, 0, 0.9294118, 1,
1.051146, -1.535464, 2.31716, 1, 0, 0.9254902, 1,
1.051358, -0.08805826, 2.009655, 1, 0, 0.9176471, 1,
1.060884, -0.3287277, 2.898906, 1, 0, 0.9137255, 1,
1.06179, -0.01537636, 2.451818, 1, 0, 0.9058824, 1,
1.073699, -0.9625224, 1.633717, 1, 0, 0.9019608, 1,
1.074505, 0.4211828, 1.250087, 1, 0, 0.8941177, 1,
1.077579, -1.002831, 2.954471, 1, 0, 0.8862745, 1,
1.084083, 0.2157743, 2.756656, 1, 0, 0.8823529, 1,
1.090168, -0.3884793, 1.819129, 1, 0, 0.8745098, 1,
1.091989, 0.2367812, -0.5008802, 1, 0, 0.8705882, 1,
1.093171, -1.691499, 2.136634, 1, 0, 0.8627451, 1,
1.095262, 0.04384757, 1.910606, 1, 0, 0.8588235, 1,
1.095437, 0.9365622, 2.622593, 1, 0, 0.8509804, 1,
1.101029, -2.104452, 3.29028, 1, 0, 0.8470588, 1,
1.103718, 0.2261677, 2.047433, 1, 0, 0.8392157, 1,
1.104154, -0.6728737, 2.603703, 1, 0, 0.8352941, 1,
1.104505, 0.2494936, -0.06534699, 1, 0, 0.827451, 1,
1.109453, 1.45419, 0.3287031, 1, 0, 0.8235294, 1,
1.118788, -1.061, 1.308388, 1, 0, 0.8156863, 1,
1.121138, -0.130273, 0.9707215, 1, 0, 0.8117647, 1,
1.12328, -0.6352633, 1.450532, 1, 0, 0.8039216, 1,
1.138666, 1.204949, 1.414582, 1, 0, 0.7960784, 1,
1.145859, 0.01421245, 1.050409, 1, 0, 0.7921569, 1,
1.147589, -0.3034711, 4.424371, 1, 0, 0.7843137, 1,
1.153942, 1.025931, 2.855709, 1, 0, 0.7803922, 1,
1.155437, -0.2364537, 1.048798, 1, 0, 0.772549, 1,
1.15768, 0.6879246, 2.020708, 1, 0, 0.7686275, 1,
1.165471, 0.06763189, 2.675832, 1, 0, 0.7607843, 1,
1.17772, -1.147508, 2.560646, 1, 0, 0.7568628, 1,
1.182612, 0.5249082, 1.632062, 1, 0, 0.7490196, 1,
1.185069, 0.4590834, 0.8660353, 1, 0, 0.7450981, 1,
1.185506, 0.09878169, 2.904718, 1, 0, 0.7372549, 1,
1.187655, -0.3089038, 2.945901, 1, 0, 0.7333333, 1,
1.187698, -2.233345, 2.12808, 1, 0, 0.7254902, 1,
1.190807, 1.088408, 0.9192172, 1, 0, 0.7215686, 1,
1.191756, 1.298546, 1.92449, 1, 0, 0.7137255, 1,
1.191981, 0.5758703, -0.3483012, 1, 0, 0.7098039, 1,
1.202249, -0.3696088, 1.348774, 1, 0, 0.7019608, 1,
1.203144, -0.1719738, 1.117936, 1, 0, 0.6941177, 1,
1.20753, -2.039068, 1.044837, 1, 0, 0.6901961, 1,
1.209967, 0.6753668, 1.890923, 1, 0, 0.682353, 1,
1.212367, 0.575882, -0.09362557, 1, 0, 0.6784314, 1,
1.220892, 0.6069423, 2.44243, 1, 0, 0.6705883, 1,
1.222464, -1.044207, 3.467828, 1, 0, 0.6666667, 1,
1.234929, -0.1123835, 2.199138, 1, 0, 0.6588235, 1,
1.254029, -1.222565, 1.442526, 1, 0, 0.654902, 1,
1.260741, 0.8251503, 1.120267, 1, 0, 0.6470588, 1,
1.261346, 0.4840443, -0.121998, 1, 0, 0.6431373, 1,
1.267091, 1.491918, 1.253556, 1, 0, 0.6352941, 1,
1.273272, -0.5693224, 2.148346, 1, 0, 0.6313726, 1,
1.275116, 0.3391753, 2.857423, 1, 0, 0.6235294, 1,
1.285684, -1.558287, 2.456805, 1, 0, 0.6196079, 1,
1.287829, -2.387186, 2.515154, 1, 0, 0.6117647, 1,
1.288143, -0.7513283, 1.687934, 1, 0, 0.6078432, 1,
1.29999, 0.3335219, 2.174347, 1, 0, 0.6, 1,
1.30486, -2.075988, 2.137226, 1, 0, 0.5921569, 1,
1.305079, -0.2071826, 0.6730859, 1, 0, 0.5882353, 1,
1.3067, 0.9551583, 0.6012858, 1, 0, 0.5803922, 1,
1.307823, 0.3763995, 1.272917, 1, 0, 0.5764706, 1,
1.310841, 1.102543, -1.293858, 1, 0, 0.5686275, 1,
1.312189, -1.08091, 1.825503, 1, 0, 0.5647059, 1,
1.315802, 1.940584, 1.053677, 1, 0, 0.5568628, 1,
1.317912, 0.6285486, 0.42804, 1, 0, 0.5529412, 1,
1.321475, 0.5056319, 0.1750857, 1, 0, 0.5450981, 1,
1.326678, 0.7867302, 1.211221, 1, 0, 0.5411765, 1,
1.327031, 1.578507, 1.51212, 1, 0, 0.5333334, 1,
1.327711, -1.621451, 2.035473, 1, 0, 0.5294118, 1,
1.330019, -0.3456782, 0.9218819, 1, 0, 0.5215687, 1,
1.333977, -0.3448298, 2.792322, 1, 0, 0.5176471, 1,
1.347593, -1.418999, 2.795894, 1, 0, 0.509804, 1,
1.350042, -0.9780968, 2.016611, 1, 0, 0.5058824, 1,
1.3694, -0.7919496, 2.713225, 1, 0, 0.4980392, 1,
1.373241, -1.425925, 3.956445, 1, 0, 0.4901961, 1,
1.383129, 0.09772044, 2.954544, 1, 0, 0.4862745, 1,
1.388371, 0.5946594, 2.418992, 1, 0, 0.4784314, 1,
1.391319, 0.8352898, 1.42723, 1, 0, 0.4745098, 1,
1.402923, -2.346196, 2.332796, 1, 0, 0.4666667, 1,
1.404868, 0.2682306, 0.02247316, 1, 0, 0.4627451, 1,
1.409073, 0.5749023, 1.387168, 1, 0, 0.454902, 1,
1.411963, -0.9433084, 0.7468294, 1, 0, 0.4509804, 1,
1.442266, 0.4575898, 1.398178, 1, 0, 0.4431373, 1,
1.453904, -0.6876951, 2.573302, 1, 0, 0.4392157, 1,
1.490773, -0.9686602, 1.462235, 1, 0, 0.4313726, 1,
1.491248, 0.8658918, -1.830086, 1, 0, 0.427451, 1,
1.49534, -0.704977, 1.112254, 1, 0, 0.4196078, 1,
1.499293, 0.5437869, 1.818255, 1, 0, 0.4156863, 1,
1.509743, -0.1268443, 1.693893, 1, 0, 0.4078431, 1,
1.516654, 0.2650529, 0.8206385, 1, 0, 0.4039216, 1,
1.51963, -0.2934859, 1.376662, 1, 0, 0.3960784, 1,
1.520676, -0.4113637, 0.6898532, 1, 0, 0.3882353, 1,
1.533771, 1.94659, 0.2667491, 1, 0, 0.3843137, 1,
1.544848, -1.172558, 1.835305, 1, 0, 0.3764706, 1,
1.553814, 1.027225, 1.619998, 1, 0, 0.372549, 1,
1.559365, -0.3460343, 2.24089, 1, 0, 0.3647059, 1,
1.564357, 0.3981495, 2.081763, 1, 0, 0.3607843, 1,
1.574336, 1.84026, 0.2298912, 1, 0, 0.3529412, 1,
1.577498, 1.002983, 2.712314, 1, 0, 0.3490196, 1,
1.587498, -1.151376, 1.193678, 1, 0, 0.3411765, 1,
1.599606, 0.07644848, 1.827252, 1, 0, 0.3372549, 1,
1.608545, 0.221253, 1.009221, 1, 0, 0.3294118, 1,
1.627579, -0.9808457, 0.08329193, 1, 0, 0.3254902, 1,
1.641559, 0.1643016, 3.533659, 1, 0, 0.3176471, 1,
1.643229, 1.118878, 0.8643062, 1, 0, 0.3137255, 1,
1.648906, 2.151477, -0.01093349, 1, 0, 0.3058824, 1,
1.660653, -0.5418245, 3.072536, 1, 0, 0.2980392, 1,
1.672787, 0.6907231, 1.045528, 1, 0, 0.2941177, 1,
1.676198, 0.7084088, 1.562775, 1, 0, 0.2862745, 1,
1.682335, 0.7862226, 1.234134, 1, 0, 0.282353, 1,
1.694557, 1.53762, 2.077283, 1, 0, 0.2745098, 1,
1.696887, -0.4607923, 2.616605, 1, 0, 0.2705882, 1,
1.712356, -0.01755572, 1.047706, 1, 0, 0.2627451, 1,
1.712836, 1.461877, 0.8083147, 1, 0, 0.2588235, 1,
1.720607, -0.2335525, 1.041344, 1, 0, 0.2509804, 1,
1.734352, -0.4707926, 1.820249, 1, 0, 0.2470588, 1,
1.75083, 1.530128, 1.124256, 1, 0, 0.2392157, 1,
1.755509, -0.07424228, 1.910574, 1, 0, 0.2352941, 1,
1.772803, -0.08267482, 1.933099, 1, 0, 0.227451, 1,
1.791858, 0.6798231, 2.097239, 1, 0, 0.2235294, 1,
1.825674, -0.6753879, 1.654285, 1, 0, 0.2156863, 1,
1.830234, -0.7578493, 2.149884, 1, 0, 0.2117647, 1,
1.846057, -0.2114588, 1.646074, 1, 0, 0.2039216, 1,
1.865966, 0.8357634, 2.463401, 1, 0, 0.1960784, 1,
1.893309, 0.6874399, 1.881194, 1, 0, 0.1921569, 1,
1.897501, 1.141313, 1.342616, 1, 0, 0.1843137, 1,
1.927279, -1.295031, 1.109532, 1, 0, 0.1803922, 1,
1.928644, -0.6407554, 2.313141, 1, 0, 0.172549, 1,
1.977455, -0.8880172, -0.6672102, 1, 0, 0.1686275, 1,
1.99035, 0.700887, 0.9263808, 1, 0, 0.1607843, 1,
2.044287, 0.2023885, 1.363481, 1, 0, 0.1568628, 1,
2.055107, -1.726307, 4.255823, 1, 0, 0.1490196, 1,
2.060252, -0.3205213, 2.289552, 1, 0, 0.145098, 1,
2.070984, -0.1530132, 0.9041923, 1, 0, 0.1372549, 1,
2.083379, -0.5283524, 2.380994, 1, 0, 0.1333333, 1,
2.098891, -0.2212206, 1.478082, 1, 0, 0.1254902, 1,
2.107074, 0.932262, 0.8518377, 1, 0, 0.1215686, 1,
2.125236, -1.006832, 0.5441646, 1, 0, 0.1137255, 1,
2.136184, 0.8334634, 1.630936, 1, 0, 0.1098039, 1,
2.167158, 2.421905, -0.2243062, 1, 0, 0.1019608, 1,
2.175359, -1.019575, 2.655561, 1, 0, 0.09411765, 1,
2.22308, 1.240586, -0.7277542, 1, 0, 0.09019608, 1,
2.25024, -0.1108081, 3.135492, 1, 0, 0.08235294, 1,
2.258233, -0.614586, 3.106201, 1, 0, 0.07843138, 1,
2.264829, 0.6435307, 4.044678, 1, 0, 0.07058824, 1,
2.295225, -1.816405, 3.451058, 1, 0, 0.06666667, 1,
2.300495, -1.183513, 1.035084, 1, 0, 0.05882353, 1,
2.308717, 0.7585618, 1.095826, 1, 0, 0.05490196, 1,
2.383464, 1.338913, 0.928242, 1, 0, 0.04705882, 1,
2.480688, -0.4553954, 1.703264, 1, 0, 0.04313726, 1,
2.486304, 0.009679932, 1.338144, 1, 0, 0.03529412, 1,
2.60591, 0.799791, 1.824818, 1, 0, 0.03137255, 1,
2.611759, -0.7006395, 2.618173, 1, 0, 0.02352941, 1,
2.641192, 0.286219, -0.1582075, 1, 0, 0.01960784, 1,
3.064855, 0.2132058, 1.487647, 1, 0, 0.01176471, 1,
3.460343, 0.4307671, 0.3101146, 1, 0, 0.007843138, 1
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
0.2782131, -3.946076, -7.732818, 0, -0.5, 0.5, 0.5,
0.2782131, -3.946076, -7.732818, 1, -0.5, 0.5, 0.5,
0.2782131, -3.946076, -7.732818, 1, 1.5, 0.5, 0.5,
0.2782131, -3.946076, -7.732818, 0, 1.5, 0.5, 0.5
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
-3.982659, -0.09740853, -7.732818, 0, -0.5, 0.5, 0.5,
-3.982659, -0.09740853, -7.732818, 1, -0.5, 0.5, 0.5,
-3.982659, -0.09740853, -7.732818, 1, 1.5, 0.5, 0.5,
-3.982659, -0.09740853, -7.732818, 0, 1.5, 0.5, 0.5
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
-3.982659, -3.946076, -0.219249, 0, -0.5, 0.5, 0.5,
-3.982659, -3.946076, -0.219249, 1, -0.5, 0.5, 0.5,
-3.982659, -3.946076, -0.219249, 1, 1.5, 0.5, 0.5,
-3.982659, -3.946076, -0.219249, 0, 1.5, 0.5, 0.5
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
-2, -3.057922, -5.998918,
3, -3.057922, -5.998918,
-2, -3.057922, -5.998918,
-2, -3.205947, -6.287901,
-1, -3.057922, -5.998918,
-1, -3.205947, -6.287901,
0, -3.057922, -5.998918,
0, -3.205947, -6.287901,
1, -3.057922, -5.998918,
1, -3.205947, -6.287901,
2, -3.057922, -5.998918,
2, -3.205947, -6.287901,
3, -3.057922, -5.998918,
3, -3.205947, -6.287901
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
-2, -3.501999, -6.865868, 0, -0.5, 0.5, 0.5,
-2, -3.501999, -6.865868, 1, -0.5, 0.5, 0.5,
-2, -3.501999, -6.865868, 1, 1.5, 0.5, 0.5,
-2, -3.501999, -6.865868, 0, 1.5, 0.5, 0.5,
-1, -3.501999, -6.865868, 0, -0.5, 0.5, 0.5,
-1, -3.501999, -6.865868, 1, -0.5, 0.5, 0.5,
-1, -3.501999, -6.865868, 1, 1.5, 0.5, 0.5,
-1, -3.501999, -6.865868, 0, 1.5, 0.5, 0.5,
0, -3.501999, -6.865868, 0, -0.5, 0.5, 0.5,
0, -3.501999, -6.865868, 1, -0.5, 0.5, 0.5,
0, -3.501999, -6.865868, 1, 1.5, 0.5, 0.5,
0, -3.501999, -6.865868, 0, 1.5, 0.5, 0.5,
1, -3.501999, -6.865868, 0, -0.5, 0.5, 0.5,
1, -3.501999, -6.865868, 1, -0.5, 0.5, 0.5,
1, -3.501999, -6.865868, 1, 1.5, 0.5, 0.5,
1, -3.501999, -6.865868, 0, 1.5, 0.5, 0.5,
2, -3.501999, -6.865868, 0, -0.5, 0.5, 0.5,
2, -3.501999, -6.865868, 1, -0.5, 0.5, 0.5,
2, -3.501999, -6.865868, 1, 1.5, 0.5, 0.5,
2, -3.501999, -6.865868, 0, 1.5, 0.5, 0.5,
3, -3.501999, -6.865868, 0, -0.5, 0.5, 0.5,
3, -3.501999, -6.865868, 1, -0.5, 0.5, 0.5,
3, -3.501999, -6.865868, 1, 1.5, 0.5, 0.5,
3, -3.501999, -6.865868, 0, 1.5, 0.5, 0.5
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
-2.999381, -2, -5.998918,
-2.999381, 2, -5.998918,
-2.999381, -2, -5.998918,
-3.163261, -2, -6.287901,
-2.999381, -1, -5.998918,
-3.163261, -1, -6.287901,
-2.999381, 0, -5.998918,
-3.163261, 0, -6.287901,
-2.999381, 1, -5.998918,
-3.163261, 1, -6.287901,
-2.999381, 2, -5.998918,
-3.163261, 2, -6.287901
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
-3.49102, -2, -6.865868, 0, -0.5, 0.5, 0.5,
-3.49102, -2, -6.865868, 1, -0.5, 0.5, 0.5,
-3.49102, -2, -6.865868, 1, 1.5, 0.5, 0.5,
-3.49102, -2, -6.865868, 0, 1.5, 0.5, 0.5,
-3.49102, -1, -6.865868, 0, -0.5, 0.5, 0.5,
-3.49102, -1, -6.865868, 1, -0.5, 0.5, 0.5,
-3.49102, -1, -6.865868, 1, 1.5, 0.5, 0.5,
-3.49102, -1, -6.865868, 0, 1.5, 0.5, 0.5,
-3.49102, 0, -6.865868, 0, -0.5, 0.5, 0.5,
-3.49102, 0, -6.865868, 1, -0.5, 0.5, 0.5,
-3.49102, 0, -6.865868, 1, 1.5, 0.5, 0.5,
-3.49102, 0, -6.865868, 0, 1.5, 0.5, 0.5,
-3.49102, 1, -6.865868, 0, -0.5, 0.5, 0.5,
-3.49102, 1, -6.865868, 1, -0.5, 0.5, 0.5,
-3.49102, 1, -6.865868, 1, 1.5, 0.5, 0.5,
-3.49102, 1, -6.865868, 0, 1.5, 0.5, 0.5,
-3.49102, 2, -6.865868, 0, -0.5, 0.5, 0.5,
-3.49102, 2, -6.865868, 1, -0.5, 0.5, 0.5,
-3.49102, 2, -6.865868, 1, 1.5, 0.5, 0.5,
-3.49102, 2, -6.865868, 0, 1.5, 0.5, 0.5
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
-2.999381, -3.057922, -4,
-2.999381, -3.057922, 4,
-2.999381, -3.057922, -4,
-3.163261, -3.205947, -4,
-2.999381, -3.057922, -2,
-3.163261, -3.205947, -2,
-2.999381, -3.057922, 0,
-3.163261, -3.205947, 0,
-2.999381, -3.057922, 2,
-3.163261, -3.205947, 2,
-2.999381, -3.057922, 4,
-3.163261, -3.205947, 4
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
-3.49102, -3.501999, -4, 0, -0.5, 0.5, 0.5,
-3.49102, -3.501999, -4, 1, -0.5, 0.5, 0.5,
-3.49102, -3.501999, -4, 1, 1.5, 0.5, 0.5,
-3.49102, -3.501999, -4, 0, 1.5, 0.5, 0.5,
-3.49102, -3.501999, -2, 0, -0.5, 0.5, 0.5,
-3.49102, -3.501999, -2, 1, -0.5, 0.5, 0.5,
-3.49102, -3.501999, -2, 1, 1.5, 0.5, 0.5,
-3.49102, -3.501999, -2, 0, 1.5, 0.5, 0.5,
-3.49102, -3.501999, 0, 0, -0.5, 0.5, 0.5,
-3.49102, -3.501999, 0, 1, -0.5, 0.5, 0.5,
-3.49102, -3.501999, 0, 1, 1.5, 0.5, 0.5,
-3.49102, -3.501999, 0, 0, 1.5, 0.5, 0.5,
-3.49102, -3.501999, 2, 0, -0.5, 0.5, 0.5,
-3.49102, -3.501999, 2, 1, -0.5, 0.5, 0.5,
-3.49102, -3.501999, 2, 1, 1.5, 0.5, 0.5,
-3.49102, -3.501999, 2, 0, 1.5, 0.5, 0.5,
-3.49102, -3.501999, 4, 0, -0.5, 0.5, 0.5,
-3.49102, -3.501999, 4, 1, -0.5, 0.5, 0.5,
-3.49102, -3.501999, 4, 1, 1.5, 0.5, 0.5,
-3.49102, -3.501999, 4, 0, 1.5, 0.5, 0.5
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
-2.999381, -3.057922, -5.998918,
-2.999381, 2.863105, -5.998918,
-2.999381, -3.057922, 5.56042,
-2.999381, 2.863105, 5.56042,
-2.999381, -3.057922, -5.998918,
-2.999381, -3.057922, 5.56042,
-2.999381, 2.863105, -5.998918,
-2.999381, 2.863105, 5.56042,
-2.999381, -3.057922, -5.998918,
3.555807, -3.057922, -5.998918,
-2.999381, -3.057922, 5.56042,
3.555807, -3.057922, 5.56042,
-2.999381, 2.863105, -5.998918,
3.555807, 2.863105, -5.998918,
-2.999381, 2.863105, 5.56042,
3.555807, 2.863105, 5.56042,
3.555807, -3.057922, -5.998918,
3.555807, 2.863105, -5.998918,
3.555807, -3.057922, 5.56042,
3.555807, 2.863105, 5.56042,
3.555807, -3.057922, -5.998918,
3.555807, -3.057922, 5.56042,
3.555807, 2.863105, -5.998918,
3.555807, 2.863105, 5.56042
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
var radius = 7.768405;
var distance = 34.56251;
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
mvMatrix.translate( -0.2782131, 0.09740853, 0.219249 );
mvMatrix.scale( 1.281329, 1.418563, 0.7266292 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.56251);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
phosphonate<-read.table("phosphonate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-phosphonate$V2
```

```
## Error in eval(expr, envir, enclos): object 'phosphonate' not found
```

```r
y<-phosphonate$V3
```

```
## Error in eval(expr, envir, enclos): object 'phosphonate' not found
```

```r
z<-phosphonate$V4
```

```
## Error in eval(expr, envir, enclos): object 'phosphonate' not found
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
-2.903917, -0.5149378, -2.151788, 0, 0, 1, 1, 1,
-2.800476, -1.327588, -2.17126, 1, 0, 0, 1, 1,
-2.726629, -0.8021089, -2.602876, 1, 0, 0, 1, 1,
-2.679232, 0.858332, -0.01615667, 1, 0, 0, 1, 1,
-2.678964, 1.538965, -1.028868, 1, 0, 0, 1, 1,
-2.547655, -0.867408, -2.166812, 1, 0, 0, 1, 1,
-2.299324, -1.210086, -1.291227, 0, 0, 0, 1, 1,
-2.274554, -0.8681042, -1.846738, 0, 0, 0, 1, 1,
-2.271812, -1.056738, -2.385113, 0, 0, 0, 1, 1,
-2.20911, -0.8410327, -2.66271, 0, 0, 0, 1, 1,
-2.170357, 1.473575, -1.543031, 0, 0, 0, 1, 1,
-2.163326, 0.4086031, -1.260841, 0, 0, 0, 1, 1,
-2.145114, -0.3415618, -1.90928, 0, 0, 0, 1, 1,
-2.137516, -0.7382534, -1.557185, 1, 1, 1, 1, 1,
-2.134364, 0.05920347, -0.885329, 1, 1, 1, 1, 1,
-2.132479, -2.084665, -2.827835, 1, 1, 1, 1, 1,
-2.116323, 0.08606154, -0.7625623, 1, 1, 1, 1, 1,
-2.096879, -1.104853, -2.822183, 1, 1, 1, 1, 1,
-2.093924, -0.3016298, -2.028416, 1, 1, 1, 1, 1,
-2.067251, -0.5522849, -2.133712, 1, 1, 1, 1, 1,
-2.062845, -0.7031552, -2.828156, 1, 1, 1, 1, 1,
-2.000244, 1.8843, -0.8882506, 1, 1, 1, 1, 1,
-1.996906, 1.585588, 1.844702, 1, 1, 1, 1, 1,
-1.97078, -0.1835166, 0.1376662, 1, 1, 1, 1, 1,
-1.960548, -0.5877898, -1.294221, 1, 1, 1, 1, 1,
-1.946288, 0.4472588, -3.446596, 1, 1, 1, 1, 1,
-1.929521, -0.4875029, -1.971225, 1, 1, 1, 1, 1,
-1.91158, -0.4823414, -0.2839478, 1, 1, 1, 1, 1,
-1.907559, -0.3792274, -2.050324, 0, 0, 1, 1, 1,
-1.907271, 1.199245, -1.36862, 1, 0, 0, 1, 1,
-1.903298, -1.111796, -0.9887897, 1, 0, 0, 1, 1,
-1.890619, -0.01413057, -1.854308, 1, 0, 0, 1, 1,
-1.881191, 0.2730182, -1.935475, 1, 0, 0, 1, 1,
-1.86182, 1.848975, -1.372668, 1, 0, 0, 1, 1,
-1.843571, -1.965818, -2.22989, 0, 0, 0, 1, 1,
-1.836106, -0.3966557, -2.675322, 0, 0, 0, 1, 1,
-1.833706, 0.4970088, 0.05644001, 0, 0, 0, 1, 1,
-1.799309, 1.719262, -2.795525, 0, 0, 0, 1, 1,
-1.797028, -0.7711989, -2.839421, 0, 0, 0, 1, 1,
-1.788939, 0.8580344, -3.016334, 0, 0, 0, 1, 1,
-1.772505, -1.611915, -3.551179, 0, 0, 0, 1, 1,
-1.743218, -0.3025985, -1.952857, 1, 1, 1, 1, 1,
-1.737903, -0.2283088, -1.62107, 1, 1, 1, 1, 1,
-1.731335, -0.9254078, -1.193784, 1, 1, 1, 1, 1,
-1.730567, 0.6207349, -0.9581507, 1, 1, 1, 1, 1,
-1.72543, -0.06552676, -1.715048, 1, 1, 1, 1, 1,
-1.721562, -0.9554641, -2.739269, 1, 1, 1, 1, 1,
-1.718514, 0.3374633, -0.428044, 1, 1, 1, 1, 1,
-1.701669, 0.9526186, -0.593286, 1, 1, 1, 1, 1,
-1.693113, 0.4474398, -1.856578, 1, 1, 1, 1, 1,
-1.669875, 0.6925682, -0.5703364, 1, 1, 1, 1, 1,
-1.651768, -2.345717, -2.000312, 1, 1, 1, 1, 1,
-1.632055, 0.5435746, -0.372406, 1, 1, 1, 1, 1,
-1.62662, -0.5033829, -1.34883, 1, 1, 1, 1, 1,
-1.623073, -1.457402, -0.132247, 1, 1, 1, 1, 1,
-1.599381, 1.082193, -3.346158, 1, 1, 1, 1, 1,
-1.598964, 1.432089, -2.742884, 0, 0, 1, 1, 1,
-1.596165, 0.427163, -1.7293, 1, 0, 0, 1, 1,
-1.592006, 1.486851, 0.9276738, 1, 0, 0, 1, 1,
-1.584693, -0.4636683, -2.95282, 1, 0, 0, 1, 1,
-1.584161, 1.247234, -2.561521, 1, 0, 0, 1, 1,
-1.571609, -0.497368, -3.007215, 1, 0, 0, 1, 1,
-1.567009, 0.9994894, -2.712522, 0, 0, 0, 1, 1,
-1.545244, 0.08121502, -1.204812, 0, 0, 0, 1, 1,
-1.534779, 0.9784617, -1.806747, 0, 0, 0, 1, 1,
-1.534054, 2.29589, -0.5152856, 0, 0, 0, 1, 1,
-1.523395, 1.467063, -2.239454, 0, 0, 0, 1, 1,
-1.514198, 0.7147086, -1.327336, 0, 0, 0, 1, 1,
-1.509535, -1.048685, -1.436839, 0, 0, 0, 1, 1,
-1.505754, 0.1257113, -1.274217, 1, 1, 1, 1, 1,
-1.500339, -1.143243, -1.85811, 1, 1, 1, 1, 1,
-1.488502, -0.8639801, -2.123797, 1, 1, 1, 1, 1,
-1.471032, -0.09732714, -1.717525, 1, 1, 1, 1, 1,
-1.464314, -1.646058, -5.031924, 1, 1, 1, 1, 1,
-1.44124, 0.1071857, -0.9117697, 1, 1, 1, 1, 1,
-1.440794, -0.0804205, -1.755576, 1, 1, 1, 1, 1,
-1.440649, 1.282515, -0.2995438, 1, 1, 1, 1, 1,
-1.432616, -0.3218459, -4.696904, 1, 1, 1, 1, 1,
-1.42982, 0.1328816, -1.39376, 1, 1, 1, 1, 1,
-1.426891, -0.02194145, -1.451078, 1, 1, 1, 1, 1,
-1.425207, 0.6242298, -1.499635, 1, 1, 1, 1, 1,
-1.423102, -0.1779467, -2.227318, 1, 1, 1, 1, 1,
-1.409123, -0.9144696, -3.204012, 1, 1, 1, 1, 1,
-1.405108, -0.7093866, 0.6172621, 1, 1, 1, 1, 1,
-1.403037, 0.4267078, -2.29896, 0, 0, 1, 1, 1,
-1.39278, -0.1960734, -3.5082, 1, 0, 0, 1, 1,
-1.383932, -2.109115, -2.502579, 1, 0, 0, 1, 1,
-1.383634, 0.05883213, -2.093302, 1, 0, 0, 1, 1,
-1.360859, 0.4883552, -0.8480717, 1, 0, 0, 1, 1,
-1.359136, -1.024688, -2.681161, 1, 0, 0, 1, 1,
-1.353742, -0.9683751, -2.690007, 0, 0, 0, 1, 1,
-1.351106, -0.4925469, -0.519572, 0, 0, 0, 1, 1,
-1.349576, -0.08135865, -1.655902, 0, 0, 0, 1, 1,
-1.347087, -1.603204, -4.268544, 0, 0, 0, 1, 1,
-1.344405, 1.305922, 1.28458, 0, 0, 0, 1, 1,
-1.343686, -0.4524296, -1.26686, 0, 0, 0, 1, 1,
-1.342269, 0.2387058, -1.529856, 0, 0, 0, 1, 1,
-1.342192, 1.323646, -0.5317566, 1, 1, 1, 1, 1,
-1.34199, -0.6260518, -0.8740197, 1, 1, 1, 1, 1,
-1.334213, -1.800376, -2.076622, 1, 1, 1, 1, 1,
-1.332721, 0.01777619, 0.7858096, 1, 1, 1, 1, 1,
-1.327125, 1.343448, -0.1938335, 1, 1, 1, 1, 1,
-1.325518, 0.5381529, -0.7332393, 1, 1, 1, 1, 1,
-1.317612, 1.058538, -1.940195, 1, 1, 1, 1, 1,
-1.317566, -0.8274087, -2.027035, 1, 1, 1, 1, 1,
-1.314678, 0.7560496, -0.3924667, 1, 1, 1, 1, 1,
-1.310126, -0.403938, -2.199563, 1, 1, 1, 1, 1,
-1.309253, -0.633064, -1.82964, 1, 1, 1, 1, 1,
-1.299013, 0.9325346, -0.6609682, 1, 1, 1, 1, 1,
-1.289352, 0.4683565, -1.643603, 1, 1, 1, 1, 1,
-1.268967, -0.03864469, -2.340719, 1, 1, 1, 1, 1,
-1.262458, 0.4367357, 1.014614, 1, 1, 1, 1, 1,
-1.246367, -0.553165, -0.6356136, 0, 0, 1, 1, 1,
-1.246056, -0.6389429, -3.571246, 1, 0, 0, 1, 1,
-1.244526, -1.567532, -3.774299, 1, 0, 0, 1, 1,
-1.234895, -0.8318764, -2.071845, 1, 0, 0, 1, 1,
-1.234886, 0.8188495, -1.718777, 1, 0, 0, 1, 1,
-1.233815, -0.2802081, -2.099298, 1, 0, 0, 1, 1,
-1.23254, 0.7635296, -0.6019762, 0, 0, 0, 1, 1,
-1.231042, 0.5287337, -2.011822, 0, 0, 0, 1, 1,
-1.230965, -0.3347073, -4.621751, 0, 0, 0, 1, 1,
-1.230441, -0.3535347, -3.261739, 0, 0, 0, 1, 1,
-1.224242, 0.3516742, -1.750181, 0, 0, 0, 1, 1,
-1.222763, 0.8413322, -2.009346, 0, 0, 0, 1, 1,
-1.221403, 0.2612417, -0.2825373, 0, 0, 0, 1, 1,
-1.21786, 1.76329, -1.572001, 1, 1, 1, 1, 1,
-1.216093, 0.9118711, -1.471291, 1, 1, 1, 1, 1,
-1.213158, -0.9152008, -1.960792, 1, 1, 1, 1, 1,
-1.211457, -1.369125, -1.858262, 1, 1, 1, 1, 1,
-1.208745, -0.5274262, -2.311112, 1, 1, 1, 1, 1,
-1.201201, 0.3598728, -0.7335165, 1, 1, 1, 1, 1,
-1.199918, 0.4777523, -0.1155525, 1, 1, 1, 1, 1,
-1.192176, -0.965158, -0.2995035, 1, 1, 1, 1, 1,
-1.190403, 1.785116, -0.6748813, 1, 1, 1, 1, 1,
-1.183784, 0.3467921, -2.867388, 1, 1, 1, 1, 1,
-1.183146, -0.05389076, -3.397332, 1, 1, 1, 1, 1,
-1.183024, 0.153522, -1.301486, 1, 1, 1, 1, 1,
-1.1783, -0.5810169, -3.264467, 1, 1, 1, 1, 1,
-1.173706, 0.7075288, -1.921176, 1, 1, 1, 1, 1,
-1.167815, 0.9964285, -1.947029, 1, 1, 1, 1, 1,
-1.154848, 0.4819192, -1.602761, 0, 0, 1, 1, 1,
-1.154629, 0.3737503, -0.9200673, 1, 0, 0, 1, 1,
-1.150468, 1.031615, -1.426088, 1, 0, 0, 1, 1,
-1.147631, -2.100402, -2.366156, 1, 0, 0, 1, 1,
-1.132845, -0.5341414, -1.556607, 1, 0, 0, 1, 1,
-1.132609, -0.8232114, -3.962147, 1, 0, 0, 1, 1,
-1.129111, 1.071467, 0.8030894, 0, 0, 0, 1, 1,
-1.12604, -1.876088, -2.29789, 0, 0, 0, 1, 1,
-1.122764, -1.327502, -1.174892, 0, 0, 0, 1, 1,
-1.117191, 0.9689353, -2.458536, 0, 0, 0, 1, 1,
-1.116955, -0.5356476, -2.897174, 0, 0, 0, 1, 1,
-1.114546, 0.34517, -3.015213, 0, 0, 0, 1, 1,
-1.106822, -1.153851, -1.522048, 0, 0, 0, 1, 1,
-1.098755, 0.02390044, -1.355059, 1, 1, 1, 1, 1,
-1.095544, -0.07153276, -1.784706, 1, 1, 1, 1, 1,
-1.086539, -0.947503, -2.258951, 1, 1, 1, 1, 1,
-1.084152, 0.4060267, -0.1312912, 1, 1, 1, 1, 1,
-1.083406, -1.025159, -1.262784, 1, 1, 1, 1, 1,
-1.068836, 0.7903277, -1.457706, 1, 1, 1, 1, 1,
-1.064622, 1.502069, -0.3526842, 1, 1, 1, 1, 1,
-1.060556, 0.8636607, -2.077996, 1, 1, 1, 1, 1,
-1.049977, -0.7742118, -0.206028, 1, 1, 1, 1, 1,
-1.043361, 0.05936759, -0.5948134, 1, 1, 1, 1, 1,
-1.024773, -0.4553014, -2.694177, 1, 1, 1, 1, 1,
-1.023518, 0.5550653, 0.2141277, 1, 1, 1, 1, 1,
-1.021443, 1.113128, -1.860577, 1, 1, 1, 1, 1,
-1.019338, 1.189608, -2.517678, 1, 1, 1, 1, 1,
-1.01804, 0.2965593, -1.347817, 1, 1, 1, 1, 1,
-1.016543, 0.118606, -2.717716, 0, 0, 1, 1, 1,
-1.008647, -1.618924, -2.309839, 1, 0, 0, 1, 1,
-0.9940026, -0.9481263, -2.686034, 1, 0, 0, 1, 1,
-0.9931512, 0.4988142, 0.01643735, 1, 0, 0, 1, 1,
-0.9914457, 0.02893393, -2.53394, 1, 0, 0, 1, 1,
-0.9904799, -0.9134158, -1.75593, 1, 0, 0, 1, 1,
-0.9864837, -0.4920002, -2.696717, 0, 0, 0, 1, 1,
-0.9847298, -1.964163, -1.809443, 0, 0, 0, 1, 1,
-0.9821386, -1.815439, -1.705672, 0, 0, 0, 1, 1,
-0.9800519, -0.1242554, -3.274196, 0, 0, 0, 1, 1,
-0.9682691, 0.2468939, -1.92707, 0, 0, 0, 1, 1,
-0.9679374, 0.8363363, -1.219308, 0, 0, 0, 1, 1,
-0.9662325, -1.089798, -3.922593, 0, 0, 0, 1, 1,
-0.9656009, 1.569851, -0.4986519, 1, 1, 1, 1, 1,
-0.9646495, 0.3468601, -0.4057888, 1, 1, 1, 1, 1,
-0.9596086, 1.364899, -0.9300011, 1, 1, 1, 1, 1,
-0.9511795, 0.9858294, -1.758608, 1, 1, 1, 1, 1,
-0.9450926, 0.469906, 0.846808, 1, 1, 1, 1, 1,
-0.9340752, -0.8340803, -1.846169, 1, 1, 1, 1, 1,
-0.9325427, -1.063987, -3.001669, 1, 1, 1, 1, 1,
-0.9325422, 0.328337, -2.906396, 1, 1, 1, 1, 1,
-0.9288448, -0.4399378, -4.668031, 1, 1, 1, 1, 1,
-0.9159024, -0.007077567, -3.989453, 1, 1, 1, 1, 1,
-0.9158314, -0.2329994, -1.135293, 1, 1, 1, 1, 1,
-0.9157025, -0.9382053, -2.589802, 1, 1, 1, 1, 1,
-0.9115444, 0.4480959, -0.9588441, 1, 1, 1, 1, 1,
-0.9114493, -0.1082165, -2.734392, 1, 1, 1, 1, 1,
-0.9094143, 0.2071086, -1.2533, 1, 1, 1, 1, 1,
-0.9071201, 1.06382, -1.264132, 0, 0, 1, 1, 1,
-0.8942468, 0.8205467, -0.7307647, 1, 0, 0, 1, 1,
-0.8917351, 0.812548, -2.205482, 1, 0, 0, 1, 1,
-0.8908086, 0.3188708, 1.892632, 1, 0, 0, 1, 1,
-0.8898638, 1.728046, -0.05683853, 1, 0, 0, 1, 1,
-0.8834972, 1.51032, -0.1425912, 1, 0, 0, 1, 1,
-0.8826415, -0.8303497, -1.750833, 0, 0, 0, 1, 1,
-0.8783299, 1.318751, -0.8011577, 0, 0, 0, 1, 1,
-0.8751052, 0.5570892, -0.4236131, 0, 0, 0, 1, 1,
-0.8719544, -0.9332881, -4.269131, 0, 0, 0, 1, 1,
-0.8717755, 1.780045, -0.5791528, 0, 0, 0, 1, 1,
-0.8698197, -1.664456, -1.529694, 0, 0, 0, 1, 1,
-0.8686181, 0.1052731, -1.826746, 0, 0, 0, 1, 1,
-0.8656942, -0.8522781, -1.056604, 1, 1, 1, 1, 1,
-0.858384, -0.9806421, -1.50587, 1, 1, 1, 1, 1,
-0.8552296, -0.4827927, -0.2644927, 1, 1, 1, 1, 1,
-0.850913, 1.192762, -0.1393779, 1, 1, 1, 1, 1,
-0.8503984, -0.5420399, -2.001496, 1, 1, 1, 1, 1,
-0.8356211, -0.5666258, -1.28131, 1, 1, 1, 1, 1,
-0.8331099, -1.579553, -2.843707, 1, 1, 1, 1, 1,
-0.8321363, 0.9481283, -0.5544822, 1, 1, 1, 1, 1,
-0.8317069, 1.425212, -1.309253, 1, 1, 1, 1, 1,
-0.8287308, -0.369568, -1.350444, 1, 1, 1, 1, 1,
-0.8277151, -1.43265, -1.11094, 1, 1, 1, 1, 1,
-0.8245158, -0.704575, -1.639475, 1, 1, 1, 1, 1,
-0.8232764, -0.4197341, -3.387727, 1, 1, 1, 1, 1,
-0.8228748, -0.7631369, -1.990695, 1, 1, 1, 1, 1,
-0.8168001, -0.4483861, -3.28441, 1, 1, 1, 1, 1,
-0.8154625, -0.07682505, -0.8284557, 0, 0, 1, 1, 1,
-0.8133947, -0.4324888, -0.6750994, 1, 0, 0, 1, 1,
-0.8100862, 0.1137282, 0.3310049, 1, 0, 0, 1, 1,
-0.8065093, 0.1066508, -0.8542662, 1, 0, 0, 1, 1,
-0.8044688, 0.5801796, -0.7653656, 1, 0, 0, 1, 1,
-0.8035699, -1.16071, -1.527254, 1, 0, 0, 1, 1,
-0.8011272, 0.2663491, -1.43161, 0, 0, 0, 1, 1,
-0.7991031, 0.2531738, -1.691727, 0, 0, 0, 1, 1,
-0.7909098, 0.4584889, -0.7551636, 0, 0, 0, 1, 1,
-0.7877999, -0.2022721, -3.969025, 0, 0, 0, 1, 1,
-0.7826215, -0.06887397, -0.5991125, 0, 0, 0, 1, 1,
-0.7786801, -0.8016661, -3.089422, 0, 0, 0, 1, 1,
-0.7759477, -0.3299426, -1.053489, 0, 0, 0, 1, 1,
-0.7754276, 1.161677, -1.39581, 1, 1, 1, 1, 1,
-0.7748353, -1.342076, -2.653452, 1, 1, 1, 1, 1,
-0.7636024, -0.6249909, -2.349739, 1, 1, 1, 1, 1,
-0.762332, 2.073622, -0.7979757, 1, 1, 1, 1, 1,
-0.7614912, -0.8770267, -1.683533, 1, 1, 1, 1, 1,
-0.7582058, 0.8590285, -1.093394, 1, 1, 1, 1, 1,
-0.7503764, -0.3009872, -0.97755, 1, 1, 1, 1, 1,
-0.7493661, -0.652753, -1.761, 1, 1, 1, 1, 1,
-0.748687, -1.605688, -2.710898, 1, 1, 1, 1, 1,
-0.7476104, -0.5354013, -2.356863, 1, 1, 1, 1, 1,
-0.7473747, 0.2535588, -2.642269, 1, 1, 1, 1, 1,
-0.7439106, -0.5817981, -1.234967, 1, 1, 1, 1, 1,
-0.7425424, 1.796447, -1.208238, 1, 1, 1, 1, 1,
-0.7401518, -2.130992, -2.554214, 1, 1, 1, 1, 1,
-0.7398677, -1.109656, -2.516744, 1, 1, 1, 1, 1,
-0.7396634, 0.5347511, 0.5504805, 0, 0, 1, 1, 1,
-0.7300439, -1.993516, -4.771435, 1, 0, 0, 1, 1,
-0.7298119, 1.192478, 1.519592, 1, 0, 0, 1, 1,
-0.7296684, -1.204394, -2.604553, 1, 0, 0, 1, 1,
-0.7288651, -0.8099784, -3.242184, 1, 0, 0, 1, 1,
-0.7276307, -0.8376659, -1.198917, 1, 0, 0, 1, 1,
-0.7275817, 0.8030089, -0.2467156, 0, 0, 0, 1, 1,
-0.7238856, -0.3910728, -3.731521, 0, 0, 0, 1, 1,
-0.7143015, 0.07993064, -2.574425, 0, 0, 0, 1, 1,
-0.714147, 0.09520616, -2.595234, 0, 0, 0, 1, 1,
-0.7124555, -0.6413316, -1.311353, 0, 0, 0, 1, 1,
-0.7075179, 0.3509064, 0.07613783, 0, 0, 0, 1, 1,
-0.7046603, -1.28533, -0.9675449, 0, 0, 0, 1, 1,
-0.7016561, 1.203964, -1.816741, 1, 1, 1, 1, 1,
-0.6966972, -1.631792, -1.050243, 1, 1, 1, 1, 1,
-0.6949769, 0.1609063, -1.448291, 1, 1, 1, 1, 1,
-0.6888982, -1.907104, -3.2877, 1, 1, 1, 1, 1,
-0.6881449, 1.365608, -0.02384733, 1, 1, 1, 1, 1,
-0.6871517, 1.5273, -0.08327533, 1, 1, 1, 1, 1,
-0.6868173, 0.2653794, -0.2487076, 1, 1, 1, 1, 1,
-0.6847479, -0.5558602, -2.048728, 1, 1, 1, 1, 1,
-0.6751882, 0.6676114, -1.882869, 1, 1, 1, 1, 1,
-0.6737052, -0.8606774, -3.536149, 1, 1, 1, 1, 1,
-0.673353, -0.8744544, -1.463344, 1, 1, 1, 1, 1,
-0.6690778, -0.4531433, -2.795187, 1, 1, 1, 1, 1,
-0.6673419, 0.5648367, -1.563988, 1, 1, 1, 1, 1,
-0.6662241, 0.05907346, -0.680626, 1, 1, 1, 1, 1,
-0.6646748, 1.376687, 0.1819261, 1, 1, 1, 1, 1,
-0.6646001, -0.2138384, -3.356716, 0, 0, 1, 1, 1,
-0.6620449, -0.6038545, -2.951038, 1, 0, 0, 1, 1,
-0.6618567, -0.6389059, -1.484502, 1, 0, 0, 1, 1,
-0.6561453, 0.3521978, -1.324237, 1, 0, 0, 1, 1,
-0.6470876, 0.589086, -2.002166, 1, 0, 0, 1, 1,
-0.6444389, 0.6137981, -0.3941106, 1, 0, 0, 1, 1,
-0.6422294, -0.8694438, -2.336041, 0, 0, 0, 1, 1,
-0.6372384, 1.290767, -2.290111, 0, 0, 0, 1, 1,
-0.6366115, -0.780879, -2.347111, 0, 0, 0, 1, 1,
-0.6365377, 0.359385, -1.387996, 0, 0, 0, 1, 1,
-0.6345178, 2.039361, 0.6152699, 0, 0, 0, 1, 1,
-0.6331372, 1.665088, 0.5962629, 0, 0, 0, 1, 1,
-0.6254486, -0.6774302, -1.997257, 0, 0, 0, 1, 1,
-0.6240472, 0.6964172, 0.1517352, 1, 1, 1, 1, 1,
-0.6214009, 0.6056179, -1.544708, 1, 1, 1, 1, 1,
-0.6176906, -0.01087624, -3.52465, 1, 1, 1, 1, 1,
-0.6132859, 0.3597381, -2.995933, 1, 1, 1, 1, 1,
-0.6075632, -1.361171, -2.989715, 1, 1, 1, 1, 1,
-0.6002989, -0.8709995, -1.654264, 1, 1, 1, 1, 1,
-0.5970971, -0.857555, -2.017109, 1, 1, 1, 1, 1,
-0.5964237, 0.7562488, 0.8960393, 1, 1, 1, 1, 1,
-0.5960097, -0.7771116, -2.850263, 1, 1, 1, 1, 1,
-0.5936376, -0.3449554, -2.838822, 1, 1, 1, 1, 1,
-0.5917211, -1.135906, -1.309635, 1, 1, 1, 1, 1,
-0.5890017, 0.1213029, -0.3555681, 1, 1, 1, 1, 1,
-0.5853602, -0.7521347, -3.369933, 1, 1, 1, 1, 1,
-0.5811492, 0.1941697, -0.3096566, 1, 1, 1, 1, 1,
-0.5801038, 0.03023627, 0.06496775, 1, 1, 1, 1, 1,
-0.5792673, 1.503189, -1.338265, 0, 0, 1, 1, 1,
-0.5747122, -0.5940903, -3.105732, 1, 0, 0, 1, 1,
-0.5741056, 0.3208785, -1.578894, 1, 0, 0, 1, 1,
-0.5704173, -0.3554372, -0.7665287, 1, 0, 0, 1, 1,
-0.5674513, 0.2783087, -2.66087, 1, 0, 0, 1, 1,
-0.5657164, 0.6526785, 0.9616289, 1, 0, 0, 1, 1,
-0.5649012, 1.404769, -0.4257607, 0, 0, 0, 1, 1,
-0.564428, 1.680287, 1.035002, 0, 0, 0, 1, 1,
-0.555939, 0.6014971, 0.2351291, 0, 0, 0, 1, 1,
-0.5532115, -1.900567, -2.827957, 0, 0, 0, 1, 1,
-0.5514241, -1.129284, -3.762628, 0, 0, 0, 1, 1,
-0.5500138, -1.603954, -0.951759, 0, 0, 0, 1, 1,
-0.5472589, 1.280128, 0.3339502, 0, 0, 0, 1, 1,
-0.5461259, 0.7173766, -1.692459, 1, 1, 1, 1, 1,
-0.5442268, -1.036024, -2.239476, 1, 1, 1, 1, 1,
-0.5356976, -0.4480043, -1.854363, 1, 1, 1, 1, 1,
-0.5331451, 0.0880875, -1.302958, 1, 1, 1, 1, 1,
-0.5211474, -0.7213657, -2.748627, 1, 1, 1, 1, 1,
-0.5205756, -0.4372453, -2.220135, 1, 1, 1, 1, 1,
-0.5186947, 0.5196726, -1.028963, 1, 1, 1, 1, 1,
-0.5167816, 0.8518951, -2.213888, 1, 1, 1, 1, 1,
-0.5070673, -0.1892882, -2.52873, 1, 1, 1, 1, 1,
-0.5065756, 0.07958379, -3.073491, 1, 1, 1, 1, 1,
-0.5058469, 0.4404306, 1.584786, 1, 1, 1, 1, 1,
-0.5024028, 0.1378315, -0.02735021, 1, 1, 1, 1, 1,
-0.5018852, 0.3026596, -1.074954, 1, 1, 1, 1, 1,
-0.4823437, 0.9688014, 0.4707166, 1, 1, 1, 1, 1,
-0.4743647, -1.563374, -0.6609609, 1, 1, 1, 1, 1,
-0.4718882, -1.36249, -2.455009, 0, 0, 1, 1, 1,
-0.4698035, -1.659505, -4.431757, 1, 0, 0, 1, 1,
-0.4678484, 1.25406, -1.362357, 1, 0, 0, 1, 1,
-0.4662999, 0.2159948, -2.086599, 1, 0, 0, 1, 1,
-0.4659668, 0.1372315, -2.300895, 1, 0, 0, 1, 1,
-0.4616137, -2.084042, -2.786243, 1, 0, 0, 1, 1,
-0.4612564, -0.646858, -2.223091, 0, 0, 0, 1, 1,
-0.4573581, 0.2968951, -1.607662, 0, 0, 0, 1, 1,
-0.4560195, -0.5406294, -1.602097, 0, 0, 0, 1, 1,
-0.4452706, -0.6865881, -0.4772955, 0, 0, 0, 1, 1,
-0.4449334, -0.2258226, -3.534168, 0, 0, 0, 1, 1,
-0.4439579, 0.876964, -0.1756465, 0, 0, 0, 1, 1,
-0.4428583, -1.307677, -3.53671, 0, 0, 0, 1, 1,
-0.441874, 2.240143, 0.6501891, 1, 1, 1, 1, 1,
-0.4405465, 0.7629074, -0.6054612, 1, 1, 1, 1, 1,
-0.4401362, -0.01186005, -1.261614, 1, 1, 1, 1, 1,
-0.4401186, -0.06640039, -3.099832, 1, 1, 1, 1, 1,
-0.4386559, -1.354684, -3.216851, 1, 1, 1, 1, 1,
-0.4369355, 2.776876, -0.9756459, 1, 1, 1, 1, 1,
-0.436566, -0.3209469, -2.483103, 1, 1, 1, 1, 1,
-0.4363646, 0.2287681, -0.494658, 1, 1, 1, 1, 1,
-0.4336103, -0.259936, -1.476616, 1, 1, 1, 1, 1,
-0.4319405, -1.244934, -1.492514, 1, 1, 1, 1, 1,
-0.4305694, -0.7802166, -3.0753, 1, 1, 1, 1, 1,
-0.4286483, 0.4344163, -1.385687, 1, 1, 1, 1, 1,
-0.4242295, 0.6328231, -0.3335461, 1, 1, 1, 1, 1,
-0.4235252, -0.4638765, -2.005296, 1, 1, 1, 1, 1,
-0.4209662, 1.440093, -0.9065105, 1, 1, 1, 1, 1,
-0.4208668, 1.08814, -1.02407, 0, 0, 1, 1, 1,
-0.4169994, 0.5688187, 0.08271294, 1, 0, 0, 1, 1,
-0.4156715, -0.9532791, -2.690412, 1, 0, 0, 1, 1,
-0.4145589, -1.147431, -2.401063, 1, 0, 0, 1, 1,
-0.4099436, -0.6661158, -1.74654, 1, 0, 0, 1, 1,
-0.4092214, 0.1297072, -2.241402, 1, 0, 0, 1, 1,
-0.4084245, -0.2275444, -2.632031, 0, 0, 0, 1, 1,
-0.4042327, -0.7172927, -1.132649, 0, 0, 0, 1, 1,
-0.4039379, -0.3454395, -0.306047, 0, 0, 0, 1, 1,
-0.4022222, -0.1471948, -3.337855, 0, 0, 0, 1, 1,
-0.4007086, -0.4968742, -2.854773, 0, 0, 0, 1, 1,
-0.3972825, -0.5381856, -4.447505, 0, 0, 0, 1, 1,
-0.3972332, -0.6248759, -2.082623, 0, 0, 0, 1, 1,
-0.3965054, 0.5003937, 1.252173, 1, 1, 1, 1, 1,
-0.3948424, -0.3347427, -2.033058, 1, 1, 1, 1, 1,
-0.3942765, 0.8212811, -0.6852849, 1, 1, 1, 1, 1,
-0.3899548, -0.6050957, -3.871877, 1, 1, 1, 1, 1,
-0.3892873, -0.4627835, -2.108458, 1, 1, 1, 1, 1,
-0.3806673, 0.1643262, 0.07733737, 1, 1, 1, 1, 1,
-0.3803219, 1.461343, 0.6559607, 1, 1, 1, 1, 1,
-0.3798495, -0.2384618, -2.511699, 1, 1, 1, 1, 1,
-0.3733151, 2.385802, -1.184551, 1, 1, 1, 1, 1,
-0.367872, -1.27309, -2.620936, 1, 1, 1, 1, 1,
-0.3645451, 0.3611818, -0.8249143, 1, 1, 1, 1, 1,
-0.3608837, 0.0337836, -1.539008, 1, 1, 1, 1, 1,
-0.3571463, -1.039306, -3.072509, 1, 1, 1, 1, 1,
-0.3546654, -0.06401941, 1.32904, 1, 1, 1, 1, 1,
-0.3546606, 0.00631767, -1.896009, 1, 1, 1, 1, 1,
-0.3511315, -0.6782088, -1.66509, 0, 0, 1, 1, 1,
-0.3495799, 1.303743, -1.061647, 1, 0, 0, 1, 1,
-0.3381471, -0.07674572, -0.9922912, 1, 0, 0, 1, 1,
-0.3364244, 1.652816, -0.6052476, 1, 0, 0, 1, 1,
-0.3349622, -0.6712766, -1.615904, 1, 0, 0, 1, 1,
-0.3336017, 2.214153, -1.497873, 1, 0, 0, 1, 1,
-0.3328687, 0.0398034, -1.961477, 0, 0, 0, 1, 1,
-0.3321601, -0.3122769, -1.7767, 0, 0, 0, 1, 1,
-0.3311004, -0.4194885, -2.449753, 0, 0, 0, 1, 1,
-0.3232101, 0.01658251, -1.844013, 0, 0, 0, 1, 1,
-0.3211996, 0.3023627, -1.523182, 0, 0, 0, 1, 1,
-0.3169872, -0.5079306, -1.208331, 0, 0, 0, 1, 1,
-0.315723, -0.3518103, -2.206603, 0, 0, 0, 1, 1,
-0.31241, 1.917422, -0.730747, 1, 1, 1, 1, 1,
-0.311316, -0.7093767, -2.478642, 1, 1, 1, 1, 1,
-0.3108887, -1.583244, -1.779341, 1, 1, 1, 1, 1,
-0.3095044, 0.9899583, -1.229498, 1, 1, 1, 1, 1,
-0.3084162, 0.1064856, -1.264042, 1, 1, 1, 1, 1,
-0.3001448, 0.5735795, -1.852192, 1, 1, 1, 1, 1,
-0.2964317, -1.631925, -2.403749, 1, 1, 1, 1, 1,
-0.2925592, 1.476565, -0.2630577, 1, 1, 1, 1, 1,
-0.2914427, 1.425921, -0.3338696, 1, 1, 1, 1, 1,
-0.2896592, 1.22551, -0.6572435, 1, 1, 1, 1, 1,
-0.2857119, -0.6475444, -3.358131, 1, 1, 1, 1, 1,
-0.2842898, 0.05741984, -1.55984, 1, 1, 1, 1, 1,
-0.284269, 2.088287, 0.8930637, 1, 1, 1, 1, 1,
-0.2813643, 0.2792324, -0.316129, 1, 1, 1, 1, 1,
-0.2811586, -0.5755985, -2.957402, 1, 1, 1, 1, 1,
-0.2765604, 0.7533564, -0.7661288, 0, 0, 1, 1, 1,
-0.2735161, -0.4658279, -1.969348, 1, 0, 0, 1, 1,
-0.2690968, -0.09571332, -0.9005372, 1, 0, 0, 1, 1,
-0.2643537, -0.006105799, -1.976383, 1, 0, 0, 1, 1,
-0.2634432, -0.3298591, -3.211207, 1, 0, 0, 1, 1,
-0.2602976, 0.6212571, -1.165152, 1, 0, 0, 1, 1,
-0.2588777, -0.02346439, -0.1372807, 0, 0, 0, 1, 1,
-0.2581539, -1.660929, -4.577373, 0, 0, 0, 1, 1,
-0.2559257, 0.2896006, -1.870692, 0, 0, 0, 1, 1,
-0.2523311, -0.3623976, -1.089324, 0, 0, 0, 1, 1,
-0.2452745, -0.5080043, -4.359981, 0, 0, 0, 1, 1,
-0.2422108, -0.03953879, -2.63627, 0, 0, 0, 1, 1,
-0.23914, -1.631225, -3.147617, 0, 0, 0, 1, 1,
-0.2389786, 0.006352577, -0.6310306, 1, 1, 1, 1, 1,
-0.2364706, 0.06195458, -0.3989516, 1, 1, 1, 1, 1,
-0.2306977, 1.082005, 1.879837, 1, 1, 1, 1, 1,
-0.2303222, 1.22025, -1.948389, 1, 1, 1, 1, 1,
-0.2245063, -0.3942416, -3.078337, 1, 1, 1, 1, 1,
-0.2237771, -1.338377, -5.151199, 1, 1, 1, 1, 1,
-0.2227648, 0.3332047, 0.4934261, 1, 1, 1, 1, 1,
-0.2218955, -0.1209282, -2.299519, 1, 1, 1, 1, 1,
-0.2138149, -1.411363, -2.336555, 1, 1, 1, 1, 1,
-0.2127946, -2.827101, -3.930835, 1, 1, 1, 1, 1,
-0.2107293, 0.747897, 1.193378, 1, 1, 1, 1, 1,
-0.2084763, -1.840011, -4.150951, 1, 1, 1, 1, 1,
-0.2035693, -0.677728, -1.364828, 1, 1, 1, 1, 1,
-0.2025268, -0.4095949, -2.624535, 1, 1, 1, 1, 1,
-0.1994763, 2.037834, -0.4850774, 1, 1, 1, 1, 1,
-0.1941192, -0.217281, -0.4965821, 0, 0, 1, 1, 1,
-0.1912577, -0.3965888, -1.806131, 1, 0, 0, 1, 1,
-0.1872123, -1.217086, -2.420052, 1, 0, 0, 1, 1,
-0.1866119, 0.9676772, 0.7662444, 1, 0, 0, 1, 1,
-0.1798159, 1.019372, 1.29713, 1, 0, 0, 1, 1,
-0.1796305, -0.8153027, -3.515978, 1, 0, 0, 1, 1,
-0.1741856, -0.7359453, -5.087474, 0, 0, 0, 1, 1,
-0.1735244, -0.7086452, -1.823256, 0, 0, 0, 1, 1,
-0.1731683, -0.2358652, -2.237889, 0, 0, 0, 1, 1,
-0.1710322, -1.735919, -4.47889, 0, 0, 0, 1, 1,
-0.1708907, 2.454365, 0.8188914, 0, 0, 0, 1, 1,
-0.1669369, 0.5266361, -1.6314, 0, 0, 0, 1, 1,
-0.163219, -1.540947, -3.952516, 0, 0, 0, 1, 1,
-0.1588768, -0.09605265, -0.4690697, 1, 1, 1, 1, 1,
-0.1582175, -0.8641054, -3.780489, 1, 1, 1, 1, 1,
-0.1557218, 0.6484071, 1.613457, 1, 1, 1, 1, 1,
-0.1556458, 1.125574, 1.096009, 1, 1, 1, 1, 1,
-0.1527444, 1.221996, 0.1722309, 1, 1, 1, 1, 1,
-0.1524809, -0.3174751, -4.008913, 1, 1, 1, 1, 1,
-0.146664, 1.331866, 1.22041, 1, 1, 1, 1, 1,
-0.129318, 1.390375, 0.3359568, 1, 1, 1, 1, 1,
-0.1292072, -0.009007231, -1.155552, 1, 1, 1, 1, 1,
-0.1234873, 1.777869, 0.06743167, 1, 1, 1, 1, 1,
-0.1230378, 1.048341, 1.358918, 1, 1, 1, 1, 1,
-0.1218652, 1.185935, -0.3938532, 1, 1, 1, 1, 1,
-0.119283, 0.1130133, -0.3691793, 1, 1, 1, 1, 1,
-0.1186488, 0.7351784, -0.3802186, 1, 1, 1, 1, 1,
-0.1180841, 0.8210534, -1.757752, 1, 1, 1, 1, 1,
-0.1179472, 1.443415, -0.08679242, 0, 0, 1, 1, 1,
-0.1149301, 0.5422292, 1.162204, 1, 0, 0, 1, 1,
-0.1141663, -1.133279, -2.174045, 1, 0, 0, 1, 1,
-0.1119712, -0.6173452, -2.703532, 1, 0, 0, 1, 1,
-0.1094625, 0.1589395, -0.3019683, 1, 0, 0, 1, 1,
-0.109435, 0.6720751, -0.006733309, 1, 0, 0, 1, 1,
-0.1036293, 1.133411, -1.354047, 0, 0, 0, 1, 1,
-0.1020148, 2.448949, 0.02480699, 0, 0, 0, 1, 1,
-0.1019775, 1.668981, -0.6972836, 0, 0, 0, 1, 1,
-0.09907345, 0.4920551, -1.211952, 0, 0, 0, 1, 1,
-0.09483677, -0.3372861, -2.607854, 0, 0, 0, 1, 1,
-0.09396843, 0.1396566, 1.145775, 0, 0, 0, 1, 1,
-0.09380924, -1.417055, -3.770121, 0, 0, 0, 1, 1,
-0.09355899, -0.3323959, -0.6379034, 1, 1, 1, 1, 1,
-0.09290975, -1.640965, -2.781022, 1, 1, 1, 1, 1,
-0.09028107, -1.148803, -2.371204, 1, 1, 1, 1, 1,
-0.08944919, -0.7567305, -2.962609, 1, 1, 1, 1, 1,
-0.08871569, -2.409831, -1.426661, 1, 1, 1, 1, 1,
-0.08627352, -2.971693, -5.830578, 1, 1, 1, 1, 1,
-0.0839265, 0.9664994, 0.2550425, 1, 1, 1, 1, 1,
-0.0798132, 1.606962, -0.6210614, 1, 1, 1, 1, 1,
-0.07815457, -2.215682, -2.349702, 1, 1, 1, 1, 1,
-0.07355651, -1.449071, -3.059095, 1, 1, 1, 1, 1,
-0.07329998, -0.2707223, -3.72588, 1, 1, 1, 1, 1,
-0.06994337, 0.1157023, 0.3576963, 1, 1, 1, 1, 1,
-0.06943734, 0.9359536, 1.249513, 1, 1, 1, 1, 1,
-0.06622415, 0.5340179, -0.3008494, 1, 1, 1, 1, 1,
-0.06284825, -0.2783785, -3.879675, 1, 1, 1, 1, 1,
-0.06132996, -2.124444, -3.927184, 0, 0, 1, 1, 1,
-0.06076338, 0.6864105, -0.3041875, 1, 0, 0, 1, 1,
-0.06042667, -0.2329437, -2.556193, 1, 0, 0, 1, 1,
-0.05540352, 0.138965, -0.2347009, 1, 0, 0, 1, 1,
-0.05535875, -0.7238129, -2.291415, 1, 0, 0, 1, 1,
-0.05386231, 1.535975, -0.0257299, 1, 0, 0, 1, 1,
-0.05243483, 0.822715, 0.08487432, 0, 0, 0, 1, 1,
-0.05216915, 0.7943032, -0.2886369, 0, 0, 0, 1, 1,
-0.052087, 0.02505976, -1.080253, 0, 0, 0, 1, 1,
-0.04896554, -0.8577003, -0.5483952, 0, 0, 0, 1, 1,
-0.0442907, -0.07427295, -1.770112, 0, 0, 0, 1, 1,
-0.04030857, -0.03124953, -3.146637, 0, 0, 0, 1, 1,
-0.0369335, -0.51805, -2.264174, 0, 0, 0, 1, 1,
-0.03588836, 1.170501, 0.9037862, 1, 1, 1, 1, 1,
-0.03113032, -0.07123497, -2.789602, 1, 1, 1, 1, 1,
-0.02388745, -0.2059716, -2.55467, 1, 1, 1, 1, 1,
-0.02329304, 0.3883612, 1.060316, 1, 1, 1, 1, 1,
-0.02084794, -1.879869, -5.186858, 1, 1, 1, 1, 1,
-0.01872401, -0.04084592, -1.896537, 1, 1, 1, 1, 1,
-0.0150625, -0.4231465, -3.392182, 1, 1, 1, 1, 1,
-0.01504353, 1.135578, 0.1231171, 1, 1, 1, 1, 1,
-0.01486063, 0.03100301, -1.195731, 1, 1, 1, 1, 1,
-0.01192154, -1.319616, -4.564154, 1, 1, 1, 1, 1,
-0.01148633, 0.738351, -1.300847, 1, 1, 1, 1, 1,
-0.002018257, 0.05067334, -2.101458, 1, 1, 1, 1, 1,
-0.001310425, -0.4821059, -2.66112, 1, 1, 1, 1, 1,
0.001234736, 0.1113658, -0.7954267, 1, 1, 1, 1, 1,
0.003067479, -0.6175247, 2.519619, 1, 1, 1, 1, 1,
0.01022673, 1.918424, -1.423722, 0, 0, 1, 1, 1,
0.01426368, 1.508227, -0.7911268, 1, 0, 0, 1, 1,
0.01897055, 0.4550753, 0.8044541, 1, 0, 0, 1, 1,
0.0203886, 0.7952482, -0.3518125, 1, 0, 0, 1, 1,
0.02496974, 0.9162399, 0.745868, 1, 0, 0, 1, 1,
0.02551088, -0.5412194, 3.681106, 1, 0, 0, 1, 1,
0.02594617, -1.210649, 2.207577, 0, 0, 0, 1, 1,
0.03229281, 0.1009014, 0.302131, 0, 0, 0, 1, 1,
0.03940505, 0.3069479, 0.4737606, 0, 0, 0, 1, 1,
0.03959797, 1.380188, 1.452011, 0, 0, 0, 1, 1,
0.04096471, 0.1201714, -0.1476275, 0, 0, 0, 1, 1,
0.04109508, 0.6155515, -1.928614, 0, 0, 0, 1, 1,
0.04427157, 1.492663, 0.6634709, 0, 0, 0, 1, 1,
0.04463129, -0.686753, 2.781452, 1, 1, 1, 1, 1,
0.0539403, -0.02874543, 1.121348, 1, 1, 1, 1, 1,
0.05920158, 2.043694, 1.19322, 1, 1, 1, 1, 1,
0.0611089, -0.4750205, 0.08248715, 1, 1, 1, 1, 1,
0.06224093, 0.1692683, -0.7604727, 1, 1, 1, 1, 1,
0.06488456, -0.08792453, 3.288172, 1, 1, 1, 1, 1,
0.0704462, 1.313477, -1.891671, 1, 1, 1, 1, 1,
0.07356296, -0.3303497, 3.67188, 1, 1, 1, 1, 1,
0.07438816, 0.8137155, 0.5460981, 1, 1, 1, 1, 1,
0.07455353, -0.5205869, 2.467796, 1, 1, 1, 1, 1,
0.07608086, -1.933104, 3.16609, 1, 1, 1, 1, 1,
0.07695973, 0.7187449, 1.149481, 1, 1, 1, 1, 1,
0.07855901, 0.2393284, 0.9597749, 1, 1, 1, 1, 1,
0.08458292, -0.7220412, 1.90981, 1, 1, 1, 1, 1,
0.08710744, 1.020238, -0.1019432, 1, 1, 1, 1, 1,
0.08777055, -1.88768, 2.850487, 0, 0, 1, 1, 1,
0.09317109, 1.201627, -0.4287911, 1, 0, 0, 1, 1,
0.09566478, -0.2004343, 2.527065, 1, 0, 0, 1, 1,
0.09667877, 0.5753617, 0.5777348, 1, 0, 0, 1, 1,
0.106529, -0.8628832, 0.7254773, 1, 0, 0, 1, 1,
0.1087871, 0.2139196, 0.4465855, 1, 0, 0, 1, 1,
0.1112841, -0.8209149, 2.048278, 0, 0, 0, 1, 1,
0.1213067, -2.23519, 4.871121, 0, 0, 0, 1, 1,
0.1230956, -1.311101, 2.974173, 0, 0, 0, 1, 1,
0.1286303, -0.003843444, 0.3872754, 0, 0, 0, 1, 1,
0.1290319, -1.072529, 2.791874, 0, 0, 0, 1, 1,
0.1310277, 1.103304, -1.006031, 0, 0, 0, 1, 1,
0.1366173, 0.5855314, -0.1496192, 0, 0, 0, 1, 1,
0.1371496, -0.2794404, 0.3552068, 1, 1, 1, 1, 1,
0.143425, -1.479839, 2.176482, 1, 1, 1, 1, 1,
0.1481032, 1.710581, -0.2049962, 1, 1, 1, 1, 1,
0.153533, 1.665993, -1.412457, 1, 1, 1, 1, 1,
0.1576418, -0.2985418, 2.236095, 1, 1, 1, 1, 1,
0.1601734, 0.1930919, 0.2484927, 1, 1, 1, 1, 1,
0.1616042, 2.035365, 0.03755007, 1, 1, 1, 1, 1,
0.1641375, 1.0433, -1.288049, 1, 1, 1, 1, 1,
0.1678881, -2.622862, 3.257305, 1, 1, 1, 1, 1,
0.1692351, 1.506045, 0.3169857, 1, 1, 1, 1, 1,
0.1697052, -1.283962, 2.356425, 1, 1, 1, 1, 1,
0.1752389, 0.6735016, 2.370238, 1, 1, 1, 1, 1,
0.1782559, 0.5485596, -0.4895123, 1, 1, 1, 1, 1,
0.1868455, -0.1693894, 2.403539, 1, 1, 1, 1, 1,
0.1927004, 0.5668785, -0.8543416, 1, 1, 1, 1, 1,
0.1942361, 1.987911, 0.5714411, 0, 0, 1, 1, 1,
0.2030369, -1.444045, 3.613129, 1, 0, 0, 1, 1,
0.2048784, 0.8139912, 0.3182661, 1, 0, 0, 1, 1,
0.2097243, 0.8939995, 2.122545, 1, 0, 0, 1, 1,
0.2204011, -0.6489475, 2.453464, 1, 0, 0, 1, 1,
0.2227489, -0.829946, 2.98542, 1, 0, 0, 1, 1,
0.2302305, 1.708675, 1.033827, 0, 0, 0, 1, 1,
0.2340322, 2.065392, 0.9624711, 0, 0, 0, 1, 1,
0.2356355, 1.82443, -0.8664021, 0, 0, 0, 1, 1,
0.2383161, -0.9148241, 2.742949, 0, 0, 0, 1, 1,
0.2415985, 0.2348444, 1.076231, 0, 0, 0, 1, 1,
0.2428758, 0.1923034, 2.858124, 0, 0, 0, 1, 1,
0.2431322, -1.313899, 4.185348, 0, 0, 0, 1, 1,
0.2461133, -0.9817563, 3.975576, 1, 1, 1, 1, 1,
0.2461343, -0.1388811, 3.278631, 1, 1, 1, 1, 1,
0.2467891, -0.8680893, 3.71113, 1, 1, 1, 1, 1,
0.2554868, -1.786018, 4.157084, 1, 1, 1, 1, 1,
0.2560963, -0.688448, 3.005685, 1, 1, 1, 1, 1,
0.2588109, 0.02419026, 2.053041, 1, 1, 1, 1, 1,
0.2600922, 0.05575749, 2.61937, 1, 1, 1, 1, 1,
0.2636417, 0.3150352, 1.535277, 1, 1, 1, 1, 1,
0.2643667, 0.6673865, 1.009961, 1, 1, 1, 1, 1,
0.266145, 1.515097, -0.30688, 1, 1, 1, 1, 1,
0.2671544, 0.3935581, 1.312622, 1, 1, 1, 1, 1,
0.2681677, 0.7495306, -0.2390342, 1, 1, 1, 1, 1,
0.2693674, 1.184211, -0.1659243, 1, 1, 1, 1, 1,
0.2694672, 0.1019645, 0.2938478, 1, 1, 1, 1, 1,
0.2745458, -0.6564416, 2.655404, 1, 1, 1, 1, 1,
0.2755599, 0.5165332, -1.61117, 0, 0, 1, 1, 1,
0.2785961, 0.553089, -1.625823, 1, 0, 0, 1, 1,
0.2789944, 0.1540335, -0.3931298, 1, 0, 0, 1, 1,
0.281698, -0.876204, 1.811947, 1, 0, 0, 1, 1,
0.2844342, -0.9194568, 2.594405, 1, 0, 0, 1, 1,
0.2866066, -0.7694245, 3.167188, 1, 0, 0, 1, 1,
0.2872288, -0.8394868, 3.943732, 0, 0, 0, 1, 1,
0.2905165, 0.3394633, 0.07360143, 0, 0, 0, 1, 1,
0.2934117, -0.6572082, 3.485129, 0, 0, 0, 1, 1,
0.2965598, -0.324364, 0.6526284, 0, 0, 0, 1, 1,
0.2981406, -1.314386, 3.647872, 0, 0, 0, 1, 1,
0.2990887, -0.8410794, 2.497087, 0, 0, 0, 1, 1,
0.3034007, -1.634134, 2.965786, 0, 0, 0, 1, 1,
0.304824, 0.09967885, 0.3793059, 1, 1, 1, 1, 1,
0.3104717, -0.3710659, 1.627124, 1, 1, 1, 1, 1,
0.3132575, -2.014121, 5.007755, 1, 1, 1, 1, 1,
0.3185219, 0.3200571, 0.4097932, 1, 1, 1, 1, 1,
0.3272308, -0.5556685, 3.078664, 1, 1, 1, 1, 1,
0.3295211, 0.9687957, 0.901135, 1, 1, 1, 1, 1,
0.3328093, 0.7151983, 1.366739, 1, 1, 1, 1, 1,
0.3375805, -0.1342648, 3.292749, 1, 1, 1, 1, 1,
0.3502494, 1.896684, -0.3599229, 1, 1, 1, 1, 1,
0.3509554, 0.1881105, 0.2551985, 1, 1, 1, 1, 1,
0.3514827, -0.1825461, 1.987267, 1, 1, 1, 1, 1,
0.3575299, 1.952548, 1.404767, 1, 1, 1, 1, 1,
0.3584945, 0.8343683, -0.9980017, 1, 1, 1, 1, 1,
0.362023, -0.0018766, 1.042404, 1, 1, 1, 1, 1,
0.3660254, -0.315955, 2.920574, 1, 1, 1, 1, 1,
0.3685481, -0.1247499, 1.860794, 0, 0, 1, 1, 1,
0.3754151, -0.03570183, 2.699246, 1, 0, 0, 1, 1,
0.3766131, 1.184424, 0.3874632, 1, 0, 0, 1, 1,
0.3823346, 0.4687983, 2.756829, 1, 0, 0, 1, 1,
0.3850646, -0.3629827, 2.094674, 1, 0, 0, 1, 1,
0.3853616, -1.544522, 1.471865, 1, 0, 0, 1, 1,
0.3860122, 0.3638192, 0.9969137, 0, 0, 0, 1, 1,
0.3879911, 1.603757, -0.4903778, 0, 0, 0, 1, 1,
0.3887042, -1.010107, 3.15987, 0, 0, 0, 1, 1,
0.3890151, 0.2462828, 1.579261, 0, 0, 0, 1, 1,
0.3976517, 0.002764141, 0.6927789, 0, 0, 0, 1, 1,
0.39772, -1.84842, 4.898242, 0, 0, 0, 1, 1,
0.3981726, 0.4894429, 0.6009042, 0, 0, 0, 1, 1,
0.3992166, 0.9325348, -0.006505845, 1, 1, 1, 1, 1,
0.4094272, 0.6451231, -0.2394901, 1, 1, 1, 1, 1,
0.4095947, 0.6067733, -0.5285385, 1, 1, 1, 1, 1,
0.4118796, 0.374096, 0.9998147, 1, 1, 1, 1, 1,
0.4126095, 1.673143, 0.6344078, 1, 1, 1, 1, 1,
0.4164119, 0.5145294, 1.584936, 1, 1, 1, 1, 1,
0.4205587, 0.3360108, 1.076888, 1, 1, 1, 1, 1,
0.4207113, 0.72623, -0.3484086, 1, 1, 1, 1, 1,
0.4213044, -1.361228, 2.269281, 1, 1, 1, 1, 1,
0.4216057, -1.695405, 2.272666, 1, 1, 1, 1, 1,
0.4298375, 0.2115607, 2.352342, 1, 1, 1, 1, 1,
0.4378885, -0.6302091, 1.941292, 1, 1, 1, 1, 1,
0.4394932, -1.233467, 3.9856, 1, 1, 1, 1, 1,
0.4432654, 1.019896, 0.9246348, 1, 1, 1, 1, 1,
0.4446858, 0.6099964, 0.4531842, 1, 1, 1, 1, 1,
0.4481575, -0.4480246, 2.982596, 0, 0, 1, 1, 1,
0.4494063, 0.6858579, -0.2099978, 1, 0, 0, 1, 1,
0.4495002, -0.4004975, 1.022166, 1, 0, 0, 1, 1,
0.4501036, 1.190779, 0.09367401, 1, 0, 0, 1, 1,
0.4504944, -0.2870161, 1.287431, 1, 0, 0, 1, 1,
0.4521614, -0.3671785, 3.585344, 1, 0, 0, 1, 1,
0.4575677, 0.9177366, -1.071617, 0, 0, 0, 1, 1,
0.464248, -2.553323, 4.036497, 0, 0, 0, 1, 1,
0.464431, 0.6453002, -0.7753401, 0, 0, 0, 1, 1,
0.4645932, -0.6426045, 4.231276, 0, 0, 0, 1, 1,
0.4646895, 0.09693944, 2.067818, 0, 0, 0, 1, 1,
0.4684584, -1.437501, 3.303106, 0, 0, 0, 1, 1,
0.471309, 0.421748, 0.3250509, 0, 0, 0, 1, 1,
0.4792965, -0.5764101, 2.536281, 1, 1, 1, 1, 1,
0.4811334, -1.397556, 3.908534, 1, 1, 1, 1, 1,
0.4873107, 2.384059, 2.143187, 1, 1, 1, 1, 1,
0.4890054, 0.3484248, 0.1342232, 1, 1, 1, 1, 1,
0.5002556, 0.650976, 0.4638143, 1, 1, 1, 1, 1,
0.5016319, -0.6290495, 1.212725, 1, 1, 1, 1, 1,
0.5017164, 0.1258031, 1.877462, 1, 1, 1, 1, 1,
0.5020366, -0.7901707, 2.277504, 1, 1, 1, 1, 1,
0.5036628, 1.146843, 0.4633583, 1, 1, 1, 1, 1,
0.5052181, -1.38856, 2.170185, 1, 1, 1, 1, 1,
0.5100944, 0.2640474, 1.36338, 1, 1, 1, 1, 1,
0.5170161, -0.8525854, 2.355468, 1, 1, 1, 1, 1,
0.5222581, -0.383613, 2.436514, 1, 1, 1, 1, 1,
0.5222785, -0.8759528, 3.197954, 1, 1, 1, 1, 1,
0.5225673, -0.08805947, 1.266378, 1, 1, 1, 1, 1,
0.5228285, -1.17362, 3.750617, 0, 0, 1, 1, 1,
0.5252583, -0.3470643, 3.498096, 1, 0, 0, 1, 1,
0.5265096, -0.4769441, 1.784377, 1, 0, 0, 1, 1,
0.5303646, -2.494878, 2.525127, 1, 0, 0, 1, 1,
0.5309783, -0.3123096, 1.242804, 1, 0, 0, 1, 1,
0.5361313, -1.369498, 3.506585, 1, 0, 0, 1, 1,
0.5363464, 2.030581, 0.294629, 0, 0, 0, 1, 1,
0.5376647, 0.5315142, -2.159646, 0, 0, 0, 1, 1,
0.5380774, 0.5993325, 1.943446, 0, 0, 0, 1, 1,
0.5408621, -0.7438401, 3.423951, 0, 0, 0, 1, 1,
0.543119, -0.156519, 2.206644, 0, 0, 0, 1, 1,
0.5563872, -0.3562784, 0.5441684, 0, 0, 0, 1, 1,
0.5564708, 0.1289815, 0.9851183, 0, 0, 0, 1, 1,
0.5604029, -0.6583913, 2.819001, 1, 1, 1, 1, 1,
0.5661411, -1.094127, 2.875278, 1, 1, 1, 1, 1,
0.5664694, -1.852617, 0.508239, 1, 1, 1, 1, 1,
0.5674639, -1.339635, 3.798477, 1, 1, 1, 1, 1,
0.5686179, -0.3283025, 2.061458, 1, 1, 1, 1, 1,
0.5767984, -0.5923644, 3.005162, 1, 1, 1, 1, 1,
0.5783758, -0.5448317, 2.902462, 1, 1, 1, 1, 1,
0.5828881, -0.1301196, 2.370514, 1, 1, 1, 1, 1,
0.5837624, 0.06021521, 3.042063, 1, 1, 1, 1, 1,
0.6003799, -0.2033755, 2.086349, 1, 1, 1, 1, 1,
0.6008384, 0.3393179, 2.435129, 1, 1, 1, 1, 1,
0.60284, 1.009925, 0.2770255, 1, 1, 1, 1, 1,
0.604084, 1.204912, 1.69287, 1, 1, 1, 1, 1,
0.6099247, -0.3773015, 1.537094, 1, 1, 1, 1, 1,
0.6111778, -0.2799332, 3.212071, 1, 1, 1, 1, 1,
0.6115639, 0.3057496, 0.5968635, 0, 0, 1, 1, 1,
0.6127827, -2.049899, 3.456115, 1, 0, 0, 1, 1,
0.6159838, -0.7981095, 3.944452, 1, 0, 0, 1, 1,
0.6205185, -0.180948, 1.684685, 1, 0, 0, 1, 1,
0.6229174, -0.7687276, 1.664333, 1, 0, 0, 1, 1,
0.6232412, 1.678166, -0.0249251, 1, 0, 0, 1, 1,
0.6233038, 1.377961, 0.4214216, 0, 0, 0, 1, 1,
0.6251732, -0.03177826, 1.712795, 0, 0, 0, 1, 1,
0.6269009, -1.717584, 1.343031, 0, 0, 0, 1, 1,
0.6366456, 2.563932, 0.1613992, 0, 0, 0, 1, 1,
0.6397886, 2.180218, 0.1807824, 0, 0, 0, 1, 1,
0.6402009, 1.310695, -0.05770243, 0, 0, 0, 1, 1,
0.6406776, 0.8002562, 1.038786, 0, 0, 0, 1, 1,
0.6444899, 0.3623168, 0.8189003, 1, 1, 1, 1, 1,
0.6455445, -1.501954, 2.910676, 1, 1, 1, 1, 1,
0.6498791, 0.2797271, 1.132452, 1, 1, 1, 1, 1,
0.6508704, 1.241191, -0.8392743, 1, 1, 1, 1, 1,
0.6571781, 0.01583604, 3.360741, 1, 1, 1, 1, 1,
0.6594663, -1.135398, 1.759433, 1, 1, 1, 1, 1,
0.6628871, 0.1294627, 2.705325, 1, 1, 1, 1, 1,
0.6699809, 0.7653639, 2.511717, 1, 1, 1, 1, 1,
0.670715, 0.4744759, 0.1209397, 1, 1, 1, 1, 1,
0.671782, 0.2868116, 0.3058504, 1, 1, 1, 1, 1,
0.68583, 0.3066729, 0.1987767, 1, 1, 1, 1, 1,
0.6881216, -0.4046075, 0.5813586, 1, 1, 1, 1, 1,
0.6934946, -0.9560838, 4.996723, 1, 1, 1, 1, 1,
0.6951089, -0.955146, 2.505382, 1, 1, 1, 1, 1,
0.6995023, -0.6669763, 0.8506224, 1, 1, 1, 1, 1,
0.700057, -0.9845959, 0.702253, 0, 0, 1, 1, 1,
0.7012963, -0.5065641, 0.9288159, 1, 0, 0, 1, 1,
0.7031568, -0.5324102, 1.944321, 1, 0, 0, 1, 1,
0.7073478, -0.2009599, 1.629476, 1, 0, 0, 1, 1,
0.7168011, 1.367201, 1.066498, 1, 0, 0, 1, 1,
0.7177147, 0.137576, -0.1745253, 1, 0, 0, 1, 1,
0.721224, 1.82194, 0.259975, 0, 0, 0, 1, 1,
0.7227959, 0.6451144, 1.001183, 0, 0, 0, 1, 1,
0.7253982, -0.2696228, 2.368746, 0, 0, 0, 1, 1,
0.7338285, -0.08838326, 0.1898683, 0, 0, 0, 1, 1,
0.7440962, -0.4952368, 1.072083, 0, 0, 0, 1, 1,
0.7468484, 0.5438966, 0.3499112, 0, 0, 0, 1, 1,
0.7472245, -1.606757, 3.678295, 0, 0, 0, 1, 1,
0.7564274, -0.04825339, 1.402951, 1, 1, 1, 1, 1,
0.7566725, -0.0554522, 2.071174, 1, 1, 1, 1, 1,
0.7575356, 0.5234805, 2.076372, 1, 1, 1, 1, 1,
0.7639433, 0.1645381, 1.436242, 1, 1, 1, 1, 1,
0.7778212, -0.205988, 1.006445, 1, 1, 1, 1, 1,
0.7807145, 0.7332856, 0.2839241, 1, 1, 1, 1, 1,
0.7931767, 0.1509036, 2.347502, 1, 1, 1, 1, 1,
0.7959858, -0.3020768, 2.177913, 1, 1, 1, 1, 1,
0.7993307, 1.49695, 0.02053631, 1, 1, 1, 1, 1,
0.8001219, 0.6568365, 0.2670811, 1, 1, 1, 1, 1,
0.8001896, -0.01171646, -1.15555, 1, 1, 1, 1, 1,
0.8035823, 1.117196, 0.3441169, 1, 1, 1, 1, 1,
0.8038726, -1.085168, 2.131346, 1, 1, 1, 1, 1,
0.8055147, -0.04163465, 2.2052, 1, 1, 1, 1, 1,
0.8085783, -0.7878687, 1.616671, 1, 1, 1, 1, 1,
0.8126686, -0.3008709, 2.107533, 0, 0, 1, 1, 1,
0.8159384, 0.3180213, 2.417019, 1, 0, 0, 1, 1,
0.8196614, 0.5502602, 0.8708016, 1, 0, 0, 1, 1,
0.820354, 2.235989, -0.2321456, 1, 0, 0, 1, 1,
0.8252918, 1.562381, 1.690576, 1, 0, 0, 1, 1,
0.82968, 1.315199, -1.778966, 1, 0, 0, 1, 1,
0.8318387, 0.3214996, -1.925234, 0, 0, 0, 1, 1,
0.8421586, 0.3073051, 1.131789, 0, 0, 0, 1, 1,
0.8574761, -0.3971615, 2.664045, 0, 0, 0, 1, 1,
0.8702371, -0.1650401, 2.026727, 0, 0, 0, 1, 1,
0.872496, 1.06124, 0.1874199, 0, 0, 0, 1, 1,
0.8726037, 1.820594, 1.024195, 0, 0, 0, 1, 1,
0.8850419, -0.09235642, -0.09491604, 0, 0, 0, 1, 1,
0.8914292, -1.325805, 1.755596, 1, 1, 1, 1, 1,
0.8916926, 0.9225288, 1.385102, 1, 1, 1, 1, 1,
0.8917647, 2.324868, -2.704838, 1, 1, 1, 1, 1,
0.9009831, 0.1251643, 2.364644, 1, 1, 1, 1, 1,
0.9030375, -0.8833955, 3.888678, 1, 1, 1, 1, 1,
0.90342, -0.02770581, 0.7835605, 1, 1, 1, 1, 1,
0.9078946, -1.673001, 4.750987, 1, 1, 1, 1, 1,
0.9094822, -0.7622034, 0.8524629, 1, 1, 1, 1, 1,
0.9138148, 0.1535133, 0.5415493, 1, 1, 1, 1, 1,
0.9228486, 0.1751674, 1.99357, 1, 1, 1, 1, 1,
0.9233628, -0.4003634, 2.610691, 1, 1, 1, 1, 1,
0.931044, -1.270218, 3.071393, 1, 1, 1, 1, 1,
0.931342, 1.109198, 1.808193, 1, 1, 1, 1, 1,
0.9341317, -0.4175306, 3.194081, 1, 1, 1, 1, 1,
0.9351217, 1.486806, 1.041833, 1, 1, 1, 1, 1,
0.9366174, 0.9029727, -0.9497237, 0, 0, 1, 1, 1,
0.9393868, 2.730751, 1.744513, 1, 0, 0, 1, 1,
0.9399244, -1.509384, 3.588571, 1, 0, 0, 1, 1,
0.9405295, -0.9806095, 3.105168, 1, 0, 0, 1, 1,
0.9461917, 0.4079558, 5.39208, 1, 0, 0, 1, 1,
0.9533434, 0.4368718, 2.209773, 1, 0, 0, 1, 1,
0.955615, -0.5702693, 1.706611, 0, 0, 0, 1, 1,
0.9630969, 0.6685365, 1.377585, 0, 0, 0, 1, 1,
0.9651658, 0.312137, 0.2245571, 0, 0, 0, 1, 1,
0.9694284, 0.8163833, 2.273714, 0, 0, 0, 1, 1,
0.9724834, -2.948563, 1.865512, 0, 0, 0, 1, 1,
0.9730608, -1.244719, 2.958507, 0, 0, 0, 1, 1,
0.9797831, 0.231718, 2.442217, 0, 0, 0, 1, 1,
0.9820561, -0.6688553, 0.6000508, 1, 1, 1, 1, 1,
0.9926565, -0.3173698, 2.564162, 1, 1, 1, 1, 1,
0.9964039, -0.6076027, 2.699997, 1, 1, 1, 1, 1,
0.9966313, 1.200196, -0.5276034, 1, 1, 1, 1, 1,
1.005624, 0.1246075, 1.97308, 1, 1, 1, 1, 1,
1.006184, -0.9917923, 3.396772, 1, 1, 1, 1, 1,
1.008659, -0.9688755, 2.791914, 1, 1, 1, 1, 1,
1.011199, 0.8502703, 2.110734, 1, 1, 1, 1, 1,
1.012701, 0.5183929, 1.468316, 1, 1, 1, 1, 1,
1.016307, 0.005750814, 0.7862735, 1, 1, 1, 1, 1,
1.020092, -0.3975123, 2.913587, 1, 1, 1, 1, 1,
1.023381, -0.9183087, 3.065216, 1, 1, 1, 1, 1,
1.024987, -0.44834, 3.678679, 1, 1, 1, 1, 1,
1.02673, -0.2326341, 1.507558, 1, 1, 1, 1, 1,
1.027486, 1.132426, 0.5722912, 1, 1, 1, 1, 1,
1.028772, -0.1286714, 2.975344, 0, 0, 1, 1, 1,
1.035853, -1.109478, 2.052742, 1, 0, 0, 1, 1,
1.043804, -0.1707574, 2.588975, 1, 0, 0, 1, 1,
1.044556, -0.1214458, 1.895946, 1, 0, 0, 1, 1,
1.047588, -1.158787, 2.823385, 1, 0, 0, 1, 1,
1.048217, -0.9230389, 2.842322, 1, 0, 0, 1, 1,
1.051146, -1.535464, 2.31716, 0, 0, 0, 1, 1,
1.051358, -0.08805826, 2.009655, 0, 0, 0, 1, 1,
1.060884, -0.3287277, 2.898906, 0, 0, 0, 1, 1,
1.06179, -0.01537636, 2.451818, 0, 0, 0, 1, 1,
1.073699, -0.9625224, 1.633717, 0, 0, 0, 1, 1,
1.074505, 0.4211828, 1.250087, 0, 0, 0, 1, 1,
1.077579, -1.002831, 2.954471, 0, 0, 0, 1, 1,
1.084083, 0.2157743, 2.756656, 1, 1, 1, 1, 1,
1.090168, -0.3884793, 1.819129, 1, 1, 1, 1, 1,
1.091989, 0.2367812, -0.5008802, 1, 1, 1, 1, 1,
1.093171, -1.691499, 2.136634, 1, 1, 1, 1, 1,
1.095262, 0.04384757, 1.910606, 1, 1, 1, 1, 1,
1.095437, 0.9365622, 2.622593, 1, 1, 1, 1, 1,
1.101029, -2.104452, 3.29028, 1, 1, 1, 1, 1,
1.103718, 0.2261677, 2.047433, 1, 1, 1, 1, 1,
1.104154, -0.6728737, 2.603703, 1, 1, 1, 1, 1,
1.104505, 0.2494936, -0.06534699, 1, 1, 1, 1, 1,
1.109453, 1.45419, 0.3287031, 1, 1, 1, 1, 1,
1.118788, -1.061, 1.308388, 1, 1, 1, 1, 1,
1.121138, -0.130273, 0.9707215, 1, 1, 1, 1, 1,
1.12328, -0.6352633, 1.450532, 1, 1, 1, 1, 1,
1.138666, 1.204949, 1.414582, 1, 1, 1, 1, 1,
1.145859, 0.01421245, 1.050409, 0, 0, 1, 1, 1,
1.147589, -0.3034711, 4.424371, 1, 0, 0, 1, 1,
1.153942, 1.025931, 2.855709, 1, 0, 0, 1, 1,
1.155437, -0.2364537, 1.048798, 1, 0, 0, 1, 1,
1.15768, 0.6879246, 2.020708, 1, 0, 0, 1, 1,
1.165471, 0.06763189, 2.675832, 1, 0, 0, 1, 1,
1.17772, -1.147508, 2.560646, 0, 0, 0, 1, 1,
1.182612, 0.5249082, 1.632062, 0, 0, 0, 1, 1,
1.185069, 0.4590834, 0.8660353, 0, 0, 0, 1, 1,
1.185506, 0.09878169, 2.904718, 0, 0, 0, 1, 1,
1.187655, -0.3089038, 2.945901, 0, 0, 0, 1, 1,
1.187698, -2.233345, 2.12808, 0, 0, 0, 1, 1,
1.190807, 1.088408, 0.9192172, 0, 0, 0, 1, 1,
1.191756, 1.298546, 1.92449, 1, 1, 1, 1, 1,
1.191981, 0.5758703, -0.3483012, 1, 1, 1, 1, 1,
1.202249, -0.3696088, 1.348774, 1, 1, 1, 1, 1,
1.203144, -0.1719738, 1.117936, 1, 1, 1, 1, 1,
1.20753, -2.039068, 1.044837, 1, 1, 1, 1, 1,
1.209967, 0.6753668, 1.890923, 1, 1, 1, 1, 1,
1.212367, 0.575882, -0.09362557, 1, 1, 1, 1, 1,
1.220892, 0.6069423, 2.44243, 1, 1, 1, 1, 1,
1.222464, -1.044207, 3.467828, 1, 1, 1, 1, 1,
1.234929, -0.1123835, 2.199138, 1, 1, 1, 1, 1,
1.254029, -1.222565, 1.442526, 1, 1, 1, 1, 1,
1.260741, 0.8251503, 1.120267, 1, 1, 1, 1, 1,
1.261346, 0.4840443, -0.121998, 1, 1, 1, 1, 1,
1.267091, 1.491918, 1.253556, 1, 1, 1, 1, 1,
1.273272, -0.5693224, 2.148346, 1, 1, 1, 1, 1,
1.275116, 0.3391753, 2.857423, 0, 0, 1, 1, 1,
1.285684, -1.558287, 2.456805, 1, 0, 0, 1, 1,
1.287829, -2.387186, 2.515154, 1, 0, 0, 1, 1,
1.288143, -0.7513283, 1.687934, 1, 0, 0, 1, 1,
1.29999, 0.3335219, 2.174347, 1, 0, 0, 1, 1,
1.30486, -2.075988, 2.137226, 1, 0, 0, 1, 1,
1.305079, -0.2071826, 0.6730859, 0, 0, 0, 1, 1,
1.3067, 0.9551583, 0.6012858, 0, 0, 0, 1, 1,
1.307823, 0.3763995, 1.272917, 0, 0, 0, 1, 1,
1.310841, 1.102543, -1.293858, 0, 0, 0, 1, 1,
1.312189, -1.08091, 1.825503, 0, 0, 0, 1, 1,
1.315802, 1.940584, 1.053677, 0, 0, 0, 1, 1,
1.317912, 0.6285486, 0.42804, 0, 0, 0, 1, 1,
1.321475, 0.5056319, 0.1750857, 1, 1, 1, 1, 1,
1.326678, 0.7867302, 1.211221, 1, 1, 1, 1, 1,
1.327031, 1.578507, 1.51212, 1, 1, 1, 1, 1,
1.327711, -1.621451, 2.035473, 1, 1, 1, 1, 1,
1.330019, -0.3456782, 0.9218819, 1, 1, 1, 1, 1,
1.333977, -0.3448298, 2.792322, 1, 1, 1, 1, 1,
1.347593, -1.418999, 2.795894, 1, 1, 1, 1, 1,
1.350042, -0.9780968, 2.016611, 1, 1, 1, 1, 1,
1.3694, -0.7919496, 2.713225, 1, 1, 1, 1, 1,
1.373241, -1.425925, 3.956445, 1, 1, 1, 1, 1,
1.383129, 0.09772044, 2.954544, 1, 1, 1, 1, 1,
1.388371, 0.5946594, 2.418992, 1, 1, 1, 1, 1,
1.391319, 0.8352898, 1.42723, 1, 1, 1, 1, 1,
1.402923, -2.346196, 2.332796, 1, 1, 1, 1, 1,
1.404868, 0.2682306, 0.02247316, 1, 1, 1, 1, 1,
1.409073, 0.5749023, 1.387168, 0, 0, 1, 1, 1,
1.411963, -0.9433084, 0.7468294, 1, 0, 0, 1, 1,
1.442266, 0.4575898, 1.398178, 1, 0, 0, 1, 1,
1.453904, -0.6876951, 2.573302, 1, 0, 0, 1, 1,
1.490773, -0.9686602, 1.462235, 1, 0, 0, 1, 1,
1.491248, 0.8658918, -1.830086, 1, 0, 0, 1, 1,
1.49534, -0.704977, 1.112254, 0, 0, 0, 1, 1,
1.499293, 0.5437869, 1.818255, 0, 0, 0, 1, 1,
1.509743, -0.1268443, 1.693893, 0, 0, 0, 1, 1,
1.516654, 0.2650529, 0.8206385, 0, 0, 0, 1, 1,
1.51963, -0.2934859, 1.376662, 0, 0, 0, 1, 1,
1.520676, -0.4113637, 0.6898532, 0, 0, 0, 1, 1,
1.533771, 1.94659, 0.2667491, 0, 0, 0, 1, 1,
1.544848, -1.172558, 1.835305, 1, 1, 1, 1, 1,
1.553814, 1.027225, 1.619998, 1, 1, 1, 1, 1,
1.559365, -0.3460343, 2.24089, 1, 1, 1, 1, 1,
1.564357, 0.3981495, 2.081763, 1, 1, 1, 1, 1,
1.574336, 1.84026, 0.2298912, 1, 1, 1, 1, 1,
1.577498, 1.002983, 2.712314, 1, 1, 1, 1, 1,
1.587498, -1.151376, 1.193678, 1, 1, 1, 1, 1,
1.599606, 0.07644848, 1.827252, 1, 1, 1, 1, 1,
1.608545, 0.221253, 1.009221, 1, 1, 1, 1, 1,
1.627579, -0.9808457, 0.08329193, 1, 1, 1, 1, 1,
1.641559, 0.1643016, 3.533659, 1, 1, 1, 1, 1,
1.643229, 1.118878, 0.8643062, 1, 1, 1, 1, 1,
1.648906, 2.151477, -0.01093349, 1, 1, 1, 1, 1,
1.660653, -0.5418245, 3.072536, 1, 1, 1, 1, 1,
1.672787, 0.6907231, 1.045528, 1, 1, 1, 1, 1,
1.676198, 0.7084088, 1.562775, 0, 0, 1, 1, 1,
1.682335, 0.7862226, 1.234134, 1, 0, 0, 1, 1,
1.694557, 1.53762, 2.077283, 1, 0, 0, 1, 1,
1.696887, -0.4607923, 2.616605, 1, 0, 0, 1, 1,
1.712356, -0.01755572, 1.047706, 1, 0, 0, 1, 1,
1.712836, 1.461877, 0.8083147, 1, 0, 0, 1, 1,
1.720607, -0.2335525, 1.041344, 0, 0, 0, 1, 1,
1.734352, -0.4707926, 1.820249, 0, 0, 0, 1, 1,
1.75083, 1.530128, 1.124256, 0, 0, 0, 1, 1,
1.755509, -0.07424228, 1.910574, 0, 0, 0, 1, 1,
1.772803, -0.08267482, 1.933099, 0, 0, 0, 1, 1,
1.791858, 0.6798231, 2.097239, 0, 0, 0, 1, 1,
1.825674, -0.6753879, 1.654285, 0, 0, 0, 1, 1,
1.830234, -0.7578493, 2.149884, 1, 1, 1, 1, 1,
1.846057, -0.2114588, 1.646074, 1, 1, 1, 1, 1,
1.865966, 0.8357634, 2.463401, 1, 1, 1, 1, 1,
1.893309, 0.6874399, 1.881194, 1, 1, 1, 1, 1,
1.897501, 1.141313, 1.342616, 1, 1, 1, 1, 1,
1.927279, -1.295031, 1.109532, 1, 1, 1, 1, 1,
1.928644, -0.6407554, 2.313141, 1, 1, 1, 1, 1,
1.977455, -0.8880172, -0.6672102, 1, 1, 1, 1, 1,
1.99035, 0.700887, 0.9263808, 1, 1, 1, 1, 1,
2.044287, 0.2023885, 1.363481, 1, 1, 1, 1, 1,
2.055107, -1.726307, 4.255823, 1, 1, 1, 1, 1,
2.060252, -0.3205213, 2.289552, 1, 1, 1, 1, 1,
2.070984, -0.1530132, 0.9041923, 1, 1, 1, 1, 1,
2.083379, -0.5283524, 2.380994, 1, 1, 1, 1, 1,
2.098891, -0.2212206, 1.478082, 1, 1, 1, 1, 1,
2.107074, 0.932262, 0.8518377, 0, 0, 1, 1, 1,
2.125236, -1.006832, 0.5441646, 1, 0, 0, 1, 1,
2.136184, 0.8334634, 1.630936, 1, 0, 0, 1, 1,
2.167158, 2.421905, -0.2243062, 1, 0, 0, 1, 1,
2.175359, -1.019575, 2.655561, 1, 0, 0, 1, 1,
2.22308, 1.240586, -0.7277542, 1, 0, 0, 1, 1,
2.25024, -0.1108081, 3.135492, 0, 0, 0, 1, 1,
2.258233, -0.614586, 3.106201, 0, 0, 0, 1, 1,
2.264829, 0.6435307, 4.044678, 0, 0, 0, 1, 1,
2.295225, -1.816405, 3.451058, 0, 0, 0, 1, 1,
2.300495, -1.183513, 1.035084, 0, 0, 0, 1, 1,
2.308717, 0.7585618, 1.095826, 0, 0, 0, 1, 1,
2.383464, 1.338913, 0.928242, 0, 0, 0, 1, 1,
2.480688, -0.4553954, 1.703264, 1, 1, 1, 1, 1,
2.486304, 0.009679932, 1.338144, 1, 1, 1, 1, 1,
2.60591, 0.799791, 1.824818, 1, 1, 1, 1, 1,
2.611759, -0.7006395, 2.618173, 1, 1, 1, 1, 1,
2.641192, 0.286219, -0.1582075, 1, 1, 1, 1, 1,
3.064855, 0.2132058, 1.487647, 1, 1, 1, 1, 1,
3.460343, 0.4307671, 0.3101146, 1, 1, 1, 1, 1
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
var radius = 9.602815;
var distance = 33.72948;
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
mvMatrix.translate( -0.2782131, 0.09740853, 0.219249 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.72948);
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
