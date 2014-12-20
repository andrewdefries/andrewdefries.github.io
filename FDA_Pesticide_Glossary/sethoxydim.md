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
-3.38818, 1.236056, -0.7842047, 1, 0, 0, 1,
-2.803031, -0.7003422, -2.025091, 1, 0.007843138, 0, 1,
-2.712176, 1.013381, 0.1196977, 1, 0.01176471, 0, 1,
-2.671028, 0.03696502, -1.570632, 1, 0.01960784, 0, 1,
-2.610326, 0.5418285, -0.7915125, 1, 0.02352941, 0, 1,
-2.521057, -0.6185459, -2.296426, 1, 0.03137255, 0, 1,
-2.483265, 1.032964, -1.682786, 1, 0.03529412, 0, 1,
-2.423258, 0.00649992, -3.304264, 1, 0.04313726, 0, 1,
-2.317734, 1.173362, -2.429034, 1, 0.04705882, 0, 1,
-2.313543, -0.0969867, -0.3603258, 1, 0.05490196, 0, 1,
-2.30445, 1.386803, -2.277876, 1, 0.05882353, 0, 1,
-2.298887, -0.09785614, -1.583058, 1, 0.06666667, 0, 1,
-2.292475, 0.5476489, -1.391168, 1, 0.07058824, 0, 1,
-2.288312, 1.30744, -1.384002, 1, 0.07843138, 0, 1,
-2.279315, -0.1073427, -4.144759, 1, 0.08235294, 0, 1,
-2.215991, -1.265358, -2.723734, 1, 0.09019608, 0, 1,
-2.209707, -1.263878, -0.7182403, 1, 0.09411765, 0, 1,
-2.207653, 1.132335, 0.9203087, 1, 0.1019608, 0, 1,
-2.198432, 1.518814, -2.578701, 1, 0.1098039, 0, 1,
-2.197585, -1.879213, -3.499433, 1, 0.1137255, 0, 1,
-2.196549, -1.368671, -2.260687, 1, 0.1215686, 0, 1,
-2.159163, 0.2399264, -2.715219, 1, 0.1254902, 0, 1,
-2.102167, -1.214533, -3.064685, 1, 0.1333333, 0, 1,
-2.099271, -0.5867068, -0.6567786, 1, 0.1372549, 0, 1,
-2.097526, 0.2356894, -1.502509, 1, 0.145098, 0, 1,
-2.077949, -2.949939, -2.802205, 1, 0.1490196, 0, 1,
-2.025265, -0.1765072, -3.085894, 1, 0.1568628, 0, 1,
-2.023846, -0.2341056, -2.952378, 1, 0.1607843, 0, 1,
-2.009935, -0.769249, -2.924191, 1, 0.1686275, 0, 1,
-1.996856, -0.8364926, -2.768879, 1, 0.172549, 0, 1,
-1.990813, -2.475619, -0.8927418, 1, 0.1803922, 0, 1,
-1.98279, 0.32434, -2.44242, 1, 0.1843137, 0, 1,
-1.979539, 0.2931079, -1.978062, 1, 0.1921569, 0, 1,
-1.9506, 2.326654, -0.882804, 1, 0.1960784, 0, 1,
-1.938606, -0.1236855, -2.5823, 1, 0.2039216, 0, 1,
-1.924636, 2.360584, -2.720028, 1, 0.2117647, 0, 1,
-1.911837, -0.5171632, -1.776701, 1, 0.2156863, 0, 1,
-1.887293, -1.785537, -2.084938, 1, 0.2235294, 0, 1,
-1.876453, -0.6181372, -2.924085, 1, 0.227451, 0, 1,
-1.873652, -1.677856, -0.9671874, 1, 0.2352941, 0, 1,
-1.873155, -0.9684082, -1.475189, 1, 0.2392157, 0, 1,
-1.854778, 0.9164574, -1.613609, 1, 0.2470588, 0, 1,
-1.846942, -1.107048, 0.7218123, 1, 0.2509804, 0, 1,
-1.845219, 1.457446, -0.860271, 1, 0.2588235, 0, 1,
-1.829152, -0.8094077, -2.022085, 1, 0.2627451, 0, 1,
-1.810248, -2.033819, -3.31365, 1, 0.2705882, 0, 1,
-1.788031, -0.7164543, -1.709977, 1, 0.2745098, 0, 1,
-1.757836, -0.9574687, -1.537092, 1, 0.282353, 0, 1,
-1.752598, -0.4654372, -0.6484373, 1, 0.2862745, 0, 1,
-1.745203, -0.7583552, -1.997513, 1, 0.2941177, 0, 1,
-1.744074, 0.3656171, -1.487212, 1, 0.3019608, 0, 1,
-1.72163, -2.596103, -3.466102, 1, 0.3058824, 0, 1,
-1.716598, -1.513261, -0.2700144, 1, 0.3137255, 0, 1,
-1.715962, -1.479392, -1.274332, 1, 0.3176471, 0, 1,
-1.692319, 0.5175624, -2.096136, 1, 0.3254902, 0, 1,
-1.679078, 1.504363, -2.333673, 1, 0.3294118, 0, 1,
-1.669323, 0.2208885, -1.406472, 1, 0.3372549, 0, 1,
-1.661073, -1.934988, -3.50654, 1, 0.3411765, 0, 1,
-1.645001, 0.283512, -1.83107, 1, 0.3490196, 0, 1,
-1.644558, 1.117961, -2.20104, 1, 0.3529412, 0, 1,
-1.63038, 0.3842452, 0.9978902, 1, 0.3607843, 0, 1,
-1.626333, -1.362287, -2.696922, 1, 0.3647059, 0, 1,
-1.611155, 0.4568687, -0.3629608, 1, 0.372549, 0, 1,
-1.601572, 0.4032624, -2.024676, 1, 0.3764706, 0, 1,
-1.601423, -0.8199129, -3.066175, 1, 0.3843137, 0, 1,
-1.59997, 0.3931445, -1.055315, 1, 0.3882353, 0, 1,
-1.595764, 1.475825, -1.73634, 1, 0.3960784, 0, 1,
-1.583395, 0.09097474, -2.2754, 1, 0.4039216, 0, 1,
-1.573232, 0.3323919, -2.116987, 1, 0.4078431, 0, 1,
-1.56019, -0.7289657, -1.135151, 1, 0.4156863, 0, 1,
-1.556838, 1.206398, -1.988847, 1, 0.4196078, 0, 1,
-1.550425, -1.276934, -1.555709, 1, 0.427451, 0, 1,
-1.53671, 0.7936001, -1.410061, 1, 0.4313726, 0, 1,
-1.534125, -0.3238896, -1.212684, 1, 0.4392157, 0, 1,
-1.528116, -0.8205132, -1.172674, 1, 0.4431373, 0, 1,
-1.52617, -0.3504501, -1.474069, 1, 0.4509804, 0, 1,
-1.510512, 1.460181, -0.2368811, 1, 0.454902, 0, 1,
-1.501125, -0.8069652, -3.150383, 1, 0.4627451, 0, 1,
-1.497536, 0.5252525, -2.831408, 1, 0.4666667, 0, 1,
-1.497366, 1.166214, -0.3338809, 1, 0.4745098, 0, 1,
-1.494795, -0.2192213, -0.7251993, 1, 0.4784314, 0, 1,
-1.471883, -0.6952956, -1.647803, 1, 0.4862745, 0, 1,
-1.451138, -1.117714, -3.112901, 1, 0.4901961, 0, 1,
-1.446844, 1.691523, 0.4321075, 1, 0.4980392, 0, 1,
-1.435114, -1.633018, -0.7986287, 1, 0.5058824, 0, 1,
-1.427555, 1.420527, -0.08074411, 1, 0.509804, 0, 1,
-1.425748, 0.1780049, -2.084707, 1, 0.5176471, 0, 1,
-1.41584, -0.09916873, -1.603877, 1, 0.5215687, 0, 1,
-1.415309, 2.743208, 1.686175, 1, 0.5294118, 0, 1,
-1.408866, 1.131546, -1.574376, 1, 0.5333334, 0, 1,
-1.390186, -0.721801, -1.125162, 1, 0.5411765, 0, 1,
-1.384603, -0.08586128, -2.129432, 1, 0.5450981, 0, 1,
-1.377501, 0.48416, -2.263626, 1, 0.5529412, 0, 1,
-1.370327, -0.9088645, -0.6940965, 1, 0.5568628, 0, 1,
-1.367948, -0.1019393, 0.2459132, 1, 0.5647059, 0, 1,
-1.362344, -0.400595, -2.891526, 1, 0.5686275, 0, 1,
-1.355704, 0.747282, -1.635078, 1, 0.5764706, 0, 1,
-1.35127, 0.05298026, -1.059231, 1, 0.5803922, 0, 1,
-1.350676, -0.6965983, -2.828922, 1, 0.5882353, 0, 1,
-1.343043, 0.2024896, -2.862971, 1, 0.5921569, 0, 1,
-1.338433, 0.8820621, -2.08267, 1, 0.6, 0, 1,
-1.333403, 0.2243779, -0.8149649, 1, 0.6078432, 0, 1,
-1.327289, -0.9681351, -1.771125, 1, 0.6117647, 0, 1,
-1.325898, -0.5584228, -2.568201, 1, 0.6196079, 0, 1,
-1.319592, -1.226084, -1.494021, 1, 0.6235294, 0, 1,
-1.31201, -0.3157613, -1.541711, 1, 0.6313726, 0, 1,
-1.304892, 0.8489748, -1.066659, 1, 0.6352941, 0, 1,
-1.302289, 1.140259, -0.6663132, 1, 0.6431373, 0, 1,
-1.297228, -1.615157, -4.342853, 1, 0.6470588, 0, 1,
-1.297083, 0.2727555, -2.000841, 1, 0.654902, 0, 1,
-1.285964, 0.1324623, -2.722126, 1, 0.6588235, 0, 1,
-1.285246, -1.739181, -2.45008, 1, 0.6666667, 0, 1,
-1.272815, 0.3215475, 0.7024905, 1, 0.6705883, 0, 1,
-1.261737, -0.04282595, -2.316092, 1, 0.6784314, 0, 1,
-1.260001, 0.6843416, 0.06992269, 1, 0.682353, 0, 1,
-1.259154, -0.2994832, -1.634665, 1, 0.6901961, 0, 1,
-1.257411, -1.629615, -2.30553, 1, 0.6941177, 0, 1,
-1.255679, -0.5069542, -2.199446, 1, 0.7019608, 0, 1,
-1.253642, -0.07194301, -1.740343, 1, 0.7098039, 0, 1,
-1.251096, 1.659607, 0.9880613, 1, 0.7137255, 0, 1,
-1.240615, 1.700843, -0.30872, 1, 0.7215686, 0, 1,
-1.238566, -3.878648, -2.678278, 1, 0.7254902, 0, 1,
-1.237078, -1.155766, -3.906598, 1, 0.7333333, 0, 1,
-1.236217, -1.452736, -2.095554, 1, 0.7372549, 0, 1,
-1.232167, -0.5244667, -0.5530929, 1, 0.7450981, 0, 1,
-1.225366, -0.3070897, -2.170954, 1, 0.7490196, 0, 1,
-1.223886, -0.4682705, -2.671821, 1, 0.7568628, 0, 1,
-1.223545, 0.59223, -0.4385546, 1, 0.7607843, 0, 1,
-1.21858, -0.1127606, -0.9964983, 1, 0.7686275, 0, 1,
-1.213642, 1.172116, 0.1514015, 1, 0.772549, 0, 1,
-1.208228, 0.8065454, -1.40615, 1, 0.7803922, 0, 1,
-1.205603, -0.08008305, -2.074454, 1, 0.7843137, 0, 1,
-1.204149, 0.6893668, 0.04550546, 1, 0.7921569, 0, 1,
-1.198247, -1.014657, -2.006439, 1, 0.7960784, 0, 1,
-1.197066, -0.1069986, -0.4308105, 1, 0.8039216, 0, 1,
-1.196982, 1.305107, -2.603566, 1, 0.8117647, 0, 1,
-1.193544, -0.5434349, -2.306517, 1, 0.8156863, 0, 1,
-1.193281, 1.562745, 0.3409122, 1, 0.8235294, 0, 1,
-1.192194, -1.745744, -3.629834, 1, 0.827451, 0, 1,
-1.192, 0.2829979, -0.6106462, 1, 0.8352941, 0, 1,
-1.191004, 0.3172034, -1.712062, 1, 0.8392157, 0, 1,
-1.188301, 1.998948, -0.8725716, 1, 0.8470588, 0, 1,
-1.174621, -1.129716, -2.747115, 1, 0.8509804, 0, 1,
-1.174534, -0.8263839, -2.630096, 1, 0.8588235, 0, 1,
-1.165271, 0.4668324, -2.297852, 1, 0.8627451, 0, 1,
-1.164724, -0.5992633, -2.528516, 1, 0.8705882, 0, 1,
-1.163633, -2.125492, -3.507824, 1, 0.8745098, 0, 1,
-1.161878, 0.2379999, -2.051419, 1, 0.8823529, 0, 1,
-1.161553, -0.4113393, -1.645735, 1, 0.8862745, 0, 1,
-1.149821, -0.6264081, -2.907737, 1, 0.8941177, 0, 1,
-1.148888, -0.4526535, -1.736422, 1, 0.8980392, 0, 1,
-1.144993, 0.07573948, -3.147737, 1, 0.9058824, 0, 1,
-1.139058, -0.2167766, -0.7803864, 1, 0.9137255, 0, 1,
-1.138156, -1.778725, -3.008167, 1, 0.9176471, 0, 1,
-1.138063, 1.080873, -0.6076306, 1, 0.9254902, 0, 1,
-1.137053, -1.771178, -2.82519, 1, 0.9294118, 0, 1,
-1.12696, 1.473912, -1.119729, 1, 0.9372549, 0, 1,
-1.122028, -0.05660053, -1.249689, 1, 0.9411765, 0, 1,
-1.117282, 0.4011762, -1.036145, 1, 0.9490196, 0, 1,
-1.115314, 0.1421718, 0.7689003, 1, 0.9529412, 0, 1,
-1.114023, -1.874112, -2.8716, 1, 0.9607843, 0, 1,
-1.11103, -1.09682, -1.541612, 1, 0.9647059, 0, 1,
-1.100276, -0.4771984, -2.581364, 1, 0.972549, 0, 1,
-1.095957, -0.5557365, -1.226308, 1, 0.9764706, 0, 1,
-1.095391, -0.2108931, -1.219217, 1, 0.9843137, 0, 1,
-1.090881, -0.2376076, -1.466098, 1, 0.9882353, 0, 1,
-1.088709, 1.579518, -1.471083, 1, 0.9960784, 0, 1,
-1.085678, 0.2840505, 0.9658526, 0.9960784, 1, 0, 1,
-1.062312, 0.1684169, -1.108019, 0.9921569, 1, 0, 1,
-1.061706, 2.221929, -1.574069, 0.9843137, 1, 0, 1,
-1.057378, -0.4159755, -1.981791, 0.9803922, 1, 0, 1,
-1.056782, 0.7785864, -2.040378, 0.972549, 1, 0, 1,
-1.055984, -0.9870658, -3.203456, 0.9686275, 1, 0, 1,
-1.053535, 0.0747719, -3.540142, 0.9607843, 1, 0, 1,
-1.051285, -0.8127314, -2.094218, 0.9568627, 1, 0, 1,
-1.048479, -0.3990782, -2.130655, 0.9490196, 1, 0, 1,
-1.044301, 1.253863, 0.5257741, 0.945098, 1, 0, 1,
-1.040205, 0.8970153, -2.635781, 0.9372549, 1, 0, 1,
-1.032124, -0.07559932, -0.8009801, 0.9333333, 1, 0, 1,
-1.026001, 0.06882138, -0.4013215, 0.9254902, 1, 0, 1,
-1.01691, -0.07103772, -1.488024, 0.9215686, 1, 0, 1,
-1.016308, 0.362406, -1.195638, 0.9137255, 1, 0, 1,
-1.016295, -0.04324315, -2.689697, 0.9098039, 1, 0, 1,
-1.007521, 0.9057909, -2.388582, 0.9019608, 1, 0, 1,
-1.002418, 0.4040248, -2.222524, 0.8941177, 1, 0, 1,
-0.9892029, -0.0416532, -0.1880981, 0.8901961, 1, 0, 1,
-0.9826292, -1.052241, -1.618151, 0.8823529, 1, 0, 1,
-0.9796438, 1.224651, -0.5492271, 0.8784314, 1, 0, 1,
-0.969074, -0.9499916, -2.157072, 0.8705882, 1, 0, 1,
-0.9690057, -0.1846312, -0.3212598, 0.8666667, 1, 0, 1,
-0.9666926, -1.042568, -1.324637, 0.8588235, 1, 0, 1,
-0.9640659, 0.9791548, -0.8204043, 0.854902, 1, 0, 1,
-0.9636395, -0.5920281, -1.617507, 0.8470588, 1, 0, 1,
-0.9527124, 0.1688492, -1.875654, 0.8431373, 1, 0, 1,
-0.9462228, -0.03732575, -0.6256084, 0.8352941, 1, 0, 1,
-0.942843, 1.289224, -1.148434, 0.8313726, 1, 0, 1,
-0.941521, -1.425513, -1.670208, 0.8235294, 1, 0, 1,
-0.9401556, -0.9097746, -3.503273, 0.8196079, 1, 0, 1,
-0.9387514, 0.6991871, -1.780974, 0.8117647, 1, 0, 1,
-0.9274725, 0.3871208, -1.355251, 0.8078431, 1, 0, 1,
-0.9226502, 1.603728, -0.05323025, 0.8, 1, 0, 1,
-0.9216081, 0.00330147, -1.307476, 0.7921569, 1, 0, 1,
-0.9195762, -0.5575076, -1.895513, 0.7882353, 1, 0, 1,
-0.9129367, -0.3953707, -1.93616, 0.7803922, 1, 0, 1,
-0.9100961, 0.2233204, -1.39587, 0.7764706, 1, 0, 1,
-0.9082792, 0.4976086, -2.597754, 0.7686275, 1, 0, 1,
-0.9065885, 0.03653716, -1.110307, 0.7647059, 1, 0, 1,
-0.9036347, -1.723017, -4.597088, 0.7568628, 1, 0, 1,
-0.8985835, -0.2723975, -0.9633452, 0.7529412, 1, 0, 1,
-0.889631, 0.1132598, -2.015135, 0.7450981, 1, 0, 1,
-0.8882589, 0.03305299, -2.320812, 0.7411765, 1, 0, 1,
-0.8847708, -1.939873, -1.956955, 0.7333333, 1, 0, 1,
-0.8834792, -1.941239, -2.16621, 0.7294118, 1, 0, 1,
-0.8817315, 0.22435, -2.40076, 0.7215686, 1, 0, 1,
-0.8766887, -0.6624321, -3.776513, 0.7176471, 1, 0, 1,
-0.8702357, 0.311067, -0.0932426, 0.7098039, 1, 0, 1,
-0.8685998, -0.6574393, -1.009064, 0.7058824, 1, 0, 1,
-0.8672497, 0.1725429, -2.025187, 0.6980392, 1, 0, 1,
-0.8484893, -0.8805515, -2.646583, 0.6901961, 1, 0, 1,
-0.8366947, -1.035887, -2.615785, 0.6862745, 1, 0, 1,
-0.8247659, -1.108092, -1.842947, 0.6784314, 1, 0, 1,
-0.8241487, -1.149226, -2.841918, 0.6745098, 1, 0, 1,
-0.8222857, -0.4374565, -5.276937, 0.6666667, 1, 0, 1,
-0.8159634, 0.5158538, -2.551669, 0.6627451, 1, 0, 1,
-0.8092242, -0.5541982, -1.156841, 0.654902, 1, 0, 1,
-0.8087509, 0.5579273, -4.597832, 0.6509804, 1, 0, 1,
-0.8075313, -2.490024, -2.926175, 0.6431373, 1, 0, 1,
-0.8073338, 0.3485662, -0.08001824, 0.6392157, 1, 0, 1,
-0.8036641, 0.5207883, -0.9291968, 0.6313726, 1, 0, 1,
-0.7973892, -0.5923721, -2.331059, 0.627451, 1, 0, 1,
-0.7928579, -0.3823533, -1.078888, 0.6196079, 1, 0, 1,
-0.7925047, 0.8676007, -0.912755, 0.6156863, 1, 0, 1,
-0.7897245, -2.012422, -2.683971, 0.6078432, 1, 0, 1,
-0.78664, 0.5493367, 0.5565741, 0.6039216, 1, 0, 1,
-0.7857963, 1.597604, -0.2025049, 0.5960785, 1, 0, 1,
-0.7786677, 0.8442034, -2.52064, 0.5882353, 1, 0, 1,
-0.7768323, -0.2140878, -2.100928, 0.5843138, 1, 0, 1,
-0.7762967, 0.2284756, -0.295661, 0.5764706, 1, 0, 1,
-0.7760317, 2.447231, 0.7728853, 0.572549, 1, 0, 1,
-0.7648607, 1.835906, -0.8286904, 0.5647059, 1, 0, 1,
-0.7591757, 1.337583, 1.213588, 0.5607843, 1, 0, 1,
-0.7584459, -1.425536, -0.1260375, 0.5529412, 1, 0, 1,
-0.7561541, 1.409736, 0.2192778, 0.5490196, 1, 0, 1,
-0.7505216, 1.030749, -2.245577, 0.5411765, 1, 0, 1,
-0.7487389, 0.4041793, -2.024643, 0.5372549, 1, 0, 1,
-0.7458212, 0.1019283, -0.5396938, 0.5294118, 1, 0, 1,
-0.74402, -0.8598202, -1.208208, 0.5254902, 1, 0, 1,
-0.7438148, -2.067843, -2.223303, 0.5176471, 1, 0, 1,
-0.7433215, -1.855231, -0.9958117, 0.5137255, 1, 0, 1,
-0.7406546, 1.650058, -2.615305, 0.5058824, 1, 0, 1,
-0.7401568, -0.5939525, -2.187885, 0.5019608, 1, 0, 1,
-0.738622, -0.6779222, 0.5583873, 0.4941176, 1, 0, 1,
-0.736472, 0.7033235, -2.633502, 0.4862745, 1, 0, 1,
-0.736291, 1.006219, 1.206724, 0.4823529, 1, 0, 1,
-0.7346582, 0.5689647, -2.014942, 0.4745098, 1, 0, 1,
-0.7297596, 0.7661293, 0.2454575, 0.4705882, 1, 0, 1,
-0.7266771, -0.05662673, -0.6640152, 0.4627451, 1, 0, 1,
-0.7223426, -2.999751, -3.304231, 0.4588235, 1, 0, 1,
-0.7136582, 0.03648271, -2.474236, 0.4509804, 1, 0, 1,
-0.7006809, -0.974264, -4.549379, 0.4470588, 1, 0, 1,
-0.6950068, -0.2533158, -1.104263, 0.4392157, 1, 0, 1,
-0.6926498, -0.1721561, -1.006202, 0.4352941, 1, 0, 1,
-0.6881878, -2.072927, -1.527657, 0.427451, 1, 0, 1,
-0.6869162, 1.598675, -0.1350096, 0.4235294, 1, 0, 1,
-0.6737835, -0.4010894, -2.040814, 0.4156863, 1, 0, 1,
-0.6566342, 1.874962, 1.371678, 0.4117647, 1, 0, 1,
-0.6550018, -1.075232, -2.037628, 0.4039216, 1, 0, 1,
-0.6531526, -0.708471, -1.880595, 0.3960784, 1, 0, 1,
-0.6511318, -0.2837532, -2.006569, 0.3921569, 1, 0, 1,
-0.6503147, 1.087972, -0.7280559, 0.3843137, 1, 0, 1,
-0.6501694, -2.720027, -4.0491, 0.3803922, 1, 0, 1,
-0.6497833, 0.0963425, -0.7789664, 0.372549, 1, 0, 1,
-0.6491044, 0.1831382, 0.2365756, 0.3686275, 1, 0, 1,
-0.6469137, -0.3682337, -1.44391, 0.3607843, 1, 0, 1,
-0.6421956, 0.5131362, 0.3911363, 0.3568628, 1, 0, 1,
-0.6421606, -1.923933, -1.091309, 0.3490196, 1, 0, 1,
-0.6411415, -1.560764, -2.700242, 0.345098, 1, 0, 1,
-0.6374583, 0.1805205, 0.3775354, 0.3372549, 1, 0, 1,
-0.6352854, 0.5034727, -1.604853, 0.3333333, 1, 0, 1,
-0.6331396, -0.218251, -2.516963, 0.3254902, 1, 0, 1,
-0.6329544, 0.0007525621, -1.020684, 0.3215686, 1, 0, 1,
-0.6307314, -0.01892398, -3.403095, 0.3137255, 1, 0, 1,
-0.6304637, -2.259501, -0.9251004, 0.3098039, 1, 0, 1,
-0.6265318, -0.6458697, -2.373164, 0.3019608, 1, 0, 1,
-0.626235, 2.712797, 0.3649885, 0.2941177, 1, 0, 1,
-0.6203001, 1.824738, 0.1279635, 0.2901961, 1, 0, 1,
-0.6199165, -0.2149186, -3.155428, 0.282353, 1, 0, 1,
-0.6108945, 0.3680789, -1.127558, 0.2784314, 1, 0, 1,
-0.6092945, -0.07055414, -1.522779, 0.2705882, 1, 0, 1,
-0.6072323, -0.9244246, -2.176104, 0.2666667, 1, 0, 1,
-0.5997428, -0.7371051, -1.882139, 0.2588235, 1, 0, 1,
-0.5922582, 1.705917, 0.8164907, 0.254902, 1, 0, 1,
-0.5879505, 0.8431185, -0.2289295, 0.2470588, 1, 0, 1,
-0.5851279, 0.9612943, -0.3061497, 0.2431373, 1, 0, 1,
-0.5814337, -0.2490993, -1.211374, 0.2352941, 1, 0, 1,
-0.5812805, -1.217434, -2.739971, 0.2313726, 1, 0, 1,
-0.5766069, 0.8874319, -0.3792687, 0.2235294, 1, 0, 1,
-0.5708441, -1.666367, -2.673124, 0.2196078, 1, 0, 1,
-0.5670611, -0.5831079, -2.647229, 0.2117647, 1, 0, 1,
-0.5609521, -1.108595, -3.407926, 0.2078431, 1, 0, 1,
-0.5608854, -0.7265904, -1.614713, 0.2, 1, 0, 1,
-0.5582522, -0.009704579, -1.380561, 0.1921569, 1, 0, 1,
-0.5522099, -0.6072456, -1.176462, 0.1882353, 1, 0, 1,
-0.5471823, 0.05515061, 0.2879423, 0.1803922, 1, 0, 1,
-0.5466081, -0.9734566, -1.930868, 0.1764706, 1, 0, 1,
-0.54641, -0.4854805, -2.583296, 0.1686275, 1, 0, 1,
-0.5454741, -1.298617, -2.732695, 0.1647059, 1, 0, 1,
-0.5422582, -0.3803276, -1.943192, 0.1568628, 1, 0, 1,
-0.5405008, 0.8130186, 0.1395548, 0.1529412, 1, 0, 1,
-0.5306911, 1.911888, -0.255231, 0.145098, 1, 0, 1,
-0.5300633, 1.727778, 1.644627, 0.1411765, 1, 0, 1,
-0.5271796, 0.5244869, -1.466995, 0.1333333, 1, 0, 1,
-0.5268229, -0.02379747, -0.2236904, 0.1294118, 1, 0, 1,
-0.5210003, -0.7068037, -2.62847, 0.1215686, 1, 0, 1,
-0.520559, 0.7576723, -1.092668, 0.1176471, 1, 0, 1,
-0.5195913, -1.063653, -3.140613, 0.1098039, 1, 0, 1,
-0.5181733, -1.318679, -3.196056, 0.1058824, 1, 0, 1,
-0.5116568, 0.894091, -2.707215, 0.09803922, 1, 0, 1,
-0.5069221, 0.6311666, -2.529443, 0.09019608, 1, 0, 1,
-0.5041298, 1.879727, 0.01032877, 0.08627451, 1, 0, 1,
-0.5035841, 0.7914564, 1.498682, 0.07843138, 1, 0, 1,
-0.4996013, 0.6111627, -0.2626992, 0.07450981, 1, 0, 1,
-0.4971642, 0.05725182, -2.264934, 0.06666667, 1, 0, 1,
-0.4953279, -1.215142, -3.675369, 0.0627451, 1, 0, 1,
-0.488951, 1.385392, -0.3267773, 0.05490196, 1, 0, 1,
-0.4854777, 0.1005269, -2.52876, 0.05098039, 1, 0, 1,
-0.4847665, -0.2052323, -2.32953, 0.04313726, 1, 0, 1,
-0.4775533, 0.06832879, -0.7017484, 0.03921569, 1, 0, 1,
-0.4720164, -0.3645974, -2.792531, 0.03137255, 1, 0, 1,
-0.4713134, -1.738099, -2.841251, 0.02745098, 1, 0, 1,
-0.471067, -0.8128026, -2.496134, 0.01960784, 1, 0, 1,
-0.4696802, 1.568475, 0.3988872, 0.01568628, 1, 0, 1,
-0.4695759, -0.6826448, -2.802612, 0.007843138, 1, 0, 1,
-0.4692653, 1.697302, 0.2617006, 0.003921569, 1, 0, 1,
-0.4669337, -0.8715107, -2.198924, 0, 1, 0.003921569, 1,
-0.4612992, 0.04565903, -2.605838, 0, 1, 0.01176471, 1,
-0.4564625, -1.408651, -5.304487, 0, 1, 0.01568628, 1,
-0.4463066, 0.4046381, -0.72358, 0, 1, 0.02352941, 1,
-0.4432962, -1.589754, -2.285606, 0, 1, 0.02745098, 1,
-0.443153, -0.7534638, -1.476461, 0, 1, 0.03529412, 1,
-0.4416018, 0.1134839, 0.1059743, 0, 1, 0.03921569, 1,
-0.4411258, -1.280935, -1.116243, 0, 1, 0.04705882, 1,
-0.4296767, -1.749944, -3.669386, 0, 1, 0.05098039, 1,
-0.4258534, 0.7882781, 0.06216796, 0, 1, 0.05882353, 1,
-0.4245637, -1.002816, -3.457749, 0, 1, 0.0627451, 1,
-0.4229825, -0.4931549, -2.863609, 0, 1, 0.07058824, 1,
-0.4212067, -0.7688636, -2.7983, 0, 1, 0.07450981, 1,
-0.4211861, 0.6806448, -0.8836216, 0, 1, 0.08235294, 1,
-0.4139712, -0.7909599, -1.855653, 0, 1, 0.08627451, 1,
-0.4128382, 0.8441954, 2.392456, 0, 1, 0.09411765, 1,
-0.4084953, 0.9421004, -0.8582327, 0, 1, 0.1019608, 1,
-0.4084061, 0.08933246, -1.334653, 0, 1, 0.1058824, 1,
-0.4026553, -0.3103558, -1.895097, 0, 1, 0.1137255, 1,
-0.39678, -1.241458, -2.906873, 0, 1, 0.1176471, 1,
-0.3866652, -2.170591, -2.465405, 0, 1, 0.1254902, 1,
-0.3846507, 1.031333, -0.2762629, 0, 1, 0.1294118, 1,
-0.38232, 0.09852245, -0.6798015, 0, 1, 0.1372549, 1,
-0.3787066, 1.286706, 0.2347574, 0, 1, 0.1411765, 1,
-0.3785745, 0.187066, -0.4736989, 0, 1, 0.1490196, 1,
-0.375832, -1.242228, -1.516072, 0, 1, 0.1529412, 1,
-0.372808, 0.3846403, 0.06339291, 0, 1, 0.1607843, 1,
-0.3713069, 0.7767612, -0.6829558, 0, 1, 0.1647059, 1,
-0.3679447, -0.1691565, -2.156291, 0, 1, 0.172549, 1,
-0.367577, 0.704765, -0.1309404, 0, 1, 0.1764706, 1,
-0.3666061, -1.217107, -3.34515, 0, 1, 0.1843137, 1,
-0.3657519, -0.7625197, -5.172408, 0, 1, 0.1882353, 1,
-0.3628066, 0.2954407, -1.041471, 0, 1, 0.1960784, 1,
-0.3614877, 1.191364, -0.3972943, 0, 1, 0.2039216, 1,
-0.3612131, 1.517049, -1.532474, 0, 1, 0.2078431, 1,
-0.3511576, 0.01977255, -1.694793, 0, 1, 0.2156863, 1,
-0.3501349, 0.937339, -1.397749, 0, 1, 0.2196078, 1,
-0.3476881, 0.5441764, -1.593586, 0, 1, 0.227451, 1,
-0.3410547, 0.9293101, -0.2102572, 0, 1, 0.2313726, 1,
-0.3378642, -0.200572, -1.487882, 0, 1, 0.2392157, 1,
-0.3337276, -1.251146, -2.684973, 0, 1, 0.2431373, 1,
-0.3270142, -0.07125226, -1.657423, 0, 1, 0.2509804, 1,
-0.326566, -0.3132222, -0.4562744, 0, 1, 0.254902, 1,
-0.3247521, -1.369412, -1.554166, 0, 1, 0.2627451, 1,
-0.3236322, -0.1957713, -3.239292, 0, 1, 0.2666667, 1,
-0.323507, -0.8329577, -3.531742, 0, 1, 0.2745098, 1,
-0.3230855, 0.375584, -1.779634, 0, 1, 0.2784314, 1,
-0.3212202, -0.8130308, -3.292573, 0, 1, 0.2862745, 1,
-0.319808, -0.338801, -1.97047, 0, 1, 0.2901961, 1,
-0.3182426, 0.7310378, -1.231405, 0, 1, 0.2980392, 1,
-0.3109789, 0.1290083, -1.622284, 0, 1, 0.3058824, 1,
-0.3108115, -0.05369843, -2.06105, 0, 1, 0.3098039, 1,
-0.3050469, 0.2338493, -2.308955, 0, 1, 0.3176471, 1,
-0.3007709, -0.7089158, -3.237046, 0, 1, 0.3215686, 1,
-0.3007291, -0.226623, -2.491575, 0, 1, 0.3294118, 1,
-0.2998677, -1.58669, -2.177819, 0, 1, 0.3333333, 1,
-0.2931026, 1.27124, 1.975125, 0, 1, 0.3411765, 1,
-0.2881647, 0.4953864, -2.531248, 0, 1, 0.345098, 1,
-0.2881019, -0.638766, -2.460455, 0, 1, 0.3529412, 1,
-0.2859654, 1.285238, -0.1611607, 0, 1, 0.3568628, 1,
-0.2850786, -0.04654333, -1.66982, 0, 1, 0.3647059, 1,
-0.2847792, -1.467145, -2.965657, 0, 1, 0.3686275, 1,
-0.2837619, 1.331913, -1.000148, 0, 1, 0.3764706, 1,
-0.2818201, -0.8261753, -1.7851, 0, 1, 0.3803922, 1,
-0.2753521, 1.628734, -0.6803013, 0, 1, 0.3882353, 1,
-0.2740718, -0.5506667, -2.334075, 0, 1, 0.3921569, 1,
-0.2714231, 0.3667699, -0.2847417, 0, 1, 0.4, 1,
-0.2705208, -0.8119345, -3.137201, 0, 1, 0.4078431, 1,
-0.2672208, 0.360348, -1.813415, 0, 1, 0.4117647, 1,
-0.2643352, 0.1610395, -1.839745, 0, 1, 0.4196078, 1,
-0.2625032, 0.4328706, 0.004427081, 0, 1, 0.4235294, 1,
-0.2610599, 0.7470808, -0.2597083, 0, 1, 0.4313726, 1,
-0.2601117, 1.310756, -0.5434169, 0, 1, 0.4352941, 1,
-0.2588605, 0.3184601, -2.283988, 0, 1, 0.4431373, 1,
-0.257735, 1.425669, 1.13818, 0, 1, 0.4470588, 1,
-0.2545119, -0.340943, -2.214304, 0, 1, 0.454902, 1,
-0.2490974, -1.217875, -2.416155, 0, 1, 0.4588235, 1,
-0.2466723, 0.7450245, -0.8818231, 0, 1, 0.4666667, 1,
-0.2441755, 0.1897433, -0.9210883, 0, 1, 0.4705882, 1,
-0.2439106, -1.122793, -2.095604, 0, 1, 0.4784314, 1,
-0.2431756, -0.4156652, -2.845876, 0, 1, 0.4823529, 1,
-0.2393672, 0.7289975, 3.095998, 0, 1, 0.4901961, 1,
-0.2383189, 1.421949, -1.76477, 0, 1, 0.4941176, 1,
-0.2379004, 0.48892, 0.2635677, 0, 1, 0.5019608, 1,
-0.2314678, 0.1463455, 0.6034248, 0, 1, 0.509804, 1,
-0.2200716, 0.8231932, -2.223772, 0, 1, 0.5137255, 1,
-0.2126132, 0.7450222, 0.1266484, 0, 1, 0.5215687, 1,
-0.2097326, 0.5548069, -1.502009, 0, 1, 0.5254902, 1,
-0.2080627, 1.605358, -2.386218, 0, 1, 0.5333334, 1,
-0.2072602, -0.5522166, -2.620773, 0, 1, 0.5372549, 1,
-0.2036552, 0.5027894, -0.3626551, 0, 1, 0.5450981, 1,
-0.2034609, -0.5144441, -3.44813, 0, 1, 0.5490196, 1,
-0.2020182, 0.1642172, -0.1011574, 0, 1, 0.5568628, 1,
-0.2010944, -0.8962017, -2.81696, 0, 1, 0.5607843, 1,
-0.1999864, 0.0861081, -1.670987, 0, 1, 0.5686275, 1,
-0.1942624, 0.5528231, -0.4630139, 0, 1, 0.572549, 1,
-0.1914684, 1.239743, 0.9575993, 0, 1, 0.5803922, 1,
-0.1905614, -1.073348, -1.186855, 0, 1, 0.5843138, 1,
-0.1877121, 0.9738194, -0.4136592, 0, 1, 0.5921569, 1,
-0.1873989, 0.7185329, 0.8512896, 0, 1, 0.5960785, 1,
-0.1832823, -0.6513932, -2.080833, 0, 1, 0.6039216, 1,
-0.178572, -0.3717777, -2.091423, 0, 1, 0.6117647, 1,
-0.1713361, 0.007997433, -0.7421355, 0, 1, 0.6156863, 1,
-0.1709866, 1.02463, 1.191935, 0, 1, 0.6235294, 1,
-0.1679381, -0.9282108, -2.171029, 0, 1, 0.627451, 1,
-0.1672121, 0.4961507, -0.9111446, 0, 1, 0.6352941, 1,
-0.166041, -0.09102269, -2.187028, 0, 1, 0.6392157, 1,
-0.1640109, -0.9181893, -3.525861, 0, 1, 0.6470588, 1,
-0.1636498, -1.194005, -2.966753, 0, 1, 0.6509804, 1,
-0.1632477, -0.2205887, -3.438929, 0, 1, 0.6588235, 1,
-0.1625487, -2.071262, -1.514932, 0, 1, 0.6627451, 1,
-0.1616117, 2.394143, 0.2313788, 0, 1, 0.6705883, 1,
-0.1565883, 0.1781855, -1.926757, 0, 1, 0.6745098, 1,
-0.1560396, -0.5487569, -3.717268, 0, 1, 0.682353, 1,
-0.1538238, 0.182825, 0.09872499, 0, 1, 0.6862745, 1,
-0.147181, -1.186616, -4.521112, 0, 1, 0.6941177, 1,
-0.1458005, -0.5906445, -1.424615, 0, 1, 0.7019608, 1,
-0.1439527, -0.6956604, -2.634661, 0, 1, 0.7058824, 1,
-0.1431687, -0.6168214, -3.613423, 0, 1, 0.7137255, 1,
-0.1377717, -0.5880647, -3.065351, 0, 1, 0.7176471, 1,
-0.1353242, 1.248188, -1.600809, 0, 1, 0.7254902, 1,
-0.1348583, -0.9270848, -3.00299, 0, 1, 0.7294118, 1,
-0.130058, -0.5151618, -2.629725, 0, 1, 0.7372549, 1,
-0.1280817, -0.09233431, -4.899621, 0, 1, 0.7411765, 1,
-0.125668, 1.436537, -0.8033537, 0, 1, 0.7490196, 1,
-0.1246881, -1.678128, -2.263958, 0, 1, 0.7529412, 1,
-0.1203394, -1.407992, -3.757791, 0, 1, 0.7607843, 1,
-0.118986, 0.09071001, -0.6097386, 0, 1, 0.7647059, 1,
-0.1179408, 1.530388, 1.26849, 0, 1, 0.772549, 1,
-0.112816, 1.284764, 1.015682, 0, 1, 0.7764706, 1,
-0.1113761, -0.461004, -3.628465, 0, 1, 0.7843137, 1,
-0.1106702, 0.9275212, -0.2062236, 0, 1, 0.7882353, 1,
-0.1079663, 0.6899869, -0.3532242, 0, 1, 0.7960784, 1,
-0.1064198, 1.14997, 0.136626, 0, 1, 0.8039216, 1,
-0.1006924, 0.8157816, 0.9816654, 0, 1, 0.8078431, 1,
-0.09853166, 0.4272094, -1.048127, 0, 1, 0.8156863, 1,
-0.09812233, -0.671052, -2.456815, 0, 1, 0.8196079, 1,
-0.09722503, 0.805721, -1.129486, 0, 1, 0.827451, 1,
-0.09611699, 0.8262347, 1.580138, 0, 1, 0.8313726, 1,
-0.09175149, -1.265638, -4.363812, 0, 1, 0.8392157, 1,
-0.08957712, -1.744737, -2.74024, 0, 1, 0.8431373, 1,
-0.0869414, 0.4579757, 0.221185, 0, 1, 0.8509804, 1,
-0.0831169, -0.225412, -1.787106, 0, 1, 0.854902, 1,
-0.08196727, -1.66093, -1.96388, 0, 1, 0.8627451, 1,
-0.08154928, -0.6494509, -3.147993, 0, 1, 0.8666667, 1,
-0.08069681, 0.1244925, -0.6728849, 0, 1, 0.8745098, 1,
-0.07771061, -0.635987, -3.058849, 0, 1, 0.8784314, 1,
-0.07523552, -0.07945299, -2.86141, 0, 1, 0.8862745, 1,
-0.07519154, -0.5740464, -3.76561, 0, 1, 0.8901961, 1,
-0.07330649, 0.1902298, 0.1109476, 0, 1, 0.8980392, 1,
-0.07037313, -1.465486, -3.933612, 0, 1, 0.9058824, 1,
-0.07001069, -0.7104514, -4.368348, 0, 1, 0.9098039, 1,
-0.06961926, -0.4581542, -2.109471, 0, 1, 0.9176471, 1,
-0.06757315, -0.6769451, -2.618304, 0, 1, 0.9215686, 1,
-0.05707572, 1.043667, -0.4453289, 0, 1, 0.9294118, 1,
-0.05281892, -0.7857919, -1.342474, 0, 1, 0.9333333, 1,
-0.04849041, -0.8246347, -2.06591, 0, 1, 0.9411765, 1,
-0.04477333, -0.457274, -1.796956, 0, 1, 0.945098, 1,
-0.04233632, 0.178408, -0.2757255, 0, 1, 0.9529412, 1,
-0.04222003, 0.1499428, -0.09028128, 0, 1, 0.9568627, 1,
-0.0416292, -1.452642, -2.665198, 0, 1, 0.9647059, 1,
-0.04115359, -0.8195065, -3.917348, 0, 1, 0.9686275, 1,
-0.04032289, 0.5744178, 0.1531443, 0, 1, 0.9764706, 1,
-0.03759648, 0.3620776, -0.008797819, 0, 1, 0.9803922, 1,
-0.03276162, 0.9158163, 0.5252057, 0, 1, 0.9882353, 1,
-0.03081517, -0.2140862, -2.112756, 0, 1, 0.9921569, 1,
-0.02668637, -1.463327, -4.282266, 0, 1, 1, 1,
-0.02618962, -1.069492, -2.348115, 0, 0.9921569, 1, 1,
-0.02208279, -0.1280167, -3.380525, 0, 0.9882353, 1, 1,
-0.01159686, 1.100581, -0.6071959, 0, 0.9803922, 1, 1,
-0.00973771, -0.9027187, -2.933917, 0, 0.9764706, 1, 1,
-0.008362424, -0.5935556, -1.750834, 0, 0.9686275, 1, 1,
-0.005010247, 0.4203543, 0.6380061, 0, 0.9647059, 1, 1,
-0.003088433, -0.3660371, -3.637881, 0, 0.9568627, 1, 1,
-0.002241546, -0.979403, -4.317479, 0, 0.9529412, 1, 1,
-0.0003229497, 0.07575759, -0.2030276, 0, 0.945098, 1, 1,
0.01027478, 0.839662, 1.492532, 0, 0.9411765, 1, 1,
0.0103751, 0.4480791, -0.2137125, 0, 0.9333333, 1, 1,
0.01154574, 0.5235177, 0.7102634, 0, 0.9294118, 1, 1,
0.01393972, -1.134496, 3.087466, 0, 0.9215686, 1, 1,
0.01521126, -1.040312, 2.799021, 0, 0.9176471, 1, 1,
0.01755127, 0.3189129, -0.4772144, 0, 0.9098039, 1, 1,
0.01768061, 1.654976, -0.8863277, 0, 0.9058824, 1, 1,
0.02514165, 0.2537019, -0.3997023, 0, 0.8980392, 1, 1,
0.02615745, 0.9325285, 0.74018, 0, 0.8901961, 1, 1,
0.02930295, 1.339386, -1.951874, 0, 0.8862745, 1, 1,
0.03367547, 1.024549, 1.093309, 0, 0.8784314, 1, 1,
0.0388892, -0.2503965, 3.417779, 0, 0.8745098, 1, 1,
0.04315917, 0.842063, 1.288657, 0, 0.8666667, 1, 1,
0.04332231, 0.09695489, 0.9193983, 0, 0.8627451, 1, 1,
0.04458871, -0.1269333, 1.94725, 0, 0.854902, 1, 1,
0.04978488, 0.3345988, -0.6697343, 0, 0.8509804, 1, 1,
0.05060685, 1.226634, 0.3676452, 0, 0.8431373, 1, 1,
0.05147044, -0.9274314, 2.377688, 0, 0.8392157, 1, 1,
0.05183845, 0.02000378, 1.526057, 0, 0.8313726, 1, 1,
0.05217849, -0.6157686, 3.454949, 0, 0.827451, 1, 1,
0.0545735, 0.8743204, -0.7823061, 0, 0.8196079, 1, 1,
0.05658417, -1.216816, 3.922539, 0, 0.8156863, 1, 1,
0.0604611, -0.0291377, 1.465887, 0, 0.8078431, 1, 1,
0.06182894, 0.9283987, 0.02903398, 0, 0.8039216, 1, 1,
0.0634283, 0.3604678, 0.8367463, 0, 0.7960784, 1, 1,
0.06689923, -0.5621071, 4.234956, 0, 0.7882353, 1, 1,
0.06847349, -0.1756126, 2.381757, 0, 0.7843137, 1, 1,
0.07025394, 0.1653869, -0.05918539, 0, 0.7764706, 1, 1,
0.0711187, 1.779745, 0.7166622, 0, 0.772549, 1, 1,
0.07394217, 2.346129, 0.5274488, 0, 0.7647059, 1, 1,
0.07864428, -0.5624438, 2.997337, 0, 0.7607843, 1, 1,
0.08288912, -0.6190901, 2.604055, 0, 0.7529412, 1, 1,
0.08373117, 0.3093291, 0.9626116, 0, 0.7490196, 1, 1,
0.08874631, 0.3461613, 0.2916453, 0, 0.7411765, 1, 1,
0.09234921, -1.117302, 2.760712, 0, 0.7372549, 1, 1,
0.09376358, 2.065969, 1.537733, 0, 0.7294118, 1, 1,
0.1036097, 0.4721513, -0.1087449, 0, 0.7254902, 1, 1,
0.1058608, 0.2198262, 1.043238, 0, 0.7176471, 1, 1,
0.1060943, -0.7386372, 4.864205, 0, 0.7137255, 1, 1,
0.110408, 0.7462397, -1.770888, 0, 0.7058824, 1, 1,
0.1112734, 0.6573427, -1.308346, 0, 0.6980392, 1, 1,
0.1124472, 1.106457, 0.38287, 0, 0.6941177, 1, 1,
0.1137489, 0.2962093, 0.7430639, 0, 0.6862745, 1, 1,
0.1194338, -0.7674024, 2.760432, 0, 0.682353, 1, 1,
0.1204852, -0.465624, 3.263836, 0, 0.6745098, 1, 1,
0.124109, 0.4332978, 1.906375, 0, 0.6705883, 1, 1,
0.1288719, 0.577681, -0.01086227, 0, 0.6627451, 1, 1,
0.1290795, 1.175839, 0.8391832, 0, 0.6588235, 1, 1,
0.1330726, -0.8728983, 1.739148, 0, 0.6509804, 1, 1,
0.13452, 0.245958, -1.905927, 0, 0.6470588, 1, 1,
0.1355011, 0.3939637, 0.6420277, 0, 0.6392157, 1, 1,
0.135953, -0.792716, 2.362538, 0, 0.6352941, 1, 1,
0.1385744, 0.7941809, -0.1143347, 0, 0.627451, 1, 1,
0.1406531, -0.361712, 4.915685, 0, 0.6235294, 1, 1,
0.145052, 0.09587663, -0.3240874, 0, 0.6156863, 1, 1,
0.147911, -0.4964036, 4.09516, 0, 0.6117647, 1, 1,
0.1489571, 1.547295, 1.128874, 0, 0.6039216, 1, 1,
0.1509053, 1.912941, 1.57848, 0, 0.5960785, 1, 1,
0.151418, 1.059444, -0.3347043, 0, 0.5921569, 1, 1,
0.1533456, 0.01751193, 2.746192, 0, 0.5843138, 1, 1,
0.1639825, -0.1132276, 2.263453, 0, 0.5803922, 1, 1,
0.169498, -1.676445, 4.297494, 0, 0.572549, 1, 1,
0.1701288, 0.4816204, -1.960955, 0, 0.5686275, 1, 1,
0.1707488, 0.0978704, 1.52903, 0, 0.5607843, 1, 1,
0.1720813, -0.7495966, 3.629388, 0, 0.5568628, 1, 1,
0.1754021, -1.109689, 3.907016, 0, 0.5490196, 1, 1,
0.1774873, 0.327574, 1.604148, 0, 0.5450981, 1, 1,
0.177734, -0.5817151, 1.337108, 0, 0.5372549, 1, 1,
0.1851397, -0.2786647, 3.418828, 0, 0.5333334, 1, 1,
0.1900467, 0.8025503, -0.8556439, 0, 0.5254902, 1, 1,
0.1905057, 0.06674396, 1.028359, 0, 0.5215687, 1, 1,
0.1908462, -0.08776681, 0.09728672, 0, 0.5137255, 1, 1,
0.1909182, -0.7710612, 3.847291, 0, 0.509804, 1, 1,
0.1917527, -1.197212, 3.738185, 0, 0.5019608, 1, 1,
0.1970575, 0.6713825, 1.433228, 0, 0.4941176, 1, 1,
0.2013252, 0.897994, 1.97343, 0, 0.4901961, 1, 1,
0.2029278, 0.9835685, 0.3287342, 0, 0.4823529, 1, 1,
0.2043265, 0.2198219, 1.923295, 0, 0.4784314, 1, 1,
0.2050168, 1.435503, 1.386387, 0, 0.4705882, 1, 1,
0.2073129, -0.37586, 4.238604, 0, 0.4666667, 1, 1,
0.2094038, 0.4870731, 0.5804194, 0, 0.4588235, 1, 1,
0.2181253, -0.01435659, 1.633727, 0, 0.454902, 1, 1,
0.2197015, 0.1051818, -0.6035453, 0, 0.4470588, 1, 1,
0.2237801, -1.387364, 2.071815, 0, 0.4431373, 1, 1,
0.2244322, 2.351912, -0.8954807, 0, 0.4352941, 1, 1,
0.2263323, -1.150372, 1.727563, 0, 0.4313726, 1, 1,
0.2270039, 0.8766205, 0.3635457, 0, 0.4235294, 1, 1,
0.2302106, 0.62031, 1.720779, 0, 0.4196078, 1, 1,
0.2351975, 1.621347, 0.808869, 0, 0.4117647, 1, 1,
0.2373765, 0.5529795, 0.04016337, 0, 0.4078431, 1, 1,
0.2411189, 0.9023741, -0.7900473, 0, 0.4, 1, 1,
0.2439971, 0.3669835, -0.01616787, 0, 0.3921569, 1, 1,
0.2440423, 1.364021, 0.2910495, 0, 0.3882353, 1, 1,
0.2473601, -0.7312774, 3.763412, 0, 0.3803922, 1, 1,
0.2494197, 0.7030047, 1.836895, 0, 0.3764706, 1, 1,
0.250207, -0.02232841, 1.620351, 0, 0.3686275, 1, 1,
0.2504033, 0.4669404, 0.7275619, 0, 0.3647059, 1, 1,
0.2531055, -1.414849, 4.91258, 0, 0.3568628, 1, 1,
0.2532518, 1.503001, -0.1493501, 0, 0.3529412, 1, 1,
0.25372, -0.3227458, 1.746434, 0, 0.345098, 1, 1,
0.2609649, 0.5089471, 1.161834, 0, 0.3411765, 1, 1,
0.2610048, -0.6301218, 2.868556, 0, 0.3333333, 1, 1,
0.2619661, 1.387653, 0.3142216, 0, 0.3294118, 1, 1,
0.264736, -1.312274, 1.893404, 0, 0.3215686, 1, 1,
0.2677305, -0.07990862, 3.255213, 0, 0.3176471, 1, 1,
0.2721876, 0.7422607, 0.9916264, 0, 0.3098039, 1, 1,
0.2728983, 0.3223101, -0.9223868, 0, 0.3058824, 1, 1,
0.2729712, 1.477885, 0.3789366, 0, 0.2980392, 1, 1,
0.2741089, -0.5137741, 1.338825, 0, 0.2901961, 1, 1,
0.2783487, -1.54571, 3.626176, 0, 0.2862745, 1, 1,
0.2864221, 0.7731071, 1.030207, 0, 0.2784314, 1, 1,
0.2888583, -0.3090605, 1.398722, 0, 0.2745098, 1, 1,
0.2933356, -0.2983242, 1.881884, 0, 0.2666667, 1, 1,
0.2949846, 1.459593, 0.7037854, 0, 0.2627451, 1, 1,
0.3015205, -0.5349649, 2.491585, 0, 0.254902, 1, 1,
0.3069927, 0.004221409, 2.558751, 0, 0.2509804, 1, 1,
0.3127356, 0.2466671, 2.022752, 0, 0.2431373, 1, 1,
0.3151026, 1.242925, 0.6777225, 0, 0.2392157, 1, 1,
0.3155664, -0.9161739, 3.607834, 0, 0.2313726, 1, 1,
0.3171547, 1.735479, -1.05174, 0, 0.227451, 1, 1,
0.3179527, -0.06749834, 0.9972733, 0, 0.2196078, 1, 1,
0.3196233, 1.407958, -0.7448631, 0, 0.2156863, 1, 1,
0.3199446, -1.704796, 1.616117, 0, 0.2078431, 1, 1,
0.3215605, 0.7293691, 0.4633296, 0, 0.2039216, 1, 1,
0.321616, -0.2388621, 2.20962, 0, 0.1960784, 1, 1,
0.3233629, -0.5872623, 3.532902, 0, 0.1882353, 1, 1,
0.3289383, -0.08711573, 3.050354, 0, 0.1843137, 1, 1,
0.3300837, -1.585782, 2.650028, 0, 0.1764706, 1, 1,
0.3311335, -0.9484591, 2.89731, 0, 0.172549, 1, 1,
0.3436896, -0.739324, 2.113232, 0, 0.1647059, 1, 1,
0.3448738, 0.387441, 0.3167633, 0, 0.1607843, 1, 1,
0.3455007, -1.18768, 3.684877, 0, 0.1529412, 1, 1,
0.3470061, -0.07972085, -0.3032635, 0, 0.1490196, 1, 1,
0.3502275, -0.9957842, 2.393004, 0, 0.1411765, 1, 1,
0.3503542, -1.167917, 3.400076, 0, 0.1372549, 1, 1,
0.3540146, 0.2512899, 2.540362, 0, 0.1294118, 1, 1,
0.3564569, 1.004068, -0.6633236, 0, 0.1254902, 1, 1,
0.3566085, -1.446454, 3.614577, 0, 0.1176471, 1, 1,
0.3577765, -0.7045432, 3.408738, 0, 0.1137255, 1, 1,
0.3590389, 1.824031, 0.717489, 0, 0.1058824, 1, 1,
0.3625305, 1.737052, -0.3781708, 0, 0.09803922, 1, 1,
0.36258, -1.541754, 2.7521, 0, 0.09411765, 1, 1,
0.3632383, 0.1563839, 0.4391544, 0, 0.08627451, 1, 1,
0.3642842, 0.588051, -0.477894, 0, 0.08235294, 1, 1,
0.3645892, 3.253947, -0.4059119, 0, 0.07450981, 1, 1,
0.3686894, 0.4255754, -0.09164965, 0, 0.07058824, 1, 1,
0.3711887, 0.2938417, 2.231635, 0, 0.0627451, 1, 1,
0.3754342, -0.008750299, 1.16884, 0, 0.05882353, 1, 1,
0.3787966, -0.3577222, 2.160357, 0, 0.05098039, 1, 1,
0.3791495, -0.7116219, 2.47124, 0, 0.04705882, 1, 1,
0.3796932, -0.7994732, 2.603502, 0, 0.03921569, 1, 1,
0.3804231, -1.709163, 1.983033, 0, 0.03529412, 1, 1,
0.3841991, 0.3792627, 0.9814425, 0, 0.02745098, 1, 1,
0.3858058, 1.473148, -0.1846086, 0, 0.02352941, 1, 1,
0.3869394, -0.2375633, 1.214447, 0, 0.01568628, 1, 1,
0.3921696, -0.1881048, 2.711487, 0, 0.01176471, 1, 1,
0.3949053, 1.372765, -1.185165, 0, 0.003921569, 1, 1,
0.3953218, 0.6139082, 0.8780703, 0.003921569, 0, 1, 1,
0.3957995, 0.6815348, 3.11895, 0.007843138, 0, 1, 1,
0.3963548, -0.441789, 2.426179, 0.01568628, 0, 1, 1,
0.3966017, -0.7722604, 2.633801, 0.01960784, 0, 1, 1,
0.3982121, 0.348833, 0.657715, 0.02745098, 0, 1, 1,
0.402526, -0.4228329, 2.778953, 0.03137255, 0, 1, 1,
0.4094301, 1.055326, 1.330577, 0.03921569, 0, 1, 1,
0.4194502, -1.205473, 2.366944, 0.04313726, 0, 1, 1,
0.4301461, 1.127921, 0.03405452, 0.05098039, 0, 1, 1,
0.4323982, 1.143441, -1.306154, 0.05490196, 0, 1, 1,
0.4327922, 1.311632, 0.8521748, 0.0627451, 0, 1, 1,
0.4478062, 0.08297123, 0.7824584, 0.06666667, 0, 1, 1,
0.4577766, 0.9245588, 1.164101, 0.07450981, 0, 1, 1,
0.4603996, 0.497942, 2.198294, 0.07843138, 0, 1, 1,
0.4615149, 1.093666, 1.73953, 0.08627451, 0, 1, 1,
0.4629818, 0.09578928, 0.6932603, 0.09019608, 0, 1, 1,
0.4643067, -1.915069, 3.334316, 0.09803922, 0, 1, 1,
0.4664727, 1.188556, -0.03958847, 0.1058824, 0, 1, 1,
0.470783, 0.7817045, 1.206178, 0.1098039, 0, 1, 1,
0.4712402, 1.090946, -0.05989005, 0.1176471, 0, 1, 1,
0.4718932, -0.2311233, 1.135796, 0.1215686, 0, 1, 1,
0.4727984, -0.5126382, 1.491942, 0.1294118, 0, 1, 1,
0.473255, 1.476356, -1.760331, 0.1333333, 0, 1, 1,
0.4764129, -0.1443324, 2.847988, 0.1411765, 0, 1, 1,
0.4784425, 1.044071, 0.8294491, 0.145098, 0, 1, 1,
0.4788828, 0.3239067, 1.937607, 0.1529412, 0, 1, 1,
0.4850842, 0.6537656, -0.4499761, 0.1568628, 0, 1, 1,
0.4860207, -1.215602, 4.341915, 0.1647059, 0, 1, 1,
0.4860214, 0.2367899, 1.657196, 0.1686275, 0, 1, 1,
0.4875238, -0.2275422, 1.83322, 0.1764706, 0, 1, 1,
0.4881477, -0.1104324, 0.678237, 0.1803922, 0, 1, 1,
0.4891005, 1.593272, 0.8401037, 0.1882353, 0, 1, 1,
0.4978186, 1.213152, 1.868498, 0.1921569, 0, 1, 1,
0.5021834, -1.459953, 1.861289, 0.2, 0, 1, 1,
0.509025, -0.1393557, 2.049291, 0.2078431, 0, 1, 1,
0.5102593, 0.9731922, -0.04880389, 0.2117647, 0, 1, 1,
0.5240503, -0.3602078, 1.92782, 0.2196078, 0, 1, 1,
0.5317382, 1.25767, -0.1806073, 0.2235294, 0, 1, 1,
0.5327003, 2.145969, 0.04636817, 0.2313726, 0, 1, 1,
0.5367765, 0.9550961, -1.734784, 0.2352941, 0, 1, 1,
0.5378921, -1.248354, 2.785499, 0.2431373, 0, 1, 1,
0.5487735, -0.3585403, 3.22103, 0.2470588, 0, 1, 1,
0.5494209, 1.150769, 1.091849, 0.254902, 0, 1, 1,
0.5522944, 0.3400387, 3.478313, 0.2588235, 0, 1, 1,
0.5528032, 0.04117271, 1.497894, 0.2666667, 0, 1, 1,
0.553704, -0.2687232, 2.65407, 0.2705882, 0, 1, 1,
0.5617068, 1.183514, 0.5469605, 0.2784314, 0, 1, 1,
0.5642576, 0.5045357, -0.0229216, 0.282353, 0, 1, 1,
0.5683946, -1.681932, 1.155597, 0.2901961, 0, 1, 1,
0.5730082, -0.2830293, 2.116051, 0.2941177, 0, 1, 1,
0.5740563, 0.8339977, 0.8353974, 0.3019608, 0, 1, 1,
0.5793781, -0.1863557, 0.6382593, 0.3098039, 0, 1, 1,
0.5797111, 1.772843, -1.537515, 0.3137255, 0, 1, 1,
0.5798467, 0.5006763, 1.553541, 0.3215686, 0, 1, 1,
0.5841915, -0.7088692, 2.417403, 0.3254902, 0, 1, 1,
0.5870306, 1.290114, -0.7097775, 0.3333333, 0, 1, 1,
0.5885304, -1.631635, 2.904203, 0.3372549, 0, 1, 1,
0.5893677, 1.118916, 2.141684, 0.345098, 0, 1, 1,
0.5896993, -1.042479, 2.634971, 0.3490196, 0, 1, 1,
0.5911492, 0.5630105, 1.3218, 0.3568628, 0, 1, 1,
0.5949929, 1.100236, 1.169463, 0.3607843, 0, 1, 1,
0.5955456, -0.3090851, 0.2376422, 0.3686275, 0, 1, 1,
0.5956885, -0.5414281, 2.969387, 0.372549, 0, 1, 1,
0.5958536, -0.6118698, 2.892583, 0.3803922, 0, 1, 1,
0.6020145, 0.4697197, 1.223566, 0.3843137, 0, 1, 1,
0.6030388, -0.3811142, 1.986752, 0.3921569, 0, 1, 1,
0.6111291, 1.038781, 0.9579739, 0.3960784, 0, 1, 1,
0.6166208, -0.694155, 2.330211, 0.4039216, 0, 1, 1,
0.6194515, 0.2611208, 1.403197, 0.4117647, 0, 1, 1,
0.6202727, 0.7453694, 1.072322, 0.4156863, 0, 1, 1,
0.6209229, -1.366767, 4.220318, 0.4235294, 0, 1, 1,
0.6218588, 0.9721212, 0.1387397, 0.427451, 0, 1, 1,
0.6261443, -1.080788, 2.458223, 0.4352941, 0, 1, 1,
0.6263148, 1.233977, 0.4925075, 0.4392157, 0, 1, 1,
0.6270516, -0.2387594, 3.182127, 0.4470588, 0, 1, 1,
0.6297378, -0.3928117, 3.440365, 0.4509804, 0, 1, 1,
0.6359606, 0.1226395, -0.09020566, 0.4588235, 0, 1, 1,
0.6360038, -0.4089791, 1.139757, 0.4627451, 0, 1, 1,
0.641723, 0.5656636, 0.8990175, 0.4705882, 0, 1, 1,
0.6436771, 0.6276051, 1.249394, 0.4745098, 0, 1, 1,
0.6447164, 0.1093968, 1.991703, 0.4823529, 0, 1, 1,
0.6488791, 0.6388958, 1.147237, 0.4862745, 0, 1, 1,
0.6511785, -2.57155, 2.718353, 0.4941176, 0, 1, 1,
0.6530869, 0.0592382, 2.064191, 0.5019608, 0, 1, 1,
0.6546736, -1.440046, 3.338356, 0.5058824, 0, 1, 1,
0.6555688, -1.654655, 1.099338, 0.5137255, 0, 1, 1,
0.6617061, 0.03907076, 2.737154, 0.5176471, 0, 1, 1,
0.6624539, 1.278529, -0.278209, 0.5254902, 0, 1, 1,
0.662532, 0.9223598, 1.088375, 0.5294118, 0, 1, 1,
0.6663565, -0.553783, 2.931321, 0.5372549, 0, 1, 1,
0.6705655, -1.247807, 2.855645, 0.5411765, 0, 1, 1,
0.6708372, -0.1370299, 0.03581454, 0.5490196, 0, 1, 1,
0.6759213, 0.3768198, 1.167191, 0.5529412, 0, 1, 1,
0.6785477, 1.118125, 0.3151406, 0.5607843, 0, 1, 1,
0.6813709, 0.5492091, 1.534654, 0.5647059, 0, 1, 1,
0.6884831, -1.29538, 2.627049, 0.572549, 0, 1, 1,
0.6917396, 0.7018207, 0.6814106, 0.5764706, 0, 1, 1,
0.6981438, 0.8201814, 1.533633, 0.5843138, 0, 1, 1,
0.7098795, -1.917473, 2.656963, 0.5882353, 0, 1, 1,
0.7100947, 0.21433, 2.532429, 0.5960785, 0, 1, 1,
0.7121713, -0.8054897, 2.941971, 0.6039216, 0, 1, 1,
0.7124897, 0.6614847, 0.5312415, 0.6078432, 0, 1, 1,
0.722829, -0.9510897, 1.816149, 0.6156863, 0, 1, 1,
0.7306405, -0.1896375, 1.714041, 0.6196079, 0, 1, 1,
0.7314842, 0.2533301, 1.094473, 0.627451, 0, 1, 1,
0.7319843, 0.3364906, 3.084005, 0.6313726, 0, 1, 1,
0.7364725, 1.479581, 1.469493, 0.6392157, 0, 1, 1,
0.7367085, 0.5017546, 2.644561, 0.6431373, 0, 1, 1,
0.7367107, 0.3949462, 1.179339, 0.6509804, 0, 1, 1,
0.7410973, 1.47773, 1.997465, 0.654902, 0, 1, 1,
0.7475262, -0.3243499, 2.298654, 0.6627451, 0, 1, 1,
0.7511681, -0.6486278, 1.018125, 0.6666667, 0, 1, 1,
0.7545904, -0.5313521, 1.225875, 0.6745098, 0, 1, 1,
0.7563652, -1.535962, 4.375288, 0.6784314, 0, 1, 1,
0.7585036, 0.4931142, 1.591167, 0.6862745, 0, 1, 1,
0.7587636, 0.5300194, 1.694188, 0.6901961, 0, 1, 1,
0.7626351, -0.8277432, 1.478273, 0.6980392, 0, 1, 1,
0.7631435, 0.5451337, -1.533981, 0.7058824, 0, 1, 1,
0.7672313, 0.1632686, 1.049371, 0.7098039, 0, 1, 1,
0.7677783, 0.3552337, 1.530677, 0.7176471, 0, 1, 1,
0.7709868, -0.2200717, 1.087614, 0.7215686, 0, 1, 1,
0.7720275, 0.4134137, 1.135439, 0.7294118, 0, 1, 1,
0.774128, 0.07586144, 2.471562, 0.7333333, 0, 1, 1,
0.7793121, 0.167251, 1.599008, 0.7411765, 0, 1, 1,
0.7801591, -0.208341, 1.414531, 0.7450981, 0, 1, 1,
0.7818124, 0.9022444, 1.159622, 0.7529412, 0, 1, 1,
0.7885221, -1.538851, 0.8496794, 0.7568628, 0, 1, 1,
0.7909435, -0.4832226, 2.282006, 0.7647059, 0, 1, 1,
0.7968807, 1.759066, -0.008836461, 0.7686275, 0, 1, 1,
0.7985895, 0.6195295, 0.4398569, 0.7764706, 0, 1, 1,
0.7992212, 0.9623406, 0.6066898, 0.7803922, 0, 1, 1,
0.8056682, 0.3129037, 1.140525, 0.7882353, 0, 1, 1,
0.8129529, -0.8258433, 2.614756, 0.7921569, 0, 1, 1,
0.8173565, -0.07633124, 1.739967, 0.8, 0, 1, 1,
0.819945, -0.7328231, 1.412357, 0.8078431, 0, 1, 1,
0.8213108, 0.9327823, 0.8150564, 0.8117647, 0, 1, 1,
0.8213284, -0.06008203, 2.465027, 0.8196079, 0, 1, 1,
0.8262269, 0.4923543, -0.1105246, 0.8235294, 0, 1, 1,
0.8365092, 1.561034, 0.6861491, 0.8313726, 0, 1, 1,
0.8413323, -0.8441502, -0.04855973, 0.8352941, 0, 1, 1,
0.8448062, -0.6675718, 1.729957, 0.8431373, 0, 1, 1,
0.8453031, 0.8825071, 1.035839, 0.8470588, 0, 1, 1,
0.8515477, 0.8388678, 1.214443, 0.854902, 0, 1, 1,
0.8651679, 1.030745, 0.6081989, 0.8588235, 0, 1, 1,
0.8731753, -1.412405, 3.273861, 0.8666667, 0, 1, 1,
0.8740211, -0.4126997, 1.052556, 0.8705882, 0, 1, 1,
0.8829423, 1.325624, 1.723995, 0.8784314, 0, 1, 1,
0.8886646, 0.2582734, -1.474704, 0.8823529, 0, 1, 1,
0.8938809, 0.5884249, 1.757135, 0.8901961, 0, 1, 1,
0.8967869, 0.4890839, 0.9896194, 0.8941177, 0, 1, 1,
0.903792, 0.6772868, 2.866707, 0.9019608, 0, 1, 1,
0.905797, 0.1137404, 0.9051625, 0.9098039, 0, 1, 1,
0.906478, -1.483, 3.771083, 0.9137255, 0, 1, 1,
0.9096905, 1.441832, 1.096267, 0.9215686, 0, 1, 1,
0.910551, 0.1740102, 2.274473, 0.9254902, 0, 1, 1,
0.9144988, -0.007030067, 2.0863, 0.9333333, 0, 1, 1,
0.9166403, 0.6778095, -0.4683766, 0.9372549, 0, 1, 1,
0.9172856, 0.6881551, 0.8874189, 0.945098, 0, 1, 1,
0.9180335, -0.4441848, 1.994266, 0.9490196, 0, 1, 1,
0.920511, -0.6250492, 4.995579, 0.9568627, 0, 1, 1,
0.9239605, -0.6049947, 2.792191, 0.9607843, 0, 1, 1,
0.9257755, -0.7303933, 2.917158, 0.9686275, 0, 1, 1,
0.9307974, -1.40506, 4.023777, 0.972549, 0, 1, 1,
0.9383527, 0.002546715, 1.274694, 0.9803922, 0, 1, 1,
0.9393336, 0.4438452, 0.02060366, 0.9843137, 0, 1, 1,
0.9399239, -1.008894, 3.942385, 0.9921569, 0, 1, 1,
0.9408528, -1.415137, 1.663381, 0.9960784, 0, 1, 1,
0.9435769, -2.241789, 3.273303, 1, 0, 0.9960784, 1,
0.9479896, -0.2284053, 0.8812804, 1, 0, 0.9882353, 1,
0.9565138, 1.096367, 3.362325, 1, 0, 0.9843137, 1,
0.9668109, 0.801926, 1.859262, 1, 0, 0.9764706, 1,
0.9714059, -0.07010813, 0.6562591, 1, 0, 0.972549, 1,
0.9714493, -0.06757293, 2.844219, 1, 0, 0.9647059, 1,
0.9821752, 1.800073, 1.089599, 1, 0, 0.9607843, 1,
0.9852766, -1.811385, 2.913722, 1, 0, 0.9529412, 1,
0.9873739, -0.4699829, 3.021766, 1, 0, 0.9490196, 1,
0.9909965, -0.8507609, 0.8199651, 1, 0, 0.9411765, 1,
0.9962307, 0.1984747, 1.655368, 1, 0, 0.9372549, 1,
1.006571, 1.03215, 0.0557064, 1, 0, 0.9294118, 1,
1.010359, 1.238921, 0.8329139, 1, 0, 0.9254902, 1,
1.015578, 0.7500269, 1.555229, 1, 0, 0.9176471, 1,
1.017081, 1.377137, -0.0218599, 1, 0, 0.9137255, 1,
1.019642, 0.5048146, 2.196116, 1, 0, 0.9058824, 1,
1.022086, 0.6329765, 0.5824996, 1, 0, 0.9019608, 1,
1.030179, -0.0452794, 0.5188397, 1, 0, 0.8941177, 1,
1.031384, -0.2800576, 0.5977274, 1, 0, 0.8862745, 1,
1.03227, 0.8530784, 1.549827, 1, 0, 0.8823529, 1,
1.033627, -2.025455, 3.404264, 1, 0, 0.8745098, 1,
1.037791, -0.5162181, 2.412479, 1, 0, 0.8705882, 1,
1.037915, -1.841266, 1.364831, 1, 0, 0.8627451, 1,
1.040111, -0.07863281, 1.405707, 1, 0, 0.8588235, 1,
1.042952, 1.83355, 0.9286974, 1, 0, 0.8509804, 1,
1.044623, -1.241184, 0.6370284, 1, 0, 0.8470588, 1,
1.065851, 0.7911957, 0.02473127, 1, 0, 0.8392157, 1,
1.066319, -0.5181044, 4.537905, 1, 0, 0.8352941, 1,
1.074714, 1.222034, 1.072707, 1, 0, 0.827451, 1,
1.076805, 0.1411322, 2.29416, 1, 0, 0.8235294, 1,
1.078512, 0.5489255, 1.309463, 1, 0, 0.8156863, 1,
1.078712, -0.4568764, 4.100459, 1, 0, 0.8117647, 1,
1.080319, -0.9147491, 1.536038, 1, 0, 0.8039216, 1,
1.088919, -1.013962, 5.410467, 1, 0, 0.7960784, 1,
1.089871, -0.5042339, 1.499469, 1, 0, 0.7921569, 1,
1.094197, -0.6855989, 1.951856, 1, 0, 0.7843137, 1,
1.097355, 1.474519, 1.536836, 1, 0, 0.7803922, 1,
1.104017, -0.7574378, 4.19523, 1, 0, 0.772549, 1,
1.104101, 0.6287826, 1.915872, 1, 0, 0.7686275, 1,
1.106828, 0.7170135, 2.65355, 1, 0, 0.7607843, 1,
1.107324, 0.5751721, 0.9178776, 1, 0, 0.7568628, 1,
1.107492, -0.9416613, 2.315302, 1, 0, 0.7490196, 1,
1.10994, 0.5153778, 0.9535944, 1, 0, 0.7450981, 1,
1.11015, 0.1151452, 1.52416, 1, 0, 0.7372549, 1,
1.116029, 0.9831502, 0.8914528, 1, 0, 0.7333333, 1,
1.117439, 1.083396, 0.3332714, 1, 0, 0.7254902, 1,
1.117848, -0.7038008, 1.598939, 1, 0, 0.7215686, 1,
1.118526, -0.8373657, 1.464339, 1, 0, 0.7137255, 1,
1.119898, -1.080847, 1.562722, 1, 0, 0.7098039, 1,
1.124641, -0.6639264, 2.658559, 1, 0, 0.7019608, 1,
1.125296, -0.6264026, 1.161167, 1, 0, 0.6941177, 1,
1.130598, -0.6065356, 1.847114, 1, 0, 0.6901961, 1,
1.136524, 0.151885, 2.416903, 1, 0, 0.682353, 1,
1.144987, 0.8024852, 1.628402, 1, 0, 0.6784314, 1,
1.150285, 0.3692665, 1.978315, 1, 0, 0.6705883, 1,
1.151826, 1.316274, 0.3635126, 1, 0, 0.6666667, 1,
1.153645, 0.518673, 1.199333, 1, 0, 0.6588235, 1,
1.157013, -0.6395384, 3.855417, 1, 0, 0.654902, 1,
1.162176, 1.980505, -0.02620157, 1, 0, 0.6470588, 1,
1.166958, 0.03885512, -0.2820872, 1, 0, 0.6431373, 1,
1.170803, 0.8682657, 1.730604, 1, 0, 0.6352941, 1,
1.171968, -0.402517, 1.672692, 1, 0, 0.6313726, 1,
1.175531, 1.298808, 0.6499481, 1, 0, 0.6235294, 1,
1.176883, -0.1582521, 1.155996, 1, 0, 0.6196079, 1,
1.179265, -0.04657242, 0.6716582, 1, 0, 0.6117647, 1,
1.183006, -1.448834, 2.672346, 1, 0, 0.6078432, 1,
1.184786, 1.043006, 0.06362348, 1, 0, 0.6, 1,
1.194393, 0.3155043, 3.849948, 1, 0, 0.5921569, 1,
1.19692, -0.1443762, 1.642877, 1, 0, 0.5882353, 1,
1.216003, 0.7599618, -0.2091391, 1, 0, 0.5803922, 1,
1.241836, -0.5419503, 2.882884, 1, 0, 0.5764706, 1,
1.255153, -1.061321, 1.997033, 1, 0, 0.5686275, 1,
1.255232, 0.2149275, 2.637854, 1, 0, 0.5647059, 1,
1.255276, 1.235109, 2.123557, 1, 0, 0.5568628, 1,
1.269679, -1.475677, 0.8147533, 1, 0, 0.5529412, 1,
1.276356, -0.7059113, 0.2051854, 1, 0, 0.5450981, 1,
1.280412, 1.150996, -0.5647008, 1, 0, 0.5411765, 1,
1.286727, 0.3201398, 0.6054578, 1, 0, 0.5333334, 1,
1.306624, -1.634291, 2.928082, 1, 0, 0.5294118, 1,
1.308705, 1.387693, 1.178827, 1, 0, 0.5215687, 1,
1.309297, 0.01656993, 0.08238421, 1, 0, 0.5176471, 1,
1.310056, 1.26226, 0.01839962, 1, 0, 0.509804, 1,
1.31135, -1.004677, 2.809364, 1, 0, 0.5058824, 1,
1.323305, -0.4425125, 1.147027, 1, 0, 0.4980392, 1,
1.346031, 0.7768058, 2.095618, 1, 0, 0.4901961, 1,
1.347923, 0.4300296, 1.023195, 1, 0, 0.4862745, 1,
1.349828, 1.111319, -0.7956753, 1, 0, 0.4784314, 1,
1.366384, 2.390026, -2.104265, 1, 0, 0.4745098, 1,
1.367671, -0.6483908, 1.8279, 1, 0, 0.4666667, 1,
1.404612, -0.02919667, 3.282077, 1, 0, 0.4627451, 1,
1.405633, 0.6662512, 0.4964269, 1, 0, 0.454902, 1,
1.437407, -0.3632931, 1.808682, 1, 0, 0.4509804, 1,
1.441555, 0.6550165, 0.8778046, 1, 0, 0.4431373, 1,
1.461298, -1.734222, 1.947804, 1, 0, 0.4392157, 1,
1.464038, -0.680001, 1.772427, 1, 0, 0.4313726, 1,
1.466923, -0.0645645, 2.734963, 1, 0, 0.427451, 1,
1.468007, 0.9457221, 2.535147, 1, 0, 0.4196078, 1,
1.469741, 0.1184778, 0.7419077, 1, 0, 0.4156863, 1,
1.472438, 0.07744092, 2.579061, 1, 0, 0.4078431, 1,
1.47579, 0.6059032, 0.2424861, 1, 0, 0.4039216, 1,
1.480833, -0.4524859, 2.470484, 1, 0, 0.3960784, 1,
1.490727, 2.092734, -0.302181, 1, 0, 0.3882353, 1,
1.523992, 1.050501, 2.064865, 1, 0, 0.3843137, 1,
1.524575, -0.993569, -1.052331, 1, 0, 0.3764706, 1,
1.534501, -0.8098801, 1.585831, 1, 0, 0.372549, 1,
1.53522, 1.225233, 1.960774, 1, 0, 0.3647059, 1,
1.542231, -1.815864, 2.572415, 1, 0, 0.3607843, 1,
1.548803, -1.894559, 2.142687, 1, 0, 0.3529412, 1,
1.549796, 0.3846903, 2.265823, 1, 0, 0.3490196, 1,
1.554131, 0.34533, 0.2475464, 1, 0, 0.3411765, 1,
1.556138, 0.6870066, 2.909837, 1, 0, 0.3372549, 1,
1.578521, 0.8314113, 2.328869, 1, 0, 0.3294118, 1,
1.585291, -0.8978587, 3.139878, 1, 0, 0.3254902, 1,
1.60541, -0.4230295, 2.338151, 1, 0, 0.3176471, 1,
1.608981, -1.487395, 0.971331, 1, 0, 0.3137255, 1,
1.620569, 1.218489, 0.7368369, 1, 0, 0.3058824, 1,
1.623977, 1.096083, 0.1677645, 1, 0, 0.2980392, 1,
1.626717, -1.479455, 1.538926, 1, 0, 0.2941177, 1,
1.630048, -0.1371424, 3.012225, 1, 0, 0.2862745, 1,
1.633203, -0.9884989, 1.10787, 1, 0, 0.282353, 1,
1.641997, 1.371268, 0.6945209, 1, 0, 0.2745098, 1,
1.646794, 1.731327, 1.370322, 1, 0, 0.2705882, 1,
1.651123, 1.529887, 0.2587297, 1, 0, 0.2627451, 1,
1.654917, -0.5126417, 0.3867939, 1, 0, 0.2588235, 1,
1.670409, -0.5441037, 0.6809209, 1, 0, 0.2509804, 1,
1.677534, -1.097376, 3.741592, 1, 0, 0.2470588, 1,
1.677825, 2.168217, 0.3813629, 1, 0, 0.2392157, 1,
1.698042, 0.7133975, -0.1649161, 1, 0, 0.2352941, 1,
1.702999, 0.3364984, 0.3794876, 1, 0, 0.227451, 1,
1.710825, -1.068289, 1.577087, 1, 0, 0.2235294, 1,
1.72642, -0.6219581, 1.850545, 1, 0, 0.2156863, 1,
1.728495, -2.052455, 1.524251, 1, 0, 0.2117647, 1,
1.73195, 0.7338861, 1.240295, 1, 0, 0.2039216, 1,
1.744319, -0.1908909, 1.386896, 1, 0, 0.1960784, 1,
1.757042, -0.4578929, 1.337873, 1, 0, 0.1921569, 1,
1.763062, 1.103254, 2.060243, 1, 0, 0.1843137, 1,
1.769969, 1.298087, 1.104697, 1, 0, 0.1803922, 1,
1.794818, 0.1480622, 1.33783, 1, 0, 0.172549, 1,
1.830881, 0.9796039, 1.46035, 1, 0, 0.1686275, 1,
1.844496, -1.385419, 1.316729, 1, 0, 0.1607843, 1,
1.845275, 0.686196, 1.182349, 1, 0, 0.1568628, 1,
1.863347, 2.778288, 0.9506444, 1, 0, 0.1490196, 1,
1.942348, 0.6776263, 2.044069, 1, 0, 0.145098, 1,
1.962177, 0.01496769, 0.1781009, 1, 0, 0.1372549, 1,
1.972434, -0.9824792, 2.030713, 1, 0, 0.1333333, 1,
2.004984, -1.031083, -0.129886, 1, 0, 0.1254902, 1,
2.0273, 0.9685425, -0.2054054, 1, 0, 0.1215686, 1,
2.048048, -0.6068023, 1.93365, 1, 0, 0.1137255, 1,
2.074786, -0.4843195, 1.98011, 1, 0, 0.1098039, 1,
2.128207, 0.5417554, 1.564138, 1, 0, 0.1019608, 1,
2.194826, -0.5981746, 2.074039, 1, 0, 0.09411765, 1,
2.221733, 0.130466, 0.5760415, 1, 0, 0.09019608, 1,
2.267968, -0.366131, 1.82416, 1, 0, 0.08235294, 1,
2.305553, 0.2617961, 1.10815, 1, 0, 0.07843138, 1,
2.373585, 0.7885699, 2.431893, 1, 0, 0.07058824, 1,
2.404205, 1.036711, 1.935115, 1, 0, 0.06666667, 1,
2.411363, 0.5652544, 0.5490492, 1, 0, 0.05882353, 1,
2.502086, -0.1143651, 1.786626, 1, 0, 0.05490196, 1,
2.787326, 1.891418, 0.9948362, 1, 0, 0.04705882, 1,
2.951077, 1.448766, 1.212691, 1, 0, 0.04313726, 1,
2.974411, -1.251037, 4.011483, 1, 0, 0.03529412, 1,
2.992543, -1.715728, 1.442023, 1, 0, 0.03137255, 1,
2.995612, 0.07334635, 0.2833215, 1, 0, 0.02352941, 1,
3.076808, 1.156191, 2.502578, 1, 0, 0.01960784, 1,
3.48397, 0.3951319, 1.469547, 1, 0, 0.01176471, 1,
3.755187, -0.2097698, 1.235558, 1, 0, 0.007843138, 1
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
0.1835033, -5.087622, -7.120672, 0, -0.5, 0.5, 0.5,
0.1835033, -5.087622, -7.120672, 1, -0.5, 0.5, 0.5,
0.1835033, -5.087622, -7.120672, 1, 1.5, 0.5, 0.5,
0.1835033, -5.087622, -7.120672, 0, 1.5, 0.5, 0.5
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
-4.598981, -0.3123504, -7.120672, 0, -0.5, 0.5, 0.5,
-4.598981, -0.3123504, -7.120672, 1, -0.5, 0.5, 0.5,
-4.598981, -0.3123504, -7.120672, 1, 1.5, 0.5, 0.5,
-4.598981, -0.3123504, -7.120672, 0, 1.5, 0.5, 0.5
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
-4.598981, -5.087622, 0.05298996, 0, -0.5, 0.5, 0.5,
-4.598981, -5.087622, 0.05298996, 1, -0.5, 0.5, 0.5,
-4.598981, -5.087622, 0.05298996, 1, 1.5, 0.5, 0.5,
-4.598981, -5.087622, 0.05298996, 0, 1.5, 0.5, 0.5
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
-2, -3.985636, -5.465211,
2, -3.985636, -5.465211,
-2, -3.985636, -5.465211,
-2, -4.169301, -5.741122,
0, -3.985636, -5.465211,
0, -4.169301, -5.741122,
2, -3.985636, -5.465211,
2, -4.169301, -5.741122
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
"0",
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
-2, -4.536629, -6.292942, 0, -0.5, 0.5, 0.5,
-2, -4.536629, -6.292942, 1, -0.5, 0.5, 0.5,
-2, -4.536629, -6.292942, 1, 1.5, 0.5, 0.5,
-2, -4.536629, -6.292942, 0, 1.5, 0.5, 0.5,
0, -4.536629, -6.292942, 0, -0.5, 0.5, 0.5,
0, -4.536629, -6.292942, 1, -0.5, 0.5, 0.5,
0, -4.536629, -6.292942, 1, 1.5, 0.5, 0.5,
0, -4.536629, -6.292942, 0, 1.5, 0.5, 0.5,
2, -4.536629, -6.292942, 0, -0.5, 0.5, 0.5,
2, -4.536629, -6.292942, 1, -0.5, 0.5, 0.5,
2, -4.536629, -6.292942, 1, 1.5, 0.5, 0.5,
2, -4.536629, -6.292942, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.495331, -2, -5.465211,
-3.495331, 2, -5.465211,
-3.495331, -2, -5.465211,
-3.679272, -2, -5.741122,
-3.495331, 0, -5.465211,
-3.679272, 0, -5.741122,
-3.495331, 2, -5.465211,
-3.679272, 2, -5.741122
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
"0",
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
-4.047156, -2, -6.292942, 0, -0.5, 0.5, 0.5,
-4.047156, -2, -6.292942, 1, -0.5, 0.5, 0.5,
-4.047156, -2, -6.292942, 1, 1.5, 0.5, 0.5,
-4.047156, -2, -6.292942, 0, 1.5, 0.5, 0.5,
-4.047156, 0, -6.292942, 0, -0.5, 0.5, 0.5,
-4.047156, 0, -6.292942, 1, -0.5, 0.5, 0.5,
-4.047156, 0, -6.292942, 1, 1.5, 0.5, 0.5,
-4.047156, 0, -6.292942, 0, 1.5, 0.5, 0.5,
-4.047156, 2, -6.292942, 0, -0.5, 0.5, 0.5,
-4.047156, 2, -6.292942, 1, -0.5, 0.5, 0.5,
-4.047156, 2, -6.292942, 1, 1.5, 0.5, 0.5,
-4.047156, 2, -6.292942, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.495331, -3.985636, -4,
-3.495331, -3.985636, 4,
-3.495331, -3.985636, -4,
-3.679272, -4.169301, -4,
-3.495331, -3.985636, -2,
-3.679272, -4.169301, -2,
-3.495331, -3.985636, 0,
-3.679272, -4.169301, 0,
-3.495331, -3.985636, 2,
-3.679272, -4.169301, 2,
-3.495331, -3.985636, 4,
-3.679272, -4.169301, 4
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
-4.047156, -4.536629, -4, 0, -0.5, 0.5, 0.5,
-4.047156, -4.536629, -4, 1, -0.5, 0.5, 0.5,
-4.047156, -4.536629, -4, 1, 1.5, 0.5, 0.5,
-4.047156, -4.536629, -4, 0, 1.5, 0.5, 0.5,
-4.047156, -4.536629, -2, 0, -0.5, 0.5, 0.5,
-4.047156, -4.536629, -2, 1, -0.5, 0.5, 0.5,
-4.047156, -4.536629, -2, 1, 1.5, 0.5, 0.5,
-4.047156, -4.536629, -2, 0, 1.5, 0.5, 0.5,
-4.047156, -4.536629, 0, 0, -0.5, 0.5, 0.5,
-4.047156, -4.536629, 0, 1, -0.5, 0.5, 0.5,
-4.047156, -4.536629, 0, 1, 1.5, 0.5, 0.5,
-4.047156, -4.536629, 0, 0, 1.5, 0.5, 0.5,
-4.047156, -4.536629, 2, 0, -0.5, 0.5, 0.5,
-4.047156, -4.536629, 2, 1, -0.5, 0.5, 0.5,
-4.047156, -4.536629, 2, 1, 1.5, 0.5, 0.5,
-4.047156, -4.536629, 2, 0, 1.5, 0.5, 0.5,
-4.047156, -4.536629, 4, 0, -0.5, 0.5, 0.5,
-4.047156, -4.536629, 4, 1, -0.5, 0.5, 0.5,
-4.047156, -4.536629, 4, 1, 1.5, 0.5, 0.5,
-4.047156, -4.536629, 4, 0, 1.5, 0.5, 0.5
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
-3.495331, -3.985636, -5.465211,
-3.495331, 3.360936, -5.465211,
-3.495331, -3.985636, 5.571191,
-3.495331, 3.360936, 5.571191,
-3.495331, -3.985636, -5.465211,
-3.495331, -3.985636, 5.571191,
-3.495331, 3.360936, -5.465211,
-3.495331, 3.360936, 5.571191,
-3.495331, -3.985636, -5.465211,
3.862337, -3.985636, -5.465211,
-3.495331, -3.985636, 5.571191,
3.862337, -3.985636, 5.571191,
-3.495331, 3.360936, -5.465211,
3.862337, 3.360936, -5.465211,
-3.495331, 3.360936, 5.571191,
3.862337, 3.360936, 5.571191,
3.862337, -3.985636, -5.465211,
3.862337, 3.360936, -5.465211,
3.862337, -3.985636, 5.571191,
3.862337, 3.360936, 5.571191,
3.862337, -3.985636, -5.465211,
3.862337, -3.985636, 5.571191,
3.862337, 3.360936, -5.465211,
3.862337, 3.360936, 5.571191
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
var radius = 8.096625;
var distance = 36.0228;
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
mvMatrix.translate( -0.1835033, 0.3123504, -0.05298996 );
mvMatrix.scale( 1.18981, 1.191607, 0.793214 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.0228);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
sethoxydim<-read.table("sethoxydim.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-sethoxydim$V2
```

```
## Error in eval(expr, envir, enclos): object 'sethoxydim' not found
```

```r
y<-sethoxydim$V3
```

```
## Error in eval(expr, envir, enclos): object 'sethoxydim' not found
```

```r
z<-sethoxydim$V4
```

```
## Error in eval(expr, envir, enclos): object 'sethoxydim' not found
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
-3.38818, 1.236056, -0.7842047, 0, 0, 1, 1, 1,
-2.803031, -0.7003422, -2.025091, 1, 0, 0, 1, 1,
-2.712176, 1.013381, 0.1196977, 1, 0, 0, 1, 1,
-2.671028, 0.03696502, -1.570632, 1, 0, 0, 1, 1,
-2.610326, 0.5418285, -0.7915125, 1, 0, 0, 1, 1,
-2.521057, -0.6185459, -2.296426, 1, 0, 0, 1, 1,
-2.483265, 1.032964, -1.682786, 0, 0, 0, 1, 1,
-2.423258, 0.00649992, -3.304264, 0, 0, 0, 1, 1,
-2.317734, 1.173362, -2.429034, 0, 0, 0, 1, 1,
-2.313543, -0.0969867, -0.3603258, 0, 0, 0, 1, 1,
-2.30445, 1.386803, -2.277876, 0, 0, 0, 1, 1,
-2.298887, -0.09785614, -1.583058, 0, 0, 0, 1, 1,
-2.292475, 0.5476489, -1.391168, 0, 0, 0, 1, 1,
-2.288312, 1.30744, -1.384002, 1, 1, 1, 1, 1,
-2.279315, -0.1073427, -4.144759, 1, 1, 1, 1, 1,
-2.215991, -1.265358, -2.723734, 1, 1, 1, 1, 1,
-2.209707, -1.263878, -0.7182403, 1, 1, 1, 1, 1,
-2.207653, 1.132335, 0.9203087, 1, 1, 1, 1, 1,
-2.198432, 1.518814, -2.578701, 1, 1, 1, 1, 1,
-2.197585, -1.879213, -3.499433, 1, 1, 1, 1, 1,
-2.196549, -1.368671, -2.260687, 1, 1, 1, 1, 1,
-2.159163, 0.2399264, -2.715219, 1, 1, 1, 1, 1,
-2.102167, -1.214533, -3.064685, 1, 1, 1, 1, 1,
-2.099271, -0.5867068, -0.6567786, 1, 1, 1, 1, 1,
-2.097526, 0.2356894, -1.502509, 1, 1, 1, 1, 1,
-2.077949, -2.949939, -2.802205, 1, 1, 1, 1, 1,
-2.025265, -0.1765072, -3.085894, 1, 1, 1, 1, 1,
-2.023846, -0.2341056, -2.952378, 1, 1, 1, 1, 1,
-2.009935, -0.769249, -2.924191, 0, 0, 1, 1, 1,
-1.996856, -0.8364926, -2.768879, 1, 0, 0, 1, 1,
-1.990813, -2.475619, -0.8927418, 1, 0, 0, 1, 1,
-1.98279, 0.32434, -2.44242, 1, 0, 0, 1, 1,
-1.979539, 0.2931079, -1.978062, 1, 0, 0, 1, 1,
-1.9506, 2.326654, -0.882804, 1, 0, 0, 1, 1,
-1.938606, -0.1236855, -2.5823, 0, 0, 0, 1, 1,
-1.924636, 2.360584, -2.720028, 0, 0, 0, 1, 1,
-1.911837, -0.5171632, -1.776701, 0, 0, 0, 1, 1,
-1.887293, -1.785537, -2.084938, 0, 0, 0, 1, 1,
-1.876453, -0.6181372, -2.924085, 0, 0, 0, 1, 1,
-1.873652, -1.677856, -0.9671874, 0, 0, 0, 1, 1,
-1.873155, -0.9684082, -1.475189, 0, 0, 0, 1, 1,
-1.854778, 0.9164574, -1.613609, 1, 1, 1, 1, 1,
-1.846942, -1.107048, 0.7218123, 1, 1, 1, 1, 1,
-1.845219, 1.457446, -0.860271, 1, 1, 1, 1, 1,
-1.829152, -0.8094077, -2.022085, 1, 1, 1, 1, 1,
-1.810248, -2.033819, -3.31365, 1, 1, 1, 1, 1,
-1.788031, -0.7164543, -1.709977, 1, 1, 1, 1, 1,
-1.757836, -0.9574687, -1.537092, 1, 1, 1, 1, 1,
-1.752598, -0.4654372, -0.6484373, 1, 1, 1, 1, 1,
-1.745203, -0.7583552, -1.997513, 1, 1, 1, 1, 1,
-1.744074, 0.3656171, -1.487212, 1, 1, 1, 1, 1,
-1.72163, -2.596103, -3.466102, 1, 1, 1, 1, 1,
-1.716598, -1.513261, -0.2700144, 1, 1, 1, 1, 1,
-1.715962, -1.479392, -1.274332, 1, 1, 1, 1, 1,
-1.692319, 0.5175624, -2.096136, 1, 1, 1, 1, 1,
-1.679078, 1.504363, -2.333673, 1, 1, 1, 1, 1,
-1.669323, 0.2208885, -1.406472, 0, 0, 1, 1, 1,
-1.661073, -1.934988, -3.50654, 1, 0, 0, 1, 1,
-1.645001, 0.283512, -1.83107, 1, 0, 0, 1, 1,
-1.644558, 1.117961, -2.20104, 1, 0, 0, 1, 1,
-1.63038, 0.3842452, 0.9978902, 1, 0, 0, 1, 1,
-1.626333, -1.362287, -2.696922, 1, 0, 0, 1, 1,
-1.611155, 0.4568687, -0.3629608, 0, 0, 0, 1, 1,
-1.601572, 0.4032624, -2.024676, 0, 0, 0, 1, 1,
-1.601423, -0.8199129, -3.066175, 0, 0, 0, 1, 1,
-1.59997, 0.3931445, -1.055315, 0, 0, 0, 1, 1,
-1.595764, 1.475825, -1.73634, 0, 0, 0, 1, 1,
-1.583395, 0.09097474, -2.2754, 0, 0, 0, 1, 1,
-1.573232, 0.3323919, -2.116987, 0, 0, 0, 1, 1,
-1.56019, -0.7289657, -1.135151, 1, 1, 1, 1, 1,
-1.556838, 1.206398, -1.988847, 1, 1, 1, 1, 1,
-1.550425, -1.276934, -1.555709, 1, 1, 1, 1, 1,
-1.53671, 0.7936001, -1.410061, 1, 1, 1, 1, 1,
-1.534125, -0.3238896, -1.212684, 1, 1, 1, 1, 1,
-1.528116, -0.8205132, -1.172674, 1, 1, 1, 1, 1,
-1.52617, -0.3504501, -1.474069, 1, 1, 1, 1, 1,
-1.510512, 1.460181, -0.2368811, 1, 1, 1, 1, 1,
-1.501125, -0.8069652, -3.150383, 1, 1, 1, 1, 1,
-1.497536, 0.5252525, -2.831408, 1, 1, 1, 1, 1,
-1.497366, 1.166214, -0.3338809, 1, 1, 1, 1, 1,
-1.494795, -0.2192213, -0.7251993, 1, 1, 1, 1, 1,
-1.471883, -0.6952956, -1.647803, 1, 1, 1, 1, 1,
-1.451138, -1.117714, -3.112901, 1, 1, 1, 1, 1,
-1.446844, 1.691523, 0.4321075, 1, 1, 1, 1, 1,
-1.435114, -1.633018, -0.7986287, 0, 0, 1, 1, 1,
-1.427555, 1.420527, -0.08074411, 1, 0, 0, 1, 1,
-1.425748, 0.1780049, -2.084707, 1, 0, 0, 1, 1,
-1.41584, -0.09916873, -1.603877, 1, 0, 0, 1, 1,
-1.415309, 2.743208, 1.686175, 1, 0, 0, 1, 1,
-1.408866, 1.131546, -1.574376, 1, 0, 0, 1, 1,
-1.390186, -0.721801, -1.125162, 0, 0, 0, 1, 1,
-1.384603, -0.08586128, -2.129432, 0, 0, 0, 1, 1,
-1.377501, 0.48416, -2.263626, 0, 0, 0, 1, 1,
-1.370327, -0.9088645, -0.6940965, 0, 0, 0, 1, 1,
-1.367948, -0.1019393, 0.2459132, 0, 0, 0, 1, 1,
-1.362344, -0.400595, -2.891526, 0, 0, 0, 1, 1,
-1.355704, 0.747282, -1.635078, 0, 0, 0, 1, 1,
-1.35127, 0.05298026, -1.059231, 1, 1, 1, 1, 1,
-1.350676, -0.6965983, -2.828922, 1, 1, 1, 1, 1,
-1.343043, 0.2024896, -2.862971, 1, 1, 1, 1, 1,
-1.338433, 0.8820621, -2.08267, 1, 1, 1, 1, 1,
-1.333403, 0.2243779, -0.8149649, 1, 1, 1, 1, 1,
-1.327289, -0.9681351, -1.771125, 1, 1, 1, 1, 1,
-1.325898, -0.5584228, -2.568201, 1, 1, 1, 1, 1,
-1.319592, -1.226084, -1.494021, 1, 1, 1, 1, 1,
-1.31201, -0.3157613, -1.541711, 1, 1, 1, 1, 1,
-1.304892, 0.8489748, -1.066659, 1, 1, 1, 1, 1,
-1.302289, 1.140259, -0.6663132, 1, 1, 1, 1, 1,
-1.297228, -1.615157, -4.342853, 1, 1, 1, 1, 1,
-1.297083, 0.2727555, -2.000841, 1, 1, 1, 1, 1,
-1.285964, 0.1324623, -2.722126, 1, 1, 1, 1, 1,
-1.285246, -1.739181, -2.45008, 1, 1, 1, 1, 1,
-1.272815, 0.3215475, 0.7024905, 0, 0, 1, 1, 1,
-1.261737, -0.04282595, -2.316092, 1, 0, 0, 1, 1,
-1.260001, 0.6843416, 0.06992269, 1, 0, 0, 1, 1,
-1.259154, -0.2994832, -1.634665, 1, 0, 0, 1, 1,
-1.257411, -1.629615, -2.30553, 1, 0, 0, 1, 1,
-1.255679, -0.5069542, -2.199446, 1, 0, 0, 1, 1,
-1.253642, -0.07194301, -1.740343, 0, 0, 0, 1, 1,
-1.251096, 1.659607, 0.9880613, 0, 0, 0, 1, 1,
-1.240615, 1.700843, -0.30872, 0, 0, 0, 1, 1,
-1.238566, -3.878648, -2.678278, 0, 0, 0, 1, 1,
-1.237078, -1.155766, -3.906598, 0, 0, 0, 1, 1,
-1.236217, -1.452736, -2.095554, 0, 0, 0, 1, 1,
-1.232167, -0.5244667, -0.5530929, 0, 0, 0, 1, 1,
-1.225366, -0.3070897, -2.170954, 1, 1, 1, 1, 1,
-1.223886, -0.4682705, -2.671821, 1, 1, 1, 1, 1,
-1.223545, 0.59223, -0.4385546, 1, 1, 1, 1, 1,
-1.21858, -0.1127606, -0.9964983, 1, 1, 1, 1, 1,
-1.213642, 1.172116, 0.1514015, 1, 1, 1, 1, 1,
-1.208228, 0.8065454, -1.40615, 1, 1, 1, 1, 1,
-1.205603, -0.08008305, -2.074454, 1, 1, 1, 1, 1,
-1.204149, 0.6893668, 0.04550546, 1, 1, 1, 1, 1,
-1.198247, -1.014657, -2.006439, 1, 1, 1, 1, 1,
-1.197066, -0.1069986, -0.4308105, 1, 1, 1, 1, 1,
-1.196982, 1.305107, -2.603566, 1, 1, 1, 1, 1,
-1.193544, -0.5434349, -2.306517, 1, 1, 1, 1, 1,
-1.193281, 1.562745, 0.3409122, 1, 1, 1, 1, 1,
-1.192194, -1.745744, -3.629834, 1, 1, 1, 1, 1,
-1.192, 0.2829979, -0.6106462, 1, 1, 1, 1, 1,
-1.191004, 0.3172034, -1.712062, 0, 0, 1, 1, 1,
-1.188301, 1.998948, -0.8725716, 1, 0, 0, 1, 1,
-1.174621, -1.129716, -2.747115, 1, 0, 0, 1, 1,
-1.174534, -0.8263839, -2.630096, 1, 0, 0, 1, 1,
-1.165271, 0.4668324, -2.297852, 1, 0, 0, 1, 1,
-1.164724, -0.5992633, -2.528516, 1, 0, 0, 1, 1,
-1.163633, -2.125492, -3.507824, 0, 0, 0, 1, 1,
-1.161878, 0.2379999, -2.051419, 0, 0, 0, 1, 1,
-1.161553, -0.4113393, -1.645735, 0, 0, 0, 1, 1,
-1.149821, -0.6264081, -2.907737, 0, 0, 0, 1, 1,
-1.148888, -0.4526535, -1.736422, 0, 0, 0, 1, 1,
-1.144993, 0.07573948, -3.147737, 0, 0, 0, 1, 1,
-1.139058, -0.2167766, -0.7803864, 0, 0, 0, 1, 1,
-1.138156, -1.778725, -3.008167, 1, 1, 1, 1, 1,
-1.138063, 1.080873, -0.6076306, 1, 1, 1, 1, 1,
-1.137053, -1.771178, -2.82519, 1, 1, 1, 1, 1,
-1.12696, 1.473912, -1.119729, 1, 1, 1, 1, 1,
-1.122028, -0.05660053, -1.249689, 1, 1, 1, 1, 1,
-1.117282, 0.4011762, -1.036145, 1, 1, 1, 1, 1,
-1.115314, 0.1421718, 0.7689003, 1, 1, 1, 1, 1,
-1.114023, -1.874112, -2.8716, 1, 1, 1, 1, 1,
-1.11103, -1.09682, -1.541612, 1, 1, 1, 1, 1,
-1.100276, -0.4771984, -2.581364, 1, 1, 1, 1, 1,
-1.095957, -0.5557365, -1.226308, 1, 1, 1, 1, 1,
-1.095391, -0.2108931, -1.219217, 1, 1, 1, 1, 1,
-1.090881, -0.2376076, -1.466098, 1, 1, 1, 1, 1,
-1.088709, 1.579518, -1.471083, 1, 1, 1, 1, 1,
-1.085678, 0.2840505, 0.9658526, 1, 1, 1, 1, 1,
-1.062312, 0.1684169, -1.108019, 0, 0, 1, 1, 1,
-1.061706, 2.221929, -1.574069, 1, 0, 0, 1, 1,
-1.057378, -0.4159755, -1.981791, 1, 0, 0, 1, 1,
-1.056782, 0.7785864, -2.040378, 1, 0, 0, 1, 1,
-1.055984, -0.9870658, -3.203456, 1, 0, 0, 1, 1,
-1.053535, 0.0747719, -3.540142, 1, 0, 0, 1, 1,
-1.051285, -0.8127314, -2.094218, 0, 0, 0, 1, 1,
-1.048479, -0.3990782, -2.130655, 0, 0, 0, 1, 1,
-1.044301, 1.253863, 0.5257741, 0, 0, 0, 1, 1,
-1.040205, 0.8970153, -2.635781, 0, 0, 0, 1, 1,
-1.032124, -0.07559932, -0.8009801, 0, 0, 0, 1, 1,
-1.026001, 0.06882138, -0.4013215, 0, 0, 0, 1, 1,
-1.01691, -0.07103772, -1.488024, 0, 0, 0, 1, 1,
-1.016308, 0.362406, -1.195638, 1, 1, 1, 1, 1,
-1.016295, -0.04324315, -2.689697, 1, 1, 1, 1, 1,
-1.007521, 0.9057909, -2.388582, 1, 1, 1, 1, 1,
-1.002418, 0.4040248, -2.222524, 1, 1, 1, 1, 1,
-0.9892029, -0.0416532, -0.1880981, 1, 1, 1, 1, 1,
-0.9826292, -1.052241, -1.618151, 1, 1, 1, 1, 1,
-0.9796438, 1.224651, -0.5492271, 1, 1, 1, 1, 1,
-0.969074, -0.9499916, -2.157072, 1, 1, 1, 1, 1,
-0.9690057, -0.1846312, -0.3212598, 1, 1, 1, 1, 1,
-0.9666926, -1.042568, -1.324637, 1, 1, 1, 1, 1,
-0.9640659, 0.9791548, -0.8204043, 1, 1, 1, 1, 1,
-0.9636395, -0.5920281, -1.617507, 1, 1, 1, 1, 1,
-0.9527124, 0.1688492, -1.875654, 1, 1, 1, 1, 1,
-0.9462228, -0.03732575, -0.6256084, 1, 1, 1, 1, 1,
-0.942843, 1.289224, -1.148434, 1, 1, 1, 1, 1,
-0.941521, -1.425513, -1.670208, 0, 0, 1, 1, 1,
-0.9401556, -0.9097746, -3.503273, 1, 0, 0, 1, 1,
-0.9387514, 0.6991871, -1.780974, 1, 0, 0, 1, 1,
-0.9274725, 0.3871208, -1.355251, 1, 0, 0, 1, 1,
-0.9226502, 1.603728, -0.05323025, 1, 0, 0, 1, 1,
-0.9216081, 0.00330147, -1.307476, 1, 0, 0, 1, 1,
-0.9195762, -0.5575076, -1.895513, 0, 0, 0, 1, 1,
-0.9129367, -0.3953707, -1.93616, 0, 0, 0, 1, 1,
-0.9100961, 0.2233204, -1.39587, 0, 0, 0, 1, 1,
-0.9082792, 0.4976086, -2.597754, 0, 0, 0, 1, 1,
-0.9065885, 0.03653716, -1.110307, 0, 0, 0, 1, 1,
-0.9036347, -1.723017, -4.597088, 0, 0, 0, 1, 1,
-0.8985835, -0.2723975, -0.9633452, 0, 0, 0, 1, 1,
-0.889631, 0.1132598, -2.015135, 1, 1, 1, 1, 1,
-0.8882589, 0.03305299, -2.320812, 1, 1, 1, 1, 1,
-0.8847708, -1.939873, -1.956955, 1, 1, 1, 1, 1,
-0.8834792, -1.941239, -2.16621, 1, 1, 1, 1, 1,
-0.8817315, 0.22435, -2.40076, 1, 1, 1, 1, 1,
-0.8766887, -0.6624321, -3.776513, 1, 1, 1, 1, 1,
-0.8702357, 0.311067, -0.0932426, 1, 1, 1, 1, 1,
-0.8685998, -0.6574393, -1.009064, 1, 1, 1, 1, 1,
-0.8672497, 0.1725429, -2.025187, 1, 1, 1, 1, 1,
-0.8484893, -0.8805515, -2.646583, 1, 1, 1, 1, 1,
-0.8366947, -1.035887, -2.615785, 1, 1, 1, 1, 1,
-0.8247659, -1.108092, -1.842947, 1, 1, 1, 1, 1,
-0.8241487, -1.149226, -2.841918, 1, 1, 1, 1, 1,
-0.8222857, -0.4374565, -5.276937, 1, 1, 1, 1, 1,
-0.8159634, 0.5158538, -2.551669, 1, 1, 1, 1, 1,
-0.8092242, -0.5541982, -1.156841, 0, 0, 1, 1, 1,
-0.8087509, 0.5579273, -4.597832, 1, 0, 0, 1, 1,
-0.8075313, -2.490024, -2.926175, 1, 0, 0, 1, 1,
-0.8073338, 0.3485662, -0.08001824, 1, 0, 0, 1, 1,
-0.8036641, 0.5207883, -0.9291968, 1, 0, 0, 1, 1,
-0.7973892, -0.5923721, -2.331059, 1, 0, 0, 1, 1,
-0.7928579, -0.3823533, -1.078888, 0, 0, 0, 1, 1,
-0.7925047, 0.8676007, -0.912755, 0, 0, 0, 1, 1,
-0.7897245, -2.012422, -2.683971, 0, 0, 0, 1, 1,
-0.78664, 0.5493367, 0.5565741, 0, 0, 0, 1, 1,
-0.7857963, 1.597604, -0.2025049, 0, 0, 0, 1, 1,
-0.7786677, 0.8442034, -2.52064, 0, 0, 0, 1, 1,
-0.7768323, -0.2140878, -2.100928, 0, 0, 0, 1, 1,
-0.7762967, 0.2284756, -0.295661, 1, 1, 1, 1, 1,
-0.7760317, 2.447231, 0.7728853, 1, 1, 1, 1, 1,
-0.7648607, 1.835906, -0.8286904, 1, 1, 1, 1, 1,
-0.7591757, 1.337583, 1.213588, 1, 1, 1, 1, 1,
-0.7584459, -1.425536, -0.1260375, 1, 1, 1, 1, 1,
-0.7561541, 1.409736, 0.2192778, 1, 1, 1, 1, 1,
-0.7505216, 1.030749, -2.245577, 1, 1, 1, 1, 1,
-0.7487389, 0.4041793, -2.024643, 1, 1, 1, 1, 1,
-0.7458212, 0.1019283, -0.5396938, 1, 1, 1, 1, 1,
-0.74402, -0.8598202, -1.208208, 1, 1, 1, 1, 1,
-0.7438148, -2.067843, -2.223303, 1, 1, 1, 1, 1,
-0.7433215, -1.855231, -0.9958117, 1, 1, 1, 1, 1,
-0.7406546, 1.650058, -2.615305, 1, 1, 1, 1, 1,
-0.7401568, -0.5939525, -2.187885, 1, 1, 1, 1, 1,
-0.738622, -0.6779222, 0.5583873, 1, 1, 1, 1, 1,
-0.736472, 0.7033235, -2.633502, 0, 0, 1, 1, 1,
-0.736291, 1.006219, 1.206724, 1, 0, 0, 1, 1,
-0.7346582, 0.5689647, -2.014942, 1, 0, 0, 1, 1,
-0.7297596, 0.7661293, 0.2454575, 1, 0, 0, 1, 1,
-0.7266771, -0.05662673, -0.6640152, 1, 0, 0, 1, 1,
-0.7223426, -2.999751, -3.304231, 1, 0, 0, 1, 1,
-0.7136582, 0.03648271, -2.474236, 0, 0, 0, 1, 1,
-0.7006809, -0.974264, -4.549379, 0, 0, 0, 1, 1,
-0.6950068, -0.2533158, -1.104263, 0, 0, 0, 1, 1,
-0.6926498, -0.1721561, -1.006202, 0, 0, 0, 1, 1,
-0.6881878, -2.072927, -1.527657, 0, 0, 0, 1, 1,
-0.6869162, 1.598675, -0.1350096, 0, 0, 0, 1, 1,
-0.6737835, -0.4010894, -2.040814, 0, 0, 0, 1, 1,
-0.6566342, 1.874962, 1.371678, 1, 1, 1, 1, 1,
-0.6550018, -1.075232, -2.037628, 1, 1, 1, 1, 1,
-0.6531526, -0.708471, -1.880595, 1, 1, 1, 1, 1,
-0.6511318, -0.2837532, -2.006569, 1, 1, 1, 1, 1,
-0.6503147, 1.087972, -0.7280559, 1, 1, 1, 1, 1,
-0.6501694, -2.720027, -4.0491, 1, 1, 1, 1, 1,
-0.6497833, 0.0963425, -0.7789664, 1, 1, 1, 1, 1,
-0.6491044, 0.1831382, 0.2365756, 1, 1, 1, 1, 1,
-0.6469137, -0.3682337, -1.44391, 1, 1, 1, 1, 1,
-0.6421956, 0.5131362, 0.3911363, 1, 1, 1, 1, 1,
-0.6421606, -1.923933, -1.091309, 1, 1, 1, 1, 1,
-0.6411415, -1.560764, -2.700242, 1, 1, 1, 1, 1,
-0.6374583, 0.1805205, 0.3775354, 1, 1, 1, 1, 1,
-0.6352854, 0.5034727, -1.604853, 1, 1, 1, 1, 1,
-0.6331396, -0.218251, -2.516963, 1, 1, 1, 1, 1,
-0.6329544, 0.0007525621, -1.020684, 0, 0, 1, 1, 1,
-0.6307314, -0.01892398, -3.403095, 1, 0, 0, 1, 1,
-0.6304637, -2.259501, -0.9251004, 1, 0, 0, 1, 1,
-0.6265318, -0.6458697, -2.373164, 1, 0, 0, 1, 1,
-0.626235, 2.712797, 0.3649885, 1, 0, 0, 1, 1,
-0.6203001, 1.824738, 0.1279635, 1, 0, 0, 1, 1,
-0.6199165, -0.2149186, -3.155428, 0, 0, 0, 1, 1,
-0.6108945, 0.3680789, -1.127558, 0, 0, 0, 1, 1,
-0.6092945, -0.07055414, -1.522779, 0, 0, 0, 1, 1,
-0.6072323, -0.9244246, -2.176104, 0, 0, 0, 1, 1,
-0.5997428, -0.7371051, -1.882139, 0, 0, 0, 1, 1,
-0.5922582, 1.705917, 0.8164907, 0, 0, 0, 1, 1,
-0.5879505, 0.8431185, -0.2289295, 0, 0, 0, 1, 1,
-0.5851279, 0.9612943, -0.3061497, 1, 1, 1, 1, 1,
-0.5814337, -0.2490993, -1.211374, 1, 1, 1, 1, 1,
-0.5812805, -1.217434, -2.739971, 1, 1, 1, 1, 1,
-0.5766069, 0.8874319, -0.3792687, 1, 1, 1, 1, 1,
-0.5708441, -1.666367, -2.673124, 1, 1, 1, 1, 1,
-0.5670611, -0.5831079, -2.647229, 1, 1, 1, 1, 1,
-0.5609521, -1.108595, -3.407926, 1, 1, 1, 1, 1,
-0.5608854, -0.7265904, -1.614713, 1, 1, 1, 1, 1,
-0.5582522, -0.009704579, -1.380561, 1, 1, 1, 1, 1,
-0.5522099, -0.6072456, -1.176462, 1, 1, 1, 1, 1,
-0.5471823, 0.05515061, 0.2879423, 1, 1, 1, 1, 1,
-0.5466081, -0.9734566, -1.930868, 1, 1, 1, 1, 1,
-0.54641, -0.4854805, -2.583296, 1, 1, 1, 1, 1,
-0.5454741, -1.298617, -2.732695, 1, 1, 1, 1, 1,
-0.5422582, -0.3803276, -1.943192, 1, 1, 1, 1, 1,
-0.5405008, 0.8130186, 0.1395548, 0, 0, 1, 1, 1,
-0.5306911, 1.911888, -0.255231, 1, 0, 0, 1, 1,
-0.5300633, 1.727778, 1.644627, 1, 0, 0, 1, 1,
-0.5271796, 0.5244869, -1.466995, 1, 0, 0, 1, 1,
-0.5268229, -0.02379747, -0.2236904, 1, 0, 0, 1, 1,
-0.5210003, -0.7068037, -2.62847, 1, 0, 0, 1, 1,
-0.520559, 0.7576723, -1.092668, 0, 0, 0, 1, 1,
-0.5195913, -1.063653, -3.140613, 0, 0, 0, 1, 1,
-0.5181733, -1.318679, -3.196056, 0, 0, 0, 1, 1,
-0.5116568, 0.894091, -2.707215, 0, 0, 0, 1, 1,
-0.5069221, 0.6311666, -2.529443, 0, 0, 0, 1, 1,
-0.5041298, 1.879727, 0.01032877, 0, 0, 0, 1, 1,
-0.5035841, 0.7914564, 1.498682, 0, 0, 0, 1, 1,
-0.4996013, 0.6111627, -0.2626992, 1, 1, 1, 1, 1,
-0.4971642, 0.05725182, -2.264934, 1, 1, 1, 1, 1,
-0.4953279, -1.215142, -3.675369, 1, 1, 1, 1, 1,
-0.488951, 1.385392, -0.3267773, 1, 1, 1, 1, 1,
-0.4854777, 0.1005269, -2.52876, 1, 1, 1, 1, 1,
-0.4847665, -0.2052323, -2.32953, 1, 1, 1, 1, 1,
-0.4775533, 0.06832879, -0.7017484, 1, 1, 1, 1, 1,
-0.4720164, -0.3645974, -2.792531, 1, 1, 1, 1, 1,
-0.4713134, -1.738099, -2.841251, 1, 1, 1, 1, 1,
-0.471067, -0.8128026, -2.496134, 1, 1, 1, 1, 1,
-0.4696802, 1.568475, 0.3988872, 1, 1, 1, 1, 1,
-0.4695759, -0.6826448, -2.802612, 1, 1, 1, 1, 1,
-0.4692653, 1.697302, 0.2617006, 1, 1, 1, 1, 1,
-0.4669337, -0.8715107, -2.198924, 1, 1, 1, 1, 1,
-0.4612992, 0.04565903, -2.605838, 1, 1, 1, 1, 1,
-0.4564625, -1.408651, -5.304487, 0, 0, 1, 1, 1,
-0.4463066, 0.4046381, -0.72358, 1, 0, 0, 1, 1,
-0.4432962, -1.589754, -2.285606, 1, 0, 0, 1, 1,
-0.443153, -0.7534638, -1.476461, 1, 0, 0, 1, 1,
-0.4416018, 0.1134839, 0.1059743, 1, 0, 0, 1, 1,
-0.4411258, -1.280935, -1.116243, 1, 0, 0, 1, 1,
-0.4296767, -1.749944, -3.669386, 0, 0, 0, 1, 1,
-0.4258534, 0.7882781, 0.06216796, 0, 0, 0, 1, 1,
-0.4245637, -1.002816, -3.457749, 0, 0, 0, 1, 1,
-0.4229825, -0.4931549, -2.863609, 0, 0, 0, 1, 1,
-0.4212067, -0.7688636, -2.7983, 0, 0, 0, 1, 1,
-0.4211861, 0.6806448, -0.8836216, 0, 0, 0, 1, 1,
-0.4139712, -0.7909599, -1.855653, 0, 0, 0, 1, 1,
-0.4128382, 0.8441954, 2.392456, 1, 1, 1, 1, 1,
-0.4084953, 0.9421004, -0.8582327, 1, 1, 1, 1, 1,
-0.4084061, 0.08933246, -1.334653, 1, 1, 1, 1, 1,
-0.4026553, -0.3103558, -1.895097, 1, 1, 1, 1, 1,
-0.39678, -1.241458, -2.906873, 1, 1, 1, 1, 1,
-0.3866652, -2.170591, -2.465405, 1, 1, 1, 1, 1,
-0.3846507, 1.031333, -0.2762629, 1, 1, 1, 1, 1,
-0.38232, 0.09852245, -0.6798015, 1, 1, 1, 1, 1,
-0.3787066, 1.286706, 0.2347574, 1, 1, 1, 1, 1,
-0.3785745, 0.187066, -0.4736989, 1, 1, 1, 1, 1,
-0.375832, -1.242228, -1.516072, 1, 1, 1, 1, 1,
-0.372808, 0.3846403, 0.06339291, 1, 1, 1, 1, 1,
-0.3713069, 0.7767612, -0.6829558, 1, 1, 1, 1, 1,
-0.3679447, -0.1691565, -2.156291, 1, 1, 1, 1, 1,
-0.367577, 0.704765, -0.1309404, 1, 1, 1, 1, 1,
-0.3666061, -1.217107, -3.34515, 0, 0, 1, 1, 1,
-0.3657519, -0.7625197, -5.172408, 1, 0, 0, 1, 1,
-0.3628066, 0.2954407, -1.041471, 1, 0, 0, 1, 1,
-0.3614877, 1.191364, -0.3972943, 1, 0, 0, 1, 1,
-0.3612131, 1.517049, -1.532474, 1, 0, 0, 1, 1,
-0.3511576, 0.01977255, -1.694793, 1, 0, 0, 1, 1,
-0.3501349, 0.937339, -1.397749, 0, 0, 0, 1, 1,
-0.3476881, 0.5441764, -1.593586, 0, 0, 0, 1, 1,
-0.3410547, 0.9293101, -0.2102572, 0, 0, 0, 1, 1,
-0.3378642, -0.200572, -1.487882, 0, 0, 0, 1, 1,
-0.3337276, -1.251146, -2.684973, 0, 0, 0, 1, 1,
-0.3270142, -0.07125226, -1.657423, 0, 0, 0, 1, 1,
-0.326566, -0.3132222, -0.4562744, 0, 0, 0, 1, 1,
-0.3247521, -1.369412, -1.554166, 1, 1, 1, 1, 1,
-0.3236322, -0.1957713, -3.239292, 1, 1, 1, 1, 1,
-0.323507, -0.8329577, -3.531742, 1, 1, 1, 1, 1,
-0.3230855, 0.375584, -1.779634, 1, 1, 1, 1, 1,
-0.3212202, -0.8130308, -3.292573, 1, 1, 1, 1, 1,
-0.319808, -0.338801, -1.97047, 1, 1, 1, 1, 1,
-0.3182426, 0.7310378, -1.231405, 1, 1, 1, 1, 1,
-0.3109789, 0.1290083, -1.622284, 1, 1, 1, 1, 1,
-0.3108115, -0.05369843, -2.06105, 1, 1, 1, 1, 1,
-0.3050469, 0.2338493, -2.308955, 1, 1, 1, 1, 1,
-0.3007709, -0.7089158, -3.237046, 1, 1, 1, 1, 1,
-0.3007291, -0.226623, -2.491575, 1, 1, 1, 1, 1,
-0.2998677, -1.58669, -2.177819, 1, 1, 1, 1, 1,
-0.2931026, 1.27124, 1.975125, 1, 1, 1, 1, 1,
-0.2881647, 0.4953864, -2.531248, 1, 1, 1, 1, 1,
-0.2881019, -0.638766, -2.460455, 0, 0, 1, 1, 1,
-0.2859654, 1.285238, -0.1611607, 1, 0, 0, 1, 1,
-0.2850786, -0.04654333, -1.66982, 1, 0, 0, 1, 1,
-0.2847792, -1.467145, -2.965657, 1, 0, 0, 1, 1,
-0.2837619, 1.331913, -1.000148, 1, 0, 0, 1, 1,
-0.2818201, -0.8261753, -1.7851, 1, 0, 0, 1, 1,
-0.2753521, 1.628734, -0.6803013, 0, 0, 0, 1, 1,
-0.2740718, -0.5506667, -2.334075, 0, 0, 0, 1, 1,
-0.2714231, 0.3667699, -0.2847417, 0, 0, 0, 1, 1,
-0.2705208, -0.8119345, -3.137201, 0, 0, 0, 1, 1,
-0.2672208, 0.360348, -1.813415, 0, 0, 0, 1, 1,
-0.2643352, 0.1610395, -1.839745, 0, 0, 0, 1, 1,
-0.2625032, 0.4328706, 0.004427081, 0, 0, 0, 1, 1,
-0.2610599, 0.7470808, -0.2597083, 1, 1, 1, 1, 1,
-0.2601117, 1.310756, -0.5434169, 1, 1, 1, 1, 1,
-0.2588605, 0.3184601, -2.283988, 1, 1, 1, 1, 1,
-0.257735, 1.425669, 1.13818, 1, 1, 1, 1, 1,
-0.2545119, -0.340943, -2.214304, 1, 1, 1, 1, 1,
-0.2490974, -1.217875, -2.416155, 1, 1, 1, 1, 1,
-0.2466723, 0.7450245, -0.8818231, 1, 1, 1, 1, 1,
-0.2441755, 0.1897433, -0.9210883, 1, 1, 1, 1, 1,
-0.2439106, -1.122793, -2.095604, 1, 1, 1, 1, 1,
-0.2431756, -0.4156652, -2.845876, 1, 1, 1, 1, 1,
-0.2393672, 0.7289975, 3.095998, 1, 1, 1, 1, 1,
-0.2383189, 1.421949, -1.76477, 1, 1, 1, 1, 1,
-0.2379004, 0.48892, 0.2635677, 1, 1, 1, 1, 1,
-0.2314678, 0.1463455, 0.6034248, 1, 1, 1, 1, 1,
-0.2200716, 0.8231932, -2.223772, 1, 1, 1, 1, 1,
-0.2126132, 0.7450222, 0.1266484, 0, 0, 1, 1, 1,
-0.2097326, 0.5548069, -1.502009, 1, 0, 0, 1, 1,
-0.2080627, 1.605358, -2.386218, 1, 0, 0, 1, 1,
-0.2072602, -0.5522166, -2.620773, 1, 0, 0, 1, 1,
-0.2036552, 0.5027894, -0.3626551, 1, 0, 0, 1, 1,
-0.2034609, -0.5144441, -3.44813, 1, 0, 0, 1, 1,
-0.2020182, 0.1642172, -0.1011574, 0, 0, 0, 1, 1,
-0.2010944, -0.8962017, -2.81696, 0, 0, 0, 1, 1,
-0.1999864, 0.0861081, -1.670987, 0, 0, 0, 1, 1,
-0.1942624, 0.5528231, -0.4630139, 0, 0, 0, 1, 1,
-0.1914684, 1.239743, 0.9575993, 0, 0, 0, 1, 1,
-0.1905614, -1.073348, -1.186855, 0, 0, 0, 1, 1,
-0.1877121, 0.9738194, -0.4136592, 0, 0, 0, 1, 1,
-0.1873989, 0.7185329, 0.8512896, 1, 1, 1, 1, 1,
-0.1832823, -0.6513932, -2.080833, 1, 1, 1, 1, 1,
-0.178572, -0.3717777, -2.091423, 1, 1, 1, 1, 1,
-0.1713361, 0.007997433, -0.7421355, 1, 1, 1, 1, 1,
-0.1709866, 1.02463, 1.191935, 1, 1, 1, 1, 1,
-0.1679381, -0.9282108, -2.171029, 1, 1, 1, 1, 1,
-0.1672121, 0.4961507, -0.9111446, 1, 1, 1, 1, 1,
-0.166041, -0.09102269, -2.187028, 1, 1, 1, 1, 1,
-0.1640109, -0.9181893, -3.525861, 1, 1, 1, 1, 1,
-0.1636498, -1.194005, -2.966753, 1, 1, 1, 1, 1,
-0.1632477, -0.2205887, -3.438929, 1, 1, 1, 1, 1,
-0.1625487, -2.071262, -1.514932, 1, 1, 1, 1, 1,
-0.1616117, 2.394143, 0.2313788, 1, 1, 1, 1, 1,
-0.1565883, 0.1781855, -1.926757, 1, 1, 1, 1, 1,
-0.1560396, -0.5487569, -3.717268, 1, 1, 1, 1, 1,
-0.1538238, 0.182825, 0.09872499, 0, 0, 1, 1, 1,
-0.147181, -1.186616, -4.521112, 1, 0, 0, 1, 1,
-0.1458005, -0.5906445, -1.424615, 1, 0, 0, 1, 1,
-0.1439527, -0.6956604, -2.634661, 1, 0, 0, 1, 1,
-0.1431687, -0.6168214, -3.613423, 1, 0, 0, 1, 1,
-0.1377717, -0.5880647, -3.065351, 1, 0, 0, 1, 1,
-0.1353242, 1.248188, -1.600809, 0, 0, 0, 1, 1,
-0.1348583, -0.9270848, -3.00299, 0, 0, 0, 1, 1,
-0.130058, -0.5151618, -2.629725, 0, 0, 0, 1, 1,
-0.1280817, -0.09233431, -4.899621, 0, 0, 0, 1, 1,
-0.125668, 1.436537, -0.8033537, 0, 0, 0, 1, 1,
-0.1246881, -1.678128, -2.263958, 0, 0, 0, 1, 1,
-0.1203394, -1.407992, -3.757791, 0, 0, 0, 1, 1,
-0.118986, 0.09071001, -0.6097386, 1, 1, 1, 1, 1,
-0.1179408, 1.530388, 1.26849, 1, 1, 1, 1, 1,
-0.112816, 1.284764, 1.015682, 1, 1, 1, 1, 1,
-0.1113761, -0.461004, -3.628465, 1, 1, 1, 1, 1,
-0.1106702, 0.9275212, -0.2062236, 1, 1, 1, 1, 1,
-0.1079663, 0.6899869, -0.3532242, 1, 1, 1, 1, 1,
-0.1064198, 1.14997, 0.136626, 1, 1, 1, 1, 1,
-0.1006924, 0.8157816, 0.9816654, 1, 1, 1, 1, 1,
-0.09853166, 0.4272094, -1.048127, 1, 1, 1, 1, 1,
-0.09812233, -0.671052, -2.456815, 1, 1, 1, 1, 1,
-0.09722503, 0.805721, -1.129486, 1, 1, 1, 1, 1,
-0.09611699, 0.8262347, 1.580138, 1, 1, 1, 1, 1,
-0.09175149, -1.265638, -4.363812, 1, 1, 1, 1, 1,
-0.08957712, -1.744737, -2.74024, 1, 1, 1, 1, 1,
-0.0869414, 0.4579757, 0.221185, 1, 1, 1, 1, 1,
-0.0831169, -0.225412, -1.787106, 0, 0, 1, 1, 1,
-0.08196727, -1.66093, -1.96388, 1, 0, 0, 1, 1,
-0.08154928, -0.6494509, -3.147993, 1, 0, 0, 1, 1,
-0.08069681, 0.1244925, -0.6728849, 1, 0, 0, 1, 1,
-0.07771061, -0.635987, -3.058849, 1, 0, 0, 1, 1,
-0.07523552, -0.07945299, -2.86141, 1, 0, 0, 1, 1,
-0.07519154, -0.5740464, -3.76561, 0, 0, 0, 1, 1,
-0.07330649, 0.1902298, 0.1109476, 0, 0, 0, 1, 1,
-0.07037313, -1.465486, -3.933612, 0, 0, 0, 1, 1,
-0.07001069, -0.7104514, -4.368348, 0, 0, 0, 1, 1,
-0.06961926, -0.4581542, -2.109471, 0, 0, 0, 1, 1,
-0.06757315, -0.6769451, -2.618304, 0, 0, 0, 1, 1,
-0.05707572, 1.043667, -0.4453289, 0, 0, 0, 1, 1,
-0.05281892, -0.7857919, -1.342474, 1, 1, 1, 1, 1,
-0.04849041, -0.8246347, -2.06591, 1, 1, 1, 1, 1,
-0.04477333, -0.457274, -1.796956, 1, 1, 1, 1, 1,
-0.04233632, 0.178408, -0.2757255, 1, 1, 1, 1, 1,
-0.04222003, 0.1499428, -0.09028128, 1, 1, 1, 1, 1,
-0.0416292, -1.452642, -2.665198, 1, 1, 1, 1, 1,
-0.04115359, -0.8195065, -3.917348, 1, 1, 1, 1, 1,
-0.04032289, 0.5744178, 0.1531443, 1, 1, 1, 1, 1,
-0.03759648, 0.3620776, -0.008797819, 1, 1, 1, 1, 1,
-0.03276162, 0.9158163, 0.5252057, 1, 1, 1, 1, 1,
-0.03081517, -0.2140862, -2.112756, 1, 1, 1, 1, 1,
-0.02668637, -1.463327, -4.282266, 1, 1, 1, 1, 1,
-0.02618962, -1.069492, -2.348115, 1, 1, 1, 1, 1,
-0.02208279, -0.1280167, -3.380525, 1, 1, 1, 1, 1,
-0.01159686, 1.100581, -0.6071959, 1, 1, 1, 1, 1,
-0.00973771, -0.9027187, -2.933917, 0, 0, 1, 1, 1,
-0.008362424, -0.5935556, -1.750834, 1, 0, 0, 1, 1,
-0.005010247, 0.4203543, 0.6380061, 1, 0, 0, 1, 1,
-0.003088433, -0.3660371, -3.637881, 1, 0, 0, 1, 1,
-0.002241546, -0.979403, -4.317479, 1, 0, 0, 1, 1,
-0.0003229497, 0.07575759, -0.2030276, 1, 0, 0, 1, 1,
0.01027478, 0.839662, 1.492532, 0, 0, 0, 1, 1,
0.0103751, 0.4480791, -0.2137125, 0, 0, 0, 1, 1,
0.01154574, 0.5235177, 0.7102634, 0, 0, 0, 1, 1,
0.01393972, -1.134496, 3.087466, 0, 0, 0, 1, 1,
0.01521126, -1.040312, 2.799021, 0, 0, 0, 1, 1,
0.01755127, 0.3189129, -0.4772144, 0, 0, 0, 1, 1,
0.01768061, 1.654976, -0.8863277, 0, 0, 0, 1, 1,
0.02514165, 0.2537019, -0.3997023, 1, 1, 1, 1, 1,
0.02615745, 0.9325285, 0.74018, 1, 1, 1, 1, 1,
0.02930295, 1.339386, -1.951874, 1, 1, 1, 1, 1,
0.03367547, 1.024549, 1.093309, 1, 1, 1, 1, 1,
0.0388892, -0.2503965, 3.417779, 1, 1, 1, 1, 1,
0.04315917, 0.842063, 1.288657, 1, 1, 1, 1, 1,
0.04332231, 0.09695489, 0.9193983, 1, 1, 1, 1, 1,
0.04458871, -0.1269333, 1.94725, 1, 1, 1, 1, 1,
0.04978488, 0.3345988, -0.6697343, 1, 1, 1, 1, 1,
0.05060685, 1.226634, 0.3676452, 1, 1, 1, 1, 1,
0.05147044, -0.9274314, 2.377688, 1, 1, 1, 1, 1,
0.05183845, 0.02000378, 1.526057, 1, 1, 1, 1, 1,
0.05217849, -0.6157686, 3.454949, 1, 1, 1, 1, 1,
0.0545735, 0.8743204, -0.7823061, 1, 1, 1, 1, 1,
0.05658417, -1.216816, 3.922539, 1, 1, 1, 1, 1,
0.0604611, -0.0291377, 1.465887, 0, 0, 1, 1, 1,
0.06182894, 0.9283987, 0.02903398, 1, 0, 0, 1, 1,
0.0634283, 0.3604678, 0.8367463, 1, 0, 0, 1, 1,
0.06689923, -0.5621071, 4.234956, 1, 0, 0, 1, 1,
0.06847349, -0.1756126, 2.381757, 1, 0, 0, 1, 1,
0.07025394, 0.1653869, -0.05918539, 1, 0, 0, 1, 1,
0.0711187, 1.779745, 0.7166622, 0, 0, 0, 1, 1,
0.07394217, 2.346129, 0.5274488, 0, 0, 0, 1, 1,
0.07864428, -0.5624438, 2.997337, 0, 0, 0, 1, 1,
0.08288912, -0.6190901, 2.604055, 0, 0, 0, 1, 1,
0.08373117, 0.3093291, 0.9626116, 0, 0, 0, 1, 1,
0.08874631, 0.3461613, 0.2916453, 0, 0, 0, 1, 1,
0.09234921, -1.117302, 2.760712, 0, 0, 0, 1, 1,
0.09376358, 2.065969, 1.537733, 1, 1, 1, 1, 1,
0.1036097, 0.4721513, -0.1087449, 1, 1, 1, 1, 1,
0.1058608, 0.2198262, 1.043238, 1, 1, 1, 1, 1,
0.1060943, -0.7386372, 4.864205, 1, 1, 1, 1, 1,
0.110408, 0.7462397, -1.770888, 1, 1, 1, 1, 1,
0.1112734, 0.6573427, -1.308346, 1, 1, 1, 1, 1,
0.1124472, 1.106457, 0.38287, 1, 1, 1, 1, 1,
0.1137489, 0.2962093, 0.7430639, 1, 1, 1, 1, 1,
0.1194338, -0.7674024, 2.760432, 1, 1, 1, 1, 1,
0.1204852, -0.465624, 3.263836, 1, 1, 1, 1, 1,
0.124109, 0.4332978, 1.906375, 1, 1, 1, 1, 1,
0.1288719, 0.577681, -0.01086227, 1, 1, 1, 1, 1,
0.1290795, 1.175839, 0.8391832, 1, 1, 1, 1, 1,
0.1330726, -0.8728983, 1.739148, 1, 1, 1, 1, 1,
0.13452, 0.245958, -1.905927, 1, 1, 1, 1, 1,
0.1355011, 0.3939637, 0.6420277, 0, 0, 1, 1, 1,
0.135953, -0.792716, 2.362538, 1, 0, 0, 1, 1,
0.1385744, 0.7941809, -0.1143347, 1, 0, 0, 1, 1,
0.1406531, -0.361712, 4.915685, 1, 0, 0, 1, 1,
0.145052, 0.09587663, -0.3240874, 1, 0, 0, 1, 1,
0.147911, -0.4964036, 4.09516, 1, 0, 0, 1, 1,
0.1489571, 1.547295, 1.128874, 0, 0, 0, 1, 1,
0.1509053, 1.912941, 1.57848, 0, 0, 0, 1, 1,
0.151418, 1.059444, -0.3347043, 0, 0, 0, 1, 1,
0.1533456, 0.01751193, 2.746192, 0, 0, 0, 1, 1,
0.1639825, -0.1132276, 2.263453, 0, 0, 0, 1, 1,
0.169498, -1.676445, 4.297494, 0, 0, 0, 1, 1,
0.1701288, 0.4816204, -1.960955, 0, 0, 0, 1, 1,
0.1707488, 0.0978704, 1.52903, 1, 1, 1, 1, 1,
0.1720813, -0.7495966, 3.629388, 1, 1, 1, 1, 1,
0.1754021, -1.109689, 3.907016, 1, 1, 1, 1, 1,
0.1774873, 0.327574, 1.604148, 1, 1, 1, 1, 1,
0.177734, -0.5817151, 1.337108, 1, 1, 1, 1, 1,
0.1851397, -0.2786647, 3.418828, 1, 1, 1, 1, 1,
0.1900467, 0.8025503, -0.8556439, 1, 1, 1, 1, 1,
0.1905057, 0.06674396, 1.028359, 1, 1, 1, 1, 1,
0.1908462, -0.08776681, 0.09728672, 1, 1, 1, 1, 1,
0.1909182, -0.7710612, 3.847291, 1, 1, 1, 1, 1,
0.1917527, -1.197212, 3.738185, 1, 1, 1, 1, 1,
0.1970575, 0.6713825, 1.433228, 1, 1, 1, 1, 1,
0.2013252, 0.897994, 1.97343, 1, 1, 1, 1, 1,
0.2029278, 0.9835685, 0.3287342, 1, 1, 1, 1, 1,
0.2043265, 0.2198219, 1.923295, 1, 1, 1, 1, 1,
0.2050168, 1.435503, 1.386387, 0, 0, 1, 1, 1,
0.2073129, -0.37586, 4.238604, 1, 0, 0, 1, 1,
0.2094038, 0.4870731, 0.5804194, 1, 0, 0, 1, 1,
0.2181253, -0.01435659, 1.633727, 1, 0, 0, 1, 1,
0.2197015, 0.1051818, -0.6035453, 1, 0, 0, 1, 1,
0.2237801, -1.387364, 2.071815, 1, 0, 0, 1, 1,
0.2244322, 2.351912, -0.8954807, 0, 0, 0, 1, 1,
0.2263323, -1.150372, 1.727563, 0, 0, 0, 1, 1,
0.2270039, 0.8766205, 0.3635457, 0, 0, 0, 1, 1,
0.2302106, 0.62031, 1.720779, 0, 0, 0, 1, 1,
0.2351975, 1.621347, 0.808869, 0, 0, 0, 1, 1,
0.2373765, 0.5529795, 0.04016337, 0, 0, 0, 1, 1,
0.2411189, 0.9023741, -0.7900473, 0, 0, 0, 1, 1,
0.2439971, 0.3669835, -0.01616787, 1, 1, 1, 1, 1,
0.2440423, 1.364021, 0.2910495, 1, 1, 1, 1, 1,
0.2473601, -0.7312774, 3.763412, 1, 1, 1, 1, 1,
0.2494197, 0.7030047, 1.836895, 1, 1, 1, 1, 1,
0.250207, -0.02232841, 1.620351, 1, 1, 1, 1, 1,
0.2504033, 0.4669404, 0.7275619, 1, 1, 1, 1, 1,
0.2531055, -1.414849, 4.91258, 1, 1, 1, 1, 1,
0.2532518, 1.503001, -0.1493501, 1, 1, 1, 1, 1,
0.25372, -0.3227458, 1.746434, 1, 1, 1, 1, 1,
0.2609649, 0.5089471, 1.161834, 1, 1, 1, 1, 1,
0.2610048, -0.6301218, 2.868556, 1, 1, 1, 1, 1,
0.2619661, 1.387653, 0.3142216, 1, 1, 1, 1, 1,
0.264736, -1.312274, 1.893404, 1, 1, 1, 1, 1,
0.2677305, -0.07990862, 3.255213, 1, 1, 1, 1, 1,
0.2721876, 0.7422607, 0.9916264, 1, 1, 1, 1, 1,
0.2728983, 0.3223101, -0.9223868, 0, 0, 1, 1, 1,
0.2729712, 1.477885, 0.3789366, 1, 0, 0, 1, 1,
0.2741089, -0.5137741, 1.338825, 1, 0, 0, 1, 1,
0.2783487, -1.54571, 3.626176, 1, 0, 0, 1, 1,
0.2864221, 0.7731071, 1.030207, 1, 0, 0, 1, 1,
0.2888583, -0.3090605, 1.398722, 1, 0, 0, 1, 1,
0.2933356, -0.2983242, 1.881884, 0, 0, 0, 1, 1,
0.2949846, 1.459593, 0.7037854, 0, 0, 0, 1, 1,
0.3015205, -0.5349649, 2.491585, 0, 0, 0, 1, 1,
0.3069927, 0.004221409, 2.558751, 0, 0, 0, 1, 1,
0.3127356, 0.2466671, 2.022752, 0, 0, 0, 1, 1,
0.3151026, 1.242925, 0.6777225, 0, 0, 0, 1, 1,
0.3155664, -0.9161739, 3.607834, 0, 0, 0, 1, 1,
0.3171547, 1.735479, -1.05174, 1, 1, 1, 1, 1,
0.3179527, -0.06749834, 0.9972733, 1, 1, 1, 1, 1,
0.3196233, 1.407958, -0.7448631, 1, 1, 1, 1, 1,
0.3199446, -1.704796, 1.616117, 1, 1, 1, 1, 1,
0.3215605, 0.7293691, 0.4633296, 1, 1, 1, 1, 1,
0.321616, -0.2388621, 2.20962, 1, 1, 1, 1, 1,
0.3233629, -0.5872623, 3.532902, 1, 1, 1, 1, 1,
0.3289383, -0.08711573, 3.050354, 1, 1, 1, 1, 1,
0.3300837, -1.585782, 2.650028, 1, 1, 1, 1, 1,
0.3311335, -0.9484591, 2.89731, 1, 1, 1, 1, 1,
0.3436896, -0.739324, 2.113232, 1, 1, 1, 1, 1,
0.3448738, 0.387441, 0.3167633, 1, 1, 1, 1, 1,
0.3455007, -1.18768, 3.684877, 1, 1, 1, 1, 1,
0.3470061, -0.07972085, -0.3032635, 1, 1, 1, 1, 1,
0.3502275, -0.9957842, 2.393004, 1, 1, 1, 1, 1,
0.3503542, -1.167917, 3.400076, 0, 0, 1, 1, 1,
0.3540146, 0.2512899, 2.540362, 1, 0, 0, 1, 1,
0.3564569, 1.004068, -0.6633236, 1, 0, 0, 1, 1,
0.3566085, -1.446454, 3.614577, 1, 0, 0, 1, 1,
0.3577765, -0.7045432, 3.408738, 1, 0, 0, 1, 1,
0.3590389, 1.824031, 0.717489, 1, 0, 0, 1, 1,
0.3625305, 1.737052, -0.3781708, 0, 0, 0, 1, 1,
0.36258, -1.541754, 2.7521, 0, 0, 0, 1, 1,
0.3632383, 0.1563839, 0.4391544, 0, 0, 0, 1, 1,
0.3642842, 0.588051, -0.477894, 0, 0, 0, 1, 1,
0.3645892, 3.253947, -0.4059119, 0, 0, 0, 1, 1,
0.3686894, 0.4255754, -0.09164965, 0, 0, 0, 1, 1,
0.3711887, 0.2938417, 2.231635, 0, 0, 0, 1, 1,
0.3754342, -0.008750299, 1.16884, 1, 1, 1, 1, 1,
0.3787966, -0.3577222, 2.160357, 1, 1, 1, 1, 1,
0.3791495, -0.7116219, 2.47124, 1, 1, 1, 1, 1,
0.3796932, -0.7994732, 2.603502, 1, 1, 1, 1, 1,
0.3804231, -1.709163, 1.983033, 1, 1, 1, 1, 1,
0.3841991, 0.3792627, 0.9814425, 1, 1, 1, 1, 1,
0.3858058, 1.473148, -0.1846086, 1, 1, 1, 1, 1,
0.3869394, -0.2375633, 1.214447, 1, 1, 1, 1, 1,
0.3921696, -0.1881048, 2.711487, 1, 1, 1, 1, 1,
0.3949053, 1.372765, -1.185165, 1, 1, 1, 1, 1,
0.3953218, 0.6139082, 0.8780703, 1, 1, 1, 1, 1,
0.3957995, 0.6815348, 3.11895, 1, 1, 1, 1, 1,
0.3963548, -0.441789, 2.426179, 1, 1, 1, 1, 1,
0.3966017, -0.7722604, 2.633801, 1, 1, 1, 1, 1,
0.3982121, 0.348833, 0.657715, 1, 1, 1, 1, 1,
0.402526, -0.4228329, 2.778953, 0, 0, 1, 1, 1,
0.4094301, 1.055326, 1.330577, 1, 0, 0, 1, 1,
0.4194502, -1.205473, 2.366944, 1, 0, 0, 1, 1,
0.4301461, 1.127921, 0.03405452, 1, 0, 0, 1, 1,
0.4323982, 1.143441, -1.306154, 1, 0, 0, 1, 1,
0.4327922, 1.311632, 0.8521748, 1, 0, 0, 1, 1,
0.4478062, 0.08297123, 0.7824584, 0, 0, 0, 1, 1,
0.4577766, 0.9245588, 1.164101, 0, 0, 0, 1, 1,
0.4603996, 0.497942, 2.198294, 0, 0, 0, 1, 1,
0.4615149, 1.093666, 1.73953, 0, 0, 0, 1, 1,
0.4629818, 0.09578928, 0.6932603, 0, 0, 0, 1, 1,
0.4643067, -1.915069, 3.334316, 0, 0, 0, 1, 1,
0.4664727, 1.188556, -0.03958847, 0, 0, 0, 1, 1,
0.470783, 0.7817045, 1.206178, 1, 1, 1, 1, 1,
0.4712402, 1.090946, -0.05989005, 1, 1, 1, 1, 1,
0.4718932, -0.2311233, 1.135796, 1, 1, 1, 1, 1,
0.4727984, -0.5126382, 1.491942, 1, 1, 1, 1, 1,
0.473255, 1.476356, -1.760331, 1, 1, 1, 1, 1,
0.4764129, -0.1443324, 2.847988, 1, 1, 1, 1, 1,
0.4784425, 1.044071, 0.8294491, 1, 1, 1, 1, 1,
0.4788828, 0.3239067, 1.937607, 1, 1, 1, 1, 1,
0.4850842, 0.6537656, -0.4499761, 1, 1, 1, 1, 1,
0.4860207, -1.215602, 4.341915, 1, 1, 1, 1, 1,
0.4860214, 0.2367899, 1.657196, 1, 1, 1, 1, 1,
0.4875238, -0.2275422, 1.83322, 1, 1, 1, 1, 1,
0.4881477, -0.1104324, 0.678237, 1, 1, 1, 1, 1,
0.4891005, 1.593272, 0.8401037, 1, 1, 1, 1, 1,
0.4978186, 1.213152, 1.868498, 1, 1, 1, 1, 1,
0.5021834, -1.459953, 1.861289, 0, 0, 1, 1, 1,
0.509025, -0.1393557, 2.049291, 1, 0, 0, 1, 1,
0.5102593, 0.9731922, -0.04880389, 1, 0, 0, 1, 1,
0.5240503, -0.3602078, 1.92782, 1, 0, 0, 1, 1,
0.5317382, 1.25767, -0.1806073, 1, 0, 0, 1, 1,
0.5327003, 2.145969, 0.04636817, 1, 0, 0, 1, 1,
0.5367765, 0.9550961, -1.734784, 0, 0, 0, 1, 1,
0.5378921, -1.248354, 2.785499, 0, 0, 0, 1, 1,
0.5487735, -0.3585403, 3.22103, 0, 0, 0, 1, 1,
0.5494209, 1.150769, 1.091849, 0, 0, 0, 1, 1,
0.5522944, 0.3400387, 3.478313, 0, 0, 0, 1, 1,
0.5528032, 0.04117271, 1.497894, 0, 0, 0, 1, 1,
0.553704, -0.2687232, 2.65407, 0, 0, 0, 1, 1,
0.5617068, 1.183514, 0.5469605, 1, 1, 1, 1, 1,
0.5642576, 0.5045357, -0.0229216, 1, 1, 1, 1, 1,
0.5683946, -1.681932, 1.155597, 1, 1, 1, 1, 1,
0.5730082, -0.2830293, 2.116051, 1, 1, 1, 1, 1,
0.5740563, 0.8339977, 0.8353974, 1, 1, 1, 1, 1,
0.5793781, -0.1863557, 0.6382593, 1, 1, 1, 1, 1,
0.5797111, 1.772843, -1.537515, 1, 1, 1, 1, 1,
0.5798467, 0.5006763, 1.553541, 1, 1, 1, 1, 1,
0.5841915, -0.7088692, 2.417403, 1, 1, 1, 1, 1,
0.5870306, 1.290114, -0.7097775, 1, 1, 1, 1, 1,
0.5885304, -1.631635, 2.904203, 1, 1, 1, 1, 1,
0.5893677, 1.118916, 2.141684, 1, 1, 1, 1, 1,
0.5896993, -1.042479, 2.634971, 1, 1, 1, 1, 1,
0.5911492, 0.5630105, 1.3218, 1, 1, 1, 1, 1,
0.5949929, 1.100236, 1.169463, 1, 1, 1, 1, 1,
0.5955456, -0.3090851, 0.2376422, 0, 0, 1, 1, 1,
0.5956885, -0.5414281, 2.969387, 1, 0, 0, 1, 1,
0.5958536, -0.6118698, 2.892583, 1, 0, 0, 1, 1,
0.6020145, 0.4697197, 1.223566, 1, 0, 0, 1, 1,
0.6030388, -0.3811142, 1.986752, 1, 0, 0, 1, 1,
0.6111291, 1.038781, 0.9579739, 1, 0, 0, 1, 1,
0.6166208, -0.694155, 2.330211, 0, 0, 0, 1, 1,
0.6194515, 0.2611208, 1.403197, 0, 0, 0, 1, 1,
0.6202727, 0.7453694, 1.072322, 0, 0, 0, 1, 1,
0.6209229, -1.366767, 4.220318, 0, 0, 0, 1, 1,
0.6218588, 0.9721212, 0.1387397, 0, 0, 0, 1, 1,
0.6261443, -1.080788, 2.458223, 0, 0, 0, 1, 1,
0.6263148, 1.233977, 0.4925075, 0, 0, 0, 1, 1,
0.6270516, -0.2387594, 3.182127, 1, 1, 1, 1, 1,
0.6297378, -0.3928117, 3.440365, 1, 1, 1, 1, 1,
0.6359606, 0.1226395, -0.09020566, 1, 1, 1, 1, 1,
0.6360038, -0.4089791, 1.139757, 1, 1, 1, 1, 1,
0.641723, 0.5656636, 0.8990175, 1, 1, 1, 1, 1,
0.6436771, 0.6276051, 1.249394, 1, 1, 1, 1, 1,
0.6447164, 0.1093968, 1.991703, 1, 1, 1, 1, 1,
0.6488791, 0.6388958, 1.147237, 1, 1, 1, 1, 1,
0.6511785, -2.57155, 2.718353, 1, 1, 1, 1, 1,
0.6530869, 0.0592382, 2.064191, 1, 1, 1, 1, 1,
0.6546736, -1.440046, 3.338356, 1, 1, 1, 1, 1,
0.6555688, -1.654655, 1.099338, 1, 1, 1, 1, 1,
0.6617061, 0.03907076, 2.737154, 1, 1, 1, 1, 1,
0.6624539, 1.278529, -0.278209, 1, 1, 1, 1, 1,
0.662532, 0.9223598, 1.088375, 1, 1, 1, 1, 1,
0.6663565, -0.553783, 2.931321, 0, 0, 1, 1, 1,
0.6705655, -1.247807, 2.855645, 1, 0, 0, 1, 1,
0.6708372, -0.1370299, 0.03581454, 1, 0, 0, 1, 1,
0.6759213, 0.3768198, 1.167191, 1, 0, 0, 1, 1,
0.6785477, 1.118125, 0.3151406, 1, 0, 0, 1, 1,
0.6813709, 0.5492091, 1.534654, 1, 0, 0, 1, 1,
0.6884831, -1.29538, 2.627049, 0, 0, 0, 1, 1,
0.6917396, 0.7018207, 0.6814106, 0, 0, 0, 1, 1,
0.6981438, 0.8201814, 1.533633, 0, 0, 0, 1, 1,
0.7098795, -1.917473, 2.656963, 0, 0, 0, 1, 1,
0.7100947, 0.21433, 2.532429, 0, 0, 0, 1, 1,
0.7121713, -0.8054897, 2.941971, 0, 0, 0, 1, 1,
0.7124897, 0.6614847, 0.5312415, 0, 0, 0, 1, 1,
0.722829, -0.9510897, 1.816149, 1, 1, 1, 1, 1,
0.7306405, -0.1896375, 1.714041, 1, 1, 1, 1, 1,
0.7314842, 0.2533301, 1.094473, 1, 1, 1, 1, 1,
0.7319843, 0.3364906, 3.084005, 1, 1, 1, 1, 1,
0.7364725, 1.479581, 1.469493, 1, 1, 1, 1, 1,
0.7367085, 0.5017546, 2.644561, 1, 1, 1, 1, 1,
0.7367107, 0.3949462, 1.179339, 1, 1, 1, 1, 1,
0.7410973, 1.47773, 1.997465, 1, 1, 1, 1, 1,
0.7475262, -0.3243499, 2.298654, 1, 1, 1, 1, 1,
0.7511681, -0.6486278, 1.018125, 1, 1, 1, 1, 1,
0.7545904, -0.5313521, 1.225875, 1, 1, 1, 1, 1,
0.7563652, -1.535962, 4.375288, 1, 1, 1, 1, 1,
0.7585036, 0.4931142, 1.591167, 1, 1, 1, 1, 1,
0.7587636, 0.5300194, 1.694188, 1, 1, 1, 1, 1,
0.7626351, -0.8277432, 1.478273, 1, 1, 1, 1, 1,
0.7631435, 0.5451337, -1.533981, 0, 0, 1, 1, 1,
0.7672313, 0.1632686, 1.049371, 1, 0, 0, 1, 1,
0.7677783, 0.3552337, 1.530677, 1, 0, 0, 1, 1,
0.7709868, -0.2200717, 1.087614, 1, 0, 0, 1, 1,
0.7720275, 0.4134137, 1.135439, 1, 0, 0, 1, 1,
0.774128, 0.07586144, 2.471562, 1, 0, 0, 1, 1,
0.7793121, 0.167251, 1.599008, 0, 0, 0, 1, 1,
0.7801591, -0.208341, 1.414531, 0, 0, 0, 1, 1,
0.7818124, 0.9022444, 1.159622, 0, 0, 0, 1, 1,
0.7885221, -1.538851, 0.8496794, 0, 0, 0, 1, 1,
0.7909435, -0.4832226, 2.282006, 0, 0, 0, 1, 1,
0.7968807, 1.759066, -0.008836461, 0, 0, 0, 1, 1,
0.7985895, 0.6195295, 0.4398569, 0, 0, 0, 1, 1,
0.7992212, 0.9623406, 0.6066898, 1, 1, 1, 1, 1,
0.8056682, 0.3129037, 1.140525, 1, 1, 1, 1, 1,
0.8129529, -0.8258433, 2.614756, 1, 1, 1, 1, 1,
0.8173565, -0.07633124, 1.739967, 1, 1, 1, 1, 1,
0.819945, -0.7328231, 1.412357, 1, 1, 1, 1, 1,
0.8213108, 0.9327823, 0.8150564, 1, 1, 1, 1, 1,
0.8213284, -0.06008203, 2.465027, 1, 1, 1, 1, 1,
0.8262269, 0.4923543, -0.1105246, 1, 1, 1, 1, 1,
0.8365092, 1.561034, 0.6861491, 1, 1, 1, 1, 1,
0.8413323, -0.8441502, -0.04855973, 1, 1, 1, 1, 1,
0.8448062, -0.6675718, 1.729957, 1, 1, 1, 1, 1,
0.8453031, 0.8825071, 1.035839, 1, 1, 1, 1, 1,
0.8515477, 0.8388678, 1.214443, 1, 1, 1, 1, 1,
0.8651679, 1.030745, 0.6081989, 1, 1, 1, 1, 1,
0.8731753, -1.412405, 3.273861, 1, 1, 1, 1, 1,
0.8740211, -0.4126997, 1.052556, 0, 0, 1, 1, 1,
0.8829423, 1.325624, 1.723995, 1, 0, 0, 1, 1,
0.8886646, 0.2582734, -1.474704, 1, 0, 0, 1, 1,
0.8938809, 0.5884249, 1.757135, 1, 0, 0, 1, 1,
0.8967869, 0.4890839, 0.9896194, 1, 0, 0, 1, 1,
0.903792, 0.6772868, 2.866707, 1, 0, 0, 1, 1,
0.905797, 0.1137404, 0.9051625, 0, 0, 0, 1, 1,
0.906478, -1.483, 3.771083, 0, 0, 0, 1, 1,
0.9096905, 1.441832, 1.096267, 0, 0, 0, 1, 1,
0.910551, 0.1740102, 2.274473, 0, 0, 0, 1, 1,
0.9144988, -0.007030067, 2.0863, 0, 0, 0, 1, 1,
0.9166403, 0.6778095, -0.4683766, 0, 0, 0, 1, 1,
0.9172856, 0.6881551, 0.8874189, 0, 0, 0, 1, 1,
0.9180335, -0.4441848, 1.994266, 1, 1, 1, 1, 1,
0.920511, -0.6250492, 4.995579, 1, 1, 1, 1, 1,
0.9239605, -0.6049947, 2.792191, 1, 1, 1, 1, 1,
0.9257755, -0.7303933, 2.917158, 1, 1, 1, 1, 1,
0.9307974, -1.40506, 4.023777, 1, 1, 1, 1, 1,
0.9383527, 0.002546715, 1.274694, 1, 1, 1, 1, 1,
0.9393336, 0.4438452, 0.02060366, 1, 1, 1, 1, 1,
0.9399239, -1.008894, 3.942385, 1, 1, 1, 1, 1,
0.9408528, -1.415137, 1.663381, 1, 1, 1, 1, 1,
0.9435769, -2.241789, 3.273303, 1, 1, 1, 1, 1,
0.9479896, -0.2284053, 0.8812804, 1, 1, 1, 1, 1,
0.9565138, 1.096367, 3.362325, 1, 1, 1, 1, 1,
0.9668109, 0.801926, 1.859262, 1, 1, 1, 1, 1,
0.9714059, -0.07010813, 0.6562591, 1, 1, 1, 1, 1,
0.9714493, -0.06757293, 2.844219, 1, 1, 1, 1, 1,
0.9821752, 1.800073, 1.089599, 0, 0, 1, 1, 1,
0.9852766, -1.811385, 2.913722, 1, 0, 0, 1, 1,
0.9873739, -0.4699829, 3.021766, 1, 0, 0, 1, 1,
0.9909965, -0.8507609, 0.8199651, 1, 0, 0, 1, 1,
0.9962307, 0.1984747, 1.655368, 1, 0, 0, 1, 1,
1.006571, 1.03215, 0.0557064, 1, 0, 0, 1, 1,
1.010359, 1.238921, 0.8329139, 0, 0, 0, 1, 1,
1.015578, 0.7500269, 1.555229, 0, 0, 0, 1, 1,
1.017081, 1.377137, -0.0218599, 0, 0, 0, 1, 1,
1.019642, 0.5048146, 2.196116, 0, 0, 0, 1, 1,
1.022086, 0.6329765, 0.5824996, 0, 0, 0, 1, 1,
1.030179, -0.0452794, 0.5188397, 0, 0, 0, 1, 1,
1.031384, -0.2800576, 0.5977274, 0, 0, 0, 1, 1,
1.03227, 0.8530784, 1.549827, 1, 1, 1, 1, 1,
1.033627, -2.025455, 3.404264, 1, 1, 1, 1, 1,
1.037791, -0.5162181, 2.412479, 1, 1, 1, 1, 1,
1.037915, -1.841266, 1.364831, 1, 1, 1, 1, 1,
1.040111, -0.07863281, 1.405707, 1, 1, 1, 1, 1,
1.042952, 1.83355, 0.9286974, 1, 1, 1, 1, 1,
1.044623, -1.241184, 0.6370284, 1, 1, 1, 1, 1,
1.065851, 0.7911957, 0.02473127, 1, 1, 1, 1, 1,
1.066319, -0.5181044, 4.537905, 1, 1, 1, 1, 1,
1.074714, 1.222034, 1.072707, 1, 1, 1, 1, 1,
1.076805, 0.1411322, 2.29416, 1, 1, 1, 1, 1,
1.078512, 0.5489255, 1.309463, 1, 1, 1, 1, 1,
1.078712, -0.4568764, 4.100459, 1, 1, 1, 1, 1,
1.080319, -0.9147491, 1.536038, 1, 1, 1, 1, 1,
1.088919, -1.013962, 5.410467, 1, 1, 1, 1, 1,
1.089871, -0.5042339, 1.499469, 0, 0, 1, 1, 1,
1.094197, -0.6855989, 1.951856, 1, 0, 0, 1, 1,
1.097355, 1.474519, 1.536836, 1, 0, 0, 1, 1,
1.104017, -0.7574378, 4.19523, 1, 0, 0, 1, 1,
1.104101, 0.6287826, 1.915872, 1, 0, 0, 1, 1,
1.106828, 0.7170135, 2.65355, 1, 0, 0, 1, 1,
1.107324, 0.5751721, 0.9178776, 0, 0, 0, 1, 1,
1.107492, -0.9416613, 2.315302, 0, 0, 0, 1, 1,
1.10994, 0.5153778, 0.9535944, 0, 0, 0, 1, 1,
1.11015, 0.1151452, 1.52416, 0, 0, 0, 1, 1,
1.116029, 0.9831502, 0.8914528, 0, 0, 0, 1, 1,
1.117439, 1.083396, 0.3332714, 0, 0, 0, 1, 1,
1.117848, -0.7038008, 1.598939, 0, 0, 0, 1, 1,
1.118526, -0.8373657, 1.464339, 1, 1, 1, 1, 1,
1.119898, -1.080847, 1.562722, 1, 1, 1, 1, 1,
1.124641, -0.6639264, 2.658559, 1, 1, 1, 1, 1,
1.125296, -0.6264026, 1.161167, 1, 1, 1, 1, 1,
1.130598, -0.6065356, 1.847114, 1, 1, 1, 1, 1,
1.136524, 0.151885, 2.416903, 1, 1, 1, 1, 1,
1.144987, 0.8024852, 1.628402, 1, 1, 1, 1, 1,
1.150285, 0.3692665, 1.978315, 1, 1, 1, 1, 1,
1.151826, 1.316274, 0.3635126, 1, 1, 1, 1, 1,
1.153645, 0.518673, 1.199333, 1, 1, 1, 1, 1,
1.157013, -0.6395384, 3.855417, 1, 1, 1, 1, 1,
1.162176, 1.980505, -0.02620157, 1, 1, 1, 1, 1,
1.166958, 0.03885512, -0.2820872, 1, 1, 1, 1, 1,
1.170803, 0.8682657, 1.730604, 1, 1, 1, 1, 1,
1.171968, -0.402517, 1.672692, 1, 1, 1, 1, 1,
1.175531, 1.298808, 0.6499481, 0, 0, 1, 1, 1,
1.176883, -0.1582521, 1.155996, 1, 0, 0, 1, 1,
1.179265, -0.04657242, 0.6716582, 1, 0, 0, 1, 1,
1.183006, -1.448834, 2.672346, 1, 0, 0, 1, 1,
1.184786, 1.043006, 0.06362348, 1, 0, 0, 1, 1,
1.194393, 0.3155043, 3.849948, 1, 0, 0, 1, 1,
1.19692, -0.1443762, 1.642877, 0, 0, 0, 1, 1,
1.216003, 0.7599618, -0.2091391, 0, 0, 0, 1, 1,
1.241836, -0.5419503, 2.882884, 0, 0, 0, 1, 1,
1.255153, -1.061321, 1.997033, 0, 0, 0, 1, 1,
1.255232, 0.2149275, 2.637854, 0, 0, 0, 1, 1,
1.255276, 1.235109, 2.123557, 0, 0, 0, 1, 1,
1.269679, -1.475677, 0.8147533, 0, 0, 0, 1, 1,
1.276356, -0.7059113, 0.2051854, 1, 1, 1, 1, 1,
1.280412, 1.150996, -0.5647008, 1, 1, 1, 1, 1,
1.286727, 0.3201398, 0.6054578, 1, 1, 1, 1, 1,
1.306624, -1.634291, 2.928082, 1, 1, 1, 1, 1,
1.308705, 1.387693, 1.178827, 1, 1, 1, 1, 1,
1.309297, 0.01656993, 0.08238421, 1, 1, 1, 1, 1,
1.310056, 1.26226, 0.01839962, 1, 1, 1, 1, 1,
1.31135, -1.004677, 2.809364, 1, 1, 1, 1, 1,
1.323305, -0.4425125, 1.147027, 1, 1, 1, 1, 1,
1.346031, 0.7768058, 2.095618, 1, 1, 1, 1, 1,
1.347923, 0.4300296, 1.023195, 1, 1, 1, 1, 1,
1.349828, 1.111319, -0.7956753, 1, 1, 1, 1, 1,
1.366384, 2.390026, -2.104265, 1, 1, 1, 1, 1,
1.367671, -0.6483908, 1.8279, 1, 1, 1, 1, 1,
1.404612, -0.02919667, 3.282077, 1, 1, 1, 1, 1,
1.405633, 0.6662512, 0.4964269, 0, 0, 1, 1, 1,
1.437407, -0.3632931, 1.808682, 1, 0, 0, 1, 1,
1.441555, 0.6550165, 0.8778046, 1, 0, 0, 1, 1,
1.461298, -1.734222, 1.947804, 1, 0, 0, 1, 1,
1.464038, -0.680001, 1.772427, 1, 0, 0, 1, 1,
1.466923, -0.0645645, 2.734963, 1, 0, 0, 1, 1,
1.468007, 0.9457221, 2.535147, 0, 0, 0, 1, 1,
1.469741, 0.1184778, 0.7419077, 0, 0, 0, 1, 1,
1.472438, 0.07744092, 2.579061, 0, 0, 0, 1, 1,
1.47579, 0.6059032, 0.2424861, 0, 0, 0, 1, 1,
1.480833, -0.4524859, 2.470484, 0, 0, 0, 1, 1,
1.490727, 2.092734, -0.302181, 0, 0, 0, 1, 1,
1.523992, 1.050501, 2.064865, 0, 0, 0, 1, 1,
1.524575, -0.993569, -1.052331, 1, 1, 1, 1, 1,
1.534501, -0.8098801, 1.585831, 1, 1, 1, 1, 1,
1.53522, 1.225233, 1.960774, 1, 1, 1, 1, 1,
1.542231, -1.815864, 2.572415, 1, 1, 1, 1, 1,
1.548803, -1.894559, 2.142687, 1, 1, 1, 1, 1,
1.549796, 0.3846903, 2.265823, 1, 1, 1, 1, 1,
1.554131, 0.34533, 0.2475464, 1, 1, 1, 1, 1,
1.556138, 0.6870066, 2.909837, 1, 1, 1, 1, 1,
1.578521, 0.8314113, 2.328869, 1, 1, 1, 1, 1,
1.585291, -0.8978587, 3.139878, 1, 1, 1, 1, 1,
1.60541, -0.4230295, 2.338151, 1, 1, 1, 1, 1,
1.608981, -1.487395, 0.971331, 1, 1, 1, 1, 1,
1.620569, 1.218489, 0.7368369, 1, 1, 1, 1, 1,
1.623977, 1.096083, 0.1677645, 1, 1, 1, 1, 1,
1.626717, -1.479455, 1.538926, 1, 1, 1, 1, 1,
1.630048, -0.1371424, 3.012225, 0, 0, 1, 1, 1,
1.633203, -0.9884989, 1.10787, 1, 0, 0, 1, 1,
1.641997, 1.371268, 0.6945209, 1, 0, 0, 1, 1,
1.646794, 1.731327, 1.370322, 1, 0, 0, 1, 1,
1.651123, 1.529887, 0.2587297, 1, 0, 0, 1, 1,
1.654917, -0.5126417, 0.3867939, 1, 0, 0, 1, 1,
1.670409, -0.5441037, 0.6809209, 0, 0, 0, 1, 1,
1.677534, -1.097376, 3.741592, 0, 0, 0, 1, 1,
1.677825, 2.168217, 0.3813629, 0, 0, 0, 1, 1,
1.698042, 0.7133975, -0.1649161, 0, 0, 0, 1, 1,
1.702999, 0.3364984, 0.3794876, 0, 0, 0, 1, 1,
1.710825, -1.068289, 1.577087, 0, 0, 0, 1, 1,
1.72642, -0.6219581, 1.850545, 0, 0, 0, 1, 1,
1.728495, -2.052455, 1.524251, 1, 1, 1, 1, 1,
1.73195, 0.7338861, 1.240295, 1, 1, 1, 1, 1,
1.744319, -0.1908909, 1.386896, 1, 1, 1, 1, 1,
1.757042, -0.4578929, 1.337873, 1, 1, 1, 1, 1,
1.763062, 1.103254, 2.060243, 1, 1, 1, 1, 1,
1.769969, 1.298087, 1.104697, 1, 1, 1, 1, 1,
1.794818, 0.1480622, 1.33783, 1, 1, 1, 1, 1,
1.830881, 0.9796039, 1.46035, 1, 1, 1, 1, 1,
1.844496, -1.385419, 1.316729, 1, 1, 1, 1, 1,
1.845275, 0.686196, 1.182349, 1, 1, 1, 1, 1,
1.863347, 2.778288, 0.9506444, 1, 1, 1, 1, 1,
1.942348, 0.6776263, 2.044069, 1, 1, 1, 1, 1,
1.962177, 0.01496769, 0.1781009, 1, 1, 1, 1, 1,
1.972434, -0.9824792, 2.030713, 1, 1, 1, 1, 1,
2.004984, -1.031083, -0.129886, 1, 1, 1, 1, 1,
2.0273, 0.9685425, -0.2054054, 0, 0, 1, 1, 1,
2.048048, -0.6068023, 1.93365, 1, 0, 0, 1, 1,
2.074786, -0.4843195, 1.98011, 1, 0, 0, 1, 1,
2.128207, 0.5417554, 1.564138, 1, 0, 0, 1, 1,
2.194826, -0.5981746, 2.074039, 1, 0, 0, 1, 1,
2.221733, 0.130466, 0.5760415, 1, 0, 0, 1, 1,
2.267968, -0.366131, 1.82416, 0, 0, 0, 1, 1,
2.305553, 0.2617961, 1.10815, 0, 0, 0, 1, 1,
2.373585, 0.7885699, 2.431893, 0, 0, 0, 1, 1,
2.404205, 1.036711, 1.935115, 0, 0, 0, 1, 1,
2.411363, 0.5652544, 0.5490492, 0, 0, 0, 1, 1,
2.502086, -0.1143651, 1.786626, 0, 0, 0, 1, 1,
2.787326, 1.891418, 0.9948362, 0, 0, 0, 1, 1,
2.951077, 1.448766, 1.212691, 1, 1, 1, 1, 1,
2.974411, -1.251037, 4.011483, 1, 1, 1, 1, 1,
2.992543, -1.715728, 1.442023, 1, 1, 1, 1, 1,
2.995612, 0.07334635, 0.2833215, 1, 1, 1, 1, 1,
3.076808, 1.156191, 2.502578, 1, 1, 1, 1, 1,
3.48397, 0.3951319, 1.469547, 1, 1, 1, 1, 1,
3.755187, -0.2097698, 1.235558, 1, 1, 1, 1, 1
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
var radius = 9.971176;
var distance = 35.02333;
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
mvMatrix.translate( -0.1835034, 0.3123505, -0.05298996 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.02333);
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
