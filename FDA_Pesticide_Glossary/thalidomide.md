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
-3.23276, -0.8254845, -1.898739, 1, 0, 0, 1,
-3.019543, -0.6436763, -1.564942, 1, 0.007843138, 0, 1,
-3.018153, -0.541298, -0.6131197, 1, 0.01176471, 0, 1,
-2.938025, -0.7682954, -1.704303, 1, 0.01960784, 0, 1,
-2.829868, -0.7856381, -0.9638234, 1, 0.02352941, 0, 1,
-2.694797, 0.8007492, 0.06225317, 1, 0.03137255, 0, 1,
-2.618683, -1.143061, -2.343559, 1, 0.03529412, 0, 1,
-2.530916, -0.9048828, -1.999377, 1, 0.04313726, 0, 1,
-2.500421, -0.7103753, -3.278218, 1, 0.04705882, 0, 1,
-2.357994, 0.6675721, -0.7810711, 1, 0.05490196, 0, 1,
-2.35402, 2.282379, -1.520744, 1, 0.05882353, 0, 1,
-2.349995, -2.100386, -0.8132429, 1, 0.06666667, 0, 1,
-2.278339, 0.8889052, 1.056029, 1, 0.07058824, 0, 1,
-2.261252, -0.9766915, -2.809544, 1, 0.07843138, 0, 1,
-2.173645, -1.373631, -2.847972, 1, 0.08235294, 0, 1,
-2.16653, -1.089327, -4.050113, 1, 0.09019608, 0, 1,
-2.135135, 0.2765799, -1.161154, 1, 0.09411765, 0, 1,
-2.093288, 1.46681, -0.1222678, 1, 0.1019608, 0, 1,
-2.08814, -0.01130895, -3.163016, 1, 0.1098039, 0, 1,
-2.084799, 0.4155012, -0.9643421, 1, 0.1137255, 0, 1,
-2.065314, -0.3356192, -3.077545, 1, 0.1215686, 0, 1,
-2.038809, 0.3507112, -2.284467, 1, 0.1254902, 0, 1,
-2.022471, -0.3193844, -1.356887, 1, 0.1333333, 0, 1,
-2.018379, 1.147011, -1.402803, 1, 0.1372549, 0, 1,
-1.988605, -1.979148, -3.824214, 1, 0.145098, 0, 1,
-1.97686, -0.947389, -2.531059, 1, 0.1490196, 0, 1,
-1.976248, 0.2004505, -1.480793, 1, 0.1568628, 0, 1,
-1.923989, -0.1405233, -1.732946, 1, 0.1607843, 0, 1,
-1.91895, 2.228405, -0.3726428, 1, 0.1686275, 0, 1,
-1.897515, -1.094993, -3.205915, 1, 0.172549, 0, 1,
-1.856359, -1.059699, -1.042349, 1, 0.1803922, 0, 1,
-1.849728, -0.03809942, -2.835945, 1, 0.1843137, 0, 1,
-1.819912, 0.3036835, -1.598646, 1, 0.1921569, 0, 1,
-1.813788, -1.6879, -3.831371, 1, 0.1960784, 0, 1,
-1.806615, 0.2013528, -1.623016, 1, 0.2039216, 0, 1,
-1.778027, -0.5664289, -1.638217, 1, 0.2117647, 0, 1,
-1.772459, -0.1353587, -1.195804, 1, 0.2156863, 0, 1,
-1.771427, 2.360068, -0.4224777, 1, 0.2235294, 0, 1,
-1.768763, -0.871603, -0.896976, 1, 0.227451, 0, 1,
-1.768646, 1.568717, -0.6266177, 1, 0.2352941, 0, 1,
-1.760731, -0.2544363, -0.854726, 1, 0.2392157, 0, 1,
-1.749311, 0.2174445, -2.539456, 1, 0.2470588, 0, 1,
-1.720798, 0.2022321, -0.784338, 1, 0.2509804, 0, 1,
-1.691301, -0.8000383, -0.05416712, 1, 0.2588235, 0, 1,
-1.677323, 0.02827681, -1.780583, 1, 0.2627451, 0, 1,
-1.676024, 1.698982, -1.291677, 1, 0.2705882, 0, 1,
-1.675759, 0.2854235, 0.3475613, 1, 0.2745098, 0, 1,
-1.67559, -0.3131419, -0.9221877, 1, 0.282353, 0, 1,
-1.671849, 0.01983369, -1.332811, 1, 0.2862745, 0, 1,
-1.658181, -0.3729824, -1.680954, 1, 0.2941177, 0, 1,
-1.652226, 0.2175189, -3.138738, 1, 0.3019608, 0, 1,
-1.647352, -0.7135015, -1.675999, 1, 0.3058824, 0, 1,
-1.602798, 1.246623, 0.2207047, 1, 0.3137255, 0, 1,
-1.593442, 1.095246, 0.3510814, 1, 0.3176471, 0, 1,
-1.589799, -0.9511043, -3.47838, 1, 0.3254902, 0, 1,
-1.588944, -0.4518713, -4.484858, 1, 0.3294118, 0, 1,
-1.587936, 0.4115497, -0.4836909, 1, 0.3372549, 0, 1,
-1.567803, 0.03498831, -1.432047, 1, 0.3411765, 0, 1,
-1.558816, -1.080094, -2.411888, 1, 0.3490196, 0, 1,
-1.552023, 1.193992, -1.232626, 1, 0.3529412, 0, 1,
-1.548782, 1.619073, -0.5048906, 1, 0.3607843, 0, 1,
-1.537167, 1.327187, -2.470302, 1, 0.3647059, 0, 1,
-1.536811, 0.1110692, -2.829064, 1, 0.372549, 0, 1,
-1.530003, 0.6919952, -0.1732212, 1, 0.3764706, 0, 1,
-1.525392, -0.03952835, -2.158594, 1, 0.3843137, 0, 1,
-1.516498, 0.5157478, -1.810734, 1, 0.3882353, 0, 1,
-1.514634, -0.229183, -1.532431, 1, 0.3960784, 0, 1,
-1.512098, 0.8484589, -0.7738554, 1, 0.4039216, 0, 1,
-1.507848, -0.558076, -1.828056, 1, 0.4078431, 0, 1,
-1.4897, -0.4494081, -1.8311, 1, 0.4156863, 0, 1,
-1.489578, -0.1371395, 0.3131421, 1, 0.4196078, 0, 1,
-1.487513, -0.4271438, -1.128392, 1, 0.427451, 0, 1,
-1.470982, 2.865272, -0.2174199, 1, 0.4313726, 0, 1,
-1.467127, -1.621501, -2.291292, 1, 0.4392157, 0, 1,
-1.462526, -0.6402024, -2.353312, 1, 0.4431373, 0, 1,
-1.460734, 0.6677774, -1.743023, 1, 0.4509804, 0, 1,
-1.46066, 0.513621, -2.645997, 1, 0.454902, 0, 1,
-1.459772, -1.723367, -1.501436, 1, 0.4627451, 0, 1,
-1.459436, 0.4562882, -0.3110787, 1, 0.4666667, 0, 1,
-1.45358, 0.8317923, -0.6275768, 1, 0.4745098, 0, 1,
-1.445639, -1.254053, -3.074188, 1, 0.4784314, 0, 1,
-1.444013, 0.6308588, -1.713599, 1, 0.4862745, 0, 1,
-1.443645, -0.6266396, -1.077889, 1, 0.4901961, 0, 1,
-1.442969, 0.7125531, -0.324765, 1, 0.4980392, 0, 1,
-1.421207, -0.8179473, -2.589865, 1, 0.5058824, 0, 1,
-1.407981, -0.4642344, -2.028483, 1, 0.509804, 0, 1,
-1.407805, 0.03722329, -2.522295, 1, 0.5176471, 0, 1,
-1.403407, -0.2267122, -0.8211427, 1, 0.5215687, 0, 1,
-1.400365, 0.7027751, -1.820813, 1, 0.5294118, 0, 1,
-1.399909, -1.438063, -3.318277, 1, 0.5333334, 0, 1,
-1.398899, 0.625599, -0.1272754, 1, 0.5411765, 0, 1,
-1.38835, 0.5638099, -0.6050674, 1, 0.5450981, 0, 1,
-1.384993, 1.314479, -1.37926, 1, 0.5529412, 0, 1,
-1.38333, -0.6960467, -0.5385215, 1, 0.5568628, 0, 1,
-1.377429, 1.63361, -0.1096824, 1, 0.5647059, 0, 1,
-1.376577, 0.1042606, -2.646744, 1, 0.5686275, 0, 1,
-1.374845, -0.609493, -0.9384117, 1, 0.5764706, 0, 1,
-1.374442, 0.8916655, -1.610483, 1, 0.5803922, 0, 1,
-1.36674, -2.452869, -4.144828, 1, 0.5882353, 0, 1,
-1.36672, 2.840865, -0.1243456, 1, 0.5921569, 0, 1,
-1.360816, 1.446189, -1.233702, 1, 0.6, 0, 1,
-1.358327, -1.213764, -1.583756, 1, 0.6078432, 0, 1,
-1.339089, 1.220389, -0.8571211, 1, 0.6117647, 0, 1,
-1.334808, 0.7248195, -0.8939799, 1, 0.6196079, 0, 1,
-1.331064, 0.4553438, -1.593624, 1, 0.6235294, 0, 1,
-1.32736, -0.2879786, -4.003569, 1, 0.6313726, 0, 1,
-1.32236, -0.3778987, -1.086729, 1, 0.6352941, 0, 1,
-1.320754, 0.09545669, -0.9157194, 1, 0.6431373, 0, 1,
-1.31127, 0.8682097, 0.1578581, 1, 0.6470588, 0, 1,
-1.295258, 1.246184, -0.1235122, 1, 0.654902, 0, 1,
-1.293789, -0.06838087, -2.211425, 1, 0.6588235, 0, 1,
-1.293609, -0.3158253, -2.426406, 1, 0.6666667, 0, 1,
-1.291191, 0.7363893, -0.2708116, 1, 0.6705883, 0, 1,
-1.289961, 0.5663361, -0.1133815, 1, 0.6784314, 0, 1,
-1.28961, -0.1199187, -2.551394, 1, 0.682353, 0, 1,
-1.289124, -0.8059047, -1.500419, 1, 0.6901961, 0, 1,
-1.274764, 0.6317901, -1.296872, 1, 0.6941177, 0, 1,
-1.272604, -1.240439, -2.621058, 1, 0.7019608, 0, 1,
-1.265443, 0.4799986, 0.6061792, 1, 0.7098039, 0, 1,
-1.2547, -0.107415, -2.506452, 1, 0.7137255, 0, 1,
-1.249015, 0.5604363, -1.31316, 1, 0.7215686, 0, 1,
-1.24557, -0.3524689, -2.154802, 1, 0.7254902, 0, 1,
-1.243928, -1.211304, -2.913692, 1, 0.7333333, 0, 1,
-1.228799, 0.8303877, -2.174492, 1, 0.7372549, 0, 1,
-1.215686, -1.63648, -0.8059329, 1, 0.7450981, 0, 1,
-1.204807, -0.04453832, -0.2304009, 1, 0.7490196, 0, 1,
-1.201351, -0.8156396, -2.963732, 1, 0.7568628, 0, 1,
-1.193048, -0.4859312, -2.173997, 1, 0.7607843, 0, 1,
-1.192764, 0.8737715, -0.711815, 1, 0.7686275, 0, 1,
-1.191946, 0.5725525, -0.9832354, 1, 0.772549, 0, 1,
-1.189888, -0.3895155, -1.352645, 1, 0.7803922, 0, 1,
-1.187221, 0.6581448, 0.1603573, 1, 0.7843137, 0, 1,
-1.180744, -1.348439, -2.145417, 1, 0.7921569, 0, 1,
-1.173386, 1.717657, -0.5724493, 1, 0.7960784, 0, 1,
-1.171033, -0.8652725, -1.668353, 1, 0.8039216, 0, 1,
-1.169075, -1.380286, -2.035416, 1, 0.8117647, 0, 1,
-1.166024, -0.4054302, -2.251008, 1, 0.8156863, 0, 1,
-1.148952, -1.077714, -2.633321, 1, 0.8235294, 0, 1,
-1.146861, 0.1177944, -0.1327042, 1, 0.827451, 0, 1,
-1.137473, 1.552914, 0.305268, 1, 0.8352941, 0, 1,
-1.131213, -1.166665, -1.692466, 1, 0.8392157, 0, 1,
-1.130209, 1.176848, -1.093257, 1, 0.8470588, 0, 1,
-1.129945, -0.5334346, -2.218682, 1, 0.8509804, 0, 1,
-1.123008, 0.2572766, -0.5917478, 1, 0.8588235, 0, 1,
-1.122363, -0.4793765, -2.140854, 1, 0.8627451, 0, 1,
-1.117859, -0.04353108, -1.536081, 1, 0.8705882, 0, 1,
-1.113151, -1.886321, -3.827025, 1, 0.8745098, 0, 1,
-1.113035, 0.3516532, -1.271357, 1, 0.8823529, 0, 1,
-1.113022, -0.4530984, -1.066842, 1, 0.8862745, 0, 1,
-1.111741, -0.1436348, 0.01617221, 1, 0.8941177, 0, 1,
-1.111364, -0.8803656, -2.103976, 1, 0.8980392, 0, 1,
-1.104185, 1.467269, -0.3676515, 1, 0.9058824, 0, 1,
-1.103153, 0.6807644, 1.283239, 1, 0.9137255, 0, 1,
-1.101232, -0.8904554, -2.179944, 1, 0.9176471, 0, 1,
-1.10079, 0.4296726, -2.101828, 1, 0.9254902, 0, 1,
-1.09588, 0.6525827, 0.005007854, 1, 0.9294118, 0, 1,
-1.094773, -1.22318, -3.490775, 1, 0.9372549, 0, 1,
-1.090709, -1.39301, -2.229959, 1, 0.9411765, 0, 1,
-1.090604, 0.1900896, -2.2656, 1, 0.9490196, 0, 1,
-1.089275, -0.7123089, -0.8536838, 1, 0.9529412, 0, 1,
-1.083044, -0.7454761, -3.031353, 1, 0.9607843, 0, 1,
-1.07932, -0.1219688, -2.194203, 1, 0.9647059, 0, 1,
-1.075788, 0.1518821, -0.7270947, 1, 0.972549, 0, 1,
-1.072148, 2.254602, 0.6043727, 1, 0.9764706, 0, 1,
-1.070001, 1.780047, -0.5946103, 1, 0.9843137, 0, 1,
-1.069978, 0.3132968, -0.3892319, 1, 0.9882353, 0, 1,
-1.068805, 1.266827, -1.328165, 1, 0.9960784, 0, 1,
-1.056101, -1.399204, -1.30372, 0.9960784, 1, 0, 1,
-1.03652, 0.3056148, -0.8902644, 0.9921569, 1, 0, 1,
-1.035831, 1.883813, -0.9897273, 0.9843137, 1, 0, 1,
-1.0345, -1.568147, -2.904057, 0.9803922, 1, 0, 1,
-1.030735, 0.3666491, -1.515706, 0.972549, 1, 0, 1,
-1.029712, -0.1627247, -4.095059, 0.9686275, 1, 0, 1,
-1.027469, -1.141752, -2.431439, 0.9607843, 1, 0, 1,
-1.026984, 0.03038603, -2.046534, 0.9568627, 1, 0, 1,
-1.026325, 1.034412, -1.173776, 0.9490196, 1, 0, 1,
-1.021406, -0.006685832, -1.376231, 0.945098, 1, 0, 1,
-1.010789, 0.4025934, -1.411206, 0.9372549, 1, 0, 1,
-1.0069, 0.935032, 0.3208971, 0.9333333, 1, 0, 1,
-1.003841, -1.345304, -4.051714, 0.9254902, 1, 0, 1,
-1.002972, -3.073531, -2.40506, 0.9215686, 1, 0, 1,
-0.998624, 0.3889994, -1.509219, 0.9137255, 1, 0, 1,
-0.9932765, -0.05244364, -1.59557, 0.9098039, 1, 0, 1,
-0.9889333, -0.3687509, -0.4823758, 0.9019608, 1, 0, 1,
-0.9837773, 1.153175, -1.250405, 0.8941177, 1, 0, 1,
-0.9829585, -1.130979, -2.635184, 0.8901961, 1, 0, 1,
-0.9768596, -0.6619302, -2.532908, 0.8823529, 1, 0, 1,
-0.9762573, -0.006257081, -2.663817, 0.8784314, 1, 0, 1,
-0.9696842, -1.148877, -3.116092, 0.8705882, 1, 0, 1,
-0.9678015, -1.50771, -2.748672, 0.8666667, 1, 0, 1,
-0.966056, -1.201772, -1.395546, 0.8588235, 1, 0, 1,
-0.9586393, 0.596462, -1.711762, 0.854902, 1, 0, 1,
-0.9443899, 0.9482895, -0.8202191, 0.8470588, 1, 0, 1,
-0.9428408, 1.989806, 0.9234273, 0.8431373, 1, 0, 1,
-0.9369948, 2.11449, -0.4768202, 0.8352941, 1, 0, 1,
-0.9363233, -0.6364552, -2.436612, 0.8313726, 1, 0, 1,
-0.9335765, 0.8285996, -3.359815, 0.8235294, 1, 0, 1,
-0.9330921, -0.9923475, -2.583249, 0.8196079, 1, 0, 1,
-0.9318568, -0.4906596, -2.017559, 0.8117647, 1, 0, 1,
-0.9227461, -0.1939222, -1.390461, 0.8078431, 1, 0, 1,
-0.9133012, 0.05916807, -0.7130287, 0.8, 1, 0, 1,
-0.9127069, 0.3144613, 0.06430895, 0.7921569, 1, 0, 1,
-0.906639, 1.135026, -0.5624411, 0.7882353, 1, 0, 1,
-0.9017972, 0.3869696, -1.034535, 0.7803922, 1, 0, 1,
-0.8988194, 0.9623919, -0.6574238, 0.7764706, 1, 0, 1,
-0.8981813, 0.6519147, -0.2404351, 0.7686275, 1, 0, 1,
-0.8951281, 2.061715, 0.1769531, 0.7647059, 1, 0, 1,
-0.8847001, 1.139158, -0.7837017, 0.7568628, 1, 0, 1,
-0.8809797, -0.8529702, -2.578785, 0.7529412, 1, 0, 1,
-0.8761542, 0.8203611, -0.4558352, 0.7450981, 1, 0, 1,
-0.8707041, -0.8278075, -1.306263, 0.7411765, 1, 0, 1,
-0.870331, -1.638414, -2.714605, 0.7333333, 1, 0, 1,
-0.8685034, -1.714561, -0.8585559, 0.7294118, 1, 0, 1,
-0.8666512, -0.5810041, -3.098905, 0.7215686, 1, 0, 1,
-0.8603832, 0.01892585, -3.568367, 0.7176471, 1, 0, 1,
-0.8587508, -1.061413, -3.175661, 0.7098039, 1, 0, 1,
-0.8484423, 0.545464, -1.565873, 0.7058824, 1, 0, 1,
-0.8458688, -0.9532613, -2.069219, 0.6980392, 1, 0, 1,
-0.8394111, -0.06994116, -1.049054, 0.6901961, 1, 0, 1,
-0.8381182, 0.5457695, -0.8119892, 0.6862745, 1, 0, 1,
-0.8359714, -0.7324989, -2.354122, 0.6784314, 1, 0, 1,
-0.8321447, -0.9258531, -1.861631, 0.6745098, 1, 0, 1,
-0.8316134, 1.036486, -0.8923306, 0.6666667, 1, 0, 1,
-0.83119, -0.6597393, -2.327813, 0.6627451, 1, 0, 1,
-0.8291358, -0.2346109, -1.687448, 0.654902, 1, 0, 1,
-0.8261834, 1.400389, -0.8207095, 0.6509804, 1, 0, 1,
-0.8234074, -0.0412643, -1.6026, 0.6431373, 1, 0, 1,
-0.81249, 0.1661588, -2.11082, 0.6392157, 1, 0, 1,
-0.8062929, 0.8763021, 0.1595444, 0.6313726, 1, 0, 1,
-0.8023655, -0.2649185, -2.390047, 0.627451, 1, 0, 1,
-0.7998816, -0.06832214, -1.776766, 0.6196079, 1, 0, 1,
-0.7993839, 0.3158709, -0.2330918, 0.6156863, 1, 0, 1,
-0.798218, 0.8757132, -1.714079, 0.6078432, 1, 0, 1,
-0.7953519, -1.195867, -3.318894, 0.6039216, 1, 0, 1,
-0.7950944, 1.068456, -0.5063094, 0.5960785, 1, 0, 1,
-0.792159, -0.1369972, -1.574277, 0.5882353, 1, 0, 1,
-0.7896007, -0.3330431, -2.342869, 0.5843138, 1, 0, 1,
-0.7889334, 0.4923661, -2.668267, 0.5764706, 1, 0, 1,
-0.7838556, 1.302452, -0.6622443, 0.572549, 1, 0, 1,
-0.7797599, -0.4369968, -1.60354, 0.5647059, 1, 0, 1,
-0.7787413, -0.05280749, -0.576827, 0.5607843, 1, 0, 1,
-0.7722071, -0.1412371, -3.068608, 0.5529412, 1, 0, 1,
-0.7636656, 0.04193276, -2.239681, 0.5490196, 1, 0, 1,
-0.76157, -0.7098616, -5.043556, 0.5411765, 1, 0, 1,
-0.7597553, 0.6598707, -0.06850878, 0.5372549, 1, 0, 1,
-0.7568226, 1.365083, -0.6897451, 0.5294118, 1, 0, 1,
-0.7341603, 0.0935591, -1.234724, 0.5254902, 1, 0, 1,
-0.7337565, -0.2666681, -2.519181, 0.5176471, 1, 0, 1,
-0.7322328, -0.57231, -2.271353, 0.5137255, 1, 0, 1,
-0.7316187, 1.210211, -1.34835, 0.5058824, 1, 0, 1,
-0.7295722, 0.3250348, -0.6012471, 0.5019608, 1, 0, 1,
-0.7294659, 0.3477825, -0.7335069, 0.4941176, 1, 0, 1,
-0.7285743, -0.5213051, -2.309195, 0.4862745, 1, 0, 1,
-0.7205921, 1.33036, -1.482487, 0.4823529, 1, 0, 1,
-0.7199833, -0.2592075, -2.243783, 0.4745098, 1, 0, 1,
-0.7192084, 1.348627, -0.0005193785, 0.4705882, 1, 0, 1,
-0.7162732, 1.074263, -2.266432, 0.4627451, 1, 0, 1,
-0.710363, -1.220281, -3.435806, 0.4588235, 1, 0, 1,
-0.7083929, -1.441894, -2.485538, 0.4509804, 1, 0, 1,
-0.7031171, 0.8763216, -1.46772, 0.4470588, 1, 0, 1,
-0.7013059, -0.1474074, -1.682888, 0.4392157, 1, 0, 1,
-0.6969277, 0.2944739, -1.7813, 0.4352941, 1, 0, 1,
-0.6950341, -0.6272355, -4.155953, 0.427451, 1, 0, 1,
-0.6946583, -0.01674869, -1.192051, 0.4235294, 1, 0, 1,
-0.6918312, -1.057581, -0.3968246, 0.4156863, 1, 0, 1,
-0.6914513, -1.60069, -3.805824, 0.4117647, 1, 0, 1,
-0.6900964, 0.5569788, -0.7944999, 0.4039216, 1, 0, 1,
-0.6890115, -0.0866535, -2.871568, 0.3960784, 1, 0, 1,
-0.6873356, -0.6862179, -2.600238, 0.3921569, 1, 0, 1,
-0.6832449, 0.7219742, -1.480159, 0.3843137, 1, 0, 1,
-0.6814671, 1.085208, 1.440454, 0.3803922, 1, 0, 1,
-0.6792223, 0.00320719, -1.550051, 0.372549, 1, 0, 1,
-0.6748871, -2.002586, -2.567948, 0.3686275, 1, 0, 1,
-0.6744646, 0.5365546, -0.5613223, 0.3607843, 1, 0, 1,
-0.6649163, -1.375832, -0.9807946, 0.3568628, 1, 0, 1,
-0.6640064, -1.470453, -2.184505, 0.3490196, 1, 0, 1,
-0.6631975, -0.7407446, -1.675658, 0.345098, 1, 0, 1,
-0.6629341, -1.365679, -3.634345, 0.3372549, 1, 0, 1,
-0.6617543, 0.5029584, -0.08074829, 0.3333333, 1, 0, 1,
-0.6595061, 0.1921979, 0.05356149, 0.3254902, 1, 0, 1,
-0.6527351, -0.1533199, -2.185491, 0.3215686, 1, 0, 1,
-0.6493079, -0.5641323, -3.53522, 0.3137255, 1, 0, 1,
-0.6445312, -0.1558655, -2.312281, 0.3098039, 1, 0, 1,
-0.6423535, -0.7021209, -2.702754, 0.3019608, 1, 0, 1,
-0.6414877, -0.07949671, -1.645179, 0.2941177, 1, 0, 1,
-0.6404957, 0.3354861, -2.105382, 0.2901961, 1, 0, 1,
-0.6372218, 2.242629, 0.4393448, 0.282353, 1, 0, 1,
-0.636543, -0.3243656, -2.945297, 0.2784314, 1, 0, 1,
-0.6361035, -1.041437, -3.333035, 0.2705882, 1, 0, 1,
-0.63512, 0.06791911, -2.098365, 0.2666667, 1, 0, 1,
-0.6334406, -0.6806834, -1.078225, 0.2588235, 1, 0, 1,
-0.6315432, -1.991336, -2.56431, 0.254902, 1, 0, 1,
-0.6281831, 0.4166511, -0.7971837, 0.2470588, 1, 0, 1,
-0.6247272, 0.5170901, 0.1264226, 0.2431373, 1, 0, 1,
-0.6206831, 0.2010555, -1.031315, 0.2352941, 1, 0, 1,
-0.6178132, 0.7287717, 1.6428, 0.2313726, 1, 0, 1,
-0.6157518, -0.1135092, -3.188777, 0.2235294, 1, 0, 1,
-0.61358, 1.195042, -0.3973562, 0.2196078, 1, 0, 1,
-0.612606, -0.3098288, -0.9642835, 0.2117647, 1, 0, 1,
-0.6082305, -0.4128991, -1.604502, 0.2078431, 1, 0, 1,
-0.6078624, 0.2075472, -3.371645, 0.2, 1, 0, 1,
-0.6023243, 1.08253, -1.122094, 0.1921569, 1, 0, 1,
-0.601362, -1.488891, -1.679765, 0.1882353, 1, 0, 1,
-0.6006619, -0.9710485, -3.783143, 0.1803922, 1, 0, 1,
-0.5984063, 0.4228774, -0.3579277, 0.1764706, 1, 0, 1,
-0.5929508, -0.3894408, -1.685032, 0.1686275, 1, 0, 1,
-0.5925021, -1.634521, -1.493244, 0.1647059, 1, 0, 1,
-0.5924913, 0.2088539, -1.612459, 0.1568628, 1, 0, 1,
-0.5913261, 0.6393582, -1.391862, 0.1529412, 1, 0, 1,
-0.5855466, -0.02072178, -0.531683, 0.145098, 1, 0, 1,
-0.5839497, -0.002349989, -2.344665, 0.1411765, 1, 0, 1,
-0.5815758, -0.9856741, -4.941369, 0.1333333, 1, 0, 1,
-0.5779181, -0.5303243, -1.665382, 0.1294118, 1, 0, 1,
-0.5753445, 1.165725, -0.7648063, 0.1215686, 1, 0, 1,
-0.5699965, -0.6563288, -2.039384, 0.1176471, 1, 0, 1,
-0.5685984, 0.4031168, -0.679382, 0.1098039, 1, 0, 1,
-0.5672717, 0.1115356, -2.265498, 0.1058824, 1, 0, 1,
-0.5547333, 0.5560251, -0.2710403, 0.09803922, 1, 0, 1,
-0.5533634, -0.8439518, -0.7081789, 0.09019608, 1, 0, 1,
-0.5530359, -0.7392254, -1.589945, 0.08627451, 1, 0, 1,
-0.5520275, 0.9209952, -0.05000254, 0.07843138, 1, 0, 1,
-0.5511778, 1.322504, -1.800447, 0.07450981, 1, 0, 1,
-0.5487384, -1.028963, -3.038551, 0.06666667, 1, 0, 1,
-0.5419963, 1.380398, 1.121047, 0.0627451, 1, 0, 1,
-0.541629, 0.8443409, -0.7411725, 0.05490196, 1, 0, 1,
-0.5330859, -2.040256, -2.597737, 0.05098039, 1, 0, 1,
-0.5310922, -1.5146, -2.382233, 0.04313726, 1, 0, 1,
-0.5228645, -0.5716533, -2.565954, 0.03921569, 1, 0, 1,
-0.5210556, 0.7093291, -0.4034652, 0.03137255, 1, 0, 1,
-0.5187265, -0.523845, -3.085495, 0.02745098, 1, 0, 1,
-0.5170771, 0.426803, -1.292326, 0.01960784, 1, 0, 1,
-0.5105744, -0.5694083, -2.840878, 0.01568628, 1, 0, 1,
-0.5066212, 0.7916687, -0.1619257, 0.007843138, 1, 0, 1,
-0.5061963, -1.119573, -2.365316, 0.003921569, 1, 0, 1,
-0.5051745, -0.5301244, -2.517993, 0, 1, 0.003921569, 1,
-0.5008252, 0.58218, -1.785417, 0, 1, 0.01176471, 1,
-0.5007191, 0.7313383, -0.8221195, 0, 1, 0.01568628, 1,
-0.5000974, -0.7073833, -4.090268, 0, 1, 0.02352941, 1,
-0.5000227, 0.732819, -0.2971482, 0, 1, 0.02745098, 1,
-0.4920563, 0.05092321, -0.4756624, 0, 1, 0.03529412, 1,
-0.4920154, 0.3551376, -1.097236, 0, 1, 0.03921569, 1,
-0.4907886, 0.03187218, 0.390413, 0, 1, 0.04705882, 1,
-0.4897761, 0.08901662, -0.4050736, 0, 1, 0.05098039, 1,
-0.489514, 1.006841, -2.397947, 0, 1, 0.05882353, 1,
-0.4847041, -0.2281425, -0.4569815, 0, 1, 0.0627451, 1,
-0.4843583, -0.7333984, -2.005495, 0, 1, 0.07058824, 1,
-0.4826393, -0.6741649, -2.842064, 0, 1, 0.07450981, 1,
-0.4824516, 0.4690176, -0.9470474, 0, 1, 0.08235294, 1,
-0.4824055, 0.3609357, -1.446608, 0, 1, 0.08627451, 1,
-0.4803337, 0.7338971, -0.2824452, 0, 1, 0.09411765, 1,
-0.4722208, 0.4680827, -0.8849322, 0, 1, 0.1019608, 1,
-0.4721892, 0.7762755, -1.247872, 0, 1, 0.1058824, 1,
-0.4684888, -0.4149302, -3.170945, 0, 1, 0.1137255, 1,
-0.4628503, -0.2256163, -3.205736, 0, 1, 0.1176471, 1,
-0.4546103, -0.3810161, -2.940438, 0, 1, 0.1254902, 1,
-0.4517065, -0.1876093, -2.23912, 0, 1, 0.1294118, 1,
-0.4478531, -0.06997661, -1.195228, 0, 1, 0.1372549, 1,
-0.4400442, -1.753388, -3.494718, 0, 1, 0.1411765, 1,
-0.4397243, -0.9628268, -2.524206, 0, 1, 0.1490196, 1,
-0.4392101, -1.441293, -2.822228, 0, 1, 0.1529412, 1,
-0.4382752, 0.7408932, 0.8599179, 0, 1, 0.1607843, 1,
-0.4351865, -0.5142298, -2.75796, 0, 1, 0.1647059, 1,
-0.435144, -1.691148, -2.193239, 0, 1, 0.172549, 1,
-0.4332057, 0.6319661, -0.3166462, 0, 1, 0.1764706, 1,
-0.4274301, 0.1359749, 0.06791225, 0, 1, 0.1843137, 1,
-0.4247965, -0.3174576, -1.670524, 0, 1, 0.1882353, 1,
-0.4192868, 0.3248017, -0.8400412, 0, 1, 0.1960784, 1,
-0.418781, -2.004692, -3.666612, 0, 1, 0.2039216, 1,
-0.415238, -1.067547, -4.008418, 0, 1, 0.2078431, 1,
-0.4129975, -1.699944, -1.922633, 0, 1, 0.2156863, 1,
-0.4090679, 0.2430435, -1.481958, 0, 1, 0.2196078, 1,
-0.4080935, -2.044107, -2.733043, 0, 1, 0.227451, 1,
-0.4045059, 1.058839, -0.6081865, 0, 1, 0.2313726, 1,
-0.4043181, -0.2134024, -1.3619, 0, 1, 0.2392157, 1,
-0.4031513, -0.3584988, -2.498545, 0, 1, 0.2431373, 1,
-0.4012802, 1.883472, -0.5252634, 0, 1, 0.2509804, 1,
-0.3985567, -1.395712, -4.34699, 0, 1, 0.254902, 1,
-0.3980184, 0.1383205, -0.7689809, 0, 1, 0.2627451, 1,
-0.3847124, 1.021122, -1.248299, 0, 1, 0.2666667, 1,
-0.3817883, 1.796008, 1.654328, 0, 1, 0.2745098, 1,
-0.3811701, 0.5917234, -3.180184, 0, 1, 0.2784314, 1,
-0.3769398, 0.5555536, -0.6477582, 0, 1, 0.2862745, 1,
-0.3768256, 0.7536967, -1.391974, 0, 1, 0.2901961, 1,
-0.3761646, -0.5489784, -2.908957, 0, 1, 0.2980392, 1,
-0.373737, -0.1428871, -0.2301299, 0, 1, 0.3058824, 1,
-0.37351, 0.6366003, -1.698576, 0, 1, 0.3098039, 1,
-0.3611633, 0.4428778, -1.778352, 0, 1, 0.3176471, 1,
-0.360657, -0.5621334, -3.035706, 0, 1, 0.3215686, 1,
-0.3578207, -0.2749177, -2.58219, 0, 1, 0.3294118, 1,
-0.3555949, -0.3406755, -1.964851, 0, 1, 0.3333333, 1,
-0.3540091, 0.381127, -1.125368, 0, 1, 0.3411765, 1,
-0.3534451, -1.82322, -3.623468, 0, 1, 0.345098, 1,
-0.3521414, 0.1264552, -1.494989, 0, 1, 0.3529412, 1,
-0.3484823, -1.35507, -2.336693, 0, 1, 0.3568628, 1,
-0.3484126, -1.304879, -2.148847, 0, 1, 0.3647059, 1,
-0.3435207, -1.539768, -2.231349, 0, 1, 0.3686275, 1,
-0.3377671, -0.4701452, -1.675106, 0, 1, 0.3764706, 1,
-0.3303568, 1.559538, 1.411563, 0, 1, 0.3803922, 1,
-0.3283574, -1.214598, -1.921902, 0, 1, 0.3882353, 1,
-0.3250893, -1.613804, -3.961453, 0, 1, 0.3921569, 1,
-0.3233171, -1.647191, -3.8007, 0, 1, 0.4, 1,
-0.3193975, -1.395783, -3.099571, 0, 1, 0.4078431, 1,
-0.3149665, 2.343985, -0.3702451, 0, 1, 0.4117647, 1,
-0.3143926, -0.6520443, -0.3098713, 0, 1, 0.4196078, 1,
-0.3137526, 0.09975585, -3.050014, 0, 1, 0.4235294, 1,
-0.3122834, -0.7814334, -1.962603, 0, 1, 0.4313726, 1,
-0.3109406, -1.139225, -2.377358, 0, 1, 0.4352941, 1,
-0.3092094, -0.5727983, -2.040416, 0, 1, 0.4431373, 1,
-0.3068987, 0.2339164, -1.472815, 0, 1, 0.4470588, 1,
-0.3064704, -0.5183632, -3.277932, 0, 1, 0.454902, 1,
-0.305808, 1.342417, 0.4218004, 0, 1, 0.4588235, 1,
-0.3026742, -1.496496, -2.86211, 0, 1, 0.4666667, 1,
-0.2980157, -0.4403827, -3.33534, 0, 1, 0.4705882, 1,
-0.2966417, -1.794797, -3.053335, 0, 1, 0.4784314, 1,
-0.2946912, -0.5062281, -3.207475, 0, 1, 0.4823529, 1,
-0.2915494, -0.6648492, -1.788629, 0, 1, 0.4901961, 1,
-0.2900564, -0.9296103, -1.575049, 0, 1, 0.4941176, 1,
-0.2801493, -0.02974148, -0.5456319, 0, 1, 0.5019608, 1,
-0.2739491, -0.9932227, -4.252891, 0, 1, 0.509804, 1,
-0.2730084, -0.2619062, -2.882375, 0, 1, 0.5137255, 1,
-0.2723903, 0.5910505, -1.436477, 0, 1, 0.5215687, 1,
-0.271623, 0.4100633, -2.636401, 0, 1, 0.5254902, 1,
-0.2705484, 1.180748, 0.3446808, 0, 1, 0.5333334, 1,
-0.2677125, 1.284314, -0.6141523, 0, 1, 0.5372549, 1,
-0.2649275, 1.473255, 0.7126645, 0, 1, 0.5450981, 1,
-0.2625799, -0.5994456, -1.634317, 0, 1, 0.5490196, 1,
-0.2607673, 0.01489525, -2.433899, 0, 1, 0.5568628, 1,
-0.2558278, -0.3814859, -3.415328, 0, 1, 0.5607843, 1,
-0.2549213, 0.6257993, -0.907213, 0, 1, 0.5686275, 1,
-0.2519526, -1.268162, -2.847508, 0, 1, 0.572549, 1,
-0.2511134, 0.05426528, -0.2743012, 0, 1, 0.5803922, 1,
-0.242774, 0.4909294, -0.3553986, 0, 1, 0.5843138, 1,
-0.2373178, 0.3713719, 1.090813, 0, 1, 0.5921569, 1,
-0.2372762, -1.183463, -3.873503, 0, 1, 0.5960785, 1,
-0.2328485, 1.0853, 1.160577, 0, 1, 0.6039216, 1,
-0.2309923, 0.1526849, -1.088302, 0, 1, 0.6117647, 1,
-0.2305201, 1.99119, 2.153222, 0, 1, 0.6156863, 1,
-0.2292363, -1.201528, -2.619683, 0, 1, 0.6235294, 1,
-0.2286931, -0.4744293, -4.176206, 0, 1, 0.627451, 1,
-0.2282216, 1.368474, -0.6969424, 0, 1, 0.6352941, 1,
-0.2269506, -0.5830542, -1.965436, 0, 1, 0.6392157, 1,
-0.2236212, 0.7634872, 0.1283616, 0, 1, 0.6470588, 1,
-0.2233949, -1.792314, -4.256797, 0, 1, 0.6509804, 1,
-0.2074585, 0.1487474, -1.424619, 0, 1, 0.6588235, 1,
-0.2059298, -0.2827066, -2.775441, 0, 1, 0.6627451, 1,
-0.2024484, 0.2180397, -0.9540007, 0, 1, 0.6705883, 1,
-0.2013231, 0.9679089, -0.2649624, 0, 1, 0.6745098, 1,
-0.2009755, 0.002766204, -0.2992608, 0, 1, 0.682353, 1,
-0.2002534, -0.3568894, -4.523468, 0, 1, 0.6862745, 1,
-0.2001641, -0.9383955, -4.349165, 0, 1, 0.6941177, 1,
-0.1948919, 0.0138339, -0.4689414, 0, 1, 0.7019608, 1,
-0.1928946, -1.007847, -3.606342, 0, 1, 0.7058824, 1,
-0.1914433, -0.5738471, -1.503302, 0, 1, 0.7137255, 1,
-0.1890552, -0.3711681, -1.273589, 0, 1, 0.7176471, 1,
-0.1852382, 0.2587125, 0.9172, 0, 1, 0.7254902, 1,
-0.1738084, -0.5553622, -3.3651, 0, 1, 0.7294118, 1,
-0.1723966, -0.009583157, -1.79266, 0, 1, 0.7372549, 1,
-0.1689723, 0.9775569, 0.8744717, 0, 1, 0.7411765, 1,
-0.1687784, -0.5565352, -4.396421, 0, 1, 0.7490196, 1,
-0.1665039, -0.7416768, -2.095012, 0, 1, 0.7529412, 1,
-0.1632286, -1.935891, -1.867582, 0, 1, 0.7607843, 1,
-0.1629091, -0.1220414, -2.650182, 0, 1, 0.7647059, 1,
-0.1625126, 0.778935, -0.9760088, 0, 1, 0.772549, 1,
-0.1623243, -1.656341, -3.224714, 0, 1, 0.7764706, 1,
-0.1609249, 1.627347, 0.1523141, 0, 1, 0.7843137, 1,
-0.1558152, 0.07723071, 0.01786049, 0, 1, 0.7882353, 1,
-0.1543338, -0.03986636, -1.242443, 0, 1, 0.7960784, 1,
-0.1539827, -0.8345744, -1.938244, 0, 1, 0.8039216, 1,
-0.1530744, -1.577462, -4.585618, 0, 1, 0.8078431, 1,
-0.1483859, -1.359985, -4.072827, 0, 1, 0.8156863, 1,
-0.1415563, -0.1399748, -2.554062, 0, 1, 0.8196079, 1,
-0.1397685, 0.9733969, -0.5519317, 0, 1, 0.827451, 1,
-0.138899, -1.45596, -2.431142, 0, 1, 0.8313726, 1,
-0.1364793, -1.333858, -2.808397, 0, 1, 0.8392157, 1,
-0.1351655, -0.3730878, -0.9906622, 0, 1, 0.8431373, 1,
-0.1257854, 0.07617979, 0.2934158, 0, 1, 0.8509804, 1,
-0.1238798, 0.05630233, -0.8211447, 0, 1, 0.854902, 1,
-0.1186635, 0.5633348, 0.1786303, 0, 1, 0.8627451, 1,
-0.1145744, 1.817674, -0.4922068, 0, 1, 0.8666667, 1,
-0.1138103, 0.2421723, -1.601784, 0, 1, 0.8745098, 1,
-0.1121102, -1.126958, -1.592074, 0, 1, 0.8784314, 1,
-0.1106623, 0.05571918, -0.3681284, 0, 1, 0.8862745, 1,
-0.1096487, 0.1927583, -1.335826, 0, 1, 0.8901961, 1,
-0.1081436, -0.7669814, -5.599221, 0, 1, 0.8980392, 1,
-0.1032541, 0.4867926, 0.2395598, 0, 1, 0.9058824, 1,
-0.100573, 1.145503, 0.7611535, 0, 1, 0.9098039, 1,
-0.09910756, -0.4066365, -2.799163, 0, 1, 0.9176471, 1,
-0.09885199, 0.620692, 0.81883, 0, 1, 0.9215686, 1,
-0.09640753, 0.3899704, -0.2887859, 0, 1, 0.9294118, 1,
-0.08918169, -0.4751085, -2.977801, 0, 1, 0.9333333, 1,
-0.08819543, -0.4449306, -3.294147, 0, 1, 0.9411765, 1,
-0.08793473, -0.8432675, -3.119294, 0, 1, 0.945098, 1,
-0.08754104, -1.433201, -4.133702, 0, 1, 0.9529412, 1,
-0.08722033, -0.05826737, -2.556363, 0, 1, 0.9568627, 1,
-0.08696741, 1.253413, 0.5951402, 0, 1, 0.9647059, 1,
-0.08423956, 0.6426724, -0.198736, 0, 1, 0.9686275, 1,
-0.07740492, -0.08552934, -1.274624, 0, 1, 0.9764706, 1,
-0.07735071, 0.2559176, 1.496827, 0, 1, 0.9803922, 1,
-0.07727396, 0.3155318, -0.2176479, 0, 1, 0.9882353, 1,
-0.07229965, 0.4459616, -0.8409397, 0, 1, 0.9921569, 1,
-0.07099165, 1.058456, -0.1127501, 0, 1, 1, 1,
-0.07033852, -0.3235436, -2.986209, 0, 0.9921569, 1, 1,
-0.06806675, -1.54947, -5.315542, 0, 0.9882353, 1, 1,
-0.06185538, -0.8610062, -1.984396, 0, 0.9803922, 1, 1,
-0.06115533, 0.5404258, 0.377235, 0, 0.9764706, 1, 1,
-0.05842546, -0.2213395, -1.513191, 0, 0.9686275, 1, 1,
-0.05209916, 0.01153761, -1.893003, 0, 0.9647059, 1, 1,
-0.04803092, -0.109124, -2.058491, 0, 0.9568627, 1, 1,
-0.04478502, 1.328771, -1.415163, 0, 0.9529412, 1, 1,
-0.04157482, -0.0662931, -3.477236, 0, 0.945098, 1, 1,
-0.03809722, -0.2065172, -3.676607, 0, 0.9411765, 1, 1,
-0.0359921, 1.005515, 0.04172547, 0, 0.9333333, 1, 1,
-0.03532328, 0.504617, 0.2869346, 0, 0.9294118, 1, 1,
-0.03433269, -0.276216, -3.106288, 0, 0.9215686, 1, 1,
-0.03134684, -0.3309857, -2.630077, 0, 0.9176471, 1, 1,
-0.02923532, -1.662312, -3.233776, 0, 0.9098039, 1, 1,
-0.02535272, -1.251863, -3.825284, 0, 0.9058824, 1, 1,
-0.02295926, 0.2678006, -0.9422858, 0, 0.8980392, 1, 1,
-0.01911017, 1.218607, 0.5687136, 0, 0.8901961, 1, 1,
-0.01898491, 0.7367421, 0.3810966, 0, 0.8862745, 1, 1,
-0.01772052, 0.828938, 2.305225, 0, 0.8784314, 1, 1,
-0.01564591, 0.08072387, -0.5552545, 0, 0.8745098, 1, 1,
-0.01387433, -1.049456, -2.033095, 0, 0.8666667, 1, 1,
-0.01340154, 0.8090636, -1.176171, 0, 0.8627451, 1, 1,
-0.01236729, -1.005746, -3.241338, 0, 0.854902, 1, 1,
-0.01180908, 0.5970366, 0.09894908, 0, 0.8509804, 1, 1,
-0.007420315, 0.6477218, -0.7773018, 0, 0.8431373, 1, 1,
-0.00537623, 2.891526, -0.6370788, 0, 0.8392157, 1, 1,
-0.002816288, -0.4054579, -2.04273, 0, 0.8313726, 1, 1,
0.0008413721, 0.5641862, -1.569949, 0, 0.827451, 1, 1,
0.002884819, -1.435936, 2.224059, 0, 0.8196079, 1, 1,
0.003798193, -0.7952854, 4.620621, 0, 0.8156863, 1, 1,
0.007772576, 0.7438889, -0.07456904, 0, 0.8078431, 1, 1,
0.01045944, 0.1230522, -1.479989, 0, 0.8039216, 1, 1,
0.01256814, -0.3784795, 2.698156, 0, 0.7960784, 1, 1,
0.01654943, -0.02458531, 1.492798, 0, 0.7882353, 1, 1,
0.01661751, 0.4626219, 1.756696, 0, 0.7843137, 1, 1,
0.01824854, -1.118621, 3.17444, 0, 0.7764706, 1, 1,
0.02059992, -0.48881, 2.852275, 0, 0.772549, 1, 1,
0.02506791, 0.05747176, -0.7664323, 0, 0.7647059, 1, 1,
0.02909003, -0.07679616, 3.789833, 0, 0.7607843, 1, 1,
0.03270247, 0.904498, -0.2155691, 0, 0.7529412, 1, 1,
0.033721, -0.7055522, 3.538094, 0, 0.7490196, 1, 1,
0.04359476, -0.5234997, 3.418078, 0, 0.7411765, 1, 1,
0.04517446, 0.2550175, 0.6017954, 0, 0.7372549, 1, 1,
0.04543429, 1.037897, 1.592981, 0, 0.7294118, 1, 1,
0.04884504, 0.6512873, -0.3143298, 0, 0.7254902, 1, 1,
0.04952439, 0.6675852, -0.3710056, 0, 0.7176471, 1, 1,
0.05015256, 0.4593003, 0.2449683, 0, 0.7137255, 1, 1,
0.05378756, 0.2189482, 0.2460227, 0, 0.7058824, 1, 1,
0.05450861, 0.3243357, -0.9290267, 0, 0.6980392, 1, 1,
0.05641619, -0.5286672, 3.248202, 0, 0.6941177, 1, 1,
0.06870878, 0.3688537, 1.613151, 0, 0.6862745, 1, 1,
0.07003658, -1.282607, 2.312367, 0, 0.682353, 1, 1,
0.07523357, -1.655491, 2.998541, 0, 0.6745098, 1, 1,
0.07927748, -0.8816012, 4.269145, 0, 0.6705883, 1, 1,
0.08189785, 0.3844552, -0.5822431, 0, 0.6627451, 1, 1,
0.08229154, -0.3842847, 4.087321, 0, 0.6588235, 1, 1,
0.08748881, 2.599969, -0.1566904, 0, 0.6509804, 1, 1,
0.09238523, 1.828895, 1.540299, 0, 0.6470588, 1, 1,
0.0933047, 1.965722, 1.017929, 0, 0.6392157, 1, 1,
0.09383646, -0.5154997, 2.733717, 0, 0.6352941, 1, 1,
0.09612678, 1.451155, 0.3405921, 0, 0.627451, 1, 1,
0.09842629, 0.2519861, 0.4938716, 0, 0.6235294, 1, 1,
0.1013158, 0.3872473, -0.2410721, 0, 0.6156863, 1, 1,
0.1048405, -0.5912481, 3.682857, 0, 0.6117647, 1, 1,
0.1084821, 0.03965185, 2.200094, 0, 0.6039216, 1, 1,
0.111206, 0.3839398, -0.02332572, 0, 0.5960785, 1, 1,
0.1177778, -0.9415368, 3.30387, 0, 0.5921569, 1, 1,
0.1191589, -1.835658, 3.136688, 0, 0.5843138, 1, 1,
0.1210723, -0.30965, 2.868744, 0, 0.5803922, 1, 1,
0.1226874, 0.03090489, 1.993846, 0, 0.572549, 1, 1,
0.1239861, 1.086707, 0.423444, 0, 0.5686275, 1, 1,
0.1240741, -0.2254975, 0.7557152, 0, 0.5607843, 1, 1,
0.1269639, -0.6028432, 3.984518, 0, 0.5568628, 1, 1,
0.1277534, 0.5547361, 0.7770036, 0, 0.5490196, 1, 1,
0.1296583, -1.20752, 4.106615, 0, 0.5450981, 1, 1,
0.1300378, -2.293282, 3.850106, 0, 0.5372549, 1, 1,
0.1337473, -1.709086, 2.907635, 0, 0.5333334, 1, 1,
0.134712, 0.4512505, 1.141713, 0, 0.5254902, 1, 1,
0.140392, -1.223177, 1.322225, 0, 0.5215687, 1, 1,
0.1439201, -1.133635, 4.770682, 0, 0.5137255, 1, 1,
0.1530387, 0.8543485, 0.9657575, 0, 0.509804, 1, 1,
0.1648638, 0.1179744, 1.519491, 0, 0.5019608, 1, 1,
0.1654555, -0.09762782, 2.895157, 0, 0.4941176, 1, 1,
0.1718711, -1.316645, 1.116049, 0, 0.4901961, 1, 1,
0.1726566, -0.3340414, 4.499862, 0, 0.4823529, 1, 1,
0.1747572, 0.4652747, -0.4770827, 0, 0.4784314, 1, 1,
0.1781276, -2.403547, 5.873821, 0, 0.4705882, 1, 1,
0.1781798, 0.009831003, 2.830681, 0, 0.4666667, 1, 1,
0.1791923, -0.2879947, 2.931625, 0, 0.4588235, 1, 1,
0.1796647, -0.4676963, 1.038653, 0, 0.454902, 1, 1,
0.1825756, 0.7077381, -0.2774648, 0, 0.4470588, 1, 1,
0.1835952, 0.1468136, 1.399315, 0, 0.4431373, 1, 1,
0.1885412, -0.7089958, 2.86671, 0, 0.4352941, 1, 1,
0.1967714, 0.4737395, 0.8817135, 0, 0.4313726, 1, 1,
0.1978326, -0.2654622, 3.06531, 0, 0.4235294, 1, 1,
0.2067421, -0.1926702, 1.131152, 0, 0.4196078, 1, 1,
0.2086863, 1.5545, 0.05960344, 0, 0.4117647, 1, 1,
0.212263, 0.3427558, -0.5039086, 0, 0.4078431, 1, 1,
0.2150229, 0.9232903, 0.1974397, 0, 0.4, 1, 1,
0.2186994, -1.36315, 2.804115, 0, 0.3921569, 1, 1,
0.2264276, 0.6832656, 0.1451328, 0, 0.3882353, 1, 1,
0.2277441, -0.7829213, 2.650383, 0, 0.3803922, 1, 1,
0.2292659, 0.1769271, 0.8435226, 0, 0.3764706, 1, 1,
0.2310695, 1.522011, 0.170857, 0, 0.3686275, 1, 1,
0.2310699, -0.4753221, 1.734832, 0, 0.3647059, 1, 1,
0.2312352, -0.1637797, 2.426361, 0, 0.3568628, 1, 1,
0.2342477, -0.7280442, 2.744703, 0, 0.3529412, 1, 1,
0.2355293, 0.5169453, 1.23557, 0, 0.345098, 1, 1,
0.2369325, -0.4935979, 2.871488, 0, 0.3411765, 1, 1,
0.2374907, -0.6238178, 3.059606, 0, 0.3333333, 1, 1,
0.2410579, -0.3652748, 1.220907, 0, 0.3294118, 1, 1,
0.2462483, -1.067018, 1.545768, 0, 0.3215686, 1, 1,
0.2473088, -0.8354658, 2.23784, 0, 0.3176471, 1, 1,
0.2488879, 1.359897, -0.6235307, 0, 0.3098039, 1, 1,
0.2491304, 0.2957392, 1.635595, 0, 0.3058824, 1, 1,
0.2529545, 0.4252684, 0.3419971, 0, 0.2980392, 1, 1,
0.255928, 1.69026, 0.1614891, 0, 0.2901961, 1, 1,
0.2576128, -0.7891877, 2.386955, 0, 0.2862745, 1, 1,
0.259852, 0.2126476, 1.566791, 0, 0.2784314, 1, 1,
0.2602461, 1.187381, 1.476959, 0, 0.2745098, 1, 1,
0.2748609, -1.089498, 2.567291, 0, 0.2666667, 1, 1,
0.2761119, -0.8128502, 3.066305, 0, 0.2627451, 1, 1,
0.2890619, 0.7826869, 0.6248221, 0, 0.254902, 1, 1,
0.2940332, -0.172691, 1.431803, 0, 0.2509804, 1, 1,
0.2973223, 0.4788228, 0.9810587, 0, 0.2431373, 1, 1,
0.2976748, 0.1832431, 1.93035, 0, 0.2392157, 1, 1,
0.3028945, 0.1742886, 2.216073, 0, 0.2313726, 1, 1,
0.3101819, -1.117466, 1.581948, 0, 0.227451, 1, 1,
0.3237518, 0.07952233, 0.3729502, 0, 0.2196078, 1, 1,
0.3278196, -0.8846109, 4.041413, 0, 0.2156863, 1, 1,
0.3295886, -1.856968, 2.83342, 0, 0.2078431, 1, 1,
0.3320991, 1.152838, 0.4866242, 0, 0.2039216, 1, 1,
0.3352606, 0.3076565, 1.177988, 0, 0.1960784, 1, 1,
0.3384326, 0.7454629, 0.5687811, 0, 0.1882353, 1, 1,
0.3387641, 0.1054555, 1.639938, 0, 0.1843137, 1, 1,
0.3400038, 0.3823702, 0.06676311, 0, 0.1764706, 1, 1,
0.34027, 0.9982208, 0.508939, 0, 0.172549, 1, 1,
0.3408573, -0.189795, 1.893532, 0, 0.1647059, 1, 1,
0.3419287, 2.949875, 1.663931, 0, 0.1607843, 1, 1,
0.3419362, 0.02112138, 3.41351, 0, 0.1529412, 1, 1,
0.347682, -1.475224, 2.185757, 0, 0.1490196, 1, 1,
0.348069, -0.9657993, 3.730812, 0, 0.1411765, 1, 1,
0.3484928, 0.4276402, 1.060925, 0, 0.1372549, 1, 1,
0.3490708, -0.8539485, 3.786583, 0, 0.1294118, 1, 1,
0.3495382, 0.6165252, 1.542514, 0, 0.1254902, 1, 1,
0.3509735, 0.05842013, 0.9944918, 0, 0.1176471, 1, 1,
0.3513222, 0.4618282, 0.1583423, 0, 0.1137255, 1, 1,
0.3514803, -0.6456025, 0.04066416, 0, 0.1058824, 1, 1,
0.3545775, -1.439181, 3.465778, 0, 0.09803922, 1, 1,
0.3585419, -0.90105, 2.467797, 0, 0.09411765, 1, 1,
0.3586312, 2.106747, -0.3916257, 0, 0.08627451, 1, 1,
0.361345, 0.2104305, 1.138017, 0, 0.08235294, 1, 1,
0.362226, -1.964975, 1.644878, 0, 0.07450981, 1, 1,
0.3624216, -0.6749617, 3.1278, 0, 0.07058824, 1, 1,
0.3624455, -1.46917, 2.017027, 0, 0.0627451, 1, 1,
0.3624611, 0.7406493, 0.559748, 0, 0.05882353, 1, 1,
0.3661428, -0.6503434, 2.698875, 0, 0.05098039, 1, 1,
0.370856, -0.3004339, 2.69377, 0, 0.04705882, 1, 1,
0.3769932, 1.468866, 1.949451, 0, 0.03921569, 1, 1,
0.3809897, 1.553605, 0.08045185, 0, 0.03529412, 1, 1,
0.3825418, 0.5019088, 0.708133, 0, 0.02745098, 1, 1,
0.3833214, -0.4206799, 1.636355, 0, 0.02352941, 1, 1,
0.3846904, -0.07543213, 2.871457, 0, 0.01568628, 1, 1,
0.3921243, 0.3949524, 1.086581, 0, 0.01176471, 1, 1,
0.3962607, 0.01827738, 1.280506, 0, 0.003921569, 1, 1,
0.3982256, -1.101024, 3.170531, 0.003921569, 0, 1, 1,
0.3995861, 1.821646, -0.1113514, 0.007843138, 0, 1, 1,
0.4019234, -0.867359, 3.460257, 0.01568628, 0, 1, 1,
0.4088589, -0.0506094, -0.3179509, 0.01960784, 0, 1, 1,
0.4116068, 0.4083712, -0.3347123, 0.02745098, 0, 1, 1,
0.4155836, 1.266864, -0.1544576, 0.03137255, 0, 1, 1,
0.4234096, -0.4492786, 2.455158, 0.03921569, 0, 1, 1,
0.4239485, 0.4413979, 0.09940937, 0.04313726, 0, 1, 1,
0.4241584, 1.110439, 1.690175, 0.05098039, 0, 1, 1,
0.4253324, -0.9815346, 2.318159, 0.05490196, 0, 1, 1,
0.431349, -0.1046008, 1.2237, 0.0627451, 0, 1, 1,
0.433601, -0.1179031, 0.3404552, 0.06666667, 0, 1, 1,
0.4364835, 0.7905374, -0.8542618, 0.07450981, 0, 1, 1,
0.4382628, 1.353341, 0.04570861, 0.07843138, 0, 1, 1,
0.4387397, -0.6374366, 1.007119, 0.08627451, 0, 1, 1,
0.4390048, 1.685702, 1.572063, 0.09019608, 0, 1, 1,
0.4411691, 0.6179658, 0.6642109, 0.09803922, 0, 1, 1,
0.4445496, -0.4273858, 2.680582, 0.1058824, 0, 1, 1,
0.4466655, -0.6860486, 0.2239189, 0.1098039, 0, 1, 1,
0.4487868, -0.5655141, 2.053422, 0.1176471, 0, 1, 1,
0.4502119, -0.6172711, 4.356024, 0.1215686, 0, 1, 1,
0.4557462, 3.625224, -1.172852, 0.1294118, 0, 1, 1,
0.4584072, 1.26074, 0.4747763, 0.1333333, 0, 1, 1,
0.4589362, -0.001441002, 1.674719, 0.1411765, 0, 1, 1,
0.4621675, 0.6223228, 1.851486, 0.145098, 0, 1, 1,
0.4639527, -0.3773515, 1.580722, 0.1529412, 0, 1, 1,
0.4646564, -0.4182236, 3.802807, 0.1568628, 0, 1, 1,
0.4653927, -1.641277, 1.144535, 0.1647059, 0, 1, 1,
0.465515, 0.4747129, 2.411093, 0.1686275, 0, 1, 1,
0.4677793, -1.896037, 4.715897, 0.1764706, 0, 1, 1,
0.4696904, -0.07636875, 1.759402, 0.1803922, 0, 1, 1,
0.471112, 0.9567893, 1.852812, 0.1882353, 0, 1, 1,
0.4724326, -1.017333, 1.160155, 0.1921569, 0, 1, 1,
0.473318, -1.080551, 1.866989, 0.2, 0, 1, 1,
0.474484, 0.5278549, 0.1525543, 0.2078431, 0, 1, 1,
0.4755358, 0.1102695, 0.2844262, 0.2117647, 0, 1, 1,
0.4788459, -0.5010876, 2.787879, 0.2196078, 0, 1, 1,
0.4792829, 0.2688221, 1.029445, 0.2235294, 0, 1, 1,
0.483451, -0.884672, 2.454648, 0.2313726, 0, 1, 1,
0.4840744, 1.126861, -0.2186445, 0.2352941, 0, 1, 1,
0.4879333, 0.8737485, 0.4344992, 0.2431373, 0, 1, 1,
0.4882241, 0.8001378, 1.109533, 0.2470588, 0, 1, 1,
0.4896804, 1.02085, 1.018061, 0.254902, 0, 1, 1,
0.4940891, -0.6687894, 3.976388, 0.2588235, 0, 1, 1,
0.5005565, 1.217801, -0.1588732, 0.2666667, 0, 1, 1,
0.5021568, -0.3158687, 1.875077, 0.2705882, 0, 1, 1,
0.5138007, -1.099557, 2.855987, 0.2784314, 0, 1, 1,
0.5208896, -0.326506, 2.839092, 0.282353, 0, 1, 1,
0.5410302, 0.5834779, 0.221814, 0.2901961, 0, 1, 1,
0.545105, 0.6209478, -0.6632491, 0.2941177, 0, 1, 1,
0.5472806, 0.3048372, 1.557408, 0.3019608, 0, 1, 1,
0.5507116, 0.1694571, 3.207401, 0.3098039, 0, 1, 1,
0.5511386, -0.08560412, 2.643678, 0.3137255, 0, 1, 1,
0.5525241, -0.07340431, 1.223427, 0.3215686, 0, 1, 1,
0.5533281, -0.8958766, 0.9840745, 0.3254902, 0, 1, 1,
0.5549218, 0.5351718, 2.555627, 0.3333333, 0, 1, 1,
0.5606588, 1.367491, 1.956592, 0.3372549, 0, 1, 1,
0.561391, 0.11641, 1.14053, 0.345098, 0, 1, 1,
0.5627417, 0.1708166, 1.552612, 0.3490196, 0, 1, 1,
0.5630504, 0.5579875, 1.136857, 0.3568628, 0, 1, 1,
0.5636905, -0.03486332, -0.07530448, 0.3607843, 0, 1, 1,
0.5647047, 0.02002982, 2.454878, 0.3686275, 0, 1, 1,
0.5661042, -0.7017539, 1.625586, 0.372549, 0, 1, 1,
0.5788987, 0.2165081, 2.582923, 0.3803922, 0, 1, 1,
0.5907011, -0.2856202, 2.119816, 0.3843137, 0, 1, 1,
0.5971524, -0.6753219, 0.59025, 0.3921569, 0, 1, 1,
0.5972307, 0.571722, 1.433651, 0.3960784, 0, 1, 1,
0.601828, 0.3573907, 2.630137, 0.4039216, 0, 1, 1,
0.602597, -1.413142, 2.204666, 0.4117647, 0, 1, 1,
0.6030397, -0.1467826, 0.6660043, 0.4156863, 0, 1, 1,
0.6041459, 1.378049, 1.573236, 0.4235294, 0, 1, 1,
0.6068122, 0.5551028, 1.82153, 0.427451, 0, 1, 1,
0.609108, 0.8191872, 1.599229, 0.4352941, 0, 1, 1,
0.6130959, -1.763632, 1.450758, 0.4392157, 0, 1, 1,
0.6143492, 2.946167, 1.166526, 0.4470588, 0, 1, 1,
0.6152039, -0.01407723, 1.659668, 0.4509804, 0, 1, 1,
0.6176894, -0.9121122, 3.269974, 0.4588235, 0, 1, 1,
0.6234393, 0.8539678, -0.9407929, 0.4627451, 0, 1, 1,
0.6314833, 0.8639923, 0.5372674, 0.4705882, 0, 1, 1,
0.6321792, 0.436251, 1.042456, 0.4745098, 0, 1, 1,
0.6331894, 1.091716, 0.5874481, 0.4823529, 0, 1, 1,
0.6335446, 1.395912, 1.521096, 0.4862745, 0, 1, 1,
0.6361181, -2.666243, 2.564985, 0.4941176, 0, 1, 1,
0.638458, 0.03867925, 1.631198, 0.5019608, 0, 1, 1,
0.6399166, -1.466916, 2.941895, 0.5058824, 0, 1, 1,
0.6402847, 0.6998497, -1.089819, 0.5137255, 0, 1, 1,
0.64102, 1.263888, 2.215276, 0.5176471, 0, 1, 1,
0.641543, -0.5720366, 2.565947, 0.5254902, 0, 1, 1,
0.6419805, -1.184016, 2.783014, 0.5294118, 0, 1, 1,
0.642347, 1.081358, 1.686832, 0.5372549, 0, 1, 1,
0.6556693, 0.5903863, 0.7795125, 0.5411765, 0, 1, 1,
0.6579613, -0.2692074, 2.064765, 0.5490196, 0, 1, 1,
0.6621622, -1.869133, 1.58466, 0.5529412, 0, 1, 1,
0.6641651, 0.9802795, 0.5916422, 0.5607843, 0, 1, 1,
0.6667692, -0.4491507, 1.786227, 0.5647059, 0, 1, 1,
0.6688481, 0.5328436, -1.666425, 0.572549, 0, 1, 1,
0.6694093, -0.6634012, 1.922235, 0.5764706, 0, 1, 1,
0.6790099, 0.6438112, 0.1936554, 0.5843138, 0, 1, 1,
0.6815841, 0.361582, 1.459707, 0.5882353, 0, 1, 1,
0.6841887, 0.5398373, -1.041293, 0.5960785, 0, 1, 1,
0.6863901, -1.761289, 2.492882, 0.6039216, 0, 1, 1,
0.6865684, -0.4465066, 0.8122102, 0.6078432, 0, 1, 1,
0.6870744, -0.00633852, 1.908749, 0.6156863, 0, 1, 1,
0.6964379, -1.03038, 0.4115566, 0.6196079, 0, 1, 1,
0.7115208, 0.0239781, 2.608387, 0.627451, 0, 1, 1,
0.7123237, 1.138229, 0.325596, 0.6313726, 0, 1, 1,
0.7124882, -0.2921162, 1.673653, 0.6392157, 0, 1, 1,
0.7200541, 1.29611, -0.04649886, 0.6431373, 0, 1, 1,
0.7210912, -1.485465, 4.217203, 0.6509804, 0, 1, 1,
0.7228547, 0.4616652, -0.6453483, 0.654902, 0, 1, 1,
0.7257138, 0.1766177, 1.83077, 0.6627451, 0, 1, 1,
0.7277675, -1.750588, 2.263868, 0.6666667, 0, 1, 1,
0.7328135, 0.5415841, 1.353866, 0.6745098, 0, 1, 1,
0.7336256, -1.026452, 2.48711, 0.6784314, 0, 1, 1,
0.7364045, -0.2855383, 2.782056, 0.6862745, 0, 1, 1,
0.73691, 0.02689387, 1.390307, 0.6901961, 0, 1, 1,
0.7394469, 0.4542589, 3.23979, 0.6980392, 0, 1, 1,
0.7421052, 0.4849059, -0.9554769, 0.7058824, 0, 1, 1,
0.7457262, 0.3887284, 0.6876248, 0.7098039, 0, 1, 1,
0.7457759, 0.1637569, 1.654646, 0.7176471, 0, 1, 1,
0.7510082, -2.791832, 2.827766, 0.7215686, 0, 1, 1,
0.759707, -0.4409078, 1.932412, 0.7294118, 0, 1, 1,
0.7660066, -1.311103, 2.52045, 0.7333333, 0, 1, 1,
0.7714794, 0.1038278, 2.224401, 0.7411765, 0, 1, 1,
0.7731954, -0.7144336, 3.167521, 0.7450981, 0, 1, 1,
0.7740284, -0.8542163, 2.675408, 0.7529412, 0, 1, 1,
0.7820976, -0.1458491, 1.23364, 0.7568628, 0, 1, 1,
0.7962934, -0.03141078, 2.558122, 0.7647059, 0, 1, 1,
0.7986108, -0.01209594, 2.234666, 0.7686275, 0, 1, 1,
0.8049299, -0.9507721, 2.133407, 0.7764706, 0, 1, 1,
0.8132567, 1.095273, 1.224169, 0.7803922, 0, 1, 1,
0.8143166, 0.5918675, 1.897241, 0.7882353, 0, 1, 1,
0.8187919, -0.6097692, 3.471365, 0.7921569, 0, 1, 1,
0.8215581, -1.334958, 2.693094, 0.8, 0, 1, 1,
0.8221956, 1.18311, -0.4815004, 0.8078431, 0, 1, 1,
0.8239612, -0.3094675, 1.66923, 0.8117647, 0, 1, 1,
0.8265802, -1.157836, 2.651664, 0.8196079, 0, 1, 1,
0.8366486, 0.5360433, 1.170398, 0.8235294, 0, 1, 1,
0.8444909, 0.1352238, 3.293795, 0.8313726, 0, 1, 1,
0.8457179, 0.9190105, -0.3574539, 0.8352941, 0, 1, 1,
0.8463591, -0.3297048, 2.555444, 0.8431373, 0, 1, 1,
0.847249, 0.856889, 2.173545, 0.8470588, 0, 1, 1,
0.8480129, -0.04921249, 1.107281, 0.854902, 0, 1, 1,
0.8562556, 1.646974, -0.2278228, 0.8588235, 0, 1, 1,
0.8563842, 0.3152348, 1.69911, 0.8666667, 0, 1, 1,
0.8613486, 1.820729, -2.119023, 0.8705882, 0, 1, 1,
0.861469, -0.6613276, 1.609201, 0.8784314, 0, 1, 1,
0.874984, 1.518808, 1.576106, 0.8823529, 0, 1, 1,
0.875507, -1.227149, 1.41738, 0.8901961, 0, 1, 1,
0.8777908, -1.860026, 4.650382, 0.8941177, 0, 1, 1,
0.8802426, 0.5818263, 0.6115518, 0.9019608, 0, 1, 1,
0.8813707, 0.396117, 0.4431213, 0.9098039, 0, 1, 1,
0.8828049, -0.5494404, 1.81526, 0.9137255, 0, 1, 1,
0.8828321, 0.75972, 2.202771, 0.9215686, 0, 1, 1,
0.8903103, 1.365106, 1.627285, 0.9254902, 0, 1, 1,
0.8919595, 1.158139, 0.3978833, 0.9333333, 0, 1, 1,
0.8937756, 0.2280397, 2.33559, 0.9372549, 0, 1, 1,
0.8989309, 0.3735166, 0.8404199, 0.945098, 0, 1, 1,
0.9022744, -0.02615231, 2.903814, 0.9490196, 0, 1, 1,
0.9024976, -2.139757, 4.228637, 0.9568627, 0, 1, 1,
0.910709, -1.208818, 3.370584, 0.9607843, 0, 1, 1,
0.9140214, -0.780736, 2.959686, 0.9686275, 0, 1, 1,
0.9336631, -1.817106, 3.292042, 0.972549, 0, 1, 1,
0.9356471, -0.02712037, 2.574656, 0.9803922, 0, 1, 1,
0.9437216, 0.4231857, 0.9562393, 0.9843137, 0, 1, 1,
0.9533072, 1.625633, 1.515822, 0.9921569, 0, 1, 1,
0.9578367, 0.1674573, 1.298332, 0.9960784, 0, 1, 1,
0.958803, 0.1801266, 0.8509637, 1, 0, 0.9960784, 1,
0.9635575, -0.5767222, 2.403641, 1, 0, 0.9882353, 1,
0.9667358, 0.005059391, 1.675316, 1, 0, 0.9843137, 1,
0.9735739, 2.061693, -1.735553, 1, 0, 0.9764706, 1,
0.9737799, 0.7182907, 1.597067, 1, 0, 0.972549, 1,
0.9771771, -1.187206, 2.7988, 1, 0, 0.9647059, 1,
0.9839821, 0.2248982, 2.464025, 1, 0, 0.9607843, 1,
0.9856362, -0.187928, 2.645907, 1, 0, 0.9529412, 1,
0.9877624, 1.399106, -0.1866251, 1, 0, 0.9490196, 1,
0.9945763, -2.373957, 3.472037, 1, 0, 0.9411765, 1,
1.000089, -1.053468, 2.479708, 1, 0, 0.9372549, 1,
1.004611, 0.9270281, 0.4487186, 1, 0, 0.9294118, 1,
1.004671, -1.299263, 3.071412, 1, 0, 0.9254902, 1,
1.00772, -0.07587039, 0.3545575, 1, 0, 0.9176471, 1,
1.013931, -0.6130971, 1.767346, 1, 0, 0.9137255, 1,
1.015397, 0.3013707, -0.2448592, 1, 0, 0.9058824, 1,
1.029344, 0.5491895, 0.03728823, 1, 0, 0.9019608, 1,
1.029509, -0.4072139, 1.694005, 1, 0, 0.8941177, 1,
1.030134, -1.428522, 4.134604, 1, 0, 0.8862745, 1,
1.030862, -0.4535716, 3.261655, 1, 0, 0.8823529, 1,
1.033563, -0.1491513, 1.875357, 1, 0, 0.8745098, 1,
1.037127, 0.7228416, 0.985002, 1, 0, 0.8705882, 1,
1.045824, -1.692169, 3.309539, 1, 0, 0.8627451, 1,
1.053118, 1.036009, 0.0184918, 1, 0, 0.8588235, 1,
1.054971, 1.345182, -1.255785, 1, 0, 0.8509804, 1,
1.061801, 0.4048936, 1.753338, 1, 0, 0.8470588, 1,
1.065837, -0.9750222, 1.797911, 1, 0, 0.8392157, 1,
1.069641, -1.516631, 2.139104, 1, 0, 0.8352941, 1,
1.070295, -2.031211, 3.599947, 1, 0, 0.827451, 1,
1.073514, -0.6214158, 1.239652, 1, 0, 0.8235294, 1,
1.080479, 0.04056677, 2.264209, 1, 0, 0.8156863, 1,
1.087716, -1.804745, 3.601756, 1, 0, 0.8117647, 1,
1.10203, -0.6866906, 0.6134716, 1, 0, 0.8039216, 1,
1.106978, -1.17121, -0.1441877, 1, 0, 0.7960784, 1,
1.107298, 0.2713449, 2.589504, 1, 0, 0.7921569, 1,
1.108763, -0.1093875, 1.512465, 1, 0, 0.7843137, 1,
1.126266, -0.5860103, 2.385825, 1, 0, 0.7803922, 1,
1.126273, -0.4942196, 1.918047, 1, 0, 0.772549, 1,
1.134017, -1.212676, 4.514716, 1, 0, 0.7686275, 1,
1.134481, 1.260673, 1.526984, 1, 0, 0.7607843, 1,
1.13783, -0.9881067, 2.219877, 1, 0, 0.7568628, 1,
1.138808, -1.680578, 3.281074, 1, 0, 0.7490196, 1,
1.140237, 0.08659098, 1.324527, 1, 0, 0.7450981, 1,
1.146196, -0.9767182, 0.9040611, 1, 0, 0.7372549, 1,
1.151523, -1.287265, 1.032324, 1, 0, 0.7333333, 1,
1.15404, -1.120353, 2.157371, 1, 0, 0.7254902, 1,
1.160378, -1.382598, 2.097452, 1, 0, 0.7215686, 1,
1.161411, 0.09440149, 1.030543, 1, 0, 0.7137255, 1,
1.16568, 1.332486, 0.1887061, 1, 0, 0.7098039, 1,
1.16918, 1.352098, -0.1988963, 1, 0, 0.7019608, 1,
1.179002, -0.8279494, 0.7366905, 1, 0, 0.6941177, 1,
1.187493, 1.136378, 2.201206, 1, 0, 0.6901961, 1,
1.190538, -0.08867311, 1.962883, 1, 0, 0.682353, 1,
1.194145, -1.345635, 3.185233, 1, 0, 0.6784314, 1,
1.196838, 0.426849, 1.258626, 1, 0, 0.6705883, 1,
1.205746, 0.5121416, 1.306205, 1, 0, 0.6666667, 1,
1.205846, -1.176511, 0.2482144, 1, 0, 0.6588235, 1,
1.207883, 0.984037, 0.666996, 1, 0, 0.654902, 1,
1.211892, 1.231012, -0.4798008, 1, 0, 0.6470588, 1,
1.2212, 0.008253191, 1.8268, 1, 0, 0.6431373, 1,
1.22126, 0.2800932, 0.4338973, 1, 0, 0.6352941, 1,
1.224191, -0.7322378, 2.877846, 1, 0, 0.6313726, 1,
1.226311, -1.255203, 0.2812725, 1, 0, 0.6235294, 1,
1.233386, 1.539032, -0.1959664, 1, 0, 0.6196079, 1,
1.244303, 1.207184, 0.902787, 1, 0, 0.6117647, 1,
1.253107, -0.1320166, 1.588415, 1, 0, 0.6078432, 1,
1.257261, -0.5790072, 0.4542757, 1, 0, 0.6, 1,
1.268061, 0.04169149, 2.467232, 1, 0, 0.5921569, 1,
1.271963, 0.1574324, 1.141109, 1, 0, 0.5882353, 1,
1.286725, -0.6286162, 2.954806, 1, 0, 0.5803922, 1,
1.289945, 0.7643853, 1.474743, 1, 0, 0.5764706, 1,
1.29281, -0.001730216, 1.361767, 1, 0, 0.5686275, 1,
1.294605, 1.283821, 0.8430273, 1, 0, 0.5647059, 1,
1.296643, 1.733006, 1.135487, 1, 0, 0.5568628, 1,
1.297666, -1.635829, 1.186585, 1, 0, 0.5529412, 1,
1.299634, -0.3629327, -0.5173314, 1, 0, 0.5450981, 1,
1.301805, 0.1859761, 2.844326, 1, 0, 0.5411765, 1,
1.302885, -0.4184552, 3.088652, 1, 0, 0.5333334, 1,
1.311074, 1.661368, 1.005784, 1, 0, 0.5294118, 1,
1.322948, 0.5102326, 2.062082, 1, 0, 0.5215687, 1,
1.335206, -0.6410685, 1.894579, 1, 0, 0.5176471, 1,
1.338966, -1.689025, 2.136858, 1, 0, 0.509804, 1,
1.339251, 0.1385758, 1.083632, 1, 0, 0.5058824, 1,
1.34202, -0.5748177, 1.952436, 1, 0, 0.4980392, 1,
1.342952, -0.05009483, 0.5320332, 1, 0, 0.4901961, 1,
1.345924, -0.6771631, 1.736897, 1, 0, 0.4862745, 1,
1.356381, -0.408909, 2.043439, 1, 0, 0.4784314, 1,
1.360772, 0.05196179, 2.620004, 1, 0, 0.4745098, 1,
1.363972, -0.4859754, 3.217704, 1, 0, 0.4666667, 1,
1.3647, 1.126106, 1.627207, 1, 0, 0.4627451, 1,
1.371737, -1.112336, 0.8052555, 1, 0, 0.454902, 1,
1.377368, 1.683207, 1.70416, 1, 0, 0.4509804, 1,
1.39944, 0.1501606, 1.600898, 1, 0, 0.4431373, 1,
1.408997, -0.09897543, 1.109599, 1, 0, 0.4392157, 1,
1.411843, 0.2838929, 0.6539363, 1, 0, 0.4313726, 1,
1.421863, -1.278282, 1.217523, 1, 0, 0.427451, 1,
1.435392, -0.3085786, 0.8225427, 1, 0, 0.4196078, 1,
1.450948, -0.4597388, 1.231743, 1, 0, 0.4156863, 1,
1.474534, -1.221068, 1.842486, 1, 0, 0.4078431, 1,
1.476341, 0.05221872, 3.089032, 1, 0, 0.4039216, 1,
1.484373, -0.339305, 2.776093, 1, 0, 0.3960784, 1,
1.488936, -0.8976076, 1.627444, 1, 0, 0.3882353, 1,
1.493524, -0.1486, 0.7368534, 1, 0, 0.3843137, 1,
1.503117, -0.5731713, 0.7016188, 1, 0, 0.3764706, 1,
1.504695, 0.2017832, 0.2077996, 1, 0, 0.372549, 1,
1.518691, 1.326657, 1.935342, 1, 0, 0.3647059, 1,
1.53388, -0.4533091, 1.943788, 1, 0, 0.3607843, 1,
1.539031, -0.1729057, 0.8371181, 1, 0, 0.3529412, 1,
1.564027, -2.048191, 3.420259, 1, 0, 0.3490196, 1,
1.573983, 0.3896566, 1.825111, 1, 0, 0.3411765, 1,
1.581513, -0.8598467, 3.307626, 1, 0, 0.3372549, 1,
1.586354, 0.6063373, 0.5978205, 1, 0, 0.3294118, 1,
1.593003, -0.004380648, 1.435811, 1, 0, 0.3254902, 1,
1.603175, -1.49225, 3.698236, 1, 0, 0.3176471, 1,
1.615535, 0.5011616, 1.552056, 1, 0, 0.3137255, 1,
1.619093, 1.517227, 2.092212, 1, 0, 0.3058824, 1,
1.621919, 1.042073, -0.07220857, 1, 0, 0.2980392, 1,
1.635191, -1.615376, 3.465797, 1, 0, 0.2941177, 1,
1.655455, 0.09854911, 1.444819, 1, 0, 0.2862745, 1,
1.670584, 0.851519, 0.8866696, 1, 0, 0.282353, 1,
1.675605, 0.8196347, 0.3909049, 1, 0, 0.2745098, 1,
1.680549, -1.264802, 0.6517642, 1, 0, 0.2705882, 1,
1.692207, -2.217937, 0.8054284, 1, 0, 0.2627451, 1,
1.693627, -1.835054, 3.11042, 1, 0, 0.2588235, 1,
1.727972, 0.222604, 0.4973448, 1, 0, 0.2509804, 1,
1.737303, -0.09580323, 3.000479, 1, 0, 0.2470588, 1,
1.75211, 1.021873, 2.097577, 1, 0, 0.2392157, 1,
1.752727, -0.5417535, 2.733385, 1, 0, 0.2352941, 1,
1.796847, 1.06154, 0.8484789, 1, 0, 0.227451, 1,
1.797422, -0.09388735, 0.5193876, 1, 0, 0.2235294, 1,
1.802559, 1.934623, -1.335084, 1, 0, 0.2156863, 1,
1.803224, -0.5828046, 2.781068, 1, 0, 0.2117647, 1,
1.80818, 2.77674, 2.557397, 1, 0, 0.2039216, 1,
1.819008, -1.218668, 2.935399, 1, 0, 0.1960784, 1,
1.837583, -0.0366581, 0.9092195, 1, 0, 0.1921569, 1,
1.83795, 1.263677, 1.680234, 1, 0, 0.1843137, 1,
1.842448, 1.364983, 1.191002, 1, 0, 0.1803922, 1,
1.861215, 0.2445457, 1.796918, 1, 0, 0.172549, 1,
1.869126, -0.7007457, 0.322835, 1, 0, 0.1686275, 1,
1.882595, 0.3567624, 1.775758, 1, 0, 0.1607843, 1,
1.893736, 0.2316442, 0.5819809, 1, 0, 0.1568628, 1,
1.900776, -0.1488596, 3.44336, 1, 0, 0.1490196, 1,
1.919256, -0.716833, 1.027728, 1, 0, 0.145098, 1,
1.939944, -1.300218, 2.502089, 1, 0, 0.1372549, 1,
1.96465, 1.390729, 0.9413301, 1, 0, 0.1333333, 1,
1.981826, -1.066829, 1.110473, 1, 0, 0.1254902, 1,
2.024699, -1.143714, 2.135581, 1, 0, 0.1215686, 1,
2.032891, 1.425982, 1.130507, 1, 0, 0.1137255, 1,
2.097242, 0.09129204, 1.040442, 1, 0, 0.1098039, 1,
2.11226, -0.6225594, 3.451858, 1, 0, 0.1019608, 1,
2.138992, -2.694468, 4.154439, 1, 0, 0.09411765, 1,
2.203916, -1.204091, 3.443913, 1, 0, 0.09019608, 1,
2.220005, 0.9499439, 1.764712, 1, 0, 0.08235294, 1,
2.220122, -1.156196, -0.266971, 1, 0, 0.07843138, 1,
2.232731, 1.036927, 1.476516, 1, 0, 0.07058824, 1,
2.259862, 0.09650782, 2.599684, 1, 0, 0.06666667, 1,
2.328398, -1.486674, 2.321593, 1, 0, 0.05882353, 1,
2.345333, -1.725883, 0.1826192, 1, 0, 0.05490196, 1,
2.423973, 0.9819568, -0.8807924, 1, 0, 0.04705882, 1,
2.464436, -1.317649, 2.371223, 1, 0, 0.04313726, 1,
2.575048, -0.3247363, 2.23838, 1, 0, 0.03529412, 1,
2.67282, -0.2168062, -0.04260588, 1, 0, 0.03137255, 1,
2.72802, -0.02764791, 0.9377722, 1, 0, 0.02352941, 1,
2.743275, 0.7521623, 1.154147, 1, 0, 0.01960784, 1,
2.973456, 0.9905422, 1.36559, 1, 0, 0.01176471, 1,
3.11337, -1.329207, 2.106302, 1, 0, 0.007843138, 1
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
-0.05969536, -4.20897, -7.543902, 0, -0.5, 0.5, 0.5,
-0.05969536, -4.20897, -7.543902, 1, -0.5, 0.5, 0.5,
-0.05969536, -4.20897, -7.543902, 1, 1.5, 0.5, 0.5,
-0.05969536, -4.20897, -7.543902, 0, 1.5, 0.5, 0.5
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
-4.30843, 0.2758468, -7.543902, 0, -0.5, 0.5, 0.5,
-4.30843, 0.2758468, -7.543902, 1, -0.5, 0.5, 0.5,
-4.30843, 0.2758468, -7.543902, 1, 1.5, 0.5, 0.5,
-4.30843, 0.2758468, -7.543902, 0, 1.5, 0.5, 0.5
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
-4.30843, -4.20897, 0.1372998, 0, -0.5, 0.5, 0.5,
-4.30843, -4.20897, 0.1372998, 1, -0.5, 0.5, 0.5,
-4.30843, -4.20897, 0.1372998, 1, 1.5, 0.5, 0.5,
-4.30843, -4.20897, 0.1372998, 0, 1.5, 0.5, 0.5
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
-3, -3.174012, -5.771317,
3, -3.174012, -5.771317,
-3, -3.174012, -5.771317,
-3, -3.346505, -6.066748,
-2, -3.174012, -5.771317,
-2, -3.346505, -6.066748,
-1, -3.174012, -5.771317,
-1, -3.346505, -6.066748,
0, -3.174012, -5.771317,
0, -3.346505, -6.066748,
1, -3.174012, -5.771317,
1, -3.346505, -6.066748,
2, -3.174012, -5.771317,
2, -3.346505, -6.066748,
3, -3.174012, -5.771317,
3, -3.346505, -6.066748
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
-3, -3.691491, -6.657609, 0, -0.5, 0.5, 0.5,
-3, -3.691491, -6.657609, 1, -0.5, 0.5, 0.5,
-3, -3.691491, -6.657609, 1, 1.5, 0.5, 0.5,
-3, -3.691491, -6.657609, 0, 1.5, 0.5, 0.5,
-2, -3.691491, -6.657609, 0, -0.5, 0.5, 0.5,
-2, -3.691491, -6.657609, 1, -0.5, 0.5, 0.5,
-2, -3.691491, -6.657609, 1, 1.5, 0.5, 0.5,
-2, -3.691491, -6.657609, 0, 1.5, 0.5, 0.5,
-1, -3.691491, -6.657609, 0, -0.5, 0.5, 0.5,
-1, -3.691491, -6.657609, 1, -0.5, 0.5, 0.5,
-1, -3.691491, -6.657609, 1, 1.5, 0.5, 0.5,
-1, -3.691491, -6.657609, 0, 1.5, 0.5, 0.5,
0, -3.691491, -6.657609, 0, -0.5, 0.5, 0.5,
0, -3.691491, -6.657609, 1, -0.5, 0.5, 0.5,
0, -3.691491, -6.657609, 1, 1.5, 0.5, 0.5,
0, -3.691491, -6.657609, 0, 1.5, 0.5, 0.5,
1, -3.691491, -6.657609, 0, -0.5, 0.5, 0.5,
1, -3.691491, -6.657609, 1, -0.5, 0.5, 0.5,
1, -3.691491, -6.657609, 1, 1.5, 0.5, 0.5,
1, -3.691491, -6.657609, 0, 1.5, 0.5, 0.5,
2, -3.691491, -6.657609, 0, -0.5, 0.5, 0.5,
2, -3.691491, -6.657609, 1, -0.5, 0.5, 0.5,
2, -3.691491, -6.657609, 1, 1.5, 0.5, 0.5,
2, -3.691491, -6.657609, 0, 1.5, 0.5, 0.5,
3, -3.691491, -6.657609, 0, -0.5, 0.5, 0.5,
3, -3.691491, -6.657609, 1, -0.5, 0.5, 0.5,
3, -3.691491, -6.657609, 1, 1.5, 0.5, 0.5,
3, -3.691491, -6.657609, 0, 1.5, 0.5, 0.5
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
-3.327952, -3, -5.771317,
-3.327952, 3, -5.771317,
-3.327952, -3, -5.771317,
-3.491365, -3, -6.066748,
-3.327952, -2, -5.771317,
-3.491365, -2, -6.066748,
-3.327952, -1, -5.771317,
-3.491365, -1, -6.066748,
-3.327952, 0, -5.771317,
-3.491365, 0, -6.066748,
-3.327952, 1, -5.771317,
-3.491365, 1, -6.066748,
-3.327952, 2, -5.771317,
-3.491365, 2, -6.066748,
-3.327952, 3, -5.771317,
-3.491365, 3, -6.066748
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
-3.818191, -3, -6.657609, 0, -0.5, 0.5, 0.5,
-3.818191, -3, -6.657609, 1, -0.5, 0.5, 0.5,
-3.818191, -3, -6.657609, 1, 1.5, 0.5, 0.5,
-3.818191, -3, -6.657609, 0, 1.5, 0.5, 0.5,
-3.818191, -2, -6.657609, 0, -0.5, 0.5, 0.5,
-3.818191, -2, -6.657609, 1, -0.5, 0.5, 0.5,
-3.818191, -2, -6.657609, 1, 1.5, 0.5, 0.5,
-3.818191, -2, -6.657609, 0, 1.5, 0.5, 0.5,
-3.818191, -1, -6.657609, 0, -0.5, 0.5, 0.5,
-3.818191, -1, -6.657609, 1, -0.5, 0.5, 0.5,
-3.818191, -1, -6.657609, 1, 1.5, 0.5, 0.5,
-3.818191, -1, -6.657609, 0, 1.5, 0.5, 0.5,
-3.818191, 0, -6.657609, 0, -0.5, 0.5, 0.5,
-3.818191, 0, -6.657609, 1, -0.5, 0.5, 0.5,
-3.818191, 0, -6.657609, 1, 1.5, 0.5, 0.5,
-3.818191, 0, -6.657609, 0, 1.5, 0.5, 0.5,
-3.818191, 1, -6.657609, 0, -0.5, 0.5, 0.5,
-3.818191, 1, -6.657609, 1, -0.5, 0.5, 0.5,
-3.818191, 1, -6.657609, 1, 1.5, 0.5, 0.5,
-3.818191, 1, -6.657609, 0, 1.5, 0.5, 0.5,
-3.818191, 2, -6.657609, 0, -0.5, 0.5, 0.5,
-3.818191, 2, -6.657609, 1, -0.5, 0.5, 0.5,
-3.818191, 2, -6.657609, 1, 1.5, 0.5, 0.5,
-3.818191, 2, -6.657609, 0, 1.5, 0.5, 0.5,
-3.818191, 3, -6.657609, 0, -0.5, 0.5, 0.5,
-3.818191, 3, -6.657609, 1, -0.5, 0.5, 0.5,
-3.818191, 3, -6.657609, 1, 1.5, 0.5, 0.5,
-3.818191, 3, -6.657609, 0, 1.5, 0.5, 0.5
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
-3.327952, -3.174012, -4,
-3.327952, -3.174012, 4,
-3.327952, -3.174012, -4,
-3.491365, -3.346505, -4,
-3.327952, -3.174012, -2,
-3.491365, -3.346505, -2,
-3.327952, -3.174012, 0,
-3.491365, -3.346505, 0,
-3.327952, -3.174012, 2,
-3.491365, -3.346505, 2,
-3.327952, -3.174012, 4,
-3.491365, -3.346505, 4
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
-3.818191, -3.691491, -4, 0, -0.5, 0.5, 0.5,
-3.818191, -3.691491, -4, 1, -0.5, 0.5, 0.5,
-3.818191, -3.691491, -4, 1, 1.5, 0.5, 0.5,
-3.818191, -3.691491, -4, 0, 1.5, 0.5, 0.5,
-3.818191, -3.691491, -2, 0, -0.5, 0.5, 0.5,
-3.818191, -3.691491, -2, 1, -0.5, 0.5, 0.5,
-3.818191, -3.691491, -2, 1, 1.5, 0.5, 0.5,
-3.818191, -3.691491, -2, 0, 1.5, 0.5, 0.5,
-3.818191, -3.691491, 0, 0, -0.5, 0.5, 0.5,
-3.818191, -3.691491, 0, 1, -0.5, 0.5, 0.5,
-3.818191, -3.691491, 0, 1, 1.5, 0.5, 0.5,
-3.818191, -3.691491, 0, 0, 1.5, 0.5, 0.5,
-3.818191, -3.691491, 2, 0, -0.5, 0.5, 0.5,
-3.818191, -3.691491, 2, 1, -0.5, 0.5, 0.5,
-3.818191, -3.691491, 2, 1, 1.5, 0.5, 0.5,
-3.818191, -3.691491, 2, 0, 1.5, 0.5, 0.5,
-3.818191, -3.691491, 4, 0, -0.5, 0.5, 0.5,
-3.818191, -3.691491, 4, 1, -0.5, 0.5, 0.5,
-3.818191, -3.691491, 4, 1, 1.5, 0.5, 0.5,
-3.818191, -3.691491, 4, 0, 1.5, 0.5, 0.5
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
-3.327952, -3.174012, -5.771317,
-3.327952, 3.725706, -5.771317,
-3.327952, -3.174012, 6.045917,
-3.327952, 3.725706, 6.045917,
-3.327952, -3.174012, -5.771317,
-3.327952, -3.174012, 6.045917,
-3.327952, 3.725706, -5.771317,
-3.327952, 3.725706, 6.045917,
-3.327952, -3.174012, -5.771317,
3.208562, -3.174012, -5.771317,
-3.327952, -3.174012, 6.045917,
3.208562, -3.174012, 6.045917,
-3.327952, 3.725706, -5.771317,
3.208562, 3.725706, -5.771317,
-3.327952, 3.725706, 6.045917,
3.208562, 3.725706, 6.045917,
3.208562, -3.174012, -5.771317,
3.208562, 3.725706, -5.771317,
3.208562, -3.174012, 6.045917,
3.208562, 3.725706, 6.045917,
3.208562, -3.174012, -5.771317,
3.208562, -3.174012, 6.045917,
3.208562, 3.725706, -5.771317,
3.208562, 3.725706, 6.045917
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
var radius = 8.097849;
var distance = 36.02824;
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
mvMatrix.translate( 0.05969536, -0.2758468, -0.1372998 );
mvMatrix.scale( 1.339483, 1.268973, 0.7409139 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.02824);
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
thalidomide<-read.table("thalidomide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-thalidomide$V2
```

```
## Error in eval(expr, envir, enclos): object 'thalidomide' not found
```

```r
y<-thalidomide$V3
```

```
## Error in eval(expr, envir, enclos): object 'thalidomide' not found
```

```r
z<-thalidomide$V4
```

```
## Error in eval(expr, envir, enclos): object 'thalidomide' not found
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
-3.23276, -0.8254845, -1.898739, 0, 0, 1, 1, 1,
-3.019543, -0.6436763, -1.564942, 1, 0, 0, 1, 1,
-3.018153, -0.541298, -0.6131197, 1, 0, 0, 1, 1,
-2.938025, -0.7682954, -1.704303, 1, 0, 0, 1, 1,
-2.829868, -0.7856381, -0.9638234, 1, 0, 0, 1, 1,
-2.694797, 0.8007492, 0.06225317, 1, 0, 0, 1, 1,
-2.618683, -1.143061, -2.343559, 0, 0, 0, 1, 1,
-2.530916, -0.9048828, -1.999377, 0, 0, 0, 1, 1,
-2.500421, -0.7103753, -3.278218, 0, 0, 0, 1, 1,
-2.357994, 0.6675721, -0.7810711, 0, 0, 0, 1, 1,
-2.35402, 2.282379, -1.520744, 0, 0, 0, 1, 1,
-2.349995, -2.100386, -0.8132429, 0, 0, 0, 1, 1,
-2.278339, 0.8889052, 1.056029, 0, 0, 0, 1, 1,
-2.261252, -0.9766915, -2.809544, 1, 1, 1, 1, 1,
-2.173645, -1.373631, -2.847972, 1, 1, 1, 1, 1,
-2.16653, -1.089327, -4.050113, 1, 1, 1, 1, 1,
-2.135135, 0.2765799, -1.161154, 1, 1, 1, 1, 1,
-2.093288, 1.46681, -0.1222678, 1, 1, 1, 1, 1,
-2.08814, -0.01130895, -3.163016, 1, 1, 1, 1, 1,
-2.084799, 0.4155012, -0.9643421, 1, 1, 1, 1, 1,
-2.065314, -0.3356192, -3.077545, 1, 1, 1, 1, 1,
-2.038809, 0.3507112, -2.284467, 1, 1, 1, 1, 1,
-2.022471, -0.3193844, -1.356887, 1, 1, 1, 1, 1,
-2.018379, 1.147011, -1.402803, 1, 1, 1, 1, 1,
-1.988605, -1.979148, -3.824214, 1, 1, 1, 1, 1,
-1.97686, -0.947389, -2.531059, 1, 1, 1, 1, 1,
-1.976248, 0.2004505, -1.480793, 1, 1, 1, 1, 1,
-1.923989, -0.1405233, -1.732946, 1, 1, 1, 1, 1,
-1.91895, 2.228405, -0.3726428, 0, 0, 1, 1, 1,
-1.897515, -1.094993, -3.205915, 1, 0, 0, 1, 1,
-1.856359, -1.059699, -1.042349, 1, 0, 0, 1, 1,
-1.849728, -0.03809942, -2.835945, 1, 0, 0, 1, 1,
-1.819912, 0.3036835, -1.598646, 1, 0, 0, 1, 1,
-1.813788, -1.6879, -3.831371, 1, 0, 0, 1, 1,
-1.806615, 0.2013528, -1.623016, 0, 0, 0, 1, 1,
-1.778027, -0.5664289, -1.638217, 0, 0, 0, 1, 1,
-1.772459, -0.1353587, -1.195804, 0, 0, 0, 1, 1,
-1.771427, 2.360068, -0.4224777, 0, 0, 0, 1, 1,
-1.768763, -0.871603, -0.896976, 0, 0, 0, 1, 1,
-1.768646, 1.568717, -0.6266177, 0, 0, 0, 1, 1,
-1.760731, -0.2544363, -0.854726, 0, 0, 0, 1, 1,
-1.749311, 0.2174445, -2.539456, 1, 1, 1, 1, 1,
-1.720798, 0.2022321, -0.784338, 1, 1, 1, 1, 1,
-1.691301, -0.8000383, -0.05416712, 1, 1, 1, 1, 1,
-1.677323, 0.02827681, -1.780583, 1, 1, 1, 1, 1,
-1.676024, 1.698982, -1.291677, 1, 1, 1, 1, 1,
-1.675759, 0.2854235, 0.3475613, 1, 1, 1, 1, 1,
-1.67559, -0.3131419, -0.9221877, 1, 1, 1, 1, 1,
-1.671849, 0.01983369, -1.332811, 1, 1, 1, 1, 1,
-1.658181, -0.3729824, -1.680954, 1, 1, 1, 1, 1,
-1.652226, 0.2175189, -3.138738, 1, 1, 1, 1, 1,
-1.647352, -0.7135015, -1.675999, 1, 1, 1, 1, 1,
-1.602798, 1.246623, 0.2207047, 1, 1, 1, 1, 1,
-1.593442, 1.095246, 0.3510814, 1, 1, 1, 1, 1,
-1.589799, -0.9511043, -3.47838, 1, 1, 1, 1, 1,
-1.588944, -0.4518713, -4.484858, 1, 1, 1, 1, 1,
-1.587936, 0.4115497, -0.4836909, 0, 0, 1, 1, 1,
-1.567803, 0.03498831, -1.432047, 1, 0, 0, 1, 1,
-1.558816, -1.080094, -2.411888, 1, 0, 0, 1, 1,
-1.552023, 1.193992, -1.232626, 1, 0, 0, 1, 1,
-1.548782, 1.619073, -0.5048906, 1, 0, 0, 1, 1,
-1.537167, 1.327187, -2.470302, 1, 0, 0, 1, 1,
-1.536811, 0.1110692, -2.829064, 0, 0, 0, 1, 1,
-1.530003, 0.6919952, -0.1732212, 0, 0, 0, 1, 1,
-1.525392, -0.03952835, -2.158594, 0, 0, 0, 1, 1,
-1.516498, 0.5157478, -1.810734, 0, 0, 0, 1, 1,
-1.514634, -0.229183, -1.532431, 0, 0, 0, 1, 1,
-1.512098, 0.8484589, -0.7738554, 0, 0, 0, 1, 1,
-1.507848, -0.558076, -1.828056, 0, 0, 0, 1, 1,
-1.4897, -0.4494081, -1.8311, 1, 1, 1, 1, 1,
-1.489578, -0.1371395, 0.3131421, 1, 1, 1, 1, 1,
-1.487513, -0.4271438, -1.128392, 1, 1, 1, 1, 1,
-1.470982, 2.865272, -0.2174199, 1, 1, 1, 1, 1,
-1.467127, -1.621501, -2.291292, 1, 1, 1, 1, 1,
-1.462526, -0.6402024, -2.353312, 1, 1, 1, 1, 1,
-1.460734, 0.6677774, -1.743023, 1, 1, 1, 1, 1,
-1.46066, 0.513621, -2.645997, 1, 1, 1, 1, 1,
-1.459772, -1.723367, -1.501436, 1, 1, 1, 1, 1,
-1.459436, 0.4562882, -0.3110787, 1, 1, 1, 1, 1,
-1.45358, 0.8317923, -0.6275768, 1, 1, 1, 1, 1,
-1.445639, -1.254053, -3.074188, 1, 1, 1, 1, 1,
-1.444013, 0.6308588, -1.713599, 1, 1, 1, 1, 1,
-1.443645, -0.6266396, -1.077889, 1, 1, 1, 1, 1,
-1.442969, 0.7125531, -0.324765, 1, 1, 1, 1, 1,
-1.421207, -0.8179473, -2.589865, 0, 0, 1, 1, 1,
-1.407981, -0.4642344, -2.028483, 1, 0, 0, 1, 1,
-1.407805, 0.03722329, -2.522295, 1, 0, 0, 1, 1,
-1.403407, -0.2267122, -0.8211427, 1, 0, 0, 1, 1,
-1.400365, 0.7027751, -1.820813, 1, 0, 0, 1, 1,
-1.399909, -1.438063, -3.318277, 1, 0, 0, 1, 1,
-1.398899, 0.625599, -0.1272754, 0, 0, 0, 1, 1,
-1.38835, 0.5638099, -0.6050674, 0, 0, 0, 1, 1,
-1.384993, 1.314479, -1.37926, 0, 0, 0, 1, 1,
-1.38333, -0.6960467, -0.5385215, 0, 0, 0, 1, 1,
-1.377429, 1.63361, -0.1096824, 0, 0, 0, 1, 1,
-1.376577, 0.1042606, -2.646744, 0, 0, 0, 1, 1,
-1.374845, -0.609493, -0.9384117, 0, 0, 0, 1, 1,
-1.374442, 0.8916655, -1.610483, 1, 1, 1, 1, 1,
-1.36674, -2.452869, -4.144828, 1, 1, 1, 1, 1,
-1.36672, 2.840865, -0.1243456, 1, 1, 1, 1, 1,
-1.360816, 1.446189, -1.233702, 1, 1, 1, 1, 1,
-1.358327, -1.213764, -1.583756, 1, 1, 1, 1, 1,
-1.339089, 1.220389, -0.8571211, 1, 1, 1, 1, 1,
-1.334808, 0.7248195, -0.8939799, 1, 1, 1, 1, 1,
-1.331064, 0.4553438, -1.593624, 1, 1, 1, 1, 1,
-1.32736, -0.2879786, -4.003569, 1, 1, 1, 1, 1,
-1.32236, -0.3778987, -1.086729, 1, 1, 1, 1, 1,
-1.320754, 0.09545669, -0.9157194, 1, 1, 1, 1, 1,
-1.31127, 0.8682097, 0.1578581, 1, 1, 1, 1, 1,
-1.295258, 1.246184, -0.1235122, 1, 1, 1, 1, 1,
-1.293789, -0.06838087, -2.211425, 1, 1, 1, 1, 1,
-1.293609, -0.3158253, -2.426406, 1, 1, 1, 1, 1,
-1.291191, 0.7363893, -0.2708116, 0, 0, 1, 1, 1,
-1.289961, 0.5663361, -0.1133815, 1, 0, 0, 1, 1,
-1.28961, -0.1199187, -2.551394, 1, 0, 0, 1, 1,
-1.289124, -0.8059047, -1.500419, 1, 0, 0, 1, 1,
-1.274764, 0.6317901, -1.296872, 1, 0, 0, 1, 1,
-1.272604, -1.240439, -2.621058, 1, 0, 0, 1, 1,
-1.265443, 0.4799986, 0.6061792, 0, 0, 0, 1, 1,
-1.2547, -0.107415, -2.506452, 0, 0, 0, 1, 1,
-1.249015, 0.5604363, -1.31316, 0, 0, 0, 1, 1,
-1.24557, -0.3524689, -2.154802, 0, 0, 0, 1, 1,
-1.243928, -1.211304, -2.913692, 0, 0, 0, 1, 1,
-1.228799, 0.8303877, -2.174492, 0, 0, 0, 1, 1,
-1.215686, -1.63648, -0.8059329, 0, 0, 0, 1, 1,
-1.204807, -0.04453832, -0.2304009, 1, 1, 1, 1, 1,
-1.201351, -0.8156396, -2.963732, 1, 1, 1, 1, 1,
-1.193048, -0.4859312, -2.173997, 1, 1, 1, 1, 1,
-1.192764, 0.8737715, -0.711815, 1, 1, 1, 1, 1,
-1.191946, 0.5725525, -0.9832354, 1, 1, 1, 1, 1,
-1.189888, -0.3895155, -1.352645, 1, 1, 1, 1, 1,
-1.187221, 0.6581448, 0.1603573, 1, 1, 1, 1, 1,
-1.180744, -1.348439, -2.145417, 1, 1, 1, 1, 1,
-1.173386, 1.717657, -0.5724493, 1, 1, 1, 1, 1,
-1.171033, -0.8652725, -1.668353, 1, 1, 1, 1, 1,
-1.169075, -1.380286, -2.035416, 1, 1, 1, 1, 1,
-1.166024, -0.4054302, -2.251008, 1, 1, 1, 1, 1,
-1.148952, -1.077714, -2.633321, 1, 1, 1, 1, 1,
-1.146861, 0.1177944, -0.1327042, 1, 1, 1, 1, 1,
-1.137473, 1.552914, 0.305268, 1, 1, 1, 1, 1,
-1.131213, -1.166665, -1.692466, 0, 0, 1, 1, 1,
-1.130209, 1.176848, -1.093257, 1, 0, 0, 1, 1,
-1.129945, -0.5334346, -2.218682, 1, 0, 0, 1, 1,
-1.123008, 0.2572766, -0.5917478, 1, 0, 0, 1, 1,
-1.122363, -0.4793765, -2.140854, 1, 0, 0, 1, 1,
-1.117859, -0.04353108, -1.536081, 1, 0, 0, 1, 1,
-1.113151, -1.886321, -3.827025, 0, 0, 0, 1, 1,
-1.113035, 0.3516532, -1.271357, 0, 0, 0, 1, 1,
-1.113022, -0.4530984, -1.066842, 0, 0, 0, 1, 1,
-1.111741, -0.1436348, 0.01617221, 0, 0, 0, 1, 1,
-1.111364, -0.8803656, -2.103976, 0, 0, 0, 1, 1,
-1.104185, 1.467269, -0.3676515, 0, 0, 0, 1, 1,
-1.103153, 0.6807644, 1.283239, 0, 0, 0, 1, 1,
-1.101232, -0.8904554, -2.179944, 1, 1, 1, 1, 1,
-1.10079, 0.4296726, -2.101828, 1, 1, 1, 1, 1,
-1.09588, 0.6525827, 0.005007854, 1, 1, 1, 1, 1,
-1.094773, -1.22318, -3.490775, 1, 1, 1, 1, 1,
-1.090709, -1.39301, -2.229959, 1, 1, 1, 1, 1,
-1.090604, 0.1900896, -2.2656, 1, 1, 1, 1, 1,
-1.089275, -0.7123089, -0.8536838, 1, 1, 1, 1, 1,
-1.083044, -0.7454761, -3.031353, 1, 1, 1, 1, 1,
-1.07932, -0.1219688, -2.194203, 1, 1, 1, 1, 1,
-1.075788, 0.1518821, -0.7270947, 1, 1, 1, 1, 1,
-1.072148, 2.254602, 0.6043727, 1, 1, 1, 1, 1,
-1.070001, 1.780047, -0.5946103, 1, 1, 1, 1, 1,
-1.069978, 0.3132968, -0.3892319, 1, 1, 1, 1, 1,
-1.068805, 1.266827, -1.328165, 1, 1, 1, 1, 1,
-1.056101, -1.399204, -1.30372, 1, 1, 1, 1, 1,
-1.03652, 0.3056148, -0.8902644, 0, 0, 1, 1, 1,
-1.035831, 1.883813, -0.9897273, 1, 0, 0, 1, 1,
-1.0345, -1.568147, -2.904057, 1, 0, 0, 1, 1,
-1.030735, 0.3666491, -1.515706, 1, 0, 0, 1, 1,
-1.029712, -0.1627247, -4.095059, 1, 0, 0, 1, 1,
-1.027469, -1.141752, -2.431439, 1, 0, 0, 1, 1,
-1.026984, 0.03038603, -2.046534, 0, 0, 0, 1, 1,
-1.026325, 1.034412, -1.173776, 0, 0, 0, 1, 1,
-1.021406, -0.006685832, -1.376231, 0, 0, 0, 1, 1,
-1.010789, 0.4025934, -1.411206, 0, 0, 0, 1, 1,
-1.0069, 0.935032, 0.3208971, 0, 0, 0, 1, 1,
-1.003841, -1.345304, -4.051714, 0, 0, 0, 1, 1,
-1.002972, -3.073531, -2.40506, 0, 0, 0, 1, 1,
-0.998624, 0.3889994, -1.509219, 1, 1, 1, 1, 1,
-0.9932765, -0.05244364, -1.59557, 1, 1, 1, 1, 1,
-0.9889333, -0.3687509, -0.4823758, 1, 1, 1, 1, 1,
-0.9837773, 1.153175, -1.250405, 1, 1, 1, 1, 1,
-0.9829585, -1.130979, -2.635184, 1, 1, 1, 1, 1,
-0.9768596, -0.6619302, -2.532908, 1, 1, 1, 1, 1,
-0.9762573, -0.006257081, -2.663817, 1, 1, 1, 1, 1,
-0.9696842, -1.148877, -3.116092, 1, 1, 1, 1, 1,
-0.9678015, -1.50771, -2.748672, 1, 1, 1, 1, 1,
-0.966056, -1.201772, -1.395546, 1, 1, 1, 1, 1,
-0.9586393, 0.596462, -1.711762, 1, 1, 1, 1, 1,
-0.9443899, 0.9482895, -0.8202191, 1, 1, 1, 1, 1,
-0.9428408, 1.989806, 0.9234273, 1, 1, 1, 1, 1,
-0.9369948, 2.11449, -0.4768202, 1, 1, 1, 1, 1,
-0.9363233, -0.6364552, -2.436612, 1, 1, 1, 1, 1,
-0.9335765, 0.8285996, -3.359815, 0, 0, 1, 1, 1,
-0.9330921, -0.9923475, -2.583249, 1, 0, 0, 1, 1,
-0.9318568, -0.4906596, -2.017559, 1, 0, 0, 1, 1,
-0.9227461, -0.1939222, -1.390461, 1, 0, 0, 1, 1,
-0.9133012, 0.05916807, -0.7130287, 1, 0, 0, 1, 1,
-0.9127069, 0.3144613, 0.06430895, 1, 0, 0, 1, 1,
-0.906639, 1.135026, -0.5624411, 0, 0, 0, 1, 1,
-0.9017972, 0.3869696, -1.034535, 0, 0, 0, 1, 1,
-0.8988194, 0.9623919, -0.6574238, 0, 0, 0, 1, 1,
-0.8981813, 0.6519147, -0.2404351, 0, 0, 0, 1, 1,
-0.8951281, 2.061715, 0.1769531, 0, 0, 0, 1, 1,
-0.8847001, 1.139158, -0.7837017, 0, 0, 0, 1, 1,
-0.8809797, -0.8529702, -2.578785, 0, 0, 0, 1, 1,
-0.8761542, 0.8203611, -0.4558352, 1, 1, 1, 1, 1,
-0.8707041, -0.8278075, -1.306263, 1, 1, 1, 1, 1,
-0.870331, -1.638414, -2.714605, 1, 1, 1, 1, 1,
-0.8685034, -1.714561, -0.8585559, 1, 1, 1, 1, 1,
-0.8666512, -0.5810041, -3.098905, 1, 1, 1, 1, 1,
-0.8603832, 0.01892585, -3.568367, 1, 1, 1, 1, 1,
-0.8587508, -1.061413, -3.175661, 1, 1, 1, 1, 1,
-0.8484423, 0.545464, -1.565873, 1, 1, 1, 1, 1,
-0.8458688, -0.9532613, -2.069219, 1, 1, 1, 1, 1,
-0.8394111, -0.06994116, -1.049054, 1, 1, 1, 1, 1,
-0.8381182, 0.5457695, -0.8119892, 1, 1, 1, 1, 1,
-0.8359714, -0.7324989, -2.354122, 1, 1, 1, 1, 1,
-0.8321447, -0.9258531, -1.861631, 1, 1, 1, 1, 1,
-0.8316134, 1.036486, -0.8923306, 1, 1, 1, 1, 1,
-0.83119, -0.6597393, -2.327813, 1, 1, 1, 1, 1,
-0.8291358, -0.2346109, -1.687448, 0, 0, 1, 1, 1,
-0.8261834, 1.400389, -0.8207095, 1, 0, 0, 1, 1,
-0.8234074, -0.0412643, -1.6026, 1, 0, 0, 1, 1,
-0.81249, 0.1661588, -2.11082, 1, 0, 0, 1, 1,
-0.8062929, 0.8763021, 0.1595444, 1, 0, 0, 1, 1,
-0.8023655, -0.2649185, -2.390047, 1, 0, 0, 1, 1,
-0.7998816, -0.06832214, -1.776766, 0, 0, 0, 1, 1,
-0.7993839, 0.3158709, -0.2330918, 0, 0, 0, 1, 1,
-0.798218, 0.8757132, -1.714079, 0, 0, 0, 1, 1,
-0.7953519, -1.195867, -3.318894, 0, 0, 0, 1, 1,
-0.7950944, 1.068456, -0.5063094, 0, 0, 0, 1, 1,
-0.792159, -0.1369972, -1.574277, 0, 0, 0, 1, 1,
-0.7896007, -0.3330431, -2.342869, 0, 0, 0, 1, 1,
-0.7889334, 0.4923661, -2.668267, 1, 1, 1, 1, 1,
-0.7838556, 1.302452, -0.6622443, 1, 1, 1, 1, 1,
-0.7797599, -0.4369968, -1.60354, 1, 1, 1, 1, 1,
-0.7787413, -0.05280749, -0.576827, 1, 1, 1, 1, 1,
-0.7722071, -0.1412371, -3.068608, 1, 1, 1, 1, 1,
-0.7636656, 0.04193276, -2.239681, 1, 1, 1, 1, 1,
-0.76157, -0.7098616, -5.043556, 1, 1, 1, 1, 1,
-0.7597553, 0.6598707, -0.06850878, 1, 1, 1, 1, 1,
-0.7568226, 1.365083, -0.6897451, 1, 1, 1, 1, 1,
-0.7341603, 0.0935591, -1.234724, 1, 1, 1, 1, 1,
-0.7337565, -0.2666681, -2.519181, 1, 1, 1, 1, 1,
-0.7322328, -0.57231, -2.271353, 1, 1, 1, 1, 1,
-0.7316187, 1.210211, -1.34835, 1, 1, 1, 1, 1,
-0.7295722, 0.3250348, -0.6012471, 1, 1, 1, 1, 1,
-0.7294659, 0.3477825, -0.7335069, 1, 1, 1, 1, 1,
-0.7285743, -0.5213051, -2.309195, 0, 0, 1, 1, 1,
-0.7205921, 1.33036, -1.482487, 1, 0, 0, 1, 1,
-0.7199833, -0.2592075, -2.243783, 1, 0, 0, 1, 1,
-0.7192084, 1.348627, -0.0005193785, 1, 0, 0, 1, 1,
-0.7162732, 1.074263, -2.266432, 1, 0, 0, 1, 1,
-0.710363, -1.220281, -3.435806, 1, 0, 0, 1, 1,
-0.7083929, -1.441894, -2.485538, 0, 0, 0, 1, 1,
-0.7031171, 0.8763216, -1.46772, 0, 0, 0, 1, 1,
-0.7013059, -0.1474074, -1.682888, 0, 0, 0, 1, 1,
-0.6969277, 0.2944739, -1.7813, 0, 0, 0, 1, 1,
-0.6950341, -0.6272355, -4.155953, 0, 0, 0, 1, 1,
-0.6946583, -0.01674869, -1.192051, 0, 0, 0, 1, 1,
-0.6918312, -1.057581, -0.3968246, 0, 0, 0, 1, 1,
-0.6914513, -1.60069, -3.805824, 1, 1, 1, 1, 1,
-0.6900964, 0.5569788, -0.7944999, 1, 1, 1, 1, 1,
-0.6890115, -0.0866535, -2.871568, 1, 1, 1, 1, 1,
-0.6873356, -0.6862179, -2.600238, 1, 1, 1, 1, 1,
-0.6832449, 0.7219742, -1.480159, 1, 1, 1, 1, 1,
-0.6814671, 1.085208, 1.440454, 1, 1, 1, 1, 1,
-0.6792223, 0.00320719, -1.550051, 1, 1, 1, 1, 1,
-0.6748871, -2.002586, -2.567948, 1, 1, 1, 1, 1,
-0.6744646, 0.5365546, -0.5613223, 1, 1, 1, 1, 1,
-0.6649163, -1.375832, -0.9807946, 1, 1, 1, 1, 1,
-0.6640064, -1.470453, -2.184505, 1, 1, 1, 1, 1,
-0.6631975, -0.7407446, -1.675658, 1, 1, 1, 1, 1,
-0.6629341, -1.365679, -3.634345, 1, 1, 1, 1, 1,
-0.6617543, 0.5029584, -0.08074829, 1, 1, 1, 1, 1,
-0.6595061, 0.1921979, 0.05356149, 1, 1, 1, 1, 1,
-0.6527351, -0.1533199, -2.185491, 0, 0, 1, 1, 1,
-0.6493079, -0.5641323, -3.53522, 1, 0, 0, 1, 1,
-0.6445312, -0.1558655, -2.312281, 1, 0, 0, 1, 1,
-0.6423535, -0.7021209, -2.702754, 1, 0, 0, 1, 1,
-0.6414877, -0.07949671, -1.645179, 1, 0, 0, 1, 1,
-0.6404957, 0.3354861, -2.105382, 1, 0, 0, 1, 1,
-0.6372218, 2.242629, 0.4393448, 0, 0, 0, 1, 1,
-0.636543, -0.3243656, -2.945297, 0, 0, 0, 1, 1,
-0.6361035, -1.041437, -3.333035, 0, 0, 0, 1, 1,
-0.63512, 0.06791911, -2.098365, 0, 0, 0, 1, 1,
-0.6334406, -0.6806834, -1.078225, 0, 0, 0, 1, 1,
-0.6315432, -1.991336, -2.56431, 0, 0, 0, 1, 1,
-0.6281831, 0.4166511, -0.7971837, 0, 0, 0, 1, 1,
-0.6247272, 0.5170901, 0.1264226, 1, 1, 1, 1, 1,
-0.6206831, 0.2010555, -1.031315, 1, 1, 1, 1, 1,
-0.6178132, 0.7287717, 1.6428, 1, 1, 1, 1, 1,
-0.6157518, -0.1135092, -3.188777, 1, 1, 1, 1, 1,
-0.61358, 1.195042, -0.3973562, 1, 1, 1, 1, 1,
-0.612606, -0.3098288, -0.9642835, 1, 1, 1, 1, 1,
-0.6082305, -0.4128991, -1.604502, 1, 1, 1, 1, 1,
-0.6078624, 0.2075472, -3.371645, 1, 1, 1, 1, 1,
-0.6023243, 1.08253, -1.122094, 1, 1, 1, 1, 1,
-0.601362, -1.488891, -1.679765, 1, 1, 1, 1, 1,
-0.6006619, -0.9710485, -3.783143, 1, 1, 1, 1, 1,
-0.5984063, 0.4228774, -0.3579277, 1, 1, 1, 1, 1,
-0.5929508, -0.3894408, -1.685032, 1, 1, 1, 1, 1,
-0.5925021, -1.634521, -1.493244, 1, 1, 1, 1, 1,
-0.5924913, 0.2088539, -1.612459, 1, 1, 1, 1, 1,
-0.5913261, 0.6393582, -1.391862, 0, 0, 1, 1, 1,
-0.5855466, -0.02072178, -0.531683, 1, 0, 0, 1, 1,
-0.5839497, -0.002349989, -2.344665, 1, 0, 0, 1, 1,
-0.5815758, -0.9856741, -4.941369, 1, 0, 0, 1, 1,
-0.5779181, -0.5303243, -1.665382, 1, 0, 0, 1, 1,
-0.5753445, 1.165725, -0.7648063, 1, 0, 0, 1, 1,
-0.5699965, -0.6563288, -2.039384, 0, 0, 0, 1, 1,
-0.5685984, 0.4031168, -0.679382, 0, 0, 0, 1, 1,
-0.5672717, 0.1115356, -2.265498, 0, 0, 0, 1, 1,
-0.5547333, 0.5560251, -0.2710403, 0, 0, 0, 1, 1,
-0.5533634, -0.8439518, -0.7081789, 0, 0, 0, 1, 1,
-0.5530359, -0.7392254, -1.589945, 0, 0, 0, 1, 1,
-0.5520275, 0.9209952, -0.05000254, 0, 0, 0, 1, 1,
-0.5511778, 1.322504, -1.800447, 1, 1, 1, 1, 1,
-0.5487384, -1.028963, -3.038551, 1, 1, 1, 1, 1,
-0.5419963, 1.380398, 1.121047, 1, 1, 1, 1, 1,
-0.541629, 0.8443409, -0.7411725, 1, 1, 1, 1, 1,
-0.5330859, -2.040256, -2.597737, 1, 1, 1, 1, 1,
-0.5310922, -1.5146, -2.382233, 1, 1, 1, 1, 1,
-0.5228645, -0.5716533, -2.565954, 1, 1, 1, 1, 1,
-0.5210556, 0.7093291, -0.4034652, 1, 1, 1, 1, 1,
-0.5187265, -0.523845, -3.085495, 1, 1, 1, 1, 1,
-0.5170771, 0.426803, -1.292326, 1, 1, 1, 1, 1,
-0.5105744, -0.5694083, -2.840878, 1, 1, 1, 1, 1,
-0.5066212, 0.7916687, -0.1619257, 1, 1, 1, 1, 1,
-0.5061963, -1.119573, -2.365316, 1, 1, 1, 1, 1,
-0.5051745, -0.5301244, -2.517993, 1, 1, 1, 1, 1,
-0.5008252, 0.58218, -1.785417, 1, 1, 1, 1, 1,
-0.5007191, 0.7313383, -0.8221195, 0, 0, 1, 1, 1,
-0.5000974, -0.7073833, -4.090268, 1, 0, 0, 1, 1,
-0.5000227, 0.732819, -0.2971482, 1, 0, 0, 1, 1,
-0.4920563, 0.05092321, -0.4756624, 1, 0, 0, 1, 1,
-0.4920154, 0.3551376, -1.097236, 1, 0, 0, 1, 1,
-0.4907886, 0.03187218, 0.390413, 1, 0, 0, 1, 1,
-0.4897761, 0.08901662, -0.4050736, 0, 0, 0, 1, 1,
-0.489514, 1.006841, -2.397947, 0, 0, 0, 1, 1,
-0.4847041, -0.2281425, -0.4569815, 0, 0, 0, 1, 1,
-0.4843583, -0.7333984, -2.005495, 0, 0, 0, 1, 1,
-0.4826393, -0.6741649, -2.842064, 0, 0, 0, 1, 1,
-0.4824516, 0.4690176, -0.9470474, 0, 0, 0, 1, 1,
-0.4824055, 0.3609357, -1.446608, 0, 0, 0, 1, 1,
-0.4803337, 0.7338971, -0.2824452, 1, 1, 1, 1, 1,
-0.4722208, 0.4680827, -0.8849322, 1, 1, 1, 1, 1,
-0.4721892, 0.7762755, -1.247872, 1, 1, 1, 1, 1,
-0.4684888, -0.4149302, -3.170945, 1, 1, 1, 1, 1,
-0.4628503, -0.2256163, -3.205736, 1, 1, 1, 1, 1,
-0.4546103, -0.3810161, -2.940438, 1, 1, 1, 1, 1,
-0.4517065, -0.1876093, -2.23912, 1, 1, 1, 1, 1,
-0.4478531, -0.06997661, -1.195228, 1, 1, 1, 1, 1,
-0.4400442, -1.753388, -3.494718, 1, 1, 1, 1, 1,
-0.4397243, -0.9628268, -2.524206, 1, 1, 1, 1, 1,
-0.4392101, -1.441293, -2.822228, 1, 1, 1, 1, 1,
-0.4382752, 0.7408932, 0.8599179, 1, 1, 1, 1, 1,
-0.4351865, -0.5142298, -2.75796, 1, 1, 1, 1, 1,
-0.435144, -1.691148, -2.193239, 1, 1, 1, 1, 1,
-0.4332057, 0.6319661, -0.3166462, 1, 1, 1, 1, 1,
-0.4274301, 0.1359749, 0.06791225, 0, 0, 1, 1, 1,
-0.4247965, -0.3174576, -1.670524, 1, 0, 0, 1, 1,
-0.4192868, 0.3248017, -0.8400412, 1, 0, 0, 1, 1,
-0.418781, -2.004692, -3.666612, 1, 0, 0, 1, 1,
-0.415238, -1.067547, -4.008418, 1, 0, 0, 1, 1,
-0.4129975, -1.699944, -1.922633, 1, 0, 0, 1, 1,
-0.4090679, 0.2430435, -1.481958, 0, 0, 0, 1, 1,
-0.4080935, -2.044107, -2.733043, 0, 0, 0, 1, 1,
-0.4045059, 1.058839, -0.6081865, 0, 0, 0, 1, 1,
-0.4043181, -0.2134024, -1.3619, 0, 0, 0, 1, 1,
-0.4031513, -0.3584988, -2.498545, 0, 0, 0, 1, 1,
-0.4012802, 1.883472, -0.5252634, 0, 0, 0, 1, 1,
-0.3985567, -1.395712, -4.34699, 0, 0, 0, 1, 1,
-0.3980184, 0.1383205, -0.7689809, 1, 1, 1, 1, 1,
-0.3847124, 1.021122, -1.248299, 1, 1, 1, 1, 1,
-0.3817883, 1.796008, 1.654328, 1, 1, 1, 1, 1,
-0.3811701, 0.5917234, -3.180184, 1, 1, 1, 1, 1,
-0.3769398, 0.5555536, -0.6477582, 1, 1, 1, 1, 1,
-0.3768256, 0.7536967, -1.391974, 1, 1, 1, 1, 1,
-0.3761646, -0.5489784, -2.908957, 1, 1, 1, 1, 1,
-0.373737, -0.1428871, -0.2301299, 1, 1, 1, 1, 1,
-0.37351, 0.6366003, -1.698576, 1, 1, 1, 1, 1,
-0.3611633, 0.4428778, -1.778352, 1, 1, 1, 1, 1,
-0.360657, -0.5621334, -3.035706, 1, 1, 1, 1, 1,
-0.3578207, -0.2749177, -2.58219, 1, 1, 1, 1, 1,
-0.3555949, -0.3406755, -1.964851, 1, 1, 1, 1, 1,
-0.3540091, 0.381127, -1.125368, 1, 1, 1, 1, 1,
-0.3534451, -1.82322, -3.623468, 1, 1, 1, 1, 1,
-0.3521414, 0.1264552, -1.494989, 0, 0, 1, 1, 1,
-0.3484823, -1.35507, -2.336693, 1, 0, 0, 1, 1,
-0.3484126, -1.304879, -2.148847, 1, 0, 0, 1, 1,
-0.3435207, -1.539768, -2.231349, 1, 0, 0, 1, 1,
-0.3377671, -0.4701452, -1.675106, 1, 0, 0, 1, 1,
-0.3303568, 1.559538, 1.411563, 1, 0, 0, 1, 1,
-0.3283574, -1.214598, -1.921902, 0, 0, 0, 1, 1,
-0.3250893, -1.613804, -3.961453, 0, 0, 0, 1, 1,
-0.3233171, -1.647191, -3.8007, 0, 0, 0, 1, 1,
-0.3193975, -1.395783, -3.099571, 0, 0, 0, 1, 1,
-0.3149665, 2.343985, -0.3702451, 0, 0, 0, 1, 1,
-0.3143926, -0.6520443, -0.3098713, 0, 0, 0, 1, 1,
-0.3137526, 0.09975585, -3.050014, 0, 0, 0, 1, 1,
-0.3122834, -0.7814334, -1.962603, 1, 1, 1, 1, 1,
-0.3109406, -1.139225, -2.377358, 1, 1, 1, 1, 1,
-0.3092094, -0.5727983, -2.040416, 1, 1, 1, 1, 1,
-0.3068987, 0.2339164, -1.472815, 1, 1, 1, 1, 1,
-0.3064704, -0.5183632, -3.277932, 1, 1, 1, 1, 1,
-0.305808, 1.342417, 0.4218004, 1, 1, 1, 1, 1,
-0.3026742, -1.496496, -2.86211, 1, 1, 1, 1, 1,
-0.2980157, -0.4403827, -3.33534, 1, 1, 1, 1, 1,
-0.2966417, -1.794797, -3.053335, 1, 1, 1, 1, 1,
-0.2946912, -0.5062281, -3.207475, 1, 1, 1, 1, 1,
-0.2915494, -0.6648492, -1.788629, 1, 1, 1, 1, 1,
-0.2900564, -0.9296103, -1.575049, 1, 1, 1, 1, 1,
-0.2801493, -0.02974148, -0.5456319, 1, 1, 1, 1, 1,
-0.2739491, -0.9932227, -4.252891, 1, 1, 1, 1, 1,
-0.2730084, -0.2619062, -2.882375, 1, 1, 1, 1, 1,
-0.2723903, 0.5910505, -1.436477, 0, 0, 1, 1, 1,
-0.271623, 0.4100633, -2.636401, 1, 0, 0, 1, 1,
-0.2705484, 1.180748, 0.3446808, 1, 0, 0, 1, 1,
-0.2677125, 1.284314, -0.6141523, 1, 0, 0, 1, 1,
-0.2649275, 1.473255, 0.7126645, 1, 0, 0, 1, 1,
-0.2625799, -0.5994456, -1.634317, 1, 0, 0, 1, 1,
-0.2607673, 0.01489525, -2.433899, 0, 0, 0, 1, 1,
-0.2558278, -0.3814859, -3.415328, 0, 0, 0, 1, 1,
-0.2549213, 0.6257993, -0.907213, 0, 0, 0, 1, 1,
-0.2519526, -1.268162, -2.847508, 0, 0, 0, 1, 1,
-0.2511134, 0.05426528, -0.2743012, 0, 0, 0, 1, 1,
-0.242774, 0.4909294, -0.3553986, 0, 0, 0, 1, 1,
-0.2373178, 0.3713719, 1.090813, 0, 0, 0, 1, 1,
-0.2372762, -1.183463, -3.873503, 1, 1, 1, 1, 1,
-0.2328485, 1.0853, 1.160577, 1, 1, 1, 1, 1,
-0.2309923, 0.1526849, -1.088302, 1, 1, 1, 1, 1,
-0.2305201, 1.99119, 2.153222, 1, 1, 1, 1, 1,
-0.2292363, -1.201528, -2.619683, 1, 1, 1, 1, 1,
-0.2286931, -0.4744293, -4.176206, 1, 1, 1, 1, 1,
-0.2282216, 1.368474, -0.6969424, 1, 1, 1, 1, 1,
-0.2269506, -0.5830542, -1.965436, 1, 1, 1, 1, 1,
-0.2236212, 0.7634872, 0.1283616, 1, 1, 1, 1, 1,
-0.2233949, -1.792314, -4.256797, 1, 1, 1, 1, 1,
-0.2074585, 0.1487474, -1.424619, 1, 1, 1, 1, 1,
-0.2059298, -0.2827066, -2.775441, 1, 1, 1, 1, 1,
-0.2024484, 0.2180397, -0.9540007, 1, 1, 1, 1, 1,
-0.2013231, 0.9679089, -0.2649624, 1, 1, 1, 1, 1,
-0.2009755, 0.002766204, -0.2992608, 1, 1, 1, 1, 1,
-0.2002534, -0.3568894, -4.523468, 0, 0, 1, 1, 1,
-0.2001641, -0.9383955, -4.349165, 1, 0, 0, 1, 1,
-0.1948919, 0.0138339, -0.4689414, 1, 0, 0, 1, 1,
-0.1928946, -1.007847, -3.606342, 1, 0, 0, 1, 1,
-0.1914433, -0.5738471, -1.503302, 1, 0, 0, 1, 1,
-0.1890552, -0.3711681, -1.273589, 1, 0, 0, 1, 1,
-0.1852382, 0.2587125, 0.9172, 0, 0, 0, 1, 1,
-0.1738084, -0.5553622, -3.3651, 0, 0, 0, 1, 1,
-0.1723966, -0.009583157, -1.79266, 0, 0, 0, 1, 1,
-0.1689723, 0.9775569, 0.8744717, 0, 0, 0, 1, 1,
-0.1687784, -0.5565352, -4.396421, 0, 0, 0, 1, 1,
-0.1665039, -0.7416768, -2.095012, 0, 0, 0, 1, 1,
-0.1632286, -1.935891, -1.867582, 0, 0, 0, 1, 1,
-0.1629091, -0.1220414, -2.650182, 1, 1, 1, 1, 1,
-0.1625126, 0.778935, -0.9760088, 1, 1, 1, 1, 1,
-0.1623243, -1.656341, -3.224714, 1, 1, 1, 1, 1,
-0.1609249, 1.627347, 0.1523141, 1, 1, 1, 1, 1,
-0.1558152, 0.07723071, 0.01786049, 1, 1, 1, 1, 1,
-0.1543338, -0.03986636, -1.242443, 1, 1, 1, 1, 1,
-0.1539827, -0.8345744, -1.938244, 1, 1, 1, 1, 1,
-0.1530744, -1.577462, -4.585618, 1, 1, 1, 1, 1,
-0.1483859, -1.359985, -4.072827, 1, 1, 1, 1, 1,
-0.1415563, -0.1399748, -2.554062, 1, 1, 1, 1, 1,
-0.1397685, 0.9733969, -0.5519317, 1, 1, 1, 1, 1,
-0.138899, -1.45596, -2.431142, 1, 1, 1, 1, 1,
-0.1364793, -1.333858, -2.808397, 1, 1, 1, 1, 1,
-0.1351655, -0.3730878, -0.9906622, 1, 1, 1, 1, 1,
-0.1257854, 0.07617979, 0.2934158, 1, 1, 1, 1, 1,
-0.1238798, 0.05630233, -0.8211447, 0, 0, 1, 1, 1,
-0.1186635, 0.5633348, 0.1786303, 1, 0, 0, 1, 1,
-0.1145744, 1.817674, -0.4922068, 1, 0, 0, 1, 1,
-0.1138103, 0.2421723, -1.601784, 1, 0, 0, 1, 1,
-0.1121102, -1.126958, -1.592074, 1, 0, 0, 1, 1,
-0.1106623, 0.05571918, -0.3681284, 1, 0, 0, 1, 1,
-0.1096487, 0.1927583, -1.335826, 0, 0, 0, 1, 1,
-0.1081436, -0.7669814, -5.599221, 0, 0, 0, 1, 1,
-0.1032541, 0.4867926, 0.2395598, 0, 0, 0, 1, 1,
-0.100573, 1.145503, 0.7611535, 0, 0, 0, 1, 1,
-0.09910756, -0.4066365, -2.799163, 0, 0, 0, 1, 1,
-0.09885199, 0.620692, 0.81883, 0, 0, 0, 1, 1,
-0.09640753, 0.3899704, -0.2887859, 0, 0, 0, 1, 1,
-0.08918169, -0.4751085, -2.977801, 1, 1, 1, 1, 1,
-0.08819543, -0.4449306, -3.294147, 1, 1, 1, 1, 1,
-0.08793473, -0.8432675, -3.119294, 1, 1, 1, 1, 1,
-0.08754104, -1.433201, -4.133702, 1, 1, 1, 1, 1,
-0.08722033, -0.05826737, -2.556363, 1, 1, 1, 1, 1,
-0.08696741, 1.253413, 0.5951402, 1, 1, 1, 1, 1,
-0.08423956, 0.6426724, -0.198736, 1, 1, 1, 1, 1,
-0.07740492, -0.08552934, -1.274624, 1, 1, 1, 1, 1,
-0.07735071, 0.2559176, 1.496827, 1, 1, 1, 1, 1,
-0.07727396, 0.3155318, -0.2176479, 1, 1, 1, 1, 1,
-0.07229965, 0.4459616, -0.8409397, 1, 1, 1, 1, 1,
-0.07099165, 1.058456, -0.1127501, 1, 1, 1, 1, 1,
-0.07033852, -0.3235436, -2.986209, 1, 1, 1, 1, 1,
-0.06806675, -1.54947, -5.315542, 1, 1, 1, 1, 1,
-0.06185538, -0.8610062, -1.984396, 1, 1, 1, 1, 1,
-0.06115533, 0.5404258, 0.377235, 0, 0, 1, 1, 1,
-0.05842546, -0.2213395, -1.513191, 1, 0, 0, 1, 1,
-0.05209916, 0.01153761, -1.893003, 1, 0, 0, 1, 1,
-0.04803092, -0.109124, -2.058491, 1, 0, 0, 1, 1,
-0.04478502, 1.328771, -1.415163, 1, 0, 0, 1, 1,
-0.04157482, -0.0662931, -3.477236, 1, 0, 0, 1, 1,
-0.03809722, -0.2065172, -3.676607, 0, 0, 0, 1, 1,
-0.0359921, 1.005515, 0.04172547, 0, 0, 0, 1, 1,
-0.03532328, 0.504617, 0.2869346, 0, 0, 0, 1, 1,
-0.03433269, -0.276216, -3.106288, 0, 0, 0, 1, 1,
-0.03134684, -0.3309857, -2.630077, 0, 0, 0, 1, 1,
-0.02923532, -1.662312, -3.233776, 0, 0, 0, 1, 1,
-0.02535272, -1.251863, -3.825284, 0, 0, 0, 1, 1,
-0.02295926, 0.2678006, -0.9422858, 1, 1, 1, 1, 1,
-0.01911017, 1.218607, 0.5687136, 1, 1, 1, 1, 1,
-0.01898491, 0.7367421, 0.3810966, 1, 1, 1, 1, 1,
-0.01772052, 0.828938, 2.305225, 1, 1, 1, 1, 1,
-0.01564591, 0.08072387, -0.5552545, 1, 1, 1, 1, 1,
-0.01387433, -1.049456, -2.033095, 1, 1, 1, 1, 1,
-0.01340154, 0.8090636, -1.176171, 1, 1, 1, 1, 1,
-0.01236729, -1.005746, -3.241338, 1, 1, 1, 1, 1,
-0.01180908, 0.5970366, 0.09894908, 1, 1, 1, 1, 1,
-0.007420315, 0.6477218, -0.7773018, 1, 1, 1, 1, 1,
-0.00537623, 2.891526, -0.6370788, 1, 1, 1, 1, 1,
-0.002816288, -0.4054579, -2.04273, 1, 1, 1, 1, 1,
0.0008413721, 0.5641862, -1.569949, 1, 1, 1, 1, 1,
0.002884819, -1.435936, 2.224059, 1, 1, 1, 1, 1,
0.003798193, -0.7952854, 4.620621, 1, 1, 1, 1, 1,
0.007772576, 0.7438889, -0.07456904, 0, 0, 1, 1, 1,
0.01045944, 0.1230522, -1.479989, 1, 0, 0, 1, 1,
0.01256814, -0.3784795, 2.698156, 1, 0, 0, 1, 1,
0.01654943, -0.02458531, 1.492798, 1, 0, 0, 1, 1,
0.01661751, 0.4626219, 1.756696, 1, 0, 0, 1, 1,
0.01824854, -1.118621, 3.17444, 1, 0, 0, 1, 1,
0.02059992, -0.48881, 2.852275, 0, 0, 0, 1, 1,
0.02506791, 0.05747176, -0.7664323, 0, 0, 0, 1, 1,
0.02909003, -0.07679616, 3.789833, 0, 0, 0, 1, 1,
0.03270247, 0.904498, -0.2155691, 0, 0, 0, 1, 1,
0.033721, -0.7055522, 3.538094, 0, 0, 0, 1, 1,
0.04359476, -0.5234997, 3.418078, 0, 0, 0, 1, 1,
0.04517446, 0.2550175, 0.6017954, 0, 0, 0, 1, 1,
0.04543429, 1.037897, 1.592981, 1, 1, 1, 1, 1,
0.04884504, 0.6512873, -0.3143298, 1, 1, 1, 1, 1,
0.04952439, 0.6675852, -0.3710056, 1, 1, 1, 1, 1,
0.05015256, 0.4593003, 0.2449683, 1, 1, 1, 1, 1,
0.05378756, 0.2189482, 0.2460227, 1, 1, 1, 1, 1,
0.05450861, 0.3243357, -0.9290267, 1, 1, 1, 1, 1,
0.05641619, -0.5286672, 3.248202, 1, 1, 1, 1, 1,
0.06870878, 0.3688537, 1.613151, 1, 1, 1, 1, 1,
0.07003658, -1.282607, 2.312367, 1, 1, 1, 1, 1,
0.07523357, -1.655491, 2.998541, 1, 1, 1, 1, 1,
0.07927748, -0.8816012, 4.269145, 1, 1, 1, 1, 1,
0.08189785, 0.3844552, -0.5822431, 1, 1, 1, 1, 1,
0.08229154, -0.3842847, 4.087321, 1, 1, 1, 1, 1,
0.08748881, 2.599969, -0.1566904, 1, 1, 1, 1, 1,
0.09238523, 1.828895, 1.540299, 1, 1, 1, 1, 1,
0.0933047, 1.965722, 1.017929, 0, 0, 1, 1, 1,
0.09383646, -0.5154997, 2.733717, 1, 0, 0, 1, 1,
0.09612678, 1.451155, 0.3405921, 1, 0, 0, 1, 1,
0.09842629, 0.2519861, 0.4938716, 1, 0, 0, 1, 1,
0.1013158, 0.3872473, -0.2410721, 1, 0, 0, 1, 1,
0.1048405, -0.5912481, 3.682857, 1, 0, 0, 1, 1,
0.1084821, 0.03965185, 2.200094, 0, 0, 0, 1, 1,
0.111206, 0.3839398, -0.02332572, 0, 0, 0, 1, 1,
0.1177778, -0.9415368, 3.30387, 0, 0, 0, 1, 1,
0.1191589, -1.835658, 3.136688, 0, 0, 0, 1, 1,
0.1210723, -0.30965, 2.868744, 0, 0, 0, 1, 1,
0.1226874, 0.03090489, 1.993846, 0, 0, 0, 1, 1,
0.1239861, 1.086707, 0.423444, 0, 0, 0, 1, 1,
0.1240741, -0.2254975, 0.7557152, 1, 1, 1, 1, 1,
0.1269639, -0.6028432, 3.984518, 1, 1, 1, 1, 1,
0.1277534, 0.5547361, 0.7770036, 1, 1, 1, 1, 1,
0.1296583, -1.20752, 4.106615, 1, 1, 1, 1, 1,
0.1300378, -2.293282, 3.850106, 1, 1, 1, 1, 1,
0.1337473, -1.709086, 2.907635, 1, 1, 1, 1, 1,
0.134712, 0.4512505, 1.141713, 1, 1, 1, 1, 1,
0.140392, -1.223177, 1.322225, 1, 1, 1, 1, 1,
0.1439201, -1.133635, 4.770682, 1, 1, 1, 1, 1,
0.1530387, 0.8543485, 0.9657575, 1, 1, 1, 1, 1,
0.1648638, 0.1179744, 1.519491, 1, 1, 1, 1, 1,
0.1654555, -0.09762782, 2.895157, 1, 1, 1, 1, 1,
0.1718711, -1.316645, 1.116049, 1, 1, 1, 1, 1,
0.1726566, -0.3340414, 4.499862, 1, 1, 1, 1, 1,
0.1747572, 0.4652747, -0.4770827, 1, 1, 1, 1, 1,
0.1781276, -2.403547, 5.873821, 0, 0, 1, 1, 1,
0.1781798, 0.009831003, 2.830681, 1, 0, 0, 1, 1,
0.1791923, -0.2879947, 2.931625, 1, 0, 0, 1, 1,
0.1796647, -0.4676963, 1.038653, 1, 0, 0, 1, 1,
0.1825756, 0.7077381, -0.2774648, 1, 0, 0, 1, 1,
0.1835952, 0.1468136, 1.399315, 1, 0, 0, 1, 1,
0.1885412, -0.7089958, 2.86671, 0, 0, 0, 1, 1,
0.1967714, 0.4737395, 0.8817135, 0, 0, 0, 1, 1,
0.1978326, -0.2654622, 3.06531, 0, 0, 0, 1, 1,
0.2067421, -0.1926702, 1.131152, 0, 0, 0, 1, 1,
0.2086863, 1.5545, 0.05960344, 0, 0, 0, 1, 1,
0.212263, 0.3427558, -0.5039086, 0, 0, 0, 1, 1,
0.2150229, 0.9232903, 0.1974397, 0, 0, 0, 1, 1,
0.2186994, -1.36315, 2.804115, 1, 1, 1, 1, 1,
0.2264276, 0.6832656, 0.1451328, 1, 1, 1, 1, 1,
0.2277441, -0.7829213, 2.650383, 1, 1, 1, 1, 1,
0.2292659, 0.1769271, 0.8435226, 1, 1, 1, 1, 1,
0.2310695, 1.522011, 0.170857, 1, 1, 1, 1, 1,
0.2310699, -0.4753221, 1.734832, 1, 1, 1, 1, 1,
0.2312352, -0.1637797, 2.426361, 1, 1, 1, 1, 1,
0.2342477, -0.7280442, 2.744703, 1, 1, 1, 1, 1,
0.2355293, 0.5169453, 1.23557, 1, 1, 1, 1, 1,
0.2369325, -0.4935979, 2.871488, 1, 1, 1, 1, 1,
0.2374907, -0.6238178, 3.059606, 1, 1, 1, 1, 1,
0.2410579, -0.3652748, 1.220907, 1, 1, 1, 1, 1,
0.2462483, -1.067018, 1.545768, 1, 1, 1, 1, 1,
0.2473088, -0.8354658, 2.23784, 1, 1, 1, 1, 1,
0.2488879, 1.359897, -0.6235307, 1, 1, 1, 1, 1,
0.2491304, 0.2957392, 1.635595, 0, 0, 1, 1, 1,
0.2529545, 0.4252684, 0.3419971, 1, 0, 0, 1, 1,
0.255928, 1.69026, 0.1614891, 1, 0, 0, 1, 1,
0.2576128, -0.7891877, 2.386955, 1, 0, 0, 1, 1,
0.259852, 0.2126476, 1.566791, 1, 0, 0, 1, 1,
0.2602461, 1.187381, 1.476959, 1, 0, 0, 1, 1,
0.2748609, -1.089498, 2.567291, 0, 0, 0, 1, 1,
0.2761119, -0.8128502, 3.066305, 0, 0, 0, 1, 1,
0.2890619, 0.7826869, 0.6248221, 0, 0, 0, 1, 1,
0.2940332, -0.172691, 1.431803, 0, 0, 0, 1, 1,
0.2973223, 0.4788228, 0.9810587, 0, 0, 0, 1, 1,
0.2976748, 0.1832431, 1.93035, 0, 0, 0, 1, 1,
0.3028945, 0.1742886, 2.216073, 0, 0, 0, 1, 1,
0.3101819, -1.117466, 1.581948, 1, 1, 1, 1, 1,
0.3237518, 0.07952233, 0.3729502, 1, 1, 1, 1, 1,
0.3278196, -0.8846109, 4.041413, 1, 1, 1, 1, 1,
0.3295886, -1.856968, 2.83342, 1, 1, 1, 1, 1,
0.3320991, 1.152838, 0.4866242, 1, 1, 1, 1, 1,
0.3352606, 0.3076565, 1.177988, 1, 1, 1, 1, 1,
0.3384326, 0.7454629, 0.5687811, 1, 1, 1, 1, 1,
0.3387641, 0.1054555, 1.639938, 1, 1, 1, 1, 1,
0.3400038, 0.3823702, 0.06676311, 1, 1, 1, 1, 1,
0.34027, 0.9982208, 0.508939, 1, 1, 1, 1, 1,
0.3408573, -0.189795, 1.893532, 1, 1, 1, 1, 1,
0.3419287, 2.949875, 1.663931, 1, 1, 1, 1, 1,
0.3419362, 0.02112138, 3.41351, 1, 1, 1, 1, 1,
0.347682, -1.475224, 2.185757, 1, 1, 1, 1, 1,
0.348069, -0.9657993, 3.730812, 1, 1, 1, 1, 1,
0.3484928, 0.4276402, 1.060925, 0, 0, 1, 1, 1,
0.3490708, -0.8539485, 3.786583, 1, 0, 0, 1, 1,
0.3495382, 0.6165252, 1.542514, 1, 0, 0, 1, 1,
0.3509735, 0.05842013, 0.9944918, 1, 0, 0, 1, 1,
0.3513222, 0.4618282, 0.1583423, 1, 0, 0, 1, 1,
0.3514803, -0.6456025, 0.04066416, 1, 0, 0, 1, 1,
0.3545775, -1.439181, 3.465778, 0, 0, 0, 1, 1,
0.3585419, -0.90105, 2.467797, 0, 0, 0, 1, 1,
0.3586312, 2.106747, -0.3916257, 0, 0, 0, 1, 1,
0.361345, 0.2104305, 1.138017, 0, 0, 0, 1, 1,
0.362226, -1.964975, 1.644878, 0, 0, 0, 1, 1,
0.3624216, -0.6749617, 3.1278, 0, 0, 0, 1, 1,
0.3624455, -1.46917, 2.017027, 0, 0, 0, 1, 1,
0.3624611, 0.7406493, 0.559748, 1, 1, 1, 1, 1,
0.3661428, -0.6503434, 2.698875, 1, 1, 1, 1, 1,
0.370856, -0.3004339, 2.69377, 1, 1, 1, 1, 1,
0.3769932, 1.468866, 1.949451, 1, 1, 1, 1, 1,
0.3809897, 1.553605, 0.08045185, 1, 1, 1, 1, 1,
0.3825418, 0.5019088, 0.708133, 1, 1, 1, 1, 1,
0.3833214, -0.4206799, 1.636355, 1, 1, 1, 1, 1,
0.3846904, -0.07543213, 2.871457, 1, 1, 1, 1, 1,
0.3921243, 0.3949524, 1.086581, 1, 1, 1, 1, 1,
0.3962607, 0.01827738, 1.280506, 1, 1, 1, 1, 1,
0.3982256, -1.101024, 3.170531, 1, 1, 1, 1, 1,
0.3995861, 1.821646, -0.1113514, 1, 1, 1, 1, 1,
0.4019234, -0.867359, 3.460257, 1, 1, 1, 1, 1,
0.4088589, -0.0506094, -0.3179509, 1, 1, 1, 1, 1,
0.4116068, 0.4083712, -0.3347123, 1, 1, 1, 1, 1,
0.4155836, 1.266864, -0.1544576, 0, 0, 1, 1, 1,
0.4234096, -0.4492786, 2.455158, 1, 0, 0, 1, 1,
0.4239485, 0.4413979, 0.09940937, 1, 0, 0, 1, 1,
0.4241584, 1.110439, 1.690175, 1, 0, 0, 1, 1,
0.4253324, -0.9815346, 2.318159, 1, 0, 0, 1, 1,
0.431349, -0.1046008, 1.2237, 1, 0, 0, 1, 1,
0.433601, -0.1179031, 0.3404552, 0, 0, 0, 1, 1,
0.4364835, 0.7905374, -0.8542618, 0, 0, 0, 1, 1,
0.4382628, 1.353341, 0.04570861, 0, 0, 0, 1, 1,
0.4387397, -0.6374366, 1.007119, 0, 0, 0, 1, 1,
0.4390048, 1.685702, 1.572063, 0, 0, 0, 1, 1,
0.4411691, 0.6179658, 0.6642109, 0, 0, 0, 1, 1,
0.4445496, -0.4273858, 2.680582, 0, 0, 0, 1, 1,
0.4466655, -0.6860486, 0.2239189, 1, 1, 1, 1, 1,
0.4487868, -0.5655141, 2.053422, 1, 1, 1, 1, 1,
0.4502119, -0.6172711, 4.356024, 1, 1, 1, 1, 1,
0.4557462, 3.625224, -1.172852, 1, 1, 1, 1, 1,
0.4584072, 1.26074, 0.4747763, 1, 1, 1, 1, 1,
0.4589362, -0.001441002, 1.674719, 1, 1, 1, 1, 1,
0.4621675, 0.6223228, 1.851486, 1, 1, 1, 1, 1,
0.4639527, -0.3773515, 1.580722, 1, 1, 1, 1, 1,
0.4646564, -0.4182236, 3.802807, 1, 1, 1, 1, 1,
0.4653927, -1.641277, 1.144535, 1, 1, 1, 1, 1,
0.465515, 0.4747129, 2.411093, 1, 1, 1, 1, 1,
0.4677793, -1.896037, 4.715897, 1, 1, 1, 1, 1,
0.4696904, -0.07636875, 1.759402, 1, 1, 1, 1, 1,
0.471112, 0.9567893, 1.852812, 1, 1, 1, 1, 1,
0.4724326, -1.017333, 1.160155, 1, 1, 1, 1, 1,
0.473318, -1.080551, 1.866989, 0, 0, 1, 1, 1,
0.474484, 0.5278549, 0.1525543, 1, 0, 0, 1, 1,
0.4755358, 0.1102695, 0.2844262, 1, 0, 0, 1, 1,
0.4788459, -0.5010876, 2.787879, 1, 0, 0, 1, 1,
0.4792829, 0.2688221, 1.029445, 1, 0, 0, 1, 1,
0.483451, -0.884672, 2.454648, 1, 0, 0, 1, 1,
0.4840744, 1.126861, -0.2186445, 0, 0, 0, 1, 1,
0.4879333, 0.8737485, 0.4344992, 0, 0, 0, 1, 1,
0.4882241, 0.8001378, 1.109533, 0, 0, 0, 1, 1,
0.4896804, 1.02085, 1.018061, 0, 0, 0, 1, 1,
0.4940891, -0.6687894, 3.976388, 0, 0, 0, 1, 1,
0.5005565, 1.217801, -0.1588732, 0, 0, 0, 1, 1,
0.5021568, -0.3158687, 1.875077, 0, 0, 0, 1, 1,
0.5138007, -1.099557, 2.855987, 1, 1, 1, 1, 1,
0.5208896, -0.326506, 2.839092, 1, 1, 1, 1, 1,
0.5410302, 0.5834779, 0.221814, 1, 1, 1, 1, 1,
0.545105, 0.6209478, -0.6632491, 1, 1, 1, 1, 1,
0.5472806, 0.3048372, 1.557408, 1, 1, 1, 1, 1,
0.5507116, 0.1694571, 3.207401, 1, 1, 1, 1, 1,
0.5511386, -0.08560412, 2.643678, 1, 1, 1, 1, 1,
0.5525241, -0.07340431, 1.223427, 1, 1, 1, 1, 1,
0.5533281, -0.8958766, 0.9840745, 1, 1, 1, 1, 1,
0.5549218, 0.5351718, 2.555627, 1, 1, 1, 1, 1,
0.5606588, 1.367491, 1.956592, 1, 1, 1, 1, 1,
0.561391, 0.11641, 1.14053, 1, 1, 1, 1, 1,
0.5627417, 0.1708166, 1.552612, 1, 1, 1, 1, 1,
0.5630504, 0.5579875, 1.136857, 1, 1, 1, 1, 1,
0.5636905, -0.03486332, -0.07530448, 1, 1, 1, 1, 1,
0.5647047, 0.02002982, 2.454878, 0, 0, 1, 1, 1,
0.5661042, -0.7017539, 1.625586, 1, 0, 0, 1, 1,
0.5788987, 0.2165081, 2.582923, 1, 0, 0, 1, 1,
0.5907011, -0.2856202, 2.119816, 1, 0, 0, 1, 1,
0.5971524, -0.6753219, 0.59025, 1, 0, 0, 1, 1,
0.5972307, 0.571722, 1.433651, 1, 0, 0, 1, 1,
0.601828, 0.3573907, 2.630137, 0, 0, 0, 1, 1,
0.602597, -1.413142, 2.204666, 0, 0, 0, 1, 1,
0.6030397, -0.1467826, 0.6660043, 0, 0, 0, 1, 1,
0.6041459, 1.378049, 1.573236, 0, 0, 0, 1, 1,
0.6068122, 0.5551028, 1.82153, 0, 0, 0, 1, 1,
0.609108, 0.8191872, 1.599229, 0, 0, 0, 1, 1,
0.6130959, -1.763632, 1.450758, 0, 0, 0, 1, 1,
0.6143492, 2.946167, 1.166526, 1, 1, 1, 1, 1,
0.6152039, -0.01407723, 1.659668, 1, 1, 1, 1, 1,
0.6176894, -0.9121122, 3.269974, 1, 1, 1, 1, 1,
0.6234393, 0.8539678, -0.9407929, 1, 1, 1, 1, 1,
0.6314833, 0.8639923, 0.5372674, 1, 1, 1, 1, 1,
0.6321792, 0.436251, 1.042456, 1, 1, 1, 1, 1,
0.6331894, 1.091716, 0.5874481, 1, 1, 1, 1, 1,
0.6335446, 1.395912, 1.521096, 1, 1, 1, 1, 1,
0.6361181, -2.666243, 2.564985, 1, 1, 1, 1, 1,
0.638458, 0.03867925, 1.631198, 1, 1, 1, 1, 1,
0.6399166, -1.466916, 2.941895, 1, 1, 1, 1, 1,
0.6402847, 0.6998497, -1.089819, 1, 1, 1, 1, 1,
0.64102, 1.263888, 2.215276, 1, 1, 1, 1, 1,
0.641543, -0.5720366, 2.565947, 1, 1, 1, 1, 1,
0.6419805, -1.184016, 2.783014, 1, 1, 1, 1, 1,
0.642347, 1.081358, 1.686832, 0, 0, 1, 1, 1,
0.6556693, 0.5903863, 0.7795125, 1, 0, 0, 1, 1,
0.6579613, -0.2692074, 2.064765, 1, 0, 0, 1, 1,
0.6621622, -1.869133, 1.58466, 1, 0, 0, 1, 1,
0.6641651, 0.9802795, 0.5916422, 1, 0, 0, 1, 1,
0.6667692, -0.4491507, 1.786227, 1, 0, 0, 1, 1,
0.6688481, 0.5328436, -1.666425, 0, 0, 0, 1, 1,
0.6694093, -0.6634012, 1.922235, 0, 0, 0, 1, 1,
0.6790099, 0.6438112, 0.1936554, 0, 0, 0, 1, 1,
0.6815841, 0.361582, 1.459707, 0, 0, 0, 1, 1,
0.6841887, 0.5398373, -1.041293, 0, 0, 0, 1, 1,
0.6863901, -1.761289, 2.492882, 0, 0, 0, 1, 1,
0.6865684, -0.4465066, 0.8122102, 0, 0, 0, 1, 1,
0.6870744, -0.00633852, 1.908749, 1, 1, 1, 1, 1,
0.6964379, -1.03038, 0.4115566, 1, 1, 1, 1, 1,
0.7115208, 0.0239781, 2.608387, 1, 1, 1, 1, 1,
0.7123237, 1.138229, 0.325596, 1, 1, 1, 1, 1,
0.7124882, -0.2921162, 1.673653, 1, 1, 1, 1, 1,
0.7200541, 1.29611, -0.04649886, 1, 1, 1, 1, 1,
0.7210912, -1.485465, 4.217203, 1, 1, 1, 1, 1,
0.7228547, 0.4616652, -0.6453483, 1, 1, 1, 1, 1,
0.7257138, 0.1766177, 1.83077, 1, 1, 1, 1, 1,
0.7277675, -1.750588, 2.263868, 1, 1, 1, 1, 1,
0.7328135, 0.5415841, 1.353866, 1, 1, 1, 1, 1,
0.7336256, -1.026452, 2.48711, 1, 1, 1, 1, 1,
0.7364045, -0.2855383, 2.782056, 1, 1, 1, 1, 1,
0.73691, 0.02689387, 1.390307, 1, 1, 1, 1, 1,
0.7394469, 0.4542589, 3.23979, 1, 1, 1, 1, 1,
0.7421052, 0.4849059, -0.9554769, 0, 0, 1, 1, 1,
0.7457262, 0.3887284, 0.6876248, 1, 0, 0, 1, 1,
0.7457759, 0.1637569, 1.654646, 1, 0, 0, 1, 1,
0.7510082, -2.791832, 2.827766, 1, 0, 0, 1, 1,
0.759707, -0.4409078, 1.932412, 1, 0, 0, 1, 1,
0.7660066, -1.311103, 2.52045, 1, 0, 0, 1, 1,
0.7714794, 0.1038278, 2.224401, 0, 0, 0, 1, 1,
0.7731954, -0.7144336, 3.167521, 0, 0, 0, 1, 1,
0.7740284, -0.8542163, 2.675408, 0, 0, 0, 1, 1,
0.7820976, -0.1458491, 1.23364, 0, 0, 0, 1, 1,
0.7962934, -0.03141078, 2.558122, 0, 0, 0, 1, 1,
0.7986108, -0.01209594, 2.234666, 0, 0, 0, 1, 1,
0.8049299, -0.9507721, 2.133407, 0, 0, 0, 1, 1,
0.8132567, 1.095273, 1.224169, 1, 1, 1, 1, 1,
0.8143166, 0.5918675, 1.897241, 1, 1, 1, 1, 1,
0.8187919, -0.6097692, 3.471365, 1, 1, 1, 1, 1,
0.8215581, -1.334958, 2.693094, 1, 1, 1, 1, 1,
0.8221956, 1.18311, -0.4815004, 1, 1, 1, 1, 1,
0.8239612, -0.3094675, 1.66923, 1, 1, 1, 1, 1,
0.8265802, -1.157836, 2.651664, 1, 1, 1, 1, 1,
0.8366486, 0.5360433, 1.170398, 1, 1, 1, 1, 1,
0.8444909, 0.1352238, 3.293795, 1, 1, 1, 1, 1,
0.8457179, 0.9190105, -0.3574539, 1, 1, 1, 1, 1,
0.8463591, -0.3297048, 2.555444, 1, 1, 1, 1, 1,
0.847249, 0.856889, 2.173545, 1, 1, 1, 1, 1,
0.8480129, -0.04921249, 1.107281, 1, 1, 1, 1, 1,
0.8562556, 1.646974, -0.2278228, 1, 1, 1, 1, 1,
0.8563842, 0.3152348, 1.69911, 1, 1, 1, 1, 1,
0.8613486, 1.820729, -2.119023, 0, 0, 1, 1, 1,
0.861469, -0.6613276, 1.609201, 1, 0, 0, 1, 1,
0.874984, 1.518808, 1.576106, 1, 0, 0, 1, 1,
0.875507, -1.227149, 1.41738, 1, 0, 0, 1, 1,
0.8777908, -1.860026, 4.650382, 1, 0, 0, 1, 1,
0.8802426, 0.5818263, 0.6115518, 1, 0, 0, 1, 1,
0.8813707, 0.396117, 0.4431213, 0, 0, 0, 1, 1,
0.8828049, -0.5494404, 1.81526, 0, 0, 0, 1, 1,
0.8828321, 0.75972, 2.202771, 0, 0, 0, 1, 1,
0.8903103, 1.365106, 1.627285, 0, 0, 0, 1, 1,
0.8919595, 1.158139, 0.3978833, 0, 0, 0, 1, 1,
0.8937756, 0.2280397, 2.33559, 0, 0, 0, 1, 1,
0.8989309, 0.3735166, 0.8404199, 0, 0, 0, 1, 1,
0.9022744, -0.02615231, 2.903814, 1, 1, 1, 1, 1,
0.9024976, -2.139757, 4.228637, 1, 1, 1, 1, 1,
0.910709, -1.208818, 3.370584, 1, 1, 1, 1, 1,
0.9140214, -0.780736, 2.959686, 1, 1, 1, 1, 1,
0.9336631, -1.817106, 3.292042, 1, 1, 1, 1, 1,
0.9356471, -0.02712037, 2.574656, 1, 1, 1, 1, 1,
0.9437216, 0.4231857, 0.9562393, 1, 1, 1, 1, 1,
0.9533072, 1.625633, 1.515822, 1, 1, 1, 1, 1,
0.9578367, 0.1674573, 1.298332, 1, 1, 1, 1, 1,
0.958803, 0.1801266, 0.8509637, 1, 1, 1, 1, 1,
0.9635575, -0.5767222, 2.403641, 1, 1, 1, 1, 1,
0.9667358, 0.005059391, 1.675316, 1, 1, 1, 1, 1,
0.9735739, 2.061693, -1.735553, 1, 1, 1, 1, 1,
0.9737799, 0.7182907, 1.597067, 1, 1, 1, 1, 1,
0.9771771, -1.187206, 2.7988, 1, 1, 1, 1, 1,
0.9839821, 0.2248982, 2.464025, 0, 0, 1, 1, 1,
0.9856362, -0.187928, 2.645907, 1, 0, 0, 1, 1,
0.9877624, 1.399106, -0.1866251, 1, 0, 0, 1, 1,
0.9945763, -2.373957, 3.472037, 1, 0, 0, 1, 1,
1.000089, -1.053468, 2.479708, 1, 0, 0, 1, 1,
1.004611, 0.9270281, 0.4487186, 1, 0, 0, 1, 1,
1.004671, -1.299263, 3.071412, 0, 0, 0, 1, 1,
1.00772, -0.07587039, 0.3545575, 0, 0, 0, 1, 1,
1.013931, -0.6130971, 1.767346, 0, 0, 0, 1, 1,
1.015397, 0.3013707, -0.2448592, 0, 0, 0, 1, 1,
1.029344, 0.5491895, 0.03728823, 0, 0, 0, 1, 1,
1.029509, -0.4072139, 1.694005, 0, 0, 0, 1, 1,
1.030134, -1.428522, 4.134604, 0, 0, 0, 1, 1,
1.030862, -0.4535716, 3.261655, 1, 1, 1, 1, 1,
1.033563, -0.1491513, 1.875357, 1, 1, 1, 1, 1,
1.037127, 0.7228416, 0.985002, 1, 1, 1, 1, 1,
1.045824, -1.692169, 3.309539, 1, 1, 1, 1, 1,
1.053118, 1.036009, 0.0184918, 1, 1, 1, 1, 1,
1.054971, 1.345182, -1.255785, 1, 1, 1, 1, 1,
1.061801, 0.4048936, 1.753338, 1, 1, 1, 1, 1,
1.065837, -0.9750222, 1.797911, 1, 1, 1, 1, 1,
1.069641, -1.516631, 2.139104, 1, 1, 1, 1, 1,
1.070295, -2.031211, 3.599947, 1, 1, 1, 1, 1,
1.073514, -0.6214158, 1.239652, 1, 1, 1, 1, 1,
1.080479, 0.04056677, 2.264209, 1, 1, 1, 1, 1,
1.087716, -1.804745, 3.601756, 1, 1, 1, 1, 1,
1.10203, -0.6866906, 0.6134716, 1, 1, 1, 1, 1,
1.106978, -1.17121, -0.1441877, 1, 1, 1, 1, 1,
1.107298, 0.2713449, 2.589504, 0, 0, 1, 1, 1,
1.108763, -0.1093875, 1.512465, 1, 0, 0, 1, 1,
1.126266, -0.5860103, 2.385825, 1, 0, 0, 1, 1,
1.126273, -0.4942196, 1.918047, 1, 0, 0, 1, 1,
1.134017, -1.212676, 4.514716, 1, 0, 0, 1, 1,
1.134481, 1.260673, 1.526984, 1, 0, 0, 1, 1,
1.13783, -0.9881067, 2.219877, 0, 0, 0, 1, 1,
1.138808, -1.680578, 3.281074, 0, 0, 0, 1, 1,
1.140237, 0.08659098, 1.324527, 0, 0, 0, 1, 1,
1.146196, -0.9767182, 0.9040611, 0, 0, 0, 1, 1,
1.151523, -1.287265, 1.032324, 0, 0, 0, 1, 1,
1.15404, -1.120353, 2.157371, 0, 0, 0, 1, 1,
1.160378, -1.382598, 2.097452, 0, 0, 0, 1, 1,
1.161411, 0.09440149, 1.030543, 1, 1, 1, 1, 1,
1.16568, 1.332486, 0.1887061, 1, 1, 1, 1, 1,
1.16918, 1.352098, -0.1988963, 1, 1, 1, 1, 1,
1.179002, -0.8279494, 0.7366905, 1, 1, 1, 1, 1,
1.187493, 1.136378, 2.201206, 1, 1, 1, 1, 1,
1.190538, -0.08867311, 1.962883, 1, 1, 1, 1, 1,
1.194145, -1.345635, 3.185233, 1, 1, 1, 1, 1,
1.196838, 0.426849, 1.258626, 1, 1, 1, 1, 1,
1.205746, 0.5121416, 1.306205, 1, 1, 1, 1, 1,
1.205846, -1.176511, 0.2482144, 1, 1, 1, 1, 1,
1.207883, 0.984037, 0.666996, 1, 1, 1, 1, 1,
1.211892, 1.231012, -0.4798008, 1, 1, 1, 1, 1,
1.2212, 0.008253191, 1.8268, 1, 1, 1, 1, 1,
1.22126, 0.2800932, 0.4338973, 1, 1, 1, 1, 1,
1.224191, -0.7322378, 2.877846, 1, 1, 1, 1, 1,
1.226311, -1.255203, 0.2812725, 0, 0, 1, 1, 1,
1.233386, 1.539032, -0.1959664, 1, 0, 0, 1, 1,
1.244303, 1.207184, 0.902787, 1, 0, 0, 1, 1,
1.253107, -0.1320166, 1.588415, 1, 0, 0, 1, 1,
1.257261, -0.5790072, 0.4542757, 1, 0, 0, 1, 1,
1.268061, 0.04169149, 2.467232, 1, 0, 0, 1, 1,
1.271963, 0.1574324, 1.141109, 0, 0, 0, 1, 1,
1.286725, -0.6286162, 2.954806, 0, 0, 0, 1, 1,
1.289945, 0.7643853, 1.474743, 0, 0, 0, 1, 1,
1.29281, -0.001730216, 1.361767, 0, 0, 0, 1, 1,
1.294605, 1.283821, 0.8430273, 0, 0, 0, 1, 1,
1.296643, 1.733006, 1.135487, 0, 0, 0, 1, 1,
1.297666, -1.635829, 1.186585, 0, 0, 0, 1, 1,
1.299634, -0.3629327, -0.5173314, 1, 1, 1, 1, 1,
1.301805, 0.1859761, 2.844326, 1, 1, 1, 1, 1,
1.302885, -0.4184552, 3.088652, 1, 1, 1, 1, 1,
1.311074, 1.661368, 1.005784, 1, 1, 1, 1, 1,
1.322948, 0.5102326, 2.062082, 1, 1, 1, 1, 1,
1.335206, -0.6410685, 1.894579, 1, 1, 1, 1, 1,
1.338966, -1.689025, 2.136858, 1, 1, 1, 1, 1,
1.339251, 0.1385758, 1.083632, 1, 1, 1, 1, 1,
1.34202, -0.5748177, 1.952436, 1, 1, 1, 1, 1,
1.342952, -0.05009483, 0.5320332, 1, 1, 1, 1, 1,
1.345924, -0.6771631, 1.736897, 1, 1, 1, 1, 1,
1.356381, -0.408909, 2.043439, 1, 1, 1, 1, 1,
1.360772, 0.05196179, 2.620004, 1, 1, 1, 1, 1,
1.363972, -0.4859754, 3.217704, 1, 1, 1, 1, 1,
1.3647, 1.126106, 1.627207, 1, 1, 1, 1, 1,
1.371737, -1.112336, 0.8052555, 0, 0, 1, 1, 1,
1.377368, 1.683207, 1.70416, 1, 0, 0, 1, 1,
1.39944, 0.1501606, 1.600898, 1, 0, 0, 1, 1,
1.408997, -0.09897543, 1.109599, 1, 0, 0, 1, 1,
1.411843, 0.2838929, 0.6539363, 1, 0, 0, 1, 1,
1.421863, -1.278282, 1.217523, 1, 0, 0, 1, 1,
1.435392, -0.3085786, 0.8225427, 0, 0, 0, 1, 1,
1.450948, -0.4597388, 1.231743, 0, 0, 0, 1, 1,
1.474534, -1.221068, 1.842486, 0, 0, 0, 1, 1,
1.476341, 0.05221872, 3.089032, 0, 0, 0, 1, 1,
1.484373, -0.339305, 2.776093, 0, 0, 0, 1, 1,
1.488936, -0.8976076, 1.627444, 0, 0, 0, 1, 1,
1.493524, -0.1486, 0.7368534, 0, 0, 0, 1, 1,
1.503117, -0.5731713, 0.7016188, 1, 1, 1, 1, 1,
1.504695, 0.2017832, 0.2077996, 1, 1, 1, 1, 1,
1.518691, 1.326657, 1.935342, 1, 1, 1, 1, 1,
1.53388, -0.4533091, 1.943788, 1, 1, 1, 1, 1,
1.539031, -0.1729057, 0.8371181, 1, 1, 1, 1, 1,
1.564027, -2.048191, 3.420259, 1, 1, 1, 1, 1,
1.573983, 0.3896566, 1.825111, 1, 1, 1, 1, 1,
1.581513, -0.8598467, 3.307626, 1, 1, 1, 1, 1,
1.586354, 0.6063373, 0.5978205, 1, 1, 1, 1, 1,
1.593003, -0.004380648, 1.435811, 1, 1, 1, 1, 1,
1.603175, -1.49225, 3.698236, 1, 1, 1, 1, 1,
1.615535, 0.5011616, 1.552056, 1, 1, 1, 1, 1,
1.619093, 1.517227, 2.092212, 1, 1, 1, 1, 1,
1.621919, 1.042073, -0.07220857, 1, 1, 1, 1, 1,
1.635191, -1.615376, 3.465797, 1, 1, 1, 1, 1,
1.655455, 0.09854911, 1.444819, 0, 0, 1, 1, 1,
1.670584, 0.851519, 0.8866696, 1, 0, 0, 1, 1,
1.675605, 0.8196347, 0.3909049, 1, 0, 0, 1, 1,
1.680549, -1.264802, 0.6517642, 1, 0, 0, 1, 1,
1.692207, -2.217937, 0.8054284, 1, 0, 0, 1, 1,
1.693627, -1.835054, 3.11042, 1, 0, 0, 1, 1,
1.727972, 0.222604, 0.4973448, 0, 0, 0, 1, 1,
1.737303, -0.09580323, 3.000479, 0, 0, 0, 1, 1,
1.75211, 1.021873, 2.097577, 0, 0, 0, 1, 1,
1.752727, -0.5417535, 2.733385, 0, 0, 0, 1, 1,
1.796847, 1.06154, 0.8484789, 0, 0, 0, 1, 1,
1.797422, -0.09388735, 0.5193876, 0, 0, 0, 1, 1,
1.802559, 1.934623, -1.335084, 0, 0, 0, 1, 1,
1.803224, -0.5828046, 2.781068, 1, 1, 1, 1, 1,
1.80818, 2.77674, 2.557397, 1, 1, 1, 1, 1,
1.819008, -1.218668, 2.935399, 1, 1, 1, 1, 1,
1.837583, -0.0366581, 0.9092195, 1, 1, 1, 1, 1,
1.83795, 1.263677, 1.680234, 1, 1, 1, 1, 1,
1.842448, 1.364983, 1.191002, 1, 1, 1, 1, 1,
1.861215, 0.2445457, 1.796918, 1, 1, 1, 1, 1,
1.869126, -0.7007457, 0.322835, 1, 1, 1, 1, 1,
1.882595, 0.3567624, 1.775758, 1, 1, 1, 1, 1,
1.893736, 0.2316442, 0.5819809, 1, 1, 1, 1, 1,
1.900776, -0.1488596, 3.44336, 1, 1, 1, 1, 1,
1.919256, -0.716833, 1.027728, 1, 1, 1, 1, 1,
1.939944, -1.300218, 2.502089, 1, 1, 1, 1, 1,
1.96465, 1.390729, 0.9413301, 1, 1, 1, 1, 1,
1.981826, -1.066829, 1.110473, 1, 1, 1, 1, 1,
2.024699, -1.143714, 2.135581, 0, 0, 1, 1, 1,
2.032891, 1.425982, 1.130507, 1, 0, 0, 1, 1,
2.097242, 0.09129204, 1.040442, 1, 0, 0, 1, 1,
2.11226, -0.6225594, 3.451858, 1, 0, 0, 1, 1,
2.138992, -2.694468, 4.154439, 1, 0, 0, 1, 1,
2.203916, -1.204091, 3.443913, 1, 0, 0, 1, 1,
2.220005, 0.9499439, 1.764712, 0, 0, 0, 1, 1,
2.220122, -1.156196, -0.266971, 0, 0, 0, 1, 1,
2.232731, 1.036927, 1.476516, 0, 0, 0, 1, 1,
2.259862, 0.09650782, 2.599684, 0, 0, 0, 1, 1,
2.328398, -1.486674, 2.321593, 0, 0, 0, 1, 1,
2.345333, -1.725883, 0.1826192, 0, 0, 0, 1, 1,
2.423973, 0.9819568, -0.8807924, 0, 0, 0, 1, 1,
2.464436, -1.317649, 2.371223, 1, 1, 1, 1, 1,
2.575048, -0.3247363, 2.23838, 1, 1, 1, 1, 1,
2.67282, -0.2168062, -0.04260588, 1, 1, 1, 1, 1,
2.72802, -0.02764791, 0.9377722, 1, 1, 1, 1, 1,
2.743275, 0.7521623, 1.154147, 1, 1, 1, 1, 1,
2.973456, 0.9905422, 1.36559, 1, 1, 1, 1, 1,
3.11337, -1.329207, 2.106302, 1, 1, 1, 1, 1
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
var radius = 9.943432;
var distance = 34.92588;
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
mvMatrix.translate( 0.05969524, -0.2758467, -0.1372998 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.92588);
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
