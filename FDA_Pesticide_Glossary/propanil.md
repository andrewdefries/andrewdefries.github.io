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
-2.977034, -2.36313, -2.586813, 1, 0, 0, 1,
-2.966738, 1.428066, -0.9508752, 1, 0.007843138, 0, 1,
-2.820604, -0.4742131, -1.649541, 1, 0.01176471, 0, 1,
-2.775769, 0.9711462, -0.3425344, 1, 0.01960784, 0, 1,
-2.6734, -1.668674, -3.002162, 1, 0.02352941, 0, 1,
-2.626008, 0.2309871, -2.261656, 1, 0.03137255, 0, 1,
-2.592438, -0.05471086, -0.5419286, 1, 0.03529412, 0, 1,
-2.442826, -1.258149, -2.912137, 1, 0.04313726, 0, 1,
-2.435514, 0.4221202, -1.326954, 1, 0.04705882, 0, 1,
-2.43364, 0.8194325, -2.236732, 1, 0.05490196, 0, 1,
-2.329608, 1.051981, -2.295523, 1, 0.05882353, 0, 1,
-2.300277, 1.028483, 0.3639011, 1, 0.06666667, 0, 1,
-2.292448, -0.4907506, -1.211702, 1, 0.07058824, 0, 1,
-2.241171, 0.4741155, -0.9913954, 1, 0.07843138, 0, 1,
-2.240377, 1.209957, -3.321112, 1, 0.08235294, 0, 1,
-2.224488, -1.680094, -1.653839, 1, 0.09019608, 0, 1,
-2.197929, 0.03855202, -2.362695, 1, 0.09411765, 0, 1,
-2.140366, 0.9916509, -2.648566, 1, 0.1019608, 0, 1,
-2.120367, 0.09925023, -2.023122, 1, 0.1098039, 0, 1,
-2.111418, -1.059172, -0.7083507, 1, 0.1137255, 0, 1,
-2.106039, 1.276785, -0.753564, 1, 0.1215686, 0, 1,
-2.08592, -0.8298621, -0.1389443, 1, 0.1254902, 0, 1,
-2.074204, -0.6044787, -1.531697, 1, 0.1333333, 0, 1,
-2.037809, -2.346493, -2.276068, 1, 0.1372549, 0, 1,
-1.995963, 0.03651695, 0.1620307, 1, 0.145098, 0, 1,
-1.867086, -0.1946003, 1.598947, 1, 0.1490196, 0, 1,
-1.862205, -0.8882126, -3.475319, 1, 0.1568628, 0, 1,
-1.821839, -0.9296259, -1.218462, 1, 0.1607843, 0, 1,
-1.818269, 1.217165, -1.174156, 1, 0.1686275, 0, 1,
-1.787664, -1.094951, -1.840692, 1, 0.172549, 0, 1,
-1.769083, 0.6077831, -0.9390619, 1, 0.1803922, 0, 1,
-1.756277, -0.6895453, -1.992237, 1, 0.1843137, 0, 1,
-1.752983, -0.6316131, -1.643511, 1, 0.1921569, 0, 1,
-1.752816, 1.633506, 1.99198, 1, 0.1960784, 0, 1,
-1.723426, 0.8508845, -1.745685, 1, 0.2039216, 0, 1,
-1.722869, 1.875372, 0.307877, 1, 0.2117647, 0, 1,
-1.713632, -0.3065333, -3.187315, 1, 0.2156863, 0, 1,
-1.706536, -0.1474359, 0.672183, 1, 0.2235294, 0, 1,
-1.686307, 0.8583709, -0.8468905, 1, 0.227451, 0, 1,
-1.681292, 1.238624, -2.596119, 1, 0.2352941, 0, 1,
-1.675742, -0.9948009, -1.218247, 1, 0.2392157, 0, 1,
-1.673383, 0.3466091, -1.410533, 1, 0.2470588, 0, 1,
-1.663511, -1.766478, -1.888708, 1, 0.2509804, 0, 1,
-1.644626, 0.4769435, 0.3838109, 1, 0.2588235, 0, 1,
-1.643184, 0.2168504, -2.110595, 1, 0.2627451, 0, 1,
-1.634032, -0.9067456, -1.312135, 1, 0.2705882, 0, 1,
-1.628631, -0.1093006, -1.088915, 1, 0.2745098, 0, 1,
-1.618017, 1.653627, 0.654867, 1, 0.282353, 0, 1,
-1.600095, 0.9913608, 0.06703395, 1, 0.2862745, 0, 1,
-1.575548, -0.1099745, -2.048131, 1, 0.2941177, 0, 1,
-1.574828, 0.7143795, -0.6209748, 1, 0.3019608, 0, 1,
-1.572421, -0.5054773, -2.649348, 1, 0.3058824, 0, 1,
-1.56954, -1.72508, -3.340224, 1, 0.3137255, 0, 1,
-1.560515, 0.3335409, -1.884399, 1, 0.3176471, 0, 1,
-1.546333, -0.3888204, -0.02965427, 1, 0.3254902, 0, 1,
-1.510923, -0.05177084, -1.796233, 1, 0.3294118, 0, 1,
-1.491388, -0.2160504, -0.4678711, 1, 0.3372549, 0, 1,
-1.489416, -0.5776612, -0.6005265, 1, 0.3411765, 0, 1,
-1.485801, -1.846976, -3.191667, 1, 0.3490196, 0, 1,
-1.473307, -1.48333, -3.69682, 1, 0.3529412, 0, 1,
-1.471807, 0.4380181, -0.8154544, 1, 0.3607843, 0, 1,
-1.460451, -1.824268, -2.182011, 1, 0.3647059, 0, 1,
-1.455238, 0.770112, -0.8100167, 1, 0.372549, 0, 1,
-1.450599, -0.1017748, -1.479884, 1, 0.3764706, 0, 1,
-1.4457, 2.383817, -0.1537981, 1, 0.3843137, 0, 1,
-1.429254, -2.399771, -1.954808, 1, 0.3882353, 0, 1,
-1.410286, 0.8132235, -2.395163, 1, 0.3960784, 0, 1,
-1.407018, -0.5036734, -2.468258, 1, 0.4039216, 0, 1,
-1.400573, -0.5718896, -2.507713, 1, 0.4078431, 0, 1,
-1.400238, -0.2866354, -1.023515, 1, 0.4156863, 0, 1,
-1.399232, 0.3030935, 0.2370714, 1, 0.4196078, 0, 1,
-1.389474, -0.5058103, 0.1754307, 1, 0.427451, 0, 1,
-1.386641, -1.291594, -1.786359, 1, 0.4313726, 0, 1,
-1.365066, 0.6173078, -1.12481, 1, 0.4392157, 0, 1,
-1.361181, 0.7726287, 0.7454752, 1, 0.4431373, 0, 1,
-1.356144, -0.4313143, 1.459663, 1, 0.4509804, 0, 1,
-1.349792, 1.118391, 0.8570321, 1, 0.454902, 0, 1,
-1.34767, 1.700185, -0.702601, 1, 0.4627451, 0, 1,
-1.344349, -0.4403488, -4.091693, 1, 0.4666667, 0, 1,
-1.339666, 0.584393, 0.7863609, 1, 0.4745098, 0, 1,
-1.338056, -0.752267, -1.779843, 1, 0.4784314, 0, 1,
-1.336543, -0.02654363, -0.6053913, 1, 0.4862745, 0, 1,
-1.334213, 0.314881, -2.523911, 1, 0.4901961, 0, 1,
-1.329951, 0.1748531, -4.28102, 1, 0.4980392, 0, 1,
-1.327413, -1.327291, -1.919725, 1, 0.5058824, 0, 1,
-1.324329, 0.2243472, -0.3606856, 1, 0.509804, 0, 1,
-1.32218, -1.483195, -3.347734, 1, 0.5176471, 0, 1,
-1.321037, -0.8192358, -3.073707, 1, 0.5215687, 0, 1,
-1.316734, -0.561675, -1.168382, 1, 0.5294118, 0, 1,
-1.308127, -1.137137, -2.316131, 1, 0.5333334, 0, 1,
-1.296345, -1.377644, -2.210305, 1, 0.5411765, 0, 1,
-1.292318, 1.146945, -2.100431, 1, 0.5450981, 0, 1,
-1.291917, -1.400716, -2.411477, 1, 0.5529412, 0, 1,
-1.288858, -0.02559056, -1.132098, 1, 0.5568628, 0, 1,
-1.279806, -1.20725, -0.8681415, 1, 0.5647059, 0, 1,
-1.260452, 1.238192, -1.415565, 1, 0.5686275, 0, 1,
-1.258191, 0.4141926, -1.003155, 1, 0.5764706, 0, 1,
-1.241373, -0.8155484, -2.221585, 1, 0.5803922, 0, 1,
-1.231783, 0.1229248, -2.722722, 1, 0.5882353, 0, 1,
-1.226409, -0.7622569, -1.631389, 1, 0.5921569, 0, 1,
-1.220939, -1.721128, -2.723616, 1, 0.6, 0, 1,
-1.211608, -0.2298197, -2.584741, 1, 0.6078432, 0, 1,
-1.209075, -1.550609, -3.342096, 1, 0.6117647, 0, 1,
-1.208939, -0.09072563, -0.04312385, 1, 0.6196079, 0, 1,
-1.203013, -1.191482, -1.778087, 1, 0.6235294, 0, 1,
-1.199537, -1.25954, -2.87662, 1, 0.6313726, 0, 1,
-1.193882, 1.650217, -0.6365148, 1, 0.6352941, 0, 1,
-1.190488, 0.5297161, -2.118897, 1, 0.6431373, 0, 1,
-1.189334, 0.5542365, -0.1929391, 1, 0.6470588, 0, 1,
-1.179579, 0.9306891, -1.873912, 1, 0.654902, 0, 1,
-1.177903, -3.311605, -2.424878, 1, 0.6588235, 0, 1,
-1.162536, 1.261839, -0.59885, 1, 0.6666667, 0, 1,
-1.160879, 0.02665164, -1.98259, 1, 0.6705883, 0, 1,
-1.15831, 0.1157193, -1.306913, 1, 0.6784314, 0, 1,
-1.155668, -1.466731, -4.088816, 1, 0.682353, 0, 1,
-1.146577, -1.416617, -2.265511, 1, 0.6901961, 0, 1,
-1.146214, -1.668885, -1.337621, 1, 0.6941177, 0, 1,
-1.140056, -1.415408, -1.771137, 1, 0.7019608, 0, 1,
-1.137593, -0.5728318, -1.199945, 1, 0.7098039, 0, 1,
-1.135997, 1.200626, 2.095916, 1, 0.7137255, 0, 1,
-1.133736, -0.1272902, -2.645616, 1, 0.7215686, 0, 1,
-1.126439, 0.3000207, -1.821105, 1, 0.7254902, 0, 1,
-1.125835, 1.603555, 0.9790884, 1, 0.7333333, 0, 1,
-1.123714, 2.148963, 0.7450097, 1, 0.7372549, 0, 1,
-1.117963, -0.2005417, -2.726621, 1, 0.7450981, 0, 1,
-1.116764, -1.846677, -0.5604477, 1, 0.7490196, 0, 1,
-1.112104, -1.353464, -2.476463, 1, 0.7568628, 0, 1,
-1.110072, 0.9688026, -0.3132649, 1, 0.7607843, 0, 1,
-1.104761, -0.5577825, -1.897187, 1, 0.7686275, 0, 1,
-1.103383, 0.8809006, 0.1845825, 1, 0.772549, 0, 1,
-1.099966, 0.8231703, -1.519221, 1, 0.7803922, 0, 1,
-1.095971, -0.5947471, -1.88455, 1, 0.7843137, 0, 1,
-1.093284, -0.3010858, -0.8512141, 1, 0.7921569, 0, 1,
-1.085413, -0.8721177, -2.509729, 1, 0.7960784, 0, 1,
-1.081652, 0.08242752, -1.035477, 1, 0.8039216, 0, 1,
-1.077169, -0.4852369, -2.22027, 1, 0.8117647, 0, 1,
-1.073635, 1.656618, -0.6078232, 1, 0.8156863, 0, 1,
-1.060646, 0.3000548, -2.096219, 1, 0.8235294, 0, 1,
-1.055979, -1.207013, -2.647346, 1, 0.827451, 0, 1,
-1.054102, 1.227252, -2.12413, 1, 0.8352941, 0, 1,
-1.051972, 0.009122692, -0.6011265, 1, 0.8392157, 0, 1,
-1.051868, 0.004523264, -0.5980866, 1, 0.8470588, 0, 1,
-1.048411, 0.214263, -1.479746, 1, 0.8509804, 0, 1,
-1.044346, 0.9339222, -1.222145, 1, 0.8588235, 0, 1,
-1.030598, 0.06630191, -2.488006, 1, 0.8627451, 0, 1,
-1.010437, 0.6028057, -1.911185, 1, 0.8705882, 0, 1,
-1.006459, -0.5999869, -0.09750439, 1, 0.8745098, 0, 1,
-1.003943, 0.8148415, -1.12452, 1, 0.8823529, 0, 1,
-1.000836, -1.016307, -1.509071, 1, 0.8862745, 0, 1,
-1.000137, 1.47095, 0.1353251, 1, 0.8941177, 0, 1,
-0.9977345, 1.458439, 0.1853314, 1, 0.8980392, 0, 1,
-0.9935521, 0.782369, -1.927994, 1, 0.9058824, 0, 1,
-0.9896255, -0.9209003, -2.921683, 1, 0.9137255, 0, 1,
-0.9853171, 1.06533, -0.3882779, 1, 0.9176471, 0, 1,
-0.980408, -0.3545335, -2.740241, 1, 0.9254902, 0, 1,
-0.9754849, -0.1272332, -1.014624, 1, 0.9294118, 0, 1,
-0.9655206, 0.3062751, -2.6512, 1, 0.9372549, 0, 1,
-0.9607463, 2.23279, -0.921932, 1, 0.9411765, 0, 1,
-0.9606565, -0.8464978, -2.394437, 1, 0.9490196, 0, 1,
-0.960318, -0.8685163, -2.935672, 1, 0.9529412, 0, 1,
-0.9582989, 1.092514, 0.1386749, 1, 0.9607843, 0, 1,
-0.9543194, -0.132488, -2.95367, 1, 0.9647059, 0, 1,
-0.9336044, 1.530857, -0.926403, 1, 0.972549, 0, 1,
-0.9320202, -0.06387001, -1.911564, 1, 0.9764706, 0, 1,
-0.9300989, -0.4135352, 0.9122017, 1, 0.9843137, 0, 1,
-0.926411, 0.2759478, -2.409828, 1, 0.9882353, 0, 1,
-0.9263833, 1.745363, -0.6817542, 1, 0.9960784, 0, 1,
-0.9241154, -2.061206, -3.243666, 0.9960784, 1, 0, 1,
-0.9194938, 1.17458, -1.656014, 0.9921569, 1, 0, 1,
-0.9186721, -0.8465857, -2.125011, 0.9843137, 1, 0, 1,
-0.9179736, 0.7755987, -1.45675, 0.9803922, 1, 0, 1,
-0.9083986, -0.08723898, -0.7217695, 0.972549, 1, 0, 1,
-0.9054609, 0.08718821, -1.494112, 0.9686275, 1, 0, 1,
-0.9004298, -0.4894552, -1.593436, 0.9607843, 1, 0, 1,
-0.899285, -2.85087, -2.516805, 0.9568627, 1, 0, 1,
-0.8942156, -0.5115367, -0.8658685, 0.9490196, 1, 0, 1,
-0.8877205, -0.6848713, -2.866972, 0.945098, 1, 0, 1,
-0.8823599, 0.2949835, -0.8149973, 0.9372549, 1, 0, 1,
-0.8817917, -0.7227147, -3.423021, 0.9333333, 1, 0, 1,
-0.8815885, 0.7886742, -0.1820285, 0.9254902, 1, 0, 1,
-0.8603311, 0.7613887, -2.5158, 0.9215686, 1, 0, 1,
-0.8600225, 0.3578452, 0.2032282, 0.9137255, 1, 0, 1,
-0.857527, -0.7424827, -1.519997, 0.9098039, 1, 0, 1,
-0.8520748, -0.4970193, -1.246292, 0.9019608, 1, 0, 1,
-0.8441942, -0.6279856, -0.8472357, 0.8941177, 1, 0, 1,
-0.8348554, -0.2593147, -1.557738, 0.8901961, 1, 0, 1,
-0.8274658, 1.302974, -0.880827, 0.8823529, 1, 0, 1,
-0.8205113, 0.280831, -1.224262, 0.8784314, 1, 0, 1,
-0.8201122, -0.02783231, -1.984446, 0.8705882, 1, 0, 1,
-0.818021, -0.4922209, -3.186126, 0.8666667, 1, 0, 1,
-0.8175426, -0.4588033, -2.173362, 0.8588235, 1, 0, 1,
-0.810295, -0.200769, -2.718847, 0.854902, 1, 0, 1,
-0.7986495, 0.4729862, 0.4082656, 0.8470588, 1, 0, 1,
-0.7960208, 0.9137051, -0.798937, 0.8431373, 1, 0, 1,
-0.7927498, 1.227581, -1.020248, 0.8352941, 1, 0, 1,
-0.790549, -2.302351, -3.035487, 0.8313726, 1, 0, 1,
-0.7877524, 0.64533, 0.8550161, 0.8235294, 1, 0, 1,
-0.7774037, 0.02657121, -1.827432, 0.8196079, 1, 0, 1,
-0.7765828, -0.1346661, -1.344642, 0.8117647, 1, 0, 1,
-0.7757526, 1.042753, -1.691434, 0.8078431, 1, 0, 1,
-0.7751687, -0.6294041, -1.113239, 0.8, 1, 0, 1,
-0.7650521, 0.03825963, -1.100468, 0.7921569, 1, 0, 1,
-0.7562405, 0.2847601, 0.05324492, 0.7882353, 1, 0, 1,
-0.752952, 0.8869822, -0.5925014, 0.7803922, 1, 0, 1,
-0.751634, 0.8267276, -0.402528, 0.7764706, 1, 0, 1,
-0.7452571, 0.6407455, -0.1527865, 0.7686275, 1, 0, 1,
-0.7336723, -0.830175, -1.895203, 0.7647059, 1, 0, 1,
-0.7273148, 0.1373724, -1.344991, 0.7568628, 1, 0, 1,
-0.7244824, 0.841703, -2.489614, 0.7529412, 1, 0, 1,
-0.7238311, -0.4315801, -2.470323, 0.7450981, 1, 0, 1,
-0.7221788, 0.3687065, -1.260154, 0.7411765, 1, 0, 1,
-0.7186998, -0.2749843, -1.63041, 0.7333333, 1, 0, 1,
-0.7170551, 0.5543463, -1.028194, 0.7294118, 1, 0, 1,
-0.716736, -0.09400828, -2.465907, 0.7215686, 1, 0, 1,
-0.7128979, 0.9061865, -0.3340548, 0.7176471, 1, 0, 1,
-0.6992397, -0.5237535, -1.604419, 0.7098039, 1, 0, 1,
-0.6991141, -0.4522348, -1.809407, 0.7058824, 1, 0, 1,
-0.6950528, 0.3412527, -2.06557, 0.6980392, 1, 0, 1,
-0.6941896, 1.127528, 0.01574549, 0.6901961, 1, 0, 1,
-0.6934654, 0.04628842, -2.555628, 0.6862745, 1, 0, 1,
-0.6915039, 1.95528, -2.650697, 0.6784314, 1, 0, 1,
-0.6912138, -0.4273976, -2.185811, 0.6745098, 1, 0, 1,
-0.6911346, 1.740497, 1.744545, 0.6666667, 1, 0, 1,
-0.6899629, 0.189814, -0.5573499, 0.6627451, 1, 0, 1,
-0.687178, -0.08064469, -2.143513, 0.654902, 1, 0, 1,
-0.6854205, -0.7002079, -1.18641, 0.6509804, 1, 0, 1,
-0.6853368, 0.2050089, -1.263465, 0.6431373, 1, 0, 1,
-0.6815108, -1.426072, -2.230958, 0.6392157, 1, 0, 1,
-0.6738758, 1.017049, -1.332048, 0.6313726, 1, 0, 1,
-0.6683218, -0.419621, -1.309775, 0.627451, 1, 0, 1,
-0.6678491, -0.783218, -3.001806, 0.6196079, 1, 0, 1,
-0.6651986, 0.3125276, -2.48397, 0.6156863, 1, 0, 1,
-0.6636539, -0.599886, -3.319765, 0.6078432, 1, 0, 1,
-0.6630628, 0.7245879, 0.02226483, 0.6039216, 1, 0, 1,
-0.6562216, 0.5282836, -1.726777, 0.5960785, 1, 0, 1,
-0.65343, -1.189112, -4.168732, 0.5882353, 1, 0, 1,
-0.649858, -0.2191281, -1.612148, 0.5843138, 1, 0, 1,
-0.6482282, -1.389019, -1.168077, 0.5764706, 1, 0, 1,
-0.6446438, -0.08406534, -2.319154, 0.572549, 1, 0, 1,
-0.6443429, -0.9989234, -2.843136, 0.5647059, 1, 0, 1,
-0.6427535, 2.046786, -0.182019, 0.5607843, 1, 0, 1,
-0.6395867, -0.2472503, -4.093295, 0.5529412, 1, 0, 1,
-0.6375227, -0.2959877, -0.7814869, 0.5490196, 1, 0, 1,
-0.6373866, 0.6792689, -2.243818, 0.5411765, 1, 0, 1,
-0.6320432, 0.3985349, -2.973023, 0.5372549, 1, 0, 1,
-0.6308903, 0.589784, -2.299708, 0.5294118, 1, 0, 1,
-0.6275504, -1.697011, -3.93088, 0.5254902, 1, 0, 1,
-0.6260985, -1.929697, -3.219008, 0.5176471, 1, 0, 1,
-0.6260264, -2.945639, -2.631508, 0.5137255, 1, 0, 1,
-0.6225288, 0.4135409, -1.668686, 0.5058824, 1, 0, 1,
-0.6204758, 0.2461672, -1.451377, 0.5019608, 1, 0, 1,
-0.6175058, -1.236647, -0.2668827, 0.4941176, 1, 0, 1,
-0.6152139, -0.4159549, -3.555571, 0.4862745, 1, 0, 1,
-0.6146504, 0.7298528, -0.7681152, 0.4823529, 1, 0, 1,
-0.6117555, 0.5483469, -2.01308, 0.4745098, 1, 0, 1,
-0.6109259, 0.2247235, 0.7831602, 0.4705882, 1, 0, 1,
-0.6064737, -1.53149, -3.357445, 0.4627451, 1, 0, 1,
-0.6058108, -0.8177789, -1.330973, 0.4588235, 1, 0, 1,
-0.6009596, -0.1209631, -1.661755, 0.4509804, 1, 0, 1,
-0.5978898, -0.105676, -1.668025, 0.4470588, 1, 0, 1,
-0.5955202, 0.05259216, -2.634653, 0.4392157, 1, 0, 1,
-0.594242, 0.8450739, -1.56253, 0.4352941, 1, 0, 1,
-0.5847725, -0.6484635, -3.81844, 0.427451, 1, 0, 1,
-0.5716167, -1.225831, -1.569585, 0.4235294, 1, 0, 1,
-0.5698168, -1.734911, -2.534783, 0.4156863, 1, 0, 1,
-0.5585568, -0.9852737, -4.676356, 0.4117647, 1, 0, 1,
-0.556648, 1.618508, -2.4507, 0.4039216, 1, 0, 1,
-0.556083, 0.1887498, -1.270527, 0.3960784, 1, 0, 1,
-0.5481158, -0.01660042, -0.7696683, 0.3921569, 1, 0, 1,
-0.546612, -1.626143, -2.480224, 0.3843137, 1, 0, 1,
-0.5417663, 0.8682697, -1.191876, 0.3803922, 1, 0, 1,
-0.5288817, -0.6457424, -2.163487, 0.372549, 1, 0, 1,
-0.5258108, -0.6007364, -2.223617, 0.3686275, 1, 0, 1,
-0.5195285, 0.6715774, -3.600111, 0.3607843, 1, 0, 1,
-0.5182764, 0.401326, -1.54118, 0.3568628, 1, 0, 1,
-0.5163583, -0.6709992, -3.811954, 0.3490196, 1, 0, 1,
-0.5159997, 0.4998185, -1.781808, 0.345098, 1, 0, 1,
-0.5106198, -0.7280332, -2.40052, 0.3372549, 1, 0, 1,
-0.5065963, 0.4436849, -0.3276682, 0.3333333, 1, 0, 1,
-0.506227, -0.6527414, -2.090656, 0.3254902, 1, 0, 1,
-0.5032632, 0.8386019, -0.4071491, 0.3215686, 1, 0, 1,
-0.5006778, 0.300679, -1.487204, 0.3137255, 1, 0, 1,
-0.4979955, 0.4516233, -1.94714, 0.3098039, 1, 0, 1,
-0.4970882, 0.4384575, -2.195137, 0.3019608, 1, 0, 1,
-0.4969156, -0.6417657, -1.55978, 0.2941177, 1, 0, 1,
-0.4963234, 0.09858389, -0.4730113, 0.2901961, 1, 0, 1,
-0.4931082, 0.7690759, 0.1102927, 0.282353, 1, 0, 1,
-0.4919876, -0.2945294, -3.02778, 0.2784314, 1, 0, 1,
-0.4885426, -0.08845764, -2.21898, 0.2705882, 1, 0, 1,
-0.488393, 0.2428987, 0.6244671, 0.2666667, 1, 0, 1,
-0.4876266, -1.145765, -3.240245, 0.2588235, 1, 0, 1,
-0.4833658, 0.3563061, -1.413433, 0.254902, 1, 0, 1,
-0.4773059, -1.695515, -1.983609, 0.2470588, 1, 0, 1,
-0.47394, 0.6059596, 0.5366217, 0.2431373, 1, 0, 1,
-0.4696643, -0.2129178, -2.015327, 0.2352941, 1, 0, 1,
-0.46924, 2.32661, -1.309152, 0.2313726, 1, 0, 1,
-0.4661373, 0.6099875, 0.7231759, 0.2235294, 1, 0, 1,
-0.4568222, -0.9847314, -3.465907, 0.2196078, 1, 0, 1,
-0.4560162, 2.667402, -0.5697966, 0.2117647, 1, 0, 1,
-0.4549575, 1.328903, -1.693669, 0.2078431, 1, 0, 1,
-0.4528201, 2.093114, -1.546796, 0.2, 1, 0, 1,
-0.4526789, 0.8034704, 0.3566062, 0.1921569, 1, 0, 1,
-0.4496507, 0.6883453, -1.970421, 0.1882353, 1, 0, 1,
-0.4478797, 0.9895542, 0.4387171, 0.1803922, 1, 0, 1,
-0.4454336, 0.06245823, -0.6736024, 0.1764706, 1, 0, 1,
-0.4448617, -0.3985098, -2.066326, 0.1686275, 1, 0, 1,
-0.444052, -0.6170102, -2.798837, 0.1647059, 1, 0, 1,
-0.4342303, -0.4031561, -3.061035, 0.1568628, 1, 0, 1,
-0.4320944, 0.03420098, -1.661571, 0.1529412, 1, 0, 1,
-0.4316414, -1.21506, -0.6732853, 0.145098, 1, 0, 1,
-0.4266551, 0.08377213, -1.342491, 0.1411765, 1, 0, 1,
-0.4242034, -1.894069, -2.612428, 0.1333333, 1, 0, 1,
-0.4241867, -0.7504453, -2.190922, 0.1294118, 1, 0, 1,
-0.4233764, 0.4067621, -0.02423228, 0.1215686, 1, 0, 1,
-0.4224919, -0.6139153, -0.6539742, 0.1176471, 1, 0, 1,
-0.4223702, -1.00106, -5.234219, 0.1098039, 1, 0, 1,
-0.421952, 1.944525, -0.4219326, 0.1058824, 1, 0, 1,
-0.4218313, -1.213308, -2.249877, 0.09803922, 1, 0, 1,
-0.4152711, -0.1073417, -1.642841, 0.09019608, 1, 0, 1,
-0.4111313, 0.9357663, -0.06359172, 0.08627451, 1, 0, 1,
-0.410753, 0.6398354, -0.4884732, 0.07843138, 1, 0, 1,
-0.4099307, 0.4267901, -0.6796936, 0.07450981, 1, 0, 1,
-0.4096196, -0.8320982, -1.903919, 0.06666667, 1, 0, 1,
-0.4076551, -0.4827106, -2.881398, 0.0627451, 1, 0, 1,
-0.3986324, 0.2505335, -0.1112917, 0.05490196, 1, 0, 1,
-0.3980984, 1.331221, 0.8146492, 0.05098039, 1, 0, 1,
-0.3967635, -0.374897, -2.824636, 0.04313726, 1, 0, 1,
-0.3941472, 0.6803634, 0.6788669, 0.03921569, 1, 0, 1,
-0.3937178, 0.5793431, 1.039342, 0.03137255, 1, 0, 1,
-0.3903831, -1.623984, -4.082199, 0.02745098, 1, 0, 1,
-0.3896333, -0.9676726, -1.546674, 0.01960784, 1, 0, 1,
-0.3863747, -0.6408296, -2.596307, 0.01568628, 1, 0, 1,
-0.3861815, -0.1424662, -2.124847, 0.007843138, 1, 0, 1,
-0.3831089, 1.585678, 0.2282191, 0.003921569, 1, 0, 1,
-0.3825442, 0.7690461, -0.6606339, 0, 1, 0.003921569, 1,
-0.3809779, 1.178424, 1.558679, 0, 1, 0.01176471, 1,
-0.3807621, -0.6155563, -2.992892, 0, 1, 0.01568628, 1,
-0.3796994, -0.6303785, -1.946221, 0, 1, 0.02352941, 1,
-0.3727944, -1.564928, -1.366519, 0, 1, 0.02745098, 1,
-0.370454, 0.9238319, -0.2815539, 0, 1, 0.03529412, 1,
-0.3668279, -0.9980115, -3.807856, 0, 1, 0.03921569, 1,
-0.366368, -0.8317978, -2.408039, 0, 1, 0.04705882, 1,
-0.3650387, -0.9024111, -3.193654, 0, 1, 0.05098039, 1,
-0.3610345, -0.8798939, -1.712209, 0, 1, 0.05882353, 1,
-0.3552546, -0.6314381, -3.429407, 0, 1, 0.0627451, 1,
-0.3533956, 0.5853587, -1.098171, 0, 1, 0.07058824, 1,
-0.3526911, 0.151834, -1.442484, 0, 1, 0.07450981, 1,
-0.3503384, -0.1489867, -1.017538, 0, 1, 0.08235294, 1,
-0.3497578, 1.007002, -0.2512333, 0, 1, 0.08627451, 1,
-0.3495632, -1.919887, -3.34133, 0, 1, 0.09411765, 1,
-0.3489137, -0.9405807, -2.026918, 0, 1, 0.1019608, 1,
-0.3474891, -1.013737, -3.319671, 0, 1, 0.1058824, 1,
-0.3437952, -0.59979, -2.195426, 0, 1, 0.1137255, 1,
-0.3436043, -0.1835279, -1.633541, 0, 1, 0.1176471, 1,
-0.3415063, -0.2210304, -0.5805635, 0, 1, 0.1254902, 1,
-0.3397194, 0.6142994, -1.808684, 0, 1, 0.1294118, 1,
-0.3333691, -1.000172, -3.441184, 0, 1, 0.1372549, 1,
-0.3330902, 1.897876, 0.350145, 0, 1, 0.1411765, 1,
-0.332878, 1.147811, -1.698579, 0, 1, 0.1490196, 1,
-0.3296479, -1.902773, -3.338874, 0, 1, 0.1529412, 1,
-0.3266393, -0.4308229, -2.611521, 0, 1, 0.1607843, 1,
-0.3249952, -0.8454832, -3.045594, 0, 1, 0.1647059, 1,
-0.3189159, -0.5519859, -1.743486, 0, 1, 0.172549, 1,
-0.3150229, -0.3930274, -0.8008552, 0, 1, 0.1764706, 1,
-0.3144152, 0.3663704, 0.3272989, 0, 1, 0.1843137, 1,
-0.3135389, 0.2571341, -0.9943738, 0, 1, 0.1882353, 1,
-0.3133592, 0.6729081, 0.2840188, 0, 1, 0.1960784, 1,
-0.3120292, 1.409774, -0.499966, 0, 1, 0.2039216, 1,
-0.3116906, -2.250472, -3.052979, 0, 1, 0.2078431, 1,
-0.3103857, -0.1483673, -2.043508, 0, 1, 0.2156863, 1,
-0.3100421, -0.8430751, -3.664553, 0, 1, 0.2196078, 1,
-0.3058456, 0.1745906, -1.961922, 0, 1, 0.227451, 1,
-0.30426, 0.647255, -0.8050145, 0, 1, 0.2313726, 1,
-0.2995004, 0.5686553, -1.799202, 0, 1, 0.2392157, 1,
-0.297921, 0.4932075, 0.1744932, 0, 1, 0.2431373, 1,
-0.2972327, 1.147502, 1.116311, 0, 1, 0.2509804, 1,
-0.2947357, -1.076742, -2.247783, 0, 1, 0.254902, 1,
-0.2831244, 0.7007381, -0.6950905, 0, 1, 0.2627451, 1,
-0.2825254, -1.04775, -3.416082, 0, 1, 0.2666667, 1,
-0.28094, 0.9816159, -1.151746, 0, 1, 0.2745098, 1,
-0.2802057, 0.6149237, -2.734578, 0, 1, 0.2784314, 1,
-0.2769996, -0.9858001, -2.24906, 0, 1, 0.2862745, 1,
-0.2762916, -1.327354, -3.171255, 0, 1, 0.2901961, 1,
-0.2759537, 0.4011763, -1.827871, 0, 1, 0.2980392, 1,
-0.2722366, -0.4583347, -3.145089, 0, 1, 0.3058824, 1,
-0.2692356, 0.7958654, -2.358134, 0, 1, 0.3098039, 1,
-0.2684287, -0.7036358, -2.845512, 0, 1, 0.3176471, 1,
-0.2675273, 0.2152091, -0.006585533, 0, 1, 0.3215686, 1,
-0.2658818, -1.424783, -2.997966, 0, 1, 0.3294118, 1,
-0.2652166, -0.4810917, -3.953892, 0, 1, 0.3333333, 1,
-0.2624561, -0.4738832, -2.188212, 0, 1, 0.3411765, 1,
-0.2609886, 0.03949745, -3.315111, 0, 1, 0.345098, 1,
-0.2596342, -0.7342525, -1.838735, 0, 1, 0.3529412, 1,
-0.2576735, 2.251071, -0.4390712, 0, 1, 0.3568628, 1,
-0.2568933, -0.6239246, -3.481606, 0, 1, 0.3647059, 1,
-0.2564647, -1.498039, -2.737144, 0, 1, 0.3686275, 1,
-0.2494701, 0.112468, -1.709486, 0, 1, 0.3764706, 1,
-0.2492963, -0.01550709, -1.447739, 0, 1, 0.3803922, 1,
-0.2492624, -1.182363, -2.37798, 0, 1, 0.3882353, 1,
-0.2477379, 1.031715, 0.3394237, 0, 1, 0.3921569, 1,
-0.2448043, -0.2888566, -2.001377, 0, 1, 0.4, 1,
-0.2424062, -0.5356335, -4.04581, 0, 1, 0.4078431, 1,
-0.2378689, 1.065222, -1.582689, 0, 1, 0.4117647, 1,
-0.2367455, 1.824306, -0.1980868, 0, 1, 0.4196078, 1,
-0.2336553, 1.200609, -0.09307585, 0, 1, 0.4235294, 1,
-0.2314817, 0.7130805, -0.6826809, 0, 1, 0.4313726, 1,
-0.2312844, -0.8602718, -2.21523, 0, 1, 0.4352941, 1,
-0.2304176, 1.369453, 0.6506506, 0, 1, 0.4431373, 1,
-0.2282206, -1.355349, -2.039465, 0, 1, 0.4470588, 1,
-0.2280628, 1.488158, -1.812827, 0, 1, 0.454902, 1,
-0.2269164, -0.248635, -2.223762, 0, 1, 0.4588235, 1,
-0.2266836, 0.819488, -0.9980974, 0, 1, 0.4666667, 1,
-0.2223318, 1.711067, -1.071392, 0, 1, 0.4705882, 1,
-0.2216224, -0.0863316, -1.947538, 0, 1, 0.4784314, 1,
-0.2212526, 0.3119703, 0.5781142, 0, 1, 0.4823529, 1,
-0.2185861, -0.3497899, -2.184538, 0, 1, 0.4901961, 1,
-0.2145431, 1.478914, 0.3346447, 0, 1, 0.4941176, 1,
-0.2139657, 0.3736747, 0.4288962, 0, 1, 0.5019608, 1,
-0.2075812, -0.1066483, -3.203033, 0, 1, 0.509804, 1,
-0.2035003, -0.8415908, -2.924689, 0, 1, 0.5137255, 1,
-0.1907881, -0.6874961, -4.108613, 0, 1, 0.5215687, 1,
-0.1905228, -0.7306665, -2.374932, 0, 1, 0.5254902, 1,
-0.1904467, -0.1393823, -0.8607487, 0, 1, 0.5333334, 1,
-0.1893291, 0.6055611, 1.028477, 0, 1, 0.5372549, 1,
-0.1886844, -0.3412933, -1.898255, 0, 1, 0.5450981, 1,
-0.1874695, -0.3514416, -2.294278, 0, 1, 0.5490196, 1,
-0.1863801, -1.387669, -2.101688, 0, 1, 0.5568628, 1,
-0.1851002, -0.3384586, -2.025092, 0, 1, 0.5607843, 1,
-0.1850514, -0.3094561, -3.560537, 0, 1, 0.5686275, 1,
-0.184389, 2.222015, 0.91655, 0, 1, 0.572549, 1,
-0.1816424, 0.0152643, -0.5044529, 0, 1, 0.5803922, 1,
-0.1795826, -0.9800327, -1.647523, 0, 1, 0.5843138, 1,
-0.1783398, 0.4469617, -1.655088, 0, 1, 0.5921569, 1,
-0.1724437, -1.479133, -3.549198, 0, 1, 0.5960785, 1,
-0.1718954, -0.9034827, -6.40933, 0, 1, 0.6039216, 1,
-0.1655098, -0.4629716, -3.721268, 0, 1, 0.6117647, 1,
-0.1622301, 0.8262624, -0.1319071, 0, 1, 0.6156863, 1,
-0.1552595, -0.8994039, -3.130831, 0, 1, 0.6235294, 1,
-0.1550932, -0.1451448, -3.110906, 0, 1, 0.627451, 1,
-0.1538859, -0.9620539, -2.72622, 0, 1, 0.6352941, 1,
-0.1448152, 1.055351, 1.762107, 0, 1, 0.6392157, 1,
-0.1443596, -0.1848148, -3.398199, 0, 1, 0.6470588, 1,
-0.1430119, 0.03797542, -0.6483955, 0, 1, 0.6509804, 1,
-0.1427814, -1.019268, -1.131783, 0, 1, 0.6588235, 1,
-0.1418462, -0.8264597, -3.644514, 0, 1, 0.6627451, 1,
-0.1386711, -0.2521886, -1.408988, 0, 1, 0.6705883, 1,
-0.1370869, 1.561911, -0.3720635, 0, 1, 0.6745098, 1,
-0.1297853, 2.573908, 0.5887878, 0, 1, 0.682353, 1,
-0.1215915, 1.4448, 1.152998, 0, 1, 0.6862745, 1,
-0.1207254, 0.8586811, 1.46097, 0, 1, 0.6941177, 1,
-0.1193981, 0.1328556, -0.2256323, 0, 1, 0.7019608, 1,
-0.113373, -0.1067602, -2.876636, 0, 1, 0.7058824, 1,
-0.1089492, 1.147538, 1.74926, 0, 1, 0.7137255, 1,
-0.1070962, 0.09113133, 0.6632458, 0, 1, 0.7176471, 1,
-0.1069507, 0.1286943, -0.4285837, 0, 1, 0.7254902, 1,
-0.1055563, 0.07540966, -1.034585, 0, 1, 0.7294118, 1,
-0.1008976, -0.3164672, -2.107046, 0, 1, 0.7372549, 1,
-0.09608836, 0.5547565, -0.65268, 0, 1, 0.7411765, 1,
-0.08397495, 0.55074, 0.6056639, 0, 1, 0.7490196, 1,
-0.08389371, 0.3992599, -0.3913777, 0, 1, 0.7529412, 1,
-0.08232734, 1.36154, 0.518587, 0, 1, 0.7607843, 1,
-0.08018419, 1.304991, 0.2057092, 0, 1, 0.7647059, 1,
-0.07856639, -0.5778636, -3.183315, 0, 1, 0.772549, 1,
-0.07562032, -1.483356, -2.429755, 0, 1, 0.7764706, 1,
-0.07372954, 0.7227544, -0.226086, 0, 1, 0.7843137, 1,
-0.07326269, 0.3980887, -2.10538, 0, 1, 0.7882353, 1,
-0.0704324, 0.9400483, 1.548923, 0, 1, 0.7960784, 1,
-0.06884076, -1.123174, -3.920092, 0, 1, 0.8039216, 1,
-0.06580632, 0.1699843, 0.09345422, 0, 1, 0.8078431, 1,
-0.06433325, 0.3645329, 1.135844, 0, 1, 0.8156863, 1,
-0.06326655, 0.3673116, 1.081932, 0, 1, 0.8196079, 1,
-0.06280394, -1.36517, -2.792675, 0, 1, 0.827451, 1,
-0.05840758, 0.4349084, 0.8338289, 0, 1, 0.8313726, 1,
-0.05694558, 1.479423, -1.665238, 0, 1, 0.8392157, 1,
-0.05634106, -0.6791906, -3.390019, 0, 1, 0.8431373, 1,
-0.05090212, -0.8143781, -2.828084, 0, 1, 0.8509804, 1,
-0.04534328, -2.342883, -1.204857, 0, 1, 0.854902, 1,
-0.03857082, 0.0420275, -1.18767, 0, 1, 0.8627451, 1,
-0.03377857, -0.3886177, -4.168881, 0, 1, 0.8666667, 1,
-0.03160868, -1.100014, -2.67892, 0, 1, 0.8745098, 1,
-0.03010051, 1.271228, 0.4963637, 0, 1, 0.8784314, 1,
-0.027913, 0.7247211, 1.217109, 0, 1, 0.8862745, 1,
-0.02654556, 0.1247384, -0.5258631, 0, 1, 0.8901961, 1,
-0.02451595, 0.3319732, -0.9631931, 0, 1, 0.8980392, 1,
-0.02192527, -0.6316843, -2.172158, 0, 1, 0.9058824, 1,
-0.02189169, -0.5071332, -2.603075, 0, 1, 0.9098039, 1,
-0.02078397, 0.6757702, -0.3837504, 0, 1, 0.9176471, 1,
-0.01971281, 0.1369143, 1.262459, 0, 1, 0.9215686, 1,
-0.01649288, 0.2796017, -0.6652848, 0, 1, 0.9294118, 1,
-0.01633442, 0.1913502, -0.8328408, 0, 1, 0.9333333, 1,
-0.01569293, 0.5391293, -0.5725933, 0, 1, 0.9411765, 1,
-0.01241268, 1.689731, -0.254741, 0, 1, 0.945098, 1,
-0.01130693, 2.180017, -1.488674, 0, 1, 0.9529412, 1,
-0.009637899, -0.2002729, -2.251882, 0, 1, 0.9568627, 1,
-0.008804746, -0.6007474, -4.059281, 0, 1, 0.9647059, 1,
-0.008489448, 1.325465, 0.004799439, 0, 1, 0.9686275, 1,
-0.004519681, 0.5828249, 0.8772915, 0, 1, 0.9764706, 1,
-0.004418171, -0.5171851, -3.961172, 0, 1, 0.9803922, 1,
-0.002596251, 1.747449, -1.722868, 0, 1, 0.9882353, 1,
-0.002259799, -0.3231261, -2.19748, 0, 1, 0.9921569, 1,
-0.0008681525, -0.1365934, -3.485486, 0, 1, 1, 1,
0.001665918, -0.5121718, 2.439928, 0, 0.9921569, 1, 1,
0.002595842, 0.3537762, -1.193909, 0, 0.9882353, 1, 1,
0.006769127, 1.814896, 1.708369, 0, 0.9803922, 1, 1,
0.01003137, 0.5326589, -1.203811, 0, 0.9764706, 1, 1,
0.01572551, 0.5436168, -1.076005, 0, 0.9686275, 1, 1,
0.01623878, -1.304899, 3.568048, 0, 0.9647059, 1, 1,
0.01749549, -0.9560709, 3.773416, 0, 0.9568627, 1, 1,
0.0176255, 1.51903, -0.5573106, 0, 0.9529412, 1, 1,
0.01980557, 0.661334, 0.169037, 0, 0.945098, 1, 1,
0.02559333, 0.2805366, -0.9273293, 0, 0.9411765, 1, 1,
0.02611825, 0.3089351, 0.2086664, 0, 0.9333333, 1, 1,
0.02899276, 0.2609267, 0.7921301, 0, 0.9294118, 1, 1,
0.03374084, 0.1914899, -0.3345308, 0, 0.9215686, 1, 1,
0.03520526, 2.504558, 1.873612, 0, 0.9176471, 1, 1,
0.03857644, -0.3394931, 5.283147, 0, 0.9098039, 1, 1,
0.03996699, 1.420016, 0.6137245, 0, 0.9058824, 1, 1,
0.04018633, 1.966774, 1.333721, 0, 0.8980392, 1, 1,
0.04618976, -0.009132612, 0.7613392, 0, 0.8901961, 1, 1,
0.04779832, -0.1025145, 2.850096, 0, 0.8862745, 1, 1,
0.04830795, -0.3509933, 1.31319, 0, 0.8784314, 1, 1,
0.04890196, -0.5090782, 4.207805, 0, 0.8745098, 1, 1,
0.05137207, -0.93941, 4.685768, 0, 0.8666667, 1, 1,
0.05216644, -0.2742693, 3.897526, 0, 0.8627451, 1, 1,
0.05685254, -0.4438446, 5.217876, 0, 0.854902, 1, 1,
0.05728393, 1.089099, -2.186194, 0, 0.8509804, 1, 1,
0.06013545, -0.5055932, 4.406192, 0, 0.8431373, 1, 1,
0.0634089, 1.699838, -0.02305523, 0, 0.8392157, 1, 1,
0.06485491, 0.1036443, 0.03087742, 0, 0.8313726, 1, 1,
0.06640107, 1.474533, 0.08533572, 0, 0.827451, 1, 1,
0.06873466, 1.54384, -0.3318691, 0, 0.8196079, 1, 1,
0.07131672, -0.5412012, 4.072014, 0, 0.8156863, 1, 1,
0.07154105, 0.7975035, -0.9643004, 0, 0.8078431, 1, 1,
0.0717897, -1.015838, 1.036922, 0, 0.8039216, 1, 1,
0.072949, -1.203354, 3.475387, 0, 0.7960784, 1, 1,
0.07400657, 0.5373988, 1.316398, 0, 0.7882353, 1, 1,
0.07513841, -1.286797, 5.231004, 0, 0.7843137, 1, 1,
0.07639076, -0.5834216, 2.412647, 0, 0.7764706, 1, 1,
0.07754669, -0.2394306, 2.852517, 0, 0.772549, 1, 1,
0.07980888, -0.2950062, 3.036349, 0, 0.7647059, 1, 1,
0.08185401, -0.8590033, 3.851951, 0, 0.7607843, 1, 1,
0.08323195, 0.2112968, -0.8825276, 0, 0.7529412, 1, 1,
0.08469938, -0.1091249, 2.789503, 0, 0.7490196, 1, 1,
0.08617986, -1.196356, 0.2138754, 0, 0.7411765, 1, 1,
0.08727225, -2.167602, 2.502223, 0, 0.7372549, 1, 1,
0.09271967, -0.05534334, 2.461085, 0, 0.7294118, 1, 1,
0.09913908, -0.6941026, 4.126458, 0, 0.7254902, 1, 1,
0.1002939, 0.2473819, 1.462619, 0, 0.7176471, 1, 1,
0.1018652, -1.263561, 2.147159, 0, 0.7137255, 1, 1,
0.1040064, -0.4356467, 1.413158, 0, 0.7058824, 1, 1,
0.1112463, -0.2559216, 3.225851, 0, 0.6980392, 1, 1,
0.1121499, -1.84993, 2.384898, 0, 0.6941177, 1, 1,
0.1122667, 1.07024, -0.6935209, 0, 0.6862745, 1, 1,
0.1137482, 1.169814, 0.4552138, 0, 0.682353, 1, 1,
0.1143684, -0.001459516, 1.24978, 0, 0.6745098, 1, 1,
0.119498, -1.96041, 3.78851, 0, 0.6705883, 1, 1,
0.1252449, -0.8172559, 1.762518, 0, 0.6627451, 1, 1,
0.1256148, -1.071878, 4.112642, 0, 0.6588235, 1, 1,
0.1276256, 1.535153e-05, 1.331038, 0, 0.6509804, 1, 1,
0.1286088, 1.286238, -1.092819, 0, 0.6470588, 1, 1,
0.1350619, -2.106239, 3.382382, 0, 0.6392157, 1, 1,
0.1353009, -0.1353101, 2.87025, 0, 0.6352941, 1, 1,
0.1367077, 0.06294288, 1.46023, 0, 0.627451, 1, 1,
0.139569, -0.271896, 2.485986, 0, 0.6235294, 1, 1,
0.1419612, 1.646656, -0.7820552, 0, 0.6156863, 1, 1,
0.142882, -0.8816999, 2.833396, 0, 0.6117647, 1, 1,
0.1437643, -0.417024, 1.607457, 0, 0.6039216, 1, 1,
0.1441766, -1.030707, 2.304841, 0, 0.5960785, 1, 1,
0.1467968, -1.121767, 1.323798, 0, 0.5921569, 1, 1,
0.147038, 1.150128, 0.7081361, 0, 0.5843138, 1, 1,
0.1498585, 0.8027954, -0.7018946, 0, 0.5803922, 1, 1,
0.1502626, 0.1334601, -0.2837989, 0, 0.572549, 1, 1,
0.1533582, -1.732518, 3.309205, 0, 0.5686275, 1, 1,
0.1538539, -0.2671839, 2.513125, 0, 0.5607843, 1, 1,
0.1567533, -0.7155033, 3.749382, 0, 0.5568628, 1, 1,
0.1574052, -0.7338951, 2.304303, 0, 0.5490196, 1, 1,
0.1597712, 0.263091, 1.557998, 0, 0.5450981, 1, 1,
0.1600394, -0.2083904, 1.749041, 0, 0.5372549, 1, 1,
0.1653022, -0.6832095, 1.136976, 0, 0.5333334, 1, 1,
0.1671057, -0.6474262, 2.759783, 0, 0.5254902, 1, 1,
0.1677034, -0.9786339, 3.635467, 0, 0.5215687, 1, 1,
0.170298, -0.2365627, 2.929423, 0, 0.5137255, 1, 1,
0.1767787, 0.1644278, 1.062616, 0, 0.509804, 1, 1,
0.1804764, 0.7913036, -0.6134036, 0, 0.5019608, 1, 1,
0.1838809, 0.8224541, -0.8777338, 0, 0.4941176, 1, 1,
0.1844186, 0.0210353, 0.4384524, 0, 0.4901961, 1, 1,
0.1848709, -0.1457627, 2.295188, 0, 0.4823529, 1, 1,
0.1869863, -0.5995464, 3.340487, 0, 0.4784314, 1, 1,
0.1936029, -0.3961139, 4.344097, 0, 0.4705882, 1, 1,
0.1942204, 0.9517394, -0.1671665, 0, 0.4666667, 1, 1,
0.1947743, 0.214768, -0.1845217, 0, 0.4588235, 1, 1,
0.1951115, 0.7354048, -0.3348747, 0, 0.454902, 1, 1,
0.1991015, -0.3162241, 2.628126, 0, 0.4470588, 1, 1,
0.2023871, -0.991143, 1.956699, 0, 0.4431373, 1, 1,
0.2054161, -0.1817664, 0.5840356, 0, 0.4352941, 1, 1,
0.2081761, 0.9390554, 0.7507809, 0, 0.4313726, 1, 1,
0.2123664, -0.1115451, 1.987399, 0, 0.4235294, 1, 1,
0.2141972, -0.3108618, 3.176179, 0, 0.4196078, 1, 1,
0.2163398, 1.067804, -0.02355462, 0, 0.4117647, 1, 1,
0.2188904, 0.4394425, 1.73043, 0, 0.4078431, 1, 1,
0.2241656, -2.771072, 3.098241, 0, 0.4, 1, 1,
0.2245011, -0.4257466, 2.410236, 0, 0.3921569, 1, 1,
0.2253299, 0.2591911, 1.757235, 0, 0.3882353, 1, 1,
0.2254672, -0.0008529795, 1.427008, 0, 0.3803922, 1, 1,
0.2255726, 1.113227, 1.207071, 0, 0.3764706, 1, 1,
0.2287097, 2.147784, 1.400016, 0, 0.3686275, 1, 1,
0.2301723, -1.48856, 4.23443, 0, 0.3647059, 1, 1,
0.2303627, -0.05472768, 3.331982, 0, 0.3568628, 1, 1,
0.2346446, 1.205594, -0.2944149, 0, 0.3529412, 1, 1,
0.2351455, 1.272886, 0.5689092, 0, 0.345098, 1, 1,
0.2386368, 1.349307, -1.501224, 0, 0.3411765, 1, 1,
0.2390298, 1.51683, 0.4332069, 0, 0.3333333, 1, 1,
0.2417359, 1.946334, -0.9118538, 0, 0.3294118, 1, 1,
0.2453625, -2.974449, 2.89659, 0, 0.3215686, 1, 1,
0.2477164, -0.3727168, 2.052731, 0, 0.3176471, 1, 1,
0.2490111, 0.4518641, 2.657804, 0, 0.3098039, 1, 1,
0.2492202, -1.552825, 3.299025, 0, 0.3058824, 1, 1,
0.2501081, 0.133005, 1.00538, 0, 0.2980392, 1, 1,
0.2523972, 0.271995, 2.361013, 0, 0.2901961, 1, 1,
0.2540487, 0.3984896, 0.7132146, 0, 0.2862745, 1, 1,
0.2560397, 0.9747846, 1.523564, 0, 0.2784314, 1, 1,
0.2631279, -0.3435445, 3.515688, 0, 0.2745098, 1, 1,
0.2632729, 0.7373897, 0.4759925, 0, 0.2666667, 1, 1,
0.2694608, -1.676006, 2.477733, 0, 0.2627451, 1, 1,
0.2721041, 1.417282, 0.3956899, 0, 0.254902, 1, 1,
0.2738226, -0.7772969, 2.170102, 0, 0.2509804, 1, 1,
0.2752216, -0.4391653, 0.3616279, 0, 0.2431373, 1, 1,
0.275978, 0.6197855, 0.01442893, 0, 0.2392157, 1, 1,
0.2770733, -0.5341948, 4.617936, 0, 0.2313726, 1, 1,
0.2823663, 0.9743868, -0.7479117, 0, 0.227451, 1, 1,
0.2847435, -1.487329, 3.956249, 0, 0.2196078, 1, 1,
0.2864545, 2.136514, 0.4196012, 0, 0.2156863, 1, 1,
0.2882317, 0.4249444, -0.07847403, 0, 0.2078431, 1, 1,
0.2882473, 0.4443169, 0.4710157, 0, 0.2039216, 1, 1,
0.2892696, -0.09585847, 2.283037, 0, 0.1960784, 1, 1,
0.2927889, -0.2665795, 1.200786, 0, 0.1882353, 1, 1,
0.2950443, -0.786005, 0.8463247, 0, 0.1843137, 1, 1,
0.2958232, -0.2482561, 1.697358, 0, 0.1764706, 1, 1,
0.2994012, -0.1997188, 3.115463, 0, 0.172549, 1, 1,
0.3096472, 0.8271983, 1.076774, 0, 0.1647059, 1, 1,
0.3099304, 0.4777734, -0.08937466, 0, 0.1607843, 1, 1,
0.3124307, 1.723296, 0.2983232, 0, 0.1529412, 1, 1,
0.3136261, -0.6508449, 2.634293, 0, 0.1490196, 1, 1,
0.3171428, -0.5088054, 2.171738, 0, 0.1411765, 1, 1,
0.3185943, -0.8139939, 1.839104, 0, 0.1372549, 1, 1,
0.3208817, -0.9489521, 3.589614, 0, 0.1294118, 1, 1,
0.3225948, -1.412577, 4.395893, 0, 0.1254902, 1, 1,
0.3257255, -1.021625, 3.447226, 0, 0.1176471, 1, 1,
0.3274734, 0.4544666, -0.244896, 0, 0.1137255, 1, 1,
0.3282958, 2.557683, 0.09830002, 0, 0.1058824, 1, 1,
0.3365381, 0.5652526, 0.6534989, 0, 0.09803922, 1, 1,
0.3374493, -1.358901, 2.21733, 0, 0.09411765, 1, 1,
0.3405422, 0.01706995, 0.6830503, 0, 0.08627451, 1, 1,
0.3462768, -0.2541192, 2.389754, 0, 0.08235294, 1, 1,
0.3484602, 1.604729, 0.5458569, 0, 0.07450981, 1, 1,
0.349887, -0.1492901, 2.194509, 0, 0.07058824, 1, 1,
0.3503052, 0.7172101, 0.6454454, 0, 0.0627451, 1, 1,
0.3542413, 0.7963285, 0.1704914, 0, 0.05882353, 1, 1,
0.3588698, 0.1244715, 0.4733618, 0, 0.05098039, 1, 1,
0.3601097, 0.08641078, 1.593173, 0, 0.04705882, 1, 1,
0.3607046, 0.9424078, 0.5926309, 0, 0.03921569, 1, 1,
0.3655646, 0.7628558, -0.2600548, 0, 0.03529412, 1, 1,
0.3727287, 0.1591106, 1.919434, 0, 0.02745098, 1, 1,
0.3730746, -0.9290544, 3.579975, 0, 0.02352941, 1, 1,
0.3739456, 0.02206994, 2.109956, 0, 0.01568628, 1, 1,
0.375609, -0.215426, 1.114067, 0, 0.01176471, 1, 1,
0.3788115, 0.4046891, 0.3156056, 0, 0.003921569, 1, 1,
0.3804155, -1.296292, 1.503707, 0.003921569, 0, 1, 1,
0.3837895, -1.500884, 4.079362, 0.007843138, 0, 1, 1,
0.385443, 0.5133163, 1.271159, 0.01568628, 0, 1, 1,
0.3867055, -0.3968737, 2.139111, 0.01960784, 0, 1, 1,
0.3933365, -0.6334549, 2.915375, 0.02745098, 0, 1, 1,
0.3936033, -0.4053231, 2.179823, 0.03137255, 0, 1, 1,
0.3959185, 0.5587797, 0.3339797, 0.03921569, 0, 1, 1,
0.3981684, 1.629159, -2.180765, 0.04313726, 0, 1, 1,
0.3999592, -0.01645304, 0.2210431, 0.05098039, 0, 1, 1,
0.4010602, -2.547102, 2.997608, 0.05490196, 0, 1, 1,
0.4098413, -0.7788002, 3.145795, 0.0627451, 0, 1, 1,
0.4133577, -0.0003310789, 0.9404883, 0.06666667, 0, 1, 1,
0.4143928, -1.709834, 2.992067, 0.07450981, 0, 1, 1,
0.4184983, 1.029314, -0.2492964, 0.07843138, 0, 1, 1,
0.4353337, 2.177228, 0.03655892, 0.08627451, 0, 1, 1,
0.4388236, -1.266192, 1.501481, 0.09019608, 0, 1, 1,
0.4412277, 1.568529, 0.4479716, 0.09803922, 0, 1, 1,
0.4495162, -0.2309567, 1.226276, 0.1058824, 0, 1, 1,
0.4498874, 0.5293585, -0.2981961, 0.1098039, 0, 1, 1,
0.4509747, 1.068091, -0.5841855, 0.1176471, 0, 1, 1,
0.4515951, 2.2645, 0.260827, 0.1215686, 0, 1, 1,
0.4521633, 0.3227674, -1.230321, 0.1294118, 0, 1, 1,
0.4536953, 0.6301454, 1.95424, 0.1333333, 0, 1, 1,
0.4555134, 0.8866671, 0.7434626, 0.1411765, 0, 1, 1,
0.462328, 0.1054552, 2.619127, 0.145098, 0, 1, 1,
0.4625154, 2.353316, 0.2278985, 0.1529412, 0, 1, 1,
0.4715064, -0.8369834, 2.435269, 0.1568628, 0, 1, 1,
0.4748817, -0.1429185, 3.545014, 0.1647059, 0, 1, 1,
0.4792263, -0.01000249, 3.458751, 0.1686275, 0, 1, 1,
0.4914495, -0.1579669, 2.327677, 0.1764706, 0, 1, 1,
0.4931046, -0.224831, 1.640669, 0.1803922, 0, 1, 1,
0.4949076, 0.8112844, 2.092489, 0.1882353, 0, 1, 1,
0.4955376, -0.7885807, 3.068713, 0.1921569, 0, 1, 1,
0.4973101, -0.08508089, 2.778407, 0.2, 0, 1, 1,
0.4999718, -0.1345612, 2.839491, 0.2078431, 0, 1, 1,
0.5010963, 1.464012, 1.586686, 0.2117647, 0, 1, 1,
0.5021828, 0.2903774, -0.3758509, 0.2196078, 0, 1, 1,
0.5025582, 0.1579676, 1.353689, 0.2235294, 0, 1, 1,
0.5043964, 1.997412, 0.569847, 0.2313726, 0, 1, 1,
0.5090297, 0.05118736, 1.800131, 0.2352941, 0, 1, 1,
0.5108595, 0.2674901, 1.048051, 0.2431373, 0, 1, 1,
0.5155072, 2.331801, 0.6479333, 0.2470588, 0, 1, 1,
0.5217859, 0.6169571, 0.2151463, 0.254902, 0, 1, 1,
0.5263395, -0.366599, 3.141305, 0.2588235, 0, 1, 1,
0.5284132, -0.2097476, 2.130407, 0.2666667, 0, 1, 1,
0.5319108, -0.164415, 1.042005, 0.2705882, 0, 1, 1,
0.5321392, -0.4900653, 2.270266, 0.2784314, 0, 1, 1,
0.5322498, -0.8870759, 2.610812, 0.282353, 0, 1, 1,
0.5325833, -1.076885, 3.764993, 0.2901961, 0, 1, 1,
0.5361575, -0.6717231, 2.177514, 0.2941177, 0, 1, 1,
0.5418932, 0.1287191, 2.319028, 0.3019608, 0, 1, 1,
0.5428208, 0.9808466, 0.7544886, 0.3098039, 0, 1, 1,
0.5460676, 0.4971021, 0.8248591, 0.3137255, 0, 1, 1,
0.5497241, 0.3040152, 1.700405, 0.3215686, 0, 1, 1,
0.5542334, 0.1813376, 2.81387, 0.3254902, 0, 1, 1,
0.5556903, -0.6612269, 2.383222, 0.3333333, 0, 1, 1,
0.5572571, 1.450732, -0.8571735, 0.3372549, 0, 1, 1,
0.5734638, -1.57885, 1.89014, 0.345098, 0, 1, 1,
0.5735616, -0.0473214, 1.235422, 0.3490196, 0, 1, 1,
0.5825791, 2.146403, -0.7962832, 0.3568628, 0, 1, 1,
0.5858375, -0.5684083, 2.17287, 0.3607843, 0, 1, 1,
0.5918117, 0.9483334, 1.035174, 0.3686275, 0, 1, 1,
0.5956542, 0.6608877, -0.1124792, 0.372549, 0, 1, 1,
0.5957175, -1.856218, 2.558979, 0.3803922, 0, 1, 1,
0.5991074, -1.289016, 1.893918, 0.3843137, 0, 1, 1,
0.5996124, -0.7373188, 2.592257, 0.3921569, 0, 1, 1,
0.6013642, -1.525858, 1.909679, 0.3960784, 0, 1, 1,
0.6025181, -0.08062303, 2.228084, 0.4039216, 0, 1, 1,
0.6059608, -0.6688592, 3.294429, 0.4117647, 0, 1, 1,
0.6111814, 0.39533, 1.805565, 0.4156863, 0, 1, 1,
0.6138306, 0.1389091, 1.462739, 0.4235294, 0, 1, 1,
0.6146486, 1.23506, -0.5000463, 0.427451, 0, 1, 1,
0.6158579, 0.7141806, 1.266821, 0.4352941, 0, 1, 1,
0.6205598, -0.3954364, 0.8204734, 0.4392157, 0, 1, 1,
0.6239145, -0.5428931, 1.827814, 0.4470588, 0, 1, 1,
0.626818, 0.03546552, 2.311593, 0.4509804, 0, 1, 1,
0.6269035, -0.1146434, 2.831046, 0.4588235, 0, 1, 1,
0.6276718, -0.8063542, 3.444421, 0.4627451, 0, 1, 1,
0.6342525, -1.376373, 3.29636, 0.4705882, 0, 1, 1,
0.6453821, -0.4709389, -0.1433486, 0.4745098, 0, 1, 1,
0.6474195, -0.6630568, 1.883107, 0.4823529, 0, 1, 1,
0.6516424, 0.4226552, 2.68264, 0.4862745, 0, 1, 1,
0.6518199, -0.1075663, 2.027627, 0.4941176, 0, 1, 1,
0.6530159, -0.280837, 2.798865, 0.5019608, 0, 1, 1,
0.6583489, 0.2389114, 1.644296, 0.5058824, 0, 1, 1,
0.658577, -0.7086687, 2.918839, 0.5137255, 0, 1, 1,
0.6648248, 0.9227417, -0.6536673, 0.5176471, 0, 1, 1,
0.6671782, -2.505707, 1.53754, 0.5254902, 0, 1, 1,
0.6677945, -0.3237314, 0.9563718, 0.5294118, 0, 1, 1,
0.6683848, -1.332627, 2.538159, 0.5372549, 0, 1, 1,
0.6733084, 0.3562326, 2.290172, 0.5411765, 0, 1, 1,
0.6742584, 0.3312639, 0.2334415, 0.5490196, 0, 1, 1,
0.6870561, -0.4294755, 3.230531, 0.5529412, 0, 1, 1,
0.6872327, -1.490175, 1.590353, 0.5607843, 0, 1, 1,
0.6935087, -0.509165, 2.354278, 0.5647059, 0, 1, 1,
0.6943371, 0.8127367, 1.52349, 0.572549, 0, 1, 1,
0.6967365, -0.5945202, 3.226827, 0.5764706, 0, 1, 1,
0.7005178, 0.3720485, 0.6720818, 0.5843138, 0, 1, 1,
0.7041205, -0.09294148, -0.06687828, 0.5882353, 0, 1, 1,
0.7043238, -0.652782, 3.451173, 0.5960785, 0, 1, 1,
0.7071328, -0.3793969, -0.0271435, 0.6039216, 0, 1, 1,
0.7109303, -1.383324, 1.533035, 0.6078432, 0, 1, 1,
0.7118477, 1.01728, 0.3327042, 0.6156863, 0, 1, 1,
0.7140068, 0.7851846, 0.7793605, 0.6196079, 0, 1, 1,
0.7148111, 0.3143205, -0.521335, 0.627451, 0, 1, 1,
0.7209284, -0.3754987, 3.668072, 0.6313726, 0, 1, 1,
0.7211492, -0.1432496, 2.729113, 0.6392157, 0, 1, 1,
0.7492228, 1.093755, 0.355247, 0.6431373, 0, 1, 1,
0.750113, -0.5465913, 2.355672, 0.6509804, 0, 1, 1,
0.7534572, -0.7736962, 2.227714, 0.654902, 0, 1, 1,
0.753727, -0.599187, 2.532945, 0.6627451, 0, 1, 1,
0.7628851, 0.03739388, 0.9732606, 0.6666667, 0, 1, 1,
0.7642325, -0.08643857, 2.101484, 0.6745098, 0, 1, 1,
0.7718579, 0.7303559, 2.214917, 0.6784314, 0, 1, 1,
0.7785271, 0.3832385, 0.2169147, 0.6862745, 0, 1, 1,
0.7806994, 1.186111, 1.626387, 0.6901961, 0, 1, 1,
0.7807122, 0.2795304, 0.09043445, 0.6980392, 0, 1, 1,
0.7820884, 0.8029366, 3.854402, 0.7058824, 0, 1, 1,
0.7877467, -1.459207, 1.309244, 0.7098039, 0, 1, 1,
0.7892628, -1.71818, 3.74466, 0.7176471, 0, 1, 1,
0.7899302, 0.3399161, 2.2301, 0.7215686, 0, 1, 1,
0.7921739, -0.8657197, 4.763404, 0.7294118, 0, 1, 1,
0.7950243, 1.646423, 0.5661101, 0.7333333, 0, 1, 1,
0.7950664, -0.2503769, 3.309582, 0.7411765, 0, 1, 1,
0.795586, -0.3014458, 1.853677, 0.7450981, 0, 1, 1,
0.800337, -0.2344585, 1.208321, 0.7529412, 0, 1, 1,
0.8012506, 1.389866, -2.432258, 0.7568628, 0, 1, 1,
0.8028007, -0.1837986, 2.209548, 0.7647059, 0, 1, 1,
0.806556, 1.558895, -0.633461, 0.7686275, 0, 1, 1,
0.8130861, 0.3304017, 2.282052, 0.7764706, 0, 1, 1,
0.819972, 0.404716, 2.60789, 0.7803922, 0, 1, 1,
0.8289326, 1.540024, 0.06726424, 0.7882353, 0, 1, 1,
0.8291991, -0.08802275, 2.586018, 0.7921569, 0, 1, 1,
0.8298279, 1.015399, 0.1627872, 0.8, 0, 1, 1,
0.8453742, 0.8498317, 0.4259624, 0.8078431, 0, 1, 1,
0.8456911, 0.09865241, 1.401074, 0.8117647, 0, 1, 1,
0.8486907, 0.2771393, 0.3535842, 0.8196079, 0, 1, 1,
0.8491772, 0.8693911, 0.04349398, 0.8235294, 0, 1, 1,
0.8547035, -0.1458999, 3.271002, 0.8313726, 0, 1, 1,
0.8559248, -2.727679, 3.339529, 0.8352941, 0, 1, 1,
0.8572437, -1.377595, 1.979097, 0.8431373, 0, 1, 1,
0.865262, -0.01061069, 0.4900327, 0.8470588, 0, 1, 1,
0.8654076, -0.2162737, 1.633026, 0.854902, 0, 1, 1,
0.870706, 0.868765, 0.7106252, 0.8588235, 0, 1, 1,
0.8806492, -0.6665797, 2.855625, 0.8666667, 0, 1, 1,
0.8818945, -0.2173006, 2.256855, 0.8705882, 0, 1, 1,
0.8831726, 2.259459, 1.114023, 0.8784314, 0, 1, 1,
0.8860868, -1.686765, 2.054057, 0.8823529, 0, 1, 1,
0.8881423, 0.6011432, 0.4185843, 0.8901961, 0, 1, 1,
0.8974078, -0.4865439, 2.579735, 0.8941177, 0, 1, 1,
0.897791, -0.9912981, 1.724341, 0.9019608, 0, 1, 1,
0.8978308, -1.467964, 3.106709, 0.9098039, 0, 1, 1,
0.899649, 1.812655, 0.0702542, 0.9137255, 0, 1, 1,
0.9050174, 1.26141, 0.8857942, 0.9215686, 0, 1, 1,
0.9093306, 0.1971364, 1.554732, 0.9254902, 0, 1, 1,
0.9163986, -0.5770558, 2.345535, 0.9333333, 0, 1, 1,
0.9178319, -0.9939778, 1.525042, 0.9372549, 0, 1, 1,
0.9225483, -1.212184, 0.5258187, 0.945098, 0, 1, 1,
0.9294835, 0.3107862, 2.536818, 0.9490196, 0, 1, 1,
0.9328453, 0.03837949, 1.316311, 0.9568627, 0, 1, 1,
0.9380586, 0.262789, 1.642569, 0.9607843, 0, 1, 1,
0.938941, -0.5035856, 0.788871, 0.9686275, 0, 1, 1,
0.9445528, 1.023797, -0.6613687, 0.972549, 0, 1, 1,
0.9448529, -0.06210188, 2.21516, 0.9803922, 0, 1, 1,
0.9495205, -1.417892, 3.491723, 0.9843137, 0, 1, 1,
0.9531555, -0.8419437, 1.958061, 0.9921569, 0, 1, 1,
0.9585348, 0.5550067, 0.9193361, 0.9960784, 0, 1, 1,
0.9599533, -0.6764338, 3.291537, 1, 0, 0.9960784, 1,
0.963969, 1.019311, 2.341836, 1, 0, 0.9882353, 1,
0.9642161, -0.2370081, 3.069442, 1, 0, 0.9843137, 1,
0.9674405, 0.4380684, 1.691655, 1, 0, 0.9764706, 1,
0.9725073, 1.064156, 1.585955, 1, 0, 0.972549, 1,
0.9790275, -0.7799146, 2.70344, 1, 0, 0.9647059, 1,
0.9814749, -0.01175969, 1.690794, 1, 0, 0.9607843, 1,
0.9820274, 0.03509924, 1.079203, 1, 0, 0.9529412, 1,
0.984888, 0.268022, 1.526049, 1, 0, 0.9490196, 1,
0.985724, -0.7811451, 1.974374, 1, 0, 0.9411765, 1,
0.9892848, 1.982295, 0.6566831, 1, 0, 0.9372549, 1,
0.9960956, 1.972421, -0.4366507, 1, 0, 0.9294118, 1,
1.004443, -0.7360017, 1.3624, 1, 0, 0.9254902, 1,
1.004725, 1.932937, -1.407334, 1, 0, 0.9176471, 1,
1.006218, 1.488261, 3.265158, 1, 0, 0.9137255, 1,
1.009652, 0.5844806, 1.779819, 1, 0, 0.9058824, 1,
1.013823, -0.3566612, 2.794444, 1, 0, 0.9019608, 1,
1.014346, 0.7424378, -0.2520009, 1, 0, 0.8941177, 1,
1.01438, -0.426163, 1.603224, 1, 0, 0.8862745, 1,
1.01722, 1.999759, 1.215956, 1, 0, 0.8823529, 1,
1.018673, 0.5904199, 2.421069, 1, 0, 0.8745098, 1,
1.019258, -0.0008975544, 1.786899, 1, 0, 0.8705882, 1,
1.020936, -0.4771693, 2.851727, 1, 0, 0.8627451, 1,
1.020941, -0.05832785, 1.698077, 1, 0, 0.8588235, 1,
1.021105, 1.648157, -1.792405, 1, 0, 0.8509804, 1,
1.022383, 0.5492148, -0.147385, 1, 0, 0.8470588, 1,
1.030898, -0.04253733, 1.067276, 1, 0, 0.8392157, 1,
1.036699, 0.6333548, 1.418597, 1, 0, 0.8352941, 1,
1.038302, -0.8228616, 2.805069, 1, 0, 0.827451, 1,
1.03965, -0.7768071, 2.869766, 1, 0, 0.8235294, 1,
1.044163, 0.2664077, 1.839985, 1, 0, 0.8156863, 1,
1.047648, 0.5926084, 1.903162, 1, 0, 0.8117647, 1,
1.049443, 0.9194747, 2.065825, 1, 0, 0.8039216, 1,
1.067719, -0.3190653, 2.603621, 1, 0, 0.7960784, 1,
1.084574, -0.4210082, 0.06599193, 1, 0, 0.7921569, 1,
1.094052, -1.771361, 3.55144, 1, 0, 0.7843137, 1,
1.096643, 0.08086327, 1.561051, 1, 0, 0.7803922, 1,
1.100914, 0.1768288, -0.2881585, 1, 0, 0.772549, 1,
1.102286, 0.7240059, 2.51524, 1, 0, 0.7686275, 1,
1.103696, -1.193103, 3.585406, 1, 0, 0.7607843, 1,
1.106506, -1.000469, 0.8924602, 1, 0, 0.7568628, 1,
1.11079, -1.406752, 1.831656, 1, 0, 0.7490196, 1,
1.115484, 1.088808, 1.731571, 1, 0, 0.7450981, 1,
1.118044, 0.9634224, 1.618632, 1, 0, 0.7372549, 1,
1.119168, -0.886329, 2.404925, 1, 0, 0.7333333, 1,
1.125675, -0.004649878, 2.234329, 1, 0, 0.7254902, 1,
1.136146, 1.880462, 0.2562402, 1, 0, 0.7215686, 1,
1.137001, -0.7375296, 2.079544, 1, 0, 0.7137255, 1,
1.140512, -0.7579329, 2.884745, 1, 0, 0.7098039, 1,
1.14161, -0.4407371, 2.277397, 1, 0, 0.7019608, 1,
1.142759, 1.413193, 0.9442502, 1, 0, 0.6941177, 1,
1.143121, -0.1539627, 1.356078, 1, 0, 0.6901961, 1,
1.16779, 0.3644636, 1.417301, 1, 0, 0.682353, 1,
1.170904, 0.3661021, 0.7540044, 1, 0, 0.6784314, 1,
1.171949, -1.132746, 2.46719, 1, 0, 0.6705883, 1,
1.176622, 0.199311, 0.01844151, 1, 0, 0.6666667, 1,
1.194195, 0.1868657, 1.397018, 1, 0, 0.6588235, 1,
1.196116, -0.5570724, 1.531345, 1, 0, 0.654902, 1,
1.197104, 0.5262803, -1.574526, 1, 0, 0.6470588, 1,
1.198796, -0.1447704, 2.069907, 1, 0, 0.6431373, 1,
1.217727, 0.4596842, 1.884499, 1, 0, 0.6352941, 1,
1.227455, 1.899058, 0.485503, 1, 0, 0.6313726, 1,
1.233238, -0.6860198, 1.827948, 1, 0, 0.6235294, 1,
1.241486, 0.7896105, 0.6813334, 1, 0, 0.6196079, 1,
1.242451, 3.095039, 0.5457362, 1, 0, 0.6117647, 1,
1.248646, 0.09653662, 1.79063, 1, 0, 0.6078432, 1,
1.251793, -1.106162, 1.902202, 1, 0, 0.6, 1,
1.256041, 1.078476, 2.003623, 1, 0, 0.5921569, 1,
1.256946, 0.6890829, 2.812702, 1, 0, 0.5882353, 1,
1.262757, 1.117385, 0.8109573, 1, 0, 0.5803922, 1,
1.267832, 0.3444185, 0.1699116, 1, 0, 0.5764706, 1,
1.272169, 1.208504, 0.06403796, 1, 0, 0.5686275, 1,
1.272572, -0.5253832, 1.391995, 1, 0, 0.5647059, 1,
1.285263, -0.5703692, 2.741883, 1, 0, 0.5568628, 1,
1.288546, -1.068167, 1.87172, 1, 0, 0.5529412, 1,
1.288566, 0.5093703, 2.618376, 1, 0, 0.5450981, 1,
1.293542, -0.7292277, 1.681725, 1, 0, 0.5411765, 1,
1.306473, 1.488434, -0.7984993, 1, 0, 0.5333334, 1,
1.341186, -1.227436, 1.916414, 1, 0, 0.5294118, 1,
1.347894, 0.7711682, 0.2560182, 1, 0, 0.5215687, 1,
1.358794, 1.208135, 0.04483891, 1, 0, 0.5176471, 1,
1.3611, 0.8511282, 0.3628016, 1, 0, 0.509804, 1,
1.375748, -0.8537431, 2.482461, 1, 0, 0.5058824, 1,
1.388692, 1.429257, 0.3224162, 1, 0, 0.4980392, 1,
1.393283, -0.657438, 1.229072, 1, 0, 0.4901961, 1,
1.396866, 0.9010142, 2.604238, 1, 0, 0.4862745, 1,
1.401069, 1.382818, 0.9792086, 1, 0, 0.4784314, 1,
1.407713, 0.4621756, 2.037679, 1, 0, 0.4745098, 1,
1.40845, 0.6518848, 4.073827, 1, 0, 0.4666667, 1,
1.427383, -0.9376873, 2.565898, 1, 0, 0.4627451, 1,
1.434898, 1.80391, 0.1719227, 1, 0, 0.454902, 1,
1.438594, -0.1248732, -0.1206215, 1, 0, 0.4509804, 1,
1.445269, 1.801047, 2.31876, 1, 0, 0.4431373, 1,
1.450835, -0.2056469, 1.489092, 1, 0, 0.4392157, 1,
1.452024, 1.601399, 2.028341, 1, 0, 0.4313726, 1,
1.453475, -0.2267233, 2.86652, 1, 0, 0.427451, 1,
1.474981, -0.4624685, 1.130361, 1, 0, 0.4196078, 1,
1.513087, 0.03509529, -0.1488333, 1, 0, 0.4156863, 1,
1.513582, 1.431768, 1.853238, 1, 0, 0.4078431, 1,
1.532354, 1.118773, 0.3245598, 1, 0, 0.4039216, 1,
1.550113, -1.876117, 0.7517686, 1, 0, 0.3960784, 1,
1.551581, -2.493583, 2.601024, 1, 0, 0.3882353, 1,
1.563173, 1.94523, 1.35622, 1, 0, 0.3843137, 1,
1.569228, -0.9870348, 1.010795, 1, 0, 0.3764706, 1,
1.584224, 0.5746493, 2.711869, 1, 0, 0.372549, 1,
1.585568, 0.1821825, 0.1681354, 1, 0, 0.3647059, 1,
1.586278, -0.8138434, 2.590258, 1, 0, 0.3607843, 1,
1.586418, 0.6954665, 0.2825316, 1, 0, 0.3529412, 1,
1.588026, -2.385147, 4.704083, 1, 0, 0.3490196, 1,
1.59885, -0.06167482, 1.304609, 1, 0, 0.3411765, 1,
1.599696, 0.3361084, 2.39671, 1, 0, 0.3372549, 1,
1.602884, -1.892911, 3.131583, 1, 0, 0.3294118, 1,
1.615606, -0.7656162, 0.4925542, 1, 0, 0.3254902, 1,
1.622362, 0.2347591, -0.9218222, 1, 0, 0.3176471, 1,
1.622688, -0.971624, 3.018038, 1, 0, 0.3137255, 1,
1.651944, 0.2654718, 1.158691, 1, 0, 0.3058824, 1,
1.665765, -0.5781797, 2.75404, 1, 0, 0.2980392, 1,
1.669405, -0.4680936, 2.415312, 1, 0, 0.2941177, 1,
1.674327, -1.152263, 1.731761, 1, 0, 0.2862745, 1,
1.683851, -0.7199498, 2.89091, 1, 0, 0.282353, 1,
1.69244, -0.7516398, 3.210232, 1, 0, 0.2745098, 1,
1.696103, -0.2570279, 0.8710335, 1, 0, 0.2705882, 1,
1.699046, 1.160109, 0.9558508, 1, 0, 0.2627451, 1,
1.700199, 0.3269675, -0.2509161, 1, 0, 0.2588235, 1,
1.720968, -0.3975255, 1.69089, 1, 0, 0.2509804, 1,
1.721383, -0.4096158, 1.249434, 1, 0, 0.2470588, 1,
1.756235, -0.2535505, 3.119021, 1, 0, 0.2392157, 1,
1.767337, -0.8512846, 1.900807, 1, 0, 0.2352941, 1,
1.776392, 0.5852674, 1.713212, 1, 0, 0.227451, 1,
1.80839, -0.05686657, 1.819365, 1, 0, 0.2235294, 1,
1.847185, 1.66704, 1.576092, 1, 0, 0.2156863, 1,
1.868744, -1.190001, 1.712821, 1, 0, 0.2117647, 1,
1.875432, -0.3386897, 3.000602, 1, 0, 0.2039216, 1,
1.887535, -0.8070721, 2.41032, 1, 0, 0.1960784, 1,
1.8993, 1.950119, 1.049981, 1, 0, 0.1921569, 1,
1.899906, 0.2120077, 1.812867, 1, 0, 0.1843137, 1,
1.919535, -0.8424103, 0.7386005, 1, 0, 0.1803922, 1,
1.925237, -1.633062, 2.913301, 1, 0, 0.172549, 1,
1.926306, 1.098304, 2.594011, 1, 0, 0.1686275, 1,
1.932953, -1.653268, 1.755076, 1, 0, 0.1607843, 1,
1.991634, 0.5825261, 1.480514, 1, 0, 0.1568628, 1,
2.007992, -1.156798, 2.994961, 1, 0, 0.1490196, 1,
2.00964, -0.5822977, 3.506237, 1, 0, 0.145098, 1,
2.042235, 0.1322352, 3.396017, 1, 0, 0.1372549, 1,
2.0434, 0.2149111, 1.882307, 1, 0, 0.1333333, 1,
2.057658, 0.1113358, 0.8305361, 1, 0, 0.1254902, 1,
2.071217, 1.100164, 1.889009, 1, 0, 0.1215686, 1,
2.083843, 0.2321551, 2.81356, 1, 0, 0.1137255, 1,
2.09304, -1.141639, 1.054646, 1, 0, 0.1098039, 1,
2.178805, 1.881445, -0.6233545, 1, 0, 0.1019608, 1,
2.184658, -0.4629661, 1.741423, 1, 0, 0.09411765, 1,
2.187816, -0.1437089, 2.162372, 1, 0, 0.09019608, 1,
2.193331, -0.2233261, 1.209187, 1, 0, 0.08235294, 1,
2.196369, 0.09218506, 1.485526, 1, 0, 0.07843138, 1,
2.207991, 1.549265, -2.855837, 1, 0, 0.07058824, 1,
2.246807, 1.431957, 2.095698, 1, 0, 0.06666667, 1,
2.294356, -0.2668364, 2.485228, 1, 0, 0.05882353, 1,
2.320562, -0.7045425, -0.5415884, 1, 0, 0.05490196, 1,
2.322817, -0.1216012, 2.660531, 1, 0, 0.04705882, 1,
2.346379, -0.3036458, 0.1591096, 1, 0, 0.04313726, 1,
2.445471, -0.03381013, 0.3101309, 1, 0, 0.03529412, 1,
2.53294, 0.1639195, 2.535756, 1, 0, 0.03137255, 1,
2.701698, -0.6172903, 1.835448, 1, 0, 0.02352941, 1,
2.729093, 0.3627975, 1.325393, 1, 0, 0.01960784, 1,
3.011569, -0.2784134, 1.975367, 1, 0, 0.01176471, 1,
3.220257, -0.7523874, 2.065253, 1, 0, 0.007843138, 1
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
0.1216115, -4.397531, -8.391205, 0, -0.5, 0.5, 0.5,
0.1216115, -4.397531, -8.391205, 1, -0.5, 0.5, 0.5,
0.1216115, -4.397531, -8.391205, 1, 1.5, 0.5, 0.5,
0.1216115, -4.397531, -8.391205, 0, 1.5, 0.5, 0.5
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
-4.027474, -0.108283, -8.391205, 0, -0.5, 0.5, 0.5,
-4.027474, -0.108283, -8.391205, 1, -0.5, 0.5, 0.5,
-4.027474, -0.108283, -8.391205, 1, 1.5, 0.5, 0.5,
-4.027474, -0.108283, -8.391205, 0, 1.5, 0.5, 0.5
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
-4.027474, -4.397531, -0.5630915, 0, -0.5, 0.5, 0.5,
-4.027474, -4.397531, -0.5630915, 1, -0.5, 0.5, 0.5,
-4.027474, -4.397531, -0.5630915, 1, 1.5, 0.5, 0.5,
-4.027474, -4.397531, -0.5630915, 0, 1.5, 0.5, 0.5
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
-2, -3.407704, -6.584717,
3, -3.407704, -6.584717,
-2, -3.407704, -6.584717,
-2, -3.572675, -6.885798,
-1, -3.407704, -6.584717,
-1, -3.572675, -6.885798,
0, -3.407704, -6.584717,
0, -3.572675, -6.885798,
1, -3.407704, -6.584717,
1, -3.572675, -6.885798,
2, -3.407704, -6.584717,
2, -3.572675, -6.885798,
3, -3.407704, -6.584717,
3, -3.572675, -6.885798
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
-2, -3.902618, -7.487961, 0, -0.5, 0.5, 0.5,
-2, -3.902618, -7.487961, 1, -0.5, 0.5, 0.5,
-2, -3.902618, -7.487961, 1, 1.5, 0.5, 0.5,
-2, -3.902618, -7.487961, 0, 1.5, 0.5, 0.5,
-1, -3.902618, -7.487961, 0, -0.5, 0.5, 0.5,
-1, -3.902618, -7.487961, 1, -0.5, 0.5, 0.5,
-1, -3.902618, -7.487961, 1, 1.5, 0.5, 0.5,
-1, -3.902618, -7.487961, 0, 1.5, 0.5, 0.5,
0, -3.902618, -7.487961, 0, -0.5, 0.5, 0.5,
0, -3.902618, -7.487961, 1, -0.5, 0.5, 0.5,
0, -3.902618, -7.487961, 1, 1.5, 0.5, 0.5,
0, -3.902618, -7.487961, 0, 1.5, 0.5, 0.5,
1, -3.902618, -7.487961, 0, -0.5, 0.5, 0.5,
1, -3.902618, -7.487961, 1, -0.5, 0.5, 0.5,
1, -3.902618, -7.487961, 1, 1.5, 0.5, 0.5,
1, -3.902618, -7.487961, 0, 1.5, 0.5, 0.5,
2, -3.902618, -7.487961, 0, -0.5, 0.5, 0.5,
2, -3.902618, -7.487961, 1, -0.5, 0.5, 0.5,
2, -3.902618, -7.487961, 1, 1.5, 0.5, 0.5,
2, -3.902618, -7.487961, 0, 1.5, 0.5, 0.5,
3, -3.902618, -7.487961, 0, -0.5, 0.5, 0.5,
3, -3.902618, -7.487961, 1, -0.5, 0.5, 0.5,
3, -3.902618, -7.487961, 1, 1.5, 0.5, 0.5,
3, -3.902618, -7.487961, 0, 1.5, 0.5, 0.5
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
-3.069993, -3, -6.584717,
-3.069993, 3, -6.584717,
-3.069993, -3, -6.584717,
-3.229573, -3, -6.885798,
-3.069993, -2, -6.584717,
-3.229573, -2, -6.885798,
-3.069993, -1, -6.584717,
-3.229573, -1, -6.885798,
-3.069993, 0, -6.584717,
-3.229573, 0, -6.885798,
-3.069993, 1, -6.584717,
-3.229573, 1, -6.885798,
-3.069993, 2, -6.584717,
-3.229573, 2, -6.885798,
-3.069993, 3, -6.584717,
-3.229573, 3, -6.885798
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
-3.548734, -3, -7.487961, 0, -0.5, 0.5, 0.5,
-3.548734, -3, -7.487961, 1, -0.5, 0.5, 0.5,
-3.548734, -3, -7.487961, 1, 1.5, 0.5, 0.5,
-3.548734, -3, -7.487961, 0, 1.5, 0.5, 0.5,
-3.548734, -2, -7.487961, 0, -0.5, 0.5, 0.5,
-3.548734, -2, -7.487961, 1, -0.5, 0.5, 0.5,
-3.548734, -2, -7.487961, 1, 1.5, 0.5, 0.5,
-3.548734, -2, -7.487961, 0, 1.5, 0.5, 0.5,
-3.548734, -1, -7.487961, 0, -0.5, 0.5, 0.5,
-3.548734, -1, -7.487961, 1, -0.5, 0.5, 0.5,
-3.548734, -1, -7.487961, 1, 1.5, 0.5, 0.5,
-3.548734, -1, -7.487961, 0, 1.5, 0.5, 0.5,
-3.548734, 0, -7.487961, 0, -0.5, 0.5, 0.5,
-3.548734, 0, -7.487961, 1, -0.5, 0.5, 0.5,
-3.548734, 0, -7.487961, 1, 1.5, 0.5, 0.5,
-3.548734, 0, -7.487961, 0, 1.5, 0.5, 0.5,
-3.548734, 1, -7.487961, 0, -0.5, 0.5, 0.5,
-3.548734, 1, -7.487961, 1, -0.5, 0.5, 0.5,
-3.548734, 1, -7.487961, 1, 1.5, 0.5, 0.5,
-3.548734, 1, -7.487961, 0, 1.5, 0.5, 0.5,
-3.548734, 2, -7.487961, 0, -0.5, 0.5, 0.5,
-3.548734, 2, -7.487961, 1, -0.5, 0.5, 0.5,
-3.548734, 2, -7.487961, 1, 1.5, 0.5, 0.5,
-3.548734, 2, -7.487961, 0, 1.5, 0.5, 0.5,
-3.548734, 3, -7.487961, 0, -0.5, 0.5, 0.5,
-3.548734, 3, -7.487961, 1, -0.5, 0.5, 0.5,
-3.548734, 3, -7.487961, 1, 1.5, 0.5, 0.5,
-3.548734, 3, -7.487961, 0, 1.5, 0.5, 0.5
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
-3.069993, -3.407704, -6,
-3.069993, -3.407704, 4,
-3.069993, -3.407704, -6,
-3.229573, -3.572675, -6,
-3.069993, -3.407704, -4,
-3.229573, -3.572675, -4,
-3.069993, -3.407704, -2,
-3.229573, -3.572675, -2,
-3.069993, -3.407704, 0,
-3.229573, -3.572675, 0,
-3.069993, -3.407704, 2,
-3.229573, -3.572675, 2,
-3.069993, -3.407704, 4,
-3.229573, -3.572675, 4
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
"-6",
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
-3.548734, -3.902618, -6, 0, -0.5, 0.5, 0.5,
-3.548734, -3.902618, -6, 1, -0.5, 0.5, 0.5,
-3.548734, -3.902618, -6, 1, 1.5, 0.5, 0.5,
-3.548734, -3.902618, -6, 0, 1.5, 0.5, 0.5,
-3.548734, -3.902618, -4, 0, -0.5, 0.5, 0.5,
-3.548734, -3.902618, -4, 1, -0.5, 0.5, 0.5,
-3.548734, -3.902618, -4, 1, 1.5, 0.5, 0.5,
-3.548734, -3.902618, -4, 0, 1.5, 0.5, 0.5,
-3.548734, -3.902618, -2, 0, -0.5, 0.5, 0.5,
-3.548734, -3.902618, -2, 1, -0.5, 0.5, 0.5,
-3.548734, -3.902618, -2, 1, 1.5, 0.5, 0.5,
-3.548734, -3.902618, -2, 0, 1.5, 0.5, 0.5,
-3.548734, -3.902618, 0, 0, -0.5, 0.5, 0.5,
-3.548734, -3.902618, 0, 1, -0.5, 0.5, 0.5,
-3.548734, -3.902618, 0, 1, 1.5, 0.5, 0.5,
-3.548734, -3.902618, 0, 0, 1.5, 0.5, 0.5,
-3.548734, -3.902618, 2, 0, -0.5, 0.5, 0.5,
-3.548734, -3.902618, 2, 1, -0.5, 0.5, 0.5,
-3.548734, -3.902618, 2, 1, 1.5, 0.5, 0.5,
-3.548734, -3.902618, 2, 0, 1.5, 0.5, 0.5,
-3.548734, -3.902618, 4, 0, -0.5, 0.5, 0.5,
-3.548734, -3.902618, 4, 1, -0.5, 0.5, 0.5,
-3.548734, -3.902618, 4, 1, 1.5, 0.5, 0.5,
-3.548734, -3.902618, 4, 0, 1.5, 0.5, 0.5
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
-3.069993, -3.407704, -6.584717,
-3.069993, 3.191138, -6.584717,
-3.069993, -3.407704, 5.458534,
-3.069993, 3.191138, 5.458534,
-3.069993, -3.407704, -6.584717,
-3.069993, -3.407704, 5.458534,
-3.069993, 3.191138, -6.584717,
-3.069993, 3.191138, 5.458534,
-3.069993, -3.407704, -6.584717,
3.313216, -3.407704, -6.584717,
-3.069993, -3.407704, 5.458534,
3.313216, -3.407704, 5.458534,
-3.069993, 3.191138, -6.584717,
3.313216, 3.191138, -6.584717,
-3.069993, 3.191138, 5.458534,
3.313216, 3.191138, 5.458534,
3.313216, -3.407704, -6.584717,
3.313216, 3.191138, -6.584717,
3.313216, -3.407704, 5.458534,
3.313216, 3.191138, 5.458534,
3.313216, -3.407704, -6.584717,
3.313216, -3.407704, 5.458534,
3.313216, 3.191138, -6.584717,
3.313216, 3.191138, 5.458534
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
var radius = 8.086412;
var distance = 35.97736;
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
mvMatrix.translate( -0.1216115, 0.108283, 0.5630915 );
mvMatrix.scale( 1.369717, 1.324958, 0.7259823 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.97736);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
propanil<-read.table("propanil.xyz")
```

```
## Error in read.table("propanil.xyz"): no lines available in input
```

```r
x<-propanil$V2
```

```
## Error in eval(expr, envir, enclos): object 'propanil' not found
```

```r
y<-propanil$V3
```

```
## Error in eval(expr, envir, enclos): object 'propanil' not found
```

```r
z<-propanil$V4
```

```
## Error in eval(expr, envir, enclos): object 'propanil' not found
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
-2.977034, -2.36313, -2.586813, 0, 0, 1, 1, 1,
-2.966738, 1.428066, -0.9508752, 1, 0, 0, 1, 1,
-2.820604, -0.4742131, -1.649541, 1, 0, 0, 1, 1,
-2.775769, 0.9711462, -0.3425344, 1, 0, 0, 1, 1,
-2.6734, -1.668674, -3.002162, 1, 0, 0, 1, 1,
-2.626008, 0.2309871, -2.261656, 1, 0, 0, 1, 1,
-2.592438, -0.05471086, -0.5419286, 0, 0, 0, 1, 1,
-2.442826, -1.258149, -2.912137, 0, 0, 0, 1, 1,
-2.435514, 0.4221202, -1.326954, 0, 0, 0, 1, 1,
-2.43364, 0.8194325, -2.236732, 0, 0, 0, 1, 1,
-2.329608, 1.051981, -2.295523, 0, 0, 0, 1, 1,
-2.300277, 1.028483, 0.3639011, 0, 0, 0, 1, 1,
-2.292448, -0.4907506, -1.211702, 0, 0, 0, 1, 1,
-2.241171, 0.4741155, -0.9913954, 1, 1, 1, 1, 1,
-2.240377, 1.209957, -3.321112, 1, 1, 1, 1, 1,
-2.224488, -1.680094, -1.653839, 1, 1, 1, 1, 1,
-2.197929, 0.03855202, -2.362695, 1, 1, 1, 1, 1,
-2.140366, 0.9916509, -2.648566, 1, 1, 1, 1, 1,
-2.120367, 0.09925023, -2.023122, 1, 1, 1, 1, 1,
-2.111418, -1.059172, -0.7083507, 1, 1, 1, 1, 1,
-2.106039, 1.276785, -0.753564, 1, 1, 1, 1, 1,
-2.08592, -0.8298621, -0.1389443, 1, 1, 1, 1, 1,
-2.074204, -0.6044787, -1.531697, 1, 1, 1, 1, 1,
-2.037809, -2.346493, -2.276068, 1, 1, 1, 1, 1,
-1.995963, 0.03651695, 0.1620307, 1, 1, 1, 1, 1,
-1.867086, -0.1946003, 1.598947, 1, 1, 1, 1, 1,
-1.862205, -0.8882126, -3.475319, 1, 1, 1, 1, 1,
-1.821839, -0.9296259, -1.218462, 1, 1, 1, 1, 1,
-1.818269, 1.217165, -1.174156, 0, 0, 1, 1, 1,
-1.787664, -1.094951, -1.840692, 1, 0, 0, 1, 1,
-1.769083, 0.6077831, -0.9390619, 1, 0, 0, 1, 1,
-1.756277, -0.6895453, -1.992237, 1, 0, 0, 1, 1,
-1.752983, -0.6316131, -1.643511, 1, 0, 0, 1, 1,
-1.752816, 1.633506, 1.99198, 1, 0, 0, 1, 1,
-1.723426, 0.8508845, -1.745685, 0, 0, 0, 1, 1,
-1.722869, 1.875372, 0.307877, 0, 0, 0, 1, 1,
-1.713632, -0.3065333, -3.187315, 0, 0, 0, 1, 1,
-1.706536, -0.1474359, 0.672183, 0, 0, 0, 1, 1,
-1.686307, 0.8583709, -0.8468905, 0, 0, 0, 1, 1,
-1.681292, 1.238624, -2.596119, 0, 0, 0, 1, 1,
-1.675742, -0.9948009, -1.218247, 0, 0, 0, 1, 1,
-1.673383, 0.3466091, -1.410533, 1, 1, 1, 1, 1,
-1.663511, -1.766478, -1.888708, 1, 1, 1, 1, 1,
-1.644626, 0.4769435, 0.3838109, 1, 1, 1, 1, 1,
-1.643184, 0.2168504, -2.110595, 1, 1, 1, 1, 1,
-1.634032, -0.9067456, -1.312135, 1, 1, 1, 1, 1,
-1.628631, -0.1093006, -1.088915, 1, 1, 1, 1, 1,
-1.618017, 1.653627, 0.654867, 1, 1, 1, 1, 1,
-1.600095, 0.9913608, 0.06703395, 1, 1, 1, 1, 1,
-1.575548, -0.1099745, -2.048131, 1, 1, 1, 1, 1,
-1.574828, 0.7143795, -0.6209748, 1, 1, 1, 1, 1,
-1.572421, -0.5054773, -2.649348, 1, 1, 1, 1, 1,
-1.56954, -1.72508, -3.340224, 1, 1, 1, 1, 1,
-1.560515, 0.3335409, -1.884399, 1, 1, 1, 1, 1,
-1.546333, -0.3888204, -0.02965427, 1, 1, 1, 1, 1,
-1.510923, -0.05177084, -1.796233, 1, 1, 1, 1, 1,
-1.491388, -0.2160504, -0.4678711, 0, 0, 1, 1, 1,
-1.489416, -0.5776612, -0.6005265, 1, 0, 0, 1, 1,
-1.485801, -1.846976, -3.191667, 1, 0, 0, 1, 1,
-1.473307, -1.48333, -3.69682, 1, 0, 0, 1, 1,
-1.471807, 0.4380181, -0.8154544, 1, 0, 0, 1, 1,
-1.460451, -1.824268, -2.182011, 1, 0, 0, 1, 1,
-1.455238, 0.770112, -0.8100167, 0, 0, 0, 1, 1,
-1.450599, -0.1017748, -1.479884, 0, 0, 0, 1, 1,
-1.4457, 2.383817, -0.1537981, 0, 0, 0, 1, 1,
-1.429254, -2.399771, -1.954808, 0, 0, 0, 1, 1,
-1.410286, 0.8132235, -2.395163, 0, 0, 0, 1, 1,
-1.407018, -0.5036734, -2.468258, 0, 0, 0, 1, 1,
-1.400573, -0.5718896, -2.507713, 0, 0, 0, 1, 1,
-1.400238, -0.2866354, -1.023515, 1, 1, 1, 1, 1,
-1.399232, 0.3030935, 0.2370714, 1, 1, 1, 1, 1,
-1.389474, -0.5058103, 0.1754307, 1, 1, 1, 1, 1,
-1.386641, -1.291594, -1.786359, 1, 1, 1, 1, 1,
-1.365066, 0.6173078, -1.12481, 1, 1, 1, 1, 1,
-1.361181, 0.7726287, 0.7454752, 1, 1, 1, 1, 1,
-1.356144, -0.4313143, 1.459663, 1, 1, 1, 1, 1,
-1.349792, 1.118391, 0.8570321, 1, 1, 1, 1, 1,
-1.34767, 1.700185, -0.702601, 1, 1, 1, 1, 1,
-1.344349, -0.4403488, -4.091693, 1, 1, 1, 1, 1,
-1.339666, 0.584393, 0.7863609, 1, 1, 1, 1, 1,
-1.338056, -0.752267, -1.779843, 1, 1, 1, 1, 1,
-1.336543, -0.02654363, -0.6053913, 1, 1, 1, 1, 1,
-1.334213, 0.314881, -2.523911, 1, 1, 1, 1, 1,
-1.329951, 0.1748531, -4.28102, 1, 1, 1, 1, 1,
-1.327413, -1.327291, -1.919725, 0, 0, 1, 1, 1,
-1.324329, 0.2243472, -0.3606856, 1, 0, 0, 1, 1,
-1.32218, -1.483195, -3.347734, 1, 0, 0, 1, 1,
-1.321037, -0.8192358, -3.073707, 1, 0, 0, 1, 1,
-1.316734, -0.561675, -1.168382, 1, 0, 0, 1, 1,
-1.308127, -1.137137, -2.316131, 1, 0, 0, 1, 1,
-1.296345, -1.377644, -2.210305, 0, 0, 0, 1, 1,
-1.292318, 1.146945, -2.100431, 0, 0, 0, 1, 1,
-1.291917, -1.400716, -2.411477, 0, 0, 0, 1, 1,
-1.288858, -0.02559056, -1.132098, 0, 0, 0, 1, 1,
-1.279806, -1.20725, -0.8681415, 0, 0, 0, 1, 1,
-1.260452, 1.238192, -1.415565, 0, 0, 0, 1, 1,
-1.258191, 0.4141926, -1.003155, 0, 0, 0, 1, 1,
-1.241373, -0.8155484, -2.221585, 1, 1, 1, 1, 1,
-1.231783, 0.1229248, -2.722722, 1, 1, 1, 1, 1,
-1.226409, -0.7622569, -1.631389, 1, 1, 1, 1, 1,
-1.220939, -1.721128, -2.723616, 1, 1, 1, 1, 1,
-1.211608, -0.2298197, -2.584741, 1, 1, 1, 1, 1,
-1.209075, -1.550609, -3.342096, 1, 1, 1, 1, 1,
-1.208939, -0.09072563, -0.04312385, 1, 1, 1, 1, 1,
-1.203013, -1.191482, -1.778087, 1, 1, 1, 1, 1,
-1.199537, -1.25954, -2.87662, 1, 1, 1, 1, 1,
-1.193882, 1.650217, -0.6365148, 1, 1, 1, 1, 1,
-1.190488, 0.5297161, -2.118897, 1, 1, 1, 1, 1,
-1.189334, 0.5542365, -0.1929391, 1, 1, 1, 1, 1,
-1.179579, 0.9306891, -1.873912, 1, 1, 1, 1, 1,
-1.177903, -3.311605, -2.424878, 1, 1, 1, 1, 1,
-1.162536, 1.261839, -0.59885, 1, 1, 1, 1, 1,
-1.160879, 0.02665164, -1.98259, 0, 0, 1, 1, 1,
-1.15831, 0.1157193, -1.306913, 1, 0, 0, 1, 1,
-1.155668, -1.466731, -4.088816, 1, 0, 0, 1, 1,
-1.146577, -1.416617, -2.265511, 1, 0, 0, 1, 1,
-1.146214, -1.668885, -1.337621, 1, 0, 0, 1, 1,
-1.140056, -1.415408, -1.771137, 1, 0, 0, 1, 1,
-1.137593, -0.5728318, -1.199945, 0, 0, 0, 1, 1,
-1.135997, 1.200626, 2.095916, 0, 0, 0, 1, 1,
-1.133736, -0.1272902, -2.645616, 0, 0, 0, 1, 1,
-1.126439, 0.3000207, -1.821105, 0, 0, 0, 1, 1,
-1.125835, 1.603555, 0.9790884, 0, 0, 0, 1, 1,
-1.123714, 2.148963, 0.7450097, 0, 0, 0, 1, 1,
-1.117963, -0.2005417, -2.726621, 0, 0, 0, 1, 1,
-1.116764, -1.846677, -0.5604477, 1, 1, 1, 1, 1,
-1.112104, -1.353464, -2.476463, 1, 1, 1, 1, 1,
-1.110072, 0.9688026, -0.3132649, 1, 1, 1, 1, 1,
-1.104761, -0.5577825, -1.897187, 1, 1, 1, 1, 1,
-1.103383, 0.8809006, 0.1845825, 1, 1, 1, 1, 1,
-1.099966, 0.8231703, -1.519221, 1, 1, 1, 1, 1,
-1.095971, -0.5947471, -1.88455, 1, 1, 1, 1, 1,
-1.093284, -0.3010858, -0.8512141, 1, 1, 1, 1, 1,
-1.085413, -0.8721177, -2.509729, 1, 1, 1, 1, 1,
-1.081652, 0.08242752, -1.035477, 1, 1, 1, 1, 1,
-1.077169, -0.4852369, -2.22027, 1, 1, 1, 1, 1,
-1.073635, 1.656618, -0.6078232, 1, 1, 1, 1, 1,
-1.060646, 0.3000548, -2.096219, 1, 1, 1, 1, 1,
-1.055979, -1.207013, -2.647346, 1, 1, 1, 1, 1,
-1.054102, 1.227252, -2.12413, 1, 1, 1, 1, 1,
-1.051972, 0.009122692, -0.6011265, 0, 0, 1, 1, 1,
-1.051868, 0.004523264, -0.5980866, 1, 0, 0, 1, 1,
-1.048411, 0.214263, -1.479746, 1, 0, 0, 1, 1,
-1.044346, 0.9339222, -1.222145, 1, 0, 0, 1, 1,
-1.030598, 0.06630191, -2.488006, 1, 0, 0, 1, 1,
-1.010437, 0.6028057, -1.911185, 1, 0, 0, 1, 1,
-1.006459, -0.5999869, -0.09750439, 0, 0, 0, 1, 1,
-1.003943, 0.8148415, -1.12452, 0, 0, 0, 1, 1,
-1.000836, -1.016307, -1.509071, 0, 0, 0, 1, 1,
-1.000137, 1.47095, 0.1353251, 0, 0, 0, 1, 1,
-0.9977345, 1.458439, 0.1853314, 0, 0, 0, 1, 1,
-0.9935521, 0.782369, -1.927994, 0, 0, 0, 1, 1,
-0.9896255, -0.9209003, -2.921683, 0, 0, 0, 1, 1,
-0.9853171, 1.06533, -0.3882779, 1, 1, 1, 1, 1,
-0.980408, -0.3545335, -2.740241, 1, 1, 1, 1, 1,
-0.9754849, -0.1272332, -1.014624, 1, 1, 1, 1, 1,
-0.9655206, 0.3062751, -2.6512, 1, 1, 1, 1, 1,
-0.9607463, 2.23279, -0.921932, 1, 1, 1, 1, 1,
-0.9606565, -0.8464978, -2.394437, 1, 1, 1, 1, 1,
-0.960318, -0.8685163, -2.935672, 1, 1, 1, 1, 1,
-0.9582989, 1.092514, 0.1386749, 1, 1, 1, 1, 1,
-0.9543194, -0.132488, -2.95367, 1, 1, 1, 1, 1,
-0.9336044, 1.530857, -0.926403, 1, 1, 1, 1, 1,
-0.9320202, -0.06387001, -1.911564, 1, 1, 1, 1, 1,
-0.9300989, -0.4135352, 0.9122017, 1, 1, 1, 1, 1,
-0.926411, 0.2759478, -2.409828, 1, 1, 1, 1, 1,
-0.9263833, 1.745363, -0.6817542, 1, 1, 1, 1, 1,
-0.9241154, -2.061206, -3.243666, 1, 1, 1, 1, 1,
-0.9194938, 1.17458, -1.656014, 0, 0, 1, 1, 1,
-0.9186721, -0.8465857, -2.125011, 1, 0, 0, 1, 1,
-0.9179736, 0.7755987, -1.45675, 1, 0, 0, 1, 1,
-0.9083986, -0.08723898, -0.7217695, 1, 0, 0, 1, 1,
-0.9054609, 0.08718821, -1.494112, 1, 0, 0, 1, 1,
-0.9004298, -0.4894552, -1.593436, 1, 0, 0, 1, 1,
-0.899285, -2.85087, -2.516805, 0, 0, 0, 1, 1,
-0.8942156, -0.5115367, -0.8658685, 0, 0, 0, 1, 1,
-0.8877205, -0.6848713, -2.866972, 0, 0, 0, 1, 1,
-0.8823599, 0.2949835, -0.8149973, 0, 0, 0, 1, 1,
-0.8817917, -0.7227147, -3.423021, 0, 0, 0, 1, 1,
-0.8815885, 0.7886742, -0.1820285, 0, 0, 0, 1, 1,
-0.8603311, 0.7613887, -2.5158, 0, 0, 0, 1, 1,
-0.8600225, 0.3578452, 0.2032282, 1, 1, 1, 1, 1,
-0.857527, -0.7424827, -1.519997, 1, 1, 1, 1, 1,
-0.8520748, -0.4970193, -1.246292, 1, 1, 1, 1, 1,
-0.8441942, -0.6279856, -0.8472357, 1, 1, 1, 1, 1,
-0.8348554, -0.2593147, -1.557738, 1, 1, 1, 1, 1,
-0.8274658, 1.302974, -0.880827, 1, 1, 1, 1, 1,
-0.8205113, 0.280831, -1.224262, 1, 1, 1, 1, 1,
-0.8201122, -0.02783231, -1.984446, 1, 1, 1, 1, 1,
-0.818021, -0.4922209, -3.186126, 1, 1, 1, 1, 1,
-0.8175426, -0.4588033, -2.173362, 1, 1, 1, 1, 1,
-0.810295, -0.200769, -2.718847, 1, 1, 1, 1, 1,
-0.7986495, 0.4729862, 0.4082656, 1, 1, 1, 1, 1,
-0.7960208, 0.9137051, -0.798937, 1, 1, 1, 1, 1,
-0.7927498, 1.227581, -1.020248, 1, 1, 1, 1, 1,
-0.790549, -2.302351, -3.035487, 1, 1, 1, 1, 1,
-0.7877524, 0.64533, 0.8550161, 0, 0, 1, 1, 1,
-0.7774037, 0.02657121, -1.827432, 1, 0, 0, 1, 1,
-0.7765828, -0.1346661, -1.344642, 1, 0, 0, 1, 1,
-0.7757526, 1.042753, -1.691434, 1, 0, 0, 1, 1,
-0.7751687, -0.6294041, -1.113239, 1, 0, 0, 1, 1,
-0.7650521, 0.03825963, -1.100468, 1, 0, 0, 1, 1,
-0.7562405, 0.2847601, 0.05324492, 0, 0, 0, 1, 1,
-0.752952, 0.8869822, -0.5925014, 0, 0, 0, 1, 1,
-0.751634, 0.8267276, -0.402528, 0, 0, 0, 1, 1,
-0.7452571, 0.6407455, -0.1527865, 0, 0, 0, 1, 1,
-0.7336723, -0.830175, -1.895203, 0, 0, 0, 1, 1,
-0.7273148, 0.1373724, -1.344991, 0, 0, 0, 1, 1,
-0.7244824, 0.841703, -2.489614, 0, 0, 0, 1, 1,
-0.7238311, -0.4315801, -2.470323, 1, 1, 1, 1, 1,
-0.7221788, 0.3687065, -1.260154, 1, 1, 1, 1, 1,
-0.7186998, -0.2749843, -1.63041, 1, 1, 1, 1, 1,
-0.7170551, 0.5543463, -1.028194, 1, 1, 1, 1, 1,
-0.716736, -0.09400828, -2.465907, 1, 1, 1, 1, 1,
-0.7128979, 0.9061865, -0.3340548, 1, 1, 1, 1, 1,
-0.6992397, -0.5237535, -1.604419, 1, 1, 1, 1, 1,
-0.6991141, -0.4522348, -1.809407, 1, 1, 1, 1, 1,
-0.6950528, 0.3412527, -2.06557, 1, 1, 1, 1, 1,
-0.6941896, 1.127528, 0.01574549, 1, 1, 1, 1, 1,
-0.6934654, 0.04628842, -2.555628, 1, 1, 1, 1, 1,
-0.6915039, 1.95528, -2.650697, 1, 1, 1, 1, 1,
-0.6912138, -0.4273976, -2.185811, 1, 1, 1, 1, 1,
-0.6911346, 1.740497, 1.744545, 1, 1, 1, 1, 1,
-0.6899629, 0.189814, -0.5573499, 1, 1, 1, 1, 1,
-0.687178, -0.08064469, -2.143513, 0, 0, 1, 1, 1,
-0.6854205, -0.7002079, -1.18641, 1, 0, 0, 1, 1,
-0.6853368, 0.2050089, -1.263465, 1, 0, 0, 1, 1,
-0.6815108, -1.426072, -2.230958, 1, 0, 0, 1, 1,
-0.6738758, 1.017049, -1.332048, 1, 0, 0, 1, 1,
-0.6683218, -0.419621, -1.309775, 1, 0, 0, 1, 1,
-0.6678491, -0.783218, -3.001806, 0, 0, 0, 1, 1,
-0.6651986, 0.3125276, -2.48397, 0, 0, 0, 1, 1,
-0.6636539, -0.599886, -3.319765, 0, 0, 0, 1, 1,
-0.6630628, 0.7245879, 0.02226483, 0, 0, 0, 1, 1,
-0.6562216, 0.5282836, -1.726777, 0, 0, 0, 1, 1,
-0.65343, -1.189112, -4.168732, 0, 0, 0, 1, 1,
-0.649858, -0.2191281, -1.612148, 0, 0, 0, 1, 1,
-0.6482282, -1.389019, -1.168077, 1, 1, 1, 1, 1,
-0.6446438, -0.08406534, -2.319154, 1, 1, 1, 1, 1,
-0.6443429, -0.9989234, -2.843136, 1, 1, 1, 1, 1,
-0.6427535, 2.046786, -0.182019, 1, 1, 1, 1, 1,
-0.6395867, -0.2472503, -4.093295, 1, 1, 1, 1, 1,
-0.6375227, -0.2959877, -0.7814869, 1, 1, 1, 1, 1,
-0.6373866, 0.6792689, -2.243818, 1, 1, 1, 1, 1,
-0.6320432, 0.3985349, -2.973023, 1, 1, 1, 1, 1,
-0.6308903, 0.589784, -2.299708, 1, 1, 1, 1, 1,
-0.6275504, -1.697011, -3.93088, 1, 1, 1, 1, 1,
-0.6260985, -1.929697, -3.219008, 1, 1, 1, 1, 1,
-0.6260264, -2.945639, -2.631508, 1, 1, 1, 1, 1,
-0.6225288, 0.4135409, -1.668686, 1, 1, 1, 1, 1,
-0.6204758, 0.2461672, -1.451377, 1, 1, 1, 1, 1,
-0.6175058, -1.236647, -0.2668827, 1, 1, 1, 1, 1,
-0.6152139, -0.4159549, -3.555571, 0, 0, 1, 1, 1,
-0.6146504, 0.7298528, -0.7681152, 1, 0, 0, 1, 1,
-0.6117555, 0.5483469, -2.01308, 1, 0, 0, 1, 1,
-0.6109259, 0.2247235, 0.7831602, 1, 0, 0, 1, 1,
-0.6064737, -1.53149, -3.357445, 1, 0, 0, 1, 1,
-0.6058108, -0.8177789, -1.330973, 1, 0, 0, 1, 1,
-0.6009596, -0.1209631, -1.661755, 0, 0, 0, 1, 1,
-0.5978898, -0.105676, -1.668025, 0, 0, 0, 1, 1,
-0.5955202, 0.05259216, -2.634653, 0, 0, 0, 1, 1,
-0.594242, 0.8450739, -1.56253, 0, 0, 0, 1, 1,
-0.5847725, -0.6484635, -3.81844, 0, 0, 0, 1, 1,
-0.5716167, -1.225831, -1.569585, 0, 0, 0, 1, 1,
-0.5698168, -1.734911, -2.534783, 0, 0, 0, 1, 1,
-0.5585568, -0.9852737, -4.676356, 1, 1, 1, 1, 1,
-0.556648, 1.618508, -2.4507, 1, 1, 1, 1, 1,
-0.556083, 0.1887498, -1.270527, 1, 1, 1, 1, 1,
-0.5481158, -0.01660042, -0.7696683, 1, 1, 1, 1, 1,
-0.546612, -1.626143, -2.480224, 1, 1, 1, 1, 1,
-0.5417663, 0.8682697, -1.191876, 1, 1, 1, 1, 1,
-0.5288817, -0.6457424, -2.163487, 1, 1, 1, 1, 1,
-0.5258108, -0.6007364, -2.223617, 1, 1, 1, 1, 1,
-0.5195285, 0.6715774, -3.600111, 1, 1, 1, 1, 1,
-0.5182764, 0.401326, -1.54118, 1, 1, 1, 1, 1,
-0.5163583, -0.6709992, -3.811954, 1, 1, 1, 1, 1,
-0.5159997, 0.4998185, -1.781808, 1, 1, 1, 1, 1,
-0.5106198, -0.7280332, -2.40052, 1, 1, 1, 1, 1,
-0.5065963, 0.4436849, -0.3276682, 1, 1, 1, 1, 1,
-0.506227, -0.6527414, -2.090656, 1, 1, 1, 1, 1,
-0.5032632, 0.8386019, -0.4071491, 0, 0, 1, 1, 1,
-0.5006778, 0.300679, -1.487204, 1, 0, 0, 1, 1,
-0.4979955, 0.4516233, -1.94714, 1, 0, 0, 1, 1,
-0.4970882, 0.4384575, -2.195137, 1, 0, 0, 1, 1,
-0.4969156, -0.6417657, -1.55978, 1, 0, 0, 1, 1,
-0.4963234, 0.09858389, -0.4730113, 1, 0, 0, 1, 1,
-0.4931082, 0.7690759, 0.1102927, 0, 0, 0, 1, 1,
-0.4919876, -0.2945294, -3.02778, 0, 0, 0, 1, 1,
-0.4885426, -0.08845764, -2.21898, 0, 0, 0, 1, 1,
-0.488393, 0.2428987, 0.6244671, 0, 0, 0, 1, 1,
-0.4876266, -1.145765, -3.240245, 0, 0, 0, 1, 1,
-0.4833658, 0.3563061, -1.413433, 0, 0, 0, 1, 1,
-0.4773059, -1.695515, -1.983609, 0, 0, 0, 1, 1,
-0.47394, 0.6059596, 0.5366217, 1, 1, 1, 1, 1,
-0.4696643, -0.2129178, -2.015327, 1, 1, 1, 1, 1,
-0.46924, 2.32661, -1.309152, 1, 1, 1, 1, 1,
-0.4661373, 0.6099875, 0.7231759, 1, 1, 1, 1, 1,
-0.4568222, -0.9847314, -3.465907, 1, 1, 1, 1, 1,
-0.4560162, 2.667402, -0.5697966, 1, 1, 1, 1, 1,
-0.4549575, 1.328903, -1.693669, 1, 1, 1, 1, 1,
-0.4528201, 2.093114, -1.546796, 1, 1, 1, 1, 1,
-0.4526789, 0.8034704, 0.3566062, 1, 1, 1, 1, 1,
-0.4496507, 0.6883453, -1.970421, 1, 1, 1, 1, 1,
-0.4478797, 0.9895542, 0.4387171, 1, 1, 1, 1, 1,
-0.4454336, 0.06245823, -0.6736024, 1, 1, 1, 1, 1,
-0.4448617, -0.3985098, -2.066326, 1, 1, 1, 1, 1,
-0.444052, -0.6170102, -2.798837, 1, 1, 1, 1, 1,
-0.4342303, -0.4031561, -3.061035, 1, 1, 1, 1, 1,
-0.4320944, 0.03420098, -1.661571, 0, 0, 1, 1, 1,
-0.4316414, -1.21506, -0.6732853, 1, 0, 0, 1, 1,
-0.4266551, 0.08377213, -1.342491, 1, 0, 0, 1, 1,
-0.4242034, -1.894069, -2.612428, 1, 0, 0, 1, 1,
-0.4241867, -0.7504453, -2.190922, 1, 0, 0, 1, 1,
-0.4233764, 0.4067621, -0.02423228, 1, 0, 0, 1, 1,
-0.4224919, -0.6139153, -0.6539742, 0, 0, 0, 1, 1,
-0.4223702, -1.00106, -5.234219, 0, 0, 0, 1, 1,
-0.421952, 1.944525, -0.4219326, 0, 0, 0, 1, 1,
-0.4218313, -1.213308, -2.249877, 0, 0, 0, 1, 1,
-0.4152711, -0.1073417, -1.642841, 0, 0, 0, 1, 1,
-0.4111313, 0.9357663, -0.06359172, 0, 0, 0, 1, 1,
-0.410753, 0.6398354, -0.4884732, 0, 0, 0, 1, 1,
-0.4099307, 0.4267901, -0.6796936, 1, 1, 1, 1, 1,
-0.4096196, -0.8320982, -1.903919, 1, 1, 1, 1, 1,
-0.4076551, -0.4827106, -2.881398, 1, 1, 1, 1, 1,
-0.3986324, 0.2505335, -0.1112917, 1, 1, 1, 1, 1,
-0.3980984, 1.331221, 0.8146492, 1, 1, 1, 1, 1,
-0.3967635, -0.374897, -2.824636, 1, 1, 1, 1, 1,
-0.3941472, 0.6803634, 0.6788669, 1, 1, 1, 1, 1,
-0.3937178, 0.5793431, 1.039342, 1, 1, 1, 1, 1,
-0.3903831, -1.623984, -4.082199, 1, 1, 1, 1, 1,
-0.3896333, -0.9676726, -1.546674, 1, 1, 1, 1, 1,
-0.3863747, -0.6408296, -2.596307, 1, 1, 1, 1, 1,
-0.3861815, -0.1424662, -2.124847, 1, 1, 1, 1, 1,
-0.3831089, 1.585678, 0.2282191, 1, 1, 1, 1, 1,
-0.3825442, 0.7690461, -0.6606339, 1, 1, 1, 1, 1,
-0.3809779, 1.178424, 1.558679, 1, 1, 1, 1, 1,
-0.3807621, -0.6155563, -2.992892, 0, 0, 1, 1, 1,
-0.3796994, -0.6303785, -1.946221, 1, 0, 0, 1, 1,
-0.3727944, -1.564928, -1.366519, 1, 0, 0, 1, 1,
-0.370454, 0.9238319, -0.2815539, 1, 0, 0, 1, 1,
-0.3668279, -0.9980115, -3.807856, 1, 0, 0, 1, 1,
-0.366368, -0.8317978, -2.408039, 1, 0, 0, 1, 1,
-0.3650387, -0.9024111, -3.193654, 0, 0, 0, 1, 1,
-0.3610345, -0.8798939, -1.712209, 0, 0, 0, 1, 1,
-0.3552546, -0.6314381, -3.429407, 0, 0, 0, 1, 1,
-0.3533956, 0.5853587, -1.098171, 0, 0, 0, 1, 1,
-0.3526911, 0.151834, -1.442484, 0, 0, 0, 1, 1,
-0.3503384, -0.1489867, -1.017538, 0, 0, 0, 1, 1,
-0.3497578, 1.007002, -0.2512333, 0, 0, 0, 1, 1,
-0.3495632, -1.919887, -3.34133, 1, 1, 1, 1, 1,
-0.3489137, -0.9405807, -2.026918, 1, 1, 1, 1, 1,
-0.3474891, -1.013737, -3.319671, 1, 1, 1, 1, 1,
-0.3437952, -0.59979, -2.195426, 1, 1, 1, 1, 1,
-0.3436043, -0.1835279, -1.633541, 1, 1, 1, 1, 1,
-0.3415063, -0.2210304, -0.5805635, 1, 1, 1, 1, 1,
-0.3397194, 0.6142994, -1.808684, 1, 1, 1, 1, 1,
-0.3333691, -1.000172, -3.441184, 1, 1, 1, 1, 1,
-0.3330902, 1.897876, 0.350145, 1, 1, 1, 1, 1,
-0.332878, 1.147811, -1.698579, 1, 1, 1, 1, 1,
-0.3296479, -1.902773, -3.338874, 1, 1, 1, 1, 1,
-0.3266393, -0.4308229, -2.611521, 1, 1, 1, 1, 1,
-0.3249952, -0.8454832, -3.045594, 1, 1, 1, 1, 1,
-0.3189159, -0.5519859, -1.743486, 1, 1, 1, 1, 1,
-0.3150229, -0.3930274, -0.8008552, 1, 1, 1, 1, 1,
-0.3144152, 0.3663704, 0.3272989, 0, 0, 1, 1, 1,
-0.3135389, 0.2571341, -0.9943738, 1, 0, 0, 1, 1,
-0.3133592, 0.6729081, 0.2840188, 1, 0, 0, 1, 1,
-0.3120292, 1.409774, -0.499966, 1, 0, 0, 1, 1,
-0.3116906, -2.250472, -3.052979, 1, 0, 0, 1, 1,
-0.3103857, -0.1483673, -2.043508, 1, 0, 0, 1, 1,
-0.3100421, -0.8430751, -3.664553, 0, 0, 0, 1, 1,
-0.3058456, 0.1745906, -1.961922, 0, 0, 0, 1, 1,
-0.30426, 0.647255, -0.8050145, 0, 0, 0, 1, 1,
-0.2995004, 0.5686553, -1.799202, 0, 0, 0, 1, 1,
-0.297921, 0.4932075, 0.1744932, 0, 0, 0, 1, 1,
-0.2972327, 1.147502, 1.116311, 0, 0, 0, 1, 1,
-0.2947357, -1.076742, -2.247783, 0, 0, 0, 1, 1,
-0.2831244, 0.7007381, -0.6950905, 1, 1, 1, 1, 1,
-0.2825254, -1.04775, -3.416082, 1, 1, 1, 1, 1,
-0.28094, 0.9816159, -1.151746, 1, 1, 1, 1, 1,
-0.2802057, 0.6149237, -2.734578, 1, 1, 1, 1, 1,
-0.2769996, -0.9858001, -2.24906, 1, 1, 1, 1, 1,
-0.2762916, -1.327354, -3.171255, 1, 1, 1, 1, 1,
-0.2759537, 0.4011763, -1.827871, 1, 1, 1, 1, 1,
-0.2722366, -0.4583347, -3.145089, 1, 1, 1, 1, 1,
-0.2692356, 0.7958654, -2.358134, 1, 1, 1, 1, 1,
-0.2684287, -0.7036358, -2.845512, 1, 1, 1, 1, 1,
-0.2675273, 0.2152091, -0.006585533, 1, 1, 1, 1, 1,
-0.2658818, -1.424783, -2.997966, 1, 1, 1, 1, 1,
-0.2652166, -0.4810917, -3.953892, 1, 1, 1, 1, 1,
-0.2624561, -0.4738832, -2.188212, 1, 1, 1, 1, 1,
-0.2609886, 0.03949745, -3.315111, 1, 1, 1, 1, 1,
-0.2596342, -0.7342525, -1.838735, 0, 0, 1, 1, 1,
-0.2576735, 2.251071, -0.4390712, 1, 0, 0, 1, 1,
-0.2568933, -0.6239246, -3.481606, 1, 0, 0, 1, 1,
-0.2564647, -1.498039, -2.737144, 1, 0, 0, 1, 1,
-0.2494701, 0.112468, -1.709486, 1, 0, 0, 1, 1,
-0.2492963, -0.01550709, -1.447739, 1, 0, 0, 1, 1,
-0.2492624, -1.182363, -2.37798, 0, 0, 0, 1, 1,
-0.2477379, 1.031715, 0.3394237, 0, 0, 0, 1, 1,
-0.2448043, -0.2888566, -2.001377, 0, 0, 0, 1, 1,
-0.2424062, -0.5356335, -4.04581, 0, 0, 0, 1, 1,
-0.2378689, 1.065222, -1.582689, 0, 0, 0, 1, 1,
-0.2367455, 1.824306, -0.1980868, 0, 0, 0, 1, 1,
-0.2336553, 1.200609, -0.09307585, 0, 0, 0, 1, 1,
-0.2314817, 0.7130805, -0.6826809, 1, 1, 1, 1, 1,
-0.2312844, -0.8602718, -2.21523, 1, 1, 1, 1, 1,
-0.2304176, 1.369453, 0.6506506, 1, 1, 1, 1, 1,
-0.2282206, -1.355349, -2.039465, 1, 1, 1, 1, 1,
-0.2280628, 1.488158, -1.812827, 1, 1, 1, 1, 1,
-0.2269164, -0.248635, -2.223762, 1, 1, 1, 1, 1,
-0.2266836, 0.819488, -0.9980974, 1, 1, 1, 1, 1,
-0.2223318, 1.711067, -1.071392, 1, 1, 1, 1, 1,
-0.2216224, -0.0863316, -1.947538, 1, 1, 1, 1, 1,
-0.2212526, 0.3119703, 0.5781142, 1, 1, 1, 1, 1,
-0.2185861, -0.3497899, -2.184538, 1, 1, 1, 1, 1,
-0.2145431, 1.478914, 0.3346447, 1, 1, 1, 1, 1,
-0.2139657, 0.3736747, 0.4288962, 1, 1, 1, 1, 1,
-0.2075812, -0.1066483, -3.203033, 1, 1, 1, 1, 1,
-0.2035003, -0.8415908, -2.924689, 1, 1, 1, 1, 1,
-0.1907881, -0.6874961, -4.108613, 0, 0, 1, 1, 1,
-0.1905228, -0.7306665, -2.374932, 1, 0, 0, 1, 1,
-0.1904467, -0.1393823, -0.8607487, 1, 0, 0, 1, 1,
-0.1893291, 0.6055611, 1.028477, 1, 0, 0, 1, 1,
-0.1886844, -0.3412933, -1.898255, 1, 0, 0, 1, 1,
-0.1874695, -0.3514416, -2.294278, 1, 0, 0, 1, 1,
-0.1863801, -1.387669, -2.101688, 0, 0, 0, 1, 1,
-0.1851002, -0.3384586, -2.025092, 0, 0, 0, 1, 1,
-0.1850514, -0.3094561, -3.560537, 0, 0, 0, 1, 1,
-0.184389, 2.222015, 0.91655, 0, 0, 0, 1, 1,
-0.1816424, 0.0152643, -0.5044529, 0, 0, 0, 1, 1,
-0.1795826, -0.9800327, -1.647523, 0, 0, 0, 1, 1,
-0.1783398, 0.4469617, -1.655088, 0, 0, 0, 1, 1,
-0.1724437, -1.479133, -3.549198, 1, 1, 1, 1, 1,
-0.1718954, -0.9034827, -6.40933, 1, 1, 1, 1, 1,
-0.1655098, -0.4629716, -3.721268, 1, 1, 1, 1, 1,
-0.1622301, 0.8262624, -0.1319071, 1, 1, 1, 1, 1,
-0.1552595, -0.8994039, -3.130831, 1, 1, 1, 1, 1,
-0.1550932, -0.1451448, -3.110906, 1, 1, 1, 1, 1,
-0.1538859, -0.9620539, -2.72622, 1, 1, 1, 1, 1,
-0.1448152, 1.055351, 1.762107, 1, 1, 1, 1, 1,
-0.1443596, -0.1848148, -3.398199, 1, 1, 1, 1, 1,
-0.1430119, 0.03797542, -0.6483955, 1, 1, 1, 1, 1,
-0.1427814, -1.019268, -1.131783, 1, 1, 1, 1, 1,
-0.1418462, -0.8264597, -3.644514, 1, 1, 1, 1, 1,
-0.1386711, -0.2521886, -1.408988, 1, 1, 1, 1, 1,
-0.1370869, 1.561911, -0.3720635, 1, 1, 1, 1, 1,
-0.1297853, 2.573908, 0.5887878, 1, 1, 1, 1, 1,
-0.1215915, 1.4448, 1.152998, 0, 0, 1, 1, 1,
-0.1207254, 0.8586811, 1.46097, 1, 0, 0, 1, 1,
-0.1193981, 0.1328556, -0.2256323, 1, 0, 0, 1, 1,
-0.113373, -0.1067602, -2.876636, 1, 0, 0, 1, 1,
-0.1089492, 1.147538, 1.74926, 1, 0, 0, 1, 1,
-0.1070962, 0.09113133, 0.6632458, 1, 0, 0, 1, 1,
-0.1069507, 0.1286943, -0.4285837, 0, 0, 0, 1, 1,
-0.1055563, 0.07540966, -1.034585, 0, 0, 0, 1, 1,
-0.1008976, -0.3164672, -2.107046, 0, 0, 0, 1, 1,
-0.09608836, 0.5547565, -0.65268, 0, 0, 0, 1, 1,
-0.08397495, 0.55074, 0.6056639, 0, 0, 0, 1, 1,
-0.08389371, 0.3992599, -0.3913777, 0, 0, 0, 1, 1,
-0.08232734, 1.36154, 0.518587, 0, 0, 0, 1, 1,
-0.08018419, 1.304991, 0.2057092, 1, 1, 1, 1, 1,
-0.07856639, -0.5778636, -3.183315, 1, 1, 1, 1, 1,
-0.07562032, -1.483356, -2.429755, 1, 1, 1, 1, 1,
-0.07372954, 0.7227544, -0.226086, 1, 1, 1, 1, 1,
-0.07326269, 0.3980887, -2.10538, 1, 1, 1, 1, 1,
-0.0704324, 0.9400483, 1.548923, 1, 1, 1, 1, 1,
-0.06884076, -1.123174, -3.920092, 1, 1, 1, 1, 1,
-0.06580632, 0.1699843, 0.09345422, 1, 1, 1, 1, 1,
-0.06433325, 0.3645329, 1.135844, 1, 1, 1, 1, 1,
-0.06326655, 0.3673116, 1.081932, 1, 1, 1, 1, 1,
-0.06280394, -1.36517, -2.792675, 1, 1, 1, 1, 1,
-0.05840758, 0.4349084, 0.8338289, 1, 1, 1, 1, 1,
-0.05694558, 1.479423, -1.665238, 1, 1, 1, 1, 1,
-0.05634106, -0.6791906, -3.390019, 1, 1, 1, 1, 1,
-0.05090212, -0.8143781, -2.828084, 1, 1, 1, 1, 1,
-0.04534328, -2.342883, -1.204857, 0, 0, 1, 1, 1,
-0.03857082, 0.0420275, -1.18767, 1, 0, 0, 1, 1,
-0.03377857, -0.3886177, -4.168881, 1, 0, 0, 1, 1,
-0.03160868, -1.100014, -2.67892, 1, 0, 0, 1, 1,
-0.03010051, 1.271228, 0.4963637, 1, 0, 0, 1, 1,
-0.027913, 0.7247211, 1.217109, 1, 0, 0, 1, 1,
-0.02654556, 0.1247384, -0.5258631, 0, 0, 0, 1, 1,
-0.02451595, 0.3319732, -0.9631931, 0, 0, 0, 1, 1,
-0.02192527, -0.6316843, -2.172158, 0, 0, 0, 1, 1,
-0.02189169, -0.5071332, -2.603075, 0, 0, 0, 1, 1,
-0.02078397, 0.6757702, -0.3837504, 0, 0, 0, 1, 1,
-0.01971281, 0.1369143, 1.262459, 0, 0, 0, 1, 1,
-0.01649288, 0.2796017, -0.6652848, 0, 0, 0, 1, 1,
-0.01633442, 0.1913502, -0.8328408, 1, 1, 1, 1, 1,
-0.01569293, 0.5391293, -0.5725933, 1, 1, 1, 1, 1,
-0.01241268, 1.689731, -0.254741, 1, 1, 1, 1, 1,
-0.01130693, 2.180017, -1.488674, 1, 1, 1, 1, 1,
-0.009637899, -0.2002729, -2.251882, 1, 1, 1, 1, 1,
-0.008804746, -0.6007474, -4.059281, 1, 1, 1, 1, 1,
-0.008489448, 1.325465, 0.004799439, 1, 1, 1, 1, 1,
-0.004519681, 0.5828249, 0.8772915, 1, 1, 1, 1, 1,
-0.004418171, -0.5171851, -3.961172, 1, 1, 1, 1, 1,
-0.002596251, 1.747449, -1.722868, 1, 1, 1, 1, 1,
-0.002259799, -0.3231261, -2.19748, 1, 1, 1, 1, 1,
-0.0008681525, -0.1365934, -3.485486, 1, 1, 1, 1, 1,
0.001665918, -0.5121718, 2.439928, 1, 1, 1, 1, 1,
0.002595842, 0.3537762, -1.193909, 1, 1, 1, 1, 1,
0.006769127, 1.814896, 1.708369, 1, 1, 1, 1, 1,
0.01003137, 0.5326589, -1.203811, 0, 0, 1, 1, 1,
0.01572551, 0.5436168, -1.076005, 1, 0, 0, 1, 1,
0.01623878, -1.304899, 3.568048, 1, 0, 0, 1, 1,
0.01749549, -0.9560709, 3.773416, 1, 0, 0, 1, 1,
0.0176255, 1.51903, -0.5573106, 1, 0, 0, 1, 1,
0.01980557, 0.661334, 0.169037, 1, 0, 0, 1, 1,
0.02559333, 0.2805366, -0.9273293, 0, 0, 0, 1, 1,
0.02611825, 0.3089351, 0.2086664, 0, 0, 0, 1, 1,
0.02899276, 0.2609267, 0.7921301, 0, 0, 0, 1, 1,
0.03374084, 0.1914899, -0.3345308, 0, 0, 0, 1, 1,
0.03520526, 2.504558, 1.873612, 0, 0, 0, 1, 1,
0.03857644, -0.3394931, 5.283147, 0, 0, 0, 1, 1,
0.03996699, 1.420016, 0.6137245, 0, 0, 0, 1, 1,
0.04018633, 1.966774, 1.333721, 1, 1, 1, 1, 1,
0.04618976, -0.009132612, 0.7613392, 1, 1, 1, 1, 1,
0.04779832, -0.1025145, 2.850096, 1, 1, 1, 1, 1,
0.04830795, -0.3509933, 1.31319, 1, 1, 1, 1, 1,
0.04890196, -0.5090782, 4.207805, 1, 1, 1, 1, 1,
0.05137207, -0.93941, 4.685768, 1, 1, 1, 1, 1,
0.05216644, -0.2742693, 3.897526, 1, 1, 1, 1, 1,
0.05685254, -0.4438446, 5.217876, 1, 1, 1, 1, 1,
0.05728393, 1.089099, -2.186194, 1, 1, 1, 1, 1,
0.06013545, -0.5055932, 4.406192, 1, 1, 1, 1, 1,
0.0634089, 1.699838, -0.02305523, 1, 1, 1, 1, 1,
0.06485491, 0.1036443, 0.03087742, 1, 1, 1, 1, 1,
0.06640107, 1.474533, 0.08533572, 1, 1, 1, 1, 1,
0.06873466, 1.54384, -0.3318691, 1, 1, 1, 1, 1,
0.07131672, -0.5412012, 4.072014, 1, 1, 1, 1, 1,
0.07154105, 0.7975035, -0.9643004, 0, 0, 1, 1, 1,
0.0717897, -1.015838, 1.036922, 1, 0, 0, 1, 1,
0.072949, -1.203354, 3.475387, 1, 0, 0, 1, 1,
0.07400657, 0.5373988, 1.316398, 1, 0, 0, 1, 1,
0.07513841, -1.286797, 5.231004, 1, 0, 0, 1, 1,
0.07639076, -0.5834216, 2.412647, 1, 0, 0, 1, 1,
0.07754669, -0.2394306, 2.852517, 0, 0, 0, 1, 1,
0.07980888, -0.2950062, 3.036349, 0, 0, 0, 1, 1,
0.08185401, -0.8590033, 3.851951, 0, 0, 0, 1, 1,
0.08323195, 0.2112968, -0.8825276, 0, 0, 0, 1, 1,
0.08469938, -0.1091249, 2.789503, 0, 0, 0, 1, 1,
0.08617986, -1.196356, 0.2138754, 0, 0, 0, 1, 1,
0.08727225, -2.167602, 2.502223, 0, 0, 0, 1, 1,
0.09271967, -0.05534334, 2.461085, 1, 1, 1, 1, 1,
0.09913908, -0.6941026, 4.126458, 1, 1, 1, 1, 1,
0.1002939, 0.2473819, 1.462619, 1, 1, 1, 1, 1,
0.1018652, -1.263561, 2.147159, 1, 1, 1, 1, 1,
0.1040064, -0.4356467, 1.413158, 1, 1, 1, 1, 1,
0.1112463, -0.2559216, 3.225851, 1, 1, 1, 1, 1,
0.1121499, -1.84993, 2.384898, 1, 1, 1, 1, 1,
0.1122667, 1.07024, -0.6935209, 1, 1, 1, 1, 1,
0.1137482, 1.169814, 0.4552138, 1, 1, 1, 1, 1,
0.1143684, -0.001459516, 1.24978, 1, 1, 1, 1, 1,
0.119498, -1.96041, 3.78851, 1, 1, 1, 1, 1,
0.1252449, -0.8172559, 1.762518, 1, 1, 1, 1, 1,
0.1256148, -1.071878, 4.112642, 1, 1, 1, 1, 1,
0.1276256, 1.535153e-05, 1.331038, 1, 1, 1, 1, 1,
0.1286088, 1.286238, -1.092819, 1, 1, 1, 1, 1,
0.1350619, -2.106239, 3.382382, 0, 0, 1, 1, 1,
0.1353009, -0.1353101, 2.87025, 1, 0, 0, 1, 1,
0.1367077, 0.06294288, 1.46023, 1, 0, 0, 1, 1,
0.139569, -0.271896, 2.485986, 1, 0, 0, 1, 1,
0.1419612, 1.646656, -0.7820552, 1, 0, 0, 1, 1,
0.142882, -0.8816999, 2.833396, 1, 0, 0, 1, 1,
0.1437643, -0.417024, 1.607457, 0, 0, 0, 1, 1,
0.1441766, -1.030707, 2.304841, 0, 0, 0, 1, 1,
0.1467968, -1.121767, 1.323798, 0, 0, 0, 1, 1,
0.147038, 1.150128, 0.7081361, 0, 0, 0, 1, 1,
0.1498585, 0.8027954, -0.7018946, 0, 0, 0, 1, 1,
0.1502626, 0.1334601, -0.2837989, 0, 0, 0, 1, 1,
0.1533582, -1.732518, 3.309205, 0, 0, 0, 1, 1,
0.1538539, -0.2671839, 2.513125, 1, 1, 1, 1, 1,
0.1567533, -0.7155033, 3.749382, 1, 1, 1, 1, 1,
0.1574052, -0.7338951, 2.304303, 1, 1, 1, 1, 1,
0.1597712, 0.263091, 1.557998, 1, 1, 1, 1, 1,
0.1600394, -0.2083904, 1.749041, 1, 1, 1, 1, 1,
0.1653022, -0.6832095, 1.136976, 1, 1, 1, 1, 1,
0.1671057, -0.6474262, 2.759783, 1, 1, 1, 1, 1,
0.1677034, -0.9786339, 3.635467, 1, 1, 1, 1, 1,
0.170298, -0.2365627, 2.929423, 1, 1, 1, 1, 1,
0.1767787, 0.1644278, 1.062616, 1, 1, 1, 1, 1,
0.1804764, 0.7913036, -0.6134036, 1, 1, 1, 1, 1,
0.1838809, 0.8224541, -0.8777338, 1, 1, 1, 1, 1,
0.1844186, 0.0210353, 0.4384524, 1, 1, 1, 1, 1,
0.1848709, -0.1457627, 2.295188, 1, 1, 1, 1, 1,
0.1869863, -0.5995464, 3.340487, 1, 1, 1, 1, 1,
0.1936029, -0.3961139, 4.344097, 0, 0, 1, 1, 1,
0.1942204, 0.9517394, -0.1671665, 1, 0, 0, 1, 1,
0.1947743, 0.214768, -0.1845217, 1, 0, 0, 1, 1,
0.1951115, 0.7354048, -0.3348747, 1, 0, 0, 1, 1,
0.1991015, -0.3162241, 2.628126, 1, 0, 0, 1, 1,
0.2023871, -0.991143, 1.956699, 1, 0, 0, 1, 1,
0.2054161, -0.1817664, 0.5840356, 0, 0, 0, 1, 1,
0.2081761, 0.9390554, 0.7507809, 0, 0, 0, 1, 1,
0.2123664, -0.1115451, 1.987399, 0, 0, 0, 1, 1,
0.2141972, -0.3108618, 3.176179, 0, 0, 0, 1, 1,
0.2163398, 1.067804, -0.02355462, 0, 0, 0, 1, 1,
0.2188904, 0.4394425, 1.73043, 0, 0, 0, 1, 1,
0.2241656, -2.771072, 3.098241, 0, 0, 0, 1, 1,
0.2245011, -0.4257466, 2.410236, 1, 1, 1, 1, 1,
0.2253299, 0.2591911, 1.757235, 1, 1, 1, 1, 1,
0.2254672, -0.0008529795, 1.427008, 1, 1, 1, 1, 1,
0.2255726, 1.113227, 1.207071, 1, 1, 1, 1, 1,
0.2287097, 2.147784, 1.400016, 1, 1, 1, 1, 1,
0.2301723, -1.48856, 4.23443, 1, 1, 1, 1, 1,
0.2303627, -0.05472768, 3.331982, 1, 1, 1, 1, 1,
0.2346446, 1.205594, -0.2944149, 1, 1, 1, 1, 1,
0.2351455, 1.272886, 0.5689092, 1, 1, 1, 1, 1,
0.2386368, 1.349307, -1.501224, 1, 1, 1, 1, 1,
0.2390298, 1.51683, 0.4332069, 1, 1, 1, 1, 1,
0.2417359, 1.946334, -0.9118538, 1, 1, 1, 1, 1,
0.2453625, -2.974449, 2.89659, 1, 1, 1, 1, 1,
0.2477164, -0.3727168, 2.052731, 1, 1, 1, 1, 1,
0.2490111, 0.4518641, 2.657804, 1, 1, 1, 1, 1,
0.2492202, -1.552825, 3.299025, 0, 0, 1, 1, 1,
0.2501081, 0.133005, 1.00538, 1, 0, 0, 1, 1,
0.2523972, 0.271995, 2.361013, 1, 0, 0, 1, 1,
0.2540487, 0.3984896, 0.7132146, 1, 0, 0, 1, 1,
0.2560397, 0.9747846, 1.523564, 1, 0, 0, 1, 1,
0.2631279, -0.3435445, 3.515688, 1, 0, 0, 1, 1,
0.2632729, 0.7373897, 0.4759925, 0, 0, 0, 1, 1,
0.2694608, -1.676006, 2.477733, 0, 0, 0, 1, 1,
0.2721041, 1.417282, 0.3956899, 0, 0, 0, 1, 1,
0.2738226, -0.7772969, 2.170102, 0, 0, 0, 1, 1,
0.2752216, -0.4391653, 0.3616279, 0, 0, 0, 1, 1,
0.275978, 0.6197855, 0.01442893, 0, 0, 0, 1, 1,
0.2770733, -0.5341948, 4.617936, 0, 0, 0, 1, 1,
0.2823663, 0.9743868, -0.7479117, 1, 1, 1, 1, 1,
0.2847435, -1.487329, 3.956249, 1, 1, 1, 1, 1,
0.2864545, 2.136514, 0.4196012, 1, 1, 1, 1, 1,
0.2882317, 0.4249444, -0.07847403, 1, 1, 1, 1, 1,
0.2882473, 0.4443169, 0.4710157, 1, 1, 1, 1, 1,
0.2892696, -0.09585847, 2.283037, 1, 1, 1, 1, 1,
0.2927889, -0.2665795, 1.200786, 1, 1, 1, 1, 1,
0.2950443, -0.786005, 0.8463247, 1, 1, 1, 1, 1,
0.2958232, -0.2482561, 1.697358, 1, 1, 1, 1, 1,
0.2994012, -0.1997188, 3.115463, 1, 1, 1, 1, 1,
0.3096472, 0.8271983, 1.076774, 1, 1, 1, 1, 1,
0.3099304, 0.4777734, -0.08937466, 1, 1, 1, 1, 1,
0.3124307, 1.723296, 0.2983232, 1, 1, 1, 1, 1,
0.3136261, -0.6508449, 2.634293, 1, 1, 1, 1, 1,
0.3171428, -0.5088054, 2.171738, 1, 1, 1, 1, 1,
0.3185943, -0.8139939, 1.839104, 0, 0, 1, 1, 1,
0.3208817, -0.9489521, 3.589614, 1, 0, 0, 1, 1,
0.3225948, -1.412577, 4.395893, 1, 0, 0, 1, 1,
0.3257255, -1.021625, 3.447226, 1, 0, 0, 1, 1,
0.3274734, 0.4544666, -0.244896, 1, 0, 0, 1, 1,
0.3282958, 2.557683, 0.09830002, 1, 0, 0, 1, 1,
0.3365381, 0.5652526, 0.6534989, 0, 0, 0, 1, 1,
0.3374493, -1.358901, 2.21733, 0, 0, 0, 1, 1,
0.3405422, 0.01706995, 0.6830503, 0, 0, 0, 1, 1,
0.3462768, -0.2541192, 2.389754, 0, 0, 0, 1, 1,
0.3484602, 1.604729, 0.5458569, 0, 0, 0, 1, 1,
0.349887, -0.1492901, 2.194509, 0, 0, 0, 1, 1,
0.3503052, 0.7172101, 0.6454454, 0, 0, 0, 1, 1,
0.3542413, 0.7963285, 0.1704914, 1, 1, 1, 1, 1,
0.3588698, 0.1244715, 0.4733618, 1, 1, 1, 1, 1,
0.3601097, 0.08641078, 1.593173, 1, 1, 1, 1, 1,
0.3607046, 0.9424078, 0.5926309, 1, 1, 1, 1, 1,
0.3655646, 0.7628558, -0.2600548, 1, 1, 1, 1, 1,
0.3727287, 0.1591106, 1.919434, 1, 1, 1, 1, 1,
0.3730746, -0.9290544, 3.579975, 1, 1, 1, 1, 1,
0.3739456, 0.02206994, 2.109956, 1, 1, 1, 1, 1,
0.375609, -0.215426, 1.114067, 1, 1, 1, 1, 1,
0.3788115, 0.4046891, 0.3156056, 1, 1, 1, 1, 1,
0.3804155, -1.296292, 1.503707, 1, 1, 1, 1, 1,
0.3837895, -1.500884, 4.079362, 1, 1, 1, 1, 1,
0.385443, 0.5133163, 1.271159, 1, 1, 1, 1, 1,
0.3867055, -0.3968737, 2.139111, 1, 1, 1, 1, 1,
0.3933365, -0.6334549, 2.915375, 1, 1, 1, 1, 1,
0.3936033, -0.4053231, 2.179823, 0, 0, 1, 1, 1,
0.3959185, 0.5587797, 0.3339797, 1, 0, 0, 1, 1,
0.3981684, 1.629159, -2.180765, 1, 0, 0, 1, 1,
0.3999592, -0.01645304, 0.2210431, 1, 0, 0, 1, 1,
0.4010602, -2.547102, 2.997608, 1, 0, 0, 1, 1,
0.4098413, -0.7788002, 3.145795, 1, 0, 0, 1, 1,
0.4133577, -0.0003310789, 0.9404883, 0, 0, 0, 1, 1,
0.4143928, -1.709834, 2.992067, 0, 0, 0, 1, 1,
0.4184983, 1.029314, -0.2492964, 0, 0, 0, 1, 1,
0.4353337, 2.177228, 0.03655892, 0, 0, 0, 1, 1,
0.4388236, -1.266192, 1.501481, 0, 0, 0, 1, 1,
0.4412277, 1.568529, 0.4479716, 0, 0, 0, 1, 1,
0.4495162, -0.2309567, 1.226276, 0, 0, 0, 1, 1,
0.4498874, 0.5293585, -0.2981961, 1, 1, 1, 1, 1,
0.4509747, 1.068091, -0.5841855, 1, 1, 1, 1, 1,
0.4515951, 2.2645, 0.260827, 1, 1, 1, 1, 1,
0.4521633, 0.3227674, -1.230321, 1, 1, 1, 1, 1,
0.4536953, 0.6301454, 1.95424, 1, 1, 1, 1, 1,
0.4555134, 0.8866671, 0.7434626, 1, 1, 1, 1, 1,
0.462328, 0.1054552, 2.619127, 1, 1, 1, 1, 1,
0.4625154, 2.353316, 0.2278985, 1, 1, 1, 1, 1,
0.4715064, -0.8369834, 2.435269, 1, 1, 1, 1, 1,
0.4748817, -0.1429185, 3.545014, 1, 1, 1, 1, 1,
0.4792263, -0.01000249, 3.458751, 1, 1, 1, 1, 1,
0.4914495, -0.1579669, 2.327677, 1, 1, 1, 1, 1,
0.4931046, -0.224831, 1.640669, 1, 1, 1, 1, 1,
0.4949076, 0.8112844, 2.092489, 1, 1, 1, 1, 1,
0.4955376, -0.7885807, 3.068713, 1, 1, 1, 1, 1,
0.4973101, -0.08508089, 2.778407, 0, 0, 1, 1, 1,
0.4999718, -0.1345612, 2.839491, 1, 0, 0, 1, 1,
0.5010963, 1.464012, 1.586686, 1, 0, 0, 1, 1,
0.5021828, 0.2903774, -0.3758509, 1, 0, 0, 1, 1,
0.5025582, 0.1579676, 1.353689, 1, 0, 0, 1, 1,
0.5043964, 1.997412, 0.569847, 1, 0, 0, 1, 1,
0.5090297, 0.05118736, 1.800131, 0, 0, 0, 1, 1,
0.5108595, 0.2674901, 1.048051, 0, 0, 0, 1, 1,
0.5155072, 2.331801, 0.6479333, 0, 0, 0, 1, 1,
0.5217859, 0.6169571, 0.2151463, 0, 0, 0, 1, 1,
0.5263395, -0.366599, 3.141305, 0, 0, 0, 1, 1,
0.5284132, -0.2097476, 2.130407, 0, 0, 0, 1, 1,
0.5319108, -0.164415, 1.042005, 0, 0, 0, 1, 1,
0.5321392, -0.4900653, 2.270266, 1, 1, 1, 1, 1,
0.5322498, -0.8870759, 2.610812, 1, 1, 1, 1, 1,
0.5325833, -1.076885, 3.764993, 1, 1, 1, 1, 1,
0.5361575, -0.6717231, 2.177514, 1, 1, 1, 1, 1,
0.5418932, 0.1287191, 2.319028, 1, 1, 1, 1, 1,
0.5428208, 0.9808466, 0.7544886, 1, 1, 1, 1, 1,
0.5460676, 0.4971021, 0.8248591, 1, 1, 1, 1, 1,
0.5497241, 0.3040152, 1.700405, 1, 1, 1, 1, 1,
0.5542334, 0.1813376, 2.81387, 1, 1, 1, 1, 1,
0.5556903, -0.6612269, 2.383222, 1, 1, 1, 1, 1,
0.5572571, 1.450732, -0.8571735, 1, 1, 1, 1, 1,
0.5734638, -1.57885, 1.89014, 1, 1, 1, 1, 1,
0.5735616, -0.0473214, 1.235422, 1, 1, 1, 1, 1,
0.5825791, 2.146403, -0.7962832, 1, 1, 1, 1, 1,
0.5858375, -0.5684083, 2.17287, 1, 1, 1, 1, 1,
0.5918117, 0.9483334, 1.035174, 0, 0, 1, 1, 1,
0.5956542, 0.6608877, -0.1124792, 1, 0, 0, 1, 1,
0.5957175, -1.856218, 2.558979, 1, 0, 0, 1, 1,
0.5991074, -1.289016, 1.893918, 1, 0, 0, 1, 1,
0.5996124, -0.7373188, 2.592257, 1, 0, 0, 1, 1,
0.6013642, -1.525858, 1.909679, 1, 0, 0, 1, 1,
0.6025181, -0.08062303, 2.228084, 0, 0, 0, 1, 1,
0.6059608, -0.6688592, 3.294429, 0, 0, 0, 1, 1,
0.6111814, 0.39533, 1.805565, 0, 0, 0, 1, 1,
0.6138306, 0.1389091, 1.462739, 0, 0, 0, 1, 1,
0.6146486, 1.23506, -0.5000463, 0, 0, 0, 1, 1,
0.6158579, 0.7141806, 1.266821, 0, 0, 0, 1, 1,
0.6205598, -0.3954364, 0.8204734, 0, 0, 0, 1, 1,
0.6239145, -0.5428931, 1.827814, 1, 1, 1, 1, 1,
0.626818, 0.03546552, 2.311593, 1, 1, 1, 1, 1,
0.6269035, -0.1146434, 2.831046, 1, 1, 1, 1, 1,
0.6276718, -0.8063542, 3.444421, 1, 1, 1, 1, 1,
0.6342525, -1.376373, 3.29636, 1, 1, 1, 1, 1,
0.6453821, -0.4709389, -0.1433486, 1, 1, 1, 1, 1,
0.6474195, -0.6630568, 1.883107, 1, 1, 1, 1, 1,
0.6516424, 0.4226552, 2.68264, 1, 1, 1, 1, 1,
0.6518199, -0.1075663, 2.027627, 1, 1, 1, 1, 1,
0.6530159, -0.280837, 2.798865, 1, 1, 1, 1, 1,
0.6583489, 0.2389114, 1.644296, 1, 1, 1, 1, 1,
0.658577, -0.7086687, 2.918839, 1, 1, 1, 1, 1,
0.6648248, 0.9227417, -0.6536673, 1, 1, 1, 1, 1,
0.6671782, -2.505707, 1.53754, 1, 1, 1, 1, 1,
0.6677945, -0.3237314, 0.9563718, 1, 1, 1, 1, 1,
0.6683848, -1.332627, 2.538159, 0, 0, 1, 1, 1,
0.6733084, 0.3562326, 2.290172, 1, 0, 0, 1, 1,
0.6742584, 0.3312639, 0.2334415, 1, 0, 0, 1, 1,
0.6870561, -0.4294755, 3.230531, 1, 0, 0, 1, 1,
0.6872327, -1.490175, 1.590353, 1, 0, 0, 1, 1,
0.6935087, -0.509165, 2.354278, 1, 0, 0, 1, 1,
0.6943371, 0.8127367, 1.52349, 0, 0, 0, 1, 1,
0.6967365, -0.5945202, 3.226827, 0, 0, 0, 1, 1,
0.7005178, 0.3720485, 0.6720818, 0, 0, 0, 1, 1,
0.7041205, -0.09294148, -0.06687828, 0, 0, 0, 1, 1,
0.7043238, -0.652782, 3.451173, 0, 0, 0, 1, 1,
0.7071328, -0.3793969, -0.0271435, 0, 0, 0, 1, 1,
0.7109303, -1.383324, 1.533035, 0, 0, 0, 1, 1,
0.7118477, 1.01728, 0.3327042, 1, 1, 1, 1, 1,
0.7140068, 0.7851846, 0.7793605, 1, 1, 1, 1, 1,
0.7148111, 0.3143205, -0.521335, 1, 1, 1, 1, 1,
0.7209284, -0.3754987, 3.668072, 1, 1, 1, 1, 1,
0.7211492, -0.1432496, 2.729113, 1, 1, 1, 1, 1,
0.7492228, 1.093755, 0.355247, 1, 1, 1, 1, 1,
0.750113, -0.5465913, 2.355672, 1, 1, 1, 1, 1,
0.7534572, -0.7736962, 2.227714, 1, 1, 1, 1, 1,
0.753727, -0.599187, 2.532945, 1, 1, 1, 1, 1,
0.7628851, 0.03739388, 0.9732606, 1, 1, 1, 1, 1,
0.7642325, -0.08643857, 2.101484, 1, 1, 1, 1, 1,
0.7718579, 0.7303559, 2.214917, 1, 1, 1, 1, 1,
0.7785271, 0.3832385, 0.2169147, 1, 1, 1, 1, 1,
0.7806994, 1.186111, 1.626387, 1, 1, 1, 1, 1,
0.7807122, 0.2795304, 0.09043445, 1, 1, 1, 1, 1,
0.7820884, 0.8029366, 3.854402, 0, 0, 1, 1, 1,
0.7877467, -1.459207, 1.309244, 1, 0, 0, 1, 1,
0.7892628, -1.71818, 3.74466, 1, 0, 0, 1, 1,
0.7899302, 0.3399161, 2.2301, 1, 0, 0, 1, 1,
0.7921739, -0.8657197, 4.763404, 1, 0, 0, 1, 1,
0.7950243, 1.646423, 0.5661101, 1, 0, 0, 1, 1,
0.7950664, -0.2503769, 3.309582, 0, 0, 0, 1, 1,
0.795586, -0.3014458, 1.853677, 0, 0, 0, 1, 1,
0.800337, -0.2344585, 1.208321, 0, 0, 0, 1, 1,
0.8012506, 1.389866, -2.432258, 0, 0, 0, 1, 1,
0.8028007, -0.1837986, 2.209548, 0, 0, 0, 1, 1,
0.806556, 1.558895, -0.633461, 0, 0, 0, 1, 1,
0.8130861, 0.3304017, 2.282052, 0, 0, 0, 1, 1,
0.819972, 0.404716, 2.60789, 1, 1, 1, 1, 1,
0.8289326, 1.540024, 0.06726424, 1, 1, 1, 1, 1,
0.8291991, -0.08802275, 2.586018, 1, 1, 1, 1, 1,
0.8298279, 1.015399, 0.1627872, 1, 1, 1, 1, 1,
0.8453742, 0.8498317, 0.4259624, 1, 1, 1, 1, 1,
0.8456911, 0.09865241, 1.401074, 1, 1, 1, 1, 1,
0.8486907, 0.2771393, 0.3535842, 1, 1, 1, 1, 1,
0.8491772, 0.8693911, 0.04349398, 1, 1, 1, 1, 1,
0.8547035, -0.1458999, 3.271002, 1, 1, 1, 1, 1,
0.8559248, -2.727679, 3.339529, 1, 1, 1, 1, 1,
0.8572437, -1.377595, 1.979097, 1, 1, 1, 1, 1,
0.865262, -0.01061069, 0.4900327, 1, 1, 1, 1, 1,
0.8654076, -0.2162737, 1.633026, 1, 1, 1, 1, 1,
0.870706, 0.868765, 0.7106252, 1, 1, 1, 1, 1,
0.8806492, -0.6665797, 2.855625, 1, 1, 1, 1, 1,
0.8818945, -0.2173006, 2.256855, 0, 0, 1, 1, 1,
0.8831726, 2.259459, 1.114023, 1, 0, 0, 1, 1,
0.8860868, -1.686765, 2.054057, 1, 0, 0, 1, 1,
0.8881423, 0.6011432, 0.4185843, 1, 0, 0, 1, 1,
0.8974078, -0.4865439, 2.579735, 1, 0, 0, 1, 1,
0.897791, -0.9912981, 1.724341, 1, 0, 0, 1, 1,
0.8978308, -1.467964, 3.106709, 0, 0, 0, 1, 1,
0.899649, 1.812655, 0.0702542, 0, 0, 0, 1, 1,
0.9050174, 1.26141, 0.8857942, 0, 0, 0, 1, 1,
0.9093306, 0.1971364, 1.554732, 0, 0, 0, 1, 1,
0.9163986, -0.5770558, 2.345535, 0, 0, 0, 1, 1,
0.9178319, -0.9939778, 1.525042, 0, 0, 0, 1, 1,
0.9225483, -1.212184, 0.5258187, 0, 0, 0, 1, 1,
0.9294835, 0.3107862, 2.536818, 1, 1, 1, 1, 1,
0.9328453, 0.03837949, 1.316311, 1, 1, 1, 1, 1,
0.9380586, 0.262789, 1.642569, 1, 1, 1, 1, 1,
0.938941, -0.5035856, 0.788871, 1, 1, 1, 1, 1,
0.9445528, 1.023797, -0.6613687, 1, 1, 1, 1, 1,
0.9448529, -0.06210188, 2.21516, 1, 1, 1, 1, 1,
0.9495205, -1.417892, 3.491723, 1, 1, 1, 1, 1,
0.9531555, -0.8419437, 1.958061, 1, 1, 1, 1, 1,
0.9585348, 0.5550067, 0.9193361, 1, 1, 1, 1, 1,
0.9599533, -0.6764338, 3.291537, 1, 1, 1, 1, 1,
0.963969, 1.019311, 2.341836, 1, 1, 1, 1, 1,
0.9642161, -0.2370081, 3.069442, 1, 1, 1, 1, 1,
0.9674405, 0.4380684, 1.691655, 1, 1, 1, 1, 1,
0.9725073, 1.064156, 1.585955, 1, 1, 1, 1, 1,
0.9790275, -0.7799146, 2.70344, 1, 1, 1, 1, 1,
0.9814749, -0.01175969, 1.690794, 0, 0, 1, 1, 1,
0.9820274, 0.03509924, 1.079203, 1, 0, 0, 1, 1,
0.984888, 0.268022, 1.526049, 1, 0, 0, 1, 1,
0.985724, -0.7811451, 1.974374, 1, 0, 0, 1, 1,
0.9892848, 1.982295, 0.6566831, 1, 0, 0, 1, 1,
0.9960956, 1.972421, -0.4366507, 1, 0, 0, 1, 1,
1.004443, -0.7360017, 1.3624, 0, 0, 0, 1, 1,
1.004725, 1.932937, -1.407334, 0, 0, 0, 1, 1,
1.006218, 1.488261, 3.265158, 0, 0, 0, 1, 1,
1.009652, 0.5844806, 1.779819, 0, 0, 0, 1, 1,
1.013823, -0.3566612, 2.794444, 0, 0, 0, 1, 1,
1.014346, 0.7424378, -0.2520009, 0, 0, 0, 1, 1,
1.01438, -0.426163, 1.603224, 0, 0, 0, 1, 1,
1.01722, 1.999759, 1.215956, 1, 1, 1, 1, 1,
1.018673, 0.5904199, 2.421069, 1, 1, 1, 1, 1,
1.019258, -0.0008975544, 1.786899, 1, 1, 1, 1, 1,
1.020936, -0.4771693, 2.851727, 1, 1, 1, 1, 1,
1.020941, -0.05832785, 1.698077, 1, 1, 1, 1, 1,
1.021105, 1.648157, -1.792405, 1, 1, 1, 1, 1,
1.022383, 0.5492148, -0.147385, 1, 1, 1, 1, 1,
1.030898, -0.04253733, 1.067276, 1, 1, 1, 1, 1,
1.036699, 0.6333548, 1.418597, 1, 1, 1, 1, 1,
1.038302, -0.8228616, 2.805069, 1, 1, 1, 1, 1,
1.03965, -0.7768071, 2.869766, 1, 1, 1, 1, 1,
1.044163, 0.2664077, 1.839985, 1, 1, 1, 1, 1,
1.047648, 0.5926084, 1.903162, 1, 1, 1, 1, 1,
1.049443, 0.9194747, 2.065825, 1, 1, 1, 1, 1,
1.067719, -0.3190653, 2.603621, 1, 1, 1, 1, 1,
1.084574, -0.4210082, 0.06599193, 0, 0, 1, 1, 1,
1.094052, -1.771361, 3.55144, 1, 0, 0, 1, 1,
1.096643, 0.08086327, 1.561051, 1, 0, 0, 1, 1,
1.100914, 0.1768288, -0.2881585, 1, 0, 0, 1, 1,
1.102286, 0.7240059, 2.51524, 1, 0, 0, 1, 1,
1.103696, -1.193103, 3.585406, 1, 0, 0, 1, 1,
1.106506, -1.000469, 0.8924602, 0, 0, 0, 1, 1,
1.11079, -1.406752, 1.831656, 0, 0, 0, 1, 1,
1.115484, 1.088808, 1.731571, 0, 0, 0, 1, 1,
1.118044, 0.9634224, 1.618632, 0, 0, 0, 1, 1,
1.119168, -0.886329, 2.404925, 0, 0, 0, 1, 1,
1.125675, -0.004649878, 2.234329, 0, 0, 0, 1, 1,
1.136146, 1.880462, 0.2562402, 0, 0, 0, 1, 1,
1.137001, -0.7375296, 2.079544, 1, 1, 1, 1, 1,
1.140512, -0.7579329, 2.884745, 1, 1, 1, 1, 1,
1.14161, -0.4407371, 2.277397, 1, 1, 1, 1, 1,
1.142759, 1.413193, 0.9442502, 1, 1, 1, 1, 1,
1.143121, -0.1539627, 1.356078, 1, 1, 1, 1, 1,
1.16779, 0.3644636, 1.417301, 1, 1, 1, 1, 1,
1.170904, 0.3661021, 0.7540044, 1, 1, 1, 1, 1,
1.171949, -1.132746, 2.46719, 1, 1, 1, 1, 1,
1.176622, 0.199311, 0.01844151, 1, 1, 1, 1, 1,
1.194195, 0.1868657, 1.397018, 1, 1, 1, 1, 1,
1.196116, -0.5570724, 1.531345, 1, 1, 1, 1, 1,
1.197104, 0.5262803, -1.574526, 1, 1, 1, 1, 1,
1.198796, -0.1447704, 2.069907, 1, 1, 1, 1, 1,
1.217727, 0.4596842, 1.884499, 1, 1, 1, 1, 1,
1.227455, 1.899058, 0.485503, 1, 1, 1, 1, 1,
1.233238, -0.6860198, 1.827948, 0, 0, 1, 1, 1,
1.241486, 0.7896105, 0.6813334, 1, 0, 0, 1, 1,
1.242451, 3.095039, 0.5457362, 1, 0, 0, 1, 1,
1.248646, 0.09653662, 1.79063, 1, 0, 0, 1, 1,
1.251793, -1.106162, 1.902202, 1, 0, 0, 1, 1,
1.256041, 1.078476, 2.003623, 1, 0, 0, 1, 1,
1.256946, 0.6890829, 2.812702, 0, 0, 0, 1, 1,
1.262757, 1.117385, 0.8109573, 0, 0, 0, 1, 1,
1.267832, 0.3444185, 0.1699116, 0, 0, 0, 1, 1,
1.272169, 1.208504, 0.06403796, 0, 0, 0, 1, 1,
1.272572, -0.5253832, 1.391995, 0, 0, 0, 1, 1,
1.285263, -0.5703692, 2.741883, 0, 0, 0, 1, 1,
1.288546, -1.068167, 1.87172, 0, 0, 0, 1, 1,
1.288566, 0.5093703, 2.618376, 1, 1, 1, 1, 1,
1.293542, -0.7292277, 1.681725, 1, 1, 1, 1, 1,
1.306473, 1.488434, -0.7984993, 1, 1, 1, 1, 1,
1.341186, -1.227436, 1.916414, 1, 1, 1, 1, 1,
1.347894, 0.7711682, 0.2560182, 1, 1, 1, 1, 1,
1.358794, 1.208135, 0.04483891, 1, 1, 1, 1, 1,
1.3611, 0.8511282, 0.3628016, 1, 1, 1, 1, 1,
1.375748, -0.8537431, 2.482461, 1, 1, 1, 1, 1,
1.388692, 1.429257, 0.3224162, 1, 1, 1, 1, 1,
1.393283, -0.657438, 1.229072, 1, 1, 1, 1, 1,
1.396866, 0.9010142, 2.604238, 1, 1, 1, 1, 1,
1.401069, 1.382818, 0.9792086, 1, 1, 1, 1, 1,
1.407713, 0.4621756, 2.037679, 1, 1, 1, 1, 1,
1.40845, 0.6518848, 4.073827, 1, 1, 1, 1, 1,
1.427383, -0.9376873, 2.565898, 1, 1, 1, 1, 1,
1.434898, 1.80391, 0.1719227, 0, 0, 1, 1, 1,
1.438594, -0.1248732, -0.1206215, 1, 0, 0, 1, 1,
1.445269, 1.801047, 2.31876, 1, 0, 0, 1, 1,
1.450835, -0.2056469, 1.489092, 1, 0, 0, 1, 1,
1.452024, 1.601399, 2.028341, 1, 0, 0, 1, 1,
1.453475, -0.2267233, 2.86652, 1, 0, 0, 1, 1,
1.474981, -0.4624685, 1.130361, 0, 0, 0, 1, 1,
1.513087, 0.03509529, -0.1488333, 0, 0, 0, 1, 1,
1.513582, 1.431768, 1.853238, 0, 0, 0, 1, 1,
1.532354, 1.118773, 0.3245598, 0, 0, 0, 1, 1,
1.550113, -1.876117, 0.7517686, 0, 0, 0, 1, 1,
1.551581, -2.493583, 2.601024, 0, 0, 0, 1, 1,
1.563173, 1.94523, 1.35622, 0, 0, 0, 1, 1,
1.569228, -0.9870348, 1.010795, 1, 1, 1, 1, 1,
1.584224, 0.5746493, 2.711869, 1, 1, 1, 1, 1,
1.585568, 0.1821825, 0.1681354, 1, 1, 1, 1, 1,
1.586278, -0.8138434, 2.590258, 1, 1, 1, 1, 1,
1.586418, 0.6954665, 0.2825316, 1, 1, 1, 1, 1,
1.588026, -2.385147, 4.704083, 1, 1, 1, 1, 1,
1.59885, -0.06167482, 1.304609, 1, 1, 1, 1, 1,
1.599696, 0.3361084, 2.39671, 1, 1, 1, 1, 1,
1.602884, -1.892911, 3.131583, 1, 1, 1, 1, 1,
1.615606, -0.7656162, 0.4925542, 1, 1, 1, 1, 1,
1.622362, 0.2347591, -0.9218222, 1, 1, 1, 1, 1,
1.622688, -0.971624, 3.018038, 1, 1, 1, 1, 1,
1.651944, 0.2654718, 1.158691, 1, 1, 1, 1, 1,
1.665765, -0.5781797, 2.75404, 1, 1, 1, 1, 1,
1.669405, -0.4680936, 2.415312, 1, 1, 1, 1, 1,
1.674327, -1.152263, 1.731761, 0, 0, 1, 1, 1,
1.683851, -0.7199498, 2.89091, 1, 0, 0, 1, 1,
1.69244, -0.7516398, 3.210232, 1, 0, 0, 1, 1,
1.696103, -0.2570279, 0.8710335, 1, 0, 0, 1, 1,
1.699046, 1.160109, 0.9558508, 1, 0, 0, 1, 1,
1.700199, 0.3269675, -0.2509161, 1, 0, 0, 1, 1,
1.720968, -0.3975255, 1.69089, 0, 0, 0, 1, 1,
1.721383, -0.4096158, 1.249434, 0, 0, 0, 1, 1,
1.756235, -0.2535505, 3.119021, 0, 0, 0, 1, 1,
1.767337, -0.8512846, 1.900807, 0, 0, 0, 1, 1,
1.776392, 0.5852674, 1.713212, 0, 0, 0, 1, 1,
1.80839, -0.05686657, 1.819365, 0, 0, 0, 1, 1,
1.847185, 1.66704, 1.576092, 0, 0, 0, 1, 1,
1.868744, -1.190001, 1.712821, 1, 1, 1, 1, 1,
1.875432, -0.3386897, 3.000602, 1, 1, 1, 1, 1,
1.887535, -0.8070721, 2.41032, 1, 1, 1, 1, 1,
1.8993, 1.950119, 1.049981, 1, 1, 1, 1, 1,
1.899906, 0.2120077, 1.812867, 1, 1, 1, 1, 1,
1.919535, -0.8424103, 0.7386005, 1, 1, 1, 1, 1,
1.925237, -1.633062, 2.913301, 1, 1, 1, 1, 1,
1.926306, 1.098304, 2.594011, 1, 1, 1, 1, 1,
1.932953, -1.653268, 1.755076, 1, 1, 1, 1, 1,
1.991634, 0.5825261, 1.480514, 1, 1, 1, 1, 1,
2.007992, -1.156798, 2.994961, 1, 1, 1, 1, 1,
2.00964, -0.5822977, 3.506237, 1, 1, 1, 1, 1,
2.042235, 0.1322352, 3.396017, 1, 1, 1, 1, 1,
2.0434, 0.2149111, 1.882307, 1, 1, 1, 1, 1,
2.057658, 0.1113358, 0.8305361, 1, 1, 1, 1, 1,
2.071217, 1.100164, 1.889009, 0, 0, 1, 1, 1,
2.083843, 0.2321551, 2.81356, 1, 0, 0, 1, 1,
2.09304, -1.141639, 1.054646, 1, 0, 0, 1, 1,
2.178805, 1.881445, -0.6233545, 1, 0, 0, 1, 1,
2.184658, -0.4629661, 1.741423, 1, 0, 0, 1, 1,
2.187816, -0.1437089, 2.162372, 1, 0, 0, 1, 1,
2.193331, -0.2233261, 1.209187, 0, 0, 0, 1, 1,
2.196369, 0.09218506, 1.485526, 0, 0, 0, 1, 1,
2.207991, 1.549265, -2.855837, 0, 0, 0, 1, 1,
2.246807, 1.431957, 2.095698, 0, 0, 0, 1, 1,
2.294356, -0.2668364, 2.485228, 0, 0, 0, 1, 1,
2.320562, -0.7045425, -0.5415884, 0, 0, 0, 1, 1,
2.322817, -0.1216012, 2.660531, 0, 0, 0, 1, 1,
2.346379, -0.3036458, 0.1591096, 1, 1, 1, 1, 1,
2.445471, -0.03381013, 0.3101309, 1, 1, 1, 1, 1,
2.53294, 0.1639195, 2.535756, 1, 1, 1, 1, 1,
2.701698, -0.6172903, 1.835448, 1, 1, 1, 1, 1,
2.729093, 0.3627975, 1.325393, 1, 1, 1, 1, 1,
3.011569, -0.2784134, 1.975367, 1, 1, 1, 1, 1,
3.220257, -0.7523874, 2.065253, 1, 1, 1, 1, 1
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
var radius = 9.920621;
var distance = 34.84576;
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
mvMatrix.translate( -0.1216116, 0.108283, 0.5630915 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.84576);
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
