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
-2.939888, -1.976208, -0.7340468, 1, 0, 0, 1,
-2.663967, 2.677542, -2.080444, 1, 0.007843138, 0, 1,
-2.507252, 0.4554126, -1.476524, 1, 0.01176471, 0, 1,
-2.403767, -1.935016, -3.527151, 1, 0.01960784, 0, 1,
-2.323245, -0.1605805, 0.4225456, 1, 0.02352941, 0, 1,
-2.310921, -0.6759498, -1.873691, 1, 0.03137255, 0, 1,
-2.200352, -1.012244, -0.9288856, 1, 0.03529412, 0, 1,
-2.192049, -0.6424289, -2.329796, 1, 0.04313726, 0, 1,
-2.17609, -1.180789, -1.427037, 1, 0.04705882, 0, 1,
-2.145667, 0.7858426, -0.8026284, 1, 0.05490196, 0, 1,
-2.13399, -0.636777, -1.910241, 1, 0.05882353, 0, 1,
-2.132487, -0.2863399, -0.8795589, 1, 0.06666667, 0, 1,
-2.104442, 0.8072337, -3.094427, 1, 0.07058824, 0, 1,
-2.067054, 0.3934646, -0.07389344, 1, 0.07843138, 0, 1,
-2.060094, -0.2348979, -4.275205, 1, 0.08235294, 0, 1,
-2.044613, 1.578036, -1.457467, 1, 0.09019608, 0, 1,
-2.021588, 0.5309479, 0.6088595, 1, 0.09411765, 0, 1,
-2.011393, -0.261842, -0.8654562, 1, 0.1019608, 0, 1,
-1.993464, 0.5871969, -1.238973, 1, 0.1098039, 0, 1,
-1.964993, 1.376951, 1.328358, 1, 0.1137255, 0, 1,
-1.913609, 0.7750741, -2.684731, 1, 0.1215686, 0, 1,
-1.90849, 0.3620202, -1.829575, 1, 0.1254902, 0, 1,
-1.907967, -1.009137, -2.382395, 1, 0.1333333, 0, 1,
-1.885471, -0.7328478, -0.1920155, 1, 0.1372549, 0, 1,
-1.879906, 0.115382, -2.454775, 1, 0.145098, 0, 1,
-1.863168, -0.5077454, -1.662052, 1, 0.1490196, 0, 1,
-1.840356, -1.392073, -1.54202, 1, 0.1568628, 0, 1,
-1.834155, -1.62576, -1.236536, 1, 0.1607843, 0, 1,
-1.815495, 0.3900356, -1.385087, 1, 0.1686275, 0, 1,
-1.815355, 1.359561, 0.007850083, 1, 0.172549, 0, 1,
-1.772967, -0.07375226, -0.2929954, 1, 0.1803922, 0, 1,
-1.755723, -1.88169, -1.805446, 1, 0.1843137, 0, 1,
-1.746382, -0.6265156, -0.7434217, 1, 0.1921569, 0, 1,
-1.73526, 1.035367, -0.932198, 1, 0.1960784, 0, 1,
-1.720464, -2.815467, -2.373301, 1, 0.2039216, 0, 1,
-1.712869, 0.599259, -1.78005, 1, 0.2117647, 0, 1,
-1.701831, 0.2126353, -3.49787, 1, 0.2156863, 0, 1,
-1.700029, 0.07993913, -0.6836185, 1, 0.2235294, 0, 1,
-1.685317, 0.2992338, -0.7056144, 1, 0.227451, 0, 1,
-1.679564, -0.03480807, -1.208466, 1, 0.2352941, 0, 1,
-1.668502, -3.064856, -4.111175, 1, 0.2392157, 0, 1,
-1.664112, -0.1232954, -3.169716, 1, 0.2470588, 0, 1,
-1.631998, 0.3553852, -1.526687, 1, 0.2509804, 0, 1,
-1.614109, 1.057452, -0.6908662, 1, 0.2588235, 0, 1,
-1.612095, -1.558224, -2.793947, 1, 0.2627451, 0, 1,
-1.567724, -0.3193645, -1.272412, 1, 0.2705882, 0, 1,
-1.562801, -0.7946252, -0.183578, 1, 0.2745098, 0, 1,
-1.557989, -0.3121586, -1.212385, 1, 0.282353, 0, 1,
-1.549969, -1.67144, -3.476735, 1, 0.2862745, 0, 1,
-1.522247, 2.414028, -0.0703572, 1, 0.2941177, 0, 1,
-1.522037, 0.7856902, -1.604421, 1, 0.3019608, 0, 1,
-1.506044, 1.982429, -1.02626, 1, 0.3058824, 0, 1,
-1.480282, 1.440503, -0.8260186, 1, 0.3137255, 0, 1,
-1.467227, 0.5731167, -1.788549, 1, 0.3176471, 0, 1,
-1.464122, -1.05876, 0.5153782, 1, 0.3254902, 0, 1,
-1.461676, 1.430161, 1.228181, 1, 0.3294118, 0, 1,
-1.459916, 0.03406088, -1.054565, 1, 0.3372549, 0, 1,
-1.456024, -1.051265, -1.71306, 1, 0.3411765, 0, 1,
-1.447672, -0.3124694, -1.604901, 1, 0.3490196, 0, 1,
-1.444428, 0.5766742, -1.779768, 1, 0.3529412, 0, 1,
-1.439827, 1.023393, -0.4084295, 1, 0.3607843, 0, 1,
-1.437214, 0.7307484, 0.497319, 1, 0.3647059, 0, 1,
-1.436804, -0.5894389, -2.656714, 1, 0.372549, 0, 1,
-1.421421, 0.1597647, -1.152092, 1, 0.3764706, 0, 1,
-1.420105, -1.838598, -2.666231, 1, 0.3843137, 0, 1,
-1.417429, 1.231617, 0.8569674, 1, 0.3882353, 0, 1,
-1.414126, -0.2078029, -0.7053372, 1, 0.3960784, 0, 1,
-1.408495, -0.8651809, -3.027319, 1, 0.4039216, 0, 1,
-1.395708, 0.8084864, 0.5725231, 1, 0.4078431, 0, 1,
-1.391101, -1.624008, -1.550388, 1, 0.4156863, 0, 1,
-1.388749, -1.154858, -2.026345, 1, 0.4196078, 0, 1,
-1.372249, -0.9437537, -0.8555791, 1, 0.427451, 0, 1,
-1.371697, 0.8265904, -1.908701, 1, 0.4313726, 0, 1,
-1.357466, 0.5905042, -1.64548, 1, 0.4392157, 0, 1,
-1.350486, 1.451491, -0.1143182, 1, 0.4431373, 0, 1,
-1.349253, -2.165961, -1.250526, 1, 0.4509804, 0, 1,
-1.318251, -0.5118008, -1.135232, 1, 0.454902, 0, 1,
-1.317959, 0.4111971, -0.6652114, 1, 0.4627451, 0, 1,
-1.294901, 1.516569, -2.191829, 1, 0.4666667, 0, 1,
-1.282543, 0.6844602, -0.2550889, 1, 0.4745098, 0, 1,
-1.282128, -0.1395534, -1.366603, 1, 0.4784314, 0, 1,
-1.280645, -1.493121, -2.549956, 1, 0.4862745, 0, 1,
-1.279256, -0.1099648, -0.8843097, 1, 0.4901961, 0, 1,
-1.273516, 0.9478418, -0.1655207, 1, 0.4980392, 0, 1,
-1.269377, -0.1209674, -2.81835, 1, 0.5058824, 0, 1,
-1.265808, -0.5070525, -1.247818, 1, 0.509804, 0, 1,
-1.265229, 0.02007124, -1.409994, 1, 0.5176471, 0, 1,
-1.251746, -0.5092992, -2.491604, 1, 0.5215687, 0, 1,
-1.247393, 0.3895739, -3.572178, 1, 0.5294118, 0, 1,
-1.239542, 1.555646, -1.61183, 1, 0.5333334, 0, 1,
-1.235469, -1.852781, -3.612128, 1, 0.5411765, 0, 1,
-1.233738, 0.08067488, -2.133938, 1, 0.5450981, 0, 1,
-1.231519, 1.447736, -0.3627029, 1, 0.5529412, 0, 1,
-1.231161, 0.3313044, -2.266341, 1, 0.5568628, 0, 1,
-1.227889, -0.4268866, -2.40599, 1, 0.5647059, 0, 1,
-1.22069, -0.4522111, -1.238014, 1, 0.5686275, 0, 1,
-1.216706, -0.4801995, -3.239209, 1, 0.5764706, 0, 1,
-1.21395, 1.121578, -0.04330643, 1, 0.5803922, 0, 1,
-1.210251, 1.120683, -1.701392, 1, 0.5882353, 0, 1,
-1.204113, -0.342926, -0.3301382, 1, 0.5921569, 0, 1,
-1.202211, 0.3767616, -2.304246, 1, 0.6, 0, 1,
-1.200158, -0.123114, -2.555761, 1, 0.6078432, 0, 1,
-1.198992, 0.797681, 0.2673503, 1, 0.6117647, 0, 1,
-1.192637, 0.05624594, -0.4730818, 1, 0.6196079, 0, 1,
-1.188973, -0.2406546, -1.738514, 1, 0.6235294, 0, 1,
-1.183678, -0.835898, -2.264651, 1, 0.6313726, 0, 1,
-1.17014, -2.037601, -3.678308, 1, 0.6352941, 0, 1,
-1.164047, -0.971814, -2.802747, 1, 0.6431373, 0, 1,
-1.149864, -2.001129, -1.491818, 1, 0.6470588, 0, 1,
-1.141365, 0.5419536, -2.586484, 1, 0.654902, 0, 1,
-1.1294, 0.142973, -1.883086, 1, 0.6588235, 0, 1,
-1.12907, 2.009077, -2.675799, 1, 0.6666667, 0, 1,
-1.128381, -0.04956957, -1.765468, 1, 0.6705883, 0, 1,
-1.127561, 0.8571233, -1.676654, 1, 0.6784314, 0, 1,
-1.125705, 0.4033149, 0.8733023, 1, 0.682353, 0, 1,
-1.116575, -0.5561563, -3.35022, 1, 0.6901961, 0, 1,
-1.114817, 1.377183, -1.094054, 1, 0.6941177, 0, 1,
-1.108637, 0.2382703, -1.070294, 1, 0.7019608, 0, 1,
-1.10816, 1.020082, -0.5081881, 1, 0.7098039, 0, 1,
-1.093453, 1.378817, -0.2253805, 1, 0.7137255, 0, 1,
-1.091684, -0.3330138, -2.977382, 1, 0.7215686, 0, 1,
-1.089221, -1.894595, -1.694143, 1, 0.7254902, 0, 1,
-1.086018, 0.3965783, -1.608555, 1, 0.7333333, 0, 1,
-1.085662, -0.8197511, -2.891557, 1, 0.7372549, 0, 1,
-1.078716, 1.110137, -1.134053, 1, 0.7450981, 0, 1,
-1.078156, 0.7458986, -1.041366, 1, 0.7490196, 0, 1,
-1.074949, -1.570851, -2.911769, 1, 0.7568628, 0, 1,
-1.072331, 0.4941701, -0.4790832, 1, 0.7607843, 0, 1,
-1.072038, 1.36991, 0.3898933, 1, 0.7686275, 0, 1,
-1.071833, -1.641381, -1.839329, 1, 0.772549, 0, 1,
-1.070032, -0.05353898, -0.8100877, 1, 0.7803922, 0, 1,
-1.069694, -1.037379, -2.929349, 1, 0.7843137, 0, 1,
-1.069462, 0.1390445, -1.069276, 1, 0.7921569, 0, 1,
-1.060435, 0.6454124, 0.7980437, 1, 0.7960784, 0, 1,
-1.060254, -0.1102935, -2.574992, 1, 0.8039216, 0, 1,
-1.057471, 0.589357, -1.575191, 1, 0.8117647, 0, 1,
-1.056328, 0.1994618, -2.347994, 1, 0.8156863, 0, 1,
-1.04981, 0.2541146, -2.278447, 1, 0.8235294, 0, 1,
-1.041411, 0.4848039, -1.208989, 1, 0.827451, 0, 1,
-0.9972835, 1.220633, -2.680513, 1, 0.8352941, 0, 1,
-0.9954923, 1.139792, 0.542069, 1, 0.8392157, 0, 1,
-0.9954297, -1.197752, -1.063236, 1, 0.8470588, 0, 1,
-0.9951035, -1.049936, -2.11377, 1, 0.8509804, 0, 1,
-0.9913763, -0.06069982, -2.478564, 1, 0.8588235, 0, 1,
-0.9833229, 1.749719, -1.593388, 1, 0.8627451, 0, 1,
-0.9791867, 0.4127191, -0.2927969, 1, 0.8705882, 0, 1,
-0.9763965, -0.8264916, -1.956242, 1, 0.8745098, 0, 1,
-0.9730492, -0.09108453, -2.294915, 1, 0.8823529, 0, 1,
-0.9614475, -0.6357222, -2.480638, 1, 0.8862745, 0, 1,
-0.9579865, -0.7283146, -2.474453, 1, 0.8941177, 0, 1,
-0.9541205, -0.07922115, -1.484782, 1, 0.8980392, 0, 1,
-0.9523129, 0.4445407, -0.5907003, 1, 0.9058824, 0, 1,
-0.950331, -0.7538112, -3.022973, 1, 0.9137255, 0, 1,
-0.9441059, -1.672271, -3.816911, 1, 0.9176471, 0, 1,
-0.9423447, 0.5744835, -0.7578969, 1, 0.9254902, 0, 1,
-0.9372445, -0.4760956, -1.528315, 1, 0.9294118, 0, 1,
-0.9360522, -0.5828468, -2.285293, 1, 0.9372549, 0, 1,
-0.9313449, -0.5332837, -2.143111, 1, 0.9411765, 0, 1,
-0.927415, 0.233069, -0.9763469, 1, 0.9490196, 0, 1,
-0.9270865, -1.313141, -1.2164, 1, 0.9529412, 0, 1,
-0.9238563, -1.734867, -2.648186, 1, 0.9607843, 0, 1,
-0.9118735, 1.721899, 0.2938993, 1, 0.9647059, 0, 1,
-0.9069242, 0.9896134, -1.025025, 1, 0.972549, 0, 1,
-0.9036482, -1.908728, -3.994722, 1, 0.9764706, 0, 1,
-0.9029522, 0.5241648, -2.098039, 1, 0.9843137, 0, 1,
-0.9017422, 0.6361641, -1.611644, 1, 0.9882353, 0, 1,
-0.8987964, 0.9021499, 0.1034583, 1, 0.9960784, 0, 1,
-0.8946229, 0.09589295, -0.6088746, 0.9960784, 1, 0, 1,
-0.8890501, -1.003943, -1.192819, 0.9921569, 1, 0, 1,
-0.8876742, 0.1338461, -0.2805344, 0.9843137, 1, 0, 1,
-0.8847582, -0.9150423, -1.914708, 0.9803922, 1, 0, 1,
-0.874415, 1.497313, -0.875178, 0.972549, 1, 0, 1,
-0.8720859, -1.796245, -2.117281, 0.9686275, 1, 0, 1,
-0.8700187, 0.1879482, -2.248413, 0.9607843, 1, 0, 1,
-0.8684083, -0.9398408, -2.733445, 0.9568627, 1, 0, 1,
-0.8646716, 0.07312475, -1.078074, 0.9490196, 1, 0, 1,
-0.8629986, -0.7774645, -3.246622, 0.945098, 1, 0, 1,
-0.8589318, -0.07207683, -0.1231616, 0.9372549, 1, 0, 1,
-0.8577998, -0.6417506, -3.017548, 0.9333333, 1, 0, 1,
-0.8563402, 0.2254818, 0.4480759, 0.9254902, 1, 0, 1,
-0.8449568, 0.9315144, 0.5878187, 0.9215686, 1, 0, 1,
-0.836817, 2.328289, 1.090708, 0.9137255, 1, 0, 1,
-0.8360718, 3.110213, -0.6695025, 0.9098039, 1, 0, 1,
-0.8255256, -0.2092814, -1.254397, 0.9019608, 1, 0, 1,
-0.8170207, -0.8351285, -1.088488, 0.8941177, 1, 0, 1,
-0.812136, -0.5234814, -1.060019, 0.8901961, 1, 0, 1,
-0.810563, 0.2501267, -2.490455, 0.8823529, 1, 0, 1,
-0.8086243, -0.5715153, -2.554223, 0.8784314, 1, 0, 1,
-0.8003229, -1.193498, -1.559618, 0.8705882, 1, 0, 1,
-0.7976831, -0.6332499, -2.410174, 0.8666667, 1, 0, 1,
-0.7925451, 0.6300844, -1.149053, 0.8588235, 1, 0, 1,
-0.7877657, -2.765012, -3.221783, 0.854902, 1, 0, 1,
-0.7873498, -0.2777207, -1.461567, 0.8470588, 1, 0, 1,
-0.7821289, 1.346319, -0.09663463, 0.8431373, 1, 0, 1,
-0.7764241, 1.038843, -0.9807383, 0.8352941, 1, 0, 1,
-0.7736748, -1.421748, -2.178905, 0.8313726, 1, 0, 1,
-0.7698071, 0.9737428, 0.4899969, 0.8235294, 1, 0, 1,
-0.7689729, 0.3613802, -3.102824, 0.8196079, 1, 0, 1,
-0.7620416, -1.018615, -2.409311, 0.8117647, 1, 0, 1,
-0.7536576, -0.7354195, -3.582181, 0.8078431, 1, 0, 1,
-0.7389004, -0.485152, -3.277592, 0.8, 1, 0, 1,
-0.7356495, 0.4767691, 0.03743371, 0.7921569, 1, 0, 1,
-0.7227344, 0.1003644, -1.381421, 0.7882353, 1, 0, 1,
-0.721796, -1.103808, -3.68879, 0.7803922, 1, 0, 1,
-0.7187361, -0.374654, -0.6240173, 0.7764706, 1, 0, 1,
-0.716907, -1.665645, -2.314696, 0.7686275, 1, 0, 1,
-0.715885, -1.743613, -1.983559, 0.7647059, 1, 0, 1,
-0.7151216, 0.7553749, 0.07193066, 0.7568628, 1, 0, 1,
-0.7128592, -0.9473104, -2.568317, 0.7529412, 1, 0, 1,
-0.7125917, 0.1253052, 0.6183649, 0.7450981, 1, 0, 1,
-0.7089593, -2.793233, -4.589348, 0.7411765, 1, 0, 1,
-0.7082676, -1.700047, -3.737111, 0.7333333, 1, 0, 1,
-0.7023832, 0.6824658, -0.6541805, 0.7294118, 1, 0, 1,
-0.7010177, -0.06241212, -3.130464, 0.7215686, 1, 0, 1,
-0.7007598, 0.5662771, -1.195782, 0.7176471, 1, 0, 1,
-0.6983518, -0.1504248, -0.7214092, 0.7098039, 1, 0, 1,
-0.6974638, 0.02577484, -0.1833299, 0.7058824, 1, 0, 1,
-0.6972607, 0.1842171, -3.64786, 0.6980392, 1, 0, 1,
-0.6951135, 1.274392, 0.1957168, 0.6901961, 1, 0, 1,
-0.6945256, 1.013609, -1.336778, 0.6862745, 1, 0, 1,
-0.6927058, 2.252771, 0.2026548, 0.6784314, 1, 0, 1,
-0.6875897, -1.43456, -2.382895, 0.6745098, 1, 0, 1,
-0.6866869, -0.5752358, -3.284308, 0.6666667, 1, 0, 1,
-0.684598, -1.078209, -2.014691, 0.6627451, 1, 0, 1,
-0.6845952, -0.4639528, -1.448555, 0.654902, 1, 0, 1,
-0.6845699, 1.103936, 0.001538937, 0.6509804, 1, 0, 1,
-0.6793143, 1.65229, -0.3153151, 0.6431373, 1, 0, 1,
-0.6784403, -0.5328598, -2.162498, 0.6392157, 1, 0, 1,
-0.674949, -0.3649048, -2.419189, 0.6313726, 1, 0, 1,
-0.6731455, 0.3942783, -1.939488, 0.627451, 1, 0, 1,
-0.6700584, -0.06420218, -0.2383856, 0.6196079, 1, 0, 1,
-0.6697341, 0.5746563, 0.04993919, 0.6156863, 1, 0, 1,
-0.6670146, 0.388373, -0.3958957, 0.6078432, 1, 0, 1,
-0.6660848, -0.8018332, -2.05631, 0.6039216, 1, 0, 1,
-0.66494, -0.2616599, -3.561524, 0.5960785, 1, 0, 1,
-0.6548786, -0.2853644, -2.977304, 0.5882353, 1, 0, 1,
-0.654183, -0.3721426, -4.210362, 0.5843138, 1, 0, 1,
-0.6513246, 0.2423353, 0.9342526, 0.5764706, 1, 0, 1,
-0.6447807, -0.02105989, -2.1713, 0.572549, 1, 0, 1,
-0.6401849, -0.2987735, -2.797297, 0.5647059, 1, 0, 1,
-0.6383021, 1.325852, -1.468814, 0.5607843, 1, 0, 1,
-0.6362187, 0.4952058, 0.2103321, 0.5529412, 1, 0, 1,
-0.634627, -1.121723, -4.100599, 0.5490196, 1, 0, 1,
-0.6328546, 1.267349, -1.235479, 0.5411765, 1, 0, 1,
-0.6224403, 0.1953796, -0.6417493, 0.5372549, 1, 0, 1,
-0.6151127, -0.7825876, -3.856329, 0.5294118, 1, 0, 1,
-0.6131786, 0.08762218, -1.837738, 0.5254902, 1, 0, 1,
-0.6103433, 0.7574838, 0.992032, 0.5176471, 1, 0, 1,
-0.6089929, 0.2667048, -0.4313516, 0.5137255, 1, 0, 1,
-0.6078686, 0.7933192, 0.1461352, 0.5058824, 1, 0, 1,
-0.6004303, 1.452517, 0.05508681, 0.5019608, 1, 0, 1,
-0.5971673, 0.4772528, -1.614698, 0.4941176, 1, 0, 1,
-0.5948038, -0.5543332, -2.081024, 0.4862745, 1, 0, 1,
-0.5918588, 1.155679, -0.5300868, 0.4823529, 1, 0, 1,
-0.5899267, 0.3176166, -2.109718, 0.4745098, 1, 0, 1,
-0.5887035, 0.6086653, 0.1585337, 0.4705882, 1, 0, 1,
-0.5877643, -0.7326033, -2.445178, 0.4627451, 1, 0, 1,
-0.5862742, 0.03084215, -0.9803283, 0.4588235, 1, 0, 1,
-0.5817066, -0.3909495, -1.961782, 0.4509804, 1, 0, 1,
-0.5787033, 1.635259, -1.253281, 0.4470588, 1, 0, 1,
-0.5776187, 0.3546733, -3.466436, 0.4392157, 1, 0, 1,
-0.5749691, -0.02451618, -1.941068, 0.4352941, 1, 0, 1,
-0.5749075, 0.9459188, 0.1955384, 0.427451, 1, 0, 1,
-0.5735702, -0.3446986, -1.604924, 0.4235294, 1, 0, 1,
-0.5679827, 0.9415401, -0.6992294, 0.4156863, 1, 0, 1,
-0.5620909, 0.8446212, -0.6825417, 0.4117647, 1, 0, 1,
-0.5619828, -0.4678253, -0.1065059, 0.4039216, 1, 0, 1,
-0.5593897, 0.2429831, -1.523336, 0.3960784, 1, 0, 1,
-0.5576898, -0.06905364, -1.809917, 0.3921569, 1, 0, 1,
-0.5568939, -0.3585814, -2.71565, 0.3843137, 1, 0, 1,
-0.5568259, -2.215489, -2.583987, 0.3803922, 1, 0, 1,
-0.5476518, 0.009747434, 1.530329, 0.372549, 1, 0, 1,
-0.5461046, 0.8226284, 0.1904117, 0.3686275, 1, 0, 1,
-0.541669, 0.1149036, 0.8059189, 0.3607843, 1, 0, 1,
-0.5401053, -1.558506, -3.685579, 0.3568628, 1, 0, 1,
-0.5378498, -1.937729, -3.338283, 0.3490196, 1, 0, 1,
-0.5363466, -0.07974076, -1.629907, 0.345098, 1, 0, 1,
-0.534529, -0.1324281, -1.22765, 0.3372549, 1, 0, 1,
-0.5228882, 3.084784, 0.8940203, 0.3333333, 1, 0, 1,
-0.5208804, 0.1776352, -1.910221, 0.3254902, 1, 0, 1,
-0.5199926, -0.2725168, -1.020431, 0.3215686, 1, 0, 1,
-0.5153438, 0.5417953, 1.117977, 0.3137255, 1, 0, 1,
-0.5108103, -0.6348677, -3.064457, 0.3098039, 1, 0, 1,
-0.5073482, -0.03711673, -1.158207, 0.3019608, 1, 0, 1,
-0.5013372, -0.4447174, -2.935143, 0.2941177, 1, 0, 1,
-0.5009247, 0.5500471, -0.9751418, 0.2901961, 1, 0, 1,
-0.4941724, 0.1006835, -1.798551, 0.282353, 1, 0, 1,
-0.4921024, 0.9143181, -1.891389, 0.2784314, 1, 0, 1,
-0.491325, 2.579696, -0.7293164, 0.2705882, 1, 0, 1,
-0.489373, -0.8264976, -4.834246, 0.2666667, 1, 0, 1,
-0.4882989, 0.721006, -0.3171588, 0.2588235, 1, 0, 1,
-0.4871346, 0.4669915, 0.1241552, 0.254902, 1, 0, 1,
-0.4855547, 1.331719, -1.29033, 0.2470588, 1, 0, 1,
-0.4848969, 0.8513827, -0.5634187, 0.2431373, 1, 0, 1,
-0.4848293, -0.6552448, -4.509531, 0.2352941, 1, 0, 1,
-0.4823378, 1.320857, -0.1020099, 0.2313726, 1, 0, 1,
-0.4812813, -0.02029736, -0.2598836, 0.2235294, 1, 0, 1,
-0.4796825, -0.5389474, -2.071017, 0.2196078, 1, 0, 1,
-0.4777803, -0.5953571, -1.147446, 0.2117647, 1, 0, 1,
-0.4773813, 0.04243819, -0.2992702, 0.2078431, 1, 0, 1,
-0.4758902, 0.2374996, -2.08202, 0.2, 1, 0, 1,
-0.471186, 0.5117629, -2.963773, 0.1921569, 1, 0, 1,
-0.4612835, 0.3038665, -1.261475, 0.1882353, 1, 0, 1,
-0.4580261, -1.055674, -4.595625, 0.1803922, 1, 0, 1,
-0.4574628, -1.030786, -2.714863, 0.1764706, 1, 0, 1,
-0.456761, -0.5590428, -1.843544, 0.1686275, 1, 0, 1,
-0.4540875, -1.049504, -1.967752, 0.1647059, 1, 0, 1,
-0.4488683, 0.4778693, -1.402775, 0.1568628, 1, 0, 1,
-0.4468055, 1.613046, -1.046204, 0.1529412, 1, 0, 1,
-0.4462784, -1.47921, -2.527561, 0.145098, 1, 0, 1,
-0.4455377, 0.3429671, -1.641698, 0.1411765, 1, 0, 1,
-0.4444062, 0.1482028, -0.6589046, 0.1333333, 1, 0, 1,
-0.4422348, 0.3519284, -1.72436, 0.1294118, 1, 0, 1,
-0.4421823, 0.9612458, -1.868097, 0.1215686, 1, 0, 1,
-0.4421647, -0.4507054, -2.893977, 0.1176471, 1, 0, 1,
-0.4366937, -0.1981525, -0.5715791, 0.1098039, 1, 0, 1,
-0.4353764, -0.2985483, -2.46831, 0.1058824, 1, 0, 1,
-0.4220833, 1.787568, 0.8034914, 0.09803922, 1, 0, 1,
-0.4166629, 1.542003, 0.3001501, 0.09019608, 1, 0, 1,
-0.4159071, -1.161411, -1.690928, 0.08627451, 1, 0, 1,
-0.4128304, -0.385769, -2.231982, 0.07843138, 1, 0, 1,
-0.4067818, 2.411787, -3.266273, 0.07450981, 1, 0, 1,
-0.4017153, -1.187311, -1.49411, 0.06666667, 1, 0, 1,
-0.400559, 0.08916612, 0.2658972, 0.0627451, 1, 0, 1,
-0.4001597, 1.428528, 1.282387, 0.05490196, 1, 0, 1,
-0.3966342, -0.02950388, -2.061533, 0.05098039, 1, 0, 1,
-0.3934629, 1.176485, 0.6526158, 0.04313726, 1, 0, 1,
-0.3866196, -1.00015, -2.564105, 0.03921569, 1, 0, 1,
-0.3863411, -1.287369, -3.768371, 0.03137255, 1, 0, 1,
-0.378298, 1.543089, 0.5794327, 0.02745098, 1, 0, 1,
-0.3671459, 1.198643, -2.957121, 0.01960784, 1, 0, 1,
-0.3666993, 0.6071009, -0.5930777, 0.01568628, 1, 0, 1,
-0.3662163, -0.9722817, -3.513965, 0.007843138, 1, 0, 1,
-0.365112, -0.1554473, -2.577234, 0.003921569, 1, 0, 1,
-0.364172, 0.5109336, -2.109017, 0, 1, 0.003921569, 1,
-0.3632953, -0.4832554, -2.771298, 0, 1, 0.01176471, 1,
-0.3623192, 0.9451472, -0.6931638, 0, 1, 0.01568628, 1,
-0.3592919, 1.065597, -0.4023154, 0, 1, 0.02352941, 1,
-0.3570581, -0.6728022, -2.513139, 0, 1, 0.02745098, 1,
-0.3557658, 1.054199, -0.8217763, 0, 1, 0.03529412, 1,
-0.3523901, 0.0828639, -0.3017448, 0, 1, 0.03921569, 1,
-0.3487799, 1.268373, 0.6769272, 0, 1, 0.04705882, 1,
-0.3449165, -0.7432035, -1.686536, 0, 1, 0.05098039, 1,
-0.3427868, 1.071144, -1.698695, 0, 1, 0.05882353, 1,
-0.3373627, 0.8350339, 0.7408334, 0, 1, 0.0627451, 1,
-0.3334423, -0.116174, -3.100849, 0, 1, 0.07058824, 1,
-0.3324146, -0.8955294, -2.844749, 0, 1, 0.07450981, 1,
-0.3315242, 0.4753371, -0.6561475, 0, 1, 0.08235294, 1,
-0.330864, 0.9345516, 0.4262877, 0, 1, 0.08627451, 1,
-0.327065, 0.7090478, 0.7067412, 0, 1, 0.09411765, 1,
-0.3258213, 0.6297222, -1.614195, 0, 1, 0.1019608, 1,
-0.3235449, -1.517808, -2.248391, 0, 1, 0.1058824, 1,
-0.3196858, -0.01540704, -0.7250898, 0, 1, 0.1137255, 1,
-0.3154035, -1.986366, -2.793191, 0, 1, 0.1176471, 1,
-0.3146264, 1.430347, 0.06499819, 0, 1, 0.1254902, 1,
-0.3103127, -0.349842, -1.156623, 0, 1, 0.1294118, 1,
-0.310134, 0.8907045, 0.4827519, 0, 1, 0.1372549, 1,
-0.3096333, 0.5357663, 0.06446704, 0, 1, 0.1411765, 1,
-0.3094206, -0.6793358, -2.729077, 0, 1, 0.1490196, 1,
-0.303618, 0.7854691, -1.44911, 0, 1, 0.1529412, 1,
-0.3025168, 0.2982358, -0.1594996, 0, 1, 0.1607843, 1,
-0.2997987, -1.554792, -0.7232885, 0, 1, 0.1647059, 1,
-0.296141, 0.287523, -1.284869, 0, 1, 0.172549, 1,
-0.2898041, 1.74451, 0.9013695, 0, 1, 0.1764706, 1,
-0.2890362, 0.1341395, -1.681495, 0, 1, 0.1843137, 1,
-0.2873684, -0.7077296, -2.142344, 0, 1, 0.1882353, 1,
-0.2782272, -0.1600267, -2.118155, 0, 1, 0.1960784, 1,
-0.2776048, 0.7882669, -1.138696, 0, 1, 0.2039216, 1,
-0.2774661, -0.5888237, -3.275923, 0, 1, 0.2078431, 1,
-0.2768279, 1.553352, 0.4154571, 0, 1, 0.2156863, 1,
-0.2766111, -0.4952002, -3.850537, 0, 1, 0.2196078, 1,
-0.274348, -0.5447038, -2.951591, 0, 1, 0.227451, 1,
-0.2711158, 0.509604, 0.7256107, 0, 1, 0.2313726, 1,
-0.2688442, -0.1736547, -1.710493, 0, 1, 0.2392157, 1,
-0.2626529, -1.888274, -3.760952, 0, 1, 0.2431373, 1,
-0.2624069, 0.2378851, 0.3605935, 0, 1, 0.2509804, 1,
-0.2573237, 0.2786922, 0.8781654, 0, 1, 0.254902, 1,
-0.2561031, 0.4120829, 9.778814e-05, 0, 1, 0.2627451, 1,
-0.2559189, -0.3069671, -2.966699, 0, 1, 0.2666667, 1,
-0.2539857, -0.8729322, -3.533772, 0, 1, 0.2745098, 1,
-0.2523902, -0.02594483, -2.133955, 0, 1, 0.2784314, 1,
-0.2501398, -1.283318, -2.892074, 0, 1, 0.2862745, 1,
-0.2485399, -1.857964, -1.843686, 0, 1, 0.2901961, 1,
-0.2471627, -0.1821628, -3.644805, 0, 1, 0.2980392, 1,
-0.2449428, -0.1944302, -3.034058, 0, 1, 0.3058824, 1,
-0.243957, 1.258234, -0.4507283, 0, 1, 0.3098039, 1,
-0.2431541, 0.6896801, 0.2402094, 0, 1, 0.3176471, 1,
-0.2397686, 1.051532, 1.727981, 0, 1, 0.3215686, 1,
-0.2385717, -0.8219695, -2.455036, 0, 1, 0.3294118, 1,
-0.2377471, -0.4781535, -2.259186, 0, 1, 0.3333333, 1,
-0.2367987, -0.6973024, -1.037961, 0, 1, 0.3411765, 1,
-0.2350134, 1.183183, 0.341528, 0, 1, 0.345098, 1,
-0.2298983, -0.1135516, -1.857005, 0, 1, 0.3529412, 1,
-0.2291348, -1.501199, -1.71426, 0, 1, 0.3568628, 1,
-0.2266561, 1.910278, 0.9153651, 0, 1, 0.3647059, 1,
-0.2250723, 0.6938083, -0.2327999, 0, 1, 0.3686275, 1,
-0.224514, -0.006309545, -2.016536, 0, 1, 0.3764706, 1,
-0.2234844, 0.4231095, -1.167636, 0, 1, 0.3803922, 1,
-0.2227985, 1.033166, 0.523841, 0, 1, 0.3882353, 1,
-0.2225326, 1.190688, -1.566378, 0, 1, 0.3921569, 1,
-0.2207829, -1.828854, -3.016018, 0, 1, 0.4, 1,
-0.2206766, -0.2867236, -2.953102, 0, 1, 0.4078431, 1,
-0.2162667, -0.1403797, -1.996109, 0, 1, 0.4117647, 1,
-0.2143331, 0.4765767, -0.4088308, 0, 1, 0.4196078, 1,
-0.2124157, 0.5442337, 0.1815691, 0, 1, 0.4235294, 1,
-0.212173, -0.8954556, -3.13059, 0, 1, 0.4313726, 1,
-0.2072329, -1.73497, -3.98255, 0, 1, 0.4352941, 1,
-0.2038825, 1.084936, 1.630075, 0, 1, 0.4431373, 1,
-0.2028627, 0.7269937, -0.1141008, 0, 1, 0.4470588, 1,
-0.202789, -1.671258, -3.875744, 0, 1, 0.454902, 1,
-0.2017932, 0.5614462, -0.0199465, 0, 1, 0.4588235, 1,
-0.1893124, -0.3899702, -2.511044, 0, 1, 0.4666667, 1,
-0.1891402, -1.210708, -4.427541, 0, 1, 0.4705882, 1,
-0.1865575, -0.7899248, -5.92033, 0, 1, 0.4784314, 1,
-0.1822883, -1.047, -4.135762, 0, 1, 0.4823529, 1,
-0.1795133, -0.4641503, -0.1516872, 0, 1, 0.4901961, 1,
-0.1748222, 1.70086, -1.960582, 0, 1, 0.4941176, 1,
-0.1724371, -1.285414, -5.152944, 0, 1, 0.5019608, 1,
-0.1688493, -2.176035, -3.67955, 0, 1, 0.509804, 1,
-0.1688161, 0.41034, -0.4224178, 0, 1, 0.5137255, 1,
-0.1678821, -0.3293399, -1.563694, 0, 1, 0.5215687, 1,
-0.1636528, -1.334672, -2.717844, 0, 1, 0.5254902, 1,
-0.1523879, -0.7318747, -2.527384, 0, 1, 0.5333334, 1,
-0.1501664, 0.2017371, 0.7687134, 0, 1, 0.5372549, 1,
-0.1489167, -1.130138, -3.096149, 0, 1, 0.5450981, 1,
-0.1466437, -0.381717, -4.921514, 0, 1, 0.5490196, 1,
-0.1463477, -2.041242, -1.852816, 0, 1, 0.5568628, 1,
-0.1458843, 1.93707, -0.7795276, 0, 1, 0.5607843, 1,
-0.1444963, -0.1100562, -1.066732, 0, 1, 0.5686275, 1,
-0.1431034, -0.7134229, -3.133863, 0, 1, 0.572549, 1,
-0.1407723, -1.165251, -0.8562487, 0, 1, 0.5803922, 1,
-0.1396216, -0.5344643, -2.953894, 0, 1, 0.5843138, 1,
-0.1395068, 1.563518, 1.510956, 0, 1, 0.5921569, 1,
-0.1390705, 0.5612825, -0.1997482, 0, 1, 0.5960785, 1,
-0.1389475, -0.9848852, -4.267421, 0, 1, 0.6039216, 1,
-0.1375824, 0.2955317, -0.2088174, 0, 1, 0.6117647, 1,
-0.1369212, -0.7029647, -2.326319, 0, 1, 0.6156863, 1,
-0.1357839, -1.73137, -3.496276, 0, 1, 0.6235294, 1,
-0.1198158, -2.544624, -4.524625, 0, 1, 0.627451, 1,
-0.1121773, -0.4580269, -2.574079, 0, 1, 0.6352941, 1,
-0.1112451, -0.2113797, -0.7519017, 0, 1, 0.6392157, 1,
-0.1060268, 0.3897981, -1.599233, 0, 1, 0.6470588, 1,
-0.104466, -0.05335737, -2.634666, 0, 1, 0.6509804, 1,
-0.1017424, 0.4888844, 0.5339178, 0, 1, 0.6588235, 1,
-0.09477313, -1.546774, -3.931278, 0, 1, 0.6627451, 1,
-0.09080146, 0.1474248, 1.753038, 0, 1, 0.6705883, 1,
-0.08693139, -1.607122, -4.34096, 0, 1, 0.6745098, 1,
-0.08598707, 0.06535783, -1.593329, 0, 1, 0.682353, 1,
-0.08318113, 0.1564513, -0.1540963, 0, 1, 0.6862745, 1,
-0.0813342, 0.8543886, 0.5080028, 0, 1, 0.6941177, 1,
-0.07895236, -0.05799289, -1.686494, 0, 1, 0.7019608, 1,
-0.07865449, -0.938185, -2.116101, 0, 1, 0.7058824, 1,
-0.07859543, 1.350668, 0.1344227, 0, 1, 0.7137255, 1,
-0.07419708, -1.029627, -4.0979, 0, 1, 0.7176471, 1,
-0.07342617, 0.519401, 0.541285, 0, 1, 0.7254902, 1,
-0.07264345, 0.110925, -2.207047, 0, 1, 0.7294118, 1,
-0.0708636, -0.3466906, -1.315716, 0, 1, 0.7372549, 1,
-0.07002567, -0.2893302, -3.198889, 0, 1, 0.7411765, 1,
-0.06587992, 0.5084312, -0.229628, 0, 1, 0.7490196, 1,
-0.06219997, 0.4048868, 0.1650977, 0, 1, 0.7529412, 1,
-0.05242606, 0.5699685, -1.015005, 0, 1, 0.7607843, 1,
-0.04830997, 0.5607573, -0.2396324, 0, 1, 0.7647059, 1,
-0.03955161, -0.3693283, -2.092284, 0, 1, 0.772549, 1,
-0.03892653, 0.2980816, -0.8728473, 0, 1, 0.7764706, 1,
-0.03876313, -0.8985168, -2.678626, 0, 1, 0.7843137, 1,
-0.03679703, -0.5343395, -2.354175, 0, 1, 0.7882353, 1,
-0.03418103, -0.7656798, -2.526734, 0, 1, 0.7960784, 1,
-0.03126997, -0.2005975, -3.699045, 0, 1, 0.8039216, 1,
-0.03120216, -0.1757856, -2.794072, 0, 1, 0.8078431, 1,
-0.02911704, 0.547564, -0.5115348, 0, 1, 0.8156863, 1,
-0.02085504, 1.412749, 0.8527917, 0, 1, 0.8196079, 1,
-0.01842166, -0.8423628, -2.952436, 0, 1, 0.827451, 1,
-0.01830391, -1.188895, -4.157614, 0, 1, 0.8313726, 1,
-0.01736586, -0.5697097, -3.845123, 0, 1, 0.8392157, 1,
-0.01664193, 0.2588775, 0.8609597, 0, 1, 0.8431373, 1,
-0.01162786, 0.07462209, 0.004950143, 0, 1, 0.8509804, 1,
-0.009132701, -1.057768, -3.722539, 0, 1, 0.854902, 1,
-0.007540652, 1.133901, -1.697279, 0, 1, 0.8627451, 1,
-0.006553477, -0.1041203, -2.987509, 0, 1, 0.8666667, 1,
0.001205079, -0.5599594, 2.795239, 0, 1, 0.8745098, 1,
0.001300327, -0.4516041, 2.144629, 0, 1, 0.8784314, 1,
0.006659675, -0.6916402, 2.977645, 0, 1, 0.8862745, 1,
0.007369895, 0.7954925, -0.4447873, 0, 1, 0.8901961, 1,
0.008091009, 0.003209986, -0.927152, 0, 1, 0.8980392, 1,
0.01531572, 1.437344, 0.2145091, 0, 1, 0.9058824, 1,
0.02212896, 0.7482277, -0.1071193, 0, 1, 0.9098039, 1,
0.02491486, 1.406709, -2.008782, 0, 1, 0.9176471, 1,
0.02781018, -0.733354, 2.788332, 0, 1, 0.9215686, 1,
0.02904811, -0.214395, 2.677876, 0, 1, 0.9294118, 1,
0.03164281, 0.02130754, -0.3425927, 0, 1, 0.9333333, 1,
0.0328683, 0.7618794, 0.6739113, 0, 1, 0.9411765, 1,
0.04500084, -1.265571, 2.070073, 0, 1, 0.945098, 1,
0.04567612, -1.606615, 2.822442, 0, 1, 0.9529412, 1,
0.04966425, 0.7262467, 0.1138776, 0, 1, 0.9568627, 1,
0.06042669, -1.326096, 4.417222, 0, 1, 0.9647059, 1,
0.06479028, 0.3974749, -0.2041595, 0, 1, 0.9686275, 1,
0.06663698, -2.384019, 2.424046, 0, 1, 0.9764706, 1,
0.07362001, -0.6085204, 4.378378, 0, 1, 0.9803922, 1,
0.07423428, -0.7590488, 2.786574, 0, 1, 0.9882353, 1,
0.07621951, 0.3460365, -0.07666138, 0, 1, 0.9921569, 1,
0.07680137, -0.5810806, 1.036015, 0, 1, 1, 1,
0.08035095, -1.128815, 4.256141, 0, 0.9921569, 1, 1,
0.08075375, 1.190277, -0.7881235, 0, 0.9882353, 1, 1,
0.08265501, -0.3295953, 3.89424, 0, 0.9803922, 1, 1,
0.08887038, -1.777864, 3.916313, 0, 0.9764706, 1, 1,
0.08971912, -0.9361587, 2.386616, 0, 0.9686275, 1, 1,
0.09095712, -0.07209663, 2.112127, 0, 0.9647059, 1, 1,
0.09298467, -1.056213, 1.948193, 0, 0.9568627, 1, 1,
0.1013323, 1.581271, 0.004487411, 0, 0.9529412, 1, 1,
0.1019338, -0.9650367, 3.002879, 0, 0.945098, 1, 1,
0.1019617, -0.5113773, 0.8005662, 0, 0.9411765, 1, 1,
0.1020379, -0.9886, 3.66635, 0, 0.9333333, 1, 1,
0.1026239, -1.235821, 2.402038, 0, 0.9294118, 1, 1,
0.1029956, -0.6860257, 3.017307, 0, 0.9215686, 1, 1,
0.1049484, -0.827187, 3.330294, 0, 0.9176471, 1, 1,
0.1070344, -1.449517, 2.502669, 0, 0.9098039, 1, 1,
0.1092932, 2.628611, 1.026789, 0, 0.9058824, 1, 1,
0.1130467, -0.5207155, 4.330086, 0, 0.8980392, 1, 1,
0.1131606, 0.7445549, 0.6953564, 0, 0.8901961, 1, 1,
0.1141507, 1.54641, -0.5373929, 0, 0.8862745, 1, 1,
0.1156841, 0.03445831, 1.570904, 0, 0.8784314, 1, 1,
0.1215167, -0.6930953, 3.211327, 0, 0.8745098, 1, 1,
0.1226545, -0.2184903, 1.78827, 0, 0.8666667, 1, 1,
0.1227102, -0.5043617, 4.297649, 0, 0.8627451, 1, 1,
0.1245966, -0.8045493, 5.078191, 0, 0.854902, 1, 1,
0.1254409, 0.6787429, -1.228765, 0, 0.8509804, 1, 1,
0.1265481, -2.593827, 4.52732, 0, 0.8431373, 1, 1,
0.1267419, -0.5259974, 1.298265, 0, 0.8392157, 1, 1,
0.1274026, -0.2242837, 1.822956, 0, 0.8313726, 1, 1,
0.1328504, -0.9595113, 3.273862, 0, 0.827451, 1, 1,
0.1330323, -1.851532, 4.449296, 0, 0.8196079, 1, 1,
0.1350857, -0.6968299, 4.196677, 0, 0.8156863, 1, 1,
0.1367787, -0.3334551, 1.451855, 0, 0.8078431, 1, 1,
0.1391153, 1.011069, -0.3859492, 0, 0.8039216, 1, 1,
0.1399077, -0.2749927, 1.908792, 0, 0.7960784, 1, 1,
0.1402666, -0.2633793, 3.856446, 0, 0.7882353, 1, 1,
0.1410348, -0.172959, 3.117253, 0, 0.7843137, 1, 1,
0.1423494, -2.169581, 3.26976, 0, 0.7764706, 1, 1,
0.1490873, -0.9688944, 3.285368, 0, 0.772549, 1, 1,
0.1499958, -1.420415, 3.377524, 0, 0.7647059, 1, 1,
0.1522382, 0.3333222, 0.3511185, 0, 0.7607843, 1, 1,
0.1529694, 1.245802, -1.275318, 0, 0.7529412, 1, 1,
0.1566795, -1.140195, 3.455667, 0, 0.7490196, 1, 1,
0.157148, 1.600443, 1.207666, 0, 0.7411765, 1, 1,
0.1625533, -1.601762, 2.547383, 0, 0.7372549, 1, 1,
0.1631847, 0.5914372, 0.06776422, 0, 0.7294118, 1, 1,
0.1638989, -1.366744, 3.373279, 0, 0.7254902, 1, 1,
0.1653342, 2.717161, -0.5308611, 0, 0.7176471, 1, 1,
0.1664385, -0.4771484, 2.640289, 0, 0.7137255, 1, 1,
0.1684569, 1.0625, 0.8238016, 0, 0.7058824, 1, 1,
0.1697162, -0.1462745, 2.5368, 0, 0.6980392, 1, 1,
0.170102, 0.2640507, 2.103923, 0, 0.6941177, 1, 1,
0.1724634, -0.1070573, 2.162187, 0, 0.6862745, 1, 1,
0.1744643, -2.2137, 2.11104, 0, 0.682353, 1, 1,
0.176473, 0.8826196, -0.5413465, 0, 0.6745098, 1, 1,
0.1786336, 0.1994111, 2.246265, 0, 0.6705883, 1, 1,
0.1789686, 1.055348, 0.3011121, 0, 0.6627451, 1, 1,
0.1801681, 0.1773251, 1.618069, 0, 0.6588235, 1, 1,
0.1829933, -1.17011, 4.653712, 0, 0.6509804, 1, 1,
0.1845586, -0.1575014, 2.674492, 0, 0.6470588, 1, 1,
0.1873301, 0.1804346, 1.857794, 0, 0.6392157, 1, 1,
0.1881291, -0.5875935, 1.996865, 0, 0.6352941, 1, 1,
0.1889922, -0.04265934, 0.5218004, 0, 0.627451, 1, 1,
0.1895345, 0.8873636, 2.17309, 0, 0.6235294, 1, 1,
0.1939388, 1.6602, 2.322577, 0, 0.6156863, 1, 1,
0.1939499, 1.347626, 0.8411496, 0, 0.6117647, 1, 1,
0.194024, 0.789099, 1.232915, 0, 0.6039216, 1, 1,
0.1979441, -0.2180183, 4.286563, 0, 0.5960785, 1, 1,
0.1987576, 0.2371756, 0.2986432, 0, 0.5921569, 1, 1,
0.1993673, 0.2820967, -0.159825, 0, 0.5843138, 1, 1,
0.2017847, 1.155295, 2.097342, 0, 0.5803922, 1, 1,
0.2046358, -0.2668628, 3.47898, 0, 0.572549, 1, 1,
0.2077609, -0.111528, 2.916804, 0, 0.5686275, 1, 1,
0.2134963, 1.034447, 0.737052, 0, 0.5607843, 1, 1,
0.2163296, 0.4837145, 0.2829632, 0, 0.5568628, 1, 1,
0.2182254, 0.9784124, 0.8484302, 0, 0.5490196, 1, 1,
0.223075, -1.477664, 0.7215669, 0, 0.5450981, 1, 1,
0.2253849, 0.1785766, 1.314001, 0, 0.5372549, 1, 1,
0.2276392, -0.7672413, 2.295814, 0, 0.5333334, 1, 1,
0.2287532, -0.4565295, 2.523593, 0, 0.5254902, 1, 1,
0.2332739, 0.1424954, 0.4914433, 0, 0.5215687, 1, 1,
0.2345288, 1.031386, -1.872014, 0, 0.5137255, 1, 1,
0.2372163, -0.2127293, 2.893795, 0, 0.509804, 1, 1,
0.2376365, 2.502427, 0.1334621, 0, 0.5019608, 1, 1,
0.2401165, 1.159591, -0.1313252, 0, 0.4941176, 1, 1,
0.2402389, 0.06846441, 0.4490807, 0, 0.4901961, 1, 1,
0.2415936, 0.2869036, 1.664605, 0, 0.4823529, 1, 1,
0.2423648, -1.461132, 3.579704, 0, 0.4784314, 1, 1,
0.2454313, 1.189174, -0.5144051, 0, 0.4705882, 1, 1,
0.2460465, 1.787058, -0.9152436, 0, 0.4666667, 1, 1,
0.2465175, -0.5785514, 4.235339, 0, 0.4588235, 1, 1,
0.2472257, 0.4825904, -0.5814085, 0, 0.454902, 1, 1,
0.2475144, -0.5751373, 1.073442, 0, 0.4470588, 1, 1,
0.2515209, -0.5349113, 3.281788, 0, 0.4431373, 1, 1,
0.2547634, -0.3252003, 0.8756896, 0, 0.4352941, 1, 1,
0.2582533, 0.6274722, 0.3409942, 0, 0.4313726, 1, 1,
0.2591205, 0.2815719, 1.379089, 0, 0.4235294, 1, 1,
0.2605545, 0.2386034, 1.965538, 0, 0.4196078, 1, 1,
0.2638312, -0.9119613, 1.651335, 0, 0.4117647, 1, 1,
0.268481, -0.7662252, 1.469279, 0, 0.4078431, 1, 1,
0.2702742, -0.229165, 1.770825, 0, 0.4, 1, 1,
0.2772359, -0.1622727, 1.575099, 0, 0.3921569, 1, 1,
0.2791065, -1.904554, 2.42407, 0, 0.3882353, 1, 1,
0.2871997, 0.04126518, 0.09204988, 0, 0.3803922, 1, 1,
0.2885548, -0.9617525, 4.3446, 0, 0.3764706, 1, 1,
0.2892119, 0.4130104, -2.35332, 0, 0.3686275, 1, 1,
0.2899071, 0.8305998, 0.2168248, 0, 0.3647059, 1, 1,
0.2909706, -0.1506805, 1.48826, 0, 0.3568628, 1, 1,
0.2950454, 0.9044206, -1.240211, 0, 0.3529412, 1, 1,
0.2996368, -1.572649, 2.680548, 0, 0.345098, 1, 1,
0.3019922, 0.2010428, 1.534685, 0, 0.3411765, 1, 1,
0.3020859, 1.780423, -1.510889, 0, 0.3333333, 1, 1,
0.3053849, -0.1326213, 2.361275, 0, 0.3294118, 1, 1,
0.3056375, 0.9592926, 0.2087661, 0, 0.3215686, 1, 1,
0.3059401, -0.5270584, 2.037968, 0, 0.3176471, 1, 1,
0.3104149, 0.1586527, 2.360014, 0, 0.3098039, 1, 1,
0.310689, 1.809842, 0.1165047, 0, 0.3058824, 1, 1,
0.3130781, 0.6219394, -0.05585424, 0, 0.2980392, 1, 1,
0.3145986, -0.8698072, 4.034124, 0, 0.2901961, 1, 1,
0.3162103, -0.9103432, 1.903908, 0, 0.2862745, 1, 1,
0.3189162, 0.1092641, -1.103337, 0, 0.2784314, 1, 1,
0.328289, -1.249519, 2.857038, 0, 0.2745098, 1, 1,
0.3291393, -1.195122, 2.733238, 0, 0.2666667, 1, 1,
0.3347355, -0.6932725, 3.337846, 0, 0.2627451, 1, 1,
0.3360223, -0.2727014, 0.7592164, 0, 0.254902, 1, 1,
0.3382183, 0.2681912, 0.8577609, 0, 0.2509804, 1, 1,
0.3393965, 1.239251, 0.4648626, 0, 0.2431373, 1, 1,
0.3401068, -1.838367, 2.824559, 0, 0.2392157, 1, 1,
0.3423724, 2.513923, 0.824416, 0, 0.2313726, 1, 1,
0.3427194, 0.5199586, 1.164014, 0, 0.227451, 1, 1,
0.3434846, -2.323208, 3.726452, 0, 0.2196078, 1, 1,
0.3462844, -0.07347891, 3.01916, 0, 0.2156863, 1, 1,
0.3472264, -0.8070406, 2.794255, 0, 0.2078431, 1, 1,
0.3494498, -0.9564671, 2.917596, 0, 0.2039216, 1, 1,
0.3495035, 1.584302, 1.536424, 0, 0.1960784, 1, 1,
0.3496243, -2.100252, 2.130295, 0, 0.1882353, 1, 1,
0.3503821, 1.853483, 0.1258759, 0, 0.1843137, 1, 1,
0.3518338, 0.7392925, 2.042529, 0, 0.1764706, 1, 1,
0.3553563, 1.161008, -1.190205, 0, 0.172549, 1, 1,
0.359217, -0.6587144, 1.813332, 0, 0.1647059, 1, 1,
0.3688124, 1.119679, 0.5362677, 0, 0.1607843, 1, 1,
0.3697604, -0.1413589, 2.274973, 0, 0.1529412, 1, 1,
0.3716449, 0.4854312, -2.296367, 0, 0.1490196, 1, 1,
0.3736347, -0.7338713, 1.394814, 0, 0.1411765, 1, 1,
0.3747447, 2.366711, -0.2869419, 0, 0.1372549, 1, 1,
0.3781855, 1.003024, -0.2814291, 0, 0.1294118, 1, 1,
0.3832667, 1.217799, -0.343898, 0, 0.1254902, 1, 1,
0.3849697, -1.281107, 3.202358, 0, 0.1176471, 1, 1,
0.3893221, -0.9781859, 2.711065, 0, 0.1137255, 1, 1,
0.3903396, -1.595925, 2.490085, 0, 0.1058824, 1, 1,
0.3915677, 0.5428136, 1.771022, 0, 0.09803922, 1, 1,
0.3980179, -1.844405, 4.264883, 0, 0.09411765, 1, 1,
0.3981453, 0.9175909, 1.17035, 0, 0.08627451, 1, 1,
0.4050368, -2.398974, 3.847455, 0, 0.08235294, 1, 1,
0.405383, 0.1887987, 1.740443, 0, 0.07450981, 1, 1,
0.4079118, 1.447758, 1.113441, 0, 0.07058824, 1, 1,
0.4158088, 0.1703276, 0.1915079, 0, 0.0627451, 1, 1,
0.4195618, -0.3118941, 1.594491, 0, 0.05882353, 1, 1,
0.4199267, -0.6169995, 3.372191, 0, 0.05098039, 1, 1,
0.4209161, -1.040575, 2.751098, 0, 0.04705882, 1, 1,
0.4212098, -0.1255105, 0.3352812, 0, 0.03921569, 1, 1,
0.4230825, -0.2240961, 2.851002, 0, 0.03529412, 1, 1,
0.4245597, -2.63639, 2.44378, 0, 0.02745098, 1, 1,
0.4255579, 0.1603038, -0.1361083, 0, 0.02352941, 1, 1,
0.4274377, -0.9400201, 4.358709, 0, 0.01568628, 1, 1,
0.4283136, 0.2959417, 0.8123875, 0, 0.01176471, 1, 1,
0.4294821, 1.361581, -0.567949, 0, 0.003921569, 1, 1,
0.4352519, -0.1797048, 2.174611, 0.003921569, 0, 1, 1,
0.4374029, 0.3444529, 0.9975203, 0.007843138, 0, 1, 1,
0.4410997, 1.323599, -1.676249, 0.01568628, 0, 1, 1,
0.4480836, -0.3415329, 3.237064, 0.01960784, 0, 1, 1,
0.4484103, 0.0711046, 1.115309, 0.02745098, 0, 1, 1,
0.4527028, 0.4155393, 1.022013, 0.03137255, 0, 1, 1,
0.4613386, -1.417047, 3.282973, 0.03921569, 0, 1, 1,
0.4623348, -1.553245, 2.008529, 0.04313726, 0, 1, 1,
0.4634943, -1.476406, 0.9661838, 0.05098039, 0, 1, 1,
0.4698434, -1.030631, 2.480904, 0.05490196, 0, 1, 1,
0.4702924, -1.105175, 3.286037, 0.0627451, 0, 1, 1,
0.4705738, -0.5881242, 1.593977, 0.06666667, 0, 1, 1,
0.47167, 0.947278, 0.2937589, 0.07450981, 0, 1, 1,
0.4735968, -0.7800136, 3.843182, 0.07843138, 0, 1, 1,
0.4753633, 1.520033, 1.177771, 0.08627451, 0, 1, 1,
0.4756124, 0.1224333, 2.288702, 0.09019608, 0, 1, 1,
0.4824236, -0.05968402, 1.563372, 0.09803922, 0, 1, 1,
0.4862236, -0.3704346, 0.4912076, 0.1058824, 0, 1, 1,
0.492109, 2.090703, -1.069921, 0.1098039, 0, 1, 1,
0.4935198, -0.1543018, 0.8514409, 0.1176471, 0, 1, 1,
0.4967173, 1.258361, -0.2347783, 0.1215686, 0, 1, 1,
0.4979013, -0.4968046, 2.107088, 0.1294118, 0, 1, 1,
0.4986036, -0.7095001, 2.56925, 0.1333333, 0, 1, 1,
0.5009357, 1.213854, -0.02411968, 0.1411765, 0, 1, 1,
0.5043275, 0.6254616, 0.1839595, 0.145098, 0, 1, 1,
0.50646, 1.097575, 2.353368, 0.1529412, 0, 1, 1,
0.5070895, 1.210276, -0.9211795, 0.1568628, 0, 1, 1,
0.5160214, -0.4917454, 2.193349, 0.1647059, 0, 1, 1,
0.5192194, -0.008524277, 3.723125, 0.1686275, 0, 1, 1,
0.5210948, -1.081516, 2.457796, 0.1764706, 0, 1, 1,
0.5216751, 0.3130269, 1.987218, 0.1803922, 0, 1, 1,
0.5221093, -2.463315, 2.883932, 0.1882353, 0, 1, 1,
0.5280382, 1.581663, -0.6728943, 0.1921569, 0, 1, 1,
0.5287571, -1.05022, 4.468204, 0.2, 0, 1, 1,
0.5333281, 0.4949794, -0.07821567, 0.2078431, 0, 1, 1,
0.5340584, -1.705379, 2.801523, 0.2117647, 0, 1, 1,
0.5375, 0.4132764, 2.560825, 0.2196078, 0, 1, 1,
0.5387972, 2.599104, -1.324256, 0.2235294, 0, 1, 1,
0.5398458, -1.113351, 2.090003, 0.2313726, 0, 1, 1,
0.5437247, 0.6974506, -0.4176303, 0.2352941, 0, 1, 1,
0.5485844, -0.3454726, 3.23134, 0.2431373, 0, 1, 1,
0.551923, 1.451868, 0.1570423, 0.2470588, 0, 1, 1,
0.5538834, 0.6470948, -0.3499531, 0.254902, 0, 1, 1,
0.554048, -0.8661811, 5.248052, 0.2588235, 0, 1, 1,
0.5570639, -0.716409, 2.050903, 0.2666667, 0, 1, 1,
0.5581111, 1.703863, -0.8435683, 0.2705882, 0, 1, 1,
0.5602257, -0.1568017, 3.197275, 0.2784314, 0, 1, 1,
0.5602711, -1.065181, 2.560462, 0.282353, 0, 1, 1,
0.5613168, 0.6135834, 1.128436, 0.2901961, 0, 1, 1,
0.5624936, 0.05339168, 1.391429, 0.2941177, 0, 1, 1,
0.5667441, -1.928082, 2.904115, 0.3019608, 0, 1, 1,
0.5695058, -0.2876053, 3.162375, 0.3098039, 0, 1, 1,
0.5709808, -0.5253173, 2.119291, 0.3137255, 0, 1, 1,
0.5728226, 0.2606218, 0.02909905, 0.3215686, 0, 1, 1,
0.5730066, -0.02242851, 2.440078, 0.3254902, 0, 1, 1,
0.5756588, -1.20716, 3.892515, 0.3333333, 0, 1, 1,
0.5957848, -0.5563296, 2.261759, 0.3372549, 0, 1, 1,
0.5959287, 0.06897314, 2.17423, 0.345098, 0, 1, 1,
0.6006572, -1.114695, 2.530109, 0.3490196, 0, 1, 1,
0.6021932, 0.5169337, 0.8528986, 0.3568628, 0, 1, 1,
0.609167, -0.08786673, 2.004924, 0.3607843, 0, 1, 1,
0.6104823, 0.4688683, 0.4395757, 0.3686275, 0, 1, 1,
0.6120197, 0.04657916, 1.285573, 0.372549, 0, 1, 1,
0.6144113, 0.6473763, -0.2446651, 0.3803922, 0, 1, 1,
0.6209493, -0.3925346, 1.899547, 0.3843137, 0, 1, 1,
0.6242037, -0.2304664, 2.801494, 0.3921569, 0, 1, 1,
0.6247519, -0.08133137, 2.251987, 0.3960784, 0, 1, 1,
0.6266961, 0.8928365, 0.2788621, 0.4039216, 0, 1, 1,
0.6321428, -0.2107896, 2.638801, 0.4117647, 0, 1, 1,
0.6356693, 1.33178, 0.1257426, 0.4156863, 0, 1, 1,
0.6366176, 1.591179, -1.317716, 0.4235294, 0, 1, 1,
0.6376864, 0.3695979, 0.8275573, 0.427451, 0, 1, 1,
0.6404214, 0.438601, 1.226752, 0.4352941, 0, 1, 1,
0.6487855, 0.6667328, 1.973505, 0.4392157, 0, 1, 1,
0.649177, -0.4992204, 2.405641, 0.4470588, 0, 1, 1,
0.6509566, -1.774111, 1.997908, 0.4509804, 0, 1, 1,
0.6548781, 1.445767, 1.669154, 0.4588235, 0, 1, 1,
0.6569651, -0.2367384, 2.718769, 0.4627451, 0, 1, 1,
0.6773791, -0.2274677, 2.885585, 0.4705882, 0, 1, 1,
0.6783535, 1.360206, 1.124134, 0.4745098, 0, 1, 1,
0.6809884, 0.8009084, 1.079901, 0.4823529, 0, 1, 1,
0.6810549, 0.5621475, 2.309146, 0.4862745, 0, 1, 1,
0.6812046, 0.2570503, 1.198027, 0.4941176, 0, 1, 1,
0.6827459, -0.3653397, 1.356972, 0.5019608, 0, 1, 1,
0.6843043, 0.03403107, 0.8170886, 0.5058824, 0, 1, 1,
0.6865258, -0.5880262, 4.156516, 0.5137255, 0, 1, 1,
0.6945978, 1.883802, 0.246725, 0.5176471, 0, 1, 1,
0.6986071, -1.628791, 2.153281, 0.5254902, 0, 1, 1,
0.7063518, 0.5987724, 1.384314, 0.5294118, 0, 1, 1,
0.7076689, -0.3734623, 0.850628, 0.5372549, 0, 1, 1,
0.7084301, -1.964999, 2.54882, 0.5411765, 0, 1, 1,
0.7108204, 1.049985, 0.823916, 0.5490196, 0, 1, 1,
0.7129334, 1.10609, 1.760235, 0.5529412, 0, 1, 1,
0.7151172, 1.365085, 0.3756871, 0.5607843, 0, 1, 1,
0.7177167, 1.398459, 1.916744, 0.5647059, 0, 1, 1,
0.7249812, 0.3058226, 2.742991, 0.572549, 0, 1, 1,
0.7263362, -0.9658448, 3.431097, 0.5764706, 0, 1, 1,
0.7349544, 1.149149, -0.686196, 0.5843138, 0, 1, 1,
0.7354905, -0.07824033, 1.424667, 0.5882353, 0, 1, 1,
0.7375643, -1.78421, 1.126957, 0.5960785, 0, 1, 1,
0.7411209, 0.263808, 0.4708077, 0.6039216, 0, 1, 1,
0.7415532, -0.7269374, -0.3976105, 0.6078432, 0, 1, 1,
0.749362, -0.007240691, 1.496791, 0.6156863, 0, 1, 1,
0.7581707, -1.644316, 1.738186, 0.6196079, 0, 1, 1,
0.7585866, -2.346393, 2.870973, 0.627451, 0, 1, 1,
0.76217, 0.08767001, 1.166524, 0.6313726, 0, 1, 1,
0.7626744, -2.062793, 3.528486, 0.6392157, 0, 1, 1,
0.7679356, -0.08272441, 1.609618, 0.6431373, 0, 1, 1,
0.7691086, -0.08245677, 2.245721, 0.6509804, 0, 1, 1,
0.7752264, -2.270736, 2.8971, 0.654902, 0, 1, 1,
0.7784756, 1.703705, 2.157573, 0.6627451, 0, 1, 1,
0.7801933, -0.5039694, 2.895163, 0.6666667, 0, 1, 1,
0.7804837, 1.678879, -0.35317, 0.6745098, 0, 1, 1,
0.786282, 1.656596, 0.2134387, 0.6784314, 0, 1, 1,
0.7875295, 1.939244, 0.9818138, 0.6862745, 0, 1, 1,
0.7931457, -0.2986315, 2.636811, 0.6901961, 0, 1, 1,
0.795059, 0.9412007, 0.5218324, 0.6980392, 0, 1, 1,
0.7959151, 0.1536556, 1.518618, 0.7058824, 0, 1, 1,
0.8037219, -0.4109716, 1.466397, 0.7098039, 0, 1, 1,
0.811848, 1.190392, 2.134067, 0.7176471, 0, 1, 1,
0.8159115, 1.298514, 3.148387, 0.7215686, 0, 1, 1,
0.819616, 0.1552282, 2.32727, 0.7294118, 0, 1, 1,
0.8219633, -1.981971, 2.158132, 0.7333333, 0, 1, 1,
0.8231747, -0.4001926, 1.322818, 0.7411765, 0, 1, 1,
0.8241087, -0.2787865, 1.615057, 0.7450981, 0, 1, 1,
0.8254735, 0.2313702, 0.5335408, 0.7529412, 0, 1, 1,
0.8273178, 1.219454, 1.75346, 0.7568628, 0, 1, 1,
0.8297272, 0.8971099, 0.2406754, 0.7647059, 0, 1, 1,
0.8300779, -0.5458205, 3.577089, 0.7686275, 0, 1, 1,
0.8350181, 1.253531, 0.346601, 0.7764706, 0, 1, 1,
0.8353658, 0.6098264, -0.2315966, 0.7803922, 0, 1, 1,
0.8360815, 0.4521149, 3.069157, 0.7882353, 0, 1, 1,
0.8407696, 1.106449, 1.035035, 0.7921569, 0, 1, 1,
0.8563961, -1.221869, 1.308202, 0.8, 0, 1, 1,
0.8567274, -0.2921994, 0.9504962, 0.8078431, 0, 1, 1,
0.8570321, 1.05487, 1.194402, 0.8117647, 0, 1, 1,
0.8571551, 0.915796, -0.05589086, 0.8196079, 0, 1, 1,
0.8650848, 0.2145008, 0.7623588, 0.8235294, 0, 1, 1,
0.8650878, 1.08722, -0.4743273, 0.8313726, 0, 1, 1,
0.8668424, -0.2949686, 0.1103274, 0.8352941, 0, 1, 1,
0.8696196, -1.190395, 3.908878, 0.8431373, 0, 1, 1,
0.8805448, -1.578476, 4.143612, 0.8470588, 0, 1, 1,
0.8871256, -0.2120173, 2.339029, 0.854902, 0, 1, 1,
0.8877131, 0.2999402, 0.547902, 0.8588235, 0, 1, 1,
0.8879109, 0.3412672, -0.8385938, 0.8666667, 0, 1, 1,
0.889272, -1.471111, 2.716103, 0.8705882, 0, 1, 1,
0.8900856, -0.7909426, 2.844454, 0.8784314, 0, 1, 1,
0.892575, -1.2278, 1.024846, 0.8823529, 0, 1, 1,
0.8974618, 0.7434553, 1.219893, 0.8901961, 0, 1, 1,
0.9026875, -1.052363, 2.716213, 0.8941177, 0, 1, 1,
0.9129599, -0.2402802, 2.210218, 0.9019608, 0, 1, 1,
0.9157654, 1.081374, -0.7199235, 0.9098039, 0, 1, 1,
0.9177728, 0.1958793, -0.7293388, 0.9137255, 0, 1, 1,
0.9184513, -0.3496889, 2.755023, 0.9215686, 0, 1, 1,
0.9216127, 0.4669048, -0.8642754, 0.9254902, 0, 1, 1,
0.9228976, 1.34587, 0.9945065, 0.9333333, 0, 1, 1,
0.9287261, 0.647478, 0.08803655, 0.9372549, 0, 1, 1,
0.9338678, -0.7702038, 2.329365, 0.945098, 0, 1, 1,
0.9387553, 1.122742, 1.731646, 0.9490196, 0, 1, 1,
0.943863, 0.06988677, 0.07150507, 0.9568627, 0, 1, 1,
0.9452224, -1.348602, 0.8979393, 0.9607843, 0, 1, 1,
0.9480979, -0.7476538, 1.691385, 0.9686275, 0, 1, 1,
0.9491528, 0.2021591, 1.337626, 0.972549, 0, 1, 1,
0.9559094, 0.07334634, 0.2594513, 0.9803922, 0, 1, 1,
0.9566908, 0.4594595, 0.6233253, 0.9843137, 0, 1, 1,
0.9578657, -0.1129293, 3.013214, 0.9921569, 0, 1, 1,
0.9702052, -1.878317, 1.464797, 0.9960784, 0, 1, 1,
0.9780804, -1.179735, 3.904092, 1, 0, 0.9960784, 1,
0.9798694, -0.1149655, 3.948681, 1, 0, 0.9882353, 1,
0.984167, -0.3493837, 1.823596, 1, 0, 0.9843137, 1,
0.9852625, 0.4727797, 0.8167769, 1, 0, 0.9764706, 1,
0.9857579, -0.866127, 2.721151, 1, 0, 0.972549, 1,
0.9879228, 1.10961, 1.952132, 1, 0, 0.9647059, 1,
0.9916806, 0.8649548, 1.375276, 1, 0, 0.9607843, 1,
0.9979741, -0.7762697, 0.9450027, 1, 0, 0.9529412, 1,
0.9995645, 0.06380524, 1.798632, 1, 0, 0.9490196, 1,
1.000641, 0.755766, -2.679841, 1, 0, 0.9411765, 1,
1.005685, 0.7084335, 1.844068, 1, 0, 0.9372549, 1,
1.005915, -0.1144995, 0.5922759, 1, 0, 0.9294118, 1,
1.009772, -1.106013, 3.953256, 1, 0, 0.9254902, 1,
1.012154, 0.02652202, -0.3646159, 1, 0, 0.9176471, 1,
1.022251, 1.473058, 0.4256432, 1, 0, 0.9137255, 1,
1.028128, 0.4052425, 0.5130827, 1, 0, 0.9058824, 1,
1.029542, 0.5682836, 1.837329, 1, 0, 0.9019608, 1,
1.034126, 0.2617233, 2.580921, 1, 0, 0.8941177, 1,
1.035401, -0.7865549, 2.219048, 1, 0, 0.8862745, 1,
1.037807, 0.08314756, 3.196125, 1, 0, 0.8823529, 1,
1.043579, 0.1818491, 0.7686855, 1, 0, 0.8745098, 1,
1.047371, 0.7192331, 0.7395707, 1, 0, 0.8705882, 1,
1.0494, 0.08243429, -0.8035358, 1, 0, 0.8627451, 1,
1.054844, -1.278562, 2.179443, 1, 0, 0.8588235, 1,
1.057931, -0.2599145, 3.125038, 1, 0, 0.8509804, 1,
1.061686, 0.4239729, 0.9159641, 1, 0, 0.8470588, 1,
1.064925, -2.001501, 1.611363, 1, 0, 0.8392157, 1,
1.069894, 0.2524095, 0.5149553, 1, 0, 0.8352941, 1,
1.070589, -0.6303729, 1.559407, 1, 0, 0.827451, 1,
1.077357, -0.2274517, 2.149632, 1, 0, 0.8235294, 1,
1.081307, 0.01827333, 1.918097, 1, 0, 0.8156863, 1,
1.082636, -0.0872054, -0.08895221, 1, 0, 0.8117647, 1,
1.088675, 1.245325, 0.9256047, 1, 0, 0.8039216, 1,
1.10337, -0.1091404, 1.224439, 1, 0, 0.7960784, 1,
1.106377, -0.8315402, 1.212306, 1, 0, 0.7921569, 1,
1.110646, 0.6260741, 0.7125429, 1, 0, 0.7843137, 1,
1.114188, 2.134454, 1.317095, 1, 0, 0.7803922, 1,
1.122475, 0.1482809, 1.559722, 1, 0, 0.772549, 1,
1.133903, -1.166264, 1.495764, 1, 0, 0.7686275, 1,
1.134715, -1.636361, 3.556847, 1, 0, 0.7607843, 1,
1.138463, 0.206946, 1.776891, 1, 0, 0.7568628, 1,
1.140055, -0.03330594, 0.418006, 1, 0, 0.7490196, 1,
1.165567, -1.19462, 1.195604, 1, 0, 0.7450981, 1,
1.173585, 0.7020125, 0.5146328, 1, 0, 0.7372549, 1,
1.175036, 0.6261812, 1.279106, 1, 0, 0.7333333, 1,
1.183745, -0.08433142, 0.7071775, 1, 0, 0.7254902, 1,
1.187838, 0.5094956, 1.0079, 1, 0, 0.7215686, 1,
1.189917, 0.2252164, 2.54499, 1, 0, 0.7137255, 1,
1.202545, 2.212437, -0.2419326, 1, 0, 0.7098039, 1,
1.205883, 2.095527, 1.352298, 1, 0, 0.7019608, 1,
1.22819, -0.05328472, 2.421663, 1, 0, 0.6941177, 1,
1.235813, 1.059495, 1.886001, 1, 0, 0.6901961, 1,
1.244316, -1.550647, 2.382544, 1, 0, 0.682353, 1,
1.248277, 3.161059, 0.4003198, 1, 0, 0.6784314, 1,
1.254468, -0.3992004, 1.89781, 1, 0, 0.6705883, 1,
1.255711, -0.7002127, 1.677471, 1, 0, 0.6666667, 1,
1.256476, 1.150342, 1.65948, 1, 0, 0.6588235, 1,
1.263746, -0.7644796, 0.9622809, 1, 0, 0.654902, 1,
1.264728, -1.369885, 2.420043, 1, 0, 0.6470588, 1,
1.268761, 1.110335, 2.456784, 1, 0, 0.6431373, 1,
1.273008, 1.147634, 0.9031377, 1, 0, 0.6352941, 1,
1.281092, 0.2764441, 1.169689, 1, 0, 0.6313726, 1,
1.283331, 0.4377592, 2.635566, 1, 0, 0.6235294, 1,
1.286343, -0.2499313, 2.604518, 1, 0, 0.6196079, 1,
1.293502, -0.6499622, 3.455106, 1, 0, 0.6117647, 1,
1.302052, 2.58821, -0.7909223, 1, 0, 0.6078432, 1,
1.302781, -0.629475, 1.047995, 1, 0, 0.6, 1,
1.303128, -0.656128, 2.695964, 1, 0, 0.5921569, 1,
1.305586, -1.538771, 1.204133, 1, 0, 0.5882353, 1,
1.312293, -2.187227, 3.767605, 1, 0, 0.5803922, 1,
1.321121, 0.6964204, 1.822254, 1, 0, 0.5764706, 1,
1.332991, 1.223369, 0.04506068, 1, 0, 0.5686275, 1,
1.333608, 1.526258, 1.696975, 1, 0, 0.5647059, 1,
1.334174, -1.219252, 1.884925, 1, 0, 0.5568628, 1,
1.337147, 0.09182132, 2.264581, 1, 0, 0.5529412, 1,
1.33943, 0.006701632, 1.125703, 1, 0, 0.5450981, 1,
1.349767, -0.6535767, 1.519552, 1, 0, 0.5411765, 1,
1.377228, -0.8845779, 1.668247, 1, 0, 0.5333334, 1,
1.378139, 1.65024, 0.4169376, 1, 0, 0.5294118, 1,
1.388368, -1.22256, 1.227952, 1, 0, 0.5215687, 1,
1.392197, -0.06791596, 1.611932, 1, 0, 0.5176471, 1,
1.407379, 0.6046829, 0.09748385, 1, 0, 0.509804, 1,
1.409478, 0.4094939, 2.990785, 1, 0, 0.5058824, 1,
1.411301, -1.822058, 2.457586, 1, 0, 0.4980392, 1,
1.414398, 0.728628, 1.942297, 1, 0, 0.4901961, 1,
1.415643, 0.9553394, 0.07752959, 1, 0, 0.4862745, 1,
1.417907, 1.194314, 0.1582099, 1, 0, 0.4784314, 1,
1.420743, 1.356459, 1.358145, 1, 0, 0.4745098, 1,
1.426797, 1.218395, 0.3213525, 1, 0, 0.4666667, 1,
1.441509, -0.9282528, 0.9661791, 1, 0, 0.4627451, 1,
1.46444, -0.5585362, 1.605739, 1, 0, 0.454902, 1,
1.464782, -0.3908479, 2.897967, 1, 0, 0.4509804, 1,
1.477973, 0.6572852, 0.6975164, 1, 0, 0.4431373, 1,
1.480107, 2.372233, -0.1186179, 1, 0, 0.4392157, 1,
1.488787, -0.01374523, 3.34837, 1, 0, 0.4313726, 1,
1.491763, 0.07619745, 2.542401, 1, 0, 0.427451, 1,
1.494098, 0.08424889, 1.869135, 1, 0, 0.4196078, 1,
1.499566, -0.1521059, 3.008259, 1, 0, 0.4156863, 1,
1.504536, 0.28978, 1.848665, 1, 0, 0.4078431, 1,
1.514369, 0.403168, 1.919692, 1, 0, 0.4039216, 1,
1.522292, 0.7529861, 3.092884, 1, 0, 0.3960784, 1,
1.529463, -0.2854546, 1.366747, 1, 0, 0.3882353, 1,
1.539646, 1.012785, 2.80145, 1, 0, 0.3843137, 1,
1.541063, -1.141261, -0.01659433, 1, 0, 0.3764706, 1,
1.569931, 1.179713, 1.682993, 1, 0, 0.372549, 1,
1.572362, 0.5625966, 0.1364512, 1, 0, 0.3647059, 1,
1.585191, -0.3837095, 1.796784, 1, 0, 0.3607843, 1,
1.593511, -0.6888123, -1.227059, 1, 0, 0.3529412, 1,
1.600754, -0.8266602, 0.6417343, 1, 0, 0.3490196, 1,
1.601012, 0.0871392, 3.167756, 1, 0, 0.3411765, 1,
1.60354, -2.159834, 1.382628, 1, 0, 0.3372549, 1,
1.60416, -0.4716907, 1.264342, 1, 0, 0.3294118, 1,
1.626429, 1.58986, 0.238533, 1, 0, 0.3254902, 1,
1.627041, -2.711373, 3.458585, 1, 0, 0.3176471, 1,
1.631647, -1.527752, 0.9161137, 1, 0, 0.3137255, 1,
1.63791, 0.5699668, 0.6931219, 1, 0, 0.3058824, 1,
1.651146, 1.176469, 0.3157359, 1, 0, 0.2980392, 1,
1.658426, -0.9978522, 0.8513648, 1, 0, 0.2941177, 1,
1.66022, -2.273758, 1.044692, 1, 0, 0.2862745, 1,
1.669735, -0.3509858, 2.529425, 1, 0, 0.282353, 1,
1.67447, 1.05836, 1.151872, 1, 0, 0.2745098, 1,
1.703508, -2.458766, 1.687663, 1, 0, 0.2705882, 1,
1.704296, -0.2476364, 1.464829, 1, 0, 0.2627451, 1,
1.708157, 0.2797548, 0.8018149, 1, 0, 0.2588235, 1,
1.709845, 0.06084586, 0.828494, 1, 0, 0.2509804, 1,
1.719276, -2.290341, 1.68026, 1, 0, 0.2470588, 1,
1.751922, -0.8835823, 3.13261, 1, 0, 0.2392157, 1,
1.752284, -0.01137231, 0.6123401, 1, 0, 0.2352941, 1,
1.775787, 0.9834745, -0.6700984, 1, 0, 0.227451, 1,
1.801972, 0.4012095, 3.577393, 1, 0, 0.2235294, 1,
1.809245, 1.220574, 2.11963, 1, 0, 0.2156863, 1,
1.823881, -1.808749, 2.53012, 1, 0, 0.2117647, 1,
1.827725, -2.284811, 3.039648, 1, 0, 0.2039216, 1,
1.859139, 1.903375, 1.694827, 1, 0, 0.1960784, 1,
1.88683, -0.5447969, 3.442906, 1, 0, 0.1921569, 1,
1.9109, -2.37541, 1.949815, 1, 0, 0.1843137, 1,
1.926903, -0.5831604, 3.005662, 1, 0, 0.1803922, 1,
1.936815, -0.702051, 0.5189703, 1, 0, 0.172549, 1,
1.953094, 1.616253, 2.913884, 1, 0, 0.1686275, 1,
1.967601, 0.4499868, 1.633074, 1, 0, 0.1607843, 1,
1.986115, 0.5989152, 0.01898383, 1, 0, 0.1568628, 1,
2.014427, 0.9621857, 1.288189, 1, 0, 0.1490196, 1,
2.047616, -0.3254574, 2.450753, 1, 0, 0.145098, 1,
2.070684, 0.757229, 1.500908, 1, 0, 0.1372549, 1,
2.077061, -0.09594645, 2.087152, 1, 0, 0.1333333, 1,
2.109583, 0.9680341, 1.525429, 1, 0, 0.1254902, 1,
2.141697, -0.2014699, 1.048158, 1, 0, 0.1215686, 1,
2.141778, 0.1144855, -0.1932273, 1, 0, 0.1137255, 1,
2.158609, 1.471175, -0.1548565, 1, 0, 0.1098039, 1,
2.242146, -0.7502267, 0.9730075, 1, 0, 0.1019608, 1,
2.342786, -0.8514437, 1.758963, 1, 0, 0.09411765, 1,
2.35172, 0.5727414, 1.918127, 1, 0, 0.09019608, 1,
2.369876, -0.7987682, 1.274561, 1, 0, 0.08235294, 1,
2.419026, 0.9722112, 1.78399, 1, 0, 0.07843138, 1,
2.523633, -0.02223693, 2.136222, 1, 0, 0.07058824, 1,
2.558955, 0.01614934, 1.897011, 1, 0, 0.06666667, 1,
2.651638, 0.7163525, 0.20022, 1, 0, 0.05882353, 1,
2.653274, -0.6642048, 2.242937, 1, 0, 0.05490196, 1,
2.656564, -1.222212, 2.239546, 1, 0, 0.04705882, 1,
2.739267, -1.826111, 3.097499, 1, 0, 0.04313726, 1,
2.77493, 0.7868766, 0.2544381, 1, 0, 0.03529412, 1,
2.918881, -0.3627765, 1.527496, 1, 0, 0.03137255, 1,
2.963512, 1.958498, 1.195401, 1, 0, 0.02352941, 1,
2.963526, 0.603731, 1.837916, 1, 0, 0.01960784, 1,
3.241723, 1.095147, 2.021858, 1, 0, 0.01176471, 1,
3.555067, -0.1125399, 1.84683, 1, 0, 0.007843138, 1
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
0.3075898, -4.120149, -7.81337, 0, -0.5, 0.5, 0.5,
0.3075898, -4.120149, -7.81337, 1, -0.5, 0.5, 0.5,
0.3075898, -4.120149, -7.81337, 1, 1.5, 0.5, 0.5,
0.3075898, -4.120149, -7.81337, 0, 1.5, 0.5, 0.5
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
-4.040782, 0.04810154, -7.81337, 0, -0.5, 0.5, 0.5,
-4.040782, 0.04810154, -7.81337, 1, -0.5, 0.5, 0.5,
-4.040782, 0.04810154, -7.81337, 1, 1.5, 0.5, 0.5,
-4.040782, 0.04810154, -7.81337, 0, 1.5, 0.5, 0.5
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
-4.040782, -4.120149, -0.3361387, 0, -0.5, 0.5, 0.5,
-4.040782, -4.120149, -0.3361387, 1, -0.5, 0.5, 0.5,
-4.040782, -4.120149, -0.3361387, 1, 1.5, 0.5, 0.5,
-4.040782, -4.120149, -0.3361387, 0, 1.5, 0.5, 0.5
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
-2, -3.158245, -6.087855,
3, -3.158245, -6.087855,
-2, -3.158245, -6.087855,
-2, -3.318562, -6.375441,
-1, -3.158245, -6.087855,
-1, -3.318562, -6.375441,
0, -3.158245, -6.087855,
0, -3.318562, -6.375441,
1, -3.158245, -6.087855,
1, -3.318562, -6.375441,
2, -3.158245, -6.087855,
2, -3.318562, -6.375441,
3, -3.158245, -6.087855,
3, -3.318562, -6.375441
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
-2, -3.639197, -6.950613, 0, -0.5, 0.5, 0.5,
-2, -3.639197, -6.950613, 1, -0.5, 0.5, 0.5,
-2, -3.639197, -6.950613, 1, 1.5, 0.5, 0.5,
-2, -3.639197, -6.950613, 0, 1.5, 0.5, 0.5,
-1, -3.639197, -6.950613, 0, -0.5, 0.5, 0.5,
-1, -3.639197, -6.950613, 1, -0.5, 0.5, 0.5,
-1, -3.639197, -6.950613, 1, 1.5, 0.5, 0.5,
-1, -3.639197, -6.950613, 0, 1.5, 0.5, 0.5,
0, -3.639197, -6.950613, 0, -0.5, 0.5, 0.5,
0, -3.639197, -6.950613, 1, -0.5, 0.5, 0.5,
0, -3.639197, -6.950613, 1, 1.5, 0.5, 0.5,
0, -3.639197, -6.950613, 0, 1.5, 0.5, 0.5,
1, -3.639197, -6.950613, 0, -0.5, 0.5, 0.5,
1, -3.639197, -6.950613, 1, -0.5, 0.5, 0.5,
1, -3.639197, -6.950613, 1, 1.5, 0.5, 0.5,
1, -3.639197, -6.950613, 0, 1.5, 0.5, 0.5,
2, -3.639197, -6.950613, 0, -0.5, 0.5, 0.5,
2, -3.639197, -6.950613, 1, -0.5, 0.5, 0.5,
2, -3.639197, -6.950613, 1, 1.5, 0.5, 0.5,
2, -3.639197, -6.950613, 0, 1.5, 0.5, 0.5,
3, -3.639197, -6.950613, 0, -0.5, 0.5, 0.5,
3, -3.639197, -6.950613, 1, -0.5, 0.5, 0.5,
3, -3.639197, -6.950613, 1, 1.5, 0.5, 0.5,
3, -3.639197, -6.950613, 0, 1.5, 0.5, 0.5
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
-3.037312, -3, -6.087855,
-3.037312, 3, -6.087855,
-3.037312, -3, -6.087855,
-3.204557, -3, -6.375441,
-3.037312, -2, -6.087855,
-3.204557, -2, -6.375441,
-3.037312, -1, -6.087855,
-3.204557, -1, -6.375441,
-3.037312, 0, -6.087855,
-3.204557, 0, -6.375441,
-3.037312, 1, -6.087855,
-3.204557, 1, -6.375441,
-3.037312, 2, -6.087855,
-3.204557, 2, -6.375441,
-3.037312, 3, -6.087855,
-3.204557, 3, -6.375441
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
-3.539047, -3, -6.950613, 0, -0.5, 0.5, 0.5,
-3.539047, -3, -6.950613, 1, -0.5, 0.5, 0.5,
-3.539047, -3, -6.950613, 1, 1.5, 0.5, 0.5,
-3.539047, -3, -6.950613, 0, 1.5, 0.5, 0.5,
-3.539047, -2, -6.950613, 0, -0.5, 0.5, 0.5,
-3.539047, -2, -6.950613, 1, -0.5, 0.5, 0.5,
-3.539047, -2, -6.950613, 1, 1.5, 0.5, 0.5,
-3.539047, -2, -6.950613, 0, 1.5, 0.5, 0.5,
-3.539047, -1, -6.950613, 0, -0.5, 0.5, 0.5,
-3.539047, -1, -6.950613, 1, -0.5, 0.5, 0.5,
-3.539047, -1, -6.950613, 1, 1.5, 0.5, 0.5,
-3.539047, -1, -6.950613, 0, 1.5, 0.5, 0.5,
-3.539047, 0, -6.950613, 0, -0.5, 0.5, 0.5,
-3.539047, 0, -6.950613, 1, -0.5, 0.5, 0.5,
-3.539047, 0, -6.950613, 1, 1.5, 0.5, 0.5,
-3.539047, 0, -6.950613, 0, 1.5, 0.5, 0.5,
-3.539047, 1, -6.950613, 0, -0.5, 0.5, 0.5,
-3.539047, 1, -6.950613, 1, -0.5, 0.5, 0.5,
-3.539047, 1, -6.950613, 1, 1.5, 0.5, 0.5,
-3.539047, 1, -6.950613, 0, 1.5, 0.5, 0.5,
-3.539047, 2, -6.950613, 0, -0.5, 0.5, 0.5,
-3.539047, 2, -6.950613, 1, -0.5, 0.5, 0.5,
-3.539047, 2, -6.950613, 1, 1.5, 0.5, 0.5,
-3.539047, 2, -6.950613, 0, 1.5, 0.5, 0.5,
-3.539047, 3, -6.950613, 0, -0.5, 0.5, 0.5,
-3.539047, 3, -6.950613, 1, -0.5, 0.5, 0.5,
-3.539047, 3, -6.950613, 1, 1.5, 0.5, 0.5,
-3.539047, 3, -6.950613, 0, 1.5, 0.5, 0.5
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
-3.037312, -3.158245, -4,
-3.037312, -3.158245, 4,
-3.037312, -3.158245, -4,
-3.204557, -3.318562, -4,
-3.037312, -3.158245, -2,
-3.204557, -3.318562, -2,
-3.037312, -3.158245, 0,
-3.204557, -3.318562, 0,
-3.037312, -3.158245, 2,
-3.204557, -3.318562, 2,
-3.037312, -3.158245, 4,
-3.204557, -3.318562, 4
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
-3.539047, -3.639197, -4, 0, -0.5, 0.5, 0.5,
-3.539047, -3.639197, -4, 1, -0.5, 0.5, 0.5,
-3.539047, -3.639197, -4, 1, 1.5, 0.5, 0.5,
-3.539047, -3.639197, -4, 0, 1.5, 0.5, 0.5,
-3.539047, -3.639197, -2, 0, -0.5, 0.5, 0.5,
-3.539047, -3.639197, -2, 1, -0.5, 0.5, 0.5,
-3.539047, -3.639197, -2, 1, 1.5, 0.5, 0.5,
-3.539047, -3.639197, -2, 0, 1.5, 0.5, 0.5,
-3.539047, -3.639197, 0, 0, -0.5, 0.5, 0.5,
-3.539047, -3.639197, 0, 1, -0.5, 0.5, 0.5,
-3.539047, -3.639197, 0, 1, 1.5, 0.5, 0.5,
-3.539047, -3.639197, 0, 0, 1.5, 0.5, 0.5,
-3.539047, -3.639197, 2, 0, -0.5, 0.5, 0.5,
-3.539047, -3.639197, 2, 1, -0.5, 0.5, 0.5,
-3.539047, -3.639197, 2, 1, 1.5, 0.5, 0.5,
-3.539047, -3.639197, 2, 0, 1.5, 0.5, 0.5,
-3.539047, -3.639197, 4, 0, -0.5, 0.5, 0.5,
-3.539047, -3.639197, 4, 1, -0.5, 0.5, 0.5,
-3.539047, -3.639197, 4, 1, 1.5, 0.5, 0.5,
-3.539047, -3.639197, 4, 0, 1.5, 0.5, 0.5
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
-3.037312, -3.158245, -6.087855,
-3.037312, 3.254448, -6.087855,
-3.037312, -3.158245, 5.415578,
-3.037312, 3.254448, 5.415578,
-3.037312, -3.158245, -6.087855,
-3.037312, -3.158245, 5.415578,
-3.037312, 3.254448, -6.087855,
-3.037312, 3.254448, 5.415578,
-3.037312, -3.158245, -6.087855,
3.652492, -3.158245, -6.087855,
-3.037312, -3.158245, 5.415578,
3.652492, -3.158245, 5.415578,
-3.037312, 3.254448, -6.087855,
3.652492, 3.254448, -6.087855,
-3.037312, 3.254448, 5.415578,
3.652492, 3.254448, 5.415578,
3.652492, -3.158245, -6.087855,
3.652492, 3.254448, -6.087855,
3.652492, -3.158245, 5.415578,
3.652492, 3.254448, 5.415578,
3.652492, -3.158245, -6.087855,
3.652492, -3.158245, 5.415578,
3.652492, 3.254448, -6.087855,
3.652492, 3.254448, 5.415578
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
var radius = 7.887837;
var distance = 35.09388;
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
mvMatrix.translate( -0.3075898, -0.04810154, 0.3361387 );
mvMatrix.scale( 1.274848, 1.329938, 0.7413859 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.09388);
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
pyraclofos<-read.table("pyraclofos.xyz")
```

```
## Error in read.table("pyraclofos.xyz"): no lines available in input
```

```r
x<-pyraclofos$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyraclofos' not found
```

```r
y<-pyraclofos$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyraclofos' not found
```

```r
z<-pyraclofos$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyraclofos' not found
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
-2.939888, -1.976208, -0.7340468, 0, 0, 1, 1, 1,
-2.663967, 2.677542, -2.080444, 1, 0, 0, 1, 1,
-2.507252, 0.4554126, -1.476524, 1, 0, 0, 1, 1,
-2.403767, -1.935016, -3.527151, 1, 0, 0, 1, 1,
-2.323245, -0.1605805, 0.4225456, 1, 0, 0, 1, 1,
-2.310921, -0.6759498, -1.873691, 1, 0, 0, 1, 1,
-2.200352, -1.012244, -0.9288856, 0, 0, 0, 1, 1,
-2.192049, -0.6424289, -2.329796, 0, 0, 0, 1, 1,
-2.17609, -1.180789, -1.427037, 0, 0, 0, 1, 1,
-2.145667, 0.7858426, -0.8026284, 0, 0, 0, 1, 1,
-2.13399, -0.636777, -1.910241, 0, 0, 0, 1, 1,
-2.132487, -0.2863399, -0.8795589, 0, 0, 0, 1, 1,
-2.104442, 0.8072337, -3.094427, 0, 0, 0, 1, 1,
-2.067054, 0.3934646, -0.07389344, 1, 1, 1, 1, 1,
-2.060094, -0.2348979, -4.275205, 1, 1, 1, 1, 1,
-2.044613, 1.578036, -1.457467, 1, 1, 1, 1, 1,
-2.021588, 0.5309479, 0.6088595, 1, 1, 1, 1, 1,
-2.011393, -0.261842, -0.8654562, 1, 1, 1, 1, 1,
-1.993464, 0.5871969, -1.238973, 1, 1, 1, 1, 1,
-1.964993, 1.376951, 1.328358, 1, 1, 1, 1, 1,
-1.913609, 0.7750741, -2.684731, 1, 1, 1, 1, 1,
-1.90849, 0.3620202, -1.829575, 1, 1, 1, 1, 1,
-1.907967, -1.009137, -2.382395, 1, 1, 1, 1, 1,
-1.885471, -0.7328478, -0.1920155, 1, 1, 1, 1, 1,
-1.879906, 0.115382, -2.454775, 1, 1, 1, 1, 1,
-1.863168, -0.5077454, -1.662052, 1, 1, 1, 1, 1,
-1.840356, -1.392073, -1.54202, 1, 1, 1, 1, 1,
-1.834155, -1.62576, -1.236536, 1, 1, 1, 1, 1,
-1.815495, 0.3900356, -1.385087, 0, 0, 1, 1, 1,
-1.815355, 1.359561, 0.007850083, 1, 0, 0, 1, 1,
-1.772967, -0.07375226, -0.2929954, 1, 0, 0, 1, 1,
-1.755723, -1.88169, -1.805446, 1, 0, 0, 1, 1,
-1.746382, -0.6265156, -0.7434217, 1, 0, 0, 1, 1,
-1.73526, 1.035367, -0.932198, 1, 0, 0, 1, 1,
-1.720464, -2.815467, -2.373301, 0, 0, 0, 1, 1,
-1.712869, 0.599259, -1.78005, 0, 0, 0, 1, 1,
-1.701831, 0.2126353, -3.49787, 0, 0, 0, 1, 1,
-1.700029, 0.07993913, -0.6836185, 0, 0, 0, 1, 1,
-1.685317, 0.2992338, -0.7056144, 0, 0, 0, 1, 1,
-1.679564, -0.03480807, -1.208466, 0, 0, 0, 1, 1,
-1.668502, -3.064856, -4.111175, 0, 0, 0, 1, 1,
-1.664112, -0.1232954, -3.169716, 1, 1, 1, 1, 1,
-1.631998, 0.3553852, -1.526687, 1, 1, 1, 1, 1,
-1.614109, 1.057452, -0.6908662, 1, 1, 1, 1, 1,
-1.612095, -1.558224, -2.793947, 1, 1, 1, 1, 1,
-1.567724, -0.3193645, -1.272412, 1, 1, 1, 1, 1,
-1.562801, -0.7946252, -0.183578, 1, 1, 1, 1, 1,
-1.557989, -0.3121586, -1.212385, 1, 1, 1, 1, 1,
-1.549969, -1.67144, -3.476735, 1, 1, 1, 1, 1,
-1.522247, 2.414028, -0.0703572, 1, 1, 1, 1, 1,
-1.522037, 0.7856902, -1.604421, 1, 1, 1, 1, 1,
-1.506044, 1.982429, -1.02626, 1, 1, 1, 1, 1,
-1.480282, 1.440503, -0.8260186, 1, 1, 1, 1, 1,
-1.467227, 0.5731167, -1.788549, 1, 1, 1, 1, 1,
-1.464122, -1.05876, 0.5153782, 1, 1, 1, 1, 1,
-1.461676, 1.430161, 1.228181, 1, 1, 1, 1, 1,
-1.459916, 0.03406088, -1.054565, 0, 0, 1, 1, 1,
-1.456024, -1.051265, -1.71306, 1, 0, 0, 1, 1,
-1.447672, -0.3124694, -1.604901, 1, 0, 0, 1, 1,
-1.444428, 0.5766742, -1.779768, 1, 0, 0, 1, 1,
-1.439827, 1.023393, -0.4084295, 1, 0, 0, 1, 1,
-1.437214, 0.7307484, 0.497319, 1, 0, 0, 1, 1,
-1.436804, -0.5894389, -2.656714, 0, 0, 0, 1, 1,
-1.421421, 0.1597647, -1.152092, 0, 0, 0, 1, 1,
-1.420105, -1.838598, -2.666231, 0, 0, 0, 1, 1,
-1.417429, 1.231617, 0.8569674, 0, 0, 0, 1, 1,
-1.414126, -0.2078029, -0.7053372, 0, 0, 0, 1, 1,
-1.408495, -0.8651809, -3.027319, 0, 0, 0, 1, 1,
-1.395708, 0.8084864, 0.5725231, 0, 0, 0, 1, 1,
-1.391101, -1.624008, -1.550388, 1, 1, 1, 1, 1,
-1.388749, -1.154858, -2.026345, 1, 1, 1, 1, 1,
-1.372249, -0.9437537, -0.8555791, 1, 1, 1, 1, 1,
-1.371697, 0.8265904, -1.908701, 1, 1, 1, 1, 1,
-1.357466, 0.5905042, -1.64548, 1, 1, 1, 1, 1,
-1.350486, 1.451491, -0.1143182, 1, 1, 1, 1, 1,
-1.349253, -2.165961, -1.250526, 1, 1, 1, 1, 1,
-1.318251, -0.5118008, -1.135232, 1, 1, 1, 1, 1,
-1.317959, 0.4111971, -0.6652114, 1, 1, 1, 1, 1,
-1.294901, 1.516569, -2.191829, 1, 1, 1, 1, 1,
-1.282543, 0.6844602, -0.2550889, 1, 1, 1, 1, 1,
-1.282128, -0.1395534, -1.366603, 1, 1, 1, 1, 1,
-1.280645, -1.493121, -2.549956, 1, 1, 1, 1, 1,
-1.279256, -0.1099648, -0.8843097, 1, 1, 1, 1, 1,
-1.273516, 0.9478418, -0.1655207, 1, 1, 1, 1, 1,
-1.269377, -0.1209674, -2.81835, 0, 0, 1, 1, 1,
-1.265808, -0.5070525, -1.247818, 1, 0, 0, 1, 1,
-1.265229, 0.02007124, -1.409994, 1, 0, 0, 1, 1,
-1.251746, -0.5092992, -2.491604, 1, 0, 0, 1, 1,
-1.247393, 0.3895739, -3.572178, 1, 0, 0, 1, 1,
-1.239542, 1.555646, -1.61183, 1, 0, 0, 1, 1,
-1.235469, -1.852781, -3.612128, 0, 0, 0, 1, 1,
-1.233738, 0.08067488, -2.133938, 0, 0, 0, 1, 1,
-1.231519, 1.447736, -0.3627029, 0, 0, 0, 1, 1,
-1.231161, 0.3313044, -2.266341, 0, 0, 0, 1, 1,
-1.227889, -0.4268866, -2.40599, 0, 0, 0, 1, 1,
-1.22069, -0.4522111, -1.238014, 0, 0, 0, 1, 1,
-1.216706, -0.4801995, -3.239209, 0, 0, 0, 1, 1,
-1.21395, 1.121578, -0.04330643, 1, 1, 1, 1, 1,
-1.210251, 1.120683, -1.701392, 1, 1, 1, 1, 1,
-1.204113, -0.342926, -0.3301382, 1, 1, 1, 1, 1,
-1.202211, 0.3767616, -2.304246, 1, 1, 1, 1, 1,
-1.200158, -0.123114, -2.555761, 1, 1, 1, 1, 1,
-1.198992, 0.797681, 0.2673503, 1, 1, 1, 1, 1,
-1.192637, 0.05624594, -0.4730818, 1, 1, 1, 1, 1,
-1.188973, -0.2406546, -1.738514, 1, 1, 1, 1, 1,
-1.183678, -0.835898, -2.264651, 1, 1, 1, 1, 1,
-1.17014, -2.037601, -3.678308, 1, 1, 1, 1, 1,
-1.164047, -0.971814, -2.802747, 1, 1, 1, 1, 1,
-1.149864, -2.001129, -1.491818, 1, 1, 1, 1, 1,
-1.141365, 0.5419536, -2.586484, 1, 1, 1, 1, 1,
-1.1294, 0.142973, -1.883086, 1, 1, 1, 1, 1,
-1.12907, 2.009077, -2.675799, 1, 1, 1, 1, 1,
-1.128381, -0.04956957, -1.765468, 0, 0, 1, 1, 1,
-1.127561, 0.8571233, -1.676654, 1, 0, 0, 1, 1,
-1.125705, 0.4033149, 0.8733023, 1, 0, 0, 1, 1,
-1.116575, -0.5561563, -3.35022, 1, 0, 0, 1, 1,
-1.114817, 1.377183, -1.094054, 1, 0, 0, 1, 1,
-1.108637, 0.2382703, -1.070294, 1, 0, 0, 1, 1,
-1.10816, 1.020082, -0.5081881, 0, 0, 0, 1, 1,
-1.093453, 1.378817, -0.2253805, 0, 0, 0, 1, 1,
-1.091684, -0.3330138, -2.977382, 0, 0, 0, 1, 1,
-1.089221, -1.894595, -1.694143, 0, 0, 0, 1, 1,
-1.086018, 0.3965783, -1.608555, 0, 0, 0, 1, 1,
-1.085662, -0.8197511, -2.891557, 0, 0, 0, 1, 1,
-1.078716, 1.110137, -1.134053, 0, 0, 0, 1, 1,
-1.078156, 0.7458986, -1.041366, 1, 1, 1, 1, 1,
-1.074949, -1.570851, -2.911769, 1, 1, 1, 1, 1,
-1.072331, 0.4941701, -0.4790832, 1, 1, 1, 1, 1,
-1.072038, 1.36991, 0.3898933, 1, 1, 1, 1, 1,
-1.071833, -1.641381, -1.839329, 1, 1, 1, 1, 1,
-1.070032, -0.05353898, -0.8100877, 1, 1, 1, 1, 1,
-1.069694, -1.037379, -2.929349, 1, 1, 1, 1, 1,
-1.069462, 0.1390445, -1.069276, 1, 1, 1, 1, 1,
-1.060435, 0.6454124, 0.7980437, 1, 1, 1, 1, 1,
-1.060254, -0.1102935, -2.574992, 1, 1, 1, 1, 1,
-1.057471, 0.589357, -1.575191, 1, 1, 1, 1, 1,
-1.056328, 0.1994618, -2.347994, 1, 1, 1, 1, 1,
-1.04981, 0.2541146, -2.278447, 1, 1, 1, 1, 1,
-1.041411, 0.4848039, -1.208989, 1, 1, 1, 1, 1,
-0.9972835, 1.220633, -2.680513, 1, 1, 1, 1, 1,
-0.9954923, 1.139792, 0.542069, 0, 0, 1, 1, 1,
-0.9954297, -1.197752, -1.063236, 1, 0, 0, 1, 1,
-0.9951035, -1.049936, -2.11377, 1, 0, 0, 1, 1,
-0.9913763, -0.06069982, -2.478564, 1, 0, 0, 1, 1,
-0.9833229, 1.749719, -1.593388, 1, 0, 0, 1, 1,
-0.9791867, 0.4127191, -0.2927969, 1, 0, 0, 1, 1,
-0.9763965, -0.8264916, -1.956242, 0, 0, 0, 1, 1,
-0.9730492, -0.09108453, -2.294915, 0, 0, 0, 1, 1,
-0.9614475, -0.6357222, -2.480638, 0, 0, 0, 1, 1,
-0.9579865, -0.7283146, -2.474453, 0, 0, 0, 1, 1,
-0.9541205, -0.07922115, -1.484782, 0, 0, 0, 1, 1,
-0.9523129, 0.4445407, -0.5907003, 0, 0, 0, 1, 1,
-0.950331, -0.7538112, -3.022973, 0, 0, 0, 1, 1,
-0.9441059, -1.672271, -3.816911, 1, 1, 1, 1, 1,
-0.9423447, 0.5744835, -0.7578969, 1, 1, 1, 1, 1,
-0.9372445, -0.4760956, -1.528315, 1, 1, 1, 1, 1,
-0.9360522, -0.5828468, -2.285293, 1, 1, 1, 1, 1,
-0.9313449, -0.5332837, -2.143111, 1, 1, 1, 1, 1,
-0.927415, 0.233069, -0.9763469, 1, 1, 1, 1, 1,
-0.9270865, -1.313141, -1.2164, 1, 1, 1, 1, 1,
-0.9238563, -1.734867, -2.648186, 1, 1, 1, 1, 1,
-0.9118735, 1.721899, 0.2938993, 1, 1, 1, 1, 1,
-0.9069242, 0.9896134, -1.025025, 1, 1, 1, 1, 1,
-0.9036482, -1.908728, -3.994722, 1, 1, 1, 1, 1,
-0.9029522, 0.5241648, -2.098039, 1, 1, 1, 1, 1,
-0.9017422, 0.6361641, -1.611644, 1, 1, 1, 1, 1,
-0.8987964, 0.9021499, 0.1034583, 1, 1, 1, 1, 1,
-0.8946229, 0.09589295, -0.6088746, 1, 1, 1, 1, 1,
-0.8890501, -1.003943, -1.192819, 0, 0, 1, 1, 1,
-0.8876742, 0.1338461, -0.2805344, 1, 0, 0, 1, 1,
-0.8847582, -0.9150423, -1.914708, 1, 0, 0, 1, 1,
-0.874415, 1.497313, -0.875178, 1, 0, 0, 1, 1,
-0.8720859, -1.796245, -2.117281, 1, 0, 0, 1, 1,
-0.8700187, 0.1879482, -2.248413, 1, 0, 0, 1, 1,
-0.8684083, -0.9398408, -2.733445, 0, 0, 0, 1, 1,
-0.8646716, 0.07312475, -1.078074, 0, 0, 0, 1, 1,
-0.8629986, -0.7774645, -3.246622, 0, 0, 0, 1, 1,
-0.8589318, -0.07207683, -0.1231616, 0, 0, 0, 1, 1,
-0.8577998, -0.6417506, -3.017548, 0, 0, 0, 1, 1,
-0.8563402, 0.2254818, 0.4480759, 0, 0, 0, 1, 1,
-0.8449568, 0.9315144, 0.5878187, 0, 0, 0, 1, 1,
-0.836817, 2.328289, 1.090708, 1, 1, 1, 1, 1,
-0.8360718, 3.110213, -0.6695025, 1, 1, 1, 1, 1,
-0.8255256, -0.2092814, -1.254397, 1, 1, 1, 1, 1,
-0.8170207, -0.8351285, -1.088488, 1, 1, 1, 1, 1,
-0.812136, -0.5234814, -1.060019, 1, 1, 1, 1, 1,
-0.810563, 0.2501267, -2.490455, 1, 1, 1, 1, 1,
-0.8086243, -0.5715153, -2.554223, 1, 1, 1, 1, 1,
-0.8003229, -1.193498, -1.559618, 1, 1, 1, 1, 1,
-0.7976831, -0.6332499, -2.410174, 1, 1, 1, 1, 1,
-0.7925451, 0.6300844, -1.149053, 1, 1, 1, 1, 1,
-0.7877657, -2.765012, -3.221783, 1, 1, 1, 1, 1,
-0.7873498, -0.2777207, -1.461567, 1, 1, 1, 1, 1,
-0.7821289, 1.346319, -0.09663463, 1, 1, 1, 1, 1,
-0.7764241, 1.038843, -0.9807383, 1, 1, 1, 1, 1,
-0.7736748, -1.421748, -2.178905, 1, 1, 1, 1, 1,
-0.7698071, 0.9737428, 0.4899969, 0, 0, 1, 1, 1,
-0.7689729, 0.3613802, -3.102824, 1, 0, 0, 1, 1,
-0.7620416, -1.018615, -2.409311, 1, 0, 0, 1, 1,
-0.7536576, -0.7354195, -3.582181, 1, 0, 0, 1, 1,
-0.7389004, -0.485152, -3.277592, 1, 0, 0, 1, 1,
-0.7356495, 0.4767691, 0.03743371, 1, 0, 0, 1, 1,
-0.7227344, 0.1003644, -1.381421, 0, 0, 0, 1, 1,
-0.721796, -1.103808, -3.68879, 0, 0, 0, 1, 1,
-0.7187361, -0.374654, -0.6240173, 0, 0, 0, 1, 1,
-0.716907, -1.665645, -2.314696, 0, 0, 0, 1, 1,
-0.715885, -1.743613, -1.983559, 0, 0, 0, 1, 1,
-0.7151216, 0.7553749, 0.07193066, 0, 0, 0, 1, 1,
-0.7128592, -0.9473104, -2.568317, 0, 0, 0, 1, 1,
-0.7125917, 0.1253052, 0.6183649, 1, 1, 1, 1, 1,
-0.7089593, -2.793233, -4.589348, 1, 1, 1, 1, 1,
-0.7082676, -1.700047, -3.737111, 1, 1, 1, 1, 1,
-0.7023832, 0.6824658, -0.6541805, 1, 1, 1, 1, 1,
-0.7010177, -0.06241212, -3.130464, 1, 1, 1, 1, 1,
-0.7007598, 0.5662771, -1.195782, 1, 1, 1, 1, 1,
-0.6983518, -0.1504248, -0.7214092, 1, 1, 1, 1, 1,
-0.6974638, 0.02577484, -0.1833299, 1, 1, 1, 1, 1,
-0.6972607, 0.1842171, -3.64786, 1, 1, 1, 1, 1,
-0.6951135, 1.274392, 0.1957168, 1, 1, 1, 1, 1,
-0.6945256, 1.013609, -1.336778, 1, 1, 1, 1, 1,
-0.6927058, 2.252771, 0.2026548, 1, 1, 1, 1, 1,
-0.6875897, -1.43456, -2.382895, 1, 1, 1, 1, 1,
-0.6866869, -0.5752358, -3.284308, 1, 1, 1, 1, 1,
-0.684598, -1.078209, -2.014691, 1, 1, 1, 1, 1,
-0.6845952, -0.4639528, -1.448555, 0, 0, 1, 1, 1,
-0.6845699, 1.103936, 0.001538937, 1, 0, 0, 1, 1,
-0.6793143, 1.65229, -0.3153151, 1, 0, 0, 1, 1,
-0.6784403, -0.5328598, -2.162498, 1, 0, 0, 1, 1,
-0.674949, -0.3649048, -2.419189, 1, 0, 0, 1, 1,
-0.6731455, 0.3942783, -1.939488, 1, 0, 0, 1, 1,
-0.6700584, -0.06420218, -0.2383856, 0, 0, 0, 1, 1,
-0.6697341, 0.5746563, 0.04993919, 0, 0, 0, 1, 1,
-0.6670146, 0.388373, -0.3958957, 0, 0, 0, 1, 1,
-0.6660848, -0.8018332, -2.05631, 0, 0, 0, 1, 1,
-0.66494, -0.2616599, -3.561524, 0, 0, 0, 1, 1,
-0.6548786, -0.2853644, -2.977304, 0, 0, 0, 1, 1,
-0.654183, -0.3721426, -4.210362, 0, 0, 0, 1, 1,
-0.6513246, 0.2423353, 0.9342526, 1, 1, 1, 1, 1,
-0.6447807, -0.02105989, -2.1713, 1, 1, 1, 1, 1,
-0.6401849, -0.2987735, -2.797297, 1, 1, 1, 1, 1,
-0.6383021, 1.325852, -1.468814, 1, 1, 1, 1, 1,
-0.6362187, 0.4952058, 0.2103321, 1, 1, 1, 1, 1,
-0.634627, -1.121723, -4.100599, 1, 1, 1, 1, 1,
-0.6328546, 1.267349, -1.235479, 1, 1, 1, 1, 1,
-0.6224403, 0.1953796, -0.6417493, 1, 1, 1, 1, 1,
-0.6151127, -0.7825876, -3.856329, 1, 1, 1, 1, 1,
-0.6131786, 0.08762218, -1.837738, 1, 1, 1, 1, 1,
-0.6103433, 0.7574838, 0.992032, 1, 1, 1, 1, 1,
-0.6089929, 0.2667048, -0.4313516, 1, 1, 1, 1, 1,
-0.6078686, 0.7933192, 0.1461352, 1, 1, 1, 1, 1,
-0.6004303, 1.452517, 0.05508681, 1, 1, 1, 1, 1,
-0.5971673, 0.4772528, -1.614698, 1, 1, 1, 1, 1,
-0.5948038, -0.5543332, -2.081024, 0, 0, 1, 1, 1,
-0.5918588, 1.155679, -0.5300868, 1, 0, 0, 1, 1,
-0.5899267, 0.3176166, -2.109718, 1, 0, 0, 1, 1,
-0.5887035, 0.6086653, 0.1585337, 1, 0, 0, 1, 1,
-0.5877643, -0.7326033, -2.445178, 1, 0, 0, 1, 1,
-0.5862742, 0.03084215, -0.9803283, 1, 0, 0, 1, 1,
-0.5817066, -0.3909495, -1.961782, 0, 0, 0, 1, 1,
-0.5787033, 1.635259, -1.253281, 0, 0, 0, 1, 1,
-0.5776187, 0.3546733, -3.466436, 0, 0, 0, 1, 1,
-0.5749691, -0.02451618, -1.941068, 0, 0, 0, 1, 1,
-0.5749075, 0.9459188, 0.1955384, 0, 0, 0, 1, 1,
-0.5735702, -0.3446986, -1.604924, 0, 0, 0, 1, 1,
-0.5679827, 0.9415401, -0.6992294, 0, 0, 0, 1, 1,
-0.5620909, 0.8446212, -0.6825417, 1, 1, 1, 1, 1,
-0.5619828, -0.4678253, -0.1065059, 1, 1, 1, 1, 1,
-0.5593897, 0.2429831, -1.523336, 1, 1, 1, 1, 1,
-0.5576898, -0.06905364, -1.809917, 1, 1, 1, 1, 1,
-0.5568939, -0.3585814, -2.71565, 1, 1, 1, 1, 1,
-0.5568259, -2.215489, -2.583987, 1, 1, 1, 1, 1,
-0.5476518, 0.009747434, 1.530329, 1, 1, 1, 1, 1,
-0.5461046, 0.8226284, 0.1904117, 1, 1, 1, 1, 1,
-0.541669, 0.1149036, 0.8059189, 1, 1, 1, 1, 1,
-0.5401053, -1.558506, -3.685579, 1, 1, 1, 1, 1,
-0.5378498, -1.937729, -3.338283, 1, 1, 1, 1, 1,
-0.5363466, -0.07974076, -1.629907, 1, 1, 1, 1, 1,
-0.534529, -0.1324281, -1.22765, 1, 1, 1, 1, 1,
-0.5228882, 3.084784, 0.8940203, 1, 1, 1, 1, 1,
-0.5208804, 0.1776352, -1.910221, 1, 1, 1, 1, 1,
-0.5199926, -0.2725168, -1.020431, 0, 0, 1, 1, 1,
-0.5153438, 0.5417953, 1.117977, 1, 0, 0, 1, 1,
-0.5108103, -0.6348677, -3.064457, 1, 0, 0, 1, 1,
-0.5073482, -0.03711673, -1.158207, 1, 0, 0, 1, 1,
-0.5013372, -0.4447174, -2.935143, 1, 0, 0, 1, 1,
-0.5009247, 0.5500471, -0.9751418, 1, 0, 0, 1, 1,
-0.4941724, 0.1006835, -1.798551, 0, 0, 0, 1, 1,
-0.4921024, 0.9143181, -1.891389, 0, 0, 0, 1, 1,
-0.491325, 2.579696, -0.7293164, 0, 0, 0, 1, 1,
-0.489373, -0.8264976, -4.834246, 0, 0, 0, 1, 1,
-0.4882989, 0.721006, -0.3171588, 0, 0, 0, 1, 1,
-0.4871346, 0.4669915, 0.1241552, 0, 0, 0, 1, 1,
-0.4855547, 1.331719, -1.29033, 0, 0, 0, 1, 1,
-0.4848969, 0.8513827, -0.5634187, 1, 1, 1, 1, 1,
-0.4848293, -0.6552448, -4.509531, 1, 1, 1, 1, 1,
-0.4823378, 1.320857, -0.1020099, 1, 1, 1, 1, 1,
-0.4812813, -0.02029736, -0.2598836, 1, 1, 1, 1, 1,
-0.4796825, -0.5389474, -2.071017, 1, 1, 1, 1, 1,
-0.4777803, -0.5953571, -1.147446, 1, 1, 1, 1, 1,
-0.4773813, 0.04243819, -0.2992702, 1, 1, 1, 1, 1,
-0.4758902, 0.2374996, -2.08202, 1, 1, 1, 1, 1,
-0.471186, 0.5117629, -2.963773, 1, 1, 1, 1, 1,
-0.4612835, 0.3038665, -1.261475, 1, 1, 1, 1, 1,
-0.4580261, -1.055674, -4.595625, 1, 1, 1, 1, 1,
-0.4574628, -1.030786, -2.714863, 1, 1, 1, 1, 1,
-0.456761, -0.5590428, -1.843544, 1, 1, 1, 1, 1,
-0.4540875, -1.049504, -1.967752, 1, 1, 1, 1, 1,
-0.4488683, 0.4778693, -1.402775, 1, 1, 1, 1, 1,
-0.4468055, 1.613046, -1.046204, 0, 0, 1, 1, 1,
-0.4462784, -1.47921, -2.527561, 1, 0, 0, 1, 1,
-0.4455377, 0.3429671, -1.641698, 1, 0, 0, 1, 1,
-0.4444062, 0.1482028, -0.6589046, 1, 0, 0, 1, 1,
-0.4422348, 0.3519284, -1.72436, 1, 0, 0, 1, 1,
-0.4421823, 0.9612458, -1.868097, 1, 0, 0, 1, 1,
-0.4421647, -0.4507054, -2.893977, 0, 0, 0, 1, 1,
-0.4366937, -0.1981525, -0.5715791, 0, 0, 0, 1, 1,
-0.4353764, -0.2985483, -2.46831, 0, 0, 0, 1, 1,
-0.4220833, 1.787568, 0.8034914, 0, 0, 0, 1, 1,
-0.4166629, 1.542003, 0.3001501, 0, 0, 0, 1, 1,
-0.4159071, -1.161411, -1.690928, 0, 0, 0, 1, 1,
-0.4128304, -0.385769, -2.231982, 0, 0, 0, 1, 1,
-0.4067818, 2.411787, -3.266273, 1, 1, 1, 1, 1,
-0.4017153, -1.187311, -1.49411, 1, 1, 1, 1, 1,
-0.400559, 0.08916612, 0.2658972, 1, 1, 1, 1, 1,
-0.4001597, 1.428528, 1.282387, 1, 1, 1, 1, 1,
-0.3966342, -0.02950388, -2.061533, 1, 1, 1, 1, 1,
-0.3934629, 1.176485, 0.6526158, 1, 1, 1, 1, 1,
-0.3866196, -1.00015, -2.564105, 1, 1, 1, 1, 1,
-0.3863411, -1.287369, -3.768371, 1, 1, 1, 1, 1,
-0.378298, 1.543089, 0.5794327, 1, 1, 1, 1, 1,
-0.3671459, 1.198643, -2.957121, 1, 1, 1, 1, 1,
-0.3666993, 0.6071009, -0.5930777, 1, 1, 1, 1, 1,
-0.3662163, -0.9722817, -3.513965, 1, 1, 1, 1, 1,
-0.365112, -0.1554473, -2.577234, 1, 1, 1, 1, 1,
-0.364172, 0.5109336, -2.109017, 1, 1, 1, 1, 1,
-0.3632953, -0.4832554, -2.771298, 1, 1, 1, 1, 1,
-0.3623192, 0.9451472, -0.6931638, 0, 0, 1, 1, 1,
-0.3592919, 1.065597, -0.4023154, 1, 0, 0, 1, 1,
-0.3570581, -0.6728022, -2.513139, 1, 0, 0, 1, 1,
-0.3557658, 1.054199, -0.8217763, 1, 0, 0, 1, 1,
-0.3523901, 0.0828639, -0.3017448, 1, 0, 0, 1, 1,
-0.3487799, 1.268373, 0.6769272, 1, 0, 0, 1, 1,
-0.3449165, -0.7432035, -1.686536, 0, 0, 0, 1, 1,
-0.3427868, 1.071144, -1.698695, 0, 0, 0, 1, 1,
-0.3373627, 0.8350339, 0.7408334, 0, 0, 0, 1, 1,
-0.3334423, -0.116174, -3.100849, 0, 0, 0, 1, 1,
-0.3324146, -0.8955294, -2.844749, 0, 0, 0, 1, 1,
-0.3315242, 0.4753371, -0.6561475, 0, 0, 0, 1, 1,
-0.330864, 0.9345516, 0.4262877, 0, 0, 0, 1, 1,
-0.327065, 0.7090478, 0.7067412, 1, 1, 1, 1, 1,
-0.3258213, 0.6297222, -1.614195, 1, 1, 1, 1, 1,
-0.3235449, -1.517808, -2.248391, 1, 1, 1, 1, 1,
-0.3196858, -0.01540704, -0.7250898, 1, 1, 1, 1, 1,
-0.3154035, -1.986366, -2.793191, 1, 1, 1, 1, 1,
-0.3146264, 1.430347, 0.06499819, 1, 1, 1, 1, 1,
-0.3103127, -0.349842, -1.156623, 1, 1, 1, 1, 1,
-0.310134, 0.8907045, 0.4827519, 1, 1, 1, 1, 1,
-0.3096333, 0.5357663, 0.06446704, 1, 1, 1, 1, 1,
-0.3094206, -0.6793358, -2.729077, 1, 1, 1, 1, 1,
-0.303618, 0.7854691, -1.44911, 1, 1, 1, 1, 1,
-0.3025168, 0.2982358, -0.1594996, 1, 1, 1, 1, 1,
-0.2997987, -1.554792, -0.7232885, 1, 1, 1, 1, 1,
-0.296141, 0.287523, -1.284869, 1, 1, 1, 1, 1,
-0.2898041, 1.74451, 0.9013695, 1, 1, 1, 1, 1,
-0.2890362, 0.1341395, -1.681495, 0, 0, 1, 1, 1,
-0.2873684, -0.7077296, -2.142344, 1, 0, 0, 1, 1,
-0.2782272, -0.1600267, -2.118155, 1, 0, 0, 1, 1,
-0.2776048, 0.7882669, -1.138696, 1, 0, 0, 1, 1,
-0.2774661, -0.5888237, -3.275923, 1, 0, 0, 1, 1,
-0.2768279, 1.553352, 0.4154571, 1, 0, 0, 1, 1,
-0.2766111, -0.4952002, -3.850537, 0, 0, 0, 1, 1,
-0.274348, -0.5447038, -2.951591, 0, 0, 0, 1, 1,
-0.2711158, 0.509604, 0.7256107, 0, 0, 0, 1, 1,
-0.2688442, -0.1736547, -1.710493, 0, 0, 0, 1, 1,
-0.2626529, -1.888274, -3.760952, 0, 0, 0, 1, 1,
-0.2624069, 0.2378851, 0.3605935, 0, 0, 0, 1, 1,
-0.2573237, 0.2786922, 0.8781654, 0, 0, 0, 1, 1,
-0.2561031, 0.4120829, 9.778814e-05, 1, 1, 1, 1, 1,
-0.2559189, -0.3069671, -2.966699, 1, 1, 1, 1, 1,
-0.2539857, -0.8729322, -3.533772, 1, 1, 1, 1, 1,
-0.2523902, -0.02594483, -2.133955, 1, 1, 1, 1, 1,
-0.2501398, -1.283318, -2.892074, 1, 1, 1, 1, 1,
-0.2485399, -1.857964, -1.843686, 1, 1, 1, 1, 1,
-0.2471627, -0.1821628, -3.644805, 1, 1, 1, 1, 1,
-0.2449428, -0.1944302, -3.034058, 1, 1, 1, 1, 1,
-0.243957, 1.258234, -0.4507283, 1, 1, 1, 1, 1,
-0.2431541, 0.6896801, 0.2402094, 1, 1, 1, 1, 1,
-0.2397686, 1.051532, 1.727981, 1, 1, 1, 1, 1,
-0.2385717, -0.8219695, -2.455036, 1, 1, 1, 1, 1,
-0.2377471, -0.4781535, -2.259186, 1, 1, 1, 1, 1,
-0.2367987, -0.6973024, -1.037961, 1, 1, 1, 1, 1,
-0.2350134, 1.183183, 0.341528, 1, 1, 1, 1, 1,
-0.2298983, -0.1135516, -1.857005, 0, 0, 1, 1, 1,
-0.2291348, -1.501199, -1.71426, 1, 0, 0, 1, 1,
-0.2266561, 1.910278, 0.9153651, 1, 0, 0, 1, 1,
-0.2250723, 0.6938083, -0.2327999, 1, 0, 0, 1, 1,
-0.224514, -0.006309545, -2.016536, 1, 0, 0, 1, 1,
-0.2234844, 0.4231095, -1.167636, 1, 0, 0, 1, 1,
-0.2227985, 1.033166, 0.523841, 0, 0, 0, 1, 1,
-0.2225326, 1.190688, -1.566378, 0, 0, 0, 1, 1,
-0.2207829, -1.828854, -3.016018, 0, 0, 0, 1, 1,
-0.2206766, -0.2867236, -2.953102, 0, 0, 0, 1, 1,
-0.2162667, -0.1403797, -1.996109, 0, 0, 0, 1, 1,
-0.2143331, 0.4765767, -0.4088308, 0, 0, 0, 1, 1,
-0.2124157, 0.5442337, 0.1815691, 0, 0, 0, 1, 1,
-0.212173, -0.8954556, -3.13059, 1, 1, 1, 1, 1,
-0.2072329, -1.73497, -3.98255, 1, 1, 1, 1, 1,
-0.2038825, 1.084936, 1.630075, 1, 1, 1, 1, 1,
-0.2028627, 0.7269937, -0.1141008, 1, 1, 1, 1, 1,
-0.202789, -1.671258, -3.875744, 1, 1, 1, 1, 1,
-0.2017932, 0.5614462, -0.0199465, 1, 1, 1, 1, 1,
-0.1893124, -0.3899702, -2.511044, 1, 1, 1, 1, 1,
-0.1891402, -1.210708, -4.427541, 1, 1, 1, 1, 1,
-0.1865575, -0.7899248, -5.92033, 1, 1, 1, 1, 1,
-0.1822883, -1.047, -4.135762, 1, 1, 1, 1, 1,
-0.1795133, -0.4641503, -0.1516872, 1, 1, 1, 1, 1,
-0.1748222, 1.70086, -1.960582, 1, 1, 1, 1, 1,
-0.1724371, -1.285414, -5.152944, 1, 1, 1, 1, 1,
-0.1688493, -2.176035, -3.67955, 1, 1, 1, 1, 1,
-0.1688161, 0.41034, -0.4224178, 1, 1, 1, 1, 1,
-0.1678821, -0.3293399, -1.563694, 0, 0, 1, 1, 1,
-0.1636528, -1.334672, -2.717844, 1, 0, 0, 1, 1,
-0.1523879, -0.7318747, -2.527384, 1, 0, 0, 1, 1,
-0.1501664, 0.2017371, 0.7687134, 1, 0, 0, 1, 1,
-0.1489167, -1.130138, -3.096149, 1, 0, 0, 1, 1,
-0.1466437, -0.381717, -4.921514, 1, 0, 0, 1, 1,
-0.1463477, -2.041242, -1.852816, 0, 0, 0, 1, 1,
-0.1458843, 1.93707, -0.7795276, 0, 0, 0, 1, 1,
-0.1444963, -0.1100562, -1.066732, 0, 0, 0, 1, 1,
-0.1431034, -0.7134229, -3.133863, 0, 0, 0, 1, 1,
-0.1407723, -1.165251, -0.8562487, 0, 0, 0, 1, 1,
-0.1396216, -0.5344643, -2.953894, 0, 0, 0, 1, 1,
-0.1395068, 1.563518, 1.510956, 0, 0, 0, 1, 1,
-0.1390705, 0.5612825, -0.1997482, 1, 1, 1, 1, 1,
-0.1389475, -0.9848852, -4.267421, 1, 1, 1, 1, 1,
-0.1375824, 0.2955317, -0.2088174, 1, 1, 1, 1, 1,
-0.1369212, -0.7029647, -2.326319, 1, 1, 1, 1, 1,
-0.1357839, -1.73137, -3.496276, 1, 1, 1, 1, 1,
-0.1198158, -2.544624, -4.524625, 1, 1, 1, 1, 1,
-0.1121773, -0.4580269, -2.574079, 1, 1, 1, 1, 1,
-0.1112451, -0.2113797, -0.7519017, 1, 1, 1, 1, 1,
-0.1060268, 0.3897981, -1.599233, 1, 1, 1, 1, 1,
-0.104466, -0.05335737, -2.634666, 1, 1, 1, 1, 1,
-0.1017424, 0.4888844, 0.5339178, 1, 1, 1, 1, 1,
-0.09477313, -1.546774, -3.931278, 1, 1, 1, 1, 1,
-0.09080146, 0.1474248, 1.753038, 1, 1, 1, 1, 1,
-0.08693139, -1.607122, -4.34096, 1, 1, 1, 1, 1,
-0.08598707, 0.06535783, -1.593329, 1, 1, 1, 1, 1,
-0.08318113, 0.1564513, -0.1540963, 0, 0, 1, 1, 1,
-0.0813342, 0.8543886, 0.5080028, 1, 0, 0, 1, 1,
-0.07895236, -0.05799289, -1.686494, 1, 0, 0, 1, 1,
-0.07865449, -0.938185, -2.116101, 1, 0, 0, 1, 1,
-0.07859543, 1.350668, 0.1344227, 1, 0, 0, 1, 1,
-0.07419708, -1.029627, -4.0979, 1, 0, 0, 1, 1,
-0.07342617, 0.519401, 0.541285, 0, 0, 0, 1, 1,
-0.07264345, 0.110925, -2.207047, 0, 0, 0, 1, 1,
-0.0708636, -0.3466906, -1.315716, 0, 0, 0, 1, 1,
-0.07002567, -0.2893302, -3.198889, 0, 0, 0, 1, 1,
-0.06587992, 0.5084312, -0.229628, 0, 0, 0, 1, 1,
-0.06219997, 0.4048868, 0.1650977, 0, 0, 0, 1, 1,
-0.05242606, 0.5699685, -1.015005, 0, 0, 0, 1, 1,
-0.04830997, 0.5607573, -0.2396324, 1, 1, 1, 1, 1,
-0.03955161, -0.3693283, -2.092284, 1, 1, 1, 1, 1,
-0.03892653, 0.2980816, -0.8728473, 1, 1, 1, 1, 1,
-0.03876313, -0.8985168, -2.678626, 1, 1, 1, 1, 1,
-0.03679703, -0.5343395, -2.354175, 1, 1, 1, 1, 1,
-0.03418103, -0.7656798, -2.526734, 1, 1, 1, 1, 1,
-0.03126997, -0.2005975, -3.699045, 1, 1, 1, 1, 1,
-0.03120216, -0.1757856, -2.794072, 1, 1, 1, 1, 1,
-0.02911704, 0.547564, -0.5115348, 1, 1, 1, 1, 1,
-0.02085504, 1.412749, 0.8527917, 1, 1, 1, 1, 1,
-0.01842166, -0.8423628, -2.952436, 1, 1, 1, 1, 1,
-0.01830391, -1.188895, -4.157614, 1, 1, 1, 1, 1,
-0.01736586, -0.5697097, -3.845123, 1, 1, 1, 1, 1,
-0.01664193, 0.2588775, 0.8609597, 1, 1, 1, 1, 1,
-0.01162786, 0.07462209, 0.004950143, 1, 1, 1, 1, 1,
-0.009132701, -1.057768, -3.722539, 0, 0, 1, 1, 1,
-0.007540652, 1.133901, -1.697279, 1, 0, 0, 1, 1,
-0.006553477, -0.1041203, -2.987509, 1, 0, 0, 1, 1,
0.001205079, -0.5599594, 2.795239, 1, 0, 0, 1, 1,
0.001300327, -0.4516041, 2.144629, 1, 0, 0, 1, 1,
0.006659675, -0.6916402, 2.977645, 1, 0, 0, 1, 1,
0.007369895, 0.7954925, -0.4447873, 0, 0, 0, 1, 1,
0.008091009, 0.003209986, -0.927152, 0, 0, 0, 1, 1,
0.01531572, 1.437344, 0.2145091, 0, 0, 0, 1, 1,
0.02212896, 0.7482277, -0.1071193, 0, 0, 0, 1, 1,
0.02491486, 1.406709, -2.008782, 0, 0, 0, 1, 1,
0.02781018, -0.733354, 2.788332, 0, 0, 0, 1, 1,
0.02904811, -0.214395, 2.677876, 0, 0, 0, 1, 1,
0.03164281, 0.02130754, -0.3425927, 1, 1, 1, 1, 1,
0.0328683, 0.7618794, 0.6739113, 1, 1, 1, 1, 1,
0.04500084, -1.265571, 2.070073, 1, 1, 1, 1, 1,
0.04567612, -1.606615, 2.822442, 1, 1, 1, 1, 1,
0.04966425, 0.7262467, 0.1138776, 1, 1, 1, 1, 1,
0.06042669, -1.326096, 4.417222, 1, 1, 1, 1, 1,
0.06479028, 0.3974749, -0.2041595, 1, 1, 1, 1, 1,
0.06663698, -2.384019, 2.424046, 1, 1, 1, 1, 1,
0.07362001, -0.6085204, 4.378378, 1, 1, 1, 1, 1,
0.07423428, -0.7590488, 2.786574, 1, 1, 1, 1, 1,
0.07621951, 0.3460365, -0.07666138, 1, 1, 1, 1, 1,
0.07680137, -0.5810806, 1.036015, 1, 1, 1, 1, 1,
0.08035095, -1.128815, 4.256141, 1, 1, 1, 1, 1,
0.08075375, 1.190277, -0.7881235, 1, 1, 1, 1, 1,
0.08265501, -0.3295953, 3.89424, 1, 1, 1, 1, 1,
0.08887038, -1.777864, 3.916313, 0, 0, 1, 1, 1,
0.08971912, -0.9361587, 2.386616, 1, 0, 0, 1, 1,
0.09095712, -0.07209663, 2.112127, 1, 0, 0, 1, 1,
0.09298467, -1.056213, 1.948193, 1, 0, 0, 1, 1,
0.1013323, 1.581271, 0.004487411, 1, 0, 0, 1, 1,
0.1019338, -0.9650367, 3.002879, 1, 0, 0, 1, 1,
0.1019617, -0.5113773, 0.8005662, 0, 0, 0, 1, 1,
0.1020379, -0.9886, 3.66635, 0, 0, 0, 1, 1,
0.1026239, -1.235821, 2.402038, 0, 0, 0, 1, 1,
0.1029956, -0.6860257, 3.017307, 0, 0, 0, 1, 1,
0.1049484, -0.827187, 3.330294, 0, 0, 0, 1, 1,
0.1070344, -1.449517, 2.502669, 0, 0, 0, 1, 1,
0.1092932, 2.628611, 1.026789, 0, 0, 0, 1, 1,
0.1130467, -0.5207155, 4.330086, 1, 1, 1, 1, 1,
0.1131606, 0.7445549, 0.6953564, 1, 1, 1, 1, 1,
0.1141507, 1.54641, -0.5373929, 1, 1, 1, 1, 1,
0.1156841, 0.03445831, 1.570904, 1, 1, 1, 1, 1,
0.1215167, -0.6930953, 3.211327, 1, 1, 1, 1, 1,
0.1226545, -0.2184903, 1.78827, 1, 1, 1, 1, 1,
0.1227102, -0.5043617, 4.297649, 1, 1, 1, 1, 1,
0.1245966, -0.8045493, 5.078191, 1, 1, 1, 1, 1,
0.1254409, 0.6787429, -1.228765, 1, 1, 1, 1, 1,
0.1265481, -2.593827, 4.52732, 1, 1, 1, 1, 1,
0.1267419, -0.5259974, 1.298265, 1, 1, 1, 1, 1,
0.1274026, -0.2242837, 1.822956, 1, 1, 1, 1, 1,
0.1328504, -0.9595113, 3.273862, 1, 1, 1, 1, 1,
0.1330323, -1.851532, 4.449296, 1, 1, 1, 1, 1,
0.1350857, -0.6968299, 4.196677, 1, 1, 1, 1, 1,
0.1367787, -0.3334551, 1.451855, 0, 0, 1, 1, 1,
0.1391153, 1.011069, -0.3859492, 1, 0, 0, 1, 1,
0.1399077, -0.2749927, 1.908792, 1, 0, 0, 1, 1,
0.1402666, -0.2633793, 3.856446, 1, 0, 0, 1, 1,
0.1410348, -0.172959, 3.117253, 1, 0, 0, 1, 1,
0.1423494, -2.169581, 3.26976, 1, 0, 0, 1, 1,
0.1490873, -0.9688944, 3.285368, 0, 0, 0, 1, 1,
0.1499958, -1.420415, 3.377524, 0, 0, 0, 1, 1,
0.1522382, 0.3333222, 0.3511185, 0, 0, 0, 1, 1,
0.1529694, 1.245802, -1.275318, 0, 0, 0, 1, 1,
0.1566795, -1.140195, 3.455667, 0, 0, 0, 1, 1,
0.157148, 1.600443, 1.207666, 0, 0, 0, 1, 1,
0.1625533, -1.601762, 2.547383, 0, 0, 0, 1, 1,
0.1631847, 0.5914372, 0.06776422, 1, 1, 1, 1, 1,
0.1638989, -1.366744, 3.373279, 1, 1, 1, 1, 1,
0.1653342, 2.717161, -0.5308611, 1, 1, 1, 1, 1,
0.1664385, -0.4771484, 2.640289, 1, 1, 1, 1, 1,
0.1684569, 1.0625, 0.8238016, 1, 1, 1, 1, 1,
0.1697162, -0.1462745, 2.5368, 1, 1, 1, 1, 1,
0.170102, 0.2640507, 2.103923, 1, 1, 1, 1, 1,
0.1724634, -0.1070573, 2.162187, 1, 1, 1, 1, 1,
0.1744643, -2.2137, 2.11104, 1, 1, 1, 1, 1,
0.176473, 0.8826196, -0.5413465, 1, 1, 1, 1, 1,
0.1786336, 0.1994111, 2.246265, 1, 1, 1, 1, 1,
0.1789686, 1.055348, 0.3011121, 1, 1, 1, 1, 1,
0.1801681, 0.1773251, 1.618069, 1, 1, 1, 1, 1,
0.1829933, -1.17011, 4.653712, 1, 1, 1, 1, 1,
0.1845586, -0.1575014, 2.674492, 1, 1, 1, 1, 1,
0.1873301, 0.1804346, 1.857794, 0, 0, 1, 1, 1,
0.1881291, -0.5875935, 1.996865, 1, 0, 0, 1, 1,
0.1889922, -0.04265934, 0.5218004, 1, 0, 0, 1, 1,
0.1895345, 0.8873636, 2.17309, 1, 0, 0, 1, 1,
0.1939388, 1.6602, 2.322577, 1, 0, 0, 1, 1,
0.1939499, 1.347626, 0.8411496, 1, 0, 0, 1, 1,
0.194024, 0.789099, 1.232915, 0, 0, 0, 1, 1,
0.1979441, -0.2180183, 4.286563, 0, 0, 0, 1, 1,
0.1987576, 0.2371756, 0.2986432, 0, 0, 0, 1, 1,
0.1993673, 0.2820967, -0.159825, 0, 0, 0, 1, 1,
0.2017847, 1.155295, 2.097342, 0, 0, 0, 1, 1,
0.2046358, -0.2668628, 3.47898, 0, 0, 0, 1, 1,
0.2077609, -0.111528, 2.916804, 0, 0, 0, 1, 1,
0.2134963, 1.034447, 0.737052, 1, 1, 1, 1, 1,
0.2163296, 0.4837145, 0.2829632, 1, 1, 1, 1, 1,
0.2182254, 0.9784124, 0.8484302, 1, 1, 1, 1, 1,
0.223075, -1.477664, 0.7215669, 1, 1, 1, 1, 1,
0.2253849, 0.1785766, 1.314001, 1, 1, 1, 1, 1,
0.2276392, -0.7672413, 2.295814, 1, 1, 1, 1, 1,
0.2287532, -0.4565295, 2.523593, 1, 1, 1, 1, 1,
0.2332739, 0.1424954, 0.4914433, 1, 1, 1, 1, 1,
0.2345288, 1.031386, -1.872014, 1, 1, 1, 1, 1,
0.2372163, -0.2127293, 2.893795, 1, 1, 1, 1, 1,
0.2376365, 2.502427, 0.1334621, 1, 1, 1, 1, 1,
0.2401165, 1.159591, -0.1313252, 1, 1, 1, 1, 1,
0.2402389, 0.06846441, 0.4490807, 1, 1, 1, 1, 1,
0.2415936, 0.2869036, 1.664605, 1, 1, 1, 1, 1,
0.2423648, -1.461132, 3.579704, 1, 1, 1, 1, 1,
0.2454313, 1.189174, -0.5144051, 0, 0, 1, 1, 1,
0.2460465, 1.787058, -0.9152436, 1, 0, 0, 1, 1,
0.2465175, -0.5785514, 4.235339, 1, 0, 0, 1, 1,
0.2472257, 0.4825904, -0.5814085, 1, 0, 0, 1, 1,
0.2475144, -0.5751373, 1.073442, 1, 0, 0, 1, 1,
0.2515209, -0.5349113, 3.281788, 1, 0, 0, 1, 1,
0.2547634, -0.3252003, 0.8756896, 0, 0, 0, 1, 1,
0.2582533, 0.6274722, 0.3409942, 0, 0, 0, 1, 1,
0.2591205, 0.2815719, 1.379089, 0, 0, 0, 1, 1,
0.2605545, 0.2386034, 1.965538, 0, 0, 0, 1, 1,
0.2638312, -0.9119613, 1.651335, 0, 0, 0, 1, 1,
0.268481, -0.7662252, 1.469279, 0, 0, 0, 1, 1,
0.2702742, -0.229165, 1.770825, 0, 0, 0, 1, 1,
0.2772359, -0.1622727, 1.575099, 1, 1, 1, 1, 1,
0.2791065, -1.904554, 2.42407, 1, 1, 1, 1, 1,
0.2871997, 0.04126518, 0.09204988, 1, 1, 1, 1, 1,
0.2885548, -0.9617525, 4.3446, 1, 1, 1, 1, 1,
0.2892119, 0.4130104, -2.35332, 1, 1, 1, 1, 1,
0.2899071, 0.8305998, 0.2168248, 1, 1, 1, 1, 1,
0.2909706, -0.1506805, 1.48826, 1, 1, 1, 1, 1,
0.2950454, 0.9044206, -1.240211, 1, 1, 1, 1, 1,
0.2996368, -1.572649, 2.680548, 1, 1, 1, 1, 1,
0.3019922, 0.2010428, 1.534685, 1, 1, 1, 1, 1,
0.3020859, 1.780423, -1.510889, 1, 1, 1, 1, 1,
0.3053849, -0.1326213, 2.361275, 1, 1, 1, 1, 1,
0.3056375, 0.9592926, 0.2087661, 1, 1, 1, 1, 1,
0.3059401, -0.5270584, 2.037968, 1, 1, 1, 1, 1,
0.3104149, 0.1586527, 2.360014, 1, 1, 1, 1, 1,
0.310689, 1.809842, 0.1165047, 0, 0, 1, 1, 1,
0.3130781, 0.6219394, -0.05585424, 1, 0, 0, 1, 1,
0.3145986, -0.8698072, 4.034124, 1, 0, 0, 1, 1,
0.3162103, -0.9103432, 1.903908, 1, 0, 0, 1, 1,
0.3189162, 0.1092641, -1.103337, 1, 0, 0, 1, 1,
0.328289, -1.249519, 2.857038, 1, 0, 0, 1, 1,
0.3291393, -1.195122, 2.733238, 0, 0, 0, 1, 1,
0.3347355, -0.6932725, 3.337846, 0, 0, 0, 1, 1,
0.3360223, -0.2727014, 0.7592164, 0, 0, 0, 1, 1,
0.3382183, 0.2681912, 0.8577609, 0, 0, 0, 1, 1,
0.3393965, 1.239251, 0.4648626, 0, 0, 0, 1, 1,
0.3401068, -1.838367, 2.824559, 0, 0, 0, 1, 1,
0.3423724, 2.513923, 0.824416, 0, 0, 0, 1, 1,
0.3427194, 0.5199586, 1.164014, 1, 1, 1, 1, 1,
0.3434846, -2.323208, 3.726452, 1, 1, 1, 1, 1,
0.3462844, -0.07347891, 3.01916, 1, 1, 1, 1, 1,
0.3472264, -0.8070406, 2.794255, 1, 1, 1, 1, 1,
0.3494498, -0.9564671, 2.917596, 1, 1, 1, 1, 1,
0.3495035, 1.584302, 1.536424, 1, 1, 1, 1, 1,
0.3496243, -2.100252, 2.130295, 1, 1, 1, 1, 1,
0.3503821, 1.853483, 0.1258759, 1, 1, 1, 1, 1,
0.3518338, 0.7392925, 2.042529, 1, 1, 1, 1, 1,
0.3553563, 1.161008, -1.190205, 1, 1, 1, 1, 1,
0.359217, -0.6587144, 1.813332, 1, 1, 1, 1, 1,
0.3688124, 1.119679, 0.5362677, 1, 1, 1, 1, 1,
0.3697604, -0.1413589, 2.274973, 1, 1, 1, 1, 1,
0.3716449, 0.4854312, -2.296367, 1, 1, 1, 1, 1,
0.3736347, -0.7338713, 1.394814, 1, 1, 1, 1, 1,
0.3747447, 2.366711, -0.2869419, 0, 0, 1, 1, 1,
0.3781855, 1.003024, -0.2814291, 1, 0, 0, 1, 1,
0.3832667, 1.217799, -0.343898, 1, 0, 0, 1, 1,
0.3849697, -1.281107, 3.202358, 1, 0, 0, 1, 1,
0.3893221, -0.9781859, 2.711065, 1, 0, 0, 1, 1,
0.3903396, -1.595925, 2.490085, 1, 0, 0, 1, 1,
0.3915677, 0.5428136, 1.771022, 0, 0, 0, 1, 1,
0.3980179, -1.844405, 4.264883, 0, 0, 0, 1, 1,
0.3981453, 0.9175909, 1.17035, 0, 0, 0, 1, 1,
0.4050368, -2.398974, 3.847455, 0, 0, 0, 1, 1,
0.405383, 0.1887987, 1.740443, 0, 0, 0, 1, 1,
0.4079118, 1.447758, 1.113441, 0, 0, 0, 1, 1,
0.4158088, 0.1703276, 0.1915079, 0, 0, 0, 1, 1,
0.4195618, -0.3118941, 1.594491, 1, 1, 1, 1, 1,
0.4199267, -0.6169995, 3.372191, 1, 1, 1, 1, 1,
0.4209161, -1.040575, 2.751098, 1, 1, 1, 1, 1,
0.4212098, -0.1255105, 0.3352812, 1, 1, 1, 1, 1,
0.4230825, -0.2240961, 2.851002, 1, 1, 1, 1, 1,
0.4245597, -2.63639, 2.44378, 1, 1, 1, 1, 1,
0.4255579, 0.1603038, -0.1361083, 1, 1, 1, 1, 1,
0.4274377, -0.9400201, 4.358709, 1, 1, 1, 1, 1,
0.4283136, 0.2959417, 0.8123875, 1, 1, 1, 1, 1,
0.4294821, 1.361581, -0.567949, 1, 1, 1, 1, 1,
0.4352519, -0.1797048, 2.174611, 1, 1, 1, 1, 1,
0.4374029, 0.3444529, 0.9975203, 1, 1, 1, 1, 1,
0.4410997, 1.323599, -1.676249, 1, 1, 1, 1, 1,
0.4480836, -0.3415329, 3.237064, 1, 1, 1, 1, 1,
0.4484103, 0.0711046, 1.115309, 1, 1, 1, 1, 1,
0.4527028, 0.4155393, 1.022013, 0, 0, 1, 1, 1,
0.4613386, -1.417047, 3.282973, 1, 0, 0, 1, 1,
0.4623348, -1.553245, 2.008529, 1, 0, 0, 1, 1,
0.4634943, -1.476406, 0.9661838, 1, 0, 0, 1, 1,
0.4698434, -1.030631, 2.480904, 1, 0, 0, 1, 1,
0.4702924, -1.105175, 3.286037, 1, 0, 0, 1, 1,
0.4705738, -0.5881242, 1.593977, 0, 0, 0, 1, 1,
0.47167, 0.947278, 0.2937589, 0, 0, 0, 1, 1,
0.4735968, -0.7800136, 3.843182, 0, 0, 0, 1, 1,
0.4753633, 1.520033, 1.177771, 0, 0, 0, 1, 1,
0.4756124, 0.1224333, 2.288702, 0, 0, 0, 1, 1,
0.4824236, -0.05968402, 1.563372, 0, 0, 0, 1, 1,
0.4862236, -0.3704346, 0.4912076, 0, 0, 0, 1, 1,
0.492109, 2.090703, -1.069921, 1, 1, 1, 1, 1,
0.4935198, -0.1543018, 0.8514409, 1, 1, 1, 1, 1,
0.4967173, 1.258361, -0.2347783, 1, 1, 1, 1, 1,
0.4979013, -0.4968046, 2.107088, 1, 1, 1, 1, 1,
0.4986036, -0.7095001, 2.56925, 1, 1, 1, 1, 1,
0.5009357, 1.213854, -0.02411968, 1, 1, 1, 1, 1,
0.5043275, 0.6254616, 0.1839595, 1, 1, 1, 1, 1,
0.50646, 1.097575, 2.353368, 1, 1, 1, 1, 1,
0.5070895, 1.210276, -0.9211795, 1, 1, 1, 1, 1,
0.5160214, -0.4917454, 2.193349, 1, 1, 1, 1, 1,
0.5192194, -0.008524277, 3.723125, 1, 1, 1, 1, 1,
0.5210948, -1.081516, 2.457796, 1, 1, 1, 1, 1,
0.5216751, 0.3130269, 1.987218, 1, 1, 1, 1, 1,
0.5221093, -2.463315, 2.883932, 1, 1, 1, 1, 1,
0.5280382, 1.581663, -0.6728943, 1, 1, 1, 1, 1,
0.5287571, -1.05022, 4.468204, 0, 0, 1, 1, 1,
0.5333281, 0.4949794, -0.07821567, 1, 0, 0, 1, 1,
0.5340584, -1.705379, 2.801523, 1, 0, 0, 1, 1,
0.5375, 0.4132764, 2.560825, 1, 0, 0, 1, 1,
0.5387972, 2.599104, -1.324256, 1, 0, 0, 1, 1,
0.5398458, -1.113351, 2.090003, 1, 0, 0, 1, 1,
0.5437247, 0.6974506, -0.4176303, 0, 0, 0, 1, 1,
0.5485844, -0.3454726, 3.23134, 0, 0, 0, 1, 1,
0.551923, 1.451868, 0.1570423, 0, 0, 0, 1, 1,
0.5538834, 0.6470948, -0.3499531, 0, 0, 0, 1, 1,
0.554048, -0.8661811, 5.248052, 0, 0, 0, 1, 1,
0.5570639, -0.716409, 2.050903, 0, 0, 0, 1, 1,
0.5581111, 1.703863, -0.8435683, 0, 0, 0, 1, 1,
0.5602257, -0.1568017, 3.197275, 1, 1, 1, 1, 1,
0.5602711, -1.065181, 2.560462, 1, 1, 1, 1, 1,
0.5613168, 0.6135834, 1.128436, 1, 1, 1, 1, 1,
0.5624936, 0.05339168, 1.391429, 1, 1, 1, 1, 1,
0.5667441, -1.928082, 2.904115, 1, 1, 1, 1, 1,
0.5695058, -0.2876053, 3.162375, 1, 1, 1, 1, 1,
0.5709808, -0.5253173, 2.119291, 1, 1, 1, 1, 1,
0.5728226, 0.2606218, 0.02909905, 1, 1, 1, 1, 1,
0.5730066, -0.02242851, 2.440078, 1, 1, 1, 1, 1,
0.5756588, -1.20716, 3.892515, 1, 1, 1, 1, 1,
0.5957848, -0.5563296, 2.261759, 1, 1, 1, 1, 1,
0.5959287, 0.06897314, 2.17423, 1, 1, 1, 1, 1,
0.6006572, -1.114695, 2.530109, 1, 1, 1, 1, 1,
0.6021932, 0.5169337, 0.8528986, 1, 1, 1, 1, 1,
0.609167, -0.08786673, 2.004924, 1, 1, 1, 1, 1,
0.6104823, 0.4688683, 0.4395757, 0, 0, 1, 1, 1,
0.6120197, 0.04657916, 1.285573, 1, 0, 0, 1, 1,
0.6144113, 0.6473763, -0.2446651, 1, 0, 0, 1, 1,
0.6209493, -0.3925346, 1.899547, 1, 0, 0, 1, 1,
0.6242037, -0.2304664, 2.801494, 1, 0, 0, 1, 1,
0.6247519, -0.08133137, 2.251987, 1, 0, 0, 1, 1,
0.6266961, 0.8928365, 0.2788621, 0, 0, 0, 1, 1,
0.6321428, -0.2107896, 2.638801, 0, 0, 0, 1, 1,
0.6356693, 1.33178, 0.1257426, 0, 0, 0, 1, 1,
0.6366176, 1.591179, -1.317716, 0, 0, 0, 1, 1,
0.6376864, 0.3695979, 0.8275573, 0, 0, 0, 1, 1,
0.6404214, 0.438601, 1.226752, 0, 0, 0, 1, 1,
0.6487855, 0.6667328, 1.973505, 0, 0, 0, 1, 1,
0.649177, -0.4992204, 2.405641, 1, 1, 1, 1, 1,
0.6509566, -1.774111, 1.997908, 1, 1, 1, 1, 1,
0.6548781, 1.445767, 1.669154, 1, 1, 1, 1, 1,
0.6569651, -0.2367384, 2.718769, 1, 1, 1, 1, 1,
0.6773791, -0.2274677, 2.885585, 1, 1, 1, 1, 1,
0.6783535, 1.360206, 1.124134, 1, 1, 1, 1, 1,
0.6809884, 0.8009084, 1.079901, 1, 1, 1, 1, 1,
0.6810549, 0.5621475, 2.309146, 1, 1, 1, 1, 1,
0.6812046, 0.2570503, 1.198027, 1, 1, 1, 1, 1,
0.6827459, -0.3653397, 1.356972, 1, 1, 1, 1, 1,
0.6843043, 0.03403107, 0.8170886, 1, 1, 1, 1, 1,
0.6865258, -0.5880262, 4.156516, 1, 1, 1, 1, 1,
0.6945978, 1.883802, 0.246725, 1, 1, 1, 1, 1,
0.6986071, -1.628791, 2.153281, 1, 1, 1, 1, 1,
0.7063518, 0.5987724, 1.384314, 1, 1, 1, 1, 1,
0.7076689, -0.3734623, 0.850628, 0, 0, 1, 1, 1,
0.7084301, -1.964999, 2.54882, 1, 0, 0, 1, 1,
0.7108204, 1.049985, 0.823916, 1, 0, 0, 1, 1,
0.7129334, 1.10609, 1.760235, 1, 0, 0, 1, 1,
0.7151172, 1.365085, 0.3756871, 1, 0, 0, 1, 1,
0.7177167, 1.398459, 1.916744, 1, 0, 0, 1, 1,
0.7249812, 0.3058226, 2.742991, 0, 0, 0, 1, 1,
0.7263362, -0.9658448, 3.431097, 0, 0, 0, 1, 1,
0.7349544, 1.149149, -0.686196, 0, 0, 0, 1, 1,
0.7354905, -0.07824033, 1.424667, 0, 0, 0, 1, 1,
0.7375643, -1.78421, 1.126957, 0, 0, 0, 1, 1,
0.7411209, 0.263808, 0.4708077, 0, 0, 0, 1, 1,
0.7415532, -0.7269374, -0.3976105, 0, 0, 0, 1, 1,
0.749362, -0.007240691, 1.496791, 1, 1, 1, 1, 1,
0.7581707, -1.644316, 1.738186, 1, 1, 1, 1, 1,
0.7585866, -2.346393, 2.870973, 1, 1, 1, 1, 1,
0.76217, 0.08767001, 1.166524, 1, 1, 1, 1, 1,
0.7626744, -2.062793, 3.528486, 1, 1, 1, 1, 1,
0.7679356, -0.08272441, 1.609618, 1, 1, 1, 1, 1,
0.7691086, -0.08245677, 2.245721, 1, 1, 1, 1, 1,
0.7752264, -2.270736, 2.8971, 1, 1, 1, 1, 1,
0.7784756, 1.703705, 2.157573, 1, 1, 1, 1, 1,
0.7801933, -0.5039694, 2.895163, 1, 1, 1, 1, 1,
0.7804837, 1.678879, -0.35317, 1, 1, 1, 1, 1,
0.786282, 1.656596, 0.2134387, 1, 1, 1, 1, 1,
0.7875295, 1.939244, 0.9818138, 1, 1, 1, 1, 1,
0.7931457, -0.2986315, 2.636811, 1, 1, 1, 1, 1,
0.795059, 0.9412007, 0.5218324, 1, 1, 1, 1, 1,
0.7959151, 0.1536556, 1.518618, 0, 0, 1, 1, 1,
0.8037219, -0.4109716, 1.466397, 1, 0, 0, 1, 1,
0.811848, 1.190392, 2.134067, 1, 0, 0, 1, 1,
0.8159115, 1.298514, 3.148387, 1, 0, 0, 1, 1,
0.819616, 0.1552282, 2.32727, 1, 0, 0, 1, 1,
0.8219633, -1.981971, 2.158132, 1, 0, 0, 1, 1,
0.8231747, -0.4001926, 1.322818, 0, 0, 0, 1, 1,
0.8241087, -0.2787865, 1.615057, 0, 0, 0, 1, 1,
0.8254735, 0.2313702, 0.5335408, 0, 0, 0, 1, 1,
0.8273178, 1.219454, 1.75346, 0, 0, 0, 1, 1,
0.8297272, 0.8971099, 0.2406754, 0, 0, 0, 1, 1,
0.8300779, -0.5458205, 3.577089, 0, 0, 0, 1, 1,
0.8350181, 1.253531, 0.346601, 0, 0, 0, 1, 1,
0.8353658, 0.6098264, -0.2315966, 1, 1, 1, 1, 1,
0.8360815, 0.4521149, 3.069157, 1, 1, 1, 1, 1,
0.8407696, 1.106449, 1.035035, 1, 1, 1, 1, 1,
0.8563961, -1.221869, 1.308202, 1, 1, 1, 1, 1,
0.8567274, -0.2921994, 0.9504962, 1, 1, 1, 1, 1,
0.8570321, 1.05487, 1.194402, 1, 1, 1, 1, 1,
0.8571551, 0.915796, -0.05589086, 1, 1, 1, 1, 1,
0.8650848, 0.2145008, 0.7623588, 1, 1, 1, 1, 1,
0.8650878, 1.08722, -0.4743273, 1, 1, 1, 1, 1,
0.8668424, -0.2949686, 0.1103274, 1, 1, 1, 1, 1,
0.8696196, -1.190395, 3.908878, 1, 1, 1, 1, 1,
0.8805448, -1.578476, 4.143612, 1, 1, 1, 1, 1,
0.8871256, -0.2120173, 2.339029, 1, 1, 1, 1, 1,
0.8877131, 0.2999402, 0.547902, 1, 1, 1, 1, 1,
0.8879109, 0.3412672, -0.8385938, 1, 1, 1, 1, 1,
0.889272, -1.471111, 2.716103, 0, 0, 1, 1, 1,
0.8900856, -0.7909426, 2.844454, 1, 0, 0, 1, 1,
0.892575, -1.2278, 1.024846, 1, 0, 0, 1, 1,
0.8974618, 0.7434553, 1.219893, 1, 0, 0, 1, 1,
0.9026875, -1.052363, 2.716213, 1, 0, 0, 1, 1,
0.9129599, -0.2402802, 2.210218, 1, 0, 0, 1, 1,
0.9157654, 1.081374, -0.7199235, 0, 0, 0, 1, 1,
0.9177728, 0.1958793, -0.7293388, 0, 0, 0, 1, 1,
0.9184513, -0.3496889, 2.755023, 0, 0, 0, 1, 1,
0.9216127, 0.4669048, -0.8642754, 0, 0, 0, 1, 1,
0.9228976, 1.34587, 0.9945065, 0, 0, 0, 1, 1,
0.9287261, 0.647478, 0.08803655, 0, 0, 0, 1, 1,
0.9338678, -0.7702038, 2.329365, 0, 0, 0, 1, 1,
0.9387553, 1.122742, 1.731646, 1, 1, 1, 1, 1,
0.943863, 0.06988677, 0.07150507, 1, 1, 1, 1, 1,
0.9452224, -1.348602, 0.8979393, 1, 1, 1, 1, 1,
0.9480979, -0.7476538, 1.691385, 1, 1, 1, 1, 1,
0.9491528, 0.2021591, 1.337626, 1, 1, 1, 1, 1,
0.9559094, 0.07334634, 0.2594513, 1, 1, 1, 1, 1,
0.9566908, 0.4594595, 0.6233253, 1, 1, 1, 1, 1,
0.9578657, -0.1129293, 3.013214, 1, 1, 1, 1, 1,
0.9702052, -1.878317, 1.464797, 1, 1, 1, 1, 1,
0.9780804, -1.179735, 3.904092, 1, 1, 1, 1, 1,
0.9798694, -0.1149655, 3.948681, 1, 1, 1, 1, 1,
0.984167, -0.3493837, 1.823596, 1, 1, 1, 1, 1,
0.9852625, 0.4727797, 0.8167769, 1, 1, 1, 1, 1,
0.9857579, -0.866127, 2.721151, 1, 1, 1, 1, 1,
0.9879228, 1.10961, 1.952132, 1, 1, 1, 1, 1,
0.9916806, 0.8649548, 1.375276, 0, 0, 1, 1, 1,
0.9979741, -0.7762697, 0.9450027, 1, 0, 0, 1, 1,
0.9995645, 0.06380524, 1.798632, 1, 0, 0, 1, 1,
1.000641, 0.755766, -2.679841, 1, 0, 0, 1, 1,
1.005685, 0.7084335, 1.844068, 1, 0, 0, 1, 1,
1.005915, -0.1144995, 0.5922759, 1, 0, 0, 1, 1,
1.009772, -1.106013, 3.953256, 0, 0, 0, 1, 1,
1.012154, 0.02652202, -0.3646159, 0, 0, 0, 1, 1,
1.022251, 1.473058, 0.4256432, 0, 0, 0, 1, 1,
1.028128, 0.4052425, 0.5130827, 0, 0, 0, 1, 1,
1.029542, 0.5682836, 1.837329, 0, 0, 0, 1, 1,
1.034126, 0.2617233, 2.580921, 0, 0, 0, 1, 1,
1.035401, -0.7865549, 2.219048, 0, 0, 0, 1, 1,
1.037807, 0.08314756, 3.196125, 1, 1, 1, 1, 1,
1.043579, 0.1818491, 0.7686855, 1, 1, 1, 1, 1,
1.047371, 0.7192331, 0.7395707, 1, 1, 1, 1, 1,
1.0494, 0.08243429, -0.8035358, 1, 1, 1, 1, 1,
1.054844, -1.278562, 2.179443, 1, 1, 1, 1, 1,
1.057931, -0.2599145, 3.125038, 1, 1, 1, 1, 1,
1.061686, 0.4239729, 0.9159641, 1, 1, 1, 1, 1,
1.064925, -2.001501, 1.611363, 1, 1, 1, 1, 1,
1.069894, 0.2524095, 0.5149553, 1, 1, 1, 1, 1,
1.070589, -0.6303729, 1.559407, 1, 1, 1, 1, 1,
1.077357, -0.2274517, 2.149632, 1, 1, 1, 1, 1,
1.081307, 0.01827333, 1.918097, 1, 1, 1, 1, 1,
1.082636, -0.0872054, -0.08895221, 1, 1, 1, 1, 1,
1.088675, 1.245325, 0.9256047, 1, 1, 1, 1, 1,
1.10337, -0.1091404, 1.224439, 1, 1, 1, 1, 1,
1.106377, -0.8315402, 1.212306, 0, 0, 1, 1, 1,
1.110646, 0.6260741, 0.7125429, 1, 0, 0, 1, 1,
1.114188, 2.134454, 1.317095, 1, 0, 0, 1, 1,
1.122475, 0.1482809, 1.559722, 1, 0, 0, 1, 1,
1.133903, -1.166264, 1.495764, 1, 0, 0, 1, 1,
1.134715, -1.636361, 3.556847, 1, 0, 0, 1, 1,
1.138463, 0.206946, 1.776891, 0, 0, 0, 1, 1,
1.140055, -0.03330594, 0.418006, 0, 0, 0, 1, 1,
1.165567, -1.19462, 1.195604, 0, 0, 0, 1, 1,
1.173585, 0.7020125, 0.5146328, 0, 0, 0, 1, 1,
1.175036, 0.6261812, 1.279106, 0, 0, 0, 1, 1,
1.183745, -0.08433142, 0.7071775, 0, 0, 0, 1, 1,
1.187838, 0.5094956, 1.0079, 0, 0, 0, 1, 1,
1.189917, 0.2252164, 2.54499, 1, 1, 1, 1, 1,
1.202545, 2.212437, -0.2419326, 1, 1, 1, 1, 1,
1.205883, 2.095527, 1.352298, 1, 1, 1, 1, 1,
1.22819, -0.05328472, 2.421663, 1, 1, 1, 1, 1,
1.235813, 1.059495, 1.886001, 1, 1, 1, 1, 1,
1.244316, -1.550647, 2.382544, 1, 1, 1, 1, 1,
1.248277, 3.161059, 0.4003198, 1, 1, 1, 1, 1,
1.254468, -0.3992004, 1.89781, 1, 1, 1, 1, 1,
1.255711, -0.7002127, 1.677471, 1, 1, 1, 1, 1,
1.256476, 1.150342, 1.65948, 1, 1, 1, 1, 1,
1.263746, -0.7644796, 0.9622809, 1, 1, 1, 1, 1,
1.264728, -1.369885, 2.420043, 1, 1, 1, 1, 1,
1.268761, 1.110335, 2.456784, 1, 1, 1, 1, 1,
1.273008, 1.147634, 0.9031377, 1, 1, 1, 1, 1,
1.281092, 0.2764441, 1.169689, 1, 1, 1, 1, 1,
1.283331, 0.4377592, 2.635566, 0, 0, 1, 1, 1,
1.286343, -0.2499313, 2.604518, 1, 0, 0, 1, 1,
1.293502, -0.6499622, 3.455106, 1, 0, 0, 1, 1,
1.302052, 2.58821, -0.7909223, 1, 0, 0, 1, 1,
1.302781, -0.629475, 1.047995, 1, 0, 0, 1, 1,
1.303128, -0.656128, 2.695964, 1, 0, 0, 1, 1,
1.305586, -1.538771, 1.204133, 0, 0, 0, 1, 1,
1.312293, -2.187227, 3.767605, 0, 0, 0, 1, 1,
1.321121, 0.6964204, 1.822254, 0, 0, 0, 1, 1,
1.332991, 1.223369, 0.04506068, 0, 0, 0, 1, 1,
1.333608, 1.526258, 1.696975, 0, 0, 0, 1, 1,
1.334174, -1.219252, 1.884925, 0, 0, 0, 1, 1,
1.337147, 0.09182132, 2.264581, 0, 0, 0, 1, 1,
1.33943, 0.006701632, 1.125703, 1, 1, 1, 1, 1,
1.349767, -0.6535767, 1.519552, 1, 1, 1, 1, 1,
1.377228, -0.8845779, 1.668247, 1, 1, 1, 1, 1,
1.378139, 1.65024, 0.4169376, 1, 1, 1, 1, 1,
1.388368, -1.22256, 1.227952, 1, 1, 1, 1, 1,
1.392197, -0.06791596, 1.611932, 1, 1, 1, 1, 1,
1.407379, 0.6046829, 0.09748385, 1, 1, 1, 1, 1,
1.409478, 0.4094939, 2.990785, 1, 1, 1, 1, 1,
1.411301, -1.822058, 2.457586, 1, 1, 1, 1, 1,
1.414398, 0.728628, 1.942297, 1, 1, 1, 1, 1,
1.415643, 0.9553394, 0.07752959, 1, 1, 1, 1, 1,
1.417907, 1.194314, 0.1582099, 1, 1, 1, 1, 1,
1.420743, 1.356459, 1.358145, 1, 1, 1, 1, 1,
1.426797, 1.218395, 0.3213525, 1, 1, 1, 1, 1,
1.441509, -0.9282528, 0.9661791, 1, 1, 1, 1, 1,
1.46444, -0.5585362, 1.605739, 0, 0, 1, 1, 1,
1.464782, -0.3908479, 2.897967, 1, 0, 0, 1, 1,
1.477973, 0.6572852, 0.6975164, 1, 0, 0, 1, 1,
1.480107, 2.372233, -0.1186179, 1, 0, 0, 1, 1,
1.488787, -0.01374523, 3.34837, 1, 0, 0, 1, 1,
1.491763, 0.07619745, 2.542401, 1, 0, 0, 1, 1,
1.494098, 0.08424889, 1.869135, 0, 0, 0, 1, 1,
1.499566, -0.1521059, 3.008259, 0, 0, 0, 1, 1,
1.504536, 0.28978, 1.848665, 0, 0, 0, 1, 1,
1.514369, 0.403168, 1.919692, 0, 0, 0, 1, 1,
1.522292, 0.7529861, 3.092884, 0, 0, 0, 1, 1,
1.529463, -0.2854546, 1.366747, 0, 0, 0, 1, 1,
1.539646, 1.012785, 2.80145, 0, 0, 0, 1, 1,
1.541063, -1.141261, -0.01659433, 1, 1, 1, 1, 1,
1.569931, 1.179713, 1.682993, 1, 1, 1, 1, 1,
1.572362, 0.5625966, 0.1364512, 1, 1, 1, 1, 1,
1.585191, -0.3837095, 1.796784, 1, 1, 1, 1, 1,
1.593511, -0.6888123, -1.227059, 1, 1, 1, 1, 1,
1.600754, -0.8266602, 0.6417343, 1, 1, 1, 1, 1,
1.601012, 0.0871392, 3.167756, 1, 1, 1, 1, 1,
1.60354, -2.159834, 1.382628, 1, 1, 1, 1, 1,
1.60416, -0.4716907, 1.264342, 1, 1, 1, 1, 1,
1.626429, 1.58986, 0.238533, 1, 1, 1, 1, 1,
1.627041, -2.711373, 3.458585, 1, 1, 1, 1, 1,
1.631647, -1.527752, 0.9161137, 1, 1, 1, 1, 1,
1.63791, 0.5699668, 0.6931219, 1, 1, 1, 1, 1,
1.651146, 1.176469, 0.3157359, 1, 1, 1, 1, 1,
1.658426, -0.9978522, 0.8513648, 1, 1, 1, 1, 1,
1.66022, -2.273758, 1.044692, 0, 0, 1, 1, 1,
1.669735, -0.3509858, 2.529425, 1, 0, 0, 1, 1,
1.67447, 1.05836, 1.151872, 1, 0, 0, 1, 1,
1.703508, -2.458766, 1.687663, 1, 0, 0, 1, 1,
1.704296, -0.2476364, 1.464829, 1, 0, 0, 1, 1,
1.708157, 0.2797548, 0.8018149, 1, 0, 0, 1, 1,
1.709845, 0.06084586, 0.828494, 0, 0, 0, 1, 1,
1.719276, -2.290341, 1.68026, 0, 0, 0, 1, 1,
1.751922, -0.8835823, 3.13261, 0, 0, 0, 1, 1,
1.752284, -0.01137231, 0.6123401, 0, 0, 0, 1, 1,
1.775787, 0.9834745, -0.6700984, 0, 0, 0, 1, 1,
1.801972, 0.4012095, 3.577393, 0, 0, 0, 1, 1,
1.809245, 1.220574, 2.11963, 0, 0, 0, 1, 1,
1.823881, -1.808749, 2.53012, 1, 1, 1, 1, 1,
1.827725, -2.284811, 3.039648, 1, 1, 1, 1, 1,
1.859139, 1.903375, 1.694827, 1, 1, 1, 1, 1,
1.88683, -0.5447969, 3.442906, 1, 1, 1, 1, 1,
1.9109, -2.37541, 1.949815, 1, 1, 1, 1, 1,
1.926903, -0.5831604, 3.005662, 1, 1, 1, 1, 1,
1.936815, -0.702051, 0.5189703, 1, 1, 1, 1, 1,
1.953094, 1.616253, 2.913884, 1, 1, 1, 1, 1,
1.967601, 0.4499868, 1.633074, 1, 1, 1, 1, 1,
1.986115, 0.5989152, 0.01898383, 1, 1, 1, 1, 1,
2.014427, 0.9621857, 1.288189, 1, 1, 1, 1, 1,
2.047616, -0.3254574, 2.450753, 1, 1, 1, 1, 1,
2.070684, 0.757229, 1.500908, 1, 1, 1, 1, 1,
2.077061, -0.09594645, 2.087152, 1, 1, 1, 1, 1,
2.109583, 0.9680341, 1.525429, 1, 1, 1, 1, 1,
2.141697, -0.2014699, 1.048158, 0, 0, 1, 1, 1,
2.141778, 0.1144855, -0.1932273, 1, 0, 0, 1, 1,
2.158609, 1.471175, -0.1548565, 1, 0, 0, 1, 1,
2.242146, -0.7502267, 0.9730075, 1, 0, 0, 1, 1,
2.342786, -0.8514437, 1.758963, 1, 0, 0, 1, 1,
2.35172, 0.5727414, 1.918127, 1, 0, 0, 1, 1,
2.369876, -0.7987682, 1.274561, 0, 0, 0, 1, 1,
2.419026, 0.9722112, 1.78399, 0, 0, 0, 1, 1,
2.523633, -0.02223693, 2.136222, 0, 0, 0, 1, 1,
2.558955, 0.01614934, 1.897011, 0, 0, 0, 1, 1,
2.651638, 0.7163525, 0.20022, 0, 0, 0, 1, 1,
2.653274, -0.6642048, 2.242937, 0, 0, 0, 1, 1,
2.656564, -1.222212, 2.239546, 0, 0, 0, 1, 1,
2.739267, -1.826111, 3.097499, 1, 1, 1, 1, 1,
2.77493, 0.7868766, 0.2544381, 1, 1, 1, 1, 1,
2.918881, -0.3627765, 1.527496, 1, 1, 1, 1, 1,
2.963512, 1.958498, 1.195401, 1, 1, 1, 1, 1,
2.963526, 0.603731, 1.837916, 1, 1, 1, 1, 1,
3.241723, 1.095147, 2.021858, 1, 1, 1, 1, 1,
3.555067, -0.1125399, 1.84683, 1, 1, 1, 1, 1
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
var radius = 9.734164;
var distance = 34.19084;
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
mvMatrix.translate( -0.3075897, -0.04810143, 0.3361387 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.19084);
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
