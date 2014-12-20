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
-2.736887, 0.05667231, -1.345379, 1, 0, 0, 1,
-2.608382, 0.268571, -0.7481614, 1, 0.007843138, 0, 1,
-2.541407, -0.1438785, -2.162071, 1, 0.01176471, 0, 1,
-2.438627, 0.6018185, -1.28162, 1, 0.01960784, 0, 1,
-2.342224, -0.3660613, -0.1944432, 1, 0.02352941, 0, 1,
-2.333244, -0.6490172, -1.38534, 1, 0.03137255, 0, 1,
-2.307927, 0.9210709, -1.605816, 1, 0.03529412, 0, 1,
-2.302242, 2.887956, -0.7570768, 1, 0.04313726, 0, 1,
-2.270351, -0.5856833, -1.090079, 1, 0.04705882, 0, 1,
-2.267899, -0.2727485, -0.8458534, 1, 0.05490196, 0, 1,
-2.2162, -1.275491, -3.784236, 1, 0.05882353, 0, 1,
-2.19008, 0.1147484, -1.808878, 1, 0.06666667, 0, 1,
-2.180329, 0.3394576, -1.796477, 1, 0.07058824, 0, 1,
-2.171841, 1.161618, -2.247134, 1, 0.07843138, 0, 1,
-2.167489, 0.05684434, -2.151495, 1, 0.08235294, 0, 1,
-2.148221, 0.3703422, -0.2496626, 1, 0.09019608, 0, 1,
-2.139761, 0.7410432, 0.1451309, 1, 0.09411765, 0, 1,
-2.113795, 1.037316, 0.2464112, 1, 0.1019608, 0, 1,
-2.063839, -0.9853408, -1.542393, 1, 0.1098039, 0, 1,
-1.992813, 0.5035569, -1.745394, 1, 0.1137255, 0, 1,
-1.933185, -0.3523323, -1.666923, 1, 0.1215686, 0, 1,
-1.921497, -0.4700915, -1.464193, 1, 0.1254902, 0, 1,
-1.920031, 0.8383893, -0.1173622, 1, 0.1333333, 0, 1,
-1.91564, 0.1476537, -2.323727, 1, 0.1372549, 0, 1,
-1.902708, 0.8424274, 0.004023916, 1, 0.145098, 0, 1,
-1.893979, 0.5702555, -0.1889836, 1, 0.1490196, 0, 1,
-1.890429, -2.491717, -2.627412, 1, 0.1568628, 0, 1,
-1.881983, 0.01957285, -1.750132, 1, 0.1607843, 0, 1,
-1.876872, 1.11238, -1.302102, 1, 0.1686275, 0, 1,
-1.864477, 0.4641401, -1.588792, 1, 0.172549, 0, 1,
-1.8617, 0.6440468, -2.231144, 1, 0.1803922, 0, 1,
-1.844245, 0.51788, -1.883017, 1, 0.1843137, 0, 1,
-1.800103, 0.220305, -0.9504195, 1, 0.1921569, 0, 1,
-1.748868, 0.3199144, -0.2477581, 1, 0.1960784, 0, 1,
-1.741062, -1.01672, 0.6552651, 1, 0.2039216, 0, 1,
-1.736866, -0.1373441, -2.788633, 1, 0.2117647, 0, 1,
-1.72489, -1.175909, -2.642891, 1, 0.2156863, 0, 1,
-1.720068, 0.2628116, -1.840739, 1, 0.2235294, 0, 1,
-1.719938, 0.09274184, -1.814316, 1, 0.227451, 0, 1,
-1.712681, 0.4824154, -0.8467891, 1, 0.2352941, 0, 1,
-1.703257, 2.014296, -0.6132014, 1, 0.2392157, 0, 1,
-1.67592, 0.3345368, -2.742848, 1, 0.2470588, 0, 1,
-1.668803, 0.4101719, -0.5423777, 1, 0.2509804, 0, 1,
-1.661835, -0.6616983, -0.9019113, 1, 0.2588235, 0, 1,
-1.633625, 0.4251005, -1.676635, 1, 0.2627451, 0, 1,
-1.60265, 0.8741843, -0.4195349, 1, 0.2705882, 0, 1,
-1.597254, -1.919031, -4.762759, 1, 0.2745098, 0, 1,
-1.587836, 1.76722, -2.297481, 1, 0.282353, 0, 1,
-1.586198, 0.8459281, -0.2264827, 1, 0.2862745, 0, 1,
-1.584261, 0.1980253, 1.247188, 1, 0.2941177, 0, 1,
-1.573395, 0.1276266, -1.525149, 1, 0.3019608, 0, 1,
-1.560196, -0.07920512, -1.95822, 1, 0.3058824, 0, 1,
-1.554682, 0.1190041, -1.602473, 1, 0.3137255, 0, 1,
-1.550421, -0.2825845, -2.317094, 1, 0.3176471, 0, 1,
-1.549137, 0.4890106, -0.6233554, 1, 0.3254902, 0, 1,
-1.542799, 0.643522, -0.8146458, 1, 0.3294118, 0, 1,
-1.54105, -0.2562595, -1.43844, 1, 0.3372549, 0, 1,
-1.535403, -1.489734, -1.627779, 1, 0.3411765, 0, 1,
-1.533427, 2.444599, 2.413843, 1, 0.3490196, 0, 1,
-1.527202, -0.2657912, -1.73131, 1, 0.3529412, 0, 1,
-1.519997, -0.1367485, -1.474861, 1, 0.3607843, 0, 1,
-1.518332, -0.5547852, -2.29672, 1, 0.3647059, 0, 1,
-1.517604, 0.2933578, -0.6438108, 1, 0.372549, 0, 1,
-1.513041, 0.07992423, -1.506246, 1, 0.3764706, 0, 1,
-1.508926, -1.187495, -2.213423, 1, 0.3843137, 0, 1,
-1.499282, -0.04488883, -2.51074, 1, 0.3882353, 0, 1,
-1.489071, -0.8404672, -2.911435, 1, 0.3960784, 0, 1,
-1.488391, 1.233901, -1.059407, 1, 0.4039216, 0, 1,
-1.479467, 1.18464, -1.84096, 1, 0.4078431, 0, 1,
-1.472624, -1.798951, -2.887864, 1, 0.4156863, 0, 1,
-1.465163, 1.573597, 0.03847919, 1, 0.4196078, 0, 1,
-1.462888, -0.6265249, -2.10165, 1, 0.427451, 0, 1,
-1.457942, -0.6550302, -2.033514, 1, 0.4313726, 0, 1,
-1.45233, -0.105233, -1.670597, 1, 0.4392157, 0, 1,
-1.452037, -0.3623635, -1.478554, 1, 0.4431373, 0, 1,
-1.435806, 0.2653809, -2.241548, 1, 0.4509804, 0, 1,
-1.426291, -2.399134, -1.680419, 1, 0.454902, 0, 1,
-1.420876, 0.7192473, -1.915858, 1, 0.4627451, 0, 1,
-1.417693, -0.2789984, 0.6945064, 1, 0.4666667, 0, 1,
-1.408858, 1.196937, -0.4220175, 1, 0.4745098, 0, 1,
-1.403373, -1.631184, -2.253497, 1, 0.4784314, 0, 1,
-1.402664, 0.489722, -1.833579, 1, 0.4862745, 0, 1,
-1.380548, 1.247869, -2.826112, 1, 0.4901961, 0, 1,
-1.372401, 0.05889047, -2.991537, 1, 0.4980392, 0, 1,
-1.358767, 0.7676752, -2.144949, 1, 0.5058824, 0, 1,
-1.357902, 2.789905, -0.1737592, 1, 0.509804, 0, 1,
-1.3563, 0.437034, -0.3833012, 1, 0.5176471, 0, 1,
-1.350433, 0.4177937, -0.6041964, 1, 0.5215687, 0, 1,
-1.342159, 0.6659233, -0.8161649, 1, 0.5294118, 0, 1,
-1.337451, -2.223968, -2.27878, 1, 0.5333334, 0, 1,
-1.297129, -0.9361184, -3.247013, 1, 0.5411765, 0, 1,
-1.286873, 1.26574, -0.02232753, 1, 0.5450981, 0, 1,
-1.283969, 0.5887761, -0.2414636, 1, 0.5529412, 0, 1,
-1.282572, 0.2786953, -1.422699, 1, 0.5568628, 0, 1,
-1.268754, -1.693933, -2.2084, 1, 0.5647059, 0, 1,
-1.255777, -1.608506, -1.093787, 1, 0.5686275, 0, 1,
-1.251613, -0.5816957, -3.102178, 1, 0.5764706, 0, 1,
-1.241919, -1.015487, -2.466723, 1, 0.5803922, 0, 1,
-1.235113, 1.567566, -0.737915, 1, 0.5882353, 0, 1,
-1.229613, 0.8964376, -0.5182883, 1, 0.5921569, 0, 1,
-1.226194, -0.01245146, -1.08468, 1, 0.6, 0, 1,
-1.221809, 1.354638, 0.3562044, 1, 0.6078432, 0, 1,
-1.219972, -0.5716867, -3.628512, 1, 0.6117647, 0, 1,
-1.20686, -0.1689524, -2.667144, 1, 0.6196079, 0, 1,
-1.203154, 0.06017403, -0.6623495, 1, 0.6235294, 0, 1,
-1.202538, 1.225812, -2.845889, 1, 0.6313726, 0, 1,
-1.2005, -3.028129, -3.149447, 1, 0.6352941, 0, 1,
-1.197189, 0.2771947, 0.03867702, 1, 0.6431373, 0, 1,
-1.189358, 0.5121622, -0.1637447, 1, 0.6470588, 0, 1,
-1.187233, -0.7460846, -4.933465, 1, 0.654902, 0, 1,
-1.178567, 0.6905212, -2.194242, 1, 0.6588235, 0, 1,
-1.170919, 0.2470783, -1.256208, 1, 0.6666667, 0, 1,
-1.170039, -0.1444847, -2.145947, 1, 0.6705883, 0, 1,
-1.162389, 0.6794503, -2.824898, 1, 0.6784314, 0, 1,
-1.16153, -0.8091857, -2.206322, 1, 0.682353, 0, 1,
-1.161015, 1.980943, -1.377924, 1, 0.6901961, 0, 1,
-1.155616, 0.2309163, -2.255513, 1, 0.6941177, 0, 1,
-1.154804, -0.2918468, -2.22106, 1, 0.7019608, 0, 1,
-1.144567, -0.3816657, -3.271409, 1, 0.7098039, 0, 1,
-1.140551, 0.1337239, 0.8755184, 1, 0.7137255, 0, 1,
-1.135251, -0.7815083, -1.435259, 1, 0.7215686, 0, 1,
-1.13207, 1.22453, -1.339847, 1, 0.7254902, 0, 1,
-1.131554, 0.7744241, 0.06897741, 1, 0.7333333, 0, 1,
-1.12752, 0.2241964, -1.990498, 1, 0.7372549, 0, 1,
-1.122524, 1.965476, 0.6216229, 1, 0.7450981, 0, 1,
-1.108976, 1.198695, -0.1072666, 1, 0.7490196, 0, 1,
-1.103384, -0.3168446, -2.289022, 1, 0.7568628, 0, 1,
-1.095816, 0.1158543, -2.495776, 1, 0.7607843, 0, 1,
-1.095775, -0.4614009, -2.580416, 1, 0.7686275, 0, 1,
-1.095258, 2.169923, 0.5822773, 1, 0.772549, 0, 1,
-1.091999, -1.640283, -3.471206, 1, 0.7803922, 0, 1,
-1.077865, 1.5894, -0.1879351, 1, 0.7843137, 0, 1,
-1.066387, 0.4450615, -0.9804919, 1, 0.7921569, 0, 1,
-1.053838, -0.4860448, -3.554613, 1, 0.7960784, 0, 1,
-1.053363, 0.7666667, -1.686327, 1, 0.8039216, 0, 1,
-1.043929, -0.2980626, -0.6774863, 1, 0.8117647, 0, 1,
-1.041293, 1.424804, -1.620943, 1, 0.8156863, 0, 1,
-1.03468, 1.355737, -1.776726, 1, 0.8235294, 0, 1,
-1.030336, 0.2220386, -1.608597, 1, 0.827451, 0, 1,
-1.022807, 0.4831971, -1.192981, 1, 0.8352941, 0, 1,
-1.018066, 0.7645211, -1.569194, 1, 0.8392157, 0, 1,
-1.017674, -0.729331, -3.215443, 1, 0.8470588, 0, 1,
-1.015998, -0.6429574, -3.609497, 1, 0.8509804, 0, 1,
-1.015293, 1.138529, 0.2412183, 1, 0.8588235, 0, 1,
-1.014758, -0.149767, -2.657438, 1, 0.8627451, 0, 1,
-1.013757, 0.09919446, -1.05515, 1, 0.8705882, 0, 1,
-1.011603, -1.489915, -2.840862, 1, 0.8745098, 0, 1,
-1.01041, 0.05118059, -1.542177, 1, 0.8823529, 0, 1,
-1.008008, -1.236016, -3.387218, 1, 0.8862745, 0, 1,
-0.9995702, -1.170687, -3.23189, 1, 0.8941177, 0, 1,
-0.9987119, -1.151384, -1.518243, 1, 0.8980392, 0, 1,
-0.9874162, 0.5575858, -0.6945344, 1, 0.9058824, 0, 1,
-0.9820614, -0.3821323, -1.095758, 1, 0.9137255, 0, 1,
-0.977055, 0.7669124, 0.6379458, 1, 0.9176471, 0, 1,
-0.9679922, -0.8843372, -2.217834, 1, 0.9254902, 0, 1,
-0.9635571, -0.6452693, -3.76932, 1, 0.9294118, 0, 1,
-0.959536, 0.41584, -1.29814, 1, 0.9372549, 0, 1,
-0.9591967, 1.8659, 0.2138506, 1, 0.9411765, 0, 1,
-0.958282, 0.6344856, -2.38377, 1, 0.9490196, 0, 1,
-0.9526458, -0.09005757, -1.309489, 1, 0.9529412, 0, 1,
-0.9479589, -1.592932, -2.270486, 1, 0.9607843, 0, 1,
-0.9470725, -1.906088, -1.117445, 1, 0.9647059, 0, 1,
-0.937267, 2.274516, -0.5162337, 1, 0.972549, 0, 1,
-0.932009, -1.012826, -3.050564, 1, 0.9764706, 0, 1,
-0.9317118, -0.1705032, 0.3396894, 1, 0.9843137, 0, 1,
-0.9303941, 0.7893412, -1.039391, 1, 0.9882353, 0, 1,
-0.9292294, -0.636549, -3.207898, 1, 0.9960784, 0, 1,
-0.9279104, -1.301812, -2.552527, 0.9960784, 1, 0, 1,
-0.9245427, 2.143461, 1.603501, 0.9921569, 1, 0, 1,
-0.9176081, 0.7068388, -2.629285, 0.9843137, 1, 0, 1,
-0.9163266, 1.33418, -0.3489877, 0.9803922, 1, 0, 1,
-0.9160316, 0.3036855, -1.238676, 0.972549, 1, 0, 1,
-0.9136054, 0.09365498, -3.404791, 0.9686275, 1, 0, 1,
-0.9112247, -0.2191382, -2.005207, 0.9607843, 1, 0, 1,
-0.9082744, 0.9030628, -1.233734, 0.9568627, 1, 0, 1,
-0.9024628, 0.3041233, 0.5875682, 0.9490196, 1, 0, 1,
-0.900602, -1.48581, -3.253318, 0.945098, 1, 0, 1,
-0.8999678, 1.783492, -0.3307254, 0.9372549, 1, 0, 1,
-0.8999211, 1.880304, -0.4202473, 0.9333333, 1, 0, 1,
-0.8975832, -0.1600215, -1.199515, 0.9254902, 1, 0, 1,
-0.8966136, 1.017654, -0.9346672, 0.9215686, 1, 0, 1,
-0.8927884, -1.308319, -4.234463, 0.9137255, 1, 0, 1,
-0.8910636, -1.330934, -1.532351, 0.9098039, 1, 0, 1,
-0.8910052, 0.7699344, 0.07045943, 0.9019608, 1, 0, 1,
-0.8868195, 1.242912, 0.5398756, 0.8941177, 1, 0, 1,
-0.8804235, 0.1322333, -1.571676, 0.8901961, 1, 0, 1,
-0.8754199, 0.1589747, -3.676481, 0.8823529, 1, 0, 1,
-0.8746964, -0.2795033, -1.243839, 0.8784314, 1, 0, 1,
-0.8634863, 1.063722, -1.323201, 0.8705882, 1, 0, 1,
-0.8629611, -1.494901, -2.348182, 0.8666667, 1, 0, 1,
-0.8617204, -0.2909035, -0.4742828, 0.8588235, 1, 0, 1,
-0.8491461, -0.6008654, -3.551349, 0.854902, 1, 0, 1,
-0.8320934, -0.9543692, -3.266114, 0.8470588, 1, 0, 1,
-0.8269622, 0.1739475, -3.132982, 0.8431373, 1, 0, 1,
-0.8192595, -0.1612433, -1.250199, 0.8352941, 1, 0, 1,
-0.8092324, 1.203247, 0.4639862, 0.8313726, 1, 0, 1,
-0.8075163, -0.3545839, -1.022716, 0.8235294, 1, 0, 1,
-0.8065782, 0.7899633, -0.7619932, 0.8196079, 1, 0, 1,
-0.8061744, 0.3430914, -0.4986673, 0.8117647, 1, 0, 1,
-0.7991773, -0.4016697, -1.442322, 0.8078431, 1, 0, 1,
-0.7940639, -0.5228539, -2.05951, 0.8, 1, 0, 1,
-0.7833441, -0.1755833, -0.6145018, 0.7921569, 1, 0, 1,
-0.7704711, 1.224187, -1.245472, 0.7882353, 1, 0, 1,
-0.7674296, -0.8333217, -3.899664, 0.7803922, 1, 0, 1,
-0.7660254, 1.350237, 1.282874, 0.7764706, 1, 0, 1,
-0.760004, 1.000253, 0.7224218, 0.7686275, 1, 0, 1,
-0.7475678, -0.5490108, -0.5820463, 0.7647059, 1, 0, 1,
-0.7471033, 1.038845, 0.6482737, 0.7568628, 1, 0, 1,
-0.7417856, -1.417585, -3.385673, 0.7529412, 1, 0, 1,
-0.7380118, -1.089074, -2.037194, 0.7450981, 1, 0, 1,
-0.7317897, 0.5987016, -0.6193885, 0.7411765, 1, 0, 1,
-0.729996, -0.2345364, -2.202373, 0.7333333, 1, 0, 1,
-0.725417, 1.187748, -0.03468683, 0.7294118, 1, 0, 1,
-0.7232832, 0.7999291, -2.355698, 0.7215686, 1, 0, 1,
-0.7225281, -0.01145177, -1.23942, 0.7176471, 1, 0, 1,
-0.721174, -1.154527, -0.4415283, 0.7098039, 1, 0, 1,
-0.7197461, 0.8287452, 1.492983, 0.7058824, 1, 0, 1,
-0.7113307, -0.07085844, -1.386357, 0.6980392, 1, 0, 1,
-0.70872, -0.007460755, -1.840894, 0.6901961, 1, 0, 1,
-0.7084836, 1.212283, 1.824098, 0.6862745, 1, 0, 1,
-0.7024114, 0.8110572, -2.076031, 0.6784314, 1, 0, 1,
-0.7020044, 0.5882856, -1.197709, 0.6745098, 1, 0, 1,
-0.6994385, -0.2068203, -1.017445, 0.6666667, 1, 0, 1,
-0.6980485, 0.6536139, -0.9465124, 0.6627451, 1, 0, 1,
-0.695147, -1.017357, -0.9704013, 0.654902, 1, 0, 1,
-0.6877292, 0.2939916, -2.537494, 0.6509804, 1, 0, 1,
-0.6864097, -0.008237422, -0.02566102, 0.6431373, 1, 0, 1,
-0.6809258, -1.054417, -3.220765, 0.6392157, 1, 0, 1,
-0.6707358, -2.253818, -2.889014, 0.6313726, 1, 0, 1,
-0.6686276, -1.476484, -2.008296, 0.627451, 1, 0, 1,
-0.6685382, -0.8932478, -1.999255, 0.6196079, 1, 0, 1,
-0.6668551, -1.665787, -1.396477, 0.6156863, 1, 0, 1,
-0.6647254, -0.1635641, -1.910248, 0.6078432, 1, 0, 1,
-0.6642518, -0.8188689, -1.09425, 0.6039216, 1, 0, 1,
-0.6553189, -1.29162, -2.909595, 0.5960785, 1, 0, 1,
-0.6552646, -0.4021681, -2.474066, 0.5882353, 1, 0, 1,
-0.6541589, -1.517749, -2.999086, 0.5843138, 1, 0, 1,
-0.6514943, -0.8622715, -3.201725, 0.5764706, 1, 0, 1,
-0.6471176, -0.6388287, 0.1393538, 0.572549, 1, 0, 1,
-0.6443853, -1.013008, -2.046637, 0.5647059, 1, 0, 1,
-0.6440657, -0.5426525, -3.070432, 0.5607843, 1, 0, 1,
-0.6401621, -1.94413, -3.219914, 0.5529412, 1, 0, 1,
-0.6383892, 1.147287, -0.3641771, 0.5490196, 1, 0, 1,
-0.6361791, 0.5894628, -0.1035117, 0.5411765, 1, 0, 1,
-0.6313389, 0.2545246, -2.232003, 0.5372549, 1, 0, 1,
-0.6274099, 0.1842408, -3.46508, 0.5294118, 1, 0, 1,
-0.6273733, 0.2082919, 0.2444839, 0.5254902, 1, 0, 1,
-0.6252445, -0.5736256, -0.7700332, 0.5176471, 1, 0, 1,
-0.6212441, -0.7377284, -3.207954, 0.5137255, 1, 0, 1,
-0.6182883, -0.9757523, -2.326568, 0.5058824, 1, 0, 1,
-0.6177705, 1.165392, -0.6715698, 0.5019608, 1, 0, 1,
-0.6104746, 0.6555918, 0.2402387, 0.4941176, 1, 0, 1,
-0.6092452, -0.2860513, -1.526788, 0.4862745, 1, 0, 1,
-0.6086953, 1.702641, 0.3352627, 0.4823529, 1, 0, 1,
-0.6059284, -0.2751363, 0.4255288, 0.4745098, 1, 0, 1,
-0.6013359, 2.058033, 0.3183284, 0.4705882, 1, 0, 1,
-0.599695, -1.59392, -3.652834, 0.4627451, 1, 0, 1,
-0.5975069, -0.2525523, -0.8917457, 0.4588235, 1, 0, 1,
-0.5963148, -1.188095, -2.69013, 0.4509804, 1, 0, 1,
-0.5943259, 0.5524928, -1.291355, 0.4470588, 1, 0, 1,
-0.5888273, 0.6327495, 0.5294957, 0.4392157, 1, 0, 1,
-0.5834696, 0.4152535, -1.151929, 0.4352941, 1, 0, 1,
-0.5756248, 1.071638, -1.836998, 0.427451, 1, 0, 1,
-0.5697864, -0.7065758, -2.206969, 0.4235294, 1, 0, 1,
-0.5673522, 0.9407977, -0.624903, 0.4156863, 1, 0, 1,
-0.5664344, 1.583035, 0.6165933, 0.4117647, 1, 0, 1,
-0.5635231, 0.08010115, -0.7049718, 0.4039216, 1, 0, 1,
-0.5613267, 0.9804441, -0.6296848, 0.3960784, 1, 0, 1,
-0.5545651, -0.3160219, -2.463883, 0.3921569, 1, 0, 1,
-0.5509138, 1.397193, -0.3239188, 0.3843137, 1, 0, 1,
-0.548107, -0.3106888, -1.892633, 0.3803922, 1, 0, 1,
-0.5480955, 1.034197, -2.83354, 0.372549, 1, 0, 1,
-0.5442138, -0.2726535, -4.322744, 0.3686275, 1, 0, 1,
-0.5374482, -0.8807408, -3.729033, 0.3607843, 1, 0, 1,
-0.5263968, 0.4366547, -2.33722, 0.3568628, 1, 0, 1,
-0.524093, 0.7702518, 0.1391575, 0.3490196, 1, 0, 1,
-0.5236458, 1.092197, -1.885557, 0.345098, 1, 0, 1,
-0.5224651, -3.361536, -2.677482, 0.3372549, 1, 0, 1,
-0.5215552, -0.7334046, -2.753118, 0.3333333, 1, 0, 1,
-0.5193632, -1.440686, -3.871235, 0.3254902, 1, 0, 1,
-0.5130064, 0.9926851, -0.7527426, 0.3215686, 1, 0, 1,
-0.5106599, -0.07840845, -1.965193, 0.3137255, 1, 0, 1,
-0.5091514, -0.2633847, -3.111641, 0.3098039, 1, 0, 1,
-0.5087635, -0.5034658, -4.240084, 0.3019608, 1, 0, 1,
-0.503879, -0.2242913, -1.449876, 0.2941177, 1, 0, 1,
-0.5036029, 1.452797, 1.863579, 0.2901961, 1, 0, 1,
-0.4993474, 1.479857, -0.01628589, 0.282353, 1, 0, 1,
-0.4991346, -0.2954797, -0.90866, 0.2784314, 1, 0, 1,
-0.4989415, 2.106904, -0.2425541, 0.2705882, 1, 0, 1,
-0.4982407, 1.080123, -0.3293498, 0.2666667, 1, 0, 1,
-0.4916403, 0.1247005, -0.9544303, 0.2588235, 1, 0, 1,
-0.4867348, 0.6716009, -1.005622, 0.254902, 1, 0, 1,
-0.4842626, -0.7007875, -1.996912, 0.2470588, 1, 0, 1,
-0.4802535, -0.8594143, -1.941342, 0.2431373, 1, 0, 1,
-0.4779861, 0.2764391, -1.910457, 0.2352941, 1, 0, 1,
-0.4712428, 1.427545, -0.5113977, 0.2313726, 1, 0, 1,
-0.4712222, 1.05877, 0.7655066, 0.2235294, 1, 0, 1,
-0.4618107, -1.02417, -4.193047, 0.2196078, 1, 0, 1,
-0.4570473, 1.226456, -0.6806386, 0.2117647, 1, 0, 1,
-0.4532904, -1.592598, -3.043382, 0.2078431, 1, 0, 1,
-0.4526401, -0.1747508, -0.8714833, 0.2, 1, 0, 1,
-0.4447606, -0.1268325, -1.603432, 0.1921569, 1, 0, 1,
-0.4428546, 0.4076533, 2.509576, 0.1882353, 1, 0, 1,
-0.439967, -0.3763316, -2.36541, 0.1803922, 1, 0, 1,
-0.439287, -1.667388, -1.769683, 0.1764706, 1, 0, 1,
-0.4379719, 0.9245068, 0.1081154, 0.1686275, 1, 0, 1,
-0.4320453, -0.169249, -1.698481, 0.1647059, 1, 0, 1,
-0.428241, 1.674968, -0.7316263, 0.1568628, 1, 0, 1,
-0.4268303, 0.5911753, -1.152463, 0.1529412, 1, 0, 1,
-0.4247817, 0.7649978, -1.605475, 0.145098, 1, 0, 1,
-0.4216948, -0.964274, -2.032185, 0.1411765, 1, 0, 1,
-0.4193093, 0.1380337, 0.5613693, 0.1333333, 1, 0, 1,
-0.4187873, 0.2425387, 0.1208417, 0.1294118, 1, 0, 1,
-0.417893, -0.7943096, -1.947673, 0.1215686, 1, 0, 1,
-0.414807, 0.125412, -1.625407, 0.1176471, 1, 0, 1,
-0.4069733, -0.3270945, -2.680442, 0.1098039, 1, 0, 1,
-0.4010963, -0.02132969, -1.72972, 0.1058824, 1, 0, 1,
-0.3919341, 0.25977, -1.639552, 0.09803922, 1, 0, 1,
-0.391808, -0.326, -1.425138, 0.09019608, 1, 0, 1,
-0.3893864, -1.084814, -1.945861, 0.08627451, 1, 0, 1,
-0.3889453, 0.1002088, -0.8221158, 0.07843138, 1, 0, 1,
-0.3854196, 0.03595019, -0.03892884, 0.07450981, 1, 0, 1,
-0.3851747, -0.7517816, -3.655898, 0.06666667, 1, 0, 1,
-0.3838931, -1.023319, -4.404598, 0.0627451, 1, 0, 1,
-0.3802142, -1.257094, -3.132016, 0.05490196, 1, 0, 1,
-0.3799438, -0.6546464, -2.668502, 0.05098039, 1, 0, 1,
-0.3778292, 0.03567624, -1.490511, 0.04313726, 1, 0, 1,
-0.3715991, -2.136511, -2.947899, 0.03921569, 1, 0, 1,
-0.3708941, -1.383675, -3.007638, 0.03137255, 1, 0, 1,
-0.3663503, 1.811553, 0.5046647, 0.02745098, 1, 0, 1,
-0.3569575, -0.5639213, -3.411511, 0.01960784, 1, 0, 1,
-0.3565786, -0.3397367, -1.289938, 0.01568628, 1, 0, 1,
-0.3525623, -0.4154238, -1.822619, 0.007843138, 1, 0, 1,
-0.3505819, 1.331023, -0.06193861, 0.003921569, 1, 0, 1,
-0.3498281, 0.2969433, -1.924703, 0, 1, 0.003921569, 1,
-0.3496318, 0.9883309, -1.414936, 0, 1, 0.01176471, 1,
-0.3484537, -0.1786746, -2.693021, 0, 1, 0.01568628, 1,
-0.3476789, 0.5605648, 0.4306222, 0, 1, 0.02352941, 1,
-0.3456717, 0.6285669, -0.6120457, 0, 1, 0.02745098, 1,
-0.3455604, 0.4256274, -0.3406572, 0, 1, 0.03529412, 1,
-0.3433114, 0.469778, -2.452884, 0, 1, 0.03921569, 1,
-0.3414885, 0.8157104, -1.639181, 0, 1, 0.04705882, 1,
-0.3400457, 0.05435735, -1.549622, 0, 1, 0.05098039, 1,
-0.3264352, -0.6212932, -2.110092, 0, 1, 0.05882353, 1,
-0.3263054, -0.8576008, -4.916663, 0, 1, 0.0627451, 1,
-0.3205533, 0.950044, 1.629447, 0, 1, 0.07058824, 1,
-0.3121499, 0.8712334, -2.37979, 0, 1, 0.07450981, 1,
-0.3087555, -0.8596616, -2.546973, 0, 1, 0.08235294, 1,
-0.3086718, 0.06199393, 0.1413239, 0, 1, 0.08627451, 1,
-0.3065839, -2.287799, -2.824756, 0, 1, 0.09411765, 1,
-0.3056075, -0.2676952, -3.183073, 0, 1, 0.1019608, 1,
-0.3038722, -0.4589482, -4.265463, 0, 1, 0.1058824, 1,
-0.3008101, 0.1519341, -1.928966, 0, 1, 0.1137255, 1,
-0.2997647, -0.927259, -2.937127, 0, 1, 0.1176471, 1,
-0.2987787, 0.7644623, 1.317383, 0, 1, 0.1254902, 1,
-0.2962983, -0.1251576, 0.1515986, 0, 1, 0.1294118, 1,
-0.2930988, -0.8422962, -2.746256, 0, 1, 0.1372549, 1,
-0.2827913, -0.2571862, -1.153322, 0, 1, 0.1411765, 1,
-0.2824552, -1.202758, -3.076997, 0, 1, 0.1490196, 1,
-0.2763698, -1.92626, -1.479554, 0, 1, 0.1529412, 1,
-0.275925, 1.136296, 0.9437907, 0, 1, 0.1607843, 1,
-0.2714912, 0.08675994, -2.643839, 0, 1, 0.1647059, 1,
-0.2668517, 0.08171494, -0.7732396, 0, 1, 0.172549, 1,
-0.2662919, -1.354676, -2.833677, 0, 1, 0.1764706, 1,
-0.2643547, -1.616868, -3.833813, 0, 1, 0.1843137, 1,
-0.249198, -0.3220766, -3.616177, 0, 1, 0.1882353, 1,
-0.2479666, -0.2878706, -2.794305, 0, 1, 0.1960784, 1,
-0.2423782, -0.3548615, -1.591662, 0, 1, 0.2039216, 1,
-0.2423325, -1.195743, -0.7285914, 0, 1, 0.2078431, 1,
-0.237189, -1.406986, -3.494478, 0, 1, 0.2156863, 1,
-0.2286882, -0.1013048, -1.28475, 0, 1, 0.2196078, 1,
-0.2223408, 0.1829847, 0.1737648, 0, 1, 0.227451, 1,
-0.2217141, -0.1765693, -0.7375386, 0, 1, 0.2313726, 1,
-0.2195602, 0.2892455, -0.9565436, 0, 1, 0.2392157, 1,
-0.2190328, -0.0275523, -1.6521, 0, 1, 0.2431373, 1,
-0.2162945, -0.545545, -2.747357, 0, 1, 0.2509804, 1,
-0.2119115, 0.6796445, -0.8450679, 0, 1, 0.254902, 1,
-0.209635, 0.5423513, 0.8050629, 0, 1, 0.2627451, 1,
-0.2078707, -0.5459855, -1.78231, 0, 1, 0.2666667, 1,
-0.2065325, 0.7423699, 0.2730393, 0, 1, 0.2745098, 1,
-0.2062382, -1.297961, -3.834568, 0, 1, 0.2784314, 1,
-0.2041999, 0.2808509, -1.522267, 0, 1, 0.2862745, 1,
-0.1985402, -1.146739, -4.242686, 0, 1, 0.2901961, 1,
-0.1957016, 2.037704, 0.3594887, 0, 1, 0.2980392, 1,
-0.183314, 0.5998857, -0.2979619, 0, 1, 0.3058824, 1,
-0.1812456, -0.3810685, -3.039313, 0, 1, 0.3098039, 1,
-0.1794343, 0.9103329, 0.9064664, 0, 1, 0.3176471, 1,
-0.1786258, -0.5733327, -2.215221, 0, 1, 0.3215686, 1,
-0.1784944, -0.6737361, -1.692315, 0, 1, 0.3294118, 1,
-0.1782553, 0.5025286, -0.2913075, 0, 1, 0.3333333, 1,
-0.1703646, -1.303477, -2.785874, 0, 1, 0.3411765, 1,
-0.1701673, -0.6268314, -3.724489, 0, 1, 0.345098, 1,
-0.1700839, -1.021674, -1.542123, 0, 1, 0.3529412, 1,
-0.1698659, 0.2391381, 0.8941687, 0, 1, 0.3568628, 1,
-0.1679542, 0.2408232, -2.681084, 0, 1, 0.3647059, 1,
-0.1643747, 0.334726, -0.256813, 0, 1, 0.3686275, 1,
-0.157398, 0.4854327, 0.3254833, 0, 1, 0.3764706, 1,
-0.1569948, 0.951938, -1.495965, 0, 1, 0.3803922, 1,
-0.156805, -0.5530527, -4.151035, 0, 1, 0.3882353, 1,
-0.1539299, -0.09836005, -1.076104, 0, 1, 0.3921569, 1,
-0.1529836, 0.007297421, -1.375795, 0, 1, 0.4, 1,
-0.1520325, -0.7530532, -1.908784, 0, 1, 0.4078431, 1,
-0.1519637, -0.9555376, -4.347846, 0, 1, 0.4117647, 1,
-0.1506853, 0.1552389, -1.75557, 0, 1, 0.4196078, 1,
-0.1504092, -0.770597, -5.029261, 0, 1, 0.4235294, 1,
-0.1449485, -0.9776044, -4.275546, 0, 1, 0.4313726, 1,
-0.1427712, -1.793925, -2.253432, 0, 1, 0.4352941, 1,
-0.1408783, -0.1863179, -1.766425, 0, 1, 0.4431373, 1,
-0.1386777, 0.04775249, -1.46688, 0, 1, 0.4470588, 1,
-0.1332546, -0.01869862, -1.092387, 0, 1, 0.454902, 1,
-0.1285566, -0.4151557, -1.461866, 0, 1, 0.4588235, 1,
-0.1260588, -1.227899, -2.473552, 0, 1, 0.4666667, 1,
-0.1235411, -1.068633, -2.444035, 0, 1, 0.4705882, 1,
-0.1232504, 0.4758441, 1.338328, 0, 1, 0.4784314, 1,
-0.1231512, -0.5367846, -0.8699747, 0, 1, 0.4823529, 1,
-0.1216172, -0.9854097, -1.880236, 0, 1, 0.4901961, 1,
-0.1210986, -0.09724077, -2.286453, 0, 1, 0.4941176, 1,
-0.1154083, -1.557757, -2.469054, 0, 1, 0.5019608, 1,
-0.1123557, 0.0204139, -3.04913, 0, 1, 0.509804, 1,
-0.1115361, 0.6792616, -1.30734, 0, 1, 0.5137255, 1,
-0.1114451, -0.938405, -1.71207, 0, 1, 0.5215687, 1,
-0.1102606, 0.2746301, -0.4008515, 0, 1, 0.5254902, 1,
-0.1082259, -1.967177, -2.790387, 0, 1, 0.5333334, 1,
-0.1041035, 0.7863157, 1.627377, 0, 1, 0.5372549, 1,
-0.1017459, 0.8589863, -0.294818, 0, 1, 0.5450981, 1,
-0.0888853, -0.5685933, -3.498503, 0, 1, 0.5490196, 1,
-0.08468948, 1.396446, 0.3188987, 0, 1, 0.5568628, 1,
-0.08333971, 0.0506571, -0.4005186, 0, 1, 0.5607843, 1,
-0.07554, 0.5931683, -0.03832293, 0, 1, 0.5686275, 1,
-0.07272374, 0.7779317, -0.2633603, 0, 1, 0.572549, 1,
-0.06967448, -1.134564, -1.490433, 0, 1, 0.5803922, 1,
-0.06850085, 0.6470872, 0.03963602, 0, 1, 0.5843138, 1,
-0.06615112, 0.6171049, -0.1817642, 0, 1, 0.5921569, 1,
-0.06408641, -1.597361, -5.001829, 0, 1, 0.5960785, 1,
-0.06215635, -0.3774292, -1.374908, 0, 1, 0.6039216, 1,
-0.06215433, -0.1323987, -3.80196, 0, 1, 0.6117647, 1,
-0.0618325, -0.0316976, -1.502862, 0, 1, 0.6156863, 1,
-0.05620609, -0.4252977, -4.851257, 0, 1, 0.6235294, 1,
-0.05275546, 1.013068, 0.8290762, 0, 1, 0.627451, 1,
-0.05093691, -1.616872, -3.083834, 0, 1, 0.6352941, 1,
-0.04518542, 1.512542, -0.7716423, 0, 1, 0.6392157, 1,
-0.03929903, -0.9771548, -2.101595, 0, 1, 0.6470588, 1,
-0.0391739, 0.1180257, -0.8460912, 0, 1, 0.6509804, 1,
-0.03614332, 0.2273532, 2.034839, 0, 1, 0.6588235, 1,
-0.03420271, 0.2766988, 0.07883878, 0, 1, 0.6627451, 1,
-0.03397109, -1.922002, -3.726489, 0, 1, 0.6705883, 1,
-0.02773141, -0.6508219, -3.330362, 0, 1, 0.6745098, 1,
-0.02716215, -1.537612, -3.140487, 0, 1, 0.682353, 1,
-0.02529069, 0.5774731, 0.01618219, 0, 1, 0.6862745, 1,
-0.02468574, 0.3865398, -0.5376393, 0, 1, 0.6941177, 1,
-0.02401794, 0.8113328, 0.7500912, 0, 1, 0.7019608, 1,
-0.02361726, -0.4474407, -5.143285, 0, 1, 0.7058824, 1,
-0.02327834, 0.8087642, 0.3979868, 0, 1, 0.7137255, 1,
-0.01699424, 0.5909429, -1.614484, 0, 1, 0.7176471, 1,
-0.01650429, 0.7041305, -1.920278, 0, 1, 0.7254902, 1,
-0.0127187, -1.135498, -3.449037, 0, 1, 0.7294118, 1,
-0.01200453, 0.02032349, -0.6199001, 0, 1, 0.7372549, 1,
-0.009928892, -0.1176028, -3.412467, 0, 1, 0.7411765, 1,
-0.009552055, -1.872147, -2.052264, 0, 1, 0.7490196, 1,
-0.008997502, -0.8463162, -2.806979, 0, 1, 0.7529412, 1,
-0.008458884, -0.8201138, -4.085792, 0, 1, 0.7607843, 1,
-0.008343399, -1.671517, -3.114425, 0, 1, 0.7647059, 1,
0.0009110488, 1.775429, -2.646123, 0, 1, 0.772549, 1,
0.002700047, 0.3083354, -0.8078782, 0, 1, 0.7764706, 1,
0.006099361, 2.244518, 0.4676103, 0, 1, 0.7843137, 1,
0.008295289, 0.8661268, -0.7135676, 0, 1, 0.7882353, 1,
0.01623315, -1.951454, 4.343905, 0, 1, 0.7960784, 1,
0.01678047, -0.2510031, 2.70381, 0, 1, 0.8039216, 1,
0.01881662, 0.5638967, -2.167333, 0, 1, 0.8078431, 1,
0.01922478, -1.239663, 4.536552, 0, 1, 0.8156863, 1,
0.02036067, -0.4237891, 2.765265, 0, 1, 0.8196079, 1,
0.02085879, -0.3769254, 2.672782, 0, 1, 0.827451, 1,
0.03067458, -0.8592523, 3.362242, 0, 1, 0.8313726, 1,
0.03091442, -0.4841909, 1.465276, 0, 1, 0.8392157, 1,
0.0343891, -2.593458, 2.915109, 0, 1, 0.8431373, 1,
0.03866353, 1.29283, 1.099097, 0, 1, 0.8509804, 1,
0.04459395, 1.499626, 1.689179, 0, 1, 0.854902, 1,
0.04508209, -0.2483922, 4.000859, 0, 1, 0.8627451, 1,
0.04802007, -0.3570697, 1.19915, 0, 1, 0.8666667, 1,
0.04973621, -0.3768726, 2.770674, 0, 1, 0.8745098, 1,
0.05037968, 0.6309595, -1.380204, 0, 1, 0.8784314, 1,
0.05197507, 0.4765838, 0.2231693, 0, 1, 0.8862745, 1,
0.05274151, 0.1424904, 0.08111787, 0, 1, 0.8901961, 1,
0.05659576, -0.4859928, 4.398649, 0, 1, 0.8980392, 1,
0.05938444, -0.9165964, 2.221666, 0, 1, 0.9058824, 1,
0.06375121, -0.02618859, 0.7860594, 0, 1, 0.9098039, 1,
0.06658, 2.20725, 0.5326157, 0, 1, 0.9176471, 1,
0.06690285, -0.37738, 3.763895, 0, 1, 0.9215686, 1,
0.07013021, 1.435959, 1.094498, 0, 1, 0.9294118, 1,
0.0733929, -0.3006031, 2.332911, 0, 1, 0.9333333, 1,
0.07380131, 0.2901146, -0.1847766, 0, 1, 0.9411765, 1,
0.07702339, -1.344564, 2.909586, 0, 1, 0.945098, 1,
0.08175235, 1.291721, -1.520504, 0, 1, 0.9529412, 1,
0.08488292, -0.4697582, 3.187855, 0, 1, 0.9568627, 1,
0.08745214, -1.140748, 4.33039, 0, 1, 0.9647059, 1,
0.08916108, 0.467013, 0.9599724, 0, 1, 0.9686275, 1,
0.09078468, 0.7845452, 0.1778492, 0, 1, 0.9764706, 1,
0.09138688, -0.9837926, 3.928739, 0, 1, 0.9803922, 1,
0.09382064, -0.4320397, 2.95265, 0, 1, 0.9882353, 1,
0.09391998, -1.01966, 2.772829, 0, 1, 0.9921569, 1,
0.09486606, -0.7689375, 2.624003, 0, 1, 1, 1,
0.1059426, -0.5186718, 4.077167, 0, 0.9921569, 1, 1,
0.1102761, 0.5767993, -1.124532, 0, 0.9882353, 1, 1,
0.1124559, 0.7369682, 0.8696514, 0, 0.9803922, 1, 1,
0.1136878, 3.081033, -1.183983, 0, 0.9764706, 1, 1,
0.1155998, -0.1682215, 3.335686, 0, 0.9686275, 1, 1,
0.1198683, -1.565137, 4.047189, 0, 0.9647059, 1, 1,
0.120863, 0.4982848, 1.664303, 0, 0.9568627, 1, 1,
0.1222199, -0.1110312, 1.430134, 0, 0.9529412, 1, 1,
0.1263559, -1.873648, 2.002412, 0, 0.945098, 1, 1,
0.1268055, -0.4476287, 2.56522, 0, 0.9411765, 1, 1,
0.1299412, -0.03341358, 1.781072, 0, 0.9333333, 1, 1,
0.1338481, 1.633809, 0.4450874, 0, 0.9294118, 1, 1,
0.1384017, -0.3815778, 4.004132, 0, 0.9215686, 1, 1,
0.1391314, 0.119432, 1.410638, 0, 0.9176471, 1, 1,
0.1410721, 0.01057782, 0.3204523, 0, 0.9098039, 1, 1,
0.1431934, 0.0756517, 0.7346624, 0, 0.9058824, 1, 1,
0.1445955, -0.8025051, 2.068367, 0, 0.8980392, 1, 1,
0.1506494, -1.258124, 2.524498, 0, 0.8901961, 1, 1,
0.1540159, 0.6303722, -0.7889225, 0, 0.8862745, 1, 1,
0.1554163, -0.7580655, 5.809851, 0, 0.8784314, 1, 1,
0.156486, -0.5841444, 4.287913, 0, 0.8745098, 1, 1,
0.1569652, 0.8530275, -0.4859502, 0, 0.8666667, 1, 1,
0.1598432, 0.01362911, 2.317544, 0, 0.8627451, 1, 1,
0.1603053, 0.3626273, 1.050228, 0, 0.854902, 1, 1,
0.1626152, 0.6608971, 0.118997, 0, 0.8509804, 1, 1,
0.1670401, 0.3665104, 1.816938, 0, 0.8431373, 1, 1,
0.1681146, 0.8126656, -0.3301922, 0, 0.8392157, 1, 1,
0.1701346, 1.545016, 0.5348042, 0, 0.8313726, 1, 1,
0.1719775, 0.3094473, -0.8925577, 0, 0.827451, 1, 1,
0.1741201, 1.451586, -0.137783, 0, 0.8196079, 1, 1,
0.1761531, 1.685465, 1.332166, 0, 0.8156863, 1, 1,
0.1762839, 0.5137519, -0.8375279, 0, 0.8078431, 1, 1,
0.1778759, -0.8877773, 3.462999, 0, 0.8039216, 1, 1,
0.1794512, -1.380844, 2.294047, 0, 0.7960784, 1, 1,
0.1831772, 0.7295366, -0.009031489, 0, 0.7882353, 1, 1,
0.1872755, -2.030913, 2.226401, 0, 0.7843137, 1, 1,
0.195035, -1.72616, 2.157551, 0, 0.7764706, 1, 1,
0.1966666, -1.096936, 2.001643, 0, 0.772549, 1, 1,
0.1989173, -0.7477577, 1.18236, 0, 0.7647059, 1, 1,
0.2017107, 0.3859209, 0.08443796, 0, 0.7607843, 1, 1,
0.2058116, -0.9275556, 2.8786, 0, 0.7529412, 1, 1,
0.2104446, 0.3051993, 1.452386, 0, 0.7490196, 1, 1,
0.2158582, 1.431298, 0.7288299, 0, 0.7411765, 1, 1,
0.2267679, 0.6201257, 1.319611, 0, 0.7372549, 1, 1,
0.2282769, 0.6264222, -1.049095, 0, 0.7294118, 1, 1,
0.2283586, 0.8446368, 0.9273255, 0, 0.7254902, 1, 1,
0.2297472, 1.252643, -0.439496, 0, 0.7176471, 1, 1,
0.2333431, 0.5398853, -0.4977206, 0, 0.7137255, 1, 1,
0.2341262, 1.350975, -0.6709044, 0, 0.7058824, 1, 1,
0.2345816, -0.6544619, 2.314677, 0, 0.6980392, 1, 1,
0.2361771, -0.8557021, 4.814485, 0, 0.6941177, 1, 1,
0.2424208, -0.5972291, 2.949119, 0, 0.6862745, 1, 1,
0.2424814, -0.3982928, 2.330654, 0, 0.682353, 1, 1,
0.2460737, -0.5589083, 2.1638, 0, 0.6745098, 1, 1,
0.2472746, -1.153542, 3.312092, 0, 0.6705883, 1, 1,
0.248947, -0.5154903, 2.382983, 0, 0.6627451, 1, 1,
0.2553587, -0.1003183, 2.151308, 0, 0.6588235, 1, 1,
0.2568294, -1.350012, 2.773995, 0, 0.6509804, 1, 1,
0.2598599, 0.7102222, 1.344648, 0, 0.6470588, 1, 1,
0.2659995, -1.070462, 3.296281, 0, 0.6392157, 1, 1,
0.2666892, -0.3548147, 2.725278, 0, 0.6352941, 1, 1,
0.2707884, 0.7515624, -0.4563791, 0, 0.627451, 1, 1,
0.2722146, 0.07593504, 2.30819, 0, 0.6235294, 1, 1,
0.273963, 0.2729039, 0.3168716, 0, 0.6156863, 1, 1,
0.2753167, 0.6700355, -0.216246, 0, 0.6117647, 1, 1,
0.2792968, 0.2131678, -0.350113, 0, 0.6039216, 1, 1,
0.2836283, -1.195724, 3.119042, 0, 0.5960785, 1, 1,
0.2837428, -0.003010029, 0.01803872, 0, 0.5921569, 1, 1,
0.2859606, -1.783433, 2.508489, 0, 0.5843138, 1, 1,
0.2900915, 0.2092472, 1.470384, 0, 0.5803922, 1, 1,
0.2922347, 0.5621029, 2.166852, 0, 0.572549, 1, 1,
0.2923135, -0.3746033, 1.582033, 0, 0.5686275, 1, 1,
0.2940888, -0.5199546, 3.170332, 0, 0.5607843, 1, 1,
0.2973017, -0.5005595, 2.654471, 0, 0.5568628, 1, 1,
0.2975249, -0.9929754, 2.435107, 0, 0.5490196, 1, 1,
0.2981944, 1.126005, 0.8038596, 0, 0.5450981, 1, 1,
0.298685, 0.8931559, -0.1157273, 0, 0.5372549, 1, 1,
0.2992206, 1.582312, 1.155736, 0, 0.5333334, 1, 1,
0.2998297, 2.101794, -0.4944866, 0, 0.5254902, 1, 1,
0.3041222, 0.6818575, 0.4426755, 0, 0.5215687, 1, 1,
0.3041658, -0.622655, 1.859233, 0, 0.5137255, 1, 1,
0.3060429, 0.8530636, 0.4573894, 0, 0.509804, 1, 1,
0.3077538, -1.255011, 1.143449, 0, 0.5019608, 1, 1,
0.3086662, 1.514284, 0.898622, 0, 0.4941176, 1, 1,
0.3087432, -0.1149371, 1.610766, 0, 0.4901961, 1, 1,
0.311285, 0.2851844, 0.6802901, 0, 0.4823529, 1, 1,
0.3117291, 0.2808903, 1.672263, 0, 0.4784314, 1, 1,
0.3154776, -1.139132, 3.13333, 0, 0.4705882, 1, 1,
0.317983, -1.072279, 2.860571, 0, 0.4666667, 1, 1,
0.319762, -0.4374885, 1.865669, 0, 0.4588235, 1, 1,
0.320953, 0.5844714, 0.12773, 0, 0.454902, 1, 1,
0.3268691, -0.2811491, 0.9002759, 0, 0.4470588, 1, 1,
0.3269893, 0.4912949, 1.683414, 0, 0.4431373, 1, 1,
0.3302837, 0.1541906, 1.47794, 0, 0.4352941, 1, 1,
0.3366565, -0.4521798, 1.484888, 0, 0.4313726, 1, 1,
0.3370264, 0.1820614, 2.352039, 0, 0.4235294, 1, 1,
0.3378507, -1.069499, 3.183646, 0, 0.4196078, 1, 1,
0.3392682, 1.004138, 0.01404409, 0, 0.4117647, 1, 1,
0.3396181, 0.0848982, 2.071811, 0, 0.4078431, 1, 1,
0.3500584, 0.4523412, -0.2913757, 0, 0.4, 1, 1,
0.3522398, 0.5519236, 0.595357, 0, 0.3921569, 1, 1,
0.352268, -0.2957852, 3.63466, 0, 0.3882353, 1, 1,
0.3536704, 0.9830126, -0.4488245, 0, 0.3803922, 1, 1,
0.3540332, -1.313716, 4.436954, 0, 0.3764706, 1, 1,
0.3572074, 1.549991, 0.101971, 0, 0.3686275, 1, 1,
0.3589258, -0.5664095, 2.88921, 0, 0.3647059, 1, 1,
0.3630129, 0.1359787, 1.789196, 0, 0.3568628, 1, 1,
0.3655356, 1.052041, 0.2502255, 0, 0.3529412, 1, 1,
0.3669126, 0.6660953, 1.412399, 0, 0.345098, 1, 1,
0.3679653, 1.840981, -1.316389, 0, 0.3411765, 1, 1,
0.3708149, 1.717428, 0.4726594, 0, 0.3333333, 1, 1,
0.3713813, -2.275388, 1.647216, 0, 0.3294118, 1, 1,
0.3761359, 0.4175868, 0.5238596, 0, 0.3215686, 1, 1,
0.3767617, -1.467858, 2.937114, 0, 0.3176471, 1, 1,
0.3834149, -0.375862, 1.850164, 0, 0.3098039, 1, 1,
0.3840304, 1.046307, 2.149157, 0, 0.3058824, 1, 1,
0.3869349, 0.8077925, -1.152669, 0, 0.2980392, 1, 1,
0.3890664, -0.5695857, 2.408956, 0, 0.2901961, 1, 1,
0.3892222, -1.988051, 2.707103, 0, 0.2862745, 1, 1,
0.3914009, -0.1156244, 0.7791083, 0, 0.2784314, 1, 1,
0.3914808, 1.331249, -0.1370569, 0, 0.2745098, 1, 1,
0.3928225, -0.4748086, 4.897215, 0, 0.2666667, 1, 1,
0.3960739, -0.3617195, 3.751206, 0, 0.2627451, 1, 1,
0.396419, -1.646406, 3.391306, 0, 0.254902, 1, 1,
0.3972819, -1.745526, 4.173003, 0, 0.2509804, 1, 1,
0.3983473, 0.8182157, -0.7762045, 0, 0.2431373, 1, 1,
0.3991361, 0.5487064, 0.560684, 0, 0.2392157, 1, 1,
0.4012959, 0.09703148, 1.323738, 0, 0.2313726, 1, 1,
0.4013549, -1.127506, 3.496936, 0, 0.227451, 1, 1,
0.4021839, -1.047193, 2.933872, 0, 0.2196078, 1, 1,
0.4093751, 1.315628, 0.8355412, 0, 0.2156863, 1, 1,
0.4111018, -1.377221, 4.249004, 0, 0.2078431, 1, 1,
0.4250095, -0.6901817, 4.811172, 0, 0.2039216, 1, 1,
0.4255013, -0.9094592, 1.896678, 0, 0.1960784, 1, 1,
0.4268662, 0.2033301, 1.965135, 0, 0.1882353, 1, 1,
0.4307559, -1.231233, 3.625779, 0, 0.1843137, 1, 1,
0.4308178, -0.6572257, 2.789751, 0, 0.1764706, 1, 1,
0.4315924, -1.321604, 1.849971, 0, 0.172549, 1, 1,
0.4324772, 1.64727, 0.394033, 0, 0.1647059, 1, 1,
0.4350899, 0.4689533, 0.104117, 0, 0.1607843, 1, 1,
0.4373322, -0.632383, 1.318864, 0, 0.1529412, 1, 1,
0.4389776, 0.02621747, 1.069181, 0, 0.1490196, 1, 1,
0.4399501, 1.258788, 0.1645591, 0, 0.1411765, 1, 1,
0.4491583, 0.9697247, -0.2595124, 0, 0.1372549, 1, 1,
0.4520116, 0.09482269, 1.139303, 0, 0.1294118, 1, 1,
0.4542851, 1.138416, 1.384817, 0, 0.1254902, 1, 1,
0.4544892, -0.2769319, 2.026435, 0, 0.1176471, 1, 1,
0.4554157, -2.237813, 2.438377, 0, 0.1137255, 1, 1,
0.4570182, 0.2940756, -0.3526748, 0, 0.1058824, 1, 1,
0.4611552, 0.1872835, -0.2260717, 0, 0.09803922, 1, 1,
0.4692504, 2.46831, 0.9208375, 0, 0.09411765, 1, 1,
0.4702386, 1.436461, -0.003698926, 0, 0.08627451, 1, 1,
0.4709684, 1.324183, -0.2695539, 0, 0.08235294, 1, 1,
0.4736737, -1.522571, 1.634592, 0, 0.07450981, 1, 1,
0.4747395, -0.9136313, 2.783276, 0, 0.07058824, 1, 1,
0.4762253, -1.565875, 2.023473, 0, 0.0627451, 1, 1,
0.4772287, 0.0135664, 1.391093, 0, 0.05882353, 1, 1,
0.4821195, -0.6949557, 1.998638, 0, 0.05098039, 1, 1,
0.4833598, 0.5169321, -0.7585367, 0, 0.04705882, 1, 1,
0.4845248, 0.648125, -1.211264, 0, 0.03921569, 1, 1,
0.4859812, 1.404429, 1.196372, 0, 0.03529412, 1, 1,
0.4883513, 0.4968161, 0.3869219, 0, 0.02745098, 1, 1,
0.5022885, 1.768278, 0.3254308, 0, 0.02352941, 1, 1,
0.5036044, -0.6619721, 0.2234077, 0, 0.01568628, 1, 1,
0.5044173, -0.745235, 1.236917, 0, 0.01176471, 1, 1,
0.5054817, -1.864908, 3.858941, 0, 0.003921569, 1, 1,
0.506257, 1.046806, -0.7208949, 0.003921569, 0, 1, 1,
0.5076012, -0.31507, 2.792644, 0.007843138, 0, 1, 1,
0.5118811, 0.3415355, 2.252982, 0.01568628, 0, 1, 1,
0.5140186, -0.346999, 0.7477242, 0.01960784, 0, 1, 1,
0.5162577, -2.111146, 3.722548, 0.02745098, 0, 1, 1,
0.5174013, -1.907846, 2.321576, 0.03137255, 0, 1, 1,
0.5175182, -0.8464298, 4.434877, 0.03921569, 0, 1, 1,
0.5215738, -0.663492, 1.560819, 0.04313726, 0, 1, 1,
0.5218383, 0.84863, 0.3637232, 0.05098039, 0, 1, 1,
0.5222241, 1.591555, -0.6700118, 0.05490196, 0, 1, 1,
0.5237784, 0.1596669, 2.911403, 0.0627451, 0, 1, 1,
0.5239467, -0.1381008, 2.164102, 0.06666667, 0, 1, 1,
0.5275853, -0.6032335, 2.713934, 0.07450981, 0, 1, 1,
0.5282738, 0.6308017, 1.956374, 0.07843138, 0, 1, 1,
0.5283344, 0.8205618, -1.733985, 0.08627451, 0, 1, 1,
0.5295968, 0.2922128, 1.277454, 0.09019608, 0, 1, 1,
0.5332492, 0.1075085, 1.325506, 0.09803922, 0, 1, 1,
0.5359346, 1.048805, 1.807782, 0.1058824, 0, 1, 1,
0.5373375, -0.530364, 1.87731, 0.1098039, 0, 1, 1,
0.5377292, 3.12034, 0.02830233, 0.1176471, 0, 1, 1,
0.5450314, -2.102031, 3.949839, 0.1215686, 0, 1, 1,
0.547351, 0.3325505, -0.339509, 0.1294118, 0, 1, 1,
0.5506201, 0.6849009, 1.123971, 0.1333333, 0, 1, 1,
0.5515791, -1.082867, 3.613374, 0.1411765, 0, 1, 1,
0.5542573, -0.7646876, 3.769456, 0.145098, 0, 1, 1,
0.5550276, 0.2104958, 3.822546, 0.1529412, 0, 1, 1,
0.5555688, 0.4520148, -0.1602913, 0.1568628, 0, 1, 1,
0.5560085, 0.2799597, 0.2555675, 0.1647059, 0, 1, 1,
0.556208, -1.306813, 2.267751, 0.1686275, 0, 1, 1,
0.5592096, -0.1588864, 0.9851822, 0.1764706, 0, 1, 1,
0.5645278, 0.3046889, 1.179953, 0.1803922, 0, 1, 1,
0.5656171, 0.5305895, 0.5309178, 0.1882353, 0, 1, 1,
0.57027, 0.5216741, 0.5749006, 0.1921569, 0, 1, 1,
0.5703998, -0.06773376, 1.279429, 0.2, 0, 1, 1,
0.5735964, -1.349779, 2.398824, 0.2078431, 0, 1, 1,
0.5736163, -1.074025, 2.762113, 0.2117647, 0, 1, 1,
0.5749698, -0.8381693, 1.595855, 0.2196078, 0, 1, 1,
0.5754886, -0.1903914, 3.110738, 0.2235294, 0, 1, 1,
0.5759279, -0.9923501, 2.194687, 0.2313726, 0, 1, 1,
0.5793672, 0.1182668, 2.334382, 0.2352941, 0, 1, 1,
0.5821545, 0.346901, 1.902512, 0.2431373, 0, 1, 1,
0.5843659, 0.3448011, 1.267217, 0.2470588, 0, 1, 1,
0.5852981, 0.8159853, 1.600934, 0.254902, 0, 1, 1,
0.5890623, -0.9125023, 4.619392, 0.2588235, 0, 1, 1,
0.5963489, -0.7528379, 2.548763, 0.2666667, 0, 1, 1,
0.5976272, -3.061019, 3.414751, 0.2705882, 0, 1, 1,
0.6014356, -0.6602127, 1.827248, 0.2784314, 0, 1, 1,
0.6070241, 1.342706, -0.02810635, 0.282353, 0, 1, 1,
0.614581, 1.597466, 0.4523986, 0.2901961, 0, 1, 1,
0.6249893, -0.4445515, 2.441952, 0.2941177, 0, 1, 1,
0.6264296, -1.36484, 3.25956, 0.3019608, 0, 1, 1,
0.6269034, 1.375553, -0.4977497, 0.3098039, 0, 1, 1,
0.6275607, -0.4994662, -0.07561336, 0.3137255, 0, 1, 1,
0.6277781, 1.568327, 1.515757, 0.3215686, 0, 1, 1,
0.6279812, -1.082968, 3.877766, 0.3254902, 0, 1, 1,
0.628523, 1.274438, 0.876238, 0.3333333, 0, 1, 1,
0.6290681, 0.4736741, 1.591165, 0.3372549, 0, 1, 1,
0.6302288, -0.7459205, 0.6756819, 0.345098, 0, 1, 1,
0.6316252, -1.255616, 2.305751, 0.3490196, 0, 1, 1,
0.6342214, -0.8607498, 3.223705, 0.3568628, 0, 1, 1,
0.6366259, 1.267972, 0.8818435, 0.3607843, 0, 1, 1,
0.6431142, 1.025751, 0.4458447, 0.3686275, 0, 1, 1,
0.6486169, 1.440537, 1.691345, 0.372549, 0, 1, 1,
0.650027, 0.2053227, 2.542161, 0.3803922, 0, 1, 1,
0.6501753, -0.2580028, 3.071407, 0.3843137, 0, 1, 1,
0.6502155, 0.3619022, 1.251883, 0.3921569, 0, 1, 1,
0.6548522, 1.646009, -0.4922302, 0.3960784, 0, 1, 1,
0.6557778, -1.595647, 4.018966, 0.4039216, 0, 1, 1,
0.6667987, -0.6940707, 3.307119, 0.4117647, 0, 1, 1,
0.6670417, 0.5298637, 2.056869, 0.4156863, 0, 1, 1,
0.669827, -0.6357572, 2.222055, 0.4235294, 0, 1, 1,
0.6731389, 0.8257351, 0.8935827, 0.427451, 0, 1, 1,
0.673375, 1.729857, 2.3701, 0.4352941, 0, 1, 1,
0.6747961, -0.6501416, 2.121274, 0.4392157, 0, 1, 1,
0.6753456, -0.9049395, 3.948361, 0.4470588, 0, 1, 1,
0.6766936, -0.116881, 1.672485, 0.4509804, 0, 1, 1,
0.6862242, 0.1448222, 1.403512, 0.4588235, 0, 1, 1,
0.6889111, -2.037319, 2.439453, 0.4627451, 0, 1, 1,
0.6920559, -0.3941324, 3.537904, 0.4705882, 0, 1, 1,
0.6934688, -0.838984, 3.218781, 0.4745098, 0, 1, 1,
0.6961056, -0.2337815, 3.3978, 0.4823529, 0, 1, 1,
0.696823, -1.162966, 0.02276324, 0.4862745, 0, 1, 1,
0.6981679, -0.3586171, 2.81225, 0.4941176, 0, 1, 1,
0.7003283, -0.5433965, 1.810761, 0.5019608, 0, 1, 1,
0.7010837, -1.342018, 3.887081, 0.5058824, 0, 1, 1,
0.7026681, -0.02344266, 2.343323, 0.5137255, 0, 1, 1,
0.7111892, -0.3249381, 3.172127, 0.5176471, 0, 1, 1,
0.7124393, -0.6594263, 1.775463, 0.5254902, 0, 1, 1,
0.7127624, -0.4772831, 0.8723113, 0.5294118, 0, 1, 1,
0.7133338, -0.7029965, 2.074278, 0.5372549, 0, 1, 1,
0.7144772, -2.203559, 2.751192, 0.5411765, 0, 1, 1,
0.7160887, 1.11249, -1.437336, 0.5490196, 0, 1, 1,
0.7166752, -0.5842419, 2.57971, 0.5529412, 0, 1, 1,
0.7212284, 0.7664129, -0.2192156, 0.5607843, 0, 1, 1,
0.7226862, -1.487356, 2.149389, 0.5647059, 0, 1, 1,
0.7300008, -0.8627648, 3.495242, 0.572549, 0, 1, 1,
0.7348771, 0.07727954, 0.1948492, 0.5764706, 0, 1, 1,
0.7460731, 0.107455, 2.720223, 0.5843138, 0, 1, 1,
0.748201, -0.6151581, 2.082565, 0.5882353, 0, 1, 1,
0.7508584, 0.3684453, 0.6487679, 0.5960785, 0, 1, 1,
0.7510054, -0.05393055, 0.7395378, 0.6039216, 0, 1, 1,
0.7510526, 1.600618, 1.769226, 0.6078432, 0, 1, 1,
0.7538052, -0.7091544, 0.5563948, 0.6156863, 0, 1, 1,
0.7595173, -0.677665, 2.858335, 0.6196079, 0, 1, 1,
0.7715635, -0.2284311, 1.103574, 0.627451, 0, 1, 1,
0.7751179, 0.9815641, 1.147083, 0.6313726, 0, 1, 1,
0.7763414, 1.97252, 1.142282, 0.6392157, 0, 1, 1,
0.7905509, -0.2876662, 0.5942159, 0.6431373, 0, 1, 1,
0.7906198, 0.003108702, 1.475446, 0.6509804, 0, 1, 1,
0.792954, -0.1454067, 1.875267, 0.654902, 0, 1, 1,
0.7935291, -1.930873, 1.761054, 0.6627451, 0, 1, 1,
0.7954915, -0.480734, 1.652037, 0.6666667, 0, 1, 1,
0.7978564, -1.310214, 1.630132, 0.6745098, 0, 1, 1,
0.8000991, 0.973488, 0.02252479, 0.6784314, 0, 1, 1,
0.8122077, 1.387361, 2.077943, 0.6862745, 0, 1, 1,
0.8140867, 0.2229185, 2.977707, 0.6901961, 0, 1, 1,
0.8163574, 1.268285, 0.2717294, 0.6980392, 0, 1, 1,
0.8183126, 0.8719067, 0.7426941, 0.7058824, 0, 1, 1,
0.8267311, -0.5011702, 1.727827, 0.7098039, 0, 1, 1,
0.8282391, -0.8321162, 4.908175, 0.7176471, 0, 1, 1,
0.8289446, -0.1217296, 1.574385, 0.7215686, 0, 1, 1,
0.8364747, 0.1167319, -0.84594, 0.7294118, 0, 1, 1,
0.8412691, 0.9814362, 1.895882, 0.7333333, 0, 1, 1,
0.8431045, 0.2625087, 0.6861267, 0.7411765, 0, 1, 1,
0.8431184, -1.103453, 2.39476, 0.7450981, 0, 1, 1,
0.8441883, -0.2451172, 1.906939, 0.7529412, 0, 1, 1,
0.8451864, 1.513094, 0.8873774, 0.7568628, 0, 1, 1,
0.8525065, -2.210319, 3.802825, 0.7647059, 0, 1, 1,
0.8556217, -1.180154, 3.97236, 0.7686275, 0, 1, 1,
0.8558636, -0.9398462, 1.480419, 0.7764706, 0, 1, 1,
0.8600064, 1.560931, -0.4935769, 0.7803922, 0, 1, 1,
0.8646964, 0.7961653, -0.50413, 0.7882353, 0, 1, 1,
0.8708894, -0.93739, 2.040092, 0.7921569, 0, 1, 1,
0.8744757, -2.079104, 1.635037, 0.8, 0, 1, 1,
0.8785952, -1.458453, 1.740157, 0.8078431, 0, 1, 1,
0.8883773, -0.2263719, 0.2495882, 0.8117647, 0, 1, 1,
0.8899679, -0.4515479, 2.122544, 0.8196079, 0, 1, 1,
0.8906338, -1.101527, 3.699131, 0.8235294, 0, 1, 1,
0.89132, -1.909046, 3.252568, 0.8313726, 0, 1, 1,
0.8949606, -1.144806, 1.874338, 0.8352941, 0, 1, 1,
0.8950048, 0.0505853, 2.771423, 0.8431373, 0, 1, 1,
0.8960558, -0.1813557, -1.247113, 0.8470588, 0, 1, 1,
0.9080321, 0.2087636, -0.05016224, 0.854902, 0, 1, 1,
0.9085305, -1.680416, 2.206144, 0.8588235, 0, 1, 1,
0.9145637, -1.365265, 2.033808, 0.8666667, 0, 1, 1,
0.9153976, -0.6078392, 2.79221, 0.8705882, 0, 1, 1,
0.9167602, -0.3034882, 2.634262, 0.8784314, 0, 1, 1,
0.9195241, 0.5128978, 3.045289, 0.8823529, 0, 1, 1,
0.9285131, -1.00807, 1.986983, 0.8901961, 0, 1, 1,
0.9337695, -0.8669046, 1.673373, 0.8941177, 0, 1, 1,
0.9373177, -0.6888823, 2.535109, 0.9019608, 0, 1, 1,
0.9414207, -0.2045243, 2.631241, 0.9098039, 0, 1, 1,
0.9507071, -0.7847032, 2.42217, 0.9137255, 0, 1, 1,
0.9544602, 0.5231442, 0.2779172, 0.9215686, 0, 1, 1,
0.9585965, 1.995458, -1.690307, 0.9254902, 0, 1, 1,
0.9591884, -0.7673968, 1.398199, 0.9333333, 0, 1, 1,
0.9638309, -1.285339, 1.461955, 0.9372549, 0, 1, 1,
0.9642, -1.092869, 0.6936813, 0.945098, 0, 1, 1,
0.9655803, -1.014735, 2.100221, 0.9490196, 0, 1, 1,
0.976845, -0.8246282, 2.179069, 0.9568627, 0, 1, 1,
0.98016, -1.106062, 2.665988, 0.9607843, 0, 1, 1,
0.9896812, -0.8024868, 3.081345, 0.9686275, 0, 1, 1,
0.9906934, 1.049919, 0.921834, 0.972549, 0, 1, 1,
0.9920596, 0.4225587, 0.8925943, 0.9803922, 0, 1, 1,
1.016019, 0.2450191, 3.26349, 0.9843137, 0, 1, 1,
1.021568, -1.112832, 3.253752, 0.9921569, 0, 1, 1,
1.023157, -1.176779, 1.798079, 0.9960784, 0, 1, 1,
1.027899, 2.208367, 0.4884073, 1, 0, 0.9960784, 1,
1.038485, -1.750827, 2.091755, 1, 0, 0.9882353, 1,
1.050728, -0.8459146, 3.313456, 1, 0, 0.9843137, 1,
1.050791, 0.8269493, 0.2385759, 1, 0, 0.9764706, 1,
1.051587, -0.7976184, -0.02759226, 1, 0, 0.972549, 1,
1.062389, 0.9413847, -0.472925, 1, 0, 0.9647059, 1,
1.069244, 0.1491975, -0.2474505, 1, 0, 0.9607843, 1,
1.073168, -1.593836, 1.53801, 1, 0, 0.9529412, 1,
1.089206, -1.363196, 3.822306, 1, 0, 0.9490196, 1,
1.092133, 2.269897, -0.3042289, 1, 0, 0.9411765, 1,
1.101185, -2.120703, 2.362766, 1, 0, 0.9372549, 1,
1.105411, 0.496687, -0.4586219, 1, 0, 0.9294118, 1,
1.108039, 0.1989242, 1.074543, 1, 0, 0.9254902, 1,
1.108425, -0.7445385, 3.597705, 1, 0, 0.9176471, 1,
1.110604, -0.8750917, 1.85833, 1, 0, 0.9137255, 1,
1.11826, -1.218803, 2.43621, 1, 0, 0.9058824, 1,
1.120817, -0.1276992, 1.730046, 1, 0, 0.9019608, 1,
1.12741, 0.3862914, 1.267309, 1, 0, 0.8941177, 1,
1.131807, -1.804365, 1.498718, 1, 0, 0.8862745, 1,
1.136834, -0.5137144, 1.907102, 1, 0, 0.8823529, 1,
1.142396, 2.026921, 1.128515, 1, 0, 0.8745098, 1,
1.144372, 0.5705047, 0.3045067, 1, 0, 0.8705882, 1,
1.147656, 1.123935, 1.776148, 1, 0, 0.8627451, 1,
1.150815, 1.059921, 1.751765, 1, 0, 0.8588235, 1,
1.151008, 0.2950734, 2.108756, 1, 0, 0.8509804, 1,
1.155298, 1.476233, 1.198238, 1, 0, 0.8470588, 1,
1.162627, 0.2080753, 0.4601242, 1, 0, 0.8392157, 1,
1.16361, 0.3501422, 0.6926907, 1, 0, 0.8352941, 1,
1.165819, -2.955797, 2.456005, 1, 0, 0.827451, 1,
1.198632, -1.134131, 2.598443, 1, 0, 0.8235294, 1,
1.200175, 0.2174829, -0.468463, 1, 0, 0.8156863, 1,
1.20077, -0.7798473, 2.971323, 1, 0, 0.8117647, 1,
1.209609, -0.4656102, 2.441235, 1, 0, 0.8039216, 1,
1.217696, 0.2284484, 0.4102338, 1, 0, 0.7960784, 1,
1.223586, -0.04407548, 2.219243, 1, 0, 0.7921569, 1,
1.223855, 1.475519, -0.9968325, 1, 0, 0.7843137, 1,
1.224914, -0.3490787, 1.002693, 1, 0, 0.7803922, 1,
1.231177, -0.7422296, 2.554879, 1, 0, 0.772549, 1,
1.232217, -0.8441194, 1.157501, 1, 0, 0.7686275, 1,
1.234098, -1.373778, 2.064576, 1, 0, 0.7607843, 1,
1.23469, 0.007825587, 1.222225, 1, 0, 0.7568628, 1,
1.238732, 0.1225518, 1.710463, 1, 0, 0.7490196, 1,
1.245846, 0.8626409, 0.4450391, 1, 0, 0.7450981, 1,
1.246836, -1.344829, 1.435786, 1, 0, 0.7372549, 1,
1.24903, 1.430671, 2.113954, 1, 0, 0.7333333, 1,
1.250398, -1.015319, 1.723914, 1, 0, 0.7254902, 1,
1.251183, -0.7342083, 2.421495, 1, 0, 0.7215686, 1,
1.251816, 0.1829707, 0.3985113, 1, 0, 0.7137255, 1,
1.254149, -1.860245, 2.713611, 1, 0, 0.7098039, 1,
1.25753, 0.5298811, 2.831993, 1, 0, 0.7019608, 1,
1.258456, 0.6426694, 1.077398, 1, 0, 0.6941177, 1,
1.259262, -0.9984797, 2.874086, 1, 0, 0.6901961, 1,
1.267541, -0.8039339, 2.275778, 1, 0, 0.682353, 1,
1.268583, -1.36288, 3.484681, 1, 0, 0.6784314, 1,
1.273185, 0.4135003, 0.5994141, 1, 0, 0.6705883, 1,
1.27363, 1.863795, 1.12835, 1, 0, 0.6666667, 1,
1.287747, 0.9687082, 1.533525, 1, 0, 0.6588235, 1,
1.297399, 1.161381, 1.114818, 1, 0, 0.654902, 1,
1.297642, -0.3486107, 1.404611, 1, 0, 0.6470588, 1,
1.29842, -1.487908, 1.973948, 1, 0, 0.6431373, 1,
1.320421, -0.7634647, 2.428875, 1, 0, 0.6352941, 1,
1.325707, -0.03953211, 2.788503, 1, 0, 0.6313726, 1,
1.32575, 0.7858036, -0.270169, 1, 0, 0.6235294, 1,
1.335647, 0.001322131, 2.115239, 1, 0, 0.6196079, 1,
1.341724, 0.9177778, 0.9268343, 1, 0, 0.6117647, 1,
1.346635, -0.6045045, 2.216383, 1, 0, 0.6078432, 1,
1.350633, -1.709896, 1.456856, 1, 0, 0.6, 1,
1.358028, -1.193068, 2.227322, 1, 0, 0.5921569, 1,
1.359896, 0.8750532, -0.1624616, 1, 0, 0.5882353, 1,
1.360244, -1.3051, 1.815913, 1, 0, 0.5803922, 1,
1.365466, -0.8809894, 2.566997, 1, 0, 0.5764706, 1,
1.372475, 0.786263, -0.2303981, 1, 0, 0.5686275, 1,
1.373935, 0.6299242, 2.573058, 1, 0, 0.5647059, 1,
1.379945, -0.8253025, 2.464057, 1, 0, 0.5568628, 1,
1.382159, -0.9008116, 2.586518, 1, 0, 0.5529412, 1,
1.390234, -1.39417, 2.115433, 1, 0, 0.5450981, 1,
1.395118, 1.931405, 1.281117, 1, 0, 0.5411765, 1,
1.403688, 0.9442147, 2.079416, 1, 0, 0.5333334, 1,
1.407267, 1.051818, 2.04484, 1, 0, 0.5294118, 1,
1.411939, 0.9770579, -0.4462652, 1, 0, 0.5215687, 1,
1.412275, 0.0683134, 1.051917, 1, 0, 0.5176471, 1,
1.431645, -1.021371, 3.617509, 1, 0, 0.509804, 1,
1.438154, -1.37418, 1.661886, 1, 0, 0.5058824, 1,
1.443179, 2.108896, -1.093418, 1, 0, 0.4980392, 1,
1.453648, -0.7088837, 3.123846, 1, 0, 0.4901961, 1,
1.456634, 0.6279794, 0.8038034, 1, 0, 0.4862745, 1,
1.465309, 0.8057963, 0.3801795, 1, 0, 0.4784314, 1,
1.479626, 0.07343833, 1.100243, 1, 0, 0.4745098, 1,
1.486942, -1.281505, 1.110078, 1, 0, 0.4666667, 1,
1.513214, -0.5232614, 0.8120956, 1, 0, 0.4627451, 1,
1.521633, 0.7682907, 1.774105, 1, 0, 0.454902, 1,
1.523942, -1.112673, 0.7897273, 1, 0, 0.4509804, 1,
1.535118, 0.4333155, 0.3675975, 1, 0, 0.4431373, 1,
1.553473, 0.4270239, 3.61551, 1, 0, 0.4392157, 1,
1.567561, -0.06134979, 1.847506, 1, 0, 0.4313726, 1,
1.568669, 1.292882, 0.5633418, 1, 0, 0.427451, 1,
1.570276, -0.2454608, 1.323658, 1, 0, 0.4196078, 1,
1.58093, 0.966408, -0.76365, 1, 0, 0.4156863, 1,
1.618047, 1.490562, 0.449919, 1, 0, 0.4078431, 1,
1.621104, 1.192757, 0.1503365, 1, 0, 0.4039216, 1,
1.62733, -1.045871, 2.322719, 1, 0, 0.3960784, 1,
1.633814, -1.904822, 4.84745, 1, 0, 0.3882353, 1,
1.636974, -0.6187615, 0.946246, 1, 0, 0.3843137, 1,
1.637026, 0.9775207, 2.245015, 1, 0, 0.3764706, 1,
1.638562, 0.3262115, 1.611419, 1, 0, 0.372549, 1,
1.638769, -0.1765637, 1.479245, 1, 0, 0.3647059, 1,
1.650335, 1.29252, 1.376898, 1, 0, 0.3607843, 1,
1.677882, -0.2158222, -0.59712, 1, 0, 0.3529412, 1,
1.681138, 0.7273412, 1.967928, 1, 0, 0.3490196, 1,
1.729872, 1.062223, 2.054807, 1, 0, 0.3411765, 1,
1.757606, -1.968709, 2.645685, 1, 0, 0.3372549, 1,
1.769005, 0.5440254, 3.389091, 1, 0, 0.3294118, 1,
1.787414, -0.7057593, 0.4574404, 1, 0, 0.3254902, 1,
1.796612, 1.676371, 1.3984, 1, 0, 0.3176471, 1,
1.802155, 0.1855696, 1.313969, 1, 0, 0.3137255, 1,
1.805996, -1.062685, 2.117093, 1, 0, 0.3058824, 1,
1.81058, 1.507291, 2.407588, 1, 0, 0.2980392, 1,
1.81964, 0.6620228, 1.444757, 1, 0, 0.2941177, 1,
1.826303, -1.295577, 2.505055, 1, 0, 0.2862745, 1,
1.83775, -0.5761169, 2.352469, 1, 0, 0.282353, 1,
1.839455, -0.986429, 2.511906, 1, 0, 0.2745098, 1,
1.865239, -1.799404, 3.939289, 1, 0, 0.2705882, 1,
1.874668, 0.6293553, 2.1869, 1, 0, 0.2627451, 1,
1.883241, -0.3418705, 1.343021, 1, 0, 0.2588235, 1,
1.883453, -0.76257, 1.738374, 1, 0, 0.2509804, 1,
1.886967, 0.8728483, 0.4063799, 1, 0, 0.2470588, 1,
1.897667, 0.9983748, 1.208999, 1, 0, 0.2392157, 1,
1.898976, -0.7978545, 2.701964, 1, 0, 0.2352941, 1,
1.908565, 0.6464155, 1.261595, 1, 0, 0.227451, 1,
1.919174, -0.3532968, 2.135143, 1, 0, 0.2235294, 1,
1.925058, 0.934675, 0.8026538, 1, 0, 0.2156863, 1,
1.925333, -0.8899087, 3.130884, 1, 0, 0.2117647, 1,
1.93513, 0.3567254, 1.865724, 1, 0, 0.2039216, 1,
1.955125, -0.003928219, -0.5185959, 1, 0, 0.1960784, 1,
1.960128, -0.1696741, 1.348398, 1, 0, 0.1921569, 1,
1.971739, -0.37419, 1.687694, 1, 0, 0.1843137, 1,
1.972537, -0.3889835, 2.602157, 1, 0, 0.1803922, 1,
1.994681, -0.7055184, 1.958017, 1, 0, 0.172549, 1,
2.006128, -1.760419, 4.280262, 1, 0, 0.1686275, 1,
2.011878, -0.3260112, -0.6601208, 1, 0, 0.1607843, 1,
2.037715, 1.662135, 1.536341, 1, 0, 0.1568628, 1,
2.065225, 2.56838, 2.65629, 1, 0, 0.1490196, 1,
2.098054, -0.668152, 2.499397, 1, 0, 0.145098, 1,
2.135224, -1.341217, 1.180887, 1, 0, 0.1372549, 1,
2.154714, 0.6319681, 1.894634, 1, 0, 0.1333333, 1,
2.191413, -0.8643127, 0.664266, 1, 0, 0.1254902, 1,
2.23278, -0.9192242, -0.0482525, 1, 0, 0.1215686, 1,
2.258783, 1.411347, 1.056162, 1, 0, 0.1137255, 1,
2.268305, -0.6495013, 0.603681, 1, 0, 0.1098039, 1,
2.280821, 0.306524, 1.033215, 1, 0, 0.1019608, 1,
2.309519, 0.2890461, 2.792017, 1, 0, 0.09411765, 1,
2.31768, -0.1849194, 1.900113, 1, 0, 0.09019608, 1,
2.325127, 0.1098229, 1.629239, 1, 0, 0.08235294, 1,
2.345135, -0.8392196, 0.4225287, 1, 0, 0.07843138, 1,
2.365511, 0.4178124, 1.58338, 1, 0, 0.07058824, 1,
2.46351, 2.413859, 1.844764, 1, 0, 0.06666667, 1,
2.495915, 2.060637, 1.107805, 1, 0, 0.05882353, 1,
2.507276, 0.01353659, 0.9392344, 1, 0, 0.05490196, 1,
2.521759, -1.601843, 3.228791, 1, 0, 0.04705882, 1,
2.624935, -0.04389569, 1.309803, 1, 0, 0.04313726, 1,
2.704795, 0.08939865, 2.942655, 1, 0, 0.03529412, 1,
2.731896, 1.189297, 1.086378, 1, 0, 0.03137255, 1,
2.782603, 0.3619542, 3.072791, 1, 0, 0.02352941, 1,
2.820292, -0.2895519, 1.771069, 1, 0, 0.01960784, 1,
2.82943, 1.073131, 1.827497, 1, 0, 0.01176471, 1,
3.218361, -0.2029278, 4.089063, 1, 0, 0.007843138, 1
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
0.2407368, -4.460214, -6.999842, 0, -0.5, 0.5, 0.5,
0.2407368, -4.460214, -6.999842, 1, -0.5, 0.5, 0.5,
0.2407368, -4.460214, -6.999842, 1, 1.5, 0.5, 0.5,
0.2407368, -4.460214, -6.999842, 0, 1.5, 0.5, 0.5
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
-3.746302, -0.1205976, -6.999842, 0, -0.5, 0.5, 0.5,
-3.746302, -0.1205976, -6.999842, 1, -0.5, 0.5, 0.5,
-3.746302, -0.1205976, -6.999842, 1, 1.5, 0.5, 0.5,
-3.746302, -0.1205976, -6.999842, 0, 1.5, 0.5, 0.5
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
-3.746302, -4.460214, 0.3332827, 0, -0.5, 0.5, 0.5,
-3.746302, -4.460214, 0.3332827, 1, -0.5, 0.5, 0.5,
-3.746302, -4.460214, 0.3332827, 1, 1.5, 0.5, 0.5,
-3.746302, -4.460214, 0.3332827, 0, 1.5, 0.5, 0.5
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
-2, -3.458764, -5.307582,
3, -3.458764, -5.307582,
-2, -3.458764, -5.307582,
-2, -3.625672, -5.589625,
-1, -3.458764, -5.307582,
-1, -3.625672, -5.589625,
0, -3.458764, -5.307582,
0, -3.625672, -5.589625,
1, -3.458764, -5.307582,
1, -3.625672, -5.589625,
2, -3.458764, -5.307582,
2, -3.625672, -5.589625,
3, -3.458764, -5.307582,
3, -3.625672, -5.589625
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
-2, -3.959489, -6.153712, 0, -0.5, 0.5, 0.5,
-2, -3.959489, -6.153712, 1, -0.5, 0.5, 0.5,
-2, -3.959489, -6.153712, 1, 1.5, 0.5, 0.5,
-2, -3.959489, -6.153712, 0, 1.5, 0.5, 0.5,
-1, -3.959489, -6.153712, 0, -0.5, 0.5, 0.5,
-1, -3.959489, -6.153712, 1, -0.5, 0.5, 0.5,
-1, -3.959489, -6.153712, 1, 1.5, 0.5, 0.5,
-1, -3.959489, -6.153712, 0, 1.5, 0.5, 0.5,
0, -3.959489, -6.153712, 0, -0.5, 0.5, 0.5,
0, -3.959489, -6.153712, 1, -0.5, 0.5, 0.5,
0, -3.959489, -6.153712, 1, 1.5, 0.5, 0.5,
0, -3.959489, -6.153712, 0, 1.5, 0.5, 0.5,
1, -3.959489, -6.153712, 0, -0.5, 0.5, 0.5,
1, -3.959489, -6.153712, 1, -0.5, 0.5, 0.5,
1, -3.959489, -6.153712, 1, 1.5, 0.5, 0.5,
1, -3.959489, -6.153712, 0, 1.5, 0.5, 0.5,
2, -3.959489, -6.153712, 0, -0.5, 0.5, 0.5,
2, -3.959489, -6.153712, 1, -0.5, 0.5, 0.5,
2, -3.959489, -6.153712, 1, 1.5, 0.5, 0.5,
2, -3.959489, -6.153712, 0, 1.5, 0.5, 0.5,
3, -3.959489, -6.153712, 0, -0.5, 0.5, 0.5,
3, -3.959489, -6.153712, 1, -0.5, 0.5, 0.5,
3, -3.959489, -6.153712, 1, 1.5, 0.5, 0.5,
3, -3.959489, -6.153712, 0, 1.5, 0.5, 0.5
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
-2.826216, -3, -5.307582,
-2.826216, 3, -5.307582,
-2.826216, -3, -5.307582,
-2.979563, -3, -5.589625,
-2.826216, -2, -5.307582,
-2.979563, -2, -5.589625,
-2.826216, -1, -5.307582,
-2.979563, -1, -5.589625,
-2.826216, 0, -5.307582,
-2.979563, 0, -5.589625,
-2.826216, 1, -5.307582,
-2.979563, 1, -5.589625,
-2.826216, 2, -5.307582,
-2.979563, 2, -5.589625,
-2.826216, 3, -5.307582,
-2.979563, 3, -5.589625
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
-3.286259, -3, -6.153712, 0, -0.5, 0.5, 0.5,
-3.286259, -3, -6.153712, 1, -0.5, 0.5, 0.5,
-3.286259, -3, -6.153712, 1, 1.5, 0.5, 0.5,
-3.286259, -3, -6.153712, 0, 1.5, 0.5, 0.5,
-3.286259, -2, -6.153712, 0, -0.5, 0.5, 0.5,
-3.286259, -2, -6.153712, 1, -0.5, 0.5, 0.5,
-3.286259, -2, -6.153712, 1, 1.5, 0.5, 0.5,
-3.286259, -2, -6.153712, 0, 1.5, 0.5, 0.5,
-3.286259, -1, -6.153712, 0, -0.5, 0.5, 0.5,
-3.286259, -1, -6.153712, 1, -0.5, 0.5, 0.5,
-3.286259, -1, -6.153712, 1, 1.5, 0.5, 0.5,
-3.286259, -1, -6.153712, 0, 1.5, 0.5, 0.5,
-3.286259, 0, -6.153712, 0, -0.5, 0.5, 0.5,
-3.286259, 0, -6.153712, 1, -0.5, 0.5, 0.5,
-3.286259, 0, -6.153712, 1, 1.5, 0.5, 0.5,
-3.286259, 0, -6.153712, 0, 1.5, 0.5, 0.5,
-3.286259, 1, -6.153712, 0, -0.5, 0.5, 0.5,
-3.286259, 1, -6.153712, 1, -0.5, 0.5, 0.5,
-3.286259, 1, -6.153712, 1, 1.5, 0.5, 0.5,
-3.286259, 1, -6.153712, 0, 1.5, 0.5, 0.5,
-3.286259, 2, -6.153712, 0, -0.5, 0.5, 0.5,
-3.286259, 2, -6.153712, 1, -0.5, 0.5, 0.5,
-3.286259, 2, -6.153712, 1, 1.5, 0.5, 0.5,
-3.286259, 2, -6.153712, 0, 1.5, 0.5, 0.5,
-3.286259, 3, -6.153712, 0, -0.5, 0.5, 0.5,
-3.286259, 3, -6.153712, 1, -0.5, 0.5, 0.5,
-3.286259, 3, -6.153712, 1, 1.5, 0.5, 0.5,
-3.286259, 3, -6.153712, 0, 1.5, 0.5, 0.5
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
-2.826216, -3.458764, -4,
-2.826216, -3.458764, 4,
-2.826216, -3.458764, -4,
-2.979563, -3.625672, -4,
-2.826216, -3.458764, -2,
-2.979563, -3.625672, -2,
-2.826216, -3.458764, 0,
-2.979563, -3.625672, 0,
-2.826216, -3.458764, 2,
-2.979563, -3.625672, 2,
-2.826216, -3.458764, 4,
-2.979563, -3.625672, 4
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
-3.286259, -3.959489, -4, 0, -0.5, 0.5, 0.5,
-3.286259, -3.959489, -4, 1, -0.5, 0.5, 0.5,
-3.286259, -3.959489, -4, 1, 1.5, 0.5, 0.5,
-3.286259, -3.959489, -4, 0, 1.5, 0.5, 0.5,
-3.286259, -3.959489, -2, 0, -0.5, 0.5, 0.5,
-3.286259, -3.959489, -2, 1, -0.5, 0.5, 0.5,
-3.286259, -3.959489, -2, 1, 1.5, 0.5, 0.5,
-3.286259, -3.959489, -2, 0, 1.5, 0.5, 0.5,
-3.286259, -3.959489, 0, 0, -0.5, 0.5, 0.5,
-3.286259, -3.959489, 0, 1, -0.5, 0.5, 0.5,
-3.286259, -3.959489, 0, 1, 1.5, 0.5, 0.5,
-3.286259, -3.959489, 0, 0, 1.5, 0.5, 0.5,
-3.286259, -3.959489, 2, 0, -0.5, 0.5, 0.5,
-3.286259, -3.959489, 2, 1, -0.5, 0.5, 0.5,
-3.286259, -3.959489, 2, 1, 1.5, 0.5, 0.5,
-3.286259, -3.959489, 2, 0, 1.5, 0.5, 0.5,
-3.286259, -3.959489, 4, 0, -0.5, 0.5, 0.5,
-3.286259, -3.959489, 4, 1, -0.5, 0.5, 0.5,
-3.286259, -3.959489, 4, 1, 1.5, 0.5, 0.5,
-3.286259, -3.959489, 4, 0, 1.5, 0.5, 0.5
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
-2.826216, -3.458764, -5.307582,
-2.826216, 3.217568, -5.307582,
-2.826216, -3.458764, 5.974148,
-2.826216, 3.217568, 5.974148,
-2.826216, -3.458764, -5.307582,
-2.826216, -3.458764, 5.974148,
-2.826216, 3.217568, -5.307582,
-2.826216, 3.217568, 5.974148,
-2.826216, -3.458764, -5.307582,
3.30769, -3.458764, -5.307582,
-2.826216, -3.458764, 5.974148,
3.30769, -3.458764, 5.974148,
-2.826216, 3.217568, -5.307582,
3.30769, 3.217568, -5.307582,
-2.826216, 3.217568, 5.974148,
3.30769, 3.217568, 5.974148,
3.30769, -3.458764, -5.307582,
3.30769, 3.217568, -5.307582,
3.30769, -3.458764, 5.974148,
3.30769, 3.217568, 5.974148,
3.30769, -3.458764, -5.307582,
3.30769, -3.458764, 5.974148,
3.30769, 3.217568, -5.307582,
3.30769, 3.217568, 5.974148
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
var radius = 7.728447;
var distance = 34.38473;
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
mvMatrix.translate( -0.2407368, 0.1205976, -0.3332827 );
mvMatrix.scale( 1.362288, 1.251608, 0.7406797 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.38473);
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
quinoline<-read.table("quinoline.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-quinoline$V2
```

```
## Error in eval(expr, envir, enclos): object 'quinoline' not found
```

```r
y<-quinoline$V3
```

```
## Error in eval(expr, envir, enclos): object 'quinoline' not found
```

```r
z<-quinoline$V4
```

```
## Error in eval(expr, envir, enclos): object 'quinoline' not found
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
-2.736887, 0.05667231, -1.345379, 0, 0, 1, 1, 1,
-2.608382, 0.268571, -0.7481614, 1, 0, 0, 1, 1,
-2.541407, -0.1438785, -2.162071, 1, 0, 0, 1, 1,
-2.438627, 0.6018185, -1.28162, 1, 0, 0, 1, 1,
-2.342224, -0.3660613, -0.1944432, 1, 0, 0, 1, 1,
-2.333244, -0.6490172, -1.38534, 1, 0, 0, 1, 1,
-2.307927, 0.9210709, -1.605816, 0, 0, 0, 1, 1,
-2.302242, 2.887956, -0.7570768, 0, 0, 0, 1, 1,
-2.270351, -0.5856833, -1.090079, 0, 0, 0, 1, 1,
-2.267899, -0.2727485, -0.8458534, 0, 0, 0, 1, 1,
-2.2162, -1.275491, -3.784236, 0, 0, 0, 1, 1,
-2.19008, 0.1147484, -1.808878, 0, 0, 0, 1, 1,
-2.180329, 0.3394576, -1.796477, 0, 0, 0, 1, 1,
-2.171841, 1.161618, -2.247134, 1, 1, 1, 1, 1,
-2.167489, 0.05684434, -2.151495, 1, 1, 1, 1, 1,
-2.148221, 0.3703422, -0.2496626, 1, 1, 1, 1, 1,
-2.139761, 0.7410432, 0.1451309, 1, 1, 1, 1, 1,
-2.113795, 1.037316, 0.2464112, 1, 1, 1, 1, 1,
-2.063839, -0.9853408, -1.542393, 1, 1, 1, 1, 1,
-1.992813, 0.5035569, -1.745394, 1, 1, 1, 1, 1,
-1.933185, -0.3523323, -1.666923, 1, 1, 1, 1, 1,
-1.921497, -0.4700915, -1.464193, 1, 1, 1, 1, 1,
-1.920031, 0.8383893, -0.1173622, 1, 1, 1, 1, 1,
-1.91564, 0.1476537, -2.323727, 1, 1, 1, 1, 1,
-1.902708, 0.8424274, 0.004023916, 1, 1, 1, 1, 1,
-1.893979, 0.5702555, -0.1889836, 1, 1, 1, 1, 1,
-1.890429, -2.491717, -2.627412, 1, 1, 1, 1, 1,
-1.881983, 0.01957285, -1.750132, 1, 1, 1, 1, 1,
-1.876872, 1.11238, -1.302102, 0, 0, 1, 1, 1,
-1.864477, 0.4641401, -1.588792, 1, 0, 0, 1, 1,
-1.8617, 0.6440468, -2.231144, 1, 0, 0, 1, 1,
-1.844245, 0.51788, -1.883017, 1, 0, 0, 1, 1,
-1.800103, 0.220305, -0.9504195, 1, 0, 0, 1, 1,
-1.748868, 0.3199144, -0.2477581, 1, 0, 0, 1, 1,
-1.741062, -1.01672, 0.6552651, 0, 0, 0, 1, 1,
-1.736866, -0.1373441, -2.788633, 0, 0, 0, 1, 1,
-1.72489, -1.175909, -2.642891, 0, 0, 0, 1, 1,
-1.720068, 0.2628116, -1.840739, 0, 0, 0, 1, 1,
-1.719938, 0.09274184, -1.814316, 0, 0, 0, 1, 1,
-1.712681, 0.4824154, -0.8467891, 0, 0, 0, 1, 1,
-1.703257, 2.014296, -0.6132014, 0, 0, 0, 1, 1,
-1.67592, 0.3345368, -2.742848, 1, 1, 1, 1, 1,
-1.668803, 0.4101719, -0.5423777, 1, 1, 1, 1, 1,
-1.661835, -0.6616983, -0.9019113, 1, 1, 1, 1, 1,
-1.633625, 0.4251005, -1.676635, 1, 1, 1, 1, 1,
-1.60265, 0.8741843, -0.4195349, 1, 1, 1, 1, 1,
-1.597254, -1.919031, -4.762759, 1, 1, 1, 1, 1,
-1.587836, 1.76722, -2.297481, 1, 1, 1, 1, 1,
-1.586198, 0.8459281, -0.2264827, 1, 1, 1, 1, 1,
-1.584261, 0.1980253, 1.247188, 1, 1, 1, 1, 1,
-1.573395, 0.1276266, -1.525149, 1, 1, 1, 1, 1,
-1.560196, -0.07920512, -1.95822, 1, 1, 1, 1, 1,
-1.554682, 0.1190041, -1.602473, 1, 1, 1, 1, 1,
-1.550421, -0.2825845, -2.317094, 1, 1, 1, 1, 1,
-1.549137, 0.4890106, -0.6233554, 1, 1, 1, 1, 1,
-1.542799, 0.643522, -0.8146458, 1, 1, 1, 1, 1,
-1.54105, -0.2562595, -1.43844, 0, 0, 1, 1, 1,
-1.535403, -1.489734, -1.627779, 1, 0, 0, 1, 1,
-1.533427, 2.444599, 2.413843, 1, 0, 0, 1, 1,
-1.527202, -0.2657912, -1.73131, 1, 0, 0, 1, 1,
-1.519997, -0.1367485, -1.474861, 1, 0, 0, 1, 1,
-1.518332, -0.5547852, -2.29672, 1, 0, 0, 1, 1,
-1.517604, 0.2933578, -0.6438108, 0, 0, 0, 1, 1,
-1.513041, 0.07992423, -1.506246, 0, 0, 0, 1, 1,
-1.508926, -1.187495, -2.213423, 0, 0, 0, 1, 1,
-1.499282, -0.04488883, -2.51074, 0, 0, 0, 1, 1,
-1.489071, -0.8404672, -2.911435, 0, 0, 0, 1, 1,
-1.488391, 1.233901, -1.059407, 0, 0, 0, 1, 1,
-1.479467, 1.18464, -1.84096, 0, 0, 0, 1, 1,
-1.472624, -1.798951, -2.887864, 1, 1, 1, 1, 1,
-1.465163, 1.573597, 0.03847919, 1, 1, 1, 1, 1,
-1.462888, -0.6265249, -2.10165, 1, 1, 1, 1, 1,
-1.457942, -0.6550302, -2.033514, 1, 1, 1, 1, 1,
-1.45233, -0.105233, -1.670597, 1, 1, 1, 1, 1,
-1.452037, -0.3623635, -1.478554, 1, 1, 1, 1, 1,
-1.435806, 0.2653809, -2.241548, 1, 1, 1, 1, 1,
-1.426291, -2.399134, -1.680419, 1, 1, 1, 1, 1,
-1.420876, 0.7192473, -1.915858, 1, 1, 1, 1, 1,
-1.417693, -0.2789984, 0.6945064, 1, 1, 1, 1, 1,
-1.408858, 1.196937, -0.4220175, 1, 1, 1, 1, 1,
-1.403373, -1.631184, -2.253497, 1, 1, 1, 1, 1,
-1.402664, 0.489722, -1.833579, 1, 1, 1, 1, 1,
-1.380548, 1.247869, -2.826112, 1, 1, 1, 1, 1,
-1.372401, 0.05889047, -2.991537, 1, 1, 1, 1, 1,
-1.358767, 0.7676752, -2.144949, 0, 0, 1, 1, 1,
-1.357902, 2.789905, -0.1737592, 1, 0, 0, 1, 1,
-1.3563, 0.437034, -0.3833012, 1, 0, 0, 1, 1,
-1.350433, 0.4177937, -0.6041964, 1, 0, 0, 1, 1,
-1.342159, 0.6659233, -0.8161649, 1, 0, 0, 1, 1,
-1.337451, -2.223968, -2.27878, 1, 0, 0, 1, 1,
-1.297129, -0.9361184, -3.247013, 0, 0, 0, 1, 1,
-1.286873, 1.26574, -0.02232753, 0, 0, 0, 1, 1,
-1.283969, 0.5887761, -0.2414636, 0, 0, 0, 1, 1,
-1.282572, 0.2786953, -1.422699, 0, 0, 0, 1, 1,
-1.268754, -1.693933, -2.2084, 0, 0, 0, 1, 1,
-1.255777, -1.608506, -1.093787, 0, 0, 0, 1, 1,
-1.251613, -0.5816957, -3.102178, 0, 0, 0, 1, 1,
-1.241919, -1.015487, -2.466723, 1, 1, 1, 1, 1,
-1.235113, 1.567566, -0.737915, 1, 1, 1, 1, 1,
-1.229613, 0.8964376, -0.5182883, 1, 1, 1, 1, 1,
-1.226194, -0.01245146, -1.08468, 1, 1, 1, 1, 1,
-1.221809, 1.354638, 0.3562044, 1, 1, 1, 1, 1,
-1.219972, -0.5716867, -3.628512, 1, 1, 1, 1, 1,
-1.20686, -0.1689524, -2.667144, 1, 1, 1, 1, 1,
-1.203154, 0.06017403, -0.6623495, 1, 1, 1, 1, 1,
-1.202538, 1.225812, -2.845889, 1, 1, 1, 1, 1,
-1.2005, -3.028129, -3.149447, 1, 1, 1, 1, 1,
-1.197189, 0.2771947, 0.03867702, 1, 1, 1, 1, 1,
-1.189358, 0.5121622, -0.1637447, 1, 1, 1, 1, 1,
-1.187233, -0.7460846, -4.933465, 1, 1, 1, 1, 1,
-1.178567, 0.6905212, -2.194242, 1, 1, 1, 1, 1,
-1.170919, 0.2470783, -1.256208, 1, 1, 1, 1, 1,
-1.170039, -0.1444847, -2.145947, 0, 0, 1, 1, 1,
-1.162389, 0.6794503, -2.824898, 1, 0, 0, 1, 1,
-1.16153, -0.8091857, -2.206322, 1, 0, 0, 1, 1,
-1.161015, 1.980943, -1.377924, 1, 0, 0, 1, 1,
-1.155616, 0.2309163, -2.255513, 1, 0, 0, 1, 1,
-1.154804, -0.2918468, -2.22106, 1, 0, 0, 1, 1,
-1.144567, -0.3816657, -3.271409, 0, 0, 0, 1, 1,
-1.140551, 0.1337239, 0.8755184, 0, 0, 0, 1, 1,
-1.135251, -0.7815083, -1.435259, 0, 0, 0, 1, 1,
-1.13207, 1.22453, -1.339847, 0, 0, 0, 1, 1,
-1.131554, 0.7744241, 0.06897741, 0, 0, 0, 1, 1,
-1.12752, 0.2241964, -1.990498, 0, 0, 0, 1, 1,
-1.122524, 1.965476, 0.6216229, 0, 0, 0, 1, 1,
-1.108976, 1.198695, -0.1072666, 1, 1, 1, 1, 1,
-1.103384, -0.3168446, -2.289022, 1, 1, 1, 1, 1,
-1.095816, 0.1158543, -2.495776, 1, 1, 1, 1, 1,
-1.095775, -0.4614009, -2.580416, 1, 1, 1, 1, 1,
-1.095258, 2.169923, 0.5822773, 1, 1, 1, 1, 1,
-1.091999, -1.640283, -3.471206, 1, 1, 1, 1, 1,
-1.077865, 1.5894, -0.1879351, 1, 1, 1, 1, 1,
-1.066387, 0.4450615, -0.9804919, 1, 1, 1, 1, 1,
-1.053838, -0.4860448, -3.554613, 1, 1, 1, 1, 1,
-1.053363, 0.7666667, -1.686327, 1, 1, 1, 1, 1,
-1.043929, -0.2980626, -0.6774863, 1, 1, 1, 1, 1,
-1.041293, 1.424804, -1.620943, 1, 1, 1, 1, 1,
-1.03468, 1.355737, -1.776726, 1, 1, 1, 1, 1,
-1.030336, 0.2220386, -1.608597, 1, 1, 1, 1, 1,
-1.022807, 0.4831971, -1.192981, 1, 1, 1, 1, 1,
-1.018066, 0.7645211, -1.569194, 0, 0, 1, 1, 1,
-1.017674, -0.729331, -3.215443, 1, 0, 0, 1, 1,
-1.015998, -0.6429574, -3.609497, 1, 0, 0, 1, 1,
-1.015293, 1.138529, 0.2412183, 1, 0, 0, 1, 1,
-1.014758, -0.149767, -2.657438, 1, 0, 0, 1, 1,
-1.013757, 0.09919446, -1.05515, 1, 0, 0, 1, 1,
-1.011603, -1.489915, -2.840862, 0, 0, 0, 1, 1,
-1.01041, 0.05118059, -1.542177, 0, 0, 0, 1, 1,
-1.008008, -1.236016, -3.387218, 0, 0, 0, 1, 1,
-0.9995702, -1.170687, -3.23189, 0, 0, 0, 1, 1,
-0.9987119, -1.151384, -1.518243, 0, 0, 0, 1, 1,
-0.9874162, 0.5575858, -0.6945344, 0, 0, 0, 1, 1,
-0.9820614, -0.3821323, -1.095758, 0, 0, 0, 1, 1,
-0.977055, 0.7669124, 0.6379458, 1, 1, 1, 1, 1,
-0.9679922, -0.8843372, -2.217834, 1, 1, 1, 1, 1,
-0.9635571, -0.6452693, -3.76932, 1, 1, 1, 1, 1,
-0.959536, 0.41584, -1.29814, 1, 1, 1, 1, 1,
-0.9591967, 1.8659, 0.2138506, 1, 1, 1, 1, 1,
-0.958282, 0.6344856, -2.38377, 1, 1, 1, 1, 1,
-0.9526458, -0.09005757, -1.309489, 1, 1, 1, 1, 1,
-0.9479589, -1.592932, -2.270486, 1, 1, 1, 1, 1,
-0.9470725, -1.906088, -1.117445, 1, 1, 1, 1, 1,
-0.937267, 2.274516, -0.5162337, 1, 1, 1, 1, 1,
-0.932009, -1.012826, -3.050564, 1, 1, 1, 1, 1,
-0.9317118, -0.1705032, 0.3396894, 1, 1, 1, 1, 1,
-0.9303941, 0.7893412, -1.039391, 1, 1, 1, 1, 1,
-0.9292294, -0.636549, -3.207898, 1, 1, 1, 1, 1,
-0.9279104, -1.301812, -2.552527, 1, 1, 1, 1, 1,
-0.9245427, 2.143461, 1.603501, 0, 0, 1, 1, 1,
-0.9176081, 0.7068388, -2.629285, 1, 0, 0, 1, 1,
-0.9163266, 1.33418, -0.3489877, 1, 0, 0, 1, 1,
-0.9160316, 0.3036855, -1.238676, 1, 0, 0, 1, 1,
-0.9136054, 0.09365498, -3.404791, 1, 0, 0, 1, 1,
-0.9112247, -0.2191382, -2.005207, 1, 0, 0, 1, 1,
-0.9082744, 0.9030628, -1.233734, 0, 0, 0, 1, 1,
-0.9024628, 0.3041233, 0.5875682, 0, 0, 0, 1, 1,
-0.900602, -1.48581, -3.253318, 0, 0, 0, 1, 1,
-0.8999678, 1.783492, -0.3307254, 0, 0, 0, 1, 1,
-0.8999211, 1.880304, -0.4202473, 0, 0, 0, 1, 1,
-0.8975832, -0.1600215, -1.199515, 0, 0, 0, 1, 1,
-0.8966136, 1.017654, -0.9346672, 0, 0, 0, 1, 1,
-0.8927884, -1.308319, -4.234463, 1, 1, 1, 1, 1,
-0.8910636, -1.330934, -1.532351, 1, 1, 1, 1, 1,
-0.8910052, 0.7699344, 0.07045943, 1, 1, 1, 1, 1,
-0.8868195, 1.242912, 0.5398756, 1, 1, 1, 1, 1,
-0.8804235, 0.1322333, -1.571676, 1, 1, 1, 1, 1,
-0.8754199, 0.1589747, -3.676481, 1, 1, 1, 1, 1,
-0.8746964, -0.2795033, -1.243839, 1, 1, 1, 1, 1,
-0.8634863, 1.063722, -1.323201, 1, 1, 1, 1, 1,
-0.8629611, -1.494901, -2.348182, 1, 1, 1, 1, 1,
-0.8617204, -0.2909035, -0.4742828, 1, 1, 1, 1, 1,
-0.8491461, -0.6008654, -3.551349, 1, 1, 1, 1, 1,
-0.8320934, -0.9543692, -3.266114, 1, 1, 1, 1, 1,
-0.8269622, 0.1739475, -3.132982, 1, 1, 1, 1, 1,
-0.8192595, -0.1612433, -1.250199, 1, 1, 1, 1, 1,
-0.8092324, 1.203247, 0.4639862, 1, 1, 1, 1, 1,
-0.8075163, -0.3545839, -1.022716, 0, 0, 1, 1, 1,
-0.8065782, 0.7899633, -0.7619932, 1, 0, 0, 1, 1,
-0.8061744, 0.3430914, -0.4986673, 1, 0, 0, 1, 1,
-0.7991773, -0.4016697, -1.442322, 1, 0, 0, 1, 1,
-0.7940639, -0.5228539, -2.05951, 1, 0, 0, 1, 1,
-0.7833441, -0.1755833, -0.6145018, 1, 0, 0, 1, 1,
-0.7704711, 1.224187, -1.245472, 0, 0, 0, 1, 1,
-0.7674296, -0.8333217, -3.899664, 0, 0, 0, 1, 1,
-0.7660254, 1.350237, 1.282874, 0, 0, 0, 1, 1,
-0.760004, 1.000253, 0.7224218, 0, 0, 0, 1, 1,
-0.7475678, -0.5490108, -0.5820463, 0, 0, 0, 1, 1,
-0.7471033, 1.038845, 0.6482737, 0, 0, 0, 1, 1,
-0.7417856, -1.417585, -3.385673, 0, 0, 0, 1, 1,
-0.7380118, -1.089074, -2.037194, 1, 1, 1, 1, 1,
-0.7317897, 0.5987016, -0.6193885, 1, 1, 1, 1, 1,
-0.729996, -0.2345364, -2.202373, 1, 1, 1, 1, 1,
-0.725417, 1.187748, -0.03468683, 1, 1, 1, 1, 1,
-0.7232832, 0.7999291, -2.355698, 1, 1, 1, 1, 1,
-0.7225281, -0.01145177, -1.23942, 1, 1, 1, 1, 1,
-0.721174, -1.154527, -0.4415283, 1, 1, 1, 1, 1,
-0.7197461, 0.8287452, 1.492983, 1, 1, 1, 1, 1,
-0.7113307, -0.07085844, -1.386357, 1, 1, 1, 1, 1,
-0.70872, -0.007460755, -1.840894, 1, 1, 1, 1, 1,
-0.7084836, 1.212283, 1.824098, 1, 1, 1, 1, 1,
-0.7024114, 0.8110572, -2.076031, 1, 1, 1, 1, 1,
-0.7020044, 0.5882856, -1.197709, 1, 1, 1, 1, 1,
-0.6994385, -0.2068203, -1.017445, 1, 1, 1, 1, 1,
-0.6980485, 0.6536139, -0.9465124, 1, 1, 1, 1, 1,
-0.695147, -1.017357, -0.9704013, 0, 0, 1, 1, 1,
-0.6877292, 0.2939916, -2.537494, 1, 0, 0, 1, 1,
-0.6864097, -0.008237422, -0.02566102, 1, 0, 0, 1, 1,
-0.6809258, -1.054417, -3.220765, 1, 0, 0, 1, 1,
-0.6707358, -2.253818, -2.889014, 1, 0, 0, 1, 1,
-0.6686276, -1.476484, -2.008296, 1, 0, 0, 1, 1,
-0.6685382, -0.8932478, -1.999255, 0, 0, 0, 1, 1,
-0.6668551, -1.665787, -1.396477, 0, 0, 0, 1, 1,
-0.6647254, -0.1635641, -1.910248, 0, 0, 0, 1, 1,
-0.6642518, -0.8188689, -1.09425, 0, 0, 0, 1, 1,
-0.6553189, -1.29162, -2.909595, 0, 0, 0, 1, 1,
-0.6552646, -0.4021681, -2.474066, 0, 0, 0, 1, 1,
-0.6541589, -1.517749, -2.999086, 0, 0, 0, 1, 1,
-0.6514943, -0.8622715, -3.201725, 1, 1, 1, 1, 1,
-0.6471176, -0.6388287, 0.1393538, 1, 1, 1, 1, 1,
-0.6443853, -1.013008, -2.046637, 1, 1, 1, 1, 1,
-0.6440657, -0.5426525, -3.070432, 1, 1, 1, 1, 1,
-0.6401621, -1.94413, -3.219914, 1, 1, 1, 1, 1,
-0.6383892, 1.147287, -0.3641771, 1, 1, 1, 1, 1,
-0.6361791, 0.5894628, -0.1035117, 1, 1, 1, 1, 1,
-0.6313389, 0.2545246, -2.232003, 1, 1, 1, 1, 1,
-0.6274099, 0.1842408, -3.46508, 1, 1, 1, 1, 1,
-0.6273733, 0.2082919, 0.2444839, 1, 1, 1, 1, 1,
-0.6252445, -0.5736256, -0.7700332, 1, 1, 1, 1, 1,
-0.6212441, -0.7377284, -3.207954, 1, 1, 1, 1, 1,
-0.6182883, -0.9757523, -2.326568, 1, 1, 1, 1, 1,
-0.6177705, 1.165392, -0.6715698, 1, 1, 1, 1, 1,
-0.6104746, 0.6555918, 0.2402387, 1, 1, 1, 1, 1,
-0.6092452, -0.2860513, -1.526788, 0, 0, 1, 1, 1,
-0.6086953, 1.702641, 0.3352627, 1, 0, 0, 1, 1,
-0.6059284, -0.2751363, 0.4255288, 1, 0, 0, 1, 1,
-0.6013359, 2.058033, 0.3183284, 1, 0, 0, 1, 1,
-0.599695, -1.59392, -3.652834, 1, 0, 0, 1, 1,
-0.5975069, -0.2525523, -0.8917457, 1, 0, 0, 1, 1,
-0.5963148, -1.188095, -2.69013, 0, 0, 0, 1, 1,
-0.5943259, 0.5524928, -1.291355, 0, 0, 0, 1, 1,
-0.5888273, 0.6327495, 0.5294957, 0, 0, 0, 1, 1,
-0.5834696, 0.4152535, -1.151929, 0, 0, 0, 1, 1,
-0.5756248, 1.071638, -1.836998, 0, 0, 0, 1, 1,
-0.5697864, -0.7065758, -2.206969, 0, 0, 0, 1, 1,
-0.5673522, 0.9407977, -0.624903, 0, 0, 0, 1, 1,
-0.5664344, 1.583035, 0.6165933, 1, 1, 1, 1, 1,
-0.5635231, 0.08010115, -0.7049718, 1, 1, 1, 1, 1,
-0.5613267, 0.9804441, -0.6296848, 1, 1, 1, 1, 1,
-0.5545651, -0.3160219, -2.463883, 1, 1, 1, 1, 1,
-0.5509138, 1.397193, -0.3239188, 1, 1, 1, 1, 1,
-0.548107, -0.3106888, -1.892633, 1, 1, 1, 1, 1,
-0.5480955, 1.034197, -2.83354, 1, 1, 1, 1, 1,
-0.5442138, -0.2726535, -4.322744, 1, 1, 1, 1, 1,
-0.5374482, -0.8807408, -3.729033, 1, 1, 1, 1, 1,
-0.5263968, 0.4366547, -2.33722, 1, 1, 1, 1, 1,
-0.524093, 0.7702518, 0.1391575, 1, 1, 1, 1, 1,
-0.5236458, 1.092197, -1.885557, 1, 1, 1, 1, 1,
-0.5224651, -3.361536, -2.677482, 1, 1, 1, 1, 1,
-0.5215552, -0.7334046, -2.753118, 1, 1, 1, 1, 1,
-0.5193632, -1.440686, -3.871235, 1, 1, 1, 1, 1,
-0.5130064, 0.9926851, -0.7527426, 0, 0, 1, 1, 1,
-0.5106599, -0.07840845, -1.965193, 1, 0, 0, 1, 1,
-0.5091514, -0.2633847, -3.111641, 1, 0, 0, 1, 1,
-0.5087635, -0.5034658, -4.240084, 1, 0, 0, 1, 1,
-0.503879, -0.2242913, -1.449876, 1, 0, 0, 1, 1,
-0.5036029, 1.452797, 1.863579, 1, 0, 0, 1, 1,
-0.4993474, 1.479857, -0.01628589, 0, 0, 0, 1, 1,
-0.4991346, -0.2954797, -0.90866, 0, 0, 0, 1, 1,
-0.4989415, 2.106904, -0.2425541, 0, 0, 0, 1, 1,
-0.4982407, 1.080123, -0.3293498, 0, 0, 0, 1, 1,
-0.4916403, 0.1247005, -0.9544303, 0, 0, 0, 1, 1,
-0.4867348, 0.6716009, -1.005622, 0, 0, 0, 1, 1,
-0.4842626, -0.7007875, -1.996912, 0, 0, 0, 1, 1,
-0.4802535, -0.8594143, -1.941342, 1, 1, 1, 1, 1,
-0.4779861, 0.2764391, -1.910457, 1, 1, 1, 1, 1,
-0.4712428, 1.427545, -0.5113977, 1, 1, 1, 1, 1,
-0.4712222, 1.05877, 0.7655066, 1, 1, 1, 1, 1,
-0.4618107, -1.02417, -4.193047, 1, 1, 1, 1, 1,
-0.4570473, 1.226456, -0.6806386, 1, 1, 1, 1, 1,
-0.4532904, -1.592598, -3.043382, 1, 1, 1, 1, 1,
-0.4526401, -0.1747508, -0.8714833, 1, 1, 1, 1, 1,
-0.4447606, -0.1268325, -1.603432, 1, 1, 1, 1, 1,
-0.4428546, 0.4076533, 2.509576, 1, 1, 1, 1, 1,
-0.439967, -0.3763316, -2.36541, 1, 1, 1, 1, 1,
-0.439287, -1.667388, -1.769683, 1, 1, 1, 1, 1,
-0.4379719, 0.9245068, 0.1081154, 1, 1, 1, 1, 1,
-0.4320453, -0.169249, -1.698481, 1, 1, 1, 1, 1,
-0.428241, 1.674968, -0.7316263, 1, 1, 1, 1, 1,
-0.4268303, 0.5911753, -1.152463, 0, 0, 1, 1, 1,
-0.4247817, 0.7649978, -1.605475, 1, 0, 0, 1, 1,
-0.4216948, -0.964274, -2.032185, 1, 0, 0, 1, 1,
-0.4193093, 0.1380337, 0.5613693, 1, 0, 0, 1, 1,
-0.4187873, 0.2425387, 0.1208417, 1, 0, 0, 1, 1,
-0.417893, -0.7943096, -1.947673, 1, 0, 0, 1, 1,
-0.414807, 0.125412, -1.625407, 0, 0, 0, 1, 1,
-0.4069733, -0.3270945, -2.680442, 0, 0, 0, 1, 1,
-0.4010963, -0.02132969, -1.72972, 0, 0, 0, 1, 1,
-0.3919341, 0.25977, -1.639552, 0, 0, 0, 1, 1,
-0.391808, -0.326, -1.425138, 0, 0, 0, 1, 1,
-0.3893864, -1.084814, -1.945861, 0, 0, 0, 1, 1,
-0.3889453, 0.1002088, -0.8221158, 0, 0, 0, 1, 1,
-0.3854196, 0.03595019, -0.03892884, 1, 1, 1, 1, 1,
-0.3851747, -0.7517816, -3.655898, 1, 1, 1, 1, 1,
-0.3838931, -1.023319, -4.404598, 1, 1, 1, 1, 1,
-0.3802142, -1.257094, -3.132016, 1, 1, 1, 1, 1,
-0.3799438, -0.6546464, -2.668502, 1, 1, 1, 1, 1,
-0.3778292, 0.03567624, -1.490511, 1, 1, 1, 1, 1,
-0.3715991, -2.136511, -2.947899, 1, 1, 1, 1, 1,
-0.3708941, -1.383675, -3.007638, 1, 1, 1, 1, 1,
-0.3663503, 1.811553, 0.5046647, 1, 1, 1, 1, 1,
-0.3569575, -0.5639213, -3.411511, 1, 1, 1, 1, 1,
-0.3565786, -0.3397367, -1.289938, 1, 1, 1, 1, 1,
-0.3525623, -0.4154238, -1.822619, 1, 1, 1, 1, 1,
-0.3505819, 1.331023, -0.06193861, 1, 1, 1, 1, 1,
-0.3498281, 0.2969433, -1.924703, 1, 1, 1, 1, 1,
-0.3496318, 0.9883309, -1.414936, 1, 1, 1, 1, 1,
-0.3484537, -0.1786746, -2.693021, 0, 0, 1, 1, 1,
-0.3476789, 0.5605648, 0.4306222, 1, 0, 0, 1, 1,
-0.3456717, 0.6285669, -0.6120457, 1, 0, 0, 1, 1,
-0.3455604, 0.4256274, -0.3406572, 1, 0, 0, 1, 1,
-0.3433114, 0.469778, -2.452884, 1, 0, 0, 1, 1,
-0.3414885, 0.8157104, -1.639181, 1, 0, 0, 1, 1,
-0.3400457, 0.05435735, -1.549622, 0, 0, 0, 1, 1,
-0.3264352, -0.6212932, -2.110092, 0, 0, 0, 1, 1,
-0.3263054, -0.8576008, -4.916663, 0, 0, 0, 1, 1,
-0.3205533, 0.950044, 1.629447, 0, 0, 0, 1, 1,
-0.3121499, 0.8712334, -2.37979, 0, 0, 0, 1, 1,
-0.3087555, -0.8596616, -2.546973, 0, 0, 0, 1, 1,
-0.3086718, 0.06199393, 0.1413239, 0, 0, 0, 1, 1,
-0.3065839, -2.287799, -2.824756, 1, 1, 1, 1, 1,
-0.3056075, -0.2676952, -3.183073, 1, 1, 1, 1, 1,
-0.3038722, -0.4589482, -4.265463, 1, 1, 1, 1, 1,
-0.3008101, 0.1519341, -1.928966, 1, 1, 1, 1, 1,
-0.2997647, -0.927259, -2.937127, 1, 1, 1, 1, 1,
-0.2987787, 0.7644623, 1.317383, 1, 1, 1, 1, 1,
-0.2962983, -0.1251576, 0.1515986, 1, 1, 1, 1, 1,
-0.2930988, -0.8422962, -2.746256, 1, 1, 1, 1, 1,
-0.2827913, -0.2571862, -1.153322, 1, 1, 1, 1, 1,
-0.2824552, -1.202758, -3.076997, 1, 1, 1, 1, 1,
-0.2763698, -1.92626, -1.479554, 1, 1, 1, 1, 1,
-0.275925, 1.136296, 0.9437907, 1, 1, 1, 1, 1,
-0.2714912, 0.08675994, -2.643839, 1, 1, 1, 1, 1,
-0.2668517, 0.08171494, -0.7732396, 1, 1, 1, 1, 1,
-0.2662919, -1.354676, -2.833677, 1, 1, 1, 1, 1,
-0.2643547, -1.616868, -3.833813, 0, 0, 1, 1, 1,
-0.249198, -0.3220766, -3.616177, 1, 0, 0, 1, 1,
-0.2479666, -0.2878706, -2.794305, 1, 0, 0, 1, 1,
-0.2423782, -0.3548615, -1.591662, 1, 0, 0, 1, 1,
-0.2423325, -1.195743, -0.7285914, 1, 0, 0, 1, 1,
-0.237189, -1.406986, -3.494478, 1, 0, 0, 1, 1,
-0.2286882, -0.1013048, -1.28475, 0, 0, 0, 1, 1,
-0.2223408, 0.1829847, 0.1737648, 0, 0, 0, 1, 1,
-0.2217141, -0.1765693, -0.7375386, 0, 0, 0, 1, 1,
-0.2195602, 0.2892455, -0.9565436, 0, 0, 0, 1, 1,
-0.2190328, -0.0275523, -1.6521, 0, 0, 0, 1, 1,
-0.2162945, -0.545545, -2.747357, 0, 0, 0, 1, 1,
-0.2119115, 0.6796445, -0.8450679, 0, 0, 0, 1, 1,
-0.209635, 0.5423513, 0.8050629, 1, 1, 1, 1, 1,
-0.2078707, -0.5459855, -1.78231, 1, 1, 1, 1, 1,
-0.2065325, 0.7423699, 0.2730393, 1, 1, 1, 1, 1,
-0.2062382, -1.297961, -3.834568, 1, 1, 1, 1, 1,
-0.2041999, 0.2808509, -1.522267, 1, 1, 1, 1, 1,
-0.1985402, -1.146739, -4.242686, 1, 1, 1, 1, 1,
-0.1957016, 2.037704, 0.3594887, 1, 1, 1, 1, 1,
-0.183314, 0.5998857, -0.2979619, 1, 1, 1, 1, 1,
-0.1812456, -0.3810685, -3.039313, 1, 1, 1, 1, 1,
-0.1794343, 0.9103329, 0.9064664, 1, 1, 1, 1, 1,
-0.1786258, -0.5733327, -2.215221, 1, 1, 1, 1, 1,
-0.1784944, -0.6737361, -1.692315, 1, 1, 1, 1, 1,
-0.1782553, 0.5025286, -0.2913075, 1, 1, 1, 1, 1,
-0.1703646, -1.303477, -2.785874, 1, 1, 1, 1, 1,
-0.1701673, -0.6268314, -3.724489, 1, 1, 1, 1, 1,
-0.1700839, -1.021674, -1.542123, 0, 0, 1, 1, 1,
-0.1698659, 0.2391381, 0.8941687, 1, 0, 0, 1, 1,
-0.1679542, 0.2408232, -2.681084, 1, 0, 0, 1, 1,
-0.1643747, 0.334726, -0.256813, 1, 0, 0, 1, 1,
-0.157398, 0.4854327, 0.3254833, 1, 0, 0, 1, 1,
-0.1569948, 0.951938, -1.495965, 1, 0, 0, 1, 1,
-0.156805, -0.5530527, -4.151035, 0, 0, 0, 1, 1,
-0.1539299, -0.09836005, -1.076104, 0, 0, 0, 1, 1,
-0.1529836, 0.007297421, -1.375795, 0, 0, 0, 1, 1,
-0.1520325, -0.7530532, -1.908784, 0, 0, 0, 1, 1,
-0.1519637, -0.9555376, -4.347846, 0, 0, 0, 1, 1,
-0.1506853, 0.1552389, -1.75557, 0, 0, 0, 1, 1,
-0.1504092, -0.770597, -5.029261, 0, 0, 0, 1, 1,
-0.1449485, -0.9776044, -4.275546, 1, 1, 1, 1, 1,
-0.1427712, -1.793925, -2.253432, 1, 1, 1, 1, 1,
-0.1408783, -0.1863179, -1.766425, 1, 1, 1, 1, 1,
-0.1386777, 0.04775249, -1.46688, 1, 1, 1, 1, 1,
-0.1332546, -0.01869862, -1.092387, 1, 1, 1, 1, 1,
-0.1285566, -0.4151557, -1.461866, 1, 1, 1, 1, 1,
-0.1260588, -1.227899, -2.473552, 1, 1, 1, 1, 1,
-0.1235411, -1.068633, -2.444035, 1, 1, 1, 1, 1,
-0.1232504, 0.4758441, 1.338328, 1, 1, 1, 1, 1,
-0.1231512, -0.5367846, -0.8699747, 1, 1, 1, 1, 1,
-0.1216172, -0.9854097, -1.880236, 1, 1, 1, 1, 1,
-0.1210986, -0.09724077, -2.286453, 1, 1, 1, 1, 1,
-0.1154083, -1.557757, -2.469054, 1, 1, 1, 1, 1,
-0.1123557, 0.0204139, -3.04913, 1, 1, 1, 1, 1,
-0.1115361, 0.6792616, -1.30734, 1, 1, 1, 1, 1,
-0.1114451, -0.938405, -1.71207, 0, 0, 1, 1, 1,
-0.1102606, 0.2746301, -0.4008515, 1, 0, 0, 1, 1,
-0.1082259, -1.967177, -2.790387, 1, 0, 0, 1, 1,
-0.1041035, 0.7863157, 1.627377, 1, 0, 0, 1, 1,
-0.1017459, 0.8589863, -0.294818, 1, 0, 0, 1, 1,
-0.0888853, -0.5685933, -3.498503, 1, 0, 0, 1, 1,
-0.08468948, 1.396446, 0.3188987, 0, 0, 0, 1, 1,
-0.08333971, 0.0506571, -0.4005186, 0, 0, 0, 1, 1,
-0.07554, 0.5931683, -0.03832293, 0, 0, 0, 1, 1,
-0.07272374, 0.7779317, -0.2633603, 0, 0, 0, 1, 1,
-0.06967448, -1.134564, -1.490433, 0, 0, 0, 1, 1,
-0.06850085, 0.6470872, 0.03963602, 0, 0, 0, 1, 1,
-0.06615112, 0.6171049, -0.1817642, 0, 0, 0, 1, 1,
-0.06408641, -1.597361, -5.001829, 1, 1, 1, 1, 1,
-0.06215635, -0.3774292, -1.374908, 1, 1, 1, 1, 1,
-0.06215433, -0.1323987, -3.80196, 1, 1, 1, 1, 1,
-0.0618325, -0.0316976, -1.502862, 1, 1, 1, 1, 1,
-0.05620609, -0.4252977, -4.851257, 1, 1, 1, 1, 1,
-0.05275546, 1.013068, 0.8290762, 1, 1, 1, 1, 1,
-0.05093691, -1.616872, -3.083834, 1, 1, 1, 1, 1,
-0.04518542, 1.512542, -0.7716423, 1, 1, 1, 1, 1,
-0.03929903, -0.9771548, -2.101595, 1, 1, 1, 1, 1,
-0.0391739, 0.1180257, -0.8460912, 1, 1, 1, 1, 1,
-0.03614332, 0.2273532, 2.034839, 1, 1, 1, 1, 1,
-0.03420271, 0.2766988, 0.07883878, 1, 1, 1, 1, 1,
-0.03397109, -1.922002, -3.726489, 1, 1, 1, 1, 1,
-0.02773141, -0.6508219, -3.330362, 1, 1, 1, 1, 1,
-0.02716215, -1.537612, -3.140487, 1, 1, 1, 1, 1,
-0.02529069, 0.5774731, 0.01618219, 0, 0, 1, 1, 1,
-0.02468574, 0.3865398, -0.5376393, 1, 0, 0, 1, 1,
-0.02401794, 0.8113328, 0.7500912, 1, 0, 0, 1, 1,
-0.02361726, -0.4474407, -5.143285, 1, 0, 0, 1, 1,
-0.02327834, 0.8087642, 0.3979868, 1, 0, 0, 1, 1,
-0.01699424, 0.5909429, -1.614484, 1, 0, 0, 1, 1,
-0.01650429, 0.7041305, -1.920278, 0, 0, 0, 1, 1,
-0.0127187, -1.135498, -3.449037, 0, 0, 0, 1, 1,
-0.01200453, 0.02032349, -0.6199001, 0, 0, 0, 1, 1,
-0.009928892, -0.1176028, -3.412467, 0, 0, 0, 1, 1,
-0.009552055, -1.872147, -2.052264, 0, 0, 0, 1, 1,
-0.008997502, -0.8463162, -2.806979, 0, 0, 0, 1, 1,
-0.008458884, -0.8201138, -4.085792, 0, 0, 0, 1, 1,
-0.008343399, -1.671517, -3.114425, 1, 1, 1, 1, 1,
0.0009110488, 1.775429, -2.646123, 1, 1, 1, 1, 1,
0.002700047, 0.3083354, -0.8078782, 1, 1, 1, 1, 1,
0.006099361, 2.244518, 0.4676103, 1, 1, 1, 1, 1,
0.008295289, 0.8661268, -0.7135676, 1, 1, 1, 1, 1,
0.01623315, -1.951454, 4.343905, 1, 1, 1, 1, 1,
0.01678047, -0.2510031, 2.70381, 1, 1, 1, 1, 1,
0.01881662, 0.5638967, -2.167333, 1, 1, 1, 1, 1,
0.01922478, -1.239663, 4.536552, 1, 1, 1, 1, 1,
0.02036067, -0.4237891, 2.765265, 1, 1, 1, 1, 1,
0.02085879, -0.3769254, 2.672782, 1, 1, 1, 1, 1,
0.03067458, -0.8592523, 3.362242, 1, 1, 1, 1, 1,
0.03091442, -0.4841909, 1.465276, 1, 1, 1, 1, 1,
0.0343891, -2.593458, 2.915109, 1, 1, 1, 1, 1,
0.03866353, 1.29283, 1.099097, 1, 1, 1, 1, 1,
0.04459395, 1.499626, 1.689179, 0, 0, 1, 1, 1,
0.04508209, -0.2483922, 4.000859, 1, 0, 0, 1, 1,
0.04802007, -0.3570697, 1.19915, 1, 0, 0, 1, 1,
0.04973621, -0.3768726, 2.770674, 1, 0, 0, 1, 1,
0.05037968, 0.6309595, -1.380204, 1, 0, 0, 1, 1,
0.05197507, 0.4765838, 0.2231693, 1, 0, 0, 1, 1,
0.05274151, 0.1424904, 0.08111787, 0, 0, 0, 1, 1,
0.05659576, -0.4859928, 4.398649, 0, 0, 0, 1, 1,
0.05938444, -0.9165964, 2.221666, 0, 0, 0, 1, 1,
0.06375121, -0.02618859, 0.7860594, 0, 0, 0, 1, 1,
0.06658, 2.20725, 0.5326157, 0, 0, 0, 1, 1,
0.06690285, -0.37738, 3.763895, 0, 0, 0, 1, 1,
0.07013021, 1.435959, 1.094498, 0, 0, 0, 1, 1,
0.0733929, -0.3006031, 2.332911, 1, 1, 1, 1, 1,
0.07380131, 0.2901146, -0.1847766, 1, 1, 1, 1, 1,
0.07702339, -1.344564, 2.909586, 1, 1, 1, 1, 1,
0.08175235, 1.291721, -1.520504, 1, 1, 1, 1, 1,
0.08488292, -0.4697582, 3.187855, 1, 1, 1, 1, 1,
0.08745214, -1.140748, 4.33039, 1, 1, 1, 1, 1,
0.08916108, 0.467013, 0.9599724, 1, 1, 1, 1, 1,
0.09078468, 0.7845452, 0.1778492, 1, 1, 1, 1, 1,
0.09138688, -0.9837926, 3.928739, 1, 1, 1, 1, 1,
0.09382064, -0.4320397, 2.95265, 1, 1, 1, 1, 1,
0.09391998, -1.01966, 2.772829, 1, 1, 1, 1, 1,
0.09486606, -0.7689375, 2.624003, 1, 1, 1, 1, 1,
0.1059426, -0.5186718, 4.077167, 1, 1, 1, 1, 1,
0.1102761, 0.5767993, -1.124532, 1, 1, 1, 1, 1,
0.1124559, 0.7369682, 0.8696514, 1, 1, 1, 1, 1,
0.1136878, 3.081033, -1.183983, 0, 0, 1, 1, 1,
0.1155998, -0.1682215, 3.335686, 1, 0, 0, 1, 1,
0.1198683, -1.565137, 4.047189, 1, 0, 0, 1, 1,
0.120863, 0.4982848, 1.664303, 1, 0, 0, 1, 1,
0.1222199, -0.1110312, 1.430134, 1, 0, 0, 1, 1,
0.1263559, -1.873648, 2.002412, 1, 0, 0, 1, 1,
0.1268055, -0.4476287, 2.56522, 0, 0, 0, 1, 1,
0.1299412, -0.03341358, 1.781072, 0, 0, 0, 1, 1,
0.1338481, 1.633809, 0.4450874, 0, 0, 0, 1, 1,
0.1384017, -0.3815778, 4.004132, 0, 0, 0, 1, 1,
0.1391314, 0.119432, 1.410638, 0, 0, 0, 1, 1,
0.1410721, 0.01057782, 0.3204523, 0, 0, 0, 1, 1,
0.1431934, 0.0756517, 0.7346624, 0, 0, 0, 1, 1,
0.1445955, -0.8025051, 2.068367, 1, 1, 1, 1, 1,
0.1506494, -1.258124, 2.524498, 1, 1, 1, 1, 1,
0.1540159, 0.6303722, -0.7889225, 1, 1, 1, 1, 1,
0.1554163, -0.7580655, 5.809851, 1, 1, 1, 1, 1,
0.156486, -0.5841444, 4.287913, 1, 1, 1, 1, 1,
0.1569652, 0.8530275, -0.4859502, 1, 1, 1, 1, 1,
0.1598432, 0.01362911, 2.317544, 1, 1, 1, 1, 1,
0.1603053, 0.3626273, 1.050228, 1, 1, 1, 1, 1,
0.1626152, 0.6608971, 0.118997, 1, 1, 1, 1, 1,
0.1670401, 0.3665104, 1.816938, 1, 1, 1, 1, 1,
0.1681146, 0.8126656, -0.3301922, 1, 1, 1, 1, 1,
0.1701346, 1.545016, 0.5348042, 1, 1, 1, 1, 1,
0.1719775, 0.3094473, -0.8925577, 1, 1, 1, 1, 1,
0.1741201, 1.451586, -0.137783, 1, 1, 1, 1, 1,
0.1761531, 1.685465, 1.332166, 1, 1, 1, 1, 1,
0.1762839, 0.5137519, -0.8375279, 0, 0, 1, 1, 1,
0.1778759, -0.8877773, 3.462999, 1, 0, 0, 1, 1,
0.1794512, -1.380844, 2.294047, 1, 0, 0, 1, 1,
0.1831772, 0.7295366, -0.009031489, 1, 0, 0, 1, 1,
0.1872755, -2.030913, 2.226401, 1, 0, 0, 1, 1,
0.195035, -1.72616, 2.157551, 1, 0, 0, 1, 1,
0.1966666, -1.096936, 2.001643, 0, 0, 0, 1, 1,
0.1989173, -0.7477577, 1.18236, 0, 0, 0, 1, 1,
0.2017107, 0.3859209, 0.08443796, 0, 0, 0, 1, 1,
0.2058116, -0.9275556, 2.8786, 0, 0, 0, 1, 1,
0.2104446, 0.3051993, 1.452386, 0, 0, 0, 1, 1,
0.2158582, 1.431298, 0.7288299, 0, 0, 0, 1, 1,
0.2267679, 0.6201257, 1.319611, 0, 0, 0, 1, 1,
0.2282769, 0.6264222, -1.049095, 1, 1, 1, 1, 1,
0.2283586, 0.8446368, 0.9273255, 1, 1, 1, 1, 1,
0.2297472, 1.252643, -0.439496, 1, 1, 1, 1, 1,
0.2333431, 0.5398853, -0.4977206, 1, 1, 1, 1, 1,
0.2341262, 1.350975, -0.6709044, 1, 1, 1, 1, 1,
0.2345816, -0.6544619, 2.314677, 1, 1, 1, 1, 1,
0.2361771, -0.8557021, 4.814485, 1, 1, 1, 1, 1,
0.2424208, -0.5972291, 2.949119, 1, 1, 1, 1, 1,
0.2424814, -0.3982928, 2.330654, 1, 1, 1, 1, 1,
0.2460737, -0.5589083, 2.1638, 1, 1, 1, 1, 1,
0.2472746, -1.153542, 3.312092, 1, 1, 1, 1, 1,
0.248947, -0.5154903, 2.382983, 1, 1, 1, 1, 1,
0.2553587, -0.1003183, 2.151308, 1, 1, 1, 1, 1,
0.2568294, -1.350012, 2.773995, 1, 1, 1, 1, 1,
0.2598599, 0.7102222, 1.344648, 1, 1, 1, 1, 1,
0.2659995, -1.070462, 3.296281, 0, 0, 1, 1, 1,
0.2666892, -0.3548147, 2.725278, 1, 0, 0, 1, 1,
0.2707884, 0.7515624, -0.4563791, 1, 0, 0, 1, 1,
0.2722146, 0.07593504, 2.30819, 1, 0, 0, 1, 1,
0.273963, 0.2729039, 0.3168716, 1, 0, 0, 1, 1,
0.2753167, 0.6700355, -0.216246, 1, 0, 0, 1, 1,
0.2792968, 0.2131678, -0.350113, 0, 0, 0, 1, 1,
0.2836283, -1.195724, 3.119042, 0, 0, 0, 1, 1,
0.2837428, -0.003010029, 0.01803872, 0, 0, 0, 1, 1,
0.2859606, -1.783433, 2.508489, 0, 0, 0, 1, 1,
0.2900915, 0.2092472, 1.470384, 0, 0, 0, 1, 1,
0.2922347, 0.5621029, 2.166852, 0, 0, 0, 1, 1,
0.2923135, -0.3746033, 1.582033, 0, 0, 0, 1, 1,
0.2940888, -0.5199546, 3.170332, 1, 1, 1, 1, 1,
0.2973017, -0.5005595, 2.654471, 1, 1, 1, 1, 1,
0.2975249, -0.9929754, 2.435107, 1, 1, 1, 1, 1,
0.2981944, 1.126005, 0.8038596, 1, 1, 1, 1, 1,
0.298685, 0.8931559, -0.1157273, 1, 1, 1, 1, 1,
0.2992206, 1.582312, 1.155736, 1, 1, 1, 1, 1,
0.2998297, 2.101794, -0.4944866, 1, 1, 1, 1, 1,
0.3041222, 0.6818575, 0.4426755, 1, 1, 1, 1, 1,
0.3041658, -0.622655, 1.859233, 1, 1, 1, 1, 1,
0.3060429, 0.8530636, 0.4573894, 1, 1, 1, 1, 1,
0.3077538, -1.255011, 1.143449, 1, 1, 1, 1, 1,
0.3086662, 1.514284, 0.898622, 1, 1, 1, 1, 1,
0.3087432, -0.1149371, 1.610766, 1, 1, 1, 1, 1,
0.311285, 0.2851844, 0.6802901, 1, 1, 1, 1, 1,
0.3117291, 0.2808903, 1.672263, 1, 1, 1, 1, 1,
0.3154776, -1.139132, 3.13333, 0, 0, 1, 1, 1,
0.317983, -1.072279, 2.860571, 1, 0, 0, 1, 1,
0.319762, -0.4374885, 1.865669, 1, 0, 0, 1, 1,
0.320953, 0.5844714, 0.12773, 1, 0, 0, 1, 1,
0.3268691, -0.2811491, 0.9002759, 1, 0, 0, 1, 1,
0.3269893, 0.4912949, 1.683414, 1, 0, 0, 1, 1,
0.3302837, 0.1541906, 1.47794, 0, 0, 0, 1, 1,
0.3366565, -0.4521798, 1.484888, 0, 0, 0, 1, 1,
0.3370264, 0.1820614, 2.352039, 0, 0, 0, 1, 1,
0.3378507, -1.069499, 3.183646, 0, 0, 0, 1, 1,
0.3392682, 1.004138, 0.01404409, 0, 0, 0, 1, 1,
0.3396181, 0.0848982, 2.071811, 0, 0, 0, 1, 1,
0.3500584, 0.4523412, -0.2913757, 0, 0, 0, 1, 1,
0.3522398, 0.5519236, 0.595357, 1, 1, 1, 1, 1,
0.352268, -0.2957852, 3.63466, 1, 1, 1, 1, 1,
0.3536704, 0.9830126, -0.4488245, 1, 1, 1, 1, 1,
0.3540332, -1.313716, 4.436954, 1, 1, 1, 1, 1,
0.3572074, 1.549991, 0.101971, 1, 1, 1, 1, 1,
0.3589258, -0.5664095, 2.88921, 1, 1, 1, 1, 1,
0.3630129, 0.1359787, 1.789196, 1, 1, 1, 1, 1,
0.3655356, 1.052041, 0.2502255, 1, 1, 1, 1, 1,
0.3669126, 0.6660953, 1.412399, 1, 1, 1, 1, 1,
0.3679653, 1.840981, -1.316389, 1, 1, 1, 1, 1,
0.3708149, 1.717428, 0.4726594, 1, 1, 1, 1, 1,
0.3713813, -2.275388, 1.647216, 1, 1, 1, 1, 1,
0.3761359, 0.4175868, 0.5238596, 1, 1, 1, 1, 1,
0.3767617, -1.467858, 2.937114, 1, 1, 1, 1, 1,
0.3834149, -0.375862, 1.850164, 1, 1, 1, 1, 1,
0.3840304, 1.046307, 2.149157, 0, 0, 1, 1, 1,
0.3869349, 0.8077925, -1.152669, 1, 0, 0, 1, 1,
0.3890664, -0.5695857, 2.408956, 1, 0, 0, 1, 1,
0.3892222, -1.988051, 2.707103, 1, 0, 0, 1, 1,
0.3914009, -0.1156244, 0.7791083, 1, 0, 0, 1, 1,
0.3914808, 1.331249, -0.1370569, 1, 0, 0, 1, 1,
0.3928225, -0.4748086, 4.897215, 0, 0, 0, 1, 1,
0.3960739, -0.3617195, 3.751206, 0, 0, 0, 1, 1,
0.396419, -1.646406, 3.391306, 0, 0, 0, 1, 1,
0.3972819, -1.745526, 4.173003, 0, 0, 0, 1, 1,
0.3983473, 0.8182157, -0.7762045, 0, 0, 0, 1, 1,
0.3991361, 0.5487064, 0.560684, 0, 0, 0, 1, 1,
0.4012959, 0.09703148, 1.323738, 0, 0, 0, 1, 1,
0.4013549, -1.127506, 3.496936, 1, 1, 1, 1, 1,
0.4021839, -1.047193, 2.933872, 1, 1, 1, 1, 1,
0.4093751, 1.315628, 0.8355412, 1, 1, 1, 1, 1,
0.4111018, -1.377221, 4.249004, 1, 1, 1, 1, 1,
0.4250095, -0.6901817, 4.811172, 1, 1, 1, 1, 1,
0.4255013, -0.9094592, 1.896678, 1, 1, 1, 1, 1,
0.4268662, 0.2033301, 1.965135, 1, 1, 1, 1, 1,
0.4307559, -1.231233, 3.625779, 1, 1, 1, 1, 1,
0.4308178, -0.6572257, 2.789751, 1, 1, 1, 1, 1,
0.4315924, -1.321604, 1.849971, 1, 1, 1, 1, 1,
0.4324772, 1.64727, 0.394033, 1, 1, 1, 1, 1,
0.4350899, 0.4689533, 0.104117, 1, 1, 1, 1, 1,
0.4373322, -0.632383, 1.318864, 1, 1, 1, 1, 1,
0.4389776, 0.02621747, 1.069181, 1, 1, 1, 1, 1,
0.4399501, 1.258788, 0.1645591, 1, 1, 1, 1, 1,
0.4491583, 0.9697247, -0.2595124, 0, 0, 1, 1, 1,
0.4520116, 0.09482269, 1.139303, 1, 0, 0, 1, 1,
0.4542851, 1.138416, 1.384817, 1, 0, 0, 1, 1,
0.4544892, -0.2769319, 2.026435, 1, 0, 0, 1, 1,
0.4554157, -2.237813, 2.438377, 1, 0, 0, 1, 1,
0.4570182, 0.2940756, -0.3526748, 1, 0, 0, 1, 1,
0.4611552, 0.1872835, -0.2260717, 0, 0, 0, 1, 1,
0.4692504, 2.46831, 0.9208375, 0, 0, 0, 1, 1,
0.4702386, 1.436461, -0.003698926, 0, 0, 0, 1, 1,
0.4709684, 1.324183, -0.2695539, 0, 0, 0, 1, 1,
0.4736737, -1.522571, 1.634592, 0, 0, 0, 1, 1,
0.4747395, -0.9136313, 2.783276, 0, 0, 0, 1, 1,
0.4762253, -1.565875, 2.023473, 0, 0, 0, 1, 1,
0.4772287, 0.0135664, 1.391093, 1, 1, 1, 1, 1,
0.4821195, -0.6949557, 1.998638, 1, 1, 1, 1, 1,
0.4833598, 0.5169321, -0.7585367, 1, 1, 1, 1, 1,
0.4845248, 0.648125, -1.211264, 1, 1, 1, 1, 1,
0.4859812, 1.404429, 1.196372, 1, 1, 1, 1, 1,
0.4883513, 0.4968161, 0.3869219, 1, 1, 1, 1, 1,
0.5022885, 1.768278, 0.3254308, 1, 1, 1, 1, 1,
0.5036044, -0.6619721, 0.2234077, 1, 1, 1, 1, 1,
0.5044173, -0.745235, 1.236917, 1, 1, 1, 1, 1,
0.5054817, -1.864908, 3.858941, 1, 1, 1, 1, 1,
0.506257, 1.046806, -0.7208949, 1, 1, 1, 1, 1,
0.5076012, -0.31507, 2.792644, 1, 1, 1, 1, 1,
0.5118811, 0.3415355, 2.252982, 1, 1, 1, 1, 1,
0.5140186, -0.346999, 0.7477242, 1, 1, 1, 1, 1,
0.5162577, -2.111146, 3.722548, 1, 1, 1, 1, 1,
0.5174013, -1.907846, 2.321576, 0, 0, 1, 1, 1,
0.5175182, -0.8464298, 4.434877, 1, 0, 0, 1, 1,
0.5215738, -0.663492, 1.560819, 1, 0, 0, 1, 1,
0.5218383, 0.84863, 0.3637232, 1, 0, 0, 1, 1,
0.5222241, 1.591555, -0.6700118, 1, 0, 0, 1, 1,
0.5237784, 0.1596669, 2.911403, 1, 0, 0, 1, 1,
0.5239467, -0.1381008, 2.164102, 0, 0, 0, 1, 1,
0.5275853, -0.6032335, 2.713934, 0, 0, 0, 1, 1,
0.5282738, 0.6308017, 1.956374, 0, 0, 0, 1, 1,
0.5283344, 0.8205618, -1.733985, 0, 0, 0, 1, 1,
0.5295968, 0.2922128, 1.277454, 0, 0, 0, 1, 1,
0.5332492, 0.1075085, 1.325506, 0, 0, 0, 1, 1,
0.5359346, 1.048805, 1.807782, 0, 0, 0, 1, 1,
0.5373375, -0.530364, 1.87731, 1, 1, 1, 1, 1,
0.5377292, 3.12034, 0.02830233, 1, 1, 1, 1, 1,
0.5450314, -2.102031, 3.949839, 1, 1, 1, 1, 1,
0.547351, 0.3325505, -0.339509, 1, 1, 1, 1, 1,
0.5506201, 0.6849009, 1.123971, 1, 1, 1, 1, 1,
0.5515791, -1.082867, 3.613374, 1, 1, 1, 1, 1,
0.5542573, -0.7646876, 3.769456, 1, 1, 1, 1, 1,
0.5550276, 0.2104958, 3.822546, 1, 1, 1, 1, 1,
0.5555688, 0.4520148, -0.1602913, 1, 1, 1, 1, 1,
0.5560085, 0.2799597, 0.2555675, 1, 1, 1, 1, 1,
0.556208, -1.306813, 2.267751, 1, 1, 1, 1, 1,
0.5592096, -0.1588864, 0.9851822, 1, 1, 1, 1, 1,
0.5645278, 0.3046889, 1.179953, 1, 1, 1, 1, 1,
0.5656171, 0.5305895, 0.5309178, 1, 1, 1, 1, 1,
0.57027, 0.5216741, 0.5749006, 1, 1, 1, 1, 1,
0.5703998, -0.06773376, 1.279429, 0, 0, 1, 1, 1,
0.5735964, -1.349779, 2.398824, 1, 0, 0, 1, 1,
0.5736163, -1.074025, 2.762113, 1, 0, 0, 1, 1,
0.5749698, -0.8381693, 1.595855, 1, 0, 0, 1, 1,
0.5754886, -0.1903914, 3.110738, 1, 0, 0, 1, 1,
0.5759279, -0.9923501, 2.194687, 1, 0, 0, 1, 1,
0.5793672, 0.1182668, 2.334382, 0, 0, 0, 1, 1,
0.5821545, 0.346901, 1.902512, 0, 0, 0, 1, 1,
0.5843659, 0.3448011, 1.267217, 0, 0, 0, 1, 1,
0.5852981, 0.8159853, 1.600934, 0, 0, 0, 1, 1,
0.5890623, -0.9125023, 4.619392, 0, 0, 0, 1, 1,
0.5963489, -0.7528379, 2.548763, 0, 0, 0, 1, 1,
0.5976272, -3.061019, 3.414751, 0, 0, 0, 1, 1,
0.6014356, -0.6602127, 1.827248, 1, 1, 1, 1, 1,
0.6070241, 1.342706, -0.02810635, 1, 1, 1, 1, 1,
0.614581, 1.597466, 0.4523986, 1, 1, 1, 1, 1,
0.6249893, -0.4445515, 2.441952, 1, 1, 1, 1, 1,
0.6264296, -1.36484, 3.25956, 1, 1, 1, 1, 1,
0.6269034, 1.375553, -0.4977497, 1, 1, 1, 1, 1,
0.6275607, -0.4994662, -0.07561336, 1, 1, 1, 1, 1,
0.6277781, 1.568327, 1.515757, 1, 1, 1, 1, 1,
0.6279812, -1.082968, 3.877766, 1, 1, 1, 1, 1,
0.628523, 1.274438, 0.876238, 1, 1, 1, 1, 1,
0.6290681, 0.4736741, 1.591165, 1, 1, 1, 1, 1,
0.6302288, -0.7459205, 0.6756819, 1, 1, 1, 1, 1,
0.6316252, -1.255616, 2.305751, 1, 1, 1, 1, 1,
0.6342214, -0.8607498, 3.223705, 1, 1, 1, 1, 1,
0.6366259, 1.267972, 0.8818435, 1, 1, 1, 1, 1,
0.6431142, 1.025751, 0.4458447, 0, 0, 1, 1, 1,
0.6486169, 1.440537, 1.691345, 1, 0, 0, 1, 1,
0.650027, 0.2053227, 2.542161, 1, 0, 0, 1, 1,
0.6501753, -0.2580028, 3.071407, 1, 0, 0, 1, 1,
0.6502155, 0.3619022, 1.251883, 1, 0, 0, 1, 1,
0.6548522, 1.646009, -0.4922302, 1, 0, 0, 1, 1,
0.6557778, -1.595647, 4.018966, 0, 0, 0, 1, 1,
0.6667987, -0.6940707, 3.307119, 0, 0, 0, 1, 1,
0.6670417, 0.5298637, 2.056869, 0, 0, 0, 1, 1,
0.669827, -0.6357572, 2.222055, 0, 0, 0, 1, 1,
0.6731389, 0.8257351, 0.8935827, 0, 0, 0, 1, 1,
0.673375, 1.729857, 2.3701, 0, 0, 0, 1, 1,
0.6747961, -0.6501416, 2.121274, 0, 0, 0, 1, 1,
0.6753456, -0.9049395, 3.948361, 1, 1, 1, 1, 1,
0.6766936, -0.116881, 1.672485, 1, 1, 1, 1, 1,
0.6862242, 0.1448222, 1.403512, 1, 1, 1, 1, 1,
0.6889111, -2.037319, 2.439453, 1, 1, 1, 1, 1,
0.6920559, -0.3941324, 3.537904, 1, 1, 1, 1, 1,
0.6934688, -0.838984, 3.218781, 1, 1, 1, 1, 1,
0.6961056, -0.2337815, 3.3978, 1, 1, 1, 1, 1,
0.696823, -1.162966, 0.02276324, 1, 1, 1, 1, 1,
0.6981679, -0.3586171, 2.81225, 1, 1, 1, 1, 1,
0.7003283, -0.5433965, 1.810761, 1, 1, 1, 1, 1,
0.7010837, -1.342018, 3.887081, 1, 1, 1, 1, 1,
0.7026681, -0.02344266, 2.343323, 1, 1, 1, 1, 1,
0.7111892, -0.3249381, 3.172127, 1, 1, 1, 1, 1,
0.7124393, -0.6594263, 1.775463, 1, 1, 1, 1, 1,
0.7127624, -0.4772831, 0.8723113, 1, 1, 1, 1, 1,
0.7133338, -0.7029965, 2.074278, 0, 0, 1, 1, 1,
0.7144772, -2.203559, 2.751192, 1, 0, 0, 1, 1,
0.7160887, 1.11249, -1.437336, 1, 0, 0, 1, 1,
0.7166752, -0.5842419, 2.57971, 1, 0, 0, 1, 1,
0.7212284, 0.7664129, -0.2192156, 1, 0, 0, 1, 1,
0.7226862, -1.487356, 2.149389, 1, 0, 0, 1, 1,
0.7300008, -0.8627648, 3.495242, 0, 0, 0, 1, 1,
0.7348771, 0.07727954, 0.1948492, 0, 0, 0, 1, 1,
0.7460731, 0.107455, 2.720223, 0, 0, 0, 1, 1,
0.748201, -0.6151581, 2.082565, 0, 0, 0, 1, 1,
0.7508584, 0.3684453, 0.6487679, 0, 0, 0, 1, 1,
0.7510054, -0.05393055, 0.7395378, 0, 0, 0, 1, 1,
0.7510526, 1.600618, 1.769226, 0, 0, 0, 1, 1,
0.7538052, -0.7091544, 0.5563948, 1, 1, 1, 1, 1,
0.7595173, -0.677665, 2.858335, 1, 1, 1, 1, 1,
0.7715635, -0.2284311, 1.103574, 1, 1, 1, 1, 1,
0.7751179, 0.9815641, 1.147083, 1, 1, 1, 1, 1,
0.7763414, 1.97252, 1.142282, 1, 1, 1, 1, 1,
0.7905509, -0.2876662, 0.5942159, 1, 1, 1, 1, 1,
0.7906198, 0.003108702, 1.475446, 1, 1, 1, 1, 1,
0.792954, -0.1454067, 1.875267, 1, 1, 1, 1, 1,
0.7935291, -1.930873, 1.761054, 1, 1, 1, 1, 1,
0.7954915, -0.480734, 1.652037, 1, 1, 1, 1, 1,
0.7978564, -1.310214, 1.630132, 1, 1, 1, 1, 1,
0.8000991, 0.973488, 0.02252479, 1, 1, 1, 1, 1,
0.8122077, 1.387361, 2.077943, 1, 1, 1, 1, 1,
0.8140867, 0.2229185, 2.977707, 1, 1, 1, 1, 1,
0.8163574, 1.268285, 0.2717294, 1, 1, 1, 1, 1,
0.8183126, 0.8719067, 0.7426941, 0, 0, 1, 1, 1,
0.8267311, -0.5011702, 1.727827, 1, 0, 0, 1, 1,
0.8282391, -0.8321162, 4.908175, 1, 0, 0, 1, 1,
0.8289446, -0.1217296, 1.574385, 1, 0, 0, 1, 1,
0.8364747, 0.1167319, -0.84594, 1, 0, 0, 1, 1,
0.8412691, 0.9814362, 1.895882, 1, 0, 0, 1, 1,
0.8431045, 0.2625087, 0.6861267, 0, 0, 0, 1, 1,
0.8431184, -1.103453, 2.39476, 0, 0, 0, 1, 1,
0.8441883, -0.2451172, 1.906939, 0, 0, 0, 1, 1,
0.8451864, 1.513094, 0.8873774, 0, 0, 0, 1, 1,
0.8525065, -2.210319, 3.802825, 0, 0, 0, 1, 1,
0.8556217, -1.180154, 3.97236, 0, 0, 0, 1, 1,
0.8558636, -0.9398462, 1.480419, 0, 0, 0, 1, 1,
0.8600064, 1.560931, -0.4935769, 1, 1, 1, 1, 1,
0.8646964, 0.7961653, -0.50413, 1, 1, 1, 1, 1,
0.8708894, -0.93739, 2.040092, 1, 1, 1, 1, 1,
0.8744757, -2.079104, 1.635037, 1, 1, 1, 1, 1,
0.8785952, -1.458453, 1.740157, 1, 1, 1, 1, 1,
0.8883773, -0.2263719, 0.2495882, 1, 1, 1, 1, 1,
0.8899679, -0.4515479, 2.122544, 1, 1, 1, 1, 1,
0.8906338, -1.101527, 3.699131, 1, 1, 1, 1, 1,
0.89132, -1.909046, 3.252568, 1, 1, 1, 1, 1,
0.8949606, -1.144806, 1.874338, 1, 1, 1, 1, 1,
0.8950048, 0.0505853, 2.771423, 1, 1, 1, 1, 1,
0.8960558, -0.1813557, -1.247113, 1, 1, 1, 1, 1,
0.9080321, 0.2087636, -0.05016224, 1, 1, 1, 1, 1,
0.9085305, -1.680416, 2.206144, 1, 1, 1, 1, 1,
0.9145637, -1.365265, 2.033808, 1, 1, 1, 1, 1,
0.9153976, -0.6078392, 2.79221, 0, 0, 1, 1, 1,
0.9167602, -0.3034882, 2.634262, 1, 0, 0, 1, 1,
0.9195241, 0.5128978, 3.045289, 1, 0, 0, 1, 1,
0.9285131, -1.00807, 1.986983, 1, 0, 0, 1, 1,
0.9337695, -0.8669046, 1.673373, 1, 0, 0, 1, 1,
0.9373177, -0.6888823, 2.535109, 1, 0, 0, 1, 1,
0.9414207, -0.2045243, 2.631241, 0, 0, 0, 1, 1,
0.9507071, -0.7847032, 2.42217, 0, 0, 0, 1, 1,
0.9544602, 0.5231442, 0.2779172, 0, 0, 0, 1, 1,
0.9585965, 1.995458, -1.690307, 0, 0, 0, 1, 1,
0.9591884, -0.7673968, 1.398199, 0, 0, 0, 1, 1,
0.9638309, -1.285339, 1.461955, 0, 0, 0, 1, 1,
0.9642, -1.092869, 0.6936813, 0, 0, 0, 1, 1,
0.9655803, -1.014735, 2.100221, 1, 1, 1, 1, 1,
0.976845, -0.8246282, 2.179069, 1, 1, 1, 1, 1,
0.98016, -1.106062, 2.665988, 1, 1, 1, 1, 1,
0.9896812, -0.8024868, 3.081345, 1, 1, 1, 1, 1,
0.9906934, 1.049919, 0.921834, 1, 1, 1, 1, 1,
0.9920596, 0.4225587, 0.8925943, 1, 1, 1, 1, 1,
1.016019, 0.2450191, 3.26349, 1, 1, 1, 1, 1,
1.021568, -1.112832, 3.253752, 1, 1, 1, 1, 1,
1.023157, -1.176779, 1.798079, 1, 1, 1, 1, 1,
1.027899, 2.208367, 0.4884073, 1, 1, 1, 1, 1,
1.038485, -1.750827, 2.091755, 1, 1, 1, 1, 1,
1.050728, -0.8459146, 3.313456, 1, 1, 1, 1, 1,
1.050791, 0.8269493, 0.2385759, 1, 1, 1, 1, 1,
1.051587, -0.7976184, -0.02759226, 1, 1, 1, 1, 1,
1.062389, 0.9413847, -0.472925, 1, 1, 1, 1, 1,
1.069244, 0.1491975, -0.2474505, 0, 0, 1, 1, 1,
1.073168, -1.593836, 1.53801, 1, 0, 0, 1, 1,
1.089206, -1.363196, 3.822306, 1, 0, 0, 1, 1,
1.092133, 2.269897, -0.3042289, 1, 0, 0, 1, 1,
1.101185, -2.120703, 2.362766, 1, 0, 0, 1, 1,
1.105411, 0.496687, -0.4586219, 1, 0, 0, 1, 1,
1.108039, 0.1989242, 1.074543, 0, 0, 0, 1, 1,
1.108425, -0.7445385, 3.597705, 0, 0, 0, 1, 1,
1.110604, -0.8750917, 1.85833, 0, 0, 0, 1, 1,
1.11826, -1.218803, 2.43621, 0, 0, 0, 1, 1,
1.120817, -0.1276992, 1.730046, 0, 0, 0, 1, 1,
1.12741, 0.3862914, 1.267309, 0, 0, 0, 1, 1,
1.131807, -1.804365, 1.498718, 0, 0, 0, 1, 1,
1.136834, -0.5137144, 1.907102, 1, 1, 1, 1, 1,
1.142396, 2.026921, 1.128515, 1, 1, 1, 1, 1,
1.144372, 0.5705047, 0.3045067, 1, 1, 1, 1, 1,
1.147656, 1.123935, 1.776148, 1, 1, 1, 1, 1,
1.150815, 1.059921, 1.751765, 1, 1, 1, 1, 1,
1.151008, 0.2950734, 2.108756, 1, 1, 1, 1, 1,
1.155298, 1.476233, 1.198238, 1, 1, 1, 1, 1,
1.162627, 0.2080753, 0.4601242, 1, 1, 1, 1, 1,
1.16361, 0.3501422, 0.6926907, 1, 1, 1, 1, 1,
1.165819, -2.955797, 2.456005, 1, 1, 1, 1, 1,
1.198632, -1.134131, 2.598443, 1, 1, 1, 1, 1,
1.200175, 0.2174829, -0.468463, 1, 1, 1, 1, 1,
1.20077, -0.7798473, 2.971323, 1, 1, 1, 1, 1,
1.209609, -0.4656102, 2.441235, 1, 1, 1, 1, 1,
1.217696, 0.2284484, 0.4102338, 1, 1, 1, 1, 1,
1.223586, -0.04407548, 2.219243, 0, 0, 1, 1, 1,
1.223855, 1.475519, -0.9968325, 1, 0, 0, 1, 1,
1.224914, -0.3490787, 1.002693, 1, 0, 0, 1, 1,
1.231177, -0.7422296, 2.554879, 1, 0, 0, 1, 1,
1.232217, -0.8441194, 1.157501, 1, 0, 0, 1, 1,
1.234098, -1.373778, 2.064576, 1, 0, 0, 1, 1,
1.23469, 0.007825587, 1.222225, 0, 0, 0, 1, 1,
1.238732, 0.1225518, 1.710463, 0, 0, 0, 1, 1,
1.245846, 0.8626409, 0.4450391, 0, 0, 0, 1, 1,
1.246836, -1.344829, 1.435786, 0, 0, 0, 1, 1,
1.24903, 1.430671, 2.113954, 0, 0, 0, 1, 1,
1.250398, -1.015319, 1.723914, 0, 0, 0, 1, 1,
1.251183, -0.7342083, 2.421495, 0, 0, 0, 1, 1,
1.251816, 0.1829707, 0.3985113, 1, 1, 1, 1, 1,
1.254149, -1.860245, 2.713611, 1, 1, 1, 1, 1,
1.25753, 0.5298811, 2.831993, 1, 1, 1, 1, 1,
1.258456, 0.6426694, 1.077398, 1, 1, 1, 1, 1,
1.259262, -0.9984797, 2.874086, 1, 1, 1, 1, 1,
1.267541, -0.8039339, 2.275778, 1, 1, 1, 1, 1,
1.268583, -1.36288, 3.484681, 1, 1, 1, 1, 1,
1.273185, 0.4135003, 0.5994141, 1, 1, 1, 1, 1,
1.27363, 1.863795, 1.12835, 1, 1, 1, 1, 1,
1.287747, 0.9687082, 1.533525, 1, 1, 1, 1, 1,
1.297399, 1.161381, 1.114818, 1, 1, 1, 1, 1,
1.297642, -0.3486107, 1.404611, 1, 1, 1, 1, 1,
1.29842, -1.487908, 1.973948, 1, 1, 1, 1, 1,
1.320421, -0.7634647, 2.428875, 1, 1, 1, 1, 1,
1.325707, -0.03953211, 2.788503, 1, 1, 1, 1, 1,
1.32575, 0.7858036, -0.270169, 0, 0, 1, 1, 1,
1.335647, 0.001322131, 2.115239, 1, 0, 0, 1, 1,
1.341724, 0.9177778, 0.9268343, 1, 0, 0, 1, 1,
1.346635, -0.6045045, 2.216383, 1, 0, 0, 1, 1,
1.350633, -1.709896, 1.456856, 1, 0, 0, 1, 1,
1.358028, -1.193068, 2.227322, 1, 0, 0, 1, 1,
1.359896, 0.8750532, -0.1624616, 0, 0, 0, 1, 1,
1.360244, -1.3051, 1.815913, 0, 0, 0, 1, 1,
1.365466, -0.8809894, 2.566997, 0, 0, 0, 1, 1,
1.372475, 0.786263, -0.2303981, 0, 0, 0, 1, 1,
1.373935, 0.6299242, 2.573058, 0, 0, 0, 1, 1,
1.379945, -0.8253025, 2.464057, 0, 0, 0, 1, 1,
1.382159, -0.9008116, 2.586518, 0, 0, 0, 1, 1,
1.390234, -1.39417, 2.115433, 1, 1, 1, 1, 1,
1.395118, 1.931405, 1.281117, 1, 1, 1, 1, 1,
1.403688, 0.9442147, 2.079416, 1, 1, 1, 1, 1,
1.407267, 1.051818, 2.04484, 1, 1, 1, 1, 1,
1.411939, 0.9770579, -0.4462652, 1, 1, 1, 1, 1,
1.412275, 0.0683134, 1.051917, 1, 1, 1, 1, 1,
1.431645, -1.021371, 3.617509, 1, 1, 1, 1, 1,
1.438154, -1.37418, 1.661886, 1, 1, 1, 1, 1,
1.443179, 2.108896, -1.093418, 1, 1, 1, 1, 1,
1.453648, -0.7088837, 3.123846, 1, 1, 1, 1, 1,
1.456634, 0.6279794, 0.8038034, 1, 1, 1, 1, 1,
1.465309, 0.8057963, 0.3801795, 1, 1, 1, 1, 1,
1.479626, 0.07343833, 1.100243, 1, 1, 1, 1, 1,
1.486942, -1.281505, 1.110078, 1, 1, 1, 1, 1,
1.513214, -0.5232614, 0.8120956, 1, 1, 1, 1, 1,
1.521633, 0.7682907, 1.774105, 0, 0, 1, 1, 1,
1.523942, -1.112673, 0.7897273, 1, 0, 0, 1, 1,
1.535118, 0.4333155, 0.3675975, 1, 0, 0, 1, 1,
1.553473, 0.4270239, 3.61551, 1, 0, 0, 1, 1,
1.567561, -0.06134979, 1.847506, 1, 0, 0, 1, 1,
1.568669, 1.292882, 0.5633418, 1, 0, 0, 1, 1,
1.570276, -0.2454608, 1.323658, 0, 0, 0, 1, 1,
1.58093, 0.966408, -0.76365, 0, 0, 0, 1, 1,
1.618047, 1.490562, 0.449919, 0, 0, 0, 1, 1,
1.621104, 1.192757, 0.1503365, 0, 0, 0, 1, 1,
1.62733, -1.045871, 2.322719, 0, 0, 0, 1, 1,
1.633814, -1.904822, 4.84745, 0, 0, 0, 1, 1,
1.636974, -0.6187615, 0.946246, 0, 0, 0, 1, 1,
1.637026, 0.9775207, 2.245015, 1, 1, 1, 1, 1,
1.638562, 0.3262115, 1.611419, 1, 1, 1, 1, 1,
1.638769, -0.1765637, 1.479245, 1, 1, 1, 1, 1,
1.650335, 1.29252, 1.376898, 1, 1, 1, 1, 1,
1.677882, -0.2158222, -0.59712, 1, 1, 1, 1, 1,
1.681138, 0.7273412, 1.967928, 1, 1, 1, 1, 1,
1.729872, 1.062223, 2.054807, 1, 1, 1, 1, 1,
1.757606, -1.968709, 2.645685, 1, 1, 1, 1, 1,
1.769005, 0.5440254, 3.389091, 1, 1, 1, 1, 1,
1.787414, -0.7057593, 0.4574404, 1, 1, 1, 1, 1,
1.796612, 1.676371, 1.3984, 1, 1, 1, 1, 1,
1.802155, 0.1855696, 1.313969, 1, 1, 1, 1, 1,
1.805996, -1.062685, 2.117093, 1, 1, 1, 1, 1,
1.81058, 1.507291, 2.407588, 1, 1, 1, 1, 1,
1.81964, 0.6620228, 1.444757, 1, 1, 1, 1, 1,
1.826303, -1.295577, 2.505055, 0, 0, 1, 1, 1,
1.83775, -0.5761169, 2.352469, 1, 0, 0, 1, 1,
1.839455, -0.986429, 2.511906, 1, 0, 0, 1, 1,
1.865239, -1.799404, 3.939289, 1, 0, 0, 1, 1,
1.874668, 0.6293553, 2.1869, 1, 0, 0, 1, 1,
1.883241, -0.3418705, 1.343021, 1, 0, 0, 1, 1,
1.883453, -0.76257, 1.738374, 0, 0, 0, 1, 1,
1.886967, 0.8728483, 0.4063799, 0, 0, 0, 1, 1,
1.897667, 0.9983748, 1.208999, 0, 0, 0, 1, 1,
1.898976, -0.7978545, 2.701964, 0, 0, 0, 1, 1,
1.908565, 0.6464155, 1.261595, 0, 0, 0, 1, 1,
1.919174, -0.3532968, 2.135143, 0, 0, 0, 1, 1,
1.925058, 0.934675, 0.8026538, 0, 0, 0, 1, 1,
1.925333, -0.8899087, 3.130884, 1, 1, 1, 1, 1,
1.93513, 0.3567254, 1.865724, 1, 1, 1, 1, 1,
1.955125, -0.003928219, -0.5185959, 1, 1, 1, 1, 1,
1.960128, -0.1696741, 1.348398, 1, 1, 1, 1, 1,
1.971739, -0.37419, 1.687694, 1, 1, 1, 1, 1,
1.972537, -0.3889835, 2.602157, 1, 1, 1, 1, 1,
1.994681, -0.7055184, 1.958017, 1, 1, 1, 1, 1,
2.006128, -1.760419, 4.280262, 1, 1, 1, 1, 1,
2.011878, -0.3260112, -0.6601208, 1, 1, 1, 1, 1,
2.037715, 1.662135, 1.536341, 1, 1, 1, 1, 1,
2.065225, 2.56838, 2.65629, 1, 1, 1, 1, 1,
2.098054, -0.668152, 2.499397, 1, 1, 1, 1, 1,
2.135224, -1.341217, 1.180887, 1, 1, 1, 1, 1,
2.154714, 0.6319681, 1.894634, 1, 1, 1, 1, 1,
2.191413, -0.8643127, 0.664266, 1, 1, 1, 1, 1,
2.23278, -0.9192242, -0.0482525, 0, 0, 1, 1, 1,
2.258783, 1.411347, 1.056162, 1, 0, 0, 1, 1,
2.268305, -0.6495013, 0.603681, 1, 0, 0, 1, 1,
2.280821, 0.306524, 1.033215, 1, 0, 0, 1, 1,
2.309519, 0.2890461, 2.792017, 1, 0, 0, 1, 1,
2.31768, -0.1849194, 1.900113, 1, 0, 0, 1, 1,
2.325127, 0.1098229, 1.629239, 0, 0, 0, 1, 1,
2.345135, -0.8392196, 0.4225287, 0, 0, 0, 1, 1,
2.365511, 0.4178124, 1.58338, 0, 0, 0, 1, 1,
2.46351, 2.413859, 1.844764, 0, 0, 0, 1, 1,
2.495915, 2.060637, 1.107805, 0, 0, 0, 1, 1,
2.507276, 0.01353659, 0.9392344, 0, 0, 0, 1, 1,
2.521759, -1.601843, 3.228791, 0, 0, 0, 1, 1,
2.624935, -0.04389569, 1.309803, 1, 1, 1, 1, 1,
2.704795, 0.08939865, 2.942655, 1, 1, 1, 1, 1,
2.731896, 1.189297, 1.086378, 1, 1, 1, 1, 1,
2.782603, 0.3619542, 3.072791, 1, 1, 1, 1, 1,
2.820292, -0.2895519, 1.771069, 1, 1, 1, 1, 1,
2.82943, 1.073131, 1.827497, 1, 1, 1, 1, 1,
3.218361, -0.2029278, 4.089063, 1, 1, 1, 1, 1
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
var radius = 9.573981;
var distance = 33.6282;
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
mvMatrix.translate( -0.2407368, 0.1205976, -0.3332827 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.6282);
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
