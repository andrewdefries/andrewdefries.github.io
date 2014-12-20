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
-3.51195, -0.2383458, -1.078726, 1, 0, 0, 1,
-3.046957, 0.5070282, -1.763754, 1, 0.007843138, 0, 1,
-2.663004, 0.9592207, -1.027706, 1, 0.01176471, 0, 1,
-2.626605, -0.5145111, -1.652823, 1, 0.01960784, 0, 1,
-2.455455, -0.2095466, -3.001121, 1, 0.02352941, 0, 1,
-2.440197, 0.4824689, 0.07886475, 1, 0.03137255, 0, 1,
-2.419266, 2.058779, -1.628429, 1, 0.03529412, 0, 1,
-2.333271, 2.354622, -2.71056, 1, 0.04313726, 0, 1,
-2.267066, 3.384371, -1.374887, 1, 0.04705882, 0, 1,
-2.252016, 0.0515342, -0.8768142, 1, 0.05490196, 0, 1,
-2.223222, 0.6906844, -1.404786, 1, 0.05882353, 0, 1,
-2.213948, 1.444134, 0.620634, 1, 0.06666667, 0, 1,
-2.20287, 0.4101324, 0.6921429, 1, 0.07058824, 0, 1,
-2.183282, 0.3618751, 0.3023088, 1, 0.07843138, 0, 1,
-2.120989, 0.3095605, -1.826964, 1, 0.08235294, 0, 1,
-2.117301, 0.1197256, -0.3637546, 1, 0.09019608, 0, 1,
-2.041365, -0.4087708, -1.604313, 1, 0.09411765, 0, 1,
-2.011248, -0.6801579, -3.624115, 1, 0.1019608, 0, 1,
-1.997648, 0.8142561, -1.094204, 1, 0.1098039, 0, 1,
-1.989779, -0.1183358, -1.966847, 1, 0.1137255, 0, 1,
-1.980181, -1.192406, -1.346406, 1, 0.1215686, 0, 1,
-1.977694, -1.638703, -2.804236, 1, 0.1254902, 0, 1,
-1.975859, 0.329271, -1.507769, 1, 0.1333333, 0, 1,
-1.975678, -0.4117742, -0.6726305, 1, 0.1372549, 0, 1,
-1.936436, -1.595878, -3.281624, 1, 0.145098, 0, 1,
-1.927535, 0.7080506, -0.5724508, 1, 0.1490196, 0, 1,
-1.889533, -2.058545, -1.713528, 1, 0.1568628, 0, 1,
-1.888238, 1.288143, -1.473733, 1, 0.1607843, 0, 1,
-1.881355, -0.579187, -3.713786, 1, 0.1686275, 0, 1,
-1.876238, 1.197427, -1.552328, 1, 0.172549, 0, 1,
-1.864431, 0.06646476, -0.7888535, 1, 0.1803922, 0, 1,
-1.857667, 1.428422, -3.131667, 1, 0.1843137, 0, 1,
-1.855452, -0.00644864, -2.054665, 1, 0.1921569, 0, 1,
-1.832195, 0.4489586, -2.71228, 1, 0.1960784, 0, 1,
-1.820039, 0.829498, 1.070269, 1, 0.2039216, 0, 1,
-1.796612, 1.577855, 0.4643239, 1, 0.2117647, 0, 1,
-1.740709, 0.8415388, -0.61483, 1, 0.2156863, 0, 1,
-1.736429, -0.7319359, -2.545062, 1, 0.2235294, 0, 1,
-1.725127, -1.03398, -2.676925, 1, 0.227451, 0, 1,
-1.705628, -0.6357533, -2.062881, 1, 0.2352941, 0, 1,
-1.70027, 1.955644, 0.216262, 1, 0.2392157, 0, 1,
-1.691599, -0.8712302, -2.39274, 1, 0.2470588, 0, 1,
-1.685709, -1.882407, -2.266664, 1, 0.2509804, 0, 1,
-1.685476, 1.880596, -0.2657839, 1, 0.2588235, 0, 1,
-1.664917, -0.09790755, -0.8844016, 1, 0.2627451, 0, 1,
-1.652849, 0.5990162, -0.1124246, 1, 0.2705882, 0, 1,
-1.644045, 0.2526071, -1.69001, 1, 0.2745098, 0, 1,
-1.643535, -0.6448551, -1.120736, 1, 0.282353, 0, 1,
-1.638356, 0.820137, 0.9747126, 1, 0.2862745, 0, 1,
-1.635926, -0.8760915, -1.748667, 1, 0.2941177, 0, 1,
-1.634808, -0.7040058, -3.046556, 1, 0.3019608, 0, 1,
-1.609367, -0.570736, -0.7514597, 1, 0.3058824, 0, 1,
-1.608169, -1.117376, -2.645485, 1, 0.3137255, 0, 1,
-1.606304, 0.1605625, -0.4764005, 1, 0.3176471, 0, 1,
-1.601823, 0.3667073, -2.529575, 1, 0.3254902, 0, 1,
-1.60033, 1.273643, -1.486034, 1, 0.3294118, 0, 1,
-1.593884, 0.5546024, -0.7745401, 1, 0.3372549, 0, 1,
-1.566973, 0.7405968, -2.549616, 1, 0.3411765, 0, 1,
-1.56613, 0.5265408, -1.388903, 1, 0.3490196, 0, 1,
-1.560652, 0.04312335, -1.453593, 1, 0.3529412, 0, 1,
-1.554334, 0.03885449, -1.766213, 1, 0.3607843, 0, 1,
-1.540005, -0.4573863, -0.7697166, 1, 0.3647059, 0, 1,
-1.532263, 0.8676444, -1.291102, 1, 0.372549, 0, 1,
-1.529172, 2.236049, -0.935573, 1, 0.3764706, 0, 1,
-1.520433, 0.126246, -1.443999, 1, 0.3843137, 0, 1,
-1.51817, -1.348856, -2.256967, 1, 0.3882353, 0, 1,
-1.513269, 0.07111656, -2.645223, 1, 0.3960784, 0, 1,
-1.508968, 0.7855222, -1.294134, 1, 0.4039216, 0, 1,
-1.496914, -2.331982, -4.038927, 1, 0.4078431, 0, 1,
-1.481811, 0.755623, -0.7355407, 1, 0.4156863, 0, 1,
-1.481231, -2.878657, -2.518872, 1, 0.4196078, 0, 1,
-1.471969, -1.141901, -3.468998, 1, 0.427451, 0, 1,
-1.445499, 0.2106575, -2.536393, 1, 0.4313726, 0, 1,
-1.439358, 0.7124375, 1.166239, 1, 0.4392157, 0, 1,
-1.412777, -0.04015183, -1.227401, 1, 0.4431373, 0, 1,
-1.401184, -0.1973548, -0.3891802, 1, 0.4509804, 0, 1,
-1.400702, -0.4461181, -2.641196, 1, 0.454902, 0, 1,
-1.396181, -2.268028, -0.630918, 1, 0.4627451, 0, 1,
-1.384494, 0.4980593, -2.143054, 1, 0.4666667, 0, 1,
-1.380726, 0.2574201, -2.00272, 1, 0.4745098, 0, 1,
-1.370961, 0.7775818, -1.564074, 1, 0.4784314, 0, 1,
-1.363731, 0.6719558, -0.2261165, 1, 0.4862745, 0, 1,
-1.363603, 0.4125826, -1.718902, 1, 0.4901961, 0, 1,
-1.361958, -2.111037, -3.687351, 1, 0.4980392, 0, 1,
-1.357797, 0.940882, -0.3091722, 1, 0.5058824, 0, 1,
-1.348109, 1.696701, -1.657112, 1, 0.509804, 0, 1,
-1.347759, -0.02385074, -2.856592, 1, 0.5176471, 0, 1,
-1.344594, 0.7037808, -1.819311, 1, 0.5215687, 0, 1,
-1.336111, -1.896857, -3.937591, 1, 0.5294118, 0, 1,
-1.329741, 0.1321403, -1.387932, 1, 0.5333334, 0, 1,
-1.329219, 0.7088364, -0.0762459, 1, 0.5411765, 0, 1,
-1.328815, -0.1522263, -1.523627, 1, 0.5450981, 0, 1,
-1.325904, -1.099005, -1.416587, 1, 0.5529412, 0, 1,
-1.323734, 0.579321, 0.2569635, 1, 0.5568628, 0, 1,
-1.310267, 1.22176, -1.303925, 1, 0.5647059, 0, 1,
-1.309098, -0.5517492, -2.625598, 1, 0.5686275, 0, 1,
-1.308591, -0.1433201, -1.833426, 1, 0.5764706, 0, 1,
-1.302873, 0.3297123, -2.368825, 1, 0.5803922, 0, 1,
-1.30098, -0.9672564, -1.721951, 1, 0.5882353, 0, 1,
-1.299299, -0.5421686, 0.2362958, 1, 0.5921569, 0, 1,
-1.294203, 1.221524, -1.110867, 1, 0.6, 0, 1,
-1.290017, 0.2044858, -1.779462, 1, 0.6078432, 0, 1,
-1.288372, 0.5179262, -0.7858104, 1, 0.6117647, 0, 1,
-1.272252, -0.4112269, -2.944263, 1, 0.6196079, 0, 1,
-1.264636, 0.6482287, 0.03000676, 1, 0.6235294, 0, 1,
-1.256433, 1.200865, -1.283662, 1, 0.6313726, 0, 1,
-1.25373, 0.2114099, -3.071011, 1, 0.6352941, 0, 1,
-1.253438, -0.2520327, -2.171208, 1, 0.6431373, 0, 1,
-1.249776, 0.4409789, -1.69683, 1, 0.6470588, 0, 1,
-1.248536, 0.2173498, -2.056375, 1, 0.654902, 0, 1,
-1.242935, 1.174474, -1.500923, 1, 0.6588235, 0, 1,
-1.239956, 0.1680797, -2.764369, 1, 0.6666667, 0, 1,
-1.235861, -1.334152, -1.766635, 1, 0.6705883, 0, 1,
-1.233968, 2.354911, 0.1298157, 1, 0.6784314, 0, 1,
-1.233275, -1.071346, -2.178873, 1, 0.682353, 0, 1,
-1.229759, 0.8580341, -3.197657, 1, 0.6901961, 0, 1,
-1.225167, 1.519786, -0.6055095, 1, 0.6941177, 0, 1,
-1.223878, 0.2094071, -0.7671649, 1, 0.7019608, 0, 1,
-1.217895, -2.085091, -2.375412, 1, 0.7098039, 0, 1,
-1.217083, -1.926434, -2.408314, 1, 0.7137255, 0, 1,
-1.199786, -0.3523046, -3.389216, 1, 0.7215686, 0, 1,
-1.196644, -0.6654769, -2.207281, 1, 0.7254902, 0, 1,
-1.195392, 1.269288, -0.7021679, 1, 0.7333333, 0, 1,
-1.192161, 0.6088523, -0.5063962, 1, 0.7372549, 0, 1,
-1.186914, 2.486125, 0.04842642, 1, 0.7450981, 0, 1,
-1.181801, -1.557648, -2.137127, 1, 0.7490196, 0, 1,
-1.178598, -1.203727, -3.865082, 1, 0.7568628, 0, 1,
-1.173846, -0.4517844, -3.242868, 1, 0.7607843, 0, 1,
-1.170989, -2.110641, -4.306753, 1, 0.7686275, 0, 1,
-1.170973, -0.09517395, -0.5481889, 1, 0.772549, 0, 1,
-1.167921, -1.800806, -1.450609, 1, 0.7803922, 0, 1,
-1.166396, -1.9114, -3.819479, 1, 0.7843137, 0, 1,
-1.164068, -1.010404, -3.321779, 1, 0.7921569, 0, 1,
-1.163131, 0.7523844, 0.6540694, 1, 0.7960784, 0, 1,
-1.162734, 0.008777821, -1.275474, 1, 0.8039216, 0, 1,
-1.149567, 0.04487307, -1.859987, 1, 0.8117647, 0, 1,
-1.13983, -0.7830359, -1.388404, 1, 0.8156863, 0, 1,
-1.132801, -1.692122, -2.900939, 1, 0.8235294, 0, 1,
-1.125517, -0.4634549, -1.538346, 1, 0.827451, 0, 1,
-1.124648, -2.167014, -3.182084, 1, 0.8352941, 0, 1,
-1.1193, 1.085088, -0.02642571, 1, 0.8392157, 0, 1,
-1.116098, -2.867024, -3.68776, 1, 0.8470588, 0, 1,
-1.116022, 0.3995525, -0.8847197, 1, 0.8509804, 0, 1,
-1.115297, -0.07189163, -1.383248, 1, 0.8588235, 0, 1,
-1.112699, 0.0714749, -1.798009, 1, 0.8627451, 0, 1,
-1.103804, 0.5307052, -0.6225036, 1, 0.8705882, 0, 1,
-1.099548, 1.639501, 0.3244893, 1, 0.8745098, 0, 1,
-1.099524, -0.3632672, -1.677651, 1, 0.8823529, 0, 1,
-1.097658, 0.3787314, -2.168671, 1, 0.8862745, 0, 1,
-1.094489, 0.7458948, -1.224188, 1, 0.8941177, 0, 1,
-1.087206, -0.4025013, -0.6979611, 1, 0.8980392, 0, 1,
-1.086248, 0.8966702, -1.358222, 1, 0.9058824, 0, 1,
-1.071054, 1.153035, -2.42367, 1, 0.9137255, 0, 1,
-1.066449, 0.3928411, -1.040837, 1, 0.9176471, 0, 1,
-1.063729, 0.3643944, -1.379655, 1, 0.9254902, 0, 1,
-1.06367, -0.6425693, -3.292128, 1, 0.9294118, 0, 1,
-1.051602, -0.3625118, -0.7768698, 1, 0.9372549, 0, 1,
-1.045344, 1.62848, 0.9268524, 1, 0.9411765, 0, 1,
-1.036667, 0.08672584, -1.532433, 1, 0.9490196, 0, 1,
-1.024937, 0.2945441, -0.9601899, 1, 0.9529412, 0, 1,
-1.021031, 1.35403, -0.3023981, 1, 0.9607843, 0, 1,
-1.020223, -0.7940805, -2.78775, 1, 0.9647059, 0, 1,
-1.018327, 0.5931458, -1.449062, 1, 0.972549, 0, 1,
-1.014247, -0.621591, -1.714051, 1, 0.9764706, 0, 1,
-1.011478, 0.3537464, 0.8278, 1, 0.9843137, 0, 1,
-1.001318, -0.8835523, -3.371671, 1, 0.9882353, 0, 1,
-0.9974604, -0.3291038, -1.277607, 1, 0.9960784, 0, 1,
-0.994516, 0.7483303, -0.1500747, 0.9960784, 1, 0, 1,
-0.9934034, -0.4427389, -2.715892, 0.9921569, 1, 0, 1,
-0.9932649, -0.3515666, -0.3292727, 0.9843137, 1, 0, 1,
-0.9908435, 1.805427, -0.5544155, 0.9803922, 1, 0, 1,
-0.9903621, 2.941991, -0.8640956, 0.972549, 1, 0, 1,
-0.982985, 1.430092, -0.7556823, 0.9686275, 1, 0, 1,
-0.9708181, -0.4087038, -0.5846773, 0.9607843, 1, 0, 1,
-0.9663985, -0.2274151, -0.6814358, 0.9568627, 1, 0, 1,
-0.9637649, -0.1386964, -1.430694, 0.9490196, 1, 0, 1,
-0.9612575, 0.872731, -0.4772393, 0.945098, 1, 0, 1,
-0.9480942, 1.486935, -1.207385, 0.9372549, 1, 0, 1,
-0.9436476, 1.219148, -0.07339308, 0.9333333, 1, 0, 1,
-0.9431524, -1.918692, -3.050519, 0.9254902, 1, 0, 1,
-0.9430707, -0.8165463, -2.575271, 0.9215686, 1, 0, 1,
-0.9418251, -0.9743291, -1.776083, 0.9137255, 1, 0, 1,
-0.9388275, -0.6823825, -1.602134, 0.9098039, 1, 0, 1,
-0.9348261, -0.605338, -2.347556, 0.9019608, 1, 0, 1,
-0.9344189, -0.2806287, -0.8409161, 0.8941177, 1, 0, 1,
-0.9280664, 1.941798, -0.4046708, 0.8901961, 1, 0, 1,
-0.9273183, -1.362608, -3.654613, 0.8823529, 1, 0, 1,
-0.9256966, -1.162049, -3.734746, 0.8784314, 1, 0, 1,
-0.921977, 1.126785, -1.961168, 0.8705882, 1, 0, 1,
-0.9214901, -1.281139, -4.235379, 0.8666667, 1, 0, 1,
-0.9108111, 0.6259729, -2.249704, 0.8588235, 1, 0, 1,
-0.9106096, 0.7845809, -0.8975567, 0.854902, 1, 0, 1,
-0.9104491, -0.6430833, -2.645527, 0.8470588, 1, 0, 1,
-0.9070526, 0.05908572, -1.149615, 0.8431373, 1, 0, 1,
-0.9022899, -1.29609, -1.537388, 0.8352941, 1, 0, 1,
-0.8983054, -1.048877, -2.35297, 0.8313726, 1, 0, 1,
-0.8968948, -0.3709488, -2.360649, 0.8235294, 1, 0, 1,
-0.8958083, 1.587983, -0.1414349, 0.8196079, 1, 0, 1,
-0.8915066, 0.7447725, -1.760921, 0.8117647, 1, 0, 1,
-0.8870823, -0.923331, -2.301149, 0.8078431, 1, 0, 1,
-0.8820585, -1.026474, -3.979472, 0.8, 1, 0, 1,
-0.8782314, -0.007433631, -1.669723, 0.7921569, 1, 0, 1,
-0.8723698, 0.3124506, -1.38042, 0.7882353, 1, 0, 1,
-0.87222, -1.209081, -1.151506, 0.7803922, 1, 0, 1,
-0.8710049, -1.909149, -2.324391, 0.7764706, 1, 0, 1,
-0.8704668, -0.9552476, -2.732702, 0.7686275, 1, 0, 1,
-0.8669236, 0.8621722, 0.6057714, 0.7647059, 1, 0, 1,
-0.8536361, -0.8400776, -3.74719, 0.7568628, 1, 0, 1,
-0.8464249, -0.04783195, -1.311108, 0.7529412, 1, 0, 1,
-0.8314991, -1.283425, -2.686961, 0.7450981, 1, 0, 1,
-0.830028, -0.3202744, -1.403177, 0.7411765, 1, 0, 1,
-0.8278505, -0.3665812, -1.302421, 0.7333333, 1, 0, 1,
-0.8253422, 1.168159, 0.04421053, 0.7294118, 1, 0, 1,
-0.820283, 2.066281, 0.3440608, 0.7215686, 1, 0, 1,
-0.8113948, -1.54124, -2.840342, 0.7176471, 1, 0, 1,
-0.8075894, -0.2171153, -2.068336, 0.7098039, 1, 0, 1,
-0.8020789, 2.045784, -1.290768, 0.7058824, 1, 0, 1,
-0.7990533, 0.1094359, 0.7602639, 0.6980392, 1, 0, 1,
-0.7918006, 1.178481, 0.7243075, 0.6901961, 1, 0, 1,
-0.7882909, -1.480417, -3.154604, 0.6862745, 1, 0, 1,
-0.7872841, -0.4587311, -1.447594, 0.6784314, 1, 0, 1,
-0.7847804, 0.8313038, -0.3966487, 0.6745098, 1, 0, 1,
-0.7794704, -2.761346, -3.82349, 0.6666667, 1, 0, 1,
-0.7771088, 1.287694, -0.1010916, 0.6627451, 1, 0, 1,
-0.7762872, -1.575235, -1.624007, 0.654902, 1, 0, 1,
-0.7680103, 0.741508, -0.6772081, 0.6509804, 1, 0, 1,
-0.7667326, -1.616908, -2.840686, 0.6431373, 1, 0, 1,
-0.765631, -0.02393825, -1.883208, 0.6392157, 1, 0, 1,
-0.7655157, 1.172224, 0.2731651, 0.6313726, 1, 0, 1,
-0.7646343, 0.829901, -1.978411, 0.627451, 1, 0, 1,
-0.7640577, -0.2306394, -2.052485, 0.6196079, 1, 0, 1,
-0.7550068, 1.194368, -0.3661047, 0.6156863, 1, 0, 1,
-0.7535891, 1.744013, -0.6348345, 0.6078432, 1, 0, 1,
-0.7502028, 0.009096985, -1.627274, 0.6039216, 1, 0, 1,
-0.7501859, 0.9622618, -2.616202, 0.5960785, 1, 0, 1,
-0.7466656, 1.178525, 1.056211, 0.5882353, 1, 0, 1,
-0.7384489, 0.2210074, -1.098414, 0.5843138, 1, 0, 1,
-0.737705, -0.7127053, -0.1505105, 0.5764706, 1, 0, 1,
-0.7337119, -0.7152334, -1.637072, 0.572549, 1, 0, 1,
-0.7320144, 0.08905085, -1.929035, 0.5647059, 1, 0, 1,
-0.7294037, -1.719756, -3.104138, 0.5607843, 1, 0, 1,
-0.7293052, 1.2626, -0.3219448, 0.5529412, 1, 0, 1,
-0.7291806, 0.6433574, 1.818176, 0.5490196, 1, 0, 1,
-0.7271953, 1.361423, 0.01914705, 0.5411765, 1, 0, 1,
-0.7267293, -1.297273, -3.692257, 0.5372549, 1, 0, 1,
-0.725562, 0.772424, -0.9677019, 0.5294118, 1, 0, 1,
-0.7241163, 0.7491628, -1.284467, 0.5254902, 1, 0, 1,
-0.7212489, -0.9530265, -1.991553, 0.5176471, 1, 0, 1,
-0.71662, -1.463487, -4.221292, 0.5137255, 1, 0, 1,
-0.7160097, -0.97207, -1.197076, 0.5058824, 1, 0, 1,
-0.7151341, -0.2935911, -2.405557, 0.5019608, 1, 0, 1,
-0.7142874, 0.6053448, -0.6953788, 0.4941176, 1, 0, 1,
-0.7099715, -1.134483, -3.650236, 0.4862745, 1, 0, 1,
-0.706597, -0.1498476, -3.739285, 0.4823529, 1, 0, 1,
-0.705691, 0.6530187, 0.3788733, 0.4745098, 1, 0, 1,
-0.7019103, 0.4805263, -1.410631, 0.4705882, 1, 0, 1,
-0.6978986, 0.09889319, -4.367638, 0.4627451, 1, 0, 1,
-0.6945147, 0.9325586, -2.425677, 0.4588235, 1, 0, 1,
-0.6920484, -0.6806148, -2.661381, 0.4509804, 1, 0, 1,
-0.6904619, 1.322935, -0.2619905, 0.4470588, 1, 0, 1,
-0.6857665, -0.8157822, -2.341021, 0.4392157, 1, 0, 1,
-0.6848208, -0.1320303, -1.456611, 0.4352941, 1, 0, 1,
-0.6829264, -0.06328704, -1.897595, 0.427451, 1, 0, 1,
-0.6804373, -1.454559, -1.615893, 0.4235294, 1, 0, 1,
-0.6787992, -0.3327344, -2.940019, 0.4156863, 1, 0, 1,
-0.6776434, 0.9174067, 0.03941425, 0.4117647, 1, 0, 1,
-0.6711307, -1.047012, -3.98818, 0.4039216, 1, 0, 1,
-0.6535277, -0.9394289, -2.439934, 0.3960784, 1, 0, 1,
-0.6527127, 1.343912, 0.6045395, 0.3921569, 1, 0, 1,
-0.650722, 0.6848126, -1.418497, 0.3843137, 1, 0, 1,
-0.650616, -2.447823, -2.238894, 0.3803922, 1, 0, 1,
-0.6488738, -0.4864053, -2.683388, 0.372549, 1, 0, 1,
-0.6480855, -2.261723, -3.471453, 0.3686275, 1, 0, 1,
-0.6447752, -1.168798, -2.217697, 0.3607843, 1, 0, 1,
-0.6358123, -0.8847821, -1.358594, 0.3568628, 1, 0, 1,
-0.6356295, 0.8455615, -2.127857, 0.3490196, 1, 0, 1,
-0.6351398, -2.006267, -0.6871812, 0.345098, 1, 0, 1,
-0.6332181, 0.5536145, -0.7797498, 0.3372549, 1, 0, 1,
-0.6265959, -0.3931366, -3.950099, 0.3333333, 1, 0, 1,
-0.6257452, -0.1340642, -3.109867, 0.3254902, 1, 0, 1,
-0.6238309, 1.369631, 0.07615579, 0.3215686, 1, 0, 1,
-0.6206983, 0.7504544, -1.637998, 0.3137255, 1, 0, 1,
-0.6203375, -1.183136, -3.101079, 0.3098039, 1, 0, 1,
-0.619939, 0.8310338, -0.5162041, 0.3019608, 1, 0, 1,
-0.6180059, 0.2151059, 0.1627994, 0.2941177, 1, 0, 1,
-0.6167707, 0.3057175, -0.8553066, 0.2901961, 1, 0, 1,
-0.616506, -1.668415, -1.160782, 0.282353, 1, 0, 1,
-0.6155346, -1.86584, -1.342069, 0.2784314, 1, 0, 1,
-0.6118946, -0.6873215, -3.018362, 0.2705882, 1, 0, 1,
-0.604544, -0.9286312, -2.78053, 0.2666667, 1, 0, 1,
-0.6024039, 2.251544, 0.09685352, 0.2588235, 1, 0, 1,
-0.597464, 1.584136, 0.09987175, 0.254902, 1, 0, 1,
-0.5971699, -0.2399659, -1.501789, 0.2470588, 1, 0, 1,
-0.5927439, -0.5287494, -2.409991, 0.2431373, 1, 0, 1,
-0.5850173, 0.2997231, -0.2325053, 0.2352941, 1, 0, 1,
-0.5801532, -0.2342991, -3.465251, 0.2313726, 1, 0, 1,
-0.5769866, 0.5183685, -1.260018, 0.2235294, 1, 0, 1,
-0.5760561, 1.644601, 0.003129336, 0.2196078, 1, 0, 1,
-0.5715652, 0.4889079, -0.1114368, 0.2117647, 1, 0, 1,
-0.5688139, -1.635994, -2.639833, 0.2078431, 1, 0, 1,
-0.5668014, 0.5516114, 0.488607, 0.2, 1, 0, 1,
-0.5667163, -0.6107158, -0.8189284, 0.1921569, 1, 0, 1,
-0.565444, 0.8098816, -2.300984, 0.1882353, 1, 0, 1,
-0.5593659, -0.5519023, -2.133336, 0.1803922, 1, 0, 1,
-0.5580238, 1.323182, -0.3228606, 0.1764706, 1, 0, 1,
-0.5499284, -1.341633, -2.259729, 0.1686275, 1, 0, 1,
-0.5484217, -0.4357158, -0.4693392, 0.1647059, 1, 0, 1,
-0.5470951, 1.066134, -0.3986832, 0.1568628, 1, 0, 1,
-0.5463556, 0.3395711, -2.434711, 0.1529412, 1, 0, 1,
-0.5438238, 1.366563, -0.1908412, 0.145098, 1, 0, 1,
-0.5412719, 0.6810234, -0.127993, 0.1411765, 1, 0, 1,
-0.5405543, 1.02432, -1.585007, 0.1333333, 1, 0, 1,
-0.5381846, 0.857098, -1.663868, 0.1294118, 1, 0, 1,
-0.5360013, -0.5211033, -1.603913, 0.1215686, 1, 0, 1,
-0.533749, -0.5530077, -4.029619, 0.1176471, 1, 0, 1,
-0.5332372, 0.2177763, -2.598963, 0.1098039, 1, 0, 1,
-0.5311575, 1.793898, -0.5820528, 0.1058824, 1, 0, 1,
-0.5276074, 1.346718, -0.3851405, 0.09803922, 1, 0, 1,
-0.5250986, 2.263269, -0.4458972, 0.09019608, 1, 0, 1,
-0.5204033, 1.1151, -1.70313, 0.08627451, 1, 0, 1,
-0.5186313, -1.158098, -2.952801, 0.07843138, 1, 0, 1,
-0.5163656, 1.374753, -1.52484, 0.07450981, 1, 0, 1,
-0.5155421, -2.043216, -2.346243, 0.06666667, 1, 0, 1,
-0.5128761, -0.06918472, -0.2283359, 0.0627451, 1, 0, 1,
-0.5128246, -0.3234628, -3.691422, 0.05490196, 1, 0, 1,
-0.5108103, -0.3792076, -2.94813, 0.05098039, 1, 0, 1,
-0.5076573, -1.007818, -4.29727, 0.04313726, 1, 0, 1,
-0.5067522, -0.7999449, -2.775535, 0.03921569, 1, 0, 1,
-0.4978091, 0.9708493, 0.5099555, 0.03137255, 1, 0, 1,
-0.4972962, 1.749037, -0.4806142, 0.02745098, 1, 0, 1,
-0.4932818, 1.022651, 0.8457604, 0.01960784, 1, 0, 1,
-0.4914695, -0.4486582, -0.417271, 0.01568628, 1, 0, 1,
-0.4914635, -2.018197, -1.451297, 0.007843138, 1, 0, 1,
-0.4764484, -1.291662, -1.551701, 0.003921569, 1, 0, 1,
-0.4760849, 0.2283986, -1.678417, 0, 1, 0.003921569, 1,
-0.4759997, 0.02081074, -1.432953, 0, 1, 0.01176471, 1,
-0.4711787, -0.1081436, -2.366988, 0, 1, 0.01568628, 1,
-0.4699662, 1.913719, 0.6787984, 0, 1, 0.02352941, 1,
-0.466954, -1.609017, -2.96969, 0, 1, 0.02745098, 1,
-0.465019, -1.23183, -3.529284, 0, 1, 0.03529412, 1,
-0.4610362, -0.4170369, -0.5803206, 0, 1, 0.03921569, 1,
-0.4593205, 0.1760141, -0.7792113, 0, 1, 0.04705882, 1,
-0.4586205, -0.8186642, -2.427825, 0, 1, 0.05098039, 1,
-0.4564674, -0.3595526, -3.248414, 0, 1, 0.05882353, 1,
-0.4561917, -0.1473927, -2.716341, 0, 1, 0.0627451, 1,
-0.4558413, 1.098295, -1.231986, 0, 1, 0.07058824, 1,
-0.4509389, -0.5171894, -3.094557, 0, 1, 0.07450981, 1,
-0.4481352, 0.6511713, -0.8069953, 0, 1, 0.08235294, 1,
-0.4462592, -1.582734, -3.285764, 0, 1, 0.08627451, 1,
-0.4417855, 2.002679, 0.3271112, 0, 1, 0.09411765, 1,
-0.4412535, 0.4298212, -1.558054, 0, 1, 0.1019608, 1,
-0.4399391, -0.1269546, -1.114174, 0, 1, 0.1058824, 1,
-0.4390712, -0.1790737, -3.837452, 0, 1, 0.1137255, 1,
-0.4381476, 0.9329841, 1.208026, 0, 1, 0.1176471, 1,
-0.4371599, -0.341876, -2.133566, 0, 1, 0.1254902, 1,
-0.4333571, 1.038358, -1.559962, 0, 1, 0.1294118, 1,
-0.4312959, 1.264475, -0.5844783, 0, 1, 0.1372549, 1,
-0.4304736, -0.1192958, -0.9757789, 0, 1, 0.1411765, 1,
-0.4300561, 0.8109536, -0.461661, 0, 1, 0.1490196, 1,
-0.4300479, -1.576773, -3.85587, 0, 1, 0.1529412, 1,
-0.4277461, -1.459445, -4.513572, 0, 1, 0.1607843, 1,
-0.4224376, -1.73956, -3.0801, 0, 1, 0.1647059, 1,
-0.4145898, 1.341991, 1.322495, 0, 1, 0.172549, 1,
-0.4087787, -1.847973, -3.61233, 0, 1, 0.1764706, 1,
-0.406213, 1.389781, -0.05212935, 0, 1, 0.1843137, 1,
-0.405944, -1.07265, -3.331455, 0, 1, 0.1882353, 1,
-0.4054373, -0.4027579, -3.031021, 0, 1, 0.1960784, 1,
-0.4010147, 1.490085, -1.24369, 0, 1, 0.2039216, 1,
-0.4004573, 0.1076123, -2.181458, 0, 1, 0.2078431, 1,
-0.3949513, 0.7139784, 1.196976, 0, 1, 0.2156863, 1,
-0.3938358, -0.3854952, -3.482134, 0, 1, 0.2196078, 1,
-0.3923535, -0.1257565, -1.498647, 0, 1, 0.227451, 1,
-0.3872474, -0.3438872, -3.286714, 0, 1, 0.2313726, 1,
-0.3851085, 0.3787895, -1.139341, 0, 1, 0.2392157, 1,
-0.3819813, -0.9538152, -1.502127, 0, 1, 0.2431373, 1,
-0.3807817, -0.1995445, -0.3489521, 0, 1, 0.2509804, 1,
-0.3797858, 0.2038451, -1.257136, 0, 1, 0.254902, 1,
-0.3795358, -0.2210339, -1.896213, 0, 1, 0.2627451, 1,
-0.3754649, -0.8160189, -2.18799, 0, 1, 0.2666667, 1,
-0.373749, 0.1140483, -3.409148, 0, 1, 0.2745098, 1,
-0.3661976, -1.465344, -1.790675, 0, 1, 0.2784314, 1,
-0.3658395, -1.252528, -2.678931, 0, 1, 0.2862745, 1,
-0.3587377, -1.24994, -2.99276, 0, 1, 0.2901961, 1,
-0.356786, -1.228861, -1.941375, 0, 1, 0.2980392, 1,
-0.3549545, -0.4565721, -2.243464, 0, 1, 0.3058824, 1,
-0.3479039, -0.6778784, -2.551639, 0, 1, 0.3098039, 1,
-0.3460373, 1.155385, 1.264552, 0, 1, 0.3176471, 1,
-0.3413606, -1.918396, -2.704747, 0, 1, 0.3215686, 1,
-0.3406568, 0.3703924, -1.021369, 0, 1, 0.3294118, 1,
-0.3392446, -0.9485288, -1.167861, 0, 1, 0.3333333, 1,
-0.3385141, -1.124623, -3.214326, 0, 1, 0.3411765, 1,
-0.3376235, 1.949914, -0.203725, 0, 1, 0.345098, 1,
-0.3374382, 1.158966, 0.8498873, 0, 1, 0.3529412, 1,
-0.3365051, -0.4746537, -1.845966, 0, 1, 0.3568628, 1,
-0.3356698, -0.1330618, -1.088119, 0, 1, 0.3647059, 1,
-0.3345368, 0.1915801, -1.149524, 0, 1, 0.3686275, 1,
-0.3258633, -0.4401171, -3.341652, 0, 1, 0.3764706, 1,
-0.3242325, 1.148687, 0.5831012, 0, 1, 0.3803922, 1,
-0.3226966, -0.2982309, -1.037177, 0, 1, 0.3882353, 1,
-0.321236, -0.7492323, -2.105655, 0, 1, 0.3921569, 1,
-0.3209683, 0.5731493, 1.027745, 0, 1, 0.4, 1,
-0.3195428, -0.3027672, -4.34239, 0, 1, 0.4078431, 1,
-0.3184115, 0.7807236, -0.5012448, 0, 1, 0.4117647, 1,
-0.3180221, -0.8649944, -1.239719, 0, 1, 0.4196078, 1,
-0.3139193, 0.6741792, -0.551049, 0, 1, 0.4235294, 1,
-0.3138397, -0.2339418, -2.815078, 0, 1, 0.4313726, 1,
-0.3082969, -0.4476023, -3.705453, 0, 1, 0.4352941, 1,
-0.303088, -0.8740857, -3.429864, 0, 1, 0.4431373, 1,
-0.302803, -1.100402, -3.378868, 0, 1, 0.4470588, 1,
-0.3012604, -1.313545, -1.634463, 0, 1, 0.454902, 1,
-0.2960188, 0.137677, -1.405018, 0, 1, 0.4588235, 1,
-0.2959387, -1.105991, -3.465191, 0, 1, 0.4666667, 1,
-0.2930304, -0.7455356, -2.508765, 0, 1, 0.4705882, 1,
-0.291031, -0.9957129, -3.008708, 0, 1, 0.4784314, 1,
-0.2897888, 0.06088087, -1.348603, 0, 1, 0.4823529, 1,
-0.2891507, -1.022892, -2.057102, 0, 1, 0.4901961, 1,
-0.2847308, -2.229796, -1.249894, 0, 1, 0.4941176, 1,
-0.2841623, -0.8136668, -3.469268, 0, 1, 0.5019608, 1,
-0.2827092, -0.254291, -2.616896, 0, 1, 0.509804, 1,
-0.282468, 1.940677, -0.8187979, 0, 1, 0.5137255, 1,
-0.2816056, -0.1891201, -3.162724, 0, 1, 0.5215687, 1,
-0.2740236, -0.3822334, -2.464386, 0, 1, 0.5254902, 1,
-0.2724528, 1.580052, 1.113414, 0, 1, 0.5333334, 1,
-0.2703585, 0.86979, 0.5752677, 0, 1, 0.5372549, 1,
-0.2669567, -1.146555, -2.881874, 0, 1, 0.5450981, 1,
-0.2664311, 0.6816436, -0.3812068, 0, 1, 0.5490196, 1,
-0.2653389, 0.9432007, -0.296373, 0, 1, 0.5568628, 1,
-0.2643369, 1.908576, -0.3834611, 0, 1, 0.5607843, 1,
-0.2593905, 1.013473, -0.6064043, 0, 1, 0.5686275, 1,
-0.253181, -0.05945647, -2.079396, 0, 1, 0.572549, 1,
-0.2508955, -2.672964, -3.321584, 0, 1, 0.5803922, 1,
-0.242408, -0.9653296, -3.814112, 0, 1, 0.5843138, 1,
-0.2396102, -0.07141745, -1.439502, 0, 1, 0.5921569, 1,
-0.2374684, 1.149999, -1.245683, 0, 1, 0.5960785, 1,
-0.2350275, -0.0320222, -2.208174, 0, 1, 0.6039216, 1,
-0.2315482, 0.6061945, -0.7325723, 0, 1, 0.6117647, 1,
-0.2260459, -1.16649, -2.515441, 0, 1, 0.6156863, 1,
-0.2247388, 0.7125624, -0.4901279, 0, 1, 0.6235294, 1,
-0.2206276, -0.2218751, -3.482837, 0, 1, 0.627451, 1,
-0.2195847, 0.6989339, -0.108115, 0, 1, 0.6352941, 1,
-0.219528, 0.8229709, 0.3115761, 0, 1, 0.6392157, 1,
-0.2155032, -0.008446358, -2.73576, 0, 1, 0.6470588, 1,
-0.2154912, -0.739376, -3.644041, 0, 1, 0.6509804, 1,
-0.2114328, 0.01269745, -0.3276138, 0, 1, 0.6588235, 1,
-0.2099274, -0.4014272, -2.903814, 0, 1, 0.6627451, 1,
-0.2052246, -0.3806489, -4.994757, 0, 1, 0.6705883, 1,
-0.2051145, -0.7625185, -2.994468, 0, 1, 0.6745098, 1,
-0.20265, -0.1589704, -2.680877, 0, 1, 0.682353, 1,
-0.1957781, -1.960823, -4.218213, 0, 1, 0.6862745, 1,
-0.1952841, 0.7078233, 0.9870495, 0, 1, 0.6941177, 1,
-0.1929731, 0.2060206, -3.303161, 0, 1, 0.7019608, 1,
-0.1925035, -0.2580988, -0.902038, 0, 1, 0.7058824, 1,
-0.1887372, -0.6774225, -1.88558, 0, 1, 0.7137255, 1,
-0.1867108, 1.362767, -0.6692863, 0, 1, 0.7176471, 1,
-0.1861503, 0.5332555, -0.4064021, 0, 1, 0.7254902, 1,
-0.185946, 0.9990363, 0.274781, 0, 1, 0.7294118, 1,
-0.1817931, -1.739611, -3.466898, 0, 1, 0.7372549, 1,
-0.1795683, -1.287593, -4.112723, 0, 1, 0.7411765, 1,
-0.1772707, -0.7718417, -3.566085, 0, 1, 0.7490196, 1,
-0.177043, -0.6513181, -2.772086, 0, 1, 0.7529412, 1,
-0.1723399, -0.3423266, -3.174021, 0, 1, 0.7607843, 1,
-0.1690677, 0.4557285, -0.3358267, 0, 1, 0.7647059, 1,
-0.1682491, 1.179086, 0.2792484, 0, 1, 0.772549, 1,
-0.1638029, 1.077604, -1.17282, 0, 1, 0.7764706, 1,
-0.1636011, -0.5609641, -3.776292, 0, 1, 0.7843137, 1,
-0.1623213, -0.4017277, -1.784482, 0, 1, 0.7882353, 1,
-0.160591, -0.9365299, -3.406265, 0, 1, 0.7960784, 1,
-0.1570255, -0.02022379, -0.8955787, 0, 1, 0.8039216, 1,
-0.1569705, 0.007516957, -1.5846, 0, 1, 0.8078431, 1,
-0.1567806, -0.324278, -2.580446, 0, 1, 0.8156863, 1,
-0.1531205, 1.07404, -0.6828808, 0, 1, 0.8196079, 1,
-0.1517321, 0.4940827, -0.5629468, 0, 1, 0.827451, 1,
-0.147694, -0.03481492, -0.5262489, 0, 1, 0.8313726, 1,
-0.1461199, 0.08824186, 0.1639877, 0, 1, 0.8392157, 1,
-0.1452698, 0.9170526, -1.080337, 0, 1, 0.8431373, 1,
-0.1422589, 1.153057, -0.7729417, 0, 1, 0.8509804, 1,
-0.1409244, 0.9984861, 0.2438259, 0, 1, 0.854902, 1,
-0.1361515, 0.2671441, -1.427338, 0, 1, 0.8627451, 1,
-0.1349365, -0.4020873, -1.596523, 0, 1, 0.8666667, 1,
-0.1314696, 1.611651, 0.3291073, 0, 1, 0.8745098, 1,
-0.1207361, -1.368824, -3.206978, 0, 1, 0.8784314, 1,
-0.1162204, -0.3775986, -2.205699, 0, 1, 0.8862745, 1,
-0.1140186, 0.6445873, -0.03759206, 0, 1, 0.8901961, 1,
-0.1129406, 0.9130977, 0.02782468, 0, 1, 0.8980392, 1,
-0.1103234, 1.34292, -0.7976786, 0, 1, 0.9058824, 1,
-0.1098306, -0.9869337, -1.609234, 0, 1, 0.9098039, 1,
-0.1008001, 1.156141, 0.2621924, 0, 1, 0.9176471, 1,
-0.09950649, 1.951904, -1.815586, 0, 1, 0.9215686, 1,
-0.09700278, -1.491008, -2.995976, 0, 1, 0.9294118, 1,
-0.08961833, -0.4930279, -2.576495, 0, 1, 0.9333333, 1,
-0.08895838, 0.9638926, 0.636948, 0, 1, 0.9411765, 1,
-0.08448657, 0.05500243, -2.948121, 0, 1, 0.945098, 1,
-0.08053887, 0.2924927, -0.103963, 0, 1, 0.9529412, 1,
-0.07460507, 0.8171727, 0.03378479, 0, 1, 0.9568627, 1,
-0.06345697, 1.000374, 0.5259933, 0, 1, 0.9647059, 1,
-0.06057608, -0.02581838, -1.640599, 0, 1, 0.9686275, 1,
-0.05764365, -0.273526, -3.976597, 0, 1, 0.9764706, 1,
-0.05668949, 0.7112259, 0.9919696, 0, 1, 0.9803922, 1,
-0.05610103, 1.113409, -0.5532181, 0, 1, 0.9882353, 1,
-0.05252013, 0.6755072, -0.2233147, 0, 1, 0.9921569, 1,
-0.04878897, -0.2879927, -2.60467, 0, 1, 1, 1,
-0.04287746, -0.4906408, -4.271086, 0, 0.9921569, 1, 1,
-0.04195854, 0.7607718, 0.6233606, 0, 0.9882353, 1, 1,
-0.04155713, -0.4822137, -4.375525, 0, 0.9803922, 1, 1,
-0.033698, 2.024213, -1.419607, 0, 0.9764706, 1, 1,
-0.03277415, -1.689108, -2.684982, 0, 0.9686275, 1, 1,
-0.03016631, 0.2917717, -1.853024, 0, 0.9647059, 1, 1,
-0.02965971, 0.7341072, 0.2851999, 0, 0.9568627, 1, 1,
-0.02636916, -0.02935397, -0.6715589, 0, 0.9529412, 1, 1,
-0.02556508, 1.232063, 3.075461, 0, 0.945098, 1, 1,
-0.02461082, -1.076192, -4.181257, 0, 0.9411765, 1, 1,
-0.02262249, -1.218914, -3.336734, 0, 0.9333333, 1, 1,
-0.02252032, -0.3332526, -2.522201, 0, 0.9294118, 1, 1,
-0.01303587, -0.2100735, -1.733671, 0, 0.9215686, 1, 1,
-0.01089695, 0.4671994, 0.7172644, 0, 0.9176471, 1, 1,
-0.008111634, -0.04856887, -2.684307, 0, 0.9098039, 1, 1,
-0.007276297, 0.02193834, 0.6175812, 0, 0.9058824, 1, 1,
-0.004701657, -0.1425022, -2.773269, 0, 0.8980392, 1, 1,
-0.002789506, 0.3688643, 0.257915, 0, 0.8901961, 1, 1,
-0.001496904, -0.8235799, -2.475738, 0, 0.8862745, 1, 1,
0.001745647, -0.7259755, 1.898311, 0, 0.8784314, 1, 1,
0.007861294, -0.8363473, 4.882618, 0, 0.8745098, 1, 1,
0.008838194, -0.8170581, 4.060745, 0, 0.8666667, 1, 1,
0.01150581, -1.692322, 2.876348, 0, 0.8627451, 1, 1,
0.01151822, 1.034219, 0.7759768, 0, 0.854902, 1, 1,
0.01239333, 1.160373, 1.570339, 0, 0.8509804, 1, 1,
0.01344399, -0.2098469, 3.819923, 0, 0.8431373, 1, 1,
0.01468378, 0.4689763, -0.4674139, 0, 0.8392157, 1, 1,
0.01854003, 0.7217146, -0.6289269, 0, 0.8313726, 1, 1,
0.02195503, 1.489824, 1.652352, 0, 0.827451, 1, 1,
0.02460486, -0.8579142, 2.338162, 0, 0.8196079, 1, 1,
0.02738166, 1.732186, 0.8921654, 0, 0.8156863, 1, 1,
0.02945752, -0.880131, 3.99807, 0, 0.8078431, 1, 1,
0.03269877, -1.538214, 3.576239, 0, 0.8039216, 1, 1,
0.03573356, -0.6549326, 2.195189, 0, 0.7960784, 1, 1,
0.03823698, 1.904761, 0.9897307, 0, 0.7882353, 1, 1,
0.03830361, -0.04674162, 2.497787, 0, 0.7843137, 1, 1,
0.04297724, 0.9229714, -0.03903011, 0, 0.7764706, 1, 1,
0.04424047, -0.1602703, 3.356918, 0, 0.772549, 1, 1,
0.04503916, -0.2276301, 4.601229, 0, 0.7647059, 1, 1,
0.05002428, 0.5448568, 0.2040888, 0, 0.7607843, 1, 1,
0.05020032, -2.88286, 5.180589, 0, 0.7529412, 1, 1,
0.05389769, -1.899811, 3.744623, 0, 0.7490196, 1, 1,
0.05546806, 0.429858, -0.9025147, 0, 0.7411765, 1, 1,
0.05832636, 0.2493527, -0.2383317, 0, 0.7372549, 1, 1,
0.05926459, 1.222405, -1.345383, 0, 0.7294118, 1, 1,
0.06322071, 0.9438628, 1.200629, 0, 0.7254902, 1, 1,
0.06655589, -1.286516, 4.625054, 0, 0.7176471, 1, 1,
0.06704566, 1.784139, -0.6894188, 0, 0.7137255, 1, 1,
0.07004309, 1.459862, -0.8277584, 0, 0.7058824, 1, 1,
0.07189719, 0.7379435, -1.370403, 0, 0.6980392, 1, 1,
0.07609638, -0.7706209, 3.48411, 0, 0.6941177, 1, 1,
0.07650977, -1.155023, 2.747818, 0, 0.6862745, 1, 1,
0.0767379, 0.5594972, 0.02295056, 0, 0.682353, 1, 1,
0.07873391, 0.3728625, 0.4380896, 0, 0.6745098, 1, 1,
0.08027446, -0.5119979, 3.331365, 0, 0.6705883, 1, 1,
0.0855572, 0.469301, 0.9924827, 0, 0.6627451, 1, 1,
0.08588708, 0.805665, -0.852576, 0, 0.6588235, 1, 1,
0.08655542, 0.3621155, 0.06200885, 0, 0.6509804, 1, 1,
0.08805071, -0.6731336, 2.269062, 0, 0.6470588, 1, 1,
0.09001929, 0.253077, -1.320273, 0, 0.6392157, 1, 1,
0.09206085, -0.5944368, 5.856697, 0, 0.6352941, 1, 1,
0.09329963, -0.0224109, 0.98703, 0, 0.627451, 1, 1,
0.09380961, -0.5449831, 3.530925, 0, 0.6235294, 1, 1,
0.09397791, -0.8679709, 2.074882, 0, 0.6156863, 1, 1,
0.09410947, 1.909582, -1.081842, 0, 0.6117647, 1, 1,
0.09445218, -0.008828867, 2.329474, 0, 0.6039216, 1, 1,
0.09692865, 1.062789, 0.0007030884, 0, 0.5960785, 1, 1,
0.09805552, 1.744141, 0.4860033, 0, 0.5921569, 1, 1,
0.09978452, 0.01442034, 0.9273958, 0, 0.5843138, 1, 1,
0.1037016, 0.2146721, 0.7602492, 0, 0.5803922, 1, 1,
0.103719, 1.18761, 0.503693, 0, 0.572549, 1, 1,
0.1069035, 3.015272, 1.685539, 0, 0.5686275, 1, 1,
0.1136886, -0.6634685, 4.652685, 0, 0.5607843, 1, 1,
0.1173252, 0.7011958, -0.2731954, 0, 0.5568628, 1, 1,
0.1188752, -1.54231, 4.115782, 0, 0.5490196, 1, 1,
0.1197024, -0.8056784, 2.20732, 0, 0.5450981, 1, 1,
0.1228137, -0.3269824, 2.556734, 0, 0.5372549, 1, 1,
0.1241433, 1.432744, 0.4767216, 0, 0.5333334, 1, 1,
0.1247424, -0.4648477, 2.399638, 0, 0.5254902, 1, 1,
0.127111, 0.3673593, -0.4699934, 0, 0.5215687, 1, 1,
0.1313557, -2.559479, 2.349788, 0, 0.5137255, 1, 1,
0.1345211, 1.318326, -2.090597, 0, 0.509804, 1, 1,
0.1348796, 0.8690507, -0.3853659, 0, 0.5019608, 1, 1,
0.1380693, -1.500526, 4.383205, 0, 0.4941176, 1, 1,
0.1434464, -0.2689868, 2.186735, 0, 0.4901961, 1, 1,
0.1451278, -1.550431, 3.13297, 0, 0.4823529, 1, 1,
0.146777, -2.252706, 4.342224, 0, 0.4784314, 1, 1,
0.1492459, -1.143282, 3.571996, 0, 0.4705882, 1, 1,
0.1560658, -0.8717669, 3.652581, 0, 0.4666667, 1, 1,
0.1583275, -0.6129403, 1.395944, 0, 0.4588235, 1, 1,
0.1586502, 0.2362605, 0.4381135, 0, 0.454902, 1, 1,
0.1597245, -0.6176368, 3.057698, 0, 0.4470588, 1, 1,
0.1695578, -1.185518, 2.230796, 0, 0.4431373, 1, 1,
0.1734442, -0.3487723, 2.725292, 0, 0.4352941, 1, 1,
0.1766553, -2.115033, 3.91791, 0, 0.4313726, 1, 1,
0.1781644, -1.221792, 3.379073, 0, 0.4235294, 1, 1,
0.1783454, 1.022364, 2.418149, 0, 0.4196078, 1, 1,
0.1792218, 0.7330934, 0.6901595, 0, 0.4117647, 1, 1,
0.1796706, 0.6561382, 1.339129, 0, 0.4078431, 1, 1,
0.1800395, 1.315943, 2.173998, 0, 0.4, 1, 1,
0.1803533, 1.564304, 0.2723995, 0, 0.3921569, 1, 1,
0.1808433, -0.2166588, 2.711328, 0, 0.3882353, 1, 1,
0.1810899, 1.070282, -1.257046, 0, 0.3803922, 1, 1,
0.1820657, -0.124553, 2.984562, 0, 0.3764706, 1, 1,
0.1832072, 1.742785, 0.2363842, 0, 0.3686275, 1, 1,
0.185235, 0.4024959, 0.6737247, 0, 0.3647059, 1, 1,
0.1862842, -1.564767, 2.959528, 0, 0.3568628, 1, 1,
0.1919274, -0.1547334, 3.033821, 0, 0.3529412, 1, 1,
0.1970103, 0.6504156, 1.6033, 0, 0.345098, 1, 1,
0.1991729, -0.7509361, 0.2722693, 0, 0.3411765, 1, 1,
0.1997407, 0.2241953, 0.3795396, 0, 0.3333333, 1, 1,
0.202435, 1.009183, -0.3321935, 0, 0.3294118, 1, 1,
0.2057071, 1.694498, -1.095106, 0, 0.3215686, 1, 1,
0.2093686, 0.5608755, 0.7272018, 0, 0.3176471, 1, 1,
0.2114687, -1.217622, 3.845247, 0, 0.3098039, 1, 1,
0.212718, 0.2720412, 1.506106, 0, 0.3058824, 1, 1,
0.2129454, 0.5110559, 2.11622, 0, 0.2980392, 1, 1,
0.2130677, 1.270739, -0.2968872, 0, 0.2901961, 1, 1,
0.2135597, -0.8995957, 2.045372, 0, 0.2862745, 1, 1,
0.2169238, -1.601069, 3.799276, 0, 0.2784314, 1, 1,
0.2181056, -0.1298013, 4.391671, 0, 0.2745098, 1, 1,
0.2189636, -0.2866683, 1.769319, 0, 0.2666667, 1, 1,
0.2212814, 0.9662147, 0.6825972, 0, 0.2627451, 1, 1,
0.2219962, -1.153614, 1.437457, 0, 0.254902, 1, 1,
0.2263431, 1.255208, 0.3174594, 0, 0.2509804, 1, 1,
0.2436734, -0.3147244, 2.498091, 0, 0.2431373, 1, 1,
0.2437672, -0.2647145, 2.467687, 0, 0.2392157, 1, 1,
0.2446913, -1.776776, 3.147238, 0, 0.2313726, 1, 1,
0.2511248, 0.4158093, 0.1100565, 0, 0.227451, 1, 1,
0.2516876, 0.8657219, 0.9410043, 0, 0.2196078, 1, 1,
0.2548606, 1.152704, 0.5352642, 0, 0.2156863, 1, 1,
0.2573072, 1.480097, 0.3539286, 0, 0.2078431, 1, 1,
0.2602017, -1.297972, 3.552977, 0, 0.2039216, 1, 1,
0.2604131, -0.04487073, 2.822576, 0, 0.1960784, 1, 1,
0.2610468, -0.1686301, 0.8697801, 0, 0.1882353, 1, 1,
0.2614691, -0.821938, 3.370827, 0, 0.1843137, 1, 1,
0.2681159, -0.3715702, 1.10569, 0, 0.1764706, 1, 1,
0.2703543, 0.06291329, 1.479667, 0, 0.172549, 1, 1,
0.2721128, -1.735961, 3.980334, 0, 0.1647059, 1, 1,
0.2763168, -0.6407752, 2.75508, 0, 0.1607843, 1, 1,
0.2777831, 0.1655537, 0.6913623, 0, 0.1529412, 1, 1,
0.2796837, 0.6698266, -1.63202, 0, 0.1490196, 1, 1,
0.2804213, 0.3332432, 1.900647, 0, 0.1411765, 1, 1,
0.280849, 0.6774226, 0.8098027, 0, 0.1372549, 1, 1,
0.2822765, -0.1734362, 2.626034, 0, 0.1294118, 1, 1,
0.2832938, 0.1080841, -0.03691718, 0, 0.1254902, 1, 1,
0.285683, 0.5011361, -0.9774677, 0, 0.1176471, 1, 1,
0.2905151, -0.3049008, 3.441506, 0, 0.1137255, 1, 1,
0.2906667, 1.153053, -0.3477172, 0, 0.1058824, 1, 1,
0.2991016, 0.06898899, 0.4032537, 0, 0.09803922, 1, 1,
0.3065492, 0.6503342, 0.06445952, 0, 0.09411765, 1, 1,
0.3094452, -1.406265, 1.569502, 0, 0.08627451, 1, 1,
0.3099164, -0.2774329, 2.208204, 0, 0.08235294, 1, 1,
0.317225, 1.167975, 0.5758537, 0, 0.07450981, 1, 1,
0.3216139, -0.3982032, 4.200736, 0, 0.07058824, 1, 1,
0.3231658, -0.477697, 2.432378, 0, 0.0627451, 1, 1,
0.3290733, -0.03253265, 2.479815, 0, 0.05882353, 1, 1,
0.3314292, 1.350185, -0.4564779, 0, 0.05098039, 1, 1,
0.3415501, 1.629445, -0.6370816, 0, 0.04705882, 1, 1,
0.3428164, -0.1157871, 1.195814, 0, 0.03921569, 1, 1,
0.3438464, -0.6925554, 1.945319, 0, 0.03529412, 1, 1,
0.3449109, -0.9299923, 3.098491, 0, 0.02745098, 1, 1,
0.3456625, -0.3633381, 0.2142308, 0, 0.02352941, 1, 1,
0.3461072, 0.9976388, -0.608647, 0, 0.01568628, 1, 1,
0.3637441, 1.321468, -0.2438706, 0, 0.01176471, 1, 1,
0.3643371, -0.1287852, 0.204696, 0, 0.003921569, 1, 1,
0.3675281, 0.5530331, 0.3690559, 0.003921569, 0, 1, 1,
0.3729157, -1.55933, 5.325502, 0.007843138, 0, 1, 1,
0.3745404, 1.079269, -0.9381632, 0.01568628, 0, 1, 1,
0.3769036, -0.9644576, 1.814842, 0.01960784, 0, 1, 1,
0.3825976, -1.024199, 2.565605, 0.02745098, 0, 1, 1,
0.383278, -0.0003072552, 1.485191, 0.03137255, 0, 1, 1,
0.3863443, 0.9045143, 0.3300647, 0.03921569, 0, 1, 1,
0.3888579, 0.7778888, 1.133452, 0.04313726, 0, 1, 1,
0.3952691, 1.203988, 1.1293, 0.05098039, 0, 1, 1,
0.396463, 0.5647386, -0.9243443, 0.05490196, 0, 1, 1,
0.4022692, 0.1883597, -1.325404, 0.0627451, 0, 1, 1,
0.4029381, -0.5080575, 2.516663, 0.06666667, 0, 1, 1,
0.4078378, -0.8928679, 2.700022, 0.07450981, 0, 1, 1,
0.4125957, -1.335015, 4.083767, 0.07843138, 0, 1, 1,
0.4128453, 1.085884, 1.070668, 0.08627451, 0, 1, 1,
0.4129556, 0.6799638, -1.086001, 0.09019608, 0, 1, 1,
0.4165903, -0.5918025, 2.572787, 0.09803922, 0, 1, 1,
0.4166335, 0.1777013, 1.890314, 0.1058824, 0, 1, 1,
0.4200089, -1.529339, 3.181833, 0.1098039, 0, 1, 1,
0.422176, 2.255261, -0.3485216, 0.1176471, 0, 1, 1,
0.4246367, 0.5608134, 1.286991, 0.1215686, 0, 1, 1,
0.4254868, 0.9552073, 1.637626, 0.1294118, 0, 1, 1,
0.4304572, -1.068825, 2.36432, 0.1333333, 0, 1, 1,
0.4328271, -0.6939821, 2.131615, 0.1411765, 0, 1, 1,
0.4357638, -0.5536065, 1.382531, 0.145098, 0, 1, 1,
0.4368952, 1.557346, -1.518758, 0.1529412, 0, 1, 1,
0.4377089, -0.1080055, 0.1633242, 0.1568628, 0, 1, 1,
0.4417385, 0.62429, 1.17279, 0.1647059, 0, 1, 1,
0.4466031, -0.9152794, 1.466423, 0.1686275, 0, 1, 1,
0.4498733, 0.2407623, -1.014071, 0.1764706, 0, 1, 1,
0.453286, 0.324366, 0.1006116, 0.1803922, 0, 1, 1,
0.454455, 0.514062, 1.769433, 0.1882353, 0, 1, 1,
0.4549163, 0.2671686, 2.415952, 0.1921569, 0, 1, 1,
0.458591, 0.7986273, 1.535199, 0.2, 0, 1, 1,
0.4630039, -2.32083, 3.530373, 0.2078431, 0, 1, 1,
0.46437, 0.6739018, 0.7693091, 0.2117647, 0, 1, 1,
0.4650604, -0.1686523, 4.248275, 0.2196078, 0, 1, 1,
0.4653757, -1.158999, 1.364565, 0.2235294, 0, 1, 1,
0.4674959, -0.2261816, 2.619536, 0.2313726, 0, 1, 1,
0.469557, 0.6109952, 0.3968161, 0.2352941, 0, 1, 1,
0.4782315, -0.8720251, 3.563125, 0.2431373, 0, 1, 1,
0.4840131, 0.8259577, -1.115893, 0.2470588, 0, 1, 1,
0.4848361, -0.1948885, 1.364256, 0.254902, 0, 1, 1,
0.4853761, -0.2234972, 3.480412, 0.2588235, 0, 1, 1,
0.4940719, 1.721332, 1.376486, 0.2666667, 0, 1, 1,
0.4946688, -2.4179, 2.623411, 0.2705882, 0, 1, 1,
0.4947394, 1.506293, 0.5541992, 0.2784314, 0, 1, 1,
0.4960513, 1.800862, -1.49238, 0.282353, 0, 1, 1,
0.4962422, -0.7131606, 2.312605, 0.2901961, 0, 1, 1,
0.4993775, -0.8396587, 1.529348, 0.2941177, 0, 1, 1,
0.50116, 2.052848, 0.8322781, 0.3019608, 0, 1, 1,
0.5033792, -0.8712723, 3.263514, 0.3098039, 0, 1, 1,
0.5038816, -0.5798331, 3.091288, 0.3137255, 0, 1, 1,
0.5047043, -0.3921102, 1.566808, 0.3215686, 0, 1, 1,
0.5058278, -1.700648, 1.393656, 0.3254902, 0, 1, 1,
0.5062633, -1.038006, 1.396194, 0.3333333, 0, 1, 1,
0.5070907, -1.012135, 2.799175, 0.3372549, 0, 1, 1,
0.5074753, -0.294605, 2.370985, 0.345098, 0, 1, 1,
0.5154793, 0.32153, 1.251613, 0.3490196, 0, 1, 1,
0.5251359, 0.4199615, 1.677815, 0.3568628, 0, 1, 1,
0.5306253, 0.1381333, 2.670051, 0.3607843, 0, 1, 1,
0.5379381, -0.9105676, 2.201494, 0.3686275, 0, 1, 1,
0.5402888, 0.6135716, 0.1887449, 0.372549, 0, 1, 1,
0.5405499, 0.3014544, 0.5369162, 0.3803922, 0, 1, 1,
0.5415471, -0.9535043, 1.430101, 0.3843137, 0, 1, 1,
0.5424007, -0.09859424, 0.6724734, 0.3921569, 0, 1, 1,
0.5424628, 0.09803995, 1.127421, 0.3960784, 0, 1, 1,
0.5433506, -0.2289333, 2.377857, 0.4039216, 0, 1, 1,
0.551219, -1.316953, 2.175999, 0.4117647, 0, 1, 1,
0.5665995, 0.3018807, 2.548748, 0.4156863, 0, 1, 1,
0.571202, 0.6020578, 1.900152, 0.4235294, 0, 1, 1,
0.5782034, 0.5471707, 1.771783, 0.427451, 0, 1, 1,
0.5798871, -0.686222, 3.090988, 0.4352941, 0, 1, 1,
0.5836042, 0.2942408, 1.654514, 0.4392157, 0, 1, 1,
0.5898543, -0.03995521, 0.8831108, 0.4470588, 0, 1, 1,
0.5971363, 1.923377, -0.224806, 0.4509804, 0, 1, 1,
0.6019273, -1.047717, 1.922279, 0.4588235, 0, 1, 1,
0.6101622, -0.0232252, 0.3133528, 0.4627451, 0, 1, 1,
0.6121238, -0.8913751, 2.833285, 0.4705882, 0, 1, 1,
0.6170523, -1.244788, 3.113931, 0.4745098, 0, 1, 1,
0.6178302, -0.9210758, 4.271393, 0.4823529, 0, 1, 1,
0.6189609, 1.930566, -0.8590521, 0.4862745, 0, 1, 1,
0.6239738, -0.9465297, 1.613853, 0.4941176, 0, 1, 1,
0.6342382, -0.6828939, 1.50339, 0.5019608, 0, 1, 1,
0.6356422, 1.728565, 0.3716096, 0.5058824, 0, 1, 1,
0.6384491, 0.4778876, 0.3559101, 0.5137255, 0, 1, 1,
0.6467939, -0.1062458, 3.095667, 0.5176471, 0, 1, 1,
0.6494101, -1.142912, 1.3913, 0.5254902, 0, 1, 1,
0.6494405, -0.3651464, 2.330431, 0.5294118, 0, 1, 1,
0.6506656, 0.8903285, 1.970463, 0.5372549, 0, 1, 1,
0.6569052, 1.560376, 0.6039912, 0.5411765, 0, 1, 1,
0.6596982, 1.565231, -0.1524735, 0.5490196, 0, 1, 1,
0.6599631, -0.3052806, 2.500909, 0.5529412, 0, 1, 1,
0.6659675, 2.32773, -2.453767, 0.5607843, 0, 1, 1,
0.6662708, -0.1719874, 0.9797936, 0.5647059, 0, 1, 1,
0.6667329, 0.0642536, 1.646445, 0.572549, 0, 1, 1,
0.6725495, 0.003691686, 1.256352, 0.5764706, 0, 1, 1,
0.6729062, 0.9940796, -0.8645603, 0.5843138, 0, 1, 1,
0.6733698, -0.429245, 0.6128393, 0.5882353, 0, 1, 1,
0.6762238, 0.2346233, 0.858601, 0.5960785, 0, 1, 1,
0.6774344, -0.4230791, 2.422146, 0.6039216, 0, 1, 1,
0.6783868, 0.8107027, 0.8717507, 0.6078432, 0, 1, 1,
0.6838274, 1.371555, 1.712011, 0.6156863, 0, 1, 1,
0.6840963, 0.1348839, 0.9733502, 0.6196079, 0, 1, 1,
0.6853468, -1.012441, 2.376035, 0.627451, 0, 1, 1,
0.6872334, 0.4527719, 2.364168, 0.6313726, 0, 1, 1,
0.6883103, 1.803645, -0.6723787, 0.6392157, 0, 1, 1,
0.6926097, -0.8745252, 2.273058, 0.6431373, 0, 1, 1,
0.6930647, -0.8689404, 1.600702, 0.6509804, 0, 1, 1,
0.6968346, 0.652469, 0.5342681, 0.654902, 0, 1, 1,
0.6973534, -1.485175, 3.964824, 0.6627451, 0, 1, 1,
0.6997022, 1.37125, 0.2759431, 0.6666667, 0, 1, 1,
0.7011926, 0.3712988, 0.1359161, 0.6745098, 0, 1, 1,
0.7017741, -1.109517, 4.004105, 0.6784314, 0, 1, 1,
0.7027571, -0.7681214, 1.426792, 0.6862745, 0, 1, 1,
0.7031565, -0.1893291, 2.049858, 0.6901961, 0, 1, 1,
0.7072229, 0.6068894, 1.190868, 0.6980392, 0, 1, 1,
0.7092089, -1.21211, 4.392129, 0.7058824, 0, 1, 1,
0.7105578, -0.2521401, 2.874423, 0.7098039, 0, 1, 1,
0.7165312, -1.089048, 3.580808, 0.7176471, 0, 1, 1,
0.7267814, -0.3691261, 2.610811, 0.7215686, 0, 1, 1,
0.7334846, 1.481009, 1.28422, 0.7294118, 0, 1, 1,
0.7339902, -0.05399102, 0.4555298, 0.7333333, 0, 1, 1,
0.7411731, 1.672269, 0.3430795, 0.7411765, 0, 1, 1,
0.7458318, 0.9385115, 1.226168, 0.7450981, 0, 1, 1,
0.7560262, -0.46705, 2.029207, 0.7529412, 0, 1, 1,
0.7568506, 0.6456131, 2.656232, 0.7568628, 0, 1, 1,
0.7586766, -1.447616, 2.497514, 0.7647059, 0, 1, 1,
0.7656982, -1.797733, 2.467445, 0.7686275, 0, 1, 1,
0.767161, 0.04485997, 1.874938, 0.7764706, 0, 1, 1,
0.7703645, 0.4591447, -0.4310893, 0.7803922, 0, 1, 1,
0.7720218, -0.5584009, 1.0214, 0.7882353, 0, 1, 1,
0.776917, 0.1350646, 2.120206, 0.7921569, 0, 1, 1,
0.7772507, -0.5218257, 3.070731, 0.8, 0, 1, 1,
0.7782536, 0.3112646, -1.182436, 0.8078431, 0, 1, 1,
0.7783644, -0.6868629, 2.641197, 0.8117647, 0, 1, 1,
0.7870172, -1.457423, 3.314127, 0.8196079, 0, 1, 1,
0.7917073, -0.4410943, 2.280406, 0.8235294, 0, 1, 1,
0.7955359, -0.2456311, 2.042892, 0.8313726, 0, 1, 1,
0.7979183, 1.881905, 0.06781781, 0.8352941, 0, 1, 1,
0.7994422, 1.048971, 0.3505555, 0.8431373, 0, 1, 1,
0.8046214, 0.1624924, 0.7202574, 0.8470588, 0, 1, 1,
0.8089128, 0.7276619, 2.739277, 0.854902, 0, 1, 1,
0.8104057, -0.9707739, 2.300205, 0.8588235, 0, 1, 1,
0.8173998, 0.7714313, 1.807804, 0.8666667, 0, 1, 1,
0.8219246, 0.05571829, 1.070671, 0.8705882, 0, 1, 1,
0.8349319, -0.5730854, 2.26586, 0.8784314, 0, 1, 1,
0.8357569, -0.548791, 4.075844, 0.8823529, 0, 1, 1,
0.8393999, -0.8502549, 2.549126, 0.8901961, 0, 1, 1,
0.8438848, -0.2182614, 2.259302, 0.8941177, 0, 1, 1,
0.8477871, 0.1927495, 1.63573, 0.9019608, 0, 1, 1,
0.849004, -2.185072, 4.800403, 0.9098039, 0, 1, 1,
0.8564243, -0.4781213, 3.662065, 0.9137255, 0, 1, 1,
0.8621365, 0.6574402, -0.3891593, 0.9215686, 0, 1, 1,
0.8639214, -0.5766984, 1.965535, 0.9254902, 0, 1, 1,
0.8746608, 1.014339, 1.750047, 0.9333333, 0, 1, 1,
0.875375, -2.083642, 3.516676, 0.9372549, 0, 1, 1,
0.876753, -0.1313092, 0.003753669, 0.945098, 0, 1, 1,
0.8796423, -0.472266, 3.506253, 0.9490196, 0, 1, 1,
0.8869338, 1.912863, -0.3343881, 0.9568627, 0, 1, 1,
0.8882543, -1.416851, 3.320588, 0.9607843, 0, 1, 1,
0.8886297, -1.280053, 3.029122, 0.9686275, 0, 1, 1,
0.8938917, -1.051726, 3.020034, 0.972549, 0, 1, 1,
0.8944178, 1.279654, 0.8816301, 0.9803922, 0, 1, 1,
0.8961903, 0.5218146, 2.198051, 0.9843137, 0, 1, 1,
0.8987066, -0.5035695, 1.516557, 0.9921569, 0, 1, 1,
0.9004602, -0.573339, 3.709807, 0.9960784, 0, 1, 1,
0.9084834, 1.586437, 2.14152, 1, 0, 0.9960784, 1,
0.9219742, -0.1264891, 2.876347, 1, 0, 0.9882353, 1,
0.9236919, -0.9922333, 3.546899, 1, 0, 0.9843137, 1,
0.9238742, 0.7187006, -0.05440017, 1, 0, 0.9764706, 1,
0.9348947, 0.178421, 2.188349, 1, 0, 0.972549, 1,
0.9380369, 0.3216349, 0.2655434, 1, 0, 0.9647059, 1,
0.9402115, 1.405408, -0.3385636, 1, 0, 0.9607843, 1,
0.9441418, -1.839214, 2.573968, 1, 0, 0.9529412, 1,
0.9470303, -0.6630463, 2.448844, 1, 0, 0.9490196, 1,
0.9584541, 1.030393, -0.3049727, 1, 0, 0.9411765, 1,
0.9599401, -0.3229175, 3.061083, 1, 0, 0.9372549, 1,
0.9665996, -1.065737, 1.695941, 1, 0, 0.9294118, 1,
0.9690674, 1.040514, 0.7074161, 1, 0, 0.9254902, 1,
0.9752336, -0.2350704, 0.2778345, 1, 0, 0.9176471, 1,
0.9775394, 0.8598737, 0.07498476, 1, 0, 0.9137255, 1,
0.9810622, 0.05694661, 2.142067, 1, 0, 0.9058824, 1,
0.9847892, -0.6703697, 2.227628, 1, 0, 0.9019608, 1,
0.9915684, -0.4876237, 0.9749798, 1, 0, 0.8941177, 1,
0.9939492, -0.8607492, 1.982089, 1, 0, 0.8862745, 1,
0.9961181, -0.5866823, 0.4412974, 1, 0, 0.8823529, 1,
1.008495, 1.068964, -0.09460945, 1, 0, 0.8745098, 1,
1.008536, -0.8866767, 1.042917, 1, 0, 0.8705882, 1,
1.016817, -0.2283069, 0.2319374, 1, 0, 0.8627451, 1,
1.023695, 0.1363884, 1.47959, 1, 0, 0.8588235, 1,
1.024351, -0.9978993, 2.7853, 1, 0, 0.8509804, 1,
1.024712, -1.072577, 1.48828, 1, 0, 0.8470588, 1,
1.029936, 0.7064828, -0.003637808, 1, 0, 0.8392157, 1,
1.035146, -1.310146, 4.015681, 1, 0, 0.8352941, 1,
1.035317, -1.271095, 2.294641, 1, 0, 0.827451, 1,
1.043084, 0.1319504, 2.065556, 1, 0, 0.8235294, 1,
1.048768, -0.6869435, 1.632644, 1, 0, 0.8156863, 1,
1.049933, -0.8558016, 3.398205, 1, 0, 0.8117647, 1,
1.052546, -0.02648759, 1.807904, 1, 0, 0.8039216, 1,
1.060422, -0.679661, 1.943287, 1, 0, 0.7960784, 1,
1.061834, 0.5259888, 0.7352505, 1, 0, 0.7921569, 1,
1.062346, -1.687051, 1.363535, 1, 0, 0.7843137, 1,
1.063873, 0.7954255, 1.46385, 1, 0, 0.7803922, 1,
1.065724, 1.545659, 0.08398955, 1, 0, 0.772549, 1,
1.071926, -0.7186303, 1.29335, 1, 0, 0.7686275, 1,
1.102301, 1.029956, -0.4144434, 1, 0, 0.7607843, 1,
1.10723, 0.8286761, 2.010591, 1, 0, 0.7568628, 1,
1.111479, 0.8933871, -0.8235933, 1, 0, 0.7490196, 1,
1.114075, 1.796011, 1.783202, 1, 0, 0.7450981, 1,
1.125327, 0.1733918, 1.945808, 1, 0, 0.7372549, 1,
1.127166, -0.06875926, 1.401877, 1, 0, 0.7333333, 1,
1.138659, 1.383643, 0.3956739, 1, 0, 0.7254902, 1,
1.146446, -0.6495121, 1.397709, 1, 0, 0.7215686, 1,
1.152061, 0.7849199, 0.979543, 1, 0, 0.7137255, 1,
1.152771, 1.334834, 0.8292338, 1, 0, 0.7098039, 1,
1.164044, -1.552499, 4.269516, 1, 0, 0.7019608, 1,
1.164377, -0.05801245, 2.25116, 1, 0, 0.6941177, 1,
1.191767, 0.6175926, -0.7646627, 1, 0, 0.6901961, 1,
1.195921, -0.7826928, 3.063321, 1, 0, 0.682353, 1,
1.205958, 2.255975, 1.273387, 1, 0, 0.6784314, 1,
1.209179, -0.264181, 1.454696, 1, 0, 0.6705883, 1,
1.21184, -0.1218711, 2.896275, 1, 0, 0.6666667, 1,
1.215645, 0.2219081, 0.8231355, 1, 0, 0.6588235, 1,
1.221161, 0.4095893, 1.103097, 1, 0, 0.654902, 1,
1.231557, 0.9994256, 2.777047, 1, 0, 0.6470588, 1,
1.23701, 0.8280925, 0.08034394, 1, 0, 0.6431373, 1,
1.239791, 0.01706745, 0.9918833, 1, 0, 0.6352941, 1,
1.265484, 1.142826, -0.5435823, 1, 0, 0.6313726, 1,
1.273767, 0.2135435, 2.33095, 1, 0, 0.6235294, 1,
1.275201, 0.408978, 0.6244215, 1, 0, 0.6196079, 1,
1.276217, -0.6283473, 2.45013, 1, 0, 0.6117647, 1,
1.295849, 0.01378668, 0.6387556, 1, 0, 0.6078432, 1,
1.298958, 0.405052, 1.731103, 1, 0, 0.6, 1,
1.315954, -0.630433, 2.601368, 1, 0, 0.5921569, 1,
1.32964, -0.05913711, 1.858055, 1, 0, 0.5882353, 1,
1.335521, -0.7082339, 1.26902, 1, 0, 0.5803922, 1,
1.349432, 0.7387646, 0.8273631, 1, 0, 0.5764706, 1,
1.351985, 0.6323634, 1.461421, 1, 0, 0.5686275, 1,
1.361283, -0.5016507, 2.05941, 1, 0, 0.5647059, 1,
1.37454, 1.446847, -0.2891613, 1, 0, 0.5568628, 1,
1.376839, 0.4189459, -0.7771666, 1, 0, 0.5529412, 1,
1.385654, 1.106479, 0.6211216, 1, 0, 0.5450981, 1,
1.386721, -1.133365, 2.589828, 1, 0, 0.5411765, 1,
1.401413, -0.6561672, 1.895241, 1, 0, 0.5333334, 1,
1.402771, -1.068904, 1.695903, 1, 0, 0.5294118, 1,
1.410488, 0.1748442, 1.650279, 1, 0, 0.5215687, 1,
1.423597, -1.391679, 1.546383, 1, 0, 0.5176471, 1,
1.432644, 0.5150265, 0.6905169, 1, 0, 0.509804, 1,
1.432894, 1.402457, -0.1199322, 1, 0, 0.5058824, 1,
1.432968, -0.8484235, 2.666771, 1, 0, 0.4980392, 1,
1.437931, 0.2041413, 3.9497, 1, 0, 0.4901961, 1,
1.449911, 0.3229491, 0.9647654, 1, 0, 0.4862745, 1,
1.461163, -0.7266816, 4.125867, 1, 0, 0.4784314, 1,
1.481894, -1.031519, 2.584412, 1, 0, 0.4745098, 1,
1.483782, -0.8182662, 2.792572, 1, 0, 0.4666667, 1,
1.484285, -0.2503561, 2.084442, 1, 0, 0.4627451, 1,
1.504525, 0.2443563, 2.191886, 1, 0, 0.454902, 1,
1.505886, -0.03571664, 3.118684, 1, 0, 0.4509804, 1,
1.517978, -2.406937, 1.999261, 1, 0, 0.4431373, 1,
1.524674, 0.6166525, 0.8116491, 1, 0, 0.4392157, 1,
1.545433, -0.7935656, 2.873971, 1, 0, 0.4313726, 1,
1.5526, 0.1849555, 1.219442, 1, 0, 0.427451, 1,
1.559319, 0.1963423, 1.205039, 1, 0, 0.4196078, 1,
1.56157, 1.013761, 1.569704, 1, 0, 0.4156863, 1,
1.578954, 0.1919643, 0.6985007, 1, 0, 0.4078431, 1,
1.580544, 1.209553, 0.5588953, 1, 0, 0.4039216, 1,
1.582089, 0.7572894, 1.445651, 1, 0, 0.3960784, 1,
1.601142, -0.2295866, 1.657569, 1, 0, 0.3882353, 1,
1.610978, 0.188409, 2.690154, 1, 0, 0.3843137, 1,
1.6122, 0.562528, 0.6893694, 1, 0, 0.3764706, 1,
1.612717, -0.6252694, 3.331038, 1, 0, 0.372549, 1,
1.633184, 0.1286879, 2.811662, 1, 0, 0.3647059, 1,
1.660492, 1.164079, 1.537447, 1, 0, 0.3607843, 1,
1.662714, 0.5408287, 1.564051, 1, 0, 0.3529412, 1,
1.667638, 1.308681, -0.944679, 1, 0, 0.3490196, 1,
1.669618, -0.2278745, 0.8155727, 1, 0, 0.3411765, 1,
1.687902, 0.466128, 2.831522, 1, 0, 0.3372549, 1,
1.699328, 0.119057, 2.566651, 1, 0, 0.3294118, 1,
1.700006, -0.797803, 2.082767, 1, 0, 0.3254902, 1,
1.717324, 0.1247848, 1.712399, 1, 0, 0.3176471, 1,
1.742159, 0.392887, 0.09020422, 1, 0, 0.3137255, 1,
1.754567, -0.2308774, 0.7784664, 1, 0, 0.3058824, 1,
1.762336, -1.850176, -0.6892946, 1, 0, 0.2980392, 1,
1.796126, 0.1768847, 1.49582, 1, 0, 0.2941177, 1,
1.799807, 0.805263, 1.656137, 1, 0, 0.2862745, 1,
1.8073, -0.4751926, 1.392815, 1, 0, 0.282353, 1,
1.807407, 0.04666782, 1.989406, 1, 0, 0.2745098, 1,
1.816152, 0.3260183, 2.19944, 1, 0, 0.2705882, 1,
1.820354, 1.013159, 1.750461, 1, 0, 0.2627451, 1,
1.830855, -0.5393932, 3.344795, 1, 0, 0.2588235, 1,
1.835941, 1.606185, 0.5202227, 1, 0, 0.2509804, 1,
1.841546, 1.184801, 0.5496472, 1, 0, 0.2470588, 1,
1.865566, 0.2715422, 3.378142, 1, 0, 0.2392157, 1,
1.871674, 1.87565, 0.8849873, 1, 0, 0.2352941, 1,
1.874352, -1.333678, 3.190393, 1, 0, 0.227451, 1,
1.874447, -0.6854571, 1.216766, 1, 0, 0.2235294, 1,
1.88955, 0.04188916, 1.117417, 1, 0, 0.2156863, 1,
1.896588, -0.3192309, 0.8543351, 1, 0, 0.2117647, 1,
1.897489, -0.4133489, 1.540185, 1, 0, 0.2039216, 1,
1.905085, 2.376505, 0.5909196, 1, 0, 0.1960784, 1,
1.909877, 0.1618995, 2.590837, 1, 0, 0.1921569, 1,
1.920257, -0.3522063, 1.241798, 1, 0, 0.1843137, 1,
1.930132, -2.583913, 2.274489, 1, 0, 0.1803922, 1,
1.948637, 0.486122, -1.019345, 1, 0, 0.172549, 1,
1.948884, 1.366572, 1.858142, 1, 0, 0.1686275, 1,
1.948977, 0.4311421, 0.8883882, 1, 0, 0.1607843, 1,
1.953912, -0.9346274, 0.4684736, 1, 0, 0.1568628, 1,
1.954513, 1.450952, 0.08411899, 1, 0, 0.1490196, 1,
1.970261, 0.8277654, 1.000221, 1, 0, 0.145098, 1,
2.020726, -0.4043649, 2.292026, 1, 0, 0.1372549, 1,
2.03981, 0.663766, 1.691968, 1, 0, 0.1333333, 1,
2.053098, -2.348027, 2.311405, 1, 0, 0.1254902, 1,
2.057189, 1.249706, 1.001094, 1, 0, 0.1215686, 1,
2.064131, 0.8511848, 3.19081, 1, 0, 0.1137255, 1,
2.073708, 1.313696, 1.407539, 1, 0, 0.1098039, 1,
2.079065, -1.731352, 2.915435, 1, 0, 0.1019608, 1,
2.089272, 1.430026, 1.085804, 1, 0, 0.09411765, 1,
2.129343, 0.8491724, 1.195002, 1, 0, 0.09019608, 1,
2.129556, -1.728966, 1.312879, 1, 0, 0.08235294, 1,
2.152045, -0.818541, 0.4579369, 1, 0, 0.07843138, 1,
2.236323, 0.9185445, 0.1175307, 1, 0, 0.07058824, 1,
2.276634, -0.5072179, 0.8255107, 1, 0, 0.06666667, 1,
2.306837, -0.02047025, 2.35476, 1, 0, 0.05882353, 1,
2.319839, -1.560416, 1.669932, 1, 0, 0.05490196, 1,
2.324583, -0.2389746, 1.846199, 1, 0, 0.04705882, 1,
2.341825, -1.6999, 4.132874, 1, 0, 0.04313726, 1,
2.397817, -0.6547845, 2.41577, 1, 0, 0.03529412, 1,
2.450614, -0.1182506, 1.848067, 1, 0, 0.03137255, 1,
2.545559, 1.067177, 0.857972, 1, 0, 0.02352941, 1,
2.560186, 1.154499, 1.428067, 1, 0, 0.01960784, 1,
2.652816, -1.107983, 2.100137, 1, 0, 0.01176471, 1,
2.678661, -1.168124, -0.3136198, 1, 0, 0.007843138, 1
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
-0.4166442, -3.945156, -6.834079, 0, -0.5, 0.5, 0.5,
-0.4166442, -3.945156, -6.834079, 1, -0.5, 0.5, 0.5,
-0.4166442, -3.945156, -6.834079, 1, 1.5, 0.5, 0.5,
-0.4166442, -3.945156, -6.834079, 0, 1.5, 0.5, 0.5
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
-4.561258, 0.2507553, -6.834079, 0, -0.5, 0.5, 0.5,
-4.561258, 0.2507553, -6.834079, 1, -0.5, 0.5, 0.5,
-4.561258, 0.2507553, -6.834079, 1, 1.5, 0.5, 0.5,
-4.561258, 0.2507553, -6.834079, 0, 1.5, 0.5, 0.5
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
-4.561258, -3.945156, 0.43097, 0, -0.5, 0.5, 0.5,
-4.561258, -3.945156, 0.43097, 1, -0.5, 0.5, 0.5,
-4.561258, -3.945156, 0.43097, 1, 1.5, 0.5, 0.5,
-4.561258, -3.945156, 0.43097, 0, 1.5, 0.5, 0.5
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
-3, -2.976869, -5.157529,
2, -2.976869, -5.157529,
-3, -2.976869, -5.157529,
-3, -3.13825, -5.436954,
-2, -2.976869, -5.157529,
-2, -3.13825, -5.436954,
-1, -2.976869, -5.157529,
-1, -3.13825, -5.436954,
0, -2.976869, -5.157529,
0, -3.13825, -5.436954,
1, -2.976869, -5.157529,
1, -3.13825, -5.436954,
2, -2.976869, -5.157529,
2, -3.13825, -5.436954
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
-3, -3.461013, -5.995804, 0, -0.5, 0.5, 0.5,
-3, -3.461013, -5.995804, 1, -0.5, 0.5, 0.5,
-3, -3.461013, -5.995804, 1, 1.5, 0.5, 0.5,
-3, -3.461013, -5.995804, 0, 1.5, 0.5, 0.5,
-2, -3.461013, -5.995804, 0, -0.5, 0.5, 0.5,
-2, -3.461013, -5.995804, 1, -0.5, 0.5, 0.5,
-2, -3.461013, -5.995804, 1, 1.5, 0.5, 0.5,
-2, -3.461013, -5.995804, 0, 1.5, 0.5, 0.5,
-1, -3.461013, -5.995804, 0, -0.5, 0.5, 0.5,
-1, -3.461013, -5.995804, 1, -0.5, 0.5, 0.5,
-1, -3.461013, -5.995804, 1, 1.5, 0.5, 0.5,
-1, -3.461013, -5.995804, 0, 1.5, 0.5, 0.5,
0, -3.461013, -5.995804, 0, -0.5, 0.5, 0.5,
0, -3.461013, -5.995804, 1, -0.5, 0.5, 0.5,
0, -3.461013, -5.995804, 1, 1.5, 0.5, 0.5,
0, -3.461013, -5.995804, 0, 1.5, 0.5, 0.5,
1, -3.461013, -5.995804, 0, -0.5, 0.5, 0.5,
1, -3.461013, -5.995804, 1, -0.5, 0.5, 0.5,
1, -3.461013, -5.995804, 1, 1.5, 0.5, 0.5,
1, -3.461013, -5.995804, 0, 1.5, 0.5, 0.5,
2, -3.461013, -5.995804, 0, -0.5, 0.5, 0.5,
2, -3.461013, -5.995804, 1, -0.5, 0.5, 0.5,
2, -3.461013, -5.995804, 1, 1.5, 0.5, 0.5,
2, -3.461013, -5.995804, 0, 1.5, 0.5, 0.5
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
-3.604809, -2, -5.157529,
-3.604809, 3, -5.157529,
-3.604809, -2, -5.157529,
-3.764217, -2, -5.436954,
-3.604809, -1, -5.157529,
-3.764217, -1, -5.436954,
-3.604809, 0, -5.157529,
-3.764217, 0, -5.436954,
-3.604809, 1, -5.157529,
-3.764217, 1, -5.436954,
-3.604809, 2, -5.157529,
-3.764217, 2, -5.436954,
-3.604809, 3, -5.157529,
-3.764217, 3, -5.436954
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
-4.083034, -2, -5.995804, 0, -0.5, 0.5, 0.5,
-4.083034, -2, -5.995804, 1, -0.5, 0.5, 0.5,
-4.083034, -2, -5.995804, 1, 1.5, 0.5, 0.5,
-4.083034, -2, -5.995804, 0, 1.5, 0.5, 0.5,
-4.083034, -1, -5.995804, 0, -0.5, 0.5, 0.5,
-4.083034, -1, -5.995804, 1, -0.5, 0.5, 0.5,
-4.083034, -1, -5.995804, 1, 1.5, 0.5, 0.5,
-4.083034, -1, -5.995804, 0, 1.5, 0.5, 0.5,
-4.083034, 0, -5.995804, 0, -0.5, 0.5, 0.5,
-4.083034, 0, -5.995804, 1, -0.5, 0.5, 0.5,
-4.083034, 0, -5.995804, 1, 1.5, 0.5, 0.5,
-4.083034, 0, -5.995804, 0, 1.5, 0.5, 0.5,
-4.083034, 1, -5.995804, 0, -0.5, 0.5, 0.5,
-4.083034, 1, -5.995804, 1, -0.5, 0.5, 0.5,
-4.083034, 1, -5.995804, 1, 1.5, 0.5, 0.5,
-4.083034, 1, -5.995804, 0, 1.5, 0.5, 0.5,
-4.083034, 2, -5.995804, 0, -0.5, 0.5, 0.5,
-4.083034, 2, -5.995804, 1, -0.5, 0.5, 0.5,
-4.083034, 2, -5.995804, 1, 1.5, 0.5, 0.5,
-4.083034, 2, -5.995804, 0, 1.5, 0.5, 0.5,
-4.083034, 3, -5.995804, 0, -0.5, 0.5, 0.5,
-4.083034, 3, -5.995804, 1, -0.5, 0.5, 0.5,
-4.083034, 3, -5.995804, 1, 1.5, 0.5, 0.5,
-4.083034, 3, -5.995804, 0, 1.5, 0.5, 0.5
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
-3.604809, -2.976869, -4,
-3.604809, -2.976869, 4,
-3.604809, -2.976869, -4,
-3.764217, -3.13825, -4,
-3.604809, -2.976869, -2,
-3.764217, -3.13825, -2,
-3.604809, -2.976869, 0,
-3.764217, -3.13825, 0,
-3.604809, -2.976869, 2,
-3.764217, -3.13825, 2,
-3.604809, -2.976869, 4,
-3.764217, -3.13825, 4
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
-4.083034, -3.461013, -4, 0, -0.5, 0.5, 0.5,
-4.083034, -3.461013, -4, 1, -0.5, 0.5, 0.5,
-4.083034, -3.461013, -4, 1, 1.5, 0.5, 0.5,
-4.083034, -3.461013, -4, 0, 1.5, 0.5, 0.5,
-4.083034, -3.461013, -2, 0, -0.5, 0.5, 0.5,
-4.083034, -3.461013, -2, 1, -0.5, 0.5, 0.5,
-4.083034, -3.461013, -2, 1, 1.5, 0.5, 0.5,
-4.083034, -3.461013, -2, 0, 1.5, 0.5, 0.5,
-4.083034, -3.461013, 0, 0, -0.5, 0.5, 0.5,
-4.083034, -3.461013, 0, 1, -0.5, 0.5, 0.5,
-4.083034, -3.461013, 0, 1, 1.5, 0.5, 0.5,
-4.083034, -3.461013, 0, 0, 1.5, 0.5, 0.5,
-4.083034, -3.461013, 2, 0, -0.5, 0.5, 0.5,
-4.083034, -3.461013, 2, 1, -0.5, 0.5, 0.5,
-4.083034, -3.461013, 2, 1, 1.5, 0.5, 0.5,
-4.083034, -3.461013, 2, 0, 1.5, 0.5, 0.5,
-4.083034, -3.461013, 4, 0, -0.5, 0.5, 0.5,
-4.083034, -3.461013, 4, 1, -0.5, 0.5, 0.5,
-4.083034, -3.461013, 4, 1, 1.5, 0.5, 0.5,
-4.083034, -3.461013, 4, 0, 1.5, 0.5, 0.5
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
-3.604809, -2.976869, -5.157529,
-3.604809, 3.478379, -5.157529,
-3.604809, -2.976869, 6.019469,
-3.604809, 3.478379, 6.019469,
-3.604809, -2.976869, -5.157529,
-3.604809, -2.976869, 6.019469,
-3.604809, 3.478379, -5.157529,
-3.604809, 3.478379, 6.019469,
-3.604809, -2.976869, -5.157529,
2.77152, -2.976869, -5.157529,
-3.604809, -2.976869, 6.019469,
2.77152, -2.976869, 6.019469,
-3.604809, 3.478379, -5.157529,
2.77152, 3.478379, -5.157529,
-3.604809, 3.478379, 6.019469,
2.77152, 3.478379, 6.019469,
2.77152, -2.976869, -5.157529,
2.77152, 3.478379, -5.157529,
2.77152, -2.976869, 6.019469,
2.77152, 3.478379, 6.019469,
2.77152, -2.976869, -5.157529,
2.77152, -2.976869, 6.019469,
2.77152, 3.478379, -5.157529,
2.77152, 3.478379, 6.019469
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
var radius = 7.687338;
var distance = 34.20184;
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
mvMatrix.translate( 0.4166442, -0.2507553, -0.43097 );
mvMatrix.scale( 1.303524, 1.287588, 0.7436433 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.20184);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
trifluralin<-read.table("trifluralin.xyz")
```

```
## Error in read.table("trifluralin.xyz"): no lines available in input
```

```r
x<-trifluralin$V2
```

```
## Error in eval(expr, envir, enclos): object 'trifluralin' not found
```

```r
y<-trifluralin$V3
```

```
## Error in eval(expr, envir, enclos): object 'trifluralin' not found
```

```r
z<-trifluralin$V4
```

```
## Error in eval(expr, envir, enclos): object 'trifluralin' not found
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
-3.51195, -0.2383458, -1.078726, 0, 0, 1, 1, 1,
-3.046957, 0.5070282, -1.763754, 1, 0, 0, 1, 1,
-2.663004, 0.9592207, -1.027706, 1, 0, 0, 1, 1,
-2.626605, -0.5145111, -1.652823, 1, 0, 0, 1, 1,
-2.455455, -0.2095466, -3.001121, 1, 0, 0, 1, 1,
-2.440197, 0.4824689, 0.07886475, 1, 0, 0, 1, 1,
-2.419266, 2.058779, -1.628429, 0, 0, 0, 1, 1,
-2.333271, 2.354622, -2.71056, 0, 0, 0, 1, 1,
-2.267066, 3.384371, -1.374887, 0, 0, 0, 1, 1,
-2.252016, 0.0515342, -0.8768142, 0, 0, 0, 1, 1,
-2.223222, 0.6906844, -1.404786, 0, 0, 0, 1, 1,
-2.213948, 1.444134, 0.620634, 0, 0, 0, 1, 1,
-2.20287, 0.4101324, 0.6921429, 0, 0, 0, 1, 1,
-2.183282, 0.3618751, 0.3023088, 1, 1, 1, 1, 1,
-2.120989, 0.3095605, -1.826964, 1, 1, 1, 1, 1,
-2.117301, 0.1197256, -0.3637546, 1, 1, 1, 1, 1,
-2.041365, -0.4087708, -1.604313, 1, 1, 1, 1, 1,
-2.011248, -0.6801579, -3.624115, 1, 1, 1, 1, 1,
-1.997648, 0.8142561, -1.094204, 1, 1, 1, 1, 1,
-1.989779, -0.1183358, -1.966847, 1, 1, 1, 1, 1,
-1.980181, -1.192406, -1.346406, 1, 1, 1, 1, 1,
-1.977694, -1.638703, -2.804236, 1, 1, 1, 1, 1,
-1.975859, 0.329271, -1.507769, 1, 1, 1, 1, 1,
-1.975678, -0.4117742, -0.6726305, 1, 1, 1, 1, 1,
-1.936436, -1.595878, -3.281624, 1, 1, 1, 1, 1,
-1.927535, 0.7080506, -0.5724508, 1, 1, 1, 1, 1,
-1.889533, -2.058545, -1.713528, 1, 1, 1, 1, 1,
-1.888238, 1.288143, -1.473733, 1, 1, 1, 1, 1,
-1.881355, -0.579187, -3.713786, 0, 0, 1, 1, 1,
-1.876238, 1.197427, -1.552328, 1, 0, 0, 1, 1,
-1.864431, 0.06646476, -0.7888535, 1, 0, 0, 1, 1,
-1.857667, 1.428422, -3.131667, 1, 0, 0, 1, 1,
-1.855452, -0.00644864, -2.054665, 1, 0, 0, 1, 1,
-1.832195, 0.4489586, -2.71228, 1, 0, 0, 1, 1,
-1.820039, 0.829498, 1.070269, 0, 0, 0, 1, 1,
-1.796612, 1.577855, 0.4643239, 0, 0, 0, 1, 1,
-1.740709, 0.8415388, -0.61483, 0, 0, 0, 1, 1,
-1.736429, -0.7319359, -2.545062, 0, 0, 0, 1, 1,
-1.725127, -1.03398, -2.676925, 0, 0, 0, 1, 1,
-1.705628, -0.6357533, -2.062881, 0, 0, 0, 1, 1,
-1.70027, 1.955644, 0.216262, 0, 0, 0, 1, 1,
-1.691599, -0.8712302, -2.39274, 1, 1, 1, 1, 1,
-1.685709, -1.882407, -2.266664, 1, 1, 1, 1, 1,
-1.685476, 1.880596, -0.2657839, 1, 1, 1, 1, 1,
-1.664917, -0.09790755, -0.8844016, 1, 1, 1, 1, 1,
-1.652849, 0.5990162, -0.1124246, 1, 1, 1, 1, 1,
-1.644045, 0.2526071, -1.69001, 1, 1, 1, 1, 1,
-1.643535, -0.6448551, -1.120736, 1, 1, 1, 1, 1,
-1.638356, 0.820137, 0.9747126, 1, 1, 1, 1, 1,
-1.635926, -0.8760915, -1.748667, 1, 1, 1, 1, 1,
-1.634808, -0.7040058, -3.046556, 1, 1, 1, 1, 1,
-1.609367, -0.570736, -0.7514597, 1, 1, 1, 1, 1,
-1.608169, -1.117376, -2.645485, 1, 1, 1, 1, 1,
-1.606304, 0.1605625, -0.4764005, 1, 1, 1, 1, 1,
-1.601823, 0.3667073, -2.529575, 1, 1, 1, 1, 1,
-1.60033, 1.273643, -1.486034, 1, 1, 1, 1, 1,
-1.593884, 0.5546024, -0.7745401, 0, 0, 1, 1, 1,
-1.566973, 0.7405968, -2.549616, 1, 0, 0, 1, 1,
-1.56613, 0.5265408, -1.388903, 1, 0, 0, 1, 1,
-1.560652, 0.04312335, -1.453593, 1, 0, 0, 1, 1,
-1.554334, 0.03885449, -1.766213, 1, 0, 0, 1, 1,
-1.540005, -0.4573863, -0.7697166, 1, 0, 0, 1, 1,
-1.532263, 0.8676444, -1.291102, 0, 0, 0, 1, 1,
-1.529172, 2.236049, -0.935573, 0, 0, 0, 1, 1,
-1.520433, 0.126246, -1.443999, 0, 0, 0, 1, 1,
-1.51817, -1.348856, -2.256967, 0, 0, 0, 1, 1,
-1.513269, 0.07111656, -2.645223, 0, 0, 0, 1, 1,
-1.508968, 0.7855222, -1.294134, 0, 0, 0, 1, 1,
-1.496914, -2.331982, -4.038927, 0, 0, 0, 1, 1,
-1.481811, 0.755623, -0.7355407, 1, 1, 1, 1, 1,
-1.481231, -2.878657, -2.518872, 1, 1, 1, 1, 1,
-1.471969, -1.141901, -3.468998, 1, 1, 1, 1, 1,
-1.445499, 0.2106575, -2.536393, 1, 1, 1, 1, 1,
-1.439358, 0.7124375, 1.166239, 1, 1, 1, 1, 1,
-1.412777, -0.04015183, -1.227401, 1, 1, 1, 1, 1,
-1.401184, -0.1973548, -0.3891802, 1, 1, 1, 1, 1,
-1.400702, -0.4461181, -2.641196, 1, 1, 1, 1, 1,
-1.396181, -2.268028, -0.630918, 1, 1, 1, 1, 1,
-1.384494, 0.4980593, -2.143054, 1, 1, 1, 1, 1,
-1.380726, 0.2574201, -2.00272, 1, 1, 1, 1, 1,
-1.370961, 0.7775818, -1.564074, 1, 1, 1, 1, 1,
-1.363731, 0.6719558, -0.2261165, 1, 1, 1, 1, 1,
-1.363603, 0.4125826, -1.718902, 1, 1, 1, 1, 1,
-1.361958, -2.111037, -3.687351, 1, 1, 1, 1, 1,
-1.357797, 0.940882, -0.3091722, 0, 0, 1, 1, 1,
-1.348109, 1.696701, -1.657112, 1, 0, 0, 1, 1,
-1.347759, -0.02385074, -2.856592, 1, 0, 0, 1, 1,
-1.344594, 0.7037808, -1.819311, 1, 0, 0, 1, 1,
-1.336111, -1.896857, -3.937591, 1, 0, 0, 1, 1,
-1.329741, 0.1321403, -1.387932, 1, 0, 0, 1, 1,
-1.329219, 0.7088364, -0.0762459, 0, 0, 0, 1, 1,
-1.328815, -0.1522263, -1.523627, 0, 0, 0, 1, 1,
-1.325904, -1.099005, -1.416587, 0, 0, 0, 1, 1,
-1.323734, 0.579321, 0.2569635, 0, 0, 0, 1, 1,
-1.310267, 1.22176, -1.303925, 0, 0, 0, 1, 1,
-1.309098, -0.5517492, -2.625598, 0, 0, 0, 1, 1,
-1.308591, -0.1433201, -1.833426, 0, 0, 0, 1, 1,
-1.302873, 0.3297123, -2.368825, 1, 1, 1, 1, 1,
-1.30098, -0.9672564, -1.721951, 1, 1, 1, 1, 1,
-1.299299, -0.5421686, 0.2362958, 1, 1, 1, 1, 1,
-1.294203, 1.221524, -1.110867, 1, 1, 1, 1, 1,
-1.290017, 0.2044858, -1.779462, 1, 1, 1, 1, 1,
-1.288372, 0.5179262, -0.7858104, 1, 1, 1, 1, 1,
-1.272252, -0.4112269, -2.944263, 1, 1, 1, 1, 1,
-1.264636, 0.6482287, 0.03000676, 1, 1, 1, 1, 1,
-1.256433, 1.200865, -1.283662, 1, 1, 1, 1, 1,
-1.25373, 0.2114099, -3.071011, 1, 1, 1, 1, 1,
-1.253438, -0.2520327, -2.171208, 1, 1, 1, 1, 1,
-1.249776, 0.4409789, -1.69683, 1, 1, 1, 1, 1,
-1.248536, 0.2173498, -2.056375, 1, 1, 1, 1, 1,
-1.242935, 1.174474, -1.500923, 1, 1, 1, 1, 1,
-1.239956, 0.1680797, -2.764369, 1, 1, 1, 1, 1,
-1.235861, -1.334152, -1.766635, 0, 0, 1, 1, 1,
-1.233968, 2.354911, 0.1298157, 1, 0, 0, 1, 1,
-1.233275, -1.071346, -2.178873, 1, 0, 0, 1, 1,
-1.229759, 0.8580341, -3.197657, 1, 0, 0, 1, 1,
-1.225167, 1.519786, -0.6055095, 1, 0, 0, 1, 1,
-1.223878, 0.2094071, -0.7671649, 1, 0, 0, 1, 1,
-1.217895, -2.085091, -2.375412, 0, 0, 0, 1, 1,
-1.217083, -1.926434, -2.408314, 0, 0, 0, 1, 1,
-1.199786, -0.3523046, -3.389216, 0, 0, 0, 1, 1,
-1.196644, -0.6654769, -2.207281, 0, 0, 0, 1, 1,
-1.195392, 1.269288, -0.7021679, 0, 0, 0, 1, 1,
-1.192161, 0.6088523, -0.5063962, 0, 0, 0, 1, 1,
-1.186914, 2.486125, 0.04842642, 0, 0, 0, 1, 1,
-1.181801, -1.557648, -2.137127, 1, 1, 1, 1, 1,
-1.178598, -1.203727, -3.865082, 1, 1, 1, 1, 1,
-1.173846, -0.4517844, -3.242868, 1, 1, 1, 1, 1,
-1.170989, -2.110641, -4.306753, 1, 1, 1, 1, 1,
-1.170973, -0.09517395, -0.5481889, 1, 1, 1, 1, 1,
-1.167921, -1.800806, -1.450609, 1, 1, 1, 1, 1,
-1.166396, -1.9114, -3.819479, 1, 1, 1, 1, 1,
-1.164068, -1.010404, -3.321779, 1, 1, 1, 1, 1,
-1.163131, 0.7523844, 0.6540694, 1, 1, 1, 1, 1,
-1.162734, 0.008777821, -1.275474, 1, 1, 1, 1, 1,
-1.149567, 0.04487307, -1.859987, 1, 1, 1, 1, 1,
-1.13983, -0.7830359, -1.388404, 1, 1, 1, 1, 1,
-1.132801, -1.692122, -2.900939, 1, 1, 1, 1, 1,
-1.125517, -0.4634549, -1.538346, 1, 1, 1, 1, 1,
-1.124648, -2.167014, -3.182084, 1, 1, 1, 1, 1,
-1.1193, 1.085088, -0.02642571, 0, 0, 1, 1, 1,
-1.116098, -2.867024, -3.68776, 1, 0, 0, 1, 1,
-1.116022, 0.3995525, -0.8847197, 1, 0, 0, 1, 1,
-1.115297, -0.07189163, -1.383248, 1, 0, 0, 1, 1,
-1.112699, 0.0714749, -1.798009, 1, 0, 0, 1, 1,
-1.103804, 0.5307052, -0.6225036, 1, 0, 0, 1, 1,
-1.099548, 1.639501, 0.3244893, 0, 0, 0, 1, 1,
-1.099524, -0.3632672, -1.677651, 0, 0, 0, 1, 1,
-1.097658, 0.3787314, -2.168671, 0, 0, 0, 1, 1,
-1.094489, 0.7458948, -1.224188, 0, 0, 0, 1, 1,
-1.087206, -0.4025013, -0.6979611, 0, 0, 0, 1, 1,
-1.086248, 0.8966702, -1.358222, 0, 0, 0, 1, 1,
-1.071054, 1.153035, -2.42367, 0, 0, 0, 1, 1,
-1.066449, 0.3928411, -1.040837, 1, 1, 1, 1, 1,
-1.063729, 0.3643944, -1.379655, 1, 1, 1, 1, 1,
-1.06367, -0.6425693, -3.292128, 1, 1, 1, 1, 1,
-1.051602, -0.3625118, -0.7768698, 1, 1, 1, 1, 1,
-1.045344, 1.62848, 0.9268524, 1, 1, 1, 1, 1,
-1.036667, 0.08672584, -1.532433, 1, 1, 1, 1, 1,
-1.024937, 0.2945441, -0.9601899, 1, 1, 1, 1, 1,
-1.021031, 1.35403, -0.3023981, 1, 1, 1, 1, 1,
-1.020223, -0.7940805, -2.78775, 1, 1, 1, 1, 1,
-1.018327, 0.5931458, -1.449062, 1, 1, 1, 1, 1,
-1.014247, -0.621591, -1.714051, 1, 1, 1, 1, 1,
-1.011478, 0.3537464, 0.8278, 1, 1, 1, 1, 1,
-1.001318, -0.8835523, -3.371671, 1, 1, 1, 1, 1,
-0.9974604, -0.3291038, -1.277607, 1, 1, 1, 1, 1,
-0.994516, 0.7483303, -0.1500747, 1, 1, 1, 1, 1,
-0.9934034, -0.4427389, -2.715892, 0, 0, 1, 1, 1,
-0.9932649, -0.3515666, -0.3292727, 1, 0, 0, 1, 1,
-0.9908435, 1.805427, -0.5544155, 1, 0, 0, 1, 1,
-0.9903621, 2.941991, -0.8640956, 1, 0, 0, 1, 1,
-0.982985, 1.430092, -0.7556823, 1, 0, 0, 1, 1,
-0.9708181, -0.4087038, -0.5846773, 1, 0, 0, 1, 1,
-0.9663985, -0.2274151, -0.6814358, 0, 0, 0, 1, 1,
-0.9637649, -0.1386964, -1.430694, 0, 0, 0, 1, 1,
-0.9612575, 0.872731, -0.4772393, 0, 0, 0, 1, 1,
-0.9480942, 1.486935, -1.207385, 0, 0, 0, 1, 1,
-0.9436476, 1.219148, -0.07339308, 0, 0, 0, 1, 1,
-0.9431524, -1.918692, -3.050519, 0, 0, 0, 1, 1,
-0.9430707, -0.8165463, -2.575271, 0, 0, 0, 1, 1,
-0.9418251, -0.9743291, -1.776083, 1, 1, 1, 1, 1,
-0.9388275, -0.6823825, -1.602134, 1, 1, 1, 1, 1,
-0.9348261, -0.605338, -2.347556, 1, 1, 1, 1, 1,
-0.9344189, -0.2806287, -0.8409161, 1, 1, 1, 1, 1,
-0.9280664, 1.941798, -0.4046708, 1, 1, 1, 1, 1,
-0.9273183, -1.362608, -3.654613, 1, 1, 1, 1, 1,
-0.9256966, -1.162049, -3.734746, 1, 1, 1, 1, 1,
-0.921977, 1.126785, -1.961168, 1, 1, 1, 1, 1,
-0.9214901, -1.281139, -4.235379, 1, 1, 1, 1, 1,
-0.9108111, 0.6259729, -2.249704, 1, 1, 1, 1, 1,
-0.9106096, 0.7845809, -0.8975567, 1, 1, 1, 1, 1,
-0.9104491, -0.6430833, -2.645527, 1, 1, 1, 1, 1,
-0.9070526, 0.05908572, -1.149615, 1, 1, 1, 1, 1,
-0.9022899, -1.29609, -1.537388, 1, 1, 1, 1, 1,
-0.8983054, -1.048877, -2.35297, 1, 1, 1, 1, 1,
-0.8968948, -0.3709488, -2.360649, 0, 0, 1, 1, 1,
-0.8958083, 1.587983, -0.1414349, 1, 0, 0, 1, 1,
-0.8915066, 0.7447725, -1.760921, 1, 0, 0, 1, 1,
-0.8870823, -0.923331, -2.301149, 1, 0, 0, 1, 1,
-0.8820585, -1.026474, -3.979472, 1, 0, 0, 1, 1,
-0.8782314, -0.007433631, -1.669723, 1, 0, 0, 1, 1,
-0.8723698, 0.3124506, -1.38042, 0, 0, 0, 1, 1,
-0.87222, -1.209081, -1.151506, 0, 0, 0, 1, 1,
-0.8710049, -1.909149, -2.324391, 0, 0, 0, 1, 1,
-0.8704668, -0.9552476, -2.732702, 0, 0, 0, 1, 1,
-0.8669236, 0.8621722, 0.6057714, 0, 0, 0, 1, 1,
-0.8536361, -0.8400776, -3.74719, 0, 0, 0, 1, 1,
-0.8464249, -0.04783195, -1.311108, 0, 0, 0, 1, 1,
-0.8314991, -1.283425, -2.686961, 1, 1, 1, 1, 1,
-0.830028, -0.3202744, -1.403177, 1, 1, 1, 1, 1,
-0.8278505, -0.3665812, -1.302421, 1, 1, 1, 1, 1,
-0.8253422, 1.168159, 0.04421053, 1, 1, 1, 1, 1,
-0.820283, 2.066281, 0.3440608, 1, 1, 1, 1, 1,
-0.8113948, -1.54124, -2.840342, 1, 1, 1, 1, 1,
-0.8075894, -0.2171153, -2.068336, 1, 1, 1, 1, 1,
-0.8020789, 2.045784, -1.290768, 1, 1, 1, 1, 1,
-0.7990533, 0.1094359, 0.7602639, 1, 1, 1, 1, 1,
-0.7918006, 1.178481, 0.7243075, 1, 1, 1, 1, 1,
-0.7882909, -1.480417, -3.154604, 1, 1, 1, 1, 1,
-0.7872841, -0.4587311, -1.447594, 1, 1, 1, 1, 1,
-0.7847804, 0.8313038, -0.3966487, 1, 1, 1, 1, 1,
-0.7794704, -2.761346, -3.82349, 1, 1, 1, 1, 1,
-0.7771088, 1.287694, -0.1010916, 1, 1, 1, 1, 1,
-0.7762872, -1.575235, -1.624007, 0, 0, 1, 1, 1,
-0.7680103, 0.741508, -0.6772081, 1, 0, 0, 1, 1,
-0.7667326, -1.616908, -2.840686, 1, 0, 0, 1, 1,
-0.765631, -0.02393825, -1.883208, 1, 0, 0, 1, 1,
-0.7655157, 1.172224, 0.2731651, 1, 0, 0, 1, 1,
-0.7646343, 0.829901, -1.978411, 1, 0, 0, 1, 1,
-0.7640577, -0.2306394, -2.052485, 0, 0, 0, 1, 1,
-0.7550068, 1.194368, -0.3661047, 0, 0, 0, 1, 1,
-0.7535891, 1.744013, -0.6348345, 0, 0, 0, 1, 1,
-0.7502028, 0.009096985, -1.627274, 0, 0, 0, 1, 1,
-0.7501859, 0.9622618, -2.616202, 0, 0, 0, 1, 1,
-0.7466656, 1.178525, 1.056211, 0, 0, 0, 1, 1,
-0.7384489, 0.2210074, -1.098414, 0, 0, 0, 1, 1,
-0.737705, -0.7127053, -0.1505105, 1, 1, 1, 1, 1,
-0.7337119, -0.7152334, -1.637072, 1, 1, 1, 1, 1,
-0.7320144, 0.08905085, -1.929035, 1, 1, 1, 1, 1,
-0.7294037, -1.719756, -3.104138, 1, 1, 1, 1, 1,
-0.7293052, 1.2626, -0.3219448, 1, 1, 1, 1, 1,
-0.7291806, 0.6433574, 1.818176, 1, 1, 1, 1, 1,
-0.7271953, 1.361423, 0.01914705, 1, 1, 1, 1, 1,
-0.7267293, -1.297273, -3.692257, 1, 1, 1, 1, 1,
-0.725562, 0.772424, -0.9677019, 1, 1, 1, 1, 1,
-0.7241163, 0.7491628, -1.284467, 1, 1, 1, 1, 1,
-0.7212489, -0.9530265, -1.991553, 1, 1, 1, 1, 1,
-0.71662, -1.463487, -4.221292, 1, 1, 1, 1, 1,
-0.7160097, -0.97207, -1.197076, 1, 1, 1, 1, 1,
-0.7151341, -0.2935911, -2.405557, 1, 1, 1, 1, 1,
-0.7142874, 0.6053448, -0.6953788, 1, 1, 1, 1, 1,
-0.7099715, -1.134483, -3.650236, 0, 0, 1, 1, 1,
-0.706597, -0.1498476, -3.739285, 1, 0, 0, 1, 1,
-0.705691, 0.6530187, 0.3788733, 1, 0, 0, 1, 1,
-0.7019103, 0.4805263, -1.410631, 1, 0, 0, 1, 1,
-0.6978986, 0.09889319, -4.367638, 1, 0, 0, 1, 1,
-0.6945147, 0.9325586, -2.425677, 1, 0, 0, 1, 1,
-0.6920484, -0.6806148, -2.661381, 0, 0, 0, 1, 1,
-0.6904619, 1.322935, -0.2619905, 0, 0, 0, 1, 1,
-0.6857665, -0.8157822, -2.341021, 0, 0, 0, 1, 1,
-0.6848208, -0.1320303, -1.456611, 0, 0, 0, 1, 1,
-0.6829264, -0.06328704, -1.897595, 0, 0, 0, 1, 1,
-0.6804373, -1.454559, -1.615893, 0, 0, 0, 1, 1,
-0.6787992, -0.3327344, -2.940019, 0, 0, 0, 1, 1,
-0.6776434, 0.9174067, 0.03941425, 1, 1, 1, 1, 1,
-0.6711307, -1.047012, -3.98818, 1, 1, 1, 1, 1,
-0.6535277, -0.9394289, -2.439934, 1, 1, 1, 1, 1,
-0.6527127, 1.343912, 0.6045395, 1, 1, 1, 1, 1,
-0.650722, 0.6848126, -1.418497, 1, 1, 1, 1, 1,
-0.650616, -2.447823, -2.238894, 1, 1, 1, 1, 1,
-0.6488738, -0.4864053, -2.683388, 1, 1, 1, 1, 1,
-0.6480855, -2.261723, -3.471453, 1, 1, 1, 1, 1,
-0.6447752, -1.168798, -2.217697, 1, 1, 1, 1, 1,
-0.6358123, -0.8847821, -1.358594, 1, 1, 1, 1, 1,
-0.6356295, 0.8455615, -2.127857, 1, 1, 1, 1, 1,
-0.6351398, -2.006267, -0.6871812, 1, 1, 1, 1, 1,
-0.6332181, 0.5536145, -0.7797498, 1, 1, 1, 1, 1,
-0.6265959, -0.3931366, -3.950099, 1, 1, 1, 1, 1,
-0.6257452, -0.1340642, -3.109867, 1, 1, 1, 1, 1,
-0.6238309, 1.369631, 0.07615579, 0, 0, 1, 1, 1,
-0.6206983, 0.7504544, -1.637998, 1, 0, 0, 1, 1,
-0.6203375, -1.183136, -3.101079, 1, 0, 0, 1, 1,
-0.619939, 0.8310338, -0.5162041, 1, 0, 0, 1, 1,
-0.6180059, 0.2151059, 0.1627994, 1, 0, 0, 1, 1,
-0.6167707, 0.3057175, -0.8553066, 1, 0, 0, 1, 1,
-0.616506, -1.668415, -1.160782, 0, 0, 0, 1, 1,
-0.6155346, -1.86584, -1.342069, 0, 0, 0, 1, 1,
-0.6118946, -0.6873215, -3.018362, 0, 0, 0, 1, 1,
-0.604544, -0.9286312, -2.78053, 0, 0, 0, 1, 1,
-0.6024039, 2.251544, 0.09685352, 0, 0, 0, 1, 1,
-0.597464, 1.584136, 0.09987175, 0, 0, 0, 1, 1,
-0.5971699, -0.2399659, -1.501789, 0, 0, 0, 1, 1,
-0.5927439, -0.5287494, -2.409991, 1, 1, 1, 1, 1,
-0.5850173, 0.2997231, -0.2325053, 1, 1, 1, 1, 1,
-0.5801532, -0.2342991, -3.465251, 1, 1, 1, 1, 1,
-0.5769866, 0.5183685, -1.260018, 1, 1, 1, 1, 1,
-0.5760561, 1.644601, 0.003129336, 1, 1, 1, 1, 1,
-0.5715652, 0.4889079, -0.1114368, 1, 1, 1, 1, 1,
-0.5688139, -1.635994, -2.639833, 1, 1, 1, 1, 1,
-0.5668014, 0.5516114, 0.488607, 1, 1, 1, 1, 1,
-0.5667163, -0.6107158, -0.8189284, 1, 1, 1, 1, 1,
-0.565444, 0.8098816, -2.300984, 1, 1, 1, 1, 1,
-0.5593659, -0.5519023, -2.133336, 1, 1, 1, 1, 1,
-0.5580238, 1.323182, -0.3228606, 1, 1, 1, 1, 1,
-0.5499284, -1.341633, -2.259729, 1, 1, 1, 1, 1,
-0.5484217, -0.4357158, -0.4693392, 1, 1, 1, 1, 1,
-0.5470951, 1.066134, -0.3986832, 1, 1, 1, 1, 1,
-0.5463556, 0.3395711, -2.434711, 0, 0, 1, 1, 1,
-0.5438238, 1.366563, -0.1908412, 1, 0, 0, 1, 1,
-0.5412719, 0.6810234, -0.127993, 1, 0, 0, 1, 1,
-0.5405543, 1.02432, -1.585007, 1, 0, 0, 1, 1,
-0.5381846, 0.857098, -1.663868, 1, 0, 0, 1, 1,
-0.5360013, -0.5211033, -1.603913, 1, 0, 0, 1, 1,
-0.533749, -0.5530077, -4.029619, 0, 0, 0, 1, 1,
-0.5332372, 0.2177763, -2.598963, 0, 0, 0, 1, 1,
-0.5311575, 1.793898, -0.5820528, 0, 0, 0, 1, 1,
-0.5276074, 1.346718, -0.3851405, 0, 0, 0, 1, 1,
-0.5250986, 2.263269, -0.4458972, 0, 0, 0, 1, 1,
-0.5204033, 1.1151, -1.70313, 0, 0, 0, 1, 1,
-0.5186313, -1.158098, -2.952801, 0, 0, 0, 1, 1,
-0.5163656, 1.374753, -1.52484, 1, 1, 1, 1, 1,
-0.5155421, -2.043216, -2.346243, 1, 1, 1, 1, 1,
-0.5128761, -0.06918472, -0.2283359, 1, 1, 1, 1, 1,
-0.5128246, -0.3234628, -3.691422, 1, 1, 1, 1, 1,
-0.5108103, -0.3792076, -2.94813, 1, 1, 1, 1, 1,
-0.5076573, -1.007818, -4.29727, 1, 1, 1, 1, 1,
-0.5067522, -0.7999449, -2.775535, 1, 1, 1, 1, 1,
-0.4978091, 0.9708493, 0.5099555, 1, 1, 1, 1, 1,
-0.4972962, 1.749037, -0.4806142, 1, 1, 1, 1, 1,
-0.4932818, 1.022651, 0.8457604, 1, 1, 1, 1, 1,
-0.4914695, -0.4486582, -0.417271, 1, 1, 1, 1, 1,
-0.4914635, -2.018197, -1.451297, 1, 1, 1, 1, 1,
-0.4764484, -1.291662, -1.551701, 1, 1, 1, 1, 1,
-0.4760849, 0.2283986, -1.678417, 1, 1, 1, 1, 1,
-0.4759997, 0.02081074, -1.432953, 1, 1, 1, 1, 1,
-0.4711787, -0.1081436, -2.366988, 0, 0, 1, 1, 1,
-0.4699662, 1.913719, 0.6787984, 1, 0, 0, 1, 1,
-0.466954, -1.609017, -2.96969, 1, 0, 0, 1, 1,
-0.465019, -1.23183, -3.529284, 1, 0, 0, 1, 1,
-0.4610362, -0.4170369, -0.5803206, 1, 0, 0, 1, 1,
-0.4593205, 0.1760141, -0.7792113, 1, 0, 0, 1, 1,
-0.4586205, -0.8186642, -2.427825, 0, 0, 0, 1, 1,
-0.4564674, -0.3595526, -3.248414, 0, 0, 0, 1, 1,
-0.4561917, -0.1473927, -2.716341, 0, 0, 0, 1, 1,
-0.4558413, 1.098295, -1.231986, 0, 0, 0, 1, 1,
-0.4509389, -0.5171894, -3.094557, 0, 0, 0, 1, 1,
-0.4481352, 0.6511713, -0.8069953, 0, 0, 0, 1, 1,
-0.4462592, -1.582734, -3.285764, 0, 0, 0, 1, 1,
-0.4417855, 2.002679, 0.3271112, 1, 1, 1, 1, 1,
-0.4412535, 0.4298212, -1.558054, 1, 1, 1, 1, 1,
-0.4399391, -0.1269546, -1.114174, 1, 1, 1, 1, 1,
-0.4390712, -0.1790737, -3.837452, 1, 1, 1, 1, 1,
-0.4381476, 0.9329841, 1.208026, 1, 1, 1, 1, 1,
-0.4371599, -0.341876, -2.133566, 1, 1, 1, 1, 1,
-0.4333571, 1.038358, -1.559962, 1, 1, 1, 1, 1,
-0.4312959, 1.264475, -0.5844783, 1, 1, 1, 1, 1,
-0.4304736, -0.1192958, -0.9757789, 1, 1, 1, 1, 1,
-0.4300561, 0.8109536, -0.461661, 1, 1, 1, 1, 1,
-0.4300479, -1.576773, -3.85587, 1, 1, 1, 1, 1,
-0.4277461, -1.459445, -4.513572, 1, 1, 1, 1, 1,
-0.4224376, -1.73956, -3.0801, 1, 1, 1, 1, 1,
-0.4145898, 1.341991, 1.322495, 1, 1, 1, 1, 1,
-0.4087787, -1.847973, -3.61233, 1, 1, 1, 1, 1,
-0.406213, 1.389781, -0.05212935, 0, 0, 1, 1, 1,
-0.405944, -1.07265, -3.331455, 1, 0, 0, 1, 1,
-0.4054373, -0.4027579, -3.031021, 1, 0, 0, 1, 1,
-0.4010147, 1.490085, -1.24369, 1, 0, 0, 1, 1,
-0.4004573, 0.1076123, -2.181458, 1, 0, 0, 1, 1,
-0.3949513, 0.7139784, 1.196976, 1, 0, 0, 1, 1,
-0.3938358, -0.3854952, -3.482134, 0, 0, 0, 1, 1,
-0.3923535, -0.1257565, -1.498647, 0, 0, 0, 1, 1,
-0.3872474, -0.3438872, -3.286714, 0, 0, 0, 1, 1,
-0.3851085, 0.3787895, -1.139341, 0, 0, 0, 1, 1,
-0.3819813, -0.9538152, -1.502127, 0, 0, 0, 1, 1,
-0.3807817, -0.1995445, -0.3489521, 0, 0, 0, 1, 1,
-0.3797858, 0.2038451, -1.257136, 0, 0, 0, 1, 1,
-0.3795358, -0.2210339, -1.896213, 1, 1, 1, 1, 1,
-0.3754649, -0.8160189, -2.18799, 1, 1, 1, 1, 1,
-0.373749, 0.1140483, -3.409148, 1, 1, 1, 1, 1,
-0.3661976, -1.465344, -1.790675, 1, 1, 1, 1, 1,
-0.3658395, -1.252528, -2.678931, 1, 1, 1, 1, 1,
-0.3587377, -1.24994, -2.99276, 1, 1, 1, 1, 1,
-0.356786, -1.228861, -1.941375, 1, 1, 1, 1, 1,
-0.3549545, -0.4565721, -2.243464, 1, 1, 1, 1, 1,
-0.3479039, -0.6778784, -2.551639, 1, 1, 1, 1, 1,
-0.3460373, 1.155385, 1.264552, 1, 1, 1, 1, 1,
-0.3413606, -1.918396, -2.704747, 1, 1, 1, 1, 1,
-0.3406568, 0.3703924, -1.021369, 1, 1, 1, 1, 1,
-0.3392446, -0.9485288, -1.167861, 1, 1, 1, 1, 1,
-0.3385141, -1.124623, -3.214326, 1, 1, 1, 1, 1,
-0.3376235, 1.949914, -0.203725, 1, 1, 1, 1, 1,
-0.3374382, 1.158966, 0.8498873, 0, 0, 1, 1, 1,
-0.3365051, -0.4746537, -1.845966, 1, 0, 0, 1, 1,
-0.3356698, -0.1330618, -1.088119, 1, 0, 0, 1, 1,
-0.3345368, 0.1915801, -1.149524, 1, 0, 0, 1, 1,
-0.3258633, -0.4401171, -3.341652, 1, 0, 0, 1, 1,
-0.3242325, 1.148687, 0.5831012, 1, 0, 0, 1, 1,
-0.3226966, -0.2982309, -1.037177, 0, 0, 0, 1, 1,
-0.321236, -0.7492323, -2.105655, 0, 0, 0, 1, 1,
-0.3209683, 0.5731493, 1.027745, 0, 0, 0, 1, 1,
-0.3195428, -0.3027672, -4.34239, 0, 0, 0, 1, 1,
-0.3184115, 0.7807236, -0.5012448, 0, 0, 0, 1, 1,
-0.3180221, -0.8649944, -1.239719, 0, 0, 0, 1, 1,
-0.3139193, 0.6741792, -0.551049, 0, 0, 0, 1, 1,
-0.3138397, -0.2339418, -2.815078, 1, 1, 1, 1, 1,
-0.3082969, -0.4476023, -3.705453, 1, 1, 1, 1, 1,
-0.303088, -0.8740857, -3.429864, 1, 1, 1, 1, 1,
-0.302803, -1.100402, -3.378868, 1, 1, 1, 1, 1,
-0.3012604, -1.313545, -1.634463, 1, 1, 1, 1, 1,
-0.2960188, 0.137677, -1.405018, 1, 1, 1, 1, 1,
-0.2959387, -1.105991, -3.465191, 1, 1, 1, 1, 1,
-0.2930304, -0.7455356, -2.508765, 1, 1, 1, 1, 1,
-0.291031, -0.9957129, -3.008708, 1, 1, 1, 1, 1,
-0.2897888, 0.06088087, -1.348603, 1, 1, 1, 1, 1,
-0.2891507, -1.022892, -2.057102, 1, 1, 1, 1, 1,
-0.2847308, -2.229796, -1.249894, 1, 1, 1, 1, 1,
-0.2841623, -0.8136668, -3.469268, 1, 1, 1, 1, 1,
-0.2827092, -0.254291, -2.616896, 1, 1, 1, 1, 1,
-0.282468, 1.940677, -0.8187979, 1, 1, 1, 1, 1,
-0.2816056, -0.1891201, -3.162724, 0, 0, 1, 1, 1,
-0.2740236, -0.3822334, -2.464386, 1, 0, 0, 1, 1,
-0.2724528, 1.580052, 1.113414, 1, 0, 0, 1, 1,
-0.2703585, 0.86979, 0.5752677, 1, 0, 0, 1, 1,
-0.2669567, -1.146555, -2.881874, 1, 0, 0, 1, 1,
-0.2664311, 0.6816436, -0.3812068, 1, 0, 0, 1, 1,
-0.2653389, 0.9432007, -0.296373, 0, 0, 0, 1, 1,
-0.2643369, 1.908576, -0.3834611, 0, 0, 0, 1, 1,
-0.2593905, 1.013473, -0.6064043, 0, 0, 0, 1, 1,
-0.253181, -0.05945647, -2.079396, 0, 0, 0, 1, 1,
-0.2508955, -2.672964, -3.321584, 0, 0, 0, 1, 1,
-0.242408, -0.9653296, -3.814112, 0, 0, 0, 1, 1,
-0.2396102, -0.07141745, -1.439502, 0, 0, 0, 1, 1,
-0.2374684, 1.149999, -1.245683, 1, 1, 1, 1, 1,
-0.2350275, -0.0320222, -2.208174, 1, 1, 1, 1, 1,
-0.2315482, 0.6061945, -0.7325723, 1, 1, 1, 1, 1,
-0.2260459, -1.16649, -2.515441, 1, 1, 1, 1, 1,
-0.2247388, 0.7125624, -0.4901279, 1, 1, 1, 1, 1,
-0.2206276, -0.2218751, -3.482837, 1, 1, 1, 1, 1,
-0.2195847, 0.6989339, -0.108115, 1, 1, 1, 1, 1,
-0.219528, 0.8229709, 0.3115761, 1, 1, 1, 1, 1,
-0.2155032, -0.008446358, -2.73576, 1, 1, 1, 1, 1,
-0.2154912, -0.739376, -3.644041, 1, 1, 1, 1, 1,
-0.2114328, 0.01269745, -0.3276138, 1, 1, 1, 1, 1,
-0.2099274, -0.4014272, -2.903814, 1, 1, 1, 1, 1,
-0.2052246, -0.3806489, -4.994757, 1, 1, 1, 1, 1,
-0.2051145, -0.7625185, -2.994468, 1, 1, 1, 1, 1,
-0.20265, -0.1589704, -2.680877, 1, 1, 1, 1, 1,
-0.1957781, -1.960823, -4.218213, 0, 0, 1, 1, 1,
-0.1952841, 0.7078233, 0.9870495, 1, 0, 0, 1, 1,
-0.1929731, 0.2060206, -3.303161, 1, 0, 0, 1, 1,
-0.1925035, -0.2580988, -0.902038, 1, 0, 0, 1, 1,
-0.1887372, -0.6774225, -1.88558, 1, 0, 0, 1, 1,
-0.1867108, 1.362767, -0.6692863, 1, 0, 0, 1, 1,
-0.1861503, 0.5332555, -0.4064021, 0, 0, 0, 1, 1,
-0.185946, 0.9990363, 0.274781, 0, 0, 0, 1, 1,
-0.1817931, -1.739611, -3.466898, 0, 0, 0, 1, 1,
-0.1795683, -1.287593, -4.112723, 0, 0, 0, 1, 1,
-0.1772707, -0.7718417, -3.566085, 0, 0, 0, 1, 1,
-0.177043, -0.6513181, -2.772086, 0, 0, 0, 1, 1,
-0.1723399, -0.3423266, -3.174021, 0, 0, 0, 1, 1,
-0.1690677, 0.4557285, -0.3358267, 1, 1, 1, 1, 1,
-0.1682491, 1.179086, 0.2792484, 1, 1, 1, 1, 1,
-0.1638029, 1.077604, -1.17282, 1, 1, 1, 1, 1,
-0.1636011, -0.5609641, -3.776292, 1, 1, 1, 1, 1,
-0.1623213, -0.4017277, -1.784482, 1, 1, 1, 1, 1,
-0.160591, -0.9365299, -3.406265, 1, 1, 1, 1, 1,
-0.1570255, -0.02022379, -0.8955787, 1, 1, 1, 1, 1,
-0.1569705, 0.007516957, -1.5846, 1, 1, 1, 1, 1,
-0.1567806, -0.324278, -2.580446, 1, 1, 1, 1, 1,
-0.1531205, 1.07404, -0.6828808, 1, 1, 1, 1, 1,
-0.1517321, 0.4940827, -0.5629468, 1, 1, 1, 1, 1,
-0.147694, -0.03481492, -0.5262489, 1, 1, 1, 1, 1,
-0.1461199, 0.08824186, 0.1639877, 1, 1, 1, 1, 1,
-0.1452698, 0.9170526, -1.080337, 1, 1, 1, 1, 1,
-0.1422589, 1.153057, -0.7729417, 1, 1, 1, 1, 1,
-0.1409244, 0.9984861, 0.2438259, 0, 0, 1, 1, 1,
-0.1361515, 0.2671441, -1.427338, 1, 0, 0, 1, 1,
-0.1349365, -0.4020873, -1.596523, 1, 0, 0, 1, 1,
-0.1314696, 1.611651, 0.3291073, 1, 0, 0, 1, 1,
-0.1207361, -1.368824, -3.206978, 1, 0, 0, 1, 1,
-0.1162204, -0.3775986, -2.205699, 1, 0, 0, 1, 1,
-0.1140186, 0.6445873, -0.03759206, 0, 0, 0, 1, 1,
-0.1129406, 0.9130977, 0.02782468, 0, 0, 0, 1, 1,
-0.1103234, 1.34292, -0.7976786, 0, 0, 0, 1, 1,
-0.1098306, -0.9869337, -1.609234, 0, 0, 0, 1, 1,
-0.1008001, 1.156141, 0.2621924, 0, 0, 0, 1, 1,
-0.09950649, 1.951904, -1.815586, 0, 0, 0, 1, 1,
-0.09700278, -1.491008, -2.995976, 0, 0, 0, 1, 1,
-0.08961833, -0.4930279, -2.576495, 1, 1, 1, 1, 1,
-0.08895838, 0.9638926, 0.636948, 1, 1, 1, 1, 1,
-0.08448657, 0.05500243, -2.948121, 1, 1, 1, 1, 1,
-0.08053887, 0.2924927, -0.103963, 1, 1, 1, 1, 1,
-0.07460507, 0.8171727, 0.03378479, 1, 1, 1, 1, 1,
-0.06345697, 1.000374, 0.5259933, 1, 1, 1, 1, 1,
-0.06057608, -0.02581838, -1.640599, 1, 1, 1, 1, 1,
-0.05764365, -0.273526, -3.976597, 1, 1, 1, 1, 1,
-0.05668949, 0.7112259, 0.9919696, 1, 1, 1, 1, 1,
-0.05610103, 1.113409, -0.5532181, 1, 1, 1, 1, 1,
-0.05252013, 0.6755072, -0.2233147, 1, 1, 1, 1, 1,
-0.04878897, -0.2879927, -2.60467, 1, 1, 1, 1, 1,
-0.04287746, -0.4906408, -4.271086, 1, 1, 1, 1, 1,
-0.04195854, 0.7607718, 0.6233606, 1, 1, 1, 1, 1,
-0.04155713, -0.4822137, -4.375525, 1, 1, 1, 1, 1,
-0.033698, 2.024213, -1.419607, 0, 0, 1, 1, 1,
-0.03277415, -1.689108, -2.684982, 1, 0, 0, 1, 1,
-0.03016631, 0.2917717, -1.853024, 1, 0, 0, 1, 1,
-0.02965971, 0.7341072, 0.2851999, 1, 0, 0, 1, 1,
-0.02636916, -0.02935397, -0.6715589, 1, 0, 0, 1, 1,
-0.02556508, 1.232063, 3.075461, 1, 0, 0, 1, 1,
-0.02461082, -1.076192, -4.181257, 0, 0, 0, 1, 1,
-0.02262249, -1.218914, -3.336734, 0, 0, 0, 1, 1,
-0.02252032, -0.3332526, -2.522201, 0, 0, 0, 1, 1,
-0.01303587, -0.2100735, -1.733671, 0, 0, 0, 1, 1,
-0.01089695, 0.4671994, 0.7172644, 0, 0, 0, 1, 1,
-0.008111634, -0.04856887, -2.684307, 0, 0, 0, 1, 1,
-0.007276297, 0.02193834, 0.6175812, 0, 0, 0, 1, 1,
-0.004701657, -0.1425022, -2.773269, 1, 1, 1, 1, 1,
-0.002789506, 0.3688643, 0.257915, 1, 1, 1, 1, 1,
-0.001496904, -0.8235799, -2.475738, 1, 1, 1, 1, 1,
0.001745647, -0.7259755, 1.898311, 1, 1, 1, 1, 1,
0.007861294, -0.8363473, 4.882618, 1, 1, 1, 1, 1,
0.008838194, -0.8170581, 4.060745, 1, 1, 1, 1, 1,
0.01150581, -1.692322, 2.876348, 1, 1, 1, 1, 1,
0.01151822, 1.034219, 0.7759768, 1, 1, 1, 1, 1,
0.01239333, 1.160373, 1.570339, 1, 1, 1, 1, 1,
0.01344399, -0.2098469, 3.819923, 1, 1, 1, 1, 1,
0.01468378, 0.4689763, -0.4674139, 1, 1, 1, 1, 1,
0.01854003, 0.7217146, -0.6289269, 1, 1, 1, 1, 1,
0.02195503, 1.489824, 1.652352, 1, 1, 1, 1, 1,
0.02460486, -0.8579142, 2.338162, 1, 1, 1, 1, 1,
0.02738166, 1.732186, 0.8921654, 1, 1, 1, 1, 1,
0.02945752, -0.880131, 3.99807, 0, 0, 1, 1, 1,
0.03269877, -1.538214, 3.576239, 1, 0, 0, 1, 1,
0.03573356, -0.6549326, 2.195189, 1, 0, 0, 1, 1,
0.03823698, 1.904761, 0.9897307, 1, 0, 0, 1, 1,
0.03830361, -0.04674162, 2.497787, 1, 0, 0, 1, 1,
0.04297724, 0.9229714, -0.03903011, 1, 0, 0, 1, 1,
0.04424047, -0.1602703, 3.356918, 0, 0, 0, 1, 1,
0.04503916, -0.2276301, 4.601229, 0, 0, 0, 1, 1,
0.05002428, 0.5448568, 0.2040888, 0, 0, 0, 1, 1,
0.05020032, -2.88286, 5.180589, 0, 0, 0, 1, 1,
0.05389769, -1.899811, 3.744623, 0, 0, 0, 1, 1,
0.05546806, 0.429858, -0.9025147, 0, 0, 0, 1, 1,
0.05832636, 0.2493527, -0.2383317, 0, 0, 0, 1, 1,
0.05926459, 1.222405, -1.345383, 1, 1, 1, 1, 1,
0.06322071, 0.9438628, 1.200629, 1, 1, 1, 1, 1,
0.06655589, -1.286516, 4.625054, 1, 1, 1, 1, 1,
0.06704566, 1.784139, -0.6894188, 1, 1, 1, 1, 1,
0.07004309, 1.459862, -0.8277584, 1, 1, 1, 1, 1,
0.07189719, 0.7379435, -1.370403, 1, 1, 1, 1, 1,
0.07609638, -0.7706209, 3.48411, 1, 1, 1, 1, 1,
0.07650977, -1.155023, 2.747818, 1, 1, 1, 1, 1,
0.0767379, 0.5594972, 0.02295056, 1, 1, 1, 1, 1,
0.07873391, 0.3728625, 0.4380896, 1, 1, 1, 1, 1,
0.08027446, -0.5119979, 3.331365, 1, 1, 1, 1, 1,
0.0855572, 0.469301, 0.9924827, 1, 1, 1, 1, 1,
0.08588708, 0.805665, -0.852576, 1, 1, 1, 1, 1,
0.08655542, 0.3621155, 0.06200885, 1, 1, 1, 1, 1,
0.08805071, -0.6731336, 2.269062, 1, 1, 1, 1, 1,
0.09001929, 0.253077, -1.320273, 0, 0, 1, 1, 1,
0.09206085, -0.5944368, 5.856697, 1, 0, 0, 1, 1,
0.09329963, -0.0224109, 0.98703, 1, 0, 0, 1, 1,
0.09380961, -0.5449831, 3.530925, 1, 0, 0, 1, 1,
0.09397791, -0.8679709, 2.074882, 1, 0, 0, 1, 1,
0.09410947, 1.909582, -1.081842, 1, 0, 0, 1, 1,
0.09445218, -0.008828867, 2.329474, 0, 0, 0, 1, 1,
0.09692865, 1.062789, 0.0007030884, 0, 0, 0, 1, 1,
0.09805552, 1.744141, 0.4860033, 0, 0, 0, 1, 1,
0.09978452, 0.01442034, 0.9273958, 0, 0, 0, 1, 1,
0.1037016, 0.2146721, 0.7602492, 0, 0, 0, 1, 1,
0.103719, 1.18761, 0.503693, 0, 0, 0, 1, 1,
0.1069035, 3.015272, 1.685539, 0, 0, 0, 1, 1,
0.1136886, -0.6634685, 4.652685, 1, 1, 1, 1, 1,
0.1173252, 0.7011958, -0.2731954, 1, 1, 1, 1, 1,
0.1188752, -1.54231, 4.115782, 1, 1, 1, 1, 1,
0.1197024, -0.8056784, 2.20732, 1, 1, 1, 1, 1,
0.1228137, -0.3269824, 2.556734, 1, 1, 1, 1, 1,
0.1241433, 1.432744, 0.4767216, 1, 1, 1, 1, 1,
0.1247424, -0.4648477, 2.399638, 1, 1, 1, 1, 1,
0.127111, 0.3673593, -0.4699934, 1, 1, 1, 1, 1,
0.1313557, -2.559479, 2.349788, 1, 1, 1, 1, 1,
0.1345211, 1.318326, -2.090597, 1, 1, 1, 1, 1,
0.1348796, 0.8690507, -0.3853659, 1, 1, 1, 1, 1,
0.1380693, -1.500526, 4.383205, 1, 1, 1, 1, 1,
0.1434464, -0.2689868, 2.186735, 1, 1, 1, 1, 1,
0.1451278, -1.550431, 3.13297, 1, 1, 1, 1, 1,
0.146777, -2.252706, 4.342224, 1, 1, 1, 1, 1,
0.1492459, -1.143282, 3.571996, 0, 0, 1, 1, 1,
0.1560658, -0.8717669, 3.652581, 1, 0, 0, 1, 1,
0.1583275, -0.6129403, 1.395944, 1, 0, 0, 1, 1,
0.1586502, 0.2362605, 0.4381135, 1, 0, 0, 1, 1,
0.1597245, -0.6176368, 3.057698, 1, 0, 0, 1, 1,
0.1695578, -1.185518, 2.230796, 1, 0, 0, 1, 1,
0.1734442, -0.3487723, 2.725292, 0, 0, 0, 1, 1,
0.1766553, -2.115033, 3.91791, 0, 0, 0, 1, 1,
0.1781644, -1.221792, 3.379073, 0, 0, 0, 1, 1,
0.1783454, 1.022364, 2.418149, 0, 0, 0, 1, 1,
0.1792218, 0.7330934, 0.6901595, 0, 0, 0, 1, 1,
0.1796706, 0.6561382, 1.339129, 0, 0, 0, 1, 1,
0.1800395, 1.315943, 2.173998, 0, 0, 0, 1, 1,
0.1803533, 1.564304, 0.2723995, 1, 1, 1, 1, 1,
0.1808433, -0.2166588, 2.711328, 1, 1, 1, 1, 1,
0.1810899, 1.070282, -1.257046, 1, 1, 1, 1, 1,
0.1820657, -0.124553, 2.984562, 1, 1, 1, 1, 1,
0.1832072, 1.742785, 0.2363842, 1, 1, 1, 1, 1,
0.185235, 0.4024959, 0.6737247, 1, 1, 1, 1, 1,
0.1862842, -1.564767, 2.959528, 1, 1, 1, 1, 1,
0.1919274, -0.1547334, 3.033821, 1, 1, 1, 1, 1,
0.1970103, 0.6504156, 1.6033, 1, 1, 1, 1, 1,
0.1991729, -0.7509361, 0.2722693, 1, 1, 1, 1, 1,
0.1997407, 0.2241953, 0.3795396, 1, 1, 1, 1, 1,
0.202435, 1.009183, -0.3321935, 1, 1, 1, 1, 1,
0.2057071, 1.694498, -1.095106, 1, 1, 1, 1, 1,
0.2093686, 0.5608755, 0.7272018, 1, 1, 1, 1, 1,
0.2114687, -1.217622, 3.845247, 1, 1, 1, 1, 1,
0.212718, 0.2720412, 1.506106, 0, 0, 1, 1, 1,
0.2129454, 0.5110559, 2.11622, 1, 0, 0, 1, 1,
0.2130677, 1.270739, -0.2968872, 1, 0, 0, 1, 1,
0.2135597, -0.8995957, 2.045372, 1, 0, 0, 1, 1,
0.2169238, -1.601069, 3.799276, 1, 0, 0, 1, 1,
0.2181056, -0.1298013, 4.391671, 1, 0, 0, 1, 1,
0.2189636, -0.2866683, 1.769319, 0, 0, 0, 1, 1,
0.2212814, 0.9662147, 0.6825972, 0, 0, 0, 1, 1,
0.2219962, -1.153614, 1.437457, 0, 0, 0, 1, 1,
0.2263431, 1.255208, 0.3174594, 0, 0, 0, 1, 1,
0.2436734, -0.3147244, 2.498091, 0, 0, 0, 1, 1,
0.2437672, -0.2647145, 2.467687, 0, 0, 0, 1, 1,
0.2446913, -1.776776, 3.147238, 0, 0, 0, 1, 1,
0.2511248, 0.4158093, 0.1100565, 1, 1, 1, 1, 1,
0.2516876, 0.8657219, 0.9410043, 1, 1, 1, 1, 1,
0.2548606, 1.152704, 0.5352642, 1, 1, 1, 1, 1,
0.2573072, 1.480097, 0.3539286, 1, 1, 1, 1, 1,
0.2602017, -1.297972, 3.552977, 1, 1, 1, 1, 1,
0.2604131, -0.04487073, 2.822576, 1, 1, 1, 1, 1,
0.2610468, -0.1686301, 0.8697801, 1, 1, 1, 1, 1,
0.2614691, -0.821938, 3.370827, 1, 1, 1, 1, 1,
0.2681159, -0.3715702, 1.10569, 1, 1, 1, 1, 1,
0.2703543, 0.06291329, 1.479667, 1, 1, 1, 1, 1,
0.2721128, -1.735961, 3.980334, 1, 1, 1, 1, 1,
0.2763168, -0.6407752, 2.75508, 1, 1, 1, 1, 1,
0.2777831, 0.1655537, 0.6913623, 1, 1, 1, 1, 1,
0.2796837, 0.6698266, -1.63202, 1, 1, 1, 1, 1,
0.2804213, 0.3332432, 1.900647, 1, 1, 1, 1, 1,
0.280849, 0.6774226, 0.8098027, 0, 0, 1, 1, 1,
0.2822765, -0.1734362, 2.626034, 1, 0, 0, 1, 1,
0.2832938, 0.1080841, -0.03691718, 1, 0, 0, 1, 1,
0.285683, 0.5011361, -0.9774677, 1, 0, 0, 1, 1,
0.2905151, -0.3049008, 3.441506, 1, 0, 0, 1, 1,
0.2906667, 1.153053, -0.3477172, 1, 0, 0, 1, 1,
0.2991016, 0.06898899, 0.4032537, 0, 0, 0, 1, 1,
0.3065492, 0.6503342, 0.06445952, 0, 0, 0, 1, 1,
0.3094452, -1.406265, 1.569502, 0, 0, 0, 1, 1,
0.3099164, -0.2774329, 2.208204, 0, 0, 0, 1, 1,
0.317225, 1.167975, 0.5758537, 0, 0, 0, 1, 1,
0.3216139, -0.3982032, 4.200736, 0, 0, 0, 1, 1,
0.3231658, -0.477697, 2.432378, 0, 0, 0, 1, 1,
0.3290733, -0.03253265, 2.479815, 1, 1, 1, 1, 1,
0.3314292, 1.350185, -0.4564779, 1, 1, 1, 1, 1,
0.3415501, 1.629445, -0.6370816, 1, 1, 1, 1, 1,
0.3428164, -0.1157871, 1.195814, 1, 1, 1, 1, 1,
0.3438464, -0.6925554, 1.945319, 1, 1, 1, 1, 1,
0.3449109, -0.9299923, 3.098491, 1, 1, 1, 1, 1,
0.3456625, -0.3633381, 0.2142308, 1, 1, 1, 1, 1,
0.3461072, 0.9976388, -0.608647, 1, 1, 1, 1, 1,
0.3637441, 1.321468, -0.2438706, 1, 1, 1, 1, 1,
0.3643371, -0.1287852, 0.204696, 1, 1, 1, 1, 1,
0.3675281, 0.5530331, 0.3690559, 1, 1, 1, 1, 1,
0.3729157, -1.55933, 5.325502, 1, 1, 1, 1, 1,
0.3745404, 1.079269, -0.9381632, 1, 1, 1, 1, 1,
0.3769036, -0.9644576, 1.814842, 1, 1, 1, 1, 1,
0.3825976, -1.024199, 2.565605, 1, 1, 1, 1, 1,
0.383278, -0.0003072552, 1.485191, 0, 0, 1, 1, 1,
0.3863443, 0.9045143, 0.3300647, 1, 0, 0, 1, 1,
0.3888579, 0.7778888, 1.133452, 1, 0, 0, 1, 1,
0.3952691, 1.203988, 1.1293, 1, 0, 0, 1, 1,
0.396463, 0.5647386, -0.9243443, 1, 0, 0, 1, 1,
0.4022692, 0.1883597, -1.325404, 1, 0, 0, 1, 1,
0.4029381, -0.5080575, 2.516663, 0, 0, 0, 1, 1,
0.4078378, -0.8928679, 2.700022, 0, 0, 0, 1, 1,
0.4125957, -1.335015, 4.083767, 0, 0, 0, 1, 1,
0.4128453, 1.085884, 1.070668, 0, 0, 0, 1, 1,
0.4129556, 0.6799638, -1.086001, 0, 0, 0, 1, 1,
0.4165903, -0.5918025, 2.572787, 0, 0, 0, 1, 1,
0.4166335, 0.1777013, 1.890314, 0, 0, 0, 1, 1,
0.4200089, -1.529339, 3.181833, 1, 1, 1, 1, 1,
0.422176, 2.255261, -0.3485216, 1, 1, 1, 1, 1,
0.4246367, 0.5608134, 1.286991, 1, 1, 1, 1, 1,
0.4254868, 0.9552073, 1.637626, 1, 1, 1, 1, 1,
0.4304572, -1.068825, 2.36432, 1, 1, 1, 1, 1,
0.4328271, -0.6939821, 2.131615, 1, 1, 1, 1, 1,
0.4357638, -0.5536065, 1.382531, 1, 1, 1, 1, 1,
0.4368952, 1.557346, -1.518758, 1, 1, 1, 1, 1,
0.4377089, -0.1080055, 0.1633242, 1, 1, 1, 1, 1,
0.4417385, 0.62429, 1.17279, 1, 1, 1, 1, 1,
0.4466031, -0.9152794, 1.466423, 1, 1, 1, 1, 1,
0.4498733, 0.2407623, -1.014071, 1, 1, 1, 1, 1,
0.453286, 0.324366, 0.1006116, 1, 1, 1, 1, 1,
0.454455, 0.514062, 1.769433, 1, 1, 1, 1, 1,
0.4549163, 0.2671686, 2.415952, 1, 1, 1, 1, 1,
0.458591, 0.7986273, 1.535199, 0, 0, 1, 1, 1,
0.4630039, -2.32083, 3.530373, 1, 0, 0, 1, 1,
0.46437, 0.6739018, 0.7693091, 1, 0, 0, 1, 1,
0.4650604, -0.1686523, 4.248275, 1, 0, 0, 1, 1,
0.4653757, -1.158999, 1.364565, 1, 0, 0, 1, 1,
0.4674959, -0.2261816, 2.619536, 1, 0, 0, 1, 1,
0.469557, 0.6109952, 0.3968161, 0, 0, 0, 1, 1,
0.4782315, -0.8720251, 3.563125, 0, 0, 0, 1, 1,
0.4840131, 0.8259577, -1.115893, 0, 0, 0, 1, 1,
0.4848361, -0.1948885, 1.364256, 0, 0, 0, 1, 1,
0.4853761, -0.2234972, 3.480412, 0, 0, 0, 1, 1,
0.4940719, 1.721332, 1.376486, 0, 0, 0, 1, 1,
0.4946688, -2.4179, 2.623411, 0, 0, 0, 1, 1,
0.4947394, 1.506293, 0.5541992, 1, 1, 1, 1, 1,
0.4960513, 1.800862, -1.49238, 1, 1, 1, 1, 1,
0.4962422, -0.7131606, 2.312605, 1, 1, 1, 1, 1,
0.4993775, -0.8396587, 1.529348, 1, 1, 1, 1, 1,
0.50116, 2.052848, 0.8322781, 1, 1, 1, 1, 1,
0.5033792, -0.8712723, 3.263514, 1, 1, 1, 1, 1,
0.5038816, -0.5798331, 3.091288, 1, 1, 1, 1, 1,
0.5047043, -0.3921102, 1.566808, 1, 1, 1, 1, 1,
0.5058278, -1.700648, 1.393656, 1, 1, 1, 1, 1,
0.5062633, -1.038006, 1.396194, 1, 1, 1, 1, 1,
0.5070907, -1.012135, 2.799175, 1, 1, 1, 1, 1,
0.5074753, -0.294605, 2.370985, 1, 1, 1, 1, 1,
0.5154793, 0.32153, 1.251613, 1, 1, 1, 1, 1,
0.5251359, 0.4199615, 1.677815, 1, 1, 1, 1, 1,
0.5306253, 0.1381333, 2.670051, 1, 1, 1, 1, 1,
0.5379381, -0.9105676, 2.201494, 0, 0, 1, 1, 1,
0.5402888, 0.6135716, 0.1887449, 1, 0, 0, 1, 1,
0.5405499, 0.3014544, 0.5369162, 1, 0, 0, 1, 1,
0.5415471, -0.9535043, 1.430101, 1, 0, 0, 1, 1,
0.5424007, -0.09859424, 0.6724734, 1, 0, 0, 1, 1,
0.5424628, 0.09803995, 1.127421, 1, 0, 0, 1, 1,
0.5433506, -0.2289333, 2.377857, 0, 0, 0, 1, 1,
0.551219, -1.316953, 2.175999, 0, 0, 0, 1, 1,
0.5665995, 0.3018807, 2.548748, 0, 0, 0, 1, 1,
0.571202, 0.6020578, 1.900152, 0, 0, 0, 1, 1,
0.5782034, 0.5471707, 1.771783, 0, 0, 0, 1, 1,
0.5798871, -0.686222, 3.090988, 0, 0, 0, 1, 1,
0.5836042, 0.2942408, 1.654514, 0, 0, 0, 1, 1,
0.5898543, -0.03995521, 0.8831108, 1, 1, 1, 1, 1,
0.5971363, 1.923377, -0.224806, 1, 1, 1, 1, 1,
0.6019273, -1.047717, 1.922279, 1, 1, 1, 1, 1,
0.6101622, -0.0232252, 0.3133528, 1, 1, 1, 1, 1,
0.6121238, -0.8913751, 2.833285, 1, 1, 1, 1, 1,
0.6170523, -1.244788, 3.113931, 1, 1, 1, 1, 1,
0.6178302, -0.9210758, 4.271393, 1, 1, 1, 1, 1,
0.6189609, 1.930566, -0.8590521, 1, 1, 1, 1, 1,
0.6239738, -0.9465297, 1.613853, 1, 1, 1, 1, 1,
0.6342382, -0.6828939, 1.50339, 1, 1, 1, 1, 1,
0.6356422, 1.728565, 0.3716096, 1, 1, 1, 1, 1,
0.6384491, 0.4778876, 0.3559101, 1, 1, 1, 1, 1,
0.6467939, -0.1062458, 3.095667, 1, 1, 1, 1, 1,
0.6494101, -1.142912, 1.3913, 1, 1, 1, 1, 1,
0.6494405, -0.3651464, 2.330431, 1, 1, 1, 1, 1,
0.6506656, 0.8903285, 1.970463, 0, 0, 1, 1, 1,
0.6569052, 1.560376, 0.6039912, 1, 0, 0, 1, 1,
0.6596982, 1.565231, -0.1524735, 1, 0, 0, 1, 1,
0.6599631, -0.3052806, 2.500909, 1, 0, 0, 1, 1,
0.6659675, 2.32773, -2.453767, 1, 0, 0, 1, 1,
0.6662708, -0.1719874, 0.9797936, 1, 0, 0, 1, 1,
0.6667329, 0.0642536, 1.646445, 0, 0, 0, 1, 1,
0.6725495, 0.003691686, 1.256352, 0, 0, 0, 1, 1,
0.6729062, 0.9940796, -0.8645603, 0, 0, 0, 1, 1,
0.6733698, -0.429245, 0.6128393, 0, 0, 0, 1, 1,
0.6762238, 0.2346233, 0.858601, 0, 0, 0, 1, 1,
0.6774344, -0.4230791, 2.422146, 0, 0, 0, 1, 1,
0.6783868, 0.8107027, 0.8717507, 0, 0, 0, 1, 1,
0.6838274, 1.371555, 1.712011, 1, 1, 1, 1, 1,
0.6840963, 0.1348839, 0.9733502, 1, 1, 1, 1, 1,
0.6853468, -1.012441, 2.376035, 1, 1, 1, 1, 1,
0.6872334, 0.4527719, 2.364168, 1, 1, 1, 1, 1,
0.6883103, 1.803645, -0.6723787, 1, 1, 1, 1, 1,
0.6926097, -0.8745252, 2.273058, 1, 1, 1, 1, 1,
0.6930647, -0.8689404, 1.600702, 1, 1, 1, 1, 1,
0.6968346, 0.652469, 0.5342681, 1, 1, 1, 1, 1,
0.6973534, -1.485175, 3.964824, 1, 1, 1, 1, 1,
0.6997022, 1.37125, 0.2759431, 1, 1, 1, 1, 1,
0.7011926, 0.3712988, 0.1359161, 1, 1, 1, 1, 1,
0.7017741, -1.109517, 4.004105, 1, 1, 1, 1, 1,
0.7027571, -0.7681214, 1.426792, 1, 1, 1, 1, 1,
0.7031565, -0.1893291, 2.049858, 1, 1, 1, 1, 1,
0.7072229, 0.6068894, 1.190868, 1, 1, 1, 1, 1,
0.7092089, -1.21211, 4.392129, 0, 0, 1, 1, 1,
0.7105578, -0.2521401, 2.874423, 1, 0, 0, 1, 1,
0.7165312, -1.089048, 3.580808, 1, 0, 0, 1, 1,
0.7267814, -0.3691261, 2.610811, 1, 0, 0, 1, 1,
0.7334846, 1.481009, 1.28422, 1, 0, 0, 1, 1,
0.7339902, -0.05399102, 0.4555298, 1, 0, 0, 1, 1,
0.7411731, 1.672269, 0.3430795, 0, 0, 0, 1, 1,
0.7458318, 0.9385115, 1.226168, 0, 0, 0, 1, 1,
0.7560262, -0.46705, 2.029207, 0, 0, 0, 1, 1,
0.7568506, 0.6456131, 2.656232, 0, 0, 0, 1, 1,
0.7586766, -1.447616, 2.497514, 0, 0, 0, 1, 1,
0.7656982, -1.797733, 2.467445, 0, 0, 0, 1, 1,
0.767161, 0.04485997, 1.874938, 0, 0, 0, 1, 1,
0.7703645, 0.4591447, -0.4310893, 1, 1, 1, 1, 1,
0.7720218, -0.5584009, 1.0214, 1, 1, 1, 1, 1,
0.776917, 0.1350646, 2.120206, 1, 1, 1, 1, 1,
0.7772507, -0.5218257, 3.070731, 1, 1, 1, 1, 1,
0.7782536, 0.3112646, -1.182436, 1, 1, 1, 1, 1,
0.7783644, -0.6868629, 2.641197, 1, 1, 1, 1, 1,
0.7870172, -1.457423, 3.314127, 1, 1, 1, 1, 1,
0.7917073, -0.4410943, 2.280406, 1, 1, 1, 1, 1,
0.7955359, -0.2456311, 2.042892, 1, 1, 1, 1, 1,
0.7979183, 1.881905, 0.06781781, 1, 1, 1, 1, 1,
0.7994422, 1.048971, 0.3505555, 1, 1, 1, 1, 1,
0.8046214, 0.1624924, 0.7202574, 1, 1, 1, 1, 1,
0.8089128, 0.7276619, 2.739277, 1, 1, 1, 1, 1,
0.8104057, -0.9707739, 2.300205, 1, 1, 1, 1, 1,
0.8173998, 0.7714313, 1.807804, 1, 1, 1, 1, 1,
0.8219246, 0.05571829, 1.070671, 0, 0, 1, 1, 1,
0.8349319, -0.5730854, 2.26586, 1, 0, 0, 1, 1,
0.8357569, -0.548791, 4.075844, 1, 0, 0, 1, 1,
0.8393999, -0.8502549, 2.549126, 1, 0, 0, 1, 1,
0.8438848, -0.2182614, 2.259302, 1, 0, 0, 1, 1,
0.8477871, 0.1927495, 1.63573, 1, 0, 0, 1, 1,
0.849004, -2.185072, 4.800403, 0, 0, 0, 1, 1,
0.8564243, -0.4781213, 3.662065, 0, 0, 0, 1, 1,
0.8621365, 0.6574402, -0.3891593, 0, 0, 0, 1, 1,
0.8639214, -0.5766984, 1.965535, 0, 0, 0, 1, 1,
0.8746608, 1.014339, 1.750047, 0, 0, 0, 1, 1,
0.875375, -2.083642, 3.516676, 0, 0, 0, 1, 1,
0.876753, -0.1313092, 0.003753669, 0, 0, 0, 1, 1,
0.8796423, -0.472266, 3.506253, 1, 1, 1, 1, 1,
0.8869338, 1.912863, -0.3343881, 1, 1, 1, 1, 1,
0.8882543, -1.416851, 3.320588, 1, 1, 1, 1, 1,
0.8886297, -1.280053, 3.029122, 1, 1, 1, 1, 1,
0.8938917, -1.051726, 3.020034, 1, 1, 1, 1, 1,
0.8944178, 1.279654, 0.8816301, 1, 1, 1, 1, 1,
0.8961903, 0.5218146, 2.198051, 1, 1, 1, 1, 1,
0.8987066, -0.5035695, 1.516557, 1, 1, 1, 1, 1,
0.9004602, -0.573339, 3.709807, 1, 1, 1, 1, 1,
0.9084834, 1.586437, 2.14152, 1, 1, 1, 1, 1,
0.9219742, -0.1264891, 2.876347, 1, 1, 1, 1, 1,
0.9236919, -0.9922333, 3.546899, 1, 1, 1, 1, 1,
0.9238742, 0.7187006, -0.05440017, 1, 1, 1, 1, 1,
0.9348947, 0.178421, 2.188349, 1, 1, 1, 1, 1,
0.9380369, 0.3216349, 0.2655434, 1, 1, 1, 1, 1,
0.9402115, 1.405408, -0.3385636, 0, 0, 1, 1, 1,
0.9441418, -1.839214, 2.573968, 1, 0, 0, 1, 1,
0.9470303, -0.6630463, 2.448844, 1, 0, 0, 1, 1,
0.9584541, 1.030393, -0.3049727, 1, 0, 0, 1, 1,
0.9599401, -0.3229175, 3.061083, 1, 0, 0, 1, 1,
0.9665996, -1.065737, 1.695941, 1, 0, 0, 1, 1,
0.9690674, 1.040514, 0.7074161, 0, 0, 0, 1, 1,
0.9752336, -0.2350704, 0.2778345, 0, 0, 0, 1, 1,
0.9775394, 0.8598737, 0.07498476, 0, 0, 0, 1, 1,
0.9810622, 0.05694661, 2.142067, 0, 0, 0, 1, 1,
0.9847892, -0.6703697, 2.227628, 0, 0, 0, 1, 1,
0.9915684, -0.4876237, 0.9749798, 0, 0, 0, 1, 1,
0.9939492, -0.8607492, 1.982089, 0, 0, 0, 1, 1,
0.9961181, -0.5866823, 0.4412974, 1, 1, 1, 1, 1,
1.008495, 1.068964, -0.09460945, 1, 1, 1, 1, 1,
1.008536, -0.8866767, 1.042917, 1, 1, 1, 1, 1,
1.016817, -0.2283069, 0.2319374, 1, 1, 1, 1, 1,
1.023695, 0.1363884, 1.47959, 1, 1, 1, 1, 1,
1.024351, -0.9978993, 2.7853, 1, 1, 1, 1, 1,
1.024712, -1.072577, 1.48828, 1, 1, 1, 1, 1,
1.029936, 0.7064828, -0.003637808, 1, 1, 1, 1, 1,
1.035146, -1.310146, 4.015681, 1, 1, 1, 1, 1,
1.035317, -1.271095, 2.294641, 1, 1, 1, 1, 1,
1.043084, 0.1319504, 2.065556, 1, 1, 1, 1, 1,
1.048768, -0.6869435, 1.632644, 1, 1, 1, 1, 1,
1.049933, -0.8558016, 3.398205, 1, 1, 1, 1, 1,
1.052546, -0.02648759, 1.807904, 1, 1, 1, 1, 1,
1.060422, -0.679661, 1.943287, 1, 1, 1, 1, 1,
1.061834, 0.5259888, 0.7352505, 0, 0, 1, 1, 1,
1.062346, -1.687051, 1.363535, 1, 0, 0, 1, 1,
1.063873, 0.7954255, 1.46385, 1, 0, 0, 1, 1,
1.065724, 1.545659, 0.08398955, 1, 0, 0, 1, 1,
1.071926, -0.7186303, 1.29335, 1, 0, 0, 1, 1,
1.102301, 1.029956, -0.4144434, 1, 0, 0, 1, 1,
1.10723, 0.8286761, 2.010591, 0, 0, 0, 1, 1,
1.111479, 0.8933871, -0.8235933, 0, 0, 0, 1, 1,
1.114075, 1.796011, 1.783202, 0, 0, 0, 1, 1,
1.125327, 0.1733918, 1.945808, 0, 0, 0, 1, 1,
1.127166, -0.06875926, 1.401877, 0, 0, 0, 1, 1,
1.138659, 1.383643, 0.3956739, 0, 0, 0, 1, 1,
1.146446, -0.6495121, 1.397709, 0, 0, 0, 1, 1,
1.152061, 0.7849199, 0.979543, 1, 1, 1, 1, 1,
1.152771, 1.334834, 0.8292338, 1, 1, 1, 1, 1,
1.164044, -1.552499, 4.269516, 1, 1, 1, 1, 1,
1.164377, -0.05801245, 2.25116, 1, 1, 1, 1, 1,
1.191767, 0.6175926, -0.7646627, 1, 1, 1, 1, 1,
1.195921, -0.7826928, 3.063321, 1, 1, 1, 1, 1,
1.205958, 2.255975, 1.273387, 1, 1, 1, 1, 1,
1.209179, -0.264181, 1.454696, 1, 1, 1, 1, 1,
1.21184, -0.1218711, 2.896275, 1, 1, 1, 1, 1,
1.215645, 0.2219081, 0.8231355, 1, 1, 1, 1, 1,
1.221161, 0.4095893, 1.103097, 1, 1, 1, 1, 1,
1.231557, 0.9994256, 2.777047, 1, 1, 1, 1, 1,
1.23701, 0.8280925, 0.08034394, 1, 1, 1, 1, 1,
1.239791, 0.01706745, 0.9918833, 1, 1, 1, 1, 1,
1.265484, 1.142826, -0.5435823, 1, 1, 1, 1, 1,
1.273767, 0.2135435, 2.33095, 0, 0, 1, 1, 1,
1.275201, 0.408978, 0.6244215, 1, 0, 0, 1, 1,
1.276217, -0.6283473, 2.45013, 1, 0, 0, 1, 1,
1.295849, 0.01378668, 0.6387556, 1, 0, 0, 1, 1,
1.298958, 0.405052, 1.731103, 1, 0, 0, 1, 1,
1.315954, -0.630433, 2.601368, 1, 0, 0, 1, 1,
1.32964, -0.05913711, 1.858055, 0, 0, 0, 1, 1,
1.335521, -0.7082339, 1.26902, 0, 0, 0, 1, 1,
1.349432, 0.7387646, 0.8273631, 0, 0, 0, 1, 1,
1.351985, 0.6323634, 1.461421, 0, 0, 0, 1, 1,
1.361283, -0.5016507, 2.05941, 0, 0, 0, 1, 1,
1.37454, 1.446847, -0.2891613, 0, 0, 0, 1, 1,
1.376839, 0.4189459, -0.7771666, 0, 0, 0, 1, 1,
1.385654, 1.106479, 0.6211216, 1, 1, 1, 1, 1,
1.386721, -1.133365, 2.589828, 1, 1, 1, 1, 1,
1.401413, -0.6561672, 1.895241, 1, 1, 1, 1, 1,
1.402771, -1.068904, 1.695903, 1, 1, 1, 1, 1,
1.410488, 0.1748442, 1.650279, 1, 1, 1, 1, 1,
1.423597, -1.391679, 1.546383, 1, 1, 1, 1, 1,
1.432644, 0.5150265, 0.6905169, 1, 1, 1, 1, 1,
1.432894, 1.402457, -0.1199322, 1, 1, 1, 1, 1,
1.432968, -0.8484235, 2.666771, 1, 1, 1, 1, 1,
1.437931, 0.2041413, 3.9497, 1, 1, 1, 1, 1,
1.449911, 0.3229491, 0.9647654, 1, 1, 1, 1, 1,
1.461163, -0.7266816, 4.125867, 1, 1, 1, 1, 1,
1.481894, -1.031519, 2.584412, 1, 1, 1, 1, 1,
1.483782, -0.8182662, 2.792572, 1, 1, 1, 1, 1,
1.484285, -0.2503561, 2.084442, 1, 1, 1, 1, 1,
1.504525, 0.2443563, 2.191886, 0, 0, 1, 1, 1,
1.505886, -0.03571664, 3.118684, 1, 0, 0, 1, 1,
1.517978, -2.406937, 1.999261, 1, 0, 0, 1, 1,
1.524674, 0.6166525, 0.8116491, 1, 0, 0, 1, 1,
1.545433, -0.7935656, 2.873971, 1, 0, 0, 1, 1,
1.5526, 0.1849555, 1.219442, 1, 0, 0, 1, 1,
1.559319, 0.1963423, 1.205039, 0, 0, 0, 1, 1,
1.56157, 1.013761, 1.569704, 0, 0, 0, 1, 1,
1.578954, 0.1919643, 0.6985007, 0, 0, 0, 1, 1,
1.580544, 1.209553, 0.5588953, 0, 0, 0, 1, 1,
1.582089, 0.7572894, 1.445651, 0, 0, 0, 1, 1,
1.601142, -0.2295866, 1.657569, 0, 0, 0, 1, 1,
1.610978, 0.188409, 2.690154, 0, 0, 0, 1, 1,
1.6122, 0.562528, 0.6893694, 1, 1, 1, 1, 1,
1.612717, -0.6252694, 3.331038, 1, 1, 1, 1, 1,
1.633184, 0.1286879, 2.811662, 1, 1, 1, 1, 1,
1.660492, 1.164079, 1.537447, 1, 1, 1, 1, 1,
1.662714, 0.5408287, 1.564051, 1, 1, 1, 1, 1,
1.667638, 1.308681, -0.944679, 1, 1, 1, 1, 1,
1.669618, -0.2278745, 0.8155727, 1, 1, 1, 1, 1,
1.687902, 0.466128, 2.831522, 1, 1, 1, 1, 1,
1.699328, 0.119057, 2.566651, 1, 1, 1, 1, 1,
1.700006, -0.797803, 2.082767, 1, 1, 1, 1, 1,
1.717324, 0.1247848, 1.712399, 1, 1, 1, 1, 1,
1.742159, 0.392887, 0.09020422, 1, 1, 1, 1, 1,
1.754567, -0.2308774, 0.7784664, 1, 1, 1, 1, 1,
1.762336, -1.850176, -0.6892946, 1, 1, 1, 1, 1,
1.796126, 0.1768847, 1.49582, 1, 1, 1, 1, 1,
1.799807, 0.805263, 1.656137, 0, 0, 1, 1, 1,
1.8073, -0.4751926, 1.392815, 1, 0, 0, 1, 1,
1.807407, 0.04666782, 1.989406, 1, 0, 0, 1, 1,
1.816152, 0.3260183, 2.19944, 1, 0, 0, 1, 1,
1.820354, 1.013159, 1.750461, 1, 0, 0, 1, 1,
1.830855, -0.5393932, 3.344795, 1, 0, 0, 1, 1,
1.835941, 1.606185, 0.5202227, 0, 0, 0, 1, 1,
1.841546, 1.184801, 0.5496472, 0, 0, 0, 1, 1,
1.865566, 0.2715422, 3.378142, 0, 0, 0, 1, 1,
1.871674, 1.87565, 0.8849873, 0, 0, 0, 1, 1,
1.874352, -1.333678, 3.190393, 0, 0, 0, 1, 1,
1.874447, -0.6854571, 1.216766, 0, 0, 0, 1, 1,
1.88955, 0.04188916, 1.117417, 0, 0, 0, 1, 1,
1.896588, -0.3192309, 0.8543351, 1, 1, 1, 1, 1,
1.897489, -0.4133489, 1.540185, 1, 1, 1, 1, 1,
1.905085, 2.376505, 0.5909196, 1, 1, 1, 1, 1,
1.909877, 0.1618995, 2.590837, 1, 1, 1, 1, 1,
1.920257, -0.3522063, 1.241798, 1, 1, 1, 1, 1,
1.930132, -2.583913, 2.274489, 1, 1, 1, 1, 1,
1.948637, 0.486122, -1.019345, 1, 1, 1, 1, 1,
1.948884, 1.366572, 1.858142, 1, 1, 1, 1, 1,
1.948977, 0.4311421, 0.8883882, 1, 1, 1, 1, 1,
1.953912, -0.9346274, 0.4684736, 1, 1, 1, 1, 1,
1.954513, 1.450952, 0.08411899, 1, 1, 1, 1, 1,
1.970261, 0.8277654, 1.000221, 1, 1, 1, 1, 1,
2.020726, -0.4043649, 2.292026, 1, 1, 1, 1, 1,
2.03981, 0.663766, 1.691968, 1, 1, 1, 1, 1,
2.053098, -2.348027, 2.311405, 1, 1, 1, 1, 1,
2.057189, 1.249706, 1.001094, 0, 0, 1, 1, 1,
2.064131, 0.8511848, 3.19081, 1, 0, 0, 1, 1,
2.073708, 1.313696, 1.407539, 1, 0, 0, 1, 1,
2.079065, -1.731352, 2.915435, 1, 0, 0, 1, 1,
2.089272, 1.430026, 1.085804, 1, 0, 0, 1, 1,
2.129343, 0.8491724, 1.195002, 1, 0, 0, 1, 1,
2.129556, -1.728966, 1.312879, 0, 0, 0, 1, 1,
2.152045, -0.818541, 0.4579369, 0, 0, 0, 1, 1,
2.236323, 0.9185445, 0.1175307, 0, 0, 0, 1, 1,
2.276634, -0.5072179, 0.8255107, 0, 0, 0, 1, 1,
2.306837, -0.02047025, 2.35476, 0, 0, 0, 1, 1,
2.319839, -1.560416, 1.669932, 0, 0, 0, 1, 1,
2.324583, -0.2389746, 1.846199, 0, 0, 0, 1, 1,
2.341825, -1.6999, 4.132874, 1, 1, 1, 1, 1,
2.397817, -0.6547845, 2.41577, 1, 1, 1, 1, 1,
2.450614, -0.1182506, 1.848067, 1, 1, 1, 1, 1,
2.545559, 1.067177, 0.857972, 1, 1, 1, 1, 1,
2.560186, 1.154499, 1.428067, 1, 1, 1, 1, 1,
2.652816, -1.107983, 2.100137, 1, 1, 1, 1, 1,
2.678661, -1.168124, -0.3136198, 1, 1, 1, 1, 1
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
var radius = 9.535691;
var distance = 33.49371;
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
mvMatrix.translate( 0.4166442, -0.2507552, -0.43097 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.49371);
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
