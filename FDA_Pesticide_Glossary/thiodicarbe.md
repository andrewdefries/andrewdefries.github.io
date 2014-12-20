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
-3.418385, 0.7289768, -0.659916, 1, 0, 0, 1,
-3.128454, -0.330025, -2.025258, 1, 0.007843138, 0, 1,
-3.10189, 0.9935417, -0.9564117, 1, 0.01176471, 0, 1,
-3.072819, 0.9532602, -0.4115366, 1, 0.01960784, 0, 1,
-3.038086, -1.614654, -2.299778, 1, 0.02352941, 0, 1,
-2.982914, -0.964882, -2.23729, 1, 0.03137255, 0, 1,
-2.908195, -0.1043816, -0.6285099, 1, 0.03529412, 0, 1,
-2.875868, -0.5454598, -2.157587, 1, 0.04313726, 0, 1,
-2.776615, -1.379422, -4.359148, 1, 0.04705882, 0, 1,
-2.681565, 0.1349479, -1.615945, 1, 0.05490196, 0, 1,
-2.67682, -0.5593764, -1.540582, 1, 0.05882353, 0, 1,
-2.664324, 0.06767091, -2.136976, 1, 0.06666667, 0, 1,
-2.570791, 0.04413884, -0.7336914, 1, 0.07058824, 0, 1,
-2.378053, -1.571653, -2.494038, 1, 0.07843138, 0, 1,
-2.356529, 0.6321194, -1.507221, 1, 0.08235294, 0, 1,
-2.352018, -0.1099306, -2.607875, 1, 0.09019608, 0, 1,
-2.30624, -0.246577, -1.038362, 1, 0.09411765, 0, 1,
-2.296877, 0.01959681, -2.075916, 1, 0.1019608, 0, 1,
-2.283248, 0.8102958, -1.273518, 1, 0.1098039, 0, 1,
-2.222327, -0.1869693, -1.339083, 1, 0.1137255, 0, 1,
-2.162338, -0.211652, -0.2523199, 1, 0.1215686, 0, 1,
-2.152476, -0.2481185, 0.8862666, 1, 0.1254902, 0, 1,
-2.12313, 1.813496, 0.3901118, 1, 0.1333333, 0, 1,
-2.101325, 1.066445, -1.515353, 1, 0.1372549, 0, 1,
-2.06216, -0.3658232, -2.853239, 1, 0.145098, 0, 1,
-1.975748, 1.412863, -1.023389, 1, 0.1490196, 0, 1,
-1.964509, 0.07933857, -1.012302, 1, 0.1568628, 0, 1,
-1.954661, -0.2289438, -1.425079, 1, 0.1607843, 0, 1,
-1.943259, -0.9042299, -0.4819846, 1, 0.1686275, 0, 1,
-1.940153, -0.536706, -1.476726, 1, 0.172549, 0, 1,
-1.895182, -1.195248, -1.425502, 1, 0.1803922, 0, 1,
-1.889353, -0.7464139, -3.069538, 1, 0.1843137, 0, 1,
-1.883014, -0.4602821, -1.06108, 1, 0.1921569, 0, 1,
-1.872087, -0.3943642, -3.129581, 1, 0.1960784, 0, 1,
-1.871722, 0.124274, -2.545057, 1, 0.2039216, 0, 1,
-1.849513, -0.1253563, -0.5106714, 1, 0.2117647, 0, 1,
-1.848108, -1.027119, -2.305232, 1, 0.2156863, 0, 1,
-1.847442, -1.258962, -1.042233, 1, 0.2235294, 0, 1,
-1.833848, 0.3698783, -1.149348, 1, 0.227451, 0, 1,
-1.832456, -0.05684142, -2.808634, 1, 0.2352941, 0, 1,
-1.817108, 0.5883707, -1.087482, 1, 0.2392157, 0, 1,
-1.801934, 0.06367482, -1.074763, 1, 0.2470588, 0, 1,
-1.795783, -0.4233221, -3.09642, 1, 0.2509804, 0, 1,
-1.785219, -0.8406699, -1.490399, 1, 0.2588235, 0, 1,
-1.773505, 0.1766848, -1.205535, 1, 0.2627451, 0, 1,
-1.761863, -0.1703707, -3.789943, 1, 0.2705882, 0, 1,
-1.752539, -0.35956, -0.2019972, 1, 0.2745098, 0, 1,
-1.75165, -1.775253, -0.8242106, 1, 0.282353, 0, 1,
-1.710317, 0.2007249, -2.626576, 1, 0.2862745, 0, 1,
-1.709462, 0.3775591, -2.561936, 1, 0.2941177, 0, 1,
-1.705853, -0.285785, -1.225586, 1, 0.3019608, 0, 1,
-1.678095, 0.5704381, -0.5858039, 1, 0.3058824, 0, 1,
-1.675351, 0.6154306, -0.7142585, 1, 0.3137255, 0, 1,
-1.663954, -0.02913348, -2.916398, 1, 0.3176471, 0, 1,
-1.661195, -1.311748, -3.360353, 1, 0.3254902, 0, 1,
-1.651132, -1.189461, -0.7369533, 1, 0.3294118, 0, 1,
-1.636839, 0.1996299, -1.25671, 1, 0.3372549, 0, 1,
-1.629827, -0.1762765, -0.9810024, 1, 0.3411765, 0, 1,
-1.629544, -1.562906, -2.529165, 1, 0.3490196, 0, 1,
-1.620697, -1.504449, -2.555442, 1, 0.3529412, 0, 1,
-1.619568, -0.08910333, -1.367768, 1, 0.3607843, 0, 1,
-1.618477, 1.053006, 0.2562285, 1, 0.3647059, 0, 1,
-1.613475, -0.4046015, -2.330374, 1, 0.372549, 0, 1,
-1.610193, 0.4415276, -1.369062, 1, 0.3764706, 0, 1,
-1.602414, -1.65376, -2.573333, 1, 0.3843137, 0, 1,
-1.593705, -0.8584821, -2.012078, 1, 0.3882353, 0, 1,
-1.58203, 0.8160605, -1.175461, 1, 0.3960784, 0, 1,
-1.563864, 0.4017309, -2.040924, 1, 0.4039216, 0, 1,
-1.562559, -0.1403017, -1.937696, 1, 0.4078431, 0, 1,
-1.558997, -2.191151, -3.564669, 1, 0.4156863, 0, 1,
-1.55399, -0.5414466, -1.722546, 1, 0.4196078, 0, 1,
-1.550756, 1.524023, 0.3757653, 1, 0.427451, 0, 1,
-1.548959, 1.138198, 0.004535896, 1, 0.4313726, 0, 1,
-1.544111, -0.03373868, -3.16916, 1, 0.4392157, 0, 1,
-1.528261, 0.6303774, -0.6250908, 1, 0.4431373, 0, 1,
-1.51992, 0.1575369, 1.232266, 1, 0.4509804, 0, 1,
-1.507722, -1.93983, -3.019771, 1, 0.454902, 0, 1,
-1.496492, 1.007313, 0.1400679, 1, 0.4627451, 0, 1,
-1.485745, -0.6919622, -0.4469804, 1, 0.4666667, 0, 1,
-1.48136, 0.5894948, -1.793019, 1, 0.4745098, 0, 1,
-1.479788, -1.013877, -3.071979, 1, 0.4784314, 0, 1,
-1.478915, -1.015212, -3.154856, 1, 0.4862745, 0, 1,
-1.478487, 0.5650643, -2.336392, 1, 0.4901961, 0, 1,
-1.477907, -0.4284742, -1.149894, 1, 0.4980392, 0, 1,
-1.46138, -0.8982551, -3.038755, 1, 0.5058824, 0, 1,
-1.460896, -1.053919, -2.682359, 1, 0.509804, 0, 1,
-1.452129, 0.8511977, -2.276849, 1, 0.5176471, 0, 1,
-1.450409, -1.135065, -2.825552, 1, 0.5215687, 0, 1,
-1.428679, 0.6984918, -0.1803759, 1, 0.5294118, 0, 1,
-1.426326, -0.2020895, -3.178138, 1, 0.5333334, 0, 1,
-1.413462, 0.2775697, -0.5459712, 1, 0.5411765, 0, 1,
-1.413209, 1.113768, -1.47541, 1, 0.5450981, 0, 1,
-1.408321, -0.4167378, -0.3084623, 1, 0.5529412, 0, 1,
-1.399734, -1.162755, -2.516542, 1, 0.5568628, 0, 1,
-1.397187, -0.7938076, -1.706292, 1, 0.5647059, 0, 1,
-1.395527, -0.06624907, -2.649111, 1, 0.5686275, 0, 1,
-1.395346, 0.4088816, -2.227676, 1, 0.5764706, 0, 1,
-1.391871, 0.9560989, -0.2706823, 1, 0.5803922, 0, 1,
-1.390146, -0.7604535, -2.311827, 1, 0.5882353, 0, 1,
-1.389444, 0.04953464, -2.107463, 1, 0.5921569, 0, 1,
-1.379481, 1.804195, 0.1358875, 1, 0.6, 0, 1,
-1.368325, 1.210878, -0.2636586, 1, 0.6078432, 0, 1,
-1.360453, -0.4462611, -0.8393356, 1, 0.6117647, 0, 1,
-1.349741, 0.09148976, -0.7331684, 1, 0.6196079, 0, 1,
-1.349396, -2.098724, -2.242752, 1, 0.6235294, 0, 1,
-1.342897, -1.073757, -2.39682, 1, 0.6313726, 0, 1,
-1.318802, 0.8385854, -1.143325, 1, 0.6352941, 0, 1,
-1.317376, -1.089365, -2.5021, 1, 0.6431373, 0, 1,
-1.31116, -2.854924, -2.871485, 1, 0.6470588, 0, 1,
-1.311032, -1.121212, -2.133213, 1, 0.654902, 0, 1,
-1.30946, -0.125623, -0.2752626, 1, 0.6588235, 0, 1,
-1.302006, 0.6935987, -1.80585, 1, 0.6666667, 0, 1,
-1.301302, 0.1261488, -3.44199, 1, 0.6705883, 0, 1,
-1.285756, -0.6977285, -2.437115, 1, 0.6784314, 0, 1,
-1.28114, 0.4386685, -1.465309, 1, 0.682353, 0, 1,
-1.271085, 1.3368, -1.771001, 1, 0.6901961, 0, 1,
-1.266798, 0.5635403, -1.474473, 1, 0.6941177, 0, 1,
-1.261344, -1.26697, -0.1461399, 1, 0.7019608, 0, 1,
-1.259582, 0.8116809, -3.536207, 1, 0.7098039, 0, 1,
-1.245805, -0.4748459, -1.535408, 1, 0.7137255, 0, 1,
-1.236861, -0.3317575, -2.997209, 1, 0.7215686, 0, 1,
-1.234882, -0.1702971, -1.856573, 1, 0.7254902, 0, 1,
-1.234608, -0.8075655, -0.9118143, 1, 0.7333333, 0, 1,
-1.227087, 0.3445513, -0.757937, 1, 0.7372549, 0, 1,
-1.223788, -0.9854349, -1.766574, 1, 0.7450981, 0, 1,
-1.220848, 1.007603, -1.255174, 1, 0.7490196, 0, 1,
-1.212284, 0.4958358, -1.621776, 1, 0.7568628, 0, 1,
-1.200834, 1.134614, -0.001784472, 1, 0.7607843, 0, 1,
-1.200279, -0.661564, -3.455667, 1, 0.7686275, 0, 1,
-1.175571, 1.727222, -0.2788176, 1, 0.772549, 0, 1,
-1.172555, 0.6242427, -2.708406, 1, 0.7803922, 0, 1,
-1.166237, -1.028576, -3.999748, 1, 0.7843137, 0, 1,
-1.166161, -1.535404, -1.750842, 1, 0.7921569, 0, 1,
-1.163008, -0.9336683, -2.655424, 1, 0.7960784, 0, 1,
-1.158254, 1.649461, -1.923014, 1, 0.8039216, 0, 1,
-1.157283, 0.3871815, -2.103766, 1, 0.8117647, 0, 1,
-1.149211, -1.043771, -0.2599868, 1, 0.8156863, 0, 1,
-1.142689, 0.80212, -1.660754, 1, 0.8235294, 0, 1,
-1.142369, 0.2644574, -1.142249, 1, 0.827451, 0, 1,
-1.137418, 0.3043202, -1.003189, 1, 0.8352941, 0, 1,
-1.136261, 1.160465, -1.146828, 1, 0.8392157, 0, 1,
-1.135852, -1.204566, -3.043326, 1, 0.8470588, 0, 1,
-1.127519, 0.2714607, -2.066107, 1, 0.8509804, 0, 1,
-1.126828, 0.8735806, -0.667454, 1, 0.8588235, 0, 1,
-1.12649, -1.596016, -2.375749, 1, 0.8627451, 0, 1,
-1.124143, -0.4166093, -0.7371704, 1, 0.8705882, 0, 1,
-1.121592, -1.536695, -2.950971, 1, 0.8745098, 0, 1,
-1.119443, -1.016047, -3.685046, 1, 0.8823529, 0, 1,
-1.113975, 0.1163378, -2.489432, 1, 0.8862745, 0, 1,
-1.113043, -0.5247854, -2.384746, 1, 0.8941177, 0, 1,
-1.110436, -1.998358, -3.65364, 1, 0.8980392, 0, 1,
-1.109092, -0.1757408, -1.418218, 1, 0.9058824, 0, 1,
-1.097044, -0.6596522, -3.43554, 1, 0.9137255, 0, 1,
-1.093952, 0.8543027, -1.983284, 1, 0.9176471, 0, 1,
-1.077857, -0.319567, -1.513301, 1, 0.9254902, 0, 1,
-1.063284, -0.1807752, -2.23173, 1, 0.9294118, 0, 1,
-1.062931, -0.6403157, -4.070985, 1, 0.9372549, 0, 1,
-1.061878, -0.001753074, -0.776769, 1, 0.9411765, 0, 1,
-1.054833, 1.30449, -1.326596, 1, 0.9490196, 0, 1,
-1.047424, 1.534948, -1.352912, 1, 0.9529412, 0, 1,
-1.047032, -0.4469238, -1.092212, 1, 0.9607843, 0, 1,
-1.04553, 1.706735, -0.9856897, 1, 0.9647059, 0, 1,
-1.044758, -0.1903348, -1.413282, 1, 0.972549, 0, 1,
-1.043578, 0.1796637, -0.3340462, 1, 0.9764706, 0, 1,
-1.04007, 0.68288, -2.558124, 1, 0.9843137, 0, 1,
-1.034762, -0.4531525, -2.616703, 1, 0.9882353, 0, 1,
-1.031824, 0.7802761, -0.9219056, 1, 0.9960784, 0, 1,
-1.031761, 1.139022, -2.272947, 0.9960784, 1, 0, 1,
-1.029069, 0.8076283, -0.03037665, 0.9921569, 1, 0, 1,
-1.013166, 0.7867711, -0.757764, 0.9843137, 1, 0, 1,
-1.006799, -1.591062, -2.041398, 0.9803922, 1, 0, 1,
-1.002868, 0.04139924, -1.079934, 0.972549, 1, 0, 1,
-1.002267, 2.42898, -0.9059588, 0.9686275, 1, 0, 1,
-1.001621, -1.622296, -2.706124, 0.9607843, 1, 0, 1,
-1.001376, 0.7118821, -0.3747291, 0.9568627, 1, 0, 1,
-1.00036, -0.1339056, -1.682653, 0.9490196, 1, 0, 1,
-0.998339, 0.1887207, -0.3701683, 0.945098, 1, 0, 1,
-0.9965285, -1.164213, -1.465574, 0.9372549, 1, 0, 1,
-0.9867038, 1.084291, -1.695324, 0.9333333, 1, 0, 1,
-0.9791894, 0.03983235, -0.5400919, 0.9254902, 1, 0, 1,
-0.970696, 1.973287, -2.04621, 0.9215686, 1, 0, 1,
-0.9695179, -0.0901251, -2.594109, 0.9137255, 1, 0, 1,
-0.9688279, -0.2612451, -0.8114202, 0.9098039, 1, 0, 1,
-0.9681616, 1.019161, -1.016639, 0.9019608, 1, 0, 1,
-0.9675328, 0.8334453, -0.604319, 0.8941177, 1, 0, 1,
-0.9668702, -2.590888, -4.569502, 0.8901961, 1, 0, 1,
-0.9659039, -1.799828, -4.334072, 0.8823529, 1, 0, 1,
-0.9643097, 1.337683, 0.5902545, 0.8784314, 1, 0, 1,
-0.9634802, -0.02331767, -1.61482, 0.8705882, 1, 0, 1,
-0.9589289, 0.336733, -0.2347713, 0.8666667, 1, 0, 1,
-0.9496779, 0.5664047, -1.421598, 0.8588235, 1, 0, 1,
-0.9439105, 2.726448, 0.7705172, 0.854902, 1, 0, 1,
-0.9407279, -1.388039, -3.522321, 0.8470588, 1, 0, 1,
-0.9398835, 0.9635394, 0.5375533, 0.8431373, 1, 0, 1,
-0.9376172, -0.4675129, -0.9668432, 0.8352941, 1, 0, 1,
-0.9330652, 1.226509, 0.691041, 0.8313726, 1, 0, 1,
-0.9308669, 0.04366972, -1.319442, 0.8235294, 1, 0, 1,
-0.9238198, -0.6769093, -3.611521, 0.8196079, 1, 0, 1,
-0.9229441, -1.06018, -0.4978749, 0.8117647, 1, 0, 1,
-0.9213304, 1.648491, 0.3160358, 0.8078431, 1, 0, 1,
-0.9195042, 0.9870518, -1.019953, 0.8, 1, 0, 1,
-0.9178913, 0.9976721, -0.040159, 0.7921569, 1, 0, 1,
-0.9076806, -0.9703208, -1.75734, 0.7882353, 1, 0, 1,
-0.9064877, 1.945886, -0.8331206, 0.7803922, 1, 0, 1,
-0.9040522, -2.139726, -3.837357, 0.7764706, 1, 0, 1,
-0.9039504, -0.2622538, -1.241831, 0.7686275, 1, 0, 1,
-0.9024528, 0.1635368, -0.03381063, 0.7647059, 1, 0, 1,
-0.9005901, -0.6764398, -1.022796, 0.7568628, 1, 0, 1,
-0.8951764, 1.173183, -0.05413933, 0.7529412, 1, 0, 1,
-0.8918362, -0.3758499, -4.011812, 0.7450981, 1, 0, 1,
-0.8917087, -0.8332125, -2.008316, 0.7411765, 1, 0, 1,
-0.8907881, 0.6972231, 0.1312989, 0.7333333, 1, 0, 1,
-0.8838895, 1.052928, -2.208824, 0.7294118, 1, 0, 1,
-0.8817474, -2.522228, -3.218315, 0.7215686, 1, 0, 1,
-0.881038, 1.320288, 0.2099175, 0.7176471, 1, 0, 1,
-0.8775033, -0.04909962, -2.174914, 0.7098039, 1, 0, 1,
-0.8614517, -1.605823, -2.223569, 0.7058824, 1, 0, 1,
-0.8603445, -0.1214826, -1.492913, 0.6980392, 1, 0, 1,
-0.8598866, 1.10374, -2.30236, 0.6901961, 1, 0, 1,
-0.8590342, 1.69718, -0.6690793, 0.6862745, 1, 0, 1,
-0.8519332, 0.08802409, 0.4678572, 0.6784314, 1, 0, 1,
-0.8507685, -0.9143947, -1.539594, 0.6745098, 1, 0, 1,
-0.8505754, 1.828858, -0.9583554, 0.6666667, 1, 0, 1,
-0.8492377, 0.7528377, 0.282479, 0.6627451, 1, 0, 1,
-0.8445072, -0.3916313, -3.303699, 0.654902, 1, 0, 1,
-0.8415594, -0.548444, -2.252999, 0.6509804, 1, 0, 1,
-0.8401252, 0.6612218, 0.4597283, 0.6431373, 1, 0, 1,
-0.8359143, 0.9719253, 1.659761, 0.6392157, 1, 0, 1,
-0.8340898, 0.1595056, -1.943382, 0.6313726, 1, 0, 1,
-0.8291192, 0.1622074, -3.042459, 0.627451, 1, 0, 1,
-0.8285776, 0.8814959, -1.350204, 0.6196079, 1, 0, 1,
-0.827392, 0.9660652, -1.731352, 0.6156863, 1, 0, 1,
-0.8219061, 0.4522342, -1.606309, 0.6078432, 1, 0, 1,
-0.8170506, -0.2463755, -0.4439583, 0.6039216, 1, 0, 1,
-0.8113481, -1.563966, -3.171115, 0.5960785, 1, 0, 1,
-0.810842, 2.406102, -1.094863, 0.5882353, 1, 0, 1,
-0.8038062, -0.4539101, -3.704385, 0.5843138, 1, 0, 1,
-0.7991319, 1.271693, 0.196262, 0.5764706, 1, 0, 1,
-0.7964699, -0.4242222, -0.5334653, 0.572549, 1, 0, 1,
-0.7959932, -0.6576582, -3.092465, 0.5647059, 1, 0, 1,
-0.7925704, 0.494572, -1.765135, 0.5607843, 1, 0, 1,
-0.7889379, -0.3178248, -2.404341, 0.5529412, 1, 0, 1,
-0.7836968, 0.09675284, 0.1260553, 0.5490196, 1, 0, 1,
-0.7824281, -0.3124113, -1.50117, 0.5411765, 1, 0, 1,
-0.7806661, 1.228819, 0.8397742, 0.5372549, 1, 0, 1,
-0.780657, 0.01112887, -1.534782, 0.5294118, 1, 0, 1,
-0.7753088, -1.739967, -2.228111, 0.5254902, 1, 0, 1,
-0.7720063, -1.462204, -1.207213, 0.5176471, 1, 0, 1,
-0.7707438, -0.6502971, -1.485374, 0.5137255, 1, 0, 1,
-0.7698712, -2.903667, -1.266035, 0.5058824, 1, 0, 1,
-0.7650418, -0.03681004, 0.06935179, 0.5019608, 1, 0, 1,
-0.7630545, 0.1536839, -2.18194, 0.4941176, 1, 0, 1,
-0.7619593, 0.02468557, 0.02552682, 0.4862745, 1, 0, 1,
-0.7606979, -0.8135022, -1.859562, 0.4823529, 1, 0, 1,
-0.7590982, -0.009955131, -0.4769576, 0.4745098, 1, 0, 1,
-0.7567762, 0.6210703, -1.026383, 0.4705882, 1, 0, 1,
-0.7548186, -0.9882537, -3.571363, 0.4627451, 1, 0, 1,
-0.7547146, 1.26068, 0.05775242, 0.4588235, 1, 0, 1,
-0.752078, -0.6267771, -0.2776277, 0.4509804, 1, 0, 1,
-0.7517872, 0.4565883, -0.5493056, 0.4470588, 1, 0, 1,
-0.7504629, 1.174523, 0.5337661, 0.4392157, 1, 0, 1,
-0.7497669, -0.8353311, -2.787116, 0.4352941, 1, 0, 1,
-0.7412838, -0.2000335, -2.273628, 0.427451, 1, 0, 1,
-0.7390614, 0.03603356, -1.738981, 0.4235294, 1, 0, 1,
-0.7358793, 0.1201105, -0.8847915, 0.4156863, 1, 0, 1,
-0.7346905, -1.276163, -2.233704, 0.4117647, 1, 0, 1,
-0.7338887, -2.305515, -2.49715, 0.4039216, 1, 0, 1,
-0.7327371, 2.079008, 0.2304154, 0.3960784, 1, 0, 1,
-0.7315933, 1.309128, -0.3394719, 0.3921569, 1, 0, 1,
-0.7298627, -1.059625, -2.705991, 0.3843137, 1, 0, 1,
-0.7261798, -0.3029899, -2.839313, 0.3803922, 1, 0, 1,
-0.7195162, -0.4085748, -1.034092, 0.372549, 1, 0, 1,
-0.717388, 0.02578195, -2.097601, 0.3686275, 1, 0, 1,
-0.7154731, -1.01632, -1.960604, 0.3607843, 1, 0, 1,
-0.7148646, -0.6424165, -1.486133, 0.3568628, 1, 0, 1,
-0.7067929, -0.01035687, 0.1311005, 0.3490196, 1, 0, 1,
-0.7014832, -0.5340968, -1.700154, 0.345098, 1, 0, 1,
-0.6991301, -0.02203652, -1.152411, 0.3372549, 1, 0, 1,
-0.6964526, 1.242345, -0.2178917, 0.3333333, 1, 0, 1,
-0.6916881, 1.211903, -1.053578, 0.3254902, 1, 0, 1,
-0.6916151, -1.157845, -1.888328, 0.3215686, 1, 0, 1,
-0.688803, -1.103086, -1.722691, 0.3137255, 1, 0, 1,
-0.687999, -0.08649707, -1.534032, 0.3098039, 1, 0, 1,
-0.6849713, 0.2187583, -1.94247, 0.3019608, 1, 0, 1,
-0.6798073, -0.6469832, -4.822225, 0.2941177, 1, 0, 1,
-0.6735837, 0.8047782, 0.3203498, 0.2901961, 1, 0, 1,
-0.6706043, -1.565413, -3.899899, 0.282353, 1, 0, 1,
-0.6692064, -1.695166, -3.021061, 0.2784314, 1, 0, 1,
-0.6664785, -0.6151524, -3.68031, 0.2705882, 1, 0, 1,
-0.6639729, 0.2240266, -2.967059, 0.2666667, 1, 0, 1,
-0.6564748, 2.166163, 0.3183441, 0.2588235, 1, 0, 1,
-0.6524025, 1.966708, -0.9205801, 0.254902, 1, 0, 1,
-0.6442519, -0.4789285, -2.69837, 0.2470588, 1, 0, 1,
-0.6433553, 0.1001663, -0.02301361, 0.2431373, 1, 0, 1,
-0.6427559, 1.11452, -0.5229205, 0.2352941, 1, 0, 1,
-0.6389772, 0.1514682, -1.197924, 0.2313726, 1, 0, 1,
-0.6325109, -0.1159496, -0.4633601, 0.2235294, 1, 0, 1,
-0.631964, -2.011318, -0.9148999, 0.2196078, 1, 0, 1,
-0.6318062, -1.04779, -2.699756, 0.2117647, 1, 0, 1,
-0.6311935, 0.4072824, -1.520729, 0.2078431, 1, 0, 1,
-0.6311485, 0.8047228, -0.7248259, 0.2, 1, 0, 1,
-0.6291319, -2.963583, -2.93956, 0.1921569, 1, 0, 1,
-0.6259159, -0.6370971, -2.906579, 0.1882353, 1, 0, 1,
-0.6253283, 0.24233, -1.001281, 0.1803922, 1, 0, 1,
-0.623957, -1.229421, -0.5037606, 0.1764706, 1, 0, 1,
-0.6214476, -0.4618673, -0.9454181, 0.1686275, 1, 0, 1,
-0.6212286, -0.02789615, -1.280051, 0.1647059, 1, 0, 1,
-0.6208167, -0.3322166, -1.473799, 0.1568628, 1, 0, 1,
-0.6170451, -0.3447088, -2.627731, 0.1529412, 1, 0, 1,
-0.6154286, 1.553889, 1.006509, 0.145098, 1, 0, 1,
-0.614683, -2.202147, -2.858276, 0.1411765, 1, 0, 1,
-0.6140791, 0.2186479, -2.956412, 0.1333333, 1, 0, 1,
-0.6108865, 0.4458862, -1.219406, 0.1294118, 1, 0, 1,
-0.6022981, -1.926386, -2.71977, 0.1215686, 1, 0, 1,
-0.6022875, 0.09188025, -2.103142, 0.1176471, 1, 0, 1,
-0.6011368, -0.2438093, -3.012005, 0.1098039, 1, 0, 1,
-0.5992729, 0.7523996, 0.7851423, 0.1058824, 1, 0, 1,
-0.5974663, -1.707226, -2.063466, 0.09803922, 1, 0, 1,
-0.5926945, 0.7473602, -0.8377871, 0.09019608, 1, 0, 1,
-0.5916116, -0.5436581, -3.329523, 0.08627451, 1, 0, 1,
-0.5893705, 0.5974547, -0.9109507, 0.07843138, 1, 0, 1,
-0.5887303, -0.1093023, -1.312198, 0.07450981, 1, 0, 1,
-0.5804179, -0.01242581, -2.565759, 0.06666667, 1, 0, 1,
-0.5764278, 0.406236, -1.39021, 0.0627451, 1, 0, 1,
-0.5651233, -0.1289505, -2.563015, 0.05490196, 1, 0, 1,
-0.5605096, -0.7241901, -2.53387, 0.05098039, 1, 0, 1,
-0.5603604, -0.3380654, -1.753693, 0.04313726, 1, 0, 1,
-0.5599121, 0.7617177, -1.890263, 0.03921569, 1, 0, 1,
-0.559202, 0.5525615, 0.01097071, 0.03137255, 1, 0, 1,
-0.5571828, 0.5561204, 0.1808098, 0.02745098, 1, 0, 1,
-0.5564638, -0.6394191, -3.053273, 0.01960784, 1, 0, 1,
-0.5550794, 2.914899, -0.7622662, 0.01568628, 1, 0, 1,
-0.5515071, 0.8785032, -1.408151, 0.007843138, 1, 0, 1,
-0.5514253, 0.7619908, -0.9334486, 0.003921569, 1, 0, 1,
-0.5471522, 1.287987, 0.3273727, 0, 1, 0.003921569, 1,
-0.5436793, -0.6987979, -1.916909, 0, 1, 0.01176471, 1,
-0.5361039, 0.5790719, -0.6662413, 0, 1, 0.01568628, 1,
-0.5348843, 0.08467821, -0.1117655, 0, 1, 0.02352941, 1,
-0.5326908, -1.148609, -2.222025, 0, 1, 0.02745098, 1,
-0.5290984, -0.5566278, -2.876534, 0, 1, 0.03529412, 1,
-0.5273522, 0.8222927, -1.183809, 0, 1, 0.03921569, 1,
-0.5200078, -0.2266371, -2.788811, 0, 1, 0.04705882, 1,
-0.5170818, 1.062376, 0.5162395, 0, 1, 0.05098039, 1,
-0.506034, -1.597403, -3.993852, 0, 1, 0.05882353, 1,
-0.5047079, -1.013103, -4.01825, 0, 1, 0.0627451, 1,
-0.5041403, -1.175477, -2.539322, 0, 1, 0.07058824, 1,
-0.5010558, -1.061287, -3.65935, 0, 1, 0.07450981, 1,
-0.499315, -0.02585741, -1.570112, 0, 1, 0.08235294, 1,
-0.4991505, -0.7225679, -3.740555, 0, 1, 0.08627451, 1,
-0.4970407, -0.01815201, -1.254595, 0, 1, 0.09411765, 1,
-0.4919928, 2.475496, 0.6838406, 0, 1, 0.1019608, 1,
-0.4908712, -0.6801971, -3.533694, 0, 1, 0.1058824, 1,
-0.490713, -0.6818626, -2.5127, 0, 1, 0.1137255, 1,
-0.4900599, 0.4747779, -1.751478, 0, 1, 0.1176471, 1,
-0.4896518, -0.3193574, -0.685306, 0, 1, 0.1254902, 1,
-0.485262, 0.3314539, -0.3978236, 0, 1, 0.1294118, 1,
-0.481383, 0.05355899, -2.465237, 0, 1, 0.1372549, 1,
-0.479892, -0.8494967, -2.601191, 0, 1, 0.1411765, 1,
-0.4796381, 0.6554034, -1.477503, 0, 1, 0.1490196, 1,
-0.4784539, 0.6802958, -1.683241, 0, 1, 0.1529412, 1,
-0.4774307, -0.5599713, -4.200545, 0, 1, 0.1607843, 1,
-0.4766242, 0.7758751, 1.197918, 0, 1, 0.1647059, 1,
-0.4757788, -0.9251638, -3.166674, 0, 1, 0.172549, 1,
-0.4734004, 0.1431644, -1.537812, 0, 1, 0.1764706, 1,
-0.4701915, 1.626644, 1.038886, 0, 1, 0.1843137, 1,
-0.4645744, 1.727853, -1.712683, 0, 1, 0.1882353, 1,
-0.4623265, -0.5759826, -4.533543, 0, 1, 0.1960784, 1,
-0.4602634, 0.5523056, 0.04415519, 0, 1, 0.2039216, 1,
-0.460155, 1.397619, 0.5123436, 0, 1, 0.2078431, 1,
-0.4571364, -0.7522275, -0.4508928, 0, 1, 0.2156863, 1,
-0.4541621, 1.423716, -2.434985, 0, 1, 0.2196078, 1,
-0.4518056, 0.2276755, -0.5075796, 0, 1, 0.227451, 1,
-0.4510728, -0.5303997, -1.440474, 0, 1, 0.2313726, 1,
-0.4484808, 0.3186477, -2.53031, 0, 1, 0.2392157, 1,
-0.4472935, 0.367235, 0.06874561, 0, 1, 0.2431373, 1,
-0.4471016, 1.388655, -0.3395951, 0, 1, 0.2509804, 1,
-0.4447333, 0.7428722, -1.251781, 0, 1, 0.254902, 1,
-0.4440127, -0.4301175, -1.303291, 0, 1, 0.2627451, 1,
-0.4375197, -0.9096432, -2.378693, 0, 1, 0.2666667, 1,
-0.4367391, -1.296295, -2.566189, 0, 1, 0.2745098, 1,
-0.436583, -2.712928, -2.483658, 0, 1, 0.2784314, 1,
-0.43629, 0.2566532, -0.4083828, 0, 1, 0.2862745, 1,
-0.434387, 0.7698714, 0.08051793, 0, 1, 0.2901961, 1,
-0.4272581, 0.4558287, -0.3196875, 0, 1, 0.2980392, 1,
-0.4256931, -0.278416, -2.703871, 0, 1, 0.3058824, 1,
-0.4255527, -0.9143244, -2.978518, 0, 1, 0.3098039, 1,
-0.4225484, 2.200043, 0.2878718, 0, 1, 0.3176471, 1,
-0.418664, -0.5628158, -1.995657, 0, 1, 0.3215686, 1,
-0.4182411, -0.3962823, -1.7376, 0, 1, 0.3294118, 1,
-0.4138349, 0.4125901, -1.842553, 0, 1, 0.3333333, 1,
-0.41359, -0.4116337, -3.793507, 0, 1, 0.3411765, 1,
-0.4117006, -0.0845402, 0.2164922, 0, 1, 0.345098, 1,
-0.4095973, 1.794107, 0.1062764, 0, 1, 0.3529412, 1,
-0.4077495, -0.6266019, -1.753958, 0, 1, 0.3568628, 1,
-0.4056463, -0.01885563, -3.754741, 0, 1, 0.3647059, 1,
-0.4035754, 2.173194, 0.3936816, 0, 1, 0.3686275, 1,
-0.398581, -1.444316, -3.145021, 0, 1, 0.3764706, 1,
-0.39077, -0.3714207, -0.2381594, 0, 1, 0.3803922, 1,
-0.3868649, -0.177567, -3.21199, 0, 1, 0.3882353, 1,
-0.3863905, 0.8597423, 0.1311343, 0, 1, 0.3921569, 1,
-0.3853316, 0.05533652, -2.031909, 0, 1, 0.4, 1,
-0.3826268, 1.110303, -0.8053735, 0, 1, 0.4078431, 1,
-0.3802003, -0.7478827, -4.385223, 0, 1, 0.4117647, 1,
-0.3785908, -0.4945091, -2.316751, 0, 1, 0.4196078, 1,
-0.37525, -1.037421, -1.378833, 0, 1, 0.4235294, 1,
-0.3691284, 0.5385435, 0.7895072, 0, 1, 0.4313726, 1,
-0.3670486, 0.2110314, -0.06334023, 0, 1, 0.4352941, 1,
-0.3637941, 1.620851, -0.4159873, 0, 1, 0.4431373, 1,
-0.3598174, -1.440677, -3.469168, 0, 1, 0.4470588, 1,
-0.3534287, -0.4889984, -2.659847, 0, 1, 0.454902, 1,
-0.3522307, 0.3359762, -0.45807, 0, 1, 0.4588235, 1,
-0.3522293, -0.05782531, -0.2510478, 0, 1, 0.4666667, 1,
-0.3508618, -0.3652915, -2.118217, 0, 1, 0.4705882, 1,
-0.3506723, 0.6317937, -1.221371, 0, 1, 0.4784314, 1,
-0.3476636, 0.4273358, 0.1799986, 0, 1, 0.4823529, 1,
-0.3472618, -1.410826, -4.06904, 0, 1, 0.4901961, 1,
-0.3454821, 0.1773695, -1.284733, 0, 1, 0.4941176, 1,
-0.3442215, 0.4786143, -0.7454588, 0, 1, 0.5019608, 1,
-0.3431773, -0.3710732, -3.548132, 0, 1, 0.509804, 1,
-0.3369957, 0.2986741, -1.078985, 0, 1, 0.5137255, 1,
-0.3359146, 0.5813396, -1.127663, 0, 1, 0.5215687, 1,
-0.3352745, 0.1137758, -2.407555, 0, 1, 0.5254902, 1,
-0.331038, -0.7487828, -4.220431, 0, 1, 0.5333334, 1,
-0.3296433, -2.669622, -4.076712, 0, 1, 0.5372549, 1,
-0.3293393, 1.142362, -0.4460767, 0, 1, 0.5450981, 1,
-0.3247709, -2.484225, -2.635524, 0, 1, 0.5490196, 1,
-0.3231956, 0.6304546, 0.4626712, 0, 1, 0.5568628, 1,
-0.3222177, -0.4005935, -3.676474, 0, 1, 0.5607843, 1,
-0.3196808, 0.1917888, -2.249299, 0, 1, 0.5686275, 1,
-0.31861, -1.529825, -4.358444, 0, 1, 0.572549, 1,
-0.318041, 0.5149232, -1.552292, 0, 1, 0.5803922, 1,
-0.3129344, -2.176662, -4.47169, 0, 1, 0.5843138, 1,
-0.310939, -0.7278819, -2.871463, 0, 1, 0.5921569, 1,
-0.2910183, 0.7686487, -0.6708599, 0, 1, 0.5960785, 1,
-0.2869513, -1.379388, -4.73455, 0, 1, 0.6039216, 1,
-0.2865034, -0.9508826, -3.530906, 0, 1, 0.6117647, 1,
-0.2825582, -0.3992542, -1.959467, 0, 1, 0.6156863, 1,
-0.2819545, 0.4805291, 2.179493, 0, 1, 0.6235294, 1,
-0.2782768, 0.8346877, -3.195101, 0, 1, 0.627451, 1,
-0.2705833, 0.2322323, -0.9057078, 0, 1, 0.6352941, 1,
-0.2685528, -0.9798878, -2.019855, 0, 1, 0.6392157, 1,
-0.2627006, -1.488366, -3.293793, 0, 1, 0.6470588, 1,
-0.2598919, 0.9520109, -1.477209, 0, 1, 0.6509804, 1,
-0.2586125, 0.2133856, -1.222609, 0, 1, 0.6588235, 1,
-0.25473, -0.7867211, -2.627372, 0, 1, 0.6627451, 1,
-0.2529078, -0.793011, -3.668961, 0, 1, 0.6705883, 1,
-0.2526138, 0.2041033, -0.2342837, 0, 1, 0.6745098, 1,
-0.2517452, 0.2579567, -0.06217101, 0, 1, 0.682353, 1,
-0.2515734, -1.661297, -2.127096, 0, 1, 0.6862745, 1,
-0.251278, -0.4927235, -3.659347, 0, 1, 0.6941177, 1,
-0.2381273, 1.825259, -0.4583962, 0, 1, 0.7019608, 1,
-0.2371021, -2.093929, -3.387543, 0, 1, 0.7058824, 1,
-0.2321717, -0.02442824, -1.261831, 0, 1, 0.7137255, 1,
-0.2308614, -0.1852933, -1.314694, 0, 1, 0.7176471, 1,
-0.2302204, -1.100524, -3.357196, 0, 1, 0.7254902, 1,
-0.229876, -0.3001034, -1.527143, 0, 1, 0.7294118, 1,
-0.2240621, 0.8171409, -0.03596751, 0, 1, 0.7372549, 1,
-0.2187587, -0.6427297, -4.088993, 0, 1, 0.7411765, 1,
-0.2164072, -0.5015572, -2.951555, 0, 1, 0.7490196, 1,
-0.2119291, 0.9059585, 0.01085782, 0, 1, 0.7529412, 1,
-0.2097901, -0.9237131, -3.951604, 0, 1, 0.7607843, 1,
-0.2091696, -0.3805785, -2.384075, 0, 1, 0.7647059, 1,
-0.2057412, -0.8217362, -2.391061, 0, 1, 0.772549, 1,
-0.2056125, -1.095913, -3.555591, 0, 1, 0.7764706, 1,
-0.2041144, -0.6911514, -2.982736, 0, 1, 0.7843137, 1,
-0.200983, 0.8477738, -0.1527273, 0, 1, 0.7882353, 1,
-0.1985893, 1.399449, -1.38705, 0, 1, 0.7960784, 1,
-0.1954575, -0.6184995, -2.405509, 0, 1, 0.8039216, 1,
-0.1935095, -0.6060595, -3.846081, 0, 1, 0.8078431, 1,
-0.1874575, 0.003278023, -1.518271, 0, 1, 0.8156863, 1,
-0.1872473, -1.305949, -2.072464, 0, 1, 0.8196079, 1,
-0.1859611, 0.6710867, -0.2911421, 0, 1, 0.827451, 1,
-0.182881, -0.04409226, -2.693181, 0, 1, 0.8313726, 1,
-0.1812375, 0.560738, -0.8103775, 0, 1, 0.8392157, 1,
-0.1752684, 1.309992, 0.6433303, 0, 1, 0.8431373, 1,
-0.1710263, 1.19935, 0.4130584, 0, 1, 0.8509804, 1,
-0.1678985, 1.33901, 0.320511, 0, 1, 0.854902, 1,
-0.1620375, 1.311964, -1.238138, 0, 1, 0.8627451, 1,
-0.1612841, -0.807285, -3.596204, 0, 1, 0.8666667, 1,
-0.1585771, 0.8135307, 0.3076433, 0, 1, 0.8745098, 1,
-0.1582851, 1.207279, 0.7789103, 0, 1, 0.8784314, 1,
-0.1548237, 0.09652482, 0.4845287, 0, 1, 0.8862745, 1,
-0.1514073, 2.08031, -0.07490465, 0, 1, 0.8901961, 1,
-0.1491055, -1.718126, -3.526726, 0, 1, 0.8980392, 1,
-0.1432496, 1.230116, -0.4086776, 0, 1, 0.9058824, 1,
-0.1393736, -0.9455839, -5.017018, 0, 1, 0.9098039, 1,
-0.1331047, 0.3255973, 1.318745, 0, 1, 0.9176471, 1,
-0.1288734, -1.050473, -2.152969, 0, 1, 0.9215686, 1,
-0.1266621, -0.3438726, -2.535603, 0, 1, 0.9294118, 1,
-0.1262936, -1.685175, -2.380893, 0, 1, 0.9333333, 1,
-0.122392, 0.04359763, -2.95629, 0, 1, 0.9411765, 1,
-0.1222853, 1.268551, 1.695088, 0, 1, 0.945098, 1,
-0.1219796, 0.3774602, 0.1998079, 0, 1, 0.9529412, 1,
-0.1207144, -0.6343647, -3.034343, 0, 1, 0.9568627, 1,
-0.1190561, -0.3727863, -2.325699, 0, 1, 0.9647059, 1,
-0.1174983, -1.155104, -3.756137, 0, 1, 0.9686275, 1,
-0.1160132, -0.7052503, -2.279584, 0, 1, 0.9764706, 1,
-0.1125071, -0.7696265, -2.166091, 0, 1, 0.9803922, 1,
-0.109178, 1.194008, 0.405414, 0, 1, 0.9882353, 1,
-0.1028578, 0.7209281, 0.5657288, 0, 1, 0.9921569, 1,
-0.1018183, 0.04581688, 0.493335, 0, 1, 1, 1,
-0.1012882, -0.7760803, -4.077101, 0, 0.9921569, 1, 1,
-0.1012824, 1.359514, -1.670489, 0, 0.9882353, 1, 1,
-0.09855447, -1.099446, -2.169328, 0, 0.9803922, 1, 1,
-0.09525704, 1.100962, 1.072355, 0, 0.9764706, 1, 1,
-0.09481788, 1.735167, -0.227065, 0, 0.9686275, 1, 1,
-0.08927868, -0.4259552, -1.094193, 0, 0.9647059, 1, 1,
-0.08834683, 1.223764, -0.4732604, 0, 0.9568627, 1, 1,
-0.08710376, -2.466849, -1.987095, 0, 0.9529412, 1, 1,
-0.08637978, -1.112029, -1.551073, 0, 0.945098, 1, 1,
-0.08486088, 0.1247354, -0.8332515, 0, 0.9411765, 1, 1,
-0.07828605, -0.0003977901, -2.340388, 0, 0.9333333, 1, 1,
-0.07817975, -0.542932, -1.8952, 0, 0.9294118, 1, 1,
-0.07571638, 0.5679428, 0.002145925, 0, 0.9215686, 1, 1,
-0.07104772, -0.8348061, -2.090065, 0, 0.9176471, 1, 1,
-0.0676306, 1.29274, -1.252151, 0, 0.9098039, 1, 1,
-0.06443343, 1.662387, 0.02140868, 0, 0.9058824, 1, 1,
-0.05802759, 0.1956045, 0.4458952, 0, 0.8980392, 1, 1,
-0.05646357, 0.4922841, 0.4255895, 0, 0.8901961, 1, 1,
-0.05049867, -1.477157, -3.641368, 0, 0.8862745, 1, 1,
-0.04770752, 1.334757, -0.1938482, 0, 0.8784314, 1, 1,
-0.04719786, -0.03876004, -3.362191, 0, 0.8745098, 1, 1,
-0.04609991, -0.08346155, -1.617918, 0, 0.8666667, 1, 1,
-0.04229999, -0.5089685, -2.925448, 0, 0.8627451, 1, 1,
-0.04200128, 0.4812701, -0.6613063, 0, 0.854902, 1, 1,
-0.03984069, 0.5569662, -1.204073, 0, 0.8509804, 1, 1,
-0.03535177, -1.187164, -2.362191, 0, 0.8431373, 1, 1,
-0.03170805, -2.345012, -3.559055, 0, 0.8392157, 1, 1,
-0.03143222, 0.4421022, 0.6441586, 0, 0.8313726, 1, 1,
-0.03059514, -0.5971074, -4.139603, 0, 0.827451, 1, 1,
-0.03044814, 1.490216, 0.01832201, 0, 0.8196079, 1, 1,
-0.02935344, 0.3542698, 0.4280484, 0, 0.8156863, 1, 1,
-0.02829767, -0.4023337, -2.01419, 0, 0.8078431, 1, 1,
-0.024575, -0.4636348, -2.847257, 0, 0.8039216, 1, 1,
-0.02440914, 0.800865, -1.227019, 0, 0.7960784, 1, 1,
-0.02218133, 1.102495, -0.1914024, 0, 0.7882353, 1, 1,
-0.02178618, 0.4723481, -0.9418923, 0, 0.7843137, 1, 1,
-0.01914329, 1.056836, 0.04610711, 0, 0.7764706, 1, 1,
-0.007577632, 0.1549434, -1.32716, 0, 0.772549, 1, 1,
-0.006930247, 0.607654, 0.8971778, 0, 0.7647059, 1, 1,
-0.001917714, -1.698993, -3.625605, 0, 0.7607843, 1, 1,
-0.001059423, -1.133818, -2.818383, 0, 0.7529412, 1, 1,
0.00215, -0.01174635, 1.077703, 0, 0.7490196, 1, 1,
0.002959085, -0.9292744, 3.61744, 0, 0.7411765, 1, 1,
0.003811523, 1.745343, -0.07733089, 0, 0.7372549, 1, 1,
0.003866562, 0.317798, -0.436125, 0, 0.7294118, 1, 1,
0.01253565, 0.788686, 0.03490485, 0, 0.7254902, 1, 1,
0.01263059, -0.7804566, 1.903566, 0, 0.7176471, 1, 1,
0.02011647, 0.02693372, -0.2321335, 0, 0.7137255, 1, 1,
0.02327343, 1.509649, -2.051392, 0, 0.7058824, 1, 1,
0.02701274, 0.01515727, 1.40023, 0, 0.6980392, 1, 1,
0.02832619, 0.4319516, -0.8257816, 0, 0.6941177, 1, 1,
0.02874881, -0.02037995, 0.924685, 0, 0.6862745, 1, 1,
0.03237895, 0.625143, 0.6238085, 0, 0.682353, 1, 1,
0.03301917, -0.7442436, 3.751152, 0, 0.6745098, 1, 1,
0.03322269, -0.09377093, 4.027719, 0, 0.6705883, 1, 1,
0.03585048, 0.8180978, -0.4709915, 0, 0.6627451, 1, 1,
0.03846987, 0.332569, 1.437141, 0, 0.6588235, 1, 1,
0.03888227, -0.6698069, 3.56549, 0, 0.6509804, 1, 1,
0.04032193, -0.2345686, 1.655572, 0, 0.6470588, 1, 1,
0.04216243, 0.1216745, 2.000646, 0, 0.6392157, 1, 1,
0.04498418, -0.81691, 3.71404, 0, 0.6352941, 1, 1,
0.05455374, 0.729315, -1.230482, 0, 0.627451, 1, 1,
0.05811053, 0.3552084, 0.6613417, 0, 0.6235294, 1, 1,
0.05840819, -0.7197582, 2.36959, 0, 0.6156863, 1, 1,
0.058727, 0.02874018, 0.2863987, 0, 0.6117647, 1, 1,
0.05939484, 1.244948, -1.415391, 0, 0.6039216, 1, 1,
0.06201443, -1.051778, 1.887577, 0, 0.5960785, 1, 1,
0.06347971, -0.4067432, 3.119098, 0, 0.5921569, 1, 1,
0.06439094, -0.8561127, 2.747225, 0, 0.5843138, 1, 1,
0.06471344, 0.8414963, -0.3847903, 0, 0.5803922, 1, 1,
0.06472082, -0.09719637, 2.470476, 0, 0.572549, 1, 1,
0.06485836, -0.8251714, 3.714341, 0, 0.5686275, 1, 1,
0.06510188, 0.9010845, -1.083744, 0, 0.5607843, 1, 1,
0.06687476, -1.247029, 4.098941, 0, 0.5568628, 1, 1,
0.07152625, 0.6340952, 1.068103, 0, 0.5490196, 1, 1,
0.07431167, -2.238639, 4.160731, 0, 0.5450981, 1, 1,
0.07563174, -0.212299, 0.7976128, 0, 0.5372549, 1, 1,
0.08030199, -1.036354, 4.016848, 0, 0.5333334, 1, 1,
0.08051092, -0.8495568, 3.364122, 0, 0.5254902, 1, 1,
0.08186436, -0.7548571, 4.010913, 0, 0.5215687, 1, 1,
0.08189861, -1.29423, 5.238863, 0, 0.5137255, 1, 1,
0.08203223, 0.2305645, -0.0993378, 0, 0.509804, 1, 1,
0.08610424, -1.133518, 1.510333, 0, 0.5019608, 1, 1,
0.08641185, 0.7480608, -0.3492906, 0, 0.4941176, 1, 1,
0.08762785, 1.002933, 0.3808166, 0, 0.4901961, 1, 1,
0.08878831, 0.7633557, -0.3990928, 0, 0.4823529, 1, 1,
0.09040211, 0.5776814, 0.5326622, 0, 0.4784314, 1, 1,
0.0910131, 1.234885, -1.581447, 0, 0.4705882, 1, 1,
0.09346465, -0.1138596, 2.617705, 0, 0.4666667, 1, 1,
0.09359875, 0.5380629, 1.173923, 0, 0.4588235, 1, 1,
0.09403648, 0.2412549, -0.1637165, 0, 0.454902, 1, 1,
0.09411182, 0.41093, -0.6459461, 0, 0.4470588, 1, 1,
0.0946003, -1.122842, 3.971834, 0, 0.4431373, 1, 1,
0.09547914, -0.6598895, 2.395929, 0, 0.4352941, 1, 1,
0.0959495, -0.01834611, 2.584325, 0, 0.4313726, 1, 1,
0.09899925, -0.9303942, 4.540612, 0, 0.4235294, 1, 1,
0.1045145, 1.207811, -0.340579, 0, 0.4196078, 1, 1,
0.1120559, 1.470247, 1.269549, 0, 0.4117647, 1, 1,
0.1157824, 1.635023, -0.1226654, 0, 0.4078431, 1, 1,
0.1160403, 0.6357794, 0.7355219, 0, 0.4, 1, 1,
0.1190525, -0.1738261, 1.148234, 0, 0.3921569, 1, 1,
0.1222878, -0.3423694, 4.757131, 0, 0.3882353, 1, 1,
0.1259846, -0.338024, 1.651997, 0, 0.3803922, 1, 1,
0.1303863, 0.447486, 1.899486, 0, 0.3764706, 1, 1,
0.1453096, 0.743857, 1.663827, 0, 0.3686275, 1, 1,
0.1478664, 0.6488695, -0.04054945, 0, 0.3647059, 1, 1,
0.1495319, 0.3218638, -0.931177, 0, 0.3568628, 1, 1,
0.1538231, 0.415303, -1.01543, 0, 0.3529412, 1, 1,
0.1563029, 1.225586, 0.5169562, 0, 0.345098, 1, 1,
0.1572847, 0.1828593, 1.868749, 0, 0.3411765, 1, 1,
0.1582959, 0.935026, -0.07699705, 0, 0.3333333, 1, 1,
0.1618066, 0.07687739, 1.042107, 0, 0.3294118, 1, 1,
0.1653449, 0.1752959, -0.4834875, 0, 0.3215686, 1, 1,
0.1712899, 0.003400422, 2.94047, 0, 0.3176471, 1, 1,
0.1724206, -0.9569108, 2.605087, 0, 0.3098039, 1, 1,
0.1736448, -1.081257, 2.20742, 0, 0.3058824, 1, 1,
0.1787118, -0.08866569, 1.274859, 0, 0.2980392, 1, 1,
0.1850842, 0.3979769, 1.201975, 0, 0.2901961, 1, 1,
0.1893214, 0.4697502, 1.679132, 0, 0.2862745, 1, 1,
0.1893385, -0.1791472, 1.646802, 0, 0.2784314, 1, 1,
0.1945248, -0.6191462, 1.86759, 0, 0.2745098, 1, 1,
0.1949361, -1.324657, 2.541978, 0, 0.2666667, 1, 1,
0.1951013, -0.4870183, 1.848001, 0, 0.2627451, 1, 1,
0.195257, 0.1917348, 0.8694773, 0, 0.254902, 1, 1,
0.1957816, 0.2337933, -1.165337, 0, 0.2509804, 1, 1,
0.1961638, -0.6347192, 2.280898, 0, 0.2431373, 1, 1,
0.1978129, 1.015699, 1.680967, 0, 0.2392157, 1, 1,
0.2001106, 0.5761214, 1.693933, 0, 0.2313726, 1, 1,
0.2033415, 1.498479, 0.4796003, 0, 0.227451, 1, 1,
0.2037397, -1.04223, 2.176494, 0, 0.2196078, 1, 1,
0.2060343, -0.05007806, -0.6631476, 0, 0.2156863, 1, 1,
0.2065598, 1.375616, -0.9054463, 0, 0.2078431, 1, 1,
0.2121008, -0.4230667, 3.86506, 0, 0.2039216, 1, 1,
0.2170623, -0.5708213, 2.31148, 0, 0.1960784, 1, 1,
0.2175416, 1.123766, 0.9647074, 0, 0.1882353, 1, 1,
0.2217872, -0.490468, 3.633304, 0, 0.1843137, 1, 1,
0.222338, -0.3911894, 4.364967, 0, 0.1764706, 1, 1,
0.2280283, 0.564208, 1.142823, 0, 0.172549, 1, 1,
0.2284488, 1.410302, -0.7141091, 0, 0.1647059, 1, 1,
0.2329419, -0.1312595, 3.161755, 0, 0.1607843, 1, 1,
0.2331348, -1.16326, 4.175251, 0, 0.1529412, 1, 1,
0.2394284, 0.147614, -0.3210352, 0, 0.1490196, 1, 1,
0.2396799, -1.056743, 0.5013486, 0, 0.1411765, 1, 1,
0.2443442, -0.4819995, 1.877886, 0, 0.1372549, 1, 1,
0.247299, 0.08580253, 2.221795, 0, 0.1294118, 1, 1,
0.2495416, -0.6830046, 2.843461, 0, 0.1254902, 1, 1,
0.2496269, 0.1234391, 0.6291499, 0, 0.1176471, 1, 1,
0.2496278, -1.833816, 4.160109, 0, 0.1137255, 1, 1,
0.2531484, 0.2927672, 1.395005, 0, 0.1058824, 1, 1,
0.2597038, 1.077474, -0.2914686, 0, 0.09803922, 1, 1,
0.2607222, 0.9179486, 0.5554656, 0, 0.09411765, 1, 1,
0.2608345, 0.5026612, 1.601907, 0, 0.08627451, 1, 1,
0.2615512, -0.8952032, 3.548799, 0, 0.08235294, 1, 1,
0.2642054, -0.4444951, 2.11526, 0, 0.07450981, 1, 1,
0.2665565, 1.852687, -0.5256835, 0, 0.07058824, 1, 1,
0.2728893, -0.4678412, 2.631452, 0, 0.0627451, 1, 1,
0.2783304, -1.540331, 4.931289, 0, 0.05882353, 1, 1,
0.2789086, 0.7004758, 1.971448, 0, 0.05098039, 1, 1,
0.2814428, 0.6188195, 0.4546483, 0, 0.04705882, 1, 1,
0.2841672, 1.138107, 0.4427186, 0, 0.03921569, 1, 1,
0.2844627, -0.8845717, 3.525086, 0, 0.03529412, 1, 1,
0.2858337, 1.116322, 1.946356, 0, 0.02745098, 1, 1,
0.2943058, 0.76204, 1.540761, 0, 0.02352941, 1, 1,
0.3051101, -0.6688812, 1.43759, 0, 0.01568628, 1, 1,
0.305775, 0.7255929, 0.7563586, 0, 0.01176471, 1, 1,
0.3064663, 0.6546805, -1.236771, 0, 0.003921569, 1, 1,
0.3076549, -1.147059, 2.369872, 0.003921569, 0, 1, 1,
0.3102283, 0.124574, 0.2900262, 0.007843138, 0, 1, 1,
0.3104743, 0.7499977, 2.780873, 0.01568628, 0, 1, 1,
0.3122368, 0.6180393, 0.4430439, 0.01960784, 0, 1, 1,
0.3138335, 0.2542264, 2.170996, 0.02745098, 0, 1, 1,
0.314338, 0.6175579, 0.4454103, 0.03137255, 0, 1, 1,
0.3166091, -1.567062, 2.793334, 0.03921569, 0, 1, 1,
0.3192329, -0.09551512, 2.477803, 0.04313726, 0, 1, 1,
0.3199207, 0.4901302, 0.793053, 0.05098039, 0, 1, 1,
0.320169, 1.589736, -2.158272, 0.05490196, 0, 1, 1,
0.3217807, -0.1309492, 1.48553, 0.0627451, 0, 1, 1,
0.3290027, 1.106017, 0.442142, 0.06666667, 0, 1, 1,
0.3338453, 2.123013, 0.04727644, 0.07450981, 0, 1, 1,
0.3387108, 0.5088148, 0.06914882, 0.07843138, 0, 1, 1,
0.3392821, -1.906517, 1.893592, 0.08627451, 0, 1, 1,
0.3406815, 0.7572344, 0.9654225, 0.09019608, 0, 1, 1,
0.346679, -0.6299928, 2.004327, 0.09803922, 0, 1, 1,
0.3476415, -0.942956, 3.765549, 0.1058824, 0, 1, 1,
0.3485558, 1.210145, 1.269252, 0.1098039, 0, 1, 1,
0.3537407, 0.1428951, 2.890975, 0.1176471, 0, 1, 1,
0.3554227, 0.0132169, 1.317345, 0.1215686, 0, 1, 1,
0.3563962, -0.8945797, 1.589285, 0.1294118, 0, 1, 1,
0.3588032, -1.486361, 2.866361, 0.1333333, 0, 1, 1,
0.3605846, -1.160383, 3.043261, 0.1411765, 0, 1, 1,
0.3643588, -0.188933, 0.6908688, 0.145098, 0, 1, 1,
0.3654654, 1.387698, 0.2837825, 0.1529412, 0, 1, 1,
0.3664404, 1.446536, 0.69827, 0.1568628, 0, 1, 1,
0.3681318, -0.559888, 3.004229, 0.1647059, 0, 1, 1,
0.3686055, -0.4160891, 2.926308, 0.1686275, 0, 1, 1,
0.3725773, 0.4353682, -0.8296086, 0.1764706, 0, 1, 1,
0.3732159, -0.2658838, 0.809851, 0.1803922, 0, 1, 1,
0.3772919, -0.4137734, 2.569441, 0.1882353, 0, 1, 1,
0.3776412, 0.1040586, 1.755581, 0.1921569, 0, 1, 1,
0.3799668, -0.07029445, 0.9586839, 0.2, 0, 1, 1,
0.382928, 1.213544, 0.7924582, 0.2078431, 0, 1, 1,
0.3903507, 0.380915, -0.09320562, 0.2117647, 0, 1, 1,
0.3929, -1.099016, 4.285141, 0.2196078, 0, 1, 1,
0.4039603, 1.495531, 0.5254947, 0.2235294, 0, 1, 1,
0.4050835, 1.816593, -1.070927, 0.2313726, 0, 1, 1,
0.4082766, -1.283698, 2.203122, 0.2352941, 0, 1, 1,
0.4106406, -0.2220962, 2.573336, 0.2431373, 0, 1, 1,
0.4204694, -0.6735222, 1.477798, 0.2470588, 0, 1, 1,
0.423536, -0.04818863, 2.304446, 0.254902, 0, 1, 1,
0.4259396, -0.0266624, 0.4131508, 0.2588235, 0, 1, 1,
0.4270533, 1.19473, 0.1336862, 0.2666667, 0, 1, 1,
0.4271408, -1.121167, 2.302679, 0.2705882, 0, 1, 1,
0.4274775, 0.5180737, 0.9632986, 0.2784314, 0, 1, 1,
0.4288494, 0.7627856, 2.969259, 0.282353, 0, 1, 1,
0.4288949, 0.6351187, 0.07493618, 0.2901961, 0, 1, 1,
0.4289291, -0.6613064, 3.117801, 0.2941177, 0, 1, 1,
0.436489, 1.735783, 0.1670939, 0.3019608, 0, 1, 1,
0.4369728, -2.06734, 1.632167, 0.3098039, 0, 1, 1,
0.4439685, 0.1479063, -0.4771558, 0.3137255, 0, 1, 1,
0.4477672, 1.008227, -0.3392827, 0.3215686, 0, 1, 1,
0.4516104, -0.3603583, 2.264031, 0.3254902, 0, 1, 1,
0.4524032, -0.4618858, 2.665983, 0.3333333, 0, 1, 1,
0.455772, -1.03586, 2.310044, 0.3372549, 0, 1, 1,
0.4590619, 1.042115, 0.2696325, 0.345098, 0, 1, 1,
0.459686, 0.7728366, 1.839128, 0.3490196, 0, 1, 1,
0.4606513, -0.410379, 2.909286, 0.3568628, 0, 1, 1,
0.4709774, 0.3750843, 1.749178, 0.3607843, 0, 1, 1,
0.4763994, 1.524599, 0.2085401, 0.3686275, 0, 1, 1,
0.4804892, 0.5648052, 0.544845, 0.372549, 0, 1, 1,
0.4806373, 0.3529944, 0.8547617, 0.3803922, 0, 1, 1,
0.4867203, 0.05416248, 2.845913, 0.3843137, 0, 1, 1,
0.4906774, 0.2930123, 0.9459559, 0.3921569, 0, 1, 1,
0.4950759, -0.6768624, 1.051909, 0.3960784, 0, 1, 1,
0.4966979, 0.671848, 0.1736448, 0.4039216, 0, 1, 1,
0.5005106, 0.4007092, 1.97432, 0.4117647, 0, 1, 1,
0.5006728, 0.7474514, 0.7602345, 0.4156863, 0, 1, 1,
0.5013389, -0.4081244, 0.6152207, 0.4235294, 0, 1, 1,
0.5068727, -1.236426, 2.788502, 0.427451, 0, 1, 1,
0.5081404, 1.479478, 0.9136358, 0.4352941, 0, 1, 1,
0.5093343, 4.003652, 0.68822, 0.4392157, 0, 1, 1,
0.5116094, -0.1215661, 2.231441, 0.4470588, 0, 1, 1,
0.5149471, -0.7940154, 3.429065, 0.4509804, 0, 1, 1,
0.515511, 0.1062984, 3.874501, 0.4588235, 0, 1, 1,
0.5178847, -0.05519485, 1.12534, 0.4627451, 0, 1, 1,
0.5179073, 1.390575, 0.3440758, 0.4705882, 0, 1, 1,
0.5225631, 1.799643, -0.3989875, 0.4745098, 0, 1, 1,
0.5380628, -0.2290948, 0.5787489, 0.4823529, 0, 1, 1,
0.5396876, 1.915363, -0.695673, 0.4862745, 0, 1, 1,
0.5410924, -0.230036, 1.93623, 0.4941176, 0, 1, 1,
0.543182, 0.7206694, -0.1027309, 0.5019608, 0, 1, 1,
0.561183, 2.19105, 0.9024984, 0.5058824, 0, 1, 1,
0.561912, 0.1052831, -0.3379326, 0.5137255, 0, 1, 1,
0.5625073, -1.39292, 2.510256, 0.5176471, 0, 1, 1,
0.5651063, 0.5136769, 1.324885, 0.5254902, 0, 1, 1,
0.5658154, 0.4771891, -0.3294859, 0.5294118, 0, 1, 1,
0.5785443, 0.3213403, -0.40944, 0.5372549, 0, 1, 1,
0.5836344, 0.6986619, 1.912089, 0.5411765, 0, 1, 1,
0.5890425, 0.02109251, 0.7844786, 0.5490196, 0, 1, 1,
0.5907313, -1.307296, 3.311537, 0.5529412, 0, 1, 1,
0.591238, 0.5363426, -0.8941019, 0.5607843, 0, 1, 1,
0.5950631, 0.2046508, 1.07289, 0.5647059, 0, 1, 1,
0.5993072, -0.5798038, 2.633632, 0.572549, 0, 1, 1,
0.5994667, -1.24318, 2.242455, 0.5764706, 0, 1, 1,
0.6044241, -0.3378782, 3.616169, 0.5843138, 0, 1, 1,
0.6052855, 1.669669, 0.4448947, 0.5882353, 0, 1, 1,
0.6146493, -0.2686036, 2.173323, 0.5960785, 0, 1, 1,
0.6213893, 1.847696, -0.5100347, 0.6039216, 0, 1, 1,
0.6289315, 1.306718, -0.03570417, 0.6078432, 0, 1, 1,
0.634458, 1.02283, 0.7325796, 0.6156863, 0, 1, 1,
0.634709, 1.69188, 1.401795, 0.6196079, 0, 1, 1,
0.6408992, 1.724051, 0.9527781, 0.627451, 0, 1, 1,
0.6468651, 0.03157351, 0.01091335, 0.6313726, 0, 1, 1,
0.6522935, 0.02803759, -0.2072706, 0.6392157, 0, 1, 1,
0.6526524, 1.663432, -1.487522, 0.6431373, 0, 1, 1,
0.6556945, 0.1460301, 2.507596, 0.6509804, 0, 1, 1,
0.6565773, 0.4788806, 1.12936, 0.654902, 0, 1, 1,
0.6661929, 1.122224, -0.5382968, 0.6627451, 0, 1, 1,
0.6662019, -1.52202, 1.61909, 0.6666667, 0, 1, 1,
0.6676493, -1.654289, 3.307163, 0.6745098, 0, 1, 1,
0.6702747, -2.328111, 1.8829, 0.6784314, 0, 1, 1,
0.6734217, -1.229225, 2.182191, 0.6862745, 0, 1, 1,
0.6756468, -2.180674, 4.036294, 0.6901961, 0, 1, 1,
0.6756896, 1.17513, 0.08837302, 0.6980392, 0, 1, 1,
0.6849788, -0.4789953, 2.321525, 0.7058824, 0, 1, 1,
0.6873338, -0.02399979, 0.7305108, 0.7098039, 0, 1, 1,
0.6877734, 0.2997231, 1.937584, 0.7176471, 0, 1, 1,
0.7032171, -1.118851, 3.319859, 0.7215686, 0, 1, 1,
0.7038684, 0.7448692, 1.494693, 0.7294118, 0, 1, 1,
0.7115845, 2.206377, 1.971121, 0.7333333, 0, 1, 1,
0.7124632, 0.1273761, 1.791847, 0.7411765, 0, 1, 1,
0.7210888, -0.5335298, 1.978703, 0.7450981, 0, 1, 1,
0.7284709, -0.7739097, 1.775892, 0.7529412, 0, 1, 1,
0.738227, -0.1803276, 2.335783, 0.7568628, 0, 1, 1,
0.7387228, 0.8186475, 1.423764, 0.7647059, 0, 1, 1,
0.7393827, 0.1259123, 2.374546, 0.7686275, 0, 1, 1,
0.7430688, 0.4178735, 2.092314, 0.7764706, 0, 1, 1,
0.7437435, -1.522644, 2.43792, 0.7803922, 0, 1, 1,
0.7437519, -0.1445705, 2.775534, 0.7882353, 0, 1, 1,
0.7467221, -0.4056165, 2.369998, 0.7921569, 0, 1, 1,
0.7506229, 0.656747, 0.004879112, 0.8, 0, 1, 1,
0.7630506, 0.6787072, 0.8835572, 0.8078431, 0, 1, 1,
0.7688487, -1.158765, 2.113028, 0.8117647, 0, 1, 1,
0.7731325, -0.4073501, 1.479897, 0.8196079, 0, 1, 1,
0.7732103, 1.068879, -1.407658, 0.8235294, 0, 1, 1,
0.7736304, 0.2909569, 0.6534798, 0.8313726, 0, 1, 1,
0.777199, -0.3655585, 2.400356, 0.8352941, 0, 1, 1,
0.7815208, -0.1683344, 3.441842, 0.8431373, 0, 1, 1,
0.7827215, 2.017453, 0.9520789, 0.8470588, 0, 1, 1,
0.7846777, 0.4507565, 1.004339, 0.854902, 0, 1, 1,
0.7880348, 0.1955722, 0.5407243, 0.8588235, 0, 1, 1,
0.7897021, -0.3762008, 3.905411, 0.8666667, 0, 1, 1,
0.804244, 1.450395, 2.328988, 0.8705882, 0, 1, 1,
0.804715, 0.8137085, -0.9867299, 0.8784314, 0, 1, 1,
0.8062844, 0.8829102, 1.168338, 0.8823529, 0, 1, 1,
0.8067318, 0.3122816, 0.9252281, 0.8901961, 0, 1, 1,
0.807196, 0.2277247, 1.279355, 0.8941177, 0, 1, 1,
0.8079163, -0.04817713, -0.7541541, 0.9019608, 0, 1, 1,
0.8080752, -0.08554512, 2.429118, 0.9098039, 0, 1, 1,
0.8083581, -1.048606, 3.571418, 0.9137255, 0, 1, 1,
0.8185432, 0.4652326, 1.638109, 0.9215686, 0, 1, 1,
0.8188636, 1.505112, 2.106583, 0.9254902, 0, 1, 1,
0.8201251, 0.01148635, 1.328165, 0.9333333, 0, 1, 1,
0.8279783, -0.6946913, 0.6370598, 0.9372549, 0, 1, 1,
0.8281949, -2.249902, 2.753442, 0.945098, 0, 1, 1,
0.8288313, 0.463837, 2.044492, 0.9490196, 0, 1, 1,
0.8323413, 0.177551, 0.724208, 0.9568627, 0, 1, 1,
0.8333257, -1.8156, 2.88072, 0.9607843, 0, 1, 1,
0.8335094, 1.715093, -0.3575089, 0.9686275, 0, 1, 1,
0.8335342, 1.24601, 0.9984891, 0.972549, 0, 1, 1,
0.8345518, -0.262812, -0.1788873, 0.9803922, 0, 1, 1,
0.8371047, 0.7696028, 1.437487, 0.9843137, 0, 1, 1,
0.8402993, 1.78597, -1.309719, 0.9921569, 0, 1, 1,
0.8429505, 0.8008518, 0.3418707, 0.9960784, 0, 1, 1,
0.848192, 0.3770776, 0.2352113, 1, 0, 0.9960784, 1,
0.8492028, 1.798334, 1.459815, 1, 0, 0.9882353, 1,
0.8537961, -0.005431198, 1.514786, 1, 0, 0.9843137, 1,
0.8564481, -0.8866624, 2.026165, 1, 0, 0.9764706, 1,
0.8591768, 0.04689937, 2.038997, 1, 0, 0.972549, 1,
0.8601398, -0.8709877, 2.644984, 1, 0, 0.9647059, 1,
0.864181, 0.7430704, 0.5162328, 1, 0, 0.9607843, 1,
0.8767768, -1.1618, 1.092638, 1, 0, 0.9529412, 1,
0.8811585, -0.3767153, 2.208496, 1, 0, 0.9490196, 1,
0.8893457, 1.199506, -0.2385798, 1, 0, 0.9411765, 1,
0.8973481, 0.9204904, 1.592959, 1, 0, 0.9372549, 1,
0.9015894, 1.479685, -0.7066551, 1, 0, 0.9294118, 1,
0.9062727, 0.2641484, 1.115752, 1, 0, 0.9254902, 1,
0.9104869, 0.5104437, 2.323331, 1, 0, 0.9176471, 1,
0.9255921, -0.7888123, 3.422154, 1, 0, 0.9137255, 1,
0.9268216, 0.7391284, 0.7151114, 1, 0, 0.9058824, 1,
0.9310801, 0.6527525, 1.212529, 1, 0, 0.9019608, 1,
0.9342967, -0.4264786, 1.383746, 1, 0, 0.8941177, 1,
0.9350242, -0.639163, 3.396425, 1, 0, 0.8862745, 1,
0.9375473, -0.8041105, 2.132891, 1, 0, 0.8823529, 1,
0.9407597, -1.227932, 2.928303, 1, 0, 0.8745098, 1,
0.9426233, 1.927768, 0.6857888, 1, 0, 0.8705882, 1,
0.9430169, -1.802285, 3.127886, 1, 0, 0.8627451, 1,
0.944603, 0.3658629, 0.6999546, 1, 0, 0.8588235, 1,
0.9454923, 2.369521, -0.4315936, 1, 0, 0.8509804, 1,
0.9473705, 1.037099, 0.6184725, 1, 0, 0.8470588, 1,
0.9518546, 0.3911853, 1.316266, 1, 0, 0.8392157, 1,
0.9666918, -0.8454506, 3.328432, 1, 0, 0.8352941, 1,
0.9861167, 0.6195505, 2.39601, 1, 0, 0.827451, 1,
1.003209, 1.346048, 1.719656, 1, 0, 0.8235294, 1,
1.004325, 1.696544, -0.7250334, 1, 0, 0.8156863, 1,
1.007959, -0.8861284, 2.742863, 1, 0, 0.8117647, 1,
1.027786, 0.07330339, 0.7588947, 1, 0, 0.8039216, 1,
1.031845, -0.3832822, 1.753843, 1, 0, 0.7960784, 1,
1.037538, -0.2210648, 0.6577784, 1, 0, 0.7921569, 1,
1.038594, -1.412594, 2.292669, 1, 0, 0.7843137, 1,
1.048546, -0.8957935, 0.260248, 1, 0, 0.7803922, 1,
1.061237, -0.1081267, 1.964007, 1, 0, 0.772549, 1,
1.067425, 2.122063, 0.07909985, 1, 0, 0.7686275, 1,
1.068036, 1.535515, -0.255533, 1, 0, 0.7607843, 1,
1.076589, 1.355432, 1.168905, 1, 0, 0.7568628, 1,
1.079963, -0.2638582, 2.681802, 1, 0, 0.7490196, 1,
1.080842, 0.5206518, 2.209719, 1, 0, 0.7450981, 1,
1.08397, -0.1869911, 2.76509, 1, 0, 0.7372549, 1,
1.089456, 1.273476, 2.333815, 1, 0, 0.7333333, 1,
1.102685, 1.007714, -1.97166, 1, 0, 0.7254902, 1,
1.109768, -0.4320255, 1.045492, 1, 0, 0.7215686, 1,
1.111872, -0.5561407, 2.912592, 1, 0, 0.7137255, 1,
1.113817, 1.240371, 2.158619, 1, 0, 0.7098039, 1,
1.116304, 1.581737, 1.005766, 1, 0, 0.7019608, 1,
1.117803, 0.4744407, 1.408783, 1, 0, 0.6941177, 1,
1.130756, -0.007430359, 1.882915, 1, 0, 0.6901961, 1,
1.133626, 0.6369333, 0.7549401, 1, 0, 0.682353, 1,
1.135021, 1.58095, -0.3578258, 1, 0, 0.6784314, 1,
1.147901, 0.6317582, 1.757302, 1, 0, 0.6705883, 1,
1.151534, 0.2081027, 2.14781, 1, 0, 0.6666667, 1,
1.172497, -0.3464923, 1.068184, 1, 0, 0.6588235, 1,
1.183369, -0.7826312, 1.201823, 1, 0, 0.654902, 1,
1.188087, -0.2196902, 2.913429, 1, 0, 0.6470588, 1,
1.191936, -0.2397041, 1.86935, 1, 0, 0.6431373, 1,
1.192676, 1.147167, 0.3117933, 1, 0, 0.6352941, 1,
1.194535, -0.2009884, -0.4828846, 1, 0, 0.6313726, 1,
1.209643, -1.812076, 2.318682, 1, 0, 0.6235294, 1,
1.216783, -0.6920862, 1.834869, 1, 0, 0.6196079, 1,
1.217343, 0.1505616, 2.922415, 1, 0, 0.6117647, 1,
1.233698, -1.226988, 1.823971, 1, 0, 0.6078432, 1,
1.248555, 0.5881629, -0.9496441, 1, 0, 0.6, 1,
1.251958, 0.2020046, 2.981407, 1, 0, 0.5921569, 1,
1.25298, -1.185364, 3.572734, 1, 0, 0.5882353, 1,
1.253154, -0.6729276, 2.393465, 1, 0, 0.5803922, 1,
1.257884, -1.086322, 3.786134, 1, 0, 0.5764706, 1,
1.263445, 1.288201, 0.4031591, 1, 0, 0.5686275, 1,
1.27189, 2.552708, 0.9348122, 1, 0, 0.5647059, 1,
1.272472, -0.9434859, 1.356218, 1, 0, 0.5568628, 1,
1.277643, -0.4876326, 1.198876, 1, 0, 0.5529412, 1,
1.277709, 0.2660543, 1.928739, 1, 0, 0.5450981, 1,
1.302646, -0.03838715, -0.01469041, 1, 0, 0.5411765, 1,
1.304561, -0.5037302, 2.540451, 1, 0, 0.5333334, 1,
1.307644, -0.1872878, 2.183927, 1, 0, 0.5294118, 1,
1.316054, -0.002890548, 1.28767, 1, 0, 0.5215687, 1,
1.317582, -1.279459, 2.024278, 1, 0, 0.5176471, 1,
1.323674, 2.20049, -0.1892923, 1, 0, 0.509804, 1,
1.326655, 0.8478813, -0.7079623, 1, 0, 0.5058824, 1,
1.328367, 1.873291, 1.294284, 1, 0, 0.4980392, 1,
1.329257, -1.629151, 0.4026752, 1, 0, 0.4901961, 1,
1.352997, 1.695312, 2.086015, 1, 0, 0.4862745, 1,
1.354529, -1.477429, 2.365304, 1, 0, 0.4784314, 1,
1.365121, 0.478599, 1.742318, 1, 0, 0.4745098, 1,
1.371908, -1.128631, 1.986852, 1, 0, 0.4666667, 1,
1.372239, 0.3615039, 1.072769, 1, 0, 0.4627451, 1,
1.386031, -0.2874228, 0.7672166, 1, 0, 0.454902, 1,
1.388864, 0.9510682, -0.735207, 1, 0, 0.4509804, 1,
1.395555, -1.343622, 2.223831, 1, 0, 0.4431373, 1,
1.398442, 1.696306, 0.2819613, 1, 0, 0.4392157, 1,
1.404558, -0.8073558, 4.933733, 1, 0, 0.4313726, 1,
1.416446, -0.8297756, 1.142757, 1, 0, 0.427451, 1,
1.42708, -0.1337745, 0.1719797, 1, 0, 0.4196078, 1,
1.429998, 0.1800279, 0.6694353, 1, 0, 0.4156863, 1,
1.445338, 0.428222, 0.007432948, 1, 0, 0.4078431, 1,
1.466079, -3.105581, 2.420644, 1, 0, 0.4039216, 1,
1.471059, -0.577053, 1.89012, 1, 0, 0.3960784, 1,
1.501631, -0.7812637, 1.403275, 1, 0, 0.3882353, 1,
1.514085, -0.6106435, 2.257659, 1, 0, 0.3843137, 1,
1.514689, -1.504484, 2.391963, 1, 0, 0.3764706, 1,
1.520125, 1.520291, 1.294781, 1, 0, 0.372549, 1,
1.525423, 0.4156704, 0.3014389, 1, 0, 0.3647059, 1,
1.528162, 1.374569, 1.957399, 1, 0, 0.3607843, 1,
1.538684, -0.8398718, 2.56737, 1, 0, 0.3529412, 1,
1.562327, 0.8937913, 1.773266, 1, 0, 0.3490196, 1,
1.585598, 0.3537301, 1.360024, 1, 0, 0.3411765, 1,
1.591945, 0.9197414, 1.237267, 1, 0, 0.3372549, 1,
1.613097, 1.724898, 2.233927, 1, 0, 0.3294118, 1,
1.654885, 1.034003, -0.3123653, 1, 0, 0.3254902, 1,
1.660069, -0.464597, 0.4730251, 1, 0, 0.3176471, 1,
1.679829, 0.1968118, 1.366848, 1, 0, 0.3137255, 1,
1.685462, 0.1767997, 0.1527653, 1, 0, 0.3058824, 1,
1.686577, -0.3772684, 0.6442082, 1, 0, 0.2980392, 1,
1.695639, 1.054521, -0.5092996, 1, 0, 0.2941177, 1,
1.721836, 0.1723607, 1.284159, 1, 0, 0.2862745, 1,
1.739272, 1.210881, 2.086715, 1, 0, 0.282353, 1,
1.741226, -0.2930364, 2.081001, 1, 0, 0.2745098, 1,
1.745924, -0.4610055, 1.475381, 1, 0, 0.2705882, 1,
1.754376, 1.063957, 1.065798, 1, 0, 0.2627451, 1,
1.770326, -1.439918, 1.790469, 1, 0, 0.2588235, 1,
1.806234, -0.2066082, 1.5921, 1, 0, 0.2509804, 1,
1.806954, 1.384946, 1.058689, 1, 0, 0.2470588, 1,
1.817729, -1.07321, 1.09389, 1, 0, 0.2392157, 1,
1.856193, 1.378101, 1.575657, 1, 0, 0.2352941, 1,
1.861422, 0.1906375, 0.703343, 1, 0, 0.227451, 1,
1.872024, 0.3231279, 1.970902, 1, 0, 0.2235294, 1,
1.879685, -0.2382297, 0.03733034, 1, 0, 0.2156863, 1,
1.88219, 0.8516166, 1.650215, 1, 0, 0.2117647, 1,
1.888691, -0.9130162, 2.595986, 1, 0, 0.2039216, 1,
1.900258, -0.8734614, 3.057576, 1, 0, 0.1960784, 1,
1.912771, 1.128003, 1.630087, 1, 0, 0.1921569, 1,
1.973121, 0.8415967, 1.172813, 1, 0, 0.1843137, 1,
1.978279, -0.4767842, 0.4254488, 1, 0, 0.1803922, 1,
1.987254, 1.229804, 0.4548089, 1, 0, 0.172549, 1,
1.98929, 1.125318, 1.474498, 1, 0, 0.1686275, 1,
2.003928, 1.294047, 0.8534881, 1, 0, 0.1607843, 1,
2.018937, -1.035884, 0.2423151, 1, 0, 0.1568628, 1,
2.033521, -0.1849462, 1.415886, 1, 0, 0.1490196, 1,
2.038671, -0.5841369, 1.089277, 1, 0, 0.145098, 1,
2.106992, 0.5925848, 1.200974, 1, 0, 0.1372549, 1,
2.109903, -1.446233, 0.25371, 1, 0, 0.1333333, 1,
2.128541, 0.5199835, 1.892377, 1, 0, 0.1254902, 1,
2.129212, 0.9302587, 1.778113, 1, 0, 0.1215686, 1,
2.130952, 0.3668415, 0.2631322, 1, 0, 0.1137255, 1,
2.161317, 0.6378264, 3.021924, 1, 0, 0.1098039, 1,
2.16401, 0.469532, -0.2587036, 1, 0, 0.1019608, 1,
2.166829, 1.17376, 1.898911, 1, 0, 0.09411765, 1,
2.212525, 0.1642667, 1.666557, 1, 0, 0.09019608, 1,
2.280418, 0.9301308, 1.818037, 1, 0, 0.08235294, 1,
2.304977, -0.984939, 0.03614985, 1, 0, 0.07843138, 1,
2.318365, -0.6221917, 1.812302, 1, 0, 0.07058824, 1,
2.34319, -0.1621034, 1.159861, 1, 0, 0.06666667, 1,
2.350926, -0.1183084, 2.11521, 1, 0, 0.05882353, 1,
2.358412, -0.5115898, 0.8636293, 1, 0, 0.05490196, 1,
2.510402, 1.451522, 1.818285, 1, 0, 0.04705882, 1,
2.6175, -1.263775, 0.6695294, 1, 0, 0.04313726, 1,
2.634445, -1.631662, 1.329035, 1, 0, 0.03529412, 1,
2.729994, -0.06392355, 1.771526, 1, 0, 0.03137255, 1,
2.797443, 1.05722, 0.06412248, 1, 0, 0.02352941, 1,
2.812104, -0.4040972, -0.5669358, 1, 0, 0.01960784, 1,
3.18653, -0.7115394, 1.217924, 1, 0, 0.01176471, 1,
3.412957, -1.266694, 1.853735, 1, 0, 0.007843138, 1
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
-0.002713919, -4.310596, -6.75539, 0, -0.5, 0.5, 0.5,
-0.002713919, -4.310596, -6.75539, 1, -0.5, 0.5, 0.5,
-0.002713919, -4.310596, -6.75539, 1, 1.5, 0.5, 0.5,
-0.002713919, -4.310596, -6.75539, 0, 1.5, 0.5, 0.5
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
-4.576297, 0.4490352, -6.75539, 0, -0.5, 0.5, 0.5,
-4.576297, 0.4490352, -6.75539, 1, -0.5, 0.5, 0.5,
-4.576297, 0.4490352, -6.75539, 1, 1.5, 0.5, 0.5,
-4.576297, 0.4490352, -6.75539, 0, 1.5, 0.5, 0.5
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
-4.576297, -4.310596, 0.1109221, 0, -0.5, 0.5, 0.5,
-4.576297, -4.310596, 0.1109221, 1, -0.5, 0.5, 0.5,
-4.576297, -4.310596, 0.1109221, 1, 1.5, 0.5, 0.5,
-4.576297, -4.310596, 0.1109221, 0, 1.5, 0.5, 0.5
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
-3, -3.21222, -5.170856,
3, -3.21222, -5.170856,
-3, -3.21222, -5.170856,
-3, -3.395283, -5.434946,
-2, -3.21222, -5.170856,
-2, -3.395283, -5.434946,
-1, -3.21222, -5.170856,
-1, -3.395283, -5.434946,
0, -3.21222, -5.170856,
0, -3.395283, -5.434946,
1, -3.21222, -5.170856,
1, -3.395283, -5.434946,
2, -3.21222, -5.170856,
2, -3.395283, -5.434946,
3, -3.21222, -5.170856,
3, -3.395283, -5.434946
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
-3, -3.761408, -5.963123, 0, -0.5, 0.5, 0.5,
-3, -3.761408, -5.963123, 1, -0.5, 0.5, 0.5,
-3, -3.761408, -5.963123, 1, 1.5, 0.5, 0.5,
-3, -3.761408, -5.963123, 0, 1.5, 0.5, 0.5,
-2, -3.761408, -5.963123, 0, -0.5, 0.5, 0.5,
-2, -3.761408, -5.963123, 1, -0.5, 0.5, 0.5,
-2, -3.761408, -5.963123, 1, 1.5, 0.5, 0.5,
-2, -3.761408, -5.963123, 0, 1.5, 0.5, 0.5,
-1, -3.761408, -5.963123, 0, -0.5, 0.5, 0.5,
-1, -3.761408, -5.963123, 1, -0.5, 0.5, 0.5,
-1, -3.761408, -5.963123, 1, 1.5, 0.5, 0.5,
-1, -3.761408, -5.963123, 0, 1.5, 0.5, 0.5,
0, -3.761408, -5.963123, 0, -0.5, 0.5, 0.5,
0, -3.761408, -5.963123, 1, -0.5, 0.5, 0.5,
0, -3.761408, -5.963123, 1, 1.5, 0.5, 0.5,
0, -3.761408, -5.963123, 0, 1.5, 0.5, 0.5,
1, -3.761408, -5.963123, 0, -0.5, 0.5, 0.5,
1, -3.761408, -5.963123, 1, -0.5, 0.5, 0.5,
1, -3.761408, -5.963123, 1, 1.5, 0.5, 0.5,
1, -3.761408, -5.963123, 0, 1.5, 0.5, 0.5,
2, -3.761408, -5.963123, 0, -0.5, 0.5, 0.5,
2, -3.761408, -5.963123, 1, -0.5, 0.5, 0.5,
2, -3.761408, -5.963123, 1, 1.5, 0.5, 0.5,
2, -3.761408, -5.963123, 0, 1.5, 0.5, 0.5,
3, -3.761408, -5.963123, 0, -0.5, 0.5, 0.5,
3, -3.761408, -5.963123, 1, -0.5, 0.5, 0.5,
3, -3.761408, -5.963123, 1, 1.5, 0.5, 0.5,
3, -3.761408, -5.963123, 0, 1.5, 0.5, 0.5
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
-3.520855, -2, -5.170856,
-3.520855, 4, -5.170856,
-3.520855, -2, -5.170856,
-3.696762, -2, -5.434946,
-3.520855, 0, -5.170856,
-3.696762, 0, -5.434946,
-3.520855, 2, -5.170856,
-3.696762, 2, -5.434946,
-3.520855, 4, -5.170856,
-3.696762, 4, -5.434946
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
"2",
"4"
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
-4.048576, -2, -5.963123, 0, -0.5, 0.5, 0.5,
-4.048576, -2, -5.963123, 1, -0.5, 0.5, 0.5,
-4.048576, -2, -5.963123, 1, 1.5, 0.5, 0.5,
-4.048576, -2, -5.963123, 0, 1.5, 0.5, 0.5,
-4.048576, 0, -5.963123, 0, -0.5, 0.5, 0.5,
-4.048576, 0, -5.963123, 1, -0.5, 0.5, 0.5,
-4.048576, 0, -5.963123, 1, 1.5, 0.5, 0.5,
-4.048576, 0, -5.963123, 0, 1.5, 0.5, 0.5,
-4.048576, 2, -5.963123, 0, -0.5, 0.5, 0.5,
-4.048576, 2, -5.963123, 1, -0.5, 0.5, 0.5,
-4.048576, 2, -5.963123, 1, 1.5, 0.5, 0.5,
-4.048576, 2, -5.963123, 0, 1.5, 0.5, 0.5,
-4.048576, 4, -5.963123, 0, -0.5, 0.5, 0.5,
-4.048576, 4, -5.963123, 1, -0.5, 0.5, 0.5,
-4.048576, 4, -5.963123, 1, 1.5, 0.5, 0.5,
-4.048576, 4, -5.963123, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.520855, -3.21222, -4,
-3.520855, -3.21222, 4,
-3.520855, -3.21222, -4,
-3.696762, -3.395283, -4,
-3.520855, -3.21222, -2,
-3.696762, -3.395283, -2,
-3.520855, -3.21222, 0,
-3.696762, -3.395283, 0,
-3.520855, -3.21222, 2,
-3.696762, -3.395283, 2,
-3.520855, -3.21222, 4,
-3.696762, -3.395283, 4
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
-4.048576, -3.761408, -4, 0, -0.5, 0.5, 0.5,
-4.048576, -3.761408, -4, 1, -0.5, 0.5, 0.5,
-4.048576, -3.761408, -4, 1, 1.5, 0.5, 0.5,
-4.048576, -3.761408, -4, 0, 1.5, 0.5, 0.5,
-4.048576, -3.761408, -2, 0, -0.5, 0.5, 0.5,
-4.048576, -3.761408, -2, 1, -0.5, 0.5, 0.5,
-4.048576, -3.761408, -2, 1, 1.5, 0.5, 0.5,
-4.048576, -3.761408, -2, 0, 1.5, 0.5, 0.5,
-4.048576, -3.761408, 0, 0, -0.5, 0.5, 0.5,
-4.048576, -3.761408, 0, 1, -0.5, 0.5, 0.5,
-4.048576, -3.761408, 0, 1, 1.5, 0.5, 0.5,
-4.048576, -3.761408, 0, 0, 1.5, 0.5, 0.5,
-4.048576, -3.761408, 2, 0, -0.5, 0.5, 0.5,
-4.048576, -3.761408, 2, 1, -0.5, 0.5, 0.5,
-4.048576, -3.761408, 2, 1, 1.5, 0.5, 0.5,
-4.048576, -3.761408, 2, 0, 1.5, 0.5, 0.5,
-4.048576, -3.761408, 4, 0, -0.5, 0.5, 0.5,
-4.048576, -3.761408, 4, 1, -0.5, 0.5, 0.5,
-4.048576, -3.761408, 4, 1, 1.5, 0.5, 0.5,
-4.048576, -3.761408, 4, 0, 1.5, 0.5, 0.5
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
-3.520855, -3.21222, -5.170856,
-3.520855, 4.11029, -5.170856,
-3.520855, -3.21222, 5.392701,
-3.520855, 4.11029, 5.392701,
-3.520855, -3.21222, -5.170856,
-3.520855, -3.21222, 5.392701,
-3.520855, 4.11029, -5.170856,
-3.520855, 4.11029, 5.392701,
-3.520855, -3.21222, -5.170856,
3.515427, -3.21222, -5.170856,
-3.520855, -3.21222, 5.392701,
3.515427, -3.21222, 5.392701,
-3.520855, 4.11029, -5.170856,
3.515427, 4.11029, -5.170856,
-3.520855, 4.11029, 5.392701,
3.515427, 4.11029, 5.392701,
3.515427, -3.21222, -5.170856,
3.515427, 4.11029, -5.170856,
3.515427, -3.21222, 5.392701,
3.515427, 4.11029, 5.392701,
3.515427, -3.21222, -5.170856,
3.515427, -3.21222, 5.392701,
3.515427, 4.11029, -5.170856,
3.515427, 4.11029, 5.392701
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
var radius = 7.82454;
var distance = 34.81226;
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
mvMatrix.translate( 0.002713919, -0.4490352, -0.1109221 );
mvMatrix.scale( 1.202346, 1.155348, 0.800871 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.81226);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
thiodicarbe<-read.table("thiodicarbe.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-thiodicarbe$V2
```

```
## Error in eval(expr, envir, enclos): object 'thiodicarbe' not found
```

```r
y<-thiodicarbe$V3
```

```
## Error in eval(expr, envir, enclos): object 'thiodicarbe' not found
```

```r
z<-thiodicarbe$V4
```

```
## Error in eval(expr, envir, enclos): object 'thiodicarbe' not found
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
-3.418385, 0.7289768, -0.659916, 0, 0, 1, 1, 1,
-3.128454, -0.330025, -2.025258, 1, 0, 0, 1, 1,
-3.10189, 0.9935417, -0.9564117, 1, 0, 0, 1, 1,
-3.072819, 0.9532602, -0.4115366, 1, 0, 0, 1, 1,
-3.038086, -1.614654, -2.299778, 1, 0, 0, 1, 1,
-2.982914, -0.964882, -2.23729, 1, 0, 0, 1, 1,
-2.908195, -0.1043816, -0.6285099, 0, 0, 0, 1, 1,
-2.875868, -0.5454598, -2.157587, 0, 0, 0, 1, 1,
-2.776615, -1.379422, -4.359148, 0, 0, 0, 1, 1,
-2.681565, 0.1349479, -1.615945, 0, 0, 0, 1, 1,
-2.67682, -0.5593764, -1.540582, 0, 0, 0, 1, 1,
-2.664324, 0.06767091, -2.136976, 0, 0, 0, 1, 1,
-2.570791, 0.04413884, -0.7336914, 0, 0, 0, 1, 1,
-2.378053, -1.571653, -2.494038, 1, 1, 1, 1, 1,
-2.356529, 0.6321194, -1.507221, 1, 1, 1, 1, 1,
-2.352018, -0.1099306, -2.607875, 1, 1, 1, 1, 1,
-2.30624, -0.246577, -1.038362, 1, 1, 1, 1, 1,
-2.296877, 0.01959681, -2.075916, 1, 1, 1, 1, 1,
-2.283248, 0.8102958, -1.273518, 1, 1, 1, 1, 1,
-2.222327, -0.1869693, -1.339083, 1, 1, 1, 1, 1,
-2.162338, -0.211652, -0.2523199, 1, 1, 1, 1, 1,
-2.152476, -0.2481185, 0.8862666, 1, 1, 1, 1, 1,
-2.12313, 1.813496, 0.3901118, 1, 1, 1, 1, 1,
-2.101325, 1.066445, -1.515353, 1, 1, 1, 1, 1,
-2.06216, -0.3658232, -2.853239, 1, 1, 1, 1, 1,
-1.975748, 1.412863, -1.023389, 1, 1, 1, 1, 1,
-1.964509, 0.07933857, -1.012302, 1, 1, 1, 1, 1,
-1.954661, -0.2289438, -1.425079, 1, 1, 1, 1, 1,
-1.943259, -0.9042299, -0.4819846, 0, 0, 1, 1, 1,
-1.940153, -0.536706, -1.476726, 1, 0, 0, 1, 1,
-1.895182, -1.195248, -1.425502, 1, 0, 0, 1, 1,
-1.889353, -0.7464139, -3.069538, 1, 0, 0, 1, 1,
-1.883014, -0.4602821, -1.06108, 1, 0, 0, 1, 1,
-1.872087, -0.3943642, -3.129581, 1, 0, 0, 1, 1,
-1.871722, 0.124274, -2.545057, 0, 0, 0, 1, 1,
-1.849513, -0.1253563, -0.5106714, 0, 0, 0, 1, 1,
-1.848108, -1.027119, -2.305232, 0, 0, 0, 1, 1,
-1.847442, -1.258962, -1.042233, 0, 0, 0, 1, 1,
-1.833848, 0.3698783, -1.149348, 0, 0, 0, 1, 1,
-1.832456, -0.05684142, -2.808634, 0, 0, 0, 1, 1,
-1.817108, 0.5883707, -1.087482, 0, 0, 0, 1, 1,
-1.801934, 0.06367482, -1.074763, 1, 1, 1, 1, 1,
-1.795783, -0.4233221, -3.09642, 1, 1, 1, 1, 1,
-1.785219, -0.8406699, -1.490399, 1, 1, 1, 1, 1,
-1.773505, 0.1766848, -1.205535, 1, 1, 1, 1, 1,
-1.761863, -0.1703707, -3.789943, 1, 1, 1, 1, 1,
-1.752539, -0.35956, -0.2019972, 1, 1, 1, 1, 1,
-1.75165, -1.775253, -0.8242106, 1, 1, 1, 1, 1,
-1.710317, 0.2007249, -2.626576, 1, 1, 1, 1, 1,
-1.709462, 0.3775591, -2.561936, 1, 1, 1, 1, 1,
-1.705853, -0.285785, -1.225586, 1, 1, 1, 1, 1,
-1.678095, 0.5704381, -0.5858039, 1, 1, 1, 1, 1,
-1.675351, 0.6154306, -0.7142585, 1, 1, 1, 1, 1,
-1.663954, -0.02913348, -2.916398, 1, 1, 1, 1, 1,
-1.661195, -1.311748, -3.360353, 1, 1, 1, 1, 1,
-1.651132, -1.189461, -0.7369533, 1, 1, 1, 1, 1,
-1.636839, 0.1996299, -1.25671, 0, 0, 1, 1, 1,
-1.629827, -0.1762765, -0.9810024, 1, 0, 0, 1, 1,
-1.629544, -1.562906, -2.529165, 1, 0, 0, 1, 1,
-1.620697, -1.504449, -2.555442, 1, 0, 0, 1, 1,
-1.619568, -0.08910333, -1.367768, 1, 0, 0, 1, 1,
-1.618477, 1.053006, 0.2562285, 1, 0, 0, 1, 1,
-1.613475, -0.4046015, -2.330374, 0, 0, 0, 1, 1,
-1.610193, 0.4415276, -1.369062, 0, 0, 0, 1, 1,
-1.602414, -1.65376, -2.573333, 0, 0, 0, 1, 1,
-1.593705, -0.8584821, -2.012078, 0, 0, 0, 1, 1,
-1.58203, 0.8160605, -1.175461, 0, 0, 0, 1, 1,
-1.563864, 0.4017309, -2.040924, 0, 0, 0, 1, 1,
-1.562559, -0.1403017, -1.937696, 0, 0, 0, 1, 1,
-1.558997, -2.191151, -3.564669, 1, 1, 1, 1, 1,
-1.55399, -0.5414466, -1.722546, 1, 1, 1, 1, 1,
-1.550756, 1.524023, 0.3757653, 1, 1, 1, 1, 1,
-1.548959, 1.138198, 0.004535896, 1, 1, 1, 1, 1,
-1.544111, -0.03373868, -3.16916, 1, 1, 1, 1, 1,
-1.528261, 0.6303774, -0.6250908, 1, 1, 1, 1, 1,
-1.51992, 0.1575369, 1.232266, 1, 1, 1, 1, 1,
-1.507722, -1.93983, -3.019771, 1, 1, 1, 1, 1,
-1.496492, 1.007313, 0.1400679, 1, 1, 1, 1, 1,
-1.485745, -0.6919622, -0.4469804, 1, 1, 1, 1, 1,
-1.48136, 0.5894948, -1.793019, 1, 1, 1, 1, 1,
-1.479788, -1.013877, -3.071979, 1, 1, 1, 1, 1,
-1.478915, -1.015212, -3.154856, 1, 1, 1, 1, 1,
-1.478487, 0.5650643, -2.336392, 1, 1, 1, 1, 1,
-1.477907, -0.4284742, -1.149894, 1, 1, 1, 1, 1,
-1.46138, -0.8982551, -3.038755, 0, 0, 1, 1, 1,
-1.460896, -1.053919, -2.682359, 1, 0, 0, 1, 1,
-1.452129, 0.8511977, -2.276849, 1, 0, 0, 1, 1,
-1.450409, -1.135065, -2.825552, 1, 0, 0, 1, 1,
-1.428679, 0.6984918, -0.1803759, 1, 0, 0, 1, 1,
-1.426326, -0.2020895, -3.178138, 1, 0, 0, 1, 1,
-1.413462, 0.2775697, -0.5459712, 0, 0, 0, 1, 1,
-1.413209, 1.113768, -1.47541, 0, 0, 0, 1, 1,
-1.408321, -0.4167378, -0.3084623, 0, 0, 0, 1, 1,
-1.399734, -1.162755, -2.516542, 0, 0, 0, 1, 1,
-1.397187, -0.7938076, -1.706292, 0, 0, 0, 1, 1,
-1.395527, -0.06624907, -2.649111, 0, 0, 0, 1, 1,
-1.395346, 0.4088816, -2.227676, 0, 0, 0, 1, 1,
-1.391871, 0.9560989, -0.2706823, 1, 1, 1, 1, 1,
-1.390146, -0.7604535, -2.311827, 1, 1, 1, 1, 1,
-1.389444, 0.04953464, -2.107463, 1, 1, 1, 1, 1,
-1.379481, 1.804195, 0.1358875, 1, 1, 1, 1, 1,
-1.368325, 1.210878, -0.2636586, 1, 1, 1, 1, 1,
-1.360453, -0.4462611, -0.8393356, 1, 1, 1, 1, 1,
-1.349741, 0.09148976, -0.7331684, 1, 1, 1, 1, 1,
-1.349396, -2.098724, -2.242752, 1, 1, 1, 1, 1,
-1.342897, -1.073757, -2.39682, 1, 1, 1, 1, 1,
-1.318802, 0.8385854, -1.143325, 1, 1, 1, 1, 1,
-1.317376, -1.089365, -2.5021, 1, 1, 1, 1, 1,
-1.31116, -2.854924, -2.871485, 1, 1, 1, 1, 1,
-1.311032, -1.121212, -2.133213, 1, 1, 1, 1, 1,
-1.30946, -0.125623, -0.2752626, 1, 1, 1, 1, 1,
-1.302006, 0.6935987, -1.80585, 1, 1, 1, 1, 1,
-1.301302, 0.1261488, -3.44199, 0, 0, 1, 1, 1,
-1.285756, -0.6977285, -2.437115, 1, 0, 0, 1, 1,
-1.28114, 0.4386685, -1.465309, 1, 0, 0, 1, 1,
-1.271085, 1.3368, -1.771001, 1, 0, 0, 1, 1,
-1.266798, 0.5635403, -1.474473, 1, 0, 0, 1, 1,
-1.261344, -1.26697, -0.1461399, 1, 0, 0, 1, 1,
-1.259582, 0.8116809, -3.536207, 0, 0, 0, 1, 1,
-1.245805, -0.4748459, -1.535408, 0, 0, 0, 1, 1,
-1.236861, -0.3317575, -2.997209, 0, 0, 0, 1, 1,
-1.234882, -0.1702971, -1.856573, 0, 0, 0, 1, 1,
-1.234608, -0.8075655, -0.9118143, 0, 0, 0, 1, 1,
-1.227087, 0.3445513, -0.757937, 0, 0, 0, 1, 1,
-1.223788, -0.9854349, -1.766574, 0, 0, 0, 1, 1,
-1.220848, 1.007603, -1.255174, 1, 1, 1, 1, 1,
-1.212284, 0.4958358, -1.621776, 1, 1, 1, 1, 1,
-1.200834, 1.134614, -0.001784472, 1, 1, 1, 1, 1,
-1.200279, -0.661564, -3.455667, 1, 1, 1, 1, 1,
-1.175571, 1.727222, -0.2788176, 1, 1, 1, 1, 1,
-1.172555, 0.6242427, -2.708406, 1, 1, 1, 1, 1,
-1.166237, -1.028576, -3.999748, 1, 1, 1, 1, 1,
-1.166161, -1.535404, -1.750842, 1, 1, 1, 1, 1,
-1.163008, -0.9336683, -2.655424, 1, 1, 1, 1, 1,
-1.158254, 1.649461, -1.923014, 1, 1, 1, 1, 1,
-1.157283, 0.3871815, -2.103766, 1, 1, 1, 1, 1,
-1.149211, -1.043771, -0.2599868, 1, 1, 1, 1, 1,
-1.142689, 0.80212, -1.660754, 1, 1, 1, 1, 1,
-1.142369, 0.2644574, -1.142249, 1, 1, 1, 1, 1,
-1.137418, 0.3043202, -1.003189, 1, 1, 1, 1, 1,
-1.136261, 1.160465, -1.146828, 0, 0, 1, 1, 1,
-1.135852, -1.204566, -3.043326, 1, 0, 0, 1, 1,
-1.127519, 0.2714607, -2.066107, 1, 0, 0, 1, 1,
-1.126828, 0.8735806, -0.667454, 1, 0, 0, 1, 1,
-1.12649, -1.596016, -2.375749, 1, 0, 0, 1, 1,
-1.124143, -0.4166093, -0.7371704, 1, 0, 0, 1, 1,
-1.121592, -1.536695, -2.950971, 0, 0, 0, 1, 1,
-1.119443, -1.016047, -3.685046, 0, 0, 0, 1, 1,
-1.113975, 0.1163378, -2.489432, 0, 0, 0, 1, 1,
-1.113043, -0.5247854, -2.384746, 0, 0, 0, 1, 1,
-1.110436, -1.998358, -3.65364, 0, 0, 0, 1, 1,
-1.109092, -0.1757408, -1.418218, 0, 0, 0, 1, 1,
-1.097044, -0.6596522, -3.43554, 0, 0, 0, 1, 1,
-1.093952, 0.8543027, -1.983284, 1, 1, 1, 1, 1,
-1.077857, -0.319567, -1.513301, 1, 1, 1, 1, 1,
-1.063284, -0.1807752, -2.23173, 1, 1, 1, 1, 1,
-1.062931, -0.6403157, -4.070985, 1, 1, 1, 1, 1,
-1.061878, -0.001753074, -0.776769, 1, 1, 1, 1, 1,
-1.054833, 1.30449, -1.326596, 1, 1, 1, 1, 1,
-1.047424, 1.534948, -1.352912, 1, 1, 1, 1, 1,
-1.047032, -0.4469238, -1.092212, 1, 1, 1, 1, 1,
-1.04553, 1.706735, -0.9856897, 1, 1, 1, 1, 1,
-1.044758, -0.1903348, -1.413282, 1, 1, 1, 1, 1,
-1.043578, 0.1796637, -0.3340462, 1, 1, 1, 1, 1,
-1.04007, 0.68288, -2.558124, 1, 1, 1, 1, 1,
-1.034762, -0.4531525, -2.616703, 1, 1, 1, 1, 1,
-1.031824, 0.7802761, -0.9219056, 1, 1, 1, 1, 1,
-1.031761, 1.139022, -2.272947, 1, 1, 1, 1, 1,
-1.029069, 0.8076283, -0.03037665, 0, 0, 1, 1, 1,
-1.013166, 0.7867711, -0.757764, 1, 0, 0, 1, 1,
-1.006799, -1.591062, -2.041398, 1, 0, 0, 1, 1,
-1.002868, 0.04139924, -1.079934, 1, 0, 0, 1, 1,
-1.002267, 2.42898, -0.9059588, 1, 0, 0, 1, 1,
-1.001621, -1.622296, -2.706124, 1, 0, 0, 1, 1,
-1.001376, 0.7118821, -0.3747291, 0, 0, 0, 1, 1,
-1.00036, -0.1339056, -1.682653, 0, 0, 0, 1, 1,
-0.998339, 0.1887207, -0.3701683, 0, 0, 0, 1, 1,
-0.9965285, -1.164213, -1.465574, 0, 0, 0, 1, 1,
-0.9867038, 1.084291, -1.695324, 0, 0, 0, 1, 1,
-0.9791894, 0.03983235, -0.5400919, 0, 0, 0, 1, 1,
-0.970696, 1.973287, -2.04621, 0, 0, 0, 1, 1,
-0.9695179, -0.0901251, -2.594109, 1, 1, 1, 1, 1,
-0.9688279, -0.2612451, -0.8114202, 1, 1, 1, 1, 1,
-0.9681616, 1.019161, -1.016639, 1, 1, 1, 1, 1,
-0.9675328, 0.8334453, -0.604319, 1, 1, 1, 1, 1,
-0.9668702, -2.590888, -4.569502, 1, 1, 1, 1, 1,
-0.9659039, -1.799828, -4.334072, 1, 1, 1, 1, 1,
-0.9643097, 1.337683, 0.5902545, 1, 1, 1, 1, 1,
-0.9634802, -0.02331767, -1.61482, 1, 1, 1, 1, 1,
-0.9589289, 0.336733, -0.2347713, 1, 1, 1, 1, 1,
-0.9496779, 0.5664047, -1.421598, 1, 1, 1, 1, 1,
-0.9439105, 2.726448, 0.7705172, 1, 1, 1, 1, 1,
-0.9407279, -1.388039, -3.522321, 1, 1, 1, 1, 1,
-0.9398835, 0.9635394, 0.5375533, 1, 1, 1, 1, 1,
-0.9376172, -0.4675129, -0.9668432, 1, 1, 1, 1, 1,
-0.9330652, 1.226509, 0.691041, 1, 1, 1, 1, 1,
-0.9308669, 0.04366972, -1.319442, 0, 0, 1, 1, 1,
-0.9238198, -0.6769093, -3.611521, 1, 0, 0, 1, 1,
-0.9229441, -1.06018, -0.4978749, 1, 0, 0, 1, 1,
-0.9213304, 1.648491, 0.3160358, 1, 0, 0, 1, 1,
-0.9195042, 0.9870518, -1.019953, 1, 0, 0, 1, 1,
-0.9178913, 0.9976721, -0.040159, 1, 0, 0, 1, 1,
-0.9076806, -0.9703208, -1.75734, 0, 0, 0, 1, 1,
-0.9064877, 1.945886, -0.8331206, 0, 0, 0, 1, 1,
-0.9040522, -2.139726, -3.837357, 0, 0, 0, 1, 1,
-0.9039504, -0.2622538, -1.241831, 0, 0, 0, 1, 1,
-0.9024528, 0.1635368, -0.03381063, 0, 0, 0, 1, 1,
-0.9005901, -0.6764398, -1.022796, 0, 0, 0, 1, 1,
-0.8951764, 1.173183, -0.05413933, 0, 0, 0, 1, 1,
-0.8918362, -0.3758499, -4.011812, 1, 1, 1, 1, 1,
-0.8917087, -0.8332125, -2.008316, 1, 1, 1, 1, 1,
-0.8907881, 0.6972231, 0.1312989, 1, 1, 1, 1, 1,
-0.8838895, 1.052928, -2.208824, 1, 1, 1, 1, 1,
-0.8817474, -2.522228, -3.218315, 1, 1, 1, 1, 1,
-0.881038, 1.320288, 0.2099175, 1, 1, 1, 1, 1,
-0.8775033, -0.04909962, -2.174914, 1, 1, 1, 1, 1,
-0.8614517, -1.605823, -2.223569, 1, 1, 1, 1, 1,
-0.8603445, -0.1214826, -1.492913, 1, 1, 1, 1, 1,
-0.8598866, 1.10374, -2.30236, 1, 1, 1, 1, 1,
-0.8590342, 1.69718, -0.6690793, 1, 1, 1, 1, 1,
-0.8519332, 0.08802409, 0.4678572, 1, 1, 1, 1, 1,
-0.8507685, -0.9143947, -1.539594, 1, 1, 1, 1, 1,
-0.8505754, 1.828858, -0.9583554, 1, 1, 1, 1, 1,
-0.8492377, 0.7528377, 0.282479, 1, 1, 1, 1, 1,
-0.8445072, -0.3916313, -3.303699, 0, 0, 1, 1, 1,
-0.8415594, -0.548444, -2.252999, 1, 0, 0, 1, 1,
-0.8401252, 0.6612218, 0.4597283, 1, 0, 0, 1, 1,
-0.8359143, 0.9719253, 1.659761, 1, 0, 0, 1, 1,
-0.8340898, 0.1595056, -1.943382, 1, 0, 0, 1, 1,
-0.8291192, 0.1622074, -3.042459, 1, 0, 0, 1, 1,
-0.8285776, 0.8814959, -1.350204, 0, 0, 0, 1, 1,
-0.827392, 0.9660652, -1.731352, 0, 0, 0, 1, 1,
-0.8219061, 0.4522342, -1.606309, 0, 0, 0, 1, 1,
-0.8170506, -0.2463755, -0.4439583, 0, 0, 0, 1, 1,
-0.8113481, -1.563966, -3.171115, 0, 0, 0, 1, 1,
-0.810842, 2.406102, -1.094863, 0, 0, 0, 1, 1,
-0.8038062, -0.4539101, -3.704385, 0, 0, 0, 1, 1,
-0.7991319, 1.271693, 0.196262, 1, 1, 1, 1, 1,
-0.7964699, -0.4242222, -0.5334653, 1, 1, 1, 1, 1,
-0.7959932, -0.6576582, -3.092465, 1, 1, 1, 1, 1,
-0.7925704, 0.494572, -1.765135, 1, 1, 1, 1, 1,
-0.7889379, -0.3178248, -2.404341, 1, 1, 1, 1, 1,
-0.7836968, 0.09675284, 0.1260553, 1, 1, 1, 1, 1,
-0.7824281, -0.3124113, -1.50117, 1, 1, 1, 1, 1,
-0.7806661, 1.228819, 0.8397742, 1, 1, 1, 1, 1,
-0.780657, 0.01112887, -1.534782, 1, 1, 1, 1, 1,
-0.7753088, -1.739967, -2.228111, 1, 1, 1, 1, 1,
-0.7720063, -1.462204, -1.207213, 1, 1, 1, 1, 1,
-0.7707438, -0.6502971, -1.485374, 1, 1, 1, 1, 1,
-0.7698712, -2.903667, -1.266035, 1, 1, 1, 1, 1,
-0.7650418, -0.03681004, 0.06935179, 1, 1, 1, 1, 1,
-0.7630545, 0.1536839, -2.18194, 1, 1, 1, 1, 1,
-0.7619593, 0.02468557, 0.02552682, 0, 0, 1, 1, 1,
-0.7606979, -0.8135022, -1.859562, 1, 0, 0, 1, 1,
-0.7590982, -0.009955131, -0.4769576, 1, 0, 0, 1, 1,
-0.7567762, 0.6210703, -1.026383, 1, 0, 0, 1, 1,
-0.7548186, -0.9882537, -3.571363, 1, 0, 0, 1, 1,
-0.7547146, 1.26068, 0.05775242, 1, 0, 0, 1, 1,
-0.752078, -0.6267771, -0.2776277, 0, 0, 0, 1, 1,
-0.7517872, 0.4565883, -0.5493056, 0, 0, 0, 1, 1,
-0.7504629, 1.174523, 0.5337661, 0, 0, 0, 1, 1,
-0.7497669, -0.8353311, -2.787116, 0, 0, 0, 1, 1,
-0.7412838, -0.2000335, -2.273628, 0, 0, 0, 1, 1,
-0.7390614, 0.03603356, -1.738981, 0, 0, 0, 1, 1,
-0.7358793, 0.1201105, -0.8847915, 0, 0, 0, 1, 1,
-0.7346905, -1.276163, -2.233704, 1, 1, 1, 1, 1,
-0.7338887, -2.305515, -2.49715, 1, 1, 1, 1, 1,
-0.7327371, 2.079008, 0.2304154, 1, 1, 1, 1, 1,
-0.7315933, 1.309128, -0.3394719, 1, 1, 1, 1, 1,
-0.7298627, -1.059625, -2.705991, 1, 1, 1, 1, 1,
-0.7261798, -0.3029899, -2.839313, 1, 1, 1, 1, 1,
-0.7195162, -0.4085748, -1.034092, 1, 1, 1, 1, 1,
-0.717388, 0.02578195, -2.097601, 1, 1, 1, 1, 1,
-0.7154731, -1.01632, -1.960604, 1, 1, 1, 1, 1,
-0.7148646, -0.6424165, -1.486133, 1, 1, 1, 1, 1,
-0.7067929, -0.01035687, 0.1311005, 1, 1, 1, 1, 1,
-0.7014832, -0.5340968, -1.700154, 1, 1, 1, 1, 1,
-0.6991301, -0.02203652, -1.152411, 1, 1, 1, 1, 1,
-0.6964526, 1.242345, -0.2178917, 1, 1, 1, 1, 1,
-0.6916881, 1.211903, -1.053578, 1, 1, 1, 1, 1,
-0.6916151, -1.157845, -1.888328, 0, 0, 1, 1, 1,
-0.688803, -1.103086, -1.722691, 1, 0, 0, 1, 1,
-0.687999, -0.08649707, -1.534032, 1, 0, 0, 1, 1,
-0.6849713, 0.2187583, -1.94247, 1, 0, 0, 1, 1,
-0.6798073, -0.6469832, -4.822225, 1, 0, 0, 1, 1,
-0.6735837, 0.8047782, 0.3203498, 1, 0, 0, 1, 1,
-0.6706043, -1.565413, -3.899899, 0, 0, 0, 1, 1,
-0.6692064, -1.695166, -3.021061, 0, 0, 0, 1, 1,
-0.6664785, -0.6151524, -3.68031, 0, 0, 0, 1, 1,
-0.6639729, 0.2240266, -2.967059, 0, 0, 0, 1, 1,
-0.6564748, 2.166163, 0.3183441, 0, 0, 0, 1, 1,
-0.6524025, 1.966708, -0.9205801, 0, 0, 0, 1, 1,
-0.6442519, -0.4789285, -2.69837, 0, 0, 0, 1, 1,
-0.6433553, 0.1001663, -0.02301361, 1, 1, 1, 1, 1,
-0.6427559, 1.11452, -0.5229205, 1, 1, 1, 1, 1,
-0.6389772, 0.1514682, -1.197924, 1, 1, 1, 1, 1,
-0.6325109, -0.1159496, -0.4633601, 1, 1, 1, 1, 1,
-0.631964, -2.011318, -0.9148999, 1, 1, 1, 1, 1,
-0.6318062, -1.04779, -2.699756, 1, 1, 1, 1, 1,
-0.6311935, 0.4072824, -1.520729, 1, 1, 1, 1, 1,
-0.6311485, 0.8047228, -0.7248259, 1, 1, 1, 1, 1,
-0.6291319, -2.963583, -2.93956, 1, 1, 1, 1, 1,
-0.6259159, -0.6370971, -2.906579, 1, 1, 1, 1, 1,
-0.6253283, 0.24233, -1.001281, 1, 1, 1, 1, 1,
-0.623957, -1.229421, -0.5037606, 1, 1, 1, 1, 1,
-0.6214476, -0.4618673, -0.9454181, 1, 1, 1, 1, 1,
-0.6212286, -0.02789615, -1.280051, 1, 1, 1, 1, 1,
-0.6208167, -0.3322166, -1.473799, 1, 1, 1, 1, 1,
-0.6170451, -0.3447088, -2.627731, 0, 0, 1, 1, 1,
-0.6154286, 1.553889, 1.006509, 1, 0, 0, 1, 1,
-0.614683, -2.202147, -2.858276, 1, 0, 0, 1, 1,
-0.6140791, 0.2186479, -2.956412, 1, 0, 0, 1, 1,
-0.6108865, 0.4458862, -1.219406, 1, 0, 0, 1, 1,
-0.6022981, -1.926386, -2.71977, 1, 0, 0, 1, 1,
-0.6022875, 0.09188025, -2.103142, 0, 0, 0, 1, 1,
-0.6011368, -0.2438093, -3.012005, 0, 0, 0, 1, 1,
-0.5992729, 0.7523996, 0.7851423, 0, 0, 0, 1, 1,
-0.5974663, -1.707226, -2.063466, 0, 0, 0, 1, 1,
-0.5926945, 0.7473602, -0.8377871, 0, 0, 0, 1, 1,
-0.5916116, -0.5436581, -3.329523, 0, 0, 0, 1, 1,
-0.5893705, 0.5974547, -0.9109507, 0, 0, 0, 1, 1,
-0.5887303, -0.1093023, -1.312198, 1, 1, 1, 1, 1,
-0.5804179, -0.01242581, -2.565759, 1, 1, 1, 1, 1,
-0.5764278, 0.406236, -1.39021, 1, 1, 1, 1, 1,
-0.5651233, -0.1289505, -2.563015, 1, 1, 1, 1, 1,
-0.5605096, -0.7241901, -2.53387, 1, 1, 1, 1, 1,
-0.5603604, -0.3380654, -1.753693, 1, 1, 1, 1, 1,
-0.5599121, 0.7617177, -1.890263, 1, 1, 1, 1, 1,
-0.559202, 0.5525615, 0.01097071, 1, 1, 1, 1, 1,
-0.5571828, 0.5561204, 0.1808098, 1, 1, 1, 1, 1,
-0.5564638, -0.6394191, -3.053273, 1, 1, 1, 1, 1,
-0.5550794, 2.914899, -0.7622662, 1, 1, 1, 1, 1,
-0.5515071, 0.8785032, -1.408151, 1, 1, 1, 1, 1,
-0.5514253, 0.7619908, -0.9334486, 1, 1, 1, 1, 1,
-0.5471522, 1.287987, 0.3273727, 1, 1, 1, 1, 1,
-0.5436793, -0.6987979, -1.916909, 1, 1, 1, 1, 1,
-0.5361039, 0.5790719, -0.6662413, 0, 0, 1, 1, 1,
-0.5348843, 0.08467821, -0.1117655, 1, 0, 0, 1, 1,
-0.5326908, -1.148609, -2.222025, 1, 0, 0, 1, 1,
-0.5290984, -0.5566278, -2.876534, 1, 0, 0, 1, 1,
-0.5273522, 0.8222927, -1.183809, 1, 0, 0, 1, 1,
-0.5200078, -0.2266371, -2.788811, 1, 0, 0, 1, 1,
-0.5170818, 1.062376, 0.5162395, 0, 0, 0, 1, 1,
-0.506034, -1.597403, -3.993852, 0, 0, 0, 1, 1,
-0.5047079, -1.013103, -4.01825, 0, 0, 0, 1, 1,
-0.5041403, -1.175477, -2.539322, 0, 0, 0, 1, 1,
-0.5010558, -1.061287, -3.65935, 0, 0, 0, 1, 1,
-0.499315, -0.02585741, -1.570112, 0, 0, 0, 1, 1,
-0.4991505, -0.7225679, -3.740555, 0, 0, 0, 1, 1,
-0.4970407, -0.01815201, -1.254595, 1, 1, 1, 1, 1,
-0.4919928, 2.475496, 0.6838406, 1, 1, 1, 1, 1,
-0.4908712, -0.6801971, -3.533694, 1, 1, 1, 1, 1,
-0.490713, -0.6818626, -2.5127, 1, 1, 1, 1, 1,
-0.4900599, 0.4747779, -1.751478, 1, 1, 1, 1, 1,
-0.4896518, -0.3193574, -0.685306, 1, 1, 1, 1, 1,
-0.485262, 0.3314539, -0.3978236, 1, 1, 1, 1, 1,
-0.481383, 0.05355899, -2.465237, 1, 1, 1, 1, 1,
-0.479892, -0.8494967, -2.601191, 1, 1, 1, 1, 1,
-0.4796381, 0.6554034, -1.477503, 1, 1, 1, 1, 1,
-0.4784539, 0.6802958, -1.683241, 1, 1, 1, 1, 1,
-0.4774307, -0.5599713, -4.200545, 1, 1, 1, 1, 1,
-0.4766242, 0.7758751, 1.197918, 1, 1, 1, 1, 1,
-0.4757788, -0.9251638, -3.166674, 1, 1, 1, 1, 1,
-0.4734004, 0.1431644, -1.537812, 1, 1, 1, 1, 1,
-0.4701915, 1.626644, 1.038886, 0, 0, 1, 1, 1,
-0.4645744, 1.727853, -1.712683, 1, 0, 0, 1, 1,
-0.4623265, -0.5759826, -4.533543, 1, 0, 0, 1, 1,
-0.4602634, 0.5523056, 0.04415519, 1, 0, 0, 1, 1,
-0.460155, 1.397619, 0.5123436, 1, 0, 0, 1, 1,
-0.4571364, -0.7522275, -0.4508928, 1, 0, 0, 1, 1,
-0.4541621, 1.423716, -2.434985, 0, 0, 0, 1, 1,
-0.4518056, 0.2276755, -0.5075796, 0, 0, 0, 1, 1,
-0.4510728, -0.5303997, -1.440474, 0, 0, 0, 1, 1,
-0.4484808, 0.3186477, -2.53031, 0, 0, 0, 1, 1,
-0.4472935, 0.367235, 0.06874561, 0, 0, 0, 1, 1,
-0.4471016, 1.388655, -0.3395951, 0, 0, 0, 1, 1,
-0.4447333, 0.7428722, -1.251781, 0, 0, 0, 1, 1,
-0.4440127, -0.4301175, -1.303291, 1, 1, 1, 1, 1,
-0.4375197, -0.9096432, -2.378693, 1, 1, 1, 1, 1,
-0.4367391, -1.296295, -2.566189, 1, 1, 1, 1, 1,
-0.436583, -2.712928, -2.483658, 1, 1, 1, 1, 1,
-0.43629, 0.2566532, -0.4083828, 1, 1, 1, 1, 1,
-0.434387, 0.7698714, 0.08051793, 1, 1, 1, 1, 1,
-0.4272581, 0.4558287, -0.3196875, 1, 1, 1, 1, 1,
-0.4256931, -0.278416, -2.703871, 1, 1, 1, 1, 1,
-0.4255527, -0.9143244, -2.978518, 1, 1, 1, 1, 1,
-0.4225484, 2.200043, 0.2878718, 1, 1, 1, 1, 1,
-0.418664, -0.5628158, -1.995657, 1, 1, 1, 1, 1,
-0.4182411, -0.3962823, -1.7376, 1, 1, 1, 1, 1,
-0.4138349, 0.4125901, -1.842553, 1, 1, 1, 1, 1,
-0.41359, -0.4116337, -3.793507, 1, 1, 1, 1, 1,
-0.4117006, -0.0845402, 0.2164922, 1, 1, 1, 1, 1,
-0.4095973, 1.794107, 0.1062764, 0, 0, 1, 1, 1,
-0.4077495, -0.6266019, -1.753958, 1, 0, 0, 1, 1,
-0.4056463, -0.01885563, -3.754741, 1, 0, 0, 1, 1,
-0.4035754, 2.173194, 0.3936816, 1, 0, 0, 1, 1,
-0.398581, -1.444316, -3.145021, 1, 0, 0, 1, 1,
-0.39077, -0.3714207, -0.2381594, 1, 0, 0, 1, 1,
-0.3868649, -0.177567, -3.21199, 0, 0, 0, 1, 1,
-0.3863905, 0.8597423, 0.1311343, 0, 0, 0, 1, 1,
-0.3853316, 0.05533652, -2.031909, 0, 0, 0, 1, 1,
-0.3826268, 1.110303, -0.8053735, 0, 0, 0, 1, 1,
-0.3802003, -0.7478827, -4.385223, 0, 0, 0, 1, 1,
-0.3785908, -0.4945091, -2.316751, 0, 0, 0, 1, 1,
-0.37525, -1.037421, -1.378833, 0, 0, 0, 1, 1,
-0.3691284, 0.5385435, 0.7895072, 1, 1, 1, 1, 1,
-0.3670486, 0.2110314, -0.06334023, 1, 1, 1, 1, 1,
-0.3637941, 1.620851, -0.4159873, 1, 1, 1, 1, 1,
-0.3598174, -1.440677, -3.469168, 1, 1, 1, 1, 1,
-0.3534287, -0.4889984, -2.659847, 1, 1, 1, 1, 1,
-0.3522307, 0.3359762, -0.45807, 1, 1, 1, 1, 1,
-0.3522293, -0.05782531, -0.2510478, 1, 1, 1, 1, 1,
-0.3508618, -0.3652915, -2.118217, 1, 1, 1, 1, 1,
-0.3506723, 0.6317937, -1.221371, 1, 1, 1, 1, 1,
-0.3476636, 0.4273358, 0.1799986, 1, 1, 1, 1, 1,
-0.3472618, -1.410826, -4.06904, 1, 1, 1, 1, 1,
-0.3454821, 0.1773695, -1.284733, 1, 1, 1, 1, 1,
-0.3442215, 0.4786143, -0.7454588, 1, 1, 1, 1, 1,
-0.3431773, -0.3710732, -3.548132, 1, 1, 1, 1, 1,
-0.3369957, 0.2986741, -1.078985, 1, 1, 1, 1, 1,
-0.3359146, 0.5813396, -1.127663, 0, 0, 1, 1, 1,
-0.3352745, 0.1137758, -2.407555, 1, 0, 0, 1, 1,
-0.331038, -0.7487828, -4.220431, 1, 0, 0, 1, 1,
-0.3296433, -2.669622, -4.076712, 1, 0, 0, 1, 1,
-0.3293393, 1.142362, -0.4460767, 1, 0, 0, 1, 1,
-0.3247709, -2.484225, -2.635524, 1, 0, 0, 1, 1,
-0.3231956, 0.6304546, 0.4626712, 0, 0, 0, 1, 1,
-0.3222177, -0.4005935, -3.676474, 0, 0, 0, 1, 1,
-0.3196808, 0.1917888, -2.249299, 0, 0, 0, 1, 1,
-0.31861, -1.529825, -4.358444, 0, 0, 0, 1, 1,
-0.318041, 0.5149232, -1.552292, 0, 0, 0, 1, 1,
-0.3129344, -2.176662, -4.47169, 0, 0, 0, 1, 1,
-0.310939, -0.7278819, -2.871463, 0, 0, 0, 1, 1,
-0.2910183, 0.7686487, -0.6708599, 1, 1, 1, 1, 1,
-0.2869513, -1.379388, -4.73455, 1, 1, 1, 1, 1,
-0.2865034, -0.9508826, -3.530906, 1, 1, 1, 1, 1,
-0.2825582, -0.3992542, -1.959467, 1, 1, 1, 1, 1,
-0.2819545, 0.4805291, 2.179493, 1, 1, 1, 1, 1,
-0.2782768, 0.8346877, -3.195101, 1, 1, 1, 1, 1,
-0.2705833, 0.2322323, -0.9057078, 1, 1, 1, 1, 1,
-0.2685528, -0.9798878, -2.019855, 1, 1, 1, 1, 1,
-0.2627006, -1.488366, -3.293793, 1, 1, 1, 1, 1,
-0.2598919, 0.9520109, -1.477209, 1, 1, 1, 1, 1,
-0.2586125, 0.2133856, -1.222609, 1, 1, 1, 1, 1,
-0.25473, -0.7867211, -2.627372, 1, 1, 1, 1, 1,
-0.2529078, -0.793011, -3.668961, 1, 1, 1, 1, 1,
-0.2526138, 0.2041033, -0.2342837, 1, 1, 1, 1, 1,
-0.2517452, 0.2579567, -0.06217101, 1, 1, 1, 1, 1,
-0.2515734, -1.661297, -2.127096, 0, 0, 1, 1, 1,
-0.251278, -0.4927235, -3.659347, 1, 0, 0, 1, 1,
-0.2381273, 1.825259, -0.4583962, 1, 0, 0, 1, 1,
-0.2371021, -2.093929, -3.387543, 1, 0, 0, 1, 1,
-0.2321717, -0.02442824, -1.261831, 1, 0, 0, 1, 1,
-0.2308614, -0.1852933, -1.314694, 1, 0, 0, 1, 1,
-0.2302204, -1.100524, -3.357196, 0, 0, 0, 1, 1,
-0.229876, -0.3001034, -1.527143, 0, 0, 0, 1, 1,
-0.2240621, 0.8171409, -0.03596751, 0, 0, 0, 1, 1,
-0.2187587, -0.6427297, -4.088993, 0, 0, 0, 1, 1,
-0.2164072, -0.5015572, -2.951555, 0, 0, 0, 1, 1,
-0.2119291, 0.9059585, 0.01085782, 0, 0, 0, 1, 1,
-0.2097901, -0.9237131, -3.951604, 0, 0, 0, 1, 1,
-0.2091696, -0.3805785, -2.384075, 1, 1, 1, 1, 1,
-0.2057412, -0.8217362, -2.391061, 1, 1, 1, 1, 1,
-0.2056125, -1.095913, -3.555591, 1, 1, 1, 1, 1,
-0.2041144, -0.6911514, -2.982736, 1, 1, 1, 1, 1,
-0.200983, 0.8477738, -0.1527273, 1, 1, 1, 1, 1,
-0.1985893, 1.399449, -1.38705, 1, 1, 1, 1, 1,
-0.1954575, -0.6184995, -2.405509, 1, 1, 1, 1, 1,
-0.1935095, -0.6060595, -3.846081, 1, 1, 1, 1, 1,
-0.1874575, 0.003278023, -1.518271, 1, 1, 1, 1, 1,
-0.1872473, -1.305949, -2.072464, 1, 1, 1, 1, 1,
-0.1859611, 0.6710867, -0.2911421, 1, 1, 1, 1, 1,
-0.182881, -0.04409226, -2.693181, 1, 1, 1, 1, 1,
-0.1812375, 0.560738, -0.8103775, 1, 1, 1, 1, 1,
-0.1752684, 1.309992, 0.6433303, 1, 1, 1, 1, 1,
-0.1710263, 1.19935, 0.4130584, 1, 1, 1, 1, 1,
-0.1678985, 1.33901, 0.320511, 0, 0, 1, 1, 1,
-0.1620375, 1.311964, -1.238138, 1, 0, 0, 1, 1,
-0.1612841, -0.807285, -3.596204, 1, 0, 0, 1, 1,
-0.1585771, 0.8135307, 0.3076433, 1, 0, 0, 1, 1,
-0.1582851, 1.207279, 0.7789103, 1, 0, 0, 1, 1,
-0.1548237, 0.09652482, 0.4845287, 1, 0, 0, 1, 1,
-0.1514073, 2.08031, -0.07490465, 0, 0, 0, 1, 1,
-0.1491055, -1.718126, -3.526726, 0, 0, 0, 1, 1,
-0.1432496, 1.230116, -0.4086776, 0, 0, 0, 1, 1,
-0.1393736, -0.9455839, -5.017018, 0, 0, 0, 1, 1,
-0.1331047, 0.3255973, 1.318745, 0, 0, 0, 1, 1,
-0.1288734, -1.050473, -2.152969, 0, 0, 0, 1, 1,
-0.1266621, -0.3438726, -2.535603, 0, 0, 0, 1, 1,
-0.1262936, -1.685175, -2.380893, 1, 1, 1, 1, 1,
-0.122392, 0.04359763, -2.95629, 1, 1, 1, 1, 1,
-0.1222853, 1.268551, 1.695088, 1, 1, 1, 1, 1,
-0.1219796, 0.3774602, 0.1998079, 1, 1, 1, 1, 1,
-0.1207144, -0.6343647, -3.034343, 1, 1, 1, 1, 1,
-0.1190561, -0.3727863, -2.325699, 1, 1, 1, 1, 1,
-0.1174983, -1.155104, -3.756137, 1, 1, 1, 1, 1,
-0.1160132, -0.7052503, -2.279584, 1, 1, 1, 1, 1,
-0.1125071, -0.7696265, -2.166091, 1, 1, 1, 1, 1,
-0.109178, 1.194008, 0.405414, 1, 1, 1, 1, 1,
-0.1028578, 0.7209281, 0.5657288, 1, 1, 1, 1, 1,
-0.1018183, 0.04581688, 0.493335, 1, 1, 1, 1, 1,
-0.1012882, -0.7760803, -4.077101, 1, 1, 1, 1, 1,
-0.1012824, 1.359514, -1.670489, 1, 1, 1, 1, 1,
-0.09855447, -1.099446, -2.169328, 1, 1, 1, 1, 1,
-0.09525704, 1.100962, 1.072355, 0, 0, 1, 1, 1,
-0.09481788, 1.735167, -0.227065, 1, 0, 0, 1, 1,
-0.08927868, -0.4259552, -1.094193, 1, 0, 0, 1, 1,
-0.08834683, 1.223764, -0.4732604, 1, 0, 0, 1, 1,
-0.08710376, -2.466849, -1.987095, 1, 0, 0, 1, 1,
-0.08637978, -1.112029, -1.551073, 1, 0, 0, 1, 1,
-0.08486088, 0.1247354, -0.8332515, 0, 0, 0, 1, 1,
-0.07828605, -0.0003977901, -2.340388, 0, 0, 0, 1, 1,
-0.07817975, -0.542932, -1.8952, 0, 0, 0, 1, 1,
-0.07571638, 0.5679428, 0.002145925, 0, 0, 0, 1, 1,
-0.07104772, -0.8348061, -2.090065, 0, 0, 0, 1, 1,
-0.0676306, 1.29274, -1.252151, 0, 0, 0, 1, 1,
-0.06443343, 1.662387, 0.02140868, 0, 0, 0, 1, 1,
-0.05802759, 0.1956045, 0.4458952, 1, 1, 1, 1, 1,
-0.05646357, 0.4922841, 0.4255895, 1, 1, 1, 1, 1,
-0.05049867, -1.477157, -3.641368, 1, 1, 1, 1, 1,
-0.04770752, 1.334757, -0.1938482, 1, 1, 1, 1, 1,
-0.04719786, -0.03876004, -3.362191, 1, 1, 1, 1, 1,
-0.04609991, -0.08346155, -1.617918, 1, 1, 1, 1, 1,
-0.04229999, -0.5089685, -2.925448, 1, 1, 1, 1, 1,
-0.04200128, 0.4812701, -0.6613063, 1, 1, 1, 1, 1,
-0.03984069, 0.5569662, -1.204073, 1, 1, 1, 1, 1,
-0.03535177, -1.187164, -2.362191, 1, 1, 1, 1, 1,
-0.03170805, -2.345012, -3.559055, 1, 1, 1, 1, 1,
-0.03143222, 0.4421022, 0.6441586, 1, 1, 1, 1, 1,
-0.03059514, -0.5971074, -4.139603, 1, 1, 1, 1, 1,
-0.03044814, 1.490216, 0.01832201, 1, 1, 1, 1, 1,
-0.02935344, 0.3542698, 0.4280484, 1, 1, 1, 1, 1,
-0.02829767, -0.4023337, -2.01419, 0, 0, 1, 1, 1,
-0.024575, -0.4636348, -2.847257, 1, 0, 0, 1, 1,
-0.02440914, 0.800865, -1.227019, 1, 0, 0, 1, 1,
-0.02218133, 1.102495, -0.1914024, 1, 0, 0, 1, 1,
-0.02178618, 0.4723481, -0.9418923, 1, 0, 0, 1, 1,
-0.01914329, 1.056836, 0.04610711, 1, 0, 0, 1, 1,
-0.007577632, 0.1549434, -1.32716, 0, 0, 0, 1, 1,
-0.006930247, 0.607654, 0.8971778, 0, 0, 0, 1, 1,
-0.001917714, -1.698993, -3.625605, 0, 0, 0, 1, 1,
-0.001059423, -1.133818, -2.818383, 0, 0, 0, 1, 1,
0.00215, -0.01174635, 1.077703, 0, 0, 0, 1, 1,
0.002959085, -0.9292744, 3.61744, 0, 0, 0, 1, 1,
0.003811523, 1.745343, -0.07733089, 0, 0, 0, 1, 1,
0.003866562, 0.317798, -0.436125, 1, 1, 1, 1, 1,
0.01253565, 0.788686, 0.03490485, 1, 1, 1, 1, 1,
0.01263059, -0.7804566, 1.903566, 1, 1, 1, 1, 1,
0.02011647, 0.02693372, -0.2321335, 1, 1, 1, 1, 1,
0.02327343, 1.509649, -2.051392, 1, 1, 1, 1, 1,
0.02701274, 0.01515727, 1.40023, 1, 1, 1, 1, 1,
0.02832619, 0.4319516, -0.8257816, 1, 1, 1, 1, 1,
0.02874881, -0.02037995, 0.924685, 1, 1, 1, 1, 1,
0.03237895, 0.625143, 0.6238085, 1, 1, 1, 1, 1,
0.03301917, -0.7442436, 3.751152, 1, 1, 1, 1, 1,
0.03322269, -0.09377093, 4.027719, 1, 1, 1, 1, 1,
0.03585048, 0.8180978, -0.4709915, 1, 1, 1, 1, 1,
0.03846987, 0.332569, 1.437141, 1, 1, 1, 1, 1,
0.03888227, -0.6698069, 3.56549, 1, 1, 1, 1, 1,
0.04032193, -0.2345686, 1.655572, 1, 1, 1, 1, 1,
0.04216243, 0.1216745, 2.000646, 0, 0, 1, 1, 1,
0.04498418, -0.81691, 3.71404, 1, 0, 0, 1, 1,
0.05455374, 0.729315, -1.230482, 1, 0, 0, 1, 1,
0.05811053, 0.3552084, 0.6613417, 1, 0, 0, 1, 1,
0.05840819, -0.7197582, 2.36959, 1, 0, 0, 1, 1,
0.058727, 0.02874018, 0.2863987, 1, 0, 0, 1, 1,
0.05939484, 1.244948, -1.415391, 0, 0, 0, 1, 1,
0.06201443, -1.051778, 1.887577, 0, 0, 0, 1, 1,
0.06347971, -0.4067432, 3.119098, 0, 0, 0, 1, 1,
0.06439094, -0.8561127, 2.747225, 0, 0, 0, 1, 1,
0.06471344, 0.8414963, -0.3847903, 0, 0, 0, 1, 1,
0.06472082, -0.09719637, 2.470476, 0, 0, 0, 1, 1,
0.06485836, -0.8251714, 3.714341, 0, 0, 0, 1, 1,
0.06510188, 0.9010845, -1.083744, 1, 1, 1, 1, 1,
0.06687476, -1.247029, 4.098941, 1, 1, 1, 1, 1,
0.07152625, 0.6340952, 1.068103, 1, 1, 1, 1, 1,
0.07431167, -2.238639, 4.160731, 1, 1, 1, 1, 1,
0.07563174, -0.212299, 0.7976128, 1, 1, 1, 1, 1,
0.08030199, -1.036354, 4.016848, 1, 1, 1, 1, 1,
0.08051092, -0.8495568, 3.364122, 1, 1, 1, 1, 1,
0.08186436, -0.7548571, 4.010913, 1, 1, 1, 1, 1,
0.08189861, -1.29423, 5.238863, 1, 1, 1, 1, 1,
0.08203223, 0.2305645, -0.0993378, 1, 1, 1, 1, 1,
0.08610424, -1.133518, 1.510333, 1, 1, 1, 1, 1,
0.08641185, 0.7480608, -0.3492906, 1, 1, 1, 1, 1,
0.08762785, 1.002933, 0.3808166, 1, 1, 1, 1, 1,
0.08878831, 0.7633557, -0.3990928, 1, 1, 1, 1, 1,
0.09040211, 0.5776814, 0.5326622, 1, 1, 1, 1, 1,
0.0910131, 1.234885, -1.581447, 0, 0, 1, 1, 1,
0.09346465, -0.1138596, 2.617705, 1, 0, 0, 1, 1,
0.09359875, 0.5380629, 1.173923, 1, 0, 0, 1, 1,
0.09403648, 0.2412549, -0.1637165, 1, 0, 0, 1, 1,
0.09411182, 0.41093, -0.6459461, 1, 0, 0, 1, 1,
0.0946003, -1.122842, 3.971834, 1, 0, 0, 1, 1,
0.09547914, -0.6598895, 2.395929, 0, 0, 0, 1, 1,
0.0959495, -0.01834611, 2.584325, 0, 0, 0, 1, 1,
0.09899925, -0.9303942, 4.540612, 0, 0, 0, 1, 1,
0.1045145, 1.207811, -0.340579, 0, 0, 0, 1, 1,
0.1120559, 1.470247, 1.269549, 0, 0, 0, 1, 1,
0.1157824, 1.635023, -0.1226654, 0, 0, 0, 1, 1,
0.1160403, 0.6357794, 0.7355219, 0, 0, 0, 1, 1,
0.1190525, -0.1738261, 1.148234, 1, 1, 1, 1, 1,
0.1222878, -0.3423694, 4.757131, 1, 1, 1, 1, 1,
0.1259846, -0.338024, 1.651997, 1, 1, 1, 1, 1,
0.1303863, 0.447486, 1.899486, 1, 1, 1, 1, 1,
0.1453096, 0.743857, 1.663827, 1, 1, 1, 1, 1,
0.1478664, 0.6488695, -0.04054945, 1, 1, 1, 1, 1,
0.1495319, 0.3218638, -0.931177, 1, 1, 1, 1, 1,
0.1538231, 0.415303, -1.01543, 1, 1, 1, 1, 1,
0.1563029, 1.225586, 0.5169562, 1, 1, 1, 1, 1,
0.1572847, 0.1828593, 1.868749, 1, 1, 1, 1, 1,
0.1582959, 0.935026, -0.07699705, 1, 1, 1, 1, 1,
0.1618066, 0.07687739, 1.042107, 1, 1, 1, 1, 1,
0.1653449, 0.1752959, -0.4834875, 1, 1, 1, 1, 1,
0.1712899, 0.003400422, 2.94047, 1, 1, 1, 1, 1,
0.1724206, -0.9569108, 2.605087, 1, 1, 1, 1, 1,
0.1736448, -1.081257, 2.20742, 0, 0, 1, 1, 1,
0.1787118, -0.08866569, 1.274859, 1, 0, 0, 1, 1,
0.1850842, 0.3979769, 1.201975, 1, 0, 0, 1, 1,
0.1893214, 0.4697502, 1.679132, 1, 0, 0, 1, 1,
0.1893385, -0.1791472, 1.646802, 1, 0, 0, 1, 1,
0.1945248, -0.6191462, 1.86759, 1, 0, 0, 1, 1,
0.1949361, -1.324657, 2.541978, 0, 0, 0, 1, 1,
0.1951013, -0.4870183, 1.848001, 0, 0, 0, 1, 1,
0.195257, 0.1917348, 0.8694773, 0, 0, 0, 1, 1,
0.1957816, 0.2337933, -1.165337, 0, 0, 0, 1, 1,
0.1961638, -0.6347192, 2.280898, 0, 0, 0, 1, 1,
0.1978129, 1.015699, 1.680967, 0, 0, 0, 1, 1,
0.2001106, 0.5761214, 1.693933, 0, 0, 0, 1, 1,
0.2033415, 1.498479, 0.4796003, 1, 1, 1, 1, 1,
0.2037397, -1.04223, 2.176494, 1, 1, 1, 1, 1,
0.2060343, -0.05007806, -0.6631476, 1, 1, 1, 1, 1,
0.2065598, 1.375616, -0.9054463, 1, 1, 1, 1, 1,
0.2121008, -0.4230667, 3.86506, 1, 1, 1, 1, 1,
0.2170623, -0.5708213, 2.31148, 1, 1, 1, 1, 1,
0.2175416, 1.123766, 0.9647074, 1, 1, 1, 1, 1,
0.2217872, -0.490468, 3.633304, 1, 1, 1, 1, 1,
0.222338, -0.3911894, 4.364967, 1, 1, 1, 1, 1,
0.2280283, 0.564208, 1.142823, 1, 1, 1, 1, 1,
0.2284488, 1.410302, -0.7141091, 1, 1, 1, 1, 1,
0.2329419, -0.1312595, 3.161755, 1, 1, 1, 1, 1,
0.2331348, -1.16326, 4.175251, 1, 1, 1, 1, 1,
0.2394284, 0.147614, -0.3210352, 1, 1, 1, 1, 1,
0.2396799, -1.056743, 0.5013486, 1, 1, 1, 1, 1,
0.2443442, -0.4819995, 1.877886, 0, 0, 1, 1, 1,
0.247299, 0.08580253, 2.221795, 1, 0, 0, 1, 1,
0.2495416, -0.6830046, 2.843461, 1, 0, 0, 1, 1,
0.2496269, 0.1234391, 0.6291499, 1, 0, 0, 1, 1,
0.2496278, -1.833816, 4.160109, 1, 0, 0, 1, 1,
0.2531484, 0.2927672, 1.395005, 1, 0, 0, 1, 1,
0.2597038, 1.077474, -0.2914686, 0, 0, 0, 1, 1,
0.2607222, 0.9179486, 0.5554656, 0, 0, 0, 1, 1,
0.2608345, 0.5026612, 1.601907, 0, 0, 0, 1, 1,
0.2615512, -0.8952032, 3.548799, 0, 0, 0, 1, 1,
0.2642054, -0.4444951, 2.11526, 0, 0, 0, 1, 1,
0.2665565, 1.852687, -0.5256835, 0, 0, 0, 1, 1,
0.2728893, -0.4678412, 2.631452, 0, 0, 0, 1, 1,
0.2783304, -1.540331, 4.931289, 1, 1, 1, 1, 1,
0.2789086, 0.7004758, 1.971448, 1, 1, 1, 1, 1,
0.2814428, 0.6188195, 0.4546483, 1, 1, 1, 1, 1,
0.2841672, 1.138107, 0.4427186, 1, 1, 1, 1, 1,
0.2844627, -0.8845717, 3.525086, 1, 1, 1, 1, 1,
0.2858337, 1.116322, 1.946356, 1, 1, 1, 1, 1,
0.2943058, 0.76204, 1.540761, 1, 1, 1, 1, 1,
0.3051101, -0.6688812, 1.43759, 1, 1, 1, 1, 1,
0.305775, 0.7255929, 0.7563586, 1, 1, 1, 1, 1,
0.3064663, 0.6546805, -1.236771, 1, 1, 1, 1, 1,
0.3076549, -1.147059, 2.369872, 1, 1, 1, 1, 1,
0.3102283, 0.124574, 0.2900262, 1, 1, 1, 1, 1,
0.3104743, 0.7499977, 2.780873, 1, 1, 1, 1, 1,
0.3122368, 0.6180393, 0.4430439, 1, 1, 1, 1, 1,
0.3138335, 0.2542264, 2.170996, 1, 1, 1, 1, 1,
0.314338, 0.6175579, 0.4454103, 0, 0, 1, 1, 1,
0.3166091, -1.567062, 2.793334, 1, 0, 0, 1, 1,
0.3192329, -0.09551512, 2.477803, 1, 0, 0, 1, 1,
0.3199207, 0.4901302, 0.793053, 1, 0, 0, 1, 1,
0.320169, 1.589736, -2.158272, 1, 0, 0, 1, 1,
0.3217807, -0.1309492, 1.48553, 1, 0, 0, 1, 1,
0.3290027, 1.106017, 0.442142, 0, 0, 0, 1, 1,
0.3338453, 2.123013, 0.04727644, 0, 0, 0, 1, 1,
0.3387108, 0.5088148, 0.06914882, 0, 0, 0, 1, 1,
0.3392821, -1.906517, 1.893592, 0, 0, 0, 1, 1,
0.3406815, 0.7572344, 0.9654225, 0, 0, 0, 1, 1,
0.346679, -0.6299928, 2.004327, 0, 0, 0, 1, 1,
0.3476415, -0.942956, 3.765549, 0, 0, 0, 1, 1,
0.3485558, 1.210145, 1.269252, 1, 1, 1, 1, 1,
0.3537407, 0.1428951, 2.890975, 1, 1, 1, 1, 1,
0.3554227, 0.0132169, 1.317345, 1, 1, 1, 1, 1,
0.3563962, -0.8945797, 1.589285, 1, 1, 1, 1, 1,
0.3588032, -1.486361, 2.866361, 1, 1, 1, 1, 1,
0.3605846, -1.160383, 3.043261, 1, 1, 1, 1, 1,
0.3643588, -0.188933, 0.6908688, 1, 1, 1, 1, 1,
0.3654654, 1.387698, 0.2837825, 1, 1, 1, 1, 1,
0.3664404, 1.446536, 0.69827, 1, 1, 1, 1, 1,
0.3681318, -0.559888, 3.004229, 1, 1, 1, 1, 1,
0.3686055, -0.4160891, 2.926308, 1, 1, 1, 1, 1,
0.3725773, 0.4353682, -0.8296086, 1, 1, 1, 1, 1,
0.3732159, -0.2658838, 0.809851, 1, 1, 1, 1, 1,
0.3772919, -0.4137734, 2.569441, 1, 1, 1, 1, 1,
0.3776412, 0.1040586, 1.755581, 1, 1, 1, 1, 1,
0.3799668, -0.07029445, 0.9586839, 0, 0, 1, 1, 1,
0.382928, 1.213544, 0.7924582, 1, 0, 0, 1, 1,
0.3903507, 0.380915, -0.09320562, 1, 0, 0, 1, 1,
0.3929, -1.099016, 4.285141, 1, 0, 0, 1, 1,
0.4039603, 1.495531, 0.5254947, 1, 0, 0, 1, 1,
0.4050835, 1.816593, -1.070927, 1, 0, 0, 1, 1,
0.4082766, -1.283698, 2.203122, 0, 0, 0, 1, 1,
0.4106406, -0.2220962, 2.573336, 0, 0, 0, 1, 1,
0.4204694, -0.6735222, 1.477798, 0, 0, 0, 1, 1,
0.423536, -0.04818863, 2.304446, 0, 0, 0, 1, 1,
0.4259396, -0.0266624, 0.4131508, 0, 0, 0, 1, 1,
0.4270533, 1.19473, 0.1336862, 0, 0, 0, 1, 1,
0.4271408, -1.121167, 2.302679, 0, 0, 0, 1, 1,
0.4274775, 0.5180737, 0.9632986, 1, 1, 1, 1, 1,
0.4288494, 0.7627856, 2.969259, 1, 1, 1, 1, 1,
0.4288949, 0.6351187, 0.07493618, 1, 1, 1, 1, 1,
0.4289291, -0.6613064, 3.117801, 1, 1, 1, 1, 1,
0.436489, 1.735783, 0.1670939, 1, 1, 1, 1, 1,
0.4369728, -2.06734, 1.632167, 1, 1, 1, 1, 1,
0.4439685, 0.1479063, -0.4771558, 1, 1, 1, 1, 1,
0.4477672, 1.008227, -0.3392827, 1, 1, 1, 1, 1,
0.4516104, -0.3603583, 2.264031, 1, 1, 1, 1, 1,
0.4524032, -0.4618858, 2.665983, 1, 1, 1, 1, 1,
0.455772, -1.03586, 2.310044, 1, 1, 1, 1, 1,
0.4590619, 1.042115, 0.2696325, 1, 1, 1, 1, 1,
0.459686, 0.7728366, 1.839128, 1, 1, 1, 1, 1,
0.4606513, -0.410379, 2.909286, 1, 1, 1, 1, 1,
0.4709774, 0.3750843, 1.749178, 1, 1, 1, 1, 1,
0.4763994, 1.524599, 0.2085401, 0, 0, 1, 1, 1,
0.4804892, 0.5648052, 0.544845, 1, 0, 0, 1, 1,
0.4806373, 0.3529944, 0.8547617, 1, 0, 0, 1, 1,
0.4867203, 0.05416248, 2.845913, 1, 0, 0, 1, 1,
0.4906774, 0.2930123, 0.9459559, 1, 0, 0, 1, 1,
0.4950759, -0.6768624, 1.051909, 1, 0, 0, 1, 1,
0.4966979, 0.671848, 0.1736448, 0, 0, 0, 1, 1,
0.5005106, 0.4007092, 1.97432, 0, 0, 0, 1, 1,
0.5006728, 0.7474514, 0.7602345, 0, 0, 0, 1, 1,
0.5013389, -0.4081244, 0.6152207, 0, 0, 0, 1, 1,
0.5068727, -1.236426, 2.788502, 0, 0, 0, 1, 1,
0.5081404, 1.479478, 0.9136358, 0, 0, 0, 1, 1,
0.5093343, 4.003652, 0.68822, 0, 0, 0, 1, 1,
0.5116094, -0.1215661, 2.231441, 1, 1, 1, 1, 1,
0.5149471, -0.7940154, 3.429065, 1, 1, 1, 1, 1,
0.515511, 0.1062984, 3.874501, 1, 1, 1, 1, 1,
0.5178847, -0.05519485, 1.12534, 1, 1, 1, 1, 1,
0.5179073, 1.390575, 0.3440758, 1, 1, 1, 1, 1,
0.5225631, 1.799643, -0.3989875, 1, 1, 1, 1, 1,
0.5380628, -0.2290948, 0.5787489, 1, 1, 1, 1, 1,
0.5396876, 1.915363, -0.695673, 1, 1, 1, 1, 1,
0.5410924, -0.230036, 1.93623, 1, 1, 1, 1, 1,
0.543182, 0.7206694, -0.1027309, 1, 1, 1, 1, 1,
0.561183, 2.19105, 0.9024984, 1, 1, 1, 1, 1,
0.561912, 0.1052831, -0.3379326, 1, 1, 1, 1, 1,
0.5625073, -1.39292, 2.510256, 1, 1, 1, 1, 1,
0.5651063, 0.5136769, 1.324885, 1, 1, 1, 1, 1,
0.5658154, 0.4771891, -0.3294859, 1, 1, 1, 1, 1,
0.5785443, 0.3213403, -0.40944, 0, 0, 1, 1, 1,
0.5836344, 0.6986619, 1.912089, 1, 0, 0, 1, 1,
0.5890425, 0.02109251, 0.7844786, 1, 0, 0, 1, 1,
0.5907313, -1.307296, 3.311537, 1, 0, 0, 1, 1,
0.591238, 0.5363426, -0.8941019, 1, 0, 0, 1, 1,
0.5950631, 0.2046508, 1.07289, 1, 0, 0, 1, 1,
0.5993072, -0.5798038, 2.633632, 0, 0, 0, 1, 1,
0.5994667, -1.24318, 2.242455, 0, 0, 0, 1, 1,
0.6044241, -0.3378782, 3.616169, 0, 0, 0, 1, 1,
0.6052855, 1.669669, 0.4448947, 0, 0, 0, 1, 1,
0.6146493, -0.2686036, 2.173323, 0, 0, 0, 1, 1,
0.6213893, 1.847696, -0.5100347, 0, 0, 0, 1, 1,
0.6289315, 1.306718, -0.03570417, 0, 0, 0, 1, 1,
0.634458, 1.02283, 0.7325796, 1, 1, 1, 1, 1,
0.634709, 1.69188, 1.401795, 1, 1, 1, 1, 1,
0.6408992, 1.724051, 0.9527781, 1, 1, 1, 1, 1,
0.6468651, 0.03157351, 0.01091335, 1, 1, 1, 1, 1,
0.6522935, 0.02803759, -0.2072706, 1, 1, 1, 1, 1,
0.6526524, 1.663432, -1.487522, 1, 1, 1, 1, 1,
0.6556945, 0.1460301, 2.507596, 1, 1, 1, 1, 1,
0.6565773, 0.4788806, 1.12936, 1, 1, 1, 1, 1,
0.6661929, 1.122224, -0.5382968, 1, 1, 1, 1, 1,
0.6662019, -1.52202, 1.61909, 1, 1, 1, 1, 1,
0.6676493, -1.654289, 3.307163, 1, 1, 1, 1, 1,
0.6702747, -2.328111, 1.8829, 1, 1, 1, 1, 1,
0.6734217, -1.229225, 2.182191, 1, 1, 1, 1, 1,
0.6756468, -2.180674, 4.036294, 1, 1, 1, 1, 1,
0.6756896, 1.17513, 0.08837302, 1, 1, 1, 1, 1,
0.6849788, -0.4789953, 2.321525, 0, 0, 1, 1, 1,
0.6873338, -0.02399979, 0.7305108, 1, 0, 0, 1, 1,
0.6877734, 0.2997231, 1.937584, 1, 0, 0, 1, 1,
0.7032171, -1.118851, 3.319859, 1, 0, 0, 1, 1,
0.7038684, 0.7448692, 1.494693, 1, 0, 0, 1, 1,
0.7115845, 2.206377, 1.971121, 1, 0, 0, 1, 1,
0.7124632, 0.1273761, 1.791847, 0, 0, 0, 1, 1,
0.7210888, -0.5335298, 1.978703, 0, 0, 0, 1, 1,
0.7284709, -0.7739097, 1.775892, 0, 0, 0, 1, 1,
0.738227, -0.1803276, 2.335783, 0, 0, 0, 1, 1,
0.7387228, 0.8186475, 1.423764, 0, 0, 0, 1, 1,
0.7393827, 0.1259123, 2.374546, 0, 0, 0, 1, 1,
0.7430688, 0.4178735, 2.092314, 0, 0, 0, 1, 1,
0.7437435, -1.522644, 2.43792, 1, 1, 1, 1, 1,
0.7437519, -0.1445705, 2.775534, 1, 1, 1, 1, 1,
0.7467221, -0.4056165, 2.369998, 1, 1, 1, 1, 1,
0.7506229, 0.656747, 0.004879112, 1, 1, 1, 1, 1,
0.7630506, 0.6787072, 0.8835572, 1, 1, 1, 1, 1,
0.7688487, -1.158765, 2.113028, 1, 1, 1, 1, 1,
0.7731325, -0.4073501, 1.479897, 1, 1, 1, 1, 1,
0.7732103, 1.068879, -1.407658, 1, 1, 1, 1, 1,
0.7736304, 0.2909569, 0.6534798, 1, 1, 1, 1, 1,
0.777199, -0.3655585, 2.400356, 1, 1, 1, 1, 1,
0.7815208, -0.1683344, 3.441842, 1, 1, 1, 1, 1,
0.7827215, 2.017453, 0.9520789, 1, 1, 1, 1, 1,
0.7846777, 0.4507565, 1.004339, 1, 1, 1, 1, 1,
0.7880348, 0.1955722, 0.5407243, 1, 1, 1, 1, 1,
0.7897021, -0.3762008, 3.905411, 1, 1, 1, 1, 1,
0.804244, 1.450395, 2.328988, 0, 0, 1, 1, 1,
0.804715, 0.8137085, -0.9867299, 1, 0, 0, 1, 1,
0.8062844, 0.8829102, 1.168338, 1, 0, 0, 1, 1,
0.8067318, 0.3122816, 0.9252281, 1, 0, 0, 1, 1,
0.807196, 0.2277247, 1.279355, 1, 0, 0, 1, 1,
0.8079163, -0.04817713, -0.7541541, 1, 0, 0, 1, 1,
0.8080752, -0.08554512, 2.429118, 0, 0, 0, 1, 1,
0.8083581, -1.048606, 3.571418, 0, 0, 0, 1, 1,
0.8185432, 0.4652326, 1.638109, 0, 0, 0, 1, 1,
0.8188636, 1.505112, 2.106583, 0, 0, 0, 1, 1,
0.8201251, 0.01148635, 1.328165, 0, 0, 0, 1, 1,
0.8279783, -0.6946913, 0.6370598, 0, 0, 0, 1, 1,
0.8281949, -2.249902, 2.753442, 0, 0, 0, 1, 1,
0.8288313, 0.463837, 2.044492, 1, 1, 1, 1, 1,
0.8323413, 0.177551, 0.724208, 1, 1, 1, 1, 1,
0.8333257, -1.8156, 2.88072, 1, 1, 1, 1, 1,
0.8335094, 1.715093, -0.3575089, 1, 1, 1, 1, 1,
0.8335342, 1.24601, 0.9984891, 1, 1, 1, 1, 1,
0.8345518, -0.262812, -0.1788873, 1, 1, 1, 1, 1,
0.8371047, 0.7696028, 1.437487, 1, 1, 1, 1, 1,
0.8402993, 1.78597, -1.309719, 1, 1, 1, 1, 1,
0.8429505, 0.8008518, 0.3418707, 1, 1, 1, 1, 1,
0.848192, 0.3770776, 0.2352113, 1, 1, 1, 1, 1,
0.8492028, 1.798334, 1.459815, 1, 1, 1, 1, 1,
0.8537961, -0.005431198, 1.514786, 1, 1, 1, 1, 1,
0.8564481, -0.8866624, 2.026165, 1, 1, 1, 1, 1,
0.8591768, 0.04689937, 2.038997, 1, 1, 1, 1, 1,
0.8601398, -0.8709877, 2.644984, 1, 1, 1, 1, 1,
0.864181, 0.7430704, 0.5162328, 0, 0, 1, 1, 1,
0.8767768, -1.1618, 1.092638, 1, 0, 0, 1, 1,
0.8811585, -0.3767153, 2.208496, 1, 0, 0, 1, 1,
0.8893457, 1.199506, -0.2385798, 1, 0, 0, 1, 1,
0.8973481, 0.9204904, 1.592959, 1, 0, 0, 1, 1,
0.9015894, 1.479685, -0.7066551, 1, 0, 0, 1, 1,
0.9062727, 0.2641484, 1.115752, 0, 0, 0, 1, 1,
0.9104869, 0.5104437, 2.323331, 0, 0, 0, 1, 1,
0.9255921, -0.7888123, 3.422154, 0, 0, 0, 1, 1,
0.9268216, 0.7391284, 0.7151114, 0, 0, 0, 1, 1,
0.9310801, 0.6527525, 1.212529, 0, 0, 0, 1, 1,
0.9342967, -0.4264786, 1.383746, 0, 0, 0, 1, 1,
0.9350242, -0.639163, 3.396425, 0, 0, 0, 1, 1,
0.9375473, -0.8041105, 2.132891, 1, 1, 1, 1, 1,
0.9407597, -1.227932, 2.928303, 1, 1, 1, 1, 1,
0.9426233, 1.927768, 0.6857888, 1, 1, 1, 1, 1,
0.9430169, -1.802285, 3.127886, 1, 1, 1, 1, 1,
0.944603, 0.3658629, 0.6999546, 1, 1, 1, 1, 1,
0.9454923, 2.369521, -0.4315936, 1, 1, 1, 1, 1,
0.9473705, 1.037099, 0.6184725, 1, 1, 1, 1, 1,
0.9518546, 0.3911853, 1.316266, 1, 1, 1, 1, 1,
0.9666918, -0.8454506, 3.328432, 1, 1, 1, 1, 1,
0.9861167, 0.6195505, 2.39601, 1, 1, 1, 1, 1,
1.003209, 1.346048, 1.719656, 1, 1, 1, 1, 1,
1.004325, 1.696544, -0.7250334, 1, 1, 1, 1, 1,
1.007959, -0.8861284, 2.742863, 1, 1, 1, 1, 1,
1.027786, 0.07330339, 0.7588947, 1, 1, 1, 1, 1,
1.031845, -0.3832822, 1.753843, 1, 1, 1, 1, 1,
1.037538, -0.2210648, 0.6577784, 0, 0, 1, 1, 1,
1.038594, -1.412594, 2.292669, 1, 0, 0, 1, 1,
1.048546, -0.8957935, 0.260248, 1, 0, 0, 1, 1,
1.061237, -0.1081267, 1.964007, 1, 0, 0, 1, 1,
1.067425, 2.122063, 0.07909985, 1, 0, 0, 1, 1,
1.068036, 1.535515, -0.255533, 1, 0, 0, 1, 1,
1.076589, 1.355432, 1.168905, 0, 0, 0, 1, 1,
1.079963, -0.2638582, 2.681802, 0, 0, 0, 1, 1,
1.080842, 0.5206518, 2.209719, 0, 0, 0, 1, 1,
1.08397, -0.1869911, 2.76509, 0, 0, 0, 1, 1,
1.089456, 1.273476, 2.333815, 0, 0, 0, 1, 1,
1.102685, 1.007714, -1.97166, 0, 0, 0, 1, 1,
1.109768, -0.4320255, 1.045492, 0, 0, 0, 1, 1,
1.111872, -0.5561407, 2.912592, 1, 1, 1, 1, 1,
1.113817, 1.240371, 2.158619, 1, 1, 1, 1, 1,
1.116304, 1.581737, 1.005766, 1, 1, 1, 1, 1,
1.117803, 0.4744407, 1.408783, 1, 1, 1, 1, 1,
1.130756, -0.007430359, 1.882915, 1, 1, 1, 1, 1,
1.133626, 0.6369333, 0.7549401, 1, 1, 1, 1, 1,
1.135021, 1.58095, -0.3578258, 1, 1, 1, 1, 1,
1.147901, 0.6317582, 1.757302, 1, 1, 1, 1, 1,
1.151534, 0.2081027, 2.14781, 1, 1, 1, 1, 1,
1.172497, -0.3464923, 1.068184, 1, 1, 1, 1, 1,
1.183369, -0.7826312, 1.201823, 1, 1, 1, 1, 1,
1.188087, -0.2196902, 2.913429, 1, 1, 1, 1, 1,
1.191936, -0.2397041, 1.86935, 1, 1, 1, 1, 1,
1.192676, 1.147167, 0.3117933, 1, 1, 1, 1, 1,
1.194535, -0.2009884, -0.4828846, 1, 1, 1, 1, 1,
1.209643, -1.812076, 2.318682, 0, 0, 1, 1, 1,
1.216783, -0.6920862, 1.834869, 1, 0, 0, 1, 1,
1.217343, 0.1505616, 2.922415, 1, 0, 0, 1, 1,
1.233698, -1.226988, 1.823971, 1, 0, 0, 1, 1,
1.248555, 0.5881629, -0.9496441, 1, 0, 0, 1, 1,
1.251958, 0.2020046, 2.981407, 1, 0, 0, 1, 1,
1.25298, -1.185364, 3.572734, 0, 0, 0, 1, 1,
1.253154, -0.6729276, 2.393465, 0, 0, 0, 1, 1,
1.257884, -1.086322, 3.786134, 0, 0, 0, 1, 1,
1.263445, 1.288201, 0.4031591, 0, 0, 0, 1, 1,
1.27189, 2.552708, 0.9348122, 0, 0, 0, 1, 1,
1.272472, -0.9434859, 1.356218, 0, 0, 0, 1, 1,
1.277643, -0.4876326, 1.198876, 0, 0, 0, 1, 1,
1.277709, 0.2660543, 1.928739, 1, 1, 1, 1, 1,
1.302646, -0.03838715, -0.01469041, 1, 1, 1, 1, 1,
1.304561, -0.5037302, 2.540451, 1, 1, 1, 1, 1,
1.307644, -0.1872878, 2.183927, 1, 1, 1, 1, 1,
1.316054, -0.002890548, 1.28767, 1, 1, 1, 1, 1,
1.317582, -1.279459, 2.024278, 1, 1, 1, 1, 1,
1.323674, 2.20049, -0.1892923, 1, 1, 1, 1, 1,
1.326655, 0.8478813, -0.7079623, 1, 1, 1, 1, 1,
1.328367, 1.873291, 1.294284, 1, 1, 1, 1, 1,
1.329257, -1.629151, 0.4026752, 1, 1, 1, 1, 1,
1.352997, 1.695312, 2.086015, 1, 1, 1, 1, 1,
1.354529, -1.477429, 2.365304, 1, 1, 1, 1, 1,
1.365121, 0.478599, 1.742318, 1, 1, 1, 1, 1,
1.371908, -1.128631, 1.986852, 1, 1, 1, 1, 1,
1.372239, 0.3615039, 1.072769, 1, 1, 1, 1, 1,
1.386031, -0.2874228, 0.7672166, 0, 0, 1, 1, 1,
1.388864, 0.9510682, -0.735207, 1, 0, 0, 1, 1,
1.395555, -1.343622, 2.223831, 1, 0, 0, 1, 1,
1.398442, 1.696306, 0.2819613, 1, 0, 0, 1, 1,
1.404558, -0.8073558, 4.933733, 1, 0, 0, 1, 1,
1.416446, -0.8297756, 1.142757, 1, 0, 0, 1, 1,
1.42708, -0.1337745, 0.1719797, 0, 0, 0, 1, 1,
1.429998, 0.1800279, 0.6694353, 0, 0, 0, 1, 1,
1.445338, 0.428222, 0.007432948, 0, 0, 0, 1, 1,
1.466079, -3.105581, 2.420644, 0, 0, 0, 1, 1,
1.471059, -0.577053, 1.89012, 0, 0, 0, 1, 1,
1.501631, -0.7812637, 1.403275, 0, 0, 0, 1, 1,
1.514085, -0.6106435, 2.257659, 0, 0, 0, 1, 1,
1.514689, -1.504484, 2.391963, 1, 1, 1, 1, 1,
1.520125, 1.520291, 1.294781, 1, 1, 1, 1, 1,
1.525423, 0.4156704, 0.3014389, 1, 1, 1, 1, 1,
1.528162, 1.374569, 1.957399, 1, 1, 1, 1, 1,
1.538684, -0.8398718, 2.56737, 1, 1, 1, 1, 1,
1.562327, 0.8937913, 1.773266, 1, 1, 1, 1, 1,
1.585598, 0.3537301, 1.360024, 1, 1, 1, 1, 1,
1.591945, 0.9197414, 1.237267, 1, 1, 1, 1, 1,
1.613097, 1.724898, 2.233927, 1, 1, 1, 1, 1,
1.654885, 1.034003, -0.3123653, 1, 1, 1, 1, 1,
1.660069, -0.464597, 0.4730251, 1, 1, 1, 1, 1,
1.679829, 0.1968118, 1.366848, 1, 1, 1, 1, 1,
1.685462, 0.1767997, 0.1527653, 1, 1, 1, 1, 1,
1.686577, -0.3772684, 0.6442082, 1, 1, 1, 1, 1,
1.695639, 1.054521, -0.5092996, 1, 1, 1, 1, 1,
1.721836, 0.1723607, 1.284159, 0, 0, 1, 1, 1,
1.739272, 1.210881, 2.086715, 1, 0, 0, 1, 1,
1.741226, -0.2930364, 2.081001, 1, 0, 0, 1, 1,
1.745924, -0.4610055, 1.475381, 1, 0, 0, 1, 1,
1.754376, 1.063957, 1.065798, 1, 0, 0, 1, 1,
1.770326, -1.439918, 1.790469, 1, 0, 0, 1, 1,
1.806234, -0.2066082, 1.5921, 0, 0, 0, 1, 1,
1.806954, 1.384946, 1.058689, 0, 0, 0, 1, 1,
1.817729, -1.07321, 1.09389, 0, 0, 0, 1, 1,
1.856193, 1.378101, 1.575657, 0, 0, 0, 1, 1,
1.861422, 0.1906375, 0.703343, 0, 0, 0, 1, 1,
1.872024, 0.3231279, 1.970902, 0, 0, 0, 1, 1,
1.879685, -0.2382297, 0.03733034, 0, 0, 0, 1, 1,
1.88219, 0.8516166, 1.650215, 1, 1, 1, 1, 1,
1.888691, -0.9130162, 2.595986, 1, 1, 1, 1, 1,
1.900258, -0.8734614, 3.057576, 1, 1, 1, 1, 1,
1.912771, 1.128003, 1.630087, 1, 1, 1, 1, 1,
1.973121, 0.8415967, 1.172813, 1, 1, 1, 1, 1,
1.978279, -0.4767842, 0.4254488, 1, 1, 1, 1, 1,
1.987254, 1.229804, 0.4548089, 1, 1, 1, 1, 1,
1.98929, 1.125318, 1.474498, 1, 1, 1, 1, 1,
2.003928, 1.294047, 0.8534881, 1, 1, 1, 1, 1,
2.018937, -1.035884, 0.2423151, 1, 1, 1, 1, 1,
2.033521, -0.1849462, 1.415886, 1, 1, 1, 1, 1,
2.038671, -0.5841369, 1.089277, 1, 1, 1, 1, 1,
2.106992, 0.5925848, 1.200974, 1, 1, 1, 1, 1,
2.109903, -1.446233, 0.25371, 1, 1, 1, 1, 1,
2.128541, 0.5199835, 1.892377, 1, 1, 1, 1, 1,
2.129212, 0.9302587, 1.778113, 0, 0, 1, 1, 1,
2.130952, 0.3668415, 0.2631322, 1, 0, 0, 1, 1,
2.161317, 0.6378264, 3.021924, 1, 0, 0, 1, 1,
2.16401, 0.469532, -0.2587036, 1, 0, 0, 1, 1,
2.166829, 1.17376, 1.898911, 1, 0, 0, 1, 1,
2.212525, 0.1642667, 1.666557, 1, 0, 0, 1, 1,
2.280418, 0.9301308, 1.818037, 0, 0, 0, 1, 1,
2.304977, -0.984939, 0.03614985, 0, 0, 0, 1, 1,
2.318365, -0.6221917, 1.812302, 0, 0, 0, 1, 1,
2.34319, -0.1621034, 1.159861, 0, 0, 0, 1, 1,
2.350926, -0.1183084, 2.11521, 0, 0, 0, 1, 1,
2.358412, -0.5115898, 0.8636293, 0, 0, 0, 1, 1,
2.510402, 1.451522, 1.818285, 0, 0, 0, 1, 1,
2.6175, -1.263775, 0.6695294, 1, 1, 1, 1, 1,
2.634445, -1.631662, 1.329035, 1, 1, 1, 1, 1,
2.729994, -0.06392355, 1.771526, 1, 1, 1, 1, 1,
2.797443, 1.05722, 0.06412248, 1, 1, 1, 1, 1,
2.812104, -0.4040972, -0.5669358, 1, 1, 1, 1, 1,
3.18653, -0.7115394, 1.217924, 1, 1, 1, 1, 1,
3.412957, -1.266694, 1.853735, 1, 1, 1, 1, 1
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
var radius = 9.702121;
var distance = 34.07829;
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
mvMatrix.translate( 0.00271368, -0.4490352, -0.1109221 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.07829);
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
