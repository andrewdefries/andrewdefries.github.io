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
-2.646546, -0.7462953, -1.247282, 1, 0, 0, 1,
-2.502618, -0.06095135, -3.100753, 1, 0.007843138, 0, 1,
-2.488562, -0.06134054, -1.240665, 1, 0.01176471, 0, 1,
-2.484568, 0.5304454, -1.072344, 1, 0.01960784, 0, 1,
-2.471823, -1.75084, 0.3810658, 1, 0.02352941, 0, 1,
-2.409837, 0.8851871, -2.637243, 1, 0.03137255, 0, 1,
-2.36465, -0.0153788, -0.6362001, 1, 0.03529412, 0, 1,
-2.339102, 0.6008183, -0.3487158, 1, 0.04313726, 0, 1,
-2.330748, -1.440455, -2.61975, 1, 0.04705882, 0, 1,
-2.320443, -0.4806055, -0.7213137, 1, 0.05490196, 0, 1,
-2.259587, 1.022971, -1.773315, 1, 0.05882353, 0, 1,
-2.228157, -0.1771518, -2.43555, 1, 0.06666667, 0, 1,
-2.179122, -0.01103714, -0.9611982, 1, 0.07058824, 0, 1,
-2.147979, 2.383122, -0.4158996, 1, 0.07843138, 0, 1,
-2.143901, -1.070559, -0.7851124, 1, 0.08235294, 0, 1,
-2.089504, -0.1827217, -1.614789, 1, 0.09019608, 0, 1,
-2.051944, 0.2423944, -0.751121, 1, 0.09411765, 0, 1,
-2.03477, -0.4701383, -3.107698, 1, 0.1019608, 0, 1,
-2.031941, 0.4074048, 0.5486882, 1, 0.1098039, 0, 1,
-2.008914, -1.072928, -2.814554, 1, 0.1137255, 0, 1,
-2.00887, 1.509907, -1.704671, 1, 0.1215686, 0, 1,
-1.992957, -1.023675, -2.364016, 1, 0.1254902, 0, 1,
-1.991889, -1.10621, -2.605261, 1, 0.1333333, 0, 1,
-1.989465, 0.4459635, 0.4282877, 1, 0.1372549, 0, 1,
-1.975728, -0.7342452, -0.6703694, 1, 0.145098, 0, 1,
-1.975094, 0.555338, -2.99819, 1, 0.1490196, 0, 1,
-1.957344, 0.7182871, -0.6367925, 1, 0.1568628, 0, 1,
-1.933812, -0.8107755, -4.262626, 1, 0.1607843, 0, 1,
-1.91574, -0.3606952, -0.7810947, 1, 0.1686275, 0, 1,
-1.913584, 0.6395936, -1.905098, 1, 0.172549, 0, 1,
-1.902803, -1.850066, -1.605873, 1, 0.1803922, 0, 1,
-1.880033, -1.384828, -0.3845022, 1, 0.1843137, 0, 1,
-1.877322, -0.8202491, -1.760025, 1, 0.1921569, 0, 1,
-1.87186, -0.3935369, 0.2304015, 1, 0.1960784, 0, 1,
-1.854591, -0.8068956, -1.555903, 1, 0.2039216, 0, 1,
-1.85031, -0.8462672, -2.646707, 1, 0.2117647, 0, 1,
-1.848575, -1.292633, -4.405332, 1, 0.2156863, 0, 1,
-1.821551, -0.4589545, -1.52863, 1, 0.2235294, 0, 1,
-1.80718, -1.234507, -2.775487, 1, 0.227451, 0, 1,
-1.783888, 1.98192, -0.8787207, 1, 0.2352941, 0, 1,
-1.765965, 0.3871472, 0.1265015, 1, 0.2392157, 0, 1,
-1.75668, -0.6953646, -1.99037, 1, 0.2470588, 0, 1,
-1.731689, -0.9017351, -2.448279, 1, 0.2509804, 0, 1,
-1.723607, -0.3006685, -0.1770771, 1, 0.2588235, 0, 1,
-1.722623, -0.4182296, 0.04154062, 1, 0.2627451, 0, 1,
-1.717663, -1.11915, -2.952846, 1, 0.2705882, 0, 1,
-1.712232, 0.2069999, -1.422828, 1, 0.2745098, 0, 1,
-1.690702, -0.8347684, -1.324816, 1, 0.282353, 0, 1,
-1.667499, -1.238297, -0.2182863, 1, 0.2862745, 0, 1,
-1.661293, -0.2599368, -3.953017, 1, 0.2941177, 0, 1,
-1.654535, -1.396119, -4.274209, 1, 0.3019608, 0, 1,
-1.653153, -0.3364274, -0.02367193, 1, 0.3058824, 0, 1,
-1.620021, 2.347993, -0.727664, 1, 0.3137255, 0, 1,
-1.606703, -1.779553, -2.211336, 1, 0.3176471, 0, 1,
-1.606211, -0.2020511, -1.987868, 1, 0.3254902, 0, 1,
-1.591814, -0.3899764, -2.918858, 1, 0.3294118, 0, 1,
-1.578838, 0.4621486, -1.514979, 1, 0.3372549, 0, 1,
-1.553029, -0.6357921, -0.3733563, 1, 0.3411765, 0, 1,
-1.55251, 0.8230845, -1.920371, 1, 0.3490196, 0, 1,
-1.536858, 1.057018, -0.2335794, 1, 0.3529412, 0, 1,
-1.534106, 0.2099596, -2.592388, 1, 0.3607843, 0, 1,
-1.496889, -0.8045942, -4.086426, 1, 0.3647059, 0, 1,
-1.49507, 0.8469922, -0.06701801, 1, 0.372549, 0, 1,
-1.470158, 0.5290136, -3.171269, 1, 0.3764706, 0, 1,
-1.461775, -0.9139059, -3.064938, 1, 0.3843137, 0, 1,
-1.448772, 0.09704816, -1.32256, 1, 0.3882353, 0, 1,
-1.446043, -1.299442, -2.995112, 1, 0.3960784, 0, 1,
-1.438072, 1.167005, -2.206209, 1, 0.4039216, 0, 1,
-1.428401, 0.1661359, -2.675293, 1, 0.4078431, 0, 1,
-1.426328, 0.3385749, -2.525361, 1, 0.4156863, 0, 1,
-1.41669, -0.1469735, -2.585332, 1, 0.4196078, 0, 1,
-1.414641, 0.245641, -1.189003, 1, 0.427451, 0, 1,
-1.412384, -1.676272, -2.189082, 1, 0.4313726, 0, 1,
-1.404357, 1.043288, -2.453258, 1, 0.4392157, 0, 1,
-1.400678, 0.04827112, -1.975012, 1, 0.4431373, 0, 1,
-1.399068, -1.392395, -2.886839, 1, 0.4509804, 0, 1,
-1.396134, -0.1780389, -1.405127, 1, 0.454902, 0, 1,
-1.394286, -0.02515912, 0.3942305, 1, 0.4627451, 0, 1,
-1.394028, -0.6578251, -2.805344, 1, 0.4666667, 0, 1,
-1.391328, 0.3902817, -2.173881, 1, 0.4745098, 0, 1,
-1.386149, 0.4004297, -0.5326504, 1, 0.4784314, 0, 1,
-1.382375, 0.223891, -1.495897, 1, 0.4862745, 0, 1,
-1.379812, 0.979536, -1.298191, 1, 0.4901961, 0, 1,
-1.374192, -1.288966, -1.611241, 1, 0.4980392, 0, 1,
-1.368344, -1.0564, -3.759757, 1, 0.5058824, 0, 1,
-1.362721, -0.6000085, -4.253752, 1, 0.509804, 0, 1,
-1.362053, -1.61761, -3.833236, 1, 0.5176471, 0, 1,
-1.358907, 0.02117855, -2.137821, 1, 0.5215687, 0, 1,
-1.351538, 0.8025551, 0.5604808, 1, 0.5294118, 0, 1,
-1.34797, 1.574578, -1.025875, 1, 0.5333334, 0, 1,
-1.344991, -0.2334056, -3.122417, 1, 0.5411765, 0, 1,
-1.339787, 0.2715527, -1.217191, 1, 0.5450981, 0, 1,
-1.32156, -0.294418, -2.521967, 1, 0.5529412, 0, 1,
-1.319016, -1.343798, -1.69461, 1, 0.5568628, 0, 1,
-1.313435, -0.0599589, -1.683614, 1, 0.5647059, 0, 1,
-1.308416, -0.6994579, -1.77273, 1, 0.5686275, 0, 1,
-1.307516, -1.273031, -2.53884, 1, 0.5764706, 0, 1,
-1.30261, 0.4635516, -1.632727, 1, 0.5803922, 0, 1,
-1.297353, -2.896485, -4.705881, 1, 0.5882353, 0, 1,
-1.293937, -2.55259, -3.268347, 1, 0.5921569, 0, 1,
-1.286487, -1.218054, -1.833024, 1, 0.6, 0, 1,
-1.28412, 0.8133251, -1.469499, 1, 0.6078432, 0, 1,
-1.282974, -0.4302573, -1.364117, 1, 0.6117647, 0, 1,
-1.274988, 0.03322544, -1.10734, 1, 0.6196079, 0, 1,
-1.265366, -0.5942115, -2.305704, 1, 0.6235294, 0, 1,
-1.263672, -0.8949603, -0.8243451, 1, 0.6313726, 0, 1,
-1.244042, -0.6792733, -3.901544, 1, 0.6352941, 0, 1,
-1.23908, -0.6851665, -3.078391, 1, 0.6431373, 0, 1,
-1.230068, 1.103414, 0.4536479, 1, 0.6470588, 0, 1,
-1.22598, -0.2506011, -2.159405, 1, 0.654902, 0, 1,
-1.221656, 0.1543513, -1.38833, 1, 0.6588235, 0, 1,
-1.220693, 0.3432506, -1.905827, 1, 0.6666667, 0, 1,
-1.219507, -1.046756, -0.5107852, 1, 0.6705883, 0, 1,
-1.218204, 0.2135731, -3.057204, 1, 0.6784314, 0, 1,
-1.216749, -1.031423, -2.135078, 1, 0.682353, 0, 1,
-1.213155, -0.2375766, -2.328613, 1, 0.6901961, 0, 1,
-1.211254, 0.4185534, -0.8403666, 1, 0.6941177, 0, 1,
-1.209197, -0.9977391, -2.52591, 1, 0.7019608, 0, 1,
-1.202746, -0.9385955, -2.182422, 1, 0.7098039, 0, 1,
-1.193663, -1.225663, -4.525128, 1, 0.7137255, 0, 1,
-1.190317, -0.7827737, -3.034527, 1, 0.7215686, 0, 1,
-1.183251, -2.807874, -2.164813, 1, 0.7254902, 0, 1,
-1.18135, 0.1028384, -0.9451681, 1, 0.7333333, 0, 1,
-1.180825, -0.7452643, -0.9026203, 1, 0.7372549, 0, 1,
-1.178031, 0.9075392, -1.298169, 1, 0.7450981, 0, 1,
-1.174062, 0.04445899, -0.7137334, 1, 0.7490196, 0, 1,
-1.165433, -1.67137, -1.9677, 1, 0.7568628, 0, 1,
-1.161925, 0.7998607, -0.7049359, 1, 0.7607843, 0, 1,
-1.161893, -0.8622329, -2.012032, 1, 0.7686275, 0, 1,
-1.155177, 1.116261, 0.02320728, 1, 0.772549, 0, 1,
-1.151924, -0.9592822, -1.333413, 1, 0.7803922, 0, 1,
-1.141631, -2.391171, -3.028139, 1, 0.7843137, 0, 1,
-1.13576, -0.238599, -1.841005, 1, 0.7921569, 0, 1,
-1.135261, -0.5256997, -2.600914, 1, 0.7960784, 0, 1,
-1.133305, -0.7958238, -2.410902, 1, 0.8039216, 0, 1,
-1.131051, 1.193118, -1.480278, 1, 0.8117647, 0, 1,
-1.124485, 1.015548, 0.5525252, 1, 0.8156863, 0, 1,
-1.122066, 0.4256146, -0.3085514, 1, 0.8235294, 0, 1,
-1.117926, -0.3633461, -2.461972, 1, 0.827451, 0, 1,
-1.103525, -0.1495695, -1.543657, 1, 0.8352941, 0, 1,
-1.098117, -0.3603172, -1.58585, 1, 0.8392157, 0, 1,
-1.088278, 0.03473871, -1.424158, 1, 0.8470588, 0, 1,
-1.083667, -0.4072122, -1.935058, 1, 0.8509804, 0, 1,
-1.081959, 0.5115907, -0.2332566, 1, 0.8588235, 0, 1,
-1.077962, 0.2214593, -1.267523, 1, 0.8627451, 0, 1,
-1.066657, -0.2081807, -2.621912, 1, 0.8705882, 0, 1,
-1.065568, 0.4297301, -0.9789163, 1, 0.8745098, 0, 1,
-1.064474, 1.247309, -0.7511616, 1, 0.8823529, 0, 1,
-1.063933, -1.33525, -2.476129, 1, 0.8862745, 0, 1,
-1.062085, -1.029733, -4.143943, 1, 0.8941177, 0, 1,
-1.058446, 0.3192067, -0.7041765, 1, 0.8980392, 0, 1,
-1.057561, -0.6711789, -1.234968, 1, 0.9058824, 0, 1,
-1.056203, 0.7263926, -0.4475461, 1, 0.9137255, 0, 1,
-1.04542, 0.7988836, -0.5175574, 1, 0.9176471, 0, 1,
-1.041296, -1.177984, -0.8414926, 1, 0.9254902, 0, 1,
-1.036168, -1.229925, -0.9308649, 1, 0.9294118, 0, 1,
-1.026271, 0.3847802, 1.029991, 1, 0.9372549, 0, 1,
-1.024939, 1.562246, -1.000477, 1, 0.9411765, 0, 1,
-1.020487, 0.7919795, -0.7997491, 1, 0.9490196, 0, 1,
-1.019113, -0.8756801, -1.117343, 1, 0.9529412, 0, 1,
-0.9921345, -0.9665971, -1.980375, 1, 0.9607843, 0, 1,
-0.9884222, 0.9505929, -1.969953, 1, 0.9647059, 0, 1,
-0.9762415, 2.062516, -1.483714, 1, 0.972549, 0, 1,
-0.9702343, -1.680503, -2.593821, 1, 0.9764706, 0, 1,
-0.9692754, 0.6337358, 0.5938994, 1, 0.9843137, 0, 1,
-0.9593636, 1.575248, -0.9065842, 1, 0.9882353, 0, 1,
-0.9585639, 0.1469485, -3.066005, 1, 0.9960784, 0, 1,
-0.9530345, -0.6243677, -2.856395, 0.9960784, 1, 0, 1,
-0.934646, 0.6140431, -1.12263, 0.9921569, 1, 0, 1,
-0.93088, 1.783386, -0.5214273, 0.9843137, 1, 0, 1,
-0.9264188, -0.4661589, -2.395813, 0.9803922, 1, 0, 1,
-0.9240934, -0.3239042, -1.837608, 0.972549, 1, 0, 1,
-0.9231126, 1.003094, -1.339586, 0.9686275, 1, 0, 1,
-0.9211521, 0.9781008, -0.6275906, 0.9607843, 1, 0, 1,
-0.9204413, 0.2140771, -1.258089, 0.9568627, 1, 0, 1,
-0.9192813, -0.3330767, -1.181519, 0.9490196, 1, 0, 1,
-0.9163439, 1.525817, 0.3647479, 0.945098, 1, 0, 1,
-0.9063124, 0.6110698, -2.044154, 0.9372549, 1, 0, 1,
-0.8997751, -1.801077, -2.554622, 0.9333333, 1, 0, 1,
-0.8990195, -0.6374061, -0.7254431, 0.9254902, 1, 0, 1,
-0.8977671, 1.029528, 0.379911, 0.9215686, 1, 0, 1,
-0.8969986, 1.981622, -1.108241, 0.9137255, 1, 0, 1,
-0.8958335, 0.8322343, -2.385599, 0.9098039, 1, 0, 1,
-0.8955018, 0.4764751, -1.907502, 0.9019608, 1, 0, 1,
-0.8950613, 0.4715378, -0.07673468, 0.8941177, 1, 0, 1,
-0.8904073, -0.03161938, -2.469231, 0.8901961, 1, 0, 1,
-0.8851266, -0.9348023, -2.879524, 0.8823529, 1, 0, 1,
-0.8832707, -0.6361258, -2.419722, 0.8784314, 1, 0, 1,
-0.8800262, 0.4417743, -1.529706, 0.8705882, 1, 0, 1,
-0.8795533, 1.970183, -1.53359, 0.8666667, 1, 0, 1,
-0.8748957, -1.360571, -1.172848, 0.8588235, 1, 0, 1,
-0.8695307, 1.367672, -1.54917, 0.854902, 1, 0, 1,
-0.8598925, 0.9688973, -1.40651, 0.8470588, 1, 0, 1,
-0.8568826, 0.647329, -0.7411933, 0.8431373, 1, 0, 1,
-0.8554364, -0.7083656, -3.169239, 0.8352941, 1, 0, 1,
-0.8528951, -0.01303571, -1.504891, 0.8313726, 1, 0, 1,
-0.8461426, -0.4745047, -2.524935, 0.8235294, 1, 0, 1,
-0.8459398, -1.239126, -2.009795, 0.8196079, 1, 0, 1,
-0.8354509, 2.74719, -1.462491, 0.8117647, 1, 0, 1,
-0.831788, -1.109899, -2.668945, 0.8078431, 1, 0, 1,
-0.829301, -0.9678546, -1.304188, 0.8, 1, 0, 1,
-0.8275883, -1.43274, -2.250432, 0.7921569, 1, 0, 1,
-0.8215482, 0.7013565, -0.319997, 0.7882353, 1, 0, 1,
-0.8171557, -1.641379, -2.349718, 0.7803922, 1, 0, 1,
-0.8156828, -1.642001, -5.102075, 0.7764706, 1, 0, 1,
-0.8151407, -0.7889452, -3.078349, 0.7686275, 1, 0, 1,
-0.8125207, 0.2018547, -2.832271, 0.7647059, 1, 0, 1,
-0.8078699, -0.02557341, -1.338367, 0.7568628, 1, 0, 1,
-0.8075119, 0.2099979, -1.043439, 0.7529412, 1, 0, 1,
-0.8054062, 0.5039529, -2.589416, 0.7450981, 1, 0, 1,
-0.804961, 0.04029511, -0.5427744, 0.7411765, 1, 0, 1,
-0.8027738, -0.6400273, -1.047291, 0.7333333, 1, 0, 1,
-0.8003317, -0.1200677, -1.855536, 0.7294118, 1, 0, 1,
-0.7958734, 1.682384, -1.436734, 0.7215686, 1, 0, 1,
-0.79155, 0.7987996, -1.21331, 0.7176471, 1, 0, 1,
-0.784098, 0.6586361, -1.545306, 0.7098039, 1, 0, 1,
-0.7760314, 0.6173013, 0.23834, 0.7058824, 1, 0, 1,
-0.7718704, -1.1402, -1.73651, 0.6980392, 1, 0, 1,
-0.7654051, 0.04163807, -3.521709, 0.6901961, 1, 0, 1,
-0.7635734, -0.3447597, -1.728142, 0.6862745, 1, 0, 1,
-0.7599595, 0.8760574, -0.9679652, 0.6784314, 1, 0, 1,
-0.7576894, -0.3120836, -1.456621, 0.6745098, 1, 0, 1,
-0.7561504, -0.8562683, -1.192519, 0.6666667, 1, 0, 1,
-0.7535229, -0.2615053, -2.880506, 0.6627451, 1, 0, 1,
-0.7494495, -0.4779454, -1.729756, 0.654902, 1, 0, 1,
-0.7445687, -0.8822784, -1.785401, 0.6509804, 1, 0, 1,
-0.7436472, -0.2559243, 0.3545503, 0.6431373, 1, 0, 1,
-0.7415426, -0.8874439, -2.887414, 0.6392157, 1, 0, 1,
-0.7396095, 0.5390835, -1.972935, 0.6313726, 1, 0, 1,
-0.7387459, -0.4986256, -0.5345209, 0.627451, 1, 0, 1,
-0.737024, -0.3309332, -2.323965, 0.6196079, 1, 0, 1,
-0.7341987, 0.3762151, 0.03349806, 0.6156863, 1, 0, 1,
-0.7311824, -0.3596335, -0.6683346, 0.6078432, 1, 0, 1,
-0.7297609, 0.2172375, -1.136745, 0.6039216, 1, 0, 1,
-0.7199299, 1.001173, -0.7846928, 0.5960785, 1, 0, 1,
-0.7078238, -0.5137113, -0.6457976, 0.5882353, 1, 0, 1,
-0.7012855, -0.08696217, -2.242244, 0.5843138, 1, 0, 1,
-0.6984228, -1.675272, -1.197936, 0.5764706, 1, 0, 1,
-0.6942801, 0.02383264, -2.297248, 0.572549, 1, 0, 1,
-0.6921351, 0.5768004, -0.4503294, 0.5647059, 1, 0, 1,
-0.6900642, -0.233095, -2.228936, 0.5607843, 1, 0, 1,
-0.6881038, 1.076144, -2.024061, 0.5529412, 1, 0, 1,
-0.6878983, -0.2335641, -1.339144, 0.5490196, 1, 0, 1,
-0.6833147, 0.4148701, -0.9364543, 0.5411765, 1, 0, 1,
-0.6791309, -2.1552, -2.211078, 0.5372549, 1, 0, 1,
-0.6765891, 1.496488, -0.2897453, 0.5294118, 1, 0, 1,
-0.6745186, -0.3906085, -3.101027, 0.5254902, 1, 0, 1,
-0.6719971, -0.03087173, -2.134194, 0.5176471, 1, 0, 1,
-0.6639158, -0.7427901, -2.732122, 0.5137255, 1, 0, 1,
-0.6627812, 1.735178, -1.361125, 0.5058824, 1, 0, 1,
-0.6587689, -1.30048, -2.357054, 0.5019608, 1, 0, 1,
-0.6557205, 0.203475, -1.706028, 0.4941176, 1, 0, 1,
-0.6504042, 0.2508211, -0.6803823, 0.4862745, 1, 0, 1,
-0.6482447, -0.2336335, -2.091984, 0.4823529, 1, 0, 1,
-0.6473246, 1.524368, 1.275242, 0.4745098, 1, 0, 1,
-0.6454955, -0.2874855, -1.852126, 0.4705882, 1, 0, 1,
-0.6443601, 1.439061, -1.061368, 0.4627451, 1, 0, 1,
-0.6418201, -0.3463322, -2.265751, 0.4588235, 1, 0, 1,
-0.6411037, 0.9463111, -0.2708297, 0.4509804, 1, 0, 1,
-0.6399003, -1.273278, -2.319662, 0.4470588, 1, 0, 1,
-0.6362358, 0.5755463, 1.059366, 0.4392157, 1, 0, 1,
-0.6346084, -0.5070966, -2.026664, 0.4352941, 1, 0, 1,
-0.6327309, -0.8703669, -2.868104, 0.427451, 1, 0, 1,
-0.6322426, -0.3772612, -1.559464, 0.4235294, 1, 0, 1,
-0.6317522, -0.6001274, -2.94862, 0.4156863, 1, 0, 1,
-0.6275381, -0.487713, -1.527884, 0.4117647, 1, 0, 1,
-0.6273813, 0.8527909, -0.9208475, 0.4039216, 1, 0, 1,
-0.6255299, -0.356285, -1.378325, 0.3960784, 1, 0, 1,
-0.6213406, -0.3819138, -2.173072, 0.3921569, 1, 0, 1,
-0.6205984, -1.52656, -1.358523, 0.3843137, 1, 0, 1,
-0.6179258, -0.4081111, -2.515254, 0.3803922, 1, 0, 1,
-0.6162732, 0.7714324, -1.57899, 0.372549, 1, 0, 1,
-0.6148982, -1.097443, -2.810977, 0.3686275, 1, 0, 1,
-0.6130255, -1.367652, -2.230343, 0.3607843, 1, 0, 1,
-0.6107641, 0.4416879, 0.4782822, 0.3568628, 1, 0, 1,
-0.6099328, -0.27575, -2.320471, 0.3490196, 1, 0, 1,
-0.606683, 1.712612, -0.7776168, 0.345098, 1, 0, 1,
-0.5989037, -0.1177895, -0.3905718, 0.3372549, 1, 0, 1,
-0.5880131, 1.052621, -1.77134, 0.3333333, 1, 0, 1,
-0.5875899, 0.3395805, -1.94138, 0.3254902, 1, 0, 1,
-0.5828911, -0.3719739, -1.537672, 0.3215686, 1, 0, 1,
-0.5794646, -0.5804195, -2.080604, 0.3137255, 1, 0, 1,
-0.574379, -2.000626, -0.2690745, 0.3098039, 1, 0, 1,
-0.5663282, 0.6322566, -2.147291, 0.3019608, 1, 0, 1,
-0.5647709, -0.6489761, 1.178668, 0.2941177, 1, 0, 1,
-0.5626545, 2.173481, -1.712494, 0.2901961, 1, 0, 1,
-0.561555, -0.6775602, -3.223895, 0.282353, 1, 0, 1,
-0.5586426, -0.3551439, -0.4853489, 0.2784314, 1, 0, 1,
-0.5566258, 0.453831, -1.015892, 0.2705882, 1, 0, 1,
-0.5514822, -0.1697234, -2.694458, 0.2666667, 1, 0, 1,
-0.5423225, -2.193779, -3.666459, 0.2588235, 1, 0, 1,
-0.5418642, -0.2131265, -2.313978, 0.254902, 1, 0, 1,
-0.5413535, 0.1500728, -0.394231, 0.2470588, 1, 0, 1,
-0.5406162, -1.446702, -1.48597, 0.2431373, 1, 0, 1,
-0.5404554, -0.3667166, -3.771322, 0.2352941, 1, 0, 1,
-0.5345728, 1.307351, -0.3538529, 0.2313726, 1, 0, 1,
-0.5327089, -1.998724, -2.914734, 0.2235294, 1, 0, 1,
-0.5289819, 1.782441, -2.908388, 0.2196078, 1, 0, 1,
-0.5289414, -0.07598649, -1.396724, 0.2117647, 1, 0, 1,
-0.527679, -0.5903839, -3.481108, 0.2078431, 1, 0, 1,
-0.5267992, -1.327905, -2.851202, 0.2, 1, 0, 1,
-0.5202231, -0.6414748, -1.309537, 0.1921569, 1, 0, 1,
-0.5187985, 0.5428807, -1.713298, 0.1882353, 1, 0, 1,
-0.5176893, 0.4015119, -2.138734, 0.1803922, 1, 0, 1,
-0.5160041, -0.8500113, -2.334572, 0.1764706, 1, 0, 1,
-0.5150405, 0.5682006, 1.215784, 0.1686275, 1, 0, 1,
-0.5070996, 0.6815839, -0.01204203, 0.1647059, 1, 0, 1,
-0.5037762, 0.2078391, -1.877514, 0.1568628, 1, 0, 1,
-0.502381, 0.2360696, -2.602622, 0.1529412, 1, 0, 1,
-0.5001698, -0.2573428, -4.170275, 0.145098, 1, 0, 1,
-0.4965733, 2.714312, 0.1594815, 0.1411765, 1, 0, 1,
-0.4963354, 2.04194, -1.257046, 0.1333333, 1, 0, 1,
-0.4950694, 0.8048391, 0.5056719, 0.1294118, 1, 0, 1,
-0.4946182, 0.1062935, -0.9750253, 0.1215686, 1, 0, 1,
-0.4930127, -0.309913, -3.098217, 0.1176471, 1, 0, 1,
-0.4929921, 0.1043358, -1.252715, 0.1098039, 1, 0, 1,
-0.4888938, 0.4812748, 0.6440964, 0.1058824, 1, 0, 1,
-0.4837592, 0.8802202, -0.8001335, 0.09803922, 1, 0, 1,
-0.4802376, 1.114967, 1.040896, 0.09019608, 1, 0, 1,
-0.4764597, -1.235632, -4.222796, 0.08627451, 1, 0, 1,
-0.4659523, 0.6369398, -0.5669339, 0.07843138, 1, 0, 1,
-0.4632398, -0.268076, -1.296635, 0.07450981, 1, 0, 1,
-0.4614664, -2.05467, -2.471426, 0.06666667, 1, 0, 1,
-0.4544391, 1.262203, -2.095533, 0.0627451, 1, 0, 1,
-0.4520224, 0.5852858, -1.261693, 0.05490196, 1, 0, 1,
-0.4516939, -0.6397132, -1.493718, 0.05098039, 1, 0, 1,
-0.4488399, -0.7187387, -0.7954368, 0.04313726, 1, 0, 1,
-0.4478059, -1.538351, -3.347213, 0.03921569, 1, 0, 1,
-0.4460363, 1.372433, -0.0142284, 0.03137255, 1, 0, 1,
-0.4423527, -0.3801384, -2.998157, 0.02745098, 1, 0, 1,
-0.4419723, -0.3955792, -3.267769, 0.01960784, 1, 0, 1,
-0.4400826, -0.08049561, -3.520887, 0.01568628, 1, 0, 1,
-0.438342, 0.2308567, -1.261087, 0.007843138, 1, 0, 1,
-0.4368052, -1.558532, -0.4894513, 0.003921569, 1, 0, 1,
-0.4327637, 0.2048672, 0.09338548, 0, 1, 0.003921569, 1,
-0.4321025, 0.4205393, -0.4477921, 0, 1, 0.01176471, 1,
-0.4273424, 0.4712995, -0.9417402, 0, 1, 0.01568628, 1,
-0.4253972, 1.040823, -1.345667, 0, 1, 0.02352941, 1,
-0.421045, 0.6481137, -3.140635, 0, 1, 0.02745098, 1,
-0.4199479, -0.1363543, -1.507807, 0, 1, 0.03529412, 1,
-0.4171094, 0.7324213, -1.493633, 0, 1, 0.03921569, 1,
-0.4152687, 1.74199, -1.116251, 0, 1, 0.04705882, 1,
-0.4151786, -0.01871616, -1.619659, 0, 1, 0.05098039, 1,
-0.4127717, -0.1794446, -1.391341, 0, 1, 0.05882353, 1,
-0.4126823, -1.490925, -2.881929, 0, 1, 0.0627451, 1,
-0.4122699, 2.061754, 0.5489735, 0, 1, 0.07058824, 1,
-0.4120311, 0.3974308, -0.05685903, 0, 1, 0.07450981, 1,
-0.4112682, -1.104913, -2.912044, 0, 1, 0.08235294, 1,
-0.4111125, -0.1522696, -2.380495, 0, 1, 0.08627451, 1,
-0.4081917, 1.672233, -1.580308, 0, 1, 0.09411765, 1,
-0.408154, -1.351705, -2.709807, 0, 1, 0.1019608, 1,
-0.4075695, -0.6812693, -2.373347, 0, 1, 0.1058824, 1,
-0.4057795, -0.233074, -1.49904, 0, 1, 0.1137255, 1,
-0.4052832, -0.9822625, -2.947525, 0, 1, 0.1176471, 1,
-0.399815, -1.405346, -1.215147, 0, 1, 0.1254902, 1,
-0.3954014, -0.3787229, -3.024642, 0, 1, 0.1294118, 1,
-0.392633, -0.8628232, -2.647131, 0, 1, 0.1372549, 1,
-0.391322, -1.844906, -2.815353, 0, 1, 0.1411765, 1,
-0.3905962, 1.412683, 0.9012231, 0, 1, 0.1490196, 1,
-0.3902793, 0.796496, -0.04888678, 0, 1, 0.1529412, 1,
-0.390049, -0.1459905, -2.187834, 0, 1, 0.1607843, 1,
-0.3815524, 1.591624, -1.080718, 0, 1, 0.1647059, 1,
-0.3808037, 0.06676193, -1.60392, 0, 1, 0.172549, 1,
-0.379265, 0.4642994, -0.01118361, 0, 1, 0.1764706, 1,
-0.3754238, 1.96261, 0.7382628, 0, 1, 0.1843137, 1,
-0.375176, -0.354253, -2.159321, 0, 1, 0.1882353, 1,
-0.3727619, 0.1066872, -2.101629, 0, 1, 0.1960784, 1,
-0.3657252, -1.336537, -3.072978, 0, 1, 0.2039216, 1,
-0.3642777, -1.416199, -3.149927, 0, 1, 0.2078431, 1,
-0.3639544, 0.1632642, -0.06592871, 0, 1, 0.2156863, 1,
-0.3638435, -0.2247431, -1.505291, 0, 1, 0.2196078, 1,
-0.3571125, -0.8974807, -3.278011, 0, 1, 0.227451, 1,
-0.349014, -0.4650253, -4.604895, 0, 1, 0.2313726, 1,
-0.3486143, -0.07434099, 1.17576, 0, 1, 0.2392157, 1,
-0.3470262, -0.8455722, -2.609127, 0, 1, 0.2431373, 1,
-0.3453457, 0.09973104, -0.8558524, 0, 1, 0.2509804, 1,
-0.3403171, 0.1672674, -0.1360849, 0, 1, 0.254902, 1,
-0.3402053, -0.7654742, -4.322665, 0, 1, 0.2627451, 1,
-0.3389762, 1.364995, -0.7531697, 0, 1, 0.2666667, 1,
-0.3384345, -0.5376884, -2.056127, 0, 1, 0.2745098, 1,
-0.3364744, 0.7218226, -0.9918154, 0, 1, 0.2784314, 1,
-0.3357703, -0.3500322, -0.2163503, 0, 1, 0.2862745, 1,
-0.330995, 0.362083, -2.291868, 0, 1, 0.2901961, 1,
-0.330085, 0.8565289, 0.007350496, 0, 1, 0.2980392, 1,
-0.3298794, -0.5118172, -2.877031, 0, 1, 0.3058824, 1,
-0.3226057, 0.6429999, 0.4855311, 0, 1, 0.3098039, 1,
-0.320075, 1.066592, 1.739692, 0, 1, 0.3176471, 1,
-0.3109157, -0.1389721, -1.460982, 0, 1, 0.3215686, 1,
-0.3103122, 0.5371771, -1.247387, 0, 1, 0.3294118, 1,
-0.3024147, -2.213497, -1.857191, 0, 1, 0.3333333, 1,
-0.2985126, -0.2345121, -1.728322, 0, 1, 0.3411765, 1,
-0.2924403, 0.3967465, 0.9517447, 0, 1, 0.345098, 1,
-0.2898226, -0.05450028, -1.886825, 0, 1, 0.3529412, 1,
-0.2860925, 0.6595032, -0.2863325, 0, 1, 0.3568628, 1,
-0.2807063, -1.413452, -1.908957, 0, 1, 0.3647059, 1,
-0.273066, -0.3051461, -1.84408, 0, 1, 0.3686275, 1,
-0.2692072, -0.499098, -2.081319, 0, 1, 0.3764706, 1,
-0.2658812, 0.1026771, -2.5729, 0, 1, 0.3803922, 1,
-0.2657433, -0.6359429, -0.3464246, 0, 1, 0.3882353, 1,
-0.2600824, -0.2238054, -2.094555, 0, 1, 0.3921569, 1,
-0.2592775, 1.007866, -2.00121, 0, 1, 0.4, 1,
-0.2541653, -1.64646, -3.838722, 0, 1, 0.4078431, 1,
-0.253525, -1.811046, -3.605601, 0, 1, 0.4117647, 1,
-0.2535129, -0.02527973, -1.701898, 0, 1, 0.4196078, 1,
-0.2512474, 0.923628, 0.4389479, 0, 1, 0.4235294, 1,
-0.2468888, 0.298229, -0.5577962, 0, 1, 0.4313726, 1,
-0.2446259, 0.204689, 0.02052387, 0, 1, 0.4352941, 1,
-0.2432624, 2.226874, -0.7987809, 0, 1, 0.4431373, 1,
-0.2378266, -0.7362262, -3.42933, 0, 1, 0.4470588, 1,
-0.231086, 0.4710532, -0.8044616, 0, 1, 0.454902, 1,
-0.2308878, -0.4749341, -2.303699, 0, 1, 0.4588235, 1,
-0.2279675, 1.154518, -1.528303, 0, 1, 0.4666667, 1,
-0.2261636, -1.070236, -3.099998, 0, 1, 0.4705882, 1,
-0.2215926, 0.7560192, -1.990988, 0, 1, 0.4784314, 1,
-0.2210658, 0.09194051, -0.9926916, 0, 1, 0.4823529, 1,
-0.2201548, 1.633184, 0.510003, 0, 1, 0.4901961, 1,
-0.2199078, 0.7157679, -0.2403605, 0, 1, 0.4941176, 1,
-0.2179364, 0.2401103, -2.102695, 0, 1, 0.5019608, 1,
-0.2170998, 0.1575624, -0.1168804, 0, 1, 0.509804, 1,
-0.2161393, 2.263812, -0.7170973, 0, 1, 0.5137255, 1,
-0.2146862, -0.8022231, -1.7528, 0, 1, 0.5215687, 1,
-0.211659, 1.281095, -0.3118363, 0, 1, 0.5254902, 1,
-0.2083855, -1.077596, -1.48244, 0, 1, 0.5333334, 1,
-0.2064484, 0.3811485, 0.2496751, 0, 1, 0.5372549, 1,
-0.2047767, -0.07428274, -1.641518, 0, 1, 0.5450981, 1,
-0.2018597, 0.01009817, -1.545816, 0, 1, 0.5490196, 1,
-0.1985762, -1.190675, -1.721052, 0, 1, 0.5568628, 1,
-0.1963355, -0.1457802, -0.5161312, 0, 1, 0.5607843, 1,
-0.1959094, 0.1943186, -2.476212, 0, 1, 0.5686275, 1,
-0.1955503, 1.383281, 0.6337661, 0, 1, 0.572549, 1,
-0.1924556, 0.06030716, -2.112646, 0, 1, 0.5803922, 1,
-0.1868649, -1.35922, -3.077146, 0, 1, 0.5843138, 1,
-0.1849622, -1.690768, -2.346687, 0, 1, 0.5921569, 1,
-0.1844432, -0.957735, -2.847332, 0, 1, 0.5960785, 1,
-0.1826361, 0.2735524, -0.003182396, 0, 1, 0.6039216, 1,
-0.1781409, -0.6593468, -2.217752, 0, 1, 0.6117647, 1,
-0.1741421, 0.6349731, 0.3860193, 0, 1, 0.6156863, 1,
-0.1739321, -0.02035298, -0.554288, 0, 1, 0.6235294, 1,
-0.1667972, -0.125293, -3.201887, 0, 1, 0.627451, 1,
-0.1666171, -0.6340328, -3.3376, 0, 1, 0.6352941, 1,
-0.1661049, 0.136207, -1.374814, 0, 1, 0.6392157, 1,
-0.1637308, 0.5381085, 1.082096, 0, 1, 0.6470588, 1,
-0.1621064, 0.08003484, -0.5684968, 0, 1, 0.6509804, 1,
-0.1540596, -0.4219441, -3.754752, 0, 1, 0.6588235, 1,
-0.1531305, -0.2177157, -0.4008604, 0, 1, 0.6627451, 1,
-0.1524651, -0.7486795, -3.613616, 0, 1, 0.6705883, 1,
-0.1514019, 0.06107829, -1.110714, 0, 1, 0.6745098, 1,
-0.1479192, -0.5568471, -2.189904, 0, 1, 0.682353, 1,
-0.146503, 0.267832, -0.3902676, 0, 1, 0.6862745, 1,
-0.1457381, 0.3821513, -0.3075345, 0, 1, 0.6941177, 1,
-0.1422423, 2.787466, -0.577591, 0, 1, 0.7019608, 1,
-0.1389646, -0.1716813, -2.992402, 0, 1, 0.7058824, 1,
-0.1386072, -1.560068, -3.566697, 0, 1, 0.7137255, 1,
-0.1381951, 0.6214507, -1.677123, 0, 1, 0.7176471, 1,
-0.1381705, 0.2443173, -1.288429, 0, 1, 0.7254902, 1,
-0.1366877, 1.229155, -0.1383788, 0, 1, 0.7294118, 1,
-0.1324025, 0.03658311, -1.79142, 0, 1, 0.7372549, 1,
-0.1291436, -1.019765, -4.041557, 0, 1, 0.7411765, 1,
-0.1284677, -0.6530696, -2.914012, 0, 1, 0.7490196, 1,
-0.1275967, 2.373211, 0.2289712, 0, 1, 0.7529412, 1,
-0.1218176, 0.7481574, 0.9276899, 0, 1, 0.7607843, 1,
-0.1215473, 0.4985035, 1.404828, 0, 1, 0.7647059, 1,
-0.1197883, -1.590965, -1.610251, 0, 1, 0.772549, 1,
-0.11771, -0.3247653, -0.5570642, 0, 1, 0.7764706, 1,
-0.1153935, -0.109048, -0.2100397, 0, 1, 0.7843137, 1,
-0.1139966, -0.851105, -4.892028, 0, 1, 0.7882353, 1,
-0.1121154, 1.213619, -2.330497, 0, 1, 0.7960784, 1,
-0.1120229, 0.9477782, 1.755072, 0, 1, 0.8039216, 1,
-0.1101264, 0.2398419, -0.6947125, 0, 1, 0.8078431, 1,
-0.1059564, -1.430357, -3.424237, 0, 1, 0.8156863, 1,
-0.1018148, 1.880107, -0.3207368, 0, 1, 0.8196079, 1,
-0.09696618, -0.5672905, -2.318917, 0, 1, 0.827451, 1,
-0.09239575, 0.536055, -1.108218, 0, 1, 0.8313726, 1,
-0.08718204, 0.3334157, -1.063367, 0, 1, 0.8392157, 1,
-0.08359799, 0.4111255, 0.9361276, 0, 1, 0.8431373, 1,
-0.0798301, 2.205428, 0.7304649, 0, 1, 0.8509804, 1,
-0.07752925, 0.007723971, -2.33568, 0, 1, 0.854902, 1,
-0.07518762, -0.2863624, -2.356656, 0, 1, 0.8627451, 1,
-0.07320062, 0.3202252, 0.06100709, 0, 1, 0.8666667, 1,
-0.07059144, -2.010737, -3.052059, 0, 1, 0.8745098, 1,
-0.06698025, -0.08040243, -3.638651, 0, 1, 0.8784314, 1,
-0.06622049, -0.1818403, -2.520319, 0, 1, 0.8862745, 1,
-0.06512176, -3.241946, -3.895495, 0, 1, 0.8901961, 1,
-0.05837874, 1.134086, -0.2789237, 0, 1, 0.8980392, 1,
-0.05804314, -0.06867223, -3.22465, 0, 1, 0.9058824, 1,
-0.05413917, 1.080304, -0.5904579, 0, 1, 0.9098039, 1,
-0.05397559, 0.09275801, -1.171074, 0, 1, 0.9176471, 1,
-0.0519672, 0.2929989, 2.719857, 0, 1, 0.9215686, 1,
-0.05188528, 0.5000891, 0.2720123, 0, 1, 0.9294118, 1,
-0.05056652, 0.9317247, 0.08403616, 0, 1, 0.9333333, 1,
-0.04896165, -1.390635, -4.475553, 0, 1, 0.9411765, 1,
-0.0433028, -0.5064031, -4.899593, 0, 1, 0.945098, 1,
-0.04319525, -1.045738, -5.282144, 0, 1, 0.9529412, 1,
-0.0404848, 2.235178, -0.2070719, 0, 1, 0.9568627, 1,
-0.03907681, 0.9477282, -0.4677323, 0, 1, 0.9647059, 1,
-0.03125394, 0.5390168, 1.09998, 0, 1, 0.9686275, 1,
-0.02966583, -0.7026892, -1.346269, 0, 1, 0.9764706, 1,
-0.02865715, 1.812158, -0.08181672, 0, 1, 0.9803922, 1,
-0.02722136, 0.7088012, 0.0794832, 0, 1, 0.9882353, 1,
-0.02494205, -0.9466906, -2.243097, 0, 1, 0.9921569, 1,
-0.0245595, 0.1403363, 1.653315, 0, 1, 1, 1,
-0.02326442, 0.2021141, -0.1280476, 0, 0.9921569, 1, 1,
-0.02241971, 1.02095, 0.3384675, 0, 0.9882353, 1, 1,
-0.02214909, 0.2382475, -1.215453, 0, 0.9803922, 1, 1,
-0.02093066, -1.123831, -3.537399, 0, 0.9764706, 1, 1,
-0.02049004, 1.712882, 0.679855, 0, 0.9686275, 1, 1,
-0.01448678, 0.2251128, 0.8643129, 0, 0.9647059, 1, 1,
-0.01427482, -0.8658137, -3.53273, 0, 0.9568627, 1, 1,
-0.01415488, 0.5149541, 0.1943903, 0, 0.9529412, 1, 1,
-0.01232084, 0.1348982, 0.7523712, 0, 0.945098, 1, 1,
-0.01192532, -0.6431485, -2.979152, 0, 0.9411765, 1, 1,
-0.01117118, 0.4813663, 0.06033367, 0, 0.9333333, 1, 1,
-0.01116759, 1.628497, 0.1007266, 0, 0.9294118, 1, 1,
-0.006586145, -0.8112349, -4.106432, 0, 0.9215686, 1, 1,
-0.006497495, -1.946703, -1.826329, 0, 0.9176471, 1, 1,
-0.002975093, -0.4489792, -1.556899, 0, 0.9098039, 1, 1,
-0.002437581, -1.481649, -2.448731, 0, 0.9058824, 1, 1,
-0.001387052, 0.2021624, -0.1110224, 0, 0.8980392, 1, 1,
-0.001177133, 1.237924, -0.8457398, 0, 0.8901961, 1, 1,
0.004020875, -0.2388376, 3.34444, 0, 0.8862745, 1, 1,
0.004691126, 0.002646916, 1.880965, 0, 0.8784314, 1, 1,
0.004823522, -0.231965, 3.163017, 0, 0.8745098, 1, 1,
0.005969456, -0.08613002, 2.638054, 0, 0.8666667, 1, 1,
0.007985324, -0.1468739, 3.336403, 0, 0.8627451, 1, 1,
0.01162625, 1.269928, -0.08078477, 0, 0.854902, 1, 1,
0.0120067, 1.553499, -1.303141, 0, 0.8509804, 1, 1,
0.02560481, -0.3658934, 4.357172, 0, 0.8431373, 1, 1,
0.02897638, 0.04319757, -0.09317444, 0, 0.8392157, 1, 1,
0.03683828, 0.009907648, -1.160907, 0, 0.8313726, 1, 1,
0.03732127, -0.5772563, 2.472382, 0, 0.827451, 1, 1,
0.04212179, -0.5659229, 2.823547, 0, 0.8196079, 1, 1,
0.04595494, -0.5984644, 3.702373, 0, 0.8156863, 1, 1,
0.05015506, 1.191997, 1.117411, 0, 0.8078431, 1, 1,
0.05292802, 0.3015071, 0.107256, 0, 0.8039216, 1, 1,
0.05887223, 0.2456962, 0.1469924, 0, 0.7960784, 1, 1,
0.05897402, -0.3620278, 3.373426, 0, 0.7882353, 1, 1,
0.06012948, 0.419196, 1.768324, 0, 0.7843137, 1, 1,
0.06092035, -0.9180185, 2.676013, 0, 0.7764706, 1, 1,
0.06184246, 0.9765685, 1.396106, 0, 0.772549, 1, 1,
0.06381958, -1.302184, 5.077899, 0, 0.7647059, 1, 1,
0.06383948, -0.9569152, 3.183258, 0, 0.7607843, 1, 1,
0.06601535, 0.9542829, -0.5943479, 0, 0.7529412, 1, 1,
0.06640558, 2.0973, 0.5575191, 0, 0.7490196, 1, 1,
0.0678796, -1.091564, 3.573302, 0, 0.7411765, 1, 1,
0.07178768, -1.033594, 2.608823, 0, 0.7372549, 1, 1,
0.07243166, -0.3983392, 2.914063, 0, 0.7294118, 1, 1,
0.0797608, -1.650976, 3.035563, 0, 0.7254902, 1, 1,
0.07991101, 2.396373, -0.8674965, 0, 0.7176471, 1, 1,
0.08249565, -0.4118619, 4.489521, 0, 0.7137255, 1, 1,
0.08399292, -0.8049185, 4.183601, 0, 0.7058824, 1, 1,
0.08564074, 0.5610936, -1.032927, 0, 0.6980392, 1, 1,
0.08592025, 0.8367704, 0.1225464, 0, 0.6941177, 1, 1,
0.08696126, 1.765825, -0.8418906, 0, 0.6862745, 1, 1,
0.09025791, 0.8657524, -0.9577399, 0, 0.682353, 1, 1,
0.09244263, 0.8912491, 0.9780325, 0, 0.6745098, 1, 1,
0.09315997, -0.2243197, 3.447452, 0, 0.6705883, 1, 1,
0.09360204, -0.4723706, 1.600811, 0, 0.6627451, 1, 1,
0.09662917, -1.103701, 2.217243, 0, 0.6588235, 1, 1,
0.1037435, -1.025769, 3.649456, 0, 0.6509804, 1, 1,
0.1066855, 0.6499285, 0.555174, 0, 0.6470588, 1, 1,
0.1078947, -0.2300591, 3.153822, 0, 0.6392157, 1, 1,
0.1124628, 0.09133045, 1.262195, 0, 0.6352941, 1, 1,
0.1135686, 0.5156014, -0.08533909, 0, 0.627451, 1, 1,
0.1136151, -1.831595, 1.758408, 0, 0.6235294, 1, 1,
0.1221843, 0.9402101, 0.3833922, 0, 0.6156863, 1, 1,
0.123624, -1.353043, 1.441069, 0, 0.6117647, 1, 1,
0.1248061, -0.3662259, 3.053669, 0, 0.6039216, 1, 1,
0.1248355, 0.006285854, 3.141671, 0, 0.5960785, 1, 1,
0.1307572, -0.4623072, 2.188725, 0, 0.5921569, 1, 1,
0.1329519, 2.088371, 1.345888, 0, 0.5843138, 1, 1,
0.1352921, 0.9294604, -1.113418, 0, 0.5803922, 1, 1,
0.1380747, 0.9041164, -0.5467058, 0, 0.572549, 1, 1,
0.1406807, -1.245175, 2.240374, 0, 0.5686275, 1, 1,
0.1443814, -2.237545, 4.116338, 0, 0.5607843, 1, 1,
0.1462718, -0.3535085, 0.9849994, 0, 0.5568628, 1, 1,
0.1505278, -0.1293972, 2.410874, 0, 0.5490196, 1, 1,
0.1617753, 0.8087832, 0.4654048, 0, 0.5450981, 1, 1,
0.1640607, -1.585811, 2.408517, 0, 0.5372549, 1, 1,
0.165875, -0.3427601, 3.476691, 0, 0.5333334, 1, 1,
0.1664123, 1.534696, 0.2901488, 0, 0.5254902, 1, 1,
0.1709338, -0.03997511, 2.159279, 0, 0.5215687, 1, 1,
0.172851, 0.6468642, -0.9803029, 0, 0.5137255, 1, 1,
0.1736638, 1.222363, -0.7957243, 0, 0.509804, 1, 1,
0.1779367, 0.3303477, 0.645888, 0, 0.5019608, 1, 1,
0.179385, 1.005903, -0.3793891, 0, 0.4941176, 1, 1,
0.186784, 0.801781, 0.01646488, 0, 0.4901961, 1, 1,
0.1882568, 0.781601, 0.1435704, 0, 0.4823529, 1, 1,
0.190402, 0.3017061, 1.641064, 0, 0.4784314, 1, 1,
0.1927547, -1.244819, 2.736213, 0, 0.4705882, 1, 1,
0.203196, -1.366551, 3.236143, 0, 0.4666667, 1, 1,
0.2066226, -0.4445741, 1.319922, 0, 0.4588235, 1, 1,
0.2103982, -1.909867, 3.746919, 0, 0.454902, 1, 1,
0.2110444, 0.3406206, 0.9037153, 0, 0.4470588, 1, 1,
0.2141832, 0.7064625, 0.09221762, 0, 0.4431373, 1, 1,
0.2141838, -0.9925494, 4.755448, 0, 0.4352941, 1, 1,
0.2143256, -0.11129, 1.893607, 0, 0.4313726, 1, 1,
0.2168373, 1.611369, 0.4116715, 0, 0.4235294, 1, 1,
0.2177891, 0.3954016, -1.645652, 0, 0.4196078, 1, 1,
0.2189767, -0.4712459, 4.741667, 0, 0.4117647, 1, 1,
0.2199257, 1.048552, 1.236299, 0, 0.4078431, 1, 1,
0.2206665, 0.9635707, -0.3415784, 0, 0.4, 1, 1,
0.2247535, -0.7625473, 3.310518, 0, 0.3921569, 1, 1,
0.2268618, 0.9868758, -1.010061, 0, 0.3882353, 1, 1,
0.2283393, 0.1027385, 1.211127, 0, 0.3803922, 1, 1,
0.2311134, -0.7041575, 3.468324, 0, 0.3764706, 1, 1,
0.2347392, -1.352744, 1.99239, 0, 0.3686275, 1, 1,
0.2446994, 1.363553, -1.288695, 0, 0.3647059, 1, 1,
0.2459926, 0.006806172, 1.63757, 0, 0.3568628, 1, 1,
0.2512766, 0.2057636, 0.6221545, 0, 0.3529412, 1, 1,
0.2513394, -0.006307565, 1.298016, 0, 0.345098, 1, 1,
0.2611961, -2.622321, 2.257117, 0, 0.3411765, 1, 1,
0.261571, 0.7661028, 0.006058163, 0, 0.3333333, 1, 1,
0.2617596, 0.02686184, 1.507164, 0, 0.3294118, 1, 1,
0.2676063, -1.982265, 2.390211, 0, 0.3215686, 1, 1,
0.2715745, 0.3024154, 1.743741, 0, 0.3176471, 1, 1,
0.2754692, -1.140103, 2.266429, 0, 0.3098039, 1, 1,
0.2784547, 2.94074, -0.2972969, 0, 0.3058824, 1, 1,
0.2793927, -1.213085, 2.452492, 0, 0.2980392, 1, 1,
0.280259, -1.877175, 2.985853, 0, 0.2901961, 1, 1,
0.2817889, 1.325344, -0.1846095, 0, 0.2862745, 1, 1,
0.2831414, 0.0468088, 2.660135, 0, 0.2784314, 1, 1,
0.2833488, 0.3672591, 0.8688988, 0, 0.2745098, 1, 1,
0.2858621, 0.5143492, 0.5919033, 0, 0.2666667, 1, 1,
0.2871935, 0.205512, -1.595198, 0, 0.2627451, 1, 1,
0.2914334, -1.640627, 1.527196, 0, 0.254902, 1, 1,
0.2919845, -0.8592151, 3.578016, 0, 0.2509804, 1, 1,
0.2929529, 1.948457, -1.292649, 0, 0.2431373, 1, 1,
0.2940593, 0.6638266, 0.2637708, 0, 0.2392157, 1, 1,
0.295424, -0.3910908, 1.696034, 0, 0.2313726, 1, 1,
0.2959188, 0.1671909, -0.6025091, 0, 0.227451, 1, 1,
0.3012267, 1.502779, 0.9653524, 0, 0.2196078, 1, 1,
0.3012567, 0.1817835, -0.2130813, 0, 0.2156863, 1, 1,
0.3051826, 0.1330873, 1.804822, 0, 0.2078431, 1, 1,
0.3061295, 0.3267346, 2.057008, 0, 0.2039216, 1, 1,
0.3080717, 0.1250887, 1.227694, 0, 0.1960784, 1, 1,
0.3090856, 0.03630734, 0.5991681, 0, 0.1882353, 1, 1,
0.3110983, 0.7822652, 2.293489, 0, 0.1843137, 1, 1,
0.3127632, -1.339893, 4.055831, 0, 0.1764706, 1, 1,
0.3133751, -1.950433, 1.543329, 0, 0.172549, 1, 1,
0.3136843, -1.254192, 3.70322, 0, 0.1647059, 1, 1,
0.3180782, 0.4767044, 2.030034, 0, 0.1607843, 1, 1,
0.3209609, -1.295723, 2.412724, 0, 0.1529412, 1, 1,
0.3218439, -0.520451, 2.388499, 0, 0.1490196, 1, 1,
0.3219806, 1.051686, 0.2792032, 0, 0.1411765, 1, 1,
0.3303803, -0.5482771, 1.479993, 0, 0.1372549, 1, 1,
0.3330915, 0.9180964, 1.834133, 0, 0.1294118, 1, 1,
0.337788, -1.383305, 2.626194, 0, 0.1254902, 1, 1,
0.3388851, -0.8831756, 3.041022, 0, 0.1176471, 1, 1,
0.3389492, -0.7966112, 2.326607, 0, 0.1137255, 1, 1,
0.3418337, -0.3624156, 1.269028, 0, 0.1058824, 1, 1,
0.3448388, -0.3822812, 2.132653, 0, 0.09803922, 1, 1,
0.3466974, 1.08259, -1.061278, 0, 0.09411765, 1, 1,
0.3467836, -1.389494, 2.623575, 0, 0.08627451, 1, 1,
0.3472632, 0.05222102, 1.896583, 0, 0.08235294, 1, 1,
0.3480774, -0.5353994, 1.749357, 0, 0.07450981, 1, 1,
0.3493759, -0.8389159, 4.366738, 0, 0.07058824, 1, 1,
0.3548028, -2.054487, 3.439805, 0, 0.0627451, 1, 1,
0.3565429, 1.291684, 0.5420848, 0, 0.05882353, 1, 1,
0.3570628, -0.8937861, 3.394267, 0, 0.05098039, 1, 1,
0.3629499, -0.9595879, 3.442157, 0, 0.04705882, 1, 1,
0.3673874, 0.678929, -0.742784, 0, 0.03921569, 1, 1,
0.3762513, 0.6360179, 1.690993, 0, 0.03529412, 1, 1,
0.377376, 1.53272, 0.9362221, 0, 0.02745098, 1, 1,
0.3823811, -0.867561, 2.160095, 0, 0.02352941, 1, 1,
0.3851261, -1.281213, 1.985742, 0, 0.01568628, 1, 1,
0.3888611, -0.2173499, 2.183682, 0, 0.01176471, 1, 1,
0.390685, -2.730351, 2.864269, 0, 0.003921569, 1, 1,
0.3951134, -0.9680793, 2.356081, 0.003921569, 0, 1, 1,
0.4009198, 0.2973416, 0.349163, 0.007843138, 0, 1, 1,
0.4019623, -0.5674207, 3.109551, 0.01568628, 0, 1, 1,
0.4034223, 1.086441, 0.6183829, 0.01960784, 0, 1, 1,
0.4060172, -0.4243074, 4.63086, 0.02745098, 0, 1, 1,
0.4081914, 0.1842888, 0.3372398, 0.03137255, 0, 1, 1,
0.4098223, -0.326136, 2.055026, 0.03921569, 0, 1, 1,
0.4116883, -1.66401, 3.09336, 0.04313726, 0, 1, 1,
0.4124343, -0.4867098, 2.739416, 0.05098039, 0, 1, 1,
0.414008, 1.136321, 0.8876826, 0.05490196, 0, 1, 1,
0.4154367, 1.445474, 0.2969694, 0.0627451, 0, 1, 1,
0.4253068, 1.425082, -0.5794454, 0.06666667, 0, 1, 1,
0.4350509, 0.7529566, 0.5063324, 0.07450981, 0, 1, 1,
0.4377298, -0.5653796, 2.001894, 0.07843138, 0, 1, 1,
0.441755, 0.4203761, -0.06075856, 0.08627451, 0, 1, 1,
0.4445488, -0.2242074, 2.538652, 0.09019608, 0, 1, 1,
0.4529763, -0.6674293, 4.104945, 0.09803922, 0, 1, 1,
0.453545, 0.05733348, 2.162416, 0.1058824, 0, 1, 1,
0.4641371, 1.353141, -1.43375, 0.1098039, 0, 1, 1,
0.4674619, 0.2805886, 2.079018, 0.1176471, 0, 1, 1,
0.4692592, -1.365272, 3.687982, 0.1215686, 0, 1, 1,
0.4709548, 0.02343746, 2.196317, 0.1294118, 0, 1, 1,
0.4729528, 0.5489082, 1.022933, 0.1333333, 0, 1, 1,
0.4740927, -0.3373354, 2.746332, 0.1411765, 0, 1, 1,
0.474765, 1.676883, -0.3158732, 0.145098, 0, 1, 1,
0.4774827, -0.6178471, 4.462243, 0.1529412, 0, 1, 1,
0.4780723, -0.2801352, -0.1961909, 0.1568628, 0, 1, 1,
0.4788037, 1.704937, 0.2617422, 0.1647059, 0, 1, 1,
0.4797593, 1.216157, -0.1856301, 0.1686275, 0, 1, 1,
0.4802929, 0.7682683, 2.009481, 0.1764706, 0, 1, 1,
0.4809469, -0.2537577, 2.153515, 0.1803922, 0, 1, 1,
0.4812304, 0.7502032, 1.348665, 0.1882353, 0, 1, 1,
0.4830986, -0.8669102, 2.482207, 0.1921569, 0, 1, 1,
0.4866665, -0.02148257, 2.481284, 0.2, 0, 1, 1,
0.4930653, 0.2236841, 0.513291, 0.2078431, 0, 1, 1,
0.4932546, -0.2254925, 1.928846, 0.2117647, 0, 1, 1,
0.4947413, -0.5908379, 2.833151, 0.2196078, 0, 1, 1,
0.4952075, -0.4946569, 3.145702, 0.2235294, 0, 1, 1,
0.4961359, 0.8091974, -0.4389382, 0.2313726, 0, 1, 1,
0.4979153, -1.501876, 3.212197, 0.2352941, 0, 1, 1,
0.5040634, 2.306337, 0.9357947, 0.2431373, 0, 1, 1,
0.5042681, 0.5925833, 2.240955, 0.2470588, 0, 1, 1,
0.5053372, 0.9262835, 1.960063, 0.254902, 0, 1, 1,
0.505706, -0.7194231, 3.772068, 0.2588235, 0, 1, 1,
0.5081664, 0.4365973, 0.3176759, 0.2666667, 0, 1, 1,
0.5093985, 0.7735124, 0.8523673, 0.2705882, 0, 1, 1,
0.5172893, -0.2541645, 2.265165, 0.2784314, 0, 1, 1,
0.5177867, -0.8135946, 3.693079, 0.282353, 0, 1, 1,
0.5178614, 1.333434, 0.6212686, 0.2901961, 0, 1, 1,
0.5225889, -0.937397, 3.431203, 0.2941177, 0, 1, 1,
0.5227944, 0.3338087, -1.549717, 0.3019608, 0, 1, 1,
0.5231057, -0.3472899, 2.184322, 0.3098039, 0, 1, 1,
0.524029, 0.4385429, -0.6017101, 0.3137255, 0, 1, 1,
0.5290298, 0.2614694, 1.803643, 0.3215686, 0, 1, 1,
0.5355247, 1.781362, -1.219826, 0.3254902, 0, 1, 1,
0.5407535, -0.4875695, 3.548399, 0.3333333, 0, 1, 1,
0.5420577, 0.00886727, 3.079984, 0.3372549, 0, 1, 1,
0.5444766, 0.2162901, 0.06542532, 0.345098, 0, 1, 1,
0.5493408, -0.835319, 2.379649, 0.3490196, 0, 1, 1,
0.5498672, -0.006838249, 0.4261312, 0.3568628, 0, 1, 1,
0.5504148, -0.2563971, 2.733126, 0.3607843, 0, 1, 1,
0.552184, 0.6644827, 1.275184, 0.3686275, 0, 1, 1,
0.5528675, -0.1558081, 1.287339, 0.372549, 0, 1, 1,
0.5553278, -1.176121, 3.713623, 0.3803922, 0, 1, 1,
0.5558124, 1.10098, 0.5231265, 0.3843137, 0, 1, 1,
0.557522, 0.1302134, 4.072521, 0.3921569, 0, 1, 1,
0.5599584, 0.374581, 1.921028, 0.3960784, 0, 1, 1,
0.5613019, 0.9687442, -1.277104, 0.4039216, 0, 1, 1,
0.5617549, -0.2707922, 3.018427, 0.4117647, 0, 1, 1,
0.56383, 0.7776469, -0.4442537, 0.4156863, 0, 1, 1,
0.5657996, -0.06920422, 1.157702, 0.4235294, 0, 1, 1,
0.5664849, 2.086419, 0.4483269, 0.427451, 0, 1, 1,
0.56955, 0.4006377, 2.518973, 0.4352941, 0, 1, 1,
0.5797952, 0.4416912, 1.606268, 0.4392157, 0, 1, 1,
0.5806754, -0.3528808, 2.981411, 0.4470588, 0, 1, 1,
0.58233, 2.032458, -0.678422, 0.4509804, 0, 1, 1,
0.5879474, 1.904561, -0.5713934, 0.4588235, 0, 1, 1,
0.5923203, -0.2405786, 1.077626, 0.4627451, 0, 1, 1,
0.5925954, 0.5411654, 3.787789, 0.4705882, 0, 1, 1,
0.6044958, 0.3932852, 3.348615, 0.4745098, 0, 1, 1,
0.6048599, 0.8354176, -0.01145883, 0.4823529, 0, 1, 1,
0.6100168, 0.7869915, 0.8517845, 0.4862745, 0, 1, 1,
0.6107146, 1.317679, 1.179745, 0.4941176, 0, 1, 1,
0.6153553, -0.4693644, 2.67616, 0.5019608, 0, 1, 1,
0.6193669, -0.009895881, 2.207206, 0.5058824, 0, 1, 1,
0.6232883, 1.200642, 1.152188, 0.5137255, 0, 1, 1,
0.6241368, -0.3481371, 1.615355, 0.5176471, 0, 1, 1,
0.6351429, 0.5165565, 1.062857, 0.5254902, 0, 1, 1,
0.6364192, 1.503555, -1.847356, 0.5294118, 0, 1, 1,
0.6385819, 0.8659892, 1.061934, 0.5372549, 0, 1, 1,
0.6393475, -1.77402, 4.415104, 0.5411765, 0, 1, 1,
0.6415923, 0.01149678, 2.606736, 0.5490196, 0, 1, 1,
0.6435015, -0.3904237, 1.276071, 0.5529412, 0, 1, 1,
0.6484367, 1.699853, 0.1025124, 0.5607843, 0, 1, 1,
0.6486741, 1.986115, -1.039838, 0.5647059, 0, 1, 1,
0.6523632, 0.461743, -0.9343496, 0.572549, 0, 1, 1,
0.6539262, 0.2707283, 0.1489209, 0.5764706, 0, 1, 1,
0.6612586, 0.4966619, 2.449461, 0.5843138, 0, 1, 1,
0.6622251, -1.279324, 2.640274, 0.5882353, 0, 1, 1,
0.663999, 1.017889, -0.4664313, 0.5960785, 0, 1, 1,
0.6681907, -0.1933915, 2.299541, 0.6039216, 0, 1, 1,
0.6684653, 0.420891, 1.401736, 0.6078432, 0, 1, 1,
0.6703141, 0.6796663, 0.9678772, 0.6156863, 0, 1, 1,
0.6709264, -0.9882701, 2.812649, 0.6196079, 0, 1, 1,
0.6750916, 0.926983, 3.770784, 0.627451, 0, 1, 1,
0.6762213, -1.459793, 3.277645, 0.6313726, 0, 1, 1,
0.6793481, 0.9359201, 0.9455353, 0.6392157, 0, 1, 1,
0.6802021, 1.496847, 0.6039507, 0.6431373, 0, 1, 1,
0.6804491, -0.1390748, 0.6502447, 0.6509804, 0, 1, 1,
0.6804787, 0.2667803, 4.696033, 0.654902, 0, 1, 1,
0.6888306, -1.54375, 3.133748, 0.6627451, 0, 1, 1,
0.6920266, -0.1615253, 2.853759, 0.6666667, 0, 1, 1,
0.6961238, -2.147868, 1.85044, 0.6745098, 0, 1, 1,
0.6980729, 1.62854, -1.124003, 0.6784314, 0, 1, 1,
0.6983721, 0.2585167, 2.543854, 0.6862745, 0, 1, 1,
0.6986194, -0.494598, 1.882236, 0.6901961, 0, 1, 1,
0.7004578, -0.5917077, 3.989858, 0.6980392, 0, 1, 1,
0.7013765, -0.6468285, 2.460072, 0.7058824, 0, 1, 1,
0.703378, -1.880046, 3.099474, 0.7098039, 0, 1, 1,
0.7038236, -0.2645119, 2.602176, 0.7176471, 0, 1, 1,
0.7090272, -0.8037214, 2.514176, 0.7215686, 0, 1, 1,
0.7127095, -0.4765747, 2.03768, 0.7294118, 0, 1, 1,
0.7158804, 2.126643, -0.07431449, 0.7333333, 0, 1, 1,
0.7174326, -0.2733061, 1.536196, 0.7411765, 0, 1, 1,
0.7177521, -0.5467681, 2.754408, 0.7450981, 0, 1, 1,
0.7208366, -0.1793712, 2.502084, 0.7529412, 0, 1, 1,
0.7237577, 1.200733, -0.4363485, 0.7568628, 0, 1, 1,
0.7254634, -1.172827, 2.114738, 0.7647059, 0, 1, 1,
0.7262326, 0.1602145, 1.606454, 0.7686275, 0, 1, 1,
0.7368361, 0.7707738, 1.382499, 0.7764706, 0, 1, 1,
0.7387011, -0.1828161, 3.279665, 0.7803922, 0, 1, 1,
0.7424297, -1.00672, 1.363089, 0.7882353, 0, 1, 1,
0.7446622, 0.4369401, 3.028325, 0.7921569, 0, 1, 1,
0.749253, -0.6966387, 2.131241, 0.8, 0, 1, 1,
0.7508553, 1.685879, 2.268094, 0.8078431, 0, 1, 1,
0.7543649, 0.19916, 0.6668738, 0.8117647, 0, 1, 1,
0.7620412, 0.02172265, 1.268115, 0.8196079, 0, 1, 1,
0.7649138, 0.06055279, 0.1640335, 0.8235294, 0, 1, 1,
0.7670738, 0.3351008, 1.298681, 0.8313726, 0, 1, 1,
0.7672636, -1.650291, 2.449273, 0.8352941, 0, 1, 1,
0.7673097, -0.9075621, 1.688704, 0.8431373, 0, 1, 1,
0.7685543, 0.1118635, 0.7772126, 0.8470588, 0, 1, 1,
0.7785434, -1.035021, 1.925099, 0.854902, 0, 1, 1,
0.7803673, -0.6936975, 2.601281, 0.8588235, 0, 1, 1,
0.781909, 0.06782743, 1.24707, 0.8666667, 0, 1, 1,
0.7827659, 0.8436464, 1.504494, 0.8705882, 0, 1, 1,
0.7843065, -0.5399112, 4.851409, 0.8784314, 0, 1, 1,
0.7856961, -0.4910628, 3.84321, 0.8823529, 0, 1, 1,
0.7869561, -0.6553217, 2.122595, 0.8901961, 0, 1, 1,
0.7964634, -0.4512863, -0.07846454, 0.8941177, 0, 1, 1,
0.7990974, -0.09445429, 1.06549, 0.9019608, 0, 1, 1,
0.8029367, 0.07093476, 0.8386502, 0.9098039, 0, 1, 1,
0.8053313, 0.5552695, 0.7369079, 0.9137255, 0, 1, 1,
0.8072706, 0.6785641, 0.8998382, 0.9215686, 0, 1, 1,
0.8090382, -0.8993794, 1.544337, 0.9254902, 0, 1, 1,
0.8102096, 0.1157338, 3.782094, 0.9333333, 0, 1, 1,
0.8133761, 0.1317494, 1.175749, 0.9372549, 0, 1, 1,
0.814194, -1.442347, 3.429863, 0.945098, 0, 1, 1,
0.8254764, -0.7317334, 2.5238, 0.9490196, 0, 1, 1,
0.8342589, 1.016096, 0.6969149, 0.9568627, 0, 1, 1,
0.8395592, 0.625256, 1.297481, 0.9607843, 0, 1, 1,
0.8430271, 1.119925, -0.4590279, 0.9686275, 0, 1, 1,
0.8447238, -1.599468, 1.849372, 0.972549, 0, 1, 1,
0.8470592, 1.618644, -0.8126973, 0.9803922, 0, 1, 1,
0.8538912, 0.08054458, 2.061403, 0.9843137, 0, 1, 1,
0.8600409, 0.51357, -0.3467244, 0.9921569, 0, 1, 1,
0.8645053, -2.197796, 3.521894, 0.9960784, 0, 1, 1,
0.8670955, 1.471265, -0.680273, 1, 0, 0.9960784, 1,
0.8688232, 0.14725, 0.7236875, 1, 0, 0.9882353, 1,
0.8735993, 0.1302089, 1.156294, 1, 0, 0.9843137, 1,
0.9009145, -0.08758912, 0.3341558, 1, 0, 0.9764706, 1,
0.9013441, 1.076768, 2.641131, 1, 0, 0.972549, 1,
0.9016286, 0.7110029, 0.8705014, 1, 0, 0.9647059, 1,
0.903577, 1.525474, -1.182162, 1, 0, 0.9607843, 1,
0.9043224, -0.8136892, 1.95244, 1, 0, 0.9529412, 1,
0.9108797, -1.329109, 2.389466, 1, 0, 0.9490196, 1,
0.9114282, 1.33562, 1.975216, 1, 0, 0.9411765, 1,
0.9169878, 0.7828378, 1.632151, 1, 0, 0.9372549, 1,
0.9191154, 1.521755, 0.4845706, 1, 0, 0.9294118, 1,
0.9298326, -0.2215839, 0.01917292, 1, 0, 0.9254902, 1,
0.9329335, 0.8386046, -1.394272, 1, 0, 0.9176471, 1,
0.9341214, 0.8994105, 0.8339914, 1, 0, 0.9137255, 1,
0.9358016, 0.07660107, 0.5091373, 1, 0, 0.9058824, 1,
0.9396785, -0.1472947, 2.798903, 1, 0, 0.9019608, 1,
0.9435974, 0.6950803, 3.212972, 1, 0, 0.8941177, 1,
0.9512457, -0.7302443, 1.064234, 1, 0, 0.8862745, 1,
0.9517615, -0.2694048, 1.933872, 1, 0, 0.8823529, 1,
0.9566507, -1.371406, 2.716336, 1, 0, 0.8745098, 1,
0.962531, -1.198042, 2.144665, 1, 0, 0.8705882, 1,
0.9725903, -0.4965468, 3.194937, 1, 0, 0.8627451, 1,
0.9783888, 2.788486, 1.767478, 1, 0, 0.8588235, 1,
0.9785153, 0.8540134, 2.832904, 1, 0, 0.8509804, 1,
0.9835149, -1.236222, 3.499773, 1, 0, 0.8470588, 1,
0.9997211, 0.8045138, -1.061056, 1, 0, 0.8392157, 1,
1.004065, -0.9845314, 2.344898, 1, 0, 0.8352941, 1,
1.012533, 0.9226462, 0.367682, 1, 0, 0.827451, 1,
1.015723, 0.5827123, 2.064474, 1, 0, 0.8235294, 1,
1.018126, 0.8906488, 2.260808, 1, 0, 0.8156863, 1,
1.025075, 0.7763158, -0.5287017, 1, 0, 0.8117647, 1,
1.025462, 0.1104857, -0.2783601, 1, 0, 0.8039216, 1,
1.041217, 0.7562726, 2.712722, 1, 0, 0.7960784, 1,
1.042015, -1.154255, 1.995128, 1, 0, 0.7921569, 1,
1.047198, 0.7466763, 0.475087, 1, 0, 0.7843137, 1,
1.053676, -2.373574, 3.59361, 1, 0, 0.7803922, 1,
1.061103, -0.5909533, 2.408006, 1, 0, 0.772549, 1,
1.061965, 1.261777, 0.8479912, 1, 0, 0.7686275, 1,
1.066877, -0.7883286, 0.1769676, 1, 0, 0.7607843, 1,
1.070423, 0.6109593, 0.2459994, 1, 0, 0.7568628, 1,
1.070609, 0.2344814, 1.061661, 1, 0, 0.7490196, 1,
1.085485, 0.7876255, 1.627049, 1, 0, 0.7450981, 1,
1.090419, 0.8912315, 1.409132, 1, 0, 0.7372549, 1,
1.100072, -0.8164815, 2.874031, 1, 0, 0.7333333, 1,
1.104804, -0.9623554, 3.221385, 1, 0, 0.7254902, 1,
1.11425, -0.5909028, 1.989282, 1, 0, 0.7215686, 1,
1.114898, 0.3904931, 1.791657, 1, 0, 0.7137255, 1,
1.115421, 0.139699, 0.2369469, 1, 0, 0.7098039, 1,
1.121603, 0.9665294, 1.466938, 1, 0, 0.7019608, 1,
1.126953, 0.7919753, 1.158885, 1, 0, 0.6941177, 1,
1.135819, 0.3685343, 0.4431618, 1, 0, 0.6901961, 1,
1.136002, 0.003525984, -0.04951316, 1, 0, 0.682353, 1,
1.136432, 0.3495852, 2.332359, 1, 0, 0.6784314, 1,
1.139913, 2.17646, 1.044073, 1, 0, 0.6705883, 1,
1.140137, 0.5581584, -0.4709624, 1, 0, 0.6666667, 1,
1.143799, 1.581623, 0.07955669, 1, 0, 0.6588235, 1,
1.153193, 1.881879, -0.4305242, 1, 0, 0.654902, 1,
1.154276, -2.149016, 3.182479, 1, 0, 0.6470588, 1,
1.154956, 2.604802, 1.77167, 1, 0, 0.6431373, 1,
1.156958, 0.9960617, -0.2909335, 1, 0, 0.6352941, 1,
1.158085, 2.228726, -1.886517, 1, 0, 0.6313726, 1,
1.168386, -0.3691911, 0.6701673, 1, 0, 0.6235294, 1,
1.170789, 0.5622609, 0.6468577, 1, 0, 0.6196079, 1,
1.18569, 1.623352, 0.9436303, 1, 0, 0.6117647, 1,
1.186637, -0.6810858, 0.4333606, 1, 0, 0.6078432, 1,
1.188443, -0.9826649, 1.240183, 1, 0, 0.6, 1,
1.1894, -0.2717542, 3.244063, 1, 0, 0.5921569, 1,
1.191149, -0.1846228, 0.5498179, 1, 0, 0.5882353, 1,
1.200053, -1.939397, 0.9414707, 1, 0, 0.5803922, 1,
1.201203, -0.1942167, 0.6200606, 1, 0, 0.5764706, 1,
1.222962, 1.257744, 0.5700027, 1, 0, 0.5686275, 1,
1.226837, -1.260077, 1.609143, 1, 0, 0.5647059, 1,
1.227206, 2.022111, 1.930588, 1, 0, 0.5568628, 1,
1.235258, -0.7146644, 0.7411833, 1, 0, 0.5529412, 1,
1.246915, 0.6741119, 1.687433, 1, 0, 0.5450981, 1,
1.247534, -0.2183311, 3.59707, 1, 0, 0.5411765, 1,
1.263037, 0.2809877, 2.374812, 1, 0, 0.5333334, 1,
1.265521, -0.2141356, 1.830856, 1, 0, 0.5294118, 1,
1.26911, -0.7079099, 0.8212231, 1, 0, 0.5215687, 1,
1.272514, -0.6277795, 1.564161, 1, 0, 0.5176471, 1,
1.291102, -0.5044183, 1.394022, 1, 0, 0.509804, 1,
1.308871, 0.2790135, 2.979333, 1, 0, 0.5058824, 1,
1.321576, 0.5819291, 0.681998, 1, 0, 0.4980392, 1,
1.326163, -1.913838, 3.004592, 1, 0, 0.4901961, 1,
1.327803, -1.354551, 1.48248, 1, 0, 0.4862745, 1,
1.32925, -0.9384676, 3.247035, 1, 0, 0.4784314, 1,
1.358376, -1.170554, 2.638246, 1, 0, 0.4745098, 1,
1.39112, -0.08963813, 1.235316, 1, 0, 0.4666667, 1,
1.406968, -0.2223403, 0.7108893, 1, 0, 0.4627451, 1,
1.414324, -0.8035367, 1.812352, 1, 0, 0.454902, 1,
1.414532, 0.8407488, 2.839265, 1, 0, 0.4509804, 1,
1.426539, -0.5512595, 2.754117, 1, 0, 0.4431373, 1,
1.429561, 0.5780123, 1.193686, 1, 0, 0.4392157, 1,
1.456051, 0.6909262, 0.8200527, 1, 0, 0.4313726, 1,
1.462463, -1.058537, 2.959312, 1, 0, 0.427451, 1,
1.471014, 0.8381613, 3.170324, 1, 0, 0.4196078, 1,
1.478547, -0.8543863, 2.746783, 1, 0, 0.4156863, 1,
1.484668, -1.093639, 2.876227, 1, 0, 0.4078431, 1,
1.488765, 0.2355521, 2.072019, 1, 0, 0.4039216, 1,
1.49618, -0.6095423, 3.692801, 1, 0, 0.3960784, 1,
1.506596, 0.4469265, 0.7257556, 1, 0, 0.3882353, 1,
1.512871, -0.8489951, 0.8844426, 1, 0, 0.3843137, 1,
1.532513, 0.2571654, 1.245167, 1, 0, 0.3764706, 1,
1.545102, -0.1648842, 2.82183, 1, 0, 0.372549, 1,
1.549704, 0.4239453, -1.146188, 1, 0, 0.3647059, 1,
1.550125, -2.382694, 1.103445, 1, 0, 0.3607843, 1,
1.556457, -1.556461, 2.776743, 1, 0, 0.3529412, 1,
1.559856, 0.9498925, 1.090359, 1, 0, 0.3490196, 1,
1.559885, -1.054601, 2.107745, 1, 0, 0.3411765, 1,
1.56617, 0.6738667, 0.1713, 1, 0, 0.3372549, 1,
1.569441, -1.424397, 3.379404, 1, 0, 0.3294118, 1,
1.574237, 0.9982765, 2.565816, 1, 0, 0.3254902, 1,
1.57447, -1.522064, 2.795982, 1, 0, 0.3176471, 1,
1.574585, 0.891594, 2.171909, 1, 0, 0.3137255, 1,
1.599723, 0.1125484, 1.839762, 1, 0, 0.3058824, 1,
1.609323, -1.212012, 2.292831, 1, 0, 0.2980392, 1,
1.646164, -0.8532036, 2.453958, 1, 0, 0.2941177, 1,
1.660389, 1.334788, 0.4954802, 1, 0, 0.2862745, 1,
1.667428, 2.087797, -1.675875, 1, 0, 0.282353, 1,
1.667766, 1.036475, 0.7426859, 1, 0, 0.2745098, 1,
1.671935, 1.885035, -0.7345453, 1, 0, 0.2705882, 1,
1.678337, 1.638621, 1.123392, 1, 0, 0.2627451, 1,
1.686779, 0.6015902, 0.6286138, 1, 0, 0.2588235, 1,
1.694584, -0.08974133, 0.7074602, 1, 0, 0.2509804, 1,
1.702016, 0.619863, 1.124668, 1, 0, 0.2470588, 1,
1.712249, -1.611685, 0.4555365, 1, 0, 0.2392157, 1,
1.713242, -0.8549815, 2.298829, 1, 0, 0.2352941, 1,
1.733387, 0.5089986, 3.811667, 1, 0, 0.227451, 1,
1.734457, 0.34639, 1.765374, 1, 0, 0.2235294, 1,
1.76485, 0.05602324, 1.869623, 1, 0, 0.2156863, 1,
1.78895, -1.260134, 2.335364, 1, 0, 0.2117647, 1,
1.790863, -0.773509, 0.9384142, 1, 0, 0.2039216, 1,
1.793366, -0.7680579, 1.082642, 1, 0, 0.1960784, 1,
1.802263, 1.317707, 0.571763, 1, 0, 0.1921569, 1,
1.804296, 0.4091132, 0.6822667, 1, 0, 0.1843137, 1,
1.815082, -0.3259556, 0.934517, 1, 0, 0.1803922, 1,
1.830334, -0.02322962, 2.094417, 1, 0, 0.172549, 1,
1.833994, -0.3464922, 2.791339, 1, 0, 0.1686275, 1,
1.848172, -0.8262562, 0.5514972, 1, 0, 0.1607843, 1,
1.866006, 0.5300255, 2.087653, 1, 0, 0.1568628, 1,
1.869781, 0.037109, 0.448052, 1, 0, 0.1490196, 1,
1.873255, 1.585742, 1.702926, 1, 0, 0.145098, 1,
1.877009, -0.6405807, 2.063207, 1, 0, 0.1372549, 1,
1.885366, 1.153102, 1.372136, 1, 0, 0.1333333, 1,
1.891945, 0.2733439, 2.887914, 1, 0, 0.1254902, 1,
1.908438, -0.3546561, 1.464979, 1, 0, 0.1215686, 1,
1.923811, -0.7384288, 1.48072, 1, 0, 0.1137255, 1,
1.923884, -0.1367165, 2.803024, 1, 0, 0.1098039, 1,
1.961702, 1.648569, 3.226269, 1, 0, 0.1019608, 1,
1.974332, 0.242366, 3.139684, 1, 0, 0.09411765, 1,
1.979498, -0.1909325, 1.658011, 1, 0, 0.09019608, 1,
2.039433, -0.343856, 2.441037, 1, 0, 0.08235294, 1,
2.143533, -0.1848632, 2.242625, 1, 0, 0.07843138, 1,
2.192945, 0.1148971, -0.009889114, 1, 0, 0.07058824, 1,
2.205311, 0.7448255, 2.836082, 1, 0, 0.06666667, 1,
2.205599, 0.5354686, 1.665581, 1, 0, 0.05882353, 1,
2.245713, -0.7865306, 0.2114162, 1, 0, 0.05490196, 1,
2.262832, -0.9375482, 1.455394, 1, 0, 0.04705882, 1,
2.324287, 1.157196, -0.08483877, 1, 0, 0.04313726, 1,
2.367831, 1.064524, 2.508566, 1, 0, 0.03529412, 1,
2.394382, -0.6825815, 1.575371, 1, 0, 0.03137255, 1,
2.449859, 1.04193, 0.4440378, 1, 0, 0.02352941, 1,
2.48866, 0.258697, 1.227972, 1, 0, 0.01960784, 1,
2.633574, 1.689124, 0.6363401, 1, 0, 0.01176471, 1,
3.572898, -0.6222525, 1.315318, 1, 0, 0.007843138, 1
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
0.4631764, -4.289911, -7.038171, 0, -0.5, 0.5, 0.5,
0.4631764, -4.289911, -7.038171, 1, -0.5, 0.5, 0.5,
0.4631764, -4.289911, -7.038171, 1, 1.5, 0.5, 0.5,
0.4631764, -4.289911, -7.038171, 0, 1.5, 0.5, 0.5
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
-3.700742, -0.1506026, -7.038171, 0, -0.5, 0.5, 0.5,
-3.700742, -0.1506026, -7.038171, 1, -0.5, 0.5, 0.5,
-3.700742, -0.1506026, -7.038171, 1, 1.5, 0.5, 0.5,
-3.700742, -0.1506026, -7.038171, 0, 1.5, 0.5, 0.5
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
-3.700742, -4.289911, -0.1021228, 0, -0.5, 0.5, 0.5,
-3.700742, -4.289911, -0.1021228, 1, -0.5, 0.5, 0.5,
-3.700742, -4.289911, -0.1021228, 1, 1.5, 0.5, 0.5,
-3.700742, -4.289911, -0.1021228, 0, 1.5, 0.5, 0.5
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
-2, -3.334686, -5.437545,
3, -3.334686, -5.437545,
-2, -3.334686, -5.437545,
-2, -3.49389, -5.704316,
-1, -3.334686, -5.437545,
-1, -3.49389, -5.704316,
0, -3.334686, -5.437545,
0, -3.49389, -5.704316,
1, -3.334686, -5.437545,
1, -3.49389, -5.704316,
2, -3.334686, -5.437545,
2, -3.49389, -5.704316,
3, -3.334686, -5.437545,
3, -3.49389, -5.704316
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
-2, -3.812298, -6.237858, 0, -0.5, 0.5, 0.5,
-2, -3.812298, -6.237858, 1, -0.5, 0.5, 0.5,
-2, -3.812298, -6.237858, 1, 1.5, 0.5, 0.5,
-2, -3.812298, -6.237858, 0, 1.5, 0.5, 0.5,
-1, -3.812298, -6.237858, 0, -0.5, 0.5, 0.5,
-1, -3.812298, -6.237858, 1, -0.5, 0.5, 0.5,
-1, -3.812298, -6.237858, 1, 1.5, 0.5, 0.5,
-1, -3.812298, -6.237858, 0, 1.5, 0.5, 0.5,
0, -3.812298, -6.237858, 0, -0.5, 0.5, 0.5,
0, -3.812298, -6.237858, 1, -0.5, 0.5, 0.5,
0, -3.812298, -6.237858, 1, 1.5, 0.5, 0.5,
0, -3.812298, -6.237858, 0, 1.5, 0.5, 0.5,
1, -3.812298, -6.237858, 0, -0.5, 0.5, 0.5,
1, -3.812298, -6.237858, 1, -0.5, 0.5, 0.5,
1, -3.812298, -6.237858, 1, 1.5, 0.5, 0.5,
1, -3.812298, -6.237858, 0, 1.5, 0.5, 0.5,
2, -3.812298, -6.237858, 0, -0.5, 0.5, 0.5,
2, -3.812298, -6.237858, 1, -0.5, 0.5, 0.5,
2, -3.812298, -6.237858, 1, 1.5, 0.5, 0.5,
2, -3.812298, -6.237858, 0, 1.5, 0.5, 0.5,
3, -3.812298, -6.237858, 0, -0.5, 0.5, 0.5,
3, -3.812298, -6.237858, 1, -0.5, 0.5, 0.5,
3, -3.812298, -6.237858, 1, 1.5, 0.5, 0.5,
3, -3.812298, -6.237858, 0, 1.5, 0.5, 0.5
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
-2.739837, -3, -5.437545,
-2.739837, 2, -5.437545,
-2.739837, -3, -5.437545,
-2.899988, -3, -5.704316,
-2.739837, -2, -5.437545,
-2.899988, -2, -5.704316,
-2.739837, -1, -5.437545,
-2.899988, -1, -5.704316,
-2.739837, 0, -5.437545,
-2.899988, 0, -5.704316,
-2.739837, 1, -5.437545,
-2.899988, 1, -5.704316,
-2.739837, 2, -5.437545,
-2.899988, 2, -5.704316
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
-3.220289, -3, -6.237858, 0, -0.5, 0.5, 0.5,
-3.220289, -3, -6.237858, 1, -0.5, 0.5, 0.5,
-3.220289, -3, -6.237858, 1, 1.5, 0.5, 0.5,
-3.220289, -3, -6.237858, 0, 1.5, 0.5, 0.5,
-3.220289, -2, -6.237858, 0, -0.5, 0.5, 0.5,
-3.220289, -2, -6.237858, 1, -0.5, 0.5, 0.5,
-3.220289, -2, -6.237858, 1, 1.5, 0.5, 0.5,
-3.220289, -2, -6.237858, 0, 1.5, 0.5, 0.5,
-3.220289, -1, -6.237858, 0, -0.5, 0.5, 0.5,
-3.220289, -1, -6.237858, 1, -0.5, 0.5, 0.5,
-3.220289, -1, -6.237858, 1, 1.5, 0.5, 0.5,
-3.220289, -1, -6.237858, 0, 1.5, 0.5, 0.5,
-3.220289, 0, -6.237858, 0, -0.5, 0.5, 0.5,
-3.220289, 0, -6.237858, 1, -0.5, 0.5, 0.5,
-3.220289, 0, -6.237858, 1, 1.5, 0.5, 0.5,
-3.220289, 0, -6.237858, 0, 1.5, 0.5, 0.5,
-3.220289, 1, -6.237858, 0, -0.5, 0.5, 0.5,
-3.220289, 1, -6.237858, 1, -0.5, 0.5, 0.5,
-3.220289, 1, -6.237858, 1, 1.5, 0.5, 0.5,
-3.220289, 1, -6.237858, 0, 1.5, 0.5, 0.5,
-3.220289, 2, -6.237858, 0, -0.5, 0.5, 0.5,
-3.220289, 2, -6.237858, 1, -0.5, 0.5, 0.5,
-3.220289, 2, -6.237858, 1, 1.5, 0.5, 0.5,
-3.220289, 2, -6.237858, 0, 1.5, 0.5, 0.5
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
-2.739837, -3.334686, -4,
-2.739837, -3.334686, 4,
-2.739837, -3.334686, -4,
-2.899988, -3.49389, -4,
-2.739837, -3.334686, -2,
-2.899988, -3.49389, -2,
-2.739837, -3.334686, 0,
-2.899988, -3.49389, 0,
-2.739837, -3.334686, 2,
-2.899988, -3.49389, 2,
-2.739837, -3.334686, 4,
-2.899988, -3.49389, 4
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
-3.220289, -3.812298, -4, 0, -0.5, 0.5, 0.5,
-3.220289, -3.812298, -4, 1, -0.5, 0.5, 0.5,
-3.220289, -3.812298, -4, 1, 1.5, 0.5, 0.5,
-3.220289, -3.812298, -4, 0, 1.5, 0.5, 0.5,
-3.220289, -3.812298, -2, 0, -0.5, 0.5, 0.5,
-3.220289, -3.812298, -2, 1, -0.5, 0.5, 0.5,
-3.220289, -3.812298, -2, 1, 1.5, 0.5, 0.5,
-3.220289, -3.812298, -2, 0, 1.5, 0.5, 0.5,
-3.220289, -3.812298, 0, 0, -0.5, 0.5, 0.5,
-3.220289, -3.812298, 0, 1, -0.5, 0.5, 0.5,
-3.220289, -3.812298, 0, 1, 1.5, 0.5, 0.5,
-3.220289, -3.812298, 0, 0, 1.5, 0.5, 0.5,
-3.220289, -3.812298, 2, 0, -0.5, 0.5, 0.5,
-3.220289, -3.812298, 2, 1, -0.5, 0.5, 0.5,
-3.220289, -3.812298, 2, 1, 1.5, 0.5, 0.5,
-3.220289, -3.812298, 2, 0, 1.5, 0.5, 0.5,
-3.220289, -3.812298, 4, 0, -0.5, 0.5, 0.5,
-3.220289, -3.812298, 4, 1, -0.5, 0.5, 0.5,
-3.220289, -3.812298, 4, 1, 1.5, 0.5, 0.5,
-3.220289, -3.812298, 4, 0, 1.5, 0.5, 0.5
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
-2.739837, -3.334686, -5.437545,
-2.739837, 3.033481, -5.437545,
-2.739837, -3.334686, 5.233299,
-2.739837, 3.033481, 5.233299,
-2.739837, -3.334686, -5.437545,
-2.739837, -3.334686, 5.233299,
-2.739837, 3.033481, -5.437545,
-2.739837, 3.033481, 5.233299,
-2.739837, -3.334686, -5.437545,
3.66619, -3.334686, -5.437545,
-2.739837, -3.334686, 5.233299,
3.66619, -3.334686, 5.233299,
-2.739837, 3.033481, -5.437545,
3.66619, 3.033481, -5.437545,
-2.739837, 3.033481, 5.233299,
3.66619, 3.033481, 5.233299,
3.66619, -3.334686, -5.437545,
3.66619, 3.033481, -5.437545,
3.66619, -3.334686, 5.233299,
3.66619, 3.033481, 5.233299,
3.66619, -3.334686, -5.437545,
3.66619, -3.334686, 5.233299,
3.66619, 3.033481, -5.437545,
3.66619, 3.033481, 5.233299
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
var radius = 7.465378;
var distance = 33.21431;
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
mvMatrix.translate( -0.4631764, 0.1506026, 0.1021228 );
mvMatrix.scale( 1.260018, 1.26751, 0.7564269 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.21431);
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
polyoxin_D<-read.table("polyoxin_D.xyz")
```

```
## Error in read.table("polyoxin_D.xyz"): no lines available in input
```

```r
x<-polyoxin_D$V2
```

```
## Error in eval(expr, envir, enclos): object 'polyoxin_D' not found
```

```r
y<-polyoxin_D$V3
```

```
## Error in eval(expr, envir, enclos): object 'polyoxin_D' not found
```

```r
z<-polyoxin_D$V4
```

```
## Error in eval(expr, envir, enclos): object 'polyoxin_D' not found
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
-2.646546, -0.7462953, -1.247282, 0, 0, 1, 1, 1,
-2.502618, -0.06095135, -3.100753, 1, 0, 0, 1, 1,
-2.488562, -0.06134054, -1.240665, 1, 0, 0, 1, 1,
-2.484568, 0.5304454, -1.072344, 1, 0, 0, 1, 1,
-2.471823, -1.75084, 0.3810658, 1, 0, 0, 1, 1,
-2.409837, 0.8851871, -2.637243, 1, 0, 0, 1, 1,
-2.36465, -0.0153788, -0.6362001, 0, 0, 0, 1, 1,
-2.339102, 0.6008183, -0.3487158, 0, 0, 0, 1, 1,
-2.330748, -1.440455, -2.61975, 0, 0, 0, 1, 1,
-2.320443, -0.4806055, -0.7213137, 0, 0, 0, 1, 1,
-2.259587, 1.022971, -1.773315, 0, 0, 0, 1, 1,
-2.228157, -0.1771518, -2.43555, 0, 0, 0, 1, 1,
-2.179122, -0.01103714, -0.9611982, 0, 0, 0, 1, 1,
-2.147979, 2.383122, -0.4158996, 1, 1, 1, 1, 1,
-2.143901, -1.070559, -0.7851124, 1, 1, 1, 1, 1,
-2.089504, -0.1827217, -1.614789, 1, 1, 1, 1, 1,
-2.051944, 0.2423944, -0.751121, 1, 1, 1, 1, 1,
-2.03477, -0.4701383, -3.107698, 1, 1, 1, 1, 1,
-2.031941, 0.4074048, 0.5486882, 1, 1, 1, 1, 1,
-2.008914, -1.072928, -2.814554, 1, 1, 1, 1, 1,
-2.00887, 1.509907, -1.704671, 1, 1, 1, 1, 1,
-1.992957, -1.023675, -2.364016, 1, 1, 1, 1, 1,
-1.991889, -1.10621, -2.605261, 1, 1, 1, 1, 1,
-1.989465, 0.4459635, 0.4282877, 1, 1, 1, 1, 1,
-1.975728, -0.7342452, -0.6703694, 1, 1, 1, 1, 1,
-1.975094, 0.555338, -2.99819, 1, 1, 1, 1, 1,
-1.957344, 0.7182871, -0.6367925, 1, 1, 1, 1, 1,
-1.933812, -0.8107755, -4.262626, 1, 1, 1, 1, 1,
-1.91574, -0.3606952, -0.7810947, 0, 0, 1, 1, 1,
-1.913584, 0.6395936, -1.905098, 1, 0, 0, 1, 1,
-1.902803, -1.850066, -1.605873, 1, 0, 0, 1, 1,
-1.880033, -1.384828, -0.3845022, 1, 0, 0, 1, 1,
-1.877322, -0.8202491, -1.760025, 1, 0, 0, 1, 1,
-1.87186, -0.3935369, 0.2304015, 1, 0, 0, 1, 1,
-1.854591, -0.8068956, -1.555903, 0, 0, 0, 1, 1,
-1.85031, -0.8462672, -2.646707, 0, 0, 0, 1, 1,
-1.848575, -1.292633, -4.405332, 0, 0, 0, 1, 1,
-1.821551, -0.4589545, -1.52863, 0, 0, 0, 1, 1,
-1.80718, -1.234507, -2.775487, 0, 0, 0, 1, 1,
-1.783888, 1.98192, -0.8787207, 0, 0, 0, 1, 1,
-1.765965, 0.3871472, 0.1265015, 0, 0, 0, 1, 1,
-1.75668, -0.6953646, -1.99037, 1, 1, 1, 1, 1,
-1.731689, -0.9017351, -2.448279, 1, 1, 1, 1, 1,
-1.723607, -0.3006685, -0.1770771, 1, 1, 1, 1, 1,
-1.722623, -0.4182296, 0.04154062, 1, 1, 1, 1, 1,
-1.717663, -1.11915, -2.952846, 1, 1, 1, 1, 1,
-1.712232, 0.2069999, -1.422828, 1, 1, 1, 1, 1,
-1.690702, -0.8347684, -1.324816, 1, 1, 1, 1, 1,
-1.667499, -1.238297, -0.2182863, 1, 1, 1, 1, 1,
-1.661293, -0.2599368, -3.953017, 1, 1, 1, 1, 1,
-1.654535, -1.396119, -4.274209, 1, 1, 1, 1, 1,
-1.653153, -0.3364274, -0.02367193, 1, 1, 1, 1, 1,
-1.620021, 2.347993, -0.727664, 1, 1, 1, 1, 1,
-1.606703, -1.779553, -2.211336, 1, 1, 1, 1, 1,
-1.606211, -0.2020511, -1.987868, 1, 1, 1, 1, 1,
-1.591814, -0.3899764, -2.918858, 1, 1, 1, 1, 1,
-1.578838, 0.4621486, -1.514979, 0, 0, 1, 1, 1,
-1.553029, -0.6357921, -0.3733563, 1, 0, 0, 1, 1,
-1.55251, 0.8230845, -1.920371, 1, 0, 0, 1, 1,
-1.536858, 1.057018, -0.2335794, 1, 0, 0, 1, 1,
-1.534106, 0.2099596, -2.592388, 1, 0, 0, 1, 1,
-1.496889, -0.8045942, -4.086426, 1, 0, 0, 1, 1,
-1.49507, 0.8469922, -0.06701801, 0, 0, 0, 1, 1,
-1.470158, 0.5290136, -3.171269, 0, 0, 0, 1, 1,
-1.461775, -0.9139059, -3.064938, 0, 0, 0, 1, 1,
-1.448772, 0.09704816, -1.32256, 0, 0, 0, 1, 1,
-1.446043, -1.299442, -2.995112, 0, 0, 0, 1, 1,
-1.438072, 1.167005, -2.206209, 0, 0, 0, 1, 1,
-1.428401, 0.1661359, -2.675293, 0, 0, 0, 1, 1,
-1.426328, 0.3385749, -2.525361, 1, 1, 1, 1, 1,
-1.41669, -0.1469735, -2.585332, 1, 1, 1, 1, 1,
-1.414641, 0.245641, -1.189003, 1, 1, 1, 1, 1,
-1.412384, -1.676272, -2.189082, 1, 1, 1, 1, 1,
-1.404357, 1.043288, -2.453258, 1, 1, 1, 1, 1,
-1.400678, 0.04827112, -1.975012, 1, 1, 1, 1, 1,
-1.399068, -1.392395, -2.886839, 1, 1, 1, 1, 1,
-1.396134, -0.1780389, -1.405127, 1, 1, 1, 1, 1,
-1.394286, -0.02515912, 0.3942305, 1, 1, 1, 1, 1,
-1.394028, -0.6578251, -2.805344, 1, 1, 1, 1, 1,
-1.391328, 0.3902817, -2.173881, 1, 1, 1, 1, 1,
-1.386149, 0.4004297, -0.5326504, 1, 1, 1, 1, 1,
-1.382375, 0.223891, -1.495897, 1, 1, 1, 1, 1,
-1.379812, 0.979536, -1.298191, 1, 1, 1, 1, 1,
-1.374192, -1.288966, -1.611241, 1, 1, 1, 1, 1,
-1.368344, -1.0564, -3.759757, 0, 0, 1, 1, 1,
-1.362721, -0.6000085, -4.253752, 1, 0, 0, 1, 1,
-1.362053, -1.61761, -3.833236, 1, 0, 0, 1, 1,
-1.358907, 0.02117855, -2.137821, 1, 0, 0, 1, 1,
-1.351538, 0.8025551, 0.5604808, 1, 0, 0, 1, 1,
-1.34797, 1.574578, -1.025875, 1, 0, 0, 1, 1,
-1.344991, -0.2334056, -3.122417, 0, 0, 0, 1, 1,
-1.339787, 0.2715527, -1.217191, 0, 0, 0, 1, 1,
-1.32156, -0.294418, -2.521967, 0, 0, 0, 1, 1,
-1.319016, -1.343798, -1.69461, 0, 0, 0, 1, 1,
-1.313435, -0.0599589, -1.683614, 0, 0, 0, 1, 1,
-1.308416, -0.6994579, -1.77273, 0, 0, 0, 1, 1,
-1.307516, -1.273031, -2.53884, 0, 0, 0, 1, 1,
-1.30261, 0.4635516, -1.632727, 1, 1, 1, 1, 1,
-1.297353, -2.896485, -4.705881, 1, 1, 1, 1, 1,
-1.293937, -2.55259, -3.268347, 1, 1, 1, 1, 1,
-1.286487, -1.218054, -1.833024, 1, 1, 1, 1, 1,
-1.28412, 0.8133251, -1.469499, 1, 1, 1, 1, 1,
-1.282974, -0.4302573, -1.364117, 1, 1, 1, 1, 1,
-1.274988, 0.03322544, -1.10734, 1, 1, 1, 1, 1,
-1.265366, -0.5942115, -2.305704, 1, 1, 1, 1, 1,
-1.263672, -0.8949603, -0.8243451, 1, 1, 1, 1, 1,
-1.244042, -0.6792733, -3.901544, 1, 1, 1, 1, 1,
-1.23908, -0.6851665, -3.078391, 1, 1, 1, 1, 1,
-1.230068, 1.103414, 0.4536479, 1, 1, 1, 1, 1,
-1.22598, -0.2506011, -2.159405, 1, 1, 1, 1, 1,
-1.221656, 0.1543513, -1.38833, 1, 1, 1, 1, 1,
-1.220693, 0.3432506, -1.905827, 1, 1, 1, 1, 1,
-1.219507, -1.046756, -0.5107852, 0, 0, 1, 1, 1,
-1.218204, 0.2135731, -3.057204, 1, 0, 0, 1, 1,
-1.216749, -1.031423, -2.135078, 1, 0, 0, 1, 1,
-1.213155, -0.2375766, -2.328613, 1, 0, 0, 1, 1,
-1.211254, 0.4185534, -0.8403666, 1, 0, 0, 1, 1,
-1.209197, -0.9977391, -2.52591, 1, 0, 0, 1, 1,
-1.202746, -0.9385955, -2.182422, 0, 0, 0, 1, 1,
-1.193663, -1.225663, -4.525128, 0, 0, 0, 1, 1,
-1.190317, -0.7827737, -3.034527, 0, 0, 0, 1, 1,
-1.183251, -2.807874, -2.164813, 0, 0, 0, 1, 1,
-1.18135, 0.1028384, -0.9451681, 0, 0, 0, 1, 1,
-1.180825, -0.7452643, -0.9026203, 0, 0, 0, 1, 1,
-1.178031, 0.9075392, -1.298169, 0, 0, 0, 1, 1,
-1.174062, 0.04445899, -0.7137334, 1, 1, 1, 1, 1,
-1.165433, -1.67137, -1.9677, 1, 1, 1, 1, 1,
-1.161925, 0.7998607, -0.7049359, 1, 1, 1, 1, 1,
-1.161893, -0.8622329, -2.012032, 1, 1, 1, 1, 1,
-1.155177, 1.116261, 0.02320728, 1, 1, 1, 1, 1,
-1.151924, -0.9592822, -1.333413, 1, 1, 1, 1, 1,
-1.141631, -2.391171, -3.028139, 1, 1, 1, 1, 1,
-1.13576, -0.238599, -1.841005, 1, 1, 1, 1, 1,
-1.135261, -0.5256997, -2.600914, 1, 1, 1, 1, 1,
-1.133305, -0.7958238, -2.410902, 1, 1, 1, 1, 1,
-1.131051, 1.193118, -1.480278, 1, 1, 1, 1, 1,
-1.124485, 1.015548, 0.5525252, 1, 1, 1, 1, 1,
-1.122066, 0.4256146, -0.3085514, 1, 1, 1, 1, 1,
-1.117926, -0.3633461, -2.461972, 1, 1, 1, 1, 1,
-1.103525, -0.1495695, -1.543657, 1, 1, 1, 1, 1,
-1.098117, -0.3603172, -1.58585, 0, 0, 1, 1, 1,
-1.088278, 0.03473871, -1.424158, 1, 0, 0, 1, 1,
-1.083667, -0.4072122, -1.935058, 1, 0, 0, 1, 1,
-1.081959, 0.5115907, -0.2332566, 1, 0, 0, 1, 1,
-1.077962, 0.2214593, -1.267523, 1, 0, 0, 1, 1,
-1.066657, -0.2081807, -2.621912, 1, 0, 0, 1, 1,
-1.065568, 0.4297301, -0.9789163, 0, 0, 0, 1, 1,
-1.064474, 1.247309, -0.7511616, 0, 0, 0, 1, 1,
-1.063933, -1.33525, -2.476129, 0, 0, 0, 1, 1,
-1.062085, -1.029733, -4.143943, 0, 0, 0, 1, 1,
-1.058446, 0.3192067, -0.7041765, 0, 0, 0, 1, 1,
-1.057561, -0.6711789, -1.234968, 0, 0, 0, 1, 1,
-1.056203, 0.7263926, -0.4475461, 0, 0, 0, 1, 1,
-1.04542, 0.7988836, -0.5175574, 1, 1, 1, 1, 1,
-1.041296, -1.177984, -0.8414926, 1, 1, 1, 1, 1,
-1.036168, -1.229925, -0.9308649, 1, 1, 1, 1, 1,
-1.026271, 0.3847802, 1.029991, 1, 1, 1, 1, 1,
-1.024939, 1.562246, -1.000477, 1, 1, 1, 1, 1,
-1.020487, 0.7919795, -0.7997491, 1, 1, 1, 1, 1,
-1.019113, -0.8756801, -1.117343, 1, 1, 1, 1, 1,
-0.9921345, -0.9665971, -1.980375, 1, 1, 1, 1, 1,
-0.9884222, 0.9505929, -1.969953, 1, 1, 1, 1, 1,
-0.9762415, 2.062516, -1.483714, 1, 1, 1, 1, 1,
-0.9702343, -1.680503, -2.593821, 1, 1, 1, 1, 1,
-0.9692754, 0.6337358, 0.5938994, 1, 1, 1, 1, 1,
-0.9593636, 1.575248, -0.9065842, 1, 1, 1, 1, 1,
-0.9585639, 0.1469485, -3.066005, 1, 1, 1, 1, 1,
-0.9530345, -0.6243677, -2.856395, 1, 1, 1, 1, 1,
-0.934646, 0.6140431, -1.12263, 0, 0, 1, 1, 1,
-0.93088, 1.783386, -0.5214273, 1, 0, 0, 1, 1,
-0.9264188, -0.4661589, -2.395813, 1, 0, 0, 1, 1,
-0.9240934, -0.3239042, -1.837608, 1, 0, 0, 1, 1,
-0.9231126, 1.003094, -1.339586, 1, 0, 0, 1, 1,
-0.9211521, 0.9781008, -0.6275906, 1, 0, 0, 1, 1,
-0.9204413, 0.2140771, -1.258089, 0, 0, 0, 1, 1,
-0.9192813, -0.3330767, -1.181519, 0, 0, 0, 1, 1,
-0.9163439, 1.525817, 0.3647479, 0, 0, 0, 1, 1,
-0.9063124, 0.6110698, -2.044154, 0, 0, 0, 1, 1,
-0.8997751, -1.801077, -2.554622, 0, 0, 0, 1, 1,
-0.8990195, -0.6374061, -0.7254431, 0, 0, 0, 1, 1,
-0.8977671, 1.029528, 0.379911, 0, 0, 0, 1, 1,
-0.8969986, 1.981622, -1.108241, 1, 1, 1, 1, 1,
-0.8958335, 0.8322343, -2.385599, 1, 1, 1, 1, 1,
-0.8955018, 0.4764751, -1.907502, 1, 1, 1, 1, 1,
-0.8950613, 0.4715378, -0.07673468, 1, 1, 1, 1, 1,
-0.8904073, -0.03161938, -2.469231, 1, 1, 1, 1, 1,
-0.8851266, -0.9348023, -2.879524, 1, 1, 1, 1, 1,
-0.8832707, -0.6361258, -2.419722, 1, 1, 1, 1, 1,
-0.8800262, 0.4417743, -1.529706, 1, 1, 1, 1, 1,
-0.8795533, 1.970183, -1.53359, 1, 1, 1, 1, 1,
-0.8748957, -1.360571, -1.172848, 1, 1, 1, 1, 1,
-0.8695307, 1.367672, -1.54917, 1, 1, 1, 1, 1,
-0.8598925, 0.9688973, -1.40651, 1, 1, 1, 1, 1,
-0.8568826, 0.647329, -0.7411933, 1, 1, 1, 1, 1,
-0.8554364, -0.7083656, -3.169239, 1, 1, 1, 1, 1,
-0.8528951, -0.01303571, -1.504891, 1, 1, 1, 1, 1,
-0.8461426, -0.4745047, -2.524935, 0, 0, 1, 1, 1,
-0.8459398, -1.239126, -2.009795, 1, 0, 0, 1, 1,
-0.8354509, 2.74719, -1.462491, 1, 0, 0, 1, 1,
-0.831788, -1.109899, -2.668945, 1, 0, 0, 1, 1,
-0.829301, -0.9678546, -1.304188, 1, 0, 0, 1, 1,
-0.8275883, -1.43274, -2.250432, 1, 0, 0, 1, 1,
-0.8215482, 0.7013565, -0.319997, 0, 0, 0, 1, 1,
-0.8171557, -1.641379, -2.349718, 0, 0, 0, 1, 1,
-0.8156828, -1.642001, -5.102075, 0, 0, 0, 1, 1,
-0.8151407, -0.7889452, -3.078349, 0, 0, 0, 1, 1,
-0.8125207, 0.2018547, -2.832271, 0, 0, 0, 1, 1,
-0.8078699, -0.02557341, -1.338367, 0, 0, 0, 1, 1,
-0.8075119, 0.2099979, -1.043439, 0, 0, 0, 1, 1,
-0.8054062, 0.5039529, -2.589416, 1, 1, 1, 1, 1,
-0.804961, 0.04029511, -0.5427744, 1, 1, 1, 1, 1,
-0.8027738, -0.6400273, -1.047291, 1, 1, 1, 1, 1,
-0.8003317, -0.1200677, -1.855536, 1, 1, 1, 1, 1,
-0.7958734, 1.682384, -1.436734, 1, 1, 1, 1, 1,
-0.79155, 0.7987996, -1.21331, 1, 1, 1, 1, 1,
-0.784098, 0.6586361, -1.545306, 1, 1, 1, 1, 1,
-0.7760314, 0.6173013, 0.23834, 1, 1, 1, 1, 1,
-0.7718704, -1.1402, -1.73651, 1, 1, 1, 1, 1,
-0.7654051, 0.04163807, -3.521709, 1, 1, 1, 1, 1,
-0.7635734, -0.3447597, -1.728142, 1, 1, 1, 1, 1,
-0.7599595, 0.8760574, -0.9679652, 1, 1, 1, 1, 1,
-0.7576894, -0.3120836, -1.456621, 1, 1, 1, 1, 1,
-0.7561504, -0.8562683, -1.192519, 1, 1, 1, 1, 1,
-0.7535229, -0.2615053, -2.880506, 1, 1, 1, 1, 1,
-0.7494495, -0.4779454, -1.729756, 0, 0, 1, 1, 1,
-0.7445687, -0.8822784, -1.785401, 1, 0, 0, 1, 1,
-0.7436472, -0.2559243, 0.3545503, 1, 0, 0, 1, 1,
-0.7415426, -0.8874439, -2.887414, 1, 0, 0, 1, 1,
-0.7396095, 0.5390835, -1.972935, 1, 0, 0, 1, 1,
-0.7387459, -0.4986256, -0.5345209, 1, 0, 0, 1, 1,
-0.737024, -0.3309332, -2.323965, 0, 0, 0, 1, 1,
-0.7341987, 0.3762151, 0.03349806, 0, 0, 0, 1, 1,
-0.7311824, -0.3596335, -0.6683346, 0, 0, 0, 1, 1,
-0.7297609, 0.2172375, -1.136745, 0, 0, 0, 1, 1,
-0.7199299, 1.001173, -0.7846928, 0, 0, 0, 1, 1,
-0.7078238, -0.5137113, -0.6457976, 0, 0, 0, 1, 1,
-0.7012855, -0.08696217, -2.242244, 0, 0, 0, 1, 1,
-0.6984228, -1.675272, -1.197936, 1, 1, 1, 1, 1,
-0.6942801, 0.02383264, -2.297248, 1, 1, 1, 1, 1,
-0.6921351, 0.5768004, -0.4503294, 1, 1, 1, 1, 1,
-0.6900642, -0.233095, -2.228936, 1, 1, 1, 1, 1,
-0.6881038, 1.076144, -2.024061, 1, 1, 1, 1, 1,
-0.6878983, -0.2335641, -1.339144, 1, 1, 1, 1, 1,
-0.6833147, 0.4148701, -0.9364543, 1, 1, 1, 1, 1,
-0.6791309, -2.1552, -2.211078, 1, 1, 1, 1, 1,
-0.6765891, 1.496488, -0.2897453, 1, 1, 1, 1, 1,
-0.6745186, -0.3906085, -3.101027, 1, 1, 1, 1, 1,
-0.6719971, -0.03087173, -2.134194, 1, 1, 1, 1, 1,
-0.6639158, -0.7427901, -2.732122, 1, 1, 1, 1, 1,
-0.6627812, 1.735178, -1.361125, 1, 1, 1, 1, 1,
-0.6587689, -1.30048, -2.357054, 1, 1, 1, 1, 1,
-0.6557205, 0.203475, -1.706028, 1, 1, 1, 1, 1,
-0.6504042, 0.2508211, -0.6803823, 0, 0, 1, 1, 1,
-0.6482447, -0.2336335, -2.091984, 1, 0, 0, 1, 1,
-0.6473246, 1.524368, 1.275242, 1, 0, 0, 1, 1,
-0.6454955, -0.2874855, -1.852126, 1, 0, 0, 1, 1,
-0.6443601, 1.439061, -1.061368, 1, 0, 0, 1, 1,
-0.6418201, -0.3463322, -2.265751, 1, 0, 0, 1, 1,
-0.6411037, 0.9463111, -0.2708297, 0, 0, 0, 1, 1,
-0.6399003, -1.273278, -2.319662, 0, 0, 0, 1, 1,
-0.6362358, 0.5755463, 1.059366, 0, 0, 0, 1, 1,
-0.6346084, -0.5070966, -2.026664, 0, 0, 0, 1, 1,
-0.6327309, -0.8703669, -2.868104, 0, 0, 0, 1, 1,
-0.6322426, -0.3772612, -1.559464, 0, 0, 0, 1, 1,
-0.6317522, -0.6001274, -2.94862, 0, 0, 0, 1, 1,
-0.6275381, -0.487713, -1.527884, 1, 1, 1, 1, 1,
-0.6273813, 0.8527909, -0.9208475, 1, 1, 1, 1, 1,
-0.6255299, -0.356285, -1.378325, 1, 1, 1, 1, 1,
-0.6213406, -0.3819138, -2.173072, 1, 1, 1, 1, 1,
-0.6205984, -1.52656, -1.358523, 1, 1, 1, 1, 1,
-0.6179258, -0.4081111, -2.515254, 1, 1, 1, 1, 1,
-0.6162732, 0.7714324, -1.57899, 1, 1, 1, 1, 1,
-0.6148982, -1.097443, -2.810977, 1, 1, 1, 1, 1,
-0.6130255, -1.367652, -2.230343, 1, 1, 1, 1, 1,
-0.6107641, 0.4416879, 0.4782822, 1, 1, 1, 1, 1,
-0.6099328, -0.27575, -2.320471, 1, 1, 1, 1, 1,
-0.606683, 1.712612, -0.7776168, 1, 1, 1, 1, 1,
-0.5989037, -0.1177895, -0.3905718, 1, 1, 1, 1, 1,
-0.5880131, 1.052621, -1.77134, 1, 1, 1, 1, 1,
-0.5875899, 0.3395805, -1.94138, 1, 1, 1, 1, 1,
-0.5828911, -0.3719739, -1.537672, 0, 0, 1, 1, 1,
-0.5794646, -0.5804195, -2.080604, 1, 0, 0, 1, 1,
-0.574379, -2.000626, -0.2690745, 1, 0, 0, 1, 1,
-0.5663282, 0.6322566, -2.147291, 1, 0, 0, 1, 1,
-0.5647709, -0.6489761, 1.178668, 1, 0, 0, 1, 1,
-0.5626545, 2.173481, -1.712494, 1, 0, 0, 1, 1,
-0.561555, -0.6775602, -3.223895, 0, 0, 0, 1, 1,
-0.5586426, -0.3551439, -0.4853489, 0, 0, 0, 1, 1,
-0.5566258, 0.453831, -1.015892, 0, 0, 0, 1, 1,
-0.5514822, -0.1697234, -2.694458, 0, 0, 0, 1, 1,
-0.5423225, -2.193779, -3.666459, 0, 0, 0, 1, 1,
-0.5418642, -0.2131265, -2.313978, 0, 0, 0, 1, 1,
-0.5413535, 0.1500728, -0.394231, 0, 0, 0, 1, 1,
-0.5406162, -1.446702, -1.48597, 1, 1, 1, 1, 1,
-0.5404554, -0.3667166, -3.771322, 1, 1, 1, 1, 1,
-0.5345728, 1.307351, -0.3538529, 1, 1, 1, 1, 1,
-0.5327089, -1.998724, -2.914734, 1, 1, 1, 1, 1,
-0.5289819, 1.782441, -2.908388, 1, 1, 1, 1, 1,
-0.5289414, -0.07598649, -1.396724, 1, 1, 1, 1, 1,
-0.527679, -0.5903839, -3.481108, 1, 1, 1, 1, 1,
-0.5267992, -1.327905, -2.851202, 1, 1, 1, 1, 1,
-0.5202231, -0.6414748, -1.309537, 1, 1, 1, 1, 1,
-0.5187985, 0.5428807, -1.713298, 1, 1, 1, 1, 1,
-0.5176893, 0.4015119, -2.138734, 1, 1, 1, 1, 1,
-0.5160041, -0.8500113, -2.334572, 1, 1, 1, 1, 1,
-0.5150405, 0.5682006, 1.215784, 1, 1, 1, 1, 1,
-0.5070996, 0.6815839, -0.01204203, 1, 1, 1, 1, 1,
-0.5037762, 0.2078391, -1.877514, 1, 1, 1, 1, 1,
-0.502381, 0.2360696, -2.602622, 0, 0, 1, 1, 1,
-0.5001698, -0.2573428, -4.170275, 1, 0, 0, 1, 1,
-0.4965733, 2.714312, 0.1594815, 1, 0, 0, 1, 1,
-0.4963354, 2.04194, -1.257046, 1, 0, 0, 1, 1,
-0.4950694, 0.8048391, 0.5056719, 1, 0, 0, 1, 1,
-0.4946182, 0.1062935, -0.9750253, 1, 0, 0, 1, 1,
-0.4930127, -0.309913, -3.098217, 0, 0, 0, 1, 1,
-0.4929921, 0.1043358, -1.252715, 0, 0, 0, 1, 1,
-0.4888938, 0.4812748, 0.6440964, 0, 0, 0, 1, 1,
-0.4837592, 0.8802202, -0.8001335, 0, 0, 0, 1, 1,
-0.4802376, 1.114967, 1.040896, 0, 0, 0, 1, 1,
-0.4764597, -1.235632, -4.222796, 0, 0, 0, 1, 1,
-0.4659523, 0.6369398, -0.5669339, 0, 0, 0, 1, 1,
-0.4632398, -0.268076, -1.296635, 1, 1, 1, 1, 1,
-0.4614664, -2.05467, -2.471426, 1, 1, 1, 1, 1,
-0.4544391, 1.262203, -2.095533, 1, 1, 1, 1, 1,
-0.4520224, 0.5852858, -1.261693, 1, 1, 1, 1, 1,
-0.4516939, -0.6397132, -1.493718, 1, 1, 1, 1, 1,
-0.4488399, -0.7187387, -0.7954368, 1, 1, 1, 1, 1,
-0.4478059, -1.538351, -3.347213, 1, 1, 1, 1, 1,
-0.4460363, 1.372433, -0.0142284, 1, 1, 1, 1, 1,
-0.4423527, -0.3801384, -2.998157, 1, 1, 1, 1, 1,
-0.4419723, -0.3955792, -3.267769, 1, 1, 1, 1, 1,
-0.4400826, -0.08049561, -3.520887, 1, 1, 1, 1, 1,
-0.438342, 0.2308567, -1.261087, 1, 1, 1, 1, 1,
-0.4368052, -1.558532, -0.4894513, 1, 1, 1, 1, 1,
-0.4327637, 0.2048672, 0.09338548, 1, 1, 1, 1, 1,
-0.4321025, 0.4205393, -0.4477921, 1, 1, 1, 1, 1,
-0.4273424, 0.4712995, -0.9417402, 0, 0, 1, 1, 1,
-0.4253972, 1.040823, -1.345667, 1, 0, 0, 1, 1,
-0.421045, 0.6481137, -3.140635, 1, 0, 0, 1, 1,
-0.4199479, -0.1363543, -1.507807, 1, 0, 0, 1, 1,
-0.4171094, 0.7324213, -1.493633, 1, 0, 0, 1, 1,
-0.4152687, 1.74199, -1.116251, 1, 0, 0, 1, 1,
-0.4151786, -0.01871616, -1.619659, 0, 0, 0, 1, 1,
-0.4127717, -0.1794446, -1.391341, 0, 0, 0, 1, 1,
-0.4126823, -1.490925, -2.881929, 0, 0, 0, 1, 1,
-0.4122699, 2.061754, 0.5489735, 0, 0, 0, 1, 1,
-0.4120311, 0.3974308, -0.05685903, 0, 0, 0, 1, 1,
-0.4112682, -1.104913, -2.912044, 0, 0, 0, 1, 1,
-0.4111125, -0.1522696, -2.380495, 0, 0, 0, 1, 1,
-0.4081917, 1.672233, -1.580308, 1, 1, 1, 1, 1,
-0.408154, -1.351705, -2.709807, 1, 1, 1, 1, 1,
-0.4075695, -0.6812693, -2.373347, 1, 1, 1, 1, 1,
-0.4057795, -0.233074, -1.49904, 1, 1, 1, 1, 1,
-0.4052832, -0.9822625, -2.947525, 1, 1, 1, 1, 1,
-0.399815, -1.405346, -1.215147, 1, 1, 1, 1, 1,
-0.3954014, -0.3787229, -3.024642, 1, 1, 1, 1, 1,
-0.392633, -0.8628232, -2.647131, 1, 1, 1, 1, 1,
-0.391322, -1.844906, -2.815353, 1, 1, 1, 1, 1,
-0.3905962, 1.412683, 0.9012231, 1, 1, 1, 1, 1,
-0.3902793, 0.796496, -0.04888678, 1, 1, 1, 1, 1,
-0.390049, -0.1459905, -2.187834, 1, 1, 1, 1, 1,
-0.3815524, 1.591624, -1.080718, 1, 1, 1, 1, 1,
-0.3808037, 0.06676193, -1.60392, 1, 1, 1, 1, 1,
-0.379265, 0.4642994, -0.01118361, 1, 1, 1, 1, 1,
-0.3754238, 1.96261, 0.7382628, 0, 0, 1, 1, 1,
-0.375176, -0.354253, -2.159321, 1, 0, 0, 1, 1,
-0.3727619, 0.1066872, -2.101629, 1, 0, 0, 1, 1,
-0.3657252, -1.336537, -3.072978, 1, 0, 0, 1, 1,
-0.3642777, -1.416199, -3.149927, 1, 0, 0, 1, 1,
-0.3639544, 0.1632642, -0.06592871, 1, 0, 0, 1, 1,
-0.3638435, -0.2247431, -1.505291, 0, 0, 0, 1, 1,
-0.3571125, -0.8974807, -3.278011, 0, 0, 0, 1, 1,
-0.349014, -0.4650253, -4.604895, 0, 0, 0, 1, 1,
-0.3486143, -0.07434099, 1.17576, 0, 0, 0, 1, 1,
-0.3470262, -0.8455722, -2.609127, 0, 0, 0, 1, 1,
-0.3453457, 0.09973104, -0.8558524, 0, 0, 0, 1, 1,
-0.3403171, 0.1672674, -0.1360849, 0, 0, 0, 1, 1,
-0.3402053, -0.7654742, -4.322665, 1, 1, 1, 1, 1,
-0.3389762, 1.364995, -0.7531697, 1, 1, 1, 1, 1,
-0.3384345, -0.5376884, -2.056127, 1, 1, 1, 1, 1,
-0.3364744, 0.7218226, -0.9918154, 1, 1, 1, 1, 1,
-0.3357703, -0.3500322, -0.2163503, 1, 1, 1, 1, 1,
-0.330995, 0.362083, -2.291868, 1, 1, 1, 1, 1,
-0.330085, 0.8565289, 0.007350496, 1, 1, 1, 1, 1,
-0.3298794, -0.5118172, -2.877031, 1, 1, 1, 1, 1,
-0.3226057, 0.6429999, 0.4855311, 1, 1, 1, 1, 1,
-0.320075, 1.066592, 1.739692, 1, 1, 1, 1, 1,
-0.3109157, -0.1389721, -1.460982, 1, 1, 1, 1, 1,
-0.3103122, 0.5371771, -1.247387, 1, 1, 1, 1, 1,
-0.3024147, -2.213497, -1.857191, 1, 1, 1, 1, 1,
-0.2985126, -0.2345121, -1.728322, 1, 1, 1, 1, 1,
-0.2924403, 0.3967465, 0.9517447, 1, 1, 1, 1, 1,
-0.2898226, -0.05450028, -1.886825, 0, 0, 1, 1, 1,
-0.2860925, 0.6595032, -0.2863325, 1, 0, 0, 1, 1,
-0.2807063, -1.413452, -1.908957, 1, 0, 0, 1, 1,
-0.273066, -0.3051461, -1.84408, 1, 0, 0, 1, 1,
-0.2692072, -0.499098, -2.081319, 1, 0, 0, 1, 1,
-0.2658812, 0.1026771, -2.5729, 1, 0, 0, 1, 1,
-0.2657433, -0.6359429, -0.3464246, 0, 0, 0, 1, 1,
-0.2600824, -0.2238054, -2.094555, 0, 0, 0, 1, 1,
-0.2592775, 1.007866, -2.00121, 0, 0, 0, 1, 1,
-0.2541653, -1.64646, -3.838722, 0, 0, 0, 1, 1,
-0.253525, -1.811046, -3.605601, 0, 0, 0, 1, 1,
-0.2535129, -0.02527973, -1.701898, 0, 0, 0, 1, 1,
-0.2512474, 0.923628, 0.4389479, 0, 0, 0, 1, 1,
-0.2468888, 0.298229, -0.5577962, 1, 1, 1, 1, 1,
-0.2446259, 0.204689, 0.02052387, 1, 1, 1, 1, 1,
-0.2432624, 2.226874, -0.7987809, 1, 1, 1, 1, 1,
-0.2378266, -0.7362262, -3.42933, 1, 1, 1, 1, 1,
-0.231086, 0.4710532, -0.8044616, 1, 1, 1, 1, 1,
-0.2308878, -0.4749341, -2.303699, 1, 1, 1, 1, 1,
-0.2279675, 1.154518, -1.528303, 1, 1, 1, 1, 1,
-0.2261636, -1.070236, -3.099998, 1, 1, 1, 1, 1,
-0.2215926, 0.7560192, -1.990988, 1, 1, 1, 1, 1,
-0.2210658, 0.09194051, -0.9926916, 1, 1, 1, 1, 1,
-0.2201548, 1.633184, 0.510003, 1, 1, 1, 1, 1,
-0.2199078, 0.7157679, -0.2403605, 1, 1, 1, 1, 1,
-0.2179364, 0.2401103, -2.102695, 1, 1, 1, 1, 1,
-0.2170998, 0.1575624, -0.1168804, 1, 1, 1, 1, 1,
-0.2161393, 2.263812, -0.7170973, 1, 1, 1, 1, 1,
-0.2146862, -0.8022231, -1.7528, 0, 0, 1, 1, 1,
-0.211659, 1.281095, -0.3118363, 1, 0, 0, 1, 1,
-0.2083855, -1.077596, -1.48244, 1, 0, 0, 1, 1,
-0.2064484, 0.3811485, 0.2496751, 1, 0, 0, 1, 1,
-0.2047767, -0.07428274, -1.641518, 1, 0, 0, 1, 1,
-0.2018597, 0.01009817, -1.545816, 1, 0, 0, 1, 1,
-0.1985762, -1.190675, -1.721052, 0, 0, 0, 1, 1,
-0.1963355, -0.1457802, -0.5161312, 0, 0, 0, 1, 1,
-0.1959094, 0.1943186, -2.476212, 0, 0, 0, 1, 1,
-0.1955503, 1.383281, 0.6337661, 0, 0, 0, 1, 1,
-0.1924556, 0.06030716, -2.112646, 0, 0, 0, 1, 1,
-0.1868649, -1.35922, -3.077146, 0, 0, 0, 1, 1,
-0.1849622, -1.690768, -2.346687, 0, 0, 0, 1, 1,
-0.1844432, -0.957735, -2.847332, 1, 1, 1, 1, 1,
-0.1826361, 0.2735524, -0.003182396, 1, 1, 1, 1, 1,
-0.1781409, -0.6593468, -2.217752, 1, 1, 1, 1, 1,
-0.1741421, 0.6349731, 0.3860193, 1, 1, 1, 1, 1,
-0.1739321, -0.02035298, -0.554288, 1, 1, 1, 1, 1,
-0.1667972, -0.125293, -3.201887, 1, 1, 1, 1, 1,
-0.1666171, -0.6340328, -3.3376, 1, 1, 1, 1, 1,
-0.1661049, 0.136207, -1.374814, 1, 1, 1, 1, 1,
-0.1637308, 0.5381085, 1.082096, 1, 1, 1, 1, 1,
-0.1621064, 0.08003484, -0.5684968, 1, 1, 1, 1, 1,
-0.1540596, -0.4219441, -3.754752, 1, 1, 1, 1, 1,
-0.1531305, -0.2177157, -0.4008604, 1, 1, 1, 1, 1,
-0.1524651, -0.7486795, -3.613616, 1, 1, 1, 1, 1,
-0.1514019, 0.06107829, -1.110714, 1, 1, 1, 1, 1,
-0.1479192, -0.5568471, -2.189904, 1, 1, 1, 1, 1,
-0.146503, 0.267832, -0.3902676, 0, 0, 1, 1, 1,
-0.1457381, 0.3821513, -0.3075345, 1, 0, 0, 1, 1,
-0.1422423, 2.787466, -0.577591, 1, 0, 0, 1, 1,
-0.1389646, -0.1716813, -2.992402, 1, 0, 0, 1, 1,
-0.1386072, -1.560068, -3.566697, 1, 0, 0, 1, 1,
-0.1381951, 0.6214507, -1.677123, 1, 0, 0, 1, 1,
-0.1381705, 0.2443173, -1.288429, 0, 0, 0, 1, 1,
-0.1366877, 1.229155, -0.1383788, 0, 0, 0, 1, 1,
-0.1324025, 0.03658311, -1.79142, 0, 0, 0, 1, 1,
-0.1291436, -1.019765, -4.041557, 0, 0, 0, 1, 1,
-0.1284677, -0.6530696, -2.914012, 0, 0, 0, 1, 1,
-0.1275967, 2.373211, 0.2289712, 0, 0, 0, 1, 1,
-0.1218176, 0.7481574, 0.9276899, 0, 0, 0, 1, 1,
-0.1215473, 0.4985035, 1.404828, 1, 1, 1, 1, 1,
-0.1197883, -1.590965, -1.610251, 1, 1, 1, 1, 1,
-0.11771, -0.3247653, -0.5570642, 1, 1, 1, 1, 1,
-0.1153935, -0.109048, -0.2100397, 1, 1, 1, 1, 1,
-0.1139966, -0.851105, -4.892028, 1, 1, 1, 1, 1,
-0.1121154, 1.213619, -2.330497, 1, 1, 1, 1, 1,
-0.1120229, 0.9477782, 1.755072, 1, 1, 1, 1, 1,
-0.1101264, 0.2398419, -0.6947125, 1, 1, 1, 1, 1,
-0.1059564, -1.430357, -3.424237, 1, 1, 1, 1, 1,
-0.1018148, 1.880107, -0.3207368, 1, 1, 1, 1, 1,
-0.09696618, -0.5672905, -2.318917, 1, 1, 1, 1, 1,
-0.09239575, 0.536055, -1.108218, 1, 1, 1, 1, 1,
-0.08718204, 0.3334157, -1.063367, 1, 1, 1, 1, 1,
-0.08359799, 0.4111255, 0.9361276, 1, 1, 1, 1, 1,
-0.0798301, 2.205428, 0.7304649, 1, 1, 1, 1, 1,
-0.07752925, 0.007723971, -2.33568, 0, 0, 1, 1, 1,
-0.07518762, -0.2863624, -2.356656, 1, 0, 0, 1, 1,
-0.07320062, 0.3202252, 0.06100709, 1, 0, 0, 1, 1,
-0.07059144, -2.010737, -3.052059, 1, 0, 0, 1, 1,
-0.06698025, -0.08040243, -3.638651, 1, 0, 0, 1, 1,
-0.06622049, -0.1818403, -2.520319, 1, 0, 0, 1, 1,
-0.06512176, -3.241946, -3.895495, 0, 0, 0, 1, 1,
-0.05837874, 1.134086, -0.2789237, 0, 0, 0, 1, 1,
-0.05804314, -0.06867223, -3.22465, 0, 0, 0, 1, 1,
-0.05413917, 1.080304, -0.5904579, 0, 0, 0, 1, 1,
-0.05397559, 0.09275801, -1.171074, 0, 0, 0, 1, 1,
-0.0519672, 0.2929989, 2.719857, 0, 0, 0, 1, 1,
-0.05188528, 0.5000891, 0.2720123, 0, 0, 0, 1, 1,
-0.05056652, 0.9317247, 0.08403616, 1, 1, 1, 1, 1,
-0.04896165, -1.390635, -4.475553, 1, 1, 1, 1, 1,
-0.0433028, -0.5064031, -4.899593, 1, 1, 1, 1, 1,
-0.04319525, -1.045738, -5.282144, 1, 1, 1, 1, 1,
-0.0404848, 2.235178, -0.2070719, 1, 1, 1, 1, 1,
-0.03907681, 0.9477282, -0.4677323, 1, 1, 1, 1, 1,
-0.03125394, 0.5390168, 1.09998, 1, 1, 1, 1, 1,
-0.02966583, -0.7026892, -1.346269, 1, 1, 1, 1, 1,
-0.02865715, 1.812158, -0.08181672, 1, 1, 1, 1, 1,
-0.02722136, 0.7088012, 0.0794832, 1, 1, 1, 1, 1,
-0.02494205, -0.9466906, -2.243097, 1, 1, 1, 1, 1,
-0.0245595, 0.1403363, 1.653315, 1, 1, 1, 1, 1,
-0.02326442, 0.2021141, -0.1280476, 1, 1, 1, 1, 1,
-0.02241971, 1.02095, 0.3384675, 1, 1, 1, 1, 1,
-0.02214909, 0.2382475, -1.215453, 1, 1, 1, 1, 1,
-0.02093066, -1.123831, -3.537399, 0, 0, 1, 1, 1,
-0.02049004, 1.712882, 0.679855, 1, 0, 0, 1, 1,
-0.01448678, 0.2251128, 0.8643129, 1, 0, 0, 1, 1,
-0.01427482, -0.8658137, -3.53273, 1, 0, 0, 1, 1,
-0.01415488, 0.5149541, 0.1943903, 1, 0, 0, 1, 1,
-0.01232084, 0.1348982, 0.7523712, 1, 0, 0, 1, 1,
-0.01192532, -0.6431485, -2.979152, 0, 0, 0, 1, 1,
-0.01117118, 0.4813663, 0.06033367, 0, 0, 0, 1, 1,
-0.01116759, 1.628497, 0.1007266, 0, 0, 0, 1, 1,
-0.006586145, -0.8112349, -4.106432, 0, 0, 0, 1, 1,
-0.006497495, -1.946703, -1.826329, 0, 0, 0, 1, 1,
-0.002975093, -0.4489792, -1.556899, 0, 0, 0, 1, 1,
-0.002437581, -1.481649, -2.448731, 0, 0, 0, 1, 1,
-0.001387052, 0.2021624, -0.1110224, 1, 1, 1, 1, 1,
-0.001177133, 1.237924, -0.8457398, 1, 1, 1, 1, 1,
0.004020875, -0.2388376, 3.34444, 1, 1, 1, 1, 1,
0.004691126, 0.002646916, 1.880965, 1, 1, 1, 1, 1,
0.004823522, -0.231965, 3.163017, 1, 1, 1, 1, 1,
0.005969456, -0.08613002, 2.638054, 1, 1, 1, 1, 1,
0.007985324, -0.1468739, 3.336403, 1, 1, 1, 1, 1,
0.01162625, 1.269928, -0.08078477, 1, 1, 1, 1, 1,
0.0120067, 1.553499, -1.303141, 1, 1, 1, 1, 1,
0.02560481, -0.3658934, 4.357172, 1, 1, 1, 1, 1,
0.02897638, 0.04319757, -0.09317444, 1, 1, 1, 1, 1,
0.03683828, 0.009907648, -1.160907, 1, 1, 1, 1, 1,
0.03732127, -0.5772563, 2.472382, 1, 1, 1, 1, 1,
0.04212179, -0.5659229, 2.823547, 1, 1, 1, 1, 1,
0.04595494, -0.5984644, 3.702373, 1, 1, 1, 1, 1,
0.05015506, 1.191997, 1.117411, 0, 0, 1, 1, 1,
0.05292802, 0.3015071, 0.107256, 1, 0, 0, 1, 1,
0.05887223, 0.2456962, 0.1469924, 1, 0, 0, 1, 1,
0.05897402, -0.3620278, 3.373426, 1, 0, 0, 1, 1,
0.06012948, 0.419196, 1.768324, 1, 0, 0, 1, 1,
0.06092035, -0.9180185, 2.676013, 1, 0, 0, 1, 1,
0.06184246, 0.9765685, 1.396106, 0, 0, 0, 1, 1,
0.06381958, -1.302184, 5.077899, 0, 0, 0, 1, 1,
0.06383948, -0.9569152, 3.183258, 0, 0, 0, 1, 1,
0.06601535, 0.9542829, -0.5943479, 0, 0, 0, 1, 1,
0.06640558, 2.0973, 0.5575191, 0, 0, 0, 1, 1,
0.0678796, -1.091564, 3.573302, 0, 0, 0, 1, 1,
0.07178768, -1.033594, 2.608823, 0, 0, 0, 1, 1,
0.07243166, -0.3983392, 2.914063, 1, 1, 1, 1, 1,
0.0797608, -1.650976, 3.035563, 1, 1, 1, 1, 1,
0.07991101, 2.396373, -0.8674965, 1, 1, 1, 1, 1,
0.08249565, -0.4118619, 4.489521, 1, 1, 1, 1, 1,
0.08399292, -0.8049185, 4.183601, 1, 1, 1, 1, 1,
0.08564074, 0.5610936, -1.032927, 1, 1, 1, 1, 1,
0.08592025, 0.8367704, 0.1225464, 1, 1, 1, 1, 1,
0.08696126, 1.765825, -0.8418906, 1, 1, 1, 1, 1,
0.09025791, 0.8657524, -0.9577399, 1, 1, 1, 1, 1,
0.09244263, 0.8912491, 0.9780325, 1, 1, 1, 1, 1,
0.09315997, -0.2243197, 3.447452, 1, 1, 1, 1, 1,
0.09360204, -0.4723706, 1.600811, 1, 1, 1, 1, 1,
0.09662917, -1.103701, 2.217243, 1, 1, 1, 1, 1,
0.1037435, -1.025769, 3.649456, 1, 1, 1, 1, 1,
0.1066855, 0.6499285, 0.555174, 1, 1, 1, 1, 1,
0.1078947, -0.2300591, 3.153822, 0, 0, 1, 1, 1,
0.1124628, 0.09133045, 1.262195, 1, 0, 0, 1, 1,
0.1135686, 0.5156014, -0.08533909, 1, 0, 0, 1, 1,
0.1136151, -1.831595, 1.758408, 1, 0, 0, 1, 1,
0.1221843, 0.9402101, 0.3833922, 1, 0, 0, 1, 1,
0.123624, -1.353043, 1.441069, 1, 0, 0, 1, 1,
0.1248061, -0.3662259, 3.053669, 0, 0, 0, 1, 1,
0.1248355, 0.006285854, 3.141671, 0, 0, 0, 1, 1,
0.1307572, -0.4623072, 2.188725, 0, 0, 0, 1, 1,
0.1329519, 2.088371, 1.345888, 0, 0, 0, 1, 1,
0.1352921, 0.9294604, -1.113418, 0, 0, 0, 1, 1,
0.1380747, 0.9041164, -0.5467058, 0, 0, 0, 1, 1,
0.1406807, -1.245175, 2.240374, 0, 0, 0, 1, 1,
0.1443814, -2.237545, 4.116338, 1, 1, 1, 1, 1,
0.1462718, -0.3535085, 0.9849994, 1, 1, 1, 1, 1,
0.1505278, -0.1293972, 2.410874, 1, 1, 1, 1, 1,
0.1617753, 0.8087832, 0.4654048, 1, 1, 1, 1, 1,
0.1640607, -1.585811, 2.408517, 1, 1, 1, 1, 1,
0.165875, -0.3427601, 3.476691, 1, 1, 1, 1, 1,
0.1664123, 1.534696, 0.2901488, 1, 1, 1, 1, 1,
0.1709338, -0.03997511, 2.159279, 1, 1, 1, 1, 1,
0.172851, 0.6468642, -0.9803029, 1, 1, 1, 1, 1,
0.1736638, 1.222363, -0.7957243, 1, 1, 1, 1, 1,
0.1779367, 0.3303477, 0.645888, 1, 1, 1, 1, 1,
0.179385, 1.005903, -0.3793891, 1, 1, 1, 1, 1,
0.186784, 0.801781, 0.01646488, 1, 1, 1, 1, 1,
0.1882568, 0.781601, 0.1435704, 1, 1, 1, 1, 1,
0.190402, 0.3017061, 1.641064, 1, 1, 1, 1, 1,
0.1927547, -1.244819, 2.736213, 0, 0, 1, 1, 1,
0.203196, -1.366551, 3.236143, 1, 0, 0, 1, 1,
0.2066226, -0.4445741, 1.319922, 1, 0, 0, 1, 1,
0.2103982, -1.909867, 3.746919, 1, 0, 0, 1, 1,
0.2110444, 0.3406206, 0.9037153, 1, 0, 0, 1, 1,
0.2141832, 0.7064625, 0.09221762, 1, 0, 0, 1, 1,
0.2141838, -0.9925494, 4.755448, 0, 0, 0, 1, 1,
0.2143256, -0.11129, 1.893607, 0, 0, 0, 1, 1,
0.2168373, 1.611369, 0.4116715, 0, 0, 0, 1, 1,
0.2177891, 0.3954016, -1.645652, 0, 0, 0, 1, 1,
0.2189767, -0.4712459, 4.741667, 0, 0, 0, 1, 1,
0.2199257, 1.048552, 1.236299, 0, 0, 0, 1, 1,
0.2206665, 0.9635707, -0.3415784, 0, 0, 0, 1, 1,
0.2247535, -0.7625473, 3.310518, 1, 1, 1, 1, 1,
0.2268618, 0.9868758, -1.010061, 1, 1, 1, 1, 1,
0.2283393, 0.1027385, 1.211127, 1, 1, 1, 1, 1,
0.2311134, -0.7041575, 3.468324, 1, 1, 1, 1, 1,
0.2347392, -1.352744, 1.99239, 1, 1, 1, 1, 1,
0.2446994, 1.363553, -1.288695, 1, 1, 1, 1, 1,
0.2459926, 0.006806172, 1.63757, 1, 1, 1, 1, 1,
0.2512766, 0.2057636, 0.6221545, 1, 1, 1, 1, 1,
0.2513394, -0.006307565, 1.298016, 1, 1, 1, 1, 1,
0.2611961, -2.622321, 2.257117, 1, 1, 1, 1, 1,
0.261571, 0.7661028, 0.006058163, 1, 1, 1, 1, 1,
0.2617596, 0.02686184, 1.507164, 1, 1, 1, 1, 1,
0.2676063, -1.982265, 2.390211, 1, 1, 1, 1, 1,
0.2715745, 0.3024154, 1.743741, 1, 1, 1, 1, 1,
0.2754692, -1.140103, 2.266429, 1, 1, 1, 1, 1,
0.2784547, 2.94074, -0.2972969, 0, 0, 1, 1, 1,
0.2793927, -1.213085, 2.452492, 1, 0, 0, 1, 1,
0.280259, -1.877175, 2.985853, 1, 0, 0, 1, 1,
0.2817889, 1.325344, -0.1846095, 1, 0, 0, 1, 1,
0.2831414, 0.0468088, 2.660135, 1, 0, 0, 1, 1,
0.2833488, 0.3672591, 0.8688988, 1, 0, 0, 1, 1,
0.2858621, 0.5143492, 0.5919033, 0, 0, 0, 1, 1,
0.2871935, 0.205512, -1.595198, 0, 0, 0, 1, 1,
0.2914334, -1.640627, 1.527196, 0, 0, 0, 1, 1,
0.2919845, -0.8592151, 3.578016, 0, 0, 0, 1, 1,
0.2929529, 1.948457, -1.292649, 0, 0, 0, 1, 1,
0.2940593, 0.6638266, 0.2637708, 0, 0, 0, 1, 1,
0.295424, -0.3910908, 1.696034, 0, 0, 0, 1, 1,
0.2959188, 0.1671909, -0.6025091, 1, 1, 1, 1, 1,
0.3012267, 1.502779, 0.9653524, 1, 1, 1, 1, 1,
0.3012567, 0.1817835, -0.2130813, 1, 1, 1, 1, 1,
0.3051826, 0.1330873, 1.804822, 1, 1, 1, 1, 1,
0.3061295, 0.3267346, 2.057008, 1, 1, 1, 1, 1,
0.3080717, 0.1250887, 1.227694, 1, 1, 1, 1, 1,
0.3090856, 0.03630734, 0.5991681, 1, 1, 1, 1, 1,
0.3110983, 0.7822652, 2.293489, 1, 1, 1, 1, 1,
0.3127632, -1.339893, 4.055831, 1, 1, 1, 1, 1,
0.3133751, -1.950433, 1.543329, 1, 1, 1, 1, 1,
0.3136843, -1.254192, 3.70322, 1, 1, 1, 1, 1,
0.3180782, 0.4767044, 2.030034, 1, 1, 1, 1, 1,
0.3209609, -1.295723, 2.412724, 1, 1, 1, 1, 1,
0.3218439, -0.520451, 2.388499, 1, 1, 1, 1, 1,
0.3219806, 1.051686, 0.2792032, 1, 1, 1, 1, 1,
0.3303803, -0.5482771, 1.479993, 0, 0, 1, 1, 1,
0.3330915, 0.9180964, 1.834133, 1, 0, 0, 1, 1,
0.337788, -1.383305, 2.626194, 1, 0, 0, 1, 1,
0.3388851, -0.8831756, 3.041022, 1, 0, 0, 1, 1,
0.3389492, -0.7966112, 2.326607, 1, 0, 0, 1, 1,
0.3418337, -0.3624156, 1.269028, 1, 0, 0, 1, 1,
0.3448388, -0.3822812, 2.132653, 0, 0, 0, 1, 1,
0.3466974, 1.08259, -1.061278, 0, 0, 0, 1, 1,
0.3467836, -1.389494, 2.623575, 0, 0, 0, 1, 1,
0.3472632, 0.05222102, 1.896583, 0, 0, 0, 1, 1,
0.3480774, -0.5353994, 1.749357, 0, 0, 0, 1, 1,
0.3493759, -0.8389159, 4.366738, 0, 0, 0, 1, 1,
0.3548028, -2.054487, 3.439805, 0, 0, 0, 1, 1,
0.3565429, 1.291684, 0.5420848, 1, 1, 1, 1, 1,
0.3570628, -0.8937861, 3.394267, 1, 1, 1, 1, 1,
0.3629499, -0.9595879, 3.442157, 1, 1, 1, 1, 1,
0.3673874, 0.678929, -0.742784, 1, 1, 1, 1, 1,
0.3762513, 0.6360179, 1.690993, 1, 1, 1, 1, 1,
0.377376, 1.53272, 0.9362221, 1, 1, 1, 1, 1,
0.3823811, -0.867561, 2.160095, 1, 1, 1, 1, 1,
0.3851261, -1.281213, 1.985742, 1, 1, 1, 1, 1,
0.3888611, -0.2173499, 2.183682, 1, 1, 1, 1, 1,
0.390685, -2.730351, 2.864269, 1, 1, 1, 1, 1,
0.3951134, -0.9680793, 2.356081, 1, 1, 1, 1, 1,
0.4009198, 0.2973416, 0.349163, 1, 1, 1, 1, 1,
0.4019623, -0.5674207, 3.109551, 1, 1, 1, 1, 1,
0.4034223, 1.086441, 0.6183829, 1, 1, 1, 1, 1,
0.4060172, -0.4243074, 4.63086, 1, 1, 1, 1, 1,
0.4081914, 0.1842888, 0.3372398, 0, 0, 1, 1, 1,
0.4098223, -0.326136, 2.055026, 1, 0, 0, 1, 1,
0.4116883, -1.66401, 3.09336, 1, 0, 0, 1, 1,
0.4124343, -0.4867098, 2.739416, 1, 0, 0, 1, 1,
0.414008, 1.136321, 0.8876826, 1, 0, 0, 1, 1,
0.4154367, 1.445474, 0.2969694, 1, 0, 0, 1, 1,
0.4253068, 1.425082, -0.5794454, 0, 0, 0, 1, 1,
0.4350509, 0.7529566, 0.5063324, 0, 0, 0, 1, 1,
0.4377298, -0.5653796, 2.001894, 0, 0, 0, 1, 1,
0.441755, 0.4203761, -0.06075856, 0, 0, 0, 1, 1,
0.4445488, -0.2242074, 2.538652, 0, 0, 0, 1, 1,
0.4529763, -0.6674293, 4.104945, 0, 0, 0, 1, 1,
0.453545, 0.05733348, 2.162416, 0, 0, 0, 1, 1,
0.4641371, 1.353141, -1.43375, 1, 1, 1, 1, 1,
0.4674619, 0.2805886, 2.079018, 1, 1, 1, 1, 1,
0.4692592, -1.365272, 3.687982, 1, 1, 1, 1, 1,
0.4709548, 0.02343746, 2.196317, 1, 1, 1, 1, 1,
0.4729528, 0.5489082, 1.022933, 1, 1, 1, 1, 1,
0.4740927, -0.3373354, 2.746332, 1, 1, 1, 1, 1,
0.474765, 1.676883, -0.3158732, 1, 1, 1, 1, 1,
0.4774827, -0.6178471, 4.462243, 1, 1, 1, 1, 1,
0.4780723, -0.2801352, -0.1961909, 1, 1, 1, 1, 1,
0.4788037, 1.704937, 0.2617422, 1, 1, 1, 1, 1,
0.4797593, 1.216157, -0.1856301, 1, 1, 1, 1, 1,
0.4802929, 0.7682683, 2.009481, 1, 1, 1, 1, 1,
0.4809469, -0.2537577, 2.153515, 1, 1, 1, 1, 1,
0.4812304, 0.7502032, 1.348665, 1, 1, 1, 1, 1,
0.4830986, -0.8669102, 2.482207, 1, 1, 1, 1, 1,
0.4866665, -0.02148257, 2.481284, 0, 0, 1, 1, 1,
0.4930653, 0.2236841, 0.513291, 1, 0, 0, 1, 1,
0.4932546, -0.2254925, 1.928846, 1, 0, 0, 1, 1,
0.4947413, -0.5908379, 2.833151, 1, 0, 0, 1, 1,
0.4952075, -0.4946569, 3.145702, 1, 0, 0, 1, 1,
0.4961359, 0.8091974, -0.4389382, 1, 0, 0, 1, 1,
0.4979153, -1.501876, 3.212197, 0, 0, 0, 1, 1,
0.5040634, 2.306337, 0.9357947, 0, 0, 0, 1, 1,
0.5042681, 0.5925833, 2.240955, 0, 0, 0, 1, 1,
0.5053372, 0.9262835, 1.960063, 0, 0, 0, 1, 1,
0.505706, -0.7194231, 3.772068, 0, 0, 0, 1, 1,
0.5081664, 0.4365973, 0.3176759, 0, 0, 0, 1, 1,
0.5093985, 0.7735124, 0.8523673, 0, 0, 0, 1, 1,
0.5172893, -0.2541645, 2.265165, 1, 1, 1, 1, 1,
0.5177867, -0.8135946, 3.693079, 1, 1, 1, 1, 1,
0.5178614, 1.333434, 0.6212686, 1, 1, 1, 1, 1,
0.5225889, -0.937397, 3.431203, 1, 1, 1, 1, 1,
0.5227944, 0.3338087, -1.549717, 1, 1, 1, 1, 1,
0.5231057, -0.3472899, 2.184322, 1, 1, 1, 1, 1,
0.524029, 0.4385429, -0.6017101, 1, 1, 1, 1, 1,
0.5290298, 0.2614694, 1.803643, 1, 1, 1, 1, 1,
0.5355247, 1.781362, -1.219826, 1, 1, 1, 1, 1,
0.5407535, -0.4875695, 3.548399, 1, 1, 1, 1, 1,
0.5420577, 0.00886727, 3.079984, 1, 1, 1, 1, 1,
0.5444766, 0.2162901, 0.06542532, 1, 1, 1, 1, 1,
0.5493408, -0.835319, 2.379649, 1, 1, 1, 1, 1,
0.5498672, -0.006838249, 0.4261312, 1, 1, 1, 1, 1,
0.5504148, -0.2563971, 2.733126, 1, 1, 1, 1, 1,
0.552184, 0.6644827, 1.275184, 0, 0, 1, 1, 1,
0.5528675, -0.1558081, 1.287339, 1, 0, 0, 1, 1,
0.5553278, -1.176121, 3.713623, 1, 0, 0, 1, 1,
0.5558124, 1.10098, 0.5231265, 1, 0, 0, 1, 1,
0.557522, 0.1302134, 4.072521, 1, 0, 0, 1, 1,
0.5599584, 0.374581, 1.921028, 1, 0, 0, 1, 1,
0.5613019, 0.9687442, -1.277104, 0, 0, 0, 1, 1,
0.5617549, -0.2707922, 3.018427, 0, 0, 0, 1, 1,
0.56383, 0.7776469, -0.4442537, 0, 0, 0, 1, 1,
0.5657996, -0.06920422, 1.157702, 0, 0, 0, 1, 1,
0.5664849, 2.086419, 0.4483269, 0, 0, 0, 1, 1,
0.56955, 0.4006377, 2.518973, 0, 0, 0, 1, 1,
0.5797952, 0.4416912, 1.606268, 0, 0, 0, 1, 1,
0.5806754, -0.3528808, 2.981411, 1, 1, 1, 1, 1,
0.58233, 2.032458, -0.678422, 1, 1, 1, 1, 1,
0.5879474, 1.904561, -0.5713934, 1, 1, 1, 1, 1,
0.5923203, -0.2405786, 1.077626, 1, 1, 1, 1, 1,
0.5925954, 0.5411654, 3.787789, 1, 1, 1, 1, 1,
0.6044958, 0.3932852, 3.348615, 1, 1, 1, 1, 1,
0.6048599, 0.8354176, -0.01145883, 1, 1, 1, 1, 1,
0.6100168, 0.7869915, 0.8517845, 1, 1, 1, 1, 1,
0.6107146, 1.317679, 1.179745, 1, 1, 1, 1, 1,
0.6153553, -0.4693644, 2.67616, 1, 1, 1, 1, 1,
0.6193669, -0.009895881, 2.207206, 1, 1, 1, 1, 1,
0.6232883, 1.200642, 1.152188, 1, 1, 1, 1, 1,
0.6241368, -0.3481371, 1.615355, 1, 1, 1, 1, 1,
0.6351429, 0.5165565, 1.062857, 1, 1, 1, 1, 1,
0.6364192, 1.503555, -1.847356, 1, 1, 1, 1, 1,
0.6385819, 0.8659892, 1.061934, 0, 0, 1, 1, 1,
0.6393475, -1.77402, 4.415104, 1, 0, 0, 1, 1,
0.6415923, 0.01149678, 2.606736, 1, 0, 0, 1, 1,
0.6435015, -0.3904237, 1.276071, 1, 0, 0, 1, 1,
0.6484367, 1.699853, 0.1025124, 1, 0, 0, 1, 1,
0.6486741, 1.986115, -1.039838, 1, 0, 0, 1, 1,
0.6523632, 0.461743, -0.9343496, 0, 0, 0, 1, 1,
0.6539262, 0.2707283, 0.1489209, 0, 0, 0, 1, 1,
0.6612586, 0.4966619, 2.449461, 0, 0, 0, 1, 1,
0.6622251, -1.279324, 2.640274, 0, 0, 0, 1, 1,
0.663999, 1.017889, -0.4664313, 0, 0, 0, 1, 1,
0.6681907, -0.1933915, 2.299541, 0, 0, 0, 1, 1,
0.6684653, 0.420891, 1.401736, 0, 0, 0, 1, 1,
0.6703141, 0.6796663, 0.9678772, 1, 1, 1, 1, 1,
0.6709264, -0.9882701, 2.812649, 1, 1, 1, 1, 1,
0.6750916, 0.926983, 3.770784, 1, 1, 1, 1, 1,
0.6762213, -1.459793, 3.277645, 1, 1, 1, 1, 1,
0.6793481, 0.9359201, 0.9455353, 1, 1, 1, 1, 1,
0.6802021, 1.496847, 0.6039507, 1, 1, 1, 1, 1,
0.6804491, -0.1390748, 0.6502447, 1, 1, 1, 1, 1,
0.6804787, 0.2667803, 4.696033, 1, 1, 1, 1, 1,
0.6888306, -1.54375, 3.133748, 1, 1, 1, 1, 1,
0.6920266, -0.1615253, 2.853759, 1, 1, 1, 1, 1,
0.6961238, -2.147868, 1.85044, 1, 1, 1, 1, 1,
0.6980729, 1.62854, -1.124003, 1, 1, 1, 1, 1,
0.6983721, 0.2585167, 2.543854, 1, 1, 1, 1, 1,
0.6986194, -0.494598, 1.882236, 1, 1, 1, 1, 1,
0.7004578, -0.5917077, 3.989858, 1, 1, 1, 1, 1,
0.7013765, -0.6468285, 2.460072, 0, 0, 1, 1, 1,
0.703378, -1.880046, 3.099474, 1, 0, 0, 1, 1,
0.7038236, -0.2645119, 2.602176, 1, 0, 0, 1, 1,
0.7090272, -0.8037214, 2.514176, 1, 0, 0, 1, 1,
0.7127095, -0.4765747, 2.03768, 1, 0, 0, 1, 1,
0.7158804, 2.126643, -0.07431449, 1, 0, 0, 1, 1,
0.7174326, -0.2733061, 1.536196, 0, 0, 0, 1, 1,
0.7177521, -0.5467681, 2.754408, 0, 0, 0, 1, 1,
0.7208366, -0.1793712, 2.502084, 0, 0, 0, 1, 1,
0.7237577, 1.200733, -0.4363485, 0, 0, 0, 1, 1,
0.7254634, -1.172827, 2.114738, 0, 0, 0, 1, 1,
0.7262326, 0.1602145, 1.606454, 0, 0, 0, 1, 1,
0.7368361, 0.7707738, 1.382499, 0, 0, 0, 1, 1,
0.7387011, -0.1828161, 3.279665, 1, 1, 1, 1, 1,
0.7424297, -1.00672, 1.363089, 1, 1, 1, 1, 1,
0.7446622, 0.4369401, 3.028325, 1, 1, 1, 1, 1,
0.749253, -0.6966387, 2.131241, 1, 1, 1, 1, 1,
0.7508553, 1.685879, 2.268094, 1, 1, 1, 1, 1,
0.7543649, 0.19916, 0.6668738, 1, 1, 1, 1, 1,
0.7620412, 0.02172265, 1.268115, 1, 1, 1, 1, 1,
0.7649138, 0.06055279, 0.1640335, 1, 1, 1, 1, 1,
0.7670738, 0.3351008, 1.298681, 1, 1, 1, 1, 1,
0.7672636, -1.650291, 2.449273, 1, 1, 1, 1, 1,
0.7673097, -0.9075621, 1.688704, 1, 1, 1, 1, 1,
0.7685543, 0.1118635, 0.7772126, 1, 1, 1, 1, 1,
0.7785434, -1.035021, 1.925099, 1, 1, 1, 1, 1,
0.7803673, -0.6936975, 2.601281, 1, 1, 1, 1, 1,
0.781909, 0.06782743, 1.24707, 1, 1, 1, 1, 1,
0.7827659, 0.8436464, 1.504494, 0, 0, 1, 1, 1,
0.7843065, -0.5399112, 4.851409, 1, 0, 0, 1, 1,
0.7856961, -0.4910628, 3.84321, 1, 0, 0, 1, 1,
0.7869561, -0.6553217, 2.122595, 1, 0, 0, 1, 1,
0.7964634, -0.4512863, -0.07846454, 1, 0, 0, 1, 1,
0.7990974, -0.09445429, 1.06549, 1, 0, 0, 1, 1,
0.8029367, 0.07093476, 0.8386502, 0, 0, 0, 1, 1,
0.8053313, 0.5552695, 0.7369079, 0, 0, 0, 1, 1,
0.8072706, 0.6785641, 0.8998382, 0, 0, 0, 1, 1,
0.8090382, -0.8993794, 1.544337, 0, 0, 0, 1, 1,
0.8102096, 0.1157338, 3.782094, 0, 0, 0, 1, 1,
0.8133761, 0.1317494, 1.175749, 0, 0, 0, 1, 1,
0.814194, -1.442347, 3.429863, 0, 0, 0, 1, 1,
0.8254764, -0.7317334, 2.5238, 1, 1, 1, 1, 1,
0.8342589, 1.016096, 0.6969149, 1, 1, 1, 1, 1,
0.8395592, 0.625256, 1.297481, 1, 1, 1, 1, 1,
0.8430271, 1.119925, -0.4590279, 1, 1, 1, 1, 1,
0.8447238, -1.599468, 1.849372, 1, 1, 1, 1, 1,
0.8470592, 1.618644, -0.8126973, 1, 1, 1, 1, 1,
0.8538912, 0.08054458, 2.061403, 1, 1, 1, 1, 1,
0.8600409, 0.51357, -0.3467244, 1, 1, 1, 1, 1,
0.8645053, -2.197796, 3.521894, 1, 1, 1, 1, 1,
0.8670955, 1.471265, -0.680273, 1, 1, 1, 1, 1,
0.8688232, 0.14725, 0.7236875, 1, 1, 1, 1, 1,
0.8735993, 0.1302089, 1.156294, 1, 1, 1, 1, 1,
0.9009145, -0.08758912, 0.3341558, 1, 1, 1, 1, 1,
0.9013441, 1.076768, 2.641131, 1, 1, 1, 1, 1,
0.9016286, 0.7110029, 0.8705014, 1, 1, 1, 1, 1,
0.903577, 1.525474, -1.182162, 0, 0, 1, 1, 1,
0.9043224, -0.8136892, 1.95244, 1, 0, 0, 1, 1,
0.9108797, -1.329109, 2.389466, 1, 0, 0, 1, 1,
0.9114282, 1.33562, 1.975216, 1, 0, 0, 1, 1,
0.9169878, 0.7828378, 1.632151, 1, 0, 0, 1, 1,
0.9191154, 1.521755, 0.4845706, 1, 0, 0, 1, 1,
0.9298326, -0.2215839, 0.01917292, 0, 0, 0, 1, 1,
0.9329335, 0.8386046, -1.394272, 0, 0, 0, 1, 1,
0.9341214, 0.8994105, 0.8339914, 0, 0, 0, 1, 1,
0.9358016, 0.07660107, 0.5091373, 0, 0, 0, 1, 1,
0.9396785, -0.1472947, 2.798903, 0, 0, 0, 1, 1,
0.9435974, 0.6950803, 3.212972, 0, 0, 0, 1, 1,
0.9512457, -0.7302443, 1.064234, 0, 0, 0, 1, 1,
0.9517615, -0.2694048, 1.933872, 1, 1, 1, 1, 1,
0.9566507, -1.371406, 2.716336, 1, 1, 1, 1, 1,
0.962531, -1.198042, 2.144665, 1, 1, 1, 1, 1,
0.9725903, -0.4965468, 3.194937, 1, 1, 1, 1, 1,
0.9783888, 2.788486, 1.767478, 1, 1, 1, 1, 1,
0.9785153, 0.8540134, 2.832904, 1, 1, 1, 1, 1,
0.9835149, -1.236222, 3.499773, 1, 1, 1, 1, 1,
0.9997211, 0.8045138, -1.061056, 1, 1, 1, 1, 1,
1.004065, -0.9845314, 2.344898, 1, 1, 1, 1, 1,
1.012533, 0.9226462, 0.367682, 1, 1, 1, 1, 1,
1.015723, 0.5827123, 2.064474, 1, 1, 1, 1, 1,
1.018126, 0.8906488, 2.260808, 1, 1, 1, 1, 1,
1.025075, 0.7763158, -0.5287017, 1, 1, 1, 1, 1,
1.025462, 0.1104857, -0.2783601, 1, 1, 1, 1, 1,
1.041217, 0.7562726, 2.712722, 1, 1, 1, 1, 1,
1.042015, -1.154255, 1.995128, 0, 0, 1, 1, 1,
1.047198, 0.7466763, 0.475087, 1, 0, 0, 1, 1,
1.053676, -2.373574, 3.59361, 1, 0, 0, 1, 1,
1.061103, -0.5909533, 2.408006, 1, 0, 0, 1, 1,
1.061965, 1.261777, 0.8479912, 1, 0, 0, 1, 1,
1.066877, -0.7883286, 0.1769676, 1, 0, 0, 1, 1,
1.070423, 0.6109593, 0.2459994, 0, 0, 0, 1, 1,
1.070609, 0.2344814, 1.061661, 0, 0, 0, 1, 1,
1.085485, 0.7876255, 1.627049, 0, 0, 0, 1, 1,
1.090419, 0.8912315, 1.409132, 0, 0, 0, 1, 1,
1.100072, -0.8164815, 2.874031, 0, 0, 0, 1, 1,
1.104804, -0.9623554, 3.221385, 0, 0, 0, 1, 1,
1.11425, -0.5909028, 1.989282, 0, 0, 0, 1, 1,
1.114898, 0.3904931, 1.791657, 1, 1, 1, 1, 1,
1.115421, 0.139699, 0.2369469, 1, 1, 1, 1, 1,
1.121603, 0.9665294, 1.466938, 1, 1, 1, 1, 1,
1.126953, 0.7919753, 1.158885, 1, 1, 1, 1, 1,
1.135819, 0.3685343, 0.4431618, 1, 1, 1, 1, 1,
1.136002, 0.003525984, -0.04951316, 1, 1, 1, 1, 1,
1.136432, 0.3495852, 2.332359, 1, 1, 1, 1, 1,
1.139913, 2.17646, 1.044073, 1, 1, 1, 1, 1,
1.140137, 0.5581584, -0.4709624, 1, 1, 1, 1, 1,
1.143799, 1.581623, 0.07955669, 1, 1, 1, 1, 1,
1.153193, 1.881879, -0.4305242, 1, 1, 1, 1, 1,
1.154276, -2.149016, 3.182479, 1, 1, 1, 1, 1,
1.154956, 2.604802, 1.77167, 1, 1, 1, 1, 1,
1.156958, 0.9960617, -0.2909335, 1, 1, 1, 1, 1,
1.158085, 2.228726, -1.886517, 1, 1, 1, 1, 1,
1.168386, -0.3691911, 0.6701673, 0, 0, 1, 1, 1,
1.170789, 0.5622609, 0.6468577, 1, 0, 0, 1, 1,
1.18569, 1.623352, 0.9436303, 1, 0, 0, 1, 1,
1.186637, -0.6810858, 0.4333606, 1, 0, 0, 1, 1,
1.188443, -0.9826649, 1.240183, 1, 0, 0, 1, 1,
1.1894, -0.2717542, 3.244063, 1, 0, 0, 1, 1,
1.191149, -0.1846228, 0.5498179, 0, 0, 0, 1, 1,
1.200053, -1.939397, 0.9414707, 0, 0, 0, 1, 1,
1.201203, -0.1942167, 0.6200606, 0, 0, 0, 1, 1,
1.222962, 1.257744, 0.5700027, 0, 0, 0, 1, 1,
1.226837, -1.260077, 1.609143, 0, 0, 0, 1, 1,
1.227206, 2.022111, 1.930588, 0, 0, 0, 1, 1,
1.235258, -0.7146644, 0.7411833, 0, 0, 0, 1, 1,
1.246915, 0.6741119, 1.687433, 1, 1, 1, 1, 1,
1.247534, -0.2183311, 3.59707, 1, 1, 1, 1, 1,
1.263037, 0.2809877, 2.374812, 1, 1, 1, 1, 1,
1.265521, -0.2141356, 1.830856, 1, 1, 1, 1, 1,
1.26911, -0.7079099, 0.8212231, 1, 1, 1, 1, 1,
1.272514, -0.6277795, 1.564161, 1, 1, 1, 1, 1,
1.291102, -0.5044183, 1.394022, 1, 1, 1, 1, 1,
1.308871, 0.2790135, 2.979333, 1, 1, 1, 1, 1,
1.321576, 0.5819291, 0.681998, 1, 1, 1, 1, 1,
1.326163, -1.913838, 3.004592, 1, 1, 1, 1, 1,
1.327803, -1.354551, 1.48248, 1, 1, 1, 1, 1,
1.32925, -0.9384676, 3.247035, 1, 1, 1, 1, 1,
1.358376, -1.170554, 2.638246, 1, 1, 1, 1, 1,
1.39112, -0.08963813, 1.235316, 1, 1, 1, 1, 1,
1.406968, -0.2223403, 0.7108893, 1, 1, 1, 1, 1,
1.414324, -0.8035367, 1.812352, 0, 0, 1, 1, 1,
1.414532, 0.8407488, 2.839265, 1, 0, 0, 1, 1,
1.426539, -0.5512595, 2.754117, 1, 0, 0, 1, 1,
1.429561, 0.5780123, 1.193686, 1, 0, 0, 1, 1,
1.456051, 0.6909262, 0.8200527, 1, 0, 0, 1, 1,
1.462463, -1.058537, 2.959312, 1, 0, 0, 1, 1,
1.471014, 0.8381613, 3.170324, 0, 0, 0, 1, 1,
1.478547, -0.8543863, 2.746783, 0, 0, 0, 1, 1,
1.484668, -1.093639, 2.876227, 0, 0, 0, 1, 1,
1.488765, 0.2355521, 2.072019, 0, 0, 0, 1, 1,
1.49618, -0.6095423, 3.692801, 0, 0, 0, 1, 1,
1.506596, 0.4469265, 0.7257556, 0, 0, 0, 1, 1,
1.512871, -0.8489951, 0.8844426, 0, 0, 0, 1, 1,
1.532513, 0.2571654, 1.245167, 1, 1, 1, 1, 1,
1.545102, -0.1648842, 2.82183, 1, 1, 1, 1, 1,
1.549704, 0.4239453, -1.146188, 1, 1, 1, 1, 1,
1.550125, -2.382694, 1.103445, 1, 1, 1, 1, 1,
1.556457, -1.556461, 2.776743, 1, 1, 1, 1, 1,
1.559856, 0.9498925, 1.090359, 1, 1, 1, 1, 1,
1.559885, -1.054601, 2.107745, 1, 1, 1, 1, 1,
1.56617, 0.6738667, 0.1713, 1, 1, 1, 1, 1,
1.569441, -1.424397, 3.379404, 1, 1, 1, 1, 1,
1.574237, 0.9982765, 2.565816, 1, 1, 1, 1, 1,
1.57447, -1.522064, 2.795982, 1, 1, 1, 1, 1,
1.574585, 0.891594, 2.171909, 1, 1, 1, 1, 1,
1.599723, 0.1125484, 1.839762, 1, 1, 1, 1, 1,
1.609323, -1.212012, 2.292831, 1, 1, 1, 1, 1,
1.646164, -0.8532036, 2.453958, 1, 1, 1, 1, 1,
1.660389, 1.334788, 0.4954802, 0, 0, 1, 1, 1,
1.667428, 2.087797, -1.675875, 1, 0, 0, 1, 1,
1.667766, 1.036475, 0.7426859, 1, 0, 0, 1, 1,
1.671935, 1.885035, -0.7345453, 1, 0, 0, 1, 1,
1.678337, 1.638621, 1.123392, 1, 0, 0, 1, 1,
1.686779, 0.6015902, 0.6286138, 1, 0, 0, 1, 1,
1.694584, -0.08974133, 0.7074602, 0, 0, 0, 1, 1,
1.702016, 0.619863, 1.124668, 0, 0, 0, 1, 1,
1.712249, -1.611685, 0.4555365, 0, 0, 0, 1, 1,
1.713242, -0.8549815, 2.298829, 0, 0, 0, 1, 1,
1.733387, 0.5089986, 3.811667, 0, 0, 0, 1, 1,
1.734457, 0.34639, 1.765374, 0, 0, 0, 1, 1,
1.76485, 0.05602324, 1.869623, 0, 0, 0, 1, 1,
1.78895, -1.260134, 2.335364, 1, 1, 1, 1, 1,
1.790863, -0.773509, 0.9384142, 1, 1, 1, 1, 1,
1.793366, -0.7680579, 1.082642, 1, 1, 1, 1, 1,
1.802263, 1.317707, 0.571763, 1, 1, 1, 1, 1,
1.804296, 0.4091132, 0.6822667, 1, 1, 1, 1, 1,
1.815082, -0.3259556, 0.934517, 1, 1, 1, 1, 1,
1.830334, -0.02322962, 2.094417, 1, 1, 1, 1, 1,
1.833994, -0.3464922, 2.791339, 1, 1, 1, 1, 1,
1.848172, -0.8262562, 0.5514972, 1, 1, 1, 1, 1,
1.866006, 0.5300255, 2.087653, 1, 1, 1, 1, 1,
1.869781, 0.037109, 0.448052, 1, 1, 1, 1, 1,
1.873255, 1.585742, 1.702926, 1, 1, 1, 1, 1,
1.877009, -0.6405807, 2.063207, 1, 1, 1, 1, 1,
1.885366, 1.153102, 1.372136, 1, 1, 1, 1, 1,
1.891945, 0.2733439, 2.887914, 1, 1, 1, 1, 1,
1.908438, -0.3546561, 1.464979, 0, 0, 1, 1, 1,
1.923811, -0.7384288, 1.48072, 1, 0, 0, 1, 1,
1.923884, -0.1367165, 2.803024, 1, 0, 0, 1, 1,
1.961702, 1.648569, 3.226269, 1, 0, 0, 1, 1,
1.974332, 0.242366, 3.139684, 1, 0, 0, 1, 1,
1.979498, -0.1909325, 1.658011, 1, 0, 0, 1, 1,
2.039433, -0.343856, 2.441037, 0, 0, 0, 1, 1,
2.143533, -0.1848632, 2.242625, 0, 0, 0, 1, 1,
2.192945, 0.1148971, -0.009889114, 0, 0, 0, 1, 1,
2.205311, 0.7448255, 2.836082, 0, 0, 0, 1, 1,
2.205599, 0.5354686, 1.665581, 0, 0, 0, 1, 1,
2.245713, -0.7865306, 0.2114162, 0, 0, 0, 1, 1,
2.262832, -0.9375482, 1.455394, 0, 0, 0, 1, 1,
2.324287, 1.157196, -0.08483877, 1, 1, 1, 1, 1,
2.367831, 1.064524, 2.508566, 1, 1, 1, 1, 1,
2.394382, -0.6825815, 1.575371, 1, 1, 1, 1, 1,
2.449859, 1.04193, 0.4440378, 1, 1, 1, 1, 1,
2.48866, 0.258697, 1.227972, 1, 1, 1, 1, 1,
2.633574, 1.689124, 0.6363401, 1, 1, 1, 1, 1,
3.572898, -0.6222525, 1.315318, 1, 1, 1, 1, 1
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
var radius = 9.322236;
var distance = 32.74396;
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
mvMatrix.translate( -0.4631764, 0.1506025, 0.1021228 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.74396);
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
