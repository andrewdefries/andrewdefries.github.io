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
-3.083025, 0.8866577, -3.834992, 1, 0, 0, 1,
-2.786414, 1.60764, 0.7617378, 1, 0.007843138, 0, 1,
-2.777763, 0.3769763, -0.9176413, 1, 0.01176471, 0, 1,
-2.75405, 1.103518, -1.133834, 1, 0.01960784, 0, 1,
-2.569111, -0.0959751, -1.160375, 1, 0.02352941, 0, 1,
-2.554907, -0.3982787, -2.69452, 1, 0.03137255, 0, 1,
-2.397532, 0.1902908, -1.832031, 1, 0.03529412, 0, 1,
-2.372909, 1.035482, -0.8493208, 1, 0.04313726, 0, 1,
-2.209291, -0.1054477, -1.936257, 1, 0.04705882, 0, 1,
-2.194863, -0.7958843, -2.525903, 1, 0.05490196, 0, 1,
-2.154684, -3.415386, -3.072275, 1, 0.05882353, 0, 1,
-2.105778, -0.4545147, -3.132406, 1, 0.06666667, 0, 1,
-2.102884, 0.2530721, -2.71501, 1, 0.07058824, 0, 1,
-2.102134, 0.5193419, -2.125432, 1, 0.07843138, 0, 1,
-2.073168, 0.4887062, -1.598699, 1, 0.08235294, 0, 1,
-2.062758, 0.06972205, -3.648252, 1, 0.09019608, 0, 1,
-1.962615, 0.5940773, -1.52584, 1, 0.09411765, 0, 1,
-1.956981, 0.1479418, -2.672107, 1, 0.1019608, 0, 1,
-1.948689, -1.205491, -2.38091, 1, 0.1098039, 0, 1,
-1.942995, 1.80744, -0.2277462, 1, 0.1137255, 0, 1,
-1.939206, 0.3608819, -1.405832, 1, 0.1215686, 0, 1,
-1.905451, 1.184687, -2.161697, 1, 0.1254902, 0, 1,
-1.90291, 0.5715696, -0.7454607, 1, 0.1333333, 0, 1,
-1.855602, 0.5949252, -1.008597, 1, 0.1372549, 0, 1,
-1.848948, -0.1980972, -0.9585086, 1, 0.145098, 0, 1,
-1.847097, -0.1865025, -1.614115, 1, 0.1490196, 0, 1,
-1.835776, -0.3528354, -0.8017043, 1, 0.1568628, 0, 1,
-1.799413, 1.118542, 0.1091267, 1, 0.1607843, 0, 1,
-1.798551, 0.8313228, 1.72241, 1, 0.1686275, 0, 1,
-1.787075, -0.2214915, -0.9941149, 1, 0.172549, 0, 1,
-1.785525, -0.9194097, -1.231442, 1, 0.1803922, 0, 1,
-1.779953, 1.847908, 0.2750633, 1, 0.1843137, 0, 1,
-1.775619, -0.03419124, -2.152624, 1, 0.1921569, 0, 1,
-1.769166, 0.2964793, 0.4160981, 1, 0.1960784, 0, 1,
-1.729538, 0.1863333, -1.09785, 1, 0.2039216, 0, 1,
-1.714646, -1.190868, -2.005937, 1, 0.2117647, 0, 1,
-1.709075, 0.1669023, -1.797586, 1, 0.2156863, 0, 1,
-1.698473, 1.961491, -1.811921, 1, 0.2235294, 0, 1,
-1.680985, -1.583684, -0.03526514, 1, 0.227451, 0, 1,
-1.659764, 0.5004961, -2.392921, 1, 0.2352941, 0, 1,
-1.648226, 0.2991948, -0.5058544, 1, 0.2392157, 0, 1,
-1.640072, -1.142502, -1.004961, 1, 0.2470588, 0, 1,
-1.627577, -1.225744, -0.07692824, 1, 0.2509804, 0, 1,
-1.625033, -0.2151117, -0.8577029, 1, 0.2588235, 0, 1,
-1.617749, -0.8567147, -0.5783118, 1, 0.2627451, 0, 1,
-1.604217, 0.1893829, -1.736415, 1, 0.2705882, 0, 1,
-1.595599, 0.6429844, 0.02524213, 1, 0.2745098, 0, 1,
-1.58993, 1.413176, -0.08180439, 1, 0.282353, 0, 1,
-1.586994, 0.1333019, -1.245641, 1, 0.2862745, 0, 1,
-1.585403, 0.7314236, -0.6283802, 1, 0.2941177, 0, 1,
-1.578294, 2.677144, -2.034503, 1, 0.3019608, 0, 1,
-1.574921, -0.7794614, -0.3620174, 1, 0.3058824, 0, 1,
-1.571095, -1.153788, -3.90882, 1, 0.3137255, 0, 1,
-1.570046, 1.571827, -0.6296492, 1, 0.3176471, 0, 1,
-1.56222, -0.6802981, -2.713727, 1, 0.3254902, 0, 1,
-1.558274, 1.642865, -0.710544, 1, 0.3294118, 0, 1,
-1.534972, 0.9547433, -0.1215592, 1, 0.3372549, 0, 1,
-1.52682, 0.8329546, -1.204715, 1, 0.3411765, 0, 1,
-1.517106, 0.4011593, -0.3047588, 1, 0.3490196, 0, 1,
-1.516162, -0.1412179, -0.647666, 1, 0.3529412, 0, 1,
-1.508145, 0.1152947, -0.0226691, 1, 0.3607843, 0, 1,
-1.485301, 0.01427216, -1.838855, 1, 0.3647059, 0, 1,
-1.481559, 0.048872, -0.2916266, 1, 0.372549, 0, 1,
-1.469036, -0.2932602, -3.788202, 1, 0.3764706, 0, 1,
-1.46897, 3.036866, -1.44118, 1, 0.3843137, 0, 1,
-1.465258, 0.6328794, -3.172828, 1, 0.3882353, 0, 1,
-1.459561, 0.8704082, -1.060859, 1, 0.3960784, 0, 1,
-1.448154, 1.022494, -0.895005, 1, 0.4039216, 0, 1,
-1.440698, 0.1687746, -1.899391, 1, 0.4078431, 0, 1,
-1.439474, 0.1369879, -3.091172, 1, 0.4156863, 0, 1,
-1.430274, -0.06716803, -1.495844, 1, 0.4196078, 0, 1,
-1.428486, 1.565797, -0.8686296, 1, 0.427451, 0, 1,
-1.424125, 0.7801039, -0.7220334, 1, 0.4313726, 0, 1,
-1.420543, 2.461333, 0.2173512, 1, 0.4392157, 0, 1,
-1.412091, -0.4634908, -2.159051, 1, 0.4431373, 0, 1,
-1.410382, -0.300329, -0.5905627, 1, 0.4509804, 0, 1,
-1.402201, 0.2927393, -2.202143, 1, 0.454902, 0, 1,
-1.394212, -3.16207, -1.972723, 1, 0.4627451, 0, 1,
-1.391396, -1.553704, -2.220688, 1, 0.4666667, 0, 1,
-1.38672, 0.228641, -1.229532, 1, 0.4745098, 0, 1,
-1.38414, 0.8074113, -0.4103469, 1, 0.4784314, 0, 1,
-1.374125, 0.0842787, -0.5685759, 1, 0.4862745, 0, 1,
-1.373846, 0.07767974, -1.46514, 1, 0.4901961, 0, 1,
-1.368488, 0.02516693, -1.502135, 1, 0.4980392, 0, 1,
-1.368428, 0.8689326, -0.7210809, 1, 0.5058824, 0, 1,
-1.367821, -0.2434715, -1.004791, 1, 0.509804, 0, 1,
-1.364458, 0.3419168, -2.266545, 1, 0.5176471, 0, 1,
-1.346963, 0.06791361, 0.123163, 1, 0.5215687, 0, 1,
-1.340668, 1.516523, 0.1386155, 1, 0.5294118, 0, 1,
-1.337317, -1.669307, -4.322275, 1, 0.5333334, 0, 1,
-1.336475, -1.590396, -2.360972, 1, 0.5411765, 0, 1,
-1.333953, -0.002083374, -0.8403493, 1, 0.5450981, 0, 1,
-1.332397, -0.02073514, 0.08319443, 1, 0.5529412, 0, 1,
-1.332094, 0.3615274, -1.583959, 1, 0.5568628, 0, 1,
-1.326448, 1.24761, -0.414347, 1, 0.5647059, 0, 1,
-1.325687, -0.8878925, -0.7440625, 1, 0.5686275, 0, 1,
-1.317221, 1.641246, -1.524559, 1, 0.5764706, 0, 1,
-1.30267, 0.375461, -2.044491, 1, 0.5803922, 0, 1,
-1.283442, -1.227758, -2.37358, 1, 0.5882353, 0, 1,
-1.279529, 1.438896, -3.156545, 1, 0.5921569, 0, 1,
-1.27172, -0.6629225, -1.523105, 1, 0.6, 0, 1,
-1.270345, 0.624272, -2.324015, 1, 0.6078432, 0, 1,
-1.268209, -0.2658855, -3.27927, 1, 0.6117647, 0, 1,
-1.266298, -1.718999, -3.101079, 1, 0.6196079, 0, 1,
-1.256666, -1.021095, -0.9438505, 1, 0.6235294, 0, 1,
-1.252607, -0.2083983, -2.793985, 1, 0.6313726, 0, 1,
-1.251249, 1.011094, -1.046533, 1, 0.6352941, 0, 1,
-1.248955, -1.351531, -1.118085, 1, 0.6431373, 0, 1,
-1.2449, 1.669227, -1.459727, 1, 0.6470588, 0, 1,
-1.243993, -0.6692401, -0.9136602, 1, 0.654902, 0, 1,
-1.234567, 0.2801958, -1.337264, 1, 0.6588235, 0, 1,
-1.234431, 1.123282, -0.002013478, 1, 0.6666667, 0, 1,
-1.234314, 0.2161612, -1.833536, 1, 0.6705883, 0, 1,
-1.231629, -1.187053, -0.9317162, 1, 0.6784314, 0, 1,
-1.22011, 0.1997106, -0.8231988, 1, 0.682353, 0, 1,
-1.21443, -0.2758985, -2.045825, 1, 0.6901961, 0, 1,
-1.185391, 1.487168, -1.069118, 1, 0.6941177, 0, 1,
-1.183275, -0.5736939, -1.44614, 1, 0.7019608, 0, 1,
-1.180564, 0.201288, -0.4868126, 1, 0.7098039, 0, 1,
-1.171817, 0.00793644, -1.46769, 1, 0.7137255, 0, 1,
-1.165176, 0.4198266, 0.08119552, 1, 0.7215686, 0, 1,
-1.152068, -0.9656116, -1.393935, 1, 0.7254902, 0, 1,
-1.149698, 0.241258, -1.402817, 1, 0.7333333, 0, 1,
-1.146492, 1.731883, -0.2217747, 1, 0.7372549, 0, 1,
-1.143014, -0.6728171, -1.756459, 1, 0.7450981, 0, 1,
-1.141905, -0.07966131, -3.832556, 1, 0.7490196, 0, 1,
-1.138599, 1.386009, 0.8489791, 1, 0.7568628, 0, 1,
-1.129837, -0.666321, -1.742655, 1, 0.7607843, 0, 1,
-1.111432, 0.6582606, -2.009026, 1, 0.7686275, 0, 1,
-1.108775, -0.1662961, 1.35979, 1, 0.772549, 0, 1,
-1.108308, 1.003166, -0.9914243, 1, 0.7803922, 0, 1,
-1.105469, -0.9223837, -1.917419, 1, 0.7843137, 0, 1,
-1.092907, -0.503709, -2.339298, 1, 0.7921569, 0, 1,
-1.089759, 0.312056, -2.559363, 1, 0.7960784, 0, 1,
-1.088506, -0.9234583, -1.141107, 1, 0.8039216, 0, 1,
-1.08657, -0.4361543, -0.9648009, 1, 0.8117647, 0, 1,
-1.086116, 0.7853636, -2.298953, 1, 0.8156863, 0, 1,
-1.059399, -0.2180564, -0.3972833, 1, 0.8235294, 0, 1,
-1.054514, 0.3871189, -0.1827149, 1, 0.827451, 0, 1,
-1.048705, -0.3784693, -2.014215, 1, 0.8352941, 0, 1,
-1.048698, -0.1070525, -1.585257, 1, 0.8392157, 0, 1,
-1.047003, -2.064941, -3.027753, 1, 0.8470588, 0, 1,
-1.045041, 0.2113609, -1.149239, 1, 0.8509804, 0, 1,
-1.040369, -0.5930399, -2.061252, 1, 0.8588235, 0, 1,
-1.035242, -0.9230055, -3.581046, 1, 0.8627451, 0, 1,
-1.033722, -0.06828123, -0.8650167, 1, 0.8705882, 0, 1,
-1.033156, -1.500589, -2.039263, 1, 0.8745098, 0, 1,
-1.030544, -0.7503929, -2.619363, 1, 0.8823529, 0, 1,
-1.029292, 0.8883867, -0.6816378, 1, 0.8862745, 0, 1,
-1.029273, 1.381854, -1.66874, 1, 0.8941177, 0, 1,
-1.027667, -1.297513, -0.2999328, 1, 0.8980392, 0, 1,
-1.023711, 0.6871932, -2.136325, 1, 0.9058824, 0, 1,
-1.02028, 1.230847, -2.197905, 1, 0.9137255, 0, 1,
-1.017592, -1.259604, -0.08972124, 1, 0.9176471, 0, 1,
-1.013097, -1.8426, -2.615259, 1, 0.9254902, 0, 1,
-1.009237, 0.1888339, -0.7765795, 1, 0.9294118, 0, 1,
-1.002172, 1.489483, -0.559691, 1, 0.9372549, 0, 1,
-1.001154, 0.3755905, 0.3553371, 1, 0.9411765, 0, 1,
-1.000975, -0.936188, -2.577391, 1, 0.9490196, 0, 1,
-1.000243, 0.1888348, -1.659258, 1, 0.9529412, 0, 1,
-0.9936466, 1.049373, -1.059469, 1, 0.9607843, 0, 1,
-0.9893503, -0.6474682, -1.57932, 1, 0.9647059, 0, 1,
-0.9890545, 0.4394027, 0.4844918, 1, 0.972549, 0, 1,
-0.9772843, -0.4122972, -0.3313178, 1, 0.9764706, 0, 1,
-0.9763557, -0.2788081, -0.9995146, 1, 0.9843137, 0, 1,
-0.9751137, -0.4860002, -1.278979, 1, 0.9882353, 0, 1,
-0.9751126, -0.155984, -0.3683515, 1, 0.9960784, 0, 1,
-0.9749445, 0.06233874, -2.168893, 0.9960784, 1, 0, 1,
-0.9649546, 0.9723788, -0.6189381, 0.9921569, 1, 0, 1,
-0.962633, -0.4118434, -2.261211, 0.9843137, 1, 0, 1,
-0.9620975, -0.05218157, 0.562914, 0.9803922, 1, 0, 1,
-0.9523905, 0.07233904, -1.996714, 0.972549, 1, 0, 1,
-0.9519465, 0.1452518, -3.247455, 0.9686275, 1, 0, 1,
-0.9448092, 0.7843772, -0.8857863, 0.9607843, 1, 0, 1,
-0.9393069, -2.594604, -1.615655, 0.9568627, 1, 0, 1,
-0.9375373, 0.3817903, -0.9698269, 0.9490196, 1, 0, 1,
-0.9324756, 0.736122, -3.091808, 0.945098, 1, 0, 1,
-0.9299282, 0.1383448, -3.163969, 0.9372549, 1, 0, 1,
-0.9285364, -1.093485, -1.440018, 0.9333333, 1, 0, 1,
-0.9259641, -0.3729272, -0.9495974, 0.9254902, 1, 0, 1,
-0.9228811, 0.6630056, -0.6608196, 0.9215686, 1, 0, 1,
-0.9224899, 0.8305201, -0.2719279, 0.9137255, 1, 0, 1,
-0.9210927, 2.0612, -0.5088628, 0.9098039, 1, 0, 1,
-0.9203288, 0.5080092, -0.8515546, 0.9019608, 1, 0, 1,
-0.9193197, 0.710344, -0.6582739, 0.8941177, 1, 0, 1,
-0.9096984, -1.991178, -1.744627, 0.8901961, 1, 0, 1,
-0.9040696, -0.4160682, -2.372139, 0.8823529, 1, 0, 1,
-0.903881, -0.3000571, -1.751315, 0.8784314, 1, 0, 1,
-0.9008402, 0.705937, 1.352876, 0.8705882, 1, 0, 1,
-0.8996996, 0.3685835, -2.329987, 0.8666667, 1, 0, 1,
-0.8973681, -2.808443, -4.719553, 0.8588235, 1, 0, 1,
-0.8957464, -0.9555352, -1.052824, 0.854902, 1, 0, 1,
-0.8939754, -1.457633, -2.038069, 0.8470588, 1, 0, 1,
-0.8934758, 0.4784074, 0.915564, 0.8431373, 1, 0, 1,
-0.8906248, -0.4602597, -2.037478, 0.8352941, 1, 0, 1,
-0.8903998, 1.23885, 0.5364271, 0.8313726, 1, 0, 1,
-0.8902629, 1.672691, -0.9573541, 0.8235294, 1, 0, 1,
-0.8900837, 0.5926266, -1.878289, 0.8196079, 1, 0, 1,
-0.8897696, -1.141844, -3.060479, 0.8117647, 1, 0, 1,
-0.8887914, -1.773303, -2.384084, 0.8078431, 1, 0, 1,
-0.8843653, 1.405301, -0.06237196, 0.8, 1, 0, 1,
-0.8837254, 0.7696522, 0.06799854, 0.7921569, 1, 0, 1,
-0.8802805, -1.260134, -3.021882, 0.7882353, 1, 0, 1,
-0.8738576, -0.3645536, -2.868289, 0.7803922, 1, 0, 1,
-0.8725399, -0.3013169, -2.645167, 0.7764706, 1, 0, 1,
-0.8686384, -0.7013134, -2.52874, 0.7686275, 1, 0, 1,
-0.8677415, 0.2987446, -2.247371, 0.7647059, 1, 0, 1,
-0.8667768, -1.373204, -3.577226, 0.7568628, 1, 0, 1,
-0.8563255, 1.799144, -0.2860452, 0.7529412, 1, 0, 1,
-0.8557605, -0.179542, -1.145172, 0.7450981, 1, 0, 1,
-0.8413095, -1.319378, -3.067612, 0.7411765, 1, 0, 1,
-0.8397729, 1.214769, 1.103641, 0.7333333, 1, 0, 1,
-0.8378963, 0.5999728, -0.5051709, 0.7294118, 1, 0, 1,
-0.8320228, 0.1753111, -3.107124, 0.7215686, 1, 0, 1,
-0.8264727, 0.4491074, -1.329326, 0.7176471, 1, 0, 1,
-0.8254049, -0.1507415, -2.57184, 0.7098039, 1, 0, 1,
-0.8173745, 2.979055, -0.3397181, 0.7058824, 1, 0, 1,
-0.8134276, 1.086395, -0.7917654, 0.6980392, 1, 0, 1,
-0.8081288, 1.43921, 0.7946389, 0.6901961, 1, 0, 1,
-0.8078436, 0.1908184, -1.087155, 0.6862745, 1, 0, 1,
-0.8061284, -1.32037, -2.401049, 0.6784314, 1, 0, 1,
-0.8016458, -0.5505618, -1.123879, 0.6745098, 1, 0, 1,
-0.7998469, -0.7089966, -2.920937, 0.6666667, 1, 0, 1,
-0.7996824, 2.238361, 0.7759395, 0.6627451, 1, 0, 1,
-0.7932622, 0.07898328, -1.92146, 0.654902, 1, 0, 1,
-0.7930355, -0.138939, -1.680124, 0.6509804, 1, 0, 1,
-0.7889182, -0.7453031, -2.837327, 0.6431373, 1, 0, 1,
-0.7881353, -0.87808, -0.8323327, 0.6392157, 1, 0, 1,
-0.7872121, -0.8043844, -1.142322, 0.6313726, 1, 0, 1,
-0.7854422, -0.8603696, -2.367344, 0.627451, 1, 0, 1,
-0.7805728, 0.4384465, 0.5211715, 0.6196079, 1, 0, 1,
-0.7738917, 0.5013176, -1.016356, 0.6156863, 1, 0, 1,
-0.7727834, -0.7658175, -2.592648, 0.6078432, 1, 0, 1,
-0.7723351, -0.0853324, -0.2237409, 0.6039216, 1, 0, 1,
-0.7709907, 0.3939418, -0.6659465, 0.5960785, 1, 0, 1,
-0.7706019, -0.5926764, -2.062091, 0.5882353, 1, 0, 1,
-0.7673342, 0.884115, 1.042027, 0.5843138, 1, 0, 1,
-0.7670158, 1.034023, 0.2039418, 0.5764706, 1, 0, 1,
-0.7668371, 0.7189209, -2.158947, 0.572549, 1, 0, 1,
-0.7616653, -0.8546109, -3.933679, 0.5647059, 1, 0, 1,
-0.7615135, -0.217495, -4.3417, 0.5607843, 1, 0, 1,
-0.7576861, -0.3711777, -1.952817, 0.5529412, 1, 0, 1,
-0.7550084, 0.4795972, 0.9311472, 0.5490196, 1, 0, 1,
-0.7542031, 0.5235013, -0.8309845, 0.5411765, 1, 0, 1,
-0.7494234, 0.0494011, -0.9797214, 0.5372549, 1, 0, 1,
-0.7485901, 1.620416, -0.4786984, 0.5294118, 1, 0, 1,
-0.7481162, -0.1652271, -1.776502, 0.5254902, 1, 0, 1,
-0.7453982, 0.1323662, -0.9322907, 0.5176471, 1, 0, 1,
-0.7452553, -0.3261375, -1.768536, 0.5137255, 1, 0, 1,
-0.7432527, -0.56445, -1.516981, 0.5058824, 1, 0, 1,
-0.742479, -1.334821, -3.088615, 0.5019608, 1, 0, 1,
-0.7329927, -0.9992482, -1.402081, 0.4941176, 1, 0, 1,
-0.7312955, 0.002125914, -1.942241, 0.4862745, 1, 0, 1,
-0.723626, -0.2477164, -1.847209, 0.4823529, 1, 0, 1,
-0.7205255, -0.04882701, -0.8709221, 0.4745098, 1, 0, 1,
-0.7197711, -1.64655, -1.448457, 0.4705882, 1, 0, 1,
-0.7168066, -0.1971999, -1.52789, 0.4627451, 1, 0, 1,
-0.7135792, -0.2011658, -2.224183, 0.4588235, 1, 0, 1,
-0.7017151, -0.5313961, -0.989722, 0.4509804, 1, 0, 1,
-0.697224, -0.7655021, -2.548313, 0.4470588, 1, 0, 1,
-0.6943705, -1.621228, -3.309887, 0.4392157, 1, 0, 1,
-0.6933133, 0.6836319, -1.620678, 0.4352941, 1, 0, 1,
-0.6923699, -1.202759, -1.802046, 0.427451, 1, 0, 1,
-0.6919733, -0.3301293, -3.087507, 0.4235294, 1, 0, 1,
-0.6856089, -0.2339128, -2.770263, 0.4156863, 1, 0, 1,
-0.6823828, 0.9444846, -1.034113, 0.4117647, 1, 0, 1,
-0.6821985, 0.2243419, -1.598174, 0.4039216, 1, 0, 1,
-0.6793582, 0.3874926, -2.474385, 0.3960784, 1, 0, 1,
-0.6684632, 0.1769842, -0.8432038, 0.3921569, 1, 0, 1,
-0.6653799, 0.2400973, -1.011908, 0.3843137, 1, 0, 1,
-0.6612764, 0.1336498, -3.000111, 0.3803922, 1, 0, 1,
-0.6575317, 0.2030736, -2.135091, 0.372549, 1, 0, 1,
-0.6505274, -1.763861, -2.366835, 0.3686275, 1, 0, 1,
-0.6453778, 0.1585836, -2.315284, 0.3607843, 1, 0, 1,
-0.6411381, 2.508354, 0.5859165, 0.3568628, 1, 0, 1,
-0.6264312, 1.61345, -0.5646972, 0.3490196, 1, 0, 1,
-0.62022, -0.2030123, -0.868839, 0.345098, 1, 0, 1,
-0.6190134, 0.2603414, -1.477194, 0.3372549, 1, 0, 1,
-0.6122057, -0.8007046, -2.721351, 0.3333333, 1, 0, 1,
-0.6091253, 1.534656, 0.7560633, 0.3254902, 1, 0, 1,
-0.6036515, 0.08186792, -1.48132, 0.3215686, 1, 0, 1,
-0.6028059, 0.357573, -1.151701, 0.3137255, 1, 0, 1,
-0.5988032, -0.1085402, -2.357639, 0.3098039, 1, 0, 1,
-0.5956239, 0.07570101, -1.582484, 0.3019608, 1, 0, 1,
-0.5924159, -0.3175104, -2.109586, 0.2941177, 1, 0, 1,
-0.5802667, 0.567469, -1.575586, 0.2901961, 1, 0, 1,
-0.5782071, -0.164917, -2.822784, 0.282353, 1, 0, 1,
-0.5768441, 1.987328, -0.1375031, 0.2784314, 1, 0, 1,
-0.5767786, 0.7003173, -1.228056, 0.2705882, 1, 0, 1,
-0.5762913, 0.5746138, -2.33195, 0.2666667, 1, 0, 1,
-0.575559, 1.864702, -1.124638, 0.2588235, 1, 0, 1,
-0.5691543, 0.013085, -3.449717, 0.254902, 1, 0, 1,
-0.5688312, -0.1778941, -1.874046, 0.2470588, 1, 0, 1,
-0.5680421, -0.1943269, -1.682188, 0.2431373, 1, 0, 1,
-0.5660287, 1.140493, 0.2820637, 0.2352941, 1, 0, 1,
-0.5650942, -0.2639364, -1.585692, 0.2313726, 1, 0, 1,
-0.5646375, 0.6315446, -1.152521, 0.2235294, 1, 0, 1,
-0.5621721, 0.7538514, -1.28503, 0.2196078, 1, 0, 1,
-0.560963, 2.083828, -0.09121573, 0.2117647, 1, 0, 1,
-0.5609087, 1.179835, -1.131557, 0.2078431, 1, 0, 1,
-0.5562298, -0.9387935, -5.851364, 0.2, 1, 0, 1,
-0.5511667, 0.2508429, 0.386944, 0.1921569, 1, 0, 1,
-0.5491151, 0.1881666, -0.7872499, 0.1882353, 1, 0, 1,
-0.54678, 1.21309, 1.881142, 0.1803922, 1, 0, 1,
-0.5459914, -0.5746922, -3.111674, 0.1764706, 1, 0, 1,
-0.543515, 1.061499, 0.2013414, 0.1686275, 1, 0, 1,
-0.543026, 0.1612698, -0.9535381, 0.1647059, 1, 0, 1,
-0.5368456, -1.065737, -0.9425895, 0.1568628, 1, 0, 1,
-0.5338567, 0.1055359, -0.2416515, 0.1529412, 1, 0, 1,
-0.5290716, -1.561928, -1.961105, 0.145098, 1, 0, 1,
-0.5290428, 0.109199, -1.418862, 0.1411765, 1, 0, 1,
-0.5207499, 1.861529, -0.3990074, 0.1333333, 1, 0, 1,
-0.5133478, -1.105449, -2.690861, 0.1294118, 1, 0, 1,
-0.5127289, 0.2889846, -0.2838851, 0.1215686, 1, 0, 1,
-0.5008777, 1.344633, -1.748689, 0.1176471, 1, 0, 1,
-0.4995745, -0.2422081, -0.7638087, 0.1098039, 1, 0, 1,
-0.4994811, 1.191181, -0.6124098, 0.1058824, 1, 0, 1,
-0.4992756, 0.2801104, -0.8585721, 0.09803922, 1, 0, 1,
-0.4970479, 1.260434, -0.7892613, 0.09019608, 1, 0, 1,
-0.4955652, 0.0914258, 0.2348358, 0.08627451, 1, 0, 1,
-0.4945704, 0.2236969, -0.7742075, 0.07843138, 1, 0, 1,
-0.4944738, 0.2010363, -0.4746571, 0.07450981, 1, 0, 1,
-0.4942373, -1.580286, -2.213625, 0.06666667, 1, 0, 1,
-0.4937828, -1.327502, -5.024055, 0.0627451, 1, 0, 1,
-0.4864909, -1.087484, -2.032966, 0.05490196, 1, 0, 1,
-0.4855999, 0.4901655, 0.1134115, 0.05098039, 1, 0, 1,
-0.4851426, -0.4724075, -2.63406, 0.04313726, 1, 0, 1,
-0.4844561, 0.8169963, -0.2768487, 0.03921569, 1, 0, 1,
-0.4782101, -1.656566, -2.325126, 0.03137255, 1, 0, 1,
-0.4765213, -0.7300379, -0.13494, 0.02745098, 1, 0, 1,
-0.4752406, 0.5528597, -0.8591338, 0.01960784, 1, 0, 1,
-0.475144, -0.902155, -3.64112, 0.01568628, 1, 0, 1,
-0.4732011, 0.3648192, -1.39665, 0.007843138, 1, 0, 1,
-0.4711427, -0.2044437, -1.126204, 0.003921569, 1, 0, 1,
-0.4664141, 1.60251, -0.5425338, 0, 1, 0.003921569, 1,
-0.464654, 0.1888535, -0.8568727, 0, 1, 0.01176471, 1,
-0.4622428, 0.9537452, -0.6343098, 0, 1, 0.01568628, 1,
-0.4617798, -0.0377365, -1.003594, 0, 1, 0.02352941, 1,
-0.4583254, 1.227465, -0.2947366, 0, 1, 0.02745098, 1,
-0.4574855, 0.01363149, -0.6112647, 0, 1, 0.03529412, 1,
-0.4566987, 0.407292, -0.7774332, 0, 1, 0.03921569, 1,
-0.4546147, 0.6185361, -0.3876452, 0, 1, 0.04705882, 1,
-0.4470622, 0.394421, -0.8185161, 0, 1, 0.05098039, 1,
-0.4459455, -1.49813, -1.776479, 0, 1, 0.05882353, 1,
-0.4453, 0.7684579, -0.1112785, 0, 1, 0.0627451, 1,
-0.4451956, -0.3789982, -2.285747, 0, 1, 0.07058824, 1,
-0.4428393, -0.650243, -2.887151, 0, 1, 0.07450981, 1,
-0.4422233, -1.104114, -2.289774, 0, 1, 0.08235294, 1,
-0.439393, -1.091159, -2.664824, 0, 1, 0.08627451, 1,
-0.4347377, 1.160464, 0.3491974, 0, 1, 0.09411765, 1,
-0.43455, -1.315264, -1.620611, 0, 1, 0.1019608, 1,
-0.4213873, -0.7528484, -1.618243, 0, 1, 0.1058824, 1,
-0.4182932, -0.3034037, -3.176709, 0, 1, 0.1137255, 1,
-0.4173065, 1.565591, -0.1919568, 0, 1, 0.1176471, 1,
-0.4163124, -0.6672724, -3.929719, 0, 1, 0.1254902, 1,
-0.4159419, -0.3713421, -2.444081, 0, 1, 0.1294118, 1,
-0.4098832, -1.39133, -2.793381, 0, 1, 0.1372549, 1,
-0.4096172, -0.8809513, -1.57517, 0, 1, 0.1411765, 1,
-0.4094908, -0.727325, -3.242013, 0, 1, 0.1490196, 1,
-0.408634, -1.443513, -3.372068, 0, 1, 0.1529412, 1,
-0.4070936, -1.072219, -3.135868, 0, 1, 0.1607843, 1,
-0.4060301, 1.488886, -0.5846299, 0, 1, 0.1647059, 1,
-0.4042919, -0.9715646, -4.089701, 0, 1, 0.172549, 1,
-0.4032343, -2.136231, -2.466963, 0, 1, 0.1764706, 1,
-0.3997485, 0.7626807, -1.678985, 0, 1, 0.1843137, 1,
-0.3979596, 1.419405, 0.1095253, 0, 1, 0.1882353, 1,
-0.3906452, 1.057445, -2.162581, 0, 1, 0.1960784, 1,
-0.3892918, 0.1296416, -0.09411807, 0, 1, 0.2039216, 1,
-0.3892577, -0.7042792, -3.042253, 0, 1, 0.2078431, 1,
-0.3892334, -0.9268991, -2.726139, 0, 1, 0.2156863, 1,
-0.3887843, -0.1499962, -2.220132, 0, 1, 0.2196078, 1,
-0.3866644, -0.9464739, -4.643523, 0, 1, 0.227451, 1,
-0.3866084, 0.868682, -1.219654, 0, 1, 0.2313726, 1,
-0.3862057, 0.6831185, -1.281516, 0, 1, 0.2392157, 1,
-0.3842751, -1.263273, -2.538255, 0, 1, 0.2431373, 1,
-0.3840227, 0.0636667, -2.049442, 0, 1, 0.2509804, 1,
-0.3823763, 1.304073, 1.324776, 0, 1, 0.254902, 1,
-0.377532, 0.2523861, -0.5989062, 0, 1, 0.2627451, 1,
-0.3767284, -2.016228, -2.349296, 0, 1, 0.2666667, 1,
-0.3746651, 1.363174, -1.430799, 0, 1, 0.2745098, 1,
-0.3715564, 0.483443, -1.05554, 0, 1, 0.2784314, 1,
-0.3685439, -0.2343068, -2.65615, 0, 1, 0.2862745, 1,
-0.3671, 0.3571663, -0.859987, 0, 1, 0.2901961, 1,
-0.3666134, 1.938327, -0.4846114, 0, 1, 0.2980392, 1,
-0.3628648, 1.125106, 1.114231, 0, 1, 0.3058824, 1,
-0.3622628, 1.644782, -2.120755, 0, 1, 0.3098039, 1,
-0.3620884, 0.159999, -0.4995503, 0, 1, 0.3176471, 1,
-0.3597631, -0.7894782, -3.345933, 0, 1, 0.3215686, 1,
-0.3585031, 0.4343841, -0.4932433, 0, 1, 0.3294118, 1,
-0.3566888, -0.6314024, -0.4791397, 0, 1, 0.3333333, 1,
-0.3515823, -0.04576538, -1.919002, 0, 1, 0.3411765, 1,
-0.3494098, 1.482695, -0.1080593, 0, 1, 0.345098, 1,
-0.3490082, -0.8339862, -1.233375, 0, 1, 0.3529412, 1,
-0.3311098, -1.223984, -4.903391, 0, 1, 0.3568628, 1,
-0.3281621, -0.3625536, -2.565574, 0, 1, 0.3647059, 1,
-0.3237804, -0.4966139, -0.7761925, 0, 1, 0.3686275, 1,
-0.3225374, 0.9561312, 0.1362871, 0, 1, 0.3764706, 1,
-0.3206528, -0.7803315, -2.911847, 0, 1, 0.3803922, 1,
-0.3117745, -1.636771, -2.689317, 0, 1, 0.3882353, 1,
-0.3117557, 1.196334, -0.7346229, 0, 1, 0.3921569, 1,
-0.3112595, -0.6283675, -0.981134, 0, 1, 0.4, 1,
-0.3094764, 1.154274, 0.09809194, 0, 1, 0.4078431, 1,
-0.309088, -1.281568, -3.294499, 0, 1, 0.4117647, 1,
-0.3087545, -1.13562, -1.989311, 0, 1, 0.4196078, 1,
-0.3000327, 2.835508, -0.2783436, 0, 1, 0.4235294, 1,
-0.2993526, -0.1317034, -0.8094341, 0, 1, 0.4313726, 1,
-0.2986532, 0.09156572, -1.664076, 0, 1, 0.4352941, 1,
-0.2978049, -0.4130515, -2.591716, 0, 1, 0.4431373, 1,
-0.2973602, 0.953793, -0.4615161, 0, 1, 0.4470588, 1,
-0.2926713, -0.4711103, -3.073008, 0, 1, 0.454902, 1,
-0.2903803, -0.8427391, -2.132693, 0, 1, 0.4588235, 1,
-0.2874329, 0.2096575, -1.83243, 0, 1, 0.4666667, 1,
-0.2812659, 0.4873948, -1.732364, 0, 1, 0.4705882, 1,
-0.2803071, -2.17554, -3.634525, 0, 1, 0.4784314, 1,
-0.2802973, -0.4991722, -2.644107, 0, 1, 0.4823529, 1,
-0.2801227, -0.09463623, -2.109977, 0, 1, 0.4901961, 1,
-0.2786527, -0.9522704, -2.747802, 0, 1, 0.4941176, 1,
-0.2769979, 1.844597, 0.7284483, 0, 1, 0.5019608, 1,
-0.2669174, -0.1831917, -2.622368, 0, 1, 0.509804, 1,
-0.2659202, -1.711327, -3.3103, 0, 1, 0.5137255, 1,
-0.2569103, 0.7252722, -0.030133, 0, 1, 0.5215687, 1,
-0.2520271, -0.5875692, -2.888136, 0, 1, 0.5254902, 1,
-0.2519338, -0.2558278, -1.104298, 0, 1, 0.5333334, 1,
-0.2502142, -0.9561023, -0.7017213, 0, 1, 0.5372549, 1,
-0.2487082, -0.2929548, -1.307334, 0, 1, 0.5450981, 1,
-0.2482885, -1.417516, -2.12402, 0, 1, 0.5490196, 1,
-0.2480476, -0.1828084, -3.286244, 0, 1, 0.5568628, 1,
-0.2476029, -1.223866, -1.002964, 0, 1, 0.5607843, 1,
-0.2434135, 0.6154715, -0.9547443, 0, 1, 0.5686275, 1,
-0.2431843, -0.608062, -2.942103, 0, 1, 0.572549, 1,
-0.2376353, -1.012564, -3.179273, 0, 1, 0.5803922, 1,
-0.2366551, -0.5063261, -2.069934, 0, 1, 0.5843138, 1,
-0.2261349, -1.652168, -1.06617, 0, 1, 0.5921569, 1,
-0.2248479, 0.3898254, 0.4814658, 0, 1, 0.5960785, 1,
-0.2246078, 2.064128, -0.7258534, 0, 1, 0.6039216, 1,
-0.2200055, -1.288406, -1.367779, 0, 1, 0.6117647, 1,
-0.2175055, 0.5052046, -0.7926958, 0, 1, 0.6156863, 1,
-0.2140909, 0.808059, -0.8342914, 0, 1, 0.6235294, 1,
-0.213548, -0.1770454, -3.407748, 0, 1, 0.627451, 1,
-0.2111691, 0.373502, -2.348753, 0, 1, 0.6352941, 1,
-0.2081017, -0.7647349, -2.029493, 0, 1, 0.6392157, 1,
-0.2061021, 0.341169, -0.5783067, 0, 1, 0.6470588, 1,
-0.2056507, -0.5710765, -2.331823, 0, 1, 0.6509804, 1,
-0.2044542, 1.075693, -0.01292407, 0, 1, 0.6588235, 1,
-0.2038725, -0.1647941, -1.932169, 0, 1, 0.6627451, 1,
-0.1920919, -0.4272715, -4.054426, 0, 1, 0.6705883, 1,
-0.1882203, -0.7545767, -0.3073635, 0, 1, 0.6745098, 1,
-0.1861727, -0.09697253, -2.677269, 0, 1, 0.682353, 1,
-0.1822698, -2.271815, -2.523686, 0, 1, 0.6862745, 1,
-0.1798668, 0.5684742, -0.9929887, 0, 1, 0.6941177, 1,
-0.1795233, -0.2677676, -3.449208, 0, 1, 0.7019608, 1,
-0.178612, 0.6194968, -1.101023, 0, 1, 0.7058824, 1,
-0.1783707, 0.2901536, -2.164114, 0, 1, 0.7137255, 1,
-0.1764011, -0.7047756, -2.521835, 0, 1, 0.7176471, 1,
-0.1737519, 0.2554657, 0.4897171, 0, 1, 0.7254902, 1,
-0.1721134, 0.7146461, -0.6841347, 0, 1, 0.7294118, 1,
-0.1689113, 0.9317051, -0.6462888, 0, 1, 0.7372549, 1,
-0.1670096, 1.932849, 0.1160404, 0, 1, 0.7411765, 1,
-0.1627773, 2.060709, 0.5347295, 0, 1, 0.7490196, 1,
-0.1598454, -2.129271, -3.499922, 0, 1, 0.7529412, 1,
-0.1582814, 0.4781014, 0.4347079, 0, 1, 0.7607843, 1,
-0.1576026, -1.00805, -1.76444, 0, 1, 0.7647059, 1,
-0.157347, 0.1824758, -0.3924296, 0, 1, 0.772549, 1,
-0.1562569, -1.620857, -1.755449, 0, 1, 0.7764706, 1,
-0.1538959, -0.5826649, -0.9456317, 0, 1, 0.7843137, 1,
-0.1509013, 0.1862953, -1.016283, 0, 1, 0.7882353, 1,
-0.1464447, 0.1303413, -0.1981921, 0, 1, 0.7960784, 1,
-0.14142, 0.3939271, -1.653815, 0, 1, 0.8039216, 1,
-0.1384318, -0.7897862, -2.783768, 0, 1, 0.8078431, 1,
-0.135656, -0.5433683, -1.848642, 0, 1, 0.8156863, 1,
-0.1314378, -0.0977559, -1.538322, 0, 1, 0.8196079, 1,
-0.1302695, 0.4331296, -1.239769, 0, 1, 0.827451, 1,
-0.1300098, 0.7579196, 0.009628399, 0, 1, 0.8313726, 1,
-0.1297921, 0.1302636, -0.7305645, 0, 1, 0.8392157, 1,
-0.1289579, 1.713023, -0.7097918, 0, 1, 0.8431373, 1,
-0.1259436, 0.5369786, -0.7510384, 0, 1, 0.8509804, 1,
-0.1230967, -1.458323, -3.346627, 0, 1, 0.854902, 1,
-0.1212664, 1.126014, 1.526129, 0, 1, 0.8627451, 1,
-0.1182173, -1.215768, -3.0862, 0, 1, 0.8666667, 1,
-0.117076, 1.213012, -0.4376956, 0, 1, 0.8745098, 1,
-0.1112264, 0.2321094, -0.4882545, 0, 1, 0.8784314, 1,
-0.1089561, 0.4278241, 0.8481208, 0, 1, 0.8862745, 1,
-0.1082056, -0.06749601, -2.556182, 0, 1, 0.8901961, 1,
-0.1021576, 0.3322087, 0.1364287, 0, 1, 0.8980392, 1,
-0.09860756, -0.6633134, -1.959712, 0, 1, 0.9058824, 1,
-0.0973414, 0.5241532, -0.4914232, 0, 1, 0.9098039, 1,
-0.09484173, 0.1953902, 0.2588339, 0, 1, 0.9176471, 1,
-0.09397344, 0.7172198, 0.05425782, 0, 1, 0.9215686, 1,
-0.09131361, 1.718684, 0.05842171, 0, 1, 0.9294118, 1,
-0.09121024, -1.484371, -3.775136, 0, 1, 0.9333333, 1,
-0.08625527, -0.0001849544, -0.7671989, 0, 1, 0.9411765, 1,
-0.08150523, -0.599142, -3.690383, 0, 1, 0.945098, 1,
-0.08141987, -1.520671, -2.349785, 0, 1, 0.9529412, 1,
-0.07174922, 0.1324772, 0.2183931, 0, 1, 0.9568627, 1,
-0.07097922, 0.6298118, 1.024099, 0, 1, 0.9647059, 1,
-0.07034634, 1.402933, 0.1342688, 0, 1, 0.9686275, 1,
-0.06821105, -0.09179275, 0.05486618, 0, 1, 0.9764706, 1,
-0.06416188, 1.143693, -1.025728, 0, 1, 0.9803922, 1,
-0.06195595, 0.222339, -0.06723668, 0, 1, 0.9882353, 1,
-0.06093012, -1.131416, -2.473136, 0, 1, 0.9921569, 1,
-0.05632975, 1.443013, -0.2372897, 0, 1, 1, 1,
-0.05409501, 0.472837, -1.95982, 0, 0.9921569, 1, 1,
-0.05335293, 0.6447491, -0.7322964, 0, 0.9882353, 1, 1,
-0.05200385, -0.3789474, -1.31743, 0, 0.9803922, 1, 1,
-0.05079691, 1.969699, 1.404296, 0, 0.9764706, 1, 1,
-0.0504309, -0.02296595, -2.155952, 0, 0.9686275, 1, 1,
-0.0485865, 0.9451171, -0.03268505, 0, 0.9647059, 1, 1,
-0.04694841, 0.5128914, 0.2443853, 0, 0.9568627, 1, 1,
-0.04443008, -0.05381635, -2.512759, 0, 0.9529412, 1, 1,
-0.04341785, -0.07004838, -2.494409, 0, 0.945098, 1, 1,
-0.04132568, 0.1410944, -0.09671007, 0, 0.9411765, 1, 1,
-0.04094197, -1.587117, -3.398067, 0, 0.9333333, 1, 1,
-0.03221451, -2.477813, -2.623456, 0, 0.9294118, 1, 1,
-0.02952448, 0.05913024, 0.2356987, 0, 0.9215686, 1, 1,
-0.02939714, 0.002149867, -1.31093, 0, 0.9176471, 1, 1,
-0.0272028, -0.2420525, -2.667126, 0, 0.9098039, 1, 1,
-0.02621936, 0.1736485, -1.633654, 0, 0.9058824, 1, 1,
-0.02487648, -0.04906515, -3.478168, 0, 0.8980392, 1, 1,
-0.02075207, 0.1339752, 0.5470217, 0, 0.8901961, 1, 1,
-0.02061395, -1.071909, -3.158535, 0, 0.8862745, 1, 1,
-0.01836691, 0.2711171, -1.00365, 0, 0.8784314, 1, 1,
-0.01662105, -2.481988, -1.234168, 0, 0.8745098, 1, 1,
-0.01483412, -1.57246, -4.428498, 0, 0.8666667, 1, 1,
-0.01387912, 1.102633, -0.3118744, 0, 0.8627451, 1, 1,
-0.01278159, 0.9550627, -1.16309, 0, 0.854902, 1, 1,
-0.01192512, -0.3941602, -2.96905, 0, 0.8509804, 1, 1,
-0.0115882, -0.7601388, -3.69072, 0, 0.8431373, 1, 1,
-0.01055947, -0.1919581, -2.15029, 0, 0.8392157, 1, 1,
-0.007347572, 0.6646958, -0.6319967, 0, 0.8313726, 1, 1,
-0.002659896, 0.7123494, -0.1906674, 0, 0.827451, 1, 1,
0.00697108, -1.306474, 3.689178, 0, 0.8196079, 1, 1,
0.008175951, -0.7173076, 2.873515, 0, 0.8156863, 1, 1,
0.01720152, -0.3938678, 2.481272, 0, 0.8078431, 1, 1,
0.01765399, 0.09511546, 0.08068545, 0, 0.8039216, 1, 1,
0.0210373, 1.83591, -0.7497215, 0, 0.7960784, 1, 1,
0.02399178, 0.8611402, -0.9419521, 0, 0.7882353, 1, 1,
0.02400327, -0.06840886, 2.3369, 0, 0.7843137, 1, 1,
0.02452514, 0.1941939, 0.6454883, 0, 0.7764706, 1, 1,
0.03107398, -1.222416, 3.334641, 0, 0.772549, 1, 1,
0.03948452, -0.4222549, 4.844096, 0, 0.7647059, 1, 1,
0.03968458, 0.5932269, 0.7750664, 0, 0.7607843, 1, 1,
0.04237141, 0.1105016, 1.653268, 0, 0.7529412, 1, 1,
0.04272373, 0.2458155, -0.8578987, 0, 0.7490196, 1, 1,
0.04333129, -1.428476, 3.229995, 0, 0.7411765, 1, 1,
0.04576201, -1.130865, 3.925261, 0, 0.7372549, 1, 1,
0.04766652, -0.3605905, 3.724255, 0, 0.7294118, 1, 1,
0.04813915, -1.047305, 3.573226, 0, 0.7254902, 1, 1,
0.05017131, -0.2082612, 1.117783, 0, 0.7176471, 1, 1,
0.05586543, 0.6390641, 1.049416, 0, 0.7137255, 1, 1,
0.05758205, 0.07740185, -0.53949, 0, 0.7058824, 1, 1,
0.05763239, -0.2355534, 2.777827, 0, 0.6980392, 1, 1,
0.06156366, -1.086222, 3.499847, 0, 0.6941177, 1, 1,
0.06423544, 0.4668595, 0.6615418, 0, 0.6862745, 1, 1,
0.064836, -0.09631621, 2.628379, 0, 0.682353, 1, 1,
0.06490378, 0.2133036, -0.5793404, 0, 0.6745098, 1, 1,
0.06829259, 1.690551, -1.322114, 0, 0.6705883, 1, 1,
0.06908012, 0.3086531, -0.06715176, 0, 0.6627451, 1, 1,
0.07034662, 0.1824318, 0.7862053, 0, 0.6588235, 1, 1,
0.07098188, 0.2126652, -0.4285394, 0, 0.6509804, 1, 1,
0.07719078, -0.5411391, 4.69749, 0, 0.6470588, 1, 1,
0.07937618, 1.053681, 0.8623852, 0, 0.6392157, 1, 1,
0.08543891, -0.8667777, 4.637084, 0, 0.6352941, 1, 1,
0.08697853, 0.5562265, 0.5017892, 0, 0.627451, 1, 1,
0.08844954, -0.3405833, 1.877073, 0, 0.6235294, 1, 1,
0.08897079, -0.4679784, 2.650946, 0, 0.6156863, 1, 1,
0.0971453, -0.03997957, 1.165807, 0, 0.6117647, 1, 1,
0.09827425, 0.8990127, 0.5078837, 0, 0.6039216, 1, 1,
0.1007773, -0.4070158, 1.274107, 0, 0.5960785, 1, 1,
0.1025016, 0.6234034, -2.015407, 0, 0.5921569, 1, 1,
0.1037345, -0.1074, 2.563903, 0, 0.5843138, 1, 1,
0.1044407, 0.8946649, -0.7726868, 0, 0.5803922, 1, 1,
0.1048584, 0.2608427, 2.677905, 0, 0.572549, 1, 1,
0.1066252, 0.9501823, -1.70814, 0, 0.5686275, 1, 1,
0.1142379, 0.3351991, 1.288011, 0, 0.5607843, 1, 1,
0.1220706, -1.54674, 3.628869, 0, 0.5568628, 1, 1,
0.127126, -1.038095, 3.225374, 0, 0.5490196, 1, 1,
0.1291008, -1.938285, 3.392333, 0, 0.5450981, 1, 1,
0.129348, -0.1678968, 2.949953, 0, 0.5372549, 1, 1,
0.1322128, -0.1334191, 1.998397, 0, 0.5333334, 1, 1,
0.1322503, -0.0811667, 2.502892, 0, 0.5254902, 1, 1,
0.1323046, 0.8559864, 0.6355473, 0, 0.5215687, 1, 1,
0.1325395, -0.358899, 4.112667, 0, 0.5137255, 1, 1,
0.1332258, 0.6378946, 2.491982, 0, 0.509804, 1, 1,
0.133916, 1.070632, -0.3374864, 0, 0.5019608, 1, 1,
0.1351067, -0.0824216, 1.23069, 0, 0.4941176, 1, 1,
0.1383105, 0.2134073, 1.095434, 0, 0.4901961, 1, 1,
0.1417572, 1.602085, 1.025819, 0, 0.4823529, 1, 1,
0.1420994, 0.9158554, 0.730759, 0, 0.4784314, 1, 1,
0.1442144, -1.517414, 2.895161, 0, 0.4705882, 1, 1,
0.1448648, -0.4393885, 1.732978, 0, 0.4666667, 1, 1,
0.1501389, -1.458114, 3.502108, 0, 0.4588235, 1, 1,
0.1510761, -2.111915, 3.077008, 0, 0.454902, 1, 1,
0.1534461, -0.252981, 1.532187, 0, 0.4470588, 1, 1,
0.1538688, -0.3961632, 3.535583, 0, 0.4431373, 1, 1,
0.1622858, 1.323839, -0.7277294, 0, 0.4352941, 1, 1,
0.1647903, 0.383316, 0.6309018, 0, 0.4313726, 1, 1,
0.1649615, 0.9273057, 1.567948, 0, 0.4235294, 1, 1,
0.1653838, 0.1592286, 2.045586, 0, 0.4196078, 1, 1,
0.1771752, 0.2295849, 0.363716, 0, 0.4117647, 1, 1,
0.1774004, -0.8738773, 3.187486, 0, 0.4078431, 1, 1,
0.1787034, -0.4097987, 2.914303, 0, 0.4, 1, 1,
0.1800488, -1.624409, 2.50519, 0, 0.3921569, 1, 1,
0.1819843, 0.8004891, 1.089275, 0, 0.3882353, 1, 1,
0.1837726, -0.7661293, 3.558193, 0, 0.3803922, 1, 1,
0.184247, -0.2012032, 3.388926, 0, 0.3764706, 1, 1,
0.1863057, 0.3708306, 1.652004, 0, 0.3686275, 1, 1,
0.1872644, 0.7722704, -0.4588967, 0, 0.3647059, 1, 1,
0.1909387, -0.7720306, 3.886222, 0, 0.3568628, 1, 1,
0.1934134, 0.6707847, 0.5209029, 0, 0.3529412, 1, 1,
0.1936682, 0.3179001, 0.1561106, 0, 0.345098, 1, 1,
0.1955814, 0.79075, 0.5600193, 0, 0.3411765, 1, 1,
0.1955839, 3.890775, -1.230232, 0, 0.3333333, 1, 1,
0.1958813, 0.9627163, -1.483661, 0, 0.3294118, 1, 1,
0.1980661, 1.232473, 0.6349108, 0, 0.3215686, 1, 1,
0.199981, -1.532248, 2.329164, 0, 0.3176471, 1, 1,
0.2079131, -0.1326223, 2.751555, 0, 0.3098039, 1, 1,
0.2079346, -0.6141737, 3.939131, 0, 0.3058824, 1, 1,
0.2081639, -1.609265, 2.833026, 0, 0.2980392, 1, 1,
0.2097789, -0.05765157, 3.251395, 0, 0.2901961, 1, 1,
0.2120837, -0.8722256, 2.839067, 0, 0.2862745, 1, 1,
0.21217, 0.2332894, -0.6554761, 0, 0.2784314, 1, 1,
0.2141497, 1.761426, 0.3225547, 0, 0.2745098, 1, 1,
0.2143337, -0.3134823, 2.380146, 0, 0.2666667, 1, 1,
0.2161652, 0.03172025, 2.074267, 0, 0.2627451, 1, 1,
0.2174351, -0.5816438, 2.876374, 0, 0.254902, 1, 1,
0.2196127, -0.511516, 1.255654, 0, 0.2509804, 1, 1,
0.2199704, 1.497183, 1.082224, 0, 0.2431373, 1, 1,
0.2236144, 1.452832, 0.4366446, 0, 0.2392157, 1, 1,
0.2251294, -1.345415, 2.580018, 0, 0.2313726, 1, 1,
0.2296163, -0.3244239, 2.082339, 0, 0.227451, 1, 1,
0.2378478, 0.6229871, -0.02075021, 0, 0.2196078, 1, 1,
0.2408114, 1.943197, -1.675547, 0, 0.2156863, 1, 1,
0.247717, 0.1435375, 2.312264, 0, 0.2078431, 1, 1,
0.2488635, 1.320648, -1.883022, 0, 0.2039216, 1, 1,
0.2489332, -0.5631, 2.3144, 0, 0.1960784, 1, 1,
0.2493459, -0.3366903, 2.340989, 0, 0.1882353, 1, 1,
0.2496296, 0.8262517, -0.3492473, 0, 0.1843137, 1, 1,
0.2541593, 0.1039675, 2.252444, 0, 0.1764706, 1, 1,
0.2557855, -1.461769, 2.311606, 0, 0.172549, 1, 1,
0.2560374, -1.531031, 1.946245, 0, 0.1647059, 1, 1,
0.2563564, 0.6682861, 1.524891, 0, 0.1607843, 1, 1,
0.2692205, 0.4184231, -0.354365, 0, 0.1529412, 1, 1,
0.2788613, -1.295366, 3.435875, 0, 0.1490196, 1, 1,
0.2789615, 0.02625619, 1.899439, 0, 0.1411765, 1, 1,
0.2793076, -1.721827, 5.127792, 0, 0.1372549, 1, 1,
0.2813328, -1.747273, 2.151432, 0, 0.1294118, 1, 1,
0.2832486, -2.063126, 2.003191, 0, 0.1254902, 1, 1,
0.2935241, -0.1995823, 3.735067, 0, 0.1176471, 1, 1,
0.2980211, 0.4509198, 0.2091238, 0, 0.1137255, 1, 1,
0.3018956, -0.5736728, 1.859176, 0, 0.1058824, 1, 1,
0.3032483, 0.4389665, 1.096835, 0, 0.09803922, 1, 1,
0.3033772, 1.207034, -0.9555491, 0, 0.09411765, 1, 1,
0.3052324, -0.4779162, 3.376234, 0, 0.08627451, 1, 1,
0.3064942, -0.1662258, 2.514343, 0, 0.08235294, 1, 1,
0.312181, 1.353168, -0.7098349, 0, 0.07450981, 1, 1,
0.317766, 0.7644978, 0.3910497, 0, 0.07058824, 1, 1,
0.3226322, -0.5152264, 2.384055, 0, 0.0627451, 1, 1,
0.3246513, 0.5699814, -0.03548345, 0, 0.05882353, 1, 1,
0.3249676, -0.285368, 1.88275, 0, 0.05098039, 1, 1,
0.3255718, -1.533072, 3.735968, 0, 0.04705882, 1, 1,
0.3331281, 0.3843251, -0.3314176, 0, 0.03921569, 1, 1,
0.3366749, -0.5047137, 0.8128626, 0, 0.03529412, 1, 1,
0.3407573, -0.07150764, 2.578824, 0, 0.02745098, 1, 1,
0.3466875, 1.043461, -0.4356901, 0, 0.02352941, 1, 1,
0.357777, 0.4494717, 2.427246, 0, 0.01568628, 1, 1,
0.364888, 0.003154349, 1.334192, 0, 0.01176471, 1, 1,
0.3698534, -0.7340789, 3.699285, 0, 0.003921569, 1, 1,
0.3711559, 0.8908631, 0.07792199, 0.003921569, 0, 1, 1,
0.3740887, -0.2518317, 2.370051, 0.007843138, 0, 1, 1,
0.3756849, 2.035221, 1.081287, 0.01568628, 0, 1, 1,
0.3772522, 0.1653401, 1.869656, 0.01960784, 0, 1, 1,
0.3800342, -0.988288, 3.562382, 0.02745098, 0, 1, 1,
0.3819738, 0.4917725, 0.3031628, 0.03137255, 0, 1, 1,
0.3857076, 0.9644136, 0.7949671, 0.03921569, 0, 1, 1,
0.3877054, 0.9147054, 0.1512495, 0.04313726, 0, 1, 1,
0.3890299, -0.6701403, 3.531234, 0.05098039, 0, 1, 1,
0.3892964, -0.09058694, 3.8282, 0.05490196, 0, 1, 1,
0.3893129, -2.148767, 3.57569, 0.0627451, 0, 1, 1,
0.3896763, -0.3071786, 2.393504, 0.06666667, 0, 1, 1,
0.3985717, 1.18765, 0.0366875, 0.07450981, 0, 1, 1,
0.3997924, 0.5894278, 2.076214, 0.07843138, 0, 1, 1,
0.4026875, -0.5518677, 3.967411, 0.08627451, 0, 1, 1,
0.405061, -1.115313, 2.20557, 0.09019608, 0, 1, 1,
0.4093038, -0.3471324, 0.9815546, 0.09803922, 0, 1, 1,
0.414153, -1.439088, 2.270379, 0.1058824, 0, 1, 1,
0.4159673, 0.0688782, 2.518099, 0.1098039, 0, 1, 1,
0.417028, 1.370629, 1.145484, 0.1176471, 0, 1, 1,
0.420918, -1.224746, 3.284939, 0.1215686, 0, 1, 1,
0.4246106, 0.1486725, 1.688978, 0.1294118, 0, 1, 1,
0.4301612, 0.1546649, 0.7774655, 0.1333333, 0, 1, 1,
0.4331875, -0.619589, 3.972744, 0.1411765, 0, 1, 1,
0.4358331, -0.8469927, 2.182781, 0.145098, 0, 1, 1,
0.4415818, 0.2096691, 3.230621, 0.1529412, 0, 1, 1,
0.4424988, -0.3067185, 2.361863, 0.1568628, 0, 1, 1,
0.4477104, 0.1573099, 0.418266, 0.1647059, 0, 1, 1,
0.4499421, -0.8992582, 3.44172, 0.1686275, 0, 1, 1,
0.4522016, -2.034938, 3.735106, 0.1764706, 0, 1, 1,
0.4524368, -1.571051, 2.886281, 0.1803922, 0, 1, 1,
0.4550423, -1.246499, 2.035025, 0.1882353, 0, 1, 1,
0.4591887, 1.213583, -1.335734, 0.1921569, 0, 1, 1,
0.4623847, -0.638665, -0.4277841, 0.2, 0, 1, 1,
0.4638695, -1.235849, 2.885112, 0.2078431, 0, 1, 1,
0.4660012, -0.2795702, 0.89448, 0.2117647, 0, 1, 1,
0.4713707, -2.00418, 1.997043, 0.2196078, 0, 1, 1,
0.4726043, -2.151627, 2.395872, 0.2235294, 0, 1, 1,
0.4815016, -1.221972, 3.119263, 0.2313726, 0, 1, 1,
0.4871345, -0.1213687, 0.4779594, 0.2352941, 0, 1, 1,
0.4918029, 0.2879288, 0.9291146, 0.2431373, 0, 1, 1,
0.4923479, -0.2605982, 0.7855435, 0.2470588, 0, 1, 1,
0.4936046, 1.52248, 0.6688217, 0.254902, 0, 1, 1,
0.4937684, 0.7497209, -0.6458398, 0.2588235, 0, 1, 1,
0.495865, 0.388604, -0.3672967, 0.2666667, 0, 1, 1,
0.4960924, -1.083133, 3.443419, 0.2705882, 0, 1, 1,
0.4997953, 1.61703, -1.193982, 0.2784314, 0, 1, 1,
0.5042874, 1.50358, -0.1831542, 0.282353, 0, 1, 1,
0.5048098, 0.2996255, 2.636123, 0.2901961, 0, 1, 1,
0.5055598, 0.4028756, 1.127494, 0.2941177, 0, 1, 1,
0.5112796, -1.088957, 2.719709, 0.3019608, 0, 1, 1,
0.5166188, 0.8520308, 2.340411, 0.3098039, 0, 1, 1,
0.5177202, -1.285272, 2.54004, 0.3137255, 0, 1, 1,
0.5184092, -0.8554597, 4.132876, 0.3215686, 0, 1, 1,
0.5224991, 1.932443, 0.07543029, 0.3254902, 0, 1, 1,
0.524616, -0.004690558, 2.307163, 0.3333333, 0, 1, 1,
0.5248131, 0.9002436, 1.296001, 0.3372549, 0, 1, 1,
0.5254269, -0.1285786, 1.630475, 0.345098, 0, 1, 1,
0.5305933, 0.1857482, 1.586216, 0.3490196, 0, 1, 1,
0.5342614, -0.16769, -1.021148, 0.3568628, 0, 1, 1,
0.5356296, -0.3497303, 1.795238, 0.3607843, 0, 1, 1,
0.5400673, 1.085268, -0.5806337, 0.3686275, 0, 1, 1,
0.5443438, 0.3034913, -0.2887666, 0.372549, 0, 1, 1,
0.5451359, 0.9039981, 0.8826775, 0.3803922, 0, 1, 1,
0.5453997, 0.7745044, 1.389317, 0.3843137, 0, 1, 1,
0.5455118, -0.5329838, 3.066844, 0.3921569, 0, 1, 1,
0.5467427, 0.1408412, 1.682839, 0.3960784, 0, 1, 1,
0.5523486, -1.067908, 3.946028, 0.4039216, 0, 1, 1,
0.5527602, 1.399325, -0.8166133, 0.4117647, 0, 1, 1,
0.5616302, 0.02586646, 1.734884, 0.4156863, 0, 1, 1,
0.5664661, 0.4286239, 2.483293, 0.4235294, 0, 1, 1,
0.5746844, -0.5253718, 1.735428, 0.427451, 0, 1, 1,
0.5770526, 0.2517716, 0.3424697, 0.4352941, 0, 1, 1,
0.5783146, 1.015761, 1.79115, 0.4392157, 0, 1, 1,
0.5830556, -2.195887, 3.012203, 0.4470588, 0, 1, 1,
0.5868718, 0.8164701, 1.542668, 0.4509804, 0, 1, 1,
0.5920691, 0.6989319, 0.5462363, 0.4588235, 0, 1, 1,
0.5925461, -0.27689, 1.625469, 0.4627451, 0, 1, 1,
0.5972563, 0.0277282, 1.172915, 0.4705882, 0, 1, 1,
0.598819, 0.2285956, 1.386095, 0.4745098, 0, 1, 1,
0.6005111, 1.605684, 1.293015, 0.4823529, 0, 1, 1,
0.6036955, 0.895525, 1.340999, 0.4862745, 0, 1, 1,
0.6080172, -0.4833166, 1.786249, 0.4941176, 0, 1, 1,
0.613, -0.0587597, 1.828044, 0.5019608, 0, 1, 1,
0.6173272, -0.5784792, 0.7142634, 0.5058824, 0, 1, 1,
0.6179493, 0.0906286, 1.024393, 0.5137255, 0, 1, 1,
0.6183005, -0.6781907, 3.394273, 0.5176471, 0, 1, 1,
0.6201668, -0.2509556, 2.978976, 0.5254902, 0, 1, 1,
0.6249803, -2.697601, 1.797273, 0.5294118, 0, 1, 1,
0.625051, 0.9099474, 0.2025956, 0.5372549, 0, 1, 1,
0.6293989, 0.6714687, -0.63915, 0.5411765, 0, 1, 1,
0.6424172, 2.390823, 1.076142, 0.5490196, 0, 1, 1,
0.6456914, 0.5641277, 0.2698162, 0.5529412, 0, 1, 1,
0.6476159, -0.7579997, 2.163968, 0.5607843, 0, 1, 1,
0.6521516, -2.354955, 3.283567, 0.5647059, 0, 1, 1,
0.6528885, -0.5897443, 1.660496, 0.572549, 0, 1, 1,
0.6583946, 2.581256, 1.008954, 0.5764706, 0, 1, 1,
0.659086, -1.341888, 2.517712, 0.5843138, 0, 1, 1,
0.6613653, -1.022183, 0.4759193, 0.5882353, 0, 1, 1,
0.6677414, 0.4823652, -0.6456869, 0.5960785, 0, 1, 1,
0.6680177, -1.448608, 3.538307, 0.6039216, 0, 1, 1,
0.6684742, -1.153891, 2.241391, 0.6078432, 0, 1, 1,
0.6695092, 1.642711, 0.3846726, 0.6156863, 0, 1, 1,
0.6717535, -1.157996, 3.132987, 0.6196079, 0, 1, 1,
0.6724296, 1.54284, -0.02082601, 0.627451, 0, 1, 1,
0.6760125, 0.8515171, 1.011304, 0.6313726, 0, 1, 1,
0.6831908, -0.08295912, 1.490129, 0.6392157, 0, 1, 1,
0.688621, 0.6880909, 0.3922212, 0.6431373, 0, 1, 1,
0.6920515, 0.402273, 1.595578, 0.6509804, 0, 1, 1,
0.6948747, 0.8193502, 0.1029069, 0.654902, 0, 1, 1,
0.6951669, 1.827889, -1.880531, 0.6627451, 0, 1, 1,
0.6960365, 0.6968791, 0.01923993, 0.6666667, 0, 1, 1,
0.6982607, -0.905652, 1.710398, 0.6745098, 0, 1, 1,
0.6983989, 0.2641899, 1.202104, 0.6784314, 0, 1, 1,
0.698424, 0.4271661, 1.637429, 0.6862745, 0, 1, 1,
0.7008443, -0.5175039, 2.314094, 0.6901961, 0, 1, 1,
0.7015328, -1.290903, 3.336565, 0.6980392, 0, 1, 1,
0.7101533, 2.136834, 0.8578936, 0.7058824, 0, 1, 1,
0.7164539, -0.5079517, 2.333028, 0.7098039, 0, 1, 1,
0.7208968, -1.004379, 0.4903037, 0.7176471, 0, 1, 1,
0.7248062, -0.7446745, 2.846161, 0.7215686, 0, 1, 1,
0.7305316, 0.3373648, -1.302215, 0.7294118, 0, 1, 1,
0.7305416, -0.7904212, 3.481712, 0.7333333, 0, 1, 1,
0.7337908, -0.7194436, 1.433863, 0.7411765, 0, 1, 1,
0.7349754, 0.2419753, -0.1067773, 0.7450981, 0, 1, 1,
0.7357326, 0.2215131, 1.639079, 0.7529412, 0, 1, 1,
0.7364464, -0.9132717, 2.773331, 0.7568628, 0, 1, 1,
0.7384967, -0.254626, 3.258828, 0.7647059, 0, 1, 1,
0.7441736, -1.357145, 1.82514, 0.7686275, 0, 1, 1,
0.7442813, 0.2442147, 1.70831, 0.7764706, 0, 1, 1,
0.7603045, 0.188953, -0.4077027, 0.7803922, 0, 1, 1,
0.7624653, 0.7291476, 2.691668, 0.7882353, 0, 1, 1,
0.7647284, 2.045195, 0.5760345, 0.7921569, 0, 1, 1,
0.7747043, 1.007274, 0.9035025, 0.8, 0, 1, 1,
0.7843509, 1.795594, 0.7000192, 0.8078431, 0, 1, 1,
0.7871325, 0.404563, 1.023144, 0.8117647, 0, 1, 1,
0.7916986, -0.921133, 1.204278, 0.8196079, 0, 1, 1,
0.7952165, -0.495683, 1.730034, 0.8235294, 0, 1, 1,
0.7954457, 0.9102911, 1.67345, 0.8313726, 0, 1, 1,
0.8008071, -0.1418437, 3.177016, 0.8352941, 0, 1, 1,
0.8027951, 0.8741106, 1.851796, 0.8431373, 0, 1, 1,
0.8064215, 0.3459451, 1.132686, 0.8470588, 0, 1, 1,
0.8100508, 0.3189481, 2.100478, 0.854902, 0, 1, 1,
0.8109506, -1.208975, 2.432973, 0.8588235, 0, 1, 1,
0.8143592, -0.6883652, 1.962741, 0.8666667, 0, 1, 1,
0.8181291, -0.5106768, 0.6517944, 0.8705882, 0, 1, 1,
0.8189539, -2.05961, 1.760754, 0.8784314, 0, 1, 1,
0.824021, -1.137893, 3.52744, 0.8823529, 0, 1, 1,
0.8240249, 0.8011039, 0.1455216, 0.8901961, 0, 1, 1,
0.8277662, 0.9653284, 1.822834, 0.8941177, 0, 1, 1,
0.8280195, 0.1559745, 3.88883, 0.9019608, 0, 1, 1,
0.8358561, -0.8435479, 0.2218832, 0.9098039, 0, 1, 1,
0.8373947, 0.268078, 0.547025, 0.9137255, 0, 1, 1,
0.8422684, 1.554096, 0.192296, 0.9215686, 0, 1, 1,
0.8508693, -0.253876, 3.082045, 0.9254902, 0, 1, 1,
0.8521427, -0.2817546, 1.766753, 0.9333333, 0, 1, 1,
0.8530433, -1.648937, 1.98901, 0.9372549, 0, 1, 1,
0.8533043, -0.7803931, 4.08127, 0.945098, 0, 1, 1,
0.8556432, -1.321961, 1.732956, 0.9490196, 0, 1, 1,
0.8657215, 0.2594463, 0.124291, 0.9568627, 0, 1, 1,
0.8734676, -1.416032, 1.407406, 0.9607843, 0, 1, 1,
0.8747227, 2.7679, 0.7617753, 0.9686275, 0, 1, 1,
0.8767099, 0.3197238, -0.6112246, 0.972549, 0, 1, 1,
0.8812319, -1.245385, 2.095992, 0.9803922, 0, 1, 1,
0.8871901, 0.1527644, 2.414002, 0.9843137, 0, 1, 1,
0.8898497, 0.1155945, 2.168218, 0.9921569, 0, 1, 1,
0.8909397, -0.2784687, 1.812149, 0.9960784, 0, 1, 1,
0.899028, -0.6608142, 0.9529684, 1, 0, 0.9960784, 1,
0.8993168, 1.864037, 0.6900123, 1, 0, 0.9882353, 1,
0.9017488, 0.9384763, 1.400904, 1, 0, 0.9843137, 1,
0.9024123, 0.1439442, 0.8983544, 1, 0, 0.9764706, 1,
0.9033124, 1.18349, 2.747008, 1, 0, 0.972549, 1,
0.9033515, -0.846316, 1.082824, 1, 0, 0.9647059, 1,
0.9141203, 0.08906746, 1.184952, 1, 0, 0.9607843, 1,
0.9172091, 0.5456579, 2.229653, 1, 0, 0.9529412, 1,
0.9174423, 0.294452, 2.587967, 1, 0, 0.9490196, 1,
0.927157, 0.4798459, 0.6737706, 1, 0, 0.9411765, 1,
0.9405982, 0.7451054, 0.2630578, 1, 0, 0.9372549, 1,
0.9457799, -1.361409, 2.785745, 1, 0, 0.9294118, 1,
0.9480074, -0.7565527, 3.845727, 1, 0, 0.9254902, 1,
0.9491023, -0.4303258, 1.589464, 1, 0, 0.9176471, 1,
0.9509113, 0.2724665, 0.7314757, 1, 0, 0.9137255, 1,
0.9521623, 0.9955825, 0.9157432, 1, 0, 0.9058824, 1,
0.9603583, 1.303996, -0.4643984, 1, 0, 0.9019608, 1,
0.9693817, 0.3531356, 1.158564, 1, 0, 0.8941177, 1,
0.9694947, 1.208999, 0.07702725, 1, 0, 0.8862745, 1,
0.9696689, -1.350576, 3.797217, 1, 0, 0.8823529, 1,
0.9763928, 1.579713, 0.2957161, 1, 0, 0.8745098, 1,
0.9785853, 1.057922, 1.781889, 1, 0, 0.8705882, 1,
0.9799082, -1.591504, 3.218025, 1, 0, 0.8627451, 1,
0.9835682, -0.5585172, 2.349762, 1, 0, 0.8588235, 1,
0.9874162, 0.8507629, 1.918713, 1, 0, 0.8509804, 1,
0.9933202, -0.0492718, 1.516371, 1, 0, 0.8470588, 1,
1.001121, -2.094358, 3.125821, 1, 0, 0.8392157, 1,
1.009944, -0.6074985, 1.927576, 1, 0, 0.8352941, 1,
1.012781, 2.84947, 0.8141399, 1, 0, 0.827451, 1,
1.0222, 2.0088, 0.5096876, 1, 0, 0.8235294, 1,
1.030029, 0.03365171, 0.3276714, 1, 0, 0.8156863, 1,
1.032811, -0.5235219, 1.623085, 1, 0, 0.8117647, 1,
1.036169, 0.4887287, 2.028817, 1, 0, 0.8039216, 1,
1.036388, 0.5539631, 1.309546, 1, 0, 0.7960784, 1,
1.037257, -0.45439, 0.409279, 1, 0, 0.7921569, 1,
1.038974, 0.3876451, 0.321463, 1, 0, 0.7843137, 1,
1.043084, 1.170528, -1.295754, 1, 0, 0.7803922, 1,
1.054758, 0.05261672, 2.122037, 1, 0, 0.772549, 1,
1.056048, 0.9117683, 0.5527663, 1, 0, 0.7686275, 1,
1.060482, -0.9094215, 2.670248, 1, 0, 0.7607843, 1,
1.061651, -0.9419343, 3.722991, 1, 0, 0.7568628, 1,
1.071612, -0.4736731, 1.276286, 1, 0, 0.7490196, 1,
1.081817, 0.7271922, 1.882758, 1, 0, 0.7450981, 1,
1.083074, -1.538229, 3.90816, 1, 0, 0.7372549, 1,
1.08697, -1.443383, 2.977183, 1, 0, 0.7333333, 1,
1.089157, 1.177994, 0.5920019, 1, 0, 0.7254902, 1,
1.094252, 0.5456529, 1.448406, 1, 0, 0.7215686, 1,
1.095224, 0.6080524, 0.83636, 1, 0, 0.7137255, 1,
1.099987, -0.4555324, 1.332831, 1, 0, 0.7098039, 1,
1.101278, 1.289762, 2.170421, 1, 0, 0.7019608, 1,
1.105031, -1.898744, 2.635732, 1, 0, 0.6941177, 1,
1.110216, 0.9871141, 1.984265, 1, 0, 0.6901961, 1,
1.112165, 0.7945514, 0.8365908, 1, 0, 0.682353, 1,
1.115317, 0.01792181, 0.8103381, 1, 0, 0.6784314, 1,
1.116614, 0.7370352, 2.669815, 1, 0, 0.6705883, 1,
1.116888, -0.7893363, 3.833125, 1, 0, 0.6666667, 1,
1.123776, -0.9245324, 2.60309, 1, 0, 0.6588235, 1,
1.128209, 0.7511591, 1.432094, 1, 0, 0.654902, 1,
1.130809, -0.6784336, 2.728426, 1, 0, 0.6470588, 1,
1.131819, -0.004352423, 2.882987, 1, 0, 0.6431373, 1,
1.134563, 0.9704845, 0.7218347, 1, 0, 0.6352941, 1,
1.135248, 0.1922793, 1.151285, 1, 0, 0.6313726, 1,
1.142041, -0.1253562, 3.579494, 1, 0, 0.6235294, 1,
1.165191, 1.808042, 1.122006, 1, 0, 0.6196079, 1,
1.166475, -0.7756875, 2.995604, 1, 0, 0.6117647, 1,
1.171607, -0.5075878, 3.205999, 1, 0, 0.6078432, 1,
1.17165, -1.192169, 4.196758, 1, 0, 0.6, 1,
1.188763, -0.9556859, 2.491657, 1, 0, 0.5921569, 1,
1.19148, -0.2283992, 1.116206, 1, 0, 0.5882353, 1,
1.192102, 0.273535, 0.6029293, 1, 0, 0.5803922, 1,
1.196153, 0.3391607, 0.9238157, 1, 0, 0.5764706, 1,
1.204138, 0.4366595, 1.54268, 1, 0, 0.5686275, 1,
1.208412, 1.004094, -0.3690356, 1, 0, 0.5647059, 1,
1.221816, -3.036966, 2.295815, 1, 0, 0.5568628, 1,
1.224439, 1.416103, 1.236619, 1, 0, 0.5529412, 1,
1.226448, -1.478864, 4.420064, 1, 0, 0.5450981, 1,
1.227489, -0.7681443, 0.989538, 1, 0, 0.5411765, 1,
1.230568, 0.1501307, 1.735313, 1, 0, 0.5333334, 1,
1.230905, -1.364418, 2.278274, 1, 0, 0.5294118, 1,
1.232059, 0.2176857, 1.47316, 1, 0, 0.5215687, 1,
1.232269, -0.351106, 1.064233, 1, 0, 0.5176471, 1,
1.257985, 0.7633486, 0.442054, 1, 0, 0.509804, 1,
1.270082, 1.641611, -0.5704749, 1, 0, 0.5058824, 1,
1.270496, -0.6980019, 1.832732, 1, 0, 0.4980392, 1,
1.271485, 1.993613, 1.255186, 1, 0, 0.4901961, 1,
1.29595, 1.23485, 1.696076, 1, 0, 0.4862745, 1,
1.308188, -0.1573982, 1.861733, 1, 0, 0.4784314, 1,
1.308932, 0.3443018, 2.000694, 1, 0, 0.4745098, 1,
1.336223, 0.02377859, 2.797661, 1, 0, 0.4666667, 1,
1.336877, -0.0416559, 2.226804, 1, 0, 0.4627451, 1,
1.345055, 0.4422212, 2.271676, 1, 0, 0.454902, 1,
1.34799, 0.08296008, -0.06758173, 1, 0, 0.4509804, 1,
1.349138, 0.837356, 2.317547, 1, 0, 0.4431373, 1,
1.359031, -0.2343268, 0.2262256, 1, 0, 0.4392157, 1,
1.380711, 0.8982646, 1.484459, 1, 0, 0.4313726, 1,
1.384633, -2.525862, 4.568335, 1, 0, 0.427451, 1,
1.391423, 1.102336, -0.7832659, 1, 0, 0.4196078, 1,
1.407847, 0.5888364, 0.9996586, 1, 0, 0.4156863, 1,
1.420498, 0.774745, 1.473563, 1, 0, 0.4078431, 1,
1.431644, 0.5831162, 1.113694, 1, 0, 0.4039216, 1,
1.436828, 0.3984672, 1.788821, 1, 0, 0.3960784, 1,
1.446587, -2.131601, 2.927353, 1, 0, 0.3882353, 1,
1.448178, -1.22162, 2.770134, 1, 0, 0.3843137, 1,
1.455157, -1.210084, 3.103307, 1, 0, 0.3764706, 1,
1.470136, -0.4181219, 2.129895, 1, 0, 0.372549, 1,
1.488666, -0.08210591, 3.027992, 1, 0, 0.3647059, 1,
1.502445, -0.4941598, 1.535686, 1, 0, 0.3607843, 1,
1.505316, -0.1273124, -1.119685, 1, 0, 0.3529412, 1,
1.508784, 0.5272595, 3.546161, 1, 0, 0.3490196, 1,
1.510507, 1.586887, 1.099251, 1, 0, 0.3411765, 1,
1.513667, 0.09318952, 0.8616138, 1, 0, 0.3372549, 1,
1.544053, -0.8294467, 2.605646, 1, 0, 0.3294118, 1,
1.546521, 0.7288435, 1.210894, 1, 0, 0.3254902, 1,
1.556017, -1.7137, 1.69528, 1, 0, 0.3176471, 1,
1.5578, 0.9887867, 2.740953, 1, 0, 0.3137255, 1,
1.561461, 0.2816841, -0.01118034, 1, 0, 0.3058824, 1,
1.566474, -0.03331769, 3.739938, 1, 0, 0.2980392, 1,
1.577469, -0.1041031, 3.929656, 1, 0, 0.2941177, 1,
1.580912, -0.2658044, 2.445258, 1, 0, 0.2862745, 1,
1.581381, -1.6081, 1.298591, 1, 0, 0.282353, 1,
1.588987, -1.255705, 2.195793, 1, 0, 0.2745098, 1,
1.605053, -0.2345203, 3.796738, 1, 0, 0.2705882, 1,
1.612576, -1.550653, 2.976728, 1, 0, 0.2627451, 1,
1.613675, -1.42591, 2.351306, 1, 0, 0.2588235, 1,
1.614688, 0.3153773, 3.045443, 1, 0, 0.2509804, 1,
1.639726, 0.4688156, 1.472189, 1, 0, 0.2470588, 1,
1.641248, -0.1548452, 0.1370843, 1, 0, 0.2392157, 1,
1.643208, -1.814744, 5.905196, 1, 0, 0.2352941, 1,
1.646619, -1.507065, 2.554124, 1, 0, 0.227451, 1,
1.666225, -1.010655, 3.523064, 1, 0, 0.2235294, 1,
1.686978, 1.339163, -1.447605, 1, 0, 0.2156863, 1,
1.689127, 1.294437, 1.026633, 1, 0, 0.2117647, 1,
1.69113, -1.083618, 2.322514, 1, 0, 0.2039216, 1,
1.703917, 0.05899475, 1.117794, 1, 0, 0.1960784, 1,
1.729638, -0.3954977, 3.530652, 1, 0, 0.1921569, 1,
1.731035, 0.1987837, 0.2225421, 1, 0, 0.1843137, 1,
1.81089, -1.676032, 2.114919, 1, 0, 0.1803922, 1,
1.812733, 1.279386, 0.6269879, 1, 0, 0.172549, 1,
1.833868, -0.5537144, 1.548294, 1, 0, 0.1686275, 1,
1.836296, 0.3001843, 0.9591724, 1, 0, 0.1607843, 1,
1.841614, 0.6759443, 0.3104959, 1, 0, 0.1568628, 1,
1.876359, -0.03923549, 0.8294829, 1, 0, 0.1490196, 1,
1.876552, 0.5124623, -0.5573144, 1, 0, 0.145098, 1,
1.900666, 0.9576017, -1.003037, 1, 0, 0.1372549, 1,
1.904213, 0.616191, 0.976563, 1, 0, 0.1333333, 1,
1.906831, 0.7029766, 0.5421461, 1, 0, 0.1254902, 1,
1.954998, -1.111462, 3.136829, 1, 0, 0.1215686, 1,
1.9736, 1.080746, 0.727754, 1, 0, 0.1137255, 1,
1.982318, 0.1124038, 2.169658, 1, 0, 0.1098039, 1,
1.998043, 1.124704, 2.791057, 1, 0, 0.1019608, 1,
2.018509, 0.2786802, 1.648608, 1, 0, 0.09411765, 1,
2.105294, 0.1551529, 1.307979, 1, 0, 0.09019608, 1,
2.108525, -1.378959, -0.2933774, 1, 0, 0.08235294, 1,
2.134062, -0.9425741, 2.549739, 1, 0, 0.07843138, 1,
2.156104, 0.3515784, 1.644447, 1, 0, 0.07058824, 1,
2.170568, -0.8729327, 0.6579097, 1, 0, 0.06666667, 1,
2.180976, 0.01981275, 1.093844, 1, 0, 0.05882353, 1,
2.21874, 0.9587758, 2.994953, 1, 0, 0.05490196, 1,
2.223562, -0.6383551, 1.668111, 1, 0, 0.04705882, 1,
2.237599, -1.729878, 2.455297, 1, 0, 0.04313726, 1,
2.287643, -1.642974, 4.635677, 1, 0, 0.03529412, 1,
2.341895, -0.6999331, 2.598316, 1, 0, 0.03137255, 1,
2.445437, 1.222106, 1.314588, 1, 0, 0.02352941, 1,
2.543642, -0.1062575, -0.4082777, 1, 0, 0.01960784, 1,
2.731298, 0.7028816, 1.536799, 1, 0, 0.01176471, 1,
2.964447, 0.467847, 1.485505, 1, 0, 0.007843138, 1
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
-0.05928874, -4.65378, -7.844101, 0, -0.5, 0.5, 0.5,
-0.05928874, -4.65378, -7.844101, 1, -0.5, 0.5, 0.5,
-0.05928874, -4.65378, -7.844101, 1, 1.5, 0.5, 0.5,
-0.05928874, -4.65378, -7.844101, 0, 1.5, 0.5, 0.5
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
-4.108071, 0.2376946, -7.844101, 0, -0.5, 0.5, 0.5,
-4.108071, 0.2376946, -7.844101, 1, -0.5, 0.5, 0.5,
-4.108071, 0.2376946, -7.844101, 1, 1.5, 0.5, 0.5,
-4.108071, 0.2376946, -7.844101, 0, 1.5, 0.5, 0.5
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
-4.108071, -4.65378, 0.02691579, 0, -0.5, 0.5, 0.5,
-4.108071, -4.65378, 0.02691579, 1, -0.5, 0.5, 0.5,
-4.108071, -4.65378, 0.02691579, 1, 1.5, 0.5, 0.5,
-4.108071, -4.65378, 0.02691579, 0, 1.5, 0.5, 0.5
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
-3, -3.524979, -6.027712,
2, -3.524979, -6.027712,
-3, -3.524979, -6.027712,
-3, -3.713112, -6.330444,
-2, -3.524979, -6.027712,
-2, -3.713112, -6.330444,
-1, -3.524979, -6.027712,
-1, -3.713112, -6.330444,
0, -3.524979, -6.027712,
0, -3.713112, -6.330444,
1, -3.524979, -6.027712,
1, -3.713112, -6.330444,
2, -3.524979, -6.027712,
2, -3.713112, -6.330444
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
-3, -4.08938, -6.935907, 0, -0.5, 0.5, 0.5,
-3, -4.08938, -6.935907, 1, -0.5, 0.5, 0.5,
-3, -4.08938, -6.935907, 1, 1.5, 0.5, 0.5,
-3, -4.08938, -6.935907, 0, 1.5, 0.5, 0.5,
-2, -4.08938, -6.935907, 0, -0.5, 0.5, 0.5,
-2, -4.08938, -6.935907, 1, -0.5, 0.5, 0.5,
-2, -4.08938, -6.935907, 1, 1.5, 0.5, 0.5,
-2, -4.08938, -6.935907, 0, 1.5, 0.5, 0.5,
-1, -4.08938, -6.935907, 0, -0.5, 0.5, 0.5,
-1, -4.08938, -6.935907, 1, -0.5, 0.5, 0.5,
-1, -4.08938, -6.935907, 1, 1.5, 0.5, 0.5,
-1, -4.08938, -6.935907, 0, 1.5, 0.5, 0.5,
0, -4.08938, -6.935907, 0, -0.5, 0.5, 0.5,
0, -4.08938, -6.935907, 1, -0.5, 0.5, 0.5,
0, -4.08938, -6.935907, 1, 1.5, 0.5, 0.5,
0, -4.08938, -6.935907, 0, 1.5, 0.5, 0.5,
1, -4.08938, -6.935907, 0, -0.5, 0.5, 0.5,
1, -4.08938, -6.935907, 1, -0.5, 0.5, 0.5,
1, -4.08938, -6.935907, 1, 1.5, 0.5, 0.5,
1, -4.08938, -6.935907, 0, 1.5, 0.5, 0.5,
2, -4.08938, -6.935907, 0, -0.5, 0.5, 0.5,
2, -4.08938, -6.935907, 1, -0.5, 0.5, 0.5,
2, -4.08938, -6.935907, 1, 1.5, 0.5, 0.5,
2, -4.08938, -6.935907, 0, 1.5, 0.5, 0.5
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
-3.173737, -2, -6.027712,
-3.173737, 2, -6.027712,
-3.173737, -2, -6.027712,
-3.329459, -2, -6.330444,
-3.173737, 0, -6.027712,
-3.329459, 0, -6.330444,
-3.173737, 2, -6.027712,
-3.329459, 2, -6.330444
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
-3.640904, -2, -6.935907, 0, -0.5, 0.5, 0.5,
-3.640904, -2, -6.935907, 1, -0.5, 0.5, 0.5,
-3.640904, -2, -6.935907, 1, 1.5, 0.5, 0.5,
-3.640904, -2, -6.935907, 0, 1.5, 0.5, 0.5,
-3.640904, 0, -6.935907, 0, -0.5, 0.5, 0.5,
-3.640904, 0, -6.935907, 1, -0.5, 0.5, 0.5,
-3.640904, 0, -6.935907, 1, 1.5, 0.5, 0.5,
-3.640904, 0, -6.935907, 0, 1.5, 0.5, 0.5,
-3.640904, 2, -6.935907, 0, -0.5, 0.5, 0.5,
-3.640904, 2, -6.935907, 1, -0.5, 0.5, 0.5,
-3.640904, 2, -6.935907, 1, 1.5, 0.5, 0.5,
-3.640904, 2, -6.935907, 0, 1.5, 0.5, 0.5
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
-3.173737, -3.524979, -4,
-3.173737, -3.524979, 4,
-3.173737, -3.524979, -4,
-3.329459, -3.713112, -4,
-3.173737, -3.524979, -2,
-3.329459, -3.713112, -2,
-3.173737, -3.524979, 0,
-3.329459, -3.713112, 0,
-3.173737, -3.524979, 2,
-3.329459, -3.713112, 2,
-3.173737, -3.524979, 4,
-3.329459, -3.713112, 4
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
-3.640904, -4.08938, -4, 0, -0.5, 0.5, 0.5,
-3.640904, -4.08938, -4, 1, -0.5, 0.5, 0.5,
-3.640904, -4.08938, -4, 1, 1.5, 0.5, 0.5,
-3.640904, -4.08938, -4, 0, 1.5, 0.5, 0.5,
-3.640904, -4.08938, -2, 0, -0.5, 0.5, 0.5,
-3.640904, -4.08938, -2, 1, -0.5, 0.5, 0.5,
-3.640904, -4.08938, -2, 1, 1.5, 0.5, 0.5,
-3.640904, -4.08938, -2, 0, 1.5, 0.5, 0.5,
-3.640904, -4.08938, 0, 0, -0.5, 0.5, 0.5,
-3.640904, -4.08938, 0, 1, -0.5, 0.5, 0.5,
-3.640904, -4.08938, 0, 1, 1.5, 0.5, 0.5,
-3.640904, -4.08938, 0, 0, 1.5, 0.5, 0.5,
-3.640904, -4.08938, 2, 0, -0.5, 0.5, 0.5,
-3.640904, -4.08938, 2, 1, -0.5, 0.5, 0.5,
-3.640904, -4.08938, 2, 1, 1.5, 0.5, 0.5,
-3.640904, -4.08938, 2, 0, 1.5, 0.5, 0.5,
-3.640904, -4.08938, 4, 0, -0.5, 0.5, 0.5,
-3.640904, -4.08938, 4, 1, -0.5, 0.5, 0.5,
-3.640904, -4.08938, 4, 1, 1.5, 0.5, 0.5,
-3.640904, -4.08938, 4, 0, 1.5, 0.5, 0.5
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
-3.173737, -3.524979, -6.027712,
-3.173737, 4.000368, -6.027712,
-3.173737, -3.524979, 6.081544,
-3.173737, 4.000368, 6.081544,
-3.173737, -3.524979, -6.027712,
-3.173737, -3.524979, 6.081544,
-3.173737, 4.000368, -6.027712,
-3.173737, 4.000368, 6.081544,
-3.173737, -3.524979, -6.027712,
3.05516, -3.524979, -6.027712,
-3.173737, -3.524979, 6.081544,
3.05516, -3.524979, 6.081544,
-3.173737, 4.000368, -6.027712,
3.05516, 4.000368, -6.027712,
-3.173737, 4.000368, 6.081544,
3.05516, 4.000368, 6.081544,
3.05516, -3.524979, -6.027712,
3.05516, 4.000368, -6.027712,
3.05516, -3.524979, 6.081544,
3.05516, 4.000368, 6.081544,
3.05516, -3.524979, -6.027712,
3.05516, -3.524979, 6.081544,
3.05516, 4.000368, -6.027712,
3.05516, 4.000368, 6.081544
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
var radius = 8.307888;
var distance = 36.96273;
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
mvMatrix.translate( 0.05928874, -0.2376946, -0.02691579 );
mvMatrix.scale( 1.442093, 1.193653, 0.7418004 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.96273);
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
tecloftalam<-read.table("tecloftalam.xyz")
```

```
## Error in read.table("tecloftalam.xyz"): no lines available in input
```

```r
x<-tecloftalam$V2
```

```
## Error in eval(expr, envir, enclos): object 'tecloftalam' not found
```

```r
y<-tecloftalam$V3
```

```
## Error in eval(expr, envir, enclos): object 'tecloftalam' not found
```

```r
z<-tecloftalam$V4
```

```
## Error in eval(expr, envir, enclos): object 'tecloftalam' not found
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
-3.083025, 0.8866577, -3.834992, 0, 0, 1, 1, 1,
-2.786414, 1.60764, 0.7617378, 1, 0, 0, 1, 1,
-2.777763, 0.3769763, -0.9176413, 1, 0, 0, 1, 1,
-2.75405, 1.103518, -1.133834, 1, 0, 0, 1, 1,
-2.569111, -0.0959751, -1.160375, 1, 0, 0, 1, 1,
-2.554907, -0.3982787, -2.69452, 1, 0, 0, 1, 1,
-2.397532, 0.1902908, -1.832031, 0, 0, 0, 1, 1,
-2.372909, 1.035482, -0.8493208, 0, 0, 0, 1, 1,
-2.209291, -0.1054477, -1.936257, 0, 0, 0, 1, 1,
-2.194863, -0.7958843, -2.525903, 0, 0, 0, 1, 1,
-2.154684, -3.415386, -3.072275, 0, 0, 0, 1, 1,
-2.105778, -0.4545147, -3.132406, 0, 0, 0, 1, 1,
-2.102884, 0.2530721, -2.71501, 0, 0, 0, 1, 1,
-2.102134, 0.5193419, -2.125432, 1, 1, 1, 1, 1,
-2.073168, 0.4887062, -1.598699, 1, 1, 1, 1, 1,
-2.062758, 0.06972205, -3.648252, 1, 1, 1, 1, 1,
-1.962615, 0.5940773, -1.52584, 1, 1, 1, 1, 1,
-1.956981, 0.1479418, -2.672107, 1, 1, 1, 1, 1,
-1.948689, -1.205491, -2.38091, 1, 1, 1, 1, 1,
-1.942995, 1.80744, -0.2277462, 1, 1, 1, 1, 1,
-1.939206, 0.3608819, -1.405832, 1, 1, 1, 1, 1,
-1.905451, 1.184687, -2.161697, 1, 1, 1, 1, 1,
-1.90291, 0.5715696, -0.7454607, 1, 1, 1, 1, 1,
-1.855602, 0.5949252, -1.008597, 1, 1, 1, 1, 1,
-1.848948, -0.1980972, -0.9585086, 1, 1, 1, 1, 1,
-1.847097, -0.1865025, -1.614115, 1, 1, 1, 1, 1,
-1.835776, -0.3528354, -0.8017043, 1, 1, 1, 1, 1,
-1.799413, 1.118542, 0.1091267, 1, 1, 1, 1, 1,
-1.798551, 0.8313228, 1.72241, 0, 0, 1, 1, 1,
-1.787075, -0.2214915, -0.9941149, 1, 0, 0, 1, 1,
-1.785525, -0.9194097, -1.231442, 1, 0, 0, 1, 1,
-1.779953, 1.847908, 0.2750633, 1, 0, 0, 1, 1,
-1.775619, -0.03419124, -2.152624, 1, 0, 0, 1, 1,
-1.769166, 0.2964793, 0.4160981, 1, 0, 0, 1, 1,
-1.729538, 0.1863333, -1.09785, 0, 0, 0, 1, 1,
-1.714646, -1.190868, -2.005937, 0, 0, 0, 1, 1,
-1.709075, 0.1669023, -1.797586, 0, 0, 0, 1, 1,
-1.698473, 1.961491, -1.811921, 0, 0, 0, 1, 1,
-1.680985, -1.583684, -0.03526514, 0, 0, 0, 1, 1,
-1.659764, 0.5004961, -2.392921, 0, 0, 0, 1, 1,
-1.648226, 0.2991948, -0.5058544, 0, 0, 0, 1, 1,
-1.640072, -1.142502, -1.004961, 1, 1, 1, 1, 1,
-1.627577, -1.225744, -0.07692824, 1, 1, 1, 1, 1,
-1.625033, -0.2151117, -0.8577029, 1, 1, 1, 1, 1,
-1.617749, -0.8567147, -0.5783118, 1, 1, 1, 1, 1,
-1.604217, 0.1893829, -1.736415, 1, 1, 1, 1, 1,
-1.595599, 0.6429844, 0.02524213, 1, 1, 1, 1, 1,
-1.58993, 1.413176, -0.08180439, 1, 1, 1, 1, 1,
-1.586994, 0.1333019, -1.245641, 1, 1, 1, 1, 1,
-1.585403, 0.7314236, -0.6283802, 1, 1, 1, 1, 1,
-1.578294, 2.677144, -2.034503, 1, 1, 1, 1, 1,
-1.574921, -0.7794614, -0.3620174, 1, 1, 1, 1, 1,
-1.571095, -1.153788, -3.90882, 1, 1, 1, 1, 1,
-1.570046, 1.571827, -0.6296492, 1, 1, 1, 1, 1,
-1.56222, -0.6802981, -2.713727, 1, 1, 1, 1, 1,
-1.558274, 1.642865, -0.710544, 1, 1, 1, 1, 1,
-1.534972, 0.9547433, -0.1215592, 0, 0, 1, 1, 1,
-1.52682, 0.8329546, -1.204715, 1, 0, 0, 1, 1,
-1.517106, 0.4011593, -0.3047588, 1, 0, 0, 1, 1,
-1.516162, -0.1412179, -0.647666, 1, 0, 0, 1, 1,
-1.508145, 0.1152947, -0.0226691, 1, 0, 0, 1, 1,
-1.485301, 0.01427216, -1.838855, 1, 0, 0, 1, 1,
-1.481559, 0.048872, -0.2916266, 0, 0, 0, 1, 1,
-1.469036, -0.2932602, -3.788202, 0, 0, 0, 1, 1,
-1.46897, 3.036866, -1.44118, 0, 0, 0, 1, 1,
-1.465258, 0.6328794, -3.172828, 0, 0, 0, 1, 1,
-1.459561, 0.8704082, -1.060859, 0, 0, 0, 1, 1,
-1.448154, 1.022494, -0.895005, 0, 0, 0, 1, 1,
-1.440698, 0.1687746, -1.899391, 0, 0, 0, 1, 1,
-1.439474, 0.1369879, -3.091172, 1, 1, 1, 1, 1,
-1.430274, -0.06716803, -1.495844, 1, 1, 1, 1, 1,
-1.428486, 1.565797, -0.8686296, 1, 1, 1, 1, 1,
-1.424125, 0.7801039, -0.7220334, 1, 1, 1, 1, 1,
-1.420543, 2.461333, 0.2173512, 1, 1, 1, 1, 1,
-1.412091, -0.4634908, -2.159051, 1, 1, 1, 1, 1,
-1.410382, -0.300329, -0.5905627, 1, 1, 1, 1, 1,
-1.402201, 0.2927393, -2.202143, 1, 1, 1, 1, 1,
-1.394212, -3.16207, -1.972723, 1, 1, 1, 1, 1,
-1.391396, -1.553704, -2.220688, 1, 1, 1, 1, 1,
-1.38672, 0.228641, -1.229532, 1, 1, 1, 1, 1,
-1.38414, 0.8074113, -0.4103469, 1, 1, 1, 1, 1,
-1.374125, 0.0842787, -0.5685759, 1, 1, 1, 1, 1,
-1.373846, 0.07767974, -1.46514, 1, 1, 1, 1, 1,
-1.368488, 0.02516693, -1.502135, 1, 1, 1, 1, 1,
-1.368428, 0.8689326, -0.7210809, 0, 0, 1, 1, 1,
-1.367821, -0.2434715, -1.004791, 1, 0, 0, 1, 1,
-1.364458, 0.3419168, -2.266545, 1, 0, 0, 1, 1,
-1.346963, 0.06791361, 0.123163, 1, 0, 0, 1, 1,
-1.340668, 1.516523, 0.1386155, 1, 0, 0, 1, 1,
-1.337317, -1.669307, -4.322275, 1, 0, 0, 1, 1,
-1.336475, -1.590396, -2.360972, 0, 0, 0, 1, 1,
-1.333953, -0.002083374, -0.8403493, 0, 0, 0, 1, 1,
-1.332397, -0.02073514, 0.08319443, 0, 0, 0, 1, 1,
-1.332094, 0.3615274, -1.583959, 0, 0, 0, 1, 1,
-1.326448, 1.24761, -0.414347, 0, 0, 0, 1, 1,
-1.325687, -0.8878925, -0.7440625, 0, 0, 0, 1, 1,
-1.317221, 1.641246, -1.524559, 0, 0, 0, 1, 1,
-1.30267, 0.375461, -2.044491, 1, 1, 1, 1, 1,
-1.283442, -1.227758, -2.37358, 1, 1, 1, 1, 1,
-1.279529, 1.438896, -3.156545, 1, 1, 1, 1, 1,
-1.27172, -0.6629225, -1.523105, 1, 1, 1, 1, 1,
-1.270345, 0.624272, -2.324015, 1, 1, 1, 1, 1,
-1.268209, -0.2658855, -3.27927, 1, 1, 1, 1, 1,
-1.266298, -1.718999, -3.101079, 1, 1, 1, 1, 1,
-1.256666, -1.021095, -0.9438505, 1, 1, 1, 1, 1,
-1.252607, -0.2083983, -2.793985, 1, 1, 1, 1, 1,
-1.251249, 1.011094, -1.046533, 1, 1, 1, 1, 1,
-1.248955, -1.351531, -1.118085, 1, 1, 1, 1, 1,
-1.2449, 1.669227, -1.459727, 1, 1, 1, 1, 1,
-1.243993, -0.6692401, -0.9136602, 1, 1, 1, 1, 1,
-1.234567, 0.2801958, -1.337264, 1, 1, 1, 1, 1,
-1.234431, 1.123282, -0.002013478, 1, 1, 1, 1, 1,
-1.234314, 0.2161612, -1.833536, 0, 0, 1, 1, 1,
-1.231629, -1.187053, -0.9317162, 1, 0, 0, 1, 1,
-1.22011, 0.1997106, -0.8231988, 1, 0, 0, 1, 1,
-1.21443, -0.2758985, -2.045825, 1, 0, 0, 1, 1,
-1.185391, 1.487168, -1.069118, 1, 0, 0, 1, 1,
-1.183275, -0.5736939, -1.44614, 1, 0, 0, 1, 1,
-1.180564, 0.201288, -0.4868126, 0, 0, 0, 1, 1,
-1.171817, 0.00793644, -1.46769, 0, 0, 0, 1, 1,
-1.165176, 0.4198266, 0.08119552, 0, 0, 0, 1, 1,
-1.152068, -0.9656116, -1.393935, 0, 0, 0, 1, 1,
-1.149698, 0.241258, -1.402817, 0, 0, 0, 1, 1,
-1.146492, 1.731883, -0.2217747, 0, 0, 0, 1, 1,
-1.143014, -0.6728171, -1.756459, 0, 0, 0, 1, 1,
-1.141905, -0.07966131, -3.832556, 1, 1, 1, 1, 1,
-1.138599, 1.386009, 0.8489791, 1, 1, 1, 1, 1,
-1.129837, -0.666321, -1.742655, 1, 1, 1, 1, 1,
-1.111432, 0.6582606, -2.009026, 1, 1, 1, 1, 1,
-1.108775, -0.1662961, 1.35979, 1, 1, 1, 1, 1,
-1.108308, 1.003166, -0.9914243, 1, 1, 1, 1, 1,
-1.105469, -0.9223837, -1.917419, 1, 1, 1, 1, 1,
-1.092907, -0.503709, -2.339298, 1, 1, 1, 1, 1,
-1.089759, 0.312056, -2.559363, 1, 1, 1, 1, 1,
-1.088506, -0.9234583, -1.141107, 1, 1, 1, 1, 1,
-1.08657, -0.4361543, -0.9648009, 1, 1, 1, 1, 1,
-1.086116, 0.7853636, -2.298953, 1, 1, 1, 1, 1,
-1.059399, -0.2180564, -0.3972833, 1, 1, 1, 1, 1,
-1.054514, 0.3871189, -0.1827149, 1, 1, 1, 1, 1,
-1.048705, -0.3784693, -2.014215, 1, 1, 1, 1, 1,
-1.048698, -0.1070525, -1.585257, 0, 0, 1, 1, 1,
-1.047003, -2.064941, -3.027753, 1, 0, 0, 1, 1,
-1.045041, 0.2113609, -1.149239, 1, 0, 0, 1, 1,
-1.040369, -0.5930399, -2.061252, 1, 0, 0, 1, 1,
-1.035242, -0.9230055, -3.581046, 1, 0, 0, 1, 1,
-1.033722, -0.06828123, -0.8650167, 1, 0, 0, 1, 1,
-1.033156, -1.500589, -2.039263, 0, 0, 0, 1, 1,
-1.030544, -0.7503929, -2.619363, 0, 0, 0, 1, 1,
-1.029292, 0.8883867, -0.6816378, 0, 0, 0, 1, 1,
-1.029273, 1.381854, -1.66874, 0, 0, 0, 1, 1,
-1.027667, -1.297513, -0.2999328, 0, 0, 0, 1, 1,
-1.023711, 0.6871932, -2.136325, 0, 0, 0, 1, 1,
-1.02028, 1.230847, -2.197905, 0, 0, 0, 1, 1,
-1.017592, -1.259604, -0.08972124, 1, 1, 1, 1, 1,
-1.013097, -1.8426, -2.615259, 1, 1, 1, 1, 1,
-1.009237, 0.1888339, -0.7765795, 1, 1, 1, 1, 1,
-1.002172, 1.489483, -0.559691, 1, 1, 1, 1, 1,
-1.001154, 0.3755905, 0.3553371, 1, 1, 1, 1, 1,
-1.000975, -0.936188, -2.577391, 1, 1, 1, 1, 1,
-1.000243, 0.1888348, -1.659258, 1, 1, 1, 1, 1,
-0.9936466, 1.049373, -1.059469, 1, 1, 1, 1, 1,
-0.9893503, -0.6474682, -1.57932, 1, 1, 1, 1, 1,
-0.9890545, 0.4394027, 0.4844918, 1, 1, 1, 1, 1,
-0.9772843, -0.4122972, -0.3313178, 1, 1, 1, 1, 1,
-0.9763557, -0.2788081, -0.9995146, 1, 1, 1, 1, 1,
-0.9751137, -0.4860002, -1.278979, 1, 1, 1, 1, 1,
-0.9751126, -0.155984, -0.3683515, 1, 1, 1, 1, 1,
-0.9749445, 0.06233874, -2.168893, 1, 1, 1, 1, 1,
-0.9649546, 0.9723788, -0.6189381, 0, 0, 1, 1, 1,
-0.962633, -0.4118434, -2.261211, 1, 0, 0, 1, 1,
-0.9620975, -0.05218157, 0.562914, 1, 0, 0, 1, 1,
-0.9523905, 0.07233904, -1.996714, 1, 0, 0, 1, 1,
-0.9519465, 0.1452518, -3.247455, 1, 0, 0, 1, 1,
-0.9448092, 0.7843772, -0.8857863, 1, 0, 0, 1, 1,
-0.9393069, -2.594604, -1.615655, 0, 0, 0, 1, 1,
-0.9375373, 0.3817903, -0.9698269, 0, 0, 0, 1, 1,
-0.9324756, 0.736122, -3.091808, 0, 0, 0, 1, 1,
-0.9299282, 0.1383448, -3.163969, 0, 0, 0, 1, 1,
-0.9285364, -1.093485, -1.440018, 0, 0, 0, 1, 1,
-0.9259641, -0.3729272, -0.9495974, 0, 0, 0, 1, 1,
-0.9228811, 0.6630056, -0.6608196, 0, 0, 0, 1, 1,
-0.9224899, 0.8305201, -0.2719279, 1, 1, 1, 1, 1,
-0.9210927, 2.0612, -0.5088628, 1, 1, 1, 1, 1,
-0.9203288, 0.5080092, -0.8515546, 1, 1, 1, 1, 1,
-0.9193197, 0.710344, -0.6582739, 1, 1, 1, 1, 1,
-0.9096984, -1.991178, -1.744627, 1, 1, 1, 1, 1,
-0.9040696, -0.4160682, -2.372139, 1, 1, 1, 1, 1,
-0.903881, -0.3000571, -1.751315, 1, 1, 1, 1, 1,
-0.9008402, 0.705937, 1.352876, 1, 1, 1, 1, 1,
-0.8996996, 0.3685835, -2.329987, 1, 1, 1, 1, 1,
-0.8973681, -2.808443, -4.719553, 1, 1, 1, 1, 1,
-0.8957464, -0.9555352, -1.052824, 1, 1, 1, 1, 1,
-0.8939754, -1.457633, -2.038069, 1, 1, 1, 1, 1,
-0.8934758, 0.4784074, 0.915564, 1, 1, 1, 1, 1,
-0.8906248, -0.4602597, -2.037478, 1, 1, 1, 1, 1,
-0.8903998, 1.23885, 0.5364271, 1, 1, 1, 1, 1,
-0.8902629, 1.672691, -0.9573541, 0, 0, 1, 1, 1,
-0.8900837, 0.5926266, -1.878289, 1, 0, 0, 1, 1,
-0.8897696, -1.141844, -3.060479, 1, 0, 0, 1, 1,
-0.8887914, -1.773303, -2.384084, 1, 0, 0, 1, 1,
-0.8843653, 1.405301, -0.06237196, 1, 0, 0, 1, 1,
-0.8837254, 0.7696522, 0.06799854, 1, 0, 0, 1, 1,
-0.8802805, -1.260134, -3.021882, 0, 0, 0, 1, 1,
-0.8738576, -0.3645536, -2.868289, 0, 0, 0, 1, 1,
-0.8725399, -0.3013169, -2.645167, 0, 0, 0, 1, 1,
-0.8686384, -0.7013134, -2.52874, 0, 0, 0, 1, 1,
-0.8677415, 0.2987446, -2.247371, 0, 0, 0, 1, 1,
-0.8667768, -1.373204, -3.577226, 0, 0, 0, 1, 1,
-0.8563255, 1.799144, -0.2860452, 0, 0, 0, 1, 1,
-0.8557605, -0.179542, -1.145172, 1, 1, 1, 1, 1,
-0.8413095, -1.319378, -3.067612, 1, 1, 1, 1, 1,
-0.8397729, 1.214769, 1.103641, 1, 1, 1, 1, 1,
-0.8378963, 0.5999728, -0.5051709, 1, 1, 1, 1, 1,
-0.8320228, 0.1753111, -3.107124, 1, 1, 1, 1, 1,
-0.8264727, 0.4491074, -1.329326, 1, 1, 1, 1, 1,
-0.8254049, -0.1507415, -2.57184, 1, 1, 1, 1, 1,
-0.8173745, 2.979055, -0.3397181, 1, 1, 1, 1, 1,
-0.8134276, 1.086395, -0.7917654, 1, 1, 1, 1, 1,
-0.8081288, 1.43921, 0.7946389, 1, 1, 1, 1, 1,
-0.8078436, 0.1908184, -1.087155, 1, 1, 1, 1, 1,
-0.8061284, -1.32037, -2.401049, 1, 1, 1, 1, 1,
-0.8016458, -0.5505618, -1.123879, 1, 1, 1, 1, 1,
-0.7998469, -0.7089966, -2.920937, 1, 1, 1, 1, 1,
-0.7996824, 2.238361, 0.7759395, 1, 1, 1, 1, 1,
-0.7932622, 0.07898328, -1.92146, 0, 0, 1, 1, 1,
-0.7930355, -0.138939, -1.680124, 1, 0, 0, 1, 1,
-0.7889182, -0.7453031, -2.837327, 1, 0, 0, 1, 1,
-0.7881353, -0.87808, -0.8323327, 1, 0, 0, 1, 1,
-0.7872121, -0.8043844, -1.142322, 1, 0, 0, 1, 1,
-0.7854422, -0.8603696, -2.367344, 1, 0, 0, 1, 1,
-0.7805728, 0.4384465, 0.5211715, 0, 0, 0, 1, 1,
-0.7738917, 0.5013176, -1.016356, 0, 0, 0, 1, 1,
-0.7727834, -0.7658175, -2.592648, 0, 0, 0, 1, 1,
-0.7723351, -0.0853324, -0.2237409, 0, 0, 0, 1, 1,
-0.7709907, 0.3939418, -0.6659465, 0, 0, 0, 1, 1,
-0.7706019, -0.5926764, -2.062091, 0, 0, 0, 1, 1,
-0.7673342, 0.884115, 1.042027, 0, 0, 0, 1, 1,
-0.7670158, 1.034023, 0.2039418, 1, 1, 1, 1, 1,
-0.7668371, 0.7189209, -2.158947, 1, 1, 1, 1, 1,
-0.7616653, -0.8546109, -3.933679, 1, 1, 1, 1, 1,
-0.7615135, -0.217495, -4.3417, 1, 1, 1, 1, 1,
-0.7576861, -0.3711777, -1.952817, 1, 1, 1, 1, 1,
-0.7550084, 0.4795972, 0.9311472, 1, 1, 1, 1, 1,
-0.7542031, 0.5235013, -0.8309845, 1, 1, 1, 1, 1,
-0.7494234, 0.0494011, -0.9797214, 1, 1, 1, 1, 1,
-0.7485901, 1.620416, -0.4786984, 1, 1, 1, 1, 1,
-0.7481162, -0.1652271, -1.776502, 1, 1, 1, 1, 1,
-0.7453982, 0.1323662, -0.9322907, 1, 1, 1, 1, 1,
-0.7452553, -0.3261375, -1.768536, 1, 1, 1, 1, 1,
-0.7432527, -0.56445, -1.516981, 1, 1, 1, 1, 1,
-0.742479, -1.334821, -3.088615, 1, 1, 1, 1, 1,
-0.7329927, -0.9992482, -1.402081, 1, 1, 1, 1, 1,
-0.7312955, 0.002125914, -1.942241, 0, 0, 1, 1, 1,
-0.723626, -0.2477164, -1.847209, 1, 0, 0, 1, 1,
-0.7205255, -0.04882701, -0.8709221, 1, 0, 0, 1, 1,
-0.7197711, -1.64655, -1.448457, 1, 0, 0, 1, 1,
-0.7168066, -0.1971999, -1.52789, 1, 0, 0, 1, 1,
-0.7135792, -0.2011658, -2.224183, 1, 0, 0, 1, 1,
-0.7017151, -0.5313961, -0.989722, 0, 0, 0, 1, 1,
-0.697224, -0.7655021, -2.548313, 0, 0, 0, 1, 1,
-0.6943705, -1.621228, -3.309887, 0, 0, 0, 1, 1,
-0.6933133, 0.6836319, -1.620678, 0, 0, 0, 1, 1,
-0.6923699, -1.202759, -1.802046, 0, 0, 0, 1, 1,
-0.6919733, -0.3301293, -3.087507, 0, 0, 0, 1, 1,
-0.6856089, -0.2339128, -2.770263, 0, 0, 0, 1, 1,
-0.6823828, 0.9444846, -1.034113, 1, 1, 1, 1, 1,
-0.6821985, 0.2243419, -1.598174, 1, 1, 1, 1, 1,
-0.6793582, 0.3874926, -2.474385, 1, 1, 1, 1, 1,
-0.6684632, 0.1769842, -0.8432038, 1, 1, 1, 1, 1,
-0.6653799, 0.2400973, -1.011908, 1, 1, 1, 1, 1,
-0.6612764, 0.1336498, -3.000111, 1, 1, 1, 1, 1,
-0.6575317, 0.2030736, -2.135091, 1, 1, 1, 1, 1,
-0.6505274, -1.763861, -2.366835, 1, 1, 1, 1, 1,
-0.6453778, 0.1585836, -2.315284, 1, 1, 1, 1, 1,
-0.6411381, 2.508354, 0.5859165, 1, 1, 1, 1, 1,
-0.6264312, 1.61345, -0.5646972, 1, 1, 1, 1, 1,
-0.62022, -0.2030123, -0.868839, 1, 1, 1, 1, 1,
-0.6190134, 0.2603414, -1.477194, 1, 1, 1, 1, 1,
-0.6122057, -0.8007046, -2.721351, 1, 1, 1, 1, 1,
-0.6091253, 1.534656, 0.7560633, 1, 1, 1, 1, 1,
-0.6036515, 0.08186792, -1.48132, 0, 0, 1, 1, 1,
-0.6028059, 0.357573, -1.151701, 1, 0, 0, 1, 1,
-0.5988032, -0.1085402, -2.357639, 1, 0, 0, 1, 1,
-0.5956239, 0.07570101, -1.582484, 1, 0, 0, 1, 1,
-0.5924159, -0.3175104, -2.109586, 1, 0, 0, 1, 1,
-0.5802667, 0.567469, -1.575586, 1, 0, 0, 1, 1,
-0.5782071, -0.164917, -2.822784, 0, 0, 0, 1, 1,
-0.5768441, 1.987328, -0.1375031, 0, 0, 0, 1, 1,
-0.5767786, 0.7003173, -1.228056, 0, 0, 0, 1, 1,
-0.5762913, 0.5746138, -2.33195, 0, 0, 0, 1, 1,
-0.575559, 1.864702, -1.124638, 0, 0, 0, 1, 1,
-0.5691543, 0.013085, -3.449717, 0, 0, 0, 1, 1,
-0.5688312, -0.1778941, -1.874046, 0, 0, 0, 1, 1,
-0.5680421, -0.1943269, -1.682188, 1, 1, 1, 1, 1,
-0.5660287, 1.140493, 0.2820637, 1, 1, 1, 1, 1,
-0.5650942, -0.2639364, -1.585692, 1, 1, 1, 1, 1,
-0.5646375, 0.6315446, -1.152521, 1, 1, 1, 1, 1,
-0.5621721, 0.7538514, -1.28503, 1, 1, 1, 1, 1,
-0.560963, 2.083828, -0.09121573, 1, 1, 1, 1, 1,
-0.5609087, 1.179835, -1.131557, 1, 1, 1, 1, 1,
-0.5562298, -0.9387935, -5.851364, 1, 1, 1, 1, 1,
-0.5511667, 0.2508429, 0.386944, 1, 1, 1, 1, 1,
-0.5491151, 0.1881666, -0.7872499, 1, 1, 1, 1, 1,
-0.54678, 1.21309, 1.881142, 1, 1, 1, 1, 1,
-0.5459914, -0.5746922, -3.111674, 1, 1, 1, 1, 1,
-0.543515, 1.061499, 0.2013414, 1, 1, 1, 1, 1,
-0.543026, 0.1612698, -0.9535381, 1, 1, 1, 1, 1,
-0.5368456, -1.065737, -0.9425895, 1, 1, 1, 1, 1,
-0.5338567, 0.1055359, -0.2416515, 0, 0, 1, 1, 1,
-0.5290716, -1.561928, -1.961105, 1, 0, 0, 1, 1,
-0.5290428, 0.109199, -1.418862, 1, 0, 0, 1, 1,
-0.5207499, 1.861529, -0.3990074, 1, 0, 0, 1, 1,
-0.5133478, -1.105449, -2.690861, 1, 0, 0, 1, 1,
-0.5127289, 0.2889846, -0.2838851, 1, 0, 0, 1, 1,
-0.5008777, 1.344633, -1.748689, 0, 0, 0, 1, 1,
-0.4995745, -0.2422081, -0.7638087, 0, 0, 0, 1, 1,
-0.4994811, 1.191181, -0.6124098, 0, 0, 0, 1, 1,
-0.4992756, 0.2801104, -0.8585721, 0, 0, 0, 1, 1,
-0.4970479, 1.260434, -0.7892613, 0, 0, 0, 1, 1,
-0.4955652, 0.0914258, 0.2348358, 0, 0, 0, 1, 1,
-0.4945704, 0.2236969, -0.7742075, 0, 0, 0, 1, 1,
-0.4944738, 0.2010363, -0.4746571, 1, 1, 1, 1, 1,
-0.4942373, -1.580286, -2.213625, 1, 1, 1, 1, 1,
-0.4937828, -1.327502, -5.024055, 1, 1, 1, 1, 1,
-0.4864909, -1.087484, -2.032966, 1, 1, 1, 1, 1,
-0.4855999, 0.4901655, 0.1134115, 1, 1, 1, 1, 1,
-0.4851426, -0.4724075, -2.63406, 1, 1, 1, 1, 1,
-0.4844561, 0.8169963, -0.2768487, 1, 1, 1, 1, 1,
-0.4782101, -1.656566, -2.325126, 1, 1, 1, 1, 1,
-0.4765213, -0.7300379, -0.13494, 1, 1, 1, 1, 1,
-0.4752406, 0.5528597, -0.8591338, 1, 1, 1, 1, 1,
-0.475144, -0.902155, -3.64112, 1, 1, 1, 1, 1,
-0.4732011, 0.3648192, -1.39665, 1, 1, 1, 1, 1,
-0.4711427, -0.2044437, -1.126204, 1, 1, 1, 1, 1,
-0.4664141, 1.60251, -0.5425338, 1, 1, 1, 1, 1,
-0.464654, 0.1888535, -0.8568727, 1, 1, 1, 1, 1,
-0.4622428, 0.9537452, -0.6343098, 0, 0, 1, 1, 1,
-0.4617798, -0.0377365, -1.003594, 1, 0, 0, 1, 1,
-0.4583254, 1.227465, -0.2947366, 1, 0, 0, 1, 1,
-0.4574855, 0.01363149, -0.6112647, 1, 0, 0, 1, 1,
-0.4566987, 0.407292, -0.7774332, 1, 0, 0, 1, 1,
-0.4546147, 0.6185361, -0.3876452, 1, 0, 0, 1, 1,
-0.4470622, 0.394421, -0.8185161, 0, 0, 0, 1, 1,
-0.4459455, -1.49813, -1.776479, 0, 0, 0, 1, 1,
-0.4453, 0.7684579, -0.1112785, 0, 0, 0, 1, 1,
-0.4451956, -0.3789982, -2.285747, 0, 0, 0, 1, 1,
-0.4428393, -0.650243, -2.887151, 0, 0, 0, 1, 1,
-0.4422233, -1.104114, -2.289774, 0, 0, 0, 1, 1,
-0.439393, -1.091159, -2.664824, 0, 0, 0, 1, 1,
-0.4347377, 1.160464, 0.3491974, 1, 1, 1, 1, 1,
-0.43455, -1.315264, -1.620611, 1, 1, 1, 1, 1,
-0.4213873, -0.7528484, -1.618243, 1, 1, 1, 1, 1,
-0.4182932, -0.3034037, -3.176709, 1, 1, 1, 1, 1,
-0.4173065, 1.565591, -0.1919568, 1, 1, 1, 1, 1,
-0.4163124, -0.6672724, -3.929719, 1, 1, 1, 1, 1,
-0.4159419, -0.3713421, -2.444081, 1, 1, 1, 1, 1,
-0.4098832, -1.39133, -2.793381, 1, 1, 1, 1, 1,
-0.4096172, -0.8809513, -1.57517, 1, 1, 1, 1, 1,
-0.4094908, -0.727325, -3.242013, 1, 1, 1, 1, 1,
-0.408634, -1.443513, -3.372068, 1, 1, 1, 1, 1,
-0.4070936, -1.072219, -3.135868, 1, 1, 1, 1, 1,
-0.4060301, 1.488886, -0.5846299, 1, 1, 1, 1, 1,
-0.4042919, -0.9715646, -4.089701, 1, 1, 1, 1, 1,
-0.4032343, -2.136231, -2.466963, 1, 1, 1, 1, 1,
-0.3997485, 0.7626807, -1.678985, 0, 0, 1, 1, 1,
-0.3979596, 1.419405, 0.1095253, 1, 0, 0, 1, 1,
-0.3906452, 1.057445, -2.162581, 1, 0, 0, 1, 1,
-0.3892918, 0.1296416, -0.09411807, 1, 0, 0, 1, 1,
-0.3892577, -0.7042792, -3.042253, 1, 0, 0, 1, 1,
-0.3892334, -0.9268991, -2.726139, 1, 0, 0, 1, 1,
-0.3887843, -0.1499962, -2.220132, 0, 0, 0, 1, 1,
-0.3866644, -0.9464739, -4.643523, 0, 0, 0, 1, 1,
-0.3866084, 0.868682, -1.219654, 0, 0, 0, 1, 1,
-0.3862057, 0.6831185, -1.281516, 0, 0, 0, 1, 1,
-0.3842751, -1.263273, -2.538255, 0, 0, 0, 1, 1,
-0.3840227, 0.0636667, -2.049442, 0, 0, 0, 1, 1,
-0.3823763, 1.304073, 1.324776, 0, 0, 0, 1, 1,
-0.377532, 0.2523861, -0.5989062, 1, 1, 1, 1, 1,
-0.3767284, -2.016228, -2.349296, 1, 1, 1, 1, 1,
-0.3746651, 1.363174, -1.430799, 1, 1, 1, 1, 1,
-0.3715564, 0.483443, -1.05554, 1, 1, 1, 1, 1,
-0.3685439, -0.2343068, -2.65615, 1, 1, 1, 1, 1,
-0.3671, 0.3571663, -0.859987, 1, 1, 1, 1, 1,
-0.3666134, 1.938327, -0.4846114, 1, 1, 1, 1, 1,
-0.3628648, 1.125106, 1.114231, 1, 1, 1, 1, 1,
-0.3622628, 1.644782, -2.120755, 1, 1, 1, 1, 1,
-0.3620884, 0.159999, -0.4995503, 1, 1, 1, 1, 1,
-0.3597631, -0.7894782, -3.345933, 1, 1, 1, 1, 1,
-0.3585031, 0.4343841, -0.4932433, 1, 1, 1, 1, 1,
-0.3566888, -0.6314024, -0.4791397, 1, 1, 1, 1, 1,
-0.3515823, -0.04576538, -1.919002, 1, 1, 1, 1, 1,
-0.3494098, 1.482695, -0.1080593, 1, 1, 1, 1, 1,
-0.3490082, -0.8339862, -1.233375, 0, 0, 1, 1, 1,
-0.3311098, -1.223984, -4.903391, 1, 0, 0, 1, 1,
-0.3281621, -0.3625536, -2.565574, 1, 0, 0, 1, 1,
-0.3237804, -0.4966139, -0.7761925, 1, 0, 0, 1, 1,
-0.3225374, 0.9561312, 0.1362871, 1, 0, 0, 1, 1,
-0.3206528, -0.7803315, -2.911847, 1, 0, 0, 1, 1,
-0.3117745, -1.636771, -2.689317, 0, 0, 0, 1, 1,
-0.3117557, 1.196334, -0.7346229, 0, 0, 0, 1, 1,
-0.3112595, -0.6283675, -0.981134, 0, 0, 0, 1, 1,
-0.3094764, 1.154274, 0.09809194, 0, 0, 0, 1, 1,
-0.309088, -1.281568, -3.294499, 0, 0, 0, 1, 1,
-0.3087545, -1.13562, -1.989311, 0, 0, 0, 1, 1,
-0.3000327, 2.835508, -0.2783436, 0, 0, 0, 1, 1,
-0.2993526, -0.1317034, -0.8094341, 1, 1, 1, 1, 1,
-0.2986532, 0.09156572, -1.664076, 1, 1, 1, 1, 1,
-0.2978049, -0.4130515, -2.591716, 1, 1, 1, 1, 1,
-0.2973602, 0.953793, -0.4615161, 1, 1, 1, 1, 1,
-0.2926713, -0.4711103, -3.073008, 1, 1, 1, 1, 1,
-0.2903803, -0.8427391, -2.132693, 1, 1, 1, 1, 1,
-0.2874329, 0.2096575, -1.83243, 1, 1, 1, 1, 1,
-0.2812659, 0.4873948, -1.732364, 1, 1, 1, 1, 1,
-0.2803071, -2.17554, -3.634525, 1, 1, 1, 1, 1,
-0.2802973, -0.4991722, -2.644107, 1, 1, 1, 1, 1,
-0.2801227, -0.09463623, -2.109977, 1, 1, 1, 1, 1,
-0.2786527, -0.9522704, -2.747802, 1, 1, 1, 1, 1,
-0.2769979, 1.844597, 0.7284483, 1, 1, 1, 1, 1,
-0.2669174, -0.1831917, -2.622368, 1, 1, 1, 1, 1,
-0.2659202, -1.711327, -3.3103, 1, 1, 1, 1, 1,
-0.2569103, 0.7252722, -0.030133, 0, 0, 1, 1, 1,
-0.2520271, -0.5875692, -2.888136, 1, 0, 0, 1, 1,
-0.2519338, -0.2558278, -1.104298, 1, 0, 0, 1, 1,
-0.2502142, -0.9561023, -0.7017213, 1, 0, 0, 1, 1,
-0.2487082, -0.2929548, -1.307334, 1, 0, 0, 1, 1,
-0.2482885, -1.417516, -2.12402, 1, 0, 0, 1, 1,
-0.2480476, -0.1828084, -3.286244, 0, 0, 0, 1, 1,
-0.2476029, -1.223866, -1.002964, 0, 0, 0, 1, 1,
-0.2434135, 0.6154715, -0.9547443, 0, 0, 0, 1, 1,
-0.2431843, -0.608062, -2.942103, 0, 0, 0, 1, 1,
-0.2376353, -1.012564, -3.179273, 0, 0, 0, 1, 1,
-0.2366551, -0.5063261, -2.069934, 0, 0, 0, 1, 1,
-0.2261349, -1.652168, -1.06617, 0, 0, 0, 1, 1,
-0.2248479, 0.3898254, 0.4814658, 1, 1, 1, 1, 1,
-0.2246078, 2.064128, -0.7258534, 1, 1, 1, 1, 1,
-0.2200055, -1.288406, -1.367779, 1, 1, 1, 1, 1,
-0.2175055, 0.5052046, -0.7926958, 1, 1, 1, 1, 1,
-0.2140909, 0.808059, -0.8342914, 1, 1, 1, 1, 1,
-0.213548, -0.1770454, -3.407748, 1, 1, 1, 1, 1,
-0.2111691, 0.373502, -2.348753, 1, 1, 1, 1, 1,
-0.2081017, -0.7647349, -2.029493, 1, 1, 1, 1, 1,
-0.2061021, 0.341169, -0.5783067, 1, 1, 1, 1, 1,
-0.2056507, -0.5710765, -2.331823, 1, 1, 1, 1, 1,
-0.2044542, 1.075693, -0.01292407, 1, 1, 1, 1, 1,
-0.2038725, -0.1647941, -1.932169, 1, 1, 1, 1, 1,
-0.1920919, -0.4272715, -4.054426, 1, 1, 1, 1, 1,
-0.1882203, -0.7545767, -0.3073635, 1, 1, 1, 1, 1,
-0.1861727, -0.09697253, -2.677269, 1, 1, 1, 1, 1,
-0.1822698, -2.271815, -2.523686, 0, 0, 1, 1, 1,
-0.1798668, 0.5684742, -0.9929887, 1, 0, 0, 1, 1,
-0.1795233, -0.2677676, -3.449208, 1, 0, 0, 1, 1,
-0.178612, 0.6194968, -1.101023, 1, 0, 0, 1, 1,
-0.1783707, 0.2901536, -2.164114, 1, 0, 0, 1, 1,
-0.1764011, -0.7047756, -2.521835, 1, 0, 0, 1, 1,
-0.1737519, 0.2554657, 0.4897171, 0, 0, 0, 1, 1,
-0.1721134, 0.7146461, -0.6841347, 0, 0, 0, 1, 1,
-0.1689113, 0.9317051, -0.6462888, 0, 0, 0, 1, 1,
-0.1670096, 1.932849, 0.1160404, 0, 0, 0, 1, 1,
-0.1627773, 2.060709, 0.5347295, 0, 0, 0, 1, 1,
-0.1598454, -2.129271, -3.499922, 0, 0, 0, 1, 1,
-0.1582814, 0.4781014, 0.4347079, 0, 0, 0, 1, 1,
-0.1576026, -1.00805, -1.76444, 1, 1, 1, 1, 1,
-0.157347, 0.1824758, -0.3924296, 1, 1, 1, 1, 1,
-0.1562569, -1.620857, -1.755449, 1, 1, 1, 1, 1,
-0.1538959, -0.5826649, -0.9456317, 1, 1, 1, 1, 1,
-0.1509013, 0.1862953, -1.016283, 1, 1, 1, 1, 1,
-0.1464447, 0.1303413, -0.1981921, 1, 1, 1, 1, 1,
-0.14142, 0.3939271, -1.653815, 1, 1, 1, 1, 1,
-0.1384318, -0.7897862, -2.783768, 1, 1, 1, 1, 1,
-0.135656, -0.5433683, -1.848642, 1, 1, 1, 1, 1,
-0.1314378, -0.0977559, -1.538322, 1, 1, 1, 1, 1,
-0.1302695, 0.4331296, -1.239769, 1, 1, 1, 1, 1,
-0.1300098, 0.7579196, 0.009628399, 1, 1, 1, 1, 1,
-0.1297921, 0.1302636, -0.7305645, 1, 1, 1, 1, 1,
-0.1289579, 1.713023, -0.7097918, 1, 1, 1, 1, 1,
-0.1259436, 0.5369786, -0.7510384, 1, 1, 1, 1, 1,
-0.1230967, -1.458323, -3.346627, 0, 0, 1, 1, 1,
-0.1212664, 1.126014, 1.526129, 1, 0, 0, 1, 1,
-0.1182173, -1.215768, -3.0862, 1, 0, 0, 1, 1,
-0.117076, 1.213012, -0.4376956, 1, 0, 0, 1, 1,
-0.1112264, 0.2321094, -0.4882545, 1, 0, 0, 1, 1,
-0.1089561, 0.4278241, 0.8481208, 1, 0, 0, 1, 1,
-0.1082056, -0.06749601, -2.556182, 0, 0, 0, 1, 1,
-0.1021576, 0.3322087, 0.1364287, 0, 0, 0, 1, 1,
-0.09860756, -0.6633134, -1.959712, 0, 0, 0, 1, 1,
-0.0973414, 0.5241532, -0.4914232, 0, 0, 0, 1, 1,
-0.09484173, 0.1953902, 0.2588339, 0, 0, 0, 1, 1,
-0.09397344, 0.7172198, 0.05425782, 0, 0, 0, 1, 1,
-0.09131361, 1.718684, 0.05842171, 0, 0, 0, 1, 1,
-0.09121024, -1.484371, -3.775136, 1, 1, 1, 1, 1,
-0.08625527, -0.0001849544, -0.7671989, 1, 1, 1, 1, 1,
-0.08150523, -0.599142, -3.690383, 1, 1, 1, 1, 1,
-0.08141987, -1.520671, -2.349785, 1, 1, 1, 1, 1,
-0.07174922, 0.1324772, 0.2183931, 1, 1, 1, 1, 1,
-0.07097922, 0.6298118, 1.024099, 1, 1, 1, 1, 1,
-0.07034634, 1.402933, 0.1342688, 1, 1, 1, 1, 1,
-0.06821105, -0.09179275, 0.05486618, 1, 1, 1, 1, 1,
-0.06416188, 1.143693, -1.025728, 1, 1, 1, 1, 1,
-0.06195595, 0.222339, -0.06723668, 1, 1, 1, 1, 1,
-0.06093012, -1.131416, -2.473136, 1, 1, 1, 1, 1,
-0.05632975, 1.443013, -0.2372897, 1, 1, 1, 1, 1,
-0.05409501, 0.472837, -1.95982, 1, 1, 1, 1, 1,
-0.05335293, 0.6447491, -0.7322964, 1, 1, 1, 1, 1,
-0.05200385, -0.3789474, -1.31743, 1, 1, 1, 1, 1,
-0.05079691, 1.969699, 1.404296, 0, 0, 1, 1, 1,
-0.0504309, -0.02296595, -2.155952, 1, 0, 0, 1, 1,
-0.0485865, 0.9451171, -0.03268505, 1, 0, 0, 1, 1,
-0.04694841, 0.5128914, 0.2443853, 1, 0, 0, 1, 1,
-0.04443008, -0.05381635, -2.512759, 1, 0, 0, 1, 1,
-0.04341785, -0.07004838, -2.494409, 1, 0, 0, 1, 1,
-0.04132568, 0.1410944, -0.09671007, 0, 0, 0, 1, 1,
-0.04094197, -1.587117, -3.398067, 0, 0, 0, 1, 1,
-0.03221451, -2.477813, -2.623456, 0, 0, 0, 1, 1,
-0.02952448, 0.05913024, 0.2356987, 0, 0, 0, 1, 1,
-0.02939714, 0.002149867, -1.31093, 0, 0, 0, 1, 1,
-0.0272028, -0.2420525, -2.667126, 0, 0, 0, 1, 1,
-0.02621936, 0.1736485, -1.633654, 0, 0, 0, 1, 1,
-0.02487648, -0.04906515, -3.478168, 1, 1, 1, 1, 1,
-0.02075207, 0.1339752, 0.5470217, 1, 1, 1, 1, 1,
-0.02061395, -1.071909, -3.158535, 1, 1, 1, 1, 1,
-0.01836691, 0.2711171, -1.00365, 1, 1, 1, 1, 1,
-0.01662105, -2.481988, -1.234168, 1, 1, 1, 1, 1,
-0.01483412, -1.57246, -4.428498, 1, 1, 1, 1, 1,
-0.01387912, 1.102633, -0.3118744, 1, 1, 1, 1, 1,
-0.01278159, 0.9550627, -1.16309, 1, 1, 1, 1, 1,
-0.01192512, -0.3941602, -2.96905, 1, 1, 1, 1, 1,
-0.0115882, -0.7601388, -3.69072, 1, 1, 1, 1, 1,
-0.01055947, -0.1919581, -2.15029, 1, 1, 1, 1, 1,
-0.007347572, 0.6646958, -0.6319967, 1, 1, 1, 1, 1,
-0.002659896, 0.7123494, -0.1906674, 1, 1, 1, 1, 1,
0.00697108, -1.306474, 3.689178, 1, 1, 1, 1, 1,
0.008175951, -0.7173076, 2.873515, 1, 1, 1, 1, 1,
0.01720152, -0.3938678, 2.481272, 0, 0, 1, 1, 1,
0.01765399, 0.09511546, 0.08068545, 1, 0, 0, 1, 1,
0.0210373, 1.83591, -0.7497215, 1, 0, 0, 1, 1,
0.02399178, 0.8611402, -0.9419521, 1, 0, 0, 1, 1,
0.02400327, -0.06840886, 2.3369, 1, 0, 0, 1, 1,
0.02452514, 0.1941939, 0.6454883, 1, 0, 0, 1, 1,
0.03107398, -1.222416, 3.334641, 0, 0, 0, 1, 1,
0.03948452, -0.4222549, 4.844096, 0, 0, 0, 1, 1,
0.03968458, 0.5932269, 0.7750664, 0, 0, 0, 1, 1,
0.04237141, 0.1105016, 1.653268, 0, 0, 0, 1, 1,
0.04272373, 0.2458155, -0.8578987, 0, 0, 0, 1, 1,
0.04333129, -1.428476, 3.229995, 0, 0, 0, 1, 1,
0.04576201, -1.130865, 3.925261, 0, 0, 0, 1, 1,
0.04766652, -0.3605905, 3.724255, 1, 1, 1, 1, 1,
0.04813915, -1.047305, 3.573226, 1, 1, 1, 1, 1,
0.05017131, -0.2082612, 1.117783, 1, 1, 1, 1, 1,
0.05586543, 0.6390641, 1.049416, 1, 1, 1, 1, 1,
0.05758205, 0.07740185, -0.53949, 1, 1, 1, 1, 1,
0.05763239, -0.2355534, 2.777827, 1, 1, 1, 1, 1,
0.06156366, -1.086222, 3.499847, 1, 1, 1, 1, 1,
0.06423544, 0.4668595, 0.6615418, 1, 1, 1, 1, 1,
0.064836, -0.09631621, 2.628379, 1, 1, 1, 1, 1,
0.06490378, 0.2133036, -0.5793404, 1, 1, 1, 1, 1,
0.06829259, 1.690551, -1.322114, 1, 1, 1, 1, 1,
0.06908012, 0.3086531, -0.06715176, 1, 1, 1, 1, 1,
0.07034662, 0.1824318, 0.7862053, 1, 1, 1, 1, 1,
0.07098188, 0.2126652, -0.4285394, 1, 1, 1, 1, 1,
0.07719078, -0.5411391, 4.69749, 1, 1, 1, 1, 1,
0.07937618, 1.053681, 0.8623852, 0, 0, 1, 1, 1,
0.08543891, -0.8667777, 4.637084, 1, 0, 0, 1, 1,
0.08697853, 0.5562265, 0.5017892, 1, 0, 0, 1, 1,
0.08844954, -0.3405833, 1.877073, 1, 0, 0, 1, 1,
0.08897079, -0.4679784, 2.650946, 1, 0, 0, 1, 1,
0.0971453, -0.03997957, 1.165807, 1, 0, 0, 1, 1,
0.09827425, 0.8990127, 0.5078837, 0, 0, 0, 1, 1,
0.1007773, -0.4070158, 1.274107, 0, 0, 0, 1, 1,
0.1025016, 0.6234034, -2.015407, 0, 0, 0, 1, 1,
0.1037345, -0.1074, 2.563903, 0, 0, 0, 1, 1,
0.1044407, 0.8946649, -0.7726868, 0, 0, 0, 1, 1,
0.1048584, 0.2608427, 2.677905, 0, 0, 0, 1, 1,
0.1066252, 0.9501823, -1.70814, 0, 0, 0, 1, 1,
0.1142379, 0.3351991, 1.288011, 1, 1, 1, 1, 1,
0.1220706, -1.54674, 3.628869, 1, 1, 1, 1, 1,
0.127126, -1.038095, 3.225374, 1, 1, 1, 1, 1,
0.1291008, -1.938285, 3.392333, 1, 1, 1, 1, 1,
0.129348, -0.1678968, 2.949953, 1, 1, 1, 1, 1,
0.1322128, -0.1334191, 1.998397, 1, 1, 1, 1, 1,
0.1322503, -0.0811667, 2.502892, 1, 1, 1, 1, 1,
0.1323046, 0.8559864, 0.6355473, 1, 1, 1, 1, 1,
0.1325395, -0.358899, 4.112667, 1, 1, 1, 1, 1,
0.1332258, 0.6378946, 2.491982, 1, 1, 1, 1, 1,
0.133916, 1.070632, -0.3374864, 1, 1, 1, 1, 1,
0.1351067, -0.0824216, 1.23069, 1, 1, 1, 1, 1,
0.1383105, 0.2134073, 1.095434, 1, 1, 1, 1, 1,
0.1417572, 1.602085, 1.025819, 1, 1, 1, 1, 1,
0.1420994, 0.9158554, 0.730759, 1, 1, 1, 1, 1,
0.1442144, -1.517414, 2.895161, 0, 0, 1, 1, 1,
0.1448648, -0.4393885, 1.732978, 1, 0, 0, 1, 1,
0.1501389, -1.458114, 3.502108, 1, 0, 0, 1, 1,
0.1510761, -2.111915, 3.077008, 1, 0, 0, 1, 1,
0.1534461, -0.252981, 1.532187, 1, 0, 0, 1, 1,
0.1538688, -0.3961632, 3.535583, 1, 0, 0, 1, 1,
0.1622858, 1.323839, -0.7277294, 0, 0, 0, 1, 1,
0.1647903, 0.383316, 0.6309018, 0, 0, 0, 1, 1,
0.1649615, 0.9273057, 1.567948, 0, 0, 0, 1, 1,
0.1653838, 0.1592286, 2.045586, 0, 0, 0, 1, 1,
0.1771752, 0.2295849, 0.363716, 0, 0, 0, 1, 1,
0.1774004, -0.8738773, 3.187486, 0, 0, 0, 1, 1,
0.1787034, -0.4097987, 2.914303, 0, 0, 0, 1, 1,
0.1800488, -1.624409, 2.50519, 1, 1, 1, 1, 1,
0.1819843, 0.8004891, 1.089275, 1, 1, 1, 1, 1,
0.1837726, -0.7661293, 3.558193, 1, 1, 1, 1, 1,
0.184247, -0.2012032, 3.388926, 1, 1, 1, 1, 1,
0.1863057, 0.3708306, 1.652004, 1, 1, 1, 1, 1,
0.1872644, 0.7722704, -0.4588967, 1, 1, 1, 1, 1,
0.1909387, -0.7720306, 3.886222, 1, 1, 1, 1, 1,
0.1934134, 0.6707847, 0.5209029, 1, 1, 1, 1, 1,
0.1936682, 0.3179001, 0.1561106, 1, 1, 1, 1, 1,
0.1955814, 0.79075, 0.5600193, 1, 1, 1, 1, 1,
0.1955839, 3.890775, -1.230232, 1, 1, 1, 1, 1,
0.1958813, 0.9627163, -1.483661, 1, 1, 1, 1, 1,
0.1980661, 1.232473, 0.6349108, 1, 1, 1, 1, 1,
0.199981, -1.532248, 2.329164, 1, 1, 1, 1, 1,
0.2079131, -0.1326223, 2.751555, 1, 1, 1, 1, 1,
0.2079346, -0.6141737, 3.939131, 0, 0, 1, 1, 1,
0.2081639, -1.609265, 2.833026, 1, 0, 0, 1, 1,
0.2097789, -0.05765157, 3.251395, 1, 0, 0, 1, 1,
0.2120837, -0.8722256, 2.839067, 1, 0, 0, 1, 1,
0.21217, 0.2332894, -0.6554761, 1, 0, 0, 1, 1,
0.2141497, 1.761426, 0.3225547, 1, 0, 0, 1, 1,
0.2143337, -0.3134823, 2.380146, 0, 0, 0, 1, 1,
0.2161652, 0.03172025, 2.074267, 0, 0, 0, 1, 1,
0.2174351, -0.5816438, 2.876374, 0, 0, 0, 1, 1,
0.2196127, -0.511516, 1.255654, 0, 0, 0, 1, 1,
0.2199704, 1.497183, 1.082224, 0, 0, 0, 1, 1,
0.2236144, 1.452832, 0.4366446, 0, 0, 0, 1, 1,
0.2251294, -1.345415, 2.580018, 0, 0, 0, 1, 1,
0.2296163, -0.3244239, 2.082339, 1, 1, 1, 1, 1,
0.2378478, 0.6229871, -0.02075021, 1, 1, 1, 1, 1,
0.2408114, 1.943197, -1.675547, 1, 1, 1, 1, 1,
0.247717, 0.1435375, 2.312264, 1, 1, 1, 1, 1,
0.2488635, 1.320648, -1.883022, 1, 1, 1, 1, 1,
0.2489332, -0.5631, 2.3144, 1, 1, 1, 1, 1,
0.2493459, -0.3366903, 2.340989, 1, 1, 1, 1, 1,
0.2496296, 0.8262517, -0.3492473, 1, 1, 1, 1, 1,
0.2541593, 0.1039675, 2.252444, 1, 1, 1, 1, 1,
0.2557855, -1.461769, 2.311606, 1, 1, 1, 1, 1,
0.2560374, -1.531031, 1.946245, 1, 1, 1, 1, 1,
0.2563564, 0.6682861, 1.524891, 1, 1, 1, 1, 1,
0.2692205, 0.4184231, -0.354365, 1, 1, 1, 1, 1,
0.2788613, -1.295366, 3.435875, 1, 1, 1, 1, 1,
0.2789615, 0.02625619, 1.899439, 1, 1, 1, 1, 1,
0.2793076, -1.721827, 5.127792, 0, 0, 1, 1, 1,
0.2813328, -1.747273, 2.151432, 1, 0, 0, 1, 1,
0.2832486, -2.063126, 2.003191, 1, 0, 0, 1, 1,
0.2935241, -0.1995823, 3.735067, 1, 0, 0, 1, 1,
0.2980211, 0.4509198, 0.2091238, 1, 0, 0, 1, 1,
0.3018956, -0.5736728, 1.859176, 1, 0, 0, 1, 1,
0.3032483, 0.4389665, 1.096835, 0, 0, 0, 1, 1,
0.3033772, 1.207034, -0.9555491, 0, 0, 0, 1, 1,
0.3052324, -0.4779162, 3.376234, 0, 0, 0, 1, 1,
0.3064942, -0.1662258, 2.514343, 0, 0, 0, 1, 1,
0.312181, 1.353168, -0.7098349, 0, 0, 0, 1, 1,
0.317766, 0.7644978, 0.3910497, 0, 0, 0, 1, 1,
0.3226322, -0.5152264, 2.384055, 0, 0, 0, 1, 1,
0.3246513, 0.5699814, -0.03548345, 1, 1, 1, 1, 1,
0.3249676, -0.285368, 1.88275, 1, 1, 1, 1, 1,
0.3255718, -1.533072, 3.735968, 1, 1, 1, 1, 1,
0.3331281, 0.3843251, -0.3314176, 1, 1, 1, 1, 1,
0.3366749, -0.5047137, 0.8128626, 1, 1, 1, 1, 1,
0.3407573, -0.07150764, 2.578824, 1, 1, 1, 1, 1,
0.3466875, 1.043461, -0.4356901, 1, 1, 1, 1, 1,
0.357777, 0.4494717, 2.427246, 1, 1, 1, 1, 1,
0.364888, 0.003154349, 1.334192, 1, 1, 1, 1, 1,
0.3698534, -0.7340789, 3.699285, 1, 1, 1, 1, 1,
0.3711559, 0.8908631, 0.07792199, 1, 1, 1, 1, 1,
0.3740887, -0.2518317, 2.370051, 1, 1, 1, 1, 1,
0.3756849, 2.035221, 1.081287, 1, 1, 1, 1, 1,
0.3772522, 0.1653401, 1.869656, 1, 1, 1, 1, 1,
0.3800342, -0.988288, 3.562382, 1, 1, 1, 1, 1,
0.3819738, 0.4917725, 0.3031628, 0, 0, 1, 1, 1,
0.3857076, 0.9644136, 0.7949671, 1, 0, 0, 1, 1,
0.3877054, 0.9147054, 0.1512495, 1, 0, 0, 1, 1,
0.3890299, -0.6701403, 3.531234, 1, 0, 0, 1, 1,
0.3892964, -0.09058694, 3.8282, 1, 0, 0, 1, 1,
0.3893129, -2.148767, 3.57569, 1, 0, 0, 1, 1,
0.3896763, -0.3071786, 2.393504, 0, 0, 0, 1, 1,
0.3985717, 1.18765, 0.0366875, 0, 0, 0, 1, 1,
0.3997924, 0.5894278, 2.076214, 0, 0, 0, 1, 1,
0.4026875, -0.5518677, 3.967411, 0, 0, 0, 1, 1,
0.405061, -1.115313, 2.20557, 0, 0, 0, 1, 1,
0.4093038, -0.3471324, 0.9815546, 0, 0, 0, 1, 1,
0.414153, -1.439088, 2.270379, 0, 0, 0, 1, 1,
0.4159673, 0.0688782, 2.518099, 1, 1, 1, 1, 1,
0.417028, 1.370629, 1.145484, 1, 1, 1, 1, 1,
0.420918, -1.224746, 3.284939, 1, 1, 1, 1, 1,
0.4246106, 0.1486725, 1.688978, 1, 1, 1, 1, 1,
0.4301612, 0.1546649, 0.7774655, 1, 1, 1, 1, 1,
0.4331875, -0.619589, 3.972744, 1, 1, 1, 1, 1,
0.4358331, -0.8469927, 2.182781, 1, 1, 1, 1, 1,
0.4415818, 0.2096691, 3.230621, 1, 1, 1, 1, 1,
0.4424988, -0.3067185, 2.361863, 1, 1, 1, 1, 1,
0.4477104, 0.1573099, 0.418266, 1, 1, 1, 1, 1,
0.4499421, -0.8992582, 3.44172, 1, 1, 1, 1, 1,
0.4522016, -2.034938, 3.735106, 1, 1, 1, 1, 1,
0.4524368, -1.571051, 2.886281, 1, 1, 1, 1, 1,
0.4550423, -1.246499, 2.035025, 1, 1, 1, 1, 1,
0.4591887, 1.213583, -1.335734, 1, 1, 1, 1, 1,
0.4623847, -0.638665, -0.4277841, 0, 0, 1, 1, 1,
0.4638695, -1.235849, 2.885112, 1, 0, 0, 1, 1,
0.4660012, -0.2795702, 0.89448, 1, 0, 0, 1, 1,
0.4713707, -2.00418, 1.997043, 1, 0, 0, 1, 1,
0.4726043, -2.151627, 2.395872, 1, 0, 0, 1, 1,
0.4815016, -1.221972, 3.119263, 1, 0, 0, 1, 1,
0.4871345, -0.1213687, 0.4779594, 0, 0, 0, 1, 1,
0.4918029, 0.2879288, 0.9291146, 0, 0, 0, 1, 1,
0.4923479, -0.2605982, 0.7855435, 0, 0, 0, 1, 1,
0.4936046, 1.52248, 0.6688217, 0, 0, 0, 1, 1,
0.4937684, 0.7497209, -0.6458398, 0, 0, 0, 1, 1,
0.495865, 0.388604, -0.3672967, 0, 0, 0, 1, 1,
0.4960924, -1.083133, 3.443419, 0, 0, 0, 1, 1,
0.4997953, 1.61703, -1.193982, 1, 1, 1, 1, 1,
0.5042874, 1.50358, -0.1831542, 1, 1, 1, 1, 1,
0.5048098, 0.2996255, 2.636123, 1, 1, 1, 1, 1,
0.5055598, 0.4028756, 1.127494, 1, 1, 1, 1, 1,
0.5112796, -1.088957, 2.719709, 1, 1, 1, 1, 1,
0.5166188, 0.8520308, 2.340411, 1, 1, 1, 1, 1,
0.5177202, -1.285272, 2.54004, 1, 1, 1, 1, 1,
0.5184092, -0.8554597, 4.132876, 1, 1, 1, 1, 1,
0.5224991, 1.932443, 0.07543029, 1, 1, 1, 1, 1,
0.524616, -0.004690558, 2.307163, 1, 1, 1, 1, 1,
0.5248131, 0.9002436, 1.296001, 1, 1, 1, 1, 1,
0.5254269, -0.1285786, 1.630475, 1, 1, 1, 1, 1,
0.5305933, 0.1857482, 1.586216, 1, 1, 1, 1, 1,
0.5342614, -0.16769, -1.021148, 1, 1, 1, 1, 1,
0.5356296, -0.3497303, 1.795238, 1, 1, 1, 1, 1,
0.5400673, 1.085268, -0.5806337, 0, 0, 1, 1, 1,
0.5443438, 0.3034913, -0.2887666, 1, 0, 0, 1, 1,
0.5451359, 0.9039981, 0.8826775, 1, 0, 0, 1, 1,
0.5453997, 0.7745044, 1.389317, 1, 0, 0, 1, 1,
0.5455118, -0.5329838, 3.066844, 1, 0, 0, 1, 1,
0.5467427, 0.1408412, 1.682839, 1, 0, 0, 1, 1,
0.5523486, -1.067908, 3.946028, 0, 0, 0, 1, 1,
0.5527602, 1.399325, -0.8166133, 0, 0, 0, 1, 1,
0.5616302, 0.02586646, 1.734884, 0, 0, 0, 1, 1,
0.5664661, 0.4286239, 2.483293, 0, 0, 0, 1, 1,
0.5746844, -0.5253718, 1.735428, 0, 0, 0, 1, 1,
0.5770526, 0.2517716, 0.3424697, 0, 0, 0, 1, 1,
0.5783146, 1.015761, 1.79115, 0, 0, 0, 1, 1,
0.5830556, -2.195887, 3.012203, 1, 1, 1, 1, 1,
0.5868718, 0.8164701, 1.542668, 1, 1, 1, 1, 1,
0.5920691, 0.6989319, 0.5462363, 1, 1, 1, 1, 1,
0.5925461, -0.27689, 1.625469, 1, 1, 1, 1, 1,
0.5972563, 0.0277282, 1.172915, 1, 1, 1, 1, 1,
0.598819, 0.2285956, 1.386095, 1, 1, 1, 1, 1,
0.6005111, 1.605684, 1.293015, 1, 1, 1, 1, 1,
0.6036955, 0.895525, 1.340999, 1, 1, 1, 1, 1,
0.6080172, -0.4833166, 1.786249, 1, 1, 1, 1, 1,
0.613, -0.0587597, 1.828044, 1, 1, 1, 1, 1,
0.6173272, -0.5784792, 0.7142634, 1, 1, 1, 1, 1,
0.6179493, 0.0906286, 1.024393, 1, 1, 1, 1, 1,
0.6183005, -0.6781907, 3.394273, 1, 1, 1, 1, 1,
0.6201668, -0.2509556, 2.978976, 1, 1, 1, 1, 1,
0.6249803, -2.697601, 1.797273, 1, 1, 1, 1, 1,
0.625051, 0.9099474, 0.2025956, 0, 0, 1, 1, 1,
0.6293989, 0.6714687, -0.63915, 1, 0, 0, 1, 1,
0.6424172, 2.390823, 1.076142, 1, 0, 0, 1, 1,
0.6456914, 0.5641277, 0.2698162, 1, 0, 0, 1, 1,
0.6476159, -0.7579997, 2.163968, 1, 0, 0, 1, 1,
0.6521516, -2.354955, 3.283567, 1, 0, 0, 1, 1,
0.6528885, -0.5897443, 1.660496, 0, 0, 0, 1, 1,
0.6583946, 2.581256, 1.008954, 0, 0, 0, 1, 1,
0.659086, -1.341888, 2.517712, 0, 0, 0, 1, 1,
0.6613653, -1.022183, 0.4759193, 0, 0, 0, 1, 1,
0.6677414, 0.4823652, -0.6456869, 0, 0, 0, 1, 1,
0.6680177, -1.448608, 3.538307, 0, 0, 0, 1, 1,
0.6684742, -1.153891, 2.241391, 0, 0, 0, 1, 1,
0.6695092, 1.642711, 0.3846726, 1, 1, 1, 1, 1,
0.6717535, -1.157996, 3.132987, 1, 1, 1, 1, 1,
0.6724296, 1.54284, -0.02082601, 1, 1, 1, 1, 1,
0.6760125, 0.8515171, 1.011304, 1, 1, 1, 1, 1,
0.6831908, -0.08295912, 1.490129, 1, 1, 1, 1, 1,
0.688621, 0.6880909, 0.3922212, 1, 1, 1, 1, 1,
0.6920515, 0.402273, 1.595578, 1, 1, 1, 1, 1,
0.6948747, 0.8193502, 0.1029069, 1, 1, 1, 1, 1,
0.6951669, 1.827889, -1.880531, 1, 1, 1, 1, 1,
0.6960365, 0.6968791, 0.01923993, 1, 1, 1, 1, 1,
0.6982607, -0.905652, 1.710398, 1, 1, 1, 1, 1,
0.6983989, 0.2641899, 1.202104, 1, 1, 1, 1, 1,
0.698424, 0.4271661, 1.637429, 1, 1, 1, 1, 1,
0.7008443, -0.5175039, 2.314094, 1, 1, 1, 1, 1,
0.7015328, -1.290903, 3.336565, 1, 1, 1, 1, 1,
0.7101533, 2.136834, 0.8578936, 0, 0, 1, 1, 1,
0.7164539, -0.5079517, 2.333028, 1, 0, 0, 1, 1,
0.7208968, -1.004379, 0.4903037, 1, 0, 0, 1, 1,
0.7248062, -0.7446745, 2.846161, 1, 0, 0, 1, 1,
0.7305316, 0.3373648, -1.302215, 1, 0, 0, 1, 1,
0.7305416, -0.7904212, 3.481712, 1, 0, 0, 1, 1,
0.7337908, -0.7194436, 1.433863, 0, 0, 0, 1, 1,
0.7349754, 0.2419753, -0.1067773, 0, 0, 0, 1, 1,
0.7357326, 0.2215131, 1.639079, 0, 0, 0, 1, 1,
0.7364464, -0.9132717, 2.773331, 0, 0, 0, 1, 1,
0.7384967, -0.254626, 3.258828, 0, 0, 0, 1, 1,
0.7441736, -1.357145, 1.82514, 0, 0, 0, 1, 1,
0.7442813, 0.2442147, 1.70831, 0, 0, 0, 1, 1,
0.7603045, 0.188953, -0.4077027, 1, 1, 1, 1, 1,
0.7624653, 0.7291476, 2.691668, 1, 1, 1, 1, 1,
0.7647284, 2.045195, 0.5760345, 1, 1, 1, 1, 1,
0.7747043, 1.007274, 0.9035025, 1, 1, 1, 1, 1,
0.7843509, 1.795594, 0.7000192, 1, 1, 1, 1, 1,
0.7871325, 0.404563, 1.023144, 1, 1, 1, 1, 1,
0.7916986, -0.921133, 1.204278, 1, 1, 1, 1, 1,
0.7952165, -0.495683, 1.730034, 1, 1, 1, 1, 1,
0.7954457, 0.9102911, 1.67345, 1, 1, 1, 1, 1,
0.8008071, -0.1418437, 3.177016, 1, 1, 1, 1, 1,
0.8027951, 0.8741106, 1.851796, 1, 1, 1, 1, 1,
0.8064215, 0.3459451, 1.132686, 1, 1, 1, 1, 1,
0.8100508, 0.3189481, 2.100478, 1, 1, 1, 1, 1,
0.8109506, -1.208975, 2.432973, 1, 1, 1, 1, 1,
0.8143592, -0.6883652, 1.962741, 1, 1, 1, 1, 1,
0.8181291, -0.5106768, 0.6517944, 0, 0, 1, 1, 1,
0.8189539, -2.05961, 1.760754, 1, 0, 0, 1, 1,
0.824021, -1.137893, 3.52744, 1, 0, 0, 1, 1,
0.8240249, 0.8011039, 0.1455216, 1, 0, 0, 1, 1,
0.8277662, 0.9653284, 1.822834, 1, 0, 0, 1, 1,
0.8280195, 0.1559745, 3.88883, 1, 0, 0, 1, 1,
0.8358561, -0.8435479, 0.2218832, 0, 0, 0, 1, 1,
0.8373947, 0.268078, 0.547025, 0, 0, 0, 1, 1,
0.8422684, 1.554096, 0.192296, 0, 0, 0, 1, 1,
0.8508693, -0.253876, 3.082045, 0, 0, 0, 1, 1,
0.8521427, -0.2817546, 1.766753, 0, 0, 0, 1, 1,
0.8530433, -1.648937, 1.98901, 0, 0, 0, 1, 1,
0.8533043, -0.7803931, 4.08127, 0, 0, 0, 1, 1,
0.8556432, -1.321961, 1.732956, 1, 1, 1, 1, 1,
0.8657215, 0.2594463, 0.124291, 1, 1, 1, 1, 1,
0.8734676, -1.416032, 1.407406, 1, 1, 1, 1, 1,
0.8747227, 2.7679, 0.7617753, 1, 1, 1, 1, 1,
0.8767099, 0.3197238, -0.6112246, 1, 1, 1, 1, 1,
0.8812319, -1.245385, 2.095992, 1, 1, 1, 1, 1,
0.8871901, 0.1527644, 2.414002, 1, 1, 1, 1, 1,
0.8898497, 0.1155945, 2.168218, 1, 1, 1, 1, 1,
0.8909397, -0.2784687, 1.812149, 1, 1, 1, 1, 1,
0.899028, -0.6608142, 0.9529684, 1, 1, 1, 1, 1,
0.8993168, 1.864037, 0.6900123, 1, 1, 1, 1, 1,
0.9017488, 0.9384763, 1.400904, 1, 1, 1, 1, 1,
0.9024123, 0.1439442, 0.8983544, 1, 1, 1, 1, 1,
0.9033124, 1.18349, 2.747008, 1, 1, 1, 1, 1,
0.9033515, -0.846316, 1.082824, 1, 1, 1, 1, 1,
0.9141203, 0.08906746, 1.184952, 0, 0, 1, 1, 1,
0.9172091, 0.5456579, 2.229653, 1, 0, 0, 1, 1,
0.9174423, 0.294452, 2.587967, 1, 0, 0, 1, 1,
0.927157, 0.4798459, 0.6737706, 1, 0, 0, 1, 1,
0.9405982, 0.7451054, 0.2630578, 1, 0, 0, 1, 1,
0.9457799, -1.361409, 2.785745, 1, 0, 0, 1, 1,
0.9480074, -0.7565527, 3.845727, 0, 0, 0, 1, 1,
0.9491023, -0.4303258, 1.589464, 0, 0, 0, 1, 1,
0.9509113, 0.2724665, 0.7314757, 0, 0, 0, 1, 1,
0.9521623, 0.9955825, 0.9157432, 0, 0, 0, 1, 1,
0.9603583, 1.303996, -0.4643984, 0, 0, 0, 1, 1,
0.9693817, 0.3531356, 1.158564, 0, 0, 0, 1, 1,
0.9694947, 1.208999, 0.07702725, 0, 0, 0, 1, 1,
0.9696689, -1.350576, 3.797217, 1, 1, 1, 1, 1,
0.9763928, 1.579713, 0.2957161, 1, 1, 1, 1, 1,
0.9785853, 1.057922, 1.781889, 1, 1, 1, 1, 1,
0.9799082, -1.591504, 3.218025, 1, 1, 1, 1, 1,
0.9835682, -0.5585172, 2.349762, 1, 1, 1, 1, 1,
0.9874162, 0.8507629, 1.918713, 1, 1, 1, 1, 1,
0.9933202, -0.0492718, 1.516371, 1, 1, 1, 1, 1,
1.001121, -2.094358, 3.125821, 1, 1, 1, 1, 1,
1.009944, -0.6074985, 1.927576, 1, 1, 1, 1, 1,
1.012781, 2.84947, 0.8141399, 1, 1, 1, 1, 1,
1.0222, 2.0088, 0.5096876, 1, 1, 1, 1, 1,
1.030029, 0.03365171, 0.3276714, 1, 1, 1, 1, 1,
1.032811, -0.5235219, 1.623085, 1, 1, 1, 1, 1,
1.036169, 0.4887287, 2.028817, 1, 1, 1, 1, 1,
1.036388, 0.5539631, 1.309546, 1, 1, 1, 1, 1,
1.037257, -0.45439, 0.409279, 0, 0, 1, 1, 1,
1.038974, 0.3876451, 0.321463, 1, 0, 0, 1, 1,
1.043084, 1.170528, -1.295754, 1, 0, 0, 1, 1,
1.054758, 0.05261672, 2.122037, 1, 0, 0, 1, 1,
1.056048, 0.9117683, 0.5527663, 1, 0, 0, 1, 1,
1.060482, -0.9094215, 2.670248, 1, 0, 0, 1, 1,
1.061651, -0.9419343, 3.722991, 0, 0, 0, 1, 1,
1.071612, -0.4736731, 1.276286, 0, 0, 0, 1, 1,
1.081817, 0.7271922, 1.882758, 0, 0, 0, 1, 1,
1.083074, -1.538229, 3.90816, 0, 0, 0, 1, 1,
1.08697, -1.443383, 2.977183, 0, 0, 0, 1, 1,
1.089157, 1.177994, 0.5920019, 0, 0, 0, 1, 1,
1.094252, 0.5456529, 1.448406, 0, 0, 0, 1, 1,
1.095224, 0.6080524, 0.83636, 1, 1, 1, 1, 1,
1.099987, -0.4555324, 1.332831, 1, 1, 1, 1, 1,
1.101278, 1.289762, 2.170421, 1, 1, 1, 1, 1,
1.105031, -1.898744, 2.635732, 1, 1, 1, 1, 1,
1.110216, 0.9871141, 1.984265, 1, 1, 1, 1, 1,
1.112165, 0.7945514, 0.8365908, 1, 1, 1, 1, 1,
1.115317, 0.01792181, 0.8103381, 1, 1, 1, 1, 1,
1.116614, 0.7370352, 2.669815, 1, 1, 1, 1, 1,
1.116888, -0.7893363, 3.833125, 1, 1, 1, 1, 1,
1.123776, -0.9245324, 2.60309, 1, 1, 1, 1, 1,
1.128209, 0.7511591, 1.432094, 1, 1, 1, 1, 1,
1.130809, -0.6784336, 2.728426, 1, 1, 1, 1, 1,
1.131819, -0.004352423, 2.882987, 1, 1, 1, 1, 1,
1.134563, 0.9704845, 0.7218347, 1, 1, 1, 1, 1,
1.135248, 0.1922793, 1.151285, 1, 1, 1, 1, 1,
1.142041, -0.1253562, 3.579494, 0, 0, 1, 1, 1,
1.165191, 1.808042, 1.122006, 1, 0, 0, 1, 1,
1.166475, -0.7756875, 2.995604, 1, 0, 0, 1, 1,
1.171607, -0.5075878, 3.205999, 1, 0, 0, 1, 1,
1.17165, -1.192169, 4.196758, 1, 0, 0, 1, 1,
1.188763, -0.9556859, 2.491657, 1, 0, 0, 1, 1,
1.19148, -0.2283992, 1.116206, 0, 0, 0, 1, 1,
1.192102, 0.273535, 0.6029293, 0, 0, 0, 1, 1,
1.196153, 0.3391607, 0.9238157, 0, 0, 0, 1, 1,
1.204138, 0.4366595, 1.54268, 0, 0, 0, 1, 1,
1.208412, 1.004094, -0.3690356, 0, 0, 0, 1, 1,
1.221816, -3.036966, 2.295815, 0, 0, 0, 1, 1,
1.224439, 1.416103, 1.236619, 0, 0, 0, 1, 1,
1.226448, -1.478864, 4.420064, 1, 1, 1, 1, 1,
1.227489, -0.7681443, 0.989538, 1, 1, 1, 1, 1,
1.230568, 0.1501307, 1.735313, 1, 1, 1, 1, 1,
1.230905, -1.364418, 2.278274, 1, 1, 1, 1, 1,
1.232059, 0.2176857, 1.47316, 1, 1, 1, 1, 1,
1.232269, -0.351106, 1.064233, 1, 1, 1, 1, 1,
1.257985, 0.7633486, 0.442054, 1, 1, 1, 1, 1,
1.270082, 1.641611, -0.5704749, 1, 1, 1, 1, 1,
1.270496, -0.6980019, 1.832732, 1, 1, 1, 1, 1,
1.271485, 1.993613, 1.255186, 1, 1, 1, 1, 1,
1.29595, 1.23485, 1.696076, 1, 1, 1, 1, 1,
1.308188, -0.1573982, 1.861733, 1, 1, 1, 1, 1,
1.308932, 0.3443018, 2.000694, 1, 1, 1, 1, 1,
1.336223, 0.02377859, 2.797661, 1, 1, 1, 1, 1,
1.336877, -0.0416559, 2.226804, 1, 1, 1, 1, 1,
1.345055, 0.4422212, 2.271676, 0, 0, 1, 1, 1,
1.34799, 0.08296008, -0.06758173, 1, 0, 0, 1, 1,
1.349138, 0.837356, 2.317547, 1, 0, 0, 1, 1,
1.359031, -0.2343268, 0.2262256, 1, 0, 0, 1, 1,
1.380711, 0.8982646, 1.484459, 1, 0, 0, 1, 1,
1.384633, -2.525862, 4.568335, 1, 0, 0, 1, 1,
1.391423, 1.102336, -0.7832659, 0, 0, 0, 1, 1,
1.407847, 0.5888364, 0.9996586, 0, 0, 0, 1, 1,
1.420498, 0.774745, 1.473563, 0, 0, 0, 1, 1,
1.431644, 0.5831162, 1.113694, 0, 0, 0, 1, 1,
1.436828, 0.3984672, 1.788821, 0, 0, 0, 1, 1,
1.446587, -2.131601, 2.927353, 0, 0, 0, 1, 1,
1.448178, -1.22162, 2.770134, 0, 0, 0, 1, 1,
1.455157, -1.210084, 3.103307, 1, 1, 1, 1, 1,
1.470136, -0.4181219, 2.129895, 1, 1, 1, 1, 1,
1.488666, -0.08210591, 3.027992, 1, 1, 1, 1, 1,
1.502445, -0.4941598, 1.535686, 1, 1, 1, 1, 1,
1.505316, -0.1273124, -1.119685, 1, 1, 1, 1, 1,
1.508784, 0.5272595, 3.546161, 1, 1, 1, 1, 1,
1.510507, 1.586887, 1.099251, 1, 1, 1, 1, 1,
1.513667, 0.09318952, 0.8616138, 1, 1, 1, 1, 1,
1.544053, -0.8294467, 2.605646, 1, 1, 1, 1, 1,
1.546521, 0.7288435, 1.210894, 1, 1, 1, 1, 1,
1.556017, -1.7137, 1.69528, 1, 1, 1, 1, 1,
1.5578, 0.9887867, 2.740953, 1, 1, 1, 1, 1,
1.561461, 0.2816841, -0.01118034, 1, 1, 1, 1, 1,
1.566474, -0.03331769, 3.739938, 1, 1, 1, 1, 1,
1.577469, -0.1041031, 3.929656, 1, 1, 1, 1, 1,
1.580912, -0.2658044, 2.445258, 0, 0, 1, 1, 1,
1.581381, -1.6081, 1.298591, 1, 0, 0, 1, 1,
1.588987, -1.255705, 2.195793, 1, 0, 0, 1, 1,
1.605053, -0.2345203, 3.796738, 1, 0, 0, 1, 1,
1.612576, -1.550653, 2.976728, 1, 0, 0, 1, 1,
1.613675, -1.42591, 2.351306, 1, 0, 0, 1, 1,
1.614688, 0.3153773, 3.045443, 0, 0, 0, 1, 1,
1.639726, 0.4688156, 1.472189, 0, 0, 0, 1, 1,
1.641248, -0.1548452, 0.1370843, 0, 0, 0, 1, 1,
1.643208, -1.814744, 5.905196, 0, 0, 0, 1, 1,
1.646619, -1.507065, 2.554124, 0, 0, 0, 1, 1,
1.666225, -1.010655, 3.523064, 0, 0, 0, 1, 1,
1.686978, 1.339163, -1.447605, 0, 0, 0, 1, 1,
1.689127, 1.294437, 1.026633, 1, 1, 1, 1, 1,
1.69113, -1.083618, 2.322514, 1, 1, 1, 1, 1,
1.703917, 0.05899475, 1.117794, 1, 1, 1, 1, 1,
1.729638, -0.3954977, 3.530652, 1, 1, 1, 1, 1,
1.731035, 0.1987837, 0.2225421, 1, 1, 1, 1, 1,
1.81089, -1.676032, 2.114919, 1, 1, 1, 1, 1,
1.812733, 1.279386, 0.6269879, 1, 1, 1, 1, 1,
1.833868, -0.5537144, 1.548294, 1, 1, 1, 1, 1,
1.836296, 0.3001843, 0.9591724, 1, 1, 1, 1, 1,
1.841614, 0.6759443, 0.3104959, 1, 1, 1, 1, 1,
1.876359, -0.03923549, 0.8294829, 1, 1, 1, 1, 1,
1.876552, 0.5124623, -0.5573144, 1, 1, 1, 1, 1,
1.900666, 0.9576017, -1.003037, 1, 1, 1, 1, 1,
1.904213, 0.616191, 0.976563, 1, 1, 1, 1, 1,
1.906831, 0.7029766, 0.5421461, 1, 1, 1, 1, 1,
1.954998, -1.111462, 3.136829, 0, 0, 1, 1, 1,
1.9736, 1.080746, 0.727754, 1, 0, 0, 1, 1,
1.982318, 0.1124038, 2.169658, 1, 0, 0, 1, 1,
1.998043, 1.124704, 2.791057, 1, 0, 0, 1, 1,
2.018509, 0.2786802, 1.648608, 1, 0, 0, 1, 1,
2.105294, 0.1551529, 1.307979, 1, 0, 0, 1, 1,
2.108525, -1.378959, -0.2933774, 0, 0, 0, 1, 1,
2.134062, -0.9425741, 2.549739, 0, 0, 0, 1, 1,
2.156104, 0.3515784, 1.644447, 0, 0, 0, 1, 1,
2.170568, -0.8729327, 0.6579097, 0, 0, 0, 1, 1,
2.180976, 0.01981275, 1.093844, 0, 0, 0, 1, 1,
2.21874, 0.9587758, 2.994953, 0, 0, 0, 1, 1,
2.223562, -0.6383551, 1.668111, 0, 0, 0, 1, 1,
2.237599, -1.729878, 2.455297, 1, 1, 1, 1, 1,
2.287643, -1.642974, 4.635677, 1, 1, 1, 1, 1,
2.341895, -0.6999331, 2.598316, 1, 1, 1, 1, 1,
2.445437, 1.222106, 1.314588, 1, 1, 1, 1, 1,
2.543642, -0.1062575, -0.4082777, 1, 1, 1, 1, 1,
2.731298, 0.7028816, 1.536799, 1, 1, 1, 1, 1,
2.964447, 0.467847, 1.485505, 1, 1, 1, 1, 1
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
var radius = 10.15058;
var distance = 35.6535;
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
mvMatrix.translate( 0.05928874, -0.2376947, -0.02691579 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.6535);
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
