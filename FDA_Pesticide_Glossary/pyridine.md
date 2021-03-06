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
-3.286138, 0.2361483, -2.327996, 1, 0, 0, 1,
-2.940485, -0.005906369, -1.107886, 1, 0.007843138, 0, 1,
-2.89921, -2.900809, -3.410786, 1, 0.01176471, 0, 1,
-2.740842, 0.02115857, -0.04476439, 1, 0.01960784, 0, 1,
-2.596597, -0.9019075, -2.442905, 1, 0.02352941, 0, 1,
-2.570231, -1.719715, -1.562266, 1, 0.03137255, 0, 1,
-2.547902, -0.8272799, -0.1110547, 1, 0.03529412, 0, 1,
-2.410118, 0.7549686, -0.4659249, 1, 0.04313726, 0, 1,
-2.336538, 0.04791998, -1.248681, 1, 0.04705882, 0, 1,
-2.27925, 0.4895505, 0.09537699, 1, 0.05490196, 0, 1,
-2.263819, 1.224846, -0.9360597, 1, 0.05882353, 0, 1,
-2.237462, -0.3659909, 0.2747494, 1, 0.06666667, 0, 1,
-2.166251, -1.24926, -2.16501, 1, 0.07058824, 0, 1,
-2.122622, 0.5322965, -0.3859433, 1, 0.07843138, 0, 1,
-2.100151, 1.615342, -0.4809637, 1, 0.08235294, 0, 1,
-2.099622, 1.818592, -1.140455, 1, 0.09019608, 0, 1,
-2.086424, 0.6010825, -1.189764, 1, 0.09411765, 0, 1,
-2.069545, 1.404012, -2.350845, 1, 0.1019608, 0, 1,
-2.063107, 0.9191316, -1.149168, 1, 0.1098039, 0, 1,
-2.055092, -0.01085126, -2.803538, 1, 0.1137255, 0, 1,
-2.047948, -1.775493, -1.777655, 1, 0.1215686, 0, 1,
-2.014526, -1.110885, -2.018786, 1, 0.1254902, 0, 1,
-1.992931, 0.6189694, -0.6434935, 1, 0.1333333, 0, 1,
-1.980851, -0.5104753, -2.56075, 1, 0.1372549, 0, 1,
-1.973065, 1.502561, -0.4719606, 1, 0.145098, 0, 1,
-1.961992, 0.4067517, -0.7171261, 1, 0.1490196, 0, 1,
-1.959096, 0.004300258, -1.507341, 1, 0.1568628, 0, 1,
-1.876677, -1.978382, -1.775813, 1, 0.1607843, 0, 1,
-1.873564, 0.6728237, -0.7937632, 1, 0.1686275, 0, 1,
-1.845526, 1.666644, -1.453351, 1, 0.172549, 0, 1,
-1.830553, 0.4082772, -2.205938, 1, 0.1803922, 0, 1,
-1.825849, -0.06398804, -1.451476, 1, 0.1843137, 0, 1,
-1.82574, -2.122435, -2.037861, 1, 0.1921569, 0, 1,
-1.782073, 0.03183501, -1.506689, 1, 0.1960784, 0, 1,
-1.777695, 0.06688482, -2.313047, 1, 0.2039216, 0, 1,
-1.774732, -1.30592, -1.500771, 1, 0.2117647, 0, 1,
-1.756534, -0.9876217, -2.247364, 1, 0.2156863, 0, 1,
-1.749904, -0.7552399, -2.504264, 1, 0.2235294, 0, 1,
-1.742988, 1.496704, -1.621063, 1, 0.227451, 0, 1,
-1.730789, 2.529214, -2.90599, 1, 0.2352941, 0, 1,
-1.730309, -0.6102108, -2.123741, 1, 0.2392157, 0, 1,
-1.715827, 0.6267911, -0.9367619, 1, 0.2470588, 0, 1,
-1.715425, -0.2835177, -1.505819, 1, 0.2509804, 0, 1,
-1.715189, -1.270963, -1.595638, 1, 0.2588235, 0, 1,
-1.688322, -2.491568, -2.294406, 1, 0.2627451, 0, 1,
-1.683068, 1.699575, -0.6568124, 1, 0.2705882, 0, 1,
-1.681747, 0.5647199, -1.701493, 1, 0.2745098, 0, 1,
-1.680757, -0.9788342, -2.751734, 1, 0.282353, 0, 1,
-1.675467, 1.156303, -1.609347, 1, 0.2862745, 0, 1,
-1.663228, -1.87976, -2.449682, 1, 0.2941177, 0, 1,
-1.645615, 1.795286, -0.4437788, 1, 0.3019608, 0, 1,
-1.636777, 0.8502355, -0.9005436, 1, 0.3058824, 0, 1,
-1.618974, 1.450898, 0.1969837, 1, 0.3137255, 0, 1,
-1.618061, 1.03125, -1.384362, 1, 0.3176471, 0, 1,
-1.611254, 1.024519, -0.3977124, 1, 0.3254902, 0, 1,
-1.606946, 0.3721158, -2.009073, 1, 0.3294118, 0, 1,
-1.591138, -0.01122229, -2.062161, 1, 0.3372549, 0, 1,
-1.584998, 0.8903944, -0.8876385, 1, 0.3411765, 0, 1,
-1.578832, -0.5546612, -0.6107667, 1, 0.3490196, 0, 1,
-1.568202, -0.02252684, -1.509952, 1, 0.3529412, 0, 1,
-1.565569, -0.581417, -2.421623, 1, 0.3607843, 0, 1,
-1.553096, -0.9484763, -0.8344228, 1, 0.3647059, 0, 1,
-1.551833, 2.232446, -1.17543, 1, 0.372549, 0, 1,
-1.550352, 0.1839318, -2.226522, 1, 0.3764706, 0, 1,
-1.545465, 1.243121, -0.6849154, 1, 0.3843137, 0, 1,
-1.544628, 0.3212077, -0.2787941, 1, 0.3882353, 0, 1,
-1.528847, 1.424377, -0.570555, 1, 0.3960784, 0, 1,
-1.525702, -0.2961259, -1.524142, 1, 0.4039216, 0, 1,
-1.523831, 1.324631, -1.982035, 1, 0.4078431, 0, 1,
-1.516178, -0.02767943, -2.784629, 1, 0.4156863, 0, 1,
-1.513056, 0.3922296, -0.8807749, 1, 0.4196078, 0, 1,
-1.508446, 0.550275, -1.972043, 1, 0.427451, 0, 1,
-1.497719, -2.087273, -3.853699, 1, 0.4313726, 0, 1,
-1.478944, 0.9289026, -0.9819328, 1, 0.4392157, 0, 1,
-1.474242, 1.157145, -2.332719, 1, 0.4431373, 0, 1,
-1.43957, -0.5496995, -3.23094, 1, 0.4509804, 0, 1,
-1.4383, -0.8154188, -2.091869, 1, 0.454902, 0, 1,
-1.434426, -0.3939262, -0.7952856, 1, 0.4627451, 0, 1,
-1.430099, -1.728354, -2.865239, 1, 0.4666667, 0, 1,
-1.423751, 1.99729, -1.579628, 1, 0.4745098, 0, 1,
-1.399937, -1.686818, -0.6490531, 1, 0.4784314, 0, 1,
-1.396198, -1.090943, -1.79013, 1, 0.4862745, 0, 1,
-1.395569, 1.205522, -1.399644, 1, 0.4901961, 0, 1,
-1.382603, 1.638573, -1.124192, 1, 0.4980392, 0, 1,
-1.376991, -0.06215549, -2.25861, 1, 0.5058824, 0, 1,
-1.368861, 1.338636, -0.8795192, 1, 0.509804, 0, 1,
-1.365333, 0.843376, -0.8813475, 1, 0.5176471, 0, 1,
-1.363721, 0.8679984, -2.213538, 1, 0.5215687, 0, 1,
-1.362226, -1.354587, -1.014962, 1, 0.5294118, 0, 1,
-1.357845, 0.704439, -1.782638, 1, 0.5333334, 0, 1,
-1.356123, -1.4288, -0.5111009, 1, 0.5411765, 0, 1,
-1.348701, 1.245832, 1.008168, 1, 0.5450981, 0, 1,
-1.32264, -0.7428837, -1.45275, 1, 0.5529412, 0, 1,
-1.317867, 0.2782272, -2.150841, 1, 0.5568628, 0, 1,
-1.316729, -0.228438, -2.036181, 1, 0.5647059, 0, 1,
-1.310035, -0.6463047, -2.855017, 1, 0.5686275, 0, 1,
-1.308733, -1.169135, -3.5028, 1, 0.5764706, 0, 1,
-1.306563, 0.4895884, -2.693353, 1, 0.5803922, 0, 1,
-1.299267, -0.4413247, -0.4190826, 1, 0.5882353, 0, 1,
-1.292017, -0.01533933, -2.477494, 1, 0.5921569, 0, 1,
-1.288987, -0.4171389, -0.5472208, 1, 0.6, 0, 1,
-1.286469, 0.7511584, -1.460125, 1, 0.6078432, 0, 1,
-1.274856, -0.2685343, -2.99723, 1, 0.6117647, 0, 1,
-1.273774, -0.2723287, -0.6778651, 1, 0.6196079, 0, 1,
-1.271674, -0.3008532, -0.7331508, 1, 0.6235294, 0, 1,
-1.264478, -1.783352, -2.906938, 1, 0.6313726, 0, 1,
-1.262329, -0.4737074, -0.1765915, 1, 0.6352941, 0, 1,
-1.246672, -0.4862808, -2.309554, 1, 0.6431373, 0, 1,
-1.244017, -0.1046586, -1.154241, 1, 0.6470588, 0, 1,
-1.241928, 0.3462549, -0.8255968, 1, 0.654902, 0, 1,
-1.23611, 0.5690563, -1.966604, 1, 0.6588235, 0, 1,
-1.231755, 1.616791, 0.08857378, 1, 0.6666667, 0, 1,
-1.226644, -1.055774, -0.9099426, 1, 0.6705883, 0, 1,
-1.226224, 0.2780386, -1.601963, 1, 0.6784314, 0, 1,
-1.220948, 1.117527, -3.299491, 1, 0.682353, 0, 1,
-1.214464, -0.3551692, -0.7117276, 1, 0.6901961, 0, 1,
-1.213432, 0.957692, -0.1056139, 1, 0.6941177, 0, 1,
-1.210897, 0.06602903, -2.545642, 1, 0.7019608, 0, 1,
-1.203158, 0.880536, -1.494728, 1, 0.7098039, 0, 1,
-1.202464, -0.4135799, -0.5137472, 1, 0.7137255, 0, 1,
-1.201997, -0.0680165, -1.600954, 1, 0.7215686, 0, 1,
-1.19578, -0.3300548, -3.71997, 1, 0.7254902, 0, 1,
-1.191221, 0.6746179, -1.217516, 1, 0.7333333, 0, 1,
-1.182473, 0.8272387, -0.6364655, 1, 0.7372549, 0, 1,
-1.177343, 0.7374384, -1.864136, 1, 0.7450981, 0, 1,
-1.174138, 1.905311, -2.189689, 1, 0.7490196, 0, 1,
-1.168147, -0.7498407, -3.811831, 1, 0.7568628, 0, 1,
-1.166551, -0.388943, -0.9537217, 1, 0.7607843, 0, 1,
-1.166135, -0.3445029, -1.000859, 1, 0.7686275, 0, 1,
-1.163801, -0.506755, -1.611987, 1, 0.772549, 0, 1,
-1.160441, -1.380234, -3.695061, 1, 0.7803922, 0, 1,
-1.155678, 0.1202537, -1.79696, 1, 0.7843137, 0, 1,
-1.15082, 1.513357, -1.101429, 1, 0.7921569, 0, 1,
-1.149555, 1.863684, -1.089313, 1, 0.7960784, 0, 1,
-1.146852, -0.2945596, -1.388546, 1, 0.8039216, 0, 1,
-1.141577, 1.079769, -0.8440548, 1, 0.8117647, 0, 1,
-1.138989, -2.124008, -2.898998, 1, 0.8156863, 0, 1,
-1.138341, -0.03612602, -2.937407, 1, 0.8235294, 0, 1,
-1.137503, 0.6560786, -1.343104, 1, 0.827451, 0, 1,
-1.130122, 0.8280493, -0.6822152, 1, 0.8352941, 0, 1,
-1.11902, -0.5726508, -2.211475, 1, 0.8392157, 0, 1,
-1.114894, 0.9245951, 0.8509305, 1, 0.8470588, 0, 1,
-1.114683, -0.6050158, -2.965441, 1, 0.8509804, 0, 1,
-1.111506, -0.06877039, -0.4540841, 1, 0.8588235, 0, 1,
-1.099824, 1.973302, -2.454168, 1, 0.8627451, 0, 1,
-1.095177, 0.4967013, -0.03703925, 1, 0.8705882, 0, 1,
-1.086015, 0.1683726, -0.5291834, 1, 0.8745098, 0, 1,
-1.085502, -2.134639, -3.089792, 1, 0.8823529, 0, 1,
-1.08394, -0.2204689, -1.331378, 1, 0.8862745, 0, 1,
-1.078921, -1.115762, -3.198064, 1, 0.8941177, 0, 1,
-1.077212, 1.897981, -1.448901, 1, 0.8980392, 0, 1,
-1.071955, -1.267739, -1.81079, 1, 0.9058824, 0, 1,
-1.070542, -0.05129052, -0.7861201, 1, 0.9137255, 0, 1,
-1.069915, -1.329938, -2.736938, 1, 0.9176471, 0, 1,
-1.069798, 0.1883433, -1.273629, 1, 0.9254902, 0, 1,
-1.069691, -0.9157774, -1.008162, 1, 0.9294118, 0, 1,
-1.061679, 0.3902762, -1.412926, 1, 0.9372549, 0, 1,
-1.056306, 0.5959538, 0.4143031, 1, 0.9411765, 0, 1,
-1.047737, 0.1531983, -0.6878787, 1, 0.9490196, 0, 1,
-1.033876, -2.483824, -2.122853, 1, 0.9529412, 0, 1,
-1.028562, -0.3116377, -2.919691, 1, 0.9607843, 0, 1,
-1.027111, 0.2573848, -0.9758067, 1, 0.9647059, 0, 1,
-1.025681, -0.2886103, -1.771348, 1, 0.972549, 0, 1,
-1.02208, 0.8599173, 0.3863282, 1, 0.9764706, 0, 1,
-1.019554, -0.2347284, -1.213051, 1, 0.9843137, 0, 1,
-1.017837, 1.435218, -2.662357, 1, 0.9882353, 0, 1,
-1.015465, -1.737027, -3.095217, 1, 0.9960784, 0, 1,
-1.01448, 0.02113031, -1.746357, 0.9960784, 1, 0, 1,
-0.9940606, 0.8199177, -1.115282, 0.9921569, 1, 0, 1,
-0.983197, -0.3515953, -1.1019, 0.9843137, 1, 0, 1,
-0.9805467, 0.9887112, -1.479363, 0.9803922, 1, 0, 1,
-0.9688556, -0.1280652, -3.189831, 0.972549, 1, 0, 1,
-0.9643829, 3.216715, 0.169271, 0.9686275, 1, 0, 1,
-0.9624949, -0.2110827, -2.41432, 0.9607843, 1, 0, 1,
-0.9617041, -1.244323, -2.700699, 0.9568627, 1, 0, 1,
-0.955502, -1.520426, -1.568785, 0.9490196, 1, 0, 1,
-0.9515166, -1.337007, -3.411385, 0.945098, 1, 0, 1,
-0.95147, 0.07838564, -0.09093259, 0.9372549, 1, 0, 1,
-0.9498179, -0.1973221, -2.104488, 0.9333333, 1, 0, 1,
-0.9456347, 1.21987, -1.566168, 0.9254902, 1, 0, 1,
-0.9453315, 1.079443, -1.153756, 0.9215686, 1, 0, 1,
-0.9434868, -1.494257, -2.718934, 0.9137255, 1, 0, 1,
-0.9410598, 0.8159029, -0.1750473, 0.9098039, 1, 0, 1,
-0.9355037, 0.8648435, -0.4357551, 0.9019608, 1, 0, 1,
-0.9256771, 0.5270584, -1.288216, 0.8941177, 1, 0, 1,
-0.9253031, -0.7416554, -0.5130689, 0.8901961, 1, 0, 1,
-0.9189203, -1.372012, -2.458294, 0.8823529, 1, 0, 1,
-0.911079, 0.1369046, -0.774676, 0.8784314, 1, 0, 1,
-0.9039623, 1.112974, -0.7026188, 0.8705882, 1, 0, 1,
-0.9017901, 0.4236427, -3.333146, 0.8666667, 1, 0, 1,
-0.8993088, 0.959552, 1.836792, 0.8588235, 1, 0, 1,
-0.8989551, 0.8457544, -2.172482, 0.854902, 1, 0, 1,
-0.8981111, -0.6828671, -2.429538, 0.8470588, 1, 0, 1,
-0.8966881, 1.223155, -0.4178069, 0.8431373, 1, 0, 1,
-0.8911039, -2.773393, -1.55284, 0.8352941, 1, 0, 1,
-0.8816207, 0.7763662, -0.9649872, 0.8313726, 1, 0, 1,
-0.8781459, 0.9218616, -1.871867, 0.8235294, 1, 0, 1,
-0.8748659, 1.060055, -1.224767, 0.8196079, 1, 0, 1,
-0.8735649, 0.3098783, -2.105946, 0.8117647, 1, 0, 1,
-0.8699279, -0.3345897, -1.376702, 0.8078431, 1, 0, 1,
-0.8621323, -0.5479285, -2.655517, 0.8, 1, 0, 1,
-0.8578381, 0.5526171, -1.340025, 0.7921569, 1, 0, 1,
-0.8571799, -0.8874887, -2.246259, 0.7882353, 1, 0, 1,
-0.8545595, -1.23547, -1.243475, 0.7803922, 1, 0, 1,
-0.8531219, -0.2844161, -2.07039, 0.7764706, 1, 0, 1,
-0.8528804, 0.1369201, 1.364774, 0.7686275, 1, 0, 1,
-0.8507024, -2.172005, -2.145768, 0.7647059, 1, 0, 1,
-0.8455668, 0.0952182, -2.625498, 0.7568628, 1, 0, 1,
-0.8440416, 0.1892907, -1.320149, 0.7529412, 1, 0, 1,
-0.8398144, -0.4901187, -1.322177, 0.7450981, 1, 0, 1,
-0.8385589, 1.30744, -0.1470473, 0.7411765, 1, 0, 1,
-0.8382647, -1.462086, -3.739498, 0.7333333, 1, 0, 1,
-0.8366002, 1.15941, 1.225572, 0.7294118, 1, 0, 1,
-0.8350872, -0.09233422, -3.712209, 0.7215686, 1, 0, 1,
-0.8308619, -0.3677981, -2.543858, 0.7176471, 1, 0, 1,
-0.8279232, -1.447453, -0.8975, 0.7098039, 1, 0, 1,
-0.8271168, -1.311234, -3.109253, 0.7058824, 1, 0, 1,
-0.8197843, -0.4875309, -3.182683, 0.6980392, 1, 0, 1,
-0.8191968, 0.1141895, 0.3872989, 0.6901961, 1, 0, 1,
-0.8091699, 0.3325992, -0.3852693, 0.6862745, 1, 0, 1,
-0.8064913, -1.382838, -1.992744, 0.6784314, 1, 0, 1,
-0.8042286, -0.2774766, -3.189156, 0.6745098, 1, 0, 1,
-0.8002437, -0.3215082, -2.803231, 0.6666667, 1, 0, 1,
-0.797118, -0.07755128, -1.712779, 0.6627451, 1, 0, 1,
-0.7970811, -1.106727, -2.850261, 0.654902, 1, 0, 1,
-0.7930714, 1.090257, -0.3335837, 0.6509804, 1, 0, 1,
-0.7899756, -0.0358071, -0.4609229, 0.6431373, 1, 0, 1,
-0.7805914, -0.1626409, -0.9646013, 0.6392157, 1, 0, 1,
-0.7775243, 0.4003206, -1.278151, 0.6313726, 1, 0, 1,
-0.7754794, 0.06251928, -2.647232, 0.627451, 1, 0, 1,
-0.7747045, 2.482074, 0.5527346, 0.6196079, 1, 0, 1,
-0.7717922, 0.9137046, -0.994925, 0.6156863, 1, 0, 1,
-0.7712489, -1.375974, -0.8272498, 0.6078432, 1, 0, 1,
-0.7703702, -1.302905, -2.127567, 0.6039216, 1, 0, 1,
-0.7553108, 0.4580636, -0.9940707, 0.5960785, 1, 0, 1,
-0.7462339, -1.221309, -2.289968, 0.5882353, 1, 0, 1,
-0.7425629, 0.1207941, -0.8908018, 0.5843138, 1, 0, 1,
-0.7309503, 0.9225975, 0.1819154, 0.5764706, 1, 0, 1,
-0.7306882, 0.3283995, -1.480334, 0.572549, 1, 0, 1,
-0.7280773, 2.04771, 1.185241, 0.5647059, 1, 0, 1,
-0.7233192, 0.5947978, -0.5471085, 0.5607843, 1, 0, 1,
-0.719154, 0.1858431, -0.7193418, 0.5529412, 1, 0, 1,
-0.7135355, -0.450567, -1.109161, 0.5490196, 1, 0, 1,
-0.7133684, 0.9281617, -0.7363462, 0.5411765, 1, 0, 1,
-0.7124262, 0.723162, -1.088168, 0.5372549, 1, 0, 1,
-0.7114458, 0.6550671, -2.292145, 0.5294118, 1, 0, 1,
-0.7111185, 1.883554, -1.948184, 0.5254902, 1, 0, 1,
-0.7078671, -0.8199929, -2.783145, 0.5176471, 1, 0, 1,
-0.7002157, 0.2211453, -0.4185866, 0.5137255, 1, 0, 1,
-0.6971073, -1.715484, -2.769216, 0.5058824, 1, 0, 1,
-0.6903575, -1.096395, -2.203585, 0.5019608, 1, 0, 1,
-0.6868901, 0.4829563, -1.287802, 0.4941176, 1, 0, 1,
-0.6858891, -0.004186754, -2.436776, 0.4862745, 1, 0, 1,
-0.6753066, -0.2968721, -1.214563, 0.4823529, 1, 0, 1,
-0.6739622, -1.114296, -4.33696, 0.4745098, 1, 0, 1,
-0.6680627, 0.1374355, -0.5328937, 0.4705882, 1, 0, 1,
-0.6626068, -1.61048, -3.421175, 0.4627451, 1, 0, 1,
-0.6584638, -0.09533131, -2.185588, 0.4588235, 1, 0, 1,
-0.6574769, -0.9572305, -2.32679, 0.4509804, 1, 0, 1,
-0.6572377, 0.6257126, -1.969877, 0.4470588, 1, 0, 1,
-0.6564981, 0.073872, -1.417863, 0.4392157, 1, 0, 1,
-0.6544057, 0.3295299, -0.4333539, 0.4352941, 1, 0, 1,
-0.6540179, -0.8658652, -3.5176, 0.427451, 1, 0, 1,
-0.6503741, 0.5857738, -0.1949583, 0.4235294, 1, 0, 1,
-0.6479138, 0.4507945, -1.9346, 0.4156863, 1, 0, 1,
-0.6446665, -0.7028748, -0.1971832, 0.4117647, 1, 0, 1,
-0.6436397, -1.604452, -3.398274, 0.4039216, 1, 0, 1,
-0.6434255, -0.3422695, -2.367118, 0.3960784, 1, 0, 1,
-0.6424496, 1.203183, -1.391129, 0.3921569, 1, 0, 1,
-0.6390014, -1.544906, -1.441163, 0.3843137, 1, 0, 1,
-0.6338422, -0.1355053, -2.449516, 0.3803922, 1, 0, 1,
-0.6327973, -0.5760428, -1.877768, 0.372549, 1, 0, 1,
-0.6304058, -1.444734, -3.858289, 0.3686275, 1, 0, 1,
-0.6273825, 1.813151, 0.633222, 0.3607843, 1, 0, 1,
-0.6247371, 0.3426802, -1.899797, 0.3568628, 1, 0, 1,
-0.6247125, 0.6416832, 0.1246124, 0.3490196, 1, 0, 1,
-0.6173089, 0.8681955, -0.189561, 0.345098, 1, 0, 1,
-0.6149045, -0.03113268, -2.109015, 0.3372549, 1, 0, 1,
-0.6143833, -1.244308, -2.650078, 0.3333333, 1, 0, 1,
-0.6141761, -0.1774764, -1.929253, 0.3254902, 1, 0, 1,
-0.6136183, 0.1675858, -1.701247, 0.3215686, 1, 0, 1,
-0.6097814, -1.574429, -2.72875, 0.3137255, 1, 0, 1,
-0.6074212, 0.5941905, -0.7595157, 0.3098039, 1, 0, 1,
-0.6049682, 0.6868491, -0.7879281, 0.3019608, 1, 0, 1,
-0.6036401, -0.07247554, -2.239054, 0.2941177, 1, 0, 1,
-0.6018527, -0.4739619, -2.332188, 0.2901961, 1, 0, 1,
-0.6015082, -0.464349, -3.385549, 0.282353, 1, 0, 1,
-0.6006947, -0.2477408, -3.283448, 0.2784314, 1, 0, 1,
-0.5988658, -1.798518, -3.944498, 0.2705882, 1, 0, 1,
-0.5976208, 0.5184676, 0.5069386, 0.2666667, 1, 0, 1,
-0.5963011, -0.2478688, -2.761106, 0.2588235, 1, 0, 1,
-0.5915607, -0.7027951, -3.804456, 0.254902, 1, 0, 1,
-0.5893571, -0.1337624, -2.154762, 0.2470588, 1, 0, 1,
-0.5863024, 0.3389603, -0.5534908, 0.2431373, 1, 0, 1,
-0.583333, -0.03859984, -2.326847, 0.2352941, 1, 0, 1,
-0.5757936, -0.1050181, -0.8550593, 0.2313726, 1, 0, 1,
-0.5564153, -0.4154409, -3.384556, 0.2235294, 1, 0, 1,
-0.5546244, 1.434024, 1.073773, 0.2196078, 1, 0, 1,
-0.5519141, -0.4841917, -3.87929, 0.2117647, 1, 0, 1,
-0.5454746, 0.07280177, -1.233416, 0.2078431, 1, 0, 1,
-0.542541, 0.1712032, -1.509367, 0.2, 1, 0, 1,
-0.5348101, -0.4716315, -2.726828, 0.1921569, 1, 0, 1,
-0.5344517, 0.07432483, -1.984347, 0.1882353, 1, 0, 1,
-0.53324, 0.6450132, -0.2506595, 0.1803922, 1, 0, 1,
-0.5327285, -0.499461, -3.102392, 0.1764706, 1, 0, 1,
-0.5326579, 0.1420454, -1.141706, 0.1686275, 1, 0, 1,
-0.5230241, -0.1455051, -2.356596, 0.1647059, 1, 0, 1,
-0.5207782, -0.2909014, -3.312456, 0.1568628, 1, 0, 1,
-0.5168989, 1.446542, -0.3707438, 0.1529412, 1, 0, 1,
-0.5155457, -0.0242948, -2.624789, 0.145098, 1, 0, 1,
-0.5082016, 0.4653718, -1.801512, 0.1411765, 1, 0, 1,
-0.5061835, 0.5080298, -0.8347912, 0.1333333, 1, 0, 1,
-0.5059297, 2.234868, -0.4005574, 0.1294118, 1, 0, 1,
-0.5041819, 0.94921, -0.4157532, 0.1215686, 1, 0, 1,
-0.50267, 0.2174024, -1.796453, 0.1176471, 1, 0, 1,
-0.4986427, 0.08306991, -1.224673, 0.1098039, 1, 0, 1,
-0.4938521, -1.234298, -2.455475, 0.1058824, 1, 0, 1,
-0.4930789, -0.4925385, -2.074852, 0.09803922, 1, 0, 1,
-0.4903001, -1.08413, -2.625517, 0.09019608, 1, 0, 1,
-0.4896328, -0.4085277, -2.402544, 0.08627451, 1, 0, 1,
-0.4810362, 1.095261, 0.8035398, 0.07843138, 1, 0, 1,
-0.4734565, -0.4335155, -4.112462, 0.07450981, 1, 0, 1,
-0.4689186, 0.6009359, -0.02888367, 0.06666667, 1, 0, 1,
-0.4686728, 0.001318534, -0.8347359, 0.0627451, 1, 0, 1,
-0.4685338, -0.9721304, -4.441017, 0.05490196, 1, 0, 1,
-0.4650449, -0.9714494, -2.064856, 0.05098039, 1, 0, 1,
-0.4637317, 0.5618876, 0.05308803, 0.04313726, 1, 0, 1,
-0.4620161, -0.1376267, -0.631354, 0.03921569, 1, 0, 1,
-0.4611537, 2.089, -2.249008, 0.03137255, 1, 0, 1,
-0.4574621, 0.4482723, -1.251876, 0.02745098, 1, 0, 1,
-0.4570129, 0.2283113, -0.5872183, 0.01960784, 1, 0, 1,
-0.4534591, 0.6382287, 0.2176345, 0.01568628, 1, 0, 1,
-0.4482074, 0.6324525, -1.201036, 0.007843138, 1, 0, 1,
-0.4468539, 0.9086341, -2.01663, 0.003921569, 1, 0, 1,
-0.4446811, -0.5540706, -0.8797166, 0, 1, 0.003921569, 1,
-0.4444646, 0.1551938, -1.566054, 0, 1, 0.01176471, 1,
-0.4435816, 0.2503007, -1.586306, 0, 1, 0.01568628, 1,
-0.4410143, 1.607007, 0.3941169, 0, 1, 0.02352941, 1,
-0.4398648, 0.5357895, -1.532691, 0, 1, 0.02745098, 1,
-0.4354184, 0.9075335, -0.8184914, 0, 1, 0.03529412, 1,
-0.4280905, -2.044467, -3.428849, 0, 1, 0.03921569, 1,
-0.4256317, 1.122025, -0.01010311, 0, 1, 0.04705882, 1,
-0.4254371, 0.7846551, -1.56881, 0, 1, 0.05098039, 1,
-0.4225668, -0.9609203, -2.02962, 0, 1, 0.05882353, 1,
-0.4190059, -1.1784, -2.540921, 0, 1, 0.0627451, 1,
-0.4159515, -0.5361183, -2.595863, 0, 1, 0.07058824, 1,
-0.4080151, 0.713269, -0.2482266, 0, 1, 0.07450981, 1,
-0.4052146, 0.6499444, -0.3155692, 0, 1, 0.08235294, 1,
-0.4022655, 0.02037583, -0.8425259, 0, 1, 0.08627451, 1,
-0.397892, 1.762905, 1.398179, 0, 1, 0.09411765, 1,
-0.3860425, -0.7724729, -3.766951, 0, 1, 0.1019608, 1,
-0.3851752, 0.6911181, -1.703878, 0, 1, 0.1058824, 1,
-0.3726001, 1.681224, 0.08944602, 0, 1, 0.1137255, 1,
-0.3712134, -1.486878, -2.906661, 0, 1, 0.1176471, 1,
-0.3653984, -1.030671, -3.493531, 0, 1, 0.1254902, 1,
-0.3628038, 1.175426, -0.3328119, 0, 1, 0.1294118, 1,
-0.3623919, 0.2901052, -0.9682597, 0, 1, 0.1372549, 1,
-0.3588172, 1.148016, -1.016826, 0, 1, 0.1411765, 1,
-0.3582267, 0.4424267, -0.03289284, 0, 1, 0.1490196, 1,
-0.3541811, 2.153077, -1.28635, 0, 1, 0.1529412, 1,
-0.3539943, -0.8100066, -4.261711, 0, 1, 0.1607843, 1,
-0.3514905, -0.4993051, -2.995467, 0, 1, 0.1647059, 1,
-0.348452, -0.8092303, -1.951737, 0, 1, 0.172549, 1,
-0.3457395, 0.706917, -0.4283731, 0, 1, 0.1764706, 1,
-0.3446982, 0.4137501, 0.941224, 0, 1, 0.1843137, 1,
-0.342083, 1.296942, -0.7260104, 0, 1, 0.1882353, 1,
-0.3420397, -0.2034208, -1.938279, 0, 1, 0.1960784, 1,
-0.3396117, 1.059822, -1.492122, 0, 1, 0.2039216, 1,
-0.3393502, 0.3876806, 0.2554092, 0, 1, 0.2078431, 1,
-0.3364373, 2.010803, -0.2044144, 0, 1, 0.2156863, 1,
-0.3344537, -2.280332, -3.47069, 0, 1, 0.2196078, 1,
-0.3335877, 1.099263, 1.11361, 0, 1, 0.227451, 1,
-0.3328334, 0.03341534, -1.384012, 0, 1, 0.2313726, 1,
-0.3295988, -0.8520617, -2.902237, 0, 1, 0.2392157, 1,
-0.3294129, 1.307094, -1.342235, 0, 1, 0.2431373, 1,
-0.3289247, 0.08247606, -2.257798, 0, 1, 0.2509804, 1,
-0.3264206, -0.9045066, -3.050673, 0, 1, 0.254902, 1,
-0.3260961, -0.5354095, -3.504215, 0, 1, 0.2627451, 1,
-0.3249567, -0.7220294, -3.061786, 0, 1, 0.2666667, 1,
-0.3237441, 0.6327019, -0.08240674, 0, 1, 0.2745098, 1,
-0.3227141, -0.4343382, -1.879631, 0, 1, 0.2784314, 1,
-0.3210136, 0.1412476, -1.855549, 0, 1, 0.2862745, 1,
-0.3181695, 0.7619843, 0.03973777, 0, 1, 0.2901961, 1,
-0.3150072, 0.7442436, 0.104563, 0, 1, 0.2980392, 1,
-0.3147422, -0.743344, -2.002761, 0, 1, 0.3058824, 1,
-0.3118717, -1.796882, -2.278734, 0, 1, 0.3098039, 1,
-0.3112788, -0.1621137, -3.626597, 0, 1, 0.3176471, 1,
-0.3103392, -1.304666, -4.393635, 0, 1, 0.3215686, 1,
-0.3081126, 0.2992009, -0.8020688, 0, 1, 0.3294118, 1,
-0.3073113, -2.226613, -3.008452, 0, 1, 0.3333333, 1,
-0.3069836, -1.044795, -2.234416, 0, 1, 0.3411765, 1,
-0.3026905, -0.3136145, -3.562077, 0, 1, 0.345098, 1,
-0.2986687, 0.04920447, -0.27587, 0, 1, 0.3529412, 1,
-0.2970726, 0.3432565, -0.232837, 0, 1, 0.3568628, 1,
-0.2969911, -1.288242, -1.796424, 0, 1, 0.3647059, 1,
-0.2958014, 0.2656522, -1.297639, 0, 1, 0.3686275, 1,
-0.2943448, -1.324021, -2.482589, 0, 1, 0.3764706, 1,
-0.283076, -0.09483343, -2.652905, 0, 1, 0.3803922, 1,
-0.2737218, 1.497283, 0.702089, 0, 1, 0.3882353, 1,
-0.2711082, -1.834349, -4.359813, 0, 1, 0.3921569, 1,
-0.26957, 2.758458, 0.6203787, 0, 1, 0.4, 1,
-0.2654492, -0.1068702, -2.609109, 0, 1, 0.4078431, 1,
-0.2594263, 0.1631279, -2.960206, 0, 1, 0.4117647, 1,
-0.255048, 0.2127707, 0.01416092, 0, 1, 0.4196078, 1,
-0.2546735, -2.059744, -3.760868, 0, 1, 0.4235294, 1,
-0.2524087, -1.283289, -3.546624, 0, 1, 0.4313726, 1,
-0.2510433, -0.5836051, -2.135904, 0, 1, 0.4352941, 1,
-0.2506184, -0.578078, -4.352616, 0, 1, 0.4431373, 1,
-0.2474883, -0.2380423, -2.07654, 0, 1, 0.4470588, 1,
-0.2472118, -1.219145, -4.131389, 0, 1, 0.454902, 1,
-0.2432788, 1.832231, -0.5201243, 0, 1, 0.4588235, 1,
-0.2421731, 0.1901171, -0.3196871, 0, 1, 0.4666667, 1,
-0.2392298, 0.9232169, 0.5953835, 0, 1, 0.4705882, 1,
-0.235978, -0.6894622, -2.499942, 0, 1, 0.4784314, 1,
-0.23185, -0.3422669, -3.417581, 0, 1, 0.4823529, 1,
-0.2300417, -0.6039193, -0.8547028, 0, 1, 0.4901961, 1,
-0.2281514, 2.424231, 0.6150041, 0, 1, 0.4941176, 1,
-0.224521, -1.010029, -3.542928, 0, 1, 0.5019608, 1,
-0.2206519, -0.1060928, -3.299607, 0, 1, 0.509804, 1,
-0.2206308, 1.027332, 0.1344737, 0, 1, 0.5137255, 1,
-0.2118279, -0.6074775, -2.835468, 0, 1, 0.5215687, 1,
-0.2089443, -0.2283437, -2.492498, 0, 1, 0.5254902, 1,
-0.2088178, 0.1650013, -0.3660564, 0, 1, 0.5333334, 1,
-0.2055423, 0.3177867, 0.3478366, 0, 1, 0.5372549, 1,
-0.1995173, -0.7990189, -2.764271, 0, 1, 0.5450981, 1,
-0.1967566, -0.1542985, -2.507657, 0, 1, 0.5490196, 1,
-0.1966742, 1.343592, -0.6462305, 0, 1, 0.5568628, 1,
-0.1962922, -0.2875903, -0.9423667, 0, 1, 0.5607843, 1,
-0.195888, 0.6173973, 0.2373012, 0, 1, 0.5686275, 1,
-0.1957608, 0.04392288, -0.5331063, 0, 1, 0.572549, 1,
-0.195435, 0.7560848, 0.9540351, 0, 1, 0.5803922, 1,
-0.1915853, -0.9122804, -2.87052, 0, 1, 0.5843138, 1,
-0.1826613, 0.4451541, 0.916114, 0, 1, 0.5921569, 1,
-0.1820168, 0.8164604, -0.1906096, 0, 1, 0.5960785, 1,
-0.1772482, 1.057842, 0.4806713, 0, 1, 0.6039216, 1,
-0.1767205, 1.632951, 0.7065983, 0, 1, 0.6117647, 1,
-0.1734142, 1.445535, 1.015387, 0, 1, 0.6156863, 1,
-0.1708357, -0.1852984, -1.864102, 0, 1, 0.6235294, 1,
-0.169427, 1.000978, 0.8316986, 0, 1, 0.627451, 1,
-0.1634247, -0.6692266, -3.067234, 0, 1, 0.6352941, 1,
-0.1618786, -0.3042307, -2.376285, 0, 1, 0.6392157, 1,
-0.1614432, 1.057382, 0.5866227, 0, 1, 0.6470588, 1,
-0.161316, 0.692872, -0.1613506, 0, 1, 0.6509804, 1,
-0.160414, 1.135547, -2.502674, 0, 1, 0.6588235, 1,
-0.1598588, -0.5988539, -2.106398, 0, 1, 0.6627451, 1,
-0.1597645, -0.2398748, -3.189873, 0, 1, 0.6705883, 1,
-0.1571693, -1.538732, -1.649184, 0, 1, 0.6745098, 1,
-0.1550253, 0.2737833, -1.907474, 0, 1, 0.682353, 1,
-0.153911, 0.5678017, -1.408404, 0, 1, 0.6862745, 1,
-0.1528079, -0.1244793, -2.241158, 0, 1, 0.6941177, 1,
-0.1506915, -0.2605722, -1.740463, 0, 1, 0.7019608, 1,
-0.1501835, 1.38935, -1.321751, 0, 1, 0.7058824, 1,
-0.1501699, 0.4451871, 0.0486517, 0, 1, 0.7137255, 1,
-0.147771, 0.2945667, -1.113759, 0, 1, 0.7176471, 1,
-0.1464392, -0.2021815, -1.890956, 0, 1, 0.7254902, 1,
-0.1453439, -1.031165, -1.514929, 0, 1, 0.7294118, 1,
-0.1445464, 0.4238937, -1.595578, 0, 1, 0.7372549, 1,
-0.141672, 0.2511478, 0.3370773, 0, 1, 0.7411765, 1,
-0.1394442, -0.7920986, -3.836525, 0, 1, 0.7490196, 1,
-0.1343081, -1.92711, -2.997177, 0, 1, 0.7529412, 1,
-0.130703, -0.4160854, -2.931301, 0, 1, 0.7607843, 1,
-0.1299094, -1.073073, -3.403343, 0, 1, 0.7647059, 1,
-0.1288504, 0.1563135, 1.385858, 0, 1, 0.772549, 1,
-0.1287865, 0.69848, 0.3552982, 0, 1, 0.7764706, 1,
-0.1264859, 0.2375722, -1.069466, 0, 1, 0.7843137, 1,
-0.1250168, -0.2519159, -1.474944, 0, 1, 0.7882353, 1,
-0.1242151, 0.640187, -0.1464598, 0, 1, 0.7960784, 1,
-0.1238546, 0.1795845, 0.4597889, 0, 1, 0.8039216, 1,
-0.1230607, 0.09993374, -0.6268479, 0, 1, 0.8078431, 1,
-0.1212128, 0.2609171, -1.44221, 0, 1, 0.8156863, 1,
-0.121148, 0.6360492, -1.402411, 0, 1, 0.8196079, 1,
-0.120443, -0.9077989, -1.529698, 0, 1, 0.827451, 1,
-0.1190306, 0.7328479, -0.1874303, 0, 1, 0.8313726, 1,
-0.1185895, -1.060854, -2.333741, 0, 1, 0.8392157, 1,
-0.1171539, 0.3682047, 0.07821518, 0, 1, 0.8431373, 1,
-0.1167769, 0.74756, -0.1999148, 0, 1, 0.8509804, 1,
-0.1161119, -0.9541799, -4.245978, 0, 1, 0.854902, 1,
-0.1123206, 1.738762, -1.017367, 0, 1, 0.8627451, 1,
-0.1110147, -0.04714704, -0.8743511, 0, 1, 0.8666667, 1,
-0.1069377, -0.4490204, -1.561546, 0, 1, 0.8745098, 1,
-0.1044084, 1.217314, -0.2246853, 0, 1, 0.8784314, 1,
-0.1040225, -2.097032, -2.962897, 0, 1, 0.8862745, 1,
-0.103396, 0.07423285, -1.532362, 0, 1, 0.8901961, 1,
-0.1031335, 0.9585661, 0.7509039, 0, 1, 0.8980392, 1,
-0.09864666, 0.2945133, -0.499583, 0, 1, 0.9058824, 1,
-0.09581127, 0.8706207, -0.5345444, 0, 1, 0.9098039, 1,
-0.09469803, -1.352527, -3.594381, 0, 1, 0.9176471, 1,
-0.08808458, 0.09418079, -1.095052, 0, 1, 0.9215686, 1,
-0.08650301, -0.5529531, -2.169854, 0, 1, 0.9294118, 1,
-0.08440956, -1.505386, -3.152576, 0, 1, 0.9333333, 1,
-0.08268402, 0.1758655, -0.02540162, 0, 1, 0.9411765, 1,
-0.07920042, 0.4727644, -1.373211, 0, 1, 0.945098, 1,
-0.07880796, -0.229497, -3.983968, 0, 1, 0.9529412, 1,
-0.07774853, -2.800126, -4.257519, 0, 1, 0.9568627, 1,
-0.0763101, 0.1008973, -1.45543, 0, 1, 0.9647059, 1,
-0.07048551, 0.1188895, -1.578483, 0, 1, 0.9686275, 1,
-0.06879529, -0.4702429, -3.440013, 0, 1, 0.9764706, 1,
-0.06614558, -0.5465567, -4.077247, 0, 1, 0.9803922, 1,
-0.06388728, 1.212904, 1.535182, 0, 1, 0.9882353, 1,
-0.06217046, 1.085644, -0.7756945, 0, 1, 0.9921569, 1,
-0.05760682, 0.4321087, -1.868552, 0, 1, 1, 1,
-0.0536979, -1.17398, -1.848916, 0, 0.9921569, 1, 1,
-0.04913328, -0.5000832, -4.890748, 0, 0.9882353, 1, 1,
-0.04870506, 0.1959879, 1.571588, 0, 0.9803922, 1, 1,
-0.04618952, -0.935199, -1.946947, 0, 0.9764706, 1, 1,
-0.04146631, 1.191491, 0.6840428, 0, 0.9686275, 1, 1,
-0.03656497, -0.5611993, -3.56341, 0, 0.9647059, 1, 1,
-0.03445467, -0.5452833, -4.393014, 0, 0.9568627, 1, 1,
-0.03380178, 0.5827034, 0.930539, 0, 0.9529412, 1, 1,
-0.03085326, 1.332083, -0.6809807, 0, 0.945098, 1, 1,
-0.02953705, 0.03913691, -0.8492289, 0, 0.9411765, 1, 1,
-0.02887875, -1.500705, -3.81391, 0, 0.9333333, 1, 1,
-0.02525921, -0.64794, -2.477241, 0, 0.9294118, 1, 1,
-0.02177443, 0.01990089, -1.212199, 0, 0.9215686, 1, 1,
-0.02022217, 0.7768307, 1.417322, 0, 0.9176471, 1, 1,
-0.01546329, -0.6351131, -2.02176, 0, 0.9098039, 1, 1,
-0.01124961, 0.2402103, -0.7291516, 0, 0.9058824, 1, 1,
-0.00771124, 0.4722939, -2.12235, 0, 0.8980392, 1, 1,
-0.005800327, 0.598657, 1.200986, 0, 0.8901961, 1, 1,
-0.003976148, -1.047815, -3.405941, 0, 0.8862745, 1, 1,
0.001207432, 1.039977, 1.165911, 0, 0.8784314, 1, 1,
0.006057302, 0.3976483, 0.4340606, 0, 0.8745098, 1, 1,
0.007978451, 0.6413433, 0.2017452, 0, 0.8666667, 1, 1,
0.01138692, 1.328158, -0.3565761, 0, 0.8627451, 1, 1,
0.01237116, 0.0150936, 1.012012, 0, 0.854902, 1, 1,
0.01556084, 2.19166, 1.165682, 0, 0.8509804, 1, 1,
0.02035618, -0.5741284, 0.8482662, 0, 0.8431373, 1, 1,
0.02052829, 1.756479, -1.129901, 0, 0.8392157, 1, 1,
0.02703136, -0.2243939, 3.535774, 0, 0.8313726, 1, 1,
0.03090377, -0.0749464, 2.053889, 0, 0.827451, 1, 1,
0.03753248, 0.5681435, -0.4976931, 0, 0.8196079, 1, 1,
0.03938439, 1.150245, -0.9532452, 0, 0.8156863, 1, 1,
0.0417171, -0.50622, 2.390722, 0, 0.8078431, 1, 1,
0.04304398, 1.216686, 0.4909041, 0, 0.8039216, 1, 1,
0.04433172, -0.1149911, 4.043342, 0, 0.7960784, 1, 1,
0.04465544, -0.879414, 2.285372, 0, 0.7882353, 1, 1,
0.04680122, 1.820996, -0.6746442, 0, 0.7843137, 1, 1,
0.05263897, 1.185232, 0.9589485, 0, 0.7764706, 1, 1,
0.06090065, 1.221724, 0.151207, 0, 0.772549, 1, 1,
0.06239109, 1.928596, -1.163107, 0, 0.7647059, 1, 1,
0.06301453, 0.5901588, -0.5233842, 0, 0.7607843, 1, 1,
0.06403438, 0.4029557, -0.3641802, 0, 0.7529412, 1, 1,
0.06512234, 0.9498338, 1.477306, 0, 0.7490196, 1, 1,
0.06840517, -1.769078, 3.451122, 0, 0.7411765, 1, 1,
0.06855109, 0.7309263, -0.3209561, 0, 0.7372549, 1, 1,
0.07036649, 0.6164702, 0.7611257, 0, 0.7294118, 1, 1,
0.07102755, -0.09913461, 2.434718, 0, 0.7254902, 1, 1,
0.07274084, -0.4725899, 2.144653, 0, 0.7176471, 1, 1,
0.07512224, 0.8902133, 0.6542212, 0, 0.7137255, 1, 1,
0.0809572, 0.5043237, 0.5035253, 0, 0.7058824, 1, 1,
0.08611558, -1.487075, 3.516652, 0, 0.6980392, 1, 1,
0.08669696, -0.8337111, 2.146432, 0, 0.6941177, 1, 1,
0.09648998, 0.2933732, -0.1840427, 0, 0.6862745, 1, 1,
0.09671034, 1.347432, 1.635659, 0, 0.682353, 1, 1,
0.1011218, -0.05425958, 1.45885, 0, 0.6745098, 1, 1,
0.1026757, -0.4783456, 2.634119, 0, 0.6705883, 1, 1,
0.1102099, -0.9392428, 6.075404, 0, 0.6627451, 1, 1,
0.1106805, 0.1034237, 0.2971058, 0, 0.6588235, 1, 1,
0.1114738, 0.9698399, 0.3405947, 0, 0.6509804, 1, 1,
0.1207773, 0.6128685, -0.1671329, 0, 0.6470588, 1, 1,
0.1208081, -0.8738591, 1.499617, 0, 0.6392157, 1, 1,
0.1216522, 1.009065, -0.3880659, 0, 0.6352941, 1, 1,
0.1240036, 0.5778647, -1.481904, 0, 0.627451, 1, 1,
0.126935, -0.6836419, 2.738856, 0, 0.6235294, 1, 1,
0.1285813, -0.6842148, 2.071625, 0, 0.6156863, 1, 1,
0.1303945, 0.4234442, 0.6099221, 0, 0.6117647, 1, 1,
0.1351921, -0.4027096, 2.807167, 0, 0.6039216, 1, 1,
0.1380288, -0.1404478, 1.623509, 0, 0.5960785, 1, 1,
0.1382761, 1.267366, -0.5409795, 0, 0.5921569, 1, 1,
0.1433261, -0.1603037, 4.401126, 0, 0.5843138, 1, 1,
0.1439693, -0.2737797, 1.554003, 0, 0.5803922, 1, 1,
0.1491, -0.9325968, 2.016058, 0, 0.572549, 1, 1,
0.1499895, 0.6185291, 0.3465419, 0, 0.5686275, 1, 1,
0.1554307, -0.04082116, 1.872608, 0, 0.5607843, 1, 1,
0.1570327, -1.633142, 3.214957, 0, 0.5568628, 1, 1,
0.1571857, 1.228794, 0.03823751, 0, 0.5490196, 1, 1,
0.1604553, -0.6934967, 3.764081, 0, 0.5450981, 1, 1,
0.1651178, -1.154637, 3.435128, 0, 0.5372549, 1, 1,
0.1666815, -0.3204492, 2.622831, 0, 0.5333334, 1, 1,
0.1724253, -0.1233376, 3.073736, 0, 0.5254902, 1, 1,
0.1730291, 0.9944115, -1.051482, 0, 0.5215687, 1, 1,
0.173562, 0.3257944, 2.097417, 0, 0.5137255, 1, 1,
0.1750159, 0.7805823, -0.1759192, 0, 0.509804, 1, 1,
0.1761182, -1.289347, 3.046784, 0, 0.5019608, 1, 1,
0.1786709, 0.03789892, 0.5579758, 0, 0.4941176, 1, 1,
0.1839539, -2.907165, 1.673793, 0, 0.4901961, 1, 1,
0.1874102, 1.010073, 1.285073, 0, 0.4823529, 1, 1,
0.1911982, 0.9138573, 0.3153865, 0, 0.4784314, 1, 1,
0.1929383, -0.4020519, 4.533497, 0, 0.4705882, 1, 1,
0.1946971, -1.068725, 4.050645, 0, 0.4666667, 1, 1,
0.1952301, 0.3567147, 1.115236, 0, 0.4588235, 1, 1,
0.1960576, -0.01499152, 2.083076, 0, 0.454902, 1, 1,
0.1961023, 0.8901216, -1.049857, 0, 0.4470588, 1, 1,
0.1966951, 0.9392812, -0.1126105, 0, 0.4431373, 1, 1,
0.1969087, -1.555384, 2.801798, 0, 0.4352941, 1, 1,
0.1975092, 0.8636481, 0.9169382, 0, 0.4313726, 1, 1,
0.2001613, -0.2761774, 1.752925, 0, 0.4235294, 1, 1,
0.2022385, 0.8386204, -0.05029561, 0, 0.4196078, 1, 1,
0.2056842, 0.8864793, 0.5256942, 0, 0.4117647, 1, 1,
0.2069466, 0.9467414, -0.6943957, 0, 0.4078431, 1, 1,
0.2072016, 0.5696021, 1.030265, 0, 0.4, 1, 1,
0.2075039, -1.724504, 3.465869, 0, 0.3921569, 1, 1,
0.2085215, 1.423186, -0.4234651, 0, 0.3882353, 1, 1,
0.2131558, -2.040901, 3.697039, 0, 0.3803922, 1, 1,
0.2194886, -1.14105, 2.410207, 0, 0.3764706, 1, 1,
0.2198997, 1.375782, 0.3840167, 0, 0.3686275, 1, 1,
0.2213509, -0.5956675, 1.787925, 0, 0.3647059, 1, 1,
0.2232209, 2.216436, -0.3522955, 0, 0.3568628, 1, 1,
0.2241841, -0.2815673, 3.298347, 0, 0.3529412, 1, 1,
0.2312547, 0.8048142, 0.3268989, 0, 0.345098, 1, 1,
0.2352527, 0.9208607, -1.112898, 0, 0.3411765, 1, 1,
0.2396731, -0.1894094, 2.438929, 0, 0.3333333, 1, 1,
0.2412779, -0.6639389, 2.075947, 0, 0.3294118, 1, 1,
0.2430121, 1.584768, -0.2265261, 0, 0.3215686, 1, 1,
0.2451827, -1.531011, 2.619153, 0, 0.3176471, 1, 1,
0.2468331, -0.9762611, 3.697472, 0, 0.3098039, 1, 1,
0.2502643, 2.040244, -0.2600868, 0, 0.3058824, 1, 1,
0.250273, -0.6579654, 1.625072, 0, 0.2980392, 1, 1,
0.2515612, -0.2153104, 3.861248, 0, 0.2901961, 1, 1,
0.2530904, -0.226957, 1.424924, 0, 0.2862745, 1, 1,
0.2572611, 0.7184962, 2.886176, 0, 0.2784314, 1, 1,
0.2583679, 0.7867155, -0.45802, 0, 0.2745098, 1, 1,
0.2585208, 1.043429, 1.218752, 0, 0.2666667, 1, 1,
0.2591075, 1.317663, -0.7378882, 0, 0.2627451, 1, 1,
0.266659, -1.616006, 4.170993, 0, 0.254902, 1, 1,
0.268365, -1.537565, 0.849783, 0, 0.2509804, 1, 1,
0.2686124, 0.4533831, -0.8805536, 0, 0.2431373, 1, 1,
0.282637, 0.8419673, -0.4729751, 0, 0.2392157, 1, 1,
0.2835215, 0.06436168, -0.2357415, 0, 0.2313726, 1, 1,
0.2835222, 1.287102, -0.3244717, 0, 0.227451, 1, 1,
0.2838751, 0.2781088, 0.8691816, 0, 0.2196078, 1, 1,
0.2848463, -1.337375, 0.9888572, 0, 0.2156863, 1, 1,
0.2852564, 1.583668, 0.7413239, 0, 0.2078431, 1, 1,
0.2913064, 0.3698125, 1.106655, 0, 0.2039216, 1, 1,
0.2947753, -0.03575078, 0.4675847, 0, 0.1960784, 1, 1,
0.2990536, -0.7015423, -0.3541955, 0, 0.1882353, 1, 1,
0.3021479, 0.227665, 1.388585, 0, 0.1843137, 1, 1,
0.3100477, -0.7886392, 2.988947, 0, 0.1764706, 1, 1,
0.3107384, -1.03716, 2.425994, 0, 0.172549, 1, 1,
0.3118243, -0.28879, 0.8201801, 0, 0.1647059, 1, 1,
0.312459, 0.2683836, -0.1777031, 0, 0.1607843, 1, 1,
0.3172971, 0.06897584, 1.706121, 0, 0.1529412, 1, 1,
0.3207366, 0.6046529, 1.207273, 0, 0.1490196, 1, 1,
0.323857, 0.7692723, 0.688089, 0, 0.1411765, 1, 1,
0.3245623, -0.7423896, 1.511706, 0, 0.1372549, 1, 1,
0.3308691, 0.8445963, 1.998549, 0, 0.1294118, 1, 1,
0.3354626, -0.07717382, 2.762768, 0, 0.1254902, 1, 1,
0.3376143, -0.7795483, 2.191553, 0, 0.1176471, 1, 1,
0.3378661, -0.310856, 3.738257, 0, 0.1137255, 1, 1,
0.3395944, 1.118914, 1.306768, 0, 0.1058824, 1, 1,
0.343818, 1.878432, -0.4823759, 0, 0.09803922, 1, 1,
0.3448261, -1.813091, 2.78975, 0, 0.09411765, 1, 1,
0.3456195, -0.9235721, 2.926238, 0, 0.08627451, 1, 1,
0.3498157, 1.695171, -0.7772174, 0, 0.08235294, 1, 1,
0.3506653, 0.2486822, 1.532882, 0, 0.07450981, 1, 1,
0.3525981, -0.05835645, 1.749794, 0, 0.07058824, 1, 1,
0.3542341, 0.009456147, 2.972436, 0, 0.0627451, 1, 1,
0.3638419, 1.280504, 0.2915201, 0, 0.05882353, 1, 1,
0.374428, -0.445217, 3.294704, 0, 0.05098039, 1, 1,
0.3749506, -0.2593826, 0.4585478, 0, 0.04705882, 1, 1,
0.3761362, 0.6536306, 0.7617338, 0, 0.03921569, 1, 1,
0.3826584, 1.340067, 0.7620247, 0, 0.03529412, 1, 1,
0.3845371, 0.09249691, 0.02731082, 0, 0.02745098, 1, 1,
0.3866133, -0.1606142, 2.360649, 0, 0.02352941, 1, 1,
0.3872627, 0.2212382, 3.110538, 0, 0.01568628, 1, 1,
0.3985365, -1.6211, 4.947154, 0, 0.01176471, 1, 1,
0.406984, 0.4706431, 0.8901307, 0, 0.003921569, 1, 1,
0.4087346, -1.454689, 1.750839, 0.003921569, 0, 1, 1,
0.4108982, 1.019067, 0.4076186, 0.007843138, 0, 1, 1,
0.4220232, 0.7310258, 0.6741701, 0.01568628, 0, 1, 1,
0.4295007, -0.8658472, 1.671917, 0.01960784, 0, 1, 1,
0.4303463, -1.930155, 2.64565, 0.02745098, 0, 1, 1,
0.430815, -0.9915033, 5.449463, 0.03137255, 0, 1, 1,
0.4322125, -0.713345, 2.902596, 0.03921569, 0, 1, 1,
0.4333805, 1.882319, 0.552294, 0.04313726, 0, 1, 1,
0.434179, 1.545939, 1.524141, 0.05098039, 0, 1, 1,
0.4408114, 0.7334908, 0.22609, 0.05490196, 0, 1, 1,
0.4411775, -0.828491, 2.788457, 0.0627451, 0, 1, 1,
0.4414612, 1.611406, -0.04243435, 0.06666667, 0, 1, 1,
0.4447801, -0.1448662, 1.075499, 0.07450981, 0, 1, 1,
0.445221, -1.001782, 3.746259, 0.07843138, 0, 1, 1,
0.4476902, 1.051113, -0.3815536, 0.08627451, 0, 1, 1,
0.4542216, 0.1761056, 2.794437, 0.09019608, 0, 1, 1,
0.4564705, 0.5943739, -1.306924, 0.09803922, 0, 1, 1,
0.4611733, 0.3386459, 1.56225, 0.1058824, 0, 1, 1,
0.4749092, -0.4801628, 3.089256, 0.1098039, 0, 1, 1,
0.4761344, 0.3935775, 0.9153815, 0.1176471, 0, 1, 1,
0.4803482, 0.1085781, 1.4796, 0.1215686, 0, 1, 1,
0.4815492, 0.9198732, -0.7727683, 0.1294118, 0, 1, 1,
0.48209, 0.5236704, 0.5137379, 0.1333333, 0, 1, 1,
0.485425, 0.1156754, 0.8615345, 0.1411765, 0, 1, 1,
0.4895611, 0.4062118, -0.2038156, 0.145098, 0, 1, 1,
0.4931086, 0.7003962, -0.6746956, 0.1529412, 0, 1, 1,
0.5046957, -0.3371182, 0.3153395, 0.1568628, 0, 1, 1,
0.5096683, 0.7261971, 0.3516235, 0.1647059, 0, 1, 1,
0.5147937, 1.708037, -0.1290153, 0.1686275, 0, 1, 1,
0.5185646, 0.9880291, 1.405107, 0.1764706, 0, 1, 1,
0.5220008, 0.5343457, 0.268925, 0.1803922, 0, 1, 1,
0.5233299, 0.6210999, 2.402984, 0.1882353, 0, 1, 1,
0.5264451, -1.241974, 1.27933, 0.1921569, 0, 1, 1,
0.5303883, 0.7696044, 0.9676441, 0.2, 0, 1, 1,
0.5322367, 0.2698907, -0.6813049, 0.2078431, 0, 1, 1,
0.5346484, 0.01093027, 0.4074143, 0.2117647, 0, 1, 1,
0.5364513, -0.2854402, 0.1137278, 0.2196078, 0, 1, 1,
0.5405143, 0.2134841, 2.221465, 0.2235294, 0, 1, 1,
0.5415694, 0.7458023, 0.5260864, 0.2313726, 0, 1, 1,
0.5440542, -1.405485, 3.30527, 0.2352941, 0, 1, 1,
0.5489372, -0.7052149, 0.8674944, 0.2431373, 0, 1, 1,
0.5493432, 0.1395182, 1.275311, 0.2470588, 0, 1, 1,
0.5500355, -0.7581152, 2.872927, 0.254902, 0, 1, 1,
0.5504174, -0.2937663, 2.448086, 0.2588235, 0, 1, 1,
0.5564082, -2.057614, 1.28619, 0.2666667, 0, 1, 1,
0.5565157, -0.3141459, 3.169963, 0.2705882, 0, 1, 1,
0.5568386, -0.6228053, 3.061135, 0.2784314, 0, 1, 1,
0.5588889, -0.2439002, 2.599349, 0.282353, 0, 1, 1,
0.5594197, 0.8183486, 0.5124335, 0.2901961, 0, 1, 1,
0.5602304, -1.614962, 3.037649, 0.2941177, 0, 1, 1,
0.5611562, -1.228268, 1.628046, 0.3019608, 0, 1, 1,
0.5612767, 0.6501857, 2.471924, 0.3098039, 0, 1, 1,
0.5627217, 1.067365, 0.2052124, 0.3137255, 0, 1, 1,
0.5632842, -1.316571, 2.216824, 0.3215686, 0, 1, 1,
0.5634345, -1.209113, 5.240079, 0.3254902, 0, 1, 1,
0.5706116, -1.742707, 2.668417, 0.3333333, 0, 1, 1,
0.5725449, 0.5293046, 0.774865, 0.3372549, 0, 1, 1,
0.5726736, -0.1825394, 2.345149, 0.345098, 0, 1, 1,
0.5742597, 1.236612, -0.8476759, 0.3490196, 0, 1, 1,
0.5745701, -0.04468948, 2.30247, 0.3568628, 0, 1, 1,
0.5773459, -0.04811663, 2.375833, 0.3607843, 0, 1, 1,
0.5782036, 0.5727184, 0.3441051, 0.3686275, 0, 1, 1,
0.5801115, 0.3905589, 0.3512925, 0.372549, 0, 1, 1,
0.5810744, -0.5591514, 1.919546, 0.3803922, 0, 1, 1,
0.5821182, 0.6998978, -0.2997824, 0.3843137, 0, 1, 1,
0.5829107, 2.029368, 1.514125, 0.3921569, 0, 1, 1,
0.5841358, 0.7107716, 1.786205, 0.3960784, 0, 1, 1,
0.5888882, 0.4914168, -0.5530159, 0.4039216, 0, 1, 1,
0.5932202, -0.3329832, 2.738947, 0.4117647, 0, 1, 1,
0.5945785, -0.9059609, 2.868696, 0.4156863, 0, 1, 1,
0.5946621, 1.250163, -0.3448978, 0.4235294, 0, 1, 1,
0.595409, -0.7022684, 2.472859, 0.427451, 0, 1, 1,
0.599179, -0.7090455, 3.982612, 0.4352941, 0, 1, 1,
0.5995758, -0.7315843, 3.281289, 0.4392157, 0, 1, 1,
0.5997072, 0.6385096, 0.4845874, 0.4470588, 0, 1, 1,
0.6119324, -1.675428, 1.152754, 0.4509804, 0, 1, 1,
0.6175721, -0.9476438, 1.680614, 0.4588235, 0, 1, 1,
0.6199899, -0.4157003, 2.005629, 0.4627451, 0, 1, 1,
0.6221213, 0.8445824, -0.3992463, 0.4705882, 0, 1, 1,
0.6222237, 1.102557, 1.870021, 0.4745098, 0, 1, 1,
0.6241736, -0.1132476, -1.359196, 0.4823529, 0, 1, 1,
0.6338379, 0.8952458, 0.5162576, 0.4862745, 0, 1, 1,
0.6363255, 0.1054061, 0.4114936, 0.4941176, 0, 1, 1,
0.6368619, -0.3301556, 2.38931, 0.5019608, 0, 1, 1,
0.6438265, 0.1065487, 0.9264732, 0.5058824, 0, 1, 1,
0.6450361, 0.02450741, 1.091375, 0.5137255, 0, 1, 1,
0.6462802, 1.488457, 1.664887, 0.5176471, 0, 1, 1,
0.6469532, -0.7391938, 3.487239, 0.5254902, 0, 1, 1,
0.6469647, -1.034717, 1.991092, 0.5294118, 0, 1, 1,
0.6540226, 0.4672825, 0.9522516, 0.5372549, 0, 1, 1,
0.6545203, -0.03423546, 3.03455, 0.5411765, 0, 1, 1,
0.6551397, 0.2480803, 1.520711, 0.5490196, 0, 1, 1,
0.6568643, 0.8239257, 0.5885041, 0.5529412, 0, 1, 1,
0.6663741, -1.501969, 4.924564, 0.5607843, 0, 1, 1,
0.668672, -1.659165, 2.903073, 0.5647059, 0, 1, 1,
0.6696557, -0.8108253, 3.88979, 0.572549, 0, 1, 1,
0.6711169, -0.5529251, 3.810616, 0.5764706, 0, 1, 1,
0.6772599, 0.9224969, 0.6143918, 0.5843138, 0, 1, 1,
0.6802267, 0.9157094, 1.066691, 0.5882353, 0, 1, 1,
0.6833344, -1.678654, 3.740939, 0.5960785, 0, 1, 1,
0.6835487, -0.3221252, 1.974793, 0.6039216, 0, 1, 1,
0.6881443, -0.5039165, 1.368654, 0.6078432, 0, 1, 1,
0.6906796, 0.1564154, -1.076935, 0.6156863, 0, 1, 1,
0.6925019, -0.1382586, 1.896057, 0.6196079, 0, 1, 1,
0.696041, 1.544804, -0.6826937, 0.627451, 0, 1, 1,
0.6982923, -0.8975761, 2.406631, 0.6313726, 0, 1, 1,
0.7035736, -1.178198, 1.862895, 0.6392157, 0, 1, 1,
0.7084056, 0.8789846, 1.528453, 0.6431373, 0, 1, 1,
0.7093028, -0.4059286, 1.853553, 0.6509804, 0, 1, 1,
0.7132133, -0.1959336, 2.670589, 0.654902, 0, 1, 1,
0.7138492, -1.491154, 1.921244, 0.6627451, 0, 1, 1,
0.7141174, 0.3209928, 0.1830686, 0.6666667, 0, 1, 1,
0.7145474, -0.5193884, 4.42691, 0.6745098, 0, 1, 1,
0.7154317, -0.7919864, 2.02588, 0.6784314, 0, 1, 1,
0.7160864, 0.8408049, 1.09707, 0.6862745, 0, 1, 1,
0.7176834, 1.232024, -0.6750621, 0.6901961, 0, 1, 1,
0.7185424, 1.357669, 0.7790917, 0.6980392, 0, 1, 1,
0.7245991, -0.0847287, 1.587605, 0.7058824, 0, 1, 1,
0.7256126, -1.781297, 1.703683, 0.7098039, 0, 1, 1,
0.7260433, 1.955732, -0.2906723, 0.7176471, 0, 1, 1,
0.729749, 2.338213, -1.005183, 0.7215686, 0, 1, 1,
0.732608, -0.274621, 2.94206, 0.7294118, 0, 1, 1,
0.7385792, 0.3733671, 1.737602, 0.7333333, 0, 1, 1,
0.738605, -0.1109586, 2.356085, 0.7411765, 0, 1, 1,
0.7486619, -0.2454769, 1.399123, 0.7450981, 0, 1, 1,
0.7501727, 0.1496392, 1.90099, 0.7529412, 0, 1, 1,
0.7505564, 0.09731469, 1.579249, 0.7568628, 0, 1, 1,
0.7514331, -0.02253084, 1.378652, 0.7647059, 0, 1, 1,
0.75477, -0.7371489, 2.711842, 0.7686275, 0, 1, 1,
0.755631, 0.1758462, 0.8092279, 0.7764706, 0, 1, 1,
0.7557596, -0.6495873, 2.672435, 0.7803922, 0, 1, 1,
0.7582194, -0.3701343, -0.077738, 0.7882353, 0, 1, 1,
0.7626842, 0.6317032, 1.423695, 0.7921569, 0, 1, 1,
0.7646282, -0.08801597, 2.522299, 0.8, 0, 1, 1,
0.7648022, -0.669988, 3.335975, 0.8078431, 0, 1, 1,
0.7653019, 1.368038, 0.1772646, 0.8117647, 0, 1, 1,
0.7671325, -1.157684, 3.137236, 0.8196079, 0, 1, 1,
0.7680245, -0.1829893, 2.456424, 0.8235294, 0, 1, 1,
0.7686809, 0.04803365, 0.8896234, 0.8313726, 0, 1, 1,
0.7732551, 0.4871031, -0.6593585, 0.8352941, 0, 1, 1,
0.7777635, 0.03142379, 0.7378573, 0.8431373, 0, 1, 1,
0.7808191, -1.046481, 2.225494, 0.8470588, 0, 1, 1,
0.7811534, -1.752399, 2.401424, 0.854902, 0, 1, 1,
0.7819699, 0.04352137, 1.683658, 0.8588235, 0, 1, 1,
0.7857053, 0.6119699, -0.1375591, 0.8666667, 0, 1, 1,
0.7871765, -0.7687573, 3.424507, 0.8705882, 0, 1, 1,
0.7920371, 0.921744, 0.8071831, 0.8784314, 0, 1, 1,
0.7982402, 1.003858, -1.020942, 0.8823529, 0, 1, 1,
0.7994165, -1.911069, 1.847131, 0.8901961, 0, 1, 1,
0.7999778, -0.6396047, 1.081548, 0.8941177, 0, 1, 1,
0.8079023, -1.22267, 1.968879, 0.9019608, 0, 1, 1,
0.8092529, 1.46514, -1.111158, 0.9098039, 0, 1, 1,
0.8177785, -1.355302, 2.609055, 0.9137255, 0, 1, 1,
0.8182113, -0.4447705, 2.014611, 0.9215686, 0, 1, 1,
0.8182389, -0.3265149, 2.401619, 0.9254902, 0, 1, 1,
0.8209111, 0.66935, -0.8297366, 0.9333333, 0, 1, 1,
0.823051, 0.3685045, 1.508621, 0.9372549, 0, 1, 1,
0.8271626, -1.938525, 2.462827, 0.945098, 0, 1, 1,
0.8285795, 0.7757248, 1.197178, 0.9490196, 0, 1, 1,
0.8401195, -0.4265194, 3.576912, 0.9568627, 0, 1, 1,
0.8447835, -0.4024898, 2.72654, 0.9607843, 0, 1, 1,
0.8490067, -0.4471959, 0.8711682, 0.9686275, 0, 1, 1,
0.8521896, -0.274592, 2.043983, 0.972549, 0, 1, 1,
0.8533092, 0.474842, 1.973419, 0.9803922, 0, 1, 1,
0.8548501, -0.6974099, 1.547152, 0.9843137, 0, 1, 1,
0.8552987, 1.753496, 0.1216162, 0.9921569, 0, 1, 1,
0.8601016, -1.697154, 3.416033, 0.9960784, 0, 1, 1,
0.8610147, -1.079351, 3.153165, 1, 0, 0.9960784, 1,
0.8625792, 0.7722424, 0.1565809, 1, 0, 0.9882353, 1,
0.8723804, -0.9837515, 2.789675, 1, 0, 0.9843137, 1,
0.8730067, 0.09382856, 1.870634, 1, 0, 0.9764706, 1,
0.8759229, -1.595646, 1.579927, 1, 0, 0.972549, 1,
0.8760449, -0.9344351, 3.209875, 1, 0, 0.9647059, 1,
0.8824307, -0.5060894, 2.985147, 1, 0, 0.9607843, 1,
0.8838632, -0.07593434, 1.277564, 1, 0, 0.9529412, 1,
0.8868023, 0.4053068, 1.620085, 1, 0, 0.9490196, 1,
0.8880696, -0.5043709, 1.632937, 1, 0, 0.9411765, 1,
0.8922092, 0.2788425, 0.2503728, 1, 0, 0.9372549, 1,
0.8997302, 1.612365, -1.000446, 1, 0, 0.9294118, 1,
0.9007891, 0.1660399, 1.972998, 1, 0, 0.9254902, 1,
0.9092225, 0.2500944, 0.6986755, 1, 0, 0.9176471, 1,
0.912068, -0.1516985, -0.1827653, 1, 0, 0.9137255, 1,
0.9134193, 0.543848, 2.481194, 1, 0, 0.9058824, 1,
0.9235845, 1.44036, 1.397122, 1, 0, 0.9019608, 1,
0.9255055, -0.8788787, 3.411675, 1, 0, 0.8941177, 1,
0.9291691, 0.1342432, 0.9725791, 1, 0, 0.8862745, 1,
0.9294031, -1.447241, 1.903757, 1, 0, 0.8823529, 1,
0.9386807, -3.072102, 2.261935, 1, 0, 0.8745098, 1,
0.9453655, 0.7269692, 0.3031517, 1, 0, 0.8705882, 1,
0.9470349, 0.3526018, 1.309643, 1, 0, 0.8627451, 1,
0.9507561, -0.9192411, 1.695496, 1, 0, 0.8588235, 1,
0.9555202, 0.6238875, -0.2121874, 1, 0, 0.8509804, 1,
0.9567947, 0.02620424, 3.454165, 1, 0, 0.8470588, 1,
0.9592451, -1.068048, 1.683557, 1, 0, 0.8392157, 1,
0.9685138, -0.6864616, 0.4670976, 1, 0, 0.8352941, 1,
0.9715622, 0.3035868, 1.367537, 1, 0, 0.827451, 1,
0.9812692, -0.3387902, 1.164427, 1, 0, 0.8235294, 1,
0.9815844, -0.923646, 3.76978, 1, 0, 0.8156863, 1,
0.9829924, 0.8070917, 1.162303, 1, 0, 0.8117647, 1,
0.9865108, -1.313514, 3.8963, 1, 0, 0.8039216, 1,
0.993277, 1.580692, 0.3477955, 1, 0, 0.7960784, 1,
1.003806, 1.865518, 0.4135627, 1, 0, 0.7921569, 1,
1.003852, -0.4714386, 0.9073795, 1, 0, 0.7843137, 1,
1.006945, -2.162791, 3.659982, 1, 0, 0.7803922, 1,
1.017753, 1.389977, 1.610682, 1, 0, 0.772549, 1,
1.024726, 1.166777, 1.22959, 1, 0, 0.7686275, 1,
1.026665, 0.4845054, 0.2523755, 1, 0, 0.7607843, 1,
1.034085, 0.3744832, 3.330189, 1, 0, 0.7568628, 1,
1.045943, 0.5811108, 1.767542, 1, 0, 0.7490196, 1,
1.053751, -0.3572264, 1.853839, 1, 0, 0.7450981, 1,
1.058722, 0.7122588, 1.690968, 1, 0, 0.7372549, 1,
1.068784, -1.045324, 3.135703, 1, 0, 0.7333333, 1,
1.085585, -1.111074, 1.138378, 1, 0, 0.7254902, 1,
1.090869, -0.8494886, 2.693255, 1, 0, 0.7215686, 1,
1.097362, -0.9005992, 1.461432, 1, 0, 0.7137255, 1,
1.103547, 1.570938, 1.354745, 1, 0, 0.7098039, 1,
1.107038, 2.211854, 1.257761, 1, 0, 0.7019608, 1,
1.108486, 1.307181, 1.190381, 1, 0, 0.6941177, 1,
1.121935, -0.4047679, 1.79798, 1, 0, 0.6901961, 1,
1.138745, 0.4978336, 2.035565, 1, 0, 0.682353, 1,
1.140382, -0.5537784, 1.630462, 1, 0, 0.6784314, 1,
1.142008, -1.092891, 2.828893, 1, 0, 0.6705883, 1,
1.153213, 1.005856, 1.161598, 1, 0, 0.6666667, 1,
1.155147, -1.282397, 3.475169, 1, 0, 0.6588235, 1,
1.156343, 2.156484, -0.6763365, 1, 0, 0.654902, 1,
1.157913, -0.6778595, 2.766571, 1, 0, 0.6470588, 1,
1.161399, -0.7033999, 1.163608, 1, 0, 0.6431373, 1,
1.169113, 0.08084539, -0.6099173, 1, 0, 0.6352941, 1,
1.169776, -1.023138, 2.588477, 1, 0, 0.6313726, 1,
1.176023, 0.2499303, 1.196362, 1, 0, 0.6235294, 1,
1.177072, 0.9567313, 2.328886, 1, 0, 0.6196079, 1,
1.179259, 0.6243577, 1.377389, 1, 0, 0.6117647, 1,
1.179737, 0.301951, 0.7079062, 1, 0, 0.6078432, 1,
1.186221, 1.461055, 2.602825, 1, 0, 0.6, 1,
1.19328, 1.259442, 0.3046216, 1, 0, 0.5921569, 1,
1.197585, 1.038388, 1.747743, 1, 0, 0.5882353, 1,
1.203811, 1.753197, -0.3564875, 1, 0, 0.5803922, 1,
1.205877, 0.4930957, 0.4765961, 1, 0, 0.5764706, 1,
1.210291, 0.6164091, 0.805443, 1, 0, 0.5686275, 1,
1.228515, 1.672038, -3.062284, 1, 0, 0.5647059, 1,
1.229773, -0.3180358, 2.578501, 1, 0, 0.5568628, 1,
1.232511, -0.5241873, 4.316356, 1, 0, 0.5529412, 1,
1.246381, 2.229672, -0.01294195, 1, 0, 0.5450981, 1,
1.247257, 2.278439, 1.227878, 1, 0, 0.5411765, 1,
1.26474, -0.4599956, 1.573242, 1, 0, 0.5333334, 1,
1.267234, 0.01180132, 1.525748, 1, 0, 0.5294118, 1,
1.280497, -0.2664625, 2.796026, 1, 0, 0.5215687, 1,
1.287848, 1.180861, 1.67806, 1, 0, 0.5176471, 1,
1.291755, -0.7941836, 3.703648, 1, 0, 0.509804, 1,
1.298169, -0.3377425, 2.59593, 1, 0, 0.5058824, 1,
1.300188, -0.0221798, -0.5621247, 1, 0, 0.4980392, 1,
1.315812, 0.2756835, 2.736876, 1, 0, 0.4901961, 1,
1.316134, 1.418996, 0.9681535, 1, 0, 0.4862745, 1,
1.326536, 1.482325, -0.6458865, 1, 0, 0.4784314, 1,
1.340083, 0.94557, 1.957617, 1, 0, 0.4745098, 1,
1.340439, -0.1531271, 2.535785, 1, 0, 0.4666667, 1,
1.341205, 0.594898, 0.5232885, 1, 0, 0.4627451, 1,
1.343937, -0.5317524, 2.441338, 1, 0, 0.454902, 1,
1.352472, -1.089929, 0.3506013, 1, 0, 0.4509804, 1,
1.378541, -2.5133, 3.826343, 1, 0, 0.4431373, 1,
1.383005, -0.4853159, 2.514178, 1, 0, 0.4392157, 1,
1.385956, -0.1578453, 0.1144741, 1, 0, 0.4313726, 1,
1.397217, 0.8655006, 1.384546, 1, 0, 0.427451, 1,
1.419926, 1.312876, 1.800438, 1, 0, 0.4196078, 1,
1.430795, 0.0863013, 1.943024, 1, 0, 0.4156863, 1,
1.435121, -0.7498084, 2.718948, 1, 0, 0.4078431, 1,
1.440295, -0.01484091, 0.8139789, 1, 0, 0.4039216, 1,
1.441137, -0.6870812, 2.31347, 1, 0, 0.3960784, 1,
1.448014, -1.675722, 4.139032, 1, 0, 0.3882353, 1,
1.450126, 0.2029929, 0.714529, 1, 0, 0.3843137, 1,
1.461335, -0.3042902, 1.993729, 1, 0, 0.3764706, 1,
1.461463, -0.9121551, 0.8783786, 1, 0, 0.372549, 1,
1.471642, -0.8011887, 1.664532, 1, 0, 0.3647059, 1,
1.471745, -0.2725491, 1.879263, 1, 0, 0.3607843, 1,
1.490714, 2.464229, 0.2870025, 1, 0, 0.3529412, 1,
1.492572, -0.2098626, 1.590807, 1, 0, 0.3490196, 1,
1.498696, -0.2447421, 3.38408, 1, 0, 0.3411765, 1,
1.499906, -0.6076987, 2.170179, 1, 0, 0.3372549, 1,
1.509369, 0.198368, 1.359657, 1, 0, 0.3294118, 1,
1.520363, 0.2005025, 1.985991, 1, 0, 0.3254902, 1,
1.529456, -0.9488811, 3.390337, 1, 0, 0.3176471, 1,
1.535946, -0.7377992, 1.261453, 1, 0, 0.3137255, 1,
1.541702, 0.4729875, 0.6205781, 1, 0, 0.3058824, 1,
1.546903, 0.2437484, 2.309043, 1, 0, 0.2980392, 1,
1.55056, -0.8991275, 0.7422026, 1, 0, 0.2941177, 1,
1.550996, -0.5074069, 0.7504017, 1, 0, 0.2862745, 1,
1.556413, -0.2743122, 2.306962, 1, 0, 0.282353, 1,
1.563087, 0.354571, 0.3514402, 1, 0, 0.2745098, 1,
1.566854, -0.633561, 0.7007616, 1, 0, 0.2705882, 1,
1.575001, -0.6693844, 1.698902, 1, 0, 0.2627451, 1,
1.588939, 0.3106107, -0.03576985, 1, 0, 0.2588235, 1,
1.599646, 0.1176291, 2.895751, 1, 0, 0.2509804, 1,
1.60119, 0.5582196, -1.257249, 1, 0, 0.2470588, 1,
1.606382, -0.5150468, 0.9124033, 1, 0, 0.2392157, 1,
1.607512, 1.550684, -0.8939783, 1, 0, 0.2352941, 1,
1.612574, -1.285015, 3.607573, 1, 0, 0.227451, 1,
1.616953, 1.867973, -0.3332356, 1, 0, 0.2235294, 1,
1.64081, 1.720694, 1.128526, 1, 0, 0.2156863, 1,
1.661065, 0.9146182, 1.640361, 1, 0, 0.2117647, 1,
1.672538, 0.1490169, 1.32169, 1, 0, 0.2039216, 1,
1.677696, 0.2952922, 2.272175, 1, 0, 0.1960784, 1,
1.697507, 0.07705461, 0.8600788, 1, 0, 0.1921569, 1,
1.749306, 0.506363, 0.6838626, 1, 0, 0.1843137, 1,
1.750912, 0.8396372, 1.078165, 1, 0, 0.1803922, 1,
1.773215, -1.997972, 1.570374, 1, 0, 0.172549, 1,
1.77501, -0.4787337, 2.179936, 1, 0, 0.1686275, 1,
1.797093, 0.1960656, 1.651475, 1, 0, 0.1607843, 1,
1.874119, 0.3836716, 1.394407, 1, 0, 0.1568628, 1,
1.894527, -0.8824778, 2.219655, 1, 0, 0.1490196, 1,
1.903344, 0.0576487, 0.7846249, 1, 0, 0.145098, 1,
1.913215, 0.1409353, 1.145678, 1, 0, 0.1372549, 1,
1.915958, -1.835149, 3.170772, 1, 0, 0.1333333, 1,
1.93564, 0.8510064, 0.7521773, 1, 0, 0.1254902, 1,
1.939155, 0.704823, -0.7126988, 1, 0, 0.1215686, 1,
1.97157, -0.9029418, 0.8180317, 1, 0, 0.1137255, 1,
1.979048, 1.13906, 1.991044, 1, 0, 0.1098039, 1,
1.983047, 0.2644321, 0.6426259, 1, 0, 0.1019608, 1,
2.012747, -0.4041445, 1.861294, 1, 0, 0.09411765, 1,
2.086654, 0.007325868, 2.046397, 1, 0, 0.09019608, 1,
2.110797, -0.4223049, 2.85808, 1, 0, 0.08235294, 1,
2.153828, -0.9580258, 3.422237, 1, 0, 0.07843138, 1,
2.254023, -1.417402, 1.986221, 1, 0, 0.07058824, 1,
2.255116, -0.7307723, 1.970327, 1, 0, 0.06666667, 1,
2.262776, 0.7920177, -0.1376606, 1, 0, 0.05882353, 1,
2.360872, 0.765812, 0.7118403, 1, 0, 0.05490196, 1,
2.416554, 0.7650635, 1.034196, 1, 0, 0.04705882, 1,
2.463141, 0.3257979, 1.081157, 1, 0, 0.04313726, 1,
2.499327, -0.4632243, 2.525809, 1, 0, 0.03529412, 1,
2.545334, 0.983675, 0.06772156, 1, 0, 0.03137255, 1,
2.564353, -1.278739, 0.6703538, 1, 0, 0.02352941, 1,
2.707241, -0.716397, 1.19017, 1, 0, 0.01960784, 1,
2.773927, -0.2880315, 1.812177, 1, 0, 0.01176471, 1,
2.959064, 1.830105, 0.9827537, 1, 0, 0.007843138, 1
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
-0.1635373, -4.138056, -6.749511, 0, -0.5, 0.5, 0.5,
-0.1635373, -4.138056, -6.749511, 1, -0.5, 0.5, 0.5,
-0.1635373, -4.138056, -6.749511, 1, 1.5, 0.5, 0.5,
-0.1635373, -4.138056, -6.749511, 0, 1.5, 0.5, 0.5
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
-4.3447, 0.07230687, -6.749511, 0, -0.5, 0.5, 0.5,
-4.3447, 0.07230687, -6.749511, 1, -0.5, 0.5, 0.5,
-4.3447, 0.07230687, -6.749511, 1, 1.5, 0.5, 0.5,
-4.3447, 0.07230687, -6.749511, 0, 1.5, 0.5, 0.5
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
-4.3447, -4.138056, 0.5923278, 0, -0.5, 0.5, 0.5,
-4.3447, -4.138056, 0.5923278, 1, -0.5, 0.5, 0.5,
-4.3447, -4.138056, 0.5923278, 1, 1.5, 0.5, 0.5,
-4.3447, -4.138056, 0.5923278, 0, 1.5, 0.5, 0.5
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
-3, -3.166434, -5.05524,
2, -3.166434, -5.05524,
-3, -3.166434, -5.05524,
-3, -3.328371, -5.337619,
-2, -3.166434, -5.05524,
-2, -3.328371, -5.337619,
-1, -3.166434, -5.05524,
-1, -3.328371, -5.337619,
0, -3.166434, -5.05524,
0, -3.328371, -5.337619,
1, -3.166434, -5.05524,
1, -3.328371, -5.337619,
2, -3.166434, -5.05524,
2, -3.328371, -5.337619
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
-3, -3.652245, -5.902376, 0, -0.5, 0.5, 0.5,
-3, -3.652245, -5.902376, 1, -0.5, 0.5, 0.5,
-3, -3.652245, -5.902376, 1, 1.5, 0.5, 0.5,
-3, -3.652245, -5.902376, 0, 1.5, 0.5, 0.5,
-2, -3.652245, -5.902376, 0, -0.5, 0.5, 0.5,
-2, -3.652245, -5.902376, 1, -0.5, 0.5, 0.5,
-2, -3.652245, -5.902376, 1, 1.5, 0.5, 0.5,
-2, -3.652245, -5.902376, 0, 1.5, 0.5, 0.5,
-1, -3.652245, -5.902376, 0, -0.5, 0.5, 0.5,
-1, -3.652245, -5.902376, 1, -0.5, 0.5, 0.5,
-1, -3.652245, -5.902376, 1, 1.5, 0.5, 0.5,
-1, -3.652245, -5.902376, 0, 1.5, 0.5, 0.5,
0, -3.652245, -5.902376, 0, -0.5, 0.5, 0.5,
0, -3.652245, -5.902376, 1, -0.5, 0.5, 0.5,
0, -3.652245, -5.902376, 1, 1.5, 0.5, 0.5,
0, -3.652245, -5.902376, 0, 1.5, 0.5, 0.5,
1, -3.652245, -5.902376, 0, -0.5, 0.5, 0.5,
1, -3.652245, -5.902376, 1, -0.5, 0.5, 0.5,
1, -3.652245, -5.902376, 1, 1.5, 0.5, 0.5,
1, -3.652245, -5.902376, 0, 1.5, 0.5, 0.5,
2, -3.652245, -5.902376, 0, -0.5, 0.5, 0.5,
2, -3.652245, -5.902376, 1, -0.5, 0.5, 0.5,
2, -3.652245, -5.902376, 1, 1.5, 0.5, 0.5,
2, -3.652245, -5.902376, 0, 1.5, 0.5, 0.5
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
-3.379816, -3, -5.05524,
-3.379816, 3, -5.05524,
-3.379816, -3, -5.05524,
-3.54063, -3, -5.337619,
-3.379816, -2, -5.05524,
-3.54063, -2, -5.337619,
-3.379816, -1, -5.05524,
-3.54063, -1, -5.337619,
-3.379816, 0, -5.05524,
-3.54063, 0, -5.337619,
-3.379816, 1, -5.05524,
-3.54063, 1, -5.337619,
-3.379816, 2, -5.05524,
-3.54063, 2, -5.337619,
-3.379816, 3, -5.05524,
-3.54063, 3, -5.337619
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
-3.862258, -3, -5.902376, 0, -0.5, 0.5, 0.5,
-3.862258, -3, -5.902376, 1, -0.5, 0.5, 0.5,
-3.862258, -3, -5.902376, 1, 1.5, 0.5, 0.5,
-3.862258, -3, -5.902376, 0, 1.5, 0.5, 0.5,
-3.862258, -2, -5.902376, 0, -0.5, 0.5, 0.5,
-3.862258, -2, -5.902376, 1, -0.5, 0.5, 0.5,
-3.862258, -2, -5.902376, 1, 1.5, 0.5, 0.5,
-3.862258, -2, -5.902376, 0, 1.5, 0.5, 0.5,
-3.862258, -1, -5.902376, 0, -0.5, 0.5, 0.5,
-3.862258, -1, -5.902376, 1, -0.5, 0.5, 0.5,
-3.862258, -1, -5.902376, 1, 1.5, 0.5, 0.5,
-3.862258, -1, -5.902376, 0, 1.5, 0.5, 0.5,
-3.862258, 0, -5.902376, 0, -0.5, 0.5, 0.5,
-3.862258, 0, -5.902376, 1, -0.5, 0.5, 0.5,
-3.862258, 0, -5.902376, 1, 1.5, 0.5, 0.5,
-3.862258, 0, -5.902376, 0, 1.5, 0.5, 0.5,
-3.862258, 1, -5.902376, 0, -0.5, 0.5, 0.5,
-3.862258, 1, -5.902376, 1, -0.5, 0.5, 0.5,
-3.862258, 1, -5.902376, 1, 1.5, 0.5, 0.5,
-3.862258, 1, -5.902376, 0, 1.5, 0.5, 0.5,
-3.862258, 2, -5.902376, 0, -0.5, 0.5, 0.5,
-3.862258, 2, -5.902376, 1, -0.5, 0.5, 0.5,
-3.862258, 2, -5.902376, 1, 1.5, 0.5, 0.5,
-3.862258, 2, -5.902376, 0, 1.5, 0.5, 0.5,
-3.862258, 3, -5.902376, 0, -0.5, 0.5, 0.5,
-3.862258, 3, -5.902376, 1, -0.5, 0.5, 0.5,
-3.862258, 3, -5.902376, 1, 1.5, 0.5, 0.5,
-3.862258, 3, -5.902376, 0, 1.5, 0.5, 0.5
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
-3.379816, -3.166434, -4,
-3.379816, -3.166434, 6,
-3.379816, -3.166434, -4,
-3.54063, -3.328371, -4,
-3.379816, -3.166434, -2,
-3.54063, -3.328371, -2,
-3.379816, -3.166434, 0,
-3.54063, -3.328371, 0,
-3.379816, -3.166434, 2,
-3.54063, -3.328371, 2,
-3.379816, -3.166434, 4,
-3.54063, -3.328371, 4,
-3.379816, -3.166434, 6,
-3.54063, -3.328371, 6
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
"4",
"6"
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
-3.862258, -3.652245, -4, 0, -0.5, 0.5, 0.5,
-3.862258, -3.652245, -4, 1, -0.5, 0.5, 0.5,
-3.862258, -3.652245, -4, 1, 1.5, 0.5, 0.5,
-3.862258, -3.652245, -4, 0, 1.5, 0.5, 0.5,
-3.862258, -3.652245, -2, 0, -0.5, 0.5, 0.5,
-3.862258, -3.652245, -2, 1, -0.5, 0.5, 0.5,
-3.862258, -3.652245, -2, 1, 1.5, 0.5, 0.5,
-3.862258, -3.652245, -2, 0, 1.5, 0.5, 0.5,
-3.862258, -3.652245, 0, 0, -0.5, 0.5, 0.5,
-3.862258, -3.652245, 0, 1, -0.5, 0.5, 0.5,
-3.862258, -3.652245, 0, 1, 1.5, 0.5, 0.5,
-3.862258, -3.652245, 0, 0, 1.5, 0.5, 0.5,
-3.862258, -3.652245, 2, 0, -0.5, 0.5, 0.5,
-3.862258, -3.652245, 2, 1, -0.5, 0.5, 0.5,
-3.862258, -3.652245, 2, 1, 1.5, 0.5, 0.5,
-3.862258, -3.652245, 2, 0, 1.5, 0.5, 0.5,
-3.862258, -3.652245, 4, 0, -0.5, 0.5, 0.5,
-3.862258, -3.652245, 4, 1, -0.5, 0.5, 0.5,
-3.862258, -3.652245, 4, 1, 1.5, 0.5, 0.5,
-3.862258, -3.652245, 4, 0, 1.5, 0.5, 0.5,
-3.862258, -3.652245, 6, 0, -0.5, 0.5, 0.5,
-3.862258, -3.652245, 6, 1, -0.5, 0.5, 0.5,
-3.862258, -3.652245, 6, 1, 1.5, 0.5, 0.5,
-3.862258, -3.652245, 6, 0, 1.5, 0.5, 0.5
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
-3.379816, -3.166434, -5.05524,
-3.379816, 3.311048, -5.05524,
-3.379816, -3.166434, 6.239896,
-3.379816, 3.311048, 6.239896,
-3.379816, -3.166434, -5.05524,
-3.379816, -3.166434, 6.239896,
-3.379816, 3.311048, -5.05524,
-3.379816, 3.311048, 6.239896,
-3.379816, -3.166434, -5.05524,
3.052742, -3.166434, -5.05524,
-3.379816, -3.166434, 6.239896,
3.052742, -3.166434, 6.239896,
-3.379816, 3.311048, -5.05524,
3.052742, 3.311048, -5.05524,
-3.379816, 3.311048, 6.239896,
3.052742, 3.311048, 6.239896,
3.052742, -3.166434, -5.05524,
3.052742, 3.311048, -5.05524,
3.052742, -3.166434, 6.239896,
3.052742, 3.311048, 6.239896,
3.052742, -3.166434, -5.05524,
3.052742, -3.166434, 6.239896,
3.052742, 3.311048, -5.05524,
3.052742, 3.311048, 6.239896
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
var radius = 7.754966;
var distance = 34.50272;
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
mvMatrix.translate( 0.1635373, -0.07230687, -0.5923278 );
mvMatrix.scale( 1.303497, 1.294457, 0.7423391 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.50272);
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
pyridine<-read.table("pyridine.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyridine$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyridine' not found
```

```r
y<-pyridine$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyridine' not found
```

```r
z<-pyridine$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyridine' not found
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
-3.286138, 0.2361483, -2.327996, 0, 0, 1, 1, 1,
-2.940485, -0.005906369, -1.107886, 1, 0, 0, 1, 1,
-2.89921, -2.900809, -3.410786, 1, 0, 0, 1, 1,
-2.740842, 0.02115857, -0.04476439, 1, 0, 0, 1, 1,
-2.596597, -0.9019075, -2.442905, 1, 0, 0, 1, 1,
-2.570231, -1.719715, -1.562266, 1, 0, 0, 1, 1,
-2.547902, -0.8272799, -0.1110547, 0, 0, 0, 1, 1,
-2.410118, 0.7549686, -0.4659249, 0, 0, 0, 1, 1,
-2.336538, 0.04791998, -1.248681, 0, 0, 0, 1, 1,
-2.27925, 0.4895505, 0.09537699, 0, 0, 0, 1, 1,
-2.263819, 1.224846, -0.9360597, 0, 0, 0, 1, 1,
-2.237462, -0.3659909, 0.2747494, 0, 0, 0, 1, 1,
-2.166251, -1.24926, -2.16501, 0, 0, 0, 1, 1,
-2.122622, 0.5322965, -0.3859433, 1, 1, 1, 1, 1,
-2.100151, 1.615342, -0.4809637, 1, 1, 1, 1, 1,
-2.099622, 1.818592, -1.140455, 1, 1, 1, 1, 1,
-2.086424, 0.6010825, -1.189764, 1, 1, 1, 1, 1,
-2.069545, 1.404012, -2.350845, 1, 1, 1, 1, 1,
-2.063107, 0.9191316, -1.149168, 1, 1, 1, 1, 1,
-2.055092, -0.01085126, -2.803538, 1, 1, 1, 1, 1,
-2.047948, -1.775493, -1.777655, 1, 1, 1, 1, 1,
-2.014526, -1.110885, -2.018786, 1, 1, 1, 1, 1,
-1.992931, 0.6189694, -0.6434935, 1, 1, 1, 1, 1,
-1.980851, -0.5104753, -2.56075, 1, 1, 1, 1, 1,
-1.973065, 1.502561, -0.4719606, 1, 1, 1, 1, 1,
-1.961992, 0.4067517, -0.7171261, 1, 1, 1, 1, 1,
-1.959096, 0.004300258, -1.507341, 1, 1, 1, 1, 1,
-1.876677, -1.978382, -1.775813, 1, 1, 1, 1, 1,
-1.873564, 0.6728237, -0.7937632, 0, 0, 1, 1, 1,
-1.845526, 1.666644, -1.453351, 1, 0, 0, 1, 1,
-1.830553, 0.4082772, -2.205938, 1, 0, 0, 1, 1,
-1.825849, -0.06398804, -1.451476, 1, 0, 0, 1, 1,
-1.82574, -2.122435, -2.037861, 1, 0, 0, 1, 1,
-1.782073, 0.03183501, -1.506689, 1, 0, 0, 1, 1,
-1.777695, 0.06688482, -2.313047, 0, 0, 0, 1, 1,
-1.774732, -1.30592, -1.500771, 0, 0, 0, 1, 1,
-1.756534, -0.9876217, -2.247364, 0, 0, 0, 1, 1,
-1.749904, -0.7552399, -2.504264, 0, 0, 0, 1, 1,
-1.742988, 1.496704, -1.621063, 0, 0, 0, 1, 1,
-1.730789, 2.529214, -2.90599, 0, 0, 0, 1, 1,
-1.730309, -0.6102108, -2.123741, 0, 0, 0, 1, 1,
-1.715827, 0.6267911, -0.9367619, 1, 1, 1, 1, 1,
-1.715425, -0.2835177, -1.505819, 1, 1, 1, 1, 1,
-1.715189, -1.270963, -1.595638, 1, 1, 1, 1, 1,
-1.688322, -2.491568, -2.294406, 1, 1, 1, 1, 1,
-1.683068, 1.699575, -0.6568124, 1, 1, 1, 1, 1,
-1.681747, 0.5647199, -1.701493, 1, 1, 1, 1, 1,
-1.680757, -0.9788342, -2.751734, 1, 1, 1, 1, 1,
-1.675467, 1.156303, -1.609347, 1, 1, 1, 1, 1,
-1.663228, -1.87976, -2.449682, 1, 1, 1, 1, 1,
-1.645615, 1.795286, -0.4437788, 1, 1, 1, 1, 1,
-1.636777, 0.8502355, -0.9005436, 1, 1, 1, 1, 1,
-1.618974, 1.450898, 0.1969837, 1, 1, 1, 1, 1,
-1.618061, 1.03125, -1.384362, 1, 1, 1, 1, 1,
-1.611254, 1.024519, -0.3977124, 1, 1, 1, 1, 1,
-1.606946, 0.3721158, -2.009073, 1, 1, 1, 1, 1,
-1.591138, -0.01122229, -2.062161, 0, 0, 1, 1, 1,
-1.584998, 0.8903944, -0.8876385, 1, 0, 0, 1, 1,
-1.578832, -0.5546612, -0.6107667, 1, 0, 0, 1, 1,
-1.568202, -0.02252684, -1.509952, 1, 0, 0, 1, 1,
-1.565569, -0.581417, -2.421623, 1, 0, 0, 1, 1,
-1.553096, -0.9484763, -0.8344228, 1, 0, 0, 1, 1,
-1.551833, 2.232446, -1.17543, 0, 0, 0, 1, 1,
-1.550352, 0.1839318, -2.226522, 0, 0, 0, 1, 1,
-1.545465, 1.243121, -0.6849154, 0, 0, 0, 1, 1,
-1.544628, 0.3212077, -0.2787941, 0, 0, 0, 1, 1,
-1.528847, 1.424377, -0.570555, 0, 0, 0, 1, 1,
-1.525702, -0.2961259, -1.524142, 0, 0, 0, 1, 1,
-1.523831, 1.324631, -1.982035, 0, 0, 0, 1, 1,
-1.516178, -0.02767943, -2.784629, 1, 1, 1, 1, 1,
-1.513056, 0.3922296, -0.8807749, 1, 1, 1, 1, 1,
-1.508446, 0.550275, -1.972043, 1, 1, 1, 1, 1,
-1.497719, -2.087273, -3.853699, 1, 1, 1, 1, 1,
-1.478944, 0.9289026, -0.9819328, 1, 1, 1, 1, 1,
-1.474242, 1.157145, -2.332719, 1, 1, 1, 1, 1,
-1.43957, -0.5496995, -3.23094, 1, 1, 1, 1, 1,
-1.4383, -0.8154188, -2.091869, 1, 1, 1, 1, 1,
-1.434426, -0.3939262, -0.7952856, 1, 1, 1, 1, 1,
-1.430099, -1.728354, -2.865239, 1, 1, 1, 1, 1,
-1.423751, 1.99729, -1.579628, 1, 1, 1, 1, 1,
-1.399937, -1.686818, -0.6490531, 1, 1, 1, 1, 1,
-1.396198, -1.090943, -1.79013, 1, 1, 1, 1, 1,
-1.395569, 1.205522, -1.399644, 1, 1, 1, 1, 1,
-1.382603, 1.638573, -1.124192, 1, 1, 1, 1, 1,
-1.376991, -0.06215549, -2.25861, 0, 0, 1, 1, 1,
-1.368861, 1.338636, -0.8795192, 1, 0, 0, 1, 1,
-1.365333, 0.843376, -0.8813475, 1, 0, 0, 1, 1,
-1.363721, 0.8679984, -2.213538, 1, 0, 0, 1, 1,
-1.362226, -1.354587, -1.014962, 1, 0, 0, 1, 1,
-1.357845, 0.704439, -1.782638, 1, 0, 0, 1, 1,
-1.356123, -1.4288, -0.5111009, 0, 0, 0, 1, 1,
-1.348701, 1.245832, 1.008168, 0, 0, 0, 1, 1,
-1.32264, -0.7428837, -1.45275, 0, 0, 0, 1, 1,
-1.317867, 0.2782272, -2.150841, 0, 0, 0, 1, 1,
-1.316729, -0.228438, -2.036181, 0, 0, 0, 1, 1,
-1.310035, -0.6463047, -2.855017, 0, 0, 0, 1, 1,
-1.308733, -1.169135, -3.5028, 0, 0, 0, 1, 1,
-1.306563, 0.4895884, -2.693353, 1, 1, 1, 1, 1,
-1.299267, -0.4413247, -0.4190826, 1, 1, 1, 1, 1,
-1.292017, -0.01533933, -2.477494, 1, 1, 1, 1, 1,
-1.288987, -0.4171389, -0.5472208, 1, 1, 1, 1, 1,
-1.286469, 0.7511584, -1.460125, 1, 1, 1, 1, 1,
-1.274856, -0.2685343, -2.99723, 1, 1, 1, 1, 1,
-1.273774, -0.2723287, -0.6778651, 1, 1, 1, 1, 1,
-1.271674, -0.3008532, -0.7331508, 1, 1, 1, 1, 1,
-1.264478, -1.783352, -2.906938, 1, 1, 1, 1, 1,
-1.262329, -0.4737074, -0.1765915, 1, 1, 1, 1, 1,
-1.246672, -0.4862808, -2.309554, 1, 1, 1, 1, 1,
-1.244017, -0.1046586, -1.154241, 1, 1, 1, 1, 1,
-1.241928, 0.3462549, -0.8255968, 1, 1, 1, 1, 1,
-1.23611, 0.5690563, -1.966604, 1, 1, 1, 1, 1,
-1.231755, 1.616791, 0.08857378, 1, 1, 1, 1, 1,
-1.226644, -1.055774, -0.9099426, 0, 0, 1, 1, 1,
-1.226224, 0.2780386, -1.601963, 1, 0, 0, 1, 1,
-1.220948, 1.117527, -3.299491, 1, 0, 0, 1, 1,
-1.214464, -0.3551692, -0.7117276, 1, 0, 0, 1, 1,
-1.213432, 0.957692, -0.1056139, 1, 0, 0, 1, 1,
-1.210897, 0.06602903, -2.545642, 1, 0, 0, 1, 1,
-1.203158, 0.880536, -1.494728, 0, 0, 0, 1, 1,
-1.202464, -0.4135799, -0.5137472, 0, 0, 0, 1, 1,
-1.201997, -0.0680165, -1.600954, 0, 0, 0, 1, 1,
-1.19578, -0.3300548, -3.71997, 0, 0, 0, 1, 1,
-1.191221, 0.6746179, -1.217516, 0, 0, 0, 1, 1,
-1.182473, 0.8272387, -0.6364655, 0, 0, 0, 1, 1,
-1.177343, 0.7374384, -1.864136, 0, 0, 0, 1, 1,
-1.174138, 1.905311, -2.189689, 1, 1, 1, 1, 1,
-1.168147, -0.7498407, -3.811831, 1, 1, 1, 1, 1,
-1.166551, -0.388943, -0.9537217, 1, 1, 1, 1, 1,
-1.166135, -0.3445029, -1.000859, 1, 1, 1, 1, 1,
-1.163801, -0.506755, -1.611987, 1, 1, 1, 1, 1,
-1.160441, -1.380234, -3.695061, 1, 1, 1, 1, 1,
-1.155678, 0.1202537, -1.79696, 1, 1, 1, 1, 1,
-1.15082, 1.513357, -1.101429, 1, 1, 1, 1, 1,
-1.149555, 1.863684, -1.089313, 1, 1, 1, 1, 1,
-1.146852, -0.2945596, -1.388546, 1, 1, 1, 1, 1,
-1.141577, 1.079769, -0.8440548, 1, 1, 1, 1, 1,
-1.138989, -2.124008, -2.898998, 1, 1, 1, 1, 1,
-1.138341, -0.03612602, -2.937407, 1, 1, 1, 1, 1,
-1.137503, 0.6560786, -1.343104, 1, 1, 1, 1, 1,
-1.130122, 0.8280493, -0.6822152, 1, 1, 1, 1, 1,
-1.11902, -0.5726508, -2.211475, 0, 0, 1, 1, 1,
-1.114894, 0.9245951, 0.8509305, 1, 0, 0, 1, 1,
-1.114683, -0.6050158, -2.965441, 1, 0, 0, 1, 1,
-1.111506, -0.06877039, -0.4540841, 1, 0, 0, 1, 1,
-1.099824, 1.973302, -2.454168, 1, 0, 0, 1, 1,
-1.095177, 0.4967013, -0.03703925, 1, 0, 0, 1, 1,
-1.086015, 0.1683726, -0.5291834, 0, 0, 0, 1, 1,
-1.085502, -2.134639, -3.089792, 0, 0, 0, 1, 1,
-1.08394, -0.2204689, -1.331378, 0, 0, 0, 1, 1,
-1.078921, -1.115762, -3.198064, 0, 0, 0, 1, 1,
-1.077212, 1.897981, -1.448901, 0, 0, 0, 1, 1,
-1.071955, -1.267739, -1.81079, 0, 0, 0, 1, 1,
-1.070542, -0.05129052, -0.7861201, 0, 0, 0, 1, 1,
-1.069915, -1.329938, -2.736938, 1, 1, 1, 1, 1,
-1.069798, 0.1883433, -1.273629, 1, 1, 1, 1, 1,
-1.069691, -0.9157774, -1.008162, 1, 1, 1, 1, 1,
-1.061679, 0.3902762, -1.412926, 1, 1, 1, 1, 1,
-1.056306, 0.5959538, 0.4143031, 1, 1, 1, 1, 1,
-1.047737, 0.1531983, -0.6878787, 1, 1, 1, 1, 1,
-1.033876, -2.483824, -2.122853, 1, 1, 1, 1, 1,
-1.028562, -0.3116377, -2.919691, 1, 1, 1, 1, 1,
-1.027111, 0.2573848, -0.9758067, 1, 1, 1, 1, 1,
-1.025681, -0.2886103, -1.771348, 1, 1, 1, 1, 1,
-1.02208, 0.8599173, 0.3863282, 1, 1, 1, 1, 1,
-1.019554, -0.2347284, -1.213051, 1, 1, 1, 1, 1,
-1.017837, 1.435218, -2.662357, 1, 1, 1, 1, 1,
-1.015465, -1.737027, -3.095217, 1, 1, 1, 1, 1,
-1.01448, 0.02113031, -1.746357, 1, 1, 1, 1, 1,
-0.9940606, 0.8199177, -1.115282, 0, 0, 1, 1, 1,
-0.983197, -0.3515953, -1.1019, 1, 0, 0, 1, 1,
-0.9805467, 0.9887112, -1.479363, 1, 0, 0, 1, 1,
-0.9688556, -0.1280652, -3.189831, 1, 0, 0, 1, 1,
-0.9643829, 3.216715, 0.169271, 1, 0, 0, 1, 1,
-0.9624949, -0.2110827, -2.41432, 1, 0, 0, 1, 1,
-0.9617041, -1.244323, -2.700699, 0, 0, 0, 1, 1,
-0.955502, -1.520426, -1.568785, 0, 0, 0, 1, 1,
-0.9515166, -1.337007, -3.411385, 0, 0, 0, 1, 1,
-0.95147, 0.07838564, -0.09093259, 0, 0, 0, 1, 1,
-0.9498179, -0.1973221, -2.104488, 0, 0, 0, 1, 1,
-0.9456347, 1.21987, -1.566168, 0, 0, 0, 1, 1,
-0.9453315, 1.079443, -1.153756, 0, 0, 0, 1, 1,
-0.9434868, -1.494257, -2.718934, 1, 1, 1, 1, 1,
-0.9410598, 0.8159029, -0.1750473, 1, 1, 1, 1, 1,
-0.9355037, 0.8648435, -0.4357551, 1, 1, 1, 1, 1,
-0.9256771, 0.5270584, -1.288216, 1, 1, 1, 1, 1,
-0.9253031, -0.7416554, -0.5130689, 1, 1, 1, 1, 1,
-0.9189203, -1.372012, -2.458294, 1, 1, 1, 1, 1,
-0.911079, 0.1369046, -0.774676, 1, 1, 1, 1, 1,
-0.9039623, 1.112974, -0.7026188, 1, 1, 1, 1, 1,
-0.9017901, 0.4236427, -3.333146, 1, 1, 1, 1, 1,
-0.8993088, 0.959552, 1.836792, 1, 1, 1, 1, 1,
-0.8989551, 0.8457544, -2.172482, 1, 1, 1, 1, 1,
-0.8981111, -0.6828671, -2.429538, 1, 1, 1, 1, 1,
-0.8966881, 1.223155, -0.4178069, 1, 1, 1, 1, 1,
-0.8911039, -2.773393, -1.55284, 1, 1, 1, 1, 1,
-0.8816207, 0.7763662, -0.9649872, 1, 1, 1, 1, 1,
-0.8781459, 0.9218616, -1.871867, 0, 0, 1, 1, 1,
-0.8748659, 1.060055, -1.224767, 1, 0, 0, 1, 1,
-0.8735649, 0.3098783, -2.105946, 1, 0, 0, 1, 1,
-0.8699279, -0.3345897, -1.376702, 1, 0, 0, 1, 1,
-0.8621323, -0.5479285, -2.655517, 1, 0, 0, 1, 1,
-0.8578381, 0.5526171, -1.340025, 1, 0, 0, 1, 1,
-0.8571799, -0.8874887, -2.246259, 0, 0, 0, 1, 1,
-0.8545595, -1.23547, -1.243475, 0, 0, 0, 1, 1,
-0.8531219, -0.2844161, -2.07039, 0, 0, 0, 1, 1,
-0.8528804, 0.1369201, 1.364774, 0, 0, 0, 1, 1,
-0.8507024, -2.172005, -2.145768, 0, 0, 0, 1, 1,
-0.8455668, 0.0952182, -2.625498, 0, 0, 0, 1, 1,
-0.8440416, 0.1892907, -1.320149, 0, 0, 0, 1, 1,
-0.8398144, -0.4901187, -1.322177, 1, 1, 1, 1, 1,
-0.8385589, 1.30744, -0.1470473, 1, 1, 1, 1, 1,
-0.8382647, -1.462086, -3.739498, 1, 1, 1, 1, 1,
-0.8366002, 1.15941, 1.225572, 1, 1, 1, 1, 1,
-0.8350872, -0.09233422, -3.712209, 1, 1, 1, 1, 1,
-0.8308619, -0.3677981, -2.543858, 1, 1, 1, 1, 1,
-0.8279232, -1.447453, -0.8975, 1, 1, 1, 1, 1,
-0.8271168, -1.311234, -3.109253, 1, 1, 1, 1, 1,
-0.8197843, -0.4875309, -3.182683, 1, 1, 1, 1, 1,
-0.8191968, 0.1141895, 0.3872989, 1, 1, 1, 1, 1,
-0.8091699, 0.3325992, -0.3852693, 1, 1, 1, 1, 1,
-0.8064913, -1.382838, -1.992744, 1, 1, 1, 1, 1,
-0.8042286, -0.2774766, -3.189156, 1, 1, 1, 1, 1,
-0.8002437, -0.3215082, -2.803231, 1, 1, 1, 1, 1,
-0.797118, -0.07755128, -1.712779, 1, 1, 1, 1, 1,
-0.7970811, -1.106727, -2.850261, 0, 0, 1, 1, 1,
-0.7930714, 1.090257, -0.3335837, 1, 0, 0, 1, 1,
-0.7899756, -0.0358071, -0.4609229, 1, 0, 0, 1, 1,
-0.7805914, -0.1626409, -0.9646013, 1, 0, 0, 1, 1,
-0.7775243, 0.4003206, -1.278151, 1, 0, 0, 1, 1,
-0.7754794, 0.06251928, -2.647232, 1, 0, 0, 1, 1,
-0.7747045, 2.482074, 0.5527346, 0, 0, 0, 1, 1,
-0.7717922, 0.9137046, -0.994925, 0, 0, 0, 1, 1,
-0.7712489, -1.375974, -0.8272498, 0, 0, 0, 1, 1,
-0.7703702, -1.302905, -2.127567, 0, 0, 0, 1, 1,
-0.7553108, 0.4580636, -0.9940707, 0, 0, 0, 1, 1,
-0.7462339, -1.221309, -2.289968, 0, 0, 0, 1, 1,
-0.7425629, 0.1207941, -0.8908018, 0, 0, 0, 1, 1,
-0.7309503, 0.9225975, 0.1819154, 1, 1, 1, 1, 1,
-0.7306882, 0.3283995, -1.480334, 1, 1, 1, 1, 1,
-0.7280773, 2.04771, 1.185241, 1, 1, 1, 1, 1,
-0.7233192, 0.5947978, -0.5471085, 1, 1, 1, 1, 1,
-0.719154, 0.1858431, -0.7193418, 1, 1, 1, 1, 1,
-0.7135355, -0.450567, -1.109161, 1, 1, 1, 1, 1,
-0.7133684, 0.9281617, -0.7363462, 1, 1, 1, 1, 1,
-0.7124262, 0.723162, -1.088168, 1, 1, 1, 1, 1,
-0.7114458, 0.6550671, -2.292145, 1, 1, 1, 1, 1,
-0.7111185, 1.883554, -1.948184, 1, 1, 1, 1, 1,
-0.7078671, -0.8199929, -2.783145, 1, 1, 1, 1, 1,
-0.7002157, 0.2211453, -0.4185866, 1, 1, 1, 1, 1,
-0.6971073, -1.715484, -2.769216, 1, 1, 1, 1, 1,
-0.6903575, -1.096395, -2.203585, 1, 1, 1, 1, 1,
-0.6868901, 0.4829563, -1.287802, 1, 1, 1, 1, 1,
-0.6858891, -0.004186754, -2.436776, 0, 0, 1, 1, 1,
-0.6753066, -0.2968721, -1.214563, 1, 0, 0, 1, 1,
-0.6739622, -1.114296, -4.33696, 1, 0, 0, 1, 1,
-0.6680627, 0.1374355, -0.5328937, 1, 0, 0, 1, 1,
-0.6626068, -1.61048, -3.421175, 1, 0, 0, 1, 1,
-0.6584638, -0.09533131, -2.185588, 1, 0, 0, 1, 1,
-0.6574769, -0.9572305, -2.32679, 0, 0, 0, 1, 1,
-0.6572377, 0.6257126, -1.969877, 0, 0, 0, 1, 1,
-0.6564981, 0.073872, -1.417863, 0, 0, 0, 1, 1,
-0.6544057, 0.3295299, -0.4333539, 0, 0, 0, 1, 1,
-0.6540179, -0.8658652, -3.5176, 0, 0, 0, 1, 1,
-0.6503741, 0.5857738, -0.1949583, 0, 0, 0, 1, 1,
-0.6479138, 0.4507945, -1.9346, 0, 0, 0, 1, 1,
-0.6446665, -0.7028748, -0.1971832, 1, 1, 1, 1, 1,
-0.6436397, -1.604452, -3.398274, 1, 1, 1, 1, 1,
-0.6434255, -0.3422695, -2.367118, 1, 1, 1, 1, 1,
-0.6424496, 1.203183, -1.391129, 1, 1, 1, 1, 1,
-0.6390014, -1.544906, -1.441163, 1, 1, 1, 1, 1,
-0.6338422, -0.1355053, -2.449516, 1, 1, 1, 1, 1,
-0.6327973, -0.5760428, -1.877768, 1, 1, 1, 1, 1,
-0.6304058, -1.444734, -3.858289, 1, 1, 1, 1, 1,
-0.6273825, 1.813151, 0.633222, 1, 1, 1, 1, 1,
-0.6247371, 0.3426802, -1.899797, 1, 1, 1, 1, 1,
-0.6247125, 0.6416832, 0.1246124, 1, 1, 1, 1, 1,
-0.6173089, 0.8681955, -0.189561, 1, 1, 1, 1, 1,
-0.6149045, -0.03113268, -2.109015, 1, 1, 1, 1, 1,
-0.6143833, -1.244308, -2.650078, 1, 1, 1, 1, 1,
-0.6141761, -0.1774764, -1.929253, 1, 1, 1, 1, 1,
-0.6136183, 0.1675858, -1.701247, 0, 0, 1, 1, 1,
-0.6097814, -1.574429, -2.72875, 1, 0, 0, 1, 1,
-0.6074212, 0.5941905, -0.7595157, 1, 0, 0, 1, 1,
-0.6049682, 0.6868491, -0.7879281, 1, 0, 0, 1, 1,
-0.6036401, -0.07247554, -2.239054, 1, 0, 0, 1, 1,
-0.6018527, -0.4739619, -2.332188, 1, 0, 0, 1, 1,
-0.6015082, -0.464349, -3.385549, 0, 0, 0, 1, 1,
-0.6006947, -0.2477408, -3.283448, 0, 0, 0, 1, 1,
-0.5988658, -1.798518, -3.944498, 0, 0, 0, 1, 1,
-0.5976208, 0.5184676, 0.5069386, 0, 0, 0, 1, 1,
-0.5963011, -0.2478688, -2.761106, 0, 0, 0, 1, 1,
-0.5915607, -0.7027951, -3.804456, 0, 0, 0, 1, 1,
-0.5893571, -0.1337624, -2.154762, 0, 0, 0, 1, 1,
-0.5863024, 0.3389603, -0.5534908, 1, 1, 1, 1, 1,
-0.583333, -0.03859984, -2.326847, 1, 1, 1, 1, 1,
-0.5757936, -0.1050181, -0.8550593, 1, 1, 1, 1, 1,
-0.5564153, -0.4154409, -3.384556, 1, 1, 1, 1, 1,
-0.5546244, 1.434024, 1.073773, 1, 1, 1, 1, 1,
-0.5519141, -0.4841917, -3.87929, 1, 1, 1, 1, 1,
-0.5454746, 0.07280177, -1.233416, 1, 1, 1, 1, 1,
-0.542541, 0.1712032, -1.509367, 1, 1, 1, 1, 1,
-0.5348101, -0.4716315, -2.726828, 1, 1, 1, 1, 1,
-0.5344517, 0.07432483, -1.984347, 1, 1, 1, 1, 1,
-0.53324, 0.6450132, -0.2506595, 1, 1, 1, 1, 1,
-0.5327285, -0.499461, -3.102392, 1, 1, 1, 1, 1,
-0.5326579, 0.1420454, -1.141706, 1, 1, 1, 1, 1,
-0.5230241, -0.1455051, -2.356596, 1, 1, 1, 1, 1,
-0.5207782, -0.2909014, -3.312456, 1, 1, 1, 1, 1,
-0.5168989, 1.446542, -0.3707438, 0, 0, 1, 1, 1,
-0.5155457, -0.0242948, -2.624789, 1, 0, 0, 1, 1,
-0.5082016, 0.4653718, -1.801512, 1, 0, 0, 1, 1,
-0.5061835, 0.5080298, -0.8347912, 1, 0, 0, 1, 1,
-0.5059297, 2.234868, -0.4005574, 1, 0, 0, 1, 1,
-0.5041819, 0.94921, -0.4157532, 1, 0, 0, 1, 1,
-0.50267, 0.2174024, -1.796453, 0, 0, 0, 1, 1,
-0.4986427, 0.08306991, -1.224673, 0, 0, 0, 1, 1,
-0.4938521, -1.234298, -2.455475, 0, 0, 0, 1, 1,
-0.4930789, -0.4925385, -2.074852, 0, 0, 0, 1, 1,
-0.4903001, -1.08413, -2.625517, 0, 0, 0, 1, 1,
-0.4896328, -0.4085277, -2.402544, 0, 0, 0, 1, 1,
-0.4810362, 1.095261, 0.8035398, 0, 0, 0, 1, 1,
-0.4734565, -0.4335155, -4.112462, 1, 1, 1, 1, 1,
-0.4689186, 0.6009359, -0.02888367, 1, 1, 1, 1, 1,
-0.4686728, 0.001318534, -0.8347359, 1, 1, 1, 1, 1,
-0.4685338, -0.9721304, -4.441017, 1, 1, 1, 1, 1,
-0.4650449, -0.9714494, -2.064856, 1, 1, 1, 1, 1,
-0.4637317, 0.5618876, 0.05308803, 1, 1, 1, 1, 1,
-0.4620161, -0.1376267, -0.631354, 1, 1, 1, 1, 1,
-0.4611537, 2.089, -2.249008, 1, 1, 1, 1, 1,
-0.4574621, 0.4482723, -1.251876, 1, 1, 1, 1, 1,
-0.4570129, 0.2283113, -0.5872183, 1, 1, 1, 1, 1,
-0.4534591, 0.6382287, 0.2176345, 1, 1, 1, 1, 1,
-0.4482074, 0.6324525, -1.201036, 1, 1, 1, 1, 1,
-0.4468539, 0.9086341, -2.01663, 1, 1, 1, 1, 1,
-0.4446811, -0.5540706, -0.8797166, 1, 1, 1, 1, 1,
-0.4444646, 0.1551938, -1.566054, 1, 1, 1, 1, 1,
-0.4435816, 0.2503007, -1.586306, 0, 0, 1, 1, 1,
-0.4410143, 1.607007, 0.3941169, 1, 0, 0, 1, 1,
-0.4398648, 0.5357895, -1.532691, 1, 0, 0, 1, 1,
-0.4354184, 0.9075335, -0.8184914, 1, 0, 0, 1, 1,
-0.4280905, -2.044467, -3.428849, 1, 0, 0, 1, 1,
-0.4256317, 1.122025, -0.01010311, 1, 0, 0, 1, 1,
-0.4254371, 0.7846551, -1.56881, 0, 0, 0, 1, 1,
-0.4225668, -0.9609203, -2.02962, 0, 0, 0, 1, 1,
-0.4190059, -1.1784, -2.540921, 0, 0, 0, 1, 1,
-0.4159515, -0.5361183, -2.595863, 0, 0, 0, 1, 1,
-0.4080151, 0.713269, -0.2482266, 0, 0, 0, 1, 1,
-0.4052146, 0.6499444, -0.3155692, 0, 0, 0, 1, 1,
-0.4022655, 0.02037583, -0.8425259, 0, 0, 0, 1, 1,
-0.397892, 1.762905, 1.398179, 1, 1, 1, 1, 1,
-0.3860425, -0.7724729, -3.766951, 1, 1, 1, 1, 1,
-0.3851752, 0.6911181, -1.703878, 1, 1, 1, 1, 1,
-0.3726001, 1.681224, 0.08944602, 1, 1, 1, 1, 1,
-0.3712134, -1.486878, -2.906661, 1, 1, 1, 1, 1,
-0.3653984, -1.030671, -3.493531, 1, 1, 1, 1, 1,
-0.3628038, 1.175426, -0.3328119, 1, 1, 1, 1, 1,
-0.3623919, 0.2901052, -0.9682597, 1, 1, 1, 1, 1,
-0.3588172, 1.148016, -1.016826, 1, 1, 1, 1, 1,
-0.3582267, 0.4424267, -0.03289284, 1, 1, 1, 1, 1,
-0.3541811, 2.153077, -1.28635, 1, 1, 1, 1, 1,
-0.3539943, -0.8100066, -4.261711, 1, 1, 1, 1, 1,
-0.3514905, -0.4993051, -2.995467, 1, 1, 1, 1, 1,
-0.348452, -0.8092303, -1.951737, 1, 1, 1, 1, 1,
-0.3457395, 0.706917, -0.4283731, 1, 1, 1, 1, 1,
-0.3446982, 0.4137501, 0.941224, 0, 0, 1, 1, 1,
-0.342083, 1.296942, -0.7260104, 1, 0, 0, 1, 1,
-0.3420397, -0.2034208, -1.938279, 1, 0, 0, 1, 1,
-0.3396117, 1.059822, -1.492122, 1, 0, 0, 1, 1,
-0.3393502, 0.3876806, 0.2554092, 1, 0, 0, 1, 1,
-0.3364373, 2.010803, -0.2044144, 1, 0, 0, 1, 1,
-0.3344537, -2.280332, -3.47069, 0, 0, 0, 1, 1,
-0.3335877, 1.099263, 1.11361, 0, 0, 0, 1, 1,
-0.3328334, 0.03341534, -1.384012, 0, 0, 0, 1, 1,
-0.3295988, -0.8520617, -2.902237, 0, 0, 0, 1, 1,
-0.3294129, 1.307094, -1.342235, 0, 0, 0, 1, 1,
-0.3289247, 0.08247606, -2.257798, 0, 0, 0, 1, 1,
-0.3264206, -0.9045066, -3.050673, 0, 0, 0, 1, 1,
-0.3260961, -0.5354095, -3.504215, 1, 1, 1, 1, 1,
-0.3249567, -0.7220294, -3.061786, 1, 1, 1, 1, 1,
-0.3237441, 0.6327019, -0.08240674, 1, 1, 1, 1, 1,
-0.3227141, -0.4343382, -1.879631, 1, 1, 1, 1, 1,
-0.3210136, 0.1412476, -1.855549, 1, 1, 1, 1, 1,
-0.3181695, 0.7619843, 0.03973777, 1, 1, 1, 1, 1,
-0.3150072, 0.7442436, 0.104563, 1, 1, 1, 1, 1,
-0.3147422, -0.743344, -2.002761, 1, 1, 1, 1, 1,
-0.3118717, -1.796882, -2.278734, 1, 1, 1, 1, 1,
-0.3112788, -0.1621137, -3.626597, 1, 1, 1, 1, 1,
-0.3103392, -1.304666, -4.393635, 1, 1, 1, 1, 1,
-0.3081126, 0.2992009, -0.8020688, 1, 1, 1, 1, 1,
-0.3073113, -2.226613, -3.008452, 1, 1, 1, 1, 1,
-0.3069836, -1.044795, -2.234416, 1, 1, 1, 1, 1,
-0.3026905, -0.3136145, -3.562077, 1, 1, 1, 1, 1,
-0.2986687, 0.04920447, -0.27587, 0, 0, 1, 1, 1,
-0.2970726, 0.3432565, -0.232837, 1, 0, 0, 1, 1,
-0.2969911, -1.288242, -1.796424, 1, 0, 0, 1, 1,
-0.2958014, 0.2656522, -1.297639, 1, 0, 0, 1, 1,
-0.2943448, -1.324021, -2.482589, 1, 0, 0, 1, 1,
-0.283076, -0.09483343, -2.652905, 1, 0, 0, 1, 1,
-0.2737218, 1.497283, 0.702089, 0, 0, 0, 1, 1,
-0.2711082, -1.834349, -4.359813, 0, 0, 0, 1, 1,
-0.26957, 2.758458, 0.6203787, 0, 0, 0, 1, 1,
-0.2654492, -0.1068702, -2.609109, 0, 0, 0, 1, 1,
-0.2594263, 0.1631279, -2.960206, 0, 0, 0, 1, 1,
-0.255048, 0.2127707, 0.01416092, 0, 0, 0, 1, 1,
-0.2546735, -2.059744, -3.760868, 0, 0, 0, 1, 1,
-0.2524087, -1.283289, -3.546624, 1, 1, 1, 1, 1,
-0.2510433, -0.5836051, -2.135904, 1, 1, 1, 1, 1,
-0.2506184, -0.578078, -4.352616, 1, 1, 1, 1, 1,
-0.2474883, -0.2380423, -2.07654, 1, 1, 1, 1, 1,
-0.2472118, -1.219145, -4.131389, 1, 1, 1, 1, 1,
-0.2432788, 1.832231, -0.5201243, 1, 1, 1, 1, 1,
-0.2421731, 0.1901171, -0.3196871, 1, 1, 1, 1, 1,
-0.2392298, 0.9232169, 0.5953835, 1, 1, 1, 1, 1,
-0.235978, -0.6894622, -2.499942, 1, 1, 1, 1, 1,
-0.23185, -0.3422669, -3.417581, 1, 1, 1, 1, 1,
-0.2300417, -0.6039193, -0.8547028, 1, 1, 1, 1, 1,
-0.2281514, 2.424231, 0.6150041, 1, 1, 1, 1, 1,
-0.224521, -1.010029, -3.542928, 1, 1, 1, 1, 1,
-0.2206519, -0.1060928, -3.299607, 1, 1, 1, 1, 1,
-0.2206308, 1.027332, 0.1344737, 1, 1, 1, 1, 1,
-0.2118279, -0.6074775, -2.835468, 0, 0, 1, 1, 1,
-0.2089443, -0.2283437, -2.492498, 1, 0, 0, 1, 1,
-0.2088178, 0.1650013, -0.3660564, 1, 0, 0, 1, 1,
-0.2055423, 0.3177867, 0.3478366, 1, 0, 0, 1, 1,
-0.1995173, -0.7990189, -2.764271, 1, 0, 0, 1, 1,
-0.1967566, -0.1542985, -2.507657, 1, 0, 0, 1, 1,
-0.1966742, 1.343592, -0.6462305, 0, 0, 0, 1, 1,
-0.1962922, -0.2875903, -0.9423667, 0, 0, 0, 1, 1,
-0.195888, 0.6173973, 0.2373012, 0, 0, 0, 1, 1,
-0.1957608, 0.04392288, -0.5331063, 0, 0, 0, 1, 1,
-0.195435, 0.7560848, 0.9540351, 0, 0, 0, 1, 1,
-0.1915853, -0.9122804, -2.87052, 0, 0, 0, 1, 1,
-0.1826613, 0.4451541, 0.916114, 0, 0, 0, 1, 1,
-0.1820168, 0.8164604, -0.1906096, 1, 1, 1, 1, 1,
-0.1772482, 1.057842, 0.4806713, 1, 1, 1, 1, 1,
-0.1767205, 1.632951, 0.7065983, 1, 1, 1, 1, 1,
-0.1734142, 1.445535, 1.015387, 1, 1, 1, 1, 1,
-0.1708357, -0.1852984, -1.864102, 1, 1, 1, 1, 1,
-0.169427, 1.000978, 0.8316986, 1, 1, 1, 1, 1,
-0.1634247, -0.6692266, -3.067234, 1, 1, 1, 1, 1,
-0.1618786, -0.3042307, -2.376285, 1, 1, 1, 1, 1,
-0.1614432, 1.057382, 0.5866227, 1, 1, 1, 1, 1,
-0.161316, 0.692872, -0.1613506, 1, 1, 1, 1, 1,
-0.160414, 1.135547, -2.502674, 1, 1, 1, 1, 1,
-0.1598588, -0.5988539, -2.106398, 1, 1, 1, 1, 1,
-0.1597645, -0.2398748, -3.189873, 1, 1, 1, 1, 1,
-0.1571693, -1.538732, -1.649184, 1, 1, 1, 1, 1,
-0.1550253, 0.2737833, -1.907474, 1, 1, 1, 1, 1,
-0.153911, 0.5678017, -1.408404, 0, 0, 1, 1, 1,
-0.1528079, -0.1244793, -2.241158, 1, 0, 0, 1, 1,
-0.1506915, -0.2605722, -1.740463, 1, 0, 0, 1, 1,
-0.1501835, 1.38935, -1.321751, 1, 0, 0, 1, 1,
-0.1501699, 0.4451871, 0.0486517, 1, 0, 0, 1, 1,
-0.147771, 0.2945667, -1.113759, 1, 0, 0, 1, 1,
-0.1464392, -0.2021815, -1.890956, 0, 0, 0, 1, 1,
-0.1453439, -1.031165, -1.514929, 0, 0, 0, 1, 1,
-0.1445464, 0.4238937, -1.595578, 0, 0, 0, 1, 1,
-0.141672, 0.2511478, 0.3370773, 0, 0, 0, 1, 1,
-0.1394442, -0.7920986, -3.836525, 0, 0, 0, 1, 1,
-0.1343081, -1.92711, -2.997177, 0, 0, 0, 1, 1,
-0.130703, -0.4160854, -2.931301, 0, 0, 0, 1, 1,
-0.1299094, -1.073073, -3.403343, 1, 1, 1, 1, 1,
-0.1288504, 0.1563135, 1.385858, 1, 1, 1, 1, 1,
-0.1287865, 0.69848, 0.3552982, 1, 1, 1, 1, 1,
-0.1264859, 0.2375722, -1.069466, 1, 1, 1, 1, 1,
-0.1250168, -0.2519159, -1.474944, 1, 1, 1, 1, 1,
-0.1242151, 0.640187, -0.1464598, 1, 1, 1, 1, 1,
-0.1238546, 0.1795845, 0.4597889, 1, 1, 1, 1, 1,
-0.1230607, 0.09993374, -0.6268479, 1, 1, 1, 1, 1,
-0.1212128, 0.2609171, -1.44221, 1, 1, 1, 1, 1,
-0.121148, 0.6360492, -1.402411, 1, 1, 1, 1, 1,
-0.120443, -0.9077989, -1.529698, 1, 1, 1, 1, 1,
-0.1190306, 0.7328479, -0.1874303, 1, 1, 1, 1, 1,
-0.1185895, -1.060854, -2.333741, 1, 1, 1, 1, 1,
-0.1171539, 0.3682047, 0.07821518, 1, 1, 1, 1, 1,
-0.1167769, 0.74756, -0.1999148, 1, 1, 1, 1, 1,
-0.1161119, -0.9541799, -4.245978, 0, 0, 1, 1, 1,
-0.1123206, 1.738762, -1.017367, 1, 0, 0, 1, 1,
-0.1110147, -0.04714704, -0.8743511, 1, 0, 0, 1, 1,
-0.1069377, -0.4490204, -1.561546, 1, 0, 0, 1, 1,
-0.1044084, 1.217314, -0.2246853, 1, 0, 0, 1, 1,
-0.1040225, -2.097032, -2.962897, 1, 0, 0, 1, 1,
-0.103396, 0.07423285, -1.532362, 0, 0, 0, 1, 1,
-0.1031335, 0.9585661, 0.7509039, 0, 0, 0, 1, 1,
-0.09864666, 0.2945133, -0.499583, 0, 0, 0, 1, 1,
-0.09581127, 0.8706207, -0.5345444, 0, 0, 0, 1, 1,
-0.09469803, -1.352527, -3.594381, 0, 0, 0, 1, 1,
-0.08808458, 0.09418079, -1.095052, 0, 0, 0, 1, 1,
-0.08650301, -0.5529531, -2.169854, 0, 0, 0, 1, 1,
-0.08440956, -1.505386, -3.152576, 1, 1, 1, 1, 1,
-0.08268402, 0.1758655, -0.02540162, 1, 1, 1, 1, 1,
-0.07920042, 0.4727644, -1.373211, 1, 1, 1, 1, 1,
-0.07880796, -0.229497, -3.983968, 1, 1, 1, 1, 1,
-0.07774853, -2.800126, -4.257519, 1, 1, 1, 1, 1,
-0.0763101, 0.1008973, -1.45543, 1, 1, 1, 1, 1,
-0.07048551, 0.1188895, -1.578483, 1, 1, 1, 1, 1,
-0.06879529, -0.4702429, -3.440013, 1, 1, 1, 1, 1,
-0.06614558, -0.5465567, -4.077247, 1, 1, 1, 1, 1,
-0.06388728, 1.212904, 1.535182, 1, 1, 1, 1, 1,
-0.06217046, 1.085644, -0.7756945, 1, 1, 1, 1, 1,
-0.05760682, 0.4321087, -1.868552, 1, 1, 1, 1, 1,
-0.0536979, -1.17398, -1.848916, 1, 1, 1, 1, 1,
-0.04913328, -0.5000832, -4.890748, 1, 1, 1, 1, 1,
-0.04870506, 0.1959879, 1.571588, 1, 1, 1, 1, 1,
-0.04618952, -0.935199, -1.946947, 0, 0, 1, 1, 1,
-0.04146631, 1.191491, 0.6840428, 1, 0, 0, 1, 1,
-0.03656497, -0.5611993, -3.56341, 1, 0, 0, 1, 1,
-0.03445467, -0.5452833, -4.393014, 1, 0, 0, 1, 1,
-0.03380178, 0.5827034, 0.930539, 1, 0, 0, 1, 1,
-0.03085326, 1.332083, -0.6809807, 1, 0, 0, 1, 1,
-0.02953705, 0.03913691, -0.8492289, 0, 0, 0, 1, 1,
-0.02887875, -1.500705, -3.81391, 0, 0, 0, 1, 1,
-0.02525921, -0.64794, -2.477241, 0, 0, 0, 1, 1,
-0.02177443, 0.01990089, -1.212199, 0, 0, 0, 1, 1,
-0.02022217, 0.7768307, 1.417322, 0, 0, 0, 1, 1,
-0.01546329, -0.6351131, -2.02176, 0, 0, 0, 1, 1,
-0.01124961, 0.2402103, -0.7291516, 0, 0, 0, 1, 1,
-0.00771124, 0.4722939, -2.12235, 1, 1, 1, 1, 1,
-0.005800327, 0.598657, 1.200986, 1, 1, 1, 1, 1,
-0.003976148, -1.047815, -3.405941, 1, 1, 1, 1, 1,
0.001207432, 1.039977, 1.165911, 1, 1, 1, 1, 1,
0.006057302, 0.3976483, 0.4340606, 1, 1, 1, 1, 1,
0.007978451, 0.6413433, 0.2017452, 1, 1, 1, 1, 1,
0.01138692, 1.328158, -0.3565761, 1, 1, 1, 1, 1,
0.01237116, 0.0150936, 1.012012, 1, 1, 1, 1, 1,
0.01556084, 2.19166, 1.165682, 1, 1, 1, 1, 1,
0.02035618, -0.5741284, 0.8482662, 1, 1, 1, 1, 1,
0.02052829, 1.756479, -1.129901, 1, 1, 1, 1, 1,
0.02703136, -0.2243939, 3.535774, 1, 1, 1, 1, 1,
0.03090377, -0.0749464, 2.053889, 1, 1, 1, 1, 1,
0.03753248, 0.5681435, -0.4976931, 1, 1, 1, 1, 1,
0.03938439, 1.150245, -0.9532452, 1, 1, 1, 1, 1,
0.0417171, -0.50622, 2.390722, 0, 0, 1, 1, 1,
0.04304398, 1.216686, 0.4909041, 1, 0, 0, 1, 1,
0.04433172, -0.1149911, 4.043342, 1, 0, 0, 1, 1,
0.04465544, -0.879414, 2.285372, 1, 0, 0, 1, 1,
0.04680122, 1.820996, -0.6746442, 1, 0, 0, 1, 1,
0.05263897, 1.185232, 0.9589485, 1, 0, 0, 1, 1,
0.06090065, 1.221724, 0.151207, 0, 0, 0, 1, 1,
0.06239109, 1.928596, -1.163107, 0, 0, 0, 1, 1,
0.06301453, 0.5901588, -0.5233842, 0, 0, 0, 1, 1,
0.06403438, 0.4029557, -0.3641802, 0, 0, 0, 1, 1,
0.06512234, 0.9498338, 1.477306, 0, 0, 0, 1, 1,
0.06840517, -1.769078, 3.451122, 0, 0, 0, 1, 1,
0.06855109, 0.7309263, -0.3209561, 0, 0, 0, 1, 1,
0.07036649, 0.6164702, 0.7611257, 1, 1, 1, 1, 1,
0.07102755, -0.09913461, 2.434718, 1, 1, 1, 1, 1,
0.07274084, -0.4725899, 2.144653, 1, 1, 1, 1, 1,
0.07512224, 0.8902133, 0.6542212, 1, 1, 1, 1, 1,
0.0809572, 0.5043237, 0.5035253, 1, 1, 1, 1, 1,
0.08611558, -1.487075, 3.516652, 1, 1, 1, 1, 1,
0.08669696, -0.8337111, 2.146432, 1, 1, 1, 1, 1,
0.09648998, 0.2933732, -0.1840427, 1, 1, 1, 1, 1,
0.09671034, 1.347432, 1.635659, 1, 1, 1, 1, 1,
0.1011218, -0.05425958, 1.45885, 1, 1, 1, 1, 1,
0.1026757, -0.4783456, 2.634119, 1, 1, 1, 1, 1,
0.1102099, -0.9392428, 6.075404, 1, 1, 1, 1, 1,
0.1106805, 0.1034237, 0.2971058, 1, 1, 1, 1, 1,
0.1114738, 0.9698399, 0.3405947, 1, 1, 1, 1, 1,
0.1207773, 0.6128685, -0.1671329, 1, 1, 1, 1, 1,
0.1208081, -0.8738591, 1.499617, 0, 0, 1, 1, 1,
0.1216522, 1.009065, -0.3880659, 1, 0, 0, 1, 1,
0.1240036, 0.5778647, -1.481904, 1, 0, 0, 1, 1,
0.126935, -0.6836419, 2.738856, 1, 0, 0, 1, 1,
0.1285813, -0.6842148, 2.071625, 1, 0, 0, 1, 1,
0.1303945, 0.4234442, 0.6099221, 1, 0, 0, 1, 1,
0.1351921, -0.4027096, 2.807167, 0, 0, 0, 1, 1,
0.1380288, -0.1404478, 1.623509, 0, 0, 0, 1, 1,
0.1382761, 1.267366, -0.5409795, 0, 0, 0, 1, 1,
0.1433261, -0.1603037, 4.401126, 0, 0, 0, 1, 1,
0.1439693, -0.2737797, 1.554003, 0, 0, 0, 1, 1,
0.1491, -0.9325968, 2.016058, 0, 0, 0, 1, 1,
0.1499895, 0.6185291, 0.3465419, 0, 0, 0, 1, 1,
0.1554307, -0.04082116, 1.872608, 1, 1, 1, 1, 1,
0.1570327, -1.633142, 3.214957, 1, 1, 1, 1, 1,
0.1571857, 1.228794, 0.03823751, 1, 1, 1, 1, 1,
0.1604553, -0.6934967, 3.764081, 1, 1, 1, 1, 1,
0.1651178, -1.154637, 3.435128, 1, 1, 1, 1, 1,
0.1666815, -0.3204492, 2.622831, 1, 1, 1, 1, 1,
0.1724253, -0.1233376, 3.073736, 1, 1, 1, 1, 1,
0.1730291, 0.9944115, -1.051482, 1, 1, 1, 1, 1,
0.173562, 0.3257944, 2.097417, 1, 1, 1, 1, 1,
0.1750159, 0.7805823, -0.1759192, 1, 1, 1, 1, 1,
0.1761182, -1.289347, 3.046784, 1, 1, 1, 1, 1,
0.1786709, 0.03789892, 0.5579758, 1, 1, 1, 1, 1,
0.1839539, -2.907165, 1.673793, 1, 1, 1, 1, 1,
0.1874102, 1.010073, 1.285073, 1, 1, 1, 1, 1,
0.1911982, 0.9138573, 0.3153865, 1, 1, 1, 1, 1,
0.1929383, -0.4020519, 4.533497, 0, 0, 1, 1, 1,
0.1946971, -1.068725, 4.050645, 1, 0, 0, 1, 1,
0.1952301, 0.3567147, 1.115236, 1, 0, 0, 1, 1,
0.1960576, -0.01499152, 2.083076, 1, 0, 0, 1, 1,
0.1961023, 0.8901216, -1.049857, 1, 0, 0, 1, 1,
0.1966951, 0.9392812, -0.1126105, 1, 0, 0, 1, 1,
0.1969087, -1.555384, 2.801798, 0, 0, 0, 1, 1,
0.1975092, 0.8636481, 0.9169382, 0, 0, 0, 1, 1,
0.2001613, -0.2761774, 1.752925, 0, 0, 0, 1, 1,
0.2022385, 0.8386204, -0.05029561, 0, 0, 0, 1, 1,
0.2056842, 0.8864793, 0.5256942, 0, 0, 0, 1, 1,
0.2069466, 0.9467414, -0.6943957, 0, 0, 0, 1, 1,
0.2072016, 0.5696021, 1.030265, 0, 0, 0, 1, 1,
0.2075039, -1.724504, 3.465869, 1, 1, 1, 1, 1,
0.2085215, 1.423186, -0.4234651, 1, 1, 1, 1, 1,
0.2131558, -2.040901, 3.697039, 1, 1, 1, 1, 1,
0.2194886, -1.14105, 2.410207, 1, 1, 1, 1, 1,
0.2198997, 1.375782, 0.3840167, 1, 1, 1, 1, 1,
0.2213509, -0.5956675, 1.787925, 1, 1, 1, 1, 1,
0.2232209, 2.216436, -0.3522955, 1, 1, 1, 1, 1,
0.2241841, -0.2815673, 3.298347, 1, 1, 1, 1, 1,
0.2312547, 0.8048142, 0.3268989, 1, 1, 1, 1, 1,
0.2352527, 0.9208607, -1.112898, 1, 1, 1, 1, 1,
0.2396731, -0.1894094, 2.438929, 1, 1, 1, 1, 1,
0.2412779, -0.6639389, 2.075947, 1, 1, 1, 1, 1,
0.2430121, 1.584768, -0.2265261, 1, 1, 1, 1, 1,
0.2451827, -1.531011, 2.619153, 1, 1, 1, 1, 1,
0.2468331, -0.9762611, 3.697472, 1, 1, 1, 1, 1,
0.2502643, 2.040244, -0.2600868, 0, 0, 1, 1, 1,
0.250273, -0.6579654, 1.625072, 1, 0, 0, 1, 1,
0.2515612, -0.2153104, 3.861248, 1, 0, 0, 1, 1,
0.2530904, -0.226957, 1.424924, 1, 0, 0, 1, 1,
0.2572611, 0.7184962, 2.886176, 1, 0, 0, 1, 1,
0.2583679, 0.7867155, -0.45802, 1, 0, 0, 1, 1,
0.2585208, 1.043429, 1.218752, 0, 0, 0, 1, 1,
0.2591075, 1.317663, -0.7378882, 0, 0, 0, 1, 1,
0.266659, -1.616006, 4.170993, 0, 0, 0, 1, 1,
0.268365, -1.537565, 0.849783, 0, 0, 0, 1, 1,
0.2686124, 0.4533831, -0.8805536, 0, 0, 0, 1, 1,
0.282637, 0.8419673, -0.4729751, 0, 0, 0, 1, 1,
0.2835215, 0.06436168, -0.2357415, 0, 0, 0, 1, 1,
0.2835222, 1.287102, -0.3244717, 1, 1, 1, 1, 1,
0.2838751, 0.2781088, 0.8691816, 1, 1, 1, 1, 1,
0.2848463, -1.337375, 0.9888572, 1, 1, 1, 1, 1,
0.2852564, 1.583668, 0.7413239, 1, 1, 1, 1, 1,
0.2913064, 0.3698125, 1.106655, 1, 1, 1, 1, 1,
0.2947753, -0.03575078, 0.4675847, 1, 1, 1, 1, 1,
0.2990536, -0.7015423, -0.3541955, 1, 1, 1, 1, 1,
0.3021479, 0.227665, 1.388585, 1, 1, 1, 1, 1,
0.3100477, -0.7886392, 2.988947, 1, 1, 1, 1, 1,
0.3107384, -1.03716, 2.425994, 1, 1, 1, 1, 1,
0.3118243, -0.28879, 0.8201801, 1, 1, 1, 1, 1,
0.312459, 0.2683836, -0.1777031, 1, 1, 1, 1, 1,
0.3172971, 0.06897584, 1.706121, 1, 1, 1, 1, 1,
0.3207366, 0.6046529, 1.207273, 1, 1, 1, 1, 1,
0.323857, 0.7692723, 0.688089, 1, 1, 1, 1, 1,
0.3245623, -0.7423896, 1.511706, 0, 0, 1, 1, 1,
0.3308691, 0.8445963, 1.998549, 1, 0, 0, 1, 1,
0.3354626, -0.07717382, 2.762768, 1, 0, 0, 1, 1,
0.3376143, -0.7795483, 2.191553, 1, 0, 0, 1, 1,
0.3378661, -0.310856, 3.738257, 1, 0, 0, 1, 1,
0.3395944, 1.118914, 1.306768, 1, 0, 0, 1, 1,
0.343818, 1.878432, -0.4823759, 0, 0, 0, 1, 1,
0.3448261, -1.813091, 2.78975, 0, 0, 0, 1, 1,
0.3456195, -0.9235721, 2.926238, 0, 0, 0, 1, 1,
0.3498157, 1.695171, -0.7772174, 0, 0, 0, 1, 1,
0.3506653, 0.2486822, 1.532882, 0, 0, 0, 1, 1,
0.3525981, -0.05835645, 1.749794, 0, 0, 0, 1, 1,
0.3542341, 0.009456147, 2.972436, 0, 0, 0, 1, 1,
0.3638419, 1.280504, 0.2915201, 1, 1, 1, 1, 1,
0.374428, -0.445217, 3.294704, 1, 1, 1, 1, 1,
0.3749506, -0.2593826, 0.4585478, 1, 1, 1, 1, 1,
0.3761362, 0.6536306, 0.7617338, 1, 1, 1, 1, 1,
0.3826584, 1.340067, 0.7620247, 1, 1, 1, 1, 1,
0.3845371, 0.09249691, 0.02731082, 1, 1, 1, 1, 1,
0.3866133, -0.1606142, 2.360649, 1, 1, 1, 1, 1,
0.3872627, 0.2212382, 3.110538, 1, 1, 1, 1, 1,
0.3985365, -1.6211, 4.947154, 1, 1, 1, 1, 1,
0.406984, 0.4706431, 0.8901307, 1, 1, 1, 1, 1,
0.4087346, -1.454689, 1.750839, 1, 1, 1, 1, 1,
0.4108982, 1.019067, 0.4076186, 1, 1, 1, 1, 1,
0.4220232, 0.7310258, 0.6741701, 1, 1, 1, 1, 1,
0.4295007, -0.8658472, 1.671917, 1, 1, 1, 1, 1,
0.4303463, -1.930155, 2.64565, 1, 1, 1, 1, 1,
0.430815, -0.9915033, 5.449463, 0, 0, 1, 1, 1,
0.4322125, -0.713345, 2.902596, 1, 0, 0, 1, 1,
0.4333805, 1.882319, 0.552294, 1, 0, 0, 1, 1,
0.434179, 1.545939, 1.524141, 1, 0, 0, 1, 1,
0.4408114, 0.7334908, 0.22609, 1, 0, 0, 1, 1,
0.4411775, -0.828491, 2.788457, 1, 0, 0, 1, 1,
0.4414612, 1.611406, -0.04243435, 0, 0, 0, 1, 1,
0.4447801, -0.1448662, 1.075499, 0, 0, 0, 1, 1,
0.445221, -1.001782, 3.746259, 0, 0, 0, 1, 1,
0.4476902, 1.051113, -0.3815536, 0, 0, 0, 1, 1,
0.4542216, 0.1761056, 2.794437, 0, 0, 0, 1, 1,
0.4564705, 0.5943739, -1.306924, 0, 0, 0, 1, 1,
0.4611733, 0.3386459, 1.56225, 0, 0, 0, 1, 1,
0.4749092, -0.4801628, 3.089256, 1, 1, 1, 1, 1,
0.4761344, 0.3935775, 0.9153815, 1, 1, 1, 1, 1,
0.4803482, 0.1085781, 1.4796, 1, 1, 1, 1, 1,
0.4815492, 0.9198732, -0.7727683, 1, 1, 1, 1, 1,
0.48209, 0.5236704, 0.5137379, 1, 1, 1, 1, 1,
0.485425, 0.1156754, 0.8615345, 1, 1, 1, 1, 1,
0.4895611, 0.4062118, -0.2038156, 1, 1, 1, 1, 1,
0.4931086, 0.7003962, -0.6746956, 1, 1, 1, 1, 1,
0.5046957, -0.3371182, 0.3153395, 1, 1, 1, 1, 1,
0.5096683, 0.7261971, 0.3516235, 1, 1, 1, 1, 1,
0.5147937, 1.708037, -0.1290153, 1, 1, 1, 1, 1,
0.5185646, 0.9880291, 1.405107, 1, 1, 1, 1, 1,
0.5220008, 0.5343457, 0.268925, 1, 1, 1, 1, 1,
0.5233299, 0.6210999, 2.402984, 1, 1, 1, 1, 1,
0.5264451, -1.241974, 1.27933, 1, 1, 1, 1, 1,
0.5303883, 0.7696044, 0.9676441, 0, 0, 1, 1, 1,
0.5322367, 0.2698907, -0.6813049, 1, 0, 0, 1, 1,
0.5346484, 0.01093027, 0.4074143, 1, 0, 0, 1, 1,
0.5364513, -0.2854402, 0.1137278, 1, 0, 0, 1, 1,
0.5405143, 0.2134841, 2.221465, 1, 0, 0, 1, 1,
0.5415694, 0.7458023, 0.5260864, 1, 0, 0, 1, 1,
0.5440542, -1.405485, 3.30527, 0, 0, 0, 1, 1,
0.5489372, -0.7052149, 0.8674944, 0, 0, 0, 1, 1,
0.5493432, 0.1395182, 1.275311, 0, 0, 0, 1, 1,
0.5500355, -0.7581152, 2.872927, 0, 0, 0, 1, 1,
0.5504174, -0.2937663, 2.448086, 0, 0, 0, 1, 1,
0.5564082, -2.057614, 1.28619, 0, 0, 0, 1, 1,
0.5565157, -0.3141459, 3.169963, 0, 0, 0, 1, 1,
0.5568386, -0.6228053, 3.061135, 1, 1, 1, 1, 1,
0.5588889, -0.2439002, 2.599349, 1, 1, 1, 1, 1,
0.5594197, 0.8183486, 0.5124335, 1, 1, 1, 1, 1,
0.5602304, -1.614962, 3.037649, 1, 1, 1, 1, 1,
0.5611562, -1.228268, 1.628046, 1, 1, 1, 1, 1,
0.5612767, 0.6501857, 2.471924, 1, 1, 1, 1, 1,
0.5627217, 1.067365, 0.2052124, 1, 1, 1, 1, 1,
0.5632842, -1.316571, 2.216824, 1, 1, 1, 1, 1,
0.5634345, -1.209113, 5.240079, 1, 1, 1, 1, 1,
0.5706116, -1.742707, 2.668417, 1, 1, 1, 1, 1,
0.5725449, 0.5293046, 0.774865, 1, 1, 1, 1, 1,
0.5726736, -0.1825394, 2.345149, 1, 1, 1, 1, 1,
0.5742597, 1.236612, -0.8476759, 1, 1, 1, 1, 1,
0.5745701, -0.04468948, 2.30247, 1, 1, 1, 1, 1,
0.5773459, -0.04811663, 2.375833, 1, 1, 1, 1, 1,
0.5782036, 0.5727184, 0.3441051, 0, 0, 1, 1, 1,
0.5801115, 0.3905589, 0.3512925, 1, 0, 0, 1, 1,
0.5810744, -0.5591514, 1.919546, 1, 0, 0, 1, 1,
0.5821182, 0.6998978, -0.2997824, 1, 0, 0, 1, 1,
0.5829107, 2.029368, 1.514125, 1, 0, 0, 1, 1,
0.5841358, 0.7107716, 1.786205, 1, 0, 0, 1, 1,
0.5888882, 0.4914168, -0.5530159, 0, 0, 0, 1, 1,
0.5932202, -0.3329832, 2.738947, 0, 0, 0, 1, 1,
0.5945785, -0.9059609, 2.868696, 0, 0, 0, 1, 1,
0.5946621, 1.250163, -0.3448978, 0, 0, 0, 1, 1,
0.595409, -0.7022684, 2.472859, 0, 0, 0, 1, 1,
0.599179, -0.7090455, 3.982612, 0, 0, 0, 1, 1,
0.5995758, -0.7315843, 3.281289, 0, 0, 0, 1, 1,
0.5997072, 0.6385096, 0.4845874, 1, 1, 1, 1, 1,
0.6119324, -1.675428, 1.152754, 1, 1, 1, 1, 1,
0.6175721, -0.9476438, 1.680614, 1, 1, 1, 1, 1,
0.6199899, -0.4157003, 2.005629, 1, 1, 1, 1, 1,
0.6221213, 0.8445824, -0.3992463, 1, 1, 1, 1, 1,
0.6222237, 1.102557, 1.870021, 1, 1, 1, 1, 1,
0.6241736, -0.1132476, -1.359196, 1, 1, 1, 1, 1,
0.6338379, 0.8952458, 0.5162576, 1, 1, 1, 1, 1,
0.6363255, 0.1054061, 0.4114936, 1, 1, 1, 1, 1,
0.6368619, -0.3301556, 2.38931, 1, 1, 1, 1, 1,
0.6438265, 0.1065487, 0.9264732, 1, 1, 1, 1, 1,
0.6450361, 0.02450741, 1.091375, 1, 1, 1, 1, 1,
0.6462802, 1.488457, 1.664887, 1, 1, 1, 1, 1,
0.6469532, -0.7391938, 3.487239, 1, 1, 1, 1, 1,
0.6469647, -1.034717, 1.991092, 1, 1, 1, 1, 1,
0.6540226, 0.4672825, 0.9522516, 0, 0, 1, 1, 1,
0.6545203, -0.03423546, 3.03455, 1, 0, 0, 1, 1,
0.6551397, 0.2480803, 1.520711, 1, 0, 0, 1, 1,
0.6568643, 0.8239257, 0.5885041, 1, 0, 0, 1, 1,
0.6663741, -1.501969, 4.924564, 1, 0, 0, 1, 1,
0.668672, -1.659165, 2.903073, 1, 0, 0, 1, 1,
0.6696557, -0.8108253, 3.88979, 0, 0, 0, 1, 1,
0.6711169, -0.5529251, 3.810616, 0, 0, 0, 1, 1,
0.6772599, 0.9224969, 0.6143918, 0, 0, 0, 1, 1,
0.6802267, 0.9157094, 1.066691, 0, 0, 0, 1, 1,
0.6833344, -1.678654, 3.740939, 0, 0, 0, 1, 1,
0.6835487, -0.3221252, 1.974793, 0, 0, 0, 1, 1,
0.6881443, -0.5039165, 1.368654, 0, 0, 0, 1, 1,
0.6906796, 0.1564154, -1.076935, 1, 1, 1, 1, 1,
0.6925019, -0.1382586, 1.896057, 1, 1, 1, 1, 1,
0.696041, 1.544804, -0.6826937, 1, 1, 1, 1, 1,
0.6982923, -0.8975761, 2.406631, 1, 1, 1, 1, 1,
0.7035736, -1.178198, 1.862895, 1, 1, 1, 1, 1,
0.7084056, 0.8789846, 1.528453, 1, 1, 1, 1, 1,
0.7093028, -0.4059286, 1.853553, 1, 1, 1, 1, 1,
0.7132133, -0.1959336, 2.670589, 1, 1, 1, 1, 1,
0.7138492, -1.491154, 1.921244, 1, 1, 1, 1, 1,
0.7141174, 0.3209928, 0.1830686, 1, 1, 1, 1, 1,
0.7145474, -0.5193884, 4.42691, 1, 1, 1, 1, 1,
0.7154317, -0.7919864, 2.02588, 1, 1, 1, 1, 1,
0.7160864, 0.8408049, 1.09707, 1, 1, 1, 1, 1,
0.7176834, 1.232024, -0.6750621, 1, 1, 1, 1, 1,
0.7185424, 1.357669, 0.7790917, 1, 1, 1, 1, 1,
0.7245991, -0.0847287, 1.587605, 0, 0, 1, 1, 1,
0.7256126, -1.781297, 1.703683, 1, 0, 0, 1, 1,
0.7260433, 1.955732, -0.2906723, 1, 0, 0, 1, 1,
0.729749, 2.338213, -1.005183, 1, 0, 0, 1, 1,
0.732608, -0.274621, 2.94206, 1, 0, 0, 1, 1,
0.7385792, 0.3733671, 1.737602, 1, 0, 0, 1, 1,
0.738605, -0.1109586, 2.356085, 0, 0, 0, 1, 1,
0.7486619, -0.2454769, 1.399123, 0, 0, 0, 1, 1,
0.7501727, 0.1496392, 1.90099, 0, 0, 0, 1, 1,
0.7505564, 0.09731469, 1.579249, 0, 0, 0, 1, 1,
0.7514331, -0.02253084, 1.378652, 0, 0, 0, 1, 1,
0.75477, -0.7371489, 2.711842, 0, 0, 0, 1, 1,
0.755631, 0.1758462, 0.8092279, 0, 0, 0, 1, 1,
0.7557596, -0.6495873, 2.672435, 1, 1, 1, 1, 1,
0.7582194, -0.3701343, -0.077738, 1, 1, 1, 1, 1,
0.7626842, 0.6317032, 1.423695, 1, 1, 1, 1, 1,
0.7646282, -0.08801597, 2.522299, 1, 1, 1, 1, 1,
0.7648022, -0.669988, 3.335975, 1, 1, 1, 1, 1,
0.7653019, 1.368038, 0.1772646, 1, 1, 1, 1, 1,
0.7671325, -1.157684, 3.137236, 1, 1, 1, 1, 1,
0.7680245, -0.1829893, 2.456424, 1, 1, 1, 1, 1,
0.7686809, 0.04803365, 0.8896234, 1, 1, 1, 1, 1,
0.7732551, 0.4871031, -0.6593585, 1, 1, 1, 1, 1,
0.7777635, 0.03142379, 0.7378573, 1, 1, 1, 1, 1,
0.7808191, -1.046481, 2.225494, 1, 1, 1, 1, 1,
0.7811534, -1.752399, 2.401424, 1, 1, 1, 1, 1,
0.7819699, 0.04352137, 1.683658, 1, 1, 1, 1, 1,
0.7857053, 0.6119699, -0.1375591, 1, 1, 1, 1, 1,
0.7871765, -0.7687573, 3.424507, 0, 0, 1, 1, 1,
0.7920371, 0.921744, 0.8071831, 1, 0, 0, 1, 1,
0.7982402, 1.003858, -1.020942, 1, 0, 0, 1, 1,
0.7994165, -1.911069, 1.847131, 1, 0, 0, 1, 1,
0.7999778, -0.6396047, 1.081548, 1, 0, 0, 1, 1,
0.8079023, -1.22267, 1.968879, 1, 0, 0, 1, 1,
0.8092529, 1.46514, -1.111158, 0, 0, 0, 1, 1,
0.8177785, -1.355302, 2.609055, 0, 0, 0, 1, 1,
0.8182113, -0.4447705, 2.014611, 0, 0, 0, 1, 1,
0.8182389, -0.3265149, 2.401619, 0, 0, 0, 1, 1,
0.8209111, 0.66935, -0.8297366, 0, 0, 0, 1, 1,
0.823051, 0.3685045, 1.508621, 0, 0, 0, 1, 1,
0.8271626, -1.938525, 2.462827, 0, 0, 0, 1, 1,
0.8285795, 0.7757248, 1.197178, 1, 1, 1, 1, 1,
0.8401195, -0.4265194, 3.576912, 1, 1, 1, 1, 1,
0.8447835, -0.4024898, 2.72654, 1, 1, 1, 1, 1,
0.8490067, -0.4471959, 0.8711682, 1, 1, 1, 1, 1,
0.8521896, -0.274592, 2.043983, 1, 1, 1, 1, 1,
0.8533092, 0.474842, 1.973419, 1, 1, 1, 1, 1,
0.8548501, -0.6974099, 1.547152, 1, 1, 1, 1, 1,
0.8552987, 1.753496, 0.1216162, 1, 1, 1, 1, 1,
0.8601016, -1.697154, 3.416033, 1, 1, 1, 1, 1,
0.8610147, -1.079351, 3.153165, 1, 1, 1, 1, 1,
0.8625792, 0.7722424, 0.1565809, 1, 1, 1, 1, 1,
0.8723804, -0.9837515, 2.789675, 1, 1, 1, 1, 1,
0.8730067, 0.09382856, 1.870634, 1, 1, 1, 1, 1,
0.8759229, -1.595646, 1.579927, 1, 1, 1, 1, 1,
0.8760449, -0.9344351, 3.209875, 1, 1, 1, 1, 1,
0.8824307, -0.5060894, 2.985147, 0, 0, 1, 1, 1,
0.8838632, -0.07593434, 1.277564, 1, 0, 0, 1, 1,
0.8868023, 0.4053068, 1.620085, 1, 0, 0, 1, 1,
0.8880696, -0.5043709, 1.632937, 1, 0, 0, 1, 1,
0.8922092, 0.2788425, 0.2503728, 1, 0, 0, 1, 1,
0.8997302, 1.612365, -1.000446, 1, 0, 0, 1, 1,
0.9007891, 0.1660399, 1.972998, 0, 0, 0, 1, 1,
0.9092225, 0.2500944, 0.6986755, 0, 0, 0, 1, 1,
0.912068, -0.1516985, -0.1827653, 0, 0, 0, 1, 1,
0.9134193, 0.543848, 2.481194, 0, 0, 0, 1, 1,
0.9235845, 1.44036, 1.397122, 0, 0, 0, 1, 1,
0.9255055, -0.8788787, 3.411675, 0, 0, 0, 1, 1,
0.9291691, 0.1342432, 0.9725791, 0, 0, 0, 1, 1,
0.9294031, -1.447241, 1.903757, 1, 1, 1, 1, 1,
0.9386807, -3.072102, 2.261935, 1, 1, 1, 1, 1,
0.9453655, 0.7269692, 0.3031517, 1, 1, 1, 1, 1,
0.9470349, 0.3526018, 1.309643, 1, 1, 1, 1, 1,
0.9507561, -0.9192411, 1.695496, 1, 1, 1, 1, 1,
0.9555202, 0.6238875, -0.2121874, 1, 1, 1, 1, 1,
0.9567947, 0.02620424, 3.454165, 1, 1, 1, 1, 1,
0.9592451, -1.068048, 1.683557, 1, 1, 1, 1, 1,
0.9685138, -0.6864616, 0.4670976, 1, 1, 1, 1, 1,
0.9715622, 0.3035868, 1.367537, 1, 1, 1, 1, 1,
0.9812692, -0.3387902, 1.164427, 1, 1, 1, 1, 1,
0.9815844, -0.923646, 3.76978, 1, 1, 1, 1, 1,
0.9829924, 0.8070917, 1.162303, 1, 1, 1, 1, 1,
0.9865108, -1.313514, 3.8963, 1, 1, 1, 1, 1,
0.993277, 1.580692, 0.3477955, 1, 1, 1, 1, 1,
1.003806, 1.865518, 0.4135627, 0, 0, 1, 1, 1,
1.003852, -0.4714386, 0.9073795, 1, 0, 0, 1, 1,
1.006945, -2.162791, 3.659982, 1, 0, 0, 1, 1,
1.017753, 1.389977, 1.610682, 1, 0, 0, 1, 1,
1.024726, 1.166777, 1.22959, 1, 0, 0, 1, 1,
1.026665, 0.4845054, 0.2523755, 1, 0, 0, 1, 1,
1.034085, 0.3744832, 3.330189, 0, 0, 0, 1, 1,
1.045943, 0.5811108, 1.767542, 0, 0, 0, 1, 1,
1.053751, -0.3572264, 1.853839, 0, 0, 0, 1, 1,
1.058722, 0.7122588, 1.690968, 0, 0, 0, 1, 1,
1.068784, -1.045324, 3.135703, 0, 0, 0, 1, 1,
1.085585, -1.111074, 1.138378, 0, 0, 0, 1, 1,
1.090869, -0.8494886, 2.693255, 0, 0, 0, 1, 1,
1.097362, -0.9005992, 1.461432, 1, 1, 1, 1, 1,
1.103547, 1.570938, 1.354745, 1, 1, 1, 1, 1,
1.107038, 2.211854, 1.257761, 1, 1, 1, 1, 1,
1.108486, 1.307181, 1.190381, 1, 1, 1, 1, 1,
1.121935, -0.4047679, 1.79798, 1, 1, 1, 1, 1,
1.138745, 0.4978336, 2.035565, 1, 1, 1, 1, 1,
1.140382, -0.5537784, 1.630462, 1, 1, 1, 1, 1,
1.142008, -1.092891, 2.828893, 1, 1, 1, 1, 1,
1.153213, 1.005856, 1.161598, 1, 1, 1, 1, 1,
1.155147, -1.282397, 3.475169, 1, 1, 1, 1, 1,
1.156343, 2.156484, -0.6763365, 1, 1, 1, 1, 1,
1.157913, -0.6778595, 2.766571, 1, 1, 1, 1, 1,
1.161399, -0.7033999, 1.163608, 1, 1, 1, 1, 1,
1.169113, 0.08084539, -0.6099173, 1, 1, 1, 1, 1,
1.169776, -1.023138, 2.588477, 1, 1, 1, 1, 1,
1.176023, 0.2499303, 1.196362, 0, 0, 1, 1, 1,
1.177072, 0.9567313, 2.328886, 1, 0, 0, 1, 1,
1.179259, 0.6243577, 1.377389, 1, 0, 0, 1, 1,
1.179737, 0.301951, 0.7079062, 1, 0, 0, 1, 1,
1.186221, 1.461055, 2.602825, 1, 0, 0, 1, 1,
1.19328, 1.259442, 0.3046216, 1, 0, 0, 1, 1,
1.197585, 1.038388, 1.747743, 0, 0, 0, 1, 1,
1.203811, 1.753197, -0.3564875, 0, 0, 0, 1, 1,
1.205877, 0.4930957, 0.4765961, 0, 0, 0, 1, 1,
1.210291, 0.6164091, 0.805443, 0, 0, 0, 1, 1,
1.228515, 1.672038, -3.062284, 0, 0, 0, 1, 1,
1.229773, -0.3180358, 2.578501, 0, 0, 0, 1, 1,
1.232511, -0.5241873, 4.316356, 0, 0, 0, 1, 1,
1.246381, 2.229672, -0.01294195, 1, 1, 1, 1, 1,
1.247257, 2.278439, 1.227878, 1, 1, 1, 1, 1,
1.26474, -0.4599956, 1.573242, 1, 1, 1, 1, 1,
1.267234, 0.01180132, 1.525748, 1, 1, 1, 1, 1,
1.280497, -0.2664625, 2.796026, 1, 1, 1, 1, 1,
1.287848, 1.180861, 1.67806, 1, 1, 1, 1, 1,
1.291755, -0.7941836, 3.703648, 1, 1, 1, 1, 1,
1.298169, -0.3377425, 2.59593, 1, 1, 1, 1, 1,
1.300188, -0.0221798, -0.5621247, 1, 1, 1, 1, 1,
1.315812, 0.2756835, 2.736876, 1, 1, 1, 1, 1,
1.316134, 1.418996, 0.9681535, 1, 1, 1, 1, 1,
1.326536, 1.482325, -0.6458865, 1, 1, 1, 1, 1,
1.340083, 0.94557, 1.957617, 1, 1, 1, 1, 1,
1.340439, -0.1531271, 2.535785, 1, 1, 1, 1, 1,
1.341205, 0.594898, 0.5232885, 1, 1, 1, 1, 1,
1.343937, -0.5317524, 2.441338, 0, 0, 1, 1, 1,
1.352472, -1.089929, 0.3506013, 1, 0, 0, 1, 1,
1.378541, -2.5133, 3.826343, 1, 0, 0, 1, 1,
1.383005, -0.4853159, 2.514178, 1, 0, 0, 1, 1,
1.385956, -0.1578453, 0.1144741, 1, 0, 0, 1, 1,
1.397217, 0.8655006, 1.384546, 1, 0, 0, 1, 1,
1.419926, 1.312876, 1.800438, 0, 0, 0, 1, 1,
1.430795, 0.0863013, 1.943024, 0, 0, 0, 1, 1,
1.435121, -0.7498084, 2.718948, 0, 0, 0, 1, 1,
1.440295, -0.01484091, 0.8139789, 0, 0, 0, 1, 1,
1.441137, -0.6870812, 2.31347, 0, 0, 0, 1, 1,
1.448014, -1.675722, 4.139032, 0, 0, 0, 1, 1,
1.450126, 0.2029929, 0.714529, 0, 0, 0, 1, 1,
1.461335, -0.3042902, 1.993729, 1, 1, 1, 1, 1,
1.461463, -0.9121551, 0.8783786, 1, 1, 1, 1, 1,
1.471642, -0.8011887, 1.664532, 1, 1, 1, 1, 1,
1.471745, -0.2725491, 1.879263, 1, 1, 1, 1, 1,
1.490714, 2.464229, 0.2870025, 1, 1, 1, 1, 1,
1.492572, -0.2098626, 1.590807, 1, 1, 1, 1, 1,
1.498696, -0.2447421, 3.38408, 1, 1, 1, 1, 1,
1.499906, -0.6076987, 2.170179, 1, 1, 1, 1, 1,
1.509369, 0.198368, 1.359657, 1, 1, 1, 1, 1,
1.520363, 0.2005025, 1.985991, 1, 1, 1, 1, 1,
1.529456, -0.9488811, 3.390337, 1, 1, 1, 1, 1,
1.535946, -0.7377992, 1.261453, 1, 1, 1, 1, 1,
1.541702, 0.4729875, 0.6205781, 1, 1, 1, 1, 1,
1.546903, 0.2437484, 2.309043, 1, 1, 1, 1, 1,
1.55056, -0.8991275, 0.7422026, 1, 1, 1, 1, 1,
1.550996, -0.5074069, 0.7504017, 0, 0, 1, 1, 1,
1.556413, -0.2743122, 2.306962, 1, 0, 0, 1, 1,
1.563087, 0.354571, 0.3514402, 1, 0, 0, 1, 1,
1.566854, -0.633561, 0.7007616, 1, 0, 0, 1, 1,
1.575001, -0.6693844, 1.698902, 1, 0, 0, 1, 1,
1.588939, 0.3106107, -0.03576985, 1, 0, 0, 1, 1,
1.599646, 0.1176291, 2.895751, 0, 0, 0, 1, 1,
1.60119, 0.5582196, -1.257249, 0, 0, 0, 1, 1,
1.606382, -0.5150468, 0.9124033, 0, 0, 0, 1, 1,
1.607512, 1.550684, -0.8939783, 0, 0, 0, 1, 1,
1.612574, -1.285015, 3.607573, 0, 0, 0, 1, 1,
1.616953, 1.867973, -0.3332356, 0, 0, 0, 1, 1,
1.64081, 1.720694, 1.128526, 0, 0, 0, 1, 1,
1.661065, 0.9146182, 1.640361, 1, 1, 1, 1, 1,
1.672538, 0.1490169, 1.32169, 1, 1, 1, 1, 1,
1.677696, 0.2952922, 2.272175, 1, 1, 1, 1, 1,
1.697507, 0.07705461, 0.8600788, 1, 1, 1, 1, 1,
1.749306, 0.506363, 0.6838626, 1, 1, 1, 1, 1,
1.750912, 0.8396372, 1.078165, 1, 1, 1, 1, 1,
1.773215, -1.997972, 1.570374, 1, 1, 1, 1, 1,
1.77501, -0.4787337, 2.179936, 1, 1, 1, 1, 1,
1.797093, 0.1960656, 1.651475, 1, 1, 1, 1, 1,
1.874119, 0.3836716, 1.394407, 1, 1, 1, 1, 1,
1.894527, -0.8824778, 2.219655, 1, 1, 1, 1, 1,
1.903344, 0.0576487, 0.7846249, 1, 1, 1, 1, 1,
1.913215, 0.1409353, 1.145678, 1, 1, 1, 1, 1,
1.915958, -1.835149, 3.170772, 1, 1, 1, 1, 1,
1.93564, 0.8510064, 0.7521773, 1, 1, 1, 1, 1,
1.939155, 0.704823, -0.7126988, 0, 0, 1, 1, 1,
1.97157, -0.9029418, 0.8180317, 1, 0, 0, 1, 1,
1.979048, 1.13906, 1.991044, 1, 0, 0, 1, 1,
1.983047, 0.2644321, 0.6426259, 1, 0, 0, 1, 1,
2.012747, -0.4041445, 1.861294, 1, 0, 0, 1, 1,
2.086654, 0.007325868, 2.046397, 1, 0, 0, 1, 1,
2.110797, -0.4223049, 2.85808, 0, 0, 0, 1, 1,
2.153828, -0.9580258, 3.422237, 0, 0, 0, 1, 1,
2.254023, -1.417402, 1.986221, 0, 0, 0, 1, 1,
2.255116, -0.7307723, 1.970327, 0, 0, 0, 1, 1,
2.262776, 0.7920177, -0.1376606, 0, 0, 0, 1, 1,
2.360872, 0.765812, 0.7118403, 0, 0, 0, 1, 1,
2.416554, 0.7650635, 1.034196, 0, 0, 0, 1, 1,
2.463141, 0.3257979, 1.081157, 1, 1, 1, 1, 1,
2.499327, -0.4632243, 2.525809, 1, 1, 1, 1, 1,
2.545334, 0.983675, 0.06772156, 1, 1, 1, 1, 1,
2.564353, -1.278739, 0.6703538, 1, 1, 1, 1, 1,
2.707241, -0.716397, 1.19017, 1, 1, 1, 1, 1,
2.773927, -0.2880315, 1.812177, 1, 1, 1, 1, 1,
2.959064, 1.830105, 0.9827537, 1, 1, 1, 1, 1
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
var radius = 9.602328;
var distance = 33.72777;
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
mvMatrix.translate( 0.1635374, -0.07230687, -0.5923278 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.72777);
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
