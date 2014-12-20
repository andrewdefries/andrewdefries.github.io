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
-3.298793, 0.0602992, -1.387787, 1, 0, 0, 1,
-2.93133, -0.6439269, 1.107137, 1, 0.007843138, 0, 1,
-2.782547, 0.4074574, -1.602695, 1, 0.01176471, 0, 1,
-2.729329, -1.119506, -0.3464724, 1, 0.01960784, 0, 1,
-2.698569, 1.67375, -0.8063542, 1, 0.02352941, 0, 1,
-2.674098, 0.0308744, -0.4119654, 1, 0.03137255, 0, 1,
-2.569893, 1.680347, -0.8926038, 1, 0.03529412, 0, 1,
-2.509912, 0.5840414, -0.4938787, 1, 0.04313726, 0, 1,
-2.49059, -0.8849756, -1.75952, 1, 0.04705882, 0, 1,
-2.474763, -0.6639919, -1.278822, 1, 0.05490196, 0, 1,
-2.443408, -0.1467046, -0.8973919, 1, 0.05882353, 0, 1,
-2.42708, 1.766661, 0.09656128, 1, 0.06666667, 0, 1,
-2.415528, 0.4539993, -1.134777, 1, 0.07058824, 0, 1,
-2.331095, -1.35971, -0.54776, 1, 0.07843138, 0, 1,
-2.283934, -0.5638778, -1.455028, 1, 0.08235294, 0, 1,
-2.279834, -0.2084835, -2.363706, 1, 0.09019608, 0, 1,
-2.270275, -0.8812532, -0.9951282, 1, 0.09411765, 0, 1,
-2.261591, 0.8735067, -1.594678, 1, 0.1019608, 0, 1,
-2.227749, -1.152031, -2.609327, 1, 0.1098039, 0, 1,
-2.161272, -0.04601571, -1.358727, 1, 0.1137255, 0, 1,
-2.130152, 1.173792, -0.5561857, 1, 0.1215686, 0, 1,
-2.095108, -1.089882, -2.464976, 1, 0.1254902, 0, 1,
-2.089773, 1.29451, -1.174468, 1, 0.1333333, 0, 1,
-2.062041, -0.642325, -1.547123, 1, 0.1372549, 0, 1,
-2.038258, 0.3576826, -2.20769, 1, 0.145098, 0, 1,
-2.007321, 0.7848701, -2.548955, 1, 0.1490196, 0, 1,
-2.004419, 0.1828339, -0.381265, 1, 0.1568628, 0, 1,
-1.986416, -0.103767, -1.781635, 1, 0.1607843, 0, 1,
-1.974428, 1.146408, 0.3921357, 1, 0.1686275, 0, 1,
-1.970968, -0.1942072, -3.158962, 1, 0.172549, 0, 1,
-1.962788, 0.08005332, -0.877148, 1, 0.1803922, 0, 1,
-1.93744, -1.0597, -4.059702, 1, 0.1843137, 0, 1,
-1.925331, -1.082879, -1.674578, 1, 0.1921569, 0, 1,
-1.921815, -0.737349, -2.083905, 1, 0.1960784, 0, 1,
-1.907014, -0.583352, -2.134112, 1, 0.2039216, 0, 1,
-1.89563, 0.729126, -2.109745, 1, 0.2117647, 0, 1,
-1.862765, 0.6930646, -1.600521, 1, 0.2156863, 0, 1,
-1.859884, -0.3656879, -1.189989, 1, 0.2235294, 0, 1,
-1.842685, 0.3466427, -1.233145, 1, 0.227451, 0, 1,
-1.828041, -0.6184674, -1.779104, 1, 0.2352941, 0, 1,
-1.825985, 0.2146463, -2.056853, 1, 0.2392157, 0, 1,
-1.818009, -0.6347922, 0.4080354, 1, 0.2470588, 0, 1,
-1.791, -0.830604, -4.004518, 1, 0.2509804, 0, 1,
-1.777039, -0.1941545, -3.646169, 1, 0.2588235, 0, 1,
-1.756351, 0.3299535, -1.186147, 1, 0.2627451, 0, 1,
-1.750827, 0.0650479, -2.211293, 1, 0.2705882, 0, 1,
-1.749935, -0.8369943, -3.302944, 1, 0.2745098, 0, 1,
-1.748426, 0.7269599, -1.506633, 1, 0.282353, 0, 1,
-1.747613, -0.8597304, -0.7082011, 1, 0.2862745, 0, 1,
-1.738822, 1.85431, -0.3853839, 1, 0.2941177, 0, 1,
-1.734741, -1.41683, -0.1173716, 1, 0.3019608, 0, 1,
-1.732991, 0.8304714, 1.106841, 1, 0.3058824, 0, 1,
-1.701807, 0.6631894, -2.252322, 1, 0.3137255, 0, 1,
-1.689934, -0.6195665, -2.680845, 1, 0.3176471, 0, 1,
-1.687153, 0.8361212, -2.445648, 1, 0.3254902, 0, 1,
-1.684402, -0.5221581, -2.153959, 1, 0.3294118, 0, 1,
-1.66931, -0.8767254, 0.2141559, 1, 0.3372549, 0, 1,
-1.665332, 1.474989, -1.986222, 1, 0.3411765, 0, 1,
-1.66166, -1.714283, -0.5591329, 1, 0.3490196, 0, 1,
-1.656792, 0.7462019, -1.150882, 1, 0.3529412, 0, 1,
-1.65673, 2.059776, -1.539009, 1, 0.3607843, 0, 1,
-1.611377, 0.9733332, -0.3933456, 1, 0.3647059, 0, 1,
-1.586798, -0.3950347, -1.586622, 1, 0.372549, 0, 1,
-1.57285, -0.9143788, -1.441055, 1, 0.3764706, 0, 1,
-1.5568, 0.2674781, -2.172739, 1, 0.3843137, 0, 1,
-1.546749, 0.2147066, -1.89717, 1, 0.3882353, 0, 1,
-1.543987, -1.021731, -2.701211, 1, 0.3960784, 0, 1,
-1.522972, -0.3094189, -1.351676, 1, 0.4039216, 0, 1,
-1.522489, -1.644993, -2.788144, 1, 0.4078431, 0, 1,
-1.500885, -1.816582, -0.4545779, 1, 0.4156863, 0, 1,
-1.492466, 0.7293574, -0.5610679, 1, 0.4196078, 0, 1,
-1.480889, -1.018512, -1.162179, 1, 0.427451, 0, 1,
-1.477763, 0.7516946, -1.576337, 1, 0.4313726, 0, 1,
-1.476581, 0.6884061, -2.581448, 1, 0.4392157, 0, 1,
-1.465504, -0.6134258, -2.118065, 1, 0.4431373, 0, 1,
-1.463821, -0.4916865, -3.144578, 1, 0.4509804, 0, 1,
-1.455156, 0.9340944, -1.84355, 1, 0.454902, 0, 1,
-1.446718, 0.08648458, -1.668748, 1, 0.4627451, 0, 1,
-1.430601, -1.25293, -2.453871, 1, 0.4666667, 0, 1,
-1.429816, -1.824771, -2.18368, 1, 0.4745098, 0, 1,
-1.418757, -0.9754483, -2.584936, 1, 0.4784314, 0, 1,
-1.416991, 0.299204, -1.292108, 1, 0.4862745, 0, 1,
-1.39727, 0.376086, 0.7680919, 1, 0.4901961, 0, 1,
-1.392337, 0.2238943, -1.300691, 1, 0.4980392, 0, 1,
-1.37939, -0.6280438, -2.11909, 1, 0.5058824, 0, 1,
-1.378801, 1.100461, 0.1261709, 1, 0.509804, 0, 1,
-1.373434, -1.069069, -3.005231, 1, 0.5176471, 0, 1,
-1.36935, -0.8829316, -1.103585, 1, 0.5215687, 0, 1,
-1.368652, -0.4288399, -0.2206852, 1, 0.5294118, 0, 1,
-1.326962, -1.734973, -1.359593, 1, 0.5333334, 0, 1,
-1.323899, -1.269043, -4.735861, 1, 0.5411765, 0, 1,
-1.321684, -2.319665, -4.11392, 1, 0.5450981, 0, 1,
-1.316211, 0.4817658, -1.377097, 1, 0.5529412, 0, 1,
-1.306433, -0.8936554, -1.397479, 1, 0.5568628, 0, 1,
-1.295678, -0.7918096, -2.341805, 1, 0.5647059, 0, 1,
-1.284108, 0.08187209, -3.168824, 1, 0.5686275, 0, 1,
-1.280418, -0.8431711, -2.676259, 1, 0.5764706, 0, 1,
-1.269136, 0.2223034, -1.232099, 1, 0.5803922, 0, 1,
-1.262375, -0.5672513, -0.6075497, 1, 0.5882353, 0, 1,
-1.251614, 2.0237, -1.594995, 1, 0.5921569, 0, 1,
-1.24246, -0.5504317, -2.595626, 1, 0.6, 0, 1,
-1.241576, 0.1264596, -2.736592, 1, 0.6078432, 0, 1,
-1.241344, -0.7360327, -1.639646, 1, 0.6117647, 0, 1,
-1.23954, 1.056287, -0.8652021, 1, 0.6196079, 0, 1,
-1.236197, -0.01228163, -0.6366607, 1, 0.6235294, 0, 1,
-1.227283, -0.1087311, -0.8868851, 1, 0.6313726, 0, 1,
-1.224002, 0.2220318, -1.612327, 1, 0.6352941, 0, 1,
-1.213608, 0.0428384, -0.2159645, 1, 0.6431373, 0, 1,
-1.21236, -0.3985709, -1.169984, 1, 0.6470588, 0, 1,
-1.200187, 2.45186, 0.5357766, 1, 0.654902, 0, 1,
-1.198654, -1.281089, -1.5207, 1, 0.6588235, 0, 1,
-1.197132, -0.01597636, -2.020467, 1, 0.6666667, 0, 1,
-1.195748, 0.8576968, -1.085904, 1, 0.6705883, 0, 1,
-1.191906, 1.502979, 0.2876266, 1, 0.6784314, 0, 1,
-1.185936, 0.4010839, -1.699456, 1, 0.682353, 0, 1,
-1.178383, -1.026886, -2.579724, 1, 0.6901961, 0, 1,
-1.174343, -0.4941359, -1.997104, 1, 0.6941177, 0, 1,
-1.172165, 0.1875104, -0.1413043, 1, 0.7019608, 0, 1,
-1.171493, -0.6969678, -0.6643718, 1, 0.7098039, 0, 1,
-1.163835, -0.02173446, 0.4412281, 1, 0.7137255, 0, 1,
-1.153799, 1.331048, 1.17015, 1, 0.7215686, 0, 1,
-1.143008, -0.9366131, -3.000746, 1, 0.7254902, 0, 1,
-1.142034, 0.8703266, -0.3255238, 1, 0.7333333, 0, 1,
-1.140742, -1.998539, -2.472519, 1, 0.7372549, 0, 1,
-1.14005, -2.195191, -3.544686, 1, 0.7450981, 0, 1,
-1.139593, 1.079032, -0.0613768, 1, 0.7490196, 0, 1,
-1.138405, -1.973969, -1.521769, 1, 0.7568628, 0, 1,
-1.136132, -0.4705131, -1.882732, 1, 0.7607843, 0, 1,
-1.123681, -0.6618487, -0.2737221, 1, 0.7686275, 0, 1,
-1.119976, 0.2156992, -2.634226, 1, 0.772549, 0, 1,
-1.117969, -1.349718, -2.291251, 1, 0.7803922, 0, 1,
-1.10708, 0.4422487, -0.4126119, 1, 0.7843137, 0, 1,
-1.105366, -2.765071, -5.327116, 1, 0.7921569, 0, 1,
-1.093471, -0.1691649, -1.460752, 1, 0.7960784, 0, 1,
-1.091735, -0.9826332, -4.713561, 1, 0.8039216, 0, 1,
-1.089981, 0.7884986, -1.404999, 1, 0.8117647, 0, 1,
-1.088755, 0.7333893, -1.896438, 1, 0.8156863, 0, 1,
-1.084605, 0.2122328, -0.7437357, 1, 0.8235294, 0, 1,
-1.082314, -0.4882149, -2.030593, 1, 0.827451, 0, 1,
-1.08125, -0.520883, -2.292712, 1, 0.8352941, 0, 1,
-1.080447, 0.5404043, -1.031853, 1, 0.8392157, 0, 1,
-1.078911, 0.6588451, -1.369318, 1, 0.8470588, 0, 1,
-1.07242, -0.7101271, -1.912652, 1, 0.8509804, 0, 1,
-1.067022, -1.274594, -1.249936, 1, 0.8588235, 0, 1,
-1.066575, 0.84069, -0.2925319, 1, 0.8627451, 0, 1,
-1.060668, 0.2052126, -0.3982078, 1, 0.8705882, 0, 1,
-1.052405, -1.225117, -3.764436, 1, 0.8745098, 0, 1,
-1.051041, -0.6697184, -2.434443, 1, 0.8823529, 0, 1,
-1.048998, -0.3357289, -1.38644, 1, 0.8862745, 0, 1,
-1.048428, -0.2682337, -3.058162, 1, 0.8941177, 0, 1,
-1.043353, 0.3118153, 0.4284566, 1, 0.8980392, 0, 1,
-1.040446, -1.166232, -3.222281, 1, 0.9058824, 0, 1,
-1.039719, 1.539865, -1.721444, 1, 0.9137255, 0, 1,
-1.034088, 1.184308, -2.069748, 1, 0.9176471, 0, 1,
-1.03271, -0.1587933, -1.813723, 1, 0.9254902, 0, 1,
-1.028415, -0.6816716, -0.9374805, 1, 0.9294118, 0, 1,
-1.028244, -1.600166, -3.284443, 1, 0.9372549, 0, 1,
-1.02552, 0.4312604, -0.9577859, 1, 0.9411765, 0, 1,
-1.023332, 1.451609, -0.40927, 1, 0.9490196, 0, 1,
-1.017464, 0.521033, -1.13254, 1, 0.9529412, 0, 1,
-1.011678, -0.1211288, -2.451744, 1, 0.9607843, 0, 1,
-1.011318, -0.9056709, -2.838199, 1, 0.9647059, 0, 1,
-1.006884, -0.5197399, -2.261751, 1, 0.972549, 0, 1,
-1.005519, 0.4038749, -2.28942, 1, 0.9764706, 0, 1,
-1.0033, -0.08664946, -0.7265336, 1, 0.9843137, 0, 1,
-0.9921468, 0.9550169, -1.780118, 1, 0.9882353, 0, 1,
-0.9883271, 0.3056076, -1.745516, 1, 0.9960784, 0, 1,
-0.9814633, 0.6373981, -1.453221, 0.9960784, 1, 0, 1,
-0.9798153, 0.07588825, -1.704296, 0.9921569, 1, 0, 1,
-0.9771754, 0.1034091, -1.051646, 0.9843137, 1, 0, 1,
-0.9731182, -0.7791012, -2.16154, 0.9803922, 1, 0, 1,
-0.9623247, 1.762781, -2.299473, 0.972549, 1, 0, 1,
-0.9576755, -1.914367, -2.596233, 0.9686275, 1, 0, 1,
-0.9568985, -1.388866, -2.762486, 0.9607843, 1, 0, 1,
-0.9485865, 0.1164722, -1.716426, 0.9568627, 1, 0, 1,
-0.9457074, 0.6848172, 0.14381, 0.9490196, 1, 0, 1,
-0.945064, 0.7026992, -1.562726, 0.945098, 1, 0, 1,
-0.9420285, 1.42767, 0.0333463, 0.9372549, 1, 0, 1,
-0.9411862, 0.5905141, -3.792104, 0.9333333, 1, 0, 1,
-0.9407008, -2.551781, -1.139727, 0.9254902, 1, 0, 1,
-0.9390219, 0.4643483, -0.9181376, 0.9215686, 1, 0, 1,
-0.9271211, 1.956854, 0.8976213, 0.9137255, 1, 0, 1,
-0.9212557, 1.035388, -1.406348, 0.9098039, 1, 0, 1,
-0.9200946, -0.8296486, -2.076344, 0.9019608, 1, 0, 1,
-0.9162008, -0.962339, -2.677783, 0.8941177, 1, 0, 1,
-0.9143078, 0.02107337, -1.945593, 0.8901961, 1, 0, 1,
-0.9143038, -1.598028, -2.476002, 0.8823529, 1, 0, 1,
-0.9099561, 1.803007, -1.621586, 0.8784314, 1, 0, 1,
-0.9093633, 0.9407408, -0.4653856, 0.8705882, 1, 0, 1,
-0.9080798, 0.1827394, -1.221224, 0.8666667, 1, 0, 1,
-0.8963125, 0.443137, 0.06856363, 0.8588235, 1, 0, 1,
-0.890597, -0.9089065, -3.401644, 0.854902, 1, 0, 1,
-0.8839323, -1.526403, -2.022401, 0.8470588, 1, 0, 1,
-0.8823209, -0.2960183, -1.285273, 0.8431373, 1, 0, 1,
-0.8791705, -1.19453, -1.079538, 0.8352941, 1, 0, 1,
-0.8749132, -0.1962338, -2.063607, 0.8313726, 1, 0, 1,
-0.8747029, -0.6831053, -1.950483, 0.8235294, 1, 0, 1,
-0.8674805, 1.709038, 0.05766815, 0.8196079, 1, 0, 1,
-0.8577958, -0.8458876, -1.26839, 0.8117647, 1, 0, 1,
-0.8562, -0.2344658, -2.565794, 0.8078431, 1, 0, 1,
-0.8528903, -0.6585338, -1.937296, 0.8, 1, 0, 1,
-0.852533, 1.232374, -2.062118, 0.7921569, 1, 0, 1,
-0.8413793, -0.04411578, -1.856008, 0.7882353, 1, 0, 1,
-0.8403408, -0.4408354, -1.496453, 0.7803922, 1, 0, 1,
-0.8355066, -0.5589567, -2.345279, 0.7764706, 1, 0, 1,
-0.8279448, -2.471851, -2.1051, 0.7686275, 1, 0, 1,
-0.8256829, -1.724164, -3.336034, 0.7647059, 1, 0, 1,
-0.8180144, -0.9163495, -3.265119, 0.7568628, 1, 0, 1,
-0.8110955, 0.6332496, -2.658461, 0.7529412, 1, 0, 1,
-0.8068363, -0.5160692, -1.060582, 0.7450981, 1, 0, 1,
-0.8064101, -0.7604027, -2.699559, 0.7411765, 1, 0, 1,
-0.8020107, -1.191419, -2.802781, 0.7333333, 1, 0, 1,
-0.7983775, 0.2097635, -1.343088, 0.7294118, 1, 0, 1,
-0.797964, -0.5937582, -4.049379, 0.7215686, 1, 0, 1,
-0.7937391, 0.410068, -2.536423, 0.7176471, 1, 0, 1,
-0.7911177, 0.899344, 0.02888538, 0.7098039, 1, 0, 1,
-0.7863725, -0.04307664, -3.499876, 0.7058824, 1, 0, 1,
-0.7851107, 0.3476279, -1.149461, 0.6980392, 1, 0, 1,
-0.7809488, 0.333857, -0.9563603, 0.6901961, 1, 0, 1,
-0.7779269, -2.31037, -3.319052, 0.6862745, 1, 0, 1,
-0.7705098, 1.757127, 0.2179762, 0.6784314, 1, 0, 1,
-0.7696207, 0.839215, -1.685046, 0.6745098, 1, 0, 1,
-0.7689701, 0.1598299, -3.67711, 0.6666667, 1, 0, 1,
-0.7677614, -0.8197382, 0.6663683, 0.6627451, 1, 0, 1,
-0.7634224, 0.680126, -0.4843098, 0.654902, 1, 0, 1,
-0.7627973, 0.6854727, 0.0259563, 0.6509804, 1, 0, 1,
-0.7597553, -0.5527639, -1.632176, 0.6431373, 1, 0, 1,
-0.7557732, 0.4343802, -1.211999, 0.6392157, 1, 0, 1,
-0.7458414, 1.533505, -1.125636, 0.6313726, 1, 0, 1,
-0.7351602, 0.05303387, -1.460429, 0.627451, 1, 0, 1,
-0.7305489, 0.4128258, -0.9034501, 0.6196079, 1, 0, 1,
-0.7259734, -0.3697861, -3.322323, 0.6156863, 1, 0, 1,
-0.7231175, 1.76039, 2.310264, 0.6078432, 1, 0, 1,
-0.7212921, -0.9599357, -2.156633, 0.6039216, 1, 0, 1,
-0.720856, -0.4546104, -2.253717, 0.5960785, 1, 0, 1,
-0.7186806, 0.2257396, -1.328861, 0.5882353, 1, 0, 1,
-0.7180419, -1.444008, -1.822409, 0.5843138, 1, 0, 1,
-0.7157963, -1.233667, -3.129951, 0.5764706, 1, 0, 1,
-0.714695, 0.6172587, -1.127357, 0.572549, 1, 0, 1,
-0.7112591, 1.200828, -0.1291024, 0.5647059, 1, 0, 1,
-0.7094014, 0.8733484, -1.988186, 0.5607843, 1, 0, 1,
-0.7020525, -2.115286, -3.652694, 0.5529412, 1, 0, 1,
-0.6932878, -1.87832, -0.5922137, 0.5490196, 1, 0, 1,
-0.6840727, -0.4146762, -0.7350047, 0.5411765, 1, 0, 1,
-0.6804798, 0.2487117, -1.149895, 0.5372549, 1, 0, 1,
-0.6746006, 0.9953191, -0.03456361, 0.5294118, 1, 0, 1,
-0.652934, 0.9244263, -0.6238039, 0.5254902, 1, 0, 1,
-0.6480279, 0.1058027, -1.988362, 0.5176471, 1, 0, 1,
-0.6470581, -1.163056, -0.9220567, 0.5137255, 1, 0, 1,
-0.6279826, -0.6117306, -3.073213, 0.5058824, 1, 0, 1,
-0.6209385, 0.7751607, -1.594324, 0.5019608, 1, 0, 1,
-0.6165072, 1.115918, -0.8803759, 0.4941176, 1, 0, 1,
-0.6119771, 1.208482, -0.2411159, 0.4862745, 1, 0, 1,
-0.609025, -0.8036901, -2.592134, 0.4823529, 1, 0, 1,
-0.6087288, -0.08718895, -2.406659, 0.4745098, 1, 0, 1,
-0.6083009, 0.2807553, -1.499853, 0.4705882, 1, 0, 1,
-0.6046972, 0.1690569, -0.01930794, 0.4627451, 1, 0, 1,
-0.6004141, 0.4577617, -0.1372286, 0.4588235, 1, 0, 1,
-0.5972109, 2.175449, -0.8287905, 0.4509804, 1, 0, 1,
-0.5892563, -0.2530522, -0.2066824, 0.4470588, 1, 0, 1,
-0.5879815, 0.1430614, -1.465131, 0.4392157, 1, 0, 1,
-0.5864789, 0.2225144, 0.2608516, 0.4352941, 1, 0, 1,
-0.5862983, -0.0989218, -0.9266446, 0.427451, 1, 0, 1,
-0.5855738, -0.9966003, -3.693908, 0.4235294, 1, 0, 1,
-0.584635, 0.6728561, -0.8878064, 0.4156863, 1, 0, 1,
-0.5832208, -0.7748561, -2.539367, 0.4117647, 1, 0, 1,
-0.5816249, 0.461503, -1.445974, 0.4039216, 1, 0, 1,
-0.5794987, 0.4792712, 0.1163549, 0.3960784, 1, 0, 1,
-0.573553, -1.072103, -2.900699, 0.3921569, 1, 0, 1,
-0.5698108, 0.57316, -0.2212269, 0.3843137, 1, 0, 1,
-0.5609891, -0.0257191, -1.860583, 0.3803922, 1, 0, 1,
-0.5593618, -0.1851012, -3.468613, 0.372549, 1, 0, 1,
-0.5543813, -0.2326927, -2.524007, 0.3686275, 1, 0, 1,
-0.5493435, -1.710103, -2.341128, 0.3607843, 1, 0, 1,
-0.5446383, -0.5897583, -2.509341, 0.3568628, 1, 0, 1,
-0.541272, -0.5088987, -3.018146, 0.3490196, 1, 0, 1,
-0.5411111, -0.7420689, -3.377077, 0.345098, 1, 0, 1,
-0.531769, -0.2004035, -1.826654, 0.3372549, 1, 0, 1,
-0.529335, -0.5165714, -2.038905, 0.3333333, 1, 0, 1,
-0.5233995, 1.028436, -2.079864, 0.3254902, 1, 0, 1,
-0.5206308, -0.1956032, -0.8453882, 0.3215686, 1, 0, 1,
-0.5184592, 0.7074936, -1.257538, 0.3137255, 1, 0, 1,
-0.5179861, 1.606987, -0.1133315, 0.3098039, 1, 0, 1,
-0.5169616, -0.4831099, -2.42302, 0.3019608, 1, 0, 1,
-0.5152178, 0.8418554, -0.2212602, 0.2941177, 1, 0, 1,
-0.5086477, -0.2753327, -1.111664, 0.2901961, 1, 0, 1,
-0.5082515, 2.181448, -0.712783, 0.282353, 1, 0, 1,
-0.5062348, 1.533928, -1.777956, 0.2784314, 1, 0, 1,
-0.5015998, -0.7465298, -2.218146, 0.2705882, 1, 0, 1,
-0.4967923, -0.7314301, -3.185063, 0.2666667, 1, 0, 1,
-0.495957, 0.1702615, -2.933089, 0.2588235, 1, 0, 1,
-0.4953786, 0.3327716, -1.277515, 0.254902, 1, 0, 1,
-0.4919261, 0.6221585, -1.963371, 0.2470588, 1, 0, 1,
-0.4918597, 1.171946, -2.906961, 0.2431373, 1, 0, 1,
-0.4908913, -0.5527752, -3.970125, 0.2352941, 1, 0, 1,
-0.4888137, 1.514961, 1.030181, 0.2313726, 1, 0, 1,
-0.4862261, -0.9514498, -1.569528, 0.2235294, 1, 0, 1,
-0.4859424, 1.47747, -0.3450686, 0.2196078, 1, 0, 1,
-0.4850475, -0.591037, -1.659241, 0.2117647, 1, 0, 1,
-0.4849571, 0.4085888, -0.3052183, 0.2078431, 1, 0, 1,
-0.483492, -1.907668, -0.8133528, 0.2, 1, 0, 1,
-0.4809775, 0.08213329, -0.9196429, 0.1921569, 1, 0, 1,
-0.480534, 0.2892146, -1.28412, 0.1882353, 1, 0, 1,
-0.4802145, -0.4652232, -2.333928, 0.1803922, 1, 0, 1,
-0.4784297, 0.5982112, -0.1989035, 0.1764706, 1, 0, 1,
-0.4781021, -0.451577, -2.417836, 0.1686275, 1, 0, 1,
-0.4706163, -0.4135701, -1.614893, 0.1647059, 1, 0, 1,
-0.4700264, 0.1117392, -2.250008, 0.1568628, 1, 0, 1,
-0.4643897, 0.1052994, -2.0167, 0.1529412, 1, 0, 1,
-0.462536, -0.1759448, -1.836796, 0.145098, 1, 0, 1,
-0.4605344, -0.7508802, -2.930924, 0.1411765, 1, 0, 1,
-0.4548976, 0.5504313, -1.669442, 0.1333333, 1, 0, 1,
-0.4535309, 0.0685318, -1.525329, 0.1294118, 1, 0, 1,
-0.4517515, -0.5213512, -0.8476733, 0.1215686, 1, 0, 1,
-0.449034, -0.7337907, -2.841328, 0.1176471, 1, 0, 1,
-0.4415784, 0.1610316, 0.2658079, 0.1098039, 1, 0, 1,
-0.4365438, -0.4291663, -3.053674, 0.1058824, 1, 0, 1,
-0.4323535, -2.037033, -4.265384, 0.09803922, 1, 0, 1,
-0.4311434, -0.06299736, -2.047537, 0.09019608, 1, 0, 1,
-0.4253493, -1.241239, -3.803239, 0.08627451, 1, 0, 1,
-0.4248564, 0.4232435, -1.03565, 0.07843138, 1, 0, 1,
-0.4245825, 0.5772767, -2.47721, 0.07450981, 1, 0, 1,
-0.417711, -0.3688801, -1.633173, 0.06666667, 1, 0, 1,
-0.411424, -1.433886, -2.97246, 0.0627451, 1, 0, 1,
-0.4080105, 0.04849572, -1.050191, 0.05490196, 1, 0, 1,
-0.4057948, -0.550935, -2.787025, 0.05098039, 1, 0, 1,
-0.4048374, 0.7283726, -1.603781, 0.04313726, 1, 0, 1,
-0.4018444, 0.6509895, -0.9194104, 0.03921569, 1, 0, 1,
-0.4016454, -1.66339, -3.449104, 0.03137255, 1, 0, 1,
-0.4002576, -0.01048705, -0.9538846, 0.02745098, 1, 0, 1,
-0.3843577, -1.408212, -4.308999, 0.01960784, 1, 0, 1,
-0.3799555, -0.3311274, -2.07082, 0.01568628, 1, 0, 1,
-0.3769907, 0.9945432, -0.797375, 0.007843138, 1, 0, 1,
-0.3767111, -0.5082867, -2.654044, 0.003921569, 1, 0, 1,
-0.3720623, 0.3807071, -2.722774, 0, 1, 0.003921569, 1,
-0.3653224, 0.4765096, -1.769535, 0, 1, 0.01176471, 1,
-0.3645746, 1.160423, -0.9558078, 0, 1, 0.01568628, 1,
-0.361852, -1.346004, -4.944448, 0, 1, 0.02352941, 1,
-0.3519722, 0.0418986, -1.45008, 0, 1, 0.02745098, 1,
-0.3515282, 0.3831865, -2.173515, 0, 1, 0.03529412, 1,
-0.3498761, -0.297218, -1.576087, 0, 1, 0.03921569, 1,
-0.3487152, 0.624507, 1.585871, 0, 1, 0.04705882, 1,
-0.340891, -1.045453, -3.435211, 0, 1, 0.05098039, 1,
-0.3363921, -0.009467981, -0.3029, 0, 1, 0.05882353, 1,
-0.3348515, -0.343484, -4.33794, 0, 1, 0.0627451, 1,
-0.3347705, 0.9529219, -0.5373341, 0, 1, 0.07058824, 1,
-0.3346726, 1.021281, -0.44733, 0, 1, 0.07450981, 1,
-0.3315924, -0.7496796, -1.996122, 0, 1, 0.08235294, 1,
-0.3268779, -0.2178347, -2.152274, 0, 1, 0.08627451, 1,
-0.3259414, -0.4484815, -1.489501, 0, 1, 0.09411765, 1,
-0.3247251, -0.9037671, -1.060255, 0, 1, 0.1019608, 1,
-0.3207626, -0.6181167, -1.658064, 0, 1, 0.1058824, 1,
-0.3197782, 1.334211, -0.455858, 0, 1, 0.1137255, 1,
-0.3192262, -0.05559843, -1.811889, 0, 1, 0.1176471, 1,
-0.3190071, 0.2073609, -1.357261, 0, 1, 0.1254902, 1,
-0.317209, -1.633934, -2.473826, 0, 1, 0.1294118, 1,
-0.3146012, -0.2076218, -1.729645, 0, 1, 0.1372549, 1,
-0.3143269, -0.7459909, -2.647419, 0, 1, 0.1411765, 1,
-0.3070296, 0.3067421, -1.027164, 0, 1, 0.1490196, 1,
-0.3070181, -0.9945351, -3.303561, 0, 1, 0.1529412, 1,
-0.3039498, 0.5533278, -0.2107739, 0, 1, 0.1607843, 1,
-0.2996757, -0.8219916, -1.54007, 0, 1, 0.1647059, 1,
-0.2994549, 0.554477, 1.637638, 0, 1, 0.172549, 1,
-0.295674, 0.4237772, 0.8283177, 0, 1, 0.1764706, 1,
-0.2947482, -1.305364, -2.608679, 0, 1, 0.1843137, 1,
-0.2945823, 0.54668, 0.2269786, 0, 1, 0.1882353, 1,
-0.2919873, 0.2188154, -2.133093, 0, 1, 0.1960784, 1,
-0.2888863, -0.1842129, -3.744373, 0, 1, 0.2039216, 1,
-0.287613, 0.01384106, -1.149055, 0, 1, 0.2078431, 1,
-0.2780852, 1.439421, -0.2847163, 0, 1, 0.2156863, 1,
-0.277369, -0.2287475, -1.725718, 0, 1, 0.2196078, 1,
-0.2714495, 0.04719502, -0.05637854, 0, 1, 0.227451, 1,
-0.2696122, -0.7992553, -2.174632, 0, 1, 0.2313726, 1,
-0.2690624, 2.019497, -0.3316278, 0, 1, 0.2392157, 1,
-0.2683737, -0.2837866, -2.627969, 0, 1, 0.2431373, 1,
-0.2680376, -0.2526001, -1.577028, 0, 1, 0.2509804, 1,
-0.2667714, 0.2712396, -0.4503396, 0, 1, 0.254902, 1,
-0.2634274, -0.7170141, -3.554368, 0, 1, 0.2627451, 1,
-0.2618365, -0.6719123, -2.320446, 0, 1, 0.2666667, 1,
-0.2602144, -0.4425261, -3.088045, 0, 1, 0.2745098, 1,
-0.2595732, 2.320067, -2.210606, 0, 1, 0.2784314, 1,
-0.2579461, 1.135977, 0.4429021, 0, 1, 0.2862745, 1,
-0.2568517, 0.3829125, -0.2650195, 0, 1, 0.2901961, 1,
-0.2514795, 0.443594, 0.6996818, 0, 1, 0.2980392, 1,
-0.2490981, -1.182648, -2.432533, 0, 1, 0.3058824, 1,
-0.2441721, 0.1168662, -2.075502, 0, 1, 0.3098039, 1,
-0.240841, -1.368799, -2.042533, 0, 1, 0.3176471, 1,
-0.2370195, -0.1729426, -0.2492064, 0, 1, 0.3215686, 1,
-0.2361768, -0.1942396, -3.957167, 0, 1, 0.3294118, 1,
-0.2355616, 0.8823988, 0.03827413, 0, 1, 0.3333333, 1,
-0.2347929, -0.4442426, -2.609411, 0, 1, 0.3411765, 1,
-0.2313915, 0.007658696, -3.364874, 0, 1, 0.345098, 1,
-0.2308331, -1.089673, -3.565082, 0, 1, 0.3529412, 1,
-0.2294425, -0.2644256, -3.873675, 0, 1, 0.3568628, 1,
-0.2257753, 0.1710153, -3.447198, 0, 1, 0.3647059, 1,
-0.224226, 0.9391617, 1.068684, 0, 1, 0.3686275, 1,
-0.2217237, -0.7722784, -2.075661, 0, 1, 0.3764706, 1,
-0.2162874, -1.542387, -2.965109, 0, 1, 0.3803922, 1,
-0.2138968, -1.129987, -3.025611, 0, 1, 0.3882353, 1,
-0.2131464, -0.4587115, -2.997063, 0, 1, 0.3921569, 1,
-0.2112343, 1.091084, -0.6573092, 0, 1, 0.4, 1,
-0.2098159, -1.0677, -3.443297, 0, 1, 0.4078431, 1,
-0.2084381, 1.925586, 0.4862924, 0, 1, 0.4117647, 1,
-0.2050947, 0.2732218, -0.8322713, 0, 1, 0.4196078, 1,
-0.2045421, 1.183897, 0.7060127, 0, 1, 0.4235294, 1,
-0.1983158, 0.04991435, -1.302525, 0, 1, 0.4313726, 1,
-0.1979319, 0.539791, -0.776774, 0, 1, 0.4352941, 1,
-0.1964066, -0.8165605, -4.116172, 0, 1, 0.4431373, 1,
-0.1955841, 0.03013242, 0.2730222, 0, 1, 0.4470588, 1,
-0.1917466, 0.4637665, -0.802223, 0, 1, 0.454902, 1,
-0.1898166, -0.5705691, -3.082801, 0, 1, 0.4588235, 1,
-0.1865643, -0.242015, -1.177544, 0, 1, 0.4666667, 1,
-0.1860494, -0.4258711, -2.797303, 0, 1, 0.4705882, 1,
-0.1807504, 1.411578, -0.03446501, 0, 1, 0.4784314, 1,
-0.1804995, -1.482105, -3.620367, 0, 1, 0.4823529, 1,
-0.1800446, -1.070367, -1.804604, 0, 1, 0.4901961, 1,
-0.1798915, -0.4737639, -2.106786, 0, 1, 0.4941176, 1,
-0.1781671, -2.507648, -4.057383, 0, 1, 0.5019608, 1,
-0.1727911, 0.3024074, -1.825224, 0, 1, 0.509804, 1,
-0.1624503, 0.959626, -0.4188774, 0, 1, 0.5137255, 1,
-0.1607556, -0.2647182, -2.488279, 0, 1, 0.5215687, 1,
-0.1603971, 0.1837187, -0.4965843, 0, 1, 0.5254902, 1,
-0.1567643, -1.467868, -3.555056, 0, 1, 0.5333334, 1,
-0.1550464, 0.3251466, -1.068483, 0, 1, 0.5372549, 1,
-0.1537195, -0.3561576, -3.292691, 0, 1, 0.5450981, 1,
-0.1527014, -1.042464, -2.432491, 0, 1, 0.5490196, 1,
-0.1507725, -0.7315786, -2.693629, 0, 1, 0.5568628, 1,
-0.1492824, -1.962463, -2.800439, 0, 1, 0.5607843, 1,
-0.1487727, -0.5785466, -2.229297, 0, 1, 0.5686275, 1,
-0.1427707, 0.314799, 1.002573, 0, 1, 0.572549, 1,
-0.1423592, -0.007951304, -2.255788, 0, 1, 0.5803922, 1,
-0.1419543, 1.286139, -0.2841886, 0, 1, 0.5843138, 1,
-0.1414626, -0.2073659, -2.280897, 0, 1, 0.5921569, 1,
-0.1371898, -0.4590143, -2.941761, 0, 1, 0.5960785, 1,
-0.1363909, 0.2286451, -0.4356436, 0, 1, 0.6039216, 1,
-0.1344044, -1.259415, -3.315762, 0, 1, 0.6117647, 1,
-0.1322572, 0.940196, -1.623938, 0, 1, 0.6156863, 1,
-0.1251196, 0.6187799, -2.361942, 0, 1, 0.6235294, 1,
-0.1245631, -1.625954, -2.172742, 0, 1, 0.627451, 1,
-0.1243102, -0.4602176, -4.077366, 0, 1, 0.6352941, 1,
-0.1237151, -0.7974052, -3.577922, 0, 1, 0.6392157, 1,
-0.1233972, -0.191308, -2.947908, 0, 1, 0.6470588, 1,
-0.1184781, -0.375338, -1.9082, 0, 1, 0.6509804, 1,
-0.1163166, -1.100418, -3.010396, 0, 1, 0.6588235, 1,
-0.1159217, 1.542683, -0.3822076, 0, 1, 0.6627451, 1,
-0.1153358, 0.6880311, 2.053015, 0, 1, 0.6705883, 1,
-0.1146003, -0.6132587, -3.13798, 0, 1, 0.6745098, 1,
-0.1139417, 0.8120419, -0.4243555, 0, 1, 0.682353, 1,
-0.1120241, 1.252726, 0.3114571, 0, 1, 0.6862745, 1,
-0.1119543, -0.5228705, -2.744462, 0, 1, 0.6941177, 1,
-0.1108681, -1.597256, -2.17279, 0, 1, 0.7019608, 1,
-0.1105877, -1.688286, -2.641236, 0, 1, 0.7058824, 1,
-0.1076155, -1.882368, -2.34848, 0, 1, 0.7137255, 1,
-0.1027884, 1.310785, 0.8704708, 0, 1, 0.7176471, 1,
-0.1001716, -0.7800663, -3.487368, 0, 1, 0.7254902, 1,
-0.0984958, 0.5801728, 0.3280583, 0, 1, 0.7294118, 1,
-0.09633407, 2.228606, 0.5182583, 0, 1, 0.7372549, 1,
-0.08986409, -0.5382236, -3.304598, 0, 1, 0.7411765, 1,
-0.08234115, 0.4266393, 0.4938767, 0, 1, 0.7490196, 1,
-0.08127428, 1.299459, 1.230181, 0, 1, 0.7529412, 1,
-0.08029751, 0.3291895, 1.101915, 0, 1, 0.7607843, 1,
-0.07686568, 0.9732367, 0.430856, 0, 1, 0.7647059, 1,
-0.07562082, -0.4664908, -1.123493, 0, 1, 0.772549, 1,
-0.07249704, -1.433658, -3.058007, 0, 1, 0.7764706, 1,
-0.07236436, 1.510713, 0.5237364, 0, 1, 0.7843137, 1,
-0.07056481, -0.6157101, -3.994264, 0, 1, 0.7882353, 1,
-0.0704149, 1.223125, 0.5970085, 0, 1, 0.7960784, 1,
-0.06873975, 2.600869, 0.9706605, 0, 1, 0.8039216, 1,
-0.06675022, 0.2732323, -0.6738616, 0, 1, 0.8078431, 1,
-0.06451397, -0.2190115, -3.293029, 0, 1, 0.8156863, 1,
-0.0629373, 0.5447272, -0.1041575, 0, 1, 0.8196079, 1,
-0.06270443, 1.799104, 0.5796219, 0, 1, 0.827451, 1,
-0.06205405, 1.463057, 0.3832964, 0, 1, 0.8313726, 1,
-0.05285012, 0.3177593, 0.1591099, 0, 1, 0.8392157, 1,
-0.05011417, 0.912797, -0.05358753, 0, 1, 0.8431373, 1,
-0.04651299, -1.321419, -4.302157, 0, 1, 0.8509804, 1,
-0.04408007, 1.369987, -0.1413406, 0, 1, 0.854902, 1,
-0.04360086, -0.2743536, -2.41141, 0, 1, 0.8627451, 1,
-0.04268834, -0.7430492, -2.452049, 0, 1, 0.8666667, 1,
-0.03740427, 1.394891, -0.3024124, 0, 1, 0.8745098, 1,
-0.03524224, -0.6378067, -1.93582, 0, 1, 0.8784314, 1,
-0.03494167, 0.4264805, -0.6391734, 0, 1, 0.8862745, 1,
-0.03333759, -1.043011, -2.149989, 0, 1, 0.8901961, 1,
-0.02695561, -0.2653895, -3.780871, 0, 1, 0.8980392, 1,
-0.02575817, 0.6176077, 0.09842937, 0, 1, 0.9058824, 1,
-0.02255098, 1.424509, 0.05435809, 0, 1, 0.9098039, 1,
-0.0199564, 0.6852916, 0.01107133, 0, 1, 0.9176471, 1,
-0.01625961, 0.01309271, -1.729069, 0, 1, 0.9215686, 1,
-0.01216415, 1.244553, 0.6510246, 0, 1, 0.9294118, 1,
-0.00705894, 0.135396, -0.2578365, 0, 1, 0.9333333, 1,
0.0008595416, 1.047604, -0.5111756, 0, 1, 0.9411765, 1,
0.008757475, 1.518901, -0.01150393, 0, 1, 0.945098, 1,
0.01025006, 0.5105761, -1.309026, 0, 1, 0.9529412, 1,
0.01031898, 0.1243223, 0.4382063, 0, 1, 0.9568627, 1,
0.01483917, 0.9130038, 0.2811223, 0, 1, 0.9647059, 1,
0.01648045, -0.9208533, 1.158187, 0, 1, 0.9686275, 1,
0.01921033, -0.2732032, 2.766078, 0, 1, 0.9764706, 1,
0.01934446, 0.7287441, -2.499163, 0, 1, 0.9803922, 1,
0.02013845, -0.09529737, 2.696145, 0, 1, 0.9882353, 1,
0.02066854, 0.1721293, 0.2416342, 0, 1, 0.9921569, 1,
0.02492143, -0.2863523, 3.03868, 0, 1, 1, 1,
0.02537529, -1.179237, 3.516733, 0, 0.9921569, 1, 1,
0.02777863, 0.005323254, 3.796818, 0, 0.9882353, 1, 1,
0.02861684, -1.097807, 3.224848, 0, 0.9803922, 1, 1,
0.02969465, -1.316949, 1.184669, 0, 0.9764706, 1, 1,
0.03299293, 2.584268, 0.7055237, 0, 0.9686275, 1, 1,
0.03377102, 0.1325864, 0.1888521, 0, 0.9647059, 1, 1,
0.03446795, 1.121534, 2.378278, 0, 0.9568627, 1, 1,
0.04048524, 0.5829644, -0.3816948, 0, 0.9529412, 1, 1,
0.04154008, -2.384164, 3.039352, 0, 0.945098, 1, 1,
0.04289245, -0.9653172, 2.441486, 0, 0.9411765, 1, 1,
0.04292223, -0.3996471, 3.053538, 0, 0.9333333, 1, 1,
0.04325345, -0.05856695, 3.900681, 0, 0.9294118, 1, 1,
0.04367593, 0.4396957, 1.117443, 0, 0.9215686, 1, 1,
0.04432287, 0.3420937, 1.084437, 0, 0.9176471, 1, 1,
0.04564506, 1.309949, 0.4728098, 0, 0.9098039, 1, 1,
0.04627478, 2.120178, -0.6792697, 0, 0.9058824, 1, 1,
0.05007429, 0.8572384, -0.9754685, 0, 0.8980392, 1, 1,
0.05072004, -1.303495, 3.350994, 0, 0.8901961, 1, 1,
0.05157959, -0.4340643, 3.592322, 0, 0.8862745, 1, 1,
0.05267246, -1.571049, 1.28576, 0, 0.8784314, 1, 1,
0.0620845, 0.5420433, 0.1897469, 0, 0.8745098, 1, 1,
0.06350578, 0.8646736, -0.6092323, 0, 0.8666667, 1, 1,
0.07158329, 1.061432, -0.5591486, 0, 0.8627451, 1, 1,
0.07161539, -0.7071683, 1.819155, 0, 0.854902, 1, 1,
0.07943885, -0.696322, 1.876684, 0, 0.8509804, 1, 1,
0.08244965, 1.606304, -1.380214, 0, 0.8431373, 1, 1,
0.0878627, -1.110934, 2.587359, 0, 0.8392157, 1, 1,
0.09156733, 0.5826751, 1.353912, 0, 0.8313726, 1, 1,
0.09532604, 0.4219247, 0.3418929, 0, 0.827451, 1, 1,
0.09616014, -0.5271198, 3.678477, 0, 0.8196079, 1, 1,
0.09863017, -1.755742, 2.835348, 0, 0.8156863, 1, 1,
0.09995718, 0.02971714, 0.6123794, 0, 0.8078431, 1, 1,
0.1041195, -0.7339763, 2.835706, 0, 0.8039216, 1, 1,
0.106965, 0.003957232, 1.082604, 0, 0.7960784, 1, 1,
0.1120676, 1.269538, -1.042947, 0, 0.7882353, 1, 1,
0.120727, 1.058903, -0.2350423, 0, 0.7843137, 1, 1,
0.1211891, 0.2495466, 1.609651, 0, 0.7764706, 1, 1,
0.123075, 0.0928943, 2.797872, 0, 0.772549, 1, 1,
0.1247073, -1.921146, 2.320109, 0, 0.7647059, 1, 1,
0.1345228, 0.7296863, 0.04845961, 0, 0.7607843, 1, 1,
0.1375029, -0.7254962, 1.601603, 0, 0.7529412, 1, 1,
0.1389523, -0.5522371, 3.075711, 0, 0.7490196, 1, 1,
0.1414169, 0.8542162, 0.6593503, 0, 0.7411765, 1, 1,
0.1417198, 0.03207332, 1.764937, 0, 0.7372549, 1, 1,
0.144059, 0.639989, 0.6201361, 0, 0.7294118, 1, 1,
0.1466723, 1.079316, 0.472552, 0, 0.7254902, 1, 1,
0.1479342, 0.3571779, -0.337949, 0, 0.7176471, 1, 1,
0.1508661, -0.1462608, 2.883246, 0, 0.7137255, 1, 1,
0.1549549, -0.7853568, 3.972257, 0, 0.7058824, 1, 1,
0.1558438, -0.007632725, 2.752216, 0, 0.6980392, 1, 1,
0.1577813, -1.310283, 3.220104, 0, 0.6941177, 1, 1,
0.1582347, 0.08734303, 1.193701, 0, 0.6862745, 1, 1,
0.1583463, 0.7791166, 1.672926, 0, 0.682353, 1, 1,
0.161329, -1.189989, 3.251267, 0, 0.6745098, 1, 1,
0.1625448, -1.542987, 2.496423, 0, 0.6705883, 1, 1,
0.1662074, -1.272514, 3.056355, 0, 0.6627451, 1, 1,
0.1684675, -0.6823698, 3.826432, 0, 0.6588235, 1, 1,
0.1687576, 0.8573952, 1.753556, 0, 0.6509804, 1, 1,
0.1706598, 0.6821775, 0.4520953, 0, 0.6470588, 1, 1,
0.1712762, 1.314514, 1.030158, 0, 0.6392157, 1, 1,
0.1757172, -0.8044484, 1.686967, 0, 0.6352941, 1, 1,
0.1761347, 0.335832, 0.9252552, 0, 0.627451, 1, 1,
0.1799181, 0.4202358, -0.216776, 0, 0.6235294, 1, 1,
0.1802438, 0.7697394, -1.57336, 0, 0.6156863, 1, 1,
0.1811141, -1.042764, 4.284612, 0, 0.6117647, 1, 1,
0.1826291, -1.108993, 2.856294, 0, 0.6039216, 1, 1,
0.1834768, -0.8413204, 2.459936, 0, 0.5960785, 1, 1,
0.1835922, -1.195585, 3.471464, 0, 0.5921569, 1, 1,
0.1958711, -0.8262181, 4.27087, 0, 0.5843138, 1, 1,
0.2003961, 0.1288398, -0.06540022, 0, 0.5803922, 1, 1,
0.2011941, 0.09021915, 0.5634721, 0, 0.572549, 1, 1,
0.2041171, 1.25131, 0.4386316, 0, 0.5686275, 1, 1,
0.2069006, 0.2172485, 0.3398867, 0, 0.5607843, 1, 1,
0.2082541, 0.7902654, 0.3262622, 0, 0.5568628, 1, 1,
0.210602, 1.563111, -0.8225601, 0, 0.5490196, 1, 1,
0.2109268, 0.6360912, 1.510398, 0, 0.5450981, 1, 1,
0.2109536, 0.1247637, -0.4119794, 0, 0.5372549, 1, 1,
0.2150496, -0.905414, 1.868084, 0, 0.5333334, 1, 1,
0.2175309, 0.9335358, -0.1059417, 0, 0.5254902, 1, 1,
0.2176719, 0.5807402, -1.276626, 0, 0.5215687, 1, 1,
0.219047, 0.2875356, 1.062886, 0, 0.5137255, 1, 1,
0.2220825, -0.8739226, 3.668226, 0, 0.509804, 1, 1,
0.2222503, 0.6474037, 0.5387422, 0, 0.5019608, 1, 1,
0.2260418, -0.3434727, 2.059916, 0, 0.4941176, 1, 1,
0.226496, -1.339103, 1.09462, 0, 0.4901961, 1, 1,
0.2285185, 0.08547317, 0.6949039, 0, 0.4823529, 1, 1,
0.2310077, 0.4347929, 1.601262, 0, 0.4784314, 1, 1,
0.2326215, -1.346233, 4.86772, 0, 0.4705882, 1, 1,
0.2330249, -0.3131652, 3.718124, 0, 0.4666667, 1, 1,
0.2333665, -0.2951539, 2.775294, 0, 0.4588235, 1, 1,
0.2338626, -1.603866, 4.111373, 0, 0.454902, 1, 1,
0.2411142, -0.2029318, 1.743206, 0, 0.4470588, 1, 1,
0.2432867, -0.734293, 3.503341, 0, 0.4431373, 1, 1,
0.2448833, 0.005139647, 2.480701, 0, 0.4352941, 1, 1,
0.2449973, 0.8698651, 2.068068, 0, 0.4313726, 1, 1,
0.2454569, -0.954576, 1.62062, 0, 0.4235294, 1, 1,
0.2467004, -0.3375572, 1.563226, 0, 0.4196078, 1, 1,
0.2492023, -0.7070583, 2.215083, 0, 0.4117647, 1, 1,
0.2575181, -0.3966863, 2.750118, 0, 0.4078431, 1, 1,
0.2624154, -0.2538846, 4.012824, 0, 0.4, 1, 1,
0.2636734, -1.980693, 3.734772, 0, 0.3921569, 1, 1,
0.2668827, -0.7664956, 3.675564, 0, 0.3882353, 1, 1,
0.2672746, 0.1278987, 2.001178, 0, 0.3803922, 1, 1,
0.2741702, -0.2677308, 2.492001, 0, 0.3764706, 1, 1,
0.2778083, -0.6039256, 1.928026, 0, 0.3686275, 1, 1,
0.2843245, -0.612088, 2.482188, 0, 0.3647059, 1, 1,
0.2853983, -0.248628, 0.4946499, 0, 0.3568628, 1, 1,
0.2885957, -1.203126, 2.839598, 0, 0.3529412, 1, 1,
0.2887422, -1.881013, 2.351753, 0, 0.345098, 1, 1,
0.2892051, 1.89728, -1.195675, 0, 0.3411765, 1, 1,
0.2922493, 0.04722336, 1.737828, 0, 0.3333333, 1, 1,
0.2963243, -0.6054616, 2.150136, 0, 0.3294118, 1, 1,
0.2963584, -0.1611727, 1.635653, 0, 0.3215686, 1, 1,
0.2982134, -0.8857875, 3.632968, 0, 0.3176471, 1, 1,
0.2986737, 0.5969619, 1.218785, 0, 0.3098039, 1, 1,
0.2987256, -0.04768289, 0.2753504, 0, 0.3058824, 1, 1,
0.299515, -0.2856465, 3.359845, 0, 0.2980392, 1, 1,
0.2997208, 0.2482909, 0.9407336, 0, 0.2901961, 1, 1,
0.3001261, 0.2243047, 0.1353293, 0, 0.2862745, 1, 1,
0.3023358, 0.5378349, 0.5016927, 0, 0.2784314, 1, 1,
0.3063949, 0.2329081, 0.7948782, 0, 0.2745098, 1, 1,
0.3089617, 1.18519, -0.1889309, 0, 0.2666667, 1, 1,
0.3089888, 1.976278, 0.724677, 0, 0.2627451, 1, 1,
0.310269, -0.02973194, 2.234727, 0, 0.254902, 1, 1,
0.3137408, 0.159123, 1.637187, 0, 0.2509804, 1, 1,
0.3206722, 1.096401, -0.4184704, 0, 0.2431373, 1, 1,
0.3210089, -1.240865, 2.415886, 0, 0.2392157, 1, 1,
0.32396, 0.2141653, 1.063172, 0, 0.2313726, 1, 1,
0.3263045, -0.9035072, 2.680625, 0, 0.227451, 1, 1,
0.3276248, 0.9393403, 0.8449961, 0, 0.2196078, 1, 1,
0.3364854, -1.866701, 2.161424, 0, 0.2156863, 1, 1,
0.3403662, 0.1944237, 2.032511, 0, 0.2078431, 1, 1,
0.3448691, 1.498871, -0.3054512, 0, 0.2039216, 1, 1,
0.3469398, 0.6641467, 1.720934, 0, 0.1960784, 1, 1,
0.3478856, -0.03733638, 2.683332, 0, 0.1882353, 1, 1,
0.350547, -0.531103, 3.858261, 0, 0.1843137, 1, 1,
0.3539373, 0.8633237, 0.7528476, 0, 0.1764706, 1, 1,
0.3600431, 0.5703138, 1.099145, 0, 0.172549, 1, 1,
0.3605308, -0.3507096, 3.112717, 0, 0.1647059, 1, 1,
0.3629144, 0.452461, 0.8569238, 0, 0.1607843, 1, 1,
0.3665491, 0.7174876, 0.2926606, 0, 0.1529412, 1, 1,
0.370947, -0.9032241, 4.508377, 0, 0.1490196, 1, 1,
0.372668, -0.648558, 5.103212, 0, 0.1411765, 1, 1,
0.3767663, 0.633935, 1.485457, 0, 0.1372549, 1, 1,
0.3770834, -0.227264, 3.634958, 0, 0.1294118, 1, 1,
0.3787972, -1.489588, 2.291791, 0, 0.1254902, 1, 1,
0.3888305, -0.7819068, 2.449236, 0, 0.1176471, 1, 1,
0.3926289, -0.2391207, 2.571725, 0, 0.1137255, 1, 1,
0.3940623, -0.2353726, 2.760391, 0, 0.1058824, 1, 1,
0.3954956, -1.183732, 1.285501, 0, 0.09803922, 1, 1,
0.3986146, 0.2502888, 1.249378, 0, 0.09411765, 1, 1,
0.4088304, -0.08236047, 0.9960924, 0, 0.08627451, 1, 1,
0.4136073, 0.4556503, 0.001991685, 0, 0.08235294, 1, 1,
0.4147379, 0.5914887, 1.305452, 0, 0.07450981, 1, 1,
0.4168479, 1.625486, -0.2337413, 0, 0.07058824, 1, 1,
0.4212111, -0.1160212, 1.804854, 0, 0.0627451, 1, 1,
0.427777, 1.782082, -0.3206389, 0, 0.05882353, 1, 1,
0.4305775, 1.23967, 0.01581244, 0, 0.05098039, 1, 1,
0.431705, 0.2139715, 1.470944, 0, 0.04705882, 1, 1,
0.4321785, 0.9464949, 0.5143465, 0, 0.03921569, 1, 1,
0.4365683, 1.020697, -0.796295, 0, 0.03529412, 1, 1,
0.4393029, -0.5478626, 3.462634, 0, 0.02745098, 1, 1,
0.4420208, 1.138765, -0.5713961, 0, 0.02352941, 1, 1,
0.4424903, -0.316638, 3.692711, 0, 0.01568628, 1, 1,
0.4430696, 0.6167138, 1.034849, 0, 0.01176471, 1, 1,
0.444225, 0.09169319, 1.31815, 0, 0.003921569, 1, 1,
0.4501481, 0.4937235, 0.592462, 0.003921569, 0, 1, 1,
0.4538624, 2.219364, -0.8199325, 0.007843138, 0, 1, 1,
0.4546041, 0.8725069, -1.303621, 0.01568628, 0, 1, 1,
0.4604454, -0.08218952, 2.188121, 0.01960784, 0, 1, 1,
0.4641176, 0.1327873, 1.008661, 0.02745098, 0, 1, 1,
0.4666135, -0.123409, 3.744263, 0.03137255, 0, 1, 1,
0.4806225, 0.5894145, 0.1109927, 0.03921569, 0, 1, 1,
0.480967, -0.6357656, 0.7677791, 0.04313726, 0, 1, 1,
0.487365, 0.6698776, 1.29098, 0.05098039, 0, 1, 1,
0.4883601, 1.613027, 0.5911803, 0.05490196, 0, 1, 1,
0.4910775, 0.6937806, 0.5264432, 0.0627451, 0, 1, 1,
0.4922922, -0.08530416, 1.56496, 0.06666667, 0, 1, 1,
0.4940438, -0.3314127, 2.713062, 0.07450981, 0, 1, 1,
0.4969195, -0.1286296, 2.36845, 0.07843138, 0, 1, 1,
0.4973973, -0.04363618, 0.8010916, 0.08627451, 0, 1, 1,
0.497401, 0.7537748, 0.2638115, 0.09019608, 0, 1, 1,
0.5022194, 1.122885, -0.7897853, 0.09803922, 0, 1, 1,
0.5030832, 0.2911504, 0.7698859, 0.1058824, 0, 1, 1,
0.5062095, 0.134229, 0.9270566, 0.1098039, 0, 1, 1,
0.5078939, -1.116707, 2.663759, 0.1176471, 0, 1, 1,
0.5089773, 2.003207, -2.42682, 0.1215686, 0, 1, 1,
0.5117002, 0.7275964, 0.7255344, 0.1294118, 0, 1, 1,
0.5144576, 1.980859, 0.03174738, 0.1333333, 0, 1, 1,
0.5205391, 0.6733184, 1.876537, 0.1411765, 0, 1, 1,
0.5241714, -1.734275, 3.4109, 0.145098, 0, 1, 1,
0.5246332, 1.033704, 0.3873579, 0.1529412, 0, 1, 1,
0.529189, 0.065311, 0.3134769, 0.1568628, 0, 1, 1,
0.5293699, -0.600455, 1.912663, 0.1647059, 0, 1, 1,
0.5357234, 0.8592204, -1.592488, 0.1686275, 0, 1, 1,
0.5364325, 1.930651, 0.6928962, 0.1764706, 0, 1, 1,
0.540571, -0.4742344, 3.247994, 0.1803922, 0, 1, 1,
0.5414635, -1.199649, 3.416836, 0.1882353, 0, 1, 1,
0.5429898, 0.5317785, 1.392859, 0.1921569, 0, 1, 1,
0.5483559, -0.1694815, 0.5873523, 0.2, 0, 1, 1,
0.5567265, -0.8841548, 2.470337, 0.2078431, 0, 1, 1,
0.5602667, 0.08743573, 0.4849187, 0.2117647, 0, 1, 1,
0.5620943, 1.575115, 1.352059, 0.2196078, 0, 1, 1,
0.5674587, -1.09851, 1.829786, 0.2235294, 0, 1, 1,
0.5688763, 2.149083, 0.1908218, 0.2313726, 0, 1, 1,
0.5691196, -1.071584, 1.231997, 0.2352941, 0, 1, 1,
0.5745857, -1.836016, 2.064146, 0.2431373, 0, 1, 1,
0.5784059, -0.3340199, 1.359536, 0.2470588, 0, 1, 1,
0.5793656, 0.7533038, 2.74751, 0.254902, 0, 1, 1,
0.580063, -0.8184673, 1.810581, 0.2588235, 0, 1, 1,
0.5852667, -1.125107, 2.346103, 0.2666667, 0, 1, 1,
0.5884324, -0.4502528, 1.648769, 0.2705882, 0, 1, 1,
0.5902582, -0.7521971, 3.347842, 0.2784314, 0, 1, 1,
0.5981347, -0.7658316, 1.452043, 0.282353, 0, 1, 1,
0.5989689, -1.780902, 2.190164, 0.2901961, 0, 1, 1,
0.601406, -0.5227629, 2.189348, 0.2941177, 0, 1, 1,
0.6015514, 0.05196591, 1.330398, 0.3019608, 0, 1, 1,
0.6080192, 0.6031677, -0.09697796, 0.3098039, 0, 1, 1,
0.6085691, 1.038274, -0.2354658, 0.3137255, 0, 1, 1,
0.6134286, -0.7272384, 2.513398, 0.3215686, 0, 1, 1,
0.6172187, 1.022116, -0.3977287, 0.3254902, 0, 1, 1,
0.6191152, 0.8083624, 0.3496591, 0.3333333, 0, 1, 1,
0.6250834, 1.388566, 2.681335, 0.3372549, 0, 1, 1,
0.6275246, 0.1691179, 0.059593, 0.345098, 0, 1, 1,
0.6312773, 0.3389573, 2.002845, 0.3490196, 0, 1, 1,
0.6349385, -0.9636592, 2.121543, 0.3568628, 0, 1, 1,
0.6452208, -1.674084, 2.105849, 0.3607843, 0, 1, 1,
0.6468555, -0.8560614, 1.327692, 0.3686275, 0, 1, 1,
0.6480762, -2.136784, 2.695943, 0.372549, 0, 1, 1,
0.6484622, -1.56519, 3.450154, 0.3803922, 0, 1, 1,
0.6492956, -1.704208, 0.7068452, 0.3843137, 0, 1, 1,
0.6526614, 0.8566152, -0.2742689, 0.3921569, 0, 1, 1,
0.6558331, 1.088564, 0.04354865, 0.3960784, 0, 1, 1,
0.6579953, -1.261417, 3.224738, 0.4039216, 0, 1, 1,
0.6581343, -1.657614, 1.787068, 0.4117647, 0, 1, 1,
0.6594228, 0.9572664, 1.187198, 0.4156863, 0, 1, 1,
0.6618602, -1.194235, 3.642062, 0.4235294, 0, 1, 1,
0.6620079, 1.146738, -0.5433491, 0.427451, 0, 1, 1,
0.6634716, -1.901798, 2.427418, 0.4352941, 0, 1, 1,
0.666428, -1.678214, 1.563748, 0.4392157, 0, 1, 1,
0.6762703, 0.4331428, 2.890984, 0.4470588, 0, 1, 1,
0.6789662, -0.7001578, 0.592523, 0.4509804, 0, 1, 1,
0.6826059, -1.011254, 2.433354, 0.4588235, 0, 1, 1,
0.6837612, -2.852474, 4.15101, 0.4627451, 0, 1, 1,
0.6863639, -0.9561903, 2.516638, 0.4705882, 0, 1, 1,
0.6871048, -1.397373, 0.7534537, 0.4745098, 0, 1, 1,
0.6927675, -0.804737, 3.851526, 0.4823529, 0, 1, 1,
0.6961105, -0.06162273, 2.486259, 0.4862745, 0, 1, 1,
0.69652, -1.161745, 3.394274, 0.4941176, 0, 1, 1,
0.6991329, -1.114587, 0.7672052, 0.5019608, 0, 1, 1,
0.7006212, 0.3190909, 1.363426, 0.5058824, 0, 1, 1,
0.7071732, -0.4233685, 0.8344529, 0.5137255, 0, 1, 1,
0.7154952, -0.2975275, 2.806017, 0.5176471, 0, 1, 1,
0.7168298, -0.2991752, -1.186887, 0.5254902, 0, 1, 1,
0.7186365, 0.4197477, 1.424005, 0.5294118, 0, 1, 1,
0.7203988, -1.990698, 2.396775, 0.5372549, 0, 1, 1,
0.7275333, 0.9568913, -1.083628, 0.5411765, 0, 1, 1,
0.7305189, 0.6913262, 0.457086, 0.5490196, 0, 1, 1,
0.7350442, 0.9054623, -0.8365493, 0.5529412, 0, 1, 1,
0.7389317, -0.3517672, 1.936925, 0.5607843, 0, 1, 1,
0.742533, -3.508011, 0.9683203, 0.5647059, 0, 1, 1,
0.7464719, -0.4467719, 3.599675, 0.572549, 0, 1, 1,
0.7469388, 0.4540228, 0.8481156, 0.5764706, 0, 1, 1,
0.7500318, 0.299804, 0.3109734, 0.5843138, 0, 1, 1,
0.7505151, 0.6503932, -0.982168, 0.5882353, 0, 1, 1,
0.7521817, -0.8435553, 3.900603, 0.5960785, 0, 1, 1,
0.7554622, -1.413074, 3.549199, 0.6039216, 0, 1, 1,
0.7619233, -0.9523092, 3.461027, 0.6078432, 0, 1, 1,
0.762776, -0.6051272, 2.147727, 0.6156863, 0, 1, 1,
0.7627982, 0.4716828, -0.11914, 0.6196079, 0, 1, 1,
0.7661827, -0.6899468, 2.693875, 0.627451, 0, 1, 1,
0.7739841, -0.3267149, 2.676369, 0.6313726, 0, 1, 1,
0.7747372, 0.907819, 0.6680222, 0.6392157, 0, 1, 1,
0.77614, 1.007643, -0.8091862, 0.6431373, 0, 1, 1,
0.778928, -0.466228, 2.253908, 0.6509804, 0, 1, 1,
0.7808838, 1.331548, 0.09939524, 0.654902, 0, 1, 1,
0.7813722, 0.9871134, 0.9636304, 0.6627451, 0, 1, 1,
0.7833141, 2.400308, 0.8121822, 0.6666667, 0, 1, 1,
0.7846127, -0.01194187, 1.099543, 0.6745098, 0, 1, 1,
0.7873006, 1.089557, 1.344542, 0.6784314, 0, 1, 1,
0.7875124, -0.2626239, 1.785159, 0.6862745, 0, 1, 1,
0.7899659, -0.5755595, 2.780994, 0.6901961, 0, 1, 1,
0.7943849, 1.543354, 1.261989, 0.6980392, 0, 1, 1,
0.8029175, -1.014529, 2.254293, 0.7058824, 0, 1, 1,
0.8032293, -0.6204836, 1.145794, 0.7098039, 0, 1, 1,
0.8039975, -0.5976268, 1.620737, 0.7176471, 0, 1, 1,
0.8088976, 0.6239632, -0.239753, 0.7215686, 0, 1, 1,
0.8127278, 0.3605096, 1.375866, 0.7294118, 0, 1, 1,
0.8131268, 0.5250207, -0.2412117, 0.7333333, 0, 1, 1,
0.8191946, 0.9910926, -0.09379172, 0.7411765, 0, 1, 1,
0.8217667, 0.1032103, 1.511129, 0.7450981, 0, 1, 1,
0.8243524, -1.343991, 3.788238, 0.7529412, 0, 1, 1,
0.8249477, 1.223084, 1.221012, 0.7568628, 0, 1, 1,
0.8280631, -1.791384, 1.428761, 0.7647059, 0, 1, 1,
0.8290303, 0.02043388, 1.029908, 0.7686275, 0, 1, 1,
0.8342687, 0.7157643, 1.039822, 0.7764706, 0, 1, 1,
0.842388, -1.174455, 4.048495, 0.7803922, 0, 1, 1,
0.8491058, 0.08776175, 2.062918, 0.7882353, 0, 1, 1,
0.8521103, 0.2323032, 1.974727, 0.7921569, 0, 1, 1,
0.8542249, 0.2016214, 0.09597088, 0.8, 0, 1, 1,
0.8543383, -1.54746, 3.096555, 0.8078431, 0, 1, 1,
0.854543, 0.2966081, 0.8126252, 0.8117647, 0, 1, 1,
0.8561481, 0.04510881, 1.949311, 0.8196079, 0, 1, 1,
0.8566004, -0.4005665, 1.000216, 0.8235294, 0, 1, 1,
0.8573682, -0.8330378, 3.525032, 0.8313726, 0, 1, 1,
0.8635468, 0.2142795, 0.7806863, 0.8352941, 0, 1, 1,
0.8643784, 0.7438737, 1.125956, 0.8431373, 0, 1, 1,
0.8643804, -0.1848732, 3.126314, 0.8470588, 0, 1, 1,
0.8685132, -0.7556331, 3.237499, 0.854902, 0, 1, 1,
0.8694193, -0.5891551, 2.064094, 0.8588235, 0, 1, 1,
0.8802266, 0.06919989, 1.260197, 0.8666667, 0, 1, 1,
0.8829548, -0.7467169, 3.147403, 0.8705882, 0, 1, 1,
0.8836602, -0.6131933, 3.047169, 0.8784314, 0, 1, 1,
0.885321, 1.292729, 3.002961, 0.8823529, 0, 1, 1,
0.8976263, -0.4604781, 2.981807, 0.8901961, 0, 1, 1,
0.8992917, -0.03883452, 1.9681, 0.8941177, 0, 1, 1,
0.9054377, -0.6061677, 0.8574836, 0.9019608, 0, 1, 1,
0.905619, -0.3803541, 1.462057, 0.9098039, 0, 1, 1,
0.9186871, -1.013572, 2.627344, 0.9137255, 0, 1, 1,
0.9225178, -0.329616, 3.20701, 0.9215686, 0, 1, 1,
0.9238912, -2.35923, 2.452076, 0.9254902, 0, 1, 1,
0.9371402, 1.322514, 1.521332, 0.9333333, 0, 1, 1,
0.9427391, -1.01185, 2.125995, 0.9372549, 0, 1, 1,
0.9466993, 0.5567295, 1.880053, 0.945098, 0, 1, 1,
0.9511452, -0.344802, 3.45955, 0.9490196, 0, 1, 1,
0.9524894, -1.674775, 3.04921, 0.9568627, 0, 1, 1,
0.9539365, -0.8747753, 1.560204, 0.9607843, 0, 1, 1,
0.9571363, -1.679171, 4.371477, 0.9686275, 0, 1, 1,
0.9577094, -0.6252601, 2.780868, 0.972549, 0, 1, 1,
0.9587647, 0.6885399, 0.5531541, 0.9803922, 0, 1, 1,
0.9641451, -1.943635, 3.405502, 0.9843137, 0, 1, 1,
0.9656543, -0.1538439, 2.344315, 0.9921569, 0, 1, 1,
0.966707, 1.544652, -1.156866, 0.9960784, 0, 1, 1,
0.9697109, 0.6552113, 1.716299, 1, 0, 0.9960784, 1,
0.9718382, 0.719638, 0.08163892, 1, 0, 0.9882353, 1,
0.9726765, -1.217968, 2.395309, 1, 0, 0.9843137, 1,
0.9766512, 0.6326426, -1.801791, 1, 0, 0.9764706, 1,
0.9805965, 1.171894, 0.1527101, 1, 0, 0.972549, 1,
0.9815129, -0.1125444, 2.564428, 1, 0, 0.9647059, 1,
0.9857094, -1.258535, 2.81111, 1, 0, 0.9607843, 1,
0.9858084, 0.4932241, 1.071129, 1, 0, 0.9529412, 1,
0.9903092, 2.270864, 0.1735954, 1, 0, 0.9490196, 1,
0.991278, 0.002920942, 2.17872, 1, 0, 0.9411765, 1,
0.9941061, -0.5894815, 2.22606, 1, 0, 0.9372549, 1,
0.9942394, 0.1149066, -0.1739301, 1, 0, 0.9294118, 1,
0.9948425, -1.087599, 1.50405, 1, 0, 0.9254902, 1,
1.004648, 1.521791, 1.20321, 1, 0, 0.9176471, 1,
1.005546, -0.4002908, 0.9671242, 1, 0, 0.9137255, 1,
1.007491, 0.3182645, 3.028931, 1, 0, 0.9058824, 1,
1.007686, 0.2513971, -1.305641, 1, 0, 0.9019608, 1,
1.019731, -1.080677, 1.923698, 1, 0, 0.8941177, 1,
1.025833, -1.723263, 2.264097, 1, 0, 0.8862745, 1,
1.028463, 0.1742415, 2.348145, 1, 0, 0.8823529, 1,
1.032, 0.03310118, 0.9773873, 1, 0, 0.8745098, 1,
1.03394, 1.008319, -0.09418792, 1, 0, 0.8705882, 1,
1.041016, -0.003922277, 1.097074, 1, 0, 0.8627451, 1,
1.044799, -1.454574, 3.480963, 1, 0, 0.8588235, 1,
1.049797, -0.7569311, 2.177068, 1, 0, 0.8509804, 1,
1.050017, -0.04650953, 3.548278, 1, 0, 0.8470588, 1,
1.053028, 0.5254731, -0.1269414, 1, 0, 0.8392157, 1,
1.055488, 0.2183825, 1.087909, 1, 0, 0.8352941, 1,
1.056028, 0.7350177, 0.6412593, 1, 0, 0.827451, 1,
1.060431, 0.3564455, 0.299961, 1, 0, 0.8235294, 1,
1.069519, 1.057703, 0.710596, 1, 0, 0.8156863, 1,
1.071136, 1.318471, 1.714689, 1, 0, 0.8117647, 1,
1.073119, 1.188913, 0.3052993, 1, 0, 0.8039216, 1,
1.077425, 0.5525593, 0.7429498, 1, 0, 0.7960784, 1,
1.080339, 0.2256183, 2.341787, 1, 0, 0.7921569, 1,
1.108215, 0.2078517, 1.477433, 1, 0, 0.7843137, 1,
1.108997, 0.5665472, 1.307051, 1, 0, 0.7803922, 1,
1.118973, 0.1281762, 1.968521, 1, 0, 0.772549, 1,
1.120737, 0.7651784, 1.656895, 1, 0, 0.7686275, 1,
1.122347, 0.3548324, 0.04265285, 1, 0, 0.7607843, 1,
1.122903, 0.8883588, 2.825799, 1, 0, 0.7568628, 1,
1.123901, -0.3572662, 0.6431441, 1, 0, 0.7490196, 1,
1.124853, 1.793075, 1.541919, 1, 0, 0.7450981, 1,
1.130068, 1.542979, 0.9766306, 1, 0, 0.7372549, 1,
1.139758, 0.9598507, 0.0592476, 1, 0, 0.7333333, 1,
1.14235, 0.5936993, 1.459187, 1, 0, 0.7254902, 1,
1.160613, 0.3518276, 0.9542289, 1, 0, 0.7215686, 1,
1.163934, -0.7096102, 2.645622, 1, 0, 0.7137255, 1,
1.169568, 0.2140847, 2.247716, 1, 0, 0.7098039, 1,
1.171912, -0.9982889, 1.618008, 1, 0, 0.7019608, 1,
1.178625, 0.446031, 0.3231161, 1, 0, 0.6941177, 1,
1.180887, 0.2247799, 0.7793472, 1, 0, 0.6901961, 1,
1.182586, -0.8836425, 2.406803, 1, 0, 0.682353, 1,
1.198292, 0.3190246, 1.066437, 1, 0, 0.6784314, 1,
1.198694, 0.2964518, 2.789969, 1, 0, 0.6705883, 1,
1.206741, 2.498603, 0.1785691, 1, 0, 0.6666667, 1,
1.216685, 0.1470867, 1.864578, 1, 0, 0.6588235, 1,
1.222828, 0.7963483, 0.09840913, 1, 0, 0.654902, 1,
1.224409, -0.5398374, 2.289096, 1, 0, 0.6470588, 1,
1.228359, -0.9912037, 3.583568, 1, 0, 0.6431373, 1,
1.237012, -1.210448, 2.651116, 1, 0, 0.6352941, 1,
1.244506, -0.8732076, 1.754298, 1, 0, 0.6313726, 1,
1.248917, 0.1648525, 0.9252424, 1, 0, 0.6235294, 1,
1.257215, -0.0800166, 1.78602, 1, 0, 0.6196079, 1,
1.28084, 0.6431545, 0.1277615, 1, 0, 0.6117647, 1,
1.280995, -0.1955233, 1.284216, 1, 0, 0.6078432, 1,
1.286796, -0.9663754, 1.345363, 1, 0, 0.6, 1,
1.286844, -0.7632118, 3.541379, 1, 0, 0.5921569, 1,
1.28692, -1.042959, -0.3878242, 1, 0, 0.5882353, 1,
1.290361, -1.407497, 1.400139, 1, 0, 0.5803922, 1,
1.29896, -0.08168153, 1.967237, 1, 0, 0.5764706, 1,
1.300996, 0.2428059, 2.140161, 1, 0, 0.5686275, 1,
1.304936, -0.7399627, 2.566693, 1, 0, 0.5647059, 1,
1.309306, -1.883574, 1.522269, 1, 0, 0.5568628, 1,
1.316072, 0.04955335, 2.120272, 1, 0, 0.5529412, 1,
1.317983, -1.156886, 2.78087, 1, 0, 0.5450981, 1,
1.321929, 1.48417, 1.924788, 1, 0, 0.5411765, 1,
1.323397, 1.809667, -1.03934, 1, 0, 0.5333334, 1,
1.340624, 1.584587, 0.7930297, 1, 0, 0.5294118, 1,
1.349905, -1.445021, 2.975652, 1, 0, 0.5215687, 1,
1.353287, 0.317739, 1.915484, 1, 0, 0.5176471, 1,
1.359291, -1.189933, 1.365344, 1, 0, 0.509804, 1,
1.364006, 0.2039553, 1.992028, 1, 0, 0.5058824, 1,
1.384937, -0.204499, 1.484156, 1, 0, 0.4980392, 1,
1.391281, 2.044844, 0.8049799, 1, 0, 0.4901961, 1,
1.399905, 0.565372, 1.910821, 1, 0, 0.4862745, 1,
1.406679, 1.688976, -0.4509457, 1, 0, 0.4784314, 1,
1.417547, -0.04804026, 1.239862, 1, 0, 0.4745098, 1,
1.42628, 0.1640402, 2.725448, 1, 0, 0.4666667, 1,
1.435797, 1.111037, -1.061656, 1, 0, 0.4627451, 1,
1.43887, -0.2128125, 0.4695607, 1, 0, 0.454902, 1,
1.444658, -0.3606421, 1.745401, 1, 0, 0.4509804, 1,
1.449929, 0.5190067, 0.4234707, 1, 0, 0.4431373, 1,
1.450591, -0.150526, 3.161098, 1, 0, 0.4392157, 1,
1.454739, 0.6416628, 1.096315, 1, 0, 0.4313726, 1,
1.491504, -0.08859259, 2.861503, 1, 0, 0.427451, 1,
1.499195, -0.5945324, 2.911359, 1, 0, 0.4196078, 1,
1.511983, 0.4632582, 1.850055, 1, 0, 0.4156863, 1,
1.512838, 0.2053511, 2.228438, 1, 0, 0.4078431, 1,
1.537069, 0.6694981, 3.122764, 1, 0, 0.4039216, 1,
1.537741, -0.003192561, -0.0416015, 1, 0, 0.3960784, 1,
1.539124, 1.901818, -0.263266, 1, 0, 0.3882353, 1,
1.545684, -0.2120422, 0.308635, 1, 0, 0.3843137, 1,
1.551883, -0.7626922, 2.255994, 1, 0, 0.3764706, 1,
1.554458, -2.356381, 2.750455, 1, 0, 0.372549, 1,
1.575909, -1.243442, 4.286732, 1, 0, 0.3647059, 1,
1.579519, 0.1346755, 0.1793591, 1, 0, 0.3607843, 1,
1.592047, -0.3962469, 2.492109, 1, 0, 0.3529412, 1,
1.592206, 0.0760685, 2.590215, 1, 0, 0.3490196, 1,
1.593367, 1.760024, 0.4429495, 1, 0, 0.3411765, 1,
1.595774, 0.1883506, 0.6585932, 1, 0, 0.3372549, 1,
1.617631, 1.530913, 1.335801, 1, 0, 0.3294118, 1,
1.628543, -0.2108892, 3.968989, 1, 0, 0.3254902, 1,
1.633987, -0.8448055, 2.930307, 1, 0, 0.3176471, 1,
1.634855, -1.271018, 3.965681, 1, 0, 0.3137255, 1,
1.639792, -1.499505, 0.7072291, 1, 0, 0.3058824, 1,
1.643371, -1.647769, 3.156517, 1, 0, 0.2980392, 1,
1.645236, 2.035501, 0.4704688, 1, 0, 0.2941177, 1,
1.655184, 0.9883585, 1.154345, 1, 0, 0.2862745, 1,
1.671074, 0.1400544, 1.946013, 1, 0, 0.282353, 1,
1.674081, -0.4226585, 1.995386, 1, 0, 0.2745098, 1,
1.67414, -1.812168, 2.556777, 1, 0, 0.2705882, 1,
1.685998, 1.100786, 2.165277, 1, 0, 0.2627451, 1,
1.715732, -0.8383324, 1.697302, 1, 0, 0.2588235, 1,
1.727775, 0.4608434, 0.8885823, 1, 0, 0.2509804, 1,
1.727949, -2.037144, 3.243051, 1, 0, 0.2470588, 1,
1.753578, 0.4467164, 0.618843, 1, 0, 0.2392157, 1,
1.759089, 1.776997, 1.413514, 1, 0, 0.2352941, 1,
1.775883, 0.2031151, 2.133427, 1, 0, 0.227451, 1,
1.778408, 0.5173451, 1.388661, 1, 0, 0.2235294, 1,
1.786534, -0.3822576, 0.3138261, 1, 0, 0.2156863, 1,
1.793912, -0.4610928, 0.07854168, 1, 0, 0.2117647, 1,
1.806187, -1.243824, 2.343196, 1, 0, 0.2039216, 1,
1.838315, -0.5167076, 2.465906, 1, 0, 0.1960784, 1,
1.854408, -1.269622, 1.849976, 1, 0, 0.1921569, 1,
1.867027, 1.127355, 0.2832041, 1, 0, 0.1843137, 1,
1.872413, 0.6456065, 2.784, 1, 0, 0.1803922, 1,
1.875609, 1.402713, -0.2179855, 1, 0, 0.172549, 1,
1.891865, -1.803544, 3.478038, 1, 0, 0.1686275, 1,
1.897693, -0.8135794, 1.52176, 1, 0, 0.1607843, 1,
1.954091, 1.290611, -0.322493, 1, 0, 0.1568628, 1,
1.964627, -1.026867, 0.8943983, 1, 0, 0.1490196, 1,
2.039494, 0.04064773, 0.2140761, 1, 0, 0.145098, 1,
2.054395, -0.1431617, 1.47594, 1, 0, 0.1372549, 1,
2.064831, 0.0138608, 4.483893, 1, 0, 0.1333333, 1,
2.07609, -0.1695155, -1.80338, 1, 0, 0.1254902, 1,
2.113513, -0.2574547, 2.015532, 1, 0, 0.1215686, 1,
2.115376, -1.33259, 2.927254, 1, 0, 0.1137255, 1,
2.11937, 2.29156, 1.072612, 1, 0, 0.1098039, 1,
2.13964, 0.3005773, 0.1351421, 1, 0, 0.1019608, 1,
2.180499, 1.556923, -0.206393, 1, 0, 0.09411765, 1,
2.206314, -0.4404204, 2.508771, 1, 0, 0.09019608, 1,
2.20927, -1.10693, 0.3337566, 1, 0, 0.08235294, 1,
2.275546, -1.82027, 1.487197, 1, 0, 0.07843138, 1,
2.283083, -0.8662101, 2.728694, 1, 0, 0.07058824, 1,
2.28896, -2.066551, 4.072601, 1, 0, 0.06666667, 1,
2.29199, 0.5530497, 1.904983, 1, 0, 0.05882353, 1,
2.335477, -1.840015, 1.648437, 1, 0, 0.05490196, 1,
2.339357, 0.5295743, 2.244294, 1, 0, 0.04705882, 1,
2.349943, 0.3273741, 2.230901, 1, 0, 0.04313726, 1,
2.416345, 0.295104, 1.602904, 1, 0, 0.03529412, 1,
2.476272, -0.8473427, 1.540937, 1, 0, 0.03137255, 1,
2.480895, 0.8022062, 0.7018725, 1, 0, 0.02352941, 1,
2.483341, 0.06614075, 2.441604, 1, 0, 0.01960784, 1,
2.577924, 0.4674327, 0.5858408, 1, 0, 0.01176471, 1,
2.67465, -0.5292053, 0.1657305, 1, 0, 0.007843138, 1
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
-0.3120717, -4.543467, -7.095056, 0, -0.5, 0.5, 0.5,
-0.3120717, -4.543467, -7.095056, 1, -0.5, 0.5, 0.5,
-0.3120717, -4.543467, -7.095056, 1, 1.5, 0.5, 0.5,
-0.3120717, -4.543467, -7.095056, 0, 1.5, 0.5, 0.5
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
-4.311292, -0.4535711, -7.095056, 0, -0.5, 0.5, 0.5,
-4.311292, -0.4535711, -7.095056, 1, -0.5, 0.5, 0.5,
-4.311292, -0.4535711, -7.095056, 1, 1.5, 0.5, 0.5,
-4.311292, -0.4535711, -7.095056, 0, 1.5, 0.5, 0.5
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
-4.311292, -4.543467, -0.1119516, 0, -0.5, 0.5, 0.5,
-4.311292, -4.543467, -0.1119516, 1, -0.5, 0.5, 0.5,
-4.311292, -4.543467, -0.1119516, 1, 1.5, 0.5, 0.5,
-4.311292, -4.543467, -0.1119516, 0, 1.5, 0.5, 0.5
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
-3, -3.599645, -5.483571,
2, -3.599645, -5.483571,
-3, -3.599645, -5.483571,
-3, -3.756948, -5.752151,
-2, -3.599645, -5.483571,
-2, -3.756948, -5.752151,
-1, -3.599645, -5.483571,
-1, -3.756948, -5.752151,
0, -3.599645, -5.483571,
0, -3.756948, -5.752151,
1, -3.599645, -5.483571,
1, -3.756948, -5.752151,
2, -3.599645, -5.483571,
2, -3.756948, -5.752151
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
-3, -4.071556, -6.289313, 0, -0.5, 0.5, 0.5,
-3, -4.071556, -6.289313, 1, -0.5, 0.5, 0.5,
-3, -4.071556, -6.289313, 1, 1.5, 0.5, 0.5,
-3, -4.071556, -6.289313, 0, 1.5, 0.5, 0.5,
-2, -4.071556, -6.289313, 0, -0.5, 0.5, 0.5,
-2, -4.071556, -6.289313, 1, -0.5, 0.5, 0.5,
-2, -4.071556, -6.289313, 1, 1.5, 0.5, 0.5,
-2, -4.071556, -6.289313, 0, 1.5, 0.5, 0.5,
-1, -4.071556, -6.289313, 0, -0.5, 0.5, 0.5,
-1, -4.071556, -6.289313, 1, -0.5, 0.5, 0.5,
-1, -4.071556, -6.289313, 1, 1.5, 0.5, 0.5,
-1, -4.071556, -6.289313, 0, 1.5, 0.5, 0.5,
0, -4.071556, -6.289313, 0, -0.5, 0.5, 0.5,
0, -4.071556, -6.289313, 1, -0.5, 0.5, 0.5,
0, -4.071556, -6.289313, 1, 1.5, 0.5, 0.5,
0, -4.071556, -6.289313, 0, 1.5, 0.5, 0.5,
1, -4.071556, -6.289313, 0, -0.5, 0.5, 0.5,
1, -4.071556, -6.289313, 1, -0.5, 0.5, 0.5,
1, -4.071556, -6.289313, 1, 1.5, 0.5, 0.5,
1, -4.071556, -6.289313, 0, 1.5, 0.5, 0.5,
2, -4.071556, -6.289313, 0, -0.5, 0.5, 0.5,
2, -4.071556, -6.289313, 1, -0.5, 0.5, 0.5,
2, -4.071556, -6.289313, 1, 1.5, 0.5, 0.5,
2, -4.071556, -6.289313, 0, 1.5, 0.5, 0.5
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
-3.388395, -3, -5.483571,
-3.388395, 2, -5.483571,
-3.388395, -3, -5.483571,
-3.542211, -3, -5.752151,
-3.388395, -2, -5.483571,
-3.542211, -2, -5.752151,
-3.388395, -1, -5.483571,
-3.542211, -1, -5.752151,
-3.388395, 0, -5.483571,
-3.542211, 0, -5.752151,
-3.388395, 1, -5.483571,
-3.542211, 1, -5.752151,
-3.388395, 2, -5.483571,
-3.542211, 2, -5.752151
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
-3.849843, -3, -6.289313, 0, -0.5, 0.5, 0.5,
-3.849843, -3, -6.289313, 1, -0.5, 0.5, 0.5,
-3.849843, -3, -6.289313, 1, 1.5, 0.5, 0.5,
-3.849843, -3, -6.289313, 0, 1.5, 0.5, 0.5,
-3.849843, -2, -6.289313, 0, -0.5, 0.5, 0.5,
-3.849843, -2, -6.289313, 1, -0.5, 0.5, 0.5,
-3.849843, -2, -6.289313, 1, 1.5, 0.5, 0.5,
-3.849843, -2, -6.289313, 0, 1.5, 0.5, 0.5,
-3.849843, -1, -6.289313, 0, -0.5, 0.5, 0.5,
-3.849843, -1, -6.289313, 1, -0.5, 0.5, 0.5,
-3.849843, -1, -6.289313, 1, 1.5, 0.5, 0.5,
-3.849843, -1, -6.289313, 0, 1.5, 0.5, 0.5,
-3.849843, 0, -6.289313, 0, -0.5, 0.5, 0.5,
-3.849843, 0, -6.289313, 1, -0.5, 0.5, 0.5,
-3.849843, 0, -6.289313, 1, 1.5, 0.5, 0.5,
-3.849843, 0, -6.289313, 0, 1.5, 0.5, 0.5,
-3.849843, 1, -6.289313, 0, -0.5, 0.5, 0.5,
-3.849843, 1, -6.289313, 1, -0.5, 0.5, 0.5,
-3.849843, 1, -6.289313, 1, 1.5, 0.5, 0.5,
-3.849843, 1, -6.289313, 0, 1.5, 0.5, 0.5,
-3.849843, 2, -6.289313, 0, -0.5, 0.5, 0.5,
-3.849843, 2, -6.289313, 1, -0.5, 0.5, 0.5,
-3.849843, 2, -6.289313, 1, 1.5, 0.5, 0.5,
-3.849843, 2, -6.289313, 0, 1.5, 0.5, 0.5
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
-3.388395, -3.599645, -4,
-3.388395, -3.599645, 4,
-3.388395, -3.599645, -4,
-3.542211, -3.756948, -4,
-3.388395, -3.599645, -2,
-3.542211, -3.756948, -2,
-3.388395, -3.599645, 0,
-3.542211, -3.756948, 0,
-3.388395, -3.599645, 2,
-3.542211, -3.756948, 2,
-3.388395, -3.599645, 4,
-3.542211, -3.756948, 4
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
-3.849843, -4.071556, -4, 0, -0.5, 0.5, 0.5,
-3.849843, -4.071556, -4, 1, -0.5, 0.5, 0.5,
-3.849843, -4.071556, -4, 1, 1.5, 0.5, 0.5,
-3.849843, -4.071556, -4, 0, 1.5, 0.5, 0.5,
-3.849843, -4.071556, -2, 0, -0.5, 0.5, 0.5,
-3.849843, -4.071556, -2, 1, -0.5, 0.5, 0.5,
-3.849843, -4.071556, -2, 1, 1.5, 0.5, 0.5,
-3.849843, -4.071556, -2, 0, 1.5, 0.5, 0.5,
-3.849843, -4.071556, 0, 0, -0.5, 0.5, 0.5,
-3.849843, -4.071556, 0, 1, -0.5, 0.5, 0.5,
-3.849843, -4.071556, 0, 1, 1.5, 0.5, 0.5,
-3.849843, -4.071556, 0, 0, 1.5, 0.5, 0.5,
-3.849843, -4.071556, 2, 0, -0.5, 0.5, 0.5,
-3.849843, -4.071556, 2, 1, -0.5, 0.5, 0.5,
-3.849843, -4.071556, 2, 1, 1.5, 0.5, 0.5,
-3.849843, -4.071556, 2, 0, 1.5, 0.5, 0.5,
-3.849843, -4.071556, 4, 0, -0.5, 0.5, 0.5,
-3.849843, -4.071556, 4, 1, -0.5, 0.5, 0.5,
-3.849843, -4.071556, 4, 1, 1.5, 0.5, 0.5,
-3.849843, -4.071556, 4, 0, 1.5, 0.5, 0.5
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
-3.388395, -3.599645, -5.483571,
-3.388395, 2.692502, -5.483571,
-3.388395, -3.599645, 5.259667,
-3.388395, 2.692502, 5.259667,
-3.388395, -3.599645, -5.483571,
-3.388395, -3.599645, 5.259667,
-3.388395, 2.692502, -5.483571,
-3.388395, 2.692502, 5.259667,
-3.388395, -3.599645, -5.483571,
2.764251, -3.599645, -5.483571,
-3.388395, -3.599645, 5.259667,
2.764251, -3.599645, 5.259667,
-3.388395, 2.692502, -5.483571,
2.764251, 2.692502, -5.483571,
-3.388395, 2.692502, 5.259667,
2.764251, 2.692502, 5.259667,
2.764251, -3.599645, -5.483571,
2.764251, 2.692502, -5.483571,
2.764251, -3.599645, 5.259667,
2.764251, 2.692502, 5.259667,
2.764251, -3.599645, -5.483571,
2.764251, -3.599645, 5.259667,
2.764251, 2.692502, -5.483571,
2.764251, 2.692502, 5.259667
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
var radius = 7.415668;
var distance = 32.99314;
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
mvMatrix.translate( 0.3120717, 0.4535711, 0.1119516 );
mvMatrix.scale( 1.303174, 1.274281, 0.7463267 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.99314);
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
xylylcarb<-read.table("xylylcarb.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-xylylcarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'xylylcarb' not found
```

```r
y<-xylylcarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'xylylcarb' not found
```

```r
z<-xylylcarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'xylylcarb' not found
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
-3.298793, 0.0602992, -1.387787, 0, 0, 1, 1, 1,
-2.93133, -0.6439269, 1.107137, 1, 0, 0, 1, 1,
-2.782547, 0.4074574, -1.602695, 1, 0, 0, 1, 1,
-2.729329, -1.119506, -0.3464724, 1, 0, 0, 1, 1,
-2.698569, 1.67375, -0.8063542, 1, 0, 0, 1, 1,
-2.674098, 0.0308744, -0.4119654, 1, 0, 0, 1, 1,
-2.569893, 1.680347, -0.8926038, 0, 0, 0, 1, 1,
-2.509912, 0.5840414, -0.4938787, 0, 0, 0, 1, 1,
-2.49059, -0.8849756, -1.75952, 0, 0, 0, 1, 1,
-2.474763, -0.6639919, -1.278822, 0, 0, 0, 1, 1,
-2.443408, -0.1467046, -0.8973919, 0, 0, 0, 1, 1,
-2.42708, 1.766661, 0.09656128, 0, 0, 0, 1, 1,
-2.415528, 0.4539993, -1.134777, 0, 0, 0, 1, 1,
-2.331095, -1.35971, -0.54776, 1, 1, 1, 1, 1,
-2.283934, -0.5638778, -1.455028, 1, 1, 1, 1, 1,
-2.279834, -0.2084835, -2.363706, 1, 1, 1, 1, 1,
-2.270275, -0.8812532, -0.9951282, 1, 1, 1, 1, 1,
-2.261591, 0.8735067, -1.594678, 1, 1, 1, 1, 1,
-2.227749, -1.152031, -2.609327, 1, 1, 1, 1, 1,
-2.161272, -0.04601571, -1.358727, 1, 1, 1, 1, 1,
-2.130152, 1.173792, -0.5561857, 1, 1, 1, 1, 1,
-2.095108, -1.089882, -2.464976, 1, 1, 1, 1, 1,
-2.089773, 1.29451, -1.174468, 1, 1, 1, 1, 1,
-2.062041, -0.642325, -1.547123, 1, 1, 1, 1, 1,
-2.038258, 0.3576826, -2.20769, 1, 1, 1, 1, 1,
-2.007321, 0.7848701, -2.548955, 1, 1, 1, 1, 1,
-2.004419, 0.1828339, -0.381265, 1, 1, 1, 1, 1,
-1.986416, -0.103767, -1.781635, 1, 1, 1, 1, 1,
-1.974428, 1.146408, 0.3921357, 0, 0, 1, 1, 1,
-1.970968, -0.1942072, -3.158962, 1, 0, 0, 1, 1,
-1.962788, 0.08005332, -0.877148, 1, 0, 0, 1, 1,
-1.93744, -1.0597, -4.059702, 1, 0, 0, 1, 1,
-1.925331, -1.082879, -1.674578, 1, 0, 0, 1, 1,
-1.921815, -0.737349, -2.083905, 1, 0, 0, 1, 1,
-1.907014, -0.583352, -2.134112, 0, 0, 0, 1, 1,
-1.89563, 0.729126, -2.109745, 0, 0, 0, 1, 1,
-1.862765, 0.6930646, -1.600521, 0, 0, 0, 1, 1,
-1.859884, -0.3656879, -1.189989, 0, 0, 0, 1, 1,
-1.842685, 0.3466427, -1.233145, 0, 0, 0, 1, 1,
-1.828041, -0.6184674, -1.779104, 0, 0, 0, 1, 1,
-1.825985, 0.2146463, -2.056853, 0, 0, 0, 1, 1,
-1.818009, -0.6347922, 0.4080354, 1, 1, 1, 1, 1,
-1.791, -0.830604, -4.004518, 1, 1, 1, 1, 1,
-1.777039, -0.1941545, -3.646169, 1, 1, 1, 1, 1,
-1.756351, 0.3299535, -1.186147, 1, 1, 1, 1, 1,
-1.750827, 0.0650479, -2.211293, 1, 1, 1, 1, 1,
-1.749935, -0.8369943, -3.302944, 1, 1, 1, 1, 1,
-1.748426, 0.7269599, -1.506633, 1, 1, 1, 1, 1,
-1.747613, -0.8597304, -0.7082011, 1, 1, 1, 1, 1,
-1.738822, 1.85431, -0.3853839, 1, 1, 1, 1, 1,
-1.734741, -1.41683, -0.1173716, 1, 1, 1, 1, 1,
-1.732991, 0.8304714, 1.106841, 1, 1, 1, 1, 1,
-1.701807, 0.6631894, -2.252322, 1, 1, 1, 1, 1,
-1.689934, -0.6195665, -2.680845, 1, 1, 1, 1, 1,
-1.687153, 0.8361212, -2.445648, 1, 1, 1, 1, 1,
-1.684402, -0.5221581, -2.153959, 1, 1, 1, 1, 1,
-1.66931, -0.8767254, 0.2141559, 0, 0, 1, 1, 1,
-1.665332, 1.474989, -1.986222, 1, 0, 0, 1, 1,
-1.66166, -1.714283, -0.5591329, 1, 0, 0, 1, 1,
-1.656792, 0.7462019, -1.150882, 1, 0, 0, 1, 1,
-1.65673, 2.059776, -1.539009, 1, 0, 0, 1, 1,
-1.611377, 0.9733332, -0.3933456, 1, 0, 0, 1, 1,
-1.586798, -0.3950347, -1.586622, 0, 0, 0, 1, 1,
-1.57285, -0.9143788, -1.441055, 0, 0, 0, 1, 1,
-1.5568, 0.2674781, -2.172739, 0, 0, 0, 1, 1,
-1.546749, 0.2147066, -1.89717, 0, 0, 0, 1, 1,
-1.543987, -1.021731, -2.701211, 0, 0, 0, 1, 1,
-1.522972, -0.3094189, -1.351676, 0, 0, 0, 1, 1,
-1.522489, -1.644993, -2.788144, 0, 0, 0, 1, 1,
-1.500885, -1.816582, -0.4545779, 1, 1, 1, 1, 1,
-1.492466, 0.7293574, -0.5610679, 1, 1, 1, 1, 1,
-1.480889, -1.018512, -1.162179, 1, 1, 1, 1, 1,
-1.477763, 0.7516946, -1.576337, 1, 1, 1, 1, 1,
-1.476581, 0.6884061, -2.581448, 1, 1, 1, 1, 1,
-1.465504, -0.6134258, -2.118065, 1, 1, 1, 1, 1,
-1.463821, -0.4916865, -3.144578, 1, 1, 1, 1, 1,
-1.455156, 0.9340944, -1.84355, 1, 1, 1, 1, 1,
-1.446718, 0.08648458, -1.668748, 1, 1, 1, 1, 1,
-1.430601, -1.25293, -2.453871, 1, 1, 1, 1, 1,
-1.429816, -1.824771, -2.18368, 1, 1, 1, 1, 1,
-1.418757, -0.9754483, -2.584936, 1, 1, 1, 1, 1,
-1.416991, 0.299204, -1.292108, 1, 1, 1, 1, 1,
-1.39727, 0.376086, 0.7680919, 1, 1, 1, 1, 1,
-1.392337, 0.2238943, -1.300691, 1, 1, 1, 1, 1,
-1.37939, -0.6280438, -2.11909, 0, 0, 1, 1, 1,
-1.378801, 1.100461, 0.1261709, 1, 0, 0, 1, 1,
-1.373434, -1.069069, -3.005231, 1, 0, 0, 1, 1,
-1.36935, -0.8829316, -1.103585, 1, 0, 0, 1, 1,
-1.368652, -0.4288399, -0.2206852, 1, 0, 0, 1, 1,
-1.326962, -1.734973, -1.359593, 1, 0, 0, 1, 1,
-1.323899, -1.269043, -4.735861, 0, 0, 0, 1, 1,
-1.321684, -2.319665, -4.11392, 0, 0, 0, 1, 1,
-1.316211, 0.4817658, -1.377097, 0, 0, 0, 1, 1,
-1.306433, -0.8936554, -1.397479, 0, 0, 0, 1, 1,
-1.295678, -0.7918096, -2.341805, 0, 0, 0, 1, 1,
-1.284108, 0.08187209, -3.168824, 0, 0, 0, 1, 1,
-1.280418, -0.8431711, -2.676259, 0, 0, 0, 1, 1,
-1.269136, 0.2223034, -1.232099, 1, 1, 1, 1, 1,
-1.262375, -0.5672513, -0.6075497, 1, 1, 1, 1, 1,
-1.251614, 2.0237, -1.594995, 1, 1, 1, 1, 1,
-1.24246, -0.5504317, -2.595626, 1, 1, 1, 1, 1,
-1.241576, 0.1264596, -2.736592, 1, 1, 1, 1, 1,
-1.241344, -0.7360327, -1.639646, 1, 1, 1, 1, 1,
-1.23954, 1.056287, -0.8652021, 1, 1, 1, 1, 1,
-1.236197, -0.01228163, -0.6366607, 1, 1, 1, 1, 1,
-1.227283, -0.1087311, -0.8868851, 1, 1, 1, 1, 1,
-1.224002, 0.2220318, -1.612327, 1, 1, 1, 1, 1,
-1.213608, 0.0428384, -0.2159645, 1, 1, 1, 1, 1,
-1.21236, -0.3985709, -1.169984, 1, 1, 1, 1, 1,
-1.200187, 2.45186, 0.5357766, 1, 1, 1, 1, 1,
-1.198654, -1.281089, -1.5207, 1, 1, 1, 1, 1,
-1.197132, -0.01597636, -2.020467, 1, 1, 1, 1, 1,
-1.195748, 0.8576968, -1.085904, 0, 0, 1, 1, 1,
-1.191906, 1.502979, 0.2876266, 1, 0, 0, 1, 1,
-1.185936, 0.4010839, -1.699456, 1, 0, 0, 1, 1,
-1.178383, -1.026886, -2.579724, 1, 0, 0, 1, 1,
-1.174343, -0.4941359, -1.997104, 1, 0, 0, 1, 1,
-1.172165, 0.1875104, -0.1413043, 1, 0, 0, 1, 1,
-1.171493, -0.6969678, -0.6643718, 0, 0, 0, 1, 1,
-1.163835, -0.02173446, 0.4412281, 0, 0, 0, 1, 1,
-1.153799, 1.331048, 1.17015, 0, 0, 0, 1, 1,
-1.143008, -0.9366131, -3.000746, 0, 0, 0, 1, 1,
-1.142034, 0.8703266, -0.3255238, 0, 0, 0, 1, 1,
-1.140742, -1.998539, -2.472519, 0, 0, 0, 1, 1,
-1.14005, -2.195191, -3.544686, 0, 0, 0, 1, 1,
-1.139593, 1.079032, -0.0613768, 1, 1, 1, 1, 1,
-1.138405, -1.973969, -1.521769, 1, 1, 1, 1, 1,
-1.136132, -0.4705131, -1.882732, 1, 1, 1, 1, 1,
-1.123681, -0.6618487, -0.2737221, 1, 1, 1, 1, 1,
-1.119976, 0.2156992, -2.634226, 1, 1, 1, 1, 1,
-1.117969, -1.349718, -2.291251, 1, 1, 1, 1, 1,
-1.10708, 0.4422487, -0.4126119, 1, 1, 1, 1, 1,
-1.105366, -2.765071, -5.327116, 1, 1, 1, 1, 1,
-1.093471, -0.1691649, -1.460752, 1, 1, 1, 1, 1,
-1.091735, -0.9826332, -4.713561, 1, 1, 1, 1, 1,
-1.089981, 0.7884986, -1.404999, 1, 1, 1, 1, 1,
-1.088755, 0.7333893, -1.896438, 1, 1, 1, 1, 1,
-1.084605, 0.2122328, -0.7437357, 1, 1, 1, 1, 1,
-1.082314, -0.4882149, -2.030593, 1, 1, 1, 1, 1,
-1.08125, -0.520883, -2.292712, 1, 1, 1, 1, 1,
-1.080447, 0.5404043, -1.031853, 0, 0, 1, 1, 1,
-1.078911, 0.6588451, -1.369318, 1, 0, 0, 1, 1,
-1.07242, -0.7101271, -1.912652, 1, 0, 0, 1, 1,
-1.067022, -1.274594, -1.249936, 1, 0, 0, 1, 1,
-1.066575, 0.84069, -0.2925319, 1, 0, 0, 1, 1,
-1.060668, 0.2052126, -0.3982078, 1, 0, 0, 1, 1,
-1.052405, -1.225117, -3.764436, 0, 0, 0, 1, 1,
-1.051041, -0.6697184, -2.434443, 0, 0, 0, 1, 1,
-1.048998, -0.3357289, -1.38644, 0, 0, 0, 1, 1,
-1.048428, -0.2682337, -3.058162, 0, 0, 0, 1, 1,
-1.043353, 0.3118153, 0.4284566, 0, 0, 0, 1, 1,
-1.040446, -1.166232, -3.222281, 0, 0, 0, 1, 1,
-1.039719, 1.539865, -1.721444, 0, 0, 0, 1, 1,
-1.034088, 1.184308, -2.069748, 1, 1, 1, 1, 1,
-1.03271, -0.1587933, -1.813723, 1, 1, 1, 1, 1,
-1.028415, -0.6816716, -0.9374805, 1, 1, 1, 1, 1,
-1.028244, -1.600166, -3.284443, 1, 1, 1, 1, 1,
-1.02552, 0.4312604, -0.9577859, 1, 1, 1, 1, 1,
-1.023332, 1.451609, -0.40927, 1, 1, 1, 1, 1,
-1.017464, 0.521033, -1.13254, 1, 1, 1, 1, 1,
-1.011678, -0.1211288, -2.451744, 1, 1, 1, 1, 1,
-1.011318, -0.9056709, -2.838199, 1, 1, 1, 1, 1,
-1.006884, -0.5197399, -2.261751, 1, 1, 1, 1, 1,
-1.005519, 0.4038749, -2.28942, 1, 1, 1, 1, 1,
-1.0033, -0.08664946, -0.7265336, 1, 1, 1, 1, 1,
-0.9921468, 0.9550169, -1.780118, 1, 1, 1, 1, 1,
-0.9883271, 0.3056076, -1.745516, 1, 1, 1, 1, 1,
-0.9814633, 0.6373981, -1.453221, 1, 1, 1, 1, 1,
-0.9798153, 0.07588825, -1.704296, 0, 0, 1, 1, 1,
-0.9771754, 0.1034091, -1.051646, 1, 0, 0, 1, 1,
-0.9731182, -0.7791012, -2.16154, 1, 0, 0, 1, 1,
-0.9623247, 1.762781, -2.299473, 1, 0, 0, 1, 1,
-0.9576755, -1.914367, -2.596233, 1, 0, 0, 1, 1,
-0.9568985, -1.388866, -2.762486, 1, 0, 0, 1, 1,
-0.9485865, 0.1164722, -1.716426, 0, 0, 0, 1, 1,
-0.9457074, 0.6848172, 0.14381, 0, 0, 0, 1, 1,
-0.945064, 0.7026992, -1.562726, 0, 0, 0, 1, 1,
-0.9420285, 1.42767, 0.0333463, 0, 0, 0, 1, 1,
-0.9411862, 0.5905141, -3.792104, 0, 0, 0, 1, 1,
-0.9407008, -2.551781, -1.139727, 0, 0, 0, 1, 1,
-0.9390219, 0.4643483, -0.9181376, 0, 0, 0, 1, 1,
-0.9271211, 1.956854, 0.8976213, 1, 1, 1, 1, 1,
-0.9212557, 1.035388, -1.406348, 1, 1, 1, 1, 1,
-0.9200946, -0.8296486, -2.076344, 1, 1, 1, 1, 1,
-0.9162008, -0.962339, -2.677783, 1, 1, 1, 1, 1,
-0.9143078, 0.02107337, -1.945593, 1, 1, 1, 1, 1,
-0.9143038, -1.598028, -2.476002, 1, 1, 1, 1, 1,
-0.9099561, 1.803007, -1.621586, 1, 1, 1, 1, 1,
-0.9093633, 0.9407408, -0.4653856, 1, 1, 1, 1, 1,
-0.9080798, 0.1827394, -1.221224, 1, 1, 1, 1, 1,
-0.8963125, 0.443137, 0.06856363, 1, 1, 1, 1, 1,
-0.890597, -0.9089065, -3.401644, 1, 1, 1, 1, 1,
-0.8839323, -1.526403, -2.022401, 1, 1, 1, 1, 1,
-0.8823209, -0.2960183, -1.285273, 1, 1, 1, 1, 1,
-0.8791705, -1.19453, -1.079538, 1, 1, 1, 1, 1,
-0.8749132, -0.1962338, -2.063607, 1, 1, 1, 1, 1,
-0.8747029, -0.6831053, -1.950483, 0, 0, 1, 1, 1,
-0.8674805, 1.709038, 0.05766815, 1, 0, 0, 1, 1,
-0.8577958, -0.8458876, -1.26839, 1, 0, 0, 1, 1,
-0.8562, -0.2344658, -2.565794, 1, 0, 0, 1, 1,
-0.8528903, -0.6585338, -1.937296, 1, 0, 0, 1, 1,
-0.852533, 1.232374, -2.062118, 1, 0, 0, 1, 1,
-0.8413793, -0.04411578, -1.856008, 0, 0, 0, 1, 1,
-0.8403408, -0.4408354, -1.496453, 0, 0, 0, 1, 1,
-0.8355066, -0.5589567, -2.345279, 0, 0, 0, 1, 1,
-0.8279448, -2.471851, -2.1051, 0, 0, 0, 1, 1,
-0.8256829, -1.724164, -3.336034, 0, 0, 0, 1, 1,
-0.8180144, -0.9163495, -3.265119, 0, 0, 0, 1, 1,
-0.8110955, 0.6332496, -2.658461, 0, 0, 0, 1, 1,
-0.8068363, -0.5160692, -1.060582, 1, 1, 1, 1, 1,
-0.8064101, -0.7604027, -2.699559, 1, 1, 1, 1, 1,
-0.8020107, -1.191419, -2.802781, 1, 1, 1, 1, 1,
-0.7983775, 0.2097635, -1.343088, 1, 1, 1, 1, 1,
-0.797964, -0.5937582, -4.049379, 1, 1, 1, 1, 1,
-0.7937391, 0.410068, -2.536423, 1, 1, 1, 1, 1,
-0.7911177, 0.899344, 0.02888538, 1, 1, 1, 1, 1,
-0.7863725, -0.04307664, -3.499876, 1, 1, 1, 1, 1,
-0.7851107, 0.3476279, -1.149461, 1, 1, 1, 1, 1,
-0.7809488, 0.333857, -0.9563603, 1, 1, 1, 1, 1,
-0.7779269, -2.31037, -3.319052, 1, 1, 1, 1, 1,
-0.7705098, 1.757127, 0.2179762, 1, 1, 1, 1, 1,
-0.7696207, 0.839215, -1.685046, 1, 1, 1, 1, 1,
-0.7689701, 0.1598299, -3.67711, 1, 1, 1, 1, 1,
-0.7677614, -0.8197382, 0.6663683, 1, 1, 1, 1, 1,
-0.7634224, 0.680126, -0.4843098, 0, 0, 1, 1, 1,
-0.7627973, 0.6854727, 0.0259563, 1, 0, 0, 1, 1,
-0.7597553, -0.5527639, -1.632176, 1, 0, 0, 1, 1,
-0.7557732, 0.4343802, -1.211999, 1, 0, 0, 1, 1,
-0.7458414, 1.533505, -1.125636, 1, 0, 0, 1, 1,
-0.7351602, 0.05303387, -1.460429, 1, 0, 0, 1, 1,
-0.7305489, 0.4128258, -0.9034501, 0, 0, 0, 1, 1,
-0.7259734, -0.3697861, -3.322323, 0, 0, 0, 1, 1,
-0.7231175, 1.76039, 2.310264, 0, 0, 0, 1, 1,
-0.7212921, -0.9599357, -2.156633, 0, 0, 0, 1, 1,
-0.720856, -0.4546104, -2.253717, 0, 0, 0, 1, 1,
-0.7186806, 0.2257396, -1.328861, 0, 0, 0, 1, 1,
-0.7180419, -1.444008, -1.822409, 0, 0, 0, 1, 1,
-0.7157963, -1.233667, -3.129951, 1, 1, 1, 1, 1,
-0.714695, 0.6172587, -1.127357, 1, 1, 1, 1, 1,
-0.7112591, 1.200828, -0.1291024, 1, 1, 1, 1, 1,
-0.7094014, 0.8733484, -1.988186, 1, 1, 1, 1, 1,
-0.7020525, -2.115286, -3.652694, 1, 1, 1, 1, 1,
-0.6932878, -1.87832, -0.5922137, 1, 1, 1, 1, 1,
-0.6840727, -0.4146762, -0.7350047, 1, 1, 1, 1, 1,
-0.6804798, 0.2487117, -1.149895, 1, 1, 1, 1, 1,
-0.6746006, 0.9953191, -0.03456361, 1, 1, 1, 1, 1,
-0.652934, 0.9244263, -0.6238039, 1, 1, 1, 1, 1,
-0.6480279, 0.1058027, -1.988362, 1, 1, 1, 1, 1,
-0.6470581, -1.163056, -0.9220567, 1, 1, 1, 1, 1,
-0.6279826, -0.6117306, -3.073213, 1, 1, 1, 1, 1,
-0.6209385, 0.7751607, -1.594324, 1, 1, 1, 1, 1,
-0.6165072, 1.115918, -0.8803759, 1, 1, 1, 1, 1,
-0.6119771, 1.208482, -0.2411159, 0, 0, 1, 1, 1,
-0.609025, -0.8036901, -2.592134, 1, 0, 0, 1, 1,
-0.6087288, -0.08718895, -2.406659, 1, 0, 0, 1, 1,
-0.6083009, 0.2807553, -1.499853, 1, 0, 0, 1, 1,
-0.6046972, 0.1690569, -0.01930794, 1, 0, 0, 1, 1,
-0.6004141, 0.4577617, -0.1372286, 1, 0, 0, 1, 1,
-0.5972109, 2.175449, -0.8287905, 0, 0, 0, 1, 1,
-0.5892563, -0.2530522, -0.2066824, 0, 0, 0, 1, 1,
-0.5879815, 0.1430614, -1.465131, 0, 0, 0, 1, 1,
-0.5864789, 0.2225144, 0.2608516, 0, 0, 0, 1, 1,
-0.5862983, -0.0989218, -0.9266446, 0, 0, 0, 1, 1,
-0.5855738, -0.9966003, -3.693908, 0, 0, 0, 1, 1,
-0.584635, 0.6728561, -0.8878064, 0, 0, 0, 1, 1,
-0.5832208, -0.7748561, -2.539367, 1, 1, 1, 1, 1,
-0.5816249, 0.461503, -1.445974, 1, 1, 1, 1, 1,
-0.5794987, 0.4792712, 0.1163549, 1, 1, 1, 1, 1,
-0.573553, -1.072103, -2.900699, 1, 1, 1, 1, 1,
-0.5698108, 0.57316, -0.2212269, 1, 1, 1, 1, 1,
-0.5609891, -0.0257191, -1.860583, 1, 1, 1, 1, 1,
-0.5593618, -0.1851012, -3.468613, 1, 1, 1, 1, 1,
-0.5543813, -0.2326927, -2.524007, 1, 1, 1, 1, 1,
-0.5493435, -1.710103, -2.341128, 1, 1, 1, 1, 1,
-0.5446383, -0.5897583, -2.509341, 1, 1, 1, 1, 1,
-0.541272, -0.5088987, -3.018146, 1, 1, 1, 1, 1,
-0.5411111, -0.7420689, -3.377077, 1, 1, 1, 1, 1,
-0.531769, -0.2004035, -1.826654, 1, 1, 1, 1, 1,
-0.529335, -0.5165714, -2.038905, 1, 1, 1, 1, 1,
-0.5233995, 1.028436, -2.079864, 1, 1, 1, 1, 1,
-0.5206308, -0.1956032, -0.8453882, 0, 0, 1, 1, 1,
-0.5184592, 0.7074936, -1.257538, 1, 0, 0, 1, 1,
-0.5179861, 1.606987, -0.1133315, 1, 0, 0, 1, 1,
-0.5169616, -0.4831099, -2.42302, 1, 0, 0, 1, 1,
-0.5152178, 0.8418554, -0.2212602, 1, 0, 0, 1, 1,
-0.5086477, -0.2753327, -1.111664, 1, 0, 0, 1, 1,
-0.5082515, 2.181448, -0.712783, 0, 0, 0, 1, 1,
-0.5062348, 1.533928, -1.777956, 0, 0, 0, 1, 1,
-0.5015998, -0.7465298, -2.218146, 0, 0, 0, 1, 1,
-0.4967923, -0.7314301, -3.185063, 0, 0, 0, 1, 1,
-0.495957, 0.1702615, -2.933089, 0, 0, 0, 1, 1,
-0.4953786, 0.3327716, -1.277515, 0, 0, 0, 1, 1,
-0.4919261, 0.6221585, -1.963371, 0, 0, 0, 1, 1,
-0.4918597, 1.171946, -2.906961, 1, 1, 1, 1, 1,
-0.4908913, -0.5527752, -3.970125, 1, 1, 1, 1, 1,
-0.4888137, 1.514961, 1.030181, 1, 1, 1, 1, 1,
-0.4862261, -0.9514498, -1.569528, 1, 1, 1, 1, 1,
-0.4859424, 1.47747, -0.3450686, 1, 1, 1, 1, 1,
-0.4850475, -0.591037, -1.659241, 1, 1, 1, 1, 1,
-0.4849571, 0.4085888, -0.3052183, 1, 1, 1, 1, 1,
-0.483492, -1.907668, -0.8133528, 1, 1, 1, 1, 1,
-0.4809775, 0.08213329, -0.9196429, 1, 1, 1, 1, 1,
-0.480534, 0.2892146, -1.28412, 1, 1, 1, 1, 1,
-0.4802145, -0.4652232, -2.333928, 1, 1, 1, 1, 1,
-0.4784297, 0.5982112, -0.1989035, 1, 1, 1, 1, 1,
-0.4781021, -0.451577, -2.417836, 1, 1, 1, 1, 1,
-0.4706163, -0.4135701, -1.614893, 1, 1, 1, 1, 1,
-0.4700264, 0.1117392, -2.250008, 1, 1, 1, 1, 1,
-0.4643897, 0.1052994, -2.0167, 0, 0, 1, 1, 1,
-0.462536, -0.1759448, -1.836796, 1, 0, 0, 1, 1,
-0.4605344, -0.7508802, -2.930924, 1, 0, 0, 1, 1,
-0.4548976, 0.5504313, -1.669442, 1, 0, 0, 1, 1,
-0.4535309, 0.0685318, -1.525329, 1, 0, 0, 1, 1,
-0.4517515, -0.5213512, -0.8476733, 1, 0, 0, 1, 1,
-0.449034, -0.7337907, -2.841328, 0, 0, 0, 1, 1,
-0.4415784, 0.1610316, 0.2658079, 0, 0, 0, 1, 1,
-0.4365438, -0.4291663, -3.053674, 0, 0, 0, 1, 1,
-0.4323535, -2.037033, -4.265384, 0, 0, 0, 1, 1,
-0.4311434, -0.06299736, -2.047537, 0, 0, 0, 1, 1,
-0.4253493, -1.241239, -3.803239, 0, 0, 0, 1, 1,
-0.4248564, 0.4232435, -1.03565, 0, 0, 0, 1, 1,
-0.4245825, 0.5772767, -2.47721, 1, 1, 1, 1, 1,
-0.417711, -0.3688801, -1.633173, 1, 1, 1, 1, 1,
-0.411424, -1.433886, -2.97246, 1, 1, 1, 1, 1,
-0.4080105, 0.04849572, -1.050191, 1, 1, 1, 1, 1,
-0.4057948, -0.550935, -2.787025, 1, 1, 1, 1, 1,
-0.4048374, 0.7283726, -1.603781, 1, 1, 1, 1, 1,
-0.4018444, 0.6509895, -0.9194104, 1, 1, 1, 1, 1,
-0.4016454, -1.66339, -3.449104, 1, 1, 1, 1, 1,
-0.4002576, -0.01048705, -0.9538846, 1, 1, 1, 1, 1,
-0.3843577, -1.408212, -4.308999, 1, 1, 1, 1, 1,
-0.3799555, -0.3311274, -2.07082, 1, 1, 1, 1, 1,
-0.3769907, 0.9945432, -0.797375, 1, 1, 1, 1, 1,
-0.3767111, -0.5082867, -2.654044, 1, 1, 1, 1, 1,
-0.3720623, 0.3807071, -2.722774, 1, 1, 1, 1, 1,
-0.3653224, 0.4765096, -1.769535, 1, 1, 1, 1, 1,
-0.3645746, 1.160423, -0.9558078, 0, 0, 1, 1, 1,
-0.361852, -1.346004, -4.944448, 1, 0, 0, 1, 1,
-0.3519722, 0.0418986, -1.45008, 1, 0, 0, 1, 1,
-0.3515282, 0.3831865, -2.173515, 1, 0, 0, 1, 1,
-0.3498761, -0.297218, -1.576087, 1, 0, 0, 1, 1,
-0.3487152, 0.624507, 1.585871, 1, 0, 0, 1, 1,
-0.340891, -1.045453, -3.435211, 0, 0, 0, 1, 1,
-0.3363921, -0.009467981, -0.3029, 0, 0, 0, 1, 1,
-0.3348515, -0.343484, -4.33794, 0, 0, 0, 1, 1,
-0.3347705, 0.9529219, -0.5373341, 0, 0, 0, 1, 1,
-0.3346726, 1.021281, -0.44733, 0, 0, 0, 1, 1,
-0.3315924, -0.7496796, -1.996122, 0, 0, 0, 1, 1,
-0.3268779, -0.2178347, -2.152274, 0, 0, 0, 1, 1,
-0.3259414, -0.4484815, -1.489501, 1, 1, 1, 1, 1,
-0.3247251, -0.9037671, -1.060255, 1, 1, 1, 1, 1,
-0.3207626, -0.6181167, -1.658064, 1, 1, 1, 1, 1,
-0.3197782, 1.334211, -0.455858, 1, 1, 1, 1, 1,
-0.3192262, -0.05559843, -1.811889, 1, 1, 1, 1, 1,
-0.3190071, 0.2073609, -1.357261, 1, 1, 1, 1, 1,
-0.317209, -1.633934, -2.473826, 1, 1, 1, 1, 1,
-0.3146012, -0.2076218, -1.729645, 1, 1, 1, 1, 1,
-0.3143269, -0.7459909, -2.647419, 1, 1, 1, 1, 1,
-0.3070296, 0.3067421, -1.027164, 1, 1, 1, 1, 1,
-0.3070181, -0.9945351, -3.303561, 1, 1, 1, 1, 1,
-0.3039498, 0.5533278, -0.2107739, 1, 1, 1, 1, 1,
-0.2996757, -0.8219916, -1.54007, 1, 1, 1, 1, 1,
-0.2994549, 0.554477, 1.637638, 1, 1, 1, 1, 1,
-0.295674, 0.4237772, 0.8283177, 1, 1, 1, 1, 1,
-0.2947482, -1.305364, -2.608679, 0, 0, 1, 1, 1,
-0.2945823, 0.54668, 0.2269786, 1, 0, 0, 1, 1,
-0.2919873, 0.2188154, -2.133093, 1, 0, 0, 1, 1,
-0.2888863, -0.1842129, -3.744373, 1, 0, 0, 1, 1,
-0.287613, 0.01384106, -1.149055, 1, 0, 0, 1, 1,
-0.2780852, 1.439421, -0.2847163, 1, 0, 0, 1, 1,
-0.277369, -0.2287475, -1.725718, 0, 0, 0, 1, 1,
-0.2714495, 0.04719502, -0.05637854, 0, 0, 0, 1, 1,
-0.2696122, -0.7992553, -2.174632, 0, 0, 0, 1, 1,
-0.2690624, 2.019497, -0.3316278, 0, 0, 0, 1, 1,
-0.2683737, -0.2837866, -2.627969, 0, 0, 0, 1, 1,
-0.2680376, -0.2526001, -1.577028, 0, 0, 0, 1, 1,
-0.2667714, 0.2712396, -0.4503396, 0, 0, 0, 1, 1,
-0.2634274, -0.7170141, -3.554368, 1, 1, 1, 1, 1,
-0.2618365, -0.6719123, -2.320446, 1, 1, 1, 1, 1,
-0.2602144, -0.4425261, -3.088045, 1, 1, 1, 1, 1,
-0.2595732, 2.320067, -2.210606, 1, 1, 1, 1, 1,
-0.2579461, 1.135977, 0.4429021, 1, 1, 1, 1, 1,
-0.2568517, 0.3829125, -0.2650195, 1, 1, 1, 1, 1,
-0.2514795, 0.443594, 0.6996818, 1, 1, 1, 1, 1,
-0.2490981, -1.182648, -2.432533, 1, 1, 1, 1, 1,
-0.2441721, 0.1168662, -2.075502, 1, 1, 1, 1, 1,
-0.240841, -1.368799, -2.042533, 1, 1, 1, 1, 1,
-0.2370195, -0.1729426, -0.2492064, 1, 1, 1, 1, 1,
-0.2361768, -0.1942396, -3.957167, 1, 1, 1, 1, 1,
-0.2355616, 0.8823988, 0.03827413, 1, 1, 1, 1, 1,
-0.2347929, -0.4442426, -2.609411, 1, 1, 1, 1, 1,
-0.2313915, 0.007658696, -3.364874, 1, 1, 1, 1, 1,
-0.2308331, -1.089673, -3.565082, 0, 0, 1, 1, 1,
-0.2294425, -0.2644256, -3.873675, 1, 0, 0, 1, 1,
-0.2257753, 0.1710153, -3.447198, 1, 0, 0, 1, 1,
-0.224226, 0.9391617, 1.068684, 1, 0, 0, 1, 1,
-0.2217237, -0.7722784, -2.075661, 1, 0, 0, 1, 1,
-0.2162874, -1.542387, -2.965109, 1, 0, 0, 1, 1,
-0.2138968, -1.129987, -3.025611, 0, 0, 0, 1, 1,
-0.2131464, -0.4587115, -2.997063, 0, 0, 0, 1, 1,
-0.2112343, 1.091084, -0.6573092, 0, 0, 0, 1, 1,
-0.2098159, -1.0677, -3.443297, 0, 0, 0, 1, 1,
-0.2084381, 1.925586, 0.4862924, 0, 0, 0, 1, 1,
-0.2050947, 0.2732218, -0.8322713, 0, 0, 0, 1, 1,
-0.2045421, 1.183897, 0.7060127, 0, 0, 0, 1, 1,
-0.1983158, 0.04991435, -1.302525, 1, 1, 1, 1, 1,
-0.1979319, 0.539791, -0.776774, 1, 1, 1, 1, 1,
-0.1964066, -0.8165605, -4.116172, 1, 1, 1, 1, 1,
-0.1955841, 0.03013242, 0.2730222, 1, 1, 1, 1, 1,
-0.1917466, 0.4637665, -0.802223, 1, 1, 1, 1, 1,
-0.1898166, -0.5705691, -3.082801, 1, 1, 1, 1, 1,
-0.1865643, -0.242015, -1.177544, 1, 1, 1, 1, 1,
-0.1860494, -0.4258711, -2.797303, 1, 1, 1, 1, 1,
-0.1807504, 1.411578, -0.03446501, 1, 1, 1, 1, 1,
-0.1804995, -1.482105, -3.620367, 1, 1, 1, 1, 1,
-0.1800446, -1.070367, -1.804604, 1, 1, 1, 1, 1,
-0.1798915, -0.4737639, -2.106786, 1, 1, 1, 1, 1,
-0.1781671, -2.507648, -4.057383, 1, 1, 1, 1, 1,
-0.1727911, 0.3024074, -1.825224, 1, 1, 1, 1, 1,
-0.1624503, 0.959626, -0.4188774, 1, 1, 1, 1, 1,
-0.1607556, -0.2647182, -2.488279, 0, 0, 1, 1, 1,
-0.1603971, 0.1837187, -0.4965843, 1, 0, 0, 1, 1,
-0.1567643, -1.467868, -3.555056, 1, 0, 0, 1, 1,
-0.1550464, 0.3251466, -1.068483, 1, 0, 0, 1, 1,
-0.1537195, -0.3561576, -3.292691, 1, 0, 0, 1, 1,
-0.1527014, -1.042464, -2.432491, 1, 0, 0, 1, 1,
-0.1507725, -0.7315786, -2.693629, 0, 0, 0, 1, 1,
-0.1492824, -1.962463, -2.800439, 0, 0, 0, 1, 1,
-0.1487727, -0.5785466, -2.229297, 0, 0, 0, 1, 1,
-0.1427707, 0.314799, 1.002573, 0, 0, 0, 1, 1,
-0.1423592, -0.007951304, -2.255788, 0, 0, 0, 1, 1,
-0.1419543, 1.286139, -0.2841886, 0, 0, 0, 1, 1,
-0.1414626, -0.2073659, -2.280897, 0, 0, 0, 1, 1,
-0.1371898, -0.4590143, -2.941761, 1, 1, 1, 1, 1,
-0.1363909, 0.2286451, -0.4356436, 1, 1, 1, 1, 1,
-0.1344044, -1.259415, -3.315762, 1, 1, 1, 1, 1,
-0.1322572, 0.940196, -1.623938, 1, 1, 1, 1, 1,
-0.1251196, 0.6187799, -2.361942, 1, 1, 1, 1, 1,
-0.1245631, -1.625954, -2.172742, 1, 1, 1, 1, 1,
-0.1243102, -0.4602176, -4.077366, 1, 1, 1, 1, 1,
-0.1237151, -0.7974052, -3.577922, 1, 1, 1, 1, 1,
-0.1233972, -0.191308, -2.947908, 1, 1, 1, 1, 1,
-0.1184781, -0.375338, -1.9082, 1, 1, 1, 1, 1,
-0.1163166, -1.100418, -3.010396, 1, 1, 1, 1, 1,
-0.1159217, 1.542683, -0.3822076, 1, 1, 1, 1, 1,
-0.1153358, 0.6880311, 2.053015, 1, 1, 1, 1, 1,
-0.1146003, -0.6132587, -3.13798, 1, 1, 1, 1, 1,
-0.1139417, 0.8120419, -0.4243555, 1, 1, 1, 1, 1,
-0.1120241, 1.252726, 0.3114571, 0, 0, 1, 1, 1,
-0.1119543, -0.5228705, -2.744462, 1, 0, 0, 1, 1,
-0.1108681, -1.597256, -2.17279, 1, 0, 0, 1, 1,
-0.1105877, -1.688286, -2.641236, 1, 0, 0, 1, 1,
-0.1076155, -1.882368, -2.34848, 1, 0, 0, 1, 1,
-0.1027884, 1.310785, 0.8704708, 1, 0, 0, 1, 1,
-0.1001716, -0.7800663, -3.487368, 0, 0, 0, 1, 1,
-0.0984958, 0.5801728, 0.3280583, 0, 0, 0, 1, 1,
-0.09633407, 2.228606, 0.5182583, 0, 0, 0, 1, 1,
-0.08986409, -0.5382236, -3.304598, 0, 0, 0, 1, 1,
-0.08234115, 0.4266393, 0.4938767, 0, 0, 0, 1, 1,
-0.08127428, 1.299459, 1.230181, 0, 0, 0, 1, 1,
-0.08029751, 0.3291895, 1.101915, 0, 0, 0, 1, 1,
-0.07686568, 0.9732367, 0.430856, 1, 1, 1, 1, 1,
-0.07562082, -0.4664908, -1.123493, 1, 1, 1, 1, 1,
-0.07249704, -1.433658, -3.058007, 1, 1, 1, 1, 1,
-0.07236436, 1.510713, 0.5237364, 1, 1, 1, 1, 1,
-0.07056481, -0.6157101, -3.994264, 1, 1, 1, 1, 1,
-0.0704149, 1.223125, 0.5970085, 1, 1, 1, 1, 1,
-0.06873975, 2.600869, 0.9706605, 1, 1, 1, 1, 1,
-0.06675022, 0.2732323, -0.6738616, 1, 1, 1, 1, 1,
-0.06451397, -0.2190115, -3.293029, 1, 1, 1, 1, 1,
-0.0629373, 0.5447272, -0.1041575, 1, 1, 1, 1, 1,
-0.06270443, 1.799104, 0.5796219, 1, 1, 1, 1, 1,
-0.06205405, 1.463057, 0.3832964, 1, 1, 1, 1, 1,
-0.05285012, 0.3177593, 0.1591099, 1, 1, 1, 1, 1,
-0.05011417, 0.912797, -0.05358753, 1, 1, 1, 1, 1,
-0.04651299, -1.321419, -4.302157, 1, 1, 1, 1, 1,
-0.04408007, 1.369987, -0.1413406, 0, 0, 1, 1, 1,
-0.04360086, -0.2743536, -2.41141, 1, 0, 0, 1, 1,
-0.04268834, -0.7430492, -2.452049, 1, 0, 0, 1, 1,
-0.03740427, 1.394891, -0.3024124, 1, 0, 0, 1, 1,
-0.03524224, -0.6378067, -1.93582, 1, 0, 0, 1, 1,
-0.03494167, 0.4264805, -0.6391734, 1, 0, 0, 1, 1,
-0.03333759, -1.043011, -2.149989, 0, 0, 0, 1, 1,
-0.02695561, -0.2653895, -3.780871, 0, 0, 0, 1, 1,
-0.02575817, 0.6176077, 0.09842937, 0, 0, 0, 1, 1,
-0.02255098, 1.424509, 0.05435809, 0, 0, 0, 1, 1,
-0.0199564, 0.6852916, 0.01107133, 0, 0, 0, 1, 1,
-0.01625961, 0.01309271, -1.729069, 0, 0, 0, 1, 1,
-0.01216415, 1.244553, 0.6510246, 0, 0, 0, 1, 1,
-0.00705894, 0.135396, -0.2578365, 1, 1, 1, 1, 1,
0.0008595416, 1.047604, -0.5111756, 1, 1, 1, 1, 1,
0.008757475, 1.518901, -0.01150393, 1, 1, 1, 1, 1,
0.01025006, 0.5105761, -1.309026, 1, 1, 1, 1, 1,
0.01031898, 0.1243223, 0.4382063, 1, 1, 1, 1, 1,
0.01483917, 0.9130038, 0.2811223, 1, 1, 1, 1, 1,
0.01648045, -0.9208533, 1.158187, 1, 1, 1, 1, 1,
0.01921033, -0.2732032, 2.766078, 1, 1, 1, 1, 1,
0.01934446, 0.7287441, -2.499163, 1, 1, 1, 1, 1,
0.02013845, -0.09529737, 2.696145, 1, 1, 1, 1, 1,
0.02066854, 0.1721293, 0.2416342, 1, 1, 1, 1, 1,
0.02492143, -0.2863523, 3.03868, 1, 1, 1, 1, 1,
0.02537529, -1.179237, 3.516733, 1, 1, 1, 1, 1,
0.02777863, 0.005323254, 3.796818, 1, 1, 1, 1, 1,
0.02861684, -1.097807, 3.224848, 1, 1, 1, 1, 1,
0.02969465, -1.316949, 1.184669, 0, 0, 1, 1, 1,
0.03299293, 2.584268, 0.7055237, 1, 0, 0, 1, 1,
0.03377102, 0.1325864, 0.1888521, 1, 0, 0, 1, 1,
0.03446795, 1.121534, 2.378278, 1, 0, 0, 1, 1,
0.04048524, 0.5829644, -0.3816948, 1, 0, 0, 1, 1,
0.04154008, -2.384164, 3.039352, 1, 0, 0, 1, 1,
0.04289245, -0.9653172, 2.441486, 0, 0, 0, 1, 1,
0.04292223, -0.3996471, 3.053538, 0, 0, 0, 1, 1,
0.04325345, -0.05856695, 3.900681, 0, 0, 0, 1, 1,
0.04367593, 0.4396957, 1.117443, 0, 0, 0, 1, 1,
0.04432287, 0.3420937, 1.084437, 0, 0, 0, 1, 1,
0.04564506, 1.309949, 0.4728098, 0, 0, 0, 1, 1,
0.04627478, 2.120178, -0.6792697, 0, 0, 0, 1, 1,
0.05007429, 0.8572384, -0.9754685, 1, 1, 1, 1, 1,
0.05072004, -1.303495, 3.350994, 1, 1, 1, 1, 1,
0.05157959, -0.4340643, 3.592322, 1, 1, 1, 1, 1,
0.05267246, -1.571049, 1.28576, 1, 1, 1, 1, 1,
0.0620845, 0.5420433, 0.1897469, 1, 1, 1, 1, 1,
0.06350578, 0.8646736, -0.6092323, 1, 1, 1, 1, 1,
0.07158329, 1.061432, -0.5591486, 1, 1, 1, 1, 1,
0.07161539, -0.7071683, 1.819155, 1, 1, 1, 1, 1,
0.07943885, -0.696322, 1.876684, 1, 1, 1, 1, 1,
0.08244965, 1.606304, -1.380214, 1, 1, 1, 1, 1,
0.0878627, -1.110934, 2.587359, 1, 1, 1, 1, 1,
0.09156733, 0.5826751, 1.353912, 1, 1, 1, 1, 1,
0.09532604, 0.4219247, 0.3418929, 1, 1, 1, 1, 1,
0.09616014, -0.5271198, 3.678477, 1, 1, 1, 1, 1,
0.09863017, -1.755742, 2.835348, 1, 1, 1, 1, 1,
0.09995718, 0.02971714, 0.6123794, 0, 0, 1, 1, 1,
0.1041195, -0.7339763, 2.835706, 1, 0, 0, 1, 1,
0.106965, 0.003957232, 1.082604, 1, 0, 0, 1, 1,
0.1120676, 1.269538, -1.042947, 1, 0, 0, 1, 1,
0.120727, 1.058903, -0.2350423, 1, 0, 0, 1, 1,
0.1211891, 0.2495466, 1.609651, 1, 0, 0, 1, 1,
0.123075, 0.0928943, 2.797872, 0, 0, 0, 1, 1,
0.1247073, -1.921146, 2.320109, 0, 0, 0, 1, 1,
0.1345228, 0.7296863, 0.04845961, 0, 0, 0, 1, 1,
0.1375029, -0.7254962, 1.601603, 0, 0, 0, 1, 1,
0.1389523, -0.5522371, 3.075711, 0, 0, 0, 1, 1,
0.1414169, 0.8542162, 0.6593503, 0, 0, 0, 1, 1,
0.1417198, 0.03207332, 1.764937, 0, 0, 0, 1, 1,
0.144059, 0.639989, 0.6201361, 1, 1, 1, 1, 1,
0.1466723, 1.079316, 0.472552, 1, 1, 1, 1, 1,
0.1479342, 0.3571779, -0.337949, 1, 1, 1, 1, 1,
0.1508661, -0.1462608, 2.883246, 1, 1, 1, 1, 1,
0.1549549, -0.7853568, 3.972257, 1, 1, 1, 1, 1,
0.1558438, -0.007632725, 2.752216, 1, 1, 1, 1, 1,
0.1577813, -1.310283, 3.220104, 1, 1, 1, 1, 1,
0.1582347, 0.08734303, 1.193701, 1, 1, 1, 1, 1,
0.1583463, 0.7791166, 1.672926, 1, 1, 1, 1, 1,
0.161329, -1.189989, 3.251267, 1, 1, 1, 1, 1,
0.1625448, -1.542987, 2.496423, 1, 1, 1, 1, 1,
0.1662074, -1.272514, 3.056355, 1, 1, 1, 1, 1,
0.1684675, -0.6823698, 3.826432, 1, 1, 1, 1, 1,
0.1687576, 0.8573952, 1.753556, 1, 1, 1, 1, 1,
0.1706598, 0.6821775, 0.4520953, 1, 1, 1, 1, 1,
0.1712762, 1.314514, 1.030158, 0, 0, 1, 1, 1,
0.1757172, -0.8044484, 1.686967, 1, 0, 0, 1, 1,
0.1761347, 0.335832, 0.9252552, 1, 0, 0, 1, 1,
0.1799181, 0.4202358, -0.216776, 1, 0, 0, 1, 1,
0.1802438, 0.7697394, -1.57336, 1, 0, 0, 1, 1,
0.1811141, -1.042764, 4.284612, 1, 0, 0, 1, 1,
0.1826291, -1.108993, 2.856294, 0, 0, 0, 1, 1,
0.1834768, -0.8413204, 2.459936, 0, 0, 0, 1, 1,
0.1835922, -1.195585, 3.471464, 0, 0, 0, 1, 1,
0.1958711, -0.8262181, 4.27087, 0, 0, 0, 1, 1,
0.2003961, 0.1288398, -0.06540022, 0, 0, 0, 1, 1,
0.2011941, 0.09021915, 0.5634721, 0, 0, 0, 1, 1,
0.2041171, 1.25131, 0.4386316, 0, 0, 0, 1, 1,
0.2069006, 0.2172485, 0.3398867, 1, 1, 1, 1, 1,
0.2082541, 0.7902654, 0.3262622, 1, 1, 1, 1, 1,
0.210602, 1.563111, -0.8225601, 1, 1, 1, 1, 1,
0.2109268, 0.6360912, 1.510398, 1, 1, 1, 1, 1,
0.2109536, 0.1247637, -0.4119794, 1, 1, 1, 1, 1,
0.2150496, -0.905414, 1.868084, 1, 1, 1, 1, 1,
0.2175309, 0.9335358, -0.1059417, 1, 1, 1, 1, 1,
0.2176719, 0.5807402, -1.276626, 1, 1, 1, 1, 1,
0.219047, 0.2875356, 1.062886, 1, 1, 1, 1, 1,
0.2220825, -0.8739226, 3.668226, 1, 1, 1, 1, 1,
0.2222503, 0.6474037, 0.5387422, 1, 1, 1, 1, 1,
0.2260418, -0.3434727, 2.059916, 1, 1, 1, 1, 1,
0.226496, -1.339103, 1.09462, 1, 1, 1, 1, 1,
0.2285185, 0.08547317, 0.6949039, 1, 1, 1, 1, 1,
0.2310077, 0.4347929, 1.601262, 1, 1, 1, 1, 1,
0.2326215, -1.346233, 4.86772, 0, 0, 1, 1, 1,
0.2330249, -0.3131652, 3.718124, 1, 0, 0, 1, 1,
0.2333665, -0.2951539, 2.775294, 1, 0, 0, 1, 1,
0.2338626, -1.603866, 4.111373, 1, 0, 0, 1, 1,
0.2411142, -0.2029318, 1.743206, 1, 0, 0, 1, 1,
0.2432867, -0.734293, 3.503341, 1, 0, 0, 1, 1,
0.2448833, 0.005139647, 2.480701, 0, 0, 0, 1, 1,
0.2449973, 0.8698651, 2.068068, 0, 0, 0, 1, 1,
0.2454569, -0.954576, 1.62062, 0, 0, 0, 1, 1,
0.2467004, -0.3375572, 1.563226, 0, 0, 0, 1, 1,
0.2492023, -0.7070583, 2.215083, 0, 0, 0, 1, 1,
0.2575181, -0.3966863, 2.750118, 0, 0, 0, 1, 1,
0.2624154, -0.2538846, 4.012824, 0, 0, 0, 1, 1,
0.2636734, -1.980693, 3.734772, 1, 1, 1, 1, 1,
0.2668827, -0.7664956, 3.675564, 1, 1, 1, 1, 1,
0.2672746, 0.1278987, 2.001178, 1, 1, 1, 1, 1,
0.2741702, -0.2677308, 2.492001, 1, 1, 1, 1, 1,
0.2778083, -0.6039256, 1.928026, 1, 1, 1, 1, 1,
0.2843245, -0.612088, 2.482188, 1, 1, 1, 1, 1,
0.2853983, -0.248628, 0.4946499, 1, 1, 1, 1, 1,
0.2885957, -1.203126, 2.839598, 1, 1, 1, 1, 1,
0.2887422, -1.881013, 2.351753, 1, 1, 1, 1, 1,
0.2892051, 1.89728, -1.195675, 1, 1, 1, 1, 1,
0.2922493, 0.04722336, 1.737828, 1, 1, 1, 1, 1,
0.2963243, -0.6054616, 2.150136, 1, 1, 1, 1, 1,
0.2963584, -0.1611727, 1.635653, 1, 1, 1, 1, 1,
0.2982134, -0.8857875, 3.632968, 1, 1, 1, 1, 1,
0.2986737, 0.5969619, 1.218785, 1, 1, 1, 1, 1,
0.2987256, -0.04768289, 0.2753504, 0, 0, 1, 1, 1,
0.299515, -0.2856465, 3.359845, 1, 0, 0, 1, 1,
0.2997208, 0.2482909, 0.9407336, 1, 0, 0, 1, 1,
0.3001261, 0.2243047, 0.1353293, 1, 0, 0, 1, 1,
0.3023358, 0.5378349, 0.5016927, 1, 0, 0, 1, 1,
0.3063949, 0.2329081, 0.7948782, 1, 0, 0, 1, 1,
0.3089617, 1.18519, -0.1889309, 0, 0, 0, 1, 1,
0.3089888, 1.976278, 0.724677, 0, 0, 0, 1, 1,
0.310269, -0.02973194, 2.234727, 0, 0, 0, 1, 1,
0.3137408, 0.159123, 1.637187, 0, 0, 0, 1, 1,
0.3206722, 1.096401, -0.4184704, 0, 0, 0, 1, 1,
0.3210089, -1.240865, 2.415886, 0, 0, 0, 1, 1,
0.32396, 0.2141653, 1.063172, 0, 0, 0, 1, 1,
0.3263045, -0.9035072, 2.680625, 1, 1, 1, 1, 1,
0.3276248, 0.9393403, 0.8449961, 1, 1, 1, 1, 1,
0.3364854, -1.866701, 2.161424, 1, 1, 1, 1, 1,
0.3403662, 0.1944237, 2.032511, 1, 1, 1, 1, 1,
0.3448691, 1.498871, -0.3054512, 1, 1, 1, 1, 1,
0.3469398, 0.6641467, 1.720934, 1, 1, 1, 1, 1,
0.3478856, -0.03733638, 2.683332, 1, 1, 1, 1, 1,
0.350547, -0.531103, 3.858261, 1, 1, 1, 1, 1,
0.3539373, 0.8633237, 0.7528476, 1, 1, 1, 1, 1,
0.3600431, 0.5703138, 1.099145, 1, 1, 1, 1, 1,
0.3605308, -0.3507096, 3.112717, 1, 1, 1, 1, 1,
0.3629144, 0.452461, 0.8569238, 1, 1, 1, 1, 1,
0.3665491, 0.7174876, 0.2926606, 1, 1, 1, 1, 1,
0.370947, -0.9032241, 4.508377, 1, 1, 1, 1, 1,
0.372668, -0.648558, 5.103212, 1, 1, 1, 1, 1,
0.3767663, 0.633935, 1.485457, 0, 0, 1, 1, 1,
0.3770834, -0.227264, 3.634958, 1, 0, 0, 1, 1,
0.3787972, -1.489588, 2.291791, 1, 0, 0, 1, 1,
0.3888305, -0.7819068, 2.449236, 1, 0, 0, 1, 1,
0.3926289, -0.2391207, 2.571725, 1, 0, 0, 1, 1,
0.3940623, -0.2353726, 2.760391, 1, 0, 0, 1, 1,
0.3954956, -1.183732, 1.285501, 0, 0, 0, 1, 1,
0.3986146, 0.2502888, 1.249378, 0, 0, 0, 1, 1,
0.4088304, -0.08236047, 0.9960924, 0, 0, 0, 1, 1,
0.4136073, 0.4556503, 0.001991685, 0, 0, 0, 1, 1,
0.4147379, 0.5914887, 1.305452, 0, 0, 0, 1, 1,
0.4168479, 1.625486, -0.2337413, 0, 0, 0, 1, 1,
0.4212111, -0.1160212, 1.804854, 0, 0, 0, 1, 1,
0.427777, 1.782082, -0.3206389, 1, 1, 1, 1, 1,
0.4305775, 1.23967, 0.01581244, 1, 1, 1, 1, 1,
0.431705, 0.2139715, 1.470944, 1, 1, 1, 1, 1,
0.4321785, 0.9464949, 0.5143465, 1, 1, 1, 1, 1,
0.4365683, 1.020697, -0.796295, 1, 1, 1, 1, 1,
0.4393029, -0.5478626, 3.462634, 1, 1, 1, 1, 1,
0.4420208, 1.138765, -0.5713961, 1, 1, 1, 1, 1,
0.4424903, -0.316638, 3.692711, 1, 1, 1, 1, 1,
0.4430696, 0.6167138, 1.034849, 1, 1, 1, 1, 1,
0.444225, 0.09169319, 1.31815, 1, 1, 1, 1, 1,
0.4501481, 0.4937235, 0.592462, 1, 1, 1, 1, 1,
0.4538624, 2.219364, -0.8199325, 1, 1, 1, 1, 1,
0.4546041, 0.8725069, -1.303621, 1, 1, 1, 1, 1,
0.4604454, -0.08218952, 2.188121, 1, 1, 1, 1, 1,
0.4641176, 0.1327873, 1.008661, 1, 1, 1, 1, 1,
0.4666135, -0.123409, 3.744263, 0, 0, 1, 1, 1,
0.4806225, 0.5894145, 0.1109927, 1, 0, 0, 1, 1,
0.480967, -0.6357656, 0.7677791, 1, 0, 0, 1, 1,
0.487365, 0.6698776, 1.29098, 1, 0, 0, 1, 1,
0.4883601, 1.613027, 0.5911803, 1, 0, 0, 1, 1,
0.4910775, 0.6937806, 0.5264432, 1, 0, 0, 1, 1,
0.4922922, -0.08530416, 1.56496, 0, 0, 0, 1, 1,
0.4940438, -0.3314127, 2.713062, 0, 0, 0, 1, 1,
0.4969195, -0.1286296, 2.36845, 0, 0, 0, 1, 1,
0.4973973, -0.04363618, 0.8010916, 0, 0, 0, 1, 1,
0.497401, 0.7537748, 0.2638115, 0, 0, 0, 1, 1,
0.5022194, 1.122885, -0.7897853, 0, 0, 0, 1, 1,
0.5030832, 0.2911504, 0.7698859, 0, 0, 0, 1, 1,
0.5062095, 0.134229, 0.9270566, 1, 1, 1, 1, 1,
0.5078939, -1.116707, 2.663759, 1, 1, 1, 1, 1,
0.5089773, 2.003207, -2.42682, 1, 1, 1, 1, 1,
0.5117002, 0.7275964, 0.7255344, 1, 1, 1, 1, 1,
0.5144576, 1.980859, 0.03174738, 1, 1, 1, 1, 1,
0.5205391, 0.6733184, 1.876537, 1, 1, 1, 1, 1,
0.5241714, -1.734275, 3.4109, 1, 1, 1, 1, 1,
0.5246332, 1.033704, 0.3873579, 1, 1, 1, 1, 1,
0.529189, 0.065311, 0.3134769, 1, 1, 1, 1, 1,
0.5293699, -0.600455, 1.912663, 1, 1, 1, 1, 1,
0.5357234, 0.8592204, -1.592488, 1, 1, 1, 1, 1,
0.5364325, 1.930651, 0.6928962, 1, 1, 1, 1, 1,
0.540571, -0.4742344, 3.247994, 1, 1, 1, 1, 1,
0.5414635, -1.199649, 3.416836, 1, 1, 1, 1, 1,
0.5429898, 0.5317785, 1.392859, 1, 1, 1, 1, 1,
0.5483559, -0.1694815, 0.5873523, 0, 0, 1, 1, 1,
0.5567265, -0.8841548, 2.470337, 1, 0, 0, 1, 1,
0.5602667, 0.08743573, 0.4849187, 1, 0, 0, 1, 1,
0.5620943, 1.575115, 1.352059, 1, 0, 0, 1, 1,
0.5674587, -1.09851, 1.829786, 1, 0, 0, 1, 1,
0.5688763, 2.149083, 0.1908218, 1, 0, 0, 1, 1,
0.5691196, -1.071584, 1.231997, 0, 0, 0, 1, 1,
0.5745857, -1.836016, 2.064146, 0, 0, 0, 1, 1,
0.5784059, -0.3340199, 1.359536, 0, 0, 0, 1, 1,
0.5793656, 0.7533038, 2.74751, 0, 0, 0, 1, 1,
0.580063, -0.8184673, 1.810581, 0, 0, 0, 1, 1,
0.5852667, -1.125107, 2.346103, 0, 0, 0, 1, 1,
0.5884324, -0.4502528, 1.648769, 0, 0, 0, 1, 1,
0.5902582, -0.7521971, 3.347842, 1, 1, 1, 1, 1,
0.5981347, -0.7658316, 1.452043, 1, 1, 1, 1, 1,
0.5989689, -1.780902, 2.190164, 1, 1, 1, 1, 1,
0.601406, -0.5227629, 2.189348, 1, 1, 1, 1, 1,
0.6015514, 0.05196591, 1.330398, 1, 1, 1, 1, 1,
0.6080192, 0.6031677, -0.09697796, 1, 1, 1, 1, 1,
0.6085691, 1.038274, -0.2354658, 1, 1, 1, 1, 1,
0.6134286, -0.7272384, 2.513398, 1, 1, 1, 1, 1,
0.6172187, 1.022116, -0.3977287, 1, 1, 1, 1, 1,
0.6191152, 0.8083624, 0.3496591, 1, 1, 1, 1, 1,
0.6250834, 1.388566, 2.681335, 1, 1, 1, 1, 1,
0.6275246, 0.1691179, 0.059593, 1, 1, 1, 1, 1,
0.6312773, 0.3389573, 2.002845, 1, 1, 1, 1, 1,
0.6349385, -0.9636592, 2.121543, 1, 1, 1, 1, 1,
0.6452208, -1.674084, 2.105849, 1, 1, 1, 1, 1,
0.6468555, -0.8560614, 1.327692, 0, 0, 1, 1, 1,
0.6480762, -2.136784, 2.695943, 1, 0, 0, 1, 1,
0.6484622, -1.56519, 3.450154, 1, 0, 0, 1, 1,
0.6492956, -1.704208, 0.7068452, 1, 0, 0, 1, 1,
0.6526614, 0.8566152, -0.2742689, 1, 0, 0, 1, 1,
0.6558331, 1.088564, 0.04354865, 1, 0, 0, 1, 1,
0.6579953, -1.261417, 3.224738, 0, 0, 0, 1, 1,
0.6581343, -1.657614, 1.787068, 0, 0, 0, 1, 1,
0.6594228, 0.9572664, 1.187198, 0, 0, 0, 1, 1,
0.6618602, -1.194235, 3.642062, 0, 0, 0, 1, 1,
0.6620079, 1.146738, -0.5433491, 0, 0, 0, 1, 1,
0.6634716, -1.901798, 2.427418, 0, 0, 0, 1, 1,
0.666428, -1.678214, 1.563748, 0, 0, 0, 1, 1,
0.6762703, 0.4331428, 2.890984, 1, 1, 1, 1, 1,
0.6789662, -0.7001578, 0.592523, 1, 1, 1, 1, 1,
0.6826059, -1.011254, 2.433354, 1, 1, 1, 1, 1,
0.6837612, -2.852474, 4.15101, 1, 1, 1, 1, 1,
0.6863639, -0.9561903, 2.516638, 1, 1, 1, 1, 1,
0.6871048, -1.397373, 0.7534537, 1, 1, 1, 1, 1,
0.6927675, -0.804737, 3.851526, 1, 1, 1, 1, 1,
0.6961105, -0.06162273, 2.486259, 1, 1, 1, 1, 1,
0.69652, -1.161745, 3.394274, 1, 1, 1, 1, 1,
0.6991329, -1.114587, 0.7672052, 1, 1, 1, 1, 1,
0.7006212, 0.3190909, 1.363426, 1, 1, 1, 1, 1,
0.7071732, -0.4233685, 0.8344529, 1, 1, 1, 1, 1,
0.7154952, -0.2975275, 2.806017, 1, 1, 1, 1, 1,
0.7168298, -0.2991752, -1.186887, 1, 1, 1, 1, 1,
0.7186365, 0.4197477, 1.424005, 1, 1, 1, 1, 1,
0.7203988, -1.990698, 2.396775, 0, 0, 1, 1, 1,
0.7275333, 0.9568913, -1.083628, 1, 0, 0, 1, 1,
0.7305189, 0.6913262, 0.457086, 1, 0, 0, 1, 1,
0.7350442, 0.9054623, -0.8365493, 1, 0, 0, 1, 1,
0.7389317, -0.3517672, 1.936925, 1, 0, 0, 1, 1,
0.742533, -3.508011, 0.9683203, 1, 0, 0, 1, 1,
0.7464719, -0.4467719, 3.599675, 0, 0, 0, 1, 1,
0.7469388, 0.4540228, 0.8481156, 0, 0, 0, 1, 1,
0.7500318, 0.299804, 0.3109734, 0, 0, 0, 1, 1,
0.7505151, 0.6503932, -0.982168, 0, 0, 0, 1, 1,
0.7521817, -0.8435553, 3.900603, 0, 0, 0, 1, 1,
0.7554622, -1.413074, 3.549199, 0, 0, 0, 1, 1,
0.7619233, -0.9523092, 3.461027, 0, 0, 0, 1, 1,
0.762776, -0.6051272, 2.147727, 1, 1, 1, 1, 1,
0.7627982, 0.4716828, -0.11914, 1, 1, 1, 1, 1,
0.7661827, -0.6899468, 2.693875, 1, 1, 1, 1, 1,
0.7739841, -0.3267149, 2.676369, 1, 1, 1, 1, 1,
0.7747372, 0.907819, 0.6680222, 1, 1, 1, 1, 1,
0.77614, 1.007643, -0.8091862, 1, 1, 1, 1, 1,
0.778928, -0.466228, 2.253908, 1, 1, 1, 1, 1,
0.7808838, 1.331548, 0.09939524, 1, 1, 1, 1, 1,
0.7813722, 0.9871134, 0.9636304, 1, 1, 1, 1, 1,
0.7833141, 2.400308, 0.8121822, 1, 1, 1, 1, 1,
0.7846127, -0.01194187, 1.099543, 1, 1, 1, 1, 1,
0.7873006, 1.089557, 1.344542, 1, 1, 1, 1, 1,
0.7875124, -0.2626239, 1.785159, 1, 1, 1, 1, 1,
0.7899659, -0.5755595, 2.780994, 1, 1, 1, 1, 1,
0.7943849, 1.543354, 1.261989, 1, 1, 1, 1, 1,
0.8029175, -1.014529, 2.254293, 0, 0, 1, 1, 1,
0.8032293, -0.6204836, 1.145794, 1, 0, 0, 1, 1,
0.8039975, -0.5976268, 1.620737, 1, 0, 0, 1, 1,
0.8088976, 0.6239632, -0.239753, 1, 0, 0, 1, 1,
0.8127278, 0.3605096, 1.375866, 1, 0, 0, 1, 1,
0.8131268, 0.5250207, -0.2412117, 1, 0, 0, 1, 1,
0.8191946, 0.9910926, -0.09379172, 0, 0, 0, 1, 1,
0.8217667, 0.1032103, 1.511129, 0, 0, 0, 1, 1,
0.8243524, -1.343991, 3.788238, 0, 0, 0, 1, 1,
0.8249477, 1.223084, 1.221012, 0, 0, 0, 1, 1,
0.8280631, -1.791384, 1.428761, 0, 0, 0, 1, 1,
0.8290303, 0.02043388, 1.029908, 0, 0, 0, 1, 1,
0.8342687, 0.7157643, 1.039822, 0, 0, 0, 1, 1,
0.842388, -1.174455, 4.048495, 1, 1, 1, 1, 1,
0.8491058, 0.08776175, 2.062918, 1, 1, 1, 1, 1,
0.8521103, 0.2323032, 1.974727, 1, 1, 1, 1, 1,
0.8542249, 0.2016214, 0.09597088, 1, 1, 1, 1, 1,
0.8543383, -1.54746, 3.096555, 1, 1, 1, 1, 1,
0.854543, 0.2966081, 0.8126252, 1, 1, 1, 1, 1,
0.8561481, 0.04510881, 1.949311, 1, 1, 1, 1, 1,
0.8566004, -0.4005665, 1.000216, 1, 1, 1, 1, 1,
0.8573682, -0.8330378, 3.525032, 1, 1, 1, 1, 1,
0.8635468, 0.2142795, 0.7806863, 1, 1, 1, 1, 1,
0.8643784, 0.7438737, 1.125956, 1, 1, 1, 1, 1,
0.8643804, -0.1848732, 3.126314, 1, 1, 1, 1, 1,
0.8685132, -0.7556331, 3.237499, 1, 1, 1, 1, 1,
0.8694193, -0.5891551, 2.064094, 1, 1, 1, 1, 1,
0.8802266, 0.06919989, 1.260197, 1, 1, 1, 1, 1,
0.8829548, -0.7467169, 3.147403, 0, 0, 1, 1, 1,
0.8836602, -0.6131933, 3.047169, 1, 0, 0, 1, 1,
0.885321, 1.292729, 3.002961, 1, 0, 0, 1, 1,
0.8976263, -0.4604781, 2.981807, 1, 0, 0, 1, 1,
0.8992917, -0.03883452, 1.9681, 1, 0, 0, 1, 1,
0.9054377, -0.6061677, 0.8574836, 1, 0, 0, 1, 1,
0.905619, -0.3803541, 1.462057, 0, 0, 0, 1, 1,
0.9186871, -1.013572, 2.627344, 0, 0, 0, 1, 1,
0.9225178, -0.329616, 3.20701, 0, 0, 0, 1, 1,
0.9238912, -2.35923, 2.452076, 0, 0, 0, 1, 1,
0.9371402, 1.322514, 1.521332, 0, 0, 0, 1, 1,
0.9427391, -1.01185, 2.125995, 0, 0, 0, 1, 1,
0.9466993, 0.5567295, 1.880053, 0, 0, 0, 1, 1,
0.9511452, -0.344802, 3.45955, 1, 1, 1, 1, 1,
0.9524894, -1.674775, 3.04921, 1, 1, 1, 1, 1,
0.9539365, -0.8747753, 1.560204, 1, 1, 1, 1, 1,
0.9571363, -1.679171, 4.371477, 1, 1, 1, 1, 1,
0.9577094, -0.6252601, 2.780868, 1, 1, 1, 1, 1,
0.9587647, 0.6885399, 0.5531541, 1, 1, 1, 1, 1,
0.9641451, -1.943635, 3.405502, 1, 1, 1, 1, 1,
0.9656543, -0.1538439, 2.344315, 1, 1, 1, 1, 1,
0.966707, 1.544652, -1.156866, 1, 1, 1, 1, 1,
0.9697109, 0.6552113, 1.716299, 1, 1, 1, 1, 1,
0.9718382, 0.719638, 0.08163892, 1, 1, 1, 1, 1,
0.9726765, -1.217968, 2.395309, 1, 1, 1, 1, 1,
0.9766512, 0.6326426, -1.801791, 1, 1, 1, 1, 1,
0.9805965, 1.171894, 0.1527101, 1, 1, 1, 1, 1,
0.9815129, -0.1125444, 2.564428, 1, 1, 1, 1, 1,
0.9857094, -1.258535, 2.81111, 0, 0, 1, 1, 1,
0.9858084, 0.4932241, 1.071129, 1, 0, 0, 1, 1,
0.9903092, 2.270864, 0.1735954, 1, 0, 0, 1, 1,
0.991278, 0.002920942, 2.17872, 1, 0, 0, 1, 1,
0.9941061, -0.5894815, 2.22606, 1, 0, 0, 1, 1,
0.9942394, 0.1149066, -0.1739301, 1, 0, 0, 1, 1,
0.9948425, -1.087599, 1.50405, 0, 0, 0, 1, 1,
1.004648, 1.521791, 1.20321, 0, 0, 0, 1, 1,
1.005546, -0.4002908, 0.9671242, 0, 0, 0, 1, 1,
1.007491, 0.3182645, 3.028931, 0, 0, 0, 1, 1,
1.007686, 0.2513971, -1.305641, 0, 0, 0, 1, 1,
1.019731, -1.080677, 1.923698, 0, 0, 0, 1, 1,
1.025833, -1.723263, 2.264097, 0, 0, 0, 1, 1,
1.028463, 0.1742415, 2.348145, 1, 1, 1, 1, 1,
1.032, 0.03310118, 0.9773873, 1, 1, 1, 1, 1,
1.03394, 1.008319, -0.09418792, 1, 1, 1, 1, 1,
1.041016, -0.003922277, 1.097074, 1, 1, 1, 1, 1,
1.044799, -1.454574, 3.480963, 1, 1, 1, 1, 1,
1.049797, -0.7569311, 2.177068, 1, 1, 1, 1, 1,
1.050017, -0.04650953, 3.548278, 1, 1, 1, 1, 1,
1.053028, 0.5254731, -0.1269414, 1, 1, 1, 1, 1,
1.055488, 0.2183825, 1.087909, 1, 1, 1, 1, 1,
1.056028, 0.7350177, 0.6412593, 1, 1, 1, 1, 1,
1.060431, 0.3564455, 0.299961, 1, 1, 1, 1, 1,
1.069519, 1.057703, 0.710596, 1, 1, 1, 1, 1,
1.071136, 1.318471, 1.714689, 1, 1, 1, 1, 1,
1.073119, 1.188913, 0.3052993, 1, 1, 1, 1, 1,
1.077425, 0.5525593, 0.7429498, 1, 1, 1, 1, 1,
1.080339, 0.2256183, 2.341787, 0, 0, 1, 1, 1,
1.108215, 0.2078517, 1.477433, 1, 0, 0, 1, 1,
1.108997, 0.5665472, 1.307051, 1, 0, 0, 1, 1,
1.118973, 0.1281762, 1.968521, 1, 0, 0, 1, 1,
1.120737, 0.7651784, 1.656895, 1, 0, 0, 1, 1,
1.122347, 0.3548324, 0.04265285, 1, 0, 0, 1, 1,
1.122903, 0.8883588, 2.825799, 0, 0, 0, 1, 1,
1.123901, -0.3572662, 0.6431441, 0, 0, 0, 1, 1,
1.124853, 1.793075, 1.541919, 0, 0, 0, 1, 1,
1.130068, 1.542979, 0.9766306, 0, 0, 0, 1, 1,
1.139758, 0.9598507, 0.0592476, 0, 0, 0, 1, 1,
1.14235, 0.5936993, 1.459187, 0, 0, 0, 1, 1,
1.160613, 0.3518276, 0.9542289, 0, 0, 0, 1, 1,
1.163934, -0.7096102, 2.645622, 1, 1, 1, 1, 1,
1.169568, 0.2140847, 2.247716, 1, 1, 1, 1, 1,
1.171912, -0.9982889, 1.618008, 1, 1, 1, 1, 1,
1.178625, 0.446031, 0.3231161, 1, 1, 1, 1, 1,
1.180887, 0.2247799, 0.7793472, 1, 1, 1, 1, 1,
1.182586, -0.8836425, 2.406803, 1, 1, 1, 1, 1,
1.198292, 0.3190246, 1.066437, 1, 1, 1, 1, 1,
1.198694, 0.2964518, 2.789969, 1, 1, 1, 1, 1,
1.206741, 2.498603, 0.1785691, 1, 1, 1, 1, 1,
1.216685, 0.1470867, 1.864578, 1, 1, 1, 1, 1,
1.222828, 0.7963483, 0.09840913, 1, 1, 1, 1, 1,
1.224409, -0.5398374, 2.289096, 1, 1, 1, 1, 1,
1.228359, -0.9912037, 3.583568, 1, 1, 1, 1, 1,
1.237012, -1.210448, 2.651116, 1, 1, 1, 1, 1,
1.244506, -0.8732076, 1.754298, 1, 1, 1, 1, 1,
1.248917, 0.1648525, 0.9252424, 0, 0, 1, 1, 1,
1.257215, -0.0800166, 1.78602, 1, 0, 0, 1, 1,
1.28084, 0.6431545, 0.1277615, 1, 0, 0, 1, 1,
1.280995, -0.1955233, 1.284216, 1, 0, 0, 1, 1,
1.286796, -0.9663754, 1.345363, 1, 0, 0, 1, 1,
1.286844, -0.7632118, 3.541379, 1, 0, 0, 1, 1,
1.28692, -1.042959, -0.3878242, 0, 0, 0, 1, 1,
1.290361, -1.407497, 1.400139, 0, 0, 0, 1, 1,
1.29896, -0.08168153, 1.967237, 0, 0, 0, 1, 1,
1.300996, 0.2428059, 2.140161, 0, 0, 0, 1, 1,
1.304936, -0.7399627, 2.566693, 0, 0, 0, 1, 1,
1.309306, -1.883574, 1.522269, 0, 0, 0, 1, 1,
1.316072, 0.04955335, 2.120272, 0, 0, 0, 1, 1,
1.317983, -1.156886, 2.78087, 1, 1, 1, 1, 1,
1.321929, 1.48417, 1.924788, 1, 1, 1, 1, 1,
1.323397, 1.809667, -1.03934, 1, 1, 1, 1, 1,
1.340624, 1.584587, 0.7930297, 1, 1, 1, 1, 1,
1.349905, -1.445021, 2.975652, 1, 1, 1, 1, 1,
1.353287, 0.317739, 1.915484, 1, 1, 1, 1, 1,
1.359291, -1.189933, 1.365344, 1, 1, 1, 1, 1,
1.364006, 0.2039553, 1.992028, 1, 1, 1, 1, 1,
1.384937, -0.204499, 1.484156, 1, 1, 1, 1, 1,
1.391281, 2.044844, 0.8049799, 1, 1, 1, 1, 1,
1.399905, 0.565372, 1.910821, 1, 1, 1, 1, 1,
1.406679, 1.688976, -0.4509457, 1, 1, 1, 1, 1,
1.417547, -0.04804026, 1.239862, 1, 1, 1, 1, 1,
1.42628, 0.1640402, 2.725448, 1, 1, 1, 1, 1,
1.435797, 1.111037, -1.061656, 1, 1, 1, 1, 1,
1.43887, -0.2128125, 0.4695607, 0, 0, 1, 1, 1,
1.444658, -0.3606421, 1.745401, 1, 0, 0, 1, 1,
1.449929, 0.5190067, 0.4234707, 1, 0, 0, 1, 1,
1.450591, -0.150526, 3.161098, 1, 0, 0, 1, 1,
1.454739, 0.6416628, 1.096315, 1, 0, 0, 1, 1,
1.491504, -0.08859259, 2.861503, 1, 0, 0, 1, 1,
1.499195, -0.5945324, 2.911359, 0, 0, 0, 1, 1,
1.511983, 0.4632582, 1.850055, 0, 0, 0, 1, 1,
1.512838, 0.2053511, 2.228438, 0, 0, 0, 1, 1,
1.537069, 0.6694981, 3.122764, 0, 0, 0, 1, 1,
1.537741, -0.003192561, -0.0416015, 0, 0, 0, 1, 1,
1.539124, 1.901818, -0.263266, 0, 0, 0, 1, 1,
1.545684, -0.2120422, 0.308635, 0, 0, 0, 1, 1,
1.551883, -0.7626922, 2.255994, 1, 1, 1, 1, 1,
1.554458, -2.356381, 2.750455, 1, 1, 1, 1, 1,
1.575909, -1.243442, 4.286732, 1, 1, 1, 1, 1,
1.579519, 0.1346755, 0.1793591, 1, 1, 1, 1, 1,
1.592047, -0.3962469, 2.492109, 1, 1, 1, 1, 1,
1.592206, 0.0760685, 2.590215, 1, 1, 1, 1, 1,
1.593367, 1.760024, 0.4429495, 1, 1, 1, 1, 1,
1.595774, 0.1883506, 0.6585932, 1, 1, 1, 1, 1,
1.617631, 1.530913, 1.335801, 1, 1, 1, 1, 1,
1.628543, -0.2108892, 3.968989, 1, 1, 1, 1, 1,
1.633987, -0.8448055, 2.930307, 1, 1, 1, 1, 1,
1.634855, -1.271018, 3.965681, 1, 1, 1, 1, 1,
1.639792, -1.499505, 0.7072291, 1, 1, 1, 1, 1,
1.643371, -1.647769, 3.156517, 1, 1, 1, 1, 1,
1.645236, 2.035501, 0.4704688, 1, 1, 1, 1, 1,
1.655184, 0.9883585, 1.154345, 0, 0, 1, 1, 1,
1.671074, 0.1400544, 1.946013, 1, 0, 0, 1, 1,
1.674081, -0.4226585, 1.995386, 1, 0, 0, 1, 1,
1.67414, -1.812168, 2.556777, 1, 0, 0, 1, 1,
1.685998, 1.100786, 2.165277, 1, 0, 0, 1, 1,
1.715732, -0.8383324, 1.697302, 1, 0, 0, 1, 1,
1.727775, 0.4608434, 0.8885823, 0, 0, 0, 1, 1,
1.727949, -2.037144, 3.243051, 0, 0, 0, 1, 1,
1.753578, 0.4467164, 0.618843, 0, 0, 0, 1, 1,
1.759089, 1.776997, 1.413514, 0, 0, 0, 1, 1,
1.775883, 0.2031151, 2.133427, 0, 0, 0, 1, 1,
1.778408, 0.5173451, 1.388661, 0, 0, 0, 1, 1,
1.786534, -0.3822576, 0.3138261, 0, 0, 0, 1, 1,
1.793912, -0.4610928, 0.07854168, 1, 1, 1, 1, 1,
1.806187, -1.243824, 2.343196, 1, 1, 1, 1, 1,
1.838315, -0.5167076, 2.465906, 1, 1, 1, 1, 1,
1.854408, -1.269622, 1.849976, 1, 1, 1, 1, 1,
1.867027, 1.127355, 0.2832041, 1, 1, 1, 1, 1,
1.872413, 0.6456065, 2.784, 1, 1, 1, 1, 1,
1.875609, 1.402713, -0.2179855, 1, 1, 1, 1, 1,
1.891865, -1.803544, 3.478038, 1, 1, 1, 1, 1,
1.897693, -0.8135794, 1.52176, 1, 1, 1, 1, 1,
1.954091, 1.290611, -0.322493, 1, 1, 1, 1, 1,
1.964627, -1.026867, 0.8943983, 1, 1, 1, 1, 1,
2.039494, 0.04064773, 0.2140761, 1, 1, 1, 1, 1,
2.054395, -0.1431617, 1.47594, 1, 1, 1, 1, 1,
2.064831, 0.0138608, 4.483893, 1, 1, 1, 1, 1,
2.07609, -0.1695155, -1.80338, 1, 1, 1, 1, 1,
2.113513, -0.2574547, 2.015532, 0, 0, 1, 1, 1,
2.115376, -1.33259, 2.927254, 1, 0, 0, 1, 1,
2.11937, 2.29156, 1.072612, 1, 0, 0, 1, 1,
2.13964, 0.3005773, 0.1351421, 1, 0, 0, 1, 1,
2.180499, 1.556923, -0.206393, 1, 0, 0, 1, 1,
2.206314, -0.4404204, 2.508771, 1, 0, 0, 1, 1,
2.20927, -1.10693, 0.3337566, 0, 0, 0, 1, 1,
2.275546, -1.82027, 1.487197, 0, 0, 0, 1, 1,
2.283083, -0.8662101, 2.728694, 0, 0, 0, 1, 1,
2.28896, -2.066551, 4.072601, 0, 0, 0, 1, 1,
2.29199, 0.5530497, 1.904983, 0, 0, 0, 1, 1,
2.335477, -1.840015, 1.648437, 0, 0, 0, 1, 1,
2.339357, 0.5295743, 2.244294, 0, 0, 0, 1, 1,
2.349943, 0.3273741, 2.230901, 1, 1, 1, 1, 1,
2.416345, 0.295104, 1.602904, 1, 1, 1, 1, 1,
2.476272, -0.8473427, 1.540937, 1, 1, 1, 1, 1,
2.480895, 0.8022062, 0.7018725, 1, 1, 1, 1, 1,
2.483341, 0.06614075, 2.441604, 1, 1, 1, 1, 1,
2.577924, 0.4674327, 0.5858408, 1, 1, 1, 1, 1,
2.67465, -0.5292053, 0.1657305, 1, 1, 1, 1, 1
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
var radius = 9.266199;
var distance = 32.54713;
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
mvMatrix.translate( 0.3120716, 0.4535711, 0.1119516 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.54713);
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
