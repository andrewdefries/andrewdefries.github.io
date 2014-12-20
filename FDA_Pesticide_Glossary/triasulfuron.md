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
-3.391977, -1.33251, -3.038946, 1, 0, 0, 1,
-2.754806, 1.009442, -1.786691, 1, 0.007843138, 0, 1,
-2.71349, -0.1056083, -3.682162, 1, 0.01176471, 0, 1,
-2.703793, -1.876378, -1.33384, 1, 0.01960784, 0, 1,
-2.589008, 1.475097, -1.894288, 1, 0.02352941, 0, 1,
-2.553716, -1.977011, -1.586456, 1, 0.03137255, 0, 1,
-2.535757, -0.279003, -1.791253, 1, 0.03529412, 0, 1,
-2.426997, 0.5483215, -1.765418, 1, 0.04313726, 0, 1,
-2.292515, -0.09321491, -2.923913, 1, 0.04705882, 0, 1,
-2.287325, 1.018675, -3.19273, 1, 0.05490196, 0, 1,
-2.240095, 0.3474206, -1.49215, 1, 0.05882353, 0, 1,
-2.225815, -1.306636, -3.103968, 1, 0.06666667, 0, 1,
-2.189909, 0.6805238, 1.158655, 1, 0.07058824, 0, 1,
-2.187857, -0.7500458, -0.9245449, 1, 0.07843138, 0, 1,
-2.14576, -0.40055, 1.837197, 1, 0.08235294, 0, 1,
-2.141603, -1.695069, -3.716711, 1, 0.09019608, 0, 1,
-2.12113, 0.08848193, -1.351817, 1, 0.09411765, 0, 1,
-2.118831, 0.2853481, -1.874747, 1, 0.1019608, 0, 1,
-2.111586, 0.4223029, -1.339648, 1, 0.1098039, 0, 1,
-2.054433, -1.740579, -2.145172, 1, 0.1137255, 0, 1,
-2.03365, 1.182752, -1.16102, 1, 0.1215686, 0, 1,
-2.019384, 0.7086245, -2.429172, 1, 0.1254902, 0, 1,
-1.99847, -0.8326232, -2.222168, 1, 0.1333333, 0, 1,
-1.984256, 0.9428813, -2.160433, 1, 0.1372549, 0, 1,
-1.974754, 1.68826, 1.037853, 1, 0.145098, 0, 1,
-1.963877, 0.8515917, -1.103558, 1, 0.1490196, 0, 1,
-1.960303, 0.827013, -1.696281, 1, 0.1568628, 0, 1,
-1.931514, -0.836911, -2.187541, 1, 0.1607843, 0, 1,
-1.892277, 1.219969, -0.7533136, 1, 0.1686275, 0, 1,
-1.87667, 1.354856, -0.08979917, 1, 0.172549, 0, 1,
-1.828712, 1.480051, 0.2368432, 1, 0.1803922, 0, 1,
-1.798771, -0.2369678, -1.904413, 1, 0.1843137, 0, 1,
-1.79131, -0.8864111, -3.231448, 1, 0.1921569, 0, 1,
-1.785329, 0.1114259, -1.325497, 1, 0.1960784, 0, 1,
-1.751905, 1.058529, 0.2167261, 1, 0.2039216, 0, 1,
-1.740158, 0.5375499, -1.416511, 1, 0.2117647, 0, 1,
-1.725429, -1.333166, -3.490843, 1, 0.2156863, 0, 1,
-1.725139, 0.1070301, -0.1918674, 1, 0.2235294, 0, 1,
-1.710029, 0.2419891, -1.888736, 1, 0.227451, 0, 1,
-1.709006, 2.022713, -0.2816729, 1, 0.2352941, 0, 1,
-1.706748, -1.541063, -4.168279, 1, 0.2392157, 0, 1,
-1.702632, 0.6961989, 0.4966574, 1, 0.2470588, 0, 1,
-1.67806, 0.04938334, -2.112776, 1, 0.2509804, 0, 1,
-1.673176, -1.352956, -3.227402, 1, 0.2588235, 0, 1,
-1.651877, 0.5387778, -1.908576, 1, 0.2627451, 0, 1,
-1.638479, -0.5662907, -0.5407221, 1, 0.2705882, 0, 1,
-1.622601, 0.4880101, -2.523731, 1, 0.2745098, 0, 1,
-1.621229, 0.1129937, -2.186604, 1, 0.282353, 0, 1,
-1.59853, 0.7237025, -0.3917559, 1, 0.2862745, 0, 1,
-1.577796, -1.690071, -2.342062, 1, 0.2941177, 0, 1,
-1.566873, -0.609304, -1.345428, 1, 0.3019608, 0, 1,
-1.557831, -0.5812029, -1.73847, 1, 0.3058824, 0, 1,
-1.555623, -0.3424406, -0.6837922, 1, 0.3137255, 0, 1,
-1.545463, 0.4900981, -1.942834, 1, 0.3176471, 0, 1,
-1.54089, 1.46252, -1.237197, 1, 0.3254902, 0, 1,
-1.53337, -0.6310174, -3.726201, 1, 0.3294118, 0, 1,
-1.531171, -1.451755, -1.446787, 1, 0.3372549, 0, 1,
-1.529444, 1.09711, -1.696727, 1, 0.3411765, 0, 1,
-1.528749, 1.350973, -2.621857, 1, 0.3490196, 0, 1,
-1.522132, -0.1408466, -2.550995, 1, 0.3529412, 0, 1,
-1.522062, 0.1345976, -1.199209, 1, 0.3607843, 0, 1,
-1.521847, -0.005119056, -0.8924963, 1, 0.3647059, 0, 1,
-1.520793, 0.149566, -0.5626195, 1, 0.372549, 0, 1,
-1.505844, -0.431823, -1.352575, 1, 0.3764706, 0, 1,
-1.498105, -0.2393099, -2.717938, 1, 0.3843137, 0, 1,
-1.496763, -1.416889, -2.004532, 1, 0.3882353, 0, 1,
-1.473532, 0.4182408, -0.7594029, 1, 0.3960784, 0, 1,
-1.473364, -0.5659184, -1.951321, 1, 0.4039216, 0, 1,
-1.462099, -0.1933971, -3.729642, 1, 0.4078431, 0, 1,
-1.450399, -0.582702, -1.970978, 1, 0.4156863, 0, 1,
-1.448256, -0.4655403, -1.319976, 1, 0.4196078, 0, 1,
-1.448091, -0.5747201, -1.260573, 1, 0.427451, 0, 1,
-1.442318, -2.520989, -5.105684, 1, 0.4313726, 0, 1,
-1.440567, 0.005044464, -1.94, 1, 0.4392157, 0, 1,
-1.428424, 0.04106808, -2.290523, 1, 0.4431373, 0, 1,
-1.42032, 1.138145, -2.341721, 1, 0.4509804, 0, 1,
-1.419929, -1.031238, -3.127932, 1, 0.454902, 0, 1,
-1.413148, 0.1166864, -0.5948801, 1, 0.4627451, 0, 1,
-1.401356, -0.1317118, -2.245079, 1, 0.4666667, 0, 1,
-1.378616, -2.728747, -1.710079, 1, 0.4745098, 0, 1,
-1.369312, -0.1808598, -1.351244, 1, 0.4784314, 0, 1,
-1.363037, 1.339146, -0.2228175, 1, 0.4862745, 0, 1,
-1.346085, 0.3829955, 1.391828, 1, 0.4901961, 0, 1,
-1.338508, -1.153289, -1.206376, 1, 0.4980392, 0, 1,
-1.318078, -1.137168, -2.911685, 1, 0.5058824, 0, 1,
-1.317189, -0.2969779, -2.17311, 1, 0.509804, 0, 1,
-1.30204, -0.8910994, -3.001498, 1, 0.5176471, 0, 1,
-1.301804, -2.273081, -1.634675, 1, 0.5215687, 0, 1,
-1.290927, 1.303968, -0.3308509, 1, 0.5294118, 0, 1,
-1.288712, 0.5374878, 0.2428987, 1, 0.5333334, 0, 1,
-1.287864, 0.4303569, -0.5788081, 1, 0.5411765, 0, 1,
-1.282878, -1.324451, -0.2919767, 1, 0.5450981, 0, 1,
-1.271503, 0.1021943, -2.417371, 1, 0.5529412, 0, 1,
-1.263708, -1.60619, -0.9996946, 1, 0.5568628, 0, 1,
-1.24515, -0.2031739, -0.969741, 1, 0.5647059, 0, 1,
-1.243041, -0.3519007, -2.563237, 1, 0.5686275, 0, 1,
-1.22198, -0.9411131, -1.57907, 1, 0.5764706, 0, 1,
-1.217563, -1.019988, -3.07162, 1, 0.5803922, 0, 1,
-1.206246, -0.50992, -1.92841, 1, 0.5882353, 0, 1,
-1.20028, 0.2089879, -1.990245, 1, 0.5921569, 0, 1,
-1.188403, -0.2211837, -1.642881, 1, 0.6, 0, 1,
-1.185397, 1.320659, -1.971616, 1, 0.6078432, 0, 1,
-1.180047, 1.21395, -1.424474, 1, 0.6117647, 0, 1,
-1.171136, -2.023664, -3.898916, 1, 0.6196079, 0, 1,
-1.168783, -1.171921, -1.983045, 1, 0.6235294, 0, 1,
-1.167723, 0.06457434, -1.955558, 1, 0.6313726, 0, 1,
-1.158291, -0.2815448, -1.228228, 1, 0.6352941, 0, 1,
-1.156013, 0.1939936, -0.2977171, 1, 0.6431373, 0, 1,
-1.15342, -0.07795399, -1.541511, 1, 0.6470588, 0, 1,
-1.148039, 0.880365, 0.006201073, 1, 0.654902, 0, 1,
-1.144502, -0.9311898, -1.514955, 1, 0.6588235, 0, 1,
-1.1412, 0.5609562, 1.635011, 1, 0.6666667, 0, 1,
-1.129876, -0.4903463, -3.38532, 1, 0.6705883, 0, 1,
-1.125234, 0.4016563, -2.514564, 1, 0.6784314, 0, 1,
-1.12412, 0.6687893, -1.707506, 1, 0.682353, 0, 1,
-1.119014, -0.1659857, -1.297146, 1, 0.6901961, 0, 1,
-1.118851, 0.3864194, -0.09358332, 1, 0.6941177, 0, 1,
-1.111689, -2.589178, -2.123813, 1, 0.7019608, 0, 1,
-1.111544, 0.3318612, -2.284693, 1, 0.7098039, 0, 1,
-1.111349, -1.636135, -1.246164, 1, 0.7137255, 0, 1,
-1.108476, 0.8023223, -0.7706193, 1, 0.7215686, 0, 1,
-1.106395, -2.353305, -3.338313, 1, 0.7254902, 0, 1,
-1.092535, 1.011386, -0.6321533, 1, 0.7333333, 0, 1,
-1.091912, -2.304178, -1.865518, 1, 0.7372549, 0, 1,
-1.083856, -0.3777508, -3.455478, 1, 0.7450981, 0, 1,
-1.078336, 1.759211, -1.852511, 1, 0.7490196, 0, 1,
-1.077851, 0.2105528, -1.024223, 1, 0.7568628, 0, 1,
-1.077726, -0.7644511, -1.468087, 1, 0.7607843, 0, 1,
-1.076231, -0.6089304, -1.837029, 1, 0.7686275, 0, 1,
-1.074488, 0.2294703, -0.7295828, 1, 0.772549, 0, 1,
-1.073207, -0.02378658, -2.349995, 1, 0.7803922, 0, 1,
-1.069315, -1.265803, -1.862527, 1, 0.7843137, 0, 1,
-1.065898, 0.2616363, -1.802736, 1, 0.7921569, 0, 1,
-1.058658, -2.109869, -3.846511, 1, 0.7960784, 0, 1,
-1.053617, 1.588099, -0.8996097, 1, 0.8039216, 0, 1,
-1.052961, 0.08074061, -0.7614639, 1, 0.8117647, 0, 1,
-1.050551, 0.3206824, -0.2399667, 1, 0.8156863, 0, 1,
-1.037956, -0.6361951, -0.449116, 1, 0.8235294, 0, 1,
-1.024034, 1.655236, -0.9037026, 1, 0.827451, 0, 1,
-1.021756, -1.258802, -3.775415, 1, 0.8352941, 0, 1,
-1.015208, 1.139814, -0.831857, 1, 0.8392157, 0, 1,
-1.013068, 0.2836551, -0.001616809, 1, 0.8470588, 0, 1,
-1.009367, -0.3427284, -1.292552, 1, 0.8509804, 0, 1,
-1.008661, -0.4002227, -4.484052, 1, 0.8588235, 0, 1,
-1.00615, 0.3256994, -1.287908, 1, 0.8627451, 0, 1,
-1.00221, -1.027117, -2.471752, 1, 0.8705882, 0, 1,
-0.9963485, 0.06346893, -2.919396, 1, 0.8745098, 0, 1,
-0.9956244, 0.58329, -3.440059, 1, 0.8823529, 0, 1,
-0.9911293, -0.8677918, -1.680197, 1, 0.8862745, 0, 1,
-0.9865962, 0.9216675, -1.220682, 1, 0.8941177, 0, 1,
-0.9838826, 0.7111016, -2.567147, 1, 0.8980392, 0, 1,
-0.9775175, -1.586665, -1.072235, 1, 0.9058824, 0, 1,
-0.9742277, -0.2482132, -0.07424457, 1, 0.9137255, 0, 1,
-0.9735531, 1.438845, 0.09162921, 1, 0.9176471, 0, 1,
-0.9724805, -1.287983, -0.3110151, 1, 0.9254902, 0, 1,
-0.9724369, 0.5019565, -1.989835, 1, 0.9294118, 0, 1,
-0.9685081, 0.65587, -1.26622, 1, 0.9372549, 0, 1,
-0.966517, 0.598797, -0.764128, 1, 0.9411765, 0, 1,
-0.9646096, -1.37, -3.1369, 1, 0.9490196, 0, 1,
-0.9564483, 1.455253, -0.4551325, 1, 0.9529412, 0, 1,
-0.9495975, 0.9750805, -0.6828899, 1, 0.9607843, 0, 1,
-0.9493887, 0.4726535, 0.09907579, 1, 0.9647059, 0, 1,
-0.9430341, 3.256047, -1.204231, 1, 0.972549, 0, 1,
-0.9203375, -1.110913, -0.8771799, 1, 0.9764706, 0, 1,
-0.9200261, 1.292727, -2.157495, 1, 0.9843137, 0, 1,
-0.9148161, 0.5995173, -2.629549, 1, 0.9882353, 0, 1,
-0.9145926, 1.1701, -1.405328, 1, 0.9960784, 0, 1,
-0.9139243, 1.141954, -0.8456043, 0.9960784, 1, 0, 1,
-0.9136292, 0.2198053, -1.302398, 0.9921569, 1, 0, 1,
-0.9109377, -0.8654799, -2.422166, 0.9843137, 1, 0, 1,
-0.9022204, -1.204227, -2.278998, 0.9803922, 1, 0, 1,
-0.8978617, -1.508776, -3.085573, 0.972549, 1, 0, 1,
-0.8971137, 0.7149048, 0.2129158, 0.9686275, 1, 0, 1,
-0.8926689, -0.3989299, -2.181246, 0.9607843, 1, 0, 1,
-0.8890979, 0.5527267, -1.511885, 0.9568627, 1, 0, 1,
-0.8809113, 0.3411893, -1.419282, 0.9490196, 1, 0, 1,
-0.8767152, 0.2693318, 0.4728204, 0.945098, 1, 0, 1,
-0.8763356, -0.1964771, -1.893089, 0.9372549, 1, 0, 1,
-0.87462, 0.0273788, -1.592882, 0.9333333, 1, 0, 1,
-0.8701087, 0.5198774, -1.036109, 0.9254902, 1, 0, 1,
-0.8681393, -1.00807, -2.245883, 0.9215686, 1, 0, 1,
-0.8628371, -1.91636, -4.300332, 0.9137255, 1, 0, 1,
-0.8621358, -0.9622034, -2.878986, 0.9098039, 1, 0, 1,
-0.8567004, -1.492478, -1.066977, 0.9019608, 1, 0, 1,
-0.8562045, -0.6249287, -2.676619, 0.8941177, 1, 0, 1,
-0.8537506, 0.05684953, -1.065895, 0.8901961, 1, 0, 1,
-0.8474775, -0.6701521, -0.2693097, 0.8823529, 1, 0, 1,
-0.8429378, -0.03055659, -1.789167, 0.8784314, 1, 0, 1,
-0.8379249, 1.820516, -0.4179373, 0.8705882, 1, 0, 1,
-0.8363556, -1.142344, -3.252375, 0.8666667, 1, 0, 1,
-0.8359355, -0.7899234, -2.889085, 0.8588235, 1, 0, 1,
-0.8344739, 1.595873, -0.03744228, 0.854902, 1, 0, 1,
-0.8341653, 1.999622, 0.4107131, 0.8470588, 1, 0, 1,
-0.8272524, 1.28382, -1.800001, 0.8431373, 1, 0, 1,
-0.8185194, -1.377134, -4.424948, 0.8352941, 1, 0, 1,
-0.809995, -0.0463445, -2.149239, 0.8313726, 1, 0, 1,
-0.8049442, 0.5055708, 0.618462, 0.8235294, 1, 0, 1,
-0.8029796, 0.7328551, -1.826474, 0.8196079, 1, 0, 1,
-0.8010955, 0.3347539, -2.156998, 0.8117647, 1, 0, 1,
-0.7939135, -1.071052, -2.499078, 0.8078431, 1, 0, 1,
-0.791721, 1.012478, -2.161964, 0.8, 1, 0, 1,
-0.7843635, 0.2838652, 0.2087583, 0.7921569, 1, 0, 1,
-0.7736762, -0.9840553, -2.839249, 0.7882353, 1, 0, 1,
-0.7732736, -0.7084684, -2.617769, 0.7803922, 1, 0, 1,
-0.7723819, -1.060293, -1.961154, 0.7764706, 1, 0, 1,
-0.7680961, 2.006259, -0.9285996, 0.7686275, 1, 0, 1,
-0.7644197, -0.6773622, -2.50945, 0.7647059, 1, 0, 1,
-0.7602887, -0.305227, -2.303236, 0.7568628, 1, 0, 1,
-0.7574332, 1.770256, 0.6079495, 0.7529412, 1, 0, 1,
-0.7565439, -1.133876, -1.624385, 0.7450981, 1, 0, 1,
-0.7555935, 2.356873, -0.6648158, 0.7411765, 1, 0, 1,
-0.7531426, -1.040311, -2.900835, 0.7333333, 1, 0, 1,
-0.7506487, 0.7294292, -1.316709, 0.7294118, 1, 0, 1,
-0.7502764, 0.3833287, -2.227342, 0.7215686, 1, 0, 1,
-0.745546, -1.256234, -2.079177, 0.7176471, 1, 0, 1,
-0.7436863, 0.9857138, -1.393252, 0.7098039, 1, 0, 1,
-0.7423978, 0.7269793, -1.119754, 0.7058824, 1, 0, 1,
-0.7272483, -0.06130918, -0.4426008, 0.6980392, 1, 0, 1,
-0.7254897, -1.212094, -1.831611, 0.6901961, 1, 0, 1,
-0.7236385, -1.248082, -3.844356, 0.6862745, 1, 0, 1,
-0.7232131, -0.986964, -2.612221, 0.6784314, 1, 0, 1,
-0.7213364, 0.5501048, -2.396279, 0.6745098, 1, 0, 1,
-0.716395, -0.3915251, -3.201117, 0.6666667, 1, 0, 1,
-0.711488, -1.003443, -1.40048, 0.6627451, 1, 0, 1,
-0.7105235, -0.5397563, -2.465396, 0.654902, 1, 0, 1,
-0.7100459, -0.296131, -2.711984, 0.6509804, 1, 0, 1,
-0.7084473, 0.04678303, -2.434005, 0.6431373, 1, 0, 1,
-0.7060364, -0.6086367, -1.332168, 0.6392157, 1, 0, 1,
-0.7010593, 1.078724, -0.2164591, 0.6313726, 1, 0, 1,
-0.6961229, 1.347717, 0.7138833, 0.627451, 1, 0, 1,
-0.6958449, 1.525415, -1.588784, 0.6196079, 1, 0, 1,
-0.6853085, -1.275693, -3.466197, 0.6156863, 1, 0, 1,
-0.6717305, 0.5519285, -0.4173049, 0.6078432, 1, 0, 1,
-0.6715508, 2.130091, -0.1900847, 0.6039216, 1, 0, 1,
-0.6698411, -0.6945615, -1.217353, 0.5960785, 1, 0, 1,
-0.6656603, 0.5614076, -0.9309113, 0.5882353, 1, 0, 1,
-0.6620449, -0.4814246, -2.574398, 0.5843138, 1, 0, 1,
-0.6604648, -0.02596255, -1.340009, 0.5764706, 1, 0, 1,
-0.6438318, 1.451892, -0.4736573, 0.572549, 1, 0, 1,
-0.6423679, -0.2738165, -1.532069, 0.5647059, 1, 0, 1,
-0.6350018, -1.054507, -4.264649, 0.5607843, 1, 0, 1,
-0.6346074, -0.6362014, -1.611469, 0.5529412, 1, 0, 1,
-0.6328282, 0.3135551, -1.575495, 0.5490196, 1, 0, 1,
-0.6316503, 1.093058, -0.5502569, 0.5411765, 1, 0, 1,
-0.6312484, 0.02685753, -1.670514, 0.5372549, 1, 0, 1,
-0.6287044, 1.290557, -1.456692, 0.5294118, 1, 0, 1,
-0.619834, -0.4996424, -3.401231, 0.5254902, 1, 0, 1,
-0.6165492, 1.358364, -1.160182, 0.5176471, 1, 0, 1,
-0.6135648, 0.03353995, -1.24921, 0.5137255, 1, 0, 1,
-0.6122617, 1.636187, -1.596531, 0.5058824, 1, 0, 1,
-0.5893624, -0.7947577, -3.348983, 0.5019608, 1, 0, 1,
-0.5867763, -0.3348658, -2.008842, 0.4941176, 1, 0, 1,
-0.5825884, -0.09925877, -1.072889, 0.4862745, 1, 0, 1,
-0.5790066, -1.298496, -3.411129, 0.4823529, 1, 0, 1,
-0.5788299, 0.03356207, -3.146995, 0.4745098, 1, 0, 1,
-0.5767556, 0.5482549, 0.2360893, 0.4705882, 1, 0, 1,
-0.5728858, -0.3131227, -1.311979, 0.4627451, 1, 0, 1,
-0.5711868, 0.5088356, -3.153866, 0.4588235, 1, 0, 1,
-0.5628664, 1.580424, -1.69977, 0.4509804, 1, 0, 1,
-0.5619535, 1.558391, -0.007137983, 0.4470588, 1, 0, 1,
-0.5617082, -0.6127009, -1.137551, 0.4392157, 1, 0, 1,
-0.5588616, 2.27624, 0.8371238, 0.4352941, 1, 0, 1,
-0.5573481, 1.030857, -2.0339, 0.427451, 1, 0, 1,
-0.5562921, 0.5890869, -1.533507, 0.4235294, 1, 0, 1,
-0.5521854, 1.819564, 0.9960884, 0.4156863, 1, 0, 1,
-0.5482459, 1.035551, -0.5412751, 0.4117647, 1, 0, 1,
-0.5445589, -0.5070294, -3.017907, 0.4039216, 1, 0, 1,
-0.5431717, -0.9395403, -1.942649, 0.3960784, 1, 0, 1,
-0.5421607, 1.532711, -1.652323, 0.3921569, 1, 0, 1,
-0.5374404, 0.5635909, 0.3396482, 0.3843137, 1, 0, 1,
-0.5370403, 0.3999283, -0.4328194, 0.3803922, 1, 0, 1,
-0.5284182, 1.559418, -1.029274, 0.372549, 1, 0, 1,
-0.5267642, -0.7774789, -1.603577, 0.3686275, 1, 0, 1,
-0.5265693, 0.7504994, -2.436774, 0.3607843, 1, 0, 1,
-0.5257982, 1.696085, -2.176048, 0.3568628, 1, 0, 1,
-0.5254503, -0.8479928, -1.833949, 0.3490196, 1, 0, 1,
-0.5241424, 1.813975, -1.040604, 0.345098, 1, 0, 1,
-0.5225592, 0.0824239, -3.064086, 0.3372549, 1, 0, 1,
-0.5210063, 0.912083, -0.9490826, 0.3333333, 1, 0, 1,
-0.5199171, -0.9223166, -0.8740436, 0.3254902, 1, 0, 1,
-0.5193603, -0.4790215, -1.21228, 0.3215686, 1, 0, 1,
-0.5193128, 0.1413144, 0.1823566, 0.3137255, 1, 0, 1,
-0.518759, 0.2508259, -1.989644, 0.3098039, 1, 0, 1,
-0.5181601, -2.025757, -1.61702, 0.3019608, 1, 0, 1,
-0.5088863, 2.277273, -0.8845378, 0.2941177, 1, 0, 1,
-0.5079111, 0.3797508, 0.1818311, 0.2901961, 1, 0, 1,
-0.5073767, -0.09582996, -1.609526, 0.282353, 1, 0, 1,
-0.5038273, 0.05718948, -1.63225, 0.2784314, 1, 0, 1,
-0.5019805, 0.209876, -2.08258, 0.2705882, 1, 0, 1,
-0.5005756, -0.9149764, -2.591152, 0.2666667, 1, 0, 1,
-0.4981369, 1.422753, -0.8807766, 0.2588235, 1, 0, 1,
-0.496298, 0.8456331, -0.9013664, 0.254902, 1, 0, 1,
-0.496011, -0.4534858, -1.274903, 0.2470588, 1, 0, 1,
-0.4933771, -0.8771559, -1.493707, 0.2431373, 1, 0, 1,
-0.4930362, -0.8539086, -1.670614, 0.2352941, 1, 0, 1,
-0.4908453, 0.7158371, 0.1767644, 0.2313726, 1, 0, 1,
-0.4904239, 0.0545391, -0.4021573, 0.2235294, 1, 0, 1,
-0.4870044, -0.2075994, -2.661368, 0.2196078, 1, 0, 1,
-0.4856261, -0.04850359, -1.922089, 0.2117647, 1, 0, 1,
-0.4742559, -0.9558709, -2.634617, 0.2078431, 1, 0, 1,
-0.4716382, -1.097201, -1.84738, 0.2, 1, 0, 1,
-0.4707539, -1.034425, -3.404751, 0.1921569, 1, 0, 1,
-0.469892, 0.4907821, 0.2266694, 0.1882353, 1, 0, 1,
-0.4689501, -0.5697234, -2.457247, 0.1803922, 1, 0, 1,
-0.4667889, 0.57528, -0.8276437, 0.1764706, 1, 0, 1,
-0.4667285, 1.41555, 0.9536047, 0.1686275, 1, 0, 1,
-0.4634694, 0.9210947, -0.2017791, 0.1647059, 1, 0, 1,
-0.4614768, 0.7630169, 0.06345955, 0.1568628, 1, 0, 1,
-0.4609778, 0.2189458, -1.063313, 0.1529412, 1, 0, 1,
-0.4605676, -2.295868, -1.987324, 0.145098, 1, 0, 1,
-0.4597735, -0.8317286, -3.335107, 0.1411765, 1, 0, 1,
-0.4587527, 1.694997, 1.282923, 0.1333333, 1, 0, 1,
-0.4581768, -0.9064464, -4.215343, 0.1294118, 1, 0, 1,
-0.4555832, 2.864716, 2.404649, 0.1215686, 1, 0, 1,
-0.4528751, 1.117942, -2.146097, 0.1176471, 1, 0, 1,
-0.4457958, 0.02861236, -2.441834, 0.1098039, 1, 0, 1,
-0.4454396, -0.2050984, -1.691301, 0.1058824, 1, 0, 1,
-0.4440006, 2.020189, 0.5277456, 0.09803922, 1, 0, 1,
-0.4388692, -1.776911, -3.582366, 0.09019608, 1, 0, 1,
-0.4368417, 1.155784, -0.6391544, 0.08627451, 1, 0, 1,
-0.4355677, 0.336708, -2.833668, 0.07843138, 1, 0, 1,
-0.4325112, -0.109228, -2.333525, 0.07450981, 1, 0, 1,
-0.431025, -1.425194, -3.56205, 0.06666667, 1, 0, 1,
-0.4289193, -1.485719, -1.347355, 0.0627451, 1, 0, 1,
-0.4270943, 0.5212738, -1.55673, 0.05490196, 1, 0, 1,
-0.4261166, -0.2060255, -1.429075, 0.05098039, 1, 0, 1,
-0.4208348, 1.771476, -0.06122619, 0.04313726, 1, 0, 1,
-0.4165982, 0.7419228, 0.1806294, 0.03921569, 1, 0, 1,
-0.4097087, -0.03667175, -2.726853, 0.03137255, 1, 0, 1,
-0.4058129, -1.751447, -4.233693, 0.02745098, 1, 0, 1,
-0.4057051, -0.2864774, -2.979656, 0.01960784, 1, 0, 1,
-0.4033778, -1.520591, -3.56481, 0.01568628, 1, 0, 1,
-0.4003984, -0.7518306, -1.306593, 0.007843138, 1, 0, 1,
-0.4000211, -0.4405837, -4.136062, 0.003921569, 1, 0, 1,
-0.3958696, -0.6710546, -1.7981, 0, 1, 0.003921569, 1,
-0.3955292, -0.2426425, -0.9431732, 0, 1, 0.01176471, 1,
-0.3944921, 0.3815366, -1.26541, 0, 1, 0.01568628, 1,
-0.3930776, -2.072437, -3.280003, 0, 1, 0.02352941, 1,
-0.3905717, 0.951991, 0.1144156, 0, 1, 0.02745098, 1,
-0.3900237, 0.05813644, -2.783348, 0, 1, 0.03529412, 1,
-0.3867691, -1.023157, -2.53318, 0, 1, 0.03921569, 1,
-0.3867336, 0.7721984, 0.04823536, 0, 1, 0.04705882, 1,
-0.3853418, -0.5605583, -2.016872, 0, 1, 0.05098039, 1,
-0.3710598, 0.4530604, -1.074399, 0, 1, 0.05882353, 1,
-0.3686683, -0.2614763, -1.123611, 0, 1, 0.0627451, 1,
-0.3658997, -1.87702, -3.259696, 0, 1, 0.07058824, 1,
-0.3624807, 1.241081, -1.836238, 0, 1, 0.07450981, 1,
-0.3611625, 0.6834531, 0.8946331, 0, 1, 0.08235294, 1,
-0.358615, -0.5551521, -3.39162, 0, 1, 0.08627451, 1,
-0.3568507, 0.8733235, 0.1240459, 0, 1, 0.09411765, 1,
-0.353791, -0.04243451, -1.24317, 0, 1, 0.1019608, 1,
-0.3484501, 1.682714, 0.2557746, 0, 1, 0.1058824, 1,
-0.3464967, 0.3929541, -0.4614064, 0, 1, 0.1137255, 1,
-0.3460726, 1.278035, 0.4597957, 0, 1, 0.1176471, 1,
-0.3452759, 1.246196, 0.4072534, 0, 1, 0.1254902, 1,
-0.3444853, -0.06546517, -2.166144, 0, 1, 0.1294118, 1,
-0.3411784, -0.05951199, -1.025851, 0, 1, 0.1372549, 1,
-0.3406222, -0.5643041, -3.155834, 0, 1, 0.1411765, 1,
-0.3381452, -1.06026, -2.274969, 0, 1, 0.1490196, 1,
-0.3313163, -0.0227064, -3.193788, 0, 1, 0.1529412, 1,
-0.3244059, 0.3984053, -0.03700429, 0, 1, 0.1607843, 1,
-0.3227122, -1.122744, -2.243598, 0, 1, 0.1647059, 1,
-0.3205768, 0.04253015, -1.331496, 0, 1, 0.172549, 1,
-0.3189165, 0.3916195, -1.459891, 0, 1, 0.1764706, 1,
-0.3158951, 0.4412829, -1.663066, 0, 1, 0.1843137, 1,
-0.3158947, -0.8022838, -1.171687, 0, 1, 0.1882353, 1,
-0.3117248, 1.457796, 0.508103, 0, 1, 0.1960784, 1,
-0.3108455, -1.517598, -3.672575, 0, 1, 0.2039216, 1,
-0.3085457, -0.7633972, -1.082285, 0, 1, 0.2078431, 1,
-0.3055624, -0.004072457, -0.8886431, 0, 1, 0.2156863, 1,
-0.303287, 0.2433043, -0.9792733, 0, 1, 0.2196078, 1,
-0.2980689, -0.782005, -3.480477, 0, 1, 0.227451, 1,
-0.2945272, 0.6761653, -1.011152, 0, 1, 0.2313726, 1,
-0.2942376, -0.1446233, -1.452491, 0, 1, 0.2392157, 1,
-0.2935475, -0.5231705, -1.544704, 0, 1, 0.2431373, 1,
-0.2900839, 1.105892, -0.1531785, 0, 1, 0.2509804, 1,
-0.2884092, -0.0633813, -1.740258, 0, 1, 0.254902, 1,
-0.2831787, 2.092827, 0.2150473, 0, 1, 0.2627451, 1,
-0.2775216, -0.8838945, -3.869918, 0, 1, 0.2666667, 1,
-0.2725386, -1.126059, -1.792634, 0, 1, 0.2745098, 1,
-0.271208, -1.611368, -2.050092, 0, 1, 0.2784314, 1,
-0.2695715, 0.1213721, -0.6375624, 0, 1, 0.2862745, 1,
-0.2653948, 0.8818278, -0.9816881, 0, 1, 0.2901961, 1,
-0.2631404, 0.9905859, -0.01837319, 0, 1, 0.2980392, 1,
-0.2590357, 1.068961, 0.8426344, 0, 1, 0.3058824, 1,
-0.2578811, 1.960274, 0.1642291, 0, 1, 0.3098039, 1,
-0.2534827, 0.7537286, -1.694321, 0, 1, 0.3176471, 1,
-0.2518999, 0.5696422, -3.115616, 0, 1, 0.3215686, 1,
-0.251078, 0.7456053, 0.05285909, 0, 1, 0.3294118, 1,
-0.2482538, 1.737272, 0.973636, 0, 1, 0.3333333, 1,
-0.2461266, 1.196834, -0.610523, 0, 1, 0.3411765, 1,
-0.2450207, -0.6561239, -1.650949, 0, 1, 0.345098, 1,
-0.2449031, 0.1344718, -0.4775952, 0, 1, 0.3529412, 1,
-0.2439314, 0.009827958, -0.6491613, 0, 1, 0.3568628, 1,
-0.2395136, 0.5982814, -0.7298301, 0, 1, 0.3647059, 1,
-0.2359461, 1.639809, -1.455055, 0, 1, 0.3686275, 1,
-0.2357224, -0.7091618, -2.0441, 0, 1, 0.3764706, 1,
-0.2288093, -0.2960426, -2.514616, 0, 1, 0.3803922, 1,
-0.2244209, 0.4390596, -1.201919, 0, 1, 0.3882353, 1,
-0.2235669, 1.598529, -2.148076, 0, 1, 0.3921569, 1,
-0.2232442, 0.4524235, -1.173186, 0, 1, 0.4, 1,
-0.2210793, -0.4572028, -2.59882, 0, 1, 0.4078431, 1,
-0.2155226, 0.7105436, -0.2603797, 0, 1, 0.4117647, 1,
-0.2124837, 0.2580644, -1.257872, 0, 1, 0.4196078, 1,
-0.2122732, 0.7216475, 0.5965617, 0, 1, 0.4235294, 1,
-0.2067967, 0.2409992, -2.126951, 0, 1, 0.4313726, 1,
-0.205548, 0.1043623, -2.536756, 0, 1, 0.4352941, 1,
-0.2035229, -1.35552, -2.100845, 0, 1, 0.4431373, 1,
-0.2025431, -1.107956, -2.902339, 0, 1, 0.4470588, 1,
-0.1872188, -1.313058, -4.029744, 0, 1, 0.454902, 1,
-0.1847232, -0.494338, -3.125517, 0, 1, 0.4588235, 1,
-0.1837218, 1.201852, 0.7085491, 0, 1, 0.4666667, 1,
-0.1832319, 0.02563348, -1.579152, 0, 1, 0.4705882, 1,
-0.1813205, -0.2065462, -3.15104, 0, 1, 0.4784314, 1,
-0.1786696, -0.4550781, -5.065522, 0, 1, 0.4823529, 1,
-0.1777528, -1.136321, -3.518364, 0, 1, 0.4901961, 1,
-0.1766011, 3.127783, 0.5486544, 0, 1, 0.4941176, 1,
-0.1763311, 2.141704, -0.5008122, 0, 1, 0.5019608, 1,
-0.1757362, 0.1511426, 0.2191417, 0, 1, 0.509804, 1,
-0.1701773, 1.788844, -0.7843644, 0, 1, 0.5137255, 1,
-0.1676695, 0.3947434, 0.1651827, 0, 1, 0.5215687, 1,
-0.167007, 1.71988, 0.2437507, 0, 1, 0.5254902, 1,
-0.1655755, -0.7387103, -3.42926, 0, 1, 0.5333334, 1,
-0.164387, 0.4933592, -0.5718175, 0, 1, 0.5372549, 1,
-0.1640839, -0.2919589, -2.321693, 0, 1, 0.5450981, 1,
-0.1596759, 0.517294, -0.6104778, 0, 1, 0.5490196, 1,
-0.1562955, -2.576944, -3.424662, 0, 1, 0.5568628, 1,
-0.1530583, 0.7561142, 0.2569705, 0, 1, 0.5607843, 1,
-0.149965, -1.105035, -3.809266, 0, 1, 0.5686275, 1,
-0.1494995, 0.4198181, -0.7809997, 0, 1, 0.572549, 1,
-0.1484169, -1.323516, -2.344047, 0, 1, 0.5803922, 1,
-0.14678, -1.736806, -2.063426, 0, 1, 0.5843138, 1,
-0.143491, -1.974363, -2.953906, 0, 1, 0.5921569, 1,
-0.1420197, -0.309401, -1.602273, 0, 1, 0.5960785, 1,
-0.1412734, -0.1288572, -2.221506, 0, 1, 0.6039216, 1,
-0.1398267, -0.1477323, -1.886482, 0, 1, 0.6117647, 1,
-0.1302091, -0.02199752, -1.7814, 0, 1, 0.6156863, 1,
-0.1273061, -0.04099444, -3.022422, 0, 1, 0.6235294, 1,
-0.1258256, 0.8321681, -0.7252277, 0, 1, 0.627451, 1,
-0.1242547, -0.6091515, -2.738993, 0, 1, 0.6352941, 1,
-0.1228067, -0.8279064, -2.980113, 0, 1, 0.6392157, 1,
-0.1140759, 0.5916331, 0.8590179, 0, 1, 0.6470588, 1,
-0.1124552, -1.783795, -0.6691785, 0, 1, 0.6509804, 1,
-0.1084774, 1.067923, -1.436967, 0, 1, 0.6588235, 1,
-0.1081128, 0.3822019, -0.1023965, 0, 1, 0.6627451, 1,
-0.1025517, 1.867455, -0.9373314, 0, 1, 0.6705883, 1,
-0.1018613, 0.4460006, -0.2355867, 0, 1, 0.6745098, 1,
-0.1010193, -0.01136691, -2.155999, 0, 1, 0.682353, 1,
-0.09275203, 0.4333631, 0.5771589, 0, 1, 0.6862745, 1,
-0.09249748, -1.219022, -3.334512, 0, 1, 0.6941177, 1,
-0.08840288, 0.6632104, 0.2666693, 0, 1, 0.7019608, 1,
-0.08658931, 0.07570435, 0.3655624, 0, 1, 0.7058824, 1,
-0.07991392, 1.133731, -0.9129167, 0, 1, 0.7137255, 1,
-0.07473601, 0.1693612, 0.2701266, 0, 1, 0.7176471, 1,
-0.07278659, -0.7942241, -2.859497, 0, 1, 0.7254902, 1,
-0.06640706, 1.912079, 0.4078721, 0, 1, 0.7294118, 1,
-0.06296197, -0.7066758, -2.622482, 0, 1, 0.7372549, 1,
-0.06164109, -2.552874, -2.653674, 0, 1, 0.7411765, 1,
-0.06001638, 0.3461787, -0.2733449, 0, 1, 0.7490196, 1,
-0.05960613, 0.5965236, -1.953612, 0, 1, 0.7529412, 1,
-0.05871879, -1.088083, -2.83203, 0, 1, 0.7607843, 1,
-0.05756956, -0.5068288, -2.920652, 0, 1, 0.7647059, 1,
-0.04777987, 2.408872, -0.02139607, 0, 1, 0.772549, 1,
-0.04752435, -1.955633, -2.648369, 0, 1, 0.7764706, 1,
-0.04627456, 0.5343197, -0.5190421, 0, 1, 0.7843137, 1,
-0.04343197, 1.099654, 0.8946683, 0, 1, 0.7882353, 1,
-0.03928911, 0.2394042, -0.04531451, 0, 1, 0.7960784, 1,
-0.03838472, 0.2503956, -0.8394807, 0, 1, 0.8039216, 1,
-0.03609948, -1.549864, -4.939964, 0, 1, 0.8078431, 1,
-0.03436685, -0.5798042, -2.371687, 0, 1, 0.8156863, 1,
-0.02812178, -1.701278, -4.966674, 0, 1, 0.8196079, 1,
-0.02658653, 0.05838397, 0.9515001, 0, 1, 0.827451, 1,
-0.02509094, 0.2629076, -0.3374609, 0, 1, 0.8313726, 1,
-0.02456681, 0.5378684, -0.6589192, 0, 1, 0.8392157, 1,
-0.02229732, -0.4109311, -4.513914, 0, 1, 0.8431373, 1,
-0.02158701, -0.3648495, -3.688744, 0, 1, 0.8509804, 1,
-0.02066441, 0.5165608, 0.4074256, 0, 1, 0.854902, 1,
-0.007590623, -0.9798819, -2.44518, 0, 1, 0.8627451, 1,
-0.007188524, -0.5929495, -2.014142, 0, 1, 0.8666667, 1,
-0.003084273, -2.382476, -3.734226, 0, 1, 0.8745098, 1,
-0.002405691, 1.93968, 1.239087, 0, 1, 0.8784314, 1,
-0.0006800226, 0.1208445, 0.4411386, 0, 1, 0.8862745, 1,
0.0005796045, -0.3360669, 4.384604, 0, 1, 0.8901961, 1,
0.0009215458, -0.564824, 2.957409, 0, 1, 0.8980392, 1,
0.003461583, -0.2613848, 4.051229, 0, 1, 0.9058824, 1,
0.004025554, 1.794639, 0.4480423, 0, 1, 0.9098039, 1,
0.005870994, 1.325551, -1.028534, 0, 1, 0.9176471, 1,
0.01111683, 0.90847, -0.6267804, 0, 1, 0.9215686, 1,
0.01464231, 0.451655, -0.1184296, 0, 1, 0.9294118, 1,
0.01613511, 0.6059413, 0.2328378, 0, 1, 0.9333333, 1,
0.0204838, -1.44813, 3.750907, 0, 1, 0.9411765, 1,
0.0219386, -1.635135, 2.293669, 0, 1, 0.945098, 1,
0.02378735, 0.378702, -0.1127359, 0, 1, 0.9529412, 1,
0.02414835, 0.230051, -0.2917392, 0, 1, 0.9568627, 1,
0.03101556, -0.6212837, 3.987426, 0, 1, 0.9647059, 1,
0.03153479, 1.828489, 0.3178232, 0, 1, 0.9686275, 1,
0.03218279, -0.2649862, 3.328018, 0, 1, 0.9764706, 1,
0.03313052, 0.5650322, -0.8969636, 0, 1, 0.9803922, 1,
0.03346531, -0.2660481, 4.496761, 0, 1, 0.9882353, 1,
0.03735514, 0.7155887, 0.5714534, 0, 1, 0.9921569, 1,
0.0412565, -0.6651747, 2.141069, 0, 1, 1, 1,
0.04269889, -0.4938209, 4.280347, 0, 0.9921569, 1, 1,
0.0434635, -0.04330361, 0.4143189, 0, 0.9882353, 1, 1,
0.04551176, -0.298959, 1.588406, 0, 0.9803922, 1, 1,
0.04932464, -0.08810238, 3.493939, 0, 0.9764706, 1, 1,
0.04962836, 1.273652, -2.176244, 0, 0.9686275, 1, 1,
0.05175193, -0.2061183, 2.865814, 0, 0.9647059, 1, 1,
0.05185514, -3.088054, 2.133321, 0, 0.9568627, 1, 1,
0.05743822, -1.574177, 3.252492, 0, 0.9529412, 1, 1,
0.05793571, -0.3295313, 2.823071, 0, 0.945098, 1, 1,
0.05980349, -0.4236842, 2.28579, 0, 0.9411765, 1, 1,
0.06518111, 1.268856, 1.024063, 0, 0.9333333, 1, 1,
0.06624029, 0.8392127, -0.761524, 0, 0.9294118, 1, 1,
0.06732839, 0.1621361, 0.5580389, 0, 0.9215686, 1, 1,
0.06776822, 0.6451101, -0.262199, 0, 0.9176471, 1, 1,
0.06936159, 0.6624821, -0.09101775, 0, 0.9098039, 1, 1,
0.07721887, -0.9772948, 2.688801, 0, 0.9058824, 1, 1,
0.07779808, 0.469265, -0.1551004, 0, 0.8980392, 1, 1,
0.07906266, 0.6294355, 0.1171608, 0, 0.8901961, 1, 1,
0.07983115, 0.4722089, 0.9128378, 0, 0.8862745, 1, 1,
0.08308282, -1.220984, 4.763533, 0, 0.8784314, 1, 1,
0.08343042, 0.6487859, -0.2953766, 0, 0.8745098, 1, 1,
0.08388405, -0.2027682, 3.618533, 0, 0.8666667, 1, 1,
0.08719321, -2.236805, 2.912002, 0, 0.8627451, 1, 1,
0.08729541, 0.7018216, 1.587761, 0, 0.854902, 1, 1,
0.09438984, 0.05570285, 0.3278653, 0, 0.8509804, 1, 1,
0.09450602, 0.2220598, 0.9144489, 0, 0.8431373, 1, 1,
0.09499522, 1.341805, 0.8498501, 0, 0.8392157, 1, 1,
0.09657758, -1.357318, 3.619914, 0, 0.8313726, 1, 1,
0.09679087, -0.4718419, 2.413588, 0, 0.827451, 1, 1,
0.09892207, 1.23823, -0.6288881, 0, 0.8196079, 1, 1,
0.09953633, -0.4386943, 4.268676, 0, 0.8156863, 1, 1,
0.1013097, -0.2997769, 4.24765, 0, 0.8078431, 1, 1,
0.1038122, -1.156893, 4.526151, 0, 0.8039216, 1, 1,
0.1041692, 1.605518, -2.028659, 0, 0.7960784, 1, 1,
0.1155943, 0.7107691, -1.120764, 0, 0.7882353, 1, 1,
0.1200707, -1.001118, 2.61617, 0, 0.7843137, 1, 1,
0.1203308, 0.8753234, -0.293782, 0, 0.7764706, 1, 1,
0.1226483, 1.268401, 1.460918, 0, 0.772549, 1, 1,
0.1269057, -1.073021, 2.494095, 0, 0.7647059, 1, 1,
0.1271296, -0.3434333, 4.315468, 0, 0.7607843, 1, 1,
0.1314255, 0.1298723, 0.09227134, 0, 0.7529412, 1, 1,
0.1342363, 0.07929029, 1.747122, 0, 0.7490196, 1, 1,
0.1397219, 0.2542692, -0.2819461, 0, 0.7411765, 1, 1,
0.1417063, -0.07076821, 1.096291, 0, 0.7372549, 1, 1,
0.151631, 1.173816, 0.3747985, 0, 0.7294118, 1, 1,
0.1538339, 0.667734, -0.8571979, 0, 0.7254902, 1, 1,
0.1551642, 3.252124, 0.5945135, 0, 0.7176471, 1, 1,
0.1583144, 2.148482, 0.04270187, 0, 0.7137255, 1, 1,
0.1626365, -0.06859303, 0.5178416, 0, 0.7058824, 1, 1,
0.1642885, -0.2330875, 3.273146, 0, 0.6980392, 1, 1,
0.1731603, -2.652261, 2.976924, 0, 0.6941177, 1, 1,
0.188563, 0.290083, 0.8158322, 0, 0.6862745, 1, 1,
0.1912194, 0.09344726, 2.362906, 0, 0.682353, 1, 1,
0.1949009, -0.7385444, 2.743676, 0, 0.6745098, 1, 1,
0.1963442, 0.4004081, 0.3213833, 0, 0.6705883, 1, 1,
0.1963725, -0.9538345, 4.863199, 0, 0.6627451, 1, 1,
0.1996603, 1.336707, 0.002662122, 0, 0.6588235, 1, 1,
0.2004714, 1.231386, -0.1527571, 0, 0.6509804, 1, 1,
0.2051272, 0.7325951, -0.3219419, 0, 0.6470588, 1, 1,
0.2074614, -0.4021726, 1.766116, 0, 0.6392157, 1, 1,
0.2084799, 0.5458193, 0.1933689, 0, 0.6352941, 1, 1,
0.2088932, 1.493136, 0.4458748, 0, 0.627451, 1, 1,
0.2120726, 0.1032786, 2.363667, 0, 0.6235294, 1, 1,
0.2126697, -1.656814, 3.967661, 0, 0.6156863, 1, 1,
0.2129062, 0.9301214, -0.8710196, 0, 0.6117647, 1, 1,
0.2156517, 1.951946, 1.411431, 0, 0.6039216, 1, 1,
0.2261642, 1.563109, -1.085381, 0, 0.5960785, 1, 1,
0.2289386, 1.677158, 0.338824, 0, 0.5921569, 1, 1,
0.2305285, 0.2312671, 2.186909, 0, 0.5843138, 1, 1,
0.2309379, -0.07112757, 1.261229, 0, 0.5803922, 1, 1,
0.232287, 0.5956675, 0.02910333, 0, 0.572549, 1, 1,
0.2346475, 1.218223, 0.8216563, 0, 0.5686275, 1, 1,
0.2357054, 0.7754433, -1.047487, 0, 0.5607843, 1, 1,
0.2361508, -1.211621, 1.604486, 0, 0.5568628, 1, 1,
0.2416601, 0.09547149, 1.686226, 0, 0.5490196, 1, 1,
0.2425608, 0.248026, 0.5676019, 0, 0.5450981, 1, 1,
0.2460588, 1.961645, 1.026507, 0, 0.5372549, 1, 1,
0.2465179, -0.2560655, 2.142092, 0, 0.5333334, 1, 1,
0.2481325, -0.4399683, 4.406465, 0, 0.5254902, 1, 1,
0.2501227, 1.067369, 2.098967, 0, 0.5215687, 1, 1,
0.2562307, 0.3806549, 0.004721156, 0, 0.5137255, 1, 1,
0.2588628, -0.7855348, 2.867075, 0, 0.509804, 1, 1,
0.2635252, -0.8441619, 2.592029, 0, 0.5019608, 1, 1,
0.2638658, 1.286878, 1.490276, 0, 0.4941176, 1, 1,
0.2678612, 0.3322261, 0.6766304, 0, 0.4901961, 1, 1,
0.2682482, -0.1513749, 2.178153, 0, 0.4823529, 1, 1,
0.2701281, 0.05810434, 0.3202401, 0, 0.4784314, 1, 1,
0.2706038, -0.1405626, 1.66071, 0, 0.4705882, 1, 1,
0.2803724, -1.017634, 3.078902, 0, 0.4666667, 1, 1,
0.2818756, -1.136284, 1.086595, 0, 0.4588235, 1, 1,
0.2868636, 0.8297043, 0.4791893, 0, 0.454902, 1, 1,
0.287819, 1.753763, 0.3280834, 0, 0.4470588, 1, 1,
0.2899343, 0.4781179, 0.1989902, 0, 0.4431373, 1, 1,
0.2917286, 0.574044, -0.2364813, 0, 0.4352941, 1, 1,
0.2924803, 0.1530482, 1.468941, 0, 0.4313726, 1, 1,
0.2932332, 0.600631, 1.375082, 0, 0.4235294, 1, 1,
0.2954897, 0.3829186, -1.315794, 0, 0.4196078, 1, 1,
0.2977084, 0.7842239, 0.5774929, 0, 0.4117647, 1, 1,
0.3009186, -0.391468, 2.50418, 0, 0.4078431, 1, 1,
0.3066063, -0.9447407, 2.616111, 0, 0.4, 1, 1,
0.3142556, -0.3407077, 2.070958, 0, 0.3921569, 1, 1,
0.3157015, -0.5453305, 3.248242, 0, 0.3882353, 1, 1,
0.3199135, -0.1437255, 1.770837, 0, 0.3803922, 1, 1,
0.3226371, -1.316132, 3.500084, 0, 0.3764706, 1, 1,
0.3243232, -0.3254358, 2.284054, 0, 0.3686275, 1, 1,
0.3245579, -0.2804234, 4.005436, 0, 0.3647059, 1, 1,
0.3281772, -0.6365179, 2.082195, 0, 0.3568628, 1, 1,
0.328289, 0.910952, 0.1704799, 0, 0.3529412, 1, 1,
0.3284429, 0.1985834, 0.923778, 0, 0.345098, 1, 1,
0.3292148, -0.6535776, 2.724874, 0, 0.3411765, 1, 1,
0.3369788, 1.633212, 0.9427179, 0, 0.3333333, 1, 1,
0.3405075, -0.1436739, 3.10054, 0, 0.3294118, 1, 1,
0.348886, -1.300742, 2.200771, 0, 0.3215686, 1, 1,
0.3512318, -0.8146249, 2.730474, 0, 0.3176471, 1, 1,
0.3515273, 0.5222906, -0.306787, 0, 0.3098039, 1, 1,
0.3537749, -0.448422, 1.260308, 0, 0.3058824, 1, 1,
0.35416, -0.880447, 1.253928, 0, 0.2980392, 1, 1,
0.3580883, 0.2797766, 1.85318, 0, 0.2901961, 1, 1,
0.366053, 0.6638777, 0.6025421, 0, 0.2862745, 1, 1,
0.3671764, 0.946426, -1.583362, 0, 0.2784314, 1, 1,
0.3675155, 0.02364971, 2.056625, 0, 0.2745098, 1, 1,
0.367964, 0.2613116, 1.783835, 0, 0.2666667, 1, 1,
0.373336, -0.2559633, 1.747461, 0, 0.2627451, 1, 1,
0.3760037, 2.078427, 0.8273309, 0, 0.254902, 1, 1,
0.3772783, -0.9699504, 1.383834, 0, 0.2509804, 1, 1,
0.3774436, 2.65949, 0.2318117, 0, 0.2431373, 1, 1,
0.3866092, 1.490149, -1.508478, 0, 0.2392157, 1, 1,
0.3888239, -0.2247872, 3.659534, 0, 0.2313726, 1, 1,
0.3917787, 0.948152, -0.9461452, 0, 0.227451, 1, 1,
0.3921637, -0.1733969, 2.420788, 0, 0.2196078, 1, 1,
0.3927875, 0.5485094, -0.2368022, 0, 0.2156863, 1, 1,
0.3935787, 1.688784, -0.9855772, 0, 0.2078431, 1, 1,
0.3943392, -0.09537748, 1.231601, 0, 0.2039216, 1, 1,
0.3966541, 1.56333, 1.34754, 0, 0.1960784, 1, 1,
0.3969398, 0.3594069, 0.514774, 0, 0.1882353, 1, 1,
0.3978943, -1.459866, 3.66632, 0, 0.1843137, 1, 1,
0.4030726, 1.227967, 0.5044338, 0, 0.1764706, 1, 1,
0.4131479, -0.009955507, 1.348078, 0, 0.172549, 1, 1,
0.4140188, 2.669791, -0.3740249, 0, 0.1647059, 1, 1,
0.4148246, -0.009553012, 3.296917, 0, 0.1607843, 1, 1,
0.4189595, -0.1270945, 2.211166, 0, 0.1529412, 1, 1,
0.4218625, -1.333683, 1.331836, 0, 0.1490196, 1, 1,
0.4310108, -0.6212023, 1.103045, 0, 0.1411765, 1, 1,
0.4345676, -0.2192202, 1.580586, 0, 0.1372549, 1, 1,
0.4346601, 0.5195602, 0.8482124, 0, 0.1294118, 1, 1,
0.44053, -1.093599, 3.47231, 0, 0.1254902, 1, 1,
0.4459584, -1.020565, 1.420609, 0, 0.1176471, 1, 1,
0.4519815, 1.085442, 0.5813707, 0, 0.1137255, 1, 1,
0.4539306, 1.20903, 0.5183581, 0, 0.1058824, 1, 1,
0.454647, 0.3233749, 0.6153005, 0, 0.09803922, 1, 1,
0.454971, 0.6777108, -1.824638, 0, 0.09411765, 1, 1,
0.4553181, -0.03080322, 0.8834275, 0, 0.08627451, 1, 1,
0.4566435, -0.4928851, 2.846961, 0, 0.08235294, 1, 1,
0.456791, 2.57481, -0.232112, 0, 0.07450981, 1, 1,
0.4572234, 1.235465, 0.6991012, 0, 0.07058824, 1, 1,
0.4627064, 1.863997, -1.176069, 0, 0.0627451, 1, 1,
0.4630011, -0.3814955, 2.153212, 0, 0.05882353, 1, 1,
0.4639758, 0.8934154, 1.093493, 0, 0.05098039, 1, 1,
0.464006, -1.26149, 1.52112, 0, 0.04705882, 1, 1,
0.4690096, -0.7538939, 3.649282, 0, 0.03921569, 1, 1,
0.4700201, 0.5170697, 1.209146, 0, 0.03529412, 1, 1,
0.4727878, 0.0003459273, 2.630578, 0, 0.02745098, 1, 1,
0.4749503, 1.81441, -0.4914221, 0, 0.02352941, 1, 1,
0.4786449, -0.671271, 1.453106, 0, 0.01568628, 1, 1,
0.479686, -1.019643, 2.477982, 0, 0.01176471, 1, 1,
0.4803824, 0.7124993, -0.3394135, 0, 0.003921569, 1, 1,
0.4820942, 0.924284, -0.8301436, 0.003921569, 0, 1, 1,
0.4843349, -0.4786608, 1.716014, 0.007843138, 0, 1, 1,
0.4874476, 0.3052447, 1.112505, 0.01568628, 0, 1, 1,
0.4893996, -0.3394543, 0.76109, 0.01960784, 0, 1, 1,
0.4919403, -2.196029, 3.971164, 0.02745098, 0, 1, 1,
0.4958341, -0.7913183, 0.6007538, 0.03137255, 0, 1, 1,
0.500326, 0.6542448, -2.741423, 0.03921569, 0, 1, 1,
0.503111, 0.06385712, 2.481036, 0.04313726, 0, 1, 1,
0.5053506, 1.237144, -0.5370739, 0.05098039, 0, 1, 1,
0.5060674, -0.1852558, 3.877074, 0.05490196, 0, 1, 1,
0.5071717, -0.5076787, 4.36586, 0.0627451, 0, 1, 1,
0.5072287, -0.07785293, 1.409787, 0.06666667, 0, 1, 1,
0.5100306, -0.7453861, 0.7841588, 0.07450981, 0, 1, 1,
0.5102589, -0.4471147, 3.925453, 0.07843138, 0, 1, 1,
0.5148465, 0.5532519, 0.5524097, 0.08627451, 0, 1, 1,
0.5160831, -0.2016784, 2.054371, 0.09019608, 0, 1, 1,
0.5218648, -1.143788, 3.797289, 0.09803922, 0, 1, 1,
0.5220397, 0.1140323, -0.1279373, 0.1058824, 0, 1, 1,
0.5243351, -0.7173184, 4.41301, 0.1098039, 0, 1, 1,
0.5247888, 0.5166665, -0.1835046, 0.1176471, 0, 1, 1,
0.5257417, -0.8273928, 2.467123, 0.1215686, 0, 1, 1,
0.5281286, -2.218303, 3.416751, 0.1294118, 0, 1, 1,
0.5336249, 0.6897002, 1.39723, 0.1333333, 0, 1, 1,
0.5363759, -0.5584128, 1.476643, 0.1411765, 0, 1, 1,
0.5365301, -0.038232, 3.099355, 0.145098, 0, 1, 1,
0.5389966, -0.5427641, 1.651246, 0.1529412, 0, 1, 1,
0.5438341, -1.153294, 2.155325, 0.1568628, 0, 1, 1,
0.5487813, 1.050413, -0.5090861, 0.1647059, 0, 1, 1,
0.5512146, 0.3138475, 1.579252, 0.1686275, 0, 1, 1,
0.5580308, -0.1890899, 1.718852, 0.1764706, 0, 1, 1,
0.5599775, -0.1845741, 3.856407, 0.1803922, 0, 1, 1,
0.5608838, -0.8035702, 3.405017, 0.1882353, 0, 1, 1,
0.5612593, -0.7623727, 3.195366, 0.1921569, 0, 1, 1,
0.5643806, 0.09909295, 1.145794, 0.2, 0, 1, 1,
0.5688655, 2.319683, -2.169054, 0.2078431, 0, 1, 1,
0.5806774, -0.2019763, 1.811476, 0.2117647, 0, 1, 1,
0.5808268, 1.294928, -0.6113297, 0.2196078, 0, 1, 1,
0.5861979, 0.7864915, 2.88297, 0.2235294, 0, 1, 1,
0.5885302, -1.186349, 3.969089, 0.2313726, 0, 1, 1,
0.590857, -0.00553108, 1.020178, 0.2352941, 0, 1, 1,
0.5945411, 0.7282397, 1.629524, 0.2431373, 0, 1, 1,
0.5969482, -0.8455269, 2.093392, 0.2470588, 0, 1, 1,
0.5982143, 0.9601194, 0.3448599, 0.254902, 0, 1, 1,
0.5983809, 0.1283708, 2.595017, 0.2588235, 0, 1, 1,
0.6054889, -1.235734, 2.721469, 0.2666667, 0, 1, 1,
0.6149921, -2.174145, 3.845723, 0.2705882, 0, 1, 1,
0.6209052, -0.04756665, 3.39966, 0.2784314, 0, 1, 1,
0.625212, -0.4400101, 2.718479, 0.282353, 0, 1, 1,
0.6256676, 1.584393, 0.4607099, 0.2901961, 0, 1, 1,
0.6257276, -2.035015, 3.570228, 0.2941177, 0, 1, 1,
0.6278918, -0.3375609, 1.270637, 0.3019608, 0, 1, 1,
0.628885, -0.09982427, 2.907546, 0.3098039, 0, 1, 1,
0.6356523, -0.8734648, 1.699728, 0.3137255, 0, 1, 1,
0.6406356, 0.2082908, 0.7072571, 0.3215686, 0, 1, 1,
0.6406424, -2.022477, 2.594591, 0.3254902, 0, 1, 1,
0.6421604, -0.4809217, 1.526688, 0.3333333, 0, 1, 1,
0.6437432, -0.5080801, 2.541508, 0.3372549, 0, 1, 1,
0.6458517, 0.1440707, 1.511919, 0.345098, 0, 1, 1,
0.6472154, 0.9012142, 1.563887, 0.3490196, 0, 1, 1,
0.64932, -2.508536, 2.089822, 0.3568628, 0, 1, 1,
0.653015, 1.590052, -0.3448896, 0.3607843, 0, 1, 1,
0.659789, -0.9253974, 2.947937, 0.3686275, 0, 1, 1,
0.6628794, -0.576049, 4.357737, 0.372549, 0, 1, 1,
0.6635418, -0.0160149, 2.816461, 0.3803922, 0, 1, 1,
0.6659672, 0.1632698, 0.6766388, 0.3843137, 0, 1, 1,
0.6672269, 2.011877, 0.2313184, 0.3921569, 0, 1, 1,
0.672178, 0.9500374, 0.6999999, 0.3960784, 0, 1, 1,
0.6740103, -0.7165064, 2.913154, 0.4039216, 0, 1, 1,
0.6741196, -1.016925, 0.8420214, 0.4117647, 0, 1, 1,
0.6762033, 0.6028629, 0.1989679, 0.4156863, 0, 1, 1,
0.6837817, -0.4475101, 0.9997995, 0.4235294, 0, 1, 1,
0.6878559, 1.550926, -0.2135091, 0.427451, 0, 1, 1,
0.6894442, -1.329726, 1.649849, 0.4352941, 0, 1, 1,
0.6989501, -0.2389962, 1.071919, 0.4392157, 0, 1, 1,
0.7000191, -0.9634416, 0.03888683, 0.4470588, 0, 1, 1,
0.703472, 0.7071151, 1.568936, 0.4509804, 0, 1, 1,
0.7087315, -0.4768965, 2.160894, 0.4588235, 0, 1, 1,
0.7140486, -0.3591529, 1.41057, 0.4627451, 0, 1, 1,
0.715832, 1.536653, 0.3073672, 0.4705882, 0, 1, 1,
0.717918, -1.528933, 4.103807, 0.4745098, 0, 1, 1,
0.7216337, 1.303298, 1.281355, 0.4823529, 0, 1, 1,
0.7228248, 1.301754, -0.6286283, 0.4862745, 0, 1, 1,
0.7301905, -0.07669153, 1.546627, 0.4941176, 0, 1, 1,
0.7305478, -0.2596481, 0.9524813, 0.5019608, 0, 1, 1,
0.7307183, 0.623694, 0.298141, 0.5058824, 0, 1, 1,
0.7310002, -0.2991648, 2.994007, 0.5137255, 0, 1, 1,
0.7314136, -1.563291, 3.538938, 0.5176471, 0, 1, 1,
0.7323834, -0.4052191, 1.028264, 0.5254902, 0, 1, 1,
0.7333428, -1.269354, 4.461943, 0.5294118, 0, 1, 1,
0.7336617, 0.5448787, 0.09739657, 0.5372549, 0, 1, 1,
0.7355035, 2.557966, -0.7022022, 0.5411765, 0, 1, 1,
0.7443271, -0.2828355, 0.8808107, 0.5490196, 0, 1, 1,
0.7475274, -0.5068719, 1.520694, 0.5529412, 0, 1, 1,
0.7480263, -1.216588, 1.71762, 0.5607843, 0, 1, 1,
0.7549863, 2.04436, 1.81953, 0.5647059, 0, 1, 1,
0.7588362, -0.1041323, -0.06826939, 0.572549, 0, 1, 1,
0.7617983, 1.556599, -1.033396, 0.5764706, 0, 1, 1,
0.7638669, -1.176307, 2.578301, 0.5843138, 0, 1, 1,
0.7649108, -0.493457, 2.267348, 0.5882353, 0, 1, 1,
0.765115, -0.2620905, 2.485704, 0.5960785, 0, 1, 1,
0.7726375, 0.5972961, 0.8277723, 0.6039216, 0, 1, 1,
0.772821, -0.5879654, 2.263354, 0.6078432, 0, 1, 1,
0.7816105, -0.9628897, 4.109982, 0.6156863, 0, 1, 1,
0.7944981, -0.1670973, 0.9482033, 0.6196079, 0, 1, 1,
0.7964616, -0.04052163, 2.068611, 0.627451, 0, 1, 1,
0.7971621, 0.6385701, 0.845214, 0.6313726, 0, 1, 1,
0.7985772, 0.3839458, 2.432263, 0.6392157, 0, 1, 1,
0.8037012, 0.5045027, 1.699718, 0.6431373, 0, 1, 1,
0.8066979, -0.2960661, 0.3701479, 0.6509804, 0, 1, 1,
0.8087118, 1.33562, 0.4568315, 0.654902, 0, 1, 1,
0.8175088, 0.6176717, 1.274593, 0.6627451, 0, 1, 1,
0.8198248, 0.3989421, 2.346159, 0.6666667, 0, 1, 1,
0.8230103, -0.5542215, 1.22073, 0.6745098, 0, 1, 1,
0.8247084, -0.5778078, 0.05489173, 0.6784314, 0, 1, 1,
0.8253289, 0.9693521, 0.3592434, 0.6862745, 0, 1, 1,
0.8276014, -0.8889906, 1.585835, 0.6901961, 0, 1, 1,
0.8278153, -1.122803, 3.170197, 0.6980392, 0, 1, 1,
0.8465564, 2.104278, 0.4432957, 0.7058824, 0, 1, 1,
0.8493885, -1.24833, 3.071496, 0.7098039, 0, 1, 1,
0.8496648, 0.7432298, 0.3383698, 0.7176471, 0, 1, 1,
0.8514948, 0.9359784, 2.114007, 0.7215686, 0, 1, 1,
0.851642, 0.5126957, 1.521956, 0.7294118, 0, 1, 1,
0.8528944, -0.2149982, 1.384336, 0.7333333, 0, 1, 1,
0.8552914, -0.1376956, 2.73803, 0.7411765, 0, 1, 1,
0.8567401, 1.153771, 0.8799519, 0.7450981, 0, 1, 1,
0.8570224, -1.553766, 4.114332, 0.7529412, 0, 1, 1,
0.8598845, 0.893403, 0.7086061, 0.7568628, 0, 1, 1,
0.8630661, -1.276597, 1.945968, 0.7647059, 0, 1, 1,
0.8634045, -0.009055533, 1.180884, 0.7686275, 0, 1, 1,
0.8639631, 0.3617639, 0.7568251, 0.7764706, 0, 1, 1,
0.8668448, 0.2640187, 0.5460515, 0.7803922, 0, 1, 1,
0.868171, -0.546724, 1.971576, 0.7882353, 0, 1, 1,
0.8762226, 0.5671591, 0.07800743, 0.7921569, 0, 1, 1,
0.8801138, 0.5301264, 0.7857512, 0.8, 0, 1, 1,
0.8825117, 1.654149, -1.458273, 0.8078431, 0, 1, 1,
0.8845568, -0.7831537, 2.958361, 0.8117647, 0, 1, 1,
0.8877959, -1.067525, 3.208786, 0.8196079, 0, 1, 1,
0.8889278, 0.2400355, 0.2716761, 0.8235294, 0, 1, 1,
0.8899825, -0.159466, 1.916382, 0.8313726, 0, 1, 1,
0.8903572, 0.8289562, 1.439719, 0.8352941, 0, 1, 1,
0.9050038, -2.131334, 1.42456, 0.8431373, 0, 1, 1,
0.905794, -1.621952, 3.603789, 0.8470588, 0, 1, 1,
0.9160311, 1.194019, -1.156648, 0.854902, 0, 1, 1,
0.9166557, 2.924885, -1.124668, 0.8588235, 0, 1, 1,
0.9209555, 0.01082054, 0.9781274, 0.8666667, 0, 1, 1,
0.9215796, 2.246627, -1.028015, 0.8705882, 0, 1, 1,
0.9241055, 0.479079, 0.9609343, 0.8784314, 0, 1, 1,
0.9328132, 2.075292, -0.3926702, 0.8823529, 0, 1, 1,
0.9330274, 1.273395, 0.9456835, 0.8901961, 0, 1, 1,
0.9428504, -0.6474962, 1.865675, 0.8941177, 0, 1, 1,
0.9515967, -0.2804929, 1.769263, 0.9019608, 0, 1, 1,
0.9569311, -0.5569027, 2.709654, 0.9098039, 0, 1, 1,
0.9586724, 0.424546, 0.4433412, 0.9137255, 0, 1, 1,
0.9590286, 0.4212076, 1.647961, 0.9215686, 0, 1, 1,
0.9623345, -0.008186929, 1.888883, 0.9254902, 0, 1, 1,
0.9626655, 0.6477938, 1.84199, 0.9333333, 0, 1, 1,
0.9631834, -1.50908, 2.185202, 0.9372549, 0, 1, 1,
0.9646413, 1.434027, 0.8110582, 0.945098, 0, 1, 1,
0.9686853, -0.4807093, 0.4462453, 0.9490196, 0, 1, 1,
0.9765511, 0.6709449, -0.5873709, 0.9568627, 0, 1, 1,
0.9801022, -0.8984259, 3.262233, 0.9607843, 0, 1, 1,
0.9804679, 0.5957415, 0.7908906, 0.9686275, 0, 1, 1,
0.9816188, -0.4199178, 2.603248, 0.972549, 0, 1, 1,
0.990454, -0.01993179, 1.661021, 0.9803922, 0, 1, 1,
1.00153, 0.2551115, 1.205417, 0.9843137, 0, 1, 1,
1.00341, -1.274196, 2.196994, 0.9921569, 0, 1, 1,
1.010159, -0.7488452, 2.080587, 0.9960784, 0, 1, 1,
1.011101, 1.052279, 0.9755335, 1, 0, 0.9960784, 1,
1.017586, -0.2868488, 2.630556, 1, 0, 0.9882353, 1,
1.020254, 0.07685911, 1.297888, 1, 0, 0.9843137, 1,
1.022271, 0.4874962, 2.957808, 1, 0, 0.9764706, 1,
1.022537, -0.8600385, 2.299051, 1, 0, 0.972549, 1,
1.022726, -0.2978543, -0.1653891, 1, 0, 0.9647059, 1,
1.024619, 0.1202701, 1.838204, 1, 0, 0.9607843, 1,
1.037542, 1.281005, 0.4184837, 1, 0, 0.9529412, 1,
1.044615, -0.3042253, 1.038547, 1, 0, 0.9490196, 1,
1.048764, -0.1689488, 4.312299, 1, 0, 0.9411765, 1,
1.075795, 0.5638009, 1.127331, 1, 0, 0.9372549, 1,
1.090795, -0.06910031, 1.323994, 1, 0, 0.9294118, 1,
1.091577, 0.6358881, 1.509268, 1, 0, 0.9254902, 1,
1.094321, -0.1631727, 1.725115, 1, 0, 0.9176471, 1,
1.094452, -0.05328962, -0.08420432, 1, 0, 0.9137255, 1,
1.094725, -1.840537, 4.554496, 1, 0, 0.9058824, 1,
1.09543, -0.4015578, 1.540952, 1, 0, 0.9019608, 1,
1.095984, -1.807501, 0.8921072, 1, 0, 0.8941177, 1,
1.096518, -3.604613, 4.042742, 1, 0, 0.8862745, 1,
1.09903, 0.08634799, -0.5451704, 1, 0, 0.8823529, 1,
1.105509, 0.1066637, 2.007423, 1, 0, 0.8745098, 1,
1.112884, -0.6298146, 1.485806, 1, 0, 0.8705882, 1,
1.113254, -0.157276, 1.628186, 1, 0, 0.8627451, 1,
1.118701, 1.214521, 0.2338384, 1, 0, 0.8588235, 1,
1.12734, -1.124593, 1.74773, 1, 0, 0.8509804, 1,
1.132882, 0.4577688, 1.103779, 1, 0, 0.8470588, 1,
1.13629, 1.043167, -0.35231, 1, 0, 0.8392157, 1,
1.137904, 0.8120036, 3.34772, 1, 0, 0.8352941, 1,
1.139823, -1.014486, 0.8304696, 1, 0, 0.827451, 1,
1.144486, -1.693541, 1.559404, 1, 0, 0.8235294, 1,
1.151763, 1.110266, 0.7336246, 1, 0, 0.8156863, 1,
1.152299, -0.858023, 2.397284, 1, 0, 0.8117647, 1,
1.153667, 0.1659818, 1.429992, 1, 0, 0.8039216, 1,
1.157746, 0.706471, 2.00076, 1, 0, 0.7960784, 1,
1.173536, 0.6327637, 1.583065, 1, 0, 0.7921569, 1,
1.174628, 1.220972, 0.6627692, 1, 0, 0.7843137, 1,
1.176643, 0.3123569, -0.08599778, 1, 0, 0.7803922, 1,
1.17742, -0.1841405, 2.274382, 1, 0, 0.772549, 1,
1.182269, 0.8380049, 0.8597454, 1, 0, 0.7686275, 1,
1.18352, -0.8265719, 2.743047, 1, 0, 0.7607843, 1,
1.186599, -0.5811627, 1.314577, 1, 0, 0.7568628, 1,
1.191882, 0.09342798, 1.847542, 1, 0, 0.7490196, 1,
1.193039, -2.047071, 1.583708, 1, 0, 0.7450981, 1,
1.193531, 0.3430223, 1.7088, 1, 0, 0.7372549, 1,
1.196689, -0.6084226, 1.662114, 1, 0, 0.7333333, 1,
1.198083, 0.8288616, 1.437152, 1, 0, 0.7254902, 1,
1.202307, 0.2774515, 2.397246, 1, 0, 0.7215686, 1,
1.209377, 0.0118208, 1.339072, 1, 0, 0.7137255, 1,
1.209927, 0.09717016, 1.276455, 1, 0, 0.7098039, 1,
1.217603, -0.7223551, 2.420497, 1, 0, 0.7019608, 1,
1.22293, -0.3163989, 2.460845, 1, 0, 0.6941177, 1,
1.224889, -2.071807, -0.1010846, 1, 0, 0.6901961, 1,
1.233122, 0.3476173, 1.896228, 1, 0, 0.682353, 1,
1.235987, -0.7023048, 1.954452, 1, 0, 0.6784314, 1,
1.236805, -1.414414, 2.58471, 1, 0, 0.6705883, 1,
1.237267, 0.6886394, 2.367895, 1, 0, 0.6666667, 1,
1.238771, 0.1421503, 1.103769, 1, 0, 0.6588235, 1,
1.273214, 2.320625, 0.975642, 1, 0, 0.654902, 1,
1.274724, 1.632433, 0.2895333, 1, 0, 0.6470588, 1,
1.277752, -0.5471181, 1.61485, 1, 0, 0.6431373, 1,
1.287111, 1.721365, -0.6594395, 1, 0, 0.6352941, 1,
1.28883, 0.1503968, -0.2005877, 1, 0, 0.6313726, 1,
1.307083, 0.1421678, 1.748663, 1, 0, 0.6235294, 1,
1.312678, -0.02803084, -0.04621045, 1, 0, 0.6196079, 1,
1.313295, 0.08688206, 1.084594, 1, 0, 0.6117647, 1,
1.315998, -0.849699, 1.219511, 1, 0, 0.6078432, 1,
1.316439, -0.7824537, 1.563786, 1, 0, 0.6, 1,
1.319159, 0.2471816, 0.5847797, 1, 0, 0.5921569, 1,
1.321062, -0.05937032, 1.891262, 1, 0, 0.5882353, 1,
1.332961, 0.02352699, 1.325244, 1, 0, 0.5803922, 1,
1.334774, -0.2068809, 1.671742, 1, 0, 0.5764706, 1,
1.342806, -2.906081, 1.849956, 1, 0, 0.5686275, 1,
1.349102, -0.04221045, 2.313863, 1, 0, 0.5647059, 1,
1.349976, -1.843126, 2.964063, 1, 0, 0.5568628, 1,
1.370118, 0.1711609, 0.9627817, 1, 0, 0.5529412, 1,
1.371864, 0.67806, 1.734717, 1, 0, 0.5450981, 1,
1.376118, 0.5981963, 1.390122, 1, 0, 0.5411765, 1,
1.381772, -1.101543, 2.711128, 1, 0, 0.5333334, 1,
1.382732, 0.2217095, 0.9617925, 1, 0, 0.5294118, 1,
1.408416, 2.493727, 2.06051, 1, 0, 0.5215687, 1,
1.416042, -0.02177013, 2.274045, 1, 0, 0.5176471, 1,
1.424507, 1.240699, 2.633372, 1, 0, 0.509804, 1,
1.432139, -0.886875, 2.213718, 1, 0, 0.5058824, 1,
1.433513, -1.000624, 3.070218, 1, 0, 0.4980392, 1,
1.440183, 0.857944, 0.4767244, 1, 0, 0.4901961, 1,
1.449268, -1.181003, 2.635015, 1, 0, 0.4862745, 1,
1.463588, -0.9325302, 2.333988, 1, 0, 0.4784314, 1,
1.466355, -0.4391563, 1.264874, 1, 0, 0.4745098, 1,
1.467414, -0.1530969, 3.08654, 1, 0, 0.4666667, 1,
1.482721, 1.430335, -0.6650866, 1, 0, 0.4627451, 1,
1.485504, -0.6227593, 1.105135, 1, 0, 0.454902, 1,
1.491158, 1.01774, 0.8922604, 1, 0, 0.4509804, 1,
1.50098, 0.6215908, 1.299679, 1, 0, 0.4431373, 1,
1.510331, -1.342792, 0.7648605, 1, 0, 0.4392157, 1,
1.515731, -0.851344, 2.554868, 1, 0, 0.4313726, 1,
1.525425, -0.5908858, 1.247282, 1, 0, 0.427451, 1,
1.537317, -0.7257404, 1.759674, 1, 0, 0.4196078, 1,
1.544174, -0.7820035, 2.733583, 1, 0, 0.4156863, 1,
1.54481, -1.097715, 2.399077, 1, 0, 0.4078431, 1,
1.556599, -1.138083, 2.477238, 1, 0, 0.4039216, 1,
1.557818, -2.25664, 0.5927554, 1, 0, 0.3960784, 1,
1.560749, -0.4992923, 1.790602, 1, 0, 0.3882353, 1,
1.563262, 1.643574, -0.6922543, 1, 0, 0.3843137, 1,
1.570069, 0.7392601, -0.5410677, 1, 0, 0.3764706, 1,
1.580108, 0.3787394, 1.265564, 1, 0, 0.372549, 1,
1.599243, -1.203633, 3.336455, 1, 0, 0.3647059, 1,
1.601798, 0.5842807, 2.383957, 1, 0, 0.3607843, 1,
1.608119, 1.045386, 0.853297, 1, 0, 0.3529412, 1,
1.613618, -0.4210159, 1.988746, 1, 0, 0.3490196, 1,
1.623695, 1.268071, 1.981738, 1, 0, 0.3411765, 1,
1.632023, -0.8655629, 1.764905, 1, 0, 0.3372549, 1,
1.641027, 1.716431, 0.9695549, 1, 0, 0.3294118, 1,
1.648252, 1.084914, -0.3537612, 1, 0, 0.3254902, 1,
1.651275, -0.1197755, 2.72998, 1, 0, 0.3176471, 1,
1.654926, -0.8695571, 1.427032, 1, 0, 0.3137255, 1,
1.669093, 0.3051684, 1.505148, 1, 0, 0.3058824, 1,
1.715743, 2.255782, 2.696832, 1, 0, 0.2980392, 1,
1.717816, 0.9114211, 0.4273387, 1, 0, 0.2941177, 1,
1.749708, -0.5119376, 0.434966, 1, 0, 0.2862745, 1,
1.771802, -0.461976, 3.52446, 1, 0, 0.282353, 1,
1.782861, 1.140091, 1.690097, 1, 0, 0.2745098, 1,
1.791904, 2.315779, -0.750067, 1, 0, 0.2705882, 1,
1.79524, 0.1929332, 2.074339, 1, 0, 0.2627451, 1,
1.806396, 0.6023839, 2.005459, 1, 0, 0.2588235, 1,
1.809378, 1.444114, 0.9245833, 1, 0, 0.2509804, 1,
1.817974, -0.9850389, 1.477245, 1, 0, 0.2470588, 1,
1.818907, -0.7771831, 2.040095, 1, 0, 0.2392157, 1,
1.827384, -0.4811437, 1.780541, 1, 0, 0.2352941, 1,
1.841298, 0.4237112, 0.1842935, 1, 0, 0.227451, 1,
1.843377, -0.8424351, 1.910071, 1, 0, 0.2235294, 1,
1.84532, 0.213793, 0.8850397, 1, 0, 0.2156863, 1,
1.862377, -1.707336, 1.815439, 1, 0, 0.2117647, 1,
1.864648, 0.7286155, 2.790594, 1, 0, 0.2039216, 1,
1.893726, -0.951307, 1.979885, 1, 0, 0.1960784, 1,
1.896925, -1.188074, 1.930183, 1, 0, 0.1921569, 1,
1.926565, 0.9357795, 1.21372, 1, 0, 0.1843137, 1,
1.941931, -1.471299, 3.397075, 1, 0, 0.1803922, 1,
1.969739, -0.1174786, 0.1899852, 1, 0, 0.172549, 1,
2.034618, -0.8055106, 1.628461, 1, 0, 0.1686275, 1,
2.040801, -0.8536517, 3.037981, 1, 0, 0.1607843, 1,
2.056311, 0.03453827, 2.256912, 1, 0, 0.1568628, 1,
2.064263, -0.3275383, 2.982711, 1, 0, 0.1490196, 1,
2.089611, -0.8709279, 4.452245, 1, 0, 0.145098, 1,
2.096906, 1.541899, 0.9524371, 1, 0, 0.1372549, 1,
2.104036, 0.9130347, -0.215662, 1, 0, 0.1333333, 1,
2.132687, -0.7253799, 3.397764, 1, 0, 0.1254902, 1,
2.184428, 0.7862172, 1.538592, 1, 0, 0.1215686, 1,
2.236734, 2.231329, 0.7190675, 1, 0, 0.1137255, 1,
2.243249, 0.02827083, 0.4807628, 1, 0, 0.1098039, 1,
2.297578, -1.424684, 2.12328, 1, 0, 0.1019608, 1,
2.305474, 0.1480999, 1.821944, 1, 0, 0.09411765, 1,
2.322323, -0.1365651, 0.1569365, 1, 0, 0.09019608, 1,
2.3333, -0.3768073, 1.85836, 1, 0, 0.08235294, 1,
2.33832, -2.09054, 1.77025, 1, 0, 0.07843138, 1,
2.360222, 1.904553, 0.6828613, 1, 0, 0.07058824, 1,
2.391542, 0.7550089, 1.024486, 1, 0, 0.06666667, 1,
2.396634, 0.7462896, 1.59019, 1, 0, 0.05882353, 1,
2.441628, -2.062366, 2.398851, 1, 0, 0.05490196, 1,
2.462643, 0.5853202, 3.089519, 1, 0, 0.04705882, 1,
2.50043, 1.042613, 0.1923447, 1, 0, 0.04313726, 1,
2.537597, -0.16881, -0.08075825, 1, 0, 0.03529412, 1,
2.646379, -0.6442797, 1.50427, 1, 0, 0.03137255, 1,
2.673079, -1.342119, 3.268896, 1, 0, 0.02352941, 1,
2.758728, 0.346895, 2.658106, 1, 0, 0.01960784, 1,
3.169392, -0.8212371, 1.034145, 1, 0, 0.01176471, 1,
3.290806, -0.3265676, 2.084277, 1, 0, 0.007843138, 1
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
-0.05058551, -4.767495, -6.79541, 0, -0.5, 0.5, 0.5,
-0.05058551, -4.767495, -6.79541, 1, -0.5, 0.5, 0.5,
-0.05058551, -4.767495, -6.79541, 1, 1.5, 0.5, 0.5,
-0.05058551, -4.767495, -6.79541, 0, 1.5, 0.5, 0.5
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
-4.524708, -0.174283, -6.79541, 0, -0.5, 0.5, 0.5,
-4.524708, -0.174283, -6.79541, 1, -0.5, 0.5, 0.5,
-4.524708, -0.174283, -6.79541, 1, 1.5, 0.5, 0.5,
-4.524708, -0.174283, -6.79541, 0, 1.5, 0.5, 0.5
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
-4.524708, -4.767495, -0.1212428, 0, -0.5, 0.5, 0.5,
-4.524708, -4.767495, -0.1212428, 1, -0.5, 0.5, 0.5,
-4.524708, -4.767495, -0.1212428, 1, 1.5, 0.5, 0.5,
-4.524708, -4.767495, -0.1212428, 0, 1.5, 0.5, 0.5
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
-3, -3.707523, -5.255218,
3, -3.707523, -5.255218,
-3, -3.707523, -5.255218,
-3, -3.884185, -5.511916,
-2, -3.707523, -5.255218,
-2, -3.884185, -5.511916,
-1, -3.707523, -5.255218,
-1, -3.884185, -5.511916,
0, -3.707523, -5.255218,
0, -3.884185, -5.511916,
1, -3.707523, -5.255218,
1, -3.884185, -5.511916,
2, -3.707523, -5.255218,
2, -3.884185, -5.511916,
3, -3.707523, -5.255218,
3, -3.884185, -5.511916
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
-3, -4.237509, -6.025314, 0, -0.5, 0.5, 0.5,
-3, -4.237509, -6.025314, 1, -0.5, 0.5, 0.5,
-3, -4.237509, -6.025314, 1, 1.5, 0.5, 0.5,
-3, -4.237509, -6.025314, 0, 1.5, 0.5, 0.5,
-2, -4.237509, -6.025314, 0, -0.5, 0.5, 0.5,
-2, -4.237509, -6.025314, 1, -0.5, 0.5, 0.5,
-2, -4.237509, -6.025314, 1, 1.5, 0.5, 0.5,
-2, -4.237509, -6.025314, 0, 1.5, 0.5, 0.5,
-1, -4.237509, -6.025314, 0, -0.5, 0.5, 0.5,
-1, -4.237509, -6.025314, 1, -0.5, 0.5, 0.5,
-1, -4.237509, -6.025314, 1, 1.5, 0.5, 0.5,
-1, -4.237509, -6.025314, 0, 1.5, 0.5, 0.5,
0, -4.237509, -6.025314, 0, -0.5, 0.5, 0.5,
0, -4.237509, -6.025314, 1, -0.5, 0.5, 0.5,
0, -4.237509, -6.025314, 1, 1.5, 0.5, 0.5,
0, -4.237509, -6.025314, 0, 1.5, 0.5, 0.5,
1, -4.237509, -6.025314, 0, -0.5, 0.5, 0.5,
1, -4.237509, -6.025314, 1, -0.5, 0.5, 0.5,
1, -4.237509, -6.025314, 1, 1.5, 0.5, 0.5,
1, -4.237509, -6.025314, 0, 1.5, 0.5, 0.5,
2, -4.237509, -6.025314, 0, -0.5, 0.5, 0.5,
2, -4.237509, -6.025314, 1, -0.5, 0.5, 0.5,
2, -4.237509, -6.025314, 1, 1.5, 0.5, 0.5,
2, -4.237509, -6.025314, 0, 1.5, 0.5, 0.5,
3, -4.237509, -6.025314, 0, -0.5, 0.5, 0.5,
3, -4.237509, -6.025314, 1, -0.5, 0.5, 0.5,
3, -4.237509, -6.025314, 1, 1.5, 0.5, 0.5,
3, -4.237509, -6.025314, 0, 1.5, 0.5, 0.5
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
-3.492218, -3, -5.255218,
-3.492218, 3, -5.255218,
-3.492218, -3, -5.255218,
-3.6643, -3, -5.511916,
-3.492218, -2, -5.255218,
-3.6643, -2, -5.511916,
-3.492218, -1, -5.255218,
-3.6643, -1, -5.511916,
-3.492218, 0, -5.255218,
-3.6643, 0, -5.511916,
-3.492218, 1, -5.255218,
-3.6643, 1, -5.511916,
-3.492218, 2, -5.255218,
-3.6643, 2, -5.511916,
-3.492218, 3, -5.255218,
-3.6643, 3, -5.511916
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
-4.008463, -3, -6.025314, 0, -0.5, 0.5, 0.5,
-4.008463, -3, -6.025314, 1, -0.5, 0.5, 0.5,
-4.008463, -3, -6.025314, 1, 1.5, 0.5, 0.5,
-4.008463, -3, -6.025314, 0, 1.5, 0.5, 0.5,
-4.008463, -2, -6.025314, 0, -0.5, 0.5, 0.5,
-4.008463, -2, -6.025314, 1, -0.5, 0.5, 0.5,
-4.008463, -2, -6.025314, 1, 1.5, 0.5, 0.5,
-4.008463, -2, -6.025314, 0, 1.5, 0.5, 0.5,
-4.008463, -1, -6.025314, 0, -0.5, 0.5, 0.5,
-4.008463, -1, -6.025314, 1, -0.5, 0.5, 0.5,
-4.008463, -1, -6.025314, 1, 1.5, 0.5, 0.5,
-4.008463, -1, -6.025314, 0, 1.5, 0.5, 0.5,
-4.008463, 0, -6.025314, 0, -0.5, 0.5, 0.5,
-4.008463, 0, -6.025314, 1, -0.5, 0.5, 0.5,
-4.008463, 0, -6.025314, 1, 1.5, 0.5, 0.5,
-4.008463, 0, -6.025314, 0, 1.5, 0.5, 0.5,
-4.008463, 1, -6.025314, 0, -0.5, 0.5, 0.5,
-4.008463, 1, -6.025314, 1, -0.5, 0.5, 0.5,
-4.008463, 1, -6.025314, 1, 1.5, 0.5, 0.5,
-4.008463, 1, -6.025314, 0, 1.5, 0.5, 0.5,
-4.008463, 2, -6.025314, 0, -0.5, 0.5, 0.5,
-4.008463, 2, -6.025314, 1, -0.5, 0.5, 0.5,
-4.008463, 2, -6.025314, 1, 1.5, 0.5, 0.5,
-4.008463, 2, -6.025314, 0, 1.5, 0.5, 0.5,
-4.008463, 3, -6.025314, 0, -0.5, 0.5, 0.5,
-4.008463, 3, -6.025314, 1, -0.5, 0.5, 0.5,
-4.008463, 3, -6.025314, 1, 1.5, 0.5, 0.5,
-4.008463, 3, -6.025314, 0, 1.5, 0.5, 0.5
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
-3.492218, -3.707523, -4,
-3.492218, -3.707523, 4,
-3.492218, -3.707523, -4,
-3.6643, -3.884185, -4,
-3.492218, -3.707523, -2,
-3.6643, -3.884185, -2,
-3.492218, -3.707523, 0,
-3.6643, -3.884185, 0,
-3.492218, -3.707523, 2,
-3.6643, -3.884185, 2,
-3.492218, -3.707523, 4,
-3.6643, -3.884185, 4
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
-4.008463, -4.237509, -4, 0, -0.5, 0.5, 0.5,
-4.008463, -4.237509, -4, 1, -0.5, 0.5, 0.5,
-4.008463, -4.237509, -4, 1, 1.5, 0.5, 0.5,
-4.008463, -4.237509, -4, 0, 1.5, 0.5, 0.5,
-4.008463, -4.237509, -2, 0, -0.5, 0.5, 0.5,
-4.008463, -4.237509, -2, 1, -0.5, 0.5, 0.5,
-4.008463, -4.237509, -2, 1, 1.5, 0.5, 0.5,
-4.008463, -4.237509, -2, 0, 1.5, 0.5, 0.5,
-4.008463, -4.237509, 0, 0, -0.5, 0.5, 0.5,
-4.008463, -4.237509, 0, 1, -0.5, 0.5, 0.5,
-4.008463, -4.237509, 0, 1, 1.5, 0.5, 0.5,
-4.008463, -4.237509, 0, 0, 1.5, 0.5, 0.5,
-4.008463, -4.237509, 2, 0, -0.5, 0.5, 0.5,
-4.008463, -4.237509, 2, 1, -0.5, 0.5, 0.5,
-4.008463, -4.237509, 2, 1, 1.5, 0.5, 0.5,
-4.008463, -4.237509, 2, 0, 1.5, 0.5, 0.5,
-4.008463, -4.237509, 4, 0, -0.5, 0.5, 0.5,
-4.008463, -4.237509, 4, 1, -0.5, 0.5, 0.5,
-4.008463, -4.237509, 4, 1, 1.5, 0.5, 0.5,
-4.008463, -4.237509, 4, 0, 1.5, 0.5, 0.5
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
-3.492218, -3.707523, -5.255218,
-3.492218, 3.358957, -5.255218,
-3.492218, -3.707523, 5.012732,
-3.492218, 3.358957, 5.012732,
-3.492218, -3.707523, -5.255218,
-3.492218, -3.707523, 5.012732,
-3.492218, 3.358957, -5.255218,
-3.492218, 3.358957, 5.012732,
-3.492218, -3.707523, -5.255218,
3.391047, -3.707523, -5.255218,
-3.492218, -3.707523, 5.012732,
3.391047, -3.707523, 5.012732,
-3.492218, 3.358957, -5.255218,
3.391047, 3.358957, -5.255218,
-3.492218, 3.358957, 5.012732,
3.391047, 3.358957, 5.012732,
3.391047, -3.707523, -5.255218,
3.391047, 3.358957, -5.255218,
3.391047, -3.707523, 5.012732,
3.391047, 3.358957, 5.012732,
3.391047, -3.707523, -5.255218,
3.391047, -3.707523, 5.012732,
3.391047, 3.358957, -5.255218,
3.391047, 3.358957, 5.012732
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
var radius = 7.603277;
var distance = 33.82784;
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
mvMatrix.translate( 0.05058551, 0.174283, 0.1212428 );
mvMatrix.scale( 1.194319, 1.163353, 0.8006285 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.82784);
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
triasulfuron<-read.table("triasulfuron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-triasulfuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'triasulfuron' not found
```

```r
y<-triasulfuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'triasulfuron' not found
```

```r
z<-triasulfuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'triasulfuron' not found
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
-3.391977, -1.33251, -3.038946, 0, 0, 1, 1, 1,
-2.754806, 1.009442, -1.786691, 1, 0, 0, 1, 1,
-2.71349, -0.1056083, -3.682162, 1, 0, 0, 1, 1,
-2.703793, -1.876378, -1.33384, 1, 0, 0, 1, 1,
-2.589008, 1.475097, -1.894288, 1, 0, 0, 1, 1,
-2.553716, -1.977011, -1.586456, 1, 0, 0, 1, 1,
-2.535757, -0.279003, -1.791253, 0, 0, 0, 1, 1,
-2.426997, 0.5483215, -1.765418, 0, 0, 0, 1, 1,
-2.292515, -0.09321491, -2.923913, 0, 0, 0, 1, 1,
-2.287325, 1.018675, -3.19273, 0, 0, 0, 1, 1,
-2.240095, 0.3474206, -1.49215, 0, 0, 0, 1, 1,
-2.225815, -1.306636, -3.103968, 0, 0, 0, 1, 1,
-2.189909, 0.6805238, 1.158655, 0, 0, 0, 1, 1,
-2.187857, -0.7500458, -0.9245449, 1, 1, 1, 1, 1,
-2.14576, -0.40055, 1.837197, 1, 1, 1, 1, 1,
-2.141603, -1.695069, -3.716711, 1, 1, 1, 1, 1,
-2.12113, 0.08848193, -1.351817, 1, 1, 1, 1, 1,
-2.118831, 0.2853481, -1.874747, 1, 1, 1, 1, 1,
-2.111586, 0.4223029, -1.339648, 1, 1, 1, 1, 1,
-2.054433, -1.740579, -2.145172, 1, 1, 1, 1, 1,
-2.03365, 1.182752, -1.16102, 1, 1, 1, 1, 1,
-2.019384, 0.7086245, -2.429172, 1, 1, 1, 1, 1,
-1.99847, -0.8326232, -2.222168, 1, 1, 1, 1, 1,
-1.984256, 0.9428813, -2.160433, 1, 1, 1, 1, 1,
-1.974754, 1.68826, 1.037853, 1, 1, 1, 1, 1,
-1.963877, 0.8515917, -1.103558, 1, 1, 1, 1, 1,
-1.960303, 0.827013, -1.696281, 1, 1, 1, 1, 1,
-1.931514, -0.836911, -2.187541, 1, 1, 1, 1, 1,
-1.892277, 1.219969, -0.7533136, 0, 0, 1, 1, 1,
-1.87667, 1.354856, -0.08979917, 1, 0, 0, 1, 1,
-1.828712, 1.480051, 0.2368432, 1, 0, 0, 1, 1,
-1.798771, -0.2369678, -1.904413, 1, 0, 0, 1, 1,
-1.79131, -0.8864111, -3.231448, 1, 0, 0, 1, 1,
-1.785329, 0.1114259, -1.325497, 1, 0, 0, 1, 1,
-1.751905, 1.058529, 0.2167261, 0, 0, 0, 1, 1,
-1.740158, 0.5375499, -1.416511, 0, 0, 0, 1, 1,
-1.725429, -1.333166, -3.490843, 0, 0, 0, 1, 1,
-1.725139, 0.1070301, -0.1918674, 0, 0, 0, 1, 1,
-1.710029, 0.2419891, -1.888736, 0, 0, 0, 1, 1,
-1.709006, 2.022713, -0.2816729, 0, 0, 0, 1, 1,
-1.706748, -1.541063, -4.168279, 0, 0, 0, 1, 1,
-1.702632, 0.6961989, 0.4966574, 1, 1, 1, 1, 1,
-1.67806, 0.04938334, -2.112776, 1, 1, 1, 1, 1,
-1.673176, -1.352956, -3.227402, 1, 1, 1, 1, 1,
-1.651877, 0.5387778, -1.908576, 1, 1, 1, 1, 1,
-1.638479, -0.5662907, -0.5407221, 1, 1, 1, 1, 1,
-1.622601, 0.4880101, -2.523731, 1, 1, 1, 1, 1,
-1.621229, 0.1129937, -2.186604, 1, 1, 1, 1, 1,
-1.59853, 0.7237025, -0.3917559, 1, 1, 1, 1, 1,
-1.577796, -1.690071, -2.342062, 1, 1, 1, 1, 1,
-1.566873, -0.609304, -1.345428, 1, 1, 1, 1, 1,
-1.557831, -0.5812029, -1.73847, 1, 1, 1, 1, 1,
-1.555623, -0.3424406, -0.6837922, 1, 1, 1, 1, 1,
-1.545463, 0.4900981, -1.942834, 1, 1, 1, 1, 1,
-1.54089, 1.46252, -1.237197, 1, 1, 1, 1, 1,
-1.53337, -0.6310174, -3.726201, 1, 1, 1, 1, 1,
-1.531171, -1.451755, -1.446787, 0, 0, 1, 1, 1,
-1.529444, 1.09711, -1.696727, 1, 0, 0, 1, 1,
-1.528749, 1.350973, -2.621857, 1, 0, 0, 1, 1,
-1.522132, -0.1408466, -2.550995, 1, 0, 0, 1, 1,
-1.522062, 0.1345976, -1.199209, 1, 0, 0, 1, 1,
-1.521847, -0.005119056, -0.8924963, 1, 0, 0, 1, 1,
-1.520793, 0.149566, -0.5626195, 0, 0, 0, 1, 1,
-1.505844, -0.431823, -1.352575, 0, 0, 0, 1, 1,
-1.498105, -0.2393099, -2.717938, 0, 0, 0, 1, 1,
-1.496763, -1.416889, -2.004532, 0, 0, 0, 1, 1,
-1.473532, 0.4182408, -0.7594029, 0, 0, 0, 1, 1,
-1.473364, -0.5659184, -1.951321, 0, 0, 0, 1, 1,
-1.462099, -0.1933971, -3.729642, 0, 0, 0, 1, 1,
-1.450399, -0.582702, -1.970978, 1, 1, 1, 1, 1,
-1.448256, -0.4655403, -1.319976, 1, 1, 1, 1, 1,
-1.448091, -0.5747201, -1.260573, 1, 1, 1, 1, 1,
-1.442318, -2.520989, -5.105684, 1, 1, 1, 1, 1,
-1.440567, 0.005044464, -1.94, 1, 1, 1, 1, 1,
-1.428424, 0.04106808, -2.290523, 1, 1, 1, 1, 1,
-1.42032, 1.138145, -2.341721, 1, 1, 1, 1, 1,
-1.419929, -1.031238, -3.127932, 1, 1, 1, 1, 1,
-1.413148, 0.1166864, -0.5948801, 1, 1, 1, 1, 1,
-1.401356, -0.1317118, -2.245079, 1, 1, 1, 1, 1,
-1.378616, -2.728747, -1.710079, 1, 1, 1, 1, 1,
-1.369312, -0.1808598, -1.351244, 1, 1, 1, 1, 1,
-1.363037, 1.339146, -0.2228175, 1, 1, 1, 1, 1,
-1.346085, 0.3829955, 1.391828, 1, 1, 1, 1, 1,
-1.338508, -1.153289, -1.206376, 1, 1, 1, 1, 1,
-1.318078, -1.137168, -2.911685, 0, 0, 1, 1, 1,
-1.317189, -0.2969779, -2.17311, 1, 0, 0, 1, 1,
-1.30204, -0.8910994, -3.001498, 1, 0, 0, 1, 1,
-1.301804, -2.273081, -1.634675, 1, 0, 0, 1, 1,
-1.290927, 1.303968, -0.3308509, 1, 0, 0, 1, 1,
-1.288712, 0.5374878, 0.2428987, 1, 0, 0, 1, 1,
-1.287864, 0.4303569, -0.5788081, 0, 0, 0, 1, 1,
-1.282878, -1.324451, -0.2919767, 0, 0, 0, 1, 1,
-1.271503, 0.1021943, -2.417371, 0, 0, 0, 1, 1,
-1.263708, -1.60619, -0.9996946, 0, 0, 0, 1, 1,
-1.24515, -0.2031739, -0.969741, 0, 0, 0, 1, 1,
-1.243041, -0.3519007, -2.563237, 0, 0, 0, 1, 1,
-1.22198, -0.9411131, -1.57907, 0, 0, 0, 1, 1,
-1.217563, -1.019988, -3.07162, 1, 1, 1, 1, 1,
-1.206246, -0.50992, -1.92841, 1, 1, 1, 1, 1,
-1.20028, 0.2089879, -1.990245, 1, 1, 1, 1, 1,
-1.188403, -0.2211837, -1.642881, 1, 1, 1, 1, 1,
-1.185397, 1.320659, -1.971616, 1, 1, 1, 1, 1,
-1.180047, 1.21395, -1.424474, 1, 1, 1, 1, 1,
-1.171136, -2.023664, -3.898916, 1, 1, 1, 1, 1,
-1.168783, -1.171921, -1.983045, 1, 1, 1, 1, 1,
-1.167723, 0.06457434, -1.955558, 1, 1, 1, 1, 1,
-1.158291, -0.2815448, -1.228228, 1, 1, 1, 1, 1,
-1.156013, 0.1939936, -0.2977171, 1, 1, 1, 1, 1,
-1.15342, -0.07795399, -1.541511, 1, 1, 1, 1, 1,
-1.148039, 0.880365, 0.006201073, 1, 1, 1, 1, 1,
-1.144502, -0.9311898, -1.514955, 1, 1, 1, 1, 1,
-1.1412, 0.5609562, 1.635011, 1, 1, 1, 1, 1,
-1.129876, -0.4903463, -3.38532, 0, 0, 1, 1, 1,
-1.125234, 0.4016563, -2.514564, 1, 0, 0, 1, 1,
-1.12412, 0.6687893, -1.707506, 1, 0, 0, 1, 1,
-1.119014, -0.1659857, -1.297146, 1, 0, 0, 1, 1,
-1.118851, 0.3864194, -0.09358332, 1, 0, 0, 1, 1,
-1.111689, -2.589178, -2.123813, 1, 0, 0, 1, 1,
-1.111544, 0.3318612, -2.284693, 0, 0, 0, 1, 1,
-1.111349, -1.636135, -1.246164, 0, 0, 0, 1, 1,
-1.108476, 0.8023223, -0.7706193, 0, 0, 0, 1, 1,
-1.106395, -2.353305, -3.338313, 0, 0, 0, 1, 1,
-1.092535, 1.011386, -0.6321533, 0, 0, 0, 1, 1,
-1.091912, -2.304178, -1.865518, 0, 0, 0, 1, 1,
-1.083856, -0.3777508, -3.455478, 0, 0, 0, 1, 1,
-1.078336, 1.759211, -1.852511, 1, 1, 1, 1, 1,
-1.077851, 0.2105528, -1.024223, 1, 1, 1, 1, 1,
-1.077726, -0.7644511, -1.468087, 1, 1, 1, 1, 1,
-1.076231, -0.6089304, -1.837029, 1, 1, 1, 1, 1,
-1.074488, 0.2294703, -0.7295828, 1, 1, 1, 1, 1,
-1.073207, -0.02378658, -2.349995, 1, 1, 1, 1, 1,
-1.069315, -1.265803, -1.862527, 1, 1, 1, 1, 1,
-1.065898, 0.2616363, -1.802736, 1, 1, 1, 1, 1,
-1.058658, -2.109869, -3.846511, 1, 1, 1, 1, 1,
-1.053617, 1.588099, -0.8996097, 1, 1, 1, 1, 1,
-1.052961, 0.08074061, -0.7614639, 1, 1, 1, 1, 1,
-1.050551, 0.3206824, -0.2399667, 1, 1, 1, 1, 1,
-1.037956, -0.6361951, -0.449116, 1, 1, 1, 1, 1,
-1.024034, 1.655236, -0.9037026, 1, 1, 1, 1, 1,
-1.021756, -1.258802, -3.775415, 1, 1, 1, 1, 1,
-1.015208, 1.139814, -0.831857, 0, 0, 1, 1, 1,
-1.013068, 0.2836551, -0.001616809, 1, 0, 0, 1, 1,
-1.009367, -0.3427284, -1.292552, 1, 0, 0, 1, 1,
-1.008661, -0.4002227, -4.484052, 1, 0, 0, 1, 1,
-1.00615, 0.3256994, -1.287908, 1, 0, 0, 1, 1,
-1.00221, -1.027117, -2.471752, 1, 0, 0, 1, 1,
-0.9963485, 0.06346893, -2.919396, 0, 0, 0, 1, 1,
-0.9956244, 0.58329, -3.440059, 0, 0, 0, 1, 1,
-0.9911293, -0.8677918, -1.680197, 0, 0, 0, 1, 1,
-0.9865962, 0.9216675, -1.220682, 0, 0, 0, 1, 1,
-0.9838826, 0.7111016, -2.567147, 0, 0, 0, 1, 1,
-0.9775175, -1.586665, -1.072235, 0, 0, 0, 1, 1,
-0.9742277, -0.2482132, -0.07424457, 0, 0, 0, 1, 1,
-0.9735531, 1.438845, 0.09162921, 1, 1, 1, 1, 1,
-0.9724805, -1.287983, -0.3110151, 1, 1, 1, 1, 1,
-0.9724369, 0.5019565, -1.989835, 1, 1, 1, 1, 1,
-0.9685081, 0.65587, -1.26622, 1, 1, 1, 1, 1,
-0.966517, 0.598797, -0.764128, 1, 1, 1, 1, 1,
-0.9646096, -1.37, -3.1369, 1, 1, 1, 1, 1,
-0.9564483, 1.455253, -0.4551325, 1, 1, 1, 1, 1,
-0.9495975, 0.9750805, -0.6828899, 1, 1, 1, 1, 1,
-0.9493887, 0.4726535, 0.09907579, 1, 1, 1, 1, 1,
-0.9430341, 3.256047, -1.204231, 1, 1, 1, 1, 1,
-0.9203375, -1.110913, -0.8771799, 1, 1, 1, 1, 1,
-0.9200261, 1.292727, -2.157495, 1, 1, 1, 1, 1,
-0.9148161, 0.5995173, -2.629549, 1, 1, 1, 1, 1,
-0.9145926, 1.1701, -1.405328, 1, 1, 1, 1, 1,
-0.9139243, 1.141954, -0.8456043, 1, 1, 1, 1, 1,
-0.9136292, 0.2198053, -1.302398, 0, 0, 1, 1, 1,
-0.9109377, -0.8654799, -2.422166, 1, 0, 0, 1, 1,
-0.9022204, -1.204227, -2.278998, 1, 0, 0, 1, 1,
-0.8978617, -1.508776, -3.085573, 1, 0, 0, 1, 1,
-0.8971137, 0.7149048, 0.2129158, 1, 0, 0, 1, 1,
-0.8926689, -0.3989299, -2.181246, 1, 0, 0, 1, 1,
-0.8890979, 0.5527267, -1.511885, 0, 0, 0, 1, 1,
-0.8809113, 0.3411893, -1.419282, 0, 0, 0, 1, 1,
-0.8767152, 0.2693318, 0.4728204, 0, 0, 0, 1, 1,
-0.8763356, -0.1964771, -1.893089, 0, 0, 0, 1, 1,
-0.87462, 0.0273788, -1.592882, 0, 0, 0, 1, 1,
-0.8701087, 0.5198774, -1.036109, 0, 0, 0, 1, 1,
-0.8681393, -1.00807, -2.245883, 0, 0, 0, 1, 1,
-0.8628371, -1.91636, -4.300332, 1, 1, 1, 1, 1,
-0.8621358, -0.9622034, -2.878986, 1, 1, 1, 1, 1,
-0.8567004, -1.492478, -1.066977, 1, 1, 1, 1, 1,
-0.8562045, -0.6249287, -2.676619, 1, 1, 1, 1, 1,
-0.8537506, 0.05684953, -1.065895, 1, 1, 1, 1, 1,
-0.8474775, -0.6701521, -0.2693097, 1, 1, 1, 1, 1,
-0.8429378, -0.03055659, -1.789167, 1, 1, 1, 1, 1,
-0.8379249, 1.820516, -0.4179373, 1, 1, 1, 1, 1,
-0.8363556, -1.142344, -3.252375, 1, 1, 1, 1, 1,
-0.8359355, -0.7899234, -2.889085, 1, 1, 1, 1, 1,
-0.8344739, 1.595873, -0.03744228, 1, 1, 1, 1, 1,
-0.8341653, 1.999622, 0.4107131, 1, 1, 1, 1, 1,
-0.8272524, 1.28382, -1.800001, 1, 1, 1, 1, 1,
-0.8185194, -1.377134, -4.424948, 1, 1, 1, 1, 1,
-0.809995, -0.0463445, -2.149239, 1, 1, 1, 1, 1,
-0.8049442, 0.5055708, 0.618462, 0, 0, 1, 1, 1,
-0.8029796, 0.7328551, -1.826474, 1, 0, 0, 1, 1,
-0.8010955, 0.3347539, -2.156998, 1, 0, 0, 1, 1,
-0.7939135, -1.071052, -2.499078, 1, 0, 0, 1, 1,
-0.791721, 1.012478, -2.161964, 1, 0, 0, 1, 1,
-0.7843635, 0.2838652, 0.2087583, 1, 0, 0, 1, 1,
-0.7736762, -0.9840553, -2.839249, 0, 0, 0, 1, 1,
-0.7732736, -0.7084684, -2.617769, 0, 0, 0, 1, 1,
-0.7723819, -1.060293, -1.961154, 0, 0, 0, 1, 1,
-0.7680961, 2.006259, -0.9285996, 0, 0, 0, 1, 1,
-0.7644197, -0.6773622, -2.50945, 0, 0, 0, 1, 1,
-0.7602887, -0.305227, -2.303236, 0, 0, 0, 1, 1,
-0.7574332, 1.770256, 0.6079495, 0, 0, 0, 1, 1,
-0.7565439, -1.133876, -1.624385, 1, 1, 1, 1, 1,
-0.7555935, 2.356873, -0.6648158, 1, 1, 1, 1, 1,
-0.7531426, -1.040311, -2.900835, 1, 1, 1, 1, 1,
-0.7506487, 0.7294292, -1.316709, 1, 1, 1, 1, 1,
-0.7502764, 0.3833287, -2.227342, 1, 1, 1, 1, 1,
-0.745546, -1.256234, -2.079177, 1, 1, 1, 1, 1,
-0.7436863, 0.9857138, -1.393252, 1, 1, 1, 1, 1,
-0.7423978, 0.7269793, -1.119754, 1, 1, 1, 1, 1,
-0.7272483, -0.06130918, -0.4426008, 1, 1, 1, 1, 1,
-0.7254897, -1.212094, -1.831611, 1, 1, 1, 1, 1,
-0.7236385, -1.248082, -3.844356, 1, 1, 1, 1, 1,
-0.7232131, -0.986964, -2.612221, 1, 1, 1, 1, 1,
-0.7213364, 0.5501048, -2.396279, 1, 1, 1, 1, 1,
-0.716395, -0.3915251, -3.201117, 1, 1, 1, 1, 1,
-0.711488, -1.003443, -1.40048, 1, 1, 1, 1, 1,
-0.7105235, -0.5397563, -2.465396, 0, 0, 1, 1, 1,
-0.7100459, -0.296131, -2.711984, 1, 0, 0, 1, 1,
-0.7084473, 0.04678303, -2.434005, 1, 0, 0, 1, 1,
-0.7060364, -0.6086367, -1.332168, 1, 0, 0, 1, 1,
-0.7010593, 1.078724, -0.2164591, 1, 0, 0, 1, 1,
-0.6961229, 1.347717, 0.7138833, 1, 0, 0, 1, 1,
-0.6958449, 1.525415, -1.588784, 0, 0, 0, 1, 1,
-0.6853085, -1.275693, -3.466197, 0, 0, 0, 1, 1,
-0.6717305, 0.5519285, -0.4173049, 0, 0, 0, 1, 1,
-0.6715508, 2.130091, -0.1900847, 0, 0, 0, 1, 1,
-0.6698411, -0.6945615, -1.217353, 0, 0, 0, 1, 1,
-0.6656603, 0.5614076, -0.9309113, 0, 0, 0, 1, 1,
-0.6620449, -0.4814246, -2.574398, 0, 0, 0, 1, 1,
-0.6604648, -0.02596255, -1.340009, 1, 1, 1, 1, 1,
-0.6438318, 1.451892, -0.4736573, 1, 1, 1, 1, 1,
-0.6423679, -0.2738165, -1.532069, 1, 1, 1, 1, 1,
-0.6350018, -1.054507, -4.264649, 1, 1, 1, 1, 1,
-0.6346074, -0.6362014, -1.611469, 1, 1, 1, 1, 1,
-0.6328282, 0.3135551, -1.575495, 1, 1, 1, 1, 1,
-0.6316503, 1.093058, -0.5502569, 1, 1, 1, 1, 1,
-0.6312484, 0.02685753, -1.670514, 1, 1, 1, 1, 1,
-0.6287044, 1.290557, -1.456692, 1, 1, 1, 1, 1,
-0.619834, -0.4996424, -3.401231, 1, 1, 1, 1, 1,
-0.6165492, 1.358364, -1.160182, 1, 1, 1, 1, 1,
-0.6135648, 0.03353995, -1.24921, 1, 1, 1, 1, 1,
-0.6122617, 1.636187, -1.596531, 1, 1, 1, 1, 1,
-0.5893624, -0.7947577, -3.348983, 1, 1, 1, 1, 1,
-0.5867763, -0.3348658, -2.008842, 1, 1, 1, 1, 1,
-0.5825884, -0.09925877, -1.072889, 0, 0, 1, 1, 1,
-0.5790066, -1.298496, -3.411129, 1, 0, 0, 1, 1,
-0.5788299, 0.03356207, -3.146995, 1, 0, 0, 1, 1,
-0.5767556, 0.5482549, 0.2360893, 1, 0, 0, 1, 1,
-0.5728858, -0.3131227, -1.311979, 1, 0, 0, 1, 1,
-0.5711868, 0.5088356, -3.153866, 1, 0, 0, 1, 1,
-0.5628664, 1.580424, -1.69977, 0, 0, 0, 1, 1,
-0.5619535, 1.558391, -0.007137983, 0, 0, 0, 1, 1,
-0.5617082, -0.6127009, -1.137551, 0, 0, 0, 1, 1,
-0.5588616, 2.27624, 0.8371238, 0, 0, 0, 1, 1,
-0.5573481, 1.030857, -2.0339, 0, 0, 0, 1, 1,
-0.5562921, 0.5890869, -1.533507, 0, 0, 0, 1, 1,
-0.5521854, 1.819564, 0.9960884, 0, 0, 0, 1, 1,
-0.5482459, 1.035551, -0.5412751, 1, 1, 1, 1, 1,
-0.5445589, -0.5070294, -3.017907, 1, 1, 1, 1, 1,
-0.5431717, -0.9395403, -1.942649, 1, 1, 1, 1, 1,
-0.5421607, 1.532711, -1.652323, 1, 1, 1, 1, 1,
-0.5374404, 0.5635909, 0.3396482, 1, 1, 1, 1, 1,
-0.5370403, 0.3999283, -0.4328194, 1, 1, 1, 1, 1,
-0.5284182, 1.559418, -1.029274, 1, 1, 1, 1, 1,
-0.5267642, -0.7774789, -1.603577, 1, 1, 1, 1, 1,
-0.5265693, 0.7504994, -2.436774, 1, 1, 1, 1, 1,
-0.5257982, 1.696085, -2.176048, 1, 1, 1, 1, 1,
-0.5254503, -0.8479928, -1.833949, 1, 1, 1, 1, 1,
-0.5241424, 1.813975, -1.040604, 1, 1, 1, 1, 1,
-0.5225592, 0.0824239, -3.064086, 1, 1, 1, 1, 1,
-0.5210063, 0.912083, -0.9490826, 1, 1, 1, 1, 1,
-0.5199171, -0.9223166, -0.8740436, 1, 1, 1, 1, 1,
-0.5193603, -0.4790215, -1.21228, 0, 0, 1, 1, 1,
-0.5193128, 0.1413144, 0.1823566, 1, 0, 0, 1, 1,
-0.518759, 0.2508259, -1.989644, 1, 0, 0, 1, 1,
-0.5181601, -2.025757, -1.61702, 1, 0, 0, 1, 1,
-0.5088863, 2.277273, -0.8845378, 1, 0, 0, 1, 1,
-0.5079111, 0.3797508, 0.1818311, 1, 0, 0, 1, 1,
-0.5073767, -0.09582996, -1.609526, 0, 0, 0, 1, 1,
-0.5038273, 0.05718948, -1.63225, 0, 0, 0, 1, 1,
-0.5019805, 0.209876, -2.08258, 0, 0, 0, 1, 1,
-0.5005756, -0.9149764, -2.591152, 0, 0, 0, 1, 1,
-0.4981369, 1.422753, -0.8807766, 0, 0, 0, 1, 1,
-0.496298, 0.8456331, -0.9013664, 0, 0, 0, 1, 1,
-0.496011, -0.4534858, -1.274903, 0, 0, 0, 1, 1,
-0.4933771, -0.8771559, -1.493707, 1, 1, 1, 1, 1,
-0.4930362, -0.8539086, -1.670614, 1, 1, 1, 1, 1,
-0.4908453, 0.7158371, 0.1767644, 1, 1, 1, 1, 1,
-0.4904239, 0.0545391, -0.4021573, 1, 1, 1, 1, 1,
-0.4870044, -0.2075994, -2.661368, 1, 1, 1, 1, 1,
-0.4856261, -0.04850359, -1.922089, 1, 1, 1, 1, 1,
-0.4742559, -0.9558709, -2.634617, 1, 1, 1, 1, 1,
-0.4716382, -1.097201, -1.84738, 1, 1, 1, 1, 1,
-0.4707539, -1.034425, -3.404751, 1, 1, 1, 1, 1,
-0.469892, 0.4907821, 0.2266694, 1, 1, 1, 1, 1,
-0.4689501, -0.5697234, -2.457247, 1, 1, 1, 1, 1,
-0.4667889, 0.57528, -0.8276437, 1, 1, 1, 1, 1,
-0.4667285, 1.41555, 0.9536047, 1, 1, 1, 1, 1,
-0.4634694, 0.9210947, -0.2017791, 1, 1, 1, 1, 1,
-0.4614768, 0.7630169, 0.06345955, 1, 1, 1, 1, 1,
-0.4609778, 0.2189458, -1.063313, 0, 0, 1, 1, 1,
-0.4605676, -2.295868, -1.987324, 1, 0, 0, 1, 1,
-0.4597735, -0.8317286, -3.335107, 1, 0, 0, 1, 1,
-0.4587527, 1.694997, 1.282923, 1, 0, 0, 1, 1,
-0.4581768, -0.9064464, -4.215343, 1, 0, 0, 1, 1,
-0.4555832, 2.864716, 2.404649, 1, 0, 0, 1, 1,
-0.4528751, 1.117942, -2.146097, 0, 0, 0, 1, 1,
-0.4457958, 0.02861236, -2.441834, 0, 0, 0, 1, 1,
-0.4454396, -0.2050984, -1.691301, 0, 0, 0, 1, 1,
-0.4440006, 2.020189, 0.5277456, 0, 0, 0, 1, 1,
-0.4388692, -1.776911, -3.582366, 0, 0, 0, 1, 1,
-0.4368417, 1.155784, -0.6391544, 0, 0, 0, 1, 1,
-0.4355677, 0.336708, -2.833668, 0, 0, 0, 1, 1,
-0.4325112, -0.109228, -2.333525, 1, 1, 1, 1, 1,
-0.431025, -1.425194, -3.56205, 1, 1, 1, 1, 1,
-0.4289193, -1.485719, -1.347355, 1, 1, 1, 1, 1,
-0.4270943, 0.5212738, -1.55673, 1, 1, 1, 1, 1,
-0.4261166, -0.2060255, -1.429075, 1, 1, 1, 1, 1,
-0.4208348, 1.771476, -0.06122619, 1, 1, 1, 1, 1,
-0.4165982, 0.7419228, 0.1806294, 1, 1, 1, 1, 1,
-0.4097087, -0.03667175, -2.726853, 1, 1, 1, 1, 1,
-0.4058129, -1.751447, -4.233693, 1, 1, 1, 1, 1,
-0.4057051, -0.2864774, -2.979656, 1, 1, 1, 1, 1,
-0.4033778, -1.520591, -3.56481, 1, 1, 1, 1, 1,
-0.4003984, -0.7518306, -1.306593, 1, 1, 1, 1, 1,
-0.4000211, -0.4405837, -4.136062, 1, 1, 1, 1, 1,
-0.3958696, -0.6710546, -1.7981, 1, 1, 1, 1, 1,
-0.3955292, -0.2426425, -0.9431732, 1, 1, 1, 1, 1,
-0.3944921, 0.3815366, -1.26541, 0, 0, 1, 1, 1,
-0.3930776, -2.072437, -3.280003, 1, 0, 0, 1, 1,
-0.3905717, 0.951991, 0.1144156, 1, 0, 0, 1, 1,
-0.3900237, 0.05813644, -2.783348, 1, 0, 0, 1, 1,
-0.3867691, -1.023157, -2.53318, 1, 0, 0, 1, 1,
-0.3867336, 0.7721984, 0.04823536, 1, 0, 0, 1, 1,
-0.3853418, -0.5605583, -2.016872, 0, 0, 0, 1, 1,
-0.3710598, 0.4530604, -1.074399, 0, 0, 0, 1, 1,
-0.3686683, -0.2614763, -1.123611, 0, 0, 0, 1, 1,
-0.3658997, -1.87702, -3.259696, 0, 0, 0, 1, 1,
-0.3624807, 1.241081, -1.836238, 0, 0, 0, 1, 1,
-0.3611625, 0.6834531, 0.8946331, 0, 0, 0, 1, 1,
-0.358615, -0.5551521, -3.39162, 0, 0, 0, 1, 1,
-0.3568507, 0.8733235, 0.1240459, 1, 1, 1, 1, 1,
-0.353791, -0.04243451, -1.24317, 1, 1, 1, 1, 1,
-0.3484501, 1.682714, 0.2557746, 1, 1, 1, 1, 1,
-0.3464967, 0.3929541, -0.4614064, 1, 1, 1, 1, 1,
-0.3460726, 1.278035, 0.4597957, 1, 1, 1, 1, 1,
-0.3452759, 1.246196, 0.4072534, 1, 1, 1, 1, 1,
-0.3444853, -0.06546517, -2.166144, 1, 1, 1, 1, 1,
-0.3411784, -0.05951199, -1.025851, 1, 1, 1, 1, 1,
-0.3406222, -0.5643041, -3.155834, 1, 1, 1, 1, 1,
-0.3381452, -1.06026, -2.274969, 1, 1, 1, 1, 1,
-0.3313163, -0.0227064, -3.193788, 1, 1, 1, 1, 1,
-0.3244059, 0.3984053, -0.03700429, 1, 1, 1, 1, 1,
-0.3227122, -1.122744, -2.243598, 1, 1, 1, 1, 1,
-0.3205768, 0.04253015, -1.331496, 1, 1, 1, 1, 1,
-0.3189165, 0.3916195, -1.459891, 1, 1, 1, 1, 1,
-0.3158951, 0.4412829, -1.663066, 0, 0, 1, 1, 1,
-0.3158947, -0.8022838, -1.171687, 1, 0, 0, 1, 1,
-0.3117248, 1.457796, 0.508103, 1, 0, 0, 1, 1,
-0.3108455, -1.517598, -3.672575, 1, 0, 0, 1, 1,
-0.3085457, -0.7633972, -1.082285, 1, 0, 0, 1, 1,
-0.3055624, -0.004072457, -0.8886431, 1, 0, 0, 1, 1,
-0.303287, 0.2433043, -0.9792733, 0, 0, 0, 1, 1,
-0.2980689, -0.782005, -3.480477, 0, 0, 0, 1, 1,
-0.2945272, 0.6761653, -1.011152, 0, 0, 0, 1, 1,
-0.2942376, -0.1446233, -1.452491, 0, 0, 0, 1, 1,
-0.2935475, -0.5231705, -1.544704, 0, 0, 0, 1, 1,
-0.2900839, 1.105892, -0.1531785, 0, 0, 0, 1, 1,
-0.2884092, -0.0633813, -1.740258, 0, 0, 0, 1, 1,
-0.2831787, 2.092827, 0.2150473, 1, 1, 1, 1, 1,
-0.2775216, -0.8838945, -3.869918, 1, 1, 1, 1, 1,
-0.2725386, -1.126059, -1.792634, 1, 1, 1, 1, 1,
-0.271208, -1.611368, -2.050092, 1, 1, 1, 1, 1,
-0.2695715, 0.1213721, -0.6375624, 1, 1, 1, 1, 1,
-0.2653948, 0.8818278, -0.9816881, 1, 1, 1, 1, 1,
-0.2631404, 0.9905859, -0.01837319, 1, 1, 1, 1, 1,
-0.2590357, 1.068961, 0.8426344, 1, 1, 1, 1, 1,
-0.2578811, 1.960274, 0.1642291, 1, 1, 1, 1, 1,
-0.2534827, 0.7537286, -1.694321, 1, 1, 1, 1, 1,
-0.2518999, 0.5696422, -3.115616, 1, 1, 1, 1, 1,
-0.251078, 0.7456053, 0.05285909, 1, 1, 1, 1, 1,
-0.2482538, 1.737272, 0.973636, 1, 1, 1, 1, 1,
-0.2461266, 1.196834, -0.610523, 1, 1, 1, 1, 1,
-0.2450207, -0.6561239, -1.650949, 1, 1, 1, 1, 1,
-0.2449031, 0.1344718, -0.4775952, 0, 0, 1, 1, 1,
-0.2439314, 0.009827958, -0.6491613, 1, 0, 0, 1, 1,
-0.2395136, 0.5982814, -0.7298301, 1, 0, 0, 1, 1,
-0.2359461, 1.639809, -1.455055, 1, 0, 0, 1, 1,
-0.2357224, -0.7091618, -2.0441, 1, 0, 0, 1, 1,
-0.2288093, -0.2960426, -2.514616, 1, 0, 0, 1, 1,
-0.2244209, 0.4390596, -1.201919, 0, 0, 0, 1, 1,
-0.2235669, 1.598529, -2.148076, 0, 0, 0, 1, 1,
-0.2232442, 0.4524235, -1.173186, 0, 0, 0, 1, 1,
-0.2210793, -0.4572028, -2.59882, 0, 0, 0, 1, 1,
-0.2155226, 0.7105436, -0.2603797, 0, 0, 0, 1, 1,
-0.2124837, 0.2580644, -1.257872, 0, 0, 0, 1, 1,
-0.2122732, 0.7216475, 0.5965617, 0, 0, 0, 1, 1,
-0.2067967, 0.2409992, -2.126951, 1, 1, 1, 1, 1,
-0.205548, 0.1043623, -2.536756, 1, 1, 1, 1, 1,
-0.2035229, -1.35552, -2.100845, 1, 1, 1, 1, 1,
-0.2025431, -1.107956, -2.902339, 1, 1, 1, 1, 1,
-0.1872188, -1.313058, -4.029744, 1, 1, 1, 1, 1,
-0.1847232, -0.494338, -3.125517, 1, 1, 1, 1, 1,
-0.1837218, 1.201852, 0.7085491, 1, 1, 1, 1, 1,
-0.1832319, 0.02563348, -1.579152, 1, 1, 1, 1, 1,
-0.1813205, -0.2065462, -3.15104, 1, 1, 1, 1, 1,
-0.1786696, -0.4550781, -5.065522, 1, 1, 1, 1, 1,
-0.1777528, -1.136321, -3.518364, 1, 1, 1, 1, 1,
-0.1766011, 3.127783, 0.5486544, 1, 1, 1, 1, 1,
-0.1763311, 2.141704, -0.5008122, 1, 1, 1, 1, 1,
-0.1757362, 0.1511426, 0.2191417, 1, 1, 1, 1, 1,
-0.1701773, 1.788844, -0.7843644, 1, 1, 1, 1, 1,
-0.1676695, 0.3947434, 0.1651827, 0, 0, 1, 1, 1,
-0.167007, 1.71988, 0.2437507, 1, 0, 0, 1, 1,
-0.1655755, -0.7387103, -3.42926, 1, 0, 0, 1, 1,
-0.164387, 0.4933592, -0.5718175, 1, 0, 0, 1, 1,
-0.1640839, -0.2919589, -2.321693, 1, 0, 0, 1, 1,
-0.1596759, 0.517294, -0.6104778, 1, 0, 0, 1, 1,
-0.1562955, -2.576944, -3.424662, 0, 0, 0, 1, 1,
-0.1530583, 0.7561142, 0.2569705, 0, 0, 0, 1, 1,
-0.149965, -1.105035, -3.809266, 0, 0, 0, 1, 1,
-0.1494995, 0.4198181, -0.7809997, 0, 0, 0, 1, 1,
-0.1484169, -1.323516, -2.344047, 0, 0, 0, 1, 1,
-0.14678, -1.736806, -2.063426, 0, 0, 0, 1, 1,
-0.143491, -1.974363, -2.953906, 0, 0, 0, 1, 1,
-0.1420197, -0.309401, -1.602273, 1, 1, 1, 1, 1,
-0.1412734, -0.1288572, -2.221506, 1, 1, 1, 1, 1,
-0.1398267, -0.1477323, -1.886482, 1, 1, 1, 1, 1,
-0.1302091, -0.02199752, -1.7814, 1, 1, 1, 1, 1,
-0.1273061, -0.04099444, -3.022422, 1, 1, 1, 1, 1,
-0.1258256, 0.8321681, -0.7252277, 1, 1, 1, 1, 1,
-0.1242547, -0.6091515, -2.738993, 1, 1, 1, 1, 1,
-0.1228067, -0.8279064, -2.980113, 1, 1, 1, 1, 1,
-0.1140759, 0.5916331, 0.8590179, 1, 1, 1, 1, 1,
-0.1124552, -1.783795, -0.6691785, 1, 1, 1, 1, 1,
-0.1084774, 1.067923, -1.436967, 1, 1, 1, 1, 1,
-0.1081128, 0.3822019, -0.1023965, 1, 1, 1, 1, 1,
-0.1025517, 1.867455, -0.9373314, 1, 1, 1, 1, 1,
-0.1018613, 0.4460006, -0.2355867, 1, 1, 1, 1, 1,
-0.1010193, -0.01136691, -2.155999, 1, 1, 1, 1, 1,
-0.09275203, 0.4333631, 0.5771589, 0, 0, 1, 1, 1,
-0.09249748, -1.219022, -3.334512, 1, 0, 0, 1, 1,
-0.08840288, 0.6632104, 0.2666693, 1, 0, 0, 1, 1,
-0.08658931, 0.07570435, 0.3655624, 1, 0, 0, 1, 1,
-0.07991392, 1.133731, -0.9129167, 1, 0, 0, 1, 1,
-0.07473601, 0.1693612, 0.2701266, 1, 0, 0, 1, 1,
-0.07278659, -0.7942241, -2.859497, 0, 0, 0, 1, 1,
-0.06640706, 1.912079, 0.4078721, 0, 0, 0, 1, 1,
-0.06296197, -0.7066758, -2.622482, 0, 0, 0, 1, 1,
-0.06164109, -2.552874, -2.653674, 0, 0, 0, 1, 1,
-0.06001638, 0.3461787, -0.2733449, 0, 0, 0, 1, 1,
-0.05960613, 0.5965236, -1.953612, 0, 0, 0, 1, 1,
-0.05871879, -1.088083, -2.83203, 0, 0, 0, 1, 1,
-0.05756956, -0.5068288, -2.920652, 1, 1, 1, 1, 1,
-0.04777987, 2.408872, -0.02139607, 1, 1, 1, 1, 1,
-0.04752435, -1.955633, -2.648369, 1, 1, 1, 1, 1,
-0.04627456, 0.5343197, -0.5190421, 1, 1, 1, 1, 1,
-0.04343197, 1.099654, 0.8946683, 1, 1, 1, 1, 1,
-0.03928911, 0.2394042, -0.04531451, 1, 1, 1, 1, 1,
-0.03838472, 0.2503956, -0.8394807, 1, 1, 1, 1, 1,
-0.03609948, -1.549864, -4.939964, 1, 1, 1, 1, 1,
-0.03436685, -0.5798042, -2.371687, 1, 1, 1, 1, 1,
-0.02812178, -1.701278, -4.966674, 1, 1, 1, 1, 1,
-0.02658653, 0.05838397, 0.9515001, 1, 1, 1, 1, 1,
-0.02509094, 0.2629076, -0.3374609, 1, 1, 1, 1, 1,
-0.02456681, 0.5378684, -0.6589192, 1, 1, 1, 1, 1,
-0.02229732, -0.4109311, -4.513914, 1, 1, 1, 1, 1,
-0.02158701, -0.3648495, -3.688744, 1, 1, 1, 1, 1,
-0.02066441, 0.5165608, 0.4074256, 0, 0, 1, 1, 1,
-0.007590623, -0.9798819, -2.44518, 1, 0, 0, 1, 1,
-0.007188524, -0.5929495, -2.014142, 1, 0, 0, 1, 1,
-0.003084273, -2.382476, -3.734226, 1, 0, 0, 1, 1,
-0.002405691, 1.93968, 1.239087, 1, 0, 0, 1, 1,
-0.0006800226, 0.1208445, 0.4411386, 1, 0, 0, 1, 1,
0.0005796045, -0.3360669, 4.384604, 0, 0, 0, 1, 1,
0.0009215458, -0.564824, 2.957409, 0, 0, 0, 1, 1,
0.003461583, -0.2613848, 4.051229, 0, 0, 0, 1, 1,
0.004025554, 1.794639, 0.4480423, 0, 0, 0, 1, 1,
0.005870994, 1.325551, -1.028534, 0, 0, 0, 1, 1,
0.01111683, 0.90847, -0.6267804, 0, 0, 0, 1, 1,
0.01464231, 0.451655, -0.1184296, 0, 0, 0, 1, 1,
0.01613511, 0.6059413, 0.2328378, 1, 1, 1, 1, 1,
0.0204838, -1.44813, 3.750907, 1, 1, 1, 1, 1,
0.0219386, -1.635135, 2.293669, 1, 1, 1, 1, 1,
0.02378735, 0.378702, -0.1127359, 1, 1, 1, 1, 1,
0.02414835, 0.230051, -0.2917392, 1, 1, 1, 1, 1,
0.03101556, -0.6212837, 3.987426, 1, 1, 1, 1, 1,
0.03153479, 1.828489, 0.3178232, 1, 1, 1, 1, 1,
0.03218279, -0.2649862, 3.328018, 1, 1, 1, 1, 1,
0.03313052, 0.5650322, -0.8969636, 1, 1, 1, 1, 1,
0.03346531, -0.2660481, 4.496761, 1, 1, 1, 1, 1,
0.03735514, 0.7155887, 0.5714534, 1, 1, 1, 1, 1,
0.0412565, -0.6651747, 2.141069, 1, 1, 1, 1, 1,
0.04269889, -0.4938209, 4.280347, 1, 1, 1, 1, 1,
0.0434635, -0.04330361, 0.4143189, 1, 1, 1, 1, 1,
0.04551176, -0.298959, 1.588406, 1, 1, 1, 1, 1,
0.04932464, -0.08810238, 3.493939, 0, 0, 1, 1, 1,
0.04962836, 1.273652, -2.176244, 1, 0, 0, 1, 1,
0.05175193, -0.2061183, 2.865814, 1, 0, 0, 1, 1,
0.05185514, -3.088054, 2.133321, 1, 0, 0, 1, 1,
0.05743822, -1.574177, 3.252492, 1, 0, 0, 1, 1,
0.05793571, -0.3295313, 2.823071, 1, 0, 0, 1, 1,
0.05980349, -0.4236842, 2.28579, 0, 0, 0, 1, 1,
0.06518111, 1.268856, 1.024063, 0, 0, 0, 1, 1,
0.06624029, 0.8392127, -0.761524, 0, 0, 0, 1, 1,
0.06732839, 0.1621361, 0.5580389, 0, 0, 0, 1, 1,
0.06776822, 0.6451101, -0.262199, 0, 0, 0, 1, 1,
0.06936159, 0.6624821, -0.09101775, 0, 0, 0, 1, 1,
0.07721887, -0.9772948, 2.688801, 0, 0, 0, 1, 1,
0.07779808, 0.469265, -0.1551004, 1, 1, 1, 1, 1,
0.07906266, 0.6294355, 0.1171608, 1, 1, 1, 1, 1,
0.07983115, 0.4722089, 0.9128378, 1, 1, 1, 1, 1,
0.08308282, -1.220984, 4.763533, 1, 1, 1, 1, 1,
0.08343042, 0.6487859, -0.2953766, 1, 1, 1, 1, 1,
0.08388405, -0.2027682, 3.618533, 1, 1, 1, 1, 1,
0.08719321, -2.236805, 2.912002, 1, 1, 1, 1, 1,
0.08729541, 0.7018216, 1.587761, 1, 1, 1, 1, 1,
0.09438984, 0.05570285, 0.3278653, 1, 1, 1, 1, 1,
0.09450602, 0.2220598, 0.9144489, 1, 1, 1, 1, 1,
0.09499522, 1.341805, 0.8498501, 1, 1, 1, 1, 1,
0.09657758, -1.357318, 3.619914, 1, 1, 1, 1, 1,
0.09679087, -0.4718419, 2.413588, 1, 1, 1, 1, 1,
0.09892207, 1.23823, -0.6288881, 1, 1, 1, 1, 1,
0.09953633, -0.4386943, 4.268676, 1, 1, 1, 1, 1,
0.1013097, -0.2997769, 4.24765, 0, 0, 1, 1, 1,
0.1038122, -1.156893, 4.526151, 1, 0, 0, 1, 1,
0.1041692, 1.605518, -2.028659, 1, 0, 0, 1, 1,
0.1155943, 0.7107691, -1.120764, 1, 0, 0, 1, 1,
0.1200707, -1.001118, 2.61617, 1, 0, 0, 1, 1,
0.1203308, 0.8753234, -0.293782, 1, 0, 0, 1, 1,
0.1226483, 1.268401, 1.460918, 0, 0, 0, 1, 1,
0.1269057, -1.073021, 2.494095, 0, 0, 0, 1, 1,
0.1271296, -0.3434333, 4.315468, 0, 0, 0, 1, 1,
0.1314255, 0.1298723, 0.09227134, 0, 0, 0, 1, 1,
0.1342363, 0.07929029, 1.747122, 0, 0, 0, 1, 1,
0.1397219, 0.2542692, -0.2819461, 0, 0, 0, 1, 1,
0.1417063, -0.07076821, 1.096291, 0, 0, 0, 1, 1,
0.151631, 1.173816, 0.3747985, 1, 1, 1, 1, 1,
0.1538339, 0.667734, -0.8571979, 1, 1, 1, 1, 1,
0.1551642, 3.252124, 0.5945135, 1, 1, 1, 1, 1,
0.1583144, 2.148482, 0.04270187, 1, 1, 1, 1, 1,
0.1626365, -0.06859303, 0.5178416, 1, 1, 1, 1, 1,
0.1642885, -0.2330875, 3.273146, 1, 1, 1, 1, 1,
0.1731603, -2.652261, 2.976924, 1, 1, 1, 1, 1,
0.188563, 0.290083, 0.8158322, 1, 1, 1, 1, 1,
0.1912194, 0.09344726, 2.362906, 1, 1, 1, 1, 1,
0.1949009, -0.7385444, 2.743676, 1, 1, 1, 1, 1,
0.1963442, 0.4004081, 0.3213833, 1, 1, 1, 1, 1,
0.1963725, -0.9538345, 4.863199, 1, 1, 1, 1, 1,
0.1996603, 1.336707, 0.002662122, 1, 1, 1, 1, 1,
0.2004714, 1.231386, -0.1527571, 1, 1, 1, 1, 1,
0.2051272, 0.7325951, -0.3219419, 1, 1, 1, 1, 1,
0.2074614, -0.4021726, 1.766116, 0, 0, 1, 1, 1,
0.2084799, 0.5458193, 0.1933689, 1, 0, 0, 1, 1,
0.2088932, 1.493136, 0.4458748, 1, 0, 0, 1, 1,
0.2120726, 0.1032786, 2.363667, 1, 0, 0, 1, 1,
0.2126697, -1.656814, 3.967661, 1, 0, 0, 1, 1,
0.2129062, 0.9301214, -0.8710196, 1, 0, 0, 1, 1,
0.2156517, 1.951946, 1.411431, 0, 0, 0, 1, 1,
0.2261642, 1.563109, -1.085381, 0, 0, 0, 1, 1,
0.2289386, 1.677158, 0.338824, 0, 0, 0, 1, 1,
0.2305285, 0.2312671, 2.186909, 0, 0, 0, 1, 1,
0.2309379, -0.07112757, 1.261229, 0, 0, 0, 1, 1,
0.232287, 0.5956675, 0.02910333, 0, 0, 0, 1, 1,
0.2346475, 1.218223, 0.8216563, 0, 0, 0, 1, 1,
0.2357054, 0.7754433, -1.047487, 1, 1, 1, 1, 1,
0.2361508, -1.211621, 1.604486, 1, 1, 1, 1, 1,
0.2416601, 0.09547149, 1.686226, 1, 1, 1, 1, 1,
0.2425608, 0.248026, 0.5676019, 1, 1, 1, 1, 1,
0.2460588, 1.961645, 1.026507, 1, 1, 1, 1, 1,
0.2465179, -0.2560655, 2.142092, 1, 1, 1, 1, 1,
0.2481325, -0.4399683, 4.406465, 1, 1, 1, 1, 1,
0.2501227, 1.067369, 2.098967, 1, 1, 1, 1, 1,
0.2562307, 0.3806549, 0.004721156, 1, 1, 1, 1, 1,
0.2588628, -0.7855348, 2.867075, 1, 1, 1, 1, 1,
0.2635252, -0.8441619, 2.592029, 1, 1, 1, 1, 1,
0.2638658, 1.286878, 1.490276, 1, 1, 1, 1, 1,
0.2678612, 0.3322261, 0.6766304, 1, 1, 1, 1, 1,
0.2682482, -0.1513749, 2.178153, 1, 1, 1, 1, 1,
0.2701281, 0.05810434, 0.3202401, 1, 1, 1, 1, 1,
0.2706038, -0.1405626, 1.66071, 0, 0, 1, 1, 1,
0.2803724, -1.017634, 3.078902, 1, 0, 0, 1, 1,
0.2818756, -1.136284, 1.086595, 1, 0, 0, 1, 1,
0.2868636, 0.8297043, 0.4791893, 1, 0, 0, 1, 1,
0.287819, 1.753763, 0.3280834, 1, 0, 0, 1, 1,
0.2899343, 0.4781179, 0.1989902, 1, 0, 0, 1, 1,
0.2917286, 0.574044, -0.2364813, 0, 0, 0, 1, 1,
0.2924803, 0.1530482, 1.468941, 0, 0, 0, 1, 1,
0.2932332, 0.600631, 1.375082, 0, 0, 0, 1, 1,
0.2954897, 0.3829186, -1.315794, 0, 0, 0, 1, 1,
0.2977084, 0.7842239, 0.5774929, 0, 0, 0, 1, 1,
0.3009186, -0.391468, 2.50418, 0, 0, 0, 1, 1,
0.3066063, -0.9447407, 2.616111, 0, 0, 0, 1, 1,
0.3142556, -0.3407077, 2.070958, 1, 1, 1, 1, 1,
0.3157015, -0.5453305, 3.248242, 1, 1, 1, 1, 1,
0.3199135, -0.1437255, 1.770837, 1, 1, 1, 1, 1,
0.3226371, -1.316132, 3.500084, 1, 1, 1, 1, 1,
0.3243232, -0.3254358, 2.284054, 1, 1, 1, 1, 1,
0.3245579, -0.2804234, 4.005436, 1, 1, 1, 1, 1,
0.3281772, -0.6365179, 2.082195, 1, 1, 1, 1, 1,
0.328289, 0.910952, 0.1704799, 1, 1, 1, 1, 1,
0.3284429, 0.1985834, 0.923778, 1, 1, 1, 1, 1,
0.3292148, -0.6535776, 2.724874, 1, 1, 1, 1, 1,
0.3369788, 1.633212, 0.9427179, 1, 1, 1, 1, 1,
0.3405075, -0.1436739, 3.10054, 1, 1, 1, 1, 1,
0.348886, -1.300742, 2.200771, 1, 1, 1, 1, 1,
0.3512318, -0.8146249, 2.730474, 1, 1, 1, 1, 1,
0.3515273, 0.5222906, -0.306787, 1, 1, 1, 1, 1,
0.3537749, -0.448422, 1.260308, 0, 0, 1, 1, 1,
0.35416, -0.880447, 1.253928, 1, 0, 0, 1, 1,
0.3580883, 0.2797766, 1.85318, 1, 0, 0, 1, 1,
0.366053, 0.6638777, 0.6025421, 1, 0, 0, 1, 1,
0.3671764, 0.946426, -1.583362, 1, 0, 0, 1, 1,
0.3675155, 0.02364971, 2.056625, 1, 0, 0, 1, 1,
0.367964, 0.2613116, 1.783835, 0, 0, 0, 1, 1,
0.373336, -0.2559633, 1.747461, 0, 0, 0, 1, 1,
0.3760037, 2.078427, 0.8273309, 0, 0, 0, 1, 1,
0.3772783, -0.9699504, 1.383834, 0, 0, 0, 1, 1,
0.3774436, 2.65949, 0.2318117, 0, 0, 0, 1, 1,
0.3866092, 1.490149, -1.508478, 0, 0, 0, 1, 1,
0.3888239, -0.2247872, 3.659534, 0, 0, 0, 1, 1,
0.3917787, 0.948152, -0.9461452, 1, 1, 1, 1, 1,
0.3921637, -0.1733969, 2.420788, 1, 1, 1, 1, 1,
0.3927875, 0.5485094, -0.2368022, 1, 1, 1, 1, 1,
0.3935787, 1.688784, -0.9855772, 1, 1, 1, 1, 1,
0.3943392, -0.09537748, 1.231601, 1, 1, 1, 1, 1,
0.3966541, 1.56333, 1.34754, 1, 1, 1, 1, 1,
0.3969398, 0.3594069, 0.514774, 1, 1, 1, 1, 1,
0.3978943, -1.459866, 3.66632, 1, 1, 1, 1, 1,
0.4030726, 1.227967, 0.5044338, 1, 1, 1, 1, 1,
0.4131479, -0.009955507, 1.348078, 1, 1, 1, 1, 1,
0.4140188, 2.669791, -0.3740249, 1, 1, 1, 1, 1,
0.4148246, -0.009553012, 3.296917, 1, 1, 1, 1, 1,
0.4189595, -0.1270945, 2.211166, 1, 1, 1, 1, 1,
0.4218625, -1.333683, 1.331836, 1, 1, 1, 1, 1,
0.4310108, -0.6212023, 1.103045, 1, 1, 1, 1, 1,
0.4345676, -0.2192202, 1.580586, 0, 0, 1, 1, 1,
0.4346601, 0.5195602, 0.8482124, 1, 0, 0, 1, 1,
0.44053, -1.093599, 3.47231, 1, 0, 0, 1, 1,
0.4459584, -1.020565, 1.420609, 1, 0, 0, 1, 1,
0.4519815, 1.085442, 0.5813707, 1, 0, 0, 1, 1,
0.4539306, 1.20903, 0.5183581, 1, 0, 0, 1, 1,
0.454647, 0.3233749, 0.6153005, 0, 0, 0, 1, 1,
0.454971, 0.6777108, -1.824638, 0, 0, 0, 1, 1,
0.4553181, -0.03080322, 0.8834275, 0, 0, 0, 1, 1,
0.4566435, -0.4928851, 2.846961, 0, 0, 0, 1, 1,
0.456791, 2.57481, -0.232112, 0, 0, 0, 1, 1,
0.4572234, 1.235465, 0.6991012, 0, 0, 0, 1, 1,
0.4627064, 1.863997, -1.176069, 0, 0, 0, 1, 1,
0.4630011, -0.3814955, 2.153212, 1, 1, 1, 1, 1,
0.4639758, 0.8934154, 1.093493, 1, 1, 1, 1, 1,
0.464006, -1.26149, 1.52112, 1, 1, 1, 1, 1,
0.4690096, -0.7538939, 3.649282, 1, 1, 1, 1, 1,
0.4700201, 0.5170697, 1.209146, 1, 1, 1, 1, 1,
0.4727878, 0.0003459273, 2.630578, 1, 1, 1, 1, 1,
0.4749503, 1.81441, -0.4914221, 1, 1, 1, 1, 1,
0.4786449, -0.671271, 1.453106, 1, 1, 1, 1, 1,
0.479686, -1.019643, 2.477982, 1, 1, 1, 1, 1,
0.4803824, 0.7124993, -0.3394135, 1, 1, 1, 1, 1,
0.4820942, 0.924284, -0.8301436, 1, 1, 1, 1, 1,
0.4843349, -0.4786608, 1.716014, 1, 1, 1, 1, 1,
0.4874476, 0.3052447, 1.112505, 1, 1, 1, 1, 1,
0.4893996, -0.3394543, 0.76109, 1, 1, 1, 1, 1,
0.4919403, -2.196029, 3.971164, 1, 1, 1, 1, 1,
0.4958341, -0.7913183, 0.6007538, 0, 0, 1, 1, 1,
0.500326, 0.6542448, -2.741423, 1, 0, 0, 1, 1,
0.503111, 0.06385712, 2.481036, 1, 0, 0, 1, 1,
0.5053506, 1.237144, -0.5370739, 1, 0, 0, 1, 1,
0.5060674, -0.1852558, 3.877074, 1, 0, 0, 1, 1,
0.5071717, -0.5076787, 4.36586, 1, 0, 0, 1, 1,
0.5072287, -0.07785293, 1.409787, 0, 0, 0, 1, 1,
0.5100306, -0.7453861, 0.7841588, 0, 0, 0, 1, 1,
0.5102589, -0.4471147, 3.925453, 0, 0, 0, 1, 1,
0.5148465, 0.5532519, 0.5524097, 0, 0, 0, 1, 1,
0.5160831, -0.2016784, 2.054371, 0, 0, 0, 1, 1,
0.5218648, -1.143788, 3.797289, 0, 0, 0, 1, 1,
0.5220397, 0.1140323, -0.1279373, 0, 0, 0, 1, 1,
0.5243351, -0.7173184, 4.41301, 1, 1, 1, 1, 1,
0.5247888, 0.5166665, -0.1835046, 1, 1, 1, 1, 1,
0.5257417, -0.8273928, 2.467123, 1, 1, 1, 1, 1,
0.5281286, -2.218303, 3.416751, 1, 1, 1, 1, 1,
0.5336249, 0.6897002, 1.39723, 1, 1, 1, 1, 1,
0.5363759, -0.5584128, 1.476643, 1, 1, 1, 1, 1,
0.5365301, -0.038232, 3.099355, 1, 1, 1, 1, 1,
0.5389966, -0.5427641, 1.651246, 1, 1, 1, 1, 1,
0.5438341, -1.153294, 2.155325, 1, 1, 1, 1, 1,
0.5487813, 1.050413, -0.5090861, 1, 1, 1, 1, 1,
0.5512146, 0.3138475, 1.579252, 1, 1, 1, 1, 1,
0.5580308, -0.1890899, 1.718852, 1, 1, 1, 1, 1,
0.5599775, -0.1845741, 3.856407, 1, 1, 1, 1, 1,
0.5608838, -0.8035702, 3.405017, 1, 1, 1, 1, 1,
0.5612593, -0.7623727, 3.195366, 1, 1, 1, 1, 1,
0.5643806, 0.09909295, 1.145794, 0, 0, 1, 1, 1,
0.5688655, 2.319683, -2.169054, 1, 0, 0, 1, 1,
0.5806774, -0.2019763, 1.811476, 1, 0, 0, 1, 1,
0.5808268, 1.294928, -0.6113297, 1, 0, 0, 1, 1,
0.5861979, 0.7864915, 2.88297, 1, 0, 0, 1, 1,
0.5885302, -1.186349, 3.969089, 1, 0, 0, 1, 1,
0.590857, -0.00553108, 1.020178, 0, 0, 0, 1, 1,
0.5945411, 0.7282397, 1.629524, 0, 0, 0, 1, 1,
0.5969482, -0.8455269, 2.093392, 0, 0, 0, 1, 1,
0.5982143, 0.9601194, 0.3448599, 0, 0, 0, 1, 1,
0.5983809, 0.1283708, 2.595017, 0, 0, 0, 1, 1,
0.6054889, -1.235734, 2.721469, 0, 0, 0, 1, 1,
0.6149921, -2.174145, 3.845723, 0, 0, 0, 1, 1,
0.6209052, -0.04756665, 3.39966, 1, 1, 1, 1, 1,
0.625212, -0.4400101, 2.718479, 1, 1, 1, 1, 1,
0.6256676, 1.584393, 0.4607099, 1, 1, 1, 1, 1,
0.6257276, -2.035015, 3.570228, 1, 1, 1, 1, 1,
0.6278918, -0.3375609, 1.270637, 1, 1, 1, 1, 1,
0.628885, -0.09982427, 2.907546, 1, 1, 1, 1, 1,
0.6356523, -0.8734648, 1.699728, 1, 1, 1, 1, 1,
0.6406356, 0.2082908, 0.7072571, 1, 1, 1, 1, 1,
0.6406424, -2.022477, 2.594591, 1, 1, 1, 1, 1,
0.6421604, -0.4809217, 1.526688, 1, 1, 1, 1, 1,
0.6437432, -0.5080801, 2.541508, 1, 1, 1, 1, 1,
0.6458517, 0.1440707, 1.511919, 1, 1, 1, 1, 1,
0.6472154, 0.9012142, 1.563887, 1, 1, 1, 1, 1,
0.64932, -2.508536, 2.089822, 1, 1, 1, 1, 1,
0.653015, 1.590052, -0.3448896, 1, 1, 1, 1, 1,
0.659789, -0.9253974, 2.947937, 0, 0, 1, 1, 1,
0.6628794, -0.576049, 4.357737, 1, 0, 0, 1, 1,
0.6635418, -0.0160149, 2.816461, 1, 0, 0, 1, 1,
0.6659672, 0.1632698, 0.6766388, 1, 0, 0, 1, 1,
0.6672269, 2.011877, 0.2313184, 1, 0, 0, 1, 1,
0.672178, 0.9500374, 0.6999999, 1, 0, 0, 1, 1,
0.6740103, -0.7165064, 2.913154, 0, 0, 0, 1, 1,
0.6741196, -1.016925, 0.8420214, 0, 0, 0, 1, 1,
0.6762033, 0.6028629, 0.1989679, 0, 0, 0, 1, 1,
0.6837817, -0.4475101, 0.9997995, 0, 0, 0, 1, 1,
0.6878559, 1.550926, -0.2135091, 0, 0, 0, 1, 1,
0.6894442, -1.329726, 1.649849, 0, 0, 0, 1, 1,
0.6989501, -0.2389962, 1.071919, 0, 0, 0, 1, 1,
0.7000191, -0.9634416, 0.03888683, 1, 1, 1, 1, 1,
0.703472, 0.7071151, 1.568936, 1, 1, 1, 1, 1,
0.7087315, -0.4768965, 2.160894, 1, 1, 1, 1, 1,
0.7140486, -0.3591529, 1.41057, 1, 1, 1, 1, 1,
0.715832, 1.536653, 0.3073672, 1, 1, 1, 1, 1,
0.717918, -1.528933, 4.103807, 1, 1, 1, 1, 1,
0.7216337, 1.303298, 1.281355, 1, 1, 1, 1, 1,
0.7228248, 1.301754, -0.6286283, 1, 1, 1, 1, 1,
0.7301905, -0.07669153, 1.546627, 1, 1, 1, 1, 1,
0.7305478, -0.2596481, 0.9524813, 1, 1, 1, 1, 1,
0.7307183, 0.623694, 0.298141, 1, 1, 1, 1, 1,
0.7310002, -0.2991648, 2.994007, 1, 1, 1, 1, 1,
0.7314136, -1.563291, 3.538938, 1, 1, 1, 1, 1,
0.7323834, -0.4052191, 1.028264, 1, 1, 1, 1, 1,
0.7333428, -1.269354, 4.461943, 1, 1, 1, 1, 1,
0.7336617, 0.5448787, 0.09739657, 0, 0, 1, 1, 1,
0.7355035, 2.557966, -0.7022022, 1, 0, 0, 1, 1,
0.7443271, -0.2828355, 0.8808107, 1, 0, 0, 1, 1,
0.7475274, -0.5068719, 1.520694, 1, 0, 0, 1, 1,
0.7480263, -1.216588, 1.71762, 1, 0, 0, 1, 1,
0.7549863, 2.04436, 1.81953, 1, 0, 0, 1, 1,
0.7588362, -0.1041323, -0.06826939, 0, 0, 0, 1, 1,
0.7617983, 1.556599, -1.033396, 0, 0, 0, 1, 1,
0.7638669, -1.176307, 2.578301, 0, 0, 0, 1, 1,
0.7649108, -0.493457, 2.267348, 0, 0, 0, 1, 1,
0.765115, -0.2620905, 2.485704, 0, 0, 0, 1, 1,
0.7726375, 0.5972961, 0.8277723, 0, 0, 0, 1, 1,
0.772821, -0.5879654, 2.263354, 0, 0, 0, 1, 1,
0.7816105, -0.9628897, 4.109982, 1, 1, 1, 1, 1,
0.7944981, -0.1670973, 0.9482033, 1, 1, 1, 1, 1,
0.7964616, -0.04052163, 2.068611, 1, 1, 1, 1, 1,
0.7971621, 0.6385701, 0.845214, 1, 1, 1, 1, 1,
0.7985772, 0.3839458, 2.432263, 1, 1, 1, 1, 1,
0.8037012, 0.5045027, 1.699718, 1, 1, 1, 1, 1,
0.8066979, -0.2960661, 0.3701479, 1, 1, 1, 1, 1,
0.8087118, 1.33562, 0.4568315, 1, 1, 1, 1, 1,
0.8175088, 0.6176717, 1.274593, 1, 1, 1, 1, 1,
0.8198248, 0.3989421, 2.346159, 1, 1, 1, 1, 1,
0.8230103, -0.5542215, 1.22073, 1, 1, 1, 1, 1,
0.8247084, -0.5778078, 0.05489173, 1, 1, 1, 1, 1,
0.8253289, 0.9693521, 0.3592434, 1, 1, 1, 1, 1,
0.8276014, -0.8889906, 1.585835, 1, 1, 1, 1, 1,
0.8278153, -1.122803, 3.170197, 1, 1, 1, 1, 1,
0.8465564, 2.104278, 0.4432957, 0, 0, 1, 1, 1,
0.8493885, -1.24833, 3.071496, 1, 0, 0, 1, 1,
0.8496648, 0.7432298, 0.3383698, 1, 0, 0, 1, 1,
0.8514948, 0.9359784, 2.114007, 1, 0, 0, 1, 1,
0.851642, 0.5126957, 1.521956, 1, 0, 0, 1, 1,
0.8528944, -0.2149982, 1.384336, 1, 0, 0, 1, 1,
0.8552914, -0.1376956, 2.73803, 0, 0, 0, 1, 1,
0.8567401, 1.153771, 0.8799519, 0, 0, 0, 1, 1,
0.8570224, -1.553766, 4.114332, 0, 0, 0, 1, 1,
0.8598845, 0.893403, 0.7086061, 0, 0, 0, 1, 1,
0.8630661, -1.276597, 1.945968, 0, 0, 0, 1, 1,
0.8634045, -0.009055533, 1.180884, 0, 0, 0, 1, 1,
0.8639631, 0.3617639, 0.7568251, 0, 0, 0, 1, 1,
0.8668448, 0.2640187, 0.5460515, 1, 1, 1, 1, 1,
0.868171, -0.546724, 1.971576, 1, 1, 1, 1, 1,
0.8762226, 0.5671591, 0.07800743, 1, 1, 1, 1, 1,
0.8801138, 0.5301264, 0.7857512, 1, 1, 1, 1, 1,
0.8825117, 1.654149, -1.458273, 1, 1, 1, 1, 1,
0.8845568, -0.7831537, 2.958361, 1, 1, 1, 1, 1,
0.8877959, -1.067525, 3.208786, 1, 1, 1, 1, 1,
0.8889278, 0.2400355, 0.2716761, 1, 1, 1, 1, 1,
0.8899825, -0.159466, 1.916382, 1, 1, 1, 1, 1,
0.8903572, 0.8289562, 1.439719, 1, 1, 1, 1, 1,
0.9050038, -2.131334, 1.42456, 1, 1, 1, 1, 1,
0.905794, -1.621952, 3.603789, 1, 1, 1, 1, 1,
0.9160311, 1.194019, -1.156648, 1, 1, 1, 1, 1,
0.9166557, 2.924885, -1.124668, 1, 1, 1, 1, 1,
0.9209555, 0.01082054, 0.9781274, 1, 1, 1, 1, 1,
0.9215796, 2.246627, -1.028015, 0, 0, 1, 1, 1,
0.9241055, 0.479079, 0.9609343, 1, 0, 0, 1, 1,
0.9328132, 2.075292, -0.3926702, 1, 0, 0, 1, 1,
0.9330274, 1.273395, 0.9456835, 1, 0, 0, 1, 1,
0.9428504, -0.6474962, 1.865675, 1, 0, 0, 1, 1,
0.9515967, -0.2804929, 1.769263, 1, 0, 0, 1, 1,
0.9569311, -0.5569027, 2.709654, 0, 0, 0, 1, 1,
0.9586724, 0.424546, 0.4433412, 0, 0, 0, 1, 1,
0.9590286, 0.4212076, 1.647961, 0, 0, 0, 1, 1,
0.9623345, -0.008186929, 1.888883, 0, 0, 0, 1, 1,
0.9626655, 0.6477938, 1.84199, 0, 0, 0, 1, 1,
0.9631834, -1.50908, 2.185202, 0, 0, 0, 1, 1,
0.9646413, 1.434027, 0.8110582, 0, 0, 0, 1, 1,
0.9686853, -0.4807093, 0.4462453, 1, 1, 1, 1, 1,
0.9765511, 0.6709449, -0.5873709, 1, 1, 1, 1, 1,
0.9801022, -0.8984259, 3.262233, 1, 1, 1, 1, 1,
0.9804679, 0.5957415, 0.7908906, 1, 1, 1, 1, 1,
0.9816188, -0.4199178, 2.603248, 1, 1, 1, 1, 1,
0.990454, -0.01993179, 1.661021, 1, 1, 1, 1, 1,
1.00153, 0.2551115, 1.205417, 1, 1, 1, 1, 1,
1.00341, -1.274196, 2.196994, 1, 1, 1, 1, 1,
1.010159, -0.7488452, 2.080587, 1, 1, 1, 1, 1,
1.011101, 1.052279, 0.9755335, 1, 1, 1, 1, 1,
1.017586, -0.2868488, 2.630556, 1, 1, 1, 1, 1,
1.020254, 0.07685911, 1.297888, 1, 1, 1, 1, 1,
1.022271, 0.4874962, 2.957808, 1, 1, 1, 1, 1,
1.022537, -0.8600385, 2.299051, 1, 1, 1, 1, 1,
1.022726, -0.2978543, -0.1653891, 1, 1, 1, 1, 1,
1.024619, 0.1202701, 1.838204, 0, 0, 1, 1, 1,
1.037542, 1.281005, 0.4184837, 1, 0, 0, 1, 1,
1.044615, -0.3042253, 1.038547, 1, 0, 0, 1, 1,
1.048764, -0.1689488, 4.312299, 1, 0, 0, 1, 1,
1.075795, 0.5638009, 1.127331, 1, 0, 0, 1, 1,
1.090795, -0.06910031, 1.323994, 1, 0, 0, 1, 1,
1.091577, 0.6358881, 1.509268, 0, 0, 0, 1, 1,
1.094321, -0.1631727, 1.725115, 0, 0, 0, 1, 1,
1.094452, -0.05328962, -0.08420432, 0, 0, 0, 1, 1,
1.094725, -1.840537, 4.554496, 0, 0, 0, 1, 1,
1.09543, -0.4015578, 1.540952, 0, 0, 0, 1, 1,
1.095984, -1.807501, 0.8921072, 0, 0, 0, 1, 1,
1.096518, -3.604613, 4.042742, 0, 0, 0, 1, 1,
1.09903, 0.08634799, -0.5451704, 1, 1, 1, 1, 1,
1.105509, 0.1066637, 2.007423, 1, 1, 1, 1, 1,
1.112884, -0.6298146, 1.485806, 1, 1, 1, 1, 1,
1.113254, -0.157276, 1.628186, 1, 1, 1, 1, 1,
1.118701, 1.214521, 0.2338384, 1, 1, 1, 1, 1,
1.12734, -1.124593, 1.74773, 1, 1, 1, 1, 1,
1.132882, 0.4577688, 1.103779, 1, 1, 1, 1, 1,
1.13629, 1.043167, -0.35231, 1, 1, 1, 1, 1,
1.137904, 0.8120036, 3.34772, 1, 1, 1, 1, 1,
1.139823, -1.014486, 0.8304696, 1, 1, 1, 1, 1,
1.144486, -1.693541, 1.559404, 1, 1, 1, 1, 1,
1.151763, 1.110266, 0.7336246, 1, 1, 1, 1, 1,
1.152299, -0.858023, 2.397284, 1, 1, 1, 1, 1,
1.153667, 0.1659818, 1.429992, 1, 1, 1, 1, 1,
1.157746, 0.706471, 2.00076, 1, 1, 1, 1, 1,
1.173536, 0.6327637, 1.583065, 0, 0, 1, 1, 1,
1.174628, 1.220972, 0.6627692, 1, 0, 0, 1, 1,
1.176643, 0.3123569, -0.08599778, 1, 0, 0, 1, 1,
1.17742, -0.1841405, 2.274382, 1, 0, 0, 1, 1,
1.182269, 0.8380049, 0.8597454, 1, 0, 0, 1, 1,
1.18352, -0.8265719, 2.743047, 1, 0, 0, 1, 1,
1.186599, -0.5811627, 1.314577, 0, 0, 0, 1, 1,
1.191882, 0.09342798, 1.847542, 0, 0, 0, 1, 1,
1.193039, -2.047071, 1.583708, 0, 0, 0, 1, 1,
1.193531, 0.3430223, 1.7088, 0, 0, 0, 1, 1,
1.196689, -0.6084226, 1.662114, 0, 0, 0, 1, 1,
1.198083, 0.8288616, 1.437152, 0, 0, 0, 1, 1,
1.202307, 0.2774515, 2.397246, 0, 0, 0, 1, 1,
1.209377, 0.0118208, 1.339072, 1, 1, 1, 1, 1,
1.209927, 0.09717016, 1.276455, 1, 1, 1, 1, 1,
1.217603, -0.7223551, 2.420497, 1, 1, 1, 1, 1,
1.22293, -0.3163989, 2.460845, 1, 1, 1, 1, 1,
1.224889, -2.071807, -0.1010846, 1, 1, 1, 1, 1,
1.233122, 0.3476173, 1.896228, 1, 1, 1, 1, 1,
1.235987, -0.7023048, 1.954452, 1, 1, 1, 1, 1,
1.236805, -1.414414, 2.58471, 1, 1, 1, 1, 1,
1.237267, 0.6886394, 2.367895, 1, 1, 1, 1, 1,
1.238771, 0.1421503, 1.103769, 1, 1, 1, 1, 1,
1.273214, 2.320625, 0.975642, 1, 1, 1, 1, 1,
1.274724, 1.632433, 0.2895333, 1, 1, 1, 1, 1,
1.277752, -0.5471181, 1.61485, 1, 1, 1, 1, 1,
1.287111, 1.721365, -0.6594395, 1, 1, 1, 1, 1,
1.28883, 0.1503968, -0.2005877, 1, 1, 1, 1, 1,
1.307083, 0.1421678, 1.748663, 0, 0, 1, 1, 1,
1.312678, -0.02803084, -0.04621045, 1, 0, 0, 1, 1,
1.313295, 0.08688206, 1.084594, 1, 0, 0, 1, 1,
1.315998, -0.849699, 1.219511, 1, 0, 0, 1, 1,
1.316439, -0.7824537, 1.563786, 1, 0, 0, 1, 1,
1.319159, 0.2471816, 0.5847797, 1, 0, 0, 1, 1,
1.321062, -0.05937032, 1.891262, 0, 0, 0, 1, 1,
1.332961, 0.02352699, 1.325244, 0, 0, 0, 1, 1,
1.334774, -0.2068809, 1.671742, 0, 0, 0, 1, 1,
1.342806, -2.906081, 1.849956, 0, 0, 0, 1, 1,
1.349102, -0.04221045, 2.313863, 0, 0, 0, 1, 1,
1.349976, -1.843126, 2.964063, 0, 0, 0, 1, 1,
1.370118, 0.1711609, 0.9627817, 0, 0, 0, 1, 1,
1.371864, 0.67806, 1.734717, 1, 1, 1, 1, 1,
1.376118, 0.5981963, 1.390122, 1, 1, 1, 1, 1,
1.381772, -1.101543, 2.711128, 1, 1, 1, 1, 1,
1.382732, 0.2217095, 0.9617925, 1, 1, 1, 1, 1,
1.408416, 2.493727, 2.06051, 1, 1, 1, 1, 1,
1.416042, -0.02177013, 2.274045, 1, 1, 1, 1, 1,
1.424507, 1.240699, 2.633372, 1, 1, 1, 1, 1,
1.432139, -0.886875, 2.213718, 1, 1, 1, 1, 1,
1.433513, -1.000624, 3.070218, 1, 1, 1, 1, 1,
1.440183, 0.857944, 0.4767244, 1, 1, 1, 1, 1,
1.449268, -1.181003, 2.635015, 1, 1, 1, 1, 1,
1.463588, -0.9325302, 2.333988, 1, 1, 1, 1, 1,
1.466355, -0.4391563, 1.264874, 1, 1, 1, 1, 1,
1.467414, -0.1530969, 3.08654, 1, 1, 1, 1, 1,
1.482721, 1.430335, -0.6650866, 1, 1, 1, 1, 1,
1.485504, -0.6227593, 1.105135, 0, 0, 1, 1, 1,
1.491158, 1.01774, 0.8922604, 1, 0, 0, 1, 1,
1.50098, 0.6215908, 1.299679, 1, 0, 0, 1, 1,
1.510331, -1.342792, 0.7648605, 1, 0, 0, 1, 1,
1.515731, -0.851344, 2.554868, 1, 0, 0, 1, 1,
1.525425, -0.5908858, 1.247282, 1, 0, 0, 1, 1,
1.537317, -0.7257404, 1.759674, 0, 0, 0, 1, 1,
1.544174, -0.7820035, 2.733583, 0, 0, 0, 1, 1,
1.54481, -1.097715, 2.399077, 0, 0, 0, 1, 1,
1.556599, -1.138083, 2.477238, 0, 0, 0, 1, 1,
1.557818, -2.25664, 0.5927554, 0, 0, 0, 1, 1,
1.560749, -0.4992923, 1.790602, 0, 0, 0, 1, 1,
1.563262, 1.643574, -0.6922543, 0, 0, 0, 1, 1,
1.570069, 0.7392601, -0.5410677, 1, 1, 1, 1, 1,
1.580108, 0.3787394, 1.265564, 1, 1, 1, 1, 1,
1.599243, -1.203633, 3.336455, 1, 1, 1, 1, 1,
1.601798, 0.5842807, 2.383957, 1, 1, 1, 1, 1,
1.608119, 1.045386, 0.853297, 1, 1, 1, 1, 1,
1.613618, -0.4210159, 1.988746, 1, 1, 1, 1, 1,
1.623695, 1.268071, 1.981738, 1, 1, 1, 1, 1,
1.632023, -0.8655629, 1.764905, 1, 1, 1, 1, 1,
1.641027, 1.716431, 0.9695549, 1, 1, 1, 1, 1,
1.648252, 1.084914, -0.3537612, 1, 1, 1, 1, 1,
1.651275, -0.1197755, 2.72998, 1, 1, 1, 1, 1,
1.654926, -0.8695571, 1.427032, 1, 1, 1, 1, 1,
1.669093, 0.3051684, 1.505148, 1, 1, 1, 1, 1,
1.715743, 2.255782, 2.696832, 1, 1, 1, 1, 1,
1.717816, 0.9114211, 0.4273387, 1, 1, 1, 1, 1,
1.749708, -0.5119376, 0.434966, 0, 0, 1, 1, 1,
1.771802, -0.461976, 3.52446, 1, 0, 0, 1, 1,
1.782861, 1.140091, 1.690097, 1, 0, 0, 1, 1,
1.791904, 2.315779, -0.750067, 1, 0, 0, 1, 1,
1.79524, 0.1929332, 2.074339, 1, 0, 0, 1, 1,
1.806396, 0.6023839, 2.005459, 1, 0, 0, 1, 1,
1.809378, 1.444114, 0.9245833, 0, 0, 0, 1, 1,
1.817974, -0.9850389, 1.477245, 0, 0, 0, 1, 1,
1.818907, -0.7771831, 2.040095, 0, 0, 0, 1, 1,
1.827384, -0.4811437, 1.780541, 0, 0, 0, 1, 1,
1.841298, 0.4237112, 0.1842935, 0, 0, 0, 1, 1,
1.843377, -0.8424351, 1.910071, 0, 0, 0, 1, 1,
1.84532, 0.213793, 0.8850397, 0, 0, 0, 1, 1,
1.862377, -1.707336, 1.815439, 1, 1, 1, 1, 1,
1.864648, 0.7286155, 2.790594, 1, 1, 1, 1, 1,
1.893726, -0.951307, 1.979885, 1, 1, 1, 1, 1,
1.896925, -1.188074, 1.930183, 1, 1, 1, 1, 1,
1.926565, 0.9357795, 1.21372, 1, 1, 1, 1, 1,
1.941931, -1.471299, 3.397075, 1, 1, 1, 1, 1,
1.969739, -0.1174786, 0.1899852, 1, 1, 1, 1, 1,
2.034618, -0.8055106, 1.628461, 1, 1, 1, 1, 1,
2.040801, -0.8536517, 3.037981, 1, 1, 1, 1, 1,
2.056311, 0.03453827, 2.256912, 1, 1, 1, 1, 1,
2.064263, -0.3275383, 2.982711, 1, 1, 1, 1, 1,
2.089611, -0.8709279, 4.452245, 1, 1, 1, 1, 1,
2.096906, 1.541899, 0.9524371, 1, 1, 1, 1, 1,
2.104036, 0.9130347, -0.215662, 1, 1, 1, 1, 1,
2.132687, -0.7253799, 3.397764, 1, 1, 1, 1, 1,
2.184428, 0.7862172, 1.538592, 0, 0, 1, 1, 1,
2.236734, 2.231329, 0.7190675, 1, 0, 0, 1, 1,
2.243249, 0.02827083, 0.4807628, 1, 0, 0, 1, 1,
2.297578, -1.424684, 2.12328, 1, 0, 0, 1, 1,
2.305474, 0.1480999, 1.821944, 1, 0, 0, 1, 1,
2.322323, -0.1365651, 0.1569365, 1, 0, 0, 1, 1,
2.3333, -0.3768073, 1.85836, 0, 0, 0, 1, 1,
2.33832, -2.09054, 1.77025, 0, 0, 0, 1, 1,
2.360222, 1.904553, 0.6828613, 0, 0, 0, 1, 1,
2.391542, 0.7550089, 1.024486, 0, 0, 0, 1, 1,
2.396634, 0.7462896, 1.59019, 0, 0, 0, 1, 1,
2.441628, -2.062366, 2.398851, 0, 0, 0, 1, 1,
2.462643, 0.5853202, 3.089519, 0, 0, 0, 1, 1,
2.50043, 1.042613, 0.1923447, 1, 1, 1, 1, 1,
2.537597, -0.16881, -0.08075825, 1, 1, 1, 1, 1,
2.646379, -0.6442797, 1.50427, 1, 1, 1, 1, 1,
2.673079, -1.342119, 3.268896, 1, 1, 1, 1, 1,
2.758728, 0.346895, 2.658106, 1, 1, 1, 1, 1,
3.169392, -0.8212371, 1.034145, 1, 1, 1, 1, 1,
3.290806, -0.3265676, 2.084277, 1, 1, 1, 1, 1
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
var radius = 9.48102;
var distance = 33.30168;
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
mvMatrix.translate( 0.05058551, 0.174283, 0.1212428 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.30168);
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
