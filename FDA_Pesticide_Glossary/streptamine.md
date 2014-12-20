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
-3.795875, -0.3297828, -0.6614552, 1, 0, 0, 1,
-3.367242, 0.4834212, -0.4798828, 1, 0.007843138, 0, 1,
-2.819165, 0.1656533, -1.111143, 1, 0.01176471, 0, 1,
-2.540069, -1.915117, -1.923702, 1, 0.01960784, 0, 1,
-2.434539, -0.9180706, -1.938696, 1, 0.02352941, 0, 1,
-2.387832, 0.01763813, -2.357315, 1, 0.03137255, 0, 1,
-2.237738, -1.676313, -2.759719, 1, 0.03529412, 0, 1,
-2.228033, 1.319199, 0.5538224, 1, 0.04313726, 0, 1,
-2.183698, -0.6619368, -2.515966, 1, 0.04705882, 0, 1,
-2.146835, -0.9371127, -0.8631907, 1, 0.05490196, 0, 1,
-2.086249, 1.907619, -0.496635, 1, 0.05882353, 0, 1,
-2.062547, 0.7795679, -0.7772058, 1, 0.06666667, 0, 1,
-2.047433, 0.7183861, -0.6771318, 1, 0.07058824, 0, 1,
-2.037868, -1.261462, -2.043383, 1, 0.07843138, 0, 1,
-2.021923, -1.502439, -4.284889, 1, 0.08235294, 0, 1,
-2.019011, -0.487825, -2.53883, 1, 0.09019608, 0, 1,
-2.012871, -0.4980218, -1.813235, 1, 0.09411765, 0, 1,
-2.011239, 3.715539, 1.137347, 1, 0.1019608, 0, 1,
-2.001997, -0.2102634, -1.017533, 1, 0.1098039, 0, 1,
-1.985514, -0.04923235, -1.81537, 1, 0.1137255, 0, 1,
-1.977446, 0.274929, -0.7553644, 1, 0.1215686, 0, 1,
-1.963296, 1.370338, -1.235781, 1, 0.1254902, 0, 1,
-1.947082, 1.359963, 0.116913, 1, 0.1333333, 0, 1,
-1.943739, -0.1946413, -1.735002, 1, 0.1372549, 0, 1,
-1.936323, -1.47709, -1.80998, 1, 0.145098, 0, 1,
-1.914792, -0.08998259, -1.856914, 1, 0.1490196, 0, 1,
-1.885348, 0.1490851, -1.30923, 1, 0.1568628, 0, 1,
-1.882912, -0.4108268, 0.04004478, 1, 0.1607843, 0, 1,
-1.871112, -0.05001106, -2.463872, 1, 0.1686275, 0, 1,
-1.869715, -1.291982, -4.151461, 1, 0.172549, 0, 1,
-1.81147, -0.4219776, -1.415456, 1, 0.1803922, 0, 1,
-1.80709, 0.6650314, 0.9994502, 1, 0.1843137, 0, 1,
-1.780705, 0.6710894, -0.5755781, 1, 0.1921569, 0, 1,
-1.774723, -0.4121327, -1.632993, 1, 0.1960784, 0, 1,
-1.734822, -0.1572042, -1.139833, 1, 0.2039216, 0, 1,
-1.728261, -1.153433, -1.408694, 1, 0.2117647, 0, 1,
-1.720101, 0.6158969, -1.087436, 1, 0.2156863, 0, 1,
-1.719941, 1.931378, -0.2794009, 1, 0.2235294, 0, 1,
-1.71552, -0.3088246, -1.34611, 1, 0.227451, 0, 1,
-1.709289, -0.7336097, -1.908964, 1, 0.2352941, 0, 1,
-1.707111, -0.2401769, -2.248553, 1, 0.2392157, 0, 1,
-1.695847, 1.482562, -0.8767415, 1, 0.2470588, 0, 1,
-1.678331, -1.521282, -4.470869, 1, 0.2509804, 0, 1,
-1.670426, 0.2066009, -2.382802, 1, 0.2588235, 0, 1,
-1.669705, -1.84098, -2.380467, 1, 0.2627451, 0, 1,
-1.664004, -0.1863733, -0.2894491, 1, 0.2705882, 0, 1,
-1.638641, -0.4323323, -1.06222, 1, 0.2745098, 0, 1,
-1.633151, -0.01006584, -3.355709, 1, 0.282353, 0, 1,
-1.627033, -0.6172096, -3.088281, 1, 0.2862745, 0, 1,
-1.625605, 1.444683, -1.038194, 1, 0.2941177, 0, 1,
-1.593837, -0.3672342, -2.056122, 1, 0.3019608, 0, 1,
-1.581733, 0.4086992, -0.3304117, 1, 0.3058824, 0, 1,
-1.571686, -1.444989, -2.444228, 1, 0.3137255, 0, 1,
-1.564962, 0.06341923, -1.841305, 1, 0.3176471, 0, 1,
-1.558718, -0.1046438, -1.347711, 1, 0.3254902, 0, 1,
-1.55278, 0.8647019, -0.7044417, 1, 0.3294118, 0, 1,
-1.547222, 0.9036697, -0.6364011, 1, 0.3372549, 0, 1,
-1.531601, -1.635152, -3.014501, 1, 0.3411765, 0, 1,
-1.520997, -0.6458949, -0.8484634, 1, 0.3490196, 0, 1,
-1.514843, 0.07258848, -2.354564, 1, 0.3529412, 0, 1,
-1.501073, 0.9833887, -0.8838899, 1, 0.3607843, 0, 1,
-1.493791, 1.160332, -2.439014, 1, 0.3647059, 0, 1,
-1.480152, -1.116304, -3.131088, 1, 0.372549, 0, 1,
-1.476818, 0.7700596, -0.7828774, 1, 0.3764706, 0, 1,
-1.469447, 1.68643, -1.46558, 1, 0.3843137, 0, 1,
-1.461425, 0.3346814, 0.04274379, 1, 0.3882353, 0, 1,
-1.442988, 1.36457, -1.910652, 1, 0.3960784, 0, 1,
-1.427871, -1.08095, -1.918903, 1, 0.4039216, 0, 1,
-1.416359, 1.892253, 1.561687, 1, 0.4078431, 0, 1,
-1.415793, -0.6400704, -3.48676, 1, 0.4156863, 0, 1,
-1.40757, 0.6382565, -0.4683083, 1, 0.4196078, 0, 1,
-1.389815, -1.185988, -1.616552, 1, 0.427451, 0, 1,
-1.367313, 0.4848647, -0.770413, 1, 0.4313726, 0, 1,
-1.363176, -0.6356027, -2.73214, 1, 0.4392157, 0, 1,
-1.362293, 3.334871, 0.9195338, 1, 0.4431373, 0, 1,
-1.354828, 0.3264548, -0.9287208, 1, 0.4509804, 0, 1,
-1.34037, -1.110921, -2.549872, 1, 0.454902, 0, 1,
-1.331828, 0.5531606, -2.16401, 1, 0.4627451, 0, 1,
-1.330166, -0.9871171, -2.693979, 1, 0.4666667, 0, 1,
-1.330131, 1.222184, -2.241851, 1, 0.4745098, 0, 1,
-1.329482, -1.788094, -1.556133, 1, 0.4784314, 0, 1,
-1.328284, -1.841014, -2.763685, 1, 0.4862745, 0, 1,
-1.328257, 1.107546, -0.4893968, 1, 0.4901961, 0, 1,
-1.321898, 0.07300831, -1.630299, 1, 0.4980392, 0, 1,
-1.314885, 1.554118, -1.309574, 1, 0.5058824, 0, 1,
-1.310324, -0.4003144, -2.03637, 1, 0.509804, 0, 1,
-1.309816, 2.305598, -0.5311745, 1, 0.5176471, 0, 1,
-1.304633, -1.183888, -1.907556, 1, 0.5215687, 0, 1,
-1.303344, 0.06540908, -1.062168, 1, 0.5294118, 0, 1,
-1.291348, 1.246227, -0.3904292, 1, 0.5333334, 0, 1,
-1.289845, -1.149217, -2.958503, 1, 0.5411765, 0, 1,
-1.281451, -1.103464, -1.949965, 1, 0.5450981, 0, 1,
-1.274826, -0.7363663, -3.327638, 1, 0.5529412, 0, 1,
-1.27407, -0.1936395, -1.295627, 1, 0.5568628, 0, 1,
-1.270463, 0.3815131, -0.4899154, 1, 0.5647059, 0, 1,
-1.265328, 1.075307, -0.5945141, 1, 0.5686275, 0, 1,
-1.257154, -0.7176602, -0.8752625, 1, 0.5764706, 0, 1,
-1.252555, -1.289502, -2.408529, 1, 0.5803922, 0, 1,
-1.252243, -0.08938137, -1.116454, 1, 0.5882353, 0, 1,
-1.245997, 0.7872612, -1.516609, 1, 0.5921569, 0, 1,
-1.245507, -0.6360717, -2.07113, 1, 0.6, 0, 1,
-1.241667, 0.9615238, -1.229079, 1, 0.6078432, 0, 1,
-1.239894, 0.55199, -0.9322214, 1, 0.6117647, 0, 1,
-1.239593, 0.9344617, -1.29377, 1, 0.6196079, 0, 1,
-1.239579, 0.5074174, -0.7097593, 1, 0.6235294, 0, 1,
-1.235253, 0.4273935, -1.56778, 1, 0.6313726, 0, 1,
-1.234329, 0.5329049, -1.085982, 1, 0.6352941, 0, 1,
-1.233211, -0.2440768, -2.201145, 1, 0.6431373, 0, 1,
-1.228159, 0.32718, 0.4788245, 1, 0.6470588, 0, 1,
-1.228094, -0.7094722, -2.237325, 1, 0.654902, 0, 1,
-1.225016, -0.9265148, -1.663306, 1, 0.6588235, 0, 1,
-1.222235, -0.8641677, -1.364531, 1, 0.6666667, 0, 1,
-1.216544, 0.7596317, -0.495146, 1, 0.6705883, 0, 1,
-1.215172, -0.8863243, -0.9045464, 1, 0.6784314, 0, 1,
-1.212168, -0.2744254, -1.941802, 1, 0.682353, 0, 1,
-1.204386, 0.3478963, -1.965335, 1, 0.6901961, 0, 1,
-1.202188, -2.569344, -1.851359, 1, 0.6941177, 0, 1,
-1.199694, -1.946351, -1.483415, 1, 0.7019608, 0, 1,
-1.175939, -1.164175, -1.44089, 1, 0.7098039, 0, 1,
-1.168462, -1.144149, -2.320894, 1, 0.7137255, 0, 1,
-1.167031, 0.5077448, -0.493355, 1, 0.7215686, 0, 1,
-1.164599, -0.786102, -3.499082, 1, 0.7254902, 0, 1,
-1.163836, -0.5343257, -3.7844, 1, 0.7333333, 0, 1,
-1.16056, 0.01024796, 1.28456, 1, 0.7372549, 0, 1,
-1.159278, -1.500883, -3.044494, 1, 0.7450981, 0, 1,
-1.158012, -0.1817628, -2.829712, 1, 0.7490196, 0, 1,
-1.153079, -1.199584, 0.3601528, 1, 0.7568628, 0, 1,
-1.150007, 0.6024787, 0.2822387, 1, 0.7607843, 0, 1,
-1.142397, -0.5577055, -3.271775, 1, 0.7686275, 0, 1,
-1.138778, -0.3557791, -1.585274, 1, 0.772549, 0, 1,
-1.136518, 1.031108, -1.839506, 1, 0.7803922, 0, 1,
-1.135631, 0.08475214, -1.656078, 1, 0.7843137, 0, 1,
-1.132256, -1.502907, -1.752381, 1, 0.7921569, 0, 1,
-1.123555, 0.1535414, -0.2718202, 1, 0.7960784, 0, 1,
-1.118219, 0.5734679, -1.511372, 1, 0.8039216, 0, 1,
-1.117031, -2.531771, -1.816361, 1, 0.8117647, 0, 1,
-1.103588, -0.416728, 0.2475377, 1, 0.8156863, 0, 1,
-1.092628, 0.24266, -1.238114, 1, 0.8235294, 0, 1,
-1.092579, 1.373939, -1.805081, 1, 0.827451, 0, 1,
-1.092123, 0.3166749, -1.090517, 1, 0.8352941, 0, 1,
-1.091535, 0.07580825, -2.913189, 1, 0.8392157, 0, 1,
-1.090464, 0.1388002, -1.751946, 1, 0.8470588, 0, 1,
-1.084042, -0.3764366, -2.722165, 1, 0.8509804, 0, 1,
-1.083729, -0.6426047, -1.311283, 1, 0.8588235, 0, 1,
-1.081178, 1.519581, -0.8761388, 1, 0.8627451, 0, 1,
-1.078907, 0.3011631, -1.541544, 1, 0.8705882, 0, 1,
-1.078352, -0.709092, -1.207241, 1, 0.8745098, 0, 1,
-1.073297, -1.593526, -3.60408, 1, 0.8823529, 0, 1,
-1.072128, 0.5191921, -1.4476, 1, 0.8862745, 0, 1,
-1.062589, 0.3046792, -1.872442, 1, 0.8941177, 0, 1,
-1.062007, -1.954774, -2.71578, 1, 0.8980392, 0, 1,
-1.054815, -0.9877626, -1.737735, 1, 0.9058824, 0, 1,
-1.052116, 1.197837, -0.9202029, 1, 0.9137255, 0, 1,
-1.051913, -0.2744733, -2.5051, 1, 0.9176471, 0, 1,
-1.04957, -0.6666259, -0.9549993, 1, 0.9254902, 0, 1,
-1.047908, 0.08324482, -0.9630733, 1, 0.9294118, 0, 1,
-1.046248, 0.3094261, 0.897788, 1, 0.9372549, 0, 1,
-1.044074, 0.1135165, -1.444348, 1, 0.9411765, 0, 1,
-1.041216, 0.2822871, -1.755492, 1, 0.9490196, 0, 1,
-1.039893, 0.5936165, -1.509812, 1, 0.9529412, 0, 1,
-1.03813, -1.015901, -1.962741, 1, 0.9607843, 0, 1,
-1.029532, 0.2375235, -1.487057, 1, 0.9647059, 0, 1,
-1.02781, 0.6462339, -1.254039, 1, 0.972549, 0, 1,
-1.025198, 0.2103175, -0.9572502, 1, 0.9764706, 0, 1,
-1.020391, -0.1356833, -2.952537, 1, 0.9843137, 0, 1,
-1.018145, 0.08010589, -1.496247, 1, 0.9882353, 0, 1,
-1.015205, 0.2701131, -1.238421, 1, 0.9960784, 0, 1,
-1.006798, 0.4969255, -3.68002, 0.9960784, 1, 0, 1,
-1.004648, 1.616814, -2.569403, 0.9921569, 1, 0, 1,
-0.9973646, -0.9106116, -2.759397, 0.9843137, 1, 0, 1,
-0.9941273, -1.292976, -1.140886, 0.9803922, 1, 0, 1,
-0.9932977, -0.6728802, -2.122801, 0.972549, 1, 0, 1,
-0.9932261, -1.004991, -1.579827, 0.9686275, 1, 0, 1,
-0.9879152, -0.7596909, -1.842196, 0.9607843, 1, 0, 1,
-0.9852846, -1.29654, -3.194801, 0.9568627, 1, 0, 1,
-0.9811936, 1.092491, -1.788318, 0.9490196, 1, 0, 1,
-0.9804214, 0.5883343, -0.08386359, 0.945098, 1, 0, 1,
-0.9751891, -1.841062, -2.55347, 0.9372549, 1, 0, 1,
-0.972817, 0.5519616, -1.992285, 0.9333333, 1, 0, 1,
-0.9675996, -0.1687412, -0.2426807, 0.9254902, 1, 0, 1,
-0.9618713, -1.459598, -1.378814, 0.9215686, 1, 0, 1,
-0.9573383, 1.830142, 0.6562737, 0.9137255, 1, 0, 1,
-0.9540346, -1.132381, -1.310765, 0.9098039, 1, 0, 1,
-0.9532567, 0.1061718, -2.709041, 0.9019608, 1, 0, 1,
-0.9519237, -0.4725721, -3.695471, 0.8941177, 1, 0, 1,
-0.9487025, -1.946526, -1.218119, 0.8901961, 1, 0, 1,
-0.9440829, 1.773533, 0.1581226, 0.8823529, 1, 0, 1,
-0.9373497, 0.9125229, -0.5754391, 0.8784314, 1, 0, 1,
-0.9364074, 0.7052605, -0.8325346, 0.8705882, 1, 0, 1,
-0.9356688, 0.6100343, -0.3496148, 0.8666667, 1, 0, 1,
-0.9224652, 0.4387886, -0.6317326, 0.8588235, 1, 0, 1,
-0.9222288, -1.895211, -2.719941, 0.854902, 1, 0, 1,
-0.9175013, 0.2189478, -0.6072828, 0.8470588, 1, 0, 1,
-0.9152459, -0.44982, -3.405702, 0.8431373, 1, 0, 1,
-0.9136587, 0.204216, 0.1643573, 0.8352941, 1, 0, 1,
-0.9135374, -2.2763, -3.803557, 0.8313726, 1, 0, 1,
-0.9108283, -0.960085, -3.009116, 0.8235294, 1, 0, 1,
-0.9092267, -0.5260305, -2.120652, 0.8196079, 1, 0, 1,
-0.9031774, 0.541564, -0.5498481, 0.8117647, 1, 0, 1,
-0.8961187, -0.06791905, -2.354834, 0.8078431, 1, 0, 1,
-0.8939431, -1.016214, -4.711031, 0.8, 1, 0, 1,
-0.8928862, -0.5261906, -1.861316, 0.7921569, 1, 0, 1,
-0.8927386, 1.405403, -1.633758, 0.7882353, 1, 0, 1,
-0.8883896, 1.812916, 0.9383515, 0.7803922, 1, 0, 1,
-0.886793, 1.197814, 0.4654639, 0.7764706, 1, 0, 1,
-0.8807773, 1.418622, -2.064831, 0.7686275, 1, 0, 1,
-0.8727756, -1.428575, -2.210666, 0.7647059, 1, 0, 1,
-0.8688053, 1.405207, -0.1970527, 0.7568628, 1, 0, 1,
-0.8590423, -1.324073, -2.852112, 0.7529412, 1, 0, 1,
-0.8537413, 0.5910252, 0.5774268, 0.7450981, 1, 0, 1,
-0.8453823, -0.7653025, -1.291953, 0.7411765, 1, 0, 1,
-0.8365961, 0.9029477, -2.796564, 0.7333333, 1, 0, 1,
-0.8349153, 1.336822, -0.4722565, 0.7294118, 1, 0, 1,
-0.8344886, -1.011252, -3.307232, 0.7215686, 1, 0, 1,
-0.8341006, -1.31479, -2.638745, 0.7176471, 1, 0, 1,
-0.8322159, 1.100723, -0.8966913, 0.7098039, 1, 0, 1,
-0.8313997, 0.1350268, -1.224349, 0.7058824, 1, 0, 1,
-0.8293351, 1.239312, -1.371272, 0.6980392, 1, 0, 1,
-0.8261059, -1.679201, -4.057679, 0.6901961, 1, 0, 1,
-0.8238481, -0.519267, -3.210559, 0.6862745, 1, 0, 1,
-0.8159561, 0.1573529, -2.407296, 0.6784314, 1, 0, 1,
-0.8138625, -1.173362, -1.509825, 0.6745098, 1, 0, 1,
-0.8096794, -1.155411, -1.607442, 0.6666667, 1, 0, 1,
-0.8051209, 0.5348741, 0.930427, 0.6627451, 1, 0, 1,
-0.7904833, -0.6918011, -1.827159, 0.654902, 1, 0, 1,
-0.790089, 0.00345049, -0.7375302, 0.6509804, 1, 0, 1,
-0.7757171, -1.776102, -1.382762, 0.6431373, 1, 0, 1,
-0.7714282, 0.5593508, -1.604686, 0.6392157, 1, 0, 1,
-0.7711, -1.368379, -3.078291, 0.6313726, 1, 0, 1,
-0.767253, 1.552433, -0.9987627, 0.627451, 1, 0, 1,
-0.7650398, -0.1537369, -2.265438, 0.6196079, 1, 0, 1,
-0.7619677, 0.2147718, -1.218342, 0.6156863, 1, 0, 1,
-0.7609645, -0.9824632, -3.19722, 0.6078432, 1, 0, 1,
-0.7571626, 0.8655244, -2.617043, 0.6039216, 1, 0, 1,
-0.7539051, 0.5287894, 0.2392781, 0.5960785, 1, 0, 1,
-0.7537157, -1.251529, -2.77634, 0.5882353, 1, 0, 1,
-0.7536587, -0.9675169, -4.683144, 0.5843138, 1, 0, 1,
-0.7501124, -0.919099, -1.250254, 0.5764706, 1, 0, 1,
-0.7491575, 0.09007631, -1.422146, 0.572549, 1, 0, 1,
-0.7485126, -1.424758, -3.484774, 0.5647059, 1, 0, 1,
-0.7444676, 0.2022307, -1.273225, 0.5607843, 1, 0, 1,
-0.7405688, 0.267145, -0.7854163, 0.5529412, 1, 0, 1,
-0.7395643, 0.02176954, -2.641156, 0.5490196, 1, 0, 1,
-0.7392189, 0.9235419, 1.657479, 0.5411765, 1, 0, 1,
-0.7294551, -1.557202, -4.670318, 0.5372549, 1, 0, 1,
-0.727989, -1.264846, -1.666248, 0.5294118, 1, 0, 1,
-0.722652, 1.240203, -0.006117935, 0.5254902, 1, 0, 1,
-0.7199336, -0.01749376, -1.850914, 0.5176471, 1, 0, 1,
-0.7183918, 0.8072002, -3.715183, 0.5137255, 1, 0, 1,
-0.7182018, -0.7749614, -3.828333, 0.5058824, 1, 0, 1,
-0.7111387, 0.5848515, -2.385223, 0.5019608, 1, 0, 1,
-0.7058625, 1.648468, 0.9727892, 0.4941176, 1, 0, 1,
-0.6987383, -1.055086, -2.535936, 0.4862745, 1, 0, 1,
-0.6980736, -0.7936116, -2.624548, 0.4823529, 1, 0, 1,
-0.6858261, -0.8852773, 0.06231965, 0.4745098, 1, 0, 1,
-0.6840047, 0.4670169, -1.199886, 0.4705882, 1, 0, 1,
-0.6815069, 0.6532616, -2.411261, 0.4627451, 1, 0, 1,
-0.6782472, -1.406781, -4.209103, 0.4588235, 1, 0, 1,
-0.6717392, -0.6991308, -1.404853, 0.4509804, 1, 0, 1,
-0.6603377, 0.3147736, -1.328573, 0.4470588, 1, 0, 1,
-0.659474, 1.094329, -1.576726, 0.4392157, 1, 0, 1,
-0.6584796, 1.700168, -0.791988, 0.4352941, 1, 0, 1,
-0.6562599, 0.7280012, -1.655453, 0.427451, 1, 0, 1,
-0.6541185, 1.058146, -1.822503, 0.4235294, 1, 0, 1,
-0.6478828, -1.101552, -2.403298, 0.4156863, 1, 0, 1,
-0.6458086, 0.8144585, 0.1882941, 0.4117647, 1, 0, 1,
-0.6442662, 1.538426, 0.1541835, 0.4039216, 1, 0, 1,
-0.6435215, -1.288925, -2.717303, 0.3960784, 1, 0, 1,
-0.6415023, 0.8797444, -0.3533636, 0.3921569, 1, 0, 1,
-0.6378554, -0.3706756, -1.449799, 0.3843137, 1, 0, 1,
-0.6374174, 0.3812397, -0.4379193, 0.3803922, 1, 0, 1,
-0.6351971, 1.480565, -1.334394, 0.372549, 1, 0, 1,
-0.6331538, 0.1375356, 0.7626919, 0.3686275, 1, 0, 1,
-0.626003, 1.953301, -0.1204396, 0.3607843, 1, 0, 1,
-0.6258531, -0.4774302, -2.298325, 0.3568628, 1, 0, 1,
-0.6182274, -0.6644588, -3.271473, 0.3490196, 1, 0, 1,
-0.6151198, 1.536432, 0.57212, 0.345098, 1, 0, 1,
-0.6071924, 1.363476, -0.1856408, 0.3372549, 1, 0, 1,
-0.6028419, 0.02529906, -3.687891, 0.3333333, 1, 0, 1,
-0.6002011, -0.5788537, -2.164341, 0.3254902, 1, 0, 1,
-0.5993019, -1.163893, -3.046253, 0.3215686, 1, 0, 1,
-0.59841, 0.09464602, -2.51773, 0.3137255, 1, 0, 1,
-0.5968367, -0.2236986, -2.615083, 0.3098039, 1, 0, 1,
-0.5949849, -0.541854, -1.89408, 0.3019608, 1, 0, 1,
-0.5900514, 0.7485216, 0.2128611, 0.2941177, 1, 0, 1,
-0.5880615, -1.347758, -1.41971, 0.2901961, 1, 0, 1,
-0.587803, -1.542075, -1.562205, 0.282353, 1, 0, 1,
-0.5809487, -0.9431521, -1.943176, 0.2784314, 1, 0, 1,
-0.5783033, 0.2627612, -2.336517, 0.2705882, 1, 0, 1,
-0.5779202, -1.60701, -2.154184, 0.2666667, 1, 0, 1,
-0.5777924, 0.6441359, -2.039001, 0.2588235, 1, 0, 1,
-0.5737112, -0.462451, -1.98122, 0.254902, 1, 0, 1,
-0.5697258, 0.2180068, -0.4531274, 0.2470588, 1, 0, 1,
-0.5656152, -1.222124, -2.126205, 0.2431373, 1, 0, 1,
-0.5623856, -0.4191016, -2.320352, 0.2352941, 1, 0, 1,
-0.5618954, -0.4477416, -1.023902, 0.2313726, 1, 0, 1,
-0.560431, 2.695074, -2.146773, 0.2235294, 1, 0, 1,
-0.5558813, 0.6550667, -1.344034, 0.2196078, 1, 0, 1,
-0.5555516, -0.3313072, -1.798291, 0.2117647, 1, 0, 1,
-0.5469461, -1.37076, -3.447549, 0.2078431, 1, 0, 1,
-0.5432678, 0.5896907, -1.45137, 0.2, 1, 0, 1,
-0.5428202, 0.5798627, -0.8812708, 0.1921569, 1, 0, 1,
-0.5403081, -0.623886, -2.144572, 0.1882353, 1, 0, 1,
-0.5395226, 1.478163, -2.619172, 0.1803922, 1, 0, 1,
-0.5374947, -0.391053, -1.76153, 0.1764706, 1, 0, 1,
-0.535626, 0.06673668, -1.47642, 0.1686275, 1, 0, 1,
-0.5355108, -0.1619308, -4.108025, 0.1647059, 1, 0, 1,
-0.5305953, 2.142384, 0.6845967, 0.1568628, 1, 0, 1,
-0.5261348, -0.4080728, -2.942329, 0.1529412, 1, 0, 1,
-0.5247608, 0.7170649, -0.7966948, 0.145098, 1, 0, 1,
-0.5224899, -0.1972104, -0.9624752, 0.1411765, 1, 0, 1,
-0.5199901, 0.8625256, -0.9796873, 0.1333333, 1, 0, 1,
-0.5199895, -0.3306336, -1.386519, 0.1294118, 1, 0, 1,
-0.519154, -0.535318, -3.142909, 0.1215686, 1, 0, 1,
-0.518992, 0.1790435, -1.235381, 0.1176471, 1, 0, 1,
-0.5157495, -1.161588, -4.278674, 0.1098039, 1, 0, 1,
-0.5067272, -0.4698193, -1.870908, 0.1058824, 1, 0, 1,
-0.5051829, -0.7067853, -2.080876, 0.09803922, 1, 0, 1,
-0.5034505, 1.660315, -0.4670454, 0.09019608, 1, 0, 1,
-0.4966244, -0.194519, -1.804945, 0.08627451, 1, 0, 1,
-0.4960632, -0.696949, -1.42495, 0.07843138, 1, 0, 1,
-0.4918635, 1.205994, -0.5428351, 0.07450981, 1, 0, 1,
-0.4911925, -0.2695737, -2.446986, 0.06666667, 1, 0, 1,
-0.4878809, 0.9421125, -0.7273701, 0.0627451, 1, 0, 1,
-0.4874269, 1.212572, 0.4447777, 0.05490196, 1, 0, 1,
-0.4872565, 2.061119, -1.112314, 0.05098039, 1, 0, 1,
-0.4852062, 1.178505, 0.6551605, 0.04313726, 1, 0, 1,
-0.4851422, 1.707805, -0.3001228, 0.03921569, 1, 0, 1,
-0.4848194, -0.6861748, -1.886562, 0.03137255, 1, 0, 1,
-0.4834959, -2.021965, -1.220668, 0.02745098, 1, 0, 1,
-0.481081, 1.393887, -0.4840811, 0.01960784, 1, 0, 1,
-0.4795538, -0.933063, -1.371895, 0.01568628, 1, 0, 1,
-0.4746744, 1.79494, -0.5926386, 0.007843138, 1, 0, 1,
-0.46599, 0.1192362, -2.703037, 0.003921569, 1, 0, 1,
-0.4657409, -0.5597162, -2.993182, 0, 1, 0.003921569, 1,
-0.4644316, 0.4298597, -2.280151, 0, 1, 0.01176471, 1,
-0.4539397, 0.4321731, -1.323567, 0, 1, 0.01568628, 1,
-0.4463867, -1.342417, -3.563699, 0, 1, 0.02352941, 1,
-0.4407048, 0.04549553, -2.529747, 0, 1, 0.02745098, 1,
-0.4382281, 0.03726129, -1.098681, 0, 1, 0.03529412, 1,
-0.4360904, -0.3490485, -2.276212, 0, 1, 0.03921569, 1,
-0.4326446, -0.2022027, -1.642674, 0, 1, 0.04705882, 1,
-0.4317714, -0.5550772, -0.9714795, 0, 1, 0.05098039, 1,
-0.4280858, -0.1468641, -0.9317735, 0, 1, 0.05882353, 1,
-0.4260992, 1.117679, -0.8800943, 0, 1, 0.0627451, 1,
-0.425274, -2.539961, -3.591569, 0, 1, 0.07058824, 1,
-0.4206645, -0.5786628, -2.045823, 0, 1, 0.07450981, 1,
-0.4179112, -1.26364, -2.852063, 0, 1, 0.08235294, 1,
-0.4148054, -0.9301227, -3.643306, 0, 1, 0.08627451, 1,
-0.4138807, 0.9209218, 0.06865484, 0, 1, 0.09411765, 1,
-0.4099142, -0.7885568, -3.889955, 0, 1, 0.1019608, 1,
-0.4060964, -0.1891635, -0.9494802, 0, 1, 0.1058824, 1,
-0.4045936, 0.03377013, 0.7352476, 0, 1, 0.1137255, 1,
-0.4000354, -1.901971, -3.044983, 0, 1, 0.1176471, 1,
-0.3958687, 0.3834317, -3.693399, 0, 1, 0.1254902, 1,
-0.3889322, 1.516476, 1.279311, 0, 1, 0.1294118, 1,
-0.3880208, -0.8772014, -3.264313, 0, 1, 0.1372549, 1,
-0.3848784, 0.2182065, -2.194251, 0, 1, 0.1411765, 1,
-0.384016, -0.5418649, -0.03029733, 0, 1, 0.1490196, 1,
-0.3835824, -1.095787, -2.878791, 0, 1, 0.1529412, 1,
-0.3826825, 1.428815, 0.5310057, 0, 1, 0.1607843, 1,
-0.3824342, -0.3156579, -1.941187, 0, 1, 0.1647059, 1,
-0.3808956, 0.2952232, -2.525267, 0, 1, 0.172549, 1,
-0.3789564, 0.03262394, -2.183339, 0, 1, 0.1764706, 1,
-0.3780833, 1.043037, -0.6347753, 0, 1, 0.1843137, 1,
-0.3774046, -1.850357, -2.078062, 0, 1, 0.1882353, 1,
-0.3766184, -1.999241, -3.134896, 0, 1, 0.1960784, 1,
-0.3744387, 0.0342245, -2.832721, 0, 1, 0.2039216, 1,
-0.3723199, 0.04324268, -0.6047574, 0, 1, 0.2078431, 1,
-0.3704233, 0.1500146, -1.791535, 0, 1, 0.2156863, 1,
-0.3684313, 2.362828, 0.3939065, 0, 1, 0.2196078, 1,
-0.3681303, 0.3450746, 0.2914765, 0, 1, 0.227451, 1,
-0.3665508, -1.318021, -0.7387106, 0, 1, 0.2313726, 1,
-0.3647269, 0.9746132, -0.5770363, 0, 1, 0.2392157, 1,
-0.3644345, -1.236396, -1.83174, 0, 1, 0.2431373, 1,
-0.3627394, 0.4033251, 2.074306, 0, 1, 0.2509804, 1,
-0.3626878, -0.204972, -2.677291, 0, 1, 0.254902, 1,
-0.3594073, -0.5395138, -2.324922, 0, 1, 0.2627451, 1,
-0.3579646, 0.6834614, -1.551176, 0, 1, 0.2666667, 1,
-0.350486, 0.7144565, 0.5441454, 0, 1, 0.2745098, 1,
-0.3477515, 0.3260121, -0.7369047, 0, 1, 0.2784314, 1,
-0.3469715, 0.8362941, -2.623709, 0, 1, 0.2862745, 1,
-0.3459794, 2.438022, -0.9046811, 0, 1, 0.2901961, 1,
-0.3429873, -1.68345, -2.246467, 0, 1, 0.2980392, 1,
-0.3393487, -0.9884892, -1.893613, 0, 1, 0.3058824, 1,
-0.3357218, 1.257603, -1.519235, 0, 1, 0.3098039, 1,
-0.3321551, -0.6551215, -4.934212, 0, 1, 0.3176471, 1,
-0.3321334, 1.110352, 0.4653123, 0, 1, 0.3215686, 1,
-0.3309307, 1.52772, 0.751358, 0, 1, 0.3294118, 1,
-0.323898, 0.8359904, -0.0798445, 0, 1, 0.3333333, 1,
-0.3229434, 1.591124, -1.375812, 0, 1, 0.3411765, 1,
-0.3211616, 0.9926331, -0.1105535, 0, 1, 0.345098, 1,
-0.3175554, 1.158253, 1.212742, 0, 1, 0.3529412, 1,
-0.3172835, -0.6368422, -2.888709, 0, 1, 0.3568628, 1,
-0.3120697, -0.7053211, -2.468764, 0, 1, 0.3647059, 1,
-0.3111256, -0.1586784, -2.429476, 0, 1, 0.3686275, 1,
-0.3089716, 0.565848, -0.3391222, 0, 1, 0.3764706, 1,
-0.3051236, 0.8337797, 0.9352534, 0, 1, 0.3803922, 1,
-0.3020447, 0.5889536, -1.530382, 0, 1, 0.3882353, 1,
-0.3019134, 0.5507147, -0.374121, 0, 1, 0.3921569, 1,
-0.2982052, 0.1356076, -1.41915, 0, 1, 0.4, 1,
-0.2975987, 0.4811983, -0.4484909, 0, 1, 0.4078431, 1,
-0.2972113, 1.214904, -0.4607513, 0, 1, 0.4117647, 1,
-0.2934208, 0.436564, 0.8183081, 0, 1, 0.4196078, 1,
-0.2914739, -0.407416, -3.521277, 0, 1, 0.4235294, 1,
-0.2892534, -0.8213717, -1.705492, 0, 1, 0.4313726, 1,
-0.2863939, -0.5214334, -1.71052, 0, 1, 0.4352941, 1,
-0.2849554, 0.4247695, 0.005379276, 0, 1, 0.4431373, 1,
-0.2846732, -0.4497128, -2.246128, 0, 1, 0.4470588, 1,
-0.284143, 1.487722, 1.05149, 0, 1, 0.454902, 1,
-0.2764825, 0.1978358, -0.3829211, 0, 1, 0.4588235, 1,
-0.2763424, -0.8201272, -3.764326, 0, 1, 0.4666667, 1,
-0.275991, -0.7431999, -2.50671, 0, 1, 0.4705882, 1,
-0.2746046, 0.4695773, 0.9157893, 0, 1, 0.4784314, 1,
-0.2706766, 1.391318, 1.341914, 0, 1, 0.4823529, 1,
-0.268883, 0.178751, 1.06297, 0, 1, 0.4901961, 1,
-0.259147, 1.03053, -0.52356, 0, 1, 0.4941176, 1,
-0.258091, -2.476675, -3.094711, 0, 1, 0.5019608, 1,
-0.2529931, 0.5154724, -0.995988, 0, 1, 0.509804, 1,
-0.2523018, -1.14497, -4.266857, 0, 1, 0.5137255, 1,
-0.248045, -0.1127028, -1.727904, 0, 1, 0.5215687, 1,
-0.2462073, 0.1434708, -0.5650498, 0, 1, 0.5254902, 1,
-0.2429959, -0.517525, -3.310099, 0, 1, 0.5333334, 1,
-0.242863, 0.4743007, 0.8737862, 0, 1, 0.5372549, 1,
-0.2413671, 0.4381763, -1.075658, 0, 1, 0.5450981, 1,
-0.2363927, -1.043156, -3.513771, 0, 1, 0.5490196, 1,
-0.2282387, -1.764328, -1.350455, 0, 1, 0.5568628, 1,
-0.2230867, 0.2126394, -2.735363, 0, 1, 0.5607843, 1,
-0.2206822, -0.810571, -2.66828, 0, 1, 0.5686275, 1,
-0.2205723, 0.6672618, -1.046252, 0, 1, 0.572549, 1,
-0.2131391, -0.6892691, -2.548421, 0, 1, 0.5803922, 1,
-0.2128882, 0.9612795, -1.711285, 0, 1, 0.5843138, 1,
-0.2122778, 0.03210946, -2.008049, 0, 1, 0.5921569, 1,
-0.207695, 0.2595109, -1.192961, 0, 1, 0.5960785, 1,
-0.2072036, -0.7535945, -2.071795, 0, 1, 0.6039216, 1,
-0.2051252, -0.2369272, -1.357741, 0, 1, 0.6117647, 1,
-0.202501, 2.180842, -0.04897594, 0, 1, 0.6156863, 1,
-0.2022038, 0.9278526, 0.8002018, 0, 1, 0.6235294, 1,
-0.2016155, -0.2944454, -3.569391, 0, 1, 0.627451, 1,
-0.1984975, -0.5480834, -2.105503, 0, 1, 0.6352941, 1,
-0.1971968, -0.7839085, -1.632782, 0, 1, 0.6392157, 1,
-0.1964122, -1.070518, -2.078988, 0, 1, 0.6470588, 1,
-0.1942354, 1.052838, -0.9380228, 0, 1, 0.6509804, 1,
-0.1930373, -0.4864123, -2.764676, 0, 1, 0.6588235, 1,
-0.1927536, 1.327024, 0.7955971, 0, 1, 0.6627451, 1,
-0.186953, 1.755125, 0.7265365, 0, 1, 0.6705883, 1,
-0.1861936, -0.6740074, -1.390677, 0, 1, 0.6745098, 1,
-0.1842742, 0.6608058, -0.36816, 0, 1, 0.682353, 1,
-0.1828459, 3.301405, -0.03552288, 0, 1, 0.6862745, 1,
-0.1814204, -0.5043693, -2.267568, 0, 1, 0.6941177, 1,
-0.1798228, 0.812683, 1.100581, 0, 1, 0.7019608, 1,
-0.1793733, -0.2563461, -4.430488, 0, 1, 0.7058824, 1,
-0.1790748, 0.06975184, -1.772195, 0, 1, 0.7137255, 1,
-0.1780764, -0.2642801, -2.341059, 0, 1, 0.7176471, 1,
-0.1743769, 1.804681, -1.044262, 0, 1, 0.7254902, 1,
-0.1735967, -0.5602899, -1.057853, 0, 1, 0.7294118, 1,
-0.1676962, -1.064512, -3.200173, 0, 1, 0.7372549, 1,
-0.1676455, 0.1790838, -0.4449668, 0, 1, 0.7411765, 1,
-0.1669756, -0.6659416, -3.217559, 0, 1, 0.7490196, 1,
-0.165179, -1.069951, -3.383248, 0, 1, 0.7529412, 1,
-0.1599774, -0.9901475, -3.270703, 0, 1, 0.7607843, 1,
-0.1575892, -0.8743284, -2.481127, 0, 1, 0.7647059, 1,
-0.1556755, -0.4025237, -3.314482, 0, 1, 0.772549, 1,
-0.1480425, -0.8193095, -2.071795, 0, 1, 0.7764706, 1,
-0.1468017, -0.541845, -2.704463, 0, 1, 0.7843137, 1,
-0.1463614, -1.380137, -2.309148, 0, 1, 0.7882353, 1,
-0.1413572, -0.2127596, -3.288589, 0, 1, 0.7960784, 1,
-0.1411351, -0.1934803, -1.925194, 0, 1, 0.8039216, 1,
-0.1367104, 0.3825099, -0.06398745, 0, 1, 0.8078431, 1,
-0.131928, -1.644803, -1.462891, 0, 1, 0.8156863, 1,
-0.1243558, 3.26563, 1.488968, 0, 1, 0.8196079, 1,
-0.1218991, 1.03905, -1.153813, 0, 1, 0.827451, 1,
-0.1193583, 0.9524212, -0.6677029, 0, 1, 0.8313726, 1,
-0.1171766, 0.3540766, -1.16997, 0, 1, 0.8392157, 1,
-0.1160629, -1.212491, -2.971422, 0, 1, 0.8431373, 1,
-0.1134127, 0.829927, 0.1351589, 0, 1, 0.8509804, 1,
-0.1127475, -0.1959162, -2.664684, 0, 1, 0.854902, 1,
-0.1095007, 1.058074, -0.1024024, 0, 1, 0.8627451, 1,
-0.1092212, -0.2559599, -2.026342, 0, 1, 0.8666667, 1,
-0.09853484, -1.652474, -4.179039, 0, 1, 0.8745098, 1,
-0.0970147, 1.576466, 0.9154202, 0, 1, 0.8784314, 1,
-0.09373748, 1.821831, -0.1124429, 0, 1, 0.8862745, 1,
-0.09105518, -0.7465689, -4.915138, 0, 1, 0.8901961, 1,
-0.08960178, 1.576636, 0.3911876, 0, 1, 0.8980392, 1,
-0.08839233, 0.402737, -0.5167183, 0, 1, 0.9058824, 1,
-0.08346739, -0.07999154, -0.7703204, 0, 1, 0.9098039, 1,
-0.08199652, 0.5509503, -1.713123, 0, 1, 0.9176471, 1,
-0.07894767, -0.06501037, -0.4737108, 0, 1, 0.9215686, 1,
-0.07058188, -0.2190868, -1.571115, 0, 1, 0.9294118, 1,
-0.0668622, -0.3802726, -2.563483, 0, 1, 0.9333333, 1,
-0.0663543, 1.397471, -0.4369877, 0, 1, 0.9411765, 1,
-0.05926723, 0.2708338, -2.514997, 0, 1, 0.945098, 1,
-0.05918667, -1.632299, -3.548594, 0, 1, 0.9529412, 1,
-0.05838119, -0.2117139, -2.402032, 0, 1, 0.9568627, 1,
-0.05788712, 0.9245684, -1.124088, 0, 1, 0.9647059, 1,
-0.05675927, -0.652954, -3.773516, 0, 1, 0.9686275, 1,
-0.05656771, -0.1373806, -3.235568, 0, 1, 0.9764706, 1,
-0.05586093, -0.5089767, -3.298831, 0, 1, 0.9803922, 1,
-0.05486682, -0.1028087, -2.903033, 0, 1, 0.9882353, 1,
-0.05173156, -1.815415, -2.728637, 0, 1, 0.9921569, 1,
-0.04553152, -0.3601785, -3.787615, 0, 1, 1, 1,
-0.04518654, -0.4267763, -4.660795, 0, 0.9921569, 1, 1,
-0.04279765, -1.097359, -2.280431, 0, 0.9882353, 1, 1,
-0.03570666, 0.3938819, -0.9641943, 0, 0.9803922, 1, 1,
-0.0338021, 0.2276596, -0.4128196, 0, 0.9764706, 1, 1,
-0.03343306, -0.5993007, -4.38873, 0, 0.9686275, 1, 1,
-0.03155019, 0.1548974, -1.004924, 0, 0.9647059, 1, 1,
-0.03127231, 0.5845948, 0.8173555, 0, 0.9568627, 1, 1,
-0.02992565, -0.4783663, -1.960261, 0, 0.9529412, 1, 1,
-0.02903475, 1.533662, -0.5247637, 0, 0.945098, 1, 1,
-0.02875539, 0.4492016, 0.1402021, 0, 0.9411765, 1, 1,
-0.02807607, -1.995416, -4.242684, 0, 0.9333333, 1, 1,
-0.02654056, -0.6205313, -2.699293, 0, 0.9294118, 1, 1,
-0.02447254, 1.454248, 1.417595, 0, 0.9215686, 1, 1,
-0.02275446, 0.4587619, 0.4924527, 0, 0.9176471, 1, 1,
-0.02009307, -0.578069, -3.138856, 0, 0.9098039, 1, 1,
-0.01943636, -0.1342963, -3.475586, 0, 0.9058824, 1, 1,
-0.01753102, -1.442, -3.120171, 0, 0.8980392, 1, 1,
-0.0118967, 0.3839536, -0.9077471, 0, 0.8901961, 1, 1,
-0.01118982, -0.3992174, -1.877484, 0, 0.8862745, 1, 1,
-0.009611018, 1.079624, 1.166344, 0, 0.8784314, 1, 1,
-0.009597582, -0.1222698, -2.454515, 0, 0.8745098, 1, 1,
-0.008474799, 0.06455379, 0.8255815, 0, 0.8666667, 1, 1,
-0.008117975, -0.4129665, -2.996483, 0, 0.8627451, 1, 1,
-0.005930319, 0.3699842, -0.7526633, 0, 0.854902, 1, 1,
-0.002466496, -1.243417, -3.54795, 0, 0.8509804, 1, 1,
0.000982801, -0.3424436, 4.659616, 0, 0.8431373, 1, 1,
0.003365975, -0.04064134, 2.216904, 0, 0.8392157, 1, 1,
0.006168643, 2.256554, -0.3108579, 0, 0.8313726, 1, 1,
0.007157655, 0.3490596, 1.46128, 0, 0.827451, 1, 1,
0.008027364, -1.449729, 0.5982677, 0, 0.8196079, 1, 1,
0.0102191, 0.6999234, -1.060817, 0, 0.8156863, 1, 1,
0.01155662, 0.5596618, -0.04039602, 0, 0.8078431, 1, 1,
0.01171388, 2.349069, 0.6396933, 0, 0.8039216, 1, 1,
0.01310258, -0.5178641, 1.783314, 0, 0.7960784, 1, 1,
0.01747217, -1.436775, 3.414071, 0, 0.7882353, 1, 1,
0.02138349, 0.5581868, -0.1083659, 0, 0.7843137, 1, 1,
0.02267114, 0.4979176, 0.08383217, 0, 0.7764706, 1, 1,
0.03003394, 0.2779941, -1.209184, 0, 0.772549, 1, 1,
0.03791871, -0.7604496, 3.259342, 0, 0.7647059, 1, 1,
0.04055342, -0.4716079, 4.287178, 0, 0.7607843, 1, 1,
0.04355959, 0.08391163, 0.8044192, 0, 0.7529412, 1, 1,
0.05056089, -0.2519072, 3.951047, 0, 0.7490196, 1, 1,
0.05200346, 0.02196169, 3.053401, 0, 0.7411765, 1, 1,
0.05278372, -3.078986, 3.34388, 0, 0.7372549, 1, 1,
0.05437913, -0.3727506, 1.48709, 0, 0.7294118, 1, 1,
0.05696587, -0.8263844, 0.8972642, 0, 0.7254902, 1, 1,
0.0574109, -0.1307233, 2.918013, 0, 0.7176471, 1, 1,
0.06505781, -0.5456726, 2.62645, 0, 0.7137255, 1, 1,
0.0664935, 1.604848, 0.1468258, 0, 0.7058824, 1, 1,
0.06788379, -0.550185, 2.856868, 0, 0.6980392, 1, 1,
0.06808657, 0.04559791, 2.912525, 0, 0.6941177, 1, 1,
0.06834334, 2.240198, 0.1841923, 0, 0.6862745, 1, 1,
0.06944883, 0.1165978, -0.1329226, 0, 0.682353, 1, 1,
0.07322049, -0.5915249, 4.810195, 0, 0.6745098, 1, 1,
0.07334249, -2.270084, 2.876949, 0, 0.6705883, 1, 1,
0.07555198, -0.439734, 4.16449, 0, 0.6627451, 1, 1,
0.07681611, 1.138188, 0.854707, 0, 0.6588235, 1, 1,
0.07768948, 0.2790668, 1.636218, 0, 0.6509804, 1, 1,
0.08434464, -1.131605, 1.931856, 0, 0.6470588, 1, 1,
0.08579885, -0.9410645, 3.882902, 0, 0.6392157, 1, 1,
0.08667568, -0.3110345, 3.615731, 0, 0.6352941, 1, 1,
0.08723475, 0.5976272, 1.289521, 0, 0.627451, 1, 1,
0.1051403, -0.05449108, 1.275768, 0, 0.6235294, 1, 1,
0.1059554, 0.7127091, 0.7316107, 0, 0.6156863, 1, 1,
0.1077014, 0.3930625, 1.030863, 0, 0.6117647, 1, 1,
0.1080446, 0.3795512, -0.767967, 0, 0.6039216, 1, 1,
0.1082324, 0.7551373, 0.2505654, 0, 0.5960785, 1, 1,
0.1104951, -1.316607, 3.187291, 0, 0.5921569, 1, 1,
0.1111527, -0.3672123, 4.20734, 0, 0.5843138, 1, 1,
0.1144989, 0.9814661, 0.7000412, 0, 0.5803922, 1, 1,
0.1154694, -0.9213615, 2.16572, 0, 0.572549, 1, 1,
0.1167237, -1.184954, -0.1677753, 0, 0.5686275, 1, 1,
0.1171723, 0.2545883, 1.990685, 0, 0.5607843, 1, 1,
0.1200264, -0.1657716, 1.267046, 0, 0.5568628, 1, 1,
0.1203827, 1.145736, 0.266452, 0, 0.5490196, 1, 1,
0.1272645, -0.1351885, 2.264109, 0, 0.5450981, 1, 1,
0.1278754, -2.290642, 4.15188, 0, 0.5372549, 1, 1,
0.1333856, -0.7329913, 2.765619, 0, 0.5333334, 1, 1,
0.1335149, 1.336756, 0.3659364, 0, 0.5254902, 1, 1,
0.1338412, -0.06333629, 1.959066, 0, 0.5215687, 1, 1,
0.1377381, -0.3296367, 4.645555, 0, 0.5137255, 1, 1,
0.1395041, -1.667369, 2.040468, 0, 0.509804, 1, 1,
0.1473856, 0.3803757, 0.6190855, 0, 0.5019608, 1, 1,
0.1486824, -2.504577, 3.017901, 0, 0.4941176, 1, 1,
0.1489744, -1.390633, 3.082038, 0, 0.4901961, 1, 1,
0.1492874, -0.5774224, 3.692922, 0, 0.4823529, 1, 1,
0.1505759, 1.682243, -0.4834588, 0, 0.4784314, 1, 1,
0.1507387, -0.3045667, 3.089123, 0, 0.4705882, 1, 1,
0.1529021, -1.11719, 2.27525, 0, 0.4666667, 1, 1,
0.1541326, -0.2804458, 2.406379, 0, 0.4588235, 1, 1,
0.1542203, 1.104346, 1.244376, 0, 0.454902, 1, 1,
0.1612367, -1.434207, 2.668921, 0, 0.4470588, 1, 1,
0.1621978, 1.287842, 0.3217472, 0, 0.4431373, 1, 1,
0.1694368, -1.129905, 2.178284, 0, 0.4352941, 1, 1,
0.1714341, 0.9714925, 0.6664951, 0, 0.4313726, 1, 1,
0.1715199, 1.209684, -1.737823, 0, 0.4235294, 1, 1,
0.1715922, -0.4446959, 2.1509, 0, 0.4196078, 1, 1,
0.1717714, -0.02996277, 3.375255, 0, 0.4117647, 1, 1,
0.1748718, -0.810204, 2.465122, 0, 0.4078431, 1, 1,
0.1752587, 0.9948918, 0.6061558, 0, 0.4, 1, 1,
0.1782719, 1.359479, 0.1664199, 0, 0.3921569, 1, 1,
0.1800584, -1.00874, 2.598818, 0, 0.3882353, 1, 1,
0.1835984, -0.5461702, 3.006599, 0, 0.3803922, 1, 1,
0.1896812, 1.236675, 0.8810487, 0, 0.3764706, 1, 1,
0.190601, 1.157859, -0.7852099, 0, 0.3686275, 1, 1,
0.197438, 0.8436093, 0.4765515, 0, 0.3647059, 1, 1,
0.1985051, -0.9868526, 4.052156, 0, 0.3568628, 1, 1,
0.198558, -0.02226626, 1.260859, 0, 0.3529412, 1, 1,
0.198676, 0.2437449, 0.1411731, 0, 0.345098, 1, 1,
0.2031173, -1.001218, 2.47951, 0, 0.3411765, 1, 1,
0.2105577, -1.018396, 3.926939, 0, 0.3333333, 1, 1,
0.2143065, 0.9923936, -1.031777, 0, 0.3294118, 1, 1,
0.2172718, 0.7902476, -1.082945, 0, 0.3215686, 1, 1,
0.2176569, -0.3728094, 2.170748, 0, 0.3176471, 1, 1,
0.2197795, 0.7411371, -0.12157, 0, 0.3098039, 1, 1,
0.2212182, -0.5413069, 1.058846, 0, 0.3058824, 1, 1,
0.2217445, -1.807502, 3.513958, 0, 0.2980392, 1, 1,
0.2233335, 1.222796, -1.313756, 0, 0.2901961, 1, 1,
0.228178, -1.043387, 3.022069, 0, 0.2862745, 1, 1,
0.2282603, -1.824352, 3.423212, 0, 0.2784314, 1, 1,
0.2294441, -1.868805, 3.332669, 0, 0.2745098, 1, 1,
0.2300075, 0.5988151, -0.8272707, 0, 0.2666667, 1, 1,
0.2327011, -0.820352, 3.587497, 0, 0.2627451, 1, 1,
0.2350446, -0.804867, 1.909016, 0, 0.254902, 1, 1,
0.2398718, -1.52609, 0.7983201, 0, 0.2509804, 1, 1,
0.2408502, -0.6962407, 1.378267, 0, 0.2431373, 1, 1,
0.2467412, -1.040817, 2.217102, 0, 0.2392157, 1, 1,
0.2479762, 0.2334109, 0.2527089, 0, 0.2313726, 1, 1,
0.2507444, 1.517368, -2.33108, 0, 0.227451, 1, 1,
0.2588448, -0.09446404, 1.328509, 0, 0.2196078, 1, 1,
0.2704974, -2.277012, 2.505286, 0, 0.2156863, 1, 1,
0.2748506, 1.075405, 2.74533, 0, 0.2078431, 1, 1,
0.28065, 0.4951198, 0.1408192, 0, 0.2039216, 1, 1,
0.2808716, -0.3395227, 0.9240074, 0, 0.1960784, 1, 1,
0.2857374, -0.9046434, 1.31518, 0, 0.1882353, 1, 1,
0.2858507, -0.5803072, 3.428686, 0, 0.1843137, 1, 1,
0.2861959, -0.3011634, 3.83947, 0, 0.1764706, 1, 1,
0.2862654, 1.222311, -0.2628008, 0, 0.172549, 1, 1,
0.2879286, 0.4252299, 2.269111, 0, 0.1647059, 1, 1,
0.2899185, -0.02982386, 1.947602, 0, 0.1607843, 1, 1,
0.2953954, 0.9770946, 0.04206924, 0, 0.1529412, 1, 1,
0.295784, 0.7354847, -0.6315494, 0, 0.1490196, 1, 1,
0.3058948, 1.364963, 1.311118, 0, 0.1411765, 1, 1,
0.3095563, -0.8559535, 3.239197, 0, 0.1372549, 1, 1,
0.3124151, -2.046226, 3.607263, 0, 0.1294118, 1, 1,
0.3125925, 1.408935, 1.614783, 0, 0.1254902, 1, 1,
0.3127369, -0.5562677, 1.787092, 0, 0.1176471, 1, 1,
0.3175309, -1.302267, 3.049693, 0, 0.1137255, 1, 1,
0.3195258, 0.06695174, 1.924595, 0, 0.1058824, 1, 1,
0.327395, -1.767362, 2.023434, 0, 0.09803922, 1, 1,
0.3291502, 0.6868169, 0.4054791, 0, 0.09411765, 1, 1,
0.3329142, 0.3463855, 0.6232877, 0, 0.08627451, 1, 1,
0.3332049, 0.6994894, 1.744608, 0, 0.08235294, 1, 1,
0.3404484, 0.2030717, 1.145192, 0, 0.07450981, 1, 1,
0.3423196, -1.307728, 3.367638, 0, 0.07058824, 1, 1,
0.3434422, 0.2397842, 1.061898, 0, 0.0627451, 1, 1,
0.3472789, -0.1260448, 1.842583, 0, 0.05882353, 1, 1,
0.3544091, 0.155189, -0.2475685, 0, 0.05098039, 1, 1,
0.3556068, 0.5427266, 0.6657816, 0, 0.04705882, 1, 1,
0.3595396, 0.8450397, 0.7197552, 0, 0.03921569, 1, 1,
0.3605768, -0.918409, 2.882047, 0, 0.03529412, 1, 1,
0.3679117, -0.6393804, 1.870092, 0, 0.02745098, 1, 1,
0.371555, -2.345932, 2.221352, 0, 0.02352941, 1, 1,
0.3779304, 0.3889416, -0.3852077, 0, 0.01568628, 1, 1,
0.378837, -1.76671, 3.402192, 0, 0.01176471, 1, 1,
0.3793616, -0.6936025, 2.075576, 0, 0.003921569, 1, 1,
0.3816528, -1.117218, 3.786871, 0.003921569, 0, 1, 1,
0.381681, -0.8605695, 2.214764, 0.007843138, 0, 1, 1,
0.3849964, 1.192267, 0.8733221, 0.01568628, 0, 1, 1,
0.3913654, 0.1362545, 1.185572, 0.01960784, 0, 1, 1,
0.3926135, -0.9404684, 3.26989, 0.02745098, 0, 1, 1,
0.3959981, 0.2035776, 1.130226, 0.03137255, 0, 1, 1,
0.3985302, -0.6454077, 4.123125, 0.03921569, 0, 1, 1,
0.4042766, -0.4826714, 1.060861, 0.04313726, 0, 1, 1,
0.4043157, 1.861828, 1.311418, 0.05098039, 0, 1, 1,
0.4045525, -0.6009758, 2.475506, 0.05490196, 0, 1, 1,
0.4057125, 0.4573326, -1.265696, 0.0627451, 0, 1, 1,
0.4058849, 0.9009647, 0.1880075, 0.06666667, 0, 1, 1,
0.406039, 0.6149127, 1.033988, 0.07450981, 0, 1, 1,
0.4107491, -0.4536184, 1.400849, 0.07843138, 0, 1, 1,
0.4117034, 1.74123, -0.1527191, 0.08627451, 0, 1, 1,
0.4164711, 0.4969038, 0.777071, 0.09019608, 0, 1, 1,
0.4180132, 0.06594187, 1.266225, 0.09803922, 0, 1, 1,
0.418857, -0.6509525, 3.683055, 0.1058824, 0, 1, 1,
0.4258306, 0.02471912, 0.8596281, 0.1098039, 0, 1, 1,
0.425995, 1.235885, 1.308381, 0.1176471, 0, 1, 1,
0.4272075, 0.8055094, 0.7523305, 0.1215686, 0, 1, 1,
0.428122, 0.04478028, -0.3649825, 0.1294118, 0, 1, 1,
0.4382764, -0.5096623, 3.182639, 0.1333333, 0, 1, 1,
0.4405108, -0.4407588, 3.063725, 0.1411765, 0, 1, 1,
0.4411241, -0.8146872, 3.831216, 0.145098, 0, 1, 1,
0.4417324, 0.2435878, -1.801032, 0.1529412, 0, 1, 1,
0.4433127, -0.591796, 1.556607, 0.1568628, 0, 1, 1,
0.449244, -1.179306, 2.588512, 0.1647059, 0, 1, 1,
0.4556225, -0.6173982, 3.532198, 0.1686275, 0, 1, 1,
0.4571021, 0.4633547, 0.1831629, 0.1764706, 0, 1, 1,
0.4589314, 0.5486383, 2.326669, 0.1803922, 0, 1, 1,
0.4604505, -0.3719361, 2.170629, 0.1882353, 0, 1, 1,
0.4689947, -0.4557, 1.273484, 0.1921569, 0, 1, 1,
0.4694926, -1.099841, 4.41092, 0.2, 0, 1, 1,
0.4826196, 1.208746, 0.5283172, 0.2078431, 0, 1, 1,
0.4893058, -0.9045815, 1.640926, 0.2117647, 0, 1, 1,
0.4903026, -1.279006, 2.805897, 0.2196078, 0, 1, 1,
0.4937079, 0.07422222, 2.158902, 0.2235294, 0, 1, 1,
0.4945111, 0.4073145, 1.754638, 0.2313726, 0, 1, 1,
0.4957455, 0.1971375, 0.5983935, 0.2352941, 0, 1, 1,
0.498809, -1.041473, 1.247247, 0.2431373, 0, 1, 1,
0.5002901, -0.4102445, 2.713519, 0.2470588, 0, 1, 1,
0.5073543, 0.8400673, -0.3915139, 0.254902, 0, 1, 1,
0.5078692, -0.1448434, 1.218156, 0.2588235, 0, 1, 1,
0.5097048, -0.4688118, 1.824073, 0.2666667, 0, 1, 1,
0.5133643, 1.048894, 0.4438309, 0.2705882, 0, 1, 1,
0.5213059, -0.3312364, 3.108091, 0.2784314, 0, 1, 1,
0.5215444, -0.06224845, 3.050385, 0.282353, 0, 1, 1,
0.5258844, 0.02333963, 0.1143874, 0.2901961, 0, 1, 1,
0.5284964, -1.828766, 3.783341, 0.2941177, 0, 1, 1,
0.5324204, -0.7516872, 1.526759, 0.3019608, 0, 1, 1,
0.5363591, 1.369067, 1.139856, 0.3098039, 0, 1, 1,
0.5380667, 1.857371, 1.02198, 0.3137255, 0, 1, 1,
0.5396069, -0.7096432, 2.807784, 0.3215686, 0, 1, 1,
0.540834, 1.455727, 0.02327223, 0.3254902, 0, 1, 1,
0.5461004, 1.112477, -0.05804337, 0.3333333, 0, 1, 1,
0.5483726, -0.1909734, 3.933588, 0.3372549, 0, 1, 1,
0.5555316, 1.370816, 0.9526671, 0.345098, 0, 1, 1,
0.562229, 0.8884021, -1.350682, 0.3490196, 0, 1, 1,
0.5627857, 0.06677902, 2.393327, 0.3568628, 0, 1, 1,
0.5637543, 1.710376, 0.5725966, 0.3607843, 0, 1, 1,
0.5698672, 0.9298362, 0.3500959, 0.3686275, 0, 1, 1,
0.5763797, 2.425491, -0.4841203, 0.372549, 0, 1, 1,
0.5956228, -0.913675, 2.222866, 0.3803922, 0, 1, 1,
0.6050063, 0.180748, 1.986376, 0.3843137, 0, 1, 1,
0.6058404, 1.328065, -1.197742, 0.3921569, 0, 1, 1,
0.6066079, -1.101686, 3.007818, 0.3960784, 0, 1, 1,
0.6090783, 0.7258579, 2.2198, 0.4039216, 0, 1, 1,
0.6114512, -0.3327697, 2.700858, 0.4117647, 0, 1, 1,
0.6127638, 1.450251, 0.4757164, 0.4156863, 0, 1, 1,
0.6160988, 0.8951312, 0.05948288, 0.4235294, 0, 1, 1,
0.6163175, 0.7142529, -0.04939846, 0.427451, 0, 1, 1,
0.6223437, 1.716071, -0.03550315, 0.4352941, 0, 1, 1,
0.6240249, -0.5845635, 1.233928, 0.4392157, 0, 1, 1,
0.6324479, 0.8575975, 0.2445674, 0.4470588, 0, 1, 1,
0.6344277, 1.402734, -0.9128811, 0.4509804, 0, 1, 1,
0.637344, 0.9022979, 0.9959104, 0.4588235, 0, 1, 1,
0.6398392, 0.5734298, 1.231294, 0.4627451, 0, 1, 1,
0.6399651, -0.1029802, 1.090784, 0.4705882, 0, 1, 1,
0.6420329, -0.5487479, 3.008221, 0.4745098, 0, 1, 1,
0.6446401, 0.3239129, 0.7106855, 0.4823529, 0, 1, 1,
0.6480585, -0.6179034, 0.5008876, 0.4862745, 0, 1, 1,
0.6549905, -0.7955734, 2.597484, 0.4941176, 0, 1, 1,
0.6555351, -0.4689576, 1.715419, 0.5019608, 0, 1, 1,
0.6602905, 1.488195, -0.6564813, 0.5058824, 0, 1, 1,
0.6633263, -0.5436309, 3.638284, 0.5137255, 0, 1, 1,
0.6698965, -1.10145, 2.933949, 0.5176471, 0, 1, 1,
0.6702433, 0.4827989, 0.7973005, 0.5254902, 0, 1, 1,
0.6747718, -0.1721645, 3.103711, 0.5294118, 0, 1, 1,
0.6772865, 0.523078, 0.8269638, 0.5372549, 0, 1, 1,
0.6786955, 1.744873, 0.5848089, 0.5411765, 0, 1, 1,
0.6829008, 0.4284311, -0.7743244, 0.5490196, 0, 1, 1,
0.683964, -1.585338, 0.9549564, 0.5529412, 0, 1, 1,
0.6840132, -2.094825, 3.352614, 0.5607843, 0, 1, 1,
0.6877604, 1.225047, -0.626763, 0.5647059, 0, 1, 1,
0.6913884, 1.013428, -0.7006174, 0.572549, 0, 1, 1,
0.6915066, -0.006509847, 1.611442, 0.5764706, 0, 1, 1,
0.6949454, 0.6552038, 0.2478369, 0.5843138, 0, 1, 1,
0.695432, -0.2460454, 2.987736, 0.5882353, 0, 1, 1,
0.6963457, 1.490978, 0.01216744, 0.5960785, 0, 1, 1,
0.7101499, 0.9405378, -0.3238566, 0.6039216, 0, 1, 1,
0.7124382, -2.237144, 3.04258, 0.6078432, 0, 1, 1,
0.7147967, -0.5220262, -0.2181108, 0.6156863, 0, 1, 1,
0.7223048, -0.07814778, 0.6789797, 0.6196079, 0, 1, 1,
0.7223705, 1.481031, -0.09608792, 0.627451, 0, 1, 1,
0.723532, 0.622057, 2.589787, 0.6313726, 0, 1, 1,
0.724919, 1.831509, 1.196142, 0.6392157, 0, 1, 1,
0.7269173, 0.9194512, 0.5534265, 0.6431373, 0, 1, 1,
0.7335806, 1.416855, 2.680246, 0.6509804, 0, 1, 1,
0.7365081, 0.1406302, -1.020007, 0.654902, 0, 1, 1,
0.7496644, -0.8038972, 1.974273, 0.6627451, 0, 1, 1,
0.7588943, -0.4296763, 2.033134, 0.6666667, 0, 1, 1,
0.7766654, -0.5176594, 2.747647, 0.6745098, 0, 1, 1,
0.7772011, 0.4617727, -0.2899933, 0.6784314, 0, 1, 1,
0.7775111, 0.6632879, 1.438285, 0.6862745, 0, 1, 1,
0.7805292, -0.3184816, 3.640858, 0.6901961, 0, 1, 1,
0.7834332, 0.7790278, 0.5757297, 0.6980392, 0, 1, 1,
0.785111, -1.181946, 1.083679, 0.7058824, 0, 1, 1,
0.7871267, -0.2381936, 2.237701, 0.7098039, 0, 1, 1,
0.7872521, -0.8087817, 2.371771, 0.7176471, 0, 1, 1,
0.78816, -1.782417, 2.835196, 0.7215686, 0, 1, 1,
0.7882039, 0.4521406, 1.292631, 0.7294118, 0, 1, 1,
0.7906499, 0.8686166, -0.06259524, 0.7333333, 0, 1, 1,
0.794521, 1.16408, -0.01479646, 0.7411765, 0, 1, 1,
0.7960683, 0.247053, 1.793376, 0.7450981, 0, 1, 1,
0.7975073, 1.583595, 0.8885467, 0.7529412, 0, 1, 1,
0.8042401, 0.02323398, 2.128092, 0.7568628, 0, 1, 1,
0.8048733, -1.233208, 2.595957, 0.7647059, 0, 1, 1,
0.8174268, -1.124056, 3.345524, 0.7686275, 0, 1, 1,
0.8190718, 0.8973962, 0.7714498, 0.7764706, 0, 1, 1,
0.8200386, 1.5861, -0.4415561, 0.7803922, 0, 1, 1,
0.8242204, -0.6536213, 3.576988, 0.7882353, 0, 1, 1,
0.8315598, 0.807363, 0.3212247, 0.7921569, 0, 1, 1,
0.8323776, -0.01527106, 3.853812, 0.8, 0, 1, 1,
0.8345232, 0.6009093, 0.09538483, 0.8078431, 0, 1, 1,
0.8353859, -0.771922, 5.010902, 0.8117647, 0, 1, 1,
0.8358428, 1.609154, 1.391801, 0.8196079, 0, 1, 1,
0.8382893, 0.0002873324, 1.902618, 0.8235294, 0, 1, 1,
0.8449546, -0.4386459, 2.594854, 0.8313726, 0, 1, 1,
0.8510359, -0.1388623, 1.027615, 0.8352941, 0, 1, 1,
0.8609152, 1.878765, -0.08541781, 0.8431373, 0, 1, 1,
0.8614412, -1.208268, 1.35504, 0.8470588, 0, 1, 1,
0.8662295, -1.706393, 4.195059, 0.854902, 0, 1, 1,
0.8677769, -1.419826, 4.26927, 0.8588235, 0, 1, 1,
0.8804489, -0.5850959, 2.502783, 0.8666667, 0, 1, 1,
0.8824614, -1.229115, 0.935275, 0.8705882, 0, 1, 1,
0.8832197, 0.340942, 1.379142, 0.8784314, 0, 1, 1,
0.8915595, 1.126155, -0.4549384, 0.8823529, 0, 1, 1,
0.8926747, -1.560828, 2.399354, 0.8901961, 0, 1, 1,
0.8941666, -0.05779027, 1.513745, 0.8941177, 0, 1, 1,
0.8941965, -0.8940741, 2.734551, 0.9019608, 0, 1, 1,
0.9039769, -1.55768, 3.358941, 0.9098039, 0, 1, 1,
0.9051835, 0.7133899, -0.3345395, 0.9137255, 0, 1, 1,
0.906521, 0.09260163, -0.02305731, 0.9215686, 0, 1, 1,
0.9121479, -0.1984375, 0.4364495, 0.9254902, 0, 1, 1,
0.9140275, -1.344615, 4.213867, 0.9333333, 0, 1, 1,
0.9157449, 0.3405049, 1.982316, 0.9372549, 0, 1, 1,
0.9164665, 1.058019, 1.758476, 0.945098, 0, 1, 1,
0.9164844, -0.7228184, 2.979187, 0.9490196, 0, 1, 1,
0.9170038, -0.2821464, 1.803291, 0.9568627, 0, 1, 1,
0.9231152, -1.202917, 1.608635, 0.9607843, 0, 1, 1,
0.9254043, 0.589517, -0.6389, 0.9686275, 0, 1, 1,
0.9366221, 0.1534066, 1.456295, 0.972549, 0, 1, 1,
0.9413829, -0.6432979, 2.423728, 0.9803922, 0, 1, 1,
0.9460005, -0.3413369, 3.536392, 0.9843137, 0, 1, 1,
0.9469049, 0.6521304, 0.3406481, 0.9921569, 0, 1, 1,
0.9489014, 0.2701394, 3.109099, 0.9960784, 0, 1, 1,
0.9492975, -0.7679923, 1.443684, 1, 0, 0.9960784, 1,
0.9504769, -0.5733067, 1.137264, 1, 0, 0.9882353, 1,
0.9678808, 1.677325, 1.570627, 1, 0, 0.9843137, 1,
0.9697982, 0.3263302, 3.276345, 1, 0, 0.9764706, 1,
0.9716265, -1.474707, 2.386585, 1, 0, 0.972549, 1,
0.9724342, 0.5390918, 0.767429, 1, 0, 0.9647059, 1,
0.9727383, -2.389033, 1.955257, 1, 0, 0.9607843, 1,
0.973923, 0.1928762, -0.7472197, 1, 0, 0.9529412, 1,
0.9803504, 2.03245, -0.362267, 1, 0, 0.9490196, 1,
0.9811213, -1.020941, 3.588373, 1, 0, 0.9411765, 1,
0.986249, 0.7226239, -1.93294, 1, 0, 0.9372549, 1,
0.9909015, -0.09755589, 3.01248, 1, 0, 0.9294118, 1,
0.9910586, -0.06775048, 1.447614, 1, 0, 0.9254902, 1,
0.9921524, 0.5314462, 1.57449, 1, 0, 0.9176471, 1,
1.002069, 2.438939, 0.8817374, 1, 0, 0.9137255, 1,
1.003339, -1.040147, 3.594362, 1, 0, 0.9058824, 1,
1.004247, 0.2096085, 1.662028, 1, 0, 0.9019608, 1,
1.010423, -1.415314, 1.985569, 1, 0, 0.8941177, 1,
1.014798, 2.377367, -0.1206824, 1, 0, 0.8862745, 1,
1.018532, 1.449047, -0.2805033, 1, 0, 0.8823529, 1,
1.019152, -0.2898543, 0.694348, 1, 0, 0.8745098, 1,
1.024553, 0.9391629, 1.305244, 1, 0, 0.8705882, 1,
1.028944, -0.1734626, 1.254357, 1, 0, 0.8627451, 1,
1.03097, -0.213393, 2.634357, 1, 0, 0.8588235, 1,
1.032228, -0.1024608, 2.351849, 1, 0, 0.8509804, 1,
1.041026, -0.7123252, 2.531729, 1, 0, 0.8470588, 1,
1.056189, 0.2546361, -0.04229762, 1, 0, 0.8392157, 1,
1.073507, -0.2687602, 1.029101, 1, 0, 0.8352941, 1,
1.082171, -0.3574207, 1.691988, 1, 0, 0.827451, 1,
1.085416, -0.006535303, 3.423228, 1, 0, 0.8235294, 1,
1.089155, 1.139181, 2.582765, 1, 0, 0.8156863, 1,
1.09475, 0.2378998, 2.159331, 1, 0, 0.8117647, 1,
1.096589, 0.1092322, 1.362887, 1, 0, 0.8039216, 1,
1.097932, -0.259677, 1.479326, 1, 0, 0.7960784, 1,
1.099688, 0.9793559, 0.3439159, 1, 0, 0.7921569, 1,
1.10097, -0.1740409, 1.256554, 1, 0, 0.7843137, 1,
1.102571, -0.6252779, 3.894331, 1, 0, 0.7803922, 1,
1.104927, 1.204406, 0.9461666, 1, 0, 0.772549, 1,
1.106248, 0.3736467, 2.580111, 1, 0, 0.7686275, 1,
1.115451, 0.505535, 1.623744, 1, 0, 0.7607843, 1,
1.117223, -1.432271, 3.991251, 1, 0, 0.7568628, 1,
1.123662, 0.1275697, 1.266876, 1, 0, 0.7490196, 1,
1.125853, 0.2361602, 3.447143, 1, 0, 0.7450981, 1,
1.130984, 0.6980888, 0.5229767, 1, 0, 0.7372549, 1,
1.137129, 0.6661904, 0.7236475, 1, 0, 0.7333333, 1,
1.138031, -0.7418936, 1.76565, 1, 0, 0.7254902, 1,
1.13865, -0.6225041, 1.668293, 1, 0, 0.7215686, 1,
1.140032, 1.142105, -0.1011912, 1, 0, 0.7137255, 1,
1.144854, -2.327571, 3.253966, 1, 0, 0.7098039, 1,
1.14699, 0.4453154, 2.129186, 1, 0, 0.7019608, 1,
1.150491, -1.730834, 3.634309, 1, 0, 0.6941177, 1,
1.160882, 0.3336341, 2.595478, 1, 0, 0.6901961, 1,
1.168438, 0.8363799, 2.214347, 1, 0, 0.682353, 1,
1.177849, 0.6694937, 0.3152208, 1, 0, 0.6784314, 1,
1.180732, 0.5894859, 2.358719, 1, 0, 0.6705883, 1,
1.185603, -0.008280863, -0.2623402, 1, 0, 0.6666667, 1,
1.199848, 0.1149619, 3.137896, 1, 0, 0.6588235, 1,
1.201169, 0.07089392, 1.940297, 1, 0, 0.654902, 1,
1.206645, 0.01555202, 2.689681, 1, 0, 0.6470588, 1,
1.209502, -2.056253, 2.923029, 1, 0, 0.6431373, 1,
1.211083, -0.1191467, 2.620888, 1, 0, 0.6352941, 1,
1.21218, 0.8807873, -0.8698283, 1, 0, 0.6313726, 1,
1.215422, -1.242948, 2.717494, 1, 0, 0.6235294, 1,
1.235683, 1.128464, -0.6236407, 1, 0, 0.6196079, 1,
1.239385, -0.7625908, 3.04563, 1, 0, 0.6117647, 1,
1.239847, 0.4565251, 1.793257, 1, 0, 0.6078432, 1,
1.253667, -0.005546693, 1.872981, 1, 0, 0.6, 1,
1.261757, -0.1690449, 2.007569, 1, 0, 0.5921569, 1,
1.271003, 1.887078, -0.2036999, 1, 0, 0.5882353, 1,
1.271577, 0.2784022, 1.048456, 1, 0, 0.5803922, 1,
1.273448, 0.5821818, 2.420238, 1, 0, 0.5764706, 1,
1.273705, 0.4274385, 1.426417, 1, 0, 0.5686275, 1,
1.287179, 0.4401005, 1.461599, 1, 0, 0.5647059, 1,
1.293725, -0.9486129, 2.25006, 1, 0, 0.5568628, 1,
1.296765, 1.661797, 1.553904, 1, 0, 0.5529412, 1,
1.304932, 0.6563404, 0.4555492, 1, 0, 0.5450981, 1,
1.309054, -1.179886, 0.1610554, 1, 0, 0.5411765, 1,
1.309284, -1.816241, 1.372614, 1, 0, 0.5333334, 1,
1.324305, 0.5975665, 2.031653, 1, 0, 0.5294118, 1,
1.324583, 0.5359901, 0.5855513, 1, 0, 0.5215687, 1,
1.325021, 0.5882038, 2.579973, 1, 0, 0.5176471, 1,
1.327596, -0.4979179, 2.618152, 1, 0, 0.509804, 1,
1.342198, 1.057456, 1.090649, 1, 0, 0.5058824, 1,
1.342446, -1.315792, 1.213718, 1, 0, 0.4980392, 1,
1.346717, -0.2774025, 2.951779, 1, 0, 0.4901961, 1,
1.353981, 0.4870915, -0.2691747, 1, 0, 0.4862745, 1,
1.36118, -0.5910854, 1.144378, 1, 0, 0.4784314, 1,
1.366712, -1.230821, 3.351864, 1, 0, 0.4745098, 1,
1.373643, 0.2120742, 1.152461, 1, 0, 0.4666667, 1,
1.381377, 0.5710168, 1.444505, 1, 0, 0.4627451, 1,
1.384546, 1.469176, -0.6933277, 1, 0, 0.454902, 1,
1.392826, -0.9174312, 3.187164, 1, 0, 0.4509804, 1,
1.397564, -0.8480768, 1.138131, 1, 0, 0.4431373, 1,
1.398731, -0.2514922, 1.723518, 1, 0, 0.4392157, 1,
1.405302, 0.3662955, 1.438868, 1, 0, 0.4313726, 1,
1.406751, -0.5636238, 0.6318635, 1, 0, 0.427451, 1,
1.425529, -1.673613, 0.4178558, 1, 0, 0.4196078, 1,
1.426222, 1.100116, 0.4564534, 1, 0, 0.4156863, 1,
1.440378, -0.1005255, 2.630799, 1, 0, 0.4078431, 1,
1.447519, -0.9952675, 2.513488, 1, 0, 0.4039216, 1,
1.461753, -0.5484889, 1.400277, 1, 0, 0.3960784, 1,
1.468693, -0.8681656, 3.275173, 1, 0, 0.3882353, 1,
1.479634, -0.2175273, 1.548213, 1, 0, 0.3843137, 1,
1.480399, 1.750704, 0.6695833, 1, 0, 0.3764706, 1,
1.490303, 1.704953, 0.6937345, 1, 0, 0.372549, 1,
1.492601, 0.6227584, 0.6427595, 1, 0, 0.3647059, 1,
1.498925, 1.383935, 2.92754, 1, 0, 0.3607843, 1,
1.499872, -0.3800231, 1.782051, 1, 0, 0.3529412, 1,
1.521969, -0.5331966, 1.991242, 1, 0, 0.3490196, 1,
1.542245, -2.567333, 2.399738, 1, 0, 0.3411765, 1,
1.553866, -1.170689, 0.461726, 1, 0, 0.3372549, 1,
1.60547, 1.086581, 0.4820492, 1, 0, 0.3294118, 1,
1.611624, -0.3654246, 2.228067, 1, 0, 0.3254902, 1,
1.626744, -0.4245176, 2.134748, 1, 0, 0.3176471, 1,
1.635796, 0.5436252, -0.4635421, 1, 0, 0.3137255, 1,
1.641226, -0.7559448, 2.045503, 1, 0, 0.3058824, 1,
1.668752, 1.65963, 1.232789, 1, 0, 0.2980392, 1,
1.680662, 2.004654, -0.41582, 1, 0, 0.2941177, 1,
1.694805, -0.0587678, 1.733796, 1, 0, 0.2862745, 1,
1.704112, 0.4350654, 3.203043, 1, 0, 0.282353, 1,
1.71234, 0.07028621, 2.772998, 1, 0, 0.2745098, 1,
1.718556, 0.1858135, 1.268329, 1, 0, 0.2705882, 1,
1.722608, -0.3847505, 3.989951, 1, 0, 0.2627451, 1,
1.728264, 0.7793261, 0.2893742, 1, 0, 0.2588235, 1,
1.73997, 0.06521626, 3.538102, 1, 0, 0.2509804, 1,
1.754906, 1.876686, 2.332825, 1, 0, 0.2470588, 1,
1.757749, -0.5017581, 2.229786, 1, 0, 0.2392157, 1,
1.758416, -0.5175605, 1.950446, 1, 0, 0.2352941, 1,
1.774043, -0.4345479, 2.628036, 1, 0, 0.227451, 1,
1.792164, -1.467936, 1.195628, 1, 0, 0.2235294, 1,
1.8102, -1.080255, 1.970045, 1, 0, 0.2156863, 1,
1.812131, -0.2792791, 1.39154, 1, 0, 0.2117647, 1,
1.817929, -0.3721419, 1.822336, 1, 0, 0.2039216, 1,
1.832323, 0.2709293, 0.8961931, 1, 0, 0.1960784, 1,
1.846607, -1.118289, 0.2266231, 1, 0, 0.1921569, 1,
1.885567, 1.370718, 1.946003, 1, 0, 0.1843137, 1,
1.889862, 0.4379944, 1.743042, 1, 0, 0.1803922, 1,
1.902124, -1.819597, 1.900246, 1, 0, 0.172549, 1,
1.966403, 0.6545678, 0.2534432, 1, 0, 0.1686275, 1,
1.978348, -1.555398, 3.632069, 1, 0, 0.1607843, 1,
2.00017, 0.644778, 3.110766, 1, 0, 0.1568628, 1,
2.01508, 0.0268258, -0.02048861, 1, 0, 0.1490196, 1,
2.022302, -0.8554924, 2.693874, 1, 0, 0.145098, 1,
2.029309, -0.7112442, 1.13028, 1, 0, 0.1372549, 1,
2.029807, 0.4403977, 0.8357451, 1, 0, 0.1333333, 1,
2.032303, 1.609781, 0.3822452, 1, 0, 0.1254902, 1,
2.074907, 1.785761, 0.1649512, 1, 0, 0.1215686, 1,
2.086498, 1.596716, 0.3455705, 1, 0, 0.1137255, 1,
2.113867, 0.3567877, -0.1472113, 1, 0, 0.1098039, 1,
2.15685, -0.02587442, 0.1581308, 1, 0, 0.1019608, 1,
2.185575, -0.1891344, 1.371384, 1, 0, 0.09411765, 1,
2.20786, 0.9336086, 0.7264959, 1, 0, 0.09019608, 1,
2.220318, 3.060673, 1.591149, 1, 0, 0.08235294, 1,
2.248934, 0.7487936, 1.188259, 1, 0, 0.07843138, 1,
2.257756, -0.1506727, 2.394838, 1, 0, 0.07058824, 1,
2.268524, 0.2710387, 1.066801, 1, 0, 0.06666667, 1,
2.309839, -0.7343361, 0.4072163, 1, 0, 0.05882353, 1,
2.335546, 0.1205537, 1.553357, 1, 0, 0.05490196, 1,
2.40852, 0.04153478, 0.745446, 1, 0, 0.04705882, 1,
2.579215, 0.7098786, -0.06752799, 1, 0, 0.04313726, 1,
2.664391, 0.2013277, 0.9002798, 1, 0, 0.03529412, 1,
2.669752, -1.445514, 1.117941, 1, 0, 0.03137255, 1,
2.874006, 1.175765, 0.9974571, 1, 0, 0.02352941, 1,
3.126551, 0.3665466, 2.082323, 1, 0, 0.01960784, 1,
3.200607, 2.128095, 1.439876, 1, 0, 0.01176471, 1,
3.561091, 0.184882, 1.071234, 1, 0, 0.007843138, 1
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
-0.1173919, -4.230658, -6.619909, 0, -0.5, 0.5, 0.5,
-0.1173919, -4.230658, -6.619909, 1, -0.5, 0.5, 0.5,
-0.1173919, -4.230658, -6.619909, 1, 1.5, 0.5, 0.5,
-0.1173919, -4.230658, -6.619909, 0, 1.5, 0.5, 0.5
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
-5.042881, 0.3182762, -6.619909, 0, -0.5, 0.5, 0.5,
-5.042881, 0.3182762, -6.619909, 1, -0.5, 0.5, 0.5,
-5.042881, 0.3182762, -6.619909, 1, 1.5, 0.5, 0.5,
-5.042881, 0.3182762, -6.619909, 0, 1.5, 0.5, 0.5
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
-5.042881, -4.230658, 0.03834486, 0, -0.5, 0.5, 0.5,
-5.042881, -4.230658, 0.03834486, 1, -0.5, 0.5, 0.5,
-5.042881, -4.230658, 0.03834486, 1, 1.5, 0.5, 0.5,
-5.042881, -4.230658, 0.03834486, 0, 1.5, 0.5, 0.5
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
-2, -3.180904, -5.083389,
2, -3.180904, -5.083389,
-2, -3.180904, -5.083389,
-2, -3.355863, -5.339476,
0, -3.180904, -5.083389,
0, -3.355863, -5.339476,
2, -3.180904, -5.083389,
2, -3.355863, -5.339476
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
-2, -3.705781, -5.851649, 0, -0.5, 0.5, 0.5,
-2, -3.705781, -5.851649, 1, -0.5, 0.5, 0.5,
-2, -3.705781, -5.851649, 1, 1.5, 0.5, 0.5,
-2, -3.705781, -5.851649, 0, 1.5, 0.5, 0.5,
0, -3.705781, -5.851649, 0, -0.5, 0.5, 0.5,
0, -3.705781, -5.851649, 1, -0.5, 0.5, 0.5,
0, -3.705781, -5.851649, 1, 1.5, 0.5, 0.5,
0, -3.705781, -5.851649, 0, 1.5, 0.5, 0.5,
2, -3.705781, -5.851649, 0, -0.5, 0.5, 0.5,
2, -3.705781, -5.851649, 1, -0.5, 0.5, 0.5,
2, -3.705781, -5.851649, 1, 1.5, 0.5, 0.5,
2, -3.705781, -5.851649, 0, 1.5, 0.5, 0.5
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
-3.90623, -3, -5.083389,
-3.90623, 3, -5.083389,
-3.90623, -3, -5.083389,
-4.095672, -3, -5.339476,
-3.90623, -2, -5.083389,
-4.095672, -2, -5.339476,
-3.90623, -1, -5.083389,
-4.095672, -1, -5.339476,
-3.90623, 0, -5.083389,
-4.095672, 0, -5.339476,
-3.90623, 1, -5.083389,
-4.095672, 1, -5.339476,
-3.90623, 2, -5.083389,
-4.095672, 2, -5.339476,
-3.90623, 3, -5.083389,
-4.095672, 3, -5.339476
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
-4.474555, -3, -5.851649, 0, -0.5, 0.5, 0.5,
-4.474555, -3, -5.851649, 1, -0.5, 0.5, 0.5,
-4.474555, -3, -5.851649, 1, 1.5, 0.5, 0.5,
-4.474555, -3, -5.851649, 0, 1.5, 0.5, 0.5,
-4.474555, -2, -5.851649, 0, -0.5, 0.5, 0.5,
-4.474555, -2, -5.851649, 1, -0.5, 0.5, 0.5,
-4.474555, -2, -5.851649, 1, 1.5, 0.5, 0.5,
-4.474555, -2, -5.851649, 0, 1.5, 0.5, 0.5,
-4.474555, -1, -5.851649, 0, -0.5, 0.5, 0.5,
-4.474555, -1, -5.851649, 1, -0.5, 0.5, 0.5,
-4.474555, -1, -5.851649, 1, 1.5, 0.5, 0.5,
-4.474555, -1, -5.851649, 0, 1.5, 0.5, 0.5,
-4.474555, 0, -5.851649, 0, -0.5, 0.5, 0.5,
-4.474555, 0, -5.851649, 1, -0.5, 0.5, 0.5,
-4.474555, 0, -5.851649, 1, 1.5, 0.5, 0.5,
-4.474555, 0, -5.851649, 0, 1.5, 0.5, 0.5,
-4.474555, 1, -5.851649, 0, -0.5, 0.5, 0.5,
-4.474555, 1, -5.851649, 1, -0.5, 0.5, 0.5,
-4.474555, 1, -5.851649, 1, 1.5, 0.5, 0.5,
-4.474555, 1, -5.851649, 0, 1.5, 0.5, 0.5,
-4.474555, 2, -5.851649, 0, -0.5, 0.5, 0.5,
-4.474555, 2, -5.851649, 1, -0.5, 0.5, 0.5,
-4.474555, 2, -5.851649, 1, 1.5, 0.5, 0.5,
-4.474555, 2, -5.851649, 0, 1.5, 0.5, 0.5,
-4.474555, 3, -5.851649, 0, -0.5, 0.5, 0.5,
-4.474555, 3, -5.851649, 1, -0.5, 0.5, 0.5,
-4.474555, 3, -5.851649, 1, 1.5, 0.5, 0.5,
-4.474555, 3, -5.851649, 0, 1.5, 0.5, 0.5
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
-3.90623, -3.180904, -4,
-3.90623, -3.180904, 4,
-3.90623, -3.180904, -4,
-4.095672, -3.355863, -4,
-3.90623, -3.180904, -2,
-4.095672, -3.355863, -2,
-3.90623, -3.180904, 0,
-4.095672, -3.355863, 0,
-3.90623, -3.180904, 2,
-4.095672, -3.355863, 2,
-3.90623, -3.180904, 4,
-4.095672, -3.355863, 4
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
-4.474555, -3.705781, -4, 0, -0.5, 0.5, 0.5,
-4.474555, -3.705781, -4, 1, -0.5, 0.5, 0.5,
-4.474555, -3.705781, -4, 1, 1.5, 0.5, 0.5,
-4.474555, -3.705781, -4, 0, 1.5, 0.5, 0.5,
-4.474555, -3.705781, -2, 0, -0.5, 0.5, 0.5,
-4.474555, -3.705781, -2, 1, -0.5, 0.5, 0.5,
-4.474555, -3.705781, -2, 1, 1.5, 0.5, 0.5,
-4.474555, -3.705781, -2, 0, 1.5, 0.5, 0.5,
-4.474555, -3.705781, 0, 0, -0.5, 0.5, 0.5,
-4.474555, -3.705781, 0, 1, -0.5, 0.5, 0.5,
-4.474555, -3.705781, 0, 1, 1.5, 0.5, 0.5,
-4.474555, -3.705781, 0, 0, 1.5, 0.5, 0.5,
-4.474555, -3.705781, 2, 0, -0.5, 0.5, 0.5,
-4.474555, -3.705781, 2, 1, -0.5, 0.5, 0.5,
-4.474555, -3.705781, 2, 1, 1.5, 0.5, 0.5,
-4.474555, -3.705781, 2, 0, 1.5, 0.5, 0.5,
-4.474555, -3.705781, 4, 0, -0.5, 0.5, 0.5,
-4.474555, -3.705781, 4, 1, -0.5, 0.5, 0.5,
-4.474555, -3.705781, 4, 1, 1.5, 0.5, 0.5,
-4.474555, -3.705781, 4, 0, 1.5, 0.5, 0.5
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
-3.90623, -3.180904, -5.083389,
-3.90623, 3.817456, -5.083389,
-3.90623, -3.180904, 5.160079,
-3.90623, 3.817456, 5.160079,
-3.90623, -3.180904, -5.083389,
-3.90623, -3.180904, 5.160079,
-3.90623, 3.817456, -5.083389,
-3.90623, 3.817456, 5.160079,
-3.90623, -3.180904, -5.083389,
3.671446, -3.180904, -5.083389,
-3.90623, -3.180904, 5.160079,
3.671446, -3.180904, 5.160079,
-3.90623, 3.817456, -5.083389,
3.671446, 3.817456, -5.083389,
-3.90623, 3.817456, 5.160079,
3.671446, 3.817456, 5.160079,
3.671446, -3.180904, -5.083389,
3.671446, 3.817456, -5.083389,
3.671446, -3.180904, 5.160079,
3.671446, 3.817456, 5.160079,
3.671446, -3.180904, -5.083389,
3.671446, -3.180904, 5.160079,
3.671446, 3.817456, -5.083389,
3.671446, 3.817456, 5.160079
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
var radius = 7.762521;
var distance = 34.53633;
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
mvMatrix.translate( 0.1173919, -0.3182762, -0.03834486 );
mvMatrix.scale( 1.107594, 1.199279, 0.8193505 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.53633);
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
streptamine<-read.table("streptamine.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-streptamine$V2
```

```
## Error in eval(expr, envir, enclos): object 'streptamine' not found
```

```r
y<-streptamine$V3
```

```
## Error in eval(expr, envir, enclos): object 'streptamine' not found
```

```r
z<-streptamine$V4
```

```
## Error in eval(expr, envir, enclos): object 'streptamine' not found
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
-3.795875, -0.3297828, -0.6614552, 0, 0, 1, 1, 1,
-3.367242, 0.4834212, -0.4798828, 1, 0, 0, 1, 1,
-2.819165, 0.1656533, -1.111143, 1, 0, 0, 1, 1,
-2.540069, -1.915117, -1.923702, 1, 0, 0, 1, 1,
-2.434539, -0.9180706, -1.938696, 1, 0, 0, 1, 1,
-2.387832, 0.01763813, -2.357315, 1, 0, 0, 1, 1,
-2.237738, -1.676313, -2.759719, 0, 0, 0, 1, 1,
-2.228033, 1.319199, 0.5538224, 0, 0, 0, 1, 1,
-2.183698, -0.6619368, -2.515966, 0, 0, 0, 1, 1,
-2.146835, -0.9371127, -0.8631907, 0, 0, 0, 1, 1,
-2.086249, 1.907619, -0.496635, 0, 0, 0, 1, 1,
-2.062547, 0.7795679, -0.7772058, 0, 0, 0, 1, 1,
-2.047433, 0.7183861, -0.6771318, 0, 0, 0, 1, 1,
-2.037868, -1.261462, -2.043383, 1, 1, 1, 1, 1,
-2.021923, -1.502439, -4.284889, 1, 1, 1, 1, 1,
-2.019011, -0.487825, -2.53883, 1, 1, 1, 1, 1,
-2.012871, -0.4980218, -1.813235, 1, 1, 1, 1, 1,
-2.011239, 3.715539, 1.137347, 1, 1, 1, 1, 1,
-2.001997, -0.2102634, -1.017533, 1, 1, 1, 1, 1,
-1.985514, -0.04923235, -1.81537, 1, 1, 1, 1, 1,
-1.977446, 0.274929, -0.7553644, 1, 1, 1, 1, 1,
-1.963296, 1.370338, -1.235781, 1, 1, 1, 1, 1,
-1.947082, 1.359963, 0.116913, 1, 1, 1, 1, 1,
-1.943739, -0.1946413, -1.735002, 1, 1, 1, 1, 1,
-1.936323, -1.47709, -1.80998, 1, 1, 1, 1, 1,
-1.914792, -0.08998259, -1.856914, 1, 1, 1, 1, 1,
-1.885348, 0.1490851, -1.30923, 1, 1, 1, 1, 1,
-1.882912, -0.4108268, 0.04004478, 1, 1, 1, 1, 1,
-1.871112, -0.05001106, -2.463872, 0, 0, 1, 1, 1,
-1.869715, -1.291982, -4.151461, 1, 0, 0, 1, 1,
-1.81147, -0.4219776, -1.415456, 1, 0, 0, 1, 1,
-1.80709, 0.6650314, 0.9994502, 1, 0, 0, 1, 1,
-1.780705, 0.6710894, -0.5755781, 1, 0, 0, 1, 1,
-1.774723, -0.4121327, -1.632993, 1, 0, 0, 1, 1,
-1.734822, -0.1572042, -1.139833, 0, 0, 0, 1, 1,
-1.728261, -1.153433, -1.408694, 0, 0, 0, 1, 1,
-1.720101, 0.6158969, -1.087436, 0, 0, 0, 1, 1,
-1.719941, 1.931378, -0.2794009, 0, 0, 0, 1, 1,
-1.71552, -0.3088246, -1.34611, 0, 0, 0, 1, 1,
-1.709289, -0.7336097, -1.908964, 0, 0, 0, 1, 1,
-1.707111, -0.2401769, -2.248553, 0, 0, 0, 1, 1,
-1.695847, 1.482562, -0.8767415, 1, 1, 1, 1, 1,
-1.678331, -1.521282, -4.470869, 1, 1, 1, 1, 1,
-1.670426, 0.2066009, -2.382802, 1, 1, 1, 1, 1,
-1.669705, -1.84098, -2.380467, 1, 1, 1, 1, 1,
-1.664004, -0.1863733, -0.2894491, 1, 1, 1, 1, 1,
-1.638641, -0.4323323, -1.06222, 1, 1, 1, 1, 1,
-1.633151, -0.01006584, -3.355709, 1, 1, 1, 1, 1,
-1.627033, -0.6172096, -3.088281, 1, 1, 1, 1, 1,
-1.625605, 1.444683, -1.038194, 1, 1, 1, 1, 1,
-1.593837, -0.3672342, -2.056122, 1, 1, 1, 1, 1,
-1.581733, 0.4086992, -0.3304117, 1, 1, 1, 1, 1,
-1.571686, -1.444989, -2.444228, 1, 1, 1, 1, 1,
-1.564962, 0.06341923, -1.841305, 1, 1, 1, 1, 1,
-1.558718, -0.1046438, -1.347711, 1, 1, 1, 1, 1,
-1.55278, 0.8647019, -0.7044417, 1, 1, 1, 1, 1,
-1.547222, 0.9036697, -0.6364011, 0, 0, 1, 1, 1,
-1.531601, -1.635152, -3.014501, 1, 0, 0, 1, 1,
-1.520997, -0.6458949, -0.8484634, 1, 0, 0, 1, 1,
-1.514843, 0.07258848, -2.354564, 1, 0, 0, 1, 1,
-1.501073, 0.9833887, -0.8838899, 1, 0, 0, 1, 1,
-1.493791, 1.160332, -2.439014, 1, 0, 0, 1, 1,
-1.480152, -1.116304, -3.131088, 0, 0, 0, 1, 1,
-1.476818, 0.7700596, -0.7828774, 0, 0, 0, 1, 1,
-1.469447, 1.68643, -1.46558, 0, 0, 0, 1, 1,
-1.461425, 0.3346814, 0.04274379, 0, 0, 0, 1, 1,
-1.442988, 1.36457, -1.910652, 0, 0, 0, 1, 1,
-1.427871, -1.08095, -1.918903, 0, 0, 0, 1, 1,
-1.416359, 1.892253, 1.561687, 0, 0, 0, 1, 1,
-1.415793, -0.6400704, -3.48676, 1, 1, 1, 1, 1,
-1.40757, 0.6382565, -0.4683083, 1, 1, 1, 1, 1,
-1.389815, -1.185988, -1.616552, 1, 1, 1, 1, 1,
-1.367313, 0.4848647, -0.770413, 1, 1, 1, 1, 1,
-1.363176, -0.6356027, -2.73214, 1, 1, 1, 1, 1,
-1.362293, 3.334871, 0.9195338, 1, 1, 1, 1, 1,
-1.354828, 0.3264548, -0.9287208, 1, 1, 1, 1, 1,
-1.34037, -1.110921, -2.549872, 1, 1, 1, 1, 1,
-1.331828, 0.5531606, -2.16401, 1, 1, 1, 1, 1,
-1.330166, -0.9871171, -2.693979, 1, 1, 1, 1, 1,
-1.330131, 1.222184, -2.241851, 1, 1, 1, 1, 1,
-1.329482, -1.788094, -1.556133, 1, 1, 1, 1, 1,
-1.328284, -1.841014, -2.763685, 1, 1, 1, 1, 1,
-1.328257, 1.107546, -0.4893968, 1, 1, 1, 1, 1,
-1.321898, 0.07300831, -1.630299, 1, 1, 1, 1, 1,
-1.314885, 1.554118, -1.309574, 0, 0, 1, 1, 1,
-1.310324, -0.4003144, -2.03637, 1, 0, 0, 1, 1,
-1.309816, 2.305598, -0.5311745, 1, 0, 0, 1, 1,
-1.304633, -1.183888, -1.907556, 1, 0, 0, 1, 1,
-1.303344, 0.06540908, -1.062168, 1, 0, 0, 1, 1,
-1.291348, 1.246227, -0.3904292, 1, 0, 0, 1, 1,
-1.289845, -1.149217, -2.958503, 0, 0, 0, 1, 1,
-1.281451, -1.103464, -1.949965, 0, 0, 0, 1, 1,
-1.274826, -0.7363663, -3.327638, 0, 0, 0, 1, 1,
-1.27407, -0.1936395, -1.295627, 0, 0, 0, 1, 1,
-1.270463, 0.3815131, -0.4899154, 0, 0, 0, 1, 1,
-1.265328, 1.075307, -0.5945141, 0, 0, 0, 1, 1,
-1.257154, -0.7176602, -0.8752625, 0, 0, 0, 1, 1,
-1.252555, -1.289502, -2.408529, 1, 1, 1, 1, 1,
-1.252243, -0.08938137, -1.116454, 1, 1, 1, 1, 1,
-1.245997, 0.7872612, -1.516609, 1, 1, 1, 1, 1,
-1.245507, -0.6360717, -2.07113, 1, 1, 1, 1, 1,
-1.241667, 0.9615238, -1.229079, 1, 1, 1, 1, 1,
-1.239894, 0.55199, -0.9322214, 1, 1, 1, 1, 1,
-1.239593, 0.9344617, -1.29377, 1, 1, 1, 1, 1,
-1.239579, 0.5074174, -0.7097593, 1, 1, 1, 1, 1,
-1.235253, 0.4273935, -1.56778, 1, 1, 1, 1, 1,
-1.234329, 0.5329049, -1.085982, 1, 1, 1, 1, 1,
-1.233211, -0.2440768, -2.201145, 1, 1, 1, 1, 1,
-1.228159, 0.32718, 0.4788245, 1, 1, 1, 1, 1,
-1.228094, -0.7094722, -2.237325, 1, 1, 1, 1, 1,
-1.225016, -0.9265148, -1.663306, 1, 1, 1, 1, 1,
-1.222235, -0.8641677, -1.364531, 1, 1, 1, 1, 1,
-1.216544, 0.7596317, -0.495146, 0, 0, 1, 1, 1,
-1.215172, -0.8863243, -0.9045464, 1, 0, 0, 1, 1,
-1.212168, -0.2744254, -1.941802, 1, 0, 0, 1, 1,
-1.204386, 0.3478963, -1.965335, 1, 0, 0, 1, 1,
-1.202188, -2.569344, -1.851359, 1, 0, 0, 1, 1,
-1.199694, -1.946351, -1.483415, 1, 0, 0, 1, 1,
-1.175939, -1.164175, -1.44089, 0, 0, 0, 1, 1,
-1.168462, -1.144149, -2.320894, 0, 0, 0, 1, 1,
-1.167031, 0.5077448, -0.493355, 0, 0, 0, 1, 1,
-1.164599, -0.786102, -3.499082, 0, 0, 0, 1, 1,
-1.163836, -0.5343257, -3.7844, 0, 0, 0, 1, 1,
-1.16056, 0.01024796, 1.28456, 0, 0, 0, 1, 1,
-1.159278, -1.500883, -3.044494, 0, 0, 0, 1, 1,
-1.158012, -0.1817628, -2.829712, 1, 1, 1, 1, 1,
-1.153079, -1.199584, 0.3601528, 1, 1, 1, 1, 1,
-1.150007, 0.6024787, 0.2822387, 1, 1, 1, 1, 1,
-1.142397, -0.5577055, -3.271775, 1, 1, 1, 1, 1,
-1.138778, -0.3557791, -1.585274, 1, 1, 1, 1, 1,
-1.136518, 1.031108, -1.839506, 1, 1, 1, 1, 1,
-1.135631, 0.08475214, -1.656078, 1, 1, 1, 1, 1,
-1.132256, -1.502907, -1.752381, 1, 1, 1, 1, 1,
-1.123555, 0.1535414, -0.2718202, 1, 1, 1, 1, 1,
-1.118219, 0.5734679, -1.511372, 1, 1, 1, 1, 1,
-1.117031, -2.531771, -1.816361, 1, 1, 1, 1, 1,
-1.103588, -0.416728, 0.2475377, 1, 1, 1, 1, 1,
-1.092628, 0.24266, -1.238114, 1, 1, 1, 1, 1,
-1.092579, 1.373939, -1.805081, 1, 1, 1, 1, 1,
-1.092123, 0.3166749, -1.090517, 1, 1, 1, 1, 1,
-1.091535, 0.07580825, -2.913189, 0, 0, 1, 1, 1,
-1.090464, 0.1388002, -1.751946, 1, 0, 0, 1, 1,
-1.084042, -0.3764366, -2.722165, 1, 0, 0, 1, 1,
-1.083729, -0.6426047, -1.311283, 1, 0, 0, 1, 1,
-1.081178, 1.519581, -0.8761388, 1, 0, 0, 1, 1,
-1.078907, 0.3011631, -1.541544, 1, 0, 0, 1, 1,
-1.078352, -0.709092, -1.207241, 0, 0, 0, 1, 1,
-1.073297, -1.593526, -3.60408, 0, 0, 0, 1, 1,
-1.072128, 0.5191921, -1.4476, 0, 0, 0, 1, 1,
-1.062589, 0.3046792, -1.872442, 0, 0, 0, 1, 1,
-1.062007, -1.954774, -2.71578, 0, 0, 0, 1, 1,
-1.054815, -0.9877626, -1.737735, 0, 0, 0, 1, 1,
-1.052116, 1.197837, -0.9202029, 0, 0, 0, 1, 1,
-1.051913, -0.2744733, -2.5051, 1, 1, 1, 1, 1,
-1.04957, -0.6666259, -0.9549993, 1, 1, 1, 1, 1,
-1.047908, 0.08324482, -0.9630733, 1, 1, 1, 1, 1,
-1.046248, 0.3094261, 0.897788, 1, 1, 1, 1, 1,
-1.044074, 0.1135165, -1.444348, 1, 1, 1, 1, 1,
-1.041216, 0.2822871, -1.755492, 1, 1, 1, 1, 1,
-1.039893, 0.5936165, -1.509812, 1, 1, 1, 1, 1,
-1.03813, -1.015901, -1.962741, 1, 1, 1, 1, 1,
-1.029532, 0.2375235, -1.487057, 1, 1, 1, 1, 1,
-1.02781, 0.6462339, -1.254039, 1, 1, 1, 1, 1,
-1.025198, 0.2103175, -0.9572502, 1, 1, 1, 1, 1,
-1.020391, -0.1356833, -2.952537, 1, 1, 1, 1, 1,
-1.018145, 0.08010589, -1.496247, 1, 1, 1, 1, 1,
-1.015205, 0.2701131, -1.238421, 1, 1, 1, 1, 1,
-1.006798, 0.4969255, -3.68002, 1, 1, 1, 1, 1,
-1.004648, 1.616814, -2.569403, 0, 0, 1, 1, 1,
-0.9973646, -0.9106116, -2.759397, 1, 0, 0, 1, 1,
-0.9941273, -1.292976, -1.140886, 1, 0, 0, 1, 1,
-0.9932977, -0.6728802, -2.122801, 1, 0, 0, 1, 1,
-0.9932261, -1.004991, -1.579827, 1, 0, 0, 1, 1,
-0.9879152, -0.7596909, -1.842196, 1, 0, 0, 1, 1,
-0.9852846, -1.29654, -3.194801, 0, 0, 0, 1, 1,
-0.9811936, 1.092491, -1.788318, 0, 0, 0, 1, 1,
-0.9804214, 0.5883343, -0.08386359, 0, 0, 0, 1, 1,
-0.9751891, -1.841062, -2.55347, 0, 0, 0, 1, 1,
-0.972817, 0.5519616, -1.992285, 0, 0, 0, 1, 1,
-0.9675996, -0.1687412, -0.2426807, 0, 0, 0, 1, 1,
-0.9618713, -1.459598, -1.378814, 0, 0, 0, 1, 1,
-0.9573383, 1.830142, 0.6562737, 1, 1, 1, 1, 1,
-0.9540346, -1.132381, -1.310765, 1, 1, 1, 1, 1,
-0.9532567, 0.1061718, -2.709041, 1, 1, 1, 1, 1,
-0.9519237, -0.4725721, -3.695471, 1, 1, 1, 1, 1,
-0.9487025, -1.946526, -1.218119, 1, 1, 1, 1, 1,
-0.9440829, 1.773533, 0.1581226, 1, 1, 1, 1, 1,
-0.9373497, 0.9125229, -0.5754391, 1, 1, 1, 1, 1,
-0.9364074, 0.7052605, -0.8325346, 1, 1, 1, 1, 1,
-0.9356688, 0.6100343, -0.3496148, 1, 1, 1, 1, 1,
-0.9224652, 0.4387886, -0.6317326, 1, 1, 1, 1, 1,
-0.9222288, -1.895211, -2.719941, 1, 1, 1, 1, 1,
-0.9175013, 0.2189478, -0.6072828, 1, 1, 1, 1, 1,
-0.9152459, -0.44982, -3.405702, 1, 1, 1, 1, 1,
-0.9136587, 0.204216, 0.1643573, 1, 1, 1, 1, 1,
-0.9135374, -2.2763, -3.803557, 1, 1, 1, 1, 1,
-0.9108283, -0.960085, -3.009116, 0, 0, 1, 1, 1,
-0.9092267, -0.5260305, -2.120652, 1, 0, 0, 1, 1,
-0.9031774, 0.541564, -0.5498481, 1, 0, 0, 1, 1,
-0.8961187, -0.06791905, -2.354834, 1, 0, 0, 1, 1,
-0.8939431, -1.016214, -4.711031, 1, 0, 0, 1, 1,
-0.8928862, -0.5261906, -1.861316, 1, 0, 0, 1, 1,
-0.8927386, 1.405403, -1.633758, 0, 0, 0, 1, 1,
-0.8883896, 1.812916, 0.9383515, 0, 0, 0, 1, 1,
-0.886793, 1.197814, 0.4654639, 0, 0, 0, 1, 1,
-0.8807773, 1.418622, -2.064831, 0, 0, 0, 1, 1,
-0.8727756, -1.428575, -2.210666, 0, 0, 0, 1, 1,
-0.8688053, 1.405207, -0.1970527, 0, 0, 0, 1, 1,
-0.8590423, -1.324073, -2.852112, 0, 0, 0, 1, 1,
-0.8537413, 0.5910252, 0.5774268, 1, 1, 1, 1, 1,
-0.8453823, -0.7653025, -1.291953, 1, 1, 1, 1, 1,
-0.8365961, 0.9029477, -2.796564, 1, 1, 1, 1, 1,
-0.8349153, 1.336822, -0.4722565, 1, 1, 1, 1, 1,
-0.8344886, -1.011252, -3.307232, 1, 1, 1, 1, 1,
-0.8341006, -1.31479, -2.638745, 1, 1, 1, 1, 1,
-0.8322159, 1.100723, -0.8966913, 1, 1, 1, 1, 1,
-0.8313997, 0.1350268, -1.224349, 1, 1, 1, 1, 1,
-0.8293351, 1.239312, -1.371272, 1, 1, 1, 1, 1,
-0.8261059, -1.679201, -4.057679, 1, 1, 1, 1, 1,
-0.8238481, -0.519267, -3.210559, 1, 1, 1, 1, 1,
-0.8159561, 0.1573529, -2.407296, 1, 1, 1, 1, 1,
-0.8138625, -1.173362, -1.509825, 1, 1, 1, 1, 1,
-0.8096794, -1.155411, -1.607442, 1, 1, 1, 1, 1,
-0.8051209, 0.5348741, 0.930427, 1, 1, 1, 1, 1,
-0.7904833, -0.6918011, -1.827159, 0, 0, 1, 1, 1,
-0.790089, 0.00345049, -0.7375302, 1, 0, 0, 1, 1,
-0.7757171, -1.776102, -1.382762, 1, 0, 0, 1, 1,
-0.7714282, 0.5593508, -1.604686, 1, 0, 0, 1, 1,
-0.7711, -1.368379, -3.078291, 1, 0, 0, 1, 1,
-0.767253, 1.552433, -0.9987627, 1, 0, 0, 1, 1,
-0.7650398, -0.1537369, -2.265438, 0, 0, 0, 1, 1,
-0.7619677, 0.2147718, -1.218342, 0, 0, 0, 1, 1,
-0.7609645, -0.9824632, -3.19722, 0, 0, 0, 1, 1,
-0.7571626, 0.8655244, -2.617043, 0, 0, 0, 1, 1,
-0.7539051, 0.5287894, 0.2392781, 0, 0, 0, 1, 1,
-0.7537157, -1.251529, -2.77634, 0, 0, 0, 1, 1,
-0.7536587, -0.9675169, -4.683144, 0, 0, 0, 1, 1,
-0.7501124, -0.919099, -1.250254, 1, 1, 1, 1, 1,
-0.7491575, 0.09007631, -1.422146, 1, 1, 1, 1, 1,
-0.7485126, -1.424758, -3.484774, 1, 1, 1, 1, 1,
-0.7444676, 0.2022307, -1.273225, 1, 1, 1, 1, 1,
-0.7405688, 0.267145, -0.7854163, 1, 1, 1, 1, 1,
-0.7395643, 0.02176954, -2.641156, 1, 1, 1, 1, 1,
-0.7392189, 0.9235419, 1.657479, 1, 1, 1, 1, 1,
-0.7294551, -1.557202, -4.670318, 1, 1, 1, 1, 1,
-0.727989, -1.264846, -1.666248, 1, 1, 1, 1, 1,
-0.722652, 1.240203, -0.006117935, 1, 1, 1, 1, 1,
-0.7199336, -0.01749376, -1.850914, 1, 1, 1, 1, 1,
-0.7183918, 0.8072002, -3.715183, 1, 1, 1, 1, 1,
-0.7182018, -0.7749614, -3.828333, 1, 1, 1, 1, 1,
-0.7111387, 0.5848515, -2.385223, 1, 1, 1, 1, 1,
-0.7058625, 1.648468, 0.9727892, 1, 1, 1, 1, 1,
-0.6987383, -1.055086, -2.535936, 0, 0, 1, 1, 1,
-0.6980736, -0.7936116, -2.624548, 1, 0, 0, 1, 1,
-0.6858261, -0.8852773, 0.06231965, 1, 0, 0, 1, 1,
-0.6840047, 0.4670169, -1.199886, 1, 0, 0, 1, 1,
-0.6815069, 0.6532616, -2.411261, 1, 0, 0, 1, 1,
-0.6782472, -1.406781, -4.209103, 1, 0, 0, 1, 1,
-0.6717392, -0.6991308, -1.404853, 0, 0, 0, 1, 1,
-0.6603377, 0.3147736, -1.328573, 0, 0, 0, 1, 1,
-0.659474, 1.094329, -1.576726, 0, 0, 0, 1, 1,
-0.6584796, 1.700168, -0.791988, 0, 0, 0, 1, 1,
-0.6562599, 0.7280012, -1.655453, 0, 0, 0, 1, 1,
-0.6541185, 1.058146, -1.822503, 0, 0, 0, 1, 1,
-0.6478828, -1.101552, -2.403298, 0, 0, 0, 1, 1,
-0.6458086, 0.8144585, 0.1882941, 1, 1, 1, 1, 1,
-0.6442662, 1.538426, 0.1541835, 1, 1, 1, 1, 1,
-0.6435215, -1.288925, -2.717303, 1, 1, 1, 1, 1,
-0.6415023, 0.8797444, -0.3533636, 1, 1, 1, 1, 1,
-0.6378554, -0.3706756, -1.449799, 1, 1, 1, 1, 1,
-0.6374174, 0.3812397, -0.4379193, 1, 1, 1, 1, 1,
-0.6351971, 1.480565, -1.334394, 1, 1, 1, 1, 1,
-0.6331538, 0.1375356, 0.7626919, 1, 1, 1, 1, 1,
-0.626003, 1.953301, -0.1204396, 1, 1, 1, 1, 1,
-0.6258531, -0.4774302, -2.298325, 1, 1, 1, 1, 1,
-0.6182274, -0.6644588, -3.271473, 1, 1, 1, 1, 1,
-0.6151198, 1.536432, 0.57212, 1, 1, 1, 1, 1,
-0.6071924, 1.363476, -0.1856408, 1, 1, 1, 1, 1,
-0.6028419, 0.02529906, -3.687891, 1, 1, 1, 1, 1,
-0.6002011, -0.5788537, -2.164341, 1, 1, 1, 1, 1,
-0.5993019, -1.163893, -3.046253, 0, 0, 1, 1, 1,
-0.59841, 0.09464602, -2.51773, 1, 0, 0, 1, 1,
-0.5968367, -0.2236986, -2.615083, 1, 0, 0, 1, 1,
-0.5949849, -0.541854, -1.89408, 1, 0, 0, 1, 1,
-0.5900514, 0.7485216, 0.2128611, 1, 0, 0, 1, 1,
-0.5880615, -1.347758, -1.41971, 1, 0, 0, 1, 1,
-0.587803, -1.542075, -1.562205, 0, 0, 0, 1, 1,
-0.5809487, -0.9431521, -1.943176, 0, 0, 0, 1, 1,
-0.5783033, 0.2627612, -2.336517, 0, 0, 0, 1, 1,
-0.5779202, -1.60701, -2.154184, 0, 0, 0, 1, 1,
-0.5777924, 0.6441359, -2.039001, 0, 0, 0, 1, 1,
-0.5737112, -0.462451, -1.98122, 0, 0, 0, 1, 1,
-0.5697258, 0.2180068, -0.4531274, 0, 0, 0, 1, 1,
-0.5656152, -1.222124, -2.126205, 1, 1, 1, 1, 1,
-0.5623856, -0.4191016, -2.320352, 1, 1, 1, 1, 1,
-0.5618954, -0.4477416, -1.023902, 1, 1, 1, 1, 1,
-0.560431, 2.695074, -2.146773, 1, 1, 1, 1, 1,
-0.5558813, 0.6550667, -1.344034, 1, 1, 1, 1, 1,
-0.5555516, -0.3313072, -1.798291, 1, 1, 1, 1, 1,
-0.5469461, -1.37076, -3.447549, 1, 1, 1, 1, 1,
-0.5432678, 0.5896907, -1.45137, 1, 1, 1, 1, 1,
-0.5428202, 0.5798627, -0.8812708, 1, 1, 1, 1, 1,
-0.5403081, -0.623886, -2.144572, 1, 1, 1, 1, 1,
-0.5395226, 1.478163, -2.619172, 1, 1, 1, 1, 1,
-0.5374947, -0.391053, -1.76153, 1, 1, 1, 1, 1,
-0.535626, 0.06673668, -1.47642, 1, 1, 1, 1, 1,
-0.5355108, -0.1619308, -4.108025, 1, 1, 1, 1, 1,
-0.5305953, 2.142384, 0.6845967, 1, 1, 1, 1, 1,
-0.5261348, -0.4080728, -2.942329, 0, 0, 1, 1, 1,
-0.5247608, 0.7170649, -0.7966948, 1, 0, 0, 1, 1,
-0.5224899, -0.1972104, -0.9624752, 1, 0, 0, 1, 1,
-0.5199901, 0.8625256, -0.9796873, 1, 0, 0, 1, 1,
-0.5199895, -0.3306336, -1.386519, 1, 0, 0, 1, 1,
-0.519154, -0.535318, -3.142909, 1, 0, 0, 1, 1,
-0.518992, 0.1790435, -1.235381, 0, 0, 0, 1, 1,
-0.5157495, -1.161588, -4.278674, 0, 0, 0, 1, 1,
-0.5067272, -0.4698193, -1.870908, 0, 0, 0, 1, 1,
-0.5051829, -0.7067853, -2.080876, 0, 0, 0, 1, 1,
-0.5034505, 1.660315, -0.4670454, 0, 0, 0, 1, 1,
-0.4966244, -0.194519, -1.804945, 0, 0, 0, 1, 1,
-0.4960632, -0.696949, -1.42495, 0, 0, 0, 1, 1,
-0.4918635, 1.205994, -0.5428351, 1, 1, 1, 1, 1,
-0.4911925, -0.2695737, -2.446986, 1, 1, 1, 1, 1,
-0.4878809, 0.9421125, -0.7273701, 1, 1, 1, 1, 1,
-0.4874269, 1.212572, 0.4447777, 1, 1, 1, 1, 1,
-0.4872565, 2.061119, -1.112314, 1, 1, 1, 1, 1,
-0.4852062, 1.178505, 0.6551605, 1, 1, 1, 1, 1,
-0.4851422, 1.707805, -0.3001228, 1, 1, 1, 1, 1,
-0.4848194, -0.6861748, -1.886562, 1, 1, 1, 1, 1,
-0.4834959, -2.021965, -1.220668, 1, 1, 1, 1, 1,
-0.481081, 1.393887, -0.4840811, 1, 1, 1, 1, 1,
-0.4795538, -0.933063, -1.371895, 1, 1, 1, 1, 1,
-0.4746744, 1.79494, -0.5926386, 1, 1, 1, 1, 1,
-0.46599, 0.1192362, -2.703037, 1, 1, 1, 1, 1,
-0.4657409, -0.5597162, -2.993182, 1, 1, 1, 1, 1,
-0.4644316, 0.4298597, -2.280151, 1, 1, 1, 1, 1,
-0.4539397, 0.4321731, -1.323567, 0, 0, 1, 1, 1,
-0.4463867, -1.342417, -3.563699, 1, 0, 0, 1, 1,
-0.4407048, 0.04549553, -2.529747, 1, 0, 0, 1, 1,
-0.4382281, 0.03726129, -1.098681, 1, 0, 0, 1, 1,
-0.4360904, -0.3490485, -2.276212, 1, 0, 0, 1, 1,
-0.4326446, -0.2022027, -1.642674, 1, 0, 0, 1, 1,
-0.4317714, -0.5550772, -0.9714795, 0, 0, 0, 1, 1,
-0.4280858, -0.1468641, -0.9317735, 0, 0, 0, 1, 1,
-0.4260992, 1.117679, -0.8800943, 0, 0, 0, 1, 1,
-0.425274, -2.539961, -3.591569, 0, 0, 0, 1, 1,
-0.4206645, -0.5786628, -2.045823, 0, 0, 0, 1, 1,
-0.4179112, -1.26364, -2.852063, 0, 0, 0, 1, 1,
-0.4148054, -0.9301227, -3.643306, 0, 0, 0, 1, 1,
-0.4138807, 0.9209218, 0.06865484, 1, 1, 1, 1, 1,
-0.4099142, -0.7885568, -3.889955, 1, 1, 1, 1, 1,
-0.4060964, -0.1891635, -0.9494802, 1, 1, 1, 1, 1,
-0.4045936, 0.03377013, 0.7352476, 1, 1, 1, 1, 1,
-0.4000354, -1.901971, -3.044983, 1, 1, 1, 1, 1,
-0.3958687, 0.3834317, -3.693399, 1, 1, 1, 1, 1,
-0.3889322, 1.516476, 1.279311, 1, 1, 1, 1, 1,
-0.3880208, -0.8772014, -3.264313, 1, 1, 1, 1, 1,
-0.3848784, 0.2182065, -2.194251, 1, 1, 1, 1, 1,
-0.384016, -0.5418649, -0.03029733, 1, 1, 1, 1, 1,
-0.3835824, -1.095787, -2.878791, 1, 1, 1, 1, 1,
-0.3826825, 1.428815, 0.5310057, 1, 1, 1, 1, 1,
-0.3824342, -0.3156579, -1.941187, 1, 1, 1, 1, 1,
-0.3808956, 0.2952232, -2.525267, 1, 1, 1, 1, 1,
-0.3789564, 0.03262394, -2.183339, 1, 1, 1, 1, 1,
-0.3780833, 1.043037, -0.6347753, 0, 0, 1, 1, 1,
-0.3774046, -1.850357, -2.078062, 1, 0, 0, 1, 1,
-0.3766184, -1.999241, -3.134896, 1, 0, 0, 1, 1,
-0.3744387, 0.0342245, -2.832721, 1, 0, 0, 1, 1,
-0.3723199, 0.04324268, -0.6047574, 1, 0, 0, 1, 1,
-0.3704233, 0.1500146, -1.791535, 1, 0, 0, 1, 1,
-0.3684313, 2.362828, 0.3939065, 0, 0, 0, 1, 1,
-0.3681303, 0.3450746, 0.2914765, 0, 0, 0, 1, 1,
-0.3665508, -1.318021, -0.7387106, 0, 0, 0, 1, 1,
-0.3647269, 0.9746132, -0.5770363, 0, 0, 0, 1, 1,
-0.3644345, -1.236396, -1.83174, 0, 0, 0, 1, 1,
-0.3627394, 0.4033251, 2.074306, 0, 0, 0, 1, 1,
-0.3626878, -0.204972, -2.677291, 0, 0, 0, 1, 1,
-0.3594073, -0.5395138, -2.324922, 1, 1, 1, 1, 1,
-0.3579646, 0.6834614, -1.551176, 1, 1, 1, 1, 1,
-0.350486, 0.7144565, 0.5441454, 1, 1, 1, 1, 1,
-0.3477515, 0.3260121, -0.7369047, 1, 1, 1, 1, 1,
-0.3469715, 0.8362941, -2.623709, 1, 1, 1, 1, 1,
-0.3459794, 2.438022, -0.9046811, 1, 1, 1, 1, 1,
-0.3429873, -1.68345, -2.246467, 1, 1, 1, 1, 1,
-0.3393487, -0.9884892, -1.893613, 1, 1, 1, 1, 1,
-0.3357218, 1.257603, -1.519235, 1, 1, 1, 1, 1,
-0.3321551, -0.6551215, -4.934212, 1, 1, 1, 1, 1,
-0.3321334, 1.110352, 0.4653123, 1, 1, 1, 1, 1,
-0.3309307, 1.52772, 0.751358, 1, 1, 1, 1, 1,
-0.323898, 0.8359904, -0.0798445, 1, 1, 1, 1, 1,
-0.3229434, 1.591124, -1.375812, 1, 1, 1, 1, 1,
-0.3211616, 0.9926331, -0.1105535, 1, 1, 1, 1, 1,
-0.3175554, 1.158253, 1.212742, 0, 0, 1, 1, 1,
-0.3172835, -0.6368422, -2.888709, 1, 0, 0, 1, 1,
-0.3120697, -0.7053211, -2.468764, 1, 0, 0, 1, 1,
-0.3111256, -0.1586784, -2.429476, 1, 0, 0, 1, 1,
-0.3089716, 0.565848, -0.3391222, 1, 0, 0, 1, 1,
-0.3051236, 0.8337797, 0.9352534, 1, 0, 0, 1, 1,
-0.3020447, 0.5889536, -1.530382, 0, 0, 0, 1, 1,
-0.3019134, 0.5507147, -0.374121, 0, 0, 0, 1, 1,
-0.2982052, 0.1356076, -1.41915, 0, 0, 0, 1, 1,
-0.2975987, 0.4811983, -0.4484909, 0, 0, 0, 1, 1,
-0.2972113, 1.214904, -0.4607513, 0, 0, 0, 1, 1,
-0.2934208, 0.436564, 0.8183081, 0, 0, 0, 1, 1,
-0.2914739, -0.407416, -3.521277, 0, 0, 0, 1, 1,
-0.2892534, -0.8213717, -1.705492, 1, 1, 1, 1, 1,
-0.2863939, -0.5214334, -1.71052, 1, 1, 1, 1, 1,
-0.2849554, 0.4247695, 0.005379276, 1, 1, 1, 1, 1,
-0.2846732, -0.4497128, -2.246128, 1, 1, 1, 1, 1,
-0.284143, 1.487722, 1.05149, 1, 1, 1, 1, 1,
-0.2764825, 0.1978358, -0.3829211, 1, 1, 1, 1, 1,
-0.2763424, -0.8201272, -3.764326, 1, 1, 1, 1, 1,
-0.275991, -0.7431999, -2.50671, 1, 1, 1, 1, 1,
-0.2746046, 0.4695773, 0.9157893, 1, 1, 1, 1, 1,
-0.2706766, 1.391318, 1.341914, 1, 1, 1, 1, 1,
-0.268883, 0.178751, 1.06297, 1, 1, 1, 1, 1,
-0.259147, 1.03053, -0.52356, 1, 1, 1, 1, 1,
-0.258091, -2.476675, -3.094711, 1, 1, 1, 1, 1,
-0.2529931, 0.5154724, -0.995988, 1, 1, 1, 1, 1,
-0.2523018, -1.14497, -4.266857, 1, 1, 1, 1, 1,
-0.248045, -0.1127028, -1.727904, 0, 0, 1, 1, 1,
-0.2462073, 0.1434708, -0.5650498, 1, 0, 0, 1, 1,
-0.2429959, -0.517525, -3.310099, 1, 0, 0, 1, 1,
-0.242863, 0.4743007, 0.8737862, 1, 0, 0, 1, 1,
-0.2413671, 0.4381763, -1.075658, 1, 0, 0, 1, 1,
-0.2363927, -1.043156, -3.513771, 1, 0, 0, 1, 1,
-0.2282387, -1.764328, -1.350455, 0, 0, 0, 1, 1,
-0.2230867, 0.2126394, -2.735363, 0, 0, 0, 1, 1,
-0.2206822, -0.810571, -2.66828, 0, 0, 0, 1, 1,
-0.2205723, 0.6672618, -1.046252, 0, 0, 0, 1, 1,
-0.2131391, -0.6892691, -2.548421, 0, 0, 0, 1, 1,
-0.2128882, 0.9612795, -1.711285, 0, 0, 0, 1, 1,
-0.2122778, 0.03210946, -2.008049, 0, 0, 0, 1, 1,
-0.207695, 0.2595109, -1.192961, 1, 1, 1, 1, 1,
-0.2072036, -0.7535945, -2.071795, 1, 1, 1, 1, 1,
-0.2051252, -0.2369272, -1.357741, 1, 1, 1, 1, 1,
-0.202501, 2.180842, -0.04897594, 1, 1, 1, 1, 1,
-0.2022038, 0.9278526, 0.8002018, 1, 1, 1, 1, 1,
-0.2016155, -0.2944454, -3.569391, 1, 1, 1, 1, 1,
-0.1984975, -0.5480834, -2.105503, 1, 1, 1, 1, 1,
-0.1971968, -0.7839085, -1.632782, 1, 1, 1, 1, 1,
-0.1964122, -1.070518, -2.078988, 1, 1, 1, 1, 1,
-0.1942354, 1.052838, -0.9380228, 1, 1, 1, 1, 1,
-0.1930373, -0.4864123, -2.764676, 1, 1, 1, 1, 1,
-0.1927536, 1.327024, 0.7955971, 1, 1, 1, 1, 1,
-0.186953, 1.755125, 0.7265365, 1, 1, 1, 1, 1,
-0.1861936, -0.6740074, -1.390677, 1, 1, 1, 1, 1,
-0.1842742, 0.6608058, -0.36816, 1, 1, 1, 1, 1,
-0.1828459, 3.301405, -0.03552288, 0, 0, 1, 1, 1,
-0.1814204, -0.5043693, -2.267568, 1, 0, 0, 1, 1,
-0.1798228, 0.812683, 1.100581, 1, 0, 0, 1, 1,
-0.1793733, -0.2563461, -4.430488, 1, 0, 0, 1, 1,
-0.1790748, 0.06975184, -1.772195, 1, 0, 0, 1, 1,
-0.1780764, -0.2642801, -2.341059, 1, 0, 0, 1, 1,
-0.1743769, 1.804681, -1.044262, 0, 0, 0, 1, 1,
-0.1735967, -0.5602899, -1.057853, 0, 0, 0, 1, 1,
-0.1676962, -1.064512, -3.200173, 0, 0, 0, 1, 1,
-0.1676455, 0.1790838, -0.4449668, 0, 0, 0, 1, 1,
-0.1669756, -0.6659416, -3.217559, 0, 0, 0, 1, 1,
-0.165179, -1.069951, -3.383248, 0, 0, 0, 1, 1,
-0.1599774, -0.9901475, -3.270703, 0, 0, 0, 1, 1,
-0.1575892, -0.8743284, -2.481127, 1, 1, 1, 1, 1,
-0.1556755, -0.4025237, -3.314482, 1, 1, 1, 1, 1,
-0.1480425, -0.8193095, -2.071795, 1, 1, 1, 1, 1,
-0.1468017, -0.541845, -2.704463, 1, 1, 1, 1, 1,
-0.1463614, -1.380137, -2.309148, 1, 1, 1, 1, 1,
-0.1413572, -0.2127596, -3.288589, 1, 1, 1, 1, 1,
-0.1411351, -0.1934803, -1.925194, 1, 1, 1, 1, 1,
-0.1367104, 0.3825099, -0.06398745, 1, 1, 1, 1, 1,
-0.131928, -1.644803, -1.462891, 1, 1, 1, 1, 1,
-0.1243558, 3.26563, 1.488968, 1, 1, 1, 1, 1,
-0.1218991, 1.03905, -1.153813, 1, 1, 1, 1, 1,
-0.1193583, 0.9524212, -0.6677029, 1, 1, 1, 1, 1,
-0.1171766, 0.3540766, -1.16997, 1, 1, 1, 1, 1,
-0.1160629, -1.212491, -2.971422, 1, 1, 1, 1, 1,
-0.1134127, 0.829927, 0.1351589, 1, 1, 1, 1, 1,
-0.1127475, -0.1959162, -2.664684, 0, 0, 1, 1, 1,
-0.1095007, 1.058074, -0.1024024, 1, 0, 0, 1, 1,
-0.1092212, -0.2559599, -2.026342, 1, 0, 0, 1, 1,
-0.09853484, -1.652474, -4.179039, 1, 0, 0, 1, 1,
-0.0970147, 1.576466, 0.9154202, 1, 0, 0, 1, 1,
-0.09373748, 1.821831, -0.1124429, 1, 0, 0, 1, 1,
-0.09105518, -0.7465689, -4.915138, 0, 0, 0, 1, 1,
-0.08960178, 1.576636, 0.3911876, 0, 0, 0, 1, 1,
-0.08839233, 0.402737, -0.5167183, 0, 0, 0, 1, 1,
-0.08346739, -0.07999154, -0.7703204, 0, 0, 0, 1, 1,
-0.08199652, 0.5509503, -1.713123, 0, 0, 0, 1, 1,
-0.07894767, -0.06501037, -0.4737108, 0, 0, 0, 1, 1,
-0.07058188, -0.2190868, -1.571115, 0, 0, 0, 1, 1,
-0.0668622, -0.3802726, -2.563483, 1, 1, 1, 1, 1,
-0.0663543, 1.397471, -0.4369877, 1, 1, 1, 1, 1,
-0.05926723, 0.2708338, -2.514997, 1, 1, 1, 1, 1,
-0.05918667, -1.632299, -3.548594, 1, 1, 1, 1, 1,
-0.05838119, -0.2117139, -2.402032, 1, 1, 1, 1, 1,
-0.05788712, 0.9245684, -1.124088, 1, 1, 1, 1, 1,
-0.05675927, -0.652954, -3.773516, 1, 1, 1, 1, 1,
-0.05656771, -0.1373806, -3.235568, 1, 1, 1, 1, 1,
-0.05586093, -0.5089767, -3.298831, 1, 1, 1, 1, 1,
-0.05486682, -0.1028087, -2.903033, 1, 1, 1, 1, 1,
-0.05173156, -1.815415, -2.728637, 1, 1, 1, 1, 1,
-0.04553152, -0.3601785, -3.787615, 1, 1, 1, 1, 1,
-0.04518654, -0.4267763, -4.660795, 1, 1, 1, 1, 1,
-0.04279765, -1.097359, -2.280431, 1, 1, 1, 1, 1,
-0.03570666, 0.3938819, -0.9641943, 1, 1, 1, 1, 1,
-0.0338021, 0.2276596, -0.4128196, 0, 0, 1, 1, 1,
-0.03343306, -0.5993007, -4.38873, 1, 0, 0, 1, 1,
-0.03155019, 0.1548974, -1.004924, 1, 0, 0, 1, 1,
-0.03127231, 0.5845948, 0.8173555, 1, 0, 0, 1, 1,
-0.02992565, -0.4783663, -1.960261, 1, 0, 0, 1, 1,
-0.02903475, 1.533662, -0.5247637, 1, 0, 0, 1, 1,
-0.02875539, 0.4492016, 0.1402021, 0, 0, 0, 1, 1,
-0.02807607, -1.995416, -4.242684, 0, 0, 0, 1, 1,
-0.02654056, -0.6205313, -2.699293, 0, 0, 0, 1, 1,
-0.02447254, 1.454248, 1.417595, 0, 0, 0, 1, 1,
-0.02275446, 0.4587619, 0.4924527, 0, 0, 0, 1, 1,
-0.02009307, -0.578069, -3.138856, 0, 0, 0, 1, 1,
-0.01943636, -0.1342963, -3.475586, 0, 0, 0, 1, 1,
-0.01753102, -1.442, -3.120171, 1, 1, 1, 1, 1,
-0.0118967, 0.3839536, -0.9077471, 1, 1, 1, 1, 1,
-0.01118982, -0.3992174, -1.877484, 1, 1, 1, 1, 1,
-0.009611018, 1.079624, 1.166344, 1, 1, 1, 1, 1,
-0.009597582, -0.1222698, -2.454515, 1, 1, 1, 1, 1,
-0.008474799, 0.06455379, 0.8255815, 1, 1, 1, 1, 1,
-0.008117975, -0.4129665, -2.996483, 1, 1, 1, 1, 1,
-0.005930319, 0.3699842, -0.7526633, 1, 1, 1, 1, 1,
-0.002466496, -1.243417, -3.54795, 1, 1, 1, 1, 1,
0.000982801, -0.3424436, 4.659616, 1, 1, 1, 1, 1,
0.003365975, -0.04064134, 2.216904, 1, 1, 1, 1, 1,
0.006168643, 2.256554, -0.3108579, 1, 1, 1, 1, 1,
0.007157655, 0.3490596, 1.46128, 1, 1, 1, 1, 1,
0.008027364, -1.449729, 0.5982677, 1, 1, 1, 1, 1,
0.0102191, 0.6999234, -1.060817, 1, 1, 1, 1, 1,
0.01155662, 0.5596618, -0.04039602, 0, 0, 1, 1, 1,
0.01171388, 2.349069, 0.6396933, 1, 0, 0, 1, 1,
0.01310258, -0.5178641, 1.783314, 1, 0, 0, 1, 1,
0.01747217, -1.436775, 3.414071, 1, 0, 0, 1, 1,
0.02138349, 0.5581868, -0.1083659, 1, 0, 0, 1, 1,
0.02267114, 0.4979176, 0.08383217, 1, 0, 0, 1, 1,
0.03003394, 0.2779941, -1.209184, 0, 0, 0, 1, 1,
0.03791871, -0.7604496, 3.259342, 0, 0, 0, 1, 1,
0.04055342, -0.4716079, 4.287178, 0, 0, 0, 1, 1,
0.04355959, 0.08391163, 0.8044192, 0, 0, 0, 1, 1,
0.05056089, -0.2519072, 3.951047, 0, 0, 0, 1, 1,
0.05200346, 0.02196169, 3.053401, 0, 0, 0, 1, 1,
0.05278372, -3.078986, 3.34388, 0, 0, 0, 1, 1,
0.05437913, -0.3727506, 1.48709, 1, 1, 1, 1, 1,
0.05696587, -0.8263844, 0.8972642, 1, 1, 1, 1, 1,
0.0574109, -0.1307233, 2.918013, 1, 1, 1, 1, 1,
0.06505781, -0.5456726, 2.62645, 1, 1, 1, 1, 1,
0.0664935, 1.604848, 0.1468258, 1, 1, 1, 1, 1,
0.06788379, -0.550185, 2.856868, 1, 1, 1, 1, 1,
0.06808657, 0.04559791, 2.912525, 1, 1, 1, 1, 1,
0.06834334, 2.240198, 0.1841923, 1, 1, 1, 1, 1,
0.06944883, 0.1165978, -0.1329226, 1, 1, 1, 1, 1,
0.07322049, -0.5915249, 4.810195, 1, 1, 1, 1, 1,
0.07334249, -2.270084, 2.876949, 1, 1, 1, 1, 1,
0.07555198, -0.439734, 4.16449, 1, 1, 1, 1, 1,
0.07681611, 1.138188, 0.854707, 1, 1, 1, 1, 1,
0.07768948, 0.2790668, 1.636218, 1, 1, 1, 1, 1,
0.08434464, -1.131605, 1.931856, 1, 1, 1, 1, 1,
0.08579885, -0.9410645, 3.882902, 0, 0, 1, 1, 1,
0.08667568, -0.3110345, 3.615731, 1, 0, 0, 1, 1,
0.08723475, 0.5976272, 1.289521, 1, 0, 0, 1, 1,
0.1051403, -0.05449108, 1.275768, 1, 0, 0, 1, 1,
0.1059554, 0.7127091, 0.7316107, 1, 0, 0, 1, 1,
0.1077014, 0.3930625, 1.030863, 1, 0, 0, 1, 1,
0.1080446, 0.3795512, -0.767967, 0, 0, 0, 1, 1,
0.1082324, 0.7551373, 0.2505654, 0, 0, 0, 1, 1,
0.1104951, -1.316607, 3.187291, 0, 0, 0, 1, 1,
0.1111527, -0.3672123, 4.20734, 0, 0, 0, 1, 1,
0.1144989, 0.9814661, 0.7000412, 0, 0, 0, 1, 1,
0.1154694, -0.9213615, 2.16572, 0, 0, 0, 1, 1,
0.1167237, -1.184954, -0.1677753, 0, 0, 0, 1, 1,
0.1171723, 0.2545883, 1.990685, 1, 1, 1, 1, 1,
0.1200264, -0.1657716, 1.267046, 1, 1, 1, 1, 1,
0.1203827, 1.145736, 0.266452, 1, 1, 1, 1, 1,
0.1272645, -0.1351885, 2.264109, 1, 1, 1, 1, 1,
0.1278754, -2.290642, 4.15188, 1, 1, 1, 1, 1,
0.1333856, -0.7329913, 2.765619, 1, 1, 1, 1, 1,
0.1335149, 1.336756, 0.3659364, 1, 1, 1, 1, 1,
0.1338412, -0.06333629, 1.959066, 1, 1, 1, 1, 1,
0.1377381, -0.3296367, 4.645555, 1, 1, 1, 1, 1,
0.1395041, -1.667369, 2.040468, 1, 1, 1, 1, 1,
0.1473856, 0.3803757, 0.6190855, 1, 1, 1, 1, 1,
0.1486824, -2.504577, 3.017901, 1, 1, 1, 1, 1,
0.1489744, -1.390633, 3.082038, 1, 1, 1, 1, 1,
0.1492874, -0.5774224, 3.692922, 1, 1, 1, 1, 1,
0.1505759, 1.682243, -0.4834588, 1, 1, 1, 1, 1,
0.1507387, -0.3045667, 3.089123, 0, 0, 1, 1, 1,
0.1529021, -1.11719, 2.27525, 1, 0, 0, 1, 1,
0.1541326, -0.2804458, 2.406379, 1, 0, 0, 1, 1,
0.1542203, 1.104346, 1.244376, 1, 0, 0, 1, 1,
0.1612367, -1.434207, 2.668921, 1, 0, 0, 1, 1,
0.1621978, 1.287842, 0.3217472, 1, 0, 0, 1, 1,
0.1694368, -1.129905, 2.178284, 0, 0, 0, 1, 1,
0.1714341, 0.9714925, 0.6664951, 0, 0, 0, 1, 1,
0.1715199, 1.209684, -1.737823, 0, 0, 0, 1, 1,
0.1715922, -0.4446959, 2.1509, 0, 0, 0, 1, 1,
0.1717714, -0.02996277, 3.375255, 0, 0, 0, 1, 1,
0.1748718, -0.810204, 2.465122, 0, 0, 0, 1, 1,
0.1752587, 0.9948918, 0.6061558, 0, 0, 0, 1, 1,
0.1782719, 1.359479, 0.1664199, 1, 1, 1, 1, 1,
0.1800584, -1.00874, 2.598818, 1, 1, 1, 1, 1,
0.1835984, -0.5461702, 3.006599, 1, 1, 1, 1, 1,
0.1896812, 1.236675, 0.8810487, 1, 1, 1, 1, 1,
0.190601, 1.157859, -0.7852099, 1, 1, 1, 1, 1,
0.197438, 0.8436093, 0.4765515, 1, 1, 1, 1, 1,
0.1985051, -0.9868526, 4.052156, 1, 1, 1, 1, 1,
0.198558, -0.02226626, 1.260859, 1, 1, 1, 1, 1,
0.198676, 0.2437449, 0.1411731, 1, 1, 1, 1, 1,
0.2031173, -1.001218, 2.47951, 1, 1, 1, 1, 1,
0.2105577, -1.018396, 3.926939, 1, 1, 1, 1, 1,
0.2143065, 0.9923936, -1.031777, 1, 1, 1, 1, 1,
0.2172718, 0.7902476, -1.082945, 1, 1, 1, 1, 1,
0.2176569, -0.3728094, 2.170748, 1, 1, 1, 1, 1,
0.2197795, 0.7411371, -0.12157, 1, 1, 1, 1, 1,
0.2212182, -0.5413069, 1.058846, 0, 0, 1, 1, 1,
0.2217445, -1.807502, 3.513958, 1, 0, 0, 1, 1,
0.2233335, 1.222796, -1.313756, 1, 0, 0, 1, 1,
0.228178, -1.043387, 3.022069, 1, 0, 0, 1, 1,
0.2282603, -1.824352, 3.423212, 1, 0, 0, 1, 1,
0.2294441, -1.868805, 3.332669, 1, 0, 0, 1, 1,
0.2300075, 0.5988151, -0.8272707, 0, 0, 0, 1, 1,
0.2327011, -0.820352, 3.587497, 0, 0, 0, 1, 1,
0.2350446, -0.804867, 1.909016, 0, 0, 0, 1, 1,
0.2398718, -1.52609, 0.7983201, 0, 0, 0, 1, 1,
0.2408502, -0.6962407, 1.378267, 0, 0, 0, 1, 1,
0.2467412, -1.040817, 2.217102, 0, 0, 0, 1, 1,
0.2479762, 0.2334109, 0.2527089, 0, 0, 0, 1, 1,
0.2507444, 1.517368, -2.33108, 1, 1, 1, 1, 1,
0.2588448, -0.09446404, 1.328509, 1, 1, 1, 1, 1,
0.2704974, -2.277012, 2.505286, 1, 1, 1, 1, 1,
0.2748506, 1.075405, 2.74533, 1, 1, 1, 1, 1,
0.28065, 0.4951198, 0.1408192, 1, 1, 1, 1, 1,
0.2808716, -0.3395227, 0.9240074, 1, 1, 1, 1, 1,
0.2857374, -0.9046434, 1.31518, 1, 1, 1, 1, 1,
0.2858507, -0.5803072, 3.428686, 1, 1, 1, 1, 1,
0.2861959, -0.3011634, 3.83947, 1, 1, 1, 1, 1,
0.2862654, 1.222311, -0.2628008, 1, 1, 1, 1, 1,
0.2879286, 0.4252299, 2.269111, 1, 1, 1, 1, 1,
0.2899185, -0.02982386, 1.947602, 1, 1, 1, 1, 1,
0.2953954, 0.9770946, 0.04206924, 1, 1, 1, 1, 1,
0.295784, 0.7354847, -0.6315494, 1, 1, 1, 1, 1,
0.3058948, 1.364963, 1.311118, 1, 1, 1, 1, 1,
0.3095563, -0.8559535, 3.239197, 0, 0, 1, 1, 1,
0.3124151, -2.046226, 3.607263, 1, 0, 0, 1, 1,
0.3125925, 1.408935, 1.614783, 1, 0, 0, 1, 1,
0.3127369, -0.5562677, 1.787092, 1, 0, 0, 1, 1,
0.3175309, -1.302267, 3.049693, 1, 0, 0, 1, 1,
0.3195258, 0.06695174, 1.924595, 1, 0, 0, 1, 1,
0.327395, -1.767362, 2.023434, 0, 0, 0, 1, 1,
0.3291502, 0.6868169, 0.4054791, 0, 0, 0, 1, 1,
0.3329142, 0.3463855, 0.6232877, 0, 0, 0, 1, 1,
0.3332049, 0.6994894, 1.744608, 0, 0, 0, 1, 1,
0.3404484, 0.2030717, 1.145192, 0, 0, 0, 1, 1,
0.3423196, -1.307728, 3.367638, 0, 0, 0, 1, 1,
0.3434422, 0.2397842, 1.061898, 0, 0, 0, 1, 1,
0.3472789, -0.1260448, 1.842583, 1, 1, 1, 1, 1,
0.3544091, 0.155189, -0.2475685, 1, 1, 1, 1, 1,
0.3556068, 0.5427266, 0.6657816, 1, 1, 1, 1, 1,
0.3595396, 0.8450397, 0.7197552, 1, 1, 1, 1, 1,
0.3605768, -0.918409, 2.882047, 1, 1, 1, 1, 1,
0.3679117, -0.6393804, 1.870092, 1, 1, 1, 1, 1,
0.371555, -2.345932, 2.221352, 1, 1, 1, 1, 1,
0.3779304, 0.3889416, -0.3852077, 1, 1, 1, 1, 1,
0.378837, -1.76671, 3.402192, 1, 1, 1, 1, 1,
0.3793616, -0.6936025, 2.075576, 1, 1, 1, 1, 1,
0.3816528, -1.117218, 3.786871, 1, 1, 1, 1, 1,
0.381681, -0.8605695, 2.214764, 1, 1, 1, 1, 1,
0.3849964, 1.192267, 0.8733221, 1, 1, 1, 1, 1,
0.3913654, 0.1362545, 1.185572, 1, 1, 1, 1, 1,
0.3926135, -0.9404684, 3.26989, 1, 1, 1, 1, 1,
0.3959981, 0.2035776, 1.130226, 0, 0, 1, 1, 1,
0.3985302, -0.6454077, 4.123125, 1, 0, 0, 1, 1,
0.4042766, -0.4826714, 1.060861, 1, 0, 0, 1, 1,
0.4043157, 1.861828, 1.311418, 1, 0, 0, 1, 1,
0.4045525, -0.6009758, 2.475506, 1, 0, 0, 1, 1,
0.4057125, 0.4573326, -1.265696, 1, 0, 0, 1, 1,
0.4058849, 0.9009647, 0.1880075, 0, 0, 0, 1, 1,
0.406039, 0.6149127, 1.033988, 0, 0, 0, 1, 1,
0.4107491, -0.4536184, 1.400849, 0, 0, 0, 1, 1,
0.4117034, 1.74123, -0.1527191, 0, 0, 0, 1, 1,
0.4164711, 0.4969038, 0.777071, 0, 0, 0, 1, 1,
0.4180132, 0.06594187, 1.266225, 0, 0, 0, 1, 1,
0.418857, -0.6509525, 3.683055, 0, 0, 0, 1, 1,
0.4258306, 0.02471912, 0.8596281, 1, 1, 1, 1, 1,
0.425995, 1.235885, 1.308381, 1, 1, 1, 1, 1,
0.4272075, 0.8055094, 0.7523305, 1, 1, 1, 1, 1,
0.428122, 0.04478028, -0.3649825, 1, 1, 1, 1, 1,
0.4382764, -0.5096623, 3.182639, 1, 1, 1, 1, 1,
0.4405108, -0.4407588, 3.063725, 1, 1, 1, 1, 1,
0.4411241, -0.8146872, 3.831216, 1, 1, 1, 1, 1,
0.4417324, 0.2435878, -1.801032, 1, 1, 1, 1, 1,
0.4433127, -0.591796, 1.556607, 1, 1, 1, 1, 1,
0.449244, -1.179306, 2.588512, 1, 1, 1, 1, 1,
0.4556225, -0.6173982, 3.532198, 1, 1, 1, 1, 1,
0.4571021, 0.4633547, 0.1831629, 1, 1, 1, 1, 1,
0.4589314, 0.5486383, 2.326669, 1, 1, 1, 1, 1,
0.4604505, -0.3719361, 2.170629, 1, 1, 1, 1, 1,
0.4689947, -0.4557, 1.273484, 1, 1, 1, 1, 1,
0.4694926, -1.099841, 4.41092, 0, 0, 1, 1, 1,
0.4826196, 1.208746, 0.5283172, 1, 0, 0, 1, 1,
0.4893058, -0.9045815, 1.640926, 1, 0, 0, 1, 1,
0.4903026, -1.279006, 2.805897, 1, 0, 0, 1, 1,
0.4937079, 0.07422222, 2.158902, 1, 0, 0, 1, 1,
0.4945111, 0.4073145, 1.754638, 1, 0, 0, 1, 1,
0.4957455, 0.1971375, 0.5983935, 0, 0, 0, 1, 1,
0.498809, -1.041473, 1.247247, 0, 0, 0, 1, 1,
0.5002901, -0.4102445, 2.713519, 0, 0, 0, 1, 1,
0.5073543, 0.8400673, -0.3915139, 0, 0, 0, 1, 1,
0.5078692, -0.1448434, 1.218156, 0, 0, 0, 1, 1,
0.5097048, -0.4688118, 1.824073, 0, 0, 0, 1, 1,
0.5133643, 1.048894, 0.4438309, 0, 0, 0, 1, 1,
0.5213059, -0.3312364, 3.108091, 1, 1, 1, 1, 1,
0.5215444, -0.06224845, 3.050385, 1, 1, 1, 1, 1,
0.5258844, 0.02333963, 0.1143874, 1, 1, 1, 1, 1,
0.5284964, -1.828766, 3.783341, 1, 1, 1, 1, 1,
0.5324204, -0.7516872, 1.526759, 1, 1, 1, 1, 1,
0.5363591, 1.369067, 1.139856, 1, 1, 1, 1, 1,
0.5380667, 1.857371, 1.02198, 1, 1, 1, 1, 1,
0.5396069, -0.7096432, 2.807784, 1, 1, 1, 1, 1,
0.540834, 1.455727, 0.02327223, 1, 1, 1, 1, 1,
0.5461004, 1.112477, -0.05804337, 1, 1, 1, 1, 1,
0.5483726, -0.1909734, 3.933588, 1, 1, 1, 1, 1,
0.5555316, 1.370816, 0.9526671, 1, 1, 1, 1, 1,
0.562229, 0.8884021, -1.350682, 1, 1, 1, 1, 1,
0.5627857, 0.06677902, 2.393327, 1, 1, 1, 1, 1,
0.5637543, 1.710376, 0.5725966, 1, 1, 1, 1, 1,
0.5698672, 0.9298362, 0.3500959, 0, 0, 1, 1, 1,
0.5763797, 2.425491, -0.4841203, 1, 0, 0, 1, 1,
0.5956228, -0.913675, 2.222866, 1, 0, 0, 1, 1,
0.6050063, 0.180748, 1.986376, 1, 0, 0, 1, 1,
0.6058404, 1.328065, -1.197742, 1, 0, 0, 1, 1,
0.6066079, -1.101686, 3.007818, 1, 0, 0, 1, 1,
0.6090783, 0.7258579, 2.2198, 0, 0, 0, 1, 1,
0.6114512, -0.3327697, 2.700858, 0, 0, 0, 1, 1,
0.6127638, 1.450251, 0.4757164, 0, 0, 0, 1, 1,
0.6160988, 0.8951312, 0.05948288, 0, 0, 0, 1, 1,
0.6163175, 0.7142529, -0.04939846, 0, 0, 0, 1, 1,
0.6223437, 1.716071, -0.03550315, 0, 0, 0, 1, 1,
0.6240249, -0.5845635, 1.233928, 0, 0, 0, 1, 1,
0.6324479, 0.8575975, 0.2445674, 1, 1, 1, 1, 1,
0.6344277, 1.402734, -0.9128811, 1, 1, 1, 1, 1,
0.637344, 0.9022979, 0.9959104, 1, 1, 1, 1, 1,
0.6398392, 0.5734298, 1.231294, 1, 1, 1, 1, 1,
0.6399651, -0.1029802, 1.090784, 1, 1, 1, 1, 1,
0.6420329, -0.5487479, 3.008221, 1, 1, 1, 1, 1,
0.6446401, 0.3239129, 0.7106855, 1, 1, 1, 1, 1,
0.6480585, -0.6179034, 0.5008876, 1, 1, 1, 1, 1,
0.6549905, -0.7955734, 2.597484, 1, 1, 1, 1, 1,
0.6555351, -0.4689576, 1.715419, 1, 1, 1, 1, 1,
0.6602905, 1.488195, -0.6564813, 1, 1, 1, 1, 1,
0.6633263, -0.5436309, 3.638284, 1, 1, 1, 1, 1,
0.6698965, -1.10145, 2.933949, 1, 1, 1, 1, 1,
0.6702433, 0.4827989, 0.7973005, 1, 1, 1, 1, 1,
0.6747718, -0.1721645, 3.103711, 1, 1, 1, 1, 1,
0.6772865, 0.523078, 0.8269638, 0, 0, 1, 1, 1,
0.6786955, 1.744873, 0.5848089, 1, 0, 0, 1, 1,
0.6829008, 0.4284311, -0.7743244, 1, 0, 0, 1, 1,
0.683964, -1.585338, 0.9549564, 1, 0, 0, 1, 1,
0.6840132, -2.094825, 3.352614, 1, 0, 0, 1, 1,
0.6877604, 1.225047, -0.626763, 1, 0, 0, 1, 1,
0.6913884, 1.013428, -0.7006174, 0, 0, 0, 1, 1,
0.6915066, -0.006509847, 1.611442, 0, 0, 0, 1, 1,
0.6949454, 0.6552038, 0.2478369, 0, 0, 0, 1, 1,
0.695432, -0.2460454, 2.987736, 0, 0, 0, 1, 1,
0.6963457, 1.490978, 0.01216744, 0, 0, 0, 1, 1,
0.7101499, 0.9405378, -0.3238566, 0, 0, 0, 1, 1,
0.7124382, -2.237144, 3.04258, 0, 0, 0, 1, 1,
0.7147967, -0.5220262, -0.2181108, 1, 1, 1, 1, 1,
0.7223048, -0.07814778, 0.6789797, 1, 1, 1, 1, 1,
0.7223705, 1.481031, -0.09608792, 1, 1, 1, 1, 1,
0.723532, 0.622057, 2.589787, 1, 1, 1, 1, 1,
0.724919, 1.831509, 1.196142, 1, 1, 1, 1, 1,
0.7269173, 0.9194512, 0.5534265, 1, 1, 1, 1, 1,
0.7335806, 1.416855, 2.680246, 1, 1, 1, 1, 1,
0.7365081, 0.1406302, -1.020007, 1, 1, 1, 1, 1,
0.7496644, -0.8038972, 1.974273, 1, 1, 1, 1, 1,
0.7588943, -0.4296763, 2.033134, 1, 1, 1, 1, 1,
0.7766654, -0.5176594, 2.747647, 1, 1, 1, 1, 1,
0.7772011, 0.4617727, -0.2899933, 1, 1, 1, 1, 1,
0.7775111, 0.6632879, 1.438285, 1, 1, 1, 1, 1,
0.7805292, -0.3184816, 3.640858, 1, 1, 1, 1, 1,
0.7834332, 0.7790278, 0.5757297, 1, 1, 1, 1, 1,
0.785111, -1.181946, 1.083679, 0, 0, 1, 1, 1,
0.7871267, -0.2381936, 2.237701, 1, 0, 0, 1, 1,
0.7872521, -0.8087817, 2.371771, 1, 0, 0, 1, 1,
0.78816, -1.782417, 2.835196, 1, 0, 0, 1, 1,
0.7882039, 0.4521406, 1.292631, 1, 0, 0, 1, 1,
0.7906499, 0.8686166, -0.06259524, 1, 0, 0, 1, 1,
0.794521, 1.16408, -0.01479646, 0, 0, 0, 1, 1,
0.7960683, 0.247053, 1.793376, 0, 0, 0, 1, 1,
0.7975073, 1.583595, 0.8885467, 0, 0, 0, 1, 1,
0.8042401, 0.02323398, 2.128092, 0, 0, 0, 1, 1,
0.8048733, -1.233208, 2.595957, 0, 0, 0, 1, 1,
0.8174268, -1.124056, 3.345524, 0, 0, 0, 1, 1,
0.8190718, 0.8973962, 0.7714498, 0, 0, 0, 1, 1,
0.8200386, 1.5861, -0.4415561, 1, 1, 1, 1, 1,
0.8242204, -0.6536213, 3.576988, 1, 1, 1, 1, 1,
0.8315598, 0.807363, 0.3212247, 1, 1, 1, 1, 1,
0.8323776, -0.01527106, 3.853812, 1, 1, 1, 1, 1,
0.8345232, 0.6009093, 0.09538483, 1, 1, 1, 1, 1,
0.8353859, -0.771922, 5.010902, 1, 1, 1, 1, 1,
0.8358428, 1.609154, 1.391801, 1, 1, 1, 1, 1,
0.8382893, 0.0002873324, 1.902618, 1, 1, 1, 1, 1,
0.8449546, -0.4386459, 2.594854, 1, 1, 1, 1, 1,
0.8510359, -0.1388623, 1.027615, 1, 1, 1, 1, 1,
0.8609152, 1.878765, -0.08541781, 1, 1, 1, 1, 1,
0.8614412, -1.208268, 1.35504, 1, 1, 1, 1, 1,
0.8662295, -1.706393, 4.195059, 1, 1, 1, 1, 1,
0.8677769, -1.419826, 4.26927, 1, 1, 1, 1, 1,
0.8804489, -0.5850959, 2.502783, 1, 1, 1, 1, 1,
0.8824614, -1.229115, 0.935275, 0, 0, 1, 1, 1,
0.8832197, 0.340942, 1.379142, 1, 0, 0, 1, 1,
0.8915595, 1.126155, -0.4549384, 1, 0, 0, 1, 1,
0.8926747, -1.560828, 2.399354, 1, 0, 0, 1, 1,
0.8941666, -0.05779027, 1.513745, 1, 0, 0, 1, 1,
0.8941965, -0.8940741, 2.734551, 1, 0, 0, 1, 1,
0.9039769, -1.55768, 3.358941, 0, 0, 0, 1, 1,
0.9051835, 0.7133899, -0.3345395, 0, 0, 0, 1, 1,
0.906521, 0.09260163, -0.02305731, 0, 0, 0, 1, 1,
0.9121479, -0.1984375, 0.4364495, 0, 0, 0, 1, 1,
0.9140275, -1.344615, 4.213867, 0, 0, 0, 1, 1,
0.9157449, 0.3405049, 1.982316, 0, 0, 0, 1, 1,
0.9164665, 1.058019, 1.758476, 0, 0, 0, 1, 1,
0.9164844, -0.7228184, 2.979187, 1, 1, 1, 1, 1,
0.9170038, -0.2821464, 1.803291, 1, 1, 1, 1, 1,
0.9231152, -1.202917, 1.608635, 1, 1, 1, 1, 1,
0.9254043, 0.589517, -0.6389, 1, 1, 1, 1, 1,
0.9366221, 0.1534066, 1.456295, 1, 1, 1, 1, 1,
0.9413829, -0.6432979, 2.423728, 1, 1, 1, 1, 1,
0.9460005, -0.3413369, 3.536392, 1, 1, 1, 1, 1,
0.9469049, 0.6521304, 0.3406481, 1, 1, 1, 1, 1,
0.9489014, 0.2701394, 3.109099, 1, 1, 1, 1, 1,
0.9492975, -0.7679923, 1.443684, 1, 1, 1, 1, 1,
0.9504769, -0.5733067, 1.137264, 1, 1, 1, 1, 1,
0.9678808, 1.677325, 1.570627, 1, 1, 1, 1, 1,
0.9697982, 0.3263302, 3.276345, 1, 1, 1, 1, 1,
0.9716265, -1.474707, 2.386585, 1, 1, 1, 1, 1,
0.9724342, 0.5390918, 0.767429, 1, 1, 1, 1, 1,
0.9727383, -2.389033, 1.955257, 0, 0, 1, 1, 1,
0.973923, 0.1928762, -0.7472197, 1, 0, 0, 1, 1,
0.9803504, 2.03245, -0.362267, 1, 0, 0, 1, 1,
0.9811213, -1.020941, 3.588373, 1, 0, 0, 1, 1,
0.986249, 0.7226239, -1.93294, 1, 0, 0, 1, 1,
0.9909015, -0.09755589, 3.01248, 1, 0, 0, 1, 1,
0.9910586, -0.06775048, 1.447614, 0, 0, 0, 1, 1,
0.9921524, 0.5314462, 1.57449, 0, 0, 0, 1, 1,
1.002069, 2.438939, 0.8817374, 0, 0, 0, 1, 1,
1.003339, -1.040147, 3.594362, 0, 0, 0, 1, 1,
1.004247, 0.2096085, 1.662028, 0, 0, 0, 1, 1,
1.010423, -1.415314, 1.985569, 0, 0, 0, 1, 1,
1.014798, 2.377367, -0.1206824, 0, 0, 0, 1, 1,
1.018532, 1.449047, -0.2805033, 1, 1, 1, 1, 1,
1.019152, -0.2898543, 0.694348, 1, 1, 1, 1, 1,
1.024553, 0.9391629, 1.305244, 1, 1, 1, 1, 1,
1.028944, -0.1734626, 1.254357, 1, 1, 1, 1, 1,
1.03097, -0.213393, 2.634357, 1, 1, 1, 1, 1,
1.032228, -0.1024608, 2.351849, 1, 1, 1, 1, 1,
1.041026, -0.7123252, 2.531729, 1, 1, 1, 1, 1,
1.056189, 0.2546361, -0.04229762, 1, 1, 1, 1, 1,
1.073507, -0.2687602, 1.029101, 1, 1, 1, 1, 1,
1.082171, -0.3574207, 1.691988, 1, 1, 1, 1, 1,
1.085416, -0.006535303, 3.423228, 1, 1, 1, 1, 1,
1.089155, 1.139181, 2.582765, 1, 1, 1, 1, 1,
1.09475, 0.2378998, 2.159331, 1, 1, 1, 1, 1,
1.096589, 0.1092322, 1.362887, 1, 1, 1, 1, 1,
1.097932, -0.259677, 1.479326, 1, 1, 1, 1, 1,
1.099688, 0.9793559, 0.3439159, 0, 0, 1, 1, 1,
1.10097, -0.1740409, 1.256554, 1, 0, 0, 1, 1,
1.102571, -0.6252779, 3.894331, 1, 0, 0, 1, 1,
1.104927, 1.204406, 0.9461666, 1, 0, 0, 1, 1,
1.106248, 0.3736467, 2.580111, 1, 0, 0, 1, 1,
1.115451, 0.505535, 1.623744, 1, 0, 0, 1, 1,
1.117223, -1.432271, 3.991251, 0, 0, 0, 1, 1,
1.123662, 0.1275697, 1.266876, 0, 0, 0, 1, 1,
1.125853, 0.2361602, 3.447143, 0, 0, 0, 1, 1,
1.130984, 0.6980888, 0.5229767, 0, 0, 0, 1, 1,
1.137129, 0.6661904, 0.7236475, 0, 0, 0, 1, 1,
1.138031, -0.7418936, 1.76565, 0, 0, 0, 1, 1,
1.13865, -0.6225041, 1.668293, 0, 0, 0, 1, 1,
1.140032, 1.142105, -0.1011912, 1, 1, 1, 1, 1,
1.144854, -2.327571, 3.253966, 1, 1, 1, 1, 1,
1.14699, 0.4453154, 2.129186, 1, 1, 1, 1, 1,
1.150491, -1.730834, 3.634309, 1, 1, 1, 1, 1,
1.160882, 0.3336341, 2.595478, 1, 1, 1, 1, 1,
1.168438, 0.8363799, 2.214347, 1, 1, 1, 1, 1,
1.177849, 0.6694937, 0.3152208, 1, 1, 1, 1, 1,
1.180732, 0.5894859, 2.358719, 1, 1, 1, 1, 1,
1.185603, -0.008280863, -0.2623402, 1, 1, 1, 1, 1,
1.199848, 0.1149619, 3.137896, 1, 1, 1, 1, 1,
1.201169, 0.07089392, 1.940297, 1, 1, 1, 1, 1,
1.206645, 0.01555202, 2.689681, 1, 1, 1, 1, 1,
1.209502, -2.056253, 2.923029, 1, 1, 1, 1, 1,
1.211083, -0.1191467, 2.620888, 1, 1, 1, 1, 1,
1.21218, 0.8807873, -0.8698283, 1, 1, 1, 1, 1,
1.215422, -1.242948, 2.717494, 0, 0, 1, 1, 1,
1.235683, 1.128464, -0.6236407, 1, 0, 0, 1, 1,
1.239385, -0.7625908, 3.04563, 1, 0, 0, 1, 1,
1.239847, 0.4565251, 1.793257, 1, 0, 0, 1, 1,
1.253667, -0.005546693, 1.872981, 1, 0, 0, 1, 1,
1.261757, -0.1690449, 2.007569, 1, 0, 0, 1, 1,
1.271003, 1.887078, -0.2036999, 0, 0, 0, 1, 1,
1.271577, 0.2784022, 1.048456, 0, 0, 0, 1, 1,
1.273448, 0.5821818, 2.420238, 0, 0, 0, 1, 1,
1.273705, 0.4274385, 1.426417, 0, 0, 0, 1, 1,
1.287179, 0.4401005, 1.461599, 0, 0, 0, 1, 1,
1.293725, -0.9486129, 2.25006, 0, 0, 0, 1, 1,
1.296765, 1.661797, 1.553904, 0, 0, 0, 1, 1,
1.304932, 0.6563404, 0.4555492, 1, 1, 1, 1, 1,
1.309054, -1.179886, 0.1610554, 1, 1, 1, 1, 1,
1.309284, -1.816241, 1.372614, 1, 1, 1, 1, 1,
1.324305, 0.5975665, 2.031653, 1, 1, 1, 1, 1,
1.324583, 0.5359901, 0.5855513, 1, 1, 1, 1, 1,
1.325021, 0.5882038, 2.579973, 1, 1, 1, 1, 1,
1.327596, -0.4979179, 2.618152, 1, 1, 1, 1, 1,
1.342198, 1.057456, 1.090649, 1, 1, 1, 1, 1,
1.342446, -1.315792, 1.213718, 1, 1, 1, 1, 1,
1.346717, -0.2774025, 2.951779, 1, 1, 1, 1, 1,
1.353981, 0.4870915, -0.2691747, 1, 1, 1, 1, 1,
1.36118, -0.5910854, 1.144378, 1, 1, 1, 1, 1,
1.366712, -1.230821, 3.351864, 1, 1, 1, 1, 1,
1.373643, 0.2120742, 1.152461, 1, 1, 1, 1, 1,
1.381377, 0.5710168, 1.444505, 1, 1, 1, 1, 1,
1.384546, 1.469176, -0.6933277, 0, 0, 1, 1, 1,
1.392826, -0.9174312, 3.187164, 1, 0, 0, 1, 1,
1.397564, -0.8480768, 1.138131, 1, 0, 0, 1, 1,
1.398731, -0.2514922, 1.723518, 1, 0, 0, 1, 1,
1.405302, 0.3662955, 1.438868, 1, 0, 0, 1, 1,
1.406751, -0.5636238, 0.6318635, 1, 0, 0, 1, 1,
1.425529, -1.673613, 0.4178558, 0, 0, 0, 1, 1,
1.426222, 1.100116, 0.4564534, 0, 0, 0, 1, 1,
1.440378, -0.1005255, 2.630799, 0, 0, 0, 1, 1,
1.447519, -0.9952675, 2.513488, 0, 0, 0, 1, 1,
1.461753, -0.5484889, 1.400277, 0, 0, 0, 1, 1,
1.468693, -0.8681656, 3.275173, 0, 0, 0, 1, 1,
1.479634, -0.2175273, 1.548213, 0, 0, 0, 1, 1,
1.480399, 1.750704, 0.6695833, 1, 1, 1, 1, 1,
1.490303, 1.704953, 0.6937345, 1, 1, 1, 1, 1,
1.492601, 0.6227584, 0.6427595, 1, 1, 1, 1, 1,
1.498925, 1.383935, 2.92754, 1, 1, 1, 1, 1,
1.499872, -0.3800231, 1.782051, 1, 1, 1, 1, 1,
1.521969, -0.5331966, 1.991242, 1, 1, 1, 1, 1,
1.542245, -2.567333, 2.399738, 1, 1, 1, 1, 1,
1.553866, -1.170689, 0.461726, 1, 1, 1, 1, 1,
1.60547, 1.086581, 0.4820492, 1, 1, 1, 1, 1,
1.611624, -0.3654246, 2.228067, 1, 1, 1, 1, 1,
1.626744, -0.4245176, 2.134748, 1, 1, 1, 1, 1,
1.635796, 0.5436252, -0.4635421, 1, 1, 1, 1, 1,
1.641226, -0.7559448, 2.045503, 1, 1, 1, 1, 1,
1.668752, 1.65963, 1.232789, 1, 1, 1, 1, 1,
1.680662, 2.004654, -0.41582, 1, 1, 1, 1, 1,
1.694805, -0.0587678, 1.733796, 0, 0, 1, 1, 1,
1.704112, 0.4350654, 3.203043, 1, 0, 0, 1, 1,
1.71234, 0.07028621, 2.772998, 1, 0, 0, 1, 1,
1.718556, 0.1858135, 1.268329, 1, 0, 0, 1, 1,
1.722608, -0.3847505, 3.989951, 1, 0, 0, 1, 1,
1.728264, 0.7793261, 0.2893742, 1, 0, 0, 1, 1,
1.73997, 0.06521626, 3.538102, 0, 0, 0, 1, 1,
1.754906, 1.876686, 2.332825, 0, 0, 0, 1, 1,
1.757749, -0.5017581, 2.229786, 0, 0, 0, 1, 1,
1.758416, -0.5175605, 1.950446, 0, 0, 0, 1, 1,
1.774043, -0.4345479, 2.628036, 0, 0, 0, 1, 1,
1.792164, -1.467936, 1.195628, 0, 0, 0, 1, 1,
1.8102, -1.080255, 1.970045, 0, 0, 0, 1, 1,
1.812131, -0.2792791, 1.39154, 1, 1, 1, 1, 1,
1.817929, -0.3721419, 1.822336, 1, 1, 1, 1, 1,
1.832323, 0.2709293, 0.8961931, 1, 1, 1, 1, 1,
1.846607, -1.118289, 0.2266231, 1, 1, 1, 1, 1,
1.885567, 1.370718, 1.946003, 1, 1, 1, 1, 1,
1.889862, 0.4379944, 1.743042, 1, 1, 1, 1, 1,
1.902124, -1.819597, 1.900246, 1, 1, 1, 1, 1,
1.966403, 0.6545678, 0.2534432, 1, 1, 1, 1, 1,
1.978348, -1.555398, 3.632069, 1, 1, 1, 1, 1,
2.00017, 0.644778, 3.110766, 1, 1, 1, 1, 1,
2.01508, 0.0268258, -0.02048861, 1, 1, 1, 1, 1,
2.022302, -0.8554924, 2.693874, 1, 1, 1, 1, 1,
2.029309, -0.7112442, 1.13028, 1, 1, 1, 1, 1,
2.029807, 0.4403977, 0.8357451, 1, 1, 1, 1, 1,
2.032303, 1.609781, 0.3822452, 1, 1, 1, 1, 1,
2.074907, 1.785761, 0.1649512, 0, 0, 1, 1, 1,
2.086498, 1.596716, 0.3455705, 1, 0, 0, 1, 1,
2.113867, 0.3567877, -0.1472113, 1, 0, 0, 1, 1,
2.15685, -0.02587442, 0.1581308, 1, 0, 0, 1, 1,
2.185575, -0.1891344, 1.371384, 1, 0, 0, 1, 1,
2.20786, 0.9336086, 0.7264959, 1, 0, 0, 1, 1,
2.220318, 3.060673, 1.591149, 0, 0, 0, 1, 1,
2.248934, 0.7487936, 1.188259, 0, 0, 0, 1, 1,
2.257756, -0.1506727, 2.394838, 0, 0, 0, 1, 1,
2.268524, 0.2710387, 1.066801, 0, 0, 0, 1, 1,
2.309839, -0.7343361, 0.4072163, 0, 0, 0, 1, 1,
2.335546, 0.1205537, 1.553357, 0, 0, 0, 1, 1,
2.40852, 0.04153478, 0.745446, 0, 0, 0, 1, 1,
2.579215, 0.7098786, -0.06752799, 1, 1, 1, 1, 1,
2.664391, 0.2013277, 0.9002798, 1, 1, 1, 1, 1,
2.669752, -1.445514, 1.117941, 1, 1, 1, 1, 1,
2.874006, 1.175765, 0.9974571, 1, 1, 1, 1, 1,
3.126551, 0.3665466, 2.082323, 1, 1, 1, 1, 1,
3.200607, 2.128095, 1.439876, 1, 1, 1, 1, 1,
3.561091, 0.184882, 1.071234, 1, 1, 1, 1, 1
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
var radius = 9.645913;
var distance = 33.88086;
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
mvMatrix.translate( 0.1173921, -0.3182762, -0.03834486 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.88086);
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
